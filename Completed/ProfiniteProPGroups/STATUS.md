<!--tauceti-status:v1 {"roadmap":"ProfiniteProPGroups","to_sha":"d2083f0f1dd2136d02467ba36efbbe1af612e89c","ts":"2026-11-08T09:37:56Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","state":"done"},{"id":"Layer 1","state":"done"},{"id":"Layer 2","state":"done"},{"id":"Layer 3","state":"done"},{"id":"Layer 4","state":"done"},{"id":"Layer 5","state":"done"},{"id":"Layer 6","state":"done"},{"id":"Layer 7","state":"done"},{"id":"Layer 8","state":"done"},{"id":"Layer 9","state":"done"},{"id":"Layer 10","state":"done"}],"readme_sha":"53bd065de03d8458d549d580e34beea17b0913b225f138062c31048bce7c6ce3","roadmap":"ProfiniteProPGroups","to_sha":"d2083f0f1dd2136d02467ba36efbbe1af612e89c"}-->
# Status: ProfiniteProPGroups

This file documents the status of the ProfiniteProPGroups roadmap up until `d2083f0` (2026-11-08T09:37:56Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Every layer is done. The summit, the classification of Demushkin groups, is proved in every case and stated as an equivalence. Current work consolidates a finished roadmap and opens no new targets.

### Named results

- **The classification of Demushkin groups** — two Demushkin groups are [isomorphic if and only if](https://taucetiproject.org/docs/TauCeti/Topology/Algebra/Group/Profinite/Demushkin/NormalForm/Uniqueness.html#TauCeti.IsDemushkin.nonempty_continuousMulEquiv_iff) they have the same rank and their canonical characters have the same image. This covers Labute's Theorems 2, 3, 5 and 6; the dyadic normal forms, such as [Theorem 3 case (2) in odd rank](https://taucetiproject.org/docs/TauCeti/Topology/Algebra/Group/Profinite/Demushkin/NormalForm/Two/Odd/Exact.html#TauCeti.freeProP.exists_continuousMulEquiv_apply_eq_demushkinWordTwoOdd_of_odd), are now stated on their own.
- **Tate's theorem** — an infinite Demushkin group has [`cd_p G = 2`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Topology/Algebra/Group/Profinite/Demushkin/CohomologicalDimension.html#TauCeti.IsDemushkin.cohomologicalDimensionAt_eq_two). Its cup pairings into `I(χ)/pⁱ` are [perfect on every finite module killed by `pⁱ`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Topology/Algebra/Group/Profinite/Demushkin/Duality/Twisted.html#TauCeti.IsDemushkin.dualityMap1_zModTwist_bijective).
- **The open-subgroup theorem** — an [open subgroup of an infinite Demushkin group is Demushkin](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Topology/Algebra/Group/Profinite/Demushkin/OpenSubgroup.html#TauCeti.IsDemushkin.openSubgroup), of rank `2 + [G : U](n(G) − 2)`. With the classification this [fixes its isomorphism type](https://taucetiproject.org/docs/TauCeti/Topology/Algebra/Group/Profinite/Demushkin/NormalForm/OpenSubgroup.html#TauCeti.IsDemushkin.nonempty_continuousMulEquiv_openSubgroup_iff) from the index and the character image `χ(U)`.
- **Serre's theorem at arbitrary rank** — a pro-`p` group has `cd_p ≤ 1` exactly when it is [free pro-`p` on a pointed profinite space](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Topology/Algebra/Group/Profinite/Free/Pointed/Serre.html#TauCeti.IsProP.cohomologicalDimensionAt_le_one_iff_exists_convergesToOne_continuousMulEquiv_presentation).
- **The Golod–Shafarevich inequality** — a nontrivial finite `p`-group [satisfies `d(G)² < 4 r(G)`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Topology/Algebra/Group/Profinite/ProP/GolodShafarevich.html#IsPGroup.sq_topologicalGeneratorRankNat_lt_four_mul_finrank_cohomFp_two).

### Notable definitions and infrastructure

- **The Demushkin predicate** — [`TauCeti.IsDemushkin`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Topology/Algebra/Group/Profinite/Demushkin/Basic.html#TauCeti.IsDemushkin) agrees with Labute's cup-form definition. Its `q`-invariant and canonical character sort the groups into the normal-form cases.
- **Successive approximation** — [a relator that agrees with a model modulo the lower `p`-series can be moved onto it by an automorphism](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Topology/Algebra/Group/Profinite/Free/SuccessiveApproximation/Basic.html#TauCeti.freeProP.exists_continuousMulEquiv_apply_eq_of_range_basisModificationDelta_eq_top). This drives every uniqueness proof in the classification.
- **The Frattini subgroup of a profinite group** — [`TauCeti.profiniteFrattini`](https://taucetiproject.org/docs/TauCeti/Topology/Algebra/Group/Profinite/Frattini.html#TauCeti.profiniteFrattini), the intersection of the maximal open subgroups. Generation [can be tested modulo it](https://taucetiproject.org/docs/TauCeti/Topology/Algebra/Group/Profinite/Frattini.html#TauCeti.topologicalClosure_closure_eq_top_iff_quotient_profiniteFrattini), and [every lift of a generating family along a Frattini cover generates](https://taucetiproject.org/docs/TauCeti/Topology/Algebra/Group/Profinite/Frattini.html#TauCeti.topologicalClosure_closure_range_eq_top_of_ker_le_profiniteFrattini).

### Roadmap coverage

All eleven layers, 0 through 10, are done. Recent work restates or generalises results the finished layers already use: [Gaschütz's lemma](https://taucetiproject.org/docs/TauCeti/GroupTheory/Gaschutz.html#MonoidHom.exists_comp_eq_and_closure_range_eq_top_of_surjective) and [Schreier's index formula](https://taucetiproject.org/docs/TauCeti/GroupTheory/Schreier.html#Subgroup.exists_finset_card_le_one_add_index_mul) as general group theory, and the [trivial-filtration theorem](https://taucetiproject.org/docs/TauCeti/Topology/Algebra/Group/Profinite/ProP/Filtration.html#TauCeti.exists_filtration_with_trivial_factors_of_isProP) for continuous pro-`p` actions on finite `p`-primary modules. Earlier windows sharpened Layers 5–7 with continuous splitting over projective pro-`p` groups, Serre's comparison of `cd_p` along open subgroups of index prime to `p`, and the Euler-characteristic formulas.

## The frontier

- **No named milestone remains open.** Every layer's statements are proved in the library.
- **Labute's factorizations are unused by the classification** — Theorems 5 and 6 were proved by constrained successive approximation. The factorizations of the relator class, extended to `2`-adic exponents in the `{±1} × U^(f)` branch, complete the README's planned route but are not used elsewhere in the library.
- **Consumers downstream** — `LocalGaloisGroups` named the pro-`p` kernel theorem and lifting along an extension class as its inputs. Both exist, as does the continuous splitting of pro-`p` extensions over free pro-`p` groups with prescribed values on generators.
