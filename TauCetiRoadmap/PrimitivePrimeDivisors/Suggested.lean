import Mathlib.Algebra.Polynomial.Homogenize
import Mathlib.RingTheory.Polynomial.Cyclotomic.Basic
import Mathlib.Data.Nat.Prime.Basic
import Mathlib.FieldTheory.Finite.Basic

/-!
# Primitive prime divisors: suggested interfaces

This file is not the roadmap and is not exhaustive. `README.md` is definitive;
these are suggested forms for selected targets, not a complete checklist.
Every `sorry` is a mathematical target.
-/

namespace TauCetiRoadmap.PrimitivePrimeDivisors

/-- Integer evaluation; the first coordinate is X and the second is Y. -/
noncomputable def homogeneousCyclotomic (n : ℕ) (a b : ℤ) : ℤ :=
  MvPolynomial.eval ![a,b] ((Polynomial.cyclotomic n ℤ).homogenize n.totient)

theorem homogeneousCyclotomic_pos {a b n : ℕ} (hb : 0 < b) (hba : b < a)
    (hn : 1 ≤ n) : 0 < homogeneousCyclotomic n a b := sorry

theorem pow_sub_pow_eq_prod {a b n : ℕ} (hn : 0 < n) :
    (a : ℤ)^n - (b : ℤ)^n = ∏ d ∈ n.divisors, homogeneousCyclotomic d a b := sorry

theorem sub_pow_totient_lt {a b n : ℕ} (hb : 0 < b) (hba : b < a)
    (hn : 2 ≤ n) : ((a : ℤ) - b)^n.totient < homogeneousCyclotomic n a b := sorry

theorem pow_eq_neg_one_iff {K : Type*} [CommRing K] [IsDomain K]
    (u : K) {n : ℕ} (hn : 0 < n) (heven : Even n) (horder : orderOf u = n) (k : ℕ) :
    u^k = -1 ↔ n/2 ∣ k ∧ ¬ n ∣ k := sorry

theorem exists_prime_dvd_pow_sub_pow {a b n : ℕ}
    (hb : 0 < b) (hba : b < a) (hab : a.Coprime b) (hn : 2 ≤ n)
    (h₂ : n = 2 → ¬ ∃ k : ℕ, a + b = 2 ^ k)
    (h₆ : n = 6 → a ≠ 2 ∨ b ≠ 1) :
    ∃ p : ℕ, p.Prime ∧ p ∣ a ^ n - b ^ n ∧
      ∀ k : ℕ, 0 < k → k < n → ¬ p ∣ a ^ k - b ^ k := sorry

theorem exists_prime_dvd_pow_sub_pow_iff {a b n : ℕ}
    (hb : 0 < b) (hba : b < a) (hab : a.Coprime b) (hn : 2 ≤ n) :
    (∃ p : ℕ, p.Prime ∧ p ∣ a ^ n - b ^ n ∧
      ∀ k : ℕ, 0 < k → k < n → ¬ p ∣ a ^ k - b ^ k) ↔
      ¬ (n = 2 ∧ ∃ k : ℕ, a + b = 2 ^ k) ∧
      ¬ (a = 2 ∧ b = 1 ∧ n = 6) := sorry

theorem exists_prime_orderOf_eq {a n : ℕ} (ha : 3 ≤ a) (hn : 3 ≤ n) :
    ∃ p : ℕ, p.Prime ∧ orderOf (a : ZMod p) = n := sorry

theorem exists_prime_orderOf_two_eq {n : ℕ} (hn : 2 ≤ n) (h₆ : n ≠ 6) :
    ∃ p : ℕ, p.Prime ∧ orderOf (2 : ZMod p) = n := sorry

theorem dvd_pow_sub_one_iff {p q : ℕ} [Fact p.Prime] (hq : 0 < q) (k : ℕ) :
    p ∣ q ^ k - 1 ↔ orderOf (q : ZMod p) ∣ k := sorry

theorem dvd_pow_add_one_iff {p q n : ℕ} [Fact p.Prime] (hq : 0 < q)
    (hn : 0 < n) (heven : Even n) (horder : orderOf (q : ZMod p) = n) (k : ℕ) :
    p ∣ q ^ k + 1 ↔ n / 2 ∣ k ∧ ¬ n ∣ k := sorry

end TauCetiRoadmap.PrimitivePrimeDivisors
