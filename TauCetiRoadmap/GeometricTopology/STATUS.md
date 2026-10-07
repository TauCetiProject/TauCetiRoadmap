<!--tauceti-status:v1 {"roadmap":"GeometricTopology","to_sha":"65aa70aca528de65d24b3fc2ef2379c24498b560","ts":"2026-10-06T02:50:42Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 1","remaining":"collars of manifold boundaries, tubular neighbourhoods beyond Euclidean space, gluing along boundary pieces, handles and connected sum","state":"partial"},{"id":"Layer 2","remaining":"local flatness of general PL embeddings; only the affine-graph local model is done","state":"partial"},{"id":"Layer 3","state":"done"},{"id":"Layer 4","remaining":"Alexander invariance under the arc-circle clasp, free cancellation on closures, Reidemeister and Markov theorems, polygonal knots to diagrams, HOMFLY","state":"partial"},{"id":"Layer 5","remaining":"the knot exterior as a manifold with torus boundary, Dehn filling along a slope, and the unknot surgery identities","state":"partial"},{"id":"Layer 6","remaining":"the concordance group, the cobordism category, Seifert matrices of actual knots, the tau import and mutation","state":"partial"},{"id":"Layer 7","remaining":"a proof of Mostow invariance of hyperbolic volume, and the Weeks manifold with its minimal-volume statement","state":"partial"},{"id":"Layer 8","remaining":"maximal isometry groups of the eight model geometries","state":"partial"},{"id":"Layer 9","state":"untouched"},{"id":"Layer 10","remaining":"the Euler class of an oriented plane bundle in H^2, the pairing with surfaces, and the Euler-class bound","state":"partial"},{"id":"Layer 11","remaining":"the reconciliation: polyhedra of combinatorial manifolds are PL manifolds for layer 1's PLGroupoid, and Whitehead's converse","state":"partial"}],"readme_sha":"ce2fc505ea88e2f50fa4c25928e7531c853f6c5df89aa29c8df4c5c7b525d03a","roadmap":"GeometricTopology","to_sha":"65aa70aca528de65d24b3fc2ef2379c24498b560"}-->
# Status: GeometricTopology

