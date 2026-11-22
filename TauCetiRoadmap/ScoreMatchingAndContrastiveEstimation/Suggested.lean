import Mathlib

/-!
# Score matching and contrastive estimation: target signatures

This file is not the roadmap: the roadmap is `README.md`. This file states the roadmap's headline
theorems against the pinned Mathlib, each with `sorry`, together with the few definitions their
statements need; every definition has a real body. Every headline theorem of the README is
statable at the pins and is stated here.

Conventions. Continuous data live on `EuclideanSpace ℝ (Fin n)` with Lebesgue measure; a data
density is a nonnegative real function `p`, and a model is given by an unnormalised log-density
`logq`, any real function, whose exponential need not be integrable. Scores are gradients
(`gradient`), and `Δ` is Mathlib's Laplacian. Binary data are configurations `x : ι → Bool` for a
finite set `ι` of sites; a data law and a model are weight functions on configurations. In the
noise-contrastive layer the data and the noise are densities `pd`, `pn` with respect to a measure
`μ` on an arbitrary measurable space, and losses are extended nonnegative integrals, so that no
integrability side condition hides in a junk value.

The definition `TendstoInProbability` is copied verbatim from MathematicalStatisticsAsymptotic
1.1, which owns it and whose Lean file cannot be imported.
-/

noncomputable section

open MeasureTheory Filter Topology Finset
open scoped ENNReal Laplacian Matrix

namespace TauCetiRoadmap.ScoreMatchingAndContrastiveEstimation

/-! ## Layer 1: score matching on Euclidean space -/

section ScoreMatching

variable {n : ℕ}

/-- 1.1: the score-matching objective (half the Fisher divergence) of the unnormalised model
`exp ∘ logq` from the data density `p`:
`J(logq) = ½ ∫ p(x) ‖∇ logq(x) − ∇ log p(x)‖² dx`. -/
def scoreMatchingObjective (p logq : EuclideanSpace ℝ (Fin n) → ℝ) : ℝ :=
  (1 / 2) * ∫ x, p x * ‖gradient logq x - gradient (fun y ↦ Real.log (p y)) x‖ ^ 2

/-- 1.1: Hyvärinen's objective of the unnormalised model `exp ∘ logq` under a law `P`:
`∫ (Δ logq + ½ ‖∇ logq‖²) dP`. It involves `P` only through integration, so it is defined for an
empirical law as well as for a law with a density. -/
def hyvarinenObjective (P : Measure (EuclideanSpace ℝ (Fin n)))
    (logq : EuclideanSpace ℝ (Fin n) → ℝ) : ℝ :=
  ∫ x, (Δ logq x + (1 / 2) * ‖gradient logq x‖ ^ 2) ∂P

