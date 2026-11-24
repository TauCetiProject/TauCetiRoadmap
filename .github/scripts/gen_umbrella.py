#!/usr/bin/env python3
"""Generate the umbrellas in `umbrellas/` and their target lists from the roadmaps' READMEs.

An umbrella `umbrellas/NAME.toml` names the roadmap areas (top-level directories of
`TauCetiRoadmap/`) that one goal needs; the library worker reads it for
`--roadmap-only NAME`. Its target list `umbrellas/NAME-targets.md` breaks the goal into
items, one per section or layer of a roadmap, each naming the items it needs; the worker
reads it for `--roadmap-targets`. The worker's documentation defines both formats.

Every `umbrellas/*.toml` with a top-level key `root` is generated. `root` names a
directory of `TauCetiRoadmap/`; the goal is what the roadmaps under it state, and
everything that this needs, read from the READMEs:

- A unit is a section or a layer that a README defines: a heading or a bold label that
  starts with its id (`### 2.1 ...`, `## Layer 3: ...`, `- **B1.2** ...`), or a line a
  citation resolves to (an id in a heading's parenthesis, a paragraph labelled by the id,
  item n of the numbered list under the id `P` for `P.n`).
- The text of a unit runs from its definition to the next heading of the same or a higher
  level; a bold label's text ends at the next heading or at the next bold label of the
  same or a higher level (fewer dots in its id).
- A dependency comes only from a statement of dependency. A section needs what the
  `*Needs:*` and `*Prerequisites:*` lines in its text name (a line runs to the end of its
  paragraph): bare ids and `Layer k` are its own roadmap's, and citations
  (`Name §1.2`, `Name §§1.1–1.3 and 2.4`, `Name Layers 3 and 5`, `Name A5.3`, ...) another
  roadmap's; `Mathlib ...` and `Tau Ceti ...` name nothing, and stop the reading of local ids
  only to the next `;`, sentence, list item, table row or cell, or blank line (an ordinary
  sentence opener such as `The` or `For` is not taken for a name). A reference counts unless a
  cue governs it: a negation right before it (`no Layer 6 input`, `without using §0.16`) or a
  negated predicate right after it (`Layer 0 is not needed`), or a cue naming it a consumer (`§4.5
  consumes it`, `used by §§4.4 and 4.5`). A cue acts on the reference it governs, never on the
  rest of the sentence (`ASIDE_CUES`). A section without such a line
  needs what the `Dependencies` subsection of its layer cites of other roadmaps. The rest of
  the text (statements, routes, checks, examples, remarks) needs nothing.
- A layer that has sections is not an item: no pull request completes it as such, it is
  done when its sections are. A need of it is a need of each of its sections (and of the
  sections of the layers nested in it); a unit's need of the layer it is in creates
  nothing. A layer without sections is an item, the unit of work: it needs what the
  `*Needs:*` and `*Prerequisites:*` lines in its text name (under unnumbered subheadings
  too) and what its own `Dependencies` subsection cites or names of its own roadmap.
- A roadmap's name in code font or with the package prefix (`` `Name` ``,
  `` `TauCetiRoadmap.Name` ``, `TauCetiRoadmap.Name`) is read as the plain name.
- A roadmap named in words right before a sign (`§`, `Section`, `Layer`) is read as its name:
  the longest run of words that, without the spaces, hyphens and line break between them and
  with case ignored, is the name (`L-functions Layer 3` is `LFunctions Layer 3`, `Zeros of
  L-functions §2.1` is `ZerosOfLFunctions §2.1`); the README's own roadmap so named gives its
  own ids.
- The goal is every item of the root's roadmaps, with everything they need,
  transitively. The members of the umbrella are the areas that contain a unit the goal
  needs; its items are those units. Roadmaps under `Completed/` are known to the reader,
  so that their citations are read as citations, but they are never members or items,
  and a citation of one needs nothing.
- An item is named `<Roadmap>.<id>` (`<Roadmap>.Layer<k>` for a layer) from its README
  alone, so that a citation added or removed elsewhere never renames it: by the id its
  heading or label starts with (the other ids of the line, such as `(A1.1)`, are aliases
  that citations resolve through, shown in the item's text), by its paragraph's label, by
  its place `P.n` in the numbered list under the id `P`, or, for a heading with no leading
  id, by the first id in its parenthesis (`Roadmap.unit_name`). An id may go on with
  `:word` parts (`### AI.0:integral.1`, `## Layer AI.0:integral: ...`); the slug writes the
  colon `-` (`AInfCohomology.AI.0-integral.1`), the item's text keeps the README's spelling.

The target list is acyclic, as the worker requires. A dependency stated on the first sentence
of a unit's own `*Needs:*` or `*Prerequisites:*` line outranks any other (later sentences,
`Dependencies` subsections). Inside each strongly connected component the cycles among the
stated dependencies alone are broken first: a dependency is kept when it points to a unit
earlier in a fixed order (area with the root's last, roadmap, end of the unit's text). A
stated dependency on a later unit is then tried again, the nearest first, and kept unless it
would close a cycle with what is kept. Then each other dependency is added in the same way,
those pointing to an earlier unit first. So no dependency is dropped that could be put back
on its own. The dropped ones are listed. `needs:` lists every stated
dependency that survives: none is left out because another need implies it, since a need may
be done (merged, or ticked) out of order. `serves:` names the roadmaps under the root whose
units need the item directly.

Regeneration keeps what an operator records in the target list: an item's mark (`[x]`,
`[~]`) and the clauses of its trailing group the generator does not write (`partial: #N`),
by slug, the clauses placed before `needs:`. Check mode compares the file with what
generation from the READMEs and that recorded state gives, so a change that only ticks
items passes. A slug that is no longer an item loses its state, and `--fix` and `--stats`
name it.

    python3 .github/scripts/gen_umbrella.py           # check: exit 1 if a file is stale
    python3 .github/scripts/gen_umbrella.py --fix     # write the files
    python3 .github/scripts/gen_umbrella.py --stats   # counts and problems; writes nothing

It reads only this checkout and needs Python 3.11 or later, for `tomllib`.
"""

from __future__ import annotations

import bisect
import collections
import json
import pathlib
import re
import sys
import textwrap
import tomllib

ROOT = pathlib.Path(__file__).resolve().parents[2]
ROADMAP_DIR = "TauCetiRoadmap"
COMPLETED_DIR = "Completed"
UMBRELLA_DIR = "umbrellas"
SCRIPT = ".github/scripts/gen_umbrella.py"
MARKER = "<!-- tauceti-targets:v1 -->"
DESC_MAX = 110     # characters of an item's description
SERVES_MAX = 3     # roadmaps named in an item's `serves:` clause
WRAP = 100         # width of the generated prose
UNRESOLVED_SHOWN = 20


# --- the citation reader -----------------------------------------------------------------------
#
# The base pattern reads a roadmap's name followed by its FIRST id: `Name §1.2`, `Name §§1.2`,
# `Name Layer 3`, `Name A1.2`. `read_citations` reads on from the end of each match: lists
# (`, 2.3`, ` and 3.5`, `, and §3.5`, `, Layers 4, 5`), ranges (`§§2.1–2.9`, `AL.3.2.1–AL.3.3.2`),
# clause labels (`6.2a (a)`) and a list wrapped onto the next line. It also reads starts the base
# pattern misses, each with its own form:
#   bare      `Name 1.4, 4.4`, `Name SR.5.2`, `Name C.6`, `Name 7a`, `Name K3` (no section sign)
#   lowlayer  `Name layer 9`
#   paren     `Name (§§1.9, 2.49)`
#   marked    `**Name** §1.1`, `` `Name` §1.1 ``
#   reverse   `§3.4 of Name`, `Layer 9 of Name`
# Every id it returns is looked up in the cited README; one that README does not define is
# reported and needs nothing.

# An id may go on with `:word` parts, a word of lower-case letters and hyphens, each followed by
# further `.n` parts: `AI.0:integral.1`, `Layer AI.0:integral`, `E5:cotangent-export.2`.
COLON_PART = r":[a-z]+(?:-[a-z]+)*(?:\.[0-9A-Za-z](?:[\w.]*[0-9A-Za-z])?)?"
COLON = r"(?:" + COLON_PART + r")*"
CITE_TAIL = (r",?\s+(?:§§?\s?(?P<sec>[0-9A-Za-z](?:[\w.]*[0-9A-Za-z])?" + COLON + r")|Layers?\s+(?P<layer>\d+)"
             r"|(?P<pre>[A-Z]{1,3}\d+(?:\.[0-9A-Za-z]+)+" + COLON + r"))")
TOK = r"[0-9A-Za-z](?:[0-9A-Za-z.]*[0-9A-Za-z])?" + COLON    # an id after a separator (no `_`, no `-`)
HYPH = r"[A-Z]{1,4}-[A-Z]{0,2}\d+[a-z]?(?:\.\d+[a-z]?)*(?![\w-]|\.\w)"   # `OI-B30`, `C-1.1`
SIGNED_TOK = r"[0-9A-Za-z](?:[\w.]*[0-9A-Za-z])?" + COLON   # an id after a section sign
GAP = r"[ \t]*(?:\n[ \t>]*)?"                           # spaces, at most one line break
CLAUSE = re.compile(r"[ \t]?\((?:[a-z]|[ivx]{1,5}|\d{1,2}|[a-z]?\d?′{1,2}|[a-z]\d)\)")   # (a) (ii) (3)
ASIDE = re.compile(r"[ \t]?\([^()\n]{0,240}\)")         # a descriptive parenthetical inside a list
LIST_SEP = re.compile(r"(?:," + GAP + r"(?:and" + GAP + r")?|[ \t]+and" + GAP + r"|[ \t]*&[ \t]*)")
RANGE_SEP = re.compile(r"(?:[ \t]*–" + GAP + r"|-)")
SIGN = re.compile(r"§§?[ \t]?")
LAYER_WORD = re.compile(r"[Ll]ayers?[ \t]+")
OWN_AFTER = re.compile(r"[ \t]+(?:(?:of|in)[ \t]+(?:this|the[ \t]+present)\b|here\b|below\b|above\b)")
LETTERS = re.compile(r"^[A-Za-z]*")
# `3`, `6A`, `7c`, `AL.2`, `SR.2a`, `AI.0:integral`
LAYER_ID = r"(?:[A-Z]{1,4}\.?)?\d+(?:\.\d+)*[A-Za-z]{0,2}(?![\w])" + COLON
# The base pattern reads `Layers?\s+(\d+)` with no boundary after the digits: `Layer 6A` is Layer 6.
LAYER_SUFFIX = re.compile(r"(?:(?:\.\d+)*[A-Za-z]{1,2}(?![\w])|(?:\.\d+)+(?![\w]))" + COLON
                          + r"|(?:" + COLON_PART + r")+")
SIGNED_TOK_RE = re.compile(SIGNED_TOK)
TOK_RE = re.compile(TOK)
LAYER_ID_RE = re.compile(LAYER_ID)
HYPH_OR_TOK_RE = re.compile(HYPH + "|" + TOK)
WORDS = re.compile(r"[A-Za-z0-9]+")


def has_digit(t: str) -> bool:
    return any(c.isdigit() for c in t)


def prefix(t: str) -> str:
    return LETTERS.match(t).group(0)


def name_alternation(names) -> str:
    """The names as a regex alternation, the longest first."""
    return "|".join(map(re.escape, sorted(set(names), key=lambda n: (-len(n), n))))


def cite_pattern(names) -> re.Pattern | None:
    """The base pattern for citations of the roadmaps `names`; None when there are none."""
    return re.compile(r"\b(" + name_alternation(names) + r")\b" + CITE_TAIL) if names else None


def cited_id(m: re.Match) -> tuple[str, bool]:
    """(the cited id, whether it is a layer) of a `cite_pattern` match."""
    return (m.group("layer") or m.group("sec") or m.group("pre")).rstrip("."), bool(m.group("layer"))


class Cite:
    """One id a README cites: `line` is where the id is written, `pos` the offset in the README
    where the citation begins (the roadmap's name, or the sign of `§3.4 of Name`); `form` records
    how it was read."""

    __slots__ = ("citer", "line", "pos", "cited", "kind", "id", "form", "range_of", "at")

    def __init__(self, citer, line, pos, cited, kind, ident, form, range_of=None, at=None):
        self.citer, self.line, self.pos, self.cited = citer, line, pos, cited
        self.kind, self.id, self.form, self.range_of = kind, ident, form, range_of
        self.at = at                     # the offset of the id itself, when it is written there


def _line_of(starts: list[int], pos: int) -> int:
    return bisect.bisect_right(starts, pos)


def _accept(tok: str, prev: str, kind: str, signed: bool) -> bool:
    """Whether a token after a list separator continues the list (and is not prose)."""
    if not has_digit(tok):
        return False
    if kind == "layer":
        return bool(LAYER_ID_RE.fullmatch(tok)) or (prefix(prev) != "" and prefix(tok) == prefix(prev))
    if tok[0].isdigit():
        return signed or "." in tok or tok[-1].isalpha()
    return prefix(tok) == prefix(prev) or (signed and "." in tok)


def _continue(text: str, pos: int, first: str, kind: str, signed: bool):
    """The ids that continue a citation whose first id ends at `pos`:
    [(kind, id, start, range_of, how)]."""
    out, prev = [], first
    while True:
        p = pos
        m = CLAUSE.match(text, p)
        if m:
            p = m.end()
        # a range: `–id` (en dash, spaces allowed) or `-id` (hyphen, no spaces)
        r = RANGE_SEP.match(text, p)
        if r:
            q = r.end()
            s = SIGN.match(text, q)
            t = (SIGNED_TOK_RE if s else TOK_RE).match(text, s.end() if s else q)
            if t and _accept(t.group(0), prev, kind, signed or bool(s)) and not OWN_AFTER.match(text, t.end()):
                out.append((kind, t.group(0).rstrip("."), t.start(), prev, "range"))
                prev, pos = t.group(0), t.end()
                continue
        # a list separator, possibly after a descriptive parenthetical
        for skip in (None, ASIDE):
            q = p
            if skip is not None:
                a = skip.match(text, p)
                if not a:
                    continue
                q = a.end()
            sep = LIST_SEP.match(text, q)
            if not sep:
                continue
            q = sep.end()
            new_kind, new_signed = kind, signed
            s = SIGN.match(text, q)
            lw = LAYER_WORD.match(text, q)
            if s:
                q, new_kind, new_signed = s.end(), "section", True
                t = SIGNED_TOK_RE.match(text, q)
            elif lw:
                q, new_kind = lw.end(), "layer"
                t = LAYER_ID_RE.match(text, q)
            else:
                t = HYPH_OR_TOK_RE.match(text, q)
            if not t or OWN_AFTER.match(text, t.end()):
                continue
            tok = t.group(0).rstrip(".")
            if (s or lw) and has_digit(tok) or _accept(tok, prev, kind, signed):
                out.append((new_kind, tok, t.start(), None, "explicit" if (s or lw) else "implicit"))
                kind, signed, prev, pos = new_kind, new_signed, tok, t.end()
                break
        else:
            return out


