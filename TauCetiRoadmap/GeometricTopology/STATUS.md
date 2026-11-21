<!--tauceti-status:v1 {"roadmap":"GeometricTopology","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e","ts":"2026-11-19T18:22:01+11:00"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 1","remaining":"existence of smooth collars, gluing along boundary pieces, handle attachment, Dehn twists and embeddings of all compact surfaces in R^4","state":"partial"},{"id":"Layer 2","remaining":"local flatness of higher-dimensional PL embeddings and the annulus theorem in dimensions at most three","state":"partial"},{"id":"Layer 3","state":"done"},{"id":"Layer 4","remaining":"Reidemeister's theorem, the converse Markov theorem, polygonal knots to diagrams and HOMFLY transport","state":"partial"},{"id":"Layer 5","remaining":"Lickorish-Wallace, Mathieu's theorem and the cyclic surgery theorem","state":"partial"},{"id":"Layer 6","remaining":"the concordance group, cobordism category, signatures of geometric knots and the tau import","state":"partial"},{"id":"Layer 7","remaining":"proved metric-independence of hyperbolic volume and a concrete Weeks manifold with its minimal-volume statement","state":"partial"},{"id":"Layer 8","remaining":"Dehn's lemma, the loop and sphere theorems, and proofs of the Kneser-Milnor prime decomposition","state":"partial"},{"id":"Layer 9","remaining":"existence of a Heegaard splitting for every closed orientable 3-manifold","state":"partial"},{"id":"Layer 10","remaining":"existence of Thom classes for nontrivial oriented plane bundles","state":"partial"},{"id":"Layer 11","remaining":"Cairns-Whitehead, Whitehead's converse, the Rado and Moise theorems, and Zeeman implies Poincare","state":"partial"}],"readme_sha":"2f1fd7f845117184c6a13928c4e326b6cb1ad3335cf95934d7f1145a4258c0b2","roadmap":"GeometricTopology","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e"}-->
# Status: GeometricTopology

This file documents the status of the GeometricTopology roadmap up until `b235000` (2026-11-19T18:22:01+11:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Only Layer 3, the topology of diffeomorphism groups, is complete. The generalized Schoenflies theorem is proved in every dimension, and Alexander's theorem is proved in its locally flat form. Layer 8 was previously counted as done, but Alexander's theorem only landed now and Dehn's lemma is still absent, so it is now counted as partial. Collar existence, gluing, the concordance group, Reidemeister's theorem and smooth triangulations of every manifold have not begun.

### Named results

- **The generalized Schoenflies theorem**: in every dimension, a locally flat codimension-one sphere is carried by a homeomorphism of the ambient sphere onto the equator, with the closures of its two complementary domains going to the closed hemispheres ([`IsLocallyFlat.exists_homeomorph_sphere_eq_equatorInclusion`](https://taucetiproject.org/docs/TauCeti/Topology/Schoenflies/LocallyFlat.html#TauCeti.IsLocallyFlat.exists_homeomorph_sphere_eq_equatorInclusion)).
- **Alexander's theorem**: every locally flat 2-sphere in S³ bounds a ball on each side, so S³ is irreducible ([`isSphereBoundsBall_sphere`](https://taucetiproject.org/docs/TauCeti/Topology/Schoenflies/SphereBoundsBall.html#TauCeti.isSphereBoundsBall_sphere)). S¹ × S² is [not irreducible](https://taucetiproject.org/docs/TauCeti/Topology/Schoenflies/SphereBoundsBall.html#TauCeti.not_isSphereBoundsBall_circle_prod_sphere).
- **Zeeman's theorem for the dunce hat**: the dunce hat is contractible but not collapsible, yet its ordered cylinder is collapsible ([`collapsible_orderedCylinder_dunceHat`](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/SimplicialComplex/DunceHat.html#TauCeti.collapsible_orderedCylinder_dunceHat)). Bing's house is likewise [contractible but not collapsible](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/SimplicialComplex/BingsHouse.html#TauCeti.not_collapsible_bingsHouse).
- **The sphere identity for connected sum**: the connected sum of a connected, oriented, boundaryless smooth n-manifold with Sⁿ is diffeomorphic to the manifold itself ([`OrientedConnectedSum.nonempty_diffeomorph_sphere`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/ConnectedSum/Oriented.html#TauCeti.OrientedConnectedSum.nonempty_diffeomorph_sphere)).
- **The real projective plane embeds in ℝ⁴**: the Veronese map followed by stereographic projection is a smooth embedding ([`isSmoothEmbedding_projectivePlaneEmbedding`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Projectivization/ProjectivePlane.html#Projectivization.isSmoothEmbedding_projectivePlaneEmbedding)).

### Notable definitions and infrastructure

- **Combinatorial manifolds**: their realizations [are PL manifolds](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/SimplicialComplex/CombinatorialManifold/PL.html#PreAbstractSimplicialComplex.IsCombinatorialManifold.exists_chartedSpace_hasGroupoid_PLGroupoid). Their boundary is [a combinatorial manifold one dimension down](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/SimplicialComplex/CombinatorialManifold/Boundary.html#PreAbstractSimplicialComplex.IsCombinatorialManifold.isCombinatorialManifold_manifoldBoundary), and stellar moves preserve them. This is what lets smooth and PL structures be compared in Layer 11.
- **Approximation of star immersions**: on fine enough subdivisions, the secant map of an injective C¹ star immersion is [a closed embedding](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/SmoothTriangulation/StarImmersion.html#TauCeti.IsStarImmersion.eventually_isClosedEmbedding_secantMap_edgewiseSubdivision), and it can be made rectilinear where a cut-off function is one. These are the approximation steps the Cairns–Whitehead theorem needs.
- **Smooth collars as data**: a [smooth collar](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Boundary/Collar/Smooth.html#TauCeti.SmoothCollar) is a diffeomorphism onto an open neighbourhood of the boundary. It can be reparametrized, and it forgets to a topological collar. Every gluing in Layer 1 takes collars as arguments.

### Roadmap coverage

Layer 3 is done. Layer 1 has:
- connected sum, associative up to diffeomorphism;
- tubular neighbourhoods that deformation retract onto their core;
- disc bundles and the embedding of ℝP² in ℝ⁴;
- PL inverses and PL boundaries;
- the definitions of smooth collars and of the mapping class group.

It lacks the existence of collars, gluing, handles, Dehn twists and embeddings of all compact surfaces in ℝ⁴. Layer 2 has the full generalized Schoenflies theorem. It lacks local flatness of higher-dimensional PL embeddings and the low-dimensional annulus theorem.

Layer 8 has Thurston's model geometries and the decomposition statements, and now Alexander's theorem. It lacks Dehn's lemma, the loop and sphere theorems, and proofs of the Kneser–Milnor decomposition. Layer 11 has the dunce hat, Bing's house and combinatorial manifolds as PL manifolds. It lacks Cairns–Whitehead, the Radó and Moise theorems and the step from Zeeman to Poincaré.

Layers 4–7, 9 and 10 stand where they did:
- Layer 4 has closed-braid invariants but no Reidemeister theorem.
- Layer 5 has Dehn fillings and the Property P and R statements but not Lickorish–Wallace.
- Layer 6 has sliceness and signature invariance but no concordance group.
- Layer 7 has the simplicial-volume degree inequality but no metric-independence of hyperbolic volume.
- Layer 9 lacks Heegaard splittings of every closed 3-manifold.
- Layer 10 lacks Thom classes of nontrivial plane bundles.

## The frontier

- **Existence of smooth collars**: prove that every manifold with boundary has a smooth collar, using inward flows. The definition is now in place. Gluing, handle attachment, uniqueness of collars and the triviality of Mod(D²) all wait on this.
- **The Cairns–Whitehead theorem**: assemble a smooth triangulation of every smooth manifold from the approximation and perturbation lemmas already proved. Heegaard splittings of 3-manifolds and Löh's comparison depend on it.
- **Reidemeister's theorem**: connect polygonal knots to diagrams. Gauss codes of polygons, Δ-moves and kinks are in place, but the theorem itself is not.
- **Dehn's lemma and the prime decomposition**: with Alexander's theorem done, Layer 8.1 needs Dehn's lemma and the loop and sphere theorems. Proving that S¹ × S² is the only closed orientable prime that is not irreducible also needs the gluing of Layer 1.3.
- **The annulus theorem in low dimensions**: the cases n + 1 ≤ 3, from Schoenflies. Dimension three also needs Moise's triangulation theorem.
