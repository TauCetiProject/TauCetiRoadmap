import Mathlib
import TauCeti.Probability.Finance.BlackScholes.Basic

/-!
# From the binomial tree to Black–Scholes: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the
definitions their statements need, each with a real body.

Every headline of the README is statable at the pins and is stated here: the expansion of the
risk-neutral probability of the Cox–Ross–Rubinstein tree with `N` steps to third order in
`√(T/N)`, the convergence in law of the log-return of the tree under its risk-neutral measure to
the Gaussian law with mean `(r − σ²/2) T` and variance `σ² T`, the convergence of the tree price of
every payoff continuous and bounded on the positive half-line to its Black–Scholes price, and the
convergence of the tree price of the call to Tau Ceti's closed-form Black–Scholes call price.

The tree's price process and its product measure are copied verbatim from DiscreteTimeFinance 4.1
(`crrPrice`, `crrMeasure`), because a roadmap module cannot be imported. The Black–Scholes side
is Tau Ceti's `TauCeti.BlackScholes.riskNeutralPrice` and `TauCeti.BlackScholes.callPrice`.
-/

open MeasureTheory ProbabilityTheory Finset Filter Topology
open scoped BoundedContinuousFunction

namespace TauCetiRoadmap.BinomialToBlackScholes

/-! ## Definitions copied from DiscreteTimeFinance -/

section CopiedFromDiscreteTimeFinance

/-- 1.1 (copied verbatim from DiscreteTimeFinance 4.1) The discounted price
`S₀ ∏_{k < t} (1 + R k)` of the single asset, with discounted return `R k = b` on an up move and
`a` on a down move. -/
def crrPrice (T : ℕ) (S₀ a b : ℝ) (t : ℕ) (ω : Fin T → Bool) : Fin 1 → ℝ :=
  fun _ => S₀ * ∏ k ∈ univ.filter (fun k : Fin T => (k : ℕ) < t),
    (if ω k then 1 + b else 1 + a)

/-- 1.1 (copied verbatim from DiscreteTimeFinance 4.1) The product measure on the paths with
up-probability `q`. -/
noncomputable def crrMeasure (T : ℕ) (q : ℝ) : Measure (Fin T → Bool) :=
  ∑ ω, ENNReal.ofReal (∏ k, if ω k then q else 1 - q) • Measure.dirac ω

end CopiedFromDiscreteTimeFinance

/-! ## Layer 1: the tree with `N` steps and its risk-neutral probability -/

/-- 1.1 The discounted return of a down move in the tree with `N` steps over `[0, T]`:
`d / e^{rT/N} − 1` with `d = e^{−σ√(T/N)}`. -/
noncomputable def crrDownReturn (r σ T : ℝ) (N : ℕ) : ℝ :=
  Real.exp (-(σ * Real.sqrt (T / N)) - r * T / N) - 1

/-- 1.1 The discounted return of an up move in the tree with `N` steps over `[0, T]`:
`u / e^{rT/N} − 1` with `u = e^{σ√(T/N)}`. -/
noncomputable def crrUpReturn (r σ T : ℝ) (N : ℕ) : ℝ :=
  Real.exp (σ * Real.sqrt (T / N) - r * T / N) - 1

/-- 1.1 The risk-neutral up-probability `−a / (b − a)` of the tree with `N` steps, with `a` and
`b` the down and up returns. -/
noncomputable def crrRiskNeutralProb (r σ T : ℝ) (N : ℕ) : ℝ :=
  -crrDownReturn r σ T N / (crrUpReturn r σ T N - crrDownReturn r σ T N)

/-- 1.1 The log-return `log (S_N / S_0)` of the undiscounted price over `[0, T]` in the tree with
`N` steps, as a function of the path: the tree is started at `1` and the discounted terminal price
is multiplied by the bank account `e^{rT}`. -/
noncomputable def crrLogReturn (r σ T : ℝ) (N : ℕ) (ω : Fin N → Bool) : ℝ :=
  Real.log (Real.exp (r * T) *
    crrPrice N 1 (crrDownReturn r σ T N) (crrUpReturn r σ T N) N ω 0)

