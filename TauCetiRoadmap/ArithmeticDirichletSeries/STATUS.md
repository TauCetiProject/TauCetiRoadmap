<!--tauceti-status:v1 {"roadmap":"ArithmeticDirichletSeries","to_sha":"6bc3780dce4545c3a58085efada58f9f0043c7b1","ts":"2026-09-14T12:34:14Z"}-->
# Status: ArithmeticDirichletSeries

This file documents the status of the ArithmeticDirichletSeries roadmap up until `6bc3780` (2026-09-14T12:34:14Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Layers 0 through 6 are done apart from the cancellation package of 6.5, as is Layer 8; Layer 3's Euler product, the last formal-only piece, is now analytic, with the logarithm and the logarithmic-derivative identity beside it. Layer 9 has its analytic core but not its statement, Dirichlet density (Layer 7) has not begun, and the summit `primeNumberTheoremTransfer` does not exist.

### Named results

- **The analytic Euler product** — on the half-plane of absolute convergence the local Euler factors have an unrestricted product over the height-one primes, equal to the `LSeries` of the norm coefficients ([`TauCeti.EulerProductData.hasProd_eulerFactor`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ArithmeticDirichletSeries/EulerProduct/Analytic.html#TauCeti.EulerProductData.hasProd_eulerFactor)).
- **Nonvanishing of the Dedekind zeta function to the right of one** — `ζ_K s ≠ 0` for `Re s > 1`, since each local ratio lies strictly inside the unit disc ([`TauCeti.dedekindZeta_ne_zero_of_one_lt_re`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ArithmeticDirichletSeries/EulerProduct/Analytic.html#TauCeti.dedekindZeta_ne_zero_of_one_lt_re)).
- **The logarithmic derivative as a von Mangoldt series** — for a completely multiplicative weight, `logDeriv L(s) = -∑' A, χ(A) Λ(A) N(A)⁻ˢ` right of the abscissa of absolute convergence, prime powers included ([`TauCeti.MultiplicativeIdealWeight.logDeriv_LSeries_eq_neg_tsum_vonMangoldtTransform`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ArithmeticDirichletSeries/EulerProduct/Logarithm/VonMangoldtCoeff.html#TauCeti.MultiplicativeIdealWeight.logDeriv_LSeries_eq_neg_tsum_vonMangoldtTransform)).
- **The arithmetic Perron formula** — for a series absolutely convergent on the line, the truncated Perron integral is the series of truncated kernels at the ratios `x / n`, with an off-norm error bound and the half-weight limit at integer endpoints ([`TauCeti.truncatedPerron_LSeries`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ArithmeticDirichletSeries/Perron/Formula.html#TauCeti.truncatedPerron_LSeries)).
- **Landau's theorem** — a Dirichlet series with nonnegative coefficients whose abscissa of absolute convergence is the real number `σ` admits no analytic continuation across `σ` ([`TauCeti.LSeries.landau`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/LSeries/Landau.html#TauCeti.LSeries.landau)), now with its meromorphic-order corollary ([`TauCeti.LSeries.meromorphicOrderAt_lt_zero_of_eq_LSeries`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/LSeries/Landau.html#TauCeti.LSeries.meromorphicOrderAt_lt_zero_of_eq_LSeries)).

### Notable definitions and infrastructure

- **Euler-product data** — the package the export contract names: prime-power local series plus the coprime-multiplicativity proof, closed under product, conjugation, and restriction away from a finite prime set. Everything analytic above is stated for it, not for a bare ideal arithmetic function ([`TauCeti.EulerProductData`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ArithmeticDirichletSeries/EulerProduct/Data.html#TauCeti.EulerProductData)).
- **Prime-power ideals as a prime and an exponent** — the bijection `(𝔭, k) ↦ 𝔭 ^ (k + 1)`, turning a sum supported on prime powers into a sum over primes and exponents and carrying the Taylor expansion of the local logarithms ([`TauCeti.idealPrimePowerEquiv`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ArithmeticDirichletSeries/PrimePowerIndex.html#TauCeti.idealPrimePowerEquiv)).
- **The von Mangoldt coefficient system of a prime set** — the nonnegative coefficients whose inclusive partial sum is Chebyshev's ψ, in the `ℕ → ℝ` form a Tauberian theorem consumes ([`TauCeti.primeVonMangoldtCoeff`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ArithmeticDirichletSeries/PrimePsi.html#TauCeti.primeVonMangoldtCoeff)).

### Roadmap coverage

Layers 0, 1, 2, 4 and 5 are done: ideal carriers with their rejection tests, regrouping by norm, convolution and Möbius inversion, two-sided linear ideal counts giving the exact trivial abscissa `1`, the `O(√x log² x)` higher-prime-power estimate, and the negligibility of finite prime sets and of higher-degree primes. Only the density-zero form of 5.3 is missing, and it waits on Layer 7. Layer 3 is complete, though the holomorphic logarithm, the logarithmic derivative, and nonvanishing are proved for completely multiplicative weights, not arbitrary Euler-product data. Layer 6 has 6.1 through 6.4; 6.5 is untouched. Layer 7 is untouched: no pin update, density predicate, normalization, or fibre count exists. Layer 8 lacks only the equality of ordinary and absolute abscissae. Layer 9 is partial: the smoothed asymptotic holds for nonnegative coefficients with a continuous boundary remainder, with the Chebyshev-type growth bound derived rather than assumed, but neither `wienerIkehara` nor `wienerIkehara_zero` exists and 9.2 is untouched. Layer 10 has 10.2 and the ϑ-to-π leg of 10.3; `PrimeBoundaryRemainder`, `primePsi_asymptotic_of_boundary`, the summit, and 10.4 are untouched.

## The frontier

- **Wiener–Ikehara (Layer 9)** — what remains is the passage from smooth test functions to the sharp cutoff, then `wienerIkehara` and `wienerIkehara_zero` in the boundary formulation. The Fourier machinery, boundary limit, and growth bound are in place.
- **The boundary package and the summit (10.1, 10.3)** — `PrimeBoundaryRemainder K S δ`, `primePsi_asymptotic_of_boundary`, and `primeNumberTheoremTransfer` returning all three conclusions. Both transfer legs and the coefficient system exist, so this is assembly once Layer 9 lands; 10.4 also waits on the external `LFunctions` export.
- **Dirichlet density (Layer 7)** — untouched; the README makes updating the Mathlib pin the first task. The all-prime normalization `P_all(s) = log(1/(s-1)) + O(1)` of 7.2 now has both prerequisites: the analytic Euler product and the higher-prime-power bound.
- **Cancellation and a named continuation (6.5)** — `HasCancellation` for the `O(X^(1-1/[K:ℚ]))` partial-sum bound, and `continuedLFunctionOfWeight`, agreeing with the regrouped series on `Re s > 1` and analytic on `Re s > 1-1/[K:ℚ]`. Abel summation is available and nothing else blocks it.
- **Loose ends** — the equality of ordinary and absolute abscissae for nonnegative coefficients (8.1), and the density-zero statement for higher-degree primes (5.3), which cannot be stated before the Layer 7 predicate exists.
