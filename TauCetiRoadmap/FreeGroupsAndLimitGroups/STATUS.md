<!--tauceti-status:v1 {"roadmap":"FreeGroupsAndLimitGroups","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e","ts":"2026-11-19T18:22:01+11:00"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 1","state":"done"},{"id":"Layer 2","remaining":"primitive-recursive coding of Stallings graphs and subgroup tests (2.9)","state":"partial"},{"id":"Layer 3","remaining":"primitive-recursive coding of formulas, substitution and prenex forms (3.1)","state":"partial"},{"id":"Layer 4","remaining":"structure theorem (4.8), induced splittings, Kurosh and Grushko (4.10-4.12); parts of 4.3, 4.4, 4.9, 4.10a","state":"partial"},{"id":"Layer 5","state":"done"},{"id":"Layer 6","remaining":"6.0c-6.0d, 6.1a, full cutting and gluing (6.3), covers of surfaces (6.4), standard forms (6.6), most radicals (6.8)","state":"partial"},{"id":"Layer 7","remaining":"length bound for minimal solutions (7.6), ET1, ET2, ET4 and the rest of ET5, 7.9(3)","state":"partial"},{"id":"Layer 8","remaining":"finite-rank abelian subgroups (8.2), Lyndon completion (8.6a), 8.6b, 8.7-8.9","state":"partial"},{"id":"Layer 9","remaining":"free action on Chiswell's tree and the equivalence (9.3), infinite words (9.4), 9.5-9.7","state":"partial"},{"id":"Layer 10","remaining":"accessibility (10.1a), existence of JSJ decompositions (10.2) onward","state":"partial"},{"id":"Layer 11","remaining":"11.2, discriminating twist families (11.4), 11.4a-11.7","state":"partial"}],"readme_sha":"5d425c7eae0b434c9d5baf969ad3d05e96e69e77be25f77d950cb9b578b95c16","roadmap":"FreeGroupsAndLimitGroups","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e"}-->
# Status: FreeGroupsAndLimitGroups

This file documents the status of the FreeGroupsAndLimitGroups roadmap up until `b235000` (2026-11-19T18:22:01+11:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Layers 1 and 5 are done. Layer 2 lacks only primitive-recursive coding. Layer 8 is complete through §8.6 apart from finite rank of abelian subgroups. Layer 7 now has Merzljakov's theorem but not the length bound behind decidability. Layers 3, 4, 6 and 9 are partial. Layers 10 and 11 have definitions and preparatory lemmas but none of their headline theorems.

### Named results

- **Merzljakov's theorem**: over a nonabelian free group, a positive `∀∃` sentence holds exactly when its system has a formal solution in `G[X]`. This holds for arbitrary systems and in any rank ([`TauCeti.GroupAlgGeom.exists_isFormalSolution_iff_forallExistsAlt`](https://taucetiproject.org/docs/TauCeti/GroupTheory/GroupAlgGeom/FormalSolution.html#TauCeti.GroupAlgGeom.exists_isFormalSolution_iff_forallExistsAlt)).
- **The Champetier–Guirardel theorem**: a group is a limit group exactly when it is finitely generated and fully residually free ([`TauCeti.LimitGroup.isLimitGroup_iff_isFullyResiduallyFree`](https://taucetiproject.org/docs/TauCeti/GroupTheory/LimitGroup/Characterization.html#TauCeti.LimitGroup.isLimitGroup_iff_isFullyResiduallyFree)). Equivalently, it is finitely generated with the universal theory of a free group.
- **Extensions of centralizers are discriminated**: in a CSA group with big powers, `G(u, ℤⁿ)` is discriminated by `G` ([`TauCeti.LimitGroup.CentralizerExt.isDiscriminatedBy`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/GroupTheory/LimitGroup/CentralizerExtension/Discrimination.html#TauCeti.LimitGroup.CentralizerExt.isDiscriminatedBy)), and so is the free `G`-group `G[X]` ([`TauCeti.GroupAlgGeom.GX.isDiscriminatedBy`](https://taucetiproject.org/docs/TauCeti/GroupTheory/GroupAlgGeom/FreeDiscrimination.html#TauCeti.GroupAlgGeom.GX.isDiscriminatedBy)).
- **Free groups are equationally Noetherian**: every system of equations over a free group of any rank is equivalent to a finite subsystem ([`TauCeti.GroupAlgGeom.isEquationallyNoetherian_freeGroup`](https://taucetiproject.org/docs/TauCeti/GroupTheory/GroupAlgGeom/Linear.html#TauCeti.GroupAlgGeom.isEquationallyNoetherian_freeGroup)).
- **Howson's theorem**: in a free group, the intersection of two finitely generated subgroups is finitely generated ([`Subgroup.FG.inf_of_isFreeGroup`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/GroupTheory/FreeGroup/Howson.html#Subgroup.FG.inf_of_isFreeGroup)). Schreier's index formula is read off the same Stallings graphs.

### Notable definitions and infrastructure

- **The Bass–Serre tree** ([`TauCeti.GraphOfGroups.bassSerreTree`](https://taucetiproject.org/docs/TauCeti/GroupTheory/GraphOfGroups/BassSerreTree.html#TauCeti.GraphOfGroups.bassSerreTree)) is built from classes of paths in a graph of groups. Its stabilizers are the conjugates of the vertex and edge groups, and its quotient is the underlying graph when that graph is connected. It is the input to the structure theorem, to induced splittings, and to JSJ trees.
- **The Stallings graph** ([`TauCeti.StallingsGraph.stallingsGraph`](https://taucetiproject.org/docs/TauCeti/Combinatorics/Graph/Stallings/Construction.html#TauCeti.StallingsGraph.stallingsGraph)) turns bases, intersections, index and conjugacy of subgroups of a free group into statements about finite folded graphs.
- **Iterated extensions of centralizers** ([`TauCeti.LimitGroup.ICE`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/GroupTheory/LimitGroup/CentralizerExtension/Iterated.html#TauCeti.LimitGroup.ICE)) are the model groups into which limit groups should embed. Free products `H[X]` and `H ∗ ℤⁿ` over a nonabelian fully residually free `H` already embed in them.

### Roadmap coverage

- **Layers 1 and 5** are done.
- **Layer 2** is done except for the primitive-recursive coding of Stallings-graph data (§2.9).
- **Layer 3** is done except for the primitive-recursive coding of formulas in §3.1.
- **Layer 8** has §§8.1, 8.3–8.6. §8.2 lacks finite rank of abelian subgroups. §8.6a has only the universal property of exponential completions, §8.7 has partial embedding results, and §8.8 has towers and regular systems. §§8.6b and 8.9 are missing.
- **Layer 7** has §§7.2 and 7.10, and §7.9(1)–(2). §7.6 is missing, so §§7.7–7.8 hold only conditionally. Of the elementary transformations, only ET3 and the first kind of ET5 are done.
- **Layer 4** has §§4.1–4.2, 4.5–4.7 and 4.13, with §§4.3, 4.4, 4.9 and 4.10a partial. The structure theorem (§4.8), induced splittings and Kurosh–Grushko (§§4.10–4.12) are missing.
- **Layer 6** has §§6.2 and 6.5. Gluing along a separating curve (§6.3) and the rank formula for finite-index subgroups with boundary (§6.4) are partial, and QH vertices (§6.10) are defined.
- **Layer 9** has §9.1. Chiswell's tree is a `Λ`-tree, but the action and the equivalence of §9.3 are missing, as are §§9.5–9.7.
- **Layers 10 and 11** have JSJ trees, QH structures, Makanin–Razborov diagrams, cut equations, basic sequences and twist lifts, but no headline theorem.

## The frontier

- **The structure theorem (§4.8).** The Bass–Serre tree is in place, and every quotient graph now has a lifting into its tree. What remains is the graph of groups on the quotient and the isomorphism of the tree with its Bass–Serre tree. Kurosh, Grushko and the existence of JSJ decompositions (§10.2) wait on it.
- **A length bound for minimal solutions (§7.6).** Solvability is decidable given such a bound. With ET1, ET2, ET4 and the rest of ET5, it would make the existential theory decidable (§§7.7–7.8).
- **Finite-rank abelian subgroups (§8.2).** In a finitely generated fully residually free group, abelian subgroups should be free abelian of finite rank. This is the last gap in Layer 8 below §8.6a.
- **Lyndon's completion (§8.6a).** The universal property of an exponential completion is defined. What is missing is the construction of `F^{ℤ[t]}` as a chain of centralizer extensions.
- **Chiswell's theorem (§9.3).** The tree exists. The group must act on it freely, with the length function as translation length at the root, before infinite words (§9.4) can follow.
