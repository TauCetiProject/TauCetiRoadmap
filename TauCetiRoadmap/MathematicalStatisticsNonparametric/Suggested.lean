module

public import Mathlib
public import TauCeti.Probability.Distributions.ChiSquared.Basic
public import TauCeti.Analysis.OperatorIdeal.Nuclear.Basic
public import TauCeti.Analysis.Convex.LogConcave
public import TauCeti.InformationTheory.KullbackLeibler.Pinsker
public import TauCeti.InformationTheory.KullbackLeibler.ChainRule
public import TauCeti.InformationTheory.KullbackLeibler.Convex
public import TauCeti.InformationTheory.KullbackLeibler.Finite
public import TauCeti.InformationTheory.KullbackLeibler.Variational
public import TauCeti.Probability.McDiarmid
public import TauCeti.Probability.Distributions.PoissonBinomial.Count
public import TauCeti.Probability.Distributions.Binomial.Tail
public import TauCeti.Probability.Distributions.OrderStatistic.Joint
public import TauCeti.Probability.Distributions.OrderStatistic.Basic
public import TauCeti.MeasureTheory.Function.Lp.ApproximateIdentity
public import TauCeti.Analysis.InnerProductSpace.HilbertSchmidt.Basic
public import TauCeti.Analysis.OperatorIdeal.ApproximationNumber.HilbertSchmidt
public import TauCeti.Analysis.OperatorIdeal.ApproximationNumber.Positive
public import TauCeti.MeasureTheory.Measure.TotalVariation
public import TauCeti.Probability.Distributions.Binomial.Basic
public import TauCeti.Data.Fin.Tuple.OrderStatistic
public import TauCeti.Probability.Quantile
public import TauCeti.Probability.Distributions.Gaussian.Projection
public import TauCeti.Probability.Process.EmpiricalMeasure
public import TauCeti.MeasureTheory.Integral.PrekopaLeindler
public import TauCeti.Analysis.OperatorIdeal.ApproximationNumber.MinMax
public import TauCeti.Analysis.InnerProductSpace.Spectrum
public import TauCeti.Analysis.OperatorIdeal.ApproximationNumber.Basic
public import TauCeti.Analysis.OperatorIdeal.ApproximationNumber.Compact
public import TauCeti.Analysis.InnerProductSpace.KyFan
public import TauCeti.Analysis.OperatorIdeal.ApproximationNumber.EckartYoung

/-!
# Nonparametric statistics: target signatures

This file is not the roadmap: the roadmap is `README.md`, and this file is not an exhaustive
checklist. It states, against the pinned Mathlib and Tau Ceti and each with `sorry`, the
headlines of the README that carry a Lean name, each with every conclusion the README attaches
to it, together with the definitions their statements need. The README's other headlines are
targets of the same standing, stated there in prose with their locators or proof routes, and are
not stated here.

The conventions of the README are used throughout. Estimators are Markov kernels; total
variation is Mathlib's `tvDist` with values in `[0, 2]`; the squared Hellinger distance is
`∫ (√p - √q)²`, with values in `[0, 2]`; samples of size `n` are maps on `Fin n` under
`Measure.pi`, and statistics of a sequence use its first `n` terms. Real-valued consequences
replace weak convergence in `ℓ^∞(T)`. Lower bounds for unbounded losses use extended integrals
`∫⁻` in `ℝ≥0∞`, and log-likelihoods take values in `EReal`.

Definitions owned by `MathematicalStatisticsFoundations` appear as local copies with a docstring
naming their owner. The implementation namespace of the README is `TauCeti`; the prototypes live
in this roadmap's namespace.
-/

@[expose] public section

noncomputable section

open MeasureTheory ProbabilityTheory Filter Set Topology InformationTheory
open scoped ENNReal NNReal RealInnerProductSpace Matrix

namespace TauCetiRoadmap.MathematicalStatisticsNonparametric

attribute [local instance] Classical.propDecidable

/-! ## Local copies of `MathematicalStatisticsFoundations` vocabulary -/

section Foundations

variable {X Ω E : Type*} [MeasurableSpace X] [MeasurableSpace Ω]

/-- Local copy of `MathematicalStatisticsFoundations` 1.3: a test is a measurable function with
values in `[0, 1]`, the probability of rejection. -/
def IsStatisticalTest (φ : X → ℝ) : Prop :=
  Measurable φ ∧ ∀ x, φ x ∈ Icc 0 1

/-- Local copy of `MathematicalStatisticsFoundations` 2.4: the U-statistic of order `m`. -/
def uStatistic (m n : ℕ) (h : (Fin m → E) → ℝ) (x : Fin n → E) : ℝ :=
  ((n.descFactorial m : ℕ) : ℝ)⁻¹ *
    ∑ f ∈ (Finset.univ : Finset (Fin m → Fin n)).filter Function.Injective, h (x ∘ f)

/-- Local copy of `MathematicalStatisticsFoundations` 8.5: an i.i.d. family with law `P`. -/
def IsIndependentIdenticallyDistributed {ι : Type*} [MeasurableSpace E] (μ : Measure Ω)
    (Y : ι → Ω → E) (P : Measure E) : Prop :=
  (∀ i, Measurable (Y i)) ∧ iIndepFun Y μ ∧ ∀ i, μ.map (Y i) = P

/-- Local copy of `MathematicalStatisticsFoundations` 9.1: the empirical distribution function
of a finite sample. -/
def empiricalCdf {n : ℕ} (x : Fin n → ℝ) (t : ℝ) : ℝ :=
  ((Finset.univ.filter fun i ↦ x i ≤ t).card : ℝ) / n

/-- Local copy of `MathematicalStatisticsFoundations` 9.2: the Kolmogorov–Smirnov statistic. -/
def ksStatistic (P : Measure ℝ) {n : ℕ} (x : Fin n → ℝ) : ℝ :=
  ⨆ t : ℚ, |empiricalCdf x t - cdf P t|

/-- Local copy of `MathematicalStatisticsFoundations` 9.3: the kernel density estimator. -/
def kernelDensityEstimator (K : ℝ → ℝ) (h : ℝ) {n : ℕ} (x : Fin n → ℝ) (t : ℝ) : ℝ :=
  ((n : ℝ) * h)⁻¹ * ∑ i, K ((t - x i) / h)

/-- The first `n` observations of a sequence, as a sample on `Fin n`. -/
def firstN {α : Type*} (Y : ℕ → Ω → α) (n : ℕ) (ω : Ω) : Fin n → α := fun i ↦ Y i ω

end Foundations

/-! ## Layer 1: divergences -/

section Layer1

variable {X Y : Type*} [MeasurableSpace X] [MeasurableSpace Y]

/-- **1.1** The Hellinger affinity `∫ √(p q) dν`, with densities relative to `ν = P + Q`. -/
def hellingerAffinity (P Q : Measure X) : ℝ :=
  ∫ x, √((P.rnDeriv (P + Q) x).toReal * (Q.rnDeriv (P + Q) x).toReal) ∂(P + Q)

/-- **1.1** The squared Hellinger distance `∫ (√p - √q)² = 2 (1 - affinity)`, in `[0, 2]`. -/
def sqHellinger (P Q : Measure X) : ℝ := 2 * (1 - hellingerAffinity P Q)

/-- **1.1** The Hellinger distance may be computed with any σ-finite dominating measure. -/
theorem sqHellinger_eq_integral (P Q μ : Measure X) [IsProbabilityMeasure P]
    [IsProbabilityMeasure Q] [SigmaFinite μ] (hP : P ≪ μ) (hQ : Q ≪ μ) :
    sqHellinger P Q =
      ∫ x, (√(P.rnDeriv μ x).toReal - √(Q.rnDeriv μ x).toReal) ^ 2 ∂μ := by
  sorry

/-- **1.1** The affinity of finite products is the product of the affinities. -/
theorem hellingerAffinity_pi {n : ℕ} (P Q : Fin n → Measure X)
    [∀ i, IsProbabilityMeasure (P i)] [∀ i, IsProbabilityMeasure (Q i)] :
    hellingerAffinity (Measure.pi P) (Measure.pi Q) = ∏ i, hellingerAffinity (P i) (Q i) := by
  sorry

/-- **1.1** Data processing: a Markov kernel does not decrease the affinity. -/
theorem hellingerAffinity_le_comp (P Q : Measure X) [IsProbabilityMeasure P]
    [IsProbabilityMeasure Q] (κ : Kernel X Y) [IsMarkovKernel κ] :
    hellingerAffinity P Q ≤ hellingerAffinity (κ ∘ₘ P) (κ ∘ₘ Q) := by
  sorry

/-- **1.1** The Hellinger affinity of two normal laws with a common variance. -/
theorem hellingerAffinity_gaussianReal (a b : ℝ) {v : ℝ≥0} (hv : v ≠ 0) :
    hellingerAffinity (gaussianReal a v) (gaussianReal b v) =
      Real.exp (-(a - b) ^ 2 / (8 * v)) := by
  sorry

/-- **1.2** The chi-squared divergence, `∞` without absolute continuity. -/
def chiSqDiv (P Q : Measure X) : ℝ≥0∞ :=
  if P ≪ Q then (∫⁻ x, P.rnDeriv Q x ^ 2 ∂Q) - 1 else ∞

/-- **1.2** Tensorization of `1 + χ²`. -/
theorem one_add_chiSqDiv_pi {n : ℕ} (P Q : Fin n → Measure X)
    [∀ i, IsProbabilityMeasure (P i)] [∀ i, IsProbabilityMeasure (Q i)] :
    1 + chiSqDiv (Measure.pi P) (Measure.pi Q) = ∏ i, (1 + chiSqDiv (P i) (Q i)) := by
  sorry

/-- **1.2** The chi-squared divergence between normal laws with a common variance. -/
theorem one_add_chiSqDiv_gaussianReal (a b : ℝ) {v : ℝ≥0} (hv : v ≠ 0) :
    1 + chiSqDiv (gaussianReal a v) (gaussianReal b v) =
      ENNReal.ofReal (Real.exp ((a - b) ^ 2 / v)) := by
  sorry

/-- **1.3** Tensorization of the Kullback–Leibler divergence over finite products. -/
theorem klDiv_pi {n : ℕ} (P Q : Fin n → Measure X)
    [∀ i, IsProbabilityMeasure (P i)] [∀ i, IsProbabilityMeasure (Q i)] :
    klDiv (Measure.pi P) (Measure.pi Q) = ∑ i, klDiv (P i) (Q i) := by
  sorry

/-- **1.3** The Kullback–Leibler divergence between normal laws with a common variance. -/
theorem klDiv_gaussianReal (a b : ℝ) {v : ℝ≥0} (hv : v ≠ 0) :
    klDiv (gaussianReal a v) (gaussianReal b v) = ENNReal.ofReal ((a - b) ^ 2 / (2 * v)) := by
  sorry

/-- **1.3** The Kullback–Leibler divergence between isotropic Gaussian laws on `ℝ^d`. -/
theorem klDiv_multivariateGaussian {d : ℕ} (a b : EuclideanSpace ℝ (Fin d)) {v : ℝ} (hv : 0 < v) :
    klDiv (multivariateGaussian a (v • (1 : Matrix (Fin d) (Fin d) ℝ)))
        (multivariateGaussian b (v • (1 : Matrix (Fin d) (Fin d) ℝ))) =
      ENNReal.ofReal (‖a - b‖ ^ 2 / (2 * v)) := by
  sorry

/-- **1.3** The binary Kullback–Leibler divergence. -/
def klBin (a b : ℝ) : ℝ :=
  a * Real.log (a / b) + (1 - a) * Real.log ((1 - a) / (1 - b))

/-- **1.3** The lower bound of the binary divergence used in Fano's inequality. -/
theorem mul_log_sub_log_two_le_klBin {a : ℝ} (ha : a ∈ Icc 0 1) {M : ℕ} (hM : 2 ≤ M) :
    a * Real.log M - Real.log 2 ≤ klBin a (1 / M) := by
  sorry

