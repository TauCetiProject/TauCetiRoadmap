# Roadmap: online convex optimization

**Summary.** This roadmap develops the regret bounds of online convex optimization. A learner
picks points `x 0, x 1, …` of a convex set `K`; after it picks `x t`, a convex loss `f t` is
revealed, and the learner is compared with a fixed `u ∈ K` through the regret
`∑_{t < T} (f t (x t) − f t u)`. The iterates of each method are sequences defined by a
recursion or by a minimization property from subgradients `g t` of the losses at the iterates;
every target is an inequality about these sequences, and no procedure or running time is
specified. The bounds hold against adaptive adversaries.

The headline theorems are these.

- *Online gradient descent.* Let `K` be a nonempty complete convex subset of a real inner
  product space and let each step project `x t − η g t` back onto `K`. If `D, G > 0`, `T ≥ 1`,
  `‖g t‖ ≤ G` and `‖u − x 0‖ ≤ D`, the step `η = D / (G √T)` gives regret at most `D G √T`
  after `T` rounds. If every loss is `α`-strongly convex and `‖g t‖ ≤ G`, the steps
  `1 / (α (t + 1))` give regret at most `G² (1 + log T) / (2α)`.
- *Mirror descent and follow the regularized leader.* Let `ψ` be `μ`-strongly convex on a convex
  subset `K` of a real normed space, `μ > 0`, let `η > 0`, and let the norms of the linear
  functionals `g t` be dual norms. Mirror descent, whose next iterate minimizes
  `η g t y + B_ψ (y, x t)` over `K`, with `B_ψ (y, x) = ψ y − ψ x − ψ'(x) (y − x)` the Bregman
  divergence, has regret at most `B_ψ (u, x 0) / η + (η / (2μ)) ∑ ‖g t‖²` when `ψ` is
  differentiable at its iterates. Follow the regularized leader, whose iterate minimizes
  `ψ y + η ∑_{s < t} g s y` over `K`, has regret at most
  `(ψ u − ψ (x 0)) / η + (η / (2μ)) ∑ ‖g t‖²`. With the negative entropy on the probability
  simplex its iterates are exactly the strategies of the Hedge method.
- *Online-to-batch conversion.* If the losses are `f (·, ξ t)` with `f` bounded, jointly
  measurable and convex in the point, and the random `ξ t` have a common law, each independent
  of what the iterate `x t` depends on, then for `T ≥ 1` the expected risk of the average of the
  iterates exceeds the risk of `u` by at most the expected regret divided by `T`.
- *The lower bound.* For any two points `v`, `w` of a real inner product space, any `L ≥ 0` and
  any deterministic strategy, some sequence of linear losses with gradients of norm at most `L`
  forces regret at least `L ‖v − w‖ √(T / 8)` against `v` or against `w`.

The roadmap builds on Mathlib's nearest points in convex sets, strong convexity, derivatives and
independence, and on Tau Ceti's first-order inequality for strongly convex functions and its
Fenchel–Young inequality for the relative-entropy integrand. RegretMinimizationAndEquilibria
supplies the simplex and the Hedge method with its regret bound, the entropic case here;
MathematicalStatisticsNonparametric supplies the metric projection.

## How to read the build

Layer 1 below defines regret and proves the projection inequality. Layer 2, online gradient
descent with constant, non-increasing and strongly convex step schedules, depends on Layer 1.
Layer 3 proves the regret bound of follow the regularized leader in a normed space and
identifies its entropic case with Hedge; Layer 4 defines Bregman divergences and proves the
regret bound of mirror descent. Layers 3 and 4 use only 1.1 (regret and its linearization)
and are independent of Layer 2 and of each other. Layer 5, the online-to-batch conversion, and
Layer 6, the lower bound, use only the definition of regret. Within a layer the sections are in
build order.

## Conventions

- **Rounds.** Rounds are indexed by `t : ℕ` from `0`; round `t` plays `x t` and incurs
  `f t (x t)`. Sums over the first `T` rounds run over `Finset.range T`; for `T = 0` they are
  empty.
- **Regret.** For losses `f : ℕ → α → ℝ`, plays `x : ℕ → α` and a comparator `u : α`,
  `regret f x T u = ∑_{t < T} (f t (x t) − f t u)`. It is defined for every type `α`; the
  comparator is any point, and the theorems assume `u ∈ K`.
- **Spaces.** Layers 1, 2 and 6 work in a real inner product space `E`
  (`[NormedAddCommGroup E] [InnerProductSpace ℝ E]`) with inner product `⟪x, y⟫`. Completeness
  is asked only of `K` (`IsComplete K`); a closed subset of a complete space, in particular of a
  finite-dimensional one, is complete (`IsClosed.isComplete`). Layers 3 and 4 work in a real
  normed space `F`; the linear losses are continuous linear functionals
  `g t : StrongDual ℝ F`, and `‖g t‖` is the operator norm, which is the dual norm
  `sup_{‖x‖ ≤ 1} g t x`. Layer 5 works in a finite-dimensional real normed space with its Borel
  σ-algebra.
- **Subgradients.** "`g t` is a subgradient of `f t` at `x t` relative to `K`" means
  `f t (x t) + ⟪g t, y − x t⟫ ≤ f t y` for every `y ∈ K` (in a normed space,
  `f t (x t) + g t (y − x t) ≤ f t y`). When `x t ∈ K`, this is membership of `g t` in Tau
  Ceti's `TauCeti.subdifferential (innerₗ E)` at `x t` of `f t` extended by `⊤` outside `K`
  (`TauCeti.mem_subdifferential_ite_iff`), and a function convex on `K` with derivative `f'`
  within `K` at `x t` has `f'` as such a subgradient. With modulus `m`, the inequality
  `f t (x t) + ⟪g t, y − x t⟫ + (m / 2) ‖y − x t‖² ≤ f t y` holds, for `x t ∈ K`, for the
  derivative of an `m`-strongly convex function on `K` (Tau Ceti
  `StrongConvexOn.add_add_le_of_hasFDerivWithinAt`). At a start `x 0` outside `K`, which Layer 2
  allows, the inequality is a hypothesis on `g 0` and does not follow from a derivative within
  `K`: if `x 0` is not in the closure of `K`, every linear map is a derivative within `K` there.
- **Adversaries.** The vectors `g : ℕ → E` are a fixed sequence and the iterates are computed
  from them; the `t`-th iterate depends only on `g s` for `s < t`. A loss sequence chosen
  adaptively, with `f t` depending on `x 0, …, x t`, gives such a `g` by choosing `g t` after
  `x t`, so the bounds cover adaptive adversaries.
- **Strong convexity.** `StrongConvexOn K m ψ` is Mathlib's: `K` is convex and
  `ψ (a x + b y) ≤ a ψ x + b ψ y − a b (m / 2) ‖x − y‖²` for `x, y ∈ K`, `a, b ≥ 0`,
  `a + b = 1`, with the norm of the ambient space.
- **Junk values.** `metricProj s x` is `0` when no point of `s` is nearest to `x`; `fderiv ℝ ψ v`
  is `0` where `ψ` is not differentiable; `x / 0 = 0`; `Real.log 0 = 0`; and `T − 1 = 0` for
  `T = 0` in `ℕ`. Each statement carries the hypotheses that keep it away from these values or
  is true at them, as its Checks say.
- **Minimizers** are stated with `IsMinOn`; no infimum over a set of reals is taken.

## Layer 1: regret and the metric projection

### 1.1 Regret

Define `regret` as in the Conventions. The layers below use two facts about it:

