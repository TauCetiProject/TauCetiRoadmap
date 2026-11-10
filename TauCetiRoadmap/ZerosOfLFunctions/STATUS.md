<!--tauceti-status:v1 {"roadmap":"ZerosOfLFunctions","to_sha":"7ca783d4c8d324c9c74efaacd641c8a40f69f284","ts":"2026-11-09T03:33:42Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","state":"done"},{"id":"Layer 1","remaining":"Stirling on sectors and vertical strips, digamma asymptotic, record gamma-factor growth, invGammaFactor and continuedL","state":"partial"},{"id":"Layer 2","remaining":"Dedekind and Hecke conductor identifications and the continuedL half of the normalization translation","state":"partial"},{"id":"Layer 3","state":"untouched"},{"id":"Layer 4","remaining":"Jensen bound 4.3, family local counts 4.4, N(T) and its bounds 4.5, Nevanlinna comparison 4.6","state":"partial"},{"id":"Layer 5","remaining":"zero counts for finite order, the canonical product, Hadamard at order one and the L-function corollaries","state":"partial"},{"id":"Layer 6","state":"untouched"},{"id":"Layer 7","state":"untouched"},{"id":"Layer 8","state":"untouched"},{"id":"Layer 9","state":"untouched"}],"readme_sha":"b56c6fd02462546a7d5f72adc5bc5f533517df3530e6acd4fa18ecca044ba77e","roadmap":"ZerosOfLFunctions","to_sha":"7ca783d4c8d324c9c74efaacd641c8a40f69f284"}-->
# Status: ZerosOfLFunctions

This file documents the status of the ZerosOfLFunctions roadmap up until `7ca783d` (2026-11-09T03:33:42Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Layer 0 is done: the growth predicates and the entire completion of a continued record, specialised to ζ and to primitive Dirichlet characters. Layers 1, 2, 4 and 5 have their first definitions and exact identities, but none of the asymptotic or analytic theorems (Stirling, convexity, Jensen-type counts, Hadamard). Layers 3 and 6–9 have not begun.

### Named results

- **Twice Riemann's ξ as an entire completion** — [the explicit completion of ζ](https://taucetiproject.org/docs/TauCeti/NumberTheory/LFunctions/Zeros/Completion/RiemannZeta.html#TauCeti.LFunctions.zetaEntireCompletion) is `s(s − 1)Λ(s)` with the value 1 filled in at 0 and 1. It is entire and [invariant under s ↦ 1 − s](https://taucetiproject.org/docs/TauCeti/NumberTheory/LFunctions/Zeros/Completion/RiemannZeta.html#TauCeti.LFunctions.zetaEntireCompletion_one_sub), and the general construction recovers it.
- **The divisor of the entire completion** — [clearing the poles](https://taucetiproject.org/docs/TauCeti/NumberTheory/LFunctions/Zeros/Completion/Basic.html#TauCeti.LFunctions.AnalyticLFunctionData.HasMeromorphicContinuation.divisor_entireCompletion) adds exactly the polar order to the divisor of the completed function and creates no zero at a cleared pole.
- **Liouville for negative order** — an [entire function of order at most A < 0](https://taucetiproject.org/docs/TauCeti/Analysis/Complex/GrowthOrder.html#TauCeti.OrderLE.isConst) is constant. Separately, [exp(sⁿ) has order at most A exactly when n ≤ A](https://taucetiproject.org/docs/TauCeti/Analysis/Complex/GrowthOrder.html#TauCeti.orderLE_cexp_pow_iff).
- **Factorization by divisors** — [two holomorphic functions with the same divisor](https://taucetiproject.org/docs/TauCeti/Analysis/Complex/DivisorFactorization.html#TauCeti.exists_differentiableOn_eqOn_mul_exp_of_divisor_eq) on a simply connected open set differ by `exp h` with `h` holomorphic. This is the step Hadamard's theorem uses after dividing by the canonical product.
- **Zeros of the Dirichlet entire completion** — for a primitive nonprincipal character, the entire completion [vanishes exactly where L does](https://taucetiproject.org/docs/TauCeti/NumberTheory/LFunctions/Zeros/Completion/Dirichlet.html#TauCeti.LFunctions.dirichletData_entireCompletion_eq_zero_iff) on the right half-plane, with equal multiplicities, and it is nonzero at the origin.

### Notable definitions and infrastructure

- [The entire completion](https://taucetiproject.org/docs/TauCeti/NumberTheory/LFunctions/Zeros/Completion/Basic.html#TauCeti.LFunctions.AnalyticLFunctionData.entireCompletion) of a record satisfying `HasMeromorphicContinuation` is the object every later count, factorization and finite-order statement is about. The record-level finite-order predicate built on it is also in place.
- [The zero count](https://taucetiproject.org/docs/TauCeti/Analysis/Meromorphic/Counting/Basic.html#TauCeti.zeroCount) and [signed divisor count](https://taucetiproject.org/docs/TauCeti/Analysis/Meromorphic/Counting/Basic.html#TauCeti.divisorCount) are finite over bounded regions and [split exactly across half-open rectangles](https://taucetiproject.org/docs/TauCeti/Analysis/Meromorphic/Counting/Rectangle.html#TauCeti.zeroCount_reProdIm_Ioc_eq_add). This is the carrier for `N(T)`, Riemann–von Mangoldt and certified zeros.
- [The holomorphic log Γ](https://taucetiproject.org/docs/TauCeti/Analysis/SpecialFunctions/Gamma/Log.html#TauCeti.logGamma) on the slit plane, normalised by `logGamma 2 = 0`, is the branch on which Stirling's formula is to be stated.

### Roadmap coverage

Layer 0 is done: `OrderLE`, finite order and vertical-strip growth come with their closure laws, and the entire completion has its divisor formula and the ζ instance. Layer 1 has the log Γ branch (1.1), the exact logarithmic derivatives of both gamma factors (half of 1.4) and their pole orders (the divisor half of 1.5). Layer 2 has the analytic conductor, its strip comparison, the conductor side of the normalisation translation, and the ζ and newform instances. It lacks the family conductors and the `continuedL` translation. Layer 4 has 4.1 and the divisor identity of 4.2. Layer 5 has the elementary factor (5.2) and the divisor-equality factorization. Layers 3, 6, 7, 8 and 9 are untouched. Layer 6 has only a finite-family nonvanishing input for Dirichlet characters near 1.

## The frontier

- **Stirling on the sector and on vertical strips (1.2–1.3).** Nothing yet; this is the input to the gamma-factor growth of 1.5, the local zero counts of 4.4 and Riemann–von Mangoldt.
- **The analytic reciprocal gamma factor and `continuedL` (1.6).** The entire reciprocals and pole orders of the gamma factors are in place. What remains is the record-level reciprocal and the removable extension that gives the continued L-function, with `ζ(0) = −1/2` as the test.
- **Jensen's bound (4.3) and Layer 9.** The disc zero bound in both forms is next for counting. Certified zeros need only Layer 0 and the counts of 4.1, so the certificate semantics can be built now.
- **The canonical product and Hadamard at order one (5.3–5.5).** The factor `E₁` and the exponential-quotient step exist. The canonical product needs zero summability from 5.1, which waits on Jensen.
- **Finite order for the families (3.1).** No family yet has a proved order bound, which every convexity and zero-counting statement takes as input.
