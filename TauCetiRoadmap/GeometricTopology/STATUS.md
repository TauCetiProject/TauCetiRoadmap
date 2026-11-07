<!--tauceti-status:v1 {"roadmap":"GeometricTopology","to_sha":"c9dbc67d6e3f1254d3da41c391cd1af512ea3b7f","ts":"2026-11-07T17:18:46Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 1","remaining":"existence of collars for general boundaries, gluing along boundary pieces, handle attachment","state":"partial"},{"id":"Layer 2","remaining":"local flatness of PL embeddings of dimension above one against the PL groupoid","state":"partial"},{"id":"Layer 3","state":"done"},{"id":"Layer 4","remaining":"Reidemeister's theorem, the converse of Markov's theorem, polygonal knots to diagrams","state":"partial"},{"id":"Layer 5","remaining":"Dehn filling along a slope and the unknot surgery identities","state":"partial"},{"id":"Layer 6","remaining":"the concordance group, the cobordism category, the Tristram-Levine signature of actual knots, the tau import","state":"partial"},{"id":"Layer 7","remaining":"a proof of Mostow invariance of hyperbolic volume, and the Weeks manifold with its minimal-volume statement","state":"partial"},{"id":"Layer 8","state":"done"},{"id":"Layer 9","remaining":"existence of a Heegaard splitting for every closed 3-manifold","state":"partial"},{"id":"Layer 10","remaining":"existence of Thom classes, hence Euler classes, for nontrivial oriented plane bundles","state":"partial"},{"id":"Layer 11","remaining":"Whitehead's converse: every PL manifold admits a combinatorial triangulation","state":"partial"}],"readme_sha":"4c1e7d510ffab6bcc71aed0a84871482f0a69a32136169a7f2f8bea571471d2f","roadmap":"GeometricTopology","to_sha":"c9dbc67d6e3f1254d3da41c391cd1af512ea3b7f"}-->
# Status: GeometricTopology

