# Roadmap: mechanism design

**Summary.** A mechanism asks each participant for a report of private information and maps the
reports to an outcome and to payments. Mechanism design asks which outcome rules can be paired
with payments so that truthful reporting is in every participant's interest, and which such
mechanism raises the most revenue. This roadmap develops the classical answers for quasi-linear
utility: a participant who values the outcome at `v` and pays `p` has utility `v − p`. Every
target is a statement about mechanisms as functions; no procedure for computing an allocation is
a target. There are
finitely many bidders, and in the single-parameter layers every bid and every value is a
nonnegative real number.

The headline theorems are these.

- *Myerson's lemma.* In a single-parameter environment an allocation rule can be paired with a
  payment rule that makes truthful bidding a dominant strategy if and only if each bidder's
  allocation is nondecreasing in its own bid. Then the payment of a bidder who bids `b` is
  `b x(b) − ∫₀ᵇ x(z) dz` plus what it pays when it bids `0`, the integral being the Lebesgue
  integral of its allocation `x` as a function of its own bid. Discontinuous allocation rules and
  arbitrary tie-breaking are covered.
- *Second-price auctions.* The auction that gives one item to a highest bidder whose bid reaches a
  reserve `r`, at the price of the larger of `r` and the highest other bid, makes truthful bidding
  dominant for every tie-breaking rule. With reserve `0` (the Vickrey auction) it maximizes
  welfare, and with at least two bidders truthful bidding is the only dominant bid.
- *The VCG mechanism.* In every environment with a welfare-maximizing choice rule, Groves'
  payments make truthful reporting dominant; with finitely many outcomes, the Clarke pivot
  payments are nonnegative and give nonnegative utility to every agent whose valuation is
  nonnegative.
- *Expected revenue and optimal auctions.* For independent values, a Bayesian incentive
  compatible mechanism with measurable bounded allocation and integrable payment has expected
  payment equal to the expected virtual welfare minus the utility of the lowest type, when the
  value law has finite mean and a density positive almost everywhere between the bottom and the
  top of its support. If the laws have such densities, with support starting at `0`, and strictly
  increasing virtual values, a measurable pointwise
  maximizer of virtual welfare over a bounded feasible set is monotone and, with Myerson's
  payments, has the largest expected revenue among all such mechanisms with the same feasible set
  whose interim payment at value `0` is at most `0`. For one item and identically distributed
  values this is the second-price auction with reserve where the virtual value changes sign.

The roadmap builds on Mathlib's interval integral, product measures, densities, distribution
functions and the layer cake formula. It sits beside the game-theory roadmaps
RegretMinimizationAndEquilibria (finite games and their equilibria) and
PotentialGamesAndPriceOfAnarchy (equilibria of cost games), which treat games with given payoffs
rather than the design of payoffs; it uses neither.

Layer 1 below defines single-parameter mechanisms and proves Myerson's lemma from a one-bidder
lemma. Layer 2 treats second-price auctions. Layer 3, on general outcome sets, proves Groves' and
the VCG theorems and depends on no other layer. Layer 4 adds independent value laws and proves
revenue equivalence, the virtual-welfare formula for expected revenue and Myerson's optimal
auction; it uses Layers 1 and 2.

## Conventions

- **Bidders and profiles.** Bidders form a finite type `ι` with `[Fintype ι] [DecidableEq ι]`. A
  bid profile is `b : ι → ℝ≥0`; the profile in which bidder `i` bids `z` and the others bid as in
  `b` is `Function.update b i z`. Bids and values range over all of `ℝ≥0`, not a bounded interval,
  and a value distribution on a bounded interval is handled by its law, not by restricting bids.
- **Single-parameter mechanisms.** A mechanism is a pair of functions `x p : (ι → ℝ≥0) → ι → ℝ`,
  the allocation rule and the payment rule; `x b i` is the amount allocated to bidder `i`, which
  may be any real number (a fraction of an item, a click-through rate, a probability). A
  single-parameter environment is a set `X ⊆ ι → ℝ` of feasible allocations; Myerson's lemma does
  not use `X`, and the results of Layer 4 that maximize over allocations name it. A bidder with
  value `v` has utility `v * x b i − p b i`. Individual rationality means
  `p b i ≤ b i * x b i` (a truthful bidder never loses); no positive transfers means `0 ≤ p b i`.
- **Integrals.** Myerson's payment uses the interval integral
  `∫ z in (0:ℝ)..(b i : ℝ), x (Function.update b i z.toNNReal) i`, a Lebesgue integral of the
  allocation itself, not a Stieltjes integral against it. The two agree by integration by parts:
  for a monotone allocation `g`, the Riemann–Stieltjes integral `∫₀ᵇ z dg(z)`, formed with the
  values of `g` at `0` and at `b`, equals `b g(b) − ∫₀ᵇ g`. For a monotone allocation the
  integrand is monotone, hence integrable on every bounded interval.
- **General environments.** In Layer 3 there is an outcome type `Ω`, each agent reports a
  valuation `Ω → ℝ`, a mechanism is a choice rule `f : (ι → Ω → ℝ) → Ω` with a payment rule
  `p : (ι → Ω → ℝ) → ι → ℝ`, and an agent with valuation `v` has utility `v (f b) − p b i`.
  Valuations range over all functions `Ω → ℝ`.
- **Bayesian setting.** In Layer 4 bidder `i`'s value has a law `μ i : Measure ℝ≥0`, a probability
  measure, the values are independent, and expectations are integrals against `Measure.pi μ`. The
  law seen on `ℝ` is `ν i = (μ i).map (↑)` and its distribution function is
  `ProbabilityTheory.cdf (ν i)`. Bayesian incentive compatibility is required at every value in
  `ℝ≥0`, not only on the support of the law. A mechanism with that property at every value of
  an interval `[a, h]` (or `[a, ∞)`) that carries all the laws extends to one with it at every
  value without changing its expected payments, by treating a report above `h` as the report `h`
  and a report below `a` as the report `a`; the interval matters, since a value in a gap of the
  support is unconstrained (one bidder, values uniform on `[0, 1] ∪ [2, 3]`, the item at price `1`
  for reports at least `2` and nothing otherwise: every value of the support reports truthfully,
  and the value `3/2` gains `1/2` by reporting `2`).
