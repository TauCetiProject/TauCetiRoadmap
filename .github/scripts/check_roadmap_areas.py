#!/usr/bin/env python3
"""Keep the roadmap list in sync across the repo.

The single source of truth is the set of directories under `TauCetiRoadmap/`
that contain a `README.md`. That same list is copied, by hand, into the
`area` dropdowns of two issue templates and into the README's "Roadmaps"
list. GitHub issue forms are static YAML with no templating, so the copies
cannot be removed -- but they can be checked, and regenerated.

Run with no arguments to check (exit 1 on drift); run with `--fix` to repair.
`--fix` regenerates the two dropdowns wholesale, and heals the README list by
filling gaps only: it inserts a missing roadmap (title from that roadmap's own
`# ` heading) and drops an orphaned line, but never rewrites the text of an
existing entry, so hand-shortened titles survive.

The README list is an unnumbered bullet list sorted by title. Both properties
exist to keep concurrent roadmap pull requests from colliding. When the list
was numbered, every new roadmap claimed the next integer, so any two open pull
requests conflicted on the same line and every merge re-broke the rest; and
inserting mid-list renumbered the whole tail. Without numbers, and sorted, a
new roadmap touches exactly one line at a position determined by its own
title, so two pull requests conflict only when their titles are adjacent.

The item pattern still accepts the old `N. ` form so that pull requests written
against the numbered list keep parsing; `--fix` normalizes them to bullets.
"""

from __future__ import annotations

import pathlib
import re
import sys

ROOT = pathlib.Path(__file__).resolve().parents[2]
ROADMAP_DIR = ROOT / "TauCetiRoadmap"
DROPDOWN_TEMPLATES = [
    ROOT / ".github" / "ISSUE_TEMPLATE" / "1-intention.yml",
    ROOT / ".github" / "ISSUE_TEMPLATE" / "2-roadmap-issue.yml",
]
README = ROOT / "README.md"


def canonical_areas() -> list[str]:
    """Roadmap directory names, sorted -- the source of truth."""
    return sorted(
        p.name for p in ROADMAP_DIR.iterdir() if (p / "README.md").is_file()
    )


# The `area` dropdown's options are the run of `        - Name` lines that
# follow the `options:` key under `id: area`. Capture leading whitespace so a
# rewrite preserves indentation exactly. The `(?!^  - )` bound keeps the search
# inside the `id: area` body item, so it can never reach across into a later
# field's `options:` even if the templates are refactored.
_OPTIONS_BLOCK = re.compile(
    r"(?m)^(?P<indent> *)id: area\n(?:(?!^  - )[\s\S])*?^ *options:\n(?P<options>(?: *- .*\n)+)"
)
_OPTION_LINE = re.compile(r"^ *- (?P<name>.+?) *$", re.M)


def dropdown_areas(text: str) -> list[str]:
    m = _OPTIONS_BLOCK.search(text)
    if not m:
        return []
    return _OPTION_LINE.findall(m.group("options"))


def rewrite_dropdown(text: str, areas: list[str]) -> str:
    m = _OPTIONS_BLOCK.search(text)
    if not m:
        raise SystemExit("could not find an `id: area` dropdown to rewrite")
    # Match the indentation already used for the option lines.
    first = m.group("options").splitlines()[0]
    lead = first[: len(first) - len(first.lstrip())]
    block = "".join(f"{lead}- {a}\n" for a in areas)
    return text[: m.start("options")] + block + text[m.end("options") :]


def title_from_h1(area: str) -> str:
    """A default README title for a roadmap, taken from its own `# ` heading.

    Each roadmap's README opens with `# Roadmap: <title>`; strip that prefix
    and capitalize. This reproduces the curated root-README title exactly for
    most roadmaps, and gives a sensible starting point for the rest -- which a
    human can still shorten by hand, since the healer never rewrites a line
    that already exists.
    """
    for line in (ROADMAP_DIR / area / "README.md").read_text().splitlines():
        if line.startswith("# "):
            t = re.sub(r"(?i)^roadmap:\s*", "", line[2:].strip())
            return t[:1].upper() + t[1:] if t else area
    return area


# A line in the README's "## Roadmaps" list: `- [Title](TauCetiRoadmap/X/README.md)`.
# The legacy `N. ` bullet is still accepted so that pull requests opened against
# the numbered list keep parsing; `--fix` rewrites them as `- `.
_README_ITEM = re.compile(
    r"^(?:-|\d+\.)\s+\[(?P<title>.+?)\]\(TauCetiRoadmap/(?P<area>[^/]+)/README\.md\)\s*$"
)
_README_SECTION = re.compile(r"(?ms)^(## Roadmaps\n\n)(?P<body>.*?)(\n## )")


