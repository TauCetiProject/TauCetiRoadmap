import Mathlib.Analysis.Distribution.SchwartzSpace.Fourier
import Mathlib.Analysis.Distribution.TemperedDistribution
import Mathlib.Analysis.LocallyConvex.Bounded
import Mathlib.Topology.UniformSpace.UniformConvergence
import Mathlib.Analysis.InnerProductSpace.PiL2

/-!
Suggested target forms, not an exhaustive checklist. The README is definitive.
RQFT7.MasslessLimit compares the actual Euclidean kernels as positive mass
approaches zero. Uniform convergence on von Neumann-bounded Schwartz sets
states the stronger estimate explicitly, without changing the native topology
on tempered distributions. These theorem admissions are future proofs.
-/

noncomputable section
open Filter MeasureTheory
open scoped SchwartzMap Topology

namespace TauCetiRoadmap.RelativisticQuantumFieldTheory.MasslessLimit

/-- The normalized massive one-dimensional Green function. -/
def greenOne (m x : ℝ) : ℝ := Real.exp (-m * |x|) / (2 * m)

abbrev Plane := EuclideanSpace ℝ (Fin 2)

/-- The massive planar heat representation, with an arbitrary value at its
single singular point. For m>0 and x≠0 the integral is convergent. -/
def greenTwo (m : ℝ) (x : Plane) : ℝ := by
  classical
  exact if x = 0 then 0 else
    ∫ t in Set.Ioi (0 : ℝ), (4 * Real.pi * t)⁻¹ *
      Real.exp (-m ^ 2 * t - ‖x‖ ^ 2 / (4 * t))

/-- A radius-one normalization for the constant subtraction. -/
def unitPoint : Plane := WithLp.toLp 2 ![(1 : ℝ), 0]

/-- The constant divergence is removed in position space, not by a position delta. -/
theorem greenOne_sub_const_tendstoUniformlyOn
    (s : Set 𝓢(ℝ, ℂ)) (hs : Bornology.IsVonNBounded ℂ s) :
    TendstoUniformlyOn
      (fun m f => ∫ x : ℝ, ((greenOne m x - (2 * m)⁻¹ : ℝ) : ℂ) * f x)
      (fun f => ∫ x : ℝ, ((-|x| / 2 : ℝ) : ℂ) * f x)
      (𝓝[>] (0 : ℝ)) s := by
  sorry

/-- The two-dimensional radial normalization is fixed at radius one. -/
theorem greenTwo_sub_const_tendstoUniformlyOn
    (s : Set 𝓢(Plane, ℂ)) (hs : Bornology.IsVonNBounded ℂ s) :
    TendstoUniformlyOn
      (fun m f => ∫ x : Plane, ((greenTwo m x - greenTwo m unitPoint : ℝ) : ℂ) * f x)
      (fun f => ∫ x : Plane, ((-Real.log ‖x‖ / (2 * Real.pi) : ℝ) : ℂ) * f x)
      (𝓝[>] (0 : ℝ)) s := by
  sorry

/-- The unrenormalized one-dimensional kernels really diverge on such tests. -/
theorem greenOne_pairing_tendsto_atTop (f : 𝓢(ℝ, ℝ))
    (hf : 0 < ∫ x : ℝ, f x) :
    Tendsto (fun m => ∫ x : ℝ, greenOne m x * f x) (𝓝[>] (0 : ℝ)) atTop := by
  sorry

/-- In dimensions at least three the native Fourier multipliers need no
constant subtraction. Their value at ξ=0 is immaterial to the integral. -/
theorem multiplier_tendstoUniformlyOn {n : ℕ} (hn : 3 ≤ n)
    (s : Set 𝓢(EuclideanSpace ℝ (Fin n), ℂ)) (hs : Bornology.IsVonNBounded ℂ s) :
    TendstoUniformlyOn
      (fun m f => ∫ ξ : EuclideanSpace ℝ (Fin n),
        (((4 * Real.pi ^ 2 * ‖ξ‖ ^ 2 + m ^ 2)⁻¹ : ℝ) : ℂ) * f ξ)
      (fun f => ∫ ξ : EuclideanSpace ℝ (Fin n),
        (((4 * Real.pi ^ 2 * ‖ξ‖ ^ 2)⁻¹ : ℝ) : ℂ) * f ξ)
      (𝓝[>] (0 : ℝ)) s := by
  sorry

end TauCetiRoadmap.RelativisticQuantumFieldTheory.MasslessLimit
