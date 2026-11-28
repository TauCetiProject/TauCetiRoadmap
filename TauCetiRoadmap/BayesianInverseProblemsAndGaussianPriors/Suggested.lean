module

public import Mathlib
public import TauCeti.Analysis.InnerProductSpace.ContinuousFunctionalCalculus
public import TauCeti.Analysis.InnerProductSpace.HilbertSchmidt.Columns
public import TauCeti.Analysis.InnerProductSpace.Spectrum
public import TauCeti.Analysis.OperatorIdeal.Nuclear.Basic
public import TauCeti.Probability.Distributions.Gaussian.Density

/-!
# Bayesian inverse problems and Gaussian priors: target signatures

This file is not the roadmap: the roadmap is `README.md`, and this file is not an exhaustive
checklist. It states, against the pinned Mathlib and Tau Ceti and each with `sorry`, the
headlines of the README that carry a Lean name, each with every conclusion the README attaches to
it, together with the definitions their statements need. Every headline whose carriers exist at
the pins is stated. The bullets of the README without a Lean name are definitions given in prose,
results supplied by Mathlib, Tau Ceti or other roadmaps, or facts about a single definition that
follow in one step from it; these are API lemmas, not headlines.

The conventions of the README are used throughout. `H` is a separable real Hilbert space with its
Borel σ-algebra. The covariance operator of a random variable `u : Ω → H` is Mathlib's
uncentred `covarianceOperator` applied to the law of `u - m`, where `m` is the mean
(`centeredCovariance P u`); that of a measure `μ` on `H` is `centeredCovariance μ id`.
Eigen-expansions are `IsEigenExpansion`. The square root `C^{1/2}` of a positive operator is
`cfc Real.sqrt C`, Tau Ceti's continuous functional calculus for self-adjoint operators; its range
is `sqrtRange C`.
Trace class means summable approximation numbers (`Summable C.singularValue`), and
Hilbert–Schmidt means finite Hilbert–Schmidt energy in a Hilbert basis. Two measures are
equivalent when each is absolutely continuous with respect to the other. The potential is
`Φ : X → Y → ℝ`, `Φ u y` in the sources' notation `Φ(u; y)`; the likelihood, the evidence and the
posterior are `ℝ≥0∞`-valued and use `∫⁻`, so that an infinite evidence gives the zero measure and
never a junk real value. The squared Hellinger distance `sqHellinger` is
`∫ (√p - √q)² = 2 (1 - affinity)`, twice the square of the distance of Stuart's Definition 6.35.

Definitions owned by KalmanFiltering (the gain and the measurement update),
MathematicalStatisticsNonparametric (the Hellinger affinity and distance, the centred covariance
and eigen-expansions) and RegularizationOfLinearIllPosedProblems (the Tikhonov operator) appear
here as local copies, each with a docstring naming its owner. The implementation namespace of
the README is `TauCeti`; the prototypes live in this roadmap's namespace.
-/

@[expose] public section

noncomputable section

open MeasureTheory ProbabilityTheory Filter Topology Set ContinuousLinearMap
open scoped InnerProductSpace RealInnerProductSpace ENNReal NNReal

namespace TauCetiRoadmap.BayesianInverseProblemsAndGaussianPriors

/-! ## Local copies of vocabulary owned elsewhere -/

section LocalCopies

/-- Local copy of `KalmanFiltering` 1.1: the innovation covariance `C P Cᵀ + R` of a prior
covariance `P`, an observation matrix `C` and an observation-noise covariance `R`. -/
def innovationCov {ι κ : Type*} [Fintype ι] [Fintype κ] (C : Matrix κ ι ℝ) (R : Matrix κ κ ℝ)
    (P : Matrix ι ι ℝ) : Matrix κ κ ℝ :=
  C * P * C.transpose + R

/-- Local copy of `KalmanFiltering` 1.1: the Kalman gain `P Cᵀ (C P Cᵀ + R)⁻¹`. -/
def kalmanGain {ι κ : Type*} [Fintype ι] [Fintype κ] [DecidableEq κ] (C : Matrix κ ι ℝ)
    (R : Matrix κ κ ℝ) (P : Matrix ι ι ℝ) : Matrix ι κ ℝ :=
  P * C.transpose * (innovationCov C R P)⁻¹

/-- Local copy of `KalmanFiltering` 1.1: the measurement update `P - P Cᵀ (C P Cᵀ + R)⁻¹ C P` of
a covariance. -/
def measurementUpdate {ι κ : Type*} [Fintype ι] [Fintype κ] [DecidableEq κ] (C : Matrix κ ι ℝ)
    (R : Matrix κ κ ℝ) (P : Matrix ι ι ℝ) : Matrix ι ι ℝ :=
  P - kalmanGain C R P * C * P

variable {X : Type*} [MeasurableSpace X]

/-- Local copy of `MathematicalStatisticsNonparametric` 1.1: the Hellinger affinity
`∫ √(p q) dν`, with densities relative to `ν = P + Q`. -/
def hellingerAffinity (P Q : Measure X) : ℝ :=
  ∫ x, √((P.rnDeriv (P + Q) x).toReal * (Q.rnDeriv (P + Q) x).toReal) ∂(P + Q)

/-- Local copy of `MathematicalStatisticsNonparametric` 1.1: the squared Hellinger distance
`∫ (√p - √q)² = 2 (1 - affinity)`, in `[0, 2]`. -/
def sqHellinger (P Q : Measure X) : ℝ := 2 * (1 - hellingerAffinity P Q)

end LocalCopies

section FunctionalDataCopies

variable {H : Type*} [NormedAddCommGroup H] [InnerProductSpace ℝ H] [CompleteSpace H]
  [TopologicalSpace.SeparableSpace H] [MeasurableSpace H] [BorelSpace H]
  {Ω : Type*} [MeasurableSpace Ω] (μ : Measure Ω) [IsProbabilityMeasure μ]

