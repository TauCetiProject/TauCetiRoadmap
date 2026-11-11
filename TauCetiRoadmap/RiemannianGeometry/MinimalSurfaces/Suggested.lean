import Mathlib

/-!
# Minimal surfaces: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. These signatures state the targets of the sub-roadmap that are statable against
the pinned Mathlib alone: the point-picking lemma (5.4), the conformal maps and the balancing
lemma of Hersch (10.3), and the elementary inequality behind the constant `6/5` in the
gradient estimate for positive Jacobi fields (7.4). Unimplemented statements have honest
`sorry` bodies.

Every other target of `README.md` is stated on the immersion carriers of
RiemannianGeometry R5a and R5b (the second fundamental form, the normal bundle and the normal
Jacobi operator of an isometric immersion), which the pinned libraries do not yet provide, so
it has no signature here.
-/

noncomputable section

open MeasureTheory Metric

namespace TauCetiRoadmap.RiemannianGeometry.MinimalSurfaces

/-! ### MS5.4: the point-picking lemma -/

/-- **Point-picking lemma** (MS5.4). On a compact subset `S` of a closed ball, a nonnegative
continuous `f` whose weight `(R₀ - dist x x₀) * f x` is positive at an interior point attains
its maximal weight at an interior point `q`; on the ball about `q` of half the remaining
radius, `f` is at most `2 * f q`, and the rescaled radius is at least `M / 2`. -/
theorem exists_point_picking {X : Type*} [PseudoMetricSpace X] {x₀ : X} {R₀ : ℝ} {S : Set X}
    (hS : IsCompact S) (hSR : S ⊆ closedBall x₀ R₀) {f : X → ℝ} (hf : ContinuousOn f S)
    (hf0 : ∀ y ∈ S, 0 ≤ f y) {x : X} (hx : x ∈ S) (hxR : dist x x₀ < R₀) {M : ℝ}
    (hM : 0 < M) (hxM : (R₀ - dist x x₀) * f x = M) :
    ∃ q ∈ S, dist q x₀ < R₀ ∧
      (∀ y ∈ S, (R₀ - dist y x₀) * f y ≤ (R₀ - dist q x₀) * f q) ∧
      M ≤ (R₀ - dist q x₀) * f q ∧
      ball q ((R₀ - dist q x₀) / 2) ⊆ ball x₀ R₀ ∧
      M / 2 ≤ (R₀ - dist q x₀) / 2 * f q ∧
      ∀ y ∈ S ∩ ball q ((R₀ - dist q x₀) / 2), f y ≤ 2 * f q := by
  sorry

/-! ### MS7.4: the reaction term at `c = 1/3` -/

/-- With `c = 1/3` the reaction terms `2q² + (3 - 1/c) q s + (1 - 2c) s²` of the differential
inequality of MS7.4 dominate `(6/5) (q + s/3)²`; the difference is `(1/5) (2q - s)²`. -/
theorem six_fifths_mul_sq_le (q s : ℝ) :
    6 / 5 * (q + s / 3) ^ 2 ≤
      2 * q ^ 2 + (3 - 1 / (1 / 3 : ℝ)) * q * s + (1 - 2 * (1 / 3 : ℝ)) * s ^ 2 := by
  nlinarith [sq_nonneg (2 * q - s)]

/-! ### MS10.3: Hersch's conformal maps and the balancing lemma -/

/-- The conformal map `T_a` of the unit sphere of `ℝ³`, for `a` in the open unit ball
(MS10.3), as a map of the ambient space. -/
def herschMap (a x : EuclideanSpace ℝ (Fin 3)) : EuclideanSpace ℝ (Fin 3) :=
  (1 + inner ℝ a x)⁻¹ •
    (√(1 - ‖a‖ ^ 2) • x + (inner ℝ a x / (1 + √(1 - ‖a‖ ^ 2)) + 1) • a)

/-- `T₀` is the identity. -/
theorem herschMap_zero (x : EuclideanSpace ℝ (Fin 3)) : herschMap 0 x = x := by
  simp [herschMap]

/-- `T_a` preserves the unit sphere. -/
theorem norm_herschMap {a x : EuclideanSpace ℝ (Fin 3)} (ha : ‖a‖ < 1) (hx : ‖x‖ = 1) :
    ‖herschMap a x‖ = 1 := by
  sorry

/-- `T_(-a)` inverts `T_a` on the unit sphere. -/
theorem herschMap_neg_herschMap {a x : EuclideanSpace ℝ (Fin 3)} (ha : ‖a‖ < 1)
    (hx : ‖x‖ = 1) : herschMap (-a) (herschMap a x) = x := by
  sorry

/-- As `a` tends to a unit vector `v`, `T_a x` tends to `v` for every unit `x ≠ -v`. -/
theorem tendsto_herschMap {v x : EuclideanSpace ℝ (Fin 3)} (hv : ‖v‖ = 1) (hx : ‖x‖ = 1)
    (hxv : x ≠ -v) :
    Filter.Tendsto (fun a => herschMap a x) (nhdsWithin v (ball 0 1)) (nhds v) := by
  sorry

/-- **Hersch's balancing lemma** (MS10.3). For a nonzero finite measure and a measurable map
to the unit sphere of `ℝ³` whose fibres over single points are null, some `T_a` with `a` in
the open unit ball moves the centre of mass of the pushforward to the origin. Only the
fibres over the antipodes `-v` enter the proof. -/
theorem exists_integral_herschMap_eq_zero {S : Type*} [MeasurableSpace S] (μ : Measure S)
    [IsFiniteMeasure μ] (hμ : μ ≠ 0) (Φ : S → EuclideanSpace ℝ (Fin 3)) (hΦ : Measurable Φ)
    (hΦ1 : ∀ p, ‖Φ p‖ = 1) (hnull : ∀ v, ‖v‖ = 1 → μ (Φ ⁻¹' {-v}) = 0) :
    ∃ a : EuclideanSpace ℝ (Fin 3), ‖a‖ < 1 ∧ ∫ p, herschMap a (Φ p) ∂μ = 0 := by
  sorry

end TauCetiRoadmap.RiemannianGeometry.MinimalSurfaces
