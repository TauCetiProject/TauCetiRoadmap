import Mathlib
import TauCeti.Geometry.Manifold.Riemannian.Laplacian

/-!
# Minimal surfaces: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. These signatures state the targets of the sub-roadmap that are statable against
the pinned Mathlib and Tau Ceti: the half-space theorem (4.2), the point-picking lemma (5.4),
Bernstein's theorem (7.6), and the conformal maps and the balancing lemma of Hersch (10.3).
Unimplemented statements have honest `sorry` bodies.

In the half-space theorem a minimal immersion into `ℝ³` is an isometric immersion whose
coordinate functions are harmonic for `TauCeti.Manifold.laplaceBeltrami`, which is MS1's
characterization of minimality in a Euclidean space.

The other headlines of `README.md` are not statable at the pins, for lack of the carriers of
RiemannianGeometry R5a and R5b named below. `TauCeti.secondFundamentalForm` is the second
fundamental form of a map from a finite-dimensional normed space into an inner product space;
the pins have no second fundamental form, mean curvature, normal connection or second
variation of volume of an immersion of a manifold into a Riemannian manifold.

- ε-regularity (5.1) needs the second fundamental form `A` of an immersed surface with
  boundary, for `∫ |A|²` and `|A|²(q)`.
- Compactness under bounded area and curvature (5.2) needs the mean curvature and `|A|` of a
  hypersurface of a Riemannian manifold.
- The Morse index (6.1) needs the normal bundle of a minimal immersion with its normal
  connection, and the index form of the second variation of volume.
- Instability under `Ric > 0` (6.4) needs the mean curvature and `|A|` of a two-sided
  hypersurface of a Riemannian manifold, for the stability form.
- The curvature estimate for stable surfaces (7.5) needs `|A|` and the stability form of a
  two-sided minimal immersion.
- Removable singularities (8.1) and compactness under bounded total curvature (9.1) need the
  mean curvature and `|A|` of a surface in a Riemannian three-manifold.
- Frankel's theorem (11.2) needs the mean curvature of an immersion into a Riemannian
  manifold.
- Choi–Schoen compactness (12.1) needs the mean curvature of an embedded surface in a
  Riemannian three-manifold.
-/

noncomputable section

open MeasureTheory Metric Bundle
open scoped Manifold ContDiff

namespace TauCetiRoadmap.RiemannianGeometry.MinimalSurfaces

/-! ### MS4.2: the half-space theorem -/

/-- **Half-space theorem** (MS4.2). A proper isometric immersion of a connected nonempty surface
into `ℝ³` with harmonic coordinates, that is a proper minimal immersion (MS1), whose image lies in
`{x₃ ≥ 0}` has a horizontal plane as its image. -/
theorem range_eq_plane_of_minimal_of_nonneg {S : Type*} [TopologicalSpace S]
    [ChartedSpace (EuclideanSpace ℝ (Fin 2)) S] [IsManifold (𝓡 2) ∞ S]
    [ConnectedSpace S] [Nonempty S]
    [RiemannianBundle (fun x : S ↦ TangentSpace (𝓡 2) x)]
    [IsContMDiffRiemannianBundle (𝓡 2) 1 (EuclideanSpace ℝ (Fin 2))
      (fun x : S ↦ TangentSpace (𝓡 2) x)]
    {f : S → EuclideanSpace ℝ (Fin 3)}
    (hf : ContMDiff (𝓡 2) 𝓘(ℝ, EuclideanSpace ℝ (Fin 3)) ∞ f)
    (hiso : ∀ (x : S) (v w : TangentSpace (𝓡 2) x),
      inner ℝ (mfderiv (𝓡 2) 𝓘(ℝ, EuclideanSpace ℝ (Fin 3)) f x v)
        (mfderiv (𝓡 2) 𝓘(ℝ, EuclideanSpace ℝ (Fin 3)) f x w) = inner ℝ v w)
    (hmin : ∀ (i : Fin 3) (x : S),
      TauCeti.Manifold.laplaceBeltrami (𝓡 2) (fun y ↦ f y i) x = 0)
    (hprop : IsProperMap f) (hhalf : ∀ x, 0 ≤ f x 2) :
    ∃ c : ℝ, Set.range f = {y | y 2 = c} := by
  sorry

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

/-! ### MS7.6: Bernstein's theorem -/

/-- **Bernstein's theorem** (MS7.6). A `C²` solution of the minimal-surface equation
`(1 + u_y²) u_xx − 2 u_x u_y u_xy + (1 + u_x²) u_yy = 0` on all of `ℝ²` is affine. -/
theorem exists_affine_of_minimalSurfaceEquation {u : ℝ × ℝ → ℝ} (hu : ContDiff ℝ 2 u)
    (hmse : ∀ p : ℝ × ℝ,
      (1 + (fderiv ℝ u p (0, 1)) ^ 2) * fderiv ℝ (fderiv ℝ u) p (1, 0) (1, 0)
        - 2 * fderiv ℝ u p (1, 0) * fderiv ℝ u p (0, 1) * fderiv ℝ (fderiv ℝ u) p (1, 0) (0, 1)
        + (1 + (fderiv ℝ u p (1, 0)) ^ 2) * fderiv ℝ (fderiv ℝ u) p (0, 1) (0, 1) = 0) :
    ∃ a b c : ℝ, ∀ x y : ℝ, u (x, y) = a * x + b * y + c := by
  sorry

/-! ### MS10.3: Hersch's conformal maps and the balancing lemma -/

/-- The conformal map `T_a` of the unit sphere of `ℝ³`, for `a` in the open unit ball
(MS10.3), as a map of the ambient space. -/
def herschMap (a x : EuclideanSpace ℝ (Fin 3)) : EuclideanSpace ℝ (Fin 3) :=
  (1 + inner ℝ a x)⁻¹ •
    (√(1 - ‖a‖ ^ 2) • x + (inner ℝ a x / (1 + √(1 - ‖a‖ ^ 2)) + 1) • a)

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
