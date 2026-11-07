<!--tauceti-status:v1 {"roadmap":"AnalyticToricGeometry","to_sha":"271e1af4dd54c50b9192cf3e213b7686843a0b3a","ts":"2026-10-24T23:22:30Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","state":"done"},{"id":"Layer 1","state":"done"},{"id":"Layer 2","state":"done"},{"id":"Layer 3G","state":"done"},{"id":"Layer 3","state":"done"},{"id":"Layer 4","state":"done"},{"id":"Layer 5","state":"done"},{"id":"Layer 6","state":"done"}],"readme_sha":"cbda0615336ec696046983e71517f737e9bd5ea159fa3ebeae8de06d172e2fbc","roadmap":"AnalyticToricGeometry","to_sha":"271e1af4dd54c50b9192cf3e213b7686843a0b3a"}-->
# Status: AnalyticToricGeometry

This file documents the status of the AnalyticToricGeometry roadmap up until `271e1af` (2026-10-24T23:22:30Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Every layer of the roadmap is now done. A finite regular fan has a Hausdorff complex manifold with a holomorphic torus action, the orbit–cone correspondence, and a normal-crossings boundary. Its fan morphisms give holomorphic toric maps, with a properness criterion that covers star subdivisions. The realization is torus-equivariantly biholomorphic to the complex points of the fan scheme, and the README's standard examples, from affine and projective space to a blow-up, are worked out. No milestone named in the README is left open.

### Named results

- **The normal-crossings form of the toric boundary** — near every point there is a holomorphic chart in which each ray-indexed boundary component through the point is a coordinate hyperplane, and each component has multiplicity one ([`Fan.exists_partialDiffeomorph_analyticBoundaryComponent_normalForm`](https://taucetiproject.org/docs/TauCeti/Geometry/Toric/Analytic/Fan/Boundary/NormalForm.html#TauCeti.Toric.Fan.exists_partialDiffeomorph_analyticBoundaryComponent_normalForm)).
- **The cone-by-cone properness criterion** — for regular fans with nonempty source, a toric map is proper exactly when the real preimage of every target cone is the union of the source cones mapped into it ([`FanHom.isProperMap_analyticMap_iff`](https://taucetiproject.org/docs/TauCeti/Geometry/Toric/Analytic/Fan/Map/Proper.html#TauCeti.Toric.FanHom.isProperMap_analyticMap_iff)).
- **Star subdivisions are proper blow-downs** — subdividing a regular fan along a nonzero cone gives a proper map that is a biholomorphism away from the exceptional divisor, the preimage of the cone's orbit closure ([`Fan.isProperMap_analyticMap_starSubdivisionAlong`](https://taucetiproject.org/docs/TauCeti/Geometry/Toric/Analytic/Fan/Map/Subdivision.html#TauCeti.Toric.Fan.isProperMap_analyticMap_starSubdivisionAlong)).
- **Compactness is completeness** — a nonempty regular fan has compact realization exactly when it is complete ([`Fan.compactSpace_analyticRealization_iff_isComplete`](https://taucetiproject.org/docs/TauCeti/Geometry/Toric/Analytic/Fan/Compact.html#TauCeti.Toric.Fan.compactSpace_analyticRealization_iff_isComplete)). The same holds for the algebraic complex points, transported through the comparison.
- **The algebraic–analytic comparison** — the complex points of the fan scheme over Spec ℂ are biholomorphic to the realization, by the identity on every affine chart. The map is torus-equivariant ([`Fan.algebraicAnalyticEquiv_smul`](https://taucetiproject.org/docs/TauCeti/Geometry/Toric/Analytic/Fan/Comparison/TorusAction.html#TauCeti.Toric.Fan.algebraicAnalyticEquiv_smul)) and natural for toric maps, characters, products, orbits and boundary components. The complex structure on the algebraic side is pulled back from the realization, but it is shown to agree with the affine-chart structures.

### Notable definitions and infrastructure

- **The complex manifold of a regular fan**: affine charts glued along face localizations into a Hausdorff, second-countable complex manifold modelled on ℂ^n (`Fan.isManifold_analyticRealization`). Every analytic statement above lives on it.
- **The torus action on the fan scheme**: the affine coactions glue to an internal action of the dense torus on the fan scheme over Spec ℂ ([`Fan.algebraicRealizationModObj`](https://taucetiproject.org/docs/TauCeti/Geometry/Toric/Algebraic/Fan/TorusAction/Action.html#TauCeti.Toric.Fan.algebraicRealizationModObj)). Toric maps are equivariant for it, and on product fans it is the product action. This is what lets the comparison be stated equivariantly.
- **The fan of projective space**: built from an integral basis ([`Fan.projectiveSpace`](https://taucetiproject.org/docs/TauCeti/Geometry/Toric/Algebraic/Fan/ProjectiveSpace/Basic.html#TauCeti.Toric.Fan.projectiveSpace)). Its scheme is `Proj ℂ[X_j]` and its realization is ℂℙⁿ with the homogeneous-ratio atlas ([`projectiveSpaceDiffeomorph`](https://taucetiproject.org/docs/TauCeti/Geometry/Toric/Analytic/Fan/ProjectiveSpace/Manifold.html#TauCeti.Toric.projectiveSpaceDiffeomorph)), so it serves as the test case for the comparison and properness theorems.

### Roadmap coverage

All eight layers, 0, 1, 2, 3G, 3, 4, 5 and 6, are done. Layer 0 gained its last two items: the global torus action on the fan scheme, and the identification of a product fan's scheme with the fibre product. Layer 4 gained equivariance of character functions, multiplicity one, transversality and product naturality of the boundary. Layer 5 gained the product biholomorphism, properness of products, and star subdivisions. Layer 6 gained torus equivariance and the remaining naturality statements. The acceptance checks are covered too: the √2 counterexample, the affine line and plane, the zero-cone torus, affine and projective space, product fans, the empty subfan, and the plane blow-up.

## The frontier

- **An intrinsic complex structure on algebraic complex points**: the comparison's biholomorphism uses a structure pulled back from the realization. It is shown to agree with the affine-chart structures, so this would be a restatement rather than new mathematics.
- **Nothing else in the README is open.** Further work would leave the roadmap's stated scope, which excludes singular toric spaces, infinite fans, coherent sheaves and intersection theory.
