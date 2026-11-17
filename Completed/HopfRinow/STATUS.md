<!--tauceti-status:v1 {"roadmap":"HopfRinow","to_sha":"aa6e43e14b2556add36c8149e543f059a45926d3","ts":"2026-11-13T23:20:12Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","state":"done"},{"id":"Layer 1","state":"done"},{"id":"Layer 2","state":"done"},{"id":"Layer 3","state":"done"},{"id":"Layer 4","state":"done"}],"readme_sha":"8e6b010eab9c03760610b1d366e816d1e1aabbee9a8c045d599e352ec581c6d1","roadmap":"HopfRinow","to_sha":"aa6e43e14b2556add36c8149e543f059a45926d3"}-->
# Status: HopfRinow

This file documents the status of the HopfRinow roadmap up until `aa6e43e` (2026-11-13T23:20:12Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** All five layers and both worked examples are complete, including the Hopf–Rinow equivalence and the nondegenerate Levi-Civita theory for metric families. No required layer remains partial or untouched; the full smoothness theorem for bare metric isometries remains outside the completed specification.

### Named results

- **The Hopf–Rinow theorem** — on a connected finite-dimensional smooth boundaryless Riemannian manifold with its Riemannian distance, an everywhere-defined exponential map at one point, properness, metric completeness, global geodesic completeness and do Carmo's compact-exhaustion condition are equivalent ([`TauCeti.Manifold.tfae_expDomain_eq_univ`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Manifold/Riemannian/Geodesic/HopfRinow.html#TauCeti.Manifold.tfae_expDomain_eq_univ)).
- **Compact manifolds are geodesically complete** — do Carmo's compactness corollary holds without connectedness or an ordinary metric already installed, using the extended Riemannian distance ([`TauCeti.Manifold.isGeodesicallyCompleteAt_of_compactSpace`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Manifold/Riemannian/Geodesic/Compact.html#TauCeti.Manifold.isGeodesicallyCompleteAt_of_compactSpace)).
- **The Gauss lemma** — the differential of the exponential map preserves inner products with the radial direction on its natural domain, supplying the radial length comparison ([`TauCeti.Manifold.inner_mfderiv_riemannianExp_radial`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Manifold/Riemannian/Geodesic/Gauss/Basic.html#TauCeti.Manifold.inner_mfderiv_riemannianExp_radial)).
- **The variational characterization of geodesics** — for 2 ≤ n ≤ ∞, a Cⁿ curve is critical for energy among fixed-endpoint Cⁿ variations exactly when it is a geodesic on the open interval ([`TauCeti.Manifold.isEnergyCritical_iff_isGeodesicCurveOn`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Manifold/Riemannian/Geodesic/FirstVariation.html#TauCeti.Manifold.isEnergyCritical_iff_isGeodesicCurveOn)).
- **The first variation of the Levi-Civita connection** — for a smooth nondegenerate metric family over a parameter manifold, restricted along a curve that is C² at the parameter, h = ∂ₜg satisfies 2g((∂ₜ∇)ₓY,Z) = (∇ₓh)(Y,Z) + (∇ᵧh)(X,Z) − (∇𝓏h)(X,Y), for parameter-independent fields ([`TauCeti.Manifold.ContMDiffNondegenerateMetricFamily.two_mul_apply_deriv_eq_derivBilinearTensor_of_isLeviCivitaConnection`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/VectorBundle/CovariantDerivative/LeviCivita/Nondegenerate/Variation.html#TauCeti.Manifold.ContMDiffNondegenerateMetricFamily.two_mul_apply_deriv_eq_derivBilinearTensor_of_isLeviCivitaConnection)).

### Notable definitions and infrastructure

- The **nondegenerate Levi-Civita connection** covers indefinite signatures: the Koszul construction is torsion-free, metric compatible, unique and smooth, with naturality and restriction to open submanifolds ([`TauCeti.Manifold.ContMDiffNondegenerateMetric.leviCivitaConnection`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/VectorBundle/CovariantDerivative/LeviCivita/Nondegenerate/Existence.html#TauCeti.Manifold.ContMDiffNondegenerateMetric.leviCivitaConnection)).
- The **exponential map** comes from maximal geodesics of the smooth spray; its open star-shaped domain and local inverse provide normal coordinates ([`TauCeti.Manifold.riemannianExp`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Manifold/Riemannian/Geodesic/Exponential.html#TauCeti.Manifold.riemannianExp)).
- **Compact confinement of integral curves** gives existence for all time, extending the completeness machinery beyond the geodesic spray to general flows ([`maximalIntegralCurveInterval_eq_univ_of_isCompact_of_mapsTo`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/IntegralCurve/Maximal.html#maximalIntegralCurveInterval_eq_univ_of_isCompact_of_mapsTo)).

### Roadmap coverage

**Layers 0–4 are done.** Layer 0 reconciles piecewise-C¹ and C¹ distance, including corner smoothing, open-submanifold restriction, regular arc-length reparametrization and length limits. Layer 1 supplies the spray, smooth flow, maximal intervals and exponential map, together with the nondegenerate connection's existence, uniqueness, regularity, restriction, naturality, joint family regularity and parameter-curve variation formula. Layer 2 supplies normal neighbourhoods, the Gauss lemma, minimizing rigidity and energy criticality. Layer 3 proves the full equivalence and existence of minimizing segments. Layer 4 supplies the compactness corollary, metric length/geodesic-space interfaces and transport by smooth Riemannian isometries. The Euclidean and incomplete open-unit-ball examples are established.

## The frontier

- **Myers–Steenrod smoothness** — a distance-preserving bijection has not been shown here to be a smooth Riemannian isometry; this is a separate milestone beyond the README's requirements, although radial transport is available for minimizing segments into a complete target, subject to a target normal-neighbourhood bound ([`Isometry.apply_riemannianExp_smul`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Riemannian/Isometry/Radial.html#Isometry.apply_riemannianExp_smul)).
