import TauCeti.KnotTheory.SeifertMatrix.SEquivalence
import TauCeti.LinearAlgebra.Matrix.Signature
import Mathlib

/-!
**This file is not the roadmap and is not exhaustive.** The README is definitive.
The literal problem67 matrix does not itself certify the pictured marked surface.
The geometric positive-push-off and basis comparison remains a README target.
-/

namespace TauCetiRoadmap.GeometricTopology.FourBandSeifert

open LaurentPolynomial

def matrix : Matrix (Fin 4) (Fin 4) ℤ :=
  !![2,1,0,0; 0,-5,1,0; 0,1,2,-1; 0,0,-2,-2]

def integralMatrix : TauCeti.KnotTheory.IntegralSquareMatrix := ⟨4, matrix⟩

theorem matrix_det : matrix.det = 64 := by decide +kernel

theorem symmetric_det : (matrix + matrix.transpose).det = 1089 := by decide +kernel

/-- The literal form in the native normalized Laurent Alexander API. -/
theorem alexander_eq :
    TauCeti.KnotTheory.alexander integralMatrix.2 =
      64 * T 2 - 272 * T 1 + 417 - 272 * T (-1) + 64 * T (-2) := by
  sorry

/-- A rational congruence certificate; this is not an integral basis change. -/
def congruenceQ : Matrix (Fin 4) (Fin 4) ℚ :=
  !![1,0,0,0; -1/4,1,0,0; -2/41,8/41,1,0; -1/30,2/15,41/60,1]

def pivotsQ : Fin 4 → ℚ := ![4, -41/4, 180/41, -121/20]

theorem congruenceQ_det : congruenceQ.det = 1 := by decide +kernel

theorem congruenceQ_eq :
    congruenceQ * ((matrix.map (Int.castRingHom ℚ)) +
      (matrix.map (Int.castRingHom ℚ)).transpose) * congruenceQ.transpose =
      Matrix.diagonal pivotsQ := by decide +kernel

def realMatrix : Matrix (Fin 4) (Fin 4) ℝ := matrix.map (Int.castRingHom ℝ)

noncomputable def congruenceR : Matrix (Fin 4) (Fin 4) ℝ :=
  congruenceQ.map (Rat.castHom ℝ)

theorem congruenceR_det : congruenceR.det = 1 := by
  change ((Rat.castHom ℝ).mapMatrix congruenceQ).det = 1
  rw [← RingHom.map_det, congruenceQ_det]
  simp

theorem congruenceR_eq :
    congruenceR * (realMatrix + realMatrix.transpose) * congruenceR.transpose =
      Matrix.diagonal (![4, -41/4, 180/41, -121/20] : Fin 4 → ℝ) := by
  ext i j
  fin_cases i <;> fin_cases j <;>
    norm_num [congruenceR, congruenceQ, realMatrix, matrix,
      Matrix.mul_apply, Fin.sum_univ_succ, Matrix.diagonal]

/-- Signature in the native quadratic-form API, with no geometric assertion. -/
theorem real_signature : Matrix.signature realMatrix = 0 := by
  rw [← Matrix.signature_add_transpose realMatrix,
    Matrix.signature_eq_of_congr_diagonal
      (show IsUnit congruenceR.det from congruenceR_det ▸ isUnit_one) congruenceR_eq]
  norm_num [Fin.sum_univ_succ]

end TauCetiRoadmap.GeometricTopology.FourBandSeifert
