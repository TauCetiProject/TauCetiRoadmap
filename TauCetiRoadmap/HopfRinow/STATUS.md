<!--tauceti-status:v1 {"roadmap":"HopfRinow","to_sha":"1d095894ac25298eb2a23398826c0f867b6d3164","ts":"2026-10-05T01:07:53Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","state":"done"},{"id":"Layer 1","state":"done"},{"id":"Layer 2","state":"done"},{"id":"Layer 3","state":"done"},{"id":"Layer 4","state":"done"}],"readme_sha":"be763410b661b0f5e57ecf4a98a5f2a84c78ccc46978ddbf19718bc77618c106","roadmap":"HopfRinow","to_sha":"1d095894ac25298eb2a23398826c0f867b6d3164"}-->
# Status: HopfRinow

This file documents the status of the HopfRinow roadmap up until `1d09589` (2026-10-05T01:07:53Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Every layer is done. The Hopf–Rinow theorem and do Carmo's compactness corollary rest on a complete theory of geodesics, the exponential map and normal neighbourhoods. The variational characterization of geodesics now holds at every smoothness level `C^n` with `2 ≤ n ≤ ∞`.

### Named results

- **The Hopf–Rinow theorem** — fix a point `p` of a Riemannian manifold whose metric is the Riemannian distance. Then five conditions are equivalent: `exp_p` is defined on all of `T_p M`, the manifold is proper, it is complete, every geodesic runs for all time, and it has a compact exhaustion along which distance from `p` diverges ([`TauCeti.Manifold.tfae_expDomain_eq_univ`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Manifold/Riemannian/Geodesic/HopfRinow.html#TauCeti.Manifold.tfae_expDomain_eq_univ)). An everywhere-defined `exp_p` also joins `p` to each point by a minimizing geodesic ([`TauCeti.Manifold.exists_isGeodesicCurveOn_Icc_pathELength_eq_edist`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Manifold/Riemannian/Geodesic/Minimizing.html#TauCeti.Manifold.exists_isGeodesicCurveOn_Icc_pathELength_eq_edist)).
- **Compact manifolds are geodesically complete** — this is do Carmo's Corollary 2.9. The proof goes through the extended metric, so it needs no connectedness hypothesis ([`TauCeti.Manifold.isGeodesicallyCompleteAt_of_compactSpace`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Manifold/Riemannian/Geodesic/Compact.html#TauCeti.Manifold.isGeodesicallyCompleteAt_of_compactSpace)).
- **The variational characterization of geodesics** — on a boundaryless `C^n` manifold with `2 ≤ n ≤ ∞`, a `C^n` curve is critical for energy among `C^n` fixed-endpoint variations exactly when it is a geodesic on the open interval ([`TauCeti.Manifold.isEnergyCritical_iff_isGeodesicCurveOn`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Manifold/Riemannian/Geodesic/FirstVariation.html#TauCeti.Manifold.isEnergyCritical_iff_isGeodesicCurveOn)).
- **The Gauss lemma** — the differential of `exp_p` preserves inner products with the radial direction everywhere on its domain ([`TauCeti.Manifold.inner_mfderiv_riemannianExp_radial`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Manifold/Riemannian/Geodesic/Gauss/Basic.html#TauCeti.Manifold.inner_mfderiv_riemannianExp_radial)). From it, a minimizer inside a normal neighbourhood is the radial geodesic up to monotone reparametrization.
- **Do Carmo's distance is Mathlib's distance** — the infimum of lengths over piecewise-`C¹` paths equals `Manifold.riemannianEDist`, which corner smoothing proves ([`TauCeti.Manifold.riemannianEDist_eq_iInf_pathELength_piecewise`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Manifold/Riemannian/EDistComparison.html#TauCeti.Manifold.riemannianEDist_eq_iInf_pathELength_piecewise)).

### Notable definitions and infrastructure

- The exponential map ([`TauCeti.Manifold.riemannianExp`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Manifold/Riemannian/Geodesic/Exponential.html#TauCeti.Manifold.riemannianExp)) is defined through maximal geodesics of the smooth geodesic spray. The maximal flow is smooth jointly in initial data and time on its open domain, so `exp` is smooth on its open, star-shaped domain.
- Covariant acceleration ([`CovariantDerivative.accelerationWithin`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Manifold/VectorBundle/CovariantDerivative/AlongCurve/Acceleration.html#CovariantDerivative.accelerationWithin)) is the single object through which the geodesic predicate, the chart equation `u'' + Γ(u', u') = 0`, the spray correspondence and the first variation formula are stated. A chain rule under reparametrization comes with it.
- Smooth Riemannian isometries ([`TauCeti.RiemannianIsometry`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Manifold/Riemannian/Isometry/Basic.html#TauCeti.RiemannianIsometry)) intertwine exponential maps, `Φ ∘ exp_p = exp_{Φ p} ∘ dΦ_p` ([`TauCeti.RiemannianIsometry.riemannianExp_mfderiv`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Manifold/Riemannian/Isometry/Exponential.html#TauCeti.RiemannianIsometry.riemannianExp_mfderiv)), and they carry geodesics, maximal intervals, distance and completeness. The constant-curvature model spaces need exactly this interface.

### Roadmap coverage

**All five layers are done, and so are both worked examples.** Layer 0 settles the distance convention. Layer 1 runs from the Levi-Civita connection, which is now also characterized by the Koszul formula, to the exponential map and `(a_p) ↔ (d_p)`. Layer 2 includes normal domains, the Gauss lemma, rigidity of minimizers and the full variational characterization. Layer 3 has the full equivalence, `(a_p) ⇒ (f_p)` and base-point propagation. Layer 4 has the compactness corollary, the length-space and geodesic-space API, and isometry transport. In Euclidean space geodesics are affine and `d exp` preserves every inner product. The open unit ball in `ℝ` has minimizing radial segments, but it is incomplete.

## The frontier

- **Nothing remains on this roadmap.** Every milestone in the README is proved. Further work belongs downstream, starting with the constant-curvature model spaces, which can now consume isometry transport.
- **Metric isometries** — the README deliberately leaves out the Myers–Steenrod theorem, that a distance-preserving bijection is a smooth Riemannian isometry. Transport for a bare metric `IsometryEquiv` would need it as a separate milestone.
