<!--tauceti-status:v1 {"roadmap":"ClassifyingSpaces","to_sha":"69cd1ab4dcfbb6676e344f3f193e63473eab5a3d","ts":"2026-10-25T14:11:34Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Stage 1","state":"done"},{"id":"Stage 2","remaining":"semilocal simple connectivity of the cellular model and an existence theorem in Stage 1's form","state":"partial"},{"id":"Stage 3","remaining":"homotopy functoriality of the classifying space into the pointed homotopy category (item 15)","state":"partial"},{"id":"Stage 4","remaining":"naturality, local coefficients and long exact sequences in item 17; wedge of circles and H2 of a finite cyclic group in item 19","state":"partial"}],"readme_sha":"203f7652628fbfb5e4898c586966fed7d25d774971cffad6c3baa942b8b30177","roadmap":"ClassifyingSpaces","to_sha":"69cd1ab4dcfbb6676e344f3f193e63473eab5a3d"}-->
# Status: ClassifyingSpaces

This file documents the status of the ClassifyingSpaces roadmap up until `69cd1ab` (2026-10-25T14:11:34Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Both models of `BG` exist for every group, are CW complexes, and are homotopy equivalent, and `K(G, 1)` spaces of CW type are unique. Singular homology and cohomology of `BG` agree with group (co)homology with trivial coefficients in every degree. Homotopy functoriality, local coefficients, naturality of the (co)homology comparison and two of the checks are still missing.

### Named results

- **Uniqueness of `K(G, 1)` spaces of CW type** — two aspherical spaces of CW type are homotopy equivalent by an equivalence realizing any prescribed isomorphism of fundamental groups, up to a change of base point ([`IsAspherical.exists_homotopyEquiv`](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/ClassifyingSpace/Uniqueness.html#TauCeti.IsAspherical.exists_homotopyEquiv)).
- **The two models agree** — for a presentation of `G`, the cellular classifying space is homotopy equivalent to Milnor's, inducing the given isomorphism on `π₁` and unique up to pointed homotopy ([`cellularHomotopyEquivClassifyingSpace`](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/ClassifyingSpace/Comparison.html#TauCeti.cellularHomotopyEquivClassifyingSpace)).
- **Milnor's classifying space is a `K(G, 1)`** — for an arbitrary group, the orbit space of the countable join is path-connected with fundamental group `G` and no higher homotopy, with the standing hypotheses of covering-space theory ([`exists_isEilenbergMacLaneSpaceOne`](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/ClassifyingSpace/EilenbergMacLane.html#TauCeti.exists_isEilenbergMacLaneSpaceOne)).
- **Homology of `BG` is group homology** — `Hₙ(BG; k) ≅ Hₙ(G, k)` for every commutative ring `k` and every `n` ([`classifyingSpaceSingularHomologyIsoGroupHomology`](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/ClassifyingSpace/Homology.html#TauCeti.classifyingSpaceSingularHomologyIsoGroupHomology)), with the cohomological counterpart for a trivial module `M` ([`classifyingSpaceSingularCohomologyIsoGroupCohomology`](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/ClassifyingSpace/Cohomology.html#TauCeti.classifyingSpaceSingularCohomologyIsoGroupCohomology)).
- **The join resolution is the bar resolution** — the explicit map sending a simplex of the countable join to its tuple of labels is a homotopy equivalence onto Mathlib's standard resolution ([`universalGSpaceStandardHomotopyEquiv`](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/ClassifyingSpace/StandardResolution.html#TauCeti.universalGSpaceStandardHomotopyEquiv)), [natural in the group](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/ClassifyingSpace/Naturality.html#MonoidHom.universalGSpaceChainComplexToStandardComplex_naturality).

### Notable definitions and infrastructure

- **The cellular model as a CW complex.** [Its cells](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/ClassifyingSpace/Cellular.html#TauCeti.instCWComplexCellularClassifyingSpace) are those of the presentation complex plus the cells of dimension at least three from the tower. This is what lets Whitehead's theorem compare it with Milnor's model.
- **CW structures along coverings.** A CW structure [lifts to a covering space](https://taucetiproject.org/docs/TauCeti/Topology/CWComplex/Classical/Covering.html#TauCeti.cwComplexPreimage) and [descends to the orbit space of a free cellular action](https://taucetiproject.org/docs/TauCeti/Topology/CWComplex/Classical/OrbitSpace.html#IsQuotientCoveringMap.cwComplexQuotient). Together with the contractibility of the lift of an aspherical CW complex, this makes the cellular chains of the universal cover [a projective resolution](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/Cellular/Resolution.html#TauCeti.cellularResolution) of the trivial module.
- **Singular chains of a free contractible `G`-space.** They form [a projective resolution](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/Singular/ModuleChains/Resolution.html#TauCeti.singularChainsResolution) whose coinvariants are the chains of the base. This is how the (co)homology comparison is proved for any such covering, not only for `BG`.

### Roadmap coverage

Stage 1 is done. Stage 2 is done except for the standing hypotheses. The cellular model is now a classical CW complex, hence locally path-connected, but its semilocal simple connectivity is not stated and its existence theorem lacks Stage 1's form. Stage 3 is done except for homotopy functoriality (item 15). Maps out of the cellular model are determined by `π₁` (item 11), uniqueness (12), CW structures along coverings (13) and the comparison of the models (14) are all proved. Stage 4 is partial. Cellular and simplicial resolutions (16) and the bar-resolution comparison (18) are done. Item 17 covers trivial coefficients only, with no naturality and no long exact sequences. Item 19 has `H₁`, the circle and the torus, but not the wedge of circles or `H₂` of a finite cyclic group.

## The frontier

- **Homotopy functoriality (item 15).** Make `BG` a functor to the pointed homotopy category. Uniqueness of maps out of a CW `K(G, 1)` up to pointed homotopy is already in place, so this is mainly packaging, refined by Stage 1's strict maps.
- **Naturality and local coefficients (item 17).** The comparisons hold in each degree for trivial coefficients. What remains is naturality in `G` and in the coefficients, compatibility with long exact sequences, and homology with local coefficients in a `G`-module.
- **The standing hypotheses for the cellular model (item 10).** It needs semilocal simple connectivity, and an existence theorem stated in the same form as Stage 1's.
- **The wedge of circles (item 19).** The wedge already has [its CW structure](https://taucetiproject.org/docs/TauCeti/Topology/CWComplex/Classical/WedgeCircles.html#TauCeti.WedgeSum.circleCWComplex). It remains to show that it is a `K(F, 1)` for the free group and that the free-group cellular model is that wedge.
- **`H₂` of a finite cyclic group.** Compute it topologically and match the algebraic answer, as the acceptance checks ask.
