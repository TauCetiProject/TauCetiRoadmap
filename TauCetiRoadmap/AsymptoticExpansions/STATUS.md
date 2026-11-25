<!--tauceti-status:v1 {"roadmap":"AsymptoticExpansions","to_sha":"0253c4f16eb7629683572bfef8e6cc2571faac5c","ts":"2026-11-25T06:54:39Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 1","remaining":"the checks of 1.1, order-symbol examples 1.2, the characterization 2.1.15, reciprocal, composition, inversion and formalCpow in 1.4, integration 2.1.11-2.1.12","state":"partial"},{"id":"Layer 2","remaining":"the resubstitution example 2.2 and Lagrange's reversion 2.3","state":"partial"},{"id":"Layer 3","remaining":"integration by parts 3.1, the logarithmic variant 3.4 and general kernels 3.5","state":"partial"},{"id":"Layer 4","remaining":"Watson's lemma in sectors, rotation of the path, inverse Laplace transforms and Haar's method","state":"partial"},{"id":"Layer 5","state":"untouched"},{"id":"Layer 6","state":"untouched"},{"id":"Layer 7","remaining":"the cubic normal form of Chester, Friedman and Ursell (7.3)","state":"partial"},{"id":"Layer 8","remaining":"oscillatory tails (oscTail) of 8.3, Handelsman-Lew 8.4, small-parameter Laplace transforms 8.5, exponential Mellin inversion 8.7","state":"partial"},{"id":"Layer 9","remaining":"Stieltjes transforms 9.2, fractional integrals 9.3 and regularization 9.4","state":"partial"},{"id":"Layer 10","remaining":"the logarithmic solution and Wronskian of 10.3, and the rank-one irregular singularity 10.4","state":"partial"},{"id":"Layer 11","remaining":"the left-end solution of 11.1, recessive and dominant solutions 11.2, and the Case I expansion 11.4","state":"partial"},{"id":"Layer 12","remaining":"actual solutions for distinct and coincident characteristic roots 12.1-12.2","state":"partial"},{"id":"Layer 13","remaining":"Abel-Plana, the Euler-Maclaurin examples 2.10.3-2.10.7, the power series of 13.5 and Darboux with exceptional points","state":"partial"}],"readme_sha":"c81515f9055777eaa618c7bd9ce5871226fb86c58c7499514d09daab824b5051","roadmap":"AsymptoticExpansions","to_sha":"0253c4f16eb7629683572bfef8e6cc2571faac5c"}-->
# Status: AsymptoticExpansions

