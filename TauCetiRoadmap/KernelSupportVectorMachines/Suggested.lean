import Mathlib
import TauCeti.Analysis.PositiveDefinite.Kernel.Universal

/-!
# Kernel support vector machines: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the
few definitions they need; every definition has a real body. Every headline theorem of the README
is statable at the pins and is stated here.

A reproducing-kernel Hilbert space of real functions on `X` is Mathlib's `RKHS ℝ H X ℝ`, with
scalar kernel `K(x, y) = RKHS.kernel H x y 1`. A sample is `S : Fin n → X × Bool`; labels are read
as `±1` through `labelSign`. The machine `svm H lam S` minimizes
`n⁻¹ Σ max 0 (1 - y_i h(x_i)) + lam ‖h‖²` over `H` (no offset); the soft-margin problem with
offset is the objective `softObjective` of the roadmap SupportVectorMachines on the family
`K(·, x_i)` of `H`. Risks follow the roadmap StatisticalLearningTheory: samples of size `n` under
`Measure.pi`, surrogate risks in `ℝ≥0∞`, misclassification probabilities as `Measure.real`.

Definitions of other roadmaps that the statements mention are copied verbatim, each with a
docstring naming its owner and section: from StatisticalLearningTheory `labelSign`,
`classificationError`, `IsRegressionFunction`, `bayesClassifier`, `surrogateRisk`, `marginError`,
`rampLoss` and `empiricalMarginLoss`; from SupportVectorMachines `softObjective`; from
ThresholdFunctionsAndMargins `margin`; from KernelsAndSpectralMethods `gaussianKernel`.
-/

noncomputable section

open Finset MeasureTheory Filter Set Topology
open scoped ENNReal

namespace TauCetiRoadmap.KernelSupportVectorMachines

/-! ## Definitions copied verbatim from StatisticalLearningTheory -/

section CopiedFromStatisticalLearningTheory

variable {X : Type*} [MeasurableSpace X]

/-- 1.1 (copied verbatim from StatisticalLearningTheory 1.1): the sign `±1` of a Boolean label:
`true ↦ 1`, `false ↦ -1`. -/
def labelSign (b : Bool) : ℝ := if b then 1 else -1

/-- 2.2 (copied verbatim from StatisticalLearningTheory 1.1): the misclassification probability
`P(h(X) ≠ Y)` of a classifier, an outer probability when `h` is not measurable. -/
def classificationError (P : Measure (X × Bool)) (h : X → Bool) : ℝ :=
  P.real {z | h z.1 ≠ z.2}

/-- 3.1 (copied verbatim from StatisticalLearningTheory 1.2): `η` is a version of the regression
function `x ↦ P(Y = true | X = x)`: measurable, with values in `[0, 1]`, and integrating to
`P(X ∈ A, Y = true)` over every measurable `A`. -/
def IsRegressionFunction (P : Measure (X × Bool)) (η : X → ℝ) : Prop :=
  Measurable η ∧ (∀ x, η x ∈ Icc (0 : ℝ) 1) ∧
    ∀ A : Set X, MeasurableSet A → P.real (A ×ˢ {true}) = ∫ x in A, η x ∂(P.map Prod.fst)

/-- 3.1 (copied verbatim from StatisticalLearningTheory 1.2): the plug-in classifier of a score
`η`, predicting `true` where `η ≥ 1/2`; for the regression function it is the Bayes
classifier. -/
def bayesClassifier (η : X → ℝ) (x : X) : Bool := decide ((1 : ℝ) / 2 ≤ η x)

/-- 2.2 (copied verbatim from StatisticalLearningTheory 1.4): the surrogate risk
`E Φ(-Y h(X))` with `Y = ±1`, valued in `ℝ≥0∞`. -/
def surrogateRisk (P : Measure (X × Bool)) (Φ : ℝ → ℝ) (h : X → ℝ) : ℝ≥0∞ :=
  ∫⁻ z, ENNReal.ofReal (Φ (-(labelSign z.2 * h z.1))) ∂P

/-- 4.1 (copied verbatim from StatisticalLearningTheory 1.4): the misclassification risk
`P(Y h(X) ≤ 0)` of a real score, ties counted as errors. -/
def marginError (P : Measure (X × Bool)) (h : X → ℝ) : ℝ :=
  P.real {z | labelSign z.2 * h z.1 ≤ 0}

end CopiedFromStatisticalLearningTheory

section CopiedFromStatisticalLearningTheoryMargins