def extra_patterns(names) -> list[tuple[str, re.Pattern]]:
    alt = name_alternation(names)
    return [
        ("lowlayer", re.compile(r"\b(" + alt + r")\b,?[ \t]+layers?[ \t]+(?P<layer>" + LAYER_ID + ")")),
        ("prefixlayer", re.compile(r"\b(" + alt + r")\b,?[ \t]+Layers?[ \t]+(?P<layer>[A-Z]{1,4}\.?\d+(?:\.\d+)*"
                                   r"[A-Za-z]{0,2}(?![\w])" + COLON + r")")),
        ("bare", re.compile(r"\b(" + alt + r")\b[ \t]+(?P<tok>" + HYPH + "|" + TOK + r")(?![\w])")),
        ("paren", re.compile(r"\b(" + alt + r")\b[ \t]+\((?:§§?[ \t]?(?P<sec>" + SIGNED_TOK + r")|Layers?[ \t]+"
                             r"(?P<layer>" + LAYER_ID + "))")),
        ("marked", re.compile(r"(?:\*\*|`)(?:[A-Za-z]+/)?(" + alt + r")(?:\*\*|`),?[ \t]+\(?(?:§§?[ \t]?(?P<sec>"
                              + SIGNED_TOK + r")|Layers?[ \t]+(?P<layer>" + LAYER_ID + "))")),
        # `Name (its Conventions and Layers SR.0–SR.5)`, `Name (Conventions, and Layer AG2.0, ...)`
        ("conventions", re.compile(r"\b(" + alt + r")\b,?[ \t]+\(?(?:its[ \t]+)?Conventions,?[ \t]+and[ \t]+"
                                   r"(?:§§?[ \t]?(?P<sec>" + SIGNED_TOK + r")|Layers?[ \t]+(?P<layer>"
                                   + LAYER_ID + "))")),
        # `Name, "Layer 9: the Cartan, ..."`: a heading quoted after the name
        ("quoted", re.compile(r"\b(" + alt + r")\b,?[ \t]+\"(?:§§?[ \t]?(?P<sec>" + SIGNED_TOK + r")|Layers?[ \t]+"
                              r"(?P<layer>" + LAYER_ID + "))")),
        ("reverse", re.compile(r"(?:§[ \t]?(?P<sec>" + SIGNED_TOK + r")|\bLayer[ \t]+(?P<layer>" + LAYER_ID
                               + r"))[ \t]+of[ \t]+(?:the[ \t]+roadmap[ \t]+)?(" + alt + r")\b")),
    ]


def opener(match_text: str) -> str:
    """How a citation opens: `§§`, `§`, `Layers`, `Layer` or `bare` (an id with no sign)."""
    if "§§" in match_text:
        return "§§"
    if "§" in match_text:
        return "§"
    m = re.search(r"\b[Ll]ayers?\b", match_text)
    return m.group(0).capitalize() if m else "bare"


def _bare_ok(tok: str) -> bool:
    """A bare token after a roadmap name that reads as a section id: `1.4`, `7a`, `10A`,
    `SR.5.2`, `C.6`, `K3`, `AG2.6`, `AG2.P`, `OI-B30`, `AI.0:integral.1`; not a year, a count or a word."""
    head, colon, rest = tok.partition(":")
    if colon and not re.fullmatch(COLON, colon + rest):
        return False
    tok = head
    if not has_digit(tok):
        return False
    if re.fullmatch(HYPH, tok):
        return True
    if tok[0].isdigit():
        return "." in tok or tok[-1].isalpha()
    return bool(re.fullmatch(r"[A-Z]{1,4}(?:\.[A-Z]+)*\.?\d+[a-z]?(?:\.\d+[a-z]?)*(?:\.[A-Z]{1,3})?", tok))


def read_citations(text: str, names: set[str], citer: str) -> list[Cite]:
    """Every id the README `text` of `citer` cites among the roadmaps `names`, one Cite per
    occurrence. Only names that occur in the text can match, so the patterns are built from
    those, and only lines holding one of them are scanned."""
    present = (set(WORDS.findall(text)) & names) - {citer}
    if not present:
        return []
    lines = text.split("\n")
    starts, pos = [], 0
    for line in lines:
        starts.append(pos)
        pos += len(line) + 1
    hit = set()
    for n in present:
        i = text.find(n)
        while i >= 0:
            hit.add(_line_of(starts, i))
            i = text.find(n, i + 1)
    hit = sorted(hit)
    pattern = cite_pattern(present)
    out: list[Cite] = []
    taken: set[int] = set()                      # offsets of names already read
    for no in hit:
        line, off = lines[no - 1], starts[no - 1]
        for m in pattern.finditer(line):
            first, layer = cited_id(m)
            kind = "layer" if layer else "section"
            taken.add(off + m.start())
            end, form = m.end(), "base"
            ext = LAYER_SUFFIX.match(line, m.end()) if layer else None
            if ext:                                      # `Layer 6A`: the base pattern read `6`
                first, end, form = first + ext.group(0), m.end() + len(ext.group(0)), "base+suffix"
            at = off + m.start()
            first_at = off + m.start("layer" if layer else "sec" if m.group("sec") else "pre")
            out.append(Cite(citer, no, at, m.group(1), kind, first, form, None, first_at))
            op = opener(m.group(0))
            for k, ident, p, rng, how in _continue(text, off + end, first, kind, bool(m.group("sec"))):
                out.append(Cite(citer, _line_of(starts, p), at, m.group(1), k, ident, f"list/{how}/{op}", rng, p))
    # a citation wrapped across one line break inside a paragraph (`... InductionRestriction` /
    # `Layer 2; ...`): the base pattern on the text with line breaks as spaces (same offsets)
    flat = text.replace("\n", " ")
    for m in pattern.finditer(flat):
        span = text[m.start():m.end()]
        if span.count("\n") != 1 or m.start() in taken:
            continue
        nxt = text[m.start() + span.index("\n") + 1:]
        if re.match(r"[ \t]*(?:$|\n|#|[-*+|>]\s|\d+\.\s)", nxt):
            continue
        first, layer = cited_id(m)
        kind = "layer" if layer else "section"
        no, ln = _line_of(starts, m.start()), _line_of(starts, m.end() - 1)
        taken.add(m.start())
        end = m.end()
        ext = LAYER_SUFFIX.match(text, m.end()) if layer else None
        if ext:
            first, end = first + ext.group(0), m.end() + len(ext.group(0))
        first_at = m.start("layer" if layer else "sec" if m.group("sec") else "pre")
        out.append(Cite(citer, ln, m.start(), m.group(1), kind, first, "wrapped", None, first_at))
        op = opener(m.group(0))
        for k, ident, p, rng, how in _continue(text, end, first, kind, bool(m.group("sec"))):
            out.append(Cite(citer, _line_of(starts, p), m.start(), m.group(1), k, ident, f"wrapped+list/{how}/{op}",
                            rng, p))
    for form, pat in extra_patterns(present):
        for no in hit:
            line, off = lines[no - 1], starts[no - 1]
            for m in pat.finditer(line):
                name = m.group(1) if form != "reverse" else m.group(m.lastindex)
                # a forward form is keyed by the name's offset (one reading per occurrence of a name);
                # a reverse one (`§3.4 of Name`) by the offset of its sign, negated, since the same
                # name may open a list after it
                npos = off + (m.start(1) if form != "reverse" else m.start())
                if npos in taken or (form == "reverse" and -npos in taken):
                    continue
                if form == "reverse":
                    npos = -npos
                if form == "bare":
                    tok = m.group("tok").rstrip(".")
                    if not _bare_ok(tok) or OWN_AFTER.match(line, m.end("tok")):
                        continue
                    kind, first, signed, end, group = "section", tok, False, m.end("tok"), "tok"
                elif form in ("lowlayer", "prefixlayer") or m.group("layer"):
                    kind, first, signed, end, group = "layer", m.group("layer"), False, m.end("layer"), "layer"
                else:
                    kind, first, signed, end, group = "section", m.group("sec").rstrip("."), True, m.end("sec"), "sec"
                taken.add(npos)
                at = off + m.start()
                out.append(Cite(citer, no, at, name, kind, first, form, None, off + m.start(group)))
                if form == "reverse":
                    continue
                op = opener(m.group(0))
                for k, ident, p, rng, how in _continue(text, off + end, first, kind, signed):
                    out.append(Cite(citer, _line_of(starts, p), at, name, k, ident, f"{form}+list/{how}/{op}", rng, p))
    return out


CODE_NAME = re.compile(r"`(?:TauCetiRoadmap\.)?([A-Za-z0-9]+)`")
PREFIXED_NAME = re.compile(r"\bTauCetiRoadmap\.([A-Za-z0-9]+)\b(?!\.\w)")


def plain_names(text: str, names: set[str]) -> str:
    """`text` with each roadmap name in code font or with the package prefix written plainly:
    `` `TauCetiRoadmap.Name` ``, `` `Name` `` and `TauCetiRoadmap.Name` become `Name`, with
    spaces in front so that the text keeps its length and the name ends where the original
    ended (`` `Name`, §1.2 `` reads as `Name, §1.2`). A Lean name (`` `TauCeti.Foo` ``,
    `TauCetiRoadmap.Name.Suggested`) is left alone."""
    def plain(m):
        name = m.group(1)
        return " " * (len(m.group(0)) - len(name)) + name if name in names else m.group(0)
    return PREFIXED_NAME.sub(plain, CODE_NAME.sub(plain, text))


# A roadmap named in words: a run of words that, joined without the spaces, hyphens and line break
# between them and with case ignored, is a roadmap's directory name, right before a sign
# (`L-functions Layer 3`, `Class field theory §2.1`, `Global Number Fields Sections 9.2`).
WORD_SIGN = re.compile(r"§|\b(?:Sections?|Layers?)\b")


def words_table(names) -> dict[str, str]:
    """Each roadmap's directory name by its key in words, its lower case (`lfunctions`); a key that
    two names share names neither."""
    table: dict[str, str | None] = {}
    for n in sorted(names):
        table[n.lower()] = None if n.lower() in table else n
    return {k: n for k, n in table.items() if n is not None}


def named_in_words(text: str, table: dict[str, str], own: str) -> str:
    """`text` with each roadmap named in words before a sign written as its directory name, so that
    every reader takes it as that name: `L-functions Layer 3` reads as `LFunctions Layer 3`. The run
    is the longest one before the sign that names a roadmap (`Zeros of L-functions` before
    `L-functions`); words join by spaces and hyphens, and white space follows the run, with at most
    one line break in all. The name ends where the run ended, the rest of the run becomes spaces and
    its line break stays before the name, so that offsets and the number of line breaks before each
    offset are kept. The README's own roadmap named in words is blanked out instead, so that the sign
    and the ids after it read as its own; a run written as the directory name is left as it is."""
    if not table:
        return text
    longest = max(map(len, table))
    pieces, done, floor = [], 0, 0
    for m in WORD_SIGN.finditer(text):
        i, breaks = m.start(), 0
        while i > floor and text[i - 1] in " \t\n":
            i -= 1
            breaks += text[i] == "\n"
        found, key, letters, end = None, "", 0, i
        while breaks <= 1:
            k = i
            while k > floor and text[k - 1].isalnum():
                k -= 1
            if k == i or letters + i - k > longest or not text[k:i].isascii() or (k > 0 and text[k - 1] in "_."):
                break
            key, letters = text[k:i].lower() + key, letters + i - k
            if key in table:
                found = (k, table[key])
            # the joiner before the word: spaces and hyphens, then at most a line break and spaces
            j = k
            while j > floor and text[j - 1] in " \t":
                j -= 1
            if j > floor and text[j - 1] == "\n":
                j -= 1
                breaks += 1
            while j > floor and text[j - 1] in " \t-":
                j -= 1
            if j == k:
                break
            i = j
        floor = m.end()
        if found is None or text[found[0]:end] == found[1]:
            continue
        start, name = found
        run = text[start:end]
        if name == own:
            new = re.sub(r"[^\n]", " ", run)
        else:
            gap = len(run) - len(name)
            line = min(run.find("\n"), gap - 1) if "\n" in run else -1
            new = (" " * gap if line < 0 else " " * line + "\n" + " " * (gap - line - 1)) + name
        pieces += [text[done:start], new]
        done = end
    return "".join(pieces) + text[done:] if pieces else text


def drop_ambiguous(cites: list[Cite], own_ids: set[str]) -> list[Cite]:
    """An id read from a list without its own sign after a singular or bare opener
    (`Name §2.5, and 3.4a follows`, `Name 1.4, 4.4`) is ambiguous when the citing README defines
    that id itself (`own_ids`): it may be the citer's own id, so the reading is dropped. After a
    plural opener (`§§`, `Layers`) the list is certain."""
    return [c for c in cites if not ("/implicit/" in c.form and c.form.rsplit("/", 1)[1] in ("§", "Layer", "bare")
                                     and c.kind == "section" and c.id in own_ids)]


# --- where a README defines an id --------------------------------------------------------------

HEADING = re.compile(r"^(#{1,6})\s+(.*?)\s*#*\s*$")
BOLD = re.compile(r"^\s*(?:[-*+]\s+|\d+\.\s+)?\*\*(.+?)\*\*(.*)$")
FENCE = re.compile(r"^\s*(```|~~~)")
KEYWORD = r"(?:(?:Layer|Section|Part|Step|Stage|Target|Theorem|Appendix)\s+)"
# where an id ends: a colon ends it unless a lower-case word follows (`AI.0:integral.1`)
END_OF_ID = r"(?=$|[\s,;)—–]|:(?![a-z])|\.(?:\s|$)|\*)"
END_RE = re.compile(END_OF_ID)
END_BRACKET_RE = re.compile(r"\]?" + END_OF_ID)
# what may come before the id in the three forms of `_id_at_start`
PLAIN_LEAD = re.compile(r"(?:§\s?)?\[?")
KEYWORD_LEAD = re.compile(r"(?:§\s?)?" + KEYWORD + r"§?\s?")
LAYER_LEAD = re.compile(r"(?:§\s?)?Layers?\s+")
PARA_LEAD = re.compile(r"\s*(?:[-*+]\s+)?§?")
ID_CHARS = re.compile(r"(?:[\w.\-]|:(?=[a-z]))+")
PAREN = re.compile(r"\(([^()]*)\)")
PAREN_COLON = re.compile(r"\(([^()]*)\):\s")
ORDERED_ID = re.compile(r"\s*(?:§\s?)?(?:" + KEYWORD + r")?§?\[?(" + TOK + r")\]?" + END_OF_ID)
NUMBERED = re.compile(r"\s*(\d+)\.\s+(.*)")


