<!--tauceti-status:v1 {"roadmap":"FreeGroupsAndLimitGroups","to_sha":"a67a65006c07449dcb2ebe1a3a8b6bf6e0b909f8","ts":"2026-11-06T16:03:15Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 1","state":"done"},{"id":"Layer 2","remaining":"freeness of the graph group (2.2), chord bases and rank formulas (2.2a), finiteness and type graphs (2.7), 2.8, Howson (2.10), Schreier (2.11)","state":"partial"},{"id":"Layer 3","remaining":"primitive-recursive coding of terms and formulas (3.1)","state":"partial"},{"id":"Layer 4","remaining":"path form of the fundamental group and comparison (4.2), general normal form (4.3), 4.4, 4.6-4.13","state":"partial"},{"id":"Layer 5","remaining":"the F x F separated-but-not-discriminated check (5.3)","state":"partial"},{"id":"Layer 6","remaining":"polygonal moves and normal forms (6.0b) onward; everything on surface groups and quadratic equations","state":"partial"},{"id":"Layer 7","remaining":"positive formulas as single equations (7.9 part 3), generalised equations 7.1-7.8, Merzljakov (7.10-7.11)","state":"partial"},{"id":"Layer 8","remaining":"finite-rank abelian subgroups (8.2), ICE chains (8.5), discrimination of centralizer extensions (8.6), 8.6a-8.9","state":"partial"},{"id":"Layer 9","remaining":"Lambda-trees and free actions (9.2-9.3), infinite words (9.4) and everything after","state":"partial"},{"id":"Layer 10","state":"untouched"},{"id":"Layer 11","state":"untouched"}],"readme_sha":"5d425c7eae0b434c9d5baf969ad3d05e96e69e77be25f77d950cb9b578b95c16","roadmap":"FreeGroupsAndLimitGroups","to_sha":"a67a65006c07449dcb2ebe1a3a8b6bf6e0b909f8"}-->
# Status: FreeGroupsAndLimitGroups

