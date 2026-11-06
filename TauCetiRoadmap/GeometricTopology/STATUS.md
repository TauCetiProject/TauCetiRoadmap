<!--tauceti-status:v1 {"roadmap":"GeometricTopology","to_sha":"d96e9ceca01f4548b817649c5ae95e33c6fc3ae4","ts":"2026-10-25T09:09:58Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 1","remaining":"collars of general manifold boundaries, gluing along boundary pieces, handles and connected sum","state":"partial"},{"id":"Layer 2","remaining":"local flatness of general PL embeddings against the PL groupoid","state":"partial"},{"id":"Layer 3","state":"done"},{"id":"Layer 4","remaining":"Reidemeister's theorem, the converse of Markov's theorem, polygonal knots to diagrams","state":"partial"},{"id":"Layer 5","remaining":"Dehn filling along a slope and the unknot surgery identities","state":"partial"},{"id":"Layer 6","remaining":"the concordance group, the cobordism category, the Tristram-Levine signature of actual knots, the tau import","state":"partial"},{"id":"Layer 7","remaining":"a proof of Mostow invariance of hyperbolic volume, and the Weeks manifold with its minimal-volume statement","state":"partial"},{"id":"Layer 8","state":"done"},{"id":"Layer 9","remaining":"existence of a Heegaard splitting for every closed 3-manifold","state":"partial"},{"id":"Layer 10","remaining":"existence of Thom classes, hence Euler classes, for nontrivial oriented plane bundles","state":"partial"},{"id":"Layer 11","remaining":"Whitehead's converse: every PL manifold admits a combinatorial triangulation","state":"partial"}],"readme_sha":"09fa231ae4a2502600315abdae4983a939d1d3ad6ba6fd18c116acf5915222fb","roadmap":"GeometricTopology","to_sha":"d96e9ceca01f4548b817649c5ae95e33c6fc3ae4"}-->
# Status: GeometricTopology