- `regret f x 0 u = 0`, and `regret f x (T + 1) u = regret f x T u + (f T (x T) − f T u)`.
- *Linearization.* If `u ∈ K` and, for each `t < T`, `g t` is a subgradient of `f t` at `x t`
  relative to `K` with modulus `m t ≥ 0`, then
  `regret f x T u ≤ ∑_{t < T} (⟪g t, x t − u⟫ − (m t / 2) ‖x t − u‖²)`. In particular the
  regret on convex losses is at most the regret on the linear losses `⟪g t, ·⟫`.

(Orabona, Chapter 1, p. 2, and Hazan, equation (1.1), p. 3, for the definition; Orabona,
Lemma 2.31, p. 19, and Lemma 4.2, p. 34, for the linearization; proved here.)

**Checks.**

- On `ℝ` with `f t y = |y − 1|`, `x t = 0` and `u = 1`, `regret f x 3 1 = 3`. The reversed
  difference `f t u − f t (x t)` would give `−3`.
- The regret against a fixed `u` may be negative: with `f t y = y`, `x t = 0` and `u = 1` it is
  `−T`.
- Linearization on `ℝ` with `f t y = y²`, `x t = 1`, `g t = 2` (the derivative), `m t = 2` and
  `u = 0`: the regret per round is `1` and the bound per round is `2 · 1 − 1 = 1`, an equality.

*Needs:* Mathlib `Finset.sum_range_succ`. (Proved here.)

### 1.2 The projection inequality

`metricProj` is the metric projection of MathematicalStatisticsNonparametric 6.5:
`metricProj s x` is a point `y ∈ s` with `‖x − y‖ = Metric.infDist x s` when such a point exists,
chosen by `Exists.choose`, and `0` otherwise. Prove `metricProj_mem_and_sq_norm_sub_add_le`: for
a nonempty, complete, convex `K` in a real inner product space and every `y`, `metricProj K y`
lies in `K`, and for every `u ∈ K`

    ‖metricProj K y − u‖² + ‖y − metricProj K y‖² ≤ ‖y − u‖².

Route: Mathlib's `exists_norm_eq_iInf_of_complete_convex` gives `p ∈ K` with
`‖y − p‖ = ⨅ w : K, ‖y − w‖`, which is `Metric.infDist y K` by `Metric.infDist_eq_iInf` and
`dist_eq_norm`; so the first branch of the definition is taken and `metricProj K y` is such a
point. `norm_eq_iInf_iff_real_inner_le_zero` gives `⟪y − p, u − p⟫ ≤ 0` for `u ∈ K`, and
expanding `‖y − u‖² = ‖y − p‖² + ‖p − u‖² + 2 ⟪y − p, p − u⟫` gives the inequality. (Bubeck,
Lemma 3.1, p. 263; Hazan, Theorem 2.1, p. 20, and Orabona, Proposition 2.11, p. 12, for the
consequence `‖metricProj K y − u‖ ≤ ‖y − u‖`; proved here.)

**Checks.**

- `K = [−1, 1] ⊆ ℝ`, `y = 3`: the projection is `1`; for `u = −1` the inequality reads
  `4 + 4 ≤ 16`, and for `u = 1` it reads `0 + 4 ≤ 4`, an equality.
- For a closed subspace `K` of a Hilbert space the projection is the orthogonal projection and
  the inequality is Pythagoras' equality: in `ℝ²` with `K` the first axis and `y = (1, 2)`, the
  projection is `(1, 0)`, and for `u = (3, 0)`: `4 + 4 = 8 = ‖(−2, 2)‖²`.
- Convexity is needed: for `K = {−1, 1} ⊆ ℝ` and `y = 0.2` the nearest point is `1`, and for
  `u = −1` the left side is `4 + 0.64 = 4.64 > 1.44`.
- Completeness is needed: for the convex set `K = (0, 1]` and `y = −1` no point of `K` is nearest,
  so `metricProj K y = 0 ∉ K`.

*Needs:* MathematicalStatisticsNonparametric 6.5 (`metricProj`); Mathlib
`exists_norm_eq_iInf_of_complete_convex`, `norm_eq_iInf_iff_real_inner_le_zero`,
`Metric.infDist_eq_iInf`, `dist_eq_norm`.

### Examples

Projections onto an interval, a ball, a box and the probability simplex of `ℝ³`, with the
inequality of 1.2 at boundary and interior points of each set.

### Dependencies

Mathlib's nearest points in convex sets and MathematicalStatisticsNonparametric 6.5 (1.2). 1.1
uses only finite sums.

## Layer 2: online gradient descent

Throughout, `K` is a nonempty, complete, convex subset of a real inner product space `E`,
`g : ℕ → E` and `f : ℕ → E → ℝ`. The iterates are `ogd K η g x₀`: `x 0 = x₀` and
`x (t + 1) = metricProj K (x t − η t • g t)`. The starting point `x₀` need not lie in `K`, while
`x t ∈ K` for `t ≥ 1` by 1.2. Each bound assumes that `g t` is a subgradient of `f t` at `x t`
relative to `K`, with the modulus the section names.

### 2.1 Constant steps

Define `ogd`. Prove:

- `regret_ogd_le`: for a constant step `η > 0` and every `u ∈ K`,
  `regret f x T u ≤ ‖u − x₀‖² / (2η) + (η / 2) ∑_{t < T} ‖g t‖²`;
- `regret_ogd_le_mul_sqrt`: if `D > 0`, `G > 0`, `T ≥ 1`, `‖g t‖ ≤ G` for all `t` and
  `‖u − x₀‖ ≤ D`, the step `η = D / (G √T)` gives `regret f x T u ≤ D G √T`.

Route: for `u ∈ K`, 1.2 applied to `y = x t − η g t` gives
`‖x (t + 1) − u‖² ≤ ‖x t − u‖² − 2η ⟪g t, x t − u⟫ + η² ‖g t‖²`, so
`⟪g t, x t − u⟫ ≤ (‖x t − u‖² − ‖x (t + 1) − u‖²) / (2η) + (η / 2) ‖g t‖²`. Summing, the first
terms telescope to at most `‖x₀ − u‖² / (2η)`, and the linearization of 1.1 gives the first
bound. The second is the first with `∑ ‖g t‖² ≤ T G²`, where both terms are at most
`D G √T / 2`.
(Orabona, Theorem 2.13, p. 13, second bound, for differentiable losses, extended to subgradients
by Lemma 2.31, p. 19; Orabona, equation (2.1), p. 15, for `D L √T`; the sources start in `K`.
Proved here.)

**Checks.**

- Equality: `K = [−1, 1]`, `x₀ = 0`, `f 0 y = y`, `g 0 = 1`, `η = 1`, `T = 1`, `u = −1`. The
  regret is `1` and the bound is `1/2 + 1/2 = 1`. With `D = G = 1` this is also an equality in
  the second bound.
- A start outside `K`: `K = [0, 1]`, `x₀ = 2`, `f 0 y = y`, `g 0 = 1`, `η = 1`, `u = 0`. Then
  `x 1 = metricProj K 1 = 1`, the regret after one round is `2` and the bound is
  `4/2 + 1/2 = 5/2`.
- `T = 0`: the bound reads `0 ≤ ‖u − x₀‖² / (2η)`.
- `K = {c}` and `x₀ = c`: every iterate is `c`, and the regret against `c` is `0`.
- The step must be positive: with `η = 0`, the right side of the first bound is `0` (division by
  zero), while on `K = [−1, 1]` with `x₀ = 0`, `f t y = y`, `g t = 1` the iterates stay at `0`
  and the regret against `−1` is `T`.

*Needs:* 1.1, 1.2; Mathlib `norm_sub_sq_real`. (Proved here, except as cited.)

