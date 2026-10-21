<!--tauceti-status:v1 {"roadmap":"GeometricTopology","to_sha":"a5cde7b5e3a7b1f8d179999ab1c210520bc583e1","ts":"2026-10-19T17:10:32Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 1","remaining":"collars of general manifold boundaries, gluing along boundary pieces, handles and connected sum","state":"partial"},{"id":"Layer 2","remaining":"local flatness of general PL embeddings against the PL groupoid","state":"partial"},{"id":"Layer 3","state":"done"},{"id":"Layer 4","remaining":"Reidemeister's theorem, the converse of Markov's theorem, polygonal knots to diagrams, existence of HOMFLY","state":"partial"},{"id":"Layer 5","remaining":"Dehn filling along a slope and the unknot surgery identities","state":"partial"},{"id":"Layer 6","remaining":"the concordance group, the cobordism category, the Tristram-Levine signature of actual knots, the tau import","state":"partial"},{"id":"Layer 7","remaining":"a proof of Mostow invariance of hyperbolic volume, and the Weeks manifold with its minimal-volume statement","state":"partial"},{"id":"Layer 8","state":"done"},{"id":"Layer 9","remaining":"existence of a Heegaard splitting for every closed 3-manifold, and rank of the fundamental group at most Heegaard genus","state":"partial"},{"id":"Layer 10","remaining":"the Euler class of an oriented plane bundle in H^2, the pairing with surfaces, and the Euler-class bound","state":"partial"},{"id":"Layer 11","remaining":"a PL atlas on combinatorial manifolds for the PLGroupoid, Whitehead's converse, cellular chains of a realization as simplicial chains","state":"partial"}],"readme_sha":"09fa231ae4a2502600315abdae4983a939d1d3ad6ba6fd18c116acf5915222fb","roadmap":"GeometricTopology","to_sha":"a5cde7b5e3a7b1f8d179999ab1c210520bc583e1"}-->
# Status: GeometricTopology

