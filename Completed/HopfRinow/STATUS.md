<!--tauceti-status:v1 {"roadmap":"HopfRinow","to_sha":"7ca783d4c8d324c9c74efaacd641c8a40f69f284","ts":"2026-11-09T03:33:42Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","state":"done"},{"id":"Layer 1","state":"done"},{"id":"Layer 2","state":"done"},{"id":"Layer 3","state":"done"},{"id":"Layer 4","state":"done"}],"readme_sha":"8e6b010eab9c03760610b1d366e816d1e1aabbee9a8c045d599e352ec581c6d1","roadmap":"HopfRinow","to_sha":"7ca783d4c8d324c9c74efaacd641c8a40f69f284"}-->
# Status: HopfRinow

This file documents the status of the HopfRinow roadmap up until `7ca783d` (2026-11-09T03:33:42Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The roadmap is complete. The Hopf–Rinow theorem and do Carmo's compactness corollary are proved, along with the Riemannian theory beneath them. The nondegenerate Levi-Civita supplier is finished too: joint smoothness for metric families, restriction to open sets, and the variation formula along parameter curves. All five layers are done.

### Named results

- **The Hopf–Rinow theorem** — for a point `p` of a Riemannian manifold whose metric is the Riemannian distance, five conditions are equivalent: `exp_p` is defined on all of `T_p M`, the manifold is proper, it is complete, every geodesic runs for all time, and it has a compact exhaustion along which distance from `p` diverges ([`TauCeti.Manifold.tfae_expDomain_eq_univ`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Manifold/Riemannian/Geodesic/HopfRinow.html#TauCeti.Manifold.tfae_expDomain_eq_univ)).
- **Compact manifolds are geodesically complete** — do Carmo's Corollary 2.9, proved through the extended metric and so without a connectedness hypothesis ([`TauCeti.Manifold.isGeodesicallyCompleteAt_of_compactSpace`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Manifold/Riemannian/Geodesic/Compact.html#TauCeti.Manifold.isGeodesicallyCompleteAt_of_compactSpace)).
- **The Gauss lemma** — the differential of `exp_p` preserves inner products with the radial direction on its whole domain, so minimizers inside normal neighbourhoods are radial geodesics ([`TauCeti.Manifold.inner_mfderiv_riemannianExp_radial`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Manifold/Riemannian/Geodesic/Gauss/Basic.html#TauCeti.Manifold.inner_mfderiv_riemannianExp_radial)).
- **The variational characterization of geodesics** — a `C^n` curve, `2 ≤ n ≤ ∞`, is critical for energy among fixed-endpoint variations exactly when it is a geodesic ([`TauCeti.Manifold.isEnergyCritical_iff_isGeodesicCurveOn`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Manifold/Riemannian/Geodesic/FirstVariation.html#TauCeti.Manifold.isEnergyCritical_iff_isGeodesicCurveOn)).
- **The first variation of the Levi-Civita connection** — for a smooth family of nondegenerate metrics over any parameter manifold, restricted along a curve that is `C²` at `t`, with `h` the intrinsic first variation, `2g((∂_t∇)_X Y, Z) = (∇_X h)(Y, Z) + (∇_Y h)(X, Z) − (∇_Z h)(X, Y)` ([`ContMDiffNondegenerateMetricFamily.two_mul_apply_deriv_eq_derivBilinearTensor_of_isLeviCivitaConnection`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/VectorBundle/CovariantDerivative/LeviCivita/Nondegenerate/Variation.html#TauCeti.Manifold.ContMDiffNondegenerateMetricFamily.two_mul_apply_deriv_eq_derivBilinearTensor_of_isLeviCivitaConnection)). This is the input that Lorentzian metric variation needs.

### Notable definitions and infrastructure

- The nondegenerate Levi-Civita connection ([`TauCeti.Manifold.ContMDiffNondegenerateMetric.leviCivitaConnection`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/VectorBundle/CovariantDerivative/LeviCivita/Nondegenerate/Existence.html#TauCeti.Manifold.ContMDiffNondegenerateMetric.leviCivitaConnection)) is built from the Koszul formula for any smooth symmetric nondegenerate metric. It is torsion-free, metric compatible, unique and `C^∞`, and it commutes with local isometries and with restriction to open submanifolds. For positive metrics it agrees with Mathlib's Riemannian connection.
- The exponential map ([`TauCeti.Manifold.riemannianExp`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Manifold/Riemannian/Geodesic/Exponential.html#TauCeti.Manifold.riemannianExp)) is defined through maximal geodesics of the smooth spray. It is smooth on its open star-shaped domain, and its local inverse gives normal coordinates.
- Smooth nondegenerate metric families over `P × M` carry an intrinsic first variation ([`ContMDiffNondegenerateMetricFamily.variation`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/VectorBundle/NondegenerateMetric/Variation.html#TauCeti.Manifold.ContMDiffNondegenerateMetricFamily.variation)) with a chain rule. Their Levi-Civita connections are jointly regular in `(p, x)`, losing one derivative ([`ContMDiffNondegenerateMetricFamily.contMDiff_covariantDerivative_of_isLeviCivitaConnection`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/VectorBundle/CovariantDerivative/LeviCivita/Nondegenerate/Regularity.html#TauCeti.Manifold.ContMDiffNondegenerateMetricFamily.contMDiff_covariantDerivative_of_isLeviCivitaConnection)).

### Roadmap coverage

**All five layers are done, and so are both worked examples.** Layer 0 has the reconciled distance, with total variation equal to length and arc-length reparametrization of regular curves. Layer 1 has the geodesic spray, flow and exponential map. It also has the full nondegenerate supplier: existence, uniqueness, smoothness, Christoffel formulas, naturality, restriction to open sets, joint family regularity and the variation formula along smooth parameter curves. Layer 2 has normal neighbourhoods, the Gauss lemma and minimizer rigidity. Layer 3 has the full equivalence. Layer 4 has the compactness corollary and isometry transport.

## The frontier

- **Metric isometries** — the README deliberately leaves out the Myers–Steenrod theorem, that a distance-preserving bijection is a smooth isometry. Transport for bare metric isometries would need it as a separate milestone.
- **Downstream consumers** — the cut locus, injectivity radius and comparison theory belong to the Riemannian Geometry roadmap. Lorentzian metric variation belongs to the local variational field theory roadmap. Their inputs from this roadmap are now in place.
