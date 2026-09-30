<!--tauceti-status:v1 {"roadmap":"HopfRinow","to_sha":"e440f4eb3fccf5479ede3f5d6a671b4be37c9dde","ts":"2026-09-30T05:46:25Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","state":"done"},{"id":"Layer 1","state":"done"},{"id":"Layer 2","remaining":"define criticality for fixed-endpoint variations and prove that critical curves of the energy are geodesics","state":"partial"},{"id":"Layer 3","state":"done"},{"id":"Layer 4","remaining":"smooth Riemannian isometries preserve geodesics, maximal intervals and exponential-map values","state":"partial"}],"readme_sha":"be763410b661b0f5e57ecf4a98a5f2a84c78ccc46978ddbf19718bc77618c106","roadmap":"HopfRinow","to_sha":"e440f4eb3fccf5479ede3f5d6a671b4be37c9dde"}-->
# Status: HopfRinow

This file documents the status of the HopfRinow roadmap up until `e440f4e` (2026-09-30T05:46:25Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The summit is reached: the Hopf–Rinow theorem and do Carmo's compactness corollary are proved, on top of a complete geodesic, exponential-map and normal-neighbourhood theory. Two pieces remain. The variational characterization of geodesics has only its "geodesic ⇒ critical" half, and Riemannian isometries are not yet shown to carry geodesics or exponential maps.

### Named results

- **The Hopf–Rinow theorem** — for a point `p` of a Riemannian manifold whose metric is the Riemannian distance, five conditions are equivalent: `exp_p` is defined on all of `T_p M`, the manifold is proper, it is complete, every geodesic runs for all time, and it has a compact exhaustion along which distance from `p` diverges ([`TauCeti.Manifold.tfae_expDomain_eq_univ`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Manifold/Riemannian/Geodesic/HopfRinow.html#TauCeti.Manifold.tfae_expDomain_eq_univ)). An everywhere-defined `exp_p` also joins `p` to each point by a minimizing geodesic ([`TauCeti.Manifold.exists_isGeodesicCurveOn_Icc_pathELength_eq_edist`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Manifold/Riemannian/Geodesic/Minimizing.html#TauCeti.Manifold.exists_isGeodesicCurveOn_Icc_pathELength_eq_edist)).
- **Compact manifolds are geodesically complete** — do Carmo's Corollary 2.9. The proof goes through the extended metric, so it needs no connectedness hypothesis ([`TauCeti.Manifold.isGeodesicallyCompleteAt_of_compactSpace`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Manifold/Riemannian/Geodesic/Compact.html#TauCeti.Manifold.isGeodesicallyCompleteAt_of_compactSpace)).
- **The Gauss lemma** — the differential of `exp_p` preserves inner products with the radial direction everywhere on its domain ([`TauCeti.Manifold.inner_mfderiv_riemannianExp_radial`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Manifold/Riemannian/Geodesic/Gauss/Basic.html#TauCeti.Manifold.inner_mfderiv_riemannianExp_radial)).
- **Minimizers in a normal neighbourhood are radial geodesics** — a curve from the centre that is as short as the radial segment is that segment composed with a nondecreasing surjection of `[0, 1]` ([`TauCeti.Manifold.IsNormalDomain.exists_monotoneOn_eq_riemannianExp_smul_of_pathELength_eq`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Manifold/Riemannian/Geodesic/Gauss/Rigidity.html#TauCeti.Manifold.IsNormalDomain.exists_monotoneOn_eq_riemannianExp_smul_of_pathELength_eq)).
- **Do Carmo's distance is Mathlib's distance** — the infimum of lengths over piecewise-`C¹` paths equals `Manifold.riemannianEDist`, by corner smoothing ([`TauCeti.Manifold.riemannianEDist_eq_iInf_pathELength_piecewise`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Manifold/Riemannian/EDistComparison.html#TauCeti.Manifold.riemannianEDist_eq_iInf_pathELength_piecewise)).

### Notable definitions and infrastructure

- The geodesic spray `(x, v) ↦ (v, -Γ_x(v, v))` ([`TauCeti.Manifold.geodesicSpray`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Manifold/Riemannian/Geodesic/Spray.html#TauCeti.Manifold.geodesicSpray)) is chart-independent and smooth. Its integral curves are the velocity lifts of geodesics, and a new smooth-dependence theorem for ODE flows turns it into the smooth local geodesic flow ([`TauCeti.Manifold.exists_contMDiffAt_localGeodesicFlow`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Manifold/Riemannian/Geodesic/Flow.html#TauCeti.Manifold.exists_contMDiffAt_localGeodesicFlow)).
- The exponential map ([`TauCeti.Manifold.riemannianExp`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Manifold/Riemannian/Geodesic/Exponential.html#TauCeti.Manifold.riemannianExp)) is defined through maximal geodesics on an open, star-shaped natural domain. It is smooth there and a local diffeomorphism at the origin.
- A normal domain ([`TauCeti.Manifold.IsNormalDomain`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Manifold/Riemannian/Geodesic/Normal.html#TauCeti.Manifold.IsNormalDomain)) packages `exp_p` and the Riemannian logarithm as a partial diffeomorphism. Normal balls exist, and every minimization and escape statement is phrased on them.

### Roadmap coverage

**Layers 0, 1 and 3 are done.** Layer 0 gained its two loose ends: arc-length reparametrization of a regular curve, and lower semicontinuity of `pathELength` under uniform convergence to a `C¹` limit. In Layer 1 the Levi-Civita connection now comes from Mathlib's `CovariantDerivative.leviCivitaConnection`, with Tau Ceti supplying its regularity. Layer 1 then runs through the spray, local existence and uniqueness, the flow, maximal intervals, homogeneity, the exponential-map API, the derivative at zero, and `(a_p) ↔ (d_p)`. Layer 3 has the full equivalence, `(a_p) ⇒ (f_p)`, and base-point propagation.

**Layer 2 is done except one direction of the variational characterization.** It has normal neighbourhoods and the logarithm, the Gauss lemma with its polar inequality, ball-internal minimization against piecewise-`C¹` competitors with both uniqueness statements, the escape estimate and the local distance identity. The first-variation formula is proved, but only its "geodesic ⇒ critical" half; there is no definition of criticality and no converse.

**Layer 4 is partial.** The compactness corollary is done. The length-space and geodesic-space API is also done, including that a complete Riemannian manifold is a geodesic space. Isometry transport covers distance, the Levi-Civita connection, along-curve derivatives and completeness, including `expDomain p = univ`. It does not yet cover geodesics, maximal intervals, or the values of `exp`.

**Both worked examples are done.** In Euclidean space geodesics are affine lines, `exp` is translation and `log` is subtraction. The open unit ball in `ℝ` has minimizing radial segments but is neither complete, nor proper, nor geodesically complete.

## The frontier

- **Critical points of energy are geodesics** — define criticality as a vanishing derivative for every fixed-endpoint variation. Then prove the converse of [`TauCeti.Manifold.IsGeodesicCurveOn.hasDerivAt_energy_zero`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Geometry/Manifold/Riemannian/Geodesic/FirstVariation.html#TauCeti.Manifold.IsGeodesicCurveOn.hasDerivAt_energy_zero): build variations whose field is a bump times the covariant acceleration, and apply the fixed-endpoint first-variation formula.
- **Isometries carry geodesics and exponential maps** — naturality of velocity and of the along-curve derivative is in place. What remains is to show that `Φ ∘ γ` is a geodesic whenever `γ` is, and then to deduce equality of maximal intervals and `Φ (exp_p v) = exp_{Φ p} (dΦ v)`. The constant-curvature model spaces downstream consume this.
