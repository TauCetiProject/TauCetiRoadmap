module

public import Mathlib
public import TauCeti.Data.Fin.Tuple.OrderStatistic
public import TauCeti.Probability.Quantile
public import TauCeti.Probability.Distributions.ChiSquared.Basic
public import TauCeti.Probability.Distributions.StudentT.Basic
public import TauCeti.Probability.Distributions.FisherSnedecor.Basic
public import TauCeti.Probability.Distributions.Gaussian.Density
public import TauCeti.Probability.Process.EmpiricalMeasure
public import TauCeti.MeasureTheory.Measure.TotalVariation

/-!
# Foundations of mathematical statistics: target signatures

This file is not the roadmap: the roadmap is `README.md`, and this file is not an exhaustive
checklist. It states the headline theorems of Layers 1–8 against the pinned Mathlib and Tau
Ceti, each with `sorry`, together with the definitions their statements need. Every headline of
the README (the targets in bold) is stated here. Layer 9 has no headline theorems: its objects
and their elementary theory are specified in the README.

The conventions of the README are used throughout: a parametric family is `P : Θ → Measure X`
with probability instances, a randomized rule is a Markov kernel, a test is a measurable
`[0, 1]`-valued function, and convergence in probability and in law are Mathlib's
`TendstoInMeasure` and `TendstoInDistribution`. The implementation namespace of the README is
`TauCeti`; the prototypes live in this roadmap's namespace.
-/

@[expose] public section

noncomputable section

open MeasureTheory ProbabilityTheory Filter Set Topology
open scoped ENNReal NNReal

namespace TauCetiRoadmap.MathematicalStatisticsFoundations

attribute [local instance] Classical.propDecidable

/-! ## Layer 1: experiments, densities and tests -/

section Layer1

variable {Θ X S : Type*} [MeasurableSpace X]

/-- **1.1** `f` is a real density of `P` with respect to `μ`. -/
def HasDensity (P μ : Measure X) (f : X → ℝ) : Prop :=
  Measurable f ∧ (∀ᵐ x ∂μ, 0 ≤ f x) ∧ P = μ.withDensity (fun x ↦ ENNReal.ofReal (f x))

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

/-- **1.5** The risk of a randomized rule for a real loss. -/
def risk {A : Type*} [MeasurableSpace A] (P : Θ → Measure X) (L : Θ → A → ℝ) (κ : Kernel X A)
    (θ : Θ) : ℝ :=
  ∫ a, L θ a ∂(κ ∘ₘ P θ)

/-- **1.5** `Q` is a garbling of `P`. -/
def IsGarbling {Y : Type*} [MeasurableSpace Y] (P : Θ → Measure X) (Q : Θ → Measure Y) : Prop :=
  ∃ K : Kernel X Y, IsMarkovKernel K ∧ ∀ θ, Q θ = K ∘ₘ P θ

end Layer1

/-! ## Layer 2: sufficiency and completeness -/

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

/-- **2.4** The U-statistic of order `m` with kernel `h`: the average of `h (x ∘ f)` over the
injections `f : Fin m → Fin n`. -/
def uStatistic {E : Type*} (m n : ℕ) (h : (Fin m → E) → ℝ) (x : Fin n → E) : ℝ :=
  ((n.descFactorial m : ℕ) : ℝ)⁻¹ *
    ∑ f ∈ (Finset.univ : Finset (Fin m → Fin n)).filter Function.Injective, h (x ∘ f)

end Layer2

/-! ## Layer 3: natural exponential families -/

section Layer3

variable {X E : Type*} [MeasurableSpace X] [NormedAddCommGroup E] [InnerProductSpace ℝ E]

/-- **3.1** The natural parameter space. -/
def naturalParameterSpace (ν : Measure X) (T : X → E) : Set E :=
  {η | Integrable (fun x ↦ Real.exp (inner ℝ η (T x))) ν}

/-- **3.1** The log partition function. -/
def logPartition (ν : Measure X) (T : X → E) (η : E) : ℝ :=
  Real.log (∫ x, Real.exp (inner ℝ η (T x)) ∂ν)

/-- **3.1** The law of the natural exponential family at `η`: Mathlib's exponential tilt of `ν`
by `⟪η, T⟫`. -/
def exponentialFamilyMeasure (ν : Measure X) (T : X → E) (η : E) : Measure X :=
  ν.tilted fun x ↦ inner ℝ η (T x)

/-- **3.1** Minimality: no nonzero linear functional of `T` is a.e. constant. -/
def IsMinimalExponentialFamily (ν : Measure X) (T : X → E) : Prop :=
  ∀ u : E, u ≠ 0 → ∀ c : ℝ, ¬ ∀ᵐ x ∂ν, inner ℝ u (T x) = c

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

