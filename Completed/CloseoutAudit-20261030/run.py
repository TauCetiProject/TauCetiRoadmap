"""Replay the frozen scope catalog on an independently verified actual-main revision."""

import argparse
import hashlib
import json
import os
from pathlib import Path
import re
import subprocess
import time

from dependency_pin_audit import audit_dependency_pins


parser = argparse.ArgumentParser()
parser.add_argument("--source-dir", required=True, type=Path)
parser.add_argument("--verified-main", required=True)
args = parser.parse_args()
source = args.source_dir.resolve()
out = Path(__file__).resolve().parent
manifest_bytes = (out / "manifest.json").read_bytes()
prepared = json.loads(manifest_bytes)
expected_inputs = set(prepared["module_lists"] + prepared["probes"])
assert len(expected_inputs) == len(prepared["module_lists"]) + len(prepared["probes"])
assert expected_inputs == set(prepared["input_hashes"]), "Prepared input inventory differs."
assert {Path(name).name for name in prepared["probes"]} == set(prepared["expected_axiom_reports"])
assert len({Path(name).name for name in prepared["probes"]}) == len(prepared["probes"])


def verify_prepared_inputs():
    assert (out / "manifest.json").read_bytes() == manifest_bytes, "Prepared manifest changed."
    for name, expected in prepared["input_hashes"].items():
        assert hashlib.sha256(Path(name).read_bytes()).hexdigest() == expected, name


verify_prepared_inputs()


def git(*arguments):
    return subprocess.check_output(["git", "-C", str(source), *arguments], text=True).strip()


head = git("rev-parse", "HEAD")
assert re.fullmatch(r"[0-9a-f]{40}", args.verified_main)
assert head == args.verified_main, (head, args.verified_main)
assert not git("status", "--porcelain"), "Use a clean checkout of actual merged source."
subprocess.run(
    ["git", "-C", str(source), "merge-base", "--is-ancestor", head, "origin/main"],
    check=True,
)
dependency_pins = audit_dependency_pins(source)
source_manifest_bytes = (source / "lake-manifest.json").read_bytes()
source_toolchain_bytes = (source / "lean-toolchain").read_bytes()

inputs = out / "frozen-inputs"
inputs.mkdir(exist_ok=True)
probes = []
hashes = {}
modules = set()
for name in prepared["module_lists"]:
    catalog = Path(name)
    data = catalog.read_bytes()
    hashes[str(catalog)] = hashlib.sha256(data).hexdigest()
    modules.update(line.strip() for line in data.decode().splitlines()
                   if line.strip() and not line.lstrip().startswith("#"))
for name in prepared["probes"]:
    original = Path(name)
    data = original.read_bytes()
    frozen = inputs / original.name
    if frozen.exists() and frozen.read_bytes() != data:
        raise SystemExit(f"Input already frozen with different contents: {frozen}")
    frozen.write_bytes(data)
    hashes[str(original)] = hashlib.sha256(data).hexdigest()
    probes.append(frozen)
    modules.update(re.findall(r"^(?:public )?import ([A-Za-z0-9_.]+)", data.decode(), re.M))

assert len(modules) == prepared["modules"], "Prepared module scope changed."
assert hashes == prepared["input_hashes"], "Executed inputs differ from prepared snapshots."


def verify_frozen_inputs():
    verify_prepared_inputs()
    for original, frozen in zip(prepared["probes"], probes):
        assert hashlib.sha256(frozen.read_bytes()).hexdigest() == hashes[original], frozen


verify_frozen_inputs()

missing = [m for m in modules if m.startswith("TauCeti.") and not
           (source / (m.replace(".", "/") + ".lean")).is_file()]
