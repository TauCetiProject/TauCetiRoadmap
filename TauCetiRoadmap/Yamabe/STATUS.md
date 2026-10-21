<!--tauceti-status:v1 {"roadmap":"Yamabe","to_sha":"c1c6773446bac0f89a4abc381a38d2ab43040bc5","ts":"2026-10-21T00:36:19Z"}-->
# Status: Yamabe

This file documents the status of the Yamabe roadmap up until `c1c6773` (2026-10-21T00:36:19Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Only the foundations have started. Parts of Y0 (conformal tensors) and Y2 (the bubbles of sharp Euclidean Sobolev theory) are in place. The analytic interfaces, the variational and blow-up theory, and every existence theorem (Y1, Y3–Y10) have not begun.

### Named results

- **The bubbles attain the sphere's Yamabe constant**: [`conformalCoefficient_mul_integral_norm_fderiv_bubble_sq_eq_sphereYamabeConstant`](https://taucetiproject.org/docs/TauCeti/Analysis/PDE/Yamabe/Bubble/SobolevQuotient.html#TauCeti.Yamabe.conformalCoefficient_mul_integral_norm_fderiv_bubble_sq_eq_sphereYamabeConstant) — every bubble U_{t,b} gives a_n∫|dU|² = Y(Sⁿ)(∫U^(p_n))^(2/p_n). This is the equality case of the sharp Sobolev inequality, but not the inequality itself.
- **The bubble equation**: [`conformalLaplacian_bubble`](https://taucetiproject.org/docs/TauCeti/Analysis/PDE/Yamabe/ConformalLaplacian.html#TauCeti.Yamabe.conformalLaplacian_bubble) — every bubble solves L U = n(n−1)U^(p_n−1) for the flat conformal Laplacian. A companion result identifies U^(4/(n−2)) times the Euclidean metric with the stereographically pulled-back round metric.
- **The area of the round sphere**: [`roundSphereVolume_eq_two_mul_pi_rpow_div_Gamma`](https://taucetiproject.org/docs/TauCeti/Geometry/Euclidean/Volume/Sphere.html#TauCeti.roundSphereVolume_eq_two_mul_pi_rpow_div_Gamma) — |Sⁿ| = 2π^((n+1)/2)/Γ((n+1)/2), taken as normalized Hausdorff measure, as Y0.4 requires.
- **The Levi-Civita connection under conformal change**: [`isLeviCivitaConnection_rescale_addOneForm`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/VectorBundle/CovariantDerivative/LeviCivita/Conformal.html#Bundle.ContMDiffRiemannianMetric.isLeviCivitaConnection_rescale_addOneForm) — ∇ plus an explicit symmetric tensor built from df is the Levi-Civita connection of fg.
- **The Weyl tensor vanishes in dimension three**: [`weylTensor_eq_zero_of_finrank_eq_three`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/VectorBundle/CovariantDerivative/Curvature/Weyl.html#CovariantDerivative.IsMetricCompatible.weylTensor_eq_zero_of_finrank_eq_three) — the curvature is then P⊙g. This is why Cotton, not Weyl, governs conformal flatness when n = 3.

### Notable definitions and infrastructure

- [`conformalLaplacian`](https://taucetiproject.org/docs/TauCeti/Analysis/PDE/Yamabe/ConformalLaplacian.html#TauCeti.Yamabe.conformalLaplacian) — L_g = a_nΔ⁺_g + Scal_g, defined on a general smooth Riemannian manifold with the roadmap's sign and scalar conventions. Every equation downstream is stated through it.
- [`weylTensor`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/VectorBundle/CovariantDerivative/Curvature/Weyl.html#CovariantDerivative.weylTensor) — W = Rm − P⊙g, built on the [`Schouten tensor`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/VectorBundle/CovariantDerivative/Curvature/Schouten.html#CovariantDerivative.schoutenTensor) and the Kulkarni–Nomizu product. It comes with its algebraic symmetries and trace-freeness, and it is the quantity Aubin's test function in Y5 detects.
- [`WithMetric`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Riemannian/WithMetric.html#TauCeti.WithMetric) — the metric-indexed copy of M that the conventions section asks for. It carries identity diffeomorphisms between copies and the rescaled inner product, gradient and volume: for example Vol(ĝ) = ∫u^(p_n) dV_g ([`riemannianTotalVolume_rescale_rpow`](https://taucetiproject.org/docs/TauCeti/Geometry/Manifold/Riemannian/VolumeDensity/Conformal.html#TauCeti.WithMetric.riemannianTotalVolume_rescale_rpow)).

### Roadmap coverage

Y0 is partial:
- Y0.1 has the conformal Levi-Civita connection, gradient, volume density and constant rescalings. The source also has a curvature-operator formula under conformal change, but the Ricci and scalar specializations to ĝ = u^(4/(n−2))g are not there.
- Y0.2 has the conformal Laplacian only as a definition. Its transformation law and the conformal invariance of Q are missing.
- Y0.3 has the conformal class with its positive-power parametrization, constant-factor redundancy, pullback and the volume identity. The Euler–Lagrange equivalence is missing.
- Y0.4 has the Euclidean, constant-rescaling and stereographic computations and the sphere area.
- Y0.5 has Schouten, Kulkarni–Nomizu and Weyl with their symmetries. Cotton, the conformal laws, div W = (n−3)C, and the Weyl–Schouten theorem are missing.

Y2 is partial: Y2.3's bubble calculus is largely in place (smoothness, positivity, the exact equation, integrability, energy and moment integrals). The truncated logarithmic moments are unclear. The sharp inequality (Y2.1), the equality classification (Y2.2) and the manifold transfer (Y2.4) are untouched. Y1 and Y3–Y10 are untouched.

## The frontier

- **The scalar-curvature transformation law** — specialize the conformal curvature formula to Ricci and scalar curvature for ĝ = u^(4/(n−2))g, and prove Scal_ĝ = u^(−(n+2)/(n−2))L_g u together with the operator identity for L_ĝ. Both inputs (the connection change and the conformal Laplacian) are now present.
- **Conformal invariance of the Yamabe quotient** — define Q_g and Y(M,[g]), and prove Q_ĝ(v) = Q_g(uv), first for smooth functions and then on the H¹ domain. The weak-domain half waits on Y1's Sobolev carrier.
- **Cotton and the Weyl–Schouten theorem** — define Cotton, prove the conformal laws and div W = (n−3)C, then use the first-jet Frobenius argument to show that W = 0 (n ≥ 4) or C = 0 (n = 3) characterizes local conformal flatness.
- **The sharp Euclidean Sobolev inequality** — with the extremals' energy already computed, what remains is the inequality a_n∫|du|² ≥ Y(Sⁿ)‖u‖²_{p_n} on D¹,² and the classification of its equality cases (Y2.1–Y2.2).
- **Closed-manifold Sobolev interfaces** — Y1's H¹/Lᵖ adapters, compact embeddings and the first eigenvalue of L_g, which depend on the PDE and K5a supplier lanes.
