/-
Copyright (c) 2026 Kim Morrison. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Mathlib.Analysis.Normed.Group.Constructions
import Mathlib.Analysis.Normed.Group.Real
import Mathlib.Analysis.Normed.Module.Basic
import Mathlib.Topology.Algebra.Module.ContinuousLinearMap.PiProd
import Mathlib.Algebra.Group.Idempotent

/-!
**This file is not the roadmap and is not exhaustive.** These are suggested
forms for QF1.S.QuestionFullnessExample. The README is definitive.
-/

noncomputable section
namespace QuantumFoundations.SelectedStateExamples

/-- The ordinary probability functional on two points; positivity requires 0 ≤ w ≤ 1. -/
def state (w : ℝ) : (Fin 2 → ℝ) →L[ℝ] ℝ :=
  w • (ContinuousLinearMap.proj (0 : Fin 2) : (Fin 2 → ℝ) →L[ℝ] ℝ) +
    (1 - w) • (ContinuousLinearMap.proj (1 : Fin 2) : (Fin 2 → ℝ) →L[ℝ] ℝ)

/-- A countably convex proper state family can recover the entire question order. -/
theorem full_on_questions (p q : Fin 2 → ℝ)
    (hp : IsIdempotentElem p) (hq : IsIdempotentElem q)
    (h : ∀ w ∈ Set.Icc (1 / 4 : ℝ) (3 / 4), state w p ≤ state w q) :
    p ≤ q := by
  sorry

/-- Positive selected evaluations need not recover positivity of every observable. -/
theorem not_order_determining :
    let x : Fin 2 → ℝ := fun i => if i = 0 then -1 else 3
    (∀ w ∈ Set.Icc (1 / 4 : ℝ) (3 / 4), 0 ≤ state w x) ∧ ¬ (0 ≤ x) := by
  sorry

/-- The selected expectation norm is not the ambient norm and violates its square law. -/
theorem norm_and_square_gap :
    let x : Fin 2 → ℝ := fun i => if i = 0 then 1 else -1
    ‖x‖ = 1 ∧
      (∀ w ∈ Set.Icc (1 / 4 : ℝ) (3 / 4), |state w x| ≤ 1 / 2) ∧
      |state (1 / 4) x| = 1 / 2 ∧
      (∀ w : ℝ, state w (x * x) = 1) := by
  sorry

end QuantumFoundations.SelectedStateExamples
