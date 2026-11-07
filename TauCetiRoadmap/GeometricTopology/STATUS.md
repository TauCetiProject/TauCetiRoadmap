<!--tauceti-status:v1 {"roadmap":"GeometricTopology","to_sha":"17cb757959975e1df09a4b0c64ad4d75c41abd81","ts":"2026-11-07T13:16:57Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 1","remaining":"general boundary collars, gluing along boundary pieces and handle attachment","state":"partial"},{"id":"Layer 2","remaining":"the higher-dimensional PL local-flatness target beyond embedded curves","state":"partial"},{"id":"Layer 3","state":"done"},{"id":"Layer 4","remaining":"Reidemeister's theorem, the converse of Markov's theorem and polygonal knots to diagrams","state":"partial"},{"id":"Layer 5","remaining":"Dehn filling along a slope and the unknot surgery identities","state":"partial"},{"id":"Layer 6","remaining":"the knot concordance group, cobordism composition, signatures of geometric knots and the tau import","state":"partial"},{"id":"Layer 7","remaining":"Mostow invariance of hyperbolic volume and the Weeks construction with its minimal-volume statement","state":"partial"},{"id":"Layer 8","state":"done"},{"id":"Layer 9","remaining":"existence of Heegaard splittings for closed orientable 3-manifolds","state":"partial"},{"id":"Layer 10","remaining":"Thom-class existence for nontrivial oriented plane bundles","state":"partial"},{"id":"Layer 11","remaining":"Whitehead's converse: every PL manifold admits a combinatorial triangulation","state":"partial"}],"readme_sha":"4c1e7d510ffab6bcc71aed0a84871482f0a69a32136169a7f2f8bea571471d2f","roadmap":"GeometricTopology","to_sha":"17cb757959975e1df09a4b0c64ad4d75c41abd81"}-->
# Status: GeometricTopology

This file documents the status of the GeometricTopology roadmap up until `17cb757` (2026-11-07T13:16:57Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Layers 3 and 8 meet the roadmap's infrastructure and statement goals; the other nine layers remain partial, with connected sum now constructed and independent of choices. General boundary gluing, Dehn filling and the knot concordance group remain unestablished here.

### Named results

- **Connected sum is independent of its balls** — For connected, Hausdorff, σ-compact oriented smooth manifolds without boundary in positive finite dimension, changing orientation-compatible coordinate balls preserves the diffeomorphism type ([`TauCeti.ConnectedSum.nonempty_diffeomorph_of_isOrientationReversingAt`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/ConnectedSum/Independence.html#TauCeti.ConnectedSum.nonempty_diffeomorph_of_isOrientationReversingAt)).
- **The sphere identity for connected sum** — M # Sⁿ is diffeomorphic to M for a connected oriented smooth n-manifold without boundary, n ≥ 1 ([`TauCeti.OrientedConnectedSum.nonempty_diffeomorph_sphere`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/ConnectedSum/Oriented.html#TauCeti.OrientedConnectedSum.nonempty_diffeomorph_sphere)).
- **The Schoenflies theorem** — Every planar Jordan curve and its filled hull are the images of the unit circle and closed disc under an ambient homeomorphism ([`TauCeti.IsJordanCurve.exists_homeomorph_image_sphere`](https://taucetiproject.org/docs/TauCeti/Analysis/Complex/Conformal/Jordan/Schoenflies.html#TauCeti.IsJordanCurve.exists_homeomorph_image_sphere)).
- **Homotopy invariance of simplicial volume** — Homotopy equivalent compact connected oriented manifolds have equal simplicial volume, regardless of their orientations ([`TauCeti.HomologicalOrientation.simplicialVolume_eq_of_homotopyEquiv`](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/Singular/LocalHomology/SimplicialVolume.html#TauCeti.HomologicalOrientation.simplicialVolume_eq_of_homotopyEquiv)).
- **Combinatorial manifolds are PL manifolds** — The realization of a positive-dimensional combinatorial manifold admits a half-space atlas with PL transitions ([`exists_chartedSpace_hasGroupoid_PLGroupoid`](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/SimplicialComplex/CombinatorialManifold/PL.html#PreAbstractSimplicialComplex.IsCombinatorialManifold.exists_chartedSpace_hasGroupoid_PLGroupoid)).

### Notable definitions and infrastructure

- **PL maps between manifolds** — A chart-independent notion of piecewise linearity connects the PL groupoid to local flatness of embedded curves ([`TauCeti.IsPLMap`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/PLGroupoid/Map.html#TauCeti.IsPLMap), [`TauCeti.IsLocallyFlat.of_isPLMap`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/LocallyFlat/PL.html#TauCeti.IsLocallyFlat.of_isPLMap)).
- **Homology cobordisms** — Compact smooth cobordisms whose two boundary inclusions induce homology isomorphisms now have a reusable interface ([`TauCeti.IsHomologyCobordism`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/HomologyCobordism.html#TauCeti.IsHomologyCobordism)).
- **Foliation Euler classes** — The tangent plane field's Thom class supplies a degree-two singular cohomology class for pairing with surfaces; existence for nontrivial oriented plane bundles remains a gap ([`Foliation.eulerClass`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Foliation/EulerClass.html#TauCeti.Foliation.eulerClass)).

### Roadmap coverage

Layers 3 and 8 remain done: compact-source diffeomorphism-group topology and the model geometries with JSJ and geometrization statements, without claiming proofs of those statements. Layers 1–2 remain partial: connected sum is available, but general collars, boundary-piece gluing and handles remain gaps; PL local flatness reaches curves. Layers 4–6 remain partial: diagram and braid invariants, framed exteriors and concordance relations exist, but geometric presentation correspondences, Dehn filling, the concordance group and cobordism composition are missing. Layer 7 has curvature and isometry-invariant Riemannian volume; hyperbolic volume still assumes Mostow rigidity for metric independence, and the Weeks construction is missing. Layer 9 lacks general splitting existence; Layer 10 lacks general Thom-class existence; Layer 11 lacks Whitehead's converse. The declaration context is truncated, so gaps retain the earlier assessment where new evidence does not settle them.

## The frontier

- **Boundary gluing** — Prove general collar existence and construct gluing along boundary pieces, including corners; this supplies handles and the gluing needed for Dehn filling.
- **Thom classes of oriented plane bundles** — Extend existence beyond trivial bundles so foliation Euler-class statements have their intended generality.
- **Knot presentation equivalences** — Construct polygonal-to-diagram passage and prove Reidemeister's theorem and the converse of Markov's theorem.
- **Heegaard splitting existence** — Prove every closed orientable 3-manifold has a splitting, using a triangulation or Morse argument together with gluing.
- **Whitehead's converse** — Construct a combinatorial triangulation of every PL manifold, completing the reconciliation with chart-based PL structures.
