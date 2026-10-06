<!--tauceti-status:v1 {"roadmap":"GeometricTopology","to_sha":"047d72b597816eaf08efb3455c9dd82b176aced3","ts":"2026-10-05T16:09:36Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 1","remaining":"collars of manifold boundaries, tubular neighbourhoods beyond Euclidean space, gluing along boundary pieces, handles and connected sum","state":"partial"},{"id":"Layer 2","remaining":"local flatness of general PL embeddings","state":"partial"},{"id":"Layer 3","state":"done"},{"id":"Layer 4","remaining":"Alexander invariance under the arc-circle clasp, Reidemeister and Markov theorems, polygonal knots to diagrams, HOMFLY","state":"partial"},{"id":"Layer 5","remaining":"the knot exterior as a manifold with torus boundary, Dehn filling along a slope, and the unknot surgery identities","state":"partial"},{"id":"Layer 6","remaining":"the concordance group, the cobordism category, Seifert matrices of actual knots, the tau import and mutation","state":"partial"},{"id":"Layer 7","remaining":"a proof of Mostow invariance of hyperbolic volume, and the Weeks manifold with its minimal-volume statement","state":"partial"},{"id":"Layer 8","remaining":"maximal isometry groups of the eight model geometries","state":"partial"},{"id":"Layer 9","state":"untouched"},{"id":"Layer 10","remaining":"the Euler class of an oriented plane bundle in H^2, the pairing with surfaces, and the Euler-class bound","state":"partial"},{"id":"Layer 11","remaining":"the reconciliation: polyhedra of combinatorial manifolds are PL manifolds for layer 1's PLGroupoid, and Whitehead's converse","state":"partial"}],"readme_sha":"0de990f4a469924f6292ffabe6004d6fa925a5c47df4e6102e6741ace1e7cf8d","roadmap":"GeometricTopology","to_sha":"047d72b597816eaf08efb3455c9dd82b176aced3"}-->
# Status: GeometricTopology

