<!--tauceti-status:v1 {"roadmap":"SpecialFunctionsAiry","to_sha":"d25d526e576659755e7a68a568facb24cb7cf97f","ts":"2026-11-24T20:52:12Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 1","remaining":"derivative Maclaurin series 9.4.2 and 9.4.4, rotated Wronskians 9.2.8-9.2.9, connection formulas 1.4, Bessel and Kummer relations 1.7","state":"partial"},{"id":"Layer 2","state":"untouched"},{"id":"Layer 3","remaining":"all expansions 3.2-3.6; only the coefficients of 3.1 are in","state":"partial"},{"id":"Layer 4","remaining":"definitions of M, N, theta, phi and everything analytic; only the rational coefficients of 4.5 are in","state":"partial"},{"id":"Layer 5","remaining":"location and enumeration of the zeros 5.1-5.3 and the analytic expansions of 5.4","state":"partial"},{"id":"Layer 6","remaining":"equation for Gi and 9.12.2, values and variation of parameters, 6.3-6.7","state":"partial"},{"id":"Layer 7","remaining":"7.2-7.3 and 7.5-7.8, and 9.10.9-9.10.10, 9.10.20-9.10.21 of 7.4","state":"partial"},{"id":"Layer 8","remaining":"determinant 9.11.2, antiderivatives 9.11.12-9.11.14, the limit in 9.11.3, 8.4 and the Airy kernel 8.5","state":"partial"},{"id":"Layer 9","state":"untouched"}],"readme_sha":"13bdf6f5b5f2c4ef0fc71fa4e0e646422211fd5b7dc2f8817d0ecf02a4248207","roadmap":"SpecialFunctionsAiry","to_sha":"d25d526e576659755e7a68a568facb24cb7cf97f"}-->
# Status: SpecialFunctionsAiry

