/-
Suggested Lean interfaces for the real-algebraic certificate adapter.
The README is definitive; these suggestions are not an exhaustive checklist.
-/
module

public import Mathlib.FieldTheory.AlgebraicClosure
public import Mathlib.Basic.Real.Basic

public section

namespace GT7RealAlgebraic

open Polynomial

/-- A nonzero rational polynomial makes its real root an element of the native field. -/
theorem root_mem_native {p : ℚ[X]} (hp : p ≠ 0) {x : ℝ}
    (hx : aeval x p = 0) : x ∈ algebraicClosure ℚ ℝ := by
  exact mem_algebraicClosure_iff.mpr ⟨p, hp, hx⟩

/-- Interpret sound half-open root isolation in the existing intermediate field. -/
noncomputable def realize {p : ℚ[X]} (hp : p ≠ 0) {a b : ℚ}
    (h : ∃! x : ℝ, aeval x p = 0 ∧ (a : ℝ) < x ∧ x ≤ (b : ℝ)) :
    algebraicClosure ℚ ℝ :=
  ⟨Classical.choose h.exists, root_mem_native hp (Classical.choose_spec h.exists).1⟩

theorem realize_spec {p : ℚ[X]} (hp : p ≠ 0) {a b : ℚ}
    (h : ∃! x : ℝ, aeval x p = 0 ∧ (a : ℝ) < x ∧ x ≤ (b : ℝ)) :
    aeval (realize hp h : ℝ) p = 0 ∧
      (a : ℝ) < (realize hp h : ℝ) ∧ (realize hp h : ℝ) ≤ (b : ℝ) :=
  Classical.choose_spec h.exists

/-- Any native element satisfying the same isolated-root condition is the interpretation. -/
theorem eq_realize {p : ℚ[X]} (hp : p ≠ 0) {a b : ℚ}
    (h : ∃! x : ℝ, aeval x p = 0 ∧ (a : ℝ) < x ∧ x ≤ (b : ℝ))
    (x : algebraicClosure ℚ ℝ)
    (hx : aeval (x : ℝ) p = 0 ∧ (a : ℝ) < (x : ℝ) ∧ (x : ℝ) ≤ (b : ℝ)) :
    x = realize hp h := by
  apply Subtype.ext
  exact h.unique hx (realize_spec hp h)

/-- Refining an isolating interval does not change the represented native element. -/
theorem realize_refinement {p : ℚ[X]} (hp : p ≠ 0) {a b a' b' : ℚ}
    (h : ∃! x : ℝ, aeval x p = 0 ∧ (a : ℝ) < x ∧ x ≤ (b : ℝ))
    (h' : ∃! x : ℝ, aeval x p = 0 ∧ (a' : ℝ) < x ∧ x ≤ (b' : ℝ))
    (ha : (a : ℝ) ≤ (a' : ℝ)) (hb : (b' : ℝ) ≤ (b : ℝ)) :
    realize hp h' = realize hp h := by
  obtain ⟨hx, hlo, hhi⟩ := realize_spec hp h'
  exact eq_realize hp h (realize hp h') ⟨hx, ha.trans_lt hlo, hhi.trans hb⟩

end GT7RealAlgebraic

#print axioms GT7RealAlgebraic.root_mem_native
#print axioms GT7RealAlgebraic.realize
#print axioms GT7RealAlgebraic.realize_spec
#print axioms GT7RealAlgebraic.eq_realize
#print axioms GT7RealAlgebraic.realize_refinement
