/-
Copyright (c) 2026.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Mathlib

/-!
# Unbounded operators, integral counterexample: target signatures

The roadmap is README.md; this file is not the roadmap. It states, against the pinned
APIs, the UO-E01 counterexample of README §5.1: integration on the integrable classes of
`L²(ℝ)` is a densely defined partial operator with values in `ℂ` that is not closable,
whose graph closure is everything and whose Hilbert adjoint has domain `{0}`. The
normalized interval indicators that witness this are a README Check and are not restated
here.
-/

open MeasureTheory

namespace TauCetiRoadmap.UnboundedOperators.IntegralCounterexample

abbrev L2 : Type := Lp ℂ 2 (volume : Measure ℝ)

/-- Integration exists as a partial operator whose domain is exactly the integrable
classes and whose action is the Bochner integral there. -/
theorem exists_integralOperator :
    ∃ I : L2 →ₗ.[ℂ] ℂ,
      (∀ f : L2, f ∈ I.domain ↔ Integrable (f : ℝ → ℂ) volume) ∧
      (∀ f : I.domain, I f = ∫ x : ℝ, (f : L2) x) := by
  sorry

/-- Density of the domain, the full graph closure, the zero adjoint domain and
non-closability of any such integration operator (Jones, Exercises 12.1.11(ii), 12.1.15). -/
theorem integralOperator_counterexample
    (I : L2 →ₗ.[ℂ] ℂ)
    (hdom : ∀ f : L2, f ∈ I.domain ↔ Integrable (f : ℝ → ℂ) volume)
    (hact : ∀ f : I.domain, I f = ∫ x : ℝ, (f : L2) x) :
    Dense (I.domain : Set L2) ∧
      I.graph.topologicalClosure = ⊤ ∧
      I.adjoint.domain = ⊥ ∧ ¬I.IsClosable := by
  sorry

end TauCetiRoadmap.UnboundedOperators.IntegralCounterexample
