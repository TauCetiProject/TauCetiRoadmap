<!--tauceti-status:v1 {"roadmap":"FreeGroupsAndLimitGroups","to_sha":"afa08a3ed16fb167e35de371afb1eb03fbc5913a","ts":"2026-11-06T05:03:45Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 1","state":"done"},{"id":"Layer 2","remaining":"freeness and rank of the graph path group (2.2), Stallings correspondence (2.7), explicit bases (2.8), Howson (2.10), Schreier formula (2.11)","state":"partial"},{"id":"Layer 3","remaining":"primitive-recursive coding of group terms and formulas","state":"partial"},{"id":"Layer 4","remaining":"general normal form theorem (4.3), tree independence (4.4), actions on trees and Bass-Serre trees (4.6-4.13)","state":"partial"},{"id":"Layer 5","remaining":"the 5.3 check that F x F is separated but not discriminated by F","state":"partial"},{"id":"Layer 6","remaining":"everything after the polygonal surface models of 6.0a","state":"partial"},{"id":"Layer 7","remaining":"generalised equations (7.1-7.8), positive formulas as single equations (7.9(3)), Merzljakov (7.10-7.11)","state":"partial"},{"id":"Layer 8","remaining":"finite rank of abelian subgroups (8.2), discrimination of centralizer extensions (8.6) and everything after it","state":"partial"},{"id":"Layer 9","remaining":"Lambda-trees and free actions (9.2-9.3), infinite words and Lyndon's group (9.4-9.7)","state":"partial"},{"id":"Layer 10","state":"untouched"},{"id":"Layer 11","state":"untouched"}],"readme_sha":"5d425c7eae0b434c9d5baf969ad3d05e96e69e77be25f77d950cb9b578b95c16","roadmap":"FreeGroupsAndLimitGroups","to_sha":"afa08a3ed16fb167e35de371afb1eb03fbc5913a"}-->
# Status: FreeGroupsAndLimitGroups

