import TauCetiRoadmap.FinancialMathematics.Suggested
import Mathlib.Analysis.Calculus.Deriv.Basic
import Mathlib.Analysis.Calculus.ContDiff.Basic
import Mathlib.Analysis.Calculus.IteratedDeriv.Defs
import Mathlib.Analysis.SpecialFunctions.Exp
import Mathlib.MeasureTheory.Measure.Lebesgue.Basic
import Mathlib.MeasureTheory.Integral.Bochner.Basic
import Mathlib.MeasureTheory.Integral.IntegrableOn

/-!
**This file is not the roadmap and is not exhaustive.** These are suggested forms;
the README is the definitive specification. Every `sorry` is an unimplemented target.
-/

noncomputable section
open MeasureTheory
open scoped ContDiff
namespace FinancialMathematics.MarketImpactSuggested

abbrev Demand := ℝ → ℝ → ℝ
abbrev Profile := ℝ → ℝ

/-- Feedback volatility for linear reference demand. The positive denominator is a theorem hypothesis. -/
def linearFeedbackVolatility (σ ρ : ℝ) (C : Price) (x t : ℝ) : ℝ :=
  σ * x * (1 - ρ * priceDeriv C x t) /
    (1 - ρ * priceDeriv C x t - ρ * x * gamma C x t)

def linearFeedbackResidual (r σ ρ : ℝ) (C : Price) (x t : ℝ) : ℝ :=
  timeDeriv C x t +
    (linearFeedbackVolatility σ ρ C x t) ^ 2 / 2 * gamma C x t +
    r * (x * priceDeriv C x t - C x t)

def classicalConsistentDemand (γ : ℝ) (U : Profile) (x y : ℝ) : ℝ :=
  U (y ^ γ / x)

def demandRatioCondition (γ : ℝ) (D : Demand) : Prop :=
  ∀ x y, 0 < x → 0 < y →
    deriv (fun z => D x z) y / deriv (fun z => D z y) x = -γ * x / y

def leastSquaresFirstVariation (C1 vega : ℝ → ℝ) : ℝ :=
  (∫ x in Set.Ioi 0, C1 x * vega x) /
    (∫ x in Set.Ioi 0, vega x ^ 2)

def feedbackParabolicMargins (ρ δ : ℝ) (C : Price) (x t : ℝ) : Prop :=
  0 < δ ∧ 0 < x ∧
    δ ≤ 1 - ρ * priceDeriv C x t ∧
    δ ≤ 1 - ρ * priceDeriv C x t - ρ * x * gamma C x t ∧
    δ ≤ 1 - ρ * priceDeriv C x t + ρ * x * gamma C x t

def parameterCylinder (ρ₀ T ε : ℝ) : Set (ℝ × ℝ × ℝ) :=
  {p | |p.1| < ρ₀ ∧ 0 < p.2.1 ∧ 0 < p.2.2 ∧ p.2.2 < T - ε}

def discountedCash (k r τ t : ℝ) : ℝ := k * Real.exp (-r * (τ - t))

/-- Subtract the prescribed bond-price trace before dividing by spot. Bounded first
and second log derivatives express delta and spot-times-gamma. -/
def normalizedLogPrice (k r τ : ℝ) (C : Price) (z t : ℝ) : ℝ :=
  (C (Real.exp z) t - discountedCash k r τ t) / Real.exp z

def weightedAggregateDelta {ι : Type*} [Fintype ι]
    (q : ι → ℝ) (claims : ι → Price) (x t : ℝ) : ℝ :=
  ∑ i, q i * priceDeriv (claims i) x t

def weightedAggregateGamma {ι : Type*} [Fintype ι]
    (q : ι → ℝ) (claims : ι → Price) (x t : ℝ) : ℝ :=
  ∑ i, q i * gamma (claims i) x t

def multiClaimFeedbackVolatility {ι : Type*} [Fintype ι]
    (σ : ℝ) (q : ι → ℝ) (claims : ι → Price) (x t : ℝ) : ℝ :=
  let h := weightedAggregateDelta q claims x t
  let hx := weightedAggregateGamma q claims x t
  σ * x * (1 - h) / (1 - h - x * hx)

def multiClaimFeedbackResidual {ι : Type*} [Fintype ι]
    (r σ : ℝ) (q : ι → ℝ) (claims : ι → Price) (C : Price) (x t : ℝ) : ℝ :=
  timeDeriv C x t +
    (multiClaimFeedbackVolatility σ q claims x t) ^ 2 / 2 * gamma C x t +
    r * (x * priceDeriv C x t - C x t)

