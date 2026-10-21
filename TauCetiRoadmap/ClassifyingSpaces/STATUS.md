<!--tauceti-status:v1 {"roadmap":"ClassifyingSpaces","to_sha":"68a457ec2b1aee486f4192ee3ea36a04f70efb8c","ts":"2026-10-20T05:58:24Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Stage 1","state":"done"},{"id":"Stage 2","remaining":"a classical CWComplex univ structure on the cellular model and its local path-connectedness and semilocal simple connectivity","state":"partial"},{"id":"Stage 3","remaining":"uniqueness of K(G,1) spaces of CW type, homotopy uniqueness in item 11, the explicit comparison of the two models, homotopy functoriality","state":"partial"},{"id":"Stage 4","remaining":"the cellular projective resolution, homology and cohomology in all degrees with coefficients, the bar-resolution comparison, remaining checks","state":"partial"}],"readme_sha":"203f7652628fbfb5e4898c586966fed7d25d774971cffad6c3baa942b8b30177","roadmap":"ClassifyingSpaces","to_sha":"68a457ec2b1aee486f4192ee3ea36a04f70efb8c"}-->
# Status: ClassifyingSpaces

This file documents the status of the ClassifyingSpaces roadmap up until `68a457e` (2026-10-20T05:58:24Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The simplicial model (Stage 1) is complete, and the cellular model exists as a `K(G, 1)` for every group. Uniqueness, the comparison of the two models, and the comparison with group homology beyond degree one remain open, though the CW-and-coverings machinery they need is in place.

### Named results

- **Milnor's classifying space is a `K(G, 1)`** — for an arbitrary group, the orbit space of the countable join of copies of `G` is path-connected with fundamental group `G` and no higher homotopy ([`isEilenbergMacLaneSpaceOne_classifyingSpace`](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/ClassifyingSpace/EilenbergMacLane.html#TauCeti.isEilenbergMacLaneSpaceOne_classifyingSpace)), and the [existence theorem](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/ClassifyingSpace/EilenbergMacLane.html#TauCeti.exists_isEilenbergMacLaneSpaceOne) also gives local path-connectedness and semilocal simple connectivity.
- **The cellular classifying space** — attaching cells of dimension three and up to the presentation complex of the tautological presentation gives a `K(G, 1)` for every group, with no finiteness hypothesis ([`exists_isEilenbergMacLaneSpaceOne_cellularClassifyingSpace`](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/ClassifyingSpace/Cellular.html#TauCeti.exists_isEilenbergMacLaneSpaceOne_cellularClassifyingSpace)).
- **The fundamental group of a presentation complex** — it is the presented group, with the loop around the `s`-th circle going to the generator `s` ([`PresentationComplex.fundamentalGroupMulEquiv`](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/ClassifyingSpace/PresentationComplex.html#TauCeti.PresentationComplex.fundamentalGroupMulEquiv)).
- **The circle is a classifying space for ℤ** — Whitehead's theorem gives a homotopy equivalence from the circle to Milnor's model of `Bℤ` that induces the identity on `ℤ` ([`circleHomotopyEquivClassifyingSpace`](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/ClassifyingSpace/Circle.html#TauCeti.circleHomotopyEquivClassifyingSpace)).
- **First homology is first group homology** — `H₁(BG; ℤ)` is Mathlib's `H₁(G, ℤ)`, and also the abelianization of `G`, naturally in `G` ([`classifyingSpaceFirstHomologyAddEquivGroupHomology`](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/ClassifyingSpace/FirstHomology.html#TauCeti.classifyingSpaceFirstHomologyAddEquivGroupHomology)).

### Notable definitions and infrastructure

- **CW structures along coverings.** A CW structure on the base [lifts to the total space](https://taucetiproject.org/docs/TauCeti/Topology/CWComplex/Classical/Covering.html#TauCeti.cwComplexPreimage), and one on the total space of a free cellular action [descends to the orbit space](https://taucetiproject.org/docs/TauCeti/Topology/CWComplex/Classical/OrbitSpace.html#IsQuotientCoveringMap.cwComplexQuotient). This is what makes [Milnor's space a CW complex](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/ClassifyingSpace/CWComplex.html#TauCeti.instCWComplexClassifyingSpace) whose cells are the orbits of simplices.
- **Cellular chains as free `ℤ[G]`-modules.** The cellular chains of a lifted structure form [a complex of representations](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/Cellular/Covering.html#TauCeti.cellularChainComplexRep), [free on one chosen lift of each cell](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/Cellular/Covering.html#TauCeti.cellularChainRepIsoFree). These are the terms of the resolution Stage 4 needs.
- **Killing homotopy groups.** [`killHomotopyGroups`](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/Homotopy/KillHomotopyGroups.html#TauCeti.killHomotopyGroups) is the colimit of the cell-attachment tower over a Hausdorff space. It is a relative CW complex that keeps the lower homotopy groups, kills the higher ones, and admits extensions of maps into spaces with no higher homotopy.

### Roadmap coverage

Stage 1 is done: the countable join, its weak contractibility, the free action and quotient cover with deck group `G`, the standing hypotheses, the identification with the universal cover, and strict functoriality compatible with `π₁`. Stage 2 is partial. The presentation complex, killing a homotopy group, the tower and the cellular `K(G, 1)` are all proved, but the colimit has no classical `CWComplex univ` structure yet, and the cellular model's local path-connectedness and semilocal simple connectivity are not stated. Stage 3 is partial. Item 13 is done in both directions, along with its application to Milnor's model. Item 11 has its existence half: maps out of the cellular model realize every homomorphism on `π₁` when the target has no higher homotopy. Uniqueness in general (12), the comparison of the two models (14) and homotopy functoriality (15) are untouched, and the only uniqueness-style result is the circle case. Stage 4 is partial: only `H₁(BG) ≅ Gᵃᵇ` and the circle check have landed. There is no projective resolution, no comparison in higher degrees or with coefficients, and no comparison with the bar resolution.

## The frontier

- **Uniqueness of `K(G, 1)` spaces of CW type (item 12).** Whitehead's theorem is already used for the circle case, and the existence half of item 11 is in place. What remains is uniqueness up to pointed homotopy in item 11 and the reduction for spaces of CW type on both sides.
- **A classical CW structure on the cellular model (item 9).** Convert the relative CW complex over the presentation complex into a `CWComplex univ`, and prove the cellular model locally path-connected and semilocally simply connected so that its existence theorem matches Stage 1's.
- **The two models agree (item 14).** Milnor's model is already a CW complex, so once uniqueness lands this needs the cellular model's CW structure and an explicit equivalence with a homotopy inverse.
- **The cellular resolution (item 16).** The free `ℤ[G]`-complex of lifted cellular chains exists. Exactness needs the Hurewicz theorem and the comparison of cellular with singular homology from the algebraic-topology roadmap, packaged as a `ProjectiveResolution`.
- **Homotopy functoriality (item 15)** and the remaining checks of item 19, such as wedges of circles, tori and `H₂` of a finite cyclic group.
