import Mathlib
import TauCeti.MeasureTheory.Group.Convolution.Power
import TauCeti.Probability.Distributions.Poisson.Mixed.Basic
import TauCeti.Probability.GeneratingFunction
import TauCeti.Probability.Process.MarkovChain

/-!
# Mathematical population dynamics: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the
definitions they need; every definition has a real body. Every headline theorem of the README is
statable at the pins and is stated here. The README's remaining targets, API lists and Checks are
not restated.

Suppliers used by the statements: Mathlib `IsIntegralCurveOn`, `IsIntegralCurve`,
`Kernel.ofFunOfCountable`, `ProbabilityTheory.HasLaw`, `Martingale`, `Filtration.natural`,
`ProbabilityTheory.binomial`, `bernoulliMeasure`, `geometricMeasure`, `expMeasure`, `variance`,
`MemLp` and `eLpNorm`; Tau Ceti `MeasureTheory.Measure.convolutionPower`,
`TauCeti.Probability.pgf`, `TauCeti.Probability.markovChainLaw` and
`TauCeti.Probability.mixedPoissonMeasure`.
-/

noncomputable section

open Filter Topology MeasureTheory ProbabilityTheory Set Finset
open TauCeti.Probability
open scoped NNReal ENNReal

namespace TauCetiRoadmap.PopulationDynamics

variable {Ω : Type*} [MeasurableSpace Ω]

/-! ## Layer 1: Galton–Watson branching processes -/

/-- 1.1: the generation kernel of the Galton–Watson process with offspring law `ν`: from `n`
individuals the next generation has the law of a sum of `n` independent copies of `ν`. -/
def gwKernel (ν : Measure ℕ) : Kernel ℕ ℕ :=
  Kernel.ofFunOfCountable fun n ↦ ν.convolutionPower n

instance (ν : Measure ℕ) [IsProbabilityMeasure ν] : IsMarkovKernel (gwKernel ν) :=
  ⟨fun n ↦ inferInstanceAs (IsProbabilityMeasure (ν.convolutionPower n))⟩

/-- 1.1: the mean number of offspring, in `[0, ∞]`. -/
def offspringMean (ν : Measure ℕ) : ℝ≥0∞ :=
  ∫⁻ k, (k : ℝ≥0∞) ∂ν

/-- 1.2: `Z` is a Galton–Watson process with offspring law `ν` started from one individual: its
path law is that of the chain with kernel `gwKernel ν` started at `1`. -/
def IsGaltonWatson (ν : Measure ℕ) [IsProbabilityMeasure ν] (Z : ℕ → Ω → ℕ) (μ : Measure Ω) :
    Prop :=
  HasLaw (fun ω n ↦ Z n ω) (markovChainLaw (Measure.dirac 1) (gwKernel ν)) μ

/-- 1.2: the generating function of the `n`th generation is the `n`th iterate of the offspring
generating function, on `[-1, 1]`. -/
theorem IsGaltonWatson.pgf_eq_iterate {ν : Measure ℕ} [IsProbabilityMeasure ν] {Z : ℕ → Ω → ℕ}
    {μ : Measure Ω} (h : IsGaltonWatson ν Z μ) (n : ℕ) {s : ℝ} (hs : |s| ≤ 1) :
    pgf (Z n) μ s = (pgf id ν)^[n] s :=
  sorry

/-- 1.2: the mean of the `n`th generation is `m ^ n`, in `[0, ∞]` and for every offspring law. -/
theorem IsGaltonWatson.lintegral_eq_pow {ν : Measure ℕ} [IsProbabilityMeasure ν]
    {Z : ℕ → Ω → ℕ} {μ : Measure Ω} (h : IsGaltonWatson ν Z μ) (n : ℕ) :
    ∫⁻ ω, (Z n ω : ℝ≥0∞) ∂μ = offspringMean ν ^ n :=
  sorry

