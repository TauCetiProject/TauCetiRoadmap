module

public import Mathlib
public import TauCeti.Analysis.PositiveDefinite.AddGroup
public import TauCeti.Analysis.PositiveDefinite.Kernel.Kolmogorov
public import TauCeti.Analysis.CompletelyMonotone.Basic
public import TauCeti.Analysis.CompletelyMonotone.Bernstein.HausdorffBernsteinWidder
public import TauCeti.Analysis.Bochner.CharFun.Bochner
public import TauCeti.Analysis.Bochner.CharFun.Inversion
public import TauCeti.Analysis.Bochner.DiscreteGroup
public import TauCeti.Analysis.Bochner.Herglotz
public import TauCeti.Analysis.Bochner.Gaussian.Basic

/-!
# Second-order random fields and covariance functions: target signatures

This file is not the roadmap: the roadmap is `README.md`, and this file is not an exhaustive
checklist. It states, against the pinned Mathlib and Tau Ceti and each with `sorry`, the
headlines of the README that carry a Lean name, each with every conclusion the README attaches
to it, together with the definitions their statements need. The bullets of the README without a
Lean name are definitions given in prose, results supplied by Mathlib, Tau Ceti or other
roadmaps, or facts about a single definition that follow in one step from it; these are API
lemmas, not headlines.

Conventions, as in the README. A random field is `Z : T → Ω → ℝ` on one probability space.
Covariance kernels are positive semidefinite in Mathlib's sense, `(Matrix.of C).PosSemidef`,
which for an infinite index type quantifies over finitely supported coefficient vectors.
Positive definite functions on an additive group are Tau Ceti's `IsPositiveDefiniteSub`. The
spectral measure of a covariance is the finite measure whose Mathlib `charFun`
(`∫ exp (i ⟪ω, h⟫) dF(ω)`) is the covariance. Isotropic correlations and correlations on spheres
are functions `ℝ → ℝ`, and every class constrains them only on `[0, ∞)`, respectively `[0, π]`.

Definitions owned by other roadmaps are roadmap-local verbatim copies of the current
`Suggested.lean` of their owner, each with a docstring naming owner and section: the K-Bessel
kernel (AnalyticNumberTheoryPartI §2.1a, where it is called `besselK`), the zonal Bessel function
`besselZonal` (SpecialFunctionsMotionGroupsBessel §6.1) and the zonal polynomial
`zonalPolynomial` (SpecialFunctionsHigherSpheres §3.1). The implementation namespace of the
README is `TauCeti`; the prototypes live in this roadmap's namespace.
-/

@[expose] public section

noncomputable section

open MeasureTheory ProbabilityTheory Filter Set Topology Complex Polynomial
open scoped ENNReal NNReal InnerProductSpace RealInnerProductSpace ComplexConjugate ComplexOrder

namespace TauCetiRoadmap.SecondOrderRandomFields

/-! ## Local copies of vocabulary owned elsewhere -/

section LocalCopies

/-- Local copy of AnalyticNumberTheoryPartI's `besselK` (its §2.1a), the K-Bessel kernel
`K_ν(c) = ½ ∫₀^∞ exp(−c(u + u⁻¹)/2) u^ν du/u` for complex order and real `c > 0`; the argument
`c ≤ 0` is outside its interface. SpecialFunctionsBessel §5.1 proves that it agrees with the
DLMF function `K_ν` on the positive axis. -/
def positiveAxisBesselK (ν : ℂ) (c : ℝ) : ℂ :=
  (1 / 2 : ℂ) * ∫ u : ℝ in Set.Ioi 0,
    Complex.exp (-(c : ℂ) * ((u : ℂ) + (u : ℂ)⁻¹) / 2) *
      Complex.exp (ν * (Real.log u : ℂ)) / (u : ℂ)

/-- Local copy of `besselZonal` of SpecialFunctionsMotionGroupsBessel §6.1, the zonal Bessel
function `Ω_n(λ, r) = Γ(n/2) Σ_k (−λ²r²/4)^k / (k! Γ(k + n/2))`, entire in `λ` and `r`. -/
def besselZonal (n : ℕ) (lam : ℂ) (r : ℝ) : ℂ :=
  Complex.Gamma (n / 2) *
    ∑' k : ℕ, (-(lam ^ 2) * r ^ 2 / 4) ^ k / ((k.factorial : ℂ) * Complex.Gamma (k + n / 2))

open scoped Nat in
/-- Local copy of `zonalPolynomial` of SpecialFunctionsHigherSpheres §3.1, the zonal polynomial
`ω_{n,l}(t) = ₂F₁(−l, l + n − 2; (n − 1)/2; (1 − t)/2)` of `S^{n−1} ⊂ ℝⁿ`, normalized by
`ω_{n,l}(1) = 1`. For `n ≥ 3` it is the normalized Gegenbauer polynomial
`C_l^{((n−2)/2)}/C_l^{((n−2)/2)}(1)`, for `n = 2` the Chebyshev polynomial `T_l`, and for `n = 3`
the Legendre polynomial `P_l`. -/
def zonalPolynomial (n l : ℕ) : ℝ[X] :=
  ∑ k ∈ Finset.range (l + 1),
    C ((ascPochhammer ℝ k).eval (-(l : ℝ)) * (ascPochhammer ℝ k).eval ((l : ℝ) + n - 2) /
      ((ascPochhammer ℝ k).eval (((n : ℝ) - 1) / 2) * k !)) * (C (1 / 2) * (1 - X)) ^ k

end LocalCopies

/-! ## Supplied by Mathlib and Tau Ceti (consumed, not targets) -/

#check @ProbabilityTheory.multivariateGaussian
#check @ProbabilityTheory.measurePreserving_restrict₂_multivariateGaussian
#check @MeasureTheory.Measure.ext_of_charFun
#check @MeasureTheory.contDiff_charFun
#check @MeasureTheory.iteratedDeriv_charFun
#check @Complex.besselJ
#check @ProbabilityTheory.gammaMeasure
#check @Asymptotics.IsTheta
#check @Polynomial.Chebyshev.T
#check @Matrix.PosSemidef.kolmogorovFeature
#check @Matrix.PosSemidef.inner_kolmogorovFeature
#check @TauCeti.isPositiveDefiniteSub_iff_posSemidef
#check @TauCeti.isPositiveDefiniteSub_charFun
#check @TauCeti.IsPositiveDefiniteSub.mul
#check @TauCeti.IsPositiveDefiniteSub.of_tendsto
#check @TauCeti.isPositiveDefiniteSub_iff_exists_pontryaginMeasureTransform_eq
#check @TauCeti.isPositiveDefiniteSub_iff_exists_isFiniteMeasure_integral_zpow_eq
#check @MeasureTheory.Measure.eq_withDensity_re_fourierInv_charFun
#check @TauCeti.hausdorff_bernstein_widder
#check @TauCeti.posSemidef_cexp_neg_mul_sq_norm
#check @TauCeti.IsCompletelyMonotoneOnIoi
#check @TauCeti.IsContinuousCompletelyMonotoneOnIoi

/-! ## Layer 1: second-order and Gaussian fields -/

section Layer1

variable {Ω T : Type*} [MeasurableSpace Ω]

/-- 1.1. A **second-order field**: every `Z t` is square integrable. -/
def IsSecondOrderField (Z : T → Ω → ℝ) (P : Measure Ω) : Prop :=
  ∀ t, MemLp (Z t) 2 P

/-- 1.1. **Covariance kernels are positive semidefinite**: the covariance kernel of a
second-order field is symmetric and positive semidefinite. -/
theorem posSemidef_covariance {P : Measure Ω} [IsProbabilityMeasure P] {Z : T → Ω → ℝ}
    (hZ : IsSecondOrderField Z P) :
    (Matrix.of fun s t ↦ cov[Z s, Z t; P]).PosSemidef := by
  sorry

/-- 1.2. **Gaussian fields with given mean and covariance.** For every set `T`, mean `m` and
positive semidefinite kernel `C` there is a probability measure on `T → ℝ` under which the
coordinate process is Gaussian with mean `m` and covariance `C`. -/
theorem exists_isGaussianProcess_coord (m : T → ℝ) (C : T → T → ℝ)
    (hC : (Matrix.of C).PosSemidef) :
    ∃ P : Measure (T → ℝ), IsProbabilityMeasure P ∧
      IsGaussianProcess (fun t (ω : T → ℝ) ↦ ω t) P ∧
      (∀ t, ∫ ω, ω t ∂P = m t) ∧
      ∀ s t, cov[fun ω : T → ℝ ↦ ω s, fun ω ↦ ω t; P] = C s t := by
  sorry

