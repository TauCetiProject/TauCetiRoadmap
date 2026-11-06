<!--tauceti-status:v1 {"roadmap":"GeometricTopology","to_sha":"afa08a3ed16fb167e35de371afb1eb03fbc5913a","ts":"2026-11-06T05:03:45Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 1","remaining":"gluing along a piece of the boundary and handle attachment","state":"partial"},{"id":"Layer 2","remaining":"local flatness of PL embeddings of dimension above one, against the PL groupoid","state":"partial"},{"id":"Layer 3","state":"done"},{"id":"Layer 4","remaining":"Reidemeister's theorem, the converse of Markov's theorem, polygonal knots to diagrams","state":"partial"},{"id":"Layer 5","state":"done"},{"id":"Layer 6","remaining":"the concordance group, the cobordism category, the Tristram-Levine signature of actual knots, the tau import","state":"partial"},{"id":"Layer 7","remaining":"a proof of Mostow invariance of hyperbolic volume","state":"partial"},{"id":"Layer 8","state":"done"},{"id":"Layer 9","remaining":"existence of a Heegaard splitting for every closed 3-manifold","state":"partial"},{"id":"Layer 10","remaining":"a Thom class for the tangent field of every oriented foliation, from the oriented-bundle Thom class","state":"partial"},{"id":"Layer 11","remaining":"Whitehead's converse: every PL manifold admits a combinatorial triangulation","state":"partial"}],"readme_sha":"4c1e7d510ffab6bcc71aed0a84871482f0a69a32136169a7f2f8bea571471d2f","roadmap":"GeometricTopology","to_sha":"afa08a3ed16fb167e35de371afb1eb03fbc5913a"}-->
# Status: GeometricTopology

