import Mathlib
import TauCeti.KnotTheory.BraidWord.PDCode
import TauCeti.KnotTheory.PDCode.Alexander.Basic

/-!
# The source155 two-strand Alexander continuants

**This file is not the roadmap and is not exhaustive.** The README is definitive.
The matrix and polynomial targets below use native polynomial/Laurent rings.
The native braid/PD arc-module comparison is an explicit target below.
The geometric infinite-cyclic-cover, meridional Fox and named-link comparisons
are additional README targets, not supplied by the continuant calculation.
-/

noncomputable section

namespace TauCetiRoadmap.GeometricTopology.TwoStrandAlexander

open Polynomial LaurentPolynomial

def minor (r : ℕ) : Matrix (Fin r) (Fin r) ℤ[X] :=
  fun i j => if i = j then 1 - X
    else if i.val + 1 = j.val then X
    else if j.val + 1 = i.val then -1 else 0

def raw (n : ℕ) : ℤ[X] := ∑ j ∈ Finset.range n, (-X) ^ j

/-- The zero-sized determinant gives the one-crossing unknot branch. -/
theorem continuant_det (r : ℕ) : (minor r).det = raw (r + 1) := by
  sorry

/-- A polynomial identity, valid also at the apparent singular value X = -1. -/
theorem division_free (n : ℕ) : (1 + X) * raw n = 1 - (-X) ^ n := by
  simpa only [raw, sub_neg_eq_add, add_comm] using mul_neg_geom_sum (-X : ℤ[X]) n

/-- The generator is the half-variable s. This is the opposite-skein source
normalization; `standardNormalized` below supplies the README invariant. -/
def normalized (n : ℕ) : ℤ[T;T⁻¹] :=
  ∑ j ∈ Finset.range n,
    (-1 : ℤ[T;T⁻¹]) ^ j * T (2 * (j : ℤ) - ((n : ℤ) - 1))

/-- Arithmetic recurrence for the opposite-skein source normalization. -/
theorem normalized_recurrence (n : ℕ) :
    normalized (n + 2) = normalized n - (T 1 - T (-1)) * normalized (n + 1) := by
  sorry

/-- Native two-strand braid word, including the two-component empty closure. -/
def word (n : ℕ) : TauCeti.BraidWord 2 := List.replicate n (0, 1)

/-- The native PD module is the unreduced arc module. Its free summand is
retained, including n=0. Identifying the second summand with actual cover H₁
is a separate geometric README target. -/
theorem native_alexanderModule_decomposition (n : ℕ) :
    Nonempty ((word n).closure.AlexanderModule ≃ₗ[ℤ[T;T⁻¹]]
      (ℤ[T;T⁻¹] × (ℤ[T;T⁻¹] ⧸ Ideal.span { (raw n).toLaurent }))) := by
  sorry

/-- The standard Conway skein has positive Hopf value s-s⁻¹. The parity
factor is harmless at n=0 since the source polynomial is zero there. -/
def standardNormalized (n : ℕ) : ℤ[T;T⁻¹] :=
  (-1) ^ (n - 1) * normalized n

theorem standardNormalized_zero : standardNormalized 0 = 0 := by
  simp [standardNormalized, normalized]

theorem standardNormalized_one : standardNormalized 1 = 1 := by
  norm_num [standardNormalized, normalized, Finset.sum_range_succ]

theorem standardNormalized_two : standardNormalized 2 = T 1 - T (-1) := by
  norm_num [standardNormalized, normalized, Finset.sum_range_succ]
  ring

theorem standardNormalized_recurrence (n : ℕ) :
    standardNormalized (n + 2) =
      (T 1 - T (-1)) * standardNormalized (n + 1) + standardNormalized n := by
  cases n with
  | zero => simp [standardNormalized_zero, standardNormalized_one, standardNormalized_two]
  | succ n =>
    have h0 : n + 1 - 1 = n := by omega
    have h1 : n + 1 + 1 - 1 = n + 1 := by omega
    have h2 : n + 1 + 2 - 1 = n + 2 := by omega
    simp only [standardNormalized, h0, h1, h2,
      normalized_recurrence, pow_succ]
    ring

/-- Evaluation at the apparent pole of the quotient expression is exact. -/
theorem raw_eval_neg_one (n : ℕ) : (raw n).eval (-1) = (n : ℤ) := by
  simp [raw, eval_finsetSum]

end TauCetiRoadmap.GeometricTopology.TwoStrandAlexander
