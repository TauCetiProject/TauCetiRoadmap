# Roadmap: one-factor markets, replication and the Black–Scholes theorem

**Summary.** This roadmap builds the continuous-time theory of a market with one risky asset and
one riskless bond, driven by a single Brownian motion W on a horizon [0, T]. The bond is worth
β_t = β₀ exp(∫₀ᵗ r_u du) for a deterministic short rate r; the asset solves
dS_t = μ_t S_t dt + σ_t S_t dW_t from a positive initial value. A strategy holds a_t shares of the
asset and b_t bonds, chosen predictably, and is self-financing when its wealth V_t = a_t S_t + b_t β_t
changes only through the gains ∫a dS + ∫b dβ.

The headline theorems are these. First, completeness and pricing: let r, μ and σ ≠ 0 be constants,
the filtration the augmented natural filtration of W, κ = (μ − r)/σ, and Q the measure with density
exp(−κW_T − κ²T/2). Every claim H measurable at time T with e^(−rT)H square integrable under Q is
the terminal wealth of an admissible strategy, a self-financing one whose discounted wealth is a
square-integrable Q-martingale; every such strategy has wealth V_t = e^(rt) E_Q[e^(−rT)H | F_t],
and no admissible strategy is an arbitrage. The same holds for progressive coefficients with |σ_t|
bounded above and away from zero and κ_t bounded. Second, the pricing equation: for coefficients
depending on spot and time, a price C(s, t) of class C^(2,1) that is the wealth of a self-financing
strategy from every starting point solves C_t + ½σ(s,t)²s²C_ss + r(sC_s − C) = 0 wherever
σ(s, t) ≠ 0, the strategy holding ∂C/∂s shares; conversely, when |σ| is bounded above and away
from zero and the market price of risk (μ − r)/σ is bounded, a solution continuous up to maturity
with |C| + |s ∂C/∂s| ≤ A(1 + sᵖ) and terminal value h is the replication price of h(S_T) when the
asset has finite maximal Q-moments of order 2p. Third, for constant r, σ > 0 and a strike K > 0,
the call price s Φ(d₊) − K e^(−r(T−t)) Φ(d₋) is replicated by holding Φ(d₊) shares, and it is the
only solution of the Black–Scholes equation on s > 0, 0 < t < T, twice continuously differentiable
in s and differentiable in t there, continuous on s ≥ 0, 0 ≤ t ≤ T, bounded by A(1 + s), with
terminal value (s − K)⁺; likewise for the put.

StochasticCalculus supplies the stochastic integral, Itô's formula, the asset's linear equation,
Brownian martingale representation and Girsanov's theorem; PDE supplies the Schauder theory behind
prices for general coefficients. The Tau Ceti library has the bond, geometric Brownian motion, the
constant-coefficient change of measure, simple strategies and their arbitrage theory, and the
Black–Scholes closed forms with their Greeks and limits. The sub-roadmap MarketImpact builds
feedback pricing on this foundation.

The build has four milestones, M0.1–M0.4, the labels by which MarketImpact and StochasticCalculus
cite it; subsection k.n below belongs to milestone M0.k. M0.1 sets up the bond, the asset and
self-financing strategies. M0.2 constructs the risk-neutral measure and proves representation under
it, completeness, pricing, absence of arbitrage and the static-claim argument, for constant and
then progressive coefficients. M0.3 derives the pricing equation, gives a sufficient admissibility
criterion, and proves existence of prices for general coefficients and identifies them with the
replication price. M0.4 states the Black–Scholes closed forms and their analytic theory (the
equation, parity, the risk-neutral expectation, boundary and far-field values, the Greeks and their
limits at maturity) and proves replication and uniqueness for the call and put.

## Conventions

1. **Time and spot.** Calendar time is t ∈ [0, T] with T > 0; processes are indexed by `ℝ≥0`, as
   Mathlib's Brownian motion is. Spot is s > 0. A price is a function C(s, t), spot first and
   calendar time second. The remaining maturity is τ = T − t, and f(s, τ) = C(s, T − τ). Tau Ceti's
   closed forms take the remaining maturity as their last argument: the calendar-time Black–Scholes
   call is `TauCeti.BlackScholes.callValue s r σ K (T - t)`, and likewise the put.
2. **Coefficients.** The asset drift is μ (written μ_S where other drifts are present), the
   volatility σ, the short rate r. The market price of risk is κ = (μ − r)/σ; it is not a holding.
   MarketImpact's income drift μ_Y, and its source notation μ₁ for a model-specific instance of it,
   are not used here.
3. **Holdings and wealth.** A strategy's holdings (a, b) are numbers of shares of the asset and of
   the bond: a < 0 is a short position in the asset and b < 0 is borrowing. The bond price is β, and
   bβ is the bond part of the wealth V = aS + bβ. The bond is Tau Ceti's
   `TauCeti.Finance.bondPrice r β₀`, with β₀ > 0. There are no trading costs and no dividends.
4. **Filtration and Brownian motion.** The probability space carries a filtration F = (F_t)
   satisfying the usual conditions, and W is a Brownian motion relative to F: W is adapted, has
   continuous paths and starts at 0, and each increment W_t − W_u (u ≤ t) is Gaussian with variance
   t − u and independent of F_u. This is Tau Ceti's `TauCeti.Probability.IsFilteredPreBrownianReal`
   together with continuity of paths. Independence of the increments from F_u is part of the
   hypothesis: a predicate on the laws of W alone, such as Mathlib's
   `ProbabilityTheory.IsPreBrownianReal`, does not supply it. The augmented natural filtration of W
   is the right-continuous regularization of its null augmentation,
   `((Filtration.natural W hW).nullAugment P).rightCont`.
5. **Equivalent measures.** Q is equivalent to P when the two have the same null sets. Equivalent
   measures have the same completed null sets on the finite horizon, so the augmented filtration and
   every almost-sure statement are the same under P and Q.
6. **Stochastic integrals and versions.** Stochastic integrals are those of StochasticCalculus
   Layer 3, for predictable integrands, taken in their continuous versions. An identity between
   processes that holds "simultaneously in t" holds up to indistinguishability: for all t outside
   one null set. Versions, indistinguishability and progressive measurability are those of
   StochasticCalculus §0.2.
7. **Gaussian functions.** φ is the standard Gaussian density `gaussianPDFReal 0 1` and Φ its
   distribution function `cdf (gaussianReal 0 1)`. For s > 0 and τ > 0,
   `d₊ = (log(s/K) + (r + σ²/2)τ)/(σ√τ)` and `d₋ = d₊ − σ√τ`, Tau Ceti's
   `TauCeti.BlackScholes.dPlus` and `TauCeti.BlackScholes.dMinus`.
8. **Classical solutions.** A function C(s, t) is of class C^(2,1) on an open set when C(·, t) is
   twice continuously differentiable and C(s, ·) differentiable there, with ∂C/∂t, ∂C/∂s and
   ∂²C/∂s² jointly continuous. The Black–Scholes operator with volatility σ(s, t) and rate r(t) is
   `C_t + (σ(s,t)² s²/2) C_ss + r(t)(s C_s − C)`.
9. **Lean names.** The acceptance file `Suggested.lean` states its theorems in the namespace
   `TauCetiRoadmap.FinancialMathematics`.

## M0.1: assets and trading

### 1.1 The asset price

Let r be deterministic and continuous on [0, T] and β₀ > 0. The **bond** is
`β_t = β₀ exp(∫₀ᵗ r_u du)`. It is positive, it solves β' = rβ with β(0) = β₀, and for a constant
rate it is β_t = β₀ e^(rt).

*In Tau Ceti:* `TauCeti.Finance.bondPrice`, `TauCeti.Finance.bondPrice_pos`, `TauCeti.Finance.bondPrice_zero`, `TauCeti.Finance.hasDerivWithinAt_bondPrice`, `TauCeti.Finance.hasDerivAt_bondPrice`, `TauCeti.Finance.bondPrice_const`.

Let β be this bond, `TauCeti.Finance.bondPrice r β₀`. Let μ and σ be progressively
measurable real processes with `∫₀ᵀ (|μ_t| + σ_t²) dt < ∞` almost surely, and S₀ a positive
F₀-measurable random variable. Define the asset price S as the unique continuous adapted solution, up
to indistinguishability, of `dS_t = μ_t S_t dt + σ_t S_t dW_t` with initial value S₀, the
progressive-coefficient linear equation of StochasticCalculus §9.4. That section constructs the
solution, with its progressive-integrand localization and its uniqueness by a stopped integrating
factor; it proves the explicit formula

`S_t = S₀ exp(∫₀ᵗ (μ_u − σ_u²/2) du + ∫₀ᵗ σ_u dW_u)`

simultaneously in t, so that S_t > 0 for all t outside one null set, and its case σ = 0,
S_t = S₀ exp(∫₀ᵗ μ_u du); and for deterministic μ, σ and S₀ it identifies the law of log S_t as
Gaussian with mean `log S₀ + ∫₀ᵗ (μ_u − σ_u²/2) du` and variance `∫₀ᵗ σ_u² du`. These are used here
as stated there. No moment assumption on S₀ is needed for existence, uniqueness or positivity; a
moment estimate for S carries its own hypotheses, those of StochasticCalculus §9.4. This section
supplies the positive initial value and the coefficient hypotheses of the asset model and identifies
the solution:

- If σ = 0, μ = r and S₀ = β₀, the asset is the bond.
- If μ and σ are constants and S₀ = s is deterministic, S is indistinguishable from Tau Ceti's
  `TauCeti.Probability.geometricBrownianMotion s μ σ W`.
- The discounted price S/β is the asset of this section with drift μ − r, volatility σ and initial
  value S₀/β₀.

**Checks.**

- For constant μ = 0, σ = 1 and S₀ = 1, the mean of S₁ is 1 (in general E S_t = S₀ e^(μt) for
  constant coefficients and deterministic S₀). The formula without the correction −σ²/2 in the
  exponent would give mean e^(1/2) ≈ 1.6487.
- For σ = 0, with μ and S₀ deterministic, the asset is deterministic and equals
  S₀ exp(∫₀ᵗ μ_u du), whatever the Brownian path; a definition that kept a term in W would make it
  random.

*Needs:* StochasticCalculus §9.4 (the linear equation, its explicit solution, uniqueness and
positivity, and the Gaussian law of log S_t) and §3.4 (progressive integrands); Tau Ceti
`TauCeti.Finance.bondPrice`, `TauCeti.Finance.hasDerivAt_bondPrice`,
`TauCeti.Probability.geometricBrownianMotion`, `TauCeti.Probability.IsFilteredPreBrownianReal`.

### 1.2 Strategies, wealth and self-financing