### 2.2 Non-increasing steps on a bounded set

Assume moreover `x₀ ∈ K` and `‖y − z‖ ≤ D` for all `y, z ∈ K`. Prove:

- `regret_ogd_le_of_antitone`: for steps `η t > 0` with `η` non-increasing (`Antitone η`),
  every `T ≥ 1` and `u ∈ K`,
  `regret f x T u ≤ D² / (2 η (T − 1)) + ∑_{t < T} (η t / 2) ‖g t‖²`;
- `regret_ogd_le_three_halves`: if `D > 0`, `G > 0` and `‖g t‖ ≤ G` for all `t`, the steps
  `η t = D / (G √(t + 1))` give `regret f x T u ≤ (3/2) D G √T` for every `T`.

Route: the one-step inequality of 2.1 with the step `η t` bounds `⟪g t, x t − u⟫` by
`(‖x t − u‖² − ‖x (t + 1) − u‖²) / (2 η t) + (η t / 2) ‖g t‖²`; sum over `t < T`. By summation
by parts the distance terms equal `‖x₀ − u‖² / (2 η 0)` plus
`∑_{0 < t < T} ‖x t − u‖² (1 / (2 η t) − 1 / (2 η (t − 1)))` minus a nonnegative last term;
each coefficient is nonnegative because `η` is non-increasing, and `‖x t − u‖ ≤ D` because
`x t ∈ K`, so the sum is at most `D² / (2 η (T − 1))`. For the second bound, the first term is
`D G √T / 2` and, for `T ≥ 1`, `∑_{t < T} 1 / √(t + 1) ≤ 2 √T − 1`, by comparison with
`∫ 1/√s`; at `T = 0` both sides of the bound are `0`.
(Orabona, Theorem 2.13, p. 13, first bound; Hazan, Theorem 3.1, p. 43, for `(3/2) G D √T`;
Zinkevich 2003, Theorem 1, for the steps `1 / √(t + 1)`; proved here.)

**Checks.**

- `T = 1` with `η 0 = D / G`: the first bound is at most `D G / 2 + D G / 2 = D G`, below the
  `(3/2) D G` of the second.
- With `η t = 1 / √(t + 1)` and `‖g t‖ ≤ G` the first bound gives
  `D² √T / 2 + (G² / 2) ∑_{t < T} 1 / √(t + 1) ≤ D² √T / 2 + G² (√T − 1/2)`, Zinkevich's
  bound.
- The start must lie in `K`: for `K = {0}` (so `D = 0`), `x₀ = 1`, `f 0 y = y`, `g 0 = 1`,
  `η 0 = 1` and `T = 1`, the regret against `0` is `1` and the bound is `0 + 1/2`.
- The steps must not increase: on `K = [−1, 1]` (`D = 2`) with `x₀ = 1`, `f 0 y = y`, `g 0 = 1`,
  `f 1 = 0`, `g 1 = 0`, `η 0 = 1/10`, `η 1 = 100` and `T = 2`, the regret against `−1` is `2`
  and the bound is `4/200 + 1/20 = 0.07`.

*Needs:* 1.1, 1.2, 2.1 (its one-step inequality); Mathlib `Antitone`,
`Finset.sum_range_by_parts`. (Proved here, except as cited.)

### 2.3 Strongly convex losses

Assume that `g t` is a subgradient of `f t` at `x t` relative to `K` with modulus `μ t > 0`.
Prove:

- `regret_ogd_le_of_strongConvex`: the steps `η t = 1 / ∑_{i ≤ t} μ i` give, for every `u ∈ K`,
  `regret f x T u ≤ (1/2) ∑_{t < T} ‖g t‖² / ∑_{i ≤ t} μ i`;
- `regret_ogd_le_log`: if `μ t = α > 0` for all `t` and `‖g t‖ ≤ G`, the steps
  `η t = 1 / (α (t + 1))` give `regret f x T u ≤ G² (1 + log T) / (2α)`.

Route: the linearization of 1.1 with modulus `μ t` and the one-step inequality of 2.1 give
`f t (x t) − f t u ≤ ‖x t − u‖² (1 / (2 η t) − μ t / 2) − ‖x (t + 1) − u‖² / (2 η t) + (η t / 2) ‖g t‖²`.
With these steps `1 / (2 η t) − μ t / 2 = 1 / (2 η (t − 1))` for `t ≥ 1` and `0` for `t = 0`,
so the distance terms telescope to a nonpositive quantity; no bound on `K` and no condition on
`x₀` is needed. For the second bound, `∑_{t < T} 1 / (t + 1)` is the harmonic number, at most
`1 + log T` (`harmonic_le_one_add_log`). (Orabona, Theorem 4.7, p. 37, and Corollary 4.8, p. 38;
Hazan, Theorem 3.3, p. 47; proved here.)

**Checks.**

- `f t y = (α / 2) (y − c t)²` on `ℝ` satisfies the hypothesis with `g t` its derivative, with
  equality.
- Equality in the first bound: `K = [−1, 1]`, `α = 1`, `f t y = (y − 1)² / 2`, `x₀ = 0`. Then
  `η 0 = 1`, `x 1 = metricProj K 1 = 1`, and `x t = 1`, `g t = 0` for `t ≥ 1`. For every `T ≥ 1`
  the regret against `1` is `1/2` and the first bound is `(1/2) · 1² / 1 = 1/2`.
- `T = 0`: the second bound reads `0 ≤ G² / (2α)`, because `Real.log 0 = 0`.
- A start outside `K` is allowed: in the example above with `x₀ = 3`, `x 1 = metricProj K 1 = 1`
  again, the regret against `1` is `f 0 3 − f 0 1 = 2`, and `g 0 = 2` gives the bound
  `(1/2) · 4 = 2`.

*Needs:* 1.1, 1.2, 2.1 (its one-step inequality); Mathlib `harmonic_le_one_add_log`.
(Proved here, except as cited.)

### Examples

Online gradient descent on the absolute losses `|y − c t|` on `[0, 1]` with `G = D = 1`; on
quadratic losses with the logarithmic schedule; and on adaptively chosen linear losses on the
unit ball of `ℝ²`.

### Dependencies

1.1 and 1.2 for every section; 2.2 and 2.3 also use the one-step inequality of 2.1. Mathlib
`norm_sub_sq_real`, `Antitone`, `Finset.sum_range_by_parts` and `harmonic_le_one_add_log`.

## Layer 3: follow the regularized leader

### 3.1 The regret bound with a strongly convex regularizer

Let `F` be a real normed space, `K ⊆ F`, `ψ : F → ℝ`, `η > 0` and `g : ℕ → StrongDual ℝ F`.
Define `IsFTRL K ψ η g x`: for every `t`, `x t ∈ K` and `x t` minimizes
`y ↦ ψ y + η ∑_{s < t} g s y` over `K` (`IsMinOn`). Prove `regret_le_of_isFTRL`: if `ψ` is
`μ`-strongly convex on `K` with `μ > 0`, `IsFTRL K ψ η g x` holds, and each `g t` is a
subgradient of `f t` at `x t` relative to `K`, then for every `u ∈ K`

    regret f x T u ≤ (ψ u − ψ (x 0)) / η + (η / (2μ)) ∑_{t < T} ‖g t‖².

The route uses quadratic growth at a constrained minimizer: if `φ` is `m`-strongly convex on `K`
and `z ∈ K` minimizes `φ` over `K`, then `φ y ≥ φ z + (m / 2) ‖y − z‖²` for every `y ∈ K`. No
continuity is needed: apply the definition to `z` and `y` with weights `1 − θ` and `θ`, use
`φ z ≤ φ (z + θ (y − z))`, divide by `θ` and let `θ → 0`.

