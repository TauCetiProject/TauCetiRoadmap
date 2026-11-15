<!--tauceti-status:v1 {"roadmap":"ProfiniteProPGroups","to_sha":"aa6e43e14b2556add36c8149e543f059a45926d3","ts":"2026-11-13T23:20:12Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","state":"done"},{"id":"Layer 1","state":"done"},{"id":"Layer 2","state":"done"},{"id":"Layer 3","state":"done"},{"id":"Layer 4","state":"done"},{"id":"Layer 5","state":"done"},{"id":"Layer 6","state":"done"},{"id":"Layer 7","state":"done"},{"id":"Layer 8","state":"done"},{"id":"Layer 9","state":"done"},{"id":"Layer 10","state":"done"}],"readme_sha":"53bd065de03d8458d549d580e34beea17b0913b225f138062c31048bce7c6ce3","roadmap":"ProfiniteProPGroups","to_sha":"aa6e43e14b2556add36c8149e543f059a45926d3"}-->
# Status: ProfiniteProPGroups

This file documents the status of the ProfiniteProPGroups roadmap up until `aa6e43e` (2026-11-13T23:20:12Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Every layer is done. The summit, the classification of Demushkin groups, is proved in every case and stated as an equivalence. Current work revises and relocates results that are already proved, and adds small supporting lemmas. It opens no new targets.

### Named results

- **The classification of Demushkin groups** — two Demushkin groups are [isomorphic if and only if](https://taucetiproject.org/docs/TauCeti/Topology/Algebra/Group/Profinite/Demushkin/NormalForm/Uniqueness.html#TauCeti.IsDemushkin.nonempty_continuousMulEquiv_iff) they have the same rank and their canonical characters have the same image. This covers Labute's Theorems 2, 3, 5 and 6. The relator-level form is [Labute's Theorem 2](https://taucetiproject.org/docs/TauCeti/Topology/Algebra/Group/Profinite/Demushkin/NormalForm/Uniqueness.html#TauCeti.freeProP.exists_continuousMulEquiv_apply_eq_of_range_demushkinCharacter_eq): two relators whose presented Demushkin groups have the same character image differ by an automorphism of the free pro-`p` group.
- **Tate's theorem** — an infinite Demushkin group has [`cd_p G = 2`](https://taucetiproject.org/docs/TauCeti/Topology/Algebra/Group/Profinite/Demushkin/CohomologicalDimension.html#TauCeti.IsDemushkin.cohomologicalDimensionAt_eq_two). Its cup-product pairing into `H²(G, 𝔽_p)` is [perfect on every finite module killed by `p`](https://taucetiproject.org/docs/TauCeti/Topology/Algebra/Group/Profinite/Demushkin/Duality/Basic.html#TauCeti.IsDemushkin.dualityMap1_bijective).
- **The open-subgroup theorem** — an [open subgroup of an infinite Demushkin group is Demushkin](https://taucetiproject.org/docs/TauCeti/Topology/Algebra/Group/Profinite/Demushkin/OpenSubgroup.html#TauCeti.IsDemushkin.openSubgroup), of rank `2 + [G : U](n(G) − 2)`. Together with the classification, this [fixes its isomorphism type](https://taucetiproject.org/docs/TauCeti/Topology/Algebra/Group/Profinite/Demushkin/NormalForm/OpenSubgroup.html#TauCeti.IsDemushkin.nonempty_continuousMulEquiv_openSubgroup_iff) from the index and the character image `χ(U)`.
- **Serre's theorem at arbitrary rank** — a pro-`p` group has `cd_p ≤ 1` exactly when it is [free pro-`p` on a pointed profinite space](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Topology/Algebra/Group/Profinite/Free/Pointed/Serre.html#TauCeti.IsProP.cohomologicalDimensionAt_le_one_iff_exists_convergesToOne_continuousMulEquiv_presentation).
- **The Golod–Shafarevich inequality** — a nontrivial finite `p`-group [satisfies `d(G)² < 4 r(G)`](https://taucetiproject.org/docs/TauCeti/Topology/Algebra/Group/Profinite/ProP/GolodShafarevich.html#IsPGroup.sq_topologicalGeneratorRankNat_lt_four_mul_finrank_cohomFp_two). Here the relation rank `r(G)` is [the dimension of `H²(G, 𝔽_p)`](https://taucetiproject.org/docs/TauCeti/Topology/Algebra/Group/Profinite/ProP/Relation/Rank.html#TauCeti.presentedProP.finrank_H2).

### Notable definitions and infrastructure

- **The Demushkin predicate and Labute's criterion** — [`TauCeti.IsDemushkin`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Topology/Algebra/Group/Profinite/Demushkin/Basic.html#TauCeti.IsDemushkin) agrees with Labute's cup-form definition. A one-relator group with relator in the Frattini subgroup is Demushkin [exactly when the degree-one form of its relator is nondegenerate](https://taucetiproject.org/docs/TauCeti/Topology/Algebra/Group/Profinite/Demushkin/Criterion.html#TauCeti.isDemushkin_iff_nondegenerate_degreeOneForm). This turns questions about Demushkin groups into linear algebra on relators.
- **Successive approximation** — [a relator that agrees with a model modulo the lower `p`-series can be moved onto it by an automorphism](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Topology/Algebra/Group/Profinite/Free/SuccessiveApproximation/Basic.html#TauCeti.freeProP.exists_continuousMulEquiv_apply_eq_of_range_basisModificationDelta_eq_top). Every uniqueness proof in the classification runs on it.
- **The Frattini subgroup of a profinite group** — [`TauCeti.profiniteFrattini`](https://taucetiproject.org/docs/TauCeti/Topology/Algebra/Group/Profinite/Frattini.html#TauCeti.profiniteFrattini), the intersection of the maximal open subgroups. Generation [can be tested modulo it](https://taucetiproject.org/docs/TauCeti/Topology/Algebra/Group/Profinite/Frattini.html#TauCeti.topologicalClosure_closure_eq_top_iff_quotient_profiniteFrattini).

### Roadmap coverage

All eleven layers, 0 through 10, are done, and the roadmap's README has not changed since that assessment. The newest work adds support to finished layers:

- **Layers 0–1:** the open normal core of an open subgroup of finite index, and primewise and tower formulas for [supernatural index](https://taucetiproject.org/docs/TauCeti/Topology/Algebra/Group/Profinite/Index/Tower.html#Subgroup.profiniteIndex_subgroupOf_add_profiniteIndex).
- **Layer 5:** a [chosen continuous section](https://taucetiproject.org/docs/TauCeti/Topology/Algebra/GroupExtension/Profinite.html#TauCeti.ProfiniteGroupExtension.continuousSection) of a profinite extension.
- **Layers 7–9:** small Demushkin lemmas, such as the fact that `{±1} × U^(f)` is not procyclic.

Earlier windows sharpened Layers 5–7 in three ways: continuous splitting over projective pro-`p` groups, Serre's comparison of `cd_p` along open subgroups of index prime to `p`, and the Euler-characteristic formulas.

## The frontier

- **No named milestone remains open.** Every layer's statements are proved in the library.
- **Labute's factorizations are unused by the classification** — Theorems 5 and 6 were proved by constrained successive approximation instead. The README's planned route went through factorizations of the relator class, including the `2`-adic extension in the `{±1} × U^(f)` branch. Those factorizations exist, but nothing else in the library uses them.
- **Consumers downstream** — `LocalGaloisGroups` named two inputs from this roadmap: the pro-`p` kernel theorem and lifting along an extension class. Both exist. So does the continuous splitting of pro-`p` extensions over free pro-`p` groups with prescribed values on generators.