- **Junk values.** Division by zero is `0` in Lean, so the virtual value
  `z − (1 − F z) / f z` equals `z` where `f z = 0`; every statement that uses virtual values
  assumes that the density is positive almost everywhere above the bottom of the support where
  `F < 1`, and the counterexamples to the virtual-welfare formula without that hypothesis are
  Checks of 4.3. The Bochner integral of a function that is not integrable is `0`, so every
  identity between expectations in Layer 4 states its measurability and integrability
  hypotheses, and states integrability of each side that is not assumed.

## Layer 1: single-parameter mechanisms and Myerson's lemma

### 1.1 Incentive compatibility, monotone allocation rules and Myerson's payment

Define `IsDSIC x p`: for every profile `b`, bidder `i` and value `v`, the utility
`v * x b i − p b i` of bidding `b i` is at most the utility of bidding `v` against the same
other bids (Roughgarden, Lecture 2, Claim 4.1, p. 3, for the notion; Lecture 3, Definition 4.1,
p. 3, for implementable rules). Define `IsMonotoneAlloc x`: for every profile `b` and bidder
`i`, `z ↦ x (Function.update b i z) i` is monotone (Lecture 3, Definition 4.2, p. 3). Define
`myersonPayment x b i` as `b i * x b i` minus the integral over `[0, b i]` of bidder `i`'s
allocation as a function of its own bid (Lecture 3, (6) and (7), pp. 5–6, for the step and the
differentiable forms; Hartline, Corollary 2.10.3, p. 49, for this integral form).

- Myerson's payment at bid `0` is `0`, since the integral over `[0, 0]` vanishes.
- For a monotone allocation rule with `0 ≤ x (Function.update b i 0) i`, Myerson's payment lies
  between `0` and `b i * x b i`: the integral of a nondecreasing function over `[0, b]` lies
  between `b g(0)` and `b g(b)`.

**Checks.**
- A step at a critical bid. If bidder `i`'s allocation is `0` below `t` and `1` above `t`, with
  either value at `t`, Myerson's payment is `t` when the bidder bids above `t`, `0` below `t`,
  and `t · g(t)` at `t`; so the payment rule charges the critical bid, whichever way the tie at
  `t` is broken.
- A continuous allocation. For `g(z) = min(z, 1)`, Myerson's payment is `b²/2` for `b ≤ 1` and
  `1/2` for `b ≥ 1` (at `b = 1/2` it is `1/8`, at `b = 2` it is `2 − 3/2 = 1/2`).
- The wrong payment `p b i = b i * x b i` (each bidder pays its bid when served) is not
  incentive compatible: with the step allocation at `t = 1/2` above, a bidder of value `1` who
  bids `3/4` gets `1 − 3/4 = 1/4`, and bidding `1` gets `0`.
- The nonnegativity of `x` at bid `0` is needed for individual rationality: the constant rule
  `x ≡ −1` is monotone, its Myerson payment is `−b + b = 0`, and a bidder of value `1` then has
  utility `−1`.

*Needs:* Mathlib `Function.update`, `intervalIntegral`, `Real.toNNReal`, `Monotone`.
(Proved here.)

### 1.2 The one-bidder incentive lemma

Prove: for functions `g q : ℝ≥0 → ℝ`, the inequalities `v g(b) − q(b) ≤ v g(v) − q(v)` for all
`v b : ℝ≥0` hold if and only if `g` is monotone and `q(b) = q(0) + b g(b) − ∫₀ᵇ g` for every
`b`, with the integral as in the Conventions. This is the lemma behind Myerson's lemma (Lecture
3, §5, pp. 4–6, with the payment difference sandwich (4), p. 5; Hartline, Theorem 2.5.1,
pp. 31–32, with its proof). It is a statement about two real functions and is stated in the
README only: it is exactly the case of one bidder (a type `ι` with one element) of the three
theorems of 1.3, which therefore test it. 1.3 and 4.1 apply it to the roadmap's objects.

Route. Writing the inequality for `(v, b) = (z, y)` and `(y, z)` gives
`z (g(y) − g(z)) ≤ q(y) − q(z) ≤ y (g(y) − g(z))`, whence `(z − y)(g(z) − g(y)) ≥ 0`, which is
monotonicity. Summing the sandwich over a partition of `[0, b]` traps `q(b) − q(0)` between the
lower and upper Riemann–Stieltjes sums of `∫₀ᵇ z dg(z)`, which converge, for monotone `g`, to
`b g(b) − ∫₀ᵇ g`. Conversely, if `q` has this form, the utility of value `v` bidding `b` falls
short of the truthful utility by `∫ from b to v of (g(t) − g(b)) dt`, which is nonnegative for
`b < v` and for `b > v` because `g` is monotone.

**Checks.**
- A non-monotone `g` has no `q`: for `g = 1` on `[1, 2)` and `0` elsewhere, `y = 3/2` and
  `z = 5/2` give `(z − y)(g(z) − g(y)) = −1 < 0`.
- The constant `q(0)` is free: adding a constant to `q` keeps every inequality.
- Brute force: for 400 random monotone step functions with rational breakpoints and arbitrary
  values at the breakpoints, the formula satisfies every inequality on a grid containing the
  breakpoints, with exact rational arithmetic.

*Needs:* Mathlib `Monotone.intervalIntegrable`, `intervalIntegral.integral_mono_on`, the
convergence of Riemann sums of a monotone function to its integral. (Proved here.)

### 1.3 Myerson's lemma

