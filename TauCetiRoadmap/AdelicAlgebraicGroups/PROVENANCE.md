# Provenance: adelic algebraic groups

**Non-normative, audited 2026-08-10.** The specification is [`README.md`](README.md).
No roadmap milestone or dependency depends on this file.

## Extraction

| Source | Revision | Material | Extraction decision |
|---|---|---|---|
| `roed-math/TauCetiRoadmap` PR #12 | `3f5bb5adf840865b0e2772cc40d1cde4a7974321` | local point topologies, restricted products, compact opens, rational diagonals, general strong approximation, Haar/Tamagawa machinery, reduction theory | Moved the material independent of quadratic forms. Orthogonal groups, Spin, transvections, the Spin hypothesis verification, and `τ(SO_Q)=2` remain in PR #12. |

The generic restricted-product signatures in `Suggested.lean` are adapted from PR #12's reviewed
Layer 3B declarations. They remain in the repository's licence and keep the canonical
coordinatewise evaluation formulas.

## Upstream and neighbouring sources

- Mathlib `RestrictedProduct`, finite adeles, adele rings, Haar measure, quotient measure, and
  fundamental domains are consumed directly under Apache-2.0.
- The accepted Reductive Groups roadmap supplies the algebraic-group carrier and structure theory.
- `GlobalNumberFields` supplies field adeles, ideles, places, and normalized absolute values.
- The mathematical routes follow Weil, Borel, Harder, Platonov–Rapinchuk, Ono, and Oesterlé as
  cited in the roadmap. No external formalization was copied during this extraction.

## Rejected duplicate routes

- Defining `G(𝔸_f)` as `G` evaluated on the finite adele ring without a comparison theorem was
  rejected; restricted products of local point groups are the canonical carrier.
- Leaving generic restricted products and Tamagawa measures inside `OrthogonalSpinGroups` was
  rejected because it would force every other algebraic group to import quadratic-form theory.
- Defining adelic groups relative to arbitrary topology parameters was rejected; the local point
  topology is canonical and the compact-open hypotheses refer to that instance.
