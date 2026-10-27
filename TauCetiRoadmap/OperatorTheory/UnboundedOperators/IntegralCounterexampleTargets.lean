/-
Copyright (c) 2026.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Mathlib.Analysis.InnerProductSpace.LinearPMap
import Mathlib.MeasureTheory.Function.L2Space
import Mathlib.MeasureTheory.Integral.Bochner.Basic
import Mathlib.MeasureTheory.Measure.Lebesgue.Basic

/-!
**This file is not the roadmap and is not exhaustive.**
These are suggested forms only. The README is the definitive specification.
UO-E01's integral counterexample uses the native Lp and LinearPMap carriers;
`sorry` records future construction and theorem targets, not proofs.
-/

open MeasureTheory

namespace TauCetiRoadmap.UnboundedOperators.IntegralCounterexample

abbrev L2 : Type := Lp ℂ 2 (volume : Measure ℝ)

/-- Construct integration only on the integrable classes in L². -/
theorem exists_integralOperator :
    ∃ I : L2 →ₗ.[ℂ] ℂ,
      (∀ f : L2, f ∈ I.domain ↔ Integrable (f : ℝ → ℂ) volume) ∧
      (∀ f : I.domain, I f = ∫ x : ℝ, (f : L2) x) := by
  sorry

/-- The normalized interval indicators are genuine domain vectors. -/
theorem exists_interval_witness
    (I : L2 →ₗ.[ℂ] ℂ)
    (hdom : ∀ f : L2, f ∈ I.domain ↔ Integrable (f : ℝ → ℂ) volume)
    (hact : ∀ f : I.domain, I f = ∫ x : ℝ, (f : L2) x)
    (n : ℕ) (hn : 0 < n) :
    ∃ f : I.domain,
      (fun x : ℝ => (f : L2) x) =ᵐ[volume]
        (Set.Icc (0 : ℝ) (n : ℝ)).indicator (fun _ => (n : ℂ)⁻¹) ∧
      ‖(f : L2)‖ = (Real.sqrt (n : ℝ))⁻¹ ∧ I f = 1 := by
  sorry

/-- Density, the full closed graph relation, and the actual adjoint domain. -/
theorem integralOperator_counterexample
    (I : L2 →ₗ.[ℂ] ℂ)
    (hdom : ∀ f : L2, f ∈ I.domain ↔ Integrable (f : ℝ → ℂ) volume)
    (hact : ∀ f : I.domain, I f = ∫ x : ℝ, (f : L2) x) :
    Dense (I.domain : Set L2) ∧
      I.graph.topologicalClosure = ⊤ ∧
      I.adjoint.domain = ⊥ ∧ ¬I.IsClosable := by
  sorry

end TauCetiRoadmap.UnboundedOperators.IntegralCounterexample
