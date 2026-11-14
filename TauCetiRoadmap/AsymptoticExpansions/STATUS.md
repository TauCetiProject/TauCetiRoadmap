<!--tauceti-status:v1 {"roadmap":"AsymptoticExpansions","to_sha":"aa6e43e14b2556add36c8149e543f059a45926d3","ts":"2026-11-13T23:20:12Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 1","remaining":"IsAsymptoticScale and HasAsymptoticExpansion with their API, Poincaré expansions, asymptotic power series, Ritt and Borel-Ritt","state":"untouched"},{"id":"Layer 2","remaining":"the resubstitution example 2.2.3-2.2.6 and Lagrange's reversion 2.2.7-2.2.8","state":"partial"},{"id":"Layer 3","state":"untouched"},{"id":"Layer 4","remaining":"Watson's lemma in sectors, rotation of the path, inverse Laplace transforms and Haar's method","state":"partial"},{"id":"Layer 5","state":"untouched"},{"id":"Layer 6","state":"untouched"},{"id":"Layer 7","state":"untouched"},{"id":"Layer 8","remaining":"line shifting, continued Mellin transforms, Handelsman-Lew, small-parameter Laplace, Gamma on vertical strips, exponential inversion","state":"partial"},{"id":"Layer 9","state":"untouched"},{"id":"Layer 10","remaining":"the continuous Volterra theorem 10.1, then ordinary, regular singular and rank-one irregular points","state":"untouched"},{"id":"Layer 11","remaining":"the Liouville-Green theorem, recessive and dominant solutions, and the Case I expansion","state":"partial"},{"id":"Layer 12","remaining":"the distinct and coincident characteristic-root cases 12.1-12.2","state":"partial"},{"id":"Layer 13","remaining":"Abel-Plana, the Euler-Maclaurin examples, summation by parts, entire power series and Darboux's method","state":"partial"}],"readme_sha":"7a274edb8ccc3e2694f249f527f622a1070b10e36851e8fddcd474b96eb66352","roadmap":"AsymptoticExpansions","to_sha":"aa6e43e14b2556add36c8149e543f059a45926d3"}-->
# Status: AsymptoticExpansions

