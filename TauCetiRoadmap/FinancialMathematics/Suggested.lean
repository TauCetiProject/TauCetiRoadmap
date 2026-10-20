/-
Suggested forms, not an exhaustive checklist. The README is the definitive
specification for the reusable FinancialMathematics M0 market/replication floor.
The Gaussian payoff identity marked `sorry` is a theorem target, not an implementation claim.
The deterministic drift lemma does not assert stochastic replication.
-/
import Mathlib.Analysis.Calculus.Deriv.Basic
import Mathlib.Analysis.Calculus.ContDiff.Basic
import Mathlib.MeasureTheory.Measure.Lebesgue.Basic
import Mathlib.MeasureTheory.Integral.Bochner.Basic
import Mathlib.Probability.Distributions.Gaussian.Real
import Mathlib.Probability.CDF

noncomputable section
namespace FinancialMathematics

abbrev Price := ℝ → ℝ → ℝ

def timeDeriv (C : Price) (s t : ℝ) : ℝ := deriv (fun u => C s u) t
def priceDeriv (C : Price) (s t : ℝ) : ℝ := deriv (fun u => C u t) s
def gamma (C : Price) (s t : ℝ) : ℝ := deriv (fun u => priceDeriv C u t) s

def blackScholesResidual (r σ : ℝ) (C : Price) (s t : ℝ) : ℝ :=
  timeDeriv C s t + (σ ^ 2 * s ^ 2 / 2) * gamma C s t +
    r * (s * priceDeriv C s t - C s t)

def itoDrift (μ σ : ℝ) (C : Price) (s t : ℝ) : ℝ :=
  timeDeriv C s t + μ * s * priceDeriv C s t +
    (σ ^ 2 * s ^ 2 / 2) * gamma C s t

def selfFinancingDeltaDrift (r μ : ℝ) (C : Price) (s t : ℝ) : ℝ :=
  μ * s * priceDeriv C s t + r * (C s t - s * priceDeriv C s t)

def geometricAsset (s₀ μ σ : ℝ) (W : ℝ → ℝ) (t : ℝ) : ℝ :=
  s₀ * Real.exp ((μ - σ ^ 2 / 2) * t + σ * W t)

def risklessAccount (r β₀ t : ℝ) : ℝ := β₀ * Real.exp (r * t)

theorem geometricAsset_positive (s₀ μ σ : ℝ) (W : ℝ → ℝ) (t : ℝ)
    (hs : 0 < s₀) : 0 < geometricAsset s₀ μ σ W t := by
  unfold geometricAsset
  positivity

theorem risklessAccount_positive (r β₀ t : ℝ) (hβ : 0 < β₀) :
    0 < risklessAccount r β₀ t := by
  unfold risklessAccount
  positivity

theorem algebraic_drift_match_implies_black_scholes
    (r μ σ s t : ℝ) (C : Price)
    (hmatch : itoDrift μ σ C s t = selfFinancingDeltaDrift r μ C s t) :
    blackScholesResidual r σ C s t = 0 := by
  unfold itoDrift selfFinancingDeltaDrift blackScholesResidual at *
  linarith

/-- Native standard-Gaussian CDF, with no second Gaussian measure construction. -/
def standardGaussianCDF (z : ℝ) : ℝ :=
  ProbabilityTheory.cdf (ProbabilityTheory.gaussianReal 0 1) z

/-- Constant-coefficient risk-neutral terminal spot from a standard normal coordinate.
The financial interpretation uses τ ≥ 0; the underlying real expression is total. -/
def riskNeutralTerminalSpot (s r σ τ z : ℝ) : ℝ :=
  s * Real.exp ((r - σ ^ 2 / 2) * τ + σ * Real.sqrt τ * z)

def callPayoff (K s : ℝ) : ℝ := max (s - K) 0

/-- The integral carrier for an arbitrary real payoff. Pricing theorems must prove its
integrability; the Bochner integral alone does not make a payoff admissible. -/
def discountedGaussianPrice (h : ℝ → ℝ) (s r σ τ : ℝ) : ℝ :=
  Real.exp (-r * τ) * ∫ z, h (riskNeutralTerminalSpot s r σ τ z)
    ∂ProbabilityTheory.gaussianReal 0 1

def blackScholesDplus (s r σ K τ : ℝ) : ℝ :=
  (Real.log (s / K) + (r + σ ^ 2 / 2) * τ) / (σ * Real.sqrt τ)

def blackScholesDminus (s r σ K τ : ℝ) : ℝ :=
  blackScholesDplus s r σ K τ - σ * Real.sqrt τ

/-- Remaining-maturity call formula; Price uses calendar time, so τ=T-t there. -/
def blackScholesCall (s r σ K τ : ℝ) : ℝ :=
  s * standardGaussianCDF (blackScholesDplus s r σ K τ) -
    K * Real.exp (-r * τ) * standardGaussianCDF (blackScholesDminus s r σ K τ)

theorem standardGaussianCDF_mem_unitInterval (z : ℝ) :
    0 ≤ standardGaussianCDF z ∧ standardGaussianCDF z ≤ 1 := by
  exact ⟨ProbabilityTheory.cdf_nonneg _ _, ProbabilityTheory.cdf_le_one _ _⟩

theorem riskNeutralTerminalSpot_positive (s r σ τ z : ℝ) (hs : 0 < s) :
    0 < riskNeutralTerminalSpot s r σ τ z := by
  unfold riskNeutralTerminalSpot
  positivity

@[simp] theorem riskNeutralTerminalSpot_zero (s r σ z : ℝ) :
    riskNeutralTerminalSpot s r σ 0 z = s := by
  simp [riskNeutralTerminalSpot]

@[simp] theorem discountedGaussianPrice_zero (h : ℝ → ℝ) (s r σ : ℝ) :
    discountedGaussianPrice h s r σ 0 = h s := by
  simp [discountedGaussianPrice]

/-- Exponential Gaussian integrability uses the existing native MGF theorem. -/
theorem integrable_riskNeutralTerminalSpot (s r σ τ : ℝ) :
    MeasureTheory.Integrable (riskNeutralTerminalSpot s r σ τ)
      (ProbabilityTheory.gaussianReal 0 1) := by
  have h := ProbabilityTheory.integrable_exp_mul_gaussianReal
    (μ := (0 : ℝ)) (v := (1 : NNReal)) (σ * Real.sqrt τ)
  convert h.const_mul (s * Real.exp ((r - σ ^ 2 / 2) * τ)) using 1
  ext z
  simp only [riskNeutralTerminalSpot, Real.exp_add]
  ring

theorem integrable_callPayoff (s r σ K τ : ℝ) :
    MeasureTheory.Integrable (fun z => callPayoff K (riskNeutralTerminalSpot s r σ τ z))
      (ProbabilityTheory.gaussianReal 0 1) := by
  exact ((integrable_riskNeutralTerminalSpot s r σ τ).sub
    (MeasureTheory.integrable_const K)).sup (MeasureTheory.integrable_const 0)

/-- M0.4's Gaussian payoff identity. This is an analytic construction target;
it does not state the market measure, predictable representation, PDE or replication theorem. -/
theorem discountedGaussianPrice_call (s r σ K τ : ℝ)
    (hs : 0 < s) (hσ : 0 < σ) (hK : 0 < K) (hτ : 0 < τ) :
    discountedGaussianPrice (callPayoff K) s r σ τ = blackScholesCall s r σ K τ := by
  sorry

end FinancialMathematics