Let S be the asset of §1.1 and β the bond. Define a **strategy** as a pair (a, b) of predictable
processes on [0, T] such that a is stochastically integrable against S, that is
`∫₀ᵀ a_t² σ_t² S_t² dt < ∞` and `∫₀ᵀ |a_t μ_t S_t| dt < ∞` almost surely, and b is pathwise
integrable against β, that is `∫₀ᵀ |b_t r_t β_t| dt < ∞` almost surely. Its **wealth** is
V_t = a_t S_t + b_t β_t, its **initial cost** is V₀, the value of the position (a₀, b₀) taken at
time 0, and its **terminal payoff** is V_T. Define the strategy to be **self-financing** when

`V_t = V₀ + ∫₀ᵗ a_u dS_u + ∫₀ᵗ b_u dβ_u`

simultaneously in t ∈ [0, T], the stochastic integral taken in its continuous version and the bond
integral as the pathwise integral `∫₀ᵗ b_u r_u β_u du`. Negative holdings are allowed (Convention 3).

- If (a, b) and (a', b') are self-financing and c, c' are real, then (ca + c'a', cb + c'b') is
  self-financing, with initial cost cV₀ + c'V₀' and terminal payoff cV_T + c'V_T'. For simple
  strategies this is Tau Ceti's `TauCeti.Finance.IsSelfFinancing.add` and
  `TauCeti.Finance.IsSelfFinancing.smul`.
- A strategy with F₀-measurable constant holdings (buy and hold) is self-financing.
- *Simple strategies.* For dates 0 = t₀ < t₁ < ⋯ < t_n = T and holdings a_j, b_j measurable at
  time t_j, held on (t_j, t_(j+1)] (and (a₀, b₀) at time 0), so that
  `a_t = Σ_j a_j 1_(t_j, t_(j+1)](t)` with a_j chosen at the start t_j of its interval, the simple
  holding is predictable and its stochastic integral against S is the elementary sum
  `∫₀ᵗ a dS = Σ_j a_j (S_(t_(j+1) ∧ t) − S_(t_j ∧ t))`, and likewise against β, where it equals
  `∫₀ᵗ b_u r_u β_u du`. The **simple-strategy formula**: the wealth satisfies
  `V_t = V₀ + ∫₀ᵗ a dS + ∫₀ᵗ b dβ` throughout (t₀, t_n], with these elementary integrals, exactly
  when each rebalancing is paid for by the old position,
  `a_j S_(t_(j+1)) + b_j β_(t_(j+1)) = a_(j+1) S_(t_(j+1)) + b_(j+1) β_(t_(j+1))` for every j + 1 < n.
  The strategy is therefore self-financing in the sense above exactly when this rebalancing
  identity holds for P-almost every ω; the library's predicate asks it for every ω.
  *In Tau Ceti:* `TauCeti.Finance.simpleHolding`, `TauCeti.Finance.simpleGains`, `TauCeti.Finance.IsSelfFinancing`, `TauCeti.Finance.isSelfFinancing_iff_forall_mem_Ioc`, `TauCeti.Finance.isStronglyPredictable_simpleHolding`, `TauCeti.Finance.simpleGains_bondPrice`.
- *Discounted form.* A strategy is self-financing if and only if its discounted wealth satisfies
  `V_t/β_t = V₀/β₀ + ∫₀ᵗ a_u d(S/β)_u` simultaneously in t. *Route:* Itô's product rule with the
  continuous finite-variation process 1/β. For simple strategies this is Tau Ceti's
  `TauCeti.Finance.isSelfFinancing_iff_discounted`. In particular the bond holding of a
  self-financing strategy is determined by a and V₀.

The passage from simple to general strategies is by approximation: the holdings are approximated by
simple predictable processes in the integrability classes above, the stochastic integral is
continuous along the approximation, and it depends on the integrand only up to dt × P-null sets
(StochasticCalculus §3.2–§3.4).

**Checks.**

- Buying one share at time 0 with borrowed money and never trading again, a = 1 and b = −S₀/β₀,
  is self-financing with initial cost 0 and wealth `V_t = S_t − S₀ β_t/β₀`; the gains are
  `(S_t − S₀) − (S₀/β₀)(β_t − β₀)`, the same. A definition that omitted the bond gains ∫b dβ would
  give V₀ + ∫a dS = S_t − S₀ and declare this strategy not self-financing whenever β_t ≠ β₀.
- Holding one share up to time u and two afterwards, with a constant bond holding, is not
  self-financing: the wealth jumps by S_u just after u, while the right-hand side of the
  self-financing equation is continuous in t. In the simple-strategy form, the rebalancing at u costs
  2S_u + bβ_u while the old position is worth S_u + bβ_u.