/-- 1.2: the variance of the `n`th generation is `σ² (m^(n-1) + ⋯ + m^(2n-2))` for an offspring
law with a second moment. -/
theorem IsGaltonWatson.variance_eq {ν : Measure ℕ} [IsProbabilityMeasure ν] {Z : ℕ → Ω → ℕ}
    {μ : Measure Ω} (h : IsGaltonWatson ν Z μ) (hν : MemLp (fun k : ℕ ↦ (k : ℝ)) 2 ν) (n : ℕ) :
    Var[fun ω ↦ (Z n ω : ℝ); μ] =
      Var[fun k : ℕ ↦ (k : ℝ); ν] * ∑ k ∈ range n, (∫ k : ℕ, (k : ℝ) ∂ν) ^ (n - 1 + k) :=
  sorry

/-- 1.3: for `0 < m < ∞` the normalized generation sizes `Z n / m ^ n` are a martingale for the
natural filtration of the process. -/
theorem IsGaltonWatson.martingale {ν : Measure ℕ} [IsProbabilityMeasure ν] {Z : ℕ → Ω → ℕ}
    {μ : Measure Ω} (h : IsGaltonWatson ν Z μ) (hZ : ∀ n, Measurable (Z n))
    (hm0 : offspringMean ν ≠ 0) (hm : offspringMean ν ≠ ⊤) :
    Martingale (fun n ω ↦ (Z n ω : ℝ) / (offspringMean ν).toReal ^ n)
      (Filtration.natural Z fun n ↦ (hZ n).stronglyMeasurable) μ :=
  sorry

/-- 1.4: the extinction probability of the Galton–Watson process with offspring law `ν`. -/
def extinctionProb (ν : Measure ℕ) [IsProbabilityMeasure ν] : ℝ :=
  (markovChainLaw (Measure.dirac 1) (gwKernel ν)).real {x | ∃ n, x n = 0}

/-- 1.4: the extinction probability is the least fixed point of the offspring generating function
in `[0, 1]`. -/
theorem isLeast_extinctionProb (ν : Measure ℕ) [IsProbabilityMeasure ν] :
    IsLeast {s : ℝ | 0 ≤ s ∧ s ≤ 1 ∧ pgf id ν s = s} (extinctionProb ν) :=
  sorry

/-- 1.4: extinction is almost sure exactly when `m ≤ 1` and the offspring law is not the point
mass at `1`. -/
theorem extinctionProb_eq_one_iff (ν : Measure ℕ) [IsProbabilityMeasure ν] :
    extinctionProb ν = 1 ↔ offspringMean ν ≤ 1 ∧ ν {1} ≠ 1 :=
  sorry

/-- 1.4: unless every individual has exactly one child, the process dies out or tends to
infinity, almost surely. -/
theorem IsGaltonWatson.ae_extinct_or_tendsto_atTop {ν : Measure ℕ} [IsProbabilityMeasure ν]
    {Z : ℕ → Ω → ℕ} {μ : Measure Ω} (h : IsGaltonWatson ν Z μ) (h1 : ν {1} ≠ 1) :
    ∀ᵐ ω ∂μ, (∃ n, Z n ω = 0) ∨ Tendsto (fun n ↦ Z n ω) atTop atTop :=
  sorry

/-- 1.5: for a supercritical offspring law with a second moment, `Z n / m ^ n` converges almost
surely and in `L²` to a limit `W` of mean `1` and variance `σ² / (m (m - 1))`, which vanishes
exactly with the extinction probability. -/
theorem IsGaltonWatson.exists_tendsto_eLpNorm_two {ν : Measure ℕ} [IsProbabilityMeasure ν]
    {Z : ℕ → Ω → ℕ} {μ : Measure Ω} (h : IsGaltonWatson ν Z μ)
    (hν : MemLp (fun k : ℕ ↦ (k : ℝ)) 2 ν) (hm : 1 < ∫ k : ℕ, (k : ℝ) ∂ν) :
    ∃ W : Ω → ℝ, MemLp W 2 μ ∧
      Tendsto (fun n ↦ eLpNorm (fun ω ↦ (Z n ω : ℝ) / (∫ k : ℕ, (k : ℝ) ∂ν) ^ n - W ω) 2 μ)
        atTop (𝓝 0) ∧
      (∀ᵐ ω ∂μ, Tendsto (fun n ↦ (Z n ω : ℝ) / (∫ k : ℕ, (k : ℝ) ∂ν) ^ n) atTop (𝓝 (W ω))) ∧
      ∫ ω, W ω ∂μ = 1 ∧
      Var[W; μ] = Var[fun k : ℕ ↦ (k : ℝ); ν] /
        ((∫ k : ℕ, (k : ℝ) ∂ν) * ((∫ k : ℕ, (k : ℝ) ∂ν) - 1)) ∧
      μ.real {ω | W ω = 0} = extinctionProb ν :=
  sorry

