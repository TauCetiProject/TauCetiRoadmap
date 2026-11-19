module

public import Mathlib
public import TauCeti.Probability.McDiarmid
public import TauCeti.Probability.Moments.Bernstein
public import TauCeti.Probability.Distributions.Laplace.Basic
public import TauCeti.Probability.Exchangeability.Family
public import TauCeti.Probability.Process.EmpiricalMeasure
public import TauCeti.Data.Fin.Tuple.OrderStatistic
public import TauCeti.MeasureTheory.OptimalTransport.Wasserstein.Empirical
public import TauCeti.MeasureTheory.OptimalTransport.Wasserstein.Quantization
public import TauCeti.InformationTheory.KullbackLeibler.ChainRule

/-!
# Statistical learning theory: target signatures

This file is not the roadmap: the roadmap is `README.md`, and this file is not an exhaustive
checklist. It states, against the pinned Mathlib and Tau Ceti and each with `sorry`, the
headlines of the README that carry a Lean name, each with every conclusion the README attaches
to it, together with the definitions their statements need. The README's other headlines are
targets of the same standing, stated there in prose with their locators or proof routes, and are
not stated here. The bold headlines of the README without a Lean name, with what each lacks:

* 1.4 *The tie hypothesis cannot be dropped* and *Hinge and squared hinge*: a counterexample to,
  and examples of the calibration hypothesis of, `marginError_sub_le_surrogateRisk_sub`; they
  are Checks of that theorem rather than separate targets.
* 2.1 *Convex hulls*: the index type of finite convex combinations of members of a class.
* 3.3 *The hypotheses are needed*: counterexamples to `sampleComplexity_lower_bound` without its
  hypotheses, not a target.
* 4.1 *Kernel form*: a corollary of `marginError_le_empiricalMarginLoss` and
  `empiricalRademacherComplexity_closedBall_le`, with nothing to state beyond the two.
* 4.2 *Average stability*: the replace-one sample `S^(i)` with an independent copy and a loss
  on a parameter space, with strong convexity in the parameter.
* 4.3 *Closed form*, *Finite rank*, *Polynomial decay* and *Sobolev kernel*: the coefficient
  vector of the representer form, and a name for the critical radius of
  `krr_oracle_inequality` as a function of the empirical eigenvalues.
* 5.2 *`k`-NN limits* and *Consistency*: the `k`-nearest-neighbour rule (the `k` nearest indices,
  ties by index, and a majority vote) and the limit `L(k)` as a polynomial in `η`.
* 5.3 *Response-independent forests*: a carrier for random tree partitions built from the sample
  points; the README states no theorem beyond `tendsto_lintegral_weightEstimate_sub_sq`.
* 6.2 *Categorical splits*: the impurity of a split of a finite set of categories into two parts.
* 6.5 *Margins without dependence on `T`*: a corollary of `adaBoost_bounds`, with nothing to
  state beyond it.
* 7.3 *Advanced composition*: the `k`-fold adaptive composition of mechanisms, an iterated
  `Measure.compProd` over `Fin k`.
* 7.4 *Sequential releases*: the joint law of `n` sequentially interactive locally private
  releases.
* 7.6 *Several thresholds*: the `c`-fold restarted AboveThreshold mechanism.

The conventions of the README are used throughout. A sample of size `n` is a point of
`Fin n → Z` under `Measure.pi (fun _ ↦ P)`. Probabilities of events that need not be measurable
(events quantified over an uncountable class, or defined through an arbitrary learning rule) are
outer measures, through `Measure.real`. Classifiers take values in `Bool`; real scores are read
through `labelSign`, which sends `true` to `1` and `false` to `-1`. Quantities that can be infinite
(surrogate risks, `k`-means risks, minimax risks, divergences) live in `ℝ≥0∞`; empirical
Rademacher complexities live in `EReal`.

Definitions owned by `MathematicalStatisticsAsymptotic` appear as local copies with a docstring
naming their owner and section: the VC dimension of a family of sets and pointwise separability.
The implementation namespace of the README is `TauCeti`; the prototypes live in this roadmap's
namespace.
-/

@[expose] public section

noncomputable section

open MeasureTheory ProbabilityTheory Filter Set Topology InformationTheory
open scoped ENNReal NNReal InnerProductSpace Matrix

namespace TauCetiRoadmap.StatisticalLearningTheory

attribute [local instance] Classical.propDecidable

/-! ## Local copies of `MathematicalStatisticsAsymptotic` vocabulary -/

section Asymptotic

variable {T X : Type*}

/-- Local copy of `MathematicalStatisticsAsymptotic` 3.5: the VC dimension of a family of sets,
the supremum of the sizes of the finite sets whose traces exhaust their power sets. -/
def vcDimSet (C : Set (Set X)) : ℕ∞ :=
  ⨆ (s : Finset X) (_ : ∀ u ⊆ s, ∃ A ∈ C, ∀ x ∈ s, x ∈ A ↔ x ∈ u), (s.card : ℕ∞)

/-- Local copy of `MathematicalStatisticsAsymptotic` 3.2: pointwise separability, a countable
subfamily approximating every member pointwise. -/
def IsPointwiseSeparable (f : T → X → ℝ) : Prop :=
  ∃ T₀ : Set T, T₀.Countable ∧ ∀ t, ∃ s : ℕ → T, (∀ j, s j ∈ T₀) ∧
    ∀ x, Tendsto (fun j ↦ f (s j) x) atTop (𝓝 (f t x))

end Asymptotic

/-! ## Layer 1: risk, Bayes rules and losses -/

section Layer1

variable {X : Type*} [MeasurableSpace X]

/-- **1.1** The sign `±1` of a Boolean label: `true ↦ 1`, `false ↦ -1`. -/
def labelSign (b : Bool) : ℝ := if b then 1 else -1

/-- **1.1** The average `n⁻¹ ∑ g (z i)` of a function over a sample (`0` for `n = 0`). -/
def empiricalMean {Z : Type*} {n : ℕ} (g : Z → ℝ) (z : Fin n → Z) : ℝ :=
  (∑ i, g (z i)) / n

/-- **1.1** The misclassification probability `P(h(X) ≠ Y)` of a classifier, an outer
probability when `h` is not measurable. -/
def classificationError (P : Measure (X × Bool)) (h : X → Bool) : ℝ :=
  P.real {z | h z.1 ≠ z.2}

/-- **1.1** The fraction of sample points that a classifier misclassifies. -/
def empiricalError {n : ℕ} (h : X → Bool) (z : Fin n → X × Bool) : ℝ :=
  ((Finset.univ.filter fun i ↦ h (z i).1 ≠ (z i).2).card : ℝ) / n

/-- **1.2** `η` is a version of the regression function `x ↦ P(Y = true | X = x)`: measurable,
with values in `[0, 1]`, and integrating to `P(X ∈ A, Y = true)` over every measurable `A`. -/
def IsRegressionFunction (P : Measure (X × Bool)) (η : X → ℝ) : Prop :=
  Measurable η ∧ (∀ x, η x ∈ Icc (0 : ℝ) 1) ∧
    ∀ A : Set X, MeasurableSet A → P.real (A ×ˢ {true}) = ∫ x in A, η x ∂(P.map Prod.fst)

/-- **1.2** The plug-in classifier of a score `η`, predicting `true` where `η ≥ 1/2`; for the
regression function it is the Bayes classifier. -/
def bayesClassifier (η : X → ℝ) (x : X) : Bool := decide ((1 : ℝ) / 2 ≤ η x)

/-- **1.1** The ERM inequality: an approximate minimizer of an empirical criterion that is
uniformly within `D` of the true criterion is within `2 D + ε` of every competitor. A sanity
check rather than a target: it closes by `linarith` from its hypotheses. -/
theorem le_add_two_mul_add_of_isApproxMin {T : Type*} (R Rn : T → ℝ) (t₀ : T) (D ε : ℝ)
    (hmin : ∀ t, Rn t₀ ≤ Rn t + ε) (hdev : ∀ t, |Rn t - R t| ≤ D) (t : T) :
    R t₀ ≤ R t + 2 * D + ε := sorry

/-- **1.2** The Bayes classifier: its risk is `E min(η, 1 - η)`, it is optimal among measurable
classifiers, and the excess risk of `g` is `E[|2η - 1| 1{g ≠ g*}]`. -/
theorem classificationError_bayesClassifier (P : Measure (X × Bool)) [IsProbabilityMeasure P]
    (η : X → ℝ) (hη : IsRegressionFunction P η) (g : X → Bool) (hg : Measurable g) :
    classificationError P (bayesClassifier η) = ∫ x, min (η x) (1 - η x) ∂(P.map Prod.fst) ∧
      classificationError P (bayesClassifier η) ≤ classificationError P g ∧
      classificationError P g - classificationError P (bayesClassifier η) =
        ∫ x, |2 * η x - 1| * (if g x = bayesClassifier η x then 0 else 1) ∂(P.map Prod.fst) :=
  sorry