This file documents the status of the GeometricTopology roadmap up until `afa08a3` (2026-11-06T05:03:45Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Layers 3, 5 and 8 are done: `Diff(M)` is a topological group, Dehn surgery exists with its unknot identities, and the Thurston geometries come with their isometry groups. Every other layer is partial. The largest gaps are gluing along a boundary, the knot concordance group, the existence of Heegaard splittings, and a proof of Mostow invariance of volume.

### Named results

- **The connected sum is well defined**: for connected Hausdorff oriented manifolds without boundary, the oriented connected sum [does not depend on the balls](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/ConnectedSum/Oriented.html#TauCeti.OrientedConnectedSum.nonempty_diffeomorph_connectedSum). It is commutative, and [`X # Sⁿ ≃ X`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/ConnectedSum/Oriented.html#TauCeti.OrientedConnectedSum.nonempty_diffeomorph_sphere).
- **The Schoenflies theorem**: a homeomorphism of the plane carries the unit circle onto any Jordan curve and the disc onto its inside ([`IsJordanCurve.exists_homeomorph_image_sphere`](https://taucetiproject.org/docs/TauCeti/Analysis/Complex/Conformal/Jordan/Schoenflies.html#TauCeti.IsJordanCurve.exists_homeomorph_image_sphere)).
- **Surgery on the unknot**: `0`-surgery on the unknot is `S¹ × S²` (`unknotZeroDehnFilling`), and `p/q`-surgery is a lens space (`unknotLensSpaceDehnFilling`). These identities pin the slope and framing conventions for every surgery statement.
- **Combinatorial manifolds are PL manifolds**: the polyhedron of a positive-dimensional combinatorial manifold has a half-space atlas with PL transition maps ([`exists_chartedSpace_hasGroupoid_PLGroupoid`](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/SimplicialComplex/CombinatorialManifold/PL.html#PreAbstractSimplicialComplex.IsCombinatorialManifold.exists_chartedSpace_hasGroupoid_PLGroupoid)).
- **`Diff(M)` is a topological group**: for a compact manifold, composition and inversion are continuous in the weak Whitney topology ([`Diffeomorph.isTopologicalGroup`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Diffeomorphism/Inversion.html#Diffeomorph.isTopologicalGroup)). In addition, orthogonal transformations of a sphere are isotopic exactly when their determinants agree.

### Notable definitions and infrastructure

- **Dehn filling** (`DehnFilling`): a solid torus is glued to a knot or link exterior along a chosen slope, as a compact Hausdorff space, and every slope has a filling. With it, Property P, Property R, the cosmetic surgery conjecture and Yasui's disproof of the Akbulut–Kirby conjecture are all stated.
- **The Gabai–Meyerhoff–Milley theorem** ([`GabaiMeyerhoffMilleyTheorem`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Riemannian/Hyperbolic/Weeks.html#TauCeti.GabaiMeyerhoffMilleyTheorem)): the Weeks manifold is defined as surgery on the Whitehead link with coefficients `5` and `5/2`. The minimal-volume statement compares individual hyperbolic metrics, so it does not assume Mostow rigidity.
- **Thom classes of oriented bundles** (`VectorBundleOrientation.thomClass`): an oriented real vector bundle over any base has an integral Thom class, unique and natural. Before this, existence was known only for trivial bundles.

### Roadmap coverage

- **Layers 3, 5 and 8** are done. Layer 5 has fillings of knot and link exteriors, rational surgery on links, and the unknot identities.
- **Layer 1** has the connected sum, prime manifolds, local collars, Brown's collaring theorem for compact domains, tubular neighbourhoods and a disc theorem. Gluing along a piece of the boundary and handle attachment are missing.
- **Layer 2** is done except for PL embeddings of dimension above one. PL curves are [locally flat against the PL groupoid](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/LocallyFlat/PL.html#TauCeti.IsLocallyFlat.of_isPLMap).
- **Layer 4** has the [HOMFLY](https://taucetiproject.org/docs/TauCeti/KnotTheory/Homfly/Existence.html#TauCeti.MarkovEquiv.homfly_eq), Jones and Alexander invariants. It lacks Reidemeister's theorem, the converse of Markov's theorem, and the passage from polygonal knots to diagrams.
- **Layer 6** has smooth, topological and [homology concordance](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/SmoothEmbedding/HomologyConcordance.html#TauCeti.SmoothEmbedding.HomologyConcordant) and the slice genera. It has no concordance group or cobordism category.
- **Layer 7** has hyperbolic volume and the Weeks target. Volume is metric-independent only under an assumed Mostow rigidity.
- **Layer 9** has [rank at most Heegaard genus](https://taucetiproject.org/docs/TauCeti/LowDimTopology/Heegaard/FundamentalGroup.html#TauCeti.rank_fundamentalGroup_le_heegaardGenus) for manifolds with a splitting, but not the existence of splittings.
- **Layer 10** has all of its statements. It is unclear whether the [foliation Euler class](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Foliation/EulerClass.html#TauCeti.Foliation.eulerClass) already draws on the new oriented-bundle Thom class.
- **Layer 11** is missing only Whitehead's converse.

## The frontier

- **Gluing along the boundary**: the connected sum glues along open balls, which avoids the problem. Gluing along a boundary piece and handle attachment remain, and Heegaard regluing waits on them.
- **Mostow invariance of hyperbolic volume**: Mostow rigidity is stated but not proved. The [simplicial volume](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/Singular/LocalHomology/SimplicialVolume.html#TauCeti.HomologicalOrientation.simplicialVolume) is homotopy invariant, and straightening in the hyperboloid commutes with isometries. Gromov's proportionality theorem is the missing link to volume.
- **Euler classes of foliations**: the tangent field of a foliation needs its Thom class from the oriented-bundle theorem. That would show the Euler class statements are not vacuous.
- **Every closed 3-manifold has a Heegaard splitting**: this would make the Heegaard genus unconditional. It needs a triangulation or Morse-function argument, together with gluing.
- **Whitehead's converse**: every PL manifold should admit a combinatorial triangulation. Polyhedral chart covers of compact sets and edgewise subdivision are in place as groundwork.