This file documents the status of the GeometricTopology roadmap up until `d96e9ce` (2026-10-25T09:09:58Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Layers 3 and 8 are done. `Diff(M)` is a topological group, and the eight Thurston geometries come with their full isometry groups, alongside the geometrization and JSJ statements. Every other layer is partial. Gluing along a boundary, Dehn filling, the concordance group and the existence of Heegaard splittings have not begun.

### Named results

- **Combinatorial manifolds are PL manifolds**: the polyhedron of a positive-dimensional combinatorial manifold has a half-space atlas with PL transition maps, possibly with boundary ([`exists_chartedSpace_hasGroupoid_PLGroupoid`](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/SimplicialComplex/CombinatorialManifold/PL.html#PreAbstractSimplicialComplex.IsCombinatorialManifold.exists_chartedSpace_hasGroupoid_PLGroupoid)).
- **Markov invariance of the HOMFLY polynomial**: the HOMFLY polynomial of a braid closure, built by interpolating the `sl_N` Jimbo traces, satisfies the skein relation and is unchanged by Markov moves ([`MarkovEquiv.homfly_eq`](https://taucetiproject.org/docs/TauCeti/KnotTheory/Homfly/Existence.html#TauCeti.MarkovEquiv.homfly_eq)). The Jones polynomial and the Alexander module are likewise invariant under all three Reidemeister moves on diagrams.
- **The Jordan–Brouwer separation theorem**: the complement of an embedded `n`-sphere in `Sⁿ⁺¹` has exactly two path components, proved with singular homology ([`natCard_zerothHomotopy_sphere_compl_range_eq_two`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicTopology/Singular/JordanBrouwer.html#TauCeti.natCard_zerothHomotopy_sphere_compl_range_eq_two)).
- **`Diff(M)` is a topological group**: for a compact manifold, composition and inversion are continuous in the weak Whitney topology ([`Diffeomorph.isTopologicalGroup`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Diffeomorphism/Inversion.html#Diffeomorph.isTopologicalGroup)).
- **The isometry groups of the model geometries**: for example, the isometry group of Nil is `Nil ⋊ O(2)` ([`Nil.semidirectProductIsomMulEquiv`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Riemannian/Nil/Stabilizer.html#TauCeti.Nil.semidirectProductIsomMulEquiv)). The other geometries are covered too, with `SL₂ℝ~` described only as an extension.

### Notable definitions and infrastructure

- **A genuine hyperbolic metric** ([`UpperHalfSpace.hyperbolicMetric`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Riemannian/Hyperbolic/UpperHalfSpace/Metric.html#TauCeti.UpperHalfSpace.hyperbolicMetric)): the upper half-space is complete with sectional curvature `−1`. It is a model for the bundled notion that hyperbolic volume uses.
- **Framed knot exteriors**: the [knot exterior](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LowDimTopology/SolidTorusNeighborhood/Exterior.html#TauCeti.knotExterior) is a 3-manifold whose boundary is a torus. That torus has a [framing number](https://taucetiproject.org/docs/TauCeti/LowDimTopology/DehnSurgery/SeifertFraming.html#TauCeti.IsSolidTorusNeighborhood.framingNumber) and a preferred longitude that is null-homologous in the complement. These are the meridian and longitude conventions that Dehn filling needs.
- **The Euler class of a foliation** ([`Foliation.eulerClass`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Foliation/EulerClass.html#TauCeti.Foliation.eulerClass)): the class is read off a Thom class of the tangent field and paired against fundamental classes of surfaces. This lets [Thurston's Euler class inequality](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Foliation/EulerClass.html#TauCeti.ThurstonEulerClassInequality) and Yazdi's refutation of the Euler class one conjecture be stated.

### Roadmap coverage

- **Layers 3 and 8** are done.
- **Layer 11** has the PL structure on combinatorial manifolds, CW structures on realizations, and cellular chains identified with simplicial chains, so that [simplicial homology is singular homology](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/SimplicialComplex/Realization/CWComplex/OrderedChainComplex.html#TauCeti.orderedSimplicialHomologyIsoSingularHomology). Only Whitehead's converse is missing.
- **Layer 9** has [rank at most Heegaard genus](https://taucetiproject.org/docs/TauCeti/LowDimTopology/Heegaard/FundamentalGroup.html#TauCeti.rank_fundamentalGroup_le_heegaardGenus) for manifolds that have a splitting, and lens spaces have genus one. What is missing is that every closed 3-manifold has a splitting.
- **Layer 10** has all of its statements. However, Thom classes, and with them Euler classes, are known to exist only for trivial bundles.
- **Layer 4** has HOMFLY, Jones and Alexander invariants of diagrams and braids, and the braid and diagram routes to Jones agree. Reidemeister's theorem, the converse of Markov's theorem, and the passage from polygonal knots to diagrams are missing.
- **Layer 2** is done except for local flatness of general PL embeddings.
- **Layers 1, 5, 6 and 7** are partial:
  - Layer 1 has local collars, tubular neighbourhoods, a disc theorem and invariance of domain, but no gluing, handles or connected sum.
  - Layer 5 has slopes, lens spaces and framed exteriors, but no Dehn filling.
  - Layer 6 has the concordance relations and the smooth and topological slice genus, but no concordance group.
  - In Layer 7, volume is metric-independent only under an assumed Mostow rigidity, and there is no Weeks manifold.

## The frontier

- **Gluing along the boundary**: global collar data is defined, but there is no gluing construction. Dehn filling, handles, connected sum and Heegaard regluing all wait on it.
- **Dehn filling and the unknot surgeries**: the [unknot's exterior is a solid torus](https://taucetiproject.org/docs/TauCeti/LowDimTopology/SolidTorusNeighborhood/Unknot.html#TauCeti.unknotExteriorHomeomorph) with meridian and longitude exchanged, which is the input for `0`- and `∞`-surgery. The filling itself needs gluing.
- **Thom classes of oriented plane bundles**: existence is known only for trivial bundles. Without it, every foliation Euler-class statement could hold vacuously.
- **Every closed 3-manifold has a Heegaard splitting**: this would make the Heegaard genus unconditional. It needs a triangulation or Morse-function argument, together with gluing.
- **Whitehead's converse**: every PL manifold should admit a combinatorial triangulation. This would close the reconciliation of Layer 11 with the PL groupoid.
