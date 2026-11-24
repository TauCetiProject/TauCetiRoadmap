# Roadmap: Stochastic orders

**Summary.** This roadmap builds the stochastic orders between probability laws: relations that
say one random quantity is larger, riskier, more dispersed or more unequal than another, each
defined by a family of test functions or by a comparison of distribution functions, quantiles or
densities, and each characterised by a coupling. It owns the test-function form of the usual
order on the line with its closure under mixtures and weak limits, the usual order on partially
ordered Polish spaces with the ordered-coupling theorem of Strassen and Kamae–Krengel–O'Brien and
its sequential construction, the hazard-rate, reversed-hazard-rate, likelihood-ratio and
mean-residual-life orders with their implications, conditional characterisations, closure under
monotone maps and log-concave convolution, and the classical parameter families, the increasing
convex order with its stop-loss and quantile forms, Strassen's martingale coupling on the line for
laws with a finite mean and its submartingale analogue, the Karlin–Novikoff cut criterion, and the
dispersive, star and Lorenz orders with the Gini index and the identification of the Lorenz order
with majorization.

It is a synthesis of several sources rather than a reading of one: Shaked and Shanthikumar
(*Stochastic Orders*), Marshall, Olkin and Arnold (*Inequalities*, Ch. 17), Rachev and
Rüschendorf (*Mass Transportation Problems*, vol. I) and Liggett (*Interacting Particle
Systems*). The layers follow proof dependency: the usual order first, then the orders that refine
it, then the orders of variability built on the convex order, and last the orders read off
quantile functions.

The nearest roadmaps are these. MeansMajorizationAndDiscreteInequalities owns the convex order on
the line with its stop-loss characterisation and its identification with majorization; this
roadmap takes those and builds the other orders around them. StandardDistributions owns the usual
order through distribution functions, quantiles and the quantile coupling, with the parameter
comparisons of the classical families, and survival and hazard functions; those are consumed
here. MathematicalStatisticsFoundations owns Strassen's theorem on compact convex sets, which is
the compact step of the martingale coupling here, and monotone likelihood ratio families for
testing. OptimalTransport owns couplings, their compactness and the quantile coupling.

## How to read the build

There are five layers. Layer 1 proves the test-function form of the usual order on the line and
its closure properties. Layer 2 lifts the usual order to partially ordered spaces and proves the
ordered-coupling theorem. Layer 3 defines the hazard-rate, reversed-hazard-rate,
likelihood-ratio and mean-residual-life orders and proves how they refine the usual order.
Layer 4 builds the increasing convex order, the martingale and submartingale couplings and the
cut criteria. Layer 5 builds the dispersive, star and Lorenz orders from quantile functions.

Each subsection states its targets with locators into the sources or a proof route; a target
with a Lean name is a declaration in `Suggested.lean`. Each subsection ends with a *Needs:* line.
Locators give the theorem or equation number and the printed page.

## Conventions

- **Laws.** Laws are probability measures on `ℝ` (`IsProbabilityMeasure`) unless a statement says
  otherwise. Distribution functions are Mathlib's `cdf`; survival values are `μ.real (Ioi x)`,
  real numbers in `[0, 1]`, so no `toReal ⊤` arises.
- **Usual order.** `μ ≤st ν` is mathematical shorthand for `cdf ν x ≤ cdf μ x` for every `x`, as
  in [StandardDistributions](../StandardDistributions/README.md) §7.13 and Tau Ceti's
  `Probability/StochasticOrder.lean`; it is not a definition on the line. On a preordered space
  the order is `StochasticLE`, defined by measurable upper sets, and 2.1 identifies the two on
  `ℝ`.
- **Quantiles.** `μ.quantile` is the lower quantile `inf {x | u ≤ cdf μ x}` of Tau Ceti
  (`MeasureTheory.Measure.quantile`). Orders read off quantiles quantify over `0 < u ≤ v < 1`,
  where the quantile is finite; the endpoint values are never used.
- **Ratios without division.** The hazard-rate, reversed-hazard-rate, likelihood-ratio,
  mean-residual-life and star orders are monotonicity of a ratio; they are stated
  cross-multiplied, so a vanishing denominator gives no junk value and the order is defined for
  all laws. Where the source restricts to the support, the cross-multiplied form agrees with it
  there and is automatic outside it.
- **First moments.** Orders that compare expectations of unbounded test functions
  (`ConvexOrderLE`, `IncreasingConvexOrderLE`, `MeanResidualLifeLE`, `LorenzOrderLE`) include
  `Integrable id` for both laws in their definition, so a Bochner integral of a non-integrable
  function never enters a comparison. The stop-loss integrand `max (x − t) 0` is integrable
  whenever `id` is.
- **Convex order.** `ConvexOrderLE` is the definition of MeansMajorizationAndDiscreteInequalities
  §6.1, copied verbatim; its theorems in §6.1–6.2 there are consumed, not restated.
- **Kernels and mixtures.** A mixture of a Markov kernel `κ` over a law `ρ` is `κ ∘ₘ ρ`
  (`MeasureTheory.Measure.bind`); `ν = κ ∘ₘ μ` with barycentre `x` under `κ x` is a martingale
  kernel. Conditional laws are `μ[|s]` (`ProbabilityTheory.cond`); convolution is
  `MeasureTheory.Measure.conv`.
- **Namespace.** Implementations live in the TauCeti namespace; `Suggested.lean` states the
  prototypes in `TauCetiRoadmap.StochasticOrders`.

## Layer 1: The usual order on the line

### 1.1 Test functions

**Targets.** Let `μ, ν` be laws on `ℝ`.

- **Monotone test functions** (`cdf_le_iff_integral_le_of_monotone`): `cdf ν ≤ cdf μ` everywhere
  exactly when `∫ φ dμ ≤ ∫ φ dν` for every nondecreasing `φ` integrable under both.
  Shaked–Shanthikumar, (1.A.7), p. 4; Thm 1.A.1, p. 5, for the coupling.
- **Equality from one strictly increasing function** (`eq_of_cdf_le_of_integral_eq`): if
  `μ ≤st ν` and `∫ g dμ = ∫ g dν` for some strictly increasing `g` integrable under both, then
  `μ = ν`. Shaked–Shanthikumar, Thm 1.A.8, p. 8.

**Proof route.**

- `⇒`: on the quantile coupling `MeasureTheory.Measure.quantileCoupling μ ν`, carried by
  ordered pairs when `μ ≤st ν` (`MeasureTheory.Measure.ae_fst_le_snd_quantileCoupling`),
  `φ x ≤ φ y` almost surely; integrate against the coupling, whose marginals are `μ, ν`
  (`MeasureTheory.Measure.isCoupling_quantileCoupling`).
- `⇐`: `φ` the indicator of `Ioi x` is nondecreasing and bounded; its integrals are
  `1 − cdf μ x` and `1 − cdf ν x`.
- Equality: on the ordered coupling, `g y − g x ≥ 0` almost surely with integral `0`, so
  `g x = g y` and hence `x = y` almost surely; the two marginals agree.

*Needs:* `MeasureTheory.Measure.quantileCoupling`,
`MeasureTheory.Measure.exists_isCoupling_ae_fst_le_snd_iff_cdf_le`.

### 1.2 Mixtures

**Targets.**

- **Mixtures of ordered kernels** (`cdf_bind_le_of_ae`): for a law `ρ` on a measurable space and
  Markov kernels `κ, η` into `ℝ` with `κ a ≤st η a` for `ρ`-almost every `a`, the mixtures
  satisfy `κ ∘ₘ ρ ≤st η ∘ₘ ρ`. Shaked–Shanthikumar, Thm 1.A.3(d), p. 6.
- **Stochastically increasing families** (`cdf_bind_le_of_monotone_kernel`): for a Markov kernel
  `κ : ℝ → ℝ` with `κ θ ≤st κ θ'` whenever `θ ≤ θ'`, and mixing laws `ρ₁ ≤st ρ₂`,
  `κ ∘ₘ ρ₁ ≤st κ ∘ₘ ρ₂`. Shaked–Shanthikumar, Thm 1.A.6, p. 7.

**Proof route.** The distribution function of `κ ∘ₘ ρ` at `x` is `∫ cdf (κ a) x dρ(a)`
(`MeasureTheory.Measure.bind` applied to `Iic x`); the first target integrates the pointwise
inequality. For the second, `θ ↦ 1 − cdf (κ θ) x` is nondecreasing, and 1.1 applied to `ρ₁, ρ₂`
compares its integrals.

