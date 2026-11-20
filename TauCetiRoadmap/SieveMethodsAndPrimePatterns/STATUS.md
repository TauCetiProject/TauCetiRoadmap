<!--tauceti-status:v1 {"roadmap":"SieveMethodsAndPrimePatterns","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e","ts":"2026-11-19T18:22:01+11:00"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","state":"untouched"},{"id":"Layer 1","remaining":"Selberg diagonal sums, Brun's sieve, Selberg optimal weights and upper bound, binary and polynomial sieves, classical applications","state":"partial"},{"id":"Layer 2","state":"untouched"},{"id":"Layer 3","state":"untouched"},{"id":"Layer 4","state":"untouched"},{"id":"Layer 5","state":"untouched"}],"readme_sha":"186c195e8f81dea4be2d04b3ae69bde8e128f1a9d7fbdff714ddbf74bb4c8ba9","roadmap":"SieveMethodsAndPrimePatterns","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e"}-->
# Status: SieveMethodsAndPrimePatterns

This file documents the status of the SieveMethodsAndPrimePatterns roadmap up until `b235000` (2026-11-19T18:22:01+11:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The roadmap has just begun. One Layer 1 milestone is proved: the explicit ordered-divisor majorant that bounds the remainders of Selberg's sieve and Maynard's sieve. No sieve inequality, large sieve, prime-distribution theorem or prime-pattern result has landed yet. Layers 0 and 2 through 5 have not started.

### Named results

- **The ordered-divisor harmonic majorant** — for every k and every real Z ≥ 1, the sum of τ_k(n)/n over n ≤ Z is at most (1+log Z)^k ([`sum_Ioc_zeta_pow_div_le_one_add_log_pow`](https://taucetiproject.org/docs/TauCeti/NumberTheory/ArithmeticFunction/DivisorBounds.html#ArithmeticFunction.sum_Ioc_zeta_pow_div_le_one_add_log_pow)), and the sum of τ_k(n) is at most Z(1+log Z)^(k−1) ([`sum_Ioc_zeta_pow_le_mul_one_add_log_pow`](https://taucetiproject.org/docs/TauCeti/NumberTheory/ArithmeticFunction/DivisorBounds.html#ArithmeticFunction.sum_Ioc_zeta_pow_le_mul_one_add_log_pow)). Both constants are 1, as the roadmap asks.
- **The 3^ω and divisor-square sums** — the sum of 3^ω(n) over n ≤ Z is at most Z(1+log Z)² ([`sum_Ioc_three_pow_cardDistinctFactors_le_mul_one_add_log_sq`](https://taucetiproject.org/docs/TauCeti/NumberTheory/ArithmeticFunction/DivisorBounds.html#ArithmeticFunction.sum_Ioc_three_pow_cardDistinctFactors_le_mul_one_add_log_sq)), and the sum of τ(n)² is at most Z(1+log Z)³ ([`sum_Ioc_sigma_zero_sq_le_mul_one_add_log_cube`](https://taucetiproject.org/docs/TauCeti/NumberTheory/ArithmeticFunction/DivisorBounds.html#ArithmeticFunction.sum_Ioc_sigma_zero_sq_le_mul_one_add_log_cube)). These are the forms the §1.6 Selberg applications consume.

### Notable definitions and infrastructure

- **Prime-factor counts against divisor coefficients** — the pointwise bound k^ω(n) ≤ τ_k(n) ([`pow_cardDistinctFactors_le_zeta_pow`](https://taucetiproject.org/docs/TauCeti/NumberTheory/ArithmeticFunction/Zeta.html#ArithmeticFunction.pow_cardDistinctFactors_le_zeta_pow)) turns any remainder weighted by k^ω into an ordered-divisor sum. Together with τ(n)² ≤ τ₄(n), it reduces both corollaries above to the majorant.

### Roadmap coverage

Layer 1 is partial. Of its §1.1 targets, only the ordered-divisor majorant is proved. The uniform multiplicative mean values, the Selberg denominator in dimension κ and the diagonal sums of GGPY and Maynard remain open, as do Brun's sieve (§1.2), Selberg's optimal weights and upper bound (§1.3), the binary and polynomial-vector sieves (§§1.4–1.5) and the classical applications (§1.6). Tau Ceti already contains a finite Selberg upper bound with its weighted remainder and a strict-cutoff 3^ω(d) remainder estimate. These live outside this roadmap's names, and the normalizer cuts off at d ≤ z, not at d < z. The optimality statement of §1.3 is not among them, so §1.3 is not counted as done here. Layers 0, 2, 3, 4 and 5 are untouched: the source contains none of their named declarations (`SieveGram`, `SieveVaughan`, `SieveDistribution`, `SieveMaynard` and the rest).

## The frontier

- **Selberg's optimal weights and upper bound (§1.3)** — state `SieveSelberg.diagonalMass` and `SieveSelberg.selberg_upper_bound` with the strict cutoff d < z. Then prove |λ_z| ≤ 1 and the minimality of 1/G. The existing Selberg weights and the 3^ω(d) remainder lemma should carry most of the proof.
- **Selberg's diagonal sums in dimension one (§1.1)** — the uniform mean values, the GGPY Lemma 3 asymptotic and Maynard's smoothly weighted Lemma 6.1. Layer 4's sieve sums depend on them.
- **Classical Selberg applications (§1.6)** — the Brun–Titchmarsh-type interval and progression bounds, the twin-prime and Goldbach upper bounds, and Brun's reciprocal convergence. These need §1.3 and the diagonal sum. The majorant at k = 4 is already available for the remainder.
- **Finite Gram inequalities (§0.4)** — Selberg's weighted inequality and its row-bound corollaries are self-contained linear algebra. They open the large-sieve route of Layer 2.
- **Vaughan's identity (§2.4)** — a finite identity with no analytic prerequisites, needed before the Layer 3 distribution estimates.
