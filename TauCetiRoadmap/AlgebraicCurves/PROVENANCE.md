# Provenance for the algebraic-curves roadmap

This file is **not normative**. [README.md](README.md) is the definitive document, and
no milestone there depends on anything recorded here. This file holds dated information
about the surrounding ecosystem: the state of Mathlib when the README's inventory was
checked, the external formalizations that cover overlapping ground, the open Mathlib
pull requests whose shapes the README's milestones follow, and the record of what
coordination has and has not happened. Re-run the searches and update the dates at
implementation time.

## Mathlib inspection

- The README's "What Mathlib already has" inventory was verified against the Mathlib
  the repository builds (manifest revision `9caeba1000`, 2026-06-03, toolchain
  `v4.31.0-rc1`) during 2026-07-30 – 2026-08-01, with the "master:" flags rechecked on
  Mathlib master at the same time. Ecosystem statuses below were rechecked 2026-08-07.
- The infinity-place API deprecations noted in the README (`RatFunc.inftyValuation` et
  al. replacing `FunctionField.inftyValuation*`) date from Mathlib's 2026-04-14
  refactor.

## External formalizations

Collected from public repositories and pull-request metadata. **No external contact
has been made, and no ownership agreement is claimed.** One table, then detail.

| Project and authors | Immutable revision or PR | Licence | Mathematical overlap | API differences | Recorded contact outcome | Agreed ownership | Definite implementation plan | Refactor trigger |
|---|---|---|---|---|---|---|---|---|
| [`vaca22/riemann-roch-function-fields`](https://github.com/vaca22/riemann-roch-function-fields), Guanghao Li | [`dbca5beed1da`](https://github.com/vaca22/riemann-roch-function-fields/commit/dbca5beed1da77e2ecd1eec207d0451fa57e8aa6) (2026-07-14); upstreaming PRs [#41729](https://github.com/leanprover-community/mathlib4/pull/41729), [#41732](https://github.com/leanprover-community/mathlib4/pull/41732), [#41728](https://github.com/leanprover-community/mathlib4/pull/41728), [#41696](https://github.com/leanprover-community/mathlib4/pull/41696) | Apache-2.0 | Layers 0–5 and parts of 10, same function-field/adelic route | Self-contained intrinsic-DVR-subring places vs. the README's normalized `ℤᵐ⁰`-valuations, `Finsupp` divisors, `IsIntegrallyClosedIn` constants (Mathlib-vocabulary reasons in the conventions table) | None (not contacted) | None recorded | Independent development; no code copied or adapted; overlapping milestones named and shaped the way the open Mathlib PRs shape them | Any listed PR landing in the Mathlib the repository builds: delete ours, change the imports |
| Mathlib scheme-side RR campaign, R. D. Giles et al. | Draft [#41621](https://github.com/leanprover-community/mathlib4/pull/41621); merged #37901, #29774; open #38472, #38953, #41198, #41042, #38002, #41317, #40509 | Apache-2.0 (Mathlib) | Layer 12's scheme-side divisors, order of vanishing, conditional RR | Scheme-side cycles (`Function.locallyFinsupp` on points) vs. the README's field-side `Finsupp` on places — different objects by design | None (not contacted) | None claimed; the README assigns the scheme-side carrier to Mathlib and owns only the field side plus comparison | Consume the Mathlib namespace; report gaps upstream; never fork | The repository's Mathlib reaching the merged scheme-side APIs: restate Layer 12 against them |
| [`AxelDlv00/LeanAlgebraicGeometry`](https://github.com/AxelDlv00/LeanAlgebraicGeometry) | [`3842fe7ceea1`](https://github.com/AxelDlv00/LeanAlgebraicGeometry/commit/3842fe7ceea199f5b90efe883520fdbaaf79cef5) (2026-08-07) | Apache-2.0 | Picard-scheme/RR ledger work near Layer 12 | Workspace-stage; no stable API to compare | None (not contacted) | None recorded | Citation and statement-shape audit only; no code transfer | None before coordination is recorded |

### `vaca22/riemann-roch-function-fields`, in detail

- **Content at the pinned revision.** A complete, kernel-checked, sorry-free,
  axiom-clean function-field Riemann–Roch: intrinsic places (DVR-subring valuations),
  divisors indexed by places, adele spaces, Weil differentials, canonical divisors,
  genus, full RR (`ℓ(D) = deg D + 1 − g + ℓ(W − D)`), duality, Riemann's and
  Clifford's inequalities, and the applications "Weierstrass curves have genus 1" and
  the degree-one-places ↔ Picard-group / elliptic-curve group-law link. Created
  2026-07-13 against Mathlib v4.31.0; unchanged since 2026-07-14 as of 2026-08-07.
- **Downstream consumer:**
  [`yuma-mizuno/markoff-modp`](https://github.com/yuma-mizuno/markoff-modp)
  (Apache-2.0) consumes its strong approximation for Markoff triples.
- **Upstreaming stack, statuses checked 2026-08-07** — all four open, none merged:
  [#41729](https://github.com/leanprover-community/mathlib4/pull/41729) (the formal
  divisor group of a Dedekind domain, `RingTheory/DedekindDomain/Divisor.lean`:
  divisors as finitely supported `ℤ`-valued functions on height-one primes, with
  `divisor`/`ofDivisor`/`divisorEquiv` bundling `FractionalIdeal.count` as an additive
  equivalence — exactly the shape of the README's Layer-3 affine dictionary;
  principal divisors and weighted degrees deliberately left for later PRs);
  [#41732](https://github.com/leanprover-community/mathlib4/pull/41732)
  (`ClassGroup` `mulEquiv_mk0`); [#41728](https://github.com/leanprover-community/mathlib4/pull/41728)
  (uniqueness of `ℤᵐ⁰` automorphisms); [#41696](https://github.com/leanprover-community/mathlib4/pull/41696)
  (`relNorm_eq_pow_of_isMaximal` generalized to separable fraction-field extensions).
- **Why independent development is the recorded route.** The repository root's
  porting rules require the authors' agreement before integrating existing work, and
  none is recorded; a roadmap that develops the same mathematics independently is
  required to cite the work (done, README §Existing formalizations and §Provenance)
  and to follow the shape of the Mathlib-bound parts (done, per the table row). If
  coordination with the author is later recorded, this file is where its outcome goes;
  the README's plan does not change unless the recorded outcome asks it to.

### Scheme-side and cohomological substrate, in detail

- **Giles campaign**: draft
  [#41621](https://github.com/leanprover-community/mathlib4/pull/41621) (2026-07-11,
  sorry-free WIP, ~6k lines) proves `χ(𝒪_X(D)) = deg D + χ(𝒪_X)` for locally
  Noetherian integral schemes of dimension ≤ 1 over a field, conditional on
  finiteness/vanishing of coherent cohomology. Merged substrate on Mathlib master and
  absent from the manifest revision above: `AlgebraicGeometry/AlgebraicCycle/Basic.lean`
  (#37901, 2026-06-25 — cycles as locally finite point functions on
  `Function.locallyFinsupp`), `AlgebraicGeometry/OrderOfVanishing.lean` (#29774,
  2026-07-02). Open stack: #38472 (principal Weil divisors), #38953 (the sheaf
  `𝒪_X(D)`), #41198 (degree of a zero-cycle), #41042, #38002, #41317, #40509.
- **Sheaf-cohomology substrate** (B. Nugent; with J. Riou's sites-level `Sheaf.H`
  already at the manifest revision): merged #34267/#35785/#34742/#32412 (abelian
  sheaves, flasque, cohomology API, Artinian schemes); open #36218 (long exact
  sequence), #35790 (flasque vanishing), #36345 (affine vanishing); J. Alama's
  Euler-characteristic PRs (#31121 merged, #29713 open). Infrastructure for the
  cohomological route; relevant only to Layer 12's contract statements.
- **Elliptic-curve upstream motion**: #25983 (Angdinata, affine scheme of an elliptic
  curve, open since 2025-06). The Angdinata–Xu ITP 2023 paper names "a version of the
  Riemann–Roch theorem" as future work; Mathlib's group law deliberately routes around
  RR via `ClassGroup`.
- **Graph Riemann–Roch** (Baker–Norine):
  `DhyeyMavani2003/chip-firing-with-lean` (Mavani–Pflueger, arXiv:2606.16679,
  sorry-free) — no mathematical overlap; a naming precedent for
  `Divisor`/`deg`/`genus`-style identifiers.
- **Other provers, checked 2026-07-30**: no Riemann–Roch for curves or function
  fields in Isabelle's AFP or in Coq/Rocq; the Coq elliptic-curve library explicitly
  avoids RR.

## Zulip threads of record

Audited 2026-07-30: `#Is-there-code-for-X?` > "Riemann-Roch" (latest activity
2025-12-19); `#Autoformalization` > "Jacobian challenge" (Merten's algebraic
reformulation of Buzzard's 2026 challenge; the merged JacobianChallenge roadmap is its
home in this repository); `#maths` > "thoughts on elliptic curves" (2020 — RR named as
the blocker). Community history: the Banff 2023 "Riemann–Roch race" blog post and the
AIM "Formalising algebraic geometry" workshop report (June 2024). Riemann–Roch has
been a named community target for years; the function-field lane is this roadmap's.
