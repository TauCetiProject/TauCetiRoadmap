<!--tauceti-status:v1 {"roadmap":"HopfRinow","to_sha":"d449639f1b74653bfd5b329b4dfbde888857888d","ts":"2026-10-02T05:38:42Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","state":"done"},{"id":"Layer 1","state":"done"},{"id":"Layer 2","state":"done"},{"id":"Layer 3","state":"done"},{"id":"Layer 4","state":"done"}],"readme_sha":"be763410b661b0f5e57ecf4a98a5f2a84c78ccc46978ddbf19718bc77618c106","roadmap":"HopfRinow","to_sha":"d449639f1b74653bfd5b329b4dfbde888857888d"}-->
# Status: HopfRinow

This file documents the status of the HopfRinow roadmap up until `d449639` (2026-10-02T05:38:42Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Every layer is done. The Hopf–Rinow theorem and do Carmo's compactness corollary sit on a complete geodesic, exponential-map and normal-neighbourhood theory. The variational characterization of geodesics and transport along smooth Riemannian isometries, the last two open pieces, are now proved.

### Named results

- **The Hopf–Rinow theorem** — for a point `p` of a Riemannian manifold whose metric is the Riemannian distance, five conditions are equivalent: `exp_p` is defined on all of `T_p M`, the manifold is proper, it is complete, every geodesic runs for all time, and it has a compact exhaustion along which distance from `p` diverges ([`TauCeti.Manifold.tfae_expDomain_eq_univ`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Manifold/Riemannian/Geodesic/HopfRinow.html#TauCeti.Manifold.tfae_expDomain_eq_univ)). An everywhere-defined `exp_p` also joins `p` to each point by a minimizing geodesic ([`TauCeti.Manifold.exists_isGeodesicCurveOn_Icc_pathELength_eq_edist`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Manifold/Riemannian/Geodesic/Minimizing.html#TauCeti.Manifold.exists_isGeodesicCurveOn_Icc_pathELength_eq_edist)).
- **Compact manifolds are geodesically complete** — this is do Carmo's Corollary 2.9. The proof goes through the extended metric, so it needs no connectedness hypothesis ([`TauCeti.Manifold.isGeodesicallyCompleteAt_of_compactSpace`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Manifold/Riemannian/Geodesic/Compact.html#TauCeti.Manifold.isGeodesicallyCompleteAt_of_compactSpace)).
- **The variational characterization of geodesics** — on a boundaryless manifold, a `C²` curve is a critical point of energy among fixed-endpoint variations exactly when it is a geodesic on the open interval ([`TauCeti.Manifold.isEnergyCritical_iff_isGeodesicCurveOn`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Manifold/Riemannian/Geodesic/FirstVariation.html#TauCeti.Manifold.isEnergyCritical_iff_isGeodesicCurveOn)).
- **The Gauss lemma** — the differential of `exp_p` preserves inner products with the radial direction everywhere on its domain ([`TauCeti.Manifold.inner_mfderiv_riemannianExp_radial`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Manifold/Riemannian/Geodesic/Gauss/Basic.html#TauCeti.Manifold.inner_mfderiv_riemannianExp_radial)). From it, a minimizer inside a normal neighbourhood is the radial geodesic up to monotone reparametrization.
- **Do Carmo's distance is Mathlib's distance** — the infimum of lengths over piecewise-`C¹` paths equals `Manifold.riemannianEDist`, by corner smoothing ([`TauCeti.Manifold.riemannianEDist_eq_iInf_pathELength_piecewise`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Manifold/Riemannian/EDistComparison.html#TauCeti.Manifold.riemannianEDist_eq_iInf_pathELength_piecewise)).

### Notable definitions and infrastructure

- The exponential map ([`TauCeti.Manifold.riemannianExp`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Manifold/Riemannian/Geodesic/Exponential.html#TauCeti.Manifold.riemannianExp)) is defined through maximal geodesics of the smooth geodesic spray. The maximal flow is smooth jointly in initial data and time on its open domain ([`TauCeti.Manifold.contMDiffOn_maximalGeodesic`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Manifold/Riemannian/Geodesic/Flow.html#TauCeti.Manifold.contMDiffOn_maximalGeodesic)), so `exp` is smooth on its open, star-shaped domain, even as a map on `TM`.
- A normal domain ([`TauCeti.Manifold.IsNormalDomain`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Manifold/Riemannian/Geodesic/Normal.html#TauCeti.Manifold.IsNormalDomain)) packages `exp_p` and the Riemannian logarithm as a partial diffeomorphism. All of the local minimization, rigidity and escape statements are phrased on it.
- Smooth Riemannian isometries ([`TauCeti.RiemannianIsometry`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Manifold/Riemannian/Isometry/Basic.html#TauCeti.RiemannianIsometry)) intertwine exponential maps, `Φ ∘ exp_p = exp_{Φ p} ∘ dΦ_p` ([`TauCeti.RiemannianIsometry.riemannianExp_mfderiv`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Manifold/Riemannian/Isometry/Exponential.html#TauCeti.RiemannianIsometry.riemannianExp_mfderiv)). They also carry geodesics, maximal intervals, distance and completeness. This is the interface that the constant-curvature model spaces need.

### Roadmap coverage

**All five layers are done, and so are both worked examples.** Layer 0 settles the distance convention, and Layer 1 runs from the Levi-Civita connection to the exponential map and `(a_p) ↔ (d_p)`. Layer 2 now includes the full variational characterization, with criticality defined through fixed-endpoint variations. Layer 3 has the full equivalence, `(a_p) ⇒ (f_p)` and base-point propagation. Layer 4 has the compactness corollary, the length-space and geodesic-space API, and isometry transport of geodesics, maximal intervals, exponential maps and completeness. In Euclidean space, geodesics on any interval are affine segments. The open unit ball in `ℝ` has minimizing radial segments, but its unit-speed geodesics from the centre reach the boundary at time `1`.

## The frontier

- **Nothing remains on this roadmap.** Every milestone in the README is proved and the Riemannian source tree contains no `sorry`. Further work belongs downstream, starting with the constant-curvature model spaces, which can now consume isometry transport.
- **Metric isometries** — the README deliberately leaves out the Myers–Steenrod theorem, that a distance-preserving bijection is a smooth Riemannian isometry. Transport for a bare metric `IsometryEquiv` would need it as a separate milestone.