/-- 4.1 (copied verbatim from StatisticalLearningTheory 4.1): the ramp loss
`min(1, max(0, 1 - u/ρ))`. -/
def rampLoss (ρ u : ℝ) : ℝ := min 1 (max 0 (1 - u / ρ))

/-- 4.1 (copied verbatim from StatisticalLearningTheory 4.1): the empirical margin loss
`n⁻¹ ∑ Φ_ρ(Y_i h(X_i))` of a real score. -/
def empiricalMarginLoss {X : Type*} {n : ℕ} (ρ : ℝ) (h : X → ℝ) (z : Fin n → X × Bool) : ℝ :=
  (∑ i, rampLoss ρ (labelSign (z i).2 * h (z i).1)) / n

end CopiedFromStatisticalLearningTheoryMargins

/-! ## Definitions copied verbatim from SupportVectorMachines, ThresholdFunctionsAndMargins and
KernelsAndSpectralMethods -/

section CopiedFromSupportVectorMachines

variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E] {ι : Type*} [Fintype ι]

/-- 1.2 (copied verbatim from SupportVectorMachines 3.1): the soft-margin objective with
regularization `lam`: `lam ‖w‖² + (1 / m) Σ max 0 (1 - y i * (⟪w, x i⟫ + b))`, the regularized
average hinge loss. -/
def softObjective (x : ι → E) (y : ι → ℝ) (lam : ℝ) (p : E × ℝ) : ℝ :=
  lam * ‖p.1‖ ^ 2 + (Fintype.card ι : ℝ)⁻¹ * ∑ i, max 0 (1 - y i * (inner ℝ p.1 (x i) + p.2))

end CopiedFromSupportVectorMachines

section CopiedFromThresholdFunctionsAndMargins

variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]

/-- 4.1 (copied verbatim from ThresholdFunctionsAndMargins 4.1): the margin of the direction `w`
on a nonempty finite family `a`: the least inner product `⟪w, a i⟫`. -/
def margin {ι : Type*} [Fintype ι] [Nonempty ι] (a : ι → E) (w : E) : ℝ :=
  univ.inf' univ_nonempty fun i => inner ℝ w (a i)

end CopiedFromThresholdFunctionsAndMargins

section CopiedFromKernelsAndSpectralMethods

variable {d : ℕ}

/-- 3.3 (copied verbatim from KernelsAndSpectralMethods 8.2): the Gaussian kernel
`exp(-‖x - y‖² / (2σ²))`. -/
def gaussianKernel (σ : ℝ) (x y : EuclideanSpace ℝ (Fin d)) : ℝ :=
  Real.exp (-‖x - y‖ ^ 2 / (2 * σ ^ 2))

end CopiedFromKernelsAndSpectralMethods

/-! ## Layer 1: the machine and its dual -/

section Machine

variable {X H : Type*} [NormedAddCommGroup H] [InnerProductSpace ℝ H] [CompleteSpace H]
  [RKHS ℝ H X ℝ]

/-- 1.1 The hinge loss `max(0, 1 + u)` in the orientation of StatisticalLearningTheory 1.4: at
`u = -(y h(x))` it is the hinge loss `max(0, 1 - y h(x))` of the margin `y h(x)`. -/
def hingeLoss (u : ℝ) : ℝ := max 0 (1 + u)

variable (H) in
/-- 1.1 The objective of the kernel support vector machine without offset:
`n⁻¹ Σ max(0, 1 - y_i h(x_i)) + lam ‖h‖²` on the sample `S`. -/
def svmObjective (lam : ℝ) {n : ℕ} (S : Fin n → X × Bool) (h : H) : ℝ :=
  (∑ i, max 0 (1 - labelSign (S i).2 * h (S i).1)) / n + lam * ‖h‖ ^ 2

variable (H) in
/-- 1.1 The kernel support vector machine without offset: a minimizer of `svmObjective`, chosen
by `Classical.epsilon`; for `lam > 0` it is the unique minimizer. -/
def svm (lam : ℝ) {n : ℕ} (S : Fin n → X × Bool) : H :=
  Classical.epsilon fun h : H => IsMinOn (svmObjective H lam S) univ h

/-- 1.1 The classifier of a real score: `true` exactly where the score is positive, so that a
score `0` predicts `false`. -/
def signClassifier (h : X → ℝ) (x : X) : Bool := decide (0 < h x)

