import Mathlib
import TauCeti.Analysis.Contour.Winding.Number.Basic
import TauCeti.Geometry.Manifold.Riemannian.Conformal
import TauCeti.Geometry.Manifold.Orientation.Basic
import TauCeti.Geometry.Manifold.Riemannian.Geodesic.Exponential
import TauCeti.Geometry.Manifold.Riemannian.Pullback.Basic
import TauCeti.Geometry.Manifold.Riemannian.VolumeDensity.Conformal
import TauCeti.Geometry.Manifold.VectorBundle.CovariantDerivative.AlongCurve.Basic
import TauCeti.Geometry.Manifold.VectorBundle.CovariantDerivative.Curvature.Sectional
import TauCeti.Geometry.Manifold.VectorBundle.CovariantDerivative.LeviCivita.Regularity

/-!
# Local geometry of Riemannian surfaces: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. These signatures state the headlines that are statable against the pinned
libraries, on the actual exponential map, covariant derivative along curves, curvature,
winding number and `WithMetric` carriers. They do not replace the complete layers.
Unimplemented statements have honest `sorry` bodies; no free proposition field stands in for
a Jacobian, an angle or a cut time.

The ambient surface is boundaryless, as in `README.md`; domains with boundary and corners are
compact subsets of it.

One headline cannot yet be stated, for lack of a carrier: Layer 2.2, the integration formula
up to the normal cut time, needs the cut time of the normal exponential of a boundary arc of a
surface domain. Layer 6, the logarithmic cutoff, is specified in `README.md` and has no
signature here.

The rescaling identity of Layer 5.1 is proved here, since it follows from the two pinned
conformal lemmas; the remaining statements are targets.
-/

noncomputable section

namespace TauCetiRoadmap.RiemannianGeometry.Surfaces

open Set Bundle MeasureTheory
open scoped Manifold ContDiff

/-! ## Layer 1: polar coordinates and normal strips -/

section Surface

variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  {H : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ E H} [I.Boundaryless]
  {M : Type*} [MetricSpace M] [ChartedSpace H M] [IsManifold I ∞ M]
  [RiemannianBundle (fun x : M ↦ TangentSpace I x)]
  [IsContMDiffRiemannianBundle I ∞ E (fun x : M ↦ TangentSpace I x)]
  [IsRiemannianManifold I M]

open TauCeti TauCeti.Manifold CovariantDerivative

/-- Layer 1.1: the polar Jacobian `j(r) = |d(exp_p)_{r e}(r n)|` along the radial geodesic in
direction `e`, with `n ⊥ e`, on a metric normal ball of radius `R` with compact closure,
satisfies the Jacobi equation `j'' + K j = 0` with `j(0) = 0` and right derivative `1`. -/
theorem polar_jacobian_ode (hE : Module.finrank ℝ E = 2) (p : M) {R : ℝ} (hR : 0 < R)
    (hdom : Metric.ball (0 : TangentSpace I p) R ⊆ expDomain I M p)
    (hbij : BijOn (riemannianExp I M p) (Metric.ball 0 R) (Metric.ball p R))
    (hdist : ∀ v ∈ Metric.ball (0 : TangentSpace I p) R, dist p (riemannianExp I M p v) = ‖v‖)
    (hcpt : IsCompact (Metric.closedBall p R))
    (K : M → ℝ)
    (hK : ∀ x (u v : TangentSpace I x), LinearIndependent ℝ ![u, v] →
      (leviCivitaConnection I M).sectionalCurvature
        (isMetricCompatible_leviCivitaConnection I) x u v = K x)
    (e n : TangentSpace I p) (he : ‖e‖ = 1) (hn : ‖n‖ = 1) (hen : inner ℝ e n = 0) :
    let j : ℝ → ℝ := fun r ↦
      ‖mfderiv 𝓘(ℝ, TangentSpace I p) I (riemannianExp I M p) (r • e) (r • n)‖
    ContDiffOn ℝ ∞ j (Ioo 0 R) ∧ (∀ r ∈ Ioo 0 R, 0 < j r) ∧
      (∀ r ∈ Ioo 0 R, deriv (deriv j) r + K (riemannianExp I M p (r • e)) * j r = 0) ∧
      j 0 = 0 ∧ derivWithin j (Ici 0) 0 = 1 := by
  sorry

