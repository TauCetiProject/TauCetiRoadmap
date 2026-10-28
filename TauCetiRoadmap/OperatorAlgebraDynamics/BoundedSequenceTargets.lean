import Mathlib.Analysis.Normed.Lp.lpSpace
import Mathlib.Analysis.Normed.Operator.Basic
import Mathlib.Data.Int.Interval

/-!
Suggested forms are aids, not the specification; the README is definitive.
These native function/operator signatures pin D2.BoundedSequenceTranslation.
Crossed-product completions and the quotient-spectrum description are README
construction targets; the signatures do not implement those proofs.
-/
noncomputable section
open scoped BigOperators ENNReal
namespace OperatorAlgebraDynamics.BoundedSequence

abbrev H := lp (fun _ : ℤ => ℂ) 2
abbrev B := lp (fun _ : ℤ => ℂ) ∞

def entry (T : H →L[ℂ] H) (i j : ℤ) : ℂ :=
  T (lp.single 2 j (1 : ℂ)) i

/-- Actual rank-one matrix units, independent of the crossed-product completion. -/
theorem matrix_units :
    ∃ E : ℤ → ℤ → (H →L[ℂ] H),
      (∀ i j ξ n, E i j ξ n = if n = i then ξ j else 0) ∧
      (∀ i j k l, (E i j).comp (E k l) = if j = k then E i l else 0) ∧
      (∀ i j, ‖E i j‖ = 1) := by
  sorry

/-- The coefficient norm bound and finite integrated formula retain the shift sign. -/
theorem finite_band_decomposition (T : H →L[ℂ] H) (N : ℕ)
    (hT : ∀ i j : ℤ, (N : ℤ) < |i - j| → entry T i j = 0) :
    ∃ f : ℤ → B,
      (∀ k i, f k i = entry T i (i - k)) ∧
      (∀ k, ‖f k‖ ≤ ‖T‖) ∧
      ∀ ξ : H, ∀ i : ℤ,
        T ξ i = ∑ k ∈ Finset.Icc (-(N : ℤ)) (N : ℤ), f k i * ξ (i - k) := by
  sorry

/-- The parity projection obstructs even an underlying unital ring character. -/
theorem no_character {A : Type*} [Ring A] (p : A) (u : Aˣ)
    (hp : p * p = p) (hflip : (u : A) * p * (↑(u⁻¹) : A) = 1 - p) :
    IsEmpty (A →+* ℂ) := by
  sorry

end OperatorAlgebraDynamics.BoundedSequence