class _Span:
    """The span of a match found without a pattern: the part of a match object callers read."""

    __slots__ = ("_start", "_end")

    def __init__(self, start: int, end: int):
        self._start, self._end = start, end

    def start(self) -> int:
        return self._start

    def end(self) -> int:
        return self._end


def _id_at_start(s: str, ident: str, layer: bool, keyword: bool):
    """A match, at the start of `s`, of `Layer` and the id (layer), a keyword and the id
    (keyword: `Section 2.1`), or the id after an optional section sign or bracket, followed by
    the end of an id (`END_OF_ID`); its `end()` is where the id (or its closing bracket) ends.
    An id never holds what may come before it (`§`, `[`, spaces), so the leading part matches
    greedily and the id is compared as a string: no pattern is compiled for each id."""
    s = s.lstrip()
    lead = LAYER_LEAD if layer else KEYWORD_LEAD if keyword else PLAIN_LEAD
    m = lead.match(s)
    if not m or not s.startswith(ident, m.end()):
        return None
    return (END_RE if layer or keyword else END_BRACKET_RE).match(s, m.end() + len(ident))


def _paren_parts(content: str):
    """The ids a parenthesis with this content names, as `(id)`, `(…, id)`, `(§id; …)` do."""
    parts = re.split(r"[,;]", content)
    for i, part in enumerate(parts):
        q = part if i == 0 else part.lstrip()
        q = q[1:] if q.startswith("§") else q
        q = q.rstrip() if i < len(parts) - 1 else q
        if q:
            yield q


def _id_in_paren(s: str, ident: str):
    """The first parenthesis of `s` that names the id among its comma- or semicolon-separated
    parts, as a span from `(` to `)`."""
    for g in PAREN.finditer(s):
        if ident in _paren_parts(g.group(1)):
            return _Span(g.start(), g.end())
    return None


def _first_sentence(s: str) -> str:
    s = s.strip().lstrip(":.—–- ").strip()
    m = re.search(r"(?<=[^\s.])[.:;](?=\s|$)", s)
    return s[: m.start()] if m else s


def definitions(readme: str) -> list[tuple[int, str, str, str]]:
    """The README's lines outside code fences, as (line number, 'heading' | 'bold' | 'other',
    label, rest)."""
    out, fenced = [], False
    for no, line in enumerate(readme.split("\n"), 1):
        if FENCE.match(line):
            fenced = not fenced
            continue
        if fenced:
            continue
        h = HEADING.match(line)
        if h:
            out.append((no, "heading", h.group(2), ""))
            continue
        b = BOLD.match(line)
        if b:
            out.append((no, "bold", b.group(1), b.group(2)))
            continue
        out.append((no, "other", line, ""))
    return out


def _start_candidates(label: str, lead: re.Pattern, bracket: bool):
    """Every id `_id_at_start` could find at the start of `label` after `lead`: a superset,
    each candidate is checked again with `_id_at_start` itself."""
    s = label.lstrip()
    m = lead.match(s)
    if not m:
        return
    k = m.end()
    run = ID_CHARS.match(s, k)
    if not run:
        return
    end = END_BRACKET_RE if bracket else END_RE
    for j in range(k + 1, run.end() + 1):
        if end.match(s, j):
            yield s[k:j]


def _paren_candidates(label: str):
    """Every id `_id_in_paren` finds in `label`."""
    for g in PAREN.finditer(label):
        yield from _paren_parts(g.group(1))


def _paragraph_candidates(line: str):
    """Every id a paragraph labelled by it (`2.2.3. Prove ...`) could carry (a superset)."""
    m = PARA_LEAD.match(line)
    k = m.end()
    run = ID_CHARS.match(line, k)
    if not run:
        return
    for j in range(k + 1, min(run.end() + 1, len(line))):
        if line[j] in ".:":
            yield line[k:j]


class Readme:
    """A roadmap's README with the indexes that make `find_definition` fast. The lookups keep
    the priorities of a plain scan: a heading that starts with the id; a heading that starts
    with a keyword and the id (`## Layer SR.0: ...`); a heading naming the id in a parenthesis
    (`### 5a.2 Title (C5a.2)`); a bold label that starts with it; a bold label naming it in a
    parenthesis (`- **Layer 3 (K3):** ...`); a paragraph labelled by it; a paragraph opening
    with its target and the id in a parenthesis before a colon; for `P.n`, item n of the
    numbered list under P's heading or label. Each try takes the first line in README order."""

    def __init__(self, text: str):
        self.text = text
        self.lines = text.split("\n")
        self.starts = [0]                          # the offset of each line
        for line in self.lines[:-1]:
            self.starts.append(self.starts[-1] + len(line) + 1)
        self.rows = definitions(text)
        self._index = None
        self._ordered = None
        self._labels = None
        self._cache: dict[tuple[str, bool], tuple | None] = {}

    def index(self):
        if self._index is None:
            idx = {k: collections.defaultdict(list) for k in
                   ("hplain", "hkey", "hlayer", "hparen", "bplain", "bkey", "blayer", "bparen", "para", "lead")}
            for i, (_no, kind, label, _rest) in enumerate(self.rows):
                if kind == "other":
                    for c in set(_paragraph_candidates(label)):
                        idx["para"][c].append(i)
                    for g in PAREN_COLON.finditer(label):
                        idx["lead"][g.group(1)].append(i)
                    continue
                h = "h" if kind == "heading" else "b"
                for c in set(_start_candidates(label, PLAIN_LEAD, True)):
                    idx[h + "plain"][c].append(i)
                for c in set(_start_candidates(label, KEYWORD_LEAD, False)):
                    idx[h + "key"][c].append(i)
                for c in set(_start_candidates(label, LAYER_LEAD, False)):
                    idx[h + "layer"][c].append(i)
                for c in set(_paren_candidates(label)):
                    idx[h + "paren"][c].append(i)
            self._index = idx
        return self._index

    def label_lines(self) -> list[tuple[int, str]]:
        """(index, line) of the lines that start with a heading or a bold label."""
        if self._labels is None:
            self._labels = [(i, line) for i, line in enumerate(self.lines)
                            if line.lstrip().startswith(("#", "**", "- **", "* **"))]
        return self._labels

    def ordered_ids(self) -> list[tuple[int, str]]:
        """(line, id) of every heading or bold label that starts with a section id, in order."""
        if self._ordered is None:
            self._ordered = []
            for no, kind, label, _rest in self.rows:
                if kind in ("heading", "bold"):
                    m = ORDERED_ID.match(label)
                    if m and has_digit(m.group(1)):
                        self._ordered.append((no, m.group(1)))
        return self._ordered

    def _first(self, keys: tuple[str, ...], ident: str, test):
        """The first row (in README order) among the candidates of `keys` that passes `test`."""
        idx = self.index()
        for i in sorted({i for k in keys for i in idx[k].get(ident, ())}):
            m = test(self.rows[i][2])
            if m:
                return i, m
        return None

    def find_definition(self, ident: str, layer: bool):
        """(line number, line, title, how) of the line that defines the id, or None."""
        key = (ident, layer)
        if key not in self._cache:
            self._cache[key] = self._find(ident, layer)
        return self._cache[key]

    def _find(self, ident: str, layer: bool):
        rows, lines = self.rows, self.lines
        if layer:
            tries = [("heading", ("hlayer",), lambda s: _id_at_start(s, ident, True, False)),
                     ("bold", ("blayer",), lambda s: _id_at_start(s, ident, True, False))]
        else:
            tries = [("heading", ("hplain",), lambda s: _id_at_start(s, ident, False, False)),
                     ("heading", ("hkey",), lambda s: _id_at_start(s, ident, False, True)),
                     ("heading-paren", ("hparen",), lambda s: _id_in_paren(s, ident)),
                     ("bold", ("bplain", "bkey"),
                      lambda s: _id_at_start(s, ident, False, False) or _id_at_start(s, ident, False, True)),
                     ("bold-paren", ("bparen",), lambda s: _id_in_paren(s, ident))]
        for how, keys, test in tries:
            found = self._first(keys, ident, test)
            if not found:
                continue
            i, m = found
            no, kind, label, rest = rows[i]
            if how.endswith("paren"):
                # the label without the parenthesis and without its own leading id
                core = (label[: m.start()] + label[m.end():]).strip()
                core = re.sub(r"^(?:§\s?)?(?:" + KEYWORD + r")?§?(?=[\w.]*\d)[0-9A-Za-z][\w.]*(?=[\s:.)—–]|$)",
                              "", core, count=1)
                title = core.strip(" :.—–-*")
                if kind == "bold" and not title:
                    title = _first_sentence(rest)
            else:
                title = label.lstrip()[m.end():].strip(" :.—–-")
                if kind == "bold" and not title.strip(" *"):
                    title = _first_sentence(rest)
            return no, lines[no - 1], title, how
        if layer:
            return None
        # a paragraph labelled by the id (`2.2.3. Prove ...`): the title is its first clause
        idx = self.index()
        para = None
        if ident in idx["para"]:
            para = re.compile(r"\s*(?:[-*+]\s+)?§?" + re.escape(ident) + r"[.:]\s+(\S.*)")
        found = self._first(("para",), ident, para.match) if para else None
        if found:
            i, m = found
            return rows[i][0], lines[rows[i][0] - 1], _first_sentence(m.group(1)), "paragraph"
        # a paragraph that opens with its target and the id in a parenthesis before a colon
        # (`Define `normalizedHermitianCount` (3.2.1): ...`): the title is that opening clause
        lead = re.compile(r"\s*(?:[-*+]\s+)?([A-Z](?:[^.;:()`]|`[^`\n]*`){0,150}?)\s*\(" + re.escape(ident)
                          + r"\):\s") if ident in idx["lead"] else None
        found = self._first(("lead",), ident, lead.match) if lead else None
        if found:
            i, m = found
            return rows[i][0], lines[rows[i][0] - 1], m.group(1), "paragraph-paren"
        parent, _, last = ident.rpartition(".")
        if parent and last.isdigit():
            n = int(last)
            heads = sorted({i for k in ("hplain", "hkey", "bplain", "bkey") for i in idx[k].get(parent, ())})
            for i in heads:
                no, kind, label, _rest = rows[i]
                if not (_id_at_start(label, parent, False, False) or _id_at_start(label, parent, False, True)):
                    continue
                count = 0
                for j in range(no, len(lines)):
                    nxt = lines[j]
                    if nxt.startswith("#"):
                        break
                    mm = NUMBERED.match(nxt)
                    if mm:
                        count += 1
                        if count == n and int(mm.group(1)) == n:
                            return j + 1, nxt, _first_sentence(mm.group(2)), "enumerated"
        return None

    def expand_range(self, a: str, b: str, layer: bool) -> list[str] | None:
        """The ids of a range `a–b`: for layers the layer headings from a to b at the level of a,
        with the letter prefix of a and b; for sections the ids of the same shape (number of
        dot-separated parts, letter prefix) that the README defines between a and b, in order."""
        if layer:
            if prefix(a) != prefix(b):
                return None
            heads = []
            for no, kind, label, _ in self.rows:
                m = re.match(r"\s*Layers?\s+(" + LAYER_ID + r")", label) if kind == "heading" else None
                if m:
                    src = self.lines[no - 1]
                    heads.append((no, m.group(1), len(src) - len(src.lstrip("#"))))
            pos = {i: (no, lvl) for no, i, lvl in reversed(heads)}
            if a not in pos or b not in pos or pos[a][0] >= pos[b][0] or pos[a][1] != pos[b][1]:
                return None
            out = []
            for no, i, lvl in heads:
                if pos[a][0] <= no <= pos[b][0] and lvl == pos[a][1] and prefix(i) == prefix(a) and i not in out \
                        and id_key(a) <= id_key(i) <= id_key(b):
                    out.append(i)
            return out
        da, db = self.find_definition(a, False), self.find_definition(b, False)
        if not da or not db or da[0] >= db[0] or len(a.split(".")) != len(b.split(".")):
            return None
        ids, seen = [], set()
        for no, ident in self.ordered_ids():
            if da[0] <= no <= db[0] and len(ident.split(".")) == len(a.split(".")) \
                    and prefix(ident) in (prefix(a), prefix(b)) and ident not in seen \
                    and (prefix(a) != prefix(b) or id_key(a) <= id_key(ident) <= id_key(b)):
                seen.add(ident)
                ids.append(ident)
        for e in (a, b):
            if e not in seen:
                ids.append(e)
        return ids


def id_key(ident: str) -> tuple:
    """The numeric order of an id without its letter prefix: `7c` -> ((7, 'c'),),
    `SR.2a` -> ((2, 'a'),), `2.10` -> ((2, ''), (10, ''))."""
    rest = ident[len(prefix(ident)):].lstrip(".")
    return tuple((int(n), x.lower()) for n, x in re.findall(r"(\d+)([A-Za-z]*)", rest))


# --- whether a README has an id at all (for the report on ids that do not resolve) ------------

CAMEL = r"[A-Z][a-z0-9]+(?:[A-Z][A-Za-z0-9]*)+"
FOREIGN = re.compile(CAMEL + r",?\s*$")      # text ending in a roadmap name: what follows is its id


def _enumerated(rd: Readme, parent: str, n: int) -> bool:
    """Whether the section headed by `parent` (a heading or bold label naming it) has at least n
    numbered items before the next heading."""
    tok = re.compile(r"(?<![\w.])§?\s?" + re.escape(parent) + r"(?![\w])")
    lines = rd.lines
    for i, line in rd.label_lines():
        if line.lstrip().startswith(("#", "**")) and tok.search(line):
            items = 0
            for following in lines[i + 1:]:
                if following.startswith("#"):
                    break
                if re.match(r"\s*\d+\.\s", following):
                    items += 1
            if items >= n:
                return True
    return False