*Needs:* 1.1.

### 1.3 Weak limits

**Target** (`cdf_le_of_tendsto`). If `μ_n → μ` and `ν_n → ν` weakly and `μ_n ≤st ν_n` for every
`n`, then `μ ≤st ν`. Shaked–Shanthikumar, Thm 1.A.3(c), p. 6.

**Proof route.** At points where both limit distribution functions are continuous, the
distribution functions converge (portmanteau, via
`MeasureTheory.ProbabilityMeasure.tendsto_iff_forall_integral_tendsto` with continuous ramps), so
the inequality passes to the limit there; such points are dense and both functions are
right-continuous.

*Needs:* Mathlib's weak convergence of probability measures.

**Checks.**

- `N(0, 1) ≤st N(1, 1)`: `cdf` at `0` is `1/2` and `Φ(−1) ≈ 0.15866`.
- The Poisson laws of rates `1` and `2`, cast to `ℝ`, have `cdf` at `0` equal to
  `e^(−1) ≈ 0.36788` and `e^(−2) ≈ 0.13534`, ordered as the rate.
- Equality needs strict monotonicity: `δ_0` and the uniform law on `{0, 1}` are ordered and have
  the same integral of the nondecreasing `g = min x 0`, which is `0` for both.

## Layer 2: The usual order on partially ordered spaces

### 2.1 Upper sets

**Definition.** On a preordered measurable space, `StochasticLE μ ν` holds when
`μ s ≤ ν s` for every measurable upper set `s`. Shaked–Shanthikumar, (6.B.1), p. 266.

**Targets.**

- **The line** (`stochasticLE_iff_cdf_le`): on `ℝ`, `StochasticLE μ ν` exactly when
  `cdf ν ≤ cdf μ` everywhere. Shaked–Shanthikumar, (1.A.1), p. 3.
- **Bounded monotone test functions** (`stochasticLE_iff_integral_le`): `StochasticLE μ ν`
  exactly when `∫ f dμ ≤ ∫ f dν` for every bounded monotone measurable `f : α → ℝ`.
  Shaked–Shanthikumar, (6.B.2)–(6.B.4), p. 266.
- **Order properties** (prose targets): reflexive and transitive on every preordered space;
  antisymmetric on `ℝ` by 2.1 and `MeasureTheory.Measure.eq_of_cdf_le_cdf_le`.

**Proof route.** The upper sets of `ℝ` are the intervals `Ioi x`, `Ici x`, the empty set and
the whole line; `Ici x` is a decreasing limit of `Ioi (x − 1/n)`. For the test functions, `f` is
a uniform limit of nonnegative combinations of indicators of the upper sets `{f > c}` plus a
constant.

*Needs:* Mathlib's `IsUpperSet`.

### 2.2 Ordered couplings

**Target** (`stochasticLE_iff_exists_isCoupling`). On a Polish space with a partial order whose
graph is closed (`OrderClosedTopology`), `StochasticLE μ ν` holds exactly when some coupling `π`
of `μ` and `ν` (`TauCeti.IsCoupling`) is carried by `{z | z.1 ≤ z.2}`. Rachev–Rüschendorf,
Thm 3.5.5, pp. 146–147; Liggett, Ch. II, Thm 2.4, p. 72, on compact spaces;
Marshall–Olkin–Arnold, 17.A.5, p. 696; Shaked–Shanthikumar, Thm 6.B.1, p. 267, on `ℝ^n`.

**Proof route.**

- `⇐`: for an upper set `s`, `z.1 ∈ s` implies `z.2 ∈ s` on the support of `π`, so
  `μ s = π (fst ⁻¹ s) ≤ π (snd ⁻¹ s) = ν s`.