Route: put `Φ t y = ψ y / η + ∑_{s < t} g s y`, the objective of `IsFTRL` divided by `η > 0`,
which `x t` minimizes over `K` and which is `(μ / η)`-strongly convex on `K`, a linear function
being `0`-strongly convex. Summing
`Φ (t + 1) (x t) − Φ (t + 1) (x (t + 1))` over `t < T` telescopes to
`∑_{t < T} g t (x t) + ψ (x 0) / η − Φ T (x T)`, and `Φ T (x T) ≤ Φ T u`; hence
`∑_{t < T} g t (x t − u) ≤ (ψ u − ψ (x 0)) / η + ∑_{t < T} (Φ (t + 1) (x t) − Φ (t + 1) (x (t + 1)))`.
Quadratic growth of `Φ t` at `x t` gives
`Φ (t + 1) (x t) − Φ (t + 1) (x (t + 1)) ≤ g t (x t − x (t + 1)) − (μ / (2η)) ‖x t − x (t + 1)‖²`,
and `g t z ≤ ‖g t‖ ‖z‖` with `a r − (b / 2) r² ≤ a² / (2b)` bounds this by `η ‖g t‖² / (2μ)`.
The linearization of 1.1 finishes. (Orabona, Lemma 7.1, p. 100, Lemma 7.5, p. 101, and
Corollary 7.6, p. 102, with constant `η` and the regularizer `ψ / η`; the source assumes `ψ`
closed and `K` closed, which there serve the existence of minimizers. Hazan, Theorem 5.2,
p. 74, states the bound with local norms and the constant `2η`. Proved here.)

The minimizers exist when `K` is nonempty and compact and `ψ` is continuous on `K`, and they are unique by
strict convexity, so `IsFTRL` then determines `x`.

**Checks.**

- On `F = ℝ` with `ψ y = y² / 2`, `μ = 1`, `K = ℝ`, `η = 1`: `x t = −∑_{s < t} g s`. For
  `T = 1`, `g 0 = 1` (`f 0 y = y`) and `u = −1` the regret is `1` and the bound is
  `1/2 + 1/2 = 1`, an equality.
- A nonsmooth regularizer is allowed: `ψ y = y² / 2 + |y|` on `K = [−2, 2]` is `1`-strongly
  convex, `x 0 = 0`, and with `η = 1`, `g 0 = 3` the iterate `x 1` minimizes
  `y² / 2 + |y| + 3 y`, so `x 1 = −2`.
- Strong convexity is needed: with `ψ = 0` (follow the leader) on `K = [−1, 1]`,
  `g 0 = 1/2` and `g t = (−1)^t` for `t ≥ 1`, the leaders `x 1 = −1, x 2 = 1, …` alternate and,
  with `x 0 = 0`, the regret after `T ≥ 1` rounds against the best comparator `u = −1` or
  `u = 1` (the sign opposite to `∑_{t < T} g t = ±1/2`) is `T − 1/2`, linear in `T`.

*Needs:* 1.1; Mathlib `StrongConvexOn`, `UniformConvexOn.add`, `strongConvexOn_zero`,
`IsMinOn`, `ContinuousLinearMap.le_opNorm`. (Proved here, except as cited.)

### 3.2 The entropic regularizer and Hedge

`simplex ι`, `OnlineAlgorithm`, `OnlineAlgorithm.play` and `hedge` are those of
RegretMinimizationAndEquilibria (Conventions, 1.1 and 1.2); there players maximize payoffs, and
`(hedge η).play u t a = exp (η ∑_{s < t} u s a) / ∑_b exp (η ∑_{s < t} u s b)`. Let `ι` be finite
and nonempty, `g : ℕ → ι → ℝ` a sequence of loss vectors and `η` real. Define
`entropicObjective η g t q = ∑_a q a log (q a) + η ∑_{s < t} g s ⬝ᵥ q`, the
objective of follow the regularized leader with the negative entropy as regularizer. Prove
`hedge_play_neg_isMinOn_entropicObjective`: the strategy `p = (hedge η).play (fun s ↦ −g s) t`,
which Hedge plays against the payoffs `−g`, lies in `simplex ι`, has
`entropicObjective η g t p = −log ∑_a exp (−η ∑_{s < t} g s a)`, and is the unique minimizer of
`entropicObjective η g t` over `simplex ι`.

Route: put `c a = η ∑_{s < t} g s a` and `Z = ∑_a exp (−c a)`, so `p a = exp (−c a) / Z`. For
`q ∈ simplex ι`, Tau Ceti's Fenchel–Young inequality `TauCeti.mul_sub_exp_sub_one_le_klFun`,
`x y − (exp y − 1) ≤ x log x + 1 − x` for `x ≥ 0` (`InformationTheory.klFun_apply`), at
`x = q a` and `y = −c a − log Z`, summed over `a` with `∑ q a = 1` and `∑ exp (−c a) / Z = 1`,
gives `entropicObjective η g t q ≥ −log Z`. Equality holds exactly when `q a = exp y = p a` for
every `a` (`TauCeti.mul_sub_exp_sub_one_eq_klFun_iff`), and `p` attains it. (Orabona,
Section 6.6, equation (6.11) and the formula `ψ_V⋆(θ) = log ∑ exp θ_i`, pp. 78–79, with
`θ = −η ∑_{s < t} g s`; Orabona, Section 7.5, p. 109, for the exponential weights as follow the
regularized leader; proved here.)

So Hedge is follow the regularized leader on the simplex with the negative entropy as
regularizer and the linear losses `q ↦ g t ⬝ᵥ q`. Its regret bound
`log n / η + η Δ² T / 8` for payoffs of range `Δ` is the regret theorem of
RegretMinimizationAndEquilibria 1.2 and is not restated here.

**Checks.**

- `ι = Fin 2`, `η ∑_{s < t} g s = (log 2, 0)`: `p = (1/3, 2/3)` and the minimum value is
  `(1/3) log (1/3) + (2/3) log (2/3) + (1/3) log 2 = −log (3/2)`.
- Sign convention: Hedge against the payoffs `+g` in the same example plays `(2/3, 1/3)`, with
  objective value `(4/3) log 2 − log 3 ≈ −0.174 > −log (3/2) ≈ −0.405`.
- `t = 0` or `η = 0`: `p` is uniform and the minimum value is `−log n`.
- `n = 1`: the simplex is `{1}` and the value `−log exp (−η ∑ g s) = η ∑_{s < t} g s` is the
  objective at the only point.
- Boundary points do not minimize: at `q = (1, 0)` in the first example the objective is
  `log 2 > −log (3/2)`.

*Needs:* RegretMinimizationAndEquilibria Conventions (`simplex`), 1.1 (`OnlineAlgorithm`,
`OnlineAlgorithm.play`) and 1.2 (`hedge`); Tau Ceti `TauCeti.mul_sub_exp_sub_one_le_klFun`,
`TauCeti.mul_sub_exp_sub_one_eq_klFun_iff`; Mathlib `InformationTheory.klFun_apply`,
`Convexity.StdSimplex.range_toFun_comp_weights`, `Fin.sum_univ_eq_sum_range`.

### Examples

Follow the regularized leader with `ψ = ‖·‖² / 2` on a box of `ℝ²`, whose iterates are
coordinatewise clippings of `−η ∑_{s < t} g s`; the exponential weights on `Fin 3` against
rock–paper–scissors losses.

### Dependencies

3.1 uses 1.1 and Mathlib's strong convexity. 3.2 uses no other section: it consumes
RegretMinimizationAndEquilibria (Conventions, 1.1, 1.2) and Tau Ceti's Fenchel–Young inequality
for `klFun`.

