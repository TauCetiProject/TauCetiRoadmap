import Mathlib

/-!
# Rényi divergence and Rényi differential privacy: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the
few definitions they need; every definition has a real body. Every headline theorem of the README
is statable at the pins and is stated here. The README's remaining targets, API lists and Checks
are not restated.

Measures are probability measures throughout. The Hellinger integral of order `α` is
`∫ p^α q^(1-α) dμ` in `ℝ≥0∞`, with `p`, `q` the densities of `P`, `Q` with respect to
`μ = P + Q`; the conventions of `ℝ≥0∞` (`0 ^ y = ∞` for `y < 0`, `0 · ∞ = 0`) make the integrand
`∞` where `q = 0 < p` and `α > 1`, as in van Erven–Harremoës. The Rényi divergence of order `α`
is `log (Hellinger integral) / (α - 1)` in `ℝ≥0∞`, and `∞` when the Hellinger integral is `0` or
`∞`. Only the orders `α ∈ (0, 1) ∪ (1, ∞)` are meant: at `α = 1` and at `α ≤ 0` the definition
has junk values, and every theorem below excludes them. Logarithms are natural, so the privacy
parameter `ε` of `(ε, δ)`-differential privacy is measured in nats.
-/

noncomputable section

open MeasureTheory ProbabilityTheory Filter Topology InformationTheory
open scoped ENNReal NNReal

namespace TauCetiRoadmap.RenyiDivergenceAndPrivacy

variable {X Y Z : Type*} [MeasurableSpace X] [MeasurableSpace Y] [MeasurableSpace Z]

/-! ## Layer 1: the Hellinger integral and the Rényi divergence -/

/-- 1.1 The Hellinger integral of order `α`: `∫ p^α q^(1-α) dμ` with `p = dP/dμ`, `q = dQ/dμ`
and `μ = P + Q`, computed in `ℝ≥0∞` (van Erven–Harremoës, Definition 2 and Remark 1). -/
def hellingerIntegral (α : ℝ) (P Q : Measure X) : ℝ≥0∞ :=
  ∫⁻ x, P.rnDeriv (P + Q) x ^ α * Q.rnDeriv (P + Q) x ^ (1 - α) ∂(P + Q)

/-- 1.2 The Rényi divergence of order `α`: `log (hellingerIntegral α P Q) / (α - 1)`, and `∞`
when the Hellinger integral is `0` or `∞` (van Erven–Harremoës, Definition 2). -/
def renyiDiv (α : ℝ) (P Q : Measure X) : ℝ≥0∞ :=
  if hellingerIntegral α P Q = 0 ∨ hellingerIntegral α P Q = ∞ then ∞
  else ENNReal.ofReal (Real.log (hellingerIntegral α P Q).toReal / (α - 1))

/-- 1.3 Positivity: for a simple order the Rényi divergence vanishes exactly on equal laws
(van Erven–Harremoës, Theorem 8). -/
theorem renyiDiv_eq_zero_iff (P Q : Measure X) [IsProbabilityMeasure P] [IsProbabilityMeasure Q]
    {α : ℝ} (hα : 0 < α) (hα1 : α ≠ 1) :
    renyiDiv α P Q = 0 ↔ P = Q := by
  sorry

/-- 1.3 For `α ∈ (0, 1)` the Rényi divergence is infinite exactly for mutually singular laws
(van Erven–Harremoës, Theorem 24). -/
theorem renyiDiv_eq_top_iff_mutuallySingular (P Q : Measure X) [IsProbabilityMeasure P]
    [IsProbabilityMeasure Q] {α : ℝ} (hα : 0 < α) (hα1 : α < 1) :
    renyiDiv α P Q = ∞ ↔ P ⟂ₘ Q := by
  sorry

