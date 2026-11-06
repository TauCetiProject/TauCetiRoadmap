import Mathlib

/-!
# Uniform prime series and Mellin smoothing: representative interfaces

The roadmap is README.md §0.11a–c. This file is a selection of suggested
interfaces, not an exhaustive checklist. Definitions are native finite sums and
Bochner integrals; admitted proofs are targets. Prime estimates from §§0.11 and
3.17 and the existing Euler logarithmic-derivative series are inputs.
-/

noncomputable section

set_option autoImplicit false

open scoped BigOperators
open MeasureTheory

namespace TauCetiRoadmap.AnalyticNumberTheoryPartI.WeightedPrimeSmoothing

/-- Inclusive cutoff, with nonprime indices removed by the native predicate. -/
def weightedPrimeSum {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
    (a : ℕ → E) (x : ℝ) : E :=
  ∑ p ∈ (Finset.range (⌊x⌋₊ + 1)).filter Nat.Prime,
    (Real.log p / p : ℝ) • a p

theorem prime_tail_bound :
    ∃ C : ℝ, 0 ≤ C ∧ ∀ y : ℝ, 2 ≤ y →
      (∑' p : Nat.Primes, if y ≤ (p : ℕ) then
        Real.log (p : ℕ) / ((p : ℕ) : ℝ) ^ 2 else 0) ≤ C / y := by
  sorry

/-- Absolute bounded error, chosen before level, character, and evaluation point. -/
theorem uniform_logDeriv_prime_sum :
    ∃ C : ℝ, 0 ≤ C ∧ ∀ (q : ℕ) [NeZero q] (χ : DirichletCharacter ℂ q),
      ∀ σ : ℝ, 1 < σ → σ ≤ 2 →
        Summable (fun p : Nat.Primes =>
          χ (p : ℕ) * ((Real.log (p : ℕ) / ((p : ℕ) : ℝ) ^ σ : ℝ) : ℂ)) ∧
        ‖logDeriv χ.LFunction (σ : ℂ) + ∑' p : Nat.Primes,
          χ (p : ℕ) * ((Real.log (p : ℕ) / ((p : ℕ) : ℝ) ^ σ : ℝ) : ℂ)‖ ≤ C := by
  sorry

theorem uniform_regularized_zeta :
    ∃ C : ℝ, 0 ≤ C ∧ ∀ η : ℝ, 0 < η → η ≤ 1 →
      ‖-logDeriv riemannZeta ((1 + η : ℝ) : ℂ) - (1 / η : ℂ)‖ ≤ C := by
  sorry

/-- One identity covers real and complex bounded weights. -/
theorem prime_mellin_identity {E : Type*} [NormedAddCommGroup E]
    [NormedSpace ℝ E] [CompleteSpace E] (a : ℕ → E)
    (ha : ∀ p, p.Prime → ‖a p‖ ≤ 1) (η : ℝ) (hη : 0 < η) :
    Summable (fun p : Nat.Primes =>
      (Real.log (p : ℕ) / ((p : ℕ) : ℝ) ^ (1 + η)) • a p) ∧
    IntegrableOn (fun t : ℝ => t ^ (-1 - η) • weightedPrimeSum a t) (Set.Ioi 1) ∧
    (∑' p : Nat.Primes,
      (Real.log (p : ℕ) / ((p : ℕ) : ℝ) ^ (1 + η)) • a p) =
      η • ∫ t in Set.Ioi (1 : ℝ), t ^ (-1 - η) • weightedPrimeSum a t := by
  sorry

theorem mellin_mass (η : ℝ) (hη : 0 < η) :
    η * (∫ t in Set.Ioi (1 : ℝ), t ^ (-1 - η)) = 1 := by
  sorry

theorem mellin_log_moment (η : ℝ) (hη : 0 < η) :
    η * (∫ t in Set.Ioi (1 : ℝ), Real.log t * t ^ (-1 - η)) = 1 / η := by
  sorry

theorem mellin_mono (η : ℝ) (hη : 0 < η) (f g : ℝ → ℝ)
    (hf : IntegrableOn (fun t => f t * t ^ (-1 - η)) (Set.Ioi 1))
    (hg : IntegrableOn (fun t => g t * t ^ (-1 - η)) (Set.Ioi 1))
    (hfg : ∀ t ∈ Set.Ioi (1 : ℝ), f t ≤ g t) :
    η * (∫ t in Set.Ioi (1 : ℝ), f t * t ^ (-1 - η)) ≤
      η * (∫ t in Set.Ioi (1 : ℝ), g t * t ^ (-1 - η)) := by
  sorry

theorem mellin_loglog_bound (η : ℝ) (hη : 0 < η) :
    IntegrableOn (fun t : ℝ => Real.log (Real.log (3 * t)) * t ^ (-1 - η))
      (Set.Ioi 1) ∧
    η * (∫ t in Set.Ioi (1 : ℝ), Real.log (Real.log (3 * t)) * t ^ (-1 - η)) ≤
      Real.log (Real.log 3 + 1 / η) := by
  sorry

theorem mellin_loglog_coarse :
    ∃ C : ℝ, 0 ≤ C ∧ ∀ η : ℝ, 0 < η → η ≤ 1 →
      Real.log (Real.log 3 + 1 / η) ≤ C * Real.log (2 / η) := by
  sorry

example (a : ℕ → ℝ) : weightedPrimeSum a (1 : ℝ) = 0 := by sorry

example : weightedPrimeSum (fun _ => (1 : ℝ)) 2 = Real.log 2 / 2 := by sorry

end TauCetiRoadmap.AnalyticNumberTheoryPartI.WeightedPrimeSmoothing