variable (H) in
/-- 1.2 The dual objective `Σ α_i - (1/2) Σ_{i,j} α_i α_j y_i y_j K(x_i, x_j)` on the sample
`S`. -/
def kernelDual {n : ℕ} (S : Fin n → X × Bool) (α : Fin n → ℝ) : ℝ :=
  ∑ i, α i - (∑ i, ∑ j, α i * α j * labelSign (S i).2 * labelSign (S j).2 *
    RKHS.kernel H (S i).1 (S j).1 1) / 2

variable (H) in
/-- 1.3 The objective `‖h‖² / 2 + C Σ max(0, 1 - y_i h(x_i))` with a fixed weight `C` per sample
point. -/
def cObjective (C : ℝ) {m : ℕ} (S : Fin m → X × Bool) (h : H) : ℝ :=
  ‖h‖ ^ 2 / 2 + C * ∑ i, max 0 (1 - labelSign (S i).2 * h (S i).1)

/-- 1.2 The box-constrained dual without offset. For `lam > 0` and `C = (2 lam n)⁻¹`, the dual
objective has a maximizer on the box `[0, C]ⁿ`. A point `α` of the box is a maximizer exactly
when the margins `m_i = y_i h_α(x_i)` of `h_α = Σ α_i y_i K(·, x_i)` satisfy `m_i ≥ 1` where
`α_i = 0`, `m_i ≤ 1` where `α_i = C` and `m_i = 1` where `0 < α_i < C`. For every maximizer the
machine is `h_α`, and its objective value is `2 lam` times the dual value. -/
theorem isMaxOn_kernelDual_iff (lam : ℝ) (hlam : 0 < lam) {n : ℕ} (S : Fin n → X × Bool) :
    (∃ α ∈ Icc (0 : Fin n → ℝ) (fun _ => (2 * lam * n)⁻¹),
      IsMaxOn (kernelDual H S) (Icc 0 fun _ => (2 * lam * n)⁻¹) α) ∧
    ∀ α ∈ Icc (0 : Fin n → ℝ) (fun _ => (2 * lam * n)⁻¹),
      (IsMaxOn (kernelDual H S) (Icc 0 fun _ => (2 * lam * n)⁻¹) α ↔
        ∀ i, (α i = 0 → 1 ≤ labelSign (S i).2 *
              (∑ j, (α j * labelSign (S j).2) • RKHS.kerFun H (S j).1 1) (S i).1) ∧
            (α i = (2 * lam * n)⁻¹ → labelSign (S i).2 *
              (∑ j, (α j * labelSign (S j).2) • RKHS.kerFun H (S j).1 1) (S i).1 ≤ 1) ∧
            (0 < α i → α i < (2 * lam * n)⁻¹ → labelSign (S i).2 *
              (∑ j, (α j * labelSign (S j).2) • RKHS.kerFun H (S j).1 1) (S i).1 = 1)) ∧
      (IsMaxOn (kernelDual H S) (Icc 0 fun _ => (2 * lam * n)⁻¹) α →
        svm H lam S = ∑ j, (α j * labelSign (S j).2) • RKHS.kerFun H (S j).1 1 ∧
          svmObjective H lam S (svm H lam S) = 2 * lam * kernelDual H S α) := by
  sorry

