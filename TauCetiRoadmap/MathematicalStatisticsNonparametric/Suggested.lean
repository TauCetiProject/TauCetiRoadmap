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
to it, together with the definitions their statements need. The README headlines that are not
stated here, each with the carrier it lacks at the pins:
- 4.4, Pitman efficiency of the normal-scores test relative to the `t` test: the Pitman
  efficiency theorem for two independent samples (MathematicalStatisticsAsymptotic 8.3 treats one
  i.i.d. sample);
- 4.7, the Kolmogorov–Smirnov statistic with estimated parameters: weak convergence in
  `ℓ^∞(ℝ)` of the estimated-parameter empirical process, and the law of the supremum of its
  Gaussian limit;
- 6.2, Sobolev ellipsoids: the periodic Sobolev class `W^per(β, L)` on `[0, 1]`;
- 7.4, the local empirical process: weak convergence in `ℓ^∞([-K, K])` and two-sided Brownian
  motion as a random element of it;
- 8.6, the operator limit: the Hilbert space of Hilbert–Schmidt operators with its Borel
  σ-algebra, for convergence in law of `√n (Ĉₙ - C)`;
- 8.7, the prediction rate, its lower bound and Brownian covariates: the Sobolev space
  `W_q[0, 1]` with its norm and the penalized minimizer, and Brownian motion as a random element
  of `L²[0, 1]`.

The conventions of the README are used throughout. Estimators are Markov kernels; total
variation is Mathlib's `tvDist` with values in `[0, 2]`; the squared Hellinger distance is
`∫ (√p - √q)²`, with values in `[0, 2]`; samples of size `n` are maps on `Fin n` under
`Measure.pi`, and statistics of a sequence use its first `n` terms. Real-valued consequences
replace weak convergence in `ℓ^∞(T)`. Lower bounds for unbounded losses use extended integrals
`∫⁻` in `ℝ≥0∞`, and log-likelihoods take values in `EReal`.

Definitions owned by `MathematicalStatisticsFoundations` and `MathematicalStatisticsAsymptotic`
appear as local copies with a docstring naming their owner; the copy of `HasInfluenceFunction`
sits in the Layer 4 section. The implementation namespace of the README is `TauCeti`; the
prototypes live in this roadmap's namespace.
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

/-- **1.1** The affinity may be computed with any σ-finite dominating measure. -/
theorem hellingerAffinity_eq_integral (P Q μ : Measure X) [IsProbabilityMeasure P]
    [IsProbabilityMeasure Q] [SigmaFinite μ] (hP : P ≪ μ) (hQ : Q ≪ μ) :
    hellingerAffinity P Q = ∫ x, √((P.rnDeriv μ x).toReal * (Q.rnDeriv μ x).toReal) ∂μ := by
  sorry

/-- **1.1** The range of the affinity and of the squared distance, and its two extreme
values. -/
theorem hellingerAffinity_mem_Icc (P Q : Measure X) [IsProbabilityMeasure P]
    [IsProbabilityMeasure Q] :
    hellingerAffinity P Q ∈ Icc 0 1 ∧ sqHellinger P Q ∈ Icc 0 2 ∧
      (sqHellinger P Q = 0 ↔ P = Q) ∧ (sqHellinger P Q = 2 ↔ P ⟂ₘ Q) := by
  sorry

/-- **1.1** The Hellinger distance `√ sqHellinger` is symmetric and satisfies the triangle
inequality. -/
theorem sqrt_sqHellinger_triangle (P Q R : Measure X) [IsProbabilityMeasure P]
    [IsProbabilityMeasure Q] [IsProbabilityMeasure R] :
    √(sqHellinger P Q) = √(sqHellinger Q P) ∧
      √(sqHellinger P R) ≤ √(sqHellinger P Q) + √(sqHellinger Q R) := by
  sorry

/-- **1.1** The affinity of binary products is the product of the affinities. -/
theorem hellingerAffinity_prod (P Q : Measure X) (P' Q' : Measure Y) [IsProbabilityMeasure P]
    [IsProbabilityMeasure Q] [IsProbabilityMeasure P'] [IsProbabilityMeasure Q'] :
    hellingerAffinity (P.prod P') (Q.prod Q') =
      hellingerAffinity P Q * hellingerAffinity P' Q' := by
  sorry

/-- **1.1** The squared Hellinger distance of `n`-fold products; both sides vanish at `n = 0`. -/
theorem sqHellinger_pi_const {n : ℕ} (P Q : Measure X) [IsProbabilityMeasure P]
    [IsProbabilityMeasure Q] :
    sqHellinger (Measure.pi fun _ : Fin n ↦ P) (Measure.pi fun _ : Fin n ↦ Q) =
      2 * (1 - (1 - sqHellinger P Q / 2) ^ n) := by
  sorry

/-- **1.1** Data processing for a measurable map. -/
theorem hellingerAffinity_le_map (P Q : Measure X) [IsProbabilityMeasure P]
    [IsProbabilityMeasure Q] {T : X → Y} (hT : Measurable T) :
    hellingerAffinity P Q ≤ hellingerAffinity (P.map T) (Q.map T) := by
  sorry

