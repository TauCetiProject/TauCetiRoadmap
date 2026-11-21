# Progress log: SieveMethodsAndPrimePatterns

An append-only record of what landed on the SieveMethodsAndPrimePatterns roadmap, one section per window of
merged pull requests, oldest first. Generated; the prose is not security-validated.
For a current snapshot instead, read `STATUS.md` beside this file.

<!--tauceti-progress:v1 {"from_sha":"0432fef328d2b9431672c6bcbb8fbb0588d8a44c","prs":[42825],"roadmap":"SieveMethodsAndPrimePatterns","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e"}-->
## SieveMethodsAndPrimePatterns: 2026-11-16 to 2026-11-19 (`0432fef` to `b235000`)

The roadmap's first proved target is the ordered-divisor majorant of Layer 1 §1.1. With τ_k the number of ordered factorizations into k positive factors, for every real Z ≥ 1 we have Σ_(n≤Z) τ_k(n)/n ≤ (1+log Z)^k ([`sum_Ioc_zeta_pow_div_le_one_add_log_pow`](https://taucetiproject.org/docs/TauCeti/NumberTheory/ArithmeticFunction/DivisorBounds.html#ArithmeticFunction.sum_Ioc_zeta_pow_div_le_one_add_log_pow)) and Σ_(n≤Z) τ_k(n) ≤ Z(1+log Z)^(k−1) ([`sum_Ioc_zeta_pow_le_mul_one_add_log_pow`](https://taucetiproject.org/docs/TauCeti/NumberTheory/ArithmeticFunction/DivisorBounds.html#ArithmeticFunction.sum_Ioc_zeta_pow_le_mul_one_add_log_pow)), both with constant one, exactly as the roadmap asks (TauCeti#42825). The proofs go through sharper versions with the harmonic number in place of 1+log Z.

The two consequences that the Selberg remainder estimates need come with it. One is Σ_(n≤Z) 3^ω(n) ≤ Z(1+log Z)² ([`sum_Ioc_three_pow_cardDistinctFactors_le_mul_one_add_log_sq`](https://taucetiproject.org/docs/TauCeti/NumberTheory/ArithmeticFunction/DivisorBounds.html#ArithmeticFunction.sum_Ioc_three_pow_cardDistinctFactors_le_mul_one_add_log_sq)), from the pointwise bound k^ω(n) ≤ τ_k(n) ([`pow_cardDistinctFactors_le_zeta_pow`](https://taucetiproject.org/docs/TauCeti/NumberTheory/ArithmeticFunction/Zeta.html#ArithmeticFunction.pow_cardDistinctFactors_le_zeta_pow)). The other is Σ_(n≤Z) τ(n)² ≤ Z(1+log Z)³ ([`sum_Ioc_sigma_zero_sq_le_mul_one_add_log_cube`](https://taucetiproject.org/docs/TauCeti/NumberTheory/ArithmeticFunction/DivisorBounds.html#ArithmeticFunction.sum_Ioc_sigma_zero_sq_le_mul_one_add_log_cube)), from τ(n)² ≤ τ₄(n). No sieve inequality itself has landed yet.