This file documents the status of the GeometricTopology roadmap up until `047d72b` (2026-10-05T16:09:36Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Layer 3 is done: `Diff(M)` is a topological group, and the Smale and Watanabe statements are written. Every other layer except 9 is partial. Knot theory and locally flat embeddings are furthest along. Jordan–Brouwer separation now closes Brown's theorem for spheres, and the JSJ theorem, Freedman's slice theorem and a hyperbolic volume are stated. Layer 9 has not begun.

### Named results

- **The Jordan–Brouwer separation theorem** — the complement of an embedded `n`-sphere in `Sⁿ⁺¹` has exactly two path components, proved with singular homology ([`natCard_zerothHomotopy_sphere_compl_range_eq_two`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicTopology/Singular/JordanBrouwer.html#TauCeti.natCard_zerothHomotopy_sphere_compl_range_eq_two)).
- **Brown's bicollaring theorem for spheres** — a locally flat `n`-sphere in `Sⁿ⁺¹` with disconnected complement is globally bicollared ([`IsLocallyFlat.isBicollared_of_not_isPreconnected_compl_range`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Manifold/LocallyFlat/Sphere.html#TauCeti.IsLocallyFlat.isBicollared_of_not_isPreconnected_compl_range)). With Jordan–Brouwer, the library discharges that hypothesis in every dimension, as `brownBicollaring`. This is the structural input to the [Annulus Conjecture](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Manifold/LocallyFlat/Annulus.html#TauCeti.AnnulusConjecture).
- **Reidemeister invariance of the Jones polynomial** — the Jones polynomial of an oriented PD code is unchanged by all three Reidemeister moves, for every height order in the third ([`OrientedPDCode.jonesPolynomial_reidemeisterThree`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/KnotTheory/PDCode/Jones.html#TauCeti.OrientedPDCode.jonesPolynomial_reidemeisterThree)).
- **`Diff(M)` is a topological group** — for a compact manifold, composition and inversion are continuous in the weak Whitney topology ([`Diffeomorph.isTopologicalGroup`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Diffeomorphism/Inversion.html#Diffeomorph.isTopologicalGroup)).
- **The tubular neighbourhood theorem in Euclidean space** — a compact `C²` embedded submanifold of `ℝⁿ` has an open tubular embedding of its `ε`-normal tube ([`exists_isOpenEmbedding_normalTube`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Manifold/TubularNeighborhood/Euclidean.html#TauCeti.exists_isOpenEmbedding_normalTube)). It does not yet cover submanifolds of a general manifold.

### Notable definitions and infrastructure

- **The Alexander module of a diagram** ([`OrientedPDCode.AlexanderModule`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/KnotTheory/PDCode/Alexander/Basic.html#TauCeti.OrientedPDCode.AlexanderModule)) has Fitting ideals as its elementary ideals. It is now invariant under every move except clasping an arc with a free circle, which brings the diagram Alexander polynomial within reach.
- **Solid torus neighbourhoods of knots** ([`exists_isSolidTorusNeighborhood_sphere`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LowDimTopology/SolidTorusNeighborhood/Sphere.html#TauCeti.exists_isSolidTorusNeighborhood_sphere)) identify the boundary torus with the frontier of the knot exterior. This is where Dehn filling will glue.
- **The eight Thurston geometries** ([`ModelGeometry`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Manifold/Riemannian/ModelGeometry/Basic.html#TauCeti.ModelGeometry)), with geometric structures as quotients `X/Γ`, make [geometrization](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LowDimTopology/Geometrization.html#TauCeti.GeometrizationConjecture) and the [JSJ theorem](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LowDimTopology/JSJDecomposition.html#TauCeti.JSJTheorem) stateable.

### Roadmap coverage

- **Layer 3** is done.
- **Layer 2** is done except for local flatness of general PL embeddings. Only polygonal knots and smooth embeddings are covered.
- **Layer 4** has the Jones polynomial invariant under all moves and the Alexander module invariant under all but one form of the second move. Markov moves on braid words become Reidemeister moves on closures, except free cancellation. It lacks Reidemeister's and Markov's theorems, the projection of polygonal knots to diagrams, and HOMFLY. The Jimbo trace satisfies the skein relation but is not yet stabilization-invariant.
- **Layer 1** has local and abstract collars and Euclidean tubular neighbourhoods, but no boundary collars, gluing, handles or connected sum.
- **Layers 5–8** are partial:
  - Layer 5 has slopes, lens spaces and solid torus neighbourhoods, but no Dehn filling.
  - Layer 6 has sliceness and Freedman's theorem stated, but no concordance group.
  - Layer 7's [hyperbolic volume](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Manifold/Riemannian/Hyperbolic/Volume.html#TauCeti.hypVolume) is metric-independent only under an assumed Mostow rigidity, and there is no Weeks manifold.
  - Layer 8 has the geometries, geometrization and JSJ statements, but no maximal isometry groups.
- **Layers 10 and 11** are partial and unchanged.
- **Layer 9** is untouched.

## The frontier

- **The arc–circle clasp for the Alexander module**: only this form of the second move is missing. Its crossing weights are already computed. With it, the elementary ideals become invariants of Reidemeister classes.
- **Free cancellation on braid closures**: free cancellation is shown only to preserve the writhe. A Reidemeister-equivalence proof would make Markov-equivalent braids have equivalent closures, and so tie the Jones trace to the diagram Jones polynomial.
- **Knot complement and Dehn filling**: the solid torus neighbourhood exists. Next, its exterior must become a compact manifold with torus boundary. Filling then needs layer 1's gluing.
- **HOMFLY**: the Jimbo weighted trace has the skein relation and conjugation invariance. Invariance under Markov stabilization is still missing.
- **Reidemeister's theorem**: polygonal knots have Δ-moves and combinatorial equivalence, but there is no projection to PD codes. Until there is, the diagram invariants are not invariants of knots.