This file documents the status of the AsymptoticExpansions roadmap up until `0253c4f` (2026-11-25T06:54:39Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Eleven of the thirteen layers have results, but none is complete. Watson's lemma on the real line, the continuous Volterra theorem, Ritt's and the Borel–Ritt theorems, and most of the Mellin toolkit are now in place. Laplace's method and stationary phase (Layers 5 and 6) have not begun.

### Named results

- **Watson's lemma** — if `e^{−σt} q(t)` is integrable and `q(t) ∼ ∑ c_s t^{α_s−1}` as `t → 0+`, then `∫₀^∞ e^{−xt} q(t) dt ∼ ∑ Γ(α_s) c_s x^{−α_s}` as `x → +∞`, for a general sequence of exponents ([`Asymptotics.hasAsymptoticExpansion_laplace`](https://taucetiproject.org/docs/TauCeti/Analysis/LaplaceTransform/Watson.html#Asymptotics.hasAsymptoticExpansion_laplace)). It is the first integral method stated as a `HasAsymptoticExpansion`.
- **Bleistein's uniform expansion** — DLMF 2.3.32 with an explicit remainder: when the minimum at `α` coalesces with the endpoint, the first `N` terms in `F_s(a√x)` approximate `e^{x p(0)} I(α, x)` to within `C_N x^{−(N+λ)/2} G_N(a√x)` for every `x > 0` ([`TauCeti.norm_exp_smul_integral_bleistein_sub_le`](https://taucetiproject.org/docs/TauCeti/Analysis/Asymptotics/Bleistein/UniformBound.html#TauCeti.norm_exp_smul_integral_bleistein_sub_le)), now also for `C¹` phases.
- **The Volterra theorem** — on a half-line, `h(x) = ∫_x^∞ K(x, v)(J(v) + ψ(v)h(v)) dv` with `|K| ≤ P(x)Q(v)` has exactly one continuous `O(P)` solution, bounded by `PΦe^Ψ`, with a derivative bound and the sharper `e^{P₀Φ} − 1` estimate ([`TauCeti.existsUnique_volterra_solution`](https://taucetiproject.org/docs/TauCeti/Analysis/Asymptotics/Volterra.html#TauCeti.existsUnique_volterra_solution)). The error bounds of Layers 10 and 11 reduce to it.
- **The Liouville–Green theorem** — `w″ = (f + g)w` has a solution `f^{−1/4} e^{−ξ}(1 + ε)` with `|ε|` and `½ f^{−1/2}|ε′|` at most `exp(V/2) − 1`, `V` the tail integral of `|Φ|` ([`TauCeti.exists_liouvilleGreen_atTop`](https://taucetiproject.org/docs/TauCeti/Analysis/ODE/Liouville/Green.html#TauCeti.exists_liouvilleGreen_atTop)).
- **The Euler–Maclaurin formula** — DLMF 2.10.1 for `f` of class `C^{2m}`, with an exact remainder against the periodic Bernoulli function ([`TauCeti.sum_Icc_eq_eulerMaclaurin`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Asymptotics/Sum/EulerMaclaurin.html#TauCeti.sum_Icc_eq_eulerMaclaurin)); it now yields the full expansion of the harmonic numbers, DLMF 2.10.8.

### Notable definitions and infrastructure

- **Asymptotic expansions** ([`Asymptotics.HasAsymptoticExpansion`](https://taucetiproject.org/docs/TauCeti/Analysis/Asymptotics/AsymptoticExpansion.html#Asymptotics.HasAsymptoticExpansion)) — the pinned notion with the API of 1.1. Watson's lemma, the Fourier endpoint expansions, Borel–Ritt and the harmonic sums are all stated through it.
- **Continued Mellin transforms** ([`TauCeti.mellinContAtZero`](https://taucetiproject.org/docs/TauCeti/Analysis/MellinTransform/Continued.html#TauCeti.mellinContAtZero)) — continuation through an expansion at `0+` (and its twin at `+∞`), with holomorphy, independence of the truncation and principal parts. Handelsman–Lew and the distributional methods of Layer 9 are built on them.
- **Bleistein's change of variables** ([`TauCeti.bleisteinW`](https://taucetiproject.org/docs/TauCeti/Analysis/Asymptotics/Bleistein/ChangeOfVariables.html#TauCeti.bleisteinW)) — the coordinate that makes the phase the quadratic `w²/2 − a w`, reducing the uniform expansion to a Gaussian-type estimate.

### Roadmap coverage

All partial layers have open milestones:

- Layer 1 has the API of 1.1, Ritt's theorem and termwise differentiation (1.5), and Borel–Ritt with non-uniqueness (1.6). It lacks the checks of 1.1, the examples of 1.2, the characterization 2.1.15 (1.3), reciprocals, composition, inversion and complex powers of asymptotic power series (1.4; only sums and products exist), and integration (2.1.11–2.1.12).
- Layer 2 has 2.1; Layer 4 has 4.1; Layer 9 has the complex Beta integral 9.1 ([`Complex.integral_cpow_mul_add_cpow`](https://taucetiproject.org/docs/TauCeti/Analysis/SpecialFunctions/Beta/Complex.html#Complex.integral_cpow_mul_add_cpow)), which landed earlier unreported.
- Layer 3 has 3.2 and 3.3, and lacks 3.1, 3.4 and 3.5.
- Layer 7 lacks only the cubic normal form 7.3.
- Layer 8 has 8.1, 8.2, 8.6 and 8.3 except the oscillatory tails; 8.4, 8.5 and 8.7 remain.
- Layer 10 has 10.1 on a half-line, 10.2 and 10.5; 10.3 lacks the logarithmic solution and the Wronskian, and 10.4 is open.
- Layer 11 has 11.3 and the `+∞` half of 11.1; 11.2 and 11.4 remain.
- Layer 12 has the discrete Volterra estimates and formal solutions, but no actual solutions.
- Layer 13 has 13.1, 13.4, 2.10.8 and Darboux's 2.10.29 and 2.10.31 without exceptional points; Abel–Plana, the other examples of 13.3, and 13.5 remain.

Layers 5 and 6 are untouched.

## The frontier

- **The Fourier analogue of Watson's lemma (6.1)** — its prerequisites 3.2, 3.3 and 4.1 are all proved; what remains is the expansion `∑ e^{iπα_s/2} Γ(α_s) c_s x^{−α_s}` itself, which opens Layer 6.
- **Watson's lemma in a sector (4.2)** — the real-axis case and the complex Gamma integral are done. Rotation of the path (4.3) follows, and SpecialFunctionsParabolicCylinder consumes both.
- **Solutions of difference equations (12.1)** — the formal solutions and the discrete Volterra theorem exist; turning the first into actual solutions with the stated remainders, and proving the recessive one unique, is the open step.
- **Poincaré expansions and asymptotic power series (1.3–1.4)** — 2.1.15, convergent series as expansions, reciprocals, composition, inversion and `formalCpow`. Lagrange's reversion (2.3) and the Laplace coefficients (5.1) wait on these.
- **The rest of the Liouville–Green theory (11.1–11.4)** — the solution controlled at the left end, recessive and dominant solutions, and the Case I expansion, all reductions to the now-complete Volterra theorem.
