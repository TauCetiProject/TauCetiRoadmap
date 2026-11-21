import Mathlib
import TauCeti.Probability.Distributions.Beta.Cdf
import TauCeti.Probability.Distributions.Binomial.Tail
import TauCeti.Probability.Distributions.Gaussian.Quantile
import TauCeti.Probability.Quantile

/-!
# Randomized smoothing: target signatures

**This file is not the roadmap, and it is not exhaustive.** The definitive document is
`README.md`. This file states the headline theorems of Layers 1–5 against the pinned Mathlib and
Tau Ceti APIs; discharging them finishes neither a milestone nor the roadmap. The `sorry` proofs
are targets, not completed results. Every headline is stated. Not stated, as API or one-step
consequences of the pinned quantile lemmas: the class-probability identities of §2.1, the tail
formula and lower bounds of §3.4, the upper Clopper–Pearson bound of §3.3, the mean-value bounds
of Layer 4 and the limit of §5.3.
-/

noncomputable section

open MeasureTheory ProbabilityTheory Set

namespace TauCetiRoadmap.RandomizedSmoothing

/-- The standard Gaussian cdf `Φ`. -/
abbrev stdNormalCDF (t : ℝ) : ℝ := cdf (gaussianReal 0 1) t

/-- The standard Gaussian quantile `Φ⁻¹`, meaningful on `(0, 1)`. -/
abbrev probit (p : ℝ) : ℝ := (gaussianReal 0 1).quantile p

variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E] [FiniteDimensional ℝ E]
  [MeasurableSpace E] [BorelSpace E]

/-! ## Layer 1: Gaussian smoothing -/

/-- The Gaussian smoothing `x ↦ ∫ f (x + σ z) dγ(z)`. -/
def smooth (σ : ℝ) (f : E → ℝ) (x : E) : ℝ :=
  ∫ z, f (x + σ • z) ∂(stdGaussian E)

/-- The Gaussian shift inequality, lower form. -/
theorem stdNormalCDF_sub_norm_le_integral_add {g : E → ℝ} (hg : Measurable g)
    (h0 : ∀ z, 0 ≤ g z) (h1 : ∀ z, g z ≤ 1) {t : ℝ}
    (ht : stdNormalCDF t ≤ ∫ z, g z ∂(stdGaussian E)) (δ : E) :
    stdNormalCDF (t - ‖δ‖) ≤ ∫ z, g (z + δ) ∂(stdGaussian E) := sorry

/-- The Gaussian shift inequality, upper form. -/
theorem integral_add_le_stdNormalCDF_add_norm {g : E → ℝ} (hg : Measurable g)
    (h0 : ∀ z, 0 ≤ g z) (h1 : ∀ z, g z ≤ 1) {t : ℝ}
    (ht : ∫ z, g z ∂(stdGaussian E) ≤ stdNormalCDF t) (δ : E) :
    ∫ z, g (z + δ) ∂(stdGaussian E) ≤ stdNormalCDF (t + ‖δ‖) := sorry

/-- The positivity trichotomy for smoothed `[0, 1]`-valued functions. -/
theorem smooth_trichotomy {σ : ℝ} (hσ : 0 < σ) {f : E → ℝ} (hf : Measurable f)
    (h0 : ∀ z, 0 ≤ f z) (h1 : ∀ z, f z ≤ 1) :
    (∀ x, smooth σ f x = 0) ∨ (∀ x, smooth σ f x = 1) ∨ (∀ x, smooth σ f x ∈ Ioo 0 1) := sorry

/-- The smoothed probit is `σ⁻¹`-Lipschitz. -/
theorem lipschitzWith_probit_smooth {σ : ℝ} (hσ : 0 < σ) {f : E → ℝ} (hf : Measurable f)
    (h0 : ∀ z, 0 ≤ f z) (h1 : ∀ z, f z ≤ 1) (hp : ∀ x, smooth σ f x ∈ Ioo 0 1) :
    LipschitzWith (Real.toNNReal σ⁻¹) (fun x => probit (smooth σ f x)) := sorry

/-- Gaussian smoothing of a `[0, 1]`-valued function is `(σ √(2π))⁻¹`-Lipschitz. -/
theorem lipschitzWith_smooth {σ : ℝ} (hσ : 0 < σ) {f : E → ℝ} (hf : Measurable f)
    (h0 : ∀ z, 0 ≤ f z) (h1 : ∀ z, f z ≤ 1) :
    LipschitzWith (Real.toNNReal (σ * √(2 * Real.pi))⁻¹) (smooth σ f) := sorry

/-! ## Layer 2: the certified radius -/

/-- The probability that the base classifier returns `c` at `x + σ z`. -/
def classProb {k : ℕ} (σ : ℝ) (C : E → Fin k) (c : Fin k) (x : E) : ℝ :=
  (stdGaussian E).real {z | C (x + σ • z) = c}

/-- The smoothed classifier strictly prefers `A` at every point of the open ball of radius `R`
about `x`. -/
def SmoothCertified {k : ℕ} (σ : ℝ) (C : E → Fin k) (x : E) (A : Fin k) (R : ℝ) : Prop :=
  ∀ δ : E, ‖δ‖ < R → ∀ c, c ≠ A → classProb σ C c (x + δ) < classProb σ C A (x + δ)