/-- Local copy of `MathematicalStatisticsNonparametric` 8.1: the centered covariance operator of
a random element of `H`. -/
def centeredCovariance (X : Ω → H) : H →L[ℝ] H :=
  covarianceOperator (μ.map fun ω ↦ X ω - ∫ ω', X ω' ∂μ)

/-- Local copy of `MathematicalStatisticsNonparametric` 8.2: an eigen-expansion
`T x = ∑ λ j ⟪x, φ j⟫ φ j` with decreasing nonnegative eigenvalues tending to `0`, orthonormal on
the positive eigenvalues. -/
structure IsEigenExpansion (T : H →L[ℝ] H) (lam : ℕ → ℝ) (φ : ℕ → H) : Prop where
  antitone : Antitone lam
  nonneg : ∀ j, 0 ≤ lam j
  tendsto : Tendsto lam atTop (𝓝 0)
  orthonormal : Orthonormal ℝ fun j : {j // 0 < lam j} ↦ φ j
  hasSum : ∀ x, HasSum (fun j ↦ lam j • ⟪x, φ j⟫ • φ j) (T x)

end FunctionalDataCopies

section TikhonovCopy

variable {𝕜 X Y : Type*} [RCLike 𝕜]
  [NormedAddCommGroup X] [InnerProductSpace 𝕜 X] [CompleteSpace X]
  [NormedAddCommGroup Y] [InnerProductSpace 𝕜 Y] [CompleteSpace Y]

/-- Local copy of RegularizationOfLinearIllPosedProblems §4.1: **the Tikhonov operator**
`R_α = (α I + K* K)⁻¹ K*`. The inverse is `Ring.inverse`, which is `0` on a noninvertible operator;
for `α > 0` the operator `α I + K* K` is invertible. -/
def tikhonov (K : X →L[𝕜] Y) (α : ℝ) : Y →L[𝕜] X :=
  Ring.inverse ((α : 𝕜) • (1 : X →L[𝕜] X) + adjoint K ∘L K) ∘L adjoint K

end TikhonovCopy

/-! ## Layer 1: Gaussian measures on a Hilbert space -/

section GaussianHilbert

variable {H : Type*} [NormedAddCommGroup H] [InnerProductSpace ℝ H] [CompleteSpace H]
  [MeasurableSpace H] [BorelSpace H] [SecondCountableTopology H]

/-- **The range of `C^{1/2}`** (1.1), with `C^{1/2} = cfc Real.sqrt C`. For the covariance of a
Gaussian measure this is the space of admissible shifts of 1.3, the Cameron–Martin space of
Stuart's Lemma 6.10. -/
def sqrtRange (C : H →L[ℝ] H) : Submodule ℝ H :=
  LinearMap.range ((cfc Real.sqrt C : H →L[ℝ] H) : H →ₗ[ℝ] H)

/-- Mathlib: the uncentred covariance operator is positive, with
`⟪covarianceOperator μ x, y⟫ = ∫ ⟪x, z⟫ ⟪y, z⟫ dμ(z)` for `μ` with a finite second moment. -/
example := @ProbabilityTheory.isPositive_covarianceOperator
example := @ProbabilityTheory.covarianceOperator_inner

/-- Mathlib: Fernique's theorem, `x ↦ exp (α ‖x‖²)` is integrable for some `α > 0` under a
Gaussian measure on a separable Banach space. -/
example := @ProbabilityTheory.IsGaussian.exists_integrable_exp_sq

/-- Mathlib: two Gaussian measures on a Hilbert space with the same mean and the same covariance
form `covarianceBilin` are equal. -/
example := @ProbabilityTheory.IsGaussian.ext

/-- Tau Ceti: the nuclear norm is finite exactly for the trace-class operators; finite
Hilbert–Schmidt energy implies compactness; a compact self-adjoint operator has a Hilbert basis of
eigenvectors. -/
example := @ContinuousLinearMap.nuclearENorm_ne_top_iff_summable
example := @ContinuousLinearMap.isCompactOperator_of_hilbertSchmidtEnergy_ne_top
example := @ContinuousLinearMap.exists_hilbertBasis_forall_hasEigenvector

/-- Mathlib and Tau Ceti carriers: the continuous functional calculus of self-adjoint operators,
approximation numbers, Hilbert–Schmidt energy, and the measure constructions of Layers 1–3. -/
example : ContinuousFunctionalCalculus ℝ (H →L[ℝ] H) IsSelfAdjoint := inferInstance
example := @ContinuousLinearMap.singularValue
example := @ContinuousLinearMap.hilbertSchmidtEnergy
example := @MeasureTheory.Measure.prod
example := @MeasureTheory.Measure.withDensity

/-- **The square root of a covariance is Hilbert–Schmidt** (1.1): for a positive trace-class
`C`, the Hilbert–Schmidt energy of `C^{1/2}` in every Hilbert basis is the trace norm of `C`,
which is finite, and `C^{1/2}` is compact. -/
theorem sqrt_hilbertSchmidt (C : H →L[ℝ] H) (hC : (C : H →ₗ[ℝ] H).IsPositive)
    (htr : Summable C.singularValue) {ι : Type*} (b : HilbertBasis ι ℝ H) :
    (cfc Real.sqrt C : H →L[ℝ] H).hilbertSchmidtEnergy b = C.nuclearENorm ∧
      (cfc Real.sqrt C : H →L[ℝ] H).hilbertSchmidtEnergy b ≠ ∞ ∧
      IsCompactOperator (cfc Real.sqrt C : H →L[ℝ] H) := by
  sorry

/-- **The Feldman–Hájek dichotomy** (1.2): two Gaussian measures on a separable Hilbert space
are either equivalent or mutually singular. -/
theorem equivalent_or_mutuallySingular (μ ν : Measure H) [IsGaussian μ] [IsGaussian ν] :
    (μ ≪ ν ∧ ν ≪ μ) ∨ μ ⟂ₘ ν := by
  sorry

/-- **The Feldman–Hájek criterion** (1.2). Write `R₁ = C₁^{1/2}`, `R₂ = C₂^{1/2}` for the
covariances of `μ` and `ν`. They are equivalent exactly when `R₁` and `R₂` have the same range,
the difference of the means lies in it, and the operator `S` with `R₂ = R₁ S` and range in
`(ker R₁)ᗮ` (Douglas factorization) has `S S* - P` Hilbert–Schmidt, `P` the orthogonal projection
onto `(ker R₁)ᗮ`. -/
theorem equivalent_iff_feldmanHajek (μ ν : Measure H) [IsGaussian μ] [IsGaussian ν]
    {ι : Type*} (b : HilbertBasis ι ℝ H) :
    (μ ≪ ν ∧ ν ≪ μ) ↔
      sqrtRange (centeredCovariance μ id) = sqrtRange (centeredCovariance ν id) ∧
      (∫ x, x ∂μ) - (∫ x, x ∂ν) ∈ sqrtRange (centeredCovariance μ id) ∧
      ∃ S : H →L[ℝ] H,
        cfc Real.sqrt (centeredCovariance ν id) =
          (cfc Real.sqrt (centeredCovariance μ id) : H →L[ℝ] H) ∘L S ∧
        (∀ x, S x ∈ (LinearMap.ker ((cfc Real.sqrt (centeredCovariance μ id) : H →L[ℝ] H) :
          H →ₗ[ℝ] H))ᗮ) ∧
        (S ∘L adjoint S - (LinearMap.ker ((cfc Real.sqrt (centeredCovariance μ id) :
          H →L[ℝ] H) : H →ₗ[ℝ] H))ᗮ.starProjection).hilbertSchmidtEnergy b ≠ ∞ := by
  sorry

/-- **Shifts of a Gaussian measure** (1.3): the translate of a Gaussian measure by `h` is
equivalent to it exactly when `h` lies in the range of `C^{1/2}`, and mutually singular to it
otherwise. -/
theorem equivalent_map_add_iff (μ : Measure H) [IsGaussian μ] (h : H) :
    ((μ.map (· + h) ≪ μ ∧ μ ≪ μ.map (· + h)) ↔ h ∈ sqrtRange (centeredCovariance μ id)) ∧
      (h ∉ sqrtRange (centeredCovariance μ id) → μ.map (· + h) ⟂ₘ μ) := by
  sorry

/-- **Covariances diagonal in a common basis** (1.3). If the covariances of `μ` and `ν` are
diagonal in the Hilbert basis `b` with positive eigenvalues `a₁` and `a₂`, the two measures are
equivalent exactly when `∑ (a₂ᵢ / a₁ᵢ - 1)² < ∞` and `∑ ⟪m₁ - m₂, bᵢ⟫² / a₁ᵢ < ∞`. -/
theorem equivalent_iff_of_diagonal (μ ν : Measure H) [IsGaussian μ] [IsGaussian ν]
    {ι : Type*} (b : HilbertBasis ι ℝ H) (a₁ a₂ : ι → ℝ) (ha₁ : ∀ i, 0 < a₁ i)
    (ha₂ : ∀ i, 0 < a₂ i) (h₁ : ∀ i, centeredCovariance μ id (b i) = a₁ i • b i)
    (h₂ : ∀ i, centeredCovariance ν id (b i) = a₂ i • b i) :
    (μ ≪ ν ∧ ν ≪ μ) ↔
      Summable (fun i ↦ (a₂ i / a₁ i - 1) ^ 2) ∧
        Summable (fun i ↦ ⟪(∫ x, x ∂μ) - ∫ x, x ∂ν, b i⟫ ^ 2 / a₁ i) := by
  sorry

/-- **Dilations** (1.3): a centred Gaussian measure whose range of `C^{1/2}` is
infinite-dimensional is equivalent to its image under `x ↦ c x` exactly when `c = ±1`, and
mutually singular to it otherwise. -/
theorem equivalent_map_smul_iff (μ : Measure H) [IsGaussian μ] (hμ : ∫ x, x ∂μ = 0)
    (hdim : ¬ FiniteDimensional ℝ (sqrtRange (centeredCovariance μ id))) (c : ℝ) :
    ((μ.map (c • ·) ≪ μ ∧ μ ≪ μ.map (c • ·)) ↔ c = 1 ∨ c = -1) ∧
      (c ≠ 1 → c ≠ -1 → μ.map (c • ·) ⟂ₘ μ) := by
  sorry

end GaussianHilbert

/-! ## Layer 2: the Karhunen–Loève expansion -/

section KarhunenLoeve

variable {H : Type*} [NormedAddCommGroup H] [InnerProductSpace ℝ H] [CompleteSpace H]
  [MeasurableSpace H] [BorelSpace H] [SecondCountableTopology H]
  {Ω : Type*} [MeasurableSpace Ω]

/-- **Truncation error** (2.1). For an eigen-expansion `(λ, φ)` of the centred covariance of a
square-integrable `H`-valued random variable `u` and every finite set `S` of indices, the
truncation of the expansion to `S` (over the positive eigenvalues) has mean-square error
`∑_{j ∉ S} λⱼ`. -/
theorem karhunenLoeve_truncation (P : Measure Ω) [IsProbabilityMeasure P] (u : Ω → H)
    (hu : MemLp u 2 P) (lam : ℕ → ℝ) (φ : ℕ → H)
    (he : IsEigenExpansion (centeredCovariance P u) lam φ) (S : Finset ℕ) :
    HasSum (fun j ↦ if j ∈ S then 0 else lam j)
      (∫ ω, ‖u ω - ∫ ω', u ω' ∂P -
        ∑ j ∈ S, (if 0 < lam j then ⟪u ω - ∫ ω', u ω' ∂P, φ j⟫ • φ j else 0)‖ ^ 2 ∂P) := by
  sorry

/-- Mathlib: uncorrelated jointly Gaussian real variables indexed by a finite type are
independent. -/
example := @ProbabilityTheory.HasGaussianLaw.iIndepFun_of_covariance_eq_zero

/-- **Gaussian coefficients** (2.1): if the law of `u` is Gaussian, the normalized coefficients
`ξⱼ = ⟪u - m, φⱼ⟫ / √λⱼ`, over the indices with `λⱼ > 0`, are independent standard normal. -/
theorem karhunenLoeve_iIndepFun_of_isGaussian (P : Measure Ω) [IsProbabilityMeasure P]
    (u : Ω → H) (hum : Measurable u) [IsGaussian (P.map u)] (lam : ℕ → ℝ) (φ : ℕ → H)
    (he : IsEigenExpansion (centeredCovariance P u) lam φ) :
    iIndepFun (fun (j : {j // 0 < lam j}) ω ↦ ⟪u ω - ∫ ω', u ω' ∂P, φ j⟫ / √(lam j)) P ∧
      ∀ j : {j // 0 < lam j},
        P.map (fun ω ↦ ⟪u ω - ∫ ω', u ω' ∂P, φ j⟫ / √(lam j)) = gaussianReal 0 1 := by
  sorry

variable {T : Type*} [MeasurableSpace T]

/-- **The covariance function** `c(x, y) = E[(U(x) - m(x)) (U(y) - m(y))]` of a real random field
`U` on `T` (2.2), with `m(x) = E U(x)`. -/
def covarianceFunction (P : Measure Ω) (U : Ω → T → ℝ) (x y : T) : ℝ :=
  ∫ ω, (U ω x - ∫ ω', U ω' x ∂P) * (U ω y - ∫ ω', U ω' y ∂P) ∂P

/-- **The covariance of a random field as an integral operator** (2.2). Let `u` be a
square-integrable `L²(T)`-valued random variable represented by a jointly measurable field `U`.
Then the covariance function is in `L²(T × T)`, and the covariance operator of `u` is the
integral operator with kernel `c`. -/
theorem covarianceFunction_spec (P : Measure Ω) [IsProbabilityMeasure P] (μT : Measure T)
    [SigmaFinite μT] [MeasurableSpace (Lp ℝ 2 μT)] [BorelSpace (Lp ℝ 2 μT)]
    [TopologicalSpace.SeparableSpace (Lp ℝ 2 μT)] (U : Ω → T → ℝ)
    (hU : Measurable (Function.uncurry U)) (u : Ω → Lp ℝ 2 μT)
    (hu : MemLp u 2 P) (hUu : ∀ ω, (u ω : T → ℝ) =ᵐ[μT] U ω) :
    MemLp (Function.uncurry (covarianceFunction P U)) 2 (μT.prod μT) ∧
      ∀ f g : Lp ℝ 2 μT, ⟪centeredCovariance P u f, g⟫ =
        ∫ x, g x * ∫ y, covarianceFunction P U x y * f y ∂μT ∂μT := by
  sorry

/-- **Mercer's theorem** (2.2). Let `K` be a compact metric space with a finite Borel measure of
full support, and `c` a continuous symmetric positive semidefinite kernel. For an orthonormal
basis of eigenfunctions of the integral operator of `c`, the eigenvalues are nonnegative with sum
`∫ c(x, x)`, the eigenfunctions of positive eigenvalue have continuous representatives, and with
these representatives `∑ νᵢ gᵢ(x) gᵢ(y)` converges to `c` uniformly on `K × K`, unconditionally. -/
theorem mercer {K : Type*} [MetricSpace K] [CompactSpace K] [MeasurableSpace K] [BorelSpace K]
    (μ : Measure K) [IsFiniteMeasure μ] [μ.IsOpenPosMeasure] (c : K → K → ℝ)
    (hc : Continuous (Function.uncurry c)) (hsymm : ∀ x y, c x y = c y x)
    (hpsd : ∀ (n : ℕ) (x : Fin n → K) (a : Fin n → ℝ),
      0 ≤ ∑ i, ∑ j, a i * a j * c (x i) (x j))
    {ι : Type*} (φ : HilbertBasis ι ℝ (Lp ℝ 2 μ)) (ν : ι → ℝ)
    (hφ : ∀ i, ∀ᵐ x ∂μ, ∫ y, c x y * φ i y ∂μ = ν i * φ i x) :
    (∀ i, 0 ≤ ν i) ∧ HasSum ν (∫ x, c x x ∂μ) ∧
      (∀ i, 0 < ν i → ∃ g : C(K, ℝ), (φ i : K → ℝ) =ᵐ[μ] g) ∧
      ∀ g : ι → C(K, ℝ), (∀ i, 0 < ν i → (φ i : K → ℝ) =ᵐ[μ] g i) →
        TendstoUniformly (fun (S : Finset ι) (p : K × K) ↦ ∑ i ∈ S, ν i * g i p.1 * g i p.2)
          (Function.uncurry c) atTop := by
  sorry

/-- **Uniform convergence of the Karhunen–Loève expansion of a field** (2.2). For a field on a
compact metric space with continuous covariance function, with the eigenfunctions of 2.2 and
continuous representatives `gᵢ`, the pointwise mean-square error of the truncation to `S` is
`c(x, x) - ∑_{i ∈ S, νᵢ > 0} νᵢ gᵢ(x)²` at every `x`, and it tends to `0` uniformly in `x`. -/
theorem karhunenLoeve_tendstoUniformly {K : Type*} [MetricSpace K] [CompactSpace K]
    [MeasurableSpace K] [BorelSpace K] (μ : Measure K) [IsFiniteMeasure μ] [μ.IsOpenPosMeasure]
    [MeasurableSpace (Lp ℝ 2 μ)] [BorelSpace (Lp ℝ 2 μ)] (P : Measure Ω) [IsProbabilityMeasure P]
    (U : Ω → K → ℝ)
    (hU : Measurable (Function.uncurry U)) (hU2 : ∀ x, MemLp (fun ω ↦ U ω x) 2 P)
    (hc : Continuous (Function.uncurry (covarianceFunction P U))) (u : Ω → Lp ℝ 2 μ)
    (hu : MemLp u 2 P) (hUu : ∀ ω, (u ω : K → ℝ) =ᵐ[μ] U ω)
    {ι : Type*} (φ : HilbertBasis ι ℝ (Lp ℝ 2 μ)) (ν : ι → ℝ)
    (hφ : ∀ i, ∀ᵐ x ∂μ, ∫ y, covarianceFunction P U x y * φ i y ∂μ = ν i * φ i x)
    (g : ι → C(K, ℝ)) (hg : ∀ i, 0 < ν i → (φ i : K → ℝ) =ᵐ[μ] g i) :
    (∀ (S : Finset ι) (x : K),
      ∫ ω, (U ω x - ∫ ω', U ω' x ∂P -
        ∑ i ∈ S.filter (fun i ↦ 0 < ν i), ⟪u ω - ∫ ω', u ω' ∂P, φ i⟫ * g i x) ^ 2 ∂P =
        covarianceFunction P U x x - ∑ i ∈ S.filter (fun i ↦ 0 < ν i), ν i * g i x ^ 2) ∧
    TendstoUniformly (fun (S : Finset ι) (x : K) ↦
      ∫ ω, (U ω x - ∫ ω', U ω' x ∂P -
        ∑ i ∈ S.filter (fun i ↦ 0 < ν i), ⟪u ω - ∫ ω', u ω' ∂P, φ i⟫ * g i x) ^ 2 ∂P)
      (fun _ ↦ 0) atTop := by
  sorry

end KarhunenLoeve

/-! ## Layer 3: Bayes' theorem in function space -/

section Bayes

variable {X Y : Type*} [MeasurableSpace X]

/-- **The likelihood** `exp(-Φ(u; y))` (3.1), in `ℝ≥0∞`. -/
def likelihood (Φ : X → Y → ℝ) (y : Y) (u : X) : ℝ≥0∞ :=
  ENNReal.ofReal (Real.exp (-Φ u y))

/-- **The evidence** `Z(y) = ∫ exp(-Φ(u; y)) dμ₀(u)` (3.1), in `ℝ≥0∞`. -/
def evidence (μ₀ : Measure X) (Φ : X → Y → ℝ) (y : Y) : ℝ≥0∞ :=
  ∫⁻ u, likelihood Φ y u ∂μ₀

/-- **The posterior** `μʸ = Z(y)⁻¹ exp(-Φ(·; y)) μ₀` (3.1). It is the zero measure when
`Z(y) = ∞`, since `(∞ : ℝ≥0∞)⁻¹ = 0`. -/
def bayesPosterior (μ₀ : Measure X) (Φ : X → Y → ℝ) (y : Y) : Measure X :=
  (evidence μ₀ Φ y)⁻¹ • μ₀.withDensity (likelihood Φ y)

/-- **The Gaussian potential** `Φ(u; y) = ½ ⟪y - G u, Γ⁻¹ (y - G u)⟫` (3.2) of an observation
map `G` and a noise covariance `Γ`. -/
def gaussianPotential {κ : Type*} [Fintype κ] [DecidableEq κ] (Γ : Matrix κ κ ℝ)
    (G : X → EuclideanSpace ℝ κ) (u : X) (y : EuclideanSpace ℝ κ) : ℝ :=
  ⟪y - G u, (Γ⁻¹).toEuclideanLin (y - G u)⟫ / 2

variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E] [FiniteDimensional ℝ E]
  [MeasurableSpace E] [BorelSpace E]

/-- Mathlib: the posterior kernel `κ†μ` of a kernel and a prior, its density with respect to the
prior, and the characterization of a conditional law by disintegration. -/
example := @ProbabilityTheory.posterior
example := @ProbabilityTheory.posterior_eq_withDensity
example := @ProbabilityTheory.condDistrib_ae_eq_of_measure_eq_compProd

/-- Tau Ceti: a nondegenerate multivariate Gaussian law is Lebesgue measure with the Gaussian
density `multivariateGaussianPDF`. -/
example := @TauCeti.Probability.multivariateGaussian_eq_withDensity

/-- **Bayes' theorem for additive noise** (3.2). Let `y = G(u) + η` with `u ∼ μ₀` and `η`
independent of `u` with Lebesgue probability density `ρ`, and let
`exp(-Φ(u; y)) = c(y) ρ(y - G u)` with `0 < c(y) < ∞`. Then the evidence is positive for every
`y` and finite for almost every `y`, and for every `y` when `ρ` is bounded; the law of `y` has
density `∫ ρ(y - G u) dμ₀(u)`; and the posterior kernel disintegrates the joint law of `(u, y)`. -/
theorem bayes_additiveNoise (μ₀ : Measure X) [IsProbabilityMeasure μ₀] (G : X → E)
    (hG : Measurable G) (ρ : E → ℝ≥0∞) (hρ : Measurable ρ) (hρ₁ : ∫⁻ z, ρ z = 1)
    (Φ : X → E → ℝ)
    (hΦ : Measurable (Function.uncurry Φ)) (c : E → ℝ≥0∞) (hc₀ : ∀ y, c y ≠ 0)
    (hc : ∀ y, c y ≠ ∞) (hΦρ : ∀ u y, likelihood Φ y u = c y * ρ (y - G u)) :
    (∀ y, 0 < evidence μ₀ Φ y) ∧
      (∀ᵐ y ∂(volume : Measure E), evidence μ₀ Φ y ≠ ∞) ∧
      ((∃ M : ℝ≥0, ∀ z, ρ z ≤ M) → ∀ y, evidence μ₀ Φ y ≠ ∞) ∧
      ((μ₀.prod (volume.withDensity ρ)).map (fun p ↦ G p.1 + p.2) =
        volume.withDensity (fun y ↦ ∫⁻ u, ρ (y - G u) ∂μ₀)) ∧
      ∀ A : Set X, ∀ B : Set E, MeasurableSet A → MeasurableSet B →
        Measurable (fun y ↦ bayesPosterior μ₀ Φ y A) ∧
        (μ₀.prod (volume.withDensity ρ)).map (fun p ↦ (p.1, G p.1 + p.2)) (A ×ˢ B) =
          ∫⁻ y in B, bayesPosterior μ₀ Φ y A
            ∂((μ₀.prod (volume.withDensity ρ)).map (fun p ↦ G p.1 + p.2)) := by
  sorry

/-- **Bayes' theorem for Gaussian noise** (3.2). For noise `N(0, Γ)` with `Γ` positive definite
and the Gaussian potential, `0 < Z(y) ≤ 1` and the posterior is a probability measure for every
`y`, and the posterior kernel disintegrates the joint law. -/
theorem bayes_gaussianNoise {κ : Type*} [Fintype κ] [DecidableEq κ] (μ₀ : Measure X)
    [IsProbabilityMeasure μ₀] (G : X → EuclideanSpace ℝ κ) (hG : Measurable G)
    (Γ : Matrix κ κ ℝ) (hΓ : Γ.PosDef) :
    (∀ y, 0 < evidence μ₀ (gaussianPotential Γ G) y ∧ evidence μ₀ (gaussianPotential Γ G) y ≤ 1) ∧
      (∀ y, IsProbabilityMeasure (bayesPosterior μ₀ (gaussianPotential Γ G) y)) ∧
      ∀ A : Set X, ∀ B : Set (EuclideanSpace ℝ κ), MeasurableSet A → MeasurableSet B →
        (μ₀.prod (multivariateGaussian 0 Γ)).map (fun p ↦ (p.1, G p.1 + p.2)) (A ×ˢ B) =
          ∫⁻ y in B, bayesPosterior μ₀ (gaussianPotential Γ G) y A
            ∂((μ₀.prod (multivariateGaussian 0 Γ)).map (fun p ↦ G p.1 + p.2)) := by
  sorry

end Bayes

/-! ## Layer 4: well-posedness of the posterior -/

section WellPosed

variable {X Y : Type*} [NormedAddCommGroup X] [MeasurableSpace X] [SeminormedAddCommGroup Y]

/-- **The posterior is a probability measure** (4.1). If the prior has a Gaussian tail
`∫ exp(α ‖u‖²) dμ₀ < ∞` for some `α > 0`, and `Φ(·; y)` is measurable with
`Φ(u; y) ≥ M(ε) - ε ‖u‖²` for every `ε > 0`, then `0 < Z(y) < ∞` and `μʸ` is a probability
measure. -/
theorem bayesPosterior_isProbabilityMeasure (μ₀ : Measure X) [IsProbabilityMeasure μ₀]
    (hμ₀ : ∃ α > 0, ∫⁻ u, ENNReal.ofReal (Real.exp (α * ‖u‖ ^ 2)) ∂μ₀ ≠ ∞)
    (Φ : X → Y → ℝ) (y : Y) (hm : Measurable fun u ↦ Φ u y)
    (hlow : ∀ ε > 0, ∃ M, ∀ u, M - ε * ‖u‖ ^ 2 ≤ Φ u y) :
    0 < evidence μ₀ Φ y ∧ evidence μ₀ Φ y ≠ ∞ ∧ IsProbabilityMeasure (bayesPosterior μ₀ Φ y) := by
  sorry

/-- **Expectations under Hellinger-close measures** (4.2):
`‖E^μ f - E^{μ'} f‖² ≤ 2 (E^μ ‖f‖² + E^{μ'} ‖f‖²) · sqHellinger μ μ'` for `f` square integrable
under both. -/
theorem norm_integral_sub_integral_le {W : Type*} [NormedAddCommGroup W] [NormedSpace ℝ W]
    [CompleteSpace W] (μ μ' : Measure X) [IsProbabilityMeasure μ] [IsProbabilityMeasure μ']
    (f : X → W) (hf : MemLp f 2 μ) (hf' : MemLp f 2 μ') :
    ‖∫ x, f x ∂μ - ∫ x, f x ∂μ'‖ ≤
      √(2 * (∫ x, ‖f x‖ ^ 2 ∂μ + ∫ x, ‖f x‖ ^ 2 ∂μ') * sqHellinger μ μ') := by
  sorry

/-- **Local Lipschitz dependence on the data** (4.2). Under a Gaussian tail of the prior, the
lower bound (i) and the data-Lipschitz bound (iv), the squared Hellinger distance between the
posteriors at data `y`, `y'` in a ball of radius `r` is at most `C(r) ‖y - y'‖²`. -/
theorem sqHellinger_bayesPosterior_le (μ₀ : Measure X) [IsProbabilityMeasure μ₀]
    (hμ₀ : ∃ α > 0, ∫⁻ u, ENNReal.ofReal (Real.exp (α * ‖u‖ ^ 2)) ∂μ₀ ≠ ∞)
    (Φ : X → Y → ℝ) (hm : ∀ y, Measurable fun u ↦ Φ u y)
    (hlow : ∀ ε > 0, ∀ r > 0, ∃ M, ∀ u y, ‖y‖ < r → M - ε * ‖u‖ ^ 2 ≤ Φ u y)
    (hlip : ∀ ε > 0, ∀ r > 0, ∃ C, ∀ u y₁ y₂, ‖y₁‖ < r → ‖y₂‖ < r →
      |Φ u y₁ - Φ u y₂| ≤ Real.exp (ε * ‖u‖ ^ 2 + C) * ‖y₁ - y₂‖)
    (r : ℝ) (hr : 0 < r) :
    ∃ C, ∀ y y', ‖y‖ < r → ‖y'‖ < r →
      sqHellinger (bayesPosterior μ₀ Φ y) (bayesPosterior μ₀ Φ y') ≤ C * ‖y - y'‖ ^ 2 := by
  sorry

/-- **Finite data with Gaussian noise** (4.3). If the observation map `G` grows at most like
`exp(ε ‖u‖² + M(ε))` for every `ε > 0` and is Lipschitz on bounded sets, the Gaussian potential
satisfies the lower bound (i), the upper bound (ii), the Lipschitz bound (iii) in `u` and the
data-Lipschitz bound (iv). -/
theorem gaussianPotential_assumptions {κ : Type*} [Fintype κ] [DecidableEq κ]
    (Γ : Matrix κ κ ℝ) (hΓ : Γ.PosDef) (G : X → EuclideanSpace ℝ κ)
    (hG₁ : ∀ ε > 0, ∃ M, ∀ u, ‖G u‖ ≤ Real.exp (ε * ‖u‖ ^ 2 + M))
    (hG₂ : ∀ r > 0, ∃ K, ∀ u₁ u₂, ‖u₁‖ < r → ‖u₂‖ < r → ‖G u₁ - G u₂‖ ≤ K * ‖u₁ - u₂‖) :
    (∀ ε > 0, ∀ r > 0, ∃ M, ∀ u y, ‖y‖ < r → M - ε * ‖u‖ ^ 2 ≤ gaussianPotential Γ G u y) ∧
      (∀ r > 0, ∃ K, ∀ u y, ‖u‖ < r → ‖y‖ < r → gaussianPotential Γ G u y ≤ K) ∧
      (∀ r > 0, ∃ L, ∀ u₁ u₂ y, ‖u₁‖ < r → ‖u₂‖ < r → ‖y‖ < r →
        |gaussianPotential Γ G u₁ y - gaussianPotential Γ G u₂ y| ≤ L * ‖u₁ - u₂‖) ∧
      ∀ ε > 0, ∀ r > 0, ∃ C, ∀ u y₁ y₂, ‖y₁‖ < r → ‖y₂‖ < r →
        |gaussianPotential Γ G u y₁ - gaussianPotential Γ G u y₂| ≤
          Real.exp (ε * ‖u‖ ^ 2 + C) * ‖y₁ - y₂‖ := by
  sorry

/-- **Well-posedness for a Gaussian prior and finite data** (4.3). For a Gaussian prior on a
separable Banach space, Gaussian noise and an observation map as in 4.3, the posterior is a
probability measure for every `y` and depends locally Lipschitz on `y` in Hellinger distance. -/
theorem bayesPosterior_gaussian_wellPosed [NormedSpace ℝ X] [CompleteSpace X]
    [SecondCountableTopology X] [BorelSpace X] {κ : Type*} [Fintype κ] [DecidableEq κ]
    (μ₀ : Measure X) [IsGaussian μ₀] (Γ : Matrix κ κ ℝ) (hΓ : Γ.PosDef)
    (G : X → EuclideanSpace ℝ κ)
    (hG₁ : ∀ ε > 0, ∃ M, ∀ u, ‖G u‖ ≤ Real.exp (ε * ‖u‖ ^ 2 + M))
    (hG₂ : ∀ r > 0, ∃ K, ∀ u₁ u₂, ‖u₁‖ < r → ‖u₂‖ < r → ‖G u₁ - G u₂‖ ≤ K * ‖u₁ - u₂‖) :
    (∀ y, IsProbabilityMeasure (bayesPosterior μ₀ (gaussianPotential Γ G) y)) ∧
      ∀ r > 0, ∃ C, ∀ y y', ‖y‖ < r → ‖y'‖ < r →
        sqHellinger (bayesPosterior μ₀ (gaussianPotential Γ G) y)
          (bayesPosterior μ₀ (gaussianPotential Γ G) y') ≤ C * ‖y - y'‖ ^ 2 := by
  sorry

end WellPosed

/-! ## Layer 5: maximum a posteriori estimators and Tikhonov regularization -/

section MAP

/-- **The MAP functional exists and minimizing sequences converge** (5.1). Let `J : E → X` be a
compact operator from a Hilbert space, `Φ` continuous on `X` with `Φ(x) ≥ M(ε) - ε ‖x‖²` for every
`ε > 0`, and `I(h) = ½ ‖h‖² + Φ(J h)`. Then `I` attains its infimum, and every sequence along
which `I` tends to its minimum has a subsequence converging in `E` to a minimizer. -/
theorem exists_minimizer_mapFunctional {E X : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
    [CompleteSpace E] [NormedAddCommGroup X] [NormedSpace ℝ X] (J : E →L[ℝ] X)
    (hJ : IsCompactOperator J) (Φ : X → ℝ) (hΦ : Continuous Φ)
    (hlow : ∀ ε > 0, ∃ M, ∀ x, M - ε * ‖x‖ ^ 2 ≤ Φ x) :
    (∃ h : E, ∀ k, ‖h‖ ^ 2 / 2 + Φ (J h) ≤ ‖k‖ ^ 2 / 2 + Φ (J k)) ∧
      ∀ h₀ : E, (∀ k, ‖h₀‖ ^ 2 / 2 + Φ (J h₀) ≤ ‖k‖ ^ 2 / 2 + Φ (J k)) →
        ∀ v : ℕ → E, Tendsto (fun n ↦ ‖v n‖ ^ 2 / 2 + Φ (J (v n))) atTop
            (𝓝 (‖h₀‖ ^ 2 / 2 + Φ (J h₀))) →
          ∃ (φ : ℕ → ℕ) (h : E), StrictMono φ ∧ Tendsto (v ∘ φ) atTop (𝓝 h) ∧
            ∀ k, ‖h‖ ^ 2 / 2 + Φ (J h) ≤ ‖k‖ ^ 2 / 2 + Φ (J k) := by
  sorry

/-- **A mode** of a measure on a space with a Lebesgue measure (5.2): a maximizer of a continuous
Lebesgue density of the measure. A measure without a continuous density has no mode. -/
def IsMode {E : Type*} [TopologicalSpace E] [MeasureSpace E] (μ : Measure E) (u : E) : Prop :=
  ∃ f : E → ℝ, Continuous f ∧ μ = volume.withDensity (fun x ↦ ENNReal.ofReal (f x)) ∧
    ∀ v, f v ≤ f u

variable {ι κ : Type*} [Fintype ι] [Fintype κ] [DecidableEq ι] [DecidableEq κ]

/-- **The posterior density in finite dimension and its modes** (5.2). For the prior `N(0, C)` on
`ℝⁿ` with `C` positive definite and a continuous potential with the lower bound (i), the posterior
has Lebesgue density proportional to `exp(-I)`, `I(u) = ½ ⟪u, C⁻¹ u⟫ + Φ(u; y)`, and its modes
are exactly the minimizers of `I`. -/
theorem bayesPosterior_isMode_iff {Y : Type*} (C : Matrix ι ι ℝ) (hC : C.PosDef)
    (Φ : EuclideanSpace ℝ ι → Y → ℝ) (y : Y) (hΦ : Continuous fun u ↦ Φ u y)
    (hlow : ∀ ε > 0, ∃ M, ∀ u, M - ε * ‖u‖ ^ 2 ≤ Φ u y) :
    (∃ k : ℝ, 0 < k ∧ bayesPosterior (multivariateGaussian 0 C) Φ y =
      volume.withDensity (fun u ↦
        ENNReal.ofReal (k * Real.exp (-(⟪u, (C⁻¹).toEuclideanLin u⟫ / 2 + Φ u y))))) ∧
      ∀ u, IsMode (bayesPosterior (multivariateGaussian 0 C) Φ y) u ↔
        ∀ v, ⟪u, (C⁻¹).toEuclideanLin u⟫ / 2 + Φ u y ≤ ⟪v, (C⁻¹).toEuclideanLin v⟫ / 2 + Φ v y := by
  sorry

/-- **The linear Gaussian posterior** (5.3). For a Gaussian prior `N(m₀, C)` with `C` positive
semidefinite, a linear observation `A` and noise `N(0, Γ)` with `Γ` positive definite, the
posterior at every `y` is the Gaussian `N(m₀ + K (y - A m₀), P⁺)` with the Kalman gain `K` and the
measurement update `P⁺` of `C`. -/
theorem bayesPosterior_linearGaussian (A : Matrix κ ι ℝ) (Γ : Matrix κ κ ℝ) (hΓ : Γ.PosDef)
    (C : Matrix ι ι ℝ) (hC : C.PosSemidef) (m₀ : EuclideanSpace ℝ ι) (y : EuclideanSpace ℝ κ) :
    bayesPosterior (multivariateGaussian m₀ C) (gaussianPotential Γ A.toEuclideanLin) y =
      multivariateGaussian (m₀ + (kalmanGain A Γ C).toEuclideanLin (y - A.toEuclideanLin m₀))
        (measurementUpdate A Γ C) := by
  sorry

/-- **The MAP estimator of a linear Gaussian problem** (5.3). For `C` and `Γ` positive definite,
the generalized Tikhonov functional
`½ ⟪y - A u, Γ⁻¹ (y - A u)⟫ + ½ ⟪u, C⁻¹ u⟫` has the unique minimizer `K y`, `K` the Kalman gain:
the MAP estimator is the posterior mean of the prior `N(0, C)`. -/
theorem minimizer_generalizedTikhonov_iff (A : Matrix κ ι ℝ) (Γ : Matrix κ κ ℝ) (hΓ : Γ.PosDef)
    (C : Matrix ι ι ℝ) (hC : C.PosDef) (y : EuclideanSpace ℝ κ) (u : EuclideanSpace ℝ ι) :
    (∀ v, gaussianPotential Γ A.toEuclideanLin u y + ⟪u, (C⁻¹).toEuclideanLin u⟫ / 2 ≤
        gaussianPotential Γ A.toEuclideanLin v y + ⟪v, (C⁻¹).toEuclideanLin v⟫ / 2) ↔
      u = (kalmanGain A Γ C).toEuclideanLin y := by
  sorry

/-- **The Kalman gain of isotropic covariances is a Tikhonov operator** (5.3): for `C = c I` and
`Γ = γ I` with `c, γ > 0`, the Kalman gain is `R_α` with `α = γ / c`. -/
theorem kalmanGain_smul_one_eq_tikhonov (A : Matrix κ ι ℝ) {c γ : ℝ} (hc : 0 < c)
    (hγ : 0 < γ) :
    LinearMap.toContinuousLinearMap (kalmanGain A (γ • 1) (c • 1)).toEuclideanLin =
      tikhonov (𝕜 := ℝ) (LinearMap.toContinuousLinearMap A.toEuclideanLin) (γ / c) := by
  sorry

end MAP

end TauCetiRoadmap.BayesianInverseProblemsAndGaussianPriors
