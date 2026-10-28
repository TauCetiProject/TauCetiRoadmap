import Mathlib.LinearAlgebra.Matrix.Determinant.Basic
import Mathlib.LinearAlgebra.Matrix.Notation
import Mathlib.LinearAlgebra.QuadraticForm.Basic
import Mathlib.Basic.Real.Basic

/-!
# Normal monodromy for a nonorientable Morse–Bott trajectory space

This file is not the roadmap and is not exhaustive. `README.md`, M.6, is
definitive. The matrices calibrate its negative-plane and full-normal
orientation signs. They do not construct the mapping torus or trajectory space.
-/

namespace TauCetiRoadmap.HeegaardFloer.NonorientableBottModuli

/-- Reflection on the negative sphere tangent plane. -/
def negativeMonodromy : Matrix (Fin 2) (Fin 2) ℝ := !![1, 0; 0, -1]

/-- The remaining positive direction reverses too, preserving the full orientation. -/
def normalMonodromy : Matrix (Fin 3) (Fin 3) ℝ :=
  !![1, 0, 0; 0, -1, 0; 0, 0, -1]

/-- The normal Hessian form; for ε > 0 its first two directions are negative
and its last direction is positive. -/
def normalForm (ε : ℝ) : QuadraticForm ℝ (Fin 3 → ℝ) :=
  QuadraticMap.weightedSumSquares ℝ ![-1, -1, ε]

theorem normalMonodromy_calibration (ε : ℝ) :
    negativeMonodromy.det = -1 ∧ normalMonodromy.det = 1 ∧
      normalMonodromy * normalMonodromy = 1 ∧
      ∀ v, normalForm ε (normalMonodromy.mulVec v) = normalForm ε v := by
  sorry

end TauCetiRoadmap.HeegaardFloer.NonorientableBottModuli
