<!--tauceti-status:v1 {"roadmap":"FreeGroupsAndLimitGroups","to_sha":"aa6e43e14b2556add36c8149e543f059a45926d3","ts":"2026-11-13T23:20:12Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 1","state":"done"},{"id":"Layer 2","remaining":"finite subgroup graph iff finitely generated (2.7(2)); primitive-recursive coding of Stallings graphs (2.9)","state":"partial"},{"id":"Layer 3","remaining":"primitive-recursive coding of formulas, substitution and prenex forms (3.1)","state":"partial"},{"id":"Layer 4","remaining":"Bass-Serre tree (4.7), structure theorem (4.8), 4.10-4.12 incl. Kurosh and Grushko; parts of 4.3, 4.4, 4.9, 4.10a","state":"partial"},{"id":"Layer 5","remaining":"the F x F separated-but-not-discriminated check stated in G-group form (5.3)","state":"partial"},{"id":"Layer 6","remaining":"6.0c-6.0d, 6.1a, 6.3, 6.4, 6.10; standard forms (6.6) and most radicals (6.8)","state":"partial"},{"id":"Layer 7","remaining":"length bound for minimal solutions (7.6), ET1-ET5 besides ET3, 7.9(3), Merzljakov (7.10)","state":"partial"},{"id":"Layer 8","remaining":"finite-rank abelian subgroups (8.2), G[X] discriminated by G, Lyndon completion (8.6a), 8.6b, 8.7-8.9","state":"partial"},{"id":"Layer 9","remaining":"Chiswell's theorem (9.3), infinite-word group structure (9.4), 9.5-9.7","state":"partial"},{"id":"Layer 10","remaining":"everything after the JSJ definitions: accessibility (10.1a), existence of JSJ decompositions (10.2) onward","state":"partial"},{"id":"Layer 11","remaining":"11.2, discriminating twist families (11.4), 11.4a-11.7","state":"partial"}],"readme_sha":"5d425c7eae0b434c9d5baf969ad3d05e96e69e77be25f77d950cb9b578b95c16","roadmap":"FreeGroupsAndLimitGroups","to_sha":"aa6e43e14b2556add36c8149e543f059a45926d3"}-->
# Status: FreeGroupsAndLimitGroups

