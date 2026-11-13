<!--tauceti-status:v1 {"roadmap":"GeometricTopology","to_sha":"1b19ebb4ca6fab1281fb00c21dee68df6ff21243","ts":"2026-11-11T12:36:39Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 1","remaining":"general boundary collars, gluing along boundary pieces and handle attachment","state":"partial"},{"id":"Layer 2","remaining":"local flatness of higher-dimensional PL embeddings against the PL groupoid","state":"partial"},{"id":"Layer 3","state":"done"},{"id":"Layer 4","remaining":"Reidemeister's theorem, the converse Markov theorem, polygonal knots to diagrams and HOMFLY transport","state":"partial"},{"id":"Layer 5","remaining":"Lickorish-Wallace, Mathieu's theorem and the cyclic surgery theorem","state":"partial"},{"id":"Layer 6","remaining":"the concordance group, cobordism category, signatures of geometric knots and the tau import","state":"partial"},{"id":"Layer 7","remaining":"proved metric-independence of hyperbolic volume and a concrete Weeks manifold with its minimal-volume statement","state":"partial"},{"id":"Layer 8","state":"done"},{"id":"Layer 9","remaining":"existence of a Heegaard splitting for every closed orientable 3-manifold","state":"partial"},{"id":"Layer 10","remaining":"existence of Thom classes for nontrivial oriented plane bundles","state":"partial"},{"id":"Layer 11","remaining":"Cairns-Whitehead, Whitehead's converse, the Rado and Moise theorems, Bing's house and Zeeman implies Poincare","state":"partial"}],"readme_sha":"2f1fd7f845117184c6a13928c4e326b6cb1ad3335cf95934d7f1145a4258c0b2","roadmap":"GeometricTopology","to_sha":"1b19ebb4ca6fab1281fb00c21dee68df6ff21243"}-->
# Status: GeometricTopology

