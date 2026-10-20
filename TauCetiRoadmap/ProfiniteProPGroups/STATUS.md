<!--tauceti-status:v1 {"roadmap":"ProfiniteProPGroups","to_sha":"c7ae9d762d2bc9436e7c2ed5006e64ac24822b2d","ts":"2026-10-13T09:39:50+11:00"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","state":"done"},{"id":"Layer 1","state":"done"},{"id":"Layer 2","state":"done"},{"id":"Layer 3","state":"done"},{"id":"Layer 4","state":"done"},{"id":"Layer 5","state":"done"},{"id":"Layer 6","state":"done"},{"id":"Layer 7","state":"done"},{"id":"Layer 8","state":"done"},{"id":"Layer 9 prerequisites","state":"done"},{"id":"Layer 9","state":"done"},{"id":"Layer 10","state":"done"}],"readme_sha":"4a432bdd8ba446c50ca1a84a1e0022bf7faa6df9515a56b46bad363a9d2281f7","roadmap":"ProfiniteProPGroups","to_sha":"c7ae9d762d2bc9436e7c2ed5006e64ac24822b2d"}-->
# Status: ProfiniteProPGroups

This file documents the status of the ProfiniteProPGroups roadmap up until `c7ae9d7` (2026-10-13T09:39:50+11:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Every layer is done. The summit, the classification of Demushkin groups, is proved in every case. Recent work has added consequences around the edges of the roadmap and has not opened new targets.

### Named results

- **The classification of Demushkin groups** — two Demushkin groups with the same rank and the same image of the canonical character [are isomorphic](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Topology/Algebra/Group/Profinite/Demushkin/NormalForm/Uniqueness.html#TauCeti.IsDemushkin.nonempty_continuousMulEquiv_of_range_demushkinCharacter_eq). This covers Labute's Theorems 2, 3, 5 and 6, including the dyadic branch with image `{±1} × U^(f)` ([Theorem 6](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Topology/Algebra/Group/Profinite/Demushkin/NormalForm/Two/Even/UnitsPlusMinus.html#TauCeti.IsDemushkin.nonempty_continuousMulEquiv_of_even_demushkinRank_of_range_eq_unitsPlusMinus)).
- **Tate's theorem** — an infinite Demushkin group has [`cd_p G = 2`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Topology/Algebra/Group/Profinite/Demushkin/CohomologicalDimension.html#TauCeti.IsDemushkin.cohomologicalDimensionAt_eq_two). Its cup pairings into `I(χ)/pⁱ` are [perfect on every finite module killed by `pⁱ`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Topology/Algebra/Group/Profinite/Demushkin/Duality/Twisted.html#TauCeti.IsDemushkin.dualityMap1_zModTwist_bijective).
- **The open-subgroup theorem** — an [open subgroup of an infinite Demushkin group is Demushkin](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Topology/Algebra/Group/Profinite/Demushkin/OpenSubgroup.html#TauCeti.IsDemushkin.openSubgroup), with rank given by [Schreier's formula `n(U) − 2 = [G : U](n(G) − 2)`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Topology/Algebra/Group/Profinite/Demushkin/OpenSubgroup.html#TauCeti.IsDemushkin.demushkinRank_openSubgroup_sub_two).
- **Serre's theorem at arbitrary rank** — a pro-`p` group has `cd_p ≤ 1` exactly when it is [free pro-`p` on a pointed profinite space](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Topology/Algebra/Group/Profinite/Free/Pointed/Serre.html#TauCeti.IsProP.cohomologicalDimensionAt_le_one_iff_exists_convergesToOne_continuousMulEquiv_presentation). Relatedly, an extension of a projective pro-`p` group by a pro-`p` group [splits continuously](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Topology/Algebra/Group/Profinite/EmbeddingProblem/Extension.html#GroupExtension.exists_splitting_continuous_of_isProjective).
- **The Golod–Shafarevich inequality** — a nontrivial finite `p`-group [satisfies `d(G)² < 4 r(G)`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Topology/Algebra/Group/Profinite/ProP/GolodShafarevich.html#IsPGroup.sq_topologicalGeneratorRankNat_lt_four_mul_finrank_cohomFp_two).

### Notable definitions and infrastructure

- **The Demushkin predicate** — [`TauCeti.IsDemushkin`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Topology/Algebra/Group/Profinite/Demushkin/Basic.html#TauCeti.IsDemushkin) agrees with Labute's cup-form definition. Its `q`-invariant and canonical character sort the groups into the normal-form cases.
- **Successive approximation** — [a relator that agrees with a model modulo the lower `p`-series can be moved onto it by an automorphism](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Topology/Algebra/Group/Profinite/Free/SuccessiveApproximation/Basic.html#TauCeti.freeProP.exists_continuousMulEquiv_apply_eq_of_range_basisModificationDelta_eq_top). This drives every uniqueness proof in the classification.
- **Abelian pro-`p` groups as `ℤ_p`-modules** — their closed subgroups [are the closed submodules](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Topology/Algebra/Group/Profinite/ProP/ClosedSubmodule.html#TauCeti.IsProP.closedSubgroupSubmoduleOrderIso). A topologically finitely generated one is [`ℤ_p^r × T` as a topological module](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Topology/Algebra/Group/Profinite/ProP/Torsion.html#TauCeti.IsProP.exists_continuousLinearEquiv_pi_padicInt_prod_torsion), so module arguments apply to abelianizations and character kernels.

### Roadmap coverage

All twelve entries are done: Layers 0 through 10 and the Layer 9 prerequisites. The latest additions sharpen finished layers. In Layer 3, [closure under extensions](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Topology/Algebra/Group/Profinite/ProP/Extension.html#TauCeti.IsProP.of_ker_isProP) is now stated for an open surjection with pro-`p` kernel. Layer 3 also gained the fact that the [maximal pro-`p` quotient is trivial when `p` is absent from the supernatural order](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Topology/Algebra/Group/Profinite/ProP/Order.html#TauCeti.maximalProPQuotient.subsingleton_of_profiniteOrder_apply_eq_zero), which ties it to Layer 1. Layer 5 gained the splitting of pro-`p` extensions over projective and free pro-`p` groups, and the invariance of presented groups under a change of relators with [the same closed normal closure](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Topology/Algebra/Group/Profinite/Presentation/Basic.html#TauCeti.presentedProP.congrOfClosureEq).

## The frontier

- **No named milestone remains open.** Every layer's statements are proved in the library.
- **Labute's factorizations are unused by the classification** — Theorems 5 and 6 were proved by constrained successive approximation. The factorizations of the relator class complete the README's planned route but are not yet used anywhere.
- **Consumers downstream** — `LocalGaloisGroups` named the pro-`p` kernel theorem and lifting along an extension class as its inputs. Both exist, and so does the continuous splitting of pro-`p` extensions over free pro-`p` groups with prescribed values on generators.
