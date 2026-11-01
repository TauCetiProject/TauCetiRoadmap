#!/usr/bin/env python3
"""Regression tests for `check_roadmap_topics.py`, run on throwaway repository trees.

The CI step that runs the checker on this repository only ever sees valid metadata, so it would
not notice the checker going lax. Each test here copies the script into a temporary tree with this
repository's layout and runs it there, so the tests exercise the script exactly as CI invokes it.

    python3 .github/scripts/test_check_roadmap_topics.py
"""

from __future__ import annotations

import pathlib
import shutil
import subprocess
import sys
import tempfile
import unittest

SCRIPT = pathlib.Path(__file__).resolve().with_name("check_roadmap_topics.py")


class CheckRoadmapTopicsTest(unittest.TestCase):
    def setUp(self) -> None:
        tmp = tempfile.TemporaryDirectory()
        self.addCleanup(tmp.cleanup)
        self.root = pathlib.Path(tmp.name)
        scripts = self.root / ".github" / "scripts"
        scripts.mkdir(parents=True)
        shutil.copy(SCRIPT, scripts)

    def roadmap(self, rel: str, metadata: str | bytes | None = 'topic = "math.NT"\n') -> None:
        """A directory `rel` with a README, and with `metadata` as its `metadata.toml` unless None."""
        d = self.root / rel
        d.mkdir(parents=True)
        (d / "README.md").write_text(f"# {d.name}\n", encoding="utf-8")
        if metadata is not None:
            data = metadata.encode("utf-8") if isinstance(metadata, str) else metadata
            (d / "metadata.toml").write_bytes(data)

    def run_check(self) -> tuple[int, str, list[str]]:
        """The exit code, the output, and the listed problems."""
        script = self.root / ".github" / "scripts" / SCRIPT.name
        result = subprocess.run([sys.executable, str(script)], capture_output=True, text=True)
        problems = [line[4:] for line in result.stdout.splitlines() if line.startswith("  - ")]
        return result.returncode, result.stdout + result.stderr, problems

    def assert_problems(self, expected: dict[str, str]) -> None:
        """The check fails, listing exactly one problem per key of `expected`: the problem for the
        `metadata.toml` at that path, which contains the given text."""
        code, output, problems = self.run_check()
        self.assertEqual(code, 1, output)
        self.assertEqual(len(problems), len(expected), output)
        for path, text in expected.items():
            matching = [p for p in problems if p.startswith(f"{path}/metadata.toml: ")]
            self.assertEqual(len(matching), 1, f"{path}:\n{output}")
            self.assertIn(text, matching[0])

    def test_valid_tree(self) -> None:
        self.roadmap("TauCetiRoadmap/Alpha")
        self.roadmap("TauCetiRoadmap/Beta", "topic = 'math.AG'  # literal string\n")
        self.roadmap("TauCetiRoadmap/Beta/SubRoadmap", None)
        self.roadmap("Completed/Gamma", '"topic" = "math.\\u004eT"\n')
        (self.root / "TauCetiRoadmap" / "Scratch").mkdir()  # no README, so not a roadmap
        code, output, _ = self.run_check()
        self.assertEqual(code, 0, output)
        self.assertIn("Roadmap topics valid (3 roadmaps).", output)

    def test_missing_in_either_root(self) -> None:
        self.roadmap("TauCetiRoadmap/Alpha", None)
        self.roadmap("Completed/Gamma", None)
        self.roadmap("Completed/Delta")
        self.assert_problems({
            "TauCetiRoadmap/Alpha": "missing",
            "Completed/Gamma": "missing",
        })

    def test_schema(self) -> None:
        cases = {
            "Empty": ("", "no `topic`"),
            "Unquoted": ("topic = math.NT\n", "not valid TOML"),
            "Duplicate": ('topic = "math.NT"\ntopic = "math.AG"\n', "not valid TOML"),
            "NotUtf8": (b'topic = "math.NT\xff"\n', "not valid TOML"),
            "ExtraKey": ('topic = "math.NT"\nsubject = "math.AG"\n', "unknown key subject"),
            "Table": ('[topic]\ncode = "math.NT"\n', "must be a string"),
            "Number": ("topic = 3\n", "must be a string"),
            "List": ('topic = ["math.NT"]\n', "must be a string"),
            "UnknownClass": ('topic = "math.XX"\n', "'math.XX' is not an arXiv math class"),
        }
        for name, (metadata, _) in cases.items():
            self.roadmap(f"TauCetiRoadmap/{name}", metadata)
        self.assert_problems({f"TauCetiRoadmap/{name}": text for name, (_, text) in cases.items()})

    def test_hints(self) -> None:
        cases = {
            "Miscased": ("math.nt", "math.NT"),
            "Uppercase": ("MATH.AG", "math.AG"),
            "InformationTheory": ("cs.IT", "math.IT"),
            "MathematicalPhysics": ("math-ph", "math.MP"),
            "NumericalAnalysis": ("cs.NA", "math.NA"),
            "Statistics": ("stat.TH", "math.ST"),
        }
        expected = {}
        for i, (name, (topic, hint)) in enumerate(cases.items()):
            path = f"{('TauCetiRoadmap', 'Completed')[i % 2]}/{name}"
            self.roadmap(path, f'topic = "{topic}"\n')
            expected[path] = f"{topic!r} is not an arXiv math class; did you mean {hint!r}?"
        self.assert_problems(expected)

    def test_metadata_outside_a_roadmap_directory(self) -> None:
        self.roadmap("TauCetiRoadmap/Beta")
        self.roadmap("TauCetiRoadmap/Beta/SubRoadmap")
        self.roadmap("Completed/Gamma")
        (self.root / "Completed" / "Gamma" / "Deep" / "Er").mkdir(parents=True)
        (self.root / "Completed" / "Gamma" / "Deep" / "Er" / "metadata.toml").write_text(
            'topic = "math.NT"\n', encoding="utf-8")
        (self.root / "TauCetiRoadmap" / "Notes").mkdir()
        (self.root / "TauCetiRoadmap" / "Notes" / "metadata.toml").write_text(
            'topic = "math.NT"\n', encoding="utf-8")
        self.assert_problems({
            "TauCetiRoadmap/Beta/SubRoadmap": "only a roadmap directory carries",
            "Completed/Gamma/Deep/Er": "only a roadmap directory carries",
            "TauCetiRoadmap/Notes": "only a roadmap directory carries",
        })

    def test_failure_lists_the_classes(self) -> None:
        self.roadmap("TauCetiRoadmap/Alpha", None)
        _, output, _ = self.run_check()
        self.assertIn('topic = "math.NT"', output)
        self.assertIn("math.ST  Statistics Theory", output)


if __name__ == "__main__":
    unittest.main()
