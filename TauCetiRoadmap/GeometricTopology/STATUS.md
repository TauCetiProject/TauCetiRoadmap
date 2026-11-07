<!--tauceti-status:v1 {"roadmap":"GeometricTopology","to_sha":"9c7f9ea5445aa2dbf2ed7b015bd0369056657f91","ts":"2026-11-07T04:46:47Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 1","remaining":"gluing along boundary pieces, handle attachment, a collar theorem for general boundaries, connected sums of manifolds with boundary","state":"partial"},{"id":"Layer 2","remaining":"local flatness of general PL embeddings against the PL groupoid (curves are done)","state":"partial"},{"id":"Layer 3","state":"done"},{"id":"Layer 4","remaining":"Reidemeister's theorem, the converse of Markov's theorem, polygonal knots to diagrams","state":"partial"},{"id":"Layer 5","remaining":"Dehn filling along a slope and the unknot surgery identities","state":"partial"},{"id":"Layer 6","remaining":"the concordance group, the cobordism category, the Tristram-Levine signature of actual knots, the tau import","state":"partial"},{"id":"Layer 7","remaining":"a proof of Mostow invariance of hyperbolic volume; a concrete construction of the Weeks manifold is not established here","state":"partial"},{"id":"Layer 8","state":"done"},{"id":"Layer 9","remaining":"existence of a Heegaard splitting for every closed 3-manifold","state":"partial"},{"id":"Layer 10","remaining":"existence of Thom classes, hence Euler classes, for nontrivial oriented plane bundles","state":"partial"},{"id":"Layer 11","remaining":"Whitehead's converse: every PL manifold admits a combinatorial triangulation","state":"partial"}],"readme_sha":"4c1e7d510ffab6bcc71aed0a84871482f0a69a32136169a7f2f8bea571471d2f","roadmap":"GeometricTopology","to_sha":"9c7f9ea5445aa2dbf2ed7b015bd0369056657f91"}-->
# Status: GeometricTopology

