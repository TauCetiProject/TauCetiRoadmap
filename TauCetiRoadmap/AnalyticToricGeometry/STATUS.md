<!--tauceti-status:v1 {"roadmap":"AnalyticToricGeometry","to_sha":"1d095894ac25298eb2a23398826c0f867b6d3164","ts":"2026-10-05T01:07:53Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","remaining":"the global torus action on the fan scheme; the product-fan scheme as the fibre product over Spec C","state":"partial"},{"id":"Layer 1","state":"done"},{"id":"Layer 2","state":"done"},{"id":"Layer 3G","state":"done"},{"id":"Layer 3","state":"done"},{"id":"Layer 4","remaining":"orbits as quotient tori, equivariance of character functions, naturality of the boundary under products","state":"partial"},{"id":"Layer 5","remaining":"product compatibility, the cone-by-cone properness criterion, completeness iff compactness, star subdivisions","state":"partial"},{"id":"Layer 6","remaining":"torus equivariance and holomorphy of the comparison homeomorphism, and its naturality for toric maps, characters, orbits and boundary","state":"partial"}],"readme_sha":"05b2d6bffced472125097b6703844bc28e57e2c63e58093905dec465e9810257","roadmap":"AnalyticToricGeometry","to_sha":"1d095894ac25298eb2a23398826c0f867b6d3164"}-->
# Status: AnalyticToricGeometry

