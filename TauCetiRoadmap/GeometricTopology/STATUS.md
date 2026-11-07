<!--tauceti-status:v1 {"roadmap":"GeometricTopology","to_sha":"4908b0344e1be5f7e9e5af7f7e640464843a2c84","ts":"2026-11-07T12:02:16Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 1","remaining":"gluing along boundary pieces, handle attachment, and global collars of a general boundary","state":"partial"},{"id":"Layer 2","remaining":"local flatness of PL embeddings of dimension above one, against the PL groupoid","state":"partial"},{"id":"Layer 3","state":"done"},{"id":"Layer 4","remaining":"Reidemeister's theorem, the converse of Markov's theorem, polygonal knots to diagrams","state":"partial"},{"id":"Layer 5","remaining":"Dehn filling along a slope and the unknot surgery identities","state":"partial"},{"id":"Layer 6","remaining":"the concordance group, the cobordism category, the Tristram-Levine signature of actual knots, the tau import","state":"partial"},{"id":"Layer 7","remaining":"a proof of Mostow invariance of hyperbolic volume, and the Weeks manifold with its minimal-volume statement","state":"partial"},{"id":"Layer 8","state":"done"},{"id":"Layer 9","remaining":"existence of a Heegaard splitting for every closed 3-manifold","state":"partial"},{"id":"Layer 10","remaining":"existence of Thom classes, hence Euler classes, for nontrivial oriented plane bundles","state":"partial"},{"id":"Layer 11","remaining":"Whitehead's converse: every PL manifold admits a combinatorial triangulation","state":"partial"}],"readme_sha":"4c1e7d510ffab6bcc71aed0a84871482f0a69a32136169a7f2f8bea571471d2f","roadmap":"GeometricTopology","to_sha":"4908b0344e1be5f7e9e5af7f7e640464843a2c84"}-->
# Status: GeometricTopology

