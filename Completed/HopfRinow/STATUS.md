<!--tauceti-status:v1 {"roadmap":"HopfRinow","to_sha":"e8ea0d187d0e20fa24ab5f68cfc27b2d40b876bd","ts":"2026-10-25T17:19:50Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","state":"done"},{"id":"Layer 1","remaining":"joint (p, x) smoothness of family connection coefficients, restriction of the nondegenerate connection to open sets, and the variation formula stated for metric families","state":"partial"},{"id":"Layer 2","state":"done"},{"id":"Layer 3","state":"done"},{"id":"Layer 4","state":"done"}],"readme_sha":"cbc35fab90e4e6bd5c0758e02afb1d89ec4c73d7487a0519ef00df7a7741ac48","roadmap":"HopfRinow","to_sha":"e8ea0d187d0e20fa24ab5f68cfc27b2d40b876bd"}-->
# Status: HopfRinow

This file documents the status of the HopfRinow roadmap up until `e8ea0d1` (2026-10-25T17:19:50Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The Hopf–Rinow theorem, do Carmo's compactness corollary and the Riemannian theory beneath them are proved, so Layers 0, 2, 3 and 4 are done. Layer 1 is nearly done. The nondegenerate Levi-Civita connection now exists, is smooth and natural, and has its variation formula. What remains is joint parameter smoothness for metric families, restriction to open sets, and tying the variation formula to the family structure.

### Named results

- **The Hopf–Rinow theorem** — for a point `p` of a Riemannian manifold whose metric is the Riemannian distance, five conditions are equivalent: `exp_p` is defined on all of `T_p M`, the manifold is proper, it is complete, every geodesic runs for all time, and it has a compact exhaustion along which distance from `p` diverges ([`TauCeti.Manifold.tfae_expDomain_eq_univ`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Manifold/Riemannian/Geodesic/HopfRinow.html#TauCeti.Manifold.tfae_expDomain_eq_univ)).
- **Compact manifolds are geodesically complete** — do Carmo's Corollary 2.9, proved through the extended metric and so without a connectedness hypothesis ([`TauCeti.Manifold.isGeodesicallyCompleteAt_of_compactSpace`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Manifold/Riemannian/Geodesic/Compact.html#TauCeti.Manifold.isGeodesicallyCompleteAt_of_compactSpace)).
- **The Gauss lemma** — the differential of `exp_p` preserves inner products with the radial direction on its whole domain ([`TauCeti.Manifold.inner_mfderiv_riemannianExp_radial`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Manifold/Riemannian/Geodesic/Gauss/Basic.html#TauCeti.Manifold.inner_mfderiv_riemannianExp_radial)). From it, minimizers inside normal neighbourhoods are radial geodesics.
- **The variational characterization of geodesics** — a `C^n` curve, `2 ≤ n ≤ ∞`, is critical for energy among fixed-endpoint variations exactly when it is a geodesic ([`TauCeti.Manifold.isEnergyCritical_iff_isGeodesicCurveOn`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Manifold/Riemannian/Geodesic/FirstVariation.html#TauCeti.Manifold.isEnergyCritical_iff_isGeodesicCurveOn)).
- **The first variation of the Levi-Civita connection** — for a jointly `C²` real-parameter family of nondegenerate metrics with `h = ∂_t g`, `2g((∂_t∇)_X Y, Z) = (∇_X h)(Y, Z) + (∇_Y h)(X, Z) − (∇_Z h)(X, Y)` ([`TauCeti.Manifold.two_mul_apply_deriv_eq_derivBilinearTensor_of_isLeviCivitaConnection`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/VectorBundle/CovariantDerivative/LeviCivita/Nondegenerate/Variation.html#TauCeti.Manifold.two_mul_apply_deriv_eq_derivBilinearTensor_of_isLeviCivitaConnection)). This is the input that Lorentzian metric variation needs.

### Notable definitions and infrastructure

- The nondegenerate Levi-Civita connection ([`TauCeti.Manifold.ContMDiffNondegenerateMetric.leviCivitaConnection`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/VectorBundle/CovariantDerivative/LeviCivita/Nondegenerate/Existence.html#TauCeti.Manifold.ContMDiffNondegenerateMetric.leviCivitaConnection)) is built from the Koszul formula for any smooth symmetric nondegenerate metric. It is torsion-free, metric compatible, unique and `C^∞`. It commutes with local isometries, and for positive metrics it agrees with Mathlib's Riemannian connection.
- The exponential map ([`TauCeti.Manifold.riemannianExp`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Manifold/Riemannian/Geodesic/Exponential.html#TauCeti.Manifold.riemannianExp)) is defined through maximal geodesics of the smooth spray. It is smooth on its open star-shaped domain, and its local inverse gives normal coordinates.
- Smooth nondegenerate metric families ([`TauCeti.Manifold.ContMDiffNondegenerateMetricFamily`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/VectorBundle/NondegenerateMetric/Family.html#TauCeti.Manifold.ContMDiffNondegenerateMetricFamily)) are sections over `P × M`, with restriction along parameter maps and fixed signature on each connected component.

### Roadmap coverage

**Layers 0, 2, 3 and 4 are done, and so are both worked examples.** Layer 0 has the reconciled distance, and since this window it also has total variation equal to length. Layer 2 has normal neighbourhoods, the Gauss lemma and minimizer rigidity. Layer 3 has the full equivalence. Layer 4 has the compactness corollary and isometry transport. **Layer 1 is done for Riemannian metrics and partial for the nondegenerate supplier.** Existence, uniqueness, smoothness, Koszul and Christoffel formulas, the positive-definite comparison, naturality under local isometries, the along-curve product rule and parallel transport are all in. So are the family carrier with its signature results and the variation formula for real-parameter families. Three pieces are missing: joint smoothness of the connection coefficients in `(p, x)` over `P × M`, restriction of the nondegenerate connection to open sets, and the variation formula restated for the family structure along a smooth parameter curve.

## The frontier

- **Joint parameter smoothness** — prove that the Levi-Civita connection coefficients of a smooth metric family are jointly `C^∞` in `(p, x)`. So far only differentiability in a real parameter at a point is proved.
- **The variation formula for families** — restrict a `ContMDiffNondegenerateMetricFamily` along a smooth curve `t ↦ p(t)` and derive the existing `C²` variation formula for it. The family structure and the variation theorem are not yet connected.
- **Restriction to open sets** — restate the nondegenerate connection on an open submanifold and show that it agrees with the restriction of the ambient connection.
- **Metric isometries** — the README deliberately leaves out the Myers–Steenrod theorem, that a distance-preserving bijection is a smooth isometry. Transport for bare metric isometries would need it as a separate milestone.
