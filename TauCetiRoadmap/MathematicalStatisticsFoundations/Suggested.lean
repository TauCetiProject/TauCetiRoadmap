module

public import Mathlib
public import TauCeti.Data.Fin.Tuple.OrderStatistic
public import TauCeti.Probability.Quantile
public import TauCeti.Probability.Distributions.ChiSquared.Basic
public import TauCeti.Probability.Distributions.StudentT.Basic
public import TauCeti.Probability.Distributions.Gaussian.Density
public import TauCeti.Probability.Process.EmpiricalMeasure
public import TauCeti.MeasureTheory.Measure.TotalVariation

/-!
# Foundations of mathematical statistics: target signatures

This file states a selection of the targets of the roadmap against the pinned Mathlib and Tau
Ceti, at least one per layer. The definitive document is `README.md`, which states every target;
this file is not an exhaustive checklist, and discharging it finishes neither a layer nor the
roadmap.

The conventions of the README are used throughout: a parametric family is `P : Θ → Measure X`
with probability instances, a randomized rule is a Markov kernel, a test is a measurable
`[0, 1]`-valued function, and convergence in probability and in law are Mathlib's
`TendstoInMeasure` and `TendstoInDistribution`.
-/

@[expose] public section

noncomputable section

open MeasureTheory ProbabilityTheory Filter Set Topology
open scoped ENNReal NNReal

namespace TauCeti

attribute [local instance] Classical.propDecidable

/-! ### Layer 1: experiments, densities and tests -/

section Layer1

variable {Θ X S : Type*} [MeasurableSpace X]

/-- **1.1** `f` is a real density of `P` with respect to `μ`. -/
def HasDensity (P μ : Measure X) (f : X → ℝ) : Prop :=
  Measurable f ∧ (∀ᵐ x ∂μ, 0 ≤ f x) ∧ P = μ.withDensity (fun x ↦ ENNReal.ofReal (f x))

/-- **1.1** Integrals against a law with a density. -/
theorem HasDensity.integral_eq {P μ : Measure X} {f : X → ℝ} (h : HasDensity P μ f)
    (g : X → ℝ) : ∫ x, g x ∂P = ∫ x, f x * g x ∂μ := sorry

/-- **1.2** The weights `2^{-(n+1)}` of countable mixtures. -/
def mixtureWeight (n : ℕ) : ℝ≥0∞ := (2 ^ (n + 1))⁻¹

/-- **1.2** The countable mixture `∑ 2^{-(n+1)} P (θs n)`. -/
def countableMixture (P : Θ → Measure X) (θs : ℕ → Θ) : Measure X :=
  Measure.sum fun n ↦ mixtureWeight n • P (θs n)

/-- **1.2** The Halmos–Savage lemma, density form. -/
theorem exists_absolutelyContinuous_countableMixture [Nonempty Θ] (P : Θ → Measure X)
    (μ : Measure X) [SigmaFinite μ] (f : Θ → X → ℝ) (hf : ∀ θ, HasDensity (P θ) μ (f θ)) :
    ∃ θs : ℕ → Θ, ∀ θ, P θ ≪ countableMixture P θs := sorry

/-- **1.3** A randomized test. -/
def IsStatisticalTest (φ : X → ℝ) : Prop :=
  Measurable φ ∧ ∀ x, φ x ∈ Icc 0 1

/-- **1.3** The power function of a test. -/
def testPower (P : Θ → Measure X) (φ : X → ℝ) (θ : Θ) : ℝ := ∫ x, φ x ∂P θ

/-- **1.3** Level `α` on `H₀`, stated pointwise. -/
def HasTestLevel (P : Θ → Measure X) (H₀ : Set Θ) (α : ℝ) (φ : X → ℝ) : Prop :=
  IsStatisticalTest φ ∧ ∀ θ ∈ H₀, testPower P φ θ ≤ α

/-- **1.3** Similar of size `α` on `B`. -/
def IsSimilarTest (P : Θ → Measure X) (B : Set Θ) (α : ℝ) (φ : X → ℝ) : Prop :=
  IsStatisticalTest φ ∧ ∀ θ ∈ B, testPower P φ θ = α

/-- **1.3** Uniformly most powerful of level `α`. -/
def IsUniformlyMostPowerfulTest (P : Θ → Measure X) (H₀ H₁ : Set Θ) (α : ℝ) (φ : X → ℝ) :
    Prop :=
  HasTestLevel P H₀ α φ ∧ ∀ ψ, HasTestLevel P H₀ α ψ → ∀ θ ∈ H₁, testPower P ψ θ ≤ testPower P φ θ

/-- **1.3** Uniformly most powerful unbiased of level `α`. -/
def IsUniformlyMostPowerfulUnbiasedTest (P : Θ → Measure X) (H₀ H₁ : Set Θ) (α : ℝ)
    (φ : X → ℝ) : Prop :=
  HasTestLevel P H₀ α φ ∧ (∀ θ ∈ H₁, α ≤ testPower P φ θ) ∧
    ∀ ψ, HasTestLevel P H₀ α ψ → (∀ θ ∈ H₁, α ≤ testPower P ψ θ) →
      ∀ θ ∈ H₁, testPower P ψ θ ≤ testPower P φ θ

/-- **1.3** The one-sided threshold test in a statistic `T`. -/
def thresholdTest {α : Type*} [LinearOrder α] (T : X → α) (c : α) (γ : ℝ) (x : X) : ℝ :=
  if c < T x then 1 else if T x = c then γ else 0

/-- **1.3** The two-sided interval test in a real statistic value. -/
def intervalTest (t c₁ c₂ γ₁ γ₂ : ℝ) : ℝ :=
  if c₁ < t ∧ t < c₂ then 1 else if t = c₁ then γ₁ else if t = c₂ then γ₂ else 0

/-- **1.4** Coverage at least `1 - α`. -/
def HasConfidenceCoverage (P : Θ → Measure X) (C : X → Set Θ) (α : ℝ) : Prop :=
  ∀ θ, MeasurableSet {x | θ ∈ C x} ∧ 1 - α ≤ (P θ).real {x | θ ∈ C x}

/-- **1.4** The confidence set obtained by inverting tests. -/
def confidenceSetOfTests (reject : Θ → Set X) (x : X) : Set Θ := {θ | x ∉ reject θ}

/-- **1.4** Test–confidence-set duality. -/
theorem hasConfidenceCoverage_confidenceSetOfTests (P : Θ → Measure X)
    [∀ θ, IsProbabilityMeasure (P θ)] (reject : Θ → Set X) (hm : ∀ θ, MeasurableSet (reject θ))
    (α : ℝ) (hlevel : ∀ θ, (P θ).real (reject θ) ≤ α) :
    HasConfidenceCoverage P (confidenceSetOfTests reject) α := sorry

/-- **1.5** The risk of a randomized rule for a real loss. -/
def risk {A : Type*} [MeasurableSpace A] (P : Θ → Measure X) (L : Θ → A → ℝ) (κ : Kernel X A)
    (θ : Θ) : ℝ :=
  ∫ a, L θ a ∂(κ ∘ₘ P θ)

/-- **1.5** `Q` is a garbling of `P`. -/
def IsGarbling {Y : Type*} [MeasurableSpace Y] (P : Θ → Measure X) (Q : Θ → Measure Y) : Prop :=
  ∃ K : Kernel X Y, IsMarkovKernel K ∧ ∀ θ, Q θ = K ∘ₘ P θ

/-- **1.5** The real risk of a nonnegative bounded loss is Mathlib's risk integral. -/
theorem ofReal_risk_eq_lintegral [MeasurableSpace Θ] {A : Type*} [MeasurableSpace A]
    (P : Kernel Θ X) [IsMarkovKernel P] (L : Θ → A → ℝ) (hL : ∀ θ, Measurable (L θ))
    (hL0 : ∀ θ a, 0 ≤ L θ a) {C : ℝ} (hC : ∀ θ a, L θ a ≤ C) (κ : Kernel X A) [IsMarkovKernel κ]
    (θ : Θ) :
    ENNReal.ofReal (risk (fun θ ↦ P θ) L κ θ) = ∫⁻ a, ENNReal.ofReal (L θ a) ∂((κ ∘ₖ P) θ) :=
  sorry

end Layer1

/-! ### Layer 2: sufficiency and completeness -/

section Layer2

variable {Θ X S V : Type*} [MeasurableSpace X] [MeasurableSpace S] [MeasurableSpace V]

