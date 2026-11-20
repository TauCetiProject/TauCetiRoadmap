import Mathlib
import TauCeti.Probability.Process.MarkovChain

/-!
# Martingale central limit theorems: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the one
definition they share, which has a real body. Every headline theorem of the README is statable at
the pins and is stated here; the README's remaining targets, API lists and Checks are not restated.

A martingale difference array lives on one probability space `(Ω, μ)`: row `n` has `k n` entries
`X n j`, `j < k n`, and its own filtration `ℱ n`, with `X n j` measurable for `ℱ n (j + 1)` and
conditionally centred given `ℱ n j`. No relation between the filtrations of different rows is
assumed. Convergence in probability is Mathlib's `TendstoInMeasure`, convergence in law is
Mathlib's `TendstoInDistribution`, and the limit law is Mathlib's `gaussianReal 0 σ²` with
`σ² : ℝ≥0`; at `σ² = 0` it is the Dirac mass at `0`. Markov chains on a finite state space are
Mathlib kernels with Tau Ceti's path law `markovChainLaw`.
-/

noncomputable section

open MeasureTheory ProbabilityTheory Filter Finset
open scoped NNReal ENNReal Topology

namespace TauCetiRoadmap.MartingaleCentralLimitTheorem

variable {Ω : Type*} {m : MeasurableSpace Ω}

/-! ## Layer 1: martingale difference arrays and McLeish's theorem -/

/-- 1.1 A martingale difference array on `(Ω, μ)` with row lengths `k` and row filtrations `ℱ`:
for `j < k n`, the entry `X n j` is `ℱ n (j + 1)`-measurable, integrable, and has conditional
expectation `0` given `ℱ n j`. -/
def IsMartingaleDiffArray (μ : Measure Ω) (ℱ : ℕ → Filtration ℕ m) (k : ℕ → ℕ)
    (X : ℕ → ℕ → Ω → ℝ) : Prop :=
  ∀ n, ∀ j < k n, StronglyMeasurable[ℱ n (j + 1)] (X n j) ∧ Integrable (X n j) μ ∧
    μ[X n j | ℱ n j] =ᵐ[μ] 0