def present(rd: Readme, token: str, layer: bool = False) -> bool:
    """The id occurs in the README: literally, or as item N of the numbered list under the heading
    or label of its parent id (`B1.4` is the fourth item under `## B1. Principal bundles`)."""
    if layer:
        return re.search(r"\bLayers?\s+" + re.escape(token) + r"\b", rd.text) is not None
    if re.search(r"(?<![\w.])" + re.escape(token) + r"(?![\w])", rd.text):
        return True
    parent, _, last = token.rpartition(".")
    return bool(parent and last.isdigit()) and _enumerated(rd, parent, int(last))


def defined(rd: Readme, token: str, layer: bool = False) -> bool:
    """The id occurs in a heading or a bold label, not right after another roadmap's name, or it
    is item N of the numbered list under its parent id."""
    tok = re.compile((r"\bLayers?\s+" + re.escape(token) + r"(?!\d)") if layer else
                     (r"(?<![\w.])" + re.escape(token) + r"(?![\w])"))
    for _i, line in rd.label_lines():
        if any(not FOREIGN.search(line[:m.start()].rstrip("§ ")) for m in tok.finditer(line)):
            return True
    parent, _, last = token.rpartition(".")
    return not layer and bool(parent and last.isdigit()) and _enumerated(rd, parent, int(last))


def why_unresolved(rd: Readme, ident: str, layer: bool) -> str:
    """Why an id does not resolve in the README `rd`, for the report."""
    if defined(rd, ident, layer):
        return "in a heading or label, in a form the reader does not take as its definition"
    if present(rd, ident, layer):
        return "mentioned in the README, never defined"
    return "not in the README"


# --- titles ------------------------------------------------------------------------------------

def _drop_parens(s: str) -> str:
    """Remove parenthetical asides (`Title (Bombieri–Gubler 6.4.2)` -> `Title`); a parenthesis
    right after a symbol (`L(s, χ)`) becomes square brackets, keeping its argument."""
    prev = None
    while prev != s:
        prev = s
        s = re.sub(r"(?<=[^\s(\[])\(([^()]*)\)", r"[\1]", s)
        s = re.sub(r"\s*\([^()]*\)", "", s)
    return s.replace("(", "").replace(")", "")


def clean_title(s: str) -> str:
    s = re.sub(r"<a\s+[^>]*>\s*</a>", "", s)
    s = re.sub(r"<[^>]+>", "", s)
    s = re.sub(r"!?\[([^\]]*)\]\([^)]*\)", r"\1", s)           # [text](url)
    s = re.sub(r"\[([^\]]*)\]\[[^\]]*\]", r"\1", s)            # [text][ref]
    s = s.replace("`", "").replace("**", "").replace("__", "").replace("$", "")
    s = re.sub(r"(?<![\w*])\*(?=\S)(.+?)(?<=\S)\*(?![\w*])", r"\1", s)   # *italic*
    s = re.sub(r"(?<![\w])_(?=\S)(.+?)(?<=\S)_(?![\w])", r"\1", s)        # _italic_
    s = _drop_parens(s)
    s = s.replace(" — ", ": ").replace("—", "-") if " — " in s else s.replace("—", "-")
    s = re.sub(r"\s+", " ", s).strip(" :;,.-–")
    s = re.sub(r"\s+([,;:.])", r"\1", s)
    return s


def description(label: str, title: str, sep: str) -> str:
    """`label` (`§1.2`, `Layer 3`) and the title, joined as the README's headings join them, at
    most DESC_MAX characters. The roadmap's name is not repeated: the slug carries it."""
    title = clean_title(title)
    d = f"{label}{sep}{title}".strip() if title else label
    if len(d) > DESC_MAX:
        cut = d[: DESC_MAX - 1]
        cut = cut[: cut.rfind(" ")] if " " in cut[len(label) + 1:] else cut
        d = cut.rstrip(" ,;:.-–") + "…"
    return d


def make_slug(roadmap: str, kind: str, ident: str) -> str:
    """`<Roadmap>.<id>` or `<Roadmap>.Layer<id>` in the worker's slug alphabet: the colon of an
    id's `:word` part is written `-`, any other character outside it is dropped."""
    raw = f"{roadmap}.Layer{ident}" if kind == "layer" else f"{roadmap}.{ident}"
    return re.sub(r"[^A-Za-z0-9_.-]", "", raw.replace(":", "-"))


def valid_slug(slug: str) -> bool:
    """The worker's slug rule: letters, digits, `_`, `-`, `.`; a letter or digit first; no `..`;
    no trailing `.` or `.lock`."""
    return bool(re.fullmatch(r"[A-Za-z0-9][A-Za-z0-9._-]*", slug)) and ".." not in slug \
        and not slug.endswith((".", ".lock"))


# --- the roadmaps and their units --------------------------------------------------------------

class Unit:
    """A section or a layer (`kind`): the line that defines it and the span of its text. A
    structural unit (a heading, or a bold label in a heading's unit, that starts with its own id)
    owns the lines of its text that no unit nested in it owns; a unit found only through a
    citation owns no lines."""

    __slots__ = ("roadmap", "line", "level", "own", "kind", "end", "structural", "children", "parent", "how")

    def __init__(self, roadmap, line, level, own, kind, end, structural, how):
        self.roadmap, self.line, self.level, self.own, self.kind = roadmap, line, level, own, kind
        self.end, self.structural, self.how = end, structural, how
        self.children: list[Unit] = []
        self.parent: Unit | None = None


class Ref:
    """A reference from a README to a unit: a citation of another roadmap's id (`citation`), or
    an id of the README's own roadmap on a `*Needs:*` or `*Prerequisites:*` line; `pos` is where it
    begins in the
    README. `target` is None when the id does not resolve (`why` then holds what the report
    needs to say why) or names a completed roadmap (`why` is "completed")."""

    __slots__ = ("pos", "target", "key", "citation", "where", "what", "why")

    def __init__(self, pos, target, key, citation, where, what, why=None):
        self.pos, self.target, self.key, self.citation = pos, target, key, citation
        self.where, self.what, self.why = where, what, why     # `Citer:line` and the id as cited


class Roadmap:
    def __init__(self, name: str, area: str, rel: str, text: str, completed: bool):
        self.name, self.area, self.rel, self.completed = name, area, rel, completed
        self.readme = Readme(text)
        self._units: dict[int, Unit] | None = None
        self.extra: dict[int, Unit] = {}         # units found only through a citation, by line
        self.owner: list[Unit | None] = []
        self.refs: list[Ref] | None = None
        self.needs: list[tuple[int, int, int]] = []    # (line, start, end) of each *Needs:* text
                                                       # (or *Prerequisites:* text)
        self.statements: dict[tuple[str, int], list] = {}   # (source, start) -> its clauses
        self._heads = self._kinds = self._deps = self._leading = None

    def heading_rows(self) -> list[tuple[int, int]]:
        """(line, level) of every heading outside code fences."""
        lines = self.readme.lines
        return [(no, len(lines[no - 1]) - len(lines[no - 1].lstrip("#")))
                for no, kind, _l, _r in self.readme.rows if kind == "heading"]

    def units(self) -> dict[int, Unit]:
        """The structural units, by line, with their spans, nesting and the owner of each line.
        A heading defines a unit when it starts with an id that resolves to it. A bold label
        does when, besides, it sits in the text of a heading's unit and its id starts with a
        digit or has a dot (`4b.`, `1.2`, `SR.2.1`, or `Layer k`): bold keys of reference lists,
        corrections and summaries (`- **BMS1**:`, `**E1**`) are not units, though a citation
        may still resolve to one."""
        if self._units is not None:
            return self._units
        rd = self.readme
        heads = self.heading_rows()
        head_lines = [no for no, _ in heads]
        level_of = dict(heads)

        def defines(no, label):
            own = own_label(label)
            if own is None:
                return None
            d = rd.find_definition(own[1], own[0] == "layer")
            return own if d is not None and d[0] == no else None   # else another line has the priority

        found: list[Unit] = []
        for no, kind, label, _rest in rd.rows:
            own = defines(no, label) if kind == "heading" else None
            if own:
                u = Unit(self, no, level_of[no], own, own[0], len(rd.lines), True, "heading")
                # a heading's text ends before the next heading of the same or a higher level
                for nxt, lvl in heads[bisect.bisect_right(head_lines, no):]:
                    if lvl <= u.level:
                        u.end = nxt - 1
                        break
                found.append(u)
        inside = [False] * (len(rd.lines) + 2)       # lines in the text of a heading's unit
        for u in found:
            inside[u.line + 1:u.end + 1] = [True] * (u.end - u.line)
        bold: list[Unit] = []
        for no, kind, label, _rest in rd.rows:
            if kind != "bold" or not inside[no]:
                continue
            own = defines(no, label)
            if own and (own[0] == "layer" or own[1][0].isdigit() or "." in own[1]):
                level = 7 + (0 if own[0] == "layer" else 1 + own[1].count("."))
                bold.append(Unit(self, no, level, own, own[0], len(rd.lines), True, "bold"))
        # a bold label's text ends before the next heading or the next bold label of the same or a
        # higher level
        for u in bold:
            i = bisect.bisect_right(head_lines, u.line)
            stop = [heads[i][0]] if i < len(heads) else []
            stop += [b.line for b in bold if b.line > u.line and b.level <= u.level][:1]
            if stop:
                u.end = min(stop) - 1
        found += bold
        # nesting: the spans nest, so the owner of a line is the innermost unit whose span holds it
        self.owner = [None] * (len(rd.lines) + 2)
        stack: list[Unit] = []
        by_line = {u.line: u for u in found}
        for line in range(1, len(rd.lines) + 1):
            while stack and stack[-1].end < line:
                stack.pop()
            u = by_line.get(line)
            if u is not None:
                if stack:
                    stack[-1].children.append(u)
                    u.parent = stack[-1]
                stack.append(u)
            self.owner[line] = stack[-1] if stack else None
        self._units = by_line
        return by_line

    def unit_at(self, line: int, how: str) -> Unit:
        """The unit defined at `line`: the structural one, or a unit found through a citation,
        whose text ends at the next heading of its level (for a heading), the next heading or
        bold label (for a bold label), the next numbered item (for an item of a numbered list),
        or the end of its paragraph."""
        units = self.units()
        if line in units:
            return units[line]
        if line in self.extra:
            return self.extra[line]
        rd = self.readme
        lines = rd.lines
        self.row(line)
        heads, kinds = self._heads, self._kinds
        row = kinds.get(line, ("other", ""))
        level = heads.get(line, 7 if row[0] == "bold" else 8)
        own = own_label(row[1]) if row[0] != "other" else None
        end = len(lines)
        for no in range(line + 1, len(lines) + 1):
            text = lines[no - 1]
            kind = kinds.get(no, ("",))[0]
            if kind == "heading":
                if level <= 6 and heads[no] > level:
                    continue
                end = no - 1
                break
            if level <= 6:
                continue
            if kind == "bold" or no in units:
                end = no - 1
                break
            if how == "enumerated" and NUMBERED.match(text):
                end = no - 1
                break
            if how.startswith("paragraph") and (not text.strip() or LABELLED.match(text)):
                end = no - 1
                break
        u = Unit(self, line, level, None, "layer" if own and own[0] == "layer" else "section", end, False, how)
        self.extra[line] = u
        return u

    def row(self, line: int) -> tuple[str, str]:
        """(kind, label) of a line outside code fences: 'heading', 'bold' or 'other'."""
        if self._kinds is None:
            self._heads = dict(self.heading_rows())
            self._kinds = {no: (kind, label) for no, kind, label, _r in self.readme.rows}
        return self._kinds.get(line, ("other", ""))

    def leading(self) -> collections.Counter:
        """How many headings of the README start with each id."""
        if self._leading is None:
            owns = (own_label(label) for _no, kind, label, _r in self.readme.rows if kind == "heading")
            self._leading = collections.Counter(own for own in owns if own)
        return self._leading

    def unit_name(self, u: Unit) -> tuple[tuple[str, str] | None, str, list[str]]:
        """The unit's name as its README alone gives it, how it was found, and the other ids of
        its line (its aliases, which citations resolve through as well):
          'own'      the id its heading or label starts with, the id that labels its paragraph
                     (`2.2.3. Prove ...`), or for item n of the numbered list under the id P, `P.n`;
          'alias'    without a leading id, an id in the heading's parenthesis (`(3A, 3B)`: `3A`)
                     or before the colon of `Define X (3.2.1): ...`;
          'ordinal'  a leading id that another heading of the README has first, with no alias:
                     the id and its place among those headings (`GS4-2`);
        None when the line names no id that resolves to it. How the unit is cited plays no part,
        so a citation added or removed elsewhere never renames it."""
        rd = self.readme

        def here(ident: str, layer: bool = False) -> bool:
            d = rd.find_definition(ident, layer)
            return d is not None and d[0] == u.line

        kind, label = self.row(u.line)
        line = rd.lines[u.line - 1]
        if kind != "other":
            own = own_label(label)
            aliases = [c for c in dict.fromkeys(_paren_candidates(label))
                       if has_digit(c) and (own is None or c != own[1]) and here(c)]
            if own and here(own[1], own[0] == "layer"):
                return own, "own", aliases
            if aliases:
                return ("section", aliases[0]), "alias", aliases[1:]
            if own:
                same = [no for no, k, lab, _r in rd.rows if k == "heading" and own_label(lab) == own]
                place = same.index(u.line) + 1 if u.line in same else len(same) + 1
                return (own[0], f"{own[1]}-{place}"), "ordinal", []
            starts = [c for c in set(_start_candidates(label, PLAIN_LEAD, True))
                      | set(_start_candidates(label, KEYWORD_LEAD, False))
                      if has_digit(c) and c[-1].isalnum() and here(c)]
            if starts:
                return ("section", max(starts, key=lambda c: (len(c), c))), "own", []
        m = NUMBERED.match(line)
        if m:
            # item n of the numbered list under the id P: `P.n`, P being the heading above it (the
            # section) or else a label between that heading and the item, the nearest first
            labels = []
            for no, k, lab, _r in reversed([r for r in rd.rows if r[0] < u.line]):
                if k == "heading" or (k == "bold" and not NUMBERED.match(rd.lines[no - 1])):
                    labels.append(lab)
                if k == "heading":
                    break
            for lab in labels[-1:] + labels[:-1]:
                parents = [own_label(lab)[1]] if own_label(lab) else []
                parents += sorted((c for c in set(_start_candidates(lab, PLAIN_LEAD, True))
                                   if has_digit(c) and c[-1].isalnum()), key=lambda c: (-len(c), c))
                for parent in parents:
                    if here(f"{parent}.{m.group(1)}"):
                        return ("section", f"{parent}.{m.group(1)}"), "own", []
        if kind == "other":
            # a paragraph labelled by its id (`2.2.3. Prove ...`; a bare number is a list's own)
            for c in sorted(set(_paragraph_candidates(line)), key=lambda c: (-len(c), c)):
                if not c.isdigit() and here(c):
                    return ("section", c), "own", []
            for g in PAREN_COLON.finditer(line):
                if here(g.group(1)):
                    return ("section", g.group(1)), "alias", []
        else:
            # last, the word a heading or label starts with, if it resolves to the line
            starts = [c for c in set(_start_candidates(label, PLAIN_LEAD, True)) if c[-1:].isalnum() and here(c)]
            if starts:
                return ("section", max(starts, key=lambda c: (len(c), c))), "own", []
        return None, "", []

    def layer_of(self, u: Unit) -> Unit | None:
        """The layer whose text holds the unit: its nearest enclosing structural layer."""
        w = u.parent if u.structural else self.owner[u.line]
        while w is not None and w.kind != "layer":
            w = w.parent
        return w

    def contents(self, layer: Unit) -> list[Unit]:
        """The units a layer contains: the structural units in its text that no other layer in
        it holds (a layer nested in it stands for its own sections)."""
        out = []
        for v in self.units().values():
            if v is layer or not layer.line < v.line <= layer.end:
                continue
            w = v.parent
            while w is not None and w is not layer and w.line > layer.line and w.kind != "layer":
                w = w.parent
            if w is None or w is layer or w.line <= layer.line:
                out.append(v)
        return sorted(out, key=lambda v: v.line)

    def dependency_subsections(self) -> list[tuple[int, int, int, int]]:
        """(line, level, start, end) of every `Dependencies` subsection: the offsets of its text,
        from the line after its heading to the next heading of the same or a higher level."""
        if self._deps is None:
            rd = self.readme
            heads = self.heading_rows()
            self._deps = []
            for i, (no, lvl) in enumerate(heads):
                if HEADING.match(rd.lines[no - 1]).group(2).strip() != "Dependencies":
                    continue
                end = len(rd.lines)
                for nxt, nl in heads[i + 1:]:
                    if nl <= lvl:
                        end = nxt - 1
                        break
                start = rd.starts[no] if no < len(rd.lines) else len(rd.text)
                self._deps.append((no, lvl, start, max(start, rd.starts[end - 1] + len(rd.lines[end - 1]))))
        return self._deps

    def dependency_spans(self, layer: Unit) -> list[tuple[int, int]]:
        """The offsets of each `Dependencies` subsection in the text of a layer."""
        return [(a, b) for no, lvl, a, b in self.dependency_subsections()
                if layer.line < no <= layer.end and lvl > layer.level]