/-- **2.1** Sufficiency: one Markov kernel disintegrates every joint law of `(T, X)`. -/
def IsSufficientStatistic (P : Θ → Measure X) (T : X → S) : Prop :=
  Measurable T ∧ ∃ K : Kernel S X, IsMarkovKernel K ∧
    ∀ θ, (P θ).map (fun x ↦ (T x, x)) = (P θ).map T ⊗ₘ K

/-- **2.1** Completeness. -/
def IsCompleteStatistic (P : Θ → Measure X) (T : X → S) : Prop :=
  ∀ g : S → ℝ, Measurable g →
    (∀ θ, Integrable (g ∘ T) (P θ) ∧ ∫ x, g (T x) ∂P θ = 0) → ∀ θ, ∀ᵐ x ∂P θ, g (T x) = 0

/-- **2.1** Bounded completeness. -/
def IsBoundedlyCompleteStatistic (P : Θ → Measure X) (T : X → S) : Prop :=
  ∀ g : S → ℝ, Measurable g → (∃ C, ∀ s, |g s| ≤ C) →
    (∀ θ, ∫ x, g (T x) ∂P θ = 0) → ∀ θ, ∀ᵐ x ∂P θ, g (T x) = 0

/-- **2.1** Ancillarity. -/
def IsAncillaryStatistic (P : Θ → Measure X) (T : X → S) : Prop :=
  Measurable T ∧ ∀ θ θ', (P θ).map T = (P θ').map T

