# Roadmap: primitive prime divisors and the Bang–Zsigmondy theorem

**Summary.** For coprime natural numbers `a > b > 0`, a primitive prime divisor of `a^n − b^n` is a
prime dividing `a^n − b^n` and none of `a^k − b^k` for `0 < k < n`. This roadmap builds the
two-variable cyclotomic values `Φ_n(a,b)` from Mathlib's cyclotomic polynomials and homogenization,
with their factorization of `a^n − b^n`, their expansion identities and their size estimates
(Birkhoff–Vandiver 1904, §1, pp. 173–177); the order criterion modulo a prime and the exact `p`-adic
valuations of `a^k − b^k` and of `Φ_n(a,b)` (Birkhoff–Vandiver 1904, Theorems I–IV, pp. 174–177);
and from these the Bang–Zsigmondy theorem with its exact exceptions (Zsigmondy 1892, p. 283;
Birkhoff–Vandiver 1904, Theorem V, p. 178; Roitman 1997, Theorem 3, p. 1914): for coprime
`a > b > 0` and `n ≥ 2`, `a^n − b^n` has a primitive prime divisor unless `n = 2` and `a + b` is a
power of two, or `(a, b, n) = (2, 1, 6)`. The end theorems are `exists_prime_dvd_pow_sub_pow`, its
characterization `exists_prime_dvd_pow_sub_pow_iff`, and the multiplicative-order corollaries
`exists_prime_orderOf_div_eq`, `exists_prime_orderOf_eq`, `exists_prime_orderOf_two_eq` and
`exists_prime_dvd_pow_add_pow` used in the theory of orders of finite linear groups. The theorem is
arithmetic and has no dependency on finite simple groups. Mathlib has `Polynomial.cyclotomic`, its
factorization of `X^n − 1`, `Polynomial.homogenize`, the real evaluation bounds on cyclotomic
polynomials, lifting the exponent for `padicValNat`, `ZMod` and `orderOf`; it has no two-variable
cyclotomic value, no primitive prime divisor and no Zsigmondy theorem.

