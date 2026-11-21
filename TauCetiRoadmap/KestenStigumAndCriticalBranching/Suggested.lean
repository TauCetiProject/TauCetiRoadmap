import Mathlib
import TauCeti.MeasureTheory.Group.Convolution.Power
import TauCeti.MeasureTheory.Measure.Weighted
import TauCeti.Probability.Process.MarkovChain

/-!
# The Kesten–Stigum theorem and critical branching: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the
definitions they need; every definition has a real body. Every headline theorem of the README is
statable at the pins and is stated here.

The Galton–Watson process is the one of the roadmap PopulationDynamics (Layer 1): the definitions
`gwKernel`, `offspringMean`, `IsGaltonWatson` and `extinctionProb` below are copied verbatim from
PopulationDynamics 1.1, 1.2 and 1.4, because a roadmap's file cannot import another roadmap.

Suppliers used by the statements: Mathlib `Kernel.ofFunOfCountable`, `ProbabilityTheory.HasLaw`,
`Measure.conv`, `Filtration.piLE`, `Measure.MutuallySingular`, `iIndepFun`, `IdentDistrib`,
`ProbabilityTheory.cond`, `ProbabilityTheory.expMeasure` and `BoundedContinuousFunction`; Tau Ceti
`MeasureTheory.Measure.convolutionPower`, `MeasureTheory.Measure.weighted` and
`TauCeti.Probability.markovChainLaw`.
-/

noncomputable section

open Filter Topology MeasureTheory ProbabilityTheory Set
open TauCeti.Probability
open scoped NNReal ENNReal BoundedContinuousFunction

namespace TauCetiRoadmap.KestenStigumAndCriticalBranching

variable {Ω : Type*} [MeasurableSpace Ω]

/-! ## Conventions: the Galton–Watson process of PopulationDynamics -/

/-- Conventions (copied verbatim from PopulationDynamics 1.1): the generation
kernel of the Galton–Watson process with offspring law `ν`. -/
def gwKernel (ν : Measure ℕ) : Kernel ℕ ℕ :=
  Kernel.ofFunOfCountable fun n ↦ ν.convolutionPower n

/-- Conventions (copied verbatim from PopulationDynamics 1.1): for a probability measure `ν` the
generation kernel is a Markov kernel. -/
instance (ν : Measure ℕ) [IsProbabilityMeasure ν] : IsMarkovKernel (gwKernel ν) :=
  ⟨fun n ↦ inferInstanceAs (IsProbabilityMeasure (ν.convolutionPower n))⟩

/-- Conventions (copied verbatim from PopulationDynamics 1.1): the mean number of
offspring, in `[0, ∞]`. -/
def offspringMean (ν : Measure ℕ) : ℝ≥0∞ :=
  ∫⁻ k, (k : ℝ≥0∞) ∂ν

/-- Conventions (copied verbatim from PopulationDynamics 1.2): `Z` is a
Galton–Watson process with offspring law `ν` started from one individual. -/
def IsGaltonWatson (ν : Measure ℕ) [IsProbabilityMeasure ν] (Z : ℕ → Ω → ℕ) (μ : Measure Ω) :
    Prop :=
  HasLaw (fun ω n ↦ Z n ω) (markovChainLaw (Measure.dirac 1) (gwKernel ν)) μ

/-- Conventions (copied verbatim from PopulationDynamics 1.4): the extinction
probability of the Galton–Watson process with offspring law `ν`. -/
def extinctionProb (ν : Measure ℕ) [IsProbabilityMeasure ν] : ℝ :=
  (markovChainLaw (Measure.dirac 1) (gwKernel ν)).real {x | ∃ n, x n = 0}

/-! ## Layer 1: two dichotomies -/

/-- 1.1 (Lyons–Peres, Lemma 12.1): for independent, identically distributed, nonnegative
`X n`, the ratios `X n / n` tend to `0` almost surely when `X 0` is integrable, and are
almost surely unbounded above otherwise. -/
theorem ae_tendsto_div_or_frequently_lt {μ : Measure Ω} [IsProbabilityMeasure μ]
    {X : ℕ → Ω → ℝ} (hX : ∀ n, Measurable (X n)) (hind : iIndepFun X μ)
    (hident : ∀ n, IdentDistrib (X n) (X 0) μ μ) (hnn : ∀ n ω, 0 ≤ X n ω) :
    (Integrable (X 0) μ → ∀ᵐ ω ∂μ, Tendsto (fun n : ℕ ↦ X n ω / n) atTop (𝓝 0)) ∧
      (¬ Integrable (X 0) μ → ∀ᵐ ω ∂μ, ∀ C : ℝ, ∃ᶠ n : ℕ in atTop, C < X n ω / n) :=
  sorry