- `⇒` (Rachev–Rüschendorf's proof, through duality): the cost `c = 1` off the closed set
  `R = {z | z.1 ≤ z.2}` and `0` on it is lower semicontinuous with values in `[0, 1]`, so an
  optimal coupling exists (`TauCeti.exists_isOptimalCoupling`), and its cost is the least upper
  bound of `∫ φ dμ + ∫ ψ dν` over bounded continuous `φ, ψ` with `φ(x) + ψ(y) ≤ c(x, y)`
  (`TauCeti.isLUB_ofReal_kantorovichDualValue_boundedContinuous_of_lowerSemicontinuous`). Every
  such pair has value at most `0`. For `t ∈ ℝ` and a compact `K ⊆ {φ ≥ t}`, the upper hull
  `{y | ∃ x ∈ K, x ≤ y}` is closed, since `K` is compact and `R` closed; on it `ψ ≤ −t`, since
  `φ(x) + ψ(y) ≤ 0` for `x ≤ y`. So `μ K ≤ ν {ψ ≤ −t}` by the hypothesis on that upper set, and
  inner regularity gives `μ {φ ≥ t} ≤ ν {−ψ ≥ t}` for every `t`. Integrating over `t` (both
  functions are bounded) gives `∫ φ dμ ≤ ∫ (−ψ) dν`. Hence the optimal coupling has cost `0` and
  is carried by `R`.

*Needs:* 2.1; `TauCeti.IsCoupling`, `TauCeti.exists_isOptimalCoupling`,
`TauCeti.isLUB_ofReal_kantorovichDualValue_boundedContinuous_of_lowerSemicontinuous` (Kantorovich
duality, OptimalTransport §1.5 and §2.4); OptimalTransport §3.7 for the line, where the quantile
coupling is explicit.

### 2.3 Sequential construction and products

**Targets.**

- **Sequential criterion** (`StochasticLE.compProd`): for laws `μ₁ ≤ ν₁` in `StochasticLE` on a
  Polish space with closed partial order, and Markov kernels `κ, η` into `ℝ` with
  `κ x ≤st η y` whenever `x ≤ y`, the joint laws satisfy `StochasticLE (μ₁ ⊗ₘ κ) (ν₁ ⊗ₘ η)` for
  the product order on `α × ℝ`. Shaked–Shanthikumar, Thm 6.B.3, p. 268.
- **Products** (`StochasticLE.pi`): if `μ i ≤st ν i` for each `i : Fin n`, then the product laws
  `Measure.pi μ` and `Measure.pi ν` are ordered in `StochasticLE` on `Fin n → ℝ`.
- **Increasing functions of independent variables** (prose target): for `μ i ≤st ν i` and a
  nondecreasing measurable `ψ : (Fin n → ℝ) → ℝ`, the image laws are in the usual order.
  Shaked–Shanthikumar, Thm 1.A.3(b), p. 6.

**Proof route.** Couple `μ₁, ν₁` on ordered pairs by 2.2; for each ordered pair `(x, y)` take the
quantile coupling of `κ x` and `η y`, which is carried by ordered pairs, and measurable in
`(x, y)` because `MeasureTheory.Measure.measurable_quantile_cdf_family` makes the quantile jointly
measurable. The composed law couples the joint laws on ordered pairs, and 2.2 `⇐` concludes.
Products follow by induction on `n`, with constant kernels; images by monotone `ψ` preserve upper
sets.

*Needs:* 2.2.

**Checks.**

- On `ℝ²` with the product order, `δ_(0,0)` is below `δ_(1,1)`; `δ_(0,1)` and `δ_(1,0)` are not
  comparable, as the upper sets `{z | 1 ≤ z.2}` and `{z | 1 ≤ z.1}` show.
- With `μ₁ = ν₁ = δ_0` and kernels `κ x = δ_x`, `η y = δ_(y+1)`, the joint laws are `δ_(0,0)` and
  `δ_(0,1)`, ordered.

## Layer 3: Hazard rate, likelihood ratio and mean residual life

### 3.1 Definitions

Let `S_μ(x) = μ.real (Ioi x)` and `F_μ(x) = μ.real (Iic x)`.

- `HazardRateLE μ ν`: `S_μ(y) S_ν(x) ≤ S_μ(x) S_ν(y)` for `x ≤ y`, that is `S_ν / S_μ`
  nondecreasing. Shaked–Shanthikumar, (1.B.2)–(1.B.4), p. 16.
- `ReversedHazardRateLE μ ν`: `F_μ(y) F_ν(x) ≤ F_μ(x) F_ν(y)` for `x ≤ y`, that is `F_ν / F_μ`
  nondecreasing. Shaked–Shanthikumar, (1.B.39), p. 36.
- `LikelihoodRatioLE μ ν`: `μ(t) ν(s) ≤ μ(s) ν(t)` for measurable `s, t` with every point of `s`
  below every point of `t`. Shaked–Shanthikumar, (1.C.1)–(1.C.3), p. 42; for laws with densities
  `f, g` it is the monotonicity of `g / f` (3.3).
- `MeanResidualLifeLE μ ν`: both laws integrable, and
  `S_ν(t) ∫ max (x − t) 0 dμ ≤ S_μ(t) ∫ max (x − t) 0 dν` for every `t`: the mean residual life
  `E [X − t | X > t]` of `μ` is at most that of `ν` wherever both are defined.
  Shaked–Shanthikumar, (2.A.2)–(2.A.6), p. 82.

The likelihood-ratio form with ordered sets needs no reference measure; restricted to singletons
it would say nothing about laws without atoms, and for laws with densities it is the monotone
density ratio of 3.3.

### 3.2 Implications

**Targets.** Let `μ, ν` be laws on `ℝ`.

- `LikelihoodRatioLE.hazardRateLE` and `LikelihoodRatioLE.reversedHazardRateLE`: the
  likelihood-ratio order implies both hazard orders. Shaked–Shanthikumar, Thm 1.C.1, p. 43.
- `HazardRateLE.cdf_le`: the hazard-rate order implies the usual order. Shaked–Shanthikumar,
  Thm 1.B.1, p. 18.
- `ReversedHazardRateLE.cdf_le`: the reversed-hazard-rate order implies the usual order.
  Shaked–Shanthikumar, Thm 1.B.42, p. 38.
- `HazardRateLE.meanResidualLifeLE`: for integrable laws, the hazard-rate order implies the
  mean-residual-life order. Shaked–Shanthikumar, Thm 2.A.1, p. 83.
- **Order properties** (prose targets): all four orders are reflexive; the hazard-rate and
  mean-residual-life orders are transitive among laws with `S > 0` on the whole line, the
  reversed-hazard-rate order among laws with `F > 0` on the whole line, and the
  likelihood-ratio order among laws with densities positive on a common interval.

**Proof route.**

- lr ⇒ hr: take `s = Ioc x y` and `t = Ioi y`, then add `μ(Ioi y) ν(Ioi y)` to both sides.
  lr ⇒ rh symmetrically with `s = Iic x` and `t = Ioc x y`.
- hr ⇒ st: take `x → −∞` in `S_μ(y) S_ν(x) ≤ S_μ(x) S_ν(y)`, where `S(x) → 1`; rh ⇒ st with
  `y → ∞`.
- hr ⇒ mrl: write `∫ max (x − t) 0 dμ = ∫_t^∞ S_μ(u) du` (layer-cake), and integrate
  `S_μ(u) S_ν(t) ≤ S_μ(t) S_ν(u)` over `u > t`.

*Needs:* layer-cake (`MeasureTheory.lintegral_eq_lintegral_meas_lt` in Mathlib).

### 3.3 Densities, conditional laws and hazard functions

**Targets.**

- **Densities** (`likelihoodRatioLE_withDensity_iff`): for a σ-finite reference measure `ρ` and
  measurable densities `μ = ρ.withDensity f`, `ν = ρ.withDensity g`, `LikelihoodRatioLE μ ν`
  holds exactly when `f y g x ≤ f x g y` for `ρ ⊗ ρ`-almost every `(x, y)` with `x ≤ y`.
  Shaked–Shanthikumar, (1.C.1), p. 42.
- **Conditional laws** (`likelihoodRatioLE_iff_cond`): `LikelihoodRatioLE μ ν` exactly when
  `μ[|s] ≤st ν[|s]` for every measurable `s` with `μ s ≠ 0` and `ν s ≠ 0`.
  Shaked–Shanthikumar, Thm 1.C.6, p. 45, for intervals.
- **Residual lives** (`hazardRateLE_iff_cond_Ioi`): `HazardRateLE μ ν` exactly when
  `μ[|Ioi t] ≤st ν[|Ioi t]` for every `t` with `μ (Ioi t) ≠ 0` and `ν (Ioi t) ≠ 0`.
  Shaked–Shanthikumar, (1.B.7), p. 17.
- **Hazard functions** (`hazardRateLE_of_hazard_le`): for laws with Lebesgue densities `f, g`,
  if `cdf ν t < 1` wherever `cdf μ t < 1`, and the hazards satisfy
  `g t / (1 − cdf ν t) ≤ f t / (1 − cdf μ t)` for almost every `t` with `cdf μ t < 1`, then
  `HazardRateLE μ ν`. Shaked–Shanthikumar, (1.B.2), p. 16.

**Proof route.**

- Densities: `⇐` integrates the a.e. inequality over `s × t`, which is contained in
  `{x ≤ y}`; `⇒` applies the hypothesis to small sets `s, t` around Lebesgue points of `f, g`
  for `ρ`, through Mathlib's differentiation of measures (`VitaliFamily`).
- Conditional laws: `⇒` restricts to `s ∩ Iic x` and `s ∩ Ioi x`, which are ordered, and divides
  by `μ s ν s`; `⇐` takes `s ∪ t`. The case of a common point of `s` and `t` is handled by the
  same restriction, since a common point is the maximum of `s` and the minimum of `t`.
- Residual lives: the conditional distribution functions are `1 − S(x)/S(t)` for `x ≥ t`, so the
  usual order of the residual lives is `S_μ(x) S_ν(t) ≤ S_ν(x) S_μ(t)`. Where `ν (Ioi t) = 0`
  and `μ (Ioi t) ≠ 0`, both sides fail together.
- Hazard functions: on each interval where `cdf μ < 1`,
  `TauCeti.Probability.one_sub_cdf_eq_mul_exp_neg_integral` writes `S_μ` and `S_ν` as
  exponentials of minus their cumulative hazards, with
  `TauCeti.Probability.intervalIntegrable_div_one_sub_cdf_of_eq_withDensity` for the
  integrability; the ratio `S_ν / S_μ` is then the exponential of a nondecreasing integral. Where
  `cdf μ y = 1`, `S_μ(y) = 0` and the inequality is trivial.

*Needs:* 3.1, 3.2, [StandardDistributions](../StandardDistributions/README.md) §7.9.

### 3.4 Closure under maps and convolution

**Targets.**

- **Monotone maps** (`LikelihoodRatioLE.map`, `HazardRateLE.map`): for nondecreasing
  `φ : ℝ → ℝ`, `μ.map φ` and `ν.map φ` are ordered when `μ, ν` are, for both orders.
  Shaked–Shanthikumar, Thm 1.C.8, p. 46, and Thm 1.B.2, p. 18.
- **Log-concave convolution** (`LikelihoodRatioLE.conv_withDensity`): if `μ ≤lr ν` and `ρ` has a
  log-concave Lebesgue density `k` (`TauCeti.LogConcave`), then `μ ∗ ρ ≤lr ν ∗ ρ`.
  Shaked–Shanthikumar, Thm 1.C.9, p. 46.
- **IFR convolution** (`HazardRateLE.conv`): if `μ ≤hr ν` and `x ↦ ρ (Ioi x)` is log-concave
  (`ρ` has increasing failure rate), then `μ ∗ ρ ≤hr ν ∗ ρ`. Shaked–Shanthikumar, Lemma 1.B.3,
  p. 18, and Thm 1.B.4, p. 19.

**Proof route.**

- Monotone maps: the preimage of an ordered pair of sets under a nondecreasing map is an
  ordered pair of measurable sets after removing the common level set, which is a single
  interval; for the hazard order, `φ⁻¹ (Ioi y)` is an upper set of `ℝ`, hence `Ioi a` or `Ici a`,
  and `Ici a` is a decreasing limit.
- Log-concave convolution: the density of `μ ∗ ρ` is `x ↦ ∫ k (x − y) dμ(y)`, and log-concavity
  of `k` is total positivity of order two of `(x, y) ↦ k (x − y)`; the basic composition formula
  (Cauchy–Binet for two-by-two minors) shows the density ratio is nondecreasing, and 3.3 turns it
  into the order.
- IFR convolution: the survival function of `μ ∗ ρ` is `x ↦ ∫ S_ρ(x − y) dμ(y)`; log-concavity of
  `S_ρ` is total positivity of order two of `(x, y) ↦ S_ρ(x − y)` on `y ≤ x`, and the same
  composition formula applies with the hazard order of `μ, ν` as the second kernel.

*Needs:* 3.1, 3.3; `TauCeti.LogConcave`.

### 3.5 Parameter families

**Targets.** The classical families increase in the likelihood-ratio order with their location
and shape parameters; with the cast `ℕ → ℝ` for the discrete laws:

- **Poisson** (`likelihoodRatioLE_map_cast_poissonMeasure`): rate `r ≤ s`, including `r = 0`.
- **Binomial** (`likelihoodRatioLE_map_cast_binomial`): trial counts `n ≤ m` and success
  probabilities `p ≤ q` in `[0, 1]`, boundaries included.
- **Gamma** (`likelihoodRatioLE_gammaMeasure`): shapes `0 < a ≤ b` and rates `0 < s ≤ r`, the law
  `gammaMeasure a r` below `gammaMeasure b s`.
- **Gaussian** (`likelihoodRatioLE_gaussianReal`): means `m₁ ≤ m₂` at a common variance,
  including variance `0`.

Each is a corollary of 3.3: the density ratio is `(s/r)^k e^(r−s)` for Poisson,
`x^(b−a) e^((r−s) x)` up to a constant for Gamma, and `exp ((m₂ − m₁) x / v)` up to a constant
for the Gaussian; for the binomial in `p` it is `((q (1−p)) / (p (1−q)))^k` up to a constant, and
in the trial count it is `m! (n−k)! / (n! (m−k)!) · (1−p)^(m−n)` on `{0, …, n}`, nondecreasing
in `k`, with value `0` off the smaller support handled by the ordered-sets form. The Dirac
boundary cases are checked directly from the definition. By 3.2 these give the hazard-order
comparisons of the same families, and the usual-order comparisons of
[StandardDistributions](../StandardDistributions/README.md) §7.13 are recovered.

*Needs:* 3.3; Mathlib's `ProbabilityTheory.poissonMeasure`, `ProbabilityTheory.binomial`,
`ProbabilityTheory.gammaMeasure`, `ProbabilityTheory.gaussianReal` with their densities.

**Checks.**

- Hazard rate, negative control for the likelihood-ratio order: the uniform law on `{1, 2, 3, 4}`
  and the law with masses `0.1, 0.3, 0.2, 0.4` are in the hazard-rate and reversed-hazard-rate
  orders, but not in the likelihood-ratio order, since `{2}` below `{3}` gives
  `0.25 · 0.3 = 0.075 > 0.25 · 0.2 = 0.05` (Shaked–Shanthikumar, Remark 1.C.2, p. 43;
  `not_likelihoodRatioLE_example`).
- The exponential laws of rates `2` and `1` are in the hazard-rate order: the survival ratio
  `e^(−t) / e^(−2t) = e^t` is `1, 1.64872, 2.71828` at `t = 0, 1/2, 1`.
- Poisson rates `1, 2`: the mass ratio `2^k e^(−1)` is `0.36788, 0.73576, 1.47152` at
  `k = 0, 1, 2`, nondecreasing.
- Binomial trial counts `4, 7` at `p = 0.4`: the mass ratio on `{0, …, 4}` is
  `0.216, 0.378, 0.756, 1.89, 7.56`.
- Gamma, negative control for the parameter direction: `gammaMeasure 3 1` is not below
  `gammaMeasure 2 2` in the likelihood-ratio order: the density ratio
  `4 x e^(−2x) / (x² e^(−x) / 2) = 8 e^(−x) / x` is decreasing.
- `N(0, 1)` and `N(0, 4)`: the density ratio `exp (3x²/8) / 2` is not monotone, so the laws are
  not in the likelihood-ratio order.
- Mean residual life, negative control for the support clause: `δ_1` and the uniform law on
  `{0, 2}` have equal means, but at `t = 0` the residual means are `1 − 0 = 1` for `δ_1` and `2`
  for the uniform law, so the uniform law is not below `δ_1`; its clause is
  `1 · 1 ≤ (1/2) · 1`, false. The first-moment clauses exclude the Cauchy law
  (`not_meanResidualLifeLE_cauchy`), for which the survival clause alone holds reflexively.
- The exponential law of rate `r` has mean residual life `1/r` at every `t`, so rate `2` is below
  rate `1`.

## Layer 4: Convex-type orders and martingale couplings

### 4.1 The increasing convex order

**Definition.** `IncreasingConvexOrderLE μ ν` holds when both laws are integrable and
`∫ φ dμ ≤ ∫ φ dν` for every nondecreasing convex `φ` integrable under both.
Shaked–Shanthikumar, (4.A.1), p. 181.

**Targets.**

- **Stop-loss form** (`increasingConvexOrderLE_iff_stopLoss`): exactly when both are integrable
  and `∫ max (x − t) 0 dμ ≤ ∫ max (x − t) 0 dν` for every `t`. Shaked–Shanthikumar, Thm 4.A.2,
  p. 183.
- **Upper quantile integrals** (`increasingConvexOrderLE_iff_quantile`): exactly when both are
  integrable and `∫_(p,1) Q_μ ≤ ∫_(p,1) Q_ν` for every `p ∈ [0, 1]`. Shaked–Shanthikumar,
  Thm 4.A.3, p. 183.
- **Lower quantile integrals for the convex order** (`convexOrderLE_iff_quantile`):
  `ConvexOrderLE μ ν` exactly when both are integrable, the means agree and
  `∫_(0,p) Q_ν ≤ ∫_(0,p) Q_μ` for every `p ∈ [0, 1]`. Shaked–Shanthikumar, Thm 3.A.5, p. 112.
- **Order properties and closure** (prose targets): reflexive, transitive and antisymmetric on
  integrable laws; closed under convolution of independent pairs (Shaked–Shanthikumar,
  Thm 4.A.8(d), p. 186).

**Proof route.**

- Stop-loss: as for the convex order in MeansMajorizationAndDiscreteInequalities §6.1, with the
  affine part of the approximants `a + b x` with `b ≥ 0`, so no equality of means is needed;
  a nondecreasing convex `φ` is the increasing limit of `a_n + ∑ c_(n,k) max (x − t_(n,k)) 0`
  with `c ≥ 0`, plus a nonnegative multiple of `x` bounded below on the left by the limit slope.
- Quantile integrals: `∫ max (x − t) 0 dμ = ∫_0^1 max (Q_μ(u) − t) 0 du`
  (`MeasureTheory.Measure.measurePreserving_quantile`), and
  `∫_(p,1) Q_μ = min over t of ((1 − p) t + ∫ max (x − t) 0 dμ)`, attained at `t = Q_μ(p)`; the
  two families of inequalities are Legendre transforms of each other.
- Convex order: the convex order is the increasing convex order plus equal means (consumed
  MeansMajorizationAndDiscreteInequalities §6.1), and with equal means
  `∫_(0,p) Q = mean − ∫_(p,1) Q`.

*Needs:* MeansMajorizationAndDiscreteInequalities §6.1;
`MeasureTheory.Measure.setIntegral_quantile_eq_integral`,
`MeasureTheory.Measure.integrableOn_quantile_iff`.

### 4.2 Martingale and submartingale couplings

**Targets.** Let `μ, ν` be integrable laws on `ℝ`.

- **Strassen's theorem on the line** (`convexOrderLE_iff_exists_martingale_kernel`):
  `ConvexOrderLE μ ν` exactly when there is a Markov kernel `κ` with `ν = κ ∘ₘ μ` and, for
  `μ`-almost every `x`, `κ x` integrable with mean `x`. Shaked–Shanthikumar, Thm 3.A.4, p. 112;
  Marshall–Olkin–Arnold, 17.C.12, p. 719.
- **Submartingale coupling** (`increasingConvexOrderLE_iff_exists_submartingale_kernel`):
  `IncreasingConvexOrderLE μ ν` exactly when there is a Markov kernel `κ` with `ν = κ ∘ₘ μ`
  and `x ≤` the mean of `κ x` for `μ`-almost every `x`. Shaked–Shanthikumar, Thm 4.A.5, p. 183.
- **Decomposition** (`increasingConvexOrderLE_iff_exists_cdf_le_convexOrderLE`):
  `IncreasingConvexOrderLE μ ν` exactly when there is a law `ρ` with `μ ≤st ρ` and
  `ConvexOrderLE ρ ν`. Shaked–Shanthikumar, Thm 4.A.6(a), p. 184.
- **Convex step first** (prose target): equivalently, a law `ρ'` with `μ ≤cx ρ'` and
  `ρ' ≤st ν`. Shaked–Shanthikumar, Thm 4.A.6(b), p. 184.

**Proof route.**

- Strassen `⇐`: conditional Jensen, `φ x ≤ ∫ φ dκ x` (`ConvexOn.map_integral_le` for each `x`),
  integrated against `μ`.
- Strassen `⇒`, compact case: for laws carried by a compact interval, the dilation of
  [MathematicalStatisticsFoundations](../MathematicalStatisticsFoundations/README.md) §7.5
  (Strassen's theorem on a compact convex subset of `ℝ^d`, with `d = 1` and its hypothesis on
  continuous convex functions, implied by `ConvexOrderLE`) gives the kernel.
- Strassen `⇒`, general case: let `μ_n` collapse the mass of `μ` outside `[−n, n]` to its
  conditional means on the two tails; then `μ_n ≤cx μ ≤cx ν` by Jensen on each tail. Collapse
  `ν` outside `[−R, R]` likewise to `ν_R`, with `[−R, R]` containing the support of `μ_n`; then
  `μ_n ≤cx ν_R`, because the stop-loss transforms of `ν_R` and `ν` agree on `[−R, R]`, and
  outside it that of `μ_n` is `0` or the affine `m − t`, both below that of `ν_R`.
  The compact case gives kernels `κ_(n,R)`; their joint laws
  `μ_n ⊗ₘ κ_(n,R)` are tight with uniformly integrable second marginals, and a limit point
  (`TauCeti.exists_isCoupling_tendsto_of_isTightMeasureSet`) is a coupling of `μ, ν` under which
  `∫ (y − x) h(x) = 0` for every bounded continuous `h`, by uniform integrability. Disintegrate
  it (`MeasureTheory.Measure.condKernel`, `MeasureTheory.Measure.disintegrate`) to obtain `κ`.
- Submartingale: let `ρ` be the law of `max X c` with `c` chosen so that the means of `ρ` and
  `ν` agree; `E max (X, c)` is continuous and nondecreasing in `c`, from `E X ≤ E Y` up to `∞`.
  Then `μ ≤st ρ`, and `ρ ≤cx ν` follows from the stop-loss form, since the stop-loss transform
  of `ρ` equals that of `μ` above `c` and is affine below. This gives the decomposition; the
  submartingale kernel composes the deterministic step `x ↦ max x c` with the martingale kernel
  of `ρ, ν`. The converse directions are conditional Jensen for nondecreasing convex `φ`.

*Needs:* 4.1; [MathematicalStatisticsFoundations](../MathematicalStatisticsFoundations/README.md)
§7.5; MeansMajorizationAndDiscreteInequalities §6.1; Mathlib's disintegration and Prokhorov
theorem; `TauCeti.exists_isCoupling_tendsto_of_isTightMeasureSet`.

### 4.3 Cut criteria

**Target** (`increasingConvexOrderLE_of_cdf_crossing`). Let `μ, ν` be integrable with
`∫ x dμ ≤ ∫ x dν`, and let `c` be such that `cdf μ ≤ cdf ν` on `x < c` and `cdf ν ≤ cdf μ` on
`x ≥ c`. Then `IncreasingConvexOrderLE μ ν`. Shaked–Shanthikumar, Thm 4.A.22, p. 194 (the
Karlin–Novikoff criterion).

**Corollary** (prose target). With equal means the same crossing gives `ConvexOrderLE μ ν`
(Shaked–Shanthikumar, Thm 3.A.44, (3.A.59), p. 133), by 4.1 and the consumed equality of means.

**Proof route.** The stop-loss difference
`D(t) = ∫ max (x − t) 0 dν − ∫ max (x − t) 0 dμ = ∫_t^∞ (cdf μ − cdf ν)` is nonincreasing on
`[c, ∞)` with limit `0`, hence `≥ 0` there; on `(−∞, c)` it is nondecreasing, with limit at `−∞`
equal to the difference of means, which is `≥ 0`. Then 4.1.

*Needs:* 4.1.

### 4.4 Closure and equality

**Targets.**

- **Convolution** (`ConvexOrderLE.conv`): if `μ₁ ≤cx ν₁` and `μ₂ ≤cx ν₂`, then
  `μ₁ ∗ μ₂ ≤cx ν₁ ∗ ν₂`. Shaked–Shanthikumar, Thm 3.A.12(d), p. 120.
- **Mixtures** (`ConvexOrderLE.bind`): for Markov kernels `κ, η` into `ℝ` with
  `κ a ≤cx η a` for `ρ`-almost every `a`, and integrable mixtures, `κ ∘ₘ ρ ≤cx η ∘ₘ ρ`.
  Shaked–Shanthikumar, Thm 3.A.12(b), p. 119.
- **Equality** (`eq_of_convexOrderLE_of_integral_eq`): if `μ ≤cx ν` and `∫ φ dμ = ∫ φ dν` for
  one strictly convex `φ` integrable under both, then `μ = ν`. Shaked–Shanthikumar, Thm 3.A.43,
  p. 133.

**Proof route.**

- Convolution: compose the martingale kernels of 4.2 for the two factors, or directly: for
  convex `φ`, `x ↦ ∫ φ (x + y) dμ₂(y)` is convex, so the stop-loss form of 4.1 applies one factor
  at a time.
- Mixtures: the stop-loss transform of `κ ∘ₘ ρ` is the `ρ`-average of those of `κ a`; integrate
  the a.e. inequalities and use the consumed stop-loss characterisation; equal means follow the
  same way.
- Equality: by 4.2, `ν = κ ∘ₘ μ` with barycentre `x`; strict Jensen
  (`StrictConvexOn.ae_eq_const_or_map_average_lt`) forces `κ x = δ_x` almost everywhere when
  `∫ φ dν = ∫ φ dμ`.

*Needs:* 4.1, 4.2.

### 4.5 Mean residual life and the increasing convex order

**Targets.**

- **Implication** (`MeanResidualLifeLE.increasingConvexOrderLE`): the mean-residual-life order
  implies the increasing convex order. Shaked–Shanthikumar, Thm 4.A.26, p. 195.
- **Residual lives** (`meanResidualLifeLE_iff_cond_Ioi`): for integrable laws,
  `MeanResidualLifeLE μ ν` exactly when `μ[|Ioi t] ≤icx ν[|Ioi t]` for every `t` with both
  masses nonzero. Shaked–Shanthikumar, Thm 4.A.24, p. 194, in the shifted form.

**Proof route.** Write `π_μ(t) = ∫ max (x − t) 0 dμ = ∫_t^∞ S_μ`. The order says
`π_μ / π_ν` is nonincreasing where `π_ν > 0` (Shaked–Shanthikumar, (2.A.5), p. 82), since
`π' = −S`. Letting `t → −∞`, `π_μ(t) − π_ν(t)` tends to the difference of means, and monotonicity
of the ratio with the limit `1` at `−∞` gives `π_μ ≤ π_ν` everywhere; 4.1 concludes. The residual
form applies the stop-loss form of 4.1 to the conditional laws, whose stop-loss transforms at
`u ≥ t` are `π(u) / S(t)`.

*Needs:* 3.1, 4.1.

**Checks.**

- `δ_0` and the uniform law on `{0, 2}` are in the increasing convex order and not in the convex
  order (means `0` and `1`). The decomposition of 4.2 takes `c = 1`: `max 0 1 = 1`, so
  `ρ = δ_1`, which has mean `1` and is below the uniform law on `{0, 2}` in the convex order.
- Stop-loss at `t = 0`: `0` for `δ_0` and `1/2` for the Rademacher law; the martingale kernel of
  4.2 is the constant kernel at the Rademacher law.
- `N(0, 1) ≤cx N(0, 4)` by the cut criterion with `c = 0`; the stop-loss values at `0` are
  `1/√(2π) ≈ 0.39894` and `2/√(2π) ≈ 0.79788`.
- Negative control for the crossing direction: `δ_1` and the uniform law on `{0, 2}` satisfy
  the hypothesis of 4.3 with `c = 1` (`0 ≤ 1/2` on `[0, 1)`, `1/2 ≤ 1` on `[1, 2)`); the
  reversed pair crosses the other way, and the uniform law on `{0, 2}` is not below `δ_1`:
  their stop-loss values at `1` are `1/2` and `0`.

## Layer 5: Dispersion, star and Lorenz orders

### 5.1 The dispersive order

**Definition.** `DispersiveLE μ ν` holds when
`Q_μ(v) − Q_μ(u) ≤ Q_ν(v) − Q_ν(u)` for `0 < u ≤ v < 1`. Shaked–Shanthikumar, (3.B.1), p. 148,
with the right-continuous inverse; the lower quantile gives the same order, since the two
inverses differ only at countably many levels and both are monotone.

**Targets.**

- **Common left endpoint** (`DispersiveLE.cdf_le_of_tendsto_quantile`): if `μ ≤disp ν` and both
  quantile functions tend to the same finite `a` at `0+`, then `μ ≤st ν`. Shaked–Shanthikumar,
  Thm 3.B.13(a), p. 154.
- **Centred convex order** (`DispersiveLE.convexOrderLE_map_sub`): for integrable laws with
  `μ ≤disp ν`, the centred laws are in the convex order. Shaked–Shanthikumar, Thm 3.B.16,
  p. 154.
- **Variance** (prose target): hence `Var μ ≤ Var ν` when `ν` has a finite second moment.
  Shaked–Shanthikumar, (3.B.25), p. 155.

**Proof route.**

- Common left endpoint: let `u → 0+` in `Q_ν(v) − Q_μ(v) ≥ Q_ν(u) − Q_μ(u)`; the limit is
  `a − a = 0`, so `Q_μ ≤ Q_ν` on `(0, 1)`, which is `MeasureTheory.Measure.cdf_le_iff_quantile_le`.
- Centred convex order: `Q_ν − Q_μ` is nondecreasing, so the centred quantile difference
  `D(u) = (Q_ν − m_ν) − (Q_μ − m_μ)` is nondecreasing with integral `0`; then
  `∫_(0,p) D ≤ 0` for every `p`, which is 4.1's lower quantile form.

*Needs:* 4.1; `MeasureTheory.Measure.cdf_le_iff_quantile_le`.

### 5.2 The star order

**Definition.** For laws carried by `(0, ∞)`, `StarOrderLE μ ν` holds when `Q_ν / Q_μ` is
nondecreasing on `(0, 1)`, stated as `Q_ν(u) Q_μ(v) ≤ Q_ν(v) Q_μ(u)` for `0 < u ≤ v < 1`.
Shaked–Shanthikumar, (4.B.1), p. 214.

**Target** (`starOrderLE_iff_dispersiveLE_map_log`). For laws with `μ (Iic 0) = 0` and
`ν (Iic 0) = 0`, `StarOrderLE μ ν` exactly when the laws of the logarithms are in the dispersive
order. Shaked–Shanthikumar, Thm 4.B.1, p. 214.

**Proof route.** For a law on `(0, ∞)` the quantile is positive on `(0, 1)` (right-continuity of
`cdf` at `0`), and the quantile of the image under the increasing `log` is `log ∘ Q`
(`MeasureTheory.Measure.quantile_map_of_monotoneOn` on `Ioi 0`); the monotonicity of
`log Q_ν − log Q_μ` is that of `Q_ν / Q_μ`.

*Needs:* 5.1; `MeasureTheory.Measure.quantile_map_of_monotoneOn`.

### 5.3 Lorenz curves and the Gini index

**Definitions.** For an integrable law `μ` with positive mean,
`lorenzCurve μ u = (∫ x dμ)⁻¹ ∫_(0,u] Q_μ` for `u ∈ [0, 1]` (Marshall–Olkin–Arnold, 17.C.1,
p. 713; Shaked–Shanthikumar, (3.A.43), p. 119). `LorenzOrderLE μ ν` holds when both laws are
integrable with positive means and `lorenzCurve ν ≤ lorenzCurve μ` on `[0, 1]`: `ν` is the more
unequal law. `giniIndex μ = 1 − 2 ∫_0^1 lorenzCurve μ`, twice the area between the diagonal and
the curve (Marshall–Olkin–Arnold, p. 721).

**Targets.**

- **Convexity** (`convexOn_lorenzCurve`): the Lorenz curve is convex on `[0, 1]`, with value `0`
  at `0` and `1` at `1`. Marshall–Olkin–Arnold, p. 715.
- **Convex order of the normalised laws** (`lorenzOrderLE_iff_convexOrderLE`):
  `LorenzOrderLE μ ν` exactly when `μ` scaled to mean one is below `ν` scaled to mean one in the
  convex order. Marshall–Olkin–Arnold, 17.C.8–17.C.10, p. 719; Shaked–Shanthikumar, Thm 3.A.10,
  p. 119.
- **Star implies Lorenz** (`StarOrderLE.lorenzOrderLE`): for integrable laws on `(0, ∞)`,
  `StarOrderLE μ ν` implies `LorenzOrderLE μ ν`. Marshall–Olkin–Arnold, 17.C.15, p. 723;
  Shaked–Shanthikumar, Thm 4.B.4, p. 215 (the first step of its proof).
- **Gini monotonicity** (`LorenzOrderLE.giniIndex_le`): `LorenzOrderLE μ ν` implies
  `giniIndex μ ≤ giniIndex ν`. Marshall–Olkin–Arnold, p. 721.
- **Mean difference** (`giniIndex_eq_integral_abs_sub`): for integrable `μ` with positive mean,
  `giniIndex μ` is `∫ |x − y| d(μ ⊗ μ)` divided by twice the mean. Marshall–Olkin–Arnold, (13a),
  p. 721.
- **Scale invariance** (prose target): `lorenzCurve` of `μ` and of its image under `x ↦ c x`,
  `c > 0`, agree; so do the Lorenz orders.

**Proof route.**

- Convexity: the derivative of `u ↦ ∫_(0,u] Q_μ` is `Q_μ`, nondecreasing
  (`MeasureTheory.Measure.monotoneOn_quantile`); the endpoint values are `0` and the mean
  (`MeasureTheory.Measure.setIntegral_quantile_eq_integral`).
- Convex order: the quantile of the law scaled by `1/m` is `Q/m`
  (`MeasureTheory.Measure.quantile_map_of_monotone`), so the Lorenz curves are the lower quantile
  integrals of the normalised laws, which have mean `1`; 4.1's lower quantile form concludes.
- Star implies Lorenz: normalise to mean one by scale invariance of both orders. Then
  `Q_ν / Q_μ` is nondecreasing with `∫_0^1 (Q_ν − Q_μ) = 0`, so `Q_ν − Q_μ = Q_μ (Q_ν/Q_μ − 1)`
  changes sign once, from `−` to `+`, and `∫_(0,p) (Q_ν − Q_μ) ≤ 0` for every `p`.
- Mean difference: `∫∫ |x − y| = 2 ∫_0^1 (2u − 1) Q_μ(u) du` (pair the order statistics through
  the quantile transform), and `1 − 2 ∫_0^1 L = (1/m) ∫_0^1 (2u − 1) Q_μ(u) du` by Fubini.

*Needs:* 4.1, 5.2; `MeasureTheory.Measure.quantile_map_of_monotone`,
`MeasureTheory.Measure.monotoneOn_quantile`.

### 5.4 Majorization and the Lorenz order

**Target** (`majorizes_iff_lorenzOrderLE`). For a nonempty finite index type and `x, y : ι → ℝ`
with equal totals and positive total, `Majorizes x y` exactly when the empirical laws
(`TauCeti.Probability.empiricalFiniteMeasure`) are in the Lorenz order. Marshall–Olkin–Arnold,
§17.C, p. 718, with the discrete Lorenz curve of 17.C.1, p. 714.

**Proof route.** By 5.3, the Lorenz order of the empirical laws is the convex order of the
empirical laws scaled by the common mean `(∑ y) / card ι`, which is the empirical law of the
scaled vectors; majorization is invariant under a common positive scaling, and
MeansMajorizationAndDiscreteInequalities §6.2 identifies majorization with the convex order of
empirical laws.

*Needs:* 5.3; MeansMajorizationAndDiscreteInequalities §4.1 and §6.2;
`TauCeti.Probability.integral_empiricalFiniteMeasure`.

**Checks.**

- The exponential laws of rates `2` and `1` are in the dispersive order: their quantiles
  `−log (1 − u) / r` have spreads in ratio `1/2`. `N(0, 1) ≤disp N(0, 4)`: the quantiles are
  `Φ⁻¹(u)` and `2 Φ⁻¹(u)`.
- Negative control for the endpoint hypothesis of 5.1: `N(0, 1) ≤disp N(−5, 4)` (the quantile
  difference `Φ⁻¹(u) − 5` is nondecreasing), but `N(−5, 4)` is not above `N(0, 1)` in the usual
  order.
- The uniform law on `(0, 1)` is below the law of `U²` in the star order: `Q` is `u` and `u²`,
  with ratio `u`. Their Lorenz curves are `u²` and `u³`, `1/4` and `1/8` at `u = 1/2`, and their
  Gini indices `1/3` and `1/2`; the mean differences `E|X − X'| = 1/3` and `E|Y − Y'| = 1/3`
  divided by `2 · 1/2` and `2 · 1/3` give the same values.
- The exponential law has Lorenz curve `u + (1 − u) log (1 − u)`, equal to
  `(1 − log 2)/2 ≈ 0.15343` at `u = 1/2`, and Gini index `1/2`.
- `δ_m` with `m > 0` has Lorenz curve `u`, the largest possible, and Gini index `0`.
- Majorization: for `x = (1/2, 1/2)` and `y = (1, 0)`, `lorenzCurve` of the empirical law of `y`
  is `max (2u − 1) 0`, equal to `1/2` at `u = 3/4`, below the diagonal value `3/4` for `x`.

## Worked examples

- **Exponential laws.** For rates `r ≥ s > 0`, `Exp(r)` is below `Exp(s)` in every order of
  this roadmap that relates laws of different scale: likelihood ratio (density ratio
  `(s/r) e^((r−s) x)`), hence hazard rate and usual order; dispersive (quantile spreads scale by
  `1/r`); star order holds in both directions and the Lorenz curves coincide, since the laws
  differ by scale only.
- **Rademacher spread.** `δ_0`, the uniform law on `{−1, 1}` and the uniform law on `{−2, 2}`
  increase in the convex order. The martingale kernel from the first to the second is constant;
  one from the second to the third sends `1` to `(3/4) δ_2 + (1/4) δ_(−2)` and `−1` to
  `(1/4) δ_2 + (3/4) δ_(−2)`, with means `±1`, and its mixture puts mass `1/2` on each of
  `±2`.
- **Gamma shapes.** `gammaMeasure 2 2` is below `gammaMeasure 3 1` in the likelihood-ratio order
  (density ratio `(x² e^(−x) / 2) / (4 x e^(−2x)) = x e^x / 8`, nondecreasing), and the
  reverse fails, as in the Checks of 3.5.

## Downstream consumers

- MathematicalStatisticsFoundations §6.3 (monotone likelihood ratio families): the laws of the
  statistic `T` in such a family increase in the likelihood-ratio order, and 3.2 gives the
  monotone power functions through the usual order.
- The roadmap RiskMeasures works with stop-loss premiums and comonotone sums; the
  increasing convex order and the decomposition of 4.2 are the stop-loss order of actuarial
  science.
- The roadmap GibbsMeasuresAndTheIsingModel uses Holley's inequality (Mathlib's
  `holley`) on finite distributive lattices; 2.2 gives the coupling form of the resulting
  stochastic domination on product spaces.