Prove `exists_isDSIC_iff_isMonotoneAlloc`: an allocation rule `x` admits a payment rule `p` with
`IsDSIC x p` if and only if `IsMonotoneAlloc x` (Roughgarden, Lecture 3, Theorem 4.3 (a), p. 4;
Myerson, 1981). Prove `isDSIC_myersonPayment`: if `x` is monotone, then
`IsDSIC x (myersonPayment x)` (Theorem 4.3 (b)–(c)). Prove `IsDSIC.payment_eq`: if `IsDSIC x p`,
then `p b i = p (Function.update b i 0) i + myersonPayment x b i` for every profile and bidder
(Theorem 4.3 (b), there under the normalization that bid `0` pays `0`; Hartline, Corollary
2.10.3, p. 49). In particular the payment rule is unique among those with
`p (Function.update b i 0) i = 0`, and two incentive compatible mechanisms with the same
allocation rule and the same payments at bid `0` have the same payments.

Route: for fixed `i` and other bids, the inequalities of `IsDSIC` at profiles
`Function.update b i y` are those of 1.2 for `g z = x (Function.update b i z) i` and
`q z = p (Function.update b i z) i`, since `Function.update (Function.update b i y) i z` is
`Function.update b i z`.

**Checks.**
- Highest bid wins. With one item, the allocation that serves a highest bidder is monotone, and
  Myerson's payment of the winner is the highest other bid; awarding the item to a
  second-highest bidder is not monotone (a winner who raises its bid above the highest bid
  loses), so no payment rule makes it incentive compatible (Lecture 3, p. 3).
- The normalization matters: `myersonPayment x + 1` is also incentive compatible for a monotone
  `x`, and it differs from `myersonPayment x` at bid `0`.

*Needs:* 1.2; Mathlib `Function.update_idem`, `Function.update_eq_self`. (Proved here.)

### Examples

The step and continuous allocations of 1.1, the highest-bid rule of 1.3, and position auctions:
with slot weights `α₁ ≥ α₂ ≥ ⋯` the rule that gives the `j`-th highest bidder slot `j` is
monotone, and Myerson's payment of the `i`-th highest bidder is
`∑_{j ≥ i} b_(j+1) (α_j − α_(j+1))` with `α` beyond the last slot `0` (Lecture 3, (8), p. 8).

### Dependencies

Mathlib `Function.update`, `intervalIntegral`, `Monotone.intervalIntegrable`,
`intervalIntegral.integral_mono_on`, `Real.toNNReal`. No other layer.

## Layer 2: second-price auctions

### 2.1 Second-price auctions with a reserve

Define `IsHighestBidder w` for a winner rule `w : (ι → ℝ≥0) → ι`: `b j ≤ b (w b)` for all `b`
and `j`; ties are broken in any way, possibly depending on the whole profile. Define
`secondPriceAlloc w r`, which serves `w b` when `r ≤ b (w b)` and nobody otherwise, and
`secondPricePay w r`, which charges the served bidder `i` the larger of `r` and
`(univ.erase i).sup b`, the highest other bid (the supremum in `ℝ≥0` of the empty family is `0`),
and charges nobody else. Define `singleItem ι`, the allocations `y : ι → ℝ` with `0 ≤ y i` and
`∑ i, y i ≤ 1`.

Prove `isDSIC_secondPrice`: for every winner rule with `IsHighestBidder w` and every reserve `r`,
the second-price auction is incentive compatible, and every payment lies between `0` and the bid
times the allocation (Roughgarden, Lecture 2, Claims 4.1 and 4.2, p. 3, for `r = 0`, with the
footnote on ties; Hartline, Definition 3.3.5, p. 70, for the reserve).

Route: bidder `i`'s allocation is `0` below the threshold `T = max r B`, with `B` the highest
other bid, and `1` above it, so it is monotone, and its Myerson payment is `T` when served and
`0` otherwise, which is `secondPricePay w r`; 1.3 gives incentive compatibility. At a bid equal
to `T` the rule may serve or not, and both cases give the bidder of value `T` utility `0`.

**Checks.**
- One bidder: the highest other bid is `0`, so the auction is the posted price `r`.
- Ties: with bids `(3, 3)`, whichever bidder `w` serves pays `3` and has utility `0` at value `3`.
- Brute force over every bid profile on the grid `{0, 1/2, …, 3}` for one, two and three
  bidders, reserves `0`, `1`, `3/2` and random tie-breaking: no profitable deviation, every
  payment between `0` and bid times allocation, and every payment equal to Myerson's payment.

*Needs:* 1.1, 1.3; Mathlib `Finset.sup`, `Finset.le_sup`. (Proved here.)

### 2.2 The Vickrey auction: welfare and the uniqueness of the dominant bid

Prove `vickrey_welfare`: with reserve `0` the allocation lies in `singleItem ι` and maximizes
`∑ i, b i * y i` over `y ∈ singleItem ι` (Lecture 2, Theorem 5.1, p. 4). Prove
`vickrey_dominant_iff`: with at least two bidders, a bid `β` of a bidder with value `v` is
dominant, that is, against every profile of other bids it gives at least the utility of every
other bid, if and only if `β = v` (Lecture 2, p. 4, where it is left as an exercise).

Route for welfare: `∑ i, b i * y i ≤ (max b) · ∑ i, y i ≤ max b`, and the Vickrey allocation
attains `max b`. Route for uniqueness: if `β > v`, let another bidder bid `B = (v + β)/2` and the
rest bid `0`; bidding `β` wins at price `B > v`, bidding `v` loses. If `β < v`, the same profile
with `B = (β + v)/2` makes `β` lose and `v` win at a price below `v`. Neither argument depends on
the tie-breaking, since the deviating bid is strictly above or below `B`.

**Checks.**
- Two bidders are needed: with one bidder the price is always `0`, the bidder always wins, and
  every bid is dominant.
