import Mathlib

/-!
# Market impact: target signatures

The roadmap is README.md; this file is not the roadmap. It states the roadmap's
headline theorems against the pinned APIs, with simple definitions on native carriers.
The headlines are global clearing and profile characterization, strike smoothing,
critical thresholds, nonlinear existence and first variation, noncompact comparison,
call correction and expiry boundary layer, local fitting and the fixed-cutoff limit.

The full finite-claim/taper local existence, uniqueness, smooth dependence and norm
remainder theorem, and its weighted fitting estimates, are not statable at the pins:
the parabolic Hölder Banach spaces and trace operators of PDE F27.1 are missing.
The smooth-terminal scalar existence theorem below is a separately specified headline;
it does not replace that full theorem. The general convex-potential representation and
its identification with the nonlinear derivative also need those weighted solution
spaces and the adapted Itô-integral/SDE solution interfaces of StochasticCalculus.
The observable-state equilibrium equivalence, actual asset-process construction and
PDE-to-admissible-market theorem lack FinancialMathematics' self-financing strategy,
admissible market and replication carriers. No stand-ins for these carriers are used.
-/

noncomputable section
open MeasureTheory
open scoped ContDiff
namespace TauCetiRoadmap.MarketImpact

/-! ## Layer 1: Clearing and feedback pricing -/

/-- Spot-first real price functions; economic domains are explicit theorem hypotheses. -/
abbrev Price := ℝ → ℝ → ℝ

/-- Calendar-time derivative at fixed spot. -/
def timeDeriv (C : Price) (x t : ℝ) : ℝ := deriv (fun s => C x s) t

/-- Spot derivative at fixed calendar time. -/
def priceDeriv (C : Price) (x t : ℝ) : ℝ := deriv (fun y => C y t) x

/-- Second spot derivative at fixed calendar time. -/
def gamma (C : Price) (x t : ℝ) : ℝ := deriv (fun y => priceDeriv C y t) x

/-- The constant-coefficient Black–Scholes backward operator. -/
def blackScholesResidual (r σ : ℝ) (C : Price) (x t : ℝ) : ℝ :=
  timeDeriv C x t + (σ ^ 2 * x ^ 2 / 2) * gamma C x t +
    r * (x * priceDeriv C x t - C x t)

/-- The positive-spot clearing map for a specified program demand. -/
def clearingMap (H : ℝ → ℝ) (x : ℝ) : ℝ := x * (1 - H x)

/-- Positive clearing derivative and endpoint crossing give exactly one positive equilibrium. -/
theorem global_clearing (H : ℝ → ℝ) (δ : ℝ) (hδ : 0 < δ)
    (hH : DifferentiableOn ℝ H (Set.Ioi 0))
    (hmargin : ∀ x, 0 < x → δ ≤ 1 - H x - x * deriv H x)
    (hzero : Filter.Tendsto (clearingMap H) (nhdsWithin 0 (Set.Ioi 0)) (nhds 0))
    (hinfty : Filter.Tendsto (clearingMap H) Filter.atTop Filter.atTop)
    (y : ℝ) (hy : 0 < y) :
    ∃! x, 0 < x ∧ clearingMap H x = y := by
  sorry


/-- Reference demand as a function of positive spot and income. -/
abbrev Demand := ℝ → ℝ → ℝ
/-- A reference-demand profile on the positive invariant coordinate. -/
abbrev Profile := ℝ → ℝ

/-- Feedback volatility for linear reference demand. The positive denominator is a theorem hypothesis. -/
def linearFeedbackVolatility (σ ρ : ℝ) (C : Price) (x t : ℝ) : ℝ :=
  σ * x * (1 - ρ * priceDeriv C x t) /
    (1 - ρ * priceDeriv C x t - ρ * x * gamma C x t)

/-- The calendar-time pricing residual with endogenous feedback volatility. -/
def linearFeedbackResidual (r σ ρ : ℝ) (C : Price) (x t : ℝ) : ℝ :=
  timeDeriv C x t +
    (linearFeedbackVolatility σ ρ C x t) ^ 2 / 2 * gamma C x t +
    r * (x * priceDeriv C x t - C x t)

