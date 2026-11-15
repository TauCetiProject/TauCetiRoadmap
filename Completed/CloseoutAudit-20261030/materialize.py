"""Copy this evidence bundle outside the roadmap checkout, restoring .lean names."""
import argparse
import hashlib
import json
from pathlib import Path
import shutil

parser = argparse.ArgumentParser()
parser.add_argument("destination", type=Path)
args = parser.parse_args()
base = Path(__file__).resolve().parent
destination = args.destination.resolve()
if destination == base or base in destination.parents:
    raise SystemExit("Choose a new destination outside this bundle.")
repository = next((p for p in [base, *base.parents] if (p / ".git").exists()), None)
if repository is None and base.parent.name == "Completed":
    repository = base.parent.parent
if repository is not None and (destination == repository or repository in destination.parents):
    raise SystemExit("Choose a destination outside the roadmap checkout.")
destination.mkdir(parents=True, exist_ok=False)
manifest = json.loads((base / "manifest.json").read_bytes())
for original, expected in manifest["input_hashes"].items():
    stored = base / (original + ".txt" if original.endswith(".lean") else original)
    data = stored.read_bytes()
    assert hashlib.sha256(data).hexdigest() == expected, stored
    target = destination / original
    target.parent.mkdir(parents=True, exist_ok=True)
    target.write_bytes(data)
for name in ["manifest.json", "run.py", "dependency_pin_audit.py"]:
    shutil.copyfile(base / name, destination / name)
print(destination)
