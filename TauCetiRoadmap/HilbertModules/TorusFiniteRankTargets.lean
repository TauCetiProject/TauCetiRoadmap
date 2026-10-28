import TauCetiRoadmap.HilbertModules.TorusLineTargets
import Mathlib.LinearAlgebra.Matrix.Determinant.Basic

/-!
Suggested forms are aids, not the specification; the README is definitive.
These signatures pin H5.TorusFiniteRankSections' actual cyclic coordinates
and averaged pairing. Bundle construction and unstable classification are
README targets, not asserted by these signature checks.
-/
noncomputable section
open scoped BigOperators
namespace HilbertModules.TorusFiniteRank
open HilbertModules.TorusLine

/-- Both transformation laws, on ordinary continuous complex functions. -/
def IsCovariant (a : ℤ) (b : ℕ) (ξ : C(Plane, ℂ)) : Prop :=
  (∀ r s : ℝ, ξ (r + 1, s) = ξ (r, s)) ∧
  (∀ r s : ℝ, ξ (r, s + b) = phase a r * ξ (r, s))

def coordinates (b : ℕ) (ξ : C(Plane, ℂ)) (r s : ℝ) : Fin b → ℂ :=
  fun j => ξ (r, s + (j.val : ℝ))

/-- The last row wraps to coordinate zero, with the scalar phase. -/
def transition (a : ℤ) (b : ℕ) (r : ℝ) : Matrix (Fin b) (Fin b) ℂ :=
  fun i j => if i.val + 1 < b then
    (if j.val = i.val + 1 then 1 else 0)
  else (if j.val = 0 then phase a r else 0)

def pairing (b : ℕ) (ξ η : C(Plane, ℂ)) (r s : ℝ) : ℂ :=
  (b : ℂ)⁻¹ * ∑ j : Fin b,
    star (ξ (r, s + (j.val : ℝ))) * η (r, s + (j.val : ℝ))

/-- Scalar covariant functions give precisely these cyclic vector transitions. -/
theorem coordinate_transition (a : ℤ) (b : ℕ) (hb : 0 < b)
    (ξ : C(Plane, ℂ)) (hξ : IsCovariant a b ξ) (r s : ℝ) :
    coordinates b ξ (r + 1) s = coordinates b ξ r s ∧
    coordinates b ξ r (s + 1) =
      (transition a b r).mulVec (coordinates b ξ r s) := by
  sorry

/-- The constant permutation sign does not change the determinant Chern number. -/
theorem determinant_transition (a : ℤ) (b : ℕ) (hb : 0 < b) (r : ℝ) :
    (transition a b r).det = (-1 : ℂ) ^ (b - 1) * phase a r := by
  sorry

/-- Both periods descend; positivity and the zero criterion use every sheet. -/
theorem pairing_laws (a : ℤ) (b : ℕ) (hb : 0 < b)
    (ξ η : C(Plane, ℂ)) (hξ : IsCovariant a b ξ) (hη : IsCovariant a b η)
    (r s : ℝ) :
    pairing b ξ η (r + 1) s = pairing b ξ η r s ∧
    pairing b ξ η r (s + 1) = pairing b ξ η r s ∧
    (pairing b ξ ξ r s).im = 0 ∧ 0 ≤ (pairing b ξ ξ r s).re ∧
    (pairing b ξ ξ r s = 0 ↔ ∀ j : Fin b, ξ (r, s + (j.val : ℝ)) = 0) := by
  sorry

end HilbertModules.TorusFiniteRank
