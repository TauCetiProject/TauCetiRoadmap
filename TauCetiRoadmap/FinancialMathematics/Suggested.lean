import Mathlib
import TauCeti.Probability.Finance.BlackScholes.Extension

/-!
# One-factor markets and replication: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti APIs.

The headline theorems are:

* completeness and pricing (§2.2, §2.4): in the one-factor Brownian market, every claim whose
  discounted value is square integrable under the risk-neutral measure is the terminal wealth of an
  admissible self-financing strategy, whose wealth is the discounted conditional expectation of the
  claim, for constant coefficients and for bounded progressive coefficients;
* absence of arbitrage among admissible strategies (§2.3);
* the pricing equation (§3.1, §3.2): a replicating price of class `C^{2,1}` solves the
  Black–Scholes equation where the volatility does not vanish, and a solution with polynomial
  growth and finite maximal moments is the replication price of its terminal claim;
* existence and uniqueness of prices for general coefficients in a weighted parabolic Hölder class
  (§3.3);
* replication of the Black–Scholes call and put by their delta hedges (§4.1);
* uniqueness of the Black–Scholes call and put prices among classical solutions of linear growth
  (§4.2), stated below.

Only the last is statable at the pins. The first four and the fifth need the stochastic integral
against Brownian motion and the continuous-time self-financing strategies built on it
(StochasticCalculus Layer 3); neither Mathlib nor Tau Ceti has a stochastic integral at the pins,
and Tau Ceti's trading and arbitrage API covers simple strategies only. The pricing equation
needs in addition strong solutions of stochastic differential equations with Markov coefficients
(StochasticCalculus §9.1). The existence theorem of §3.3 needs the parabolic Hölder spaces of
PDE §6.4, which are not at the pins either.
-/

noncomputable section

open Set

namespace TauCetiRoadmap.FinancialMathematics

/-! ## Layer 4: Black–Scholes calls and puts -/

/-- **Uniqueness of the Black–Scholes call price** (§4.2). Let `σ > 0`, `K > 0`, `T > 0` and
`r ∈ ℝ`. Let `V(s, t)` be continuous on the closed domain `s ≥ 0`, `0 ≤ t ≤ T`, of class `C^{2,1}`
on the open domain `s > 0`, `0 < t < T` (twice continuously differentiable in the spot,
differentiable in time, with `∂V/∂t`, `∂V/∂s` and `∂²V/∂s²` jointly continuous there), a solution
of the Black–Scholes equation `V_t + σ² s² / 2 V_ss + r (s V_s - V) = 0` on the open domain, with
`|V(s, t)| ≤ A (1 + s)` on the closed domain and terminal value `V(s, T) = (s - K)⁺`. Then `V` is
the Black–Scholes call price `C(s, t) = callValue s r σ K (T - t)` on the closed domain. -/
theorem eq_callValue_of_pde {r σ K T A : ℝ} (hσ : 0 < σ) (hK : 0 < K) (hT : 0 < T)
    (V : ℝ → ℝ → ℝ)
    (hcont : ContinuousOn (fun p : ℝ × ℝ => V p.1 p.2) (Ici 0 ×ˢ Icc 0 T))
    (hspot : ∀ t ∈ Ioo 0 T, ContDiffOn ℝ 2 (fun x => V x t) (Ioi 0))
    (htime : ∀ s ∈ Ioi (0 : ℝ), DifferentiableOn ℝ (fun u => V s u) (Ioo 0 T))
    (hcont_t : ContinuousOn (fun p : ℝ × ℝ => deriv (fun u => V p.1 u) p.2)
      (Ioi 0 ×ˢ Ioo 0 T))
    (hcont_s : ContinuousOn (fun p : ℝ × ℝ => deriv (fun x => V x p.2) p.1)
      (Ioi 0 ×ˢ Ioo 0 T))
    (hcont_ss : ContinuousOn (fun p : ℝ × ℝ => deriv (deriv fun x => V x p.2) p.1)
      (Ioi 0 ×ˢ Ioo 0 T))
    (hpde : ∀ s ∈ Ioi (0 : ℝ), ∀ t ∈ Ioo 0 T,
      deriv (fun u => V s u) t + σ ^ 2 * s ^ 2 / 2 * deriv (deriv fun x => V x t) s +
        r * (s * deriv (fun x => V x t) s - V s t) = 0)
    (hgrowth : ∀ s ∈ Ici (0 : ℝ), ∀ t ∈ Icc 0 T, |V s t| ≤ A * (1 + s))
    (hterm : ∀ s ∈ Ici (0 : ℝ), V s T = (s - K)⁺) :
    ∀ s ∈ Ici (0 : ℝ), ∀ t ∈ Icc 0 T, V s t = TauCeti.BlackScholes.callValue s r σ K (T - t) := by
  sorry

/-- **Uniqueness of the Black–Scholes put price** (§4.2). Under the hypotheses of
`eq_callValue_of_pde`, with terminal value `V(s, T) = (K - s)⁺`, `V` is the Black–Scholes put
price `P(s, t) = putValue s r σ K (T - t)` on the closed domain `s ≥ 0`, `0 ≤ t ≤ T`. -/
theorem eq_putValue_of_pde {r σ K T A : ℝ} (hσ : 0 < σ) (hK : 0 < K) (hT : 0 < T)
    (V : ℝ → ℝ → ℝ)
    (hcont : ContinuousOn (fun p : ℝ × ℝ => V p.1 p.2) (Ici 0 ×ˢ Icc 0 T))
    (hspot : ∀ t ∈ Ioo 0 T, ContDiffOn ℝ 2 (fun x => V x t) (Ioi 0))
    (htime : ∀ s ∈ Ioi (0 : ℝ), DifferentiableOn ℝ (fun u => V s u) (Ioo 0 T))
    (hcont_t : ContinuousOn (fun p : ℝ × ℝ => deriv (fun u => V p.1 u) p.2)
      (Ioi 0 ×ˢ Ioo 0 T))
    (hcont_s : ContinuousOn (fun p : ℝ × ℝ => deriv (fun x => V x p.2) p.1)
      (Ioi 0 ×ˢ Ioo 0 T))
    (hcont_ss : ContinuousOn (fun p : ℝ × ℝ => deriv (deriv fun x => V x p.2) p.1)
      (Ioi 0 ×ˢ Ioo 0 T))
    (hpde : ∀ s ∈ Ioi (0 : ℝ), ∀ t ∈ Ioo 0 T,
      deriv (fun u => V s u) t + σ ^ 2 * s ^ 2 / 2 * deriv (deriv fun x => V x t) s +
        r * (s * deriv (fun x => V x t) s - V s t) = 0)
    (hgrowth : ∀ s ∈ Ici (0 : ℝ), ∀ t ∈ Icc 0 T, |V s t| ≤ A * (1 + s))
    (hterm : ∀ s ∈ Ici (0 : ℝ), V s T = (K - s)⁺) :
    ∀ s ∈ Ici (0 : ℝ), ∀ t ∈ Icc 0 T, V s t = TauCeti.BlackScholes.putValue s r σ K (T - t) := by
  sorry

end TauCetiRoadmap.FinancialMathematics