LABELLED = re.compile(r"\s*(?:[-*+]\s+)?§?[0-9A-Za-z][\w.\-]*[.:]\s+\S")


def own_label(label: str) -> tuple[str, str] | None:
    """The id a heading or bold label starts with: ('layer', k) for `Layer k`, ('section', id)
    for an id, or a keyword and an id (`Section 2.1`); None when it starts with neither."""
    for lead, kind in ((LAYER_LEAD, "layer"), (PLAIN_LEAD, "section"), (KEYWORD_LEAD, "section")):
        ids = [c for c in _start_candidates(label, lead, lead is PLAIN_LEAD) if has_digit(c) and c[-1].isalnum()]
        if ids:
            return kind, max(ids, key=len)
    return None


def read_tree(root: pathlib.Path) -> tuple[dict[str, Roadmap], dict[str, Roadmap], list[str]]:
    """Every roadmap under TauCetiRoadmap/ (any depth) and under Completed/, by name; the
    completed roadmaps whose name an active roadmap also has; and the problems met. Two active
    roadmaps, or two completed ones, of one name stop the generator: a citation could not tell
    them apart. A completed roadmap that shares its name with an active one is kept apart: the
    name means the active roadmap, and the completed one is consulted only for ids the active
    one does not define."""
    roadmaps: dict[str, Roadmap] = {}
    shadowed: dict[str, Roadmap] = {}
    problems: list[str] = []
    for top, completed in ((ROADMAP_DIR, False), (COMPLETED_DIR, True)):
        base = root / top
        if not base.is_dir():
            continue
        for path in sorted(base.rglob("README.md")):
            folder = path.parent
            if folder == base or not path.is_file():
                continue
            rel = folder.relative_to(root).as_posix()
            name = folder.name
            data = path.read_bytes()
            try:
                text = data.decode("utf-8")
            except UnicodeDecodeError as e:
                problems.append(f"{rel}/README.md is not valid UTF-8 ({e}); read with replacement characters")
                text = data.decode("utf-8", "replace")
            rm = Roadmap(name, folder.relative_to(base).parts[0], rel, text, completed)
            other = roadmaps.get(name) or shadowed.get(name)
            if other is not None and other.completed == completed:
                raise SystemExit(f"two roadmaps are named {name}: {other.rel} and {rel}; "
                                 "a citation could not tell them apart")
            if other is not None:
                shadowed[name] = rm
                problems.append(f"{rel} has the name of the active {other.rel}: citations of {name} are read "
                                "as the active roadmap's, except ids only the completed one defines")
                continue
            roadmaps[name] = rm
    return roadmaps, shadowed, problems


# --- references: citations, *Needs:* and *Prerequisites:* lines ----------------------------------

# a statement of dependency: `*Needs:*` or `*Prerequisites:*`, in italics or in bold
NEEDS_LABEL = re.compile(r"(?:\*(?:Needs|Prerequisites):\*|\*\*(?:Needs|Prerequisites):\*\*)(?=\s|$)")
NEXT_LABEL = re.compile(r"\s\*{1,2}[A-Z][\w ’'-]{0,40}:\*{1,2}")
BLOCK_START = re.compile(r"\s*(?:#|[-*+]\s|\d+\.\s|```|~~~|>|\|)")
# a line that opens with a label: bold (`**Checks.**`) or an italic word with a colon (`*Source:*`);
# a wrapped line of a list that opens with an italic title (`*Dagger spaces*;`) goes on
LINE_LABEL = re.compile(r"\s*(?:[-*+]\s+|\d+\.\s+)?(?:\*\*[^\s*]|\*[A-Z][\w ’'-]{0,40}:\*)")
# Where a reading of local ids stopped by an outside name resumes: `;`, a blank line, the start
# of a list item, a table's row or cell, and the end of a sentence (a full stop followed by white space and a capital,
# `§`, a backtick, `*`, `(` or the end; never the full stop of an id such as `1.2`, nor that of an
# abbreviation such as `e.g.`)
STRETCH_BREAK = re.compile(r";|\||\n[ \t]*\n|\n(?=[ \t]*(?:[-*+]|\d+\.)\s|[ \t]*\|)")
FULL_STOP = re.compile(r"\.(?=\s+[A-Z§*(`\x00\x01]|\s*$)")
ABBREVIATION = re.compile(r"(?<![\w.])(?:e\.g|i\.e|[cC]f|resp|Thm|Prop|Sect|Lem|Cor|Def|Rem|Ex|Eq|Ch|Fig"
                          r"|[vV]ol|pp?|[nN]o)$")
NEEDS_TOKEN = re.compile(r"(?P<sign>§§?|\bSections?\b)\s?|(?P<layer>\b[Ll]ayers?\b)"
                         r"|(?P<range>[ \t]*[–-][ \t]*)|(?P<sep>,|\band\b|&)"
                         r"|(?P<id>" + HYPH + "|" + SIGNED_TOK + r")|(?P<stop>\x00)|(?P<code>\x01)|(?P<other>\S)")
REVERSE_OF = re.compile(r"\s+(?:the\s+roadmap\s+)?[A-Z\x00]")     # after `of`: `§3.4 of Name`


def _masked(text: str) -> str:
    """`text` with spans in backticks and parenthesised asides blanked out, offsets kept."""
    text = re.sub(r"`[^`\n]*`", lambda m: " " * len(m.group(0)), text)
    prev = None
    while prev != text:
        prev = text
        text = re.sub(r"\([^()]*\)", lambda m: " " * len(m.group(0)), text)
    return text


def needs_spans(rd: Readme) -> list[tuple[int, int, int]]:
    """(line, start, end) of the text of every `*Needs:*` or `*Prerequisites:*` label outside
    code fences, as offsets in the README. The text runs from the label to the end of its
    paragraph (a blank line, a heading, a line that opens with a bold or italic label, a list
    item, a fence, a quote or a table ends it), all its sentences, and is cut at the next label
    in the line (`*Lean:*`); a label in an aside in parentheses or in backticks does not cut it."""
    out = []
    lines, starts = rd.lines, rd.starts
    for no, _kind, _label, _rest in rd.rows:
        line = lines[no - 1]
        if ":*" not in line:
            continue
        for m in NEEDS_LABEL.finditer(line):
            j = no
            while j < len(lines) and lines[j].strip() and not BLOCK_START.match(lines[j]) \
                    and not LINE_LABEL.match(lines[j]):
                j += 1
            a = starts[no - 1] + m.end()
            b = starts[j - 1] + len(lines[j - 1])
            found = NEXT_LABEL.search(_masked(rd.text[a:b]))
            out.append((no, a, a + found.start() if found else b))
    return out


# The cues that set a reference in a statement of dependency aside, so that it creates no need.
# They act on the reference they govern, never on the rest of its clause. This is a deliberate,
# closed list: a word that is not here sets nothing aside, however the sentence reads. A reference
# counts unless such a cue governs it.
ASIDE_CUES = {
    # a negation right before the reference (`no Layer 6 input`, `without using §0.16`,
    # `independently of §8.7`), the words in "skipped" passed over
    "negation": ("no", "not", "nor", "neither", "never", "without", r"independent(?:ly)?"),
    "skipped": ("the", "any", "a", "an", "of"),
    # a verb right before the reference, negated by the word before it (`does not consume Layer 6`)
    "negated verb": ("consumes?", "uses?", "using", "needs?", "requires?", "imports?", r"built\s+on"),
    # a predicate right after the reference (`Layer 0 is not needed`)
    "negated predicate": (r"(?:is|are|was|were)\s+not", r"(?:is|are)\s+never",
                          r"(?:is|are)\s+(?:unnecessary|unneeded)"),
    # the reference is the consumer: right after it a verb whose object is the present unit
    # (`§§4.4 and 4.5 consume it`) ...
    "consumer verb": ("consumes?", "uses?", "needs?", "requires?", r"depends?\s+on", r"rel(?:y|ies)\s+on",
                      r"builds?\s+on", "imports?", "appl(?:y|ies)", "calls?", "invokes?", "speciali[sz]es?",
                      "extends?", "refines?"),
    "the present unit": ("it", "this", "them", "these", r"the\s+present"),
    # ... or before it a phrase naming what follows a consumer (`used by §§4.4 and 4.5`): the list of
    # references that follows the phrase, up to a reference that opens a statement of its own
    "consumer phrase": (r"consumed\s+by", r"used\s+by", r"needed\s+by", r"required\s+by", r"imported\s+by",
                        r"cited\s+by", r"feeds(?:\s+into)?", "serves", r"consumers?\s*:", "downstream"),
    "opens a statement": ("consumes?", "uses?", "needs?", "requires?", "feeds", "serves", "supplies", "provides",
                          "gives", "states", "proves", "owns", "is", "are", "was", "were", "has", "have"),
}


def _cue(words) -> str:
    return r"(?:" + "|".join(words) + r")"


SIGN_BEFORE = r"(?:§§?\s?|\bSections?\s+|\b[Ll]ayers?\s+)?"     # between a cue and an id of its own roadmap
NEGATED_BEFORE = re.compile(r"(?:\b" + _cue(ASIDE_CUES["negation"]) + r"(?:\s+" + _cue(ASIDE_CUES["negated verb"])
                            + r")?|\b(?:not|without)\s+" + _cue(ASIDE_CUES["negated verb"]) + r")(?:\s+"
                            + _cue(ASIDE_CUES["skipped"]) + r")*\s*" + SIGN_BEFORE + "$", re.I)
NEGATED_AFTER = re.compile(r"\s*" + _cue(ASIDE_CUES["negated predicate"]) + r"\b", re.I)
CONSUMER_AFTER = re.compile(r"\s*,?\s*" + _cue(ASIDE_CUES["consumer verb"]) + r"\s+"
                            + _cue(ASIDE_CUES["the present unit"]) + r"\b", re.I)
CONSUMER_PHRASE = re.compile(r"\b" + _cue(ASIDE_CUES["consumer phrase"]) + r"(?!\w)", re.I)
OPENS_STATEMENT = re.compile(r"\s*" + _cue(ASIDE_CUES["opens a statement"]) + r"\b", re.I)
LIST_GAP = re.compile(r"[\s,]*(?:(?:and|or|&)[\s,]*)?" + SIGN_BEFORE)    # what joins the references of a list

# Words capitalised only because they open a sentence or an entry: after one of these the reading of
# local ids goes on (any other capitalised word is taken for an outside name and stops it). A
# closed list.
SENTENCE_OPENERS = frozenset((
    "The", "This", "These", "Those", "That", "It", "Its", "For", "From", "In", "On", "With", "Within",
    "Uses", "Use", "Using", "Also", "And", "Only", "All", "Each", "Every", "Both", "Here", "See", "As", "By",
    "At", "To", "When", "Where", "If", "Any", "Some", "Then", "Thus", "Hence", "There", "Their", "Our", "We",
    "Together", "Via", "Over", "Under", "After", "Before", "Once", "While", "Since", "But", "Or",
))
ASIDE_SPAN = re.compile(r"\((?:[^()\n]|\n(?![ \t]*\n))*\)")  # an aside, over a line break but not a paragraph
ITALIC = re.compile(r"(?<!\*)\*(?!\*)(?:[^*\n]|\n(?![ \t]*\n))+?(?<!\*)\*(?!\*)")


class Clause:
    """A stretch of a statement of dependency between two boundaries (`;`, the end of a sentence,
    a list item, a table's row or cell, a blank line): its offsets in the README, the number of
    the sentence it is in, the ids of its own roadmap it names as (kind, id, start of a range or
    None, offset), and `aside`: the references set aside, by the offset where each begins, with
    the rule ('negation' or 'consumer') and the words of the cue."""

    __slots__ = ("start", "end", "sentence", "ids", "aside")

    def __init__(self, start, end, sentence, ids, aside):
        self.start, self.end, self.sentence, self.ids, self.aside = start, end, sentence, ids, aside


