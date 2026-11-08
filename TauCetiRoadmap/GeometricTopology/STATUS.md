<!--tauceti-status:v1 {"roadmap":"GeometricTopology","to_sha":"a4fcb57d9a93070c2fce602420ecf8c991d6cdd7","ts":"2026-11-08T16:58:25+11:00"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 1","remaining":"a collar theorem for general boundaries, gluing along boundary pieces, and handle attachment","state":"partial"},{"id":"Layer 2","remaining":"local flatness of PL embeddings of dimension at least two against the PL groupoid","state":"partial"},{"id":"Layer 3","state":"done"},{"id":"Layer 4","remaining":"Reidemeister's theorem, the converse of Markov's theorem, polygonal knots to diagrams","state":"partial"},{"id":"Layer 5","remaining":"Dehn filling along a slope and the unknot surgery identities","state":"partial"},{"id":"Layer 6","remaining":"the concordance group, the cobordism category, the Tristram-Levine signature of actual knots, the tau import","state":"partial"},{"id":"Layer 7","remaining":"a proof of Mostow invariance of hyperbolic volume, and the Weeks manifold with its minimal-volume statement","state":"partial"},{"id":"Layer 8","state":"done"},{"id":"Layer 9","remaining":"existence of a Heegaard splitting for every closed 3-manifold","state":"partial"},{"id":"Layer 10","remaining":"existence of Thom classes, hence Euler classes, for nontrivial oriented plane bundles","state":"partial"},{"id":"Layer 11","remaining":"Whitehead's converse: every PL manifold admits a combinatorial triangulation","state":"partial"}],"readme_sha":"4c1e7d510ffab6bcc71aed0a84871482f0a69a32136169a7f2f8bea571471d2f","roadmap":"GeometricTopology","to_sha":"a4fcb57d9a93070c2fce602420ecf8c991d6cdd7"}-->
# Status: GeometricTopology

This file documents the status of the GeometricTopology roadmap up until `a4fcb57` (2026-11-08T16:58:25+11:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Layers 3 and 8 are done: `Diff(M)` is a topological group, and the eight Thurston geometries have their full isometry groups, with geometrization and JSJ stated. Every other layer is partial. Layer 1 now has a well-defined connected sum, but gluing along a boundary, Dehn filling, the concordance group and the existence of Heegaard splittings have not begun.

### Named results

- **The connected sum is well defined**: for connected, σ-compact oriented manifolds, the connected sum does not depend on the chosen balls, and the oriented connected sum satisfies `X # Sⁿ ≃ X` ([`OrientedConnectedSum.nonempty_diffeomorph_sphere`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/ConnectedSum/Oriented.html#TauCeti.OrientedConnectedSum.nonempty_diffeomorph_sphere)).
- **The Schoenflies theorem**: every Jordan curve in the plane is the image of the unit circle under a homeomorphism of `ℂ` that carries the disc onto its inside, and there is a version on the 2-sphere ([`IsJordanCurve.exists_homeomorph_image_sphere`](https://taucetiproject.org/docs/TauCeti/Analysis/Complex/Conformal/Jordan/Schoenflies.html#TauCeti.IsJordanCurve.exists_homeomorph_image_sphere)).
- **Combinatorial manifolds are PL manifolds**: the polyhedron of a positive-dimensional combinatorial manifold has a half-space atlas with PL transition maps ([`exists_chartedSpace_hasGroupoid_PLGroupoid`](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/SimplicialComplex/CombinatorialManifold/PL.html#PreAbstractSimplicialComplex.IsCombinatorialManifold.exists_chartedSpace_hasGroupoid_PLGroupoid)).
- **Markov invariance of the HOMFLY polynomial**: the HOMFLY polynomial of a braid closure satisfies the skein relation and is unchanged by Markov moves ([`MarkovEquiv.homfly_eq`](https://taucetiproject.org/docs/TauCeti/KnotTheory/Homfly/Existence.html#TauCeti.MarkovEquiv.homfly_eq)).
- **`Diff(M)` is a topological group**: for a compact manifold, composition and inversion are continuous in the weak Whitney topology ([`Diffeomorph.isTopologicalGroup`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Diffeomorphism/Inversion.html#Diffeomorph.isTopologicalGroup)).

### Notable definitions and infrastructure

- **Simplicial volume** ([`simplicialVolume`](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/Singular/LocalHomology/SimplicialVolume.html#TauCeti.HomologicalOrientation.simplicialVolume)): Gromov's norm of the real fundamental class. It is a homotopy invariant and satisfies the degree inequality, so it gives a homotopy-invariant handle on volume in Layer 7.
- **A genuine hyperbolic metric** ([`UpperHalfSpace.hyperbolicMetric`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Riemannian/Hyperbolic/UpperHalfSpace/Metric.html#TauCeti.UpperHalfSpace.hyperbolicMetric)): the upper half-space is complete with sectional curvature `−1`, a model for the bundled notion that hyperbolic volume uses.
- **The Euler class of a foliation** ([`Foliation.eulerClass`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Foliation/EulerClass.html#TauCeti.Foliation.eulerClass)): read off a Thom class of the tangent field and paired against surfaces, so that Thurston's inequality and Yazdi's refutation can be stated.

### Roadmap coverage

- **Layers 3 and 8** are done. Layer 3 also has [Cerf's theorem](https://taucetiproject.org/docs/TauCeti/Geometry/Diffeomorphism/Cerf.html#TauCeti.CerfTheorem) stated and derived from the Smale conjecture, and a proof that `Diff(Sⁿ)` is not path-connected.
- **Layer 1** has local collars, tubular neighbourhoods, the disc theorem, invariance of domain, and now the connected sum with prime manifolds. It lacks a collar theorem for general boundaries, gluing along boundary pieces, and handles.
- **Layer 2** is done except for PL embeddings of dimension two and up: PL curves are locally flat against the PL groupoid.
- **Layer 11** lacks only Whitehead's converse. The subdivision machinery now includes edgewise and common subdivisions.
- **Layer 9** lacks the existence of a Heegaard splitting for every closed 3-manifold. **Layer 10** lacks Thom classes, and so Euler classes, for nontrivial bundles.
- **Layers 4, 5, 6 and 7** are partial:
  - Layer 4 lacks Reidemeister's theorem and the converse of Markov's theorem.
  - Layer 5 has framed exteriors but no Dehn filling.
  - Layer 6 has slice genera, homology cobordism and minimal genus, but no concordance group.
  - In Layer 7, hyperbolic volume is metric-independent only under an assumed Mostow rigidity, and there is no Weeks manifold.

  The latest window's facts did not reach the modules for Layers 4, 5, 7 and 9, so those assessments are carried forward.

## The frontier

- **Gluing along the boundary**: the connected sum avoided it by gluing punctured balls. Handles, Dehn filling, Heegaard regluing and cobordism composition still wait on it, and so does a collar theorem for general boundaries.
- **Thom classes of oriented plane bundles**: the top cohomology of a product Thom pair is computed, and a Mayer–Vietoris sequence for pairs exists in cohomology. What remains is patching local classes over a nontrivial bundle. Until then, every foliation Euler-class statement could hold vacuously.
- **Every closed 3-manifold has a Heegaard splitting**: this would make the Heegaard genus unconditional. It needs a triangulation or Morse-function argument, together with gluing.
- **Whitehead's converse**: every PL manifold should admit a combinatorial triangulation, which would complete the reconciliation of Layer 11 with the PL groupoid.
- **Mostow invariance of hyperbolic volume**: volume is still metric-independent only by assumption. Simplicial volume and straightening of singular simplices now exist, and they are the ingredients of the Gromov–Thurston proportionality route, but proportionality itself is not proved.
