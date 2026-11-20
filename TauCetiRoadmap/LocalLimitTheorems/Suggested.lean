import Mathlib
import TauCeti.Analysis.Bochner.CharFun.Inversion

/-!
# Local limit theorems: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the one
definition they need, which has a real body. Every headline theorem of the README is statable at
the pins and is stated here: Gnedenko's local limit theorem for integer-valued summands of maximal
span one, the local de Moivre–Laplace theorem for the binomial law, the characterization of the
smoothing condition by bounded densities, and Gnedenko's local limit theorem for densities. The
README's route lemmas, consequences, API lists and Checks are not restated.

Summands are random variables `X : ℕ → Ω → ℤ` or `X : ℕ → Ω → ℝ` on a probability space, mutually
independent (`iIndepFun`) and identically distributed with `X 0` (`IdentDistrib`). Partial sums
are `∑ i ∈ Finset.range n, X i ω`. Normal densities are Mathlib's `gaussianPDFReal`, with the
variance as a `ℝ≥0`; a variance is passed through `Real.toNNReal`. The density of a law on `ℝ`
with integrable characteristic function is Tau Ceti's `MeasureTheory.Measure.charFunDensity`.
Means and variances are Mathlib's total `P[·]` and `Var[·; P]`: when the second moment is infinite
the variance is `0` and `gaussianPDFReal 0 0` is the zero function, so the two theorems of Gnedenko
below, which assume no moment, then assert uniform convergence to `0`.
-/

noncomputable section

open MeasureTheory ProbabilityTheory Filter Finset
open scoped Topology ENNReal NNReal

namespace TauCetiRoadmap.LocalLimitTheorems

/-! ## Layer 1: integer laws of maximal span one and the lattice local limit theorem -/

/-- 1.1 A law `μ` on `ℤ` has maximal span one when it is carried by no coset `b + hℤ` with
`h ≥ 2`: for every such coset, `μ` gives positive mass to its complement. -/
def HasMaximalSpanOne (μ : Measure ℤ) : Prop :=
  ∀ b : ℤ, ∀ h : ℕ, 2 ≤ h → μ {k : ℤ | ¬ ((h : ℤ) ∣ k - b)} ≠ 0

/-- 1.4 **Gnedenko's local limit theorem for lattice laws.** Let `X 0, X 1, …` be independent,
identically distributed and integer valued, and let the law of `X 0` have maximal span one, mean
`m` and variance `σ²`. Then, uniformly in `k : ℤ`,
`√n · P(Sₙ = k) − (2πσ²)^(-1/2) exp(−(k − n m)² / (2 n σ²)) → 0`. If the second moment is
infinite, `σ² = 0` by Mathlib's convention, the normal term is `0`, and the statement says that
`√n · P(Sₙ = k) → 0` uniformly in `k`. -/
theorem localLimit_lattice {Ω : Type*} [MeasurableSpace Ω] {P : Measure Ω}
    [IsProbabilityMeasure P] (X : ℕ → Ω → ℤ) (hindep : iIndepFun X P)
    (hident : ∀ i, IdentDistrib (X i) (X 0) P P)
    (hspan : HasMaximalSpanOne (P.map (X 0))) :
    ∀ ε > 0, ∀ᶠ n : ℕ in atTop, ∀ k : ℤ,
      |√(n : ℝ) * P.real {ω | ∑ i ∈ range n, X i ω = k} -
          gaussianPDFReal 0 (Var[fun ω ↦ (X 0 ω : ℝ); P]).toNNReal
            ((k - n * P[fun ω ↦ (X 0 ω : ℝ)]) / √(n : ℝ))| ≤ ε := by
  sorry

/-! ## Layer 2: the de Moivre–Laplace theorem -/

/-- 2.1 **The local de Moivre–Laplace theorem.** For `0 < p < 1` and every `A`, the binomial
probability `P(Bin(n, p) = k)` divided by the normal density with mean `n p` and variance
`n p (1 − p)` at `k` tends to `1`, uniformly over `k` with `|k − n p| ≤ A √n`. -/
theorem binomial_localLimit_ratio (p : unitInterval) (hp₀ : 0 < (p : ℝ)) (hp₁ : (p : ℝ) < 1)
    (A : ℝ) :
    ∀ ε > 0, ∀ᶠ n : ℕ in atTop, ∀ k : ℕ, |(k : ℝ) - n * p| ≤ A * √(n : ℝ) →
      |(binomial n p).real {k} /
          gaussianPDFReal (n * p) ((n : ℝ) * p * (1 - p)).toNNReal k - 1| ≤ ε := by
  sorry

/-! ## Layer 3: the local limit theorem for densities -/

/-- 3.1 **The smoothing condition.** For independent identically distributed real summands,
some power `|φ|^ν` of the characteristic function `φ` of `X 0` is integrable if and only if some
partial sum `Sₙ` has a bounded density. -/
theorem exists_integrable_norm_charFun_pow_iff {Ω : Type*} [MeasurableSpace Ω]
    {P : Measure Ω} [IsProbabilityMeasure P] (X : ℕ → Ω → ℝ) (hindep : iIndepFun X P)
    (hident : ∀ i, IdentDistrib (X i) (X 0) P P) :
    (∃ ν : ℕ, Integrable (fun t ↦ ‖charFun (P.map (X 0)) t‖ ^ ν)) ↔
      ∃ n : ℕ, ∃ f : ℝ → ℝ, Measurable f ∧ (∃ C, ∀ x, |f x| ≤ C) ∧
        P.map (fun ω ↦ ∑ i ∈ range n, X i ω) =
          volume.withDensity (fun x ↦ ENNReal.ofReal (f x)) := by
  sorry

/-- 3.2 **Gnedenko's local limit theorem for densities.** Let `X 0, X 1, …` be independent,
identically distributed and real, with mean `m` and variance `σ²`, and let `|φ|^ν` be integrable
for the characteristic function `φ` of `X 0`. Then for `n ≥ ν` the law of `Zₙ = (Sₙ − n m)/√n`
has the continuous density `charFunDensity`, and these densities converge to the normal density
with mean `0` and variance `σ²` uniformly on `ℝ`. If the second moment is infinite, `σ² = 0` by
Mathlib's convention and the densities converge to `0` uniformly. -/
theorem localLimit_density {Ω : Type*} [MeasurableSpace Ω] {P : Measure Ω}
    [IsProbabilityMeasure P] (X : ℕ → Ω → ℝ) (hindep : iIndepFun X P)
    (hident : ∀ i, IdentDistrib (X i) (X 0) P P) (ν : ℕ)
    (hν : Integrable (fun t ↦ ‖charFun (P.map (X 0)) t‖ ^ ν)) :
    (∀ n : ℕ, ν ≤ n →
      P.map (fun ω ↦ (√(n : ℝ))⁻¹ * (∑ i ∈ range n, X i ω - n * P[X 0])) =
        volume.withDensity (fun x ↦ ENNReal.ofReal (Measure.charFunDensity
          (P.map (fun ω ↦ (√(n : ℝ))⁻¹ * (∑ i ∈ range n, X i ω - n * P[X 0]))) x))) ∧
    ∀ ε > 0, ∀ᶠ n : ℕ in atTop, ∀ x : ℝ,
      |Measure.charFunDensity
          (P.map (fun ω ↦ (√(n : ℝ))⁻¹ * (∑ i ∈ range n, X i ω - n * P[X 0]))) x -
        gaussianPDFReal 0 (Var[X 0; P]).toNNReal x| ≤ ε := by
  sorry

end TauCetiRoadmap.LocalLimitTheorems
