# Roadmap: discrete-time finance

**Summary.** This roadmap develops arbitrage pricing for a market of `d` risky assets and a
numéraire on a finite probability space, trading at the dates `0, 1, …, T`. Prices are
measured in units of the numéraire (discounted), holdings are chosen at the start of each
period with the information available then, and the gains of a strategy are the sum over the
periods of its holdings times the price increments. An arbitrage is a strategy that costs
nothing, never loses, and gains with positive probability. The information structure is an
arbitrary filtration, and the reference measure may give zero mass to some points.

The headline theorems are these.

- *The first fundamental theorem.* The market admits no arbitrage if and only if there is a
  probability measure with the same null sets as the reference measure under which the
  discounted prices are a martingale (an equivalent martingale measure).
- *The second fundamental theorem.* Without arbitrage, every claim known at the horizon can be
  replicated exactly from a constant initial capital if and only if all equivalent martingale
  measures agree on the information available at the horizon.
- *Superhedging duality.* Without arbitrage, the least initial capital from which some strategy
  dominates a claim almost surely exists and equals the largest expectation of the claim over the
  martingale measures absolutely continuous with respect to the reference measure; over the
  equivalent ones it is only a supremum. The expectations over the equivalent martingale measures
  form a single point, exactly when the claim is attainable, or an open interval.
- *The optional decomposition.* Without arbitrage, an adapted process is a supermartingale under
  every equivalent martingale measure if and only if it is its initial value plus the gains of
  some strategy minus an adapted nondecreasing process.
- *The binomial tree and American claims.* In the Cox–Ross–Rubinstein tree with discounted
  returns `a < b` and every path charged, there is no arbitrage if and only if `a < 0 < b`, and
  then, for `a > −1`, the only equivalent martingale measure makes the moves independent with
  up-probability `−a/(b − a)`. In a complete market the least capital that superhedges an
  American claim at every date is the mean of its Snell envelope at time `0` under the
  equivalent martingale measure, and a superhedge
  from that capital replicates the payoff at the first time the envelope meets it.

The roadmap builds on Tau Ceti's finance library, whose arbitrage predicate and elementary
gains of simple strategies are the carrier here and whose one-stock no-arbitrage theorem is the
easy half of the first theorem for one asset; on Tau Ceti's theorems of the alternative (Stiemke,
Tucker), which replace separation arguments; on Mathlib's martingales, conditional expectation
and Doob decomposition; and, for the American layer only, on OptimalStopping, which supplies the
Snell envelope. FinancialMathematics treats a continuous-time market; nothing passes between it
and this roadmap.

Layer 1 below sets up the market and proves the first fundamental theorem; Layer 2 treats
completeness; Layer 3 superhedging, price intervals and the optional decomposition; Layer 4 the
Cox–Ross–Rubinstein tree; Layer 5 American claims. Only Layer 5 uses OptimalStopping.

## Conventions

- **The space.** `Ω` is a type with a measurable space, finite in every theorem (`[Finite Ω]`).
  Singletons need not be measurable, except in 3.2 and 3.3, which assume
  `[MeasurableSingletonClass Ω]` because their claim is an arbitrary function, and in the tree of
  Layer 4, whose σ-algebra is discrete.
- **The reference measure.** `P` is any measure; the theorems that need mass assume
  `[IsProbabilityMeasure P]`. A point `ω` is *charged* when `P {ω} ≠ 0` (the outer measure when
  `{ω}` is not measurable). Null points are allowed throughout, and "almost surely" is `=ᵐ[P]` or
  `≤ᵐ[P]`. This is more general than the sources, which assume that every point has positive mass
  and that every set is measurable.
- **Information.** A filtration is Mathlib's `MeasureTheory.Filtration ℕ`. `ℱ 0` need not be
  trivial and `ℱ T` need not be the whole σ-algebra; triviality of `ℱ 0` is assumed only in 3.4.
  The horizon `T` may be `0`, and `d` may be `0` (no risky asset; the gains are `0`).
- **Prices: discounted.** `X : ℕ → Ω → Fin d → ℝ` is the vector of discounted prices: if the
  assets cost `Ŝ t` and the numéraire `Ŝ⁰ t > 0`, then `X t = Ŝ t / Ŝ⁰ t`. Statements assume only
  `StronglyMeasurable[ℱ t] (X t)` for `t ≤ T`; values after `T` play no role, because martingale
  measures stop the process at `T`. The reduction of the undiscounted one-stock market of Tau Ceti
  to this form is 1.5.
- **Holdings: Tau Ceti's indexing.** Holdings are `H : ℕ → Ω → Fin d → ℝ` with
  `StronglyAdapted ℱ H`, and `H s` is held over the period `(s, s + 1]`. This is Tau Ceti's
  convention for simple strategies (holdings chosen at the trading date `τ j` for `(τ j, τ (j+1)]`)
  with `τ = id`. In Cuchiero's notes `H_t` is `F_{t−1}`-measurable and held from `t − 1` to `t`;
  her `H_t` is `H (t − 1)` here.
- **Arbitrage: Tau Ceti's predicate.** `TauCeti.Finance.IsArbitrage P v V` says that the cost `v`
  is `0` almost surely, the payoff `V` is nonnegative almost surely and `P {0 < V} > 0`. In
  discounted units the cost of gains is `0`, so no arbitrage is the absence of adapted holdings
  whose terminal gains form an arbitrage of cost `0`. In the undiscounted market of 1.5 the cost
  must be `0` almost surely, not merely `≤ 0`.
- **Junk values.** The Bochner integral of a non-measurable function on a finite space may differ
  from its sum against the point masses, and `x / 0 = 0`. Each statement carries the hypothesis
  that excludes such a value where it matters, with a Check.
- **The tree.** Layer 4 uses discounted returns. With a bank account `(1 + r)^t` and gross moves
  `u > d` of the undiscounted price, `1 + b = u/(1 + r)` and `1 + a = d/(1 + r)`, so `a < 0 < b`
  iff `d < 1 + r < u`, and the up-probability `−a/(b − a)` is `(1 + r − d)/(u − d)`.

## Layer 1: the market and the first fundamental theorem

### 1.1 Gains and arbitrage

Define `gains X H t ω`, the discounted gains up to time `t`, as the sum over the assets `i` of
Tau Ceti's elementary integral `TauCeti.Finance.simpleGains id t (H · · i) (X · · i) t ω`. By
`TauCeti.Finance.simpleGains_apply_eq_sum` (with `MonotoneOn id`) it equals
`∑_{s < t} ⟨H s ω, X (s + 1) ω − X s ω⟩`, the discrete stochastic integral. For `d = 1` it is
Tau Ceti's elementary integral itself.

Define `NoArbitrage P ℱ X T`: no holdings `H` with `StronglyAdapted ℱ H` make
`TauCeti.Finance.IsArbitrage P 0 (gains X H T)` true. Unfolded, `gains X H T ≥ 0` almost surely
implies `P {0 < gains X H T} = 0` (Cuchiero, Definition 2.2.1, under her Assumption 1; there the
holdings are predictable in her indexing).

**Checks.**
- `gains X H 1 = ⟨H 0, X 1 − X 0⟩` and `gains X H 0 = 0`. The indexing of Cuchiero's notes, with
  `H 1` held over the first period, would give `⟨H 1, X 1 − X 0⟩`.
- One period, `Ω = {u, d}` charged, `X 1 − X 0 = (1, −1)`: the gains `(h, −h)` are never
  nonnegative and nonzero, so there is no arbitrage. With `X 1 − X 0 = (1, 2)` the holding `h = 1`
  is an arbitrage.
- Null points matter: with `P = (1/2, 1/2, 0)` on three points, `ℱ 0` trivial, `ℱ 1` everything
  and `X 1 − X 0 = (0, 0, 5)`, there is no arbitrage, since the gains `(0, 0, 5h)` vanish almost
  surely; the reading "no nonzero gains that are nonnegative at every point" would call `h = 1` an
  arbitrage.

*Needs:* Tau Ceti `TauCeti.Finance.simpleGains`, `TauCeti.Finance.simpleGains_apply_eq_sum`,
`TauCeti.Finance.IsArbitrage`. (Definitions.)

### 1.2 Martingale measures

Define `martingaleMeasures P ℱ X T`, the set of probability measures `Q` with `Q ≪ P` under which
`fun t => X (min t T)` is a Mathlib `Martingale` for `ℱ` (values in `Fin d → ℝ`, so one
martingale for the vector; Mathlib's `Martingale` includes adaptedness, and integrability
follows from it), and
`equivMartingaleMeasures P ℱ X T`, its elements with also `P ≪ Q` (Cuchiero, Definition 2.2.13,
where `Ma` and `Me` are written for these sets). Both sets are convex; the martingale condition
amounts to `∫_A (X (t + 1) − X t) dQ = 0` for `t < T` and `A ∈ ℱ t`, together with adaptedness.