def _blank(m: re.Match) -> str:
    return " " * len(m.group(0))


def _prepared(text: str, names: set[str]) -> str:
    """`text` as the reader of local ids sees it, offsets kept: a span in backticks becomes a stop
    (a roadmap's name) or a mark that is passed over (a Lean name), an aside in parentheses is
    blanked out, and a bracketed source key or a parenthesis left open becomes a stop."""
    def code(m: re.Match) -> str:
        name = re.split(r"[/.]", m.group(1).strip())[-1] in names
        return ("\x00" if name else "\x01") + " " * (len(m.group(0)) - 1)
    text = re.sub(r"`([^`]*)`", code, text)
    prev = None
    while prev != text:
        prev = text
        text = ASIDE_SPAN.sub(_blank, text)
    return re.sub(r"\[[^\]\n]*\]|[()]", lambda m: "\x00" + " " * (len(m.group(0)) - 1), text)


def _cue_text(text: str) -> str:
    """The words a clause says itself, offsets kept: spans in backticks, asides in parentheses and
    titles in italics (`*Interpolation does not determine ...*`) are blanked out."""
    text = re.sub(r"`[^`]*`", _blank, text)
    prev = None
    while prev != text:
        prev = text
        text = ASIDE_SPAN.sub(_blank, text)
    return ITALIC.sub(_blank, text)


def clause_ids(part: str, names: set[str]) -> list[tuple[str, str, str | None, int]]:
    """The ids of the README's own roadmap that one clause names, as (kind, id, start of a range
    or None, offset in the clause). An id counts when it follows `§`, `§§`, `Section`, `Layer` or
    `Layers` (directly or through a list) or reads as a section id on its own (`1.2`, `2.4a`,
    `D4.3`). Reading stops, for the rest of the clause, at a roadmap's name (the citation reader
    reads another roadmap's ids), at any other capitalised word (`Mathlib`, `Tau Ceti`, a roadmap
    written in words) that is not an ordinary sentence opener (`SENTENCE_OPENERS`), and at a stop
    of `_prepared`. Past a sentence opener only an id after a sign (`§`, `Section`, `Layer`) is
    read, since a bare id there is as often the subject of the sentence as a need. The ids right
    before `of Name` (`§3.4 of Name`, `§§3.4 and 3.5 of Name`) are not its own."""
    out = []
    kind, mode, prev_id, rng = "section", None, None, False
    run: list[tuple[str, str, str | None, int]] = []      # the ids of the list being read
    opened = False                        # past a sentence opener, only an id after a sign is read
    for t in NEEDS_TOKEN.finditer(part):
        g = t.lastgroup
        if g == "code":
            continue
        if g in ("sign", "layer"):
            out += run
            run = []
            kind, mode = ("section", "sign") if g == "sign" else ("layer", "layer")
            prev_id, rng = None, False
        elif g == "range":
            rng = prev_id is not None
        elif g == "sep":
            rng = False
            if prev_id is None:               # a sign with no id after it (`the layer, 1.4`) governs nothing
                kind, mode = "section", None
        elif g == "id":
            tok = t.group("id").rstrip(".")
            if tok in names or (not has_digit(tok) and tok[0].isupper() and tok not in ("Layer", "Layers")
                                and tok not in SENTENCE_OPENERS):
                break
            opened = opened or tok in SENTENCE_OPENERS
            if has_digit(tok) and (mode is not None or (_bare_ok(tok) and not opened)):
                run.append((kind, tok, prev_id if rng else None, t.start()))
                prev_id = tok
            else:
                if tok == "of" and REVERSE_OF.match(part, t.end()):
                    run = []                      # `§3.4 of Name`: the list is the other roadmap's
                out += run
                run = []
                kind, mode, prev_id = "section", None, None
            rng = False
        elif g == "stop":
            break
        else:
            out += run
            run = []
            kind, mode, prev_id, rng = "section", None, None, False
    return out + run


def statement_clauses(text: str, a: int, b: int, names: set[str],
                      cites: list[tuple[int, int]]) -> list[Clause]:
    """The clauses of the statement of dependency `text[a:b]` (a `*Needs:*` or `*Prerequisites:*`
    paragraph, or a `Dependencies` subsection), `cites` being the sorted (start, end) offsets of
    the citations of other roadmaps (from the name to the last id). References joined only by
    `,`, `and` or `or` form a list. A list is set aside, so that it creates no need, when a
    negation governs it from the left (`no Layer 6 input`, `does not consume Layer 6`, `without
    using §0.16`), when a negated predicate follows it (`Layer 0 is not needed`), or when it is
    the consumer: a verb with the present unit for object follows it (`§§4.4 and 4.5 consume it`),
    or it follows a consumer phrase (`used by §§4.4 and 4.5`, `D0.16 feeds D0.22`). `ASIDE_CUES`
    lists the words; what they do not govern counts."""
    seg = text[a:b]
    prepared, words = _prepared(seg, names), _cue_text(seg)
    pieces, sentence, pos = [], 0, 0
    for brk in [*STRETCH_BREAK.finditer(prepared), None]:
        end = brk.start() if brk else len(prepared)
        start = pos
        for stop in FULL_STOP.finditer(prepared, pos, end):
            if not ABBREVIATION.search(prepared, 0, stop.start()):
                pieces.append((start, stop.start(), sentence))
                start, sentence = stop.end(), sentence + 1
        pieces.append((start, end, sentence))
        if brk:
            pos = brk.end()
            sentence += brk.group(0) not in (";", "|")    # `;` divides a sentence, it does not end it
    out = []
    for start, end, sentence in pieces:
        ids = [(k, i, r, a + start + off) for k, i, r, off in clause_ids(prepared[start:end], names)]
        lo = bisect.bisect_left(cites, (a + start, -1))
        hi = bisect.bisect_left(cites, (a + end, -1))
        refs = sorted({(p - a - start, e - a - start) for p, e in cites[lo:hi]}
                      | {(p - a - start, p - a - start + len(i)) for _k, i, _r, p in ids})
        said = words[start:end]
        aside: dict[int, tuple[str, str]] = {}
        # the lists: references joined only by `,`, `and`, `or`
        lists, current = [], []
        for ref in refs:
            if current and not LIST_GAP.fullmatch(said[current[-1][1]:ref[0]]):
                lists.append(current)
                current = []
            current.append(ref)
        if current:
            lists.append(current)
        for group in lists:
            first, last = group[0][0], max(e for _s, e in group)
            cue = (NEGATED_BEFORE.search(said, 0, first), NEGATED_AFTER.match(said, last),
                   CONSUMER_AFTER.match(said, last))
            rule = "negation" if cue[0] or cue[1] else "consumer" if cue[2] else None
            if rule:
                found = next(c for c in cue if c)
                for ref in group:
                    aside[a + start + ref[0]] = (rule, " ".join(found.group(0).split()))
        # a consumer phrase governs the references that follow it, up to one that opens a statement
        for phrase in CONSUMER_PHRASE.finditer(said):
            after = [ref for ref in refs if ref[0] >= phrase.end()]
            for i, ref in enumerate(after):
                if i and (not LIST_GAP.fullmatch(said[after[i - 1][1]:ref[0]])
                          or OPENS_STATEMENT.match(said, ref[1])):
                    break
                aside.setdefault(a + start + ref[0], ("consumer", " ".join(phrase.group(0).split())))
        out.append(Clause(a + start, a + end, sentence, ids, aside))
    return out


class Tree:
    """The roadmaps of a checkout and the references their READMEs make."""

    def __init__(self, root: pathlib.Path):
        self.root = root
        self.roadmaps, self.shadowed, self.problems = read_tree(root)
        self.active = {n for n, r in self.roadmaps.items() if not r.completed}
        self.names = set(self.roadmaps)
        self.words = words_table(self.names)
        self.area_size = collections.Counter(r.area for r in self.roadmaps.values() if not r.completed)
        self.ranges_kept: list[str] = []
        self._why: dict[tuple, str] = {}

    def why(self, ref: Ref) -> str:
        """Why the id of `ref` does not resolve (computed for the report only)."""
        rm, ident, layer = ref.why
        key = (rm.name, rm.completed, ident, layer)
        if key not in self._why:
            self._why[key] = why_unresolved(rm.readme, ident, layer)
        return self._why[key]

    def resolve(self, rm: Roadmap, kind: str, ident: str):
        """(unit, kind) of the id in the README of `rm`, or None. A layer id that no layer heading
        carries (`Layer 10B`) is looked up as a section."""
        d = rm.readme.find_definition(ident, kind == "layer")
        if d is None and kind == "layer" and not ident.isdigit():
            d = rm.readme.find_definition(ident, False)
            kind = "section"
        if d is None:
            return None
        u = rm.unit_at(d[0], d[3])
        if kind == "section" and u.own == ("layer", ident):
            kind = "layer"                        # `Name AG2.5` for the heading `## Layer AG2.5: ...`
        return u, kind

    def refs(self, rm: Roadmap) -> list[Ref]:
        """Every citation the README of `rm` makes, and the ids of its own that its `*Needs:*` and
        `*Prerequisites:*` lines and its `Dependencies` subsections name, in the order of the
        README."""
        if rm.refs is not None:
            return rm.refs
        rm.units()
        rd = rm.readme
        out: list[Ref] = []
        own_ids = {i for _, i in rd.ordered_ids()}
        text = named_in_words(plain_names(rd.text, self.names), self.words, rm.name)
        cites = drop_ambiguous(read_citations(text, self.names, rm.name), own_ids)
        expanded = []
        for c in cites:
            target = self.roadmaps[c.cited]
            if c.range_of is None or target.completed:
                continue
            ids = target.readme.expand_range(c.range_of, c.id, c.kind == "layer")
            if ids is None:
                self.ranges_kept.append(f"{rm.name}:{c.line}: {c.cited} {c.range_of}–{c.id}")
                continue
            expanded += [Cite(c.citer, c.line, c.pos, c.cited, c.kind, i, "range", c.range_of)
                         for i in ids if i not in (c.range_of, c.id)]
        for c in cites + expanded:
            target = self.roadmaps[c.cited]
            what = f"{c.cited} {label_of(c.kind, c.id)}"
            where = f"{rm.name}:{c.line}"
            r = None if target.completed else self.resolve(target, c.kind, c.id)
            namesake = self.shadowed.get(c.cited)
            if target.completed or (r is None and namesake is not None
                                    and self.resolve(namesake, c.kind, c.id) is not None):
                out.append(Ref(c.pos, None, None, True, where, what, "completed"))
            elif r is None:
                out.append(Ref(c.pos, None, None, True, where, what, (target, c.id, c.kind == "layer")))
            else:
                out.append(Ref(c.pos, r[0], (r[1], c.id), True, where, what))
        rm.needs = needs_spans(rd)
        # each statement of dependency in clauses, and the ids of its own roadmap that a clause
        # names, at their offsets (from a `Dependencies` subsection these count only for a layer
        # item: a section takes other roadmaps' units from there)
        ends: dict[int, int] = {}
        for c in cites:
            ends[c.pos] = max(ends.get(c.pos, c.pos), (c.at + len(c.id)) if c.at is not None else c.pos)
        cite_pos = sorted(ends.items())
        spans = [("*Needs:*", no, a, b) for no, a, b in rm.needs]
        spans += [("Dependencies", no, a, b) for no, _lvl, a, b in rm.dependency_subsections()]
        rm.statements = {}
        for source, no, a, b in spans:
            clauses = statement_clauses(text, a, b, self.names, cite_pos)
            rm.statements[(source, a)] = clauses
            for clause in clauses:
                for kind, ident, start, at in clause.ids:
                    items = []
                    if start is not None:
                        ids = rd.expand_range(start, ident, kind == "layer")
                        if ids is None:
                            if at not in clause.aside:
                                self.ranges_kept.append(f"{rm.name}:{no}: {source} {start}–{ident}")
                        else:
                            items += [(kind, i) for i in ids if i not in (start, ident)]
                    items.append((kind, ident))
                    for kind2, ident2 in items:
                        what = f"{rm.name} {label_of(kind2, ident2)} ({source})"
                        r = self.resolve(rm, kind2, ident2)
                        if r is None:
                            out.append(Ref(at, None, None, False, f"{rm.name}:{no}", what,
                                           (rm, ident2, kind2 == "layer")))
                        else:
                            out.append(Ref(at, r[0], (r[1], ident2), False, f"{rm.name}:{no}", what))
        out.sort(key=lambda r: r.pos)
        rm.refs = out
        return out


# --- the goal of one umbrella ------------------------------------------------------------------

def label_of(kind: str, ident: str) -> str:
    return f"Layer {ident}" if kind == "layer" else f"§{ident}"


def strongly_connected(nodes: list, edges: dict) -> list[list]:
    """The strongly connected components of a graph (Tarjan's algorithm, without recursion)."""
    index, low, on_stack, stack, out = {}, {}, set(), [], []
    counter = 0
    for start in nodes:
        if start in index:
            continue
        work = [(start, 0)]
        while work:
            v, i = work.pop()
            if i == 0:
                index[v] = low[v] = counter
                counter += 1
                stack.append(v)
                on_stack.add(v)
            succ = edges[v]
            if i < len(succ):
                work.append((v, i + 1))
                w = succ[i]
                if w not in index:
                    work.append((w, 0))
                elif w in on_stack:
                    low[v] = min(low[v], index[w])
                continue
            if low[v] == index[v]:
                comp = []
                while True:
                    w = stack.pop()
                    on_stack.discard(w)
                    comp.append(w)
                    if w is v:
                        break
                out.append(comp)
            if work:
                parent = work[-1][0]
                low[parent] = min(low[parent], low[v])
    return out


# An item line as the worker reads it: a mark, the slug as the first backtick token, and a trailing
# group of `key: value` clauses separated by `;`.
ITEM_LINE = re.compile(r"^\s*-\s*\[([ xX~])\]\s*(.*?)\s*$")
ITEM_SLUG = re.compile(r"`([^`]+)`")
ITEM_CLAUSES = re.compile(r"\(([^()]*)\)\s*$")
OWN_CLAUSES = ("serves", "needs")        # the clauses the generator writes


