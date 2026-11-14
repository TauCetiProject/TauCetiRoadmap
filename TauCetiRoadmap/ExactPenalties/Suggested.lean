/-
Copyright (c) 2026 David E. Bernal Neira. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: David E. Bernal Neira
-/
import Mathlib

/-!
# Exact penalties with a unit violation gap: target signatures

The roadmap is `README.md`; this file is not the roadmap. These are suggested
forms, not an exhaustive checklist. It states the roadmap's headline theorem
against the pinned Mathlib, with `sorry`. Every headline theorem is statable
at the pins. This signature prototype does not provide a proof.
-/

namespace TauCetiRoadmap.ExactPenalties

/-- Exact minimizer correspondence, with both membership and the feasible-instance
conjunction retained. This statement does not assert existence of a minimizer. -/
theorem isMinOn_penalized_iff {α : Type*}
    (D : Set α) (P : α → Prop) (f w : α → ℝ) (B ρ : ℝ)
    (hB : 0 ≤ B) (hρ : B < ρ)
    (hzero : ∀ y ∈ D, P y → w y = 0)
    (hgap : ∀ x ∈ D, ¬ P x → 1 ≤ w x)
    (hcost : ∀ x ∈ D, ∀ y ∈ D, f x - f y ≤ B) (x : α) :
    (x ∈ D ∧ IsMinOn (fun z => f z + ρ * w z) D x ∧ ∃ y ∈ D, P y) ↔
      (x ∈ {y | y ∈ D ∧ P y} ∧ IsMinOn f {y | y ∈ D ∧ P y} x) := by
  sorry

end TauCetiRoadmap.ExactPenalties
