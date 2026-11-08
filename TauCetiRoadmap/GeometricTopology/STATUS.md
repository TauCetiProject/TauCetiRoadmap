<!--tauceti-status:v1 {"roadmap":"GeometricTopology","to_sha":"a4fcb57d9a93070c2fce602420ecf8c991d6cdd7","ts":"2026-11-08T16:58:25+11:00"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 1","remaining":"general smooth collars, gluing along boundary pieces, handle attachment and tubular neighbourhoods beyond Euclidean ambient spaces","state":"partial"},{"id":"Layer 2","remaining":"local flatness of higher-dimensional PL embeddings against the PL groupoid","state":"partial"},{"id":"Layer 3","state":"done"},{"id":"Layer 4","remaining":"Reidemeister's theorem, the converse of Markov's theorem, polygonal knots to diagrams","state":"partial"},{"id":"Layer 5","remaining":"Dehn filling along a slope and the unknot surgery identities","state":"partial"},{"id":"Layer 6","remaining":"the concordance group, cobordism category, Tristram-Levine signature of geometric knots and tau import","state":"partial"},{"id":"Layer 7","remaining":"unconditional Mostow invariance of hyperbolic volume and the Weeks manifold with its minimal-volume statement","state":"partial"},{"id":"Layer 8","state":"done"},{"id":"Layer 9","remaining":"existence of a Heegaard splitting for every closed orientable 3-manifold","state":"partial"},{"id":"Layer 10","remaining":"existence of Thom classes for nontrivial oriented plane bundles","state":"partial"},{"id":"Layer 11","remaining":"Whitehead's converse: every PL manifold admits a combinatorial triangulation","state":"partial"}],"readme_sha":"4c1e7d510ffab6bcc71aed0a84871482f0a69a32136169a7f2f8bea571471d2f","roadmap":"GeometricTopology","to_sha":"a4fcb57d9a93070c2fce602420ecf8c991d6cdd7"}-->
# Status: GeometricTopology

This file documents the status of the GeometricTopology roadmap up until `a4fcb57` (2026-11-08T16:58:25+11:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Layers 3 and 8 are complete at the roadmap's intended level: compact diffeomorphism groups have their topology, and the Thurston geometries support the decomposition statements. Every other layer remains partial; smooth connected sum is now available, while general boundary gluing, Dehn filling and the concordance group are not established here.

### Named results

- **Independence of connected-sum balls** — for connected oriented Hausdorff boundaryless smooth manifolds, changing the coordinate balls compatibly with orientation gives diffeomorphic connected sums ([ConnectedSum.nonempty_diffeomorph_of_isOrientationPreservingAt](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/ConnectedSum/Independence.html#TauCeti.ConnectedSum.nonempty_diffeomorph_of_isOrientationPreservingAt)).
- **Connected sum with a sphere** — M # Sⁿ is diffeomorphic to M for connected Hausdorff smooth n-manifolds, n ≥ 1, with arbitrary orientations on the summands ([OrientedConnectedSum.nonempty_diffeomorph_sphere](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/ConnectedSum/Oriented.html#TauCeti.OrientedConnectedSum.nonempty_diffeomorph_sphere)).
- **The degree inequality for simplicial volume** — a map carrying the fundamental class of M to d times that of N satisfies |d| ‖N‖ ≤ ‖M‖ ([HomologicalOrientation.abs_mul_simplicialVolume_le](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/Singular/LocalHomology/SimplicialVolume.html#TauCeti.HomologicalOrientation.abs_mul_simplicialVolume_le)).
- **Combinatorial manifolds are PL manifolds** — a positive-dimensional combinatorial manifold's realization has a half-space atlas with PL transitions ([`exists_chartedSpace_hasGroupoid_PLGroupoid`](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/SimplicialComplex/CombinatorialManifold/PL.html#PreAbstractSimplicialComplex.IsCombinatorialManifold.exists_chartedSpace_hasGroupoid_PLGroupoid)).
- **Markov invariance of the HOMFLY polynomial** — the braid polynomial satisfies the skein relation and is unchanged by Markov moves; its geometric interpretation still needs the presentation correspondences ([`MarkovEquiv.homfly_eq`](https://taucetiproject.org/docs/TauCeti/KnotTheory/Homfly/Existence.html#TauCeti.MarkovEquiv.homfly_eq)).

### Notable definitions and infrastructure

- **Edgewise subdivision of realizations** preserves the underlying space for every nonzero subdivision parameter, including infinite complexes with the weak topology ([edgewiseSubdivisionRealizationHomeomorph](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/SimplicialComplex/Subdivision/Edgewise/Homeomorph.html#AbstractSimplicialComplex.edgewiseSubdivisionRealizationHomeomorph)).
- **Homology cobordisms** record compact cobordisms whose two ends induce homology isomorphisms, with cylinders providing examples; composition into a cobordism category remains ahead ([IsHomologyCobordism](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/HomologyCobordism.html#TauCeti.IsHomologyCobordism)).
- **Foliation Euler classes** pair the tangent plane field's Thom class against surface classes; existence for nontrivial oriented plane bundles remains unresolved ([`Foliation.eulerClass`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Foliation/EulerClass.html#TauCeti.Foliation.eulerClass)).

### Roadmap coverage

**Layers 3 and 8 are done**, including the model isometry groups and the JSJ and geometrization statements, without proofs of those decomposition theorems. **All other layers are partial.** Layer 1 has connected sum and Euclidean tubular neighbourhoods; general smooth collars, boundary-piece gluing and handles remain. Layer 2 now covers PL curves against the groupoid, but not general higher-dimensional PL embeddings. Layer 4 still lacks Reidemeister's theorem, the converse of Markov's theorem and polygon-to-diagram conversion. Layer 5 has framed exteriors and slopes, but no filling. Layer 6 has concordance relations and slice genera, but no concordance group or cobordism category. Layer 7 still lacks unconditional Mostow invariance and the Weeks manifold. Layer 9 needs existence of splittings for every closed 3-manifold; Layer 10 needs nontrivial-bundle Thom classes; Layer 11 needs Whitehead's converse. The declaration extract is truncated, so completion beyond these recorded results is not established.

## The frontier

- **Smooth boundary gluing** — prove general smooth collar existence and construct gluing along boundary pieces, including the corners needed for handle attachment.
- **Dehn filling** — use boundary gluing to attach a solid torus along a chosen slope and prove the unknot surgery identities.
- **Thom classes of oriented plane bundles** — extend existence beyond trivial bundles so foliation Euler-class statements apply to nontrivial tangent fields.
- **Heegaard splitting existence** — prove every closed orientable 3-manifold has a splitting, using a triangulation or Morse-function argument and the gluing infrastructure.
- **Whitehead's converse** — construct a combinatorial triangulation for every PL manifold, completing the comparison with chart-based PL structures.