This file documents the status of the FreeGroupsAndLimitGroups roadmap up until `afa08a3` (2026-11-06T05:03:45Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Layer 1 is done. Layer 5 is done except for one boundary check. Layer 8 has reached the first of its three-way headline equivalences, and Layers 2 and 3 are well under way. Layers 4, 6, 7 and 9 have only their opening sections, and Layers 10 and 11 have not begun. None of the decidability, Makanin–Razborov or implicit-function targets has been reached.

### Named results

- **The Champetier–Guirardel theorem**: a group is a limit group exactly when it is finitely generated and fully residually free ([`TauCeti.LimitGroup.isLimitGroup_iff_isFullyResiduallyFree`](https://taucetiproject.org/docs/TauCeti/GroupTheory/LimitGroup/Characterization.html#TauCeti.LimitGroup.isLimitGroup_iff_isFullyResiduallyFree)). Here limit groups are defined as limits of free markings in the space of marked groups.
- **The universal characterization of limit groups**: a group is a limit group exactly when it is finitely generated and satisfies every universal sentence true in `F₂` ([`TauCeti.LimitGroup.isLimitGroup_iff_forall_isUniversal`](https://taucetiproject.org/docs/TauCeti/GroupTheory/LimitGroup/UniversalTheory.html#TauCeti.LimitGroup.isLimitGroup_iff_forall_isUniversal)).
- **Guba's theorem**: free groups of countable rank, and so in particular of finite rank, are equationally Noetherian over any coefficients ([`TauCeti.GroupAlgGeom.isEquationallyNoetherian_of_freeGroupBasis`](https://taucetiproject.org/docs/TauCeti/GroupTheory/GroupAlgGeom/Linear.html#TauCeti.GroupAlgGeom.isEquationallyNoetherian_of_freeGroupBasis)). The proof goes through Sanov's embedding into `SL(2, ℤ)`.
- **Irreducibility is discrimination**: a solution set is irreducible in the Zariski topology exactly when the target group discriminates its coordinate group ([`TauCeti.GroupAlgGeom.isIrreducible_V_iff_isDiscriminatedBy`](https://taucetiproject.org/docs/TauCeti/GroupTheory/GroupAlgGeom/Irreducible/Basic.html#TauCeti.GroupAlgGeom.isIrreducible_V_iff_isDiscriminatedBy)). Over an equationally Noetherian group every algebraic set is an irredundant finite union of irreducible ones ([`TauCeti.GroupAlgGeom.IsEquationallyNoetherian.exists_irreducible_decomposition`](https://taucetiproject.org/docs/TauCeti/GroupTheory/GroupAlgGeom/Irreducible/Components.html#TauCeti.GroupAlgGeom.IsEquationallyNoetherian.exists_irreducible_decomposition)).
- **Free groups are CSA**: every maximal abelian subgroup of a free group is malnormal ([`IsFreeGroup.isCSA`](https://taucetiproject.org/docs/TauCeti/GroupTheory/FreeGroup/CSA.html#IsFreeGroup.isCSA)). Fully residually free groups inherit this property.

### Notable definitions and infrastructure

- **The space of marked groups** ([`TauCeti.LimitGroup.MarkedGroup`](https://taucetiproject.org/docs/TauCeti/GroupTheory/LimitGroup/MarkedGroup.html#TauCeti.LimitGroup.MarkedGroup)) is the space of normal subgroups of `F_n`, with the Cantor topology. Limit groups are defined in it, and it already shows that `ℤ²` is a limit group.
- **Stallings graphs** ([`TauCeti.StallingsGraph`](https://taucetiproject.org/docs/TauCeti/Combinatorics/Graph/Stallings/Basic.html#TauCeti.StallingsGraph)) are labelled Serre graphs that accept a subgroup of the free group. Folds preserve that subgroup, and every finite labelled graph has a finite folded quotient ([`TauCeti.StallingsGraph.exists_folded_quotient`](https://taucetiproject.org/docs/TauCeti/Combinatorics/Graph/Stallings/Fold/Termination.html#TauCeti.StallingsGraph.exists_folded_quotient)). These are what §§2.7–2.11 will work with.
- **Graphs of groups** ([`TauCeti.GraphOfGroups`](https://taucetiproject.org/docs/TauCeti/GroupTheory/GraphOfGroups/Basic.html#TauCeti.GraphOfGroups)) come with a maximal-tree presentation of the fundamental group. On one-edge graphs it gives Mathlib's amalgams and HNN extensions, so Bass–Serre theory can begin.

### Roadmap coverage

- **Layer 1** is done. The amalgam check of §1.7 is stated as the isomorphic HNN extension of `F` along `⟨a²⟩` ([`Group.not_isCSA_hnnExtension_zpowers_sq`](https://taucetiproject.org/docs/TauCeti/GroupTheory/FreeGroup/CSA.html#Group.not_isCSA_hnnExtension_zpowers_sq)).
- **Layer 5** is done apart from the §5.3 check that `F × F` is separated but not discriminated by `F`. The trivial-coefficient analogue, with `F₂ × ℤ`, is proved in Layer 8.
- **Layer 3** is done apart from the primitive-recursive coding of terms and formulas.
- **Layer 2** is partial. §2.1, its adapter and the spanning trees of §2.2 are there, and so are the folding and core material of §§2.3–2.6 and the product-graph intersection of §2.9. Still missing: freeness and rank of the path group (§2.2), and the remaining parts of §2.2a, §2.7 and §§2.8–2.11.
- **Layer 8** is partial. §§8.1 and 8.3 are done. §8.2 lacks only the claim that abelian subgroups have finite rank. §8.4 has its first three conditions, and its relative conditions are available through §5.11. §8.5 has the extension construction and §8.5a has big powers. §8.6 onward is missing.
- **Layers 4, 6, 7 and 9** are partial, each at its opening: §§4.1, 4.2 and 4.5, the polygonal models of §6.0a, parts (1)–(2) of Malcev's §7.9, and the Lyndon length functions of §9.1.
- **Layers 10 and 11** are untouched.

## The frontier

- **Extensions of centralizers are discriminated (§8.6).** Both inputs are in place: the construction of `G(u, ℤⁿ)` with its retractions, and big powers in CSA groups. What remains is the discrimination by `t ↦ u^k`. That leads on to §§8.6a–8.7.
- **The fundamental group of a graph is free (§2.2).** Spanning trees and the reduced path group ([`TauCeti.SerreGraph.PathGroup`](https://taucetiproject.org/docs/TauCeti/Combinatorics/Graph/Serre/Path/Group.html#TauCeti.SerreGraph.PathGroup)) exist, but neither the free basis from non-tree edges nor the rank formula does. The explicit bases of §2.8 and Howson's theorem in §2.10 depend on it.
- **The §5.3 check and positive formulas (§7.9(3)).** Prove that `F × F` is separated but not discriminated by `F`. Then use the single-equation reductions already proved to turn positive formulas into single equations.
- **Normal forms for graphs of groups (§§4.3–4.4).** The one-edge cases come from Mathlib. The general normal form theorem and independence of the maximal tree come next.
- **Coding of first-order group syntax (Layer 3).** This is the last missing piece of Layer 3. Layer 7's recursive truth sets need it.
