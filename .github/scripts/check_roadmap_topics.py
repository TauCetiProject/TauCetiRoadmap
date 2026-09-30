#!/usr/bin/env python3
"""Check that every roadmap names its topic, as an arXiv math subject class.

A roadmap is a directory directly under `TauCetiRoadmap/` or `Completed/` that holds a `README.md`.
Each one carries a `metadata.toml` whose only key is `topic`, one of arXiv's `math.*` classes:

    topic = "math.NT"

Topics group the roadmaps by area, so that a reader can find the ones in their field.

The topic has a file of its own rather than a line in the README because the progress tooling
identifies the specification a coverage assessment was made against by a hash of the README
(`readme_sha`). Filing a roadmap under a topic, or moving it to another, must not make its
assessment look out of date.

A sub-roadmap, a directory inside a roadmap such as `RepresentationTheory/SchurWeyl`, is filed
under its parent's topic and carries no `metadata.toml` of its own; one found there is an error,
since nothing would read it.

Exits 1, listing every problem, if any roadmap has no valid topic.
"""

from __future__ import annotations

import pathlib
import sys

try:
    import tomllib
except ModuleNotFoundError:  # Python < 3.11
    raise SystemExit("check_roadmap_topics.py needs Python 3.11 or later, for tomllib")

ROOT = pathlib.Path(__file__).resolve().parents[2]
ROADMAP_PARENTS = [ROOT / "TauCetiRoadmap", ROOT / "Completed"]
METADATA = "metadata.toml"
TAXONOMY = "https://arxiv.org/category_taxonomy"

# The `math` archive of the arXiv taxonomy, in arXiv's order. arXiv gives four of these classes a
# second spelling in another archive: `math.IT` is an alias of `cs.IT` and `math.MP` of `math-ph`,
# while `cs.NA` is an alias of `math.NA` and `stat.TH` of `math.ST`. Only the `math.` spelling is
# accepted here, so that every topic has exactly one name; the other spelling is rejected with a
# hint (ALIASES below).
TOPICS = {
    "math.AC": "Commutative Algebra",
    "math.AG": "Algebraic Geometry",
    "math.AP": "Analysis of PDEs",
    "math.AT": "Algebraic Topology",
    "math.CA": "Classical Analysis and ODEs",
    "math.CO": "Combinatorics",
    "math.CT": "Category Theory",
    "math.CV": "Complex Variables",
    "math.DG": "Differential Geometry",
    "math.DS": "Dynamical Systems",
    "math.FA": "Functional Analysis",
    "math.GM": "General Mathematics",
    "math.GN": "General Topology",
    "math.GR": "Group Theory",
    "math.GT": "Geometric Topology",
    "math.HO": "History and Overview",
    "math.IT": "Information Theory",
    "math.KT": "K-Theory and Homology",
    "math.LO": "Logic",
    "math.MG": "Metric Geometry",
    "math.MP": "Mathematical Physics",
    "math.NA": "Numerical Analysis",
    "math.NT": "Number Theory",
    "math.OA": "Operator Algebras",
    "math.OC": "Optimization and Control",
    "math.PR": "Probability",
    "math.QA": "Quantum Algebra",
    "math.RA": "Rings and Algebras",
    "math.RT": "Representation Theory",
    "math.SG": "Symplectic Geometry",
    "math.SP": "Spectral Theory",
    "math.ST": "Statistics Theory",
}
ALIASES = {
    "cs.IT": "math.IT",
    "cs.NA": "math.NA",
    "math-ph": "math.MP",
    "stat.TH": "math.ST",
}


def roadmaps() -> list[pathlib.Path]:
    return sorted(
        p
        for parent in ROADMAP_PARENTS
        if parent.is_dir()
        for p in parent.iterdir()
        if (p / "README.md").is_file()
    )


def problem(roadmap: pathlib.Path) -> str | None:
    """What is wrong with `roadmap`'s topic, or None if it names a valid one."""
    path = roadmap / METADATA
    rel = path.relative_to(ROOT)
    if not path.is_file():
        return f"{rel}: missing"
    try:
        data = tomllib.loads(path.read_text(encoding="utf-8"))
    except (tomllib.TOMLDecodeError, UnicodeDecodeError) as e:
        return f"{rel}: not valid TOML ({e})"
    extra = sorted(set(data) - {"topic"})
    if extra:
        return f"{rel}: unknown key {', '.join(extra)}; the only key is `topic`"
    topic = data.get("topic")
    if topic is None:
        return f"{rel}: no `topic`"
    if not isinstance(topic, str):
        return f"{rel}: `topic` must be a string such as \"math.NT\""
    if topic in TOPICS:
        return None
    hint = ALIASES.get(topic) or next((t for t in TOPICS if t.casefold() == topic.casefold()), None)
    return f"{rel}: {topic!r} is not an arXiv math class" + (f"; did you mean {hint!r}?" if hint else "")


def main() -> int:
    found = roadmaps()
    problems = [p for p in map(problem, found) if p]

    homes = {r / METADATA for r in found}
    for parent in ROADMAP_PARENTS:
        if not parent.is_dir():
            continue
        for path in sorted(parent.rglob(METADATA)):
            if path not in homes:
                problems.append(
                    f"{path.relative_to(ROOT)}: only a roadmap directory carries a {METADATA}; "
                    "a sub-roadmap is filed under its parent's topic"
                )

    if problems:
        print("Roadmap topics are missing or invalid:\n")
        for p in problems:
            print(f"  - {p}")
        print(
            f"\nEvery roadmap directory needs a {METADATA} naming the arXiv math class its main\n"
            "results would be listed under (README.md, \"Filing a roadmap\"), for example\n\n"
            '    topic = "math.NT"\n\n'
            f"The classes, from {TAXONOMY}:\n"
        )
        for code, name in TOPICS.items():
            print(f"    {code}  {name}")
        return 1

    print(f"Roadmap topics valid ({len(found)} roadmaps).")
    return 0


if __name__ == "__main__":
    sys.exit(main())
