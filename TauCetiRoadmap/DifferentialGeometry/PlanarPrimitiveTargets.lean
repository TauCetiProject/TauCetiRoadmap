import Mathlib

/-!
# The radial primitive of a closed planar one-form

**This file is not the roadmap and is not exhaustive.** The README is definitive.
These suggested signatures give the coordinate specialization of Layer 5.4's
homotopy operator. The comparison with that operator remains part of the README target.
-/

namespace TauCetiRoadmap.DifferentialGeometry

open Complex Metric Set
open scoped ContDiff

variable {F : Type*} [NormedAddCommGroup F] [NormedSpace ℝ F] [CompleteSpace F]

/-- Integrate `P dx + Q dy` along the radial segment from `a` to `z`. -/
noncomputable def planarRadialPrimitive (P Q : ℂ → F) (a z : ℂ) : F :=
  (z - a).re • (∫ t : ℝ in (0)..1, P (a + t • (z - a))) +
    (z - a).im • (∫ t : ℝ in (0)..1, Q (a + t • (z - a)))

@[simp] theorem planarRadialPrimitive_center (P Q : ℂ → F) (a : ℂ) :
    planarRadialPrimitive P Q a a = 0 := by
  simp [planarRadialPrimitive]

/-- The radial primitive of the constant form `c dy`. -/
theorem planarRadialPrimitive_const_dy (c : F) (a z : ℂ) :
    planarRadialPrimitive (fun _ => 0) (fun _ => c) a z = (z - a).im • c := by
  simp [planarRadialPrimitive]

/-- Smoothness follows from integration over a compact parameter interval. -/
theorem planarRadialPrimitive_contDiffOn {P Q : ℂ → F} {a : ℂ} {r : ℝ}
    (hr : 0 < r) (hP : ContDiffOn ℝ ∞ P (ball a r))
    (hQ : ContDiffOn ℝ ∞ Q (ball a r)) :
    ContDiffOn ℝ ∞ (planarRadialPrimitive P Q a) (ball a r) := by
  sorry

/-- The equality of cross-partials is exactly closedness of `P dx + Q dy`. -/
theorem planarRadialPrimitive_hasFDerivAt {P Q : ℂ → F} {a : ℂ} {r : ℝ}
    (hr : 0 < r) (hP : ContDiffOn ℝ ∞ P (ball a r))
    (hQ : ContDiffOn ℝ ∞ Q (ball a r))
    (hclosed : ∀ z ∈ ball a r, fderiv ℝ P z I = fderiv ℝ Q z 1)
    {z : ℂ} (hz : z ∈ ball a r) :
    HasFDerivAt (planarRadialPrimitive P Q a)
      (reCLM.smulRight (P z) + imCLM.smulRight (Q z)) z := by
  sorry

/-- A primitive on the disk is fixed uniquely by its value at the center. -/
theorem eqOn_planarRadialPrimitive_of_normalized {P Q u : ℂ → F} {a : ℂ} {r : ℝ}
    (hr : 0 < r) (hP : ContDiffOn ℝ ∞ P (ball a r))
    (hQ : ContDiffOn ℝ ∞ Q (ball a r))
    (hclosed : ∀ z ∈ ball a r, fderiv ℝ P z I = fderiv ℝ Q z 1)
    (hu : ∀ z ∈ ball a r,
      HasFDerivAt u (reCLM.smulRight (P z) + imCLM.smulRight (Q z)) z)
    (hua : u a = 0) : EqOn u (planarRadialPrimitive P Q a) (ball a r) := by
  sorry

end TauCetiRoadmap.DifferentialGeometry