/-- 1.6: for the geometric offspring law with success probability `p`, of mean
`m = (1 - p) / p`, the probability of extinction by generation `n` is
`(1 + m + ⋯ + m^(n-1)) / (1 + m + ⋯ + m^n)`. For `p = 0` Mathlib's geometric law is the point
mass at `0` and the formula holds with `m = 0`. -/
theorem IsGaltonWatson.measureReal_eq_zero_geometric {p : unitInterval} {Z : ℕ → Ω → ℕ}
    {μ : Measure Ω} (h : IsGaltonWatson (geometricMeasure p) Z μ) (n : ℕ) :
    μ.real {ω | Z n ω = 0} =
      (∑ k ∈ range n, ((1 - (p : ℝ)) / p) ^ k) / ∑ k ∈ range (n + 1), ((1 - (p : ℝ)) / p) ^ k :=
  sorry

/-- 1.6: the extinction probability of the geometric offspring law is `1` for `p ≥ 1/2` and
`p / (1 - p)` for `0 < p < 1/2`. -/
theorem extinctionProb_geometric {p : unitInterval} (hp : p ≠ 0) :
    extinctionProb (geometricMeasure p) = (p : ℝ) / max (p : ℝ) (1 - p) :=
  sorry

/-! ## Layer 2: deterministic models -/

/-- 2.2: the logistic vector field `r x (1 - x / K)`. -/
def logisticField (r K x : ℝ) : ℝ :=
  r * x * (1 - x / K)

/-- 2.2: the solution of the logistic equation with initial value `x₀`. -/
def logisticSolution (r K x₀ t : ℝ) : ℝ :=
  K * x₀ / (x₀ + (K - x₀) * Real.exp (-(r * t)))

/-- 2.2: from a nonnegative initial value, the solutions of the logistic equation on `[0, ∞)` are
exactly the functions that agree there with the explicit solution. -/
theorem isIntegralCurveOn_logisticField_iff {r K : ℝ} (hr : 0 < r) (hK : 0 < K) {x : ℝ → ℝ}
    (h0 : 0 ≤ x 0) :
    IsIntegralCurveOn x (fun _ ↦ logisticField r K) (Ici 0) ↔
      EqOn x (logisticSolution r K (x 0)) (Ici 0) :=
  sorry

/-- 2.3: the Lotka–Volterra predator–prey field `(x (α - β y), y (δ x - γ))`. -/
def lotkaVolterraField (α β γ δ : ℝ) (z : ℝ × ℝ) : ℝ × ℝ :=
  (z.1 * (α - β * z.2), z.2 * (δ * z.1 - γ))

/-- 2.3: the first integral `δ x - γ log x + β y - α log y` of the predator–prey system. -/
def lotkaVolterraIntegral (α β γ δ : ℝ) (z : ℝ × ℝ) : ℝ :=
  δ * z.1 - γ * Real.log z.1 + β * z.2 - α * Real.log z.2

/-- 2.3: from every point of the open quadrant the predator–prey system has exactly one solution
defined for all times. -/
theorem existsUnique_isIntegralCurve_lotkaVolterraField {α β γ δ : ℝ} (hα : 0 < α) (hβ : 0 < β)
    (hγ : 0 < γ) (hδ : 0 < δ) {z₀ : ℝ × ℝ} (h1 : 0 < z₀.1) (h2 : 0 < z₀.2) :
    ∃! z : ℝ → ℝ × ℝ, IsIntegralCurve z (fun _ ↦ lotkaVolterraField α β γ δ) ∧ z 0 = z₀ :=
  sorry