**Checks.**
- The stop at `T` matters: with `T = 0`, a trivial filtration and the deterministic prices
  `X t = t`, every probability `Q ≪ P` is a martingale measure, while `X` itself is a martingale
  under no probability measure.
- Equivalence matters: with `P = (1/2, 1/2, 0)` and `X 1 − X 0 = (1, 2, −1)`, the measure
  `(1/5, 1/5, 3/5)` makes the increment mean zero but charges the null point, so it is not in
  either set; every measure `Q ≪ P` gives the increment the mean `Q₁ + 2Q₂ > 0`, so both sets are
  empty, and indeed `h = 1` is an arbitrage under `P`.

*Needs:* Mathlib `Martingale`, `MeasureTheory.Measure.AbsolutelyContinuous`. (Definitions.)

### 1.3 Pricing attainable claims

Prove `integral_eq_and_condExp_eq_of_attainable`: on a finite `Ω`, if `Q` is a martingale
measure, `H` is adapted and the claim `f` equals `a + gains X H T` almost surely under `P`, then
`∫ f dQ = a` and `Q[f | ℱ t] = a + gains X H t` `Q`-almost surely for every `t ≤ T`. Neither
absence of arbitrage, nor equivalence of `Q`, nor measurability of `f` is assumed: `f` is almost
surely equal to the `ℱ T`-measurable function `a + gains X H T`. (Cuchiero, Corollary 2.2.18 and
Lemma 2.2.14; Grasselli, Corollary 1.2.8. Both state it under no arbitrage for equivalent
martingale measures, together with uniqueness of `a`; here it is stated for every absolutely
continuous martingale measure, which is what the later layers use. For one stock, Tau Ceti's
`TauCeti.Finance.IsSelfFinancing.condExp_discounted_wealth` gives the second identity for the
discounted wealth of a self-financing strategy; the `d`-asset form is not at the pin.)

Route: for each asset apply Tau Ceti's `TauCeti.Finance.condExp_simpleGains` with `τ = id` and
`n = T` (the coordinate of a vector martingale is a martingale, and on a finite space every
strongly measurable function has finite range and is integrable, `Integrable.of_bound`); for
`t ≤ T`, `simpleGains id T a Y t = simpleGains id t a Y t` by `simpleGains_apply_eq_sum`. Sum the
coordinates, transfer `f =ᵐ[P] …` to `Q` through `Q ≪ P` and `condExp_congr_ae`, and integrate
with `integral_condExp`.

**Checks.**
- For `f = gains X H T` and `a = 0` the statement says the gains have mean zero and are a
  `Q`-martingale up to `T`.
- Finiteness is needed: on `Ω = ℕ × {±1}` with `Q (n, ±1) = 2^(−n−2)`, `ℱ 0` generated by the
  first coordinate, `X 0 = 0`, `X 1 = ±1` the second coordinate and `H 0 = 2^n`, the measure `Q` is
  a martingale measure but `gains X H 1 = ±2^n` is not `Q`-integrable, so with `a = 1` the
  integral of `f = 1 + gains X H 1` is the junk value `0`, not `1`.

*Needs:* 1.1, 1.2; Tau Ceti `TauCeti.Finance.condExp_simpleGains`,
`TauCeti.Finance.simpleGains_apply_eq_sum`; Mathlib `condExp_congr_ae`, `integral_condExp`,
`Integrable.of_bound`. (Proved here.)

### 1.4 The first fundamental theorem

