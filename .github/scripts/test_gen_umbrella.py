#!/usr/bin/env python3
"""Regression tests for `gen_umbrella.py`, run on throwaway repository trees.

Each test writes a small tree of roadmaps with this repository's layout (`TauCetiRoadmap/`,
`Completed/`, `umbrellas/`), copies the generator into it and runs it there, exactly as CI and
the sync workflow invoke it, then reads the files it wrote.

    python3 .github/scripts/test_gen_umbrella.py
"""

from __future__ import annotations

import os
import pathlib
import re
import shutil
import subprocess
import sys
import tempfile
import tomllib
import unittest

SCRIPT = pathlib.Path(__file__).resolve().with_name("gen_umbrella.py")
ITEM = re.compile(r"^- \[(?P<mark>[ x~])\] `(?P<slug>[^`]+)` — (?P<desc>[^()]*) \((?P<clauses>[^()]*)\)$")

# The root family: an index and two roadmaps, linked in the order FamTwo, FamOne.
FAMILY = {
    "Fam": """# Roadmap: the goal

- [Two](FamTwo/README.md)
- [One](FamOne/README.md)
""",
    "Fam/FamOne": """# Roadmap: one

## Layer 1: citation forms

### 1.1 Sections, lists, ranges, layers and a prefixed id

*Needs:* Alpha §1.2; Alpha §§2.1–2.3 and 3.1; Alpha Layer 4; Beta A5.3; Done §1.1; Alpha §9.9.

The running text cites Gamma §3.2, which needs nothing.

### 1.2 An id of its own roadmap

*Needs:* 1.1; Mathlib `Foo.bar`.

### Dependencies

Gamma §3.3, unused: every section of this layer has a *Needs:* line.

## Layer 2: a section without a Needs line

### 2.1 Takes the layer's Dependencies subsection

A remark on Gamma §3.2.

### 2.2 A Prerequisites line is a statement of dependency too

*Prerequisites:* 2.1.

### Dependencies

Gamma §2.1 and Delta §1.1.
""",
    "Fam/FamTwo": """# Roadmap: two

## Layer 1: one section

### 1.1 The same supplier

*Needs:* Alpha §1.2; Alpha Layer 5.

### 1.2 Names in code font and with the package prefix

*Prerequisites:* 1.1; `TauCetiRoadmap.Gamma` §2.1; `Delta` §1.1; TauCetiRoadmap.Alpha §4.1;
`TauCetiRoadmap.Alpha` Layer 3.

### 1.3 A name in code font with nothing citable after it

*Needs:* `Gamma`, for its conventions; `TauCeti.Gamma` is a Lean name.
""",
}
SUPPLIERS = {
    "Alpha": """# Roadmap: alpha

## Layer 1: base

### 1.2 Base

*Needs:* Gamma §1.1.

## Layer 2: middle

### 2.1 First
### 2.2 Second
### 2.3 Third

## Layer 3: three

### 3.1 Needs its own layer

*Needs:* Layer 3.

## Layer 4: four

### 4.1 Four one
### 4.2 Four two

## Layer 5: a layer without sections

Its targets are stated here, in one piece.

## Layer 9: never needed

### 9.8 Never cited
""",
    "Group": "# Roadmap: an area of several roadmaps\n",
    "Group/Beta": """# Roadmap: beta

### A5.3 A roadmap-specific id

Nothing needed.
""",
    "Gamma": """# Roadmap: gamma

### 1.1 Gamma base
### 2.1 Gamma two
### 3.2 Cited only in running text
### 3.3 Cited only in an unused Dependencies subsection
### 4.1 Part of a cycle

*Needs:* Delta §1.1.
""",
    "Delta": """# Roadmap: delta

### 1.1 Part of a cycle

*Needs:* Gamma §4.1.
""",
}
UMBRELLA = 'description = "A goal, \\"quoted\\" verbatim."\nroot = "Fam"\nweight = 3\n'


