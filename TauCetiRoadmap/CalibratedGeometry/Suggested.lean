module

public import Mathlib
public import TauCeti.Analysis.InnerProductSpace.AlternatingForm
public import TauCeti.Geometry.Manifold.Complex.Orientation
public import TauCeti.Geometry.Manifold.DifferentialForm.ExtDeriv
public import TauCeti.Geometry.Manifold.DifferentialForm.Integration.TopForm
public import TauCeti.Geometry.Manifold.DifferentialForm.Pullback.Basic
public import TauCeti.Geometry.Manifold.DifferentialForm.Smooth
public import TauCeti.Geometry.Manifold.Riemannian.HodgeStar
public import TauCeti.Geometry.Manifold.Riemannian.Pullback.Basic
public import TauCeti.Geometry.Manifold.Riemannian.VolumeForm

/-!
# Calibrated geometry: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems that are statable against the pinned Mathlib and Tau Ceti, each with `sorry`, together
with the few definitions they need: on native continuous alternating maps and orthonormal families
for the linear algebra, and on Tau Ceti's differential forms, top-form integration, pullback
metrics, Riemannian volume forms, the rough Hodge star, the pointwise inner product of forms and
complex manifolds for the manifold statements. The linear calibration inequality
`|φ v| ≤ ‖φ‖ · ‖v₁ ∧ ⋯ ∧ vₖ‖` and the simple-vector characterization of the operator norm as the
comass are Tau Ceti's (`ContinuousAlternatingMap.le_opNorm_mul_norm_ιMulti`,
`ContinuousAlternatingMap.opNorm_le_iff_le_mul_norm_ιMulti`) and are not restated.

Headline theorems of the roadmap that are not statable at the pins:

* the chain form of the fundamental theorem of calibrations (a calibrated compact oriented
  submanifold with boundary has least volume among competitors differing from it by the boundary
  of a finite integral smooth chain, Layer 3): it needs the integral fundamental chain of an
  ordered relative smooth triangulation (2.4), the mass of smooth chains and Stokes' theorem for
  smooth chains. The pins have smooth simplices with their integrals (`TauCeti.SmoothSimplex`,
  `TauCeti.SmoothSimplex.integral`) and smooth triangulations (`TauCeti.IsSmoothTriangulation`),
  but none of these three. The real-homology form on closed sources is stated below;
* McLean's theorem that the special Lagrangian deformations of a compact special Lagrangian `N`
  form a smooth manifold of dimension `b₁(N)` with tangent space the harmonic one-forms (Layer 6):
  the pins have no space of embedded submanifolds near `N` modulo reparametrization with its `C¹`
  quotient topology, which is the carrier of the statement;
* the identification of the normal Jacobi operator of a compact special Lagrangian immersion,
  which is RiemannianGeometry R5b's, with the Hodge Laplacian on one-forms (Layer 6): the pins
  have no Jacobi operator of a minimal immersion into a Riemannian manifold, nor its normal
  connection, normal Laplacian, ambient curvature term and second-fundamental-form term. The
  second-variation identity that gives the two operators the same quadratic form is stated below
  (`secondVariation_volume_eq_hodgeEnergy`), on the pinned rough Hodge star
  `TauCeti.RoughForm.hodgeStar` and inner product of forms `TauCeti.alternatingFormInner`.
-/

@[expose] public section

noncomputable section

open Bundle TauCeti
open scoped Manifold ContDiff TauCeti.ComplexManifold

namespace TauCetiRoadmap.CalibratedGeometry

/-! ## Layer 1: Comass and equality planes -/

/-- An ordered frame `v` is calibrated by the `k`-form `φ` when it is orthonormal and `φ v = 1`;
for a form of comass at most one these are the positively oriented equality planes of `φ`. -/
def IsCalibratedFrame {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E] {k : ℕ}
    (φ : E [⋀^Fin k]→L[ℝ] ℝ) (v : Fin k → E) : Prop :=
  Orthonormal ℝ v ∧ φ v = 1