## Scope and ownership

The roadmap is complete when every target below is a theorem of the TauCeti namespace with the
hypotheses stated here, every owned definition has the API its Checks name, and every statement
in `Suggested.lean` is proved. The headlines with a Lean name are stated in `Suggested.lean`, each
with every conclusion this README attaches to it; that file is not an exhaustive acceptance test,
and the other headlines here are targets of the same standing, stated in prose.

Owned here:

- the test-function form of the usual order on the line, its mixtures and weak limits (Layer 1);
- the usual order `StochasticLE` on preordered spaces, the ordered-coupling theorem and the
  sequential construction (Layer 2);
- the orders `HazardRateLE`, `ReversedHazardRateLE`, `LikelihoodRatioLE`, `MeanResidualLifeLE`
  and the theorems of Layer 3, including the likelihood-ratio comparisons of the Poisson,
  binomial, Gamma and Gaussian families;
- the order `IncreasingConvexOrderLE`, Strassen's theorem on the line for laws with a finite
  mean, the submartingale coupling, the cut criteria and the closure theorems of the convex
  order of Layer 4;
- the orders `DispersiveLE`, `StarOrderLE`, `LorenzOrderLE`, the Lorenz curve `lorenzCurve`, the
  Gini index `giniIndex` and the theorems of Layer 5.