def read_state(path: pathlib.Path) -> dict[str, tuple[str, list[str]]]:
    """slug -> (mark, clauses) of each item of an existing target list: its mark (` `, `x`, `X` or
    `~`) and the clauses of its trailing group that the generator does not write, in their order.
    They record what an operator knows (`[x]`, `[~]`, `partial: #N`) and survive regeneration."""
    state: dict[str, tuple[str, list[str]]] = {}
    if not path.is_file():
        return state
    try:
        text = path.read_text(encoding="utf-8")
    except UnicodeDecodeError as e:
        raise SystemExit(f"{UMBRELLA_DIR}/{path.name} is not valid UTF-8: {e}")
    for line in text.splitlines():
        m = ITEM_LINE.match(line)
        slug = ITEM_SLUG.search(m.group(2)) if m else None
        if slug is None:
            continue
        group = ITEM_CLAUSES.search(m.group(2)[slug.end():])
        clauses = [c.strip() for c in group.group(1).split(";")] if group else []
        kept = [c for c in clauses if c and c.partition(":")[0].strip().lower() not in OWN_CLAUSES]
        state.setdefault(slug.group(1).strip(), (m.group(1), kept))
    return state


class Goal:
    """The closure of an umbrella's root, its items and the two generated files."""

    def __init__(self, tree: Tree, path: pathlib.Path, config: dict):
        self.tree, self.path, self.config = tree, path, config
        self.stem = path.stem
        root = config["root"]
        if root not in tree.area_size:
            raise SystemExit(f"{UMBRELLA_DIR}/{path.name}: root {root!r} is not a roadmap directory of "
                             f"{ROADMAP_DIR}/")
        self.root = root
        index = tree.roadmaps.get(root)
        self.index = index if index is not None and index.rel == f"{ROADMAP_DIR}/{root}" else None
        self.targets_name = f"{self.stem}-targets.md"
        self.state = read_state(path.with_name(self.targets_name))
        self.family = self.family_order()
        self.build()
        live = set(self.slug.values())
        # a slug that is no longer an item loses what was recorded for it
        self.vanished = [(slug, mark, kept) for slug, (mark, kept) in self.state.items()
                         if slug not in live and (mark != " " or kept)]

    def family_order(self) -> list[str]:
        """The roadmaps under TauCetiRoadmap/<root>/: the root's own README first, then in the
        order the root's README first links them (`Name/README.md`), then by name."""
        tree = self.tree
        names = [n for n, r in tree.roadmaps.items() if r.area == self.root and not r.completed]
        index = self.index.readme.text if self.index else ""

        def rank(n):
            if n == self.root:
                return (0, 0, n)
            pos = index.find(f"{n}/README.md")
            return (1, pos, n) if pos >= 0 else (2, 0, n)
        return sorted(names, key=rank)

    def order(self, u: Unit) -> tuple:
        """The fixed total order that breaks cycles: area (the root's last), roadmap, end of the
        unit's text, a nested unit before the one it is nested in."""
        rm = u.roadmap
        return (rm.area == self.root, rm.area, rm.name, u.end, -u.level, u.line)

    def file_order(self, u: Unit) -> tuple:
        rm = u.roadmap
        return (rm.area == self.root, rm.area, rm.name, u.line)

    def build(self) -> None:
        tree = self.tree
        family = set(self.family)
        by_pos: dict[Roadmap, tuple] = {}

        def refs_in(rm: Roadmap, a: int, b: int) -> list[Ref]:
            """The refs of the README of `rm` that begin at an offset in [a, b)."""
            if rm not in by_pos:
                refs = tree.refs(rm)
                by_pos[rm] = (refs, [r.pos for r in refs])
            refs, pos = by_pos[rm]
            return refs[bisect.bisect_left(pos, a):bisect.bisect_left(pos, b)]

        def clause_refs(rm: Roadmap, source: str, a: int, first_ranked: bool,
                        citations_only: bool = False) -> list[tuple[int, Ref]]:
            """(rank, ref) of the references of one statement whose clauses are not set aside:
            rank 1 for the first sentence of a `*Needs:*` or `*Prerequisites:*` line, which states
            the needs (`first_ranked`), rank 2 for the rest."""
            out = []
            for clause in rm.statements[(source, a)]:
                rank = 1 if first_ranked and clause.sentence == 0 else 2
                for r in refs_in(rm, clause.start, clause.end):
                    if citations_only and not r.citation:
                        continue
                    if r.pos in clause.aside:
                        rule, cue = clause.aside[r.pos]
                        entry = self.set_aside.setdefault((rm.name, r.pos), (rule, cue, rm, []))
                        if r.what not in entry[3]:
                            entry[3].append(r.what)
                        continue
                    out.append((rank, r))
            return out

        def stated(u: Unit) -> list[tuple[int, Ref]]:
            """What a section needs: the references on its own `*Needs:*` and `*Prerequisites:*`
            lines; without one, the citations in the `Dependencies` subsection of its layer."""
            rm = u.roadmap
            tree.refs(rm)
            own = [a for no, a, b in rm.needs if (rm.owner[no] is u if u.structural else u.line <= no <= u.end)]
            if own:
                return [x for a in own for x in clause_refs(rm, "*Needs:*", a, True)]
            self.without_needs[rm.name] += 1
            layer = rm.layer_of(u)
            if layer is None:
                return []
            return [x for a, b in rm.dependency_spans(layer)
                    for x in clause_refs(rm, "Dependencies", a, False, citations_only=True)]

        def layer_stated(u: Unit) -> list[tuple[int, Ref]]:
            """What a layer item (a layer without sections) needs: the references on every
            `*Needs:*` and `*Prerequisites:*` line in its text, and in its own `Dependencies`
            subsection the citations and the ids of its own roadmap."""
            rm = u.roadmap
            tree.refs(rm)
            rs = [x for no, a, b in rm.needs if u.line <= no <= u.end for x in clause_refs(rm, "*Needs:*", a, True)]
            rs += [x for a, b in rm.dependency_spans(u) for x in clause_refs(rm, "Dependencies", a, False)]
            best: dict[int, tuple[int, Ref]] = {}
            for rank, r in rs:
                if id(r) not in best or rank < best[id(r)][0]:
                    best[id(r)] = (rank, r)
            return list(best.values())

        def enclosing_layers(u: Unit) -> set:
            out, w = set(), u.roadmap.layer_of(u)
            while w is not None:
                out.add(w)
                w = u.roadmap.layer_of(w)
            return out

        expanded: dict[Unit, list[Unit]] = {}

        def work(v: Unit) -> list[Unit]:
            """The items a need of `v` stands for: `v` itself, unless it is a layer with sections,
            which no pull request completes as such (it is done when its sections are): then every
            section in it, and so on through the layers nested in it."""
            if v not in expanded:
                parts = v.roadmap.contents(v) if v.kind == "layer" else []
                expanded[v] = list(dict.fromkeys(w for p in parts for w in work(p))) if parts else [v]
            return expanded[v]

        all_keys: dict[Unit, dict] = collections.defaultdict(lambda: collections.defaultdict(set))
        self.serves: dict[Unit, set] = collections.defaultdict(set)
        self.without_needs: collections.Counter = collections.Counter()
        self.own_layer = 0
        self.set_aside: dict[tuple[str, int], tuple] = {}       # clauses whose references create no need
        edge_rank: dict[tuple[Unit, Unit], int] = {}
        roots = list(dict.fromkeys(w for name in self.family
                                   for u in sorted(tree.roadmaps[name].units().values(), key=lambda u: u.line)
                                   for w in work(u)))
        deps: dict[Unit, list[Unit]] = {}
        met: dict[int, Ref] = {}                  # refs that create no dependency, by identity
        queue, seen = list(reversed(roots)), set(roots)
        while queue:
            u = queue.pop()
            rm = u.roadmap
            out = []
            mine = enclosing_layers(u)
            for rank, r in (layer_stated(u) if u.kind == "layer" else stated(u)):
                if r.target is None:
                    met[id(r)] = r
                    continue
                if r.target is u:                         # a self-dependency, dropped
                    continue
                if r.target in mine:
                    self.own_layer += 1                   # a unit never needs the layer it is in
                    continue
                if work(r.target) == [r.target]:
                    all_keys[r.target][r.key].add(rm.name)
                for v in work(r.target):
                    out.append(v)
                    edge_rank[(u, v)] = min(edge_rank.get((u, v), rank), rank)
                    if rm.name in family and v.roadmap is not rm:
                        self.serves[v].add(rm.name)
            deps[u] = list(dict.fromkeys(v for v in out if v is not u))     # self-dependencies dropped
            for v in deps[u]:
                if v not in seen:
                    seen.add(v)
                    queue.append(v)
        units = sorted(seen, key=self.order)
        # cycles: inside a strongly connected component keep only the dependencies on an earlier unit
        rank = {u: i for i, u in enumerate(units)}
        edges = {u: sorted(deps[u], key=rank.get) for u in units}
        self.stated_edges = {u: list(e) for u, e in edges.items()}
        comps = [c for c in strongly_connected(units, edges) if len(c) > 1]
        dropped = []
        self.edge_rank = edge_rank
        for comp in comps:
            # A stated need (rank 1) outranks an inferred one (rank 2). The cycles among stated
            # needs alone are broken by the order: inside each, a need is kept when it points to an
            # earlier unit. A stated need on a later unit is then tried again, the nearest first,
            # and kept unless it would close a cycle with what is kept, so that none is dropped
            # that could stay. Then each inferred need is added in the same way, those pointing to
            # an earlier unit first.
            comp = sorted(comp, key=rank.get)
            inside = set(comp)
            kept = {u: [v for v in edges[u] if v in inside and edge_rank[(u, v)] == 1] for u in comp}
            again = []
            for sub in strongly_connected(comp, kept):
                within = set(sub)
                for u in sub if len(sub) > 1 else ():
                    for v in [v for v in kept[u] if v in within and rank[v] > rank[u]]:
                        kept[u].remove(v)
                        again.append((u, v))

            def closes(u, v) -> bool:             # does u lie on a kept path from v?
                seen_v, todo = {v}, [v]
                while todo and u not in seen_v:
                    for w in kept[todo.pop()]:
                        if w not in seen_v:
                            seen_v.add(w)
                            todo.append(w)
                return u in seen_v

            inferred = [(u, v) for u in comp for v in edges[u] if v in inside and edge_rank[(u, v)] == 2]
            for u, v in (sorted(again, key=lambda e: (rank[e[1]] - rank[e[0]], rank[e[0]], rank[e[1]]))
                         + sorted(inferred, key=lambda e: (rank[e[1]] > rank[e[0]], rank[e[0]], rank[e[1]]))):
                if closes(u, v):
                    dropped.append((u, v))
                else:
                    kept[u].append(v)
            for u in comp:
                edges[u] = sorted([v for v in edges[u] if v not in inside] + kept[u], key=rank.get)
        assert not [c for c in strongly_connected(units, edges) if len(c) > 1]
        # the longest chain of needs, along a topological order of the acyclic graph
        order: list[Unit] = []                   # every unit after the units it needs
        done: set = set()
        for start in units:
            work_stack = [(start, 0)]
            while work_stack:
                u, i = work_stack.pop()
                if i == 0:
                    if u in done:
                        continue
                    done.add(u)
                if i < len(edges[u]):
                    work_stack.append((u, i + 1))
                    if edges[u][i] not in done:
                        work_stack.append((edges[u][i], 0))
                else:
                    order.append(u)
        depth: dict[Unit, int] = {}              # the units on its longest chain of needs
        for u in order:
            depth[u] = 1 + max((depth[v] for v in edges[u]), default=0)
        self.depth = depth
        self.units, self.edges, self.dropped, self.comps = units, edges, dropped, comps
        refs = list(met.values())
        self.completed = sum(1 for r in refs if r.why == "completed")
        self.unresolved = sorted((r for r in refs if r.why != "completed"),
                                 key=lambda r: (r.where.split(":")[0], int(r.where.split(":")[1]), r.what))
        self.name_units(all_keys)

    def name_units(self, all_keys) -> None:
        """Each unit's (kind, id), from its README alone (`Roadmap.unit_name`); only a line that names
        no id resolving to it is named by the id it is cited by."""
        self.name, self.aliases = {}, {}
        self.naming = collections.Counter({"alias": 0, "ordinal": 0, "cited": 0})
        slugs = {}
        for u in self.units:
            key, how, aliases = u.roadmap.unit_name(u)
            if key is None:
                pool = all_keys[u]
                key, how = max(pool, key=lambda k: (len(pool[k]), k)), "cited"
            self.naming[how] += 1
            self.name[u], self.aliases[u] = key, aliases
            slug = make_slug(u.roadmap.name, *key)
            if not valid_slug(slug):
                raise SystemExit(f"{u.roadmap.rel}/README.md:{u.line}: the item's name {slug!r} is not a "
                                 "valid slug")
            if slug in slugs:
                o = slugs[slug]
                raise SystemExit(f"two items would be named {slug}: {o.roadmap.rel}/README.md:{o.line} and "
                                 f"{u.roadmap.rel}/README.md:{u.line}")
            slugs[slug] = u
        self.slug = {u: s for s, u in slugs.items()}
        self.duplicates = sum(n - 1 for rm in {u.roadmap for u in self.units} for n in rm.leading().values() if n > 1)

    # --- the files ---

    def members(self) -> list[str]:
        areas = sorted({u.roadmap.area for u in self.units} - {self.root})
        return [self.root] + areas

    def unit_label(self, u: Unit) -> str:
        label = label_of(*self.name[u])
        return f"{u.roadmap.name} {label}" if self.tree.area_size[u.roadmap.area] > 1 else label

    def title(self, u: Unit) -> str:
        kind, ident = self.name[u]
        d = u.roadmap.readme.find_definition(ident, kind == "layer")
        if d is not None and d[0] == u.line:
            return d[2]
        kind_, label = u.roadmap.row(u.line)
        own = own_label(label) if kind_ != "other" else None
        if own:                                # a leading id that another heading has first
            m = _id_at_start(label, own[1], own[0] == "layer", False) or _id_at_start(label, own[1], False, True)
            if m:
                return label.lstrip()[m.end():].strip(" :.—–-")
        return ""

    def item(self, u: Unit) -> str:
        kind, ident = self.name[u]
        label = label_of(kind, ident)
        if self.aliases[u]:                    # the other ids of its heading stay visible
            label += " [" + ", ".join(self.aliases[u]) + "]"
        desc = description(label, self.title(u), ": " if kind == "layer" else " ")
        clauses = []
        citers = [n for n in self.family if n in self.serves[u]]
        if citers:
            shown = ", ".join(citers[:SERVES_MAX])
            more = len(citers) - SERVES_MAX
            clauses.append(f"serves: {shown}" + (f" and {more} more" if more > 0 else ""))
        mark, kept = self.state.get(self.slug[u], (" ", []))
        clauses += kept                       # recorded in the file, kept by slug, before `needs:`
        needs = sorted(self.edges[u], key=self.file_order)
        clauses.append("needs: " + (", ".join(self.slug[v] for v in needs) if needs else "none"))
        return f"- [{mark}] `{self.slug[u]}` — {desc} ({'; '.join(clauses)})"

    def targets_text(self) -> str:
        tree, root = self.tree, self.root
        title = self.stem
        if self.index:
            for line in self.index.readme.lines:
                if line.startswith("# "):
                    title = f"{self.stem}: " + re.sub(r"(?i)^roadmap:\s*", "", line[2:].strip())
                    break
        goal = self.config.get("goal") or self.config.get("description") or \
            f"what the roadmaps under {ROADMAP_DIR}/{root}/ state."
        paragraphs = [
            f"Goal: {goal}",
            f"Each item is a section of a roadmap that the goal needs, directly or through other items, or a "
            f"layer that has no sections; a need of a layer that has sections is a need of each of its "
            f"sections. `needs:` names every item it depends on: what its *Needs:* or *Prerequisites:* lines "
            f"name or, for a section that has none, what the Dependencies subsection of its layer cites; for "
            f"a layer, also what its own Dependencies subsection names; a reference that a negation governs, "
            f"or that is named as a consumer, creates no need. `serves:` names the roadmaps under "
            f"{ROADMAP_DIR}/{root}/ whose units need the item directly. An item is done when its targets are "
            f"in the library. Its slug is the roadmap's name and the id its heading starts with; other ids of "
            f"the heading follow the id in brackets. The area {root} comes last.",
            f"This file is generated by `{SCRIPT}` from the roadmaps' READMEs. Everything is regenerated "
            f"except an item's mark and the clauses the generator does not write, which are kept by slug; the "
            f"worker detects completed items from merged pull requests, and a tick records one in the file. "
            f"It is regenerated once a day, and at once when the umbrella's own files or the generator change. "
            f"A line starting with `>` records a dependency dropped to break a cycle.",
        ]
        out = [f"# {title}", MARKER]
        for i, p in enumerate(paragraphs):
            out += ([""] if i else []) + textwrap.wrap(p, WRAP, break_long_words=False, break_on_hyphens=False)
        by_area = collections.defaultdict(list)
        for u in sorted(self.units, key=self.file_order):
            by_area[u.roadmap.area].append(u)
        dropped = collections.defaultdict(list)
        for u, v in sorted(self.dropped, key=lambda e: (self.file_order(e[0]), self.file_order(e[1]))):
            dropped[u.roadmap.area].append(f"> Dropped to break a cycle: `{self.slug[u]}` needs `{self.slug[v]}`.")
        for area in self.members()[1:] + [root]:
            out += ["", f"## {area}"]
            out += [self.item(u) for u in by_area[area]]
            out += dropped[area]
        return "\n".join(out) + "\n"

    def toml_text(self) -> str:
        stem, root = self.stem, self.root
        header = [
            f"The umbrella {stem}, for `tauceti work --roadmap-only {stem}`: the roadmap areas that the "
            f"roadmaps under {ROADMAP_DIR}/{root}/ need.",
            f"Generated by {SCRIPT} from the roadmaps' READMEs; do not edit it by hand. Only `description`, "
            f"`goal` and `root` are written by hand: the generator reads them and keeps them as they are. "
            f"It is regenerated once a day, and at once when the umbrella's own files or the generator change.",
            f"A member is an area, a top-level directory of {ROADMAP_DIR}/, that contains a unit the goal "
            f"needs. The goal needs every section of the roadmaps under {ROADMAP_DIR}/{root}/ and, "
            f"transitively, what a needed section needs: what its *Needs:* or *Prerequisites:* lines name or, "
            f"when it has none, what the Dependencies subsection of its layer cites. A need of a layer that "
            f"has sections is a need of each of its sections; a layer counts as a unit only when it has none, "
            f"and then needs what the *Needs:* lines in it and its own Dependencies subsection name. "
            f"Roadmaps under {COMPLETED_DIR}/ are never members.",
            "`sections` lists the units of a member that the goal needs, in README order, with "
            "the roadmap's name in front in an area of several roadmaps. The root's area has no `sections`: "
            "all of it is in scope. `targets` is the target list that orders the work, item by item.",
        ]
        out = []
        for i, p in enumerate(header):
            out += (["#"] if i else []) + textwrap.wrap(p, WRAP - 2, initial_indent="# ", subsequent_indent="# ",
                                                        break_long_words=False, break_on_hyphens=False)
        out.append("")
        for key in ("description", "goal"):
            if key in self.config:
                out.append(f"{key} = {toml_string(self.config[key])}")
        out.append(f"root = {toml_string(root)}")
        out.append(f"targets = {toml_string(self.targets_name)}")
        by_area = collections.defaultdict(list)
        for u in sorted(self.units, key=self.file_order):
            by_area[u.roadmap.area].append(u)
        for area in self.members():
            out += ["", "[[area]]", f"name = {toml_string(area)}"]
            if area != root:
                out.append("sections = [")
                out += [f"  {toml_string(self.unit_label(u))}," for u in by_area[area]]
                out.append("]")
        text = "\n".join(out) + "\n"
        back = tomllib.loads(text)
        assert [a["name"] for a in back["area"]] == self.members() and back["root"] == root
        assert all(back.get(k) == self.config[k] for k in ("description", "goal") if k in self.config)
        return text

    def files(self) -> list[tuple[pathlib.Path, str]]:
        return [(self.path, self.toml_text()), (self.path.with_name(self.targets_name), self.targets_text())]

    def cycle_through(self, start: Unit, comp: set) -> list[Unit]:
        """A shortest cycle through `start` among the stated dependencies inside `comp`."""
        back = {start: None}
        frontier = [start]
        while frontier:
            nxt = []
            for u in frontier:
                for v in self.stated_edges[u]:
                    if v is start:
                        path = [u]
                        while back[path[-1]] is not None:
                            path.append(back[path[-1]])
                        return path[::-1] + [start]
                    if v in comp and v not in back:
                        back[v] = u
                        nxt.append(v)
            frontier = nxt
        return []

    def stats(self, files) -> list[str]:
        units = self.units
        fam = [u for u in units if u.roadmap.area == self.root]
        layers = sum(1 for u in units if u.kind == "layer")
        out = [
            f"umbrella {self.stem} (root {self.root}, {len(self.family)} roadmaps)",
            f"  members: {len(self.members())} areas, {len({u.roadmap.name for u in units})} roadmaps",
            f"  items: {len(units)} ({len(units) - layers} sections, {layers} layers without sections); "
            f"of the root family: {len(fam)}",
            f"  sections in the closure without a *Needs:* or *Prerequisites:* line: "
            f"{sum(self.without_needs.values())}; "
            "most in: " + ", ".join(f"{n} {c}" for n, c in sorted(self.without_needs.items(),
                                                                   key=lambda x: (-x[1], x[0]))[:10]),
            f"  dependencies: {sum(len(v) for v in self.stated_edges.values())} stated, {len(self.dropped)} "
            f"dropped for cycles in {len(self.comps)} strongly connected components, "
            f"{sum(len(v) for v in self.edges.values())} written; {self.own_layer} of a unit on the layer it "
            f"is in, ignored",
            f"  names: {self.naming['alias']} items named by an id in their heading's parenthesis or their "
            f"label, {self.naming['ordinal']} by an ordinal (a leading id that is not unique in its README), "
            f"{self.naming['cited']} by the id they are cited by; {self.duplicates} leading ids in the "
            f"members' READMEs are not unique",
            f"  stated needs (rank 1) dropped for cycles: {sum(1 for e in self.dropped if self.edge_rank[e] == 1)}",
            f"  items that need nothing (eligible at the start): {sum(1 for u in units if not self.edges[u])}; "
            f"longest chain of needs: {max(self.depth.values(), default=0)} items",
        ]
        for comp in sorted(self.comps, key=lambda c: (-len(c), self.order(min(c, key=self.order))))[:3]:
            names = sorted({u.roadmap.name for u in comp})
            out.append(f"    component of {len(comp)} units in {len(names)} roadmaps: {', '.join(names[:8])}"
                       + (" ..." if len(names) > 8 else ""))
            inside = set(comp)
            first = self.cycle_through(min(comp, key=self.order), inside)
            rest = [u for u in sorted(comp, key=self.order) if u not in first]
            for cyc in (first, self.cycle_through(rest[0], inside) if rest else []):
                if cyc:
                    out.append("      cycle: " + " -> ".join(self.slug[u] for u in cyc))
        out.append(f"  citations of completed roadmaps met: {self.completed}")
        why = collections.Counter(self.tree.why(r) for r in self.unresolved)
        out.append(f"  ids not resolved (on *Needs:* and *Prerequisites:* lines and in Dependencies subsections): "
                   f"{len(self.unresolved)}"
                   + (f" ({'; '.join(f'{n} {w}' for w, n in why.most_common())})" if why else ""))
        for r in self.unresolved[:UNRESOLVED_SHOWN]:
            out.append(f"    {r.where}: {r.what}: {self.tree.why(r)}")
        for path, text in files:
            out.append(f"  {path.relative_to(self.tree.root).as_posix()}: {len(text.encode('utf-8'))} bytes")
            if path.suffix == ".md":
                blocks = [b for b in text.split("\n## ")[1:]]
                big = max(blocks, key=lambda b: len(b.encode("utf-8")))
                out.append(f"    largest area block: {big.split(chr(10), 1)[0]}, {len(big.encode('utf-8')) + 4} bytes")
        if self.dropped:
            out.append("  dependencies dropped for cycles (rank 1: stated on the first sentence of a *Needs:* line):")
            for u, v in sorted(self.dropped, key=lambda e: (self.file_order(e[0]), self.file_order(e[1]))):
                out.append(f"    {self.slug[u]} needs {self.slug[v]} (rank {self.edge_rank[(u, v)]})")
        rules = collections.Counter(rule for rule, _cue, _rm, _w in self.set_aside.values())
        out.append(f"  references set aside, creating no need: {rules['negation']} by a negation, "
                   f"{rules['consumer']} by a consumer cue")
        for (name, start), (rule, cue, rm, what) in sorted(self.set_aside.items()):
            line = bisect.bisect_right(rm.readme.starts, start)
            refs = "; ".join(w.replace(" (*Needs:*)", "").replace(" (Dependencies)", "") for w in what)
            out.append(f"    {rule}: {rm.rel}/README.md:{line}: {refs[:100]} (cue: {cue[:60]})")
        return out