| Layer | Title | What it delivers |
|---|---|---|
| [0](#layer-0-homogeneous-cyclotomic-arithmetic) | Homogeneous cyclotomic arithmetic | the integer value `Φ_n(a,b)`, its closed forms, the factorization `a^n − b^n = ∏ Φ_d(a,b)`, expansion identities, size estimates |
| [1](#layer-1-multiplicative-orders-and-valuations) | Multiplicative orders and valuations | the order criterion modulo `p`, primitivity as an order condition, the nonprimitive prime divisors of `Φ_n(a,b)`, exact valuations |
| [2](#layer-2-existence-and-the-exact-exceptions) | Existence and the exact exceptions | the estimate `Φ_n(a,b) > P(n)`, the Bang–Zsigmondy theorem, the converses, exponents one and two |
| [3](#layer-3-corollaries) | Corollaries | the two-variable order form, the base-one specializations, orders `2n` and sums of powers, divisibility criteria for `q^k ± 1` |

```text
Mathlib → Layer 0 → Layer 1 → Layer 2 → Layer 3
```

## Scope and ownership

**This roadmap owns** the integer-valued homogeneous cyclotomic value `Φ_n(a,b)` and its basic
theory (closed forms, symmetry, transport along ring homomorphisms, positivity, the factorization
of `a^n − b^n`, the homogenized expansion identities and the homogenized evaluation bounds); the
order criterion `p ∣ a^k − b^k ↔ orderOf ((a : ZMod p) / b) ∣ k`; the description of the
nonprimitive prime divisors of `Φ_n(a,b)` with their valuations; the exact `p`-adic valuations of
`a^k − b^k` and `Φ_n(a,b)`; the Bang–Zsigmondy theorem for coprime `a > b > 0` with both exceptions
and their converses; the exponent-one statement; and the corollaries on multiplicative orders in
`ZMod p`, on primes of order `2n`, and on divisibility of `q^k − 1` and `q^k + 1`.

**Owned elsewhere and consumed here.** Everything consumed is in Mathlib at the pinned revision and
is listed in [Exact supplier contracts](#exact-supplier-contracts). No Tau Ceti module and no other
roadmap is consumed.

**Not in this roadmap.** The orders and recognition of finite groups of Lie type; large Zsigmondy
primes in the sense of Feit (Roitman 1997, Theorem 6, p. 1915); primitive divisors of Lucas and
Lehmer sequences beyond differences of powers; the greatest prime factor of `a^n − b^n` beyond the
bound `P(a^n − b^n) ≥ n + 1` that Layers 1–2 give outside the exceptions. Each of these builds on
this roadmap and is work for a roadmap in its own direction.

**Relation to earlier formalizations.** Formal proofs of the base-two and base-at-least-three
specializations of Layer 3 exist outside Tau Ceti (see [Provenance](#provenance)). This roadmap
states the general coprime two-variable theorem and the general arithmetic library behind it, not
a proof-specific interface for one base.

## Conventions

1. **Variables.** `a b n p k : ℕ` unless said otherwise. The standing hypotheses of the main
   theorem are `0 < b`, `b < a`, `a.Coprime b` and `2 ≤ n`. Primitivity is stated directly, never
   through a predicate:
   `p.Prime ∧ p ∣ a^n − b^n ∧ ∀ k, 0 < k → k < n → ¬ p ∣ a^k − b^k`.
2. **Subtraction.** `a^k − b^k` is natural subtraction, used only under `b ≤ a`, where `b^k ≤ a^k`
   and no truncation occurs. Integer statements write `(a : ℤ)^k − (b : ℤ)^k`; the two agree under
   `b ≤ a` by `Nat.cast_sub`, and every transport between them states that inequality.
3. **The homogeneous cyclotomic value.** `Φ_n(a,b)` denotes `homogeneousCyclotomic n a b` for
   `a b : ℤ`: the evaluation at `![a, b]` of `(Polynomial.cyclotomic n ℤ).homogenize n.totient`.
   Variable `0` of the homogenization carries the coefficient index, so
   `Φ_n(a,b) = Σ cᵢ aⁱ b^(φ(n)−i)` where `cᵢ` are the coefficients of `Φ_n`: the first argument
   is the base `a`. The witness is
   `Φ_1(5,2) = 5 − 2 = 3` and `Φ_1(2,5) = −3`; the swapped-variable model gives `−3` at `(5,2)`. At
   `n = 0`, `Polynomial.cyclotomic 0 ℤ = 1` and `Nat.totient 0 = 0`, so `Φ_0(a,b) = 1`.
4. **Orders.** At a prime `p` not dividing `a * b`, the residue `(a : ZMod p) / b` is a unit and its
   order is Mathlib's `orderOf` in the monoid `ZMod p`. In a statement where `p` is quantified
   (so no `Fact p.Prime` instance is in scope) the quotient is written
   `(a : ZMod p) * (b : ZMod p)⁻¹` with Mathlib's `ZMod.inv`, which agrees with the field inverse
   when `p` is prime and `b` is a unit (`ZMod.mul_inv_of_unit`, `ZMod.inv_coe_unit`).
   `orderOf 0 = 0` in `ZMod p` for `p ≥ 2` (no positive power of `0` is `1`), and
   `orderOf x ∣ 0` for every `x`; statements that need a positive order carry `¬ p ∣ a * b` or
   `0 < orderOf …` explicitly.
5. **Valuations.** `v_p` is `padicValNat` on naturals and `padicValInt` on integers; the natural
   value of `Φ_n(a,b)` is `Int.natAbs (Φ_n(a,b))`, and every statement that switches valuation
   types proves the comparison it uses. `P(n)` is the largest prime factor of `n` for `n ≥ 2`,
   written out as "`p ∣ n` and every prime divisor of `n` is at most `p`".
6. **The exceptions.** For `n ≥ 2` the exceptional cases of the main theorem are exactly:
   `n = 2` and `a + b` is a power of two; and `(a, b, n) = (2, 1, 6)`. Under the standing
   hypotheses `a + b ≥ 3`, so a power of two in the first case is at least four. The exponent-one
   case is separate: a primitive prime divisor of `a − b` exists exactly when `1 < a − b`. A prime
   primitive divisor is not a primitive prime-power divisor and not an arbitrary prime divisor of a
   cyclotomic value.
7. **Names.** Lean statements live in the namespace `TauCetiRoadmap.PrimitivePrimeDivisors`; the
   intended library home is `TauCeti/NumberTheory/PrimitivePrimeDivisors/`, with the polynomial
   lemmas of Layer 0 under `TauCeti/RingTheory/Polynomial/Cyclotomic/`.

## Exact supplier contracts

**From Mathlib** (pinned revision; file paths under `Mathlib/`).

- *Cyclotomic polynomials* (`RingTheory/Polynomial/Cyclotomic/Basic.lean`): `Polynomial.cyclotomic`,
  `cyclotomic_zero` (`= 1`), `cyclotomic_one` (`= X − 1`), `cyclotomic_two` (`= X + 1`),
  `cyclotomic_three`, `cyclotomic_prime` (the geometric sum `Σ_{i<p} X^i`),
  `cyclotomic_prime_pow_eq_geom_sum`, `natDegree_cyclotomic` (`= φ(n)` over a nontrivial ring),
  `prod_cyclotomic_eq_X_pow_sub_one` (`∏_{d ∣ n} Φ_d = X^n − 1` for `0 < n`),
  `cyclotomic_coeff_zero` (`= 1` for `1 < n`), `coprime_of_root_cyclotomic` and
  `orderOf_root_cyclotomic_dvd` (a natural root of `Φ_n` over `ZMod p` is prime to `p` and its order
  as a unit divides `n`); `cyclotomic_six` (`= X² − X + 1`) and the expansion identities
  `cyclotomic_expand_eq_cyclotomic` (`expand p Φ_n = Φ_{n p}` for `p ∣ n`) and
  `cyclotomic_expand_eq_cyclotomic_mul` (`expand p Φ_n = Φ_{n p} · Φ_n` for `p ∤ n`) and the root
  criterion `isRoot_cyclotomic_prime_pow_mul_iff_of_charP` (over a domain of characteristic `p`
  with `p ∤ m`, `μ` is a root of `Φ_{p^k m}` iff `μ` is a primitive `m`-th root of unity)
  (`RingTheory/Polynomial/Cyclotomic/Expand.lean`).
- *Real evaluation bounds* (`RingTheory/Polynomial/Cyclotomic/Eval.lean`): `cyclotomic_pos`
  (`0 < Φ_n(x)` for `2 < n` and any `x`), `sub_one_pow_totient_lt_cyclotomic_eval`
  (`(q − 1)^φ(n) < Φ_n(q)` for `2 ≤ n`, `1 < q` real), `cyclotomic_eval_lt_add_one_pow_totient`
  (`Φ_n(q) < (q + 1)^φ(n)` for `3 ≤ n`, `1 < q`), `cyclotomic_eval_le_add_one_pow_totient` (the
  non-strict bound for every `n`), `sub_one_pow_totient_lt_natAbs_cyclotomic_eval` and
  `sub_one_lt_natAbs_cyclotomic_eval` (the natural-number forms at `b = 1`).
- *Homogenization* (`Algebra/Polynomial/Homogenize.lean`): `Polynomial.homogenize` (for `p` and
  `n ≥ natDegree p`, the homogeneous bivariate polynomial `Σ_{k+l=n} p.coeff k · X₀^k X₁^l`),
  `homogenize_map` (transport along a ring homomorphism), `homogenize_mul` and
  `homogenize_finsetProd` (multiplicativity with added degrees), `homogenize_X`, `homogenize_one`,
  `homogenize_C`, `homogenize_add`, `homogenize_sub`, `isHomogeneous_homogenize`, and
  `eval_homogenize` (over a semifield, for `natDegree p ≤ n` and `x 1 ≠ 0`:
  `eval x (p.homogenize n) = p.eval (x 0 / x 1) * x 1 ^ n`).
- *Lifting the exponent* (`NumberTheory/Multiplicity.lean`): `padicValNat.pow_sub_pow` (for an odd
  prime `p`, `y < x`, `p ∣ x − y`, `p ∤ x`, `n ≠ 0`: `v_p(x^n − y^n) = v_p(x − y) + v_p(n)`),
  `padicValNat.pow_two_sub_pow` (for `y < x`, `2 ∣ x − y`, `2 ∤ x`, `n ≠ 0` even:
  `v₂(x^n − y^n) + 1 = v₂(x + y) + v₂(x − y) + v₂(n)`), `padicValNat.pow_add_pow`,
  `Int.emultiplicity_pow_sub_pow` and `Nat.emultiplicity_pow_sub_pow`.
- *Finite fields and orders* (`FieldTheory/Finite/Basic.lean`, `GroupTheory/OrderOfElement.lean`,
  `Data/ZMod/Basic.lean`): `ZMod.pow_card_sub_one_eq_one`, `ZMod.orderOf_dvd_card_sub_one`,
  `ZMod.orderOf_units_dvd_card_sub_one`, `orderOf_dvd_iff_pow_eq_one`, `orderOf_dvd_of_pow_eq_one`,
  `orderOf_eq_iff`, `orderOf_eq_zero_iff'`, `pow_orderOf_eq_one`, `MulEquiv.orderOf_eq`,
  `ZMod.natCast_eq_zero_iff` (`(a : ZMod b) = 0 ↔ b ∣ a`), `ZMod.intCast_zmod_eq_zero_iff_dvd`,
  `ZMod.natCast_eq_natCast_iff`, `ZMod.unitOfCoprime`, `ZMod.inv`, `ZMod.mul_inv_of_unit`,
  `ZMod.inv_coe_unit`, and the field instance on `ZMod p` for `[Fact p.Prime]`.
- *Arithmetic* : `Nat.Coprime`, `Nat.divisors`, `Nat.totient`, `Nat.primeFactors`, `padicValNat`,
  `padicValInt`, `Int.natAbs`, `Nat.cast_sub`, `Int.ModEq`, `Nat.ModEq`.

**From Tau Ceti.** Nothing: no `TauCeti.*` module is consumed, and `Suggested.lean` imports only
`Mathlib`.

## How to read the build

Layer 0 defines `Φ_n(a,b)` and proves everything about it that is polynomial identity or real
inequality: closed forms, the factorization of `a^n − b^n`, the expansion identities, and the
bounds `(a − b)^φ(n) < Φ_n(a,b) ≤ (a + b)^φ(n)`. Layer 1 passes to residues: the order of `a/b`
modulo `p` decides which `a^k − b^k` a prime divides, primitivity becomes "the order is `n`", the
nonprimitive prime divisors of `Φ_n(a,b)` are pinned down (for `n ≥ 3` only the largest prime
factor of `n`, to the first power), and lifting the exponent gives the exact valuations. Layer 2
combines the size estimate `Φ_n(a,b) > P(n)` (proved for `n ≥ 3` except at `(2,1,6)`) with Layer 1
to prove existence, then proves nonexistence in the two exceptions and the exponent-one and
exponent-two statements. Layer 3 restates existence as statements about `orderOf` in `ZMod p` and
adds the divisibility criteria for `q^k ± 1`. Layers 1 and 2 use Layer 0; Layer 2 uses Layer 1;
Layer 3 uses Layers 1 and 2.

## Layer 0: homogeneous cyclotomic arithmetic

### 0.1 The homogeneous cyclotomic value

Define `homogeneousCyclotomic n a b : ℤ` for `n : ℕ` and `a b : ℤ` as
`MvPolynomial.eval ![a, b] ((Polynomial.cyclotomic n ℤ).homogenize n.totient)`, written
`Φ_n(a,b)` (Birkhoff–Vandiver 1904, p. 176, the algebraic primitive factor `F(n)`; Avcı 2023,
Definition 2.4, p. 3, `Φ_n(a,b) = b^φ(n) Φ_n(a/b)`). The homogenization is at degree exactly
`φ(n) = natDegree (cyclotomic n ℤ)` (`natDegree_cyclotomic`), so no monomial is lost and
`Φ_n(a,b)` is homogeneous of degree `φ(n)` in `(a,b)`. API, each statement a target:

- Evaluation at `(a, 1)`: `Φ_n(a,1) = (cyclotomic n ℤ).eval a` for every `n` and `a : ℤ`, by
  `homogenize` at `X₁ = 1` (Mathlib `aeval_homogenize_X_one`, `eval₂_homogenize_of_eq_one`).
- Transport: for a ring homomorphism `f : ℤ →+* R`, `f (Φ_n(a,b))` is the evaluation at
  `![f a, f b]` of `(cyclotomic n R).homogenize n.totient` (`homogenize_map`, `map_cyclotomic`).
  In particular, over `ℝ` and for `b ≠ 0`, `Φ_n(a,b) = b^φ(n) · Φ_n(a/b)` with `Φ_n` evaluated at
  the real number `a/b` (`eval_homogenize`, with `x 1 = b ≠ 0`).
- Closed forms: `Φ_0(a,b) = 1`, `Φ_1(a,b) = a − b`, `Φ_2(a,b) = a + b`, `Φ_3(a,b) = a² + ab + b²`,
  `Φ_6(a,b) = a² − ab + b²`; for a prime `p`, `Φ_p(a,b) = Σ_{i<p} a^i b^(p−1−i)`, and for a prime
  power `p^(e+1)`, `Φ_{p^(e+1)}(a,b) = Φ_p(a^(p^e), b^(p^e))` (from `cyclotomic_one`,
  `cyclotomic_two`, `cyclotomic_three`, `cyclotomic_six`, `cyclotomic_prime`,
  `cyclotomic_prime_pow_eq_geom_sum`, and `homogenize_X`, `homogenize_one`, `homogenize_add`,
  `homogenize_sub`).
- Symmetry: `Φ_n(b,a) = Φ_n(a,b)` for `n ≥ 2` (the coefficient sequence of `Φ_n` is palindromic
  for `n ≥ 2`), and `Φ_1(b,a) = −Φ_1(a,b)`.
- The value at `b = 0`: `Φ_n(a,0) = a^φ(n)` for `n ≥ 1` (only the top monomial survives; the
  leading coefficient is `1`), and `Φ_n(0,b) = b^φ(n)` for `n ≥ 2` (`cyclotomic_coeff_zero`).
- Positivity: for naturals `0 ≤ b < a` and `n ≥ 1`, `0 < Φ_n(a,b)` (for `b = 0` by the previous
  item; for `b > 0` by `Φ_n(a,b) = b^φ(n) Φ_n(a/b)` over `ℝ` with `a/b > 1`, using `cyclotomic_pos`
  for `n ≥ 3` and the closed forms for `n = 1, 2`; Roitman 1997, p. 1913). Positivity holds for
  `b < a` with `0 ≤ b` and does not need `0 < b`.
- The natural value: for naturals `0 ≤ b < a` and `n ≥ 1`, `((Φ_n(a,b)).natAbs : ℤ) = Φ_n(a,b)`,
  so valuations may be taken in `ℕ` or in `ℤ` and agree: `padicValInt p (Φ_n(a,b)) = padicValNat p
  (Φ_n(a,b)).natAbs` by the definition of `padicValInt` and `padicValInt.of_nat`.

*Needs:* Mathlib `Polynomial.cyclotomic`, `Polynomial.homogenize`, `MvPolynomial.eval`,
`natDegree_cyclotomic`, `homogenize_map`, `eval_homogenize`, `cyclotomic_pos`, the closed-form
lemmas listed in the supplier contracts.

**Checks.**
- `Φ_1(5,2) = 3` and `Φ_1(2,5) = −3`: the first argument is the base; a definition that swaps the
  two variables of the homogenization returns `−3` at `(5,2)`.
- `Φ_2(5,2) = 7` and `Φ_3(5,2) = 25 + 10 + 4 = 39`: a definition homogenizing at a degree larger
  than `φ(n)` would multiply by a power of `b` and return `14` or `78`.
- `Φ_0(5,2) = 1`: the degenerate index gives the empty product, not `0`.
- `Φ_6(2,1) = 4 − 2 + 1 = 3`, the exceptional value of Layer 2, and `Φ_6(3,2) = 9 − 6 + 4 = 7`.
- `Φ_4(3,0) = 3² = 9` and `Φ_1(3,0) = 3`: positivity at `b = 0`; a statement requiring `0 < b`
  would exclude these true instances.
- `Φ_2(2,1) = 3 = (2 + 1)^φ(2)`: the upper bound of §0.4 is an equality at `n = 2`.

### 0.2 Factorization and divisibility

Prove, for all `a b : ℤ` and `n > 0`, `a^n − b^n = ∏_{d ∈ n.divisors} Φ_d(a,b)` (Birkhoff–Vandiver
1904, p. 176; Avcı 2023, Corollary 2.6, p. 3), by homogenizing `prod_cyclotomic_eq_X_pow_sub_one`
with `homogenize_finsetProd` (the degrees add to `Σ_{d ∣ n} φ(d) = n`) and evaluating. The
hypothesis `n > 0` is needed: at `n = 0` the left side is `0` and the empty product is `1`.
Deduce, for `0 < n` and `d ∣ n`: `Φ_d(a,b) ∣ a^n − b^n`; `a^d − b^d ∣ a^n − b^n`; and for `d < n`,
`Φ_n(a,b) ∣ (a^n − b^n) / (a^d − b^d)` whenever `a^d ≠ b^d`. Prove that for coprime naturals
`a, b` and `n ≥ 1`, every prime divisor of `Φ_n(a,b)` is prime to `a * b` (if `p ∣ b` then
`Φ_n(a,b) ≡ a^φ(n) (mod p)` by the leading coefficient, and `p ∤ a`; symmetrically for `p ∣ a`
using `cyclotomic_coeff_zero` when `n ≥ 2` and `Φ_1 = a − b` when `n = 1`), and that every prime
divisor of `a^n − b^n` is prime to `a * b` (Birkhoff–Vandiver 1904, Theorem I, p. 174, first
lines of the proof).
*Needs:* §0.1; Mathlib `prod_cyclotomic_eq_X_pow_sub_one`, `homogenize_finsetProd`,
`Nat.sum_totient`, `cyclotomic_coeff_zero`, `Nat.Coprime`.

**Checks.**
- `(2,1,6)`: `2^6 − 1 = 63 = Φ_1 · Φ_2 · Φ_3 · Φ_6 = 1 · 3 · 7 · 3`.
- `(2,1,4)`: `15 = 1 · 3 · 5`, and `(3,2,2)`: `9 − 4 = 5 = Φ_1(3,2) · Φ_2(3,2) = 1 · 5`.
- `n = 0`: `a^0 − b^0 = 0` while `Nat.divisors 0 = ∅` gives the product `1`; the hypothesis
  `0 < n` is not removable.
- `a = b`: both sides are `0` for `n > 0` since `Φ_1(a,a) = 0`.
- `(4,1,3)`: `Φ_3(4,1) = 21 = 3 · 7`, both prime divisors prime to `4`.

### 0.3 Expansion identities

Prove, for a prime `p`, `n ≥ 1` and all `a b : ℤ`: `Φ_{n p}(a,b) = Φ_n(a^p, b^p)` if `p ∣ n`, and
`Φ_{n p}(a,b) · Φ_n(a,b) = Φ_n(a^p, b^p)` if `p ∤ n` (Avcı 2023, Lemma 2.9, p. 4), by homogenizing
Mathlib's `cyclotomic_expand_eq_cyclotomic` and `cyclotomic_expand_eq_cyclotomic_mul` (the
homogenization of `expand p q` at degree `p · natDegree q` is `q.homogenize` evaluated at
`(X₀^p, X₁^p)`, a target). Deduce the iterated form (Avcı 2023, Corollary 2.10, p. 4; Roitman
1997, proof of Lemma 1, p. 1914, at `b = 1`): for `n = p^e m` with `e ≥ 1` and `p ∤ m`,
`Φ_n(a,b) = Φ_{p m}(a^(p^(e−1)), b^(p^(e−1)))`, and for `m ≥ 1`,
`Φ_{p m}(A,B) · Φ_m(A,B) = Φ_m(A^p, B^p)`, so that `Φ_n(a,b) = Φ_m(A^p,B^p) / Φ_m(A,B)` with
`A = a^(p^(e−1))`, `B = b^(p^(e−1))` whenever `Φ_m(A,B) ≠ 0`.
*Needs:* §0.1; Mathlib `cyclotomic_expand_eq_cyclotomic`, `cyclotomic_expand_eq_cyclotomic_mul`,
`Polynomial.expand`, `homogenize_mul`.

**Checks.**
- `p = 2 ∣ n = 2`: `Φ_4(2,1) = Φ_2(4,1) = 5`, and `Φ_4(3,1) = Φ_2(9,1) = 10`.
- `p = 2 ∤ n = 3`: `Φ_6(2,1) · Φ_3(2,1) = 3 · 7 = 21 = Φ_3(4,1)`.
- `p = 3 ∣ n = 3`: `Φ_9(2,1) = Φ_3(8,1) = 64 + 8 + 1 = 73`.
- Iterated form at `n = 18 = 2 · 3²`: `Φ_18(2,1) = Φ_6(8,1) = 64 − 8 + 1 = 57 = 3 · 19`.

### 0.4 Size estimates

Prove, for naturals `0 < b < a`: `(a − b)^φ(n) < Φ_n(a,b)` for `n ≥ 2`; `Φ_n(a,b) < (a + b)^φ(n)`
for `n ≥ 3`; and `Φ_n(a,b) ≤ (a + b)^φ(n)` for every `n` (Avcı 2023, Corollary 2.8, p. 4;
Birkhoff–Vandiver 1904, p. 178, the inequalities `a^k − b^k > a^(k−1)` and `a^k − b^k < a^k`). The
route: over `ℝ`, `Φ_n(a,b) = b^φ(n) Φ_n(q)` with `q = a/b > 1` (§0.1), and Mathlib's
`sub_one_pow_totient_lt_cyclotomic_eval`, `cyclotomic_eval_lt_add_one_pow_totient` and
`cyclotomic_eval_le_add_one_pow_totient` multiplied by `b^φ(n) > 0` give exactly the three bounds,
since `b^φ(n) (q ∓ 1)^φ(n) = (a ∓ b)^φ(n)`. Prove the geometric-sum bound: for a prime `p` and
`a ≥ 1`, `b ≥ 1`, `Φ_p(a,b) = Σ_{i<p} a^i b^(p−1−i) ≥ p` with equality only for `a = b = 1`, so
`Φ_p(a,b) > p` for `a ≥ 2` (Birkhoff–Vandiver 1904, p. 179, the case `n' = 1`). Prove the
consecutive-base estimate used in Layer 2: for `0 < b < a`, a prime `p` and `m ≥ 1` with `p ∤ m`,
`Φ_{p m}(a,b) > ((a^p − b^p) / (a + b))^φ(m)` (from §0.3 `Φ_{pm}(a,b) = Φ_m(a^p,b^p) / Φ_m(a,b)`
and the two bounds applied to numerator and denominator; Roitman 1997, Lemma 1 and its proof,
pp. 1913–1914, is the case `b = 1` in the form `Φ_n(a) > (B^(q−2)(B − 1))^φ(r)`).
*Needs:* §§0.1, 0.3; Mathlib `sub_one_pow_totient_lt_cyclotomic_eval`,
`cyclotomic_eval_lt_add_one_pow_totient`, `cyclotomic_eval_le_add_one_pow_totient`,
`eval_homogenize`, `cyclotomic_prime`.

**Checks.**
- `(2,1,2)`: `1 < 3 ≤ 3`, equality in the upper bound, so the strict upper bound needs `n ≥ 3`.
- `(2,1,6)`: `1 < 3 < 9`; `(3,2,6)`: `1 < 7 < 25`; `(3,1,3)`: `4 < 13 < 16`.
- `n = 1`: `(a − b)^1 < Φ_1(a,b) = a − b` is false, so the lower bound needs `n ≥ 2`; the
  non-strict upper bound `a − b ≤ a + b` holds.
- Geometric sum: `Φ_3(2,1) = 7 > 3`, `Φ_5(2,1) = 31 > 5`, `Φ_2(1,1) = 2 = p` (the equality case).
- Consecutive-base estimate at `(2,1)`, `p = 3`, `m = 2`: `Φ_6(2,1) = 3 > (7/3)^1`; at `(3,2)`,
  `p = 3`, `m = 2`: `Φ_6(3,2) = 7 > (19/5)^1`.

### Examples

`2^6 − 1 = 63 = 1 · 3 · 7 · 3` with `Φ_6(2,1) = 3`; `3^6 − 2^6 = 665 = 1 · 5 · 19 · 7` with
`Φ_6(3,2) = 7`; `Φ_12(2,1) = 2^4 − 2^2 + 1 = 13`; `Φ_10(2,1) = 16 − 8 + 4 − 2 + 1 = 11`.

### Dependencies

Mathlib only, as listed in the supplier contracts.

## Layer 1: multiplicative orders and valuations

### 1.1 The order criterion modulo a prime

For a prime `p` and naturals `a, b` with `¬ p ∣ a * b`, the residues `(a : ZMod p)` and
`(b : ZMod p)` are nonzero, hence units of the field `ZMod p`. Prove, for every `k`,
`p ∣ a^k − b^k ↔ orderOf ((a : ZMod p) / b) ∣ k`, in the natural form under `b ≤ a` and in the
integer form `(p : ℤ) ∣ (a : ℤ)^k − (b : ℤ)^k` without it (Birkhoff–Vandiver 1904, Theorem I,
p. 174, the congruence `a ≡ b m (mod p)`; Roitman 1997, p. 1913, the definition of a Zsigmondy
prime through the order). The route: `p ∣ a^k − b^k` iff `(a : ZMod p)^k = (b : ZMod p)^k`
(`ZMod.natCast_eq_zero_iff`, `Nat.cast_sub`) iff `((a : ZMod p) / b)^k = 1` iff the order divides
`k` (`orderOf_dvd_iff_pow_eq_one`). Record that the order is positive and divides `p − 1`
(`ZMod.orderOf_dvd_card_sub_one`).
*Needs:* Mathlib `ZMod.natCast_eq_zero_iff`, `ZMod.intCast_zmod_eq_zero_iff_dvd`,
`orderOf_dvd_iff_pow_eq_one`, `ZMod.orderOf_dvd_card_sub_one`, the field instance on `ZMod p`.

**Checks.**
- `p = 7`, `(a,b) = (2,1)`: the order of `2` is `3`; `7 ∣ 2^3 − 1 = 7` and `7 ∤ 2^2 − 1 = 3`.
- `p = 5`, `(a,b) = (3,2)`: `3/2 ≡ 3 · 3 = 9 ≡ 4 (mod 5)` has order `2`; `5 ∣ 3^2 − 2^2 = 5` and
  `5 ∤ 3 − 2 = 1`.
- `k = 0`: both sides hold (`p ∣ 0` and `orderOf x ∣ 0`).
- `p = 3`, `(a,b) = (3,1)`: `3 ∣ a * b`, the residue `a * b⁻¹` is `0` with `orderOf 0 = 0`, and
  `0 ∣ p − 1 = 2` is false: the consequence "the order is positive and divides `p − 1`" needs
  `¬ p ∣ a * b`.

### 1.2 Primitivity as an order condition

For coprime naturals `a > b > 0`, `n ≥ 1` and a prime `p`, prove that `p` is a primitive prime
divisor of `a^n − b^n` iff `¬ p ∣ a * b` and `orderOf ((a : ZMod p) / b) = n` (§0.2 gives
`¬ p ∣ a * b` for every prime divisor of `a^n − b^n`; then §1.1 turns "`p ∣ a^n − b^n` and
`p ∤ a^k − b^k` for `0 < k < n`" into "the order divides `n` and divides no `k` with `0 < k < n`",
which is `orderOf = n` by `orderOf_eq_iff`). Deduce that a primitive prime divisor satisfies
`n ∣ p − 1`, hence `n < p` (Birkhoff–Vandiver 1904, Theorem I, p. 174; Roitman 1997, p. 1913), and
prove the converse: a prime `p` with `¬ p ∣ a * b` and `orderOf ((a : ZMod p) / b) = n` is a
primitive prime divisor of `a^n − b^n`.
*Needs:* §§0.2, 1.1; Mathlib `orderOf_eq_iff`, `ZMod.orderOf_dvd_card_sub_one`.

**Checks.**
- `(3,1,3)`: `3^3 − 1 = 26 = 2 · 13`; `13` has `3 ∣ 12` and order `3` (`27 ≡ 1`, `3, 9 ≢ 1`), so it
  is primitive; `2` has order `1` and is not.
- `(2,1,6)`: `63 = 3² · 7`; the orders of `2` modulo `3` and `7` are `2` and `3`, neither is `6`,
  so no prime divisor is primitive.
- `(3,2,6)`: `665 = 5 · 7 · 19`; modulo `7`, `3/2 ≡ 5` has order `6`, so `7` is primitive, while
  `5` (order `2`) and `19` (order `3`) are not.
- `n < p` is sharp: `(2,1,2)` has the primitive prime `3 = n + 1`.

### 1.3 Nonprimitive prime divisors of a cyclotomic value

For coprime naturals `a > b > 0`, `n ≥ 1` and a prime `p ∣ Φ_n(a,b)`, put
`d = orderOf ((a : ZMod p) / b)` (well defined by §0.2). Prove that `d` is the prime-to-`p` part of
`n`: writing `n = p^e m` with `p ∤ m`, `d = m` (Birkhoff–Vandiver 1904, Theorem IV, p. 177;
Roitman 1997, Proposition 2, p. 1914; Avcı 2023, Lemma 2.11, p. 4). The route: transport
`Φ_n(a,b) ≡ 0 (mod p)` to "`(a : ZMod p) / b` is a root of `cyclotomic n (ZMod p)`" by §0.1
(transport along `ℤ →+* ZMod p`, then divide by `b^φ(n) ≠ 0`), and apply
`isRoot_cyclotomic_prime_pow_mul_iff_of_charP` (with `NeZero (m : ZMod p)` from `p ∤ m`): the
residue is a primitive `m`-th root of unity, so its order is `m`. Deduce: if `e = 0` then `p` is
primitive for `a^n − b^n` (§1.2); if `e ≥ 1` then `p` is not primitive, `m ∣ p − 1`, every prime
factor of `m` is less than `p`, and so `p` is the largest prime factor of `n`.

Prove the headline `padicValInt_homogeneousCyclotomic_of_not_primitive`: for coprime naturals
`a > b > 0`, `n ≥ 3` and a prime `p` dividing `Φ_n(a,b)` which divides some `a^k − b^k` with
`0 < k < n`, `p ∣ n`, every prime divisor of `n` is at most `p`, and `v_p(Φ_n(a,b)) = 1`
(Birkhoff–Vandiver 1904, Theorem IV, p. 177, "divisible by `p` but not by `p²` for `n > 2`";
Roitman 1997, Proposition 2, p. 1914, "`q² ∤ Φ_n(a)` unless `q = n = 2`"; Avcı 2023, Lemma 3.1,
pp. 4–5). The route for the valuation: with `n = d p^e`, `e ≥ 1`, write
`(a^n − b^n) / (a^(n/p) − b^(n/p)) = ∏ Φ_{d'}(a,b)` over the `d' ∣ n` with `v_p(d') = e` (§0.2);
by the first paragraph `p` divides only the factor `d' = n` of this product, so
`v_p(Φ_n(a,b)) = v_p(a^n − b^n) − v_p(a^(n/p) − b^(n/p))`, which §1.4 computes as `1` for odd `p`
(`v_p(a^d − b^d) + e` minus `v_p(a^d − b^d) + e − 1`) and for `p = 2` (then `d = 1`, `n = 2^e`
with `e ≥ 2`, `a, b` odd, and `v₂(a^n − b^n) − v₂(a^(n/2) − b^(n/2)) = 1` by
`padicValNat.pow_two_sub_pow`). Conclude the dichotomy used in Layer 2: for `n ≥ 3`, every prime
divisor of `Φ_n(a,b)` is primitive for `a^n − b^n` or equals `P(n)` with valuation one; so if
`a^n − b^n` has no primitive prime divisor then `Φ_n(a,b) ∈ {1, P(n)}`, and by §0.4
`Φ_n(a,b) = P(n)` (Roitman 1997, Proposition 2, last sentence, p. 1914).
*Needs:* §§0.1–0.2, 1.1–1.2, 1.4; Mathlib `isRoot_cyclotomic_prime_pow_mul_iff_of_charP`,
`IsPrimitiveRoot.eq_orderOf`, `padicValNat.pow_sub_pow`, `padicValNat.pow_two_sub_pow`,
`padicValInt`, `Nat.primeFactors`.

**Checks.**
- `(2,1,6)`, `p = 3`: `3 ∣ Φ_6(2,1) = 3` and `3 ∣ 2^2 − 1`; `3 = P(6)`, `v_3(3) = 1`; the order
  `d = 2` is the prime-to-`3` part of `6`.
- `(3,1,4)`, `p = 2`: `Φ_4(3,1) = 10`, `2 ∣ 3 − 1`, `2 = P(4)`, `v₂(10) = 1`; the order is `1`,
  the prime-to-`2` part of `4`.
- `(4,1,3)`: `Φ_3(4,1) = 21 = 3 · 7`; `3 ∣ 4 − 1` is nonprimitive with `3 = P(3)` and
  `v_3(21) = 1`; `7` is primitive (order of `4` modulo `7` is `3`).
- `(5,2,3)`: `Φ_3(5,2) = 39 = 3 · 13`; `3 ∣ 5 − 2` with `v_3(39) = 1`; `13` is primitive.
- Negative controls for `n ≥ 3`: `(3,1,2)` has `Φ_2(3,1) = 4 = 2²` and `(7,1,2)` has
  `Φ_2(7,1) = 8 = 2³`, nonprimitive prime `2` with valuation `2` and `3`.
- `(3,2,6)`, `p = 7`: `7` is primitive, so the headline's hypothesis fails and nothing is claimed
  (`7 ∤ 6`).

### 1.4 Exact valuations

For a prime `p` and coprime naturals `a > b > 0` with `¬ p ∣ a * b`, put
`d = orderOf ((a : ZMod p) / b)` and let `k > 0`. Prove: `v_p(a^k − b^k) = 0` if `d ∤ k`
(§1.1); for odd `p` and `d ∣ k`, `v_p(a^k − b^k) = v_p(a^d − b^d) + v_p(k)` (apply
`padicValNat.pow_sub_pow` to `x = a^d`, `y = b^d`, exponent `k/d`, using `p ∣ a^d − b^d`,
`p ∤ a^d`, and `v_p(k/d) = v_p(k)` since `d ∣ p − 1` is prime to `p`; Birkhoff–Vandiver 1904,
Theorem III, p. 175; Avcı 2023, Lemma 2.2, pp. 2–3). For `p = 2` (so `a, b` odd and `d = 1`):
`v₂(a^k − b^k) = v₂(a − b)` for odd `k` (the quotient `Σ a^i b^(k−1−i)` is a sum of `k` odd
terms) and `v₂(a^k − b^k) = v₂(a² − b²) + v₂(k) − 1` for even `k` (`padicValNat.pow_two_sub_pow`,
with `v₂(a² − b²) = v₂(a + b) + v₂(a − b)`; Birkhoff–Vandiver 1904, Theorem III, p. 175, the
`V₁ = 2M` case; Avcı 2023, Lemma 2.2 (2), p. 3).

Prove the valuation of the cyclotomic value (Avcı 2023, Lemmas 2.11 and 2.12, p. 4; Roitman 1997,
Proposition 2, p. 1914): for `n ≥ 1`, `v_p(Φ_n(a,b)) = v_p(a^d − b^d)` if `n = d`;
`v_p(Φ_n(a,b)) = 1` if `n = d p^e` with `e ≥ 1`, except `(p, n) = (2, 2)` where
`v₂(Φ_2(a,b)) = v₂(a + b)`; and `v_p(Φ_n(a,b)) = 0` otherwise. The route is §1.3 (`p ∣ Φ_n(a,b)`
iff `n = d p^e` for some `e ≥ 0`) together with the formulas above through the factorization
`a^n − b^n = ∏_{d' ∣ n} Φ_{d'}(a,b)` (at `n = d`, every other factor `Φ_{d'}` with `d' ∣ d`,
`d' < d` is prime to `p`, so `v_p(Φ_d(a,b)) = v_p(a^d − b^d)`). Prove the natural/integer
comparisons these statements use (Conventions 2 and 5). These results are independent of
Layer 2.
*Needs:* §§0.2, 1.1, 1.3; Mathlib `padicValNat.pow_sub_pow`, `padicValNat.pow_two_sub_pow`,
`padicValNat.mul`, `padicValNat.pow`, `Int.natAbs`, `padicValInt`.

**Checks.**
- `p = 2`, `(a,b) = (3,1)`: `v₂(3^2 − 1) = v₂(8) = 3 = v₂(8) + v₂(2) − 1`;
  `v₂(3^4 − 1) = v₂(80) = 4 = 3 + 2 − 1`; odd `k = 3`: `v₂(26) = 1 = v₂(3 − 1)`.
- `p = 3`, `(a,b) = (4,1)`, `d = 1`: `v_3(4^3 − 1) = v_3(63) = 2 = v_3(3) + v_3(3)`;
  `v_3(4^2 − 1) = v_3(15) = 1 = v_3(3) + v_3(2)`.
- `p = 3`, `(a,b) = (2,1)`, `d = 2`: `v_3(Φ_2(2,1)) = v_3(3) = 1 = v_3(2^2 − 1)`;
  `v_3(Φ_6(2,1)) = v_3(3) = 1`; `v_3(Φ_18(2,1)) = v_3(57) = 1`; `v_3(Φ_4(2,1)) = v_3(5) = 0`;
  `v_3(2^5 − 1) = v_3(31) = 0` since `2 ∤ 5`.
- `p = 2`, `(a,b) = (3,1)`: `v₂(Φ_1) = v₂(2) = 1 = v₂(a − b)`; `v₂(Φ_2) = v₂(4) = 2 = v₂(a + b)`,
  the exception; `v₂(Φ_4) = v₂(10) = 1`; `v₂(Φ_8(3,1)) = v₂(82) = 1`.
- A formula that applied the odd-`p` rule at `p = 2` would predict
  `v₂(3^2 − 1) = v₂(2) + v₂(2) = 2`, not `3`.

### Examples

`3^4 − 1 = 80 = 2^4 · 5` with `v₂` given by the even-`k` rule and `5` the primitive prime (order of
`3` modulo `5` is `4`); `4^3 − 1 = 63 = 3^2 · 7` with `v_3` given by lifting the exponent and `7`
primitive.

### Dependencies

Layer 0; Mathlib as listed.

## Layer 2: existence and the exact exceptions

### 2.1 The estimate `Φ_n(a,b) > P(n)`

For coprime naturals `a > b > 0` and `n ≥ 3`, prove `Φ_n(a,b) > P(n)` except at
`(a, b, n) = (2, 1, 6)`, where `Φ_6(2,1) = 3 = P(6)` (Birkhoff–Vandiver 1904, proof of Theorem V,
pp. 178–179; Roitman 1997, Lemma 1 and the proof of Theorem 3, pp. 1913–1915, at `b = 1`). The
route has two cases.

*Case `a − b ≥ 2`.* By §0.4, `Φ_n(a,b) > (a − b)^φ(n) ≥ 2^φ(n)`; since `P(n) ∣ n` gives
`P(n) − 1 = φ(P(n)) ≤ φ(n)`, and `2^(p−1) ≥ p` for every `p ≥ 1`, this is `≥ P(n)`.

*Case `a − b = 1`.* Suppose `Φ_n(a,b)` has no primitive prime factor; by §1.3 it then equals
`P(n) =: p`, and `n = p^e m` with `e ≥ 1`, `p ∤ m` and `m ∣ p − 1` (§1.3, from the order of
`a/b` modulo `p`). If `e ≥ 2`, §0.3 gives `Φ_n(a,b) = Φ_{p m}(A,B)` with `A = a^(p^(e−1))`,
`B = b^(p^(e−1))` and `A − B ≥ a^p − b^p ≥ 3`, so the first case applied to `(A,B,pm)` gives
`Φ_n(a,b) > p`. If `e = 1` and `m = 1`, then `n = p ≥ 3` and §0.4 gives
`Φ_p(a,b) = Σ_{i<p} a^i b^(p−1−i) > p`. If `e = 1` and `m ≥ 2`, then `p ≥ 3` (for `p = 2`,
`m ∣ 1`), and §0.4 gives `Φ_{p m}(a,b) > ((a^p − b^p) / (a + b))^φ(m)`; prove that this exceeds
`p` for every consecutive pair `(a, a − 1)` with `a ≥ 2` and every prime `p ≥ 3` except
`p = 3`, `(a,b) = (2,1)`: the geometric sum `a^p − b^p = Σ_{i<p} a^i b^(p−1−i)` has `p ≥ 3`
terms, the two largest summing to `a^(p−2)(2a − 1) = a^(p−2)(a + b)`, so
`(a^p − b^p)/(a + b) > a^(p−2)`, and `a^(p−2) ≥ p` for `a ≥ 3`, `p ≥ 3` and for `a = 2`,
`p ≥ 5`; in the exceptional case `m ∣ p − 1 = 2` forces `m = 2` and `n = 6`. In every case
`Φ_n(a,b) > p`, contradicting `Φ_n(a,b) = p`, so the cyclotomic value does have a primitive prime
factor `q`, and then `q > n ≥ P(n)` (§1.2) together
with positivity and integrality (§0.1) gives `Φ_n(a,b) ≥ q > P(n)`.
*Needs:* §§0.1, 0.3, 0.4, 1.2, 1.3; Mathlib `Nat.totient_prime`, `Nat.totient_dvd_of_dvd`,
`Nat.lt_two_pow_self`.

**Checks.**
- `(2,1,6)`: `Φ_6(2,1) = 3 = P(6)`, the stated exception; `(2,1,3)`: `7 > 3`; `(2,1,12)`:
  `13 > 3`; `(2,1,10)`: `11 > 5`; `(2,1,4)`: `5 > 2`; `(2,1,18)`: `57 > 3`.
- `(3,2,6)`: `7 > 3`; `(3,1,6)`: `7 > 3`; `(4,3,6)`: `16 − 12 + 9 = 13 > 3`.
- The consecutive-base bound at `(2,1)`, `p = 3`: `(2^3 − 1)/3 = 7/3 < 3`, which is why `(2,1,6)`
  escapes; at `(2,1)`, `p = 5`: `31/3 > 5`; at `(3,2)`, `p = 3`: `19/5 > 3`.
- `n = 2` is excluded: `Φ_2(3,1) = 4 > 2 = P(2)` holds but `Φ_2(a,b) = a + b` can be a prime power
  `2^k`, so the dichotomy of §1.3 fails there and the exponent-two case is §2.4.

### 2.2 The Bang–Zsigmondy theorem

Prove the headline `exists_prime_dvd_pow_sub_pow`: for coprime naturals `a > b > 0` and `n ≥ 2`
such that neither `n = 2` with `a + b` a power of two nor `(a, b, n) = (2, 1, 6)` holds, there is a
prime `p` with `p ∣ a^n − b^n` and `p ∤ a^k − b^k` for all `0 < k < n` (Zsigmondy 1892, p. 283;
Birkhoff–Vandiver 1904, Theorem V, p. 178, for `n ≠ 2`; Roitman 1997, Theorem 3, p. 1914, for
`b = 1`; Avcı 2023, p. 1, the two-variable statement). The route: for `n ≥ 3`, if no primitive
prime divisor exists then §1.3 gives `Φ_n(a,b) = P(n)`, contradicting §2.1 unless
`(a,b,n) = (2,1,6)`. For `n = 2`, `a + b ≥ 3` is not a power of two, so it has an odd prime factor
`p`; `p ∣ a² − b²`, and `p ∤ a − b` because `gcd(a + b, a − b)` divides `2` (Roitman 1997,
p. 1916, "the greatest common divisor of `a − 1` and `a + 1` is at most `2`"). The cyclotomic
proof discharges its estimate and valuation prerequisites in Layers 0–1; a hypothesis saying that
a cyclotomic value has a primitive prime factor is not the existence theorem.
*Needs:* §§0.2, 1.2, 1.3, 2.1; Mathlib `Nat.Coprime`, `Nat.exists_prime_and_dvd`,
`Nat.Prime.eq_one_or_self_of_dvd`.

**Checks.**
- `(3,1,3)`: `26 = 2 · 13`, `13` primitive, `2 ∤ 13`.
- `(2,1,5)`: `31` is prime and primitive.
- `(3,2,6)`: `665 = 5 · 7 · 19`; `5 ∣ 3² − 2²`, `19 ∣ 3³ − 2³`, and `7` is primitive.
- `(4,1,2)`: `15 = 3 · 5`; `3 ∣ 4 − 1`, and `5` is primitive (`a + b = 5` is not a power of two).
- `(3,2,2)`: `a + b = 5`, primitive prime `5`.

### 2.3 The converses and the characterization

Prove nonexistence in each exception: if `n = 2` and `a + b = 2^k`, then every prime divisor of
`a² − b² = (a − b)(a + b)` divides `a − b` (the primes of `a + b` are `{2}`, and `a, b` are odd so
`2 ∣ a − b`); if `(a,b,n) = (2,1,6)`, then `63 = 3² · 7` with `3 ∣ 2² − 1` and `7 ∣ 2³ − 1`
(Roitman 1997, Theorem 3, p. 1914, "it is easy to verify"). Combine with §2.2 into the headline
`exists_prime_dvd_pow_sub_pow_iff`: for coprime naturals `a > b > 0` and `n ≥ 2`, a primitive
prime divisor of `a^n − b^n` exists iff `¬ (n = 2 ∧ ∃ k, a + b = 2^k)` and
`¬ (a = 2 ∧ b = 1 ∧ n = 6)`.
*Needs:* §2.2; Mathlib `Nat.Prime.eq_one_or_self_of_dvd`, `Nat.Coprime.gcd_eq_one`,
`Nat.Prime.two_le`.

**Checks.**
- `(3,1,2)`: `8 = 2³` and `2 ∣ 3 − 1`; `a + b = 4`: both sides false.
- `(7,1,2)`: `48 = 2^4 · 3`, `2 ∣ 6` and `3 ∣ 6`; `a + b = 8`: both sides false.
- `(5,3,2)`: `16 = 2^4`, `2 ∣ 2`; `a + b = 8`: both sides false.
- `(2,1,6)`: both sides false; `(3,2,2)` and `(3,1,3)`: both sides true.

### 2.4 Exponents one and two

Prove: for coprime naturals `a > b > 0`, `a − b` has a primitive prime divisor (a prime divisor,
the condition on `0 < k < 1` being vacuous) iff `1 < a − b`. Prove the exponent-two statement in
its own terms: `a² − b²` has a primitive prime divisor iff `a + b` is not a power of two, iff
`a + b` has an odd prime factor (§§2.2–2.3 at `n = 2`).
*Needs:* §§2.2, 2.3; Mathlib `Nat.exists_prime_and_dvd`, `Nat.Prime.eq_one_or_self_of_dvd`.

**Checks.**
- `(3,2)`: `a − b = 1` has no prime divisor; `(5,2)`: `3` is a primitive prime divisor of `3`.
- `(5,3)`: `a + b = 8`, no primitive prime divisor of `16`; `(5,2)`: `a + b = 7`, and `7` is
  primitive for `21`.

### Examples

Existence at `(3,1,3)`, `(2,1,5)`, `(3,2,6)` with primitive primes `13`, `31`, `7`; nonexistence
at `(3,1,2)`, `(7,1,2)`, `(2,1,6)`; the exponent-one contrast between `(3,2)` and `(5,2)`. In each
positive example the order of `a/b` modulo the supplied prime is `n` (§1.2): `3` modulo `13`,
`2` modulo `31`, `3 · 2⁻¹ ≡ 5` modulo `7`.

### Dependencies

Layers 0 and 1; Mathlib as listed.

## Layer 3: corollaries

### 3.1 The two-variable order form

Prove the headline `exists_prime_orderOf_div_eq`: for coprime naturals `a > b > 0` and `n ≥ 2`
outside the two exceptions, there is a prime `p` with `¬ p ∣ a * b` and
`orderOf ((a : ZMod p) * (b : ZMod p)⁻¹) = n`, the inverse being `ZMod.inv` (Conventions 4), so
that the element is `(a : ZMod p) / b` in the field `ZMod p` (§2.2 and §1.2; Roitman 1997,
p. 1913, the order formulation of a Zsigmondy prime). Record the consequences `n ∣ p − 1` and
`n < p`.
*Needs:* §§1.2, 2.2.

**Checks.**
- `(3,2,6)`: `p = 7`, `3/2 ≡ 5 (mod 7)` of order `6`, and `6 ∣ 6`.
- `(2,1,6)`: no prime has `2` of order `6` (modulo `3` and `7` the orders are `2` and `3`).
- `(3,1,2)`: no prime has `3` of order `2`, since `3² − 1 = 8` has only the prime `2` and
  `orderOf (3 : ZMod 2) = 1`.

### 3.2 Base one

Specialize to `b = 1`: for `a ≥ 2` and `n ≥ 2` with neither `n = 2` and `a + 1` a power of two nor
`(a, n) = (2, 6)`, there is a prime `p` with `orderOf (a : ZMod p) = n` (Roitman 1997, Theorem 3,
p. 1914). Prove the headlines `exists_prime_orderOf_eq` (for `a ≥ 3` and `n ≥ 3`: both exceptions
are excluded by the hypotheses) and `exists_prime_orderOf_two_eq` (for `n ≥ 2`, `n ≠ 6`: at
`n = 2`, `a + b = 3` is not a power of two). The prime supplied is primitive for `a^n − 1`, so
`p ∤ a` and the order is taken in the field `ZMod p`.
*Needs:* §3.1.

**Checks.**
- `(a, n) = (3, 3)`: `p = 13`, order of `3` is `3`; `(3, 4)`: `80 = 2^4 · 5`, order of `3` modulo
  `5` is `4`.
- `(3, 2)`: `8 = 2^3` and the order of `3` modulo `2` is `1`, so `n ≥ 3` is needed at `a = 3`.
- `a = 2`: `n = 2, 3, 4` give `p = 3, 7, 5` with orders `2, 3, 4`; `n = 6` gives none, so
  `n ≠ 6` is needed.
- `(a, n) = (7, 2)`: `a + 1 = 8`, no prime with `7` of order `2`.

### 3.3 Orders `2n` and sums of powers

For coprime naturals `a > b > 0`, `n ≥ 1` and a prime `p` with `¬ p ∣ a * b` and
`orderOf ((a : ZMod p) / b) = 2n`, prove `p ∣ a^n + b^n` (the residue `(a/b)^n` has order `2`,
hence is `−1` in the field `ZMod p`) and `p ∤ a^k − b^k` for `0 < k < 2n` (§1.1). Prove the
headline `exists_prime_dvd_pow_add_pow`: for coprime naturals `a > b > 0` and `n ≥ 1` such that
neither `n = 1` with `a + b` a power of two nor `(a, b, n) = (2, 1, 3)` holds, there is a prime
`p` with `p ∣ a^n + b^n` and `p ∤ a^k − b^k` for all `0 < k < 2n`; the route is §3.1 at the
exponent `2n` (whose exceptions are `2n = 2` with `a + b` a power of two and `(2,1,6)`). Order
`2n` is not inferred from `p ∣ a^n + b^n` alone.
*Needs:* §§1.1, 3.1; Mathlib `orderOf_pow'`, `pow_orderOf_eq_one`, `mul_self_eq_one_iff`.

**Checks.**
- `(2,1,2)`: `2² + 1 = 5`, and `5 ∤ 2^k − 1` for `k = 1, 2, 3` (`1, 3, 7`); the order of `2`
  modulo `5` is `4 = 2n`.
- `(3,2,3)`: `27 + 8 = 35 = 5 · 7`; `5 ∣ 3² − 2²` is excluded, and `7` works: `7 ∤ 3^k − 2^k` for
  `k < 6` (`1, 5, 19, 65, 211`), order of `3/2` modulo `7` is `6`.
- `(2,1,3)`: `9 = 3²` and `3 ∣ 2² − 1`: no such prime, the stated exception.
- `(3,1,1)`: `a + b = 4`; `2 ∣ 3 − 1`: no such prime, the other exception.
- `p = 3`, `(a,b,n) = (2,1,3)`: `3 ∣ 2³ + 1 = 9` but the order of `2` modulo `3` is `2 ≠ 6`, so
  divisibility of the sum does not give order `2n`.

### 3.4 Divisibility criteria for `q^k ± 1`

Prove, for an integral domain `K`, `u : K` with `orderOf u = n`, `0 < n` and `n` even, that for
every `k`, `u^k = −1 ↔ n/2 ∣ k ∧ ¬ n ∣ k` (the element `u^(n/2)` has order `2`, so it equals `−1`
since `x² = 1` has only the roots `±1` in a domain; then `u^k = u^(n/2)` iff `n ∣ k − n/2` in the
sense of `Nat.ModEq`). In characteristic two no element has even order, so the statement is
vacuous there. Deduce, for a prime `p`, a natural `q > 0` and `orderOf (q : ZMod p) = n`:
`p ∣ q^k − 1 ↔ n ∣ k` for every `k` (this is §1.1 at `b = 1` and needs no positivity of `n`:
for `q ≡ 0`, `orderOf = 0` and both sides hold only at `k = 0`), and, if `0 < n` and `n` is
even, `p ∣ q^k + 1 ↔ n/2 ∣ k ∧ ¬ n ∣ k`. Consume `orderOf_dvd_iff_pow_eq_one` and
`MulEquiv.orderOf_eq` for the power-one and transport laws.
*Needs:* §1.1; Mathlib `orderOf_dvd_iff_pow_eq_one`, `pow_eq_one_iff_modEq`, `orderOf_pow'`,
`mul_self_eq_one_iff`, `MulEquiv.orderOf_eq`.

**Checks.**
- `K = ℂ`, `u = i`, `n = 4`: `i^2 = −1` (`2 ∣ 2`, `4 ∤ 2`), `i^4 = 1 ≠ −1`, `i^6 = −1`.
- `K = ℤ`, `u = −1`, `n = 2`: `(−1)^k = −1` iff `k` is odd, which is `1 ∣ k ∧ 2 ∤ k`.
- `ZMod 8`, `u = 3`: `3² = 1`, order `2`, but `3 ≠ −1 = 7`, so the domain hypothesis is needed.
- `p = 5`, `q = 2`, `n = 4`: `5 ∣ 2^k + 1` for `k = 2, 6` (`5, 65`) and not for `k = 4` (`17`).
- `p = 7`, `q = 2`, `n = 3`: `7 ∣ 2^k − 1` iff `3 ∣ k`; `n` is odd, so no `q^k + 1` criterion is
  claimed, and indeed `7 ∤ 2^k + 1` for every `k` (`2^k ≡ 1, 2, 4`).
- `p = 3`, `q = 3`: `orderOf (0 : ZMod 3) = 0`, `3 ∣ 3^k − 1` only for `k = 0`, and `0 ∣ k` only
  for `k = 0`.

### Examples

The primes `3, 7, 5, 31, 127` are primes of order `2, 3, 4, 5, 7` for `2`; `13` has `3` of order
`3`; `7` has `3/2` of order `6`.

### Dependencies

Layers 1 and 2; Mathlib as listed.

## Downstream consumers

No roadmap on the main branch cites these results. The intended consumers are developments of the
orders of finite linear groups and of minimal faithful degrees, where a prime of order `n` for `q`
modulo `p` is the standard input (Roitman 1997, p. 1913, and the Wedderburn argument on p. 1918),
and the theory of large Zsigmondy primes (Roitman 1997, Theorem 6, p. 1915), which extends Layer 3
in its own roadmap.

## Provenance

This section is secondary; it maps targets to existing formalizations and prescribes nothing.
The repository https://github.com/AxiomMath/CFSG (Lean 4, Mathlib) proves the base-at-least-three
specialization of §3.2 in `CFSG/LinearAlgebra/SL2MinimalFaithfulZsigmondy.lean` and the base-two
specialization in `CFSG/Timmesfeld/Orders/Bang.lean`. Layers 0–3 specify the mathematics and its
scope independently of those implementations.

## References

- K. Zsigmondy, *Zur Theorie der Potenzreste*, Monatshefte für Mathematik und Physik 3 (1892),
  265–284, doi:10.1007/BF01692444 (the theorem on p. 283; cited by its locator).
- G. D. Birkhoff and H. S. Vandiver, *On the integral divisors of `a^n − b^n`*, Annals of
  Mathematics (2) 5 (1904), 173–180, doi:10.2307/2007263 (Theorems I–V, pp. 174–178).
- M. Roitman, *On Zsigmondy primes*, Proceedings of the American Mathematical Society 125 (1997),
  1913–1919, doi:10.1090/S0002-9939-97-03981-6 (Lemma 1, Proposition 2, Theorem 3, Lemma 5).
- Ö. Avcı, *Large Zsigmondy primes*, arXiv:2011.06136v2 (2023) (Definition 2.4, Lemma 2.2,
  Corollaries 2.6 and 2.8, Lemmas 2.9, 2.11, 2.12 and 3.1).