/-- 1.2. **The law of a Gaussian field is determined by its mean and covariance.** -/
theorem map_eq_of_isGaussianProcess {Ω' : Type*} [MeasurableSpace Ω']
    {P : Measure Ω} {P' : Measure Ω'} [IsProbabilityMeasure P] [IsProbabilityMeasure P']
    {Z : T → Ω → ℝ} {Z' : T → Ω' → ℝ} (hZm : ∀ t, Measurable (Z t))
    (hZm' : ∀ t, Measurable (Z' t)) (hZ : IsGaussianProcess Z P)
    (hZ' : IsGaussianProcess Z' P') (hmean : ∀ t, P[Z t] = P'[Z' t])
    (hcov : ∀ s t, cov[Z s, Z t; P] = cov[Z' s, Z' t; P']) :
    P.map (fun ω t ↦ Z t ω) = P'.map (fun ω t ↦ Z' t ω) := by
  sorry

variable {G : Type*} [AddCommGroup G]

/-- 1.3. A field on an additive group is **strictly stationary** when every finite-dimensional
law is invariant under translation. -/
def IsStrictlyStationary (Z : G → Ω → ℝ) (P : Measure Ω) : Prop :=
  ∀ (I : Finset G) (h : G),
    P.map (fun ω (t : I) ↦ Z ((t : G) + h) ω) = P.map (fun ω (t : I) ↦ Z (t : G) ω)

/-- 1.3. A **second-order stationary field**: second order, with constant mean and covariance
invariant under translation of both arguments. -/
def IsSecondOrderStationary (Z : G → Ω → ℝ) (P : Measure Ω) : Prop :=
  IsSecondOrderField Z P ∧ (∀ s t, P[Z s] = P[Z t]) ∧
    ∀ s t h, cov[Z (s + h), Z (t + h); P] = cov[Z s, Z t; P]

/-- 1.3. The **stationary covariance** `C(h) = Cov(Z(h), Z(0))`. -/
def stationaryCov (Z : G → Ω → ℝ) (P : Measure Ω) (h : G) : ℝ :=
  cov[Z h, Z 0; P]

/-- 1.3. An **intrinsically stationary field**: square-integrable centred increments whose
variance depends only on the lag. -/
def IsIntrinsicallyStationary (Z : G → Ω → ℝ) (P : Measure Ω) : Prop :=
  (∀ s h, MemLp (fun ω ↦ Z (s + h) ω - Z s ω) 2 P) ∧
    (∀ s h, ∫ ω, (Z (s + h) ω - Z s ω) ∂P = 0) ∧
    ∀ s t h, Var[fun ω ↦ Z (s + h) ω - Z s ω; P] = Var[fun ω ↦ Z (t + h) ω - Z t ω; P]

/-- 1.3. The **semivariogram** `γ(h) = Var(Z(h) − Z(0))/2`. -/
def semivariogram (Z : G → Ω → ℝ) (P : Measure Ω) (h : G) : ℝ :=
  Var[fun ω ↦ Z h ω - Z 0 ω; P] / 2

/-- 1.3. A strictly stationary second-order field is second-order stationary. -/
theorem IsStrictlyStationary.isSecondOrderStationary {P : Measure Ω} [IsProbabilityMeasure P]
    {Z : G → Ω → ℝ} (hm : ∀ t, Measurable (Z t)) (hZ : IsStrictlyStationary Z P)
    (h2 : IsSecondOrderField Z P) : IsSecondOrderStationary Z P := by
  sorry

/-- 1.3. For a Gaussian field, second-order and strict stationarity coincide. -/
theorem isStrictlyStationary_iff_of_isGaussianProcess {P : Measure Ω} [IsProbabilityMeasure P]
    {Z : G → Ω → ℝ} (hm : ∀ t, Measurable (Z t)) (hZ : IsGaussianProcess Z P) :
    IsStrictlyStationary Z P ↔ IsSecondOrderStationary Z P := by
  sorry

/-- 1.3. A second-order stationary field is intrinsically stationary, with semivariogram
`γ(h) = C(0) − C(h)`. -/
theorem IsSecondOrderStationary.isIntrinsicallyStationary {P : Measure Ω}
    [IsProbabilityMeasure P] {Z : G → Ω → ℝ} (hZ : IsSecondOrderStationary Z P) :
    IsIntrinsicallyStationary Z P ∧
      ∀ h, semivariogram Z P h = stationaryCov Z P 0 - stationaryCov Z P h := by
  sorry

/-- 1.4. **Elementary properties of a stationary covariance**: `C(0) ≥ 0`, `C(−h) = C(h)`,
`|C(h)| ≤ C(0)`, and `C` is positive definite. -/
theorem IsSecondOrderStationary.stationaryCov_properties {P : Measure Ω}
    [IsProbabilityMeasure P] {Z : G → Ω → ℝ} (hZ : IsSecondOrderStationary Z P) :
    0 ≤ stationaryCov Z P 0 ∧ (∀ h, stationaryCov Z P (-h) = stationaryCov Z P h) ∧
      (∀ h, |stationaryCov Z P h| ≤ stationaryCov Z P 0) ∧
      TauCeti.IsPositiveDefiniteSub fun h ↦ (stationaryCov Z P h : ℂ) := by
  sorry

/-- 1.4. **Every real positive definite function is a stationary covariance**, of a centred
Gaussian field. -/
theorem exists_isGaussianProcess_stationaryCov (C : G → ℝ)
    (hC : TauCeti.IsPositiveDefiniteSub fun h ↦ (C h : ℂ)) :
    ∃ P : Measure (G → ℝ), IsProbabilityMeasure P ∧
      IsGaussianProcess (fun t (ω : G → ℝ) ↦ ω t) P ∧ (∀ t, ∫ ω, ω t ∂P = 0) ∧
      IsSecondOrderStationary (fun t (ω : G → ℝ) ↦ ω t) P ∧
      stationaryCov (fun t (ω : G → ℝ) ↦ ω t) P = C := by
  sorry

/-- 1.4. **The continuity estimate** `|C(s + h) − C(s)| ≤ √(2 C(0) (C(0) − C(h)))` for a
real positive definite function. -/
theorem abs_sub_le_sqrt_of_isPositiveDefiniteSub {C : G → ℝ}
    (hC : TauCeti.IsPositiveDefiniteSub fun h ↦ (C h : ℂ)) (s h : G) :
    |C (s + h) - C s| ≤ Real.sqrt (2 * C 0 * (C 0 - C h)) := by
  sorry

/-- 1.4. A real positive definite function on a topological additive group that is
continuous at `0` is uniformly continuous. -/
theorem uniformContinuous_of_isPositiveDefiniteSub {E : Type*} [NormedAddCommGroup E]
    {C : E → ℝ} (hC : TauCeti.IsPositiveDefiniteSub fun h ↦ (C h : ℂ))
    (h0 : ContinuousAt C 0) : UniformContinuous C := by
  sorry

/-- 1.4. **Mixtures**: an integral of positive definite functions against a measure is
positive definite when it exists at every point. -/
theorem isPositiveDefiniteSub_integral {X : Type*} [MeasurableSpace X]
    {μ : Measure X} {F : X → G → ℂ} (hp : ∀ x, TauCeti.IsPositiveDefiniteSub (F x))
    (hi : ∀ z, Integrable (fun x ↦ F x z) μ) :
    TauCeti.IsPositiveDefiniteSub fun z ↦ ∫ x, F x z ∂μ := by
  sorry

/-- 1.5. A field on a topological space is **mean-square continuous** when
`E (Z t − Z s)² → 0` as `t → s`, for every `s`. -/
def IsMeanSquareContinuous [TopologicalSpace T] (Z : T → Ω → ℝ) (P : Measure Ω) : Prop :=
  ∀ s, Tendsto (fun t ↦ ∫ ω, (Z t ω - Z s ω) ^ 2 ∂P) (𝓝 s) (𝓝 0)

/-- 1.5. **Mean-square continuity and the covariance**: a second-order field is mean-square
continuous if and only if its covariance is continuous at every diagonal point and its mean
is continuous. -/
theorem isMeanSquareContinuous_iff [TopologicalSpace T] {P : Measure Ω} [IsProbabilityMeasure P]
    {Z : T → Ω → ℝ} (hZ : IsSecondOrderField Z P) :
    IsMeanSquareContinuous Z P ↔
      (∀ s, ContinuousAt (fun p : T × T ↦ cov[Z p.1, Z p.2; P]) (s, s)) ∧
        Continuous fun t ↦ P[Z t] := by
  sorry

/-- 1.5. **The stationary case**: `E (Z x − Z y)² = 2 (C(0) − C(x − y))`, so a second-order
stationary field is mean-square continuous if and only if `C` is continuous at `0`, and then
`C` is continuous. -/
theorem IsSecondOrderStationary.isMeanSquareContinuous_iff {E : Type*} [NormedAddCommGroup E]
    {P : Measure Ω} [IsProbabilityMeasure P] {Z : E → Ω → ℝ} (hZ : IsSecondOrderStationary Z P) :
    (∀ x y, ∫ ω, (Z x ω - Z y ω) ^ 2 ∂P =
      2 * (stationaryCov Z P 0 - stationaryCov Z P (x - y))) ∧
    (IsMeanSquareContinuous Z P ↔ ContinuousAt (stationaryCov Z P) 0) ∧
    (ContinuousAt (stationaryCov Z P) 0 → Continuous (stationaryCov Z P)) := by
  sorry

end Layer1

/-! ## Layer 2: spectral theory -/

section Layer2

variable {Ω : Type*} [MeasurableSpace Ω]
variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E] [FiniteDimensional ℝ E]
  [MeasurableSpace E] [BorelSpace E]

-- Tau Ceti's Bochner theorem in characteristic-function form, consumed in 2.1.
#check @TauCeti.bochner_charFun

/-- 2.1. **The spectral measure of a stationary covariance.** The covariance of a mean-square
continuous second-order stationary field is the characteristic function of a unique finite
measure `F`, which is symmetric, has total mass `C(0)`, and represents `C` as a cosine
transform. -/
theorem IsSecondOrderStationary.existsUnique_spectralMeasure {P : Measure Ω}
    [IsProbabilityMeasure P] {Z : E → Ω → ℝ} (hZ : IsSecondOrderStationary Z P)
    (hms : IsMeanSquareContinuous Z P) :
    (∃! F : Measure E, IsFiniteMeasure F ∧ ∀ h, charFun F h = (stationaryCov Z P h : ℂ)) ∧
      ∀ F : Measure E, IsFiniteMeasure F → (∀ h, charFun F h = (stationaryCov Z P h : ℂ)) →
        F.map Neg.neg = F ∧ F.real univ = stationaryCov Z P 0 ∧
        ∀ h, stationaryCov Z P h = ∫ ω, Real.cos ⟪h, ω⟫ ∂F := by
  sorry

/-- 2.1. **Integrable covariances have a spectral density**: if `C ∈ L¹`, the spectral measure
has the continuous nonnegative density `f(ω) = (2π)^{-d} ∫ exp(−i⟪h, ω⟫) C(h) dh`. -/
theorem eq_withDensity_of_integrable {C : E → ℝ} (F : Measure E) [IsFiniteMeasure F]
    (hF : ∀ h, charFun F h = (C h : ℂ)) (hC : Integrable C) :
    let f : E → ℝ := fun ω ↦ ((2 * Real.pi) ^ Module.finrank ℝ E)⁻¹ *
      (∫ h, Complex.exp (-(⟪h, ω⟫ : ℂ) * I) * (C h : ℂ)).re
    Continuous f ∧ (∀ ω, 0 ≤ f ω) ∧ F = volume.withDensity fun ω ↦ ENNReal.ofReal (f ω) := by
  sorry

/-- 2.1. **The lattice form (Herglotz in several variables).** A function on `ℤ^d` is positive
definite if and only if it is the Fourier transform of a finite measure on `[−π, π)^d`. -/
theorem isPositiveDefiniteSub_iff_lattice (d : ℕ) (φ : (Fin d → ℤ) → ℂ) :
    TauCeti.IsPositiveDefiniteSub φ ↔
      ∃ F : Measure (Fin d → ℝ), IsFiniteMeasure F ∧
        F (Set.pi univ fun _ ↦ Ico (-Real.pi) Real.pi)ᶜ = 0 ∧
        ∀ h, φ h = ∫ ω, Complex.exp (I * ∑ k, ((h k : ℝ) * ω k : ℝ)) ∂F := by
  sorry

/-- 2.2. The plane wave is square integrable for a finite measure: it has modulus `1`. -/
theorem memLp_exp_inner_mul_I (F : Measure E) [IsFiniteMeasure F] (t : E) :
    MemLp (fun ω : E ↦ Complex.exp ((⟪ω, t⟫ : ℂ) * I)) 2 F := by
  refine MemLp.of_bound (by fun_prop) 1 (ae_of_all _ fun ω ↦ ?_)
  rw [Complex.norm_exp_ofReal_mul_I]

/-- 2.2. The plane wave `ω ↦ exp (i⟪ω, t⟫)` as an element of `L²(F)`. -/
def expLp (F : Measure E) [IsFiniteMeasure F] (t : E) : Lp ℂ 2 F :=
  (memLp_exp_inner_mul_I F t).toLp _

/-- 2.2. **Spectral representation**: a centred, mean-square continuous, second-order
stationary field with spectral measure `F` is `Z(t) = ∫ exp(i⟪t, ω⟫) W(dω)` for an
orthogonally scattered random measure `W` with control measure `F`, encoded as a linear
isometry `I : L²(F) → L²(P)` with centred values and `W(A) = I(1_A)`; `I` is the only linear
isometry with `I(exp(i⟪t, ·⟫)) = Z(t)` for every `t`. -/
theorem exists_spectralRepresentation {P : Measure Ω} [IsProbabilityMeasure P]
    {Z : E → Ω → ℝ} (hZ : IsSecondOrderStationary Z P) (hcent : ∀ t, P[Z t] = 0)
    (hms : IsMeanSquareContinuous Z P) (F : Measure E) [IsFiniteMeasure F]
    (hF : ∀ h, (stationaryCov Z P h : ℂ) = charFun F h) :
    ∃ I : Lp ℂ 2 F →ₗᵢ[ℂ] Lp ℂ 2 P, (∀ f, ∫ ω, I f ω ∂P = 0) ∧
      (∀ t, I (expLp F t) =ᵐ[P] fun ω ↦ (Z t ω : ℂ)) ∧
      ∀ J : Lp ℂ 2 F →ₗᵢ[ℂ] Lp ℂ 2 P,
        (∀ t, J (expLp F t) =ᵐ[P] fun ω ↦ (Z t ω : ℂ)) → J = I := by
  sorry

/-- 2.2. **The random measure of a real field is conjugate-symmetric**:
`W(−A) = conj W(A)` for the isometry of `exists_spectralRepresentation`. -/
theorem spectralRepresentation_neg {P : Measure Ω} [IsProbabilityMeasure P]
    {Z : E → Ω → ℝ} (F : Measure E) [IsFiniteMeasure F] (I : Lp ℂ 2 F →ₗᵢ[ℂ] Lp ℂ 2 P)
    (hI : ∀ t, I (expLp F t) =ᵐ[P] fun ω ↦ (Z t ω : ℂ)) {A : Set E} (hA : MeasurableSet A) :
    (I (indicatorConstLp 2 hA.neg (measure_ne_top F _) (1 : ℂ)) : Ω → ℂ) =ᵐ[P]
      fun ω ↦ conj (I (indicatorConstLp 2 hA (measure_ne_top F A) (1 : ℂ)) ω) := by
  sorry

/-- 2.2. **The converse**: for an orthogonally scattered random measure with control measure `F`
and centred values `E W(A) = 0`, the field `Z(t) = I(exp(i⟪t, ·⟫))` is centred and mean-square
continuous with `E Z(s) conj Z(t) = ∫ exp(i⟪s − t, ω⟫) dF(ω)`, and it is real when
`W(−A) = conj W(A)`. -/
theorem spectralIntegral_properties {P : Measure Ω} [IsProbabilityMeasure P]
    (F : Measure E) [IsFiniteMeasure F] (I : Lp ℂ 2 F →ₗᵢ[ℂ] Lp ℂ 2 P)
    (hcent : ∀ (A : Set E) (hA : MeasurableSet A),
      ∫ ω, I (indicatorConstLp 2 hA (measure_ne_top F A) (1 : ℂ)) ω ∂P = 0) :
    (∀ t, ∫ ω, I (expLp F t) ω ∂P = 0) ∧
    (∀ s t, ∫ ω, I (expLp F s) ω * conj (I (expLp F t) ω) ∂P = charFun F (s - t)) ∧
    (∀ s, Tendsto (fun t ↦ ∫ ω, ‖I (expLp F t) ω - I (expLp F s) ω‖ ^ 2 ∂P) (𝓝 s) (𝓝 0)) ∧
    ((∀ (A : Set E) (hA : MeasurableSet A),
        (I (indicatorConstLp 2 hA.neg (measure_ne_top F _) (1 : ℂ)) : Ω → ℂ) =ᵐ[P]
          fun ω ↦ conj (I (indicatorConstLp 2 hA (measure_ne_top F A) (1 : ℂ)) ω)) →
      ∀ t, ∀ᵐ ω ∂P, (I (expLp F t) ω).im = 0) := by
  sorry

/-- 2.3. `Z'` is the **mean-square derivative** of `Z`. -/
def HasMeanSquareDeriv (Z Z' : ℝ → Ω → ℝ) (P : Measure Ω) : Prop :=
  ∀ t, Tendsto (fun h ↦ ∫ ω, ((Z (t + h) ω - Z t ω) / h - Z' t ω) ^ 2 ∂P) (𝓝[≠] 0) (𝓝 0)

/-- 2.3. `Z` is **`m` times mean-square differentiable**: there are square-integrable processes
`D 0 = Z, D 1, …, D m`, each the mean-square derivative of the previous one. -/
def IsMeanSquareDifferentiable (m : ℕ) (Z : ℝ → Ω → ℝ) (P : Measure Ω) : Prop :=
  ∃ D : ℕ → ℝ → Ω → ℝ, D 0 = Z ∧ ∀ k < m, IsSecondOrderField (D (k + 1)) P ∧
    HasMeanSquareDeriv (D k) (D (k + 1)) P

/-- 2.3. The `n`th derivative of `K` exists and is finite at `x`: for `n ≥ 1`, `K` is
`n − 1` times continuously differentiable near `x` and its derivative of order `n − 1` is
differentiable at `x`. -/
def HasFiniteIteratedDerivAt (n : ℕ) (K : ℝ → ℝ) (x : ℝ) : Prop :=
  ∃ U ∈ 𝓝 x, ContDiffOn ℝ (n - 1) K U ∧ DifferentiableAt ℝ (iteratedDeriv (n - 1) K) x

/-- 2.3. **Mean-square differentiability**: for `m ≥ 1`, `Z` is `m` times mean-square
differentiable iff the spectral moment of order `2m` is finite iff `K^{(2m)}(0)` exists. -/
theorem isMeanSquareDifferentiable_tfae {P : Measure Ω} [IsProbabilityMeasure P]
    {Z : ℝ → Ω → ℝ} (hZ : IsSecondOrderStationary Z P) (hcent : ∀ t, P[Z t] = 0)
    (F : Measure ℝ) [IsFiniteMeasure F]
    (hF : ∀ h, (stationaryCov Z P h : ℂ) = charFun F h) {m : ℕ} (hm : 1 ≤ m) :
    List.TFAE [IsMeanSquareDifferentiable m Z P,
      Integrable (fun ω : ℝ ↦ ω ^ (2 * m)) F,
      HasFiniteIteratedDerivAt (2 * m) (stationaryCov Z P) 0] := by
  sorry

/-- 2.3. **The derivative process**: if `Z` is `m` times mean-square differentiable, `K` is
`C^{2m}` and `Z^{(m)}` is second-order stationary with covariance `(−1)^m K^{(2m)}`. -/
theorem IsMeanSquareDifferentiable.derivative {P : Measure Ω} [IsProbabilityMeasure P]
    {Z : ℝ → Ω → ℝ} (hZ : IsSecondOrderStationary Z P) (hcent : ∀ t, P[Z t] = 0) {m : ℕ}
    (hm : 1 ≤ m) (hdiff : IsMeanSquareDifferentiable m Z P) :
    ContDiff ℝ (2 * m) (stationaryCov Z P) ∧
      ∃ D : ℕ → ℝ → Ω → ℝ, D 0 = Z ∧
        (∀ k < m, IsSecondOrderField (D (k + 1)) P ∧ HasMeanSquareDeriv (D k) (D (k + 1)) P) ∧
        IsSecondOrderStationary (D m) P ∧
        ∀ h, stationaryCov (D m) P h =
          (-1) ^ m * iteratedDeriv (2 * m) (stationaryCov Z P) h := by
  sorry

/-- 2.3. **Analytic paths without mean-square derivative**: `Z(t) = cos(Xt + Y)`, with `X`
standard Cauchy and `Y` uniform on `[0, 2π)` independent of `X`, is second-order stationary
with covariance `e^{−|h|}/2` and is not mean-square differentiable. -/
theorem not_isMeanSquareDifferentiable_cos_cauchy {P : Measure Ω} [IsProbabilityMeasure P]
    {X Y : Ω → ℝ} (hX : HasLaw X (cauchyMeasure 0 1) P)
    (hY : HasLaw Y ((ENNReal.ofReal (2 * Real.pi))⁻¹ •
      volume.restrict (Set.Ico 0 (2 * Real.pi))) P)
    (hXY : IndepFun X Y P) :
    IsSecondOrderStationary (fun t ω ↦ Real.cos (X ω * t + Y ω)) P ∧
      (∀ h, stationaryCov (fun t ω ↦ Real.cos (X ω * t + Y ω)) P h = Real.exp (-|h|) / 2) ∧
      ¬ IsMeanSquareDifferentiable 1 (fun t ω ↦ Real.cos (X ω * t + Y ω)) P := by
  sorry

end Layer2

/-! ## Layer 3: isotropic correlation functions -/

section Layer3

/-- 3.1. `Ω_d(t) = Re Ω_d(1, t)`, the characteristic function of the uniform law on
`S^{d−1}` in a fixed direction: `cos t` for `d = 1`, `J₀(t)` for `d = 2`, `sin t / t` for
`d = 3`. -/
def sphereCharFun (d : ℕ) (t : ℝ) : ℝ := (besselZonal d 1 t).re

/-- 3.1. The class `Φ_d` of isotropic correlation functions on `ℝ^d`. -/
def isotropicClass (d : ℕ) : Set (ℝ → ℝ) :=
  {φ | ContinuousOn φ (Ici 0) ∧ φ 0 = 1 ∧
    TauCeti.IsPositiveDefiniteSub fun x : EuclideanSpace ℝ (Fin d) ↦ (φ ‖x‖ : ℂ)}

/-- 3.1. The class `Φ_∞ = ⋂_{d ≥ 1} Φ_d`. -/
def isotropicClassInf : Set (ℝ → ℝ) := ⋂ d : ℕ, isotropicClass (d + 1)

/-- 3.1. **Strict positive definiteness**: the Hermitian form is positive for distinct points
and nonzero coefficients. -/
def IsStrictlyPositiveDefiniteSub {G : Type*} [AddCommGroup G] (F : G → ℂ) : Prop :=
  ∀ (n : ℕ) (c : Fin n → ℂ) (v : Fin n → G), Function.Injective v → c ≠ 0 →
    0 < ∑ i, ∑ j, c i * conj (c j) * F (v i - v j)

/-- 3.1. **Schoenberg's theorem on `ℝ^d`**: `φ ∈ Φ_d` iff `φ(t) = ∫ Ω_d(rt) dF₀(r)` on
`t ≥ 0` for a probability measure `F₀` on `[0, ∞)`. -/
theorem mem_isotropicClass_iff {d : ℕ} (hd : 1 ≤ d) {φ : ℝ → ℝ} :
    φ ∈ isotropicClass d ↔ ∃ F₀ : Measure ℝ, IsProbabilityMeasure F₀ ∧ F₀ (Iio 0) = 0 ∧
      ∀ t, 0 ≤ t → φ t = ∫ r, sphereCharFun d (r * t) ∂F₀ := by
  sorry

/-- 3.1. **Uniqueness of the radial measure.** -/
theorem eq_of_integral_sphereCharFun_eq {d : ℕ} (hd : 1 ≤ d) {F₀ F₁ : Measure ℝ}
    [IsProbabilityMeasure F₀] [IsProbabilityMeasure F₁] (h₀ : F₀ (Iio 0) = 0)
    (h₁ : F₁ (Iio 0) = 0)
    (h : ∀ t, 0 ≤ t → ∫ r, sphereCharFun d (r * t) ∂F₀ = ∫ r, sphereCharFun d (r * t) ∂F₁) :
    F₀ = F₁ := by
  sorry

/-- 3.1. **The radial measure is the image of the spectral measure under the norm.** -/
theorem integral_sphereCharFun_map_norm {d : ℕ} (hd : 1 ≤ d) {φ : ℝ → ℝ}
    (F : Measure (EuclideanSpace ℝ (Fin d))) [IsFiniteMeasure F]
    (hF : ∀ x, charFun F x = (φ ‖x‖ : ℂ)) (t : ℝ) (ht : 0 ≤ t) :
    φ t = ∫ r, sphereCharFun d (r * t) ∂(F.map fun ξ ↦ ‖ξ‖) := by
  sorry

/-- 3.1. **The radial spectral density**: if `r^{d−1} φ(r)` is integrable on `(0, ∞)`, the
spectral measure has the radial density
`f(u) = (2^{d−1} π^{d/2} Γ(d/2))⁻¹ ∫₀^∞ Ω_d(ur) r^{d−1} φ(r) dr`. -/
theorem eq_withDensity_of_integrableOn_radial {d : ℕ} (hd : 1 ≤ d) {φ : ℝ → ℝ}
    (hint : IntegrableOn (fun r ↦ r ^ (d - 1) * φ r) (Ioi 0))
    (F : Measure (EuclideanSpace ℝ (Fin d))) [IsFiniteMeasure F]
    (hF : ∀ x, charFun F x = (φ ‖x‖ : ℂ)) :
    F = volume.withDensity fun ξ ↦ ENNReal.ofReal
      ((2 ^ (d - 1) * Real.pi ^ ((d : ℝ) / 2) * Real.Gamma ((d : ℝ) / 2))⁻¹ *
        ∫ r in Ioi (0 : ℝ), sphereCharFun d (‖ξ‖ * r) * r ^ (d - 1) * φ r) := by
  sorry

/-- 3.1. **Strict nesting** `Φ_{d+1} ⊊ Φ_d` and `Φ_∞ ⊊ Φ_d`. -/
theorem isotropicClass_ssubset {d : ℕ} (hd : 1 ≤ d) :
    isotropicClass (d + 1) ⊂ isotropicClass d ∧ isotropicClassInf ⊂ isotropicClass d := by
  sorry

/-- 3.1. **Strict positive definiteness** of the non-constant members of `Φ_d`, `d ≥ 2`. -/
theorem isStrictlyPositiveDefiniteSub_of_mem_isotropicClass {d : ℕ} (hd : 2 ≤ d)
    {φ : ℝ → ℝ} (hφ : φ ∈ isotropicClass d) (hne : ∃ t, 0 ≤ t ∧ φ t ≠ 1) :
    IsStrictlyPositiveDefiniteSub fun x : EuclideanSpace ℝ (Fin d) ↦ (φ ‖x‖ : ℂ) := by
  sorry

/-- 3.2. **The simplex bound** `φ ≥ −1/d` on `[0, ∞)` for `φ ∈ Φ_d`. -/
theorem neg_inv_le_of_mem_isotropicClass {d : ℕ} (hd : 1 ≤ d) {φ : ℝ → ℝ}
    (hφ : φ ∈ isotropicClass d) {t : ℝ} (ht : 0 ≤ t) : -(d : ℝ)⁻¹ ≤ φ t := by
  sorry

/-- 3.2. **The sharp lower bound** `φ(t) ≥ inf_{s ≥ 0} Ω_d(s)`; the infimum is a value
`Ω_d(s₀)`, and every `Ω_d(s₀ ·)` lies in `Φ_d`, so the bound is attained. -/
theorem iInf_sphereCharFun_le_of_mem_isotropicClass {d : ℕ} (hd : 1 ≤ d) {φ : ℝ → ℝ}
    (hφ : φ ∈ isotropicClass d) {t : ℝ} (ht : 0 ≤ t) :
    (⨅ s : Ici (0 : ℝ), sphereCharFun d s) ≤ φ t ∧
      (∃ s₀, 0 ≤ s₀ ∧ sphereCharFun d s₀ = ⨅ s : Ici (0 : ℝ), sphereCharFun d s) ∧
      ∀ s₀ : ℝ, (fun t ↦ sphereCharFun d (s₀ * t)) ∈ isotropicClass d := by
  sorry

/-- 3.2. **Rigidity**: for `d ≥ 2`, a member of `Φ_d` with `φ(t₀) = 1` at some `t₀ > 0` is
identically `1` on `[0, ∞)`. -/
theorem eq_one_of_mem_isotropicClass {d : ℕ} (hd : 2 ≤ d) {φ : ℝ → ℝ}
    (hφ : φ ∈ isotropicClass d) {t₀ : ℝ} (ht₀ : 0 < t₀) (h1 : φ t₀ = 1) :
    ∀ t, 0 ≤ t → φ t = 1 := by
  sorry

/-- 3.3. **Schoenberg's theorem for `Φ_∞`**: Gaussian scale mixtures. -/
theorem mem_isotropicClassInf_iff_gaussianMixture {φ : ℝ → ℝ} :
    φ ∈ isotropicClassInf ↔ ∃ F : Measure ℝ, IsProbabilityMeasure F ∧ F (Iio 0) = 0 ∧
      ∀ t, 0 ≤ t → φ t = ∫ r, Real.exp (-(r ^ 2 * t ^ 2)) ∂F := by
  sorry

/-- 3.3. **The completely monotone criterion**: `φ ∈ Φ_∞` iff `φ(0) = 1` and `t ↦ φ(√t)` is
completely monotone. -/
theorem mem_isotropicClassInf_iff_completelyMonotone {φ : ℝ → ℝ} :
    φ ∈ isotropicClassInf ↔
      φ 0 = 1 ∧ TauCeti.IsContinuousCompletelyMonotoneOnIoi fun t ↦ φ (Real.sqrt t) := by
  sorry

open scoped ContDiff in
/-- 3.3. Members of `Φ_∞` are positive, nonincreasing, strictly decreasing unless constant,
and smooth on `(0, ∞)`. -/
theorem properties_of_mem_isotropicClassInf {φ : ℝ → ℝ} (hφ : φ ∈ isotropicClassInf) :
    (∀ t, 0 ≤ t → 0 < φ t) ∧ AntitoneOn φ (Ici 0) ∧
      ((∃ t, 0 ≤ t ∧ φ t ≠ 1) → StrictAntiOn φ (Ici 0)) ∧ ContDiffOn ℝ ∞ φ (Ioi 0) := by
  sorry

/-- 3.3. **The Gaussian limit** `Ω_d(√(2d) t) → e^{−t²}` uniformly on `[0, ∞)`. -/
theorem tendstoUniformlyOn_sphereCharFun :
    TendstoUniformlyOn (fun (d : ℕ) (t : ℝ) ↦ sphereCharFun d (Real.sqrt (2 * d) * t))
      (fun t ↦ Real.exp (-t ^ 2)) atTop (Ici 0) := by
  sorry

/-- 3.3. **Completely monotone correlations lie in `Φ_∞`.** -/
theorem mem_isotropicClassInf_of_completelyMonotone {φ : ℝ → ℝ}
    (hφ : TauCeti.IsContinuousCompletelyMonotoneOnIoi φ) (h0 : φ 0 = 1) :
    φ ∈ isotropicClassInf := by
  sorry

/-- 3.3. **The powered exponential family** `e^{−c t^α}`, `c ≥ 0`, `0 < α ≤ 2`. -/
theorem exp_neg_rpow_mem_isotropicClassInf {c α : ℝ} (hc : 0 ≤ c) (hα₀ : 0 < α)
    (hα₂ : α ≤ 2) : (fun t ↦ Real.exp (-c * |t| ^ α)) ∈ isotropicClassInf := by
  sorry

/-- 3.3. **The generalized Cauchy family** `(1 + t^α)^{−β/α}`, `0 < α ≤ 2`, `β > 0`. -/
theorem cauchyType_mem_isotropicClassInf {α β : ℝ} (hα₀ : 0 < α) (hα₂ : α ≤ 2) (hβ : 0 < β) :
    (fun t ↦ (1 + |t| ^ α) ^ (-β / α)) ∈ isotropicClassInf := by
  sorry

/-- 3.4. **Pólya's criterion**: a continuous convex `φ` on `[0, ∞)` with `φ(0) = 1` and limit
`0` at infinity lies in `Φ_1`. -/
theorem mem_isotropicClass_one_of_convexOn {φ : ℝ → ℝ} (hc : ContinuousOn φ (Ici 0))
    (hconv : ConvexOn ℝ (Ici 0) φ) (h0 : φ 0 = 1) (hlim : Tendsto φ atTop (𝓝 0)) :
    φ ∈ isotropicClass 1 := by
  sorry

/-- 3.4. **Truncated powers**: `(1 − t/a)₊^ν ∈ Φ_n` iff `ν ≥ (n + 1)/2`. -/
theorem truncatedPower_mem_isotropicClass_iff {a ν : ℝ} (ha : 0 < a) (hν : 0 < ν) {n : ℕ}
    (hn : 1 ≤ n) :
    (fun t ↦ max (1 - |t| / a) 0 ^ ν) ∈ isotropicClass n ↔ ((n : ℝ) + 1) / 2 ≤ ν := by
  sorry

/-- 3.4. **The triangular function** lies in `Φ_1` and not in `Φ_2`. -/
theorem triangular_mem_isotropicClass {a : ℝ} (ha : 0 < a) :
    (fun t ↦ max (1 - |t| / a) 0) ∈ isotropicClass 1 ∧
      (fun t ↦ max (1 - |t| / a) 0) ∉ isotropicClass 2 := by
  sorry

end Layer3

/-! ## Layer 4: the Matérn family -/

section Layer4

/-- 4.1. The **Matérn correlation** `φ_{ν,θ}(t) = 2^{1−ν}/Γ(ν) (|t|/θ)^ν K_ν(|t|/θ)`, with the
value `1` at `t = 0`. -/
def maternCorrelation (ν θ t : ℝ) : ℝ :=
  if t = 0 then 1 else
    2 ^ (1 - ν) / Real.Gamma ν * (|t| / θ) ^ ν * (positiveAxisBesselK ν (|t| / θ)).re

/-- 4.1. The **Matérn spectral density** on `ℝ^d`,
`Γ(ν + d/2)/(Γ(ν) π^{d/2}) θ^d (1 + θ² ‖ω‖²)^{−ν−d/2}`. -/
def maternSpectralDensity (ν θ : ℝ) (d : ℕ) (ω : EuclideanSpace ℝ (Fin d)) : ℝ :=
  Real.Gamma (ν + d / 2) / (Real.Gamma ν * Real.pi ^ ((d : ℝ) / 2)) * θ ^ d *
    (1 + θ ^ 2 * ‖ω‖ ^ 2) ^ (-ν - d / 2)

/-- 4.1. The **Matérn spectral measure**. -/
def maternSpectralMeasure (ν θ : ℝ) (d : ℕ) : Measure (EuclideanSpace ℝ (Fin d)) :=
  volume.withDensity fun ω ↦ ENNReal.ofReal (maternSpectralDensity ν θ d ω)

/-- 4.1. **The Matérn spectral measure** is a probability measure with characteristic
function `φ_{ν,θ}(‖h‖)`. -/
theorem charFun_maternSpectralMeasure {ν θ : ℝ} (hν : 0 < ν) (hθ : 0 < θ) (d : ℕ) :
    IsProbabilityMeasure (maternSpectralMeasure ν θ d) ∧
      ∀ h, charFun (maternSpectralMeasure ν θ d) h = (maternCorrelation ν θ ‖h‖ : ℂ) := by
  sorry

/-- 4.1. `φ_{ν,θ} ∈ Φ_∞`. -/
theorem maternCorrelation_mem_isotropicClassInf {ν θ : ℝ} (hν : 0 < ν) (hθ : 0 < θ) :
    maternCorrelation ν θ ∈ isotropicClassInf := by
  sorry

/-- 4.1. `φ_{1/2,θ}(t) = e^{−t/θ}`. -/
theorem maternCorrelation_half {θ : ℝ} (hθ : 0 < θ) {t : ℝ} (ht : 0 ≤ t) :
    maternCorrelation (1 / 2) θ t = Real.exp (-t / θ) := by
  sorry

/-- 4.1. `φ_{3/2,θ}(t) = (1 + t/θ) e^{−t/θ}`. -/
theorem maternCorrelation_threeHalves {θ : ℝ} (hθ : 0 < θ) {t : ℝ} (ht : 0 ≤ t) :
    maternCorrelation (3 / 2) θ t = (1 + t / θ) * Real.exp (-t / θ) := by
  sorry

/-- 4.1. **Half-integer orders**: `φ_{m+1/2,θ}(t)` is `e^{−t/θ}` times a polynomial of degree
`m` in `t/θ`. -/
theorem maternCorrelation_halfInteger {θ : ℝ} (hθ : 0 < θ) (m : ℕ) :
    ∃ p : Polynomial ℝ, p.natDegree = m ∧ ∀ t, 0 ≤ t →
      maternCorrelation (m + 1 / 2) θ t = Real.exp (-t / θ) * p.eval (t / θ) := by
  sorry

/-- 4.1. **The Gaussian limit**: with `θ = 1/(2√ν)`, `φ_{ν,θ}(t) → e^{−t²}` as `ν → ∞`. -/
theorem tendsto_maternCorrelation_gaussian {t : ℝ} (ht : 0 ≤ t) :
    Tendsto (fun ν ↦ maternCorrelation ν (1 / (2 * Real.sqrt ν)) t) atTop
      (𝓝 (Real.exp (-t ^ 2))) := by
  sorry

/-- 4.1. **Complete monotonicity** holds exactly for `0 < ν ≤ 1/2`. -/
theorem maternCorrelation_completelyMonotone_iff {ν θ : ℝ} (hν : 0 < ν) (hθ : 0 < θ) :
    TauCeti.IsContinuousCompletelyMonotoneOnIoi (maternCorrelation ν θ) ↔ ν ≤ 1 / 2 := by
  sorry

/-- 4.2. **Mean-square differentiability of Matérn processes**: `m` times mean-square
differentiable iff `m < ν`. -/
theorem isMeanSquareDifferentiable_matern_iff {Ω : Type*} [MeasurableSpace Ω]
    {P : Measure Ω} [IsProbabilityMeasure P] {Z : ℝ → Ω → ℝ}
    (hZ : IsSecondOrderStationary Z P) (hcent : ∀ t, P[Z t] = 0) {ν θ σsq : ℝ} (hν : 0 < ν)
    (hθ : 0 < θ) (hσ : 0 < σsq) (hK : ∀ h, stationaryCov Z P h = σsq * maternCorrelation ν θ h)
    (m : ℕ) : IsMeanSquareDifferentiable m Z P ↔ (m : ℝ) < ν := by
  sorry

/-- 4.2. **Small-lag order**: `1 − φ_{ν,θ}(t)` is of exact order `t^{min(2ν, 2)}` for
`ν ≠ 1` and `t² log(1/t)` for `ν = 1`, as `t ↓ 0`. -/
theorem one_sub_maternCorrelation_isTheta {ν θ : ℝ} (hν : 0 < ν) (hθ : 0 < θ) :
    (fun t ↦ 1 - maternCorrelation ν θ t) =Θ[𝓝[>] 0]
      fun t ↦ if ν = 1 then t ^ 2 * Real.log t⁻¹ else t ^ min (2 * ν) 2 := by
  sorry

/-- 4.2. **Principal irregular term**, `ν ∉ ℕ`: `c t^{2ν}` with `c ≠ 0`, after an even
polynomial of degree less than `2ν`. -/
theorem maternCorrelation_principalIrregularTerm {ν θ : ℝ} (hν : 0 < ν) (hθ : 0 < θ)
    (hνn : ∀ n : ℕ, ν ≠ n) :
    ∃ c : ℝ, c ≠ 0 ∧ ∃ p : Polynomial ℝ, p.natDegree ≤ ⌊ν⌋₊ ∧
      (fun t ↦ maternCorrelation ν θ t - p.eval (t ^ 2) - c * t ^ (2 * ν)) =o[𝓝[>] 0]
        fun t ↦ t ^ (2 * ν) := by
  sorry

/-- 4.2. **Principal irregular term**, `ν = n ∈ ℕ`, `n ≥ 1`: `c t^{2n} log t` with `c ≠ 0`. -/
theorem maternCorrelation_principalIrregularTerm_natCast {n : ℕ} (hn : 1 ≤ n) {θ : ℝ}
    (hθ : 0 < θ) :
    ∃ c : ℝ, c ≠ 0 ∧ ∃ p : Polynomial ℝ, p.natDegree ≤ n ∧
      (fun t ↦ maternCorrelation n θ t - p.eval (t ^ 2) - c * t ^ (2 * n) * Real.log t)
        =o[𝓝[>] 0] fun t ↦ t ^ (2 * n) * Real.log t := by
  sorry

end Layer4

/-! ## Layer 5: variograms -/

section Layer5

variable {Ω : Type*} [MeasurableSpace Ω]

/-- 5.1. **Conditional negative definiteness** of a real function on an additive group:
`∑ cᵢ cⱼ γ(xᵢ − xⱼ) ≤ 0` whenever `∑ cᵢ = 0`. -/
def IsCondNegDef {G : Type*} [AddCommGroup G] (γ : G → ℝ) : Prop :=
  ∀ (n : ℕ) (c : Fin n → ℝ) (x : Fin n → G), ∑ i, c i = 0 →
    ∑ i, ∑ j, c i * c j * γ (x i - x j) ≤ 0

/-- 5.1. **Properties of the semivariogram** of an intrinsically stationary field:
`γ(0) = 0`, `γ(−h) = γ(h) ≥ 0`, and for coefficients summing to `0`,
`Var(∑ aᵢ Z(sᵢ)) = −∑ aᵢ aⱼ γ(sᵢ − sⱼ)`; hence `γ` is conditionally negative definite. -/
theorem IsIntrinsicallyStationary.semivariogram_properties {G : Type*} [AddCommGroup G]
    {P : Measure Ω} [IsProbabilityMeasure P] {Z : G → Ω → ℝ}
    (hZ : IsIntrinsicallyStationary Z P) :
    semivariogram Z P 0 = 0 ∧ (∀ h, semivariogram Z P (-h) = semivariogram Z P h) ∧
      (∀ h, 0 ≤ semivariogram Z P h) ∧
      (∀ (n : ℕ) (a : Fin n → ℝ) (s : Fin n → G), ∑ i, a i = 0 →
        Var[fun ω ↦ ∑ i, a i * Z (s i) ω; P] =
          -∑ i, ∑ j, a i * a j * semivariogram Z P (s i - s j)) ∧
      IsCondNegDef (semivariogram Z P) := by
  sorry

/-- 5.1. **Continuity of semivariograms**:
`|γ(s + h) − γ(s)| ≤ √γ(h) (√γ(s) + √γ(s + h))`, so `γ` is continuous if it is continuous
at `0`. -/
theorem IsIntrinsicallyStationary.abs_semivariogram_sub_le {E : Type*} [NormedAddCommGroup E]
    {P : Measure Ω} [IsProbabilityMeasure P] {Z : E → Ω → ℝ}
    (hZ : IsIntrinsicallyStationary Z P) :
    (∀ s h, |semivariogram Z P (s + h) - semivariogram Z P s| ≤
      Real.sqrt (semivariogram Z P h) *
        (Real.sqrt (semivariogram Z P s) + Real.sqrt (semivariogram Z P (s + h)))) ∧
    (ContinuousAt (semivariogram Z P) 0 → Continuous (semivariogram Z P)) := by
  sorry

/-- 5.1. **Growth of semivariograms**: `γ(n h) ≤ n² γ(h)`, and a semivariogram bounded near
`0` grows at most quadratically. -/
theorem IsIntrinsicallyStationary.semivariogram_growth {E : Type*} [NormedAddCommGroup E]
    [NormedSpace ℝ E] {P : Measure Ω} [IsProbabilityMeasure P] {Z : E → Ω → ℝ}
    (hZ : IsIntrinsicallyStationary Z P) :
    (∀ (n : ℕ) h, semivariogram Z P (n • h) ≤ (n : ℝ) ^ 2 * semivariogram Z P h) ∧
    ((∃ δ > 0, ∃ M, ∀ h, ‖h‖ < δ → semivariogram Z P h ≤ M) →
      ∃ a b : ℝ, 0 ≤ a ∧ 0 ≤ b ∧ ∀ h, semivariogram Z P h ≤ a * ‖h‖ ^ 2 + b) := by
  sorry

variable {d : ℕ}

/-- 5.2. **Schoenberg–von Neumann**: for continuous even `γ` with `γ(0) = 0` on `ℝ^d`,
conditional negative definiteness, positive definiteness of every `e^{−tγ}`, and the
Lévy–Khintchine form `γ(h) = Q(h) + ∫ (1 − cos⟪ω, h⟫)/‖ω‖² χ(dω)` are equivalent. -/
theorem isCondNegDef_tfae {γ : EuclideanSpace ℝ (Fin d) → ℝ} (hγ : Continuous γ)
    (h0 : γ 0 = 0) (heven : Function.Even γ) :
    List.TFAE [IsCondNegDef γ,
      ∀ t : ℝ, 0 < t → TauCeti.IsPositiveDefiniteSub fun h ↦ (Real.exp (-t * γ h) : ℂ),
      ∃ T : EuclideanSpace ℝ (Fin d) →L[ℝ] EuclideanSpace ℝ (Fin d), T.IsPositive ∧
        ∃ χ : Measure (EuclideanSpace ℝ (Fin d)), χ.map Neg.neg = χ ∧ χ {0} = 0 ∧
          ∫⁻ ξ, ENNReal.ofReal (1 + ‖ξ‖ ^ 2)⁻¹ ∂χ < ⊤ ∧
          ∀ h, γ h = ⟪T h, h⟫ + ∫ ξ, (1 - Real.cos ⟪ξ, h⟫) / ‖ξ‖ ^ 2 ∂χ] := by
  sorry

/-- 5.2. **Every conditionally negative definite even `γ` with `γ(0) = 0` is a
semivariogram**, of a Gaussian field with centred increments. -/
theorem exists_isGaussianProcess_semivariogram {γ : EuclideanSpace ℝ (Fin d) → ℝ}
    (h0 : γ 0 = 0) (hcnd : IsCondNegDef γ) (heven : Function.Even γ) :
    ∃ P : Measure (EuclideanSpace ℝ (Fin d) → ℝ), IsProbabilityMeasure P ∧
      IsGaussianProcess (fun x (ω : EuclideanSpace ℝ (Fin d) → ℝ) ↦ ω x) P ∧
      IsIntrinsicallyStationary (fun x (ω : EuclideanSpace ℝ (Fin d) → ℝ) ↦ ω x) P ∧
      semivariogram (fun x (ω : EuclideanSpace ℝ (Fin d) → ℝ) ↦ ω x) P = γ := by
  sorry

/-- 5.2. **Power variograms**: `‖h‖^α` is conditionally negative definite for `0 < α ≤ 2`. -/
theorem isCondNegDef_norm_rpow {α : ℝ} (hα₀ : 0 < α) (hα₂ : α ≤ 2) :
    IsCondNegDef fun h : EuclideanSpace ℝ (Fin d) ↦ ‖h‖ ^ α := by
  sorry

end Layer5

/-! ## Layer 6: space–time covariances -/

section Layer6

variable {d : ℕ}

/-- 6.1. **Cressie–Huang**: a continuous, bounded, integrable, symmetric `C` on `ℝ^d × ℝ` is
positive definite iff for almost every `ω` the partial spatial Fourier transform agrees almost
everywhere with a continuous positive definite function of the time lag. -/
theorem isPositiveDefiniteSub_iff_ae_spatialFourier
    {C : EuclideanSpace ℝ (Fin d) × ℝ → ℝ} (hc : Continuous C) (hb : ∃ M, ∀ z, |C z| ≤ M)
    (hi : Integrable C) (hs : ∀ z, C (-z) = C z) :
    TauCeti.IsPositiveDefiniteSub (fun z ↦ (C z : ℂ)) ↔
      ∀ᵐ ξ : EuclideanSpace ℝ (Fin d), ∃ F : ℝ → ℂ, Continuous F ∧
        TauCeti.IsPositiveDefiniteSub F ∧
        (fun u : ℝ ↦ ∫ h : EuclideanSpace ℝ (Fin d), Complex.exp (-(⟪h, ξ⟫ : ℂ) * I) * C (h, u))
          =ᵐ[volume] F := by
  sorry

/-- 6.1. **The damping criterion**: a real `C` is positive definite iff
`e^{−a‖h‖ − b|u|} C(h, u)` is positive definite for all `a, b > 0`. -/
theorem isPositiveDefiniteSub_iff_forall_exp_mul {C : EuclideanSpace ℝ (Fin d) × ℝ → ℝ} :
    TauCeti.IsPositiveDefiniteSub (fun z ↦ (C z : ℂ)) ↔
      ∀ a b : ℝ, 0 < a → 0 < b → TauCeti.IsPositiveDefiniteSub fun z ↦
        ((Real.exp (-a * ‖z.1‖ - b * |z.2|) * C z : ℝ) : ℂ) := by
  sorry

/-- 6.2. **Gneiting's construction**:
`σ² ψ(u²)^{−d/2} φ(‖h‖²/ψ(u²))` is positive definite on `ℝ^d × ℝ`. -/
theorem isPositiveDefiniteSub_gneiting {φ ψ : ℝ → ℝ}
    (hφ : TauCeti.IsContinuousCompletelyMonotoneOnIoi φ) (hψc : ContinuousOn ψ (Ici 0))
    (hψpos : ∀ t, 0 ≤ t → 0 < ψ t) (hψd : DifferentiableOn ℝ ψ (Ioi 0))
    (hψ' : TauCeti.IsCompletelyMonotoneOnIoi (deriv ψ)) {σsq : ℝ} (hσ : 0 < σsq) :
    TauCeti.IsPositiveDefiniteSub fun z : EuclideanSpace ℝ (Fin d) × ℝ ↦
      ((σsq / ψ (z.2 ^ 2) ^ ((d : ℝ) / 2) * φ (‖z.1‖ ^ 2 / ψ (z.2 ^ 2)) : ℝ) : ℂ) := by
  sorry

/-- 6.2. **Gneiting's parametric family**, `a, c ≥ 0`, `α, γ ∈ (0, 1]`, `β ∈ [0, 1]`. -/
theorem isPositiveDefiniteSub_gneiting_family {a c α β γ σsq : ℝ} (ha : 0 ≤ a) (hc : 0 ≤ c)
    (hα₀ : 0 < α) (hα₁ : α ≤ 1) (hγ₀ : 0 < γ) (hγ₁ : γ ≤ 1) (hβ₀ : 0 ≤ β) (hβ₁ : β ≤ 1)
    (hσ : 0 < σsq) :
    TauCeti.IsPositiveDefiniteSub fun z : EuclideanSpace ℝ (Fin d) × ℝ ↦
      ((σsq / ((a * (z.2 ^ 2) ^ α + 1) ^ β) ^ ((d : ℝ) / 2) *
        Real.exp (-c * (‖z.1‖ ^ 2 / (a * (z.2 ^ 2) ^ α + 1) ^ β) ^ γ) : ℝ) : ℂ) := by
  sorry

end Layer6

/-! ## Layer 7: correlations on spheres -/

section Layer7

/-- 7.1. The kernel `ψ(θ(x, y))`, `θ(x, y) = arccos ⟪x, y⟫`, on `S^d ⊂ ℝ^{d+1}`. -/
def sphereKernel (d : ℕ) (ψ : ℝ → ℝ) :
    Matrix (Metric.sphere (0 : EuclideanSpace ℝ (Fin (d + 1))) 1)
      (Metric.sphere (0 : EuclideanSpace ℝ (Fin (d + 1))) 1) ℝ :=
  Matrix.of fun x y ↦ ψ (Real.arccos ⟪(x : EuclideanSpace ℝ (Fin (d + 1))), y⟫)

/-- 7.1. The class `Ψ_d` of correlations on `S^d` in great-circle distance. -/
def sphereClass (d : ℕ) : Set (ℝ → ℝ) :=
  {ψ | ContinuousOn ψ (Icc 0 Real.pi) ∧ ψ 0 = 1 ∧ (sphereKernel d ψ).PosSemidef}

/-- 7.1. The class `Ψ_d⁺` of its strictly positive definite members. -/
def strictSphereClass (d : ℕ) : Set (ℝ → ℝ) :=
  {ψ | ContinuousOn ψ (Icc 0 Real.pi) ∧ ψ 0 = 1 ∧ (sphereKernel d ψ).PosDef}

/-- 7.1. `Ψ_∞ = ⋂_{d ≥ 1} Ψ_d`. -/
def sphereClassInf : Set (ℝ → ℝ) := ⋂ d : ℕ, sphereClass (d + 1)

/-- 7.1. `Ψ_∞⁺ = ⋂_{d ≥ 1} Ψ_d⁺`. -/
def strictSphereClassInf : Set (ℝ → ℝ) := ⋂ d : ℕ, strictSphereClass (d + 1)

/-- 7.1. **Schoenberg's theorem on `S^d`**: `ψ ∈ Ψ_d` iff
`ψ(θ) = ∑ b_{n,d} ω_{d+1,n}(cos θ)` on `[0, π]` with `b_{n,d} ≥ 0` and `∑ b_{n,d} = 1`. -/
theorem mem_sphereClass_iff {d : ℕ} (hd : 1 ≤ d) {ψ : ℝ → ℝ} :
    ψ ∈ sphereClass d ↔ ∃ b : ℕ → ℝ, (∀ n, 0 ≤ b n) ∧ HasSum b 1 ∧
      ∀ θ ∈ Icc 0 Real.pi,
        HasSum (fun n ↦ b n * (zonalPolynomial (d + 1) n).eval (Real.cos θ)) (ψ θ) := by
  sorry

/-- 7.1. **Uniqueness of the Schoenberg coefficients.** -/
theorem eq_of_hasSum_zonalPolynomial {d : ℕ} (hd : 1 ≤ d) {ψ : ℝ → ℝ} {b b' : ℕ → ℝ}
    (hb : ∀ θ ∈ Icc 0 Real.pi,
      HasSum (fun n ↦ b n * (zonalPolynomial (d + 1) n).eval (Real.cos θ)) (ψ θ))
    (hb' : ∀ θ ∈ Icc 0 Real.pi,
      HasSum (fun n ↦ b' n * (zonalPolynomial (d + 1) n).eval (Real.cos θ)) (ψ θ))
    (hs : Summable fun n ↦ |b n|) (hs' : Summable fun n ↦ |b' n|) : b = b' := by
  sorry

/-- 7.1. **Schoenberg's theorem for `Ψ_∞`**: power series in `cos θ` with nonnegative
coefficients summing to `1`. -/
theorem mem_sphereClassInf_iff {ψ : ℝ → ℝ} :
    ψ ∈ sphereClassInf ↔ ∃ b : ℕ → ℝ, (∀ n, 0 ≤ b n) ∧ HasSum b 1 ∧
      ∀ θ ∈ Icc 0 Real.pi, HasSum (fun n ↦ b n * Real.cos θ ^ n) (ψ θ) := by
  sorry

/-- 7.2. **Strict positive definiteness on `S^d`, `d ≥ 2`**: infinitely many even and
infinitely many odd positive coefficients. -/
theorem mem_strictSphereClass_iff {d : ℕ} (hd : 2 ≤ d) {ψ : ℝ → ℝ}
    {b : ℕ → ℝ} (hb₀ : ∀ n, 0 ≤ b n) (hb₁ : HasSum b 1)
    (hb : ∀ θ ∈ Icc 0 Real.pi,
      HasSum (fun n ↦ b n * (zonalPolynomial (d + 1) n).eval (Real.cos θ)) (ψ θ)) :
    ψ ∈ strictSphereClass d ↔
      {n | Even n ∧ 0 < b n}.Infinite ∧ {n | Odd n ∧ 0 < b n}.Infinite := by
  sorry

/-- 7.2. **Strict positive definiteness on the circle**: for any `0 ≤ j < n` some `b_m` with
`m ≡ ±j (mod n)` is positive, that is, `{m ∈ ℤ : b_{|m|} > 0}` meets every residue class. -/
theorem mem_strictSphereClass_one_iff {ψ : ℝ → ℝ} {b : ℕ → ℝ} (hb₀ : ∀ n, 0 ≤ b n)
    (hb₁ : HasSum b 1)
    (hb : ∀ θ ∈ Icc 0 Real.pi, HasSum (fun n ↦ b n * Real.cos (n * θ)) (ψ θ)) :
    ψ ∈ strictSphereClass 1 ↔
      ∀ j n : ℕ, j < n → ∃ k : ℕ, 0 < b (j + k * n) ∨ 0 < b (n - j + k * n) := by
  sorry

/-- 7.2. **Strict positive definiteness on all spheres**: the same even/odd criterion for
the coefficients of `Ψ_∞`. -/
theorem mem_strictSphereClassInf_iff {ψ : ℝ → ℝ} {b : ℕ → ℝ} (hb₀ : ∀ n, 0 ≤ b n)
    (hb₁ : HasSum b 1) (hb : ∀ θ ∈ Icc 0 Real.pi, HasSum (fun n ↦ b n * Real.cos θ ^ n) (ψ θ)) :
    ψ ∈ strictSphereClassInf ↔
      {n | Even n ∧ 0 < b n}.Infinite ∧ {n | Odd n ∧ 0 < b n}.Infinite := by
  sorry

/-- 7.3. **Closure**: `Ψ_d` is convex and closed under products. -/
theorem convex_sphereClass (d : ℕ) :
    Convex ℝ (sphereClass d) ∧
      ∀ ψ₁ ∈ sphereClass d, ∀ ψ₂ ∈ sphereClass d, ψ₁ * ψ₂ ∈ sphereClass d := by
  sorry

/-- 7.3. **Closure under pointwise limits** with continuous limit. -/
theorem mem_sphereClass_of_tendsto {d : ℕ} {ψ : ℕ → ℝ → ℝ} {ψ₀ : ℝ → ℝ}
    (hψ : ∀ k, ψ k ∈ sphereClass d)
    (hlim : ∀ θ ∈ Icc 0 Real.pi, Tendsto (fun k ↦ ψ k θ) atTop (𝓝 (ψ₀ θ)))
    (hc : ContinuousOn ψ₀ (Icc 0 Real.pi)) : ψ₀ ∈ sphereClass d := by
  sorry

/-- 7.4. **Chordal distance (Yadrenko)**: for `k ≥ 2` and `φ ∈ Φ_k`,
`θ ↦ φ(2 sin(θ/2))` lies in `Ψ_{k−1}`, and in `Ψ_{k−1}⁺` if `φ` is not constant. -/
theorem comp_chordal_mem_sphereClass {k : ℕ} (hk : 2 ≤ k) {φ : ℝ → ℝ}
    (hφ : φ ∈ isotropicClass k) :
    (fun θ ↦ φ (2 * Real.sin (θ / 2))) ∈ sphereClass (k - 1) ∧
      ((∃ t, 0 ≤ t ∧ φ t ≠ 1) →
        (fun θ ↦ φ (2 * Real.sin (θ / 2))) ∈ strictSphereClass (k - 1)) := by
  sorry

/-- 7.4. **Compactly supported members of `Φ_3` in great-circle distance**: if `φ ∈ Φ_3`
vanishes on `[π, ∞)`, then `φ ∈ Ψ_3⁺`. -/
theorem mem_strictSphereClass_three_of_eq_zero {φ : ℝ → ℝ} (hφ : φ ∈ isotropicClass 3)
    (hsupp : ∀ t, Real.pi ≤ t → φ t = 0) : φ ∈ strictSphereClass 3 := by
  sorry

/-- 7.4. **Completely monotone functions in great-circle distance**: for continuous completely
monotone non-constant `φ` with `φ(0) = 1` and `c > 0`, `θ ↦ φ(θ/c) ∈ Ψ_∞⁺`. -/
theorem comp_div_mem_strictSphereClassInf {φ : ℝ → ℝ}
    (hφ : TauCeti.IsContinuousCompletelyMonotoneOnIoi φ) (h0 : φ 0 = 1)
    (hne : ∃ t, 0 ≤ t ∧ φ t ≠ 1) {c : ℝ} (hc : 0 < c) :
    (fun θ ↦ φ (θ / c)) ∈ strictSphereClassInf := by
  sorry

/-- 7.4. **The powered exponential family on spheres**: `e^{−(θ/c)^α} ∈ Ψ_∞⁺` for
`α ∈ (0, 1]` and in no `Ψ_d` for `α > 1`. -/
theorem exp_neg_rpow_mem_sphereClass {c α : ℝ} (hc : 0 < c) (hα : 0 < α) :
    (α ≤ 1 → (fun θ ↦ Real.exp (-(θ / c) ^ α)) ∈ strictSphereClassInf) ∧
      (1 < α → ∀ d : ℕ, 1 ≤ d → (fun θ ↦ Real.exp (-(θ / c) ^ α)) ∉ sphereClass d) := by
  sorry

/-- 7.4. **The Matérn family on spheres**: `φ_{ν,c}` in great-circle distance lies in
`Ψ_∞⁺` for `ν ∈ (0, 1/2]` and in no `Ψ_d` for `ν > 1/2`. -/
theorem maternCorrelation_mem_sphereClass {ν c : ℝ} (hν : 0 < ν) (hc : 0 < c) :
    (ν ≤ 1 / 2 → maternCorrelation ν c ∈ strictSphereClassInf) ∧
      (1 / 2 < ν → ∀ d : ℕ, 1 ≤ d → maternCorrelation ν c ∉ sphereClass d) := by
  sorry

end Layer7

end TauCetiRoadmap.SecondOrderRandomFields
