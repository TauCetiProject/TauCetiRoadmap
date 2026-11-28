# Roadmap: ruin theory

**Summary.** An insurance company starts with capital `u`, collects premiums at a constant rate and
pays claims that arrive at random times. Ruin is the event that its reserve ever becomes negative,
and the question is how its probability depends on `u`. Between two claims the reserve only grows,
so ruin can only happen at a claim. If `Yᵢ` is the `i`-th claim minus the premium earned since the
previous claim, ruin from capital `u` is therefore the event that some partial sum
`Sₙ = Y₀ + ⋯ + Yₙ₋₁` exceeds `u`. This roadmap develops that embedded random walk for independent,
identically distributed real increments of arbitrary law, with ruin meaning `Sₙ > u` strictly for
some `n ≥ 0`. Its main results are the following.

- *The net-profit condition.* If the increments have negative mean, ruin from any capital `u ≥ 0`
  has probability less than one, and the probability tends to zero as `u` grows. If the mean is
  positive, ruin is certain from every capital.
- *Lundberg's inequality.* If `E[exp (R Y₀)]` is finite and at most `1` for some `R ≥ 0`, then the
  probability that the walk ever reaches `u` or more is at most `exp (−R u)`, for every real `u`.
  The adjustment coefficient, the unique `R > 0` with `E[exp (R Y₀)] = 1`, exists whenever the mean
  is negative and `E[exp (r Y₀)] ≥ 1` for some `r > 0`.
- *The overshoot identity.* For increments that are not almost surely zero and the adjustment
  coefficient `R`, the expectation of `exp (R ξ)` over the event of ruin, where `ξ` is the amount
  by which the walk overshoots `u` at the time of ruin, equals `exp (−R u)`.
- *Exponential claims.* If each `Yᵢ` is a claim with the exponential law of rate `δ` minus an
  independent nonnegative premium income, and `R` is the adjustment coefficient, the ruin
  probability is exactly `(1 − R/δ) exp (−R u)` for `u ≥ 0`. For exponential waiting times of rate
  `λ` and premium rate `c` with `λ < c δ` this is `(λ/(c δ)) exp (−(δ − λ/c) u)`: Lundberg's
  bound has the right exponent and is too large by the factor `c δ/λ`.

It builds on Mathlib's martingales and on Tau Ceti's renewal counts, which carry the
continuous-time reserve, and its exponential law. It defines no Poisson or compound Poisson
process: those belong to PointProcesses. The two-barrier gambler's ruin of the nearest-neighbour
walk belongs to StochasticCalculus.

Layer 1 below defines the ruin probability and the time of ruin, reduces ruin of the
continuous-time reserve to ruin of the walk, and proves the net-profit dichotomy. Layer 2, which
uses no other layer, studies the equation `E[exp (R Y₀)] = 1` and the exponential martingale of a
walk with independent increments. Layer 3 uses Layers 1 and 2 to prove Lundberg's inequality and
the overshoot identity. Layer 4 uses Layers 1 and 3 to compute the ruin probability for exponential
claims.

## Conventions

- **Increments and the walk.** The increments are real random variables `Y i : Ω → ℝ`, `i : ℕ`, on
  a measurable space `Ω` with a measure `P`. The walk at time `n` is
  `Sₙ = ∑ i ∈ Finset.range n, Y i`, written out in every statement, so that `S₀ = 0` and `Y i`
  moves the walk from time `i` to time `i + 1`. In the insurance reading `Y i = Z i − c T i`, where
  `Z i` is the `i`-th claim, `T i` the waiting time before it and `c` the premium rate; Layers 1–3
  allow any real increments.
