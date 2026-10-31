"""Verify dependency source pins without asking Lake to change shared checkouts."""

import json
from pathlib import Path
import subprocess


def audit_dependency_pins(source):
    source = Path(source)
    manifest = json.loads((source / "lake-manifest.json").read_text())
    packages = source / manifest["packagesDir"]
    result = {}
    for package in manifest["packages"]:
        if package["type"] != "git":
            raise RuntimeError(f"Audit non-git dependency explicitly: {package['name']}")
        path = packages / package["name"]
        actual = subprocess.check_output(["git", "-C", str(path), "rev-parse", "HEAD"], text=True).strip()
        changes = subprocess.check_output(["git", "-C", str(path), "status", "--porcelain", "--untracked-files=no"], text=True).strip()
        if actual != package["rev"] or changes:
            raise RuntimeError(f"Use an unmodified, matching dependency checkout for {package['name']}; do not update shared caches in place.")
        result[package["name"]] = {"declared_revision": package["rev"], "actual_revision": actual,
                                    "tracked_sources_clean": True, "resolved_path": str(path.resolve())}
    return result


if __name__ == "__main__":
    import argparse
    parser = argparse.ArgumentParser()
    parser.add_argument("source", type=Path)
    args = parser.parse_args()
    print(json.dumps(audit_dependency_pins(args.source), indent=2))