## Layer 4: mirror descent

Throughout, `F` is a real normed space and `ψ : F → ℝ`.

### 4.1 Bregman divergences

Define `bregmanDiv ψ u v = ψ u − ψ v − fderiv ℝ ψ v (u − v)`. The route of 4.2 uses two facts
about it, for all `u`, `v`, `w`:

- *The three-point identity.*
  `bregmanDiv ψ u w = bregmanDiv ψ u v + bregmanDiv ψ v w + (fderiv ℝ ψ v − fderiv ℝ ψ w) (u − v)`.
  It uses only the linearity of the two derivatives (Orabona, Lemma 6.7, p. 64, after Chen and
  Teboulle; Bubeck, equation (4.1), p. 297).
- *The lower bound.* If `ψ` is `m`-strongly convex on `K`, `u, v ∈ K` and `ψ` is differentiable
  at `v`, then `bregmanDiv ψ u v ≥ (m / 2) ‖u − v‖²`; in particular it is nonnegative when `ψ` is
  convex on `K`. This is Tau Ceti's first-order inequality for strong convexity rearranged, with
  the derivative within `K` obtained from the derivative at `v` (Orabona, equation (6.4),
  p. 64).

(Orabona, Definition 6.4, p. 63, and Hazan, Definition 5.1, p. 73, for the definition; proved
here.)

**Checks.**

- `ψ = ‖·‖² / 2` on a real inner product space: `bregmanDiv ψ u v = ‖u − v‖² / 2`. Taking the
  derivative at `u` instead of `v` would give `−‖u − v‖² / 2`.
- `ψ q = ∑_a q a log (q a)` on `ι → ℝ`, at `v` with positive coordinates:
  `bregmanDiv ψ u v = ∑_a (u a log (u a / v a) − u a + v a)`, the Kullback–Leibler divergence
  when `u` and `v` lie in the simplex. For `u = (1, 0)` and `v = (1/2, 1/2)` it is `log 2`.
- At a point where `ψ` is not differentiable the derivative is `0`: for `ψ = |·|` on `ℝ`,
  `bregmanDiv ψ u 0 = |u|`.

*Needs:* Mathlib `fderiv`, `HasFDerivAt.hasFDerivWithinAt`; Tau Ceti
`StrongConvexOn.add_add_le_of_hasFDerivWithinAt`. (Proved here, except as cited.)

### 4.2 The regret bound

Let `K ⊆ F`, `η > 0` and `g : ℕ → StrongDual ℝ F`. Define `IsMirrorDescent K ψ η g x`: for
every `t`, `x t ∈ K` and `x (t + 1)` minimizes `y ↦ η g t y + bregmanDiv ψ y (x t)` over `K`.
Prove `regret_le_of_isMirrorDescent`: if `ψ` is `μ`-strongly convex on `K` with `μ > 0`,
`IsMirrorDescent K ψ η g x` holds, `ψ` is differentiable at every `x t`, and each `g t` is a
subgradient of `f t` at `x t` relative to `K`, then for every `u ∈ K`

    regret f x T u ≤ bregmanDiv ψ u (x 0) / η + (η / (2μ)) ∑_{t < T} ‖g t‖².

Route: the function `y ↦ η g t y + bregmanDiv ψ y (x t)` has derivative
`η g t + fderiv ℝ ψ (x (t + 1)) − fderiv ℝ ψ (x t)` at `x (t + 1)`, which minimizes it over the
convex set `K`; so this derivative is nonnegative at `u − x (t + 1)` for `u ∈ K`
(`IsLocalMinOn.hasFDerivWithinAt_nonneg`, with `mem_posTangentConeAt_of_segment_subset`). With
the three-point identity of 4.1 at `u`, `x (t + 1)`, `x t` this gives
`η g t (x t − u) ≤ bregmanDiv ψ u (x t) − bregmanDiv ψ u (x (t + 1)) − bregmanDiv ψ (x (t + 1)) (x t) + η g t (x t − x (t + 1))`,
and the lower bound of 4.1 with `g t z ≤ ‖g t‖ ‖z‖` bounds the last two terms by
`η² ‖g t‖² / (2μ)`. Summing, the divergences from `u` telescope, the last one is nonnegative by
4.1, and the linearization of 1.1 finishes. (Orabona, Lemma 6.10 and Theorem 6.11, p. 67, with
constant `η`; Bubeck, Theorem 4.2, pp. 299–300, for the bound on the average of the iterates;
Hazan, Theorem 5.6, p. 79, in a form with local norms. The sources assume `ψ` strictly convex
and differentiable on the interior of its domain, which then contains the iterates; here only
differentiability at the iterates is used. Proved here.)

**Checks.**

- Euclidean case: for `ψ = ‖·‖² / 2` on a real inner product space, `μ = 1`, the minimizer of
  `η ⟪g t, y⟫ + ‖y − x t‖² / 2` over `K` is the projection of `x t − η g t`, so mirror descent
  is online gradient descent with constant step and the bound is that of 2.1.
- Entropic case: on the simplex of `ℝ²` with the norm `|a| + |b|` (whose dual norm is
  `max (|a|, |b|)`) and `ψ q = ∑ q a log (q a)`, which is `1`-strongly convex there, mirror
  descent is `x (t + 1) a ∝ x t a exp (−η g t a)` (Orabona, Lemma 6.33, p. 80, and Section 6.6,
  p. 79). From `x 0 = (1/2, 1/2)` with `η = 1` and
  `g 0 = (1, 0)`: `x 1 = (1 / (1 + e), e / (1 + e))`; against `u = (0, 1)` the regret after one
  round is `1/2`, and the bound is `log 2 + 1/2`.
- Differentiability at the iterates is needed: on `K = [−1, 2] ⊆ ℝ` let
  `ψ y = y² / 2 + |y − 1| + 2 y`, which is `1`-strongly convex and not differentiable at `1`,
  where its `fderiv` is `0`. With `x 0 = 1`, `η = 1`, `f 0 y = y` and `g 0 = 1`, the next iterate
  minimizes `y + ψ y − ψ 1` over `K`, so `x 1 = −1`. Against `u = 0` the regret after one round
  is `1`, while the bound is `(ψ 0 − ψ 1) + 1/2 = (1 − 5/2) + 1/2 = −1`.

*Needs:* 1.1, 4.1; Mathlib `IsMinOn.isLocalMinOn`, `IsLocalMinOn.hasFDerivWithinAt_nonneg`,
`mem_posTangentConeAt_of_segment_subset`, `DifferentiableAt.hasFDerivAt`,
`ContinuousLinearMap.le_opNorm`. (Proved here, except as cited.)

### Examples

Exponentiated gradient on the simplex of `ℝ³` with linear losses, against the uniform start;
mirror descent with `ψ = ‖·‖_p² / 2` on a box of `ℝ²` for `p = 3/2`, which is
`(p − 1)`-strongly convex for the `ℓ^p` norm.

### Dependencies

4.1 uses Mathlib's Fréchet derivatives and Tau Ceti's first-order inequality for strong
convexity. 4.2 uses 1.1, 4.1 and Mathlib's first-order condition at a minimizer over a convex
set.

## Layer 5: online-to-batch conversion

### 5.1 Expected risk of the averaged iterate

