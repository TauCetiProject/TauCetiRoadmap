import Mathlib

/-!
**This file is not the roadmap and is not exhaustive.** The README is definitive.

Scalar calibrations for stabilized linear gluing in F1.4. The bounded Sobolev
operators, their kernels/cokernels, right inverses, exact sequence and cylindrical
Fourier comparison are additional README targets, not defined by these formulas.
The `sorry` theorems are future proof targets.
-/
noncomputable section
open Filter
open scoped Topology
namespace TauCetiRoadmap.HeegaardFloer.LinearNeck

def coefficient (R s : ℝ) : ℝ :=
  1 - Real.tanh (s + R) + Real.tanh (s - R)

def fundamental (R s : ℝ) : ℝ :=
  Real.exp s * Real.cosh (s - R) / Real.cosh (s + R)

def pulse (s : ℝ) : ℝ := 1 / Real.cosh s

theorem fundamental_pos (R s : ℝ) : 0 < fundamental R s := by
  exact div_pos (mul_pos (Real.exp_pos _) (Real.cosh_pos _)) (Real.cosh_pos _)

theorem pulse_derivative (s : ℝ) :
    HasDerivAt pulse (-Real.tanh s * pulse s) s := by
  sorry

theorem fundamental_derivative (R s : ℝ) :
    HasDerivAt (fundamental R) (coefficient R s * fundamental R s) s := by
  sorry

theorem adjoint_derivative (R s : ℝ) :
    HasDerivAt (fun x => (fundamental R x)⁻¹)
      (-coefficient R s * (fundamental R s)⁻¹) s := by
  sorry

theorem fundamental_end_ratios (R : ℝ) :
    Tendsto (fun s => fundamental R s / Real.exp s) atTop (𝓝 (Real.exp (-2 * R))) ∧
    Tendsto (fun s => fundamental R s / Real.exp s) atBot (𝓝 (Real.exp (2 * R))) := by
  sorry

theorem coefficient_bound (R : ℝ) (hR : 0 ≤ R) (s : ℝ) :
    |coefficient R s| ≤ 1 := by
  sorry

theorem translated_limits (s : ℝ) :
    Tendsto (fun R => coefficient R (s - R)) atTop (𝓝 (-Real.tanh s)) ∧
    Tendsto (fun R => coefficient R (s + R)) atTop (𝓝 (Real.tanh s)) := by
  sorry

end TauCetiRoadmap.HeegaardFloer.LinearNeck
