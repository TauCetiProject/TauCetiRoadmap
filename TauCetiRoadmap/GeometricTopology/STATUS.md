<!--tauceti-status:v1 {"roadmap":"GeometricTopology","to_sha":"6b391d7924044abbf36eec52a61dece9f9999e16","ts":"2026-11-05T21:11:17Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 1","remaining":"the global collar of a general boundary, gluing along boundary pieces, handle attachment","state":"partial"},{"id":"Layer 2","remaining":"local flatness of general PL embeddings against the PL groupoid","state":"partial"},{"id":"Layer 3","state":"done"},{"id":"Layer 4","remaining":"Reidemeister's theorem, the converse of Markov's theorem, polygonal knots to diagrams","state":"partial"},{"id":"Layer 5","remaining":"well-definedness of Dehn filling still assumes the gluing is isotopic to a linear torus map","state":"done"},{"id":"Layer 6","remaining":"the concordance group, the cobordism category, the Tristram-Levine signature of actual knots, the tau import","state":"partial"},{"id":"Layer 7","remaining":"a proof of Mostow invariance of hyperbolic volume","state":"partial"},{"id":"Layer 8","state":"done"},{"id":"Layer 9","remaining":"existence of a Heegaard splitting for every closed 3-manifold","state":"partial"},{"id":"Layer 10","state":"done"},{"id":"Layer 11","remaining":"Whitehead's converse: every PL manifold admits a combinatorial triangulation","state":"partial"}],"readme_sha":"4c1e7d510ffab6bcc71aed0a84871482f0a69a32136169a7f2f8bea571471d2f","roadmap":"GeometricTopology","to_sha":"6b391d7924044abbf36eec52a61dece9f9999e16"}-->
# Status: GeometricTopology

