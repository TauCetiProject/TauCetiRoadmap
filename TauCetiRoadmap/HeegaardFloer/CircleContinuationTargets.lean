import Mathlib.Data.Matrix.Mul
import Mathlib.LinearAlgebra.Matrix.Notation

/-!
# Circle continuation counterexample calibration

This file is not the roadmap and is not exhaustive. `README.md`, M.5, is
definitive. Both C₁ and C₀ have the displayed ordered ℤ² bases. The matrices
calibrate chain maps and their homotopy; they do not construct continuation
trajectories, time-window estimates or their signed counts.
-/

namespace TauCetiRoadmap.HeegaardFloer.CircleContinuation

def swap : Matrix (Fin 2) (Fin 2) ℤ := !![0, 1; 1, 0]

def boundary : Matrix (Fin 2) (Fin 2) ℤ := !![1, -1; -1, 1]

/-- The permutation differs from identity, but the degree-one map −I is
a chain homotopy. D is the sole differential C₁ → C₀, not an endomorphism
whose square is required to vanish. -/
theorem continuation_calibration :
    boundary = 1 - swap ∧ swap * swap = 1 ∧ swap ≠ 1 ∧
      boundary * swap = swap * boundary ∧
      boundary * (-1) = swap - 1 ∧ (-1) * boundary = swap - 1 := by
  decide

end TauCetiRoadmap.HeegaardFloer.CircleContinuation
