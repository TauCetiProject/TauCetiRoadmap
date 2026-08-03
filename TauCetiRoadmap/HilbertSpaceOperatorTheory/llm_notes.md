# llm_notes — what not to write into the roadmap

**Draft-only, for agents. Delete with `considerations.md` when the PR is undrafted.**
Not for reviewers. This is the holding pen for commentary that feels valuable while editing
and is worthless to someone reading the roadmap cold.

## The rule

A roadmap is read by a skeptical reviewer deciding whether each item should exist. Every
sentence must help with *that*. Anything that instead explains **how the document got this
way** is bloat, however true.

Absence needs no explanation. If an item was cut, it is simply gone — the reviewer never knew
it was there and does not need to be told. A note saying "X is deliberately out of scope"
answers a question nobody asked and re-raises the thing you removed.

## What I tried to write this session, and shouldn't have

- A 20-line section titled *"The domain-aware `sin Θ` theorem — deliberately out of scope"*,
  after cutting `UnboundedSinThetaProblem`. Justification offered at the time: "a reviewer who
  knows Davis–Kahan will ask where the unbounded theorem went." They won't, and if they do,
  the answer is a review comment, not a permanent section.
- A `## Provenance` / history block recording that a docstring "used to say" something and was
  corrected on a date.
- Self-justifying docstrings — prose arguing for the design decision the declaration below it
  already embodies. If the signature needs a paragraph of defence, that is evidence the
  signature is wrong, not that it needs the paragraph. `UnboundedSinThetaProblem` carried
  exactly such a paragraph and was cut.

## The same two patterns were already here — now cleaned, don't reintroduce

**Nine sites, fixed 2026-08-03.** Both patterns are easy to write without noticing, so they
are described here rather than just deleted.

*Narrating the roadmap's own edit history* to a reader who never saw the earlier version —
"a `blockSum_target` placeholder stood here and identified no theorem", "the previous version
of this structure did not have the field", "guessing the name before the quantifiers are
settled is what produced the placeholder". In each case the surviving sentence is the
mathematical one: *what* the layer contains, *why* the field is data, *why* the name is
withheld. The story of the previous draft is not part of that.

*Appealing to the donor repository as though it were the specification* — "the existing proof
additionally assumes…", "the existing implementation proves it under this name", "the port
costs…". The guideline inverts this explicitly: *"Put any file-by-file map in a clearly
secondary provenance section so reviewers do not treat the source code as prescriptive or
exemplary."* Say what the statement should be. A hypothesis is absent because the mathematics
does not need it, not because someone's proof happened to carry it. If donor code is real
evidence for a decision, it goes in `considerations.md` while this is a draft, and in a
provenance section after.

One survivor is **not** an instance of either and should stay:
`HilbertSpaceOperatorFoundations/Suggested.lean:91` calls `operatorAbs` "a deliberate
placeholder". That is a live naming question posed to review, with the alternatives and the
tradeoff stated — a roadmap doing its job, not archaeology.

## Where this material does belong

- **A judgement call still open** → `considerations.md`, and delete it at undraft.
- **Why a signature is the way it is, permanently** → it should be evident from the signature.
  If it genuinely is not, the README prose is the place, stated as mathematics rather than as
  the story of a decision.
- **Something I want the next agent to know about process** → here.

## Standing reminders

- No `sorry` observations. Every `Suggested.lean` is a scaffold; bodies are absent by design.
  Counting them, or noting that downstream statements "cannot be judged" because an object is
  undefined, is noise. Reviewing means judging *names, signatures, hypotheses, and generality*.
- Do not add a file, a section, or a note to the repository to record something already
  captured in the commit message or the PR discussion.
- When a cut is requested, the deliverable is deletion plus whatever rejoining the surrounding
  prose needs — nothing else.
