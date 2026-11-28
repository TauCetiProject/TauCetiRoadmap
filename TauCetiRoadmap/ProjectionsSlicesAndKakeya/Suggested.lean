import Mathlib

/-!
# Projections, slices and Kakeya sets: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib, each with `sorry`, together with the two definitions they
need: the Riesz capacity of a set, built on the energy of FractalGeometry 3.3 (whose integral is
copied verbatim), and the orthogonal projection of the Euclidean plane onto the line in the
direction `(cos θ, sin θ)`. The plane is `EuclideanSpace ℝ (Fin 2)` throughout. Every headline
theorem of the README's summary is statable at the pins and is stated here.
-/

open MeasureTheory Metric Set Filter
open scoped ENNReal NNReal Real

namespace TauCetiRoadmap.ProjectionsSlicesAndKakeya

/-! ## Layer 1: Riesz capacity -/

/-- 1.1: the `s`-capacity of a set `A`: the supremum, over the probability measures `μ` that
give the complement of `A` measure zero, of the inverse of the `s`-energy
`∫⁻ x, ∫⁻ y, edist x y ^ (-s) ∂μ ∂μ` (the integral of FractalGeometry 3.3, copied verbatim);
`∞⁻¹ = 0`, and a set charged by no probability measure has capacity `0`. -/
noncomputable def capacity {X : Type*} [MetricSpace X] [MeasurableSpace X] (s : ℝ)
    (A : Set X) : ℝ≥0∞ :=
  ⨆ (μ : Measure X) (_ : IsProbabilityMeasure μ) (_ : μ Aᶜ = 0),
    (∫⁻ x, ∫⁻ y, edist x y ^ (-s) ∂μ ∂μ)⁻¹