/-- Cohen–Rosenfeld–Kolter: the certified radius `(σ/2)(Φ⁻¹ p̲_A - Φ⁻¹ p̄_B)`. -/
theorem smoothCertified_of_bounds {k : ℕ} {σ : ℝ} (hσ : 0 < σ) {C : E → Fin k}
    (hC : Measurable C) {x : E} {A : Fin k} {pA pB : ℝ} (hpA : pA ∈ Ioo 0 1)
    (hpB : pB ∈ Ioo 0 1) (hA : pA ≤ classProb σ C A x)
    (hB : ∀ c, c ≠ A → classProb σ C c x ≤ pB) :
    SmoothCertified σ C x A (σ / 2 * (probit pA - probit pB)) := sorry

/-- The one-sided radius `σ Φ⁻¹ p̲_A`. -/
theorem smoothCertified_of_lower_bound {k : ℕ} {σ : ℝ} (hσ : 0 < σ) {C : E → Fin k}
    (hC : Measurable C) {x : E} {A : Fin k} {pA : ℝ} (hpA : pA ∈ Ioo (1 / 2) 1)
    (hA : pA ≤ classProb σ C A x) :
    SmoothCertified σ C x A (σ * probit pA) := sorry

/-- Sharpness of the certified radius: beyond it, some classifier with the same class
probabilities at `x` prefers `B` (Cohen–Rosenfeld–Kolter, Theorem 2). -/
theorem exists_classifier_not_certified [Nontrivial E] {k : ℕ} {σ : ℝ} (hσ : 0 < σ) {pA pB : ℝ}
    (hpB : 0 < pB) (hBA : pB ≤ pA) (hpA : pA < 1) (hsum : pA + pB ≤ 1)
    (hk : 2 + ⌈(1 - pA - pB) / pB⌉₊ ≤ k) {A B : Fin k} (hAB : A ≠ B) (x δ : E)
    (hδ : σ / 2 * (probit pA - probit pB) < ‖δ‖) :
    ∃ C : E → Fin k, Measurable C ∧ classProb σ C A x = pA ∧ classProb σ C B x = pB ∧
      (∀ c, c ≠ A → classProb σ C c x ≤ pB) ∧
      classProb σ C A (x + δ) < classProb σ C B (x + δ) := sorry

/-! ## Layer 3: exact binomial confidence bounds -/

/-- The binomial tail `P(X ≥ k)` for `X ∼ Bin(N, q)`. -/
def tail (N k : ℕ) (q : unitInterval) : ℝ :=
  (binomial N q).real {m | k ≤ m}

/-- The Clopper–Pearson lower confidence bound. -/
def cpLower (α : ℝ) (N k : ℕ) : ℝ :=
  sSup (Subtype.val '' {q : unitInterval | tail N k q ≤ α})

/-- The Clopper–Pearson bound is monotone in the number of successes. -/
theorem monotone_cpLower (α : ℝ) (N : ℕ) : Monotone (cpLower α N) := sorry

/-- Coverage of the Clopper–Pearson lower bound. -/
theorem binomial_real_lt_cpLower_le {α : ℝ} (hα : 0 ≤ α) (N : ℕ) (p : unitInterval) :
    (binomial N p).real {k | (p : ℝ) < cpLower α N k} ≤ α := sorry

/-- The Clopper–Pearson lower bound is a Beta quantile. -/
theorem cpLower_eq_quantile_betaMeasure {α : ℝ} (hα : α ∈ Ioo 0 1) {N k : ℕ} (hk : 1 ≤ k)
    (hkN : k ≤ N) :
    cpLower α N k = (betaMeasure k ((N : ℝ) - k + 1)).quantile α := sorry

/-- The Clopper–Pearson lower bound after `N` successes in `N` trials. -/
theorem cpLower_self {α : ℝ} (hα₀ : 0 ≤ α) (hα₁ : α ≤ 1) {N : ℕ} (hN : 1 ≤ N) :
    cpLower α N N = α ^ ((1 : ℝ) / N) := sorry

/-! ## Layer 5: Monte Carlo certification -/

/-- The number of noisy samples on which the base classifier returns `A`. -/
def hitCount {k N : ℕ} (σ : ℝ) (C : E → Fin k) (x : E) (A : Fin k) (ω : Fin N → E) : ℕ :=
  (Finset.univ.filter fun i => C (x + σ • ω i) = A).card

/-- The certification procedure returns a false certificate with probability at most `α`. -/
theorem certify_failure_le {k : ℕ} {σ : ℝ} (hσ : 0 < σ) {C : E → Fin k} (hC : Measurable C)
    (x : E) (A : Fin k) (N : ℕ) {α : ℝ} (hα : α ∈ Ico 0 1) :
    (Measure.pi fun _ : Fin N => stdGaussian E).real
      {ω | 1 / 2 < cpLower α N (hitCount σ C x A ω) ∧
        ¬ SmoothCertified σ C x A (σ * probit (cpLower α N (hitCount σ C x A ω)))} ≤ α :=
  sorry

/-- The certification guarantee when the class is selected from an independent sample. -/
theorem certify_failure_le_of_selection {k : ℕ} {σ : ℝ} (hσ : 0 < σ) {C : E → Fin k}
    (hC : Measurable C) (x : E) (N₀ N : ℕ) {s : (Fin N₀ → E) → Fin k} (hs : Measurable s)
    {α : ℝ} (hα : α ∈ Ico 0 1) :
    ((Measure.pi fun _ : Fin N₀ => stdGaussian E).prod
        (Measure.pi fun _ : Fin N => stdGaussian E)).real
      {ω | 1 / 2 < cpLower α N (hitCount σ C x (s ω.1) ω.2) ∧
        ¬ SmoothCertified σ C x (s ω.1)
          (σ * probit (cpLower α N (hitCount σ C x (s ω.1) ω.2)))} ≤ α := sorry

end TauCetiRoadmap.RandomizedSmoothing
