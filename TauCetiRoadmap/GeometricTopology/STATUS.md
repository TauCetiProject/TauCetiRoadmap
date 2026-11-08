<!--tauceti-status:v1 {"roadmap":"GeometricTopology","to_sha":"e583e15d3be177d86491854d1db508f6edfe5ee7","ts":"2026-11-07T20:34:01+00:00"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 1","remaining":"gluing along pieces of the boundary, handle attachment, and collars of general boundaries","state":"partial"},{"id":"Layer 2","remaining":"local flatness of PL embeddings of dimension above one, against the PL groupoid","state":"partial"},{"id":"Layer 3","state":"done"},{"id":"Layer 4","remaining":"Reidemeister's theorem, the converse of Markov's theorem, polygonal knots to diagrams","state":"partial"},{"id":"Layer 5","remaining":"Dehn filling along a slope and the unknot surgery identities","state":"partial"},{"id":"Layer 6","remaining":"the concordance group, the cobordism category, the Tristram-Levine signature of actual knots, the tau import","state":"partial"},{"id":"Layer 7","remaining":"a proof of Mostow invariance of hyperbolic volume, and the Weeks manifold with its minimal-volume statement","state":"partial"},{"id":"Layer 8","state":"done"},{"id":"Layer 9","remaining":"existence of a Heegaard splitting for every closed 3-manifold","state":"partial"},{"id":"Layer 10","remaining":"existence of Thom classes, hence Euler classes, for nontrivial oriented plane bundles","state":"partial"},{"id":"Layer 11","remaining":"Whitehead's converse: every PL manifold admits a combinatorial triangulation","state":"partial"}],"readme_sha":"4c1e7d510ffab6bcc71aed0a84871482f0a69a32136169a7f2f8bea571471d2f","roadmap":"GeometricTopology","to_sha":"e583e15d3be177d86491854d1db508f6edfe5ee7"}-->
# Status: GeometricTopology

This file documents the status of the GeometricTopology roadmap up until `e583e15` (2026-11-07T20:34:01+00:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Layers 3 and 8 are done. `Diff(M)` is a topological group, and the eight Thurston geometries come with their full isometry groups, alongside the geometrization and JSJ statements. Layer 1 now has a well-defined connected sum, but gluing along a boundary has not begun, and neither have Dehn filling, the concordance group or the existence of Heegaard splittings. Every other layer is partial.

### Named results

- **The connected sum is well defined.** For connected, σ-compact oriented manifolds, the sum does not depend on the balls chosen. Sums along any two admissible pairs of balls are diffeomorphic ([`nonempty_diffeomorph_of_isOrientationReversingAt`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/ConnectedSum/Independence.html#TauCeti.ConnectedSum.nonempty_diffeomorph_of_isOrientationReversingAt)). The oriented sum is commutative and satisfies [`M # Sⁿ ≃ M`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/ConnectedSum/Oriented.html#TauCeti.OrientedConnectedSum.nonempty_diffeomorph_sphere).
- **The Schoenflies theorem in the plane**: every Jordan curve in `ℂ` is the image of the unit circle under a homeomorphism of the plane that carries the disc onto its inside ([`IsJordanCurve.exists_homeomorph_image_sphere`](https://taucetiproject.org/docs/TauCeti/Analysis/Complex/Conformal/Jordan/Schoenflies.html#TauCeti.IsJordanCurve.exists_homeomorph_image_sphere)). The theorem is also proved on the 2-sphere.
- **Combinatorial manifolds are PL manifolds**: the polyhedron of a positive-dimensional combinatorial manifold has a half-space atlas whose transition maps are PL ([`exists_chartedSpace_hasGroupoid_PLGroupoid`](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/SimplicialComplex/CombinatorialManifold/PL.html#PreAbstractSimplicialComplex.IsCombinatorialManifold.exists_chartedSpace_hasGroupoid_PLGroupoid)).
- **Markov invariance of the HOMFLY polynomial**: the HOMFLY polynomial of a braid closure satisfies the skein relation and is unchanged by Markov moves ([`MarkovEquiv.homfly_eq`](https://taucetiproject.org/docs/TauCeti/KnotTheory/Homfly/Existence.html#TauCeti.MarkovEquiv.homfly_eq)).
- **`Diff(M)` is a topological group**: for a compact manifold, composition and inversion are continuous in the weak Whitney topology ([`Diffeomorph.isTopologicalGroup`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Diffeomorphism/Inversion.html#Diffeomorph.isTopologicalGroup)). For spheres, [`Diff(Sⁿ)` is not path-connected](https://taucetiproject.org/docs/TauCeti/Geometry/Diffeomorphism/Sphere/Isotopy.html#TauCeti.not_pathConnectedSpace_diff_sphere).

### Notable definitions and infrastructure

- **Framed knot exteriors**: the [knot exterior](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LowDimTopology/SolidTorusNeighborhood/Exterior.html#TauCeti.knotExterior) is a 3-manifold whose boundary is a torus. That torus carries a [framing number](https://taucetiproject.org/docs/TauCeti/LowDimTopology/DehnSurgery/SeifertFraming.html#TauCeti.IsSolidTorusNeighborhood.framingNumber) and a null-homologous preferred longitude, which are the conventions that Dehn filling will need.
- **The Euler class of a foliation** ([`Foliation.eulerClass`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Foliation/EulerClass.html#TauCeti.Foliation.eulerClass)): it is read off a Thom class of the tangent field. This makes Thurston's inequality and Yazdi's theorem stateable.
- **Prime manifolds** ([`IsPrimeManifold`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/ConnectedSum/Prime.html#TauCeti.IsPrimeManifold)), together with decompositions into finitely many summands. This is the connected-sum vocabulary that a prime decomposition theorem will need.

### Roadmap coverage

- **Layers 3 and 8** are done. Layer 3 now also states [Cerf's theorem](https://taucetiproject.org/docs/TauCeti/Geometry/Diffeomorphism/Cerf.html#TauCeti.CerfTheorem) and derives it from the Smale conjecture. Neither statement is proved.
- **Layer 1** has collars, tubular neighbourhoods, the disc theorem and invariance of domain. It now also has the connected sum, with independence of the balls. Gluing along pieces of the boundary and handle attachment are missing.
- **Layer 2** is done except for local flatness of PL embeddings: only PL curves are handled so far.
- **Layer 11** has the PL structure on combinatorial manifolds and the identification of simplicial with singular homology. It now also has edgewise, stellar and common subdivisions. Whitehead's converse is missing.
- **Layers 4, 5, 6, 7, 9 and 10** are partial, as assessed previously. The evidence for the latest stretch did not reach the modules for these layers, so the assessments are carried forward unchanged:
  - Layer 4 lacks Reidemeister's theorem.
  - Layer 5 lacks Dehn filling.
  - Layer 6 lacks the concordance group.
  - Layer 7 has volume only under an assumed Mostow rigidity.
  - Layer 9 lacks the existence of Heegaard splittings.
  - Layer 10 has Thom classes only for trivial bundles.

## The frontier

- **Gluing along the boundary**: global collar data and its API exist, but there is no gluing construction. Handles, Dehn filling, cobordism composition and Heegaard regluing all wait on it.
- **Dehn filling and the unknot surgeries**: the [unknot's exterior is a solid torus](https://taucetiproject.org/docs/TauCeti/LowDimTopology/SolidTorusNeighborhood/Unknot.html#TauCeti.unknotExteriorHomeomorph), which is the input for `0`- and `∞`-surgery. The filling itself needs gluing.
- **Thom classes of oriented plane bundles**: existence is known only for trivial bundles. The relative cohomology of a product Thom pair is now computed, but until nontrivial bundles are covered, the foliation Euler-class statements could hold vacuously.
- **Every closed 3-manifold has a Heegaard splitting**: this would make the Heegaard genus unconditional. It needs a triangulation or Morse-function argument, together with gluing.
- **Whitehead's converse**: every PL manifold should admit a combinatorial triangulation. This would close the reconciliation of Layer 11 with the PL groupoid.
