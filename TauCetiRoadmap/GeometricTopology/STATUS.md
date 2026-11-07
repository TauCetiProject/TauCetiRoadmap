<!--tauceti-status:v1 {"roadmap":"GeometricTopology","to_sha":"17cb757959975e1df09a4b0c64ad4d75c41abd81","ts":"2026-11-07T13:16:57Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 1","remaining":"gluing along a piece of the boundary, handle attachment, and connected sum for manifolds with boundary","state":"partial"},{"id":"Layer 2","remaining":"local flatness of PL embeddings of manifolds of dimension above one, against the PL groupoid","state":"partial"},{"id":"Layer 3","state":"done"},{"id":"Layer 4","remaining":"Reidemeister's theorem, the converse of Markov's theorem, polygonal knots to diagrams","state":"partial"},{"id":"Layer 5","remaining":"Dehn filling along a slope and the unknot surgery identities","state":"partial"},{"id":"Layer 6","remaining":"the concordance group, the cobordism category, the Tristram-Levine signature of actual knots, the tau import","state":"partial"},{"id":"Layer 7","remaining":"a proof of Mostow invariance of hyperbolic volume, and the Weeks manifold with its minimal-volume statement","state":"partial"},{"id":"Layer 8","state":"done"},{"id":"Layer 9","remaining":"existence of a Heegaard splitting for every closed 3-manifold","state":"partial"},{"id":"Layer 10","remaining":"existence of Thom classes, hence Euler classes, for nontrivial oriented plane bundles","state":"partial"},{"id":"Layer 11","remaining":"Whitehead's converse: every PL manifold admits a combinatorial triangulation","state":"partial"}],"readme_sha":"4c1e7d510ffab6bcc71aed0a84871482f0a69a32136169a7f2f8bea571471d2f","roadmap":"GeometricTopology","to_sha":"17cb757959975e1df09a4b0c64ad4d75c41abd81"}-->
# Status: GeometricTopology

