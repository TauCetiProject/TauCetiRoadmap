import Mathlib
import TauCeti.Analysis.BoundedVariation.ReducedBoundary
import TauCeti.Analysis.BoundedVariation.Space
import TauCeti.Analysis.Contour.Winding.Number.Basic
import TauCeti.Analysis.Sobolev.LipschitzDomain.Basic
import TauCeti.Geometry.MeasureTheory.Rectifiable.Basic
import TauCeti.MeasureTheory.Covering.EssentialBoundary
import TauCeti.Topology.FilledHull
import TauCeti.Topology.JordanCurve.Basic

/-!
# Geometric measure theory: target signatures

This file is not the roadmap. The roadmap is `README.md`, which is definitive; this file states
the roadmap's headline theorems against the pinned Mathlib and Tau Ceti, each admitted with
`sorry`, as the acceptance test of the finished roadmap.

The headline theorems are: the identification of the length of a rectifiable curve with the
`H¹` measure of its trace, the length formula for absolutely continuous curves and the Banach
indicatrix (Layer 1); the area formula with multiplicity, the coarea formula for Lipschitz maps,
the existence of approximate tangent planes on rectifiable sets and the tangential area formula
(Layer 2); the representation `Du = σ_u |Du|` of the distributional derivative and the Banach
space `BV(Ω)` (Layer 3); the scalar coarea formula, compactness, the relative isoperimetric
inequality and strict approximation on open sets (Layer 4); the blow-up theorem, De Giorgi's
structure theorem, Federer's theorem and the bound of the perimeter by the `Hⁿ⁻¹` measure of the
essential boundary (Layer 5); the Gauss–Green formula against `Hⁿ⁻¹` on the reduced boundary,
the BV trace theorem on bounded Lipschitz domains, and the Jordan index theorem, perimeter and
outer normal of the inside of a rectifiable Jordan curve (Layer 6).

Those of Layers 1 and 3, the area formula, and the scalar coarea formula, compactness and relative
isoperimetric inequality of Layer 4 are Tau Ceti declarations named in the supplier contracts of
the README; they are not restated here. Every other headline is stated below.
-/

noncomputable section

open MeasureTheory Set Filter Topology TopologicalSpace Module
open scoped ENNReal NNReal ContDiff RealInnerProductSpace symmDiff

namespace TauCetiRoadmap.GeometricMeasureTheory

open TauCeti

/-! ## Layer 2: rectifiability, area and coarea -/

section Coarea

variable {E F : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E] [FiniteDimensional ℝ E]
  [MeasurableSpace E] [BorelSpace E] [NormedAddCommGroup F] [InnerProductSpace ℝ F]
  [FiniteDimensional ℝ F] [MeasurableSpace F] [BorelSpace F]

/-- **The coarea formula for Lipschitz maps** (Simon 1983, 12.6–12.7, pp. 69–70). Let `E` and `F` be
finite-dimensional real inner product spaces with `dim F ≤ dim E`, let `f : E → F` be Lipschitz,
`s ⊆ E` Lebesgue measurable and `g : E → [0, ∞]` measurable. Integrating over `F` the integrals of
`g` over the fibres `s ∩ f⁻¹{y}`, against the `(dim E − dim F)`-dimensional normalized Hausdorff
measure, gives the integral over `s` of `g` times the coarea Jacobian `‖det (Df(x)*)‖`. No
surjectivity of the derivative is assumed. -/
theorem lintegral_setLIntegral_inter_preimage_eq_setLIntegral_mul_normDet_adjoint
    (hmn : finrank ℝ F ≤ finrank ℝ E) {f : E → F} {K : ℝ≥0} (hf : LipschitzWith K f)
    {s : Set E} (hs : NullMeasurableSet s) {g : E → ℝ≥0∞} (hg : Measurable g) :
    ∫⁻ y, ∫⁻ x in s ∩ f ⁻¹' {y}, g x ∂μHE[finrank ℝ E - finrank ℝ F] =
      ∫⁻ x in s, g x * ENNReal.ofReal (fderiv ℝ f x).adjoint.normDet :=
  sorry

