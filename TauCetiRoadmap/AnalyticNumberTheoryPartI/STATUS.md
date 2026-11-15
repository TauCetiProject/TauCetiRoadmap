<!--tauceti-status:v1 {"roadmap":"AnalyticNumberTheoryPartI","to_sha":"aa6e43e14b2556add36c8149e543f059a45926d3","ts":"2026-11-13T23:20:12Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","remaining":"Mertens's theorems, the Landau deduction and determinant method for Landau-Siegel exclusion and its consequences, Hadamard factorization, explicit prime bounds","state":"partial"},{"id":"Layer 1","state":"untouched"},{"id":"Layer 2","state":"untouched"},{"id":"Layer 3","state":"untouched"}],"readme_sha":"f22e8abc0fafa4e4625ccedf21c994953311982cafa663aa87564291d5025115","roadmap":"AnalyticNumberTheoryPartI","to_sha":"aa6e43e14b2556add36c8149e543f059a45926d3"}-->
# Status: AnalyticNumberTheoryPartI

This file documents the status of the AnalyticNumberTheoryPartI roadmap up until `aa6e43e` (2026-11-13T23:20:12Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Work so far is confined to Layer 0. It covers the Kronecker classification of primitive real characters (§0.34a) and most of the elementary inputs to Mertens's estimate (§§0.11a–0.11d). None of the roadmap's headline theorems has been proved yet, including the uniform exclusion of Landau–Siegel zeros, Siegel–Walfisz, Hadamard factorization and Mertens's theorems. Layers 1–3 have not begun.

### Named results

- **Primitive quadratic characters are Kronecker characters**: every primitive quadratic Dirichlet character of nonzero level `N` is the character of a fundamental discriminant `D` with `|D| = N`, and away from characteristic two `D = χ(−1)N` ([`exists_isFundamentalDiscr_apply_eq`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/DirichletCharacter/Quadratic/FundamentalDiscriminant.html#DirichletCharacter.IsPrimitive.exists_isFundamentalDiscr_apply_eq), [`apply_eq_fundamentalDiscriminantCharCast_ite`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/DirichletCharacter/Quadratic/FundamentalDiscriminant.html#DirichletCharacter.IsPrimitive.apply_eq_fundamentalDiscriminantCharCast_ite)).
- **Chebyshev's identity**: `log ⌊x⌋! = Σ_{n≤x} Λ(n)⌊x/n⌋` for every real `x`, the entry point to Mertens's first theorem ([`log_floor_factorial_eq_sum_vonMangoldt`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/Chebyshev/LogFactorial.html#Chebyshev.log_floor_factorial_eq_sum_vonMangoldt)). It comes with the two-sided Stirling-type bound `|log ⌊x⌋! − (x log x − x)| ≤ (1/2) log x + 1` ([`abs_log_floor_factorial_sub_le`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/SpecialFunctions/Log/Factorial.html#Real.abs_log_floor_factorial_sub_le)).
- **The uniform Euler logarithmic derivative**: on `re s > 1`, the norm of `L′/L(s, χ) + Σ_p χ(p) log p / p^s` is at most an absolute constant, independent of the modulus and the character ([`norm_logDeriv_LFunction_add_tsum_prime_le`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/DirichletCharacter/LFunction/LogDeriv.html#DirichletCharacter.norm_logDeriv_LFunction_add_tsum_prime_le)).
- **The pole of `−ζ′/ζ` at one**: `−ζ′/ζ(1 + η) = η⁻¹ + O(1)` uniformly for `0 < η ≤ 1`, the zeta-side input to the Landau deduction ([`exists_norm_neg_logDeriv_riemannZeta_one_add_sub_inv_le`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/LSeries/RiemannZeta/LogDerivNearOne.html#TauCeti.exists_norm_neg_logDeriv_riemannZeta_one_add_sub_inv_le)).
- **The weighted-prime Mellin identity**: for prime weights bounded by one, `Σ_p a_p log p / p^(1+η) = η ∫_{t>1} t^(−1−η) A(t) dt` ([`hasSum_weightedPrimeSeries`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/Chebyshev/WeightedPrimeMellin.html#TauCeti.hasSum_weightedPrimeSeries)).

### Notable definitions and infrastructure

- **The weighted prime sum** [`weightedPrimeSum`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/Chebyshev/WeightedPrimeMellin.html#TauCeti.weightedPrimeSum): `Σ_{p≤x} (log p / p) a_p` on Mathlib's native finite set of primes, with Banach-valued weights. Real, signed and complex weightings are one object.
- **The Mellin weight integral** [`mellinWeightIntegral`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/SpecialFunctions/Integrals/MellinWeight.html#TauCeti.mellinWeightIntegral): `η ∫_{t>1} t^(−1−η) f(t) dt`, viewed as a probability density. It has mean `η⁻¹` in `log t`, and Jensen's bound [`mellinWeightIntegral_log_log_le`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/SpecialFunctions/Integrals/MellinWeight.html#TauCeti.mellinWeightIntegral_log_log_le) controls `log log`.
- **The prime tail**: `Σ_{p≥y} log p / p² ≤ 2 log 4 / y` ([`tsum_prime_log_div_sq_ge_le`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/Chebyshev/PrimeTail.html#TauCeti.tsum_prime_log_div_sq_ge_le)), with its strict, inclusive and interval variants.

### Roadmap coverage

Layer 0 is partial. §§0.11b and 0.11d are done, and §0.11c is done in substance, with the Mellin identity resting on the elementary `(1 + log t)²` partial-sum bound rather than on Mertens. §0.11a has its tail bound but not the native Mertens export. §0.34a has its classification but not its Kronecker-symbol corollary. The remaining Layer 0 milestones have not started: Mertens's three theorems (§§0.11, 0.21, 0.26), §§0.34b–0.34c and the exclusion of Landau–Siegel zeros, its consequences (§§0.6, 0.9, 0.18, 0.28, 0.32), Weierstrass and Hadamard factorization (§§0.15, 0.23, 0.29) and the explicit Rosser–Schoenfeld-type bounds. Layers 1, 2 and 3 are untouched.

## The frontier

- **Mertens's first theorem (§0.11)**: `Σ_{p≤x} log p / p = log x + O(1)`, then its export on `Nat.primesLE` (§0.11a). Chebyshev's identity, the factorial bounds and the higher-prime-power summability are now in place; what remains is the floor replacement via `ψ(x) = O(x)` and the removal of prime powers.
- **The Kronecker-symbol form of §0.34a**: from the fundamental discriminant, read off its squarefree part `d ≠ 1`, `|d| ≤ q` and `χ(p) = (d/p)` at odd primes `p ∤ q`. QuadraticCharactersAndReduction §1.4 and the determinant method both use this form.
- **The Landau deduction (§0.34b)**: a real zero leaves few split primes. The zeta side and the uniform Euler logarithmic derivatives are done. It still needs the conductor bound for `−L′/L` on the real segment, from ZerosOfLFunctions 6.4d through §0.30, and Mertens.
- **Inert primes carry at most three quarters of the Mertens mass (§0.34c)**: the determinant method. Its own targets, Hadamard's inequality for positive semidefinite Gram matrices, the resultant multiplicity bound and the multiplicity estimate, have not been started. This is the hardest step before §0.34.
- **Weierstrass primary factors of every genus (§0.15)**: these lead to finite-order Hadamard factorization (§0.23). This work is independent of the Landau–Siegel chain and can proceed in parallel.