/-- 1.4 Gaussian laws with a common variance `v > 0`:
`D_α(N(m₀, v) ‖ N(m₁, v)) = α (m₀ - m₁)² / (2 v)` for every simple order (van Erven–Harremoës,
equation (10); Mironov, Proposition 7, for `α > 1`). -/
theorem renyiDiv_gaussianReal (m₀ m₁ : ℝ) {v : ℝ≥0} (hv : v ≠ 0) {α : ℝ} (hα : 0 < α)
    (hα1 : α ≠ 1) :
    renyiDiv α (gaussianReal m₀ v) (gaussianReal m₁ v) =
      ENNReal.ofReal (α * (m₀ - m₁) ^ 2 / (2 * v)) := by
  sorry

/-! ## Layer 2: the order and the Kullback–Leibler limit -/

/-- 2.1 As `α` increases to `1` the Rényi divergence tends to the Kullback–Leibler divergence,
finite or not (van Erven–Harremoës, Theorem 5, equation (17)). -/
theorem tendsto_renyiDiv_nhdsLT_one (P Q : Measure X) [IsProbabilityMeasure P]
    [IsProbabilityMeasure Q] :
    Tendsto (fun α ↦ renyiDiv α P Q) (𝓝[<] 1) (𝓝 (klDiv P Q)) := by
  sorry

/-- 2.1 As `α` decreases to `1` the Rényi divergence tends to the Kullback–Leibler divergence,
provided that the latter is infinite or some order `β > 1` has a finite divergence
(van Erven–Harremoës, Theorem 5, equation (18)). -/
theorem tendsto_renyiDiv_nhdsGT_one (P Q : Measure X) [IsProbabilityMeasure P]
    [IsProbabilityMeasure Q] (h : klDiv P Q = ∞ ∨ ∃ β, 1 < β ∧ renyiDiv β P Q ≠ ∞) :
    Tendsto (fun α ↦ renyiDiv α P Q) (𝓝[>] 1) (𝓝 (klDiv P Q)) := by
  sorry

/-- 2.2 The Rényi divergence is nondecreasing in the order on `(0, 1) ∪ (1, ∞)`, across `1`
included (van Erven–Harremoës, Theorem 3). -/
theorem renyiDiv_le_renyiDiv_of_le (P Q : Measure X) [IsProbabilityMeasure P]
    [IsProbabilityMeasure Q] {α β : ℝ} (hα : 0 < α) (hαβ : α ≤ β) (hα1 : α ≠ 1) (hβ1 : β ≠ 1) :
    renyiDiv α P Q ≤ renyiDiv β P Q := by
  sorry

/-! ## Layer 3: data processing, products and the chain bound -/

/-- 3.1 Data processing: a Markov kernel does not increase the Rényi divergence
(van Erven–Harremoës, Theorem 1 and Example 2). -/
theorem renyiDiv_comp_le (P Q : Measure X) [IsProbabilityMeasure P] [IsProbabilityMeasure Q]
    (κ : Kernel X Y) [IsMarkovKernel κ] {α : ℝ} (hα : 0 < α) (hα1 : α ≠ 1) :
    renyiDiv α (κ ∘ₘ P) (κ ∘ₘ Q) ≤ renyiDiv α P Q := by
  sorry

/-- 3.2 Additivity for products (van Erven–Harremoës, Theorem 28, equation (42), for two
factors). -/
theorem renyiDiv_prod (P Q : Measure X) (P' Q' : Measure Y) [IsProbabilityMeasure P]
    [IsProbabilityMeasure Q] [IsProbabilityMeasure P'] [IsProbabilityMeasure Q'] {α : ℝ}
    (hα : 0 < α) (hα1 : α ≠ 1) :
    renyiDiv α (P.prod P') (Q.prod Q') = renyiDiv α P Q + renyiDiv α P' Q' := by
  sorry

/-- 3.3 The chain bound: if `D_α(κ x ‖ η x) ≤ c` for every `x`, then
`D_α(μ ⊗ₘ κ ‖ ν ⊗ₘ η) ≤ D_α(μ ‖ ν) + c` (Mironov, proof of Proposition 1). -/
theorem renyiDiv_compProd_le [MeasurableSpace.CountableOrCountablyGenerated X Y]
    (μ ν : Measure X) [IsProbabilityMeasure μ] [IsProbabilityMeasure ν] (κ η : Kernel X Y)
    [IsMarkovKernel κ] [IsMarkovKernel η] {α : ℝ} (hα : 0 < α) (hα1 : α ≠ 1) (c : ℝ≥0∞)
    (hc : ∀ x, renyiDiv α (κ x) (η x) ≤ c) :
    renyiDiv α (μ ⊗ₘ κ) (ν ⊗ₘ η) ≤ renyiDiv α μ ν + c := by
  sorry