end Coarea

section Tangent

variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E] [FiniteDimensional ℝ E]
  [MeasurableSpace E] [BorelSpace E]

/-- The subspace `P` is the **approximate tangent plane** of `M` at `x` in dimension `k`, with
multiplicity one (Simon 1983, Definition 11.2, p. 60): the blow-ups of `μHE[k]` restricted to `M`
at `x` converge weakly to `μHE[k]` restricted to `P`. That is, for every continuous compactly
supported `φ : E → ℝ`, `r⁻ᵏ ∫_M φ((y − x)/r) dHᵏ(y) → ∫_P φ dHᵏ` as `r → 0⁺`. -/
def IsApproxTangentPlane (k : ℕ) (M : Set E) (x : E) (P : Submodule ℝ E) : Prop :=
  ∀ φ : E → ℝ, Continuous φ → HasCompactSupport φ →
    Tendsto (fun r : ℝ => (r ^ k)⁻¹ * ∫ y in M, φ (r⁻¹ • (y - x)) ∂μHE[k]) (𝓝[>] 0)
      (𝓝 (∫ y in (P : Set E), φ y ∂μHE[k]))

/-- **Approximate tangent planes of rectifiable sets** (Simon 1983, Theorem 11.6 and Remark 11.5,
p. 61). Let `M` be a
countably `k`-rectifiable, `μHE[k]`-measurable subset of a finite-dimensional real inner product
space, with `μHE[k] (M ∩ K)` finite for every compact `K`. At `μHE[k]`-almost every point of `M`
there is exactly one `k`-dimensional subspace that is the approximate tangent plane of `M`. -/
theorem ae_existsUnique_isApproxTangentPlane {k : ℕ} {M : Set E}
    (hM : CountablyRectifiable k M) (hMm : NullMeasurableSet M μHE[k])
    (hfin : ∀ K, IsCompact K → μHE[k] (M ∩ K) ≠ ⊤) :
    ∀ᵐ x ∂(μHE[k] : Measure E).restrict M,
      ∃! P : Submodule ℝ E, finrank ℝ P = k ∧ IsApproxTangentPlane k M x P :=
  sorry

variable {F : Type*} [NormedAddCommGroup F] [InnerProductSpace ℝ F] [FiniteDimensional ℝ F]
  [MeasurableSpace F] [BorelSpace F]

/-- The continuous linear map `L : P → F` is a **tangential differential** of `f` along `M` at `x`
on the subspace `P`, in dimension `k`: for every `ε > 0`, the points `y ∈ M` with
`‖f(y) − f(x) − L(π_P(y − x))‖ > ε ‖y − x‖`, where `π_P` is the orthogonal projection onto `P`,
meet `closedBall x r` in a set of `μHE[k]` measure `o(rᵏ)` as `r → 0⁺`. When `P` is the
approximate tangent plane of `M` at `x`, `L` is the tangential differential of `f` along `M`. -/
def IsTangentialDifferential (k : ℕ) (M : Set E) (f : E → F) (x : E) (P : Submodule ℝ E)
    (L : P →L[ℝ] F) : Prop :=
  ∀ ε : ℝ, 0 < ε → Tendsto (fun r : ℝ => μHE[k] ({y ∈ M | ε * ‖y - x‖ <
      ‖f y - f x - L (P.orthogonalProjectionOnto (y - x))‖} ∩ Metric.closedBall x r) /
      ENNReal.ofReal (r ^ k)) (𝓝[>] 0) (𝓝 0)