/-- 2.3: a solution that starts in the open quadrant stays there, and the first integral is
constant along it. -/
theorem lotkaVolterraIntegral_eq {α β γ δ : ℝ} {z : ℝ → ℝ × ℝ}
    (hz : IsIntegralCurveOn z (fun _ ↦ lotkaVolterraField α β γ δ) (Ici 0)) (h1 : 0 < (z 0).1)
    (h2 : 0 < (z 0).2) {t : ℝ} (ht : 0 ≤ t) :
    0 < (z t).1 ∧ 0 < (z t).2 ∧
      lotkaVolterraIntegral α β γ δ (z t) = lotkaVolterraIntegral α β γ δ (z 0) :=
  sorry

/-- 2.3: every solution in the open quadrant is periodic. -/
theorem exists_periodic_lotkaVolterra {α β γ δ : ℝ} (hα : 0 < α) (hβ : 0 < β) (hγ : 0 < γ)
    (hδ : 0 < δ) {z : ℝ → ℝ × ℝ} (hz : IsIntegralCurve z (fun _ ↦ lotkaVolterraField α β γ δ))
    (h1 : 0 < (z 0).1) (h2 : 0 < (z 0).2) :
    ∃ T : ℝ, 0 < T ∧ Function.Periodic z T :=
  sorry

/-- 2.3: Volterra's principle: over any time `T` after which a solution in the open quadrant
returns to its starting point, the averages of prey and predators are the equilibrium values
`γ / δ` and `α / β`. -/
theorem integral_lotkaVolterra_of_eq {α β γ δ : ℝ} (hβ : β ≠ 0) (hδ : δ ≠ 0) {z : ℝ → ℝ × ℝ}
    (hz : IsIntegralCurve z (fun _ ↦ lotkaVolterraField α β γ δ)) (h1 : 0 < (z 0).1)
    (h2 : 0 < (z 0).2) {T : ℝ} (hT : z T = z 0) :
    ∫ t in (0 : ℝ)..T, (z t).1 = T * (γ / δ) ∧ ∫ t in (0 : ℝ)..T, (z t).2 = T * (α / β) :=
  sorry

/-- 2.4: the two-species competition field
`(r₁ x (1 - (x + a y) / K₁), r₂ y (1 - (y + b x) / K₂))`. -/
def competitionField (r₁ r₂ K₁ K₂ a b : ℝ) (z : ℝ × ℝ) : ℝ × ℝ :=
  (r₁ * z.1 * (1 - (z.1 + a * z.2) / K₁), r₂ * z.2 * (1 - (z.2 + b * z.1) / K₂))

/-- 2.4: competitive exclusion: if `a K₂ < K₁` and `K₂ < b K₁`, every solution with positive
initial values converges to `(K₁, 0)`. -/
theorem tendsto_competition_of_exclusion {r₁ r₂ K₁ K₂ a b : ℝ} (hr₁ : 0 < r₁) (hr₂ : 0 < r₂)
    (hK₁ : 0 < K₁) (hK₂ : 0 < K₂) (ha : 0 < a) (hb : 0 < b) {z : ℝ → ℝ × ℝ}
    (hz : IsIntegralCurveOn z (fun _ ↦ competitionField r₁ r₂ K₁ K₂ a b) (Ici 0))
    (h1 : 0 < (z 0).1) (h2 : 0 < (z 0).2) (hab : a * K₂ < K₁) (hba : K₂ < b * K₁) :
    Tendsto z atTop (𝓝 (K₁, 0)) :=
  sorry

/-- 2.4: coexistence: if `a K₂ < K₁` and `b K₁ < K₂`, every solution with positive initial values
converges to the interior equilibrium. -/
theorem tendsto_competition_of_coexistence {r₁ r₂ K₁ K₂ a b : ℝ} (hr₁ : 0 < r₁) (hr₂ : 0 < r₂)
    (hK₁ : 0 < K₁) (hK₂ : 0 < K₂) (ha : 0 < a) (hb : 0 < b) {z : ℝ → ℝ × ℝ}
    (hz : IsIntegralCurveOn z (fun _ ↦ competitionField r₁ r₂ K₁ K₂ a b) (Ici 0))
    (h1 : 0 < (z 0).1) (h2 : 0 < (z 0).2) (hab : a * K₂ < K₁) (hba : b * K₁ < K₂) :
    Tendsto z atTop (𝓝 ((K₁ - a * K₂) / (1 - a * b), (K₂ - b * K₁) / (1 - a * b))) :=
  sorry

