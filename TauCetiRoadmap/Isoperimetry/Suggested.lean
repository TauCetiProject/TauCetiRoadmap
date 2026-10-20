import Mathlib.Geometry.Euclidean.Volume.Measure
import Mathlib.MeasureTheory.Function.AbsolutelyContinuous
import Mathlib.Topology.EMetricSpace.BoundedVariation
import Mathlib.MeasureTheory.Integral.IntervalIntegral.Basic
import TauCeti.Analysis.Normed.Module.FilledHull
import TauCeti.Topology.JordanCurve.Basic

/-!
# Euclidean isoperimetry: suggested signatures

**This file is not the roadmap and is not exhaustive.** `README.md` is definitive.
These signatures illustrate the frontier corollary, periodic AC inequality, and full
rectifiable Jordan theorem using existing APIs. The all-dimensional finite-perimeter
inequality and its a.e. ball rigidity must additionally be stated against GMT's canonical
perimeter API once built; no stand-in predicate represents those requirements here.
-/

noncomputable section

open MeasureTheory Set
open scoped ENNReal

namespace TauCetiRoadmap.Isoperimetry

/-- A consequence of the perimeter theorem, stated without any boundary regularity. -/
theorem isoperimetric_frontier {n : ℕ} (hn : 2 ≤ n)
    (E : Set (EuclideanSpace ℝ (Fin n)))
    (hvol : volume E < ⊤) :
    (n : ℝ≥0∞) ^ n * volume (Metric.ball (0 : EuclideanSpace ℝ (Fin n)) 1) *
        volume E ^ (n - 1) ≤ (μHE[n - 1] (frontier E)) ^ n :=
  sorry

/-- The sharp periodic constant at AC regularity. The README also requires equality. -/
theorem periodic_wirtinger {f : ℝ → ℝ} {T : ℝ} (hT : 0 < T)
    (hf : AbsolutelyContinuousOnInterval f 0 T) (hperiod : f 0 = f T)
    (hmean : (∫ t in (0 : ℝ)..T, f t) = 0)
    (henergy : IntervalIntegrable (fun t ↦ (deriv f t) ^ 2) volume 0 T) :
    (∫ t in (0 : ℝ)..T, (f t) ^ 2) ≤
      (T / (2 * Real.pi)) ^ 2 * ∫ t in (0 : ℝ)..T, (deriv f t) ^ 2 :=
  sorry

/-- Geometric area and geometric trace length; no parameter regularity is imposed. -/
theorem jordan_isoperimetric {C : Set ℂ} (hC : TauCeti.IsJordanCurve C)
    (hrect : μHE[1] C < ⊤) :
    4 * Real.pi * (volume (TauCeti.filledHull C \ C)).toReal ≤ (μHE[1] C).toReal ^ 2 :=
  sorry

/-- Equality is literal equality of the geometric trace with a positive-radius circle. -/
theorem jordan_isoperimetric_eq_iff {C : Set ℂ} (hC : TauCeti.IsJordanCurve C)
    (hrect : μHE[1] C < ⊤) :
    4 * Real.pi * (volume (TauCeti.filledHull C \ C)).toReal = (μHE[1] C).toReal ^ 2 ↔
      ∃ c : ℂ, ∃ r : ℝ, 0 < r ∧ C = Metric.sphere c r :=
  sorry

/-- A continuous BV parameter may have a singular speed; its length is total variation. -/
theorem simple_closed_rectifiable_isoperimetric {γ : ℝ → ℂ} {a b : ℝ} (hab : a < b)
    (hγ : ContinuousOn γ (Icc a b)) (hclosed : γ a = γ b)
    (hinj : InjOn γ (Ico a b)) (hrect : BoundedVariationOn γ (Icc a b)) :
    4 * Real.pi * (volume (TauCeti.filledHull (γ '' Icc a b) \ γ '' Icc a b)).toReal ≤
      (eVariationOn γ (Icc a b)).toReal ^ 2 :=
  sorry

end TauCetiRoadmap.Isoperimetry