/-- **The tangential area formula** (Simon 1983, 12.1–12.5, pp. 67–69). Let `M` be a countably
`k`-rectifiable, `μHE[k]`-measurable subset of `E` with `μHE[k] (M ∩ K)` finite for every compact
`K`, and let `f : E → F` be Lipschitz. Suppose that at `μHE[k]`-almost every `x ∈ M` the
`k`-dimensional subspace `P x` is the approximate tangent plane of `M` and `L x` is a tangential
differential of `f` along `M` on it. Then for every measurable `g : E → [0, ∞]`, the integral over
`M` of the tangential Jacobian `‖det (L x)‖` times `g` against `μHE[k]` is the integral over `F`,
against `μHE[k]`, of the sums of `g` over the fibres `M ∩ f⁻¹{y}`, taken in `[0, ∞]`. -/
theorem lintegral_normDet_mul_eq_lintegral_tsum_of_isTangentialDifferential {k : ℕ} {M : Set E}
    (hM : CountablyRectifiable k M) (hMm : NullMeasurableSet M μHE[k])
    (hfin : ∀ K, IsCompact K → μHE[k] (M ∩ K) ≠ ⊤) {f : E → F} {C : ℝ≥0}
    (hf : LipschitzWith C f) (P : E → Submodule ℝ E) (L : ∀ x, P x →L[ℝ] F)
    (hPL : ∀ᵐ x ∂(μHE[k] : Measure E).restrict M, finrank ℝ (P x) = k ∧
      IsApproxTangentPlane k M x (P x) ∧ IsTangentialDifferential k M f x (P x) (L x))
    {g : E → ℝ≥0∞} (hg : Measurable g) :
    ∫⁻ x in M, ENNReal.ofReal (L x : P x →ₗ[ℝ] F).normDet * g x ∂μHE[k] =
      ∫⁻ y, ∑' x : ↥(M ∩ f ⁻¹' {y}), g x ∂μHE[k] :=
  sorry

end Tangent

/-! ## Layer 4: approximation, compactness and scalar coarea -/

section Approximation

variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E] [FiniteDimensional ℝ E]
  [MeasurableSpace E] [BorelSpace E]

/-- **Strict approximation on open sets** (Anzellotti–Giaquinta 1978, Theorem 1, p. 2, for finite
variation). Every `u` integrable on an open set `Ω` is the `L¹(Ω)` limit of functions smooth on
`Ω` whose total variations on `Ω` converge to that of `u`, finite or infinite. -/
theorem exists_contDiffOn_tendsto_totalVariationOn {Ω : Opens E} {u : E → ℝ}
    (hu : IntegrableOn u Ω) :
    ∃ w : ℕ → E → ℝ, (∀ n, ContDiffOn ℝ ∞ (w n) Ω) ∧
      Tendsto (fun n => ∫⁻ x in Ω, ‖w n x - u x‖ₑ) atTop (𝓝 0) ∧
      Tendsto (fun n => totalVariationOn volume Ω (w n)) atTop
        (𝓝 (totalVariationOn volume Ω u)) :=
  sorry

end Approximation

/-! ## Layer 5: finite perimeter and boundary structure -/

section Structure

variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E] [FiniteDimensional ℝ E]
  [MeasurableSpace E] [BorelSpace E]