class GenUmbrellaTest(unittest.TestCase):
    def setUp(self) -> None:
        tmp = tempfile.TemporaryDirectory()
        self.addCleanup(tmp.cleanup)
        self.root = pathlib.Path(tmp.name)
        self.tree(self.root)

    def tree(self, root: pathlib.Path, roadmaps: dict | None = None, umbrella: str = UMBRELLA) -> None:
        scripts = root / ".github" / "scripts"
        scripts.mkdir(parents=True)
        shutil.copy(SCRIPT, scripts)
        for rel, text in (roadmaps if roadmaps is not None else {**FAMILY, **SUPPLIERS}).items():
            d = root / "TauCetiRoadmap" / rel
            d.mkdir(parents=True, exist_ok=True)
            (d / "README.md").write_text(text, encoding="utf-8")
        done = root / "Completed" / "Done"
        done.mkdir(parents=True)
        (done / "README.md").write_text("# Roadmap: done\n\n### 1.1 Finished\n", encoding="utf-8")
        (root / "umbrellas").mkdir()
        (root / "umbrellas" / "GRH.toml").write_text(umbrella, encoding="utf-8")

    def run_script(self, *args: str, root: pathlib.Path | None = None, seed: str = "0") -> tuple[int, str]:
        script = (root or self.root) / ".github" / "scripts" / SCRIPT.name
        env = {**os.environ, "PYTHONHASHSEED": seed}
        result = subprocess.run([sys.executable, "-B", str(script), *args], capture_output=True, text=True, env=env)
        return result.returncode, result.stdout + result.stderr

    def fix(self) -> None:
        code, output = self.run_script("--fix")
        assert code == 0, output

    def items(self) -> dict[str, dict]:
        """slug -> {area, desc, serves, needs} of the generated target list."""
        out, area = {}, None
        text = (self.root / "umbrellas" / "GRH-targets.md").read_text(encoding="utf-8")
        for line in text.splitlines():
            if line.startswith("## "):
                area = line[3:]
            elif line.startswith("- ["):
                m = ITEM.match(line)
                assert m, line
                clauses = dict(c.split(": ", 1) for c in m.group("clauses").split("; "))
                needs = [] if clauses["needs"] == "none" else clauses["needs"].split(", ")
                out[m.group("slug")] = {"area": area, "desc": m.group("desc"), "needs": needs,
                                        "serves": clauses.get("serves", ""), "mark": m.group("mark"),
                                        "clauses": m.group("clauses"), "line": line}
        return out

    def test_citation_forms_and_closure(self) -> None:
        self.fix()
        items = self.items()
        needs = items["FamOne.1.1"]["needs"]
        for slug in ("Alpha.1.2", "Alpha.2.1", "Alpha.2.2", "Alpha.2.3", "Alpha.3.1", "Beta.A5.3"):
            assert slug in needs, (slug, needs)
        assert items["FamOne.1.2"]["needs"] == ["FamOne.1.1"]           # a bare id is the roadmap's own
        assert items["Alpha.1.2"]["needs"] == ["Gamma.1.1"]             # suppliers of suppliers are in
        assert "Gamma.1.1" in items and items["Gamma.1.1"]["area"] == "Gamma"
        assert "Alpha.9.8" not in items                                 # never needed

    def test_running_text_needs_nothing(self) -> None:
        self.fix()
        items = self.items()
        assert "Gamma.3.2" not in items                                 # cited only in running text
        assert "Gamma.3.3" not in items                                 # its layer's sections have *Needs:*

    def test_section_without_needs_takes_the_dependencies_subsection(self) -> None:
        self.fix()
        items = self.items()
        assert items["FamOne.2.1"]["needs"] == ["Delta.1.1", "Gamma.2.1"], items["FamOne.2.1"]

    def test_a_layer_with_sections_is_no_item_and_stands_for_its_sections(self) -> None:
        self.fix()
        items = self.items()
        assert not [s for s in items if s in ("Alpha.Layer4", "FamOne.Layer1", "FamOne.Layer2")], sorted(items)
        assert "Alpha.4.1" in items["FamOne.1.1"]["needs"] and "Alpha.4.2" in items["FamOne.1.1"]["needs"]
        # a layer without sections is the unit of work: an item that needs nothing
        assert items["Alpha.Layer5"]["needs"] == [] and "Alpha.Layer5" in items["FamTwo.1.1"]["needs"]

    def test_prerequisites_line_reads_as_a_needs_line(self) -> None:
        self.fix()
        items = self.items()
        # a statement of its own: the layer's Dependencies subsection does not apply
        assert items["FamOne.2.2"]["needs"] == ["FamOne.2.1"], items["FamOne.2.2"]

    def test_names_in_code_font_and_with_the_package_prefix(self) -> None:
        self.fix()
        items = self.items()
        assert items["FamTwo.1.2"]["needs"] == ["Alpha.3.1", "Alpha.4.1", "Delta.1.1", "Gamma.2.1", "FamTwo.1.1"], \
            items["FamTwo.1.2"]
        assert items["FamTwo.1.3"]["needs"] == [], items["FamTwo.1.3"]

    def test_a_section_never_needs_its_layer(self) -> None:
        self.fix()
        items = self.items()
        assert items["Alpha.3.1"]["needs"] == [], items["Alpha.3.1"]

    def test_completed_roadmap_is_no_member_and_no_item(self) -> None:
        self.fix()
        items = self.items()
        assert not [s for s in items if s.startswith("Done.")]
        assert not [n for i in items.values() for n in i["needs"] if n.startswith("Done.")]
        umbrella = tomllib.loads((self.root / "umbrellas" / "GRH.toml").read_text(encoding="utf-8"))
        assert "Done" not in [a["name"] for a in umbrella["area"]]

    def test_unresolved_id_is_reported(self) -> None:
        self.fix()
        assert "Alpha.9.9" not in self.items()
        code, output = self.run_script("--stats")
        assert code == 0, output
        assert re.search(r"FamOne:\d+: Alpha §9\.9 \(\*Needs:\*\)|FamOne:\d+: Alpha §9\.9:", output), output
        assert "ids not resolved (on *Needs:* and *Prerequisites:* lines and in Dependencies subsections): 1" \
            in output, output

    def test_cycle_is_broken_and_reported(self) -> None:
        self.fix()
        items = self.items()
        # Delta sorts before Gamma, so Delta's dependency on the later Gamma unit is the one dropped
        assert items["Gamma.4.1"]["needs"] == ["Delta.1.1"], items["Gamma.4.1"]
        assert items["Delta.1.1"]["needs"] == [], items["Delta.1.1"]
        text = (self.root / "umbrellas" / "GRH-targets.md").read_text(encoding="utf-8")
        delta = text[text.index("## Delta"):text.index("## Gamma")]
        assert "> Dropped to break a cycle: `Delta.1.1` needs `Gamma.4.1`." in delta, delta
        code, output = self.run_script("--stats")
        assert "Delta.1.1 needs Gamma.4.1" in output and "1 dropped for cycles" in output, output

    def test_serves_names_the_family_in_its_order(self) -> None:
        self.fix()
        items = self.items()
        assert items["Alpha.1.2"]["serves"] == "FamTwo, FamOne", items["Alpha.1.2"]
        assert items["Gamma.1.1"]["serves"] == "", items["Gamma.1.1"]     # needed only through Alpha.1.2

    def test_target_list_format(self) -> None:
        self.fix()
        text = (self.root / "umbrellas" / "GRH-targets.md").read_text(encoding="utf-8")
        lines = text.splitlines()
        assert lines[1] == "<!-- tauceti-targets:v1 -->", lines[:2]
        assert "gen_umbrella.py" in text[:text.index("\n## ")]
        headings = [line[3:] for line in lines if line.startswith("## ")]
        assert headings == ["Alpha", "Delta", "Gamma", "Group", "Fam"], headings   # the root's area last
        slugs = [line.split("`")[1] for line in lines if line.startswith("- [")]
        assert len(slugs) == len(set(slugs))
        for slug in slugs:
            assert re.fullmatch(r"[A-Za-z0-9][A-Za-z0-9._-]*", slug) and ".." not in slug, slug
        defined = set(slugs)
        assert all(n in defined for i in self.items().values() for n in i["needs"])

    def test_umbrella_file(self) -> None:
        self.fix()
        text = (self.root / "umbrellas" / "GRH.toml").read_text(encoding="utf-8")
        data = tomllib.loads(text)
        assert data["description"] == 'A goal, "quoted" verbatim.' and data["root"] == "Fam", data
        assert data["targets"] == "GRH-targets.md"
        assert "weight" not in text
        areas = data["area"]
        assert [a["name"] for a in areas] == ["Fam", "Alpha", "Delta", "Gamma", "Group"], areas
        assert "sections" not in areas[0]
        assert areas[1]["sections"] == ["§1.2", "§2.1", "§2.2", "§2.3", "§3.1", "§4.1", "§4.2", "Layer 5"], areas[1]
        assert areas[4]["sections"] == ["Beta §A5.3"], areas[4]     # an area of several roadmaps

    def test_an_umbrella_without_root_is_left_alone(self) -> None:
        other = self.root / "umbrellas" / "Other.toml"
        other.write_text('[[area]]\nname = "Alpha"\nweight = 2\n', encoding="utf-8")
        self.fix()
        assert other.read_text(encoding="utf-8") == '[[area]]\nname = "Alpha"\nweight = 2\n'
        assert not (self.root / "umbrellas" / "Other-targets.md").exists()

    def test_determinism(self) -> None:
        self.fix()
        second = self.root / "second"
        self.tree(second)
        code, output = self.run_script("--fix", root=second, seed="12345")
        assert code == 0, output
        for name in ("GRH.toml", "GRH-targets.md"):
            assert (self.root / "umbrellas" / name).read_bytes() == (second / "umbrellas" / name).read_bytes(), name
        code, output = self.run_script("--fix")
        assert code == 0 and "wrote" not in output, output       # a second run writes nothing

    def test_check_mode_detects_a_hand_edit(self) -> None:
        code, output = self.run_script()
        assert code == 1 and "GRH-targets.md: missing" in output, output
        self.fix()
        code, output = self.run_script()
        assert code == 0, output
        for name in ("GRH-targets.md", "GRH.toml"):
            path = self.root / "umbrellas" / name
            good = path.read_text(encoding="utf-8")
            path.write_text(good.replace("Alpha", "Alpha ", 1) if name.endswith(".md") else good + "weight = 2\n",
                            encoding="utf-8")
            code, output = self.run_script()
            assert code == 1 and f"umbrellas/{name}: differs" in output, output
            path.write_text(good, encoding="utf-8")
        code, output = self.run_script()
        assert code == 0, output

    def other_tree(self, name: str, roadmaps: dict) -> pathlib.Path:
        root = self.root / name
        self.tree(root, roadmaps)
        return root

    def items_of(self, root: pathlib.Path) -> dict[str, dict]:
        self.root, saved = root, self.root
        try:
            return self.items()
        finally:
            self.root = saved

    def test_needs_are_written_in_full(self) -> None:
        reduced = self.root / "reduced"
        self.tree(reduced, {"Fam": """# Roadmap: reduced

### 1.1 A chain: needs 1.2 and 1.3, and 1.2 needs 1.3

*Needs:* 1.2, 1.3.

### 1.2 B

*Needs:* 1.3.

### 1.3 C

### 2.1 A diamond: needs 2.2 and 2.3, which both need 2.4

*Needs:* 2.2, 2.3, 2.4.

### 2.2 E

*Needs:* 2.4.

### 2.3 F

*Needs:* 2.4.

### 2.4 G
"""})
        code, output = self.run_script("--fix", root=reduced)
        assert code == 0, output
        self.root, saved = reduced, self.root
        try:
            items = self.items()
        finally:
            self.root = saved
        # every stated need is written, the one another need implies too
        assert items["Fam.1.1"]["needs"] == ["Fam.1.2", "Fam.1.3"], items["Fam.1.1"]
        assert items["Fam.2.1"]["needs"] == ["Fam.2.2", "Fam.2.3", "Fam.2.4"], items["Fam.2.1"]
        code, output = self.run_script("--stats", root=reduced)
        assert "8 stated" in output and "8 written" in output, output

    def test_a_ticked_need_does_not_hide_a_new_one(self) -> None:
        root = self.other_tree("ticked", {"Fam": "# Roadmap: f\n\n### 1.1 A\n\n*Needs:* 1.2.\n\n### 1.2 B\n"})
        code, output = self.run_script("--fix", root=root)
        assert code == 0, output
        path = root / "umbrellas" / "GRH-targets.md"
        path.write_text(path.read_text(encoding="utf-8").replace("- [ ] `Fam.1.2`", "- [x] `Fam.1.2`"),
                        encoding="utf-8")
        (root / "TauCetiRoadmap" / "Fam" / "README.md").write_text(
            "# Roadmap: f\n\n### 1.1 A\n\n*Needs:* 1.2, 1.3.\n\n### 1.2 B\n\n*Needs:* 1.3.\n\n### 1.3 C\n",
            encoding="utf-8")
        code, output = self.run_script("--fix", root=root)
        assert code == 0, output
        items = self.items_of(root)
        assert items["Fam.1.1"]["needs"] == ["Fam.1.2", "Fam.1.3"], items["Fam.1.1"]
        assert items["Fam.1.2"]["mark"] == "x" and items["Fam.1.3"]["mark"] == " ", items

    def test_a_layer_item_needs_what_its_lines_and_dependencies_name(self) -> None:
        root = self.other_tree("layer", {
            "Fam": "# Roadmap: f\n\n### 1.1 Uses a layer\n\n*Needs:* Alpha Layer 2.\n",
            "Alpha": """# Roadmap: alpha

## Layer 1: base

### 1.5 Base

## Layer 2: a layer without sections

Its targets are stated here.

### An unnumbered subheading

*Needs:* Gamma §1.1.

### Dependencies

Delta §1.1; 1.5; Layer 2.
""",
            "Gamma": "# Roadmap: g\n\n### 1.1 G\n",
            "Delta": "# Roadmap: d\n\n### 1.1 D\n"})
        code, output = self.run_script("--fix", root=root)
        assert code == 0, output
        items = self.items_of(root)
        assert items["Fam.1.1"]["needs"] == ["Alpha.Layer2"], items["Fam.1.1"]
        # its own *Needs:* line, the supplier and its own section in its Dependencies, not itself
        assert items["Alpha.Layer2"]["needs"] == ["Alpha.1.5", "Delta.1.1", "Gamma.1.1"], items["Alpha.Layer2"]

    def test_a_slug_comes_from_the_heading_not_from_how_it_is_cited(self) -> None:
        def family(needs: str) -> dict:
            return {"Fam": f"# Roadmap: f\n\n### 1.1 Cites alpha\n\n*Needs:* {needs}.\n",
                    "Alpha": "# Roadmap: alpha\n\n### 1.1 A result (A1.1)\n\n### 1.2 Another (A1.2)\n"}
        root = self.other_tree("slugs", family("Alpha §A1.1"))
        code, output = self.run_script("--fix", root=root)
        assert code == 0, output
        items = self.items_of(root)
        assert sorted(s for s in items if s.startswith("Alpha.")) == ["Alpha.1.1"], sorted(items)
        assert items["Alpha.1.1"]["desc"] == "§1.1 [A1.1] A result", items["Alpha.1.1"]
        path = root / "umbrellas" / "GRH-targets.md"
        path.write_text(path.read_text(encoding="utf-8").replace("- [ ] `Alpha.1.1`", "- [x] `Alpha.1.1`"),
                        encoding="utf-8")
        readme = root / "TauCetiRoadmap" / "Fam" / "README.md"
        # the second form of citation, on the same dependency line: nothing is renamed or lost
        readme.write_text(family("Alpha §A1.1; see also Alpha §1.1")["Fam"], encoding="utf-8")
        code, output = self.run_script("--fix", root=root)
        assert code == 0 and "no longer an item" not in output, output
        items = self.items_of(root)
        assert items["Alpha.1.1"]["mark"] == "x" and sorted(items) == ["Alpha.1.1", "Fam.1.1"], items
        # citations added and removed elsewhere leave the slug of a unit that stays as it was
        for needs in ("Alpha §1.1", "Alpha §A1.2; Alpha §A1.1", "Alpha §1.2; Alpha §A1.1"):
            readme.write_text(family(needs)["Fam"], encoding="utf-8")
            code, output = self.run_script("--fix", root=root)
            assert code == 0 and "no longer an item" not in output, (needs, output)
            items = self.items_of(root)
            assert items["Alpha.1.1"]["mark"] == "x", (needs, items)
            assert not [s for s in items if s.startswith("Alpha.A")], (needs, sorted(items))

    def edit_list(self, change) -> None:
        path = self.root / "umbrellas" / "GRH-targets.md"
        old = path.read_text(encoding="utf-8")
        new = change(old)
        assert new != old, "the edit did not apply"
        path.write_text(new, encoding="utf-8")

    def test_marks_and_recorded_clauses_survive_regeneration(self) -> None:
        self.fix()
        self.edit_list(lambda t: t.replace("- [ ] `Alpha.2.1`", "- [x] `Alpha.2.1`")
                       .replace("- [ ] `Alpha.2.2`", "- [~] `Alpha.2.2`"))
        code, output = self.run_script()
        assert code == 0, output                                  # a change that only ticks passes
        # a recorded clause written after `needs:` is moved before it, and kept
        self.edit_list(lambda t: re.sub(r"(- \[ \] `Alpha\.2\.3` — .*)\)$", r"\1; partial: #12, #34)", t, flags=re.M))
        code, output = self.run_script()
        assert code == 1, output
        self.fix()
        first = (self.root / "umbrellas" / "GRH-targets.md").read_bytes()
        self.fix()
        assert (self.root / "umbrellas" / "GRH-targets.md").read_bytes() == first
        items = self.items()
        assert items["Alpha.2.1"]["mark"] == "x" and items["Alpha.2.2"]["mark"] == "~", items["Alpha.2.1"]
        assert items["Alpha.2.3"]["clauses"] == "serves: FamOne; partial: #12, #34; needs: none", items["Alpha.2.3"]
        code, output = self.run_script()
        assert code == 0, output

    def test_a_vanished_ticked_slug_is_reported(self) -> None:
        self.fix()
        self.edit_list(lambda t: t.replace("## Delta\n", "## Delta\n- [x] `Delta.7.7` — gone (needs: none)\n"))
        code, output = self.run_script()
        assert code == 1 and "Delta.7.7 [x] is no longer an item" in output, output
        code, output = self.run_script("--fix")
        assert code == 0 and "Delta.7.7 [x] is no longer an item" in output, output
        assert "Delta.7.7" not in (self.root / "umbrellas" / "GRH-targets.md").read_text(encoding="utf-8")

    def test_check_mode_fails_on_a_hand_changed_needs(self) -> None:
        self.fix()
        self.edit_list(lambda t: re.sub(r"(- \[ \] `Gamma\.2\.1` — .*)needs: none\)$", r"\1needs: Gamma.1.1)", t,
                                        flags=re.M))
        code, output = self.run_script()
        assert code == 1 and "GRH-targets.md: differs" in output, output

    def test_section_ids_with_a_colon(self) -> None:
        colon = self.root / "colon"
        self.tree(colon, {
            "Fam": """# Roadmap: uses colon ids

### 1.1 A citation and a range

*Needs:* Colon §X.0:beta.1; Colon §§X.0:alpha.1–X.0:alpha.2.

### 1.2 A layer with a colon id

*Needs:* Colon Layer X.0:beta.

## Layer 3: An ordinary layer, whose colon ends the id

### 3.1 Untouched
""",
            "Colon": """# Roadmap: colon ids

## Layer X.0:alpha: Alpha

### X.0:alpha.1 First

### X.0:alpha.2 Second

## Layer X.0:beta: Beta

### X.0:beta.1 Third

### X.0:beta.2 Fourth

*Needs:* X.0:alpha.1.
"""})
        code, output = self.run_script("--fix", root=colon)
        assert code == 0, output
        self.root, saved = colon, self.root
        try:
            items = self.items()
            umbrella = tomllib.loads((colon / "umbrellas" / "GRH.toml").read_text(encoding="utf-8"))
        finally:
            self.root = saved
        assert sorted(s for s in items if s.startswith("Colon.")) == [
            "Colon.X.0-alpha.1", "Colon.X.0-alpha.2", "Colon.X.0-beta.1", "Colon.X.0-beta.2"], sorted(items)
        assert items["Colon.X.0-alpha.1"]["desc"] == "§X.0:alpha.1 First", items["Colon.X.0-alpha.1"]
        assert items["Fam.1.1"]["needs"] == ["Colon.X.0-alpha.1", "Colon.X.0-alpha.2", "Colon.X.0-beta.1"], \
            items["Fam.1.1"]
        assert items["Fam.1.2"]["needs"] == ["Colon.X.0-beta.1", "Colon.X.0-beta.2"], items["Fam.1.2"]
        assert items["Colon.X.0-beta.2"]["needs"] == ["Colon.X.0-alpha.1"], items["Colon.X.0-beta.2"]
        assert "Fam.3.1" in items and "Fam.Layer3" not in items
        sections = {a["name"]: a.get("sections") for a in umbrella["area"]}
        assert sections["Colon"] == ["§X.0:alpha.1", "§X.0:alpha.2", "§X.0:beta.1", "§X.0:beta.2"], sections

    def test_a_leading_id_that_is_not_unique_takes_the_alias(self) -> None:
        root = self.other_tree("restart", {
            "Fam": "# Roadmap: f\n\n### 1.1 Cites both\n\n*Needs:* Alpha §1.1; Alpha §B1.1.\n",
            "Alpha": "# Roadmap: alpha\n\n## Layer A: first\n\n### 1.1 First\n\n## Layer B: second\n\n"
                     "### 1.1 Second (B1.1)\n"})
        code, output = self.run_script("--fix", root=root)
        assert code == 0, output
        items = self.items_of(root)
        assert items["Fam.1.1"]["needs"] == ["Alpha.1.1", "Alpha.B1.1"], items["Fam.1.1"]
        assert items["Alpha.B1.1"]["desc"] == "§B1.1 Second", items["Alpha.B1.1"]

    def test_local_references_resume_after_an_outside_name(self) -> None:
        root = self.other_tree("stretches", {
            "Fam": """# Roadmap: f

### 1.2 A section

### 1.3 Needs across sentences

*Needs:* Mathlib open subgroups. §1.2 and Layer 3; Alpha §2.1, 2.2. Layer 4.

## Layer 3: a layer without sections

Text.

## Layer 4: another

Text.

## Layer 6: the supplier

Text.

## Layer 7: after a sentence about Mathlib

Text.

### Dependencies

Mathlib: `Nat.add`. Layer 6 (the supplier).

## Layer 8: an aside that runs over a line break

Text.

### Dependencies

Tau Ceti `TauCeti.Foo` (an aside that
runs over a line break). Layer 6.

## Layer 9: a parenthesis left open

Text.

### Dependencies

Mathlib (left open. Layer 4.

## Layer 10: e.g. is no boundary

Text.

### Dependencies

Mathlib, e.g. Layer 6.
""",
            "Alpha": "# Roadmap: alpha\n\n### 2.1 A\n\n### 2.2 B\n"})
        code, output = self.run_script("--fix", root=root)
        assert code == 0, output
        items = self.items_of(root)
        assert items["Fam.Layer7"]["needs"] == ["Fam.Layer6"], items["Fam.Layer7"]
        assert items["Fam.1.3"]["needs"] == ["Alpha.2.1", "Alpha.2.2", "Fam.1.2", "Fam.Layer3", "Fam.Layer4"], \
            items["Fam.1.3"]
        assert items["Fam.Layer8"]["needs"] == ["Fam.Layer6"], items["Fam.Layer8"]
        assert items["Fam.Layer9"]["needs"] == ["Fam.Layer4"], items["Fam.Layer9"]
        assert items["Fam.Layer10"]["needs"] == [], items["Fam.Layer10"]
        code, output = self.run_script("--stats", root=root)
        assert "Fam §2.1" not in output and "Fam §2.2" not in output, output     # Alpha's, not local

    def test_a_clause_that_negates_or_names_a_consumer_creates_no_need(self) -> None:
        root = self.other_tree("asides", {
            "Fam": """# Roadmap: f

### 4.4 Four

### 4.5 Five

*Needs:* §4.8.

### 4.6 These count

*Needs:* Mathlib groups. Alpha Layer 11 for the reciprocity map; Beta §9.2 supplies the Minkowski bound.

### 4.7 A consumer phrase

*Needs:* Mathlib groups; used by §§4.4 and 4.5.

### 4.8 A consumer verb

*Needs:* Mathlib groups. §4.5 consumes it.

## Layer 0: base

Text.

## Layer 1: a negation

Text.

### Dependencies

Mathlib `Nat.add`. Layer 0 is not needed.
""",
            "Alpha": "# Roadmap: alpha\n\n## Layer 11: reciprocity\n\nText.\n",
            "Beta": "# Roadmap: beta\n\n### 9.2 Minkowski\n"})
        code, output = self.run_script("--fix", root=root)
        assert code == 0, output
        items = self.items_of(root)
        assert items["Fam.4.5"]["needs"] == ["Fam.4.8"], items["Fam.4.5"]
        assert items["Fam.4.8"]["needs"] == [] and items["Fam.4.7"]["needs"] == [], items
        assert items["Fam.4.6"]["needs"] == ["Alpha.Layer11", "Beta.9.2"], items["Fam.4.6"]
        assert items["Fam.Layer1"]["needs"] == [], items["Fam.Layer1"]
        assert "> Dropped" not in (root / "umbrellas" / "GRH-targets.md").read_text(encoding="utf-8")
        code, output = self.run_script("--stats", root=root)
        assert "1 by a negation, 3 by a consumer cue" in output, output
        assert "negation: TauCetiRoadmap/Fam/README.md:31: Fam Layer 0 (cue: is not)" in output, output

    def test_cues_act_on_the_reference_they_govern(self) -> None:
        root = self.other_tree("governed", {
            "Fam": """# Roadmap: f

### 0.1 Kept despite a negation elsewhere

*Needs:* Mathlib groups. Alpha §0.18, the character prime number theorem without an exceptional-zero term.

### 0.2 A negation inside a description

*Needs:* Mathlib groups. Layer 8.1 `Z_p^d`-extensions in which no finite prime splits completely.

### 0.3 One counts, one is set aside

*Needs:* Mathlib groups. The complex projective-tensor construction of §0.12, without using §0.16's colimit theorem.

### 0.4 A negation after a comma

*Needs:* Mathlib groups. §§10.0–10.2, with the relevant amplitude established, not assumed at real dyadic places.

### 0.5 The raw-quotient comparisons

*Needs:* Mathlib groups. The raw-quotient comparisons use §4.4, whose construction needs only that coreflection
portion, not the transported adjunction.

### 0.6 Set aside by a negation

*Needs:* Mathlib groups. Layer 0 is not needed; no Layer 6 input is needed; it does not consume Layer 7's computation.

### 0.7 Set aside as consumers

*Needs:* Mathlib groups. Beta R0.9 and Gamma R3.6 consume this section and are not inputs to it.

### 0.8 Feeds

*Needs:* Mathlib groups. D0.16 feeds D0.22, and D0.23 feeds D0.24.

### 0.9 Used by

*Needs:* Mathlib groups. §0.12 supplies analytic categories, §0.16 supplies comparisons used by §4.4, and §10.0 states
the rest; the dévissage criterion is used by the proper comparison of §10.2.

### 0.12 A

### 0.16 B

### 4.4 C

### 10.0 D

### 10.1 E

### 10.2 F

### D0.16 G

### D0.22 H

### D0.23 I

### D0.24 J

## Layer 0: base

Text.

## Layer 6: six

Text.

## Layer 7: seven

Text.

## Layer 8: eight

### 8.1 Extensions
""",
            "Alpha": "# Roadmap: alpha\n\n### 0.18 Prime number theorem\n",
            "Beta": "# Roadmap: beta\n\n### R0.9 Beta\n",
            "Gamma": "# Roadmap: gamma\n\n### R3.6 Gamma\n"})
        code, output = self.run_script("--fix", root=root)
        assert code == 0, output
        items = self.items_of(root)

        def needs(slug):
            return items[slug]["needs"]
        assert needs("Fam.0.1") == ["Alpha.0.18"], needs("Fam.0.1")
        assert needs("Fam.0.2") == ["Fam.8.1"], needs("Fam.0.2")
        assert needs("Fam.0.3") == ["Fam.0.12"], needs("Fam.0.3")
        assert needs("Fam.0.4") == ["Fam.10.0", "Fam.10.1", "Fam.10.2"], needs("Fam.0.4")
        assert needs("Fam.0.5") == ["Fam.4.4"], needs("Fam.0.5")
        assert needs("Fam.0.6") == [] and needs("Fam.0.7") == [], items
        # D0.16 and D0.23 feed: they count; D0.22 and D0.24 are fed: set aside
        assert needs("Fam.0.8") == ["Fam.D0.16", "Fam.D0.23"], needs("Fam.0.8")
        # the suppliers before `used by` count; what follows it is set aside, up to a new statement
        assert needs("Fam.0.9") == ["Fam.0.12", "Fam.0.16", "Fam.10.0"], needs("Fam.0.9")

    def test_a_table_row_and_cell_are_boundaries(self) -> None:
        root = self.other_tree("table", {"Fam": """# Roadmap: f

### 1.2 B

### 1.3 C

## Layer 1: a layer whose Dependencies subsection is a table

Text.

### Dependencies

| From | Items |
| --- | --- |
| Mathlib | 1.2 |
| Tau Ceti | 1.3 |
"""})
        code, output = self.run_script("--fix", root=root)
        assert code == 0, output
        # without the boundaries `Mathlib` would stop the reading of the rest of the table
        assert self.items_of(root)["Fam.Layer1"]["needs"] == ["Fam.1.2", "Fam.1.3"]

    def test_a_sentence_opener_is_not_a_name(self) -> None:
        root = self.other_tree("openers", {"Fam": """# Roadmap: f

### 1.1 Openers

*Needs:* Mathlib groups. The proof uses §1.2. For the case of a field, see Section 1.3. Within the layer, 1.4
uses 1.2. Mathlib also gives §1.4.

### 1.2 B

### 1.3 C

### 1.4 D
"""})
        code, output = self.run_script("--fix", root=root)
        assert code == 0, output
        # `The`, `For` and `Within` open sentences, after which an id after a sign is read but a bare
        # one is not; `Mathlib` is an outside name and stops the reading
        assert self.items_of(root)["Fam.1.1"]["needs"] == ["Fam.1.2", "Fam.1.3"]

    def test_a_stated_need_outranks_an_inferred_one(self) -> None:
        root = self.other_tree("ranks", {"Fam": """# Roadmap: f

### 4.5 Five

*Needs:* §4.8.

### 4.8 Eight

*Needs:* Mathlib groups. §4.5 treats the pointed case.
"""})
        code, output = self.run_script("--fix", root=root)
        assert code == 0, output
        items = self.items_of(root)
        # the need stated first is kept; the one in a later sentence closes the cycle and goes
        assert items["Fam.4.5"]["needs"] == ["Fam.4.8"] and items["Fam.4.8"]["needs"] == [], items
        text = (root / "umbrellas" / "GRH-targets.md").read_text(encoding="utf-8")
        assert "> Dropped to break a cycle: `Fam.4.8` needs `Fam.4.5`." in text, text

    def test_slugs_that_would_collide_stop_the_generator(self) -> None:
        clash = self.root / "clash"
        # `Aα1` loses its `α` in a slug and would become the slug of `A1`
        self.tree(clash, {"Fam": "# Roadmap: clash\n\n### A1 First\n### Aα1 Second\n"})
        code, output = self.run_script("--fix", root=clash)
        assert code == 1 and "two items would be named Fam.A1" in output, output


if __name__ == "__main__":
    unittest.main()