This file documents the status of the AsymptoticExpansions roadmap up until `aa6e43e` (2026-11-13T23:20:12Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The roadmap has scattered first results in seven of its thirteen layers. Single milestones are proved in the transcendental-equation, complex-Laplace, Mellin, Liouville–Green and sums layers, plus the discrete Volterra estimates for difference equations. No layer is complete. The foundation in Layer 1 (asymptotic scales and expansions) and all the integral methods (Watson's lemma, Laplace's method, stationary phase, coalescing critical points) have not begun.

### Named results

- **The Euler–Maclaurin formula** — DLMF 2.10.1 for `f` of class `C^{2m}` on `[a, n]`, with an exact remainder against the periodic Bernoulli function, valued in any real Banach space ([`TauCeti.sum_Icc_eq_eulerMaclaurin`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Asymptotics/Sum/EulerMaclaurin.html#TauCeti.sum_Icc_eq_eulerMaclaurin); the form of every order `k ≥ 1` is [`TauCeti.sum_Icc_eq_eulerMaclaurin_of_hasDerivAt`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Asymptotics/Sum/EulerMaclaurin.html#TauCeti.sum_Icc_eq_eulerMaclaurin_of_hasDerivAt)).
- **The discrete Volterra theorem** — a summation equation `h(n) = ∑_{m>n} K(n,m)(J(m) + ψ(m)h(m))` with `|K(n,m)| ≤ P(n)Q(m)` has exactly one `O(P)` solution, and it obeys `|h(n)| ≤ P(n)Φ(n)e^{Ψ(n)}` ([`TauCeti.existsUnique_discrete_volterra_solution`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Asymptotics/DiscreteVolterra.html#TauCeti.existsUnique_discrete_volterra_solution)). This is the analogue of Wong and Li that the difference-equation layer needs.
- **The Mellin–Parseval formula** — DLMF 2.5.3–2.5.5: `∫₀^∞ f(t)h(xt) dt` has Mellin transform `𝓜f(1−z)𝓜h(z)`, and it equals the inverse Mellin integral of that product at every `x > 0` where it is continuous ([`TauCeti.integral_mul_comp_mul_eq_mellinInv`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/MellinTransform/Convolution.html#TauCeti.integral_mul_comp_mul_eq_mellinInv)).
- **The complex Gamma integral** — `∫₀^∞ t^{s−1}e^{−zt} dt = Γ(s)z^{−s}` for `Re s > 0` and `Re z > 0`, the auxiliary result the roadmap owns for Watson's lemma in sectors ([`Complex.integral_cpow_mul_exp_neg_mul_Ioi_of_re_pos`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/SpecialFunctions/Gamma/IntegralComplexRate.html#Complex.integral_cpow_mul_exp_neg_mul_Ioi_of_re_pos)).
- **Inversion of `f(x) ∼ x`** — DLMF 2.2.1–2.2.2: if `f` is continuous and increasing with `f(x) ∼ x`, then `f(x) = y` has a unique root beyond `a` ([`ContinuousOn.existsUnique_root_of_isEquivalent`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Asymptotics/TranscendentalEquation.html#ContinuousOn.existsUnique_root_of_isEquivalent)), and that root is `∼ y` ([`MonotoneOn.root_isEquivalent`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Asymptotics/TranscendentalEquation.html#MonotoneOn.root_isEquivalent)).

### Notable definitions and infrastructure

- **The Liouville transformation** ([`TauCeti.liouvilleTransform`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/ODE/LiouvilleTransformation.html#TauCeti.liouvilleTransform), with its potential [`TauCeti.liouvillePotential`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/ODE/LiouvilleTransformation.html#TauCeti.liouvillePotential)) — the rescaling `W = ż^{−1/2} w` and the transformed potential `ψ` of DLMF 2.8.4. In the Case I normalization `ż²f(z) = 1`, it carries `w″ = (u²f + g)w` to `W″ = (u² + ψ)W` ([`TauCeti.deriv_deriv_liouvilleTransform_of_normalized`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/ODE/LiouvilleTransformation.html#TauCeti.deriv_deriv_liouvilleTransform_of_normalized)). Case I's expansion in `u` starts from this equation. The statements are pointwise at an interior point.
- **The Mellin transform in logarithmic coordinates** ([`TauCeti.mellin_eq_integral_exp_smul`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/MellinTransform/Basic.html#TauCeti.mellin_eq_integral_exp_smul)) — this rewrites `𝓜f(s)` as a Fourier–Laplace integral over `ℝ`. Together with the reflection `𝓜[t⁻¹f(t⁻¹)](s) = 𝓜f(1−s)` and the convolution theorem, it makes the Parseval argument a Tonelli computation.

### Roadmap coverage

Layers 2, 4, 8, 11, 12 and 13 are partial, each with one milestone proved:

- Layer 2 has 2.1. The resubstitution example and Lagrange's reversion remain.
- Layer 4 has 4.1. Watson's lemma in sectors, rotation of the path, inverse Laplace transforms and Haar's method remain.
- Layer 8 has 8.1 (Parseval). The work from the line shift 8.2 through exponential Mellin inversion 8.7 remains.
- Layer 11 has the Liouville transformation 11.3. The Liouville–Green theorem, recessive and dominant solutions, and the Case I expansion remain.
- Layer 12 has the discrete Volterra estimates, but neither characteristic-root case.
- Layer 13 has Euler–Maclaurin 13.1. Abel–Plana, the worked sums, summation by parts, entire power series and Darboux's method remain.

Layers 1, 3, 5, 6, 7, 9 and 10 are untouched. In particular, `IsAsymptoticScale` and `HasAsymptoticExpansion` do not exist in the source, and neither does the continuous Volterra theorem of 10.1.

## The frontier

- **Layer 1 notions** — define `IsAsymptoticScale` and `HasAsymptoticExpansion` with the API of 1.1, then the asymptotic power series of 1.4. Almost every remaining milestone is stated through these, including Lagrange's reversion, Watson's lemma and the Case I expansion.
- **Volterra integral equations (10.1)** — the continuous analogue of the discrete theorem now proved, with the derivative bound and the sharper `e^{P₀Φ} − 1` estimate. The Liouville–Green theorem 11.1 and the irregular-singularity theory of 10.4 both reduce to it.
- **Difference equations with distinct roots (12.1)** — the discrete Volterra estimates are in place. What remains is the reduction of the three-term recurrence to them, which needs Poincaré expansions in `n^{−1}` from Layer 1.
- **Watson's lemma in a sector (4.2)** — the complex Gamma integral it needs is proved, together with its holomorphy in the rate. Watson's lemma on the real line (3.3) and the Layer 1 notions come first.
- **Shifting the Mellin line (8.2)** — the next contour tool after Parseval. It needs the residue theory supplied by ContourIntegration and decay hypotheses on horizontal connectors.
