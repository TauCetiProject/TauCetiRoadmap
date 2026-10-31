import TauCeti.KnotTheory.TristramLevine.Alexander
import Mathlib

/-!
Suggested forms are aids, not the specification; the README is definitive.
These targets use the native Hermitian signature and Circle parameter. The
three admitted theorems specify future proofs. The geometric Seifert,
metabolizer and surface-exterior comparisons are additional README targets.
-/
noncomputable section
namespace TauCetiRoadmap.GeometricTopology.SignatureFunction
open TauCeti.KnotTheory Filter
open scoped Topology

/-- Local constancy at a nonsingular member of a continuous Hermitian family.
The result uses the native signature, without choosing continuous eigenvectors. -/
theorem signature_eventually_eq {X ι : Type*} [TopologicalSpace X] [Fintype ι]
    [DecidableEq ι] (A : X → Matrix ι ι ℂ) (hA : ∀ x, (A x).IsHermitian)
    (x : X) (hc : ContinuousAt A x) (hd : (A x).det ≠ 0) :
    ∀ᶠ y in 𝓝 x, (hA y).signature = (hA x).signature := by
  sorry

/-- Both angular values exist and are even for a real even-sized Seifert
matrix with nonsingular skew part. No knot name or geometric comparison is
encoded in this matrix-level hypothesis. -/
theorem exists_angular_sides {g : ℕ} (V : Matrix (Fin (2 * g)) (Fin (2 * g)) ℝ)
    (hV : (V - V.transpose).det ≠ 0) (ω : Circle) :
    ∃ a b : ℤ, 2 ∣ a ∧ 2 ∣ b ∧ ∃ ε : ℝ, 0 < ε ∧
      ∀ θ : ℝ, 0 < θ → θ < ε →
        tristramLevineSignature V ((ω * Circle.exp θ : Circle) : ℂ) = a ∧
        tristramLevineSignature V ((ω * Circle.exp (-θ) : Circle) : ℂ) = b := by
  sorry

/-- The limiting Hermitian matrix after dividing by θ is i(Vᵀ−V).
Its conjugate spectrum is paired with its negative, so the nearby raw
signature is zero on both sides of 1. Includes the empty matrix. -/
theorem signature_near_one_eq_zero {g : ℕ}
    (V : Matrix (Fin (2 * g)) (Fin (2 * g)) ℝ)
    (hV : (V - V.transpose).det ≠ 0) :
    ∃ ε : ℝ, 0 < ε ∧ ∀ θ : ℝ, 0 < |θ| → |θ| < ε →
      tristramLevineSignature V ((Circle.exp θ : Circle) : ℂ) = 0 := by
  sorry

/-- Taking the integer mean is exact even when its value is odd. -/
theorem twice_integer_average (a b : ℤ) (ha : 2 ∣ a) (hb : 2 ∣ b) :
    2 * ((a + b) / 2) = a + b := by
  have h : 2 ∣ a + b := dvd_add ha hb
  omega

/-- The existing determinant theorem is the input, not a new admitted target. -/
theorem nonsingular_iff {ι : Type*} [Fintype ι] [DecidableEq ι]
    (V : Matrix ι ι ℤ) (ω : Circle) (hω : ω ≠ 1) :
    (tristramLevineForm (V.map (Int.castRingHom ℝ)) ω).det ≠ 0 ↔
      LaurentPolynomial.eval₂ (Int.castRingHom ℂ) (Circle.toUnits ω)
        (alexander V) ≠ 0 :=
  det_tristramLevineForm_int_ne_zero_iff V ω hω

end TauCetiRoadmap.GeometricTopology.SignatureFunction