/-! ## Layer 4: Rényi differential privacy -/

/-- 4.1 From a Rényi bound to an `(ε, δ)` bound: if `α > 1`, `D_α(P ‖ Q) ≤ ρ` and `δ > 0`, then
`P A ≤ exp (ρ + log (1/δ) / (α - 1)) · Q A + δ` for every measurable `A` (Mironov,
Proposition 3). -/
theorem measureReal_le_of_renyiDiv_le (P Q : Measure X) [IsProbabilityMeasure P]
    [IsProbabilityMeasure Q] {α : ℝ} (hα : 1 < α) {ρ : ℝ≥0} (hρ : renyiDiv α P Q ≤ ρ) {δ : ℝ}
    (hδ : 0 < δ) {A : Set X} (hA : MeasurableSet A) :
    P.real A ≤ Real.exp (ρ + Real.log (1 / δ) / (α - 1)) * Q.real A + δ := by
  sorry

/-- 4.2 `(α, ε)`-Rényi differential privacy of a mechanism `M` from data sets to laws, for an
adjacency relation `Adj` on data sets (Mironov, Definition 4). -/
def IsRenyiDP {𝒟 : Type*} (Adj : 𝒟 → 𝒟 → Prop) (M : 𝒟 → Measure Y) (α : ℝ) (ε : ℝ≥0) :
    Prop :=
  ∀ D D', Adj D D' → renyiDiv α (M D) (M D') ≤ ε

/-- 4.3 Adaptive composition: releasing `y ∼ M D` and then `z ∼ K D y` is
`(α, ε₁ + ε₂)`-Rényi differentially private (Mironov, Proposition 1). -/
theorem isRenyiDP_compProd [MeasurableSpace.CountableOrCountablyGenerated Y Z] {𝒟 : Type*}
    (Adj : 𝒟 → 𝒟 → Prop) (M : 𝒟 → Measure Y) [∀ D, IsProbabilityMeasure (M D)]
    (K : 𝒟 → Kernel Y Z) [∀ D, IsMarkovKernel (K D)] {α : ℝ} (hα : 1 < α) {ε₁ ε₂ : ℝ≥0}
    (hM : IsRenyiDP Adj M α ε₁) (hK : ∀ y, IsRenyiDP Adj (fun D ↦ K D y) α ε₂) :
    IsRenyiDP Adj (fun D ↦ M D ⊗ₘ K D) α (ε₁ + ε₂) := by
  sorry

/-- 4.4 The Gaussian mechanism: adding independent `N(0, v)` noise, `v > 0`, to each coordinate of
a query `f` whose values on adjacent data sets are at Euclidean distance at most `Δ` is
`(α, α Δ² / (2 v))`-Rényi differentially private for every `α > 1` (Mironov, Corollary 3, for one
coordinate and `Δ = 1`). -/
theorem isRenyiDP_gaussianMechanism {𝒟 : Type*} (Adj : 𝒟 → 𝒟 → Prop) {d : ℕ}
    (f : 𝒟 → Fin d → ℝ) {Δ : ℝ} (hf : ∀ D D', Adj D D' → ∑ i, (f D i - f D' i) ^ 2 ≤ Δ ^ 2)
    {v : ℝ≥0} (hv : v ≠ 0) {α : ℝ} (hα : 1 < α) :
    IsRenyiDP Adj (fun D ↦ Measure.pi fun i ↦ gaussianReal (f D i) v) α
      (Real.toNNReal (α * Δ ^ 2 / (2 * v))) := by
  sorry

end TauCetiRoadmap.RenyiDivergenceAndPrivacy