- The reserve must be `0` for uniqueness: with reserve `r > 0`, a bidder of value `v < r` never
  gains from winning, and every bid below `r` is dominant.
- Brute force for two bidders: on the bid grid `{0, 1/4, …, 3}`, with other bids on the finer
  grid `{0, 1/8, …, 3}`, the only dominant bid of each value in `{0, 1/2, …, 3}` is the value
  itself.

*Needs:* 2.1. (Proved here.)

### Examples

Posted prices (one bidder), the Vickrey auction, and the second-price auction with reserve
`1/2`, which 4.5 shows to be optimal for two bidders with values uniform on `[0, 1]`.

### Dependencies

Layer 1; Mathlib `Finset.sup`, `Finset.le_sup`, `Fintype.card`.

## Layer 3: general environments, Groves and VCG mechanisms

### 3.1 Welfare maximization and incentive compatibility

Define `IsWelfareMaximizer f`: `∑ j, b j ω ≤ ∑ j, b j (f b)` for every profile `b` of reported
valuations and every outcome `ω` (Roughgarden, Lecture 7, (1), p. 2). Define
`IsDSICGeneral f p`: for every profile `b`, agent `i` and valuation `v`, the utility
`v (f b) − p b i` of reporting `b i` is at most that of reporting `v`.

- A welfare-maximizing choice rule exists when `Ω` is finite and nonempty (choose a maximizer of
  the finite family of totals). It need not exist otherwise: for one agent on `Ω = ℕ` the
  valuation `n ↦ 1 − 1/(n + 1)` has no maximizer, so `IsWelfareMaximizer f` holds for no `f`.

*Needs:* Mathlib `Finset.sum`, `Function.update`. (Proved here.)

### 3.2 Groves mechanisms

Prove `isDSICGeneral_groves`: for any outcome type `Ω`, any welfare-maximizing choice rule `f`,
and any `h : ι → (ι → Ω → ℝ) → ℝ` with `h i (Function.update b i v) = h i b`, the payment rule
`p b i = h i b − ∑ j ∈ univ.erase i, b j (f b)` makes the mechanism incentive compatible
(Groves, 1973; Roughgarden, Lecture 7, §2, pp. 2–3, for the Clarke choice of `h`).

Route: agent `i`'s utility when reporting `b i` is `v (f b) + ∑_{j ≠ i} b j (f b) − h i b`;
reporting `v` replaces the first two terms by the total reported welfare of `f` at the profile
with `v`, which is at least the same total at `f b`, while `h i` does not change.

**Checks.**
- `h i` must not depend on agent `i`'s report: one agent, two outcomes `a` and `c`, and
  `h b = b a` (so the payment is `b a`). The truthful valuation `(a ↦ 1, c ↦ 0)` gets outcome
  `a` and utility `0`; the report `(a ↦ −5, c ↦ 0)` gets outcome `c`, payment `−5` and utility
  `5`.
- With one agent and `h = 0` the mechanism charges nothing and chooses the agent's favourite
  outcome.

*Needs:* 3.1; Mathlib `Finset.sum_erase_add`. (Proved here.)

### 3.3 The VCG mechanism

Define `clarkePivot b i` on a finite nonempty `Ω` as the largest total reported value of the
agents other than `i`, `univ.sup' univ_nonempty fun ω ↦ ∑ j ∈ univ.erase i, b j ω`, and
`vcgPayment f b i` as `clarkePivot b i − ∑ j ∈ univ.erase i, b j (f b)` (Lecture 7, (2), p. 3).

Prove `vcgPayment_properties`: for a welfare-maximizing `f`, the VCG mechanism is incentive
compatible, its payments are nonnegative, and an agent whose reported valuation is nonnegative
at every outcome has nonnegative utility (Lecture 7, Theorem 2.1, p. 2, and the exercises stated
on pp. 3–4; Clarke, 1971; Vickrey, 1961).

Route: incentive compatibility is 3.2 with `h = clarkePivot`. Nonnegativity: the pivot is a
maximum over all outcomes, so it is at least the value at `f b`. Utility: it is
`∑ j, b j (f b) − ∑_{j ≠ i} b j ω'` for an outcome `ω'` attaining the pivot, which is at least
`∑ j, b j ω' − ∑_{j ≠ i} b j ω' = b i ω' ≥ 0`.

**Checks.**
- Nonnegative valuations are needed for the utility bound: one agent, one outcome, valuation
  `−1`; the pivot and the payment are `0` and the utility is `−1`.
- The Vickrey auction is the VCG mechanism on `Ω = Option ι` with bidder `j` valuing `some j` at
  its bid and every other outcome at `0`, and the welfare-maximizing choice rule
  `b ↦ some (w b)` for a winner rule `w` as in 2.1: the winner's pivot is the highest other bid
  and the others' reported value of the chosen outcome is `0`; a loser's pivot is the winner's
  bid, which the others' reported value of the chosen outcome equals.
- Brute force: for one to three agents, one to three outcomes, valuations with values in
  `{−1, 0, 1, 2}` and random tie-breaking among welfare maximizers, no report improves on the
  truth, no payment is negative, and the utility is negative only for agents with a negative
  value somewhere.

*Needs:* 3.2; Mathlib `Finset.sup'`, `Finset.le_sup'`, `Finset.exists_mem_eq_sup'`. (Proved
here.)

### Examples

Single-item auctions as above; auctions of two items to bidders with valuations on bundles,
where `Ω` assigns each item to a bidder or to nobody.

### Dependencies

Mathlib `Finset.sum`, `Finset.sup'`, `Function.update`. No other layer (the Vickrey Check uses
Layer 2).

## Layer 4: Bayesian incentive compatibility and expected revenue

### 4.1 Interim rules and Bayesian incentive compatibility