/-- 1.2: for a compact subset of a finite-dimensional real normed space, the Hausdorff
dimension is the supremum of the exponents of positive capacity (Bishop and Peres,
Theorem 3.4.2, last clause). -/
theorem dimH_eq_iSup_capacity {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
    [FiniteDimensional ℝ E] [MeasurableSpace E] [BorelSpace E] {K : Set E}
    (hK : IsCompact K) :
    dimH K = ⨆ (s : ℝ) (_ : capacity s K ≠ 0), ENNReal.ofReal s := by
  sorry

/-! ## Layer 2: Projections below dimension one -/

/-- 2.1: the orthogonal projection of the plane onto the line through the origin in the
direction `(cos θ, sin θ)`, the line identified with `ℝ`: `x ↦ ⟪x, (cos θ, sin θ)⟫`. -/
noncomputable def proj (θ : ℝ) (x : EuclideanSpace ℝ (Fin 2)) : ℝ :=
  Real.cos θ * x 0 + Real.sin θ * x 1

/-- 2.2: averaging the `α`-energy of the projected measures over the directions multiplies
the energy by `∫ θ in [0, π), |cos θ| ^ (-α)` (the proof of Bishop and Peres, Theorem 3.5.1;
Hochman, proof of Theorem 7.2). -/
theorem setLIntegral_energy_map_proj (μ : Measure (EuclideanSpace ℝ (Fin 2))) [SFinite μ]
    (α : ℝ) :
    ∫⁻ θ in Ico 0 π, (∫⁻ x, ∫⁻ y, edist x y ^ (-α) ∂(μ.map (proj θ)) ∂(μ.map (proj θ))) =
      (∫⁻ θ in Ico 0 π, ENNReal.ofReal |Real.cos θ| ^ (-α)) *
        ∫⁻ x, ∫⁻ y, edist x y ^ (-α) ∂μ ∂μ := by
  sorry

/-- 2.3: Kaufman's theorem: for `α < 1`, a set of positive `α`-capacity has projections of
positive `α`-capacity in almost every direction (Bishop and Peres, Theorem 3.5.1). -/
theorem ae_capacity_proj_ne_zero {A : Set (EuclideanSpace ℝ (Fin 2))} {α : ℝ} (hα : α < 1)
    (hA : capacity α A ≠ 0) : ∀ᵐ θ : ℝ, capacity α (proj θ '' A) ≠ 0 := by
  sorry

/-- 2.4: Marstrand's projection theorem: a compact set in the plane projects in almost every
direction onto a set of dimension `min (dimH K) 1` (Bishop and Peres, Corollary 3.5.2;
Hochman, Theorem 7.2). -/
theorem ae_dimH_proj_eq {K : Set (EuclideanSpace ℝ (Fin 2))} (hK : IsCompact K) :
    ∀ᵐ θ : ℝ, dimH (proj θ '' K) = min (dimH K) 1 := by
  sorry

/-! ## Layer 3: Projections of positive length -/

/-- 3.1: Mattila's inequality: for a σ-compact set `A` and a probability measure on `A`, the
reciprocals of the lengths of the projections of `A` have integral over `[0, π)` at most the
`1`-energy of the measure (Bishop and Peres, Lemma 3.5.5, for compact sets). -/
theorem setLIntegral_inv_volume_proj_le {A : Set (EuclideanSpace ℝ (Fin 2))}
    (hA : IsSigmaCompact A) (μ : Measure (EuclideanSpace ℝ (Fin 2))) [IsProbabilityMeasure μ]
    (hμ : μ Aᶜ = 0) :
    ∫⁻ θ in Ico 0 π, (volume (proj θ '' A))⁻¹ ≤ ∫⁻ x, ∫⁻ y, edist x y ^ (-1 : ℝ) ∂μ ∂μ := by
  sorry

/-- 3.2: Kaufman's theorem: a set of positive `1`-capacity has projections of positive
length in almost every direction (Bishop and Peres, Theorem 3.5.3). -/
theorem ae_volume_proj_pos_of_capacity {A : Set (EuclideanSpace ℝ (Fin 2))}
    (hA : capacity 1 A ≠ 0) : ∀ᵐ θ : ℝ, 0 < volume (proj θ '' A) := by
  sorry

/-- 3.3: Marstrand's theorem: a compact set in the plane of dimension greater than one has
projections of positive length in almost every direction (Hochman, Theorem 7.6). -/
theorem ae_volume_proj_pos {K : Set (EuclideanSpace ℝ (Fin 2))} (hK : IsCompact K)
    (h : 1 < dimH K) : ∀ᵐ θ : ℝ, 0 < volume (proj θ '' K) := by
  sorry

/-- 3.4: Mattila's bound for the Favard length of a σ-compact set: `π² · Cap₁ A` is at most
the integral over `[0, π)` of the lengths of its projections (Bishop and Peres,
Theorem 3.5.4, for compact sets). -/
theorem pi_sq_mul_capacity_le_favard {A : Set (EuclideanSpace ℝ (Fin 2))}
    (hA : IsSigmaCompact A) :
    ENNReal.ofReal (π ^ 2) * capacity 1 A ≤ ∫⁻ θ in Ico 0 π, volume (proj θ '' A) := by
  sorry

/-! ## Layer 4: Slices -/

/-- 4.1: Marstrand's slicing theorem for a measure on the line with `μ (closedBall x r) ≤
C · r ^ α`: for `μ`-almost every `x`, the vertical slice of any plane set `F` over `x` has
dimension at most `dimH F - α`, in `ℝ≥0∞` (Bishop and Peres, Theorem 3.3.1, and
Theorem 1.6.1 for Lebesgue measure). -/
theorem ae_dimH_inter_preimage_le (μ : Measure ℝ) {α C : ℝ≥0}
    (hμ : ∀ x r, μ (closedBall x r) ≤ C * ENNReal.ofReal r ^ (α : ℝ))
    (F : Set (EuclideanSpace ℝ (Fin 2))) :
    ∀ᵐ x ∂μ, dimH (F ∩ (fun p : EuclideanSpace ℝ (Fin 2) => p 0) ⁻¹' {x}) ≤ dimH F - α := by
  sorry

/-! ## Layer 5: Kakeya and Besicovitch sets -/

/-- 5.1: Besicovitch's theorem: there is a compact set in the plane of zero area containing
a unit segment in every direction (Bishop and Peres, Theorem 9.1.1 and Lemma 9.1.2). -/
theorem exists_isCompact_volume_eq_zero_segment :
    ∃ K : Set (EuclideanSpace ℝ (Fin 2)), IsCompact K ∧ volume K = 0 ∧
      ∀ e : EuclideanSpace ℝ (Fin 2), ‖e‖ = 1 → ∃ p, segment ℝ p (p + e) ⊆ K := by
  sorry

/-- 5.2: the Minkowski form of the Kakeya bound: if `K` contains a unit segment in every
direction, its open `ε`-neighbourhood has area at least `1 / (8 log (1/ε))` for
`0 < ε ≤ 1/2` (Bishop and Peres, Theorem 9.1.3, with an explicit constant). -/
theorem volume_thickening_ge {K : Set (EuclideanSpace ℝ (Fin 2))}
    (hK : ∀ e : EuclideanSpace ℝ (Fin 2), ‖e‖ = 1 → ∃ p, segment ℝ p (p + e) ⊆ K) {ε : ℝ}
    (hε₀ : 0 < ε) (hε : ε ≤ 1 / 2) :
    ENNReal.ofReal (1 / (8 * Real.log ε⁻¹)) ≤ volume (thickening ε K) := by
  sorry

/-- 5.3: a closed set containing a nondegenerate segment in every direction of a nonempty
set `E` of unit vectors has dimension at least `1 + dimH E` (Bishop and Peres,
Theorem 9.1.4). -/
theorem one_add_dimH_le_dimH {K : Set (EuclideanSpace ℝ (Fin 2))} (hK : IsClosed K)
    {E : Set (EuclideanSpace ℝ (Fin 2))} (hE : E ⊆ sphere 0 1) (hne : E.Nonempty)
    (hseg : ∀ e ∈ E, ∃ p, ∃ t : ℝ, 0 < t ∧ segment ℝ p (p + t • e) ⊆ K) :
    1 + dimH E ≤ dimH K := by
  sorry

/-- 5.4: Davies' theorem: a closed set in the plane containing a unit segment in every
direction has Hausdorff dimension `2` (Bishop and Peres, Theorem 9.1.4; Hochman,
Theorem 8.9). -/
theorem dimH_eq_two {K : Set (EuclideanSpace ℝ (Fin 2))} (hK : IsClosed K)
    (h : ∀ e : EuclideanSpace ℝ (Fin 2), ‖e‖ = 1 → ∃ p, segment ℝ p (p + e) ⊆ K) :
    dimH K = 2 := by
  sorry

end TauCetiRoadmap.ProjectionsSlicesAndKakeya
