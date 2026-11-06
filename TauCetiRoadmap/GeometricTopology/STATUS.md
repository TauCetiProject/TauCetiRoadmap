<!--tauceti-status:v1 {"roadmap":"GeometricTopology","to_sha":"3a0189695d62134a412200ef4237d0bbb2e95d75","ts":"2026-11-07T02:52:26+11:00"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 1","remaining":"a smooth collar of the boundary, gluing along boundary pieces, and handle attachment","state":"partial"},{"id":"Layer 2","remaining":"local flatness of PL embeddings of dimension above one against the PL groupoid","state":"partial"},{"id":"Layer 3","state":"done"},{"id":"Layer 4","remaining":"Reidemeister's theorem, the converse of Markov's theorem, polygonal knots to diagrams","state":"partial"},{"id":"Layer 5","state":"done"},{"id":"Layer 6","remaining":"the concordance group, the general cobordism category, the Tristram-Levine signature of actual knots, the tau import","state":"partial"},{"id":"Layer 7","remaining":"a proof of Mostow invariance of hyperbolic volume","state":"partial"},{"id":"Layer 8","state":"done"},{"id":"Layer 9","remaining":"existence of a Heegaard splitting for every closed 3-manifold","state":"partial"},{"id":"Layer 10","remaining":"existence of Thom classes, hence Euler classes, for nontrivial oriented plane bundles","state":"partial"},{"id":"Layer 11","remaining":"Whitehead's converse: every PL manifold admits a combinatorial triangulation","state":"partial"}],"readme_sha":"4c1e7d510ffab6bcc71aed0a84871482f0a69a32136169a7f2f8bea571471d2f","roadmap":"GeometricTopology","to_sha":"3a0189695d62134a412200ef4237d0bbb2e95d75"}-->
# Status: GeometricTopology

This file documents the status of the GeometricTopology roadmap up until `3a01896` (2026-11-07T02:52:26+11:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Layers 3, 5 and 8 are done. `Diff(M)` is a topological group, Dehn surgery exists with its slope conventions pinned by the unknot surgeries, and the eight Thurston geometries are in place with the geometrization and JSJ statements. Every other layer is partial. Gluing along a piece of the boundary, the concordance group, a proof of Mostow rigidity and the existence of Heegaard splittings are still missing.

### Named results

- **The connected sum is well defined**: for connected, oriented, σ-compact manifolds without boundary, the connected sum does not depend on the balls it is formed along ([`nonempty_diffeomorph_of_isOrientationReversingAt`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/ConnectedSum/Independence.html#TauCeti.ConnectedSum.nonempty_diffeomorph_of_isOrientationReversingAt)). The sum is also commutative, and [`X # Sⁿ ≅ X`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/ConnectedSum/Oriented.html#TauCeti.OrientedConnectedSum.nonempty_diffeomorph_sphere).
- **Combinatorial manifolds are PL manifolds**: the polyhedron of a positive-dimensional combinatorial manifold has a half-space atlas with PL transition maps ([`exists_chartedSpace_hasGroupoid_PLGroupoid`](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/SimplicialComplex/CombinatorialManifold/PL.html#PreAbstractSimplicialComplex.IsCombinatorialManifold.exists_chartedSpace_hasGroupoid_PLGroupoid)).
- **Markov invariance of the HOMFLY polynomial**: the HOMFLY polynomial of a braid closure satisfies the skein relation and is unchanged by Markov moves ([`MarkovEquiv.homfly_eq`](https://taucetiproject.org/docs/TauCeti/KnotTheory/Homfly/Existence.html#TauCeti.MarkovEquiv.homfly_eq)).
- **`Diff(M)` is a topological group**: for a compact manifold, composition and inversion are continuous in the weak Whitney topology ([`Diffeomorph.isTopologicalGroup`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Diffeomorphism/Inversion.html#Diffeomorph.isTopologicalGroup)).
- **The Schoenflies theorem**: every plane Jordan curve is the image of the unit circle under a homeomorphism of `ℂ` that carries the disc onto its inside ([`exists_homeomorph_image_sphere`](https://taucetiproject.org/docs/TauCeti/Analysis/Complex/Conformal/Jordan/Schoenflies.html#TauCeti.IsJordanCurve.exists_homeomorph_image_sphere)). With it, the cone over a Jordan curve in `S²` is locally flat.

### Notable definitions and infrastructure

- **Dehn filling**: a filling of a knot or link exterior along any family of slopes is constructed as a pushout of solid tori. The filled space is a topological space, and its independence from the gluing is proved only for gluings given by integral matrices. Property P, Property R, Akbulut–Kirby and cosmetic surgery are stated against it.
- **The Weeks manifold**: it is defined as the `(5, 5/2)` surgery on the Whitehead link. This lets the [theorem of Gabai, Meyerhoff and Milley](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Riemannian/Hyperbolic/Weeks.html#TauCeti.GabaiMeyerhoffMilleyTheorem) be stated against explicit hyperbolic metrics, without relying on Mostow rigidity.
- **Simplicial volume** ([`simplicialVolume`](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/Singular/LocalHomology/SimplicialVolume.html#TauCeti.HomologicalOrientation.simplicialVolume)): Gromov's norm of the fundamental class. It is homotopy invariant and bounded by mapping degree. Together with straightening of simplices in the hyperboloid model, it is the start of the classical proof of Mostow rigidity.

### Roadmap coverage

- **Layers 3, 5 and 8** are done. Layer 3 now also states Cerf's theorem and derives it from the Smale conjecture.
- **Layer 1** has collars, tubular neighbourhoods, the disc theorem and the connected sum with its independence theorem. Gluing along a piece of the boundary and handle attachment are missing.
- **Layer 2** is done except that local flatness of PL embeddings is proved only for curves.
- **Layer 4** has HOMFLY, Jones and Alexander invariants of diagrams and braids. Reidemeister's theorem, the converse of Markov's theorem, and the passage from polygonal knots to diagrams are missing.
- **Layer 6** has concordance, slice genera, and composition of knot cobordisms. It also has the connected sum of knots, associative up to concordance, but no concordance group.
- **Layer 7** has hyperbolic metrics, their volumes and the Weeks manifold. Volume is metric-independent only under an assumed Mostow rigidity.
- **Layer 9** has [rank at most Heegaard genus](https://taucetiproject.org/docs/TauCeti/LowDimTopology/Heegaard/FundamentalGroup.html#TauCeti.rank_fundamentalGroup_le_heegaardGenus) for manifolds with a splitting. It does not yet prove that every closed 3-manifold has one.
- **Layer 10** has all of its statements, but Thom classes exist only for trivial bundles.
- **Layer 11** lacks only Whitehead's converse.

## The frontier

- **Gluing along the boundary**: Brown's collaring theorem holds for compact domains, but there is no smooth collar of `∂M` and no construction that glues manifolds along boundary pieces. Handles, Heegaard regluing and composition in the cobordism category all wait on it.
- **The concordance group**: the connected sum of concordances is built only for concordances already in standard position. The missing step is an isotopy-extension argument that moves any concordance into that position, which would make the sum well defined on concordance classes.
- **Mostow rigidity**: simplicial volume and straightening are in place. Still needed are the bound on the volume of straight hyperbolic simplices and the proportionality of simplicial volume to hyperbolic volume.
- **Thom classes of oriented plane bundles**: without them, every foliation Euler-class statement could hold vacuously.
- **Every closed 3-manifold has a Heegaard splitting**: this would make the Heegaard genus unconditional. It needs a triangulation or a Morse-function argument, together with gluing.
