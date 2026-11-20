import Mathlib

/-!
# Importance sampling and variance reduction: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib, each with `sorry`, together with the few
definitions they need; every definition has a real body. Every headline theorem of the README is
statable at the pins and is stated here. The README's remaining API lists and Checks are not
restated.

The target law `p` and the proposal law `q` are measures on a measurable space `α`. The
importance weight is the Radon–Nikodym derivative `p.rnDeriv q`, read in `ℝ`; Owen's condition
"`q > 0` wherever `f p ≠ 0`" is the absolute continuity `p.withDensity (‖f ·‖ₑ) ≪ q`. Samples are
random variables `X i : Ω → α` on a probability space `(Ω, P)`, independent and with law `q`.
Variances are Mathlib's `variance` (real, for square-integrable functions) or `evariance`, and
second moments that may be infinite are written as lower Lebesgue integrals in `ℝ≥0∞`.
-/

noncomputable section

open MeasureTheory ProbabilityTheory Filter Finset Real Matrix
open scoped ENNReal NNReal Topology

namespace TauCetiRoadmap.ImportanceSamplingAndVarianceReduction

variable {α Ω Ω' : Type*} {mα : MeasurableSpace α} {mΩ : MeasurableSpace Ω}
  {mΩ' : MeasurableSpace Ω'}

/-! ## Layer 1: importance sampling -/

/-- 1.1 The importance weight (likelihood ratio) `dp/dq`, as a real function. -/
def isWeight (p q : Measure α) (x : α) : ℝ :=
  (p.rnDeriv q x).toReal

/-- 1.1 The importance sampling estimate `(1/n) ∑_{i<n} f(Xᵢ) w(Xᵢ)`. -/
def isEstimator (p q : Measure α) (f : α → ℝ) (X : ℕ → Ω → α) (n : ℕ) (ω : Ω) : ℝ :=
  (n : ℝ)⁻¹ * ∑ i ∈ range n, f (X i ω) * isWeight p q (X i ω)

/-- 1.1 The mean of `f w` under `q` is the integral of `f` against `p` minus its integral
against the part of `p` singular to `q`. -/
theorem integral_mul_isWeight (p q : Measure α) [IsFiniteMeasure p] [SigmaFinite q]
    {f : α → ℝ} (hf : Integrable f p) :
    ∫ x, f x * isWeight p q x ∂q = ∫ x, f x ∂p - ∫ x, f x ∂(p.singularPart q) := by
  sorry

/-- 1.1 Unbiasedness (Owen, Theorem 9.1): if `q` charges every set where `f p` lives, the
importance sampling estimate with `n ≥ 1` samples has mean `∫ f dp`. -/
theorem integral_isEstimator {P : Measure Ω} [IsProbabilityMeasure P] (p q : Measure α)
    [IsFiniteMeasure p] [IsProbabilityMeasure q] {f : α → ℝ} (hf : Integrable f p)
    (hfq : p.withDensity (fun x ↦ ‖f x‖ₑ) ≪ q) {X : ℕ → Ω → α} (hX : ∀ i, HasLaw (X i) q P)
    {n : ℕ} (hn : 1 ≤ n) :
    ∫ ω, isEstimator p q f X n ω ∂P = ∫ x, f x ∂p := by
  sorry

/-- 1.2 The variance of the importance sampling estimate (Owen, Theorem 9.1 and (9.4)):
`(∫ f² w dp - (∫ f dp)²) / n` for pairwise independent samples of law `q`. -/
theorem variance_isEstimator {P : Measure Ω} [IsProbabilityMeasure P] (p q : Measure α)
    [IsFiniteMeasure p] [IsProbabilityMeasure q] {f : α → ℝ} (hf : AEStronglyMeasurable f p)
    (hfq : p.withDensity (fun x ↦ ‖f x‖ₑ) ≪ q)
    (hf2 : MemLp (fun x ↦ f x * isWeight p q x) 2 q) {X : ℕ → Ω → α}
    (hX : ∀ i, HasLaw (X i) q P) (hindep : Pairwise fun i j ↦ X i ⟂ᵢ[P] X j) (n : ℕ) :
    variance (isEstimator p q f X n) P =
      (∫ x, f x ^ 2 * isWeight p q x ∂p - (∫ x, f x ∂p) ^ 2) / n := by
  sorry

/-- 1.3 The proposal proportional to `|f| p`: `(∫⁻ ‖f‖ₑ dp)⁻¹ • p.withDensity ‖f‖ₑ`. -/
def optimalProposal (p : Measure α) (f : α → ℝ) : Measure α :=
  (∫⁻ x, ‖f x‖ₑ ∂p)⁻¹ • p.withDensity (fun x ↦ ‖f x‖ₑ)

/-- 1.3 Kahn–Marshall lower bound: for every probability measure `q` with `f p ≪ q`, the second
moment of `f w` under `q` is at least `(∫ |f| dp)²`. -/
theorem sq_lintegral_le_lintegral_mul_isWeight_sq (p q : Measure α) [IsFiniteMeasure p]
    [IsProbabilityMeasure q] {f : α → ℝ} (hf : Measurable f)
    (hfq : p.withDensity (fun x ↦ ‖f x‖ₑ) ≪ q) :
    (∫⁻ x, ‖f x‖ₑ ∂p) ^ 2 ≤ ∫⁻ x, ‖f x * isWeight p q x‖ₑ ^ 2 ∂q := by
  sorry

/-- 1.3 The proposal proportional to `|f| p` attains the Kahn–Marshall bound; for `f ≥ 0` the
attained second moment is `(∫ f dp)²`, so the estimate has variance `0`. -/
theorem lintegral_mul_isWeight_optimalProposal_sq (p : Measure α) [IsFiniteMeasure p]
    {f : α → ℝ} (hf : Measurable f) (htop : ∫⁻ x, ‖f x‖ₑ ∂p ≠ ∞) :
    ∫⁻ x, ‖f x * isWeight p (optimalProposal p f) x‖ₑ ^ 2 ∂(optimalProposal p f) =
      (∫⁻ x, ‖f x‖ₑ ∂p) ^ 2 := by
  sorry

/-- 1.4 Bounded weights (Owen, Exercise 9.6): if `dp/dq ≤ c` `q`-almost everywhere, then
`Var_q(f w) ≤ c Var_p(f) + (c - 1) (∫ f dp)²`. -/
theorem variance_mul_isWeight_le_of_le (p q : Measure α) [IsProbabilityMeasure p]
    [IsProbabilityMeasure q] {f : α → ℝ} (hf : MemLp f 2 p)
    (hfq : p.withDensity (fun x ↦ ‖f x‖ₑ) ≪ q) {c : ℝ≥0}
    (hc : ∀ᵐ x ∂q, p.rnDeriv q x ≤ c) :
    variance (fun x ↦ f x * isWeight p q x) q ≤
      (c : ℝ) * variance f p + ((c : ℝ) - 1) * (∫ x, f x ∂p) ^ 2 := by
  sorry

/-- 1.4 Defensive importance sampling (Owen, (9.23)): for the mixture `a p + (1 - a) q` with
`0 < a ≤ 1`, the variance of `f w` is at most `(Var_p f + (1 - a) (∫ f dp)²) / a`. -/
theorem variance_mul_isWeight_defensive_le (p q : Measure α) [IsProbabilityMeasure p]
    [IsProbabilityMeasure q] {f : α → ℝ} (hf : MemLp f 2 p) {a : ℝ} (ha0 : 0 < a)
    (ha1 : a ≤ 1) :
    variance (fun x ↦ f x * isWeight p (ENNReal.ofReal a • p + ENNReal.ofReal (1 - a) • q) x)
        (ENNReal.ofReal a • p + ENNReal.ofReal (1 - a) • q) ≤
      (variance f p + (1 - a) * (∫ x, f x ∂p) ^ 2) / a := by
  sorry

/-- 1.5 Chatterjee–Diaconis, sufficiency (Theorem 1.1, first part): with
`L = KL(p ‖ q)`, if `exp (L + t) ≤ n` for some `t ≥ 0`, then
`E |Iₙ(f) - ∫ f dp| ≤ ‖f‖_{L²(p)} (exp (-t/4) + 2 √(p {log w > L + t/2}))`. -/
theorem integral_abs_isEstimator_sub_le {P : Measure Ω} [IsProbabilityMeasure P]
    (p q : Measure α) [IsProbabilityMeasure p] [IsProbabilityMeasure q]
    (hpq : p ≪ q) {f : α → ℝ} (hf : MemLp f 2 p)
    {X : ℕ → Ω → α} (hX : ∀ i, HasLaw (X i) q P) (hindep : iIndepFun X P)
    {t : ℝ} (ht : 0 ≤ t) {n : ℕ}
    (hn : exp ((InformationTheory.klDiv p q).toReal + t) ≤ n) :
    ∫ ω, |isEstimator p q f X n ω - ∫ x, f x ∂p| ∂P ≤
      √(∫ x, f x ^ 2 ∂p) * (exp (-t / 4) + 2 * √(p.real
        {x | (InformationTheory.klDiv p q).toReal + t / 2 < log (isWeight p q x)})) := by
  sorry

/-- 1.5 Chatterjee–Diaconis, necessity (Theorem 1.1, second part): if `n ≤ exp (L - t)` for some
`t ≥ 0`, then for every `δ ∈ (0, 1)` the estimate of `∫ 1 dp = 1` reaches `1 - δ` with
probability at most `exp (-t/2) + p {log w ≤ L - t/2} / (1 - δ)`. -/
theorem measureReal_isEstimator_one_ge_le {P : Measure Ω} [IsProbabilityMeasure P]
    (p q : Measure α) [IsProbabilityMeasure p] [IsProbabilityMeasure q]
    {X : ℕ → Ω → α} (hX : ∀ i, HasLaw (X i) q P) {t : ℝ} (ht : 0 ≤ t) {n : ℕ}
    (hn : (n : ℝ) ≤ exp ((InformationTheory.klDiv p q).toReal - t))
    {δ : ℝ} (hδ0 : 0 < δ) (hδ1 : δ < 1) :
    P.real {ω | 1 - δ ≤ isEstimator p q (fun _ ↦ 1) X n ω} ≤
      exp (-t / 2) + p.real
        {x | log (isWeight p q x) ≤ (InformationTheory.klDiv p q).toReal - t / 2} / (1 - δ) := by
  sorry

/-! ## Layer 2: self-normalized importance sampling -/

/-- 2.1 The self-normalized importance sampling estimate `∑ f(Xᵢ) w(Xᵢ) / ∑ w(Xᵢ)`
(`0` when the weights sum to `0`). -/
def snisEstimator (p q : Measure α) (f : α → ℝ) (X : ℕ → Ω → α) (n : ℕ) (ω : Ω) : ℝ :=
  (∑ i ∈ range n, f (X i ω) * isWeight p q (X i ω)) / ∑ i ∈ range n, isWeight p q (X i ω)

/-- 2.1 Consistency (Owen, Theorem 9.2): for a finite target `p ≪ q` (possibly
unnormalized) and `f ∈ L¹(p)`, the self-normalized estimate tends almost surely to
`∫ f dp / p(α)`. -/
theorem ae_tendsto_snisEstimator {P : Measure Ω} [IsProbabilityMeasure P] (p q : Measure α)
    [IsFiniteMeasure p] [IsProbabilityMeasure q] (hpq : p ≪ q) {f : α → ℝ}
    (hf : Integrable f p) {X : ℕ → Ω → α} (hX : ∀ i, HasLaw (X i) q P)
    (hindep : Pairwise fun i j ↦ X i ⟂ᵢ[P] X j) :
    ∀ᵐ ω ∂P, Tendsto (fun n ↦ snisEstimator p q f X n ω) atTop
      (𝓝 ((p.real Set.univ)⁻¹ * ∫ x, f x ∂p)) := by
  sorry

/-- 2.2 The asymptotic variance `∫ w² (f - ∫ f dp)² dq` of self-normalized importance sampling,
in `ℝ≥0∞`. -/
def snisAsymptoticVariance (p q : Measure α) (f : α → ℝ) : ℝ≥0∞ :=
  ∫⁻ x, p.rnDeriv q x ^ 2 * ‖f x - ∫ y, f y ∂p‖ₑ ^ 2 ∂q

/-- 2.2 Central limit theorem for self-normalized importance sampling (Owen, (9.8)):
`√n (μ̃ₙ - ∫ f dp)` converges in law to the centred Gaussian with variance
`snisAsymptoticVariance p q f`. -/
theorem tendstoInDistribution_snisEstimator {P : Measure Ω} [IsProbabilityMeasure P]
    {P' : Measure Ω'} [IsProbabilityMeasure P'] (p q : Measure α) [IsProbabilityMeasure p]
    [IsProbabilityMeasure q] (hpq : p ≪ q) {f : α → ℝ}
    (hw : MemLp (isWeight p q) 2 q) (hfw : MemLp (fun x ↦ f x * isWeight p q x) 2 q)
    {X : ℕ → Ω → α} (hX : ∀ i, HasLaw (X i) q P) (hindep : iIndepFun X P) {Y : Ω' → ℝ}
    (hY : HasLaw Y (gaussianReal 0 (snisAsymptoticVariance p q f).toNNReal) P') :
    TendstoInDistribution (fun (n : ℕ) ω ↦ √(n : ℝ) * (snisEstimator p q f X n ω - ∫ x, f x ∂p))
      atTop Y (fun _ ↦ P) P' := by
  sorry

/-- 2.3 Hesterberg's lower bound (Owen, (9.10)): for every proposal `q` with `p ≪ q`, the
asymptotic variance is at least `(∫ |f - ∫ f dp| dp)²`; the proposal proportional to
`|f - ∫ f dp| p` attains it, by `lintegral_mul_isWeight_optimalProposal_sq` applied to
`f - ∫ f dp`. -/
theorem sq_lintegral_le_snisAsymptoticVariance (p q : Measure α) [IsProbabilityMeasure p]
    [IsProbabilityMeasure q] (hpq : p ≪ q) {f : α → ℝ} (hf : Measurable f) :
    (∫⁻ x, ‖f x - ∫ y, f y ∂p‖ₑ ∂p) ^ 2 ≤ snisAsymptoticVariance p q f := by
  sorry

/-- 2.4 Defensive self-normalized importance sampling (Owen, Theorem 9.5): for the mixture
`a p + (1 - a) q` with `0 < a ≤ 1`, the asymptotic variance is at most `Var_p(f) / a`. -/
theorem snisAsymptoticVariance_defensive_le (p q : Measure α) [IsProbabilityMeasure p]
    [IsProbabilityMeasure q] {f : α → ℝ} (hf : Measurable f) {a : ℝ} (ha0 : 0 < a)
    (ha1 : a ≤ 1) :
    snisAsymptoticVariance p (ENNReal.ofReal a • p + ENNReal.ofReal (1 - a) • q) f ≤
      evariance f p / ENNReal.ofReal a := by
  sorry

/-! ## Layer 3: control variates -/

/-- 3.1 The covariance matrix `(Cov(Zᵢ, Zⱼ))ᵢⱼ` of a vector of controls, in random-vector form;
for a.e. measurable controls it is Tau Ceti's `TauCeti.covMatrix` of the law of `Z`. -/
def controlCovMatrix {ι : Type*} (P : Measure Ω) (Z : Ω → ι → ℝ) : Matrix ι ι ℝ :=
  Matrix.of fun i j ↦ covariance (fun ω ↦ Z ω i) (fun ω ↦ Z ω j) P

/-- 3.1 Optimal control-variate coefficients (Owen, (8.31)–(8.32)): with a positive definite
covariance matrix `Σ` of the controls and `c = (Cov(Y, Zⱼ))ⱼ`, the least variance of
`Y - βᵀ Z` over `β` is `Var Y - cᵀ Σ⁻¹ c`, attained at `β = Σ⁻¹ c`. -/
theorem isLeast_variance_sub_controls {ι : Type*} [Fintype ι] [DecidableEq ι]
    {P : Measure Ω} [IsProbabilityMeasure P] {Y : Ω → ℝ} {Z : Ω → ι → ℝ}
    (hY : MemLp Y 2 P) (hZ : ∀ j, MemLp (fun ω ↦ Z ω j) 2 P)
    (hcov : (controlCovMatrix P Z).PosDef) :
    IsLeast (Set.range fun β : ι → ℝ ↦ variance (fun ω ↦ Y ω - ∑ j, β j * Z ω j) P)
        (variance Y P - (fun j ↦ covariance Y (fun ω ↦ Z ω j) P) ⬝ᵥ
          ((controlCovMatrix P Z)⁻¹ *ᵥ fun j ↦ covariance Y (fun ω ↦ Z ω j) P)) ∧
      variance (fun ω ↦ Y ω - ∑ j, ((controlCovMatrix P Z)⁻¹ *ᵥ
          fun j ↦ covariance Y (fun ω ↦ Z ω j) P) j * Z ω j) P =
        variance Y P - (fun j ↦ covariance Y (fun ω ↦ Z ω j) P) ⬝ᵥ
          ((controlCovMatrix P Z)⁻¹ *ᵥ fun j ↦ covariance Y (fun ω ↦ Z ω j) P) := by
  sorry

/-- 3.2 The estimated coefficient `β̂ₙ = ∑ (f(Xᵢ) - f̄)(h(Xᵢ) - h̄) / ∑ (h(Xᵢ) - h̄)²`. -/
def cvCoeffHat (f h : α → ℝ) (X : ℕ → Ω → α) (n : ℕ) (ω : Ω) : ℝ :=
  (∑ i ∈ range n, (f (X i ω) - (n : ℝ)⁻¹ * ∑ k ∈ range n, f (X k ω)) *
      (h (X i ω) - (n : ℝ)⁻¹ * ∑ k ∈ range n, h (X k ω))) /
    ∑ i ∈ range n, (h (X i ω) - (n : ℝ)⁻¹ * ∑ k ∈ range n, h (X k ω)) ^ 2

/-- 3.2 The regression estimator `f̄ - β̂ₙ (h̄ - ∫ h dQ)` with one control `h` of known mean. -/
def regressionEstimator (Q : Measure α) (f h : α → ℝ) (X : ℕ → Ω → α) (n : ℕ) (ω : Ω) : ℝ :=
  (n : ℝ)⁻¹ * ∑ i ∈ range n, f (X i ω) -
    cvCoeffHat f h X n ω * ((n : ℝ)⁻¹ * ∑ i ∈ range n, h (X i ω) - ∫ x, h x ∂Q)

/-- 3.2 With the estimated coefficient, the regression estimator is asymptotically normal with
the optimal variance `Var f - Cov(f, h)² / Var h = (1 - ρ²) Var f`. -/
theorem tendstoInDistribution_regressionEstimator {P : Measure Ω} [IsProbabilityMeasure P]
    {P' : Measure Ω'} [IsProbabilityMeasure P'] (Q : Measure α) [IsProbabilityMeasure Q]
    {f h : α → ℝ} (hf : MemLp f 2 Q) (hh : MemLp h 2 Q) {X : ℕ → Ω → α}
    (hX : ∀ i, HasLaw (X i) Q P) (hindep : iIndepFun X P) {Y : Ω' → ℝ}
    (hY : HasLaw Y (gaussianReal 0
      (variance f Q - covariance f h Q ^ 2 / variance h Q).toNNReal) P') :
    TendstoInDistribution
      (fun (n : ℕ) ω ↦ √(n : ℝ) * (regressionEstimator Q f h X n ω - ∫ x, f x ∂Q)) atTop Y
      (fun _ ↦ P) P' := by
  sorry

/-! ## Layer 4: antithetic variates -/

/-- 4.1 Harris's inequality for product measures on `ι → ℝ`: two functions that are monotone
for the coordinatewise order and square integrable are nonnegatively correlated. -/
theorem covariance_nonneg_of_monotone {ι : Type*} [Fintype ι] (ν : ι → Measure ℝ)
    [∀ i, IsProbabilityMeasure (ν i)] {f g : (ι → ℝ) → ℝ} (hf : Monotone f) (hg : Monotone g)
    (hf2 : MemLp f 2 (Measure.pi ν)) (hg2 : MemLp g 2 (Measure.pi ν)) :
    0 ≤ covariance f g (Measure.pi ν) := by
  sorry

/-- 4.2 Antithetic variates for monotone integrands: if each `T i` is antitone and preserves
`ν i`, a monotone square-integrable `f` is nonpositively correlated with `f ∘ T`, and the
antithetic average `(f + f ∘ T) / 2` has variance at most `Var f / 2`. -/
theorem variance_antithetic_le {ι : Type*} [Fintype ι] (ν : ι → Measure ℝ)
    [∀ i, IsProbabilityMeasure (ν i)] {T : ι → ℝ → ℝ} (hT : ∀ i, Antitone (T i))
    (hTν : ∀ i, MeasurePreserving (T i) (ν i) (ν i)) {f : (ι → ℝ) → ℝ} (hf : Monotone f)
    (hf2 : MemLp f 2 (Measure.pi ν)) :
    covariance f (fun x ↦ f fun i ↦ T i (x i)) (Measure.pi ν) ≤ 0 ∧
      variance (fun x ↦ (f x + f fun i ↦ T i (x i)) / 2) (Measure.pi ν) ≤
        variance f (Measure.pi ν) / 2 := by
  sorry

/-! ## Layer 5: stratified sampling -/

/-- 5.1 The probability `ω_h = P(s = h)` of stratum `h`. -/
def stratumWeight {ι : Type*} (Q : Measure α) (s : α → ι) (h : ι) : ℝ :=
  Q.real (s ⁻¹' {h})

/-- 5.1 The stratified estimate `∑_h ω_h (1/n_h) ∑_{j<n_h} f(X_{h,j})`. -/
def stratifiedEstimator {ι : Type*} [Fintype ι] (Q : Measure α) (s : α → ι) (f : α → ℝ)
    (n : ι → ℕ) (X : ι × ℕ → Ω → α) (ω : Ω) : ℝ :=
  ∑ h, stratumWeight Q s h * ((n h : ℝ)⁻¹ * ∑ j ∈ range (n h), f (X (h, j) ω))

/-- 5.1 Stratified sampling is unbiased and has variance `∑_h ω_h² σ_h² / n_h` (Owen, (8.7) and
(8.8)), where `σ_h²` is the variance of `f` under `Q` conditioned on stratum `h`. -/
theorem integral_variance_stratifiedEstimator {ι : Type*} [Fintype ι]
    {P : Measure Ω} [IsProbabilityMeasure P] (Q : Measure α) [IsProbabilityMeasure Q]
    {s : α → ι} (hs : ∀ h, MeasurableSet (s ⁻¹' {h}))
    {f : α → ℝ} (hf : MemLp f 2 Q) {n : ι → ℕ} (hn : ∀ h, 1 ≤ n h) {X : ι × ℕ → Ω → α}
    (hX : ∀ k, HasLaw (X k) (Q[|s ⁻¹' {k.1}]) P) (hindep : iIndepFun X P) :
    ∫ ω, stratifiedEstimator Q s f n X ω ∂P = ∫ x, f x ∂Q ∧
      variance (stratifiedEstimator Q s f n X) P =
        ∑ h, stratumWeight Q s h ^ 2 * variance f (Q[|s ⁻¹' {h}]) / n h := by
  sorry

/-- 5.2 Proportional allocation never loses (Owen, (8.13)–(8.14)): if `n_h = N ω_h` for every
stratum, the stratified estimate has variance at most `Var_Q(f) / N`. -/
theorem variance_stratifiedEstimator_le_of_proportional {ι : Type*} [Fintype ι]
    {P : Measure Ω} [IsProbabilityMeasure P] (Q : Measure α) [IsProbabilityMeasure Q]
    {s : α → ι} (hs : ∀ h, MeasurableSet (s ⁻¹' {h}))
    {f : α → ℝ} (hf : MemLp f 2 Q) {n : ι → ℕ} {N : ℕ}
    (hprop : ∀ h, (n h : ℝ) = N * stratumWeight Q s h) {X : ι × ℕ → Ω → α}
    (hX : ∀ k, HasLaw (X k) (Q[|s ⁻¹' {k.1}]) P) (hindep : iIndepFun X P) :
    variance (stratifiedEstimator Q s f n X) P ≤ variance f Q / N := by
  sorry

/-- 5.3 Neyman allocation (Owen, (8.17)–(8.18)): with `∑_h n_h = N`, the variance of the
stratified estimate is at least `(∑_h ω_h σ_h)² / N`, with equality when `n_h` is proportional
to `ω_h σ_h`. -/
theorem sq_sum_le_variance_stratifiedEstimator {ι : Type*} [Fintype ι]
    {P : Measure Ω} [IsProbabilityMeasure P] (Q : Measure α) [IsProbabilityMeasure Q]
    {s : α → ι} (hs : ∀ h, MeasurableSet (s ⁻¹' {h}))
    {f : α → ℝ} (hf : MemLp f 2 Q) {n : ι → ℕ} (hn : ∀ h, 1 ≤ n h) {N : ℕ}
    (hN : ∑ h, n h = N) {X : ι × ℕ → Ω → α}
    (hX : ∀ k, HasLaw (X k) (Q[|s ⁻¹' {k.1}]) P) (hindep : iIndepFun X P) :
    (∑ h, stratumWeight Q s h * √(variance f (Q[|s ⁻¹' {h}]))) ^ 2 / N ≤
        variance (stratifiedEstimator Q s f n X) P ∧
      ((∀ h, (n h : ℝ) * ∑ k, stratumWeight Q s k * √(variance f (Q[|s ⁻¹' {k}])) =
          N * (stratumWeight Q s h * √(variance f (Q[|s ⁻¹' {h}])))) →
        variance (stratifiedEstimator Q s f n X) P =
          (∑ h, stratumWeight Q s h * √(variance f (Q[|s ⁻¹' {h}]))) ^ 2 / N) := by
  sorry

end TauCetiRoadmap.ImportanceSamplingAndVarianceReduction