Let `(Ω, P)` be a probability space, `Ξ` a measurable space with a measure `μ`, `V` a
finite-dimensional real normed space with its Borel σ-algebra, and `K ⊆ V`. Let
`f : V → Ξ → ℝ` be jointly measurable, bounded on `K × Ξ` (`|f x z| ≤ M` for `x ∈ K`), and
convex on `K` in its first argument for every `z`; put `F x = ∫ f x z ∂μ`. Let `ξ t : Ω → Ξ` be
measurable with `P.map (ξ t) = μ`, and `x t : Ω → V` with values in `K`, measurable for a
sub-σ-algebra `𝓕 t` of the σ-algebra of `Ω` that is independent of the σ-algebra generated by
`ξ t` (`ProbabilityTheory.Indep`). Let `α t > 0` be deterministic weights. Prove
`integral_risk_weightedAverage_le`: for `T ≥ 1` and `u ∈ K`,

    ∫ F (x̄ T) ∂P ≤ F u + (∫ regret (fun t y ↦ α t * f y (ξ t ω)) (fun t ↦ x t ω) T u ∂P) / ∑_{t < T} α t,

where `x̄ T = (∑_{t < T} α t)⁻¹ • ∑_{t < T} α t • x t`. The hypothesis covers i.i.d. samples with
`x t` a measurable function of `ξ 0, …, ξ (t − 1)` and of randomness independent of the samples
(take for `𝓕 t` the σ-algebra these generate); the bound on `f` makes every expectation finite.

Route: for each `t`, `x t` and `ξ t` are independent (`ProbabilityTheory.indep_of_indep_of_le_left`
from the comap of `x t` being below `𝓕 t`), so the law of the pair is the product of the law of
`x t` and `μ` (`ProbabilityTheory.indepFun_iff_map_prod_eq_prod_map_map`), and Fubini
(`MeasureTheory.integral_prod`) with the change of variables `MeasureTheory.integral_map` gives
`∫ f (x t ω) (ξ t ω) ∂P = ∫ F (x t ω) ∂P`; likewise `∫ f u (ξ t ω) ∂P = F u`. `F` is convex on
`K`, by integrating the convexity inequality of `f · z`, so Jensen's inequality
(`ConvexOn.map_sum_le`, with the weights `α t / ∑ α`) gives `F (x̄ T) ≤ ∑ α t F (x t) / ∑ α`
pointwise. Integrating and combining gives the bound. (Orabona, Theorem 3.1, p. 24, for
`f` convex and subdifferentiable in its first argument with values in `(−∞, +∞]`, i.i.d.
samples and an algorithm whose internal randomness is independent of them; here `f` is
real-valued and bounded, and only the independence of `ξ t` from what `x t` depends on is
assumed. Proved here.)

**Checks.**

- `T = 1`: both sides equal `∫ F (x 0) ∂P`, since the expected regret is
  `α 0 (∫ F (x 0) ∂P − F u)` and the total weight is `α 0`.
- In a finite-dimensional inner product space, with `K` nonempty, closed and convex and the
  `ξ t` independent, online gradient descent with the step `D / (G √T)` of 2.1 on the losses
  `f · (ξ t)`, with a measurable choice of subgradients of norm at most `G`, a deterministic
  start `x 0 ∈ K` and `‖u − x 0‖ ≤ D`, gives
  `∫ F (x̄ T) ∂P − F u ≤ D G / √T` for the uniform weights.
- Independence is needed: on `K = [−1, 1]` with `ξ t` uniform on `{−1, 1}` and i.i.d.,
  `f x z = |x − z|` (so `F = 1` on `K`), the plays `x t = ξ t` have
  `∫ F (x̄ T) ∂P = 1`, while for `u = 0` the regret is `−T` on every sample and the right side
  is `1 − 1 = 0`.
- `T = 0` is excluded: the average is then `0` by the conventions of division, and on
  `K = [1, 2]` with `f x z = −x` the left side is `F 0 = 0` while the right side for `u = 1` is
  `−1`.

*Needs:* 1.1; Mathlib `ProbabilityTheory.Indep`, `ProbabilityTheory.indep_of_indep_of_le_left`,
`ProbabilityTheory.indepFun_iff_map_prod_eq_prod_map_map`, `MeasureTheory.integral_prod`,
`MeasureTheory.integral_map`, `MeasureTheory.StronglyMeasurable.integral_prod_right`,
`ConvexOn.map_sum_le`. (Proved here, except as cited.)

### Examples

Online gradient descent on the hinge losses of a finite sample drawn with replacement, with the
resulting bound on the expected excess risk of the averaged iterate.

### Dependencies

1.1 and Mathlib's independence, product measures and Jensen's inequality.

## Layer 6: the lower bound

### 6.1 The mean absolute value of a simple random walk

Prove `sqrt_half_le_mean_abs_sum_signs`: for every `T`, the average of `|ε 0 + ⋯ + ε (T − 1)|`
over the `2^T` sequences of signs `ε i = ±1` is at least `√(T / 2)`.

Route: write `S T` for the sum and `E` for the average. Since
`(|s + 1| + |s − 1|) / 2 = max (|s|, 1)`, `E |S (T + 1)| = E |S T| + P (S T = 0)`, and `P (S (2j) = 0) = C(2j, j) / 4^j`, so
`E |S (2m)| = 2m C(2m, m) / 4^m` and `E |S (2m + 1)| = (2m + 1) C(2m, m) / 4^m`, by induction
on `m` using `(m + 1) C(2m + 2, m + 1) = 2 (2m + 1) C(2m, m)` (`Nat.succ_mul_centralBinom_succ`).
The same recurrence gives `C(2m, m) / 4^m ≥ 1 / (2 √m)` for `m ≥ 1`, because
`((2m + 1) / (2m + 2))² ≥ m / (m + 1)`. Hence `E |S (2m)| ≥ √m` and, for `m ≥ 1`,
`E |S (2m + 1)| ≥ (2m + 1) / (2 √m) ≥ √((2m + 1) / 2)`; `T = 1` is direct. This is the case of
equal coefficients of Khintchine's inequality for `p = 1` with the sharp constant `1/√2`, due
to Szarek (Orabona, Theorem A.14, p. 296, with the constants of Haagerup; proved here for equal
coefficients).

**Checks.**

- The averages for `T = 0, …, 6` are `0, 1, 1, 3/2, 3/2, 15/8, 15/8`; against `√(T / 2)` these
  are `0 ≥ 0`, `1 ≥ 0.707`, `1 = 1`, `1.5 ≥ 1.225`, `1.5 ≥ 1.414`, `1.875 ≥ 1.581`,
  `1.875 ≥ 1.732`. The constant is attained at `T = 2`.
- The ratio of the average to `√T` tends to `√(2/π) ≈ 0.798`. The fourth-moment bound
  `E |S| ≥ (E S²)^(3/2) / (E S⁴)^(1/2)`, with `E S² = T` and `E S⁴ = 3T² − 2T`, is below
  `√(T / 2)` for every `T ≥ 3` (at `T = 3` it is `√27 / √21 ≈ 1.134 < 1.225`).

*Needs:* Mathlib `Nat.centralBinom`, `Nat.succ_mul_centralBinom_succ`. (Proved here.)

### 6.2 The lower bound for online linear optimization

Prove `exists_regret_ge`: let `E` be a real inner product space, `v, w ∈ E`, `L ≥ 0`, and
`A : (t : ℕ) → (Fin t → E) → E` any deterministic strategy, which plays `A t (g 0, …, g (t − 1))`
at round `t`. For every `T` there are `g : ℕ → E` with `‖g t‖ ≤ L` for all `t` and
`u ∈ {v, w}` such that

    L ‖v − w‖ √(T / 8) ≤ regret (fun t y ↦ ⟪g t, y⟫) (fun t ↦ A t (g 0, …, g (t − 1))) T u.

The strategy may play anywhere in `E`; any set containing `v` and `w` and any strategy with
values in it are a special case.