/-- 1.2 The box-constrained dual with offset. For `lam > 0` and `C = (2 lam n)⁻¹`, the dual
objective has a maximizer on the box `[0, C]ⁿ` cut by the hyperplane `Σ α_i y_i = 0`. For every
such maximizer `α`, a pair `(h, b)` minimizes the soft-margin objective of the family
`K(·, x_i)` exactly when `h = Σ α_i y_i K(·, x_i)` and the margins `M_i = y_i (h(x_i) + b)` satisfy
`M_i ≤ 1` where `α_i > 0` and `M_i ≥ 1` where `α_i < C`; such an offset `b` exists, and the
minimum value is `2 lam` times the dual value. -/
theorem isMinOn_softObjective_iff (lam : ℝ) (hlam : 0 < lam) {n : ℕ} (S : Fin n → X × Bool) :
    (∃ α ∈ Icc (0 : Fin n → ℝ) (fun _ => (2 * lam * n)⁻¹) ∩
        {α | ∑ i, α i * labelSign (S i).2 = 0},
      IsMaxOn (kernelDual H S) (Icc (0 : Fin n → ℝ) (fun _ => (2 * lam * n)⁻¹) ∩
        {α | ∑ i, α i * labelSign (S i).2 = 0}) α) ∧
    ∀ α ∈ Icc (0 : Fin n → ℝ) (fun _ => (2 * lam * n)⁻¹) ∩
        {α | ∑ i, α i * labelSign (S i).2 = 0},
      IsMaxOn (kernelDual H S) (Icc (0 : Fin n → ℝ) (fun _ => (2 * lam * n)⁻¹) ∩
        {α | ∑ i, α i * labelSign (S i).2 = 0}) α →
      (∀ p : H × ℝ,
        IsMinOn (softObjective (fun i => RKHS.kerFun H (S i).1 1) (fun i => labelSign (S i).2)
          lam) univ p ↔
          p.1 = ∑ j, (α j * labelSign (S j).2) • RKHS.kerFun H (S j).1 1 ∧
            ∀ i, (0 < α i → labelSign (S i).2 * (p.1 (S i).1 + p.2) ≤ 1) ∧
              (α i < (2 * lam * n)⁻¹ → 1 ≤ labelSign (S i).2 * (p.1 (S i).1 + p.2))) ∧
      (∃ b : ℝ, IsMinOn (softObjective (fun i => RKHS.kerFun H (S i).1 1)
          (fun i => labelSign (S i).2) lam) univ
          (∑ j, (α j * labelSign (S j).2) • RKHS.kerFun H (S j).1 1, b)) ∧
      ∀ p : H × ℝ,
        IsMinOn (softObjective (fun i => RKHS.kerFun H (S i).1 1) (fun i => labelSign (S i).2)
          lam) univ p →
        softObjective (fun i => RKHS.kerFun H (S i).1 1) (fun i => labelSign (S i).2) lam p =
          2 * lam * kernelDual H S α := by
  sorry