/-- **2.1** Minimal sufficiency: sufficient, and a function of every sufficient statistic. -/
def IsMinimalSufficientStatistic (P : Θ → Measure X) (T : X → S) : Prop :=
  IsSufficientStatistic P T ∧ ∀ (S' : Type*) [MeasurableSpace S'] (U : X → S'),
    IsSufficientStatistic P U → ∃ φ : S' → S, Measurable φ ∧ ∀ θ, T =ᵐ[P θ] φ ∘ U

/-- **2.2** The factorization theorem. -/
theorem isSufficientStatistic_iff_exists_factorization [StandardBorelSpace X] [Nonempty X]
    [Nonempty Θ] (P : Θ → Measure X) [∀ θ, IsProbabilityMeasure (P θ)] (μ : Measure X)
    [SigmaFinite μ] (f : Θ → X → ℝ) (hf : ∀ θ, HasDensity (P θ) μ (f θ)) (T : X → S)
    (hT : Measurable T) :
    IsSufficientStatistic P T ↔ ∃ (g : Θ → S → ℝ) (h : X → ℝ),
      (∀ θ, Measurable (g θ) ∧ ∀ s, 0 ≤ g θ s) ∧ Measurable h ∧ (∀ x, 0 ≤ h x) ∧
      ∀ θ, ∀ᵐ x ∂μ, f θ x = g θ (T x) * h x := sorry

/-- **2.2** Minimal sufficiency of the likelihood ratio for a countable family. -/
theorem isMinimalSufficientStatistic_likelihoodRatio [StandardBorelSpace X] [Nonempty X]
    [Countable Θ] (P : Θ → Measure X) [∀ θ, IsProbabilityMeasure (P θ)] (μ : Measure X)
    [SigmaFinite μ] (f : Θ → X → ℝ) (hf : ∀ θ, HasDensity (P θ) μ (f θ))
    (hpos : ∀ θ x, 0 < f θ x) (θ₀ : Θ) :
    IsMinimalSufficientStatistic P (fun x θ ↦ f θ x / f θ₀ x) := sorry

/-- **2.3** Basu's theorem. -/
theorem indepFun_of_isSufficientStatistic_of_isBoundedlyCompleteStatistic
    (P : Θ → Measure X) [∀ θ, IsProbabilityMeasure (P θ)] (T : X → S) (A : X → V)
    (hs : IsSufficientStatistic P T) (hc : IsBoundedlyCompleteStatistic P T)
    (ha : IsAncillaryStatistic P A) (θ : Θ) : IndepFun T A (P θ) := sorry

/-- **2.4** Completeness of symmetric statistics in a convex complete set of laws. -/
theorem ae_eq_zero_pi_of_isCompleteStatistic_of_convex {C : Set (ProbabilityMeasure X)}
    (hc : ∀ f : X → ℝ, Measurable f →
      (∀ P ∈ C, Integrable f (P : Measure X) ∧ ∫ x, f x ∂(P : Measure X) = 0) →
      ∀ P ∈ C, ∀ᵐ x ∂(P : Measure X), f x = 0)
    (hconv : ∀ P ∈ C, ∀ Q ∈ C, ∀ a : ℝ≥0, a ≤ 1 →
      ∃ R ∈ C, (R : Measure X) = (a : ℝ≥0∞) • (P : Measure X) +
        ((1 - a : ℝ≥0) : ℝ≥0∞) • (Q : Measure X))
    {n : ℕ} (g : (Fin n → X) → ℝ) (hgm : Measurable g)
    (hsym : ∀ (σ : Equiv.Perm (Fin n)) x, g (x ∘ σ) = g x)
    (hint : ∀ P ∈ C, Integrable g (Measure.pi fun _ : Fin n ↦ (P : Measure X)) ∧
      ∫ x, g x ∂(Measure.pi fun _ : Fin n ↦ (P : Measure X)) = 0)
    (P : ProbabilityMeasure X) (hP : P ∈ C) :
    g =ᵐ[Measure.pi fun _ : Fin n ↦ (P : Measure X)] 0 := sorry

end Layer2

/-! ### Layer 3: natural exponential families -/

section Layer3

variable {X E : Type*} [MeasurableSpace X] [NormedAddCommGroup E] [InnerProductSpace ℝ E]

/-- **3.1** The natural parameter space. -/
def naturalParameterSpace (ν : Measure X) (T : X → E) : Set E :=
  {η | Integrable (fun x ↦ Real.exp (inner ℝ η (T x))) ν}

/-- **3.1** The log partition function. -/
def logPartition (ν : Measure X) (T : X → E) (η : E) : ℝ :=
  Real.log (∫ x, Real.exp (inner ℝ η (T x)) ∂ν)

/-- **3.1** The law of the natural exponential family at `η`. -/
def exponentialFamilyMeasure (ν : Measure X) (T : X → E) (η : E) : Measure X :=
  ν.withDensity (fun x ↦ ENNReal.ofReal (Real.exp (inner ℝ η (T x) - logPartition ν T η)))

/-- **3.1** Minimality: no nonzero linear functional of `T` is a.e. constant. -/
def IsMinimalExponentialFamily (ν : Measure X) (T : X → E) : Prop :=
  ∀ u : E, u ≠ 0 → ∀ c : ℝ, ¬ ∀ᵐ x ∂ν, inner ℝ u (T x) = c

/-- **3.1** Convexity of the natural parameter space. -/
theorem convex_naturalParameterSpace (ν : Measure X) (T : X → E) :
    Convex ℝ (naturalParameterSpace ν T) := sorry

variable [MeasurableSpace E] [BorelSpace E] [FiniteDimensional ℝ E]

/-- **3.2** Laplace determinacy. -/
theorem measure_eq_of_integral_exp_inner_eq (μ₁ μ₂ : Measure E) [IsFiniteMeasure μ₁]
    [IsFiniteMeasure μ₂] {r : ℝ} (hr : 0 < r)
    (hint : ∀ u : E, ‖u‖ < r → Integrable (fun t ↦ Real.exp (inner ℝ u t)) μ₁)
    (heq : ∀ u : E, ‖u‖ < r →
      ∫ t, Real.exp (inner ℝ u t) ∂μ₁ = ∫ t, Real.exp (inner ℝ u t) ∂μ₂) :
    μ₁ = μ₂ := sorry

/-- **3.3** Analyticity of the log partition function on the interior. -/
theorem analyticOnNhd_logPartition (ν : Measure E) (hne : ν ≠ 0) :
    AnalyticOnNhd ℝ (logPartition ν id) (interior (naturalParameterSpace ν id)) := sorry

/-- **3.3** The gradient of the log partition function is the mean. -/
theorem hasFDerivAt_logPartition (ν : Measure E) (hne : ν ≠ 0) {η : E}
    (hη : η ∈ interior (naturalParameterSpace ν id)) :
    HasFDerivAt (logPartition ν id) (innerSL ℝ (∫ x, x ∂exponentialFamilyMeasure ν id η)) η :=
  sorry

/-- **3.3** The Hessian of the log partition function is the covariance. -/
theorem fderiv_fderiv_logPartition_apply (ν : Measure E) (hne : ν ≠ 0) {η : E}
    (hη : η ∈ interior (naturalParameterSpace ν id)) (u v : E) :
    fderiv ℝ (fderiv ℝ (logPartition ν id)) η u v =
      cov[fun x ↦ inner ℝ u x, fun x ↦ inner ℝ v x; exponentialFamilyMeasure ν id η] := sorry

/-- **3.5** The mean parametrization of a regular minimal family. -/
theorem exists_analytic_inverse_exponential_family_mean (ν : Measure E) [SigmaFinite ν]
    (hne : ν ≠ 0) (hminimal : IsMinimalExponentialFamily ν id)
    (hN : IsOpen (naturalParameterSpace ν id)) (hNne : (naturalParameterSpace ν id).Nonempty) :
    ∃ g : E → E,
      AnalyticOnNhd ℝ (fun η ↦ ∫ x, x ∂exponentialFamilyMeasure ν id η)
          (naturalParameterSpace ν id) ∧
        AnalyticOnNhd ℝ g (interior (convexHull ℝ ν.support)) ∧
        (∀ η ∈ naturalParameterSpace ν id,
          (∫ x, x ∂exponentialFamilyMeasure ν id η) ∈ interior (convexHull ℝ ν.support) ∧
            g (∫ x, x ∂exponentialFamilyMeasure ν id η) = η) ∧
        ∀ m ∈ interior (convexHull ℝ ν.support),
          g m ∈ naturalParameterSpace ν id ∧ (∫ x, x ∂exponentialFamilyMeasure ν id (g m)) = m :=
  sorry

/-- **3.6** Existence of the maximum likelihood estimator. -/
theorem exists_isMaxOn_logLikelihood_iff_mem_interior_convexHull_support (ν : Measure E)
    [SigmaFinite ν] (hne : ν ≠ 0) (hminimal : IsMinimalExponentialFamily ν id)
    (hNne : (naturalParameterSpace ν id).Nonempty) (t : E) :
    (∃ η ∈ naturalParameterSpace ν id,
        IsMaxOn (fun ζ ↦ inner ℝ ζ t - logPartition ν id ζ) (naturalParameterSpace ν id) η) ↔
      t ∈ interior (convexHull ℝ ν.support) := sorry

end Layer3

/-- **3.8** The Pitman–Koopman–Darmois theorem. For each sample size in `N`, one statistic `T`
serves every `θ`; only the monotone function `H` depends on `θ`. -/
theorem exists_exponential_family_of_monotone_sufficient_statistics {Θ X : Type*}
    [MeasurableSpace X] (P : Θ → Measure X) [∀ θ, IsProbabilityMeasure (P θ)] (P₀ : Measure X)
    [IsProbabilityMeasure P₀] (heq : ∀ θ, P θ ≪ P₀ ∧ P₀ ≪ P θ) (N : Set ℕ) (hN : N.Infinite)
    (h1 : 1 ∈ N)
    (hmon : ∀ n ∈ N, ∃ T : (Fin n → X) → ℝ, Measurable T ∧ ∀ θ, ∃ H : ℝ → ℝ, Monotone H ∧
      HasDensity (Measure.pi fun _ : Fin n ↦ P θ) (Measure.pi fun _ : Fin n ↦ P₀) (H ∘ T)) :
    ∃ T : X → ℝ, Measurable T ∧ ∀ θ, ∃ C > 0, ∃ a : ℝ,
      HasDensity (P θ) P₀ (fun x ↦ C * Real.exp (a * T x)) := sorry

/-- **3.4** Completeness of the natural statistic. -/
theorem isCompleteStatistic_withDensity_exp_inner {X : Type*} [MeasurableSpace X] {d : ℕ}
    (ν : Measure X) (T : X → EuclideanSpace ℝ (Fin d)) (hT : Measurable T)
    (U : Set (EuclideanSpace ℝ (Fin d))) (hU : IsOpen U) (hne : U.Nonempty)
    (Z : EuclideanSpace ℝ (Fin d) → ℝ)
    (hZ : ∀ η ∈ U, Integrable (fun x ↦ Real.exp (inner ℝ η (T x))) ν ∧
      Z η = ∫ x, Real.exp (inner ℝ η (T x)) ∂ν ∧ 0 < Z η) :
    IsCompleteStatistic (fun η : U ↦ ν.withDensity
      (fun x ↦ ENNReal.ofReal (Real.exp (inner ℝ η.val (T x)) / Z η.val))) T := sorry

/-! ### Layer 4: unbiased estimation and information -/

section Layer4

variable {Θ X S : Type*} [MeasurableSpace X] [MeasurableSpace S]

/-- **4.1** An unbiased estimator of `g`. -/
def IsUnbiasedEstimator (P : Θ → Measure X) (δ : X → ℝ) (g : Θ → ℝ) : Prop :=
  Measurable δ ∧ ∀ θ, Integrable δ (P θ) ∧ ∫ x, δ x ∂P θ = g θ

/-- **4.1** A uniformly minimum variance unbiased estimator of `g`. -/
def IsMinimumVarianceUnbiasedEstimator (P : Θ → Measure X) (W : X → ℝ) (g : Θ → ℝ) : Prop :=
  IsUnbiasedEstimator P W g ∧ (∀ θ, MemLp W 2 (P θ)) ∧
    ∀ W', IsUnbiasedEstimator P W' g → (∀ θ, MemLp W' 2 (P θ)) → ∀ θ, Var[W; P θ] ≤ Var[W'; P θ]

/-- **4.1** The covariance characterization of UMVU estimators. -/
theorem isMinimumVarianceUnbiasedEstimator_iff_covariance_eq_zero (P : Θ → Measure X)
    [∀ θ, IsProbabilityMeasure (P θ)] (W : X → ℝ) (g : Θ → ℝ) (hW : IsUnbiasedEstimator P W g)
    (hW2 : ∀ θ, MemLp W 2 (P θ)) :
    IsMinimumVarianceUnbiasedEstimator P W g ↔
      ∀ U, IsUnbiasedEstimator P U (fun _ ↦ 0) → (∀ θ, MemLp U 2 (P θ)) →
        ∀ θ, cov[W, U; P θ] = 0 := sorry

/-- **4.2** Rao–Blackwell, with one rule for every convex loss and parameter. -/
theorem exists_rao_blackwell_estimator (P : Θ → Measure X) [∀ θ, IsProbabilityMeasure (P θ)]
    (T : X → S) (hT : IsSufficientStatistic P T) (δ : X → ℝ) (hδ : Measurable δ)
    (hint : ∀ θ, Integrable δ (P θ)) :
    ∃ r : S → ℝ, Measurable r ∧ ∀ θ,
      Integrable (r ∘ T) (P θ) ∧ ∫ x, r (T x) ∂P θ = ∫ x, δ x ∂P θ ∧
      ∀ L : ℝ → ℝ, ConvexOn ℝ univ L → Integrable (fun x ↦ L (δ x)) (P θ) →
        Integrable (fun x ↦ L (r (T x))) (P θ) ∧
          ∫ x, L (r (T x)) ∂P θ ≤ ∫ x, L (δ x) ∂P θ := sorry

/-- **4.2** Lehmann–Scheffé, optimality. -/
theorem isMinimumVarianceUnbiasedEstimator_of_isCompleteStatistic (P : Θ → Measure X)
    [∀ θ, IsProbabilityMeasure (P θ)] (T : X → S) (hs : IsSufficientStatistic P T)
    (hc : IsCompleteStatistic P T) (r : S → ℝ) (hr : Measurable r) (g : Θ → ℝ)
    (hu : IsUnbiasedEstimator P (r ∘ T) g) (h2 : ∀ θ, MemLp (r ∘ T) 2 (P θ)) :
    IsMinimumVarianceUnbiasedEstimator P (r ∘ T) g := sorry

/-- **4.3** The score of a real-parameter likelihood. -/
def likelihoodScore (f : ℝ → X → ℝ) (θ : ℝ) (x : X) : ℝ :=
  deriv (fun t ↦ Real.log (f t x)) θ

/-- **4.3** The Fisher information. -/
def fisherInformation (P : ℝ → Measure X) (f : ℝ → X → ℝ) (θ : ℝ) : ℝ :=
  ∫ x, likelihoodScore f θ x ^ 2 ∂P θ

/-- **4.3** The information inequality in score-moment form. -/
theorem sq_div_information_le_variance (P : Measure X) [IsProbabilityMeasure P]
    (W score : X → ℝ) (hW : MemLp W 2 P) (hs : MemLp score 2 P) (g' : ℝ)
    (hcross : ∫ x, (W x - ∫ y, W y ∂P) * score x ∂P = g')
    (hI : 0 < ∫ x, score x ^ 2 ∂P) :
    g' ^ 2 / ∫ x, score x ^ 2 ∂P ≤ Var[W; P] := sorry

/-- **4.4** The James–Stein estimator dominates `X` in dimension `p ≥ 3`. -/
theorem james_stein_risk_eq_and_lt {p : ℕ} (hp : 3 ≤ p) (θ : EuclideanSpace ℝ (Fin p)) :
    let P := multivariateGaussian θ (1 : Matrix (Fin p) (Fin p) ℝ)
    let δ := fun x : EuclideanSpace ℝ (Fin p) ↦ (1 - ((p : ℝ) - 2) / ‖x‖ ^ 2) • x
    (∫ x, ‖δ x - θ‖ ^ 2 ∂P) = (p : ℝ) - ((p : ℝ) - 2) ^ 2 * (∫ x, (‖x‖ ^ 2)⁻¹ ∂P) ∧
      (∫ x, ‖δ x - θ‖ ^ 2 ∂P) < p := sorry

/-- **4.5** Location equivariance. -/
def IsLocationEquivariant {n : ℕ} (δ : (Fin n → ℝ) → ℝ) : Prop :=
  ∀ x a, δ (fun i ↦ x i + a) = δ x + a

/-- **4.5** The Pitman estimator of location. -/
def pitmanEstimator {n : ℕ} (f : ℝ → ℝ) (x : Fin n → ℝ) : ℝ :=
  (∫ u, u * ∏ i, f (x i - u)) / ∫ u, ∏ i, f (x i - u)

end Layer4

/-! ### Layer 5: order statistics and Gaussian samples -/

/-- **5.1** The joint density of the order statistics. -/
theorem map_orderStatistics_eq_withDensity {n : ℕ} (P : Measure ℝ) [IsProbabilityMeasure P]
    (f : ℝ → ℝ) (hf : HasDensity P volume f) :
    (Measure.pi fun _ : Fin n ↦ P).map (fun x i ↦ TauCeti.orderStatistic i x) =
      (volume : Measure (Fin n → ℝ)).withDensity (fun x ↦
        if StrictMono x then ENNReal.ofReal ((n.factorial : ℝ) * ∏ i, f (x i)) else 0) := sorry

/-- **5.2** Sample mean and residual sum of squares of a Gaussian sample. -/
theorem gaussian_sample_mean_residual_laws (n : ℕ) (hn : 2 ≤ n) (m : ℝ) (v : ℝ≥0) (hv : 0 < v) :
    let P := Measure.pi (fun _ : Fin n ↦ gaussianReal m v)
    let mean := fun x : Fin n → ℝ ↦ (∑ i, x i) / n
    let ss := fun x : Fin n → ℝ ↦ ∑ i, (x i - mean x) ^ 2
    P.map (fun x ↦ ss x / v) = TauCeti.Probability.chiSquaredMeasure (n - 1 : ℕ) ∧
      IndepFun mean ss P ∧
      P.map (fun x ↦ Real.sqrt n * (mean x - m) / Real.sqrt (ss x / (n - 1 : ℕ))) =
        TauCeti.Probability.studentTMeasure (n - 1 : ℕ) := sorry

/-! ### Layer 6: tests -/

section Layer6

variable {Θ X S : Type*} [MeasurableSpace X]

/-- **6.2** The Neyman–Pearson lemma: existence and optimality at exact size `α`. -/
theorem exists_neyman_pearson_test (P₀ P₁ μ : Measure X) [IsProbabilityMeasure P₀]
    [IsProbabilityMeasure P₁] (f₀ f₁ : X → ℝ) (h₀ : HasDensity P₀ μ f₀) (h₁ : HasDensity P₁ μ f₁)
    (α : ℝ) (hα : α ∈ Ioo 0 1) :
    ∃ k : ℝ, 0 ≤ k ∧ ∃ φ : X → ℝ, IsStatisticalTest φ ∧ ∫ x, φ x ∂P₀ = α ∧
      (∀ᵐ x ∂μ, (k * f₀ x < f₁ x → φ x = 1) ∧ (f₁ x < k * f₀ x → φ x = 0)) ∧
      ∀ ψ, IsStatisticalTest ψ → ∫ x, ψ x ∂P₀ ≤ α → ∫ x, ψ x ∂P₁ ≤ ∫ x, φ x ∂P₁ := sorry

namespace NeymanPearson

variable (P Q : Measure X)

/-- **6.2** The likelihood ratio of `Q` against `P` with respect to `P + Q`, as in Mathlib pull
request #39791. -/
def npLikelihoodRatio : X → ℝ := fun x ↦
  (Q.rnDeriv (P + Q) x).toReal / (P.rnDeriv (P + Q) x).toReal

/-- **6.2** The Neyman–Pearson test against the threshold `t⁻¹`. -/
def npTest (t η : ℝ) : X → ℝ := fun x ↦
  if (P.rnDeriv (P + Q) x).toReal = 0 then 1
  else if t⁻¹ < npLikelihoodRatio P Q x then 1
  else if npLikelihoodRatio P Q x = t⁻¹ then η else 0

/-- **6.2** The sum-of-errors functional `∫ T dP + t ∫ (1 - T) dQ`. -/
def npSumError (t : ℝ) (T : X → ℝ) : ℝ := ∫ x, T x ∂P + t * ∫ x, (1 - T x) ∂Q

/-- **6.2** The Neyman–Pearson lemma, sum-of-errors form. -/
theorem neyman_pearson [IsFiniteMeasure P] [IsFiniteMeasure Q] (t η : ℝ) (ht : 0 < t)
    (hη : η ∈ Icc (0 : ℝ) 1) :
    IsMinOn (npSumError P Q t) {T : X → ℝ | Measurable T ∧ (∀ x, 0 ≤ T x) ∧ ∀ x, T x ≤ 1}
      (npTest P Q t η) := sorry

end NeymanPearson

/-- **6.2** The generalized Neyman–Pearson lemma with signed multipliers. -/
theorem integral_le_of_generalized_neyman_pearson {m : ℕ} (μ : Measure X) (f₀ : X → ℝ)
    (f : Fin m → X → ℝ) (k : Fin m → ℝ) (hf₀ : Integrable f₀ μ) (hf : ∀ i, Integrable (f i) μ)
    (φ ψ : X → ℝ) (hφ : IsStatisticalTest φ) (hψ : IsStatisticalTest ψ)
    (hthreshold : ∀ᵐ x ∂μ, ((∑ i, k i * f i x) < f₀ x → φ x = 1) ∧
      (f₀ x < ∑ i, k i * f i x → φ x = 0))
    (hconstraints : ∀ i, k i * ∫ x, ψ x * f i x ∂μ ≤ k i * ∫ x, φ x * f i x ∂μ) :
    ∫ x, ψ x * f₀ x ∂μ ≤ ∫ x, φ x * f₀ x ∂μ := sorry

/-- **6.3** The Karlin–Rubin theorem. -/
theorem isUniformlyMostPowerfulTest_of_monotone_likelihood_ratio (P : ℝ → Measure X)
    (μ : Measure X) [∀ θ, IsProbabilityMeasure (P θ)] (f : ℝ → X → ℝ)
    (hf : ∀ θ, HasDensity (P θ) μ (f θ)) (hpos : ∀ θ x, 0 < f θ x) (T : X → ℝ)
    (hT : Measurable T)
    (hmlr : ∀ a b, a < b → ∃ r : ℝ → ℝ, Monotone r ∧ ∀ x, f b x / f a x = r (T x))
    (θ₀ c γ α : ℝ) (hγ : γ ∈ Icc 0 1) (hsize : ∫ x, thresholdTest T c γ x ∂P θ₀ = α) :
    IsUniformlyMostPowerfulTest P (Iic θ₀) (Ioi θ₀) α (thresholdTest T c γ) := sorry

/-- **6.5** Uniformly most powerful interval tests in a one-parameter family. -/
theorem exists_ump_interval_test (ν : Measure X) (T : X → ℝ) (hT : Measurable T)
    (hnc : ∀ c : ℝ, ¬ ∀ᵐ x ∂ν, T x = c) (U : Set ℝ) (hU : IsOpen U) (hUc : Convex ℝ U)
    (hUN : U ⊆ naturalParameterSpace ν T) (η₁ η₂ : U) (hη : η₁.val < η₂.val)
    (α : ℝ) (hα : α ∈ Ioo 0 1) :
    let P := fun η : U ↦ exponentialFamilyMeasure ν T η.val
    ∃ c₁ c₂ γ₁ γ₂ : ℝ, c₁ ≤ c₂ ∧ γ₁ ∈ Icc 0 1 ∧ γ₂ ∈ Icc 0 1 ∧
      testPower P (fun x ↦ intervalTest (T x) c₁ c₂ γ₁ γ₂) η₁ = α ∧
      testPower P (fun x ↦ intervalTest (T x) c₁ c₂ γ₁ γ₂) η₂ = α ∧
      IsUniformlyMostPowerfulTest P {η | η.val ≤ η₁.val ∨ η₂.val ≤ η.val}
        {η | η₁.val < η.val ∧ η.val < η₂.val} α (fun x ↦ intervalTest (T x) c₁ c₂ γ₁ γ₂) :=
  sorry

/-- **6.6** Similar tests have Neyman structure. -/
theorem condExp_eq_const_of_isSimilarTest [MeasurableSpace S] (P : Θ → Measure X)
    [∀ θ, IsProbabilityMeasure (P θ)] (T : X → S) (hs : IsSufficientStatistic P T)
    (hc : IsBoundedlyCompleteStatistic P T) (φ : X → ℝ) (α : ℝ)
    (hsim : IsSimilarTest P univ α φ) (θ : Θ) :
    (P θ)[φ | (inferInstance : MeasurableSpace S).comap T] =ᵐ[P θ] fun _ ↦ α := sorry

/-- **6.8** Invariant functions factor through a maximal invariant. -/
theorem invariant_iff_factors_through_maximal_invariant {G A B C : Type*} [Group G]
    [MulAction G A] [Nonempty C] (M : A → B) (hM : ∀ (g : G) x, M (g • x) = M x)
    (hmax : ∀ x y, M x = M y → ∃ g : G, g • x = y) (f : A → C) :
    (∀ (g : G) x, f (g • x) = f x) ↔ ∃ q : B → C, f = q ∘ M := sorry

end Layer6

/-! ### Layer 7: decision theory -/

section Layer7

variable {Θ D : Type*}

/-- **7.1** Admissibility in a class of rules with real risk functions. -/
def IsAdmissibleRisk (R : D → Θ → ℝ) (δ : D) : Prop :=
  ¬ ∃ δ', (∀ θ, R δ' θ ≤ R δ θ) ∧ ∃ θ, R δ' θ < R δ θ

/-- **7.1** Bayes rules for a prior `π`. -/
def IsBayesRule [MeasurableSpace Θ] (R : D → Θ → ℝ) (π : Measure Θ) (δ : D) : Prop :=
  Integrable (R δ) π ∧ ∀ δ', Integrable (R δ') π → ∫ θ, R δ θ ∂π ≤ ∫ θ, R δ' θ ∂π

/-- **7.1** Minimax rules. -/
def IsMinimaxRule (R : D → Θ → ℝ) (δ : D) : Prop :=
  BddAbove (range (R δ)) ∧ ∀ δ', BddAbove (range (R δ')) → ⨆ θ, R δ θ ≤ ⨆ θ, R δ' θ

