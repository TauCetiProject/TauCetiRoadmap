<!--tauceti-status:v1 {"roadmap":"GeometricTopology","to_sha":"e583e15d3be177d86491854d1db508f6edfe5ee7","ts":"2026-11-07T20:34:01Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 1","remaining":"existence of global collars, gluing along boundary pieces, handle attachment","state":"partial"},{"id":"Layer 2","remaining":"local flatness of general PL embeddings beyond curves, against the PL groupoid","state":"partial"},{"id":"Layer 3","state":"done"},{"id":"Layer 4","remaining":"Reidemeister's theorem, the converse of Markov's theorem, polygonal knots to diagrams","state":"partial"},{"id":"Layer 5","remaining":"Dehn filling along a slope and the unknot surgery identities","state":"partial"},{"id":"Layer 6","remaining":"the concordance group, the cobordism category, the Tristram-Levine signature of actual knots, the tau import","state":"partial"},{"id":"Layer 7","remaining":"a proof of Mostow invariance of hyperbolic volume, and the Weeks manifold with its minimal-volume statement","state":"partial"},{"id":"Layer 8","state":"done"},{"id":"Layer 9","remaining":"existence of a Heegaard splitting for every closed 3-manifold","state":"partial"},{"id":"Layer 10","remaining":"existence of Thom classes, hence Euler classes, for nontrivial oriented plane bundles","state":"partial"},{"id":"Layer 11","remaining":"Whitehead's converse: every PL manifold admits a combinatorial triangulation","state":"partial"}],"readme_sha":"4c1e7d510ffab6bcc71aed0a84871482f0a69a32136169a7f2f8bea571471d2f","roadmap":"GeometricTopology","to_sha":"e583e15d3be177d86491854d1db508f6edfe5ee7"}-->
# Status: GeometricTopology

