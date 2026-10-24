import TauCeti.Analysis.Complex.Conformal.SchwarzPick.Derivative
import Mathlib.Tactic

/-!
# Disk interpolation examples

**This file is not the roadmap and is not exhaustive.** The README is definitive.
These examples specialize the native infinitesimal Schwarz–Pick theorem.
-/

namespace TauCetiRoadmap.ConformalMapping

open Complex Metric Set

/-- A prescribed value at `1/2` bounds the derivative there by `7/12`. -/
theorem norm_deriv_half_le_seven_twelfths {f : ℂ → ℂ}
    (hf : DifferentiableOn ℂ f (ball 0 1))
    (hmaps : MapsTo f (ball 0 1) (ball 0 1))
    (hvalue : f (1 / 2) = 3 / 4) : ‖deriv f (1 / 2)‖ ≤ (7 : ℝ) / 12 := by
  have hhalf : ‖(1 / 2 : ℂ)‖ = (1 : ℝ) / 2 := by norm_num
  have hthree : ‖(3 / 4 : ℂ)‖ = (3 : ℝ) / 4 := by norm_num
  have hz : (1 / 2 : ℂ) ∈ ball 0 1 := by
    rw [mem_ball_zero_iff, hhalf]
    norm_num
  have h := TauCeti.norm_deriv_div_one_sub_norm_sq_le hf hmaps hz
  rw [hvalue, hhalf, hthree] at h
  norm_num at h
  linarith

/-- The value `3/4` and derivative `2/3` at `1/2` cannot occur together. -/
theorem not_disk_interpolation_half {f : ℂ → ℂ}
    (hf : DifferentiableOn ℂ f (ball 0 1))
    (hmaps : MapsTo f (ball 0 1) (ball 0 1))
    (hvalue : f (1 / 2) = 3 / 4) : deriv f (1 / 2) ≠ 2 / 3 := by
  intro hderiv
  have h := norm_deriv_half_le_seven_twelfths hf hmaps hvalue
  rw [hderiv] at h
  norm_num at h

end TauCetiRoadmap.ConformalMapping