**Not owned here.**

- [StandardDistributions](../StandardDistributions/README.md) §7.13 owns the usual order on the
  line through distribution functions and quantiles, its ordered coupling, its order properties,
  its closure under monotone maps and convolution, and the usual-order parameter comparisons of
  the Poisson, binomial, Gamma and Beta families; all of it is in Tau Ceti
  (`Probability/StochasticOrder.lean` and the `StochasticOrder.lean` files of the distribution
  families) and is consumed. Its §7.9 owns survival and hazard functions, consumed in 3.3, and
  the hazard formulas of the exponential, Gamma, Weibull, log-normal and generalized Pareto laws.
- MeansMajorizationAndDiscreteInequalities owns, in its §6.1, the convex order `ConvexOrderLE`
  with its stop-loss characterisation, its strong form and its order properties, and in §6.2 the
  identification of majorization with the convex order of empirical laws; in §4.1 majorization
  `Majorizes`. These are consumed and copied, not restated.
- [MathematicalStatisticsFoundations](../MathematicalStatisticsFoundations/README.md) §7.5 owns
  Strassen's theorem for laws on a compact convex subset of `ℝ^d`, consumed in 4.2, and §6.3
  owns monotone likelihood ratio families of densities for testing (Karlin–Rubin); the
  likelihood-ratio order between two laws here is a different object and is not stated there.
