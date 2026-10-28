<!--tauceti-status:v1 {"roadmap":"ProfiniteProPGroups","to_sha":"69cd1ab4dcfbb6676e344f3f193e63473eab5a3d","ts":"2026-10-25T14:11:34Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","state":"done"},{"id":"Layer 1","state":"done"},{"id":"Layer 2","state":"done"},{"id":"Layer 3","state":"done"},{"id":"Layer 4","state":"done"},{"id":"Layer 5","state":"done"},{"id":"Layer 6","state":"done"},{"id":"Layer 7","state":"done"},{"id":"Layer 8","state":"done"},{"id":"Layer 9 prerequisites","state":"done"},{"id":"Layer 9","state":"done"},{"id":"Layer 10","state":"done"}],"readme_sha":"4a432bdd8ba446c50ca1a84a1e0022bf7faa6df9515a56b46bad363a9d2281f7","roadmap":"ProfiniteProPGroups","to_sha":"69cd1ab4dcfbb6676e344f3f193e63473eab5a3d"}-->
# Status: ProfiniteProPGroups

This file documents the status of the ProfiniteProPGroups roadmap up until `69cd1ab` (2026-10-25T14:11:34Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Every layer is done. The summit, the classification of Demushkin groups, is proved in every case and is now stated as an equivalence. Recent work adds consequences and supporting theory around a finished roadmap and opens no new targets.

### Named results

- **The classification of Demushkin groups** — two Demushkin groups are [isomorphic if and only if](https://taucetiproject.org/docs/TauCeti/Topology/Algebra/Group/Profinite/Demushkin/NormalForm/Uniqueness.html#TauCeti.IsDemushkin.nonempty_continuousMulEquiv_iff) they have the same rank and their canonical characters have the same image. This covers Labute's Theorems 2, 3, 5 and 6, including the dyadic branch with image `{±1} × U^(f)` ([Theorem 6](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Topology/Algebra/Group/Profinite/Demushkin/NormalForm/Two/Even/UnitsPlusMinus.html#TauCeti.IsDemushkin.nonempty_continuousMulEquiv_of_even_demushkinRank_of_range_eq_unitsPlusMinus)).
- **Tate's theorem** — an infinite Demushkin group has [`cd_p G = 2`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Topology/Algebra/Group/Profinite/Demushkin/CohomologicalDimension.html#TauCeti.IsDemushkin.cohomologicalDimensionAt_eq_two). Its cup pairings into `I(χ)/pⁱ` are [perfect on every finite module killed by `pⁱ`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Topology/Algebra/Group/Profinite/Demushkin/Duality/Twisted.html#TauCeti.IsDemushkin.dualityMap1_zModTwist_bijective).
- **The open-subgroup theorem** — an [open subgroup of an infinite Demushkin group is Demushkin](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Topology/Algebra/Group/Profinite/Demushkin/OpenSubgroup.html#TauCeti.IsDemushkin.openSubgroup), with rank `2 + [G : U](n(G) − 2)` by Schreier's formula. With the classification this [fixes its isomorphism type](https://taucetiproject.org/docs/TauCeti/Topology/Algebra/Group/Profinite/Demushkin/NormalForm/OpenSubgroup.html#TauCeti.IsDemushkin.nonempty_continuousMulEquiv_openSubgroup_iff) from the index and the character image `χ(U)`.
- **Serre's theorem at arbitrary rank** — a pro-`p` group has `cd_p ≤ 1` exactly when it is [free pro-`p` on a pointed profinite space](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Topology/Algebra/Group/Profinite/Free/Pointed/Serre.html#TauCeti.IsProP.cohomologicalDimensionAt_le_one_iff_exists_convergesToOne_continuousMulEquiv_presentation).
- **The Golod–Shafarevich inequality** — a nontrivial finite `p`-group [satisfies `d(G)² < 4 r(G)`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Topology/Algebra/Group/Profinite/ProP/GolodShafarevich.html#IsPGroup.sq_topologicalGeneratorRankNat_lt_four_mul_finrank_cohomFp_two).

### Notable definitions and infrastructure

- **The Demushkin predicate** — [`TauCeti.IsDemushkin`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Topology/Algebra/Group/Profinite/Demushkin/Basic.html#TauCeti.IsDemushkin) agrees with Labute's cup-form definition. Its `q`-invariant and canonical character sort the groups into the normal-form cases.
- **Successive approximation** — [a relator that agrees with a model modulo the lower `p`-series can be moved onto it by an automorphism](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Topology/Algebra/Group/Profinite/Free/SuccessiveApproximation/Basic.html#TauCeti.freeProP.exists_continuousMulEquiv_apply_eq_of_range_basisModificationDelta_eq_top). This drives every uniqueness proof in the classification.
- **The Frattini subgroup of a profinite group** — [`TauCeti.profiniteFrattini`](https://taucetiproject.org/docs/TauCeti/Topology/Algebra/Group/Profinite/Frattini.html#TauCeti.profiniteFrattini) is the intersection of the maximal open subgroups. Generation [can be tested modulo it](https://taucetiproject.org/docs/TauCeti/Topology/Algebra/Group/Profinite/Frattini.html#TauCeti.topologicalClosure_closure_eq_top_iff_quotient_profiniteFrattini), and for pro-`p` groups it is the pro-`p` Frattini subgroup of Layer 3.

### Roadmap coverage

All twelve entries are done: Layers 0 through 10 and the Layer 9 prerequisites. Recent additions sharpen finished layers. Layer 6 gained Serre's comparison [`cd_p G ≤ cd_p U` for an open subgroup of index prime to `p`](https://taucetiproject.org/docs/TauCeti/RepresentationTheory/Homological/ContCohomology/CohomologicalDimension/IndexNotDvd.html#TauCeti.cohomologicalDimensionAt_le_of_not_dvd_index), and restriction to a Sylow pro-`p` subgroup is now known to be injective. The two- and three-term Euler formulas of Layers 6 and 7 are now stated as identities between `𝔽_p`-dimensions for an open subgroup, under `cd_p ≤ 1` and `cd_p ≤ 2` respectively. In Layer 9 the dyadic even-rank normal form now [allows a genuinely `2`-adic exponent](https://taucetiproject.org/docs/TauCeti/Topology/Algebra/Group/Profinite/Demushkin/NormalForm/Two/Even/PadicExponent/Marked.html#TauCeti.isDemushkin_marked_of_q_two_even_padic), with the marked classification in both finite-level branches of Labute's table. Earlier, Layer 5 gained the continuous splitting of pro-`p` extensions over projective pro-`p` groups.

## The frontier

- **No named milestone remains open.** Every layer's statements are proved in the library.
- **Labute's factorizations are unused by the classification** — Theorems 5 and 6 were proved by constrained successive approximation. The factorizations of the relator class, now extended to `2`-adic exponents in the `{±1} × U^(f)` branch, complete the README's planned route but are not used anywhere else in the library.
- **Consumers downstream** — `LocalGaloisGroups` named the pro-`p` kernel theorem and lifting along an extension class as its inputs. Both exist, as does the continuous splitting of pro-`p` extensions over free pro-`p` groups with prescribed values on generators.