/-- **3.4** Completeness of the natural statistic. -/
theorem isCompleteStatistic_withDensity_exp_inner {X : Type*} [MeasurableSpace X] {d : ℕ}
    (ν : Measure X) (T : X → EuclideanSpace ℝ (Fin d)) (hT : Measurable T)
    (U : Set (EuclideanSpace ℝ (Fin d))) (hU : IsOpen U) (hne : U.Nonempty)
    (Z : EuclideanSpace ℝ (Fin d) → ℝ)
    (hZ : ∀ η ∈ U, Integrable (fun x ↦ Real.exp (inner ℝ η (T x))) ν ∧
      Z η = ∫ x, Real.exp (inner ℝ η (T x)) ∂ν ∧ 0 < Z η) :
    IsCompleteStatistic (fun η : U ↦ ν.withDensity
      (fun x ↦ ENNReal.ofReal (Real.exp (inner ℝ η.val (T x)) / Z η.val))) T := sorry


/-- **3.7** The fibrewise normalized exponential tilt of a kernel. -/
def conditionalExponentialKernel {E F : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
    [MeasurableSpace E] [MeasurableSpace F] (κ : Kernel F E) [IsSFiniteKernel κ] (η : E) :
    Kernel F E :=
  κ.withDensity fun s t ↦ ENNReal.ofReal
    (Real.exp (inner ℝ η t - Real.log (∫ t', Real.exp (inner ℝ η t') ∂κ s)))

/-- **3.7** Conditional exponential families: one parameter-free kernel `κ` such that, at every
natural parameter `(η, ζ)` of the family with statistic `(T, S)`, the conditional law of `T` given
`S` is the normalized tilt of `κ` by `η` alone. -/
theorem exists_kernel_conditional_exponential_family {X E F : Type*} [MeasurableSpace X]
    [NormedAddCommGroup E] [InnerProductSpace ℝ E] [FiniteDimensional ℝ E] [MeasurableSpace E]
    [BorelSpace E] [NormedAddCommGroup F] [InnerProductSpace ℝ F] [FiniteDimensional ℝ F]
    [MeasurableSpace F] [BorelSpace F] (ν : Measure X) [SigmaFinite ν] (T : X → E) (S : X → F)
    (hT : Measurable T) (hS : Measurable S) :
    ∃ (κ : Kernel F E) (_ : IsSFiniteKernel κ),
      ∀ p ∈ naturalParameterSpace ν (fun x ↦ WithLp.toLp 2 (T x, S x)),
        let P := exponentialFamilyMeasure ν (fun x ↦ WithLp.toLp 2 (T x, S x)) p
        P.map (fun x ↦ (S x, T x)) = P.map S ⊗ₘ conditionalExponentialKernel κ (WithLp.ofLp p).1 :=
  sorry

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

/-! ## Layer 4: unbiased estimation and information -/

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

/-- **4.2** Lehmann–Scheffé, uniqueness: unbiased functions of a complete statistic agree. -/
theorem ae_eq_of_isCompleteStatistic_of_isUnbiasedEstimator (P : Θ → Measure X) (T : X → S)
    (hc : IsCompleteStatistic P T) (r r' : S → ℝ) (hr : Measurable r) (hr' : Measurable r')
    (g : Θ → ℝ) (hu : IsUnbiasedEstimator P (r ∘ T) g) (hu' : IsUnbiasedEstimator P (r' ∘ T) g)
    (θ : Θ) : r ∘ T =ᵐ[P θ] r' ∘ T := sorry

/-- **4.2** Lehmann–Scheffé, optimality. -/
theorem isMinimumVarianceUnbiasedEstimator_of_isCompleteStatistic (P : Θ → Measure X)
    [∀ θ, IsProbabilityMeasure (P θ)] (T : X → S) (hs : IsSufficientStatistic P T)
    (hc : IsCompleteStatistic P T) (r : S → ℝ) (hr : Measurable r) (g : Θ → ℝ)
    (hu : IsUnbiasedEstimator P (r ∘ T) g) (h2 : ∀ θ, MemLp (r ∘ T) 2 (P θ)) :
    IsMinimumVarianceUnbiasedEstimator P (r ∘ T) g := sorry

/-- **4.2** In the `n`-sample model over a complete family closed under binary mixtures, a
square-integrable U-statistic is UMVU for its mean. -/
theorem isMinimumVarianceUnbiasedEstimator_uStatistic {C : Set (ProbabilityMeasure X)}
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

/-- **4.3** The score of a real-parameter likelihood. -/
def likelihoodScore (f : ℝ → X → ℝ) (θ : ℝ) (x : X) : ℝ :=
  deriv (fun t ↦ Real.log (f t x)) θ

/-- **4.3** The Fisher information. -/
def fisherInformation (P : ℝ → Measure X) (f : ℝ → X → ℝ) (θ : ℝ) : ℝ :=
  ∫ x, likelihoodScore f θ x ^ 2 ∂P θ

