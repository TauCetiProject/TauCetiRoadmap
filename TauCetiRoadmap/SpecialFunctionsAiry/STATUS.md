<!--tauceti-status:v1 {"roadmap":"SpecialFunctionsAiry","to_sha":"aa6e43e14b2556add36c8149e543f059a45926d3","ts":"2026-11-13T23:20:12Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 1","remaining":"Airy's equation and uniqueness, Pochhammer Maclaurin series, Wronskians, connection formulas, Riccati form, symmetry, Bessel and Kummer relations","state":"partial"},{"id":"Layer 2","state":"untouched"},{"id":"Layer 3","state":"untouched"},{"id":"Layer 4","state":"untouched"},{"id":"Layer 5","state":"untouched"},{"id":"Layer 6","state":"untouched"},{"id":"Layer 7","remaining":"everything after the triplication formula: primitives, transforms, repeated integrals, incomplete Airy functions","state":"partial"},{"id":"Layer 8","state":"untouched"},{"id":"Layer 9","state":"untouched"}],"readme_sha":"e04046f087fa0d9c1705f0dfbe4f27efb6f819cf654d6d6723f9cbb66a11c5b7","roadmap":"SpecialFunctionsAiry","to_sha":"aa6e43e14b2556add36c8149e543f059a45926d3"}-->
# Status: SpecialFunctionsAiry

This file documents the status of the SpecialFunctionsAiry roadmap up until `aa6e43e` (2026-11-13T23:20:12Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The roadmap has just begun. Layer 1 has its definitions, entireness and values at the origin. Layer 7 has its auxiliary Gauss triplication formula. Airy's equation, the Wronskians, the connection formulas and everything from Layer 2 onward have not started.

### Named results

- **Gauss's triplication formula** — [`Complex.Gamma_mul_Gamma_add_third`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/SpecialFunctions/Gamma/Multiplication.html#Complex.Gamma_mul_Gamma_add_third): Γ(z) Γ(z + ⅓) Γ(z + ⅔) = 2π 3^{½ − 3z} Γ(3z) for every complex `z`. This is roadmap target 7.1, needed later for the integrals and products of Airy functions.
- **Gauss's multiplication formula** — [`Complex.prod_Gamma_add_div`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/SpecialFunctions/Gamma/Multiplication.html#Complex.prod_Gamma_add_div): the general form of DLMF 5.5.6 for every `m`, over ℝ and ℂ, obtained from Bohr–Mollerup. The triplication formula is its case `m = 3`.
- **The product of Γ at the m-th fractions** — [`Complex.prod_Gamma_div`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/SpecialFunctions/Gamma/Multiplication.html#Complex.prod_Gamma_div): ∏_{k=1}^{m−1} Γ(k/m) = (2π)^{(m−1)/2} m^{−1/2} (DLMF 5.5.7). It rests on the finite sine product [`Real.prod_sin_pi_mul_div`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/SpecialFunctions/Trigonometric/FiniteProduct.html#Real.prod_sin_pi_mul_div).
- **Values of Ai and Bi at the origin** — [`airyAi_zero`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/SpecialFunctions/Airy/Basic.html#TauCeti.airyAi_zero) and [`deriv_airyAi_zero`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/SpecialFunctions/Airy/Basic.html#TauCeti.deriv_airyAi_zero), with their `Bi` analogues: DLMF 9.2.3–9.2.6, which confirm the normalizations.

### Notable definitions and infrastructure

- **The Airy functions** [`airyAi`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/SpecialFunctions/Airy/Basic.html#TauCeti.airyAi) and [`airyBi`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/SpecialFunctions/Airy/Basic.html#TauCeti.airyBi): defined through the regularized `₀F₁` and proved entire. Every later layer is stated in terms of them.
- **The Gamma-denominator Maclaurin series** [`hasSum_airyAi_gamma`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/SpecialFunctions/Airy/Basic.html#TauCeti.hasSum_airyAi_gamma) and its `Bi` analogue: everywhere convergent series that can supply the coefficient recurrence for Airy's equation.

### Roadmap coverage

Layer 1 is partial. Section 1.1 has the definitions, entireness and the values at the origin, but the Maclaurin series only in Gamma-denominator form, not the Pochhammer form of DLMF 9.4.1–9.4.4. Sections 1.2–1.7 are untouched: Airy's equation, uniqueness, Wronskians, rotations, connection formulas, the Riccati form, conjugate symmetry, and the Bessel and Kummer relations. Layer 7 is partial: only the triplication formula of 7.1 is in. Layers 2–6, 8 and 9 are untouched.

## The frontier

- **Airy's equation and uniqueness (1.2)** — prove `deriv^[2] airyAi z = z * airyAi z` and the `Bi` analogue from the series, then show that every entire solution is a combination of `Ai` and `Bi`. Uniqueness consumes the ordinary-point theory of AsymptoticExpansions §10.2.
- **The Pochhammer Maclaurin series (1.1)** — DLMF 9.4.1–9.4.4 as stated in the roadmap. This needs the factorial triplication `(3k)! = 3^{3k} k! (⅓)_k (⅔)_k` to convert the existing Gamma-denominator series.
- **Wronskians and connection formulas (1.3–1.4)** — `𝒲{Ai, Bi} = 1/π` and the rotation identities 9.2.10–9.2.15. Once 1.2 is in, these reduce to comparing values and derivatives at the origin.
- **Integral representations (Layer 2)** — the contour and real integrals, including the decay of `Ai` on `[0, ∞)` that RandomMatrices consumes. This waits on Airy's equation.
- **The rest of Layer 7** — the primitives, Laplace and Mellin transforms, and incomplete Airy functions. These need Layers 1–6.
