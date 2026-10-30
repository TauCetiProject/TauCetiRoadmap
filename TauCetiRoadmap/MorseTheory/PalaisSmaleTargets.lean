import TauCeti.Analysis.Calculus.Morse.Basic
import Mathlib.Analysis.Calculus.Gradient.Basic
import Mathlib.Analysis.ODE.Basic
import Mathlib.Topology.Order.Bornology

/-!
Suggested forms, not an exhaustive checklist. The README is definitive.
These signatures specialize M6.1 to a real finite-dimensional inner-product
space. The manifold and variable-metric statements remain required targets.
-/

noncomputable section

namespace TauCetiRoadmap.MorseTheory.PalaisSmale

open Filter Set
open scoped Topology ContDiff

variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
  [FiniteDimensional ℝ E] [CompleteSpace E]

/-- The concrete sequential condition, with the chosen inner product. -/
def Satisfies (f : E → ℝ) : Prop :=
  ∀ u : ℕ → E, (∃ C : ℝ, ∀ n, |f (u n)| ≤ C) →
    Tendsto (fun n => ‖gradient f (u n)‖) atTop (𝓝 0) →
    ∃ p : E, ∃ φ : ℕ → ℕ, StrictMono φ ∧ Tendsto (u ∘ φ) atTop (𝓝 p)

/-- Properness supplies sequential compactness of every bounded value band. -/
theorem of_isProperMap (f : E → ℝ) (hf : IsProperMap f) : Satisfies f := by
  sorry

/-- Nondegeneracy upgrades compactness of the critical band to finiteness. -/
theorem finite_criticalValueBand (f : E → ℝ) (hsm : ContDiff ℝ ∞ f)
    (hm : TauCeti.HasNondegenerateCriticalPointsOn f Set.univ)
    (hps : Satisfies f) (a b : ℝ) :
    {x : E | a ≤ f x ∧ f x ≤ b ∧ fderiv ℝ f x = 0}.Finite := by
  sorry

/-- No compactness assumption on the band itself is added. -/
theorem exists_gradient_lowerBound (f : E → ℝ) (hsm : ContDiff ℝ ∞ f)
    (hps : Satisfies f) (a b : ℝ)
    (hcrit : ∀ x : E, a ≤ f x → f x ≤ b → gradient f x ≠ 0) :
    ∃ η : ℝ, 0 < η ∧ ∀ x : E, a ≤ f x → f x ≤ b → η ≤ ‖gradient f x‖ := by
  sorry

/-- Global forward existence and full convergence, without compact trapping. -/
theorem exists_forwardTrajectory_converges (f : E → ℝ)
    (hsm : ContDiff ℝ ∞ f)
    (hm : TauCeti.HasNondegenerateCriticalPointsOn f Set.univ)
    (hps : Satisfies f) (hlower : BddBelow (Set.range f)) (x : E) :
    ∃ γ : ℝ → E, γ 0 = x ∧
      IsIntegralCurveOn γ (fun _ y => -gradient f y) (Set.Ici 0) ∧
      ∃ p : E, gradient f p = 0 ∧ Tendsto γ atTop (𝓝 p) := by
  sorry

end TauCetiRoadmap.MorseTheory.PalaisSmale