- **Independent, identically distributed increments.** A statement about the walk assumes that
  every `Y i` is measurable, that the family is independent (Mathlib's `iIndepFun Y P`) and that
  every `Y i` has the law of `Y 0` (Mathlib's `IdentDistrib (Y i) (Y 0) P P`). Independence of a
  family forces `P` to be a probability measure (Mathlib's `iIndepFun.isProbabilityMeasure`).
- **Ruin.** Ruin from capital `u ∈ ℝ` is the event `∃ n, u < Sₙ`: the reserve `u − Sₙ` is strictly
  negative at some time `n ≥ 0`. For `u < 0` the time `n = 0` gives ruin, so the ruin probability
  is `1` there. The weak event `∃ n, u ≤ Sₙ` contains it and is the one Lundberg's inequality
  bounds. Probabilities are values of `P` in `ℝ≥0∞`.
- **Time of ruin.** It is Mathlib's hitting time `hittingAfter`, with values in `WithTop ℕ` and the
  value `⊤` when ruin never happens; no infimum of an empty set of natural numbers is taken. The
  overshoot `S_τ − u` is read through Mathlib's `stoppedValue` and is used only on the event
  `τ ≠ ⊤`.
- **Moment generating functions and means.** `mgf X P t` is Mathlib's `∫ exp (t X) dP`, a Bochner
  integral, so it is `0` when `exp (t X)` is not integrable. A hypothesis `mgf X P R = 1` or
  `1 ≤ mgf X P r` therefore contains the integrability of the exponential; a hypothesis
  `mgf X P R ≤ 1` does not, and is stated together with that integrability. Likewise the mean
  `∫ X dP` is `0` for a non-integrable `X`, so a strict sign of the mean contains integrability.
  Increments without a mean are outside 1.3.
- **Exponential laws.** `expMeasure r` is Mathlib's exponential law of rate `r` and mean `1/r`. For
  `r ≤ 0` it is the zero measure, so a hypothesis `HasLaw X (expMeasure r) P` with `P` a
  probability measure forces `r > 0`.

## Layer 1: the embedded random walk and its ruin probability

### 1.1 Ruin probability and time of ruin

Define `ruinProb P Y u : ℝ≥0∞` as `P {ω | ∃ n, u < ∑ i ∈ Finset.range n, Y i ω}`, the ruin
probability from capital `u`, and `ruinTime Y u : Ω → WithTop ℕ` as Mathlib's
`hittingAfter (fun n ω ↦ ∑ i ∈ Finset.range n, Y i ω) (Set.Ioi u) 0`, the first `n ≥ 0` with
`Sₙ > u`, and `⊤` if there is none (Kevei, §11.1, p. 72, writes `ψ(u) = P(M > u)` for the maximum
`M = sup_{n≥0} Sₙ` of the embedded walk, with ruin meaning a strictly negative reserve; there `ψ` is
defined through the reserve and identified with `P(M > u)`).

- The ruin probability is nonincreasing in `u` and equals `1` for `u < 0`.
- The ruin event is `{ruinTime Y u ≠ ⊤}`; for measurable increments the time of ruin is a stopping
  time for the natural filtration of the walk, `ℱ n = σ(S₀, …, Sₙ) = σ(Y 0, …, Y (n − 1))`
  (Mathlib's `Filtration.natural` of the partial sums). This is the filtration of Layer 3; the
  natural filtration of the increments themselves, `σ(Y 0, …, Y n)` at time `n`, contains `Y n` and
  is not the one 2.2 applies to.
- The ruin probability is `P(M > u)` for the supremum `M` of the walk in `[0, ∞]`; it is not
  `P(M ≥ u)`.

**Checks.**
- Strict against weak ruin. For the walk with steps `+1` with probability `p` and `−1` with
  probability `q = 1 − p`, `p < q`, the walk reaches the integer level `k ≥ 0` with probability
  `(p/q)^k`, so `ruinProb P Y u = (p/q)^(⌊u⌋ + 1)` for `u ≥ 0`, while the weak event has
  probability `(p/q)^⌈u⌉`. For `p = 0.3` and `u = 1` these are `0.18367` and `0.42857`.
- For the increments `Y i = 0` the ruin probability is `0` for `u ≥ 0` and `1` for `u < 0`, and
  the time of ruin is `⊤` for `u ≥ 0` and `0` for `u < 0`. A definition with `u ≤ Sₙ` would give
  ruin from capital `0` for this walk.

*Needs:* Mathlib `MeasureTheory.hittingAfter`, `MeasureTheory.Adapted.isStoppingTime_hittingAfter`,
`MeasureTheory.Filtration.natural`. (Proved here.)

### 1.2 Ruin happens at claim instants

Prove `measure_exists_reserve_neg_eq_ruinProb`: let the waiting times `T i : Ω → ℝ≥0` be
measurable, independent, identically distributed and not almost surely zero (`P {T 0 = 0} < 1`),
let the claims `Z i : Ω → ℝ` be almost surely nonnegative, and let `c, u ∈ ℝ`. With `N t` Tau
Ceti's `renewalCount T t`, the number of claims in `[0, t]`, the probability that the reserve
`u + c t − (Z 0 + ⋯ + Z (N t − 1))` is strictly negative at some time `t ≥ 0` equals
`ruinProb P (fun i ω ↦ Z i ω − c * T i ω) u` (Kevei, §11.1, p. 72, observes that ruin occurs at a
claim and reduces ruin to the embedded walk; the reduction is proved here for every real `c`).

Route: by Tau Ceti's `ae_tendsto_arrival_atTop` the arrival times `Aₙ = T 0 + ⋯ + T (n − 1)` tend
to infinity almost surely, so on almost every path every `t ≥ 0` lies in exactly one interval
`[Aₙ, Aₙ₊₁)`, where `N t = n` (`renewalCount_eq_natCast_iff`). On such a path, fix `n` with
`[Aₙ, Aₙ₊₁)` nonempty.
For `c ≥ 0` the reserve on that interval is smallest at `t = Aₙ`, where it is `u − Sₙ`. For `c < 0`
it is larger than `u + c Aₙ₊₁ − (Z 0 + ⋯ + Z (n − 1)) ≥ u − Sₙ₊₁`, using `Z n ≥ 0`. Conversely, if
`Sₙ > u`, let `m ≥ n` be the first index with `T m > 0`, which exists since the arrivals tend to
infinity; then `Aₘ = Aₙ`, `Sₘ ≥ Sₙ` because the claims are nonnegative, and the reserve at `Aₘ` is
`u − Sₘ < 0`. The two events agree outside a null set, so their probabilities agree
(`measure_congr`, which assumes no measurability): neither the event of the left side, a union
over uncountably many times, nor the claims need to be measurable.

**Checks.**
- Nonexplosion is needed. For `T i = 0`, `Z i = 1` and `u = 0` every count `N t` is infinite, so
  the reserve is never defined by a finite count and the left side is `0`, while the walk has
  `S₁ = 1 > 0` and the right side is `1`.
- Nonnegative claims are needed when waiting times can vanish. Let the `T i` be independent and
  uniform on `{0, 1}`, let `E = {T 0 = 1, T 1 = 0}`, of probability `1/4`, and let `Z 0 = 10` and
  `Z 1 = −10` on `E`, all other claims `0`; take `c = 1` and `u = 5`. On `E` the walk has
  `S₁ = 9 > 5`, while the two claims arrive together at time `1` and cancel, so the reserve is
  `5 + t`; off `E` all claims vanish, the reserve is `5 + t` and the walk has `Sₙ ≤ 0`. The left
  side is `0` and the right side `1/4`.
- For `u < 0` both sides are `1`: the reserve at `t = 0` is `u − (Z 0 + ⋯ + Z (N 0 − 1)) < 0`.

*Needs:* 1.1; Tau Ceti `TauCeti.Probability.renewalCount`, `TauCeti.Probability.arrival`,
`TauCeti.Probability.renewalCount_eq_natCast_iff`, `TauCeti.Probability.ae_tendsto_arrival_atTop`;
Mathlib `MeasureTheory.measure_congr`.

### 1.3 The net-profit condition

Prove, for measurable, independent, identically distributed increments:

- `ruinProb_lt_one_and_tendsto_zero`: if `∫ Y 0 dP < 0`, then `ruinProb P Y u < 1` for every
  `u ≥ 0`, and `ruinProb P Y u → 0` as `u → ∞`.
- `ruinProb_eq_one`: if `0 < ∫ Y 0 dP`, then `ruinProb P Y u = 1` for every real `u`.

(Kevei, Proposition 5, p. 72, in the renewal model `Y = Z − c T` with nonnegative independent `Z`
and `T`; there the case of zero mean is included in the second statement and its proof omitted.
The statements here allow any integrable increments, by the same strong-law argument.)

Route: by the strong law (Mathlib `ProbabilityTheory.strong_law_ae`) `Sₙ/n → E Y₀` almost surely.
For positive mean `Sₙ → ∞`, so the supremum is infinite. For negative mean `Sₙ → −∞`, so
`M = sup Sₙ` is finite almost surely and `P(M > u) → 0` by continuity of `P` along the decreasing
events `{M > u}` with empty intersection. For `ψ(0) < 1`: choose `u₀` with `P(M ≤ u₀) > 0` and
`ε > 0` with `P(Y₀ ≤ −ε) > 0`, which exists since the mean is negative, and `m` with `m ε ≥ u₀`.
The event that `Y₀, …, Yₘ₋₁ ≤ −ε` and that the walk restarted at time `m` stays at most `u₀` has
probability `P(Y₀ ≤ −ε)^m · P(M ≤ u₀) > 0`, by independence and because the restarted increments
have the law of the original sequence; on it every `Sₙ` is at most `0`. Monotonicity in `u` gives
`ψ(u) ≤ ψ(0) < 1` for `u ≥ 0`.

**Checks.**
- For the `±1` walk with `p = 0.4`, `ψ(0) = p/q = 2/3 < 1` and `ψ(u) = (2/3)^(⌊u⌋ + 1) → 0`; with
  `p = 0.6` the mean is `0.2 > 0` and the walk reaches every level.
- The restriction to `u ≥ 0` in the first statement is needed: `ruinProb P Y (−1) = 1` for every
  walk.
- Integrability is contained in the sign hypotheses: an increment with `E Y⁺ = ∞` and
  `E Y⁻ < ∞` has Bochner mean `0`, so neither statement applies to it, although its walk reaches
  every level.

*Needs:* 1.1; Mathlib `ProbabilityTheory.strong_law_ae`, `ProbabilityTheory.iIndepFun.indepFun`,
`ProbabilityTheory.iIndepFun.indepFun_finset`, `MeasureTheory.tendsto_measure_iInter_atTop`,
`ProbabilityTheory.indep_iSup_of_disjoint` (the first `m` increments against the restarted walk),
`ProbabilityTheory.iIndepFun.map_fun_eq_infinitePi_map` (the restarted increments have the law of
the original sequence).

### Examples

The `±1` walk with `p < q`, where every quantity of this layer is a power of `p/q`; the zero walk;
the reserve paths of the Checks of 1.2.

### Dependencies

Mathlib `hittingAfter`, `Adapted.isStoppingTime_hittingAfter`, `Filtration.natural`,
`strong_law_ae`, `iIndepFun.indepFun`, `iIndepFun.indepFun_finset`,
`tendsto_measure_iInter_atTop`, `indep_iSup_of_disjoint`, `iIndepFun.map_fun_eq_infinitePi_map`,
`measure_congr`; Tau Ceti `renewalCount`, `arrival`, `renewalCount_eq_natCast_iff`,
`ae_tendsto_arrival_atTop`. No other layer.

## Layer 2: the adjustment coefficient and the exponential martingale

### 2.1 The equation `E[exp (R X)] = 1`

For a real random variable `X` on a probability space, prove:

- `adjustmentCoefficient_unique`: if `X` is not almost surely `0`, the equation `mgf X P R = 1` has
  at most one solution `R > 0`.
- `exists_adjustmentCoefficient`: if `∫ X dP < 0` and `1 ≤ mgf X P r` for some `r > 0`, then
  `mgf X P R = 1` for some `R` with `0 < R ≤ r`.
- `integral_neg_of_mgf_eq_one`: if `X` is integrable and not almost surely `0` and
  `mgf X P R = 1` for some `R > 0`, then `∫ X dP < 0`.

The solution `R` is the adjustment coefficient, or Lundberg exponent, of `X` (Kevei, Lemma 15,
p. 79, convexity of `log E[exp (s X)]`, and the remark after (50), p. 80, that convexity allows at
most one solution, both in the Cramér–Lundberg model).

Route: `h(t) = E[exp (t X)]` is finite on `[0, r]` when it is finite at `0` and `r`, since
`exp (t X) ≤ 1 + exp (r X)` there, and it is convex there by convexity of `exp`; it is strictly
convex there when `X` is not almost surely constant, by strict convexity of `exp`
(`strictConvexOn_exp`). Uniqueness: two solutions `0 < R₁ < R₂` together with `h(0) = 1` contradict
strict convexity on `[0, R₂]`, and for `X` almost surely equal to a constant `a ≠ 0`,
`h(R) = exp (R a) ≠ 1`. Existence: `(exp (t X) − 1)/t` decreases to `X` as `t ↓ 0` and is bounded
above by the integrable `(exp (r X) − 1)/r`, so `(h(t) − 1)/t → E X < 0` and `h(t) < 1` for small
`t > 0`; `h` is continuous on `[0, r]` by dominated convergence with the bound
`max (1, exp (r X))`, and the intermediate value theorem gives a solution in `(t, r]`. Sign of the
drift: if `E X ≥ 0` the convex `h` would satisfy `h ≥ 1` on `[0, R]`, hence `h = 1` on `[0, R]`,
which strict convexity excludes unless `X` is almost surely a constant `a`, and then
`exp (R a) = 1` forces `a = 0`.

**Checks.**
- Normal increments of mean `−m < 0` and variance `σ²`: `h(t) = exp (−m t + σ² t²/2)`, so
  `R = 2m/σ²`; for `m = 1`, `σ = 2` this is `R = 1/2`.
- The `±1` walk with `p < q`: `p e^R + q e^(−R) = 1` has the solutions `R = 0` and `R = log (q/p)`.
- `X = 0` almost surely: every `R` solves the equation, so the hypothesis of uniqueness is needed.
- No solution although `X` has exponential moments. Let `Z` have the density proportional to
  `e^(−z)/(1 + z)³` on `[0, ∞)`, with normalizing constant `3.35375`, and `X = Z − 1`. Then
  `E X = −0.64625`, `E[exp X] = 0.61689 < 1` and `E[exp (t X)] = ∞` for `t > 1`; by convexity
  `h < 1` on `(0, 1]`, and `mgf X P t = 0` for `t > 1`, so the equation has no positive solution.
- Heavy tails: if `E[exp (t X)] = ∞` for every `t > 0` the hypothesis `1 ≤ mgf X P r` fails, since
  Mathlib's `mgf` is then `0`; no solution exists.

*Needs:* Mathlib `ProbabilityTheory.mgf`, `ProbabilityTheory.mgf_pos`,
`ProbabilityTheory.integrableExpSet`, `ProbabilityTheory.convex_integrableExpSet`,
`strictConvexOn_exp`, `MeasureTheory.integral_tendsto_of_tendsto_of_antitone`,
`MeasureTheory.tendsto_integral_of_dominated_convergence`, `intermediate_value_Icc`,
`ConvexOn.map_integral_le` (Jensen's inequality, for the sign of the drift). (Proved here.)

### 2.2 The exponential martingale

Prove `martingale_exp_mul_sum_div_prod_mgf`: let `ℱ` be a filtration on `Ω` and `P` a probability
measure, let each `Y i` be `ℱ (i + 1)`-measurable and independent of `ℱ i`, and let
`exp (r Y i)` be integrable for every `i`. Then

    n ↦ exp (r Sₙ) / ∏ i ∈ Finset.range n, mgf (Y i) P r

is a martingale for `ℱ` (Durrett, Exercise 4.8.8, p. 262, uses its special case `exp (θ Sₙ)` for a
random walk with `E[exp (θ Y 0)] = 1`; Kevei, Corollary 1, p. 79, is the analogue for the
continuous-time claim surplus of the Cramér–Lundberg model). For identically distributed
increments with `mgf (Y 0) P r = 1` the martingale is `exp (r Sₙ)`.

Route: `Sₙ` is `ℱ n`-measurable, each `mgf (Y i) P r` is positive (`mgf_pos`), and
`E[exp (r Yₙ) | ℱ n] = mgf (Y n) P r` almost surely by independence (`condExp_indep_eq`), so the
quotient at time `n + 1` has conditional expectation the quotient at time `n`, after pulling out
the `ℱ n`-measurable factor `exp (r Sₙ)` (`condExp_mul_of_stronglyMeasurable_left`). Integrability
of `exp (r Sₙ)` follows by induction from the independence of `exp (r Yₙ)` and `ℱ n`
(`IndepFun.integrable_mul`).

**Checks.**
- At `n = 0` the process is `1`; the normalization by the product is needed, since for the `±1`
  walk with `p = 0.4` and `r = 1` the mean of `exp (r S₁)` is `0.4 e + 0.6 e⁻¹ = 1.30804`.
- For an independent family and the natural filtration of its walk, `ℱ n = σ(Y 0, …, Y (n − 1))`,
  the hypotheses hold. For Mathlib's natural filtration of the family itself, `σ(Y 0, …, Y n)` at
  time `n`, they fail: `Y n` is not independent of it unless it is almost surely constant, and for
  the `±1` walk with `p = 0.4`, `r = 1` the conditional expectation of the time-`1` quotient
  `exp (Y 0)/1.30804` given `σ(Y 0)` is itself, not `1`.

*Needs:* Mathlib `MeasureTheory.Martingale`, `MeasureTheory.condExp_indep_eq`,
`MeasureTheory.condExp_mul_of_stronglyMeasurable_left`, `ProbabilityTheory.IndepFun.integrable_mul`,
`ProbabilityTheory.mgf_pos`, `ProbabilityTheory.Indep`. (Proved here.)

### Examples

Normal increments, the `±1` walk, and the light-tailed increment of the Check of 2.1, which has no
adjustment coefficient.

### Dependencies

Mathlib `mgf`, `mgf_pos`, `integrableExpSet`, `convex_integrableExpSet`, `strictConvexOn_exp`,
`integral_tendsto_of_tendsto_of_antitone`, `tendsto_integral_of_dominated_convergence`,
`intermediate_value_Icc`, `ConvexOn.map_integral_le`, `Martingale`, `condExp_indep_eq`,
`condExp_mul_of_stronglyMeasurable_left`, `IndepFun.integrable_mul`, `Indep`. No other layer.

## Layer 3: Lundberg's inequality and the overshoot identity

### 3.1 Lundberg's inequality

Prove `measure_exists_le_sum_le_exp`: for measurable, independent, identically distributed
increments and `R ≥ 0` with `exp (R Y 0)` integrable and `mgf (Y 0) P R ≤ 1`, for every real `u`,

    P {ω | ∃ n, u ≤ ∑ i ∈ Finset.range n, Y i ω} ≤ exp (−R u).

In particular `ruinProb P Y u ≤ exp (−R u)`, and this holds for the adjustment coefficient of 2.1
(Kevei, Corollary 2, p. 80, for the adjustment coefficient in the Cramér–Lundberg model, derived
from the overshoot identity; Durrett, Exercise 4.8.11, p. 262, for normal claims. The form for
general increments, for the weak event and for every `R` with `mgf (Y 0) P R ≤ 1` is proved here.)

Route: with `m = mgf (Y 0) P R ∈ (0, 1]` (`mgf_pos`; every `Y i` has this moment generating
function by `IdentDistrib.comp`), `Mₙ = exp (R Sₙ)/mⁿ` is a nonnegative martingale for the natural
filtration of the walk of 1.1 (2.2), with mean `1`, and `Mₙ ≥ exp (R Sₙ)`. Doob's maximal
inequality (`MeasureTheory.maximal_ineq`) at the level `exp (R u)` bounds the probability that
`max_{k ≤ n} Mₖ ≥ exp (R u)` by `exp (−R u)`, and this event contains `{∃ k ≤ n, u ≤ Sₖ}`. Let
`n → ∞` along the increasing events.

**Checks.**
- The bound is attained by the weak event. For the `±1` walk with `p = 0.3`, `R = log (7/3)`, the
  walk reaches `1` with probability `3/7 = 0.42857 = exp (−R)`, while `ruinProb P Y 1 = 9/49`.
- For `u ≤ 0` both sides are at least `1` and the inequality reads `1 ≤ exp (−R u)`.
- The sign of `R` is needed: for `R < 0` with `mgf (Y 0) P R ≤ 1` and `u < 0` the left side is
  `1 > exp (−R u)`.
- Integrability of `exp (R Y 0)` is needed. Let `Y 0 = X − 3` with `P(X ≥ x) = x^(−2)` for
  `x ≥ 1`, so `E Y 0 = −1` and `exp (R Y 0)` is not integrable for `R > 0`; Mathlib's `mgf` is
  then `0 ≤ 1`, but the walk reaches `u` with probability at least `P(Y 0 ≥ u) = (u + 3)^(−2)`,
  which exceeds `exp (−R u)` for large `u`.
- Without an adjustment coefficient the inequality still gives a rate: for the light-tailed
  increment of the Check of 2.1, `R = 1` is admissible, with `mgf = 0.61689`.

*Needs:* 2.2; Mathlib `MeasureTheory.maximal_ineq`, `MeasureTheory.Filtration.natural`,
`MeasureTheory.Martingale.submartingale`, `MeasureTheory.tendsto_measure_iUnion_atTop` for the
increasing union, `ProbabilityTheory.IdentDistrib.comp`, `ProbabilityTheory.mgf_pos`.

### 3.2 The overshoot identity

Prove `setIntegral_exp_overshoot`: for measurable, independent, identically distributed increments
that are not almost surely `0`, and `R > 0` with `mgf (Y 0) P R = 1`, for every real `u`, with
`τ = ruinTime Y u` and the overshoot `ξ = S_τ − u` on `{τ ≠ ⊤}`,

    ∫ ω in {τ ≠ ⊤}, exp (R ξ ω) dP = exp (−R u).

Since `ξ > 0` on `{τ ≠ ⊤}`, this gives `0 < ruinProb P Y u < exp (−R u)` and
`ruinProb P Y u = exp (−R u) / E[exp (R ξ) | τ ≠ ⊤]`, the form in which Kevei writes it (Kevei,
Proposition 7, p. 80, in the Cramér–Lundberg model, by optional stopping of the continuous-time
exponential martingale, the term after time `t` vanishing because the claim surplus tends to
`−∞`; the form for the walk with general increments is proved here by optional stopping in
discrete time, the corresponding term vanishing by martingale convergence, as in the route).

Route: for the natural filtration of the walk, `exp (R Sₙ)` is a martingale (2.2) and `τ` a stopping
time (1.1), so optional stopping at
the bounded times `τ ∧ n` (`Martingale.stoppedValue_min_ae_eq_condExp`) gives
`E[exp (R S_(τ ∧ n))] = 1`. Split this mean over `{τ ≤ n}` and `{τ > n}`. On `{τ > n}`,
`exp (R Sₙ) ≤ exp (R u)`. The nonnegative martingale `exp (R Sₙ)` converges almost surely
(`Submartingale.ae_tendsto_limitProcess`), and its limit is `0`: a positive limit would make
`Sₙ` converge, so that `Yₙ → 0`, while by the second Borel–Cantelli lemma
(`measure_limsup_eq_one`) `|Yₙ| > ε` infinitely often for an `ε > 0` with `P(|Y 0| > ε) > 0`.
Dominated convergence makes the mean over `{τ > n}` tend to `0`. The means over `{τ ≤ n}` are at
most `1` and increase, so monotone convergence for lower integrals (`lintegral_iSup`) makes
`exp (R S_τ)` integrable on `{τ ≠ ⊤}`, and `integral_tendsto_of_tendsto_of_monotone`, which needs
that integrability, makes them tend to `E[exp (R S_τ); τ ≠ ⊤]`. Multiply by `exp (−R u)`.

**Checks.**
- For the `±1` walk with `p < q` and `R = log (q/p)`, the overshoot of `u ≥ 0` is
  `⌊u⌋ + 1 − u` and the left side is `exp (R (⌊u⌋ + 1 − u)) (p/q)^(⌊u⌋ + 1) = exp (−R u)`; for
  `p = 0.3`, `u = 2.5` both sides are `0.12024`.
- The hypothesis that `Y 0` is not almost surely `0` is needed: for `Y i = 0` every `R > 0` has
  `mgf = 1`, but for `u = 1` the left side is `0` and the right side `exp (−R) > 0`.
- For `u < 0`, `τ = 0`, the overshoot is `−u` and both sides are `exp (−R u)`.

*Needs:* 1.1, 2.2; Mathlib `MeasureTheory.stoppedValue`,
`MeasureTheory.Martingale.stoppedValue_min_ae_eq_condExp`,
`MeasureTheory.Submartingale.ae_tendsto_limitProcess`, `ProbabilityTheory.measure_limsup_eq_one`,
`MeasureTheory.tendsto_integral_of_dominated_convergence`, `MeasureTheory.lintegral_iSup`,
`MeasureTheory.integral_tendsto_of_tendsto_of_monotone`.

### Examples

The `±1` walk, where both results are exact computations with powers of `p/q`; normal increments,
where 3.1 gives `ψ(u) ≤ exp (−2 m u/σ²)`.

### Dependencies

Layer 1 (1.1), Layer 2 (2.2); Mathlib `maximal_ineq`, `Filtration.natural`,
`Martingale.submartingale`, `tendsto_measure_iUnion_atTop`, `IdentDistrib.comp`, `stoppedValue`,
`Martingale.stoppedValue_min_ae_eq_condExp`, `Submartingale.ae_tendsto_limitProcess`,
`measure_limsup_eq_one`, `tendsto_integral_of_dominated_convergence`, `lintegral_iSup`,
`integral_tendsto_of_tendsto_of_monotone`.

## Layer 4: exponential claims

### 4.1 Exponential claims and arbitrary premium income

Prove `ruinProb_eq_of_hasLaw_expMeasure`: let the pairs `(Z i, W i)` be measurable, independent and
identically distributed, with `Z 0` and `W 0` independent, `Z 0` of law `expMeasure δ` and
`W 0 ≥ 0` almost surely, and let `R > 0` with `mgf (Z 0 − W 0) P R = 1`. Then for every `u ≥ 0`

    ruinProb P (fun i ω ↦ Z i ω − W i ω) u = (1 − R/δ) exp (−R u).

(Kevei, Corollary 3, pp. 80–81, for `W = c T` with `T` exponential, by the memoryless overshoot;
the form for any nonnegative `W` independent of the claim is proved here by the same argument.)

Route: the hypothesis forces `R < δ`, since `exp (R Z 0)` is not integrable for `R ≥ δ` while
`exp (−R W 0)` is positive and independent of it. At a ruin time `n ≥ 1` the walk was at most `u`
at time `n − 1`, so the claim `Zₙ₋₁` exceeded `a = u − Sₙ₋₁ + Wₙ₋₁ ≥ 0`, which is determined by
`Y 0, …, Y (n − 2)` and `Wₙ₋₁` and is independent of `Zₙ₋₁`: the pair `(Zₙ₋₁, Wₙ₋₁)` is
independent of the earlier pairs, and its coordinates are independent because it has the law of
`(Z 0, W 0)` (`indepFun_iff_map_prod_eq_prod_map_map`). By the memoryless property
(`memoryless_expMeasure`) the overshoot `Zₙ₋₁ − a` given `Zₙ₋₁ > a` is exponential of rate `δ`,
so `E[exp (R ξ); τ = n] = (δ/(δ − R)) P(τ = n)`, using `mgf_id_expMeasure`; the time `n = 0` is
excluded by `u ≥ 0`. Summing over `n` and inserting into 3.2 gives
`ψ(u) δ/(δ − R) = exp (−R u)`.

**Checks.**
- A constant premium income `W = w`: for `δ = 1`, `w = 1.5` the equation
  `log (δ/(δ − R)) = R w` gives `R = 0.58281` and `ψ(0) = 0.41719`. Solving the equation
  `φ(u) = E[φ(u − Y)]` for `φ = 1 − ψ` on `[0, ∞)`, with `φ = 0` on `(−∞, 0)`, by iteration from
  `φ = 1` on a grid of mesh `0.0005` (the convolution with the exponential law done exactly)
  gives `0.41719` as well.
- The restriction `u ≥ 0` is needed: `ruinProb P Y (−1) = 1`, while for `δ = 1`, `R = 0.2` the
  formula gives `0.8 e^0.2 = 0.97712`.
- `W ≥ 0` is needed, because a negative income lets the claim exceed a negative threshold, and the
  overshoot is then not exponential. For `δ = 1` and `W = −0.5` with probability `0.3`, `W = 3`
  with probability `0.7`, the root is `R = 0.43869` and the formula gives `ψ(0) = 0.5613`, while
  the same numerical solution gives `0.48465` (meshes `0.001` and `0.00025` agree with it to five
  digits).

*Needs:* 1.1, 3.2; Mathlib `ProbabilityTheory.expMeasure`, `ProbabilityTheory.HasLaw`,
`ProbabilityTheory.IndepFun.mgf_add`, `ProbabilityTheory.iIndepFun.indepFun_finset`,
`ProbabilityTheory.indepFun_iff_map_prod_eq_prod_map_map`; Tau Ceti
`TauCeti.Probability.memoryless_expMeasure` (or its measure form
`TauCeti.Probability.map_sub_cond_expMeasure`: the excess over `s ≥ 0`, conditioned on exceeding
`s`, has the law `expMeasure δ`), `TauCeti.Probability.measure_Ioi_expMeasure`,
`TauCeti.Probability.mgf_id_expMeasure`, `TauCeti.Probability.integrableExpSet_id_expMeasure`.

### 4.2 Exponential claims and exponential waiting times

Prove `ruinProb_eq_of_exponential_claims_and_waiting_times`: let the pairs `(Z i, T i)` be
measurable, independent and identically distributed, with `Z 0` and `T 0` independent, `Z 0` of
law `expMeasure δ`, `T 0` of law `expMeasure λ`, and let the premium rate `c` satisfy the net-profit
condition `λ < c δ`. Then for every `u ≥ 0`

    ruinProb P (fun i ω ↦ Z i ω − c * T i ω) u = (λ/(c δ)) exp (−(δ − λ/c) u)

(Kevei, Corollary 3, pp. 80–81). In the Lean statement the rate `λ` is called `lam`. With waiting
times of rate `λ` the number of claims in `[0, t]` is Poisson of mean `λ t`, by Tau Ceti's
`hasLaw_renewalCountNat_poissonMeasure`; the statement uses only the walk.

Route: `λ < c δ` with `λ, δ > 0` forces `c > 0`. For `−λ/c < r < δ`, independence
(`IndepFun.mgf_add`) and `mgf_id_expMeasure` give
`mgf (Z 0 − c T 0) P r = (δ/(δ − r)) (λ/(λ + c r))`, which equals `1` for `r = δ − λ/c`, a point of
`(0, δ)`; apply 4.1 with `W = c T ≥ 0`, where `1 − R/δ = λ/(c δ)`.

**Checks.**
- `δ = λ = 1`, `c = 1.25`: `R = 0.2`, `ψ(u) = 0.8 exp (−0.2 u)`; Lundberg's bound `exp (−0.2 u)`
  exceeds it by the factor `1.25` for every `u`, so it has the exact exponent and is off by the
  constant `c δ/λ`. At `u = 5`: `0.29430` against `0.36788`.
- `δ = 2`, `λ = c = 1`: `R = 1` and `ψ(u) = exp (−u)/2`, half of Lundberg's bound.
- The net-profit condition is needed: for `0 < c` and `λ > c δ` the formula exceeds `1` at
  `u = 0`, while a ruin probability is at most `1`.
- At `u = 0` the formula gives `λ/(c δ) = λ E Z/c`, the probability that the walk ever becomes
  positive.

*Needs:* 4.1; Mathlib `ProbabilityTheory.IndepFun.mgf_add`, `ProbabilityTheory.mgf_map`; Tau Ceti
`TauCeti.Probability.mgf_id_expMeasure`.

### Examples

The doubly exponential model with `δ = λ = 1`, `c = 1.25`, and the model with a constant premium
income of the Check of 4.1.

### Dependencies

Layer 1 (1.1), Layer 3 (3.2); Mathlib `expMeasure`, `HasLaw`, `IndepFun.mgf_add`, `mgf_map`,
`iIndepFun.indepFun_finset`, `indepFun_iff_map_prod_eq_prod_map_map`; Tau Ceti
`memoryless_expMeasure`, `map_sub_cond_expMeasure`, `measure_Ioi_expMeasure`,
`mgf_id_expMeasure`, `integrableExpSet_id_expMeasure`.

## Scope and ownership

This roadmap owns the targets stated above: the ruin probability and the time of ruin of a random
walk with independent, identically distributed real increments; the reduction of ruin of the
continuous-time reserve driven by Tau Ceti's renewal counts to the embedded walk; the net-profit
dichotomy for integrable increments of nonzero mean; existence, uniqueness and the sign of the drift
for the adjustment coefficient; the exponential martingale of a walk with independent increments;
Lundberg's inequality; the overshoot identity; and the exact ruin probabilities for exponential
claims.

Already in the libraries and therefore not targets: Mathlib's martingales, Doob's maximal
inequality, optional stopping at bounded stopping times, the martingale convergence theorem,
hitting times, the strong law of large numbers, the second Borel–Cantelli lemma, moment generating
functions with their behaviour under independent sums, and the exponential law; Tau Ceti's arrival
times and counts of renewal processes with their nonexplosion theorem, the formalization of the
ordinary renewal processes of MarkovChainsAndRenewal (Layer 4 there), the moment generating
function, tail and memoryless property of the exponential law, the law of the counts for
exponential waiting times, and the exponential martingale of Brownian motion
(`TauCeti/Probability/BrownianMotion/ExponentialMartingale.lean`), the continuous-time Gaussian
analogue of 2.2.

Left to other roadmaps and stated differently here:

- PointProcesses (Layer 6) constructs compound Poisson processes as marked sums of Poisson random
  measures, and StochasticCalculus (§0.6) the filtered Poisson counting process with its jump
  times; StandardDistributions (§7.5) owns the compound Poisson law. Nothing here defines a
  Poisson or compound Poisson process: 1.2 uses Tau Ceti's renewal counts, and 4.2 is a statement
  about the walk. This roadmap does not depend on PointProcesses.
- StochasticCalculus (§2.3) owns the gambler's-ruin exit probabilities of the nearest-neighbour
  walk between two barriers, by optional sampling. The `±1` walk appears here only in Checks, for
  the one-sided problem.
- RandomWalkFluctuationTheory (1.1) defines the walk of a sequence of steps as its partial sums,
  the convention used here; the sums are written out and nothing is copied. Its subject is the
  simple random walk, together with the return criterion for lattice walks with any step law on
  `ℤ^d` (its 3.2); it leaves the finer theory of walks with general step laws (the Chung–Fuchs
  theorem, Sparre Andersen's theorem, Spitzer's identity) outside its scope, and states nothing on
  the supremum of a walk with negative drift. This roadmap does not depend on that one.
- LargeDeviations (4.1, 4.2) states the convexity of the logarithmic moment generating function in
  extended-real form and Chernoff's bound for a sample mean at a fixed time. 2.1 uses only the
  convexity of `t ↦ E[exp (t X)]` on an interval where it is finite, which it derives from the
  convexity of `exp`, and Lundberg's inequality bounds the probability of reaching a level at any
  time. This roadmap does not depend on that one.

Not treated here: the Pollaczek–Khinchine formula for the ruin probability in the Cramér–Lundberg
model (Kevei, Theorem 27, p. 78), which needs the ladder heights of the walk; the Cramér–Lundberg
approximation `ψ(u) ∼ C exp (−R u)` (Kevei, Theorem 28, p. 81), whose route through the defective
renewal equation needs the ladder-height law and a key renewal theorem for forcing terms such as
`exp (R u) ∫_u^∞ P(Z > y) dy`, which need not be monotone (for a claim equal to `1`, `λ = 1` and
`c = 3`, `R = 1.90381` and the forcing increases near `0`), while MarkovChainsAndRenewal Layer 6,
renewal equations (item 3; 6.3 in the sectioned numbering), states the key renewal theorem for
nonnegative, nonincreasing, integrable forcing; the case of zero mean, where a walk that
is not almost surely zero reaches every level, which needs the oscillation of mean-zero walks;
increments without a mean; ruin in finite time; and heavy-tailed claims.

## Exact supplier contracts

### From Mathlib

- `Mathlib/Probability/Process/HittingTime.lean`: `MeasureTheory.hittingAfter u s n` (the first
  time at least `n` at which `u` is in `s`, in `WithTop ι`, and `⊤` if there is none);
  `MeasureTheory.Adapted.isStoppingTime_hittingAfter` (for an adapted process with values in a
  measurable space and a measurable set, the hitting time is a stopping time).
- `Mathlib/Probability/Process/Stopping.lean`: `MeasureTheory.stoppedValue u τ`
  (`fun ω ↦ u (τ ω).untopA ω`). `Mathlib/Probability/Process/Filtration.lean`:
  `MeasureTheory.Filtration.natural` (the filtration generated by a family of strongly measurable
  functions).
- `Mathlib/Probability/Martingale/Basic.lean`: `MeasureTheory.Martingale` (strongly adapted, with
  `μ[f j | ℱ i] =ᵐ[μ] f i` for `i ≤ j`), `MeasureTheory.Martingale.submartingale`.
- `Mathlib/Probability/Martingale/OptionalStopping.lean`: `MeasureTheory.maximal_ineq` (for a
  nonnegative submartingale on a finite measure space and `ε : ℝ≥0`,
  `ε · μ {ε ≤ max_{k ≤ n} f k} ≤ ∫ over that set of f n`).
- `Mathlib/Probability/Martingale/OptionalSampling.lean`:
  `MeasureTheory.Martingale.stoppedValue_min_ae_eq_condExp` (for a martingale, a stopping time `τ`
  and a time `i`, the value at `min τ i` is the conditional expectation of `f i` given the
  σ-algebra of `τ`, under a σ-finite filtration).
- `Mathlib/Probability/Martingale/Convergence.lean`:
  `MeasureTheory.Submartingale.ae_tendsto_limitProcess` (an `L¹`-bounded submartingale on a finite
  measure space converges almost surely).
- `Mathlib/Probability/ConditionalExpectation.lean`: `MeasureTheory.condExp_indep_eq` (for a
  function measurable for a σ-algebra independent of `m₂`, its conditional expectation given `m₂`
  is its mean). `Mathlib/Probability/Independence/Basic.lean`: `ProbabilityTheory.Indep`,
  `ProbabilityTheory.iIndepFun`, `ProbabilityTheory.iIndepFun.isProbabilityMeasure`,
  `ProbabilityTheory.iIndepFun.indepFun`, `ProbabilityTheory.iIndepFun.indepFun_finset`,
  `ProbabilityTheory.indep_iSup_of_disjoint` (σ-algebras generated by disjoint parts of an
  independent family are independent),
  `ProbabilityTheory.indepFun_iff_map_prod_eq_prod_map_map` (two variables are independent
  exactly when their joint law is the product of their laws).
  `Mathlib/Probability/Independence/Integration.lean`:
  `ProbabilityTheory.IndepFun.integrable_mul` (a product of independent integrable functions is
  integrable). `Mathlib/Probability/Independence/InfinitePi.lean`:
  `ProbabilityTheory.iIndepFun.map_fun_eq_infinitePi_map` (an independent family of measurable
  variables has the product of its marginals as joint law).
  `Mathlib/MeasureTheory/Function/ConditionalExpectation/PullOut.lean`:
  `MeasureTheory.condExp_mul_of_stronglyMeasurable_left` (an `m`-measurable factor comes out of a
  conditional expectation given `m`).
- `Mathlib/Probability/IdentDistrib.lean`: `ProbabilityTheory.IdentDistrib`,
  `ProbabilityTheory.IdentDistrib.comp`. `Mathlib/Probability/HasLaw.lean`:
  `ProbabilityTheory.HasLaw X μ P` (`X` is almost everywhere measurable and `P.map X = μ`).
- `Mathlib/Probability/StrongLaw.lean`: `ProbabilityTheory.strong_law_ae` (pairwise independent,
  identically distributed, integrable `X n`: the averages tend almost surely to the mean).
- `Mathlib/Probability/BorelCantelli.lean`: `ProbabilityTheory.measure_limsup_eq_one`
  (independent measurable events with divergent sum of probabilities occur infinitely often almost
  surely).
- `Mathlib/Probability/Moments/Basic.lean`: `ProbabilityTheory.mgf` (`∫ exp (t X) dμ`);
  `ProbabilityTheory.mgf_pos` (positive for a probability measure when `exp (t X)` is integrable);
  `ProbabilityTheory.mgf_map`; `ProbabilityTheory.IndepFun.mgf_add` (the moment generating
  function of a sum of independent variables whose exponentials are almost everywhere strongly
  measurable is the product).
  `Mathlib/Probability/Moments/IntegrableExpMul.lean`: `ProbabilityTheory.integrableExpSet` (the
  set of `t` with `exp (t X)` integrable), `ProbabilityTheory.convex_integrableExpSet`.
- `Mathlib/Probability/Distributions/Exponential.lean`: `ProbabilityTheory.expMeasure r`
  (`gammaMeasure 1 r`, the exponential law of rate `r`).
- `Mathlib/Analysis/Convex/SpecificFunctions/Basic.lean`: `strictConvexOn_exp` (`Real.exp` is
  strictly convex on `ℝ`). `Mathlib/Analysis/Convex/Integral.lean`: `ConvexOn.map_integral_le`
  (Jensen's inequality). `Mathlib/Topology/Order/IntermediateValue.lean`: `intermediate_value_Icc`.
- `Mathlib/MeasureTheory/OuterMeasure/AE.lean`: `MeasureTheory.measure_congr` (sets equal almost
  everywhere have the same measure, with no measurability assumed).
- `Mathlib/MeasureTheory/Measure/Continuity.lean`: `MeasureTheory.tendsto_measure_iUnion_atTop`
  (along increasing sets), `MeasureTheory.tendsto_measure_iInter_atTop` (along decreasing
  null-measurable sets, one of finite measure).
  `Mathlib/MeasureTheory/Integral/DominatedConvergence.lean`:
  `MeasureTheory.tendsto_integral_of_dominated_convergence`.
  `Mathlib/MeasureTheory/Integral/Lebesgue/Add.lean`: `MeasureTheory.lintegral_iSup` (monotone
  convergence for lower integrals of measurable functions).
  `Mathlib/MeasureTheory/Integral/Bochner/Basic.lean`:
  `MeasureTheory.integral_tendsto_of_tendsto_of_monotone`,
  `MeasureTheory.integral_tendsto_of_tendsto_of_antitone` (monotone convergence for real
  integrands with an integrable first term).

### From Tau Ceti

- `TauCeti/Probability/Renewal/Basic.lean`: `TauCeti.Probability.arrival T n`
  (`T 0 + ⋯ + T (n − 1)` for increments `T i : Ω → ℝ≥0`); `TauCeti.Probability.renewalCount T t`
  (the number in `ℝ≥0∞` of indices `n ≥ 1` with `arrival T n ≤ t`);
  `TauCeti.Probability.renewalCount_eq_natCast_iff` (the count at `t` is `n` exactly when
  `arrival T n ≤ t < arrival T (n + 1)`); `TauCeti.Probability.ae_tendsto_arrival_atTop`
  (measurable, independent, identically distributed increments with `P {T 0 = 0} < 1`: the arrival
  times tend to infinity almost surely).
- `TauCeti/Probability/Renewal/Exponential.lean`:
  `TauCeti.Probability.hasLaw_renewalCountNat_poissonMeasure` (exponential waiting times give
  Poisson counts), named in 4.2 only.
- `TauCeti/Probability/Distributions/Exponential/Basic.lean`:
  `TauCeti.Probability.mgf_id_expMeasure` (for `0 < r` and `t < r`, the moment generating function
  of `expMeasure r` at `t` is `r/(r − t)`); `TauCeti.Probability.integrableExpSet_id_expMeasure`
  (for `0 < r`, the set of `t` with integrable `exp (t x)` is `t < r`);
  `TauCeti.Probability.measure_Ioi_expMeasure` (the tail `exp (−r x)` for `x ≥ 0`, and `1`
  otherwise); `TauCeti.Probability.memoryless_expMeasure` (for `0 < r` and `s, t ≥ 0`, the law
  conditioned on `(s, ∞)` gives `(s + t, ∞)` the mass the law gives `(t, ∞)`);
  `TauCeti.Probability.map_sub_cond_expMeasure` (for `0 < r` and `s ≥ 0`, the image of the law
  conditioned on `(s, ∞)` under `x ↦ x − s` is the law itself).

## References

- P. Kevei, *Financial mathematics and risk theory*, lecture notes, University of Szeged, version
  dated 19 November 2026, on the author's page
  (`www.math.u-szeged.hu/~kevei/tanitas/jegyzet/finance-risk_notes.pdf`). Chapter 11: §11.1 and
  Proposition 5, pp. 71–72; Theorem 27, p. 78; Corollary 1, Lemma 15 and condition (50), p. 79;
  Proposition 7, Corollaries 2 and 3, pp. 80–81; Theorem 28, p. 81. The notes treat the renewal
  model and, from §11.3 on, the Cramér–Lundberg model with exponential waiting times.
- R. Durrett, *Probability: Theory and Examples*, fifth edition, Cambridge University Press, 2019;
  the version of 11 January 2019 made available on the author's page. Section 4.8, Exercises 4.8.8
  and 4.8.11, p. 262 (exercises, cited for the exponential martingale and for normal claims).