/-- Reference demand constant along the scaling orbits of the income/spot ratio. -/
def classicalConsistentDemand (γ : ℝ) (U : Profile) (x y : ℝ) : ℝ :=
  U (y ^ γ / x)

/-- The full positive-quadrant differential consistency relation. -/
def demandRatioCondition (γ : ℝ) (D : Demand) : Prop :=
  ∀ x y, 0 < x → 0 < y →
    deriv (fun z => D x z) y / deriv (fun z => D z y) x = -γ * x / y

/-- Positive numerator, clearing derivative and scalar parabolic derivative margins. -/
def feedbackParabolicMargins (ρ δ : ℝ) (C : Price) (x t : ℝ) : Prop :=
  0 < δ ∧ 0 < x ∧
    δ ≤ 1 - ρ * priceDeriv C x t ∧
    δ ≤ 1 - ρ * priceDeriv C x t - ρ * x * gamma C x t ∧
    δ ≤ 1 - ρ * priceDeriv C x t + ρ * x * gamma C x t

/-- The open parameter, spot and calendar-time domain before the cutoff. -/
def parameterCylinder (ρ₀ T ε : ℝ) : Set (ℝ × ℝ × ℝ) :=
  {p | |p.1| < ρ₀ ∧ 0 < p.2.1 ∧ 0 < p.2.2 ∧ p.2.2 < T - ε}

/-- The bond price of a terminal constant cash payment. -/
def discountedCash (k r τ t : ℝ) : ℝ := k * Real.exp (-r * (τ - t))

/-- Subtract the prescribed bond-price trace before dividing by spot. Bounded first
and second log derivatives express delta and spot-times-gamma. -/
def normalizedLogPrice (k r τ : ℝ) (C : Price) (z t : ℝ) : ℝ :=
  (C (Real.exp z) t - discountedCash k r τ t) / Real.exp z

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