/-- 1.3 McLeish's central limit theorem. Let `X` be a martingale difference array whose row
maxima `maxⱼ |X n j|` are bounded in `L²` and tend to `0` in probability, and whose sums of
squares `∑ⱼ (X n j)²` tend in probability to a constant `σ² ≥ 0`. Then the row sums converge in
law to `N(0, σ²)`. -/
theorem tendstoInDistribution_sum_of_sum_sq {μ : Measure Ω} [IsProbabilityMeasure μ]
    {ℱ : ℕ → Filtration ℕ m} {k : ℕ → ℕ} {X : ℕ → ℕ → Ω → ℝ}
    (hX : IsMartingaleDiffArray μ ℱ k X)
    (hmax : ∃ C : ℝ≥0, ∀ n,
      ∫⁻ ω, (((range (k n)).sup fun j ↦ ‖X n j ω‖₊ : ℝ≥0) : ℝ≥0∞) ^ 2 ∂μ ≤ C)
    (hmax0 : TendstoInMeasure μ
      (fun n ω ↦ (((range (k n)).sup fun j ↦ ‖X n j ω‖₊ : ℝ≥0) : ℝ)) atTop 0)
    (σ2 : ℝ≥0)
    (hsq : TendstoInMeasure μ (fun n ω ↦ ∑ j ∈ range (k n), X n j ω ^ 2) atTop
      (fun _ ↦ (σ2 : ℝ)))
    {Ω' : Type*} [MeasurableSpace Ω'] {μ' : Measure Ω'} [IsProbabilityMeasure μ']
    {Z : Ω' → ℝ} (hZ : HasLaw Z (gaussianReal 0 σ2) μ') :
    TendstoInDistribution (fun n ω ↦ ∑ j ∈ range (k n), X n j ω) atTop Z (fun _ ↦ μ) μ' := by
  sorry

/-! ## Layer 2: conditional variances and the conditional Lindeberg condition -/

/-- 2.3 The martingale central limit theorem with conditional variances (Brown; the
Lindeberg–Feller theorem for martingales). Let `X` be a martingale difference array of
square-integrable entries. If the conditional variances `∑ⱼ E[(X n j)² | ℱ n j]` tend in
probability to a constant `σ² ≥ 0` and, for every `ε > 0`, the conditional Lindeberg sums
`∑ⱼ E[(X n j)² 1{|X n j| > ε} | ℱ n j]` tend to `0` in probability, then the row sums converge in
law to `N(0, σ²)`. -/
theorem tendstoInDistribution_sum_of_condVar {μ : Measure Ω} [IsProbabilityMeasure μ]
    {ℱ : ℕ → Filtration ℕ m} {k : ℕ → ℕ} {X : ℕ → ℕ → Ω → ℝ}
    (hX : IsMartingaleDiffArray μ ℱ k X) (hL2 : ∀ n, ∀ j < k n, MemLp (X n j) 2 μ)
    (σ2 : ℝ≥0)
    (hvar : TendstoInMeasure μ
      (fun n ω ↦ ∑ j ∈ range (k n), (μ[fun ω' ↦ X n j ω' ^ 2 | ℱ n j]) ω) atTop
      (fun _ ↦ (σ2 : ℝ)))
    (hlind : ∀ ε > 0, TendstoInMeasure μ
      (fun n ω ↦ ∑ j ∈ range (k n),
        (μ[{ω' | ε < |X n j ω'|}.indicator (fun ω' ↦ X n j ω' ^ 2) | ℱ n j]) ω) atTop 0)
    {Ω' : Type*} [MeasurableSpace Ω'] {μ' : Measure Ω'} [IsProbabilityMeasure μ']
    {Z : Ω' → ℝ} (hZ : HasLaw Z (gaussianReal 0 σ2) μ') :
    TendstoInDistribution (fun n ω ↦ ∑ j ∈ range (k n), X n j ω) atTop Z (fun _ ↦ μ) μ' := by
  sorry

/-! ## Layer 3: single martingales -/

/-- 3.1 The central limit theorem for one martingale difference sequence. Let `X j` be
`ℱ (j + 1)`-measurable and square integrable with `E[X j | ℱ j] = 0`. If
`n⁻¹ ∑_{j<n} E[(X j)² | ℱ j] → σ²` in probability and, for every `ε > 0`,
`n⁻¹ ∑_{j<n} E[(X j)² 1{|X j| > ε √n}] → 0`, then `n^{-1/2} ∑_{j<n} X j` converges in law to
`N(0, σ²)`. -/
theorem tendstoInDistribution_inv_sqrt_mul_sum_of_condVar {μ : Measure Ω}
    [IsProbabilityMeasure μ] {ℱ : Filtration ℕ m} {X : ℕ → Ω → ℝ}
    (hadapt : ∀ j, StronglyMeasurable[ℱ (j + 1)] (X j)) (hL2 : ∀ j, MemLp (X j) 2 μ)
    (hmds : ∀ j, μ[X j | ℱ j] =ᵐ[μ] 0) (σ2 : ℝ≥0)
    (hvar : TendstoInMeasure μ
      (fun (n : ℕ) ω ↦ (n : ℝ)⁻¹ * ∑ j ∈ range n, (μ[fun ω' ↦ X j ω' ^ 2 | ℱ j]) ω) atTop
      (fun _ ↦ (σ2 : ℝ)))
    (hlind : ∀ ε > 0, Tendsto (fun n : ℕ ↦ (n : ℝ)⁻¹ * ∑ j ∈ range n,
      ∫ ω, {ω' | ε * Real.sqrt n < |X j ω'|}.indicator (fun ω' ↦ X j ω' ^ 2) ω ∂μ)
      atTop (𝓝 0))
    {Ω' : Type*} [MeasurableSpace Ω'] {μ' : Measure Ω'} [IsProbabilityMeasure μ']
    {Z : Ω' → ℝ} (hZ : HasLaw Z (gaussianReal 0 σ2) μ') :
    TendstoInDistribution (fun (n : ℕ) ω ↦ (Real.sqrt n)⁻¹ * ∑ j ∈ range n, X j ω) atTop Z
      (fun _ ↦ μ) μ' := by
  sorry

/-- 3.2 The Billingsley–Ibragimov theorem. Let `X j` be `ℱ (j + 1)`-measurable with
`E[X j | ℱ j] = 0` and `X 0` square integrable, and suppose the sequence `(X j)` is stationary and
ergodic: the shift of `ℕ → ℝ` is ergodic for the law of `(X j)ⱼ`. Then `n^{-1/2} ∑_{j<n} X j`
converges in law to `N(0, E[(X 0)²])`. -/
theorem tendstoInDistribution_inv_sqrt_mul_sum_of_ergodic {μ : Measure Ω}
    [IsProbabilityMeasure μ] {ℱ : Filtration ℕ m} {X : ℕ → Ω → ℝ}
    (hadapt : ∀ j, StronglyMeasurable[ℱ (j + 1)] (X j)) (hL2 : MemLp (X 0) 2 μ)
    (hmds : ∀ j, μ[X j | ℱ j] =ᵐ[μ] 0)
    (herg : Ergodic (fun x : ℕ → ℝ ↦ fun j ↦ x (j + 1)) (μ.map fun ω j ↦ X j ω))
    {Ω' : Type*} [MeasurableSpace Ω'] {μ' : Measure Ω'} [IsProbabilityMeasure μ']
    {Z : Ω' → ℝ} (hZ : HasLaw Z (gaussianReal 0 (∫ ω, X 0 ω ^ 2 ∂μ).toNNReal) μ') :
    TendstoInDistribution (fun (n : ℕ) ω ↦ (Real.sqrt n)⁻¹ * ∑ j ∈ range n, X j ω) atTop Z
      (fun _ ↦ μ) μ' := by
  sorry

/-! ## Layer 4: finite Markov chains -/

/-- 4.1 Gordin's central limit theorem for a finite irreducible chain. Let `κ` be an irreducible
Markov kernel on a finite state space with stationary law `π`, let `f` be a function on the
states, and let `g` solve the Poisson equation `g − P g = f − E_π f`, where
`(P g) x = ∑_y κ(x, {y}) g y`. For every initial law `ν`, under the path law of the chain,
`n^{-1/2} ∑_{j<n} (f (X j) − E_π f)` converges in law to `N(0, σ²)` with
`σ² = E_π[g² − (P g)²]`. Aperiodicity is not assumed. -/
theorem tendstoInDistribution_markovChainLaw_of_poisson {S : Type*} [Fintype S]
    [MeasurableSpace S] [MeasurableSingletonClass S] (κ : Kernel S S) [IsMarkovKernel κ]
    [Kernel.IsIrreducible Measure.count κ] (π : Measure S) [IsProbabilityMeasure π]
    (hπ : κ.Invariant π) (ν : Measure S) [IsProbabilityMeasure ν] (f g : S → ℝ)
    (hg : ∀ x, g x - ∑ y, (κ x).real {y} * g y = f x - ∑ y, π.real {y} * f y)
    {Ω' : Type*} [MeasurableSpace Ω'] {μ' : Measure Ω'} [IsProbabilityMeasure μ']
    {Z : Ω' → ℝ}
    (hZ : HasLaw Z (gaussianReal 0
      (∑ x, π.real {x} * (g x ^ 2 - (∑ y, (κ x).real {y} * g y) ^ 2)).toNNReal) μ') :
    TendstoInDistribution
      (fun (n : ℕ) ω ↦ (Real.sqrt n)⁻¹ * ∑ j ∈ range n, (f (ω j) - ∑ y, π.real {y} * f y)) atTop Z
      (fun _ ↦ TauCeti.Probability.markovChainLaw ν κ) μ' := by
  sorry

end TauCetiRoadmap.MartingaleCentralLimitTheorem