/-- At zero feedback this is direct substitution, not a limit theorem. -/
theorem feedback_zero_parameter_substitution
    (r σ : ℝ) (C : Price)
    (hPDE : ∀ x t, 0 < x → linearFeedbackResidual r σ 0 C x t = 0) :
    ∀ x t, 0 < x → blackScholesResidual r σ C x t = 0 := by
  intro x t hx
  simpa [linearFeedbackResidual, linearFeedbackVolatility,
    blackScholesResidual, mul_pow] using hPDE x t hx

/-- The ratio PDE determines a profile with positive derivative; strict monotonicity alone is not enough. -/
theorem ratio_condition_characterizes_profile
    (γ : ℝ) (hγ : 0 < γ) (D : Demand)
    (hD : ContDiffOn ℝ 1 (Function.uncurry D)
      {p : ℝ × ℝ | 0 < p.1 ∧ 0 < p.2})
    (hDx : ∀ x y, 0 < x → 0 < y → deriv (fun z => D z y) x < 0)
    (hRatio : demandRatioCondition γ D) :
    ∃ U : Profile,
      ContDiffOn ℝ 1 U (Set.Ioi 0) ∧
      (∀ z, 0 < z → 0 < deriv U z) ∧
      (∀ x y, 0 < x → 0 < y → D x y = classicalConsistentDemand γ U x y) := by
  sorry

