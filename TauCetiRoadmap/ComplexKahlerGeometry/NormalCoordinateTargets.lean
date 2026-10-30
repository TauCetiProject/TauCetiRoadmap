import Mathlib.Analysis.Complex.Basic
import Mathlib.Analysis.Calculus.FDeriv.Analytic
import Mathlib.Analysis.Calculus.ContDiff.Operations
import Mathlib.LinearAlgebra.Matrix.Notation

/-!
Suggested forms are aids, not the specification; the README is definitive.
This finite-dimensional polynomial fixes K6.0's coordinate direction, sign
and factor. The geometric chart and smooth unitary-coframe constructions
remain targets in the README.
-/
noncomputable section
open scoped BigOperators
namespace TauCetiRoadmap.ComplexKahlerGeometry.NormalCoordinates

/-- New coordinates w mapped to old coordinates z. -/
def correction {n : ℕ} (Γ : Fin n → Fin n → Fin n → ℂ)
    (w : Fin n → ℂ) : Fin n → ℂ :=
  fun i => w i - (1 / 2 : ℂ) * ∑ j, ∑ k, Γ i j k * w j * w k

/-- The quadratic correction has identity differential and second differential -Γ. -/
theorem correction_twoJet {n : ℕ} (Γ : Fin n → Fin n → Fin n → ℂ)
    (hΓ : ∀ i j k, Γ i j k = Γ i k j) :
    AnalyticAt ℂ (correction Γ) 0 ∧
    HasFDerivAt (correction Γ) (ContinuousLinearMap.id ℂ (Fin n → ℂ)) 0 ∧
    ∀ u v : Fin n → ℂ,
      iteratedFDeriv ℂ 2 (correction Γ) 0 ![u, v] =
        fun i => -(∑ j, ∑ k, Γ i j k * u j * v k) := by
  sorry

end TauCetiRoadmap.ComplexKahlerGeometry.NormalCoordinates
