module

public import Mathlib

/-!
# Primitive prime divisors: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib: the Bang–Zsigmondy theorem for coprime `a > b > 0` with
its exact exceptions, its characterization, the multiplicative-order corollaries, and the
valuation of a nonprimitive prime in a homogeneous cyclotomic value. Every headline is statable
at the pin; the one definition, `homogeneousCyclotomic`, is the two-variable cyclotomic value
needed to state the valuation headline. Every `sorry` is a target of the roadmap.
-/

@[expose] public section

namespace TauCetiRoadmap.PrimitivePrimeDivisors

/-- The homogeneous cyclotomic value `Φ_n(a,b) = Σ cᵢ aⁱ b^(φ(n)−i)`, the evaluation at
`![a, b]` of the homogenization of `Polynomial.cyclotomic n ℤ` at degree `φ(n)`; the first
argument is the base `a` (`Φ_1(a,b) = a − b`) and `Φ_0(a,b) = 1`
(Birkhoff–Vandiver 1904, p. 176). -/
noncomputable def homogeneousCyclotomic (n : ℕ) (a b : ℤ) : ℤ :=
  MvPolynomial.eval ![a, b] ((Polynomial.cyclotomic n ℤ).homogenize n.totient)

/-! ## Layer 1: multiplicative orders and valuations -/

/-- A prime divisor of `Φ_n(a,b)` (`n ≥ 3`, `a > b > 0` coprime) that is not primitive for
`a^n − b^n` is the largest prime factor of `n` and divides `Φ_n(a,b)` exactly once
(Birkhoff–Vandiver 1904, Theorem IV, p. 177; Roitman 1997, Proposition 2, p. 1914). -/
theorem padicValInt_homogeneousCyclotomic_of_not_primitive {a b n p : ℕ}
    (hb : 0 < b) (hba : b < a) (hab : a.Coprime b) (hn : 3 ≤ n) (hp : p.Prime)
    (hdvd : (p : ℤ) ∣ homogeneousCyclotomic n a b)
    (hk : ∃ k : ℕ, 0 < k ∧ k < n ∧ p ∣ a ^ k - b ^ k) :
    p ∣ n ∧ (∀ q : ℕ, q.Prime → q ∣ n → q ≤ p) ∧
      padicValInt p (homogeneousCyclotomic n a b) = 1 := sorry

/-! ## Layer 2: existence and the exact exceptions -/

/-- The Bang–Zsigmondy theorem: for coprime `a > b > 0` and `n ≥ 2`, `a^n − b^n` has a prime
divisor dividing no `a^k − b^k` with `0 < k < n`, unless `n = 2` and `a + b` is a power of two,
or `(a, b, n) = (2, 1, 6)` (Zsigmondy 1892, p. 283; Birkhoff–Vandiver 1904, Theorem V, p. 178). -/
theorem exists_prime_dvd_pow_sub_pow {a b n : ℕ}
    (hb : 0 < b) (hba : b < a) (hab : a.Coprime b) (hn : 2 ≤ n)
    (h₂ : n = 2 → ¬ ∃ k : ℕ, a + b = 2 ^ k)
    (h₆ : n = 6 → a ≠ 2 ∨ b ≠ 1) :
    ∃ p : ℕ, p.Prime ∧ p ∣ a ^ n - b ^ n ∧
      ∀ k : ℕ, 0 < k → k < n → ¬ p ∣ a ^ k - b ^ k := sorry

/-- The exact characterization: for coprime `a > b > 0` and `n ≥ 2`, a primitive prime divisor
of `a^n − b^n` exists if and only if neither exceptional case holds (Roitman 1997, Theorem 3,
p. 1914, for `b = 1`). -/
theorem exists_prime_dvd_pow_sub_pow_iff {a b n : ℕ}
    (hb : 0 < b) (hba : b < a) (hab : a.Coprime b) (hn : 2 ≤ n) :
    (∃ p : ℕ, p.Prime ∧ p ∣ a ^ n - b ^ n ∧
      ∀ k : ℕ, 0 < k → k < n → ¬ p ∣ a ^ k - b ^ k) ↔
      ¬ (n = 2 ∧ ∃ k : ℕ, a + b = 2 ^ k) ∧
      ¬ (a = 2 ∧ b = 1 ∧ n = 6) := sorry

/-! ## Layer 3: corollaries -/

/-- The two-variable order form: outside the two exceptions there is a prime `p` not dividing
`a * b` at which `a / b` has multiplicative order exactly `n`; the inverse is Mathlib's `ZMod.inv`,
the field inverse at a prime (Roitman 1997, p. 1913). -/
theorem exists_prime_orderOf_div_eq {a b n : ℕ}
    (hb : 0 < b) (hba : b < a) (hab : a.Coprime b) (hn : 2 ≤ n)
    (h₂ : n = 2 → ¬ ∃ k : ℕ, a + b = 2 ^ k)
    (h₆ : n = 6 → a ≠ 2 ∨ b ≠ 1) :
    ∃ p : ℕ, p.Prime ∧ ¬ p ∣ a * b ∧ orderOf ((a : ZMod p) * (b : ZMod p)⁻¹) = n := sorry

/-- For `a ≥ 3` and `n ≥ 3` there is a prime `p` at which `a` has multiplicative order exactly
`n` (Roitman 1997, Theorem 3, p. 1914: both exceptions are excluded by the hypotheses). -/
theorem exists_prime_orderOf_eq {a n : ℕ} (ha : 3 ≤ a) (hn : 3 ≤ n) :
    ∃ p : ℕ, p.Prime ∧ orderOf (a : ZMod p) = n := sorry

/-- For `n ≥ 2`, `n ≠ 6`, there is a prime `p` at which `2` has multiplicative order exactly `n`
(Roitman 1997, Theorem 3, p. 1914, at `a = 2`). -/
theorem exists_prime_orderOf_two_eq {n : ℕ} (hn : 2 ≤ n) (h₆ : n ≠ 6) :
    ∃ p : ℕ, p.Prime ∧ orderOf (2 : ZMod p) = n := sorry

/-- Orders `2n`: for coprime `a > b > 0` and `n ≥ 1`, unless `n = 1` with `a + b` a power of two
or `(a, b, n) = (2, 1, 3)`, there is a prime dividing `a^n + b^n` and no `a^k − b^k` with
`0 < k < 2n` (the Bang–Zsigmondy theorem at the exponent `2n`). -/
theorem exists_prime_dvd_pow_add_pow {a b n : ℕ}
    (hb : 0 < b) (hba : b < a) (hab : a.Coprime b) (hn : 1 ≤ n)
    (h₁ : n = 1 → ¬ ∃ k : ℕ, a + b = 2 ^ k)
    (h₃ : n = 3 → a ≠ 2 ∨ b ≠ 1) :
    ∃ p : ℕ, p.Prime ∧ p ∣ a ^ n + b ^ n ∧
      ∀ k : ℕ, 0 < k → k < 2 * n → ¬ p ∣ a ^ k - b ^ k := sorry

end TauCetiRoadmap.PrimitivePrimeDivisors