This file documents the status of the GeometricTopology roadmap up until `c9dbc67` (2026-11-07T17:18:46Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Layers 3 and 8 are done, and Layer 1 now has a well-defined smooth connected sum. Every other layer is partial. Gluing along a boundary, Dehn filling, the concordance group and the existence of Heegaard splittings have not begun.

### Named results

- **The connected sum is well defined**: for connected, Hausdorff, σ-compact oriented manifolds without boundary, any two choices of oppositely oriented balls give diffeomorphic connected sums ([`nonempty_diffeomorph_of_isOrientationReversingAt`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/ConnectedSum/Independence.html#TauCeti.ConnectedSum.nonempty_diffeomorph_of_isOrientationReversingAt)). The oriented sum is commutative and has the sphere as unit ([`OrientedConnectedSum.nonempty_diffeomorph_sphere`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/ConnectedSum/Oriented.html#TauCeti.OrientedConnectedSum.nonempty_diffeomorph_sphere)).
- **Combinatorial manifolds are PL manifolds**: the polyhedron of a positive-dimensional combinatorial manifold has a half-space atlas with PL transition maps, possibly with boundary ([`exists_chartedSpace_hasGroupoid_PLGroupoid`](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/SimplicialComplex/CombinatorialManifold/PL.html#PreAbstractSimplicialComplex.IsCombinatorialManifold.exists_chartedSpace_hasGroupoid_PLGroupoid)).
- **Markov invariance of the HOMFLY polynomial**: the HOMFLY polynomial of a braid closure, built by interpolating the `sl_N` Jimbo traces, satisfies the skein relation and is unchanged by Markov moves ([`MarkovEquiv.homfly_eq`](https://taucetiproject.org/docs/TauCeti/KnotTheory/Homfly/Existence.html#TauCeti.MarkovEquiv.homfly_eq)).
- **The Jordan–Brouwer separation theorem**: the complement of an embedded `n`-sphere in `Sⁿ⁺¹` has exactly two path components ([`natCard_zerothHomotopy_sphere_compl_range_eq_two`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicTopology/Singular/JordanBrouwer.html#TauCeti.natCard_zerothHomotopy_sphere_compl_range_eq_two)).
- **`Diff(M)` is a topological group**: for a compact manifold, composition and inversion are continuous in the weak Whitney topology ([`Diffeomorph.isTopologicalGroup`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Diffeomorphism/Inversion.html#Diffeomorph.isTopologicalGroup)).

### Notable definitions and infrastructure

- **Prime manifolds** ([`IsPrimeManifold`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/ConnectedSum/Prime.html#TauCeti.IsPrimeManifold)): a manifold is prime if it is not a sphere and every connected-sum splitting of it has a sphere as a summand. Together with iterated connected sums, this is what the prime decomposition half of geometrization is stated in.
- **Framed knot exteriors**: the [knot exterior](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LowDimTopology/SolidTorusNeighborhood/Exterior.html#TauCeti.knotExterior) has a torus boundary with a [framing number](https://taucetiproject.org/docs/TauCeti/LowDimTopology/DehnSurgery/SeifertFraming.html#TauCeti.IsSolidTorusNeighborhood.framingNumber) and a null-homologous preferred longitude. These are the meridian and longitude conventions that Dehn filling needs.
- **The Euler class of a foliation** ([`Foliation.eulerClass`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Foliation/EulerClass.html#TauCeti.Foliation.eulerClass)): it is read off a Thom class of the tangent field and paired against surfaces, so that Thurston's inequality and Yazdi's refutation of the Euler class one conjecture can be stated.

### Roadmap coverage

- **Layers 3 and 8** are done. Layer 3 also knows that orthogonal maps of a sphere are isotopic exactly when their determinants agree, and it states Cerf's theorem without proving it.
- **Layer 1** has local collars, tubular neighbourhoods, a disc theorem, invariance of domain and now the connected sum with its independence theorem. It has no existence theorem for global collars, no gluing along boundary pieces, and no handles.
- **Layer 2** is done except for local flatness of PL embeddings, which is now known only for PL curves.
- **Layer 11** has only Whitehead's converse missing. It now also has common subdivisions of locally finite geometric complexes.
- **Layer 9** proves rank at most Heegaard genus for manifolds that have a splitting. It does not have the existence of splittings.
- **Layer 10** has all of its statements, but has Thom classes only for trivial bundles.
- **Layers 4, 5, 6 and 7** are partial:
  - Layer 4 is missing Reidemeister's theorem, the converse of Markov's theorem, and polygonal knots to diagrams.
  - Layer 5 has no Dehn filling.
  - Layer 6 has no concordance group.
  - In Layer 7, volume is metric-independent only under an assumed Mostow rigidity, and the Weeks manifold has not been built.

This window's material does not show the knot theory, surgery, Heegaard, foliation or Riemannian modules. The assessments of those layers are carried over from the previous report.

## The frontier

- **Gluing along the boundary**: the connected sum glues punctured interiors, so it does not unblock this. Global collars still have only closure lemmas and no existence theorem. Dehn filling, handles and Heegaard regluing all wait on boundary gluing.
- **Dehn filling and the unknot surgeries**: the [unknot's exterior is a solid torus](https://taucetiproject.org/docs/TauCeti/LowDimTopology/SolidTorusNeighborhood/Unknot.html#TauCeti.unknotExteriorHomeomorph) with meridian and longitude exchanged, which is the input for `0`- and `∞`-surgery. The filling itself needs boundary gluing.
- **Thom classes of oriented plane bundles**: these exist only for trivial bundles, so the foliation Euler-class statements may still hold vacuously. Relative Mayer–Vietoris sequences in singular cohomology, the usual tool for patching local Thom classes together, are now available.
- **Every closed 3-manifold has a Heegaard splitting**: this would make the Heegaard genus unconditional. It needs a triangulation or Morse-function argument, together with gluing.
- **Whitehead's converse**: every PL manifold should admit a combinatorial triangulation. This would complete the reconciliation of Layer 11 with the PL groupoid.
