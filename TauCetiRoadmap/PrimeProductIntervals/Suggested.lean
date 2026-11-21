module

public import Mathlib

/-!
# Prime products in short intervals

The README specifies the roadmap. This file states two headline theorems.
`bounds_of_two_scales` uses two moment inequalities at a fixed real x.
`bounds_of_global_moment` starts with the global Chirre–Hagen inequality and
applies to every real x ≥ 9.6 · 10³⁷. The implication from RH to that
inequality is Theorem 3 of Chirre and Hagen and is outside the roadmap.
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

/-- On the exceptional set, the squared error is at least (d a / 2)². -/
theorem exceptional_cost {a b Y d : ℝ} (ha : 1 ≤ a) (hab : a ≤ b) (hb : b ≤ Y) (hd : 0 ≤ d) :
    (d * a / 2) ^ 2 * volume.real (exceptional a b d) ≤ thetaMoment Y d := by
  sorry

/-- The reciprocal map on any measurable subset of [N/2,∞) expands length by at most four. -/
theorem reciprocal_volume {N : ℝ} (hN : 0 < N) {E : Set ℝ} (hm : MeasurableSet E)
    (hE : E ⊆ Ici (N / 2)) :
    volume ((fun v : ℝ => N ^ 2 / v) '' E) ≤ 4 * volume E := by
  sorry

/-- Parameter values at which p and q both occupy their moving factor windows. -/
noncomputable def pairStarts (x a b u p q : ℝ) : Set ℝ :=
  Icc a b ∩ Ico (p / u) p ∩ Ioc (x / q) (u * x / q)

/-- Endpoint check for the two moving intervals, after clearing positive denominators. -/
theorem mem_pairStarts {x a b u p q t : ℝ} (hu : 0 < u) (hq : 0 < q) (ht : 0 < t) :
    t ∈ pairStarts x a b u p q ↔
      t ∈ Icc a b ∧ t < p ∧ p ≤ u * t ∧ x / t < q ∧ q ≤ u * x / t := by
  change ((t ∈ Icc a b ∧ p / u ≤ t ∧ t < p) ∧ x / q < t ∧ t ≤ u * x / q) ↔ _
  simp only [div_le_iff₀ hu, div_lt_iff₀ hq, le_div_iff₀ hq, div_lt_iff₀ ht,
    le_div_iff₀ ht, mul_comm q t, mul_comm u t]
  tauto

/-- A fixed pair occupies at most d b of the band of starts, including when the support is empty. -/
theorem volume_pairStarts_le (x a b d p q : ℝ) (hd : 0 < d) (hb : 0 < b) :
    volume (pairStarts x a b (1 + d) p q) ≤ ENNReal.ofReal (d * b) := by
  sorry

/-- Integers n in the open window whose factors lie on opposite sides of sqrt x. -/
noncomputable def balancedProducts (C x : ℝ) : Finset ℕ := by
  classical
  exact (Finset.Icc ⌈x⌉₊ ⌊x + C * Real.sqrt x * (Real.log x) ^ 2⌋₊).filter
    (fun n => x < (n : ℝ) ∧ (n : ℝ) < x + C * Real.sqrt x * (Real.log x) ^ 2 ∧
      ∃ p q : ℕ, p.Prime ∧ q.Prime ∧ n = p * q ∧ Real.sqrt x / 2 < (q : ℝ) ∧
        (q : ℝ) < Real.sqrt x ∧ Real.sqrt x < (p : ℝ) ∧ (p : ℝ) < 3 * Real.sqrt x)

/-- At a fixed x, the two local moment bounds imply both the count and the weight bound. -/
theorem bounds_of_two_scales (x : ℝ) (hx : 96 * 10^36 ≤ x)
    (h : let N := Real.sqrt x
         let d := 512 * (Real.log N) ^ 2 / N
         ∀ Y ∈ ({2 * N, 2 * N / 3} : Set ℝ),
           thetaMoment Y d ≤ 3 * d * Y ^ 2 * (Real.log N) ^ 2) :
    (14 / 3 : ℝ) * Real.sqrt x ≤ ((balancedProducts 384 x).card : ℝ) ∧
      (14 / 9 : ℝ) ≤ ∑ n ∈ balancedProducts 384 x, (n.minFac : ℝ) / n := by
  sorry

/-- The global relative theta estimate implies both bounds at every real x ≥ 9.6 · 10³⁷. -/
theorem bounds_of_global_moment
    (h : ∀ Y d : ℝ, 10 ^ 13 ≤ Y → 0 < d → d ≤ 1 / 10 ^ 13 →
      thetaMoment Y d ≤ 2.5571 * d * Y ^ 2 * (Real.log (2.0001 / d)) ^ 2)
    (x : ℝ) (hx : 96 * 10 ^ 36 ≤ x) :
    (14 / 3 : ℝ) * Real.sqrt x ≤ ((balancedProducts 384 x).card : ℝ) ∧
      (14 / 9 : ℝ) ≤ ∑ n ∈ balancedProducts 384 x, (n.minFac : ℝ) / n := by
  sorry

end TauCetiRoadmap.PrimeProductIntervals