- [OptimalTransport](../OptimalTransport/README.md) §3.7 owns the quantile coupling on the line,
  and §1.5 and §2.4 own primal attainment and Kantorovich duality, consumed in 2.2; couplings,
  their compactness, attainment and duality are in Tau Ceti's `MeasureTheory/OptimalTransport/`
  files.
- Monotone coupling of Markov chains and the Peskun order of transition kernels belong with
  Markov chain roadmaps; they compare kernels, not laws.

## Exact supplier contracts

### From Mathlib

- `ProbabilityTheory.cdf`, `MeasureTheory.Measure.real`: distribution functions and real-valued
  measures.
- `ProbabilityTheory.cond` (`Mathlib/Probability/ConditionalProbability.lean`): conditional laws
  `μ[|s]`.
- `MeasureTheory.Measure.bind`, `MeasureTheory.Measure.compProd`, `MeasureTheory.Measure.pi`,
  `MeasureTheory.Measure.conv`, `ProbabilityTheory.IsMarkovKernel`: mixtures, joint laws,
  products and convolution.
- `MeasureTheory.Measure.condKernel`, `MeasureTheory.Measure.disintegrate`
  (`Mathlib/Probability/Kernel/Disintegration/`): disintegration of a law on `ℝ × ℝ`.
- `MeasureTheory.ProbabilityMeasure`,
  `MeasureTheory.ProbabilityMeasure.tendsto_iff_forall_integral_tendsto`,
  `isCompact_closure_of_isTightMeasureSet` (`Mathlib/MeasureTheory/Measure/Prokhorov.lean`): weak
  convergence and Prokhorov's theorem.
