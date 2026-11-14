<!--tauceti-status:v1 {"roadmap":"SpecialFunctionsParabolicCylinder","to_sha":"aa6e43e14b2556add36c8149e543f059a45926d3","ts":"2026-11-13T23:20:12Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 1","remaining":"Kummer derivative, Kummer equation, Kummer transformation, parameter analyticity, polynomial cases","state":"untouched"},{"id":"Layer 2","remaining":"define the even and odd solutions; series, Weber equation, Wronskian and uniqueness","state":"untouched"},{"id":"Layer 3","remaining":"define U, V, D; initial values, Wronskians, connection formulas","state":"untouched"},{"id":"Layer 4","remaining":"the recurrences and derivative formulas DLMF 12.8","state":"untouched"},{"id":"Layer 5","remaining":"Hermite cases, hermiteFunction bridge, Dawson and repeated Gaussian integrals, erfc cases","state":"untouched"},{"id":"Layer 6","remaining":"all integral representations, positivity, Gamma products 6.6(a), residues of Gamma(A - 2t), Barnes kernel bounds","state":"partial"},{"id":"Layer 7","remaining":"Poincare expansions DLMF 12.9.1-12.9.4 and the recessive-solution characterization","state":"untouched"},{"id":"Layer 8","remaining":"all of DLMF 12.12.1-12.12.4 and 12.13.1-12.13.5; only the 8.3 endpoint estimates exist","state":"partial"},{"id":"Layer 9","remaining":"define W(a, x); Wronskian, connection with U, series, Bessel case, large-x expansions","state":"untouched"}],"readme_sha":"570d43fa44a8f81cbfacd46e3c6d8f8f27c89a2a89ff1ad10276702a1629edd2","roadmap":"SpecialFunctionsParabolicCylinder","to_sha":"aa6e43e14b2556add36c8149e543f059a45926d3"}-->
# Status: SpecialFunctionsParabolicCylinder

This file documents the status of the SpecialFunctionsParabolicCylinder roadmap up until `aa6e43e` (2026-11-13T23:20:12Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** No layer is done, and none of the roadmap's own objects exists yet: there are no Kummer derivative formulas, no even or odd Weber solutions, and no `U`, `V`, `D` or `W`. What exists is auxiliary. The proof-route lemmas for the endpoint case of the rotational addition theorem (Layer 8) have landed, and the Gamma residue at the nonpositive integers (Layer 6) was already in the library.

### Named results

- **The half-Gamma series bound** — ∑_{m≥0} x^m/Γ(m/2 + 1) < 2 exp(x²) for every real x, with no polynomial factor. This is the majorant the endpoint case of DLMF 12.13.5 needs, for all real x rather than only x ≥ 0 ([`tsum_pow_div_Gamma_div_two_add_one_lt_two_mul_exp`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/SpecialFunctions/Erf/Series.html#Real.tsum_pow_div_Gamma_div_two_add_one_lt_two_mul_exp)).
- **The half-Gamma series in closed form** — the same series equals exp(x²)(1 + erf x), DLMF 7.6.3 on the imaginary axis, from which the bound follows ([`tsum_pow_div_Gamma_div_two_add_one`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/SpecialFunctions/Erf/Series.html#TauCeti.Real.tsum_pow_div_Gamma_div_two_add_one)).
- **The Hermite–Gaussian Fourier identity** — the Fourier integral of s^n e^{−s²/2} at any complex frequency y is √(2π) (−i)^n He_n(y) e^{−y²/2} ([`integral_pow_mul_cexp_neg_sq_div_two_sub_I_mul`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/SpecialFunctions/Hermite/FourierIntegral.html#TauCeti.integral_pow_mul_cexp_neg_sq_div_two_sub_I_mul)). It is stated with Hermite polynomials, not as the README's `D_m` form.
- **The Hermite moment bound** — |He_n(y)| e^{−y²/2}/n! ≤ 2^{−n/2}/Γ(n/2 + 1), the coefficient estimate behind absolute convergence at t = π/4 ([`abs_aeval_hermite_mul_exp_div_factorial_le`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/SpecialFunctions/Hermite/Bound.html#TauCeti.abs_aeval_hermite_mul_exp_div_factorial_le)).
- **The Maclaurin series of erf** — DLMF 7.6.1 for the real error function, together with the double-factorial series DLMF 7.6.2 ([`hasSum_erf`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/SpecialFunctions/Erf/Series.html#TauCeti.Real.hasSum_erf)).

### Roadmap coverage

Layers 1–5, 7 and 9 are untouched. Nothing exists for Kummer's derivative formula, equation or transformation, for the even and odd solutions, for `U`, `V` and `D`, for their recurrences or Hermite and `erfc` cases, for their asymptotics, or for `W`. Layer 6 is partial in one auxiliary point only. The residue `(−1)^n/n!` of `Γ` at `−n`, the first half of 6.6(b), is already in Tau Ceti as `Complex.tendsto_add_natCast_mul_Gamma`. The rest is missing: no integral representation, no positivity, no residue of `Γ(A − 2t)`, no Barnes kernel bounds, and none of the Gamma products of 6.6(a). Layer 8 is partial only in the sense that the two estimates of the 8.3 endpoint proof route are proved. None of DLMF 12.12.1–12.12.4 or 12.13.1–12.13.5 is stated, because `U` and `V` do not yet exist.

## The frontier

- **Layer 1, Kummer derivative and equation** — `hasDerivAt_regularizedHGFun_singleton` and `regularizedHGFun_kummer_equation` are the entry point of the whole roadmap. They need only Mathlib's series API and Tau Ceti's `Complex.hasSum_regularizedHGFun`, which is in place.
- **Layer 1, Kummer's transformation and analyticity in the parameters** — 1.4 and 1.5, which Layer 2's analyticity claims rest on.
- **Layer 2, the even and odd solutions** — define `parabolicCylinderEven`/`parabolicCylinderOdd` and prove the series, Weber's equation, the Wronskian and uniqueness. This is blocked only on 1.2–1.3.
- **6.6(a) and the rest of 6.6(b)** — the product DLMF 5.8.3, `|Γ(1 + iy)|² = πy/sinh(πy)`, and the residues of `Γ(A − 2t)`. These are independent of Weber theory and could proceed in parallel now.
- **Restating the 8.3 Fourier identity for `D_m`** — once Layer 5.1 identifies `D_m(y) = He_m(y) e^{−y²/4}`, the identity and moment bound that have already landed convert to the README's `D_m` form directly.
