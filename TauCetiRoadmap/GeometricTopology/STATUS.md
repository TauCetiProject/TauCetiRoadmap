<!--tauceti-status:v1 {"roadmap":"GeometricTopology","to_sha":"c9dbc67d6e3f1254d3da41c391cd1af512ea3b7f","ts":"2026-11-07T17:18:46+00:00"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 1","remaining":"existence of global collars, gluing along boundary pieces, and handle attachment","state":"partial"},{"id":"Layer 2","remaining":"local flatness of PL embeddings of dimension above one, against the PL groupoid","state":"partial"},{"id":"Layer 3","state":"done"},{"id":"Layer 4","remaining":"Reidemeister's theorem, the converse of Markov's theorem, polygonal knots to diagrams","state":"partial"},{"id":"Layer 5","remaining":"Dehn filling along a slope and the unknot surgery identities","state":"partial"},{"id":"Layer 6","remaining":"the concordance group, the cobordism category, the Tristram-Levine signature of actual knots, the tau import","state":"partial"},{"id":"Layer 7","remaining":"a proof of Mostow invariance of hyperbolic volume, and the Weeks manifold with its minimal-volume statement","state":"partial"},{"id":"Layer 8","state":"done"},{"id":"Layer 9","remaining":"existence of a Heegaard splitting for every closed 3-manifold","state":"partial"},{"id":"Layer 10","remaining":"existence of Thom classes, hence Euler classes, for nontrivial oriented plane bundles","state":"partial"},{"id":"Layer 11","remaining":"Whitehead's converse: every PL manifold admits a combinatorial triangulation","state":"partial"}],"readme_sha":"4c1e7d510ffab6bcc71aed0a84871482f0a69a32136169a7f2f8bea571471d2f","roadmap":"GeometricTopology","to_sha":"c9dbc67d6e3f1254d3da41c391cd1af512ea3b7f"}-->
# Status: GeometricTopology

This file documents the status of the GeometricTopology roadmap up until `c9dbc67` (2026-11-07T17:18:46+00:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Layers 3 and 8 are done. `Diff(M)` is a topological group, and the eight Thurston geometries come with their isometry groups, alongside the geometrization and JSJ statements. Every other layer is partial. Layer 1 now has a well-defined connected sum, but gluing along a boundary, Dehn filling, the concordance group and the existence of Heegaard splittings have not begun.

### Named results

- **Well-definedness of the connected sum**: for connected Hausdorff oriented manifolds without boundary, the oriented connected sum does not depend on the coordinate balls chosen ([`OrientedConnectedSum.nonempty_diffeomorph_connectedSum`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/ConnectedSum/Oriented.html#TauCeti.OrientedConnectedSum.nonempty_diffeomorph_connectedSum)).
- **Combinatorial manifolds are PL manifolds**: the polyhedron of a positive-dimensional combinatorial manifold has a half-space atlas with PL transition maps ([`exists_chartedSpace_hasGroupoid_PLGroupoid`](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/SimplicialComplex/CombinatorialManifold/PL.html#PreAbstractSimplicialComplex.IsCombinatorialManifold.exists_chartedSpace_hasGroupoid_PLGroupoid)).
- **Markov invariance of the HOMFLY polynomial**: the HOMFLY polynomial of a braid closure satisfies the skein relation and is unchanged by Markov moves ([`MarkovEquiv.homfly_eq`](https://taucetiproject.org/docs/TauCeti/KnotTheory/Homfly/Existence.html#TauCeti.MarkovEquiv.homfly_eq)).
- **The Jordan–Brouwer separation theorem**: the complement of an embedded `n`-sphere in `Sⁿ⁺¹` has exactly two path components ([`natCard_zerothHomotopy_sphere_compl_range_eq_two`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicTopology/Singular/JordanBrouwer.html#TauCeti.natCard_zerothHomotopy_sphere_compl_range_eq_two)).
- **`Diff(M)` is a topological group**: for a compact manifold, composition and inversion are continuous in the weak Whitney topology ([`Diffeomorph.isTopologicalGroup`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Diffeomorphism/Inversion.html#Diffeomorph.isTopologicalGroup)).

### Notable definitions and infrastructure

- **Framed knot exteriors** ([`knotExterior`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LowDimTopology/SolidTorusNeighborhood/Exterior.html#TauCeti.knotExterior)): the boundary torus carries a framing number and a null-homologous preferred longitude. These fix the meridian and longitude conventions that Dehn filling will use.
- **The Euler class of a foliation** ([`Foliation.eulerClass`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Foliation/EulerClass.html#TauCeti.Foliation.eulerClass)): it is read off a Thom class of the tangent field. This makes Thurston's Euler class inequality and Yazdi's refutation of the Euler class one conjecture stateable.
- **Simplicial volume** ([`simplicialVolume`](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/Singular/LocalHomology/SimplicialVolume.html#TauCeti.HomologicalOrientation.simplicialVolume)): Gromov's norm of the real fundamental class. It is a homotopy invariant and satisfies the degree inequality, which gives a topological volume to compare with hyperbolic volume. That comparison is not formalised.

### Roadmap coverage

- **Layers 3 and 8** are done. Layer 3 also states [Cerf's theorem](https://taucetiproject.org/docs/TauCeti/Geometry/Diffeomorphism/Cerf.html#TauCeti.CerfTheorem), derives it from the Smale conjecture, and proves that `Diff(Sⁿ)` is not path-connected.
- **Layer 1** has:
  - local collars, the tubular neighbourhood theorem (in a Euclidean ambient space), a disc theorem and invariance of domain;
  - the connected sum, now with well-definedness, commutativity and [`X # Sⁿ ≃ X`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/ConnectedSum/Oriented.html#TauCeti.OrientedConnectedSum.nonempty_diffeomorph_sphere).

  Global collars of general boundaries, gluing along boundary pieces, and handle attachment are missing.
- **Layer 2** is done except for local flatness of PL embeddings. Only [PL curves](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/LocallyFlat/PL.html#TauCeti.IsLocallyFlat.of_isPLMap) are handled so far. The plane Schoenflies theorem has also landed.
- **Layers 9, 10 and 11** each lack one theorem:
  - Layer 9 lacks the existence of a Heegaard splitting for every closed 3-manifold.
  - Layer 10 lacks Thom classes for nontrivial plane bundles.
  - Layer 11 lacks Whitehead's converse.
- **Layers 4, 5, 6 and 7** are partial:
  - Layer 4 lacks Reidemeister's theorem, the converse of Markov's theorem, and the passage from polygonal knots to diagrams.
  - Layer 5 lacks Dehn filling.
  - Layer 6 has the concordance relations, slice genera and homology cobordisms, but no concordance group.
  - Layer 7 has hyperbolic volume only under an assumed Mostow rigidity, and no Weeks manifold.

## The frontier

- **Gluing along the boundary**: the connected sum avoided it by gluing punctured open balls, so there is still no gluing along boundary pieces, and no existence theorem for global collars. Dehn filling, handles and Heegaard regluing all wait on it, and so do the unknot surgeries, whose input (the [unknot's exterior is a solid torus](https://taucetiproject.org/docs/TauCeti/LowDimTopology/SolidTorusNeighborhood/Unknot.html#TauCeti.unknotExteriorHomeomorph)) is ready.
- **Thom classes of oriented plane bundles**: the top cohomology of the Thom pair is computed only for product bundles. The relative Mayer–Vietoris sequence in cohomology is now available to patch local classes. Until this lands, every foliation Euler-class statement could hold vacuously.
- **The concordance group**: the relations are in place, but the group needs a connected sum of knots as its operation. The new manifold connected sum does not provide that directly.
- **Every closed 3-manifold has a Heegaard splitting**: this would make the Heegaard genus unconditional. It needs a triangulation or Morse-function argument, together with gluing.
- **Whitehead's converse**: every PL manifold should admit a combinatorial triangulation. Common subdivisions of geometric complexes and finite polyhedral chart covers of compact sets have landed as inputs.