Define `interimAlloc μ x i z` and `interimPay μ p i z` as the integrals against
`Measure.pi μ` of `x (Function.update v i z) i` and `p (Function.update v i z) i`: bidder `i`'s
expected allocation and payment when it reports `z` and the others report independent values
(Hartline, p. 48, for the interim rules). Define `IsBIC μ x p`: for every bidder `i` and all
`v z : ℝ≥0`, `v * interimAlloc μ x i z − interimPay μ p i z` is at most the same expression at
`z = v` (Hartline, Definition 2.10.2, p. 47).

- By 1.2, `IsBIC μ x p` holds if and only if, for every bidder, the interim allocation is
  monotone and the interim payment at `z` is the interim payment at `0` plus
  `z · interimAlloc μ x i z` minus the integral of the interim allocation over `[0, z]`
  (Hartline, Corollary 2.10.2, p. 49).
- An incentive compatible mechanism whose allocation rule is measurable and bounded and whose
  payments at bid `0` vanish is Bayesian incentive compatible for every family of probability
  laws, and its payments are integrable when the value laws have finite means: by 1.3 the
  payment is `myersonPayment x`, bounded in absolute value by `2C · b i` when `|x| ≤ C`, and
  measurable as a parametric integral; integrating the inequality of `IsDSIC` over the other
  bids gives `IsBIC`.

**Checks.**
- The first-price auction for two bidders with values uniform on `[0, 1]`, as a direct
  mechanism in which a highest reporter wins and pays half of its report truncated at `1`, is
  Bayesian incentive compatible at every value in `ℝ≥0`: the interim allocation is `min(z, 1)`,
  the interim payment `min(z, 1)²/2`, and for values `3/2` and `3` the best report gives
  utility `1` and `5/2`, attained by the truthful report. Without the truncation a bidder of
  value `3` gains by reporting `1`, so incentive compatibility at every value fails.

*Needs:* 1.2, 1.3; Mathlib `MeasureTheory.Measure.pi`, `MeasureTheory.integral_mono`,
`MeasureTheory.StronglyMeasurable.integral_prod_right`. (Proved here.)

### 4.2 Revenue equivalence

Prove `interimPay_eq_of_isBIC`: two Bayesian incentive compatible mechanisms with the same
interim allocation for bidder `i` and the same interim payment at one report `z₀` have the same
interim payment at every report. Prove `integral_payment_eq_of_isBIC`: if moreover the laws are
probability measures and both payments are integrable against `Measure.pi μ`, bidder `i`'s
expected payments are equal (Hartline, Corollary 2.7.1, p. 38, for the case `z₀ = 0`;
Myerson, 1981).

Route: the first is the payment formula of 4.1 written for both mechanisms, at `z` and at `z₀`.
For the second, split `Measure.pi μ` into bidder `i`'s coordinate and the others' by
`MeasureTheory.measurePreserving_piEquivPiSubtypeProd`; by Fubini the expected payment is the
integral of the interim payment against `μ i`, because overwriting coordinate `i` and
integrating over it changes nothing when `μ i` is a probability measure.

**Checks.**
- First-price and second-price auctions, two bidders, values uniform on `[0, 1]`: both interim
  payments are `z²/2` on `[0, 1]` (at `z = 0.3, 0.7, 1` both are `0.045, 0.245, 0.5`), and each
  bidder pays `1/6` in expectation in both, for a revenue of `1/3`.
- The base point matters: adding `1` to every payment of a mechanism keeps it Bayesian
  incentive compatible, keeps the interim allocation and raises the expected payment by `1`.

*Needs:* 4.1; Mathlib `MeasureTheory.measurePreserving_piEquivPiSubtypeProd`,
`MeasureTheory.integral_prod`, `MeasureTheory.MeasurePreserving.integral_comp'`. (Proved here.)

### 4.3 Virtual values and the expected revenue

Define `virtualValue ν f z = z − (1 − cdf ν z) / f z` (Roughgarden, Lecture 5, Step 4, p. 5;
Hartline, (3.3.2), p. 65). Define `HasPositiveDensityFrom μ f a` for a law `μ` on `ℝ≥0`: `f` is
measurable, `μ.map (↑)` is `volume.withDensity fun z ↦ ENNReal.ofReal (f z)`, `μ (Set.Iio a) = 0`,
for almost every `z > a` with `cdf (μ.map (↑)) z < 1` the density `f z` is positive, and
`z ↦ (z : ℝ)` is `μ`-integrable.

Prove `integral_payment_eq_virtualWelfare`: let `IsBIC μ x p`, let each `μ j` be a probability
measure, and for bidder `i` let `HasPositiveDensityFrom (μ i) (f i) a`, let
`b ↦ x b i` be measurable with `|x b i| ≤ C`, and let `v ↦ p v i` be integrable. Then
`v ↦ virtualValue (ν i) (f i) (v i) * x v i` is integrable and bidder `i`'s expected payment
equals its expectation minus `a * interimAlloc μ x i a − interimPay μ p i a`, the interim
utility of a bidder of value `a` (Roughgarden, Lecture 5, (4)–(6), pp. 5–6, for `a = 0`,
densities on `[0, vmax]` and dominant-strategy incentive compatible mechanisms normalized at
`0`; Hartline, (3.3.3), p. 65; Myerson, 1981, for the lowest-type term). Summing over
bidders, expected revenue equals expected virtual welfare minus the lowest types' utilities.

Route: by Fubini (4.2) the expected payment is `∫ P dμ_i` with `P` the interim payment, and by
4.1 `P(z) = P(a) + z X(z) − a X(a) − ∫ₐᶻ X` for the interim allocation `X`, which is monotone and
bounded by `C`. The finite mean makes `z X(z)` integrable; by Fubini and the layer cake formula
`∫ (∫ₐᶻ X) dμ_i(z) = ∫ₐ^∞ X(t)(1 − F(t)) dt`, and `∫ z X(z) dμ_i = ∫ X(t) t f(t) dt`. Where
`f(t) > 0`, `t f(t) − (1 − F(t)) = virtualValue · f(t)`; for almost every `t > a` with
`f(t) ≤ 0` the hypothesis gives `F(t) = 1`, so both sides vanish there. Fubini again turns
`∫ virtualValue · X dμ_i` into the expectation over the profile; the integrand is bounded by
`C (t f(t) + 1 − F(t))`, whose integral is at most twice the mean.

