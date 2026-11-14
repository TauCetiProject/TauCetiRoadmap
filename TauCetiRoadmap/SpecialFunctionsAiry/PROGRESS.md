# Progress log: SpecialFunctionsAiry

An append-only record of what landed on the SpecialFunctionsAiry roadmap, one section per window of
merged pull requests, oldest first. Generated; the prose is not security-validated.
For a current snapshot instead, read `STATUS.md` beside this file.

<!--tauceti-progress:v1 {"from_sha":"f7a30b526b00dc862d73458c4389a9fdf3bcb499","prs":[35471,38171],"roadmap":"SpecialFunctionsAiry","to_sha":"aa6e43e14b2556add36c8149e543f059a45926d3"}-->
## SpecialFunctionsAiry: 2026-11-11 to 2026-11-13 (`f7a30b5` to `aa6e43e`)

The Airy roadmap has started. The Airy functions [`airyAi`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/SpecialFunctions/Airy/Basic.html#TauCeti.airyAi) and [`airyBi`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/SpecialFunctions/Airy/Basic.html#TauCeti.airyBi) are now defined through the regularized hypergeometric function, normalized as in DLMF and proved entire, and the values of each function and its derivative at the origin (DLMF 9.2.3–9.2.6) are checked against those normalizations (TauCeti#35471). Each has an everywhere convergent Maclaurin series, but [in its Gamma-denominator form](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/SpecialFunctions/Airy/Basic.html#TauCeti.hasSum_airyAi_gamma). The Pochhammer forms of DLMF 9.4.1–9.4.4 are not proved yet, and neither is Airy's equation itself.

Ahead of Layer 7, the roadmap's auxiliary Gauss triplication formula, [Γ(z) Γ(z + ⅓) Γ(z + ⅔) = 2π 3^{½ − 3z} Γ(3z)](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/SpecialFunctions/Gamma/Multiplication.html#Complex.Gamma_mul_Gamma_add_third), landed for every complex `z`. It comes as the case m = 3 of the full [Gauss multiplication formula](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/SpecialFunctions/Gamma/Multiplication.html#Complex.prod_Gamma_add_div), which was proved over the reals by Bohr–Mollerup and extended to ℂ (TauCeti#38171). On the way came the [product of Γ(k/m)](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/SpecialFunctions/Gamma/Multiplication.html#Complex.prod_Gamma_div) (DLMF 5.5.7), the classical [product of sin(πk/m)](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/SpecialFunctions/Trigonometric/FiniteProduct.html#Real.prod_sin_pi_mul_div), and log-convexity of shifted, rescaled Γ.
