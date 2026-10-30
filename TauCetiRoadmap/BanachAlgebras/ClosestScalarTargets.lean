import Mathlib

/-!
Selected targets for README.md, the definitive specification. This file is
not exhaustive. The three theorem admissions are future proofs. The example
uses the native finite coordinate space and its supremum norm; `residual`
explicitly rescales that norm by two. `attemptedNorm` is a real-valued function,
not a norm instance.
-/

noncomputable section

namespace TauCetiRoadmap.BanachAlgebras.ClosestScalar

def residual (z : Fin 3 → ℂ) (c : ℂ) : ℝ :=
  2 * ‖z - (fun _ => c)‖

/-- Properness gives existence; the parallelogram identity in the scalar plane
makes the smallest enclosing disk center unique, for every finite tuple. -/
theorem existsUnique_nearestScalar (z : Fin 3 → ℂ) :
    ∃! c : ℂ, ∀ μ : ℂ, residual z c ≤ residual z μ := by
  sorry

def nearestScalar (z : Fin 3 → ℂ) : ℂ :=
  Classical.choose (existsUnique_nearestScalar z).exists

def attemptedNorm (z : Fin 3 → ℂ) : ℝ :=
  residual z (nearestScalar z) + ‖nearestScalar z‖

def witnessA : Fin 3 → ℂ := ![-1, 1, Complex.I]

def witnessB : Fin 3 → ℂ := ![1, 1, Complex.I]

/-- The lower bounds come from coordinate pairs (-1,1), (1,i) and (2,2i). -/
theorem nearestScalar_witnesses :
    nearestScalar witnessA = 0 ∧
    nearestScalar witnessB = (1 + Complex.I) / 2 ∧
    nearestScalar (witnessA + witnessB) = 1 + Complex.I := by
  sorry

/-- The closest-scalar prescription fails the triangle inequality, even though
its minimizers are unique and the original algebra unit has norm two. -/
theorem attemptedNorm_triangle_failure :
    attemptedNorm witnessA = 2 ∧
    attemptedNorm witnessB = 3 * Real.sqrt 2 / 2 ∧
    attemptedNorm (witnessA + witnessB) = 3 * Real.sqrt 2 ∧
    attemptedNorm witnessA + attemptedNorm witnessB <
      attemptedNorm (witnessA + witnessB) := by
  sorry

end TauCetiRoadmap.BanachAlgebras.ClosestScalar
