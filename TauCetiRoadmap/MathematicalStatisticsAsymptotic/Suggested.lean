module

public import Mathlib
public import TauCeti.Probability.Moments.Covariance
public import TauCeti.Probability.Distributions.ChiSquared.Basic
public import TauCeti.Probability.Distributions.NoncentralChiSquared.Gaussian
public import TauCeti.Probability.Distributions.Multinomial.Moments
public import TauCeti.Probability.Quantile
public import TauCeti.Analysis.Matrix.CovariancePseudoInverse
public import TauCeti.Probability.Distributions.Gaussian.Projection
public import TauCeti.Probability.Distributions.Gaussian.Cdf
public import TauCeti.Probability.Distributions.Gaussian.Quantile
public import TauCeti.Probability.Distributions.Laplace.Basic
public import TauCeti.Probability.Distributions.Logistic.Basic
public import TauCeti.Probability.Distributions.Multinomial.Basic
public import TauCeti.Probability.Process.EmpiricalMeasure
public import TauCeti.Probability.Kernel.Randomization
public import TauCeti.Data.Fin.Tuple.OrderStatistic
public import TauCeti.Analysis.InnerProductSpace.MoorePenrose

/-!
# Asymptotic and robust statistics: target signatures

This file is not the roadmap: the roadmap is `README.md`, and this file is not an exhaustive
checklist. It states, against the pinned Mathlib and Tau Ceti and each with `sorry`, every
headline of the README that carries a Lean name, together with the definitions their statements
need. Every such headline has a native carrier at the pin; the README's other targets are
corollaries, instances or prose statements with their own locators or proof routes.

The conventions of the README are used throughout. Statistics of a sample of size `n` are maps
on `Fin n → X` under `Measure.pi (fun _ ↦ P)`; sequences of statistics live on spaces that vary
with `n`. Convergence in probability on varying spaces is `TendstoInProbability`, measured by the
outer measure. Weak convergence of maps that need not be measurable, in particular empirical
processes in `ℓ^∞(T)`, is the Hoffmann-Jørgensen convergence `TendstoInOuterDistribution`:
outer expectations of bounded continuous functions converge to the integrals under a Borel
limit law. For measurable maps it is Mathlib's `TendstoInDistribution`.

