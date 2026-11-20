import Mathlib

/-!
# PAC-Bayesian bounds: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib, each with `sorry`, together with the few
definitions they need; every definition has a real body. Every headline theorem of the README is
statable at the pins and is stated here. The README's remaining targets, API lists and Checks are
not restated.

Hypotheses `θ` range over a measurable space `Θ` and data over a measurable space `Z` with a
probability measure `P`. A loss is a jointly measurable function `ℓ : Θ → Z → ℝ` with values in
`[0, 1]`. A sample of size `n` is `S : Fin n → Z` under `Measure.pi (fun _ ↦ P)`. The prior `π`
and the posteriors `ρ` are probability measures on `Θ`, and relative entropy is Mathlib's
`InformationTheory.klDiv` with values in `ℝ≥0∞`; the bounds quantify over the posteriors with
`klDiv ρ π ≠ ∞` and use `(klDiv ρ π).toReal`. "With probability at least `1 - δ`, for every
posterior" is stated as: the set of samples on which some posterior violates the inequality has
measure at most `δ`. For an uncountable `Θ` that set need not be measurable, and Mathlib's
measure of it is its outer measure. The binary relative entropy `klBin` is copied verbatim from
MathematicalStatisticsNonparametric 1.3.
-/

noncomputable section

open MeasureTheory ProbabilityTheory InformationTheory
open Real (log exp)
open scoped ENNReal

namespace TauCetiRoadmap.PACBayesBounds

variable {Θ Z Ω : Type*} [MeasurableSpace Θ] [MeasurableSpace Z] [MeasurableSpace Ω]

/-! ## Layer 1: risks and the change of measure inequality -/

/-- 1.1 The risk of the hypothesis `θ`: the mean loss `∫ ℓ θ z dP(z)`. -/
def risk (P : Measure Z) (ℓ : Θ → Z → ℝ) (θ : Θ) : ℝ :=
  ∫ z, ℓ θ z ∂P

/-- 1.1 The empirical risk of the hypothesis `θ` on the sample `S` of size `n`:
`(∑ i, ℓ θ (S i)) / n`, which is `0` for `n = 0`. -/
def empiricalRisk {n : ℕ} (ℓ : Θ → Z → ℝ) (S : Fin n → Z) (θ : Θ) : ℝ :=
  (∑ i, ℓ θ (S i)) / n

/-- 1.2 The PAC-Bayesian change of measure inequality. If `f : Θ → Ω → ℝ` is jointly measurable
and `∫ exp (f θ) dμ ≤ 1` for every `θ`, then for `δ > 0`, outside a set of `μ`-measure at most `δ`,
every posterior `ρ` with `klDiv ρ π` finite has `∫ f(θ, ω) dρ(θ) ≤ KL(ρ‖π) + log (1/δ)`. -/
theorem measure_exists_integral_gt_klDiv_add_log_le (μ : Measure Ω) [IsProbabilityMeasure μ]
    (π : Measure Θ) [IsProbabilityMeasure π] (f : Θ → Ω → ℝ)
    (hf : Measurable (Function.uncurry f))
    (hexp : ∀ θ, ∫⁻ ω, ENNReal.ofReal (exp (f θ ω)) ∂μ ≤ 1) {δ : ℝ} (hδ : 0 < δ) :
    μ {ω | ∃ ρ : Measure Θ, IsProbabilityMeasure ρ ∧ klDiv ρ π ≠ ∞ ∧
        (klDiv ρ π).toReal + log (1 / δ) < ∫ θ, f θ ω ∂ρ} ≤ ENNReal.ofReal δ := by
  sorry

/-! ## Layer 2: exponential moments of one hypothesis -/

/-- 2.3 The binary relative entropy, copied verbatim from MathematicalStatisticsNonparametric 1.3:
`klBin a b = a log (a / b) + (1 - a) log ((1 - a) / (1 - b))`, with Mathlib's conventions
`log 0 = 0` and `x / 0 = 0`. -/
def klBin (a b : ℝ) : ℝ :=
  a * Real.log (a / b) + (1 - a) * Real.log ((1 - a) / (1 - b))

/-- 2.3 Maurer's inequality. For a measurable `g : Z → [0, 1]` with mean `μ = ∫ g dP` and a
sample of size `n ≥ 1`, the empirical mean `M` satisfies `E exp (n · kl(M ‖ μ)) ≤ 2 √n`. -/
theorem lintegral_exp_mul_klBin_le (P : Measure Z) [IsProbabilityMeasure P] {g : Z → ℝ}
    (hg : Measurable g) (hg01 : ∀ z, g z ∈ Set.Icc 0 1) {n : ℕ} (hn : 0 < n) :
    ∫⁻ S, ENNReal.ofReal (exp (n * klBin ((∑ i, g (S i)) / n) (∫ z, g z ∂P)))
        ∂(Measure.pi fun _ : Fin n ↦ P) ≤ ENNReal.ofReal (2 * √n) := by
  sorry