/-- **The blow-up theorem** (Simon 1983, Theorem 14.3, p. 73, with the inner normal). At every
point `x` of the reduced boundary of `s` in `Ω`, the rescaled sets `(s − x)/r` converge locally
in measure, as `r → 0⁺`, to the half-space `{y | ⟪y, ν_s(x)⟫ < 0}` bounded by the outer normal.
A point of the reduced boundary forces `s` to have locally finite perimeter in `Ω`, so no further
hypothesis is needed. -/
theorem tendsto_measure_preimage_add_smul_symmDiff_setOf_inner_lt_inter {Ω : Opens E}
    {s : Set E} {x : E} (hx : x ∈ reducedBoundary volume Ω s) {K : Set E} (hK : IsCompact K) :
    Tendsto (fun r : ℝ => volume ((((fun y => x + r • y) ⁻¹' s) ∆
        {y | ⟪y, outerNormal volume Ω s x⟫ < 0}) ∩ K)) (𝓝[>] 0) (𝓝 0) :=
  sorry

/-- **De Giorgi's structure theorem, rectifiability** (Simon 1983, Theorem 14.3, p. 72). The
reduced boundary of a set of locally finite perimeter in an open subset of an `n`-dimensional
real inner product space is countably `(n − 1)`-rectifiable. -/
theorem countablyRectifiable_reducedBoundary {Ω : Opens E} {s : Set E}
    (hu : LocallyIntegrableOn (s.indicator (1 : E → ℝ)) Ω volume)
    (hfin : ∀ K, IsCompact K → K ⊆ Ω →
      ∃ U : Opens E, K ⊆ (U : Set E) ∧ perimeter volume U s ≠ ⊤) :
    CountablyRectifiable (finrank ℝ E - 1) (reducedBoundary volume Ω s) :=
  sorry

/-- **De Giorgi's structure theorem, the perimeter measure** (Simon 1983, Theorem 14.3, p. 72).
For a set `s` of locally finite perimeter in `Ω`, the perimeter measure `|Dχ_s|` on `Ω` is the
`(n − 1)`-dimensional normalized Hausdorff measure restricted to the reduced boundary. -/
theorem variationMeasure_indicator_eq_comap_restrict_reducedBoundary {Ω : Opens E} {s : Set E}
    (hu : LocallyIntegrableOn (s.indicator (1 : E → ℝ)) Ω volume)
    (hfin : ∀ K, IsCompact K → K ⊆ Ω →
      ∃ U : Opens E, K ⊆ (U : Set E) ∧ perimeter volume U s ≠ ⊤) :
    variationMeasure volume Ω (s.indicator 1) =
      ((μHE[finrank ℝ E - 1] : Measure E).restrict (reducedBoundary volume Ω s)).comap
        ((↑) : Ω → E) :=
  sorry

/-- **Federer's theorem** (Maggi 2012, Chapter 16, p. 183, in the whole space). For a set `s` of
locally finite perimeter in `Ω`, the points of `Ω` in the essential boundary of `s` and outside
its reduced boundary form a `μHE[n − 1]`-null set. -/
theorem euclideanHausdorffMeasure_essentialBoundary_inter_diff_reducedBoundary {Ω : Opens E}
    {s : Set E} (hu : LocallyIntegrableOn (s.indicator (1 : E → ℝ)) Ω volume)
    (hfin : ∀ K, IsCompact K → K ⊆ Ω →
      ∃ U : Opens E, K ⊆ (U : Set E) ∧ perimeter volume U s ≠ ⊤) :
    μHE[finrank ℝ E - 1] ((essentialBoundary volume s ∩ Ω) \ reducedBoundary volume Ω s) = 0 :=
  sorry

/-- **The perimeter is at most the Hausdorff measure of the essential boundary.** For every
Lebesgue-measurable `s` and open `Ω`, in `[0, ∞]`, `P(s; Ω) ≤ Hⁿ⁻¹(∂ᴹs ∩ Ω)`. In particular a set
whose essential boundary has finite `Hⁿ⁻¹` measure in `Ω` has finite perimeter in `Ω`; no
smoothness of the set is assumed. -/
theorem perimeter_le_euclideanHausdorffMeasure_essentialBoundary_inter (Ω : Opens E) {s : Set E}
    (hs : NullMeasurableSet s) :
    perimeter volume Ω s ≤ μHE[finrank ℝ E - 1] (essentialBoundary volume s ∩ Ω) :=
  sorry

end Structure

/-! ## Layer 6: traces, Gauss–Green and classical domains -/

section GaussGreen

variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E] [FiniteDimensional ℝ E]
  [MeasurableSpace E] [BorelSpace E]