def toml_string(s: str) -> str:
    """A TOML basic string: JSON's escapes are TOML's, except that TOML also escapes DEL."""
    return json.dumps(s, ensure_ascii=False).replace("\x7f", "\\u007F")


# --- the command -------------------------------------------------------------------------------

def load_config(path: pathlib.Path) -> dict | None:
    """The umbrella file's settings, or None when it has no `root` (it is not generated)."""
    try:
        config = tomllib.loads(path.read_text(encoding="utf-8"))
    except (UnicodeDecodeError, tomllib.TOMLDecodeError) as e:
        raise SystemExit(f"{UMBRELLA_DIR}/{path.name} does not parse: {e}")
    if "root" not in config:
        return None
    for key in ("root", "description", "goal"):
        if key in config and not isinstance(config[key], str):
            raise SystemExit(f"{UMBRELLA_DIR}/{path.name}: `{key}` must be a string")
    return config


def first_difference(old: str, new: str) -> int:
    a, b = old.split("\n"), new.split("\n")
    return next((i + 1 for i, (x, y) in enumerate(zip(a, b)) if x != y), min(len(a), len(b)) + 1)


def main(argv: list[str]) -> int:
    if len(argv) > 1 or (argv and argv[0] not in ("--fix", "--stats")):
        print(f"usage: python3 {SCRIPT} [--fix | --stats]", file=sys.stderr)
        return 2
    mode = argv[0] if argv else "check"
    tree = Tree(ROOT)
    goals = []
    for path in sorted((ROOT / UMBRELLA_DIR).glob("*.toml")):
        config = load_config(path)
        if config is not None:
            goals.append(Goal(tree, path, config))
    files = [(g, g.files()) for g in goals]
    gone = [f"{UMBRELLA_DIR}/{g.targets_name}: {slug} [{mark}]" + (f" ({'; '.join(kept)})" if kept else "")
            + " is no longer an item; what the file recorded for it is dropped"
            for g in goals for slug, mark, kept in g.vanished]
    if mode in ("--stats", "--fix"):
        for line in gone:
            print(line, file=sys.stderr)
    if mode == "--stats":
        print(f"roadmaps read: {len(tree.active)} under {ROADMAP_DIR}/; completed roadmaps known: "
              f"{len(tree.roadmaps) - len(tree.active) + len(tree.shadowed)}")
        for p in tree.problems:
            print(f"  problem: {p}")
        if tree.ranges_kept:
            print(f"  ranges whose inner ids could not be listed (both ends kept): {len(tree.ranges_kept)}")
            for r in tree.ranges_kept[:UNRESOLVED_SHOWN]:
                print(f"    {r}")
        for g, fs in files:
            print("\n".join(g.stats(fs)))
        if not goals:
            print(f"no {UMBRELLA_DIR}/*.toml has a `root` key: nothing is generated")
        return 0
    if mode == "--fix":
        for _g, fs in files:
            for path, text in fs:
                if not path.exists() or path.read_text(encoding="utf-8") != text:
                    path.write_text(text, encoding="utf-8")
                    print(f"wrote {path.relative_to(ROOT).as_posix()}")
        return 0
    drift = []
    for _g, fs in files:
        for path, text in fs:
            rel = path.relative_to(ROOT).as_posix()
            if not path.exists():
                drift.append(f"{rel}: missing")
                continue
            old = path.read_text(encoding="utf-8")
            if old != text:
                drift.append(f"{rel}: differs from the generated file, first at line {first_difference(old, text)}")
    drift += gone
    if drift:
        print("The umbrellas are out of sync with the roadmaps' READMEs:\n")
        for d in drift:
            print(f"  - {d}")
        print(f"\nThey are generated, not edited by hand. Run\n  python3 {SCRIPT} --fix\nto regenerate them.")
        return 1
    print("Umbrellas in sync: " + (", ".join(f"{g.stem} ({len(g.members())} members, {len(g.units)} items)"
                                             for g in goals) or "none has a `root` key") + ".")
    return 0


if __name__ == "__main__":
    raise SystemExit(main(sys.argv[1:]))
