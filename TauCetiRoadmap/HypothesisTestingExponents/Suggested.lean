import Mathlib

/-!
# Error exponents of simple hypothesis tests: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the
few definitions they need; every definition has a real body. Every headline theorem of the README
is statable at the pins and is stated here. The README's routes and Checks are not restated.

The null hypothesis is a probability measure `P` and the alternative a probability measure `Q` on
a measurable space `X`; a sample of size `n` has law `Measure.pi fun _ : Fin n ↦ P` or
`Measure.pi fun _ : Fin n ↦ Q`. A randomized test is a measurable `[0, 1]`-valued function, the
probability of rejecting the null (`IsStatisticalTest`, copied verbatim from
MathematicalStatisticsFoundations 1.3); its type I error is `∫ φ dP` and its type II error is
`∫ (1 - φ) dQ`. In the Bayesian layer a test is a Markov kernel to `Bool` (`true` rejects the
null) and the Bayes error is Mathlib's `bayesRisk` for the zero-one loss. The Hellinger integral
is copied verbatim from RenyiDivergenceAndPrivacy 1.1. Logarithms are natural; `Real.log 0 = 0`,
and each statement says how it avoids that value.
-/

noncomputable section

open MeasureTheory ProbabilityTheory Filter Set Topology InformationTheory
open scoped ENNReal NNReal

namespace TauCetiRoadmap.HypothesisTestingExponents

section CopiedTests

variable {Θ X S : Type*} [MeasurableSpace X]

/-- **1.1** A randomized test (copied verbatim from MathematicalStatisticsFoundations 1.3). -/
def IsStatisticalTest (φ : X → ℝ) : Prop :=
  Measurable φ ∧ ∀ x, φ x ∈ Icc 0 1

end CopiedTests

section Layer1

variable {X : Type*} [MeasurableSpace X]

/-! ## Layer 1: Stein's lemma -/