Definitions owned by `MathematicalStatisticsFoundations` appear as local copies with a docstring
naming their owner: contiguity, the U-statistic, the empirical distribution function, the sample
quantile, the Huber score and the information matrix of a vector score (Foundations 4.3, here
`fisherInformation`; Foundations' own `fisherInformation` is the scalar information). The implementation namespace of the README is `TauCeti`; the prototypes live
in this roadmap's namespace.
-/

@[expose] public section

noncomputable section

open MeasureTheory ProbabilityTheory Filter Set Topology
open scoped ENNReal NNReal Matrix InnerProductSpace BoundedContinuousFunction

namespace TauCetiRoadmap.MathematicalStatisticsAsymptotic

attribute [local instance] Classical.propDecidable

/-! ## Local copies of `MathematicalStatisticsFoundations` vocabulary -/

section Foundations

/-- Local copy of `MathematicalStatisticsFoundations` 8.6: contiguity of `Q` with respect to `P`
along a filter, on varying sample spaces. -/
def IsContiguous {ι : Type*} {Ω : ι → Type*} [∀ i, MeasurableSpace (Ω i)] (l : Filter ι)
    (P Q : (i : ι) → Measure (Ω i)) : Prop :=
  ∀ A : (i : ι) → Set (Ω i), (∀ i, MeasurableSet (A i)) →
    Tendsto (fun i ↦ (P i).real (A i)) l (𝓝 0) → Tendsto (fun i ↦ (Q i).real (A i)) l (𝓝 0)

/-- Local copy of `MathematicalStatisticsFoundations` 2.4: the U-statistic of order `m` with
kernel `h`, the average of `h (x ∘ f)` over the injections `f : Fin m → Fin n`. -/
def uStatistic {E : Type*} (m n : ℕ) (h : (Fin m → E) → ℝ) (x : Fin n → E) : ℝ :=
  ((n.descFactorial m : ℕ) : ℝ)⁻¹ *
    ∑ f ∈ (Finset.univ : Finset (Fin m → Fin n)).filter Function.Injective, h (x ∘ f)

/-- Local copy of `MathematicalStatisticsFoundations` 9.1: the empirical distribution function
of a finite sample, the distribution function of `empiricalFiniteMeasure x`. -/
def empiricalCdf {n : ℕ} (x : Fin n → ℝ) (t : ℝ) : ℝ :=
  ((Finset.univ.filter fun i ↦ x i ≤ t).card : ℝ) / n

/-- Local copy of `MathematicalStatisticsFoundations` 9.1: the sample `p`-quantile, the left
quantile of the empirical distribution function. -/
def sampleQuantile {n : ℕ} (x : Fin n → ℝ) (p : ℝ) : ℝ :=
  sInf {t | p ≤ empiricalCdf x t}

/-- Local copy of `MathematicalStatisticsFoundations` 9.2: the Huber score. -/
def huberScore (k x : ℝ) : ℝ := max (-k) (min k x)

end Foundations

/-! ## Layer 1: stochastic convergence on varying spaces and Euclidean limit theorems -/

section Layer1

variable {ι : Type*} {Ω : ι → Type*} [∀ i, MeasurableSpace (Ω i)]

/-- **1.1** Convergence in probability to a constant along a filter, on probability spaces that
vary with the index. Sets are measured by the outer measure, so no measurability is required.
For a constant family of measures this is Mathlib's `TendstoInMeasure`. -/
def TendstoInProbability (μ : ∀ i, Measure (Ω i)) {E : Type*} [PseudoMetricSpace E]
    (X : ∀ i, Ω i → E) (l : Filter ι) (c : E) : Prop :=
  ∀ ε > 0, Tendsto (fun i ↦ μ i {ω | ε ≤ dist (X i ω) c}) l (𝓝 0)

/-- **1.1** Boundedness in probability along a filter, on varying probability spaces. For a
constant family and `l = atTop` this is `IsBoundedInProbability` of Foundations 8.2. -/
def IsBoundedInProbabilityAlong (μ : ∀ i, Measure (Ω i)) {E : Type*} [SeminormedAddCommGroup E]
    (X : ∀ i, Ω i → E) (l : Filter ι) : Prop :=
  ∀ ε > 0, ∃ C > 0, ∀ᶠ i in l, (μ i).real {ω | C < ‖X i ω‖} ≤ ε

/-- **1.1** Slutsky's lemma on varying spaces. -/
theorem TendstoInDistribution.of_tendstoInProbability_dist {E : Type*} [PseudoMetricSpace E]
    [MeasurableSpace E] [BorelSpace E] {μ : ∀ i, Measure (Ω i)} [∀ i, IsProbabilityMeasure (μ i)]
    {Ω' : Type*} [MeasurableSpace Ω'] {μ' : Measure Ω'} [IsProbabilityMeasure μ']
    {X Y : ∀ i, Ω i → E} {Z : Ω' → E} {l : Filter ι} (hY : ∀ i, AEMeasurable (Y i) (μ i))
    (hXZ : TendstoInDistribution X l Z μ μ')
    (hXY : TendstoInProbability μ (fun i ω ↦ dist (Y i ω) (X i ω)) l 0) :
    TendstoInDistribution Y l Z μ μ' := sorry

variable {k : ℕ}

/-- **1.2** The multivariate Lindeberg–Feller central limit theorem for triangular arrays of
row-wise independent centred random vectors. -/
theorem tendstoInDistribution_sum_of_lindeberg {Ωn : ℕ → Type*} [∀ n, MeasurableSpace (Ωn n)]
    (μ : ∀ n, Measure (Ωn n)) [∀ n, IsProbabilityMeasure (μ n)] (m : ℕ → ℕ)
    (Y : ∀ n, Fin (m n) → Ωn n → EuclideanSpace ℝ (Fin k))
    (hmeas : ∀ n i, Measurable (Y n i)) (hindep : ∀ n, iIndepFun (Y n) (μ n))
    (hL2 : ∀ n i, MemLp (Y n i) 2 (μ n)) (hmean : ∀ n i, ∫ ω, Y n i ω ∂(μ n) = 0)
    (S : Matrix (Fin k) (Fin k) ℝ)
    (hcov : Tendsto (fun n ↦ ∑ i, TauCeti.covMatrix ((μ n).map (Y n i))) atTop (𝓝 S))
    (hlind : ∀ ε > 0, Tendsto (fun n ↦ ∑ i, ∫ ω in {ω | ε < ‖Y n i ω‖}, ‖Y n i ω‖ ^ 2 ∂(μ n))
      atTop (𝓝 0))
    {Ω' : Type*} [MeasurableSpace Ω'] {μ' : Measure Ω'} [IsProbabilityMeasure μ']
    {Z : Ω' → EuclideanSpace ℝ (Fin k)} (hZ : HasLaw Z (multivariateGaussian 0 S) μ') :
    TendstoInDistribution (fun (n : ℕ) ω ↦ ∑ i, Y n i ω) atTop Z μ μ' := sorry

/-- **1.2** The multivariate central limit theorem for an i.i.d. sequence with finite second
moment. -/
theorem tendstoInDistribution_inv_sqrt_smul_sum_sub_euclidean {Ω₀ : Type*} [MeasurableSpace Ω₀]
    (μ : Measure Ω₀) [IsProbabilityMeasure μ] (X : ℕ → Ω₀ → EuclideanSpace ℝ (Fin k))
    (hmeas : ∀ i, Measurable (X i)) (hindep : iIndepFun X μ)
    (hident : ∀ i, IdentDistrib (X i) (X 0) μ μ) (hL2 : MemLp (X 0) 2 μ)
    {Ω' : Type*} [MeasurableSpace Ω'] {μ' : Measure Ω'} [IsProbabilityMeasure μ']
    {Z : Ω' → EuclideanSpace ℝ (Fin k)}
    (hZ : HasLaw Z (multivariateGaussian 0 (TauCeti.covMatrix (μ.map (X 0)))) μ') :
    TendstoInDistribution
      (fun (n : ℕ) ω ↦ (Real.sqrt n)⁻¹ • ∑ i ∈ Finset.range n, (X i ω - ∫ ω', X 0 ω' ∂μ))
      atTop Z (fun _ ↦ μ) μ' := sorry

/-- **1.3** The Gaussian quadratic form `(x - 0)ᵀ S⁻¹ x` under `N(m, S)` with `S` positive
definite has the noncentral chi-squared law with `k` degrees of freedom and noncentrality
`mᵀ S⁻¹ m`. -/
theorem map_quadForm_inv_multivariateGaussian (m : EuclideanSpace ℝ (Fin k))
    (S : Matrix (Fin k) (Fin k) ℝ) (hS : S.PosDef) :
    (multivariateGaussian m S).map (fun x ↦ (WithLp.ofLp x) ⬝ᵥ (S⁻¹ *ᵥ WithLp.ofLp x)) =
      TauCeti.Probability.noncentralChiSquaredMeasure k
        ((WithLp.ofLp m) ⬝ᵥ (S⁻¹ *ᵥ WithLp.ofLp m)).toNNReal := sorry

/-- **1.3** Singular covariance: under `N(0, S)` with `S` positive semidefinite of rank `q`, the
quadratic form in the Moore–Penrose inverse `S⁺` has the chi-squared law with `q` degrees of
freedom. -/
theorem map_quadForm_pseudoInverse_multivariateGaussian (S : Matrix (Fin k) (Fin k) ℝ)
    (hS : S.PosSemidef) :
    (multivariateGaussian 0 S).map
        (fun x ↦ (WithLp.ofLp x) ⬝ᵥ (S.covariancePseudoInverse *ᵥ WithLp.ofLp x)) =
      TauCeti.Probability.chiSquaredMeasure S.rank := sorry

/-- **1.4** The second-order delta method: if `√n (Tₙ - θ) → Z` in law, `g` is differentiable
near `θ` with vanishing derivative at `θ`, and `Dg` has derivative `D₂` at `θ`, then
`n (g Tₙ - g θ) → D₂ Z Z / 2` in law. -/
theorem tendstoInDistribution_second_order_delta_method {E F : Type*} [NormedAddCommGroup E]
    [NormedSpace ℝ E] [FiniteDimensional ℝ E] [MeasurableSpace E] [BorelSpace E]
    [NormedAddCommGroup F] [NormedSpace ℝ F] [MeasurableSpace F] [BorelSpace F]
    {Ω₀ : Type*} [MeasurableSpace Ω₀] (μ : Measure Ω₀) [IsProbabilityMeasure μ]
    {Ω' : Type*} [MeasurableSpace Ω'] {μ' : Measure Ω'} [IsProbabilityMeasure μ']
    (T : ℕ → Ω₀ → E) (hT : ∀ n, Measurable (T n)) (θ : E) {Z : Ω' → E} (g : E → F)
    (hg : Measurable g) (hdiff : ∀ᶠ x in 𝓝 θ, DifferentiableAt ℝ g x) (h0 : fderiv ℝ g θ = 0)
    (D₂ : E →L[ℝ] E →L[ℝ] F) (hD₂ : HasFDerivAt (fderiv ℝ g) D₂ θ)
    (hlim : TendstoInDistribution (fun (n : ℕ) ω ↦ Real.sqrt n • (T n ω - θ)) atTop Z
      (fun _ ↦ μ) μ') :
    TendstoInDistribution (fun (n : ℕ) ω ↦ (n : ℝ) • (g (T n ω) - g θ)) atTop
      (fun ω' ↦ (2 : ℝ)⁻¹ • D₂ (Z ω') (Z ω')) (fun _ ↦ μ) μ' := sorry

end Layer1

/-! ## Layer 2: weak convergence of arbitrary maps and the space `ℓ^∞(T)` -/

section Layer2

variable {ι : Type*} {Ω : ι → Type*} [∀ i, MeasurableSpace (Ω i)]

/-- **2.1** The outer integral of a real function: the infimum of the integrals of its
integrable measurable majorants. It is meaningful for bounded functions under finite measures;
otherwise it takes Lean's junk value. -/
def outerIntegral {Ω₀ : Type*} [MeasurableSpace Ω₀] (μ : Measure Ω₀) (f : Ω₀ → ℝ) : ℝ :=
  ⨅ g : {g : Ω₀ → ℝ // Measurable g ∧ Integrable g μ ∧ f ≤ g}, ∫ ω, (g : Ω₀ → ℝ) ω ∂μ

/-- **2.1** The inner integral, `-outerIntegral μ (-f)`. -/
def innerIntegral {Ω₀ : Type*} [MeasurableSpace Ω₀] (μ : Measure Ω₀) (f : Ω₀ → ℝ) : ℝ :=
  -outerIntegral μ (-f)

/-- **2.1** The outer expectation of a nonnegative extended-real function: the infimum of the
lower integrals of its measurable majorants. It has no junk value: a function with no
integrable measurable majorant has outer expectation `∞`. Maximal inequalities and rate moduli
are stated with it. -/
def outerLIntegral {Ω₀ : Type*} [MeasurableSpace Ω₀] (μ : Measure Ω₀) (f : Ω₀ → ℝ≥0∞) : ℝ≥0∞ :=
  ⨅ (g : Ω₀ → ℝ≥0∞) (_ : Measurable g) (_ : f ≤ g), ∫⁻ ω, g ω ∂μ

/-- **2.1** Markov's inequality for outer expectations. The measure of a possibly non-measurable
set is its outer measure. -/
theorem measure_le_le_outerLIntegral_div {Ω₀ : Type*} [MeasurableSpace Ω₀] (μ : Measure Ω₀)
    (f : Ω₀ → ℝ≥0∞) {t : ℝ≥0∞} (ht : t ≠ 0) (ht' : t ≠ ⊤) :
    μ {ω | t ≤ f ω} ≤ outerLIntegral μ f / t := sorry

/-- **2.1** For a bounded nonnegative function under a finite measure the two outer integrals
agree. -/
theorem outerLIntegral_ofReal_eq {Ω₀ : Type*} [MeasurableSpace Ω₀] (μ : Measure Ω₀)
    [IsFiniteMeasure μ] (f : Ω₀ → ℝ) (hf : 0 ≤ f) (C : ℝ) (hC : ∀ ω, f ω ≤ C) :
    outerLIntegral μ (fun ω ↦ ENNReal.ofReal (f ω)) = ENNReal.ofReal (outerIntegral μ f) := sorry

/-- **2.1** The outer integral of a bounded measurable function is its integral. -/
theorem outerIntegral_eq_integral {Ω₀ : Type*} [MeasurableSpace Ω₀] (μ : Measure Ω₀)
    [IsProbabilityMeasure μ] (f : Ω₀ → ℝ) (hf : AEMeasurable f μ) (C : ℝ)
    (hC : ∀ ω, |f ω| ≤ C) : outerIntegral μ f = ∫ ω, f ω ∂μ := sorry

/-- **2.2** Weak convergence in the sense of Hoffmann-Jørgensen: for maps `X i : Ω i → E` that
need not be measurable, the outer expectations of every bounded continuous function converge to
its integral under the Borel law `L`. -/
def TendstoInOuterDistribution {E : Type*} [TopologicalSpace E] [MeasurableSpace E]
    (X : ∀ i, Ω i → E) (l : Filter ι) (L : Measure E) (μ : ∀ i, Measure (Ω i)) : Prop :=
  ∀ f : E →ᵇ ℝ, Tendsto (fun i ↦ outerIntegral (μ i) (fun ω ↦ f (X i ω))) l (𝓝 (∫ x, f x ∂L))

/-- **2.2** Asymptotic tightness: for every `ε > 0` a nonempty compact `K` whose
`δ`-enlargements carry outer probability at least `1 - ε` in the limit, for every `δ > 0`. The
compact must be nonempty because `Metric.infDist x ∅ = 0`. -/
def IsAsymptoticallyTight {E : Type*} [PseudoMetricSpace E] (X : ∀ i, Ω i → E) (l : Filter ι)
    (μ : ∀ i, Measure (Ω i)) : Prop :=
  ∀ ε > 0, ∃ K : Set E, IsCompact K ∧ K.Nonempty ∧ ∀ δ > 0,
    ∀ᶠ i in l, (μ i).real {ω | δ ≤ Metric.infDist (X i ω) K} ≤ ε

/-- **2.2** For measurable maps the outer convergence is Mathlib's convergence in law. -/
theorem tendstoInOuterDistribution_iff_tendstoInDistribution {E : Type*} [PseudoMetricSpace E]
    [MeasurableSpace E] [BorelSpace E] {μ : ∀ i, Measure (Ω i)} [∀ i, IsProbabilityMeasure (μ i)]
    {X : ∀ i, Ω i → E} {l : Filter ι} {L : Measure E} [IsProbabilityMeasure L]
    (hX : ∀ i, AEMeasurable (X i) (μ i)) :
    TendstoInOuterDistribution X l L μ ↔ TendstoInDistribution X l id μ L := sorry

/-- **2.2** The bridge to Mathlib: a continuous image that is measurable converges in law. This
is how a limit theorem in `ℓ^∞(T)` yields the limit law of a measurable statistic. -/
theorem TendstoInOuterDistribution.tendstoInDistribution_comp {E F : Type*}
    [PseudoMetricSpace E] [MeasurableSpace E] [BorelSpace E] [PseudoMetricSpace F]
    [MeasurableSpace F] [BorelSpace F] {μ : ∀ i, Measure (Ω i)} [∀ i, IsProbabilityMeasure (μ i)]
    {X : ∀ i, Ω i → E} {l : Filter ι} {L : Measure E} [IsProbabilityMeasure L]
    (h : TendstoInOuterDistribution X l L μ) (g : E → F) (hg : Continuous g)
    (hmeas : ∀ i, AEMeasurable (fun ω ↦ g (X i ω)) (μ i)) :
    TendstoInDistribution (fun i ω ↦ g (X i ω)) l id μ (L.map g) := sorry

/-- **2.2** The continuous mapping theorem for outer weak convergence. -/
theorem TendstoInOuterDistribution.comp {E F : Type*} [PseudoMetricSpace E] [MeasurableSpace E]
    [BorelSpace E] [PseudoMetricSpace F] [MeasurableSpace F] [BorelSpace F]
    {μ : ∀ i, Measure (Ω i)} [∀ i, IsProbabilityMeasure (μ i)] {X : ∀ i, Ω i → E}
    {l : Filter ι} {L : Measure E} [IsProbabilityMeasure L]
    (h : TendstoInOuterDistribution X l L μ) (g : E → F) (hg : Continuous g) :
    TendstoInOuterDistribution (fun i ω ↦ g (X i ω)) l (L.map g) μ := sorry

/-- **2.2** Slutsky's lemma for outer weak convergence to a separable limit. -/
theorem TendstoInOuterDistribution.of_tendstoInProbability_dist {E : Type*} [PseudoMetricSpace E]
    [MeasurableSpace E] [BorelSpace E] {μ : ∀ i, Measure (Ω i)} [∀ i, IsProbabilityMeasure (μ i)]
    {X Y : ∀ i, Ω i → E} {l : Filter ι} {L : Measure E} [IsProbabilityMeasure L]
    (hsep : ∃ S : Set E, TopologicalSpace.IsSeparable S ∧ MeasurableSet S ∧ L S = 1)
    (h : TendstoInOuterDistribution X l L μ)
    (hXY : TendstoInProbability μ (fun i ω ↦ dist (Y i ω) (X i ω)) l 0) :
    TendstoInOuterDistribution Y l L μ := sorry

/-- **2.2** The portmanteau theorem for outer weak convergence: closed sets with the outer
probability, and open sets with the inner probability `1 - μ (X ⁻¹' Gᶜ)`. -/
theorem tendstoInOuterDistribution_iff_limsup_le {E : Type*} [PseudoMetricSpace E]
    [MeasurableSpace E] [BorelSpace E] {μ : ∀ i, Measure (Ω i)} [∀ i, IsProbabilityMeasure (μ i)]
    {X : ∀ i, Ω i → E} {l : Filter ι} {L : Measure E} [IsProbabilityMeasure L] :
    (TendstoInOuterDistribution X l L μ ↔
      ∀ F : Set E, IsClosed F → limsup (fun i ↦ μ i (X i ⁻¹' F)) l ≤ L F) ∧
    (TendstoInOuterDistribution X l L μ ↔
      ∀ G : Set E, IsOpen G → L G ≤ liminf (fun i ↦ 1 - μ i (X i ⁻¹' Gᶜ)) l) := sorry

/-- **2.2** Prohorov's theorem for arbitrary maps: an asymptotically tight and asymptotically
measurable sequence (outer minus inner integrals of every bounded continuous function tend to
`0`) has a subsequence converging weakly to a tight Borel law. -/
theorem exists_strictMono_tendstoInOuterDistribution {E : Type*} [MetricSpace E]
    [MeasurableSpace E] [BorelSpace E] {Ωn : ℕ → Type*} [∀ n, MeasurableSpace (Ωn n)]
    {μ : ∀ n, Measure (Ωn n)} [∀ n, IsProbabilityMeasure (μ n)] (X : ∀ n, Ωn n → E)
    (htight : IsAsymptoticallyTight X atTop μ)
    (hmeas : ∀ f : E →ᵇ ℝ, Tendsto (fun n ↦ outerIntegral (μ n) (fun ω ↦ f (X n ω)) -
      innerIntegral (μ n) (fun ω ↦ f (X n ω))) atTop (𝓝 0)) :
    ∃ φ : ℕ → ℕ, StrictMono φ ∧ ∃ L : Measure E, IsProbabilityMeasure L ∧ IsTightMeasureSet {L} ∧
      TendstoInOuterDistribution (fun j ↦ X (φ j)) atTop L (fun j ↦ μ (φ j)) := sorry

/-- **2.3** The space `ℓ^∞(T)` of bounded real functions on `T` with the supremum norm. -/
abbrev Linfty (T : Type*) := lp (fun _ : T ↦ ℝ) ∞

/-- **2.3** `ℓ^∞(T)` carries its Borel σ-algebra. -/
instance (T : Type*) : MeasurableSpace (Linfty T) := borel _

instance (T : Type*) : BorelSpace (Linfty T) := ⟨rfl⟩

/-- **2.3** A function `T → ℝ` as an element of `ℓ^∞(T)`: itself when bounded, `0` otherwise. -/
def liftLinfty {T : Type*} (g : T → ℝ) : Linfty T :=
  if h : Memℓp g ∞ then ⟨g, h⟩ else 0

/-- **2.3** The marginal of an element of `ℓ^∞(T)` at finitely many points, as a Euclidean
vector. -/
def marginal {T : Type*} {m : ℕ} (t : Fin m → T) (z : Linfty T) : EuclideanSpace ℝ (Fin m) :=
  WithLp.toLp 2 fun j ↦ (z : T → ℝ) (t j)

/-- **2.3** Asymptotic uniform equicontinuity in outer probability with respect to a
function `ρ` on `T × T`. -/
def IsAsymptoticallyUniformlyEquicontinuous {T : Type*} (ρ : T → T → ℝ)
    (X : ∀ i, Ω i → Linfty T) (l : Filter ι) (μ : ∀ i, Measure (Ω i)) : Prop :=
  ∀ ε > 0, ∀ η > 0, ∃ δ > 0, ∀ᶠ i in l,
    (μ i).real {ω | ∃ s t, ρ s t < δ ∧ ε < |(X i ω : T → ℝ) s - (X i ω : T → ℝ) t|} ≤ η

/-- **2.3** Weak convergence in `ℓ^∞(T)` to a tight limit from convergence of the marginals and
asymptotic equicontinuity for a totally bounded semimetric. -/
theorem tendstoInOuterDistribution_of_marginal_of_equicontinuous {T : Type*}
    {μ : ∀ i, Measure (Ω i)} [∀ i, IsProbabilityMeasure (μ i)] {l : Filter ι} [l.NeBot]
    (X : ∀ i, Ω i → Linfty T) (ρ : T → T → ℝ) (hρ0 : ∀ t, ρ t t = 0)
    (hρsymm : ∀ s t, ρ s t = ρ t s) (hρtri : ∀ r s t, ρ r t ≤ ρ r s + ρ s t)
    (htb : ∀ δ > 0, ∃ S : Finset T, ∀ t, ∃ s ∈ S, ρ s t < δ)
    (hmarg : ∀ (m : ℕ) (t : Fin m → T), ∃ Lm : Measure (EuclideanSpace ℝ (Fin m)),
      IsProbabilityMeasure Lm ∧ TendstoInOuterDistribution (fun i ω ↦ marginal t (X i ω)) l Lm μ)
    (heq : IsAsymptoticallyUniformlyEquicontinuous ρ X l μ) :
    ∃ L : Measure (Linfty T), IsProbabilityMeasure L ∧ IsTightMeasureSet {L} ∧
      TendstoInOuterDistribution X l L μ := sorry

/-- **2.3** Tight Borel laws on `ℓ^∞(T)` are determined by their marginals. -/
theorem ext_of_marginal {T : Type*} (L L' : Measure (Linfty T)) [IsProbabilityMeasure L]
    [IsProbabilityMeasure L'] (hL : IsTightMeasureSet {L}) (hL' : IsTightMeasureSet {L'})
    (h : ∀ (m : ℕ) (t : Fin m → T), L.map (marginal t) = L'.map (marginal t)) : L = L' := sorry

/-- **2.4** The `P`-Brownian bridge law on `ℓ^∞(T)` of an indexed class `f`: a tight Borel
probability law whose marginals are centred Gaussian with covariance `P (f s f t) - P f s P f t`. -/
def IsBrownianBridgeLaw {X T : Type*} [MeasurableSpace X] (P : Measure X) (f : T → X → ℝ)
    (L : Measure (Linfty T)) : Prop :=
  IsProbabilityMeasure L ∧ IsTightMeasureSet {L} ∧
    ∀ (m : ℕ) (t : Fin m → T), L.map (marginal t) = multivariateGaussian 0
      (Matrix.of fun a b ↦ ∫ x, f (t a) x * f (t b) x ∂P - (∫ x, f (t a) x ∂P) * ∫ x, f (t b) x ∂P)

end Layer2

/-! ## Layer 3: empirical processes -/

section Layer3

variable {X T : Type*} [MeasurableSpace X]

/-- **3.1** The empirical process `√n (ℙₙ f_t - P f_t)` of a sample of size `n`, as an element of
`ℓ^∞(T)`. -/
def empiricalProcess (P : Measure X) (f : T → X → ℝ) (n : ℕ) (x : Fin n → X) : Linfty T :=
  liftLinfty fun t ↦ Real.sqrt n * ((n : ℝ)⁻¹ * ∑ i, f t (x i) - ∫ y, f t y ∂P)

/-- **3.1** The class `f` is `P`-Glivenko–Cantelli: the supremum over `T` of
`|ℙₙ f_t - P f_t|`, computed in `ℝ≥0∞`, tends to `0` outer almost surely along the i.i.d.
sequence. -/
def IsGlivenkoCantelli (P : Measure X) (f : T → X → ℝ) : Prop :=
  ∀ᵐ ω ∂(Measure.infinitePi fun _ : ℕ ↦ P), Tendsto (fun n : ℕ ↦
    ⨆ t, ENNReal.ofReal |(n : ℝ)⁻¹ * ∑ i ∈ Finset.range n, f t (ω i) - ∫ y, f t y ∂P|)
    atTop (𝓝 0)

/-- **3.1** The class `f` is `P`-Donsker: its centred values are bounded at every point, and its
empirical process converges in `ℓ^∞(T)` to a tight Borel limit. -/
def IsDonsker (P : Measure X) (f : T → X → ℝ) : Prop :=
  (∀ x, BddAbove (range fun t ↦ |f t x - ∫ y, f t y ∂P|)) ∧
    ∃ L : Measure (Linfty T), IsProbabilityMeasure L ∧ IsTightMeasureSet {L} ∧
      TendstoInOuterDistribution (empiricalProcess P f) atTop L
        (fun n ↦ Measure.pi fun _ : Fin n ↦ P)

/-- **3.1** The limit of a Donsker class is its Brownian bridge. -/
theorem IsDonsker.isBrownianBridgeLaw {P : Measure X} [IsProbabilityMeasure P] {f : T → X → ℝ}
    (hf : ∀ t, MemLp (f t) 2 P) (hbdd : ∀ x, BddAbove (range fun t ↦ |f t x - ∫ y, f t y ∂P|))
    (L : Measure (Linfty T)) [IsProbabilityMeasure L] (hL : IsTightMeasureSet {L})
    (h : TendstoInOuterDistribution (empiricalProcess P f) atTop L
      (fun n ↦ Measure.pi fun _ : Fin n ↦ P)) :
    IsBrownianBridgeLaw P f L := sorry

/-- **3.2** The bracketing number `N_[](ε, f, Lʳ(P))`: the least number of measurable brackets
`[l, u]` with `‖u - l‖_{Lʳ(P)} ≤ ε` that cover the class. -/
def bracketingNumber (r : ℝ≥0∞) (P : Measure X) (f : T → X → ℝ) (ε : ℝ≥0∞) : ℕ∞ :=
  ⨅ (N : ℕ) (lo : Fin N → X → ℝ) (up : Fin N → X → ℝ)
    (_ : ∀ j, Measurable (lo j) ∧ Measurable (up j) ∧ eLpNorm (up j - lo j) r P ≤ ε)
    (_ : ∀ t, ∃ j, lo j ≤ f t ∧ f t ≤ up j), (N : ℕ∞)

/-- **3.2** The bracketing entropy integral `J_[](δ, f, L²(P)) = ∫₀^δ √(log N_[](ε, f, L²(P))) dε`,
with the integrand `∞` where the bracketing number is infinite. -/
def bracketingEntropyIntegral (P : Measure X) (f : T → X → ℝ) (δ : ℝ) : ℝ≥0∞ :=
  ∫⁻ ε in Set.Ioc 0 δ,
    (if bracketingNumber 2 P f (ENNReal.ofReal ε) = ⊤ then ⊤ else
      ENNReal.ofReal (Real.sqrt (Real.log (bracketingNumber 2 P f (ENNReal.ofReal ε)).toNat)))

/-- **3.2** The external covering number `N(ε, f, Lʳ(Q))` of the class in `Lʳ(Q)`. -/
def coveringNumberLp (r : ℝ≥0∞) (Q : Measure X) (f : T → X → ℝ) (ε : ℝ≥0∞) : ℕ∞ :=
  ⨅ (s : Finset (X → ℝ)) (_ : ∀ t, ∃ g ∈ s, eLpNorm (f t - g) r Q ≤ ε), (s.card : ℕ∞)

/-- **3.2** The uniform entropy integral `J(δ, f, F) = ∫₀^δ sup_Q √(log N(ε ‖F‖_{Q,2}, f, L²(Q))) dε`,
the supremum over finitely supported probability measures `Q` with `‖F‖_{Q,2} > 0`. -/
def uniformEntropyIntegral (f : T → X → ℝ) (F : X → ℝ) (δ : ℝ) : ℝ≥0∞ :=
  ∫⁻ ε in Set.Ioc 0 δ, ⨆ (n : ℕ) (x : Fin (n + 1) → X) (w : Fin (n + 1) → ℝ≥0)
    (_ : ∑ j, w j = 1)
    (_ : 0 < eLpNorm F 2 (∑ j, (w j : ℝ≥0∞) • Measure.dirac (x j))),
      (if coveringNumberLp 2 (∑ j, (w j : ℝ≥0∞) • Measure.dirac (x j)) f
          (ENNReal.ofReal ε * eLpNorm F 2 (∑ j, (w j : ℝ≥0∞) • Measure.dirac (x j))) = ⊤ then ⊤
        else ENNReal.ofReal (Real.sqrt (Real.log (coveringNumberLp 2
          (∑ j, (w j : ℝ≥0∞) • Measure.dirac (x j)) f
          (ENNReal.ofReal ε * eLpNorm F 2 (∑ j, (w j : ℝ≥0∞) • Measure.dirac (x j)))).toNat)))

/-- **3.2** Pointwise separability: a countable subfamily approximates every member pointwise.
This is the measurability hypothesis of the uniform-entropy theorems. -/
def IsPointwiseSeparable (f : T → X → ℝ) : Prop :=
  ∃ T₀ : Set T, T₀.Countable ∧ ∀ t, ∃ s : ℕ → T, (∀ j, s j ∈ T₀) ∧
    ∀ x, Tendsto (fun j ↦ f (s j) x) atTop (𝓝 (f t x))

/-- **3.3** The maximal inequality for finitely many sub-Gaussian variables:
`E max_{j < N} Y_j ≤ √(2 c log N)`. -/
theorem integral_sup'_le_of_hasSubgaussianMGF {Ω₀ : Type*} [MeasurableSpace Ω₀]
    {μ : Measure Ω₀} [IsProbabilityMeasure μ] {N : ℕ} (hN : 0 < N) (Y : Fin N → Ω₀ → ℝ)
    (c : ℝ≥0) (hY : ∀ j, HasSubgaussianMGF (Y j) c μ) :
    ∫ ω, (Finset.univ.sup' (Finset.univ_nonempty_iff.2 ⟨⟨0, hN⟩⟩) fun j ↦ Y j ω) ∂μ ≤
      Real.sqrt (2 * c * Real.log N) := sorry

/-- **3.3** Symmetrization: for `n ≥ 1`, the outer expectation of `sup_t |ℙₙ f_t - P f_t|` is at
most twice that of `sup_t |n⁻¹ ∑ᵢ εᵢ f_t(xᵢ)|` with independent Rademacher signs `εᵢ`. -/
theorem outerLIntegral_iSup_le_two_mul_rademacher (P : Measure X) [IsProbabilityMeasure P]
    (f : T → X → ℝ) (hf : ∀ t, Measurable (f t) ∧ Integrable (f t) P) (n : ℕ) (hn : 1 ≤ n) :
    outerLIntegral (Measure.pi fun _ : Fin n ↦ P) (fun x ↦ ⨆ t,
        ENNReal.ofReal |(n : ℝ)⁻¹ * ∑ i, f t (x i) - ∫ y, f t y ∂P|) ≤
      2 * outerLIntegral ((Measure.pi fun _ : Fin n ↦ P).prod
          (Measure.pi fun _ : Fin n ↦ (2 : ℝ≥0∞)⁻¹ • (Measure.dirac (1 : ℝ) + Measure.dirac (-1))))
        (fun z ↦ ⨆ t, ENNReal.ofReal |(n : ℝ)⁻¹ * ∑ i, z.2 i * f t (z.1 i)|) := sorry

/-- **3.3** Chaining: for a separable process with sub-Gaussian increments, variance proxy
`d(s, t)²`, the outer expectation of the modulus `sup_{d(s,t) ≤ δ} |Y_s - Y_t|` is at most a
universal constant times the packing entropy integral `∫₀^δ √(log D(ε, d)) dε`. -/
theorem outerLIntegral_iSup_sub_le_packingEntropyIntegral :
    ∃ K : ℝ, ∀ {Ω₀ T : Type*} [MeasurableSpace Ω₀] [PseudoMetricSpace T] (μ : Measure Ω₀)
      [IsProbabilityMeasure μ] (Y : T → Ω₀ → ℝ),
      (∀ s t, HasSubgaussianMGF (fun ω ↦ Y s ω - Y t ω) (nndist s t ^ 2) μ) →
      (∃ T₀ : Set T, T₀.Countable ∧ ∀ᵐ ω ∂μ, ∀ t, ∃ u : ℕ → T, (∀ j, u j ∈ T₀) ∧
        Tendsto u atTop (𝓝 t) ∧ Tendsto (fun j ↦ Y (u j) ω) atTop (𝓝 (Y t ω))) →
      ∀ δ : ℝ, 0 < δ →
        outerLIntegral μ (fun ω ↦ ⨆ (s : T) (t : T) (_ : dist s t ≤ δ),
            ENNReal.ofReal |Y s ω - Y t ω|) ≤
          ENNReal.ofReal K * ∫⁻ ε in Set.Ioc 0 δ,
            (if Metric.packingNumber ε.toNNReal (Set.univ : Set T) = ⊤ then ⊤ else
              ENNReal.ofReal (Real.sqrt (Real.log
                (Metric.packingNumber ε.toNNReal (Set.univ : Set T)).toNat))) := sorry

/-- **3.3** The bracketing maximal inequality: for a class with `P f_t² < δ²` and a measurable
envelope `F`, `E* sup_t |𝔾ₙ f_t| ≤ K (δ + J_[](δ) + √n P F 1{F > √n a(δ)})` with
`a(δ) = δ / √(max 1 (log N_[](δ)))`, for a universal constant `K`. The term `δ` accounts for
the integrand `√(max 1 (log N))` of the source, which exceeds `√(log N)` by at most `1`. -/
theorem outerLIntegral_iSup_empiricalProcess_le_bracketing :
    ∃ K : ℝ, ∀ {X T : Type*} [MeasurableSpace X] (P : Measure X) [IsProbabilityMeasure P]
      (f : T → X → ℝ) (δ : ℝ), 0 < δ → (∀ t, Measurable (f t) ∧ MemLp (f t) 2 P) →
      (∀ t, ∫ x, f t x ^ 2 ∂P < δ ^ 2) → ∀ F : X → ℝ, Measurable F → (∀ t x, |f t x| ≤ F x) →
      ∀ n : ℕ, outerLIntegral (Measure.pi fun _ : Fin n ↦ P) (fun x ↦ ⨆ t,
          ENNReal.ofReal |Real.sqrt n * ((n : ℝ)⁻¹ * ∑ i, f t (x i) - ∫ y, f t y ∂P)|) ≤
        ENNReal.ofReal K * (ENNReal.ofReal δ + bracketingEntropyIntegral P f δ +
          ENNReal.ofReal (Real.sqrt n) *
          ∫⁻ x, ENNReal.ofReal ((Set.indicator {y | Real.sqrt n * (δ / Real.sqrt (max 1 (Real.log
            (bracketingNumber 2 P f (ENNReal.ofReal δ)).toNat))) < F y} F) x) ∂P) := sorry

/-- **3.4** Glivenko–Cantelli under finite `L¹(P)` bracketing numbers. -/
theorem isGlivenkoCantelli_of_bracketingNumber_lt_top (P : Measure X) [IsProbabilityMeasure P]
    (f : T → X → ℝ) (hf : ∀ t, Integrable (f t) P)
    (hbr : ∀ ε > 0, bracketingNumber 1 P f ε < ⊤) : IsGlivenkoCantelli P f := sorry

/-- **3.4** Donsker under a finite bracketing entropy integral. -/
theorem isDonsker_of_bracketingEntropyIntegral_lt_top (P : Measure X) [IsProbabilityMeasure P]
    (f : T → X → ℝ) (hf : ∀ t, MemLp (f t) 2 P)
    (hbdd : ∀ x, BddAbove (range fun t ↦ |f t x - ∫ y, f t y ∂P|))
    (hJ : bracketingEntropyIntegral P f 1 < ⊤) : IsDonsker P f := sorry

/-- **3.4** The classical Donsker theorem: the empirical distribution function process converges
in `ℓ^∞(ℝ)` to the `F`-Brownian bridge. -/
theorem isDonsker_indicator_Iic (P : Measure ℝ) [IsProbabilityMeasure P] :
    IsDonsker P (fun t x ↦ (Set.Iic t).indicator (fun _ ↦ (1 : ℝ)) x) := sorry

/-- **3.4** The `F`-Brownian bridge is the image of the standard Brownian bridge on `C([0,1])`
under `x ↦ x ∘ F`. The standard bridge law `B` is the one built by StochasticCalculus §1.4; here
it enters through its defining marginals. -/
theorem isBrownianBridgeLaw_map_comp_cdf (P : Measure ℝ) [IsProbabilityMeasure P]
    (B : Measure C(unitInterval, ℝ)) [IsProbabilityMeasure B]
    (hB : ∀ (m : ℕ) (s : Fin m → unitInterval),
      B.map (fun x ↦ WithLp.toLp 2 fun j ↦ x (s j)) = multivariateGaussian 0
        (Matrix.of fun a b ↦ min (s a : ℝ) (s b) - (s a : ℝ) * s b)) :
    IsBrownianBridgeLaw P (fun t x ↦ (Set.Iic t).indicator (fun _ ↦ (1 : ℝ)) x)
      (B.map fun x ↦ liftLinfty fun t ↦ x ⟨cdf P t, cdf_nonneg P t, cdf_le_one P t⟩) := sorry

/-- **3.5** The VC dimension of a family of sets, through Mathlib's shattering of finite sets:
the supremum of the sizes of the finite sets whose traces exhaust their power sets. -/
def vcDimSet (C : Set (Set X)) : ℕ∞ :=
  ⨆ (s : Finset X) (_ : ∀ u ⊆ s, ∃ A ∈ C, ∀ x ∈ s, x ∈ A ↔ x ∈ u), (s.card : ℕ∞)

/-- **3.5** Glivenko–Cantelli under uniform `L¹` entropy, for a pointwise separable class with
an integrable envelope. -/
theorem isGlivenkoCantelli_of_uniformCoveringNumber (P : Measure X) [IsProbabilityMeasure P]
    (f : T → X → ℝ) (hf : ∀ t, Measurable (f t)) (hsep : IsPointwiseSeparable f)
    (F : X → ℝ) (hF : Measurable F) (henv : ∀ t x, |f t x| ≤ F x) (hFint : Integrable F P)
    (hcov : ∀ ε > 0, ∃ N : ℕ, ∀ (n : ℕ) (x : Fin (n + 1) → X),
      coveringNumberLp 1 (∑ j, (n + 1 : ℝ≥0∞)⁻¹ • Measure.dirac (x j)) f
        (ENNReal.ofReal ε * eLpNorm F 1 (∑ j, (n + 1 : ℝ≥0∞)⁻¹ • Measure.dirac (x j))) ≤ N) :
    IsGlivenkoCantelli P f := sorry

/-- **3.5** Donsker under a finite uniform entropy integral, for a pointwise separable class
with a square-integrable envelope. -/
theorem isDonsker_of_uniformEntropyIntegral_lt_top (P : Measure X) [IsProbabilityMeasure P]
    (f : T → X → ℝ) (hf : ∀ t, Measurable (f t)) (hsep : IsPointwiseSeparable f)
    (F : X → ℝ) (hF : Measurable F) (henv : ∀ t x, |f t x| ≤ F x) (hF2 : MemLp F 2 P)
    (hJ : uniformEntropyIntegral f F 1 < ⊤) : IsDonsker P f := sorry

/-- **3.5** The uniform covering bound for a VC class of sets of VC dimension `d`, in `L¹(Q)`:
`N(ε, C, L¹(Q)) ≤ K (d + 1) (4e)^{d + 1} ε^{-d}` for a universal constant `K`. -/
theorem coveringNumberLp_indicator_le_of_vcDimSet :
    ∃ K : ℝ, ∀ {X : Type*} [MeasurableSpace X] (C : Set (Set X)) (d : ℕ), vcDimSet C = d →
      (∀ A ∈ C, MeasurableSet A) →
      ∀ (Q : Measure X) [IsProbabilityMeasure Q] (ε : ℝ), 0 < ε → ε < 1 →
        coveringNumberLp 1 Q (fun A : C ↦ (A : Set X).indicator fun _ ↦ (1 : ℝ))
            (ENNReal.ofReal ε) < ⊤ ∧
          (coveringNumberLp 1 Q (fun A : C ↦ (A : Set X).indicator fun _ ↦ (1 : ℝ))
            (ENNReal.ofReal ε)).toNat ≤ K * (d + 1) * (4 * Real.exp 1) ^ (d + 1) * ε⁻¹ ^ d := sorry

/-- **3.6** Asymptotic equicontinuity: on a Donsker class, the empirical process of a random
member that converges in `L²(P)` to `f t₀` converges to `0` in outer probability. -/
theorem tendstoInProbability_empiricalProcess_sub (P : Measure X) [IsProbabilityMeasure P]
    (f : T → X → ℝ) (hD : IsDonsker P f) (hf : ∀ t, MemLp (f t) 2 P) (t₀ : T)
    (τ : ∀ n, (Fin n → X) → T)
    (hτ : TendstoInProbability (fun n ↦ Measure.pi fun _ : Fin n ↦ P)
      (fun (n : ℕ) x ↦ (eLpNorm (f (τ n x) - f t₀) 2 P).toReal) atTop 0) :
    TendstoInProbability (fun n ↦ Measure.pi fun _ : Fin n ↦ P)
      (fun (n : ℕ) x ↦ (empiricalProcess P f n x : T → ℝ) (τ n x) -
        (empiricalProcess P f n x : T → ℝ) t₀) atTop 0 := sorry

end Layer3

/-! ## Layer 4: Hadamard differentiability, the functional delta method and the argmax theorem -/

section Layer4

/-- **4.1** Hadamard differentiability of `φ` at `θ`, within the domain `dom` and tangentially to
`D₀`: `(φ (θ + tₙ hₙ) - φ θ) / tₙ → φ' h` whenever `tₙ ↓ 0`, `hₙ → h ∈ D₀` and
`θ + tₙ hₙ ∈ dom`. -/
def HasHadamardDerivWithinAt {D F : Type*} [NormedAddCommGroup D] [NormedSpace ℝ D]
    [NormedAddCommGroup F] [NormedSpace ℝ F] (φ : D → F) (dom D₀ : Set D) (φ' : D →L[ℝ] F)
    (θ : D) : Prop :=
  θ ∈ dom ∧ ∀ (t : ℕ → ℝ) (h : ℕ → D) (v : D), (∀ n, 0 < t n) → Tendsto t atTop (𝓝 0) →
    Tendsto h atTop (𝓝 v) → v ∈ D₀ → (∀ n, θ + t n • h n ∈ dom) →
    Tendsto (fun n ↦ (t n)⁻¹ • (φ (θ + t n • h n) - φ θ)) atTop (𝓝 (φ' v))

/-- **4.1** The chain rule for Hadamard derivatives. -/
theorem HasHadamardDerivWithinAt.comp {D E F : Type*} [NormedAddCommGroup D] [NormedSpace ℝ D]
    [NormedAddCommGroup E] [NormedSpace ℝ E] [NormedAddCommGroup F] [NormedSpace ℝ F]
    {φ : D → E} {ψ : E → F} {domφ D₀ : Set D} {domψ E₀ : Set E} {φ' : D →L[ℝ] E}
    {ψ' : E →L[ℝ] F} {θ : D} (hφ : HasHadamardDerivWithinAt φ domφ D₀ φ' θ)
    (hψ : HasHadamardDerivWithinAt ψ domψ E₀ ψ' (φ θ)) (hmaps : MapsTo φ domφ domψ)
    (htan : MapsTo φ' D₀ E₀) :
    HasHadamardDerivWithinAt (ψ ∘ φ) domφ D₀ (ψ'.comp φ') θ := sorry

/-- **4.1** The quantile functional `z ↦ inf {x | p ≤ z x}` on `ℓ^∞(ℝ)`. -/
def quantileFunctional (p : ℝ) (z : Linfty ℝ) : ℝ := sInf {x | p ≤ (z : ℝ → ℝ) x}

/-- **4.1** The quantile functional is Hadamard differentiable at a distribution function with a
positive derivative at its `p`-quantile, within the monotone functions and tangentially to the
functions continuous at that quantile, with derivative `h ↦ -h ξ / f ξ`. -/
theorem hasHadamardDerivWithinAt_quantileFunctional (P : Measure ℝ) [IsProbabilityMeasure P]
    {p : ℝ} (hp0 : 0 < p) (hp1 : p < 1) {ξ f : ℝ} (hξ : cdf P ξ = p)
    (hderiv : HasDerivAt (cdf P) f ξ) (hf : 0 < f) :
    HasHadamardDerivWithinAt (quantileFunctional p)
      {z | Monotone (z : ℝ → ℝ)} {h | ContinuousAt (h : ℝ → ℝ) ξ}
      ((-f⁻¹) • lp.evalCLM ℝ (fun _ : ℝ ↦ ℝ) ∞ ξ)
      (liftLinfty fun t ↦ cdf P t) := sorry

variable {Ω : ℕ → Type*} [∀ n, MeasurableSpace (Ω n)]

/-- **4.2** The functional delta method for outer weak convergence to a separable limit
concentrated on the tangent set. -/
theorem tendstoInOuterDistribution_functional_delta_method {D F : Type*} [NormedAddCommGroup D]
    [NormedSpace ℝ D] [MeasurableSpace D] [BorelSpace D] [NormedAddCommGroup F] [NormedSpace ℝ F]
    [MeasurableSpace F] [BorelSpace F] (μ : ∀ n, Measure (Ω n)) [∀ n, IsProbabilityMeasure (μ n)]
    (Tn : ∀ n, Ω n → D) (θ : D) (r : ℕ → ℝ) (hr : Tendsto r atTop atTop) (φ : D → F)
    (dom D₀ : Set D) (hdom : ∀ n ω, Tn n ω ∈ dom) (φ' : D →L[ℝ] F)
    (hφ : HasHadamardDerivWithinAt φ dom D₀ φ' θ) (L : Measure D) [IsProbabilityMeasure L]
    (hsep : ∃ S ⊆ D₀, TopologicalSpace.IsSeparable S ∧ MeasurableSet S ∧ L S = 1)
    (h : TendstoInOuterDistribution (fun (n : ℕ) ω ↦ r n • (Tn n ω - θ)) atTop L μ) :
    TendstoInOuterDistribution (fun (n : ℕ) ω ↦ r n • (φ (Tn n ω) - φ θ)) atTop (L.map φ') μ ∧
      TendstoInProbability μ
        (fun (n : ℕ) ω ↦ r n • (φ (Tn n ω) - φ θ) - φ' (r n • (Tn n ω - θ))) atTop 0 := sorry

/-- **4.3** The argmax continuous mapping theorem. The estimators are uniformly tight: for
every `ε > 0` a compact set carries them with outer probability at least `1 - ε` eventually. -/
theorem tendstoInOuterDistribution_argmax {H : Type*} [MetricSpace H] [MeasurableSpace H]
    [BorelSpace H] (μ : ∀ n, Measure (Ω n)) [∀ n, IsProbabilityMeasure (μ n)]
    (M : ∀ n, Ω n → H → ℝ) {Ω' : Type*} [MeasurableSpace Ω'] (μ' : Measure Ω')
    [IsProbabilityMeasure μ'] (M₀ : Ω' → H → ℝ)
    (hbdd : ∀ K : Set H, IsCompact K → (∀ n ω, Bornology.IsBounded (M n ω '' K)) ∧
      ∀ ω, Bornology.IsBounded (M₀ ω '' K))
    (hlim : ∀ K : Set H, IsCompact K →
      AEMeasurable (fun ω ↦ liftLinfty fun h : K ↦ M₀ ω h) μ' ∧
      TendstoInOuterDistribution (fun (n : ℕ) ω ↦ liftLinfty fun h : K ↦ M n ω h) atTop
        (μ'.map fun ω ↦ liftLinfty fun h : K ↦ M₀ ω h) μ)
    (T : Ω' → H) (hT : Measurable T) (hTtight : IsTightMeasureSet {μ'.map T})
    (husc : ∀ᵐ ω ∂μ', UpperSemicontinuous (M₀ ω))
    (huniq : ∀ᵐ ω ∂μ', ∀ h, h ≠ T ω → M₀ ω h < M₀ ω (T ω))
    (Tn : ∀ n, Ω n → H) (htight : ∀ ε > 0, ∃ K : Set H, IsCompact K ∧
      ∀ᶠ n in atTop, (μ n).real {ω | Tn n ω ∉ K} ≤ ε) (R : ∀ n, Ω n → ℝ)
    (hR : TendstoInProbability μ R atTop 0) (hmax : ∀ n ω h, M n ω h ≤ M n ω (Tn n ω) + R n ω) :
    TendstoInOuterDistribution Tn atTop (μ'.map T) μ := sorry

end Layer4

/-! ## Layer 5: M- and Z-estimators, maximum likelihood and quantiles -/

section Layer5

variable {X : Type*} [MeasurableSpace X] {k : ℕ}

local notation "𝔼ₖ" => EuclideanSpace ℝ (Fin k)

/-- The law of an i.i.d. sample of size `n`. -/
local notation "ℙ[" P "," n "]" => Measure.pi fun _ : Fin n ↦ P

/-- **5.1** Consistency of approximate maximizers of random criteria under uniform convergence
in outer probability and a well-separated maximum. -/
theorem tendstoInProbability_of_isWellSeparated {Θ : Type*} [MetricSpace Θ]
    {Ω : ℕ → Type*} [∀ n, MeasurableSpace (Ω n)] (μ : ∀ n, Measure (Ω n))
    (Mn : ∀ n, Ω n → Θ → ℝ) (M : Θ → ℝ) (θ₀ : Θ)
    (hunif : TendstoInProbability μ (fun (n : ℕ) ω ↦ ⨆ θ, |Mn n ω θ - M θ|) atTop 0)
    (hbdd : ∀ n ω, BddAbove (range fun θ ↦ |Mn n ω θ - M θ|))
    (hsep : ∀ ε > 0, ∃ η > 0, ∀ θ, ε ≤ dist θ θ₀ → M θ ≤ M θ₀ - η)
    (θhat : ∀ n, Ω n → Θ) (R : ∀ n, Ω n → ℝ) (hR : TendstoInProbability μ R atTop 0)
    (hmax : ∀ n ω, Mn n ω θ₀ ≤ Mn n ω (θhat n ω) + R n ω) :
    TendstoInProbability μ θhat atTop θ₀ := sorry

/-- **5.2** Wald's consistency theorem for maximum likelihood on a compact parameter space. Every
`p θ` is a probability density with respect to `ν`. -/
theorem tendstoInProbability_mle_of_isCompact {Θ : Type*} [MetricSpace Θ] [CompactSpace Θ]
    (ν : Measure X) (p : Θ → X → ℝ) (hp : ∀ θ, Measurable (p θ) ∧ ∀ x, 0 < p θ x)
    (θ₀ : Θ) [IsProbabilityMeasure (ν.withDensity fun x ↦ ENNReal.ofReal (p θ₀ x))]
    (hnorm : ∀ θ, IsProbabilityMeasure (ν.withDensity fun x ↦ ENNReal.ofReal (p θ x)))
    (hident : ∀ θ, ν.withDensity (fun x ↦ ENNReal.ofReal (p θ x)) =
      ν.withDensity (fun x ↦ ENNReal.ofReal (p θ₀ x)) → θ = θ₀)
    (husc : ∀ᵐ x ∂ν, UpperSemicontinuous fun θ ↦ Real.log (p θ x))
    (hball : ∀ θ, ∃ r > 0, Measurable (fun x ↦ ⨆ θ' : Metric.ball θ r,
        Real.log (p θ'.1 x) - Real.log (p θ₀ x)) ∧
      ∫⁻ x, ENNReal.ofReal (⨆ θ' : Metric.ball θ r, Real.log (p θ'.1 x) - Real.log (p θ₀ x))
        ∂(ν.withDensity fun x ↦ ENNReal.ofReal (p θ₀ x)) < ⊤)
    (θhat : ∀ n, (Fin n → X) → Θ) (R : ∀ n, (Fin n → X) → ℝ)
    (hR : TendstoInProbability (fun n ↦ ℙ[ν.withDensity fun x ↦ ENNReal.ofReal (p θ₀ x), n])
      (fun (n : ℕ) x ↦ R n x / n) atTop 0)
    (hmax : ∀ n x, ∑ i, Real.log (p θ₀ (x i)) ≤ ∑ i, Real.log (p (θhat n x) (x i)) + R n x) :
    TendstoInProbability (fun n ↦ ℙ[ν.withDensity fun x ↦ ENNReal.ofReal (p θ₀ x), n]) θhat
      atTop θ₀ := sorry

/-- **5.3** The Z-estimator theorem with Donsker conditions: asymptotic linearity of a
consistent approximate zero of an empirical estimating equation. -/
theorem zEstimator_asymptotically_linear (P : Measure X) [IsProbabilityMeasure P]
    (ψ : 𝔼ₖ → X → 𝔼ₖ) (hψ : ∀ θ, Measurable (ψ θ)) (θ₀ : 𝔼ₖ) (δ : ℝ) (hδ : 0 < δ)
    (hdonsker : ∀ j : Fin k, IsDonsker P (fun θ : Metric.ball θ₀ δ ↦ fun x ↦ ψ θ x j))
    (hL2 : ∀ θ, MemLp (ψ θ) 2 P)
    (hcont : Tendsto (fun θ ↦ eLpNorm (fun x ↦ ψ θ x - ψ θ₀ x) 2 P) (𝓝 θ₀) (𝓝 0))
    (hzero : ∫ x, ψ θ₀ x ∂P = 0) (V : Matrix (Fin k) (Fin k) ℝ) (hV : V.det ≠ 0)
    (hdiff : HasFDerivAt (fun θ ↦ ∫ x, ψ θ x ∂P) (Matrix.toEuclideanCLM (𝕜 := ℝ) V) θ₀)
    (θhat : ∀ n, (Fin n → X) → 𝔼ₖ)
    (hcons : TendstoInProbability (fun n ↦ ℙ[P, n]) θhat atTop θ₀)
    (happrox : TendstoInProbability (fun n ↦ ℙ[P, n])
      (fun (n : ℕ) x ↦ (Real.sqrt n)⁻¹ • ∑ i, ψ (θhat n x) (x i)) atTop 0) :
    TendstoInProbability (fun n ↦ ℙ[P, n])
      (fun (n : ℕ) x ↦ Real.sqrt n • (θhat n x - θ₀) +
        Matrix.toEuclideanCLM (𝕜 := ℝ) V⁻¹ ((Real.sqrt n)⁻¹ • ∑ i, ψ θ₀ (x i))) atTop 0 := sorry

/-- **5.3** Asymptotic normality of Z-estimators: the limit is `N(0, V⁻¹ Σ V⁻ᵀ)`. -/
theorem zEstimator_tendstoInDistribution (P : Measure X) [IsProbabilityMeasure P]
    (ψ : 𝔼ₖ → X → 𝔼ₖ) (θ₀ : 𝔼ₖ) (hL2 : MemLp (ψ θ₀) 2 P) (hzero : ∫ x, ψ θ₀ x ∂P = 0)
    (hmeas : Measurable (ψ θ₀)) (V : Matrix (Fin k) (Fin k) ℝ) (θhat : ∀ n, (Fin n → X) → 𝔼ₖ)
    (hθhat : ∀ n, Measurable (θhat n))
    (hlin : TendstoInProbability (fun n ↦ ℙ[P, n])
      (fun (n : ℕ) x ↦ Real.sqrt n • (θhat n x - θ₀) +
        Matrix.toEuclideanCLM (𝕜 := ℝ) V⁻¹ ((Real.sqrt n)⁻¹ • ∑ i, ψ θ₀ (x i))) atTop 0)
    {Ω' : Type*} [MeasurableSpace Ω'] {μ' : Measure Ω'} [IsProbabilityMeasure μ'] {Z : Ω' → 𝔼ₖ}
    (hZ : HasLaw Z (multivariateGaussian 0
      (V⁻¹ * TauCeti.covMatrix (P.map (ψ θ₀)) * V⁻¹ᵀ)) μ') :
    TendstoInDistribution (fun (n : ℕ) x ↦ Real.sqrt n • (θhat n x - θ₀)) atTop Z
      (fun n ↦ ℙ[P, n]) μ' := sorry

/-- **5.3** The classical Z-estimator theorem: let `θ ↦ ψ_θ(x)` be twice continuously
differentiable on a ball around `θ₀` with second derivatives dominated by an integrable `D`,
`P ψ_{θ₀} = 0`, `ψ_{θ₀} ∈ L²(P)` and `V = P ψ̇_{θ₀}` invertible. Then every consistent
approximate root of `∑ᵢ ψ_θ(xᵢ) = 0` is asymptotically linear with influence
function `-V⁻¹ψ_{θ₀}`. The case `ψ_θ = ℓ̇_θ` is the asymptotic normality of maximum
likelihood. -/
theorem zEstimator_asymptotically_linear_of_contDiffOn (P : Measure X) [IsProbabilityMeasure P]
    (ψ : 𝔼ₖ → X → 𝔼ₖ) (hψ : ∀ θ, Measurable (ψ θ)) (θ₀ : 𝔼ₖ) (r : ℝ) (hr : 0 < r)
    (D : X → ℝ) (hD : Integrable D P)
    (hC2 : ∀ x, ContDiffOn ℝ 2 (fun θ ↦ ψ θ x) (Metric.ball θ₀ r))
    (hdom : ∀ x, ∀ θ ∈ Metric.ball θ₀ r, ‖iteratedFDeriv ℝ 2 (fun θ ↦ ψ θ x) θ‖ ≤ D x)
    (hzero : ∫ x, ψ θ₀ x ∂P = 0) (hL2 : MemLp (ψ θ₀) 2 P)
    (hint : Integrable (fun x ↦ fderiv ℝ (fun θ ↦ ψ θ x) θ₀) P) (V : 𝔼ₖ ≃L[ℝ] 𝔼ₖ)
    (hV : ∫ x, fderiv ℝ (fun θ ↦ ψ θ x) θ₀ ∂P = (V : 𝔼ₖ →L[ℝ] 𝔼ₖ)) (θhat : ∀ n, (Fin n → X) → 𝔼ₖ)
    (hcons : TendstoInProbability (fun n ↦ ℙ[P, n]) θhat atTop θ₀)
    (happrox : TendstoInProbability (fun n ↦ ℙ[P, n])
      (fun (n : ℕ) x ↦ (Real.sqrt n)⁻¹ • ∑ i, ψ (θhat n x) (x i)) atTop 0) :
    TendstoInProbability (fun n ↦ ℙ[P, n])
      (fun (n : ℕ) x ↦ Real.sqrt n • (θhat n x - θ₀) +
        V.symm ((Real.sqrt n)⁻¹ • ∑ i, ψ θ₀ (x i))) atTop 0 := sorry

/-- **5.3** Existence of consistent roots: under the hypotheses of
`zEstimator_asymptotically_linear_of_contDiffOn`, there are
estimators converging to `θ₀` in probability that are roots of `∑ᵢ ψ_θ(xᵢ) = 0` with
probability tending to one. -/
theorem exists_tendstoInProbability_root_of_contDiffOn (P : Measure X) [IsProbabilityMeasure P]
    (ψ : 𝔼ₖ → X → 𝔼ₖ) (hψ : ∀ θ, Measurable (ψ θ)) (θ₀ : 𝔼ₖ) (r : ℝ) (hr : 0 < r)
    (D : X → ℝ) (hD : Integrable D P)
    (hC2 : ∀ x, ContDiffOn ℝ 2 (fun θ ↦ ψ θ x) (Metric.ball θ₀ r))
    (hdom : ∀ x, ∀ θ ∈ Metric.ball θ₀ r, ‖iteratedFDeriv ℝ 2 (fun θ ↦ ψ θ x) θ‖ ≤ D x)
    (hzero : ∫ x, ψ θ₀ x ∂P = 0) (hL2 : MemLp (ψ θ₀) 2 P)
    (hint : Integrable (fun x ↦ fderiv ℝ (fun θ ↦ ψ θ x) θ₀) P) (V : 𝔼ₖ ≃L[ℝ] 𝔼ₖ)
    (hV : ∫ x, fderiv ℝ (fun θ ↦ ψ θ x) θ₀ ∂P = (V : 𝔼ₖ →L[ℝ] 𝔼ₖ)) :
    ∃ θhat : ∀ n, (Fin n → X) → 𝔼ₖ,
      TendstoInProbability (fun n ↦ ℙ[P, n]) θhat atTop θ₀ ∧
      Tendsto (fun n ↦ ℙ[P, n] {x | ∑ i, ψ (θhat n x) (x i) = 0}) atTop (𝓝 1) := sorry

/-- **5.4** One-step estimators: a Newton step from a `√n`-consistent preliminary estimator. -/
theorem oneStep_asymptotically_linear {Ω : ℕ → Type*} [∀ n, MeasurableSpace (Ω n)]
    (μ : ∀ n, Measure (Ω n)) [∀ n, IsProbabilityMeasure (μ n)] (Ψn : ∀ n, Ω n → 𝔼ₖ → 𝔼ₖ)
    (θ₀ : 𝔼ₖ) (V : 𝔼ₖ ≃L[ℝ] 𝔼ₖ)
    (hunif : ∀ C > 0, TendstoInProbability μ (fun (n : ℕ) ω ↦
      ⨆ θ : Metric.closedBall θ₀ (C / Real.sqrt n),
        ‖Real.sqrt n • (Ψn n ω θ - Ψn n ω θ₀) - V (Real.sqrt n • ((θ : 𝔼ₖ) - θ₀))‖) atTop 0)
    (hbdd : ∀ C > 0, ∀ (n : ℕ) ω, BddAbove (range fun θ : Metric.closedBall θ₀ (C / Real.sqrt n) ↦
      ‖Real.sqrt n • (Ψn n ω θ - Ψn n ω θ₀) - V (Real.sqrt n • ((θ : 𝔼ₖ) - θ₀))‖))
    (θtilde : ∀ n, Ω n → 𝔼ₖ) (htight : IsBoundedInProbabilityAlong μ
      (fun (n : ℕ) ω ↦ Real.sqrt n • (θtilde n ω - θ₀)) atTop)
    (Vhat : ∀ n, Ω n → 𝔼ₖ ≃L[ℝ] 𝔼ₖ)
    (hVhat : TendstoInProbability μ (fun (n : ℕ) ω ↦ ((Vhat n ω : 𝔼ₖ →L[ℝ] 𝔼ₖ))) atTop (V : 𝔼ₖ →L[ℝ] 𝔼ₖ))
    (htightΨ : IsBoundedInProbabilityAlong μ (fun (n : ℕ) ω ↦ Real.sqrt n • Ψn n ω θ₀) atTop) :
    TendstoInProbability μ (fun (n : ℕ) ω ↦ Real.sqrt n • (θtilde n ω - (Vhat n ω).symm (Ψn n ω (θtilde n ω)) - θ₀)
      + V.symm (Real.sqrt n • Ψn n ω θ₀)) atTop 0 := sorry

/-- **5.4** Discretized one-step estimators: when the preliminary estimator takes values in the
grid `n^{-1/2} ℤ^k`, the expansion of `Ψₙ` is needed only along deterministic local parameters
`θ₀ + n^{-1/2} hₙ` with `hₙ` bounded. -/
theorem oneStep_asymptotically_linear_of_discretized {Ω : ℕ → Type*} [∀ n, MeasurableSpace (Ω n)]
    (μ : ∀ n, Measure (Ω n)) [∀ n, IsProbabilityMeasure (μ n)] (Ψn : ∀ n, Ω n → 𝔼ₖ → 𝔼ₖ)
    (θ₀ : 𝔼ₖ) (V : 𝔼ₖ ≃L[ℝ] 𝔼ₖ)
    (hdet : ∀ h : ℕ → 𝔼ₖ, (∃ C, ∀ n, ‖h n‖ ≤ C) → TendstoInProbability μ (fun (n : ℕ) ω ↦
      Real.sqrt n • (Ψn n ω (θ₀ + (Real.sqrt n)⁻¹ • h n) - Ψn n ω θ₀) - V (h n)) atTop 0)
    (θtilde : ∀ n, Ω n → 𝔼ₖ) (hgrid : ∀ n ω j, ∃ z : ℤ, θtilde n ω j = z / Real.sqrt n)
    (htight : IsBoundedInProbabilityAlong μ
      (fun (n : ℕ) ω ↦ Real.sqrt n • (θtilde n ω - θ₀)) atTop)
    (Vhat : ∀ n, Ω n → 𝔼ₖ ≃L[ℝ] 𝔼ₖ)
    (hVhat : TendstoInProbability μ (fun (n : ℕ) ω ↦ ((Vhat n ω : 𝔼ₖ →L[ℝ] 𝔼ₖ))) atTop (V : 𝔼ₖ →L[ℝ] 𝔼ₖ))
    (htightΨ : IsBoundedInProbabilityAlong μ (fun (n : ℕ) ω ↦ Real.sqrt n • Ψn n ω θ₀) atTop) :
    TendstoInProbability μ (fun (n : ℕ) ω ↦ Real.sqrt n • (θtilde n ω - (Vhat n ω).symm (Ψn n ω (θtilde n ω)) - θ₀)
      + V.symm (Real.sqrt n • Ψn n ω θ₀)) atTop 0 := sorry

/-- **5.5** Asymptotic normality of M-estimators with a Lipschitz criterion. -/
theorem mEstimator_asymptotically_linear (P : Measure X) [IsProbabilityMeasure P]
    (m : 𝔼ₖ → X → ℝ) (hm : ∀ θ, Measurable (m θ)) (θ₀ : 𝔼ₖ) (mdot : X → 𝔼ₖ)
    (hdiff : ∀ᵐ x ∂P, HasGradientAt (fun θ ↦ m θ x) (mdot x) θ₀) (L : X → ℝ) (hL : MemLp L 2 P)
    (hlip : ∀ᶠ θ₁ in 𝓝 θ₀, ∀ᶠ θ₂ in 𝓝 θ₀, ∀ x, |m θ₁ x - m θ₂ x| ≤ L x * ‖θ₁ - θ₂‖)
    (V : Matrix (Fin k) (Fin k) ℝ) (hVsymm : V.IsHermitian) (hV : V.det ≠ 0)
    (htaylor : (fun θ ↦ ∫ x, m θ x ∂P - ∫ x, m θ₀ x ∂P -
        (2 : ℝ)⁻¹ * (WithLp.ofLp (θ - θ₀) ⬝ᵥ (V *ᵥ WithLp.ofLp (θ - θ₀)))) =o[𝓝 θ₀]
      fun θ ↦ ‖θ - θ₀‖ ^ 2)
    (θhat : ∀ n, (Fin n → X) → 𝔼ₖ) (hcons : TendstoInProbability (fun n ↦ ℙ[P, n]) θhat atTop θ₀)
    (R : ∀ n, (Fin n → X) → ℝ)
    (hR : TendstoInProbability (fun n ↦ ℙ[P, n]) (fun (n : ℕ) x ↦ n * R n x) atTop 0)
    (hmax : ∀ (n : ℕ) x θ, ∑ i, m θ (x i) / n ≤ ∑ i, m (θhat n x) (x i) / n + R n x) :
    TendstoInProbability (fun n ↦ ℙ[P, n])
      (fun (n : ℕ) x ↦ Real.sqrt n • (θhat n x - θ₀) +
        Matrix.toEuclideanCLM (𝕜 := ℝ) V⁻¹ ((Real.sqrt n)⁻¹ • ∑ i, mdot (x i))) atTop 0 := sorry

/-- **5.6** The rate theorem for M-estimators: a modulus `φₙ` of the centred criterion, bounding
its extended-valued outer expectation, gives the rate `rₙ` with `rₙ² φₙ(1/rₙ) ≤ √n`. -/
theorem isBoundedInProbability_rate_mEstimator {Θ : Type*} [MetricSpace Θ]
    {Ω : ℕ → Type*} [∀ n, MeasurableSpace (Ω n)] (μ : ∀ n, Measure (Ω n))
    [∀ n, IsProbabilityMeasure (μ n)] (Mn : ∀ n, Ω n → Θ → ℝ) (M : Θ → ℝ) (θ₀ : Θ)
    (c δ₀ : ℝ) (hc : 0 < c) (hδ₀ : 0 < δ₀)
    (hcurv : ∀ θ, dist θ θ₀ < δ₀ → M θ - M θ₀ ≤ -c * dist θ θ₀ ^ 2)
    (φ : ℕ → ℝ → ℝ) (a C : ℝ) (ha : a < 2) (hC : 0 ≤ C)
    (hφ : ∀ n, AntitoneOn (fun δ ↦ φ n δ / δ ^ a) (Set.Ioi 0))
    (hmod : ∀ n, 1 ≤ n → ∀ δ ∈ Set.Ioo 0 δ₀,
      outerLIntegral (μ n) (fun ω ↦ ⨆ θ : {θ // dist θ θ₀ < δ},
        ENNReal.ofReal |(Mn n ω θ - M θ) - (Mn n ω θ₀ - M θ₀)|) ≤
        ENNReal.ofReal (C * φ n δ / Real.sqrt n))
    (r : ℕ → ℝ) (hr : ∀ n, 0 < r n) (hrate : ∀ n, 1 ≤ n → r n ^ 2 * φ n (r n)⁻¹ ≤ Real.sqrt n)
    (θhat : ∀ n, Ω n → Θ) (hcons : TendstoInProbability μ θhat atTop θ₀) (R : ∀ n, Ω n → ℝ)
    (hR : IsBoundedInProbabilityAlong μ (fun (n : ℕ) ω ↦ r n ^ 2 * R n ω) atTop)
    (hmax : ∀ n ω, Mn n ω θ₀ ≤ Mn n ω (θhat n ω) + R n ω) :
    IsBoundedInProbabilityAlong μ (fun (n : ℕ) ω ↦ r n * dist (θhat n ω) θ₀) atTop := sorry

/-- **5.8** Asymptotic normality of the sample `p`-quantile. -/
theorem tendstoInDistribution_sampleQuantile (P : Measure ℝ) [IsProbabilityMeasure P]
    {p : ℝ} (hp0 : 0 < p) (hp1 : p < 1) {ξ f : ℝ} (hξ : cdf P ξ = p)
    (hderiv : HasDerivAt (cdf P) f ξ) (hf : 0 < f)
    {Ω' : Type*} [MeasurableSpace Ω'] {μ' : Measure Ω'} [IsProbabilityMeasure μ'] {Z : Ω' → ℝ}
    (hZ : HasLaw Z (gaussianReal 0 (p * (1 - p) / f ^ 2).toNNReal) μ') :
    TendstoInDistribution (fun (n : ℕ) (x : Fin n → ℝ) ↦ Real.sqrt n * (sampleQuantile x p - ξ))
      atTop Z
      (fun n ↦ ℙ[P, n]) μ' := sorry

/-- **5.8** The Bahadur representation of the sample `p`-quantile. -/
theorem tendstoInProbability_bahadur_remainder (P : Measure ℝ) [IsProbabilityMeasure P]
    {p : ℝ} (hp0 : 0 < p) (hp1 : p < 1) {ξ f : ℝ} (hξ : cdf P ξ = p)
    (hderiv : HasDerivAt (cdf P) f ξ) (hf : 0 < f) :
    TendstoInProbability (fun n ↦ ℙ[P, n])
      (fun (n : ℕ) (x : Fin n → ℝ) ↦
        Real.sqrt n * (sampleQuantile x p - ξ - (p - empiricalCdf x ξ) / f)) atTop 0 :=
  sorry

end Layer5

/-! ## Layer 6: projections, U-statistics and L-statistics -/

section Layer6

variable {X : Type*} [MeasurableSpace X]

/-- **6.1** The Hájek projection of a statistic of independent coordinates with laws `P i`:
`∑ᵢ E(T | Xᵢ) - (n - 1) E T`. -/
def hajekProjection {n : ℕ} (P : Fin n → Measure X) (T : (Fin n → X) → ℝ) (x : Fin n → X) : ℝ :=
  ∑ i, ∫ y, T (Function.update y i (x i)) ∂(Measure.pi P) - (n - 1 : ℝ) * ∫ y, T y ∂(Measure.pi P)

/-- **6.1** The Hájek projection is the `L²` projection onto sums of functions of one
coordinate: the residual is orthogonal to every such sum. -/
theorem integral_sub_hajekProjection_mul_eq_zero {n : ℕ} (P : Fin n → Measure X)
    [∀ i, IsProbabilityMeasure (P i)] (T : (Fin n → X) → ℝ) (hT : MemLp T 2 (Measure.pi P))
    (g : Fin n → X → ℝ) (hg : ∀ i, MemLp (g i) 2 (P i)) :
    ∫ x, (T x - hajekProjection P T x) * ∑ i, g i (x i) ∂(Measure.pi P) = 0 := sorry

/-- **6.1** The projection theorem: if `Sₙ` is the projection of `Tₙ` onto a closed subspace of
`L²` containing the constants, so that `Tₙ - Sₙ` is orthogonal to `Sₙ` and to `1`, and
`Var Tₙ / Var Sₙ → 1`, then the standardized difference tends to `0` in squared `L²` norm. -/
theorem tendsto_integral_sq_standardized_sub_of_isProjection {Ωn : ℕ → Type*}
    [∀ n, MeasurableSpace (Ωn n)] (μ : ∀ n, Measure (Ωn n)) [∀ n, IsProbabilityMeasure (μ n)]
    (T S : ∀ n, Ωn n → ℝ) (hT : ∀ n, MemLp (T n) 2 (μ n)) (hS : ∀ n, MemLp (S n) 2 (μ n))
    (horth : ∀ n, ∫ ω, (T n ω - S n ω) * S n ω ∂(μ n) = 0)
    (hconst : ∀ n, ∫ ω, (T n ω - S n ω) ∂(μ n) = 0)
    (hvar : Tendsto (fun n ↦ Var[T n; μ n] / Var[S n; μ n]) atTop (𝓝 1)) :
    Tendsto (fun n ↦ ∫ ω, ((T n ω - ∫ ω', T n ω' ∂(μ n)) / Real.sqrt Var[T n; μ n] -
      (S n ω - ∫ ω', S n ω' ∂(μ n)) / Real.sqrt Var[S n; μ n]) ^ 2 ∂(μ n)) atTop (𝓝 0) := sorry

/-- **6.2** Asymptotic normality of a nondegenerate U-statistic with a square-integrable
symmetric kernel: `√n (Uₙ - θ) → N(0, m² ζ₁)`. -/
theorem tendstoInDistribution_uStatistic (P : Measure X) [IsProbabilityMeasure P] (m : ℕ)
    (h : (Fin (m + 1) → X) → ℝ) (hmeas : Measurable h)
    (hsymm : ∀ (σ : Equiv.Perm (Fin (m + 1))) y, h (y ∘ σ) = h y)
    (hL2 : MemLp h 2 (Measure.pi fun _ : Fin (m + 1) ↦ P))
    {Ω' : Type*} [MeasurableSpace Ω'] {μ' : Measure Ω'} [IsProbabilityMeasure μ'] {Z : Ω' → ℝ}
    (hZ : HasLaw Z (gaussianReal 0 ((m + 1) ^ 2 *
      Var[fun x ↦ ∫ y, h (Fin.cons x y) ∂(Measure.pi fun _ : Fin m ↦ P); P]).toNNReal) μ') :
    TendstoInDistribution (fun (n : ℕ) x ↦ Real.sqrt n *
        (uStatistic (m + 1) n h x - ∫ y, h y ∂(Measure.pi fun _ : Fin (m + 1) ↦ P))) atTop Z
      (fun n ↦ Measure.pi fun _ : Fin n ↦ P) μ' := sorry

/-- **6.3** The conditional expectation `E(h(X₁, …, X_m) | X_i, i ∈ S)` of a kernel of `m`
coordinates, evaluated at `y`: the coordinates outside `S` are integrated out under `P`. -/
def hoeffdingProjection (P : Measure X) {m : ℕ} (h : (Fin m → X) → ℝ) (S : Finset (Fin m))
    (y : Fin m → X) : ℝ :=
  ∫ z, h (fun i ↦ if i ∈ S then y i else z i) ∂(Measure.pi fun _ : Fin m ↦ P)

/-- **6.3** The Hoeffding kernel `h_S = ∑_{T ⊆ S} (-1)^{|S| - |T|} E(h | X_T)`. -/
def hoeffdingKernel (P : Measure X) {m : ℕ} (h : (Fin m → X) → ℝ) (S : Finset (Fin m))
    (y : Fin m → X) : ℝ :=
  ∑ T ∈ S.powerset, (-1 : ℝ) ^ (S.card - T.card) * hoeffdingProjection P h T y

/-- **6.3** The Hoeffding decomposition of a U-statistic of a square-integrable symmetric kernel
of order `m ≤ n`: `Uₙ - θ` is the sum over nonempty `S` of the U-statistics of the Hoeffding
kernels `h_S`, each `h_S` is canonical (its integral in any one coordinate of `S` vanishes), and
`Var Uₙ = ∑_{j=1}^m C(m, j)² / C(n, j) · E h_{S_j}²` with `S_j = {0, …, j - 1}`. -/
theorem uStatistic_hoeffding_decomposition (P : Measure X) [IsProbabilityMeasure P] {m n : ℕ}
    (hmn : m ≤ n) (h : (Fin m → X) → ℝ) (hmeas : Measurable h)
    (hsymm : ∀ (σ : Equiv.Perm (Fin m)) y, h (y ∘ σ) = h y)
    (hL2 : MemLp h 2 (Measure.pi fun _ : Fin m ↦ P)) :
    (∀ x : Fin n → X, uStatistic m n h x - ∫ y, h y ∂(Measure.pi fun _ : Fin m ↦ P) =
      ∑ S ∈ Finset.univ.filter (fun S : Finset (Fin m) ↦ S.Nonempty),
        uStatistic m n (hoeffdingKernel P h S) x) ∧
    (∀ S : Finset (Fin m), ∀ i ∈ S, ∀ᵐ y ∂(Measure.pi fun _ : Fin m ↦ P),
      ∫ z, hoeffdingKernel P h S (Function.update y i z) ∂P = 0) ∧
    Var[uStatistic m n h; Measure.pi fun _ : Fin n ↦ P] =
      ∑ j ∈ Finset.Icc 1 m, ((m.choose j : ℝ) ^ 2 / n.choose j) *
        ∫ y, hoeffdingKernel P h (Finset.univ.filter fun i : Fin m ↦ (i : ℕ) < j) y ^ 2
          ∂(Measure.pi fun _ : Fin m ↦ P) := sorry

/-- **6.3** The limit law of a degenerate quadratic U-statistic: `n Uₙ → ∑ λⱼ (Zⱼ² - 1)`, for
the eigenvalues `λⱼ` and orthonormal eigenfunctions `φⱼ` of the kernel operator. A finite
expansion is padded with `λⱼ = 0`; orthonormality is required only for the indices with
`λⱼ ≠ 0`. -/
theorem tendstoInDistribution_degenerate_uStatistic (P : Measure X) [IsProbabilityMeasure P]
    (h : X → X → ℝ) (hmeas : Measurable (Function.uncurry h)) (hsymm : ∀ x y, h x y = h y x)
    (hL2 : MemLp (Function.uncurry h) 2 (P.prod P)) (hdeg : ∀ x, ∫ y, h x y ∂P = 0)
    (lam : ℕ → ℝ) (φ : ℕ → X → ℝ) (hφ : ∀ j, MemLp (φ j) 2 P)
    (horth : ∀ i j, lam i ≠ 0 → lam j ≠ 0 → ∫ x, φ i x * φ j x ∂P = if i = j then 1 else 0)
    (hexp : Tendsto (fun N ↦ eLpNorm (fun z : X × X ↦
      h z.1 z.2 - ∑ j ∈ Finset.range N, lam j * φ j z.1 * φ j z.2) 2 (P.prod P)) atTop (𝓝 0))
    {Ω' : Type*} [MeasurableSpace Ω'] {μ' : Measure Ω'} [IsProbabilityMeasure μ']
    (Zs : ℕ → Ω' → ℝ) (hZs : iIndepFun Zs μ') (hZlaw : ∀ j, HasLaw (Zs j) (gaussianReal 0 1) μ')
    (W : Ω' → ℝ) (hW : Tendsto (fun N ↦ eLpNorm (fun ω ↦
      W ω - ∑ j ∈ Finset.range N, lam j * (Zs j ω ^ 2 - 1)) 2 μ') atTop (𝓝 0)) :
    TendstoInDistribution (fun (n : ℕ) x ↦ (n : ℝ) * uStatistic 2 n (fun y ↦ h (y 0) (y 1)) x)
      atTop W (fun n ↦ Measure.pi fun _ : Fin n ↦ P) μ' := sorry

/-- **6.4** The L-statistic `n⁻¹ ∑ᵢ φ(i / (n + 1)) X₍ᵢ₎`. -/
def lStatistic (φ : ℝ → ℝ) {n : ℕ} (x : Fin n → ℝ) : ℝ :=
  (n : ℝ)⁻¹ * ∑ i : Fin n, φ ((i + 1 : ℕ) / (n + 1 : ℝ)) * x (Tuple.sort x i)

/-- **6.4** Asymptotic normality of L-statistics with a bounded score function. -/
theorem tendstoInDistribution_lStatistic (P : Measure ℝ) [IsProbabilityMeasure P]
    (h2 : MemLp id 2 P) (φ : ℝ → ℝ) (hφ : ∃ C, ∀ u ∈ Set.Ioo (0 : ℝ) 1, |φ u| ≤ C)
    (hcont : ∀ᵐ y ∂volume, ContinuousAt φ (cdf P y))
    {Ω' : Type*} [MeasurableSpace Ω'] {μ' : Measure Ω'} [IsProbabilityMeasure μ'] {Z : Ω' → ℝ}
    (hZ : HasLaw Z (gaussianReal 0 (∫ x, ∫ y, φ (cdf P x) * φ (cdf P y) *
      (cdf P (min x y) - cdf P x * cdf P y)).toNNReal) μ') :
    TendstoInDistribution (fun (n : ℕ) x ↦ Real.sqrt n * (lStatistic φ x -
        ∫ y, lStatistic φ y ∂(Measure.pi fun _ : Fin n ↦ P))) atTop Z
      (fun n ↦ Measure.pi fun _ : Fin n ↦ P) μ' := sorry

/-- **6.4** The `α`-trimmed mean: the average of the order statistics `X₍ᵢ₎` with
`⌊αn⌋ < i ≤ n - ⌊αn⌋` (one-based). -/
def trimmedMean (α : ℝ) {n : ℕ} (x : Fin n → ℝ) : ℝ :=
  ((n : ℝ) - 2 * ⌊α * n⌋₊)⁻¹ * ∑ i : Fin n,
    if ⌊α * n⌋₊ ≤ (i : ℕ) ∧ (i : ℕ) < n - ⌊α * n⌋₊ then x (Tuple.sort x i) else 0

/-- **6.4** Asymptotic normality of the trimmed mean without moment conditions, when `F` has no
flats at heights `α` and `1 - α`: the centring is `(1 - 2α)⁻¹ ∫_α^{1-α} F⁻¹(u) du` and the
variance `(1 - 2α)⁻² ∫_a^b ∫_a^b (F(x ∧ y) - F(x)F(y)) dx dy` with `a = F⁻¹(α)`,
`b = F⁻¹(1 - α)`. -/
theorem tendstoInDistribution_trimmedMean (P : Measure ℝ) [IsProbabilityMeasure P] (α : ℝ)
    (hα0 : 0 < α) (hα1 : α < 1 / 2)
    (hflat : volume {x | cdf P x = α ∨ cdf P x = 1 - α} = 0)
    {Ω' : Type*} [MeasurableSpace Ω'] {μ' : Measure Ω'} [IsProbabilityMeasure μ'] {Z : Ω' → ℝ}
    (hZ : HasLaw Z (gaussianReal 0 ((1 - 2 * α)⁻¹ ^ 2 *
      ∫ x in P.quantile α..P.quantile (1 - α), ∫ y in P.quantile α..P.quantile (1 - α),
        (cdf P (min x y) - cdf P x * cdf P y)).toNNReal) μ') :
    TendstoInDistribution (fun (n : ℕ) x ↦ Real.sqrt n * (trimmedMean α x -
        (1 - 2 * α)⁻¹ * ∫ u in α..1 - α, P.quantile u)) atTop Z
      (fun n ↦ Measure.pi fun _ : Fin n ↦ P) μ' := sorry

end Layer6

/-! ## Layer 7: contiguity, local asymptotic normality and the limits of experiments -/

section Layer7

variable {Ω : ℕ → Type*} [∀ n, MeasurableSpace (Ω n)] {k m : ℕ}

local notation "𝔼ₖ" => EuclideanSpace ℝ (Fin k)

/-- The law of the likelihood ratio `dQ / dP` under `P`, as a probability measure on `ℝ`. -/
def likelihoodRatioLaw {Ω₀ : Type*} [MeasurableSpace Ω₀] (P Q : Measure Ω₀)
    [IsProbabilityMeasure P] : ProbabilityMeasure ℝ :=
  ⟨P.map fun ω ↦ (Q.rnDeriv P ω).toReal, inferInstance⟩

/-- **7.1** Le Cam's first lemma: if every cluster point of the laws of `dQₙ / dPₙ` under `Pₙ` has
mean one, then `Qₙ` is contiguous to `Pₙ`; and conversely. -/
theorem isContiguous_iff_forall_mapClusterPt_integral_eq_one (P Q : ∀ n, Measure (Ω n))
    [∀ n, IsProbabilityMeasure (P n)] [∀ n, IsProbabilityMeasure (Q n)] :
    IsContiguous atTop P Q ↔ ∀ V : ProbabilityMeasure ℝ,
      MapClusterPt V atTop (fun n ↦ likelihoodRatioLaw (P n) (Q n)) →
        ∫ v, v ∂(V : Measure ℝ) = 1 := sorry

/-- **7.2** Le Cam's third lemma: under contiguity, joint convergence with the likelihood ratio
under `Pₙ` gives convergence under `Qₙ` to the law `B ↦ E 1_B(X) V`. -/
theorem tendstoInDistribution_leCam_third {E : Type*} [PseudoMetricSpace E]
    [SecondCountableTopology E] [MeasurableSpace E] [BorelSpace E] (P Q : ∀ n, Measure (Ω n))
    [∀ n, IsProbabilityMeasure (P n)] [∀ n, IsProbabilityMeasure (Q n)]
    (hcont : IsContiguous atTop P Q) (Xn : ∀ n, Ω n → E) (hX : ∀ n, Measurable (Xn n))
    (J : Measure (E × ℝ)) [IsProbabilityMeasure J]
    (hJ : TendstoInDistribution (fun n ω ↦ (Xn n ω, ((Q n).rnDeriv (P n) ω).toReal)) atTop id P J) :
    IsProbabilityMeasure ((J.withDensity fun z ↦ ENNReal.ofReal z.2).map Prod.fst) ∧
      ∀ _ : IsProbabilityMeasure ((J.withDensity fun z ↦ ENNReal.ofReal z.2).map Prod.fst),
        TendstoInDistribution Xn atTop id Q ((J.withDensity fun z ↦ ENNReal.ofReal z.2).map Prod.fst)
          := sorry

/-- **7.2** Le Cam's third lemma, Gaussian form: if `(Sₙ, dQₙ/dPₙ) → (S, e^Λ)` under `Pₙ` with
`(S, Λ)` jointly Gaussian and `Λ ~ N(-σ²/2, σ²)`, then under `Qₙ` the limit is `S + τ` with
`τ = Cov(S, Λ)`. -/
theorem tendstoInDistribution_leCam_third_gaussian (P Q : ∀ n, Measure (Ω n))
    [∀ n, IsProbabilityMeasure (P n)] [∀ n, IsProbabilityMeasure (Q n)] (Sn : ∀ n, Ω n → 𝔼ₖ)
    (hS : ∀ n, Measurable (Sn n)) {Ω' : Type*} [MeasurableSpace Ω'] {μ' : Measure Ω'}
    [IsProbabilityMeasure μ'] (S : Ω' → 𝔼ₖ) (Λ : Ω' → ℝ)
    (hG : HasGaussianLaw (fun ω ↦ WithLp.toLp 2 (S ω, Λ ω)) μ') (σ : ℝ≥0)
    (hΛ : HasLaw Λ (gaussianReal (-(σ : ℝ) ^ 2 / 2) (σ ^ 2)) μ')
    (hJ : TendstoInDistribution (fun n ω ↦ (Sn n ω, ((Q n).rnDeriv (P n) ω).toReal)) atTop
      (fun ω ↦ (S ω, Real.exp (Λ ω))) P μ') (τ : 𝔼ₖ)
    (hτ : ∀ i, cov[fun ω ↦ S ω i, Λ; μ'] = τ i) :
    TendstoInDistribution Sn atTop (fun ω ↦ S ω + τ) Q μ' := sorry

variable {X : Type*} [MeasurableSpace X]

/-- **7.3** Differentiability in quadratic mean of a family of densities `p` with respect to `ν`,
within a set `s` at `θ`, with score `ℓ̇`. -/
def HasQMDWithinAt (ν : Measure X) (p : 𝔼ₖ → X → ℝ) (s : Set 𝔼ₖ) (θ : 𝔼ₖ)
    (score : X → 𝔼ₖ) : Prop :=
  MemLp score 2 (ν.withDensity fun x ↦ ENNReal.ofReal (p θ x)) ∧
    Tendsto (fun η ↦ (‖η - θ‖ ^ 2)⁻¹ * ∫ x, (Real.sqrt (p η x) - Real.sqrt (p θ x) -
      (2 : ℝ)⁻¹ * ⟪η - θ, score x⟫_ℝ * Real.sqrt (p θ x)) ^ 2 ∂ν) (𝓝[s] θ) (𝓝 0)

/-- Local copy of the information matrix of `MathematicalStatisticsFoundations` 4.3: the
matrix `E ℓ̇ ℓ̇ᵀ` of a score `ℓ̇` under `P`. -/
def fisherInformation (P : Measure X) (score : X → 𝔼ₖ) : Matrix (Fin k) (Fin k) ℝ :=
  Matrix.of fun i j ↦ ∫ x, score x i * score x j ∂P

/-- **7.3** Local asymptotic normality of the product experiments of a model that is
differentiable in quadratic mean: along local parameters `hₙ → h` with `θ + hₙ / √n ∈ s`, the
likelihood ratio is `exp(⟪h, Δₙ⟫ - hᵀ I h / 2 + o_P(1))` with the normalized score `Δₙ`. -/
theorem tendstoInProbability_likelihoodRatio_of_hasQMDWithinAt (ν : Measure X)
    (p : 𝔼ₖ → X → ℝ) (hp : ∀ θ, Measurable (p θ) ∧ 0 ≤ p θ)
    (hprob : ∀ θ, IsProbabilityMeasure (ν.withDensity fun x ↦ ENNReal.ofReal (p θ x)))
    (s : Set 𝔼ₖ) (θ : 𝔼ₖ) (score : X → 𝔼ₖ) (hscore : Measurable score)
    (hqmd : HasQMDWithinAt ν p s θ score) (h : ℕ → 𝔼ₖ) (h₀ : 𝔼ₖ)
    (hh : Tendsto h atTop (𝓝 h₀)) (hs : ∀ n : ℕ, θ + (Real.sqrt n)⁻¹ • h n ∈ s) :
    TendstoInProbability
      (fun n ↦ Measure.pi fun _ : Fin n ↦ ν.withDensity fun x ↦ ENNReal.ofReal (p θ x))
      (fun (n : ℕ) x ↦ ((Measure.pi fun _ : Fin n ↦ ν.withDensity fun y ↦
          ENNReal.ofReal (p (θ + (Real.sqrt n)⁻¹ • h n) y)).rnDeriv
        (Measure.pi fun _ : Fin n ↦ ν.withDensity fun y ↦ ENNReal.ofReal (p θ y)) x).toReal *
        Real.exp (-⟪h₀, (Real.sqrt n)⁻¹ • ∑ i, score (x i)⟫_ℝ +
          (2 : ℝ)⁻¹ * (WithLp.ofLp h₀ ⬝ᵥ (fisherInformation
            (ν.withDensity fun y ↦ ENNReal.ofReal (p θ y)) score *ᵥ WithLp.ofLp h₀)))) atTop 1 :=
  sorry

/-- **7.3** Asymptotic linearity of maximum likelihood in a model differentiable in quadratic
mean at `θ₀` with nonsingular information and a log-likelihood that is Lipschitz near `θ₀` with
a square-integrable constant: a consistent near-maximizer of the log-likelihood satisfies
`√n(θ̂ₙ - θ₀) = I⁻¹ n^{-1/2} ∑ᵢ ℓ̇(xᵢ) + o_P(1)`. -/
theorem mle_asymptotically_linear_of_hasQMDWithinAt (ν : Measure X) (p : 𝔼ₖ → X → ℝ)
    (hp : ∀ θ, Measurable (p θ) ∧ 0 ≤ p θ)
    (hprob : ∀ θ, IsProbabilityMeasure (ν.withDensity fun x ↦ ENNReal.ofReal (p θ x)))
    (θ₀ : 𝔼ₖ) (score : X → 𝔼ₖ) (hscore : Measurable score)
    (hqmd : HasQMDWithinAt ν p univ θ₀ score)
    (hI : (fisherInformation (ν.withDensity fun x ↦ ENNReal.ofReal (p θ₀ x)) score).det ≠ 0)
    (r : ℝ) (hr : 0 < r) (L : X → ℝ)
    (hL : MemLp L 2 (ν.withDensity fun x ↦ ENNReal.ofReal (p θ₀ x)))
    (hpos : ∀ᵐ x ∂(ν.withDensity fun x ↦ ENNReal.ofReal (p θ₀ x)),
      ∀ θ ∈ Metric.ball θ₀ r, 0 < p θ x)
    (hlip : ∀ᵐ x ∂(ν.withDensity fun x ↦ ENNReal.ofReal (p θ₀ x)),
      ∀ θ₁ ∈ Metric.ball θ₀ r, ∀ θ₂ ∈ Metric.ball θ₀ r,
        |Real.log (p θ₁ x) - Real.log (p θ₂ x)| ≤ L x * ‖θ₁ - θ₂‖)
    (θhat : ∀ n, (Fin n → X) → 𝔼ₖ)
    (hcons : TendstoInProbability
      (fun n ↦ Measure.pi fun _ : Fin n ↦ ν.withDensity fun x ↦ ENNReal.ofReal (p θ₀ x))
      θhat atTop θ₀)
    (R : ∀ n, (Fin n → X) → ℝ)
    (hR : TendstoInProbability
      (fun n ↦ Measure.pi fun _ : Fin n ↦ ν.withDensity fun x ↦ ENNReal.ofReal (p θ₀ x))
      (fun (n : ℕ) x ↦ n * R n x) atTop 0)
    (hmax : ∀ (n : ℕ) x θ, ∑ i, Real.log (p θ (x i)) / n ≤
      ∑ i, Real.log (p (θhat n x) (x i)) / n + R n x) :
    TendstoInProbability
      (fun n ↦ Measure.pi fun _ : Fin n ↦ ν.withDensity fun x ↦ ENNReal.ofReal (p θ₀ x))
      (fun (n : ℕ) x ↦ Real.sqrt n • (θhat n x - θ₀) -
        Matrix.toEuclideanCLM (𝕜 := ℝ)
          (fisherInformation (ν.withDensity fun x ↦ ENNReal.ofReal (p θ₀ x)) score)⁻¹
          ((Real.sqrt n)⁻¹ • ∑ i, score (x i))) atTop 0 := sorry

/-- **7.3** The Kullback–Leibler expansion `KL(P_{θ+h} ‖ P_θ) = ½ hᵀ I h + o(‖h‖²)`, when the
densities near `θ` share a support `A`, and `h ↦ p_{θ+h}(x)` and
`h ↦ p_{θ+h}(x) log(p_{θ+h}(x) / p_θ(x))` are twice continuously differentiable near `0` with
first and second derivatives dominated by a `ν`-integrable `D`; `I` is the information of the
score `ṗ_θ / p_θ`. -/
theorem isLittleO_klDiv_sub_quadForm (ν : Measure X) (p : 𝔼ₖ → X → ℝ)
    (hp : ∀ θ, Measurable (p θ) ∧ 0 ≤ p θ)
    (hprob : ∀ θ, IsProbabilityMeasure (ν.withDensity fun x ↦ ENNReal.ofReal (p θ x)))
    (θ : 𝔼ₖ) (r : ℝ) (hr : 0 < r) (A : Set X) (hA : MeasurableSet A)
    (hsupp : ∀ h ∈ Metric.ball (0 : 𝔼ₖ) r, ∀ x, 0 < p (θ + h) x ↔ x ∈ A)
    (hC2 : ∀ x, ContDiffOn ℝ 2 (fun h ↦ p (θ + h) x) (Metric.ball 0 r) ∧
      ContDiffOn ℝ 2 (fun h ↦ p (θ + h) x * Real.log (p (θ + h) x / p θ x)) (Metric.ball 0 r))
    (D : X → ℝ) (hD : Integrable D ν)
    (hdom : ∀ x, ∀ h ∈ Metric.ball (0 : 𝔼ₖ) r,
      ‖fderiv ℝ (fun h ↦ p (θ + h) x) h‖ ≤ D x ∧
      ‖iteratedFDeriv ℝ 2 (fun h ↦ p (θ + h) x) h‖ ≤ D x ∧
      ‖fderiv ℝ (fun h ↦ p (θ + h) x * Real.log (p (θ + h) x / p θ x)) h‖ ≤ D x ∧
      ‖iteratedFDeriv ℝ 2 (fun h ↦ p (θ + h) x * Real.log (p (θ + h) x / p θ x)) h‖ ≤ D x) :
    (fun h : 𝔼ₖ ↦ (InformationTheory.klDiv
        (ν.withDensity fun x ↦ ENNReal.ofReal (p (θ + h) x))
        (ν.withDensity fun x ↦ ENNReal.ofReal (p θ x))).toReal -
      (2 : ℝ)⁻¹ * (WithLp.ofLp h ⬝ᵥ (fisherInformation
        (ν.withDensity fun x ↦ ENNReal.ofReal (p θ x))
        (fun x ↦ (p θ x)⁻¹ • gradient (fun η ↦ p η x) θ) *ᵥ WithLp.ofLp h))) =o[𝓝 0]
      fun h ↦ ‖h‖ ^ 2 := sorry

/-- **7.3** Local asymptotic normality of a sequence of experiments indexed by local parameters
in `ℝᵏ`, with information `I` and central sequence `Δ`, at every fixed local parameter `h`. -/
def IsLocallyAsymptoticallyNormal (Q : ∀ n, 𝔼ₖ → Measure (Ω n))
    [∀ n h, IsProbabilityMeasure (Q n h)] (I : Matrix (Fin k) (Fin k) ℝ) (Δ : ∀ n, Ω n → 𝔼ₖ) :
    Prop :=
  I.PosDef ∧ (∀ n, Measurable (Δ n)) ∧
    TendstoInDistribution Δ atTop id (fun n ↦ Q n 0) (multivariateGaussian 0 I) ∧
    ∀ h : 𝔼ₖ,
      TendstoInProbability (fun n ↦ Q n 0) (fun n ω ↦ ((Q n h).rnDeriv (Q n 0) ω).toReal *
        Real.exp (-⟪h, Δ n ω⟫_ℝ + (2 : ℝ)⁻¹ * (WithLp.ofLp h ⬝ᵥ (I *ᵥ WithLp.ofLp h)))) atTop 1

/-- **7.4** The asymptotic representation theorem: limit laws of statistics in a locally
asymptotically normal sequence are the laws of one randomized statistic in the Gaussian shift
`N(h, I⁻¹)`. -/
theorem exists_kernel_of_isLocallyAsymptoticallyNormal (Q : ∀ n, 𝔼ₖ → Measure (Ω n))
    [∀ n h, IsProbabilityMeasure (Q n h)] (I : Matrix (Fin k) (Fin k) ℝ) (Δ : ∀ n, Ω n → 𝔼ₖ)
    (hLAN : IsLocallyAsymptoticallyNormal Q I Δ) {S : Type*} [TopologicalSpace S]
    [PolishSpace S] [MeasurableSpace S] [BorelSpace S] (Tn : ∀ n, Ω n → S)
    (hT : ∀ n, Measurable (Tn n)) (L : 𝔼ₖ → Measure S) [∀ h, IsProbabilityMeasure (L h)]
    (hlim : ∀ h, TendstoInDistribution Tn atTop id (fun n ↦ Q n h) (L h)) :
    ∃ K : Kernel 𝔼ₖ S, IsMarkovKernel K ∧ ∀ h, L h = K ∘ₘ multivariateGaussian h I⁻¹ := sorry

/-- **7.5** The convolution theorem: the limit law of a regular estimator sequence of `A h` is
`N(0, A I⁻¹ Aᵀ)` convolved with a probability measure. -/
theorem exists_conv_of_isRegular (Q : ∀ n, 𝔼ₖ → Measure (Ω n))
    [∀ n h, IsProbabilityMeasure (Q n h)] (I : Matrix (Fin k) (Fin k) ℝ) (Δ : ∀ n, Ω n → 𝔼ₖ)
    (hLAN : IsLocallyAsymptoticallyNormal Q I Δ) (A : Matrix (Fin m) (Fin k) ℝ)
    (Zn : ∀ n, Ω n → EuclideanSpace ℝ (Fin m)) (hZ : ∀ n, Measurable (Zn n))
    (L : Measure (EuclideanSpace ℝ (Fin m))) [IsProbabilityMeasure L]
    (hreg : ∀ h : 𝔼ₖ, TendstoInDistribution (fun n ω ↦ Zn n ω - WithLp.toLp 2 (A *ᵥ WithLp.ofLp h))
      atTop id (fun n ↦ Q n h) L) :
    ∃ M : Measure (EuclideanSpace ℝ (Fin m)), IsProbabilityMeasure M ∧
      L = (multivariateGaussian 0 (A * I⁻¹ * Aᵀ)).conv M := sorry

/-- **7.5** Equivariant-in-law estimators in the Gaussian shift: if the law of `T - A h` under
`N(h, I⁻¹)` does not depend on `h`, it is `N(0, A I⁻¹ Aᵀ)` convolved with a probability law. -/
theorem exists_conv_of_equivariantInLaw (I : Matrix (Fin k) (Fin k) ℝ) (hI : I.PosDef)
    (A : Matrix (Fin m) (Fin k) ℝ) (K : Kernel 𝔼ₖ (EuclideanSpace ℝ (Fin m))) [IsMarkovKernel K]
    (L : Measure (EuclideanSpace ℝ (Fin m))) [IsProbabilityMeasure L]
    (hK : ∀ h : 𝔼ₖ, (K ∘ₘ multivariateGaussian h I⁻¹).map
      (fun z ↦ z - WithLp.toLp 2 (A *ᵥ WithLp.ofLp h)) = L) :
    ∃ M : Measure (EuclideanSpace ℝ (Fin m)), IsProbabilityMeasure M ∧
      L = (multivariateGaussian 0 (A * I⁻¹ * Aᵀ)).conv M := sorry

/-- **7.5** Minimax risk in the Gaussian shift: every randomized estimator of `A h` has maximal
risk at least the risk of `A X` for a bowl-shaped loss. -/
theorem lintegral_multivariateGaussian_le_iSup_risk (I : Matrix (Fin k) (Fin k) ℝ)
    (hI : I.PosDef) (A : Matrix (Fin m) (Fin k) ℝ)
    (K : Kernel 𝔼ₖ (EuclideanSpace ℝ (Fin m))) [IsMarkovKernel K]
    (ℓ : EuclideanSpace ℝ (Fin m) → ℝ≥0∞) (hℓ : Measurable ℓ)
    (hsymm : ∀ x, ℓ (-x) = ℓ x) (hconv : ∀ c, Convex ℝ {x | ℓ x ≤ c}) :
    ∫⁻ x, ℓ x ∂(multivariateGaussian 0 (A * I⁻¹ * Aᵀ)) ≤
      ⨆ h : 𝔼ₖ, ∫⁻ z, ℓ (z - WithLp.toLp 2 (A *ᵥ WithLp.ofLp h))
        ∂(K ∘ₘ multivariateGaussian h I⁻¹) := sorry

/-- **7.5** Anderson's lemma: a bowl-shaped loss has smaller mean under a centred Gaussian than
under its convolution with any probability law. -/
theorem lintegral_multivariateGaussian_le_conv (S : Matrix (Fin m) (Fin m) ℝ)
    (hS : S.PosSemidef) (ℓ : EuclideanSpace ℝ (Fin m) → ℝ≥0∞) (hℓ : Measurable ℓ)
    (hsymm : ∀ x, ℓ (-x) = ℓ x) (hconv : ∀ c, Convex ℝ {x | ℓ x ≤ c})
    (M : Measure (EuclideanSpace ℝ (Fin m))) [IsProbabilityMeasure M] :
    ∫⁻ x, ℓ x ∂(multivariateGaussian 0 S) ≤ ∫⁻ x, ℓ x ∂((multivariateGaussian 0 S).conv M) := sorry

/-- **7.6** The local asymptotic minimax theorem: for every measurable estimator sequence and
every lower semicontinuous bowl-shaped loss, the local maximal risk over finite sets is at least
the Gaussian risk. -/
theorem lintegral_multivariateGaussian_le_localMinimax (Q : ∀ n, 𝔼ₖ → Measure (Ω n))
    [∀ n h, IsProbabilityMeasure (Q n h)] (I : Matrix (Fin k) (Fin k) ℝ) (Δ : ∀ n, Ω n → 𝔼ₖ)
    (hLAN : IsLocallyAsymptoticallyNormal Q I Δ) (A : Matrix (Fin m) (Fin k) ℝ)
    (c : ℕ → 𝔼ₖ → EuclideanSpace ℝ (Fin m))
    (hc : ∀ h, Tendsto (fun n ↦ c n h) atTop (𝓝 (WithLp.toLp 2 (A *ᵥ WithLp.ofLp h))))
    (Zn : ∀ n, Ω n → EuclideanSpace ℝ (Fin m)) (hZ : ∀ n, Measurable (Zn n))
    (ℓ : EuclideanSpace ℝ (Fin m) → ℝ≥0∞) (hℓ : LowerSemicontinuous ℓ)
    (hsymm : ∀ x, ℓ (-x) = ℓ x) (hconv : ∀ a, Convex ℝ {x | ℓ x ≤ a}) :
    ∫⁻ x, ℓ x ∂(multivariateGaussian 0 (A * I⁻¹ * Aᵀ)) ≤
      ⨆ H : Finset 𝔼ₖ, liminf (fun n ↦ H.sup fun h ↦ ∫⁻ ω, ℓ (Zn n ω - c n h) ∂(Q n h)) atTop :=
  sorry

/-- **7.7** Superefficiency is confined to a Lebesgue null set: in a model differentiable in
quadratic mean everywhere on an open set, the limit covariance of `√n (Tₙ - θ)` dominates the
inverse information at almost every `θ`. -/
theorem ae_posSemidef_covMatrix_sub_inv_fisherInformation (ν : Measure X) (U : Set 𝔼ₖ)
    (hU : IsOpen U) (p : 𝔼ₖ → X → ℝ) (hp : ∀ θ, Measurable (p θ) ∧ 0 ≤ p θ)
    (hjoint : Measurable (Function.uncurry p))
    (hprob : ∀ θ, IsProbabilityMeasure (ν.withDensity fun x ↦ ENNReal.ofReal (p θ x)))
    (score : 𝔼ₖ → X → 𝔼ₖ) (hqmd : ∀ θ ∈ U, HasQMDWithinAt ν p univ θ (score θ))
    (hI : ∀ θ ∈ U, (fisherInformation (ν.withDensity fun x ↦ ENNReal.ofReal (p θ x))
      (score θ)).PosDef)
    (Tn : ∀ n, (Fin n → X) → 𝔼ₖ) (hT : ∀ n, Measurable (Tn n)) (L : 𝔼ₖ → Measure 𝔼ₖ)
    [∀ θ, IsProbabilityMeasure (L θ)] (hL2 : ∀ θ ∈ U, MemLp id 2 (L θ))
    (hlim : ∀ θ ∈ U, TendstoInDistribution (fun (n : ℕ) x ↦ Real.sqrt n • (Tn n x - θ)) atTop id
      (fun n ↦ Measure.pi fun _ : Fin n ↦ ν.withDensity fun x ↦ ENNReal.ofReal (p θ x)) (L θ)) :
    ∀ᵐ θ ∂(volume.restrict U), (TauCeti.covMatrix (L θ) -
      (fisherInformation (ν.withDensity fun x ↦ ENNReal.ofReal (p θ x)) (score θ))⁻¹).PosSemidef :=
  sorry

end Layer7

/-! ## Layer 8: asymptotic tests and efficiency -/

section Layer8

variable {X : Type*} [MeasurableSpace X] {k : ℕ}

local notation "𝔼ₖ" => EuclideanSpace ℝ (Fin k)

/-- The quadratic form `vᵀ I v`. -/
def quadForm (I : Matrix (Fin k) (Fin k) ℝ) (v : 𝔼ₖ) : ℝ := WithLp.ofLp v ⬝ᵥ (I *ᵥ WithLp.ofLp v)

/-- **8.1** The likelihood ratio statistic on converging local parameter sets: under
`θ + h / √n` its limit is `inf_{H₀} ‖I^{1/2}(X - g)‖² - inf_H ‖I^{1/2}(X - g)‖²` with
`X ~ N(h, I⁻¹)`. The infima run over the subtypes `H₀` and `H`; both sets contain `0` (by the
limit clause of `hH` with `u = 0`, since `θ ∈ Θ₀ ⊆ Θ`), and the quadratic form is nonnegative,
so the infima are genuine. -/
theorem tendstoInDistribution_likelihoodRatio_localSets (ν : Measure X) (p : 𝔼ₖ → X → ℝ)
    (hp : ∀ θ, Measurable (p θ) ∧ ∀ x, 0 < p θ x)
    (hprob : ∀ θ, IsProbabilityMeasure (ν.withDensity fun x ↦ ENNReal.ofReal (p θ x)))
    (Θ Θ₀ : Set 𝔼ₖ) (hΘ₀ : Θ₀ ⊆ Θ) (θ : 𝔼ₖ) (hθ : θ ∈ Θ₀) (score : X → 𝔼ₖ)
    (hqmd : HasQMDWithinAt ν p univ θ score)
    (hI : (fisherInformation (ν.withDensity fun x ↦ ENNReal.ofReal (p θ x)) score).PosDef)
    (L : X → ℝ) (hL : MemLp L 2 (ν.withDensity fun x ↦ ENNReal.ofReal (p θ x)))
    (hlip : ∀ᶠ θ₁ in 𝓝 θ, ∀ᶠ θ₂ in 𝓝 θ, ∀ x,
      |Real.log (p θ₁ x) - Real.log (p θ₂ x)| ≤ L x * ‖θ₁ - θ₂‖)
    (θhat θtilde : ∀ n, (Fin n → X) → 𝔼ₖ) (hhat : ∀ n x, θhat n x ∈ Θ ∧
      ∀ η ∈ Θ, ∑ i, Real.log (p η (x i)) ≤ ∑ i, Real.log (p (θhat n x) (x i)))
    (htilde : ∀ n x, θtilde n x ∈ Θ₀ ∧
      ∀ η ∈ Θ₀, ∑ i, Real.log (p η (x i)) ≤ ∑ i, Real.log (p (θtilde n x) (x i)))
    (hcons : ∀ h : 𝔼ₖ,
      TendstoInProbability (fun (n : ℕ) ↦ Measure.pi fun _ : Fin n ↦
        ν.withDensity fun x ↦ ENNReal.ofReal (p (θ + (Real.sqrt n)⁻¹ • h) x)) θhat atTop θ ∧
      TendstoInProbability (fun (n : ℕ) ↦ Measure.pi fun _ : Fin n ↦
        ν.withDensity fun x ↦ ENNReal.ofReal (p (θ + (Real.sqrt n)⁻¹ • h) x)) θtilde atTop θ)
    (H H₀ : Set 𝔼ₖ)
    (hH : ∀ G G' : Set 𝔼ₖ, (G = H ∧ G' = Θ) ∨ (G = H₀ ∧ G' = Θ₀) →
      (∀ g ∈ G, ∃ u : ℕ → 𝔼ₖ, Tendsto u atTop (𝓝 g) ∧
        ∀ᶠ n : ℕ in atTop, θ + (Real.sqrt n)⁻¹ • u n ∈ G') ∧
      ∀ (φ : ℕ → ℕ), StrictMono φ → ∀ (u : ℕ → 𝔼ₖ) (g : 𝔼ₖ), Tendsto u atTop (𝓝 g) →
        (∀ j, θ + (Real.sqrt (φ j))⁻¹ • u j ∈ G') → g ∈ G)
    (hLR : ∀ n, Measurable fun x : Fin n → X ↦
      ∑ i, Real.log (p (θhat n x) (x i)) - ∑ i, Real.log (p (θtilde n x) (x i)))
    (h : 𝔼ₖ) {Ω' : Type*} [MeasurableSpace Ω'] {μ' : Measure Ω'} [IsProbabilityMeasure μ']
    (Y : Ω' → 𝔼ₖ) (hY : HasLaw Y (multivariateGaussian h
      (fisherInformation (ν.withDensity fun x ↦ ENNReal.ofReal (p θ x)) score)⁻¹) μ') :
    TendstoInDistribution (fun (n : ℕ) x ↦
        2 * (∑ i, Real.log (p (θhat n x) (x i)) - ∑ i, Real.log (p (θtilde n x) (x i)))) atTop
      (fun ω ↦ (⨅ g : H₀, quadForm (fisherInformation
          (ν.withDensity fun x ↦ ENNReal.ofReal (p θ x)) score) (Y ω - (g : 𝔼ₖ))) -
        ⨅ g : H, quadForm (fisherInformation
          (ν.withDensity fun x ↦ ENNReal.ofReal (p θ x)) score) (Y ω - (g : 𝔼ₖ)))
      (fun (n : ℕ) ↦ Measure.pi fun _ : Fin n ↦
        ν.withDensity fun x ↦ ENNReal.ofReal (p (θ + (Real.sqrt n)⁻¹ • h) x)) μ' := sorry

/-- **8.1** The likelihood ratio, Wald and score statistics for the simple hypothesis `θ = θ₀`:
`λₙ = 2(ℓₙ(θ̂ₙ) - ℓₙ(θ₀))`, `Wₙ = n (θ̂ₙ - θ₀)ᵀ I (θ̂ₙ - θ₀)` and `Sₙ = n⁻¹ (∑ᵢ ℓ̇(xᵢ))ᵀ I⁻¹ (∑ᵢ ℓ̇(xᵢ))`
differ by `o_P(1)` under `P_{θ₀}`, and under `P_{θ₀ + h/√n}` the likelihood ratio statistic
converges to the noncentral chi-squared law with `k` degrees of freedom and noncentrality
`hᵀ I h`. -/
theorem tendstoInDistribution_likelihoodRatio_wald_score (ν : Measure X) (p : 𝔼ₖ → X → ℝ)
    (hp : ∀ θ, Measurable (p θ) ∧ ∀ x, 0 < p θ x)
    (hprob : ∀ θ, IsProbabilityMeasure (ν.withDensity fun x ↦ ENNReal.ofReal (p θ x)))
    (θ₀ : 𝔼ₖ) (score : X → 𝔼ₖ) (hscore : Measurable score)
    (hqmd : HasQMDWithinAt ν p univ θ₀ score)
    (hI : (fisherInformation (ν.withDensity fun x ↦ ENNReal.ofReal (p θ₀ x)) score).PosDef)
    (L : X → ℝ) (hL : MemLp L 2 (ν.withDensity fun x ↦ ENNReal.ofReal (p θ₀ x)))
    (hlip : ∀ᶠ θ₁ in 𝓝 θ₀, ∀ᶠ θ₂ in 𝓝 θ₀, ∀ x,
      |Real.log (p θ₁ x) - Real.log (p θ₂ x)| ≤ L x * ‖θ₁ - θ₂‖)
    (θhat : ∀ n, (Fin n → X) → 𝔼ₖ) (hθmeas : ∀ n, Measurable (θhat n))
    (hhat : ∀ n x η, ∑ i, Real.log (p η (x i)) ≤ ∑ i, Real.log (p (θhat n x) (x i)))
    (hcons : TendstoInProbability (fun (n : ℕ) ↦ Measure.pi fun _ : Fin n ↦
        ν.withDensity fun x ↦ ENNReal.ofReal (p θ₀ x)) θhat atTop θ₀)
    (hLR : ∀ n, Measurable fun x : Fin n → X ↦ ∑ i, Real.log (p (θhat n x) (x i)))
    {Ω' : Type*} [MeasurableSpace Ω'] {μ' : Measure Ω'} [IsProbabilityMeasure μ']
    (Z : 𝔼ₖ → Ω' → ℝ) (hZ : ∀ h, HasLaw (Z h) (TauCeti.Probability.noncentralChiSquaredMeasure k
      (quadForm (fisherInformation (ν.withDensity fun x ↦ ENNReal.ofReal (p θ₀ x)) score)
        h).toNNReal) μ') :
    TendstoInProbability (fun (n : ℕ) ↦ Measure.pi fun _ : Fin n ↦
        ν.withDensity fun x ↦ ENNReal.ofReal (p θ₀ x))
      (fun (n : ℕ) x ↦ 2 * (∑ i, Real.log (p (θhat n x) (x i)) - ∑ i, Real.log (p θ₀ (x i))) -
        n * quadForm (fisherInformation (ν.withDensity fun x ↦ ENNReal.ofReal (p θ₀ x)) score)
          (θhat n x - θ₀)) atTop 0 ∧
    TendstoInProbability (fun (n : ℕ) ↦ Measure.pi fun _ : Fin n ↦
        ν.withDensity fun x ↦ ENNReal.ofReal (p θ₀ x))
      (fun (n : ℕ) x ↦ 2 * (∑ i, Real.log (p (θhat n x) (x i)) - ∑ i, Real.log (p θ₀ (x i))) -
        (n : ℝ)⁻¹ * quadForm (fisherInformation (ν.withDensity fun x ↦
          ENNReal.ofReal (p θ₀ x)) score)⁻¹ (∑ i, score (x i))) atTop 0 ∧
    ∀ h : 𝔼ₖ, TendstoInDistribution (fun (n : ℕ) x ↦
        2 * (∑ i, Real.log (p (θhat n x) (x i)) - ∑ i, Real.log (p θ₀ (x i)))) atTop (Z h)
      (fun (n : ℕ) ↦ Measure.pi fun _ : Fin n ↦
        ν.withDensity fun x ↦ ENNReal.ofReal (p (θ₀ + (Real.sqrt n)⁻¹ • h) x)) μ' := sorry

/-- **8.2** The asymptotic power envelope for one-sided tests of `ψ(θ) ≤ 0` in a locally
asymptotically normal model. -/
theorem limsup_power_le_envelope {Ω : ℕ → Type*} [∀ n, MeasurableSpace (Ω n)]
    (Q : ∀ n, 𝔼ₖ → Measure (Ω n)) [∀ n h, IsProbabilityMeasure (Q n h)]
    (I : Matrix (Fin k) (Fin k) ℝ) (Δ : ∀ n, Ω n → 𝔼ₖ)
    (hLAN : IsLocallyAsymptoticallyNormal Q I Δ) (ψ : 𝔼ₖ → ℝ) (ψdot : 𝔼ₖ) (hψ0 : ψ 0 = 0)
    (hψd : HasGradientAt ψ ψdot 0) (hψne : ψdot ≠ 0)
    (α : ℝ) (hα : α ∈ Set.Ioo (0 : ℝ) 1) (φ : ∀ n, Ω n → ℝ)
    (hφ : ∀ n, Measurable (φ n) ∧ ∀ ω, φ n ω ∈ Set.Icc (0 : ℝ) 1)
    (hlevel : ∀ n : ℕ, ∀ h, ψ ((Real.sqrt n)⁻¹ • h) ≤ 0 → ∫ ω, φ n ω ∂(Q n h) ≤ α)
    (h : 𝔼ₖ) (hpos : 0 < ⟪ψdot, h⟫_ℝ) :
    limsup (fun n ↦ ∫ ω, φ n ω ∂(Q n h)) atTop ≤
      1 - cdf (gaussianReal 0 1) (MeasureTheory.Measure.quantile (gaussianReal 0 1) (1 - α) -
        ⟪ψdot, h⟫_ℝ / Real.sqrt (quadForm I⁻¹ ψdot)) := sorry

/-- **8.3** Local power of tests based on locally uniformly asymptotically normal statistics:
rejecting when `√n (Tₙ - μ(0)) > σ(0) z_α` has power `1 - Φ(z_α - h μ'(0) / σ(0))` at `h / √n`. -/
theorem tendsto_power_localAlternatives (Pθ : ℝ → Measure X) [∀ θ, IsProbabilityMeasure (Pθ θ)]
    (T : ∀ n, (Fin n → X) → ℝ) (hT : ∀ n, Measurable (T n)) (μf σf : ℝ → ℝ) (μ' : ℝ)
    (hμ : HasDerivAt μf μ' 0) (hσ : ContinuousAt σf 0) (hσ0 : 0 < σf 0)
    (hLUAN : ∀ θn : ℕ → ℝ, Tendsto θn atTop (𝓝[≥] 0) →
      TendstoInDistribution (fun (n : ℕ) x ↦ Real.sqrt n * (T n x - μf (θn n)) / σf (θn n))
        atTop id (fun n ↦ Measure.pi fun _ : Fin n ↦ Pθ (θn n)) (gaussianReal 0 1))
    (α : ℝ) (hα : α ∈ Set.Ioo (0 : ℝ) 1) (h : ℝ) (hh : 0 ≤ h) :
    Tendsto (fun n : ℕ ↦ (Measure.pi fun _ : Fin n ↦ Pθ (h / Real.sqrt n)).real
        {x | σf 0 * MeasureTheory.Measure.quantile (gaussianReal 0 1) (1 - α) <
          Real.sqrt n * (T n x - μf 0)}) atTop
      (𝓝 (1 - cdf (gaussianReal 0 1)
        (MeasureTheory.Measure.quantile (gaussianReal 0 1) (1 - α) - h * μ' / σf 0))) :=
  sorry

/-- **8.3** The Hodges–Lehmann bound: the Pitman efficiency of the Wilcoxon test relative to
the `t` test, `12 σ² (∫ f²)²`, is at least `108/125` for every probability density. -/
theorem le_twelve_mul_variance_mul_sq_integral_sq (f : ℝ → ℝ) (hf : Measurable f) (hf0 : 0 ≤ f)
    (hint : ∫ x, f x = 1) (h2 : Integrable (fun x ↦ x ^ 2 * f x))
    (hf2 : Integrable (fun x ↦ f x ^ 2)) :
    (108 / 125 : ℝ) ≤ 12 * ((∫ x, x ^ 2 * f x) - (∫ x, x * f x) ^ 2) * (∫ x, f x ^ 2) ^ 2 :=
  sorry

attribute [local instance] TauCeti.Probability.isProbabilityMeasure_multinomialMeasure

/-- **8.4** Pearson's theorem: `∑ (Nᵢ - n pᵢ)² / (n pᵢ) → χ²_{k-1}` for multinomial counts with
all cell probabilities positive. -/
theorem tendstoInDistribution_pearson {ι : Type*} [Fintype ι] [DecidableEq ι]
    (p : Convexity.StdSimplex ℝ≥0 ι) (hp : ∀ i, 0 < p.weights i)
    {Ω' : Type*} [MeasurableSpace Ω'] {μ' : Measure Ω'} [IsProbabilityMeasure μ'] {Z : Ω' → ℝ}
    (hZ : HasLaw Z (TauCeti.Probability.chiSquaredMeasure (Fintype.card ι - 1 : ℕ)) μ') :
    TendstoInDistribution (fun (n : ℕ) (N : ι → ℕ) ↦
        ∑ i, ((N i : ℝ) - n * p.weights i) ^ 2 / (n * p.weights i)) atTop Z
      (fun n ↦ TauCeti.Probability.multinomialMeasure n p) μ' := sorry

/-- **8.4** Asymptotic normality of the generalized method of moments estimator with weight
limit `W`; the derivative of the moment function is dominated on a ball by an integrable `D`. -/
theorem gmm_tendstoInDistribution (P : Measure X) [IsProbabilityMeasure P] {q : ℕ}
    (mfun : X → 𝔼ₖ → EuclideanSpace ℝ (Fin q)) (θ₀ : 𝔼ₖ) (hm0 : ∫ x, mfun x θ₀ ∂P = 0)
    (hmeas : ∀ θ, Measurable fun x ↦ mfun x θ) (hL2 : MemLp (fun x ↦ mfun x θ₀) 2 P)
    (Ωm : Matrix (Fin q) (Fin q) ℝ) (hΩ : Ωm = TauCeti.covMatrix (P.map fun x ↦ mfun x θ₀))
    (hΩpos : Ωm.PosDef) (r : ℝ) (hr : 0 < r)
    (hC1 : ∀ x, ContDiffOn ℝ 1 (mfun x) (Metric.ball θ₀ r))
    (D : X → ℝ) (hD : Integrable D P)
    (hDb : ∀ x, ∀ θ ∈ Metric.ball θ₀ r, ‖fderiv ℝ (mfun x) θ‖ ≤ D x)
    (G : Matrix (Fin q) (Fin k) ℝ)
    (hG : ∀ v, WithLp.toLp 2 (G *ᵥ WithLp.ofLp v) = ∫ x, fderiv ℝ (mfun x) θ₀ v ∂P)
    (hrank : G.rank = k) (W : Matrix (Fin q) (Fin q) ℝ) (hW : W.PosDef)
    (Wn : ∀ n, (Fin n → X) → Matrix (Fin q) (Fin q) ℝ)
    (hWn : ∀ i j, TendstoInProbability (fun n ↦ Measure.pi fun _ : Fin n ↦ P)
      (fun n x ↦ Wn n x i j) atTop (W i j))
    (θhat : ∀ n, (Fin n → X) → 𝔼ₖ) (hθ : ∀ n, Measurable (θhat n))
    (hcons : TendstoInProbability (fun n ↦ Measure.pi fun _ : Fin n ↦ P) θhat atTop θ₀)
    (hmin : ∀ (n : ℕ) x θ,
      let mbar := fun η ↦ WithLp.ofLp ((n : ℝ)⁻¹ • ∑ i, mfun (x i) η)
      mbar (θhat n x) ⬝ᵥ (Wn n x *ᵥ mbar (θhat n x)) ≤ mbar θ ⬝ᵥ (Wn n x *ᵥ mbar θ))
    {Ω' : Type*} [MeasurableSpace Ω'] {μ' : Measure Ω'} [IsProbabilityMeasure μ'] {Z : Ω' → 𝔼ₖ}
    (hZ : HasLaw Z (multivariateGaussian 0 ((Gᵀ * W * G)⁻¹ * Gᵀ * W * Ωm * W * G *
      (Gᵀ * W * G)⁻¹)) μ') :
    TendstoInDistribution (fun (n : ℕ) x ↦ Real.sqrt n • (θhat n x - θ₀)) atTop Z
      (fun n ↦ Measure.pi fun _ : Fin n ↦ P) μ' := sorry

/-- **8.4** The optimal weight `W = Ω⁻¹`: the generalized method of moments covariance with
weight `W` dominates `(Gᵀ Ω⁻¹ G)⁻¹` in the Loewner order. -/
theorem posSemidef_gmm_covariance_sub_optimal {q : ℕ} (G : Matrix (Fin q) (Fin k) ℝ)
    (hrank : G.rank = k) (Ωm W : Matrix (Fin q) (Fin q) ℝ) (hΩ : Ωm.PosDef) (hW : W.PosDef) :
    ((Gᵀ * W * G)⁻¹ * Gᵀ * W * Ωm * W * G * (Gᵀ * W * G)⁻¹ - (Gᵀ * Ωm⁻¹ * G)⁻¹).PosSemidef :=
  sorry

/-- **8.4** The overidentification statistic: under the hypotheses of `gmm_tendstoInDistribution`
with weights `Wₙ → Ω⁻¹`, `n m̄ₙ(θ̂ₙ)ᵀ Wₙ m̄ₙ(θ̂ₙ) → χ²_{q-k}`. -/
theorem tendstoInDistribution_gmm_overidentification (P : Measure X) [IsProbabilityMeasure P]
    {q : ℕ} (mfun : X → 𝔼ₖ → EuclideanSpace ℝ (Fin q)) (θ₀ : 𝔼ₖ)
    (hm0 : ∫ x, mfun x θ₀ ∂P = 0) (hmeas : Measurable (Function.uncurry mfun))
    (hL2 : MemLp (fun x ↦ mfun x θ₀) 2 P)
    (Ωm : Matrix (Fin q) (Fin q) ℝ) (hΩ : Ωm = TauCeti.covMatrix (P.map fun x ↦ mfun x θ₀))
    (hΩpos : Ωm.PosDef) (r : ℝ) (hr : 0 < r)
    (hC1 : ∀ x, ContDiffOn ℝ 1 (mfun x) (Metric.ball θ₀ r))
    (D : X → ℝ) (hD : Integrable D P)
    (hDb : ∀ x, ∀ θ ∈ Metric.ball θ₀ r, ‖fderiv ℝ (mfun x) θ‖ ≤ D x)
    (G : Matrix (Fin q) (Fin k) ℝ)
    (hG : ∀ v, WithLp.toLp 2 (G *ᵥ WithLp.ofLp v) = ∫ x, fderiv ℝ (mfun x) θ₀ v ∂P)
    (hrank : G.rank = k)
    (Wn : ∀ n, (Fin n → X) → Matrix (Fin q) (Fin q) ℝ) (hWmeas : ∀ n, Measurable (Wn n))
    (hWn : ∀ i j, TendstoInProbability (fun n ↦ Measure.pi fun _ : Fin n ↦ P)
      (fun n x ↦ Wn n x i j) atTop (Ωm⁻¹ i j))
    (θhat : ∀ n, (Fin n → X) → 𝔼ₖ) (hθ : ∀ n, Measurable (θhat n))
    (hcons : TendstoInProbability (fun n ↦ Measure.pi fun _ : Fin n ↦ P) θhat atTop θ₀)
    (hmin : ∀ (n : ℕ) x θ,
      let mbar := fun η ↦ WithLp.ofLp ((n : ℝ)⁻¹ • ∑ i, mfun (x i) η)
      mbar (θhat n x) ⬝ᵥ (Wn n x *ᵥ mbar (θhat n x)) ≤ mbar θ ⬝ᵥ (Wn n x *ᵥ mbar θ))
    {Ω' : Type*} [MeasurableSpace Ω'] {μ' : Measure Ω'} [IsProbabilityMeasure μ'] {Z : Ω' → ℝ}
    (hZ : HasLaw Z (TauCeti.Probability.chiSquaredMeasure (q - k)) μ') :
    TendstoInDistribution (fun (n : ℕ) x ↦
        let mbar := WithLp.ofLp ((n : ℝ)⁻¹ • ∑ i, mfun (x i) (θhat n x))
        (n : ℝ) * (mbar ⬝ᵥ (Wn n x *ᵥ mbar))) atTop Z
      (fun n ↦ Measure.pi fun _ : Fin n ↦ P) μ' := sorry

end Layer8

/-! ## Layer 9: robust statistics -/

section Layer9

/-- **9.1** The influence function of a functional `T` on probability laws on `ℝ` at `F`: the
right derivative at `0` of `ε ↦ T((1 - ε) F + ε δₓ)`. -/
def HasInfluenceFunction (T : Measure ℝ → ℝ) (F : Measure ℝ) (IF : ℝ → ℝ) : Prop :=
  ∀ x, HasDerivWithinAt (fun ε : ℝ ↦
    T (ENNReal.ofReal (1 - ε) • F + ENNReal.ofReal ε • Measure.dirac x)) (IF x) (Set.Ici 0) 0

/-- **9.1** The influence function of a location M-functional is `ψ(x - θ₀)/γ`. -/
theorem hasInfluenceFunction_mFunctional (ψ : ℝ → ℝ) (hψc : Continuous ψ)
    (hψodd : ∀ u, ψ (-u) = -ψ u) (T : Measure ℝ → ℝ) (F : Measure ℝ) [IsProbabilityMeasure F]
    (hT : ∀ x, ∀ ε ∈ Set.Icc (0 : ℝ) 1, ∫ y, ψ (y - T (ENNReal.ofReal (1 - ε) • F +
      ENNReal.ofReal ε • Measure.dirac x)) ∂(ENNReal.ofReal (1 - ε) • F +
        ENNReal.ofReal ε • Measure.dirac x) = 0)
    (hint : ∀ θ, Integrable (fun y ↦ ψ (y - θ)) F) (γ : ℝ) (hγ : γ ≠ 0)
    (hlam : HasDerivAt (fun θ ↦ ∫ y, ψ (y - θ) ∂F) (-γ) (T F))
    (hdiff : ∀ x, DifferentiableWithinAt ℝ (fun ε : ℝ ↦
      T (ENNReal.ofReal (1 - ε) • F + ENNReal.ofReal ε • Measure.dirac x)) (Set.Ici 0) 0) :
    HasInfluenceFunction T F fun x ↦ ψ (x - T F) / γ := sorry

/-- **9.2** The influence function and asymptotic normality of a Hadamard-differentiable
functional of the distribution function: `IF(x) = T'(1_{[x, ∞)} - F)` and
`√n (T(Fₙ) - T(F)) → N(0, ∫ IF² dF)`. -/
theorem tendstoInDistribution_of_hasHadamardDerivWithinAt_cdf (P : Measure ℝ)
    [IsProbabilityMeasure P] (T : Linfty ℝ → ℝ) (T' : Linfty ℝ →L[ℝ] ℝ)
    (hT : HasHadamardDerivWithinAt T {z | Monotone (z : ℝ → ℝ)} univ T'
      (liftLinfty fun t ↦ cdf P t))
    (IF : ℝ → ℝ) (hIF : ∀ x, IF x = T' (liftLinfty fun t ↦
      (Set.Ici x).indicator (fun _ ↦ (1 : ℝ)) t - cdf P t))
    (hmeas : Measurable IF) (hIF2 : MemLp IF 2 P)
    (hTmeas : ∀ n : ℕ, Measurable fun x : Fin n → ℝ ↦ T (liftLinfty (empiricalCdf x)))
    {Ω' : Type*} [MeasurableSpace Ω'] {μ' : Measure Ω'} [IsProbabilityMeasure μ'] {Z : Ω' → ℝ}
    (hZ : HasLaw Z (gaussianReal 0 (∫ x, IF x ^ 2 ∂P).toNNReal) μ') :
    ∫ x, IF x ∂P = 0 ∧ TendstoInDistribution (fun (n : ℕ) (x : Fin n → ℝ) ↦
        Real.sqrt n * (T (liftLinfty (empiricalCdf x)) - T (liftLinfty fun t ↦ cdf P t))) atTop Z
      (fun n ↦ Measure.pi fun _ : Fin n ↦ P) μ' := sorry

/-- **9.3** The contamination bound for the median: every median of `(1 - ε) F + ε H` lies
between `F⁻¹((1/2 - ε)/(1 - ε))` and `F⁻¹(1/(2(1 - ε)))`. -/
theorem median_mem_Icc_of_contamination (F H : Measure ℝ) [IsProbabilityMeasure F]
    [IsProbabilityMeasure H] (hFc : Continuous (cdf F)) (hFmono : StrictMono (cdf F))
    (ε : ℝ) (hε : ε ∈ Set.Ico (0 : ℝ) (1 / 2)) (m : ℝ)
    (hm : (1 / 2 : ℝ) ≤ cdf (ENNReal.ofReal (1 - ε) • F + ENNReal.ofReal ε • H) m ∧
      ∀ x < m, cdf (ENNReal.ofReal (1 - ε) • F + ENNReal.ofReal ε • H) x ≤ 1 / 2) :
    m ∈ Set.Icc (MeasureTheory.Measure.quantile F ((1 / 2 - ε) / (1 - ε)))
      (MeasureTheory.Measure.quantile F (1 / (2 * (1 - ε)))) := sorry

/-- **9.4** The finite-sample replacement breakdown point of an estimator at a sample: the least
fraction `m / n` of coordinates whose replacement can make the estimator unbounded, and `⊤` when
no number `m ≤ n` of replacements does (in particular for `n = 0`). -/
def breakdownPoint {E F : Type*} [PseudoMetricSpace F] {n : ℕ} (T : (Fin n → E) → F)
    (x : Fin n → E) : ℝ≥0∞ :=
  ⨅ (m : ℕ) (_ : m ≤ n)
    (_ : ¬ Bornology.IsBounded (T '' {y | (Finset.univ.filter fun i ↦ y i ≠ x i).card ≤ m})),
    (m : ℝ≥0∞) / n

/-- **9.4** The sample mean has breakdown point `1/n`, and the sample median of `2m + 1`
observations has breakdown point `(m + 1)/(2m + 1)`. -/
theorem breakdownPoint_sampleMean_and_median (n m : ℕ) (hn : 0 < n) (x : Fin n → ℝ)
    (y : Fin (2 * m + 1) → ℝ) :
    breakdownPoint (fun z : Fin n → ℝ ↦ (n : ℝ)⁻¹ * ∑ i, z i) x = 1 / (n : ℝ≥0∞) ∧
      breakdownPoint (fun z : Fin (2 * m + 1) → ℝ ↦ sampleQuantile z (1 / 2)) y =
        ((m + 1 : ℕ) : ℝ≥0∞) / ((2 * m + 1 : ℕ) : ℝ≥0∞) := sorry

/-- **9.5** Hampel's optimality: let `k > 0` and `c = k / (2Φ(k) - 1)` (every `c > √(π/2)` has
exactly one such `k`). Among measurable `φ` with `∫ φ dΦ = 0`, `∫ x φ(x) dΦ(x) = 1` and
`|φ| ≤ c`, the normalized Huber score `ψₖ / (2Φ(k) - 1)` minimizes `∫ φ² dΦ`, and every minimizer
agrees with it `Φ`-almost everywhere. -/
theorem integral_sq_huberScore_le_of_abs_le (k c : ℝ) (hk : 0 < k)
    (hc : c = k / (2 * cdf (gaussianReal 0 1) k - 1)) (φ : ℝ → ℝ) (hφ : Measurable φ)
    (h0 : ∫ x, φ x ∂(gaussianReal 0 1) = 0) (h1 : ∫ x, x * φ x ∂(gaussianReal 0 1) = 1)
    (hb : ∀ x, |φ x| ≤ c) :
    ∫ x, (huberScore k x / (2 * cdf (gaussianReal 0 1) k - 1)) ^ 2 ∂(gaussianReal 0 1) ≤
        ∫ x, φ x ^ 2 ∂(gaussianReal 0 1) ∧
      (∫ x, φ x ^ 2 ∂(gaussianReal 0 1) =
          ∫ x, (huberScore k x / (2 * cdf (gaussianReal 0 1) k - 1)) ^ 2 ∂(gaussianReal 0 1) →
        φ =ᵐ[gaussianReal 0 1] fun x ↦ huberScore k x / (2 * cdf (gaussianReal 0 1) k - 1)) :=
  sorry

/-- **9.5** Huber's minimax property: in the symmetric gross-error neighbourhood of `N(0, 1)`,
the Huber score `ψₖ` has largest asymptotic variance `∫ ψₖ² dG / G((-k, k))²` at the least
favourable law `G₀`, where it equals `1 / I(G₀)`. -/
theorem huber_minimax (ε : ℝ) (hε : ε ∈ Set.Ioo (0 : ℝ) 1) (k : ℝ) (hk : 0 < k)
    (hkeq : 2 * Real.exp (-k ^ 2 / 2) / Real.sqrt (2 * Real.pi) / k -
      2 * cdf (gaussianReal 0 1) (-k) = ε / (1 - ε))
    (G₀ : Measure ℝ) (hG₀ : G₀ = volume.withDensity fun x ↦ ENNReal.ofReal ((1 - ε) *
      if |x| ≤ k then Real.exp (-x ^ 2 / 2) / Real.sqrt (2 * Real.pi)
      else Real.exp (-k ^ 2 / 2) / Real.sqrt (2 * Real.pi) * Real.exp (k ^ 2 - k * |x|)))
    (H : Measure ℝ) [IsProbabilityMeasure H] (hH : H.map Neg.neg = H) :
    let V : Measure ℝ → ℝ := fun G ↦ (∫ x, huberScore k x ^ 2 ∂G) / (G.real (Set.Ioo (-k) k)) ^ 2
    V (ENNReal.ofReal (1 - ε) • gaussianReal 0 1 + ENNReal.ofReal ε • H) ≤ V G₀ ∧
      V G₀ = (∫ x, huberScore k x ^ 2 ∂G₀)⁻¹ := sorry

/-- **9.6** Asymptotic linearity of fixed-design regression M-estimators with a convex
criterion. -/
theorem regression_mEstimator_asymptotically_linear {p : ℕ}
    (xd : ℕ → EuclideanSpace ℝ (Fin p)) (Qm : Matrix (Fin p) (Fin p) ℝ) (hQ : Qm.PosDef)
    (hdesign : Tendsto (fun n : ℕ ↦ (n : ℝ)⁻¹ • ∑ i ∈ Finset.range n,
      Matrix.vecMulVec (WithLp.ofLp (xd i)) (WithLp.ofLp (xd i))) atTop (𝓝 Qm))
    (hmax : Tendsto (fun n : ℕ ↦ (⨆ i : Fin n, ‖xd i‖) / Real.sqrt n) atTop (𝓝 0))
    (F : Measure ℝ) [IsProbabilityMeasure F] (ρ : ℝ → ℝ) (hρ : ConvexOn ℝ univ ρ)
    (ψ : ℝ → ℝ) (hψ : ∀ u, HasDerivWithinAt ρ (ψ u) (Set.Ici u) u) (hψmeas : Measurable ψ)
    (hψ0 : ∫ e, ψ e ∂F = 0) (hψ2 : MemLp ψ 2 F)
    (hψcont : Tendsto (fun t ↦ ∫ e, (ψ (e - t) - ψ e) ^ 2 ∂F) (𝓝 0) (𝓝 0))
    (γ : ℝ) (hγ : 0 < γ) (hγd : HasDerivAt (fun t ↦ ∫ e, ψ (e - t) ∂F) (-γ) 0)
    (β : EuclideanSpace ℝ (Fin p)) (βhat : ∀ n, (Fin n → ℝ) → EuclideanSpace ℝ (Fin p))
    (hmin : ∀ (n : ℕ) (e : Fin n → ℝ) (t : EuclideanSpace ℝ (Fin p)),
      ∑ i : Fin n, ρ (⟪xd i, β⟫_ℝ + e i - ⟪xd i, βhat n e⟫_ℝ) ≤
        ∑ i : Fin n, ρ (⟪xd i, β⟫_ℝ + e i - ⟪xd i, t⟫_ℝ)) :
    TendstoInProbability (fun n ↦ Measure.pi fun _ : Fin n ↦ F)
      (fun (n : ℕ) e ↦ Real.sqrt n • (βhat n e - β) - (γ⁻¹ * (Real.sqrt n)⁻¹) •
        Matrix.toEuclideanCLM (𝕜 := ℝ) Qm⁻¹ (∑ i : Fin n, ψ (e i) • xd i)) atTop 0 := sorry

end Layer9

#check @TauCeti.covMatrix
#check @TauCeti.Probability.noncentralChiSquaredMeasure
#check @TauCeti.Probability.multinomialMeasure
#check @MeasureTheory.Measure.quantile
#check @ProbabilityTheory.tendstoInDistribution_inv_sqrt_mul_sum_sub
#check @tendstoInDistribution_iff_tendstoInDistribution_inner
#check @ProbabilityTheory.IsBrownianReal
#check @Finset.card_shatterer_le_sum_vcDim
#check @Metric.externalCoveringNumber
#check @ContinuousLinearMap.orthogonalComplement_iSup_eigenspaces_eq_bot
#check @MeasureTheory.TendstoInMeasure
#check @Finset.vcDim
#check @MeasureTheory.TendstoInDistribution.continuous_comp
#check @MeasureTheory.tendstoInDistribution_of_tendstoInMeasure_sub
#check @MeasureTheory.TendstoInDistribution.prodMk_of_tendstoInMeasure_const
#check @MeasureTheory.tendstoInDistribution_iff_forall_integral_rclike_tendsto
#check @MeasureTheory.tendsto_iff_forall_lipschitz_integral_tendsto
#check @ProbabilityTheory.charFun_multivariateGaussian
#check @ProbabilityTheory.stdGaussian
#check @ProbabilityTheory.IsGaussian
#check @ProbabilityTheory.isGaussian_map_of_measurable
#check @ProbabilityTheory.covarianceBilin
#check @ProbabilityTheory.IsGaussianProcess
#check @isCompact_closure_of_isTightMeasureSet
#check @MeasureTheory.isTightMeasureSet_of_isCompact_closure
#check @ProbabilityTheory.HasSubgaussianMGF.measure_ge_le
#check @ProbabilityTheory.HasSubgaussianMGF.sum_of_iIndepFun
#check @Finset.Shatters
#check @Metric.coveringNumber
#check @Metric.packingNumber
#check @Convex.radon_partition
#check @lp.completeSpace
#check @lp.evalCLM
#check @ContinuousMap
#check @ContinuousLinearMap.finite_dimensional_eigenspace
#check @isCompactOperator_of_tendsto
#check @MeasureTheory.Measure.rnDeriv
#check @MeasureTheory.llr
#check @InformationTheory.klDiv
#check @InformationTheory.klDiv_eq_zero_iff
#check @MeasureTheory.tvDist
#check @MeasureTheory.Measure.conv
#check @MeasureTheory.Measure.mconv
#check @ProbabilityTheory.IsPreBrownianReal
#check @Matrix.covariancePseudoInverse
#check @LinearMap.moorePenroseInverse
#check @TauCeti.Probability.chiSquaredMeasure
#check @TauCeti.Probability.chiSquaredMeasure_zero
#check @TauCeti.Probability.map_norm_sq_multivariateGaussian_noncentral
#check @ProbabilityTheory.HasLaw.norm_sq_multivariateGaussian
#check @Submodule.map_norm_sq_starProjection_stdGaussian
#check @TauCeti.Probability.multinomialToEuclidean
#check @TauCeti.Probability.covMatrix_map_multinomialToEuclidean_multinomialMeasure
#check @MeasureTheory.Measure.quantile_le_iff
#check @TauCeti.Probability.quantile_gaussianReal
#check @TauCeti.Probability.cdf_gaussianReal_eq
#check @TauCeti.Probability.hasDerivAt_cdf_gaussianReal
#check @TauCeti.Probability.laplaceMeasure
#check @TauCeti.Probability.logisticMeasure
#check @TauCeti.Probability.empiricalFiniteMeasure
#check @TauCeti.orderStatistic
#check @TauCeti.Probability.unitIntervalCoding
#check @TauCeti.Probability.map_volume_unitIntervalCoding
#check @Matrix.IsHermitian.spectral_theorem
#check @MeasureTheory.measurableSet_toMeasurable
#check @MeasureTheory.measure_toMeasurable
#check @MeasureTheory.toMeasurable
#check @TotallyBounded
#check @ProbabilityTheory.hasSubgaussianMGF_of_mem_Icc_of_integral_eq_zero
#check @ProbabilityTheory.strong_law_ae
#check @hasDerivAt_integral_of_dominated_loc_of_deriv_le
#check @MeasureTheory.Measure.withDensity
#check @ProbabilityTheory.condDistrib
#check @StandardBorelSpace
#check @VitaliFamily
#check @OnePoint
#check @MeasureTheory.IsTightMeasureSet
#check @Tuple.sort

end TauCetiRoadmap.MathematicalStatisticsAsymptotic