/-- 2.4: bistability: if `K₁ < a K₂` and `K₂ < b K₁`, every solution with positive initial values
converges to one of the two one-species equilibria or to the interior equilibrium. -/
theorem tendsto_competition_of_bistable {r₁ r₂ K₁ K₂ a b : ℝ} (hr₁ : 0 < r₁) (hr₂ : 0 < r₂)
    (hK₁ : 0 < K₁) (hK₂ : 0 < K₂) (ha : 0 < a) (hb : 0 < b) {z : ℝ → ℝ × ℝ}
    (hz : IsIntegralCurveOn z (fun _ ↦ competitionField r₁ r₂ K₁ K₂ a b) (Ici 0))
    (h1 : 0 < (z 0).1) (h2 : 0 < (z 0).2) (hab : K₁ < a * K₂) (hba : K₂ < b * K₁) :
    Tendsto z atTop (𝓝 (K₁, 0)) ∨ Tendsto z atTop (𝓝 (0, K₂)) ∨
      Tendsto z atTop (𝓝 ((K₁ - a * K₂) / (1 - a * b), (K₂ - b * K₁) / (1 - a * b))) :=
  sorry

/-- 2.5: the Kermack–McKendrick field for susceptibles and infectives,
`(-β S I, β S I - γ I)`. -/
def sirField (β γ : ℝ) (z : ℝ × ℝ) : ℝ × ℝ :=
  (-(β * z.1 * z.2), β * z.1 * z.2 - γ * z.2)

/-- 2.5: along a solution with positive initial values, `S` and `I` stay positive and
`I + S - (γ / β) log S` is constant. -/
theorem sir_conserved {β γ : ℝ} (hβ : 0 < β) {z : ℝ → ℝ × ℝ}
    (hz : IsIntegralCurveOn z (fun _ ↦ sirField β γ) (Ici 0)) (hS : 0 < (z 0).1)
    (hI : 0 < (z 0).2) {t : ℝ} (ht : 0 ≤ t) :
    0 < (z t).1 ∧ 0 < (z t).2 ∧
      (z t).2 + (z t).1 - γ / β * Real.log (z t).1 =
        (z 0).2 + (z 0).1 - γ / β * Real.log (z 0).1 :=
  sorry

/-- 2.5: the peak prevalence: the largest number of infectives is the initial one if
`β S₀ ≤ γ`, and `I₀ + S₀ - γ / β - (γ / β) log (β S₀ / γ)` otherwise. -/
theorem sir_peak {β γ : ℝ} (hβ : 0 < β) (hγ : 0 < γ) {z : ℝ → ℝ × ℝ}
    (hz : IsIntegralCurveOn z (fun _ ↦ sirField β γ) (Ici 0)) (hS : 0 < (z 0).1)
    (hI : 0 < (z 0).2) :
    IsGreatest ((fun t ↦ (z t).2) '' Ici 0)
      (if β * (z 0).1 ≤ γ then (z 0).2
        else (z 0).2 + (z 0).1 - γ / β - γ / β * Real.log (β * (z 0).1 / γ)) :=
  sorry

