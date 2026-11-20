<!--tauceti-status:v1 {"roadmap":"AsymptoticExpansions","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e","ts":"2026-11-19T18:22:01+11:00"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 1","remaining":"the checks of 1.1, order-symbol examples, Poincaré expansions, asymptotic power series, integration, Ritt and Borel-Ritt","state":"partial"},{"id":"Layer 2","remaining":"the resubstitution example 2.2.3-2.2.6 and Lagrange's reversion 2.2.7-2.2.8","state":"partial"},{"id":"Layer 3","remaining":"integration by parts, endpoint Fourier expansions, Watson's lemma on the line and its variants","state":"untouched"},{"id":"Layer 4","remaining":"Watson's lemma in sectors, rotation of the path, inverse Laplace transforms and Haar's method","state":"partial"},{"id":"Layer 5","state":"untouched"},{"id":"Layer 6","state":"untouched"},{"id":"Layer 7","remaining":"the cubic normal form of Chester, Friedman and Ursell (7.3)","state":"partial"},{"id":"Layer 8","remaining":"line shifting, continued Mellin transforms, Handelsman-Lew, the vertical-strip Gamma bound off Re z = 1/2, exponential inversion","state":"partial"},{"id":"Layer 9","state":"untouched"},{"id":"Layer 10","remaining":"uniqueness and derivative bounds in 10.1, then ordinary, regular singular and rank-one irregular points","state":"partial"},{"id":"Layer 11","remaining":"the Liouville-Green theorem, recessive and dominant solutions, and the Case I expansion","state":"partial"},{"id":"Layer 12","remaining":"the distinct and coincident characteristic-root cases 12.1-12.2","state":"partial"},{"id":"Layer 13","remaining":"Abel-Plana, the Euler-Maclaurin examples, summation by parts, entire power series and Darboux's method","state":"partial"}],"readme_sha":"f003c00383c7fd9339500c5c6e0d65988793ce9648d30316563cde0ae39969ba","roadmap":"AsymptoticExpansions","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e"}-->
# Status: AsymptoticExpansions

This file documents the status of the AsymptoticExpansions roadmap up until `b235000` (2026-11-19T18:22:01+11:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Nine of the thirteen layers have results, but none is complete. The Layer 1 notions of asymptotic scale and expansion now exist with their basic API, and Bleistein's uniform method (Layer 7) is done except for the cubic normal form. Watson's lemma, Laplace's method, stationary phase and the distributional methods (Layers 3, 5, 6 and 9) have not begun.

### Named results

- **Bleistein's uniform expansion** — DLMF 2.3.32 with an explicit remainder: for a Laplace integral whose minimum at `α` coalesces with the endpoint, the first `N` terms in the coefficient integrals `F_s(a√x)` approximate `e^{x p(0)} I(α, x)` to within `C_N x^{−(N+λ)/2} G_N(a√x)` for every `x > 0` ([`TauCeti.norm_exp_smul_integral_bleistein_sub_le`](https://taucetiproject.org/docs/TauCeti/Analysis/Asymptotics/Bleistein/UniformBound.html#TauCeti.norm_exp_smul_integral_bleistein_sub_le)). The phase is a single function of `t`, so uniformity in `α` comes from applying it at each `α` with an `α`-independent constant.
- **The Euler–Maclaurin formula** — DLMF 2.10.1 for `f` of class `C^{2m}` on `[a, n]`, with an exact remainder against the periodic Bernoulli function, valued in any real Banach space ([`TauCeti.sum_Icc_eq_eulerMaclaurin`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Asymptotics/Sum/EulerMaclaurin.html#TauCeti.sum_Icc_eq_eulerMaclaurin)).
- **The discrete Volterra theorem** — a summation equation `h(n) = ∑_{m>n} K(n,m)(J(m) + ψ(m)h(m))` with `|K(n,m)| ≤ P(n)Q(m)` has exactly one `O(P)` solution, bounded by `P(n)Φ(n)e^{Ψ(n)}` ([`TauCeti.existsUnique_discrete_volterra_solution`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Asymptotics/DiscreteVolterra.html#TauCeti.existsUnique_discrete_volterra_solution)); the difference-equation layer rests on it.
- **The Mellin–Parseval formula** — DLMF 2.5.3–2.5.5: `∫₀^∞ f(t)h(xt) dt` is the inverse Mellin integral of `𝓜f(1−z)𝓜h(z)` wherever it is continuous in `x` ([`TauCeti.integral_mul_comp_mul_eq_mellinInv`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/MellinTransform/Convolution.html#TauCeti.integral_mul_comp_mul_eq_mellinInv)).
- **Fabry's transformation** — DLMF 2.7.19: `W(t) = e^{ct²/2} w(t²)` solves the transformed equation exactly when `w` solves `w″ + f w′ + g w = 0` at `t²`, with new coefficients that are series in `t⁻¹` ([`TauCeti.deriv_deriv_fabryTransform_add_eq_zero`](https://taucetiproject.org/docs/TauCeti/Analysis/ODE/Complex/FabryTransformation.html#TauCeti.deriv_deriv_fabryTransform_add_eq_zero)).

### Notable definitions and infrastructure

- **Asymptotic scales and expansions** ([`Asymptotics.HasAsymptoticExpansion`](https://taucetiproject.org/docs/TauCeti/Analysis/Asymptotics/AsymptoticExpansion.html#Asymptotics.HasAsymptoticExpansion), with [`Asymptotics.IsAsymptoticScale`](https://taucetiproject.org/docs/TauCeti/Analysis/Asymptotics/AsymptoticExpansion.html#Asymptotics.IsAsymptoticScale)) — the two pinned notions, with linearity, congruence, rescaling and composition of the scale, and uniqueness of coefficients. Watson's lemma, Lagrange's reversion and the Case I expansion can now be stated in the roadmap's intended form.
- **Bleistein's change of variables** ([`TauCeti.bleisteinW`](https://taucetiproject.org/docs/TauCeti/Analysis/Asymptotics/Bleistein/ChangeOfVariables.html#TauCeti.bleisteinW)) — the strictly increasing `C¹` coordinate that makes the phase the quadratic `w²/2 − a w`. Through [`TauCeti.integral_bleistein_eq`](https://taucetiproject.org/docs/TauCeti/Analysis/Asymptotics/Bleistein/ChangeOfVariables.html#TauCeti.integral_bleistein_eq) it reduces the uniform expansion to a Gaussian-type remainder estimate.
- **The Liouville transformation** ([`TauCeti.liouvilleTransform`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/ODE/LiouvilleTransformation.html#TauCeti.liouvilleTransform)) — carries `w″ = (u²f + g)w` to `W″ = (u² + ψ)W` in the Case I normalization. The Case I expansion starts from this equation.

### Roadmap coverage

All partial layers have open milestones:

- Layer 1 has the API of 1.1 but not its worked checks. Order-symbol examples, Poincaré expansions, asymptotic power series, Ritt's theorem and Borel–Ritt (1.2–1.6) remain.
- Layer 2 has 2.1.
- Layer 4 has the complex Gamma integral 4.1.
- Layer 7 has 7.1 and 7.2, and lacks the cubic normal form 7.3.
- Layer 8 has Parseval 8.1, and the vertical-strip bound 8.6 only on the line `Re z = ½` ([`Complex.norm_Gamma_le_exp_of_re_eq_one_half`](https://taucetiproject.org/docs/TauCeti/Analysis/SpecialFunctions/Gamma/CriticalLine.html#Complex.norm_Gamma_le_exp_of_re_eq_one_half)).
- Layer 10 has Fabry's transformation 10.5. The source also contains the existence half of the Volterra theorem 10.1 on a half-line (`TauCeti.exists_volterra_solution`). Uniqueness, the derivative bound and the sharper estimate are missing, as are 10.2–10.4.
- Layer 11 has the Liouville transformation 11.3.
- Layer 12 has the discrete Volterra estimates but neither characteristic-root case.
- Layer 13 has Euler–Maclaurin 13.1.

Layers 3, 5, 6 and 9 are untouched.

## The frontier

- **Poincaré expansions and asymptotic power series (1.3–1.4)** — the characterization 2.1.15, convergent series as expansions, and closure under products, reciprocals, composition and inversion. Lagrange's reversion 2.3 and the difference-equation case 12.1 wait on these.
- **Watson's lemma on the line (3.3)** — now statable through `HasAsymptoticExpansion`. After it comes the sector version 4.2, whose complex Gamma integral is already proved.
- **The rest of the Volterra theorem (10.1)** — uniqueness among `O(P)` solutions, the `C¹` bound and the `e^{P₀Φ} − 1` estimate. The Liouville–Green theorem 11.1 and the rank-one theory 10.4 reduce to it.
- **The cubic normal form (7.3)** — the last piece of Layer 7. It needs the holomorphic implicit function theorem in two variables.
- **The Gamma function on vertical strips (8.6)** — the pole-separated bound on every strip. It is to be derived from DLMF 5.11.9 supplied by ZerosOfLFunctions §1.3; only the critical line is done.