/-- **1.1** The least type II error `β_ε(P, Q)` of a randomized test whose type I error is at
most `ε`: the infimum of `∫ (1 - φ) dQ` over the tests `φ` with `∫ φ dP ≤ ε`. For `ε < 0` the
class is empty and the value is the junk `0`; the theorems below take `0 ≤ ε`. -/
def steinBeta (P Q : Measure X) (ε : ℝ) : ℝ :=
  ⨅ φ : {φ : X → ℝ // IsStatisticalTest φ ∧ ∫ x, φ x ∂P ≤ ε}, ∫ x, (1 - φ.1 x) ∂Q

/-- **1.2** The weak converse: for every sample size `n` and `0 ≤ ε < 1`,
`(1 - ε) log (1 / β_ε(Pⁿ, Qⁿ)) ≤ n D(P ‖ Q) + log 2` (Polyanskiy–Wu, Theorem 14.8 and the weak
converse in the proof of Theorem 14.14). -/
theorem ofReal_mul_neg_log_steinBeta_le (P Q : Measure X) [IsProbabilityMeasure P]
    [IsProbabilityMeasure Q] {ε : ℝ} (hε : ε ∈ Ico 0 1) (n : ℕ) :
    ENNReal.ofReal ((1 - ε) * -Real.log
        (steinBeta (Measure.pi fun _ : Fin n ↦ P) (Measure.pi fun _ : Fin n ↦ Q) ε)) ≤
      n * klDiv P Q + ENNReal.ofReal (Real.log 2) := by
  sorry

/-- **1.3** Achievability: for every `E ≥ 0` below `D(P ‖ Q)`, finite or not, there are
measurable rejection regions `Aₙ ⊆ Xⁿ` whose type I error `Pⁿ(Aₙ)` tends to `0` and whose
type II error `Qⁿ(Aₙᶜ)` is eventually at most `exp (-n E)` (Polyanskiy–Wu, Theorem 14.14,
achievability part and the case `P` not absolutely continuous with respect to `Q`). -/
theorem exists_tendsto_typeI_zero_and_typeII_le_exp (P Q : Measure X) [IsProbabilityMeasure P]
    [IsProbabilityMeasure Q] {E : ℝ≥0} (hE : (E : ℝ≥0∞) < klDiv P Q) :
    ∃ A : (n : ℕ) → Set (Fin n → X), (∀ n, MeasurableSet (A n)) ∧
      Tendsto (fun n ↦ (Measure.pi fun _ : Fin n ↦ P) (A n)) atTop (𝓝 0) ∧
      ∀ᶠ n in atTop,
        (Measure.pi fun _ : Fin n ↦ Q) (A n)ᶜ ≤ ENNReal.ofReal (Real.exp (-(n * (E : ℝ)))) := by
  sorry

/-- **1.4** The strong converse: if `D(P ‖ Q) < E` and `ε < 1`, then eventually every randomized
test on `n` samples with type I error at most `ε` has type II error at least `exp (-n E)`. No
moment of the log-likelihood ratio beyond the finiteness of `D(P ‖ Q)` is assumed
(Polyanskiy–Wu, Theorem 14.10 and the strong converse in the proof of Theorem 14.14). -/
theorem exp_neg_mul_le_typeII_of_klDiv_lt (P Q : Measure X) [IsProbabilityMeasure P]
    [IsProbabilityMeasure Q] {ε : ℝ} (hε : ε < 1) {E : ℝ≥0} (hE : klDiv P Q < E) :
    ∀ᶠ n : ℕ in atTop, ∀ φ : (Fin n → X) → ℝ, IsStatisticalTest φ →
      ∫ x, φ x ∂(Measure.pi fun _ : Fin n ↦ P) ≤ ε →
        Real.exp (-(n * (E : ℝ))) ≤ ∫ x, (1 - φ x) ∂(Measure.pi fun _ : Fin n ↦ Q) := by
  sorry

/-- **1.5** Stein's lemma: for `0 < ε < 1`, `-(1/n) log β_ε(Pⁿ, Qⁿ) → D(P ‖ Q)` when the
divergence is finite, and `β_ε(Pⁿ, Qⁿ)` is eventually below `exp (-n E)` for every `E` when it is
infinite (Polyanskiy–Wu, Theorem 14.14). -/
theorem tendsto_neg_log_steinBeta_div (P Q : Measure X) [IsProbabilityMeasure P]
    [IsProbabilityMeasure Q] {ε : ℝ} (hε : ε ∈ Ioo 0 1) :
    (klDiv P Q ≠ ∞ →
      Tendsto (fun n : ℕ ↦ -Real.log
          (steinBeta (Measure.pi fun _ : Fin n ↦ P) (Measure.pi fun _ : Fin n ↦ Q) ε) / n)
        atTop (𝓝 (klDiv P Q).toReal)) ∧
    (klDiv P Q = ∞ → ∀ E : ℝ, ∀ᶠ n : ℕ in atTop,
      steinBeta (Measure.pi fun _ : Fin n ↦ P) (Measure.pi fun _ : Fin n ↦ Q) ε ≤
        Real.exp (-(n * E))) := by
  sorry

end Layer1

/-! ## Layer 2: the Bayes error and Chernoff information -/

section CopiedHellinger

variable {X Y Z : Type*} [MeasurableSpace X] [MeasurableSpace Y] [MeasurableSpace Z]

/-- **2.1** (copied verbatim from RenyiDivergenceAndPrivacy 1.1) The Hellinger integral of order
`α`: `∫ p^α q^(1-α) dμ` with `p = dP/dμ`, `q = dQ/dμ`
and `μ = P + Q`, computed in `ℝ≥0∞` (van Erven–Harremoës, Definition 2 and Remark 1). -/
def hellingerIntegral (α : ℝ) (P Q : Measure X) : ℝ≥0∞ :=
  ∫⁻ x, P.rnDeriv (P + Q) x ^ α * Q.rnDeriv (P + Q) x ^ (1 - α) ∂(P + Q)

end CopiedHellinger

section Layer2

variable {X : Type*} [MeasurableSpace X]

/-- **2.1** The zero-one loss of a decision `y` about the hypothesis `θ` (`false` for the null,
`true` for the alternative). -/
def testLoss (θ y : Bool) : ℝ≥0∞ := if θ = y then 0 else 1

/-- **2.1** The Chernoff coefficient `inf_{0 < s < 1} ∫ p^s q^(1-s) dμ`, the infimum of the
Hellinger integrals over the open interval of orders; the Chernoff information is its negative
logarithm. -/
def chernoffCoefficient (P Q : Measure X) : ℝ≥0∞ :=
  ⨅ s ∈ Ioo (0 : ℝ) 1, hellingerIntegral s P Q

/-- **2.2** The Hellinger bound on the Bayes error: for every prior `π` on `{false, true}`, every
order `0 < s < 1` and every sample size `n`, the Bayes error of `Pⁿ` against `Qⁿ` is at most
`π{false}^s π{true}^(1-s) H_s(P, Q)ⁿ` (the Bayes formulation is Polyanskiy–Wu (14.1) and §14.4;
the bound is proved here). -/
theorem bayesRisk_le_hellingerIntegral_pow (P Q : Measure X) [IsProbabilityMeasure P]
    [IsProbabilityMeasure Q] (π : Measure Bool) {s : ℝ} (hs : s ∈ Ioo 0 1) (n : ℕ) :
    bayesRisk testLoss
        (Kernel.boolKernel (Measure.pi fun _ : Fin n ↦ P) (Measure.pi fun _ : Fin n ↦ Q)) π ≤
      π {false} ^ s * π {true} ^ (1 - s) * hellingerIntegral s P Q ^ n := by
  sorry

/-- **2.3** Chernoff's theorem: for a finite prior charging both hypotheses, the `n`-th root of
the Bayes error of `Pⁿ` against `Qⁿ` tends to the Chernoff coefficient; equivalently the Bayes
error decays with exponent the Chernoff information `-log inf_{0 < s < 1} H_s(P, Q)`, infinite
exactly for mutually singular laws (Polyanskiy–Wu, Corollary 16.2, for mutually absolutely
continuous laws; proved here in general). -/
theorem tendsto_bayesRisk_rpow (P Q : Measure X) [IsProbabilityMeasure P]
    [IsProbabilityMeasure Q] (π : Measure Bool) [IsFiniteMeasure π] (h₀ : π {false} ≠ 0)
    (h₁ : π {true} ≠ 0) :
    Tendsto (fun n : ℕ ↦ bayesRisk testLoss
        (Kernel.boolKernel (Measure.pi fun _ : Fin n ↦ P) (Measure.pi fun _ : Fin n ↦ Q)) π ^
          (1 / (n : ℝ)))
      atTop (𝓝 (chernoffCoefficient P Q)) := by
  sorry

end Layer2

end TauCetiRoadmap.HypothesisTestingExponents