/-- **4.3** The information inequality for a regular real-parameter model: the integrals
`∫ f_t dμ` and `∫ W f_t dμ` are differentiated under the integral sign at `θ`. -/
theorem sq_deriv_le_variance_mul_fisherInformation (P : ℝ → Measure X)
    [∀ θ, IsProbabilityMeasure (P θ)] (μ : Measure X) (f : ℝ → X → ℝ)
    (hf : ∀ θ, HasDensity (P θ) μ (f θ)) (hpos : ∀ θ x, 0 < f θ x) (W : X → ℝ) (θ : ℝ)
    (hW : MemLp W 2 (P θ)) (hd : ∀ x, DifferentiableAt ℝ (fun t ↦ f t x) θ)
    (h1 : HasDerivAt (fun t ↦ ∫ x, f t x ∂μ) (∫ x, deriv (fun t ↦ f t x) θ ∂μ) θ)
    (hW' : HasDerivAt (fun t ↦ ∫ x, W x * f t x ∂μ) (∫ x, W x * deriv (fun t ↦ f t x) θ ∂μ) θ)
    (hI : 0 < fisherInformation P f θ) :
    deriv (fun t ↦ ∫ x, W x ∂P t) θ ^ 2 ≤ Var[W; P θ] * fisherInformation P f θ := sorry

/-- **4.4** Stein's identity for `N(θ, v I)`. -/
theorem gaussian_integration_by_parts {p : ℕ} (θ : EuclideanSpace ℝ (Fin p)) (v : ℝ) (hv : 0 < v)
    (g : EuclideanSpace ℝ (Fin p) → EuclideanSpace ℝ (Fin p)) (hg : ContDiff ℝ 1 g)
    (hg2 : MemLp g 2 (multivariateGaussian θ (v • (1 : Matrix (Fin p) (Fin p) ℝ))))
    (hdi : ∀ i, Integrable (fun x ↦ fderiv ℝ g x (EuclideanSpace.single i 1) i)
      (multivariateGaussian θ (v • (1 : Matrix (Fin p) (Fin p) ℝ)))) (i : Fin p) :
    ∫ x, (x i - θ i) * g x i ∂multivariateGaussian θ (v • (1 : Matrix (Fin p) (Fin p) ℝ)) =
      v * ∫ x, fderiv ℝ g x (EuclideanSpace.single i 1) i
        ∂multivariateGaussian θ (v • (1 : Matrix (Fin p) (Fin p) ℝ)) := sorry

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

/-- **4.5** Optimality of the Pitman estimator among location-equivariant estimators, at
`θ = 0`; equivariant estimators have constant risk. -/
theorem pitmanEstimator_minimum_equivariant_risk {n : ℕ} (P : Measure ℝ) [IsProbabilityMeasure P]
    (f : ℝ → ℝ) (hf : HasDensity P volume f)
    (hgood : ∀ᵐ x ∂(Measure.pi fun _ : Fin n ↦ P),
      Integrable (fun u ↦ u * ∏ i, f (x i - u)) ∧ Integrable (fun u ↦ ∏ i, f (x i - u)) ∧
        0 < ∫ u, ∏ i, f (x i - u))
    (δ : (Fin n → ℝ) → ℝ) (hδ : Measurable δ) (heq : IsLocationEquivariant δ)
    (h2 : MemLp δ 2 (Measure.pi fun _ : Fin n ↦ P)) :
    MemLp (pitmanEstimator f) 2 (Measure.pi fun _ : Fin n ↦ P) ∧
      ∫ x, pitmanEstimator f x ^ 2 ∂(Measure.pi fun _ : Fin n ↦ P) ≤
        ∫ x, δ x ^ 2 ∂(Measure.pi fun _ : Fin n ↦ P) := sorry

end Layer4

/-! ## Layer 5: order statistics and Gaussian samples -/

/-- **5.1** The law of the ranks: for an atomless law, the sorting permutation is uniform on the
`n!` permutations and independent of the vector of order statistics. -/
theorem map_sort_eq_and_indepFun_orderStatistics {n : ℕ} (P : Measure ℝ) [IsProbabilityMeasure P]
    (hP : ∀ t, P {t} = 0) (σ : Equiv.Perm (Fin n)) (B : Set (Fin n → ℝ)) (hB : MeasurableSet B) :
    (Measure.pi fun _ : Fin n ↦ P).real
        ({x | Tuple.sort x = σ} ∩ (fun x i ↦ TauCeti.orderStatistic i x) ⁻¹' B) =
      ((n.factorial : ℝ))⁻¹ *
        (Measure.pi fun _ : Fin n ↦ P).real ((fun x i ↦ TauCeti.orderStatistic i x) ⁻¹' B) :=
  sorry

/-- **5.2** Sample mean and residual sum of squares of a Gaussian sample with variance `v > 0`. -/
theorem gaussian_sample_mean_residual_laws (n : ℕ) (hn : 2 ≤ n) (m : ℝ) (v : ℝ≥0) (hv : 0 < v) :
    let P := Measure.pi (fun _ : Fin n ↦ gaussianReal m v)
    let mean := fun x : Fin n → ℝ ↦ (∑ i, x i) / n
    let ss := fun x : Fin n → ℝ ↦ ∑ i, (x i - mean x) ^ 2
    P.map (fun x ↦ ss x / v) = TauCeti.Probability.chiSquaredMeasure (n - 1 : ℕ) ∧
      IndepFun mean ss P ∧
      P.map (fun x ↦ Real.sqrt n * (mean x - m) / Real.sqrt (ss x / (n - 1 : ℕ))) =
        TauCeti.Probability.studentTMeasure (n - 1 : ℕ) := sorry

/-! ## Layer 6: tests -/

section Layer6

variable {Θ X S : Type*} [MeasurableSpace X]

/-- **6.2** The Neyman–Pearson lemma: existence and optimality at exact size `α`. -/
theorem exists_neyman_pearson_test (P₀ P₁ μ : Measure X) [IsProbabilityMeasure P₀]
    [IsProbabilityMeasure P₁] (f₀ f₁ : X → ℝ) (h₀ : HasDensity P₀ μ f₀) (h₁ : HasDensity P₁ μ f₁)
    (α : ℝ) (hα : α ∈ Ioo 0 1) :
    ∃ k : ℝ, 0 ≤ k ∧ ∃ φ : X → ℝ, IsStatisticalTest φ ∧ ∫ x, φ x ∂P₀ = α ∧
      (∀ᵐ x ∂μ, (k * f₀ x < f₁ x → φ x = 1) ∧ (f₁ x < k * f₀ x → φ x = 0)) ∧
      ∀ ψ, IsStatisticalTest ψ → ∫ x, ψ x ∂P₀ ≤ α → ∫ x, ψ x ∂P₁ ≤ ∫ x, φ x ∂P₁ := sorry

/-- **6.2** The Neyman–Pearson lemma, necessity: a most powerful level-`α` test agrees with the
Neyman–Pearson test off `{f₁ = k f₀}`, and has size `α` unless its power is `1`. -/
theorem ae_eq_of_most_powerful (P₀ P₁ μ : Measure X) [IsProbabilityMeasure P₀]
    [IsProbabilityMeasure P₁] (f₀ f₁ : X → ℝ) (h₀ : HasDensity P₀ μ f₀) (h₁ : HasDensity P₁ μ f₁)
    (α : ℝ) (hα : α ∈ Ioo 0 1) (k : ℝ) (hk : 0 ≤ k) (φ : X → ℝ) (hφ : IsStatisticalTest φ)
    (hsize : ∫ x, φ x ∂P₀ = α)
    (hnp : ∀ᵐ x ∂μ, (k * f₀ x < f₁ x → φ x = 1) ∧ (f₁ x < k * f₀ x → φ x = 0))
    (ψ : X → ℝ) (hψ : IsStatisticalTest ψ) (hψα : ∫ x, ψ x ∂P₀ ≤ α)
    (hmp : ∫ x, φ x ∂P₁ ≤ ∫ x, ψ x ∂P₁) :
    (∀ᵐ x ∂μ, f₁ x ≠ k * f₀ x → ψ x = φ x) ∧ (∫ x, ψ x ∂P₁ < 1 → ∫ x, ψ x ∂P₀ = α) := sorry

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

/-- **6.3** The Karlin–Rubin theorem: the threshold test is UMP for the one-sided problem, and
its power function is nondecreasing. -/
theorem isUniformlyMostPowerfulTest_of_monotone_likelihood_ratio (P : ℝ → Measure X)
    (μ : Measure X) [∀ θ, IsProbabilityMeasure (P θ)] (f : ℝ → X → ℝ)
    (hf : ∀ θ, HasDensity (P θ) μ (f θ)) (hpos : ∀ θ x, 0 < f θ x) (T : X → ℝ)
    (hT : Measurable T)
    (hmlr : ∀ a b, a < b → ∃ r : ℝ → ℝ, Monotone r ∧ ∀ x, f b x / f a x = r (T x))
    (θ₀ c γ α : ℝ) (hγ : γ ∈ Icc 0 1) (hsize : ∫ x, thresholdTest T c γ x ∂P θ₀ = α) :
    IsUniformlyMostPowerfulTest P (Iic θ₀) (Ioi θ₀) α (thresholdTest T c γ) ∧
      Monotone (testPower P (thresholdTest T c γ)) := sorry

/-- **6.3** Essential completeness of the one-sided threshold tests: for a loss of rejecting
minus accepting `L θ`, positive below `θ₀` and negative above, every test is matched at every
parameter by a threshold test in `T`, with a threshold in `EReal`. -/
theorem exists_one_sided_test_risk_le (P : ℝ → Measure X) (μ : Measure X)
    [∀ θ, IsProbabilityMeasure (P θ)] (f : ℝ → X → ℝ) (hf : ∀ θ, HasDensity (P θ) μ (f θ))
    (hpos : ∀ θ x, 0 < f θ x) (T : X → ℝ) (hT : Measurable T)
    (hmlr : ∀ a b, a < b → ∃ r : ℝ → ℝ, Monotone r ∧ ∀ x, f b x / f a x = r (T x))
    (θ₀ : ℝ) (L : ℝ → ℝ) (hLlt : ∀ θ < θ₀, 0 < L θ) (hLgt : ∀ θ > θ₀, L θ < 0)
    (ψ : X → ℝ) (hψ : IsStatisticalTest ψ) :
    ∃ c : EReal, ∃ γ ∈ Icc (0 : ℝ) 1, ∀ θ,
      L θ * testPower P (thresholdTest (fun x ↦ (T x : EReal)) c γ) θ ≤ L θ * testPower P ψ θ :=
  sorry

/-- **6.4** Least favorable mixtures, sufficiency: a level-`α` test that is most powerful for
the mixture `P ∘ₘ Λ` of a prior `Λ` carried by the null set is most powerful for the composite
null. -/
theorem most_powerful_of_mixture_null [MeasurableSpace Θ] (P : Kernel Θ X) [IsMarkovKernel P]
    (H₀ : Set Θ) (hH₀ : MeasurableSet H₀) (Λ : Measure Θ) [IsProbabilityMeasure Λ]
    (hΛ : Λ H₀ᶜ = 0) (Q : Measure X) [IsProbabilityMeasure Q] (α : ℝ) (φ : X → ℝ)
    (hφ : HasTestLevel (fun θ ↦ P θ) H₀ α φ)
    (hmp : ∀ ψ, IsStatisticalTest ψ → ∫ x, ψ x ∂(P ∘ₘ Λ) ≤ α → ∫ x, ψ x ∂Q ≤ ∫ x, φ x ∂Q) :
    ∀ ψ, HasTestLevel (fun θ ↦ P θ) H₀ α ψ → ∫ x, ψ x ∂Q ≤ ∫ x, φ x ∂Q := sorry

/-- **6.4** Least favorable mixtures, concentration: if moreover `φ` has size `α` under the
mixture, its power is `α` for `Λ`-almost every parameter, and `Λ` is least favorable among the
priors carried by the null set. -/
theorem ae_testPower_eq_of_most_powerful_mixture [MeasurableSpace Θ] (P : Kernel Θ X)
    [IsMarkovKernel P] (H₀ : Set Θ) (hH₀ : MeasurableSet H₀) (Λ : Measure Θ)
    [IsProbabilityMeasure Λ] (hΛ : Λ H₀ᶜ = 0) (Q : Measure X) [IsProbabilityMeasure Q] (α : ℝ)
    (φ : X → ℝ) (hφ : HasTestLevel (fun θ ↦ P θ) H₀ α φ)
    (hmp : ∀ ψ, IsStatisticalTest ψ → ∫ x, ψ x ∂(P ∘ₘ Λ) ≤ α → ∫ x, ψ x ∂Q ≤ ∫ x, φ x ∂Q)
    (hsize : ∫ x, φ x ∂(P ∘ₘ Λ) = α) :
    (∀ᵐ θ ∂Λ, testPower (fun θ ↦ P θ) φ θ = α) ∧
      ∀ Λ' : ProbabilityMeasure Θ, (Λ' : Measure Θ) H₀ᶜ = 0 → ∀ φ', IsStatisticalTest φ' →
        ∫ x, φ' x ∂(P ∘ₘ (Λ' : Measure Θ)) ≤ α →
        (∀ ψ, IsStatisticalTest ψ → ∫ x, ψ x ∂(P ∘ₘ (Λ' : Measure Θ)) ≤ α →
          ∫ x, ψ x ∂Q ≤ ∫ x, φ' x ∂Q) →
        ∫ x, φ x ∂Q ≤ ∫ x, φ' x ∂Q := sorry

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

/-- **6.6** The two-sided UMPU test in a one-parameter family: the test rejecting outside
`[c₁, c₂]`, of size `α` at `η₀` and with `E[T φ] = α E[T]` there. -/
theorem isUniformlyMostPowerfulUnbiasedTest_of_two_tail_moment_constraints (ν : Measure X)
    (T : X → ℝ) (hT : Measurable T) (hnc : ∀ c : ℝ, ¬ ∀ᵐ x ∂ν, T x = c) (U : Set ℝ)
    (hU : IsOpen U) (hUc : Convex ℝ U) (hUN : U ⊆ naturalParameterSpace ν T) (η₀ : U) (α : ℝ)
    (hα : α ∈ Ioo 0 1) (c₁ c₂ γ₁ γ₂ : ℝ) (hc : c₁ ≤ c₂) (hγ₁ : γ₁ ∈ Icc 0 1)
    (hγ₂ : γ₂ ∈ Icc 0 1) :
    let P := fun η : U ↦ exponentialFamilyMeasure ν T η.val
    let φ := fun x ↦ if T x < c₁ ∨ c₂ < T x then (1 : ℝ) else if T x = c₁ then γ₁
      else if T x = c₂ then γ₂ else 0
    testPower P φ η₀ = α → ∫ x, T x * φ x ∂P η₀ = α * ∫ x, T x ∂P η₀ →
      IsUniformlyMostPowerfulUnbiasedTest P {η₀} {η | η ≠ η₀} α φ := sorry

/-- **6.6** Similar tests have Neyman structure. -/
theorem condExp_eq_const_of_isSimilarTest [MeasurableSpace S] (P : Θ → Measure X)
    [∀ θ, IsProbabilityMeasure (P θ)] (T : X → S) (hs : IsSufficientStatistic P T)
    (hc : IsBoundedlyCompleteStatistic P T) (φ : X → ℝ) (α : ℝ)
    (hsim : IsSimilarTest P univ α φ) (θ : Θ) :
    (P θ)[φ | (inferInstance : MeasurableSpace S).comap T] =ᵐ[P θ] fun _ ↦ α := sorry

/-- **6.7** The conditional two-sided UMPU test of `η = η₀` with a nuisance statistic `S`. -/
theorem isUniformlyMostPowerfulUnbiasedTest_conditional_two_sided {l : ℕ} (ν : Measure X)
    (T : X → ℝ) (S : X → EuclideanSpace ℝ (Fin l)) (hT : Measurable T) (hS : Measurable S)
    (hmin : IsMinimalExponentialFamily ν (fun x ↦ WithLp.toLp 2 (T x, S x)))
    (U : Set (WithLp 2 (ℝ × EuclideanSpace ℝ (Fin l)))) (hU : IsOpen U) (hUc : Convex ℝ U)
    (hUN : U ⊆ naturalParameterSpace ν (fun x ↦ WithLp.toLp 2 (T x, S x))) (η₀ : ℝ)
    (p₀ : U) (hp₀ : (WithLp.ofLp p₀.val).1 = η₀) (α : ℝ) (hα : α ∈ Ioo 0 1)
    (c₁ c₂ γ₁ γ₂ : EuclideanSpace ℝ (Fin l) → ℝ) (hc₁ : Measurable c₁) (hc₂ : Measurable c₂)
    (hγ₁ : Measurable γ₁) (hγ₂ : Measurable γ₂) (hc : ∀ s, c₁ s ≤ c₂ s)
    (hγ : ∀ s, γ₁ s ∈ Icc 0 1 ∧ γ₂ s ∈ Icc 0 1) :
    let P := fun p : U ↦ exponentialFamilyMeasure ν (fun x ↦ WithLp.toLp 2 (T x, S x)) p.val
    let φ := fun x ↦ if T x < c₁ (S x) ∨ c₂ (S x) < T x then (1 : ℝ)
      else if T x = c₁ (S x) then γ₁ (S x) else if T x = c₂ (S x) then γ₂ (S x) else 0
    (P p₀)[φ | MeasurableSpace.comap S inferInstance] =ᵐ[P p₀] (fun _ ↦ α) →
    (P p₀)[fun x ↦ T x * φ x | MeasurableSpace.comap S inferInstance] =ᵐ[P p₀]
      (fun x ↦ α * (P p₀)[T | MeasurableSpace.comap S inferInstance] x) →
      IsUniformlyMostPowerfulUnbiasedTest P {p | (WithLp.ofLp p.val).1 = η₀}
        {p | (WithLp.ofLp p.val).1 ≠ η₀} α φ := sorry

/-- **6.7** The conditional one-sided UMPU test of `η ≤ η₀` with a nuisance statistic `S`. -/
theorem isUniformlyMostPowerfulUnbiasedTest_conditional_one_sided {l : ℕ} (ν : Measure X)
    (T : X → ℝ) (S : X → EuclideanSpace ℝ (Fin l)) (hT : Measurable T) (hS : Measurable S)
    (hmin : IsMinimalExponentialFamily ν (fun x ↦ WithLp.toLp 2 (T x, S x)))
    (U : Set (WithLp 2 (ℝ × EuclideanSpace ℝ (Fin l)))) (hU : IsOpen U) (hUc : Convex ℝ U)
    (hUN : U ⊆ naturalParameterSpace ν (fun x ↦ WithLp.toLp 2 (T x, S x))) (η₀ : ℝ)
    (p₀ : U) (hp₀ : (WithLp.ofLp p₀.val).1 = η₀) (α : ℝ) (hα : α ∈ Ioo 0 1)
    (c γ : EuclideanSpace ℝ (Fin l) → ℝ) (hc : Measurable c) (hγm : Measurable γ)
    (hγ : ∀ s, γ s ∈ Icc 0 1) :
    let P := fun p : U ↦ exponentialFamilyMeasure ν (fun x ↦ WithLp.toLp 2 (T x, S x)) p.val
    let φ := fun x ↦ if c (S x) < T x then (1 : ℝ) else if T x = c (S x) then γ (S x) else 0
    (P p₀)[φ | MeasurableSpace.comap S inferInstance] =ᵐ[P p₀] (fun _ ↦ α) →
      IsUniformlyMostPowerfulUnbiasedTest P {p | (WithLp.ofLp p.val).1 ≤ η₀}
        {p | η₀ < (WithLp.ofLp p.val).1} α φ := sorry

end Layer6

/-! ## Layer 7: decision theory -/

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

/-- **7.3** Averaging over a finite group: in an invariant problem with a bounded measurable
invariant loss, every randomized rule has an equivariant rule whose risk at `θ` is the average of
its risks over the orbit of `θ`. -/
theorem exists_equivariant_rule_risk_eq_average {G X A : Type*} [Group G] [Fintype G]
    [MeasurableSpace X] [MeasurableSpace A] [MulAction G Θ] [MulAction G X] [MulAction G A]
    (hX : ∀ g : G, Measurable fun x : X ↦ g • x) (hA : ∀ g : G, Measurable fun a : A ↦ g • a)
    (P : Θ → Measure X) [∀ θ, IsProbabilityMeasure (P θ)]
    (hP : ∀ (g : G) θ, P (g • θ) = (P θ).map fun x ↦ g • x) (L : Θ → A → ℝ)
    (hLm : ∀ θ, Measurable (L θ)) (hLb : ∃ C, ∀ θ a, |L θ a| ≤ C)
    (hLinv : ∀ (g : G) θ a, L (g • θ) (g • a) = L θ a) (κ : Kernel X A) [IsMarkovKernel κ] :
    ∃ κ' : Kernel X A, IsMarkovKernel κ' ∧
      (∀ (g : G) x, κ' (g • x) = (κ' x).map fun a ↦ g • a) ∧
      ∀ θ, risk P L κ' θ = (Fintype.card G : ℝ)⁻¹ * ∑ g : G, risk P L κ (g • θ) := sorry

/-- **7.3** Blyth's method: on a convex parameter set with nonempty interior and continuous risk
functions, a rule whose excess Bayes risk over the Bayes rules `δₙ` of finite measures `πₙ`
tends to `0`, where the `πₙ` give uniformly positive mass to every ball, is admissible. -/
theorem isAdmissibleRisk_of_blyth {d : ℕ} (K : Set (EuclideanSpace ℝ (Fin d))) (hK : Convex ℝ K)
    (hKi : (interior K).Nonempty) (R : D → K → ℝ) (hR : ∀ δ, Continuous (R δ))
    (π : ℕ → Measure K) [∀ n, IsFiniteMeasure (π n)] (δₙ : ℕ → D)
    (hbayes : ∀ n, IsBayesRule R (π n) (δₙ n)) (hint : ∀ n δ, Integrable (R δ) (π n))
    (hmass : ∀ θ : K, ∀ r > 0, ∃ c > 0, ∀ n, c ≤ (π n).real (Metric.ball θ r)) (δ₀ : D)
    (hlim : Tendsto (fun n ↦ ∫ θ, R δ₀ θ ∂π n - ∫ θ, R (δₙ n) θ ∂π n) atTop (𝓝 0)) :
    IsAdmissibleRisk R δ₀ := sorry

/-- **7.4** Scheffé's simultaneous intervals: for `Y ~ N(μ, σ² I)` with `μ` in a subspace `L` of
dimension `q < n`, the residual variance `s²` with `n - q` degrees of freedom, a subspace
`S ≤ L` of dimension `r ≥ 1` and `f` the `(1 - α)`-quantile of `F_{r, n - q}`, the intervals
`|⟪u, μ̂ - μ⟫| ≤ √(r f) s ‖u‖`, `u ∈ S`, hold simultaneously with probability exactly `1 - α`. -/
theorem measureReal_scheffe_event_eq_one_sub {n q r : ℕ} (hqn : q < n)
    (L S : Submodule ℝ (EuclideanSpace ℝ (Fin n)))
    (hL : Module.finrank ℝ L = q) (hSL : S ≤ L) (hS : Module.finrank ℝ S = r) (hr : 1 ≤ r)
    (μ : EuclideanSpace ℝ (Fin n)) (hμ : μ ∈ L) (σ : ℝ) (hσ : 0 < σ) (α : ℝ)
    (hα : α ∈ Ioo 0 1) :
    let f := (TauCeti.Probability.fisherSnedecorMeasure r (n - q : ℕ)).quantile (1 - α)
    let μhat := fun y ↦ (L.orthogonalProjectionOnto y : EuclideanSpace ℝ (Fin n))
    let s := fun y ↦ Real.sqrt (‖y - μhat y‖ ^ 2 / (n - q : ℕ))
    (multivariateGaussian μ ((σ ^ 2) • (1 : Matrix (Fin n) (Fin n) ℝ))).real
        {y | ∀ u ∈ S, |inner ℝ u (μhat y - μ)| ≤ Real.sqrt (r * f) * s y * ‖u‖} = 1 - α := sorry

/-- **7.5** Blackwell's order on experiments. -/
def IsMoreInformative {X Y : Type*} [MeasurableSpace X] [MeasurableSpace Y]
    (P : Θ → Measure X) (Q : Θ → Measure Y) : Prop :=
  ∀ n : ℕ, ∀ L : Θ → Fin n → ℝ, (∃ C, ∀ θ a, |L θ a| ≤ C) →
    ∀ δ : Kernel Y (Fin n), IsMarkovKernel δ → ∃ δ' : Kernel X (Fin n), IsMarkovKernel δ' ∧
      ∀ θ, risk P L δ' θ ≤ risk Q L δ θ

/-- **7.5** Strassen's theorem: probability measures carried by a compact convex set and ordered
in the convex order are related by a dilation, a Markov kernel whose laws have barycentre at
their base point. -/
theorem exists_dilation_of_convexOrder {d : ℕ} (K : Set (EuclideanSpace ℝ (Fin d)))
    (hK : IsCompact K) (hKc : Convex ℝ K) (σ τ : Measure (EuclideanSpace ℝ (Fin d)))
    [IsProbabilityMeasure σ] [IsProbabilityMeasure τ] (hσ : σ Kᶜ = 0) (hτ : τ Kᶜ = 0)
    (horder : ∀ ψ : EuclideanSpace ℝ (Fin d) → ℝ, ConvexOn ℝ K ψ → ContinuousOn ψ K →
      ∫ x, ψ x ∂σ ≤ ∫ x, ψ x ∂τ) :
    ∃ D : Kernel (EuclideanSpace ℝ (Fin d)) (EuclideanSpace ℝ (Fin d)), IsMarkovKernel D ∧
      τ = D ∘ₘ σ ∧ ∀ᵐ s ∂σ, ∫ x, x ∂D s = s := sorry

/-- **7.5** Blackwell's comparison theorem for a finite parameter set. -/
theorem isMoreInformative_iff_isGarbling {X Y : Type*} [Fintype Θ] [MeasurableSpace X]
    [MeasurableSpace Y] [StandardBorelSpace Y] [Nonempty Y] (P : Θ → Measure X)
    (Q : Θ → Measure Y) [∀ θ, IsProbabilityMeasure (P θ)] [∀ θ, IsProbabilityMeasure (Q θ)] :
    IsMoreInformative P Q ↔ IsGarbling P Q := sorry

end Layer7

/-! ## Layer 8: convergence and stochastic algebra -/

section Layer8

variable {Ω Ω' E F : Type*} [MeasurableSpace Ω] [MeasurableSpace Ω']

/-- **8.2** Boundedness in probability, measured by the outer measure. -/
def IsBoundedInProbability [SeminormedAddCommGroup E] (μ : Measure Ω) (X : ℕ → Ω → E) : Prop :=
  ∀ ε > 0, ∃ C > 0, ∀ᶠ n in atTop, μ.real {ω | C < ‖X n ω‖} ≤ ε

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

/-- **8.5** The weak law of large numbers for an integrable statistic of an i.i.d. sequence. -/
theorem tendstoInMeasure_sampleMean_of_iid [MeasurableSpace E] (μ : Measure Ω)
    [IsProbabilityMeasure μ] (P : Measure E) (X : ℕ → Ω → E)
    (hiid : IsIndependentIdenticallyDistributed μ X P) (s : E → ℝ) (hs : Measurable s)
    (hint : Integrable s P) :
    TendstoInMeasure μ (fun (n : ℕ) ω ↦ (n : ℝ)⁻¹ * ∑ i ∈ Finset.range n, s (X i ω)) atTop
      (fun _ ↦ ∫ x, s x ∂P) := sorry

/-- **8.6** Contiguity of `Q` with respect to `P` along a filter, on varying sample spaces. -/
def IsContiguous {ι : Type*} {Ω : ι → Type*} [∀ i, MeasurableSpace (Ω i)] (l : Filter ι)
    (P Q : (i : ι) → Measure (Ω i)) : Prop :=
  ∀ A : (i : ι) → Set (Ω i), (∀ i, MeasurableSet (A i)) →
    Tendsto (fun i ↦ (P i).real (A i)) l (𝓝 0) → Tendsto (fun i ↦ (Q i).real (A i)) l (𝓝 0)

/-- **8.6** Absolute continuity with uniformly integrable likelihood ratios gives contiguity:
the mass that `Q i` puts where `dQ i / dP i` exceeds `C` is uniformly small for large `C`. -/
theorem isContiguous_of_absolutelyContinuous_of_uniformlyIntegrable {ι : Type*}
    {Ω : ι → Type*} [∀ i, MeasurableSpace (Ω i)] (l : Filter ι) (P Q : (i : ι) → Measure (Ω i))
    [∀ i, IsProbabilityMeasure (P i)] [∀ i, IsProbabilityMeasure (Q i)] (hac : ∀ i, Q i ≪ P i)
    (hui : ∀ ε > 0, ∃ C : ℝ≥0, ∀ i, (Q i).real {ω | (C : ℝ≥0∞) < (Q i).rnDeriv (P i) ω} ≤ ε) :
    IsContiguous l P Q := sorry

end Layer8

#check @ProbabilityTheory.IsBayesEstimator
#check @ProbabilityTheory.bayesRisk
#check @MeasureTheory.tvDist
#check @MeasureTheory.Measure.quantile
#check @TauCeti.Probability.multivariateGaussianPDFReal
#check @Sion.exists_isSaddlePointOn
#check @ProbabilityTheory.tendstoInDistribution_inv_sqrt_mul_sum_sub
#check @TauCeti.pi_withDensity

end TauCetiRoadmap.MathematicalStatisticsFoundations