This file documents the status of the GeometricTopology roadmap up until `9c7f9ea` (2026-11-07T04:46:47Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Layers 3 and 8 are done: `Diff(M)` is a topological group, and the eight Thurston geometries come with their full isometry groups. Every other layer is partial. Connected sum of manifolds without boundary is now finished. Gluing along a boundary, Dehn filling, the concordance group and the existence of Heegaard splittings have not begun.

### Named results

- **The connected sum is well defined**: for connected, σ-compact oriented smooth manifolds without boundary, connected sums along any two orientation-compatible pairs of balls are diffeomorphic ([`nonempty_diffeomorph_of_isOrientationReversingAt`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/ConnectedSum/Independence.html#TauCeti.ConnectedSum.nonempty_diffeomorph_of_isOrientationReversingAt)). The resulting `M # N` is commutative, and [`M # Sⁿ` is diffeomorphic to `M`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/ConnectedSum/Oriented.html#TauCeti.OrientedConnectedSum.nonempty_diffeomorph_sphere).
- **Combinatorial manifolds are PL manifolds**: the polyhedron of a positive-dimensional combinatorial manifold has a half-space atlas with PL transition maps, possibly with boundary ([`exists_chartedSpace_hasGroupoid_PLGroupoid`](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/SimplicialComplex/CombinatorialManifold/PL.html#PreAbstractSimplicialComplex.IsCombinatorialManifold.exists_chartedSpace_hasGroupoid_PLGroupoid)).
- **Markov invariance of the HOMFLY polynomial**: the HOMFLY polynomial of a braid closure satisfies the skein relation and is unchanged by Markov moves ([`MarkovEquiv.homfly_eq`](https://taucetiproject.org/docs/TauCeti/KnotTheory/Homfly/Existence.html#TauCeti.MarkovEquiv.homfly_eq)). The Jones polynomial and the Alexander module are invariant under all three Reidemeister moves on diagrams.
- **The Jordan–Brouwer separation theorem**: the complement of an embedded `n`-sphere in `Sⁿ⁺¹` has exactly two path components ([`natCard_zerothHomotopy_sphere_compl_range_eq_two`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicTopology/Singular/JordanBrouwer.html#TauCeti.natCard_zerothHomotopy_sphere_compl_range_eq_two)).
- **`Diff(M)` is a topological group**: for a compact manifold, composition and inversion are continuous in the weak Whitney topology ([`Diffeomorph.isTopologicalGroup`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Diffeomorphism/Inversion.html#Diffeomorph.isTopologicalGroup)). On top of it, [Cerf's theorem](https://taucetiproject.org/docs/TauCeti/Geometry/Diffeomorphism/Cerf.html#TauCeti.CerfTheorem) is stated and follows from the Smale conjecture.

### Notable definitions and infrastructure

- **Prime manifolds** ([`IsPrimeManifold`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/ConnectedSum/Prime.html#TauCeti.IsPrimeManifold)): a manifold that is not a sphere and splits off only spheres as connected summands. Together with iterated connected sums, this is the vocabulary that a prime decomposition statement needs.
- **The simplicial volume** ([`simplicialVolume`](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/Singular/LocalHomology/SimplicialVolume.html#TauCeti.HomologicalOrientation.simplicialVolume)): Gromov's norm of the real fundamental class. It is a homotopy invariant, satisfies the degree inequality, and vanishes on manifolds that have self-maps of degree greater than one. This gives a topological handle on volume.
- **The Euler class of a foliation** ([`Foliation.eulerClass`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Foliation/EulerClass.html#TauCeti.Foliation.eulerClass)): it is read off a Thom class of the tangent field, which is enough to state Thurston's Euler class inequality and Yazdi's theorem.

### Roadmap coverage

- **Layers 3 and 8** are done.
- **Layer 1** has local collars, tubular neighbourhoods, the disc theorem, invariance of domain, and now connected sum, for manifolds without boundary. It has no gluing along boundary pieces, no handles and no general collar theorem.
- **Layer 2** is done except for local flatness of general PL embeddings. So far only PL curves are covered.
- **Layer 4** has the HOMFLY, Jones and Alexander invariants. It lacks Reidemeister's theorem, the converse of Markov's theorem, and the passage from polygonal knots to diagrams.
- **Layer 5** has slopes, lens spaces and framed knot exteriors, but no Dehn filling.
- **Layer 6** has the concordance relations, both slice genera and homology cobordisms, but no concordance group.
- **Layer 7** has a genuine hyperbolic metric and volume. The [Gabai–Meyerhoff–Milley theorem](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Riemannian/Hyperbolic/Weeks.html#TauCeti.GabaiMeyerhoffMilleyTheorem) on the Weeks manifold is now stated, against a Weeks-manifold predicate whose concrete construction is not established here. Volume is independent of the metric only under an assumed Mostow rigidity.
- **Layer 9** proves rank at most Heegaard genus, but only for manifolds that have a splitting.
- **Layer 10** states everything, but Thom classes exist only for trivial bundles.
- **Layer 11** lacks only Whitehead's converse.

## The frontier

- **Gluing along the boundary**: global collar data exists, but there is no gluing construction. Dehn filling, handles, connected sums with boundary and Heegaard regluing all depend on it.
- **Dehn filling and the unknot surgeries**: the [unknot's exterior is a solid torus](https://taucetiproject.org/docs/TauCeti/LowDimTopology/SolidTorusNeighborhood/Unknot.html#TauCeti.unknotExteriorHomeomorph), with meridian and longitude exchanged, which is the input for `0`- and `∞`-surgery. The filling itself needs gluing.
- **Thom classes of oriented plane bundles**: the top Thom-pair cohomology of a product bundle has been computed, but existence is still known only for trivial bundles. Until that changes, the foliation Euler class statements could hold vacuously.
- **Whitehead's converse**: every PL manifold should admit a combinatorial triangulation. Common subdivisions of locally finite polyhedra are now available as an ingredient.
- **Every closed 3-manifold has a Heegaard splitting**: this would make the Heegaard genus unconditional. It needs a triangulation or Morse-function argument together with gluing.
