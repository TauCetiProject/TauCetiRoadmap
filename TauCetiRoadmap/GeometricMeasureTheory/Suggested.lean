import Mathlib.Geometry.Euclidean.Volume.Measure
import Mathlib.MeasureTheory.Function.AbsolutelyContinuous
import Mathlib.Topology.EMetricSpace.BoundedVariation
import TauCeti.MeasureTheory.Function.MetricDerivative.Basic
import TauCeti.Analysis.Calculus.MetricVariation
import TauCeti.Analysis.Calculus.Sard.OutermostStratum

/-!
# Geometric measure theory: suggested signatures

**This file is not the roadmap and is not exhaustive.** `README.md` is definitive.
These signatures illustrate G1's curve/measure APIs and G4's consumption of smooth Sard. They do not
discharge the BV, nonlinear area/coarea, perimeter, or boundary-structure milestones.
Those interfaces must be built against the canonical measure-valued derivative API;
there are no placeholder predicates for objects not yet constructed.
-/

noncomputable section

open MeasureTheory Set
open scoped ENNReal ContDiff

namespace TauCetiRoadmap.GeometricMeasureTheory

/-- G4 consumes smooth scalar Sard from the existing Tau Ceti theorem. -/
theorem volume_criticalValues_eq_zero {n : ℕ} {f : EuclideanSpace ℝ (Fin n) → ℝ}
    (hf : ContDiff ℝ ∞ f) :
    volume (f '' {x | ¬ Function.Surjective (fderiv ℝ f x)}) = 0 := by
  exact hf.addHaar_image_criticalPoints_eq_zero (ν := volume)
    (WithTop.coe_le_coe.mpr le_top)

/-- Absolute continuity strengthens the existing C¹ variation–speed comparison. -/
theorem eVariationOn_eq_lintegral_enorm_deriv
    {n : ℕ} {γ : ℝ → EuclideanSpace ℝ (Fin n)} {a b : ℝ} (hab : a < b)
    (hγ : AbsolutelyContinuousOnInterval γ a b) :
    eVariationOn γ (Icc a b) = ∫⁻ t in Icc a b, ‖deriv γ t‖ₑ :=
  sorry

/-- Parameter length bounds geometric trace length, without assuming an AC parameter. -/
theorem euclideanHausdorffMeasure_trace_le_eVariationOn
    {n : ℕ} {γ : ℝ → EuclideanSpace ℝ (Fin n)} {a b : ℝ} (hab : a ≤ b)
    (hγ : ContinuousOn γ (Icc a b)) (hrect : BoundedVariationOn γ (Icc a b)) :
    μHE[1] (γ '' Icc a b) ≤ eVariationOn γ (Icc a b) :=
  sorry

/-- No multiplicity is lost for an injective arc. -/
theorem euclideanHausdorffMeasure_trace_eq_eVariationOn
    {n : ℕ} {γ : ℝ → EuclideanSpace ℝ (Fin n)} {a b : ℝ} (hab : a ≤ b)
    (hγ : ContinuousOn γ (Icc a b)) (hrect : BoundedVariationOn γ (Icc a b))
    (hinj : InjOn γ (Icc a b)) :
    μHE[1] (γ '' Icc a b) = eVariationOn γ (Icc a b) :=
  sorry

/-- A rectifiable planar trace is null for area, even for a non-AC parametrization. -/
theorem volume_trace_eq_zero {γ : ℝ → ℂ} {a b : ℝ} (hab : a ≤ b)
    (hγ : ContinuousOn γ (Icc a b)) (hrect : BoundedVariationOn γ (Icc a b)) :
    volume (γ '' Icc a b) = 0 :=
  sorry

end TauCetiRoadmap.GeometricMeasureTheory