This file documents the status of the GeometricTopology roadmap up until `e583e15` (2026-11-07T20:34:01Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Layers 3 and 8 are done. `Diff(M)` is a topological group, and the eight Thurston geometries come with their full isometry groups. Layer 1 now has a well-defined connected sum, but gluing along a boundary has not begun, and neither have Dehn filling, the concordance group or the existence of Heegaard splittings. Every other layer is partial.

### Named results

- **The connected sum is well defined**: for connected, Hausdorff, σ-compact oriented smooth manifolds without boundary, the connected sum does not depend on the chosen balls up to diffeomorphism ([`ConnectedSum.nonempty_diffeomorph_of_isOrientationReversingAt`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/ConnectedSum/Independence.html#TauCeti.ConnectedSum.nonempty_diffeomorph_of_isOrientationReversingAt)). It satisfies [`X # Sⁿ ≃ X`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/ConnectedSum/Oriented.html#TauCeti.OrientedConnectedSum.nonempty_diffeomorph_sphere).
- **The Schoenflies theorem**: every Jordan curve in the plane is the image of the unit circle under a homeomorphism of the plane that carries the disc onto its inside, and the same holds on the 2-sphere ([`IsJordanCurve.exists_homeomorph_image_sphere`](https://taucetiproject.org/docs/TauCeti/Analysis/Complex/Conformal/Jordan/Schoenflies.html#TauCeti.IsJordanCurve.exists_homeomorph_image_sphere)).
- **Combinatorial manifolds are PL manifolds**: the polyhedron of a positive-dimensional combinatorial manifold has a half-space atlas with PL transition maps ([`exists_chartedSpace_hasGroupoid_PLGroupoid`](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/SimplicialComplex/CombinatorialManifold/PL.html#PreAbstractSimplicialComplex.IsCombinatorialManifold.exists_chartedSpace_hasGroupoid_PLGroupoid)).
- **Markov invariance of the HOMFLY polynomial**: the HOMFLY polynomial of a braid closure, built by interpolating the `sl_N` Jimbo traces, satisfies the skein relation and is unchanged by Markov moves ([`MarkovEquiv.homfly_eq`](https://taucetiproject.org/docs/TauCeti/KnotTheory/Homfly/Existence.html#TauCeti.MarkovEquiv.homfly_eq)).
- **`Diff(M)` is a topological group**: for a compact manifold, composition and inversion are continuous in the weak Whitney topology ([`Diffeomorph.isTopologicalGroup`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Diffeomorphism/Inversion.html#Diffeomorph.isTopologicalGroup)). For spheres this group is [not path-connected](https://taucetiproject.org/docs/TauCeti/Geometry/Diffeomorphism/Sphere/Isotopy.html#TauCeti.not_pathConnectedSpace_diff_sphere).

### Notable definitions and infrastructure

- **Framed knot exteriors**: the [knot exterior](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LowDimTopology/SolidTorusNeighborhood/Exterior.html#TauCeti.knotExterior) is a 3-manifold whose boundary torus has a [framing number](https://taucetiproject.org/docs/TauCeti/LowDimTopology/DehnSurgery/SeifertFraming.html#TauCeti.IsSolidTorusNeighborhood.framingNumber) and a null-homologous preferred longitude. These are the meridian and longitude conventions that Dehn filling needs.
- **The Euler class of a foliation** ([`Foliation.eulerClass`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Foliation/EulerClass.html#TauCeti.Foliation.eulerClass)): it is read off a Thom class of the tangent field, which makes it possible to state [Thurston's Euler class inequality](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Foliation/EulerClass.html#TauCeti.ThurstonEulerClassInequality) and Yazdi's theorem.
- **Simplicial volume** ([`simplicialVolume`](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/Singular/LocalHomology/SimplicialVolume.html#TauCeti.HomologicalOrientation.simplicialVolume)): Gromov's norm of a compact oriented manifold. It is homotopy-invariant, obeys the degree inequality, and vanishes when the manifold has a self-map of degree greater than one. It gives a topological route toward volume statements.

### Roadmap coverage

- **Layers 3 and 8** are done. Layer 3 also has [Cerf's theorem](https://taucetiproject.org/docs/TauCeti/Geometry/Diffeomorphism/Cerf.html#TauCeti.CerfTheorem) as a statement, together with a proof that the Smale conjecture implies it.
- **Layer 1** has local collars, tubular neighbourhoods, a disc theorem, invariance of domain, and the connected sum with its independence theorem and [prime manifolds](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/ConnectedSum/Prime.html#TauCeti.IsPrimeManifold). Existence of global collars, gluing along boundary pieces and handles are missing.
- **Layer 2** has local flatness for smooth embeddings, PL curves and cones over Jordan curves in `S²`, but not for general PL embeddings.
- **Layer 11** is done except for Whitehead's converse.
- **Layer 9** is done except for the existence of a splitting for every closed 3-manifold.
- **Layer 10** has all its statements, but Thom classes exist only for trivial bundles.
- **Layer 4** lacks Reidemeister's theorem, the converse of Markov's theorem, and the passage from polygonal knots to diagrams.
- **Layers 5, 6 and 7** are partial. Layer 5 has no Dehn filling, and Layer 6 has no concordance group. In Layer 7, volume is metric-independent only under an assumed Mostow rigidity, and there is no Weeks manifold.

The record of the most recent work is truncated, so some of these gaps may already be narrower than stated.

## The frontier

- **Gluing along the boundary**: the connected sum avoided this by gluing punctured balls through an inversion. Global collars have an API but no existence theorem. Dehn filling, handles and Heegaard regluing all wait on gluing.
- **Dehn filling and the unknot surgeries**: the [unknot's exterior is a solid torus](https://taucetiproject.org/docs/TauCeti/LowDimTopology/SolidTorusNeighborhood/Unknot.html#TauCeti.unknotExteriorHomeomorph), which is the input for `0`- and `∞`-surgery. The filling itself needs gluing.
- **Thom classes of oriented plane bundles**: the Thom-pair cohomology of a product bundle is computed, but existence for nontrivial bundles is missing. Until it lands, the foliation Euler-class statements could hold vacuously.
- **Every closed 3-manifold has a Heegaard splitting**: this would make the Heegaard genus unconditional. It needs a triangulation or Morse-function argument, together with gluing.
- **Whitehead's converse**: every PL manifold should admit a combinatorial triangulation. This would finish reconciling Layer 11 with the PL groupoid.
