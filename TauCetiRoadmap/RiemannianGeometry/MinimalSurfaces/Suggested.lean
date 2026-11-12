import Mathlib
import TauCeti.Geometry.Manifold.Riemannian.Laplacian
import TauCeti.Geometry.Manifold.Riemannian.VolumeDensity.Volume

/-!
# Minimal surfaces: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. These signatures state the targets of the sub-roadmap that are statable against
the pinned Mathlib and Tau Ceti: the half-space theorem (4.2), ε-regularity in `ℝ³` (5.1),
the curvature estimate for stable minimal surfaces in `ℝ³` (7.5), Bernstein's theorem (7.6),
and the conformal maps and the balancing lemma of Hersch (10.3). Unimplemented statements have
honest `sorry` bodies.

In `ℝ³` a minimal immersion is an isometric immersion whose coordinate functions are harmonic
for `TauCeti.Manifold.laplaceBeltrami`, which is MS1's characterization of minimality in a
Euclidean space, and `|A|²` of an isometric immersion is `hessianCoordNormSq`, the sum of the
squared Hessians of the coordinate functions (MS1).

The other headlines of `README.md` are not statable at the pins, for lack of the carriers of
RiemannianGeometry R5a and R5b named below. `TauCeti.secondFundamentalForm` is the second
fundamental form of a map from a finite-dimensional normed space into an inner product space;
the pins have no second fundamental form, mean curvature, normal connection or second
variation of volume of an immersion of a manifold into a Riemannian manifold.

- ε-regularity (5.1) and the curvature estimate (7.5) are stated in `ℝ³`, `|A|²` of an
  isometric immersion being `hessianCoordNormSq`; their Riemannian forms need `A` and
  `Ric_N(ν,ν)` of a surface in a Riemannian three-manifold.
- Compactness under bounded area and curvature (5.2) needs the mean curvature and `|A|` of a
  hypersurface of a Riemannian manifold.
- The Morse index (6.1) needs the normal bundle of a minimal immersion with its normal
  connection, and the index form of the second variation of volume.
- Instability under `Ric > 0` (6.4) needs the mean curvature and `|A|` of a two-sided
  hypersurface of a Riemannian manifold, for the stability form.
- Removable singularities (8.1) and compactness under bounded total curvature (9.1) need the
  mean curvature and `|A|` of a surface in a Riemannian three-manifold.
- Frankel's theorem (11.2) needs the mean curvature of an immersion into a Riemannian
  manifold.
- Choi–Schoen compactness (12.1) needs the mean curvature of an embedded surface in a
  Riemannian three-manifold.
-/

noncomputable section

open MeasureTheory Metric Bundle
open scoped Manifold ContDiff ENNReal

namespace TauCetiRoadmap.RiemannianGeometry.MinimalSurfaces

/-! ## Layer 4: the half-space theorem -/

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

/-! ## Layer 5 and Layer 7: ε-regularity and the curvature estimate in `ℝ³` -/

/-- `Σᵢ |Hess fᵢ|²(x)` for a map `f` of a Riemannian surface into `ℝ³`. For an isometric
immersion it is `|A|²(x)`, since `Hess fᵢ = ⟨II, eᵢ⟩` (MS1). -/
def hessianCoordNormSq {S : Type*} [TopologicalSpace S]
    [ChartedSpace (EuclideanSpace ℝ (Fin 2)) S] [IsManifold (𝓡 2) 2 S]
    [RiemannianBundle (fun x : S ↦ TangentSpace (𝓡 2) x)]
    [IsContMDiffRiemannianBundle (𝓡 2) 1 (EuclideanSpace ℝ (Fin 2))
      (fun x : S ↦ TangentSpace (𝓡 2) x)]
    (f : S → EuclideanSpace ℝ (Fin 3)) (x : S) : ℝ :=
  ∑ i : Fin 3, ∑ j, ∑ k, TauCeti.Manifold.hessian (𝓡 2) (fun y ↦ f y i) x
    (stdOrthonormalBasis ℝ (TangentSpace (𝓡 2) x) j)
    (stdOrthonormalBasis ℝ (TangentSpace (𝓡 2) x) k) ^ 2

