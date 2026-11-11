/-
Copyright (c) 2026 David E. Bernal Neira. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: David E. Bernal Neira
-/
module

public import Mathlib.Basic.Real.Basic
public import Mathlib.Order.Filter.Extr
public import Mathlib.Tactic.Linarith

/-!
# Exact penalties with a unit violation gap: suggested interfaces

The roadmap is `README.md`; this file is not the roadmap. These are suggested
forms, not an exhaustive checklist. The three real-valued unit-gap targets are
proved here with explicit domain membership and feasible-instance conditions.
The proof follows the feasible/infeasible comparison argument in the source.
-/

public section

namespace TauCetiRoadmap.ExactPenalties

/-- A feasible point has strictly smaller penalized cost than every infeasible
point when the penalty weight exceeds a bound on objective differences. -/
theorem penalized_lt_of_feasible_of_not_feasible {α : Type*}
    (D : Set α) (P : α → Prop) (f w : α → ℝ) (B ρ : ℝ)
    (hB : 0 ≤ B) (hρ : B < ρ)
    (hzero : ∀ y ∈ D, P y → w y = 0)
    (hgap : ∀ x ∈ D, ¬ P x → 1 ≤ w x)
    (hcost : ∀ x ∈ D, ∀ y ∈ D, f x - f y ≤ B)
    (x y : α) (hx : x ∈ D) (hbad : ¬ P x) (hy : y ∈ D) (hgood : P y) :
    f y + ρ * w y < f x + ρ * w x := by
  have hp : 0 < ρ := hB.trans_lt hρ
  have hg : ρ ≤ ρ * w x := by
    simpa only [mul_one] using mul_le_mul_of_nonneg_left (hgap x hx hbad) hp.le
  have hc := hcost y hy x hx
  rw [hzero y hy hgood]
  simp only [mul_zero, add_zero]
  linarith

/-- A penalized minimizer in the domain is feasible if a feasible point exists.
Domain membership is separate from Mathlib's `IsMinOn`. -/
theorem feasible_of_isMinOn {α : Type*}
    (D : Set α) (P : α → Prop) (f w : α → ℝ) (B ρ : ℝ)
    (hB : 0 ≤ B) (hρ : B < ρ)
    (hzero : ∀ y ∈ D, P y → w y = 0)
    (hgap : ∀ x ∈ D, ¬ P x → 1 ≤ w x)
    (hcost : ∀ x ∈ D, ∀ y ∈ D, f x - f y ≤ B)
    (hfeas : ∃ y ∈ D, P y) (x : α) (hx : x ∈ D)
    (hm : IsMinOn (fun z => f z + ρ * w z) D x) : P x := by
  obtain ⟨y, hy, hgood⟩ := hfeas
  by_contra hbad
  have hlt := penalized_lt_of_feasible_of_not_feasible D P f w B ρ
    hB hρ hzero hgap hcost x y hx hbad hy hgood
  exact (not_lt_of_ge (isMinOn_iff.mp hm y hy)) hlt

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
  constructor
  · rintro ⟨hx, hm, hfeas⟩
    have hpx := feasible_of_isMinOn D P f w B ρ
      hB hρ hzero hgap hcost hfeas x hx hm
    refine ⟨⟨hx, hpx⟩, isMinOn_iff.mpr ?_⟩
    intro y hy
    have hc := isMinOn_iff.mp hm y hy.1
    simpa only [hzero x hx hpx, hzero y hy.1 hy.2, mul_zero, add_zero] using hc
  · rintro ⟨⟨hx, hpx⟩, hm⟩
    refine ⟨hx, isMinOn_iff.mpr ?_, x, hx, hpx⟩
    intro y hy
    by_cases hpy : P y
    · simpa only [hzero x hx hpx, hzero y hy hpy, mul_zero, add_zero] using
        isMinOn_iff.mp hm y ⟨hy, hpy⟩
    · exact (penalized_lt_of_feasible_of_not_feasible D P f w B ρ
        hB hρ hzero hgap hcost y x hy hpy hx hpx).le

end TauCetiRoadmap.ExactPenalties