This file documents the status of the AnalyticToricGeometry roadmap up until `1d09589` (2026-10-05T01:07:53Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** A regular fan now has a Hausdorff complex manifold with a holomorphic torus action, the orbit–cone correspondence, a normal-crossings toric boundary and holomorphic toric maps. Layers 1–3 are done. Layers 0, 4, 5 and 6 are each partial. The main pieces not yet begun are properness and compactness.

### Named results

- **The normal-crossings form of the toric boundary**: near every point of the realization there is a holomorphic chart in which each ray-indexed boundary component through the point is a coordinate hyperplane. For a nonempty fan, these components together are exactly the complement of the dense torus ([`Fan.exists_partialDiffeomorph_analyticBoundaryComponent_normalForm`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Toric/Analytic/Fan/Boundary/NormalForm.html#TauCeti.Toric.Fan.exists_partialDiffeomorph_analyticBoundaryComponent_normalForm), [`Fan.iUnion_analyticBoundaryComponent`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Toric/Analytic/Fan/Boundary/Basic.html#TauCeti.Toric.Fan.iUnion_analyticBoundaryComponent)).
- **The orbit–cone correspondence for a regular fan**: the cones correspond bijectively to the torus orbits of the realization, and larger cones give smaller orbit closures (`Fan.coneEquivOrbitRelQuotient`). The intersection of the boundary components of a cone's rays is that cone's orbit closure ([`Fan.iInter_analyticBoundaryComponent_eq_closure_analyticConeOrbit`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Toric/Analytic/Fan/Boundary/Intersection.html#TauCeti.Toric.Fan.iInter_analyticBoundaryComponent_eq_closure_analyticConeOrbit)).
- **Holomorphic toric maps**: a morphism of regular fans induces a holomorphic map of realizations ([`FanHom.contMDiff_analyticMap`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Toric/Analytic/Fan/Map/Holomorphic.html#TauCeti.Toric.FanHom.contMDiff_analyticMap)). It is the unique continuous map extending the induced homomorphism of dense tori ([`FanHom.eq_analyticMap_iff`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Toric/Analytic/Fan/Map/Torus.html#TauCeti.Toric.FanHom.eq_analyticMap_iff)).
- **Gordan's lemma**: the dual semigroup of every lattice-rational cone in an integral lattice is finitely generated ([`IsLatticeRational.fg_dualSemigroup`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Toric/Algebraic/DualSemigroup/Finiteness.html#TauCeti.Toric.IsLatticeRational.fg_dualSemigroup)).
- **Complex points of the fan scheme**: for a regular fan, the complex points of the toric scheme, taken as morphisms over Spec ℂ, are homeomorphic to the analytic realization by a map that is the identity of complex points on every affine chart ([`Fan.algebraicAnalyticHomeomorph`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Toric/Analytic/Fan/Comparison.html#TauCeti.Toric.Fan.algebraicAnalyticHomeomorph)).

### Notable definitions and infrastructure

- **The complex manifold of a regular fan**: affine charts glued along face localizations into a Hausdorff, second-countable complex manifold modelled on ℂ^n. Every later analytic result is stated on it ([`Fan.isManifold_analyticRealization`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Toric/Analytic/Fan/Manifold.html#TauCeti.Toric.Fan.isManifold_analyticRealization)).
- **The fan scheme over Spec ℂ**: the toric scheme of every finite fan, with chart inclusions and toric maps as morphisms over Spec ℂ. This is what makes complex points well defined for the comparison ([`Fan.algebraicRealizationOver`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Toric/Algebraic/Fan/Over.html#TauCeti.Toric.Fan.algebraicRealizationOver)).
- **The open-subfan map**: an open embedding of a subfan's realization onto the union of its ambient charts, and a local biholomorphism. Toric maps restrict through it ([`Fan.isLocalDiffeomorph_subfanAnalyticMap`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Toric/Analytic/Fan/Subfan/Holomorphic.html#TauCeti.Toric.Fan.isLocalDiffeomorph_subfanAnalyticMap)).

### Roadmap coverage

Layers 1, 2, 3G and 3 are done. Layer 3 was completed by the open-subfan map, its holomorphy, and the agreement of orbit charts on overlaps.

Layer 0 now has the following:
- toric-cone intersections, for lattice maps with injective real extension;
- Gordan's lemma;
- the separation lemma with open immersions for every lattice-rational face;
- the fan scheme over Spec ℂ for every finite fan.

Layer 0 still lacks the global torus action and the identification of the product-fan scheme with the fibre product. Only the coaction identities on affine coordinate rings and a product comparison morphism exist.

Layer 4 has its boundary: the components, the normal form, the intersection formula, and naturality under fan equivalences and open subfans. It still lacks quotient tori, equivariance of character functions, and naturality under products.

Layer 5 has items 1, 2 and 5 except product compatibility. The properness criterion and the equivalence of completeness with compactness (items 3–4) are untouched.

Layer 6 has the affine comparison and the chartwise homeomorphism. Torus equivariance, holomorphy and naturality are missing.

## The frontier

- **Properness and compactness**: prove the cone-by-cone support criterion for properness of the analytic map of finite fans with nonempty source. Then deduce that a nonempty regular fan is complete exactly when its realization is compact, and that star subdivisions give proper maps. The preimage description of charts and orbits, [`FanHom.preimage_analyticMap_range_analyticAffineChartι`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Toric/Analytic/Fan/Map/Orbit.html#TauCeti.Toric.FanHom.preimage_analyticMap_range_analyticAffineChartι), is the input.
- **Finishing the comparison**: make the homeomorphism from complex points torus-equivariant and holomorphic in both directions. Then prove it natural for toric maps, characters, orbits and boundary components.
- **The global algebraic torus action**: turn the affine coaction [`affineCoordinateRingCoaction`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Toric/Algebraic/TorusAction/Coaction.html#TauCeti.Toric.affineCoordinateRingCoaction) into actions on the affine schemes and glue them along the face open immersions. Face equivariance is already proved.
- **Products**: show that [`Fan.algebraicProdComparison`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Toric/Algebraic/Fan/Product/Scheme.html#TauCeti.Toric.Fan.algebraicProdComparison) is an isomorphism, since its affine pieces already are. On the analytic side, prove that product fans realize as products of manifolds, compatibly with toric maps and boundary components.
- **Orbits as quotient tori**: identify each orbit with the torus modulo the stabilizer subtorus of its distinguished point. Also prove that character functions are equivariant on the realization.
