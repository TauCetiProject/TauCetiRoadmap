module

public import Mathlib.NumberTheory.Chebyshev
public import Mathlib.MeasureTheory.Integral.IntervalIntegral.Basic
public import Mathlib.MeasureTheory.Function.JacobianOneDim

/-!
# Prime products in short intervals

The definitive specification is in `README.md`. These signatures suggest interfaces
for selected milestones; proving them alone does not complete the roadmap.
-/

@[expose] public section

namespace TauCetiRoadmap.PrimeProductIntervals
open Set MeasureTheory

/-- Relative mean square of the error in the theta increment; used for Y ≥ 1. -/
noncomputable def thetaMoment (Y d : ℝ) : ℝ :=
  ∫ v in (1 : ℝ)..Y, (Chebyshev.theta ((1 + d) * v) - Chebyshev.theta v - d * v) ^ 2

/-- Starts with a theta increment below half the predicted increment. -/
def exceptional (a b d : ℝ) : Set ℝ :=
  {v ∈ Ioc a b | Chebyshev.theta ((1 + d) * v) - Chebyshev.theta v < d * v / 2}

theorem exceptional_cost {a b Y d : ℝ} (ha : 1 ≤ a) (hab : a ≤ b) (hb : b ≤ Y) (hd : 0 ≤ d) :
    (d * a / 2) ^ 2 * volume.real (exceptional a b d) ≤ thetaMoment Y d := by
  sorry

/-- The reciprocal map on any measurable subset of [N/2,∞) expands length by at most four. -/
theorem reciprocal_volume {N : ℝ} (hN : 0 < N) {E : Set ℝ} (hm : MeasurableSet E)
    (hE : E ⊆ Ici (N / 2)) :
    volume ((fun v : ℝ => N ^ 2 / v) '' E) ≤ 4 * volume E := by
  sorry

/-- Parameter values at which p and q both occupy their moving factor windows. -/
def pairStarts (x a b u p q : ℝ) : Set ℝ :=
  Icc a b ∩ Ico (p / u) p ∩ Ioc (x / q) (u * x / q)

theorem mem_pairStarts {x a b u p q t : ℝ} (hu : 0 < u) (hq : 0 < q) (ht : 0 < t) :
    t ∈ pairStarts x a b u p q ↔
      t ∈ Icc a b ∧ t < p ∧ p ≤ u * t ∧ x / t < q ∧ q ≤ u * x / t := by
  sorry

/-- Integers n in the open window whose factors lie on opposite sides of sqrt x. -/
noncomputable def balancedProducts (C x : ℝ) : Finset ℕ := by
  classical
  exact (Finset.Icc ⌈x⌉₊ ⌊x + C * Real.sqrt x * (Real.log x) ^ 2⌋₊).filter
    (fun n => x < (n : ℝ) ∧ (n : ℝ) < x + C * Real.sqrt x * (Real.log x) ^ 2 ∧
      ∃ p q : ℕ, p.Prime ∧ q.Prime ∧ n = p * q ∧ Real.sqrt x / 2 < (q : ℝ) ∧
        (q : ℝ) < Real.sqrt x ∧ Real.sqrt x < (p : ℝ) ∧ (p : ℝ) < 3 * Real.sqrt x)

/-- The two scales used in the final application. N and x are real. -/
theorem bounds_of_two_scales (x : ℝ) (hx : 96 * 10^36 ≤ x)
    (h : let N := Real.sqrt x
         let d := 512 * (Real.log N) ^ 2 / N
         ∀ Y ∈ ({2 * N, 2 * N / 3} : Set ℝ),
           thetaMoment Y d ≤ 3 * d * Y ^ 2 * (Real.log N) ^ 2) :
    (14 / 3 : ℝ) * Real.sqrt x ≤ ((balancedProducts 384 x).card : ℝ) ∧
      (14 / 9 : ℝ) ≤ ∑ n ∈ balancedProducts 384 x, (n.minFac : ℝ) / n := by
  sorry

end TauCetiRoadmap.PrimeProductIntervals