*Needs:* §1.1; StochasticCalculus §3.2–§3.4 (stochastic integral of predictable integrands, its
continuous version and congruence) and §5.1 (Itô's formula and product rule); Tau Ceti
`TauCeti.Finance.simpleHolding`, `TauCeti.Finance.simpleGains`, `TauCeti.Finance.IsSelfFinancing`,
`TauCeti.Finance.isSelfFinancing_iff_forall_mem_Ioc`, `TauCeti.Finance.isSelfFinancing_iff_discounted`,
`TauCeti.Finance.isStronglyPredictable_simpleHolding`, `TauCeti.Finance.simpleGains_bondPrice`.

### Examples

- With constant coefficients and S₀ = s, the asset is `S_t = s exp((μ − σ²/2)t + σW_t)` and the
  bond is `β_t = β₀ e^(rt)` (`TauCeti.Finance.bondPrice_const`). The forward strategy, a = 1 and
  b = −K e^(−rT)/β₀, is self-financing with wealth `S_t − K e^(−r(T−t))`, initial cost
  s − K e^(−rT) and terminal payoff S_T − K.
- With σ = 0 and μ = r the asset is proportional to the bond, S = cβ with c = S₀/β₀, and the wealth
  of a strategy is xβ with x = ac + b. A strategy is self-financing exactly when x is constant in
  time, however x is split between the asset and the bond.

### Dependencies

StochasticCalculus §3.2–§3.4, §5.1 and §9.4. Tau Ceti: the bond and its derivative, geometric
Brownian motion, simple strategies and their self-financing API. Mathlib: filtrations and
predictable processes.

## M0.2: equivalent measure, completeness and no arbitrage

In §2.0–§2.3 the coefficients r, μ and σ ≠ 0 are constants, β_t = e^(rt) (the bond with β₀ = 1,
`TauCeti.Finance.bondPrice_const`), and F is the augmented natural filtration of W. Put
κ = (μ − r)/σ and

`Z_t = exp(−κW_t − κ²t/2)`,   `dQ = Z_T dP`,   `W^Q_t = W_t + κt`.

### 2.0 The risk-neutral measure for constant coefficients

Prove that Z is a strictly positive martingale relative to F with E Z_T = 1, so that Q is a
probability measure; that Q and P have the same null sets; that W^Q, t ∈ [0, T], is a Brownian
motion relative to F under Q (Girsanov's theorem, Shreve 2004, §5.2.1); and that the augmented
natural filtration of W^Q under Q is F, the augmented natural filtration of W under P. Prove
further that, up to the horizon T, the asset with drift μ driven by W is the geometric Brownian
motion with drift r driven by W^Q, and that the discounted asset S_t/β_t, t ∈ [0, T], is a
Q-martingale relative to F (Shreve 2004, §5.2.2).
*Route:* Z is the exponential martingale of W with parameter −κ, and Q is the measure P tilted by
−κW_T, whose density is Z_T; Girsanov's theorem for a constant drift is checked on the
finite-dimensional laws and the independence of increments from the past. The filtrations agree
because translation of paths by the deterministic function κt is invertible and P and Q have the
same null sets. In the library, Q is `P.tilted (fun ω => -κ * W T ω)` and its equivalence to P is
Mathlib's `MeasureTheory.tilted_absolutelyContinuous` and `MeasureTheory.absolutelyContinuous_tilted`.

**Checks.**

- Under Q the process W has drift −κ: `E_Q W_T = −κT`, which is what makes W^Q = W + κt centred.
  Tilting by +κW_T instead would give `E_Q W_T = κT` and leave W + κt with mean 2κT.
- A density without the term −κ²T/2 would have mean `E exp(−κW_T) = e^(κ²T/2) > 1` for κ ≠ 0, and
  would not define a probability measure.

*In Tau Ceti:* `TauCeti.Probability.exponentialMartingale`, `TauCeti.Probability.exponentialMartingale_pos`, `TauCeti.Probability.IsFilteredPreBrownianReal.martingale_exponentialMartingale`, `ProbabilityTheory.IsPreBrownianReal.tilted_mul_eval_eq_withDensity`, `TauCeti.Probability.IsFilteredPreBrownianReal.sub_mul_min_tilted_mul_eval`, `TauCeti.Probability.IsFilteredPreBrownianReal.isBrownianReal_sub_mul_min_tilted_mul_eval`, `ProbabilityTheory.IsPreBrownianReal.rightCont_nullAugment_natural_add_drift_tilted`, `TauCeti.Probability.geometricBrownianMotion_eq_riskNeutral`, `TauCeti.Probability.IsFilteredPreBrownianReal.condExp_discounted_geometricBrownianMotion_tilted`.

*Needs:* Tau Ceti `TauCeti.Probability.IsFilteredPreBrownianReal`,
`TauCeti.Probability.geometricBrownianMotion`; Mathlib `MeasureTheory.Measure.tilted`,
`MeasureTheory.isProbabilityMeasure_tilted`, `MeasureTheory.Filtration.natural`,
`MeasureTheory.Filtration.rightCont`, `MeasureTheory.Martingale`.

### 2.1 Brownian representation under the risk-neutral measure

Prove predictable representation under Q on F: every F_T-measurable real ξ with E_Q ξ² < ∞ is

`ξ = E_Q ξ + ∫₀ᵀ h_t dW^Q_t`

for a predictable h with `E_Q ∫₀ᵀ h_t² dt < ∞`, unique up to dt × Q-null sets; consequently every
square-integrable (F, Q)-martingale on [0, T] has a continuous version `M_t = M₀ + ∫₀ᵗ h dW^Q`.
*Route:* apply the L² martingale representation theorem in the usual natural Brownian filtration
(StochasticCalculus §6.1) to the Q-Brownian motion W^Q, whose augmented natural filtration under Q
is F by §2.0. The theorem is about F: a larger filtration relative to which
W is a Brownian motion is not asserted to have the representation property, and the market on it is
not asserted to be complete.

**Checks.**

- ξ = W^Q_T has E_Q ξ = 0 and integrand h = 1. Representing against W instead of W^Q would give
  W^Q_T = κT + ∫₀ᵀ 1 dW_t, with constant term κT, not E_Q ξ = 0, when κ ≠ 0: the representation is
  against the Q-Brownian motion.
- ξ = (W^Q_T)² has E_Q ξ = T and integrand h_t = 2W^Q_t, by Itô's formula for the square.

*Needs:* §2.0; StochasticCalculus §6.1 (augmentation of the natural Brownian filtration and L² martingale
representation) and §3.2–§3.4; Tau Ceti
`ProbabilityTheory.IsPreBrownianReal.rightCont_nullAugment_natural_add_drift_tilted`,
`TauCeti.Probability.IsFilteredPreBrownianReal.isBrownianReal_sub_mul_min_tilted_mul_eval`; Mathlib
`MeasureTheory.Measure.tilted`, `MeasureTheory.Filtration.rightCont`.

### 2.2 Admissible strategies, replication and pricing

Define the **admissible** strategies as the self-financing strategies (§1.2) on [0, T] whose
discounted wealth V_t/β_t, t ∈ [0, T], is a square-integrable Q-martingale relative to F.

- Admissible strategies are closed under finite linear combinations, and buy-and-hold strategies
  with constant holdings are admissible.
- The wealth of an admissible strategy is `V_t = β_t E_Q[V_T/β_T | F_t]` for every t; in particular
  its initial cost is V₀ = e^(−rT) E_Q[V_T].

Prove **completeness and pricing**: for every F_T-measurable real claim H with e^(−rT)H ∈ L²(Q)
there is an admissible strategy (a, b), with a and b predictable, whose terminal payoff is H almost
surely; and every admissible strategy with terminal payoff H has the wealth

`V_t = e^(rt) E_Q[e^(−rT) H | F_t]`,   t ∈ [0, T],

so the wealth process is unique up to indistinguishability (Shreve 2004, §5.2.4 for the pricing
formula and §5.3.2 for replication). *Route:* represent
`M_t = E_Q[e^(−rT) H | F_t] = M₀ + ∫₀ᵗ h dW^Q` by §2.1; since d(S/β) = σ(S/β) dW^Q, the holdings
`a_t = β_t h_t/(σ S_t)` and `b_t = M_t − a_t S_t/β_t` give a strategy with discounted wealth M; its
integrability against S and β follows from `∫₀ᵀ h² dt < ∞` and the continuity of S and β, and it is
self-financing by the discounted form of §1.2.

Prove the **law of one price**: two admissible strategies whose terminal payoffs agree almost surely
have indistinguishable wealth processes, in particular the same initial cost.

**Checks.**

- The forward claim H = S_T − K has value `V_t = S_t − K e^(−r(T−t))`, the wealth of the static
  strategy a = 1, b = −K e^(−rT); the pricing formula gives the same, because the discounted asset is
  a Q-martingale. Pricing with P instead of Q would give `S_t e^((μ−r)(T−t)) − K e^(−r(T−t))`, which
  differs when μ ≠ r and is not the wealth of any admissible strategy with payoff H.
- For the forward, d(S/β) = σ(S/β) dW^Q gives the integrand h_t = σS_t/β_t, so the route's holdings
  are a = βh/(σS) = 1 and b = M − S/β = −K e^(−rT). Dropping the factor β from a would give
  a_t = e^(−rt) instead of 1.
- The claim H = 1 has value e^(−r(T−t)), replicated by a = 0 and b = e^(−rT).

*Needs:* §1.2, §2.0, §2.1; StochasticCalculus §3.2–§3.4 and §5.1; Tau Ceti
`TauCeti.Probability.IsFilteredPreBrownianReal.condExp_discounted_geometricBrownianMotion_tilted`;
Mathlib `MeasureTheory.Martingale`, `MeasureTheory.MemLp`.

### 2.3 Arbitrage and static claims

An **arbitrage** is a strategy whose initial cost is 0 almost surely, whose terminal payoff is
nonnegative almost surely, and whose terminal payoff is positive with positive probability. Whether
a trade is an arbitrage depends only on the null sets of P, so it is the same under P and under any
equivalent measure, in particular Q.

*In Tau Ceti:* `TauCeti.Finance.IsArbitrage`, `TauCeti.Finance.isArbitrage_iff_of_absolutelyContinuous`.

Prove that **no admissible strategy is an arbitrage** (Shreve 2004, §5.4.3). *Route:* the
discounted wealth is a Q-martingale, so `E_Q[V_T/β_T] = V₀ = 0`, and a nonnegative variable with
Q-mean zero vanishes Q-almost surely, hence P-almost surely. For simple strategies trading at
finitely many dates of [0, T], with holdings chosen at the start of each interval and integrable
discounted gains under Q, the statement is Tau Ceti's
`TauCeti.Probability.IsFilteredPreBrownianReal.not_isArbitrage_geometricBrownianMotion`, an instance
of `TauCeti.Finance.IsSelfFinancing.not_isArbitrage` (no simple arbitrage when the discounted asset
is a martingale under an equivalent measure).

Prove the **static-claim extension**. Let H be a claim replicated by an admissible strategy (a, b)
of initial cost q, and suppose that H can also be bought or sold at time 0 at a price p, held to
maturity and settled for H. If p ≠ q, let c = ±1 have the sign of q − p; holding c claims, the
strategy (−ca, −cb) and the constant bond holding c(q − p)/β₀ costs 0 at time 0 and pays
c(q − p)β_T/β₀ = |q − p| β_T/β₀ > 0 at T almost surely: an arbitrage of the market extended by the
claim. One such trade yields only that fixed surplus. If every integer number N of claims, of
either sign, may be held, a scaling premise stated as a hypothesis, the N-fold trades yield sure
profits N|q − p|β_T/β₀, unbounded in N. The claim is held statically: the extended market does not
assume that the discounted price of the mispriced claim is a Q-martingale. For a replication by a
simple self-financing strategy, the statements (the offset trade is self-financing, costs 0, pays
the financed surplus; the sign choice; unbounded profit under integer scaling) are in the library.

*In Tau Ceti:* `TauCeti.Finance.IsSelfFinancing.staticClaim_offset`, `TauCeti.Finance.staticClaim_offset_initial_cost`, `TauCeti.Finance.staticClaim_offset_terminal_payoff`, `TauCeti.Finance.exists_staticClaim_payoff`, `TauCeti.Finance.exists_staticClaim_profit_gt` (for simple replicating strategies).

**Checks.**

- With q = 10, p = 9, β₀ = 1 and β_T = e^(rT): buy the claim for 9, sell the replicating strategy
  for 10 and put the surplus 1 into the bond; the claim and the short replication cancel at T and
  the payoff is e^(rT). Taking the sign the wrong way round, selling the claim at 9 and buying the
  replication at 10, pays −e^(rT).
- If p = q the static trade pays 0 at every scale, so the argument gives no arbitrage, as the law of
  one price requires.

*Needs:* §2.2; Tau Ceti `TauCeti.Finance.IsArbitrage`,
`TauCeti.Finance.isArbitrage_iff_of_absolutelyContinuous`; Mathlib
`MeasureTheory.absolutelyContinuous_tilted`, `MeasureTheory.tilted_absolutelyContinuous`.

### 2.4 Progressive coefficients

Extend §2.1–§2.3 to progressive coefficients on the same filtration F, the augmented natural
filtration of the P-Brownian motion W. Let μ and σ be progressively measurable, r deterministic and
continuous, β = `TauCeti.Finance.bondPrice r 1`, and assume deterministic constants
`0 < δ_σ ≤ C_σ < ∞` and `K_κ ≥ 0` with `δ_σ ≤ |σ_t| ≤ C_σ` and `|κ_t| ≤ K_κ` for dt × P-almost every
(t, ω), where `κ_t = (μ_t − r_t)/σ_t` on that full-measure set. Choose predictable versions of σ and
κ, equal to them dt × P-almost everywhere, before forming stochastic integrals (StochasticCalculus
§3.4); the identities between the coefficients are preserved almost everywhere.

- Prove that `Z_t = exp(−∫₀ᵗ κ dW − ½∫₀ᵗ κ² du)` is a strictly positive true martingale on [0, T]
  (Novikov's criterion, κ being bounded), define Q by dQ = Z_T dP, and prove that
  `W^Q_t = W_t + ∫₀ᵗ κ_u du` is a Q-Brownian motion on [0, T] relative to F.
- Prove predictable representation under Q on the original filtration F: every F_T-measurable ξ
  with E_Q ξ² < ∞ is `E_Q ξ + ∫₀ᵀ h dW^Q` with h predictable and `E_Q ∫₀ᵀ h² dt < ∞`. *Route:*
  represent the P-martingale generated by Z_T ξ by StochasticCalculus §6.1 and transform it by the
  Bayes formula and Itô's product rule (StochasticCalculus §7.3, §5.1), localizing the intermediate
  products. For random κ the natural filtrations of W and W^Q need not coincide, and the route does
  not use them.
- For an F_T-measurable real claim H with H/β_T ∈ L²(Q), let `M_t = E_Q[H/β_T | F_t]` with
  integrand h, and put V = βM, `a = βh/(Sσ)` and `b = (V − aS)/β`. Prove that a and b have
  predictable representatives, that a is stochastically integrable against S and b pathwise
  integrable against β under P and under Q, that (a, b) is self-financing with wealth V, and that
  V_t → H as t → T.
- Prove that the admissible strategies of this market, defined as in §2.2 with this Q, satisfy the
  pricing formula `V_t = β_t E_Q[H/β_T | F_t]`, the law of one price, absence of arbitrage and the
  static-claim extension of §2.3.

These are the contracts for markets with variable coefficients. A consumer whose coefficient bounds
hold only up to stopping times, or only locally, proves nonexplosion on the full horizon, the
true-martingale property of its density and the integrability of its holdings before applying them.

**Checks.**

- Constant κ recovers §2.0–§2.3: Z is then `TauCeti.Probability.exponentialMartingale (-κ) W` and
  W^Q_t = W_t + κt.
- For deterministic κ_t = t on [0, 1], `∫₀¹ κ dW` is Gaussian with variance v = 1/3, and
  `E exp(−∫κ dW − ½∫κ²) = exp(v/2 − v/2) = 1`. With the normalization −∫κ² in place of −½∫κ² the
  expectation would be e^(−1/6) ≈ 0.8465, and Q would not be a probability measure.

*Needs:* §1.1, §1.2, §2.2, §2.3; StochasticCalculus §3.4 (predictable versions), §5.1 (Itô's
product rule), §5.4 (Novikov's criterion), §6.1 (representation under P), §7.3 (density martingales
and the Bayes formula) and §7.4 (Girsanov's theorem on a finite horizon); Tau Ceti
`TauCeti.Finance.bondPrice`, `TauCeti.Finance.IsArbitrage`.

### Examples

- With r = 0.05, μ = 0.1 and σ = 0.2, the market price of risk is κ = 0.25, Q has density
  exp(−0.25 W_T − 0.03125 T), and under Q the asset has drift 0.05, so the discounted asset has
  Q-mean S₀ at every time.
- The digital claim H = 1{S_T > K} has e^(−rT)H bounded, so §2.2 replicates it; with S₀ = s and
  σ > 0 its value at time 0 is `e^(−rT) Q(S_T > K) = e^(−rT) Φ(d₋)`, d₋ evaluated at spot s and
  remaining maturity T.

### Dependencies

M0.1. StochasticCalculus §3.2–§3.4, §5.1, §5.4, §6.1, §7.3 and §7.4. Tau Ceti: the exponential
martingale, the tilted measure and Girsanov's theorem for constant drift, the identity of augmented
natural filtrations, the discounted geometric Brownian motion as a martingale, and arbitrage with
simple strategies. Mathlib: tilted measures, martingales and Lᵖ spaces.

## M0.3: classical price and the self-financing PDE

In §3.1 and §3.2 the coefficients are deterministic continuous Markov coefficients μ(s, t) and
σ(s, t) on (0, ∞) × [0, T] and a deterministic continuous rate r(t). Assume that from every
deterministic start (s₀, t₀) with s₀ > 0 and t₀ ∈ [0, T) the equation
`dS_t = μ(S_t, t) S_t dt + σ(S_t, t) S_t dW_t`, `S_(t₀) = s₀`, has a positive strong solution
(StochasticCalculus §9.1) on [t₀, T] that does not explode. Let D = {(s, t) : s > 0, 0 ≤ t < T};
class C^(2,1) on D is that of Convention 8 with the time derivative at t = 0 taken from the right.
A function C of class C^(2,1) on D **replicates from (s₀, t₀)** when some self-financing
strategy (§1.2, on [t₀, T]) has wealth V_t = C(S_t, t) for all t ∈ [t₀, T), almost surely;
equality at maturity alone is not replication.

### 3.1 The pricing equation as a necessary condition

Let U = {(s, t) ∈ D : σ(s, t) ≠ 0}, open in D. Prove: if C replicates from (s₀, t₀) by the
strategy (a, b), then dt × P-almost everywhere on {t ∈ [t₀, T) : (S_t, t) ∈ U}

`a_t = ∂C/∂s(S_t, t)`,   `b_t = (C(S_t, t) − S_t ∂C/∂s(S_t, t))/β_t`,

and the Black–Scholes operator of C (Convention 8) vanishes at (S_t, t) (for constant
coefficients, Shreve 2004, §4.5). *Route:* Itô's formula
for C(S_t, t) and the self-financing equation give two decompositions of the same continuous
semimartingale; their martingale parts agree, which identifies a where σ ≠ 0, and then their drifts
agree. The pointwise identity behind the drifts is Tau Ceti's
`TauCeti.BlackScholes.itoDrift_eq_hedgeDrift_iff_pde`. Prove further: if C replicates from every
start in D, then the Black–Scholes operator of C vanishes at every point of U. *Route:* the
operator is continuous on D, the solution from (s₀, t₀) has continuous paths starting at s₀, and
the almost-everywhere identity for t near t₀ gives its value at (s₀, t₀). Replication from a single
start gives only the statement along that solution.

For a prescribed delta strategy the drift identity holds wherever C solves the equation, including
where σ vanishes: at a point (s, t) with s > 0, for every drift μ, volatility σ and rate r (σ = 0
included) and every bond price β ≠ 0, the Itô drift `C_t + μ s C_s + (σ²s²/2) C_ss` of C(S_t, t)
equals the drift `μ s a + r β b` of the delta hedge `a = C_s`, `b = (C − s C_s)/β` exactly when the
Black–Scholes operator of C vanishes at (s, t).

*In Tau Ceti:* `TauCeti.BlackScholes.itoDrift_eq_hedgeDrift_iff_pde`, `TauCeti.BlackScholes.hedgeBondHolding`, `TauCeti.BlackScholes.mul_deriv_add_mul_hedgeBondHolding`.

Where σ = 0 a replicating strategy is not forced to hold ∂C/∂s shares, and replication does not by
itself force the equation; no necessity statement is made there. The deterministic asset with σ = 0
and the bond are the cases of §1.1.

**Checks.**

- The stock, C(s, t) = s, and the zero-coupon bond, C(s, t) = e^(−r(T−t)) for constant r, have
  Black–Scholes operator 0. For the bond, the operator with the sign of the term r(sC_s − C)
  reversed would be 2r e^(−r(T−t)), not 0.
- With constant coefficients the price of the claim S_T² is C(s, t) = s² e^((r+σ²)(T−t)), and its
  operator vanishes: C_t = −(r + σ²)C, `(σ²s²/2) C_ss = σ²C` and `r(sC_s − C) = rC`. The
  physical-measure value `e^(−r(T−t)) E_P[S_T² | S_t = s] = s² e^((2μ+σ²−r)(T−t))` fails the equation
  when μ ≠ r.
- With σ = 0 and μ = r = 0 the asset is constant, and C(s, t) = s² replicates from every start by
  the strategy a = 0, b = s₀²/β: the holding is not ∂C/∂s = 2s₀. This is the degenerate case in
  which no necessity statement is made.

*Needs:* §1.1, §1.2; StochasticCalculus §5.1 (Itô's formula) and §4.1, §4.3 (uniqueness of the
decomposition of a continuous semimartingale); Tau Ceti
`TauCeti.BlackScholes.itoDrift_eq_hedgeDrift_iff_pde`, `TauCeti.BlackScholes.hedgeBondHolding`.

### 3.2 The price-admissibility criterion

Let the coefficient processes μ(S_t, t), σ(S_t, t) and r(t) along the solutions above satisfy the
hypotheses of §2.4 (those of §2.0–§2.3 when they are constant), so that the measure Q of §2.4 exists on the
declared filtration, with its true density and its predictable representation. Let C be of class
C^(2,1) on D and solve the Black–Scholes equation there, and let h be a real function on (0, ∞).
For a start (s₀, t₀), assume:

- the delta strategy `a_t = ∂C/∂s(S_t, t)`, `b_t = (C(S_t, t) − S_t a_t)/β_t`, t ∈ [t₀, T), has
  predictable representatives, a is stochastically integrable against S and b pathwise integrable
  against β on the full horizon [t₀, T];
- `C(S_t, t)/β_t`, t ∈ [t₀, T), extends to a square-integrable Q-martingale on [t₀, T];
- `C(S_t, t) → h(S_T)` almost surely as t ↑ T.

C is of class C^(2,1) only for t < T, so at maturity the delta strategy holds an F_T-measurable
position (a_T, b_T) worth `a_T S_T + b_T β_T = h(S_T)`, for instance a_T = 0 and
b_T = h(S_T)/β_T. Prove that the delta strategy is admissible and self-financing on [t₀, T], that
it replicates h(S_T), and that `C(S_t, t) = β_t E_Q[h(S_T)/β_T | F_t]`, the price of §2.2 and §2.4.
Itô's formula alone makes `C(S_t, t)/β_t` only a local martingale; without the second and third
conditions no admissibility is asserted.

Prove the **growth criterion**: the three conditions hold when, for some p > 0 and A ≥ 0,
`|C(s, t)| + |s ∂C/∂s(s, t)| ≤ A(1 + sᵖ)` on D, C extends continuously to {s > 0, t ≤ T} with
C(s, T) = h(s), and the asset has the full-horizon maximal moment `E_Q[sup_(t₀≤t≤T) S_t^(2p)] < ∞`.
*Route:* the bound makes the local martingale `C(S_t, t)/β_t` dominated by a square-integrable
variable, hence a true square-integrable martingale, and gives the integrability of the holdings
from the boundedness of σ and κ and the continuity of the paths. With constant coefficients and
p = 1 the maximal moment holds for geometric Brownian motion by Doob's inequality, because the
discounted asset is a Q-martingale with moments of every order
(`ProbabilityTheory.IsPreBrownianReal.memLp_geometricBrownianMotion`); this covers the call and the
put of M0.4.

**Checks.**

- The Black–Scholes call satisfies the growth bound with p = 1 and A = 2, since 0 ≤ C ≤ s and
  0 < ∂C/∂s < 1; the put satisfies it with p = 1, since 0 ≤ P ≤ K e^(−r(T−t)) and −1 < ∂P/∂s < 0.
- The forward price C(s, t) = s − K e^(−r(T−t)) satisfies the growth bound with p = 1; the
  criterion's delta is a = 1 and its bond holding −K e^(−rT), the static strategy of §2.2.

*Needs:* §1.2, §2.2, §2.4, §3.1; StochasticCalculus §5.1 (Itô's formula) and §2.2 (Doob's maximal
inequality; a local martingale of class DL is a martingale); Tau Ceti
`ProbabilityTheory.IsPreBrownianReal.memLp_geometricBrownianMotion`.

### 3.3 Existence for general coefficients

Write y = log s and let 0 < α < 1. Assume that the volatility `σ(e^y, t)` is parabolically
α-Hölder on the slab ℝ × [0, T], for the parabolic distance `|y − y'| + √|t − t'|` of Tau Ceti's
`TauCeti.ParabolicSpaceTime.slab`, that `0 < δ ≤ σ(s, t)² ≤ Λ` for s > 0 and t ∈ [0, T], and that
r is α/2-Hölder on [0, T]. Then the volatility and the risk-neutral drift `r(t) − σ(e^y, t)²/2` of
the log-spot equation are bounded and parabolically α-Hölder. Let h be terminal data with
`h(e^y)/(1 + e^y)` in `C_b^(2+α)(ℝ)`, Tau Ceti's `TauCeti.CkHolderSpace 2 α ℝ ℝ`. Prove
`existsUnique_weighted_price`: there is exactly one v in the parabolic Hölder space
`C_b^(2+α, 1+α/2)(ℝ × [0, T])`, Tau Ceti's `TauCeti.ParabolicC2HolderSpace`, such that
`C(s, t) = (1 + s) v(log s, t)` has terminal value C(s, T) = h(s) for s > 0 and solves the
Black–Scholes equation of Convention 8 for s > 0, 0 < t < T. In the statement the time slices of v
are extended to all times by `TauCeti.ParabolicC2HolderSpace.timeExtension`. *Route:* in the
log-spot variable the equation becomes `u_t + (σ²/2) u_yy + (r − σ²/2) u_y − r u = 0` on the whole
line (Tau Ceti's `TauCeti.Finance.pde_comp_log` and `TauCeti.Finance.pde_comp_exp`); the weight
w(y) = 1 + e^y has log w with bounded, Hölder continuous derivatives of every positive order, the
derivatives of the sigmoid (`Real.iteratedDeriv_succ_log_one_add_exp`,
`Real.memHolder_iteratedDeriv_sigmoid`), so the spatial-weight transport of PDE §6.9 turns the
equation for u into `v_t + a v_yy + b v_y + c v = 0` for v = u/w, with `a = σ²/2`,
`b = r − σ²/2 + σ²ρ` and `c = −r(1 − ρ)`, where ρ = e^y/(1 + e^y). These coefficients are bounded
and parabolically α-Hölder, and a ≥ δ/2, so the backward terminal-data isomorphism of PDE §6.6 gives
existence; uniqueness in the unweighted class is also Tau Ceti's
`TauCeti.ParabolicC2HolderSpace.eq_of_euclideanBackwardParabolicOperatorL_eq`, on
`EuclideanSpace ℝ (Fin 1)`. The call and put theorems of M0.4 have an independent direct proof
and do not use this theorem, whose hypothesis on h excludes their kinked payoffs.

The coefficient adapter of the route is the **log-spot form of the operator**: let s > 0, let σ and
r be any reals (the values σ(s, t) and r(t)), and let C(s, t) = u(log s, t) with u(·, t)
differentiable near log s and its derivative differentiable at log s. Then the Black–Scholes
operator `C_t + (σ²s²/2) C_ss + r(s C_s − C)` at (s, t) equals the log-spot operator
`u_t + (σ²/2) u_yy + (r − σ²/2) u_y − r u` at (log s, t); and, read the other way, for
u(y, t) = C(e^y, t) with C(·, t) differentiable near e^y and its derivative differentiable at e^y,
the log-spot operator of u at (y, t) equals the Black–Scholes operator of C at (e^y, t).

*In Tau Ceti:* `TauCeti.Finance.pde_comp_log`, `TauCeti.Finance.pde_comp_exp`.

The growth adapter identifies the solution with the price. Let C = (1 + s) v be the solution above,
and let μ(s, t) be a drift such that the standing hypotheses of this milestone hold for μ and this σ
and the market price of risk (μ − r)/σ is bounded on (0, ∞) × [0, T], with F the augmented natural
filtration of W. Prove that C is of class C^(2,1) on D and solves the Black–Scholes equation
there, that it satisfies the growth bound of §3.2 with p = 1, namely
`|C(s, t)| + |s ∂C/∂s(s, t)| ≤ (2‖v‖ + ‖v_y‖)(1 + s)` with sup norms on the slab, extends
continuously to t = T with C(s, T) = h(s), and that from every start (s₀, t₀) with s₀ > 0 and
t₀ ∈ [0, T) the asset has `E_Q[sup_(t₀≤t≤T) S_t²] < ∞`. Consequently, by §3.2, the delta strategy
of C replicates h(S_T) from every such start and `C(S_t, t) = β_t E_Q[h(S_T)/β_T | F_t]` for
t ∈ [t₀, T]: the solution of this section is the price of §2.4 (a Feynman–Kac representation).
*Route:* at y = log s, `s ∂C/∂s = s v + (1 + s) v_y`; v, v_y, v_yy and v_t are continuous on the
closed slab, v_t at t = 0 being the right derivative (the time derivative of
`TauCeti.ParabolicC2HolderSpace` is taken within [0, T]), so C is of class C^(2,1) on D and its
operator, continuous on D and zero for 0 < t < T, vanishes at t = 0; and
v(y, T) = h(e^y)/(1 + e^y). Under Q the discounted asset is
`S_t/β_t = (s₀/β_(t₀)) exp(∫_(t₀)^t σ dW^Q − ½∫_(t₀)^t σ² du)` with σ² ≤ Λ, so its square is at most
`(s₀/β_(t₀))² e^(Λ(T − t₀))` times the stochastic exponential of `∫ 2σ dW^Q`, a true martingale by
Novikov's criterion; hence S/β is a square-integrable Q-martingale, and Doob's inequality and the
boundedness of β on [0, T] give the maximal moment. The stopped Itô argument that identifies the
local martingale `C(S_t, t)/β_t` with its terminal value is the localization of §3.2.

**Checks.**

- For constant coefficients and h(s) = s the solution is C(s, t) = s, and `C(e^y, t)/(1 + e^y)` is
  the sigmoid `e^y/(1 + e^y)`, bounded with bounded Hölder derivatives of every order, so it lies in
  the class. Without the weight, C(e^y, t) = e^y is unbounded and lies in no bounded Hölder class.
  The identification then reads `S_t = β_t E_Q[S_T/β_T | F_t]`, the martingale property of the
  discounted asset.
- For the call payoff, `(e^y − K)⁺/(1 + e^y)` has one-sided derivatives 0 and K/(1 + K) at
  y = log K, so it is not in `C_b^(2+α)(ℝ)`: the call is outside this theorem and is treated in
  M0.4.
- For u(y, t) = e^y, that is C(s, t) = s, the log-spot operator is `(σ²/2)e^y + (r − σ²/2)e^y − r e^y = 0`,
  as the Black–Scholes operator of the stock is. Without the drift correction −σ²/2 in the
  first-order coefficient it would be `(σ²/2)e^y`, not 0 for σ ≠ 0.

*Needs:* for the statement, Convention 8 (the operator), Tau Ceti
`TauCeti.ParabolicSpaceTime.slab`, `TauCeti.CkHolderSpace`, `TauCeti.ParabolicC2HolderSpace`,
`TauCeti.ParabolicC2HolderSpace.timeExtension` and Mathlib `MemHolder`, `HolderOnWith`; for the
route, PDE §6.6 (variable coefficients and backward problems) and §6.9 (spatial weights) and Tau
Ceti `TauCeti.Finance.pde_comp_log`, `TauCeti.Finance.pde_comp_exp`,
`Real.iteratedDeriv_succ_log_one_add_exp`, `Real.memHolder_iteratedDeriv_sigmoid`,
`TauCeti.ParabolicC2HolderSpace.eq_of_euclideanBackwardParabolicOperatorL_eq`. The identification
with the price needs in addition §2.4 and §3.2, and StochasticCalculus §2.2 (Doob's inequality) and
§5.4 (Novikov's criterion).

### Examples

- For constant r and σ ≠ 0 and the zero-coupon bond h = 1, the price is C(s, t) = e^(−r(T−t)),
  replicated by the bond alone; §3.1 gives a = ∂C/∂s = 0 for every replicating strategy.
- For constant coefficients and the power claim h(s) = s², the price s² e^((r+σ²)(T−t)) satisfies
  the growth criterion of §3.2 with p = 2, the maximal Q-moment of order 4 of geometric Brownian
  motion being finite, and §3.2 replicates the claim with a = 2S_t e^((r+σ²)(T−t)).

### Dependencies

M0.1 and M0.2. StochasticCalculus §2.2, §4.1, §4.3, §5.1, §5.4 and §9.1. PDE §6.6 and §6.9. Tau Ceti:
the drift identity of the delta hedge, the log-spot form of the pricing operator, the derivatives
of the sigmoid, the moments of geometric Brownian motion, the parabolic Hölder spaces and uniqueness
for the backward terminal-value problem.

## M0.4: Black–Scholes calls, puts and analytic API

In this milestone r ∈ ℝ, σ > 0, K > 0 and T > 0 are constants, μ ∈ ℝ, the market is that of
§2.0–§2.3 with F the augmented natural filtration of W, the asset is
`TauCeti.Probability.geometricBrownianMotion s μ σ W` for a deterministic s > 0, and β_t = e^(rt).
The remaining maturity is τ = T − t.

### 4.0 The closed forms and their analytic theory

**Gaussian functions.** Let φ(z) = (2π)^(−1/2) e^(−z²/2), the density of the standard Gaussian
measure `gaussianReal 0 1`, and Φ(z) = ∫_(−∞)^z φ(u) du, its distribution function
`cdf (gaussianReal 0 1)` (Convention 7). Then ∫φ = 1, Φ is differentiable with Φ' = φ,
Φ(−z) = 1 − Φ(z) for every real z, and Φ(z) → 0 as z → −∞ and Φ(z) → 1 as z → +∞. The
normalization and the tails are Mathlib's `ProbabilityTheory.integral_gaussianPDFReal_eq_one`,
`ProbabilityTheory.tendsto_cdf_atBot` and `ProbabilityTheory.tendsto_cdf_atTop`; the further analytic
theory of Φ belongs to StandardDistributions.

*In Tau Ceti:* `TauCeti.Probability.hasDerivAt_cdf_gaussianReal`, `TauCeti.Probability.cdf_gaussianReal_zero_one_neg`.

**The closed forms.** For s > 0 and τ > 0 put

`d₊ = (log(s/K) + (r + σ²/2)τ)/(σ√τ)`,   `d₋ = d₊ − σ√τ`,

`C(s, t) = s Φ(d₊) − K e^(−rτ) Φ(d₋)`,   `P(s, t) = K e^(−rτ) Φ(−d₋) − s Φ(−d₊)`,

the Black–Scholes call and put prices (Black–Scholes 1973; Shreve 2004, §4.5). Prove that they
extend continuously to the closed domain s ≥ 0, 0 ≤ t ≤ T, by the payoffs C(s, T) = (s − K)⁺ and
P(s, T) = (K − s)⁺ at maturity and by C(0, t) = 0 and P(0, t) = K e^(−rτ) at zero spot: as
(s, τ) → (s₀, 0⁺) with s₀ > 0 the closed forms tend to the payoffs at s₀. In the library the
extensions are `callValue s r σ K τ` and `putValue s r σ K τ`, equal to the closed forms for s > 0,
τ > 0 and to the discounted intrinsic values `(s − K e^(−rτ))⁺` and `(K e^(−rτ) − s)⁺` elsewhere,
jointly continuous in (s, τ); the calendar-time prices are
`C(s, t) = callValue s r σ K (T − t)` and `P(s, t) = putValue s r σ K (T − t)`.

*In Tau Ceti:* `TauCeti.BlackScholes.dPlus`, `TauCeti.BlackScholes.dMinus`, `TauCeti.BlackScholes.callPrice`, `TauCeti.BlackScholes.putPrice`, `TauCeti.BlackScholes.callValue`, `TauCeti.BlackScholes.putValue`, `TauCeti.BlackScholes.callValue_maturity_zero`, `TauCeti.BlackScholes.putValue_maturity_zero`, `TauCeti.BlackScholes.continuous_callValue`, `TauCeti.BlackScholes.continuous_putValue`, `TauCeti.BlackScholes.tendsto_callPrice_terminal`, `TauCeti.BlackScholes.tendsto_putPrice_terminal`.

**The Black–Scholes equation.** For s > 0 and t < T, C and P solve
`V_t + (σ²s²/2) V_ss + r(s V_s − V) = 0` (Shreve 2004, §4.5); σ ≠ 0 suffices for this identity.

*In Tau Ceti:* `TauCeti.BlackScholes.callPrice_pde`, `TauCeti.BlackScholes.putPrice_pde`, `TauCeti.BlackScholes.callValue_pde`, `TauCeti.BlackScholes.putValue_pde`.

**Put–call parity.** `C(s, t) − P(s, t) = s − K e^(−r(T−t))` for all s ≥ 0 and t ≤ T, the extended
prices included.

*In Tau Ceti:* `TauCeti.BlackScholes.callPrice_sub_putPrice`, `TauCeti.BlackScholes.callValue_sub_putValue`.

**Risk-neutral payoff expectation.** For s > 0 and τ ≥ 0, let
`S_τ = s exp((r − σ²/2)τ + σ√τ Z)` with Z standard Gaussian. Then
`e^(−rτ) E[(S_τ − K)⁺] = C(s, T − τ)` and `e^(−rτ) E[(K − S_τ)⁺] = P(s, T − τ)` (Shreve 2004,
§5.2.5); for τ > 0 the same holds with S_τ the geometric Brownian motion with drift r started at s
and driven by any Brownian motion. In the market of this milestone the prices are conditional
expectations under Q: for 0 ≤ u ≤ T,
`C(S_u, u) = e^(−r(T−u)) E_Q[(S_T − K)⁺ | F_u]` and `P(S_u, u) = e^(−r(T−u)) E_Q[(K − S_T)⁺ | F_u]`,
Q-almost surely.

*In Tau Ceti:* `TauCeti.BlackScholes.riskNeutralPrice_call`, `TauCeti.BlackScholes.riskNeutralPrice_put`, `TauCeti.BlackScholes.riskNeutralPrice_call_eq_callValue`, `TauCeti.BlackScholes.riskNeutralPrice_put_eq_putValue`, `ProbabilityTheory.IsPreBrownianReal.callPrice_eq_integral_geometricBrownianMotion`, `ProbabilityTheory.IsPreBrownianReal.putPrice_eq_integral_geometricBrownianMotion`, `TauCeti.Probability.IsFilteredPreBrownianReal.callValue_eq_condExp_tilted_geometricBrownianMotion`, `TauCeti.Probability.IsFilteredPreBrownianReal.putValue_eq_condExp_tilted_geometricBrownianMotion`.

**Checks.**

- At s = K = 100, r = 0.05, σ = 0.2 and τ = 1: d₊ = 0.35 and d₋ = 0.15, so C ≈ 10.4506 and
  P ≈ 5.5735. Writing the put with Φ(d₋) and Φ(d₊) in place of Φ(−d₋) and Φ(−d₊) would give
  `95.1229 · 0.5596 − 100 · 0.6368 ≈ −10.45`, a negative price that fails parity.
- The put at zero spot is K e^(−rτ), not the payoff K: as s → 0⁺ both d₊ and d₋ tend to −∞, so
  Φ(−d₋) → 1 and P → K e^(−rτ). Extending the put by (K − s)⁺ at s = 0 for τ > 0 would make it
  discontinuous there whenever r ≠ 0.

*Needs:* Mathlib `ProbabilityTheory.gaussianReal`, `ProbabilityTheory.gaussianPDFReal`,
`ProbabilityTheory.cdf`, `ProbabilityTheory.integral_gaussianPDFReal_eq_one`,
`ProbabilityTheory.tendsto_cdf_atBot`, `ProbabilityTheory.tendsto_cdf_atTop`, `posPart`; for the
conditional form, §2.0 and Tau Ceti `TauCeti.Probability.IsFilteredPreBrownianReal`,
`TauCeti.Probability.geometricBrownianMotion`.

### 4.1 Replication of calls and puts

For t ∈ [0, T) let `a_t = Φ(d₊(S_t, T − t))` and `b_t = −K e^(−r(T−t)) Φ(d₋(S_t, T − t))/β_t`,
the delta hedge of the call, and at maturity let `a_T = 1{S_T > K}` and `b_T = −K 1{S_T > K}/β_T`,
the almost-sure limits of the hedge as t ↑ T, worth (S_T − K)⁺. Prove that (a, b) is an admissible
strategy (§2.2), self-financing, with wealth C(S_t, t) for t ∈ [0, T] and terminal payoff
(S_T − K)⁺; it is therefore the replicating strategy of §2.2 for H = (S_T − K)⁺, and its initial
cost is `TauCeti.BlackScholes.callPrice s r σ K T` (Shreve 2004, §4.5). Prove the same for the put
with `a_t = −Φ(−d₊(S_t, T − t))`, `b_t = K e^(−r(T−t)) Φ(−d₋(S_t, T − t))/β_t` for t < T,
`a_T = −1{S_T < K}`, `b_T = K 1{S_T < K}/β_T`, wealth P(S_t, t) and payoff (K − S_T)⁺.
*Route:* the growth criterion of §3.2 with p = 1, whose inputs are in Tau Ceti: the equation
(§4.0, `TauCeti.BlackScholes.callValue_pde`), the bounds on the price and the delta (§4.3), the martingale
property and the square integrability of the discounted price under Q
(`TauCeti.Probability.IsFilteredPreBrownianReal.martingale_discounted_callValue_tilted`,
`TauCeti.Probability.IsFilteredPreBrownianReal.memLp_discounted_callValue_tilted` and the put
analogues), and the convergence to the payoff along every path continuous at T
(`TauCeti.BlackScholes.tendsto_callValue_geometricBrownianMotion`,
`TauCeti.BlackScholes.tendsto_putValue_geometricBrownianMotion`). What the criterion adds to them is
the stochastic integrability of the hedge and the self-financing equation, by Itô's formula on
[0, t] for t < T and passage to t = T.

**Checks.**

- At s = K = 1, r = 0, σ = 1, T = 1 and t = 0: d₊ = 1/2 and d₋ = −1/2; the call hedge holds
  Φ(1/2) ≈ 0.6915 shares and −Φ(−1/2) ≈ −0.3085 bonds, worth ≈ 0.3829 = C; the put hedge holds
  ≈ −0.3085 shares and ≈ 0.6915 bonds, worth ≈ 0.3829 = P. The call hedge minus the put hedge holds
  1 share and −1 bond, the forward strategy of §2.2 (Φ(d₊) + Φ(−d₊) = 1); with the put delta
  written Φ(−d₊), without its sign, the difference would hold ≈ 0.3829 shares instead of 1.
- At s = K = 100, r = 0.05, σ = 0.2 and T = 1: d₊ = 0.35, d₋ = 0.15, the call costs ≈ 10.4506 and
  the put ≈ 5.5735, and their difference ≈ 4.8771 is the forward price 100 − 100 e^(−0.05).

*Needs:* §2.2, §3.2; StochasticCalculus §5.1 (Itô's formula); Tau Ceti
`TauCeti.BlackScholes.callValue`, `TauCeti.BlackScholes.putValue`, `TauCeti.BlackScholes.callValue_pde`,
`TauCeti.BlackScholes.putValue_pde`, `TauCeti.BlackScholes.deriv_callPrice_spot_mem_Ioo`,
`TauCeti.BlackScholes.deriv_putPrice_spot_mem_Ioo`, `TauCeti.BlackScholes.hedgeBondHolding_callPrice`,
`TauCeti.BlackScholes.hedgeBondHolding_putPrice`,
`TauCeti.Probability.IsFilteredPreBrownianReal.martingale_discounted_callValue_tilted`,
`TauCeti.Probability.IsFilteredPreBrownianReal.memLp_discounted_callValue_tilted`,
`TauCeti.Probability.IsFilteredPreBrownianReal.martingale_discounted_putValue_tilted`,
`TauCeti.Probability.IsFilteredPreBrownianReal.memLp_discounted_putValue_tilted`,
`TauCeti.BlackScholes.tendsto_callValue_geometricBrownianMotion`,
`TauCeti.BlackScholes.tendsto_putValue_geometricBrownianMotion`.

### 4.2 Uniqueness in the linear-growth class

Prove `eq_callValue_of_pde`: let V(s, t) be continuous on the closed domain s ≥ 0, 0 ≤ t ≤ T,
twice continuously differentiable in s and differentiable in t on the open domain s > 0,
0 < t < T, without joint continuity of the derivatives, a solution of the Black–Scholes equation
`V_t + (σ²s²/2) V_ss + r(sV_s − V) = 0` there, with `|V(s, t)| ≤ A(1 + s)` on the closed domain and
terminal value V(s, T) = (s − K)⁺. Then V(s, t) = C(s, t) on the closed domain. Prove
`eq_putValue_of_pde`, the same with terminal value (K − s)⁺ and conclusion V = P. A solution with a
right time derivative at t = 0 is a solution on the open domain, so it is covered.

*Route:* the difference D = V − C is in the same class with terminal value 0
(`TauCeti.BlackScholes.callValue_pde`, `TauCeti.BlackScholes.continuous_callValue`,
`TauCeti.BlackScholes.callValue_le`). Put `v(y, τ) = D(e^y, T − τ)/(1 + e^y)`. Then |v| ≤ A + 1,
since 0 ≤ C ≤ s, v(·, 0) = 0, and with ρ = e^y/(1 + e^y) the equation becomes
`v_τ = (σ²/2) v_yy + (r − σ²/2 + σ²ρ) v_y − r(1 − ρ) v` for 0 < τ < T, with diffusion σ²/2, drift
of absolute value at most |r| + σ²/2 and zeroth-order coefficient at most |r|. Tau Ceti's
uniqueness theorem for the Cauchy problem on the whole space among classical solutions with bounded
difference (`TauCeti.PDE.eqOn_of_deriv_sub_sum_mul_fderiv_fderiv_add_fderiv_add_mul_eq_of_eqOn_initial`,
on `EuclideanSpace ℝ (Fin 1)`) gives v = 0, so D = 0 for s > 0, and continuity gives D = 0 at s = 0.
A second route is stochastic and needs V of class C^(2,1) (Convention 8) for Itô's formula. Fix
s > 0 and 0 < t < T, and let S be the geometric Brownian
motion with drift r started at s at time t. Apply Itô's formula to `e^(−ru) D(S_u, u)` up to the
exit of S from [1/n, n] and the time T − ε, where the derivatives of D are bounded; the drift
vanishes by the equation, so `e^(−rt) D(s, t)` is the expectation of the stopped discounted value.
Let n → ∞ and then ε → 0: S neither reaches 0 nor explodes, `|D(S_u, u)| ≤ A'(1 + sup_u S_u)` with
the supremum integrable by the moments of geometric Brownian motion and Doob's inequality, and
uniform integrability gives `D(s, t) = e^(−r(T−t)) E[D(S_T, T)] = 0`. Continuity extends the
identity to s = 0 and to t = 0. Neither route uses a maximum principle on a bounded domain in place
of a uniqueness theorem on the unbounded one, and neither applies StochasticCalculus §10.3's
polynomial-growth Feynman–Kac theorem on ℝ^d to the log-spot form, where the class grows
exponentially.

**Checks.**

- The call and the put are in the class: 0 ≤ C ≤ s and 0 ≤ P ≤ K e^(−r(T−t)), both continuous on
  the closed domain and solutions in the interior.
- The forward V(s, t) = s − K e^(−r(T−t)) is in the class with terminal value s − K; since
  s − K = (s − K)⁺ − (K − s)⁺, the route applied to V − (C − P) gives V = C − P, put–call parity.
  With e^(+r(T−t)) in place of e^(−r(T−t)) the operator would be 2rK e^(r(T−t)), not 0, for r ≠ 0.
- The class cannot be dropped. The substitution `y = log s + (r − σ²/2)(T − t)`,
  `u = e^(r(T−t)) V` turns the equation into the heat equation `u_τ = (σ²/2) u_yy` in τ = T − t, and
  Tychonoff's nonzero solution of the heat equation with zero initial values gives a nonzero
  classical solution with terminal value 0. Added to C it gives a second solution with terminal
  value (s − K)⁺, so it is outside the class.

*Needs:* Tau Ceti `TauCeti.BlackScholes.callValue`, `TauCeti.BlackScholes.putValue`,
`TauCeti.BlackScholes.callValue_pde`, `TauCeti.BlackScholes.putValue_pde`,
`TauCeti.BlackScholes.continuous_callValue`, `TauCeti.BlackScholes.continuous_putValue`,
`TauCeti.BlackScholes.callValue_maturity_zero`, `TauCeti.BlackScholes.putValue_maturity_zero`,
`TauCeti.BlackScholes.callValue_nonneg`, `TauCeti.BlackScholes.callValue_le`,
`TauCeti.BlackScholes.putValue_nonneg`, `TauCeti.BlackScholes.putValue_le`,
`TauCeti.PDE.eqOn_of_deriv_sub_sum_mul_fderiv_fderiv_add_fderiv_add_mul_eq_of_eqOn_initial`; Mathlib
`deriv`, `ContDiffOn`, `ContinuousOn`. The stochastic route needs in addition §1.1,
StochasticCalculus §5.1 (Itô's formula), §2.2 (Doob's inequality, uniform integrability) and §9.4
(moments of geometric Brownian motion), and Tau Ceti
`ProbabilityTheory.IsPreBrownianReal.memLp_geometricBrownianMotion`.

### 4.3 Boundary values, the Greeks and their limits at maturity

Throughout, s > 0 and τ = T − t > 0 unless said otherwise, and the Greeks are derivatives of the
closed forms of §4.0 (Shreve 2004, §4.5).

- **Boundary at zero spot.** C(0, t) = 0 and P(0, t) = K e^(−rτ), and the closed forms tend to these
  values as s → 0⁺.
  *In Tau Ceti:* `TauCeti.BlackScholes.callValue_spot_zero`, `TauCeti.BlackScholes.putValue_spot_zero`, `TauCeti.BlackScholes.tendsto_callPrice_spot_zero`, `TauCeti.BlackScholes.tendsto_putPrice_spot_zero`.
- **Far field.** As s → ∞, `C(s, t) − s + K e^(−rτ) → 0` and P(s, t) → 0.
  *In Tau Ceti:* `TauCeti.BlackScholes.tendsto_callPrice_sub_spot_atTop`, `TauCeti.BlackScholes.tendsto_putPrice_spot_atTop`.
- **Bounds.** On the closed domain s ≥ 0, 0 ≤ t ≤ T, `0 ≤ C(s, t) ≤ s` and
  `0 ≤ P(s, t) ≤ K e^(−r(T−t))`.
  *In Tau Ceti:* `TauCeti.BlackScholes.callValue_nonneg`, `TauCeti.BlackScholes.callValue_le`, `TauCeti.BlackScholes.putValue_nonneg`, `TauCeti.BlackScholes.putValue_le`.
- **Deltas.** `∂C/∂s = Φ(d₊)`, with 0 < ∂C/∂s < 1, and `∂P/∂s = −Φ(−d₊)`, with −1 < ∂P/∂s < 0.
  *In Tau Ceti:* `TauCeti.BlackScholes.hasDerivAt_callPrice_spot`, `TauCeti.BlackScholes.deriv_callPrice_spot`, `TauCeti.BlackScholes.deriv_callPrice_spot_mem_Ioo`, `TauCeti.BlackScholes.hasDerivAt_putPrice_spot`, `TauCeti.BlackScholes.deriv_putPrice_spot`, `TauCeti.BlackScholes.deriv_putPrice_spot_mem_Ioo`.
- **Bond holdings.** For a bond price β > 0, the bond holding `(C − s ∂C/∂s)/β` of the call's delta
  hedge is `−K e^(−rτ) Φ(d₋)/β < 0`, and that of the put, `(P − s ∂P/∂s)/β`, is
  `K e^(−rτ) Φ(−d₋)/β > 0`.
  *In Tau Ceti:* `TauCeti.BlackScholes.hedgeBondHolding_callPrice`, `TauCeti.BlackScholes.hedgeBondHolding_callPrice_neg`, `TauCeti.BlackScholes.hedgeBondHolding_putPrice`, `TauCeti.BlackScholes.hedgeBondHolding_putPrice_pos`.
- **Gamma and vega.** `∂²C/∂s² = ∂²P/∂s² = φ(d₊)/(sσ√τ) > 0` and, as functions of the volatility,
  `∂C/∂σ = ∂P/∂σ = s φ(d₊) √τ > 0`.
  *In Tau Ceti:* `TauCeti.BlackScholes.hasDerivAt_deriv_callPrice_spot`, `TauCeti.BlackScholes.deriv_deriv_callPrice_spot_pos`, `TauCeti.BlackScholes.hasDerivAt_deriv_putPrice_spot`, `TauCeti.BlackScholes.deriv_deriv_putPrice_spot`, `TauCeti.BlackScholes.deriv_deriv_putPrice_spot_pos`, `TauCeti.BlackScholes.hasDerivAt_callPrice_volatility`, `TauCeti.BlackScholes.deriv_callPrice_volatility_pos`, `TauCeti.BlackScholes.hasDerivAt_putPrice_volatility`, `TauCeti.BlackScholes.deriv_putPrice_volatility_pos`.
- **Limits at maturity.** Fix s > 0 and let τ ↓ 0. The call delta tends to 1 if s > K, to 0 if
  s < K and to 1/2 at s = K; the put delta tends to 0, −1 and −1/2 respectively. For s ≠ K the call
  and put gamma tend to 0. At s = K the gamma tends to +∞, with
  `√τ · ∂²C/∂s²(K, T − τ) → 1/(Kσ√(2π))`, so it has no finite pointwise terminal value at the
  strike; the same holds for the put. The call and put vega tend to 0 at every s > 0.
  *In Tau Ceti:* `TauCeti.BlackScholes.tendsto_deriv_callPrice_spot_maturity_zero_of_strike_lt`, `TauCeti.BlackScholes.tendsto_deriv_callPrice_spot_maturity_zero_of_lt_strike`, `TauCeti.BlackScholes.tendsto_deriv_callPrice_spot_strike`, `TauCeti.BlackScholes.tendsto_deriv_putPrice_spot_maturity_zero_of_lt_strike`, `TauCeti.BlackScholes.tendsto_deriv_putPrice_spot_maturity_zero_of_strike_lt`, `TauCeti.BlackScholes.tendsto_deriv_putPrice_spot_strike`, `TauCeti.BlackScholes.tendsto_deriv_deriv_callPrice_spot_maturity_zero`, `TauCeti.BlackScholes.tendsto_deriv_deriv_callPrice_spot_strike_atTop`, `TauCeti.BlackScholes.tendsto_sqrt_mul_deriv_deriv_callPrice_spot_strike`, `TauCeti.BlackScholes.tendsto_deriv_deriv_putPrice_spot_maturity_zero`, `TauCeti.BlackScholes.tendsto_deriv_deriv_putPrice_spot_strike_atTop`, `TauCeti.BlackScholes.tendsto_sqrt_mul_deriv_deriv_putPrice_spot_strike`, `TauCeti.BlackScholes.tendsto_deriv_callPrice_volatility_maturity_zero`, `TauCeti.BlackScholes.tendsto_deriv_putPrice_volatility_maturity_zero`.

Substituting zero feedback into MarketImpact's pricing equations returns the equation of §4.0
algebraically; a limit in the feedback parameter needs in addition MarketImpact's
solution-dependence theorem.

**Checks.**

- At s = K = 100, r = 0.05, σ = 0.2 and τ = 1, φ(0.35) ≈ 0.3752, so gamma ≈ 0.3752/20 ≈ 0.01876 and
  vega ≈ 100 · 0.3752 ≈ 37.52. Writing gamma with φ(d₋) = φ(0.15) ≈ 0.3945 in place of φ(d₊) gives
  ≈ 0.01972, which is not the second derivative; the correct identity relating the two is
  `s φ(d₊) = K e^(−rτ) φ(d₋)`, here `37.52 ≈ 95.12 · 0.3945`.
- The deltas differ by one, `∂C/∂s − ∂P/∂s = Φ(d₊) + Φ(−d₊) = 1`, the derivative of parity; the
  bond holdings differ by `−K e^(−rτ)/β`, the bond leg of the forward.

*Needs:* §4.0; Mathlib `deriv`, `HasDerivAt`, `Filter.Tendsto`, `ProbabilityTheory.gaussianPDFReal`.

### Examples

- At s = K = 100, r = 0.05, σ = 0.2 and T = 1 the call hedge at time 0 holds Φ(0.35) ≈ 0.6368
  shares, worth ≈ 63.68, and a bond position worth −100 e^(−0.05) Φ(0.15) ≈ −53.23; its wealth is
  ≈ 10.4506, the call price.
- For s ≠ K, as t ↑ T the call delta tends to 1 if s > K and to 0 if s < K, and gamma tends to 0;
  at s = K the delta tends to 1/2 and gamma blows up like 1/(Kσ√(2π(T − t))).

### Dependencies

M0.1–M0.3. StochasticCalculus §2.2, §5.1 and §9.4. Tau Ceti: the Black–Scholes closed forms, their
extensions, Greeks, limits, conditional prices and value processes, the Gaussian distribution
function, and uniqueness for the Cauchy problem on the whole space. Mathlib: the standard Gaussian
measure and its distribution function, derivatives and continuity.

## Downstream consumers

- [MarketImpact](MarketImpact/README.md), a sub-roadmap of this one, consumes the asset model and
  self-financing strategies of M0.1, the density and representation contracts of M0.2, the
  price-admissibility criterion of §3.2, and the baseline call, put, gamma and vega of §4.0 and
  §4.3.
- [StochasticCalculus](../StochasticCalculus/README.md) names this roadmap as the consumer of its
  progressive-coefficient linear equation (§9.4) for the asset model of §1.1.

## Scope and ownership

**This roadmap owns** the bond, the asset model built on the linear equation and continuous-time
self-financing strategies, with the simple-strategy formula (M0.1); the risk-neutral measure for
constant coefficients, predictable representation under it, the admissible class, completeness and
pricing, the law of one price, arbitrage and its absence, and the static-claim extension, for
constant and for progressive coefficients (M0.2); the pricing equation as a necessary condition and
the drift identity of the delta hedge, the price-admissibility and growth criteria, existence and
uniqueness of prices in the weighted Hölder class, the log-spot form of the operator and the
identification of these prices with the replication price (M0.3); and the Black–Scholes closed
forms with their analytic theory, replication and uniqueness for the call and put (M0.4). Trading,
self-financing and admissibility are this roadmap's contracts, not StochasticCalculus's.
MarketImpact and StochasticCalculus cite the milestones by the labels M0.1–M0.4.

**Already in the library and used above by name.**

- Tau Ceti: the declarations realising this roadmap's own items are named in the milestones above.
  Besides them it uses Brownian motion relative to a filtration; geometric Brownian motion, its law
  and moments; the derivatives of the sigmoid; the parabolic Hölder spaces on a slab, the bounded
  `C^(2,α)` spaces of the terminal data and uniqueness for the backward terminal-value problem in
  the parabolic Hölder class; and uniqueness for the Cauchy problem on the whole space among
  classical solutions with bounded difference.
- Mathlib: Brownian motion as a predicate on laws and with continuous paths, natural filtrations
  and their right-continuous regularization, predictable processes, martingales, tilted measures,
  the standard Gaussian density and distribution function, Hölder functions.

**Owned elsewhere and consumed here.**

- [StochasticCalculus](../StochasticCalculus/README.md): versions, indistinguishability and
  progressive measurability (§0.2), the stochastic integral and its localization and predictable
  versions (§3.2–§3.4), Doob's inequalities and uniform integrability (§2.2), continuous
  semimartingale decompositions (§4.1, §4.3), Itô's formula (§5.1), stochastic exponentials and
  Novikov's criterion (§5.4), augmentation of the natural Brownian filtration and L² martingale
  representation (§6.1), density martingales and the Bayes formula (§7.3), Girsanov's theorem on a
  finite horizon (§7.4), strong solutions (§9.1) and the progressive-coefficient linear equation
  (§9.4). Its Feynman–Kac theorem (§10.3) is not used for the exponentially growing log-spot form.
- [PDE](../PDE/README.md): the backward terminal-data isomorphism for variable coefficients (§6.6)
  and spatial-weight transport (§6.9).

**Owned elsewhere and not consumed here.**

- [StandardDistributions](../StandardDistributions/README.md): the analytic theory of the Gaussian
  distribution function; the identities used here are in Mathlib and Tau Ceti.
- [MarketImpact](MarketImpact/README.md): endogenous demand, equilibrium feedback, coupled pricing,
  perturbation, its noncompact minimum principle, nonlinear existence and volatility fitting. The
  substitution of zero feedback into its equations, which returns the Black–Scholes equation, is
  algebraic; a limit in the feedback parameter needs MarketImpact's solution-dependence theorem.

## Exact supplier contracts

### From Mathlib

- `ProbabilityTheory.IsPreBrownianReal` (finite-dimensional laws of Brownian motion) and
  `ProbabilityTheory.IsBrownianReal` (with almost surely continuous paths),
  `Mathlib/Probability/BrownianMotion/Basic.lean`.
- `MeasureTheory.Filtration.natural` and `MeasureTheory.Filtration.rightCont`
  (`Mathlib/Probability/Process/Filtration.lean`); `MeasureTheory.IsStronglyPredictable`
  (`Mathlib/Probability/Process/Predictable.lean`); `MeasureTheory.Martingale`; `MeasureTheory.MemLp`.
- `MeasureTheory.Measure.tilted`, with `MeasureTheory.isProbabilityMeasure_tilted` (a probability
  measure when the exponential is integrable), `MeasureTheory.tilted_absolutelyContinuous` and
  `MeasureTheory.absolutelyContinuous_tilted` (equivalence to the base measure under the same
  integrability), `Mathlib/MeasureTheory/Measure/Tilted.lean`.
- `ProbabilityTheory.gaussianReal`, `ProbabilityTheory.gaussianPDFReal` and
  `ProbabilityTheory.integral_gaussianPDFReal_eq_one` (nonzero variance),
  `Mathlib/Probability/Distributions/Gaussian/Real.lean`; `ProbabilityTheory.cdf`,
  `ProbabilityTheory.tendsto_cdf_atBot`, `ProbabilityTheory.tendsto_cdf_atTop`,
  `Mathlib/Probability/CDF.lean`.
- `deriv`, `ContDiffOn`, `ContinuousOn` and `posPart`, for the statements of §4.2.
- `MemHolder` (`Mathlib/Topology/MetricSpace/HolderNorm.lean`) and `HolderOnWith`
  (`Mathlib/Topology/MetricSpace/Holder.lean`), for the coefficient hypotheses of §3.3.

### From Tau Ceti

- The declarations that realise this roadmap's own items (the bond, simple strategies and their
  self-financing formula, arbitrage and the static-claim cash flows, the constant-drift change of
  measure, the drift identity of the delta hedge, the log-spot form of the operator, and the
  Black–Scholes closed forms with their analytic theory, conditional prices and value processes)
  are named in the milestones above, on their *In Tau Ceti* lines and in the routes of §1.2, §2.3,
  §4.1 and §4.2. The declarations below are consumed as stated.
- `TauCeti/Analysis/SpecialFunctions/Sigmoid.lean`: `Real.iteratedDeriv_succ_log_one_add_exp`,
  `Real.memHolder_iteratedDeriv_sigmoid`.
- `TauCeti/Analysis/PDE/Parabolic/SpaceTime/Basic.lean`: `TauCeti.ParabolicSpaceTime.slab`, the slab
  E × [a, b] with the parabolic distance `dist x y + √|t − s|`.
- `TauCeti/Analysis/Holder/Iterated.lean`: `TauCeti.CkHolderSpace` (bounded `C^k` maps with bounded
  derivatives through order k and an α-Hölder k-th derivative).
- `TauCeti/Analysis/PDE/Parabolic/Holder/Two.lean`: `TauCeti.ParabolicC2HolderSpace` (bounded maps on
  a nondegenerate closed slab with bounded continuous spatial gradient and parabolically α-Hölder
  spatial Hessian and time derivative, the time derivative taken within [a, b]) and
  `TauCeti.ParabolicC2HolderSpace.timeExtension` (the time slices extended constantly outside [a, b]).
- `TauCeti/Analysis/PDE/Parabolic/Holder/Backward.lean`:
  `TauCeti.ParabolicC2HolderSpace.eq_of_euclideanBackwardParabolicOperatorL_eq` (scalar coefficients
  in the parabolic Hölder space on `EuclideanSpace ℝ ι`, degenerate elliptic second-order part).
- `TauCeti/Analysis/PDE/MaximumPrinciple/Parabolic/WholeSpace.lean`:
  `TauCeti.PDE.eqOn_of_deriv_sub_sum_mul_fderiv_fderiv_add_fderiv_add_mul_eq_of_eqOn_initial`
  (degenerate elliptic a with `tr a ≤ Λ(1 + ‖x‖²)`, `‖b‖ ≤ β(1 + ‖x‖)`, `c ≤ γ`, no regularity of the
  coefficients; classical solutions continuous on [0, T] × ℝⁿ with bounded difference).
- `TauCeti/Probability/BrownianMotion/Filtered.lean`: `TauCeti.Probability.IsFilteredPreBrownianReal`
  (pre-Brownian, adapted, increments independent of the past).
- `TauCeti/Probability/BrownianMotion/Geometric.lean`: `TauCeti.Probability.geometricBrownianMotion`,
  `ProbabilityTheory.IsPreBrownianReal.memLp_geometricBrownianMotion` (every finite p).
- `TauCeti/Probability/Process/Filtration/NullAugmentation.lean`: `MeasureTheory.Filtration.nullAugment`
  (Convention 4).

### From TauCetiRoadmap.StochasticCalculus

§0.2 (versions, indistinguishability, progressive measurability), §2.2 (Doob's inequalities, class
DL), §3.2–§3.4 (the stochastic integral of predictable integrands, its continuous version,
congruence, localization and predictable versions of progressive integrands), §4.1 and §4.3
(uniqueness of the decomposition of a continuous semimartingale), §5.1 (Itô's formula and the
product rule), §5.4 (stochastic exponentials, Novikov's criterion), §6.1 (augmentation of the
natural Brownian filtration, L² martingale representation in it), §7.3 (density martingales, the
Bayes formula), §7.4 (Girsanov's theorem on a finite horizon), §9.1 (strong solutions of stochastic
differential equations) and §9.4 (the progressive-coefficient linear equation, its explicit
solution, uniqueness and positivity, the Gaussian law of log S_t for deterministic coefficients, and
the moments of geometric Brownian motion). Assumed as stated there.

### From TauCetiRoadmap.PDE

§6.6 (existence and uniqueness for variable coefficients, the backward terminal-data isomorphism)
and §6.9 (spatial weights with bounded Hölder logarithmic derivatives). Assumed as stated there.

## References

- F. Black, M. Scholes, *The pricing of options and corporate liabilities*, J. Polit. Econ. 81
  (1973), 637–654.
- J. M. Harrison, S. R. Pliska, *Martingales and stochastic integrals in the theory of continuous
  trading*, Stochastic Process. Appl. 11 (1981), 215–260.
- I. Karatzas, S. E. Shreve, *Methods of Mathematical Finance*, Springer, 1998.
- S. E. Shreve, *Stochastic Calculus for Finance II: Continuous-Time Models*, Springer, 2004.

The hypotheses of every statement above are this roadmap's own formulation; in particular the
coefficient bounds of §2.4, the growth criterion of §3.2 and the classes of §3.3 and §4.2 are
formulated here for the library. Harrison–Pliska is the classical source of completeness and
martingale pricing in continuous trading, Black–Scholes of the call price and its hedge, and
Karatzas–Shreve and Shreve are textbook treatments of the continuous-time market.