/-- **ε-regularity in `ℝ³`** (MS5.1). There are universal `ε, C₀ > 0` such that a minimal
immersion of a surface that is proper into the open ball `B_r(x₀)` and has total curvature at
most `ε` satisfies `σ² |A|²(q) ≤ C₀ ∫ |A|²` whenever `f q ∈ B_(r−σ)(x₀)`. -/
theorem exists_sq_mul_hessianCoordNormSq_le_lintegral : ∃ ε C₀ : ℝ, 0 < ε ∧ 0 < C₀ ∧
    ∀ (S : Type) [TopologicalSpace S] [ChartedSpace (EuclideanSpace ℝ (Fin 2)) S]
    [IsManifold (𝓡 2) ∞ S] [RiemannianBundle (fun x : S ↦ TangentSpace (𝓡 2) x)]
    [IsContMDiffRiemannianBundle (𝓡 2) 1 (EuclideanSpace ℝ (Fin 2))
      (fun x : S ↦ TangentSpace (𝓡 2) x)]
    [IsContinuousRiemannianBundle (EuclideanSpace ℝ (Fin 2)) (fun x : S ↦ TangentSpace (𝓡 2) x)]
    [MeasurableSpace S] [BorelSpace S] [SecondCountableTopology S]
    (f : S → EuclideanSpace ℝ (Fin 3)) (x₀ : EuclideanSpace ℝ (Fin 3)) (r : ℝ),
    ContMDiff (𝓡 2) 𝓘(ℝ, EuclideanSpace ℝ (Fin 3)) ∞ f →
    (∀ (x : S) (v w : TangentSpace (𝓡 2) x),
      inner ℝ (mfderiv (𝓡 2) 𝓘(ℝ, EuclideanSpace ℝ (Fin 3)) f x v)
        (mfderiv (𝓡 2) 𝓘(ℝ, EuclideanSpace ℝ (Fin 3)) f x w) = inner ℝ v w) →
    (∀ (i : Fin 3) (x : S), TauCeti.Manifold.laplaceBeltrami (𝓡 2) (fun y ↦ f y i) x = 0) →
    (∀ q, f q ∈ ball x₀ r) → (∀ K ⊆ ball x₀ r, IsCompact K → IsCompact (f ⁻¹' K)) →
    ∫⁻ x, ENNReal.ofReal (hessianCoordNormSq f x) ∂TauCeti.riemannianVolume (𝓡 2) S ≤
      ENNReal.ofReal ε →
    ∀ (σ : ℝ) (q : S), 0 < σ → dist (f q) x₀ < r - σ →
      σ ^ 2 * hessianCoordNormSq f q ≤ C₀ *
        (∫⁻ x, ENNReal.ofReal (hessianCoordNormSq f x)
          ∂TauCeti.riemannianVolume (𝓡 2) S).toReal := by
  sorry

/-- **Curvature estimate for stable minimal surfaces in `ℝ³`** (MS7.5). There is a universal
`C` such that a minimal immersion of a surface into `ℝ³` satisfying the stability inequality
`∫ |A|² φ² ≤ ∫ |∇φ|²` has `R² |A|²(p) ≤ C` whenever the intrinsic ball `B̄_R(p)` is compact. -/
theorem exists_sq_mul_hessianCoordNormSq_le_of_stable : ∃ C : ℝ, ∀ (S : Type) [MetricSpace S]
    [ChartedSpace (EuclideanSpace ℝ (Fin 2)) S] [IsManifold (𝓡 2) ∞ S]
    [RiemannianBundle (fun x : S ↦ TangentSpace (𝓡 2) x)]
    [IsContMDiffRiemannianBundle (𝓡 2) 1 (EuclideanSpace ℝ (Fin 2))
      (fun x : S ↦ TangentSpace (𝓡 2) x)]
    [IsContinuousRiemannianBundle (EuclideanSpace ℝ (Fin 2)) (fun x : S ↦ TangentSpace (𝓡 2) x)]
    [IsRiemannianManifold (𝓡 2) S] [MeasurableSpace S] [BorelSpace S] [SecondCountableTopology S]
    (f : S → EuclideanSpace ℝ (Fin 3)),
    ContMDiff (𝓡 2) 𝓘(ℝ, EuclideanSpace ℝ (Fin 3)) ∞ f →
    (∀ (x : S) (v w : TangentSpace (𝓡 2) x),
      inner ℝ (mfderiv (𝓡 2) 𝓘(ℝ, EuclideanSpace ℝ (Fin 3)) f x v)
        (mfderiv (𝓡 2) 𝓘(ℝ, EuclideanSpace ℝ (Fin 3)) f x w) = inner ℝ v w) →
    (∀ (i : Fin 3) (x : S), TauCeti.Manifold.laplaceBeltrami (𝓡 2) (fun y ↦ f y i) x = 0) →
    (∀ φ : S → ℝ, ContMDiff (𝓡 2) 𝓘(ℝ) ∞ φ → HasCompactSupport φ →
      ∫ x, hessianCoordNormSq f x * φ x ^ 2 ∂TauCeti.riemannianVolume (𝓡 2) S ≤
        ∫ x, ‖TauCeti.Manifold.mgradient (𝓡 2) φ x‖ ^ 2 ∂TauCeti.riemannianVolume (𝓡 2) S) →
    ∀ (p : S) (R : ℝ), 0 < R → IsCompact (closedBall p R) →
      R ^ 2 * hessianCoordNormSq f p ≤ C := by
  sorry

/-! ## Layer 7: stability and the curvature estimate -/

/-- **Bernstein's theorem** (MS7.6). A `C²` solution of the minimal-surface equation
`(1 + u_y²) u_xx − 2 u_x u_y u_xy + (1 + u_x²) u_yy = 0` on all of `ℝ²` is affine. -/
theorem exists_affine_of_minimalSurfaceEquation {u : ℝ × ℝ → ℝ} (hu : ContDiff ℝ 2 u)
    (hmse : ∀ p : ℝ × ℝ,
      (1 + (fderiv ℝ u p (0, 1)) ^ 2) * fderiv ℝ (fderiv ℝ u) p (1, 0) (1, 0)
        - 2 * fderiv ℝ u p (1, 0) * fderiv ℝ u p (0, 1) * fderiv ℝ (fderiv ℝ u) p (1, 0) (0, 1)
        + (1 + (fderiv ℝ u p (1, 0)) ^ 2) * fderiv ℝ (fderiv ℝ u) p (0, 1) (0, 1) = 0) :
    ∃ a b c : ℝ, ∀ x y : ℝ, u (x, y) = a * x + b * y + c := by
  sorry

/-! ## Layer 10: eigenvalue estimates and area bounds -/

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