/-- 1.2 (Lyons–Peres, Lemma 12.2): let `μ` be a finite measure and `ν` a probability measure,
`ℱ` a filtration generating the σ-algebra, and `X n` a density of `μ` with respect to `ν` on
`ℱ n`. With `X∞ = limsup X n` (in `[0, ∞]`): `μ ≪ ν` iff `X∞ < ∞` `μ`-a.e. iff
`∫ X∞ dν = μ Ω`, and `μ ⟂ ν` iff `X∞ = ∞` `μ`-a.e. iff `∫ X∞ dν = 0`. -/
theorem absolutelyContinuous_mutuallySingular_iff_limsup {α : Type*} {mα : MeasurableSpace α}
    (μ ν : Measure α) [IsFiniteMeasure μ] [IsProbabilityMeasure ν] (ℱ : Filtration ℕ mα)
    (hℱ : ⨆ n, ℱ n = mα) (X : ℕ → α → ℝ≥0∞) (hXm : ∀ n, Measurable[ℱ n] (X n))
    (hX : ∀ n s, MeasurableSet[ℱ n] s → μ s = ∫⁻ ω in s, X n ω ∂ν) :
    ((μ ≪ ν ↔ ∀ᵐ ω ∂μ, limsup (fun n ↦ X n ω) atTop < ∞) ∧
        (μ ≪ ν ↔ ∫⁻ ω, limsup (fun n ↦ X n ω) atTop ∂ν = μ univ)) ∧
      ((μ ⟂ₘ ν ↔ ∀ᵐ ω ∂μ, limsup (fun n ↦ X n ω) atTop = ∞) ∧
        (μ ⟂ₘ ν ↔ ∫⁻ ω, limsup (fun n ↦ X n ω) atTop ∂ν = 0)) :=
  sorry

/-! ## Layer 2: processes with immigration and size biasing -/

/-- 2.1: the generation kernel of the Galton–Watson process with offspring law `ν` and
immigration law `ρ`: from `n` individuals, the next generation is the sum of `n` independent
copies of `ν` and an independent number of immigrants of law `ρ`. -/
def immigrationKernel (ν ρ : Measure ℕ) : Kernel ℕ ℕ :=
  Kernel.ofFunOfCountable fun n ↦ ν.convolutionPower n ∗ ρ

/-- 2.1: for probability measures `ν` and `ρ` the immigration kernel is a Markov kernel. -/
instance (ν ρ : Measure ℕ) [IsProbabilityMeasure ν] [IsProbabilityMeasure ρ] :
    IsMarkovKernel (immigrationKernel ν ρ) :=
  ⟨fun n ↦ inferInstanceAs (IsProbabilityMeasure (ν.convolutionPower n ∗ ρ))⟩

/-- 2.1: `Z` is a Galton–Watson process with offspring law `ν` and immigration law `ρ`, started
with no individuals: its path law is that of the chain with kernel `immigrationKernel ν ρ`
started at `0`. -/
def IsGaltonWatsonImmigration (ν ρ : Measure ℕ) [IsProbabilityMeasure ν] [IsProbabilityMeasure ρ]
    (Z : ℕ → Ω → ℕ) (μ : Measure Ω) : Prop :=
  HasLaw (fun ω n ↦ Z n ω) (markovChainLaw (Measure.dirac 0) (immigrationKernel ν ρ)) μ