**Checks.**
- One bidder, values uniform on `[0, 1]`, posted price `r`: the virtual value is `2z − 1`, the
  revenue `r(1 − r)` equals `∫_r^1 (2z − 1) dz` (`0.1875, 0.25, 0.16` at `r = 0.25, 0.5, 0.8`).
- Exponential values of rate `2`: the virtual value is `z − 1/2`; for the posted price `1/2`
  both sides are `e⁻¹/2 ≈ 0.18394`, and for the continuous rule `x(z) = min(z, 1)` with Myerson's
  payments both are `0.148499` to six places.
- The lowest-type term: values uniform on `[1, 2]` (`a = 1`), the mechanism that always serves
  and never charges. The expected payment is `0`, the expected virtual welfare
  `∫₁² (2z − 2) dz = 1`, and the lowest type's utility `1`.
- The density must be positive above `a`: the same law with `a = 0` violates the hypothesis on
  `(0, 1)`, and the formula without the lowest-type term would give `1 ≠ 0`. For the law with
  density `1/2` on `[0, 1] ∪ [2, 3]` and the posted price `3/2`, the revenue is `3/4` while the
  expected virtual welfare is `1`; the integrated form `∫ x(t)(t f(t) − (1 − F(t))) dt` gives
  `3/4`, the difference being the gap `(1, 2)`, where `f = 0` and `F = 1/2`.
- The finite mean is needed: for the Lomax law with density `(1/2)(1 + z)^(−3/2)` the posted price
  `1` earns `2^(−1/2)`, but `∫₁ᵀ (t f(t) − (1 − F(t))) dt` tends to `−∞` (about `−9.2`, `−99`,
  `−999` at `T = 10², 10⁴, 10⁶`), so the virtual welfare is not integrable.
- A finite mean alone does not make Myerson's payments integrable, which is why 4.1 and 4.4 bound
  the allocation: for the unbounded rule `x(z) = z` and the Lomax law with exponent `3/2` (density
  `(3/2)(1 + z)^(−5/2)`, mean `2`, infinite second moment), Myerson's payment `z²/2` has infinite
  expectation (its integral up to `T` is about `11.4`, `146`, `1496` at `T = 10², 10⁴, 10⁶`).

*Needs:* 4.1, 4.2; Mathlib `ProbabilityTheory.cdf`, `ProbabilityTheory.cdf_eq_real`,
`MeasureTheory.Measure.withDensity`, `integral_withDensity_eq_integral_smul`,
`MeasureTheory.Integrable.integral_eq_integral_meas_lt`, `MeasureTheory.integral_integral_swap`,
`Monotone.measurable`. (Proved here.)

### 4.4 Myerson's optimal auction

Prove `sum_integral_payment_le_myerson`: let every `μ i` be a probability measure with
`HasPositiveDensityFrom (μ i) (f i) 0` whose virtual value is strictly increasing on `[0, ∞)`
(strict regularity). Let `X` be a set of allocations with `|y j| ≤ C` for all `y ∈ X`, and let
`xs` be a measurable allocation rule with values in `X` that maximizes
`∑ j, virtualValue (ν j) (f j) (b j) * y j` over `y ∈ X` at every profile `b`. Then
`IsDSIC xs (myersonPayment xs)`, and every mechanism `(x, p)` with `IsBIC μ x p`, measurable `x`
with values in `X`, integrable payments and `interimPay μ p i 0 ≤ 0` for every `i` has expected
revenue at most that of `(xs, myersonPayment xs)` (Roughgarden, Lecture 5, Definition 3.1, p. 7,
for regularity as a strictly increasing virtual value, and §3.1, pp. 7–8, for optimality among
dominant-strategy incentive compatible mechanisms, with the monotonicity of the maximizer left to
the exercises; §3.2, p. 8, where optimality among Bayesian incentive compatible mechanisms is
stated without proof; Hartline, Lemma 3.3.1 and Definition 3.3.1, p. 66, Theorem 3.3.2, p. 68;
Myerson, 1981).

Route: for `v' > v`, adding the maximality inequalities of `xs` at `Function.update b i v` and
at `Function.update b i v'` cancels the other bidders and leaves
`(φ_i(v') − φ_i(v)) (xs_i(v') − xs_i(v)) ≥ 0`; strict monotonicity of `φ_i` gives
`xs_i(v') ≥ xs_i(v)`, and 1.3 gives incentive compatibility. By 4.1 the mechanism is Bayesian
incentive compatible with integrable payments, and its interim payment at `0` is `0`. By 4.3
each competitor's revenue is its expected virtual welfare plus its interim payments at `0`,
hence at most its expected virtual welfare, which is at most that of `xs` pointwise; by 4.3 again
that is the revenue of `xs`.

**Checks.**
- Strictness of regularity avoids tie-breaking: the route above uses no tie-breaking rule, while
  with a virtual value that is only nondecreasing two profiles may tie and a maximizer may
  switch, for instance a bidder whose virtual value is constant on `[1, 2]`, tied with another
  bidder, served at bid `1` and not at bid `3/2`.
- Regularity is needed: the law with density `0.8` on `[0, 1]` and `0.1` on `(1, 3]` has virtual
  value `2z − 1.25` on `[0, 1]` and `2z − 3` on `(1, 3]`, so the one-bidder maximizer serves on
  `[0.625, 1]` and on `[1.5, 3]` but not on `(1, 1.5)`: it is not monotone, and by 1.3 no payment
  makes it incentive compatible.