/-- 2.5: the final size of the epidemic: `I` tends to `0` and `S` tends to the unique root in
`(0, γ / β)` of `s - (γ / β) log s = S₀ + I₀ - (γ / β) log S₀`. -/
theorem sir_finalSize {β γ : ℝ} (hβ : 0 < β) (hγ : 0 < γ) {z : ℝ → ℝ × ℝ}
    (hz : IsIntegralCurveOn z (fun _ ↦ sirField β γ) (Ici 0)) (hS : 0 < (z 0).1)
    (hI : 0 < (z 0).2) :
    ∃ s ∈ Ioo 0 (γ / β),
      s - γ / β * Real.log s = (z 0).1 + (z 0).2 - γ / β * Real.log (z 0).1 ∧
      (∀ s' ∈ Ioo 0 (γ / β),
        s' - γ / β * Real.log s' = (z 0).1 + (z 0).2 - γ / β * Real.log (z 0).1 → s' = s) ∧
      Tendsto (fun t ↦ (z t).1) atTop (𝓝 s) ∧ Tendsto (fun t ↦ (z t).2) atTop (𝓝 0) :=
  sorry

/-- 2.6: the field `β i (1 - i) - γ i` of the infective fraction in the SIS model. -/
def sisField (β γ i : ℝ) : ℝ :=
  β * i * (1 - i) - γ * i

/-- 2.6: from a positive initial value the infective fraction of the SIS model converges to
`max 0 (1 - γ / β)`: to the endemic level `1 - γ / β` if `β > γ`, and to `0` otherwise. -/
theorem tendsto_sis {β γ : ℝ} (hβ : 0 < β) (hγ : 0 < γ) {i : ℝ → ℝ}
    (hi : IsIntegralCurveOn i (fun _ ↦ sisField β γ) (Ici 0)) (h0 : 0 < i 0) :
    Tendsto i atTop (𝓝 (max 0 (1 - γ / β))) :=
  sorry

/-! ## Layer 3: population genetics in finite populations -/

/-- 3.2: the neutral Wright–Fisher kernel for `N` genes: from `i` copies of an allele the next
generation has `Binomial(N, i / N)` copies. -/
def wrightFisherKernel (N : ℕ) : Kernel ℕ ℕ :=
  Kernel.ofFunOfCountable fun i ↦
    ProbabilityTheory.binomial N (Set.projIcc 0 1 zero_le_one ((i : ℝ) / N))

instance (N : ℕ) : IsMarkovKernel (wrightFisherKernel N) :=
  ⟨fun i ↦ inferInstanceAs (IsProbabilityMeasure
    (ProbabilityTheory.binomial N (Set.projIcc 0 1 zero_le_one ((i : ℝ) / N))))⟩

/-- 3.2: the number of copies of an allele in the neutral Wright–Fisher model is a martingale. -/
theorem wrightFisher_martingale {N i : ℕ} (hi : i ≤ N) {X : ℕ → Ω → ℕ} {μ : Measure Ω}
    (hX : ∀ n, Measurable (X n))
    (hlaw : HasLaw (fun ω n ↦ X n ω) (markovChainLaw (Measure.dirac i) (wrightFisherKernel N)) μ) :
    Martingale (fun n ω ↦ (X n ω : ℝ)) (Filtration.natural X fun n ↦ (hX n).stronglyMeasurable)
      μ :=
  sorry

/-- 3.2: in the neutral Wright–Fisher model an allele with `i` copies among `N` is fixed with
probability `i / N`. -/
theorem wrightFisher_fixation {N i : ℕ} (hN : 0 < N) (hi : i ≤ N) {X : ℕ → Ω → ℕ}
    {μ : Measure Ω}
    (hlaw : HasLaw (fun ω n ↦ X n ω) (markovChainLaw (Measure.dirac i) (wrightFisherKernel N)) μ) :
    μ.real {ω | ∃ n, X n ω = N} = (i : ℝ) / N :=
  sorry

/-- 3.2: the expected heterozygosity of the neutral Wright–Fisher model decays by the factor
`1 - 1 / N` in each generation. -/
theorem wrightFisher_heterozygosity {N i : ℕ} (hi : i ≤ N) {X : ℕ → Ω → ℕ} {μ : Measure Ω}
    (hlaw : HasLaw (fun ω n ↦ X n ω) (markovChainLaw (Measure.dirac i) (wrightFisherKernel N)) μ)
    (n : ℕ) :
    ∫ ω, (X n ω : ℝ) * (N - X n ω) ∂μ = (1 - 1 / (N : ℝ)) ^ n * (i * (N - i)) :=
  sorry

/-- 3.3: fixation in a birth–death chain on `{0, …, N}` with absorbing ends, birth probabilities
`b j > 0` and death probabilities `d j` at the interior states: started at `i`, the chain reaches
`N` with probability `φ i / φ N`, where `φ k = ∑_{m < k} ∏_{j = 1}^{m} d j / b j`. -/
theorem birthDeath_fixation (κ : Kernel ℕ ℕ) [IsMarkovKernel κ] {N : ℕ} (hN : 0 < N)
    {b d : ℕ → ℝ} (h0 : κ 0 {0} = 1) (hNN : κ N {N} = 1)
    (hsupp : ∀ j, 0 < j → j < N → κ j {j - 1, j, j + 1} = 1)
    (hb : ∀ j, 0 < j → j < N → (κ j).real {j + 1} = b j)
    (hd : ∀ j, 0 < j → j < N → (κ j).real {j - 1} = d j)
    (hbpos : ∀ j, 0 < j → j < N → 0 < b j) {i : ℕ} (hi : i ≤ N) {X : ℕ → Ω → ℕ}
    {μ : Measure Ω} (hlaw : HasLaw (fun ω n ↦ X n ω) (markovChainLaw (Measure.dirac i) κ) μ) :
    μ.real {ω | ∃ n, X n ω = N} =
      (∑ m ∈ range i, ∏ j ∈ Icc 1 m, d j / b j) / ∑ m ∈ range N, ∏ j ∈ Icc 1 m, d j / b j :=
  sorry

/-- 3.3: one step of the Moran model with `N` individuals, `i` of them of a type of relative
fitness `r`: an individual chosen with probability proportional to fitness reproduces, and
independently a uniformly chosen individual dies. -/
def moranKernel (N : ℕ) (r : ℝ) : Kernel ℕ ℕ :=
  Kernel.ofFunOfCountable fun i ↦
    ((bernoulliMeasure (1 : ℕ) 0
        (Set.projIcc 0 1 zero_le_one (r * i / (r * i + ((N : ℝ) - i))))).prod
      (bernoulliMeasure (1 : ℕ) 0 (Set.projIcc 0 1 zero_le_one ((i : ℝ) / N)))).map
      fun z ↦ i + z.1 - z.2

instance (N : ℕ) (r : ℝ) : IsMarkovKernel (moranKernel N r) :=
  ⟨fun _ ↦
    (Measure.isProbabilityMeasure_map_iff (Measurable.of_discrete).aemeasurable).mpr inferInstance⟩

/-- 3.3: in the Moran model a type of relative fitness `r > 0` with `i` individuals among `N` is
fixed with probability `(1 + r⁻¹ + ⋯ + r^(-(i-1))) / (1 + r⁻¹ + ⋯ + r^(-(N-1)))`. -/
theorem moran_fixation {N i : ℕ} {r : ℝ} (hN : 0 < N) (hi : i ≤ N) (hr : 0 < r)
    {X : ℕ → Ω → ℕ} {μ : Measure Ω}
    (hlaw : HasLaw (fun ω n ↦ X n ω) (markovChainLaw (Measure.dirac i) (moranKernel N r)) μ) :
    μ.real {ω | ∃ n, X n ω = N} = (∑ k ∈ range i, r⁻¹ ^ k) / ∑ k ∈ range N, r⁻¹ ^ k :=
  sorry

/-- 3.3: in the neutral Moran model the expected number of steps spent away from `0` and `N`,
started with `i` individuals of the type, is
`N (∑_{j = 1}^{i} (N - i) / (N - j) + ∑_{j = i + 1}^{N - 1} i / j)`. -/
theorem moran_neutral_lintegral_absorptionTime {N i : ℕ} (hi : i ≤ N) {X : ℕ → Ω → ℕ}
    {μ : Measure Ω}
    (hlaw : HasLaw (fun ω n ↦ X n ω) (markovChainLaw (Measure.dirac i) (moranKernel N 1)) μ) :
    ∫⁻ ω, ({n | 0 < X n ω ∧ X n ω < N}.encard : ℝ≥0∞) ∂μ =
      ENNReal.ofReal (N * (∑ j ∈ Icc 1 i, ((N : ℝ) - i) / (N - j) + ∑ j ∈ Ioo i N, (i : ℝ) / j)) :=
  sorry

/-- 3.4: the rate `k (k - 1) / 2` at which `k` lineages of Kingman's coalescent merge. -/
def coalescentRate (k : ℕ) : ℝ :=
  k * (k - 1) / 2

/-- 3.4: the joint law of the times during which a sample of size `n` has `n, n - 1, …, 2`
lineages: independent exponential times, coordinate `j` (the time with `j + 2` lineages) of rate
`coalescentRate (j + 2)`. -/
def coalescentTimes (n : ℕ) : Measure (Fin (n - 1) → ℝ) :=
  Measure.pi fun j ↦ expMeasure (coalescentRate (j + 2))

/-- 3.4: the height of the genealogical tree, the time to the most recent common ancestor. -/
def treeHeight {n : ℕ} (x : Fin (n - 1) → ℝ) : ℝ :=
  ∑ j, x j

/-- 3.4: the total branch length of the genealogical tree. -/
def treeLength {n : ℕ} (x : Fin (n - 1) → ℝ) : ℝ :=
  ∑ j : Fin (n - 1), (((j : ℕ) : ℝ) + 2) * x j

/-- 3.4: the expected time to the most recent common ancestor of a sample of size `n ≥ 1` is
`2 (1 - 1 / n)`. -/
theorem integral_treeHeight {n : ℕ} (hn : 1 ≤ n) :
    ∫ x, treeHeight x ∂coalescentTimes n = 2 * (1 - 1 / (n : ℝ)) :=
  sorry

/-- 3.4: the total branch length has the law of the maximum of `n - 1` independent exponential
variables of rate `1 / 2`. -/
theorem measureReal_treeLength_le (n : ℕ) {t : ℝ} (ht : 0 ≤ t) :
    (coalescentTimes n).real {x | treeLength x ≤ t} = (1 - Real.exp (-(t / 2))) ^ (n - 1) :=
  sorry

/-- 3.4: the law of the number of segregating sites of a sample of size `n` under the infinite
sites model with scaled mutation rate `θ`: given the tree, a Poisson number of mutations of mean
`θ / 2` times the total branch length. -/
def segregatingSitesLaw (n : ℕ) (θ : ℝ) : Measure ℕ :=
  mixedPoissonMeasure ((coalescentTimes n).map fun x ↦ Real.toNNReal (θ / 2 * treeLength x))

/-- 3.4: the number of segregating sites is a sum of independent geometric variables, the `j`th
with success probability `(j + 1) / (j + 1 + θ)`, for `j = 0, …, n - 2`. -/
theorem segregatingSitesLaw_eq_map_pi (n : ℕ) {θ : ℝ} (hθ : 0 ≤ θ) :
    segregatingSitesLaw n θ =
      (Measure.pi fun j : Fin (n - 1) ↦ geometricMeasure
        (Set.projIcc 0 1 zero_le_one ((((j : ℕ) : ℝ) + 1) / (((j : ℕ) : ℝ) + 1 + θ)))).map
        fun x ↦ ∑ j, x j :=
  sorry

/-- 3.4: Watterson's formulas: the number of segregating sites has mean `θ H_{n-1}` and variance
`θ H_{n-1} + θ² ∑_{j < n} 1 / j²`. -/
theorem integral_variance_segregatingSitesLaw (n : ℕ) {θ : ℝ} (hθ : 0 ≤ θ) :
    ∫ k : ℕ, (k : ℝ) ∂segregatingSitesLaw n θ = θ * ∑ j ∈ range (n - 1), 1 / ((j : ℝ) + 1) ∧
      Var[fun k : ℕ ↦ (k : ℝ); segregatingSitesLaw n θ] =
        θ * ∑ j ∈ range (n - 1), 1 / ((j : ℝ) + 1) +
          θ ^ 2 * ∑ j ∈ range (n - 1), 1 / ((j : ℝ) + 1) ^ 2 :=
  sorry

end TauCetiRoadmap.PopulationDynamics
