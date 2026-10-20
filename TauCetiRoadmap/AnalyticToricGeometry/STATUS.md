<!--tauceti-status:v1 {"roadmap":"AnalyticToricGeometry","to_sha":"8334df225e9c15d22464fe5432d849ee6391c09a","ts":"2026-10-07T18:27:27Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","remaining":"glue the affine torus actions into the global torus action on the fan scheme","state":"partial"},{"id":"Layer 1","state":"done"},{"id":"Layer 2","state":"done"},{"id":"Layer 3G","state":"done"},{"id":"Layer 3","state":"done"},{"id":"Layer 4","remaining":"equivariance of character functions; naturality of the boundary under products","state":"partial"},{"id":"Layer 5","remaining":"star subdivisions give proper maps; product compatibility beyond homeomorphisms","state":"partial"},{"id":"Layer 6","remaining":"torus equivariance of the comparison; naturality for characters, products, orbits and boundary components","state":"partial"}],"readme_sha":"cbda0615336ec696046983e71517f737e9bd5ea159fa3ebeae8de06d172e2fbc","roadmap":"AnalyticToricGeometry","to_sha":"8334df225e9c15d22464fe5432d849ee6391c09a"}-->
# Status: AnalyticToricGeometry

This file documents the status of the AnalyticToricGeometry roadmap up until `8334df2` (2026-10-07T18:27:27Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** A regular fan has a Hausdorff complex manifold with a holomorphic torus action, orbits that are quotient tori, a normal-crossings boundary, holomorphic toric maps with a properness criterion, and a biholomorphic comparison with the complex points of its fan scheme. Layers 1–3 are done. Layers 0, 4, 5 and 6 are each partial. What is missing is mostly naturality and equivariance, plus star subdivisions and the global algebraic torus action.

### Named results

- **The normal-crossings form of the toric boundary**: near every point of the realization there is a holomorphic chart in which each ray-indexed boundary component through the point is a coordinate hyperplane. For a nonempty fan these components cover exactly the complement of the dense torus ([`Fan.exists_partialDiffeomorph_analyticBoundaryComponent_normalForm`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Toric/Analytic/Fan/Boundary/NormalForm.html#TauCeti.Toric.Fan.exists_partialDiffeomorph_analyticBoundaryComponent_normalForm)).
- **The orbit–cone correspondence, with orbits as quotient tori**: cones correspond to torus orbits, reversing the closure order (`Fan.coneEquivOrbitRelQuotient`). The orbit of σ is equivariantly homeomorphic to the torus of N ⧸ N_σ ([`Fan.analyticConeOrbitTorusHomeomorph`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Toric/Analytic/Fan/Orbit/QuotientTorus.html#TauCeti.Toric.Fan.analyticConeOrbitTorusHomeomorph)).
- **The cone-by-cone properness criterion**: for regular fans with nonempty source, a toric map is proper exactly when the real preimage of every target cone is the union of the source cones mapped into it ([`FanHom.isProperMap_analyticMap_iff`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Toric/Analytic/Fan/Map/Proper.html#TauCeti.Toric.FanHom.isProperMap_analyticMap_iff)).
- **Compactness is completeness**: a nonempty regular fan has compact realization exactly when it is complete. The proof reads the absolute values of characters on the dense torus (`Fan.compactSpace_analyticRealization_iff_isComplete`).
- **The algebraic–analytic comparison**: the complex points of the fan scheme, as morphisms over Spec ℂ, are homeomorphic to the realization by the identity on every affine chart (`Fan.algebraicAnalyticHomeomorph`). The library also makes this map a biholomorphism and proves it commutes with toric maps (`Fan.algebraicAnalyticDiffeomorph`, `FanHom.algebraicAnalyticEquiv_naturality`). The complex structure on the algebraic side is pulled back from the realization, but it is shown to agree with the independent affine-chart structures.

### Notable definitions and infrastructure

- **The complex manifold of a regular fan**: affine charts glued along face localizations into a Hausdorff, second-countable complex manifold modelled on ℂ^n. Every later analytic statement lives on it ([`Fan.isManifold_analyticRealization`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Toric/Analytic/Fan/Manifold.html#TauCeti.Toric.Fan.isManifold_analyticRealization)).
- **The fan scheme over Spec ℂ**: the toric scheme of every finite fan, with chart inclusions and toric maps as morphisms over Spec ℂ ([`Fan.algebraicRealizationOver`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Toric/Algebraic/Fan/Over.html#TauCeti.Toric.Fan.algebraicRealizationOver)). The scheme of a product fan is the fibre product of the factor schemes (`Fan.algebraicProdIso`). This is what makes complex points well defined for the comparison.
- **Products of realizations**: the realization of a product of regular fans is the product of the realizations, compatibly with products of toric maps ([`Fan.analyticProdHomeomorph`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Toric/Analytic/Fan/Product.html#TauCeti.Toric.Fan.analyticProdHomeomorph)). So far this is a homeomorphism, not a biholomorphism.

### Roadmap coverage

Layers 1, 2, 3G and 3 are done. Layer 0 has everything but one item: the affine torus coaction exists, is face-equivariant, and is packaged as an internal monoid action, but it has not been glued to a torus action on the fan scheme. Layer 4 has the torus action, the orbit–cone correspondence with stabilizers and quotient tori, and the boundary with its normal form, intersection formula, and naturality under fan equivalences and open subfans. It lacks equivariance of character functions and naturality of the boundary under products. Layer 5 has items 1–3 and 5, with product compatibility proved only at the level of homeomorphisms. In item 4, compactness iff completeness is proved, but star subdivisions are untouched. Layer 6 has items 1–3 except torus equivariance, and in item 4 it has naturality for toric maps only.

## The frontier

- **Star subdivisions and standard fans**: show that a star subdivision induces a proper map, through the properness criterion and equality of supports. Then check the README's acceptance examples, such as projective space with its standard charts.
- **The global algebraic torus action**: transport the internal action [`affineCoordinateRingCoactionModObj`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Toric/Algebraic/TorusAction/Internal.html#TauCeti.Toric.affineCoordinateRingCoactionModObj) to the affine toric schemes and glue it along the face open immersions. Face equivariance is already proved.
- **Finishing the comparison**: make the comparison torus-equivariant. Prove its naturality for characters, products, orbit inclusions and boundary components, and that it matches analytic compactness with algebraic completeness.
- **Products as complex manifolds**: upgrade the product homeomorphism to a biholomorphism. Then prove that the boundary components of a product fan are natural under it.
- **Equivariance of character functions**: state and prove how character functions on the realization transform under the torus action, which is the remaining piece of Layer 4, item 1.