This file documents the status of the GeometricTopology roadmap up until `65aa70a` (2026-10-06T02:50:42Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Layer 3 is done: `Diff(M)` is a topological group, and the Smale and Watanabe statements are written. Every other layer except 9 is partial, with knot theory and locally flat embeddings furthest along. Jordan–Brouwer separation closes Brown's theorem for spheres, and the JSJ theorem, Freedman's slice theorem and a hyperbolic volume are stated. Layer 9 has not begun.

### Named results

- **The Jordan–Brouwer separation theorem** — the complement of an embedded `n`-sphere in `Sⁿ⁺¹` has exactly two path components, proved with singular homology ([`natCard_zerothHomotopy_sphere_compl_range_eq_two`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicTopology/Singular/JordanBrouwer.html#TauCeti.natCard_zerothHomotopy_sphere_compl_range_eq_two)).
- **Brown's bicollaring theorem for spheres** — a locally flat `n`-sphere in `Sⁿ⁺¹` with disconnected complement is globally bicollared ([`IsLocallyFlat.isBicollared_of_not_isPreconnected_compl_range`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Manifold/LocallyFlat/Sphere.html#TauCeti.IsLocallyFlat.isBicollared_of_not_isPreconnected_compl_range)). Jordan–Brouwer discharges that hypothesis in every dimension, making this the structural input to the [Annulus Conjecture](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Manifold/LocallyFlat/Annulus.html#TauCeti.AnnulusConjecture).
- **Reidemeister invariance of the Jones polynomial** — the Jones polynomial of an oriented PD code is unchanged by all three Reidemeister moves, for every height order in the third ([`OrientedPDCode.jonesPolynomial_reidemeisterThree`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/KnotTheory/PDCode/Jones.html#TauCeti.OrientedPDCode.jonesPolynomial_reidemeisterThree)).
- **`Diff(M)` is a topological group** — for a compact manifold, composition and inversion are continuous in the weak Whitney topology ([`Diffeomorph.isTopologicalGroup`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Diffeomorphism/Inversion.html#Diffeomorph.isTopologicalGroup)).
- **The tubular neighbourhood theorem in Euclidean space** — a compact `C²` embedded submanifold of `ℝⁿ` has an open tubular embedding of its `ε`-normal tube ([`exists_isOpenEmbedding_normalTube`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Manifold/TubularNeighborhood/Euclidean.html#TauCeti.exists_isOpenEmbedding_normalTube)). Submanifolds of a general manifold are not yet covered.

### Notable definitions and infrastructure

- **The Alexander module of a diagram** ([`OrientedPDCode.AlexanderModule`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/KnotTheory/PDCode/Alexander/Basic.html#TauCeti.OrientedPDCode.AlexanderModule)) has Fitting ideals as its elementary ideals. It is invariant under every move except clasping an arc with a free circle, which puts the diagram Alexander polynomial within reach.
- **Solid torus neighbourhoods of knots** ([`exists_isSolidTorusNeighborhood_sphere`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LowDimTopology/SolidTorusNeighborhood/Sphere.html#TauCeti.exists_isSolidTorusNeighborhood_sphere)) identify the boundary torus with the frontier of the knot exterior. This is where Dehn filling will glue.
- **The eight Thurston geometries** ([`ModelGeometry`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Manifold/Riemannian/ModelGeometry/Basic.html#TauCeti.ModelGeometry)), with geometric structures as quotients `X/Γ`, make [geometrization](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LowDimTopology/Geometrization.html#TauCeti.GeometrizationConjecture) and the [JSJ theorem](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LowDimTopology/JSJDecomposition.html#TauCeti.JSJTheorem) stateable.

### Roadmap coverage

- **Layer 3** is done.
- **Layer 2** is done except for local flatness of general PL embeddings. Smooth embeddings, polygonal knots, and graphs of continuous and affine maps (the local model of a PL embedding) are covered.
- **Layer 4** has the Jones polynomial invariant under all moves and the Alexander module invariant under all but one form of the second move. Markov moves on braid words become Reidemeister moves on closures, except free cancellation. It lacks Reidemeister's and Markov's theorems, the projection of polygonal knots to diagrams, and HOMFLY.
- **Layer 1** has local and abstract collars and Euclidean tubular neighbourhoods, but no boundary collars, gluing, handles or connected sum.
- **Layers 5–8** are partial. Layer 5 has slopes, lens spaces and solid torus neighbourhoods, but no Dehn filling. Layer 6 has sliceness and Freedman's theorem stated, but no concordance group. Layer 7's [hyperbolic volume](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Manifold/Riemannian/Hyperbolic/Volume.html#TauCeti.hypVolume) is metric-independent only under an assumed Mostow rigidity, and there is no Weeks manifold. Layer 8 has the geometries, geometrization and JSJ statements, but no maximal isometry groups.
- **Layers 10 and 11** are partial and unchanged.
- **Layer 9** is untouched.

## The frontier

- **The arc–circle clasp for the Alexander module**: this is the only form of the second move still missing, and its crossing weights are already computed. Once it lands, the elementary ideals become invariants of Reidemeister classes.
- **Free cancellation on braid closures**: free cancellation is known to preserve the writhe, and the crossing order along each strand after a front insertion is computed. What remains is the Reidemeister equivalence of the closures, which would make Markov-equivalent braids have equivalent closures.
- **HOMFLY**: the Jimbo weighted trace satisfies the skein relation, is conjugation-invariant, and an uncrossed strand [multiplies it by the quantum dimension](https://taucetiproject.github.io/TauCeti/docs/TauCeti/KnotTheory/Jimbo/StrandInclusion.html#TauCeti.KnotTheory.jimboWeightedTrace_strandIncl). Full Markov stabilization, with the new crossing, is still missing.
- **PL embeddings are locally flat**: affine graphs are [locally flat](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Manifold/LocallyFlat/PL.html#ContinuousAffineMap.isLocallyFlat_affineGraph). What remains is the general statement for PL embeddings, stated against layer 1's PL groupoid.
- **Knot complement and Dehn filling**: the solid torus neighbourhood exists. Next, its exterior must become a compact manifold with torus boundary. Filling also needs layer 1's gluing.