/-- 2.2 (Seneta's theorem; Lyons–Peres, Theorem 12.3): for a supercritical offspring law of finite
mean `m`, if the immigration law has `E log⁺ Y < ∞` then `Z n / m ^ n` converges almost surely to
a finite limit; otherwise `Z n / c ^ n` is almost surely unbounded above for every `c > 0`. -/
theorem IsGaltonWatsonImmigration.seneta {ν ρ : Measure ℕ} [IsProbabilityMeasure ν]
    [IsProbabilityMeasure ρ] {Z : ℕ → Ω → ℕ} {μ : Measure Ω}
    (h : IsGaltonWatsonImmigration ν ρ Z μ) (hm1 : 1 < offspringMean ν)
    (hm : offspringMean ν ≠ ⊤) :
    (Integrable (fun k : ℕ ↦ Real.log k) ρ →
        ∀ᵐ ω ∂μ, ∃ w : ℝ,
          Tendsto (fun n ↦ (Z n ω : ℝ) / (offspringMean ν).toReal ^ n) atTop (𝓝 w)) ∧
      (¬ Integrable (fun k : ℕ ↦ Real.log k) ρ →
        ∀ᵐ ω ∂μ, ∀ c : ℝ, 0 < c → ∀ C : ℝ, ∃ᶠ n in atTop, C < (Z n ω : ℝ) / c ^ n) :=
  sorry

/-- 2.3 (the size-biased process; Lyons–Peres, (12.1)–(12.2) and §12.1): let `0 < m < ∞` and let
`ρ` be the size-biased offspring law shifted down by one. One plus the immigration process with
offspring law `ν` and immigration law `ρ` has, on the first `n + 1` coordinates, the law of the
Galton–Watson process reweighted by `Z n / m ^ n`. -/
theorem sizeBiased_eq_setLIntegral {ν ρ : Measure ℕ} [IsProbabilityMeasure ν]
    [IsProbabilityMeasure ρ] (hm0 : offspringMean ν ≠ 0) (hm : offspringMean ν ≠ ⊤)
    (hρ : ρ = (ν.weighted fun k ↦ (k : ℝ≥0)).map (fun k ↦ k - 1)) (n : ℕ) {s : Set (ℕ → ℕ)}
    (hs : MeasurableSet[Filtration.piLE n] s) :
    ((markovChainLaw (Measure.dirac 0) (immigrationKernel ν ρ)).map fun x i ↦ x i + 1) s =
      ∫⁻ x in s, (x n : ℝ≥0∞) / offspringMean ν ^ n
        ∂(markovChainLaw (Measure.dirac 1) (gwKernel ν)) :=
  sorry

/-! ## Layer 3: the Kesten–Stigum theorem -/

/-- 3.1 (the Kesten–Stigum theorem; Lyons–Peres, §12.2): for `1 < m < ∞` the martingale
`Z n / m ^ n` converges almost surely to a measurable `W`; the condition `E[L log⁺ L] < ∞` is
equivalent to `E W = 1` and to `P(W = 0) = q`, and when it fails `W = 0` almost surely. -/
theorem IsGaltonWatson.kestenStigum {ν : Measure ℕ} [IsProbabilityMeasure ν] {Z : ℕ → Ω → ℕ}
    {μ : Measure Ω} (h : IsGaltonWatson ν Z μ) (hm1 : 1 < offspringMean ν)
    (hm : offspringMean ν ≠ ⊤) :
    ∃ W : Ω → ℝ, Measurable W ∧
      (∀ᵐ ω ∂μ, Tendsto (fun n ↦ (Z n ω : ℝ) / (offspringMean ν).toReal ^ n) atTop
        (𝓝 (W ω))) ∧
      (Integrable (fun k : ℕ ↦ (k : ℝ) * Real.log k) ν ↔ ∫ ω, W ω ∂μ = 1) ∧
      (Integrable (fun k : ℕ ↦ (k : ℝ) * Real.log k) ν ↔
        μ.real {ω | W ω = 0} = extinctionProb ν) ∧
      (¬ Integrable (fun k : ℕ ↦ (k : ℝ) * Real.log k) ν → ∀ᵐ ω ∂μ, W ω = 0) :=
  sorry

/-! ## Layer 4: critical processes -/

/-- 4.1 (Kolmogorov's estimate; Lyons–Peres, Theorem 12.7 (i)): for a critical offspring law,
`n P(Z n > 0)` tends to `2 / σ²` in `[0, ∞]`, where `σ² = E (L - 1)² ∈ [0, ∞]`; the limit is `0`
when `σ² = ∞`. -/
theorem IsGaltonWatson.tendsto_mul_measure_pos {ν : Measure ℕ} [IsProbabilityMeasure ν]
    {Z : ℕ → Ω → ℕ} {μ : Measure Ω} (h : IsGaltonWatson ν Z μ) (hm : offspringMean ν = 1) :
    Tendsto (fun n : ℕ ↦ (n : ℝ≥0∞) * μ {ω | 0 < Z n ω}) atTop
      (𝓝 (2 / ∫⁻ k, ENNReal.ofReal (((k : ℝ) - 1) ^ 2) ∂ν)) :=
  sorry

/-- 4.2 (Yaglom's limit law; Lyons–Peres, Theorem 12.7 (ii)): for a critical offspring law with
finite variance `σ² > 0`, the law of `Z n / n` given `Z n > 0` converges weakly to the
exponential law of mean `σ² / 2`, that is, of rate `2 / σ²`. -/
theorem IsGaltonWatson.yaglom {ν : Measure ℕ} [IsProbabilityMeasure ν] {Z : ℕ → Ω → ℕ}
    {μ : Measure Ω} (h : IsGaltonWatson ν Z μ) (hm : offspringMean ν = 1)
    (hν : MemLp (fun k : ℕ ↦ (k : ℝ)) 2 ν) (h1 : ν {1} ≠ 1) (f : ℝ →ᵇ ℝ) :
    Tendsto (fun n : ℕ ↦ ∫ ω, f ((Z n ω : ℝ) / n) ∂(μ[|{ω | 0 < Z n ω}])) atTop
      (𝓝 (∫ x, f x ∂(expMeasure (2 / Var[fun k : ℕ ↦ (k : ℝ); ν])))) :=
  sorry

end TauCetiRoadmap.KestenStigumAndCriticalBranching
