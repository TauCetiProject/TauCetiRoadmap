<!--tauceti-status:v1 {"roadmap":"AnalyticNumberTheoryPartI","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e","ts":"2026-11-19T18:22:01+11:00"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","remaining":"the Landau deduction and determinant method for §0.34 and its consequences, Mertens's third theorem, finite-order Hadamard factorization, explicit prime bounds","state":"partial"},{"id":"Layer 1","state":"untouched"},{"id":"Layer 2","remaining":"everything beyond the quadratic class-number values at one: Hecke and Artin continuation, Zaman's bound, Brauer-Siegel","state":"partial"},{"id":"Layer 3","remaining":"the zeta moments, Shiu and Halasz mean values, smooth numbers and the Dickman function","state":"partial"}],"readme_sha":"0d28bb05ef8f75b250e370248aac3334f90c0bfb6f8f24da543cd03c1f74b2d8","roadmap":"AnalyticNumberTheoryPartI","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e"}-->
# Status: AnalyticNumberTheoryPartI

This file documents the status of the AnalyticNumberTheoryPartI roadmap up until `b235000` (2026-11-19T18:22:01+11:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Most of the work is in Layer 0, on the prime-sum and quadratic-character steps towards excluding Landau–Siegel zeros. Mertens's first and second theorems, the effective exponent-`1/2` real-zero gap and the Kronecker classification are done. The exclusion theorem itself has not been started: the Landau deduction and the determinant method are open. Neither has finite-order Hadamard factorization. Layers 2 and 3 have isolated results, and Layer 1 has not begun.

### Named results

- **Mertens's first theorem** — `|Σ_{p≤x} log p/p − log x| ≤ log 4 + 4` for every real `x ≥ 1`, also in von Mangoldt, strict-cutoff and interval forms ([`abs_sum_primesLE_log_div_sub_log_le`](https://taucetiproject.org/docs/TauCeti/NumberTheory/Chebyshev/Mertens.html#Chebyshev.abs_sum_primesLE_log_div_sub_log_le)).
- **Mertens's second theorem** — `|Σ_{p≤x} 1/p − log log x − B| ≤ 2(log 4 + 4)/log x` for `x ≥ 2`, where `B` is the Mertens constant of `ℚ` from the number-field theory ([`abs_sum_primesLE_one_div_sub_log_log_sub_mertensConstant_le`](https://taucetiproject.org/docs/TauCeti/NumberTheory/LFunctions/Mertens.html#TauCeti.LFunctions.abs_sum_primesLE_one_div_sub_log_log_sub_mertensConstant_le)).
- **The effective quadratic real-zero gap** — for squarefree `d ≠ 1`, every real zero of `L(s, χ_D)` satisfies `1 − β ≥ (log φ · ε²/(324 · 4^ε)) |d|^(−1/2−ε)`. This is the bound §0.34 will use for its finitely many small conductors ([`mul_rpow_neg_half_sub_le_one_sub_of_squarefree_of_LFunction_eq_zero`](https://taucetiproject.org/docs/TauCeti/NumberTheory/LSeries/Quadratic/RealZero.html#TauCeti.Multiquadratic.mul_rpow_neg_half_sub_le_one_sub_of_squarefree_of_LFunction_eq_zero)).
- **The real-quadratic class number formula** — `hR = √D · L(1, χ_D)/2` ([`classNumber_mul_regulator_eq_LFunction_one`](https://taucetiproject.org/docs/TauCeti/NumberTheory/NumberField/Quadratic/DedekindZeta.html#TauCeti.NumberField.classNumber_mul_regulator_eq_LFunction_one)). With `R ≥ log φ`, it gives the sharp bound `L(1, χ_D) ≥ 2 log φ/√|D|` over all quadratic fields ([`two_mul_log_goldenRatio_div_sqrt_le_LFunction_one_re`](https://taucetiproject.org/docs/TauCeti/NumberTheory/NumberField/Quadratic/DedekindZeta.html#TauCeti.NumberField.two_mul_log_goldenRatio_div_sqrt_le_LFunction_one_re)).
- **Primitive quadratic characters are Kronecker characters** — every primitive quadratic Dirichlet character of level `N` is the character of a fundamental discriminant `D` with `|D| = N` ([`exists_isFundamentalDiscr_apply_eq`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/DirichletCharacter/Quadratic/FundamentalDiscriminant.html#DirichletCharacter.IsPrimitive.exists_isFundamentalDiscr_apply_eq)).

### Notable definitions and infrastructure

- **Weierstrass primary factors** [`weierstrassFactor`](https://taucetiproject.org/docs/TauCeti/Analysis/Complex/CanonicalProduct/ElementaryFactor.html#Complex.weierstrassFactor): `E_p` in every genus, with its simple zero at one and the bound `|1 − E_p(w)| ≤ |w|^(p+1)` on the unit disc. Hadamard factorization in finite order will build its products from these.
- **Removing the zero at the origin** [`exists_eq_sub_pow_mul`](https://taucetiproject.org/docs/TauCeti/Analysis/Complex/GrowthOrder/Zero/Factorization.html#TauCeti.OrderLE.exists_eq_sub_pow_mul): dividing an entire function of bounded order by its full zero at a point leaves a cofactor of the same order that does not vanish there. This is the core of §0.22.
- **The weighted prime sum** [`weightedPrimeSum`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/Chebyshev/WeightedPrimeMellin.html#TauCeti.weightedPrimeSum): `Σ_{p≤x} a_p log p/p` with Banach-valued weights. It now has the linear Mertens bound and its Mellin-smoothed form, which the Landau deduction will consume.

### Roadmap coverage

**Layer 0 is partial.** The following are done: §0.10 (the prime count in `(x, 3x]`), §0.11 and §§0.11a–0.11d, §0.12, and §0.21. §0.34a is proved in its fundamental-discriminant form but lacks the Kronecker-symbol corollary. §0.15 has the factors and the genus-one products but not the variable-genus product theorem. §0.22 has its cofactor step. Not started: the Landau deduction and the determinant method (§§0.34b–0.34c), §0.34 itself and everything downstream of it (§§0.1, 0.6, 0.9, 0.18, 0.28, 0.32), finite-order Hadamard factorization (§§0.15a, 0.23), §§0.26, 0.26a and 0.31 (Mertens's third theorem and the constant), and the explicit Rosser–Schoenfeld-type bounds. **Layer 1 is untouched**, although Dini's Fourier inversion and the Perron kernel `1/(s(s+1))` are ready for §§1.4a and 1.8a. **Layer 2 is partial** only through the quadratic class-number values at one: the imaginary case of §2.17 is proved, and the real case above. **Layer 3 is partial**: §3.4 (`d_k(n) ≪_ε n^ε`) and §3.24a (`ζ(s)⁴ = ζ(2s) Σ τ(n)² n^(−s)`) are done, and the sieve sections have a finite Selberg upper bound to work from.

## The frontier

- **The Kronecker-symbol form of §0.34a** — from the fundamental discriminant, read off its squarefree part `d ≠ 1` with `|d| ≤ q` and `χ(p) = (d/p)` at odd primes `p ∤ q`.
- **The Landau deduction (§0.34b)** — a real zero leaves few split primes. Mertens's first theorem, the uniform Euler logarithmic derivatives and the zeta side are now in hand. What remains is the conductor bound for `−L′/L` on the real segment, from ZerosOfLFunctions through §0.30.
- **The determinant method (§0.34c)** — inert primes carry at most three quarters of the Mertens mass. None of its own targets has been started: Hadamard's inequality for Gram matrices, the resultant multiplicity bound and the multiplicity estimate. This is the hardest step before §0.34.
- **Mertens's third theorem and its constant (§§0.26, 0.26a, 0.31)** — identify `B = γ + Σ_p (log(1 − 1/p) + 1/p)`, then prove `∏_{p≤x} (1 − 1/p)^(−1) = e^γ log x + O(1)`. The library has the limit form only through the number-field theory.
- **Finite-order Hadamard factorization (§§0.15, 0.15a, 0.22, 0.23)** — still needed: the variable-genus product theorem, equal-divisor factorization, putting the `z^m` factor back, and the good-circle estimate. It is independent of the Landau–Siegel chain.
