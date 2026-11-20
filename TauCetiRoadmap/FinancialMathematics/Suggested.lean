import Mathlib
import TauCeti.Analysis.Holder.Iterated
import TauCeti.Analysis.PDE.Parabolic.Holder.Two
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
  Black–Scholes equation where the volatility does not vanish, and, for volatility bounded above
  and away from zero and a bounded market price of risk, a solution continuous up to maturity with
  polynomial growth and finite maximal moments is the replication price of its terminal claim;
* existence and uniqueness of prices for general coefficients in a weighted parabolic Hölder class
  (§3.3), stated below;
* replication of the Black–Scholes call and put by their delta hedges (§4.1);
* uniqueness of the Black–Scholes call and put prices among classical solutions of linear growth
  (§4.2), stated below.

The fourth and the last are statable at the pins, the fourth on Tau Ceti's parabolic Hölder spaces
`TauCeti.ParabolicC2HolderSpace` and `TauCeti.CkHolderSpace`. The first three and the
fifth need the stochastic integral against Brownian motion and the continuous-time self-financing
strategies built on it (StochasticCalculus Layer 3); neither Mathlib nor Tau Ceti has a stochastic
integral at the pins, and Tau Ceti's trading and arbitrage API covers simple strategies only. The
pricing equation needs in addition strong solutions of stochastic differential equations with
Markov coefficients (StochasticCalculus §9.1).
-/

noncomputable section

open Set
open scoped NNReal

namespace TauCetiRoadmap.FinancialMathematics

/-! ## Layer 3: classical price and the self-financing PDE -/

open TauCeti TauCeti.ParabolicSpaceTime in
/-- **Prices for general coefficients in the weighted parabolic Hölder class** (§3.3). Let
`0 < α < 1`, `T > 0` and `δ > 0`. Let the volatility `σ(s, t)` be such that `σ(e^y, t)` is
parabolically `α`-Hölder on the slab `ℝ × [0, T]`, for the parabolic distance
`|y - y'| + √|t - t'|`, with `δ ≤ σ(s, t)² ≤ Λ` for `s > 0` and `0 ≤ t ≤ T`, and let the rate `r`
be `α/2`-Hölder on `[0, T]`. Let `h` be terminal data such that `h(e^y) / (1 + e^y)` is the function
of an element of `C_b^{2+α}(ℝ)`. Then there is exactly one `v` in the parabolic Hölder space
`C_b^{2+α,1+α/2}(ℝ × [0, T])` such that `C(s, t) = (1 + s) v(log s, t)` has terminal value
`C(s, T) = h(s)` for `s > 0` and solves the Black–Scholes equation
`C_t + σ(s, t)² s² / 2 C_ss + r(t) (s C_s - C) = 0` for `s > 0`, `0 < t < T`. The time slices of `v`
are extended to all times by `ParabolicC2HolderSpace.timeExtension`, constant outside `[0, T]`. -/
theorem existsUnique_weighted_price {α : ℝ≥0} (hα0 : 0 < α) (hα1 : α < 1) {T δ Λ : ℝ}
    (hT : 0 < T) (hδ : 0 < δ) (σ : ℝ → ℝ → ℝ) (r : ℝ → ℝ) (h : ℝ → ℝ)
    (hσ : MemHolder α fun p : slab (E := ℝ) 0 T ↦
      σ (Real.exp (space (p : ParabolicSpaceTime ℝ))) (time (p : ParabolicSpaceTime ℝ)))
    (hell : ∀ s ∈ Ioi (0 : ℝ), ∀ t ∈ Icc 0 T, δ ≤ σ s t ^ 2 ∧ σ s t ^ 2 ≤ Λ)
    (hr : ∃ M, HolderOnWith M (α / 2) r (Icc 0 T))
    (hh : ∃ g : CkHolderSpace 2 α ℝ ℝ, ∀ y, g y = h (Real.exp y) / (1 + Real.exp y)) :
    ∃! v : ParabolicC2HolderSpace α ℝ ℝ hT,
      let C : ℝ → ℝ → ℝ := fun s t ↦
        (1 + s) * ParabolicC2HolderSpace.timeExtension hT.le (⇑v) (Real.log s) t
      (∀ s ∈ Ioi (0 : ℝ), C s T = h s) ∧
      ∀ s ∈ Ioi (0 : ℝ), ∀ t ∈ Ioo 0 T,
        deriv (fun u ↦ C s u) t + σ s t ^ 2 * s ^ 2 / 2 * deriv (deriv fun x ↦ C x t) s +
          r t * (s * deriv (fun x ↦ C x t) s - C s t) = 0 := by
  sorry

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