- The constraint `interimPay μ p i 0 ≤ 0` is needed: charging every bidder a fixed fee `c > 0` on
  top of the optimal payments keeps Bayesian incentive compatibility and raises revenue by `n c`.

*Needs:* 1.3, 4.1, 4.3; Mathlib `StrictMonoOn`, `Finset.sum_le_sum`, `MeasureTheory.integral_mono`.
(Proved here.)

### 4.5 The second-price auction with monopoly reserve

Prove `sum_integral_payment_le_secondPrice`: let all values have the same law `μ₀`, a
probability measure with `HasPositiveDensityFrom μ₀ f 0` and strictly increasing virtual value
`φ`, let `r` satisfy `0 ≤ φ(r)` and `φ(z) ≤ 0` for `z < r`, and let `w` be a winner rule with
`IsHighestBidder w` and `{b | w b = i}` measurable for every `i`. Then every mechanism as in 4.4
with allocations in `singleItem ι` has expected revenue at most that of the second-price auction
with reserve `r` (Roughgarden, Lecture 5, p. 8, where `r = φ⁻¹(0)`; Hartline, Corollary 3.3.5 and
Example 3.3.4, p. 70).

Route: since all bidders share `φ`, a highest bidder has the highest virtual value; it is
nonnegative exactly when the highest bid is at least `r` under the hypotheses on `r`, so
`secondPriceAlloc w r` maximizes virtual welfare over `singleItem ι` at every profile and is
measurable; 2.1 identifies `secondPricePay w r` with its Myerson payment, and 4.4 applies.