def readme_entries() -> list[tuple[str, str]]:
    """The (area, title) pairs currently linked in the README list, in order."""
    m = _README_SECTION.search(README.read_text())
    if not m:
        return []
    out = []
    for line in m.group("body").splitlines():
        item = _README_ITEM.match(line)
        if item:
            out.append((item.group("area"), item.group("title")))
    return out


def rewrite_readme(text: str, canonical: list[str]) -> str:
    """Fill gaps in the README list without touching anything else.

    Replace only the contiguous run of list lines: keep every existing entry
    whose directory still exists (with its curated title), drop an orphaned
    line, drop a duplicate, add any roadmap not yet listed (title from its H1),
    and emit the result as an unnumbered bullet list sorted by title. Prose
    before or after the list -- an intro sentence, a note -- is left exactly as
    it is.
    """
    m = _README_SECTION.search(text)
    if not m:
        raise SystemExit("could not find the '## Roadmaps' list in README.md")
    lines = m.group("body").split("\n")
    item_idx = [i for i, ln in enumerate(lines) if _README_ITEM.match(ln)]
    if not item_idx:
        raise SystemExit("found no roadmap list items under '## Roadmaps'")
    # The first contiguous block of list lines; prose may bracket it.
    start = item_idx[0]
    end = start
    for i in item_idx[1:]:
        if i == end + 1:
            end = i
        else:
            break

    present = set(canonical)
    seen: set[str] = set()
    kept: list[tuple[str, str]] = []
    for ln in lines[start : end + 1]:
        item = _README_ITEM.match(ln)
        a, t = item.group("area"), item.group("title")
        if a in present and a not in seen:
            seen.add(a)
            kept.append((a, t))
    for area in canonical:
        if area not in seen:
            seen.add(area)
            kept.append((area, title_from_h1(area)))

    # Sorted by title, so a new roadmap lands at a position fixed by its own
    # title rather than at the end, where every other new roadmap would land.
    kept.sort(key=lambda entry: entry[1].casefold())
    lines[start : end + 1] = [
        f"- [{t}](TauCetiRoadmap/{a}/README.md)" for a, t in kept
    ]
    return text[: m.start("body")] + "\n".join(lines) + text[m.end("body") :]


def main() -> int:
    fix = "--fix" in sys.argv[1:]
    canonical = canonical_areas()
    problems: list[str] = []

    for path in DROPDOWN_TEMPLATES:
        text = path.read_text()
        found = dropdown_areas(text)
        if found == canonical:
            continue
        if fix:
            path.write_text(rewrite_dropdown(text, canonical))
            print(f"fixed: {path.relative_to(ROOT)}")
            continue
        missing = [a for a in canonical if a not in found]
        extra = [a for a in found if a not in canonical]
        detail = []
        if missing:
            detail.append(f"missing {missing}")
        if extra:
            detail.append(f"unknown {extra}")
        if not detail:  # same set, wrong order
            detail.append("out of order")
        problems.append(f"{path.relative_to(ROOT)}: {', '.join(detail)}")

    # The README list keeps its curated titles, but its membership, bullet form,
    # and title order are all derived. Compare against the healed rendering so
    # that a stray number or a misplaced line is caught, not just a missing
    # roadmap; existing lines are never retitled, so hand-shortened titles
    # survive.
    rm_text = README.read_text()
    listed = [a for a, _ in readme_entries()]
    healed = rewrite_readme(rm_text, canonical)
    if healed != rm_text:
        if fix:
            README.write_text(healed)
            print(f"fixed: {README.relative_to(ROOT)}")
        else:
            missing = [a for a in canonical if a not in listed]
            extra = [a for a in set(listed) if a not in set(canonical)]
            dups = sorted({a for a in listed if listed.count(a) > 1})
            detail = []
            if missing:
                detail.append(f"not linked {missing}")
            if extra:
                detail.append(f"links a roadmap with no directory {extra}")
            if dups:
                detail.append(f"listed more than once {dups}")
            if not detail:
                detail.append("not an unnumbered list sorted by title")
            problems.append(f"README.md: {', '.join(detail)}")

    if problems and not fix:
        print("Roadmap area lists are out of sync with TauCetiRoadmap/:\n")
        for p in problems:
            print(f"  - {p}")
        print(
            "\nThe roadmap directories are the source of truth. Run\n"
            "  python3 .github/scripts/check_roadmap_areas.py --fix\n"
            "to regenerate the dropdowns and the README list."
        )
        return 1

    if not fix:
        print(f"Roadmap areas in sync ({len(canonical)} roadmaps).")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