/-- Layer 1.2: along a smooth unit-speed curve `σ` with a smooth unit normal `n`, the
normal-strip Jacobian `a(s,t) = |∂_s exp_{σ(s)}(t n(s))|` satisfies `a(s,0) = 1`,
`a_t(s,0) = −k_g(s)` for the signed geodesic curvature `k_g = ⟨D_s σ′, n⟩`, and the Jacobi
equation `a_tt + K a = 0` wherever it is positive. -/
theorem normalStrip_jacobian (hE : Module.finrank ℝ E = 2)
    (σ : ℝ → M) (hσ : ContMDiff 𝓘(ℝ) I ∞ σ)
    (hunit : ∀ s, ‖curveVelocityWithin I σ univ s‖ = 1)
    (n : (s : ℝ) → TangentSpace I (σ s))
    (hn : ContMDiff 𝓘(ℝ) I.tangent ∞ (fun s ↦ TotalSpace.mk' E (σ s) (n s)))
    (hn1 : ∀ s, ‖n s‖ = 1) (hn0 : ∀ s, inner ℝ (n s) (curveVelocityWithin I σ univ s) = 0)
    {δ : ℝ} (hδ : 0 < δ) (hdom : ∀ s, ∀ t ∈ Ioo (-δ) δ, t • n s ∈ expDomain I M (σ s))
    (K : M → ℝ)
    (hK : ∀ x (u v : TangentSpace I x), LinearIndependent ℝ ![u, v] →
      (leviCivitaConnection I M).sectionalCurvature
        (isMetricCompatible_leviCivitaConnection I) x u v = K x) :
    let F : ℝ → ℝ → M := fun s t ↦ riemannianExp I M (σ s) (t • n s)
    let a : ℝ → ℝ → ℝ := fun s t ↦ ‖mfderiv 𝓘(ℝ) I (fun s' ↦ F s' t) s 1‖
    let kg : ℝ → ℝ := fun s ↦ inner ℝ
      (alongCurveWithin (leviCivitaConnection I M) σ (curveVelocityWithin I σ univ) univ s) (n s)
    ∀ s, a s 0 = 1 ∧ HasDerivAt (a s) (-kg s) 0 ∧
      ∀ t ∈ Ioo (-δ) δ, 0 < a s t → deriv (deriv (a s)) t + K (F s t) * a s t = 0 := by
  sorry

variable [MeasurableSpace M] [BorelSpace M] [LindelofSpace M]
  [IsContinuousRiemannianBundle E (fun x : M ↦ TangentSpace I x)]

/-- Layer 1.4: the polar length `L(r) = ∫₀^{2π} j(r,θ) dθ` and area `V(r) = Area(B_r(p))`
satisfy `L′(r) = 2π − ∫_{B_r(p)} K` and `V′(r) = L(r)` on a metric normal ball, with `e, n` an
orthonormal pair spanning `T_pM`. -/
theorem hasDerivAt_polarLength_and_volume_ball (hE : Module.finrank ℝ E = 2) (p : M)
    {R : ℝ} (hR : 0 < R)
    (hdom : Metric.ball (0 : TangentSpace I p) R ⊆ expDomain I M p)
    (hbij : BijOn (riemannianExp I M p) (Metric.ball 0 R) (Metric.ball p R))
    (hdist : ∀ v ∈ Metric.ball (0 : TangentSpace I p) R, dist p (riemannianExp I M p v) = ‖v‖)
    (hcpt : IsCompact (Metric.closedBall p R))
    (K : M → ℝ)
    (hK : ∀ x (u v : TangentSpace I x), LinearIndependent ℝ ![u, v] →
      (leviCivitaConnection I M).sectionalCurvature
        (isMetricCompatible_leviCivitaConnection I) x u v = K x)
    (e n : TangentSpace I p) (he : ‖e‖ = 1) (hn : ‖n‖ = 1) (hen : inner ℝ e n = 0) :
    let L : ℝ → ℝ := fun r ↦ ∫ θ in (0)..(2 * Real.pi),
      ‖mfderiv 𝓘(ℝ, TangentSpace I p) I (riemannianExp I M p)
        (r • (Real.cos θ • e + Real.sin θ • n)) (r • (-Real.sin θ • e + Real.cos θ • n))‖
    ∀ r ∈ Ioo 0 R,
      HasDerivAt L (2 * Real.pi - ∫ x in Metric.ball p r, K x ∂riemannianVolume I M) r ∧
      HasDerivAt (fun ρ ↦ (riemannianVolume I M (Metric.ball p ρ)).toReal) (L r) r := by
  sorry

end Surface

/-! ## Layer 3: Gauss–Bonnet for disks with corners -/

section Planar

/-- Layer 3.1: the signed turning theorem for a positively oriented piecewise `C²` unit-speed
planar Jordan curve with corners at the finite set `T` of parameters in `[0, L)`, integrable
signed curvature on the smooth pieces, exterior angles in `(-π, π)` and no cusps. -/
theorem integral_signedCurvature_add_sum_exteriorAngle_eq_two_pi (γ : ℝ → ℂ) {L : ℝ}
    (hL : 0 < L) (hper : Function.Periodic γ L) (hcont : Continuous γ)
    (hinj : InjOn γ (Ico 0 L)) (T : Finset ℝ) (hT : (T : Set ℝ) ⊆ Ico 0 L)
    (hγ : ContDiffOn ℝ 2 γ {t | ∀ s ∈ T, ∀ k : ℤ, t ≠ s + k * L})
    (hunit : ∀ t, (∀ s ∈ T, ∀ k : ℤ, t ≠ s + k * L) → ‖deriv γ t‖ = 1)
    (hk : IntervalIntegrable (fun t ↦ (deriv (deriv γ) t * (starRingEnd ℂ) (deriv γ t)).im)
      volume 0 L)
    (hleft : ∀ s ∈ T, DifferentiableWithinAt ℝ γ (Iic s) s ∧ ‖derivWithin γ (Iic s) s‖ = 1)
    (hright : ∀ s ∈ T, DifferentiableWithinAt ℝ γ (Ici s) s ∧ ‖derivWithin γ (Ici s) s‖ = 1)
    (hcusp : ∀ s ∈ T, derivWithin γ (Ici s) s ≠ -derivWithin γ (Iic s) s)
    {z : ℂ} (hz : TauCeti.Contour.windingNumber γ 0 L z = 1) :
    (∫ t in (0)..L, (deriv (deriv γ) t * (starRingEnd ℂ) (deriv γ t)).im) +
      ∑ s ∈ T, Complex.arg (derivWithin γ (Ici s) s / derivWithin γ (Iic s) s) =
        2 * Real.pi := by
  sorry

end Planar

section DiskGaussBonnet

variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  {H : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ E H} [I.Boundaryless]
  {M : Type*} [MetricSpace M] [ChartedSpace H M] [IsManifold I ∞ M]
  [RiemannianBundle (fun x : M ↦ TangentSpace I x)]
  [IsContMDiffRiemannianBundle I ∞ E (fun x : M ↦ TangentSpace I x)]
  [IsRiemannianManifold I M] [MeasurableSpace M] [BorelSpace M] [LindelofSpace M]
  [IsContinuousRiemannianBundle E (fun x : M ↦ TangentSpace I x)]

open TauCeti TauCeti.Manifold CovariantDerivative Filter Topology

/-- Layer 3.2: Gauss–Bonnet for a compact disk `D` in an oriented surface whose boundary is a
piecewise `C²` unit-speed Jordan curve `c` with corners at `T` and integrable `k_g`, with `D` on
its left: `k_g` is taken against the inward conormal `J c′`, `J` the rotation by `+π/2` of the
oriented tangent plane, and the exterior angles are the oriented angles from the left to the
right tangent. -/
theorem integral_curvature_add_integral_geodesicCurvature_add_sum_exteriorAngle_eq_two_pi
    (o : TauCeti.Manifold.Orientation I M (Fin 2))
    [∀ x : M, Fact (Module.finrank ℝ (TangentSpace I x) = 2)] (K : M → ℝ)
    (hK : ∀ x (u v : TangentSpace I x), LinearIndependent ℝ ![u, v] →
      (leviCivitaConnection I M).sectionalCurvature
        (isMetricCompatible_leviCivitaConnection I) x u v = K x)
    {D : Set M} (hD : IsCompact D) (hdisk : Nonempty (D ≃ₜ Metric.closedBall (0 : ℂ) 1))
    (c : ℝ → M) {L : ℝ} (hL : 0 < L) (hper : Function.Periodic c L) (hcont : Continuous c)
    (hinj : InjOn c (Ico 0 L)) (hfr : frontier D = range c)
    (T : Finset ℝ) (hT : (T : Set ℝ) ⊆ Ico 0 L)
    (hc : ContMDiffOn 𝓘(ℝ) I 2 c {t | ∀ s ∈ T, ∀ k : ℤ, t ≠ s + k * L})
    (hunit : ∀ t, (∀ s ∈ T, ∀ k : ℤ, t ≠ s + k * L) → ‖curveVelocityWithin I c univ t‖ = 1)
    (hleft : ∀ s ∈ T, MDifferentiableWithinAt 𝓘(ℝ) I c (Iic s) s ∧
      ‖curveVelocityWithin I c (Iic s) s‖ = 1)
    (hright : ∀ s ∈ T, MDifferentiableWithinAt 𝓘(ℝ) I c (Ici s) s ∧
      ‖curveVelocityWithin I c (Ici s) s‖ = 1)
    (hcusp : ∀ s ∈ T, curveVelocityWithin I c (Ici s) s ≠ -curveVelocityWithin I c (Iic s) s)
    (hin : ∀ t, (∀ s ∈ T, ∀ k : ℤ, t ≠ s + k * L) →
      ∀ᶠ ε in 𝓝[>] (0 : ℝ), riemannianExp I M (c t)
        (ε • (o.orientationAt (c t)).rightAngleRotation (curveVelocityWithin I c univ t)) ∈
          interior D)
    (hk : IntervalIntegrable (fun t ↦ inner ℝ
        (alongCurveWithin (leviCivitaConnection I M) c (curveVelocityWithin I c univ) univ t)
        ((o.orientationAt (c t)).rightAngleRotation (curveVelocityWithin I c univ t))) volume 0 L) :
    (∫ x in D, K x ∂riemannianVolume I M) +
      (∫ t in (0)..L, inner ℝ
          (alongCurveWithin (leviCivitaConnection I M) c (curveVelocityWithin I c univ) univ t)
          ((o.orientationAt (c t)).rightAngleRotation (curveVelocityWithin I c univ t))) +
      ∑ s ∈ T, ((o.orientationAt (c s)).oangle (curveVelocityWithin I c (Iic s) s)
          (curveVelocityWithin I c (Ici s) s)).toReal = 2 * Real.pi := by
  sorry

end DiskGaussBonnet

/-! ## Layer 4: normal balls in nonpositive curvature -/

section DiskFilling

variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  {H : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ E H} [I.Boundaryless]
  {M : Type*} [TopologicalSpace M] [T2Space M] [ChartedSpace H M] [IsManifold I ∞ M]

/-- Layer 4.1: in a simply connected open set `B` lying in the source of one chart of the
maximal atlas of a surface, a simple closed curve bounds a compact disk `D ⊆ B`: `D` is compact,
its frontier is the trace of the curve, and `D` is homeomorphic to the closed unit disk. -/
theorem exists_disk_of_simpleClosedCurve (hE : Module.finrank ℝ E = 2) {B : Set M}
    (hB : IsOpen B) (hsc : SimplyConnectedSpace B)
    (hchart : ∃ e ∈ IsManifold.maximalAtlas I ∞ M, B ⊆ e.source)
    (c : ℝ → M) {L : ℝ} (hL : 0 < L) (hper : Function.Periodic c L) (hcont : Continuous c)
    (hinj : InjOn c (Ico 0 L)) (hcB : range c ⊆ B) :
    ∃ D ⊆ B, IsCompact D ∧ frontier D = range c ∧
      Nonempty (D ≃ₜ Metric.closedBall (0 : ℂ) 1) := by
  sorry

end DiskFilling

section NormalBall

variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  {H : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ E H} [I.Boundaryless]
  {M : Type*} [MetricSpace M] [ChartedSpace H M] [IsManifold I ∞ M]
  [RiemannianBundle (fun x : M ↦ TangentSpace I x)]
  [IsContMDiffRiemannianBundle I ∞ E (fun x : M ↦ TangentSpace I x)]
  [IsRiemannianManifold I M]

open TauCeti TauCeti.Manifold CovariantDerivative

/-- Layer 4.2: on a simply connected open `R`-ball lying in the source of one chart of the
maximal atlas, with compact closed ball and `K ≤ 0` on the open ball, `exp_p` is a
diffeomorphism from the tangent `R`-ball onto the open ball, with radial length equal to
distance. -/
theorem riemannianExp_bijOn_ball_of_curvature_nonpos (hE : Module.finrank ℝ E = 2)
    (p : M) {R : ℝ} (hR : 0 < R) (hcpt : IsCompact (Metric.closedBall p R))
    (hK : ∀ x ∈ Metric.ball p R, ∀ u v : TangentSpace I x, LinearIndependent ℝ ![u, v] →
      (leviCivitaConnection I M).sectionalCurvature
        (isMetricCompatible_leviCivitaConnection I) x u v ≤ 0)
    (hsc : SimplyConnectedSpace (Metric.ball p R))
    (hchart : ∃ e ∈ IsManifold.maximalAtlas I ∞ M, Metric.ball p R ⊆ e.source) :
    Metric.ball (0 : TangentSpace I p) R ⊆ expDomain I M p ∧
      BijOn (riemannianExp I M p) (Metric.ball 0 R) (Metric.ball p R) ∧
      (∀ v ∈ Metric.ball (0 : TangentSpace I p) R,
        Function.Injective (mfderiv 𝓘(ℝ, TangentSpace I p) I (riemannianExp I M p) v)) ∧
      ∀ v ∈ Metric.ball (0 : TangentSpace I p) R, dist p (riemannianExp I M p v) = ‖v‖ := by
  sorry

end NormalBall

/-! ## Layer 5: conformal invariance of the surface Dirichlet energy -/

section Conformal

open TauCeti TauCeti.WithMetric TauCeti.Manifold

variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  {H : Type*} [TopologicalSpace H] {I : ModelWithCorners ℝ E H} {n : ℕ∞ω}
  {M : Type*} [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M] [LindelofSpace M]
  {g : ContMDiffRiemannianMetric I n E (fun x : M ↦ TangentSpace I x)}

/-- Layer 5.1: the surface Dirichlet energy is unchanged by a conformal rescaling, for every
`φ`. -/
theorem integral_norm_mgradient_sq_rescale (hE : Module.finrank ℝ E = 2)
    (f : M → ℝ) (hf : ContMDiff I 𝓘(ℝ) n f) (hf_pos : ∀ x, 0 < f x) (φ : M → ℝ) :
    ∫ x, ‖mgradient I (φ ∘ ofWithMetric) x‖ ^ 2
        ∂riemannianVolume I (WithMetric (g.rescale f hf hf_pos)) =
      ∫ x, ‖mgradient I (φ ∘ ofWithMetric) x‖ ^ 2 ∂riemannianVolume I (WithMetric g) := by
  refine (integral_riemannianVolume_rescale (g := g) (hf := hf) (hf_pos := hf_pos)
    (fun y ↦ ‖mgradient I (φ ∘ ofWithMetric) (toWithMetric (g.rescale f hf hf_pos) y)‖ ^ 2)).trans
    ?_
  congr 1
  funext x
  rw [← real_inner_self_eq_norm_sq, ← real_inner_self_eq_norm_sq, hE, inner_mgradient_rescale]
  simp [smul_eq_mul, (hf_pos _).ne']

variable {H' : Type*} [TopologicalSpace H'] {J : ModelWithCorners ℝ E H'}
  {N : Type*} [TopologicalSpace N] [ChartedSpace H' N] [IsManifold J ∞ N] [LindelofSpace N]
  {gN : ContMDiffRiemannianMetric J n E (fun y : N ↦ TangentSpace J y)}

/-- Layer 5.2: a conformal diffeomorphism `Φ : (M, g) → (N, g_N)` of surfaces modelled on one
model vector space, `Φ^* g_N = f g`, preserves the surface Dirichlet energy,
`E_g(φ ∘ Φ) = E_{g_N}(φ)`. -/
theorem integral_norm_mgradient_sq_comp_eq_of_pullback_eq_rescale
    (hE : Module.finrank ℝ E = 2)
    (Φ : M ≃ₘ^∞⟮I, J⟯ N) (hΦ : ContMDiff I J (n + 1) Φ)
    (hinj : ∀ x, Function.Injective (mfderiv I J Φ x))
    (f : M → ℝ) (hf : ContMDiff I 𝓘(ℝ) n f) (hf_pos : ∀ x, 0 < f x)
    (hconf : gN.pullback Φ hΦ hinj = g.rescale f hf hf_pos) (φ : N → ℝ) :
    ∫ x, ‖mgradient I (φ ∘ Φ ∘ ofWithMetric) x‖ ^ 2 ∂riemannianVolume I (WithMetric g) =
      ∫ y, ‖mgradient J (φ ∘ ofWithMetric) y‖ ^ 2 ∂riemannianVolume J (WithMetric gN) := by
  sorry

end Conformal

end TauCetiRoadmap.RiemannianGeometry.Surfaces
