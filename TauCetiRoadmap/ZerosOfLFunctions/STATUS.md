<!--tauceti-status:v1 {"roadmap":"ZerosOfLFunctions","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e","ts":"2026-11-19T18:22:01+11:00"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","state":"done"},{"id":"Layer 1","remaining":"gamma-factor growth of a record 1.5 and continuedL in 1.6; 1.3a and 1.4a not established","state":"partial"},{"id":"Layer 2","remaining":"Dedekind and Hecke conductor identifications and the continuedL half of the normalization translation","state":"partial"},{"id":"Layer 3","remaining":"3.1 for Dedekind and Hecke, polynomial edge bounds in 3.2, the two edges 3.3, convexity 3.4, strip growth 3.5","state":"partial"},{"id":"Layer 4","remaining":"family local counts 4.4, the bounds and the identity N±(T) = 2N(T) in 4.5, Nevanlinna comparison 4.6","state":"partial"},{"id":"Layer 5","remaining":"entire-logarithm uniqueness 5.4, 5.6 for the Dedekind and Hecke families and its local-count clause, ordinate summability 5.6a","state":"partial"},{"id":"Layer 6","remaining":"quantitative 3-4-1, every zero-free region, the exceptional zero, the edges 6.5; the continuedL comparison in 6.4a","state":"partial"},{"id":"Layer 7","remaining":"argument variation and S(T) 7.3, Riemann-von Mangoldt 7.4 and its uniform and corollary forms","state":"partial"},{"id":"Layer 8","state":"untouched"},{"id":"Layer 9","remaining":"GRH as a Prop over the Dedekind and Hecke families","state":"partial"}],"readme_sha":"1c50dfe2b36a493214280b5a53ba89a6c15ab0eaf36c6a848bc4cc77f056f8f2","roadmap":"ZerosOfLFunctions","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e"}-->
# Status: ZerosOfLFunctions

This file documents the status of the ZerosOfLFunctions roadmap up until `b235000` (2026-11-19T18:22:01+11:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Layer 0 is done. Stirling's formula, Hadamard's factorization at order one (for ξ and every primitive Dirichlet completion) and the Dirichlet retained-zero inequalities are now in place, as are the rectangle argument principle and the semantics of certified zeros. There is still no convexity bound, no bound for `N(T)` and no zero-free region, and Layer 8 has not begun.

### Named results

- **Stirling's formula** — on a sector `|arg s| ≤ π − δ`, [log Γ(s) is `(s − 1/2) log s − s + log(2π)/2`](https://taucetiproject.org/docs/TauCeti/Analysis/SpecialFunctions/Gamma/Stirling/Basic.html#TauCeti.norm_logGamma_sub_stirling_le) up to an error of at most `2/((1 − cos δ)³ ‖s‖)`. On vertical strips, [`log ‖Γ(σ + it)‖ = (σ − 1/2) log |t| − π|t|/2 + log(2π)/2 + O(1/|t|)`](https://taucetiproject.org/docs/TauCeti/Analysis/SpecialFunctions/Gamma/Stirling/Vertical.html#TauCeti.isBigO_log_norm_Gamma_vertical_sub) uniformly for σ in a compact interval.
- **Hadamard's theorem at order one** — an entire function of order at most one that is nonzero at 0 is [`exp(a + bs)` times the genus-one product over its zeros](https://taucetiproject.org/docs/TauCeti/Analysis/Complex/Hadamard/OrderOne.html#TauCeti.hadamard_of_orderLE_one). This is instantiated for [twice Riemann's ξ](https://taucetiproject.org/docs/TauCeti/NumberTheory/LFunctions/Zeros/Completion/RiemannZeta/Hadamard.html#TauCeti.LFunctions.zetaEntireCompletion_hadamard) and for [every primitive Dirichlet completion](https://taucetiproject.org/docs/TauCeti/NumberTheory/LFunctions/Zeros/Completion/Dirichlet/Hadamard.html#TauCeti.LFunctions.dirichletData_entireCompletion_hadamard).
- **The real part of the Hadamard constant** — for ξ and for every primitive Dirichlet completion, real or not, [`Re b = −∑ m_ρ Re(1/ρ)`](https://taucetiproject.org/docs/TauCeti/NumberTheory/LFunctions/Zeros/Completion/Dirichlet/Hadamard.html#TauCeti.LFunctions.re_logDeriv_dirichletData_entireCompletion_zero). The proof goes through the functional equation. It is also proved for [any record](https://taucetiproject.org/docs/TauCeti/NumberTheory/LFunctions/Zeros/Completion/Hadamard.html#TauCeti.LFunctions.AnalyticLFunctionData.HasFunctionalEquation.re_logDeriv_entireCompletion_zero) of order at most one with no zeros on `Re s ≥ 1`.
- **The retained-zero inequalities** — for a primitive nonprincipal χ of conductor `q` and `σ ∈ [1, 2]`, a real zero `β` satisfies [`1/(σ − β) ≤ Re (L'/L)(σ, χ) + ½ log q + C_Γ`](https://taucetiproject.org/docs/TauCeti/NumberTheory/LFunctions/Zeros/Completion/Dirichlet/Hadamard.html#DirichletCharacter.one_div_sub_le_re_logDeriv_LFunction_add). A [multiplicity-weighted version](https://taucetiproject.org/docs/TauCeti/NumberTheory/LFunctions/Zeros/Completion/Dirichlet/Hadamard.html#DirichletCharacter.sum_analyticOrderNatAt_LFunction_mul_re_one_div_sub_le_re_logDeriv_LFunction_add) holds for any finite set of zeros.
- **The argument principle on a rectangle, in divisor form** — when no zero or pole lies on the boundary, [the integral of `f'/f` around a rectangle](https://taucetiproject.org/docs/TauCeti/Analysis/Contour/Argument/Rectangle/Divisor.html#TauCeti.Contour.argumentPrinciple_rectBoundary_divisor) is `2πi` times the signed divisor count inside it.

### Notable definitions and infrastructure

- [The entire completion](https://taucetiproject.org/docs/TauCeti/NumberTheory/LFunctions/Zeros/Completion/Basic.html#TauCeti.LFunctions.AnalyticLFunctionData.entireCompletion) of a meromorphically continued record is what every count, factorization and order statement is about.
- [The counting function `N(T)`](https://taucetiproject.org/docs/TauCeti/NumberTheory/LFunctions/Zeros/Counting/Basic.html#TauCeti.LFunctions.AnalyticLFunctionData.zeroCountingFunction) of a record follows the roadmap's convention and is monotone and right-continuous.
- [A zero certificate](https://taucetiproject.org/docs/TauCeti/Analysis/Meromorphic/Counting/Certificate.html#TauCeti.HasZerosInRects) is a list of rectangles with multiplicities that accounts for every zero in a larger rectangle.

### Roadmap coverage

Layer 0 is done.

Layer 1 has the log Γ branch, both forms of Stirling (1.2–1.3), the digamma asymptotics (1.4) and the entire reciprocal gamma factor, now with [order at most one](https://taucetiproject.org/docs/TauCeti/NumberTheory/LFunctions/GammaFactor/Growth.html#TauCeti.LFunctions.AnalyticLFunctionData.orderLE_invGammaFactor). It still lacks the gamma-factor growth of a record (1.5) and `continuedL`, and nothing here establishes 1.3a or 1.4a.

Layers 2 and 3 are unchanged. Layer 2 has the analytic conductor but not the family identifications. Layer 3 has the Mellin order-one adapter and its Dirichlet instance, but not 3.1 for the Dedekind and Hecke families or 3.2–3.5.

Layer 4 has 4.1–4.3 and the definitions of `N(T)` and `N±(T)`, but not the local count 4.4, the bounds of 4.5, or 4.6.

Layer 5 has 5.1–5.3 and Hadamard at order one (5.5). The 5.6 identities are proved for ξ and the Dirichlet completions only, not for the Dedekind and Hecke families. Still missing are the uniqueness of the entire logarithm (5.4), the local-count clause of 5.6 and 5.6a.

Layer 6's direct Dirichlet exports (6.4a) are essentially complete, apart from the comparison with `continuedL`. Layer 6 has no zero-free region yet.

Layer 7 has 7.1 and 7.2. Layer 9 has everything except GRH as a `Prop` over the two families. Layer 8 is untouched.

## The frontier

- **The Dirichlet zero-free region (6.1, 6.4).** The retained-zero inequalities and `C_Γ` are in place. What remains is the quantitative 3-4-1 inequality and the region itself, with its possible exceptional zero.
- **The gamma factor of a record and `continuedL` (1.5–1.6).** Strip Stirling should give 1.5 directly, and the reciprocal's order bound is now proved. `continuedL` needs nothing new. 3.3, 4.4 and Riemann–von Mangoldt all wait on 1.5.
- **Finite order for Dedekind and Hecke (3.1).** The weak functional-equation adapter still has to be fed the split Mellin kernels of the L-functions roadmap. The family versions of 5.6, 5.6a, convexity and the local counts take this as input.
- **Bounds for `N(T)` (4.4–4.5).** The count is defined. The local bound `N(T + 1) − N(T) = O(log 𝔮)` needs 4.4, and therefore 1.5 and 3.4.
- **The argument variation and `S(T)` (7.3).** The divisor form of 7.2 unblocks it. Riemann–von Mangoldt also needs 1.5 and 4.5.