/-- 1.2: Hyvärinen's identity. For a differentiable integrable data density with finite Fisher
information and a model with differentiable score, finite second moment of the score and
integrable second derivatives, the score-matching objective is Hyvärinen's objective plus a
constant that does not involve the model. -/
theorem scoreMatchingObjective_eq_hyvarinenObjective_add {p logq : EuclideanSpace ℝ (Fin n) → ℝ}
    (hp0 : ∀ x, 0 ≤ p x) (hp : Differentiable ℝ p) (hpi : Integrable p)
    (hq : Differentiable ℝ logq) (hq' : Differentiable ℝ (fderiv ℝ logq))
    (hmodel : Integrable fun x ↦ p x * ‖gradient logq x‖ ^ 2)
    (hdata : Integrable fun x ↦ p x * ‖gradient (fun y ↦ Real.log (p y)) x‖ ^ 2)
    (hsecond : ∀ i, Integrable fun x ↦ p x *
      iteratedFDeriv ℝ 2 logq x ![EuclideanSpace.single i 1, EuclideanSpace.single i 1]) :
    scoreMatchingObjective p logq =
      hyvarinenObjective (volume.withDensity fun x ↦ ENNReal.ofReal (p x)) logq +
        (1 / 2) * ∫ x, p x * ‖gradient (fun y ↦ Real.log (p y)) x‖ ^ 2 :=
  sorry

/-- 1.3: identification. For an everywhere positive differentiable data density with finite
Fisher information and a differentiable model log-density whose score has a finite second
moment, the score-matching objective vanishes exactly when the model log-density is the data
log-density up to an additive constant. -/
theorem scoreMatchingObjective_eq_zero_iff {p logq : EuclideanSpace ℝ (Fin n) → ℝ}
    (hp0 : ∀ x, 0 < p x) (hp : Differentiable ℝ p) (hq : Differentiable ℝ logq)
    (hmodel : Integrable fun x ↦ p x * ‖gradient logq x‖ ^ 2)
    (hdata : Integrable fun x ↦ p x * ‖gradient (fun y ↦ Real.log (p y)) x‖ ^ 2) :
    scoreMatchingObjective p logq = 0 ↔ ∃ c : ℝ, ∀ x, logq x = Real.log (p x) + c :=
  sorry

end ScoreMatching

/-! ## Layer 2: exponential families -/

section ExponentialFamily

variable {n m : ℕ}

/-- 2.1: the unnormalised log-density `Σ_k θ_k F_k` of the exponential family with sufficient
statistics `F`. -/
def expFamilyLogDensity (F : Fin m → EuclideanSpace ℝ (Fin n) → ℝ) (θ : Fin m → ℝ)
    (x : EuclideanSpace ℝ (Fin n)) : ℝ :=
  ∑ k, θ k * F k x

/-- 2.1: the Gram matrix `A_kl = ∫ ⟪∇F_k, ∇F_l⟫ dP` of the gradients of the statistics. -/
def scoreGram (P : Measure (EuclideanSpace ℝ (Fin n))) (F : Fin m → EuclideanSpace ℝ (Fin n) → ℝ) :
    Matrix (Fin m) (Fin m) ℝ :=
  Matrix.of fun k l ↦ ∫ x, inner ℝ (gradient (F k) x) (gradient (F l) x) ∂P

/-- 2.1: the vector `b_k = ∫ Δ F_k dP` of mean Laplacians of the statistics. -/
def laplacianMean (P : Measure (EuclideanSpace ℝ (Fin n)))
    (F : Fin m → EuclideanSpace ℝ (Fin n) → ℝ) : Fin m → ℝ :=
  fun k ↦ ∫ x, Δ (F k) x ∂P

/-- 2.1: the score-matching estimator of an exponential family in closed form. If the Gram
matrix of the gradients of the statistics is positive definite, Hyvärinen's objective is
minimised exactly at `θ̂ = −A⁻¹ b`. -/
theorem hyvarinenObjective_expFamily_minimizer (P : Measure (EuclideanSpace ℝ (Fin n)))
    (F : Fin m → EuclideanSpace ℝ (Fin n) → ℝ) (hF : ∀ k, Differentiable ℝ (F k))
    (hF' : ∀ k, Differentiable ℝ (fderiv ℝ (F k)))
    (hgrad : ∀ k, Integrable (fun x ↦ ‖gradient (F k) x‖ ^ 2) P)
    (hlap : ∀ k, Integrable (Δ (F k)) P) (hA : (scoreGram P F).PosDef) (θ : Fin m → ℝ) :
    hyvarinenObjective P (expFamilyLogDensity F (-((scoreGram P F)⁻¹ *ᵥ laplacianMean P F))) ≤
        hyvarinenObjective P (expFamilyLogDensity F θ) ∧
      (hyvarinenObjective P (expFamilyLogDensity F θ) =
          hyvarinenObjective P
            (expFamilyLogDensity F (-((scoreGram P F)⁻¹ *ᵥ laplacianMean P F))) →
        θ = -((scoreGram P F)⁻¹ *ᵥ laplacianMean P F)) :=
  sorry

end ExponentialFamily

/-! ## Layer 3: ratio matching for binary data -/

section RatioMatching

variable {ι : Type*} [Fintype ι] [DecidableEq ι]

/-- 3.1: the configuration `x` with the value at site `i` flipped. -/
def flipAt (x : ι → Bool) (i : ι) : ι → Bool :=
  Function.update x i (!x i)

/-- 3.1: the transformed probability ratio `P(x⁻ⁱ) / (P(x) + P(x⁻ⁱ))`, which is
`g(P(x)/P(x⁻ⁱ))` for `g(u) = 1/(1 + u)`; it is unchanged when `P` is multiplied by a positive
constant. -/
def ratioTransform (P : (ι → Bool) → ℝ) (x : ι → Bool) (i : ι) : ℝ :=
  P (flipAt x i) / (P x + P (flipAt x i))

/-- 3.1: the ratio-matching objective of a model `Q` against data weights `Px`. -/
def ratioMatchingObjective (Px Q : (ι → Bool) → ℝ) : ℝ :=
  (1 / 2) * ∑ x, Px x * ∑ i, ((ratioTransform Px x i - ratioTransform Q x i) ^ 2 +
    (ratioTransform Px (flipAt x i) i - ratioTransform Q (flipAt x i) i) ^ 2)

/-- 3.1: the ratio-matching loss `Σ_x Px(x) Σ_i g(Q(x)/Q(x⁻ⁱ))²`, which needs `Px` only as
weights: for empirical frequencies it is the sample objective. -/
def ratioMatchingLoss (Px Q : (ι → Bool) → ℝ) : ℝ :=
  ∑ x, Px x * ∑ i, ratioTransform Q x i ^ 2

/-- 3.1: for nonnegative data weights, the ratio-matching objective of every positive model is
its ratio-matching loss plus a constant that depends on the data only. -/
theorem exists_ratioMatchingObjective_eq_add {Px : (ι → Bool) → ℝ} (hPx : ∀ x, 0 ≤ Px x) :
    ∃ c : ℝ, ∀ Q : (ι → Bool) → ℝ, (∀ x, 0 < Q x) →
      ratioMatchingObjective Px Q = ratioMatchingLoss Px Q + c :=
  sorry

/-- 3.2: identification. For a probability law `Px` on configurations, possibly with
configurations of probability zero, and a positive model `Q`, the ratio-matching objective
vanishes exactly when `Px` is the normalisation of `Q`. -/
theorem ratioMatchingObjective_eq_zero_iff {Px Q : (ι → Bool) → ℝ} (hPx : ∀ x, 0 ≤ Px x)
    (hPx1 : ∑ x, Px x = 1) (hQ : ∀ x, 0 < Q x) :
    ratioMatchingObjective Px Q = 0 ↔ ∀ x, Px x = Q x / ∑ y, Q y :=
  sorry

end RatioMatching

section CopiedFromMathematicalStatisticsAsymptotic

variable {ι : Type*} {Ω : ι → Type*} [∀ i, MeasurableSpace (Ω i)]

/-- 3.3 (copied verbatim from MathematicalStatisticsAsymptotic 1.1): convergence in probability
to a constant along a filter, on probability spaces that vary with the index. Sets are measured
by the outer measure, so no measurability is required. -/
def TendstoInProbability (μ : ∀ i, Measure (Ω i)) {E : Type*} [PseudoMetricSpace E]
    (X : ∀ i, Ω i → E) (l : Filter ι) (c : E) : Prop :=
  ∀ ε > 0, Tendsto (fun i ↦ μ i {ω | ε ≤ dist (X i ω) c}) l (𝓝 0)

end CopiedFromMathematicalStatisticsAsymptotic

section RatioMatchingConsistency

variable {ι : Type*} [Fintype ι] [DecidableEq ι]

/-- 3.3: the empirical frequencies `x ↦ #{t | ω t = x} / T` of a sample `ω` of size `T` (all `0`
when `T = 0`). -/
def empiricalFreq {T : ℕ} (ω : Fin T → ι → Bool) (x : ι → Bool) : ℝ :=
  ((univ.filter fun t ↦ ω t = x).card : ℝ) / T

/-- 3.3: consistency of ratio matching. For a positive model, continuous in the parameter, on a
compact metric parameter space, identifiable, with data drawn independently from the model law at
`θ₀`, every exact minimiser of the sample ratio-matching loss converges in probability to `θ₀`.
The route applies `tendstoInProbability_of_isWellSeparated` of MathematicalStatisticsAsymptotic
5.1. -/
theorem tendstoInProbability_ratioMatching {Θ : Type*} [MetricSpace Θ] [CompactSpace Θ]
    (Q : Θ → (ι → Bool) → ℝ) (hQ : ∀ θ x, 0 < Q θ x) (hQc : ∀ x, Continuous fun θ ↦ Q θ x)
    (θ₀ : Θ) (hident : ∀ θ, (∀ x, Q θ x / ∑ y, Q θ y = Q θ₀ x / ∑ y, Q θ₀ y) → θ = θ₀)
    (P₀ : Measure (ι → Bool)) [IsProbabilityMeasure P₀]
    (hP₀ : ∀ x, P₀.real {x} = Q θ₀ x / ∑ y, Q θ₀ y)
    (θhat : ∀ T : ℕ, (Fin T → ι → Bool) → Θ)
    (hmin : ∀ (T : ℕ) (ω : Fin T → ι → Bool) (θ : Θ),
      ratioMatchingLoss (empiricalFreq ω) (Q (θhat T ω)) ≤
        ratioMatchingLoss (empiricalFreq ω) (Q θ)) :
    TendstoInProbability (fun T : ℕ ↦ Measure.pi fun _ : Fin T ↦ P₀) θhat atTop θ₀ :=
  sorry

end RatioMatchingConsistency

/-! ## Layer 4: noise-contrastive estimation -/

section NoiseContrastive

variable {X : Type*} [MeasurableSpace X]

/-- 4.1: the population noise-contrastive loss of a log-model `f`: the logistic cross-entropy
`∫ pd · (−log h) + ν pn · (−log (1 − h))` of the classifier `h = e^f/(e^f + ν pn)` that tells
data (density `pd`) from noise (density `pn`, `ν` noise points per data point). Its integrand is
nonnegative, and it is `0` where `pn = 0`. -/
def nceLoss (μ : Measure X) (pd pn : X → ℝ) (ν : ℝ) (f : X → ℝ) : ℝ≥0∞ :=
  ∫⁻ u, ENNReal.ofReal (pd u * Real.log ((Real.exp (f u) + ν * pn u) / Real.exp (f u)) +
    ν * pn u * Real.log ((Real.exp (f u) + ν * pn u) / (ν * pn u))) ∂μ

/-- 4.1: the least noise-contrastive loss
`∫ pd · log((pd + ν pn)/pd) + ν pn · log((pd + ν pn)/(ν pn))`. -/
def nceOptimalLoss (μ : Measure X) (pd pn : X → ℝ) (ν : ℝ) : ℝ≥0∞ :=
  ∫⁻ u, ENNReal.ofReal (pd u * Real.log ((pd u + ν * pn u) / pd u) +
    ν * pn u * Real.log ((pd u + ν * pn u) / (ν * pn u))) ∂μ

/-- 4.1: noise-contrastive estimation, nonparametric form. The least loss is finite and is a lower
bound for every log-model; when the noise is positive wherever the data density is, a measurable
log-model attains it exactly when the data density is positive almost everywhere on the support
of the noise and the log-model equals `log pd` almost everywhere on the support of the data. No
normalisation is imposed on `exp ∘ f`. -/
theorem nceLoss_minimizers {μ : Measure X} {pd pn : X → ℝ} {ν : ℝ} (hν : 0 < ν)
    (hd : Measurable pd) (hn : Measurable pn) (hd0 : ∀ u, 0 ≤ pd u) (hn0 : ∀ u, 0 ≤ pn u)
    (hdi : Integrable pd μ) (hni : Integrable pn μ) :
    nceOptimalLoss μ pd pn ν < ∞ ∧
      (∀ f : X → ℝ, nceOptimalLoss μ pd pn ν ≤ nceLoss μ pd pn ν f) ∧
      ((∀ᵐ u ∂μ, 0 < pd u → 0 < pn u) → ∀ f : X → ℝ, Measurable f →
        (nceLoss μ pd pn ν f = nceOptimalLoss μ pd pn ν ↔
          (∀ᵐ u ∂μ, 0 < pn u → 0 < pd u) ∧ ∀ᵐ u ∂μ, 0 < pd u → f u = Real.log (pd u))) :=
  sorry

end NoiseContrastive

end TauCetiRoadmap.ScoreMatchingAndContrastiveEstimation