/-- **1.1** The affinity of two Gaussian sequence laws whose means differ in finitely many
coordinates. -/
theorem hellingerAffinity_infinitePi_gaussianReal (θ θ' : ℕ → ℝ) {ε : ℝ} (hε : ε ≠ 0)
    (hθ : (Function.support (θ - θ')).Finite) :
    hellingerAffinity (Measure.infinitePi fun j ↦ gaussianReal (θ j) (ε ^ 2).toNNReal)
        (Measure.infinitePi fun j ↦ gaussianReal (θ' j) (ε ^ 2).toNNReal) =
      Real.exp (-(∑ j ∈ hθ.toFinset, (θ j - θ' j) ^ 2) / (8 * ε ^ 2)) := by
  sorry

/-- **1.2** The chi-squared divergence of probability measures vanishes only on the
diagonal. -/
theorem chiSqDiv_eq_zero_iff (P Q : Measure X) [IsProbabilityMeasure P]
    [IsProbabilityMeasure Q] :
    chiSqDiv P Q = 0 ↔ P = Q := by
  sorry

/-- **1.2** The chi-squared divergence of a Gaussian location mixture from the centred law,
both sides in `ℝ≥0∞`. -/
theorem one_add_chiSqDiv_gaussianMixture {d : ℕ} {ε : ℝ} (hε : 0 < ε)
    (π : Measure (EuclideanSpace ℝ (Fin d))) [IsProbabilityMeasure π] :
    1 + chiSqDiv
        (π.bind fun θ ↦ multivariateGaussian θ (ε ^ 2 • (1 : Matrix (Fin d) (Fin d) ℝ)))
        (multivariateGaussian 0 (ε ^ 2 • (1 : Matrix (Fin d) (Fin d) ℝ))) =
      ∫⁻ θ, ∫⁻ θ', ENNReal.ofReal (Real.exp (⟪θ, θ'⟫ / ε ^ 2)) ∂π ∂π := by
  sorry

/-- **1.3** The Kullback–Leibler divergence of `n`-fold products. -/
theorem klDiv_pi_const {n : ℕ} (P Q : Measure X) [IsProbabilityMeasure P]
    [IsProbabilityMeasure Q] :
    klDiv (Measure.pi fun _ : Fin n ↦ P) (Measure.pi fun _ : Fin n ↦ Q) = n * klDiv P Q := by
  sorry

/-- **1.3** The Kullback–Leibler divergence of two Gaussian sequence laws whose means differ in
finitely many coordinates. -/
theorem klDiv_infinitePi_gaussianReal (θ θ' : ℕ → ℝ) {ε : ℝ} (hε : ε ≠ 0)
    (hθ : (Function.support (θ - θ')).Finite) :
    klDiv (Measure.infinitePi fun j ↦ gaussianReal (θ j) (ε ^ 2).toNNReal)
        (Measure.infinitePi fun j ↦ gaussianReal (θ' j) (ε ^ 2).toNNReal) =
      ENNReal.ofReal ((∑ j ∈ hθ.toFinset, (θ j - θ' j) ^ 2) / (2 * ε ^ 2)) := by
  sorry

/-- **1.3** For `a ∈ [0, 1]` and `b ∈ (0, 1)`, `klBin a b` is the divergence of `Ber a` from
`Ber b`, the laws on `Bool` with mass `a` and `b` at `true`. -/
theorem klDiv_bernoulliMeasure {a b : ℝ} (ha : a ∈ Icc 0 1) (hb : b ∈ Ioo 0 1) :
    klDiv (bernoulliMeasure true false ⟨a, ha⟩)
        (bernoulliMeasure true false ⟨b, Ioo_subset_Icc_self hb⟩) =
      ENNReal.ofReal (klBin a b) := by
  sorry

/-- **1.3** The binary divergence is jointly convex on `[0, 1] × (0, 1)`. -/
theorem convexOn_klBin : ConvexOn ℝ (Icc 0 1 ×ˢ Ioo 0 1) fun p : ℝ × ℝ ↦ klBin p.1 p.2 := by
  sorry

/-- **1.3** Data processing to an event. Where `Q.real A ∈ {0, 1}` and `P.real A` differs from
it, `klBin` takes a junk value at most `0`, and the inequality still holds. -/
theorem ofReal_klBin_le_klDiv (P Q : Measure X) [IsProbabilityMeasure P] [IsProbabilityMeasure Q]
    {A : Set X} (hA : MeasurableSet A) :
    ENNReal.ofReal (klBin (P.real A) (Q.real A)) ≤ klDiv P Q := by
  sorry

/-- **1.4** Scheffé's identity for the testing affinity, attained by the indicator of
`{dP/dν < dQ/dν}`, with `ν = P + Q`. -/
theorem one_sub_tvDist_eq_integral_min (P Q : Measure X) [IsProbabilityMeasure P]
    [IsProbabilityMeasure Q] :
    1 - tvDist P Q / 2 =
        ∫ x, min (P.rnDeriv (P + Q) x).toReal (Q.rnDeriv (P + Q) x).toReal ∂(P + Q) ∧
      (∫ x, {x | P.rnDeriv (P + Q) x < Q.rnDeriv (P + Q) x}.indicator 1 x ∂P +
        ∫ x, (1 - {x | P.rnDeriv (P + Q) x < Q.rnDeriv (P + Q) x}.indicator 1 x) ∂Q) =
        1 - tvDist P Q / 2 := by
  sorry

/-- **1.4** The testing affinity over randomized tests given as Markov kernels to `Bool`. -/
theorem iInf_kernel_test_eq_one_sub_tvDist (P Q : Measure X) [IsProbabilityMeasure P]
    [IsProbabilityMeasure Q] :
    ⨅ ψ : {ψ : Kernel X Bool // IsMarkovKernel ψ},
        ((ψ.1 ∘ₘ P).real {true} + (ψ.1 ∘ₘ Q).real {false}) = 1 - tvDist P Q / 2 := by
  sorry

/-- **1.4** Le Cam's lower bound of the testing affinity by the Hellinger affinity. -/
theorem sq_one_sub_sqHellinger_le_integral_min (P Q : Measure X) [IsProbabilityMeasure P]
    [IsProbabilityMeasure Q] :
    (1 - sqHellinger P Q / 2) ^ 2 / 2 ≤
      ∫ x, min (P.rnDeriv (P + Q) x).toReal (Q.rnDeriv (P + Q) x).toReal ∂(P + Q) := by
  sorry

/-- **1.4** Pinsker's inequality in the convention `tvDist ∈ [0, 2]`. -/
theorem ofReal_tvDist_sq_le_two_mul_klDiv (P Q : Measure X) [IsProbabilityMeasure P]
    [IsProbabilityMeasure Q] :
    ENNReal.ofReal (tvDist P Q) ^ 2 ≤ 2 * klDiv P Q := by
  sorry

/-- **1.4** `log (1 + χ²) ≤ χ²`, the second half of the chi-squared bound. -/
theorem ofReal_log_one_add_chiSqDiv_le (P Q : Measure X) [IsProbabilityMeasure P]
    [IsProbabilityMeasure Q] (h : chiSqDiv P Q ≠ ∞) :
    ENNReal.ofReal (Real.log (1 + (chiSqDiv P Q).toReal)) ≤ chiSqDiv P Q := by
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
    {α : ℝ} (hα0 : 0 ≤ α)
    (hα : ∀ ω ω', hammingDist ω ω' = 1 → klDiv (P ω) (P ω') ≤ ENNReal.ofReal α)
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

/-- **2.1** The risk form of the reduction: Markov's inequality for a monotone loss of the
distance, with no measurability of the loss. -/
theorem mul_measure_le_lintegral_edist (P : Measure X) (κ : Kernel X Y) (θ : Y) (s : ℝ)
    {ℓ : ℝ≥0∞ → ℝ≥0∞} (hℓ : Monotone ℓ) :
    ℓ (ENNReal.ofReal s) * (κ ∘ₘ P) {y | s ≤ dist y θ} ≤ ∫⁻ y, ℓ (edist y θ) ∂(κ ∘ₘ P) := by
  sorry

/-- **2.2** Le Cam's two-point bound in Hellinger form. -/
theorem max_measure_ge_of_sqHellinger (P : Fin 2 → Measure X) [∀ i, IsProbabilityMeasure (P i)]
    (θ : Fin 2 → Y) {s α : ℝ} (hs : 2 * s ≤ dist (θ 0) (θ 1))
    (hα : sqHellinger (P 0) (P 1) ≤ α) (hα2 : α < 2) (κ : Kernel X Y) [IsMarkovKernel κ] :
    (1 - √(α * (1 - α / 4))) / 2 ≤
      max ((κ ∘ₘ P 0).real {y | s ≤ dist y (θ 0)}) ((κ ∘ₘ P 1).real {y | s ≤ dist y (θ 1)}) := by
  sorry

/-- **2.2** Le Cam's two-point bounds for samples of size `n`: the Kullback–Leibler form with
`α = n · klDiv`, and the Hellinger form with `α = 2 (1 - (1 - sqHellinger / 2)^n) < 2`. -/
theorem max_measure_ge_of_pi (Q : Fin 2 → Measure X) [∀ i, IsProbabilityMeasure (Q i)]
    (θ : Fin 2 → Y) {s : ℝ} (hs : 2 * s ≤ dist (θ 0) (θ 1)) {n : ℕ}
    (κ : Kernel (Fin n → X) Y) [IsMarkovKernel κ] :
    (klDiv (Q 0) (Q 1) ≠ ∞ →
      max (Real.exp (-(n * (klDiv (Q 0) (Q 1)).toReal)) / 4)
          ((1 - √(n * (klDiv (Q 0) (Q 1)).toReal / 2)) / 2) ≤
        max ((κ ∘ₘ Measure.pi fun _ ↦ Q 0).real {y | s ≤ dist y (θ 0)})
          ((κ ∘ₘ Measure.pi fun _ ↦ Q 1).real {y | s ≤ dist y (θ 1)})) ∧
    (sqHellinger (Q 0) (Q 1) < 2 →
      2 * (1 - (1 - sqHellinger (Q 0) (Q 1) / 2) ^ n) < 2 ∧
      (1 - √(2 * (1 - (1 - sqHellinger (Q 0) (Q 1) / 2) ^ n) *
          (1 - 2 * (1 - (1 - sqHellinger (Q 0) (Q 1) / 2) ^ n) / 4))) / 2 ≤
        max ((κ ∘ₘ Measure.pi fun _ ↦ Q 0).real {y | s ≤ dist y (θ 0)})
          ((κ ∘ₘ Measure.pi fun _ ↦ Q 1).real {y | s ≤ dist y (θ 1)})) := by
  sorry

/-- **2.3** The size of a Hamming ball about the constant `false` word, by Hoeffding's
inequality. -/
theorem card_hammingDist_le {m : ℕ} (hm : 1 ≤ m) {r : ℝ} (hr0 : 0 ≤ r) (hr : r ≤ m / 2) :
    (((Finset.univ : Finset (Fin m → Bool)).filter
        fun ω ↦ (hammingDist ω fun _ ↦ false : ℝ) ≤ r).card : ℝ) ≤
      2 ^ m * Real.exp (-2 * (m / 2 - r) ^ 2 / m) := by
  sorry

/-- **2.3** The packing form of the Varshamov–Gilbert bound: the Hamming cube contains more than
`2^{m/8}` points that are pairwise at distance more than `m/8`. -/
theorem le_packingNumber_hamming {m : ℕ} (hm : 8 ≤ m) :
    ∃ M : ℕ, (2 : ℝ) ^ ((m : ℝ) / 8) ≤ M ∧
      ((M + 1 : ℕ) : ℕ∞) ≤
        Metric.packingNumber ((m : ℝ≥0) / 8) (univ : Set (Hamming fun _ : Fin m ↦ Bool)) := by
  sorry

/-- **2.4** The compensation identity behind the mixture bound. -/
theorem inv_mul_sum_klDiv_eq {M : ℕ} (hM : 1 ≤ M) (P : Fin M → Measure X)
    [∀ j, IsProbabilityMeasure (P j)] (Q : Measure X) [IsProbabilityMeasure Q] :
    (M : ℝ≥0∞)⁻¹ * ∑ j, klDiv (P j) Q = mutualInfoUniform P + klDiv (uniformMixture P) Q := by
  sorry

/-- **2.4** Fano's method for estimation: separated parameters and a reference law with finite
divergences. Without the finiteness hypothesis the `toReal` of an infinite divergence would be
the junk value `0`. -/
theorem max_measure_ge_of_fano {M : ℕ} (hM : 2 ≤ M) (P : Fin M → Measure X)
    [∀ j, IsProbabilityMeasure (P j)] (θ : Fin M → Y) {s : ℝ}
    (hs : ∀ i j, i ≠ j → 2 * s ≤ dist (θ i) (θ j)) (Q : Measure X) [IsProbabilityMeasure Q]
    (hQ : ∀ j, klDiv (P j) Q ≠ ∞) (κ : Kernel X Y) [IsMarkovKernel κ] :
    1 - ((M : ℝ)⁻¹ * (∑ j, (klDiv (P j) Q).toReal) + Real.log 2) / Real.log M ≤
      ⨆ j, (κ ∘ₘ P j).real {y | s ≤ dist y (θ j)} := by
  sorry

/-- **2.4** The packing form of Fano's method, with a bound independent of `M`. -/
theorem max_measure_ge_of_packing {M : ℕ} (hM : 2 ≤ M) (P : Fin (M + 1) → Measure X)
    [∀ j, IsProbabilityMeasure (P j)] (θ : Fin (M + 1) → Y) {s : ℝ}
    (hs : ∀ i j, i ≠ j → 2 * s ≤ dist (θ i) (θ j)) {α : ℝ} (hα0 : 0 < α) (hα : α < 1 / 8)
    (hkl : ((M : ℝ≥0∞) + 1)⁻¹ * ∑ j, klDiv (P j) (P 0) ≤ ENNReal.ofReal (α * Real.log M))
    (κ : Kernel X Y) [IsMarkovKernel κ] :
    1 - α - Real.log 2 / Real.log (M + 1) ≤ ⨆ j, (κ ∘ₘ P j).real {y | s ≤ dist y (θ j)} ∧
      1 - 1 / 8 - Real.log 2 / Real.log 3 ≤ 1 - α - Real.log 2 / Real.log (M + 1) ∧
      (0.24 : ℝ) < 1 - 1 / 8 - Real.log 2 / Real.log 3 := by
  sorry

/-- **2.5** Assouad's lemma in Hellinger form. -/
theorem assouad_sqHellinger {m : ℕ} (P : (Fin m → Bool) → Measure X)
    [∀ ω, IsProbabilityMeasure (P ω)] {α : ℝ}
    (hα : ∀ ω ω', hammingDist ω ω' = 1 → sqHellinger (P ω) (P ω') ≤ α) (hα2 : α < 2)
    (κ : Kernel X (Fin m → Bool)) [IsMarkovKernel κ] :
    (m : ℝ) / 2 * (1 - √(α * (1 - α / 4))) ≤
      ⨆ ω, ∫ ω', (hammingDist ω' ω : ℝ) ∂(κ ∘ₘ P ω) := by
  sorry

/-- **2.6** Le Cam's bound in Kullback–Leibler form for Mathlib's minimax risk under squared
distance loss. -/
theorem minimaxRisk_ge_of_klDiv {Θ : Type*} [MeasurableSpace Θ] (P : Kernel Θ X)
    [IsMarkovKernel P] (g : Θ → Y) (θ₀ θ₁ : Θ) {s α : ℝ} (hs0 : 0 ≤ s)
    (hs : 2 * s ≤ dist (g θ₀) (g θ₁)) (hα0 : 0 ≤ α)
    (hα : klDiv (P θ₀) (P θ₁) ≤ ENNReal.ofReal α) :
    ENNReal.ofReal (s ^ 2 * max (Real.exp (-α) / 4) ((1 - √(α / 2)) / 2)) ≤
      minimaxRisk (fun θ y ↦ ENNReal.ofReal (dist y (g θ) ^ 2)) P := by
  sorry

/-- **2.6** Fano's method for Mathlib's minimax risk under squared distance loss. -/
theorem minimaxRisk_ge_of_fano {Θ : Type*} [MeasurableSpace Θ] (P : Kernel Θ X)
    [IsMarkovKernel P] (g : Θ → Y) {M : ℕ} (hM : 2 ≤ M) (θ : Fin M → Θ) {s : ℝ} (hs0 : 0 ≤ s)
    (hs : ∀ i j, i ≠ j → 2 * s ≤ dist (g (θ i)) (g (θ j))) (Q : Measure X)
    [IsProbabilityMeasure Q] (hQ : ∀ j, klDiv (P (θ j)) Q ≠ ∞) :
    ENNReal.ofReal (s ^ 2 * (1 - ((M : ℝ)⁻¹ * (∑ j, (klDiv (P (θ j)) Q).toReal) +
        Real.log 2) / Real.log M)) ≤
      minimaxRisk (fun θ y ↦ ENNReal.ofReal (dist y (g θ) ^ 2)) P := by
  sorry

/-- **2.6** Assouad's lemma for Mathlib's minimax risk under squared distance loss. -/
theorem minimaxRisk_ge_of_assouad {Θ : Type*} [MeasurableSpace Θ] (P : Kernel Θ X)
    [IsMarkovKernel P] (g : Θ → Y) {m : ℕ} (θ : (Fin m → Bool) → Θ) {c : ℝ} (hc : 0 < c)
    (hθ : ∀ ω ω', c * hammingDist ω ω' ≤ dist (g (θ ω)) (g (θ ω')) ^ 2) :
    ENNReal.ofReal (c / 8 * m * ⨅ p : {p : (Fin m → Bool) × (Fin m → Bool) //
        hammingDist p.1 p.2 = 1}, (1 - tvDist (P (θ p.1.1)) (P (θ p.1.2)) / 2)) ≤
      minimaxRisk (fun θ y ↦ ENNReal.ofReal (dist y (g θ) ^ 2)) P := by
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
theorem integral_linearRankStatistic {N : ℕ} (P : Measure ℝ) [IsProbabilityMeasure P]
    [NullSingletonClass P]
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

/-- **3.3** The Kruskal–Wallis statistic for a group assignment `g`; group sizes are the fibre
sizes of `g`. -/
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
theorem isProbabilityMeasure_kolmogorovMeasure : IsProbabilityMeasure kolmogorovMeasure := by
  sorry

/-- **3.6** The distribution function of the Kolmogorov distribution. -/
theorem cdf_kolmogorovMeasure :
    cdf kolmogorovMeasure = kolmogorovCdf := by
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

/-- **3.1** For distinct entries, `rank x - 1` is the permutation inverse to `Tuple.sort x`. -/
theorem rank_eq_sort_symm_add_one {n : ℕ} (x : Fin n → ℝ) (hx : Function.Injective x)
    (i : Fin n) :
    rank x i = ((Tuple.sort x).symm i : ℕ) + 1 := by
  sorry

/-- **3.1** Ranks are invariant under a strictly increasing map applied coordinatewise. -/
theorem rank_comp_strictMono {n : ℕ} (x : Fin n → ℝ) {f : ℝ → ℝ} (hf : StrictMono f) :
    rank (f ∘ x) = rank x := by
  sorry

/-- **3.1** Ranks are equivariant under permutations of the coordinates. -/
theorem rank_comp_perm {n : ℕ} (x : Fin n → ℝ) (σ : Equiv.Perm (Fin n)) :
    rank (x ∘ σ) = rank x ∘ σ := by
  sorry

/-- **3.2** The exact scores sum to `N ∫₀¹ φ`, since the beta densities of the `N` uniform order
statistics sum to `N`. -/
theorem sum_exactScore {φ : ℝ → ℝ} (hφ : IntervalIntegrable φ volume 0 1) (N : ℕ) :
    ∑ i ∈ Finset.Icc 1 N, exactScore φ N i = N * ∫ u in (0 : ℝ)..1, φ u := by
  sorry

/-- **3.2** The location score `-(f'/f) ∘ F⁻¹` of the logistic law is `2u - 1`, that of the
standard normal law is `Φ⁻¹`, and the scale score `-1 - F⁻¹ · (f'/f) ∘ F⁻¹` of the standard
exponential law is `-1 - log (1 - u)`. -/
theorem score_logistic_gaussian_exponential :
    (∀ u ∈ Ioo (0 : ℝ) 1, ∀ q, q = (volume.withDensity fun y ↦
        ENNReal.ofReal (Real.exp (-y) / (1 + Real.exp (-y)) ^ 2)).quantile u →
      -(deriv (fun y ↦ Real.exp (-y) / (1 + Real.exp (-y)) ^ 2) q /
        (Real.exp (-q) / (1 + Real.exp (-q)) ^ 2)) = 2 * u - 1) ∧
    (∀ u ∈ Ioo (0 : ℝ) 1, ∀ q, q = (gaussianReal 0 1).quantile u →
      -(deriv (gaussianPDFReal 0 1) q / gaussianPDFReal 0 1 q) = q) ∧
    (∀ u ∈ Ioo (0 : ℝ) 1, ∀ q, q = (expMeasure 1).quantile u →
      -1 - q * (deriv (exponentialPDFReal 1) q / exponentialPDFReal 1 q) =
        -1 - Real.log (1 - u)) := by
  sorry

/-- **3.2** The exact scores of the logistic location score `2u - 1` are `2i/(N + 1) - 1`, and
those of the exponential scale score `-1 - log (1 - u)` are the Savage scores minus `1`. -/
theorem exactScore_logistic_savage {N i : ℕ} (hi : i ∈ Finset.Icc 1 N) :
    exactScore (fun u ↦ 2 * u - 1) N i = 2 * i / (N + 1) - 1 ∧
      exactScore (fun u ↦ -1 - Real.log (1 - u)) N i =
        (∑ j ∈ Finset.Icc (N - i + 1) N, (j : ℝ)⁻¹) - 1 := by
  sorry

/-- **3.2** In the location family with density `f (x - θ c i)` at coordinate `i`, for `f`
absolutely continuous with finite Fisher information, the probability of each rank vector is
differentiable at `θ = 0`, with derivative `(N!)⁻¹ ∑ i, c i · exactScore φf N (σ i + 1)` for the
location score `φf = -(f'/f) ∘ F⁻¹`. -/
theorem hasDerivAt_measure_rank_location {N : ℕ} (f f' : ℝ → ℝ) (hf0 : ∀ x, 0 ≤ f x)
    (hf1 : ∫ x, f x = 1) (hac : ∀ a b, AbsolutelyContinuousOnInterval f a b)
    (hf' : ∀ᵐ x, HasDerivAt f (f' x) x) (hI : ∫⁻ x, ENNReal.ofReal (f' x ^ 2 / f x) < ∞)
    (Q : ℝ → Measure ℝ) (hQ : ∀ μ, Q μ = volume.withDensity fun y ↦ ENNReal.ofReal (f (y - μ)))
    (φf : ℝ → ℝ) (hφf : ∀ u, φf u = -(f' ((Q 0).quantile u) / f ((Q 0).quantile u)))
    (c : Fin N → ℝ) (σ : Equiv.Perm (Fin N)) :
    HasDerivAt
      (fun θ ↦ (Measure.pi fun i ↦ Q (θ * c i)).real {x | ∀ i, rank x i = (σ i : ℕ) + 1})
      ((N.factorial : ℝ)⁻¹ * ∑ i, c i * exactScore φf N ((σ i : ℕ) + 1)) 0 := by
  sorry

/-- **3.2** In the scale family with density `e^{-θ c i} f (e^{-θ c i} x)` at coordinate `i`,
for `f` absolutely continuous with finite scale information `∫ (1 + x f'/f)² f`, the probability
of each rank vector is differentiable at `θ = 0`, with the scale score
`φs = -1 - F⁻¹ · (f'/f) ∘ F⁻¹` in place of the location score. -/
theorem hasDerivAt_measure_rank_scale {N : ℕ} (f f' : ℝ → ℝ) (hf0 : ∀ x, 0 ≤ f x)
    (hf1 : ∫ x, f x = 1) (hac : ∀ a b, AbsolutelyContinuousOnInterval f a b)
    (hf' : ∀ᵐ x, HasDerivAt f (f' x) x)
    (hI : ∫⁻ x, ENNReal.ofReal ((1 + x * f' x / f x) ^ 2 * f x) < ∞) (Q : ℝ → Measure ℝ)
    (hQ : ∀ τ, Q τ = volume.withDensity fun y ↦
      ENNReal.ofReal (Real.exp (-τ) * f (Real.exp (-τ) * y)))
    (φs : ℝ → ℝ)
    (hφs : ∀ u, φs u = -1 - (Q 0).quantile u * (f' ((Q 0).quantile u) / f ((Q 0).quantile u)))
    (c : Fin N → ℝ) (σ : Equiv.Perm (Fin N)) :
    HasDerivAt
      (fun θ ↦ (Measure.pi fun i ↦ Q (θ * c i)).real {x | ∀ i, rank x i = (σ i : ℕ) + 1})
      ((N.factorial : ℝ)⁻¹ * ∑ i, c i * exactScore φs N ((σ i : ℕ) + 1)) 0 := by
  sorry

/-- **3.2** Locally most powerful rank tests, by the Neyman–Pearson lemma on rank vectors. Let
`R θ` be laws of samples with distinct entries almost surely, with a uniform rank vector at
`θ = 0`, such that the probability of the rank vector `σ + 1` has derivative `(N!)⁻¹ T σ` at `0`,
where `T σ = ∑ i, c i a (σ i + 1)`. A rank test `ψs` equal to `1` where `T > k` and to `0` where
`T < k` maximizes the derivative at `0` of the power among rank tests of the same size; if `ψs`
is the indicator of `{T > k}`, it is most powerful among rank tests of its size for every `θ` in
some interval `(0, ε)`. -/
theorem rankTest_locallyMostPowerful {N : ℕ} (R : ℝ → Measure (Fin N → ℝ))
    [∀ θ, IsProbabilityMeasure (R θ)] (hinj : ∀ θ, ∀ᵐ x ∂R θ, Function.Injective x)
    (h0 : ∀ σ : Equiv.Perm (Fin N),
      (R 0).real {x | ∀ i, rank x i = (σ i : ℕ) + 1} = (N.factorial : ℝ)⁻¹)
    (c : Fin N → ℝ) (a : ℕ → ℝ)
    (hR : ∀ σ : Equiv.Perm (Fin N),
      HasDerivAt (fun θ ↦ (R θ).real {x | ∀ i, rank x i = (σ i : ℕ) + 1})
        ((N.factorial : ℝ)⁻¹ * ∑ i, c i * a ((σ i : ℕ) + 1)) 0)
    (k : ℝ) (ψs : (Fin N → ℕ) → ℝ) (hψs : ∀ r, ψs r ∈ Icc 0 1)
    (hk : ∀ σ : Equiv.Perm (Fin N),
      (k < ∑ i, c i * a ((σ i : ℕ) + 1) → ψs (fun i ↦ (σ i : ℕ) + 1) = 1) ∧
        (∑ i, c i * a ((σ i : ℕ) + 1) < k → ψs (fun i ↦ (σ i : ℕ) + 1) = 0)) :
    (∀ ψ : (Fin N → ℕ) → ℝ, (∀ r, ψ r ∈ Icc 0 1) →
      ∫ x, ψ (rank x) ∂R 0 = ∫ x, ψs (rank x) ∂R 0 →
      deriv (fun θ ↦ ∫ x, ψ (rank x) ∂R θ) 0 ≤ deriv (fun θ ↦ ∫ x, ψs (rank x) ∂R θ) 0) ∧
    ((∀ σ : Equiv.Perm (Fin N), ψs (fun i ↦ (σ i : ℕ) + 1) =
        if k < ∑ i, c i * a ((σ i : ℕ) + 1) then 1 else 0) →
      ∃ ε > 0, ∀ θ ∈ Ioo 0 ε, ∀ ψ : (Fin N → ℕ) → ℝ, (∀ r, ψ r ∈ Icc 0 1) →
        ∫ x, ψ (rank x) ∂R 0 = ∫ x, ψs (rank x) ∂R 0 →
        ∫ x, ψ (rank x) ∂R θ ≤ ∫ x, ψs (rank x) ∂R θ) := by
  sorry

/-- **3.3** Without ties in the pooled sample, the Mann–Whitney count is the rank sum of the
second sample minus `n (n + 1) / 2`, a linear rank statistic with two-sample coefficients and
the scores `a k = k`. -/
theorem mannWhitney_eq_rankSum {m n : ℕ} (x : Fin m → ℝ) (y : Fin n → ℝ)
    (hxy : Function.Injective (Fin.append x y)) :
    mannWhitney x y =
        (∑ j : Fin n, (rank (Fin.append x y) (Fin.natAdd m j) : ℝ)) - n * (n + 1) / 2 ∧
      mannWhitney x y =
        linearRankStatistic (fun i ↦ if m ≤ (i : ℕ) then 1 else 0) (fun k ↦ k)
          (Fin.append x y) - n * (n + 1) / 2 := by
  sorry

/-- **3.3** Without ties in either coordinate, Kendall's tau is
`4/(n(n - 1)) · #{concordant pairs} - 1`. -/
theorem kendallTau_eq_concordant {n : ℕ} (hn : 2 ≤ n) (z : Fin n → ℝ × ℝ)
    (h₁ : Function.Injective fun i ↦ (z i).1) (h₂ : Function.Injective fun i ↦ (z i).2) :
    kendallTau z = 4 / ((n : ℝ) * (n - 1)) *
      ((Finset.univ : Finset (Fin n × Fin n)).filter fun p ↦
        p.1 < p.2 ∧ 0 < ((z p.1).1 - (z p.2).1) * ((z p.1).2 - (z p.2).2)).card - 1 := by
  sorry

/-- **3.3** The sample correlation of two vectors. -/
def sampleCorrelation {n : ℕ} (u v : Fin n → ℝ) : ℝ :=
  (∑ i, (u i - (n : ℝ)⁻¹ * ∑ j, u j) * (v i - (n : ℝ)⁻¹ * ∑ j, v j)) /
    √((∑ i, (u i - (n : ℝ)⁻¹ * ∑ j, u j) ^ 2) * ∑ i, (v i - (n : ℝ)⁻¹ * ∑ j, v j) ^ 2)

/-- **3.3** Spearman's rank correlation `1 - 6 ∑ (R i - S i)² / (n (n² - 1))`, with `R`, `S`
the ranks of the two coordinates. -/
def spearmanRho {n : ℕ} (z : Fin n → ℝ × ℝ) : ℝ :=
  1 - 6 * (∑ i, ((rank (fun j ↦ (z j).1) i : ℝ) - rank (fun j ↦ (z j).2) i) ^ 2) /
    (n * ((n : ℝ) ^ 2 - 1))

/-- **3.3** For injective coordinates, Spearman's rho is the sample correlation of the two rank
vectors. -/
theorem spearmanRho_eq_sampleCorrelation {n : ℕ} (hn : 2 ≤ n) (z : Fin n → ℝ × ℝ)
    (h₁ : Function.Injective fun i ↦ (z i).1) (h₂ : Function.Injective fun i ↦ (z i).2) :
    spearmanRho z = sampleCorrelation (fun i ↦ (rank (fun j ↦ (z j).1) i : ℝ))
      (fun i ↦ (rank (fun j ↦ (z j).2) i : ℝ)) := by
  sorry

/-- **3.3** Under independence with atomless marginals, Spearman's rho is distribution-free. -/
theorem map_spearmanRho_pi_eq {n : ℕ} (P₁ P₂ P₁' P₂' : Measure ℝ) [IsProbabilityMeasure P₁]
    [IsProbabilityMeasure P₂] [IsProbabilityMeasure P₁'] [IsProbabilityMeasure P₂']
    [NullSingletonClass P₁] [NullSingletonClass P₂] [NullSingletonClass P₁']
    [NullSingletonClass P₂'] :
    (Measure.pi fun _ : Fin n ↦ P₁.prod P₂).map spearmanRho =
      (Measure.pi fun _ : Fin n ↦ P₁'.prod P₂').map spearmanRho := by
  sorry

/-- **3.3** The null mean and variance of Spearman's rho under independence. -/
theorem integral_variance_spearmanRho {n : ℕ} (hn : 2 ≤ n) (P₁ P₂ : Measure ℝ)
    [IsProbabilityMeasure P₁] [IsProbabilityMeasure P₂] [NullSingletonClass P₁]
    [NullSingletonClass P₂] :
    ∫ z, spearmanRho z ∂(Measure.pi fun _ : Fin n ↦ P₁.prod P₂) = 0 ∧
      Var[spearmanRho; Measure.pi fun _ : Fin n ↦ P₁.prod P₂] = 1 / ((n : ℝ) - 1) := by
  sorry

/-- **3.3** The Kruskal–Wallis statistic is distribution-free under a common atomless law. -/
theorem map_kruskalWallis_pi_eq {N k : ℕ} (g : Fin N → Fin k) (P P' : Measure ℝ)
    [IsProbabilityMeasure P] [IsProbabilityMeasure P'] [NullSingletonClass P]
    [NullSingletonClass P'] :
    (Measure.pi fun _ : Fin N ↦ P).map (kruskalWallis g) =
      (Measure.pi fun _ : Fin N ↦ P').map (kruskalWallis g) := by
  sorry

/-- **3.4** For `n ≥ 1` the Hodges–Lehmann estimator is translation and scale equivariant. -/
theorem hodgesLehmann_add_const_smul {n : ℕ} (hn : 1 ≤ n) (x : Fin n → ℝ) (c a : ℝ) :
    hodgesLehmann (fun i ↦ x i + c) = hodgesLehmann x + c ∧
      hodgesLehmann (a • x) = a * hodgesLehmann x := by
  sorry

/-- **3.4** The Hodges–Lehmann estimator is where `θ ↦ W⁺ (x - θ)` crosses `M / 2`, for a
sample with distinct entries and `θ` not a Walsh average. -/
theorem hodgesLehmann_crossing {n : ℕ} (hn : 1 ≤ n) (x : Fin n → ℝ) (hx : Function.Injective x)
    (θ : ℝ) (hθ : ∀ i j, (x i + x j) / 2 ≠ θ) :
    (((n * (n + 1) / 2 : ℕ) : ℝ) / 2 < signedRankStatistic (fun i ↦ x i - θ) →
        θ < hodgesLehmann x) ∧
      (signedRankStatistic (fun i ↦ x i - θ) < ((n * (n + 1) / 2 : ℕ) : ℝ) / 2 →
        hodgesLehmann x < θ) := by
  sorry

/-- **3.5** The order-statistic formula for the Kolmogorov–Smirnov statistic of a sorted sample
from a law with continuous distribution function. -/
theorem ksStatistic_eq_iSup {n : ℕ} (hn : 0 < n) (P : Measure ℝ) [IsProbabilityMeasure P]
    (hP : Continuous (cdf P)) (x : Fin n → ℝ) (hx : Monotone x) :
    ksStatistic P x =
      ⨆ i : Fin n, max (((i : ℝ) + 1) / n - cdf P (x i)) (cdf P (x i) - i / n) := by
  sorry

/-- **3.5** The Cramér–von Mises statistic is distribution-free for a continuous law. -/
theorem map_cvmStatistic_pi {n : ℕ} (P : Measure ℝ) [IsProbabilityMeasure P]
    (hP : Continuous (cdf P)) :
    (Measure.pi fun _ : Fin n ↦ P).map (cvmStatistic P) =
      (Measure.pi fun _ : Fin n ↦ volume.restrict (Icc (0 : ℝ) 1)).map
        (cvmStatistic (volume.restrict (Icc (0 : ℝ) 1))) := by
  sorry

/-- **3.5** The two-sample Kolmogorov–Smirnov statistic is distribution-free under a common
atomless law. -/
theorem map_ksTwoSample_pi_eq {m n : ℕ} (P P' : Measure ℝ) [IsProbabilityMeasure P]
    [IsProbabilityMeasure P'] [NullSingletonClass P] [NullSingletonClass P'] :
    ((Measure.pi fun _ : Fin m ↦ P).prod (Measure.pi fun _ : Fin n ↦ P)).map
        (fun z ↦ ksTwoSample z.1 z.2) =
      ((Measure.pi fun _ : Fin m ↦ P').prod (Measure.pi fun _ : Fin n ↦ P')).map
        (fun z ↦ ksTwoSample z.1 z.2) := by
  sorry

/-- **3.6** The lattice-path sums at `k_n = ⌈x √(2n)⌉` are the distribution function of
`√(n/2) D_{n,n}` at `x`. -/
theorem gnedenkoKorolyuk_ceil_eq {n : ℕ} (hn : 1 ≤ n) (P : Measure ℝ) [IsProbabilityMeasure P]
    (hP : Continuous (cdf P)) {x : ℝ} (hx : 0 < x) :
    gnedenkoKorolyuk n ⌈x * √(2 * n)⌉₊ =
      ((Measure.pi fun _ : Fin n ↦ P).prod (Measure.pi fun _ : Fin n ↦ P)).real
        {z | √((n : ℝ) / 2) * ksTwoSample z.1 z.2 < x} := by
  sorry

/-- **3.5** For `k > n` only the term `j = 0` of the Gnedenko–Korolyuk sum survives. -/
theorem gnedenkoKorolyuk_of_lt {n k : ℕ} (h : n < k) : gnedenkoKorolyuk n k = 1 := by
  sorry

/-- **3.6** The Kolmogorov distribution function is nondecreasing on `(0, ∞)`. -/
theorem monotoneOn_kolmogorovCdf : MonotoneOn kolmogorovCdf (Ioi 0) := by
  sorry

end Layer3

/-! ## Layer 4: rank and goodness-of-fit asymptotics -/

section Layer4

variable {Ω : Type*} [MeasurableSpace Ω] (μ : Measure Ω) [IsProbabilityMeasure μ]

/-- **4.1** The approximating sum `N c̄ ā + ∑ i, (c i - c̄) φ (F (x i))` of van der Vaart's
Theorem 13.5 for the linear rank statistic with exact scores, with `F = cdf P` and `ā` the average
of the exact scores. It is not the Hájek projection `∑ i, E(T | X i) - (N - 1) E T` of
MathematicalStatisticsAsymptotic 6.1, from which it differs at fixed `N`. -/
def rankStatisticProjection (P : Measure ℝ) (φ : ℝ → ℝ) {N : ℕ} (c : Fin N → ℝ)
    (x : Fin N → ℝ) : ℝ :=
  (∑ i, c i) * (N : ℝ)⁻¹ * (∑ k ∈ Finset.range N, exactScore φ N (k + 1)) +
    ∑ i, (c i - (N : ℝ)⁻¹ * ∑ j, c j) * φ (cdf P (x i))

/-- **4.1** The approximating sum `rankStatisticProjection` has the mean of the rank statistic,
and the relative variance of the difference tends to `0`. -/
theorem tendsto_variance_linearRankStatistic_sub_projection (P : Measure ℝ)
    [IsProbabilityMeasure P] [NullSingletonClass P] (φ : ℝ → ℝ)
    (hφ : MemLp φ 2 (volume.restrict (Ioo 0 1)))
    (hφc : ∀ a : ℝ, ¬ φ =ᵐ[volume.restrict (Ioo 0 1)] fun _ ↦ a) (c : (N : ℕ) → Fin N → ℝ) :
    (∀ N, ∫ x, linearRankStatistic (c N) (exactScore φ N) x ∂(Measure.pi fun _ ↦ P) =
      ∫ x, rankStatisticProjection P φ (c N) x ∂(Measure.pi fun _ ↦ P)) ∧
    Tendsto (fun N ↦
        Var[fun x ↦ linearRankStatistic (c N) (exactScore φ N) x -
            rankStatisticProjection P φ (c N) x; Measure.pi fun _ ↦ P] /
        Var[linearRankStatistic (c N) (exactScore φ N); Measure.pi fun _ ↦ P]) atTop (𝓝 0) := by
  sorry

/-- **4.1** The projection with the approximate scores `φ (k/(N + 1))`, for `φ` nonconstant,
continuous almost everywhere and with `N⁻¹ ∑_{k ≤ N} φ (k/(N + 1))² → ∫₀¹ φ²`: the approximating
sum `N c̄ ā + ∑ i, (c i - c̄) φ (F (x i))`, with `ā` the average of these scores, has the mean of
the rank statistic, and the relative variance of the difference tends to `0`. -/
theorem tendsto_variance_linearRankStatistic_sub_projection_approx (P : Measure ℝ)
    [IsProbabilityMeasure P] [NullSingletonClass P] (φ : ℝ → ℝ)
    (hφ : MemLp φ 2 (volume.restrict (Ioo 0 1)))
    (hφc : ∀ a : ℝ, ¬ φ =ᵐ[volume.restrict (Ioo 0 1)] fun _ ↦ a)
    (hφcont : ∀ᵐ u ∂(volume.restrict (Ioo (0 : ℝ) 1)), ContinuousAt φ u)
    (hφsq : Tendsto (fun N : ℕ ↦ (N : ℝ)⁻¹ *
        ∑ k ∈ Finset.range N, φ (((k : ℝ) + 1) / ((N : ℝ) + 1)) ^ 2) atTop
      (𝓝 (∫ u in (0 : ℝ)..1, φ u ^ 2)))
    (c : (N : ℕ) → Fin N → ℝ) :
    (∀ N, ∫ x, linearRankStatistic (c N) (fun k ↦ φ ((k : ℝ) / ((N : ℝ) + 1))) x
        ∂(Measure.pi fun _ ↦ P) =
      ∫ x, ((∑ i, c N i) * (N : ℝ)⁻¹ *
          (∑ k ∈ Finset.range N, φ (((k : ℝ) + 1) / ((N : ℝ) + 1))) +
        ∑ i, (c N i - (N : ℝ)⁻¹ * ∑ j, c N j) * φ (cdf P (x i))) ∂(Measure.pi fun _ ↦ P)) ∧
    Tendsto (fun N ↦
        Var[fun x ↦ linearRankStatistic (c N) (fun k ↦ φ ((k : ℝ) / ((N : ℝ) + 1))) x -
            ((∑ i, c N i) * (N : ℝ)⁻¹ *
              (∑ k ∈ Finset.range N, φ (((k : ℝ) + 1) / ((N : ℝ) + 1))) +
            ∑ i, (c N i - (N : ℝ)⁻¹ * ∑ j, c N j) * φ (cdf P (x i))); Measure.pi fun _ ↦ P] /
        Var[linearRankStatistic (c N) (fun k ↦ φ ((k : ℝ) / ((N : ℝ) + 1)));
          Measure.pi fun _ ↦ P]) atTop (𝓝 0) := by
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
    TendstoInDistribution (fun (n : ℕ) ω ↦ √(n : ℝ) * kendallTau (firstN Z n ω)) atTop id
      (fun _ ↦ μ)
      (gaussianReal 0 (4 / 9 : ℝ≥0)) := by
  sorry

/-- **4.2** Kendall's tau for every law with continuous marginals:
`√n (τ̂ - τ) ⇝ N(0, 4 ζ₁)`, with `τ = E sign ((X₁ - X₂)(Y₁ - Y₂))` and `ζ₁` the variance of the
first Hoeffding projection `z ↦ E sign ((z.1 - X₂)(z.2 - Y₂))`. For `ζ₁ = 0` the limit is the
Dirac law at `0`. -/
theorem tendstoInDistribution_kendallTau_sub (P : Measure (ℝ × ℝ)) [IsProbabilityMeasure P]
    (hP₁ : Continuous (cdf (P.map Prod.fst))) (hP₂ : Continuous (cdf (P.map Prod.snd)))
    (Z : ℕ → Ω → ℝ × ℝ) (hZ : IsIndependentIdenticallyDistributed μ Z P) :
    TendstoInDistribution (fun (n : ℕ) ω ↦ √(n : ℝ) * (kendallTau (firstN Z n ω) -
        ∫ p, Real.sign ((p.1.1 - p.2.1) * (p.1.2 - p.2.2)) ∂(P.prod P))) atTop id (fun _ ↦ μ)
      (gaussianReal 0
        (4 * Var[fun z ↦ ∫ w, Real.sign ((z.1 - w.1) * (z.2 - w.2)) ∂P; P]).toNNReal) := by
  sorry

/-- **4.2** Spearman's rho under independence: `√n r_s ⇝ N(0, 1)`. -/
theorem tendstoInDistribution_spearmanRho (P₁ P₂ : Measure ℝ) [IsProbabilityMeasure P₁]
    [IsProbabilityMeasure P₂] [NullSingletonClass P₁] [NullSingletonClass P₂] (Z : ℕ → Ω → ℝ × ℝ)
    (hZ : IsIndependentIdenticallyDistributed μ Z (P₁.prod P₂)) :
    TendstoInDistribution (fun (n : ℕ) ω ↦ √(n : ℝ) * spearmanRho (firstN Z n ω)) atTop id
      (fun _ ↦ μ) (gaussianReal 0 1) := by
  sorry

/-- **4.2** Tests of independence: for a law with continuous marginals, the tests rejecting when
`(3/2) √n |τ̂| > z_{α/2}`, respectively `√n |r_s| > z_{α/2}`, have rejection probability tending
to `α` under independence, and to `1` when `τ ≠ 0`, respectively when
`12 E[F_X(X) F_Y(Y)] - 3 ≠ 0`. -/
theorem tendsto_measure_independenceTest (P : Measure (ℝ × ℝ)) [IsProbabilityMeasure P]
    (hP₁ : Continuous (cdf (P.map Prod.fst))) (hP₂ : Continuous (cdf (P.map Prod.snd)))
    (Z : ℕ → Ω → ℝ × ℝ) (hZ : IsIndependentIdenticallyDistributed μ Z P) {α z : ℝ}
    (hα : α ∈ Ioo 0 1) (hz : cdf (gaussianReal 0 1) z = 1 - α / 2) :
    (P = (P.map Prod.fst).prod (P.map Prod.snd) →
      Tendsto (fun n : ℕ ↦ μ.real {ω | z < 3 / 2 * √(n : ℝ) * |kendallTau (firstN Z n ω)|})
        atTop (𝓝 α) ∧
      Tendsto (fun n : ℕ ↦ μ.real {ω | z < √(n : ℝ) * |spearmanRho (firstN Z n ω)|})
        atTop (𝓝 α)) ∧
    (∫ p, Real.sign ((p.1.1 - p.2.1) * (p.1.2 - p.2.2)) ∂(P.prod P) ≠ 0 →
      Tendsto (fun n : ℕ ↦ μ.real {ω | z < 3 / 2 * √(n : ℝ) * |kendallTau (firstN Z n ω)|})
        atTop (𝓝 1)) ∧
    (12 * (∫ p, cdf (P.map Prod.fst) p.1 * cdf (P.map Prod.snd) p.2 ∂P) - 3 ≠ 0 →
      Tendsto (fun n : ℕ ↦ μ.real {ω | z < √(n : ℝ) * |spearmanRho (firstN Z n ω)|})
        atTop (𝓝 1)) := by
  sorry

/-- **4.2** The Wilcoxon signed-rank limit under a symmetric atomless law, standardized by the
null mean and variance of 3.3, and in van der Vaart's form
`n^{-3/2} ∑ i, absRank x i · sign (x i) ⇝ N(0, 1/3)`. -/
theorem tendstoInDistribution_signedRankStatistic (P : Measure ℝ) [IsProbabilityMeasure P]
    [NullSingletonClass P] (hsymm : P.map Neg.neg = P) :
    TendstoInDistribution (fun (n : ℕ) (x : Fin n → ℝ) ↦
        (signedRankStatistic x - n * (n + 1) / 4) / √(n * (n + 1) * (2 * n + 1) / 24))
      atTop id (fun n ↦ Measure.pi fun _ : Fin n ↦ P) (gaussianReal 0 1) ∧
    TendstoInDistribution (fun (n : ℕ) (x : Fin n → ℝ) ↦
        (n : ℝ) ^ (-(3 : ℝ) / 2) * ∑ i, (absRank x i : ℝ) * Real.sign (x i))
      atTop id (fun n ↦ Measure.pi fun _ : Fin n ↦ P) (gaussianReal 0 (1 / 3 : ℝ≥0)) := by
  sorry

/-- **4.2** The Mann–Whitney limit as both sample sizes tend to infinity, under a common
atomless law. -/
theorem tendstoInDistribution_mannWhitney (P : Measure ℝ) [IsProbabilityMeasure P]
    [NullSingletonClass P] (m n : ℕ → ℕ) (hm : Tendsto m atTop atTop)
    (hn : Tendsto n atTop atTop) :
    TendstoInDistribution (fun (k : ℕ) (z : (Fin (m k) → ℝ) × (Fin (n k) → ℝ)) ↦
        (mannWhitney z.1 z.2 - m k * n k / 2) / √(m k * n k * (m k + n k + 1) / 12))
      atTop id
      (fun k ↦ (Measure.pi fun _ : Fin (m k) ↦ P).prod (Measure.pi fun _ : Fin (n k) ↦ P))
      (gaussianReal 0 1) := by
  sorry

/-- **4.2** The Kruskal–Wallis limit: for `k` groups whose relative sizes tend to `lam j > 0`,
`H ⇝ χ²_{k-1}` under a common atomless law. For `k = 1` the statistic vanishes on samples with
distinct entries and `χ²_0` is the Dirac law at `0`. The probability-measure instance of the
limit law is a hypothesis, discharged by Tau Ceti's `isProbabilityMeasure_chiSquaredMeasure`. -/
theorem tendstoInDistribution_kruskalWallis {k : ℕ}
    [IsProbabilityMeasure (TauCeti.Probability.chiSquaredMeasure ((k - 1 : ℕ) : ℝ))]
    (P : Measure ℝ) [IsProbabilityMeasure P] [NullSingletonClass P]
    (g : (N : ℕ) → Fin N → Fin k) (lam : Fin k → ℝ) (hlam : ∀ j, 0 < lam j)
    (hg : ∀ j, Tendsto (fun N ↦ ((Finset.univ.filter fun i ↦ g N i = j).card : ℝ) / N) atTop
      (𝓝 (lam j))) :
    TendstoInDistribution (fun (N : ℕ) (x : Fin N → ℝ) ↦ kruskalWallis (g N) x) atTop id
      (fun N ↦ Measure.pi fun _ : Fin N ↦ P)
      (TauCeti.Probability.chiSquaredMeasure ((k - 1 : ℕ) : ℝ)) := by
  sorry

/-- **4.3** The two-sample power envelope: in the shift model `Q μ` of a density `f`, absolutely
continuous with finite Fisher information `I_f = ∫ f'² / f`, every sequence of tests of level `α`
for `ν = μ` has power at most `1 - Φ (z_α - h √(lam (1 - lam) I_f))` at the alternatives with the
first `m N` observations from `Q (μ₀ + g/√N)` and the others from `Q (μ₀ + (g + h)/√N)`. The tests
take values in `[0, 1]`, so the real `limsup` is the true one. -/
theorem limsup_power_le_envelope (f f' : ℝ → ℝ) (hf0 : ∀ x, 0 ≤ f x) (hf1 : ∫ x, f x = 1)
    (hac : ∀ a b, AbsolutelyContinuousOnInterval f a b) (hf' : ∀ᵐ x, HasDerivAt f (f' x) x)
    (hI : ∫⁻ x, ENNReal.ofReal (f' x ^ 2 / f x) < ∞) (Q : ℝ → Measure ℝ)
    (hQ : ∀ μ, Q μ = volume.withDensity fun y ↦ ENNReal.ofReal (f (y - μ))) (m : ℕ → ℕ)
    {lam : ℝ} (hlam : lam ∈ Ioo 0 1) (hm : Tendsto (fun N ↦ (m N : ℝ) / N) atTop (𝓝 lam))
    (μ₀ g h : ℝ) (hh : 0 < h) {α z : ℝ} (hα : α ∈ Ioo 0 1)
    (hz : cdf (gaussianReal 0 1) z = 1 - α) (φ : (N : ℕ) → (Fin N → ℝ) → ℝ)
    (hφ : ∀ N, IsStatisticalTest (φ N))
    (hlevel : ∀ N (μ : ℝ), ∫ x, φ N x ∂(Measure.pi fun _ : Fin N ↦ Q μ) ≤ α) :
    limsup (fun N : ℕ ↦ ∫ x, φ N x ∂(Measure.pi fun i : Fin N ↦
        Q (μ₀ + (if (i : ℕ) < m N then g else g + h) / √(N : ℝ)))) atTop ≤
      1 - cdf (gaussianReal 0 1) (z - h * √(lam * (1 - lam) * ∫ x, f' x ^ 2 / f x)) := by
  sorry

/-- **4.3** The asymptotic power of the two-sample rank test with exact scores generated by `φ`
and coefficients `c N i = 1` on the second sample, which rejects when the statistic standardized
by its null mean and variance exceeds `z_α`, at the alternatives of `limsup_power_le_envelope`. The
null moments are computed under `Q 0`; rank statistics are distribution-free. `φf` is the locally
most powerful score `-(f'/f) ∘ F⁻¹`, with `∫₀¹ φf = 0` and `∫₀¹ φf² = I_f`, so the scores
`φ = φf` attain the envelope. -/
theorem tendsto_power_rankTest (f f' : ℝ → ℝ) (hf0 : ∀ x, 0 ≤ f x) (hf1 : ∫ x, f x = 1)
    (hac : ∀ a b, AbsolutelyContinuousOnInterval f a b) (hf' : ∀ᵐ x, HasDerivAt f (f' x) x)
    (hI : ∫⁻ x, ENNReal.ofReal (f' x ^ 2 / f x) < ∞) (Q : ℝ → Measure ℝ)
    (hQ : ∀ μ, Q μ = volume.withDensity fun y ↦ ENNReal.ofReal (f (y - μ))) (φf : ℝ → ℝ)
    (hφf : ∀ u, φf u = -(f' ((Q 0).quantile u) / f ((Q 0).quantile u)))
    (φ : ℝ → ℝ) (hφ : MemLp φ 2 (volume.restrict (Ioo 0 1)))
    (hφc : ∀ a : ℝ, ¬ φ =ᵐ[volume.restrict (Ioo 0 1)] fun _ ↦ a) (m : ℕ → ℕ) {lam : ℝ}
    (hlam : lam ∈ Ioo 0 1) (hm : Tendsto (fun N ↦ (m N : ℝ) / N) atTop (𝓝 lam))
    (c : (N : ℕ) → Fin N → ℝ) (hc : ∀ N i, c N i = if (i : ℕ) < m N then 0 else 1)
    (μ₀ g h : ℝ) (hh : 0 < h) {α z : ℝ} (hα : α ∈ Ioo 0 1)
    (hz : cdf (gaussianReal 0 1) z = 1 - α) :
    (∫ u in (0 : ℝ)..1, φf u = 0 ∧ ∫ u in (0 : ℝ)..1, φf u ^ 2 = ∫ x, f' x ^ 2 / f x) ∧
    Tendsto (fun N : ℕ ↦ (Measure.pi fun i : Fin N ↦
        Q (μ₀ + (if (i : ℕ) < m N then g else g + h) / √(N : ℝ))).real
        {x | z < (linearRankStatistic (c N) (exactScore φ N) x -
            ∫ y, linearRankStatistic (c N) (exactScore φ N) y ∂(Measure.pi fun _ ↦ Q 0)) /
          √(Var[linearRankStatistic (c N) (exactScore φ N); Measure.pi fun _ ↦ Q 0])}) atTop
      (𝓝 (1 - cdf (gaussianReal 0 1) (z - h * √(lam * (1 - lam)) *
        (∫ u in (0 : ℝ)..1, φ u * φf u) /
          √(∫ u in (0 : ℝ)..1, (φ u - ∫ v in (0 : ℝ)..1, φ v) ^ 2)))) := by
  sorry

/-- **4.3** The one-sample signed-rank test with exact scores generated by
`φp u = -(f'/f)((F⁺)⁻¹ u)`, `(F⁺)⁻¹ u = F⁻¹ ((1 + u)/2)`, for a symmetric `f` with `I_f < ∞`,
standardized by its null standard deviation and rejecting above `z_α`: at `θ = h/√n` its power
tends to `1 - Φ (z_α - h √I_f)`, the envelope. The case `h = 0` is the asymptotic level `α`. -/
theorem tendsto_power_signedRankTest (f f' : ℝ → ℝ) (hf0 : ∀ x, 0 ≤ f x) (hf1 : ∫ x, f x = 1)
    (hac : ∀ a b, AbsolutelyContinuousOnInterval f a b) (hf' : ∀ᵐ x, HasDerivAt f (f' x) x)
    (hI : ∫⁻ x, ENNReal.ofReal (f' x ^ 2 / f x) < ∞) (hsymm : ∀ x, f (-x) = f x)
    (Q : ℝ → Measure ℝ) (hQ : ∀ μ, Q μ = volume.withDensity fun y ↦ ENNReal.ofReal (f (y - μ)))
    (φp : ℝ → ℝ) (hφp : ∀ u, φp u = -(f' ((Q 0).quantile ((1 + u) / 2)) /
      f ((Q 0).quantile ((1 + u) / 2)))) (h : ℝ) {α z : ℝ} (hα : α ∈ Ioo 0 1)
    (hz : cdf (gaussianReal 0 1) z = 1 - α) :
    Tendsto (fun n : ℕ ↦ (Measure.pi fun _ : Fin n ↦ Q (h / √(n : ℝ))).real
        {x | z < (∑ i, Real.sign (x i) * exactScore φp n (absRank x i)) /
          √(Var[fun y ↦ ∑ i, Real.sign (y i) * exactScore φp n (absRank y i);
            Measure.pi fun _ : Fin n ↦ Q 0])}) atTop
      (𝓝 (1 - cdf (gaussianReal 0 1) (z - h * √(∫ x, f' x ^ 2 / f x)))) := by
  sorry

/-- **4.4** The efficacy of the normal-scores test: for a density `f`, absolutely continuous
with `I_f < ∞`, and the locally most powerful score `φf = -(f'/f) ∘ F⁻¹`,
`⟨Φ⁻¹, φf⟩ = ∫ f² / φ_N (q)` with `q = Φ⁻¹ ∘ F`, `‖Φ⁻¹‖ = 1`, `∫₀¹ Φ⁻¹ = 0`, and the integral is
at most `√I_f`. It is taken in `ℝ≥0∞`; the bound shows that it is finite. -/
theorem efficacy_normalScores (f f' : ℝ → ℝ) (hf : Measurable f) (hf0 : ∀ x, 0 ≤ f x)
    (hf1 : ∫ x, f x = 1) (hac : ∀ a b, AbsolutelyContinuousOnInterval f a b)
    (hf' : ∀ᵐ x, HasDerivAt f (f' x) x) (hI : ∫⁻ x, ENNReal.ofReal (f' x ^ 2 / f x) < ∞)
    (φf : ℝ → ℝ) (hφf : ∀ u,
      φf u = -(f' ((volume.withDensity fun y ↦ ENNReal.ofReal (f y)).quantile u) /
        f ((volume.withDensity fun y ↦ ENNReal.ofReal (f y)).quantile u)))
    (q : ℝ → ℝ) (hq : ∀ᵐ x, 0 < f x →
      cdf (gaussianReal 0 1) (q x) = cdf (volume.withDensity fun y ↦ ENNReal.ofReal (f y)) x) :
    ∫ u in (0 : ℝ)..1, (gaussianReal 0 1).quantile u * φf u =
        (∫⁻ x, ENNReal.ofReal (f x ^ 2 / gaussianPDFReal 0 1 (q x))).toReal ∧
      ∫ u in (0 : ℝ)..1, (gaussianReal 0 1).quantile u ^ 2 = 1 ∧
      ∫ u in (0 : ℝ)..1, (gaussianReal 0 1).quantile u = 0 ∧
      ∫⁻ x, ENNReal.ofReal (f x ^ 2 / gaussianPDFReal 0 1 (q x)) ≤
        ENNReal.ofReal √(∫ x, f' x ^ 2 / f x) := by
  sorry

/-- **4.4** Gaussian integration by parts for a nondecreasing `g` with `E g(Z)² < ∞`:
`Cov(g(Z), Z) = ∫ φ_N dg`, the integral of the standard normal density against the Stieltjes
measure of the right-continuous version of `g`; that integral is finite. -/
theorem covariance_gaussianReal_of_monotone (g : ℝ → ℝ) (hg : Monotone g)
    (hg2 : MemLp g 2 (gaussianReal 0 1)) :
    ∫⁻ x, ENNReal.ofReal (gaussianPDFReal 0 1 x) ∂hg.stieltjesFunction.measure < ∞ ∧
      cov[g, id; gaussianReal 0 1] =
        (∫⁻ x, ENNReal.ofReal (gaussianPDFReal 0 1 x) ∂hg.stieltjesFunction.measure).toReal := by
  sorry

/-- **4.4** The Chernoff–Savage inequality: the efficiency of the normal-scores test relative
to the `t` test is at least `1`. Here `q x = Φ⁻¹ (F x)`. The efficacy integral is an extended
integral: it may be infinite, and a Bochner integral would then be the junk value `0`. -/
theorem chernoffSavage (f : ℝ → ℝ) (hf : Measurable f) (hf0 : ∀ x, 0 ≤ f x)
    (hf1 : ∫ x, f x = 1) (hvar : Integrable fun x ↦ x ^ 2 * f x) (q : ℝ → ℝ)
    (hq : ∀ᵐ x, 0 < f x →
      cdf (gaussianReal 0 1) (q x) = cdf (volume.withDensity fun y ↦ ENNReal.ofReal (f y)) x) :
    1 ≤ ENNReal.ofReal ((∫ x, x ^ 2 * f x) - (∫ x, x * f x) ^ 2) *
      (∫⁻ x, ENNReal.ofReal (f x ^ 2 / gaussianPDFReal 0 1 (q x))) ^ 2 := by
  sorry

/-- **4.4** Equality in the Chernoff–Savage inequality holds exactly for the normal
densities. -/
theorem chernoffSavage_eq_one_iff (f : ℝ → ℝ) (hf : Measurable f) (hf0 : ∀ x, 0 ≤ f x)
    (hf1 : ∫ x, f x = 1) (hvar : Integrable fun x ↦ x ^ 2 * f x) (q : ℝ → ℝ)
    (hq : ∀ᵐ x, 0 < f x →
      cdf (gaussianReal 0 1) (q x) = cdf (volume.withDensity fun y ↦ ENNReal.ofReal (f y)) x) :
    ENNReal.ofReal ((∫ x, x ^ 2 * f x) - (∫ x, x * f x) ^ 2) *
        (∫⁻ x, ENNReal.ofReal (f x ^ 2 / gaussianPDFReal 0 1 (q x))) ^ 2 = 1 ↔
      ∃ m : ℝ, ∃ v : ℝ≥0, v ≠ 0 ∧ f =ᵐ[volume] gaussianPDFReal m v := by
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

/-- Local copy of `MathematicalStatisticsAsymptotic` 9.1: `IF` is the influence function of the
functional `T` at `F` when, for every `x`, `ε ↦ T ((1 - ε) F + ε δₓ)` has right derivative
`IF x` at `0`. -/
def HasInfluenceFunction (T : Measure ℝ → ℝ) (F : Measure ℝ) (IF : ℝ → ℝ) : Prop :=
  ∀ x, HasDerivWithinAt (fun ε : ℝ ↦
    T (ENNReal.ofReal (1 - ε) • F + ENNReal.ofReal ε • Measure.dirac x)) (IF x) (Set.Ici 0) 0

/-- **4.5** The Hodges–Lehmann functional: the lower median of the law of `(X₁ + X₂)/2` for
independent `X₁`, `X₂` with law `F`. That law has the distribution function
`t ↦ ∫ F((-∞, 2t - y]) dF(y)`, through which it is written here, so that the functional is
defined on every measure; for a probability measure the set is nonempty and bounded below, and
the infimum is the true lower median. -/
def hodgesLehmannFunctional (F : Measure ℝ) : ℝ :=
  sInf {t | 1 / 2 ≤ ∫ y, F.real (Iic (2 * t - y)) ∂F}

/-- **4.5** The influence function of the Hodges–Lehmann functional at the law with density
`f (x - θ)`, `f` symmetric with `∫ f² < ∞`, is `x ↦ (F(x - θ) - 1/2) / ∫ f²`, `F` the
distribution function of `f`; its variance `(1/12)/(∫ f²)²` is the limit variance of
`tendstoInDistribution_hodgesLehmann`. -/
theorem hasInfluenceFunction_hodgesLehmannFunctional (f : ℝ → ℝ) (hf : Measurable f)
    (hf0 : ∀ x, 0 ≤ f x) (hf1 : ∫ x, f x = 1) (hsymm : ∀ x, f (-x) = f x)
    (hf2 : Integrable fun x ↦ f x ^ 2) (θ : ℝ) :
    HasInfluenceFunction hodgesLehmannFunctional
        (volume.withDensity fun x ↦ ENNReal.ofReal (f (x - θ)))
        (fun x ↦ (cdf (volume.withDensity fun y ↦ ENNReal.ofReal (f y)) (x - θ) - 1 / 2) /
          ∫ y, f y ^ 2) ∧
      Var[fun x ↦ (cdf (volume.withDensity fun y ↦ ENNReal.ofReal (f y)) (x - θ) - 1 / 2) /
          ∫ y, f y ^ 2; volume.withDensity fun x ↦ ENNReal.ofReal (f (x - θ))] =
        1 / 12 / (∫ y, f y ^ 2) ^ 2 := by
  sorry

/-- **4.6** Kolmogorov's theorem: `√n Dₙ` converges in law to the Kolmogorov distribution. -/
theorem tendstoInDistribution_sqrt_mul_ksStatistic (P : Measure ℝ) [IsProbabilityMeasure P]
    (hK : IsProbabilityMeasure kolmogorovMeasure)
    (hP : Continuous (cdf P)) (X : ℕ → Ω → ℝ) (hX : IsIndependentIdenticallyDistributed μ X P) :
    TendstoInDistribution (fun (n : ℕ) ω ↦ √(n : ℝ) * ksStatistic P (firstN X n ω)) atTop id
      (fun _ ↦ μ)
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
    (hC : IsProbabilityMeasure cvmLimitLaw)
    (hP : Continuous (cdf P)) (X : ℕ → Ω → ℝ) (hX : IsIndependentIdenticallyDistributed μ X P) :
    TendstoInDistribution (fun (n : ℕ) ω ↦ cvmStatistic P (firstN X n ω)) atTop id (fun _ ↦ μ)
      cvmLimitLaw := by
  sorry

/-- **4.7** The two-sample Kolmogorov–Smirnov limit under a common continuous law. -/
theorem tendstoInDistribution_twoSampleKS (P : Measure ℝ) [IsProbabilityMeasure P]
    (hK : IsProbabilityMeasure kolmogorovMeasure)
    (hP : Continuous (cdf P)) (m n : ℕ → ℕ) (hm : Tendsto m atTop atTop)
    (hn : Tendsto n atTop atTop) (X Y : ℕ → Ω → ℝ) (hX : IsIndependentIdenticallyDistributed μ X P)
    (hY : IsIndependentIdenticallyDistributed μ Y P)
    (hXY : IndepFun (fun ω i ↦ X i ω) (fun ω i ↦ Y i ω) μ) :
    TendstoInDistribution (fun (k : ℕ) ω ↦ √((m k * n k : ℝ) / (m k + n k)) *
        ksTwoSample (firstN X (m k) ω) (firstN Y (n k) ω)) atTop id (fun _ ↦ μ)
      kolmogorovMeasure := by
  sorry

/-- **4.7** Consistency of the two-sample Kolmogorov–Smirnov test: if the two laws differ,
`sup_t |F(t) - G(t)| > 0`, `D_{m,n}` tends to it almost surely, and
`√(mn/(m + n)) D_{m,n} → ∞` in probability. The supremum over `ℚ` is the supremum over `ℝ`, the
distribution functions being right-continuous. -/
theorem tendsto_ksTwoSample_of_ne (P Q : Measure ℝ) [IsProbabilityMeasure P]
    [IsProbabilityMeasure Q] (hPQ : P ≠ Q) (m n : ℕ → ℕ) (hm : Tendsto m atTop atTop)
    (hn : Tendsto n atTop atTop) (X Y : ℕ → Ω → ℝ) (hX : IsIndependentIdenticallyDistributed μ X P)
    (hY : IsIndependentIdenticallyDistributed μ Y Q) :
    0 < ⨆ t : ℚ, |cdf P t - cdf Q t| ∧
      (∀ᵐ ω ∂μ, Tendsto (fun k ↦ ksTwoSample (firstN X (m k) ω) (firstN Y (n k) ω)) atTop
        (𝓝 (⨆ t : ℚ, |cdf P t - cdf Q t|))) ∧
      ∀ c : ℝ, Tendsto (fun k ↦ μ.real {ω | c < √((m k * n k : ℝ) / (m k + n k)) *
        ksTwoSample (firstN X (m k) ω) (firstN Y (n k) ω)}) atTop (𝓝 1) := by
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

/-- **5.1** The Legendre polynomial `P_m` on `[-1, 1]`, `P_m u = P̃_m ((1 - u)/2)` for Mathlib's
shifted Legendre polynomial `P̃_m`, which is `P_m (1 - 2x)`; so `P_m 1 = 1`. -/
def legendreP (m : ℕ) (u : ℝ) : ℝ :=
  Polynomial.aeval ((1 - u) / 2) (Polynomial.shiftedLegendre m)

/-- **5.1** The Legendre kernel `K_ℓ u = ∑_{m ≤ ℓ} φ_m(0) φ_m(u) 1_{|u| ≤ 1}`, with
`φ_m = √((2m + 1)/2) P_m` the orthonormal Legendre polynomials on `[-1, 1]`. -/
def legendreKernel (ℓ : ℕ) (u : ℝ) : ℝ :=
  if |u| ≤ 1 then
    ∑ m ∈ Finset.range (ℓ + 1), (2 * (m : ℝ) + 1) / 2 * legendreP m 0 * legendreP m u
  else 0

/-- **5.1** For `ℓ ≥ 1` the Legendre kernel is a bounded kernel of order `ℓ`. -/
theorem isKernelOfOrder_legendreKernel {ℓ : ℕ} (hℓ : 1 ≤ ℓ) :
    IsKernelOfOrder (legendreKernel ℓ) ℓ ∧ ∃ C, ∀ u, |legendreKernel ℓ u| ≤ C := by
  sorry

/-- The law with density `p` with respect to Lebesgue measure. -/
def densityLaw {E : Type*} [MeasurableSpace E] (ν : Measure E) (p : E → ℝ) : Measure E :=
  ν.withDensity fun x ↦ ENNReal.ofReal (p x)

/-- **5.1** Bias and variance at a point: the densities of `holderDensityClass β L` are
bounded by a common `p_max`; for `p` in the class, a kernel `K` of order `ℓ = ⌈β⌉ - 1` with
`∫ |u|^β |K| < ∞` and `∫ K² < ∞`, and any bound `p ≤ pmax`, every `x₀`, `h > 0` and `n ≥ 1`,
`|E p̂(x₀) - p(x₀)| ≤ (L/ℓ!) ∫ |u|^β |K| · h^β` and `Var p̂(x₀) ≤ pmax ∫ K² / (n h)`. -/
theorem kde_bias_variance_le (β : ℝ) (hβ : 0 < β) (L : ℝ≥0) (K : ℝ → ℝ)
    (hK : IsKernelOfOrder K (⌈β⌉₊ - 1)) (hK2 : Integrable fun u ↦ K u ^ 2)
    (hKβ : Integrable fun u ↦ |u| ^ β * |K u|) :
    (∃ pmax : ℝ, ∀ p ∈ holderDensityClass β L, ∀ x, p x ≤ pmax) ∧
    ∀ p ∈ holderDensityClass β L, ∀ pmax : ℝ, (∀ x, p x ≤ pmax) →
      ∀ x₀ h : ℝ, 0 < h → ∀ n : ℕ, 1 ≤ n →
        |(∫ x, kernelDensityEstimator K h x x₀
            ∂(Measure.pi fun _ : Fin n ↦ densityLaw volume p)) - p x₀| ≤
          L / ((⌈β⌉₊ - 1).factorial : ℝ) * (∫ u, |u| ^ β * |K u|) * h ^ β ∧
        Var[fun x ↦ kernelDensityEstimator K h x x₀;
            Measure.pi fun _ : Fin n ↦ densityLaw volume p] ≤
          pmax * (∫ u, K u ^ 2) / (n * h) := by
  sorry

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

/-- **5.9** The Sobolev density rate over `𝓕_{m,M}`, the densities with `m` continuous
derivatives and `∫ (f^{(m)})² ≤ M`: for all Markov kernels with values in `L²(ℝ)`, with its
Borel σ-algebra, the maximal integrated squared risk is at least `D n^{-2m/(2m+1)}`, and some
estimator attains the rate. The risks are extended integrals. -/
theorem sobolev_density_minimax_rate (m : ℕ) (hm : 1 ≤ m) {M : ℝ} (hM : 0 < M)
    (mL : MeasurableSpace (Lp ℝ 2 (volume : Measure ℝ)))
    (hL : BorelSpace (Lp ℝ 2 (volume : Measure ℝ))) :
    (∃ D > 0, ∀ n : ℕ, 1 ≤ n → ∀ κ : Kernel (Fin n → ℝ) (Lp ℝ 2 (volume : Measure ℝ)),
      IsMarkovKernel κ →
      ENNReal.ofReal (D * (n : ℝ) ^ (-2 * (m : ℝ) / (2 * m + 1))) ≤
        ⨆ f ∈ {f : ℝ → ℝ | ContDiff ℝ m f ∧ (∀ x, 0 ≤ f x) ∧ ∫ x, f x = 1 ∧
            ∫⁻ x, ENNReal.ofReal (iteratedDeriv m f x ^ 2) ≤ ENNReal.ofReal M},
          ∫⁻ q, (∫⁻ t, ENNReal.ofReal ((q t - f t) ^ 2))
            ∂(κ ∘ₘ Measure.pi fun _ : Fin n ↦ densityLaw volume f)) ∧
    ∃ C, ∀ n : ℕ, 1 ≤ n → ∃ κ : Kernel (Fin n → ℝ) (Lp ℝ 2 (volume : Measure ℝ)),
      IsMarkovKernel κ ∧ ∀ f ∈ {f : ℝ → ℝ | ContDiff ℝ m f ∧ (∀ x, 0 ≤ f x) ∧ ∫ x, f x = 1 ∧
            ∫⁻ x, ENNReal.ofReal (iteratedDeriv m f x ^ 2) ≤ ENNReal.ofReal M},
        ∫⁻ q, (∫⁻ t, ENNReal.ofReal ((q t - f t) ^ 2))
            ∂(κ ∘ₘ Measure.pi fun _ : Fin n ↦ densityLaw volume f) ≤
          ENNReal.ofReal (C * (n : ℝ) ^ (-2 * (m : ℝ) / (2 * m + 1))) := by
  sorry

/-- **5.9** The minimax rates of Hölder regression `Y i = f ((i + 1)/n) + ξ i`, `ξ i` i.i.d.
`N(0, σ²)`, over `holderClass β L`: `n^{-2β/(2β+1)}` for the squared `L²[0, 1]` loss and
`(n / log n)^{-2β/(2β+1)}` for the squared sup-norm loss, each a lower bound for all Markov
kernels with values in `L²[0, 1]`, respectively `L^∞[0, 1]`, with their Borel σ-algebras, and an
upper bound attained by some estimator, for all large `n`. The sup norm is the essential supremum
on `[0, 1]` (`eLpNorm` with `p = ∞`). The risks are extended integrals. -/
theorem holder_regression_minimax_rate {β : ℝ} (hβ : 0 < β) {L : ℝ≥0} (hL : 0 < L) {σ : ℝ}
    (hσ : 0 < σ) (mL2 : MeasurableSpace (Lp ℝ 2 (volume.restrict (Icc (0 : ℝ) 1))))
    (hL2 : BorelSpace (Lp ℝ 2 (volume.restrict (Icc (0 : ℝ) 1))))
    (mLi : MeasurableSpace (Lp ℝ ∞ (volume.restrict (Icc (0 : ℝ) 1))))
    (hLi : BorelSpace (Lp ℝ ∞ (volume.restrict (Icc (0 : ℝ) 1)))) :
    (∃ c > 0, ∀ᶠ n : ℕ in atTop,
      ∀ κ : Kernel (Fin n → ℝ) (Lp ℝ 2 (volume.restrict (Icc (0 : ℝ) 1))), IsMarkovKernel κ →
      ENNReal.ofReal (c * (n : ℝ) ^ (-2 * β / (2 * β + 1))) ≤
        ⨆ f ∈ holderClass β L, ∫⁻ q, (∫⁻ t in Icc (0 : ℝ) 1, ENNReal.ofReal ((q t - f t) ^ 2))
          ∂(κ ∘ₘ Measure.pi fun i : Fin n ↦ gaussianReal (f (((i : ℝ) + 1) / n)) (σ ^ 2).toNNReal))
      ∧
    (∃ C, ∀ᶠ n : ℕ in atTop,
      ∃ κ : Kernel (Fin n → ℝ) (Lp ℝ 2 (volume.restrict (Icc (0 : ℝ) 1))), IsMarkovKernel κ ∧
      ∀ f ∈ holderClass β L, ∫⁻ q, (∫⁻ t in Icc (0 : ℝ) 1, ENNReal.ofReal ((q t - f t) ^ 2))
          ∂(κ ∘ₘ Measure.pi fun i : Fin n ↦ gaussianReal (f (((i : ℝ) + 1) / n)) (σ ^ 2).toNNReal)
        ≤ ENNReal.ofReal (C * (n : ℝ) ^ (-2 * β / (2 * β + 1)))) ∧
    (∃ c > 0, ∀ᶠ n : ℕ in atTop,
      ∀ κ : Kernel (Fin n → ℝ) (Lp ℝ ∞ (volume.restrict (Icc (0 : ℝ) 1))), IsMarkovKernel κ →
      ENNReal.ofReal (c * ((n : ℝ) / Real.log n) ^ (-2 * β / (2 * β + 1))) ≤
        ⨆ f ∈ holderClass β L,
          ∫⁻ q, eLpNorm (fun t ↦ q t - f t) ∞ (volume.restrict (Icc (0 : ℝ) 1)) ^ 2
          ∂(κ ∘ₘ Measure.pi fun i : Fin n ↦ gaussianReal (f (((i : ℝ) + 1) / n)) (σ ^ 2).toNNReal))
      ∧
    ∃ C, ∀ᶠ n : ℕ in atTop,
      ∃ κ : Kernel (Fin n → ℝ) (Lp ℝ ∞ (volume.restrict (Icc (0 : ℝ) 1))), IsMarkovKernel κ ∧
      ∀ f ∈ holderClass β L,
        ∫⁻ q, eLpNorm (fun t ↦ q t - f t) ∞ (volume.restrict (Icc (0 : ℝ) 1)) ^ 2
          ∂(κ ∘ₘ Measure.pi fun i : Fin n ↦ gaussianReal (f (((i : ℝ) + 1) / n)) (σ ^ 2).toNNReal)
        ≤ ENNReal.ofReal (C * ((n : ℝ) / Real.log n) ^ (-2 * β / (2 * β + 1))) := by
  sorry

/-- **5.9** The integrated minimax lower bound over a Hölder density class, for all density
estimators that are Markov kernels with values in `L²(ℝ)`, with its Borel σ-algebra. The risks
are extended integrals. -/
theorem kde_minimax_lower_integrated (β : ℝ) (hβ : 0 < β) (L : ℝ≥0) (hL : 0 < L)
    (mL : MeasurableSpace (Lp ℝ 2 (volume : Measure ℝ)))
    (hLB : BorelSpace (Lp ℝ 2 (volume : Measure ℝ))) :
    ∃ c > 0, ∀ᶠ n : ℕ in atTop, ∀ κ : Kernel (Fin n → ℝ) (Lp ℝ 2 (volume : Measure ℝ)),
      IsMarkovKernel κ →
      ENNReal.ofReal (c * (n : ℝ) ^ (-2 * β / (2 * β + 1))) ≤
        ⨆ p : holderDensityClass β L, ∫⁻ q, (∫⁻ t, ENNReal.ofReal ((q t - p.1 t) ^ 2))
          ∂(κ ∘ₘ Measure.pi fun _ : Fin n ↦ densityLaw volume p.1) := by
  sorry

/-- **5.2** The exact mean integrated squared error of the kernel density estimator. -/
theorem integral_mise_eq (K : ℝ → ℝ) (hK : Measurable K) (hK0 : ∀ u, 0 ≤ K u)
    (hK1 : ∫ u, K u = 1) (hK2 : Integrable fun u ↦ K u ^ 2) (f : ℝ → ℝ) (hf : Measurable f)
    (hf0 : ∀ x, 0 ≤ f x) (hf1 : ∫ x, f x = 1) (hf2 : Integrable fun x ↦ f x ^ 2)
    {h : ℝ} (hh : 0 < h) {n : ℕ} (hn : 1 ≤ n) :
    ∫ x, (∫ t, (kernelDensityEstimator K h x t - f t) ^ 2)
        ∂(Measure.pi fun _ : Fin n ↦ densityLaw volume f) =
      (∫ t, ((∫ y, h⁻¹ * K ((t - y) / h) * f y) - f t) ^ 2) +
        (∫ u, K u ^ 2) / (n * h) - (n : ℝ)⁻¹ * ∫ t, (∫ y, h⁻¹ * K ((t - y) / h) * f y) ^ 2 := by
  sorry

/-- **5.2** The order of the risk: for `f` twice continuously differentiable with
`∫ (f'')² < ∞`, `E ∫ (f̂_h - f)² ≤ C_f (1/(n h) + h⁴)` for small `h > 0` and every `n ≥ 1`. The
risk is an extended integral. -/
theorem mise_le_of_contDiff (K : ℝ → ℝ) (hK : Measurable K) (hK0 : ∀ u, 0 ≤ K u)
    (hKb : ∃ C, ∀ u, K u ≤ C) (hKs : ∀ u, K (-u) = K u) (hK1 : ∫ u, K u = 1)
    (hK2 : Integrable fun u ↦ u ^ 2 * K u) (f : ℝ → ℝ) (hf : ContDiff ℝ 2 f)
    (hf0 : ∀ x, 0 ≤ f x) (hf1 : ∫ x, f x = 1) (hf'' : MemLp (iteratedDeriv 2 f) 2) :
    ∃ C h₀ : ℝ, 0 < h₀ ∧ ∀ h, 0 < h → h < h₀ → ∀ n : ℕ, 1 ≤ n →
      ∫⁻ x, (∫⁻ t, ENNReal.ofReal ((kernelDensityEstimator K h x t - f t) ^ 2))
          ∂(Measure.pi fun _ : Fin n ↦ densityLaw volume f) ≤
        ENNReal.ofReal (C * (1 / (n * h) + h ^ 4)) := by
  sorry

/-- **5.2** The asymptotic expansion of the mean integrated squared error:
`E ∫ (f̂_h - f)² = ¼ h⁴ μ₂² ∫ (f'')² + R(K)/(n h) + o(h⁴ + 1/(n h))` as `h → 0`, `n h → ∞`. -/
theorem isLittleO_mise_sub (K : ℝ → ℝ) (hK : Measurable K) (hK0 : ∀ u, 0 ≤ K u)
    (hKb : ∃ C, ∀ u, K u ≤ C) (hKs : ∀ u, K (-u) = K u) (hK1 : ∫ u, K u = 1)
    (hK2 : Integrable fun u ↦ u ^ 2 * K u) (f : ℝ → ℝ) (hf : ContDiff ℝ 2 f)
    (hf0 : ∀ x, 0 ≤ f x) (hf1 : ∫ x, f x = 1) (hf2 : MemLp f 2)
    (hf'' : MemLp (iteratedDeriv 2 f) 2) (h : ℕ → ℝ) (hh : ∀ n, 0 < h n)
    (hh0 : Tendsto h atTop (𝓝 0)) (hnh : Tendsto (fun n ↦ n * h n) atTop atTop) :
    (fun n : ℕ ↦ (∫ x, (∫ t, (kernelDensityEstimator K (h n) x t - f t) ^ 2)
        ∂(Measure.pi fun _ : Fin n ↦ densityLaw volume f)) -
      (h n ^ 4 / 4 * (∫ u, u ^ 2 * K u) ^ 2 * (∫ x, iteratedDeriv 2 f x ^ 2) +
        (∫ u, K u ^ 2) / (n * h n))) =o[atTop] fun n ↦ h n ^ 4 + 1 / (n * h n) := by
  sorry

/-- **5.2** The optimal bandwidth: if `∫ (f'')² > 0`, the leading term
`h ↦ ¼ h⁴ A + B/(n h)`, `A = μ₂² ∫ (f'')²`, `B = R(K)`, has the unique minimizer
`h* = (B/(A n))^{1/5}` on `h > 0`, with minimum `(5/4) A^{1/5} B^{4/5} n^{-4/5}`. -/
theorem isMinOn_amise (K : ℝ → ℝ) (hK : Measurable K) (hK0 : ∀ u, 0 ≤ K u)
    (hK1 : ∫ u, K u = 1) (hK2 : Integrable fun u ↦ K u ^ 2)
    (hKμ : Integrable fun u ↦ u ^ 2 * K u) (f : ℝ → ℝ)
    (hf'' : 0 < ∫ x, iteratedDeriv 2 f x ^ 2) {n : ℕ} (hn : 1 ≤ n) :
    let A := (∫ u, u ^ 2 * K u) ^ 2 * ∫ x, iteratedDeriv 2 f x ^ 2
    let B := ∫ u, K u ^ 2
    let amise : ℝ → ℝ := fun h ↦ h ^ 4 / 4 * A + B / (n * h)
    0 < (B / (A * n)) ^ (1 / 5 : ℝ) ∧ IsMinOn amise (Ioi 0) ((B / (A * n)) ^ (1 / 5 : ℝ)) ∧
      (∀ h ∈ Ioi (0 : ℝ), amise h = amise ((B / (A * n)) ^ (1 / 5 : ℝ)) →
        h = (B / (A * n)) ^ (1 / 5 : ℝ)) ∧
      amise ((B / (A * n)) ^ (1 / 5 : ℝ)) =
        5 / 4 * A ^ (1 / 5 : ℝ) * B ^ (4 / 5 : ℝ) * (n : ℝ) ^ (-(4 / 5 : ℝ)) := by
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

/-- **5.2** Higher order: for an integer `m ≥ 1`, `M > 0` and a kernel `K` of order `m - 1`
with `∫ |y|^m |K| < ∞` and `∫ K² < ∞`, the bandwidth `h = n^{-1/(2m+1)}` gives maximal risk at
most `C n^{-2m/(2m+1)}` over `𝓕_{m,M}`, for every `n ≥ 1`. The risk is an extended integral. -/
theorem kde_sobolev_risk_le (m : ℕ) (hm : 1 ≤ m) {M : ℝ} (hM : 0 < M) (K : ℝ → ℝ)
    (hK : IsKernelOfOrder K (m - 1)) (hKm : Integrable fun u ↦ |u| ^ m * |K u|)
    (hK2 : Integrable fun u ↦ K u ^ 2) :
    ∃ C, ∀ n : ℕ, 1 ≤ n → ∀ f ∈ {f : ℝ → ℝ | ContDiff ℝ m f ∧ (∀ x, 0 ≤ f x) ∧ ∫ x, f x = 1 ∧
        ∫⁻ x, ENNReal.ofReal (iteratedDeriv m f x ^ 2) ≤ ENNReal.ofReal M},
      ∫⁻ x, (∫⁻ t, ENNReal.ofReal
          ((kernelDensityEstimator K ((n : ℝ) ^ (-1 / (2 * (m : ℝ) + 1))) x t - f t) ^ 2))
          ∂(Measure.pi fun _ : Fin n ↦ densityLaw volume f) ≤
        ENNReal.ofReal (C * (n : ℝ) ^ (-2 * (m : ℝ) / (2 * m + 1))) := by
  sorry

/-- **5.9** Bias and coverage of the pointwise interval `f̂(x) ± z_{α/2} √(R(K) f(x)/(n h))`:
if `√(n h⁵) → κ ≥ 0`, its coverage tends to `P(|Z + b| ≤ z_{α/2}) = Φ(z - b) - Φ(-z - b)` with
`b = κ μ₂ f''(x) / (2 √(R(K) f(x)))`, which is below `1 - α` when `b ≠ 0`; `κ = 0` gives
`1 - α`. With `h = c n^{-1/5}`, `κ = c^{5/2}`. -/
theorem tendsto_coverage_kde {Ω : Type*} [MeasurableSpace Ω] (μ : Measure Ω)
    [IsProbabilityMeasure μ] (K : ℝ → ℝ) (hK : Measurable K) (hK0 : ∀ u, 0 ≤ K u)
    (hKb : ∃ C, ∀ u, K u ≤ C) (hKs : ∀ u, K (-u) = K u) (hK1 : ∫ u, K u = 1)
    (hK2 : Integrable fun u ↦ u ^ 2 * K u) (f : ℝ → ℝ) (hf : ContDiff ℝ 2 f) (hf0 : ∀ x, 0 ≤ f x)
    (hf1 : ∫ x, f x = 1) (hf2 : MemLp f 2) (hf''2 : MemLp (iteratedDeriv 2 f) 2)
    (hf''b : ∃ C, ∀ x, |iteratedDeriv 2 f x| ≤ C) (x : ℝ) (hfx : 0 < f x) (h : ℕ → ℝ)
    (hh : ∀ n, 0 < h n) (hh0 : Tendsto h atTop (𝓝 0))
    (hnh : Tendsto (fun n ↦ n * h n) atTop atTop) {κ : ℝ} (hκ : 0 ≤ κ)
    (hnh5 : Tendsto (fun n : ℕ ↦ √((n : ℝ) * h n ^ 5)) atTop (𝓝 κ))
    (X : ℕ → Ω → ℝ) (hX : IsIndependentIdenticallyDistributed μ X (densityLaw volume f))
    {α z : ℝ} (hα : α ∈ Ioo 0 1) (hz : cdf (gaussianReal 0 1) z = 1 - α / 2) :
    let b := κ * (∫ u, u ^ 2 * K u) * iteratedDeriv 2 f x / (2 * √((∫ u, K u ^ 2) * f x))
    Tendsto (fun n ↦ μ.real {ω | |kernelDensityEstimator K (h n) (firstN X n ω) x - f x| ≤
        z * √((∫ u, K u ^ 2) * f x / (n * h n))}) atTop
      (𝓝 (cdf (gaussianReal 0 1) (z - b) - cdf (gaussianReal 0 1) (-z - b))) ∧
    (b ≠ 0 → cdf (gaussianReal 0 1) (z - b) - cdf (gaussianReal 0 1) (-z - b) < 1 - α) ∧
    (κ = 0 → cdf (gaussianReal 0 1) (z - b) - cdf (gaussianReal 0 1) (-z - b) = 1 - α) := by
  sorry

/-- **5.3** The `d`-dimensional kernel density estimator. -/
def kdeEuclidean {d n : ℕ} (K : EuclideanSpace ℝ (Fin d) → ℝ) (h : ℝ)
    (x : Fin n → EuclideanSpace ℝ (Fin d)) (t : EuclideanSpace ℝ (Fin d)) : ℝ :=
  ((n : ℝ) * h ^ d)⁻¹ * ∑ i, K (h⁻¹ • (t - x i))

/-- **5.3** For `h > 0` and `n ≥ 1` the `d`-dimensional estimator integrates to `∫ K`. -/
theorem integral_kdeEuclidean {d n : ℕ} (hn : 1 ≤ n) (K : EuclideanSpace ℝ (Fin d) → ℝ)
    (hK : Integrable K) {h : ℝ} (hh : 0 < h) (x : Fin n → EuclideanSpace ℝ (Fin d)) :
    ∫ t, kdeEuclidean K h x t = ∫ u, K u := by
  sorry

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

/-- **5.3** The bias in `L¹`: for integrable `K` with `∫ K = 1` and every density `f`,
`∫ |K_h * f - f| → 0` as `h → 0`, with `K_h = h^{-d} K(·/h)`. -/
theorem tendsto_integral_abs_conv_sub {d : ℕ} (K : EuclideanSpace ℝ (Fin d) → ℝ)
    (hK : Integrable K) (hK1 : ∫ u, K u = 1) (f : EuclideanSpace ℝ (Fin d) → ℝ)
    (hf : Measurable f) (hf0 : ∀ x, 0 ≤ f x) (hf1 : ∫ x, f x = 1) :
    Tendsto (fun h : ℝ ↦ ∫ t, |(∫ y, (h ^ d)⁻¹ * K (h⁻¹ • (t - y)) * f y) - f t|) (𝓝[>] 0)
      (𝓝 0) := by
  sorry

/-- **5.3** Universal consistency in mean: `E ∫ |f̂_n - f| → 0` for every density `f`, when
`h → 0` and `n h^d → ∞`. -/
theorem tendsto_integral_integral_abs_kde_sub {d : ℕ} (K : EuclideanSpace ℝ (Fin d) → ℝ)
    (hK : Integrable K) (hK1 : ∫ u, K u = 1) (h : ℕ → ℝ) (hh : ∀ n, 0 < h n)
    (hh0 : Tendsto h atTop (𝓝 0)) (hnh : Tendsto (fun n ↦ n * h n ^ d) atTop atTop)
    (f : EuclideanSpace ℝ (Fin d) → ℝ) (hf : Measurable f) (hf0 : ∀ x, 0 ≤ f x)
    (hf1 : ∫ x, f x = 1) :
    Tendsto (fun n ↦ ∫ x, (∫ t, |kdeEuclidean K (h n) x t - f t|)
      ∂(Measure.pi fun _ : Fin n ↦ densityLaw volume f)) atTop (𝓝 0) := by
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

/-- **5.4** When `Xᵀ W X` is invertible, `localPolynomialCoeff` is the unique solution of the
normal equations of the weighted least-squares criterion
`∑ K((x i - t)/h) (Y i - ∑_k β_k (x i - t)^k)²` (its unique stationary point), and it reproduces
every polynomial of degree at most `p`; if also `K ≥ 0`, the matrix is positive definite and the
coefficient vector is the unique minimizer. -/
theorem localPolynomialCoeff_spec (K : ℝ → ℝ) (h : ℝ) (p : ℕ) {n : ℕ} (x Y : Fin n → ℝ)
    (t : ℝ) :
    let D : Matrix (Fin n) (Fin (p + 1)) ℝ := Matrix.of fun i k ↦ (x i - t) ^ (k : ℕ)
    let W : Matrix (Fin n) (Fin n) ℝ := Matrix.diagonal fun i ↦ K ((x i - t) / h)
    let crit : (Fin (p + 1) → ℝ) → ℝ := fun β ↦
      ∑ i, K ((x i - t) / h) * (Y i - ∑ k, β k * (x i - t) ^ (k : ℕ)) ^ 2
    IsUnit (Dᵀ * W * D).det →
      (∀ β : Fin (p + 1) → ℝ, (∀ j : Fin (p + 1), ∑ i, K ((x i - t) / h) *
          (Y i - ∑ k, β k * (x i - t) ^ (k : ℕ)) * (x i - t) ^ (j : ℕ) = 0) ↔
        β = localPolynomialCoeff K h p x Y t) ∧
      (∀ c : Fin (p + 1) → ℝ,
        localPolynomialCoeff K h p x (fun i ↦ ∑ k, c k * (x i - t) ^ (k : ℕ)) t = c) ∧
      ((∀ u, 0 ≤ K u) → (Dᵀ * W * D).PosDef ∧
        ∀ β, β ≠ localPolynomialCoeff K h p x Y t →
          crit (localPolynomialCoeff K h p x Y t) < crit β) := by
  sorry

/-- **5.4** The leave-one-out identity for a linear smoother `L` with `L i i ≠ 1`. -/
theorem leaveOneOut_eq {n : ℕ} (L : Matrix (Fin n) (Fin n) ℝ) (Y : Fin n → ℝ)
    (hL : ∀ i, L i i ≠ 1) :
    (∀ i, Y i - (∑ j ∈ Finset.univ.erase i, L i j * Y j) / (1 - L i i) =
      (Y i - L.mulVec Y i) / (1 - L i i)) ∧
    ∑ i, (Y i - (∑ j ∈ Finset.univ.erase i, L i j * Y j) / (1 - L i i)) ^ 2 =
      ∑ i, ((Y i - L.mulVec Y i) / (1 - L i i)) ^ 2 := by
  sorry

/-- **5.4** Leave-one-out fits of Nadaraya–Watson, for a nonnegative kernel: with
`L i j = nadarayaWatson K h x (Pi.single j 1) (x i)` and `L i i ≠ 1`, the fit at `x i` without the
`i`-th observation is `∑_{j ≠ i} L i j Y j / (1 - L i i)`. -/
theorem nadarayaWatson_leaveOneOut (K : ℝ → ℝ) (hK0 : ∀ u, 0 ≤ K u) (h : ℝ) {n : ℕ}
    (x Y : Fin (n + 1) → ℝ) (i : Fin (n + 1))
    (hL : nadarayaWatson K h x (Pi.single i 1) (x i) ≠ 1) :
    nadarayaWatson K h (x ∘ i.succAbove) (Y ∘ i.succAbove) (x i) =
      (∑ j ∈ Finset.univ.erase i, nadarayaWatson K h x (Pi.single j 1) (x i) * Y j) /
        (1 - nadarayaWatson K h x (Pi.single i 1) (x i)) := by
  sorry

/-- **5.4** Leave-one-out fits of local polynomials with the kernel centered at `x i`: with
`L i j` the intercept of `localPolynomialCoeff` for the data `Pi.single j 1` at `x i`, if
`L i i ≠ 1` and the matrices `Xᵀ W X` at `x i` with and without observation `i` are invertible,
the fit at `x i` without the `i`-th observation is `∑_{j ≠ i} L i j Y j / (1 - L i i)`. -/
theorem localPolynomialCoeff_leaveOneOut (K : ℝ → ℝ) (h : ℝ) (p : ℕ) {n : ℕ}
    (x Y : Fin (n + 1) → ℝ) (i : Fin (n + 1))
    (hinv : IsUnit ((Matrix.of fun j (k : Fin (p + 1)) ↦ (x j - x i) ^ (k : ℕ))ᵀ *
      Matrix.diagonal (fun j ↦ K ((x j - x i) / h)) *
      Matrix.of fun j (k : Fin (p + 1)) ↦ (x j - x i) ^ (k : ℕ)).det)
    (hinv' : IsUnit ((Matrix.of fun j (k : Fin (p + 1)) ↦ (x (i.succAbove j) - x i) ^ (k : ℕ))ᵀ *
      Matrix.diagonal (fun j ↦ K ((x (i.succAbove j) - x i) / h)) *
      Matrix.of fun j (k : Fin (p + 1)) ↦ (x (i.succAbove j) - x i) ^ (k : ℕ)).det)
    (hL : localPolynomialCoeff K h p x (Pi.single i 1) (x i) 0 ≠ 1) :
    localPolynomialCoeff K h p (x ∘ i.succAbove) (Y ∘ i.succAbove) (x i) 0 =
      (∑ j ∈ Finset.univ.erase i, localPolynomialCoeff K h p x (Pi.single j 1) (x i) 0 * Y j) /
        (1 - localPolynomialCoeff K h p x (Pi.single i 1) (x i) 0) := by
  sorry

/-- **5.4** The equivalent kernel `K*_ν t = e_νᵀ S⁻¹ (1, t, …, t^p)ᵀ K(t) 1_s(t)` of the local
polynomial fit of degree `p`, with the moment matrix `S = (∫_s u^{j+l} K)_{j,l ≤ p}` over a set
`s`: `s = univ` at an interior point, `s = [-c, ∞)` at the boundary point `c h`. For a singular
`S`, Mathlib's inverse is `0` and so is the kernel. -/
def equivalentKernel (s : Set ℝ) (K : ℝ → ℝ) (p : ℕ) (ν : Fin (p + 1)) (t : ℝ) : ℝ :=
  s.indicator (fun t ↦ ((Matrix.of fun j l : Fin (p + 1) ↦ ∫ u in s, u ^ ((j : ℕ) + l) * K u)⁻¹
    |>.mulVec fun l ↦ t ^ (l : ℕ)) ν * K t) t

/-- **5.4** The moments of the equivalent kernel: `∫ t^q K*_ν = δ_{νq}` for `q ≤ p`; for a
symmetric `K` and `p - ν` even, `K*_{ν,p} = K*_{ν,p+1}`, so their squared integrals agree. -/
theorem integral_pow_mul_equivalentKernel (K : ℝ → ℝ) (p : ℕ) (ν : Fin (p + 1))
    (hK : ∀ j ≤ 2 * p + 2, Integrable fun u ↦ u ^ j * K u)
    (hS : IsUnit (Matrix.of fun j l : Fin (p + 1) ↦ ∫ u in univ, u ^ ((j : ℕ) + l) * K u).det) :
    (∀ q : Fin (p + 1), ∫ t, t ^ (q : ℕ) * equivalentKernel univ K p ν t = if q = ν then 1 else 0) ∧
    ((∀ u, K (-u) = K u) → Even (p - (ν : ℕ)) →
      IsUnit (Matrix.of fun j l : Fin (p + 2) ↦ ∫ u in univ, u ^ ((j : ℕ) + l) * K u).det →
      (∀ t, equivalentKernel univ K p ν t = equivalentKernel univ K (p + 1) ν.castSucc t) ∧
        ∫ t, equivalentKernel univ K p ν t ^ 2 =
          ∫ t, equivalentKernel univ K (p + 1) ν.castSucc t ^ 2) := by
  sorry

/-- **5.5** Interior conditional variance and bias of the local polynomial estimator
`m̂_ν = ν! β̂_ν` at `x₀`, for i.i.d. `(X i, Y i)` with design density `f_X`, `m` and `σ²` versions
of `E[Y | X]` and `Var(Y | X)`. Conditionally on the design the estimator is linear in the
responses, so its conditional variance is `ν!² ∑ i, L_i² σ²(X i)`, with `L_i` the coefficient
for the data `Pi.single i 1`, and its conditional bias is `ν! β̂_ν(m(X)) - m^{(ν)}(x₀)`. Then
`n h^{1+2ν}` times the conditional variance tends in probability to
`ν!² ∫ K*_ν² σ²(x₀)/f_X(x₀)`, and for `p - ν` odd the conditional bias divided by `h^{p+1-ν}` tends
in probability to `ν!/(p + 1)! ∫ t^{p+1} K*_ν · m^{(p+1)}(x₀)`. -/
theorem tendstoInMeasure_localPolynomial_bias_variance {Ω : Type*} [MeasurableSpace Ω]
    (μ : Measure Ω) [IsProbabilityMeasure μ] (P : Measure (ℝ × ℝ)) [IsProbabilityMeasure P]
    (hY : MemLp (fun z : ℝ × ℝ ↦ z.2) 2 P) (fX : ℝ → ℝ)
    (hfX : P.map Prod.fst = densityLaw volume fX) (m s2 : ℝ → ℝ)
    (hm : (fun z ↦ m z.1) =ᵐ[P] P[fun z ↦ z.2 | MeasurableSpace.comap Prod.fst
      (inferInstance : MeasurableSpace ℝ)])
    (hs2 : (fun z ↦ s2 z.1) =ᵐ[P] P[fun z ↦ (z.2 - m z.1) ^ 2 | MeasurableSpace.comap Prod.fst
      (inferInstance : MeasurableSpace ℝ)])
    (K : ℝ → ℝ) (hK : Measurable K) (hK0 : ∀ u, 0 ≤ K u) (hKb : ∃ C, ∀ u, K u ≤ C)
    (hKs : ∀ u, K (-u) = K u) (hKc : HasCompactSupport K) (hK1 : ∫ u, K u = 1)
    (p : ℕ) (ν : Fin (p + 1)) (x₀ : ℝ) (hfx₀ : 0 < fX x₀) {δ : ℝ} (hδ : 0 < δ)
    (hfXc : ContinuousOn fX (Metric.ball x₀ δ))
    (hmc : ContDiffOn ℝ (p + 1 : ℕ) m (Metric.ball x₀ δ))
    (hs2c : ContinuousOn s2 (Metric.ball x₀ δ)) (h : ℕ → ℝ) (hh : ∀ n, 0 < h n)
    (hh0 : Tendsto h atTop (𝓝 0)) (hnh : Tendsto (fun n ↦ n * h n) atTop atTop)
    (Z : ℕ → Ω → ℝ × ℝ) (hZ : IsIndependentIdenticallyDistributed μ Z P) :
    TendstoInMeasure μ (fun (n : ℕ) ω ↦ n * h n ^ (1 + 2 * (ν : ℕ)) *
        (((ν : ℕ).factorial : ℝ) ^ 2 * ∑ i : Fin n,
          localPolynomialCoeff K (h n) p (fun j : Fin n ↦ (Z j ω).1) (Pi.single i 1) x₀ ν ^ 2 *
            s2 (Z i ω).1) -
        ((ν : ℕ).factorial : ℝ) ^ 2 * (∫ t, equivalentKernel univ K p ν t ^ 2) * s2 x₀ / fX x₀)
      atTop (fun _ ↦ 0) ∧
    (Odd (p - (ν : ℕ)) → TendstoInMeasure μ (fun (n : ℕ) ω ↦
        (((ν : ℕ).factorial : ℝ) * localPolynomialCoeff K (h n) p (fun j : Fin n ↦ (Z j ω).1)
          (fun j : Fin n ↦ m (Z j ω).1) x₀ ν - iteratedDeriv ν m x₀) / h n ^ (p + 1 - (ν : ℕ)) -
        ((ν : ℕ).factorial : ℝ) / ((p + 1).factorial : ℝ) *
          (∫ t, t ^ (p + 1) * equivalentKernel univ K p ν t) * iteratedDeriv (p + 1) m x₀)
      atTop (fun _ ↦ 0)) := by
  sorry

/-- **5.5** Interior conditional bias for `p - ν` even: under the hypotheses of
`tendstoInMeasure_localPolynomial_bias_variance`, with also `f_X'` and `m^{(p+2)}` continuous
near `x₀` and `n h³ → ∞`, the conditional bias is `O_P(h^{p+2-ν})`. -/
theorem localPolynomial_bias_even {Ω : Type*} [MeasurableSpace Ω]
    (μ : Measure Ω) [IsProbabilityMeasure μ] (P : Measure (ℝ × ℝ)) [IsProbabilityMeasure P]
    (hY : MemLp (fun z : ℝ × ℝ ↦ z.2) 2 P) (fX : ℝ → ℝ)
    (hfX : P.map Prod.fst = densityLaw volume fX) (m : ℝ → ℝ)
    (hm : (fun z ↦ m z.1) =ᵐ[P] P[fun z ↦ z.2 | MeasurableSpace.comap Prod.fst
      (inferInstance : MeasurableSpace ℝ)])
    (K : ℝ → ℝ) (hK : Measurable K) (hK0 : ∀ u, 0 ≤ K u) (hKb : ∃ C, ∀ u, K u ≤ C)
    (hKs : ∀ u, K (-u) = K u) (hKc : HasCompactSupport K) (hK1 : ∫ u, K u = 1)
    (p : ℕ) (ν : Fin (p + 1)) (hpν : Even (p - (ν : ℕ))) (x₀ : ℝ) (hfx₀ : 0 < fX x₀) {δ : ℝ}
    (hδ : 0 < δ) (hfXc : ContDiffOn ℝ 1 fX (Metric.ball x₀ δ))
    (hmc : ContDiffOn ℝ (p + 2 : ℕ) m (Metric.ball x₀ δ)) (h : ℕ → ℝ) (hh : ∀ n, 0 < h n)
    (hh0 : Tendsto h atTop (𝓝 0)) (hnh3 : Tendsto (fun n ↦ n * h n ^ 3) atTop atTop)
    (Z : ℕ → Ω → ℝ × ℝ) (hZ : IsIndependentIdenticallyDistributed μ Z P) :
    ∀ ε > 0, ∃ C : ℝ, ∀ᶠ n : ℕ in atTop, μ {ω | C * h n ^ (p + 2 - (ν : ℕ)) <
      |((ν : ℕ).factorial : ℝ) * localPolynomialCoeff K (h n) p (fun j : Fin n ↦ (Z j ω).1)
          (fun j : Fin n ↦ m (Z j ω).1) x₀ ν - iteratedDeriv ν m x₀|} ≤ ENNReal.ofReal ε := by
  sorry

/-- **5.5** The conditional bias of Nadaraya–Watson (`p = ν = 0`): under the hypotheses of
`localPolynomial_bias_even`, divided by `h²` it tends in probability to
`½ μ₂ (m''(x₀) + 2 m'(x₀) f_X'(x₀)/f_X(x₀))`. -/
theorem tendstoInMeasure_nadarayaWatson_bias {Ω : Type*} [MeasurableSpace Ω]
    (μ : Measure Ω) [IsProbabilityMeasure μ] (P : Measure (ℝ × ℝ)) [IsProbabilityMeasure P]
    (hY : MemLp (fun z : ℝ × ℝ ↦ z.2) 2 P) (fX : ℝ → ℝ)
    (hfX : P.map Prod.fst = densityLaw volume fX) (m : ℝ → ℝ)
    (hm : (fun z ↦ m z.1) =ᵐ[P] P[fun z ↦ z.2 | MeasurableSpace.comap Prod.fst
      (inferInstance : MeasurableSpace ℝ)])
    (K : ℝ → ℝ) (hK : Measurable K) (hK0 : ∀ u, 0 ≤ K u) (hKb : ∃ C, ∀ u, K u ≤ C)
    (hKs : ∀ u, K (-u) = K u) (hKc : HasCompactSupport K) (hK1 : ∫ u, K u = 1)
    (x₀ : ℝ) (hfx₀ : 0 < fX x₀) {δ : ℝ} (hδ : 0 < δ)
    (hfXc : ContDiffOn ℝ 1 fX (Metric.ball x₀ δ)) (hmc : ContDiffOn ℝ 2 m (Metric.ball x₀ δ))
    (h : ℕ → ℝ) (hh : ∀ n, 0 < h n) (hh0 : Tendsto h atTop (𝓝 0))
    (hnh3 : Tendsto (fun n ↦ n * h n ^ 3) atTop atTop)
    (Z : ℕ → Ω → ℝ × ℝ) (hZ : IsIndependentIdenticallyDistributed μ Z P) :
    TendstoInMeasure μ (fun (n : ℕ) ω ↦
        (nadarayaWatson K (h n) (fun j : Fin n ↦ (Z j ω).1) (fun j : Fin n ↦ m (Z j ω).1) x₀ -
          m x₀) / h n ^ 2 -
        1 / 2 * (∫ u, u ^ 2 * K u) *
          (iteratedDeriv 2 m x₀ + 2 * deriv m x₀ * deriv fX x₀ / fX x₀))
      atTop (fun _ ↦ 0) := by
  sorry

/-- **5.5** The boundary: for a design supported on `[0, ∞)` with `f_X(0) > 0` and `f_X`,
`m^{(p+1)}`, `σ²` right continuous at `0`, `σ²(0) > 0`, and `x₀ = c h`, `c ≥ 0`, the conditional
mean squared error `bias² + variance` of `m̂_ν(x₀)` is its leading term
`(ν!/(p + 1)! ∫ t^{p+1} K*_{ν,c} · m^{(p+1)}(0))² h^{2(p+1-ν)}` plus
`ν!² ∫ K*_{ν,c}² σ²(0)/(f_X(0) n h^{1+2ν})`, times `1 + o_P(1)`, with the equivalent kernel
`K*_{ν,c}` of the truncated moments over `[-c, ∞)`; derivatives at `0` are taken within
`[0, ∞)`. -/
theorem tendstoInMeasure_localPolynomial_boundary {Ω : Type*} [MeasurableSpace Ω]
    (μ : Measure Ω) [IsProbabilityMeasure μ] (P : Measure (ℝ × ℝ)) [IsProbabilityMeasure P]
    (hY : MemLp (fun z : ℝ × ℝ ↦ z.2) 2 P) (fX : ℝ → ℝ)
    (hfX : P.map Prod.fst = densityLaw volume fX) (hsupp : ∀ x < 0, fX x = 0) (m s2 : ℝ → ℝ)
    (hm : (fun z ↦ m z.1) =ᵐ[P] P[fun z ↦ z.2 | MeasurableSpace.comap Prod.fst
      (inferInstance : MeasurableSpace ℝ)])
    (hs2 : (fun z ↦ s2 z.1) =ᵐ[P] P[fun z ↦ (z.2 - m z.1) ^ 2 | MeasurableSpace.comap Prod.fst
      (inferInstance : MeasurableSpace ℝ)])
    (K : ℝ → ℝ) (hK : Measurable K) (hK0 : ∀ u, 0 ≤ K u) (hKb : ∃ C, ∀ u, K u ≤ C)
    (hKs : ∀ u, K (-u) = K u) (hKc : HasCompactSupport K) (hK1 : ∫ u, K u = 1)
    (p : ℕ) (ν : Fin (p + 1)) {c : ℝ} (hc : 0 ≤ c) (hf0 : 0 < fX 0)
    (hfXc : ContinuousWithinAt fX (Ici 0) 0) {δ : ℝ} (hδ : 0 < δ)
    (hmc : ContDiffOn ℝ (p + 1 : ℕ) m (Ico 0 δ))
    (hmc' : ContinuousWithinAt (iteratedDerivWithin (p + 1) m (Ici 0)) (Ici 0) 0)
    (hs2c : ContinuousWithinAt s2 (Ici 0) 0) (hs20 : 0 < s2 0) (h : ℕ → ℝ) (hh : ∀ n, 0 < h n)
    (hh0 : Tendsto h atTop (𝓝 0)) (hnh : Tendsto (fun n ↦ n * h n) atTop atTop)
    (Z : ℕ → Ω → ℝ × ℝ) (hZ : IsIndependentIdenticallyDistributed μ Z P) :
    TendstoInMeasure μ (fun (n : ℕ) ω ↦
        ((((ν : ℕ).factorial : ℝ) * localPolynomialCoeff K (h n) p (fun j : Fin n ↦ (Z j ω).1)
            (fun j : Fin n ↦ m (Z j ω).1) (c * h n) ν -
            iteratedDerivWithin ν m (Ici 0) (c * h n)) ^ 2 +
          ((ν : ℕ).factorial : ℝ) ^ 2 * ∑ i : Fin n, localPolynomialCoeff K (h n) p
            (fun j : Fin n ↦ (Z j ω).1) (Pi.single i 1) (c * h n) ν ^ 2 * s2 (Z i ω).1) /
        ((((ν : ℕ).factorial : ℝ) / ((p + 1).factorial : ℝ) *
            (∫ t, t ^ (p + 1) * equivalentKernel (Ici (-c)) K p ν t) *
            iteratedDerivWithin (p + 1) m (Ici 0) 0) ^ 2 * h n ^ (2 * (p + 1 - (ν : ℕ))) +
          ((ν : ℕ).factorial : ℝ) ^ 2 * (∫ t, equivalentKernel (Ici (-c)) K p ν t ^ 2) * s2 0 /
            (fX 0 * n * h n ^ (1 + 2 * (ν : ℕ)))))
      atTop (fun _ ↦ 1) := by
  sorry

/-- **5.5** Asymptotic normality of the local polynomial estimator for `p - ν` odd: under the
hypotheses of `tendstoInMeasure_localPolynomial_bias_variance`, with `E[Y⁴ | X]` bounded near `x₀`
and `σ²(x₀) > 0`, there is `r = o(h^{p+1-ν})` with
`(m̂_ν(x₀) - m^{(ν)}(x₀) - b_ν + r) / sd ⇝ N(0, 1)`, `b_ν` the leading bias and `sd²` the leading
variance. -/
theorem tendstoInDistribution_localPolynomialCoeff {Ω : Type*} [MeasurableSpace Ω]
    (μ : Measure Ω) [IsProbabilityMeasure μ] (P : Measure (ℝ × ℝ)) [IsProbabilityMeasure P]
    (hY4 : MemLp (fun z : ℝ × ℝ ↦ z.2) 4 P) (fX : ℝ → ℝ)
    (hfX : P.map Prod.fst = densityLaw volume fX) (m s2 y4 : ℝ → ℝ)
    (hm : (fun z ↦ m z.1) =ᵐ[P] P[fun z ↦ z.2 | MeasurableSpace.comap Prod.fst
      (inferInstance : MeasurableSpace ℝ)])
    (hs2 : (fun z ↦ s2 z.1) =ᵐ[P] P[fun z ↦ (z.2 - m z.1) ^ 2 | MeasurableSpace.comap Prod.fst
      (inferInstance : MeasurableSpace ℝ)])
    (hy4 : (fun z ↦ y4 z.1) =ᵐ[P] P[fun z ↦ z.2 ^ 4 | MeasurableSpace.comap Prod.fst
      (inferInstance : MeasurableSpace ℝ)])
    (K : ℝ → ℝ) (hK : Measurable K) (hK0 : ∀ u, 0 ≤ K u) (hKb : ∃ C, ∀ u, K u ≤ C)
    (hKs : ∀ u, K (-u) = K u) (hKc : HasCompactSupport K) (hK1 : ∫ u, K u = 1)
    (p : ℕ) (ν : Fin (p + 1)) (hpν : Odd (p - (ν : ℕ))) (x₀ : ℝ) (hfx₀ : 0 < fX x₀)
    (hs2x₀ : 0 < s2 x₀) {δ : ℝ} (hδ : 0 < δ) (hfXc : ContinuousOn fX (Metric.ball x₀ δ))
    (hmc : ContDiffOn ℝ (p + 1 : ℕ) m (Metric.ball x₀ δ))
    (hs2c : ContinuousOn s2 (Metric.ball x₀ δ)) (hy4b : ∃ C, ∀ x ∈ Metric.ball x₀ δ, y4 x ≤ C)
    (h : ℕ → ℝ) (hh : ∀ n, 0 < h n) (hh0 : Tendsto h atTop (𝓝 0))
    (hnh : Tendsto (fun n ↦ n * h n) atTop atTop)
    (Z : ℕ → Ω → ℝ × ℝ) (hZ : IsIndependentIdenticallyDistributed μ Z P) :
    ∃ r : ℕ → ℝ, r =o[atTop] (fun n ↦ h n ^ (p + 1 - (ν : ℕ))) ∧
      TendstoInDistribution (fun (n : ℕ) ω ↦
        (((ν : ℕ).factorial : ℝ) * localPolynomialCoeff K (h n) p (fun j : Fin n ↦ (Z j ω).1)
            (fun j : Fin n ↦ (Z j ω).2) x₀ ν - iteratedDeriv ν m x₀ -
          ((ν : ℕ).factorial : ℝ) / ((p + 1).factorial : ℝ) *
            (∫ t, t ^ (p + 1) * equivalentKernel univ K p ν t) * iteratedDeriv (p + 1) m x₀ *
            h n ^ (p + 1 - (ν : ℕ)) + r n) /
        √(((ν : ℕ).factorial : ℝ) ^ 2 * (∫ t, equivalentKernel univ K p ν t ^ 2) * s2 x₀ /
          (fX x₀ * n * h n ^ (1 + 2 * (ν : ℕ)))))
        atTop id (fun _ ↦ μ) (gaussianReal 0 1) := by
  sorry

/-- **5.5** The local linear estimator (`p = 1`, `ν = 0`, the intercept of
`localPolynomialCoeff K h 1`) with `n h⁵ = O(1)`:
`√(n h) (m̂_h(x₀) - m(x₀) - ½ h² μ₂ m''(x₀)) ⇝ N(0, R(K) σ²(x₀)/f_X(x₀))`. -/
theorem tendstoInDistribution_localLinear {Ω : Type*} [MeasurableSpace Ω]
    (μ : Measure Ω) [IsProbabilityMeasure μ] (P : Measure (ℝ × ℝ)) [IsProbabilityMeasure P]
    (hY4 : MemLp (fun z : ℝ × ℝ ↦ z.2) 4 P) (fX : ℝ → ℝ)
    (hfX : P.map Prod.fst = densityLaw volume fX) (m s2 y4 : ℝ → ℝ)
    (hm : (fun z ↦ m z.1) =ᵐ[P] P[fun z ↦ z.2 | MeasurableSpace.comap Prod.fst
      (inferInstance : MeasurableSpace ℝ)])
    (hs2 : (fun z ↦ s2 z.1) =ᵐ[P] P[fun z ↦ (z.2 - m z.1) ^ 2 | MeasurableSpace.comap Prod.fst
      (inferInstance : MeasurableSpace ℝ)])
    (hy4 : (fun z ↦ y4 z.1) =ᵐ[P] P[fun z ↦ z.2 ^ 4 | MeasurableSpace.comap Prod.fst
      (inferInstance : MeasurableSpace ℝ)])
    (K : ℝ → ℝ) (hK : Measurable K) (hK0 : ∀ u, 0 ≤ K u) (hKb : ∃ C, ∀ u, K u ≤ C)
    (hKs : ∀ u, K (-u) = K u) (hKc : HasCompactSupport K) (hK1 : ∫ u, K u = 1)
    (x₀ : ℝ) (hfx₀ : 0 < fX x₀) (hs2x₀ : 0 < s2 x₀) {δ : ℝ} (hδ : 0 < δ)
    (hfXc : ContinuousOn fX (Metric.ball x₀ δ)) (hmc : ContDiffOn ℝ 2 m (Metric.ball x₀ δ))
    (hs2c : ContinuousOn s2 (Metric.ball x₀ δ)) (hy4b : ∃ C, ∀ x ∈ Metric.ball x₀ δ, y4 x ≤ C)
    (h : ℕ → ℝ) (hh : ∀ n, 0 < h n) (hh0 : Tendsto h atTop (𝓝 0))
    (hnh : Tendsto (fun n ↦ n * h n) atTop atTop)
    (hnh5 : Asymptotics.IsBigO atTop (fun n : ℕ ↦ (n : ℝ) * h n ^ 5) fun _ ↦ (1 : ℝ))
    (Z : ℕ → Ω → ℝ × ℝ) (hZ : IsIndependentIdenticallyDistributed μ Z P) :
    TendstoInDistribution (fun (n : ℕ) ω ↦ √(n * h n) *
        (localPolynomialCoeff K (h n) 1 (fun j : Fin n ↦ (Z j ω).1) (fun j : Fin n ↦ (Z j ω).2)
            x₀ 0 - m x₀ - h n ^ 2 / 2 * (∫ u, u ^ 2 * K u) * iteratedDeriv 2 m x₀))
      atTop id (fun _ ↦ μ) (gaussianReal 0 ((∫ u, K u ^ 2) * s2 x₀ / fX x₀).toNNReal) := by
  sorry

/-- **5.5** The Nadaraya–Watson estimator with `f_X'` and `m''` continuous near `x₀` and
`n h⁵ = O(1)`: `√(n h) (m̂_h(x₀) - m(x₀) - ½ h² μ₂ (m''(x₀) + 2 m'(x₀) f_X'(x₀)/f_X(x₀)))`
converges in law to `N(0, R(K) σ²(x₀)/f_X(x₀))`. -/
theorem tendstoInDistribution_nadarayaWatson {Ω : Type*} [MeasurableSpace Ω]
    (μ : Measure Ω) [IsProbabilityMeasure μ] (P : Measure (ℝ × ℝ)) [IsProbabilityMeasure P]
    (hY4 : MemLp (fun z : ℝ × ℝ ↦ z.2) 4 P) (fX : ℝ → ℝ)
    (hfX : P.map Prod.fst = densityLaw volume fX) (m s2 y4 : ℝ → ℝ)
    (hm : (fun z ↦ m z.1) =ᵐ[P] P[fun z ↦ z.2 | MeasurableSpace.comap Prod.fst
      (inferInstance : MeasurableSpace ℝ)])
    (hs2 : (fun z ↦ s2 z.1) =ᵐ[P] P[fun z ↦ (z.2 - m z.1) ^ 2 | MeasurableSpace.comap Prod.fst
      (inferInstance : MeasurableSpace ℝ)])
    (hy4 : (fun z ↦ y4 z.1) =ᵐ[P] P[fun z ↦ z.2 ^ 4 | MeasurableSpace.comap Prod.fst
      (inferInstance : MeasurableSpace ℝ)])
    (K : ℝ → ℝ) (hK : Measurable K) (hK0 : ∀ u, 0 ≤ K u) (hKb : ∃ C, ∀ u, K u ≤ C)
    (hKs : ∀ u, K (-u) = K u) (hKc : HasCompactSupport K) (hK1 : ∫ u, K u = 1)
    (x₀ : ℝ) (hfx₀ : 0 < fX x₀) (hs2x₀ : 0 < s2 x₀) {δ : ℝ} (hδ : 0 < δ)
    (hfXc : ContDiffOn ℝ 1 fX (Metric.ball x₀ δ)) (hmc : ContDiffOn ℝ 2 m (Metric.ball x₀ δ))
    (hs2c : ContinuousOn s2 (Metric.ball x₀ δ)) (hy4b : ∃ C, ∀ x ∈ Metric.ball x₀ δ, y4 x ≤ C)
    (h : ℕ → ℝ) (hh : ∀ n, 0 < h n) (hh0 : Tendsto h atTop (𝓝 0))
    (hnh : Tendsto (fun n ↦ n * h n) atTop atTop)
    (hnh5 : Asymptotics.IsBigO atTop (fun n : ℕ ↦ (n : ℝ) * h n ^ 5) fun _ ↦ (1 : ℝ))
    (Z : ℕ → Ω → ℝ × ℝ) (hZ : IsIndependentIdenticallyDistributed μ Z P) :
    TendstoInDistribution (fun (n : ℕ) ω ↦ √(n * h n) *
        (nadarayaWatson K (h n) (fun j : Fin n ↦ (Z j ω).1) (fun j : Fin n ↦ (Z j ω).2) x₀ -
          m x₀ - h n ^ 2 / 2 * (∫ u, u ^ 2 * K u) *
            (iteratedDeriv 2 m x₀ + 2 * deriv m x₀ * deriv fX x₀ / fX x₀)))
      atTop id (fun _ ↦ μ) (gaussianReal 0 ((∫ u, K u ^ 2) * s2 x₀ / fX x₀).toNNReal) := by
  sorry

/-- **5.6** Stone's theorem for the Nadaraya–Watson estimate on `ℝ^d`,
`t ↦ ∑ i, K (h⁻¹ • (X i - t)) Y i / ∑ i, K (h⁻¹ • (X i - t))` with `0/0 = 0`, the
`d`-dimensional form of `nadarayaWatson`: the `L²(μ_X)` error tends to `0` in mean, and hence in
probability. `m` is a version of the regression function `E[Y | X = ·]`. The errors are extended
integrals. -/
theorem tendsto_lintegral_nadarayaWatson_sub_sq {d : ℕ} {Ω : Type*} [MeasurableSpace Ω]
    (μ : Measure Ω) [IsProbabilityMeasure μ] (P : Measure (EuclideanSpace ℝ (Fin d) × ℝ))
    [IsProbabilityMeasure P] (hY : MemLp (fun z : EuclideanSpace ℝ (Fin d) × ℝ ↦ z.2) 2 P)
    (m : EuclideanSpace ℝ (Fin d) → ℝ) (hm : Measurable m)
    (hmY : (fun z ↦ m z.1) =ᵐ[P] P[fun z ↦ z.2 | MeasurableSpace.comap Prod.fst
      (inferInstance : MeasurableSpace (EuclideanSpace ℝ (Fin d)))])
    (K : EuclideanSpace ℝ (Fin d) → ℝ) (hK : Measurable K) (hK0 : ∀ u, 0 ≤ K u)
    (hKb : ∃ C, ∀ u, K u ≤ C) (hKs : HasCompactSupport K)
    (hKball : ∃ r > 0, ∃ b > 0, ∀ u ∈ Metric.ball 0 r, b ≤ K u)
    (h : ℕ → ℝ) (hh : ∀ n, 0 < h n) (hh0 : Tendsto h atTop (𝓝 0))
    (hnh : Tendsto (fun n ↦ n * h n ^ d) atTop atTop)
    (Z : ℕ → Ω → EuclideanSpace ℝ (Fin d) × ℝ) (hZ : IsIndependentIdenticallyDistributed μ Z P) :
    Tendsto (fun n ↦ ∫⁻ ω, ∫⁻ t, ENNReal.ofReal (((∑ i : Fin n,
        K ((h n)⁻¹ • ((firstN Z n ω i).1 - t)) * (firstN Z n ω i).2) /
          (∑ i : Fin n, K ((h n)⁻¹ • ((firstN Z n ω i).1 - t))) - m t) ^ 2)
        ∂(P.map Prod.fst) ∂μ) atTop (𝓝 0) ∧
    ∀ ε : ℝ≥0∞, 0 < ε → Tendsto (fun n ↦ μ {ω | ε ≤ ∫⁻ t, ENNReal.ofReal (((∑ i : Fin n,
        K ((h n)⁻¹ • ((firstN Z n ω i).1 - t)) * (firstN Z n ω i).2) /
          (∑ i : Fin n, K ((h n)⁻¹ • ((firstN Z n ω i).1 - t))) - m t) ^ 2)
        ∂(P.map Prod.fst)}) atTop (𝓝 0) := by
  sorry

/-- **5.6** Stone's theorem for the `k`-nearest-neighbour estimate on `ℝ^d`: the average of the
`Y i` over the `k` indices `i` with fewer than `k` indices ahead of them, `j` being ahead of `i`
at `t` when `X j` is closer to `t` than `X i`, or as close with `j < i` (ties broken by index).
The `L²(μ_X)` error tends to `0` in mean, and hence in probability. -/
theorem tendsto_lintegral_nearestNeighbour_sub_sq {d : ℕ} {Ω : Type*} [MeasurableSpace Ω]
    (μ : Measure Ω) [IsProbabilityMeasure μ] (P : Measure (EuclideanSpace ℝ (Fin d) × ℝ))
    [IsProbabilityMeasure P] (hY : MemLp (fun z : EuclideanSpace ℝ (Fin d) × ℝ ↦ z.2) 2 P)
    (m : EuclideanSpace ℝ (Fin d) → ℝ) (hm : Measurable m)
    (hmY : (fun z ↦ m z.1) =ᵐ[P] P[fun z ↦ z.2 | MeasurableSpace.comap Prod.fst
      (inferInstance : MeasurableSpace (EuclideanSpace ℝ (Fin d)))])
    (k : ℕ → ℕ) (hk : Tendsto k atTop atTop) (hkn : Tendsto (fun n ↦ (k n : ℝ) / n) atTop (𝓝 0))
    (Z : ℕ → Ω → EuclideanSpace ℝ (Fin d) × ℝ) (hZ : IsIndependentIdenticallyDistributed μ Z P) :
    Tendsto (fun n ↦ ∫⁻ ω, ∫⁻ t, ENNReal.ofReal (((k n : ℝ)⁻¹ * (∑ i : Fin n,
        if (Finset.univ.filter fun j ↦ dist (firstN Z n ω j).1 t < dist (firstN Z n ω i).1 t ∨
          (dist (firstN Z n ω j).1 t = dist (firstN Z n ω i).1 t ∧ j < i)).card < k n
        then (firstN Z n ω i).2 else 0) - m t) ^ 2) ∂(P.map Prod.fst) ∂μ) atTop (𝓝 0) ∧
    ∀ ε : ℝ≥0∞, 0 < ε → Tendsto (fun n ↦ μ {ω | ε ≤ ∫⁻ t, ENNReal.ofReal (((k n : ℝ)⁻¹ *
        (∑ i : Fin n,
          if (Finset.univ.filter fun j ↦ dist (firstN Z n ω j).1 t < dist (firstN Z n ω i).1 t ∨
            (dist (firstN Z n ω j).1 t = dist (firstN Z n ω i).1 t ∧ j < i)).card < k n
          then (firstN Z n ω i).2 else 0) - m t) ^ 2) ∂(P.map Prod.fst)}) atTop (𝓝 0) := by
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

/-- **5.7** Stone's form of the criterion: for `n ≥ 2` and `h ≠ 0`,
`∫ f̂_h² - (2/(n² h)) ∑_{i ≠ j} K((x i - x j)/h)` equals
`∫ f̂_h² - (2(n - 1)/n²) ∑ f̂_{h,-i}(x i)`. -/
theorem stoneCriterion_eq (K : ℝ → ℝ) {h : ℝ} (hh : h ≠ 0) {n : ℕ} (hn : 2 ≤ n)
    (x : Fin n → ℝ) :
    (∫ t, kernelDensityEstimator K h x t ^ 2) -
        2 / ((n : ℝ) ^ 2 * h) * ∑ i, ∑ j ∈ Finset.univ.erase i, K ((x i - x j) / h) =
      (∫ t, kernelDensityEstimator K h x t ^ 2) -
        2 * ((n : ℝ) - 1) / (n : ℝ) ^ 2 *
          ∑ i, (((n : ℝ) - 1) * h)⁻¹ * ∑ j ∈ Finset.univ.erase i, K ((x i - x j) / h) := by
  sorry

/-- **5.8** The representer theorem: every minimizer of a regularized empirical risk lies in
the span of the kernel functions at the design points. -/
theorem mem_span_kerFun_of_isMinOn {𝒳 H : Type*} [NormedAddCommGroup H] [InnerProductSpace ℝ H]
    [CompleteSpace H] [RKHS ℝ H 𝒳 ℝ] {n : ℕ} (x : Fin n → 𝒳) (Y : Fin n → ℝ)
    (L : ℝ → ℝ → ℝ) {lam : ℝ} (hlam : 0 < lam) (f : H)
    (hf : IsMinOn (fun g : H ↦ (n : ℝ)⁻¹ * (∑ i, L (Y i) (RKHS.eval H (x i) g)) + lam * ‖g‖ ^ 2)
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

/-- **5.8** The value–second-derivative representation: `R` is positive definite, and if `u` is
continuous on `[a, b]`, affine between consecutive knots and `0` outside `[t₁, tₙ]` (so that `g`
is the natural cubic spline with these knot values), then `∫_a^b u² = gᵀ Q R⁻¹ Qᵀ g` for the
vector `g` of knot values. -/
theorem integral_sq_naturalSpline_eq {n : ℕ} (hn : 3 ≤ n) {a b : ℝ} (t : Fin n → ℝ)
    (ht : StrictMono t) (ha : ∀ i, a < t i) (hb : ∀ i, t i < b)
    (Q : Matrix (Fin n) (Fin (n - 2)) ℝ) (R : Matrix (Fin (n - 2)) (Fin (n - 2)) ℝ)
    (hQ : ∀ i (j : Fin (n - 2)), Q i j =
      if (i : ℕ) = j then 1 / (t ⟨j + 1, by omega⟩ - t ⟨j, by omega⟩)
      else if (i : ℕ) = j + 1 then -(1 / (t ⟨j + 1, by omega⟩ - t ⟨j, by omega⟩)) -
        1 / (t ⟨j + 2, by omega⟩ - t ⟨j + 1, by omega⟩)
      else if (i : ℕ) = j + 2 then 1 / (t ⟨j + 2, by omega⟩ - t ⟨j + 1, by omega⟩) else 0)
    (hR : ∀ i j : Fin (n - 2), R i j =
      if i = j then (t ⟨i + 2, by omega⟩ - t ⟨i, by omega⟩) / 3
      else if (i : ℕ) + 1 = j then (t ⟨i + 2, by omega⟩ - t ⟨i + 1, by omega⟩) / 6
      else if (j : ℕ) + 1 = i then (t ⟨j + 2, by omega⟩ - t ⟨j + 1, by omega⟩) / 6 else 0)
    (c₀ c₁ : ℝ) (u : ℝ → ℝ) (hu : ContinuousOn u (Icc a b))
    (haff : ∀ j : Fin n, ∀ hj : (j : ℕ) + 1 < n, ∃ α β : ℝ,
      ∀ s ∈ Icc (t j) (t ⟨j + 1, hj⟩), u s = α + β * s)
    (hout : ∀ s ∈ Icc a b, s ≤ t ⟨0, by omega⟩ ∨ t ⟨n - 1, by omega⟩ ≤ s → u s = 0) :
    R.PosDef ∧
      ∫ s in a..b, u s ^ 2 =
        dotProduct (fun i ↦ c₀ + c₁ * (t i - a) + ∫ s in a..t i, (t i - s) * u s)
          ((Q * R⁻¹ * Qᵀ).mulVec fun i ↦ c₀ + c₁ * (t i - a) + ∫ s in a..t i, (t i - s) * u s) := by
  sorry

/-- **5.8** The minimizer is the natural cubic spline: the second derivative `u` of any
minimizer of the smoothing-spline criterion is almost everywhere equal on `[a, b]` to a
function continuous on `[a, b]`, affine between consecutive knots and `0` outside `[t₁, tₙ]`. -/
theorem smoothingSpline_secondDeriv_eq {n : ℕ} (hn : 3 ≤ n) {a b α : ℝ} (hα : 0 < α)
    (t Y : Fin n → ℝ) (ht : StrictMono t) (ha : ∀ i, a < t i) (hb : ∀ i, t i < b) (c₀ c₁ : ℝ)
    (u : ℝ → ℝ) (hu : MemLp u 2 (volume.restrict (Icc a b)))
    (hmin : ∀ d₀ d₁ (v : ℝ → ℝ), MemLp v 2 (volume.restrict (Icc a b)) →
      smoothingSplineCriterion a b α t Y c₀ c₁ u ≤ smoothingSplineCriterion a b α t Y d₀ d₁ v) :
    ∃ v : ℝ → ℝ, ContinuousOn v (Icc a b) ∧
      (∀ j : Fin n, ∀ hj : (j : ℕ) + 1 < n, ∃ α' β' : ℝ,
        ∀ s ∈ Icc (t j) (t ⟨j + 1, hj⟩), v s = α' + β' * s) ∧
      (∀ s ∈ Icc a b, s ≤ t ⟨0, by omega⟩ ∨ t ⟨n - 1, by omega⟩ ≤ s → v s = 0) ∧
      u =ᵐ[volume.restrict (Icc a b)] v := by
  sorry

/-- **5.8** Cross-validation for smoothing splines: for `k + 1 ≥ 3` knots and the hat matrix
`A = (I + α Q R⁻¹ Qᵀ)⁻¹`, `A i i < 1`, and the value at `t i` of any minimizer of the criterion
for the data without observation `i` is `∑_{j ≠ i} A i j Y j / (1 - A i i)`. -/
theorem smoothingSpline_leaveOneOut {k : ℕ} (hk : 2 ≤ k) {a b α : ℝ} (hα : 0 < α)
    (t Y : Fin (k + 1) → ℝ) (ht : StrictMono t) (ha : ∀ i, a < t i) (hb : ∀ i, t i < b)
    (Q : Matrix (Fin (k + 1)) (Fin (k + 1 - 2)) ℝ)
    (R : Matrix (Fin (k + 1 - 2)) (Fin (k + 1 - 2)) ℝ)
    (hQ : ∀ i (j : Fin (k + 1 - 2)), Q i j =
      if (i : ℕ) = j then 1 / (t ⟨j + 1, by omega⟩ - t ⟨j, by omega⟩)
      else if (i : ℕ) = j + 1 then -(1 / (t ⟨j + 1, by omega⟩ - t ⟨j, by omega⟩)) -
        1 / (t ⟨j + 2, by omega⟩ - t ⟨j + 1, by omega⟩)
      else if (i : ℕ) = j + 2 then 1 / (t ⟨j + 2, by omega⟩ - t ⟨j + 1, by omega⟩) else 0)
    (hR : ∀ i j : Fin (k + 1 - 2), R i j =
      if i = j then (t ⟨i + 2, by omega⟩ - t ⟨i, by omega⟩) / 3
      else if (i : ℕ) + 1 = j then (t ⟨i + 2, by omega⟩ - t ⟨i + 1, by omega⟩) / 6
      else if (j : ℕ) + 1 = i then (t ⟨j + 2, by omega⟩ - t ⟨j + 1, by omega⟩) / 6 else 0)
    (i : Fin (k + 1)) (c₀ c₁ : ℝ) (u : ℝ → ℝ) (hu : MemLp u 2 (volume.restrict (Icc a b)))
    (hmin : ∀ d₀ d₁ (v : ℝ → ℝ), MemLp v 2 (volume.restrict (Icc a b)) →
      smoothingSplineCriterion a b α (t ∘ i.succAbove) (Y ∘ i.succAbove) c₀ c₁ u ≤
        smoothingSplineCriterion a b α (t ∘ i.succAbove) (Y ∘ i.succAbove) d₀ d₁ v) :
    let A : Matrix (Fin (k + 1)) (Fin (k + 1)) ℝ := (1 + α • (Q * R⁻¹ * Qᵀ))⁻¹
    A i i < 1 ∧ c₀ + c₁ * (t i - a) + ∫ s in a..t i, (t i - s) * u s =
      (∑ j ∈ Finset.univ.erase i, A i j * Y j) / (1 - A i i) := by
  sorry

/-- **5.9** Local polynomial attainment of the Hölder regression rates, design `(i + 1)/n`:
the intercept of `localPolynomialCoeff` of degree `ℓ = ⌈β⌉ - 1` with a kernel
`K_min 1_{|u| ≤ Δ} ≤ K ≤ K_max 1_{|u| ≤ 1}` has integrated squared risk on `[0, 1]` at most
`C n^{-2β/(2β+1)}` with `h = c n^{-1/(2β+1)}`, and, for a Lipschitz such kernel, squared sup-norm
risk at most `C (n / log n)^{-2β/(2β+1)}` with `h = c (log n / n)^{1/(2β+1)}`, uniformly over
`holderClass β L`, for all large `n`. The sup norm is the essential supremum on `[0, 1]`. The
risks are extended integrals. -/
theorem localPolynomial_holder_risk_le {β : ℝ} (hβ : 0 < β) {L : ℝ≥0} (hL : 0 < L) {σ : ℝ}
    (hσ : 0 < σ) (K : ℝ → ℝ) (hK : Measurable K) {Kmin Kmax Δ : ℝ} (hKmin : 0 < Kmin)
    (hΔ : 0 < Δ) (hKlow : ∀ u, (Icc (-Δ) Δ).indicator (fun _ ↦ Kmin) u ≤ K u)
    (hKup : ∀ u, K u ≤ (Icc (-1) 1).indicator (fun _ ↦ Kmax) u) {c : ℝ} (hc : 0 < c) :
    (∃ C, ∀ᶠ n : ℕ in atTop, ∀ f ∈ holderClass β L,
      ∫⁻ Y, (∫⁻ t in Icc (0 : ℝ) 1, ENNReal.ofReal ((localPolynomialCoeff K
          (c * (n : ℝ) ^ (-1 / (2 * β + 1))) (⌈β⌉₊ - 1) (fun i : Fin n ↦ ((i : ℝ) + 1) / n) Y t 0 -
            f t) ^ 2))
        ∂(Measure.pi fun i : Fin n ↦ gaussianReal (f (((i : ℝ) + 1) / n)) (σ ^ 2).toNNReal) ≤
      ENNReal.ofReal (C * (n : ℝ) ^ (-2 * β / (2 * β + 1)))) ∧
    ((∃ LK : ℝ≥0, LipschitzWith LK K) → ∃ C, ∀ᶠ n : ℕ in atTop, ∀ f ∈ holderClass β L,
      ∫⁻ Y, eLpNorm (fun t ↦ localPolynomialCoeff K
          (c * (Real.log n / n) ^ (1 / (2 * β + 1))) (⌈β⌉₊ - 1)
            (fun i : Fin n ↦ ((i : ℝ) + 1) / n) Y t 0 - f t) ∞
          (volume.restrict (Icc (0 : ℝ) 1)) ^ 2
        ∂(Measure.pi fun i : Fin n ↦ gaussianReal (f (((i : ℝ) + 1) / n)) (σ ^ 2).toNNReal) ≤
      ENNReal.ofReal (C * ((n : ℝ) / Real.log n) ^ (-2 * β / (2 * β + 1)))) := by
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

/-- **6.1** The diagonal estimator `y ↦ c ⊙ y` is measurable, and its risk is
`∑ (c_j² ε² + (1 - c_j)² θ_j²)`. -/
theorem gaussSeqRisk_diagonal (c θ : ℕ → ℝ) (ε : ℝ) :
    ∃ hc : Measurable fun y : ℕ → ℝ ↦ fun j ↦ c j * y j,
      gaussSeqRisk (Kernel.deterministic _ hc) θ ε =
        ∑' j, ENNReal.ofReal (c j ^ 2 * ε ^ 2 + (1 - c j) ^ 2 * θ j ^ 2) := by
  sorry

/-- **6.1** Finite-coordinate reduction: if `θ` and `θ'` agree outside a finite set `S`, the
coordinates outside `S` have the same law under both. -/
theorem map_restrict_gaussSeqLaw_eq {θ θ' : ℕ → ℝ} (S : Finset ℕ) (h : ∀ j ∉ S, θ j = θ' j)
    (ε : ℝ) :
    (gaussSeqLaw θ ε).map (fun y (j : {j // j ∉ S}) ↦ y j) =
      (gaussSeqLaw θ' ε).map (fun y (j : {j // j ∉ S}) ↦ y j) := by
  sorry

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

/-- **6.3** The two-sided rate: for weights `c j^β ≤ a_j ≤ C' j^β` (one-based `j ≥ 2`, index
`j ≥ 1` here) and `a_0 ≥ 0` arbitrary, the minimax risk lies between multiples `k₁`, `k₂`,
depending only on `β`, `c`, `C'`, of `C^{2/(2β+1)} ε^{4β/(2β+1)}` for `ε ≤ ε₀(C)`. -/
theorem gaussSeqMinimax_two_sided {β c C' : ℝ} (hβ : 0 < β) (hc : 0 < c) :
    ∃ k₁ > 0, ∃ k₂ > 0, ∀ C : ℝ, 0 < C → ∃ ε₀ > 0, ∀ a : ℕ → ℝ, (∀ j, 0 ≤ a j) →
      (∀ j : ℕ, 1 ≤ j → c * ((j : ℝ) + 1) ^ β ≤ a j ∧ a j ≤ C' * ((j : ℝ) + 1) ^ β) →
      ∀ ε : ℝ, 0 < ε → ε ≤ ε₀ →
        ENNReal.ofReal (k₁ * (C ^ (2 / (2 * β + 1)) * ε ^ (4 * β / (2 * β + 1)))) ≤
            gaussSeqMinimax (ellipsoid a C) ε ∧
          gaussSeqMinimax (ellipsoid a C) ε ≤
            ENNReal.ofReal (k₂ * (C ^ (2 / (2 * β + 1)) * ε ^ (4 * β / (2 * β + 1)))) := by
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

/-- **6.5** Twice the log likelihood ratio of `μ = 0` against `μ ∈ K` is `‖y‖² - ‖y - P_K y‖²`,
which equals `‖P_K y‖²`. -/
theorem iSup_sub_norm_sq_eq_norm_sq_metricProj {p m : ℕ} (A : Fin m → EuclideanSpace ℝ (Fin p))
    (y : EuclideanSpace ℝ (Fin p)) :
    (⨆ v : polyhedralCone A, (‖y‖ ^ 2 - ‖y - (v : EuclideanSpace ℝ (Fin p))‖ ^ 2)) =
        ‖y‖ ^ 2 - ‖y - metricProj (polyhedralCone A) y‖ ^ 2 ∧
      ‖y‖ ^ 2 - ‖y - metricProj (polyhedralCone A) y‖ ^ 2 =
        ‖metricProj (polyhedralCone A) y‖ ^ 2 := by
  sorry

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

/-- **7.1** The isotonic fit at `i` is the left slope at `W_i = ∑_{j ≤ i} w j` of the greatest
convex minorant of the cumulative-sum diagram, the points `(W_k, S_k)`, `k = 0, …, n`, with
`W_k = ∑_{j < k} w j` and `S_k = ∑_{j < k} w j y j`. The minorant is the supremum of the affine
functions below these points; the left slope at `W_i ∈ (0, W_n]` reads it only on `(0, W_n]`,
where that supremum is over a nonempty family bounded above. -/
theorem isotonicRegression_eq_slope_convexMinorant {n : ℕ} (w y : Fin n → ℝ)
    (hw : ∀ i, 0 < w i) (i : Fin n) :
    isotonicRegression w y i =
      derivWithin (fun t ↦ ⨆ ab : {ab : ℝ × ℝ // ∀ k : Fin (n + 1),
          ab.1 + ab.2 * (∑ j ∈ Finset.univ.filter (fun j : Fin n ↦ j.val < k.val), w j) ≤
            ∑ j ∈ Finset.univ.filter (fun j : Fin n ↦ j.val < k.val), w j * y j},
          ab.1.1 + ab.1.2 * t)
        (Iio (∑ j ∈ Finset.univ.filter (· ≤ i), w j)) (∑ j ∈ Finset.univ.filter (· ≤ i), w j) := by
  sorry

/-- **7.1** The isotonic fit preserves the weighted sum, is monotone in the data, and commutes
with adding constants and with positive scaling. -/
theorem isotonicRegression_properties {n : ℕ} (w : Fin n → ℝ) (hw : ∀ i, 0 < w i) :
    (∀ y, ∑ i, w i * isotonicRegression w y i = ∑ i, w i * y i) ∧
    (∀ y y' : Fin n → ℝ, y ≤ y' → isotonicRegression w y ≤ isotonicRegression w y') ∧
    (∀ (y : Fin n → ℝ) (d : ℝ),
      isotonicRegression w (fun i ↦ y i + d) = fun i ↦ isotonicRegression w y i + d) ∧
    ∀ (y : Fin n → ℝ) {c : ℝ}, 0 < c →
      isotonicRegression w (c • y) = c • isotonicRegression w y := by
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

/-- **7.3** Log form: the Grenander estimator is positive at every observation, so it maximizes
`∑ log f (x i)` among the nonincreasing densities on `[0, ∞)` positive at every `x i`. -/
theorem grenander_isMaxLogLikelihood {n : ℕ} (hn : 0 < n) (x : Fin n → ℝ) (hx : ∀ i, 0 < x i) :
    (∀ i, 0 < grenander x (x i)) ∧
      ∀ f : ℝ → ℝ, AntitoneOn f (Ici 0) → (∀ t, 0 ≤ f t) → ∫ t in Ioi 0, f t = 1 →
        (∀ i, 0 < f (x i)) →
          ∑ i, Real.log (f (x i)) ≤ ∑ i, Real.log (grenander x (x i)) := by
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

/-- **7.4** The Chernoff variable is almost everywhere measurable, its law is symmetric, and its
law does not depend on the choice of the two independent Brownian motions. -/
theorem map_chernoffArgmax (B₁ B₂ : ℝ≥0 → Ω → ℝ) (h₁ : IsBrownianReal B₁ μ)
    (h₂ : IsBrownianReal B₂ μ) (h : IndepFun (fun ω t ↦ B₁ t ω) (fun ω t ↦ B₂ t ω) μ)
    {Ω' : Type*} [MeasurableSpace Ω'] (μ' : Measure Ω') [IsProbabilityMeasure μ']
    (B₁' B₂' : ℝ≥0 → Ω' → ℝ) (h₁' : IsBrownianReal B₁' μ') (h₂' : IsBrownianReal B₂' μ')
    (h' : IndepFun (fun ω t ↦ B₁' t ω) (fun ω t ↦ B₂' t ω) μ') :
    AEMeasurable (chernoffArgmax (twoSided B₁ B₂)) μ ∧
      μ.map (chernoffArgmax (twoSided B₁ B₂)) =
        μ.map (fun ω ↦ -chernoffArgmax (twoSided B₁ B₂) ω) ∧
      μ'.map (chernoffArgmax (twoSided B₁' B₂')) = μ.map (chernoffArgmax (twoSided B₁ B₂)) := by
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

/-- **7.5** The log-concave maximum likelihood estimator: for a sample `x` of size `n ≥ d + 1`
whose convex hull `C_n` has nonempty interior, the maximizer over `logConcaveDensities d` of the
log-likelihood of the empirical distribution exists and is unique; it vanishes outside `C_n`,
and on `C_n` it is `exp` of the tent function with some heights `h`, the smallest concave
function `g` with `g (x i) ≥ h i`. On `C_n` the infimum is over a nonempty family bounded
below by `min h`. -/
theorem logConcaveMLE_tent {d n : ℕ} (hn : d + 1 ≤ n) (x : Fin n → EuclideanSpace ℝ (Fin d))
    (hx : (interior (convexHull ℝ (range x))).Nonempty) :
    (∃! f, f ∈ logConcaveDensities d ∧ ∀ g ∈ logConcaveDensities d,
        logLikelihood (uniformMixture fun i ↦ Measure.dirac (x i)) g ≤
          logLikelihood (uniformMixture fun i ↦ Measure.dirac (x i)) f) ∧
    ∀ f ∈ logConcaveDensities d, (∀ g ∈ logConcaveDensities d,
        logLikelihood (uniformMixture fun i ↦ Measure.dirac (x i)) g ≤
          logLikelihood (uniformMixture fun i ↦ Measure.dirac (x i)) f) →
      (∀ z ∉ convexHull ℝ (range x), f z = 0) ∧
      ∃ h : Fin n → ℝ, ∀ z ∈ convexHull ℝ (range x),
        f z = ENNReal.ofReal (Real.exp (sInf {r | ∃ g : EuclideanSpace ℝ (Fin d) → ℝ,
          ConcaveOn ℝ (convexHull ℝ (range x)) g ∧ (∀ i, h i ≤ g (x i)) ∧ g z = r})) := by
  sorry

/-- **7.5** The Hellinger rate `n^{-4/5}` of the log-concave maximum likelihood estimator in
dimension one, uniformly over `logConcaveDensities 1`. `fhat x` is any maximizer of the
log-likelihood of the empirical distribution of `x` over `logConcaveDensities 1`, required for
samples with distinct entries, for which it exists and is unique by
`existsUnique_logConcaveProjection`; samples with a repeated entry are null. -/
theorem logConcaveMLE_sqHellinger_le : ∃ C : ℝ, ∀ n : ℕ, 2 ≤ n →
    ∀ fhat : (Fin n → EuclideanSpace ℝ (Fin 1)) → EuclideanSpace ℝ (Fin 1) → ℝ≥0∞,
      (∀ x, Function.Injective x → fhat x ∈ logConcaveDensities 1 ∧
        ∀ g ∈ logConcaveDensities 1, logLikelihood (uniformMixture fun i ↦ Measure.dirac (x i)) g ≤
          logLikelihood (uniformMixture fun i ↦ Measure.dirac (x i)) (fhat x)) →
      ∀ f₀ ∈ logConcaveDensities 1,
        ∫⁻ x, ENNReal.ofReal (sqHellinger (volume.withDensity (fhat x)) (volume.withDensity f₀))
            ∂(Measure.pi fun _ : Fin n ↦ volume.withDensity f₀) ≤
          ENNReal.ofReal (C * (n : ℝ) ^ (-(4 : ℝ) / 5)) := by
  sorry

/-- **7.5** The minimax lower bounds over `logConcaveDensities d` in squared Hellinger distance,
with a constant depending on `d`: `c n^{-4/5}` for `d = 1` and `c n^{-2/(d+1)}` for `d ≥ 2`, for
all `n ≥ d + 1`. The estimate at `x` is the probability measure `κ x`; a randomized estimator, a
kernel into such measures, is covered through its mean kernel, since `sqHellinger (·, P)` is
convex. -/
theorem logConcave_minimax_lower (d : ℕ) (hd : 1 ≤ d) : ∃ c > 0, ∀ n : ℕ, d + 1 ≤ n →
    ∀ κ : Kernel (Fin n → EuclideanSpace ℝ (Fin d)) (EuclideanSpace ℝ (Fin d)), IsMarkovKernel κ →
      ENNReal.ofReal (c * if d = 1 then (n : ℝ) ^ (-(4 : ℝ) / 5)
        else (n : ℝ) ^ (-2 / ((d : ℝ) + 1))) ≤
        ⨆ f₀ : logConcaveDensities d,
          ∫⁻ x, ENNReal.ofReal (sqHellinger (κ x) (volume.withDensity f₀.1))
            ∂(Measure.pi fun _ : Fin n ↦ volume.withDensity f₀.1) := by
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

/-- **8.1** The covariance identity `⟪C x, y⟫ = E ⟪X - m, x⟫ ⟪X - m, y⟫`; the operator is positive,
which in Mathlib includes symmetric. -/
theorem inner_centeredCovariance (X : Ω → H) (hX : MemLp X 2 μ) :
    (∀ x y : H, ⟪centeredCovariance μ X x, y⟫ =
      ∫ ω, ⟪X ω - ∫ ω', X ω' ∂μ, x⟫ * ⟪X ω - ∫ ω', X ω' ∂μ, y⟫ ∂μ) ∧
    (centeredCovariance μ X).IsPositive := by
  sorry

/-- **8.1** `X - m` lies almost surely in the closure of the range of the covariance operator. -/
theorem ae_mem_closure_range_centeredCovariance (X : Ω → H) (hX : MemLp X 2 μ) :
    ∀ᵐ ω ∂μ, X ω - ∫ ω', X ω' ∂μ ∈
      (LinearMap.range (centeredCovariance μ X : H →ₗ[ℝ] H)).topologicalClosure := by
  sorry

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

/-- **8.2** Ky Fan's maximum principle: on `k` orthonormal vectors the diagonal of `T` sums to at
most `∑_{j < k} lam j`, with equality for the first `k` vectors `φ j` when `lam (k - 1) > 0`, and
these are then orthonormal. -/
theorem IsEigenExpansion.sum_inner_le {T : H →L[ℝ] H} {lam : ℕ → ℝ} {φ : ℕ → H}
    (he : IsEigenExpansion T lam φ) (k : ℕ) :
    (∀ v : Fin k → H, Orthonormal ℝ v → ∑ i, ⟪T (v i), v i⟫ ≤ ∑ j ∈ Finset.range k, lam j) ∧
    (0 < k → 0 < lam (k - 1) → Orthonormal ℝ (fun i : Fin k ↦ φ i) ∧
      ∑ i : Fin k, ⟪T (φ i), φ i⟫ = ∑ j ∈ Finset.range k, lam j) := by
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

/-- **8.3** The degenerate case: if `lam r = 0` for some `r < k` and `H` has a `k`-dimensional
subspace, some `k`-dimensional subspace leaves residual `0`, and a `k`-dimensional subspace does
so exactly when it contains the span of the `φ j` with `lam j > 0`. -/
theorem fpca_degenerate (X : Ω → H) (hX : MemLp X 2 μ) (lam : ℕ → ℝ) (φ : ℕ → H)
    (he : IsEigenExpansion (centeredCovariance μ X) lam φ) {k r : ℕ} (hrk : r < k)
    (hr : lam r = 0)
    (hk : ∃ V : Submodule ℝ H, FiniteDimensional ℝ V ∧ Module.finrank ℝ V = k) :
    (∃ (V : Submodule ℝ H) (_ : FiniteDimensional ℝ V), Module.finrank ℝ V = k ∧
      ∫ ω, ‖(X ω - ∫ ω', X ω' ∂μ) - V.starProjection (X ω - ∫ ω', X ω' ∂μ)‖ ^ 2 ∂μ = 0) ∧
    ∀ (V : Submodule ℝ H) [FiniteDimensional ℝ V], Module.finrank ℝ V = k →
      (∫ ω, ‖(X ω - ∫ ω', X ω' ∂μ) - V.starProjection (X ω - ∫ ω', X ω' ∂μ)‖ ^ 2 ∂μ = 0 ↔
        Submodule.span ℝ (φ '' {j | 0 < lam j}) ≤ V) := by
  sorry

/-- **8.4** The centered Gaussian measure with covariance given by an eigen-expansion. -/
def gaussianHilbert (lam : ℕ → ℝ) (φ : ℕ → H) : Measure H :=
  (Measure.infinitePi fun _ : ℕ ↦ gaussianReal 0 1).map fun z ↦
    if h : ∃ s, HasSum (fun j ↦ (√(lam j) * z j) • φ j) s then h.choose else 0

/-- **8.4** It is a centered Gaussian measure with covariance operator `T`. -/
theorem isGaussian_gaussianHilbert (T : H →L[ℝ] H) (lam : ℕ → ℝ) (φ : ℕ → H)
    (he : IsEigenExpansion T lam φ) (hsum : Summable lam) :
    IsGaussian (gaussianHilbert lam φ) ∧ ∫ x, x ∂(gaussianHilbert lam φ) = 0 ∧
      covarianceOperator (gaussianHilbert lam φ) = T := by
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

/-- **8.4** The trace criterion: a positive compact operator is the covariance operator of a
centered Gaussian measure iff its trace norm is finite. -/
theorem exists_isGaussian_covarianceOperator_iff (T : H →L[ℝ] H) (hT : IsCompactOperator T)
    (hpos : T.IsPositive) :
    (∃ ν : Measure H, IsGaussian ν ∧ ∫ x, x ∂ν = 0 ∧ covarianceOperator ν = T) ↔
      T.nuclearENorm < ∞ := by
  sorry

/-- **8.5** The Hilbertian central limit theorem. -/
theorem tendstoInDistribution_hilbert_clt (P : Measure H) [IsProbabilityMeasure P]
    (hP : MemLp id 2 P) (X : ℕ → Ω → H) (hX : IsIndependentIdenticallyDistributed μ X P)
    (lam : ℕ → ℝ) (φ : ℕ → H)
    (he : IsEigenExpansion (covarianceOperator (P.map fun x ↦ x - ∫ y, y ∂P)) lam φ)
    (hsum : Summable lam) [IsProbabilityMeasure (gaussianHilbert lam φ)] :
    TendstoInDistribution
      (fun (n : ℕ) ω ↦ (√(n : ℝ))⁻¹ • ∑ i ∈ Finset.range n, (X i ω - ∫ y, y ∂P)) atTop id (fun _ ↦ μ)
      (gaussianHilbert lam φ) := by
  sorry

/-- **8.6** The empirical covariance operator, centered at the sample mean. -/
def empiricalCovariance {n : ℕ} (x : Fin n → H) : H →L[ℝ] H :=
  (n : ℝ)⁻¹ • ∑ i, (innerSL ℝ (x i - (n : ℝ)⁻¹ • ∑ j, x j)).smulRight
    (x i - (n : ℝ)⁻¹ • ∑ j, x j)

/-- **8.6** Consistency: `Ĉ_n → C` almost surely in Hilbert–Schmidt energy when `E ‖X‖² < ∞`;
`‖Ĉ_n - C‖ = O_P(n^{-1/2})` when `E ‖X‖⁴ < ∞`, in outer probability; and every approximation
number of `Ĉ_n` is within `‖Ĉ_n - C‖` of that of `C`. -/
theorem fpca_consistency (P : Measure H) [IsProbabilityMeasure P] (X : ℕ → Ω → H)
    (hX : IsIndependentIdenticallyDistributed μ X P) {ι : Type*} (b : HilbertBasis ι ℝ H) :
    (MemLp id 2 P → ∀ᵐ ω ∂μ, Tendsto (fun n : ℕ ↦ (empiricalCovariance (firstN X n ω) -
        covarianceOperator (P.map fun x ↦ x - ∫ y, y ∂P)).hilbertSchmidtEnergy b) atTop (𝓝 0)) ∧
    (MemLp id 4 P → ∀ ε > 0, ∃ M : ℝ, ∀ᶠ n : ℕ in atTop,
      μ {ω | M < √(n : ℝ) * ‖empiricalCovariance (firstN X n ω) -
        covarianceOperator (P.map fun x ↦ x - ∫ y, y ∂P)‖} ≤ ENNReal.ofReal ε) ∧
    ∀ (n : ℕ) ω j, |((empiricalCovariance (firstN X n ω)).singularValue j : ℝ) -
        (covarianceOperator (P.map fun x ↦ x - ∫ y, y ∂P)).singularValue j| ≤
      ‖empiricalCovariance (firstN X n ω) - covarianceOperator (P.map fun x ↦ x - ∫ y, y ∂P)‖ := by
  sorry

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

/-- **8.6** Eigenfunctions: for a Hilbert basis `b` of eigenvectors of `C` with eigenvalues `ev`,
a simple positive eigenvalue `ev i₀ = λ_j`, and any unit eigenvectors `φhat n ω` of `Ĉ_n` for
`λ̂_j` with `⟪φhat n ω, b i₀⟫ ≥ 0`, `‖φhat - b i₀‖ = O_P(n^{-1/2})` and
`φhat - b i₀ = ∑_{i ≠ i₀} ⟪(Ĉ_n - C) b i₀, b i⟫ / (ev i₀ - ev i) · b i + o_P(n^{-1/2})`, in
outer probability. -/
theorem fpca_eigenvector (P : Measure H) [IsProbabilityMeasure P] (hP : MemLp id 4 P)
    (X : ℕ → Ω → H) (hX : IsIndependentIdenticallyDistributed μ X P)
    {ι : Type*} (b : HilbertBasis ι ℝ H) (ev : ι → ℝ)
    (hb : ∀ i, covarianceOperator (P.map fun x ↦ x - ∫ y, y ∂P) (b i) = ev i • b i)
    (i₀ : ι) (j : ℕ)
    (hj : ((covarianceOperator (P.map fun x ↦ x - ∫ y, y ∂P)).singularValue j : ℝ) = ev i₀)
    (hpos : 0 < ev i₀) (hsimple : ∀ i ≠ i₀, ev i ≠ ev i₀) (φhat : ℕ → Ω → H)
    (hφ : ∀ (n : ℕ) ω, ‖φhat n ω‖ = 1 ∧
      empiricalCovariance (firstN X n ω) (φhat n ω) =
        ((empiricalCovariance (firstN X n ω)).singularValue j : ℝ) • φhat n ω ∧
      0 ≤ ⟪φhat n ω, b i₀⟫) :
    (∀ ε > 0, ∃ M : ℝ, ∀ᶠ n : ℕ in atTop,
      μ {ω | M < √(n : ℝ) * ‖φhat n ω - b i₀‖} ≤ ENNReal.ofReal ε) ∧
    ∀ δ > 0, Tendsto (fun n : ℕ ↦ μ {ω | δ < √(n : ℝ) * ‖φhat n ω - b i₀ -
        ∑' i, (if i = i₀ then (0 : H) else
          (⟪(empiricalCovariance (firstN X n ω) -
              covarianceOperator (P.map fun x ↦ x - ∫ y, y ∂P)) (b i₀), b i⟫ /
            (ev i₀ - ev i)) • b i)‖}) atTop (𝓝 0) := by
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
