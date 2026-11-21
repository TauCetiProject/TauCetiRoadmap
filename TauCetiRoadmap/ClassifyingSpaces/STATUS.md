<!--tauceti-status:v1 {"roadmap":"ClassifyingSpaces","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e","ts":"2026-11-19T18:22:01+11:00"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 1","remaining":"homotopy extension property of a point; Hatcher 1B.9 for arbitrary CW source and base point; pointed uniqueness via Whitehead","state":"untouched"},{"id":"Layer 2","remaining":"definite (co)homology comparisons for a CW K(G, 1) with trivial and local coefficients, via the pointed comparison map of 1.3","state":"untouched"}],"readme_sha":"ae7ea46b90ce727468c7982fb24d8ea23ee1743508263a3f54a82effb1902ad7","roadmap":"ClassifyingSpaces","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e"}-->
# Status: ClassifyingSpaces

This file documents the status of the ClassifyingSpaces roadmap up until `b235000` (2026-11-19T18:22:01+11:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The construction programme that this roadmap now builds on is finished. Every group has two models of `BG`, they are homotopy equivalent, and their homology and cohomology, with trivial and with local coefficients, are group (co)homology. The rewritten roadmap carries these results from Milnor's model to every Hausdorff CW `K(G, 1)` and to maps into aspherical spaces. Neither of its two layers has started.

### Named results

- **Every group has a classifying space, twice** — Milnor's orbit space of the countable join is [a `K(G, 1)`](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/ClassifyingSpace/EilenbergMacLane.html#TauCeti.exists_isEilenbergMacLaneSpaceOne) for an arbitrary group, and so is [the cellular model built from a presentation](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/ClassifyingSpace/Comparison.html#TauCeti.exists_isEilenbergMacLaneSpaceOne_cellularClassifyingSpace).
- **Uniqueness of `K(G, 1)` spaces of CW type, up to a change of base point** — two aspherical spaces of CW type are homotopy equivalent by an equivalence realizing a prescribed isomorphism of fundamental groups once base points are moved along a path ([`IsAspherical.exists_homotopyEquiv`](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/ClassifyingSpace/Uniqueness.html#TauCeti.IsAspherical.exists_homotopyEquiv)). The pointed form is Layer 1's target.
- **The two models agree** — for a presentation of `G`, the cellular classifying space is homotopy equivalent to Milnor's, inducing the given isomorphism on `π₁` ([`cellularHomotopyEquivClassifyingSpace`](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/ClassifyingSpace/Comparison.html#TauCeti.cellularHomotopyEquivClassifyingSpace)).
- **The classifying-space functor** — `BG` is a functor from groups to the pointed homotopy category, and its fundamental group is naturally the identity ([`classifyingSpaceHomotopyFunctor`](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/ClassifyingSpace/HomotopyFunctor.html#TauCeti.classifyingSpaceHomotopyFunctor)).
- **Local-coefficient (co)homology of Milnor's `BG` is group (co)homology** — `Hₙ(BG; A) ≅ Hₙ(G, A)` ([`classifyingSpaceTwistedHomologyIsoGroupHomology`](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/ClassifyingSpace/LocalCoefficients.html#TauCeti.classifyingSpaceTwistedHomologyIsoGroupHomology)) and `Hⁿ(BG; A) ≅ Hⁿ(G, A)` ([`classifyingSpaceCohomologyIsoGroupCohomology`](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/ClassifyingSpace/LocalCoefficients.html#TauCeti.classifyingSpaceCohomologyIsoGroupCohomology)) for every representation `A`, natural in the group and compatible with connecting maps. Layer 2 pulls these back to an arbitrary CW `K(G, 1)`.

### Notable definitions and infrastructure

- **CW structures along coverings.** A CW structure [lifts to a covering space](https://taucetiproject.org/docs/TauCeti/Topology/CWComplex/Classical/Covering.html#TauCeti.cwComplexPreimage), and the cellular chains of a contractible free cover are [a projective resolution](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/Cellular/Resolution.html#TauCeti.cellularResolution). This is the cellular form of the resolution that Layer 2's local-coefficient route relies on.
- **The local system of a representation on `BG`.** [Its fibre](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/ClassifyingSpace/LocalCoefficients.html#TauCeti.classifyingSpaceLocalSystem) over a point is the coinvariants of `A` tensored with the free module on the fibre of the join. Layer 2.3 pulls it back along the pointed comparison map and identifies it with the system attached to `A ∘ Ψ`.
- **Graphs are aspherical.** A connected, semilocally simply connected Hausdorff CW complex with no cells above dimension one [has no higher homotopy](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/EilenbergMacLane/OneDimensional.html#TauCeti.isAspherical_of_forall_isEmpty_cell). It is stated for spaces in the lowest universe. This supplies a family of CW `K(F, 1)` examples, of the kind Layer 1's examples section names.

### Roadmap coverage

Layer 1 is untouched. It needs Hatcher's Proposition 1B.9 for an arbitrary path-connected Hausdorff CW source with an arbitrary base point, its first step (the homotopy extension property of a point), and pointed uniqueness. None of these appears in the source. What exists are the pins it reduces to: classification of maps out of a CW complex whose `0`-skeleton is the base point, and maps out of the cellular model. Layer 2 is untouched. No comparison of `Hₙ(X; k)`, `Hⁿ(X; M)` or local-coefficient (co)homology with group (co)homology is defined yet for a general CW `K(G, 1)`, and it depends on Layer 1's pointed comparison map.

## The frontier

- **The homotopy extension property of a point** (item 1.1, first step). Every point of a Hausdorff CW complex should have it. The route uses NDR data built in the skeleton containing the point from the open-cell chart and `NDRPair.ofHomotopyRel`, both of which already exist. Nothing for this has landed yet.
- **Hatcher's Proposition 1B.9 in general** (`exists_continuousMap_mapOfEq_eq_of_isAspherical`). Two things remain: existence of a pointed map realizing any homomorphism into an aspherical target, and uniqueness relative to the base point, both for an arbitrary CW source. The route goes through the killing tower, the cellular model and the one-skeleton criterion. It needs the previous item to move the base point.
- **Pointed uniqueness** (`exists_homotopyEquiv_of_isAspherical`), together with the pointed comparison maps from a CW `K(G, 1)` to both models. These come from 1.1 by Whitehead's theorem. The library currently has uniqueness only up to a change of base point.
- **Trivial-coefficient comparisons for a CW `K(G, 1)`** (2.1, 2.2). These are definite isomorphisms depending only on `(X, x, Ψ)`, natural, compatible with Bocksteins, and in degree one sending a loop `γ` to the class of `Ψ(γ)⁻¹`. They are blocked on 1.3.
- **Local coefficients for a CW `K(G, 1)`** (2.3). This also needs a transport of the local system of a representation along an isomorphism of representations, which the library does not yet have.
