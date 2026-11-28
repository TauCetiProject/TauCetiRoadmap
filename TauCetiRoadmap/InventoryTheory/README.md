# Roadmap: inventory theory

**Summary.** Inventory theory asks how much of a good to stock when holding stock costs money,
running short costs money, and every order may carry a fixed charge. This roadmap states the
classical structure theorems of the subject as theorems about cost functions on the real line,
value functions defined by a backward recursion, and ordering rules given as functions. Random
demand is a probability law on `ℝ` with a finite mean; it is not required to be nonnegative or
to have a density, so atoms are allowed throughout. Its main results are the following.

- *Base-stock and (s, S) levels.* In the periodic-review problem with backlogging, a fixed cost
  `K ≥ 0` per order, unit ordering cost `c` with `0 ≤ c < p`, shortage cost `p` and holding cost
  `h > 0` per unit and period, and independent demands with a common law of finite mean, let `G`
  be the expected cost of raising the stock to `y` with a given number of periods to go, before
  the fixed cost. Then `G` is continuous, tends to `+∞` at both ends, and is `K`-convex in the
  sense of Scarf. For every global minimizer `S` of `G` there is a reorder point `s ≤ S` such that
  it is optimal to raise the stock to `S` when it is below `s`, and not to order otherwise. When
  `K = 0` every value function is convex and raising the stock to `max(S, x)` is optimal.
- *Optimality of the recursion.* Under the same hypotheses, no ordering rule that never lowers the
  stock has a cost below the value given by the recursion, where the cost of a rule is its
  expected cost computed by the same backward recursion, and a rule that at every stage chooses a
  minimizer in the recursion attains the value.
- *Zero-inventory ordering.* For known nonnegative demands over finitely many periods, no
  shortages, and production and holding costs that are concave on `[0, ∞)`, as for a setup cost
  plus a linear cost, some optimal plan produces only in periods that it enters with zero stock.

The roadmap also proves the economic order quantity formula as the minimization of the average
setup and holding cost of a cycle of length `T`. The newsvendor rule, that for `b, h > 0` the
expected cost `b E(D − y)⁺ + h E(y − D)⁺` of stocking `y` against a demand `D` of finite mean is
minimized exactly on the closed interval from the lower to the upper quantile of `D` at the level
`b / (b + h)`, is not a target: it is the Rockafellar–Uryasev formula of RiskMeasures 4.1 for the
law of `−D` at the level `h / (b + h)`, and 1.2 records the change of variables.

Its targets use Mathlib's convex and concave functions, Bochner and lower Lebesgue integrals and
semicontinuity. MarkovDecisionProcesses solves finite-horizon problems with countably many states
and finitely many actions by backward induction; the recursion here has a real state and a
continuum of actions and is treated on its own. StandardDistributions plans the general theory
of quantiles that Tau Ceti now provides.

Layer 1 below treats the economic order quantity and derives the newsvendor rule from
RiskMeasures 4.1. Layer 2 defines the periodic-review recursion and proves the base-stock theorem.
Layer 3 defines `K`-convexity and proves Scarf's structural lemma and Scarf's theorem on the
recursion of Layer 2. Layer 4 uses Layers 2 and 3 to show that the recursion gives the least
expected cost over all ordering rules. Layer 5, which uses no other layer, proves zero-inventory
ordering for deterministic demand.

## Conventions

- **Demand.** A demand law is `μ : Measure ℝ` with `[IsProbabilityMeasure μ]` and
  `Integrable (fun w ↦ w) μ`. Negative demand (returns) is allowed. Expectations are Bochner
  integrals `∫ w, f w ∂μ`; Mathlib gives the junk value `0` to the integral of a non-integrable
  function, and every theorem that integrates against `μ` assumes the integrability above, which
  makes each integrand used here integrable.
- **Quantiles.** `μ.quantile t = sInf {x | t ≤ cdf μ x}` and
  `μ.upperQuantile t = sInf {x | t < cdf μ x}` are Tau Ceti's lower and upper quantiles, where
  `cdf μ` is Mathlib's distribution function `x ↦ μ.real (Iic x)`. They are used only at levels
  strictly between `0` and `1`, where both are genuine values.
- **Costs.** `max z 0` is the positive part. In Layers 2–4, `K` is the fixed cost of an order, `c`
  the unit ordering cost, `p` the unit shortage (backlog) cost and `h` the unit holding cost per
  period; `r z = p max(−z, 0) + h max(z, 0)` is the cost of ending a period with stock `z`.
  Every theorem of these layers assumes `0 ≤ c`, `c < p` and `0 < h`; Layers 3 and 4 assume
  `0 ≤ K`, and Layer 2 takes `K = 0`.
- **Periods to go.** Value functions are indexed by the number `n` of periods left: `V 0 = 0`, and
  `V (n + 1)` is defined from `V n`. A horizon of `N` periods is `V N`; the horizon `0` is allowed.
- **Ordering rules.** An ordering rule is `π : ℕ → ℝ → ℝ`; with `n + 1` periods to go and stock
  `x` before ordering it raises the stock to `π n x`. It is admissible if `x ≤ π n x` always
  (stock cannot be returned). Rules depend on the stock and the number of periods to go only.
- **Minimizers.** `IsMinOn f s y` is Mathlib's: `y ∈ s` and `f y ≤ f z` for every `z ∈ s`. A
  function `f : ℝ → ℝ` is coercive if it tends to `+∞` at both ends, written as the two
  statements `Tendsto f atBot atTop` and `Tendsto f atTop atTop`.
- **Deterministic plans.** In Layer 5, periods are `Fin n`, demands `d : Fin n → ℝ` and a plan
  `x : Fin n → ℝ` gives the production of each period; the stock starts at `0`.

## Layer 1: the economic order quantity and the newsvendor

### 1.1 The economic order quantity

Define `eoqCost K h rate ρ T = h · rate · (1 − ρ) · T / 2 + K / T`: the average cost per unit time
of producing a good demanded at constant rate `rate` in cycles of length `T`, with setup cost `K`
per cycle and holding cost `h` per unit and unit time, when production runs at rate `rate / ρ`
from zero stock until the cycle's demand is made and the stock then runs down to zero (`ρ = 0` is
instantaneous delivery). The holding term is `h` times the average stock `rate (1 − ρ) T / 2` of
the triangular stock path (Gallego, Lecture 2, §1, eq. (1), p. 2).