This file documents the status of the GeometricTopology roadmap up until `17cb757` (2026-11-07T13:16:57Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Layers 3 and 8 are done. `Diff(M)` is a topological group, and the eight Thurston geometries come with their isometry groups and with statements of geometrization and JSJ. Every other layer is partial, and Layer 1 now has a well-defined connected sum. Gluing along a boundary, Dehn filling, the concordance group and the existence of Heegaard splittings have not begun.

### Named results

- **The connected sum is well defined** — for connected, Hausdorff, σ-compact oriented manifolds without boundary, the connected sum along oppositely oriented coordinate balls does not depend on which balls are chosen ([`nonempty_diffeomorph_of_isOrientationReversingAt`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/ConnectedSum/Independence.html#TauCeti.ConnectedSum.nonempty_diffeomorph_of_isOrientationReversingAt)). The oriented connected sum is commutative and satisfies [`X # Sⁿ ≃ X`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/ConnectedSum/Oriented.html#TauCeti.OrientedConnectedSum.nonempty_diffeomorph_sphere).
- **Combinatorial manifolds are PL manifolds** — the polyhedron of a positive-dimensional combinatorial manifold has a half-space atlas whose transition maps are PL, possibly with boundary ([`exists_chartedSpace_hasGroupoid_PLGroupoid`](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/SimplicialComplex/CombinatorialManifold/PL.html#PreAbstractSimplicialComplex.IsCombinatorialManifold.exists_chartedSpace_hasGroupoid_PLGroupoid)).
- **Markov invariance of the HOMFLY polynomial** — the HOMFLY polynomial of a braid closure, built by interpolating the `sl_N` Jimbo traces, satisfies the skein relation and is unchanged by Markov moves ([`MarkovEquiv.homfly_eq`](https://taucetiproject.org/docs/TauCeti/KnotTheory/Homfly/Existence.html#TauCeti.MarkovEquiv.homfly_eq)). The Jones polynomial and the Alexander module of a diagram are invariant under all three Reidemeister moves.
- **`Diff(M)` is a topological group** — for a compact manifold, composition and inversion are continuous in the weak Whitney topology ([`Diffeomorph.isTopologicalGroup`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Diffeomorphism/Inversion.html#Diffeomorph.isTopologicalGroup)).
- **The Schoenflies theorem** — a homeomorphism of the plane carries the unit circle onto any given Jordan curve and the disc onto its inside ([`IsJordanCurve.exists_homeomorph_image_sphere`](https://taucetiproject.org/docs/TauCeti/Analysis/Complex/Conformal/Jordan/Schoenflies.html#TauCeti.IsJordanCurve.exists_homeomorph_image_sphere)).

### Notable definitions and infrastructure

- **A genuine hyperbolic metric** ([`UpperHalfSpace.hyperbolicMetric`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Riemannian/Hyperbolic/UpperHalfSpace/Metric.html#TauCeti.UpperHalfSpace.hyperbolicMetric)): the upper half-space is complete with sectional curvature `−1`. It models the bundled notion that hyperbolic volume uses.
- **Framed knot exteriors**: the [knot exterior](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LowDimTopology/SolidTorusNeighborhood/Exterior.html#TauCeti.knotExterior) is a 3-manifold whose boundary is a torus. That torus has a [framing number](https://taucetiproject.org/docs/TauCeti/LowDimTopology/DehnSurgery/SeifertFraming.html#TauCeti.IsSolidTorusNeighborhood.framingNumber) and a preferred longitude that is null-homologous in the complement. These are the conventions Dehn filling will need.
- **Prime manifolds** ([`IsPrimeManifold`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/ConnectedSum/Prime.html#TauCeti.IsPrimeManifold)): a manifold is prime if it is not a sphere and every connected-sum decomposition of it into closed manifolds has a sphere as one summand. With finite connected-sum decompositions, this makes the prime decomposition that geometrization sits on statable.

### Roadmap coverage

- **Layers 3 and 8** are done.
- **Layer 1** has the connected sum with independence of the balls and the sphere identity. It also has local collars, Brown's collaring for compact domains, tubular neighbourhoods and a disc theorem. Gluing along a piece of the boundary and handle attachment are missing, and the connected sum covers only manifolds without boundary.
- **Layer 2** is done except for local flatness of PL embeddings. Only PL curves are [locally flat against the PL groupoid](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/LocallyFlat/PL.html#TauCeti.IsLocallyFlat.of_isPLMap).
- **Layer 11** is missing only Whitehead's converse. Simplicial homology is identified with singular homology.
- **Layer 9** has rank at most Heegaard genus for manifolds with a splitting, and genus one for lens spaces. It lacks a proof that every closed 3-manifold has a splitting.
- **Layer 10** has all of its statements, but Thom classes exist only for trivial bundles.
- **Layer 4** has the HOMFLY, Jones and Alexander invariants. Reidemeister's theorem, the converse of Markov's theorem and the passage from polygonal knots to diagrams are missing.
- **Layers 5, 6 and 7** are partial:
  - Layer 5 has slopes, lens spaces and framed exteriors, but no Dehn filling.
  - Layer 6 has the concordance relations and both slice genera, but no concordance group.
  - In Layer 7, volume is metric-independent only under an assumed Mostow rigidity, and there is no Weeks manifold.

## The frontier

- **Gluing along the boundary**: the connected sum glues punctured open balls by inversion, so it gives no boundary gluing. Dehn filling, handles and Heegaard regluing still wait on that construction.
- **Dehn filling and the unknot surgeries**: the [unknot's exterior is a solid torus](https://taucetiproject.org/docs/TauCeti/LowDimTopology/SolidTorusNeighborhood/Unknot.html#TauCeti.unknotExteriorHomeomorph) with meridian and longitude exchanged, which is the input for `0`- and `∞`-surgery. The filling itself needs gluing.
- **The prime decomposition**: the definitions are in place, but the supplied material contains neither existence nor uniqueness of a decomposition of a closed 3-manifold into primes.
- **Thom classes of oriented plane bundles**: the cohomology of the Thom pair is computed only for product bundles. Until nontrivial bundles are handled, the foliation Euler-class statements could hold vacuously.
- **Every closed 3-manifold has a Heegaard splitting**: it would make the Heegaard genus unconditional, and needs a triangulation or Morse-function argument, together with gluing.