/-- Comass equals the native norm: on a finite-dimensional real inner-product space, the operator
norm of a continuous alternating `k`-form is the supremum of `|φ v|` over orthonormal frames `v`
(for `k > dim E` both sides are zero, and for `k = 0` both are `|φ ![]|`). This is the
orthonormal-frame form of Tau Ceti's simple-vector characterization
`ContinuousAlternatingMap.opNorm_le_iff_le_mul_norm_ιMulti`. -/
theorem norm_eq_sSup_abs_orthonormal {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
    [FiniteDimensional ℝ E] {k : ℕ} (φ : E [⋀^Fin k]→L[ℝ] ℝ) :
    ‖φ‖ = sSup {r | ∃ v : Fin k → E, Orthonormal ℝ v ∧ r = |φ v|} := by
  sorry

/-! ## Layer 2: Calibrated immersions and integral smooth chains -/

section Manifolds

variable {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  [TopologicalSpace H] {I : ModelWithCorners ℝ E H} [TopologicalSpace M] [ChartedSpace H M]
  [IsManifold I ∞ M]
  {E' H' N : Type*} [NormedAddCommGroup E'] [NormedSpace ℝ E'] [FiniteDimensional ℝ E']
  [TopologicalSpace H'] {I' : ModelWithCorners ℝ E' H'} [TopologicalSpace N] [ChartedSpace H' N]
  [IsManifold I' ∞ N]
  {E'' H'' N' : Type*} [NormedAddCommGroup E''] [NormedSpace ℝ E''] [FiniteDimensional ℝ E'']
  [TopologicalSpace H''] {I'' : ModelWithCorners ℝ E'' H''} [TopologicalSpace N']
  [ChartedSpace H'' N'] [IsManifold I'' ∞ N']

/-- A smooth calibration for the smooth Riemannian metric `g` on `M`: a smooth closed real
`k`-form `φ` of comass at most one at every point, that is `|φ_x(v)| ≤ 1` for every
`g_x`-orthonormal frame `v` of `T_xM` (Joyce2001SLLectures line 58; Harvey–Lawson 1982,
Definition II.4.1, p. 59). In degree zero this is a locally constant function with values in
`[−1, 1]`. -/
def IsCalibration (g : ContMDiffRiemannianMetric I ∞ E (fun x : M ↦ TangentSpace I x)) {k : ℕ}
    (φ : RoughForm I M ℝ k) : Prop :=
  IsSmoothForm I ∞ φ ∧ mextDeriv φ = 0 ∧
    ∀ x (v : Fin k → TangentSpace I x),
      (∀ i j, g.inner x (v i) (v j) = if i = j then 1 else 0) → |φ x v| ≤ 1

/-- The volume of a smooth immersion `f : N → M` of an oriented `k`-manifold: the integral over
`N`, against its orientation `o`, of the Riemannian volume form of the pulled-back metric `f*g`.
It does not depend on the orientation chosen. -/
def immersionVolume {k : ℕ} (g : ContMDiffRiemannianMetric I ∞ E (fun x : M ↦ TangentSpace I x))
    (f : N → M) (hf : ContMDiff I' I ∞ f) (hinj : ∀ x, Function.Injective (mfderiv I' I f x))
    (o : Manifold.Orientation I' N (Fin k)) : ℝ :=
  letI : RiemannianBundle (fun x : N ↦ TangentSpace I' x) :=
    ⟨(g.pullback f (by simpa using hf) hinj).toRiemannianMetric⟩
  integralTopForm o (riemannianVolumeForm o)

/-- The oriented immersion `f` is calibrated by the `k`-form `φ`: `f*φ` is the Riemannian volume
form of the pulled-back metric `f*g` for the orientation `o`. -/
def IsCalibratedImmersion {k : ℕ}
    (g : ContMDiffRiemannianMetric I ∞ E (fun x : M ↦ TangentSpace I x)) (φ : RoughForm I M ℝ k)
    (f : N → M) (hf : ContMDiff I' I ∞ f) (hinj : ∀ x, Function.Injective (mfderiv I' I f x))
    (o : Manifold.Orientation I' N (Fin k)) : Prop :=
  letI : RiemannianBundle (fun x : N ↦ TangentSpace I' x) :=
    ⟨(g.pullback f (by simpa using hf) hinj).toRiemannianMetric⟩
  mpullback I' I f φ = riemannianVolumeForm o

/-! ## Layer 3: Volume minimization and stability -/

/-- **The fundamental theorem of calibrations** for closed sources: a compact oriented immersion
calibrated by a smooth calibration `φ` has volume at most that of every compact oriented
immersion of a closed `k`-manifold that pairs with every smooth closed `k`-form as it does, that
is, that is homologous to it in real homology (Harvey–Lawson 1982, Theorem II.4.2, p. 59;
McLean1998 line 32). -/
theorem immersionVolume_le_of_isCalibratedImmersion {k : ℕ} [I'.Boundaryless] [I''.Boundaryless]
    [CompactSpace N] [CompactSpace N'] [T2Space N] [T2Space N']
    (g : ContMDiffRiemannianMetric I ∞ E (fun x : M ↦ TangentSpace I x)) (φ : RoughForm I M ℝ k)
    (hφ : IsCalibration g φ)
    (f : N → M) (hf : ContMDiff I' I ∞ f) (hinj : ∀ x, Function.Injective (mfderiv I' I f x))
    (o : Manifold.Orientation I' N (Fin k)) (hcal : IsCalibratedImmersion g φ f hf hinj o)
    (f' : N' → M) (hf' : ContMDiff I'' I ∞ f')
    (hinj' : ∀ x, Function.Injective (mfderiv I'' I f' x))
    (o' : Manifold.Orientation I'' N' (Fin k))
    (hhom : ∀ η : RoughForm I M ℝ k, IsSmoothForm I ∞ η → mextDeriv η = 0 →
      integralTopForm o (mpullback I' I f η) = integralTopForm o' (mpullback I'' I f' η)) :
    immersionVolume g f hf hinj o ≤ immersionVolume g f' hf' hinj' o' := by
  sorry

end Manifolds

/-! ## Layer 4: Hermitian linear algebra and Kähler calibrations -/

/-- The standard Kähler form `ω = Σ_j dx_j ∧ dy_j` on `ℂⁿ`, with `z_j = x_j + i y_j`, as a real
continuous alternating 2-form: `ω(v, w) = Im ⟪v, w⟫_ℂ` for the Hermitian product conjugate-linear
in its first slot. -/
def standardKahlerForm (n : ℕ) : EuclideanSpace ℂ (Fin n) [⋀^Fin 2]→L[ℝ] ℝ where
  toFun v := (inner ℂ (v 0) (v 1)).im
  map_update_add' m i x y := by
    fin_cases i <;> simp
  map_update_smul' m i c x := by
    fin_cases i <;> simp [← Complex.coe_smul, mul_comm]
  cont := Complex.continuous_im.comp ((continuous_apply 0).inner (continuous_apply 1))
  map_eq_zero_of_eq' v i j hv hij := by
    fin_cases i <;> fin_cases j <;> simp_all [← Complex.ofReal_pow]

/-- The Wirtinger inequality in degree two: for `n ≥ 1` the standard Kähler form on `ℂⁿ` has
comass one (Cauchy–Schwarz for the Hermitian product; Harvey–Lawson 1982, Theorem II.6.11, p. 70,
for `p = 1`). -/
theorem norm_standardKahlerForm (n : ℕ) (hn : 1 ≤ n) : ‖standardKahlerForm n‖ = 1 := by
  sorry

/-- The equality case of the Wirtinger inequality in degree two: an ordered pair `(v, w)` in `ℂⁿ`
is calibrated by `ω` exactly when `v` is a unit vector and `w = i v`, that is, when it is a
positively oriented orthonormal frame of a complex line with its complex orientation. -/
theorem isCalibratedFrame_standardKahlerForm_iff (n : ℕ) (v : Fin 2 → EuclideanSpace ℂ (Fin n)) :
    IsCalibratedFrame (standardKahlerForm n) v ↔ ‖v 0‖ = 1 ∧ v 1 = Complex.I • v 0 := by
  sorry

/-- The Kähler bivector `ω̂ = Σ_j e_j ∧ i e_j` in the real exterior square of `ℂⁿ`, the metric dual
of the standard Kähler form: `⟪ω̂, v ∧ w⟫ = Im ⟪v, w⟫_ℂ` for the Gram inner product on
`⋀[ℝ]^2`. -/
def kahlerBivector (n : ℕ) : ⋀[ℝ]^2 (EuclideanSpace ℂ (Fin n)) :=
  ∑ j, exteriorPower.ιMulti ℝ 2
    ![EuclideanSpace.single j 1, Complex.I • EuclideanSpace.single j 1]

/-- The normalized Kähler power `ωʳ/r!` on `ℂⁿ` as a real continuous alternating `2r`-form:
`(r!)⁻¹` times the form of the `2r`-vector `ω̂ʳ` under Tau Ceti's Riesz identification
`TauCeti.alternatingFormEquiv`, that is `v ↦ ⟪ω̂ʳ, v₀ ∧ ⋯ ∧ v_(2r−1)⟫ / r!`, where `ω̂ʳ` is the
`r`-th power of `kahlerBivector n` in the exterior algebra and the pairing is the Gram inner
product on `⋀[ℝ]^(2r)`. -/
def kahlerPowerForm (n r : ℕ) : EuclideanSpace ℂ (Fin n) [⋀^Fin (2 * r)]→L[ℝ] ℝ :=
  (r.factorial : ℝ)⁻¹ • alternatingFormEquiv (EuclideanSpace ℂ (Fin n)) (2 * r)
    ⟨(kahlerBivector n : ExteriorAlgebra ℝ (EuclideanSpace ℂ (Fin n))) ^ r, by
      simpa [pow_mul] using Submodule.pow_mem_pow _ (kahlerBivector n).2 r⟩

/-- The real frame `(u₀, i u₀, u₁, i u₁, …)` of the complex span of `u`, ordered so that it carries
the complex orientation. -/
def complexRealFrame {n r : ℕ} (u : Fin r → EuclideanSpace ℂ (Fin n)) :
    Fin (2 * r) → EuclideanSpace ℂ (Fin n) :=
  fun i => (if (i : ℕ) % 2 = 0 then (1 : ℂ) else Complex.I) • u ⟨(i : ℕ) / 2, by omega⟩

/-- The Wirtinger inequality in every degree: for `r ≤ n` the normalized Kähler power `ωʳ/r!` on
`ℂⁿ` has comass one (Harvey–Lawson 1982, Theorem II.6.11 and Lemma II.6.13, p. 70; McLean1998
lines 37–48). -/
theorem norm_kahlerPowerForm (n r : ℕ) (hr : r ≤ n) : ‖kahlerPowerForm n r‖ = 1 := by
  sorry

/-- The equality case of the Wirtinger inequality in every degree: an ordered real frame `v` of
`2r` vectors in `ℂⁿ` is calibrated by `ωʳ/r!` exactly when it is real-orthonormal and spans the same
oriented real `2r`-plane as the frame `(u₀, i u₀, …, u_(r−1), i u_(r−1))` of some complex-orthonormal
family `u`, that is, when it is a positively oriented orthonormal frame of a complex `r`-plane with
its complex orientation. -/
theorem isCalibratedFrame_kahlerPowerForm_iff (n r : ℕ)
    (v : Fin (2 * r) → EuclideanSpace ℂ (Fin n)) :
    IsCalibratedFrame (kahlerPowerForm n r) v ↔
      Orthonormal ℝ v ∧ ∃ u : Fin r → EuclideanSpace ℂ (Fin n), Orthonormal ℂ u ∧
        exteriorPower.ιMulti ℝ (2 * r) v = exteriorPower.ιMulti ℝ (2 * r) (complexRealFrame u) := by
  sorry

section KahlerManifolds

variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℂ E] [FiniteDimensional ℂ E]
  {M : Type*} [TopologicalSpace M] [ChartedSpace E M] [IsManifold 𝓘(ℂ, E) ∞ M]
  {F : Type*} [NormedAddCommGroup F] [NormedSpace ℂ F] [FiniteDimensional ℂ F]
  {N : Type*} [TopologicalSpace N] [ChartedSpace F N] [IsManifold 𝓘(ℂ, F) ∞ N]
  {E'' H'' N' : Type*} [NormedAddCommGroup E''] [NormedSpace ℝ E''] [FiniteDimensional ℝ E'']
  [TopologicalSpace H''] {I'' : ModelWithCorners ℝ E'' H''} [TopologicalSpace N']
  [ChartedSpace H'' N'] [IsManifold I'' ∞ N']

/-- A Kähler metric on the complex manifold `M`, ComplexKahlerGeometry K6.0's predicate written on
the pinned carriers: a smooth Riemannian metric `g` on the underlying real manifold for which
multiplication by `i` on each tangent space is orthogonal, and whose fundamental form
`ω(v, w) = g(i v, w)`, the real 2-form `ψ` below, is closed. -/
def IsKahlerMetric
    (g : ContMDiffRiemannianMetric 𝓘(ℝ, E) ∞ E (fun x : M ↦ TangentSpace 𝓘(ℝ, E) x)) : Prop :=
  (∀ x (v w : E), g.inner x (Complex.I • v) (Complex.I • w) = g.inner x v w) ∧
    ∃ ψ : RoughForm 𝓘(ℝ, E) M ℝ 2, mextDeriv ψ = 0 ∧
      ∀ x (v : Fin 2 → E), ψ x v = g.inner x (Complex.I • v 0) (v 1)

/-- Compact complex submanifolds of Kähler manifolds minimize volume in their real homology
class: a holomorphic immersion `f` of a compact complex `r`-manifold, with its complex
orientation, has volume at most that of every compact oriented immersion of a closed real
`2r`-manifold that pairs with every smooth closed `2r`-form as `f` does. The route is the
calibration `ωʳ/r!` of 4.2–4.3 and the fundamental theorem of calibrations (Harvey–Lawson 1982,
Theorem II.6.11, p. 70; McLean1998 lines 37–48). -/
theorem immersionVolume_le_of_isKahlerMetric [CompactSpace N] [CompactSpace N'] [T2Space N]
    [T2Space N'] [I''.Boundaryless]
    (g : ContMDiffRiemannianMetric 𝓘(ℝ, E) ∞ E (fun x : M ↦ TangentSpace 𝓘(ℝ, E) x))
    (hg : IsKahlerMetric g)
    (f : N → M) (hhol : MDifferentiable 𝓘(ℂ, F) 𝓘(ℂ, E) f) (hf : ContMDiff 𝓘(ℝ, F) 𝓘(ℝ, E) ∞ f)
    (hinj : ∀ x, Function.Injective (mfderiv 𝓘(ℝ, F) 𝓘(ℝ, E) f x))
    (f' : N' → M) (hf' : ContMDiff I'' 𝓘(ℝ, E) ∞ f')
    (hinj' : ∀ x, Function.Injective (mfderiv I'' 𝓘(ℝ, E) f' x))
    (o' : Manifold.Orientation I'' N' (Fin (2 * Module.finrank ℂ F)))
    (hhom : ∀ η : RoughForm 𝓘(ℝ, E) M ℝ (2 * Module.finrank ℂ F), IsSmoothForm 𝓘(ℝ, E) ∞ η →
      mextDeriv η = 0 →
        integralTopForm (complexManifoldOrientation F N) (mpullback 𝓘(ℝ, F) 𝓘(ℝ, E) f η) =
          integralTopForm o' (mpullback I'' 𝓘(ℝ, E) f' η)) :
    immersionVolume g f hf hinj (complexManifoldOrientation F N) ≤
      immersionVolume g f' hf' hinj' o' := by
  sorry

end KahlerManifolds

/-! ## Layer 5: Special Lagrangian geometry -/

/-- The complex volume form `Ω = dz₁ ∧ ⋯ ∧ dzₙ` on `ℂⁿ` as a real continuous alternating
`n`-form with values in `ℂ`: `Ω v` is the determinant of the complex matrix whose rows are the
coordinate vectors of `v`. -/
def standardComplexVolume (n : ℕ) : EuclideanSpace ℂ (Fin n) [⋀^Fin n]→L[ℝ] ℂ :=
  ContinuousAlternatingMap.restrictScalars ℝ
    { toAlternatingMap := (Matrix.detRowAlternating : (Fin n → ℂ) [⋀^Fin n]→ₗ[ℂ] ℂ).compLinearMap
        (WithLp.linearEquiv 2 ℂ (Fin n → ℂ)).toLinearMap
      cont := by
        refine Continuous.matrix_det (continuous_pi fun i => ?_)
        exact (PiLp.continuous_ofLp 2 _).comp (continuous_apply i) }

/-- The special Lagrangian form of phase `θ` on `ℂⁿ`: `φ_θ v = Re (e^(−iθ) Ω v)`. -/
def standardSpecialLagrangianForm (n : ℕ) (θ : ℝ) :
    EuclideanSpace ℂ (Fin n) [⋀^Fin n]→L[ℝ] ℝ :=
  (Complex.reCLM.comp (ContinuousLinearMap.mul ℝ ℂ (Complex.exp (-(θ : ℂ) * Complex.I))))
    |>.compContinuousAlternatingMap (standardComplexVolume n)

/-- For `n ≥ 1` the special Lagrangian form of every phase has comass one
(Harvey–Lawson 1982, Theorem III.1.10, p. 89; the real plane is calibrated by `Re Ω`,
Joyce2001SLLectures line 90). -/
theorem norm_standardSpecialLagrangianForm (n : ℕ) (hn : 1 ≤ n) (θ : ℝ) :
    ‖standardSpecialLagrangianForm n θ‖ = 1 := by
  sorry

/-- The equality planes of the special Lagrangian form: a real-orthonormal ordered frame `v` of
`n` vectors in `ℂⁿ` satisfies `φ_θ v = 1` exactly when it spans a Lagrangian plane
(`Im ⟪v i, v j⟫_ℂ = 0` for all `i, j`), `Im (e^(−iθ) Ω v) = 0`, and the orientation is positive,
`Re (e^(−iθ) Ω v) > 0` (Harvey–Lawson 1982, Cor. III.1.11; Joyce2001SLLectures line 96 and
line 107, Propositions 2.3 and 2.4, for `θ = 0`). -/
theorem specialLagrangianFrame_iff (n : ℕ) (θ : ℝ)
    (v : Fin n → EuclideanSpace ℂ (Fin n)) (hv : Orthonormal ℝ v) :
    standardSpecialLagrangianForm n θ v = 1 ↔
      (∀ i j, (inner ℂ (v i) (v j)).im = 0) ∧
      (Complex.exp (-(θ : ℂ) * Complex.I) * standardComplexVolume n v).im = 0 ∧
      0 < (Complex.exp (-(θ : ℂ) * Complex.I) * standardComplexVolume n v).re := by
  sorry

section SpecialLagrangianManifolds

variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℂ E] [FiniteDimensional ℂ E]
  {M : Type*} [TopologicalSpace M] [ChartedSpace E M] [IsManifold 𝓘(ℂ, E) ∞ M]

/-- A normalized holomorphic volume form for the metric `g` on the complex manifold `M`: a smooth
closed complex-valued `n`-form, complex-linear in each argument on every tangent space, with
`|Ω_x(u)| = 1` on every unitary frame `u`, that is every `g_x`-orthonormal frame with
`g_x(i u_j, u_l) = 0` for all `j, l`. -/
def IsNormalizedHolomorphicVolumeForm
    (g : ContMDiffRiemannianMetric 𝓘(ℝ, E) ∞ E (fun x : M ↦ TangentSpace 𝓘(ℝ, E) x)) {n : ℕ}
    (Ω : RoughForm 𝓘(ℝ, E) M ℂ n) : Prop :=
  IsSmoothForm 𝓘(ℝ, E) ∞ Ω ∧ mextDeriv Ω = 0 ∧
    (∀ x (v : Fin n → E) (j : Fin n),
      Ω x (Function.update v j (Complex.I • v j)) = Complex.I * Ω x v) ∧
    ∀ x (u : Fin n → E), (∀ j l, g.inner x (u j) (u l) = if j = l then 1 else 0) →
      (∀ j l, g.inner x (Complex.I • u j) (u l) = 0) → ‖Ω x u‖ = 1

/-- The special Lagrangian form of phase `θ` of a complex-valued `n`-form `Ω` on `M`:
`(φ_θ)_x(v) = Re (e^(−iθ) Ω_x(v))`. -/
def specialLagrangianForm {n : ℕ} (Ω : RoughForm 𝓘(ℝ, E) M ℂ n) (θ : ℝ) :
    RoughForm 𝓘(ℝ, E) M ℝ n := fun x ↦
  (Complex.reCLM.comp (ContinuousLinearMap.mul ℝ ℂ (Complex.exp (-(θ : ℂ) * Complex.I))))
    |>.compContinuousAlternatingMap (Ω x)

/-- On a Kähler manifold with a normalized holomorphic volume form `Ω`, the special Lagrangian
form `Re (e^(−iθ) Ω)` of every phase is a calibration (Harvey–Lawson 1982, Theorem III.1.10,
p. 89; McLean1998 lines 450–462). With `immersionVolume_le_of_isCalibratedImmersion` it gives
the homological volume bound for phase-`θ` special Lagrangian immersions. -/
theorem isCalibration_specialLagrangianForm
    (g : ContMDiffRiemannianMetric 𝓘(ℝ, E) ∞ E (fun x : M ↦ TangentSpace 𝓘(ℝ, E) x))
    (hg : IsKahlerMetric g) {n : ℕ} (Ω : RoughForm 𝓘(ℝ, E) M ℂ n)
    (hΩ : IsNormalizedHolomorphicVolumeForm g Ω) (θ : ℝ) :
    IsCalibration g (specialLagrangianForm Ω θ) := by
  sorry

end SpecialLagrangianManifolds

/-! ## Layer 6: Compact special Lagrangian deformations -/

section SecondVariation

variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℂ E] [FiniteDimensional ℂ E]
  {M : Type*} [TopologicalSpace M] [ChartedSpace E M] [IsManifold 𝓘(ℂ, E) ∞ M]
  {E' H' N : Type*} [NormedAddCommGroup E'] [NormedSpace ℝ E'] [FiniteDimensional ℝ E']
  [TopologicalSpace H'] {I' : ModelWithCorners ℝ E' H'} [TopologicalSpace N] [ChartedSpace H' N]
  [IsManifold I' ∞ N]

/-- The one-form `β = ι_V ψ` on `N` cut out of a real 2-form `ψ` on `M` by a map `f : N → M` and
a vector field `V` along `f` (a map `N → E`, `E` being every tangent space of `M`):
`β_x(w) = ψ_(f x)(V x, df_x w)`, the contraction of `ψ` in its first slot pulled back along `f`.
For `ψ` the Kähler form and `V` a normal field along a Lagrangian immersion, this is the one-form
McLean identifies with `V`. -/
def contractionPullback (ψ : RoughForm 𝓘(ℝ, E) M ℝ 2) (f : N → M) (V : N → E) :
    RoughForm I' N ℝ 1 := fun x ↦
  ((show E [⋀^Fin 2]→L[ℝ] ℝ from ψ (f x)).curryLeft (V x)).compContinuousLinearMap
    (mfderiv I' 𝓘(ℝ, E) f x)

/-- The Hodge energy density `|dβ|² + |δβ|²` of a rough one-form `β` on an oriented Riemannian
manifold of dimension `m + 1`: the Gram norm squared of `dβ` for the pointwise inner product of
forms `TauCeti.alternatingFormInner`, plus the square of the function `⋆d⋆β`, which is `±δβ` for
the codifferential `δ` in either sign convention. -/
def hodgeEnergyDensity {m : ℕ} [RiemannianBundle (fun x : N ↦ TangentSpace I' x)]
    (o : Manifold.Orientation I' N (Fin (m + 1))) (β : RoughForm I' N ℝ 1) : N → ℝ := fun x ↦
  alternatingFormInner (TangentSpace I' x) 2 (mextDeriv β x) (mextDeriv β x) +
    (RoughForm.hodgeStar o (k := m + 1) (l := 0) (by omega)
      (mextDeriv (RoughForm.hodgeStar o (k := 1) (l := m) (by omega) β)) x ![]) ^ 2

/-- **The special Lagrangian second variation of volume** (McLean1998, Theorem 3.13, line 598):
let `f` be a phase-`θ` special Lagrangian immersion of a closed oriented `(m+1)`-manifold `N`
into a Kähler manifold with Kähler form `ψ` and normalized holomorphic volume form `Ω`, and let
`F` be a smooth family of immersions with `F 0 = f` whose velocity `V` at `t = 0` is normal to
`f`. Give `N` the Riemannian metric that is pointwise the pullback `f*g` (the instance, tied to
`g` by `hmet`). The second derivative at `t = 0` of the volume of `F t` is the Hodge energy
`∫_N (|dβ|² + |δβ|²) dvol` of the one-form `β = ι_V ψ|_N` for that metric. In particular it
depends only on `V`: neither the acceleration of the family nor its tangential motion contributes,
so no normality away from `t = 0` is assumed. The immersion need not be an embedding. -/
theorem secondVariation_volume_eq_hodgeEnergy {m : ℕ} [I'.Boundaryless] [CompactSpace N]
    [T2Space N] [RiemannianBundle (fun x : N ↦ TangentSpace I' x)]
    (g : ContMDiffRiemannianMetric 𝓘(ℝ, E) ∞ E (fun x : M ↦ TangentSpace 𝓘(ℝ, E) x))
    (hg : IsKahlerMetric g) (ψ : RoughForm 𝓘(ℝ, E) M ℝ 2)
    (hψ : ∀ x (v : Fin 2 → E), ψ x v = g.inner x (Complex.I • v 0) (v 1))
    (Ω : RoughForm 𝓘(ℝ, E) M ℂ (m + 1)) (hΩ : IsNormalizedHolomorphicVolumeForm g Ω) (θ : ℝ)
    (f : N → M) (hf : ContMDiff I' 𝓘(ℝ, E) ∞ f)
    (hinj : ∀ x, Function.Injective (mfderiv I' 𝓘(ℝ, E) f x))
    (hmet : ∀ x (v w : TangentSpace I' x),
      inner ℝ v w = g.inner (f x) (mfderiv I' 𝓘(ℝ, E) f x v) (mfderiv I' 𝓘(ℝ, E) f x w))
    (o : Manifold.Orientation I' N (Fin (m + 1)))
    (hcal : IsCalibratedImmersion g (specialLagrangianForm Ω θ) f hf hinj o)
    (F : ℝ → N → M) (hF : ContMDiff (𝓘(ℝ, ℝ).prod I') 𝓘(ℝ, E) ∞ (Function.uncurry F))
    (hF0 : F 0 = f) (hFt : ∀ t, ContMDiff I' 𝓘(ℝ, E) ∞ (F t))
    (hFinj : ∀ t x, Function.Injective (mfderiv I' 𝓘(ℝ, E) (F t) x))
    (V : N → E) (hV : ∀ x, mfderiv 𝓘(ℝ, ℝ) 𝓘(ℝ, E) (fun t ↦ F t x) 0 1 = V x)
    (hVn : ∀ x w, g.inner (f x) (V x) (mfderiv I' 𝓘(ℝ, E) f x w) = 0) :
    deriv (deriv fun t ↦ immersionVolume g (F t) (hFt t) (hFinj t) o) 0 =
      integralTopForm o (fun x ↦ hodgeEnergyDensity o (contractionPullback ψ f V) x •
        riemannianVolumeForm o x) := by
  sorry

end SecondVariation

end TauCetiRoadmap.CalibratedGeometry
