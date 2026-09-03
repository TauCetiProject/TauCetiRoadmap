<!--tauceti-status:v1 {"roadmap":"ArithmeticDirichletSeries","to_sha":"8745177e39945cdda39b4203688f5f6bb380a0b9","ts":"2026-09-01T22:18:35Z"}-->
# Status: ArithmeticDirichletSeries

This file documents the status of the ArithmeticDirichletSeries roadmap up until `8745177` (2026-09-01T22:18:35Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Layers 0 through 5 and Layer 8 are done, as are the ψ-to-ϑ and ϑ-to-π legs of Layer 10; Layer 6 lacks the arithmetic Perron formula and the cancellation package, and Layer 3's Euler product is formal only. Layers 7 (Dirichlet density) and 9 (Wiener–Ikehara) have not begun, so the summit `primeNumberTheoremTransfer` does not exist.

### Named results

- **Landau's theorem** — a Dirichlet series with nonnegative coefficients whose abscissa of absolute convergence is the real number `σ` admits no analytic continuation across `σ` ([`TauCeti.LSeries.landau`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/LSeries/Landau.html#TauCeti.LSeries.landau)).
- **Regrouping by norm** — absolute convergence of the ideal-indexed Dirichlet series gives `LSeriesSummable` of the norm coefficients with the same sum, the converse holding under nonnegativity of every ideal summand ([`TauCeti.regroupByNorm`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ArithmeticDirichletSeries/Regroup.html#TauCeti.regroupByNorm)).
- **The exact trivial abscissa** — the Dirichlet series of the trivial ideal weight has abscissa of absolute convergence exactly `1`, proved from two-sided linear ideal counts and not from continuation ([`TauCeti.abscissaOfAbsConv_normCoeff_one`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ArithmeticDirichletSeries/Estimates.html#TauCeti.abscissaOfAbsConv_normCoeff_one)).
- **The formal Euler product** — the norm coefficients of a coprime-multiplicative ideal arithmetic function are Mathlib's `ArithmeticFunction.eulerProduct` of its canonical local factors, coefficientwise and with no convergence content ([`TauCeti.IdealArithmeticFunction.normCoeff_eq_eulerProduct`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ArithmeticDirichletSeries/EulerProduct.html#TauCeti.IdealArithmeticFunction.normCoeff_eq_eulerProduct)).
- **The transfer from ϑ to π** — if `ϑ(x) = δx + o(x)` for a set of height-one primes with `δ ≠ 0`, then `π(x) ∼ δ Li(x)`; the zero-density case is separate ([`TauCeti.primeCount_asymptotic_of_primeTheta`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ArithmeticDirichletSeries/Transfer.html#TauCeti.primeCount_asymptotic_of_primeTheta)).

### Notable definitions and infrastructure

- **The ideal carriers** — functions on nonzero ideals with extension by zero, and the completely multiplicative and unitary weights with conjugation, restriction, norm twists, finite-order weights, and transport along field isomorphisms; the zero-ideal, Möbius, and real-twist rejection tests are all proved ([`TauCeti.IdealArithmeticFunction`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ArithmeticDirichletSeries/Basic.html#TauCeti.IdealArithmeticFunction), [`TauCeti.MultiplicativeIdealWeight`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ArithmeticDirichletSeries/Weight.html#TauCeti.MultiplicativeIdealWeight)).
- **Inclusive summatory functions over a Northcott norm** — a generic cutoff carrier and summatory function with real-to-natural cutoff conversion and finite-modification invariance, of which `primeTheta`, `primeCount`, and `primePsi` are instances ([`TauCeti.summatory`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Order/Northcott.html#TauCeti.summatory)).
- **The von Mangoldt coefficient system of a prime set** — the exact nonnegative coefficients whose inclusive partial sum is Chebyshev's ψ, in the `ℕ → ℝ` form a Tauberian theorem consumes ([`TauCeti.primeVonMangoldtCoeff`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ArithmeticDirichletSeries/PrimePsi.html#TauCeti.primeVonMangoldtCoeff)).

### Roadmap coverage

Layers 0, 4, and 5 are done, including the crude `O(x log x)` prime count, the `O(√x log² x)` higher-prime-power estimate with its isolated hypothesis for other weights, and the residue-degree-above-one bounds; the density-zero form of 5.3 waits on Layer 7. Layer 1 is done except that norm-twist and field-equivalence compatibility of `normCoeff` are not visible. Layer 2 is done except that 2.3 lacks the logarithmic-derivative coefficient identity. Layer 3 is partial: local factors and the finite product are done, the infinite product is formal only (no identification with `LSeries (normCoeff f)`, no nonvanishing), 3.4 is untouched, and nothing named `EulerProductData` exists. Layer 6 has 6.1, 6.2, and 6.3 done (Abel summation, the `Li` transfers, the Perron kernel with endpoint value and smoothed-step error); 6.4 and 6.5 are untouched. Layer 7 is untouched. Layer 8 is done except that the ordinary-versus-absolute abscissa equality and the meromorphic-order corollary of 8.1 are not visible. Layer 9 is untouched. Layer 10 has 10.2 and the ϑ-to-π leg of 10.3 done; `PrimeBoundaryRemainder`, `primePsi_asymptotic_of_boundary`, the summit, and 10.4 are untouched.

## The frontier

- **Wiener–Ikehara (Layer 9)** — `wienerIkehara` and `wienerIkehara_zero` in the boundary formulation with `LSeriesHasSum` on `Re s > 1` and a separately named continuous `G` on `Re s ≥ 1`. Nothing in the roadmap blocks it; the bridge `primePsi_eq_sum_range` is in place.
- **The boundary package and the summit (10.1, 10.3)** — `PrimeBoundaryRemainder K S δ`, `primePsi_asymptotic_of_boundary`, and `primeNumberTheoremTransfer` returning all three conclusions. Both transfer legs and the coefficient system exist, so this is assembly once Layer 9 lands; 10.4 also waits on the external `LFunctions` export.
- **Analytic Euler product and logarithmic derivative (3.3, 3.4, 2.3)** — identify the product with `LSeries (normCoeff f)` under absolute convergence, prove nonvanishing where the reciprocal product converges, choose the logarithm, and prove the von Mangoldt coefficient identity for the logarithmic derivative. The contract names `EulerProductData`; the data now lives in `IsMultiplicative` plus `localArithmeticFactor`, so the package must be introduced or the contract row amended.
- **Dirichlet density (Layer 7)** — untouched; the README makes updating the Mathlib pin the first task. The all-prime normalization of 7.2 needs the analytic Euler product above; the higher-degree-prime bound uniform in `s ≥ 1` is already available for the density-zero statement.
- **Arithmetic Perron and cancellation (6.4, 6.5)** — `perronFormula` in off-norm and half-weight forms, `HasCancellation`, and `continuedLFunctionOfWeight`. The kernel, its error constant, and the endpoint limit are ready; the interchange with an absolutely convergent `LSeries` remains.