/-- An increasing differentiable profile induces the full-quadrant consistency relation. -/
theorem profile_implies_ratio_condition
    (γ : ℝ) (hγ : 0 < γ) (U : Profile)
    (hU : ContDiffOn ℝ 1 U (Set.Ioi 0))
    (hU' : ∀ z, 0 < z → 0 < deriv U z) :
    demandRatioCondition γ (classicalConsistentDemand γ U) := by
  sorry

/-! ## Layer 2: Smooth strike mixtures -/

/-- Smooth strike-density terminal calls have their gamma equal to the density. -/
def strikeSmoothedCallPayoff (ζ : ℝ → ℝ) (x : ℝ) : ℝ :=
  ∫ K in Set.Ioi 0, max (x - K) 0 * ζ K

/-- A continuous compactly supported strike density is the gamma of its call mixture. -/
theorem strikeSmoothedCall_gamma (ζ : ℝ → ℝ) (x : ℝ)
    (hζ : Continuous ζ) (hsupport : HasCompactSupport ζ)
    (hζzero : ∀ K, K ≤ 0 → ζ K = 0) (hx : 0 < x) :
    deriv (fun y => deriv (fun z => strikeSmoothedCallPayoff ζ z) y) x = ζ x := by
  sorry


/-! ## Layer 3: Nonlinear prices and first variations -/

/-- Differentiating an actual smooth feedback family at zero gives the negative gamma-square source. -/
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
The smooth-terminal specialization of the full Hölder-space existence target in README §3.2.
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


/-- The call's maximum delta plus spot-times-gamma at total volatility s. -/
def callThresholdFunction (s : ℝ) : ℝ :=
  ProbabilityTheory.cdf (ProbabilityTheory.gaussianReal 0 1) s +
    ProbabilityTheory.gaussianPDFReal 0 1 s / s

/-- A positive critical total volatility exists exactly for feedback strictly between zero and one. -/
theorem call_critical_threshold (ρ : ℝ) (hρ : 0 < ρ ∧ ρ < 1) :
    ∃! s, 0 < s ∧ callThresholdFunction s = 1 / ρ := by
  sorry

/-- The put threshold subtracts the constant one and has a positive root for every positive feedback. -/
theorem put_critical_threshold (ρ : ℝ) (hρ : 0 < ρ) :
    ∃! s, 0 < s ∧ callThresholdFunction s - 1 = 1 / ρ := by
  sorry

/-- The denominator has the stated minimum, uniquely located only for positive feedback. -/
theorem call_denominator_minimum (ρ s : ℝ) (hρ : 0 ≤ ρ) (hs : 0 < s) :
    ∀ d : ℝ,
      1 - ρ * callThresholdFunction s ≤
        1 - ρ * (ProbabilityTheory.cdf (ProbabilityTheory.gaussianReal 0 1) d +
          ProbabilityTheory.gaussianPDFReal 0 1 d / s) ∧
      (0 < ρ →
        (1 - ρ * callThresholdFunction s =
          1 - ρ * (ProbabilityTheory.cdf (ProbabilityTheory.gaussianReal 0 1) d +
            ProbabilityTheory.gaussianPDFReal 0 1 d / s) ↔ d = s)) := by
  sorry

/-- The sharp sign criterion compares remaining time with the square of the critical root. -/
theorem call_threshold_sign (ρ σ s τ : ℝ) (hρ : 0 < ρ ∧ ρ < 1)
    (hσ : 0 < σ) (hs : 0 < s) (hroot : callThresholdFunction s = 1 / ρ)
    (hτ : 0 < τ) :
    (0 < 1 - ρ * callThresholdFunction (σ * Real.sqrt τ) ↔ s ^ 2 / σ ^ 2 < τ) ∧
    (1 - ρ * callThresholdFunction (σ * Real.sqrt τ) = 0 ↔ τ = s ^ 2 / σ ^ 2) ∧
    (1 - ρ * callThresholdFunction (σ * Real.sqrt τ) < 0 ↔ τ < s ^ 2 / σ ^ 2) := by
  sorry

/-- The positive critical root is asymptotic to rho divided by the square root of two pi. -/
theorem call_threshold_asymptotic (s : ℝ → ℝ)
    (hs : ∀ ρ, 0 < ρ → ρ < 1 → 0 < s ρ ∧ callThresholdFunction (s ρ) = 1 / ρ) :
    Filter.Tendsto (fun ρ => s ρ / ρ) (nhdsWithin 0 (Set.Ioi 0))
      (nhds (1 / Real.sqrt (2 * Real.pi))) := by
  sorry

/-- Comparison for classical prices with uniform two-ended polynomial growth. -/
theorem noncompact_comparison (σ β c T p A : ℝ) (u : Price)
    (hσ : 0 < σ) (hT : 0 < T) (hp : 0 ≤ p) (hA : 0 ≤ A)
    (hc : ContinuousOn (Function.uncurry u) (Set.Ioi 0 ×ˢ Set.Icc 0 T))
    (hd : ∀ x t, 0 < x → t ∈ Set.Ioo 0 T →
      DifferentiableAt ℝ (fun y => u y t) x ∧
      DifferentiableAt ℝ (fun y => priceDeriv u y t) x ∧
      DifferentiableAt ℝ (fun s => u x s) t)
    (hg : ∀ x t, 0 < x → t ∈ Set.Icc 0 T → |u x t| ≤ A * (x ^ p + x ^ (-p)))
    (hterm : ∀ x, 0 < x → 0 ≤ u x T)
    (hPDE : ∀ x t, 0 < x → t ∈ Set.Ioo 0 T →
      timeDeriv u x t + σ ^ 2 * x ^ 2 / 2 * gamma u x t +
        β * x * priceDeriv u x t + c * u x t ≤ 0) :
    ∀ x t, 0 < x → t ∈ Set.Icc 0 T → 0 ≤ u x t := by
  sorry

/-- The finite-claim pricing residual, including all cross-claim gamma contributions. -/
def finiteFeedbackResidual {ι : Type*} [Fintype ι]
    (r σ ρ : ℝ) (w : ι → ℝ → ℝ) (C : ι → Price) (i : ι) (x t : ℝ) : ℝ :=
  let H := ρ * ∑ j, w j t * priceDeriv (C j) x t
  let Hx := ρ * ∑ j, w j t * gamma (C j) x t
  timeDeriv (C i) x t + (σ * x * (1 - H) / (1 - H - x * Hx)) ^ 2 / 2 *
    gamma (C i) x t + r * (x * priceDeriv (C i) x t - C i x t)

/-- Differentiation of the coupled system retains the full weighted gamma sum. -/
theorem finite_feedback_first_variation {ι : Type*} [Fintype ι]
    (r σ ρ₀ T ε : ℝ) (w : ι → ℝ → ℝ) (F : ℝ → ι → Price)
    (hρ₀ : 0 < ρ₀) (hε : 0 < ε ∧ ε < T)
    (hSmooth : ∀ i, ContDiffOn ℝ 3
      (fun p : ℝ × ℝ × ℝ => F p.1 i p.2.1 p.2.2) (parameterCylinder ρ₀ T ε))
    (hPDE : ∀ ρ i x t, |ρ| < ρ₀ → 0 < x → 0 < t → t < T - ε →
      finiteFeedbackResidual r σ ρ w (F ρ) i x t = 0) :
    ∀ i x t, 0 < x → 0 < t → t < T - ε →
      blackScholesResidual r σ (fun x t => deriv (fun q => F q i x t) 0) x t =
        -σ ^ 2 * x ^ 3 * gamma (F 0 i) x t *
          ∑ j, w j t * gamma (F 0 j) x t := by
  sorry

/-- The call's standard Gaussian coordinate at positive remaining maturity. -/
def callD1 (K r σ τ x : ℝ) : ℝ :=
  (Real.log (x / K) + (r + σ ^ 2 / 2) * τ) / (σ * Real.sqrt τ)

/-- The Black–Scholes call formula used as the baseline of the feedback fit. -/
def callPrice (K r σ τ x : ℝ) : ℝ :=
  x * ProbabilityTheory.cdf (ProbabilityTheory.gaussianReal 0 1) (callD1 K r σ τ x) -
    K * Real.exp (-r * τ) * ProbabilityTheory.cdf (ProbabilityTheory.gaussianReal 0 1)
      (callD1 K r σ τ x - σ * Real.sqrt τ)

/-- Call vega on the positive parameter domain. -/
def callVega (K r σ τ x : ℝ) : ℝ :=
  x * Real.sqrt τ * ProbabilityTheory.gaussianPDFReal 0 1 (callD1 K r σ τ x)

/-- Call gamma on the positive parameter domain. -/
def callGamma (K r σ τ x : ℝ) : ℝ :=
  ProbabilityTheory.gaussianPDFReal 0 1 (callD1 K r σ τ x) / (x * σ * Real.sqrt τ)

/-- The evaluated heat convolution for the first call correction, with cutoff epsilon.
The formula is used only for K, sigma, x positive and remaining maturity at least epsilon. -/
def callCorrection (K r σ ε τ x : ℝ) : ℝ :=
  let y := Real.log (x / K)
  let u := σ ^ 2 * τ / 2
  let k := 2 * r / σ ^ 2
  K * Real.exp (-(k - 1) * y / 2 - (k + 1) ^ 2 * u / 4) *
    ∫ v in (Real.sqrt (ε / (2 * τ)))..(1 / Real.sqrt 2),
      Real.exp (-(y + (k + 1) * u * v ^ 2) ^ 2 / (4 * u * (1 - v ^ 2)) -
        (k + 1) ^ 2 * u * v ^ 2 / 4) / (Real.pi * Real.sqrt (1 - v ^ 2))

/-- The explicit correction solves the gamma-square equation and has zero cutoff trace. -/
theorem call_correction_equation (K r σ ε T : ℝ)
    (hK : 0 < K) (hσ : 0 < σ) (hε : 0 < ε ∧ ε < T) :
    (∀ x t, 0 < x → t < T - ε →
      blackScholesResidual r σ (fun x t => callCorrection K r σ ε (T - t) x) x t =
        -σ ^ 2 * x ^ 3 * (callGamma K r σ (T - t) x) ^ 2) ∧
    (∀ x, 0 < x → callCorrection K r σ ε ε x = 0) := by
  sorry

/-- At unsmoothed expiry the first correction has a strike boundary layer of height K/4. -/
theorem call_correction_expiry (K r σ x : ℝ) (hK : 0 < K) (hσ : 0 < σ) (hx : 0 < x) :
    Filter.Tendsto (fun τ => callCorrection K r σ 0 τ x)
      (nhdsWithin 0 (Set.Ioi 0)) (nhds (if x = K then K / 4 else 0)) := by
  sorry

/-! ## Layer 4: Least-squares fitting and the cutoff limit -/

/-- The first-order least-squares adjustment, when the two integrals exist and the denominator is positive. -/
def leastSquaresFirstVariation (C1 vega : ℝ → ℝ) : ℝ :=
  (∫ x in Set.Ioi 0, C1 x * vega x) /
    (∫ x in Set.Ioi 0, vega x ^ 2)

/-- The spot-integrated squared distance to a Black–Scholes call of trial volatility s. -/
def callFitObjective (K r τ : ℝ) (C : ℝ → ℝ) (s : ℝ) : ℝ :=
  ∫ x in Set.Ioi 0, (C x - callPrice K r s τ x) ^ 2

/-- A smooth decaying feedback price family has a unique nearby least-squares minimizer.
The uniform bounds on its first two parameter derivatives supply differentiation under
the integral. The PDE hypothesis ties the family to the endogenous pricing model. -/
theorem local_call_fit (K r σ ρ₀ T ε t : ℝ) (F : ℝ → Price)
    (hK : 0 < K) (hσ : 0 < σ) (hρ₀ : 0 < ρ₀) (hε : 0 < ε ∧ ε < T)
    (ht : 0 < t ∧ t < T - ε)
    (hSmooth : ContDiffOn ℝ 3
      (fun p : ℝ × ℝ × ℝ => F p.1 p.2.1 p.2.2) (parameterCylinder ρ₀ T ε))
    (hPDE : ∀ ρ x u, |ρ| < ρ₀ → 0 < x → 0 < u → u < T - ε →
      linearFeedbackResidual r σ ρ (F ρ) x u = 0)
    (hbase : ∀ x, 0 < x → F 0 x t = callPrice K r σ (T - t) x)
    (hdecay : ∃ A > 0, ∀ n : ℕ, n ≤ 2 → ∀ ρ x, |ρ| < ρ₀ → 0 < x →
      |iteratedDeriv n (fun q => F q x t - callPrice K r σ (T - t) x) ρ| ≤
        A * min (x ^ 4) (x ^ (-2 : ℤ))) :
    ∃ a > 0, ∃ b > 0, ∃ fit : ℝ → ℝ,
      a < ρ₀ ∧ b < σ ∧ fit 0 = σ ∧ ContDiffOn ℝ 2 fit (Set.Ioo (-a) a) ∧
      (∀ ρ, |ρ| < a → |fit ρ - σ| < b ∧
        ∀ s, |s - σ| < b → s ≠ fit ρ →
          callFitObjective K r (T - t) (fun x => F ρ x t) (fit ρ) <
            callFitObjective K r (T - t) (fun x => F ρ x t) s) ∧
      (∃ M > 0, ∀ ρ, |ρ| < a → |fit ρ - σ - ρ * deriv fit 0| ≤ M * ρ ^ 2) ∧
      deriv fit 0 = leastSquaresFirstVariation (fun x => deriv (fun ρ => F ρ x t) 0)
        (callVega K r σ (T - t)) := by
  sorry

/-- The fitted first-order volatility adjustment for the explicit cutoff call correction. -/
def callFitVariation (K r σ ε τ : ℝ) : ℝ :=
  leastSquaresFirstVariation (callCorrection K r σ ε τ) (callVega K r σ τ)

/-- At fixed positive cutoff the fitted first variation vanishes linearly, with positive slope. -/
theorem call_fit_cutoff_limit (K r σ ε : ℝ) (hK : 0 < K) (hσ : 0 < σ) (hε : 0 < ε) :
    let slope := (∫ x in Set.Ioi 0,
      σ ^ 2 * x ^ 3 * (callGamma K r σ ε x) ^ 2 * callVega K r σ ε x) /
      (∫ x in Set.Ioi 0, (callVega K r σ ε x) ^ 2)
    0 < slope ∧ Filter.Tendsto (fun τ => callFitVariation K r σ ε τ / (τ - ε))
      (nhdsWithin ε (Set.Ioi ε)) (nhds slope) := by
  sorry

end TauCetiRoadmap.MarketImpact