This file documents the status of the SpecialFunctionsAiry roadmap up until `d25d526` (2026-11-24T20:52:12Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Most of Layer 1 is done: Airy's equation, uniqueness, the Wronskian, the Riccati form and the real-line symmetry. The rotated Wronskians, the connection formulas and the Bessel and Kummer relations are still missing. Layers 3–8 have begun but are all partial: coefficients, formal series, the Scorer function `Hi`, and the product equation. Layers 2 and 9 have not started.

### Named results

- **Airy's equation and uniqueness** — [`airyAi_ode`](https://taucetiproject.org/docs/TauCeti/Analysis/SpecialFunctions/Airy/Equation.html#TauCeti.airyAi_ode) and [`eq_airy_combination`](https://taucetiproject.org/docs/TauCeti/Analysis/SpecialFunctions/Airy/Equation.html#TauCeti.eq_airy_combination): `Ai″ = z Ai` and `Bi″ = z Bi`, and every entire solution is `c₁ Ai + c₂ Bi` with explicit constants (DLMF 9.2.1, §9.2(i)).
- **The Wronskian of `Ai` and `Bi`** — [`wronskian_airyAi_airyBi`](https://taucetiproject.org/docs/TauCeti/Analysis/SpecialFunctions/Airy/Equation.html#TauCeti.wronskian_airyAi_airyBi): `Ai Bi′ − Ai′ Bi = 1/π` (DLMF 9.2.7). It underlies the positivity of the modulus and the simplicity of the zeros.
- **The Pochhammer Maclaurin series** — [`hasSum_airyAi`](https://taucetiproject.org/docs/TauCeti/Analysis/SpecialFunctions/Airy/Maclaurin.html#TauCeti.hasSum_airyAi): DLMF 9.4.1 and 9.4.3, obtained through the triplication of factorials.
- **The product equation** — [`productEquation_mul_of_airy_ode`](https://taucetiproject.org/docs/TauCeti/Analysis/SpecialFunctions/Airy/ProductEquation.html#TauCeti.productEquation_mul_of_airy_ode): a product of two solutions solves `w‴ − 4z w′ − 2w = 0` (DLMF 9.11.1). Such a solution is [determined by `w(0)`, `w′(0)` and `w″(0)`](https://taucetiproject.org/docs/TauCeti/Analysis/SpecialFunctions/Airy/ProductEquation.html#TauCeti.eq_of_productEquation).
- **Gauss's triplication formula** — [`Complex.Gamma_mul_Gamma_add_third`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/SpecialFunctions/Gamma/Multiplication.html#Complex.Gamma_mul_Gamma_add_third): Γ(z) Γ(z + ⅓) Γ(z + ⅔) = 2π 3^{½ − 3z} Γ(3z). This is target 7.1, a special case of the full Gauss multiplication formula.

### Notable definitions and infrastructure

- **The Scorer functions** [`scorerHi`](https://taucetiproject.org/docs/TauCeti/Analysis/SpecialFunctions/Airy/Scorer.html#TauCeti.scorerHi) and [`scorerGi`](https://taucetiproject.org/docs/TauCeti/Analysis/SpecialFunctions/Airy/Scorer.html#TauCeti.scorerGi): `Hi` is the Laplace integral `π⁻¹ ∫₀^∞ exp(−t³/3 + z t) dt`, entire, and it solves `Hi″ = z Hi + 1/π`. Every Taylor coefficient at the origin is a Gamma value, so the Maclaurin series of 6.4 is within reach.
- **Formal series for the zeros** [`airyZeroSeriesT`](https://taucetiproject.org/docs/TauCeti/Analysis/SpecialFunctions/Airy/ZeroSeries.html#TauCeti.airyZeroSeriesT) and its siblings: rational power series characterised by formal reversion equations. They produce the coefficients printed in DLMF 9.8.20–9.8.23 and 9.9.18–9.9.21, built on the formal binomial power [`PowerSeries.binomialPow`](https://taucetiproject.org/docs/TauCeti/RingTheory/PowerSeries/Binomial.html#PowerSeries.binomialPow). The analytic expansions they are meant to describe do not exist yet.
- **The asymptotic coefficients** [`airyU`](https://taucetiproject.org/docs/TauCeti/Analysis/SpecialFunctions/Airy/Coefficients.html#TauCeti.airyU) and the multiplier [`airyChi`](https://taucetiproject.org/docs/TauCeti/Analysis/SpecialFunctions/Airy/Coefficients.html#Real.airyChi): together they complete 3.1, including `χ(x) ∼ (πx/2)^{1/2}`. They are the input for Watson's lemma in 3.2.

### Roadmap coverage

Layer 1 is partial. 1.2, 1.5 and 1.6 are done, and 1.1 is done except the derivative series 9.4.2 and 9.4.4. In 1.3, only 9.2.7 and the rotation invariance are in; the rotated Wronskians 9.2.8–9.2.9 are missing. 1.4 and 1.7 are untouched. Layer 2 is untouched. Layer 3 has all of 3.1, and none of the expansions. Layer 4 has only the rational coefficients of 4.5 and the third-order equation for `Ai² + Bi²`; `M`, `θ` and the analytic expansions are missing. Layer 5 has the coefficient checks of 5.4, `Bi(0) ≠ 0` and `Bi′(0) ≠ 0`, and a conditional enumeration of sector zeros, but no zero has been located. Layer 6 has the definitions, the equation for `Hi` and its rotation, and `Hi(0)`; the equation for `Gi`, 9.12.2 and 6.3–6.7 are missing. Layer 7 has the triplication formula of 7.1 and 9.10.8. Layer 8 has 8.1 except the determinant 9.11.2, and 8.2 through 9.11.11. In 8.3 it has DLMF 9.11.4, which predates the previous report but was not credited there, and a Gaussian-regularized form of 9.11.3. Layer 9 is untouched.

## The frontier

- **Connection formulas and rotated Wronskians (1.3–1.4)** — 9.2.8–9.2.15. Uniqueness and the rotation lemma are both in, so 9.2.10–9.2.13 reduce to comparing values and derivatives at `0`.
- **DLMF 9.11.3 (8.3)** — pass to the limit `ε → 0+` in the regularized identity. This needs the locally uniform convergence of the Fourier integral 9.5.1 from 2.2.
- **Scorer 6.1–6.2** — `Gi″ = z Gi − 1/π`, the general solution 9.12.2, and the values and variation-of-parameters formulas 9.12.4–9.12.7.
- **Contour integrals (2.1)** — the ray integrals for `Ai` and `Bi`. Everything from 2.2 onward, including the decay of `Ai` on `[0, ∞)` that RandomMatrices uses, waits on them.
- **Modulus and phase (4.1)** — define `M`, `N`, `θ`, `φ` and prove 9.8.14. The formal coefficients already in place need these definitions and the expansions of 3.4 before they say anything analytic.
