import Mathlib.Data.Fin.Rev
import Mathlib.LinearAlgebra.Matrix.Permutation
import Mathlib.LinearAlgebra.Matrix.GeneralLinearGroup.Defs
import Mathlib.Basic.Complex.Basic

/-!
These are suggested forms, not the roadmap or an exhaustive checklist.
The ClassicalGroups README specifies the basis, group and Borel comparisons.
-/

namespace TauCetiRoadmap.ClassicalGroups.Antidiagonal

/-- The reverse-diagonal Gram matrix on the specified ordered isotropic basis. -/
def gram (n : ℕ) : Matrix (Fin n) (Fin n) ℂ := Fin.revPerm.permMatrix ℂ

/-- Bilinear-form adjoint: transpose, without conjugating coefficients. -/
def reverseAdjoint {n : ℕ} (A : Matrix (Fin n) (Fin n) ℂ) :=
  gram n * A.transpose * gram n

/-- This is an anti-involution, including the empty matrix. -/
theorem reverseAdjoint_reverseAdjoint {n : ℕ}
    (A : Matrix (Fin n) (Fin n) ℂ) :
    reverseAdjoint (reverseAdjoint A) = A := by
  sorry

/-- The two coordinate conditions agree on the same invertible matrices.
The separate determinant-one condition cuts out SO. -/
theorem orthogonal_iff_mul_reverseAdjoint {n : ℕ}
    (A : (Matrix (Fin n) (Fin n) ℂ)ˣ) :
    (A.val.transpose * gram n * A.val = gram n) ↔
      A.val * reverseAdjoint A.val = 1 := by
  sorry

end TauCetiRoadmap.ClassicalGroups.Antidiagonal