This file documents the status of the GeometricTopology roadmap up until `a5cde7b` (2026-10-19T17:10:32Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Layers 3 and 8 are done. `Diff(M)` is a topological group, and the eight Thurston geometries come with their full isometry groups, alongside the geometrization and JSJ statements. Every other layer is partial. Gluing, Dehn filling, the concordance group and the Euler class have not begun.

### Named results

- **The Jordan–Brouwer separation theorem**: the complement of an embedded `n`-sphere in `Sⁿ⁺¹` has exactly two path components. It is proved with singular homology ([`natCard_zerothHomotopy_sphere_compl_range_eq_two`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicTopology/Singular/JordanBrouwer.html#TauCeti.natCard_zerothHomotopy_sphere_compl_range_eq_two)).
- **Reidemeister invariance of the Jones polynomial**: all three Reidemeister moves leave the Jones polynomial of an oriented PD code unchanged, and likewise the Alexander module.
- **`Diff(M)` is a topological group**: for a compact manifold, composition and inversion are continuous in the weak Whitney topology ([`Diffeomorph.isTopologicalGroup`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Diffeomorphism/Inversion.html#Diffeomorph.isTopologicalGroup)).
- **Combinatorial manifolds are manifolds**: the polyhedron of a positive-dimensional combinatorial manifold is a topological manifold with boundary, charted by its open vertex stars ([`IsCombinatorialManifold.realization_isManifold`](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/SimplicialComplex/CombinatorialManifold/ChartedSpace.html#PreAbstractSimplicialComplex.IsCombinatorialManifold.realization_isManifold)).
- **The isometry groups of the model geometries**: for example, the isometry group of Nil is `Nil ⋊ O(2)` ([`Nil.semidirectProductIsomMulEquiv`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Riemannian/Nil/Stabilizer.html#TauCeti.Nil.semidirectProductIsomMulEquiv)) and that of Sol is `Sol ⋊ D₄`. The sphere has the orthogonal group, Euclidean space the rigid motions, and the products `S² × ℝ` and `ℍ² × ℝ` have products of the factor groups. The upper half-space has similarities and inversions. `SL₂ℝ~` is described as an extension of the hyperbolic plane's group by the fibre translations.

### Notable definitions and infrastructure

- **A genuine hyperbolic metric** ([`UpperHalfSpace.hyperbolicMetric`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Riemannian/Hyperbolic/UpperHalfSpace/Metric.html#TauCeti.UpperHalfSpace.hyperbolicMetric)): the upper half-space is complete with sectional curvature `−1`, a model for the bundled notion that hyperbolic volume uses.
- **Knot exteriors as manifolds**: one side of a bicollar is a [manifold with boundary](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Boundary/BicollarSide.html#TauCeti.IsBicollar.sideChartedSpace). Applied to a shrunken solid-torus neighbourhood, this makes the [knot exterior](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LowDimTopology/SolidTorusNeighborhood/Exterior.html#TauCeti.knotExterior) a topological 3-manifold whose boundary is the torus.
- **Heegaard splittings and Heegaard genus**: a splitting is two standard handlebodies covering a space and meeting along their common frontier. Genus is defined only when a splitting is known to exist. `S³` has genus zero, and both Waldhausen's rank-versus-genus conjecture and Li's counterexamples are stated.

### Roadmap coverage

- **Layers 3 and 8** are done.
- **Layer 2** is done except for local flatness of general PL embeddings. Graphs of PL maps and polygonal knots are covered.
- **Layer 4** has the Jones polynomial and the Alexander module invariant under Reidemeister moves, and Markov-equivalent braids have Reidemeister-equivalent closures. HOMFLY is only known to be unique if it exists. Reidemeister's theorem, the converse of Markov's theorem, and the passage from polygonal knots to diagrams are all missing.
- **Layer 1** has local and abstract collars and Euclidean tubular neighbourhoods. It also has the PL groupoid with products and a coordinate-formula criterion for PL atlases. Collars of general manifolds, gluing, handles and connected sum are missing.
- **Layers 5, 6, 7, 9 and 10** are partial:
  - Layer 5 has slopes, lens spaces and the knot exterior as a manifold, but no Dehn filling.
  - Layer 6 has smooth and topological concordance relations, mutation and Seifert-matrix invariants, but no concordance group.
  - In Layer 7, hyperbolic volume is metric-independent only under an assumed Mostow rigidity, and there is no Weeks manifold.
  - Layer 9 lacks the existence of splittings and the inequality between rank and genus.
  - Layer 10 has foliations, Thom classes of trivial bundles and local cohomology, but no Euler class.
- **Layer 11** has collapse, CW structures on realizations, and the topological half of the reconciliation. The PL half and Whitehead's converse are missing.

## The frontier

- **Combinatorial manifolds are PL manifolds**: the star charts exist, and the simplex and its boundary already have PL atlases. What remains is to give every star chart PL coordinate formulas, so that the [coordinate-formula criterion](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/PLGroupoid/Transition.html#TauCeti.hasGroupoid_PLGroupoid_of_coordinateFormulas) applies.
- **Gluing along the boundary**: global collar data is defined, but there is no gluing construction. Dehn filling, handles, connected sum and Heegaard regluing all wait on it.
- **Dehn filling**: the exterior is a manifold with torus boundary, and the first homology of a parametrized torus is [`ℤ²`, with the `(p, q)` curve giving `(p, q)`](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/Singular/Torus/FirstHomology.html#TauCeti.circleProdFirstHomologyEquiv). The filling itself needs gluing.
- **Rank at most Heegaard genus**: a handlebody has free fundamental group of rank `g`. What remains is that `π₁(M)` is a quotient of it, and that every closed 3-manifold has a splitting.
- **The Euler class**: Thom classes exist for trivial bundles. The Thom class of an oriented plane bundle, and its Euler class in `H²`, are the next step.