This file documents the status of the GeometricTopology roadmap up until `6b391d7` (2026-11-05T21:11:17Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Layers 3, 5, 8 and 10 are done: the topological group `Diff(M)`, Dehn surgery, the Thurston geometries, and foliation Euler classes. Every other layer is partial. The concordance group, gluing along boundary pieces, handles, and the existence of Heegaard splittings have not begun.

### Named results

- **The connected sum is well defined**: for connected, oriented, σ-compact smooth manifolds, the connected sum along balls that induce opposite orientations does not depend on the balls, up to diffeomorphism ([`nonempty_diffeomorph_of_isOrientationReversingAt`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/ConnectedSum/Independence.html#TauCeti.ConnectedSum.nonempty_diffeomorph_of_isOrientationReversingAt)). The sphere is a unit for it ([`M # Sⁿ ≅ M`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/ConnectedSum/Oriented.html#TauCeti.OrientedConnectedSum.nonempty_diffeomorph_sphere)).
- **Isotopy extension**: for a compact source, smooth isotopy of embeddings extends to an ambient diffeotopy, so isotopy and ambient isotopy agree ([`smoothAmbientIsotopic_iff_smoothIsotopic`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/SmoothIsotopy/Extension.html#TauCeti.smoothAmbientIsotopic_iff_smoothIsotopic)).
- **`Diff(M)` is a topological group**: for a compact manifold, composition and inversion are continuous in the weak Whitney topology ([`Diffeomorph.isTopologicalGroup`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Diffeomorphism/Inversion.html#Diffeomorph.isTopologicalGroup)). Orthogonal maps of `Sⁿ` are [isotopic exactly when their determinants agree](https://taucetiproject.org/docs/TauCeti/Geometry/Diffeomorphism/Sphere/Isotopy.html#TauCeti.joined_orthogonalToDiffSphere_iff).
- **Markov invariance of the HOMFLY polynomial**: the HOMFLY polynomial of a braid closure satisfies the skein relation and is unchanged by Markov moves ([`MarkovEquiv.homfly_eq`](https://taucetiproject.org/docs/TauCeti/KnotTheory/Homfly/Existence.html#TauCeti.MarkovEquiv.homfly_eq)).
- **Combinatorial manifolds are PL manifolds**: the polyhedron of a combinatorial manifold has a half-space atlas whose transition maps are PL ([`exists_chartedSpace_hasGroupoid_PLGroupoid`](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/SimplicialComplex/CombinatorialManifold/PL.html#PreAbstractSimplicialComplex.IsCombinatorialManifold.exists_chartedSpace_hasGroupoid_PLGroupoid)).

### Notable definitions and infrastructure

- **Dehn fillings**: a knot or link exterior has a filling along every slope, built as a pushout. `∞`-, `0`- and `p/q`-surgery on the unknot give `S³`, `S¹ × S²` and lens spaces. General surgery on a framed sphere specialises to integral Dehn surgery. These carry the statements of Property P, Property R, cosmetic surgery and Akbulut–Kirby. One input to well-definedness is not formalized: that every torus homeomorphism is isotopic to a linear one.
- **The Weeks manifold and hyperbolic volume**: the Weeks manifold is defined as the `(5, 5/2)` surgery on the Whitehead link, which makes the [Gabai–Meyerhoff–Milley theorem](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Riemannian/Hyperbolic/Weeks.html#TauCeti.GabaiMeyerhoffMilleyTheorem) stateable against the volume of a [hyperbolic metric](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Riemannian/Hyperbolic/UpperHalfSpace/Metric.html#TauCeti.UpperHalfSpace.hyperbolicMetric).
- **Thom classes, hence [foliation Euler classes](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Foliation/EulerClass.html#TauCeti.Foliation.eulerClass)**: every oriented vector bundle has a Thom class. So a transversely orientable codimension-one foliation of an orientable manifold has an Euler class, and Thurston's inequality is no longer at risk of holding vacuously.

### Roadmap coverage

- **Done: Layers 3, 5, 8 and 10.**
- **Layer 1** has:
  - the connected sum with its independence theorem;
  - local collars, Brown's collaring theorem for compact domains, and tubular neighbourhoods;
  - gluing along open subsets.

  It lacks the global smooth collar of a general boundary, gluing along boundary pieces, and handles. Dehn filling and sphere surgery use topological pushouts instead.
- **Layer 2** is done except for local flatness of general PL embeddings. PL curves are covered.
- **Layer 4** has HOMFLY, Jones and Alexander invariants of diagrams and braids. It lacks Reidemeister's theorem, the converse of Markov's theorem, and the passage from polygonal knots to diagrams.
- **Layer 6** has the concordance relations and the slice genera, but no concordance group.
- **Layer 7** has the Weeks manifold and the Gabai–Meyerhoff–Milley statement. Volume is metric-independent only under an assumed Mostow rigidity.
- **Layer 9** has:
  - rank at most Heegaard genus;
  - genus at most one for every filling of the unknot's exterior;
  - genus exactly one for `S¹ × S²`.

  Existence of a splitting for every closed 3-manifold is missing.
- **Layer 11** has the realization API that the revised README asks for: maps, restrictions, compact subsets in finite subcomplexes, glued homotopies, and the CW structure. Only Whitehead's converse is missing.

## The frontier

- **Gluing along the boundary**: smooth gluing would give handles, handlebodies and Heegaard regluing. It needs a global collar theorem for general boundaries; only compact domains are covered so far, and only topologically.
- **Torus homeomorphisms are isotopic to linear ones**: this one classical fact would make Dehn filling depend only on the slope, without the current hypothesis on the gluing.
- **Every closed 3-manifold has a Heegaard splitting**: this would make the Heegaard genus unconditional. It needs a triangulation or a Morse-function argument.
- **The concordance group**: connected sum of knots and the quotient by concordance, smooth and topological. The `τ` import and the Tristram–Levine signature of actual knots wait on it.
- **Whitehead's theorems**: one direction is that every PL manifold has a combinatorial triangulation. The other is that every smooth manifold is triangulable, and there secant approximation on edgewise subdivisions and embedded simplices at interior points are in place, but the existence theorem is not.