/-- **1.2** Plug-in classification: the excess risk of the plug-in rule of `η̂` is at most
`2 E|η̂ - η|`, and at most `2 C δ^(α + 1)` under the margin condition
`P(|η - 1/2| ≤ t) ≤ C t^α` when `|η̂ - η| ≤ δ` everywhere. -/
theorem classificationError_plugIn_sub_le (P : Measure (X × Bool)) [IsProbabilityMeasure P]
    (η : X → ℝ) (hη : IsRegressionFunction P η) (η' : X → ℝ) (hη' : Measurable η')
    (hint : Integrable η' (P.map Prod.fst)) :
    classificationError P (bayesClassifier η') - classificationError P (bayesClassifier η) ≤
        2 * ∫ x, |η' x - η x| ∂(P.map Prod.fst) ∧
      ∀ C α δ : ℝ, 0 < δ →
        (∀ t : ℝ, 0 < t → (P.map Prod.fst).real {x | |η x - 1 / 2| ≤ t} ≤ C * t ^ α) →
        (∀ x, |η' x - η x| ≤ δ) →
        classificationError P (bayesClassifier η') - classificationError P (bayesClassifier η) ≤
          2 * C * δ ^ (α + 1) := sorry

/-- **1.3** The logarithmic loss is proper: the expected log loss of a report `q` under `p` is the
entropy of `p` plus the relative entropy of `p` from `q`, hence at least the entropy. -/
theorem crossEntropy_eq_entropy_add_relEntropy {K : ℕ} (p q : Fin K → ℝ)
    (hp0 : ∀ j, 0 ≤ p j) (hp1 : ∑ j, p j = 1) (hq0 : ∀ j, 0 ≤ q j) (hq1 : ∑ j, q j = 1)
    (hpq : ∀ j, 0 < p j → 0 < q j) :
    -∑ j, p j * Real.log (q j) =
        -∑ j, p j * Real.log (p j) + ∑ j, p j * Real.log (p j / q j) ∧
      -∑ j, p j * Real.log (p j) ≤ -∑ j, p j * Real.log (q j) := sorry

/-- **1.3** The Brier loss is proper: its expected excess over the true probabilities is the
squared Euclidean distance of the report from them. -/
theorem brierScore_sub_eq {K : ℕ} (p q : Fin K → ℝ) (hp : ∑ j, p j = 1) :
    (∑ j, p j * ∑ k, (q k - if k = j then 1 else 0) ^ 2) -
        ∑ j, p j * ∑ k, (p k - if k = j then 1 else 0) ^ 2 = ∑ k, (q k - p k) ^ 2 := sorry

/-- **1.4** The conditional surrogate risk `η Φ(-u) + (1 - η) Φ(u)` of a score `u` when the label
is `true` with probability `η`. -/
def condSurrogateRisk (Φ : ℝ → ℝ) (η u : ℝ) : ℝ := η * Φ (-u) + (1 - η) * Φ u

/-- **1.4** The surrogate risk `E Φ(-Y h(X))` with `Y = ±1`, valued in `ℝ≥0∞`. -/
def surrogateRisk (P : Measure (X × Bool)) (Φ : ℝ → ℝ) (h : X → ℝ) : ℝ≥0∞ :=
  ∫⁻ z, ENNReal.ofReal (Φ (-(labelSign z.2 * h z.1))) ∂P

/-- **1.4** The misclassification risk `P(Y h(X) ≤ 0)` of a real score, ties counted as errors. -/
def marginError (P : Measure (X × Bool)) (h : X → ℝ) : ℝ :=
  P.real {z | labelSign z.2 * h z.1 ≤ 0}

/-- **1.4** Classification calibration: every real minimizer of the conditional surrogate risk has
the sign of `η - 1/2`, and `0` is a minimizer when `η = 1/2`. -/
theorem sign_of_isMinOn_condSurrogateRisk (Φ : ℝ → ℝ) (hconv : ConvexOn ℝ univ Φ)
    (hmono : Monotone Φ) (hd : DifferentiableAt ℝ Φ 0) (hd0 : 0 < deriv Φ 0) (η : ℝ)
    (hη : η ∈ Icc (0 : ℝ) 1) :
    (∀ u, IsMinOn (condSurrogateRisk Φ η) univ u → (1 / 2 < η → 0 < u) ∧ (η < 1 / 2 → u < 0)) ∧
      (η = 1 / 2 → IsMinOn (condSurrogateRisk Φ η) univ 0) := sorry

/-- **1.4** Zhang's comparison inequality: under the calibration condition with exponent `s` and
constant `c`, the excess misclassification risk of a measurable score that vanishes with
probability zero is at most `2 c` times the `1/s` power of its excess surrogate risk. -/
theorem marginError_sub_le_surrogateRisk_sub (P : Measure (X × Bool)) [IsProbabilityMeasure P]
    (η : X → ℝ) (hη : IsRegressionFunction P η) (Φ : ℝ → ℝ) (hconv : ConvexOn ℝ univ Φ)
    (hmono : Monotone Φ) (hnonneg : ∀ u, 0 ≤ Φ u) (s c : ℝ) (hs : 1 ≤ s) (hc : 0 < c)
    (hcal : ∀ x, |η x - 1 / 2| ^ s ≤
      c ^ s * (condSurrogateRisk Φ (η x) 0 - ⨅ u, condSurrogateRisk Φ (η x) u))
    (h : X → ℝ) (hh : Measurable h) (hzero : (P.map Prod.fst) {x | h x = 0} = 0) :
    ENNReal.ofReal (marginError P h - classificationError P (bayesClassifier η)) ≤
      ENNReal.ofReal (2 * c) *
        (surrogateRisk P Φ h - ⨅ (g : X → ℝ) (_ : Measurable g), surrogateRisk P Φ g) ^
          (1 / s) := sorry

end Layer1

/-! ## Layer 2: symmetrization and Rademacher averages -/

section Layer2

/-- **2.1** The empirical Rademacher complexity `E_σ sup_t n⁻¹ ∑ σ_i f_t(z_i)` of an indexed class
on a sample, the average over the `2^n` sign vectors, valued in `EReal` (`⊥` for an empty class,
`⊤` when a supremum is unbounded). -/
def empiricalRademacherComplexity {T Z : Type*} {n : ℕ} (f : T → Z → ℝ) (z : Fin n → Z) :
    EReal :=
  (((2 : ℝ) ^ n)⁻¹ : ℝ) *
    ∑ σ : Fin n → Bool, ⨆ t, (((n : ℝ)⁻¹ * ∑ i, labelSign (σ i) * f t (z i) : ℝ) : EReal)

/-- **2.1** Talagrand's contraction: composing the class with maps that are `L`-Lipschitz in the
value multiplies the empirical Rademacher complexity by at most `L`. -/
theorem empiricalRademacherComplexity_comp_le {T Z : Type*} {n : ℕ} (f : T → Z → ℝ)
    (φ : Z → ℝ → ℝ) (L : ℝ≥0) (hφ : ∀ w, LipschitzWith L (φ w)) (z : Fin n → Z) :
    empiricalRademacherComplexity (fun t w ↦ φ w (f t w)) z ≤
      ((L : ℝ) : EReal) * empiricalRademacherComplexity f z := sorry

/-- **2.1** Massart's lemma: a finite nonempty class whose vectors of values on the sample have
Euclidean norm at most `r` has empirical Rademacher complexity at most `r √(2 log |T|) / n`. -/
theorem empiricalRademacherComplexity_le_massart {T Z : Type*} [Fintype T] [Nonempty T] {n : ℕ}
    (f : T → Z → ℝ) (z : Fin n → Z) (r : ℝ) (hr : ∀ t, √(∑ i, f t (z i) ^ 2) ≤ r) :
    empiricalRademacherComplexity f z ≤
      ((r * √(2 * Real.log (Fintype.card T)) / n : ℝ) : EReal) := sorry

/-- **2.2** The Rademacher complexity of the ball of radius `B` of a reproducing-kernel Hilbert
space is at most `(B / n) √(∑ K(x_i, x_i))`, hence at most `B r / √n` when `K(x, x) ≤ r²`. -/
theorem empiricalRademacherComplexity_closedBall_le {X H : Type*} [NormedAddCommGroup H]
    [InnerProductSpace ℝ H] [CompleteSpace H] [RKHS ℝ H X ℝ] {n : ℕ} (B : ℝ) (hB : 0 ≤ B)
    (x : Fin n → X) :
    empiricalRademacherComplexity (fun (h : Metric.closedBall (0 : H) B) (w : X) ↦ (h : H) w) x ≤
        ((B / n * √(∑ i, ‖RKHS.kernel H (x i) (x i)‖) : ℝ) : EReal) ∧
      ∀ r : ℝ, 0 ≤ r → (∀ i, ‖RKHS.kernel H (x i) (x i)‖ ≤ r ^ 2) →
        empiricalRademacherComplexity (fun (h : Metric.closedBall (0 : H) B) (w : X) ↦ (h : H) w)
          x ≤ ((B * r / √n : ℝ) : EReal) := sorry

/-- **2.3** The Rademacher bound for a pointwise separable class with values in `[0, 1]`: the
expected one-sided suprema of `P_n - P` and of `P - P_n` are at most twice the expected empirical
Rademacher complexity; with probability at least `1 - δ` the two-sided supremum is at most that
plus `√(log(2/δ)/(2n))`; and with probability at least `1 - δ` the supremum of `P - P_n` is at most
twice the empirical complexity on the sample plus `3 √(log(2/δ)/(2n))`. -/
theorem rademacher_bound {T Z : Type*} [MeasurableSpace Z] [Nonempty T] (P : Measure Z)
    [IsProbabilityMeasure P] (f : T → Z → ℝ) (hf : ∀ t, Measurable (f t))
    (hsep : IsPointwiseSeparable f) (h01 : ∀ t w, f t w ∈ Icc (0 : ℝ) 1) (n : ℕ) (hn : 0 < n) :
    (∫ z, ⨆ t, (empiricalMean (f t) z - ∫ w, f t w ∂P) ∂(Measure.pi fun _ : Fin n ↦ P) ≤
        2 * ∫ z, (empiricalRademacherComplexity f z).toReal ∂(Measure.pi fun _ : Fin n ↦ P)) ∧
      (∫ z, ⨆ t, (∫ w, f t w ∂P - empiricalMean (f t) z) ∂(Measure.pi fun _ : Fin n ↦ P) ≤
        2 * ∫ z, (empiricalRademacherComplexity f z).toReal ∂(Measure.pi fun _ : Fin n ↦ P)) ∧
      ∀ δ : ℝ, 0 < δ → δ < 1 →
        (Measure.pi fun _ : Fin n ↦ P).real {z |
          2 * ∫ z', (empiricalRademacherComplexity f z').toReal ∂(Measure.pi fun _ : Fin n ↦ P) +
              √(Real.log (2 / δ) / (2 * n)) <
            ⨆ t, |empiricalMean (f t) z - ∫ w, f t w ∂P|} ≤ δ ∧
        (Measure.pi fun _ : Fin n ↦ P).real {z |
          2 * (empiricalRademacherComplexity f z).toReal + 3 * √(Real.log (2 / δ) / (2 * n)) <
            ⨆ t, (∫ w, f t w ∂P - empiricalMean (f t) z)} ≤ δ := sorry

/-- **2.4** Finite classes: for `N` measurable classifiers, the empirical errors on `n`
independent samples are all within `ε` of the errors except with probability `2 N e^(-2nε²)`. -/
theorem finiteClass_deviation {X : Type*} [MeasurableSpace X] (P : Measure (X × Bool))
    [IsProbabilityMeasure P] {N n : ℕ} (φ : Fin N → X → Bool) (hφ : ∀ j, Measurable (φ j))
    (ε : ℝ) (hε : 0 < ε) :
    (Measure.pi fun _ : Fin n ↦ P).real
        {z | ∃ j, ε < |empiricalError (φ j) z - classificationError P (φ j)|} ≤
      2 * N * Real.exp (-(2 * n * ε ^ 2)) := sorry

/-- **2.4** Hold-out selection: the classifier with the smallest hold-out error among `N` fixed
classifiers has error within `√(2 log(2N/δ)/l)` of the best of them with probability at least
`1 - δ` over a hold-out sample of size `l`. -/
theorem holdOut_selection {X : Type*} [MeasurableSpace X] (P : Measure (X × Bool))
    [IsProbabilityMeasure P] {N l : ℕ} (hl : 0 < l) (φ : Fin N → X → Bool)
    (hφ : ∀ j, Measurable (φ j)) (sel : (Fin l → X × Bool) → Fin N)
    (hsel : ∀ z j, empiricalError (φ (sel z)) z ≤ empiricalError (φ j) z) (δ : ℝ) (hδ : 0 < δ)
    (hδ1 : δ ≤ 1) :
    (Measure.pi fun _ : Fin l ↦ P).real {z | ∃ j,
      classificationError P (φ j) + √(2 * Real.log (2 * N / δ) / l) <
        classificationError P (φ (sel z))} ≤ δ := sorry

end Layer2

/-! ## Layer 3: combinatorial capacity and PAC learnability -/

section Layer3

variable {X : Type*} [MeasurableSpace X]

/-- **3.1** The VC dimension of a class of classifiers, that of the family of sets where its
members take the value `true`. -/
def vcDim (H : Set (X → Bool)) : ℕ∞ :=
  vcDimSet ((fun h : X → Bool ↦ {x | h x = true}) '' H)

/-- **3.1** The real indicator class `(h, x) ↦ 1{h x = true}` of a class of classifiers. -/
def indicatorClass (H : Set (X → Bool)) : H → X → ℝ :=
  fun h x ↦ if (h : X → Bool) x then 1 else 0

/-- **3.1** Agnostic PAC learnability: a rule with values in `H` and a sample size `m(ε, δ)`
such that, for every law and every `n ≥ m(ε, δ)`, the excess risk over the best member exceeds
`ε` with (outer) probability at most `δ`. -/
def IsAgnosticPACLearnable (H : Set (X → Bool)) : Prop :=
  ∃ (A : (n : ℕ) → (Fin n → X × Bool) → X → Bool) (m : ℝ → ℝ → ℕ), (∀ n z, A n z ∈ H) ∧
    ∀ ε δ : ℝ, 0 < ε → ε < 1 → 0 < δ → δ < 1 → ∀ P : Measure (X × Bool),
      IsProbabilityMeasure P → ∀ n, m ε δ ≤ n →
        (Measure.pi fun _ : Fin n ↦ P).real
          {z | (⨅ h : H, classificationError P h) + ε < classificationError P (A n z)} ≤ δ

/-- **3.1** Realizable PAC learnability: as agnostic learnability, for the laws under which some
member of `H` has error zero. -/
def IsRealizablePACLearnable (H : Set (X → Bool)) : Prop :=
  ∃ (A : (n : ℕ) → (Fin n → X × Bool) → X → Bool) (m : ℝ → ℝ → ℕ), (∀ n z, A n z ∈ H) ∧
    ∀ ε δ : ℝ, 0 < ε → ε < 1 → 0 < δ → δ < 1 → ∀ P : Measure (X × Bool),
      IsProbabilityMeasure P → (∃ h ∈ H, classificationError P h = 0) → ∀ n, m ε δ ≤ n →
        (Measure.pi fun _ : Fin n ↦ P).real {z | ε < classificationError P (A n z)} ≤ δ

/-- **3.2** Uniform deviation over a VC class: with probability at least `1 - δ`, every member
has error at most its empirical error plus `C √((v log n + log(1/δ))/n)`. -/
theorem uniform_deviation_vcDim : ∃ C : ℝ, 0 < C ∧ ∀ {X : Type*} [MeasurableSpace X]
    (H : Set (X → Bool)) (v : ℕ), vcDim H = v → 1 ≤ v → (∀ h ∈ H, Measurable h) →
    IsPointwiseSeparable (indicatorClass H) → ∀ (P : Measure (X × Bool)), IsProbabilityMeasure P →
    ∀ n : ℕ, 2 ≤ n → ∀ δ : ℝ, 0 < δ → δ < 1 →
      (Measure.pi fun _ : Fin n ↦ P).real {z | ∃ h ∈ H,
        empiricalError h z + C * √((v * Real.log n + Real.log (1 / δ)) / n) <
          classificationError P h} ≤ δ := sorry

/-- **3.2** Agnostic sample complexity of empirical risk minimization:
`n ≥ C (d + log(1/δ))/ε²` samples suffice for excess risk at most `ε` with probability at least
`1 - δ`. -/
theorem agnostic_erm_sampleComplexity : ∃ C : ℝ, 0 < C ∧ ∀ {X : Type*} [MeasurableSpace X]
    (H : Set (X → Bool)) (d : ℕ), vcDim H = d → (∀ h ∈ H, Measurable h) →
    IsPointwiseSeparable (indicatorClass H) → ∀ (P : Measure (X × Bool)), IsProbabilityMeasure P →
    ∀ ε δ : ℝ, 0 < ε → ε < 1 → 0 < δ → δ < 1 → ∀ n : ℕ, C * (d + Real.log (1 / δ)) / ε ^ 2 ≤ n →
    ∀ A : (Fin n → X × Bool) → X → Bool, (∀ z, A z ∈ H) →
    (∀ z, ∀ h ∈ H, empiricalError (A z) z ≤ empiricalError h z) →
      (Measure.pi fun _ : Fin n ↦ P).real
        {z | (⨅ h : H, classificationError P h) + ε < classificationError P (A z)} ≤ δ := sorry

/-- **3.2** Realizable sample complexity of consistent rules:
`n ≥ C (d log(2/ε) + log(1/δ))/ε` samples suffice for error at most `ε` with probability at least
`1 - δ`. -/
theorem realizable_consistent_sampleComplexity : ∃ C : ℝ, 0 < C ∧ ∀ {X : Type*}
    [MeasurableSpace X] (H : Set (X → Bool)) (d : ℕ), vcDim H = d → (∀ h ∈ H, Measurable h) →
    IsPointwiseSeparable (indicatorClass H) → ∀ (P : Measure (X × Bool)), IsProbabilityMeasure P →
    (∃ h ∈ H, classificationError P h = 0) →
    ∀ ε δ : ℝ, 0 < ε → ε < 1 → 0 < δ → δ < 1 →
    ∀ n : ℕ, C * (d * Real.log (2 / ε) + Real.log (1 / δ)) / ε ≤ n →
    ∀ A : (Fin n → X × Bool) → X → Bool, (∀ z, A z ∈ H) →
    (∀ z, (∃ h ∈ H, empiricalError h z = 0) → empiricalError (A z) z = 0) →
      (Measure.pi fun _ : Fin n ↦ P).real {z | ε < classificationError P (A z)} ≤ δ := sorry

/-- **3.3** Lower bounds on sample complexity: for a class of VC dimension `d ≥ 1`, every rule with
values in the class fails, for some law, on fewer than `c (d + log(1/δ))/ε²` samples in the
agnostic case, and, when the class has at least three members, for some realizable law on fewer
than `c (d + log(1/δ))/ε` samples. -/
theorem sampleComplexity_lower_bound : ∃ c : ℝ, 0 < c ∧ ∀ {X : Type*} [MeasurableSpace X]
    (H : Set (X → Bool)) (d : ℕ), vcDim H = d → 1 ≤ d → (∀ h ∈ H, Measurable h) →
    ∀ A : (n : ℕ) → (Fin n → X × Bool) → X → Bool, (∀ n z, A n z ∈ H) →
    (∀ ε δ : ℝ, 0 < ε → ε < 1 / 64 → 0 < δ → δ < 1 / 64 → ∀ n : ℕ,
      (n : ℝ) < c * (d + Real.log (1 / δ)) / ε ^ 2 → ∃ P : Measure (X × Bool),
        IsProbabilityMeasure P ∧ δ < (Measure.pi fun _ : Fin n ↦ P).real
          {z | (⨅ h : H, classificationError P h) + ε < classificationError P (A n z)}) ∧
    (3 ≤ H.encard → ∀ ε δ : ℝ, 0 < ε → ε < 1 / 8 → 0 < δ → δ < 1 / 100 → ∀ n : ℕ,
      (n : ℝ) < c * (d + Real.log (1 / δ)) / ε → ∃ P : Measure (X × Bool),
        IsProbabilityMeasure P ∧ (∃ h ∈ H, classificationError P h = 0) ∧
          δ < (Measure.pi fun _ : Fin n ↦ P).real {z | ε < classificationError P (A n z)}) :=
  sorry

/-- **3.3** Infinite VC dimension: on a space with measurable singletons, for a class of infinite
VC dimension, every rule and every sample size there is a law under which a member has error zero
and the expected error of the rule is at least `1/(2e) - δ`. -/
theorem exists_lintegral_classificationError_ge_of_vcDim_eq_top [MeasurableSingletonClass X]
    (H : Set (X → Bool)) (hH : vcDim H = ⊤) (n : ℕ) (A : (Fin n → X × Bool) → X → Bool) (δ : ℝ)
    (hδ : 0 < δ) :
    ∃ P : Measure (X × Bool), IsProbabilityMeasure P ∧ (∃ h ∈ H, classificationError P h = 0) ∧
      ENNReal.ofReal (1 / (2 * Real.exp 1) - δ) ≤
        ∫⁻ z, ENNReal.ofReal (classificationError P (A z)) ∂(Measure.pi fun _ : Fin n ↦ P) :=
  sorry

/-- **3.4** The fundamental theorem of statistical learning: for a nonempty pointwise separable
class of measurable classifiers, finite VC dimension, realizable PAC learnability and agnostic PAC
learnability are equivalent. -/
theorem vcDim_lt_top_iff_isPACLearnable (H : Set (X → Bool)) (hne : H.Nonempty)
    (hmeas : ∀ h ∈ H, Measurable h) (hsep : IsPointwiseSeparable (indicatorClass H)) :
    (vcDim H < ⊤ ↔ IsRealizablePACLearnable H) ∧ (vcDim H < ⊤ ↔ IsAgnosticPACLearnable H) :=
  sorry

/-- **3.5** No free lunch: on an infinite space, for every rule and sample size there is a law with
Bayes error zero under which the expected error of the rule is at least `1/2 - ε`. -/
theorem exists_lintegral_classificationError_ge [MeasurableSingletonClass X] [Infinite X]
    (n : ℕ) (A : (Fin n → X × Bool) → X → Bool) (ε : ℝ) (hε : 0 < ε) :
    ∃ P : Measure (X × Bool), IsProbabilityMeasure P ∧
      (∃ g : X → Bool, Measurable g ∧ classificationError P g = 0) ∧
      ENNReal.ofReal (1 / 2 - ε) ≤
        ∫⁻ z, ENNReal.ofReal (classificationError P (A z)) ∂(Measure.pi fun _ : Fin n ↦ P) :=
  sorry

end Layer3

/-! ## Layer 4: margins, stability and kernel regression -/

section Layer4

/-- **4.1** The ramp loss `min(1, max(0, 1 - u/ρ))`. -/
def rampLoss (ρ u : ℝ) : ℝ := min 1 (max 0 (1 - u / ρ))

/-- **4.1** The empirical margin loss `n⁻¹ ∑ Φ_ρ(Y_i h(X_i))` of a real score. -/
def empiricalMarginLoss {X : Type*} {n : ℕ} (ρ : ℝ) (h : X → ℝ) (z : Fin n → X × Bool) : ℝ :=
  (∑ i, rampLoss ρ (labelSign (z i).2 * h (z i).1)) / n

/-- **4.1** The margin bound: with probability at least `1 - δ`, every member of a bounded
pointwise separable class has risk at most its empirical margin loss plus `2/ρ` times the expected
Rademacher complexity plus `√(log(1/δ)/(2n))`; and, with the empirical complexity on the sample,
plus `3 √(log(2/δ)/(2n))`. -/
theorem marginError_le_empiricalMarginLoss {T X : Type*} [MeasurableSpace X] [Nonempty T]
    (P : Measure (X × Bool)) [IsProbabilityMeasure P] (f : T → X → ℝ) (hf : ∀ t, Measurable (f t))
    (hsep : IsPointwiseSeparable f) (M : ℝ) (hM : ∀ t x, |f t x| ≤ M) (ρ : ℝ) (hρ : 0 < ρ)
    (n : ℕ) (hn : 0 < n) (δ : ℝ) (hδ : 0 < δ) (hδ1 : δ < 1) :
    (Measure.pi fun _ : Fin n ↦ P).real {z | ∃ t,
        empiricalMarginLoss ρ (f t) z +
            2 / ρ * ∫ z', (empiricalRademacherComplexity f fun i ↦ (z' i).1).toReal
              ∂(Measure.pi fun _ : Fin n ↦ P) + √(Real.log (1 / δ) / (2 * n)) <
          marginError P (f t)} ≤ δ ∧
      (Measure.pi fun _ : Fin n ↦ P).real {z | ∃ t,
        empiricalMarginLoss ρ (f t) z +
            2 / ρ * (empiricalRademacherComplexity f fun i ↦ (z i).1).toReal +
              3 * √(Real.log (2 / δ) / (2 * n)) <
          marginError P (f t)} ≤ δ := sorry

/-- **4.2** Generalization of uniformly stable algorithms: for a loss `L S z ∈ [0, M]` of the
predictor trained on `S`, changing one sample point moving it by at most `β`, with probability at
least `1 - δ` the risk is at most the empirical risk plus `β + (2nβ + M) √(log(1/δ)/(2n))`. -/
theorem stable_generalization {Z : Type*} [MeasurableSpace Z] (P : Measure Z)
    [IsProbabilityMeasure P] {n : ℕ} (hn : 0 < n) (L : (Fin n → Z) → Z → ℝ)
    (hL : Measurable (Function.uncurry L)) (M β : ℝ) (hLM : ∀ S z, L S z ∈ Icc 0 M)
    (hβ : ∀ S i w z, |L (Function.update S i w) z - L S z| ≤ β) (δ : ℝ) (hδ : 0 < δ)
    (hδ1 : δ < 1) :
    (Measure.pi fun _ : Fin n ↦ P).real {S |
      empiricalMean (L S) S + β + (2 * n * β + M) * √(Real.log (1 / δ) / (2 * n)) <
        ∫ z, L S z ∂P} ≤ δ := sorry

/-- **4.2** Regularized empirical risk minimization over a reproducing-kernel Hilbert space with
a loss that is convex and `G`-Lipschitz in the prediction and a kernel bounded by `r²` on the
diagonal is uniformly stable with `β ≤ G² r² / (n λ)`. -/
theorem uniformStability_rkhs_regularized {X Y H : Type*} [NormedAddCommGroup H]
    [InnerProductSpace ℝ H] [CompleteSpace H] [RKHS ℝ H X ℝ] {n : ℕ} (c : Y → ℝ → ℝ) (G : ℝ≥0)
    (hconv : ∀ y, ConvexOn ℝ univ (c y)) (hlip : ∀ y, LipschitzWith G (c y)) (r lam : ℝ)
    (hlam : 0 < lam) (hr : ∀ x, ‖RKHS.kernel H x x‖ ≤ r ^ 2) (A : (Fin n → X × Y) → H)
    (hA : ∀ S, IsMinOn (fun h : H ↦ (∑ i, c (S i).2 (h (S i).1)) / n + lam * ‖h‖ ^ 2) univ (A S))
    (S : Fin n → X × Y) (i : Fin n) (w z : X × Y) :
    |c z.2 (A (Function.update S i w) z.1) - c z.2 (A S z.1)| ≤ (G : ℝ) ^ 2 * r ^ 2 / (n * lam) :=
  sorry

/-- **4.3** The kernel ridge regression objective `(2n)⁻¹ ∑ (y_i - f(x_i))² + λ ‖f‖²`. -/
def krrObjective {X H : Type*} [NormedAddCommGroup H] [InnerProductSpace ℝ H] [CompleteSpace H]
    [RKHS ℝ H X ℝ] {n : ℕ} (x : Fin n → X) (y : Fin n → ℝ) (lam : ℝ) (f : H) : ℝ :=
  (2 * n : ℝ)⁻¹ * ∑ i, (y i - f (x i)) ^ 2 + lam * ‖f‖ ^ 2

/-- **4.3** The squared empirical norm `n⁻¹ ∑ g(x_i)²` on a fixed design. -/
def empiricalNormSq {X : Type*} {n : ℕ} (x : Fin n → X) (g : X → ℝ) : ℝ :=
  (n : ℝ)⁻¹ * ∑ i, g (x i) ^ 2

/-- **4.3** The Gram matrix `(K(x_i, x_j))` of a scalar reproducing kernel on a design. -/
def gramMatrix (H : Type*) {X : Type*} [NormedAddCommGroup H] [InnerProductSpace ℝ H]
    [CompleteSpace H] [RKHS ℝ H X ℝ] {n : ℕ} (x : Fin n → X) : Matrix (Fin n) (Fin n) ℝ :=
  Matrix.of fun i j ↦ RKHS.kernel H (x i) (x j) 1

/-- **4.3** The oracle inequality for kernel ridge regression on a fixed design with Gaussian
noise, in probability and in expectation, at a solution `δ` of the critical inequality and a
regularization `λ ≥ 2 δ²`. -/
theorem krr_oracle_inequality : ∃ c₀ c₁ c₂ c₃ : ℝ, 0 < c₀ ∧ 0 < c₁ ∧ 0 < c₂ ∧ 0 < c₃ ∧
    ∀ {X H : Type*} [NormedAddCommGroup H] [InnerProductSpace ℝ H] [CompleteSpace H]
      [RKHS ℝ H X ℝ] (n : ℕ) (x : Fin n → X) (fstar : X → ℝ) (σ R δ lam : ℝ), 0 < n → 0 < σ →
      0 < R → 0 < δ → ∀ hG : ((n : ℝ)⁻¹ • gramMatrix H x).IsHermitian,
      √((2 / n) * ∑ j, min (δ ^ 2) (hG.eigenvalues j)) ≤ R / (4 * σ) * δ ^ 2 →
      2 * δ ^ 2 ≤ lam → ∀ fhat : (Fin n → ℝ) → H,
      (∀ w, IsMinOn (krrObjective x (fun i ↦ fstar (x i) + σ * w i) lam) univ (fhat w)) →
        (Measure.pi fun _ : Fin n ↦ gaussianReal 0 1).real {w |
          c₀ * ((⨅ f : Metric.closedBall (0 : H) R,
              empiricalNormSq x (fun t ↦ (f : H) t - fstar t)) + c₁ * R ^ 2 * (δ ^ 2 + lam)) <
            empiricalNormSq x (fun t ↦ fhat w t - fstar t)} ≤
          c₂ * Real.exp (-(c₃ * n * R ^ 2 * δ ^ 2 / σ ^ 2)) ∧
        ∫ w, empiricalNormSq x (fun t ↦ fhat w t - fstar t)
            ∂(Measure.pi fun _ : Fin n ↦ gaussianReal 0 1) ≤
          c₀ * ((⨅ f : Metric.closedBall (0 : H) R,
            empiricalNormSq x (fun t ↦ (f : H) t - fstar t)) + c₁ * R ^ 2 * (δ ^ 2 + lam)) :=
  sorry

end Layer4

/-! ## Layer 5: distribution-free prediction, local rules and clustering -/

section Layer5

/-- **5.1** The conformal threshold `S_(k)`, the `k`-th smallest of `n` calibration scores, with
`S_(0) = -∞` and `S_(k) = +∞` for `k > n`. -/
def conformalThreshold {n : ℕ} (s : Fin n → ℝ) (k : ℕ) : EReal :=
  if h : k = 0 then ⊥ else
    if hk : k ≤ n then ((TauCeti.orderStatistic ⟨k - 1, by omega⟩ s : ℝ) : EReal) else ⊤

/-- **5.1** Split conformal prediction: for exchangeable calibration and test scores the test score
is at most the threshold of rank `⌈(n + 1)(1 - α)⌉` with probability at least `1 - α`, and at most
`1 - α + 1/(n + 1)` when the scores are almost surely distinct. -/
theorem splitConformal_coverage {Ω : Type*} [MeasurableSpace Ω] (μ : Measure Ω)
    [IsProbabilityMeasure μ] {n : ℕ} (S : Fin (n + 1) → Ω → ℝ) (hS : ∀ i, Measurable (S i))
    (hex : TauCeti.Probability.ExchangeableFamily μ S) (α : ℝ) (hα : 0 < α) (hα1 : α < 1) :
    1 - α ≤ μ.real {ω | (S (Fin.last n) ω : EReal) ≤
        conformalThreshold (fun i : Fin n ↦ S i.castSucc ω) ⌈(n + 1 : ℝ) * (1 - α)⌉₊} ∧
      ((∀ᵐ ω ∂μ, Function.Injective fun i ↦ S i ω) →
        μ.real {ω | (S (Fin.last n) ω : EReal) ≤
          conformalThreshold (fun i : Fin n ↦ S i.castSucc ω) ⌈(n + 1 : ℝ) * (1 - α)⌉₊} ≤
            1 - α + 1 / (n + 1)) := sorry

/-- **5.2** The Cover–Hart inequalities for the asymptotic nearest-neighbour risk
`L_NN = E[2η(1 - η)]` and the Bayes risk `L* = E min(η, 1 - η)`. -/
theorem bayesRisk_le_nnRisk_le {X : Type*} [MeasurableSpace X] (μ : Measure X)
    [IsProbabilityMeasure μ] (η : X → ℝ) (hη : Measurable η) (h01 : ∀ x, η x ∈ Icc (0 : ℝ) 1) :
    (∫ x, min (η x) (1 - η x) ∂μ) ≤ ∫ x, 2 * η x * (1 - η x) ∂μ ∧
      (∫ x, 2 * η x * (1 - η x) ∂μ) ≤
        2 * (∫ x, min (η x) (1 - η x) ∂μ) * (1 - ∫ x, min (η x) (1 - η x) ∂μ) ∧
      2 * (∫ x, min (η x) (1 - η x) ∂μ) * (1 - ∫ x, min (η x) (1 - η x) ∂μ) ≤
        2 * ∫ x, min (η x) (1 - η x) ∂μ := sorry

/-- **5.2** The index of the sample point nearest to `x`, distance ties broken by the smaller
index. -/
def nearestIndex {E : Type*} [Dist E] {n : ℕ} (xs : Fin (n + 1) → E) (x : E) : Fin (n + 1) :=
  (Finset.univ.filter fun i ↦ ∀ j, dist (xs i) x ≤ dist (xs j) x).min' (by
    obtain ⟨i, -, hi⟩ :=
      Finset.exists_min_image Finset.univ (fun i ↦ dist (xs i) x) Finset.univ_nonempty
    exact ⟨i, Finset.mem_filter.2 ⟨Finset.mem_univ _, fun j ↦ hi j (Finset.mem_univ _)⟩⟩)

/-- **5.2** The 1-nearest-neighbour rule: the label of the sample point nearest to `x`. -/
def nnRule {X : Type*} [Dist X] {n : ℕ} (z : Fin (n + 1) → X × Bool) (x : X) : Bool :=
  (z (nearestIndex (fun i ↦ (z i).1) x)).2

/-- **5.2** The 1-NN limit: for every law on `ℝ^d × Bool` with regression function `η`, the
expected error of the 1-nearest-neighbour rule tends to `L(1) = E 2η(1 - η)`. -/
theorem tendsto_integral_classificationError_nnRule {d : ℕ}
    (P : Measure (EuclideanSpace ℝ (Fin d) × Bool)) [IsProbabilityMeasure P]
    (η : EuclideanSpace ℝ (Fin d) → ℝ) (hη : IsRegressionFunction P η) :
    Tendsto (fun n : ℕ ↦ ∫ z, classificationError P (nnRule z)
        ∂(Measure.pi fun _ : Fin (n + 1) ↦ P)) atTop
      (𝓝 (∫ x, 2 * η x * (1 - η x) ∂(P.map Prod.fst))) := sorry

/-- **5.3** Consistency of local weight estimates (Stone): if the weights of a regression estimate
are nonnegative, sum to one, are computed from the test point, the sample points and independent
randomness but not from the responses, and satisfy the domination, locality and no-dominant-weight
conditions, the estimate is consistent in `L²` for every law with `E Y² < ∞`. -/
theorem tendsto_lintegral_weightEstimate_sub_sq {E R : Type*} [MetricSpace E] [MeasurableSpace E]
    [BorelSpace E] [MeasurableSpace R] (P : Measure (E × ℝ)) [IsProbabilityMeasure P]
    (ν : Measure R) [IsProbabilityMeasure ν] (hY : MemLp (fun z : E × ℝ ↦ z.2) 2 P)
    (m : E → ℝ) (hm : Measurable m)
    (hmP : ∀ A : Set E, MeasurableSet A →
      ∫ z in A ×ˢ univ, z.2 ∂P = ∫ x in A, m x ∂(P.map Prod.fst))
    (w : (n : ℕ) → E → (Fin n → E) → R → Fin n → ℝ)
    (hw : ∀ n i, Measurable fun q : E × (Fin n → E) × R ↦ w n q.1 q.2.1 q.2.2 i)
    (hw0 : ∀ n x xs θ i, 0 ≤ w n x xs θ i) (hw1 : ∀ n, 0 < n → ∀ x xs θ, ∑ i, w n x xs θ i = 1)
    (hdom : ∃ C : ℝ, ∀ n, 0 < n → ∀ g : E → ℝ, Measurable g → (∀ e, 0 ≤ g e) →
      (∃ B, ∀ e, g e ≤ B) →
      ∫⁻ q, ENNReal.ofReal (∑ i, w n q.1 (fun i ↦ (q.2.1 i).1) q.2.2 i * g (q.2.1 i).1)
          ∂((P.map Prod.fst).prod ((Measure.pi fun _ : Fin n ↦ P).prod ν)) ≤
        ENNReal.ofReal C * ∫⁻ x, ENNReal.ofReal (g x) ∂(P.map Prod.fst))
    (hloc : ∀ ε : ℝ, 0 < ε → Tendsto (fun n ↦ ∫⁻ q, ENNReal.ofReal
        (∑ i, w n q.1 (fun i ↦ (q.2.1 i).1) q.2.2 i *
          (if ε < dist (q.2.1 i).1 q.1 then 1 else 0))
          ∂((P.map Prod.fst).prod ((Measure.pi fun _ : Fin n ↦ P).prod ν))) atTop (𝓝 0))
    (hmax : Tendsto (fun n ↦ ∫⁻ q, ⨆ i, ENNReal.ofReal (w n q.1 (fun i ↦ (q.2.1 i).1) q.2.2 i)
        ∂((P.map Prod.fst).prod ((Measure.pi fun _ : Fin n ↦ P).prod ν))) atTop (𝓝 0)) :
    Tendsto (fun n ↦ ∫⁻ q, ENNReal.ofReal
        ((∑ i, w n q.1 (fun i ↦ (q.2.1 i).1) q.2.2 i * (q.2.1 i).2 - m q.1) ^ 2)
        ∂((P.map Prod.fst).prod ((Measure.pi fun _ : Fin n ↦ P).prod ν))) atTop (𝓝 0) := sorry

/-- **5.4** The `k`-means risk `E min_{c ∈ C} ‖X - c‖²` of a finite set of centers, valued in
`ℝ≥0∞` (`⊤` for the empty set). -/
def kMeansRisk {E : Type*} [PseudoEMetricSpace E] [MeasurableSpace E] (μ : Measure E)
    (C : Finset E) : ℝ≥0∞ :=
  ∫⁻ x, ⨅ c ∈ C, edist x c ^ 2 ∂μ

/-- **5.4** Consistency of `k`-means (Pollard): if the population `k`-means criterion of a law with
finite second moment has a unique minimizing set of at most `k` centers, the empirical minimizers
converge to it almost surely in the Hausdorff distance. -/
theorem tendsto_hausdorffDist_kMeans {d k : ℕ} {Ω : Type*} [MeasurableSpace Ω] (P : Measure Ω)
    [IsProbabilityMeasure P] (μ : Measure (EuclideanSpace ℝ (Fin d))) [IsProbabilityMeasure μ]
    (hμ : ∫⁻ x, ‖x‖ₑ ^ 2 ∂μ < ⊤) (Cstar : Finset (EuclideanSpace ℝ (Fin d)))
    (hCstar : Cstar.card ≤ k)
    (huniq : ∀ C : Finset (EuclideanSpace ℝ (Fin d)), C.card ≤ k →
      kMeansRisk μ C ≤ kMeansRisk μ Cstar → C = Cstar)
    (Xs : ℕ → Ω → EuclideanSpace ℝ (Fin d)) (hind : iIndepFun Xs P)
    (hlaw : ∀ i, HasLaw (Xs i) μ P) (Cn : ℕ → Ω → Finset (EuclideanSpace ℝ (Fin d)))
    (hCn : ∀ m ω, (Cn m ω).card ≤ k ∧ ∀ C : Finset (EuclideanSpace ℝ (Fin d)), C.card ≤ k →
      kMeansRisk (TauCeti.Probability.empiricalMeasure (fun i ↦ Xs i ω) m : Measure _) (Cn m ω) ≤
        kMeansRisk (TauCeti.Probability.empiricalMeasure (fun i ↦ Xs i ω) m : Measure _) C) :
    ∀ᵐ ω ∂P, Tendsto (fun m ↦ Metric.hausdorffDist (Cn m ω : Set (EuclideanSpace ℝ (Fin d)))
      (Cstar : Set (EuclideanSpace ℝ (Fin d)))) atTop (𝓝 0) := sorry

end Layer5

/-! ## Layer 6: trees, boosting and ensembles -/

section Layer6

/-- **6.1** A finite binary classification tree whose every node carries its resubstitution cost
`R(t)`, the cost of the node if it were made a leaf. -/
inductive CostTree : Type
  | leaf (r : ℝ) : CostTree
  | node (r : ℝ) (left right : CostTree) : CostTree

/-- **6.1** The resubstitution cost `R(T)`, the sum of the costs of the leaves. -/
def CostTree.cost : CostTree → ℝ
  | leaf r => r
  | node _ l r => cost l + cost r

/-- **6.1** The number `|T|` of leaves. -/
def CostTree.numLeaves : CostTree → ℕ
  | leaf _ => 1
  | node _ l r => numLeaves l + numLeaves r

/-- **6.1** The cost-complexity `R_α(T) = R(T) + α |T|`. -/
def CostTree.costComplexity (α : ℝ) (T : CostTree) : ℝ := cost T + α * numLeaves T

/-- **6.1** `IsPruning S T`: `S` is a pruned subtree of `T`, obtained by turning internal nodes
of `T` into leaves. -/
inductive CostTree.IsPruning : CostTree → CostTree → Prop
  | leaf (r : ℝ) : IsPruning (leaf r) (leaf r)
  | prune (r : ℝ) (l l' : CostTree) : IsPruning (leaf r) (node r l l')
  | node (r : ℝ) {l l' m m' : CostTree} : IsPruning l' l → IsPruning m' m →
      IsPruning (node r l' m') (node r l m)

/-- **6.1** `S` is the smallest minimizing pruned subtree of `T` for `R_α`: it minimizes `R_α`
among the pruned subtrees of `T` and is a pruned subtree of every other minimizer. -/
def CostTree.IsSmallestMinimizer (α : ℝ) (T S : CostTree) : Prop :=
  IsPruning S T ∧ (∀ S', IsPruning S' T → costComplexity α S ≤ costComplexity α S') ∧
    ∀ S', IsPruning S' T → (∀ S'', IsPruning S'' T → costComplexity α S' ≤ costComplexity α S'') →
      IsPruning S S'

/-- **6.1** Minimal cost-complexity pruning: for each `α ≥ 0` the smallest minimizing pruned
subtree exists and is unique, and it decreases (as a pruned subtree) when `α` increases. -/
theorem CostTree.existsUnique_isSmallestMinimizer (T : CostTree) :
    (∀ α : ℝ, 0 ≤ α → ∃! S, IsSmallestMinimizer α T S) ∧
      ∀ α α' : ℝ, 0 ≤ α → α ≤ α' → ∀ S S', IsSmallestMinimizer α T S →
        IsSmallestMinimizer α' T S' → IsPruning S' S := sorry

/-- **6.2** The impurity decrease of a split is nonnegative for a strictly concave impurity, and
vanishes exactly when both children have the class proportions of the parent. The first conjunct
is a sanity check (concavity, by `linarith`); the target is the second. -/
theorem impurityDecrease_nonneg {J : ℕ} (φ : (Fin J → ℝ) → ℝ)
    (hφ : StrictConcaveOn ℝ {q | (∀ j, 0 ≤ q j) ∧ ∑ j, q j = 1} φ) (qL qR : Fin J → ℝ)
    (hqL0 : ∀ j, 0 ≤ qL j) (hqL1 : ∑ j, qL j = 1) (hqR0 : ∀ j, 0 ≤ qR j) (hqR1 : ∑ j, qR j = 1)
    (pL pR : ℝ)
    (hpL : 0 < pL) (hpR : 0 < pR) (hp : pL + pR = 1) :
    0 ≤ φ (pL • qL + pR • qR) - pL * φ qL - pR * φ qR ∧
      (φ (pL • qL + pR • qR) - pL * φ qL - pR * φ qR = 0 ↔ qL = qR) := sorry

/-- **6.3** Descent of `L²` boosting: a base learner whose correlation with the residual is at
least `γ` and a shrunken least-squares step contract the squared residual by
`1 - ν(2 - ν)γ²`, and geometrically along the iteration. -/
theorem boosting_descent {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
    (r h : ℕ → E) (γ ν : ℝ) (hγ : 0 < γ) (hν : 0 < ν) (hν2 : ν < 2)
    (hcorr : ∀ m, γ * ‖r m‖ * ‖h m‖ ≤ ⟪r m, h m⟫_ℝ) (hh : ∀ m, h m ≠ 0)
    (hstep : ∀ m, r (m + 1) = r m - (ν * (⟪r m, h m⟫_ℝ / ‖h m‖ ^ 2)) • h m) :
    (∀ m, ‖r (m + 1)‖ ^ 2 ≤ (1 - ν * (2 - ν) * γ ^ 2) * ‖r m‖ ^ 2) ∧
      ∀ m, ‖r m‖ ^ 2 ≤ (1 - ν * (2 - ν) * γ ^ 2) ^ m * ‖r 0‖ ^ 2 := sorry

/-- **6.4** The variance `σ²(ρ + (1 - ρ)/B)` of the average of `B` predictions with common variance
`σ²` and common pairwise covariance `ρσ²`. -/
theorem variance_ensembleAverage {Ω : Type*} [MeasurableSpace Ω] (μ : Measure Ω)
    [IsProbabilityMeasure μ] {B : ℕ} (hB : 0 < B) (f : Fin B → Ω → ℝ) (hf : ∀ i, MemLp (f i) 2 μ)
    (σ ρ : ℝ) (hvar : ∀ i, variance (f i) μ = σ ^ 2)
    (hcov : ∀ i j, i ≠ j → covariance (f i) (f j) μ = ρ * σ ^ 2) :
    variance (fun ω ↦ (∑ i, f i ω) / B) μ = σ ^ 2 * (ρ + (1 - ρ) / B) := sorry

/-- **6.5** The AdaBoost distribution `D(i) ∝ exp(-y_i F(x_i))` on the sample for a current
score. -/
def adaDist {m : ℕ} (y F : Fin m → ℝ) (i : Fin m) : ℝ :=
  Real.exp (-(y i * F i)) / ∑ j, Real.exp (-(y j * F j))

/-- **6.5** The AdaBoost scores on the sample: `F 0 = 0` and `F (t + 1) = F t + α_t H t`, with
`α_t = (1/2) log((1 - ε_t)/ε_t)` for the weighted error `ε_t` of the base predictions `H t`. -/
def adaScore {m : ℕ} (y : Fin m → ℝ) (H : ℕ → Fin m → ℝ) : ℕ → Fin m → ℝ
  | 0 => 0
  | t + 1 =>
    adaScore y H t +
      ((1 / 2 : ℝ) * Real.log ((1 - ∑ i, adaDist y (adaScore y H t) i *
          (if H t i = y i then 0 else 1)) /
        ∑ i, adaDist y (adaScore y H t) i * (if H t i = y i then 0 else 1))) • H t

/-- **6.5** The weighted error `ε_t` of round `t`. -/
def adaError {m : ℕ} (y : Fin m → ℝ) (H : ℕ → Fin m → ℝ) (t : ℕ) : ℝ :=
  ∑ i, adaDist y (adaScore y H t) i * (if H t i = y i then 0 else 1)

/-- **6.5** The coefficient `α_t = (1/2) log((1 - ε_t)/ε_t)` of round `t`. -/
def adaAlpha {m : ℕ} (y : Fin m → ℝ) (H : ℕ → Fin m → ℝ) (t : ℕ) : ℝ :=
  (1 / 2) * Real.log ((1 - adaError y H t) / adaError y H t)

/-- **6.5** AdaBoost: the training error after `T` rounds is at most `∏ 2√(ε_t(1 - ε_t))`, which is
at most `exp(-2 ∑ (1/2 - ε_t)²)`; the fraction of normalized margins at most `ρ` is at most
`2^T ∏ √(ε_t^(1-ρ)(1 - ε_t)^(1+ρ))`; and each `α_t` minimizes the exponential loss along `H t`. -/
theorem adaBoost_bounds {m : ℕ} (hm : 0 < m) (y : Fin m → ℝ) (hy : ∀ i, y i = 1 ∨ y i = -1)
    (H : ℕ → Fin m → ℝ) (hH : ∀ t i, H t i = 1 ∨ H t i = -1) (T : ℕ)
    (hε : ∀ t < T, 0 < adaError y H t ∧ adaError y H t < 1 / 2) :
    ((Finset.univ.filter fun i ↦ y i * adaScore y H T i ≤ 0).card : ℝ) / m ≤
        ∏ t ∈ Finset.range T, 2 * √(adaError y H t * (1 - adaError y H t)) ∧
      ∏ t ∈ Finset.range T, 2 * √(adaError y H t * (1 - adaError y H t)) ≤
        Real.exp (-(2 * ∑ t ∈ Finset.range T, (1 / 2 - adaError y H t) ^ 2)) ∧
      (∀ ρ : ℝ, 0 ≤ ρ →
        ((Finset.univ.filter fun i ↦
            y i * adaScore y H T i ≤ ρ * ∑ t ∈ Finset.range T, adaAlpha y H t).card : ℝ) / m ≤
          2 ^ T * ∏ t ∈ Finset.range T,
            √(adaError y H t ^ (1 - ρ) * (1 - adaError y H t) ^ (1 + ρ))) ∧
      ∀ t < T, IsMinOn (fun a : ℝ ↦ ∑ i, Real.exp (-(y i * (adaScore y H t i + a * H t i)))) univ
        (adaAlpha y H t) := sorry

end Layer6

/-! ## Layer 7: differential privacy -/

section Layer7

variable {X : Type*}

/-- **7.1** `(ε, δ)`-differential privacy of a randomized algorithm on data sets of `n` records:
for data sets differing in at most one record and every measurable event,
`P(M(D) ∈ A) ≤ e^ε P(M(D') ∈ A) + δ`. -/
def IsDifferentiallyPrivate {Y : Type*} [MeasurableSpace Y] {n : ℕ} (M : (Fin n → X) → Measure Y)
    (ε δ : ℝ) : Prop :=
  ∀ D D' : Fin n → X, hammingDist D D' ≤ 1 → ∀ A : Set Y, MeasurableSet A →
    (M D).real A ≤ Real.exp ε * (M D').real A + δ

/-- **7.1** `ε`-local privacy of a release kernel: `Q(B | x) ≤ e^ε Q(B | x')` for all inputs. -/
def IsLocallyPrivate {Y : Type*} [MeasurableSpace Y] (Q : X → Measure Y) (ε : ℝ) : Prop :=
  ∀ x x' : X, ∀ B : Set Y, MeasurableSet B → (Q x).real B ≤ Real.exp ε * (Q x').real B

/-- **7.1** Post-processing and group privacy: a Markov kernel applied to a private release is
private with the same parameters, and an `ε`-private algorithm compares data sets at Hamming
distance `k` with the factor `e^(kε)`. -/
theorem isDifferentiallyPrivate_postProcess {Y Y' : Type*} [MeasurableSpace Y]
    [MeasurableSpace Y'] {n : ℕ} (M : (Fin n → X) → Measure Y)
    (hM : ∀ D, IsProbabilityMeasure (M D)) (ε δ : ℝ) (hdp : IsDifferentiallyPrivate M ε δ) :
    (∀ K : Kernel Y Y', IsMarkovKernel K → IsDifferentiallyPrivate (fun D ↦ K ∘ₘ M D) ε δ) ∧
      (δ = 0 → ∀ k : ℕ, ∀ D D' : Fin n → X, hammingDist D D' ≤ k → ∀ A : Set Y,
        MeasurableSet A → (M D).real A ≤ Real.exp (k * ε) * (M D').real A) := sorry

/-- **7.2** The Laplace mechanism: independent `Lap(b)` noise added to each coordinate of a vector
query. -/
def laplaceMechanism {n k : ℕ} (f : (Fin n → X) → Fin k → ℝ) (b : ℝ) (D : Fin n → X) :
    Measure (Fin k → ℝ) :=
  Measure.pi fun j ↦ TauCeti.Probability.laplaceMeasure (f D j) b

/-- **7.2** The Laplace mechanism with scale `Δ/ε` for a query of `ℓ¹` sensitivity at most `Δ` is
`ε`-differentially private. -/
theorem isDifferentiallyPrivate_laplaceMechanism {n k : ℕ} (f : (Fin n → X) → Fin k → ℝ)
    (Δ ε : ℝ) (hΔ : 0 < Δ) (hε : 0 < ε)
    (hsens : ∀ D D', hammingDist D D' ≤ 1 → ∑ j, |f D j - f D' j| ≤ Δ) :
    IsDifferentiallyPrivate (laplaceMechanism f (Δ / ε)) ε 0 := sorry

/-- **7.2** The Gaussian mechanism: independent `N(0, s²)` noise added to each coordinate. -/
def gaussianMechanism {n k : ℕ} (f : (Fin n → X) → Fin k → ℝ) (s : ℝ≥0) (D : Fin n → X) :
    Measure (Fin k → ℝ) :=
  Measure.pi fun j ↦ gaussianReal (f D j) (s ^ 2)

/-- **7.2** The Gaussian mechanism with `s ≥ c Δ₂/ε`, `c² > 2 log(1.25/δ)` and `ε, δ ∈ (0, 1)` is
`(ε, δ)`-differentially private for a query of Euclidean sensitivity at most `Δ₂`. -/
theorem isDifferentiallyPrivate_gaussianMechanism {n k : ℕ} (f : (Fin n → X) → Fin k → ℝ)
    (Δ₂ ε δ c : ℝ) (s : ℝ≥0) (hΔ : 0 < Δ₂) (hε : 0 < ε) (hε1 : ε < 1) (hδ : 0 < δ) (hδ1 : δ < 1)
    (hc : 0 < c) (hc2 : 2 * Real.log (1.25 / δ) < c ^ 2) (hs : c * Δ₂ / ε ≤ s)
    (hsens : ∀ D D', hammingDist D D' ≤ 1 → √(∑ j, (f D j - f D' j) ^ 2) ≤ Δ₂) :
    IsDifferentiallyPrivate (gaussianMechanism f s) ε δ := sorry

/-- **7.2** The exponential mechanism on a finite output set: output `r` with probability
proportional to `exp(ε u(D, r)/(2Δu))`. -/
def exponentialMechanism {R : Type*} [Fintype R] [MeasurableSpace R] {n : ℕ}
    (u : (Fin n → X) → R → ℝ) (ε Δu : ℝ) (D : Fin n → X) : Measure R :=
  ∑ r, ENNReal.ofReal (Real.exp (ε * u D r / (2 * Δu)) /
    ∑ r', Real.exp (ε * u D r' / (2 * Δu))) • Measure.dirac r

/-- **7.2** The exponential mechanism is `ε`-differentially private, and its released utility
falls `(2Δu/ε)(log|R| + log(1/η))` below the utility of any output with probability at most `η`. -/
theorem exponentialMechanism_spec {R : Type*} [Fintype R] [Nonempty R] [MeasurableSpace R]
    [MeasurableSingletonClass R] {n : ℕ} (u : (Fin n → X) → R → ℝ) (ε Δu : ℝ) (hε : 0 < ε)
    (hΔ : 0 < Δu) (hsens : ∀ D D', hammingDist D D' ≤ 1 → ∀ r, |u D r - u D' r| ≤ Δu) :
    IsDifferentiallyPrivate (exponentialMechanism u ε Δu) ε 0 ∧
      ∀ (D : Fin n → X) (r₀ : R) (η : ℝ), 0 < η → η ≤ 1 →
        (exponentialMechanism u ε Δu D).real {r | u D r ≤
          u D r₀ - 2 * Δu / ε * (Real.log (Fintype.card R) + Real.log (1 / η))} ≤ η := sorry

/-- **7.3** Basic adaptive composition of two mechanisms, the second seeing the release of the
first: privacy parameters add. -/
theorem isDifferentiallyPrivate_compProd {Y₁ Y₂ : Type*} [MeasurableSpace Y₁]
    [MeasurableSpace Y₂] {n : ℕ} (M₁ : (Fin n → X) → Measure Y₁)
    (hM₁ : ∀ D, IsProbabilityMeasure (M₁ D)) (M₂ : (Fin n → X) → Kernel Y₁ Y₂)
    (hM₂ : ∀ D, IsMarkovKernel (M₂ D)) (ε₁ ε₂ δ₁ δ₂ : ℝ) (hε₁ : 0 ≤ ε₁) (hε₂ : 0 ≤ ε₂)
    (hδ₁ : 0 ≤ δ₁) (hδ₂ : 0 ≤ δ₂) (h₁ : IsDifferentiallyPrivate M₁ ε₁ δ₁)
    (h₂ : ∀ y, IsDifferentiallyPrivate (fun D ↦ M₂ D y) ε₂ δ₂) :
    IsDifferentiallyPrivate (fun D ↦ M₁ D ⊗ₘ M₂ D) (ε₁ + ε₂) (δ₁ + δ₂) := sorry

/-- **7.4** The randomized-response rate `ρ_ε = (e^ε - 1)/(e^ε + 1)`. -/
def rrRate (ε : ℝ) : ℝ := (Real.exp ε - 1) / (Real.exp ε + 1)

/-- **7.4** Randomized response on `[-1, 1]`: release `±1` with `P(1 | x) = (1 + ρ_ε x)/2`. -/
def randomizedResponse (ε x : ℝ) : Measure ℝ :=
  ENNReal.ofReal ((1 + rrRate ε * x) / 2) • Measure.dirac 1 +
    ENNReal.ofReal ((1 - rrRate ε * x) / 2) • Measure.dirac (-1)

/-- **7.4** Clipping to `[-1, 1]`. -/
def clipUnit (t : ℝ) : ℝ := max (-1) (min 1 t)

/-- **7.4** Randomized response is `ε`-locally private on `[-1, 1]` with conditional mean `ρ_ε x`;
the rescaled mean of `n` independent releases is unbiased for the population mean with variance
at most `1/(nρ_ε²)`, and its clipping has mean squared error at most `min(4, 1/(nρ_ε²))`. -/
theorem randomizedResponse_spec (ε : ℝ) (hε : 0 < ε) :
    IsLocallyPrivate (fun x : Icc (-1 : ℝ) 1 ↦ randomizedResponse ε x) ε ∧
      (∀ x ∈ Icc (-1 : ℝ) 1, ∫ z, z ∂(randomizedResponse ε x) = rrRate ε * x) ∧
      ∀ (P : Measure ℝ), IsProbabilityMeasure P → P (Icc (-1 : ℝ) 1)ᶜ = 0 → ∀ n : ℕ, 0 < n →
        ∫ z, (∑ i, z i) / (n * rrRate ε)
            ∂(Measure.pi fun _ : Fin n ↦ P.bind (randomizedResponse ε)) = ∫ x, x ∂P ∧
        ∫ z, ((∑ i, z i) / (n * rrRate ε) - ∫ x, x ∂P) ^ 2
            ∂(Measure.pi fun _ : Fin n ↦ P.bind (randomizedResponse ε)) ≤
          1 / (n * rrRate ε ^ 2) ∧
        ∫ z, (clipUnit ((∑ i, z i) / (n * rrRate ε)) - ∫ x, x ∂P) ^ 2
            ∂(Measure.pi fun _ : Fin n ↦ P.bind (randomizedResponse ε)) ≤
          min 4 (1 / (n * rrRate ε ^ 2)) := sorry

/-- **7.4** Contraction under local privacy (Duchi–Jordan–Wainwright): the symmetrized relative
entropy between the release laws is at most `4(e^ε - 1)²` times the squared total variation
distance `sup_B |P₁(B) - P₂(B)| = tvDist P₁ P₂ / 2` of the input laws. -/
theorem klDiv_add_klDiv_le_of_isLocallyPrivate [MeasurableSpace X] {Y : Type*}
    [MeasurableSpace Y] (Q : Kernel X Y) [IsMarkovKernel Q] (ε : ℝ) (hε : 0 ≤ ε)
    (hQ : IsLocallyPrivate (fun x ↦ Q x) ε) (P₁ P₂ : Measure X) [IsProbabilityMeasure P₁]
    [IsProbabilityMeasure P₂] :
    klDiv (Q ∘ₘ P₁) (Q ∘ₘ P₂) + klDiv (Q ∘ₘ P₂) (Q ∘ₘ P₁) ≤
      ENNReal.ofReal (4 * (Real.exp ε - 1) ^ 2 * (tvDist P₁ P₂ / 2) ^ 2) := sorry

/-- **7.5** The minimax mean squared error for the mean of a law on `[-1, 1]` over estimators
computed from `n` noninteractive `ε`-locally private releases with values in `ℝ`. -/
def localMinimaxMeanRisk (n : ℕ) (ε : ℝ) : ℝ≥0∞ :=
  ⨅ (Q : Fin n → Kernel ℝ ℝ)
    (_ : ∀ i, IsMarkovKernel (Q i) ∧ IsLocallyPrivate (fun x : Icc (-1 : ℝ) 1 ↦ Q i x) ε)
    (est : (Fin n → ℝ) → ℝ) (_ : Measurable est),
    ⨆ (P : Measure ℝ) (_ : IsProbabilityMeasure P ∧ P (Icc (-1 : ℝ) 1)ᶜ = 0),
      ∫⁻ z, ENNReal.ofReal ((est z - ∫ x, x ∂P) ^ 2) ∂(Measure.pi fun i ↦ Q i ∘ₘ P)

/-- **7.5** The minimax mean squared error for the mean of a law on `[-1, 1]` over
`ε`-differentially private estimators from `n` independent observations. -/
def centralMinimaxMeanRisk (n : ℕ) (ε : ℝ) : ℝ≥0∞ :=
  ⨅ (M : Kernel (Fin n → ℝ) ℝ) (_ : IsMarkovKernel M ∧ IsDifferentiallyPrivate (fun D ↦ M D) ε 0),
    ⨆ (P : Measure ℝ) (_ : IsProbabilityMeasure P ∧ P (Icc (-1 : ℝ) 1)ᶜ = 0),
      ∫⁻ D, ∫⁻ y, ENNReal.ofReal ((y - ∫ x, x ∂P) ^ 2) ∂(M D) ∂(Measure.pi fun _ : Fin n ↦ P)

/-- **7.5** Private mean estimation: for `0 < ε ≤ 1` the local minimax risk is of order
`min(1, 1/(nε²))` and the central one of order `min(1, 1/n + 1/(nε)²)`. -/
theorem privateMean_minimax : ∃ c C : ℝ, 0 < c ∧ c ≤ C ∧ ∀ n : ℕ, 0 < n → ∀ ε : ℝ, 0 < ε →
    ε ≤ 1 →
    ENNReal.ofReal (c * min 1 (1 / (n * ε ^ 2))) ≤ localMinimaxMeanRisk n ε ∧
    localMinimaxMeanRisk n ε ≤ ENNReal.ofReal (C * min 1 (1 / (n * ε ^ 2))) ∧
    ENNReal.ofReal (c * min 1 (1 / n + 1 / (n * ε) ^ 2)) ≤ centralMinimaxMeanRisk n ε ∧
    centralMinimaxMeanRisk n ε ≤ ENNReal.ofReal (C * min 1 (1 / n + 1 / (n * ε) ^ 2)) := sorry

/-- **7.6** The halting index of AboveThreshold on `k` queries with noisy threshold `t` and query
noise `ν`: the first `i < k` with `q i + ν i ≥ t`, and `k` when there is none. -/
def aboveThresholdIndex {k : ℕ} (q ν : Fin k → ℝ) (t : ℝ) : ℕ :=
  if h : ∃ i : ℕ, ∃ hi : i < k, t ≤ q ⟨i, hi⟩ + ν ⟨i, hi⟩ then Nat.find h else k

/-- **7.6** The law of the halting index of AboveThreshold: threshold noise `Lap(2/ε)` and
independent query noise `Lap(4/ε)`. -/
def aboveThreshold {n : ℕ} (f : ℕ → (Fin n → X) → ℝ) (T ε : ℝ) (k : ℕ) (D : Fin n → X) :
    Measure ℕ :=
  ((TauCeti.Probability.laplaceMeasure T (2 / ε)).prod
      (Measure.pi fun _ : Fin k ↦ TauCeti.Probability.laplaceMeasure 0 (4 / ε))).map
    fun p ↦ aboveThresholdIndex (fun i : Fin k ↦ f i D) p.2 p.1

/-- **7.6** The sparse vector technique: AboveThreshold on sensitivity-one queries is
`ε`-differentially private for every number of queries, and, when among the first `k` queries only
the last can reach `T - α`, it is `(α, β)`-accurate with `α = 8(log k + log(2/β))/ε`. -/
theorem aboveThreshold_spec {n : ℕ} (f : ℕ → (Fin n → X) → ℝ) (T ε : ℝ) (hε : 0 < ε)
    (hsens : ∀ i D D', hammingDist D D' ≤ 1 → |f i D - f i D'| ≤ 1) :
    (∀ k, IsDifferentiallyPrivate (aboveThreshold f T ε k) ε 0) ∧
      ∀ k : ℕ, 0 < k → ∀ β : ℝ, 0 < β → β < 1 → ∀ D : Fin n → X,
        (∀ i < k - 1, f i D < T - 8 * (Real.log k + Real.log (2 / β)) / ε) →
        (aboveThreshold f T ε k D).real {j | ¬ (k - 1 ≤ j ∧
          (j < k → T - 8 * (Real.log k + Real.log (2 / β)) / ε ≤ f j D) ∧
          ∀ i < j, i < k → f i D ≤ T + 8 * (Real.log k + Real.log (2 / β)) / ε)} ≤ β := sorry

end Layer7

/-! ## Layer 8: fairness criteria and distribution shift -/

section Layer8

/-- **8.1** Separation and sufficiency together force the score to determine the outcome: with all
four outcome-group cells of positive probability and unequal group base rates, a score that is
conditionally independent of the group given the outcome, and such that the outcome is
conditionally independent of the group given the score, determines the outcome almost surely. -/
theorem exists_ae_eq_comp_of_separation_of_sufficiency {Ω : Type*} [MeasurableSpace Ω]
    [StandardBorelSpace Ω] (μ : Measure Ω) [IsProbabilityMeasure μ] (S : Ω → ℝ) (A Y : Ω → Bool)
    (hS : Measurable S) (hA : Measurable A) (hY : Measurable Y)
    (hcell : ∀ a y, 0 < μ {ω | A ω = a ∧ Y ω = y})
    (hbase : μ.real {ω | Y ω = true ∧ A ω = false} / μ.real {ω | A ω = false} ≠
      μ.real {ω | Y ω = true ∧ A ω = true} / μ.real {ω | A ω = true})
    (hsep : S ⟂ᵢ[Y, hY; μ] A) (hsuf : Y ⟂ᵢ[S, hS; μ] A) :
    ∃ g : ℝ → Bool, Measurable g ∧ Y =ᵐ[μ] g ∘ S := sorry

/-- **8.1** Independence against the conditional criteria: if the group and the outcome are
dependent, independence and sufficiency cannot both hold, nor (when the score and the outcome are
also dependent) independence and separation; and a sufficient score recalibrated by
`ℓ(s) = P(Y = true | S = s)` is calibrated within groups. -/
theorem fairness_criteria {Ω : Type*} [MeasurableSpace Ω] [StandardBorelSpace Ω] (μ : Measure Ω)
    [IsProbabilityMeasure μ] (S : Ω → ℝ) (A Y : Ω → Bool) (hS : Measurable S) (hA : Measurable A)
    (hY : Measurable Y) :
    (¬ IndepFun A Y μ → ¬ (IndepFun S A μ ∧ Y ⟂ᵢ[S, hS; μ] A)) ∧
      (¬ IndepFun A Y μ → ¬ IndepFun S Y μ → ¬ (IndepFun S A μ ∧ S ⟂ᵢ[Y, hY; μ] A)) ∧
      (Y ⟂ᵢ[S, hS; μ] A → ∀ ℓ : ℝ → ℝ, Measurable ℓ →
        μ[fun ω ↦ if Y ω then (1 : ℝ) else 0 | MeasurableSpace.comap S inferInstance] =ᵐ[μ] ℓ ∘ S →
        μ[fun ω ↦ if Y ω then (1 : ℝ) else 0 |
            MeasurableSpace.comap (fun ω ↦ (ℓ (S ω), A ω)) inferInstance] =ᵐ[μ] ℓ ∘ S) := sorry

/-- **8.2** Covariate shift: with a common conditional law of the response and `μT ≪ μS`, the
target risk of an integrable loss is the source risk weighted by `dμT/dμS`. -/
theorem integral_compProd_eq_integral_rnDeriv_mul {X Y : Type*} [MeasurableSpace X]
    [MeasurableSpace Y] (μS μT : Measure X) [IsFiniteMeasure μS] [IsFiniteMeasure μT]
    (κ : Kernel X Y) [IsMarkovKernel κ] (hac : μT ≪ μS) (L : X × Y → ℝ)
    (hL : Integrable L (μT ⊗ₘ κ)) :
    ∫ z, L z ∂(μT ⊗ₘ κ) = ∫ z, (μT.rnDeriv μS z.1).toReal * L z ∂(μS ⊗ₘ κ) := sorry

/-- **8.2** The `HΔH`-divergence `2 sup_{h, h' ∈ H} |P_S(h ≠ h') - P_T(h ≠ h')|` of the feature
marginals of two laws. -/
def hDeltaHDivergence {X : Type*} [MeasurableSpace X] (H : Set (X → Bool))
    (PS PT : Measure (X × Bool)) : ℝ :=
  2 * ⨆ p : H × H,
    |PS.real {z | (p.1 : X → Bool) z.1 ≠ (p.2 : X → Bool) z.1} -
      PT.real {z | (p.1 : X → Bool) z.1 ≠ (p.2 : X → Bool) z.1}|

/-- **8.2** The domain-adaptation bound: target error is at most source error plus half the
`HΔH`-divergence plus the best joint error `inf_g (R_S(g) + R_T(g))` in the class. -/
theorem classificationError_target_le {X : Type*} [MeasurableSpace X] (PS PT : Measure (X × Bool))
    [IsProbabilityMeasure PS] [IsProbabilityMeasure PT] (H : Set (X → Bool)) (h : X → Bool)
    (hh : h ∈ H) :
    classificationError PT h ≤ classificationError PS h + 1 / 2 * hDeltaHDivergence H PS PT +
      ⨅ g : H, (classificationError PS g + classificationError PT g) := sorry

/-- **8.2** Importance-weighted validation under bounded weights: the weighted mean of `n` source
losses is unbiased for the target risk, has variance at most `B/n`, and deviates by more than
`√(2B log(2/δ)/n) + 2B log(2/δ)/(3n)` with probability at most `δ`. -/
theorem importanceWeighted_risk_spec {X Y : Type*} [MeasurableSpace X] [MeasurableSpace Y]
    (PS : Measure (X × Y)) [IsProbabilityMeasure PS] (w : X → ℝ) (hw : Measurable w) (B : ℝ)
    (hwB : ∀ x, w x ∈ Icc 0 B) (hw1 : ∫ z, w z.1 ∂PS = 1) (L : X × Y → ℝ) (hL : Measurable L)
    (hL01 : ∀ z, L z ∈ Icc (0 : ℝ) 1) (n : ℕ) (hn : 0 < n) :
    ∫ z, empiricalMean (fun u : X × Y ↦ w u.1 * L u) z ∂(Measure.pi fun _ : Fin n ↦ PS) =
        ∫ u, w u.1 * L u ∂PS ∧
      ∫ z, (empiricalMean (fun u : X × Y ↦ w u.1 * L u) z - ∫ u, w u.1 * L u ∂PS) ^ 2
          ∂(Measure.pi fun _ : Fin n ↦ PS) ≤ B / n ∧
      ∀ δ : ℝ, 0 < δ → δ < 1 → (Measure.pi fun _ : Fin n ↦ PS).real {z |
        √(2 * B * Real.log (2 / δ) / n) + 2 * B * Real.log (2 / δ) / (3 * n) <
          |empiricalMean (fun u : X × Y ↦ w u.1 * L u) z - ∫ u, w u.1 * L u ∂PS|} ≤ δ := sorry

/-- **8.3** Label shift: with common class-conditional laws, the target posterior is the reweighted
source posterior, target risk is source risk weighted by `w_Y = p_T(Y)/p_S(Y)`, and the target
law of the predictions of a fixed classifier is `C w` for its source confusion matrix `C`, so that
`w = C⁻¹ q` when `C` is invertible. -/
theorem labelShift_spec {K : ℕ} {X : Type*} [MeasurableSpace X] (pS pT : Measure (Fin K))
    [IsProbabilityMeasure pS] [IsProbabilityMeasure pT] (hpS : ∀ j, 0 < pS {j})
    (κ : Kernel (Fin K) X) [IsMarkovKernel κ] (q : X → Fin K → ℝ) (hq : ∀ j, Measurable (q · j))
    (hqS : ∀ j (B : Set X), MeasurableSet B →
      (pS ⊗ₘ κ).real ({j} ×ˢ B) = ∫ x in B, q x j ∂((pS ⊗ₘ κ).map Prod.snd)) :
    (∀ j (B : Set X), MeasurableSet B → (pT ⊗ₘ κ).real ({j} ×ˢ B) =
        ∫ x in B, (pT.real {j} / pS.real {j}) * q x j /
          ∑ l, (pT.real {l} / pS.real {l}) * q x l ∂((pT ⊗ₘ κ).map Prod.snd)) ∧
      (∀ L : Fin K × X → ℝ, Integrable L (pT ⊗ₘ κ) →
        ∫ z, L z ∂(pT ⊗ₘ κ) = ∫ z, (pT.real {z.1} / pS.real {z.1}) * L z ∂(pS ⊗ₘ κ)) ∧
      ∀ h : X → Fin K, Measurable h →
        (fun i ↦ (pT ⊗ₘ κ).real {z | h z.2 = i}) =
            (Matrix.of fun i j ↦ (pS ⊗ₘ κ).real {z | z.1 = j ∧ h z.2 = i}) *ᵥ
              (fun j ↦ pT.real {j} / pS.real {j}) ∧
          (IsUnit (Matrix.of fun i j ↦ (pS ⊗ₘ κ).real {z | z.1 = j ∧ h z.2 = i}).det →
            (fun j ↦ pT.real {j} / pS.real {j}) =
              (Matrix.of fun i j ↦ (pS ⊗ₘ κ).real {z | z.1 = j ∧ h z.2 = i})⁻¹ *ᵥ
                (fun i ↦ (pT ⊗ₘ κ).real {z | h z.2 = i})) := sorry

end Layer8

/-! ## Supplier declarations named in the README -/

#check @Finset.vcDim
#check @Finset.card_shatterer_le_sum_vcDim
#check @RKHS
#check @RKHS.kernel
#check @RKHS.kerFun
#check @RKHS.norm_apply_le
#check @ProbabilityTheory.CondIndepFun
#check @ProbabilityTheory.condIndepFun_iff
#check @ProbabilityTheory.HasSubgaussianMGF
#check @ProbabilityTheory.measure_sum_ge_le_of_hasCondSubgaussianMGF
#check @MeasureTheory.tvDist
#check @InformationTheory.klDiv
#check @Metric.hausdorffDist
#check @hammingDist
#check @ProbabilityTheory.gaussianReal
#check @ProbabilityTheory.variance
#check @ProbabilityTheory.covariance
#check @MeasureTheory.Measure.compProd
#check @MeasureTheory.Measure.rnDeriv
#check @Matrix.IsHermitian.eigenvalues
#check @EReal.toReal
#check @MeasureTheory.Measure.real
#check @Metric.packingNumber
#check @RKHS.inner_kerFun
#check @RKHS.posSemidef_kernel
#check @MeasureTheory.condExp
#check @TauCeti.Probability.hasSubgaussianMGF_of_bounded_differences_fin
#check @ProbabilityTheory.iIndepFun.measureReal_abs_sum_ge_le_of_abs_le
#check @TauCeti.Probability.laplaceMeasure
#check @TauCeti.Probability.isProbabilityMeasure_laplaceMeasure
#check @TauCeti.Probability.ExchangeableFamily
#check @TauCeti.Probability.empiricalMeasure
#check @TauCeti.orderStatistic
#check @TauCeti.tendsto_wassersteinEDist_empiricalMeasure_ae
#check @TauCeti.wassersteinQuantizationError
#check @TauCeti.exists_wassersteinEDist_eq_wassersteinQuantizationError
#check @TauCeti.klDiv_compProd_eq_add_lintegral
#check @TauCeti.klDiv_prod_prod_eq_add

end TauCetiRoadmap.StatisticalLearningTheory