This file documents the status of the GeometricTopology roadmap up until `4908b03` (2026-11-07T12:02:16Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Layers 3 and 8 are done. `Diff(M)` is a topological group, and the eight Thurston geometries have their isometry groups, together with the geometrization and JSJ statements. Every other layer is partial. Layer 1 now has a well-defined smooth connected sum, but gluing along a boundary, Dehn filling, the concordance group and the existence of Heegaard splittings have not begun.

### Named results

- **The connected sum is well defined**: for connected boundaryless oriented smooth manifolds, the oriented connected sum does not depend on the chosen balls, is commutative, and satisfies `X # Sⁿ ≃ X` ([`OrientedConnectedSum.nonempty_diffeomorph_connectedSum`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/ConnectedSum/Oriented.html#TauCeti.OrientedConnectedSum.nonempty_diffeomorph_connectedSum)).
- **Combinatorial manifolds are PL manifolds**: the polyhedron of a positive-dimensional combinatorial manifold has a half-space atlas with PL transition maps ([`exists_chartedSpace_hasGroupoid_PLGroupoid`](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/SimplicialComplex/CombinatorialManifold/PL.html#PreAbstractSimplicialComplex.IsCombinatorialManifold.exists_chartedSpace_hasGroupoid_PLGroupoid)).
- **Markov invariance of the HOMFLY polynomial**: the HOMFLY polynomial of a braid closure, built by interpolating the `sl_N` Jimbo traces, satisfies the skein relation and is unchanged by Markov moves ([`MarkovEquiv.homfly_eq`](https://taucetiproject.org/docs/TauCeti/KnotTheory/Homfly/Existence.html#TauCeti.MarkovEquiv.homfly_eq)).
- **`Diff(M)` is a topological group**: for a compact manifold, composition and inversion are continuous in the weak Whitney topology ([`Diffeomorph.isTopologicalGroup`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Diffeomorphism/Inversion.html#Diffeomorph.isTopologicalGroup)).
- **The Schoenflies theorem in the plane**: some homeomorphism of `ℂ` carries the unit circle onto any given Jordan curve and the disc onto its inside ([`IsJordanCurve.exists_homeomorph_image_sphere`](https://taucetiproject.org/docs/TauCeti/Analysis/Complex/Conformal/Jordan/Schoenflies.html#TauCeti.IsJordanCurve.exists_homeomorph_image_sphere)).

### Notable definitions and infrastructure

- **Prime manifolds** ([`IsPrimeManifold`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/ConnectedSum/Prime.html#TauCeti.IsPrimeManifold)): a manifold that is not a sphere, and in which every connected-sum splitting has a sphere summand. Together with iterated connected sums, this makes the prime decomposition stateable.
- **Framed knot exteriors**: the [knot exterior](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LowDimTopology/SolidTorusNeighborhood/Exterior.html#TauCeti.knotExterior) has a torus boundary with a [framing number](https://taucetiproject.org/docs/TauCeti/LowDimTopology/DehnSurgery/SeifertFraming.html#TauCeti.IsSolidTorusNeighborhood.framingNumber) and a null-homologous preferred longitude. These are the conventions Dehn filling needs.
- **The Euler class of a foliation** ([`Foliation.eulerClass`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Foliation/EulerClass.html#TauCeti.Foliation.eulerClass)): it is read off a Thom class of the tangent field and paired against surfaces, which is enough to state Thurston's inequality and Yazdi's refutation.

### Roadmap coverage

- **Layers 3 and 8** are done. Layer 3 also states [Cerf's theorem](https://taucetiproject.org/docs/TauCeti/Geometry/Diffeomorphism/Cerf.html#TauCeti.CerfTheorem), derives it from the Smale conjecture, and shows that `Diff(Sⁿ)` is not path-connected.
- **Layer 1** has local collars, tubular neighbourhoods in Euclidean space, the disc theorem, invariance of domain and the connected sum. It lacks gluing along boundary pieces, handle attachment, and global collars of a general boundary.
- **Layer 2** has local flatness for smooth embeddings and for PL curves, Brown's bicollaring theorems and the [Jordan–Brouwer separation theorem](https://taucetiproject.github.io/TauCeti/docs/TauCeti/AlgebraicTopology/Singular/JordanBrouwer.html#TauCeti.natCard_zerothHomotopy_sphere_compl_range_eq_two). Local flatness of PL embeddings of dimension above one is missing.
- **Layer 11** has the PL structure on combinatorial manifolds, simplicial homology equal to singular homology, and common subdivisions of geometric complexes. Only Whitehead's converse is missing.
- **Layer 4** has the HOMFLY, Jones and Alexander invariants of braids and diagrams. Reidemeister's theorem, the converse of Markov's theorem, and the passage from polygonal knots to diagrams are missing.
- **Layer 9** has rank at most Heegaard genus for manifolds that have a splitting, and genus one for lens spaces. It is not proved that every closed 3-manifold has a splitting.
- **Layer 10** has all of its statements, but Thom classes exist only for trivial bundles.
- **Layers 5, 6 and 7** are partial. Layer 5 has slopes, lens spaces and framed exteriors, but no Dehn filling. Layer 6 has the concordance relations, both slice genera and homology cobordisms, but no concordance group. In Layer 7, hyperbolic volume is metric-independent only under an assumed Mostow rigidity, and the Weeks manifold has not been constructed. A homotopy-invariant [simplicial volume](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/Singular/LocalHomology/SimplicialVolume.html#TauCeti.HomologicalOrientation.simplicialVolume) is now defined.

## The frontier

- **Gluing along the boundary**: the connected sum avoids it by gluing punctured interiors. Dehn filling, handles, Heegaard regluing and the cobordism category still need a boundary gluing, and global collars of a general boundary are not yet shown to exist.
- **Dehn filling and the unknot surgeries**: the [unknot's exterior is a solid torus](https://taucetiproject.org/docs/TauCeti/LowDimTopology/SolidTorusNeighborhood/Unknot.html#TauCeti.unknotExteriorHomeomorph) with meridian and longitude exchanged, which is the input for `0`- and `∞`-surgery. The filling itself waits on gluing.
- **Thom classes of oriented plane bundles**: these exist only for product bundles, where the [top cohomology of the Thom pair](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/Cohomology/ProdThomPair.html#TauCeti.prodThomPairSingularCohomologyEquiv) is now computed. Without nontrivial bundles, the foliation Euler-class statements could hold vacuously.
- **Every closed 3-manifold has a Heegaard splitting**: this would make the Heegaard genus unconditional. It needs a triangulation or Morse-function argument, together with gluing.
- **Whitehead's converse**: every PL manifold should admit a combinatorial triangulation. That would complete the reconciliation in Layer 11 with the PL groupoid.
