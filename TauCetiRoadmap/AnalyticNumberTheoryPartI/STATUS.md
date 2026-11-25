<!--tauceti-status:v1 {"roadmap":"AnalyticNumberTheoryPartI","to_sha":"d25d526e576659755e7a68a568facb24cb7cf97f","ts":"2026-11-24T20:52:12Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","remaining":"the Landau deduction's conductor bound, the determinant method, the zero-free zeta strip, Mertens's third theorem, then section 0.34 and its consequences","state":"partial"},{"id":"Layer 1","state":"untouched"},{"id":"Layer 2","remaining":"the Bessel ODE, Eisenstein series, Hecke and Artin continuation, Zaman's bound, Brauer-Siegel","state":"partial"},{"id":"Layer 3","remaining":"the zeta moments, Shiu and Halasz mean values, smooth numbers and the Dickman function","state":"partial"}],"readme_sha":"459048064e44fb179a7e9b77f363baa2a8b0fe324f3005f261ba9f48723c58bf","roadmap":"AnalyticNumberTheoryPartI","to_sha":"d25d526e576659755e7a68a568facb24cb7cf97f"}-->
# Status: AnalyticNumberTheoryPartI

This file documents the status of the AnalyticNumberTheoryPartI roadmap up until `d25d526` (2026-11-24T20:52:12Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Layer 0's entire-function foundation is now complete, up to finite-order Hadamard factorization. So are Mertens's first two theorems and the effective real-zero gap. The Landau–Siegel exclusion has its classification step and parts of its other two, but is not assembled. Layers 2 and 3 have isolated results, and Layer 1 has not begun.

### Named results

- **Hadamard's factorization theorem** — a nonzero entire function of order at most `ρ` is `z^m e^(P(z))` times the genus-`⌊ρ⌋` canonical product over its zeros, with `deg P ≤ ⌊ρ⌋` and the reciprocal `(⌊ρ⌋+1)`-th powers of the zeros summable ([`finite_order_hadamard`](https://taucetiproject.org/docs/TauCeti/Analysis/Complex/Hadamard/FiniteOrder.html#TauCeti.finite_order_hadamard)).
- **Mertens's first theorem** — `|Σ_{p≤x} log p/p − log x| ≤ log 4 + 4` for every real `x ≥ 1`, the prime mass the exclusion theorem divides between split and inert primes ([`abs_sum_primesLE_log_div_sub_log_le`](https://taucetiproject.org/docs/TauCeti/NumberTheory/Chebyshev/Mertens.html#Chebyshev.abs_sum_primesLE_log_div_sub_log_le)).
- **Mertens's second theorem** — `|Σ_{p≤x} 1/p − log log x − B| ≤ 2(log 4 + 4)/log x` for `x ≥ 2`, with `B` the Mertens constant of the number-field theory ([`abs_sum_primesLE_one_div_sub_log_log_sub_mertensConstant_le`](https://taucetiproject.org/docs/TauCeti/NumberTheory/LFunctions/Mertens.html#TauCeti.LFunctions.abs_sum_primesLE_one_div_sub_log_log_sub_mertensConstant_le)).
- **The effective quadratic real-zero gap** — for squarefree `d ≠ 1`, every real zero of `L(s, χ_D)` has `1 − β ≥ (log φ · ε²/(324 · 4^ε)) |d|^(−1/2−ε)`, which disposes of the small conductors in the exclusion theorem ([`mul_rpow_neg_half_sub_le_one_sub_of_squarefree_of_LFunction_eq_zero`](https://taucetiproject.org/docs/TauCeti/NumberTheory/LSeries/Quadratic/RealZero.html#TauCeti.Multiquadratic.mul_rpow_neg_half_sub_le_one_sub_of_squarefree_of_LFunction_eq_zero)).
- **Primitive quadratic characters are Kronecker characters** — such a character is the character of a fundamental discriminant `D` with `|D|` equal to its level, and, if nonprincipal, the Jacobi symbol `(d/·)` at odd arguments for a squarefree `d ≠ 1` with `|d|` at most the level ([`exists_squarefree_apply_natCast_eq_jacobiSym`](https://taucetiproject.org/docs/TauCeti/NumberTheory/DirichletCharacter/Quadratic/FundamentalDiscriminant.html#DirichletCharacter.IsPrimitive.exists_squarefree_apply_natCast_eq_jacobiSym)).

### Notable definitions and infrastructure

- **Riemann's pole-cancelled `ξ`** [`riemannXi`](https://taucetiproject.org/docs/TauCeti/NumberTheory/LFunctions/Zeros/Completion/RiemannXi.html#TauCeti.LFunctions.riemannXi): entire and symmetric under `s ↦ 1 − s`, with `2ξ` identified with the entire completion of the conductor-one `L`-function, so Hadamard factorization and the explicit formulas can be applied to it directly.
- **The split-prime bound** [`exists_sum_primesLE_filter_eq_one_log_div_le`](https://taucetiproject.org/docs/TauCeti/NumberTheory/DirichletCharacter/LFunction/SplitPrimeSum.html#DirichletCharacter.exists_sum_primesLE_filter_eq_one_log_div_le): with one absolute `C`, `Σ_{p≤X, χ(p)=1} log p/p ≤ (e/2)(log X + C − Re L′/L(1 + 1/log X, χ))` for every character. This is the first half of Landau's deduction.
- **The K-Bessel kernel** [`positiveAxisBesselK`](https://taucetiproject.org/docs/TauCeti/Analysis/SpecialFunctions/Bessel/PositiveAxisK.html#Complex.positiveAxisBesselK): entire in the order, even, positive for real order, with Schläfli's cosh form, exponential decay and `K_(1/2)`. The Eisenstein series of §2.1b is built from it.

### Roadmap coverage

**Layer 0 is partial.** Done: §§0.10–0.12 with §§0.11a–0.11d, §0.14, §0.15 with §0.15a, §0.21, §§0.22–0.23a and §0.34a. Partial: §0.30a has only the local expansion of `ζ′/ζ`, without the window form, the safe heights or the character case. §0.33 has the logarithmic upper bound for `ζ` but not the zero-free strip or the bound for `1/ζ`. §0.34b has its split-prime half. §0.34c has only the resultant multiplicity bound. Not started: §0.34 and everything downstream of it (§§0.1, 0.6, 0.9, 0.18, 0.28, 0.32), Mertens's third theorem (§§0.26, 0.31) and the explicit Rosser–Schoenfeld-type bounds; its other sections were not checked one by one here. **Layer 1 is untouched.** **Layer 2 is partial.** It has the quadratic class-number values at one (the imaginary case of §2.17, and `hR = √D · L(1, χ_D)/2` ([`classNumber_mul_regulator_eq_LFunction_one`](https://taucetiproject.org/docs/TauCeti/NumberTheory/NumberField/Quadratic/DedekindZeta.html#TauCeti.NumberField.classNumber_mul_regulator_eq_LFunction_one)) in the real case) and §2.1a except the Bessel differential equation. Hecke and Artin continuation, Zaman's bound and Brauer–Siegel are open. **Layer 3 is partial.** §3.4 and §3.24a are done, and the sieve sections have a finite Selberg upper bound to work from.

## The frontier

- **The Landau deduction (§0.34b)** — the split-prime half is done; what remains is the conductor bound `−L′/L(s, χ) ≤ (1/2) log q + O(1) − Re 1/(s − β)` on the real segment, from ZerosOfLFunctions 6.4d through the dictionary of §0.30.
- **The determinant method (§0.34c)** — the resultant multiplicity bound is in. Hadamard's inequality for Gram matrices and the multiplicity estimate have not been stated in the form the section needs, nor has the `p`-adic valuation count for inert primes. It is the hardest step left.
- **The zero-free zeta strip (§§0.33, 0.33a)** — join the high-height zero-free region to the pole germ, bound `1/ζ` by `log(|Im s| + 2)`, then derive the bounds for `ζ′` and `ζ′/ζ`. The latter also needs the window form of §0.30a.
- **Mertens's third theorem and its constant (§§0.26, 0.31)** — identify `B = γ + Σ_p (log(1 − 1/p) + 1/p)`, then prove `∏_{p≤x} (1 − 1/p)^(−1) = e^γ log x + O(1)`.
- **Layer 1's explicit formulas** — the Riemann and generalized Riemann hypotheses as statements (§1.6) are easy to add. The half-interval explicit formula (§1.4) can now draw on `ξ`, Hadamard factorization and the local expansion of `ζ′/ζ`.