**Checks.**
- Two bidders uniform on `[0, 1]`: `φ(z) = 2z − 1` on `[0, 1]` and `z` above `1` (where the
  density vanishes and Lean's division gives `0`), strictly increasing; `r = 1/2`. The revenue of
  the second-price auction with reserve `r` is `(1 + 3r² − 4r³)/3`, `1/3` at `r = 0` and `5/12` at
  `r = 1/2`, and `1/2` maximizes it over `[0, 1]`.
- One bidder uniform on `[0, 1]`: the auction is the posted price `1/2`, with revenue `1/4`, the
  largest value of `r(1 − r)`.
- Exponential values of rate `λ`: `φ(z) = z − 1/λ` and `r = 1/λ`, whatever the number of bidders.

*Needs:* 2.1, 4.4. (Proved here.)

### Examples

Posted prices, the Vickrey auction, the first-price auction as a direct mechanism, and
second-price auctions with reserve, for uniform and exponential values.

### Dependencies

Layers 1 and 2 (1.2, 1.3, 2.1); Mathlib `MeasureTheory.Measure.pi`,
`MeasureTheory.measurePreserving_piEquivPiSubtypeProd`, `MeasureTheory.integral_prod`,
`MeasureTheory.integral_integral_swap`, `MeasureTheory.Measure.withDensity`,
`integral_withDensity_eq_integral_smul`, `ProbabilityTheory.cdf`,
`MeasureTheory.Integrable.integral_eq_integral_meas_lt`.

## Scope and ownership

This roadmap owns: single-parameter mechanisms with dominant-strategy incentive compatibility,
the one-bidder incentive lemma and Myerson's lemma with the payment formula; second-price
auctions with a reserve, the welfare optimality of the Vickrey auction and the uniqueness of its
dominant bid; Groves mechanisms and the VCG mechanism with Clarke pivot payments; interim rules,
Bayesian incentive compatibility, revenue equivalence, virtual values, the expected-revenue
formula, and Myerson's optimal auction for strictly regular laws with its single-item,
identically distributed form.

At the pins neither Mathlib nor Tau Ceti has mechanisms, auctions, incentive compatibility or
virtual values; the libraries supply the measure theory and integration listed in the supplier
contracts below.

Neighbouring roadmaps, from which nothing is used:

- RegretMinimizationAndEquilibria owns finite games in utility form, mixed Nash equilibria and
  correlated equilibria, and lists mechanism design as outside its scope. The dominant-strategy
  and interim notions above are properties of a mechanism, not equilibria of a given game, and
  none of its notions is used.
- PotentialGamesAndPriceOfAnarchy owns potential and congestion games, smoothness and the price
  of anarchy, and lists mechanism design and auctions as outside its scope; the price of anarchy
  of auctions is not treated here.
- CooperativeGames owns coalitional games, the core and the Shapley value, and lists
  cost-sharing mechanisms and auctions as outside its scope; cost-sharing mechanisms are not
  treated here.
- KakutaniFixedPointAndContinuousGames owns Kakutani's fixed-point theorem and the existence of
  pure Nash equilibria in games with compact convex strategy sets (Debreu–Glicksberg–Fan);
  the existence of Bayes–Nash equilibria of auctions (for instance of the first-price auction)
  is not treated here, and the first-price auction appears above only as a direct mechanism.

Not treated here: the revelation principle (for a mechanism with dominant strategies, composing
the strategies with the mechanism gives a direct incentive compatible mechanism with the same
outcomes, a statement that holds by unfolding the definitions); Arrow's and the
Gibbard–Satterthwaite theorems and social choice functions without money; stable matching, the
Gale–Shapley algorithm and the incentive theorems of matching markets; the uniqueness of Groves
payments among welfare-maximizing incentive compatible mechanisms (Green–Laffont, Holmström);
cycle monotonicity and multi-parameter implementability; ironing for irregular laws; revenue
approximation (prophet inequalities, the Bulow–Klemperer theorem); combinatorial auctions and
their computational aspects; randomized and budget-constrained mechanisms; correlated values.

## Exact supplier contracts

### From Mathlib

- `Mathlib/Logic/Function/Basic.lean`: `Function.update`, `Function.update_idem` (updating the
  same coordinate twice keeps the second value), `Function.update_eq_self`.
- `Mathlib/MeasureTheory/Integral/IntervalIntegral/Basic.lean`: `intervalIntegral` (the integral
  `∫ x in a..b, f x ∂μ`, oriented); `Monotone.intervalIntegrable` (a monotone function is
  interval integrable against a locally finite measure on every interval);
  `intervalIntegral.integral_mono_on` (for `a ≤ b` and integrable `f`, `g` with `f ≤ g` on
  `[a, b]`, the integrals compare).
- `Mathlib/Basic/NNReal/Defs.lean`: `ℝ≥0` and `Real.toNNReal` (equal to `z` for `z ≥ 0`).
- `Mathlib/Data/Finset/Lattice/Fold.lean`: `Finset.sup` (for `ℝ≥0`, the empty supremum is `0`),
  `Finset.le_sup`, `Finset.sup'` (the supremum over a nonempty finset), `Finset.le_sup'`,
  `Finset.exists_mem_eq_sup'` (in a linear order the supremum is attained).
- `Mathlib/Algebra/BigOperators/Group/Finset/Defs.lean`: `Finset.sum`.
  `Mathlib/Algebra/BigOperators/Group/Finset/Basic.lean`: `Finset.sum_erase_add` (adding the
  erased term back gives the whole sum). `Mathlib/Algebra/Order/BigOperators/Group/Finset.lean`:
  `Finset.sum_le_sum`.
- `Mathlib/MeasureTheory/Constructions/BorelSpace/Basic.lean`: `NNReal.measurableSpace` (the
  Borel σ-algebra of `ℝ≥0`). `Mathlib/MeasureTheory/Constructions/BorelSpace/Order.lean`:
  `Monotone.measurable`.
- `Mathlib/MeasureTheory/Constructions/Pi.lean`: `MeasureTheory.Measure.pi` (the product of
  finitely many measures, with the product formula on boxes for σ-finite factors);
  `MeasureTheory.measurePreserving_piEquivPiSubtypeProd` (for a decidable predicate `p`,
  splitting coordinates into those satisfying `p` and the rest is measure preserving onto the
  product measure).
- `Mathlib/MeasureTheory/Integral/Prod.lean`: `MeasureTheory.integral_prod` (Fubini for an
  integrable function on a product of s-finite measures), `MeasureTheory.integral_integral_swap`,
  `MeasureTheory.StronglyMeasurable.integral_prod_right` (a parametric integral of a strongly
  measurable function is strongly measurable).
- `Mathlib/MeasureTheory/Integral/Bochner/Basic.lean`:
  `MeasureTheory.MeasurePreserving.integral_comp'`, `MeasureTheory.integral_mono`.
- `Mathlib/MeasureTheory/Measure/WithDensity.lean`: `MeasureTheory.Measure.withDensity`.
  `Mathlib/MeasureTheory/Integral/Bochner/ContinuousLinearMap.lean`:
  `integral_withDensity_eq_integral_smul` (for a measurable `f : X → ℝ≥0`, integrating `g`
  against `μ.withDensity f` is integrating `f • g` against `μ`).
- `Mathlib/Probability/CDF.lean`: `ProbabilityTheory.cdf` (a Stieltjes function, defined for
  every measure on `ℝ`), `ProbabilityTheory.cdf_eq_real` (for a probability measure,
  `cdf μ x = μ.real (Set.Iic x)`).
- `Mathlib/MeasureTheory/Integral/Layercake.lean`:
  `MeasureTheory.Integrable.integral_eq_integral_meas_lt` (for integrable `f ≥ 0` almost
  everywhere, `∫ f = ∫ t in Ioi 0, μ.real {f > t}`).

## References

- Tim Roughgarden, *CS364A: Algorithmic Game Theory*, lecture notes, Stanford University, fall
  2013, on the author's page `timroughgarden.org/f13/f13.html`: Lecture 2, *Mechanism Design
  Basics* (25 September 2013), Claims 4.1 and 4.2, p. 3, Theorem 5.1, p. 4; Lecture 3,
  *Myerson's Lemma* (30 September 2013), Definitions 4.1 and 4.2, p. 3, Theorem 4.3, p. 4,
  §5 with (4)–(7), pp. 4–6, and (8), p. 8; Lecture 5, *Revenue-Maximizing Auctions* (7 October
  2013), §2 with (4)–(6), pp. 3–6, Definition 3.1, p. 7, §3.1–3.2, pp. 7–8; Lecture 7,
  *Multi-Parameter Mechanism Design and the VCG Mechanism* (14 October 2013), Theorem 2.1 and
  (1)–(2), pp. 2–3, and (4), p. 3, with the remark after it, p. 4.
- Jason D. Hartline, *Mechanism Design and Approximation*, manuscript dated 26 September 2021,
  on the author's page `jasonhartline.com/MDnA/`: Theorem 2.5.1, pp. 31–32; Corollary 2.7.1,
  p. 38; Definition 2.10.2, p. 47; the interim rules, p. 48; Corollaries 2.10.2 and 2.10.3, p. 49;
  (3.3.2) and (3.3.3), p. 65; Lemma 3.3.1 and Definition 3.3.1, p. 66; Theorem 3.3.2, p. 68;
  Definition 3.3.5, Corollary 3.3.5 and Example 3.3.4, p. 70.
- The papers of Vickrey (1961), Clarke (1971), Groves (1973) and Myerson (1981, *Optimal auction
  design*, Mathematics of Operations Research) were not consulted; they are named as the two
  texts above attribute the results, without locators. The two texts state the expected-revenue
  formula of 4.3 only for supports starting at `0`; the lowest-type term for a support starting
  at `a > 0` is proved here by the route given. Roughgarden's regularity (Lecture 5, Definition
  3.1) is the strict form used in 4.4; Hartline's (Definition 3.3.1) is the nondecreasing form,
  under which a pointwise maximizer with arbitrary tie-breaking need not be monotone (Check of
  4.4).