/-! ## Layer 3: PAC-Bayesian bounds -/

/-- 3.1 Catoni's bound, Hoeffding form, at a fixed inverse temperature `β > 0`: with probability
at least `1 - δ`, every posterior `ρ` has
`R(ρ) ≤ r(ρ) + β / (8 n) + (KL(ρ‖π) + log (1/δ)) / β`. -/
theorem catoni_bound (P : Measure Z) [IsProbabilityMeasure P] (π : Measure Θ)
    [IsProbabilityMeasure π] (ℓ : Θ → Z → ℝ) (hℓ : Measurable (Function.uncurry ℓ))
    (hℓ01 : ∀ θ z, ℓ θ z ∈ Set.Icc 0 1) {n : ℕ} (hn : 0 < n) {β δ : ℝ} (hβ : 0 < β)
    (hδ : 0 < δ) :
    (Measure.pi fun _ : Fin n ↦ P)
        {S | ∃ ρ : Measure Θ, IsProbabilityMeasure ρ ∧ klDiv ρ π ≠ ∞ ∧
          ∫ θ, empiricalRisk ℓ S θ ∂ρ + β / (8 * n) + ((klDiv ρ π).toReal + log (1 / δ)) / β <
            ∫ θ, risk P ℓ θ ∂ρ} ≤ ENNReal.ofReal δ := by
  sorry

/-- 3.2 Catoni's bound, Bernoulli form, at a fixed inverse temperature `β > 0`: with probability
at least `1 - δ`, every posterior `ρ` has
`R(ρ) ≤ (1 - exp (-(β/n) r(ρ) - (KL(ρ‖π) + log (1/δ)) / n)) / (1 - exp (-β/n))`. -/
theorem catoni_bernoulli_bound (P : Measure Z) [IsProbabilityMeasure P] (π : Measure Θ)
    [IsProbabilityMeasure π] (ℓ : Θ → Z → ℝ) (hℓ : Measurable (Function.uncurry ℓ))
    (hℓ01 : ∀ θ z, ℓ θ z ∈ Set.Icc 0 1) {n : ℕ} (hn : 0 < n) {β δ : ℝ} (hβ : 0 < β)
    (hδ : 0 < δ) :
    (Measure.pi fun _ : Fin n ↦ P)
        {S | ∃ ρ : Measure Θ, IsProbabilityMeasure ρ ∧ klDiv ρ π ≠ ∞ ∧
          (1 - exp (-(β / n) * ∫ θ, empiricalRisk ℓ S θ ∂ρ -
              ((klDiv ρ π).toReal + log (1 / δ)) / n)) / (1 - exp (-(β / n))) <
            ∫ θ, risk P ℓ θ ∂ρ} ≤ ENNReal.ofReal δ := by
  sorry

/-- 3.3 The Seeger–Maurer bound: with probability at least `1 - δ`, every posterior `ρ` has
`kl(r(ρ) ‖ R(ρ)) ≤ (KL(ρ‖π) + log (2 √n / δ)) / n`. -/
theorem seeger_maurer_bound (P : Measure Z) [IsProbabilityMeasure P] (π : Measure Θ)
    [IsProbabilityMeasure π] (ℓ : Θ → Z → ℝ) (hℓ : Measurable (Function.uncurry ℓ))
    (hℓ01 : ∀ θ z, ℓ θ z ∈ Set.Icc 0 1) {n : ℕ} (hn : 0 < n) {δ : ℝ} (hδ : 0 < δ) :
    (Measure.pi fun _ : Fin n ↦ P)
        {S | ∃ ρ : Measure Θ, IsProbabilityMeasure ρ ∧ klDiv ρ π ≠ ∞ ∧
          ((klDiv ρ π).toReal + log (2 * √n / δ)) / n <
            klBin (∫ θ, empiricalRisk ℓ S θ ∂ρ) (∫ θ, risk P ℓ θ ∂ρ)} ≤ ENNReal.ofReal δ := by
  sorry

/-- 3.4 McAllester's bound with Maurer's constant: with probability at least `1 - δ`, every
posterior `ρ` has `R(ρ) ≤ r(ρ) + √((KL(ρ‖π) + log (2 √n / δ)) / (2 n))`. -/
theorem mcallester_bound (P : Measure Z) [IsProbabilityMeasure P] (π : Measure Θ)
    [IsProbabilityMeasure π] (ℓ : Θ → Z → ℝ) (hℓ : Measurable (Function.uncurry ℓ))
    (hℓ01 : ∀ θ z, ℓ θ z ∈ Set.Icc 0 1) {n : ℕ} (hn : 0 < n) {δ : ℝ} (hδ : 0 < δ) :
    (Measure.pi fun _ : Fin n ↦ P)
        {S | ∃ ρ : Measure Θ, IsProbabilityMeasure ρ ∧ klDiv ρ π ≠ ∞ ∧
          ∫ θ, empiricalRisk ℓ S θ ∂ρ + √(((klDiv ρ π).toReal + log (2 * √n / δ)) / (2 * n)) <
            ∫ θ, risk P ℓ θ ∂ρ} ≤ ENNReal.ofReal δ := by
  sorry