/-- 1.3 The Jaakkola–Haussler leave-one-out inequality, for every maximizer of the dual. Let `α`
be a maximizer of the dual objective of a sample of size `m + 1` on the box `[0, C]^(m+1)`, and
let `h'` minimize the objective with weight `C` per point on the sample without its point `t`.
Then `y_t h'(x_t) ≥ y_t Σ_{i ≠ t} α_i y_i K(x_t, x_i)`. -/
theorem labelSign_mul_sum_le_loo {m : ℕ} (S : Fin (m + 1) → X × Bool) {C : ℝ}
    {α : Fin (m + 1) → ℝ} (hα : α ∈ Icc (0 : Fin (m + 1) → ℝ) fun _ => C)
    (hmax : IsMaxOn (kernelDual H S) (Icc 0 fun _ => C) α) (t : Fin (m + 1)) (h' : H)
    (hh' : IsMinOn (cObjective H C fun i => S (t.succAbove i)) univ h') :
    labelSign (S t).2 *
        ∑ i ∈ univ.erase t, α i * labelSign (S i).2 * RKHS.kernel H (S t).1 (S i).1 1 ≤
      labelSign (S t).2 * h' (S t).1 := by
  sorry

end Machine

/-! ## Layer 2: continuity, measurability and the oracle inequality -/

section Stability

variable {X H : Type*} [NormedAddCommGroup H] [InnerProductSpace ℝ H] [CompleteSpace H]
  [RKHS ℝ H X ℝ]

/-- 2.1 Hölder continuity of the machine in the sample points: for `lam > 0` and two samples
with the same labels, `lam^(3/2) ‖h_S - h_S'‖² ≤ n⁻¹ Σ ‖K(·, x_i) - K(·, x'_i)‖`. -/
theorem mul_sqrt_mul_norm_svm_sub_sq_le (lam : ℝ) (hlam : 0 < lam) {n : ℕ}
    (S S' : Fin n → X × Bool) (hlab : ∀ i, (S i).2 = (S' i).2) :
    lam * √lam * ‖svm H lam S - svm H lam S'‖ ^ 2 ≤
      (∑ i, ‖RKHS.kerFun H (S i).1 1 - RKHS.kerFun H (S' i).1 1‖) / n := by
  sorry

/-- 2.1 Joint measurability of the machine: for a continuous kernel on a second-countable Borel
space and `lam > 0`, the map `(S, x) ↦ h_S(x)` on `(X × Bool)ⁿ × X` is measurable. -/
theorem measurable_svm_apply [TopologicalSpace X] [SecondCountableTopology X] [MeasurableSpace X]
    [BorelSpace X] (hK : Continuous fun p : X × X => RKHS.kernel H p.1 p.2) (lam : ℝ)
    (hlam : 0 < lam) (n : ℕ) :
    Measurable fun p : (Fin n → X × Bool) × X => svm H lam p.1 p.2 := by
  sorry

/-- 2.2 The oracle inequality in expectation: for a continuous kernel with `‖K(x, x)‖ ≤ r²` on a
second-countable Borel space, a probability law `P` on `X × Bool`, `lam > 0` and `n ≥ 1`, the
expected hinge risk of the machine trained on `n` points, and its expected misclassification
risk, are at most `R_hinge(h) + lam ‖h‖² + r² / (lam n)` for every `h` in the space. -/
theorem lintegral_surrogateRisk_svm_le [TopologicalSpace X] [SecondCountableTopology X]
    [MeasurableSpace X] [BorelSpace X] (hK : Continuous fun p : X × X => RKHS.kernel H p.1 p.2)
    {r : ℝ} (hr : ∀ x, ‖RKHS.kernel H x x‖ ≤ r ^ 2) (P : Measure (X × Bool))
    [IsProbabilityMeasure P] (lam : ℝ) (hlam : 0 < lam) {n : ℕ} (hn : 0 < n) (h : H) :
    ∫⁻ S, surrogateRisk P hingeLoss (svm H lam S) ∂(Measure.pi fun _ : Fin n => P) ≤
        surrogateRisk P hingeLoss h + ENNReal.ofReal (lam * ‖h‖ ^ 2 + r ^ 2 / (lam * n)) ∧
      ∫⁻ S, ENNReal.ofReal (classificationError P (signClassifier (svm H lam S)))
          ∂(Measure.pi fun _ : Fin n => P) ≤
        surrogateRisk P hingeLoss h + ENNReal.ofReal (lam * ‖h‖ ^ 2 + r ^ 2 / (lam * n)) := by
  sorry

end Stability

/-! ## Layer 3: calibration, approximation and consistency -/

section Consistency

/-- 3.1 The hinge risk and the sign classifier, for a probability law `P` on `X × Bool` with
regression function `η`: the least hinge risk of a measurable score is twice the Bayes risk,
attained at `labelSign ∘ bayesClassifier η`; and for every measurable score `h`, with no
hypothesis on the set where `h` vanishes, the excess misclassification risk of
`x ↦ decide (0 < h x)` is at most the excess hinge risk of `h`. -/
theorem hinge_calibration {X : Type*} [MeasurableSpace X] (P : Measure (X × Bool))
    [IsProbabilityMeasure P] (η : X → ℝ) (hη : IsRegressionFunction P η) :
    (⨅ (g : X → ℝ) (_ : Measurable g), surrogateRisk P hingeLoss g) =
        ENNReal.ofReal (2 * classificationError P (bayesClassifier η)) ∧
      surrogateRisk P hingeLoss (fun x => labelSign (bayesClassifier η x)) =
        ENNReal.ofReal (2 * classificationError P (bayesClassifier η)) ∧
      ∀ h : X → ℝ, Measurable h →
        ENNReal.ofReal (classificationError P (signClassifier h) -
            classificationError P (bayesClassifier η)) ≤
          surrogateRisk P hingeLoss h -
            ENNReal.ofReal (2 * classificationError P (bayesClassifier η)) := by
  sorry

variable {X H : Type*} [NormedAddCommGroup H] [InnerProductSpace ℝ H] [CompleteSpace H]
  [RKHS ℝ H X ℝ]

/-- 3.2 Universal kernels reach the least hinge risk: for a continuous universal kernel on a
compact metric space and a probability law `P` on `X × Bool` with regression function `η`, the
infimum of the hinge risk over the space is twice the Bayes risk. -/
theorem iInf_surrogateRisk_eq_of_isUniversalKernel [MetricSpace X] [CompactSpace X]
    [MeasurableSpace X] [BorelSpace X] (hK : Continuous fun p : X × X => RKHS.kernel H p.1 p.2)
    (hU : TauCeti.IsUniversalKernel fun x y : X => RKHS.kernel H x y 1)
    (P : Measure (X × Bool)) [IsProbabilityMeasure P] (η : X → ℝ)
    (hη : IsRegressionFunction P η) :
    ⨅ h : H, surrogateRisk P hingeLoss h =
      ENNReal.ofReal (2 * classificationError P (bayesClassifier η)) := by
  sorry

/-- 3.2 Universal consistency: for a continuous universal kernel on a compact metric space and
regularization parameters with `lam n → 0` and `n lam n → ∞` (which force `lam n > 0` for large
`n`), the expected misclassification risk of the sign of the machine trained on `n` points tends
to the Bayes risk, for every probability law `P` on `X × Bool`. -/
theorem tendsto_lintegral_classificationError_svm [MetricSpace X] [CompactSpace X]
    [MeasurableSpace X] [BorelSpace X] (hK : Continuous fun p : X × X => RKHS.kernel H p.1 p.2)
    (hU : TauCeti.IsUniversalKernel fun x y : X => RKHS.kernel H x y 1)
    (P : Measure (X × Bool)) [IsProbabilityMeasure P] (η : X → ℝ)
    (hη : IsRegressionFunction P η) (lam : ℕ → ℝ) (hlam0 : Tendsto lam atTop (𝓝 0))
    (hnlam : Tendsto (fun n => n * lam n) atTop atTop) :
    Tendsto (fun n => ∫⁻ S, ENNReal.ofReal
        (classificationError P (signClassifier (svm H (lam n) S)))
          ∂(Measure.pi fun _ : Fin n => P)) atTop
      (𝓝 (ENNReal.ofReal (classificationError P (bayesClassifier η)))) := by
  sorry

/-- 3.3 The Gaussian kernel `exp(-‖x - y‖² / (2σ²))` with `σ ≠ 0` is universal on every compact
subset of `ℝ^d`. -/
theorem isUniversalKernel_gaussianKernel {d : ℕ} {σ : ℝ} (hσ : σ ≠ 0)
    {K : Set (EuclideanSpace ℝ (Fin d))} (hK : IsCompact K) :
    TauCeti.IsUniversalKernel fun x y : K => gaussianKernel σ x.1 y.1 := by
  sorry

end Consistency

/-! ## Layer 4: margins uniform in the margin -/

section Margins

variable {X H : Type*} [NormedAddCommGroup H] [InnerProductSpace ℝ H] [CompleteSpace H]
  [RKHS ℝ H X ℝ]

/-- 4.1 The margin bound uniformly in the margin. For a continuous kernel with `‖K(x, x)‖ ≤ r²`,
`r ≥ 0`, on a second-countable Borel space, a probability law `P` on `X × Bool`, `n ≥ 1` and
`δ > 0`: with probability at least `1 - δ`, every `h` of norm at most `1` and every `ρ ∈ (0, r]`
satisfy `marginError P h ≤ empiricalMarginLoss ρ h S + 4 r / (ρ √n) + √(log(log₂(2r/ρ)) / n)
+ √(log(2/δ) / (2n))`; and with probability at least `1 - δ`, every `h` of norm at most `1`
whose margin `γ` on the family `y_i K(·, x_i)` is positive satisfies the same bound at `ρ = γ`
without the empirical term. -/
theorem marginError_le_uniform [TopologicalSpace X] [SecondCountableTopology X]
    [MeasurableSpace X] [BorelSpace X] (hK : Continuous fun p : X × X => RKHS.kernel H p.1 p.2)
    {r : ℝ} (hr0 : 0 ≤ r) (hr : ∀ x, ‖RKHS.kernel H x x‖ ≤ r ^ 2) (P : Measure (X × Bool))
    [IsProbabilityMeasure P] {n : ℕ} [NeZero n] {δ : ℝ} (hδ : 0 < δ) :
    (Measure.pi fun _ : Fin n => P).real {S | ∃ h ∈ Metric.closedBall (0 : H) 1, ∃ ρ ∈ Ioc 0 r,
        empiricalMarginLoss ρ h S + 4 * r / (ρ * √n) + √(Real.log (Real.logb 2 (2 * r / ρ)) / n) +
          √(Real.log (2 / δ) / (2 * n)) < marginError P h} ≤ δ ∧
      (Measure.pi fun _ : Fin n => P).real {S | ∃ h ∈ Metric.closedBall (0 : H) 1,
        0 < margin (fun i => labelSign (S i).2 • RKHS.kerFun H (S i).1 1) h ∧
          4 * r / (margin (fun i => labelSign (S i).2 • RKHS.kerFun H (S i).1 1) h * √n) +
            √(Real.log (Real.logb 2
              (2 * r / margin (fun i => labelSign (S i).2 • RKHS.kerFun H (S i).1 1) h)) / n) +
            √(Real.log (2 / δ) / (2 * n)) < marginError P h} ≤ δ := by
  sorry

end Margins

end TauCetiRoadmap.KernelSupportVectorMachines
