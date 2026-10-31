import TauCeti.KnotTheory.SeifertMatrix.SEquivalence
import TauCeti.KnotTheory.TristramLevine.Alexander
import Mathlib

/-!
Suggested forms are aids, not the specification; the README is definitive.
The four admitted uniform invariant statements are future proof targets.
The proved array/basis checks do not identify a pictured surface or certify
its clasp, framing, normal push-offs or actual knot type.
-/

noncomputable section
namespace TauCetiRoadmap.GeometricTopology.WhiteheadSeifert

open Polynomial LaurentPolynomial TauCeti.KnotTheory

/-- Positive-push-second matrix; geometry restricts ε to ±1. -/
def matrix (ε m : ℤ) : Matrix (Fin 2) (Fin 2) ℤ := !![-ε, 0; -1, m]

def integralMatrix (ε m : ℤ) : IntegralSquareMatrix := ⟨2, matrix ε m⟩

def realMatrix (ε m : ℤ) : Matrix (Fin 2) (Fin 2) ℝ :=
  (matrix ε m).map (Int.castRingHom ℝ)

theorem skew_det (ε m : ℤ) :
    (matrix ε m - (matrix ε m).transpose).det = 1 := by
  simp [matrix, Matrix.det_fin_two, Matrix.sub_apply, Matrix.transpose_apply]

theorem matrix_det (ε m : ℤ) : (matrix ε m).det = -ε * m := by
  simp [matrix, Matrix.det_fin_two]

theorem symmetric_det (ε m : ℤ) :
    (matrix ε m + (matrix ε m).transpose).det = -4 * ε * m - 1 := by
  simp [matrix, Matrix.det_fin_two, Matrix.add_apply, Matrix.transpose_apply]
  ring

def ordinaryDet (ε m : ℤ) : ℤ[X] :=
  ((Polynomial.X : ℤ[X]) • (matrix ε m).map (Polynomial.C : ℤ →+* ℤ[X]) -
    ((matrix ε m).map (Polynomial.C : ℤ →+* ℤ[X])).transpose).det

theorem ordinaryDet_eq (ε m : ℤ) :
    ordinaryDet ε m = -Polynomial.C (ε * m) * (X - 1)^2 + X := by
  simp [ordinaryDet, matrix, Matrix.det_fin_two, Matrix.sub_apply,
    Matrix.smul_apply, Matrix.transpose_apply]
  ring

/-- Native Conway normalization, with no private Alexander invariant. -/
theorem alexander_eq (ε m : ℤ) :
    alexander (matrix ε m) = 1 - LaurentPolynomial.C (ε * m) * (T 1 + T (-1) - 2) := by
  sorry

def normalBasis (ε : ℤ) : Matrix (Fin 2) (Fin 2) ℤ := !![1, 0; -ε, 1]

theorem normalBasis_det (ε : ℤ) : (normalBasis ε).det = 1 := by
  simp [normalBasis, Matrix.det_fin_two]

theorem normalBasis_eq (ε m : ℤ) (hε : ε = 1 ∨ ε = -1) :
    normalBasis ε * matrix ε m * (normalBasis ε).transpose = !![-ε, 1; 0, m] := by
  rcases hε with rfl | rfl <;>
    ext i j <;> fin_cases i <;> fin_cases j <;>
    simp [normalBasis, matrix, Matrix.mul_apply, Fin.sum_univ_two, Matrix.transpose_apply]

def mirrorBasis (ε : ℤ) : Matrix (Fin 2) (Fin 2) ℤ := !![-1, 0; ε, -1]

theorem mirrorBasis_det (ε : ℤ) : (mirrorBasis ε).det = 1 := by
  simp [mirrorBasis, Matrix.det_fin_two]

theorem mirror_basis_eq (ε m : ℤ) (hε : ε = 1 ∨ ε = -1) :
    mirrorBasis ε * (-(matrix ε m).transpose) * (mirrorBasis ε).transpose =
      matrix (-ε) (-m) := by
  rcases hε with rfl | rfl <;>
    ext i j <;> fin_cases i <;> fin_cases j <;>
    simp [mirrorBasis, matrix, Matrix.mul_apply, Fin.sum_univ_two,
      Matrix.transpose_apply, Matrix.vecMul, dotProduct]

theorem trefoil_basis :
    normalBasis 1 * matrix 1 (-1) * (normalBasis 1).transpose =
      trefoilSeifertMatrix := by decide +kernel

def quarterTurn : Matrix (Fin 2) (Fin 2) ℤ := !![0, 1; -1, 0]

theorem quarterTurn_det : quarterTurn.det = 1 := by decide +kernel

theorem figure_eight_basis :
    quarterTurn * matrix 1 1 * quarterTurn.transpose =
      figureEightSeifertMatrix := by decide +kernel

/-- This is the classical matrix signature, independent of geometric realization. -/
theorem classical_signature (ε m : ℤ) (hε : ε = 1 ∨ ε = -1) :
    Matrix.signature (realMatrix ε m) = if ε * m < 0 then -2 * ε else 0 := by
  sorry

/-- Squared chord length to1 on the native Circle. -/
def chordSq (ω : Circle) : ℝ := 2 - 2 * (ω : ℂ).re

theorem hermitian_det (ε m : ℤ) (ω : Circle) :
    (tristramLevineForm (realMatrix ε m) (ω : ℂ)).det =
      -(chordSq ω : ℂ) * (1 + (ε * m : ℤ) * (chordSq ω : ℂ)) := by
  sorry

/-- Raw point values include the one-dimensional kernel at a nontrivial root. -/
theorem tristram_signature (ε m : ℤ) (hε : ε = 1 ∨ ε = -1) (ω : Circle) :
    tristramLevineSignature (realMatrix ε m) (ω : ℂ) =
      if 0 < 1 + (ε * m : ℤ) * chordSq ω then 0
      else if 1 + (ε * m : ℤ) * chordSq ω = 0 then -ε
      else -2 * ε := by
  sorry

end TauCetiRoadmap.GeometricTopology.WhiteheadSeifert
