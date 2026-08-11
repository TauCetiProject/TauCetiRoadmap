# Provenance for the Global Quadratic Forms roadmap

This file is **not normative**. [README.md](README.md) is the definitive roadmap. This file records
the extraction history, source audit, prior formalizations, licensing constraints, and unresolved
coordination questions. No implementation milestone may cite this file as a prerequisite.

## Portfolio extraction

The roadmap was created as part of the 2026-08-10 arithmetic-portfolio restructuring. The
coordination proposal in `roed-math/TauCetiRoadmap` pull request #14 was used only for its
description-level ownership split: global quadratic forms should be a separate roadmap supplied
by Global Number Fields, Number Field Arithmetic, Class Field Theory, and Quadratic Form
Invariants. No `README.md`, `Suggested.lean`, `PROVENANCE.md`, or other changed-file content from
that pull request was copied or treated as a mathematical source.

The long-term local planning file `lmfdb_background_plan.md` had earlier identified a reusable
“global quadratic forms” development as an alternative to embedding Hasse–Minkowski inside
quaternion arithmetic. It fixed neither declarations nor a proof, and is used here only as
evidence for the earlier scope decision.

### Source-to-destination table

| source | source revision | source milestone(s) | destination here | changes made during extraction |
|---|---|---|---|---|
| PR #6, Global Class Field Theory | `5aa90a7a7bed6e2a0c6940ece96b5dafef4d823c` | 11.5, localization and local predicates | Layers 0–2 | Moved to the global-form owner; added scalar/form representation predicates, archimedean signature API, finite-support packaging, and the explicit Number Field Arithmetic completion contract. |
| PR #6, Global Class Field Theory | `5aa90a7a7bed6e2a0c6940ece96b5dafef4d823c` | 11.6, Hasse–Minkowski isotropy | Layers 4–5 | Preserved arbitrary-number-field generality and the corrected four-case proof; made the vector-approximation repair and quaternary finiteness boundary separate acceptance targets. |
| PR #6, Global Class Field Theory | `5aa90a7a7bed6e2a0c6940ece96b5dafef4d823c` | 11.7, scalar and form representation | Layers 6.1–6.2 | Moved without changing the mathematical route; separated the zero-scalar edge case. |
| PR #6, Global Class Field Theory | `5aa90a7a7bed6e2a0c6940ece96b5dafef4d823c` | 11.8, local-global isometry | Layers 6.3 and 8.4 | Moved with the downstream form-theoretic `SO` kernel corollary; no nonabelian cohomology was imported. |
| earlier global-quadratic-forms planning decision | `lmfdb_background_plan.md`, inspected 2026-08-10 | split-out global classification | Layers 3, 7, 8 | Replaced the earlier scope sketch by exact admissibility, prescribed-local-behavior existence, classification, and Witt-kernel milestones sourced below. |

The Quadratic Form Invariants roadmap was inspected at
`687a9156dc61af4c029395bc7ebd9c8d442a5293` for its local-theory declarations and prior-art audit.
No milestone moved from it: local forms remain its canonical responsibility.

## Corrected Hasse–Minkowski proof audit

The extracted text comes from the reviewed PR #6 head above, after two corrections that must not
regress.

1. **Quaternary rank is separate.** The higher-rank induction needs the complement of a binary
   summand to have rank at least three, so that it is anisotropic at only finitely many places.
   For a quaternary form the complement is binary and that exceptional set can be infinite.
   O'Meara instead handles square discriminant through 42:12 and general discriminant through the
   extension `K(√d)` and 58:7.
2. **Approximate the vector, not a scalar.** In rank at least five, O'Meara approximates the two
   coordinates of local vectors in a global binary summand and defines `b=Q(x)` afterward. This
   proves that `b` is globally represented by the binary summand. Choosing an arbitrary global
   scalar in the desired local square classes proves only the complementary representation and
   leaves the final isotropic-vector construction incomplete.

The current roadmap retains both corrections in normative Layers 5.2 and 5.4 and in the
acceptance criteria.

## Primary mathematical source audit

O. T. O'Meara, *Introduction to Quadratic Forms* (Grundlehren 117), was inspected in the local
reference copy on 2026-08-10. The relevant results are over a **global field**; this roadmap takes
their number-field specialization and does not claim the global-function-field case.

- 42:11 is the representation/isotropy criterion.
- 42:12 is the field-generic ternary-subspace lemma used in the square-discriminant quaternary
  case. It is not a consequence of local classification.
- 58:7 is quaternary descent from the discriminant extension.
- 63:14 gives good-place isotropy; 63:20–23 give local classification, representation, and exact
  realization constraints.