This file documents the status of the GeometricTopology roadmap up until `1b19ebb` (2026-11-11T12:36:39Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Two layers are complete: the topology of diffeomorphism groups of compact manifolds (Layer 3), and the statements of the Thurston geometries and of the decompositions (Layer 8). The other nine are partial. Smooth connected sum and Zeeman's dunce-hat case are fully in place. General boundary gluing, the concordance group, Reidemeister's theorem and existence of smooth triangulations are not.

### Named results

- **The Schoenflies theorem**: every planar Jordan curve is the image of the unit circle under a homeomorphism of the plane that also carries the disc onto the curve's inside ([`TauCeti.IsJordanCurve.exists_homeomorph_image_sphere`](https://taucetiproject.org/docs/TauCeti/Analysis/Complex/Conformal/Jordan/Schoenflies.html#TauCeti.IsJordanCurve.exists_homeomorph_image_sphere)).
- **The sphere identity for connected sum**: for connected, Hausdorff, oriented smooth n-manifolds without boundary and n ≥ 1, the connected sum with Sⁿ is diffeomorphic to the original manifold ([`TauCeti.OrientedConnectedSum.nonempty_diffeomorph_sphere`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/ConnectedSum/Oriented.html#TauCeti.OrientedConnectedSum.nonempty_diffeomorph_sphere)).
- **Zeeman's theorem for the dunce hat**: the dunce hat is contractible but not collapsible, while its ordered cylinder is collapsible. This is the first nontrivial instance of Zeeman's conjecture ([`TauCeti.collapsible_orderedCylinder_dunceHat`](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/SimplicialComplex/DunceHat.html#TauCeti.collapsible_orderedCylinder_dunceHat)).
- **Combinatorial manifolds are PL manifolds**: the realization of a positive-dimensional combinatorial manifold has a half-space atlas whose transition maps are PL ([`exists_chartedSpace_hasGroupoid_PLGroupoid`](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/SimplicialComplex/CombinatorialManifold/PL.html#PreAbstractSimplicialComplex.IsCombinatorialManifold.exists_chartedSpace_hasGroupoid_PLGroupoid)).
- **The degree inequality for simplicial volume**: if a map carries one real fundamental class to d times another, then |d|‖N‖ ≤ ‖M‖ ([`TauCeti.HomologicalOrientation.abs_mul_simplicialVolume_le`](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/Singular/LocalHomology/SimplicialVolume.html#TauCeti.HomologicalOrientation.abs_mul_simplicialVolume_le)).

### Notable definitions and infrastructure

- **Approximation of star immersions**: on every fine enough edgewise subdivision, the secant map of an injective C¹ star immersion is a closed embedding ([`eventually_isClosedEmbedding_secantMap_edgewiseSubdivision`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/SmoothTriangulation/StarImmersion.html#TauCeti.IsStarImmersion.eventually_isClosedEmbedding_secantMap_edgewiseSubdivision)). Every small perturbation of such an embedding is again an embedding ([`exists_pos_forall_isStarImmersion_and_injective`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/SmoothTriangulation/Perturbation.html#TauCeti.IsStarImmersion.exists_pos_forall_isStarImmersion_and_injective)). These are the approximation steps the Cairns–Whitehead theorem needs.
- **Property P and Property R**: both are stated for knots ([`TauCeti.HasPropertyP`](https://taucetiproject.org/docs/TauCeti/LowDimTopology/DehnSurgery/NontrivialKnot.html#TauCeti.HasPropertyP)). With the Kronheimer–Mrowka and Gabai theorems recorded as hypotheses, simply connected surgeries and S¹ × S² zero-surgeries are shown to detect the unknot.
- **Cohomology of product Thom pairs**: top-degree relative cohomology is identified with maps out of the base's zeroth homology. This supplies the local data for building global Thom classes ([`TauCeti.prodThomPairSingularCohomologyEquiv`](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/Cohomology/ProdThomPair.html#TauCeti.prodThomPairSingularCohomologyEquiv)).

### Roadmap coverage

Layers 3 and 8 are done. In Layer 8, "done" means the model geometries and the decomposition statements are available; the classification theorems are not proved.

Layer 1 has connected sum, which is well defined and associative up to diffeomorphism, together with tubular neighbourhoods and disc bundles. It lacks general collars, gluing along boundary pieces, and handles.

Layer 2 reaches [local flatness of PL curves](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/LocallyFlat/PL.html#TauCeti.IsLocallyFlat.of_isPLMap); higher-dimensional PL embeddings are open.

Layer 4 has its polynomial invariants on closed braids, including Markov invariance of HOMFLY and its Jones specialization, and has begun the passage from polygons to diagrams. It lacks Reidemeister's theorem, the converse Markov theorem and the transport of HOMFLY to diagrams.

Layer 5 has Dehn fillings, with the unknot's fillings, and the statements of Property P and Property R. It lacks Lickorish–Wallace, Mathieu's theorem and the cyclic surgery theorem.

Layer 6 has sliceness, caps for concordances and signatures that are invariant under algebraic concordance. It lacks the concordance group and the cobordism category.

Layer 7 lacks metric-independence of hyperbolic volume and a concrete Weeks manifold. Layer 9 lacks the existence of a splitting for every closed orientable 3-manifold. Layer 10 lacks Thom classes for nontrivial oriented plane bundles.

Layer 11 has collapse, Zeeman's dunce-hat case, PL inverses and approximation machinery. It lacks Cairns–Whitehead, Whitehead's converse, the Radó and Moise theorems, Bing's house, and the implication from Zeeman's conjecture to Poincaré.

## The frontier

- **The Cairns–Whitehead theorem**: build a smooth triangulation of every smooth manifold from the secant approximations and the perturbation lemma now available. This would also open a route to Heegaard splittings of every closed orientable 3-manifold.
- **Reidemeister's theorem**: connect polygonal knots to diagrams. Inscribed polygons, the invariance of Gauss codes under Δ-moves, and the reading of kinks as first Reidemeister moves are in place; the theorem connecting isotopy to moves is not.
- **Global collars and gluing along boundary pieces**: prove that collars exist for general boundaries, and construct smooth gluing along partial seams. Handle attachment depends on this.
- **Thom classes of oriented plane bundles**: assemble the local product classes into global classes for nontrivial bundles, so that Euler classes of foliations exist beyond the trivial case.
- **The rest of Zeeman's programme**: Bing's house as a second contractible but non-collapsible complex, and the implication from Zeeman's conjecture to the Poincaré conjecture.
