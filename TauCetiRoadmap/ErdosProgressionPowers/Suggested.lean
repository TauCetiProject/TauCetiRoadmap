import Mathlib

/-!
# ErdosProgressionPowers: target signatures

The roadmap is README.md; this file is not the roadmap. It states the roadmap's
headline theorems against the pinned Mathlib and Tau Ceti APIs: half-interval
prime divisibility, the effective prime-exponent bound, signed hyperbolic and
positive fixed-exponent finiteness, fixed-length all-exponent finiteness, and
the Erdos-Selfridge consecutive-product theorem.

The comparison-curve theorem (README section 1.12) and the full simultaneous
quadratic-character family (section 2.7) are not statable at the pins: they need
the arithmetic conductor and deletion level of the progression Frey curve,
together with its residual Galois-representation comparison. The existing
Weierstrass and Dirichlet-character carriers do not supply these invariants.
In particular, a character statement omitting divisibility by that deletion
level would omit part of the headline theorem, so none is stated here.

The existential prime-exponent statement records the numerical bound; its
README theorem additionally requires an effectively computable threshold.
The Erdos eventual-nonexistence conjecture and the announced smooth-multiplier
extension in Layer 7 are not asserted as theorems.
-/

open scoped BigOperators

namespace TauCetiRoadmap.ErdosProgressionPowers

/-! ## Layer 0: Primitive solutions and signed factors -/

/-- The zero-based integer progression term n + i*d. -/
def term (n d : ℤ) (i : ℕ) : ℤ := n + (i : ℤ) * d

/-- A positive-length primitive progression solution with prime exponent and nonzero y*d. -/
def primitive_solution (n d : ℤ) (k : ℕ) (y : ℤ) (ell : ℕ) : Prop :=
  0 < k ∧ ell.Prime ∧ Int.gcd n d = 1 ∧
    (∏ i ∈ Finset.range k, term n d i) = y ^ ell ∧ y * d ≠ 0

/-- A primitive solution of length at least 10^8 with exponent above exp(10^k). -/
def H (n d : ℤ) (k : ℕ) (y : ℤ) (ell : ℕ) : Prop :=
  primitive_solution n d k y ell ∧ 10 ^ 8 ≤ k ∧ (ell : ℝ) > Real.exp (10 ^ k : ℝ)

/-! ## Layer 1: Frey families and residual comparisons -/

/-- Every prime in the upper half of the length divides the common difference under H. -/
theorem half_primes_divide_d {n d : ℤ} {k : ℕ} {y : ℤ} {ell p : ℕ}
    (hH : H n d k y ell) (hp : p.Prime) (hl : k < 2*p) (hu : p ≤ k) : (p : ℤ) ∣ d := by sorry

/-! ## Layer 6: Effective exponent bound and fixed-length finiteness -/

/-- Above an absolute threshold, a nontrivial primitive progression has prime exponent at most exp(10^k). -/
theorem effective_prime_bound : ∃ k0 : ℕ, 5 ≤ k0 ∧
    ∀ (k : ℕ) (n d y : ℤ) (ell : ℕ), k0 ≤ k → 0 < k → Int.gcd n d = 1 → ell.Prime →
      (∏ i ∈ Finset.range k, term n d i) = y^ell →
      y*d=0 ∨ (ell : ℝ) ≤ Real.exp (10^k : ℝ) := by sorry

/-- Fixed-exponent signed progression finiteness throughout the hyperbolic diagonal-curve range. -/
theorem fixed_exponent_finiteness (k ell : ℕ) (hk : 3 ≤ k) (he : 2 ≤ ell)
    (hh : 2*ell+k < k*ell) :
    {t : ℤ × ℤ × ℤ | Int.gcd t.1 t.2.1 = 1 ∧ t.2.2*t.2.1 ≠ 0 ∧
      (∏ i ∈ Finset.range k, term t.1 t.2.1 i) = t.2.2^ell}.Finite := by sorry

/-- Positive fixed-exponent finiteness includes the two elliptic arithmetic boundary cases. -/
theorem positive_fixed_exponent_finiteness (k ell : ℕ) (hk : 3 ≤ k) (he : 2 ≤ ell)
    (hh : 6 ≤ k+ell) :
    {t : ℤ × ℤ × ℤ | 0 < t.1 ∧ 0 < t.2.1 ∧ 0 < t.2.2 ∧
      Int.gcd t.1 t.2.1 = 1 ∧
      (∏ i ∈ Finset.range k, term t.1 t.2.1 i) = t.2.2^ell}.Finite := by sorry

/-- For each sufficiently large fixed length there are finitely many primitive nontrivial solutions with arbitrary exponent at least two. -/
theorem fixed_length_finiteness : ∃ k0 : ℕ, 5 ≤ k0 ∧ ∀ k ≥ k0,
    ({t : ℤ × ℤ × ℤ × ℕ | 0 < t.1 ∧ 0 < t.2.1 ∧ 0 < t.2.2.1 ∧ 2 ≤ t.2.2.2 ∧
      Int.gcd t.1 t.2.1 = 1 ∧ (∏ i ∈ Finset.range k, term t.1 t.2.1 i) = t.2.2.1^t.2.2.2}.Finite) ∧
    {t : ℤ × ℤ × ℤ × ℕ | t.2.2.1*t.2.1 ≠ 0 ∧ 2 ≤ t.2.2.2 ∧ Int.gcd t.1 t.2.1 = 1 ∧
      (∏ i ∈ Finset.range k, term t.1 t.2.1 i) = t.2.2.1^t.2.2.2}.Finite := by sorry

/-! ## Layer 7: Conjectural and announced predicates -/

/-- A product of at least two consecutive positive integers is not a nontrivial perfect power. -/
theorem consecutiveProduct_not_perfectPower (n k y ell : ℕ)
    (hn : 0 < n) (hk : 2 ≤ k) (hy : 0 < y) (he : 2 ≤ ell) :
    (∏ i ∈ Finset.range k, (n + i)) ≠ y^ell := by sorry

end TauCetiRoadmap.ErdosProgressionPowers
