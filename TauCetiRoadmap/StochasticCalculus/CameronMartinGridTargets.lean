import Mathlib.Probability.Distributions.Gaussian.Real
import Mathlib.MeasureTheory.Constructions.Pi

/-!
Suggested forms are aids, not the specification; the README is definitive.
These finite increment-law targets support S8.3's construction of the path-space
Cameron–Martin density. All variances are positive; the empty grid is included.
The continuum projection and stochastic-integral steps remain README targets.
-/
noncomputable section
open MeasureTheory ProbabilityTheory
open scoped BigOperators ENNReal NNReal
namespace StochasticCalculusSuggested.CameronMartinGrid

variable {n : ℕ}

def incrementLaw (v : Fin n → ℝ≥0) : Measure (Fin n → ℝ) :=
  Measure.pi (fun i => gaussianReal 0 (v i))

def energy (v : Fin n → ℝ≥0) (a : Fin n → ℝ) : ℝ :=
  ∑ i, (a i) ^ 2 / (v i : ℝ)

def likelihood (v : Fin n → ℝ≥0) (a x : Fin n → ℝ) : ℝ :=
  Real.exp (∑ i, (a i * x i / (v i : ℝ) - (a i) ^ 2 / (2 * (v i : ℝ))))

/-- The positive cross term is the pushforward by addition of the shift. -/
theorem translated_increment_density (v : Fin n → ℝ≥0) (hv : ∀ i, 0 < v i)
    (a : Fin n → ℝ) :
    Measure.map (fun x => x + a) (incrementLaw v) =
      (incrementLaw v).withDensity (fun x => ENNReal.ofReal (likelihood v a x)) := by
  sorry

/-- Positive densities have every real power integrable, including negative powers. -/
theorem likelihood_power_integrable (v : Fin n → ℝ≥0) (hv : ∀ i, 0 < v i)
    (a : Fin n → ℝ) (p : ℝ) :
    Integrable (fun x => (likelihood v a x) ^ p) (incrementLaw v) := by
  sorry

/-- Gaussian moments give normalization, uniform Lp bounds and the L2 projection error. -/
theorem likelihood_power_moment (v : Fin n → ℝ≥0) (hv : ∀ i, 0 < v i)
    (a : Fin n → ℝ) (p : ℝ) :
    (∫ x, (likelihood v a x) ^ p ∂incrementLaw v) =
      Real.exp (p * (p - 1) * energy v a / 2) := by
  sorry

end StochasticCalculusSuggested.CameronMartinGrid
