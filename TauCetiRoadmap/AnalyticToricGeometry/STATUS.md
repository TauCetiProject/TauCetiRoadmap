<!--tauceti-status:v1 {"roadmap":"AnalyticToricGeometry","to_sha":"bfcff79b60964ba7bdb78b952828313686c327ba","ts":"2026-10-23T04:01:01Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","state":"done"},{"id":"Layer 1","state":"done"},{"id":"Layer 2","state":"done"},{"id":"Layer 3G","state":"done"},{"id":"Layer 3","state":"done"},{"id":"Layer 4","state":"done"},{"id":"Layer 5","state":"done"},{"id":"Layer 6","state":"done"}],"readme_sha":"cbda0615336ec696046983e71517f737e9bd5ea159fa3ebeae8de06d172e2fbc","roadmap":"AnalyticToricGeometry","to_sha":"bfcff79b60964ba7bdb78b952828313686c327ba"}-->
# Status: AnalyticToricGeometry

This file documents the status of the AnalyticToricGeometry roadmap up until `bfcff79` (2026-10-23T04:01:01Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Every layer's milestones are now proved. A finite regular fan has a Hausdorff complex manifold with a holomorphic torus action, an orbit–cone correspondence, and a normal-crossings boundary. Fan morphisms induce holomorphic toric maps with a properness criterion, and star subdivisions are proper. The manifold is biholomorphic, torus-equivariantly, to the complex points of a fan scheme that carries its own glued torus action. What remains is checking the acceptance list and work beyond the roadmap's scope.

### Named results

- **The cone-by-cone properness criterion** — for regular fans with nonempty source, a toric map is proper exactly when the real preimage of every target cone is the union of the source cones mapped into it ([`FanHom.isProperMap_analyticMap_iff`](https://taucetiproject.org/docs/TauCeti/Geometry/Toric/Analytic/Fan/Map/Proper.html#TauCeti.Toric.FanHom.isProperMap_analyticMap_iff)).
- **Star subdivisions are proper** — subdividing a regular fan along a nonzero cone keeps it regular with the same support, so the blow-down is proper. Away from the exceptional divisor it is a biholomorphism onto the complement of the cone's orbit closure ([`Fan.isProperMap_analyticMap_starSubdivisionAlong`](https://taucetiproject.org/docs/TauCeti/Geometry/Toric/Analytic/Fan/Map/Subdivision.html#TauCeti.Toric.Fan.isProperMap_analyticMap_starSubdivisionAlong)).
- **The normal-crossings form of the toric boundary** — near every point there is a holomorphic chart in which the ray-indexed boundary components through it are coordinate hyperplanes, each with a multiplicity-one local equation ([`Fan.exists_partialDiffeomorph_analyticBoundaryComponent_normalForm`](https://taucetiproject.org/docs/TauCeti/Geometry/Toric/Analytic/Fan/Boundary/NormalForm.html#TauCeti.Toric.Fan.exists_partialDiffeomorph_analyticBoundaryComponent_normalForm)).
- **Compactness is completeness** — a nonempty regular fan has compact realization exactly when it is complete ([`Fan.compactSpace_analyticRealization_iff_isComplete`](https://taucetiproject.org/docs/TauCeti/Geometry/Toric/Analytic/Fan/Compact.html#TauCeti.Toric.Fan.compactSpace_analyticRealization_iff_isComplete)). The same holds for the algebraic complex points.
- **The algebraic–analytic comparison** — the complex points of the fan scheme, as morphisms over Spec ℂ, are biholomorphic to the realization. The map is the identity on every affine chart, is equivariant for the torus ([`Fan.algebraicAnalyticEquiv_smul`](https://taucetiproject.org/docs/TauCeti/Geometry/Toric/Analytic/Fan/Comparison/TorusAction.html#TauCeti.Toric.Fan.algebraicAnalyticEquiv_smul)), and commutes with toric maps, characters, products, orbits and boundary components. The complex structure on the algebraic side is pulled back from the realization and shown to agree with the affine-chart structures.

### Notable definitions and infrastructure

- **The complex manifold of a regular fan**: affine charts glued along face localizations into a Hausdorff, second-countable complex manifold modelled on ℂ^n. Every analytic statement lives on it ([`Fan.isManifold_analyticRealization`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Toric/Analytic/Fan/Manifold.html#TauCeti.Toric.Fan.isManifold_analyticRealization)).
- **The fan scheme with its torus action**: the toric scheme of every finite fan over Spec ℂ, with the dense torus acting by the glued affine actions ([`Fan.algebraicRealizationModObj`](https://taucetiproject.org/docs/TauCeti/Geometry/Toric/Algebraic/Fan/TorusAction/Action.html#TauCeti.Toric.Fan.algebraicRealizationModObj)). Chart inclusions and toric maps are equivariant, and products of fans give fibre products of schemes and product actions. This is what lets the comparison be equivariant.
- **The standard fans**: the projective-space fan realizes complex projective space with its homogeneous-ratio atlas ([`projectiveSpaceDiffeomorph`](https://taucetiproject.org/docs/TauCeti/Geometry/Toric/Analytic/Fan/ProjectiveSpace/Manifold.html#TauCeti.Toric.projectiveSpaceDiffeomorph)). The affine-space fan gives ℂ^n and, as a scheme, affine space, and the zero-cone fan gives the torus. The projective line is the one-point compactification of ℂ, and the plane blow-up is the classical incidence locus. These examples test the general theory against the textbook objects.

### Roadmap coverage

All eight layers are done. Layers 1, 2, 3G and 3 were already complete. Layer 0 is now finished: the affine torus actions glue to a global action on the fan scheme, and the fan scheme of a product is the fibre product. Layer 4 gained equivariance of character functions, multiplicity one and transversality of the boundary, and its naturality under products. Layer 5 gained proper star subdivisions and a product biholomorphism, with properness of product maps characterized factorwise. Layer 6 gained torus equivariance and naturality for characters, products, orbits and boundary components, and the algebraic form of compactness iff completeness.

## The frontier

- **Acceptance audit**: the remaining step is to check the README's acceptance list item by item. Most checks have direct witnesses: the √2 map is rejected as a lattice, and the affine ray, zero cone, projective space, product and star-subdivision examples are in place. The claim that the comparison respects homogeneous-coordinate monomials on projective space is not stated as a single theorem in the supplied material.
- **Projective space as a scheme**: the affine-space fan scheme is identified with affine space over Spec ℂ, and the projective-space fan has compact complex points. No identification of its fan scheme with a projective scheme is established here. This lies outside the roadmap's stated targets.
- **Blow-ups beyond the plane**: the incidence-locus description is proved only for the plane at the origin, and only as a homeomorphism through a holomorphic proper map. General star subdivisions have properness, the exceptional divisor and the biholomorphism away from it, but no incidence model.