/-- 1.1 The tree price at time `0` of the European claim paying `h (S_N)` at `T`, from the spot
`s`: the mean of the discounted payoff `e^{−rT} h (S_N)` under the product measure with the
risk-neutral up-probability. -/
noncomputable def crrEuropeanPrice (h : ℝ → ℝ) (s r σ T : ℝ) (N : ℕ) : ℝ :=
  Real.exp (-r * T) * ∫ ω, h (Real.exp (r * T) *
    crrPrice N s (crrDownReturn r σ T N) (crrUpReturn r σ T N) N ω 0)
      ∂crrMeasure N (crrRiskNeutralProb r σ T N)

/-- 1.2 The risk-neutral probability of the tree with `N` steps is
`1/2 + ((r − σ²/2)/(2σ)) √(T/N) + c √(T/N)³ + o(N^{−3/2})` with
`c = (12 r² − 4 r σ² + σ⁴)/(48 σ)`. -/
theorem tendsto_crrRiskNeutralProb {r σ T : ℝ} (hσ : 0 < σ) (hT : 0 < T) :
    Tendsto (fun N : ℕ => (N : ℝ) * Real.sqrt N *
        (crrRiskNeutralProb r σ T N - 1 / 2 - (r - σ ^ 2 / 2) / (2 * σ) * Real.sqrt (T / N)))
      atTop (𝓝 ((12 * r ^ 2 - 4 * r * σ ^ 2 + σ ^ 4) / (48 * σ) * (T * Real.sqrt T))) := by
  sorry

/-! ## Layer 2: the log-return in law -/

/-- 2.1 Under the risk-neutral measure of the tree with `N` steps, the log-return `log (S_N / S_0)`
converges in law to the Gaussian law with mean `(r − σ²/2) T` and variance `σ² T`: the means of
every bounded continuous function converge. -/
theorem tendsto_integral_crrLogReturn {r σ T : ℝ} (hσ : 0 < σ) (hT : 0 ≤ T) (f : ℝ →ᵇ ℝ) :
    Tendsto (fun N : ℕ => ∫ ω, f (crrLogReturn r σ T N ω)
        ∂crrMeasure N (crrRiskNeutralProb r σ T N))
      atTop (𝓝 (∫ x, f x ∂gaussianReal ((r - σ ^ 2 / 2) * T) (σ ^ 2 * T).toNNReal)) := by
  sorry

/-! ## Layer 3: prices -/

/-- 3.1 For a payoff `h` continuous and bounded on `(0, ∞)`, the tree prices of `h (S_N)` converge
to the Black–Scholes price `e^{−rT} E[h (S_T)]` with `S_T = s e^{(r − σ²/2) T + σ √T Z}`,
`Z ∼ N(0, 1)`. -/
theorem tendsto_crrEuropeanPrice {h : ℝ → ℝ} (hh : ContinuousOn h (Set.Ioi 0))
    (hbdd : ∃ C, ∀ x, 0 < x → |h x| ≤ C) {s r σ T : ℝ} (hs : 0 < s) (hσ : 0 < σ)
    (hT : 0 ≤ T) :
    Tendsto (crrEuropeanPrice h s r σ T) atTop
      (𝓝 (TauCeti.BlackScholes.riskNeutralPrice h s r σ T)) := by
  sorry

/-- 3.2 The tree prices of the call `(S_N − K)⁺` converge to the Black–Scholes call price
`s Φ(d₊) − K e^{−rT} Φ(d₋)`. -/
theorem tendsto_crrEuropeanPrice_call {s r σ K T : ℝ} (hs : 0 < s) (hσ : 0 < σ) (hK : 0 < K)
    (hT : 0 < T) :
    Tendsto (crrEuropeanPrice (fun x => (x - K)⁺) s r σ T) atTop
      (𝓝 (TauCeti.BlackScholes.callPrice s r σ K T)) := by
  sorry

end TauCetiRoadmap.BinomialToBlackScholes