Prove `noArbitrage_iff_nonempty_equivMartingaleMeasures`: on a finite `Ω`, for a probability
measure `P` and prices with `X t` `ℱ t`-strongly measurable for `t ≤ T`, `NoArbitrage P ℱ X T`
holds iff `equivMartingaleMeasures P ℱ X T` is nonempty (Cuchiero, Theorem 2.2.16 with
Theorem 2.2.9 and Lemma 2.2.15; Grasselli, Theorem 1.2.7; both under full support and with
`F = F_T` the power set; here null points and an arbitrary filtration are allowed, and the hard
direction goes through Stiemke's lemma instead of a separating hyperplane). Tau Ceti's
`TauCeti.Finance.IsSelfFinancing.not_isArbitrage` proves the direction from a measure to no
arbitrage for one stock, with no finiteness of the space and along any monotone trading dates:
an equivalent `Q` making `S/β` a martingale along the dates excludes self-financing arbitrage
with `Q`-integrable trades. On a
finite space with `τ = id`, the case `d = 1` of that direction, composed with 1.5, is a special
case of it. What is new here is that direction for `d` assets and the converse, the existence of
an equivalent martingale measure.

Route.
- (⇐) Let `Q` be an equivalent martingale measure and `H` adapted. By 1.3 with `a = 0`,
  `∫ gains X H T dQ = 0`. An arbitrage under `P` is one under `Q`
  (`TauCeti.Finance.isArbitrage_iff_of_absolutelyContinuous`), and
  `TauCeti.Finance.IsArbitrage.integral_pos` would give `0 < 0`.
- (⇒) Let `ι` be the finite set of charged points and `K ⊆ (ι → ℝ)` the restrictions to `ι` of
  `gains X H T` over adapted `H`; gains are linear in `H` and adapted holdings form a module, so
  `K` is a subspace. No arbitrage says exactly that `K` meets the nonnegative orthant only in `0`:
  if `G ∈ K` is nonnegative on `ι` and positive at `ω ∈ ι`, then the measurable set `{G < 0}`
  contains no charged point and is `P`-null, and `P {0 < G} ≥ P {ω} > 0`.
- Tau Ceti `TauCeti.exists_pos_forall_sum_mul_eq_zero_iff` gives `w > 0` on `ι` orthogonal to `K`.
  Put `Q = ∑_{ω ∈ ι} (w ω / ∑ w) δ_ω`. Then `Q ≪ P` (a `P`-null measurable set contains no charged
  point) and `P ≪ Q` (a `Q`-null set contains only null points, and is null by finite
  subadditivity).
- For `t < T`, `A ∈ ℱ t` and an asset `i`, the holdings `1_A e_i` at time `t` and `0` at other
  times are adapted, and orthogonality gives `∫_A (X (t + 1) i − X t i) dQ = 0`. Hence
  `Q[X (t + 1) | ℱ t] = X t` (`ae_eq_condExp_of_forall_setIntegral_eq`), and `martingale_nat`
  gives the martingale property of `X (min · T)`, whose steps after `T` are constant.

**Checks.**
- One period on `{u, d}` with `X 1 − X 0 = (1, −1)` and `P` charging both points: the unique
  equivalent martingale measure is `(1/2, 1/2)`. With `X 1 − X 0 = (1, 2)`: an arbitrage, and no
  martingale measure.
- The measurability hypothesis is needed: with `T = 0`, two charged points, `ℱ 0` trivial and
  `X 0 = (0, 1)`, the gains vanish, so there is no arbitrage, but `X 0` is not adapted and no
  martingale measure exists.
- The probability hypothesis is needed: for `P = 0` there is no arbitrage, and no probability
  measure is absolutely continuous with respect to `0`.
- Null points (1.1, 1.2): for `P = (1/2, 1/2, 0)` and `X 1 − X 0 = (0, 0, 5)`, the measure `P`
  itself is an equivalent martingale measure, while no martingale measure charges all three
  points.
- `d = 0` or `T = 0` with `X 0` adapted: there is no arbitrage and `P` is an equivalent
  martingale measure. Redundant assets (`X` with two equal coordinates) need no hypothesis: the
  argument works with the subspace `K`.

*Needs:* 1.1, 1.2, 1.3; Tau Ceti `TauCeti.exists_pos_forall_sum_mul_eq_zero_iff`,
`TauCeti.Finance.isArbitrage_iff_of_absolutelyContinuous`,
`TauCeti.Finance.IsArbitrage.integral_pos`; Mathlib `ae_eq_condExp_of_forall_setIntegral_eq`,
`martingale_nat`, `Integrable.of_bound`.

### 1.5 The one-stock market of Tau Ceti

Prove `noArbitrage_div_iff_forall_isSelfFinancing`: for a stock `S` and a bond `β` with
`β t ω > 0` for `t ≤ n + 1`, the one-asset market with discounted price `S / β` has
`NoArbitrage` up to `n + 1` iff no strategy `(a, b)` with `a j` `ℱ j`-strongly measurable for
`j < n + 1` that is self-financing in Tau Ceti's sense,
`TauCeti.Finance.IsSelfFinancing id (n + 1) a b S β`, is an arbitrage from the cost
`a 0 S 0 + b 0 β 0` to the terminal wealth `a n S (n + 1) + b n β (n + 1)`. No finiteness, no
assumption on `P` and no measurability of `S`, `β` or `b` is needed. This is the reduction of the
undiscounted market with a numéraire to discounted prices (Cuchiero, Proposition 2.1.9 and
Remarks 2.1.11 and 2.2.2, for `d` assets and predictable strategies).

Route.
- (⇒) By `TauCeti.Finance.IsSelfFinancing.discounted_terminal_wealth_eq` (`τ = id`), the
  discounted terminal wealth is the discounted cost plus
  `simpleGains id (n + 1) a (S / β) (n + 1)`. The cost vanishes almost surely, so the discounted
  terminal wealth is almost surely `gains (S/β) H (n + 1)` with `H j = a j` for `j ≤ n` and `0`
  after. `TauCeti.Finance.isArbitrage_mul_iff` with the factors `β 0⁻¹` and `β (n + 1)⁻¹` moves an
  arbitrage from the wealth to the gains.
- (⇐) Given adapted `H`, take `a j = H j · 0` and `b = selfFinancingBond id 0 a S β`. Then
  `TauCeti.Finance.isSelfFinancing_selfFinancingBond`,
  `TauCeti.Finance.mul_add_mul_selfFinancingBond_zero` (the cost is exactly `0`) and the same
  identity apply.

**Checks.**
- Positivity of the bond is needed: on one point, with `β = (1, 0)` and `S = (1, 0)`, every
  terminal wealth is `0`, so no self-financing strategy is an arbitrage, while the junk discounted
  price `S 1 / β 1 = 0/0 = 0` falls from `1` to `0` and the holding `−1` gains `1`.
- The horizon is `n + 1 ≥ 1`: Tau Ceti's self-financing strategies of horizon `0` have no
  terminal portfolio.

*Needs:* 1.1; Tau Ceti `TauCeti.Finance.IsSelfFinancing`,
`TauCeti.Finance.IsSelfFinancing.discounted_terminal_wealth_eq`,
`TauCeti.Finance.selfFinancingBond`, `TauCeti.Finance.isSelfFinancing_selfFinancingBond`,
`TauCeti.Finance.mul_add_mul_selfFinancingBond_zero`, `TauCeti.Finance.isArbitrage_mul_iff`.
(Proved here.)

### Examples

One period on two points with increments `(1, −1)` and `(1, 2)`; the three-point markets with a
null point of 1.1, 1.2 and 1.4; the non-integrable gains on `ℕ × {±1}` of 1.3; the bond that
vanishes in 1.5.

### Dependencies

Tau Ceti `Probability/Finance/` (`IsArbitrage`, `simpleGains`, `IsSelfFinancing` and the lemmas
named above) and `Analysis/Convex/Stiemke.lean`; Mathlib martingales and conditional expectation
(`Martingale`, `martingale_nat`, `condExp_congr_ae`, `integral_condExp`,
`ae_eq_condExp_of_forall_setIntegral_eq`, `Integrable.of_bound`). No other layer.

## Layer 2: completeness

### 2.1 Complete markets and atoms

Define `IsCompleteMarket P ℱ X T`: for every `ℱ T`-strongly measurable `f : Ω → ℝ` there are a
constant `a : ℝ` and adapted holdings `H` with `f = a + gains X H T` almost surely (Cuchiero,
Definition 2.3.1, where every function is `F_T`-measurable). Define `atomOf m ω`, the
intersection of the `m`-measurable sets containing `ω`; on a finite space it is `m`-measurable,
and every `m`-measurable function is constant on it.

**Checks.**
- The price is a constant: with `T = 0`, two charged points and `ℱ 0` everything, the claim
  `(1, 2)` is not attainable at a constant price, so the market is not complete; an
  `ℱ 0`-measurable initial capital would replicate every claim, while the equivalent martingale
  measures (all `Q` charging both points) differ on `ℱ 0`, as 2.2 requires.
- `atomOf ⊥ ω` is all of `Ω`; in the tree of Layer 4, `atomOf (crrFiltration T 1) ω` is the set
  of paths with the same first move.

*Needs:* 1.1. (Definitions.)

### 2.2 The second fundamental theorem

Prove `isCompleteMarket_iff_subsingleton_trim`: on a finite `Ω`, for prices with `X t`
`ℱ t`-strongly measurable for `t ≤ T` and under `NoArbitrage P ℱ X T`, the market is complete
iff the restrictions `Q.trim (ℱ.le T)` of the equivalent martingale measures to `ℱ T` are all
equal. `P` is any measure: for `P = 0` both sides hold, and for `P ≠ 0` the set is nonempty under
no arbitrage (1.4 applied to the normalized sum of the point masses at the charged points, a
probability measure with the null sets of `P`, on which both sides depend only), so this says
that there is exactly one equivalent martingale measure on `ℱ T`; when `ℱ T` is the whole
σ-algebra the restriction is `Q` itself (`MeasureTheory.trim_eq_self`). (Cuchiero, Corollary
2.3.2 with Corollaries 2.2.25
and 2.2.26, under full support and `F = F_T` the power set; here null points, a nontrivial `ℱ 0`
and `ℱ T` smaller than the σ-algebra are allowed. Cuchiero's Proposition 2.2.24 rests on a
bipolar theorem that the notes state without proof; the route below needs only orthogonal
complements in a finite-dimensional space.)

Route: linear algebra on the charged atoms of `ℱ T`. Let `B₁, …, B_m` be the atoms of `ℱ T` that
contain a charged point, and identify `ℱ T`-measurable functions, up to null sets, with vectors in
`ℝ^m`. The gains `gains X H T` are `ℱ T`-measurable, so they form a subspace `K ⊆ ℝ^m`.
- A martingale measure `Q` gives the vector `z = (Q B_k)`, with `z ≥ 0`, `∑ z = 1` and `z ⟂ K`
  (1.3); an equivalent one gives `z > 0`. Conversely, every such `z` comes from a martingale
  measure: fix `Q*` equivalent (1.4, as above) and put `Q = ∑_k z_k Q* (· | B_k)`. The martingale
  identity of 1.2 involves only `ℱ T`-measurable integrands, so only `z` matters, and `z > 0` gives
  an equivalent measure. So the restrictions to `ℱ T` of the equivalent martingale measures are
  the vectors `z > 0` with `∑ z = 1` and `z ⟂ K`.
- These form a relatively open subset of the affine space `z* + (ℝ·1 + K)^⊥` through the vector
  `z*` of `Q*`: for `y ⟂ 1` and `y ⟂ K`, `z* + εy` is admissible for small `ε`. So there is only one
  iff `(ℝ·1 + K)^⊥ = 0`, iff `ℝ·1 + K = ℝ^m`, which is completeness.

**Checks.**
- The binomial tree of Layer 4 is complete (by 4.3 and this theorem); so is one period on two
  points with increment `(1, −1)`.
- The trinomial market: three charged points, `ℱ 0` trivial, `ℱ 1` everything, `X 0 = 1`,
  `X 1 − X 0 = (1, 0, −1)`. The martingale measures are `(s, 1 − 2s, s)` for `0 ≤ s ≤ 1/2`, the
  equivalent ones those with `0 < s < 1/2`, and the market is not complete: `1`, `X 1 − X 0` span a
  plane in `ℝ³`.
- Why the restriction to `ℱ T`: on `{1, 2, 3}` with `ℱ 1` generated by `{1}` and `{2, 3}` and
  increment `(1, −1, −1)`, the market is complete, while every `Q` with `Q {1} = 1/2` and
  `Q {2}, Q {3} > 0` is an equivalent martingale measure; uniqueness of `Q` itself would fail.
- No arbitrage is needed: three charged points with `ℱ 1` everything and increment `(1, 2, 3)`
  have an arbitrage and no equivalent martingale measure, so the right side holds, but the market
  is not complete.
- The measurability hypothesis is needed: on two charged points with `ℱ 0` trivial, `ℱ 1`
  everything, `X 0 = X 1 = (0, 1)`, there is no arbitrage and no martingale measure, and only the
  constants are attainable.
- `d = 0`: complete iff `ℱ T` has at most one charged atom; `T = 0`: complete iff every
  `ℱ 0`-measurable
  function is almost surely constant.

*Needs:* 1.2, 1.3, 1.4, 2.1; Mathlib `MeasureTheory.Measure.trim`, `MeasureTheory.trim_eq_self`.

### 2.3 Branching of complete markets

Prove `ncard_image_atomOf_le`: on a finite `Ω`, for adapted prices up to `T`, under
`NoArbitrage P ℱ X T` and `IsCompleteMarket P ℱ X T`, for `t < T` and every `ω₀`, the charged
points of the atom `atomOf (ℱ t) ω₀` lie in at most `d + 1` atoms of `ℱ (t + 1)`. By induction on
`t`, when `ℱ 0` is trivial, `ℱ T` has at most `(d + 1)^T` charged atoms. (Cuchiero,
Proposition 2.3.4, which assumes `F_0` trivial and proves the global bound by this induction
step; the local form needs no assumption on `ℱ 0`.)

Route: for `P = 0` the set counted is empty. Otherwise take an equivalent martingale measure `Q`
(1.4, applied as in 2.2 to a probability measure with the null sets of `P`) and an
`ℱ (t + 1)`-measurable claim `f`. By
completeness and 1.3, `f = V_t + ⟨H t, X (t + 1) − X t⟩` almost surely, with `V_t = Q[f | ℱ t]`,
and `V_t`, `H t` are constant on `atomOf (ℱ t) ω₀`. So, on the charged points of that atom, the
functions constant on the atoms of `ℱ (t + 1)` lie in a space of dimension at most `d + 1`, and the
count follows.

**Checks.**
- In the binomial tree each node has two children, `d + 1 = 2`.
- No arbitrage is needed: with `T = 2`, three charged points, `ℱ 0` trivial, `ℱ 1 = ℱ 2`
  everything and `X 2 − X 1 = 1`, the market is complete (the holding at time `1` replicates any
  claim) and has an arbitrage, and the atom of `ℱ 0` has three children.
- The measurability hypothesis is needed: with `T = 2`, three charged points, `ℱ 0 = ℱ 1`
  trivial, `ℱ 2` everything, `d = 1`, `X 1 − X 0 = (1, −1, 0)` and `X 2 − X 1 = (0, 1, −1)`, the
  gains
  are orthogonal to `(1, 1, 1)`, so there is no arbitrage; `1` and the two increments span `ℝ³`, so
  the market is complete; but `X 1` is not `ℱ 1`-measurable and the atom of `ℱ 1` has three
  children.

*Needs:* 1.3, 1.4, 2.1. (Proved here.)

### Examples

The two-point and trinomial one-period markets; the three-point market with a coarse `ℱ 1`; the
binomial tree; the complete market with arbitrage and the non-adapted complete market of 2.3.

### Dependencies

Layer 1 (1.2, 1.3, 1.4); Mathlib `MeasureTheory.Measure.trim`, `MeasureTheory.trim_eq_self`.

## Layer 3: superhedging and the optional decomposition

### 3.1 Superhedging prices

Define `superhedgingPrices P ℱ X T f`, the set of `a : ℝ` for which some adapted `H` gives
`f ≤ a + gains X H T` almost surely (Cuchiero, Remark 2.4.5).

**Checks.**
- In the trinomial market of 2.2 with the call `f = (X 1 − 1)⁺ = (1, 0, 0)`, the set is
  `[1/2, ∞)`: `a ≥ 0` at the middle point, and `a + h ≥ 1`, `a − h ≥ 0` force `a ≥ 1/2`, attained
  at `h = 1/2`.
- With an arbitrage the set can be all of `ℝ`: increment `(1, 2)` on two charged points and
  `h → ∞`.

*Needs:* 1.1. (Definition.)

### 3.2 Superhedging duality

Prove `superhedging_duality`: on a finite `Ω` with measurable singletons, for a probability
measure `P`, adapted prices up to `T`, `NoArbitrage P ℱ X T` and any `f : Ω → ℝ`, there is `π`
that is the least element of `superhedgingPrices P ℱ X T f`, the greatest element of the means
`∫ f dQ` over `martingaleMeasures P ℱ X T`, and the least upper bound of the means over
`equivMartingaleMeasures P ℱ X T` (Cuchiero, Corollary 2.4.4, first display, under full support
and `F = F_T`; Grasselli, Proposition 1.2.10, the characterization of the super-replicable
claims behind it). Here `f` need not be `ℱ T`-measurable (both sides then see, on each charged
atom of `ℱ T`, the largest value of `f` at a charged point), `ℱ 0` is arbitrary and null points
are allowed. The equality is stated with an explicit `π`, so no supremum of an empty or unbounded
set enters.

Route.
- (Weak duality) If `f ≤ a + gains X H T` almost surely and `Q` is a martingale measure, then
  `∫ f dQ ≤ a` by 1.3 (the inequality holds `Q`-almost surely since `Q ≪ P`).
- (Farkas, through Tucker) Parametrize the adapted holdings by their values on the atoms of
  `ℱ t`, `t < T`, so that the gains at the charged points are `G h` for a real matrix `G` with rows
  `G_ω`, `ω ∈ ι`. Fix `a` outside the superhedging set: `G h ≥ f − a` on `ι` has no solution.
  Apply Tau Ceti's `TauCeti.exists_nonneg_sum_smul_eq_zero_and_forall_coeff_add_dual_pos` to the
  vectors `u_ω = (G_ω, −(f ω − a))`, `ω ∈ ι`, and `e = (0, 1)`. It gives coefficients `x ≥ 0` with
  `∑ x_ω u_ω + x_e e = 0` and a functional `(h, s)` with `⟨h, G_ω⟩ − s (f ω − a) ≥ 0`, `s ≥ 0`, and
  `x_j` plus the value of the functional at the `j`-th vector positive for every `j`. If `s > 0`,
  `h / s` solves the system, which is excluded. So `s = 0` and `x_e > 0`, and the relation reads
  `∑ x_ω G_ω = 0`, `∑ x_ω (f ω − a) = x_e > 0`.
- Normalizing `x` gives a measure `Q` on `ι`, absolutely continuous with respect to `P`, under which
  all gains have mean zero, hence a martingale measure (the step of 1.4), with `∫ f dQ > a`. So
  `superhedgingPrices P ℱ X T f = {a | ∀ Q ∈ martingaleMeasures P ℱ X T, ∫ f dQ ≤ a}`.
- As a set of weight vectors on `Ω`, the martingale measures form a nonempty (1.4) compact
  polytope, and `Q ↦ ∫ f dQ` is linear; `IsCompact.exists_isMaxOn` gives the maximum `π`, which is
  then the least superhedging price.
- For the equivalent measures: `(1 − ε) Q + ε Q*` is equivalent for every martingale measure `Q`,
  equivalent `Q*` and `0 < ε ≤ 1` (Cuchiero, Proposition 2.2.20; Grasselli, Proposition 1.2.9),
  and its mean tends to that of `Q`.

Cuchiero's printed proof of the closedness in Lemma 2.2.8, on which her route through the bipolar
theorem rests, bounds the limit by a lim sup of dominating gains that need not converge or lie in
the space of gains; the route above uses no closedness.

**Checks.**
- The trinomial call: `π = 1/2`, attained by `Q = (1/2, 0, 1/2)`, which is not equivalent; the
  equivalent measures `(1/4, 1/2, 1/4)` and `(1/3, 1/3, 1/3)` give `1/4` and `1/3`.
- No arbitrage is needed: with increment `(1, 2)`, every `a` superhedges and no martingale measure
  exists.
- Measurable singletons are needed: on two points with `m0 = ⊥` (so every filtration is trivial and
  every price constant; take `X` constant, so there is no arbitrage), the claim `f = 1_{ω₁}` is not
  measurable. The only null measurable set is `∅`, so its least superhedging price is `1`, while
  the integral of `f` is the junk value `0` under the unique martingale measure `P`.
- The probability hypothesis is needed: for `P = 0` every `a` superhedges.
- The measurability hypothesis on `X` is needed: with `T = 0` and `X 0` not `ℱ 0`-measurable,
  there is no martingale measure, while the least superhedging price is the largest value of `f`
  at a charged point.

*Needs:* 1.2, 1.3, 1.4, 3.1; Tau Ceti
`TauCeti.exists_nonneg_sum_smul_eq_zero_and_forall_coeff_add_dual_pos`; Mathlib
`IsCompact.exists_isMaxOn`.

### 3.3 The price interval

Prove `image_equivMartingaleMeasures_eq`: under the hypotheses of 3.2, either the means
`∫ f dQ` over the equivalent martingale measures form a single point `{c}`, and then
`f = c + gains X H T` almost surely for some adapted `H`, or they form an open interval
`(lo, hi)` with `lo < hi` (Cuchiero, Theorem 2.4.2, the dichotomy; she assumes `F_0` trivial,
which the dichotomy does not use).

Route: the set of means is convex (the equivalent martingale measures form a convex set), nonempty
(1.4) and bounded by the extreme values of `f`. If an equivalent `Q*` attains the value `π` of 3.2,
take a superhedge and put `g = π + gains X H T − f ≥ 0` almost surely. Then `∫ g dQ* = 0` by 1.3,
and `Q*` charges every charged point, so `g = 0` almost surely: `f` is attainable at `π`, and 1.3
makes the set `{π}`. The lower end is the same argument for `−f`. A convex subset of `ℝ` that
contains neither endpoint and has two points is an open interval.

**Checks.**
- The trinomial call: the interval `(0, 1/2)`.
- In the binomial tree every claim is attainable, and the set is a point.
- The hypotheses of 3.2 are needed for the same reasons: with `m0 = ⊥` and `f = 1_{ω₁}` the set is
  `{0}` but `f` is not almost surely `0`; for `P = 0` the set is empty.

*Needs:* 1.3, 1.4, 3.2. (Proved here.)

### 3.4 Arbitrage-free prices

Prove `exists_noArbitrage_snoc_iff`: on a finite `Ω`, for a probability measure `P`, adapted
prices up to `T`, `ℱ 0` trivial (`MeasurableSet[ℱ 0] s → s = ∅ ∨ s = univ`)
and an `ℱ T`-strongly measurable claim `f`, a number `a` is an arbitrage-free price of `f` (some
process `Y`, `ℱ t`-strongly measurable for `t ≤ T`, with `Y 0 = a` and `Y T = f`, makes the market
`Fin.snoc (X t) (Y t)` of `d + 1` assets free of arbitrage) iff `a = ∫ f dQ` for some equivalent
martingale measure `Q` (Cuchiero, Definition 2.4.1 and Theorem 2.4.2). No arbitrage of `X` is
not assumed: either side implies it (an arbitrage of `X` is one of the enlarged market, and an
equivalent martingale measure excludes it by 1.4). Tau Ceti's `Probability/Finance/StaticClaim.lean`
has the one-stock cash flows behind uniqueness for an attainable claim: a claim replicated at
cost `q` and traded at a price `p ≠ q` gives a zero-cost trade with a sure positive payoff.

Route.
- (⇐) Put `Y t = Q[f | ℱ t]` for `t < T` and `Y T = f`. With `ℱ 0` trivial an `ℱ 0`-measurable
  function is constant, so `Y 0 = ∫ f dQ = a` (for `T = 0`, `f` itself is constant). By the tower
  property `Q` is an equivalent martingale measure of the enlarged market, which is free of
  arbitrage by 1.4.
- (⇒) 1.4 for the enlarged market gives `Q'`. Its first `d` coordinates make it an equivalent
  martingale measure of `X`, and `∫ f dQ' = ∫ Y T dQ' = ∫ Y 0 dQ' = a`.

**Checks.**
- The trinomial call: the arbitrage-free prices are `(0, 1/2)`.
- Triviality of `ℱ 0` is needed: with `T = 0`, two charged atoms of `ℱ 0` and `f = (1, 2)`, the
  means form `(1, 2)`, but `Y 0 = a` and `Y 0 = f` would force `f` to be constant.
- The probability hypothesis is needed: for `P = 0` and `T = 1`, every process is free of
  arbitrage, so `Y = (a, f)` works for every `a`, while no equivalent martingale measure exists.

*Needs:* 1.4; Mathlib `condExp_condExp_of_le`, `Fin.snoc`. (Proved here.)

### 3.5 The optional decomposition

Prove `optional_decomposition`: on a finite `Ω`, for adapted prices up to `T`, under
`NoArbitrage P ℱ X T`, for `V : ℕ → Ω → ℝ` with `V t` `ℱ t`-strongly measurable for `t ≤ T`, the
following are equivalent: (1) `V (min · T)` is a `Supermartingale` under every equivalent
martingale measure; (2) the same under every martingale measure; (3) there are adapted `H` and
`C`, with `C 0 = 0`, `C t ≤ C (t + 1)` almost surely for `t < T`, and
`V t = V 0 + gains X H t − C t` almost surely for `t ≤ T` (Cuchiero, Theorem 2.5.1; Kramkov proved
the general case). `C` is adapted, not predictable, and not unique (Cuchiero, Remark 2.5.2). `P` is
any measure.

Route.
- (3) ⇒ (2): the almost sure identities pass to `Q ≪ P`; the gains are a `Q`-martingale (1.3) and
  `−C` is adapted and almost surely nonincreasing, so
  `Q[V (t + 1) | ℱ t] = V 0 + gains X H t − Q[C (t + 1) | ℱ t] ≤ V t`.
- (2) ⇒ (1): every equivalent martingale measure is a martingale measure.
- (1) ⇒ (3), proved here. For `P = 0`, (3) holds with `H = 0` and `C = 0`. Otherwise fix an
  equivalent `Q*` (1.4, applied as in 2.2). For `t < T` and each atom `A` of `ℱ t`
  containing a charged point, look for `h ∈ ℝ^d` with
  `V (t + 1) − V t ≤ ⟨h, X (t + 1) − X t⟩` at the charged points of `A`. If there is none, the
  Farkas step of 3.2 (Tucker's theorem) gives `z ≥ 0` on those points with
  `∑ z (X (t + 1) − X t) = 0` and `∑ z (V (t + 1) − V t) > 0`. Both increments are
  `ℱ (t + 1)`-measurable, so `z` may be aggregated into weights `z̃` on the atoms `B` of
  `ℱ (t + 1)` inside `A`, normalized to sum `1`.
- Paste: let `ν = ∑_B z̃ (B) Q* (· | B)`, the sum over the atoms `B ⊆ A` of `ℱ (t + 1)` with
  `z̃ (B) > 0` (each contains a charged point, so `Q* B > 0`), and let `Q'` equal `Q*` off `A` and
  `Q* (A) ((1 − ε) Q* (· | A) + ε ν)` on `A`. For `ε < 1`, `Q'` is an equivalent martingale
  measure: it has the law of `Q*` on `ℱ t`, its increment at time `t` has conditional mean zero on
  `A` (a convex combination of two measures with that property), and its conditional laws given
  `ℱ (t + 1)` are those of `Q*`. Its value of `∫_A (V (t + 1) − V t) dQ'` is
  `(1 − ε) ∫_A (V (t + 1) − V t) dQ* + ε Q* (A) ∑_B z̃ (B) (V (t + 1) − V t)(B)`, positive for `ε`
  near `1`, which contradicts (1).
- So `h` exists; put `H t = h` on `A` and `0` on the atoms of `ℱ t` without charged points (and
  `H t = 0` for `t ≥ T`), and `C t = V 0 + gains X H t − V t`. Then `H` and `C` are adapted,
  `C 0 = 0`,
  and `C (t + 1) − C t = ⟨H t, X (t + 1) − X t⟩ − (V (t + 1) − V t) ≥ 0` at every charged point.

For general `T`, Cuchiero's printed proof of (1) ⇒ (3) infers an `F_{t−1}`-measurable `H_t` from
the unconditional inequality `E_Q[V_t − V_{t−1}] ≤ 0` for all equivalent `Q`, as in her case
`T = 1`. That inequality alone does not give a one-period holding: on two charged points with
`F_0` trivial, `F_1 = F_2` everything, `S_0 = 0`, `S_1 = S_2 = (1, −1)` and `V_0 = V_1 = 0`,
`V_2 = (1, −1)`, every equivalent `Q` gives `E_Q[V_2 − V_1] = 0`, but
`V_2 − V_1 ≤ H_2 (S_2 − S_1) = 0` fails at the first point (and `V` is not a supermartingale).
The conditional inequality is
needed, and the pasting step above turns it into the one-period holding.

**Checks.**
- No arbitrage is needed: on two charged points with `T = 1`, `ℱ 0` trivial, `ℱ 1` everything,
  `X 1 − X 0 = (1, 0)` and `V 1 − V 0 = (0, 1)`, there is an arbitrage and no equivalent martingale
  measure, so (1) holds vacuously; the only martingale measure is the point mass at the second
  point, under which `V` increases, so (2) fails, and (3) would need `1 ≤ h · 0`.
- `C` cannot be taken predictable: in the trinomial market with `V 0 = 1/2` and
  `V 1 = (1, 0, 0)`, (1) holds (`∫ V 1 dQ = s < 1/2`), and `h = 1/2` gives `C 1 = (0, 1/2, 0)`; a
  constant `C 1 = c` would need `1 = 1/2 + h − c`, `0 = 1/2 − c` and `0 = 1/2 − h − c`, which have
  no
  solution.
- Adaptedness of `V` is needed: with `T = 0`, `d = 0`, two charged points, `ℱ 0` trivial and
  `V 0 = (0, 1)`, (3) holds with `C = 0`, while `P` is an equivalent martingale measure and `V` is a
  supermartingale under no measure. The measurability of `X` is needed: on the two points of the
  first Check, with `X 0 = X 1 = (0, 1)`, which is not `ℱ 0`-measurable, and `V 1 − V 0 = 1`,
  there is no arbitrage and the sets of measures are empty, so (1) and (2) hold, while (3) would
  need `1 ≤ h · 0`.
- `T = 0`: all three hold, with `C = 0`. `d = 0`: all three say that `V` is almost surely
  nonincreasing up to `T`.

*Needs:* 1.2, 1.3, 1.4; the Farkas step of 3.2 (Tau Ceti
`TauCeti.exists_nonneg_sum_smul_eq_zero_and_forall_coeff_add_dual_pos`); Mathlib
`Supermartingale`, `supermartingale_nat`, `condExp_mono`, `condExp_of_stronglyMeasurable`.

### Examples

The trinomial market with the call `(X 1 − 1)⁺`: superhedging price `1/2`, price interval
`(0, 1/2)`, the decomposition with a non-predictable `C`; the two-point market with an arbitrage;
the binomial tree, where all of Layer 3 reduces to 1.3.

### Dependencies

Layer 1 (1.2, 1.3, 1.4); Tau Ceti `Geometry/Convex/Cone/Alternative.lean`; Mathlib
`IsCompact.exists_isMaxOn`, `condExp_condExp_of_le`, `condExp_mono`,
`condExp_of_stronglyMeasurable`, `Supermartingale`, `supermartingale_nat`, `Fin.snoc`.

## Layer 4: the Cox–Ross–Rubinstein tree

### 4.1 The tree

The sample space is `Fin T → Bool` (`true` is an up move) with its product σ-algebra, which is
discrete. Define `crrCoin T t ω`, equal to `1` or `0` according to the move `ω (t − 1)` for
`1 ≤ t ≤ T` and `0` otherwise; `crrFiltration T`, Mathlib's `Filtration.natural` of these coins,
so that `ℱ 0` is trivial and `ℱ t` is generated by the first `t` moves; `crrPrice T S₀ a b t ω`,
the one-asset discounted price `S₀ ∏_{k < t} (1 + R k)` with `R k = b` on an up move and `a` on a
down move; and `crrMeasure T q`, the measure giving each path the mass `∏_k (q or 1 − q)`
(Cuchiero, §3.1; there the moves are `±1`).

**Checks.**
- `crrPrice 2 S₀ a b 2` at the path (up, down) is `S₀ (1 + b)(1 + a)`, and `crrPrice T S₀ a b 0` is
  `S₀`.
- `crrMeasure 2 (1/3)` gives the paths (up, up), (up, down), (down, up), (down, down) the masses
  `1/9, 2/9, 2/9, 4/9`.

*Needs:* Mathlib `Filtration.natural`, `StronglyMeasurable.of_discrete`, `Measure.dirac`.
(Definitions.)

### 4.2 No arbitrage in the tree

Prove `crr_noArbitrage_iff`: for `T ≥ 1`, a measure `P` charging every path, `S₀ > 0` and
`a < b`, the tree is free of arbitrage iff `a < 0 < b` (Cuchiero, Theorem 3.1.1, which assumes
`−1 < a < b` and a probability charging every path; Kevei, Theorem 1, the existence of the
martingale measure for an inhomogeneous tree). Here `−1 < a` is not assumed: for `a ≤ −1` the
price may vanish or change sign and the criterion still holds. `P` need not be a probability
measure; only its null sets matter.

Route.
- (⇐) `q = −a/(b − a) ∈ (0, 1)`, and `crrMeasure T q` is a martingale measure for every `a`, since
  the one-step mean is `X t (1 + q b + (1 − q) a) = X t`. It charges every path, so it is equivalent
  to `P`; 1.3 gives mean-zero gains, and `TauCeti.Finance.isArbitrage_iff_of_absolutelyContinuous`
  with `TauCeti.Finance.IsArbitrage.integral_pos` excludes an arbitrage (the argument of 1.4,
  which does not use that `P` is a probability).
- (⇒) If `b ≤ 0`, sell one unit at time `0`; if `a ≥ 0`, buy one. The gain `∓S₀ R 0` is
  nonnegative and positive on half of the paths, which `P` charges.

**Checks.**
- The charge hypothesis is needed: for `T = 2`, `a < 0 < b` and `P` the point mass at (up, up),
  buying at time `0` is an arbitrage.
- `T ≥ 1` is needed: for `T = 0` the space is a point and there is no arbitrage, for instance with
  `a = 1/10`, `b = 3/10`.
- `a < b` is needed: for `a = b = 0` there is no arbitrage while `a < 0` fails.
- `S₀ > 0` is needed in this form: for `S₀ = 0` there is never an arbitrage.

*Needs:* 1.3, 4.1; Tau Ceti `TauCeti.Finance.isArbitrage_iff_of_absolutelyContinuous`,
`TauCeti.Finance.IsArbitrage.integral_pos`.

### 4.3 The martingale measure of the tree

Prove `crr_equivMartingaleMeasures`: for `P` charging every path, `S₀ > 0` and `−1 < a < 0 < b`,
the equivalent martingale measures of the tree form the single set `{crrMeasure T (−a/(b − a))}`;
under it the moves are independent with up-probability `q = −a/(b − a)` (Cuchiero, Theorem 3.1.1;
Kevei, Theorem 1). By 2.2 the tree is complete. `T = 0` is allowed (both sides are the point mass
on the one path).

Route: as in Cuchiero's proof of Theorem 3.1.1. The price is nonzero, so the martingale identity at
a node forces the conditional up-probability `q` there; by induction on `t` every martingale
measure gives a path with `k` up moves the mass `q^k (1 − q)^(T − k)`. Conversely the product
measure is a martingale measure (4.2) charging every path.

**Checks.**
- The value `a = −1` must be excluded: for `a = −1`, `b = 1/2` (`q = 2/3`) and `T = 2`, after a
  down move the price is `0` and the second move is free: the masses `4/9, 2/9, s/3, (1 − s)/3` on
  (up, up), (up, down), (down, up), (down, down) define an equivalent martingale measure for every
  `0 < s < 1`. The route uses only that the price never vanishes, so it works unchanged for
  `a < −1`, where the price changes sign; the hypothesis `−1 < a` is that of the sources, under
  which prices stay positive.
- With `a = −1/5`, `b = 3/10`: `q = 2/5`.
- With `a = −1/10`, `b = 1/5`, `T = 3`, `S₀ = 100`: `q = 1/3`, and by 1.3, 2.2 and 3.4 the unique
  arbitrage-free price of the call `(X 3 − 100)⁺` is `1252/135 ≈ 9.274074`, the binomial sum of
  1.3; by 3.2 it is also its superhedging price.
- Undiscounted, `u = 1.2`, `d = 0.9`, `r = 0.05` give `a = −1/7`, `b = 1/7` and `q = 1/2`.

*Needs:* 1.2, 4.1, 4.2. (Proved here.)

### Examples

The tree with `a = −1/10`, `b = 1/5`, `T = 3` and its call; the degenerate trees at `a = −1` and
`T = 0`; the point mass at one path.

### Dependencies

Layer 1 (1.2, 1.3); Tau Ceti `TauCeti.Finance.isArbitrage_iff_of_absolutelyContinuous`,
`TauCeti.Finance.IsArbitrage.integral_pos`; Mathlib `Filtration.natural`,
`StronglyMeasurable.of_discrete`, `Measure.dirac`.

## Layer 5: American claims

### 5.1 The Snell envelope and American superhedging

The Snell envelope `snellEnvelope μ 𝓕 Z N` (`U N = Z N`, `U n = max (Z n) (μ[U (n + 1) | 𝓕 n])`
for `n < N`, `U n = Z N` for `n ≥ N`) and the first time `optimalStoppingTime μ 𝓕 Z N n` in
`[n, N]` at which it meets the reward are OptimalStopping's (1.1 and 1.3 there); they are copied
verbatim into `Suggested.lean`.

Define `americanSuperhedgingPrices P ℱ X T Z`: the set of `a` for which some adapted `H` gives
`Z t ≤ a + gains X H t` almost surely for every `t ≤ T`. Here `Z` is the discounted payoff process
of an American claim, of any sign (Kevei, §5.2, assumes nonnegative payoffs; the arguments below
do not use it).

**Checks.**
- In the trinomial market with `Z 0 = 3/5` and `Z 1 = (X 1 − 1)⁺`, the set is `[3/5, ∞)`; the
  superhedging set of the European claim `Z 1` alone is `[1/2, ∞)`.
- For `T = 0` the set is the set of almost sure upper bounds of `Z 0`.

*Needs:* 1.1; OptimalStopping 1.1, 1.3 (definitions copied). (Definitions.)

### 5.2 The seller's price in a complete market

Prove `isLeast_americanSuperhedgingPrices`: on a finite `Ω`, in a complete market with an
equivalent martingale measure `Q`, for a payoff `Z` with `Z t` `ℱ t`-strongly measurable for
`t ≤ T`, the least element of `americanSuperhedgingPrices P ℱ X T Z` is `c = ∫ U 0 dQ`, where
`U = snellEnvelope Q ℱ Z T`, and some adapted `H` satisfies `Z t ≤ c + gains X H t` almost surely
for `t ≤ T` and `c + gains X H τ* = Z τ*` almost surely at `τ* = optimalStoppingTime Q ℱ Z T 0`
(Kevei, Theorem 6, for a complete market and nonnegative payoffs; Cuchiero, Theorem 4.2.3, for
the Snell envelope under the martingale measure). The membership of `Q` already gives no arbitrage
(1.4) and adapted prices, so neither is assumed again. In a complete market `ℱ 0` is almost
surely trivial (for an atom `A` of `ℱ 0`, `1_A` is attainable at a constant price and 1.3 forces
`P A ∈ {0, 1}` up to null sets), so `U 0` is almost surely the constant `c`.

Route.
- (Lower bound) Let `a` be a superhedging price with holdings `H`, and `τ ≤ T` a stopping time. The
  process `t ↦ a + gains X H (min t T)` is a `Q`-martingale (1.3), so optional stopping
  (`Submartingale.expected_stoppedValue_mono` for it and its negative) gives
  `∫ Z τ dQ ≤ a + ∫ gains X H τ dQ = a`. By OptimalStopping 1.4
  (`TauCetiRoadmap.OptimalStopping.isGreatest_integral_stoppedValue` under `Q`; integrability holds
  on a finite space),
  `c ≤ a`.
- (Attainment) `U` is a `Q`-supermartingale (OptimalStopping 1.1,
  `TauCetiRoadmap.OptimalStopping.snellEnvelope_supermartingale`). Its Doob decomposition
  `U = martingalePart U ℱ Q + predictablePart U ℱ Q`
  (`martingalePart_add_predictablePart`, `martingale_martingalePart`) has a
  nonincreasing predictable part (`Submartingale.monotone_predictablePart` for `−U`) starting at
  `0`. By completeness and 1.3, `martingalePart U ℱ Q T = c + gains X H T` almost surely, hence the
  martingale part is `c + gains X H t` for `t ≤ T`, and `Z t ≤ U t ≤ c + gains X H t`.
- (Replication at `τ*`) OptimalStopping 1.3
  (`TauCetiRoadmap.OptimalStopping.condExp_stoppedValue_optimalStoppingTime` at `n = 0`)
  gives `∫ Z τ* dQ = c`. Since `Z τ* ≤ c + gains X H τ*` almost surely and both sides have mean
  `c`, they agree `Q`-almost surely, hence `P`-almost surely.

**Checks.**
- The American put in the tree with `u = 1.2`, `d = 0.9`, `r = 0.05`, `T = 3`, `S₀ = 100` and strike
  `105` (discounted payoff `(105 − S t)⁺ / 1.05^t`): the Snell envelope at `0` is
  `7.985099`, the least superhedging price, while the European put is worth `5.992873`.
- Completeness is needed: in the trinomial market with `Z 0 = 2/5` and `Z 1 = (X 1 − 1)⁺`, the
  Snell envelope under `Q = (1/4, 1/2, 1/4)` starts at `max(2/5, 1/4) = 2/5`, while the least
  superhedging price is `1/2`.
- Measurability of `Z` is needed: with `T = 0`, `d = 0`, two charged points with `P` uniform, `ℱ 0`
  trivial and `Z 0 = (0, 1)`, the market is complete, the least superhedging price is `1`, and
  `∫ Z 0 dP = 1/2`.
- `T = 0`: `U 0 = Z 0` and `τ* = 0`.

*Needs:* 1.3, 1.4, 2.1, 5.1; OptimalStopping 1.1, 1.3, 1.4; Mathlib
`Submartingale.expected_stoppedValue_mono`, `martingalePart`, `predictablePart`,
`martingalePart_add_predictablePart`, `martingale_martingalePart`,
`Submartingale.monotone_predictablePart`, `Supermartingale.neg`, `stoppedValue`.

### 5.3 The American call

Prove `snellEnvelope_call_eq_condExp`: for a probability `Q` under which
`X (min · T)` is a martingale, a deterministic numéraire `B` with `B t > 0` for `t ≤ T` and
`B t ≤ B (t + 1)` for `t < T`, a strike `K ≥ 0` and an asset `i`, the Snell envelope of the
discounted call payoff `(X s i − K / B s)⁺` (which is `(S s − K)⁺ / B s` for `X = S / B`) equals,
`Q`-almost surely at every `t ≤ T`, the conditional expectation of the terminal payoff
`(X T i − K / B T)⁺` (Kevei, §5.3, by Jensen's inequality and induction; Cuchiero, Proposition
4.2.5 and Remark 4.2.6, where the comparison of American and European values is a statement of
optimal stopping). Neither a finite `Ω` nor a reference measure is needed: the payoff is
integrable because `X s i` is, being a coordinate of a martingale.

Route: conditional Jensen (`ConvexOn.map_condExp_le`) for `x ↦ (x − K / B t)⁺` and
`K / B (t + 1) ≤ K / B t` make the payoff a `Q`-submartingale on `[0, T]`. Then
`M t = Q[Z T | ℱ t]` is a martingale dominating the payoff, so OptimalStopping 1.1
(`TauCetiRoadmap.OptimalStopping.snellEnvelope_le_of_supermartingale`) gives `U ≤ M`; conversely
`U t ≥ Q[U T | ℱ t] = M t`, since
`U` is a supermartingale (`TauCetiRoadmap.OptimalStopping.snellEnvelope_supermartingale`) with
`U T = Z T`.

**Checks.**
- In the tree of 5.2 the American and European calls with strike `105` are both `15.289925`.
- `K ≥ 0` is needed: for `K = −10` the American value is `110` (exercise at once) and the European
  one `108.638376`.
- A nondecreasing numéraire is needed: for `r = −0.05` (so `q = 1/6`) and strike `105` the American
  value is `3.295751` and the European one `2.358620`.
- Positivity of `B` is needed: for `T = 1`, `B = (0, 1)`, `K = 1` and `X ≡ 1`, the junk value
  `K / 0 = 0` makes the payoff `1` at time `0` and `0` at time `1`, so the envelope is `1` and the
  conditional expectation `0`.

*Needs:* 5.1; OptimalStopping 1.1; Mathlib `ConvexOn.map_condExp_le`, `condExp_condExp_of_le`,
`Martingale`.

### Examples

The put and the call in the three-period tree with `u = 1.2`, `d = 0.9`, `r = 0.05`; the trinomial
market, where the American price is not a Snell value under one martingale measure.

### Dependencies

Layer 1 (1.1, 1.3, 1.4), Layer 2 (2.1); OptimalStopping 1.1, 1.3, 1.4; Mathlib Doob
decomposition, optional stopping and conditional Jensen (the names above).

## Scope and ownership

This roadmap owns the `d`-asset market on a finite space in discrete time with the definitions of
Layers 1 to 5 above: gains, no arbitrage, absolutely continuous and equivalent martingale measures,
completeness, superhedging prices of European and American claims; and the theorems stated above:
pricing of attainable claims, the first and second fundamental theorems, the branching bound,
superhedging duality, the price interval, arbitrage-free prices, the optional decomposition, the
no-arbitrage criterion and martingale measure of the Cox–Ross–Rubinstein tree, the superhedging
price of an American claim in a complete market, and the American call.

Already in the libraries and therefore not targets:

- Tau Ceti `Probability/Finance/` has the arbitrage predicate, the elementary integral of simple
  strategies with its conditional-expectation and mean-zero theorems, one-stock self-financing
  strategies with their discounted form and the self-financing bond, the cash flows of a
  mispriced static claim (`StaticClaim.lean`, cited in 3.4), and
  `TauCeti.Finance.IsSelfFinancing.not_isArbitrage`, the direction from an equivalent martingale
  measure to no arbitrage for one stock. They are used by name. Tau Ceti has no multi-asset gains,
  no existence theorem for a martingale measure, and nothing on completeness, superhedging or the
  binomial tree. Its Stiemke lemma and Tucker's theorem of the alternative
  (`Analysis/Convex/Stiemke.lean`, `Geometry/Convex/Cone/Alternative.lean`) replace the separating
  hyperplanes of the sources.
- Mathlib has martingales, conditional expectation, the Doob decomposition, optional stopping for
  bounded stopping times and conditional Jensen; the martingale property of the gains of `d` assets
  (1.3) is not at the pin as a statement about vector holdings.

Stated by other roadmaps and not restated here:

- OptimalStopping 1.1 to 1.4 own the Snell envelope, its supermartingale property and minimality,
  optional sampling for supermartingales, the optimality of the first meeting time and the value
  of the stopping problem. `snellEnvelope` and `optimalStoppingTime` are copied verbatim, and 1.1,
  1.3 and 1.4 are used in Layer 5 only. OptimalStopping lists American options as not treated
  there; Layer 5 treats their pricing. The comparison "American at least European" is a
  consequence of OptimalStopping 1.1 and is not stated here.
- FinancialMathematics treats a continuous-time market of one risky asset and one bond driven by a
  Brownian motion (self-financing trading, the risk-neutral measure, completeness, no arbitrage,
  the pricing equation and the Black–Scholes formulas). Everything here is on a finite space in
  discrete time with `d` assets; nothing of FinancialMathematics is restated or used, and its
  completeness and no-arbitrage theorems are different theorems, about Brownian markets.
- StochasticCalculus has martingale transforms of bounded predictable step processes in
  continuous time; the discrete transform here is the definition `gains`, and its martingale
  property is 1.3. MarkovDecisionProcesses treats dynamic programming without prices; nothing of
  it is used.
- ConvexAnalysisAndDuality 1.4 (Farkas' lemma) and 5.3 (duality of linear programs in standard
  form: if `min c ⬝ᵥ x` over `A x = b`, `x ≥ 0` is feasible and bounded below, it and
  `max b ⬝ᵥ y` over `Aᵀ y ≤ c` are both attained, with equal values) are finite linear duality
  next to 1.4 and 3.2. With the adapted holdings parametrized by their values on the atoms of
  `ℱ t` and the gains at the charged points written `G h`, as in the route of 3.2, the least
  superhedging price is the maximum of `−a` over the free variables `(a, h)` subject to
  `−a − G_ω h ≤ −f ω` at every charged point `ω`, a program of the second form. Its standard-form
  partner minimizes `−∑ x_ω f ω` over weights `x ≥ 0` on the charged points with `∑ x_ω = 1` and
  `∑ x_ω G_ω = 0`, which are the martingale measures `Q ≪ P` (the step of 1.4); it is feasible by
  1.4 and bounded below by `−max f`, so 5.3 gives the first two conclusions of 3.2. Farkas'
  lemma for the same weights gives a martingale measure `Q ≪ P` exactly when no holding has gains
  positive at every charged point; it does not give the equivalent measure of 1.4, whose weights
  are positive. This roadmap proves 1.4 from Tau Ceti's Stiemke lemma and 3.2 from Tucker's
  alternative, and it does not depend on that one.

Not treated here: the limit of binomial prices to Black–Scholes prices; markets on general
probability spaces (the Dalang–Morton–Willinger theorem); the superhedging price of an American
claim in an incomplete market (the upper Snell envelope over all equivalent martingale measures);
predictable representation and extreme martingale measures; path-dependent claims in the tree;
utility maximization, portfolio optimization and risk measures; transaction costs, dividends and
continuous time.

## Exact supplier contracts

### From Mathlib

- `Mathlib/Probability/Martingale/Basic.lean`: `Martingale` (adapted, integrable,
  `μ[f j | ℱ i] =ᵐ f i` for `i ≤ j`), `Supermartingale`, `Submartingale`,
  `Martingale.stronglyAdapted`,
  `Supermartingale.neg`, `martingale_nat` and `supermartingale_nat` (one-step criteria on `ℕ` for a
  finite measure).
- `Mathlib/Probability/Martingale/Centering.lean`: `martingalePart`, `predictablePart`,
  `martingalePart_add_predictablePart`, `martingale_martingalePart` (adapted integrable `f`),
  `Submartingale.monotone_predictablePart`.
- `Mathlib/Probability/Martingale/OptionalStopping.lean`:
  `Submartingale.expected_stoppedValue_mono` (stopping times `τ ≤ π ≤ N`).
- `Mathlib/Probability/Process/Adapted.lean`: `StronglyAdapted`,
  `Filtration.stronglyAdapted_natural`; `Mathlib/Probability/Process/Filtration.lean`:
  `Filtration.natural`; `Mathlib/Probability/Process/Stopping.lean`: `stoppedValue`.
- `Mathlib/MeasureTheory/Function/ConditionalExpectation/Basic.lean`:
  `condExp_of_stronglyMeasurable`,
  `condExp_congr_ae`, `integral_condExp`, `ae_eq_condExp_of_forall_setIntegral_eq` (a function with
  the set integrals of `f` on `m`-measurable sets is `μ[f | m]`), `condExp_condExp_of_le`,
  `condExp_mono`. `.../ConditionalExpectation/CondJensen.lean`: `ConvexOn.map_condExp_le`
  (conditional Jensen for a convex lower semicontinuous function on a closed set).
- `Mathlib/MeasureTheory/Measure/Trim.lean`: `MeasureTheory.Measure.trim`,
  `MeasureTheory.trim_eq_self`.
- `Mathlib/MeasureTheory/Integral/IntegrableOn.lean`: `Integrable.of_bound` (finite measure,
  a.e. strongly measurable, bounded).
  `Mathlib/MeasureTheory/Function/StronglyMeasurable/Basic.lean`:
  `StronglyMeasurable.of_discrete`. `Measure.dirac`, `MeasureTheory.Measure.AbsolutelyContinuous`.
- `Mathlib/Topology/Order/Compact.lean`: `IsCompact.exists_isMaxOn`. `Fin.snoc`.

### From Tau Ceti

- `TauCeti/Probability/Finance/Arbitrage.lean`: `TauCeti.Finance.IsArbitrage`
  (`v =ᵐ[P] 0 ∧ 0 ≤ᵐ[P] V ∧ 0 < P {0 < V}`), `isArbitrage_iff_of_absolutelyContinuous` (for
  `P ≪ Q` and `Q ≪ P`), `isArbitrage_mul_iff` (factors almost surely nonzero, resp. positive),
  `IsArbitrage.integral_pos` (an integrable arbitrage payoff has positive mean),
  `condExp_simpleGains` (for monotone dates, adapted integrable martingale prices along the dates
  and
  adapted holdings with integrable trades, the gains are a martingale along the dates),
  `IsSelfFinancing.not_isArbitrage` (cited in 1.4), `IsSelfFinancing.condExp_discounted_wealth`
  (cited in 1.3). `TauCeti/Probability/Finance/StaticClaim.lean` (cited in 3.4).
- `TauCeti/Probability/Finance/SimpleStrategy.lean`: `TauCeti.Finance.simpleGains`,
  `simpleGains_apply_eq_sum` (for `MonotoneOn τ` and `j ≤ n`, the gains at `τ j` are
  `∑_{i < j} a i (X (τ (i+1)) − X (τ i))`), `IsSelfFinancing`,
  `IsSelfFinancing.discounted_terminal_wealth_eq` (monotone dates, nonvanishing bond),
  `selfFinancingBond`, `isSelfFinancing_selfFinancingBond`, `mul_add_mul_selfFinancingBond_zero`.
- `TauCeti/Analysis/Convex/Stiemke.lean`: `TauCeti.exists_pos_forall_sum_mul_eq_zero_iff` (a
  subspace of `ι → ℝ`, `ι` a fintype, meets the nonnegative orthant only in `0` iff some strictly
  positive vector is orthogonal to it).
- `TauCeti/Geometry/Convex/Cone/Alternative.lean`:
  `TauCeti.exists_nonneg_sum_smul_eq_zero_and_forall_coeff_add_dual_pos` (Tucker: for finitely many
  vectors `a j` in a vector space over an ordered field there are `x ≥ 0` with `∑ x j • a j = 0` and
  a
  functional `y` with `y (a j) ≥ 0` and `x j + y (a j) > 0` for all `j`).

### From TauCetiRoadmap.OptimalStopping

- 1.1 `snellEnvelope` (copied verbatim, with OptimalStopping's `variable` line); 1.1
  `TauCetiRoadmap.OptimalStopping.snellEnvelope_supermartingale` (adapted rewards integrable up to
  the horizon, probability
  measure) and `TauCetiRoadmap.OptimalStopping.snellEnvelope_le_of_supermartingale` (a
  supermartingale dominating the reward
  almost surely up to the horizon dominates the envelope there). Used in 5.2 and 5.3.
- 1.3 `optimalStoppingTime` (copied verbatim) and
  `TauCetiRoadmap.OptimalStopping.condExp_stoppedValue_optimalStoppingTime` (it is
  a stopping time and the conditional expected reward at it is the envelope). Used in 5.2.
- 1.4 `TauCetiRoadmap.OptimalStopping.isGreatest_integral_stoppedValue` (the mean of the envelope at
  `0` is the largest expected
  reward of a stopping time bounded by the horizon). Used in 5.2.

## References

- Christa Cuchiero, *Mathematical Finance in discrete time*, lecture notes, University of Vienna,
  fall 2015/16, draft version June 2016 (the PDF on W. Schachermayer's page at the University of
  Vienna). Cited as Cuchiero.
- Mihaly Ruszkai Grasselli, *Lectures on the Foundations of Mathematical Finance*, Fields Institute,
  winter 2010, notes by E. Ha and W. Mnif (the PDF on the Fields Institute's site). Cited as
  Grasselli.
- Péter Kevei, *Financial mathematics and risk theory*, lecture notes, University of Szeged,
  version of November 19, 2026 (the PDF on the author's page). Cited as Kevei.
- Prior formalization, not used here: Raphael Coelho, *The Fundamental Theorem of Asset Pricing,
  Formalized in Lean 4*, arXiv:2606.28990 (version 2), on release v1.11.0 of the Lean library
  `formal-mathfin`. On a finite space charging every point it proves the multi-period first
  theorem and, under no arbitrage and with `F_T` the power set, the second, for one risky asset;
  for the Cox–Ross–Rubinstein tree with independent flips, the no-arbitrage criterion, existence
  and uniqueness of the equivalent martingale measure and completeness (through the second
  theorem). It proves the one-period first theorem for several assets on a finite space and on an
  arbitrary probability space, and only the weak direction of one-period superhedging duality on
  a finite space. The paper has nothing on the optional decomposition or American claims; the
  library has American prices in the binomial tree, by backward recursion with a Snell-envelope
  characterization, which the paper does not discuss.
- Attributions made in prose without a locator: Harrison and Pliska (the first fundamental theorem
  on a finite space), Kramkov (the optional decomposition), Cox, Ross and Rubinstein (the binomial
  tree), Stiemke and Tucker (the theorems of the alternative), Dalang, Morton and Willinger (general
  probability spaces).
