import Mathlib
import TauCeti.Analysis.BoundedVariation.Perimeter
import TauCeti.Analysis.BoundedVariation.TotalVariation
import TauCeti.Analysis.Sobolev.WeakDeriv.Basic
import TauCeti.MeasureTheory.Function.SchwarzRearrangement
import TauCeti.Topology.FilledHull
import TauCeti.Topology.JordanCurve.Basic

/-!
# Euclidean isoperimetry: target signatures

This file is not the roadmap and is not exhaustive: `README.md` is the definitive specification.
The file states the roadmap's headline theorems against the pinned Mathlib and Tau Ceti APIs, each
with `sorry`: ball rigidity in the sharp isoperimetric inequality and its topological-frontier
form (Layer 4), Pólya–Szegő in `W¹,¹` and the sharp `BV` Sobolev inequality with its equality
cases (Layer 5), and the isoperimetric theorem for rectifiable Jordan curves in its geometric and
parametrized forms (Layer 6). Every headline theorem of the roadmap is statable at the pins.

The sharp inequality `P(E)^n ≥ n^n ω_n |E|^(n-1)` itself, for every Lebesgue-measurable set of
finite volume, is Tau Ceti's
`MeasureTheory.NullMeasurableSet.finrank_pow_mul_volume_ball_mul_volume_pow_le_perimeter_pow`, and
the sharp periodic Wirtinger inequality is Tau Ceti's `TauCeti.integral_norm_sub_average_sq_le`;
neither is restated here.
-/

noncomputable section

open MeasureTheory Set
open scoped ENNReal

namespace TauCetiRoadmap.Isoperimetry

/-! ## Layer 4: sharp Euclidean perimeter inequality and ball rigidity -/

/-- **Ball rigidity in the sharp isoperimetric inequality.** In a finite-dimensional real inner
product space of dimension `n ≥ 2`, a Lebesgue-measurable set `s` of finite positive volume
attains equality `P(s)^n = n^n ω_n |s|^(n-1)`, where `ω_n` is the volume of the unit ball and
`P(s)` the perimeter of `s` in the whole space, exactly when `s` agrees almost everywhere with an
open ball of positive radius. No boundedness, connectedness, convexity or boundary regularity is
assumed; finiteness of the perimeter is a consequence of either side. -/
theorem perimeter_pow_eq_iff_exists_ae_eq_ball {E : Type*} [NormedAddCommGroup E]
    [InnerProductSpace ℝ E] [FiniteDimensional ℝ E] [MeasurableSpace E] [BorelSpace E]
    (hn : 2 ≤ Module.finrank ℝ E) {s : Set E} (hs : NullMeasurableSet s volume)
    (hs0 : volume s ≠ 0) (hsfin : volume s ≠ ⊤) :
    TauCeti.perimeter volume ⊤ s ^ Module.finrank ℝ E =
        (Module.finrank ℝ E : ℝ≥0∞) ^ Module.finrank ℝ E * volume (Metric.ball (0 : E) 1) *
          volume s ^ (Module.finrank ℝ E - 1) ↔
      ∃ c : E, ∃ r : ℝ, 0 < r ∧ s =ᵐ[volume] Metric.ball c r :=
  sorry

/-- **The topological-frontier form of the isoperimetric inequality.** In `ℝⁿ`, `n ≥ 2`, every set
`E` of finite volume satisfies `n^n ω_n |E|^(n-1) ≤ Hⁿ⁻¹(frontier E)^n`, with the normalized
Euclidean Hausdorff measure. No measurability or boundary regularity is assumed: when the frontier
has finite measure it is Lebesgue-null and `E` is Lebesgue measurable. -/
theorem isoperimetric_frontier {n : ℕ} (hn : 2 ≤ n)
    (E : Set (EuclideanSpace ℝ (Fin n)))
    (hvol : volume E < ⊤) :
    (n : ℝ≥0∞) ^ n * volume (Metric.ball (0 : EuclideanSpace ℝ (Fin n)) 1) *
        volume E ^ (n - 1) ≤ (μHE[n - 1] (frontier E)) ^ n :=
  sorry

/-! ## Layer 5: sharp BV Sobolev and its equality cases -/

/-- **Pólya–Szegő in `W¹,¹`.** In dimension `n ≥ 2`, let `u` be a nonnegative integrable function
with an integrable weak derivative `U` on the whole space. Then the Schwarz rearrangement `u*` of
`u` has an integrable weak derivative `G`, and `∫ ‖G‖ ≤ ∫ ‖U‖`. In particular the distributional
derivative of `u*` has no singular part. -/
theorem exists_hasWeakFDerivOn_schwarzRearrangement {E : Type*} [NormedAddCommGroup E]
    [InnerProductSpace ℝ E] [FiniteDimensional ℝ E] [MeasurableSpace E] [BorelSpace E]
    (hn : 2 ≤ Module.finrank ℝ E) {u : E → ℝ} (hu0 : 0 ≤ᵐ[volume] u)
    (hu : Integrable u volume) {U : E → E →L[ℝ] ℝ} (hU : Integrable U volume)
    (hweak : TauCeti.HasWeakFDerivOn volume ⊤ u U) :
    ∃ G : E → E →L[ℝ] ℝ, Integrable G volume ∧
      TauCeti.HasWeakFDerivOn volume ⊤
        (fun x ↦ (TauCeti.schwarzRearrangement volume (fun y ↦ ENNReal.ofReal (u y)) x).toReal)
        G ∧
      ∫ x, ‖G x‖ ∂volume ≤ ∫ x, ‖U x‖ ∂volume :=
  sorry