Prove `isMinOn_eoqCost_iff`: for `K > 0`, `h > 0`, `rate > 0` and `ρ < 1`, a cycle length
`T > 0` minimizes `eoqCost K h rate ρ` over `T > 0` if and only if
`T = √(2K / (h · rate · (1 − ρ)))`, and the least value is `√(2K h · rate · (1 − ρ))`
(Gallego, Lecture 2, §1, eqs. (2)–(4), p. 2, for `0 ≤ ρ < 1`, and §1.1, p. 3, for `ρ = 0`; the
source restricts to `ρ ≥ 0`, which the statement does not need).

Route: with `α = h · rate · (1 − ρ) / 2 > 0`,
`α T + K / T − 2 √(α K) = (√(α T) − √(K / T))²`, which is zero exactly when `α T² = K`.

The reduction of the long-run problem to equal cycles that start and end with zero stock, which
the source calls intuitive, is not a target: the theorem is about the cost of a cycle.

**Checks.**
- `K = 100`, `h = 5`, `rate = 200`, `ρ = 0.2`: `T* = 0.5`, order quantity `rate · T* = 100`, least
  cost `400`; with `rate = 500`, `ρ = 0.5`: `T* = 0.4`, quantity `200`, least cost `500` (both as
  in the source's examples).
- For `K = 100`, `h = 5`, `rate = 200`, `ρ = 0.2`, `T = 0.5`, the average over `[0, T]` of the
  stock path rising at rate `800` until `0.1` and falling at rate `200` until `0.5` is `40`, which
  is `rate (1 − ρ) T / 2`.
- `K = 0` is excluded: the cost `α T` has infimum `0` over `T > 0`, not attained. `ρ = 1` is
  excluded: the cost `K / T` has infimum `0`, not attained.

*Needs:* Mathlib `Real.sq_sqrt`, `Real.sqrt_le_sqrt`.

### 1.2 The newsvendor (not a target)

The newsvendor cost of the stock level `y` against demand law `μ`, with cost `b` per unit of unmet
demand and `h` per unit left over, is `G y = ∫ w, (b · max (w − y) 0 + h · max (y − w) 0) ∂μ`
(Gallego, Lecture 7, §1, p. 1, with `b = p − c` and `h = c − s` for price `p`, unit cost `c` and
salvage value `s`). Its minimizers are given by RiskMeasures 4.1, `isLeast_averageValueAtRisk`,
and are not a target here. Let `μ` be a probability measure on `ℝ` with integrable identity and
mean `m`, let `b > 0`, `h > 0`, `t = h / (b + h)` and `β = b / (b + h) = 1 − t`, so that
`0 < t < 1`, and let `ν = μ.map (fun x => 0 + (−1) * x)` be the law of `−D` for a demand `D` of
law `μ`. Since `max (y − w) 0 = max (w − y) 0 + (y − w)` and
`∫ max (−x − y) 0 dν(x) = ∫ max (w − y) 0 dμ(w)`,

    G y = h · (y + t⁻¹ ∫ max (−x − y) 0 dν(x)) − h m,

so `G` has the minimizers of the Rockafellar–Uryasev objective of `ν` at the level `t`. The
negative part of the identity under `ν` is the positive part under `μ`, hence integrable, so
RiskMeasures 4.1 applies to `ν` and `t` and gives the interval from `−ν.upperQuantile t` to
`−ν.quantile t`. Tau Ceti's `TauCeti.Probability.upperQuantile_map_affine_neg` and
`TauCeti.Probability.quantile_map_affine_neg` (intercept `0`, slope `−1`, level `t`) give
`−ν.upperQuantile t = μ.quantile β` and `−ν.quantile t = μ.upperQuantile β`. Hence for `b, h > 0`
and integrable `μ`, `y` minimizes `G` over `ℝ` if and only if
`μ.quantile β ≤ y ≤ μ.upperQuantile β`. The source proves that for integer-valued demand the
least integer with `F(y) ≥ β` is optimal, and for continuous `F` that the optimal levels solve
`F(y) = β`, where `F = cdf μ` (Gallego, Lecture 7, §1, eqs. (2)–(5), pp. 1–2).

**Checks.**
- `D = ±1` with probability `1/2` each, `b = h = 1`: `β = 1/2`, the cost is `1` on `[−1, 1]` and
  larger outside, and the interval of minimizers is `[−1, 1]`, from the lower quantile `−1` to the
  upper quantile `1` (the example of RiskMeasures 4.1, with `ν = μ`).
- `D` uniform on `{0, 1, 2, 3}`: for `b = 3`, `h = 1`, `β = 3/4 = F 2`, and the minimizers are
  `[2, 3]` with least cost `3/2`; for `b = 2`, `h = 1`, `β = 2/3` is not a value of `F`, and the
  only minimizer is `2`, with cost `5/4`.
- Exact rational computation on every law supported by a nonempty subset of
  `{−3, −1, 0, 2, 5}`, `{0, 1, 2, 3}`, `{1/2, 4}` or `{−2, 7}` with weights from `{1, 2, 5}`
  (normalized) and the pairs `(b, h)` in
  `{(1, 1), (3, 1), (2, 1), (1, 3), (1/2, 5/2), (7, 2), (5, 3)}`, with both quantiles taken
  literally as infima: the displayed identity holds at every atom and at three further points,
  and the minimizers of `G`, those of the objective of `ν` at `t`, the interval from
  `−ν.upperQuantile t` to `−ν.quantile t` and the interval from `μ.quantile β` to
  `μ.upperQuantile β` coincide (9156 cases, 781 of them with a nondegenerate interval).

### Examples

The one-period problem of Layer 2 is a newsvendor problem: for `K = 0` and one period to go,
`c y + ∫ r (y − w) ∂μ` is `c ∫ w ∂μ` plus the newsvendor cost of 1.2 with unit costs `p − c` and
`h + c`, so by 1.2 its minimizers are the quantile interval at the level `(p − c) / (p + h)`.
For demand `0, 1, 3` with probabilities `0.5, 0.3, 0.2` and `c = 1`, `p = 3`, `h = 1`, the level
is `1/2 = F 0`, and the base-stock levels are the interval `[0, 1]`.

### Dependencies

Layer 1 uses no other layer. 1.2 states no target; it applies RiskMeasures 4.1 and Tau Ceti's
quantiles of affine images, and no target of this roadmap uses it.

## Layer 2: the periodic-review recursion and base-stock levels

### 2.1 The recursion

Define `shortageHoldingCost p h z = p · max (−z) 0 + h · max z 0` (the function `r` of the
Conventions), and by recursion on the number of periods to go

    inventoryValue μ K c p h 0 x = 0
    inventoryValue μ K c p h (n + 1) x
      = sInf { [x < y] K + c y + ∫ w, (r (y − w) + inventoryValue μ K c p h n (y − w)) ∂μ | y ≥ x }
        − c x

(in Lean the infimum is `sInf` of the image of `Ici x`), and
`orderUpToCost μ K c p h n y = c y + ∫ w, (r (y − w) + inventoryValue μ K c p h n (y − w)) ∂μ`,
so that `V (n + 1) x = inf over y ≥ x of ([x < y] K + G n y) − c x` with `V = inventoryValue` and
`G = orderUpToCost`. With stock `x` and `n + 1` periods to go one orders `y − x ≥ 0`, pays
`K` if the order is positive and `c (y − x)`, demand `w` is subtracted, the period ends with cost
`r (y − w)`, and the next period starts from `y − w` (Russo, Lecture 2A, p. 1 for the model with
terminal cost `0`, and eq. (1), p. 2, for the recursion with `K = 0`; §2, p. 3, for the cost with
`K > 0`).

Regularity. The following facts are the common first step of 2.2 and 3.3, whose statements
include the continuity and coercivity of `G n` and the existence of its global minimizer; they
are not stated separately. For `K ≥ 0`, `0 ≤ c < p`, `h > 0` and integrable `μ`, by induction on
`n`:

- each `V n` is nonnegative and continuous, and `V n x ≤ A + B |x|` for constants `A`, `B`
  depending on `n`; hence `w ↦ r (y − w) + V n (y − w)` is integrable for every `y`;
- each `G n` is continuous (`MeasureTheory.continuous_of_dominated`, with the linear bound) and
  `G n y ≥ c y + max (p (m − y)) (h (y − m))` with `m = ∫ w ∂μ`, so `G n` is coercive (it uses
  `c < p` at `−∞` and `c + h > 0` at `+∞`) and has a global minimizer
  (`Continuous.exists_forall_le`);
- `V (n + 1) x = min (G n x) (K + inf over y ≥ x of G n y) − c x`, where the inner infimum is
  attained and continuous in `x`, so the `sInf` in the definition is attained and is not a junk
  value. Nonnegativity holds because `[x < y] K + G n y − c x` is `[x < y] K + c (y − x)` plus the
  integral of a nonnegative function, and the linear bound follows from the choice `y = x`.

**Checks.**
- `V 0 = 0` and `G 0 y = c y + ∫ r (y − w) ∂μ` (the horizon `0` and the one-period cost).
- The coercivity hypotheses are needed. For `c = p = 2`, `h = 1` and demand `0, 1, 3` with
  probabilities `0.5, 0.3, 0.2`, `G 0` is constant, equal to `1.8`, on `(−∞, 0]`. For `c = 0`,
  `h = 0`, `p = 2` and the same law, `G 0 = 0` on `[3, ∞)`. For `c = −2`, `p = −1`, `h = 3`
  (so `c < p` and `c + h > 0`, but `c < 0`) and `K = 0`, `G 1` takes the values `−23.6`,
  `−13.6`, `−3.6` at `−20`, `−10`, `0` (it tends to `−∞` at `−∞`, with slope `1`): the
  nonnegativity of `V 1` fails and `G 1` has no minimizer.
- The integrability is needed: for the Cauchy law and `c > 0`, the integral in `G 0` is the junk
  value `0`, and `G 0 y = c y` is not coercive.

*Needs:* Mathlib `MeasureTheory.integral_mono`, `MeasureTheory.integral_add`,
`MeasureTheory.continuous_of_dominated`, `Continuous.exists_forall_le`. (Proved here.)

### 2.2 Base-stock levels

Prove `baseStock_inventoryValue`: let `μ` be a probability measure on `ℝ` with integrable
identity, `0 ≤ c < p` and `h > 0`, and take `K = 0`. For every `n`, `inventoryValue μ 0 c p h n`
and `orderUpToCost μ 0 c p h n` are convex on `ℝ`, the latter is coercive and has a global
minimizer, and for every global minimizer `S` of `G n` and every `x`,
`V (n + 1) x = G n (max S x) − c x`: raising the stock to the base-stock level `S` when it is
below `S`, and not ordering otherwise, attains the value (Russo, Lecture 2A, Proposition 1, p. 2,
and Lemma 1, p. 3, for demand `w ≥ 0` and without integrability conditions; the statement here
allows any integrable demand law and every global minimizer).

Route: by induction on `n`. If `V n` is convex, so is `G n`: `c y` is linear, and the integral of
the convex functions `y ↦ r (y − w) + V n (y − w)`, integrable by 2.1, is convex by
`MeasureTheory.integral_mono` applied to the convexity inequality at each `w`. By 2.1, `G n` has a
global minimizer `S`. For `x ≤ S` the infimum of `G n` over `y ≥ x` is `G n S`, and for `x > S`
it is `G n x`, since a convex function is nondecreasing to the right of a minimizer. The function
`m x = G n (max S x)` is convex by partial minimization: for `x₁, x₂`, weights `a + b = 1` and
`yᵢ = max S xᵢ ≥ xᵢ`, the point `a y₁ + b y₂` lies above `a x₁ + b x₂`, so
`m (a x₁ + b x₂) ≤ G n (a y₁ + b y₂) ≤ a m x₁ + b m x₂`. This fills two steps the source leaves
open: the integrability of each stage (2.1) and the convexity of the partial minimum (its
footnote refers to the rules of its §1.1, which do not include partial minimization). Then
`V (n + 1) = m − c x` is convex.

**Checks.**
- In the exact whole-line computation of the Checks of 3.3, for the settings with `K = 0`
  (`(c, p, h) = (1, 3, 1)` and `(0, 2, 1)`, seven demand laws, four periods): every `V n` is
  convex, and `V (n + 1) x = G n (max S x) − c x` at every point for every global minimizer `S`.
- Demand `0, 1, 3` with `c = 1`, `p = 3`, `h = 1`: the minimizers of `G 0` are `[0, 1]` (the
  quantile interval of Layer 1, Examples), and those of `G 1` and `G 2` are `{1}`; with
  `max S x` both `S = 0` and `S = 1` give the value of `V 1`.

*Needs:* 2.1; Mathlib `ConvexOn`, `ConvexOn.add`, `MeasureTheory.integral_mono`,
`Continuous.exists_forall_le`.

### Examples

For demand `0, 1, 3` with probabilities `0.5, 0.3, 0.2`, `c = 0`, `p = 2` and `h = 1`, the
base-stock level is `1` with one, two and three periods to go, and the least value of `G n` is
`1.3`, `2.6`, `3.9`.

### Dependencies

Layer 2 uses no other layer; its Examples and one Check refer to the newsvendor of 1.2.

## Layer 3: K-convexity and (s, S) levels

### 3.1 K-convex functions

Define `KConvex K g` for `g : ℝ → ℝ`: for all `x ≤ y` and weights `a, b ≥ 0` with `a + b = 1`,
`g (a x + b y) ≤ a g x + b (g y + K)`; on every interval the function lies below the chord from
`(x, g x)` to `(y, g y + K)`. This is the definition of Feinberg–Lewis (Definition 6.6, p. 22,
stated there for `K ≥ 0` and weights in `(0, 1)`; the end weights add only the condition
`K ≥ 0`). The form that Russo records as Scarf's `K`-convexity (Lecture 2A, §2, p. 4) is
`K + g (y + z) ≥ g y + z (g y − g (y − b)) / b` for `z ≥ 0` and `b > 0`; it is the chord
inequality at the points `y − b < y ≤ y + z` multiplied by `(b + z) / b`, so the two forms agree.

- For `K ≥ 0`, `K`-convexity implies `L`-convexity for every `L ≥ K`, and every convex function is
  `K`-convex; `KConvex 0 g` is exactly `ConvexOn ℝ univ g` (immediate from the definition).
- If `g₁` is `K`-convex, `g₂` is `L`-convex and `α, β ≥ 0`, then `α g₁ + β g₂` is
  `(α K + β L)`-convex (add the two inequalities); in particular adding an affine function
  preserves `K`-convexity.
- If `g` is `K`-convex, `μ` is a probability measure and `w ↦ g (x − w)` is integrable for every
  `x`, then `x ↦ ∫ g (x − w) ∂μ` is `K`-convex (Feinberg–Lewis, Lemma 6.7(1), p. 22; integrate
  the inequality at each `w`).
- No function is `K`-convex for `K < 0` (take `a = 0`).

**Checks.**
- For `K = 5`, `c = 0`, `p = 3`, `h = 1` and the constant demand `2`, `V 1` (Layer 2) is `5` on
  `(−∞, 1/3)`, `3 (2 − x)` on `[1/3, 2]` and `x − 2` on `[2, ∞)`. It is `5`-convex but not convex:
  `V 1 0 = 5` exceeds the average `4` of `V 1 (−1) = 5` and `V 1 1 = 3`.
- The side on which `K` is added matters. For `K > 0` the downward step `K · [x < 0]` is
  `K`-convex (a nonincreasing function whose total drop is at most `K` lies below every such
  chord), while the upward step `K · [x > 0]` is not: at `x = 0`, `y = 1`, `a = 3/4` its value
  `K` at `1/4` exceeds `(1/4)(K + K) = K/2`. The variant with `K` added at the left end,
  `a (g x + K) + b g y`, accepts the upward step and rejects the downward one.
- `−|x|` is `K`-convex for no `K`: at `−M, 0, M` with equal weights the condition reads
  `0 ≤ −M + K/2`, false for `M > K/2`.

*Needs:* Mathlib `ConvexOn`, `MeasureTheory.integral_mono`. (Proved here.)

### 3.2 Scarf's structural lemma

Define `reorderPoint K g S = sInf {x | x ≤ S ∧ g x ≤ K + g S}`. Prove `kConvex_reorderPoint`:
let `g : ℝ → ℝ` be `K`-convex, lower semicontinuous and coercive. Then `g` has a global minimizer,
and for every global minimizer `S`, with `s = reorderPoint K g S`:

- `s ≤ S` and `g s ≤ K + g S`;
- `K + g S < g x` for every `x < s`;
- `g` is strictly decreasing on `(−∞, s]`;
- `g x ≤ K + g z` whenever `s ≤ x ≤ z`.

Feinberg–Lewis state the last three items as Lemma 6.7(2), p. 22, for lower semicontinuous `g`
tending to `+∞` at both ends (the third as "`g` is decreasing on `(−∞, s]` and, therefore,
`g s < g x` for all `x < s`"). For the proof they refer to two textbook proofs for continuous `g`,
saying that these cover the general case with minor adjustments (p. 23). Scarf developed
`K`-convexity to prove the optimality of `(s, S)` rules (Russo, Lecture 2A, §2, p. 4). The proof
below is complete and is proved here.

Route. Existence of `S`: by coercivity the sublevel set `{g ≤ g 0}` is bounded, it is closed by
lower semicontinuity (`LowerSemicontinuous.isClosed_preimage`), so compact, and `g` attains its
minimum on it (`LowerSemicontinuousOn.exists_isMinOn`), which is a global minimum. Let `S` be any
global minimizer. The set `A = {x ≤ S | g x ≤ K + g S}` contains `S` (since `K ≥ 0`: a
`K`-convex function exists only for `K ≥ 0`, by 3.1), is closed by lower semicontinuity, and is
bounded below because `g x → ∞` as `x → −∞`. So `s = min A`, which gives `s ≤ S` and
`g s ≤ K + g S`, and every `x < s` lies outside `A` while `x < S`, so `g x > K + g S`.

- For `x < y ≤ s`, write `y = a x + b S` with `b = (y − x) / (S − x) > 0` (here `x < s ≤ S`).
  The `K`-convexity inequality gives `g y ≤ a g x + b (g S + K) < a g x + b g x = g x`, using
  `g S + K < g x`.
- For `S ≤ x ≤ z`: write `x = a S + b z`; then `g x ≤ a g S + b (g z + K) ≤ g z + K`, using
  `g S ≤ g z`.
- For `s ≤ x ≤ S`: write `x = a s + b S`; then `g x ≤ a g s + b (g S + K) ≤ K + g S`, using
  `g s ≤ K + g S`, and `K + g S ≤ K + g z` for every `z`. With the previous case this gives
  `g x ≤ K + g z` whenever `s ≤ x ≤ z`.

**Checks.**
- `g = r (· − 2)` with `p = 3`, `h = 1`, `K = 5` (the one-period cost for the constant demand
  `2`): `S = 2`, `s = 1/3`, and `g s = 5 = K + g S`. For `K > 0` and continuous `g` always
  `s < S`.
- For `K = 0` and convex `g`, `s` is the least global minimizer: for `g x = max (|x| − 1) 0` and
  `S = 1`, `s = −1`.
- Lower semicontinuity is needed: for `K > 0`, `x² + K · [x ≤ 0]` is `K`-convex (by 3.1, a
  convex function plus a downward step of size `K`) and coercive, but its infimum `0` is not
  attained.
- Coercivity is needed: `exp` is convex, so `K`-convex, and continuous, and has no minimizer.

*Needs:* 3.1; Mathlib `LowerSemicontinuous.isClosed_preimage`,
`LowerSemicontinuousOn.exists_isMinOn`.

### 3.3 Scarf's theorem

Prove `scarf_inventoryValue`: let `μ` be a probability measure on `ℝ` with integrable identity,
`K ≥ 0`, `0 ≤ c < p` and `h > 0`. For every `n`, `G n = orderUpToCost μ K c p h n` is `K`-convex,
continuous and coercive and has a global minimizer, and for every global minimizer `S` of `G n`,
with `s = reorderPoint K (G n) S`, and every `x`,

    inventoryValue μ K c p h (n + 1) x = (if x < s then K + G n S else G n x) − c x.

So the `(s, S)` rule, which raises a stock below `s` to `S` and does not order from `s` on,
attains the value with `n + 1` periods to go. Scarf (1960) proved the optimality of `(s, S)`
rules for finite-horizon problems with continuous demand (Feinberg–Lewis, §1, p. 2). Russo states
the `(s, S)` form and that Scarf completed its proof by showing each `G n` to be `K`-convex
(Lecture 2A, §2, p. 4). Feinberg–Lewis prove a finite-horizon `(s, S)` theorem for discounted
costs, with discount factors in an interval `[α*, 1)` and, as terminal value, the
infinite-horizon discounted value of the problem without fixed cost (Theorem 6.10(i), p. 24).
Their proof rests on Lemma 6.7 and on Lemma 6.8(iv), whose `K`-convexity step cites a lemma of
Heyman and Sobel without proof (p. 24); that is not the undiscounted problem with terminal value
`0` treated here. The proof below is complete, for any integrable demand law, and is proved here.

Route: by induction on `n`; continuity and coercivity are 2.1, and `K`-convexity is carried
along.

- `G 0 y = c y + ∫ r (y − w) ∂μ` is convex, hence `K`-convex by 3.1.
- Let `G = G n` be `K`-convex, with `S` and `s` as in 3.2, and let
  `H x = inf over y ≥ x of ([x < y] K + G y)`. If `x < s`, then `S > x`, so `H x ≤ K + G S`, and
  every `y ≥ x` gives at least `K + G S`: `y = x` gives `G x > K + G S` by 3.2, and `y > x` gives
  `K + G y ≥ K + G S`. If `x ≥ s`, `y = x` gives `G x`, and `y > x` gives `K + G y ≥ G x` by the
  last statement of 3.2. Hence `H x = K + G S` for `x < s` and `H x = G x` for `x ≥ s`, which is
  the displayed formula, since `V (n + 1) = H − c x`.
- `H` is `K`-convex. Take `x ≤ y ≤ z` with `y = a x + b z`; we show
  `H y ≤ a H x + b (H z + K)`, using `G ≥ G S`, `G u > K + G S` for `u < s`, and
  `G u ≤ K + G v` for `s ≤ u ≤ v` (3.2).
  - If `s ≤ x`, `H = G` at all three points and `G` is `K`-convex.
  - If `y < s`, then `H y = K + G S`, `H x = K + G S` and `H z ≥ G S`, so the right side is at
    least `a (K + G S) + b (G S + K) = K + G S`. (When `z < s`, `H z + K = G S + 2K`, and this is
    where `K ≥ 0` is used.)
  - If `x < s ≤ y ≤ S`: `H y = G y ≤ K + G S` and `G y ≤ K + G z`, so `H y` is at most
    `a (K + G S) + b (K + G z) = a H x + b (H z + K)`.
  - If `x < s` and `S < y ≤ z`: write `y = a' S + b' z`. Since `x < S < y`, `a' ≥ a`. By
    `K`-convexity `G y ≤ a' G S + b' G z + b' K`, and since `G S ≤ G z` and `a' ≥ a`,
    `a' G S + b' G z ≤ a G S + b G z`; with `b' K ≤ K` this gives
    `G y ≤ a (K + G S) + b (G z + K)`.
- `V (n + 1) = H − c x` is `K`-convex (3.1, an affine summand), and
  `G (n + 1) y = c y + ∫ r (y − w) ∂μ + ∫ V (n + 1) (y − w) ∂μ` is the sum of a convex function
  and the expectation of translates of a `K`-convex function, integrable by 2.1, so it is
  `K`-convex by 3.1.

For `K = 0` the theorem gives the `(s, S)` form with `s` the least minimizer of `G n`; 2.2 adds
the convexity of every `V n` and the base-stock form `max S x`.

**Checks.**
- Constant demand `2`, `K = 5`, `c = 0`, `p = 3`, `h = 1`: with one period to go `S = 2`,
  `s = 1/3`, and `V 1` is as in 3.1; with two periods to go `G 1 (y) = r (y − 2) + V 1 (y − 2)`
  has the unique minimizer `S = 4`, `G 1 4 = 2`, and `s = 4/3`.
- `K ≥ 0` is needed: for `K < 0` no function is `K`-convex (3.1), so the first conclusion fails
  for every demand law.
- Exact computation on the whole line, in piecewise-linear arithmetic over the rationals, for
  seven demand laws with atoms (`0, 1, 3` with probabilities `0.5, 0.3, 0.2`; `−1, 0, 2` with
  `0.25, 0.25, 0.5`; `0, 4` with `0.7, 0.3`; the constant `2`; `−3, 1/2, 5` with `1/3` each;
  `0, 10` with `0.9, 0.1`; `−2, −1` with `1/2` each) and nine settings of `(K, c, p, h)`:
  `(0, 1, 3, 1)`, `(0, 0, 2, 1)`, `(2, 1, 4, 1/2)`, `(5, 0, 3, 1)`, `(3, 2, 6, 1)`,
  `(1, 1/2, 1, 2)`, `(10, 0, 1, 1/10)`, `(1/3, 0, 1/2, 3)`, `(7, 3, 4, 1)`, four periods.
  `G n` and `V n` satisfy the `K`-convexity inequality at all triples drawn from their breakpoints
  and from points far out on both rays, every `V n` is nonnegative, the statements of 3.2 hold for
  every global minimizer `S`, and `V (n + 1)` has the displayed form at every point.
- For demand `0` or `4` with probabilities `0.7`, `0.3` and `K = 5`, `c = 0`, `p = 3`, `h = 1`,
  `V 2` is `10.84` on `[−4, −1]` and `8.46`, `8.12`, `7.78` at `0, 1, 2`: not convex.

*Needs:* 2.1, 3.1, 3.2; Mathlib `MeasureTheory.integral_mono`, `MeasureTheory.integral_add`.

### Examples

The deterministic instance of the Checks of 3.3 shows the `(s, S)` rule at work: with two periods
to go and constant demand `2`, a stock below `4/3` is raised to `4`, covering both periods with one
setup, and a stock from `4/3` on is left alone.

### Dependencies

Layer 3 uses Layer 2 (2.1 in 3.3).

## Layer 4: optimality of ordering rules

### 4.1 The verification theorem

Define, for an ordering rule `π`, its cost `orderingRuleCost μ K c p h π n x` in `ℝ≥0∞` by the
recursion

    orderingRuleCost μ K c p h π 0 x = 0
    orderingRuleCost μ K c p h π (n + 1) x
      = ofReal ([x < π n x] K + c (π n x − x))
        + ∫⁻ w, (ofReal (r (π n x − w)) + orderingRuleCost μ K c p h π n (π n x − w)) ∂μ

with lower Lebesgue integrals, which need neither integrability nor measurability of the rule.

Prove `inventoryValue_le_orderingRuleCost`: let `μ` be a probability measure on `ℝ` with
integrable identity, `K ≥ 0`, `0 ≤ c < p` and `h > 0`, and let `π` be an admissible rule
(`x ≤ π n x` for all `n`, `x`). Then `ofReal (V n x) ≤ orderingRuleCost μ K c p h π n x` for all
`n` and `x`; and if at every `n` and `x` the level `π n x` minimizes `y ↦ [x < y] K + G n y` over
`y ≥ x`, then `orderingRuleCost μ K c p h π n x = ofReal (V n x)` for all `n` and `x`. Russo
takes this principle of dynamic programming as given (Lecture 2A, eq. (1), p. 2); it is proved
here.

By 2.2 the rule `π n x = max (S n) x`, for global minimizers `S n` of `G n`, satisfies the
hypothesis when `K = 0`, and by 3.3 the `(s, S)` rule does for every `K ≥ 0`: both are optimal
among admissible rules.

Route: by induction on `n`, for all `x` at once. With `y = π n x`, by 2.1 the integrand
`r (y − w) + V n (y − w)` is nonnegative and integrable, so
`ofReal (∫ (r (y − ·) + V n (y − ·)) dμ)` equals `∫⁻ (ofReal (r (y − ·)) + ofReal (V n (y − ·)))`
(`MeasureTheory.ofReal_integral_eq_lintegral_ofReal`), which by the induction hypothesis and
`MeasureTheory.lintegral_mono` (no measurability needed) is at most the integral in the cost of
`π`. Since `[x < y] K + c (y − x) ≥ 0`, adding it gives
`ofReal ([x < y] K + G n y − c x) ≤ orderingRuleCost μ K c p h π (n + 1) x`, and
`V (n + 1) x ≤ [x < y] K + G n y − c x` because the set of the infimum is bounded below
(by 2.1). For a minimizing rule the first inequality is an equality by the induction hypothesis,
and the second is an equality by 2.1, where the infimum is attained.

**Checks.**
- Constant demand `2`, `K = 5`, `c = 0`, `p = 3`, `h = 1`, one period, stock `0`: the rule that
  never orders costs `r (−2) = 6`, the `(s, S)` rule costs `5 = V 1 0`.
- Admissibility is needed: with stock `10` and the rule `π 0 10 = 2`, the term
  `ofReal (0 + c (2 − 10))` is `0` for `c = 0`, and the cost is `r 0 = 0 < V 1 10 = 8`.
- For the demand laws `0, 1, 3`, `−1, 0, 2`, `0, 4` and `2` of the Checks of 3.3 and
  `(K, c, p, h)` in `{(2, 1, 4, 1/2), (5, 0, 3, 1), (3, 2, 6, 1), (1, 1/2, 1, 2), (0, 1, 3, 1),
  (0, 0, 2, 1)}`, with up to three periods to go, in exact arithmetic: the `(s, S)` rule built
  from the least global minimizer of each `G n` costs exactly `V n x` at every `x` in
  `[−8, 10] ∩ ℤ/4`, and each of the 153 rules "raise the stock to `L` when it is below `l`", for
  `l ≤ L` in `[−2, 6] ∩ ℤ/2`, costs at least `V n x` at every integer `x` in `[−8, 10]`.

*Needs:* 2.1; Mathlib `MeasureTheory.ofReal_integral_eq_lintegral_ofReal`,
`MeasureTheory.lintegral_mono`. Its consequences for the two rules use 2.2 and 3.3.

### Examples

For the constant demand `2` with `K = 5`, `c = 0`, `p = 3`, `h = 1` and two periods to go from
stock `0`, ordering `4` at once costs `5 + 2 = 7`, ordering `2` twice costs `10`, and never
ordering costs `6 + 12 = 18`; `V 2 0 = 7`.

### Dependencies

Layer 4 uses Layer 2 (2.1) for the theorem, and Layers 2 and 3 (2.2 and 3.3) for the rules it is
applied to.

## Layer 5: zero-inventory ordering under concave costs

### 5.1 Zero-inventory ordering

For demands `d : Fin n → ℝ` and a plan `x : Fin n → ℝ`, define `inventoryLevel d x t` as
`∑ j ≤ t, (x j − d j)`, the stock at the end of period `t`, and `openingInventory d x t` as
`∑ j < t, (x j − d j)`, the stock at its start. `IsProductionPlan d x` says that every `x t` and
every end stock is nonnegative and that the stock at the end of the horizon is `0`. For
`g h : Fin n → ℝ → ℝ`, `planCost g h d x = ∑ t, (g t (x t) + h t (inventoryLevel d x t))`.

Prove `exists_isProductionPlan_zeroInventoryOrdering`: if every `d t ≥ 0` and every `g t` and
`h t` is concave on `[0, ∞)`, there is a production plan `x` that minimizes `planCost g h d` over
all production plans and satisfies `openingInventory d x t · x t = 0` for every `t`: it produces
only in periods entered with zero stock (Gallego, Lecture 4, §2.3, Theorem 4, p. 6, and §2.3.1,
p. 6, where the setup cost plus linear cost of Wagner and Whitin (1958) is the case
`g t x = [x > 0] K t + c x` with `K t ≥ 0`, concave on `[0, ∞)` although for `K t > 0` it is
discontinuous at `0`; the source's route through extreme points of the polytope of plans uses the
minimum principle for concave functions on a polytope, which it cites as well known, p. 4; the
route below avoids it).

Route. Call a plan zero-inventory if `openingInventory d x t · x t = 0` for every `t`.

- Exchange step. Let `x` be a plan and `t` a period with `x t > 0` and opening stock
  `I > 0`. Since the stock starts at `0` and demands are nonnegative, some earlier period
  produces; let `i < t` be the last one. No period strictly between `i` and `t` produces, so every
  end stock of the periods `i, …, t − 1` is at least `I > 0`. Moving `ε` units of production from
  `t` to `i` changes only `x i`, `x t` and those end stocks, by `+ε`, `−ε`, `+ε`; it keeps a
  plan for `ε` in the closed interval from `−min (x i, end stocks of i, …, t − 1)` to `x t`. On
  that interval the cost is a sum of concave functions of `ε`, so its value at one of the two
  endpoints is at most its value at `ε = 0` (`ConcaveOn.min_le_of_mem_segment`). At either
  endpoint one of the coordinates `x i`, `x t` or an end stock of `i, …, t − 1` becomes `0`, and
  no coordinate that was `0` changes. The number of nonzero coordinates among the productions and
  the end stocks drops, so finitely many steps give a zero-inventory plan of no larger cost.
- A zero-inventory plan is determined by its set of producing periods: a period `t` that
  produces is entered with zero stock and produces the demand of `t` and of every later period
  up to the next producing period, since that one is also entered with zero stock (or the horizon
  ends with zero stock). So there are at most `2^n` zero-inventory plans, one of least cost
  exists, and by the exchange step it is optimal among all plans. The plan `x = d` shows that
  plans exist.

**Checks.**
- Gallego's data, demands `3, 1, 1, 5`, setup costs `3, 2, 2, 1`, unit holding costs `1, 1, 4, 1`
  and no unit production cost: the least cost is `7`, attained by the zero-inventory plans
  `(3, 2, 0, 5)`, `(4, 0, 1, 5)` and `(5, 0, 0, 5)` (Gallego, Lecture 4, §2.3.1, p. 7).
- Concavity of the holding costs is needed: demands `0, 2`, `g₁ = 0`, `g₂ x = 2x`,
  `h₁ I = I²`, `h₂ = 0`: the plan `(1, 1)` costs `3` and every zero-inventory plan costs `4`.
- Concavity of the production costs is needed: demands `0, 2`, `g t x = x²`, `h = 0`: `(1, 1)`
  costs `2`, every zero-inventory plan `4`.
- Nonnegative demands are needed: demands `−1, 2`, `g₁ x = [x > 0] (10 + x)`, `g₂ x = x`,
  `h = 0`: the plans are `(a, 1 − a)` with `0 ≤ a ≤ 1`; the only zero-inventory plan is `(1, 0)`,
  of cost `11`, while `(0, 1)` costs `1`.
- `n = 0`: the empty plan is the only plan and is zero-inventory.
- For every horizon `n ≤ 3`, every demand vector in `{0, 1, 2, 3}ⁿ`, production costs
  `g t x = [x > 0] K t + c x` with each `K t` in `{0, 3}` and `c` in `{−1, 0, 1}`, and holding
  costs `h t I = I` or `h t I = √(2 I)` in every period (3504 instances), the least cost over all
  integer plans equals the least cost over the zero-inventory plans.

*Needs:* Mathlib `ConcaveOn`, `ConcaveOn.min_le_of_mem_segment`, `Finset.Iic`, `Finset.Iio`.

### Examples

For demands `0, 2, 0, 3`, `g t x = [x > 0] · 4 + x` and `h t I = I`: producing `5` in period `2`
costs `4 + 5` for production and `3 + 3` for holding, `15` in all; producing `2` in period `2`
and `3` in period `4` costs `4 + 2 + 4 + 3 = 13` with no holding cost, and is optimal.

### Dependencies

Layer 5 uses no other layer.

## Scope and ownership

This roadmap owns the targets stated above: the average cost of a production cycle and the
economic order quantity; the periodic-review recursion with backlogging, fixed and linear ordering
costs and independent demands with a common integrable law, its order-up-to costs, the
base-stock theorem, `K`-convex functions with their closure properties, Scarf's structural lemma
and Scarf's theorem; the cost of an ordering rule and the verification theorem; production plans
for deterministic demand and the zero-inventory ordering theorem for concave costs.

Already in the libraries and therefore not targets: Tau Ceti's lower and upper quantiles of a
real law, with their Galois characterizations through the distribution function and its left
limit (`TauCeti/Probability/Quantile.lean`), and their images under affine maps
(`TauCeti/Probability/Distributions/Affine.lean`); Mathlib's convex and concave functions, the
minimum principle for concave functions on a segment, the extreme value theorem
for continuous functions tending to `+∞` and for lower semicontinuous functions on compact sets,
Bochner and lower Lebesgue integrals with dominated continuity of parametric integrals.

Related roadmaps:

- MarkovDecisionProcesses (Layer 2, 2.1, backward induction) proves the finite-horizon dynamic
  programming principle for countably many states, finitely many actions and bounded rewards,
  and has a two-period inventory problem with three stock levels as an example. The recursion
  here has a real state, a continuum of order-up-to levels and unbounded costs, which that
  roadmap's scope excludes; 4.1 is proved directly for it. This roadmap does not depend on that
  one.
- RiskMeasures (Layer 4, 4.1, the Rockafellar–Uryasev formula) owns the set of minimizers of
  `z ↦ z + t⁻¹ E(−X − z)⁺`, the interval from `−q⁺(t)` to `−q⁻(t)` for the law of `X`. The
  newsvendor rule is that theorem for `X = −D` and `t = h / (b + h)` after scaling by `h` (1.2),
  and it is not restated as a target. No target here uses it, and this roadmap does not depend on
  that one.
- StandardDistributions (Layer 7, 7.2, lower and upper quantiles) plans the lower and upper
  quantiles that the pinned Tau Ceti provides; this roadmap uses the Tau Ceti declarations.

Not treated here: the backorder variant of the economic order quantity and the reduction of the
long-run average-cost problem to equal zero-inventory cycles; lost sales; capacity limits on
orders and the capacitated lot-sizing problem; multi-item and joint-replenishment problems and
`K`-convexity on `ℝⁿ`; infinite-horizon discounted and average-cost problems and the convergence
of `(s, S)` levels; history-dependent ordering rules and the identification of the recursive cost
of a rule with an expectation along the demand path; convex production costs and production
smoothing; computation of optimal levels.

## Exact supplier contracts

### From Mathlib

- `Mathlib/Analysis/Convex/Function.lean`: `ConvexOn 𝕜 s f`, `ConcaveOn 𝕜 s f` (the inequality
  for convex combinations of points of the convex set `s`); `ConvexOn.add` (the sum of two convex
  functions is convex).
- `Mathlib/Analysis/Convex/Jensen.lean`: `ConcaveOn.min_le_of_mem_segment` (a function concave on
  a set containing `x` and `y` takes at each point of the segment `[x, y]` a value at least the
  smaller of its values at `x` and `y`).
- `Mathlib/Topology/Order/Compact.lean`: `Continuous.exists_forall_le` (a continuous function
  tending to `+∞` along the cocompact filter has a global minimum).
- `Mathlib/Topology/Semicontinuity/Basic.lean`: `LowerSemicontinuous.isClosed_preimage` (the
  sublevel sets `f ⁻¹' Iic y` of a lower semicontinuous function are closed);
  `LowerSemicontinuousOn.exists_isMinOn` (a lower semicontinuous function attains its minimum on
  a nonempty compact set).
- `Mathlib/MeasureTheory/Integral/Bochner/Basic.lean`: `MeasureTheory.integral_mono`
  (monotonicity for integrable functions), `MeasureTheory.integral_add`,
  `MeasureTheory.continuous_of_dominated` (continuity of a parametric integral under an
  integrable bound, almost everywhere strong measurability and almost everywhere continuity),
  `MeasureTheory.ofReal_integral_eq_lintegral_ofReal` (for an integrable function that is almost
  everywhere nonnegative, `ofReal` of its integral is the lower integral of its `ofReal`).
- `Mathlib/MeasureTheory/Integral/Lebesgue/Basic.lean`: `MeasureTheory.lintegral_mono`
  (monotonicity of the lower integral, with no measurability assumed).
- `Mathlib/Probability/CDF.lean`: `ProbabilityTheory.cdf` (the distribution function, a
  right-continuous monotone function equal to `μ.real (Iic x)` for a probability measure).
- `Mathlib/Analysis/Real/Sqrt.lean`: `Real.sq_sqrt` (`√x ^ 2 = x` for `x ≥ 0`),
  `Real.sqrt_le_sqrt` (monotonicity of the square root).
- `Finset.Iic`, `Finset.Iio` (the finite intervals of a locally finite order, here `Fin n`).

### From Tau Ceti

- `TauCeti/Probability/Quantile.lean`: `MeasureTheory.Measure.quantile`
  (`μ.quantile t = sInf {x | t ≤ cdf μ x}`), `MeasureTheory.Measure.upperQuantile`
  (`sInf {x | t < cdf μ x}`).
- `TauCeti/Probability/Distributions/Affine.lean`: `TauCeti.Probability.quantile_map_affine_neg`
  and `TauCeti.Probability.upperQuantile_map_affine_neg` (for a probability measure, `b < 0` and
  `0 < u < 1`, the lower and upper quantiles of `μ.map (fun x => a + b * x)` at `u` are
  `a + b * μ.upperQuantile (1 − u)` and `a + b * μ.quantile (1 − u)`).

## References

- G. Gallego, IEOR 4000 *Production Management* lecture notes, Columbia University, on the
  author's page (`www.columbia.edu/~gmg2/4000/pdf/`). Lecture 2, *The EOQ and Extensions*
  (9 September 2004): §1, eqs. (1)–(4), pp. 1–2, and §1.1, p. 3. Lecture 4, *Production Planning
  with Time-Varying Demand* (undated): §2.1, p. 4; §2.3, Theorems 1 and 4, pp. 5–6; §2.3.1 and
  Table 2, pp. 6–7. Lecture 7, *The Newsvendor Problem* (6 April 1995): §1, eqs. (1)–(5),
  pp. 1–2.
- D. Russo, *Course Notes on Dynamic Optimization*, Lecture 2A, *Inventory Control* (Fall 2023),
  on the author's page (`djrusso.github.io/Dynamic-Optimization-Course/Notes/`): the model and
  Assumption 1, p. 1; Proposition 1 and eq. (1), p. 2; Lemma 1, §1.1 and the footnote, p. 3;
  §2, pp. 3–4.
- E. A. Feinberg and M. E. Lewis, *On the convergence of optimal actions for Markov decision
  processes and the optimality of (s, S) inventory policies*, version of 20 March 2017, on the
  second author's page (`people.orie.cornell.edu/melewis/pubs/inventory.pdf`): §1, p. 2;
  Definition 6.6 and Lemma 6.7, p. 22, with its proof, p. 23; proof of Lemma 6.8(iv), p. 24;
  Theorem 6.10, p. 24.