/-- **The Gauss–Green formula of De Giorgi and Federer** (Simon 1983, 14.1 and Theorem 14.3,
p. 72, with the inner normal). For a set `s` of locally finite perimeter in `Ω` and a compactly
supported `C¹` vector field `φ` with support in `Ω`, `∫_s div φ = ∫_{∂*s} ⟪φ, ν_s⟫ dHⁿ⁻¹`. -/
theorem integral_trace_fderiv_mul_indicator_eq_setIntegral_reducedBoundary {Ω : Opens E}
    {s : Set E} (hu : LocallyIntegrableOn (s.indicator (1 : E → ℝ)) Ω volume)
    (hfin : ∀ K, IsCompact K → K ⊆ Ω →
      ∃ U : Opens E, K ⊆ (U : Set E) ∧ perimeter volume U s ≠ ⊤)
    {φ : E → E} (hφ : ContDiff ℝ 1 φ) (hc : HasCompactSupport φ) (hs : tsupport φ ⊆ Ω) :
    ∫ x, LinearMap.trace ℝ E (fderiv ℝ φ x : E →ₗ[ℝ] E) * s.indicator 1 x =
      ∫ x in reducedBoundary volume Ω s, ⟪φ x, outerNormal volume Ω s x⟫
        ∂μHE[finrank ℝ E - 1] :=
  sorry

/-- **The BV trace theorem on bounded Lipschitz domains** (Anzellotti–Giaquinta 1978, Theorems 4,
7 and 8, pp. 12–16). Let `Ω` be a bounded Lipschitz domain in `ℝ × E`. There is a constant `C`
such that every `u ∈ BV(Ω)` has a trace `g` on `∂Ω`, integrable for the `dim E`-dimensional
normalized Hausdorff measure, with
`‖g‖_{L¹(∂Ω)} ≤ C (‖u‖_{L¹(Ω)} + |Du|(Ω))`; at almost every boundary point `x`, `g x` is the
approximate limit of `u` from inside `Ω`; and for every compactly supported `C¹` vector field `φ`
on the whole space,
`∫_Ω u div φ = −∫_Ω ⟪φ, σ_u⟫ d|Du| + ∫_{∂Ω} ⟪φ, ν_Ω⟫ g dHⁿ⁻¹`, with `ν_Ω` the outer normal. -/
theorem exists_trace_memBV {Ω : Opens (WithLp 2 (ℝ × E))} {L : ℝ≥0}
    (hΩ : (Ω : Set (WithLp 2 (ℝ × E))).IsLipschitzDomainWith L)
    (hb : Bornology.IsBounded (Ω : Set (WithLp 2 (ℝ × E)))) :
    ∃ C : ℝ≥0, ∀ u : WithLp 2 (ℝ × E) → ℝ, MemBV volume Ω u →
      ∃ g : WithLp 2 (ℝ × E) → ℝ,
        Integrable g ((μHE[finrank ℝ E] : Measure (WithLp 2 (ℝ × E))).restrict
          (frontier (Ω : Set (WithLp 2 (ℝ × E))))) ∧
        ∫⁻ x in frontier (Ω : Set (WithLp 2 (ℝ × E))), ‖g x‖ₑ ∂μHE[finrank ℝ E] ≤
          C * ((∫⁻ x in Ω, ‖u x‖ₑ) + totalVariationOn volume Ω u) ∧
        (∀ᵐ x ∂(μHE[finrank ℝ E] : Measure (WithLp 2 (ℝ × E))).restrict
            (frontier (Ω : Set (WithLp 2 (ℝ × E)))),
          Tendsto (fun r : ℝ => (∫⁻ y in (Ω : Set (WithLp 2 (ℝ × E))) ∩ Metric.ball x r,
              ‖u y - g x‖ₑ) / volume (Metric.ball x r)) (𝓝[>] 0) (𝓝 0)) ∧
        ∀ φ : WithLp 2 (ℝ × E) → WithLp 2 (ℝ × E), ContDiff ℝ 1 φ → HasCompactSupport φ →
          ∫ x in Ω, LinearMap.trace ℝ (WithLp 2 (ℝ × E))
              (fderiv ℝ φ x : WithLp 2 (ℝ × E) →ₗ[ℝ] WithLp 2 (ℝ × E)) * u x =
            -(∫ y, ⟪φ y, polarDensity volume Ω u y⟫ ∂variationMeasure volume Ω u) +
              ∫ x in frontier (Ω : Set (WithLp 2 (ℝ × E))),
                ⟪φ x, outerNormal volume ⊤ (Ω : Set (WithLp 2 (ℝ × E))) x⟫ * g x
                ∂μHE[finrank ℝ E] :=
  sorry