assert not missing, missing
# The Hopf catalog deliberately covers the entire Riemannian subtree. A later
# main addition must be included explicitly before this final replay can pass.
riemannian_modules = {
    path[:-5].replace("/", ".")
    for path in git("ls-tree", "-r", "--name-only", head,
                    "TauCeti/Geometry/Manifold/Riemannian").splitlines()
    if path.endswith(".lean")
}
assert riemannian_modules <= modules, sorted(riemannian_modules - modules)
module_file = out / "executed-modules.txt"
module_file.write_text("\n".join(sorted(modules)) + "\n")
env = dict(os.environ, LAKE_ARTIFACT_CACHE="true", LAKE_RESTORE_ARTIFACTS="true")
receipt = {
    "status": "running",
    "source_head": head,
    "verified_as_actual_main": True,
    "source_manifest_sha256": hashlib.sha256(source_manifest_bytes).hexdigest(),
    "lean_toolchain": (source / "lean-toolchain").read_text().strip(),
    "dependency_pins": dependency_pins,
    "module_count": len(modules),
    "input_sha256": hashes,
    "probes": [],
}


def save():
    (out / "actual-main-results.json").write_text(json.dumps(receipt, indent=2) + "\n")


def run(command, filename):
    verify_frozen_inputs()
    start = time.monotonic()
    with (out / filename).open("w") as log:
        result = subprocess.run(command, cwd=source, env=env, stdout=log, stderr=subprocess.STDOUT)
    print(filename, "exit", result.returncode, flush=True)
    if result.returncode:
        receipt.update(status="failed", failed_log=filename, exit_code=result.returncode)
        save()
        raise SystemExit(result.returncode)
    verify_frozen_inputs()
    return time.monotonic() - start


save()
receipt["actual_lean_version"] = subprocess.check_output(
    ["lake", "env", "lean", "--version"], cwd=source, env=env, text=True).strip()
actual_version = re.search(r"Lean \(version ([^,\s)]+)", receipt["actual_lean_version"])
assert actual_version and actual_version.group(1) == receipt["lean_toolchain"].rsplit(":v", 1)[-1], "Lean executable differs from the source toolchain pin."
receipt["build_seconds"] = run(["lake", "build", *sorted(modules)], "actual-main-build.log")
save()
allowed = {"propext", "Classical.choice", "Quot.sound"}
for probe in probes:
    filename = probe.stem + ".log"
    elapsed = run(["lake", "env", "lean", "-DwarningAsError=true", str(probe)], filename)
    text = (out / filename).read_text()
    reports = re.findall(r"depends on axioms:\s*\[([^\]]*)\]", text, re.S)
    axiom_free_reports = re.findall(r"does not depend on any axioms", text)
    expected_reports = prepared["expected_axiom_reports"][probe.name]
    actual_reports = len(reports) + len(axiom_free_reports)
    if actual_reports != expected_reports:
        receipt.update(status="failed", failed_log=filename,
                       expected_axiom_reports=expected_reports,
                       actual_axiom_reports=actual_reports)
        save()
        raise SystemExit(f"Missing or extra axiom reports in {filename}: "
                         f"expected {expected_reports}, got {actual_reports}")
    for report in reports:
        axioms = {x.strip() for x in report.split(",") if x.strip()}
        if not axioms <= allowed:
            receipt.update(status="failed", failed_log=filename, unexpected_axioms=sorted(axioms - allowed))
            save()
            raise SystemExit(f"Unexpected axioms in {filename}")
    receipt["probes"].append({"file": probe.name, "seconds": elapsed,
                              "exit_code": 0, "axiom_reports": actual_reports,
                              "expected_axiom_reports": expected_reports})
    save()

assert head == git("rev-parse", "HEAD"), "Source moved during verification."
assert not git("status", "--porcelain"), "Source changed during verification."
assert dependency_pins == audit_dependency_pins(source), "Dependencies changed during verification."
assert (source / "lake-manifest.json").read_bytes() == source_manifest_bytes
assert (source / "lean-toolchain").read_bytes() == source_toolchain_bytes
verify_frozen_inputs()
receipt.update(status="success", standard_axioms_only=True,
               prepared_and_frozen_inputs_unchanged=True,
               axiom_report_count=sum(x["axiom_reports"] for x in receipt["probes"]))
save()
print(json.dumps({k: receipt[k] for k in
                  ["status", "source_head", "module_count", "axiom_report_count"]}), flush=True)