Route: if `v = w` take `g = 0`. Otherwise let `z = (v − w) / ‖v − w‖` and, for each sign
sequence `ε`, `g t = L ε t z` for `t < T`. Averaged over the `2^T` sign sequences, the term
`⟪g t, x t⟫` has mean `0`, because `x t` depends only on `ε 0, …, ε (t − 1)` and flipping
`ε t` changes its sign. With `S = ∑_{t < T} ε t`,
`max over u ∈ {v, w} of −∑_{t < T} ⟪g t, u⟫ = −(L S / 2) ⟪z, v + w⟫ + (L ‖v − w‖ / 2) |S|`, by
`max (a, b) = (a + b) / 2 + |a − b| / 2`, and the first term has mean `0`. So the mean over the
sign sequences of the larger regret is `(L ‖v − w‖ / 2) E |S|`, at least
`(L ‖v − w‖ / 2) √(T / 2) = L ‖v − w‖ √(T / 8)` by 6.1, and some sign sequence attains at least
the mean. (Orabona, Theorem 5.1, pp. 50–51, for `u` in a bounded closed convex set `V` of
diameter `D` and an algorithm playing in `V`, with the bound `√2 L D √T / 4`, which is
`L D √(T / 8)`; Hazan, Theorem 3.2, p. 45, for the order `D G √T`; proved here.)

**Checks.**

- On `ℝ` with `v = 1`, `w = −1`, `L = 1` and `T = 2` the bound is `1`, and the strategy
  `x 0 = 0`, `x 1 = −g 0` has largest regret exactly `1`: the bound is attained.
- Together with 2.1 (with `D = ‖v − w‖ > 0` for the segment from `w` to `v` and `G = L > 0`),
  for `T ≥ 1` the least worst-case regret over that segment of strategies playing in it lies
  between `L D √(T / 8)` and `L D √T`.
- `L = 0`: the bound is `0`, attained by `g = 0`. `L < 0` is excluded, since no vector has
  negative norm.
- `T = 0`: both sides are `0`.

*Needs:* 1.1, 6.1. (Proved here, except as cited.)

### Examples

The game on `[−1, 1]` with gradients `±1`, whose minimax regret after `T` rounds equals the
average of 6.1, computed for `T ≤ 6`.

### Dependencies

6.1 uses Mathlib's central binomial coefficients; 6.2 uses 1.1 and 6.1.

## Scope and ownership

This roadmap owns the definitions and theorems stated above: regret of a sequence of plays
against a comparator, the projection inequality for the metric projection, the online gradient
descent sequence with its regret bounds for constant, non-increasing and strongly convex step
schedules, the follow-the-regularized-leader predicate with its regret bound, the
identification of the
entropic case with Hedge, Bregman divergences with the three-point identity and the
mirror-descent bound, the online-to-batch conversion, the mean absolute value of a simple random
walk and the lower bound for online linear optimization.

Already in the libraries and therefore not targets:

- the existence of nearest points in nonempty complete convex subsets of real inner product
  spaces and their characterization by `⟪u − v, w − v⟫ ≤ 0`
  (`exists_norm_eq_iInf_of_complete_convex`, `norm_eq_iInf_iff_real_inner_le_zero`);
- strong convexity (`StrongConvexOn`) and its first-order inequality
  (Tau Ceti `StrongConvexOn.add_add_le_of_hasFDerivWithinAt`), from which the lower bound of 4.1
  and the subgradient inequality with modulus for differentiable strongly convex losses follow
  by rearrangement;
- the subdifferential of an extended-real function (Tau Ceti `TauCeti.subdifferential`);
- the Gibbs variational identity for probability measures and a measurable potential `f ≥ 0`,
  `klDiv μ (ν.tilted (−f)) − log Z = ∫ f dμ + klDiv μ ν` with `Z = ∫ exp (−f) dν`
  (Tau Ceti `TauCeti.klDiv_tilted_neg_add_ofReal_neg_log`); 3.2 is the corresponding statement
  for vectors on the simplex, which identifies the minimizer with the Hedge strategy, and above it
  is proved directly from the pointwise Fenchel–Young inequality rather than from that identity;
- Jensen's inequality, independence and Fubini's theorem.

Stated by roadmaps on main and not restated here:

- RegretMinimizationAndEquilibria owns the online protocol over the simplex, `simplex`, Hedge
  and its regret bound (its 1.2), regret matching, regret matching+ and Blackwell approachability
  (its 1.1–1.5). Its regret against an action `a` is the regret here for the losses
  `f t q = −(u t ⬝ᵥ q)` and the comparator `Pi.single a 1`. 3.2 restates its definitions of
  `simplex`, `OnlineAlgorithm`, `OnlineAlgorithm.play` and `hedge` with identical bodies, so that
  `Suggested.lean` imports no roadmap, and adds only the variational characterization; the
  regret bound of Hedge stays its own. That roadmap leaves online convex optimization over general
  convex sets and online mirror descent out of its scope.
- MathematicalStatisticsNonparametric 6.5 owns `metricProj`, restated with an identical body.
- NoncommutativeIntegration 6.3 owns Khintchine's inequality for `p = 1` with the universal
  constant `3^(−1/2)`, whose commutative case bounds the average of 6.1 below by `√(T / 3)`; 6.1
  is the case of equal coefficients with the sharp constant `1/√2`, proved directly.

FirstOrderOptimization (an open roadmap, not on main) plans, in its 3.1, the variational
inequality and firm nonexpansiveness for a nearest-point map of its own. The inequality of 1.2 is
a different statement, the three-point inequality for `metricProj`; it is not stated there and
follows from Mathlib's `norm_eq_iInf_iff_real_inner_le_zero` alone. This roadmap does not depend
on that one.

Not treated here: firm nonexpansiveness and the other properties of the projection beyond 1.2;
proximal maps and monotone operators; mirror maps whose gradient diverges at the boundary and
functions of Legendre type; existence and uniqueness of minimizers of strongly convex functions
on the whole space; offline first-order methods and the rates of stochastic gradient descent;
the strong convexity of the negative entropy for the `ℓ¹` norm (Pinsker's inequality on the
simplex) and the regret bound of Hedge derived from 3.1; time-varying regularizers, adaptive and
parameter-free step sizes; exp-concave losses and the online Newton step; optimistic methods;
bandit feedback; policy optimization in Markov decision processes; high-probability forms of the
online-to-batch conversion (Cesa-Bianchi, Conconi and Gentile); lower bounds for randomized strategies and for strongly convex
losses.

## Exact supplier contracts

### From Mathlib

- `Mathlib/Analysis/InnerProductSpace/Projection/Minimal.lean`:
  `exists_norm_eq_iInf_of_complete_convex` (for `K` nonempty, complete and convex in a real
  inner product space and every `u`, there is `v ∈ K` with `‖u − v‖ = ⨅ w : K, ‖u − w‖`);
  `norm_eq_iInf_iff_real_inner_le_zero` (for `K` convex and `v ∈ K`, that equality holds exactly
  when `⟪u − v, w − v⟫ ≤ 0` for all `w ∈ K`).
- `Mathlib/Topology/MetricSpace/HausdorffDistance.lean`: `Metric.infDist`,
  `Metric.infDist_eq_iInf` (`infDist x s = ⨅ y : s, dist x y`).
  `Mathlib/Analysis/Normed/Group/Basic.lean`: `dist_eq_norm` (`dist a b = ‖a − b‖`).
  `Mathlib/Topology/UniformSpace/Cauchy.lean`: `IsClosed.isComplete` (closed subsets of complete
  spaces are complete).
- `Mathlib/Analysis/InnerProductSpace/Basic.lean`: `norm_sub_sq_real`
  (`‖x − y‖² = ‖x‖² − 2 ⟪x, y⟫ + ‖y‖²`), `innerₗ`.