end GaussGreen

section Jordan

/-- **The Jordan index theorem for absolutely continuous curves.** Let `γ : ℝ → ℂ` be absolutely
continuous on `[a, b]`, `a < b`, closed and injective on `[a, b)`, with trace `C`. There is one
sign `σ ∈ {1, −1}` such that the winding number of `γ` is `σ` at every point of the inside
`filledHull C \ C` and `0` at every point outside `filledHull C`. -/
theorem exists_windingNumber_eq_of_injOn_Ico {γ : ℝ → ℂ} {a b : ℝ} (hab : a < b)
    (hγ : AbsolutelyContinuousOnInterval γ a b) (hclosed : γ a = γ b)
    (hinj : InjOn γ (Ico a b)) :
    ∃ σ : ℂ, (σ = 1 ∨ σ = -1) ∧
      (∀ z ∈ filledHull (γ '' Icc a b) \ γ '' Icc a b, Contour.windingNumber γ a b z = σ) ∧
      ∀ z ∉ filledHull (γ '' Icc a b), Contour.windingNumber γ a b z = 0 :=
  sorry

/-- **The perimeter of the inside of a rectifiable Jordan curve.** For a Jordan curve `C ⊆ ℂ` of
finite length `H¹(C)`, the bounded complementary region `filledHull C \ C` has perimeter `H¹(C)`. -/
theorem perimeter_filledHull_sdiff {C : Set ℂ} (hC : IsJordanCurve C) (hfin : μHE[1] C ≠ ⊤) :
    perimeter volume ⊤ (filledHull C \ C) = μHE[1] C :=
  sorry

/-- **The outer normal of the inside of a rectifiable Jordan curve.** Let `γ` be a unit-speed
parametrization of a Jordan curve `C` on `[a, b]`, closed and injective on `[a, b)`, and let `σ` be
its Jordan index. At almost every parameter `t`, the point `γ t` lies in the reduced boundary of
`Ω = filledHull C \ C` and the outer normal there is `−σ i γ'(t)`: the unit tangent turned by a
quarter turn clockwise for a counterclockwise curve. -/
theorem exists_ae_outerNormal_filledHull_sdiff_eq {γ : ℝ → ℂ} {a b : ℝ} (hab : a < b)
    (hγ : HasUnitSpeedOn γ (Icc a b)) (hclosed : γ a = γ b) (hinj : InjOn γ (Ico a b)) :
    ∃ σ : ℂ, (σ = 1 ∨ σ = -1) ∧
      (∀ z ∈ filledHull (γ '' Icc a b) \ γ '' Icc a b, Contour.windingNumber γ a b z = σ) ∧
      ∀ᵐ t ∂volume.restrict (Icc a b),
        γ t ∈ reducedBoundary volume ⊤ (filledHull (γ '' Icc a b) \ γ '' Icc a b) ∧
        outerNormal volume ⊤ (filledHull (γ '' Icc a b) \ γ '' Icc a b) (γ t) =
          -(σ * Complex.I * deriv γ t) :=
  sorry

end Jordan

end TauCetiRoadmap.GeometricMeasureTheory