- `ConvexOn.map_integral_le`, `StrictConvexOn.ae_eq_const_or_map_average_lt`
  (`Mathlib/Analysis/Convex/Integral.lean`): Jensen's inequality and its strict case.
- `MeasureTheory.lintegral_eq_lintegral_meas_lt`: the layer-cake formula.
- `IsUpperSet`, `OrderClosedTopology`: upper sets and closed orders.
- `ProbabilityTheory.poissonMeasure`, `ProbabilityTheory.binomial`,
  `ProbabilityTheory.gammaMeasure`, `ProbabilityTheory.gaussianReal`: the parameter families of
  3.5.
- `holley` (`Mathlib/Combinatorics/SetFamily/FourFunctions.lean`): Holley's inequality, named in
  the downstream consumers.

### From Tau Ceti

- `MeasureTheory.Measure.quantile`, `MeasureTheory.Measure.quantile_le_iff`,
  `MeasureTheory.Measure.cdf_le_iff_quantile_le`, `MeasureTheory.Measure.monotoneOn_quantile`,
  `MeasureTheory.Measure.measurePreserving_quantile`,
  `MeasureTheory.Measure.integrableOn_quantile_iff`,
  `MeasureTheory.Measure.setIntegral_quantile_eq_integral`,
  `MeasureTheory.Measure.measurable_quantile_cdf_family` (`TauCeti/Probability/Quantile.lean`):
  the lower quantile and its transfer of integrals.
- `MeasureTheory.Measure.quantile_map_of_monotoneOn`,
  `MeasureTheory.Measure.quantile_map_of_monotone` (`TauCeti/Probability/Quantile/Map.lean`):
  quantiles of monotone images.