/-- **7.1** A Bayes rule for a probability prior whose risk is at most its Bayes risk is minimax,
when every rule has integrable risk. -/
theorem IsMinimaxRule.of_isBayesRule_of_risk_le [MeasurableSpace Θ] (R : D → Θ → ℝ)
    (π : Measure Θ) [IsProbabilityMeasure π] (hint : ∀ δ, Integrable (R δ) π) (δ : D)
    (hδ : IsBayesRule R π δ) (hle : ∀ θ, R δ θ ≤ ∫ θ', R δ θ' ∂π) :
    IsMinimaxRule R δ ∧ ∀ π' : Measure Θ, IsProbabilityMeasure π' → Integrable (R δ) π' →
      ∫ θ, R δ θ ∂π' ≤ ∫ θ, R δ θ ∂π := sorry

/-- **7.1** A Bayes rule that is unique up to its risk function is admissible, when every rule
has integrable risk. -/
theorem IsBayesRule.isAdmissibleRisk_of_unique [MeasurableSpace Θ] (R : D → Θ → ℝ)
    (π : Measure Θ) [IsFiniteMeasure π] (hint : ∀ δ, Integrable (R δ) π) (δ : D)
    (hδ : IsBayesRule R π δ) (huniq : ∀ δ', IsBayesRule R π δ' → R δ' = R δ) :
    IsAdmissibleRisk R δ := sorry

/-- **7.2** The minimax theorem for finite statistical games. -/
theorem exists_statistical_game_saddle_point {X A : Type*} [MeasurableSpace X] [Fintype Θ]
    [Nonempty Θ] [MeasurableSpace Θ] [MeasurableSingletonClass Θ] [Fintype A] [Nonempty A]
    [MeasurableSpace A] [MeasurableSingletonClass A] (P : Θ → Measure X)
    [∀ θ, IsProbabilityMeasure (P θ)] (L : Θ → A → ℝ) :
    ∃ δ : {κ : Kernel X A // IsMarkovKernel κ}, ∃ π : ProbabilityMeasure Θ,
      IsBayesRule (fun κ : {κ : Kernel X A // IsMarkovKernel κ} ↦ risk P L κ.val)
        (π : Measure Θ) δ ∧
      ∀ θ, risk P L δ.val θ ≤ ∫ θ', risk P L δ.val θ' ∂(π : Measure Θ) := sorry

/-- **7.2** The complete class theorem for a finite parameter set, in risk-set form. -/
theorem exists_admissible_bayes_risk_le_of_closed_convex {d : ℕ} (hd : 0 < d)
    (C : Set (Fin d → ℝ)) (hc : Convex ℝ C) (hclosed : IsClosed C)
    (hb : ∃ b : Fin d → ℝ, ∀ x ∈ C, ∀ i, b i ≤ x i) :
    ∀ x ∈ C, ∃ y ∈ C, (∀ i, y i ≤ x i) ∧ (¬ ∃ z ∈ C, (∀ i, z i ≤ y i) ∧ ∃ i, z i < y i) ∧
      ∃ w : Fin d → ℝ, (∀ i, 0 ≤ w i) ∧ ∑ i, w i = 1 ∧ ∀ z ∈ C, ∑ i, w i * y i ≤ ∑ i, w i * z i :=
  sorry

/-- **7.4** The contrast supremum behind Scheffé's method. -/
theorem scheffe_contrast_supremum {H : Type*} [NormedAddCommGroup H] [InnerProductSpace ℝ H]
    (S : Submodule ℝ H) (v : H) (hv : v ∈ S) (s : ℝ) (hs : 0 < s) :
    sSup {r : ℝ | ∃ u ∈ S, u ≠ 0 ∧ r = inner ℝ u v ^ 2 / (s ^ 2 * ‖u‖ ^ 2)} = ‖v‖ ^ 2 / s ^ 2 :=
  sorry

/-- **7.5** Blackwell's order on experiments. -/
def IsMoreInformative {X Y : Type*} [MeasurableSpace X] [MeasurableSpace Y]
    (P : Θ → Measure X) (Q : Θ → Measure Y) : Prop :=
  ∀ n : ℕ, ∀ L : Θ → Fin n → ℝ, (∃ C, ∀ θ a, |L θ a| ≤ C) →
    ∀ δ : Kernel Y (Fin n), IsMarkovKernel δ → ∃ δ' : Kernel X (Fin n), IsMarkovKernel δ' ∧
      ∀ θ, risk P L δ' θ ≤ risk Q L δ θ

/-- **7.5** Blackwell's comparison theorem for a finite parameter set. -/
theorem isMoreInformative_iff_isGarbling {X Y : Type*} [Fintype Θ] [MeasurableSpace X]
    [MeasurableSpace Y] [StandardBorelSpace Y] [Nonempty Y] (P : Θ → Measure X)
    (Q : Θ → Measure Y) [∀ θ, IsProbabilityMeasure (P θ)] [∀ θ, IsProbabilityMeasure (Q θ)] :
    IsMoreInformative P Q ↔ IsGarbling P Q := sorry

end Layer7

/-! ### Layer 8: convergence and stochastic algebra -/

section Layer8

variable {Ω Ω' E F : Type*} [MeasurableSpace Ω] [MeasurableSpace Ω']

/-- **8.1** The chi-squared laws with natural degrees of freedom are probability measures. -/
instance isProbabilityMeasure_chiSquaredMeasure_natCast (k : ℕ) :
    IsProbabilityMeasure (TauCeti.Probability.chiSquaredMeasure k) :=
  TauCeti.Probability.isProbabilityMeasure_chiSquaredMeasure (Nat.cast_nonneg _)

/-- **8.2** Boundedness in probability, measured by the outer measure. -/
def IsBoundedInProbability [SeminormedAddCommGroup E] (μ : Measure Ω) (X : ℕ → Ω → E) : Prop :=
  ∀ ε > 0, ∃ C > 0, ∀ᶠ n in atTop, μ.real {ω | C < ‖X n ω‖} ≤ ε

/-- **8.2** For real random variables, boundedness in probability is tightness of the laws. -/
theorem isBoundedInProbability_iff_isTightMeasureSet {μ : Measure Ω} [IsFiniteMeasure μ]
    {X : ℕ → Ω → ℝ} (hX : ∀ n, AEMeasurable (X n) μ) :
    IsBoundedInProbability μ X ↔ IsTightMeasureSet (range fun n ↦ μ.map (X n)) := sorry

/-- **8.3** `O_P(1) · o_P(1) = o_P(1)`. -/
theorem tendstoInMeasure_mul_zero_of_isBoundedInProbability (μ : Measure Ω) [IsFiniteMeasure μ]
    (U V : ℕ → Ω → ℝ) (hU : IsBoundedInProbability μ U)
    (hV : TendstoInMeasure μ V atTop (fun _ ↦ 0)) :
    TendstoInMeasure μ (fun n ω ↦ U n ω * V n ω) atTop (fun _ ↦ 0) := sorry

/-- **8.4** Slutsky's lemma without second countability. -/
theorem tendstoInDistribution_of_tendstoInMeasure_sub_of_measurable
    [SeminormedAddCommGroup F] [MeasurableSpace F] [OpensMeasurableSpace F]
    (μ : Measure Ω) [IsProbabilityMeasure μ] {μ' : Measure Ω'} [IsProbabilityMeasure μ']
    (X Y : ℕ → Ω → F) {Z : Ω' → F} (hX : ∀ n, Measurable (X n)) (hY : ∀ n, Measurable (Y n))
    (hXZ : TendstoInDistribution X atTop Z (fun _ ↦ μ) μ')
    (hXY : TendstoInMeasure μ (fun n ω ↦ Y n ω - X n ω) atTop (fun _ ↦ 0)) :
    TendstoInDistribution Y atTop Z (fun _ ↦ μ) μ' := sorry

/-- **8.4** The delta method. -/
theorem tendstoInDistribution_delta_method [NormedAddCommGroup E] [NormedSpace ℝ E]
    [MeasurableSpace E] [BorelSpace E] [NormedAddCommGroup F] [NormedSpace ℝ F]
    [MeasurableSpace F] [BorelSpace F] (μ : Measure Ω) [IsProbabilityMeasure μ]
    {μ' : Measure Ω'} [IsProbabilityMeasure μ'] (T : ℕ → Ω → E) (hT : ∀ n, Measurable (T n))
    (θ : E) {Z : Ω' → E} (g : E → F) (hg : Measurable g) (D : E →L[ℝ] F)
    (hd : HasFDerivAt g D θ)
    (hlim : TendstoInDistribution (fun (n : ℕ) ω ↦ Real.sqrt n • (T n ω - θ)) atTop Z
      (fun _ ↦ μ) μ') :
    TendstoInDistribution (fun (n : ℕ) ω ↦ Real.sqrt n • (g (T n ω) - g θ)) atTop (D ∘ Z)
        (fun _ ↦ μ) μ' ∧
      TendstoInMeasure μ (fun (n : ℕ) ω ↦
        Real.sqrt n • (g (T n ω) - g θ) - D (Real.sqrt n • (T n ω - θ))) atTop (fun _ ↦ 0) :=
  sorry

/-- **8.5** An independent identically distributed family with common law `P`. -/
def IsIndependentIdenticallyDistributed {ι : Type*} [MeasurableSpace E] (μ : Measure Ω)
    (X : ι → Ω → E) (P : Measure E) : Prop :=
  (∀ i, Measurable (X i)) ∧ iIndepFun X μ ∧ ∀ i, μ.map (X i) = P

/-- **8.5** The central limit theorem for a centred square-integrable statistic. -/
theorem tendstoInDistribution_inv_sqrt_mul_sum_of_iid [MeasurableSpace E] (μ : Measure Ω)
    [IsProbabilityMeasure μ] (P : Measure E) (X : ℕ → Ω → E)
    (hiid : IsIndependentIdenticallyDistributed μ X P) (s : E → ℝ) (hs : Measurable s)
    (h2 : MemLp s 2 P) (h0 : ∫ x, s x ∂P = 0) :
    TendstoInDistribution (fun (n : ℕ) ω ↦ (Real.sqrt n)⁻¹ * ∑ i ∈ Finset.range n, s (X i ω))
      atTop id (fun _ ↦ μ) (gaussianReal 0 (Real.toNNReal (∫ x, s x ^ 2 ∂P))) := sorry

/-- **8.6** Contiguity of `Q` with respect to `P` along a filter, on varying sample spaces. -/
def IsContiguous {ι : Type*} {Ω : ι → Type*} [∀ i, MeasurableSpace (Ω i)] (l : Filter ι)
    (P Q : (i : ι) → Measure (Ω i)) : Prop :=
  ∀ A : (i : ι) → Set (Ω i), (∀ i, MeasurableSet (A i)) →
    Tendsto (fun i ↦ (P i).real (A i)) l (𝓝 0) → Tendsto (fun i ↦ (Q i).real (A i)) l (𝓝 0)

end Layer8

/-! ### Layer 9: shared vocabulary -/

section Layer9

/-- **9.1** The mean of a finite sample. -/
def sampleMean {E : Type*} [AddCommMonoid E] [Module ℝ E] {n : ℕ} (x : Fin n → E) : E :=
  (n : ℝ)⁻¹ • ∑ i, x i

/-- **9.1** The mean of the first `n` observations of a sequence. -/
def sampleAverage {Ω E : Type*} [AddCommMonoid E] [Module ℝ E] (X : ℕ → Ω → E) (n : ℕ)
    (ω : Ω) : E :=
  (n : ℝ)⁻¹ • ∑ i ∈ Finset.range n, X i ω

/-- **9.1** The empirical distribution function of the first `n` observations. -/
def empiricalCDF {Ω : Type*} (X : ℕ → Ω → ℝ) (n : ℕ) (ω : Ω) (t : ℝ) : ℝ :=
  ((Finset.range n).filter (fun i ↦ X i ω ≤ t)).card / (n : ℝ)

/-- **9.1** The left empirical quantile. -/
def sampleQuantile {Ω : Type*} (X : ℕ → Ω → ℝ) (n : ℕ) (ω : Ω) (p : ℝ) : ℝ :=
  sInf {t | p ≤ empiricalCDF X n ω t}

/-- **9.1** The U-statistic of order `m` with kernel `h`. -/
def uStatistic {E : Type*} (m n : ℕ) (h : (Fin m → E) → ℝ) (x : Fin n → E) : ℝ :=
  ((n.descFactorial m : ℕ) : ℝ)⁻¹ *
    ∑ f ∈ (Finset.univ : Finset (Fin m → Fin n)).filter Function.Injective, h (x ∘ f)

/-- **9.1** The empirical distribution function is that of the empirical distribution. -/
theorem empiricalCDF_eq_measureReal {Ω : Type*} (X : ℕ → Ω → ℝ) (n : ℕ) (ω : Ω) (t : ℝ) :
    empiricalCDF X n ω t =
      (TauCeti.Probability.empiricalFiniteMeasure (fun i : Fin n ↦ X i ω) : Measure ℝ).real
        (Iic t) := sorry

/-- **9.1** The sequence form of Tau Ceti's empirical measure uses the first `n + 1` terms. -/
theorem empiricalCDF_succ_eq_cdf_empiricalMeasure {Ω : Type*} (X : ℕ → Ω → ℝ) (n : ℕ) (ω : Ω)
    (t : ℝ) :
    empiricalCDF X (n + 1) ω t =
      cdf (TauCeti.Probability.empiricalMeasure (fun i ↦ X i ω) n : Measure ℝ) t := sorry

/-- **9.2** The statistical form of the total variation distance. -/
theorem abs_measureReal_sub_le_tvDist_div_two {X : Type*} [MeasurableSpace X] (P Q : Measure X)
    [IsProbabilityMeasure P] [IsProbabilityMeasure Q] {A : Set X} (hA : MeasurableSet A) :
    |P.real A - Q.real A| ≤ tvDist P Q / 2 := sorry

/-- **9.2** The Kolmogorov distance between laws on the line. -/
def kolmogorovDistance (P Q : Measure ℝ) : ℝ := sSup (range fun t ↦ |cdf P t - cdf Q t|)

/-- **9.2** The Kolmogorov–Smirnov statistic. -/
def kolmogorovSmirnovStatistic {Ω : Type*} (X : ℕ → Ω → ℝ) (P : Measure ℝ) (n : ℕ) (ω : Ω) :
    ℝ :=
  sSup (range fun t : ℚ ↦ |empiricalCDF X n ω t - cdf P t|)

/-- **9.2** The Kolmogorov–Smirnov statistic is a Kolmogorov distance, for `n > 0`. -/
theorem kolmogorovSmirnovStatistic_eq_kolmogorovDistance {Ω : Type*} (X : ℕ → Ω → ℝ)
    (P : Measure ℝ) [IsProbabilityMeasure P] {n : ℕ} (hn : 0 < n) (ω : Ω) :
    kolmogorovSmirnovStatistic X P n ω = kolmogorovDistance
      (TauCeti.Probability.empiricalFiniteMeasure (fun i : Fin n ↦ X i ω) : Measure ℝ) P := sorry

/-- **9.2** The Huber score. -/
def huberScore (k x : ℝ) : ℝ := max (-k) (min k x)

/-- **9.3** The kernel density estimator of a finite sample. -/
def finiteKernelDensityEstimator {n : ℕ} (K : ℝ → ℝ) (h : ℝ) (x : Fin n → ℝ) (t : ℝ) : ℝ :=
  (∑ i, K ((t - x i) / h)) / ((n : ℝ) * h)

/-- **9.3** The restricted isometry property of order `s` with constant `δ`. -/
def HasRestrictedIsometry {p n : ℕ}
    (A : EuclideanSpace ℝ (Fin p) →L[ℝ] EuclideanSpace ℝ (Fin n)) (s : ℕ) (δ : ℝ) : Prop :=
  ∀ x, hammingNorm (WithLp.ofLp x) ≤ s →
    (1 - δ) * ‖x‖ ^ 2 ≤ ‖A x‖ ^ 2 ∧ ‖A x‖ ^ 2 ≤ (1 + δ) * ‖x‖ ^ 2

/-- **9.3** The Benjamini–Hochberg rejection count. -/
def benjaminiHochbergCount {m : ℕ} (p : Fin m → ℝ) (α : ℝ) : ℕ :=
  ((Finset.range (m + 1)).filter fun k : ℕ ↦
    k ≤ (Finset.univ.filter fun i ↦ p i ≤ (k : ℝ) * α / m).card).sup id

/-- **9.3** For `0 ≤ α` the Benjamini–Hochberg rejection set has exactly `k` elements. -/
theorem card_benjaminiHochberg_rejections {m : ℕ} (p : Fin m → ℝ) {α : ℝ} (hα : 0 ≤ α) :
    (Finset.univ.filter fun i ↦ p i ≤ (benjaminiHochbergCount p α : ℝ) * α / m).card =
      benjaminiHochbergCount p α := sorry

/-- **9.4** The Poisson likelihood for an arbitrary real intensity. -/
def poissonMass (θ : ℝ) (x : ℕ) : ℝ := Real.exp (-θ) * θ ^ x / x.factorial

/-- **9.4** The Metropolis–Hastings acceptance probability. -/
def metropolisAcceptance {ι : Type*} (π : ι → ℝ) (q : ι → ι → ℝ) (x y : ι) : ℝ :=
  if π x * q x y = 0 then 1 else min 1 (π y * q y x / (π x * q x y))

/-- **9.4** The Metropolis–Hastings kernel on a finite discrete state space: move from `x` to
`y ≠ x` with probability `q x y · metropolisAcceptance π q x y`, and stay otherwise. -/
def metropolisKernel {ι : Type*} [Fintype ι] [DecidableEq ι] [MeasurableSpace ι]
    [MeasurableSingletonClass ι] (π : ι → ℝ) (q : ι → ι → ℝ) : Kernel ι ι :=
  Kernel.ofFunOfCountable fun x ↦
    (∑ y ∈ Finset.univ.erase x,
      ENNReal.ofReal (q x y * metropolisAcceptance π q x y) • Measure.dirac y) +
    ENNReal.ofReal (1 - ∑ y ∈ Finset.univ.erase x, q x y * metropolisAcceptance π q x y) •
      Measure.dirac x

/-- **9.4** The finite measure with weights `π`. -/
def weightMeasure {ι : Type*} [Fintype ι] [MeasurableSpace ι] (π : ι → ℝ) : Measure ι :=
  ∑ x, ENNReal.ofReal (π x) • Measure.dirac x

/-- **9.4** Detailed balance of the Metropolis–Hastings kernel, in Mathlib's form. Invariance
then follows from `Kernel.IsReversible.invariant`. -/
theorem isReversible_metropolisKernel {ι : Type*} [Fintype ι] [DecidableEq ι]
    [MeasurableSpace ι] [MeasurableSingletonClass ι] (π : ι → ℝ) (hπ : ∀ x, 0 < π x) (q : ι → ι → ℝ)
    (hq : ∀ x y, 0 ≤ q x y) (hq1 : ∀ x, ∑ y, q x y = 1) :
    (metropolisKernel π q).IsReversible (weightMeasure π) := sorry

/-- **9.4** One leapfrog step with identity mass matrix. -/
def leapfrogStep {d : ℕ} (g : EuclideanSpace ℝ (Fin d) → EuclideanSpace ℝ (Fin d)) (h : ℝ)
    (z : EuclideanSpace ℝ (Fin d) × EuclideanSpace ℝ (Fin d)) :
    EuclideanSpace ℝ (Fin d) × EuclideanSpace ℝ (Fin d) :=
  let p := z.2 - (h / 2) • g z.1
  let x := z.1 + h • p
  (x, p - (h / 2) • g x)

/-- **9.4** Momentum reversal. -/
def momentumFlip {E : Type*} [Neg E] (z : E × E) : E × E := (z.1, -z.2)

/-- **9.4** The leapfrog step is reversible. -/
theorem leapfrogStep_reversible {d : ℕ}
    (g : EuclideanSpace ℝ (Fin d) → EuclideanSpace ℝ (Fin d)) (h : ℝ) :
    momentumFlip ∘ leapfrogStep g h ∘ momentumFlip ∘ leapfrogStep g h = id := sorry

/-- **9.4** For a measurable force field, the leapfrog step preserves Lebesgue measure. -/
theorem measurePreserving_leapfrogStep {d : ℕ}
    (g : EuclideanSpace ℝ (Fin d) → EuclideanSpace ℝ (Fin d)) (hg : Measurable g) (h : ℝ) :
    MeasurePreserving (leapfrogStep g h) volume volume := sorry

/-- **9.4** The posterior of a normal location with known variance. -/
def normalPosterior (prior : ℝ → ℝ) (v : ℝ≥0) (n : ℕ) (m : ℝ) : Measure ℝ :=
  let density := fun θ ↦ prior θ * Real.exp (-(n : ℝ) * (θ - m) ^ 2 / (2 * v))
  (ENNReal.ofReal (∫ θ, density θ))⁻¹ • volume.withDensity (fun θ ↦ ENNReal.ofReal (density θ))

/-- **9.5** The quadratic form of a real matrix on Euclidean space. -/
def matrixQuadraticForm {d : ℕ} (A : Matrix (Fin d) (Fin d) ℝ) (x : EuclideanSpace ℝ (Fin d)) :
    ℝ :=
  inner ℝ x (Matrix.toEuclideanCLM (𝕜 := ℝ) A x)

/-- **9.5** The centred scatter matrix of a finite Euclidean sample. -/
def scatterMatrix {n d : ℕ} (x : Fin n → EuclideanSpace ℝ (Fin d)) : Matrix (Fin d) (Fin d) ℝ :=
  fun j k ↦ ∑ i, (x i j - sampleMean x j) * (x i k - sampleMean x k)

/-- **9.5** The negative Gaussian log-likelihood up to its constant term. -/
def gaussianNegLogLikelihood {n d : ℕ} (x : Fin n → EuclideanSpace ℝ (Fin d))
    (m : EuclideanSpace ℝ (Fin d)) (C : Matrix (Fin d) (Fin d) ℝ) : ℝ :=
  (n : ℝ) / 2 * Real.log C.det + (∑ i, matrixQuadraticForm C⁻¹ (x i - m)) / 2

/-- **9.5** Simple random sampling without replacement. -/
def simpleRandomSampleDesign (N n : ℕ) : Measure (Finset (Fin N)) :=
  (Nat.choose N n : ℝ≥0∞)⁻¹ • Measure.count.restrict {s | s.card = n}

/-- **9.5** The finite-population mean. -/
def populationMean {N : ℕ} (y : Fin N → ℝ) : ℝ := (∑ i, y i) / N

/-- **9.5** The finite-population variance with divisor `N - 1`. -/
def populationVariance {N : ℕ} (y : Fin N → ℝ) : ℝ :=
  (∑ i, (y i - populationMean y) ^ 2) / (N - 1 : ℕ)

/-- **9.5** The variance of the sample mean under simple random sampling. -/
theorem variance_sampleMean_simpleRandomSampleDesign {N n : ℕ} (hN : 2 ≤ N) (hn : 1 ≤ n)
    (hnN : n ≤ N) (y : Fin N → ℝ) :
    Var[fun s : Finset (Fin N) ↦ (∑ i ∈ s, y i) / n; simpleRandomSampleDesign N n] =
      (1 - (n : ℝ) / N) * populationVariance y / n := sorry

/-- **9.5** A Latin square of order `s`. -/
def IsLatinSquare {s : ℕ} (L : Fin s → Fin s → Fin s) : Prop :=
  (∀ i, Function.Bijective (L i)) ∧ ∀ j, Function.Bijective (fun i ↦ L i j)

/-- **9.5** Orthogonal Latin squares. -/
def OrthogonalLatinSquares {s : ℕ} (L M : Fin s → Fin s → Fin s) : Prop :=
  Function.Injective (fun z : Fin s × Fin s ↦ (L z.1 z.2, M z.1 z.2))

/-- **9.6** Weak stationarity of a sequence in an inner product space. -/
def IsWeaklyStationary (𝕜 : Type*) {H : Type*} [RCLike 𝕜] [NormedAddCommGroup H]
    [InnerProductSpace 𝕜 H] (X : ℤ → H) : Prop :=
  ∀ s t, inner 𝕜 (X s) (X t) = inner 𝕜 (X 0) (X (t - s))

/-- **9.6** Centred i.i.d. noise on `ℤ` with variance `σ² > 0`. -/
structure IsIIDNoise {Ω : Type*} [MeasurableSpace Ω] (μ : Measure Ω) [IsProbabilityMeasure μ]
    (Z : ℤ → Ω → ℝ) (σsq : ℝ) : Prop where
  /-- The noise is i.i.d. with the law of `Z 0`. -/
  iid : IsIndependentIdenticallyDistributed μ Z (μ.map (Z 0))
  /-- The noise is integrable. -/
  integrable : Integrable (Z 0) μ
  /-- The noise is centred. -/
  integral_eq_zero : ∫ ω, Z 0 ω ∂μ = 0
  /-- The noise has second moment `σ²`. -/
  integral_sq : ∫ ω, Z 0 ω ^ 2 ∂μ = σsq
  /-- The variance is positive. -/
  pos : 0 < σsq

/-- **9.6** The sample autocovariance at lag `h`, with divisor `n`. -/
def sampleAutocovariance {Ω : Type*} (X : ℕ → Ω → ℝ) (lag n : ℕ) (ω : Ω) : ℝ :=
  (∑ i ∈ Finset.range (n - lag),
    (X (i + lag) ω - sampleAverage X n ω) * (X i ω - sampleAverage X n ω)) / n

/-- **9.6** The number of subjects whose observed time is at least `s`. -/
def atRiskCount {Ω : Type*} (T C : ℕ → Ω → ℝ) (n : ℕ) (ω : Ω) (s : ℝ) : ℕ :=
  ((Finset.range n).filter fun i ↦ s ≤ min (T i ω) (C i ω)).card

/-- **9.6** The number of observed failures at time exactly `s`. -/
def failureCount {Ω : Type*} (T C : ℕ → Ω → ℝ) (n : ℕ) (ω : Ω) (s : ℝ) : ℕ :=
  ((Finset.range n).filter fun i ↦ T i ω ≤ C i ω ∧ T i ω = s).card

/-- **9.6** The distinct observed failure times up to `t`. -/
def observedFailureTimes {Ω : Type*} (T C : ℕ → Ω → ℝ) (n : ℕ) (ω : Ω) (t : ℝ) : Finset ℝ :=
  ((Finset.range n).filter fun i ↦ T i ω ≤ C i ω ∧ T i ω ≤ t).image fun i ↦ T i ω

/-- **9.6** The Nelson–Aalen estimator of the cumulative hazard. -/
def nelsonAalenEstimator {Ω : Type*} (T C : ℕ → Ω → ℝ) (n : ℕ) (ω : Ω) (t : ℝ) : ℝ :=
  ∑ s ∈ observedFailureTimes T C n ω t,
    (failureCount T C n ω s : ℝ) / atRiskCount T C n ω s

/-- **9.6** The Kaplan–Meier estimator of the survival function, one factor per distinct observed
failure time. -/
def kaplanMeierEstimator {Ω : Type*} (T C : ℕ → Ω → ℝ) (n : ℕ) (ω : Ω) (t : ℝ) : ℝ :=
  ∏ s ∈ observedFailureTimes T C n ω t,
    (1 - (failureCount T C n ω s : ℝ) / atRiskCount T C n ω s)

/-- **9.6** Without tied failures, Kaplan–Meier is the product over observed failures. -/
theorem kaplanMeierEstimator_eq_prod_subject {Ω : Type*} (T C : ℕ → Ω → ℝ) (n : ℕ) (ω : Ω)
    (t : ℝ) (hdistinct : Set.InjOn (fun i ↦ T i ω) {i | i < n ∧ T i ω ≤ C i ω}) :
    kaplanMeierEstimator T C n ω t = ∏ i ∈ Finset.range n,
      if T i ω ≤ C i ω ∧ T i ω ≤ t then 1 - (atRiskCount T C n ω (T i ω) : ℝ)⁻¹ else 1 := sorry

/-- **9.6** Kaplan–Meier is bounded by the exponential of minus Nelson–Aalen. -/
theorem kaplanMeierEstimator_le_exp_neg_nelsonAalen {Ω : Type*} (T C : ℕ → Ω → ℝ) (n : ℕ)
    (ω : Ω) (t : ℝ) :
    kaplanMeierEstimator T C n ω t ≤ Real.exp (-nelsonAalenEstimator T C n ω t) := sorry

end Layer9

/-! ### Layer 4, continued: optimality of U-statistics -/

/-- **4.2** In the `n`-sample model over a complete family closed under binary mixtures, a
square-integrable U-statistic is UMVU for its mean. -/
theorem isMinimumVarianceUnbiasedEstimator_uStatistic {X : Type*} [MeasurableSpace X]
    {C : Set (ProbabilityMeasure X)}
    (hc : ∀ f : X → ℝ, Measurable f →
      (∀ P ∈ C, Integrable f (P : Measure X) ∧ ∫ x, f x ∂(P : Measure X) = 0) →
      ∀ P ∈ C, ∀ᵐ x ∂(P : Measure X), f x = 0)
    (hconv : ∀ P ∈ C, ∀ Q ∈ C, ∀ a : ℝ≥0, a ≤ 1 →
      ∃ R ∈ C, (R : Measure X) = (a : ℝ≥0∞) • (P : Measure X) +
        ((1 - a : ℝ≥0) : ℝ≥0∞) • (Q : Measure X))
    {m n : ℕ} (hmn : m ≤ n) (h : (Fin m → X) → ℝ) (hh : Measurable h)
    (hint : ∀ P ∈ C, Integrable h (Measure.pi fun _ : Fin m ↦ (P : Measure X)))
    (h2 : ∀ P ∈ C, MemLp (uStatistic m n h) 2 (Measure.pi fun _ : Fin n ↦ (P : Measure X))) :
    IsMinimumVarianceUnbiasedEstimator (fun P : C ↦ Measure.pi fun _ : Fin n ↦ (P.val : Measure X))
      (uStatistic m n h) (fun P ↦ ∫ x, h x ∂(Measure.pi fun _ : Fin m ↦ (P.val : Measure X))) :=
  sorry

#check @ProbabilityTheory.IsBayesEstimator
#check @ProbabilityTheory.bayesRisk
#check @MeasureTheory.tvDist
#check @MeasureTheory.Measure.quantile
#check @TauCeti.Probability.multivariateGaussianPDFReal
#check @Sion.exists_isSaddlePointOn
#check @ProbabilityTheory.tendstoInDistribution_inv_sqrt_mul_sum_sub

end TauCeti