This file documents the status of the FreeGroupsAndLimitGroups roadmap up until `aa6e43e` (2026-11-13T23:20:12Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Layer 1 is done, and Layer 2 is done apart from one statement and some computability coding. Layer 5 lacks only one check in its own language. Layer 8 is complete through §8.6, except finite rank of abelian subgroups. Layers 3, 4, 6, 7 and 9 are partial. Layers 10 and 11 have definitions but no theorems, and no headline target of Layers 7, 10 or 11 is proved.

### Named results

- **The Champetier–Guirardel theorem**: a group is a limit group exactly when it is finitely generated and fully residually free ([`TauCeti.LimitGroup.isLimitGroup_iff_isFullyResiduallyFree`](https://taucetiproject.org/docs/TauCeti/GroupTheory/LimitGroup/Characterization.html#TauCeti.LimitGroup.isLimitGroup_iff_isFullyResiduallyFree)).
- **Extensions of centralizers are discriminated**: in a CSA group with big powers, `G(u, ℤⁿ)` is discriminated by `G` ([`TauCeti.LimitGroup.CentralizerExt.isDiscriminatedBy`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/GroupTheory/LimitGroup/CentralizerExtension/Discrimination.html#TauCeti.LimitGroup.CentralizerExt.isDiscriminatedBy)). Iterating, every ICE group over a free group is fully residually free.
- **Howson's theorem**: in a free group, the intersection of two finitely generated subgroups is finitely generated ([`Subgroup.FG.inf_of_isFreeGroup`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/GroupTheory/FreeGroup/Howson.html#Subgroup.FG.inf_of_isFreeGroup)).
- **Schreier's index formula**: a subgroup of index `i` in a free group of rank `n` has rank `i(n − 1) + 1` ([`Subgroup.rank_sub_one_eq_index_mul_rank_sub_one`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/GroupTheory/FreeGroup/Schreier.html#Subgroup.rank_sub_one_eq_index_mul_rank_sub_one)).
- **Free groups are equationally Noetherian**: every system of equations over a free group of countable rank has a finite subsystem with the same solutions ([`TauCeti.GroupAlgGeom.isEquationallyNoetherian_of_freeGroupBasis`](https://taucetiproject.org/docs/TauCeti/GroupTheory/GroupAlgGeom/Linear.html#TauCeti.GroupAlgGeom.isEquationallyNoetherian_of_freeGroupBasis)). In finite rank this is Guba's theorem.

### Notable definitions and infrastructure

- **The Stallings graph** ([`TauCeti.StallingsGraph.stallingsGraph`](https://taucetiproject.org/docs/TauCeti/Combinatorics/Graph/Stallings/Construction.html#TauCeti.StallingsGraph.stallingsGraph)) is the folded core accepting a finitely generated subgroup. Spanning trees, product graphs, coset graphs and type graphs turn bases, intersections, index and conjugacy of subgroups into statements about finite graphs.
- **`G`-trees** ([`TauCeti.GTree`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/GroupTheory/GTree/Basic.html#TauCeti.GTree)) carry the elliptic–hyperbolic dichotomy, axes, domination and deformation spaces. JSJ trees are already defined on top of them, so they are what the Bass–Serre tree must produce.
- **Iterated extensions of centralizers** ([`TauCeti.LimitGroup.ICE`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/GroupTheory/LimitGroup/CentralizerExtension/Iterated.html#TauCeti.LimitGroup.ICE)) are chains of admissible centralizer extensions with retractions to the base. They are the model groups into which limit groups should embed (§8.7).

### Roadmap coverage

- **Layer 1** is done.
- **Layer 2** is done except two pieces: the statement that the subgroup graph is finite exactly when the subgroup is finitely generated (§2.7(2)), and the primitive-recursive coding of Stallings-graph data in §2.9.
- **Layer 5** is done except the `F × F` check of §5.3. Its content, that `F₂ × F₂` is residually free but not fully residually free, is proved in Layer 8's terms but not restated in `G`-group form.
- **Layer 8** is partial. §§8.1, 8.3–8.5a and 8.6 are done; §8.6 lacks only that `G[X]` is discriminated by `G`. §8.2 lacks finite rank of abelian subgroups. §8.7 has only embedding into products of limit groups, and §8.8 has only NTQ systems and levels. §§8.6a, 8.6b and 8.9 are missing.
- **Layer 3** is done except the primitive-recursive coding of formulas in §3.1.
- **Layer 4** has §§4.1, 4.2, 4.5, 4.6 and 4.13. §§4.3, 4.4, 4.9 and 4.10a are partial. The Bass–Serre tree and everything after it (§§4.7, 4.8, 4.10–4.12) are missing.
- **Layer 6** has surface groups, with boundary ones free and closed ones not (§6.2), and standard quadratic equations (§6.5). §§6.0a–6.0b, 6.1 and 6.6–6.9 are partial, and the rest is missing.
- **Layer 7** has §7.2, and §7.9(1)–(2) for free groups. §§7.1, 7.3–7.5 and 7.11 are partial. §7.6 is missing, so §§7.7–7.8 hold only conditionally. §7.10 is missing.
- **Layer 9** has §9.1. §§9.2–9.4 are partial and §§9.5–9.7 are missing.
- **Layer 10** has only the JSJ definitions of §10.1.
- **Layer 11** has §11.1 and the basic sequences of §11.3, but no lifting theorem.

## The frontier

- **Close out Layer 2.** State that the subgroup graph is finite exactly for finitely generated subgroups, which follows from existing lemmas. Then code finite Stallings graphs primitive-recursively.
- **Finite-rank abelian subgroups (§8.2).** In a finitely generated fully residually free group, abelian subgroups should be free abelian of finite rank. This is the one gap in Layer 8 below §8.6.
- **The Bass–Serre tree (§4.7).** The path model, the normal form and Serre's lemma are in place. The tree, its stabilizers and the structure theorem (§4.8) are needed before the Kurosh and Grushko theorems (§4.11) and the existence of JSJ decompositions (§10.2).
- **A length bound for minimal solutions (§7.6).** Solvability is already decidable given such a bound. Proving the bound, together with the remaining elementary transformations ET1, ET2, ET4 and ET5, would make the existential theory decidable (§§7.7–7.8).
- **Merzljakov's theorem (§7.10).** Merzljakov tuples exist and formal solutions are defined, with the easy direction proved. The theorem that a positive sentence true in `F` has a formal solution is not.