/-- **1.4** The testing affinity: the least sum of the two error probabilities of a test. -/
theorem iInf_test_eq_one_sub_tvDist (P Q : Measure X) [IsProbabilityMeasure P]
    [IsProbabilityMeasure Q] :
    ⨅ φ : {φ : X → ℝ // IsStatisticalTest φ}, (∫ x, φ.1 x ∂P + ∫ x, (1 - φ.1 x) ∂Q) =
      1 - tvDist P Q / 2 := by
  sorry

/-- **1.4** Le Cam's inequalities between the Hellinger and total variation distances. -/
theorem sqHellinger_le_tvDist_le (P Q : Measure X) [IsProbabilityMeasure P]
    [IsProbabilityMeasure Q] :
    sqHellinger P Q ≤ tvDist P Q ∧
      tvDist P Q ≤ √(sqHellinger P Q * (4 - sqHellinger P Q)) := by
  sorry

/-- **1.4** The squared Hellinger distance is at most the Kullback–Leibler divergence. -/
theorem ofReal_sqHellinger_le_klDiv (P Q : Measure X) [IsProbabilityMeasure P]
    [IsProbabilityMeasure Q] :
    ENNReal.ofReal (sqHellinger P Q) ≤ klDiv P Q := by
  sorry

/-- **1.4** Pinsker's inequality in the normalization of `tvDist`. -/
theorem ofReal_tvDist_sq_le_two_mul_klDiv (P Q : Measure X) [IsProbabilityMeasure P]
    [IsProbabilityMeasure Q] :
    ENNReal.ofReal (tvDist P Q) ^ 2 ≤ 2 * klDiv P Q := by
  sorry

/-- **1.4** The Bretagnolle–Huber inequality. -/
theorem half_exp_neg_klDiv_le (P Q : Measure X) [IsProbabilityMeasure P]
    [IsProbabilityMeasure Q] (h : klDiv P Q ≠ ∞) :
    Real.exp (-(klDiv P Q).toReal) / 2 ≤ 1 - tvDist P Q / 2 := by
  sorry

/-- **1.4** The Kullback–Leibler divergence is at most `log (1 + χ²)`. -/
theorem klDiv_le_log_one_add_chiSqDiv (P Q : Measure X) [IsProbabilityMeasure P]
    [IsProbabilityMeasure Q] (h : chiSqDiv P Q ≠ ∞) :
    klDiv P Q ≤ ENNReal.ofReal (Real.log (1 + (chiSqDiv P Q).toReal)) := by
  sorry

end Layer1

/-! ## Layer 2: minimax lower bounds -/

section Layer2

variable {X Y : Type*} [MeasurableSpace X] [PseudoMetricSpace Y] [MeasurableSpace Y]
  [BorelSpace Y]

/-- **2.1** Reduction of estimation to testing: for finitely many `2 s`-separated parameters,
every estimator is dominated by a test, the composition of the estimator with a nearest-parameter
map. -/
theorem le_max_measure_dist_ge_of_test {ι : Type*} [Fintype ι] [Nonempty ι] [MeasurableSpace ι]
    [DiscreteMeasurableSpace ι] (P : ι → Measure X) [∀ i, IsProbabilityMeasure (P i)] (θ : ι → Y)
    {s : ℝ} (hs : ∀ i j, i ≠ j → 2 * s ≤ dist (θ i) (θ j)) (κ : Kernel X Y) [IsMarkovKernel κ] :
    ∃ ψ : Kernel X ι, IsMarkovKernel ψ ∧
      ∀ i, (ψ ∘ₘ P i) {i}ᶜ ≤ (κ ∘ₘ P i) {y | s ≤ dist y (θ i)} := by
  sorry

/-- **2.2** Le Cam's two-point bound in total variation. -/
theorem max_measure_ge_of_tvDist (P : Fin 2 → Measure X) [∀ i, IsProbabilityMeasure (P i)]
    (θ : Fin 2 → Y) {s : ℝ} (hs : 2 * s ≤ dist (θ 0) (θ 1)) (κ : Kernel X Y)
    [IsMarkovKernel κ] :
    (1 - tvDist (P 0) (P 1) / 2) / 2 ≤
      max ((κ ∘ₘ P 0).real {y | s ≤ dist y (θ 0)}) ((κ ∘ₘ P 1).real {y | s ≤ dist y (θ 1)}) := by
  sorry

/-- **2.2** Le Cam's two-point bound in Kullback–Leibler form. -/
theorem max_measure_ge_of_klDiv (P : Fin 2 → Measure X) [∀ i, IsProbabilityMeasure (P i)]
    (θ : Fin 2 → Y) {s α : ℝ} (hs : 2 * s ≤ dist (θ 0) (θ 1)) (hα0 : 0 ≤ α)
    (hα : klDiv (P 0) (P 1) ≤ ENNReal.ofReal α) (κ : Kernel X Y) [IsMarkovKernel κ] :
    max (Real.exp (-α) / 4) ((1 - √(α / 2)) / 2) ≤
      max ((κ ∘ₘ P 0).real {y | s ≤ dist y (θ 0)}) ((κ ∘ₘ P 1).real {y | s ≤ dist y (θ 1)}) := by
  sorry

/-- **2.2** Le Cam's bound for Mathlib's minimax risk under squared distance loss. -/
theorem minimaxRisk_ge_of_tvDist {Θ : Type*} [MeasurableSpace Θ] (P : Kernel Θ X)
    [IsMarkovKernel P] (g : Θ → Y) (θ₀ θ₁ : Θ) {s : ℝ} (hs0 : 0 ≤ s)
    (hs : 2 * s ≤ dist (g θ₀) (g θ₁)) :
    ENNReal.ofReal (s ^ 2 * (1 - tvDist (P θ₀) (P θ₁) / 2) / 2) ≤
      minimaxRisk (fun θ y ↦ ENNReal.ofReal (dist y (g θ) ^ 2)) P := by
  sorry

/-- **2.3** The Varshamov–Gilbert bound. -/
theorem exists_varshamovGilbert {m : ℕ} (hm : 8 ≤ m) :
    ∃ (M : ℕ) (ω : Fin (M + 1) → Fin m → Bool), (2 : ℝ) ^ ((m : ℝ) / 8) ≤ M ∧
      ω 0 = (fun _ ↦ false) ∧ ∀ j k, j ≠ k → (m : ℝ) / 8 ≤ hammingDist (ω j) (ω k) := by
  sorry

/-- **2.4** The uniform mixture of finitely many laws. -/
def uniformMixture {M : ℕ} (P : Fin M → Measure X) : Measure X :=
  (M : ℝ≥0∞)⁻¹ • ∑ j, P j

/-- **2.4** The mutual information between a uniform index and the observation. -/
def mutualInfoUniform {M : ℕ} (P : Fin M → Measure X) : ℝ≥0∞ :=
  (M : ℝ≥0∞)⁻¹ * ∑ j, klDiv (P j) (uniformMixture P)

/-- **2.4** Fano's inequality for the average error over a uniform index. The mutual information
is at most `log M`, so its `toReal` is not a junk value. -/
theorem fano_average {M : ℕ} (hM : 2 ≤ M) (P : Fin M → Measure X)
    [∀ j, IsProbabilityMeasure (P j)] (ψ : Kernel X (Fin M)) [IsMarkovKernel ψ] :
    1 - ((mutualInfoUniform P).toReal + Real.log 2) / Real.log M ≤
      (M : ℝ)⁻¹ * ∑ j, (ψ ∘ₘ P j).real {j}ᶜ := by
  sorry

/-- **2.4** Fano's inequality for the maximal error, a consequence of `fano_average`. -/
theorem fano {M : ℕ} (hM : 2 ≤ M) (P : Fin M → Measure X) [∀ j, IsProbabilityMeasure (P j)]
    (ψ : Kernel X (Fin M)) [IsMarkovKernel ψ] :
    1 - ((mutualInfoUniform P).toReal + Real.log 2) / Real.log M ≤
      ⨆ j, (ψ ∘ₘ P j).real {j}ᶜ := by
  sorry

/-- **2.4** The mutual information is bounded by the average divergence from any law. -/
theorem mutualInfoUniform_le {M : ℕ} (P : Fin M → Measure X) [∀ j, IsProbabilityMeasure (P j)]
    (Q : Measure X) [IsProbabilityMeasure Q] :
    mutualInfoUniform P ≤ (M : ℝ≥0∞)⁻¹ * ∑ j, klDiv (P j) Q := by
  sorry

/-- **2.5** Assouad's lemma in total variation form. -/
theorem assouad {m : ℕ} (P : (Fin m → Bool) → Measure X) [∀ ω, IsProbabilityMeasure (P ω)]
    (κ : Kernel X (Fin m → Bool)) [IsMarkovKernel κ] :
    (m : ℝ) / 2 * ⨅ p : {p : (Fin m → Bool) × (Fin m → Bool) // hammingDist p.1 p.2 = 1},
        (1 - tvDist (P p.1.1) (P p.1.2) / 2) ≤
      ⨆ ω, ∫ ω', (hammingDist ω' ω : ℝ) ∂(κ ∘ₘ P ω) := by
  sorry

/-- **2.5** Assouad's lemma in Kullback–Leibler form. -/
theorem assouad_klDiv {m : ℕ} (P : (Fin m → Bool) → Measure X) [∀ ω, IsProbabilityMeasure (P ω)]
    {α : ℝ} (hα0 : 0 ≤ α) (hα : ∀ ω ω', hammingDist ω ω' = 1 → klDiv (P ω) (P ω') ≤ ENNReal.ofReal α)
    (κ : Kernel X (Fin m → Bool)) [IsMarkovKernel κ] :
    (m : ℝ) / 2 * max (Real.exp (-α) / 2) (1 - √(α / 2)) ≤
      ⨆ ω, ∫ ω', (hammingDist ω' ω : ℝ) ∂(κ ∘ₘ P ω) := by
  sorry

/-- **2.5** Assouad's lemma for parameters in a metric space. The squared-distance risk is an
extended integral, so an estimator without a finite second moment has infinite risk. -/
theorem assouad_metric {m : ℕ} (P : (Fin m → Bool) → Measure X)
    [∀ ω, IsProbabilityMeasure (P ω)] (θ : (Fin m → Bool) → Y) {c : ℝ} (hc : 0 < c)
    (hθ : ∀ ω ω', c * hammingDist ω ω' ≤ dist (θ ω) (θ ω') ^ 2) (κ : Kernel X Y)
    [IsMarkovKernel κ] :
    ENNReal.ofReal (c / 8 * m * ⨅ p : {p : (Fin m → Bool) × (Fin m → Bool) //
        hammingDist p.1 p.2 = 1}, (1 - tvDist (P p.1.1) (P p.1.2) / 2)) ≤
      ⨆ ω, ∫⁻ y, ENNReal.ofReal (dist y (θ ω) ^ 2) ∂(κ ∘ₘ P ω) := by
  sorry

end Layer2

/-! ## Layer 3: exact rank theory -/

section Layer3

/-- **3.1** The rank `#{j | x j ≤ x i}`, one-based for distinct entries. -/
def rank {n : ℕ} (x : Fin n → ℝ) (i : Fin n) : ℕ :=
  (Finset.univ.filter fun j ↦ x j ≤ x i).card

/-- **3.1** The rank of `|x i|` among the absolute values. -/
def absRank {n : ℕ} (x : Fin n → ℝ) (i : Fin n) : ℕ :=
  (Finset.univ.filter fun j ↦ |x j| ≤ |x i|).card

/-- **3.1** Under an atomless law the rank vector is uniform on the permutations and
independent of the vector `x ∘ Tuple.sort x` of order statistics: for every measurable set `A` of
sorted vectors, the event `{rank = σ + 1, sorted vector ∈ A}` has probability
`(n!)⁻¹ · P(sorted vector ∈ A)`. With `A = univ` this is the uniform law of the ranks. -/
theorem measure_rank_eq_perm {n : ℕ} (P : Measure ℝ) [IsProbabilityMeasure P] [NullSingletonClass P]
    (σ : Equiv.Perm (Fin n)) {A : Set (Fin n → ℝ)} (hA : MeasurableSet A) :
    (Measure.pi fun _ : Fin n ↦ P)
        {x | (∀ i, rank x i = (σ i : ℕ) + 1) ∧ (fun i ↦ x (Tuple.sort x i)) ∈ A} =
      ((n.factorial : ℝ≥0∞))⁻¹ *
        (Measure.pi fun _ : Fin n ↦ P) {x | (fun i ↦ x (Tuple.sort x i)) ∈ A} := by
  sorry

/-- **3.1** Signed ranks: under a symmetric atomless law the signs `1_{0 < x i}` are independent
fair Bernoulli variables, independent of the vector `absRank x`, which is uniform on the
permutations. -/
theorem measure_signs_absRank_eq {n : ℕ} (P : Measure ℝ) [IsProbabilityMeasure P]
    [NullSingletonClass P] (hsymm : P.map Neg.neg = P) (b : Fin n → Bool)
    (σ : Equiv.Perm (Fin n)) :
    (Measure.pi fun _ : Fin n ↦ P)
        {x | (∀ i, decide (0 < x i) = b i) ∧ ∀ i, absRank x i = (σ i : ℕ) + 1} =
      ((2 ^ n * n.factorial : ℕ) : ℝ≥0∞)⁻¹ := by
  sorry

/-- **3.2** The linear rank statistic `∑ c i a (rank x i)`. -/
def linearRankStatistic {N : ℕ} (c : Fin N → ℝ) (a : ℕ → ℝ) (x : Fin N → ℝ) : ℝ :=
  ∑ i, c i * a (rank x i)

/-- **3.2** The mean of a linear rank statistic. -/
theorem integral_linearRankStatistic {N : ℕ} (P : Measure ℝ) [IsProbabilityMeasure P] [NullSingletonClass P]
    (c : Fin N → ℝ) (a : ℕ → ℝ) :
    ∫ x, linearRankStatistic c a x ∂(Measure.pi fun _ ↦ P) =
      (∑ i, c i) * (N : ℝ)⁻¹ * ∑ k ∈ Finset.range N, a (k + 1) := by
  sorry

/-- **3.2** The variance of a linear rank statistic. -/
theorem variance_linearRankStatistic {N : ℕ} (hN : 2 ≤ N) (P : Measure ℝ)
    [IsProbabilityMeasure P] [NullSingletonClass P] (c : Fin N → ℝ) (a : ℕ → ℝ) :
    Var[linearRankStatistic c a; Measure.pi fun _ ↦ P] =
      ((N : ℝ) - 1)⁻¹ * (∑ i, (c i - (N : ℝ)⁻¹ * ∑ j, c j) ^ 2) *
        ∑ k ∈ Finset.range N,
          (a (k + 1) - (N : ℝ)⁻¹ * ∑ l ∈ Finset.range N, a (l + 1)) ^ 2 := by
  sorry

/-- **3.2** The exact score `E φ(U_{N(i)})`, an integral against the beta density of the
`i`-th uniform order statistic, for `1 ≤ i ≤ N`. It is the true expectation when `φ` is
square-integrable on `(0, 1)`, the hypothesis of every theorem that uses it, since the beta
density is bounded. -/
def exactScore (φ : ℝ → ℝ) (N i : ℕ) : ℝ :=
  ∫ u in (0 : ℝ)..1, φ u * ((N.factorial : ℝ) / ((i - 1).factorial * (N - i).factorial)) *
    u ^ (i - 1) * (1 - u) ^ (N - i)

/-- **3.3** The sign test: the number of observations above a common median is binomial. -/
theorem measure_card_gt_ge {n : ℕ} (P : Fin n → Measure ℝ) [∀ i, IsProbabilityMeasure (P i)]
    (θ₀ : ℝ) (hP : ∀ i, P i (Ioi θ₀) = 1 / 2) (k : ℕ) :
    (Measure.pi P) {x | k ≤ (Finset.univ.filter fun i ↦ θ₀ < x i).card} =
      ∑ j ∈ Finset.Icc k n, (n.choose j : ℝ≥0∞) / 2 ^ n := by
  sorry

/-- **3.3** The Wilcoxon signed-rank statistic. -/
def signedRankStatistic {n : ℕ} (x : Fin n → ℝ) : ℝ :=
  ∑ i, if 0 < x i then (absRank x i : ℝ) else 0

/-- **3.3** The null law of the signed-rank statistic: under a symmetric atomless law it is the
law of `∑ j, (j + 1) B j` for independent fair Bernoulli variables `B j` with values in
`{0, 1}`. -/
theorem map_signedRankStatistic_pi {n : ℕ} (P : Measure ℝ) [IsProbabilityMeasure P]
    [NullSingletonClass P] (hsymm : P.map Neg.neg = P) :
    (Measure.pi fun _ : Fin n ↦ P).map signedRankStatistic =
      (Measure.pi fun _ : Fin n ↦
          bernoulliMeasure (1 : ℝ) 0 ⟨1 / 2, by norm_num, by norm_num⟩).map
        fun b ↦ ∑ j : Fin n, ((j : ℕ) + 1 : ℝ) * b j := by
  sorry

/-- **3.3** The null mean and variance of the signed-rank statistic. -/
theorem integral_variance_signedRankStatistic {n : ℕ} (P : Measure ℝ) [IsProbabilityMeasure P]
    [NullSingletonClass P] (hsymm : P.map Neg.neg = P) :
    ∫ x, signedRankStatistic x ∂(Measure.pi fun _ : Fin n ↦ P) = n * (n + 1) / 4 ∧
      Var[signedRankStatistic; Measure.pi fun _ : Fin n ↦ P] =
        n * (n + 1) * (2 * n + 1) / 24 := by
  sorry

/-- **3.3** The Mann–Whitney statistic `#{(i, j) | x i < y j}`. -/
def mannWhitney {m n : ℕ} (x : Fin m → ℝ) (y : Fin n → ℝ) : ℝ :=
  ((Finset.univ : Finset (Fin m × Fin n)).filter fun p ↦ x p.1 < y p.2).card

/-- **3.3** The null mean and variance of the Mann–Whitney statistic. -/
theorem integral_variance_mannWhitney {m n : ℕ} (P : Measure ℝ) [IsProbabilityMeasure P]
    [NullSingletonClass P] :
    ∫ z, mannWhitney z.1 z.2 ∂((Measure.pi fun _ : Fin m ↦ P).prod (Measure.pi fun _ : Fin n ↦ P))
        = m * n / 2 ∧
      Var[fun z ↦ mannWhitney z.1 z.2;
          (Measure.pi fun _ : Fin m ↦ P).prod (Measure.pi fun _ : Fin n ↦ P)] =
        m * n * (m + n + 1) / 12 := by
  sorry

/-- **3.3** Kendall's tau, a U-statistic of order `2`. -/
def kendallTau {n : ℕ} (z : Fin n → ℝ × ℝ) : ℝ :=
  uStatistic 2 n (fun p ↦ Real.sign (((p 0).1 - (p 1).1) * ((p 0).2 - (p 1).2))) z

/-- **3.3** The null mean and variance of Kendall's tau under independence. -/
theorem integral_variance_kendallTau {n : ℕ} (hn : 2 ≤ n) (P₁ P₂ : Measure ℝ)
    [IsProbabilityMeasure P₁] [IsProbabilityMeasure P₂] [NullSingletonClass P₁]
    [NullSingletonClass P₂] :
    ∫ z, kendallTau z ∂(Measure.pi fun _ : Fin n ↦ P₁.prod P₂) = 0 ∧
      Var[kendallTau; Measure.pi fun _ : Fin n ↦ P₁.prod P₂] =
        2 * (2 * n + 5) / (9 * n * (n - 1)) := by
  sorry

/-- **3.3** The Kruskal–Wallis statistic for a group assignment `g`; group sizes are the fibre sizes of `g`. -/
def kruskalWallis {N k : ℕ} (g : Fin N → Fin k) (x : Fin N → ℝ) : ℝ :=
  12 / (N * (N + 1)) * ∑ j, (∑ i ∈ Finset.univ.filter (fun i ↦ g i = j), (rank x i : ℝ)) ^ 2 /
      (Finset.univ.filter fun i ↦ g i = j).card - 3 * (N + 1)

/-- **3.3** The null mean of the Kruskal–Wallis statistic is `k - 1`. -/
theorem integral_kruskalWallis {N k : ℕ} (hN : 0 < N) (g : Fin N → Fin k)
    (hg : Function.Surjective g)
    (P : Measure ℝ) [IsProbabilityMeasure P] [NullSingletonClass P] :
    ∫ x, kruskalWallis g x ∂(Measure.pi fun _ ↦ P) = k - 1 := by
  sorry

/-- **3.4** The number of Walsh averages `(x i + x j)/2`, `i ≤ j`, at most `t`. -/
def walshCount {n : ℕ} (x : Fin n → ℝ) (t : ℝ) : ℕ :=
  ((Finset.univ : Finset (Fin n × Fin n)).filter fun p ↦ p.1 ≤ p.2 ∧ (x p.1 + x p.2) / 2 ≤ t).card

/-- **3.4** The Hodges–Lehmann estimator: the midpoint of the lower and upper medians of the
`M = n (n + 1) / 2` Walsh averages. For `n ≥ 1` both sets below are nonempty (they contain every
`t` above the largest Walsh average, where the count is `M`) and bounded below (by the smallest
Walsh average, below which the count is `0 < M / 2`), so the infima are the true medians. For
`n = 0` the value is `0` by convention: there the first set is all of `ℝ` and the second empty. -/
def hodgesLehmann {n : ℕ} (x : Fin n → ℝ) : ℝ :=
  if n = 0 then 0 else
    (sInf {t | ((n * (n + 1) / 2 : ℕ) : ℝ) / 2 ≤ walshCount x t} +
      sInf {t | ((n * (n + 1) / 2 : ℕ) : ℝ) / 2 < walshCount x t}) / 2

/-- **3.4** Tukey's identity: for a sample with distinct entries, the signed-rank statistic
counts the Walsh averages above `θ`. -/
theorem signedRankStatistic_sub_eq {n : ℕ} (x : Fin n → ℝ) (hx : Function.Injective x) (θ : ℝ)
    (hθ : ∀ i j, (x i + x j) / 2 ≠ θ) :
    signedRankStatistic (fun i ↦ x i - θ) =
      ((Finset.univ : Finset (Fin n × Fin n)).filter
        fun p ↦ p.1 ≤ p.2 ∧ θ < (x p.1 + x p.2) / 2).card := by
  sorry

/-- **3.5** The Kolmogorov–Smirnov statistic is distribution-free for a continuous law. -/
theorem map_ksStatistic_pi {n : ℕ} (P : Measure ℝ) [IsProbabilityMeasure P]
    (hP : Continuous (cdf P)) :
    (Measure.pi fun _ : Fin n ↦ P).map (ksStatistic P) =
      (Measure.pi fun _ : Fin n ↦ volume.restrict (Icc (0 : ℝ) 1)).map
        (ksStatistic (volume.restrict (Icc (0 : ℝ) 1))) := by
  sorry

/-- **3.5** The Cramér–von Mises statistic `n ∫ (F̂ₙ - F)² dP`. -/
def cvmStatistic (P : Measure ℝ) {n : ℕ} (x : Fin n → ℝ) : ℝ :=
  n * ∫ t, (empiricalCdf x t - cdf P t) ^ 2 ∂P

/-- **3.5** The order-statistic formula for the Cramér–von Mises statistic. -/
theorem cvmStatistic_eq {n : ℕ} (hn : 0 < n) (P : Measure ℝ) [IsProbabilityMeasure P]
    (hP : Continuous (cdf P)) (x : Fin n → ℝ) (hx : Monotone x) :
    cvmStatistic P x = 1 / (12 * n) + ∑ i : Fin n, (cdf P (x i) - (2 * i + 1) / (2 * n)) ^ 2 := by
  sorry

/-- **3.5** The two-sample Kolmogorov–Smirnov statistic `sup_t |F̂_m(t) - Ĝ_n(t)|`, as a
supremum over `ℚ` (bounded by `1`, so the real supremum is the true one). Both empirical
distribution functions are right-continuous step functions, so the supremum over `ℚ` equals the
supremum over `ℝ`. -/
def ksTwoSample {m n : ℕ} (x : Fin m → ℝ) (y : Fin n → ℝ) : ℝ :=
  ⨆ t : ℚ, |empiricalCdf x t - empiricalCdf y t|

/-- **3.6** The Kolmogorov distribution function. -/
def kolmogorovCdf (x : ℝ) : ℝ :=
  if 0 < x then 1 - 2 * ∑' k : ℕ, (-1) ^ k * Real.exp (-2 * (k + 1) ^ 2 * x ^ 2) else 0

/-- **3.6** The Gnedenko–Korolyuk sum `C(2n, n)⁻¹ ∑_{j ∈ ℤ} (-1)^j C(2n, n - j k)`, with
`C(2n, m) = 0` for `m < 0` and for `m > 2n`. For `k ≥ 1` only finitely many terms are nonzero;
for `k = 0` the series is not summable and the value is the junk `0`, which the limit below never
sees, since `⌈x √(2n)⌉₊ ≥ 1` for `x > 0` and `n ≥ 1`. -/
def gnedenkoKorolyuk (n k : ℕ) : ℝ :=
  ((2 * n).choose n : ℝ)⁻¹ * ∑' j : ℤ, (-1 : ℝ) ^ j *
    if 0 ≤ (n : ℤ) - j * k then (((2 * n).choose ((n : ℤ) - j * k).toNat : ℕ) : ℝ) else 0

/-- **3.5** The Gnedenko–Korolyuk formula: for two samples of equal size `n` from a common
continuous law and every integer `k ≥ 1`, `P(n D_{n,n} < k)` is the sum `gnedenkoKorolyuk n k`. -/
theorem measureReal_mul_ksTwoSample_lt {n : ℕ} (P : Measure ℝ) [IsProbabilityMeasure P]
    (hP : Continuous (cdf P)) {k : ℕ} (hk : 1 ≤ k) :
    ((Measure.pi fun _ : Fin n ↦ P).prod (Measure.pi fun _ : Fin n ↦ P)).real
        {z | (n : ℝ) * ksTwoSample z.1 z.2 < k} = gnedenkoKorolyuk n k := by
  sorry

/-- **3.6** The Kolmogorov density. -/
def kolmogorovDensity (x : ℝ) : ℝ :=
  if 0 < x then 8 * x * ∑' k : ℕ, (-1) ^ k * (k + 1) ^ 2 * Real.exp (-2 * (k + 1) ^ 2 * x ^ 2)
  else 0

/-- **3.6** The Kolmogorov distribution. -/
def kolmogorovMeasure : Measure ℝ :=
  volume.withDensity fun x ↦ ENNReal.ofReal (kolmogorovDensity x)

/-- **3.6** The lattice-path limit of the Gnedenko–Korolyuk sums. -/
theorem tendsto_gnedenkoKorolyuk {x : ℝ} (hx : 0 < x) :
    Tendsto (fun n : ℕ ↦ gnedenkoKorolyuk n ⌈x * √(2 * n)⌉₊) atTop (𝓝 (kolmogorovCdf x)) := by
  sorry

/-- **3.6** The Kolmogorov density is nonnegative. -/
theorem kolmogorovDensity_nonneg (x : ℝ) : 0 ≤ kolmogorovDensity x := by
  sorry

/-- **3.6** The Kolmogorov distribution is a probability measure. -/
instance isProbabilityMeasure_kolmogorovMeasure : IsProbabilityMeasure kolmogorovMeasure := by
  sorry

/-- **3.6** The distribution function of the Kolmogorov distribution. -/
theorem cdf_kolmogorovMeasure : cdf kolmogorovMeasure = kolmogorovCdf := by
  sorry

/-- **3.6** The Cramér–von Mises limit law: the law of `∑ Z_j² / (jπ)²`. -/
def cvmLimitLaw : Measure ℝ :=
  (Measure.infinitePi fun _ : ℕ ↦ gaussianReal 0 1).map fun z ↦
    (∑' j : ℕ, ENNReal.ofReal (z j ^ 2 / ((j + 1) * Real.pi) ^ 2)).toReal

/-- **3.6** The Cramér–von Mises limit law is a probability measure with mean `1/6` and
variance `1/45`. -/
theorem cvmLimitLaw_mean : IsProbabilityMeasure cvmLimitLaw ∧ ∫ x, x ∂cvmLimitLaw = 1 / 6 ∧
    Var[fun x ↦ x; cvmLimitLaw] = 1 / 45 := by
  sorry

end Layer3

/-! ## Layer 4: rank and goodness-of-fit asymptotics -/

section Layer4

variable {Ω : Type*} [MeasurableSpace Ω] (μ : Measure Ω) [IsProbabilityMeasure μ]

/-- **4.1** Hájek's projection `N c̄ ā + ∑ i, (c i - c̄) φ (F (x i))` of the linear rank statistic
with exact scores, `F = cdf P` and `ā` the average of the exact scores. -/
def hajekProjection (P : Measure ℝ) (φ : ℝ → ℝ) {N : ℕ} (c : Fin N → ℝ) (x : Fin N → ℝ) : ℝ :=
  (∑ i, c i) * (N : ℝ)⁻¹ * ∑ k ∈ Finset.range N, exactScore φ N (k + 1) +
    ∑ i, (c i - (N : ℝ)⁻¹ * ∑ j, c j) * φ (cdf P (x i))

/-- **4.1** Hájek's projection has the mean of the rank statistic, and the relative variance of
the difference tends to `0`. -/
theorem tendsto_variance_linearRankStatistic_sub_projection (P : Measure ℝ)
    [IsProbabilityMeasure P] [NullSingletonClass P] (φ : ℝ → ℝ)
    (hφ : MemLp φ 2 (volume.restrict (Ioo 0 1)))
    (hφc : ∀ a : ℝ, ¬ φ =ᵐ[volume.restrict (Ioo 0 1)] fun _ ↦ a) (c : (N : ℕ) → Fin N → ℝ) :
    (∀ N, ∫ x, linearRankStatistic (c N) (exactScore φ N) x ∂(Measure.pi fun _ ↦ P) =
      ∫ x, hajekProjection P φ (c N) x ∂(Measure.pi fun _ ↦ P)) ∧
    Tendsto (fun N ↦
        Var[fun x ↦ linearRankStatistic (c N) (exactScore φ N) x - hajekProjection P φ (c N) x;
          Measure.pi fun _ ↦ P] /
        Var[linearRankStatistic (c N) (exactScore φ N); Measure.pi fun _ ↦ P]) atTop (𝓝 0) := by
  sorry

/-- **4.1** The rank central limit theorem under Noether's condition, with exact scores: the
variance is eventually positive and the standardized statistic is asymptotically standard
normal. -/
theorem tendstoInDistribution_linearRankStatistic (P : Measure ℝ) [IsProbabilityMeasure P]
    [NullSingletonClass P] (φ : ℝ → ℝ) (hφ : MemLp φ 2 (volume.restrict (Ioo 0 1)))
    (hφc : ∀ a : ℝ, ¬ φ =ᵐ[volume.restrict (Ioo 0 1)] fun _ ↦ a) (c : (N : ℕ) → Fin N → ℝ)
    (hpos : ∀ᶠ N in atTop, 0 < ∑ i, (c N i - (N : ℝ)⁻¹ * ∑ j, c N j) ^ 2)
    (hnoether : Tendsto (fun N ↦ (⨆ i, (c N i - (N : ℝ)⁻¹ * ∑ j, c N j) ^ 2) /
      ∑ i, (c N i - (N : ℝ)⁻¹ * ∑ j, c N j) ^ 2) atTop (𝓝 0)) :
    (∀ᶠ N in atTop, 0 < Var[linearRankStatistic (c N) (exactScore φ N); Measure.pi fun _ ↦ P]) ∧
    TendstoInDistribution
      (fun (N : ℕ) (x : Fin N → ℝ) ↦
        (linearRankStatistic (c N) (exactScore φ N) x -
          ∫ y, linearRankStatistic (c N) (exactScore φ N) y ∂(Measure.pi fun _ ↦ P)) /
        √(Var[linearRankStatistic (c N) (exactScore φ N); Measure.pi fun _ ↦ P]))
      atTop id (fun N ↦ Measure.pi fun _ : Fin N ↦ P) (gaussianReal 0 1) := by
  sorry

/-- **4.2** Kendall's tau under independence: `√n τ̂ ⇝ N(0, 4/9)`. -/
theorem tendstoInDistribution_kendallTau (P₁ P₂ : Measure ℝ) [IsProbabilityMeasure P₁]
    [IsProbabilityMeasure P₂] [NullSingletonClass P₁] [NullSingletonClass P₂] (Z : ℕ → Ω → ℝ × ℝ)
    (hZ : IsIndependentIdenticallyDistributed μ Z (P₁.prod P₂)) :
    TendstoInDistribution (fun (n : ℕ) ω ↦ √(n : ℝ) * kendallTau (firstN Z n ω)) atTop id (fun _ ↦ μ)
      (gaussianReal 0 (4 / 9 : ℝ≥0)) := by
  sorry

/-- **4.4** The Chernoff–Savage inequality: the efficiency of the normal-scores test relative
to the `t` test is at least `1`. Here `q x = Φ⁻¹ (F x)`. The efficacy integral is an extended
integral: it may be infinite, and a Bochner integral would then be the junk value `0`. -/
theorem chernoffSavage (f : ℝ → ℝ) (hf : Measurable f) (hf0 : ∀ x, 0 ≤ f x)
    (hf1 : ∫ x, f x = 1) (hvar : Integrable fun x ↦ x ^ 2 * f x) (q : ℝ → ℝ)
    (hq : ∀ᵐ x, 0 < f x →
      cdf (gaussianReal 0 1) (q x) = cdf (volume.withDensity fun y ↦ ENNReal.ofReal (f y)) x) :
    1 ≤ ENNReal.ofReal (∫ x, x ^ 2 * f x - (∫ x, x * f x) ^ 2) *
      (∫⁻ x, ENNReal.ofReal (f x ^ 2 / gaussianPDFReal 0 1 (q x))) ^ 2 := by
  sorry

/-- **4.5** The Hodges–Lehmann limit. -/
theorem tendstoInDistribution_hodgesLehmann (f : ℝ → ℝ) (hf : Measurable f) (hf0 : ∀ x, 0 ≤ f x)
    (hf1 : ∫ x, f x = 1) (hsymm : ∀ x, f (-x) = f x) (hf2 : Integrable fun x ↦ f x ^ 2)
    (θ : ℝ) (X : ℕ → Ω → ℝ)
    (hX : IsIndependentIdenticallyDistributed μ X
      (volume.withDensity fun x ↦ ENNReal.ofReal (f (x - θ)))) :
    TendstoInDistribution (fun (n : ℕ) ω ↦ √(n : ℝ) * (hodgesLehmann (firstN X n ω) - θ)) atTop id
      (fun _ ↦ μ) (gaussianReal 0 (1 / (12 * (∫ x, f x ^ 2) ^ 2)).toNNReal) := by
  sorry

/-- **4.6** Kolmogorov's theorem: `√n Dₙ` converges in law to the Kolmogorov distribution. -/
theorem tendstoInDistribution_sqrt_mul_ksStatistic (P : Measure ℝ) [IsProbabilityMeasure P]
    (hP : Continuous (cdf P)) (X : ℕ → Ω → ℝ) (hX : IsIndependentIdenticallyDistributed μ X P) :
    TendstoInDistribution (fun (n : ℕ) ω ↦ √(n : ℝ) * ksStatistic P (firstN X n ω)) atTop id (fun _ ↦ μ)
      kolmogorovMeasure := by
  sorry

/-- **4.6** The supremum of the Brownian bridge `B t - t B 1` has the Kolmogorov law. The real
supremum is the true one on the paths that are continuous, almost all of them; on the null set of
other paths it may be the junk `0`, which does not change the law. -/
theorem map_sup_brownianBridge (B : ℝ≥0 → Ω → ℝ) (hB : IsBrownianReal B μ) :
    μ.map (fun ω ↦ ⨆ t : Icc (0 : ℝ≥0) 1, |B t ω - (t : ℝ) * B 1 ω|) = kolmogorovMeasure := by
  sorry

/-- **4.6** The bounded-differences Dvoretzky–Kiefer–Wolfowitz bound. -/
theorem measure_ksStatistic_ge_le (P : Measure ℝ) [IsProbabilityMeasure P]
    (hP : Continuous (cdf P)) {n : ℕ} (hn : 1 ≤ n) {t : ℝ} (ht : 0 ≤ t) :
    (Measure.pi fun _ : Fin n ↦ P).real
        {x | √(Real.log (2 * n + 2) / (2 * n)) + 1 / n + t ≤ ksStatistic P x} ≤
      Real.exp (-2 * n * t ^ 2) := by
  sorry

/-- **4.7** The Cramér–von Mises limit. -/
theorem tendstoInDistribution_cvmStatistic (P : Measure ℝ) [IsProbabilityMeasure P]
    (hP : Continuous (cdf P)) (X : ℕ → Ω → ℝ) (hX : IsIndependentIdenticallyDistributed μ X P) :
    haveI : IsProbabilityMeasure cvmLimitLaw := cvmLimitLaw_mean.1
    TendstoInDistribution (fun (n : ℕ) ω ↦ cvmStatistic P (firstN X n ω)) atTop id (fun _ ↦ μ)
      cvmLimitLaw := by
  sorry

/-- **4.7** The two-sample Kolmogorov–Smirnov limit under a common continuous law. -/
theorem tendstoInDistribution_twoSampleKS (P : Measure ℝ) [IsProbabilityMeasure P]
    (hP : Continuous (cdf P)) (m n : ℕ → ℕ) (hm : Tendsto m atTop atTop)
    (hn : Tendsto n atTop atTop) (X Y : ℕ → Ω → ℝ) (hX : IsIndependentIdenticallyDistributed μ X P)
    (hY : IsIndependentIdenticallyDistributed μ Y P)
    (hXY : IndepFun (fun ω i ↦ X i ω) (fun ω i ↦ Y i ω) μ) :
    TendstoInDistribution (fun (k : ℕ) ω ↦ √((m k * n k : ℝ) / (m k + n k)) *
        ksTwoSample (firstN X (m k) ω) (firstN Y (n k) ω)) atTop id (fun _ ↦ μ)
      kolmogorovMeasure := by
  sorry

/-- **4.7** The integrated squared Brownian bridge has the Cramér–von Mises limit law. -/
theorem map_integral_sq_brownianBridge (B : ℝ≥0 → Ω → ℝ) (hB : IsBrownianReal B μ) :
    μ.map (fun ω ↦ ∫ t in (0 : ℝ)..1, (B t.toNNReal ω - t * B 1 ω) ^ 2) = cvmLimitLaw := by
  sorry

end Layer4

/-! ## Layer 5: smoothing -/

section Layer5

/-- **5.1** The Hölder class `Σ(β, L)`: `ℓ = ⌈β⌉ - 1` continuous derivatives with an
`(β - ℓ)`-Hölder `ℓ`-th derivative. -/
def holderClass (β : ℝ) (L : ℝ≥0) : Set (ℝ → ℝ) :=
  {f | ContDiff ℝ (⌈β⌉₊ - 1 : ℕ) f ∧
    HolderWith L (β - (⌈β⌉₊ - 1 : ℕ)).toNNReal (iteratedDeriv (⌈β⌉₊ - 1) f)}

/-- **5.1** The Hölder density class `𝒫(β, L)`. -/
def holderDensityClass (β : ℝ) (L : ℝ≥0) : Set (ℝ → ℝ) :=
  {p | p ∈ holderClass β L ∧ (∀ x, 0 ≤ p x) ∧ ∫ x, p x = 1}

/-- **5.1** A kernel of order `ℓ`. -/
def IsKernelOfOrder (K : ℝ → ℝ) (ℓ : ℕ) : Prop :=
  Integrable K ∧ Integrable (fun u ↦ |u| ^ ℓ * K u) ∧ ∫ u, K u = 1 ∧
    ∀ j ∈ Finset.Icc 1 ℓ, ∫ u, u ^ j * K u = 0

/-- **5.1** A kernel of order at least `2` is negative on a set of positive measure. -/
theorem volume_neg_ne_zero_of_isKernelOfOrder {K : ℝ → ℝ} {ℓ : ℕ} (hK : IsKernelOfOrder K ℓ)
    (hℓ : 2 ≤ ℓ) : volume {u | K u < 0} ≠ 0 := by
  sorry

/-- The law with density `p` with respect to Lebesgue measure. -/
def densityLaw {E : Type*} [MeasurableSpace E] (ν : Measure E) (p : E → ℝ) : Measure E :=
  ν.withDensity fun x ↦ ENNReal.ofReal (p x)

/-- **5.1** The pointwise risk of the kernel density estimator over a Hölder class. -/
theorem kde_risk_le (β : ℝ) (hβ : 0 < β) (L : ℝ≥0) (K : ℝ → ℝ)
    (hK : IsKernelOfOrder K (⌈β⌉₊ - 1)) (hK2 : Integrable fun u ↦ K u ^ 2)
    (hKβ : Integrable fun u ↦ |u| ^ β * |K u|) {c : ℝ} (hc : 0 < c) :
    ∃ C, ∀ n : ℕ, 1 ≤ n → ∀ x₀ : ℝ, ∀ p ∈ holderDensityClass β L,
      ∫ x, (kernelDensityEstimator K (c * (n : ℝ) ^ (-1 / (2 * β + 1))) x x₀ - p x₀) ^ 2
          ∂(Measure.pi fun _ : Fin n ↦ densityLaw volume p) ≤
        C * (n : ℝ) ^ (-2 * β / (2 * β + 1)) := by
  sorry

/-- **5.9** The pointwise minimax lower bound over a Hölder density class, for all randomized
estimators. The squared-error risk is an extended integral. -/
theorem kde_minimax_lower (β : ℝ) (hβ : 0 < β) (L : ℝ≥0) (hL : 0 < L) (x₀ : ℝ) :
    ∃ c > 0, ∀ᶠ n : ℕ in atTop, ∀ κ : Kernel (Fin n → ℝ) ℝ, IsMarkovKernel κ →
      ENNReal.ofReal (c * (n : ℝ) ^ (-2 * β / (2 * β + 1))) ≤
        ⨆ p : holderDensityClass β L, ∫⁻ y, ENNReal.ofReal ((y - p.1 x₀) ^ 2)
          ∂(κ ∘ₘ Measure.pi fun _ : Fin n ↦ densityLaw volume p.1) := by
  sorry

/-- **5.2** The exact mean integrated squared error of the kernel density estimator. -/
theorem integral_mise_eq (K : ℝ → ℝ) (hK : Measurable K) (hK0 : ∀ u, 0 ≤ K u)
    (hK1 : ∫ u, K u = 1) (hK2 : Integrable fun u ↦ K u ^ 2) (f : ℝ → ℝ) (hf : Measurable f)
    (hf0 : ∀ x, 0 ≤ f x) (hf1 : ∫ x, f x = 1) (hf2 : Integrable fun x ↦ f x ^ 2)
    {h : ℝ} (hh : 0 < h) {n : ℕ} (hn : 1 ≤ n) :
    ∫ x, (∫ t, (kernelDensityEstimator K h x t - f t) ^ 2)
        ∂(Measure.pi fun _ : Fin n ↦ densityLaw volume f) =
      ∫ t, ((∫ y, h⁻¹ * K ((t - y) / h) * f y) - f t) ^ 2 +
        (∫ u, K u ^ 2) / (n * h) - (n : ℝ)⁻¹ * ∫ t, (∫ y, h⁻¹ * K ((t - y) / h) * f y) ^ 2 := by
  sorry

/-- **5.2** Pointwise asymptotic normality of the kernel density estimator, with its bias. -/
theorem tendstoInDistribution_kde {Ω : Type*} [MeasurableSpace Ω] (μ : Measure Ω)
    [IsProbabilityMeasure μ] (K : ℝ → ℝ) (hK : Measurable K) (hK0 : ∀ u, 0 ≤ K u)
    (hKb : ∃ C, ∀ u, K u ≤ C) (hKs : ∀ u, K (-u) = K u) (hK1 : ∫ u, K u = 1)
    (hK2 : Integrable fun u ↦ u ^ 2 * K u) (f : ℝ → ℝ) (hf : ContDiff ℝ 2 f) (hf0 : ∀ x, 0 ≤ f x)
    (hf1 : ∫ x, f x = 1) (hf2 : MemLp f 2) (hf''2 : MemLp (iteratedDeriv 2 f) 2)
    (hf''b : ∃ C, ∀ x, |iteratedDeriv 2 f x| ≤ C) (x : ℝ) (hfx : 0 < f x) (h : ℕ → ℝ)
    (hh : ∀ n, 0 < h n) (hh0 : Tendsto h atTop (𝓝 0))
    (hnh : Tendsto (fun n ↦ n * h n) atTop atTop)
    (hnh5 : Asymptotics.IsBigO atTop (fun n : ℕ ↦ (n : ℝ) * h n ^ 5) fun _ ↦ (1 : ℝ))
    (X : ℕ → Ω → ℝ) (hX : IsIndependentIdenticallyDistributed μ X (densityLaw volume f)) :
    TendstoInDistribution (fun (n : ℕ) ω ↦ √(n * h n) *
        (kernelDensityEstimator K (h n) (firstN X n ω) x - f x -
          h n ^ 2 / 2 * (∫ u, u ^ 2 * K u) * iteratedDeriv 2 f x)) atTop id (fun _ ↦ μ)
      (gaussianReal 0 ((∫ u, K u ^ 2) * f x).toNNReal) := by
  sorry

/-- **5.3** The `d`-dimensional kernel density estimator. -/
def kdeEuclidean {d n : ℕ} (K : EuclideanSpace ℝ (Fin d) → ℝ) (h : ℝ)
    (x : Fin n → EuclideanSpace ℝ (Fin d)) (t : EuclideanSpace ℝ (Fin d)) : ℝ :=
  ((n : ℝ) * h ^ d)⁻¹ * ∑ i, K (h⁻¹ • (t - x i))

/-- **5.3** Universal almost sure `L¹` consistency of the kernel density estimator. -/
theorem tendsto_ae_integral_abs_kde_sub {d : ℕ} {Ω : Type*} [MeasurableSpace Ω] (μ : Measure Ω)
    [IsProbabilityMeasure μ] (K : EuclideanSpace ℝ (Fin d) → ℝ) (hK : Integrable K)
    (hK1 : ∫ u, K u = 1) (h : ℕ → ℝ) (hh : ∀ n, 0 < h n) (hh0 : Tendsto h atTop (𝓝 0))
    (hnh : Tendsto (fun n ↦ n * h n ^ d) atTop atTop) (f : EuclideanSpace ℝ (Fin d) → ℝ)
    (hf : Measurable f) (hf0 : ∀ x, 0 ≤ f x) (hf1 : ∫ x, f x = 1)
    (X : ℕ → Ω → EuclideanSpace ℝ (Fin d))
    (hX : IsIndependentIdenticallyDistributed μ X (densityLaw volume f)) :
    ∀ᵐ ω ∂μ, Tendsto (fun n ↦ ∫ t, |kdeEuclidean K (h n) (firstN X n ω) t - f t|) atTop
      (𝓝 0) := by
  sorry

/-- **5.4** The Nadaraya–Watson estimator, with `0/0 = 0`. -/
def nadarayaWatson (K : ℝ → ℝ) (h : ℝ) {n : ℕ} (x Y : Fin n → ℝ) (t : ℝ) : ℝ :=
  (∑ i, K ((x i - t) / h) * Y i) / ∑ i, K ((x i - t) / h)

/-- **5.4** The local polynomial coefficient vector `(Xᵀ W X)⁻¹ Xᵀ W Y` of degree `p` at `t`.
When `Xᵀ W X` is singular, Mathlib's matrix inverse is `0` and so is the vector. -/
def localPolynomialCoeff (K : ℝ → ℝ) (h : ℝ) (p : ℕ) {n : ℕ} (x Y : Fin n → ℝ) (t : ℝ) :
    Fin (p + 1) → ℝ :=
  let D : Matrix (Fin n) (Fin (p + 1)) ℝ := Matrix.of fun i k ↦ (x i - t) ^ (k : ℕ)
  let W : Matrix (Fin n) (Fin n) ℝ := Matrix.diagonal fun i ↦ K ((x i - t) / h)
  (Dᵀ * W * D)⁻¹.mulVec ((Dᵀ * W).mulVec Y)

/-- **5.4** The leave-one-out identity for a linear smoother, coordinatewise and for the sum
of squares. -/
theorem sum_sq_loo_eq {n : ℕ} (L : Matrix (Fin n) (Fin n) ℝ) (Y : Fin n → ℝ)
    (hL : ∀ i, L i i ≠ 1) :
    (∀ i, Y i - (∑ j ∈ Finset.univ.erase i, L i j * Y j) / (1 - L i i) =
      (Y i - L.mulVec Y i) / (1 - L i i)) ∧
    ∑ i, (Y i - (∑ j ∈ Finset.univ.erase i, L i j * Y j) / (1 - L i i)) ^ 2 =
      ∑ i, ((Y i - L.mulVec Y i) / (1 - L i i)) ^ 2 := by
  sorry

/-- **5.7** The least-squares cross-validation criterion is unbiased for the risk up to
`∫ f²`. -/
theorem integral_lscv_eq (K : ℝ → ℝ) (hK : Integrable K) (hK2 : Integrable fun u ↦ K u ^ 2)
    (f : ℝ → ℝ) (hf : Measurable f)
    (hf0 : ∀ x, 0 ≤ f x) (hf1 : ∫ x, f x = 1) (hf2 : Integrable fun x ↦ f x ^ 2)
    {h : ℝ} (hh : 0 < h)
    (hKf : Integrable (fun p : ℝ × ℝ ↦ |K ((p.1 - p.2) / h)| * f p.2 * f p.1)) {n : ℕ}
    (hn : 2 ≤ n) :
    ∫ x, ((∫ t, kernelDensityEstimator K h x t ^ 2) -
        2 / n * ∑ i, (((n : ℝ) - 1) * h)⁻¹ *
          ∑ j ∈ Finset.univ.erase i, K ((x i - x j) / h))
        ∂(Measure.pi fun _ : Fin n ↦ densityLaw volume f) =
      ∫ x, (∫ t, (kernelDensityEstimator K h x t - f t) ^ 2)
          ∂(Measure.pi fun _ : Fin n ↦ densityLaw volume f) - ∫ x, f x ^ 2 := by
  sorry

/-- **5.8** The representer theorem: every minimizer of a regularized empirical risk lies in
the span of the kernel functions at the design points. -/
theorem mem_span_kerFun_of_isMinOn {𝒳 H : Type*} [NormedAddCommGroup H] [InnerProductSpace ℝ H]
    [CompleteSpace H] [RKHS ℝ H 𝒳 ℝ] {n : ℕ} (x : Fin n → 𝒳) (Y : Fin n → ℝ)
    (L : ℝ → ℝ → ℝ) {lam : ℝ} (hlam : 0 < lam) (f : H)
    (hf : IsMinOn (fun g : H ↦ (n : ℝ)⁻¹ * ∑ i, L (Y i) (RKHS.eval H (x i) g) + lam * ‖g‖ ^ 2)
      univ f) :
    f ∈ Submodule.span ℝ (range fun i ↦ RKHS.kerFun H (x i) 1) := by
  sorry

/-- **5.8** The smoothing-spline criterion on the Taylor representation
`g t = c₀ + c₁ (t - a) + ∫_a^t (t - s) u s ds` of `W²[a, b]`. -/
def smoothingSplineCriterion (a b α : ℝ) {n : ℕ} (t Y : Fin n → ℝ) (c₀ c₁ : ℝ) (u : ℝ → ℝ) :
    ℝ :=
  ∑ i, (Y i - (c₀ + c₁ * (t i - a) + ∫ s in a..t i, (t i - s) * u s)) ^ 2 +
    α * ∫ s in a..b, u s ^ 2

/-- **5.8** The smoothing-spline criterion has a minimizer, unique up to `u` almost everywhere,
and its fitted values are `(I + α Q R⁻¹ Qᵀ)⁻¹ Y`. -/
theorem existsUnique_smoothingSpline {n : ℕ} (hn : 3 ≤ n) {a b α : ℝ} (hα : 0 < α)
    (t Y : Fin n → ℝ) (ht : StrictMono t) (ha : ∀ i, a < t i) (hb : ∀ i, t i < b)
    (Q : Matrix (Fin n) (Fin (n - 2)) ℝ) (R : Matrix (Fin (n - 2)) (Fin (n - 2)) ℝ)
    (hQ : ∀ i (j : Fin (n - 2)), Q i j =
      if (i : ℕ) = j then 1 / (t ⟨j + 1, by omega⟩ - t ⟨j, by omega⟩)
      else if (i : ℕ) = j + 1 then -(1 / (t ⟨j + 1, by omega⟩ - t ⟨j, by omega⟩)) -
        1 / (t ⟨j + 2, by omega⟩ - t ⟨j + 1, by omega⟩)
      else if (i : ℕ) = j + 2 then 1 / (t ⟨j + 2, by omega⟩ - t ⟨j + 1, by omega⟩) else 0)
    (hR : ∀ i j : Fin (n - 2), R i j =
      if i = j then (t ⟨i + 2, by omega⟩ - t ⟨i, by omega⟩) / 3
      else if (i : ℕ) + 1 = j then (t ⟨i + 2, by omega⟩ - t ⟨i + 1, by omega⟩) / 6
      else if (j : ℕ) + 1 = i then (t ⟨j + 2, by omega⟩ - t ⟨j + 1, by omega⟩) / 6 else 0) :
    ∃ c₀ c₁ : ℝ, ∃ u : ℝ → ℝ, MemLp u 2 (volume.restrict (Icc a b)) ∧
      (∀ d₀ d₁ (v : ℝ → ℝ), MemLp v 2 (volume.restrict (Icc a b)) →
        smoothingSplineCriterion a b α t Y c₀ c₁ u ≤ smoothingSplineCriterion a b α t Y d₀ d₁ v) ∧
      (∀ d₀ d₁ (v : ℝ → ℝ), MemLp v 2 (volume.restrict (Icc a b)) →
        smoothingSplineCriterion a b α t Y d₀ d₁ v ≤ smoothingSplineCriterion a b α t Y c₀ c₁ u →
          d₀ = c₀ ∧ d₁ = c₁ ∧ v =ᵐ[volume.restrict (Icc a b)] u) ∧
      ∀ i, c₀ + c₁ * (t i - a) + ∫ s in a..t i, (t i - s) * u s =
        ((1 + α • (Q * R⁻¹ * Qᵀ))⁻¹.mulVec Y) i := by
  sorry

end Layer5

/-! ## Layer 6: the Gaussian sequence model -/

section Layer6

/-- **6.1** The law of `Y = θ + ε ξ` on `ℕ → ℝ`. -/
def gaussSeqLaw (θ : ℕ → ℝ) (ε : ℝ) : Measure (ℕ → ℝ) :=
  Measure.infinitePi fun j ↦ gaussianReal (θ j) (ε ^ 2).toNNReal

/-- **6.1** The ellipsoid `∑ a_j² θ_j² ≤ C²`. -/
def ellipsoid (a : ℕ → ℝ) (C : ℝ) : Set (ℕ → ℝ) :=
  {θ | ∑' j, ENNReal.ofReal (a j ^ 2 * θ j ^ 2) ≤ ENNReal.ofReal (C ^ 2)}

/-- **6.1** The squared-error risk of a randomized estimator in the sequence model. -/
def gaussSeqRisk (κ : Kernel (ℕ → ℝ) (ℕ → ℝ)) (θ : ℕ → ℝ) (ε : ℝ) : ℝ≥0∞ :=
  ∫⁻ y, ∑' j, ENNReal.ofReal ((y j - θ j) ^ 2) ∂(κ ∘ₘ gaussSeqLaw θ ε)

/-- **6.1** The minimax risk over `Θ`, over all randomized estimators. -/
def gaussSeqMinimax (Θ : Set (ℕ → ℝ)) (ε : ℝ) : ℝ≥0∞ :=
  ⨅ κ : {κ : Kernel (ℕ → ℝ) (ℕ → ℝ) // IsMarkovKernel κ}, ⨆ θ ∈ Θ, gaussSeqRisk κ.1 θ ε

/-- **6.1** The minimax risk over `Θ` among the diagonal linear estimators `y ↦ c ⊙ y`. -/
def gaussSeqLinearMinimax (Θ : Set (ℕ → ℝ)) (ε : ℝ) : ℝ≥0∞ :=
  ⨅ c : ℕ → ℝ, ⨆ θ ∈ Θ, ∑' j, ENNReal.ofReal (c j ^ 2 * ε ^ 2 + (1 - c j) ^ 2 * θ j ^ 2)

/-- **6.3** Pinsker's linear minimax risk over an ellipsoid. -/
theorem gaussSeqLinearMinimax_eq (a : ℕ → ℝ) (ha : Monotone a) (ha0 : ∀ j, 0 ≤ a j)
    (hatop : Tendsto a atTop atTop) {C ε : ℝ} (hC : 0 < C) (hε : 0 < ε) :
    ∃ m > 0, ε ^ 2 * ∑' j, a j * max (m - a j) 0 = C ^ 2 ∧
      gaussSeqLinearMinimax (ellipsoid a C) ε =
        ENNReal.ofReal (ε ^ 2 * ∑' j, max (1 - a j / m) 0) := by
  sorry

/-- **6.3** Pinsker's theorem: linear estimators are asymptotically minimax. -/
theorem tendsto_gaussSeqMinimax_div_linear (a : ℕ → ℝ) (ha : Monotone a) (ha0 : ∀ j, 0 < a j)
    (hatop : Tendsto a atTop atTop) {C : ℝ} (hC : 0 < C) :
    Tendsto (fun ε ↦ gaussSeqMinimax (ellipsoid a C) ε / gaussSeqLinearMinimax (ellipsoid a C) ε)
      (𝓝[>] 0) (𝓝 1) := by
  sorry

/-- **6.3** The Sobolev rate with the Pinsker constant. -/
theorem tendsto_gaussSeqMinimax_sobolev {β C : ℝ} (hβ : 0 < β) (hC : 0 < C) :
    Tendsto (fun ε ↦ (gaussSeqMinimax (ellipsoid (fun j ↦ ((j : ℝ) + 1) ^ β) C) ε).toReal /
        (C ^ (2 / (2 * β + 1)) * ε ^ (4 * β / (2 * β + 1)))) (𝓝[>] 0)
      (𝓝 ((2 * β + 1) ^ (1 / (2 * β + 1)) * (β / (β + 1)) ^ (2 * β / (2 * β + 1)))) := by
  sorry

/-- **6.4** Soft thresholding at level `λ`. -/
def softThreshold (lam y : ℝ) : ℝ := Real.sign y * max (|y| - lam) 0

/-- **6.4** The one-coordinate risk `E (η_λ(θ + Z) - θ)²` of soft thresholding, `Z ~ N(0, 1)`. -/
def softThresholdRisk (lam θ : ℝ) : ℝ :=
  ∫ z, (softThreshold lam (θ + z) - θ) ^ 2 ∂gaussianReal 0 1

/-- **6.4** The risk of soft thresholding at `θ = 0` is at most `e^{-λ²/2}`. -/
theorem softThresholdRisk_zero_le {lam : ℝ} (hlam : 0 ≤ lam) :
    softThresholdRisk lam 0 ≤ Real.exp (-lam ^ 2 / 2) := by
  sorry

/-- **6.4** The risk bound `r(λ, θ) ≤ min (r(λ, 0) + θ²) (1 + λ²)`, hence
`r(λ, θ) ≤ r(λ, 0) + min θ² (1 + λ²)`. -/
theorem softThresholdRisk_le {lam : ℝ} (hlam : 0 ≤ lam) (θ : ℝ) :
    softThresholdRisk lam θ ≤ min (softThresholdRisk lam 0 + θ ^ 2) (1 + lam ^ 2) ∧
      softThresholdRisk lam θ ≤ softThresholdRisk lam 0 + min (θ ^ 2) (1 + lam ^ 2) := by
  sorry

/-- **6.4** The soft-threshold oracle inequality at `λ = σ √(2 log n)`. -/
theorem soft_threshold_oracle {n : ℕ} (hn : 1 ≤ n) {σ : ℝ} (hσ : 0 < σ) (θ : Fin n → ℝ) :
    ∫ y, ∑ i, (softThreshold (σ * √(2 * Real.log n)) (y i) - θ i) ^ 2
        ∂(Measure.pi fun i ↦ gaussianReal (θ i) (σ ^ 2).toNNReal) ≤
      (2 * Real.log n + 1) * (σ ^ 2 + ∑ i, min (θ i ^ 2) (σ ^ 2)) := by
  sorry

/-- **6.5** The metric projection onto a set, `0` where no nearest point exists. -/
def metricProj {E : Type*} [NormedAddCommGroup E] (s : Set E) (x : E) : E :=
  if h : ∃ y ∈ s, ‖x - y‖ = Metric.infDist x s then h.choose else 0

/-- **6.5** The polyhedral cone `{x | ∀ k, ⟪A k, x⟫ ≤ 0}`. -/
def polyhedralCone {p m : ℕ} (A : Fin m → EuclideanSpace ℝ (Fin p)) :
    Set (EuclideanSpace ℝ (Fin p)) :=
  {x | ∀ k, ⟪A k, x⟫ ≤ 0}

/-- **6.5** The dimension of the smallest face of the polyhedral cone containing `y`. -/
def faceDim {p m : ℕ} (A : Fin m → EuclideanSpace ℝ (Fin p)) (y : EuclideanSpace ℝ (Fin p)) :
    ℕ :=
  Module.finrank ℝ (Submodule.span ℝ
    {x | x ∈ polyhedralCone A ∧ ∀ k, ⟪A k, y⟫ = 0 → ⟪A k, x⟫ = 0})

/-- **6.5** The chi-bar-squared law of the likelihood-ratio statistic for a polyhedral cone. -/
theorem map_norm_sq_metricProj_stdGaussian {p m : ℕ} (A : Fin m → EuclideanSpace ℝ (Fin p)) :
    (stdGaussian (EuclideanSpace ℝ (Fin p))).map
        (fun y ↦ ‖metricProj (polyhedralCone A) y‖ ^ 2) =
      ∑ j ∈ Finset.range (p + 1),
        (stdGaussian (EuclideanSpace ℝ (Fin p))) {y | faceDim A (metricProj (polyhedralCone A) y) = j} •
          TauCeti.Probability.chiSquaredMeasure j := by
  sorry

/-- **6.6** The minimax testing error against the alternatives `θ ∈ Θ`, `‖θ‖₂ ≥ ρ`. -/
def detectionError (Θ : Set (ℕ → ℝ)) (ε ρ : ℝ) : ℝ :=
  ⨅ φ : {φ : (ℕ → ℝ) → ℝ // IsStatisticalTest φ},
    (∫ y, φ.1 y ∂gaussSeqLaw 0 ε +
      ⨆ θ : {θ // θ ∈ Θ ∧ ENNReal.ofReal (ρ ^ 2) ≤ ∑' j, ENNReal.ofReal (θ j ^ 2)},
        ∫ y, (1 - φ.1 y) ∂gaussSeqLaw θ.1 ε)

/-- **6.6** The detection boundary `n^{-2β/(4β+1)}` over a Sobolev ellipsoid. -/
theorem detection_boundary {β R : ℝ} (hβ : 0 < β) (hR : 0 < R) (ρ : ℕ → ℝ) (hρ : ∀ n, 0 < ρ n) :
    (Tendsto (fun n : ℕ ↦ ρ n / (n : ℝ) ^ (-2 * β / (4 * β + 1))) atTop (𝓝 0) →
      Tendsto (fun n : ℕ ↦ detectionError (ellipsoid (fun j ↦ ((j : ℝ) + 1) ^ β) R)
        ((n : ℝ) ^ (-(1 : ℝ) / 2)) (ρ n)) atTop (𝓝 1)) ∧
    (Tendsto (fun n : ℕ ↦ ρ n / (n : ℝ) ^ (-2 * β / (4 * β + 1))) atTop atTop →
      Tendsto (fun n : ℕ ↦ detectionError (ellipsoid (fun j ↦ ((j : ℝ) + 1) ^ β) R)
        ((n : ℝ) ^ (-(1 : ℝ) / 2)) (ρ n)) atTop (𝓝 0)) := by
  sorry

end Layer6

/-! ## Layer 7: shape constraints -/

section Layer7

/-- **7.1** The isotonic least-squares fit by the max–min formula. -/
def isotonicRegression {n : ℕ} (w y : Fin n → ℝ) (i : Fin n) : ℝ :=
  ⨆ a : {a : Fin n // a ≤ i}, ⨅ b : {b : Fin n // i ≤ b},
    (∑ j ∈ Finset.Icc a.1 b.1, w j * y j) / ∑ j ∈ Finset.Icc a.1 b.1, w j

/-- **7.1** The max–min formula gives the unique weighted least-squares monotone fit, and it
equals the min–max formula. -/
theorem isMinOn_isotonicRegression {n : ℕ} (w y : Fin n → ℝ) (hw : ∀ i, 0 < w i) :
    Monotone (isotonicRegression w y) ∧
      (∀ θ : Fin n → ℝ, Monotone θ → θ ≠ isotonicRegression w y →
        ∑ i, w i * (y i - isotonicRegression w y i) ^ 2 < ∑ i, w i * (y i - θ i) ^ 2) ∧
      ∀ i, isotonicRegression w y i =
        ⨅ b : {b : Fin n // i ≤ b}, ⨆ a : {a : Fin n // a ≤ i},
          (∑ j ∈ Finset.Icc a.1 b.1, w j * y j) / ∑ j ∈ Finset.Icc a.1 b.1, w j := by
  sorry

/-- **7.2** The risk bound for isotonic regression with unit weights. -/
theorem isotonic_risk_le : ∃ C : ℝ, ∀ (n : ℕ) (hn : 1 ≤ n), ∀ (θ : Fin n → ℝ), Monotone θ →
    ∀ (Ω : Type) [MeasurableSpace Ω] (μ : Measure Ω) [IsProbabilityMeasure μ]
      (ε : Fin n → Ω → ℝ), iIndepFun ε μ → (∀ i, MemLp (ε i) 2 μ) →
      (∀ i, ∫ ω, ε i ω ∂μ = 0) → (∀ i, ∫ ω, ε i ω ^ 2 ∂μ = 1) →
      (n : ℝ)⁻¹ * ∫ ω, ∑ i, (isotonicRegression 1 (fun j ↦ θ j + ε j ω) i - θ i) ^ 2 ∂μ ≤
        C * ((((θ ⟨n - 1, by omega⟩ - θ ⟨0, by omega⟩) / n) ^ ((2 : ℝ) / 3)) +
          Real.log (Real.exp 1 * n) / n) := by
  sorry

/-- **7.2** The minimax lower bound `c n^{-2/3}` for isotonic regression with standard normal
errors, over nondecreasing `θ` bounded by `1`, for all randomized estimators. -/
theorem isotonic_minimax_lower : ∃ c > 0, ∀ n : ℕ, 1 ≤ n →
    ∀ κ : Kernel (Fin n → ℝ) (Fin n → ℝ), IsMarkovKernel κ →
      ENNReal.ofReal (c * (n : ℝ) ^ (-(2 : ℝ) / 3)) ≤
        ⨆ θ : {θ : Fin n → ℝ // Monotone θ ∧ ∀ i, |θ i| ≤ 1},
          ∫⁻ y, ENNReal.ofReal ((n : ℝ)⁻¹ * ∑ i, (y i - θ.1 i) ^ 2)
            ∂(κ ∘ₘ Measure.pi fun i ↦ gaussianReal (θ.1 i) 1) := by
  sorry

/-- **7.3** The least concave majorant on `[0, ∞)` of a function `F` with an affine majorant
there, as the infimum of its affine majorants. For `t ≥ 0` the family is nonempty and bounded
below by `F t`, so the real infimum is the true value. The value is `0` by convention for
`t < 0`, where the affine majorants on `[0, ∞)` take values unbounded below, and for every `t`
when `F` has no affine majorant on `[0, ∞)`. -/
def leastConcaveMajorant (F : ℝ → ℝ) (t : ℝ) : ℝ :=
  if 0 ≤ t ∧ ∃ a b : ℝ, ∀ s, 0 ≤ s → F s ≤ a + b * s then
    ⨅ ab : {ab : ℝ × ℝ // ∀ s, 0 ≤ s → F s ≤ ab.1 + ab.2 * s}, ab.1.1 + ab.1.2 * t
  else 0

/-- **7.3** The Grenander estimator: the left derivative at `t > 0` of the least concave
majorant of the empirical distribution function, its right derivative at `t = 0`, and `0` for
`t < 0`. Only values of the majorant on `[0, ∞)` enter. -/
def grenander {n : ℕ} (x : Fin n → ℝ) (t : ℝ) : ℝ :=
  if 0 < t then derivWithin (leastConcaveMajorant (empiricalCdf x)) (Iio t) t
  else if t = 0 then derivWithin (leastConcaveMajorant (empiricalCdf x)) (Ici 0) 0 else 0

/-- **7.3** The Grenander estimator is a nonincreasing probability density on `[0, ∞)`, constant
between consecutive order statistics, that maximizes the likelihood among such densities,
uniquely on `(0, x₍ₙ₎]`. -/
theorem grenander_isMaxLikelihood {n : ℕ} (hn : 0 < n) (x : Fin n → ℝ) (hx : ∀ i, 0 < x i) :
    AntitoneOn (grenander x) (Ici 0) ∧ (∀ t, 0 ≤ grenander x t) ∧
      ∫ t in Ioi 0, grenander x t = 1 ∧
      (∀ s t, 0 < s → s ≤ t → (∀ i, x i ∉ Ico s t) → grenander x s = grenander x t) ∧
      ∀ f : ℝ → ℝ, AntitoneOn f (Ici 0) → (∀ t, 0 ≤ f t) → ∫ t in Ioi 0, f t = 1 →
        ∏ i, f (x i) ≤ ∏ i, grenander x (x i) ∧
        (∏ i, f (x i) = ∏ i, grenander x (x i) →
          ∀ t ∈ Ioc 0 (⨆ i, x i), f t = grenander x t) := by
  sorry

/-- **7.3** The switching relation, with the smallest maximizer. -/
theorem grenander_le_iff {n : ℕ} (hn : 0 < n) (x : Fin n → ℝ) (hx : ∀ i, 0 < x i) {t a : ℝ}
    (ht : 0 < t) (ha : 0 < a) :
    grenander x t ≤ a ↔
      sInf {s | 0 ≤ s ∧ ∀ r, 0 ≤ r → empiricalCdf x r - a * r ≤ empiricalCdf x s - a * s} < t := by
  sorry

variable {Ω : Type*} [MeasurableSpace Ω] (μ : Measure Ω) [IsProbabilityMeasure μ]

/-- **7.4** Two-sided Brownian motion from two processes. -/
def twoSided (B₁ B₂ : ℝ≥0 → Ω → ℝ) (t : ℝ) (ω : Ω) : ℝ :=
  if 0 ≤ t then B₁ t.toNNReal ω else B₂ (-t).toNNReal ω

/-- **7.4** The Chernoff variable: the largest maximizer of `W t - t²`. On the paths where the
set of maximizers is empty or unbounded above the real supremum is the junk `0`; for two-sided
Brownian motion these paths form a null set (`ae_existsUnique_argmax_chernoff`), so laws and
convergence in distribution do not see the convention. -/
def chernoffArgmax (W : ℝ → Ω → ℝ) (ω : Ω) : ℝ :=
  sSup {t | ∀ s, W s ω - s ^ 2 ≤ W t ω - t ^ 2}

/-- **7.4** Almost surely `W t - t²` has exactly one maximizer. -/
theorem ae_existsUnique_argmax_chernoff (B₁ B₂ : ℝ≥0 → Ω → ℝ) (h₁ : IsBrownianReal B₁ μ)
    (h₂ : IsBrownianReal B₂ μ) (h : IndepFun (fun ω t ↦ B₁ t ω) (fun ω t ↦ B₂ t ω) μ) :
    ∀ᵐ ω ∂μ, ∃! t, ∀ s, twoSided B₁ B₂ s ω - s ^ 2 ≤ twoSided B₁ B₂ t ω - t ^ 2 := by
  sorry

/-- **7.4** The cube-root limit of the Grenander estimator. -/
theorem tendstoInDistribution_grenander (f : ℝ → ℝ) (hf : Measurable f) (hf0 : ∀ x, 0 ≤ f x)
    (hf1 : ∫ x in Ici 0, f x = 1) (hfanti : AntitoneOn f (Ici 0)) {x₀ : ℝ} (hx₀ : 0 < x₀)
    (hpos : 0 < f x₀) (hd : HasDerivAt f (deriv f x₀) x₀) (hneg : deriv f x₀ < 0)
    (X : ℕ → Ω → ℝ)
    (hX : IsIndependentIdenticallyDistributed μ X
      (densityLaw (volume.restrict (Ici 0)) f))
    {Ω' : Type*} [MeasurableSpace Ω'] (μ' : Measure Ω') [IsProbabilityMeasure μ']
    (B₁ B₂ : ℝ≥0 → Ω' → ℝ) (h₁ : IsBrownianReal B₁ μ') (h₂ : IsBrownianReal B₂ μ')
    (h : IndepFun (fun ω t ↦ B₁ t ω) (fun ω t ↦ B₂ t ω) μ') :
    TendstoInDistribution (fun (n : ℕ) ω ↦ (n : ℝ) ^ ((1 : ℝ) / 3) *
        (grenander (firstN X n ω) x₀ - f x₀)) atTop
      (fun ω ↦ |4 * deriv f x₀ * f x₀| ^ ((1 : ℝ) / 3) * chernoffArgmax (twoSided B₁ B₂) ω)
      (fun _ ↦ μ) μ' := by
  sorry

/-- **7.5** The upper semicontinuous log-concave probability densities on `ℝ^d`. -/
def logConcaveDensities (d : ℕ) : Set (EuclideanSpace ℝ (Fin d) → ℝ≥0∞) :=
  {f | TauCeti.LogConcave f ∧ UpperSemicontinuous f ∧ ∫⁻ x, f x = 1}

/-- **7.5** The log-likelihood `∫ log f dP` in `EReal`, with the value `⊥ = -∞` unless `f` is
positive `P`-almost everywhere and `log f` is `P`-integrable. For the densities of
`logConcaveDensities d`, which are bounded, this is exactly the case `∫ log f dP = -∞`. -/
def logLikelihood {E : Type*} [MeasurableSpace E] (P : Measure E) (f : E → ℝ≥0∞) : EReal :=
  if (∀ᵐ x ∂P, 0 < f x) ∧ Integrable (fun x ↦ Real.log (f x).toReal) P then
    ((∫ x, Real.log (f x).toReal ∂P : ℝ) : EReal)
  else ⊥

/-- **7.5** The log-concave projection exists and is unique; its log-likelihood is finite, and
its positivity set lies between the interior of the convex support of `P` and the convex support,
the intersection of the closed convex sets of full `P`-measure. -/
theorem existsUnique_logConcaveProjection {d : ℕ} (P : Measure (EuclideanSpace ℝ (Fin d)))
    [IsProbabilityMeasure P] (h1 : Integrable (fun x ↦ ‖x‖) P)
    (hH : ∀ (v : EuclideanSpace ℝ (Fin d)) (c : ℝ), v ≠ 0 → P {x | ⟪v, x⟫ = c} < 1) :
    (∃! f, f ∈ logConcaveDensities d ∧
      ∀ g ∈ logConcaveDensities d, logLikelihood P g ≤ logLikelihood P f) ∧
    ∀ f ∈ logConcaveDensities d,
      (∀ g ∈ logConcaveDensities d, logLikelihood P g ≤ logLikelihood P f) →
        ⊥ < logLikelihood P f ∧
        interior (⋂₀ {C | IsClosed C ∧ Convex ℝ C ∧ P Cᶜ = 0}) ⊆ {x | 0 < f x} ∧
        {x | 0 < f x} ⊆ ⋂₀ {C | IsClosed C ∧ Convex ℝ C ∧ P Cᶜ = 0} := by
  sorry

end Layer7

/-! ## Layer 8: functional data -/

section Layer8

variable {H : Type*} [NormedAddCommGroup H] [InnerProductSpace ℝ H] [CompleteSpace H]
  [TopologicalSpace.SeparableSpace H] [MeasurableSpace H] [BorelSpace H]
  {Ω : Type*} [MeasurableSpace Ω] (μ : Measure Ω) [IsProbabilityMeasure μ]

/-- **8.1** The centered covariance operator of a random element of `H`. -/
def centeredCovariance (X : Ω → H) : H →L[ℝ] H :=
  covarianceOperator (μ.map fun ω ↦ X ω - ∫ ω', X ω' ∂μ)

/-- **8.1** The covariance operator is compact and its diagonal sums to `E ‖X - m‖²` in every
Hilbert basis. -/
theorem centeredCovariance_trace (X : Ω → H) (hX : MemLp X 2 μ) {ι : Type*}
    (b : HilbertBasis ι ℝ H) :
    IsCompactOperator (centeredCovariance μ X) ∧
      HasSum (fun i ↦ ⟪centeredCovariance μ X (b i), b i⟫)
        (∫ ω, ‖X ω - ∫ ω', X ω' ∂μ‖ ^ 2 ∂μ) := by
  sorry

/-- **8.2** An eigen-expansion `T x = ∑ λ j ⟪x, φ j⟫ φ j` with decreasing nonnegative
eigenvalues tending to `0`, orthonormal on the positive eigenvalues. -/
structure IsEigenExpansion (T : H →L[ℝ] H) (lam : ℕ → ℝ) (φ : ℕ → H) : Prop where
  antitone : Antitone lam
  nonneg : ∀ j, 0 ≤ lam j
  tendsto : Tendsto lam atTop (𝓝 0)
  orthonormal : Orthonormal ℝ fun j : {j // 0 < lam j} ↦ φ j
  hasSum : ∀ x, HasSum (fun j ↦ lam j • ⟪x, φ j⟫ • φ j) (T x)

/-- **8.2** A positive compact operator has an eigen-expansion whose eigenvalues are its
approximation numbers. -/
theorem exists_isEigenExpansion (T : H →L[ℝ] H) (hT : IsCompactOperator T)
    (hpos : T.IsPositive) :
    ∃ φ : ℕ → H, IsEigenExpansion T (fun j ↦ (T.singularValue j : ℝ)) φ := by
  sorry

/-- **8.2** The trace norm of a positive compact operator is the sum of its diagonal entries in
any Hilbert basis. -/
theorem nuclearENorm_eq_tsum_inner (T : H →L[ℝ] H) (hT : IsCompactOperator T)
    (hpos : T.IsPositive) {ι : Type*} (b : HilbertBasis ι ℝ H) :
    T.nuclearENorm = ∑' i, ENNReal.ofReal ⟪T (b i), b i⟫ := by
  sorry

/-- **8.2** The trace norm of the centered covariance operator is `E ‖X - m‖²`. -/
theorem nuclearENorm_centeredCovariance (X : Ω → H) (hX : MemLp X 2 μ) :
    (centeredCovariance μ X).nuclearENorm =
      ENNReal.ofReal (∫ ω, ‖X ω - ∫ ω', X ω' ∂μ‖ ^ 2 ∂μ) := by
  sorry

/-- **8.3** The Karhunen–Loève expansion: the scores are centered and uncorrelated with
variances `lam j`, and the expansion converges in `L²(μ; H)` and almost surely in `H`. -/
theorem karhunenLoeve (X : Ω → H) (hX : MemLp X 2 μ) (lam : ℕ → ℝ) (φ : ℕ → H)
    (he : IsEigenExpansion (centeredCovariance μ X) lam φ) :
    (∀ j, ∫ ω, ⟪X ω - ∫ ω', X ω' ∂μ, φ j⟫ ∂μ = 0) ∧
    (∀ j k, 0 < lam j → 0 < lam k →
      ∫ ω, ⟪X ω - ∫ ω', X ω' ∂μ, φ j⟫ * ⟪X ω - ∫ ω', X ω' ∂μ, φ k⟫ ∂μ =
        if j = k then lam j else 0) ∧
    Tendsto (fun N : ℕ ↦ ∫ ω, ‖(X ω - ∫ ω', X ω' ∂μ) -
        ∑ j ∈ Finset.range N, (if 0 < lam j then ⟪X ω - ∫ ω', X ω' ∂μ, φ j⟫ • φ j else 0)‖ ^ 2 ∂μ)
      atTop (𝓝 0) ∧
    ∀ᵐ ω ∂μ, HasSum (fun j ↦ if 0 < lam j then ⟪X ω - ∫ ω', X ω' ∂μ, φ j⟫ • φ j else 0)
      (X ω - ∫ ω', X ω' ∂μ) := by
  sorry

/-- **8.3** Optimality of functional principal components: every `k`-dimensional subspace
leaves a residual at least the eigenvalue tail; if `lam (k - 1) > 0` the span of the first `k`
eigenvectors is `k`-dimensional and attains it, and under the gap `lam k < lam (k - 1)` it is the
only `k`-dimensional subspace that does. -/
theorem fpca_optimal (X : Ω → H) (hX : MemLp X 2 μ) (lam : ℕ → ℝ) (φ : ℕ → H)
    (he : IsEigenExpansion (centeredCovariance μ X) lam φ) (k : ℕ) :
    (∀ (V : Submodule ℝ H) [FiniteDimensional ℝ V], Module.finrank ℝ V = k →
      ∑' j, (if k ≤ j then lam j else 0) ≤
        ∫ ω, ‖(X ω - ∫ ω', X ω' ∂μ) - V.starProjection (X ω - ∫ ω', X ω' ∂μ)‖ ^ 2 ∂μ) ∧
    (0 < k → 0 < lam (k - 1) →
      Module.finrank ℝ (Submodule.span ℝ (((Finset.range k).image φ : Finset H) : Set H)) = k ∧
      ∫ ω, ‖(X ω - ∫ ω', X ω' ∂μ) -
          (Submodule.span ℝ (((Finset.range k).image φ : Finset H) : Set H)).starProjection
            (X ω - ∫ ω', X ω' ∂μ)‖ ^ 2 ∂μ =
        ∑' j, (if k ≤ j then lam j else 0)) ∧
    (0 < k → lam k < lam (k - 1) →
      ∀ (V : Submodule ℝ H) [FiniteDimensional ℝ V], Module.finrank ℝ V = k →
        ∫ ω, ‖(X ω - ∫ ω', X ω' ∂μ) - V.starProjection (X ω - ∫ ω', X ω' ∂μ)‖ ^ 2 ∂μ =
          ∑' j, (if k ≤ j then lam j else 0) →
        V = Submodule.span ℝ (((Finset.range k).image φ : Finset H) : Set H)) := by
  sorry

/-- **8.4** The centered Gaussian measure with covariance given by an eigen-expansion. -/
def gaussianHilbert (lam : ℕ → ℝ) (φ : ℕ → H) : Measure H :=
  (Measure.infinitePi fun _ : ℕ ↦ gaussianReal 0 1).map fun z ↦
    if h : ∃ s, HasSum (fun j ↦ (√(lam j) * z j) • φ j) s then h.choose else 0

/-- **8.4** It is Gaussian with covariance operator `T`. -/
theorem isGaussian_gaussianHilbert (T : H →L[ℝ] H) (lam : ℕ → ℝ) (φ : ℕ → H)
    (he : IsEigenExpansion T lam φ) (hsum : Summable lam) :
    IsGaussian (gaussianHilbert lam φ) ∧ covarianceOperator (gaussianHilbert lam φ) = T := by
  sorry

/-- **8.4** The Gaussian measure of a summable eigen-expansion is a probability measure. -/
theorem isProbabilityMeasure_gaussianHilbert {T : H →L[ℝ] H} {lam : ℕ → ℝ} {φ : ℕ → H}
    (he : IsEigenExpansion T lam φ) (hsum : Summable lam) :
    IsProbabilityMeasure (gaussianHilbert lam φ) := by
  sorry

/-- **8.4** Uniqueness: a centered Gaussian measure with covariance operator `T` is the
Gaussian measure of the eigen-expansion of `T`. -/
theorem eq_gaussianHilbert (T : H →L[ℝ] H) (lam : ℕ → ℝ) (φ : ℕ → H)
    (he : IsEigenExpansion T lam φ) (hsum : Summable lam) (ν : Measure H) [IsGaussian ν]
    (hcent : ∫ x, x ∂ν = 0) (hcov : covarianceOperator ν = T) :
    ν = gaussianHilbert lam φ := by
  sorry

/-- **8.5** The Hilbertian central limit theorem. -/
theorem tendstoInDistribution_hilbert_clt (P : Measure H) [IsProbabilityMeasure P]
    (hP : MemLp id 2 P) (X : ℕ → Ω → H) (hX : IsIndependentIdenticallyDistributed μ X P)
    (lam : ℕ → ℝ) (φ : ℕ → H)
    (he : IsEigenExpansion (covarianceOperator (P.map fun x ↦ x - ∫ y, y ∂P)) lam φ)
    (hsum : Summable lam) :
    haveI : IsProbabilityMeasure (gaussianHilbert lam φ) :=
      isProbabilityMeasure_gaussianHilbert he hsum
    TendstoInDistribution
      (fun (n : ℕ) ω ↦ (√(n : ℝ))⁻¹ • ∑ i ∈ Finset.range n, (X i ω - ∫ y, y ∂P)) atTop id (fun _ ↦ μ)
      (gaussianHilbert lam φ) := by
  sorry

/-- **8.6** The empirical covariance operator, centered at the sample mean. -/
def empiricalCovariance {n : ℕ} (x : Fin n → H) : H →L[ℝ] H :=
  (n : ℝ)⁻¹ • ∑ i, (innerSL ℝ (x i - (n : ℝ)⁻¹ • ∑ j, x j)).smulRight
    (x i - (n : ℝ)⁻¹ • ∑ j, x j)

/-- **8.6** Asymptotic normality of a simple positive eigenvalue of the empirical covariance. -/
theorem tendstoInDistribution_fpca_eigenvalue (P : Measure H) [IsProbabilityMeasure P]
    (hP : MemLp id 4 P) (X : ℕ → Ω → H) (hX : IsIndependentIdenticallyDistributed μ X P)
    (lam : ℕ → ℝ) (φ : ℕ → H)
    (he : IsEigenExpansion (covarianceOperator (P.map fun x ↦ x - ∫ y, y ∂P)) lam φ) (j : ℕ)
    (hpos : 0 < lam j) (hsimple : ∀ k ≠ j, lam k ≠ lam j) :
    TendstoInDistribution
      (fun (n : ℕ) ω ↦ √(n : ℝ) * ((empiricalCovariance (firstN X n ω)).singularValue j - lam j)) atTop id
      (fun _ ↦ μ) (gaussianReal 0 (Var[fun x ↦ ⟪x - ∫ y, y ∂P, φ j⟫ ^ 2; P]).toNNReal) := by
  sorry

end Layer8

#check @InformationTheory.klDiv
#check @MeasureTheory.tvDist
#check @Finset.card
#check @MeasureTheory.Measure.rnDeriv
#check @MeasureTheory.Measure.withDensity
#check @Matrix.mulVec
#check @intervalIntegral
#check @Submodule.starProjection
#check @ContinuousLinearMap.IsPositive
#check @ProbabilityTheory.covarianceOperator
#check @ContinuousLinearMap.singularValue
#check @ContinuousLinearMap.nuclearENorm
#check @InformationTheory.klDiv_map_le
#check @InformationTheory.klDiv_compProd_eq_add
#check @InformationTheory.klFun
#check @MeasureTheory.etvDist
#check @MeasureTheory.tvDist_triangle
#check @MeasureTheory.tvDist_comm
#check @MeasureTheory.tvDist_self
#check @MeasureTheory.tvDist_eq_zero_iff
#check @MeasureTheory.tvDist_le_add
#check @MeasureTheory.tvDist_eq_integral_abs_rnDeriv_of_ac
#check @MeasureTheory.tvDist_of_mutuallySingular
#check @MeasureTheory.etvDist_eq_two_mul_iSup_sub
#check @ProbabilityTheory.avgRisk
#check @ProbabilityTheory.bayesRisk
#check @ProbabilityTheory.bayesRisk_le_minimaxRisk
#check @ProbabilityTheory.iSup_bayesRisk_le_minimaxRisk
#check @hammingNorm
#check @Hamming
#check @Metric.packingNumber
#check @Tuple.sort
#check @MeasureTheory.Measure.bind
#check @MeasureTheory.Measure.conv
#check @MeasureTheory.Measure.ext_of_charFunDual
#check @StieltjesFunction.measure
#check @MeasureTheory.condExp
#check @MeasureTheory.TendstoInMeasure
#check @MeasureTheory.IsTightMeasureSet
#check @ProbabilityTheory.Kernel.deterministic
#check @ProbabilityTheory.Kernel.comp
#check @ProbabilityTheory.HasSubgaussianMGF
#check @ProbabilityTheory.tendstoInDistribution_inv_sqrt_mul_sum_sub
#check @tendstoInDistribution_iff_tendstoInDistribution_inner
#check @MeasureTheory.tendsto_ae_condExp
#check @MeasureTheory.tendsto_eLpNorm_condExp
#check @ProbabilityTheory.IsPreBrownianReal
#check @OrthonormalBasis
#check @Submodule.orthogonalProjectionOnto
#check @exists_norm_eq_iInf_of_complete_convex
#check @norm_eq_iInf_iff_real_inner_le_zero
#check @LinearMap.IsSymmetric
#check @Module.End.HasEigenvector
#check @RKHS.inner_kerFun
#check @ProbabilityTheory.covarianceOperator_inner
#check @ProbabilityTheory.isPositive_covarianceOperator
#check @HolderOnWith
#check @ConcaveOn
#check @ConvexOn
#check @MonotoneOn
#check @Real.cos
#check @Real.sin
#check @MeasureTheory.Lp
#check @integral_gaussian
#check @MeasurableEquiv.piFinSuccAbove
#check @ConcaveOn.le_map_integral
#check @ConvexOn.map_integral_le
#check @measurable_dist
#check @hasDerivAt_integral_of_dominated_loc_of_deriv_le
#check @Real.tsum_exp_neg_mul_int_sq
#check @Measurable.tsum
#check @taylor_mean_remainder_lagrange
#check @MeasureTheory.integral_prod
#check @MeasureTheory.measure_limsup_atTop_eq_zero
#check @Matrix.inv
#check @Matrix.PosDef
#check @AddCircle
#check @MeasureTheory.Submartingale
#check @convexHull
#check @TauCeti.Probability.iIndepFun.hasLaw_sum_bernoulli
#check @TauCeti.orderStatistic
#check @MeasureTheory.Measure.quantile
#check @MeasureTheory.Measure.cdf_map_eq_volume_restrict
#check @MeasureTheory.Measure.map_quantile_volume_Ioo
#check @ProbabilityTheory.HasLaw.norm_sq_orthogonalProjectionOnto_stdGaussian
#check @ProbabilityTheory.HasLaw.iIndepFun_orthogonalProjectionOnto_stdGaussian
#check @TauCeti.Probability.empiricalFiniteMeasure
#check @TauCeti.LogConcave.lintegral_prod_right
#check @ContinuousLinearMap.singularValue_eq_iInf_nnnorm_comp_orthogonal
#check @ContinuousLinearMap.exists_hilbertBasis_forall_hasEigenvector
#check @IsCompactOperator.tendsto_singularValue
#check @ContinuousLinearMap.kyFanGauge
#check @LinearMap.IsSymmetric.sum_re_inner_apply_self_le_sum_eigenvalues
#check @ContinuousLinearMap.isCompactOperator_of_tendsto_singularValue
#check @LinearMap.abs_singularValues_sub_singularValues_le
#check @TauCeti.etvDist_sq_le_two_mul_klDiv
#check @TauCeti.two_mul_sq_measureReal_sub_le_klDiv
#check @TauCeti.klDiv_prod_prod
#check @TauCeti.klDiv_prod_prod_eq_add
#check @TauCeti.klDiv_prod_left
#check @TauCeti.klDiv_prod_right
#check @TauCeti.klDiv_compProd_eq_add_lintegral
#check @TauCeti.klDiv_smul_add_smul_le
#check @TauCeti.klDiv_eq_sum_klFun_singleton
#check @TauCeti.lowerSemicontinuous_klDiv_probabilityMeasure
#check @TauCeti.Probability.hasSubgaussianMGF_of_bounded_differences_fin
#check @TauCeti.Probability.hasLaw_card_filter_mem_pi
#check @TauCeti.Probability.binomial_tail_eq_regularizedIncompleteBeta
#check @TauCeti.Probability.map_orderStatistics_pi
#check @TauCeti.Probability.map_orderStatistic_pi_uniformMeasure
#check @TauCeti.tendsto_eLpNorm_normed_convolution_sub
#check @ContinuousLinearMap.hilbertSchmidtEnergy
#check @ContinuousLinearMap.hilbertSchmidtNorm
#check @ContinuousLinearMap.tsum_singularValue_sq_eq_hilbertSchmidtEnergy
#check @ContinuousLinearMap.IsPositive.exists_orthonormal_kyFanGauge_le_sum_re_inner_add
#check @Metric.IsSeparated
#check @ProbabilityTheory.IsGaussian.memLp_id
#check @OrthogonalFamily.summable_iff_norm_sq_summable
#check @derivWithin
#check @ProbabilityTheory.bernoulliMeasure

end TauCetiRoadmap.MathematicalStatisticsNonparametric
