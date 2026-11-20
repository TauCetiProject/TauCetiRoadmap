<!--tauceti-status:v1 {"roadmap":"PrimitivePrimeDivisors","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e","ts":"2026-11-19T18:22:01+11:00"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","state":"done"},{"id":"Layer 1","state":"done"},{"id":"Layer 2","state":"done"},{"id":"Layer 3","state":"done"}],"readme_sha":"11680de6e7d4e2d362f302ca594232179b5dc6ef3d248ca9058aca710d47a639","roadmap":"PrimitivePrimeDivisors","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e"}-->
# Status: PrimitivePrimeDivisors

This file documents the status of the PrimitivePrimeDivisors roadmap up until `b235000` (2026-11-19T18:22:01+11:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The summit is reached: the Bang–Zsigmondy theorem for coprime `a > b > 0` is proved with both exceptions and their converses, together with its order-form, base-one and sums-of-powers corollaries. Every milestone of all four layers is now in the library, and nothing in the roadmap remains open.

### Named results

**The Bang–Zsigmondy theorem** — for coprime `a > b > 0` and `n ≥ 2`, `aⁿ − bⁿ` has a prime divisor dividing no `aᵏ − bᵏ` with `0 < k < n` exactly when neither `n = 2` with `a + b` a power of two nor `(a, b, n) = (2, 1, 6)` ([`TauCeti.exists_prime_dvd_pow_sub_pow_iff`](https://taucetiproject.org/docs/TauCeti/NumberTheory/PrimitivePrimeDivisors/Zsigmondy.html#TauCeti.exists_prime_dvd_pow_sub_pow_iff)).

**Primes of prescribed order** — outside the same exceptions there is a prime `p ∤ ab` modulo which `a/b` has order exactly `n` ([`TauCeti.exists_prime_orderOf_div_eq`](https://taucetiproject.org/docs/TauCeti/NumberTheory/PrimitivePrimeDivisors/Zsigmondy.html#TauCeti.exists_prime_orderOf_div_eq)). With `b = 1` this gives a prime modulo which `a` has order `n` for `a, n ≥ 3` ([`TauCeti.exists_prime_orderOf_eq`](https://taucetiproject.org/docs/TauCeti/NumberTheory/PrimitivePrimeDivisors/Zsigmondy.html#TauCeti.exists_prime_orderOf_eq)), and modulo which `2` has order `n` for `n ≥ 2`, `n ≠ 6`. This is the form that work on the orders of finite linear groups consumes.

**Primitive divisors of sums of powers** — for coprime `a > b > 0` there is a prime dividing `aⁿ + bⁿ` and no `aᵏ − bᵏ` with `0 < k < 2n`, except when `n = 1` with `a + b` a power of two, or at `(2, 1, 3)` ([`TauCeti.exists_prime_dvd_pow_add_pow_iff`](https://taucetiproject.org/docs/TauCeti/NumberTheory/PrimitivePrimeDivisors/Zsigmondy.html#TauCeti.exists_prime_dvd_pow_add_pow_iff)).

**Nonprimitive prime divisors of a cyclotomic value** — for coprime bases and `n ≠ 2`, a prime dividing `Φ_n(a,b)` that already divides an earlier `aᵏ − bᵏ` divides `n`, is its largest prime factor, and divides `Φ_n(a,b)` exactly once ([`Nat.Prime.multiplicity_homogeneousCyclotomic_of_not_primitive`](https://taucetiproject.org/docs/TauCeti/NumberTheory/PrimitivePrimeDivisors/Cyclotomic.html#Nat.Prime.multiplicity_homogeneousCyclotomic_of_not_primitive)). This is the arithmetic heart of the proof.

**The cyclotomic size estimate** — for `0 < b < a` and a prime `p ∣ n`, `p < Φ_n(a,b)` except at `(a, b, n, p) = (2, 1, 6, 3)`, which is exactly where the sporadic exception comes from ([`Nat.Prime.natCast_lt_homogeneousCyclotomic_iff`](https://taucetiproject.org/docs/TauCeti/NumberTheory/PrimitivePrimeDivisors/Zsigmondy.html#Nat.Prime.natCast_lt_homogeneousCyclotomic_iff)).

### Notable definitions and infrastructure

**The homogeneous cyclotomic value** — `TauCeti.homogeneousCyclotomic n a b`, the degree-`φ(n)` homogenization of `Φ_n` evaluated at `(a, b)`. It now has a full theory: it factors `aⁿ − bⁿ`, satisfies the expansion identities relating `Φ_{np}(a,b)` to `Φ_n(aᵖ, bᵖ)`, and obeys the bounds `(a − b)^φ(n) < Φ_n(a,b) < (a + b)^φ(n)` ([`TauCeti.sub_pow_totient_lt_homogeneousCyclotomic`](https://taucetiproject.org/docs/TauCeti/RingTheory/Polynomial/Cyclotomic/Eval.html#TauCeti.sub_pow_totient_lt_homogeneousCyclotomic)). It is reusable for any argument about divisors of differences of powers.

**Prime divisors through orders** — a prime `p ∤ b` divides `Φ_n(a,b)` exactly when the order of `a/b` modulo `p` is the `p`-free part of `n` ([`Nat.Prime.dvd_homogeneousCyclotomic_iff_orderOf_eq`](https://taucetiproject.org/docs/TauCeti/NumberTheory/PrimitivePrimeDivisors/Cyclotomic.html#Nat.Prime.dvd_homogeneousCyclotomic_iff_orderOf_eq)). This turns divisibility questions into statements about multiplicative orders. The library also has the full `p`-adic multiplicity formula for `Φ_n(a,b)` (`Nat.Prime.multiplicity_homogeneousCyclotomic_eq_ite`).

### Roadmap coverage

All four layers are done. Layer 0 (the cyclotomic value, its factorization, expansion identities and size bounds) and Layer 1 (the order criterion, primitivity as an order condition, nonprimitive divisors of `Φ_n(a,b)` and exact valuations) are complete. Layer 2 (the estimate `Φ_n(a,b) > P(n)`, existence, both converses, and exponents one and two) and Layer 3 (order form, base one, sums of powers, and the `q^k ± 1` criteria) are complete too. The roadmap's planned `padicValInt` form of the nonprimitive-divisor valuation is stated with `multiplicity` instead, which carries the same content.

## The frontier

- **Large Zsigmondy primes** — primitive prime divisors that are large relative to `n` (Feit's notion). The README leaves these to a separate roadmap, and this one supplies their foundation.
- **Downstream consumers** — the README names orders of finite linear groups and minimal faithful degrees as the intended users of the order-form corollaries. No roadmap consumes them yet.