/-! ## Layer 4: the Gibbs posterior -/

/-- 4.1 The Gibbs posterior at inverse temperature `β` on the sample `S`: the prior tilted by
`θ ↦ -β r(θ, S)`, with density `exp (-β r(θ, S)) / ∫ exp (-β r) dπ` with respect to `π`. -/
def gibbsPosterior (ℓ : Θ → Z → ℝ) (π : Measure Θ) (β : ℝ) {n : ℕ} (S : Fin n → Z) :
    Measure Θ :=
  π.tilted fun θ ↦ -(β * empiricalRisk ℓ S θ)

/-- 4.1 For `β > 0` and every sample, the Gibbs posterior is a probability measure of finite
relative entropy to the prior, it attains the value `-(1/β) log ∫ exp (-β r) dπ` of the Catoni
objective `ρ ↦ r(ρ) + KL(ρ‖π) / β`, and every other posterior of finite relative entropy has a
strictly larger objective. -/
theorem gibbsPosterior_isLeast (π : Measure Θ) [IsProbabilityMeasure π] (ℓ : Θ → Z → ℝ)
    (hℓ : Measurable (Function.uncurry ℓ)) (hℓ01 : ∀ θ z, ℓ θ z ∈ Set.Icc 0 1) {n : ℕ}
    (S : Fin n → Z) {β : ℝ} (hβ : 0 < β) :
    IsProbabilityMeasure (gibbsPosterior ℓ π β S) ∧ klDiv (gibbsPosterior ℓ π β S) π ≠ ∞ ∧
      ∫ θ, empiricalRisk ℓ S θ ∂(gibbsPosterior ℓ π β S) +
          (klDiv (gibbsPosterior ℓ π β S) π).toReal / β =
        -log (∫ θ, exp (-(β * empiricalRisk ℓ S θ)) ∂π) / β ∧
      ∀ ρ : Measure Θ, IsProbabilityMeasure ρ → klDiv ρ π ≠ ∞ → ρ ≠ gibbsPosterior ℓ π β S →
        ∫ θ, empiricalRisk ℓ S θ ∂(gibbsPosterior ℓ π β S) +
            (klDiv (gibbsPosterior ℓ π β S) π).toReal / β <
          ∫ θ, empiricalRisk ℓ S θ ∂ρ + (klDiv ρ π).toReal / β := by
  sorry

/-- 4.2 The oracle inequality in probability for the Gibbs posterior: with probability at least
`1 - δ`, for every posterior `ρ`,
`R(ρ̂_β) ≤ R(ρ) + β / (4 n) + 2 (KL(ρ‖π) + log (2/δ)) / β`. -/
theorem gibbsPosterior_oracle (P : Measure Z) [IsProbabilityMeasure P] (π : Measure Θ)
    [IsProbabilityMeasure π] (ℓ : Θ → Z → ℝ) (hℓ : Measurable (Function.uncurry ℓ))
    (hℓ01 : ∀ θ z, ℓ θ z ∈ Set.Icc 0 1) {n : ℕ} (hn : 0 < n) {β δ : ℝ} (hβ : 0 < β)
    (hδ : 0 < δ) :
    (Measure.pi fun _ : Fin n ↦ P)
        {S | ∃ ρ : Measure Θ, IsProbabilityMeasure ρ ∧ klDiv ρ π ≠ ∞ ∧
          ∫ θ, risk P ℓ θ ∂ρ + β / (4 * n) + 2 * ((klDiv ρ π).toReal + log (2 / δ)) / β <
            ∫ θ, risk P ℓ θ ∂(gibbsPosterior ℓ π β S)} ≤ ENNReal.ofReal δ := by
  sorry

/-- 4.3 The oracle inequality in expectation for the Gibbs posterior: for every posterior `ρ`,
`E_S R(ρ̂_β) ≤ R(ρ) + β / (8 n) + KL(ρ‖π) / β`. -/
theorem integral_risk_gibbsPosterior_le (P : Measure Z) [IsProbabilityMeasure P]
    (π : Measure Θ) [IsProbabilityMeasure π] (ℓ : Θ → Z → ℝ)
    (hℓ : Measurable (Function.uncurry ℓ)) (hℓ01 : ∀ θ z, ℓ θ z ∈ Set.Icc 0 1) {n : ℕ}
    (hn : 0 < n) {β : ℝ} (hβ : 0 < β) (ρ : Measure Θ) [IsProbabilityMeasure ρ]
    (hρ : klDiv ρ π ≠ ∞) :
    ∫ S, ∫ θ, risk P ℓ θ ∂(gibbsPosterior ℓ π β S) ∂(Measure.pi fun _ : Fin n ↦ P) ≤
      ∫ θ, risk P ℓ θ ∂ρ + β / (8 * n) + (klDiv ρ π).toReal / β := by
  sorry

end TauCetiRoadmap.PACBayesBounds