theorem profile_implies_ratio_condition
    (γ : ℝ) (hγ : 0 < γ) (U : Profile)
    (hU : ContDiffOn ℝ 1 U (Set.Ioi 0))
    (hU' : ∀ z, 0 < z → 0 < deriv U z) :
    demandRatioCondition γ (classicalConsistentDemand γ U) := by
  sorry

/-- The pointwise PDE targets are confined to an open positive-parabolicity cylinder. -/
theorem feedback_first_variation_on_cylinder
    (r σ ρ₀ T ε : ℝ) (F : ℝ → Price)
    (hρ₀ : 0 < ρ₀) (hε : 0 < ε ∧ ε < T)
    (hSmooth : ContDiffOn ℝ 3
      (fun p : ℝ × ℝ × ℝ => F p.1 p.2.1 p.2.2)
      (parameterCylinder ρ₀ T ε))
    (hPDE : ∀ ρ x t, |ρ| < ρ₀ → 0 < x → 0 < t → t < T - ε →
      linearFeedbackResidual r σ ρ (F ρ) x t = 0) :
    ∀ x t, 0 < x → 0 < t → t < T - ε →
      blackScholesResidual r σ (fun x t => deriv (fun q => F q x t) 0) x t =
        -σ ^ 2 * x ^ 3 * (gamma (F 0) x t) ^ 2 := by
  sorry

/--
The smooth-terminal specialization of the full Hölder-space existence target in M3.2.
Terminal continuity and uniform normalized derivative bounds are explicit; the terminal
condition cannot be assigned independently of the interior solution.
-/
theorem feedback_implicit_function_solution
    (r σ T ε k : ℝ) (terminal : ℝ → ℝ)
    (hσ : 0 < σ) (hε : 0 < ε ∧ ε < T)
    (hTerminalSmooth : ContDiff ℝ ∞ terminal)
    (hTerminalBounds : ∀ n : ℕ, ∃ M : ℝ, ∀ z, |iteratedDeriv n terminal z| ≤ M) :
    ∃ ρ₀ > 0, ∃ δ > 0, ∃ F : ℝ → Price,
      ContDiffOn ℝ 3 (fun p : ℝ × ℝ × ℝ => F p.1 p.2.1 p.2.2)
        (parameterCylinder ρ₀ T ε) ∧
      ContinuousOn (fun p : ℝ × ℝ × ℝ => F p.1 p.2.1 p.2.2)
        {p | |p.1| < ρ₀ ∧ 0 < p.2.1 ∧ p.2.2 ∈ Set.Icc 0 (T - ε)} ∧
      (∀ ρ z, |ρ| < ρ₀ →
        F ρ (Real.exp z) (T - ε) = k + Real.exp z * terminal z) ∧
      (∀ ρ, |ρ| < ρ₀ → ∃ M > 0, ∀ z t, t ∈ Set.Icc 0 (T - ε) →
        |normalizedLogPrice k r (T - ε) (F ρ) z t| +
        |deriv (fun w => normalizedLogPrice k r (T - ε) (F ρ) w t) z| +
        |deriv (fun w => deriv (fun v =>
          normalizedLogPrice k r (T - ε) (F ρ) v t) w) z| ≤ M) ∧
      (∀ ρ x t, |ρ| < ρ₀ → 0 < x → 0 < t → t < T - ε →
        linearFeedbackResidual r σ ρ (F ρ) x t = 0) ∧
      (∀ ρ x t, |ρ| < ρ₀ → 0 < x → 0 < t → t < T - ε →
        feedbackParabolicMargins ρ δ (F ρ) x t) := by
  sorry

/-- Positivity of the quotient; the analytic fitting theorem separately requires integrability. -/
theorem leastSquaresFirstVariation_nonneg
    (C1 vega : ℝ → ℝ)
    (hC1 : ∀ x, 0 < x → 0 ≤ C1 x)
    (hVega : ∀ x, 0 < x → 0 ≤ vega x)
    (hDenom : 0 < ∫ x in Set.Ioi 0, vega x ^ 2) :
    0 ≤ leastSquaresFirstVariation C1 vega := by
  unfold leastSquaresFirstVariation
  apply div_nonneg
  · apply integral_nonneg_of_ae
    filter_upwards [ae_restrict_mem measurableSet_Ioi] with x hx
    exact mul_nonneg (hC1 x hx) (hVega x hx)
  · exact hDenom.le

/-- Smooth strike-density terminal calls have their gamma equal to the density. -/
def strikeSmoothedCallPayoff (ζ : ℝ → ℝ) (x : ℝ) : ℝ :=
  ∫ K in Set.Ioi 0, max (x - K) 0 * ζ K

theorem strikeSmoothedCall_gamma (ζ : ℝ → ℝ) (x : ℝ)
    (hζ : Continuous ζ) (hsupport : HasCompactSupport ζ)
    (hζzero : ∀ K, K ≤ 0 → ζ K = 0) (hx : 0 < x) :
    deriv (fun y => deriv (fun z => strikeSmoothedCallPayoff ζ z) y) x = ζ x := by
  sorry

/-- Log-coordinate feedback factor for finitely many claims. -/
def logFeedbackFactor {ι : Type*} [Fintype ι]
    (q : ι → ℝ) (z : ℝ) (u_z u_zz : ι → ℝ) : ℝ :=
  (1 - ∑ i, q i * Real.exp (-z) * u_z i) ^ 2 /
    (1 - ∑ i, q i * Real.exp (-z) * u_zz i) ^ 2

def logFeedbackResidual {ι : Type*} [Fintype ι]
    (r σ : ℝ) (q : ι → ℝ) (z _t : ℝ)
    (u u_z u_zz u_t : ι → ℝ) : ι → ℝ :=
  fun i => u_t i +
    (σ ^ 2 / 2) * logFeedbackFactor q z u_z u_zz * (u_zz i - u_z i) +
    r * (u_z i - u i)

/-- The log-price first-order coefficient is r - (σ²/2)A. -/
def logFeedbackAdvection (r σ A : ℝ) : ℝ := r - σ ^ 2 * A / 2

/-- Finite differences used by the fully implicit log-grid scheme. -/
def centeredSecondDifference (Δ : ℝ) (u : ℤ → ℝ) (j : ℤ) : ℝ :=
  (u (j + 1) - 2 * u j + u (j - 1)) / Δ ^ 2

def upwindFirstDifference (Δ b : ℝ) (u : ℤ → ℝ) (j : ℤ) : ℝ :=
  if 0 ≤ b then (u (j + 1) - u j) / Δ else (u j - u (j - 1)) / Δ

def centeredFirstDifference (Δ : ℝ) (u : ℤ → ℝ) (j : ℤ) : ℝ :=
  (u (j + 1) - u (j - 1)) / (2 * Δ)

/-- The primary fixed-viscosity generator. The README requires B ≥ |b| and Δ > 0. -/
def stabilizedLogGenerator (Δ a b B r : ℝ) (u : ℤ → ℝ) (j : ℤ) : ℝ :=
  (a + B * Δ / 2) * centeredSecondDifference Δ u j +
    b * centeredFirstDifference Δ u j - r * u j

/-- Calendar time increases from n to n+1 while pricing steps backwards. -/
def implicitBackwardResidual (Δt generator next current : ℝ) : ℝ :=
  (next - current) / Δt + generator

end FinancialMathematics.MarketImpactSuggested