- `MeasureTheory.Measure.quantileCoupling`, `MeasureTheory.Measure.isCoupling_quantileCoupling`,
  `MeasureTheory.Measure.ae_fst_le_snd_quantileCoupling`
  (`TauCeti/MeasureTheory/OptimalTransport/Wasserstein/Quantile/Basic.lean`): the quantile
  coupling.
- `TauCeti.IsCoupling.cdf_le_of_ae_fst_le_snd`,
  `MeasureTheory.Measure.exists_isCoupling_ae_fst_le_snd_iff_cdf_le`,
  `MeasureTheory.Measure.cdf_le_refl`, `MeasureTheory.Measure.cdf_le_trans`,
  `MeasureTheory.Measure.eq_of_cdf_le_cdf_le`,
  `MeasureTheory.Measure.cdf_map_le_cdf_map_of_monotone`,
  `MeasureTheory.Measure.cdf_conv_le_cdf_conv`, `ProbabilityTheory.HasLaw.cdf_le_of_ae_le`
  (`TauCeti/Probability/StochasticOrder.lean`): the usual order on the line.
- `TauCeti.IsCoupling` (`TauCeti/MeasureTheory/OptimalTransport/Coupling.lean`) and
  `TauCeti.exists_isCoupling_tendsto_of_isTightMeasureSet`
  (`TauCeti/MeasureTheory/OptimalTransport/Compactness.lean`): couplings and their limits.
- `TauCeti.exists_isOptimalCoupling` (`TauCeti/MeasureTheory/OptimalTransport/Existence/Basic.lean`)
  and `TauCeti.isLUB_ofReal_kantorovichDualValue_boundedContinuous_of_lowerSemicontinuous`
  (`TauCeti/MeasureTheory/OptimalTransport/Duality/LowerSemicontinuous.lean`): optimal couplings
  for a lower semicontinuous cost on Polish spaces, and Kantorovich duality over bounded
  continuous potentials. Used in 2.2.
- `TauCeti.Probability.one_sub_cdf_eq_mul_exp_neg_integral`,
  `TauCeti.Probability.intervalIntegrable_div_one_sub_cdf_of_eq_withDensity`,
  `TauCeti.Probability.one_sub_cdf_eq_exp_neg_integral_of_eq_withDensity`
  (`TauCeti/Probability/Hazard.lean`), with
  `TauCeti.Probability.absolutelyContinuousOnInterval_cdf_of_eq_withDensity` and
  `TauCeti.Probability.ae_hasDerivAt_cdf_of_eq_withDensity`
  (`TauCeti/Probability/Cdf/Density.lean`): survival as the exponential of the cumulative hazard.
- `TauCeti.LogConcave` (`TauCeti/Analysis/Convex/LogConcave.lean`): log-concave functions with
  values in `ℝ≥0∞`.
- `TauCeti.Probability.empiricalFiniteMeasure`,
  `TauCeti.Probability.integral_empiricalFiniteMeasure`
  (`TauCeti/Probability/Process/EmpiricalMeasure.lean`): empirical laws of finite families.

### From other roadmaps

- MeansMajorizationAndDiscreteInequalities §6.1: the definition `ConvexOrderLE` (copied
  verbatim), its stop-loss characterisation for probability measures (both integrable, equal
  means, ordered stop-loss transforms), its strong form and its order properties. Used in 4.1,
  4.2, 4.4, 5.1, 5.3.
- MeansMajorizationAndDiscreteInequalities §4.1 and §6.2: the definitions `maxSubsetSum` and
  `Majorizes` (copied verbatim), and, for a nonempty index type, majorization as the convex order
  of the empirical laws. Used in 5.4.
- [StandardDistributions](../StandardDistributions/README.md) §7.9 and §7.13: survival and
  hazard, the usual order, through the Tau Ceti declarations above. Used in Layers 1, 3 and 5.
- [MathematicalStatisticsFoundations](../MathematicalStatisticsFoundations/README.md) §7.5:
  Strassen's theorem for probability measures carried by a compact convex subset of `ℝ^d`, with
  continuous convex test functions, giving a Markov kernel with barycentre the identity. Used in
  4.2.
- [OptimalTransport](../OptimalTransport/README.md) §3.7: the quantile coupling. Used in 1.1, 2.3.
  §1.5 and §2.4: primal attainment and Kantorovich duality for lower semicontinuous costs on
  Polish spaces, through the Tau Ceti declarations above. Used in 2.2.

## Beyond this roadmap (a roadmap for a roadmap; do not implement)

- **Multivariate convex order.** Strassen's theorem on `ℝ^d` and on Banach spaces for laws with a
  finite first moment, the supermodular, directionally convex and concordance orders, and their
  use for dependence comparison. They need the compact case of
  MathematicalStatisticsFoundations §7.5 extended by tightness in several dimensions and a theory
  of dependence structures.
- **Variation diminishing and total positivity.** The Lewis–Thompson theorem on the dispersive
  order of log-concave convolutions (Shaked–Shanthikumar, Thm 3.B.8), the multivariate
  likelihood-ratio order (`TP₂` densities on lattices) and its closure under marginalization.
  They need the theory of totally positive kernels in general order.
- **Ageing classes.** IFR, DFR, NBU and their characterisation by the convex transform and
  star-shaped orders, the convex transform order itself, and the superadditive order. They are
  the reliability-theory side of the transform orders of Layer 5.
- **Laplace transform, moment and other integral stochastic orders.** The Laplace transform
  order, the moment orders, and the general integral stochastic orders of Müller generated by a
  class of test functions, with their maximal generators.
- **Stochastic orders of processes.** Comparison of Markov processes and point processes,
  monotone coupling of Markov chains, and the Peskun order.

## References

- T. M. Liggett, *Interacting Particle Systems*, Classics in Mathematics, Springer, Berlin, 2005
  (reprint of the 1985 edition). Used: Ch. II, Thm 2.4, p. 72.
- A. W. Marshall, I. Olkin and B. C. Arnold, *Inequalities: Theory of Majorization and Its
  Applications*, 2nd ed., Springer Series in Statistics, Springer, New York, 2011. Used:
  17.A.5, p. 696; 17.C.1, pp. 713–714; p. 715; p. 718; 17.C.8, 17.C.9, 17.C.10 and 17.C.12,
  p. 719; (13a), p. 721; 17.C.15, p. 723.
- S. T. Rachev and L. Rüschendorf, *Mass Transportation Problems*, vol. I: *Theory*, Probability
  and Its Applications, Springer, New York, 1998. Used: Thm 3.5.5, pp. 146–147.
- M. Shaked and J. G. Shanthikumar, *Stochastic Orders*, Springer Series in Statistics,
  Springer, New York, 2007. Used: (1.A.1), p. 3; (1.A.7), p. 4; Thm 1.A.1, p. 5; Thm 1.A.3,
  p. 6; Thm 1.A.6, p. 7; Thm 1.A.8, p. 8; (1.B.2)–(1.B.4), p. 16; (1.B.7), p. 17; Thm 1.B.1,
  Thm 1.B.2 and Lemma 1.B.3, p. 18; Thm 1.B.4, p. 19; (1.B.39), p. 36; Thm 1.B.42, p. 38;
  (1.C.1)–(1.C.3), p. 42; Thm 1.C.1 and Remark 1.C.2, p. 43; Thm 1.C.6, p. 45; Thm 1.C.8 and
  Thm 1.C.9, p. 46; (2.A.2)–(2.A.6), p. 82; Thm 2.A.1, p. 83; Thm 3.A.4 and Thm 3.A.5, p. 112;
  (3.A.43) and Thm 3.A.10, p. 119; Thm 3.A.12, pp. 119–120; Thm 3.A.43 and Thm 3.A.44, p. 133;
  (3.B.1), p. 148; Thm 3.B.13 and Thm 3.B.16, p. 154; (3.B.25), p. 155; (4.A.1), p. 181;
  Thm 4.A.2, Thm 4.A.3 and Thm 4.A.5, p. 183; Thm 4.A.6, p. 184; Thm 4.A.8, p. 186; Thm 4.A.22
  and Thm 4.A.24, p. 194; Thm 4.A.26, p. 195; (4.B.1) and Thm 4.B.1, p. 214; Thm 4.B.4, p. 215;
  (6.B.1)–(6.B.4), p. 266; Thm 6.B.1, p. 267; Thm 6.B.3, p. 268.
