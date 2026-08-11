# Provenance for the local Galois groups roadmap

**This file is not normative.** [`README.md`](README.md) is the specification. This record
documents the source extraction, declaration arbitration, and implementation material that may
inform the work. No source-file layout is a roadmap requirement.
No roadmap milestone or dependency depends on this file.

## Portfolio extraction record

This roadmap is assembled from two reviewed source revisions of
`roed-math/TauCetiRoadmap`:

| Source | Exact source revision | Extracted material |
|---|---|---|
| PR #2, Local Fields | `860e95df4902f4cc354def542347897d661cdcc1` | Layer 9 exact rank of the full `G_K`; local duality and Euler-characteristic inputs used in the proof; the local-field side of the old arithmetic input assembly |
| PR #3, Pro-`p` Groups | `da9fa831c97107f29381697e92044ae98c584dd0` | Layer 11 local application to `G_K(p)`; free/Demushkin cases; ranks; roots-of-unity `q`; cyclotomic orientation; marked local presentations; `G_{ℚ₂}(2) ≃ D₀`; `ℚ₂(√-2)` and `ℚ_p(μ_p)` examples |

The extraction boundary follows the arithmetic portfolio master plan. Material is mapped by
mathematical ownership rather than copied wholesale.

## Source-to-destination map

| Source unit at the recorded revision | Destination here | Arbitration |
|---|---|---|
| PR #3 `README.md`, Layer 11 arithmetic inputs and public local-field theorems | README Layers 1–6 | Rewritten to consume exact CFT/LFR/PC/PPG declarations directly |
| PR #3 `Suggested.lean`, `LocalFieldInputs` | no destination | Replaced by direct theorem dependencies; no private stand-in record |
| PR #3 `Suggested.lean`, `HasMuP` | theorem hypotheses in Layers 1–6 | Written intrinsically as `∃ ζ : K, IsPrimitiveRoot ζ p` |
| PR #3 `absoluteGaloisGroupProP` | Layer 0 `absoluteGaloisGroupProP` | Retained here as the arithmetic specialization of `ProfiniteProPGroups.maximalProPQuotient` |
| PR #3 degree-one/two inflation argument | Layers 1–2 | Split into a named degree-one isomorphism, degree-two injectivity, and degree-two surjectivity/isomorphism |
| PR #3 finite generation and rank theorems for `G_K(p)` | Layer 3 | Retained with field arguments and no input package |
| PR #3 free/Demushkin dichotomy | Layer 4 | Retained; abstract freeness and `IsDemushkin` remain supplier-owned |
| PR #3 `qInvariant` field | Layer 0 `localRootOfUnityOrder`, Layer 5 equality | Replaced by an intrinsic roots-of-unity cardinal and a theorem identifying it with `demushkinQ` |
| PR #3 cyclotomic fields of `LocalFieldInputs` | Layer 0 `localCyclotomicCharacter`, Layer 5 descent | Replaced by named arithmetic data and theorems, normalized through CFT |
| PR #3 marked Labute applications | Layer 6 | Retained as arithmetic applications of the final PPG marked-classification declarations |
| PR #3 abstract `D₀`, generators, orientation, and classification | `ProfiniteProPGroups` | Not duplicated here |
| PR #3 `absoluteGaloisGroupProP_two_ratPadic_marked` and unmarked corollary | Layer 8 | Retained here; this is the required marked local isomorphism |
| PR #3 `ℚ₂(√-2)` and `ℚ_p(μ_p)` examples | Layer 8 | Retained as end-to-end arithmetic acceptance results |
| PR #2 `ProPOps` and `ProPRankInputs` | no destination | Removed as cross-roadmap bundle interfaces; exact PPG declarations are consumed directly |
| PR #2 `rank_absoluteGaloisGroup_of_inputs` | no destination | Replaced by the direct public theorem, with its proof using named suppliers |
| PR #2 `rank_absoluteGaloisGroup` | Layer 7 | Retained with the exact `IsLeast` statement and moved to its arithmetic owner |
| PR #2 local duality, Kummer, Euler, and reciprocity declarations | `ClassFieldTheory` | Consumed here under their final namespace; not restated |
| PR #2 normalized valuation, unit filtration, power classes, ramification, tame quotient | `LocalFieldsRamification` | Consumed here under their final namespace; not restated |

## Preserved corrections and load-bearing choices

The source review established several points that remain explicit in the new roadmap:

- finite-dimensionality is separate from a finrank computation;
- the free case needs actual vanishing of `H²`, not `finrank = 0`;
- degree-two inflation needs a surjectivity argument in addition to five-term injectivity;
- the cyclotomic image must be pro-`p` before the character can descend to `G_K(p)`;
- the local Artin normalization carries the field norm for general `K` and an inverse;
- the full absolute Galois group has rank `N+2` even when `G_K(p)` is free of rank `N+1`;
- the dyadic even-rank presentation depends on the orientation image and retains the `U^[f]`
  family;
- the `ℚ₂` result is marked and preserves the orientation values
  `(-1, 1, (-3)⁻¹)`, not merely an abstract isomorphism;
- the `ℚ₂(√-2)` presentation remains an acceptance test for the corrected dyadic
  classification.

## Final ownership boundary

`ProfiniteProPGroups` owns all abstract group-theoretic carriers and classifications, including
`demushkinD0`, `d0A`, `d0S`, `d0Y`, and `standardD0Orientation`. It exports no theorem whose
statement names a local field or `Field.absoluteGaloisGroup`.

`LocalGaloisGroups` owns the specialization `G_K(p)`, all local arithmetic structure theorems,
and the marked isomorphism to `D₀`. Its dependency on `ProfiniteProPGroups`,
`LocalFieldsRamification`, `ClassFieldTheory`, and `ProfiniteCohomology` is one-way. None of those
roadmaps depends back on this one.

The exact CFT names consumed here are `GalRep`, `H`, `muNRep`, `kummerClass`,
`kummerEquiv_mixed`, `kummerCupPairing`, `localSymbol`, `finite_H`,
`h2MuEquivZMod_mixed`, `h2FpEquivZMod_of_mu`,
`tateDualityPairing_perfect_mixed`, `eulerCharacteristic_finrank_fp`, `artinMap`,
`cyclotomicCharacter_artinMap`, and `cyclotomicCharacter_artinMap_padic`.

## Same-owner implementation source

The same repository owner maintains `roed-math/gq2-lean`, revision
`d0714a7c431b64e18c422fb16cb5e93d79e5be25`, under Apache-2.0. Its maximal pro-`2` quotient,
finite-generation, Frattini, Demushkin, orientation, and reconstruction files may inform
implementations of the abstract supplier and the arithmetic bridge. Project-specific frozen-row
and word-complex arguments are not themselves public carriers for this roadmap. The roadmap
states the mathematical results intrinsically and does not prescribe that source's file layout.

## External consumer map

The `gq2-lean` label `B3c` corresponds to the normalized marked theorem
`absoluteGaloisGroupProP_two_ratPadic_marked`, together with the supplier-owned generators
`d0A`, `d0S`, `d0Y` and `standardD0Orientation`, its values
`(-1, 1, (-3)⁻¹)`, and its uniqueness from topological generation. This map is a reading aid,
not an additional milestone or dependency.

## References inherited from the sources

The mathematical source of record for the local classification is Labute, §5 and Theorems 7–9,
with NSW VII (7.5.11)–(7.5.12) as a modern formulation. Shafarevich supplies the free case.
Jarden–Shusterman Theorem 2.1 and NSW VII (7.4.1) supply the exact rank of the full absolute
Galois group. Complete bibliographic entries appear in the normative README.