- 65:15 is the global square theorem and 65:23 is the quadratic Hasse norm theorem.
- 66:1 proves Hasse–Minkowski isotropy in the binary, ternary, quaternary, and higher-rank cases.
- 66:3 is representation, 66:4 is isometry, and 66:5 records the complete invariant list.
- 66:6 proves almost-all triviality of the Hasse sign and almost-all isotropy in rank at least
  three.
- 71:18–19a give Hilbert reciprocity and the finite even-set sign prescription.
- 72:1 is the missing existence theorem: local rank-`n` forms come from one global form exactly
  when their discriminants arise from one global class, their Hasse signs are trivial almost
  everywhere, and their total Hasse product is one.

The roadmap uses the Quadratic Form Invariants convention
`s(q)=∏_{i<j}(a_i,a_j)`. O'Meara's local “Hasse symbol” is written with a different indexing
convention elsewhere in the book; all statements in the normative roadmap are translated to the
supplier's convention.

Lam, Serre, Cassels, Milnor–Husemoller, and Neukirch are companion references. Cassels and Serre's
worked global examples concern `ℚ`; neither is used as the sole source for the arbitrary-number-
field theorem.

No copyrighted book text is copied into the roadmap. The theorem statements and proof routes are
paraphrased and organized around the intended Lean API.

## External formalizations

### `mariainesdff/HassePrinciple`

- **Authors:** Nirvana Coppola, María Inés de Frutos-Fernández, and contributors.
- **Revision inspected by the Quadratic Form Invariants audit:**
  [`d2802ddce55e`](https://github.com/mariainesdff/HassePrinciple/commit/d2802ddce55ef34045f68c5bf39c0598e7d0e988),
  2026-07-27.
- **Licence:** Apache-2.0 at that revision.
- **Scope:** Hasse–Minkowski over `ℚ`, following Serre, including `p`-adic squares, chain
  equivalence, a general-field Hilbert-symbol setup, and rank-by-rank invariants.
- **Difference from this roadmap:** its headline global theorem is rational, whereas this roadmap
  requires arbitrary number fields, canonical number-field completions, prescribed local
  behavior, and global classification/existence.
- **Use made here:** citation and API-comparison prior art only. No code, proof organization, or
  project-specific statement shape was copied.
- **Contact status:** no contact recorded; no division-of-work agreement is claimed.
- **Condition before adaptation:** contact the maintainers and record the agreed ownership, or
  consume the work after it lands in Mathlib. Apache-2.0 compatibility alone does not replace
  project coordination.

The 2023 Lorentz Center Hasse–Minkowski workshop project by A. Best, K. Buzzard, M. Streng,
H. Wiersema, and R. Winter is also prior art mentioned in the supplier audit. Its exact public
revision and licence were not established in this pass. It is cited only as related activity and
no content was used.

The GPL-licensed comparison repository `davidturturean/gq2-lean-turturean`, mentioned in the
Quadratic Form Invariants provenance, was not used. No GPL code may move into Apache-licensed Tau
Ceti without an explicit licensing decision.

## Supplier-name decisions made by the extraction

The extraction freezes these contracts:

```text
GlobalNumberFields.weakApproximation_denseRange
NumberFieldArithmetic.isNonarchimedeanLocalField_adicCompletion
ClassFieldTheory.cyclicHasseNorm
ClassFieldTheory.hilbertProductFormula
```

The old PR #6 had the density form of weak approximation and the cyclic Hasse norm theorem only
as milestones/anonymous suggested statements. It named `hilbertProductFormula` in prose but had
no Lean target signature for it. The restructured supplier roadmaps must export the names above;
`Suggested.lean` checks them rather than introducing local stand-ins.

The Quadratic Form Invariants restructuring must also export the bridge from its classical
norm-equation/quaternion Hilbert symbol to Class Field Theory's cohomological pairing, together
with the derived product formula. The normative contract names are
`hilbertSymbol_eq_cohomological` and `hilbertSymbol_productFormula`.

## Unresolved coordination and licensing questions

- The maintainers of `mariainesdff/HassePrinciple` have not been contacted, so the roadmap treats
  that repository as citation-only prior art despite its Apache-2.0 licence.
- The exact revision, repository state, and licence of the 2023 Lorentz Center workshop project
  remain unaudited. No adaptation is permitted until those are recorded.
- The external formalizations cover substantial rational-case material but not the complete
  number-field existence/classification target. Any future reuse must document which files and
  proofs cross the boundary and which generalizations are new.
- Supplier signatures frozen above must be checked on the stacked integration branch before this
  roadmap is opened for review. A temporary mismatch is a contract-integration issue, not
  permission to add a duplicate declaration here.
