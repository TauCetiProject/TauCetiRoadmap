<!--tauceti-status:v1 {"roadmap":"Yamabe","to_sha":"93d1fe508e122e53ce5538a8a3994c290753f127","ts":"2026-10-26T01:30:01Z"}-->
# Status: Yamabe

This file documents the status of the Yamabe roadmap up until `93d1fe5` (2026-10-26T01:30:01Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Only the foundations are under way. Y0 (conformal tensors and the conformal Laplacian) is well advanced: it now includes the scalar-curvature transformation law and the Yamabe equation. Y2 has the bubbles but not the sharp inequality. The analytic interfaces, the variational and blow-up theory, and every existence theorem (Y1, Y3–Y10) have not begun.

### Named results

- **The scalar curvature of a conformal metric**: [`scalarCurvature_rescale_eq_rpow_mul_conformalLaplacian`](https://taucetiproject.org/docs/TauCeti/Analysis/PDE/Yamabe/ConformalLaplacian.html#TauCeti.Yamabe.scalarCurvature_rescale_eq_rpow_mul_conformalLaplacian) — for ĝ = u^(4/(n−2))g with u positive, Scal_ĝ = u^(−(n+2)/(n−2)) L_g u. As a consequence ([`scalarCurvature_rescale_eq_iff_conformalLaplacian_eq`](https://taucetiproject.org/docs/TauCeti/Analysis/PDE/Yamabe/ConformalLaplacian.html#TauCeti.Yamabe.scalarCurvature_rescale_eq_iff_conformalLaplacian_eq)), ĝ has scalar curvature c exactly when L_g u = c u^(p_n−1).
- **Total scalar curvature in a conformal class**: [`integral_scalarCurvature_rescale_div_riemannianTotalVolume_rpow`](https://taucetiproject.org/docs/TauCeti/Analysis/PDE/Yamabe/TotalScalarCurvature.html#TauCeti.Yamabe.integral_scalarCurvature_rescale_div_riemannianTotalVolume_rpow) — on compact M, the volume-normalised total scalar curvature of ĝ equals ∫u L_g u / (∫u^(p_n))^(2/p_n). This is the Yamabe quotient before integration by parts, for smooth positive u only.
- **The Weyl tensor is conformally invariant**: [`weylTensor_leviCivitaConnection_rescale`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/VectorBundle/CovariantDerivative/Curvature/Conformal.html#Bundle.ContMDiffRiemannianMetric.weylTensor_leviCivitaConnection_rescale) — W^(fg) = f W^g as a (0,4)-tensor away from dimension two. Consequently a locally conformally flat metric has vanishing Weyl tensor ([`IsLocallyConformallyFlat.weylTensor_eq_zero`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/VectorBundle/CovariantDerivative/Curvature/ConformallyFlat.html#Bundle.ContMDiffRiemannianMetric.IsLocallyConformallyFlat.weylTensor_eq_zero)), which is the easy half of Weyl–Schouten.
- **The bubbles attain the sphere's Yamabe constant**: [`conformalCoefficient_mul_integral_norm_fderiv_bubble_sq_eq_sphereYamabeConstant`](https://taucetiproject.org/docs/TauCeti/Analysis/PDE/Yamabe/Bubble/SobolevQuotient.html#TauCeti.Yamabe.conformalCoefficient_mul_integral_norm_fderiv_bubble_sq_eq_sphereYamabeConstant) — every bubble gives equality a_n∫|dU|² = Y(Sⁿ)(∫U^(p_n))^(2/p_n). This is the equality case of the sharp Sobolev inequality, not the inequality itself.
- **The area of the round sphere**: [`roundSphereVolume_eq_two_mul_pi_rpow_div_Gamma`](https://taucetiproject.org/docs/TauCeti/Geometry/Euclidean/Volume/Sphere.html#TauCeti.roundSphereVolume_eq_two_mul_pi_rpow_div_Gamma) — |Sⁿ| = 2π^((n+1)/2)/Γ((n+1)/2) for the normalised Hausdorff measure.

### Notable definitions and infrastructure

- [`conformalLaplacian`](https://taucetiproject.org/docs/TauCeti/Analysis/PDE/Yamabe/ConformalLaplacian.html#TauCeti.Yamabe.conformalLaplacian) — L_g = a_nΔ⁺_g + Scal_g with the roadmap's conventions. The transformation law and every Yamabe equation are stated through it.
- [`IsLocallyConformallyFlat`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/VectorBundle/CovariantDerivative/Curvature/ConformallyFlat.html#Bundle.ContMDiffRiemannianMetric.IsLocallyConformallyFlat) — a metric is locally conformally flat if some global positive factor makes it flat near each point. It is shown to be a conformal-class property and to hold for conformally Euclidean metrics. This is the notion consumed by Y4.4, Y6 and Y8.
- [`cottonTensor`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/VectorBundle/CovariantDerivative/Curvature/Cotton.html#CovariantDerivative.cottonTensor) — C(X,Y,Z) = (∇_Z P)(X,Y) − (∇_Y P)(X,Z), with its antisymmetry, cyclic identity and vanishing in constant curvature. It is the three-dimensional obstruction in Weyl–Schouten.

### Roadmap coverage

Y0 is partial. The smooth conformal identities are in place: the connection, curvature, Schouten, Weyl and scalar laws under conformal change (Y0.1–Y0.2), the conformal class and the volume identity (Y0.3), and the Euclidean, stereographic and sphere-area computations (Y0.4). The following are still missing:
- the operator identity L_ĝ(v) = u^(−(n+2)/(n−2))L_g(uv);
- the integration-by-parts energy identity, the quotient Q and its conformal invariance on H¹;
- the Euler–Lagrange equivalence;
- the conformal law for Cotton and div W = (n−3)C;
- the converse direction of Weyl–Schouten, and any comparison of local conformal flatness with conformal coordinate charts.

The Hessian and inverse-rescaling specialisations of Y0.1 are not established here. Y2 is partial: Y2.3's bubble calculus is largely present, and the sharp inequality, its equality classification and the manifold transfer are untouched. Y1 and Y3–Y10 are untouched.

## The frontier

- **The conformal Laplacian's operator identity and the Yamabe quotient** — prove L_ĝ(v) = u^(−(n+2)/(n−2))L_g(uv), integrate by parts to the energy form, define Q_g and prove Q_ĝ(v) = Q_g(uv). The pointwise scalar law is now present. The weak-domain statement waits on Y1's Sobolev carrier.
- **The converse of Weyl–Schouten** — show that W = 0 (n ≥ 4) or C = 0 (n = 3) implies local conformal flatness, through the first-jet system Hess f = P + df⊗df − |df|²g/2 and local Frobenius. This first needs the Cotton conformal law and div W = (n−3)C.
- **Critical points of the quotient** — identify critical points of Q with weak solutions of L_g u = λ|u|^(p_n−2)u. The integrated Yamabe equation gives the smooth positive case of λ = Q at unit norm.
- **The sharp Euclidean Sobolev inequality** — with the extremals' energy computed, what remains is a_n∫|du|² ≥ Y(Sⁿ)‖u‖²_{p_n} on D¹,² and the classification of its equality cases (Y2.1–Y2.2).
- **Closed-manifold Sobolev interfaces** — Y1's H¹/Lᵖ adapters, compact embeddings and the first eigenvalue of L_g. These depend on the PDE and K5a supplier lanes.
