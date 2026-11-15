<!--tauceti-status:v1 {"roadmap":"PrimitivePrimeDivisors","to_sha":"7ca783d4c8d324c9c74efaacd641c8a40f69f284","ts":"2026-11-09T03:33:42Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","remaining":"the expansion identities of section 0.3 and the size estimates of section 0.4 for the homogeneous cyclotomic value","state":"partial"},{"id":"Layer 1","remaining":"the nonprimitive prime divisors of the cyclotomic value (section 1.3) and its exact valuation","state":"partial"},{"id":"Layer 2","remaining":"the estimate that the cyclotomic value exceeds P(n), the general existence theorem and its iff characterization","state":"partial"},{"id":"Layer 3","remaining":"the existence corollaries: the order form, the base-one specializations and exists_prime_dvd_pow_add_pow","state":"partial"}],"readme_sha":"feb728a05b8c232346188849c7cbefa087358acf58bfa5db9cfdfff342077eb1","roadmap":"PrimitivePrimeDivisors","to_sha":"7ca783d4c8d324c9c74efaacd641c8a40f69f284"}-->
# Status: PrimitivePrimeDivisors

This file documents the status of the PrimitivePrimeDivisors roadmap up until `7ca783d` (2026-11-09T03:33:42Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The Bang–Zsigmondy theorem is not yet proved, but each of the four layers has started. The two-variable cyclotomic value `Φ_n(a,b)` and its factorization of `aⁿ − bⁿ` exist, the order criterion and the exact valuations of `aᵏ − bᵏ` are proved, and exponents one and two are settled completely. Still missing: the expansion identities and size bounds for `Φ_n(a,b)`, the analysis of its nonprimitive prime divisors, and the general existence theorem with its order-form corollaries.

### Named results

**The exponent-two case of Bang–Zsigmondy** — for coprime `b ≤ a`, `a² − b²` has a primitive prime divisor exactly when `a + b` is not a power of two ([`exists_prime_dvd_sq_sub_sq_iff`](https://taucetiproject.org/docs/TauCeti/NumberTheory/PrimitivePrimeDivisors/SmallExponents.html#TauCeti.exists_prime_dvd_sq_sub_sq_iff)), and the exponent-one case says `a − b` has one exactly when `1 < a − b` ([`exists_prime_dvd_sub_iff`](https://taucetiproject.org/docs/TauCeti/NumberTheory/PrimitivePrimeDivisors/SmallExponents.html#TauCeti.exists_prime_dvd_sub_iff)).

**The exception at `(2, 1, 6)`** — `2⁶ − 1 = 63` has no primitive prime divisor, because `3 ∣ 2² − 1` and `7 ∣ 2³ − 1` ([`not_exists_prime_dvd_two_pow_six_sub_one_pow_six`](https://taucetiproject.org/docs/TauCeti/NumberTheory/PrimitivePrimeDivisors/SmallExponents.html#TauCeti.not_exists_prime_dvd_two_pow_six_sub_one_pow_six)).

**Primitivity as an order condition** — for coprime bases, a prime is a primitive divisor of `aⁿ − bⁿ` exactly when it is prime to `ab` and `a/b` has order `n` modulo it, so such a prime is `1` modulo `n` and exceeds `n` (`Nat.Prime.primitive_divisor_iff_orderOf_eq`).

**Lifting the exponent from the order** — for an odd prime `p` dividing `xᵈ − yᵈ` but not `d`, `v_p(xⁿ − yⁿ) = v_p(xᵈ − yᵈ) + v_p(n)` for every multiple `n` of `d` ([`Nat.multiplicity_pow_sub_pow_of_dvd_pow_sub_pow`](https://taucetiproject.org/docs/TauCeti/NumberTheory/Multiplicity.html#Nat.multiplicity_pow_sub_pow_of_dvd_pow_sub_pow)), with the companion formulas at `p = 2`.

**Divisibility of sums of powers** — if `a/b` has order `2m` modulo a prime `p`, then `p ∣ aᵏ + bᵏ` exactly for the odd multiples `k` of `m` ([`Nat.Prime.dvd_pow_add_pow_iff_of_orderOf_eq_two_mul`](https://taucetiproject.org/docs/TauCeti/Data/ZMod/OrderOf.html#Nat.Prime.dvd_pow_add_pow_iff_of_orderOf_eq_two_mul)).

### Notable definitions and infrastructure

**The homogeneous cyclotomic value** — `TauCeti.homogeneousCyclotomic n a b`, the degree-`φ(n)` homogenization of `Φ_n` evaluated at `(a, b)`, comes with its closed forms, symmetry, transport along ring maps, positivity for `0 ≤ b < a`, and the factorization `aⁿ − bⁿ = ∏_{d ∣ n} Φ_d(a,b)`. This is the object whose prime divisors the main proof must control.

**The consecutive-base estimate** — for `0 < b < a` and `n ≥ 3`, `aⁿ − bⁿ > n(a + b)` except at `(2, 1, 3)`, and every positive power of `(aⁿ − bⁿ)/(a + b)` exceeds `n` there ([`TauCeti.lt_pow_sub_pow_div_add_pow`](https://taucetiproject.org/docs/TauCeti/NumberTheory/PrimitivePrimeDivisors/Estimates.html#TauCeti.lt_pow_sub_pow_div_add_pow)). It is the arithmetic half of the bound `Φ_n(a,b) > P(n)` and isolates why `(2, 1, 6)` is exceptional.

### Roadmap coverage

Layer 0 is partial: the definition, closed forms, symmetry, transport, positivity and the factorization of `aⁿ − bⁿ` are done, while the expansion identities `Φ_{np}(a,b) = Φ_n(aᵖ, bᵖ)` (§0.3) and the size estimates `(a − b)^φ(n) < Φ_n(a,b) ≤ (a + b)^φ(n)` (§0.4) are not. Layer 1 is partial: the order criterion, primitivity as an order condition and the exact valuations of `aᵏ − bᵏ` are done; the nonprimitive prime divisors of `Φ_n(a,b)` (§1.3) and its valuation are not. Layer 2 is partial: exponents one and two and both nonexistence results are done; the estimate `Φ_n(a,b) > P(n)` exists only in its arithmetic form, and neither the general existence theorem nor the full characterization exists yet. Layer 3 is partial: the `q^k ± 1` criteria and the sums-of-powers divisibility under an order-`2m` hypothesis are done; the existence corollaries (order form, base one, `exists_prime_dvd_pow_add_pow`) all wait on Layer 2.

## The frontier

- **Expansion identities and size bounds for `Φ_n(a,b)`** — homogenize Mathlib's `cyclotomic_expand_eq_cyclotomic(_mul)` and the real evaluation bounds; together with the existing estimate this gives the consecutive-base bound of §0.4.
- **Nonprimitive prime divisors of `Φ_n(a,b)`** — show that the order of `a/b` modulo `p ∣ Φ_n(a,b)` is the prime-to-`p` part of `n`, so for `n ≥ 3` a nonprimitive prime divisor is `P(n)` with valuation one. The `aᵏ − bᵏ` valuations it needs are in place; it also needs §0.1 transport into `ZMod p`, which exists.
- **The estimate `Φ_n(a,b) > P(n)`** — combine §0.3–0.4 with §1.3 for `n ≥ 3` outside `(2, 1, 6)`.
- **The Bang–Zsigmondy theorem and its characterization** — `exists_prime_dvd_pow_sub_pow` and `exists_prime_dvd_pow_sub_pow_iff`; the `n = 2` case and both converses are already proved, so only the `n ≥ 3` existence remains.
- **The order-form corollaries** — `exists_prime_orderOf_div_eq`, its base-one forms and `exists_prime_dvd_pow_add_pow`; these should be short once the main theorem lands, since primitivity-as-order and the sums-of-powers criterion are proved.