This file documents the status of the FreeGroupsAndLimitGroups roadmap up until `a67a650` (2026-11-06T16:03:15Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Layer 1 is done. Layer 5 lacks only one counterexample. Layer 8 has its first summit: limit groups are the finitely generated fully residually free groups. Layers 2 and 3 are well advanced, and Layers 4, 6, 7 and 9 have their first results. Layers 10 and 11 have not begun, nor have the headline targets of Layers 7, 10 and 11.

### Named results

- **The Champetier–Guirardel theorem**: a group is a limit group exactly when it is finitely generated and fully residually free ([`TauCeti.LimitGroup.isLimitGroup_iff_isFullyResiduallyFree`](https://taucetiproject.org/docs/TauCeti/GroupTheory/LimitGroup/Characterization.html#TauCeti.LimitGroup.isLimitGroup_iff_isFullyResiduallyFree)).
- **The universal characterization of limit groups**: a group is a limit group exactly when it is finitely generated and satisfies every universal sentence of the group language true in `F₂` ([`TauCeti.LimitGroup.isLimitGroup_iff_forall_isUniversal`](https://taucetiproject.org/docs/TauCeti/GroupTheory/LimitGroup/UniversalTheory.html#TauCeti.LimitGroup.isLimitGroup_iff_forall_isUniversal)).
- **Free groups are equationally Noetherian**: every system of equations over a free group of countable rank has a finite subsystem with the same solutions ([`TauCeti.GroupAlgGeom.isEquationallyNoetherian_of_freeGroupBasis`](https://taucetiproject.org/docs/TauCeti/GroupTheory/GroupAlgGeom/Linear.html#TauCeti.GroupAlgGeom.isEquationallyNoetherian_of_freeGroupBasis)). In finite rank this is Guba's theorem. It is deduced from Sanov's embedding into `SL(2, ℤ)`.
- **Irreducibility is discrimination**: an algebraic set is irreducible exactly when its coordinate group is discriminated by the target group ([`TauCeti.GroupAlgGeom.isIrreducible_V_iff_isDiscriminatedBy`](https://taucetiproject.org/docs/TauCeti/GroupTheory/GroupAlgGeom/Irreducible/Basic.html#TauCeti.GroupAlgGeom.isIrreducible_V_iff_isDiscriminatedBy)). Over an equationally Noetherian group every closed set is an irredundant finite union of irreducible components ([`TauCeti.GroupAlgGeom.IsEquationallyNoetherian.exists_irreducible_decomposition`](https://taucetiproject.org/docs/TauCeti/GroupTheory/GroupAlgGeom/Irreducible/Components.html#TauCeti.GroupAlgGeom.IsEquationallyNoetherian.exists_irreducible_decomposition)).
- **Free groups are CSA**: every maximal abelian subgroup of a free group is malnormal ([`IsFreeGroup.isCSA`](https://taucetiproject.org/docs/TauCeti/GroupTheory/FreeGroup/CSA.html#IsFreeGroup.isCSA)). Fully residually free groups inherit this.

### Notable definitions and infrastructure

- **The space of marked groups** ([`TauCeti.LimitGroup.MarkedGroup`](https://taucetiproject.org/docs/TauCeti/GroupTheory/LimitGroup/MarkedGroup.html#TauCeti.LimitGroup.MarkedGroup)) records an `n`-marked group by its kernel in the Cantor space on `FreeGroup (Fin n)`. Because it is compact, limit groups can be defined as limits of free markings, which the Champetier–Guirardel theorem needs.
- **The Stallings graph** ([`TauCeti.StallingsGraph.stallingsGraph`](https://taucetiproject.org/docs/TauCeti/Combinatorics/Graph/Stallings/Construction.html#TauCeti.StallingsGraph.stallingsGraph)) is the folded based core obtained from the flower of a list of words, and it accepts exactly the subgroup they generate. Coset and product graphs turn containment and intersection into graph statements.
- **Extensions of centralizers** ([`TauCeti.LimitGroup.CentralizerExt`](https://taucetiproject.org/docs/TauCeti/GroupTheory/LimitGroup/CentralizerExtension/Basic.html#TauCeti.LimitGroup.CentralizerExt)) are the amalgams `G ∗_{C_G(u)} (C_G(u) × ℤⁿ)`, with their universal property, retractions `tᵢ ↦ u^kᵢ` and the HNN description in rank one. They are the objects that §8.6 must show are discriminated.

### Roadmap coverage

- **Layer 1** is done. §1.1's computability now covers conjugacy and proper powers. The §1.7 counterexample is proved in its HNN-extension form ([`Group.not_isCSA_hnnExtension_zpowers_sq`](https://taucetiproject.org/docs/TauCeti/GroupTheory/FreeGroup/CSA.html#Group.not_isCSA_hnnExtension_zpowers_sq)).
- **Layer 5** is done except for the `F × F` check of §5.3.
- **Layer 2** is partial. §§2.1–2.1a, 2.3–2.6 and 2.9 are done. §2.2 has spanning trees and the reduced-path group, but not its freeness. §2.2a has cycle lattices and spanning-forest counts, but no chord bases or rank formulas. §2.7 has coset graphs and the containment criterion. §§2.8, 2.10 and 2.11 are missing.
- **Layer 3** is done except for the primitive-recursive coding of syntax in §3.1.
- **Layer 8** is partial. §§8.1, 8.3, 8.4 and 8.5a are done, with the universal-theory clause of §8.4 stated as satisfying every universal sentence true in `F₂`. §8.2 lacks only finite rank of abelian subgroups, and §8.5 lacks only iterated chains. §8.6 onward is missing.
- **Layers 4, 6, 7 and 9** are partial, with first results only. Layer 4 has §4.1, the tree presentation of §4.2, and §4.5. Layer 6 has the polygonal surface models of §6.0a. Layer 7 has parts (1) and (2) of §7.9. Layer 9 has §9.1.
- **Layers 10 and 11** are untouched.

## The frontier

- **The `F × F` check (§5.3).** This is the last item in Layer 5: `F₂ × F₂` is separated but not discriminated by `F₂`. The roadmap's argument uses only commutation in free groups, which Layer 1 supplies.
- **Extensions of centralizers are discriminated (§8.6).** Big powers, the CSA conjugation lemmas and the retractions are in place. What remains is to show that the retractions `t ↦ u^k` eventually keep any nontrivial element nontrivial, then iterate to ICE groups.
- **Graph groups are free (§2.2).** The reduced-path group and spanning trees exist. What remains is the free basis given by non-tree edges. Explicit bases (§2.8), Howson's theorem (§2.10) and the exact Schreier formula (§2.11) build on it.
- **Positive formulas as single equations (§7.9(3)), then generalised equations (§7.1).** The reduction of finite systems to one equation is proved over torsion-free CSA groups with Vaught's condition, but that free groups satisfy that condition is not established here.
- **The path form of `π₁` and the normal form theorem (§§4.2–4.3).** Only the maximal-tree presentation exists. The path form, the comparison isomorphism and injectivity of vertex groups beyond one edge are needed before Bass–Serre trees (§4.7).