/-- **The sharp `BV` Sobolev inequality.** In dimension `n ≥ 2`, with `p = n / (n - 1)`, every
integrable `u` satisfies `‖u‖_p ≤ (n ω_n^(1/n))⁻¹ |Du|(ℝⁿ)`, where `|Du|(ℝⁿ)` is the total
variation of `u` on the whole space, finite or infinite, and `ω_n` the volume of the unit ball. -/
theorem eLpNorm_le_inv_mul_totalVariationOn {E : Type*} [NormedAddCommGroup E]
    [InnerProductSpace ℝ E] [FiniteDimensional ℝ E] [MeasurableSpace E] [BorelSpace E]
    (hn : 2 ≤ Module.finrank ℝ E) {u : E → ℝ} (hu : Integrable u volume) :
    eLpNorm u (ENNReal.ofReal ((Module.finrank ℝ E : ℝ) / (Module.finrank ℝ E - 1))) volume ≤
      (ENNReal.ofReal (Module.finrank ℝ E *
          volume.real (Metric.ball (0 : E) 1) ^ (Module.finrank ℝ E : ℝ)⁻¹))⁻¹ *
        TauCeti.totalVariationOn volume ⊤ u :=
  sorry

/-- **Equality in the sharp `BV` Sobolev inequality.** In dimension `n ≥ 2`, an integrable `u` of
finite total variation that is not almost everywhere zero attains equality in the sharp `BV`
Sobolev inequality exactly when `u` is almost everywhere a nonzero multiple of the indicator of a
ball of positive radius. -/
theorem eLpNorm_eq_inv_mul_totalVariationOn_iff {E : Type*} [NormedAddCommGroup E]
    [InnerProductSpace ℝ E] [FiniteDimensional ℝ E] [MeasurableSpace E] [BorelSpace E]
    (hn : 2 ≤ Module.finrank ℝ E) {u : E → ℝ} (hu : Integrable u volume)
    (hV : TauCeti.totalVariationOn volume ⊤ u ≠ ⊤) (hu0 : ¬ u =ᵐ[volume] 0) :
    eLpNorm u (ENNReal.ofReal ((Module.finrank ℝ E : ℝ) / (Module.finrank ℝ E - 1))) volume =
        (ENNReal.ofReal (Module.finrank ℝ E *
            volume.real (Metric.ball (0 : E) 1) ^ (Module.finrank ℝ E : ℝ)⁻¹))⁻¹ *
          TauCeti.totalVariationOn volume ⊤ u ↔
      ∃ c : ℝ, c ≠ 0 ∧ ∃ a : E, ∃ r : ℝ, 0 < r ∧
        u =ᵐ[volume] (Metric.ball a r).indicator (fun _ ↦ c) :=
  sorry

/-! ## Layer 6: full planar Jordan theorem and compatibility -/

/-- **The isoperimetric inequality for rectifiable Jordan curves.** A Jordan curve `C` in the plane
with finite length `L = H¹(C)` bounds an inside `filledHull C \ C` of area `A` with `4π A ≤ L²`.
Area and length are the geometric ones; no parametrization is involved. -/
theorem jordan_isoperimetric {C : Set ℂ} (hC : TauCeti.IsJordanCurve C)
    (hrect : μHE[1] C < ⊤) :
    4 * Real.pi * (volume (TauCeti.filledHull C \ C)).toReal ≤ (μHE[1] C).toReal ^ 2 :=
  sorry

/-- **Equality for rectifiable Jordan curves.** Equality `4π A = L²` holds exactly when the Jordan
curve is, as a set, a circle of positive radius. -/
theorem jordan_isoperimetric_eq_iff {C : Set ℂ} (hC : TauCeti.IsJordanCurve C)
    (hrect : μHE[1] C < ⊤) :
    4 * Real.pi * (volume (TauCeti.filledHull C \ C)).toReal = (μHE[1] C).toReal ^ 2 ↔
      ∃ c : ℂ, ∃ r : ℝ, 0 < r ∧ C = Metric.sphere c r :=
  sorry

/-- **The parametrized form.** A continuous closed curve `γ` on `[a, b]`, injective on `[a, b)` and
of bounded variation, encloses area at most `L² / (4π)`, where `L` is its total variation on
`[a, b]`. The parameter need not be absolutely continuous, Lipschitz or piecewise smooth. -/
theorem simple_closed_rectifiable_isoperimetric {γ : ℝ → ℂ} {a b : ℝ} (hab : a < b)
    (hγ : ContinuousOn γ (Icc a b)) (hclosed : γ a = γ b)
    (hinj : InjOn γ (Ico a b)) (hrect : BoundedVariationOn γ (Icc a b)) :
    4 * Real.pi * (volume (TauCeti.filledHull (γ '' Icc a b) \ γ '' Icc a b)).toReal ≤
      (eVariationOn γ (Icc a b)).toReal ^ 2 :=
  sorry

end TauCetiRoadmap.Isoperimetry