- `Mathlib/Analysis/Convex/Strong.lean`: `StrongConvexOn` (`K` convex and
  `ψ (a x + b y) ≤ a ψ x + b ψ y − a b (m / 2) ‖x − y‖²`), `UniformConvexOn.add` (the moduli
  add), `strongConvexOn_zero` (`StrongConvexOn s 0 f ↔ ConvexOn ℝ s f`).
- `Mathlib/Order/Filter/Extr.lean`: `IsMinOn`. `Mathlib/Topology/Order/LocalExtr.lean`:
  `IsMinOn.isLocalMinOn`.
  `Mathlib/Analysis/Calculus/LocalExtr/Basic.lean`: `IsLocalMinOn.hasFDerivWithinAt_nonneg` (at
  a local minimum on `s` with derivative `f'` within `s`, `0 ≤ f' y` for `y` in the positive
  tangent cone), `mem_posTangentConeAt_of_segment_subset` (if the segment from `x` to `x + y`
  lies in `s`, `y` is in the positive tangent cone of `s` at `x`).
- `Mathlib/Analysis/Calculus/FDeriv/Defs.lean`: `fderiv` (`0` where the function is not
  differentiable). `Mathlib/Analysis/Calculus/FDeriv/Basic.lean`:
  `DifferentiableAt.hasFDerivAt`, `HasFDerivAt.hasFDerivWithinAt`.
- `Mathlib/Topology/Algebra/Module/ContinuousLinearMap/Basic.lean`: `StrongDual`
  (`StrongDual ℝ F = F →L[ℝ] ℝ`). `Mathlib/Analysis/Normed/Operator/Basic.lean`:
  `ContinuousLinearMap.le_opNorm` (`‖f x‖ ≤ ‖f‖ ‖x‖`).
- `Mathlib/Algebra/BigOperators/Group/Finset/Basic.lean`: `Finset.sum_range_succ`.
  `Mathlib/Algebra/BigOperators/Module.lean`: `Finset.sum_range_by_parts` (summation by parts
  over `Finset.range n`). `Mathlib/Order/Monotone/Defs.lean`: `Antitone`.
- `Mathlib/NumberTheory/Harmonic/Bounds.lean`: `harmonic_le_one_add_log`
  (`harmonic n ≤ 1 + log n`).
- `Mathlib/InformationTheory/KullbackLeibler/KLFun.lean`: `InformationTheory.klFun`,
  `InformationTheory.klFun_apply` (`klFun x = x log x + 1 − x`).
- `Mathlib/Geometry/Convex/ConvexSpace/Defs.lean`: `Convexity.StdSimplex`,
  `Convexity.StdSimplex.range_toFun_comp_weights` (the weight vectors are the nonnegative
  vectors of sum `1`). `Mathlib/Data/Fintype/BigOperators.lean`: `Fin.sum_univ_eq_sum_range`.
- `Mathlib/Analysis/Convex/Jensen.lean`: `ConvexOn.map_sum_le` (for weights `w i ≥ 0` of sum `1`
  and points of `s`, `f (∑ w i • p i) ≤ ∑ w i • f (p i)`).
- `Mathlib/Probability/Independence/Basic.lean`: `ProbabilityTheory.Indep` (independence of two
  σ-algebras), `ProbabilityTheory.indep_of_indep_of_le_left`,
  `ProbabilityTheory.indepFun_iff_map_prod_eq_prod_map_map` (for a finite measure and almost
  everywhere measurable `f`, `g`: independence is the law of the pair being the product of the
  laws).
- `Mathlib/MeasureTheory/Integral/Prod.lean`: `MeasureTheory.integral_prod` (Fubini for an
  integrable function on a product of s-finite measures),
  `MeasureTheory.StronglyMeasurable.integral_prod_right` (measurability of a partial integral).
  `Mathlib/MeasureTheory/Integral/Bochner/Basic.lean`: `MeasureTheory.integral_map`.
- `Mathlib/Data/Nat/Choose/Central.lean`: `Nat.centralBinom`, `Nat.succ_mul_centralBinom_succ`
  (`(n + 1) centralBinom (n + 1) = 2 (2n + 1) centralBinom n`).

### From Tau Ceti

- `TauCeti/Analysis/Convex/Strong.lean`: `StrongConvexOn.add_add_le_of_hasFDerivWithinAt` (if
  `f` is `m`-strongly convex on `s`, `x, y ∈ s` and `f` has derivative `f'` within `s` at `x`,
  then `f x + f' (y − x) + (m / 2) ‖y − x‖² ≤ f y`).
- `TauCeti/Analysis/Convex/Subdifferential.lean`: `TauCeti.subdifferential`,
  `TauCeti.mem_subdifferential_ite_iff` (for `x ∈ Ω`, a subgradient at `x` of `u` extended by
  `⊤` off `Ω` is a `y` with `u x + B (x' − x) y ≤ u x'` for all `x' ∈ Ω`), used in the
  Conventions only.
- `TauCeti/InformationTheory/KullbackLeibler/Variational.lean`:
  `TauCeti.mul_sub_exp_sub_one_le_klFun` (`x y − (exp y − 1) ≤ klFun x` for `x ≥ 0`) and
  `TauCeti.mul_sub_exp_sub_one_eq_klFun_iff` (equality exactly when `x = exp y`).
- `TauCeti/InformationTheory/KullbackLeibler/Tilted.lean`:
  `TauCeti.klDiv_tilted_neg_add_ofReal_neg_log`, cited in the scope only.

### From TauCetiRoadmap.RegretMinimizationAndEquilibria

- Conventions: `simplex ι`, the weight vectors of `Convexity.StdSimplex ℝ ι`.
- 1.1: `OnlineAlgorithm ι = (t : ℕ) → (Fin t → ι → ℝ) → (ι → ℝ)` and
  `OnlineAlgorithm.play A u t = A t (fun s ↦ u s)`.
- 1.2: `hedge η`, the strategy `exp (η ∑_s past s a) / ∑_b exp (η ∑_s past s b)`, used in 3.2;
  its regret bound for Hedge, cited in 3.2 and not used by any target.

### From TauCetiRoadmap.MathematicalStatisticsNonparametric

- 6.5: `metricProj s x`, a nearest point of `s` to `x` (chosen) when one exists and `0`
  otherwise, used in 1.2 and Layer 2.

## References

- S. Bubeck, *Convex Optimization: Algorithms and Complexity*, Foundations and Trends in Machine
  Learning 8 (2015), 231–358; arXiv:1405.4980, version 2 of November 2015, whose page numbers
  are those of the journal and are used above.
- E. Hazan, *Introduction to Online Convex Optimization*, 2nd ed., arXiv:1909.05207, version 3
  of August 2023; the page numbers above are the printed ones of that version.
- F. Orabona, *Online Learning: A Modern Introduction Using Convex Optimization*,
  arXiv:1912.13213, version 10 of June 2026 (earlier versions are titled *A Modern Introduction
  to Online Learning*); the page numbers above are the printed ones of that version.
- M. Zinkevich, *Online convex programming and generalized infinitesimal gradient ascent*,
  Proceedings of the Twentieth International Conference on Machine Learning (ICML 2003); open
  copy at the AAAI digital library.
- Attributions made in prose without a locator: G. Chen and M. Teboulle (the three-point
  identity, 1993); N. Cesa-Bianchi, A. Conconi and C. Gentile (online-to-batch conversion with
  high-probability bounds, 2004); S. J. Szarek and U. Haagerup (the sharp constants in
  Khintchine's inequality, 1976 and 1981).
