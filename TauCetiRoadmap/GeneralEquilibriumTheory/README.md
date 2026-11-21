# Roadmap: general equilibrium theory

**Summary.** A pure exchange economy has finitely many consumers and `ℓ` goods; consumer `i`
owns an endowment `ωᵢ` in the nonnegative orthant of `ℝ^ℓ` and ranks bundles of the orthant by a
utility function `uᵢ`. At prices `p` she may buy any nonnegative bundle costing at most the value
`p · ωᵢ` of her endowment, and she demands the best such bundles. A Walrasian equilibrium is a
price vector and a choice of demanded bundles whose sum is the total endowment. This roadmap
proves that equilibria exist, that they are efficient, that efficient allocations are equilibria
after a redistribution, and that in large economies the allocations no coalition can improve on
by trading among themselves are exactly the equilibrium allocations. There is no production. The
hypotheses on the utilities (continuity, quasiconcavity, monotonicity, local nonsatiation) are
stated theorem by theorem.

The main theorems are these.

- *Existence.* If every utility is continuous, quasiconcave, monotone and locally nonsatiated on
  the orthant and every endowment has all coordinates positive, a Walrasian equilibrium exists,
  with prices in the simplex. Without monotonicity a free-disposal equilibrium exists, in which
  total demand is at most the total endowment. Both come from the Gale–Nikaido–Debreu lemma on
  excess-demand correspondences, which is proved from Kakutani's fixed-point theorem.
- *The welfare theorems.* Under local nonsatiation every Walrasian allocation is Pareto optimal.
  Conversely, if the utilities are continuous, quasiconcave and locally nonsatiated, every Pareto
  optimal allocation is supported by a nonzero price vector at which each consumer's bundle
  minimizes expenditure over the bundles she likes at least as well: a quasi-equilibrium after
  redistribution. It is a Walrasian equilibrium when every consumer can afford a strictly cheaper
  bundle.
- *Core convergence (Debreu and Scarf).* Every Walrasian allocation is in the core. If the
  utilities are continuous and strictly monotone and the endowments have all coordinates
  positive, an allocation, given to all copies of each consumer, lies in the core of every
  replica economy if and only if it is a Walrasian allocation. When the utilities are also
  strictly quasiconcave, every core allocation of a replica economy treats copies of a consumer
  equally.

The consumer side (budget sets, Marshallian demand, local nonsatiation and budget exhaustion)
comes from ConsumerTheoryDuality. Kakutani's fixed-point theorem and Berge's maximum theorem come
from KakutaniFixedPointAndContinuousGames. Mathlib supplies the separating hyperplane theorem
for a convex set with nonempty interior, upper hemicontinuity of set-valued maps and
quasiconcave functions. The core of an exchange economy is not the core of a transferable-utility
game of CooperativeGames.

Layer 1 below sets up economies, allocations, Pareto optimality and three notions of equilibrium.
Layer 2 proves the Gale–Nikaido–Debreu lemma, and Layer 3 the existence theorems from it. Layer 4
proves the welfare theorems and the cheaper-point lemma, and Layer 5 the core results: Walrasian
allocations are in the core, equal treatment, and the Debreu–Scarf theorem.

## Conventions

- **Goods and bundles.** There are `ℓ` goods; a bundle is `x : Fin ℓ → ℝ` with the pointwise order,
  so `x ≤ y` means `xₖ ≤ yₖ` for every `k` and `x < y` means `x ≤ y` and `x ≠ y`. The consumption
  set of every consumer is the closed orthant `0 ≤ x` (`Set.Ici 0`). Distances are those of the sup
  norm.
- **Consumers.** Consumers form a finite type `ι`. Consumer `i` has a utility
  `u i : (Fin ℓ → ℝ) → ℝ`, of which only the values on the orthant enter, and an endowment
  `ω i : Fin ℓ → ℝ`. Continuity, quasiconcavity, monotonicity and strict monotonicity are
  `ContinuousOn`, `QuasiconcaveOn ℝ`, `MonotoneOn` and `StrictMonoOn` relative to `Set.Ici 0`. A
  quasiconcave function has convex sets `{x ≥ 0 | r ≤ u x}`, and then also convex sets
  `{x ≥ 0 | r < u x}` (Mathlib's `QuasiconcaveOn.convex_gt`).
- **Prices and incomes.** Prices are vectors `p : Fin ℓ → ℝ` of any sign; the value of `x` is
  `p ⬝ᵥ x`, and the income of consumer `i` is the value `p ⬝ᵥ ω i` of her endowment. Demand at
  `(p, m)` is ConsumerTheoryDuality's Marshallian demand, the set of maximizers of `u` on the
  budget set `{x | 0 ≤ x ∧ p ⬝ᵥ x ≤ m}`; it may be empty, and it is empty at `p = 0` for a locally
  nonsatiated utility, since the budget set is then the whole orthant. Equilibrium prices are only
  determined up to a positive factor (the budget set at `(t p, t m)` is the one at `(p, m)` for
  `t > 0`), and the existence and core theorems place them in the simplex `simplex (Fin ℓ)` of
  RegretMinimizationAndEquilibria, the weight vectors of Mathlib's `Convexity.StdSimplex`, which
  `Convexity.StdSimplex.range_toFun_comp_weights` identifies with `{p | 0 ≤ p ∧ ∑ k, p k = 1}`;
  it is empty for `ℓ = 0`.
- **Market clearing.** An allocation and a Walrasian equilibrium clear the markets exactly: the
  bundles sum to the total endowment. A free-disposal equilibrium allows a surplus. The two differ
  when a good can be in excess supply at price zero (the Checks of 1.3 and 3.2).
- **Coalitions and replicas.** A coalition is a nonempty finset of consumers. In the `n`-th
  replica of an economy with types `ι` the consumers are the pairs `(i, j)` of `ι × Fin n`, and
  consumer `(i, j)` has the utility and the endowment of type `i`; an assignment `x` of bundles to
  types is replicated by giving `x i` to every `(i, j)`.
- **Degenerate cases.** With no consumers every sum is `0`, the empty family is an allocation and
  is Pareto optimal and in the core. For `ℓ = 0` the orthant is one point, no utility is locally
  nonsatiated and no price lies in the simplex; the hypotheses `[Nonempty ι]` and `0 < ℓ` below
  exclude the cases where a statement would otherwise fail (the Checks of 2.1, 3.1, 4.3 and 5.4).

## Layer 1: exchange economies and equilibrium notions

### 1.1 Consumers

`budgetSet`, `LocallyNonsatiated` and `marshallianDemand` are ConsumerTheoryDuality's (its 1.1 and
1.2), copied verbatim into `Suggested.lean` with that citation. Local nonsatiation there is the
condition on the orthant: for every `x ≥ 0` and `ε > 0` some `z ≥ 0` with `dist z x < ε` has
`u x < u z`. Budget exhaustion, that every demanded bundle of a locally nonsatiated utility costs
its whole income, is ConsumerTheoryDuality's `dotProduct_eq_of_mem_marshallianDemand` (its 1.2),
used below.

Define `IsStrictlyQuasiconcave u`: for distinct `x, y ≥ 0` and `a, b > 0` with `a + b = 1`,
`min (u x) (u y) < u (a • x + b • y)`. This is the utility form of Border's strictly convex
preference (Border, *Second Welfare*, p. 6). A strictly quasiconcave utility is quasiconcave on
the orthant.

**Checks.**
- `min(x₁, x₂)` is quasiconcave but not strictly: `(1, 1)`, `(1, 2)` and their midpoint
  `(1, 3/2)` all have utility `1`.
- `x₁ + x₂` is not strictly quasiconcave: `(2, 0)`, `(0, 2)` and their midpoint all have utility
  `2`. `√(x₁ x₂)` is strictly quasiconcave on the interior of the orthant but not on the orthant:
  `(1, 0)`, `(2, 0)` and their midpoint all have utility `0`.

*Needs:* ConsumerTheoryDuality 1.1, 1.2 (the three definitions). (Proved here.)

### 1.2 Prices and allocations

Prices are normalized to `simplex (Fin ℓ)`, where `simplex` is RegretMinimizationAndEquilibria's
(its Conventions and Layer 1, 1.1), copied verbatim into `Suggested.lean` with that citation.
Define `IsAllocation ω x`: every `x i` is
nonnegative and `∑ i, x i = ∑ i, ω i`. Define `IsParetoOptimal u ω x`: `x` is an allocation and no
allocation `y` has `u i (x i) ≤ u i (y i)` for every `i` with strict inequality for some `i`
(Border, *Arrow–Debreu–McKenzie*, §5, p. 2, and §6, p. 3, with no producer).

**Checks.**
- `simplex (Fin 0)` is empty, since the empty sum is `0`; `simplex (Fin 1) = {1}`.
- With a satiated consumer, exact feasibility matters: for one consumer with `u = −(x₁ − 1)²` and
  `ω = (2, 0)`, the only allocation is `ω`, which is Pareto optimal with utility `−1`, while the
  bundle `(1, 0) ≤ ω` would be better if goods could be thrown away.

*Needs:* RegretMinimizationAndEquilibria, Layer 1, 1.1 (`simplex`); Mathlib `dotProduct`,
`Convexity.StdSimplex.range_toFun_comp_weights`. (Proved here.)

### 1.3 Walrasian, free-disposal and quasi-equilibria

Define, for utilities `u`, endowments `ω`, prices `p` and bundles `x`:

- `IsWalrasianEquilibrium u ω p x`: every `x i` lies in `marshallianDemand (u i) p (p ⬝ᵥ ω i)` and
  `∑ i, x i = ∑ i, ω i` (Border, *Arrow–Debreu–McKenzie*, §10, pp. 4–5, with the production set
  `{0}`);
- `IsFreeDisposalEquilibrium u ω p x`: every `x i` is demanded as above and
  `∑ i, x i ≤ ∑ i, ω i` (Border, *Arrow–Debreu–McKenzie*, §10, with the production set `−ℝ^ℓ₊`,
  for nonnegative prices);
- `IsQuasiEquilibrium u ω p x`: `p ≠ 0`, `x` is an allocation, and for every `i` the bundle `x i`
  lies in `budgetSet p (p ⬝ᵥ ω i)` and every `y ≥ 0` with `u i (x i) ≤ u i y` has
  `p ⬝ᵥ x i ≤ p ⬝ᵥ y`, that is, `x i` lies in ConsumerTheoryDuality's Hicksian demand
  `hicksianDemand (u i) p (u i (x i))` (its 1.3; Border, *Arrow–Debreu–McKenzie*, §10.1, p. 5,
  where preference maximization
  is replaced by expenditure minimization; here the budget condition is kept, as in the
  conclusion of Border, *Core*, Theorem 5, p. 3).

In a quasi-equilibrium every bundle costs exactly its income: the budget inequalities
`p ⬝ᵥ x i ≤ p ⬝ᵥ ω i` add up to an equality, so each is one. The condition `p ≠ 0` is part of the
definition, since `p = 0` satisfies the rest for every allocation.

**Checks.**
- The endowment can be a quasi-equilibrium and not an equilibrium. Two consumers with
  `u₁ = x₁ + x₂`, `u₂ = min(x₁, x₂)`, `ω₁ = (1, 0)`, `ω₂ = (2, 1)`, prices `p = (0, 1)` and `x = ω`:
  the cheapest bundles with `x₁ + x₂ ≥ 1` cost `0 = p ⬝ᵥ ω₁`, those with `min(x₁, x₂) ≥ 1` cost
  `1 = p ⬝ᵥ ω₂`, so `(p, ω)` is a quasi-equilibrium; but consumer 1 has income `0` and wants
  unboundedly much of the free good 1, so her demand is empty (Border, *Walrasian*, Assumption 3,
  p. 4).
- Exact and free-disposal clearing differ. One consumer with `u = x₁ − x₂` and `ω = (1, 1)`: at
  `p = (1, 0)` the demand is `{(1, 0)}`, so `(p, (1, 0))` is a free-disposal equilibrium and not a
  Walrasian one; with the price `(1, −1)` outside the simplex, `(1, 1)` is demanded and clears.

*Needs:* 1.1, 1.2; ConsumerTheoryDuality 1.1, 1.2. (Proved here.)

### Examples

Cobb–Douglas: `u₁ = x₁^(1/3) x₂^(2/3)` with `ω₁ = (1, 2)` and `u₂ = x₁^(1/2) x₂^(1/2)` with
`ω₂ = (2, 1)`. On the simplex the unique equilibrium price is `p = (7/17, 10/17)`; the incomes are
`27/17` and `24/17`, and the demands `(9/7, 9/5)` and `(12/7, 6/5)` add up to `(3, 3)`. Leontief:
`u₁ = u₂ = min(x₁, x₂)` with the same endowments. Every price of the simplex is an equilibrium
price: for `p ≫ 0` consumer `i` demands `(p ⬝ᵥ ωᵢ)(1, 1)` and the incomes add up to `3`; at
`p = (1, 0)` the demands are `{(1, y) | y ≥ 1}` and `{(2, y) | y ≥ 2}`, and `(1, 1)`, `(2, 2)`
clear.

### Dependencies

ConsumerTheoryDuality 1.1 and 1.2 (definitions); RegretMinimizationAndEquilibria 1.1 (`simplex`);
Mathlib. No other layer.

## Layer 2: the Gale–Nikaido–Debreu lemma

### 2.1 Free-disposal equilibrium prices of an excess-demand correspondence

Prove `gale_nikaido_debreu`: let `ℓ ≥ 1` and `ζ : (Fin ℓ → ℝ) → Set (Fin ℓ → ℝ)` be upper
hemicontinuous on the price simplex `Δ` (Mathlib's `UpperHemicontinuousOn ζ Δ`, relative to `Δ`),
with nonempty, convex and compact values at every `p ∈ Δ`, and let Walras' law hold in the weak
form: `p ⬝ᵥ z ≤ 0` for every `p ∈ Δ` and `z ∈ ζ p`. Then some `p ∈ Δ` and `z ∈ ζ p` have `z ≤ 0`
(Border, *Walrasian*, Gale–Debreu–Nikaidô Lemma, p. 11, stated there and referred to Border's
book; the single-valued case with its proof is Border, *Fixed point theory*, 5.3 and 5.4, p. 11;
the proof from Kakutani's theorem is proved here).

Route. The image `ζ(Δ)` is compact, as the image of a compact set under an upper hemicontinuous
correspondence with compact values (Border, *Correspondences*, Proposition 35, p. 13; the proof
there is a covering argument that works relative to `Δ`), so it lies in a closed box `Z`. On
`K = Δ ×ˢ Z` in `(Fin ℓ → ℝ) × (Fin ℓ → ℝ)` let `φ (p, z)` be the product of the set of
`q ∈ Δ` maximizing `q ⬝ᵥ z` over `Δ` and the set `ζ p`. Its values are nonempty and convex and lie
in `K`. Its graph over `K` is closed: the first factor because `(q, z) ↦ q ⬝ᵥ z` is continuous and
`Δ` is compact, the second because an upper hemicontinuous correspondence with closed values into
the regular space `Fin ℓ → ℝ` has a closed graph over the closed set `Δ` (Mathlib's
`upperHemicontinuousWithinAt_iff_forall_isOpen`, separating a limit point from a closed value by
disjoint open sets; equivalently KakutaniFixedPointAndContinuousGames 1.1 on the subspaces `Δ`
and `Z`). Kakutani's theorem gives `(p, z) ∈ φ (p, z)`: `z ∈ ζ p`, and every `q ∈ Δ` has
`q ⬝ᵥ z ≤ p ⬝ᵥ z ≤ 0`. Taking for `q` the unit vectors gives `z ≤ 0`.

**Checks.**
- `ℓ ≥ 1` is needed: for `ℓ = 0` the simplex is empty, every hypothesis holds and the conclusion
  fails.
- Walras' law is needed: on `ℓ = 2` the constant `ζ p = {(1, 1)}` has `p ⬝ᵥ z = 1` and no
  `z ≤ 0`.
- Convex values are needed. On `ℓ = 2` write `p = (t, 1 − t)` and let `ζ p = {(1 − t, −t)}` for
  `t < 1/2`, `{(t − 1, t)}` for `t > 1/2`, and both points for `t = 1/2`. The graph is closed, the
  values are compact and `p ⬝ᵥ z = 0`, but `(1 − t, −t) ≤ 0` only at `t = 1` and `(t − 1, t) ≤ 0`
  only at `t = 0`, outside their ranges, and neither value at `t = 1/2` is `≤ 0`.
- Upper hemicontinuity is needed: with the value at `t = 1/2` reduced to `{(1/2, −1/2)}` the
  values are convex, and there is still no `z ≤ 0`.

*Needs:* 1.2 (`simplex`); KakutaniFixedPointAndContinuousGames 3.1 (`kakutani_fixedPoint`); Mathlib
`UpperHemicontinuousOn`, `upperHemicontinuousWithinAt_iff_forall_isOpen`,
`Metric.isCompact_of_isClosed_isBounded`, `IsCompact.exists_isMaxOn`, `Convex`.

### Examples

For `ℓ = 1` the simplex is `{1}` and the lemma says that some `z ∈ ζ 1` is `≤ 0`, which is Walras'
law at `p = 1`.

### Dependencies

Layer 1 (the simplex of 1.2 only); KakutaniFixedPointAndContinuousGames 3.1; Mathlib.

## Layer 3: existence of equilibrium

### 3.1 Free-disposal equilibrium

Prove `exists_isFreeDisposalEquilibrium`: if `ι` is nonempty and every `u i` is continuous,
quasiconcave and locally nonsatiated on the orthant, and `0 < ω i k` for all `i` and `k`, then
some `p ∈ simplex (Fin ℓ)` and some `x` form a free-disposal equilibrium (Border, *Walrasian*,
Theorem 1, p. 1, and the outline of its proof, Steps 1–5, pp. 10–11, with the production set
`−ℝ^ℓ₊`; Border assumes nonsatiation and convex preferences, which with convex consumption sets
give local nonsatiation, p. 2; the details of the steps Border leaves open are proved here).

Route, by truncation, since demand may be empty or unbounded at prices with a zero coordinate.

1. Fix `c` larger than every coordinate of `∑ i, ω i` and let `φᵢ p` be the bundles `0 ≤ x` with
   `xₖ ≤ c` for all `k` and `p ⬝ᵥ x ≤ p ⬝ᵥ ω i`. For every `p` it contains `ω i`, so it is nonempty,
   and it is compact. It is upper hemicontinuous everywhere, its graph being closed in a compact
   box. At `p ∈ Δ` it is lower hemicontinuous, because `0` costs `0 < p ⬝ᵥ ω i`: a point of `φᵢ p`
   moved slightly towards `0` is affordable at all nearby prices (as for Border, *Correspondences*,
   Example 30, pp. 10–11).
2. Berge's maximum theorem (KakutaniFixedPointAndContinuousGames 2.2, with the continuous objective
   `(p, x) ↦ u i x` on the graph) makes the truncated demand `ξᵢ p`, the argmax of `u i` on `φᵢ p`,
   upper hemicontinuous at every `p ∈ Δ` with nonempty compact values; its values are convex since
   `u i` is quasiconcave.
3. The correspondence `ζ p = ∑ i, ξᵢ p − {∑ i, ω i}` (sum of sets) is upper hemicontinuous on `Δ`
   with nonempty convex compact values: a finite sum of upper hemicontinuous correspondences with
   compact values is one (Border, *Correspondences*, Proposition 36(a), p. 13, whose proof is left
   to the reader there; it follows from the tube lemma and the continuity of addition). Every
   `z ∈ ζ p` has `p ⬝ᵥ z ≤ 0`, each truncated demand being affordable.
4. Layer 2 gives `p ∈ Δ` and `xᵢ ∈ ξᵢ p` with `∑ i, xᵢ ≤ ∑ i, ω i`, so every coordinate of `xᵢ` is
   below `c`.
5. Each `xᵢ` is in the true demand. If `y` is affordable with `u i y > u i xᵢ`, move it slightly
   towards the cheap bundle `ε • 1` to get an affordable `y'` with all coordinates positive and
   still `u i y' > u i xᵢ`. The convex set `P = {w ≥ 0 | u i xᵢ < u i w}` then contains `y'` in its
   interior (continuity of `u i` on the open set of positive bundles) and `xᵢ` in its closure
   (local nonsatiation), so the open segment from `xᵢ` to `y'` lies in the interior of `P`
   (Mathlib's `Convex.openSegment_closure_interior_subset_interior`). Its points near `xᵢ` are
   affordable and below `c`, and are better than `xᵢ`: a contradiction with `xᵢ ∈ ξᵢ p`.

**Checks.**
- Positive endowments are needed. In the economy of the first Check of 1.3 (`ω₁ = (1, 0)` is on
  the boundary), consumer 1's utility is strictly increasing, so her demand is empty at a price of
  the simplex with a zero coordinate; at `p = (t, 1 − t)` with `0 < t < 1` consumer 2 demands
  `(1 + t)(1, 1)`, more of good 2 than the total `1` (Border, *Walrasian*, Assumption 3, p. 4). So
  there is no free-disposal equilibrium, and no Walrasian one, while all other hypotheses hold.
- Quasiconcavity is needed. Two consumers with `ω₁ = ω₂ = (1, 1)`,
  `u₁ = max(min(x₁, x₂/2), min(x₁/2, x₂))` (continuous, monotone, locally nonsatiated, not
  quasiconcave) and `u₂ = min(x₁, x₂)`. For `p ≫ 0` in the simplex consumer 2 demands exactly
  `(1, 1)`, so consumer 1 could receive at most `(1, 1)`, of utility `1/2`, while some affordable
  bundle is better: at `p = (t, 1 − t)` the affordable bundle `(a, 2a)` with `a = 1/(2 − t)` has
  utility `a > 1/2` (at `p = (1/2, 1/2)` it is `(2/3, 4/3)`, of utility `2/3`). At `p = (1, 0)`
  consumer 1 needs `x₂ ≥ 2` and consumer 2 needs `x₂ ≥ 1`, more than the total `2`, and
  symmetrically at `(0, 1)` (Border, *Walrasian*, Assumption 2c, p. 4).
- With no consumer and `ℓ = 0` every hypothesis holds and the simplex is empty, so the conclusion
  fails; `[Nonempty ι]` excludes this, and with a consumer local nonsatiation forces `ℓ ≥ 1`.

*Needs:* 1.1–1.3, 2.1; ConsumerTheoryDuality 1.1, 1.2; KakutaniFixedPointAndContinuousGames 2.2
(`berge_maximum_theorem`); Mathlib `UpperHemicontinuousAt.of_sequences` (step 1),
`UpperHemicontinuousAt.upperHemicontinuousWithinAt`,
`lowerHemicontinuousAt_iff`, `QuasiconcaveOn`, `QuasiconcaveOn.convex_gt`,
`Convex.openSegment_closure_interior_subset_interior`, `IsCompact.add`, `Convex.add`,
`Metric.isCompact_of_isClosed_isBounded`.

### 3.2 Walrasian equilibrium

Prove `exists_isWalrasianEquilibrium`: under the hypotheses of 3.1 and monotonicity of every `u i`
on the orthant, some `p ∈ simplex (Fin ℓ)` and some `x` form a Walrasian equilibrium with exact
market clearing (Border, *Walrasian*, Theorem 1, p. 1, and Step 5, p. 11, for the passage from
a surplus to an equilibrium of his model with production, where the disposal technology
absorbs it; for the exchange economy the surplus is given to a consumer instead, proved here).

Route. Take the free-disposal equilibrium `(p, x)` of 3.1 and the surplus
`s = ∑ i, ω i − ∑ i, x i ≥ 0`. By budget exhaustion (ConsumerTheoryDuality 1.2) each `x i` costs
`p ⬝ᵥ ω i`, so `p ⬝ᵥ s = 0`, and as `p ≥ 0` and `s ≥ 0` every good in surplus has price zero. Give
`s` to one consumer `i₀`: `x i₀ + s` costs `p ⬝ᵥ x i₀`, and by monotonicity it is at least as good
as `x i₀`, so it is demanded, and the markets now clear exactly.

**Checks.**
- Monotonicity is needed for exact clearing. One consumer with `u = x₁ − x₂` (continuous,
  quasiconcave, locally nonsatiated, not monotone) and `ω = (1, 1)`: at `p = (t, 1 − t)` with
  `t > 0` her demand is `{(1/t, 0)}` and at `t = 0` it is empty, so the market for good 2 never
  clears exactly, while `p = (1, 0)` gives a free-disposal equilibrium (the second Check of 1.3).
- The equilibrium price need not be unique, nor demand single-valued: in the Leontief example of
  Layer 1 every price of the simplex is an equilibrium price, and at `p = (1, 0)` the demands are
  half-lines. No strict convexity is assumed anywhere in this layer.
- For `ℓ = 1` the simplex is `{1}` and the equilibrium is `x = ω`: each consumer's demand at
  `p = 1` is `{ω i}`, contained in it by budget exhaustion and containing `ω i` by monotonicity.

*Needs:* 3.1; ConsumerTheoryDuality 1.2 (`dotProduct_eq_of_mem_marshallianDemand`); Mathlib
`MonotoneOn`.

### Examples

In the Cobb–Douglas economy of Layer 1 the hypotheses of 3.2 hold, and the price `(7/17, 10/17)`
is the only one in the simplex: the excess demand for good 1 is `(7/6 − 17t/6)/t` at `(t, 1 − t)`,
with the single zero `t = 7/17`.

### Dependencies

3.1 uses Layers 1 and 2, ConsumerTheoryDuality 1.1 and 1.2, KakutaniFixedPointAndContinuousGames
2.2 and Mathlib; 3.2 uses 3.1 and ConsumerTheoryDuality 1.2.

## Layer 4: the welfare theorems

### 4.1 The first welfare theorem

Prove `isParetoOptimal_of_isWalrasianEquilibrium`: if every `u i` is locally nonsatiated, the
allocation of a Walrasian equilibrium `(p, x)` is Pareto optimal; no sign condition on `p` and no
continuity is needed (Border, *First Welfare*, First Welfare Theorem, p. 1, and Lemma 1, p. 3).

Route. A demanded `x i` makes every `y ≥ 0` with `u i (x i) ≤ u i y` cost at least the income,
since otherwise local nonsatiation gives a better affordable bundle near `y`; and every `y` with
`u i (x i) < u i y` costs more than the income. Summed over a Pareto improvement `y`, this gives
`p ⬝ᵥ ∑ y > p ⬝ᵥ ∑ ω`, against `∑ y = ∑ ω`.

**Checks.**
- Local nonsatiation is needed. Two consumers with `u₁ = 0`, `u₂ = x₁ + x₂`,
  `ω₁ = ω₂ = (1, 1)` and `p = (1/2, 1/2)`: consumer 1 demands her whole budget set and consumer 2
  the line `x₁ + x₂ = 2`, so `x = ω` is an equilibrium; giving `(2, 2)` to consumer 2 raises `u₂`
  from `2` to `4` and leaves `u₁` at `0`.
- With no consumer the empty allocation is Pareto optimal, as the statement requires.

*Needs:* 1.1–1.3; ConsumerTheoryDuality 1.1, 1.2.

### 4.2 The cheaper-point lemma

Prove `isWalrasianEquilibrium_of_isQuasiEquilibrium`: if every `u i` is continuous on the
orthant, `(p, x)` is a quasi-equilibrium, and every consumer has a bundle `y ≥ 0` with
`p ⬝ᵥ y < p ⬝ᵥ ω i`, then `(p, x)` is a Walrasian equilibrium (Border, *Second Welfare*, the
statement of the theorem, p. 1, where the role of the cheaper point is stated without proof;
proved here).

Route. Each `x i` costs exactly `p ⬝ᵥ ω i` (1.3). If an affordable `y` had `u i y > u i (x i)`,
the points of the segment from `y` towards the cheaper bundle would be strictly cheaper than
`x i` and, near `y`, still better, by continuity: against expenditure minimization.

**Checks.**
- The cheaper point is needed: in the first Check of 1.3 consumer 1 has income `0` at `p = (0, 1)`
  and no bundle is cheaper than `0`; the quasi-equilibrium is not an equilibrium.
- If `p ≥ 0`, `p ≠ 0` and `ω i` has positive coordinates, `0` is a cheaper point; this is how
  5.4 uses the lemma.

*Needs:* 1.1–1.3; Mathlib `ContinuousOn`.

### 4.3 The second welfare theorem

Prove `exists_isQuasiEquilibrium_of_isParetoOptimal`: if `ι` is nonempty and every `u i` is
continuous, quasiconcave and locally nonsatiated on the orthant, every Pareto optimal allocation
`x` of `ω` is a quasi-equilibrium of the economy with endowments `x`: there is `p ≠ 0` such that
every `y ≥ 0` with `u i (x i) ≤ u i y` has `p ⬝ᵥ x i ≤ p ⬝ᵥ y`. With 4.2, `(p, x)` is a Walrasian
equilibrium of that economy when every consumer can afford a bundle cheaper than `p ⬝ᵥ x i`
(Border, *Second Welfare*, Second Welfare Theorem, p. 1, proof p. 2, Lemma 2, p. 6, and Lemma 5,
p. 7, with no producer).

Route. Let `Pᵢ = {y ≥ 0 | u i (x i) < u i y}`; it is convex (quasiconcavity), nonempty (local
nonsatiation), and has nonempty interior: it contains a bundle with positive coordinates, near
which it is open by continuity. The sum `S = ∑ i, Pᵢ` is convex with nonempty interior and does
not contain `∑ i, ω i`, since a point of it would be a Pareto improvement on `x`; here `ι` is
nonempty. Mathlib's `geometric_hahn_banach_of_nonempty_interior_point` gives `p ≠ 0` with
`p ⬝ᵥ s ≥ p ⬝ᵥ ∑ i, x i` on `S`. Each `x j` lies in the closure of `Pⱼ` by local nonsatiation, so
`p ⬝ᵥ y ≥ p ⬝ᵥ x i` for `y ∈ Pᵢ`, and again by local nonsatiation for every `y ≥ 0` with
`u i (x i) ≤ u i y`.

**Checks.**
- Quasiconcavity is needed. Total endowment `(1, 1)`, `u₁ = x₁² + x₂²`, `u₂ = min(x₁, x₂)`, and the
  Pareto optimal allocation `x₁ = (d, d)`, `x₂ = (1 − d, 1 − d)` with `0 < d < 1`. A price with a
  negative coordinate makes the upper contour set of `x₂` contain bundles of arbitrarily negative
  value. For `p ≥ 0` the cheapest bundle `y ≥ 0` with `u₁ y ≥ 2d²` costs `√2 d · min(p₁, p₂)`,
  less than `p ⬝ᵥ (d, d) = d (p₁ + p₂)`. So no `p ≠ 0` supports `x`; for `d = 1/2` and `|p| = 1`
  (Euclidean length) the shortfall is at least `0.207`.
- `[Nonempty ι]` is needed: with no consumer and `ℓ = 0` there is no `p ≠ 0`.
- In the Cobb–Douglas box of 5.1 (`√(x₁ x₂)` for both, total `(4, 4)`), the Pareto optimal
  allocation `(t, t)`, `(4 − t, 4 − t)` is supported by `p = (1/2, 1/2)`, and `0` is a cheaper
  point for both consumers when `0 < t < 4`.

*Needs:* 1.1–1.3; Mathlib `geometric_hahn_banach_of_nonempty_interior_point`,
`QuasiconcaveOn.convex_gt`, `Convex.add`, `ContinuousOn`.

### Examples

In the Cobb–Douglas economy of Layer 1 the equilibrium allocation `(9/7, 9/5)`, `(12/7, 6/5)` is
Pareto optimal by 4.1; by 4.3 and 4.2, with the endowments moved to it, the price
`(7/17, 10/17)` supports it again.

### Dependencies

4.1 and 4.2 use Layer 1 and ConsumerTheoryDuality 1.1 and 1.2; 4.3 uses Layer 1 and Mathlib's
separation theorem. No layer above.

## Layer 5: the core and replica economies

### 5.1 The core and replicas

Define `IsInCore u ω x`: `x` is an allocation, and there is no nonempty finset `S` of consumers
and family `y` with `y a ≥ 0` and `u a (x a) < u a (y a)` for `a ∈ S` and
`∑ a ∈ S, y a = ∑ a ∈ S, ω a`. Blocking here requires every member to gain strictly (Border,
*Core*, definitions before Lemma 1, p. 1, with Border's "blocked"; the weak form, with one strict
gain, gives the same core under continuous strictly monotone preferences, Lemma 1 there). Define
`replica f n : ι × Fin n → α` by `replica f n (i, j) = f i`; the `n`-th replica economy has the
utilities `replica u n` and the endowments `replica ω n` (Border, *Core*, Definition 3, p. 2).

**Checks.**
- The core consists of individually rational allocations: the coalition `{i}` blocks `x` when
  `u i (x i) < u i (ω i)`.
- The core of an economy with one consumer is `{ω}`; with no consumer it contains the empty
  allocation.
- In the Cobb–Douglas box (`√(x₁ x₂)` for both, `ω₁ = (3, 1)`, `ω₂ = (1, 3)`), the core
  allocations on the diagonal are `(t, t)`, `(4 − t, 4 − t)` with `√3 ≤ t ≤ 4 − √3`, the
  individually rational part of the contract curve.

*Needs:* 1.2. (Proved here.)

### 5.2 Walrasian allocations are in the core

Prove `isInCore_of_isWalrasianEquilibrium`: the allocation of a Walrasian equilibrium `(p, x)`,
at any price vector, is in the core, with no hypothesis on the utilities (Border, *Core*,
Theorem 2, p. 1, proof p. 2, which assumes local nonsatiation; with blocking by strict gains the
route below does not use it).

Route. A blocking member strictly prefers `y a` to the demanded `x a`, so `y a` is not affordable:
`p ⬝ᵥ y a > p ⬝ᵥ ω a`. Summing over the coalition contradicts
`∑ a ∈ S, y a = ∑ a ∈ S, ω a`.

**Checks.**
- Strict gains matter. In the first Check of 4.1 the equilibrium allocation `ω` is in the core,
  as the theorem says, although it is not Pareto optimal: the coalition `{1, 2}` improves consumer
  2 strictly and consumer 1 only weakly, which is not blocking.
- In the Cobb–Douglas box of 5.1 the Walrasian allocation `t = 2` (at `p = (1/2, 1/2)`) lies in
  the interval `[√3, 4 − √3]`.

*Needs:* 1.1–1.3, 5.1; ConsumerTheoryDuality 1.1, 1.2.

### 5.3 Equal treatment

Prove `replica_equal_treatment`: if every `u i` is continuous, strictly monotone and strictly
quasiconcave on the orthant, then for every `n` and every `x` in the core of the `n`-th replica
economy, `x (i, j) = x (i, k)` for all `i`, `j`, `k` (Border, *Core*, Lemma 4, p. 2, proof
pp. 2–3).

Route. For each type pick a copy with the least utility. The coalition of these copies, one per
type, can give type `i` the average `(1/n) ∑ j, x (i, j)`: the averages add up to `∑ i, ω i`. By
strict quasiconcavity the average is strictly better than the worst bundle for a type treated
unequally, and by quasiconcavity at least as good for the others. To make every gain strict,
take a small fraction of the strictly improving average (nonzero, since it beats a bundle `≥ 0`
under strict monotonicity) and share it among the other members, if there are any: continuity
keeps the first strictly better, strict monotonicity makes the others strictly better.

**Checks.**
- Strict quasiconcavity is needed. Both types with `u = x₁ + x₂`, `ω₁ = (1, 2)`, `ω₂ = (2, 1)`,
  `n = 2`: the two copies of type 1 receive `(3, 0)` and `(0, 3)`, those of type 2 receive
  `(3/2, 3/2)` each. The bundles add up to `(6, 6)`, and at `p = (1/2, 1/2)` every consumer's
  income is `3/2` and her demand is the line `x₁ + x₂ = 3`, so this is a Walrasian allocation of the
  replica, in its core by 5.2, with unequal treatment.
- For `n = 0` and `n = 1` the statement holds trivially.

*Needs:* 1.1, 1.2, 5.1; Mathlib `QuasiconcaveOn`, `Convex.sum_mem`, `StrictMonoOn`,
`ContinuousOn`.

### 5.4 The Debreu–Scarf theorem

Prove `forall_replica_isInCore_iff`: let `ℓ ≥ 1`, let every `u i` be continuous and strictly
monotone on the orthant, and let `0 < ω i k` for all `i` and `k`. For an assignment
`x : ι → Fin ℓ → ℝ` of bundles to types, `replica x n` is in the core of the `n`-th replica
economy for every `n ≥ 1` if and only if `(p, x)` is a Walrasian equilibrium for some
`p ∈ simplex (Fin ℓ)` (Border, *Core*, Theorem 5, p. 3, proof pp. 3–5, and Definition 6, p. 5,
where such an `x` is called an Edgeworth equilibrium; the converse direction is Theorem 2 there
applied to each replica).

The statement differs from Border's in three ways, each forced or given by the route below. Border
assumes strictly convex preferences. His proof writes a point of the convex hull below with one net
trade per type, which is where the convexity of each `Pᵢ` enters, so that the blocking coalition
gives all its members of a type one bundle; the route below lets members of one type receive
different bundles and does not use convexity, which is needed only for equal treatment (5.3), the
result that makes "the core of every replica" a statement about assignments to types. Border
concludes a quasi-equilibrium; with positive endowments 4.2 upgrades it to an equilibrium. Border's
proof infers from continuity that the sets of improving net trades `Pᵢ` are open in `ℝ^ℓ`, which
fails at net trades leading to the boundary of the orthant (the last Check below); the assumption
that the endowments have positive coordinates repairs that step, as the route shows. Combined with
5.3, the theorem says that under strict quasiconcavity the cores of the replica economies, read as
assignments to types, decrease to the set of Walrasian allocations.

Route. Strict monotonicity and `ℓ ≥ 1` give local nonsatiation. The converse direction: an
equilibrium `(p, x)` gives the equilibrium `(p, replica x n)` of every replica, which 5.2 puts in
its core. For the direct direction with no consumer every price of the simplex works; otherwise
let `Pᵢ` be the net trades `z` with `ω i + z ≥ 0` and `u i (x i) < u i (ω i + z)`, and `P` the
convex hull of their union.

1. `0 ∉ P`. Otherwise `0 = ∑ⱼ αⱼ zⱼ`, a convex combination of finitely many points `zⱼ ∈ P_{i(j)}`
   (several may share a type). For small `t > 0` the points `zⱼ − t (ω_{i(j)} + zⱼ)` stay in their
   sets by continuity, and their combination with the weights `αⱼ` is `v = −t ∑ⱼ αⱼ ω_{i(j)}`,
   which has negative coordinates since the endowments have positive ones. Rational weights
   `kⱼ / n` close to `αⱼ` keep the combination `v'` negative in every coordinate. In the `n`-th
   replica the coalition of `kⱼ` copies of type `i(j)` for each `j` (at most `n` copies of each
   type, since `∑ kⱼ = n`), each receiving `ω_{i(j)} + zⱼ − t (ω_{i(j)} + zⱼ) − v'`, is feasible
   and, by strict monotonicity, blocks `replica x n`.
2. `P` is convex with nonempty interior (each `Pᵢ` contains `x i + 1 − ω i` and, by continuity, a
   neighbourhood of it), so Mathlib's `geometric_hahn_banach_of_nonempty_interior_point` gives
   `p ≠ 0` with `p ⬝ᵥ z ≥ 0` on `P`. Hence `p ⬝ᵥ y ≥ p ⬝ᵥ ω i` whenever `u i (x i) < u i y`, and by
   local nonsatiation whenever `u i (x i) ≤ u i y`; with `∑ x = ∑ ω` (the core of the first
   replica) every `x i` costs exactly `p ⬝ᵥ ω i`. Strict monotonicity gives `p ≥ 0`, and dividing by
   `∑ k, p k > 0` puts `p` in the simplex: `(p, x)` is a quasi-equilibrium.
3. `0` is a cheaper point, since `p ⬝ᵥ ω i > 0`; 4.2 makes `(p, x)` an equilibrium.

**Checks.**
- In the Cobb–Douglas box of 5.1, for a coalition of `k₁` copies of type 1 and `k₂` of type 2 the
  best utilities satisfy `k₁ u₁ + k₂ u₂ = √((3k₁ + k₂)(k₁ + 3k₂))`, so the diagonal allocation `t`
  is in the core of the `n`-th replica iff `k₁ t + k₂ (4 − t) ≥ √((3k₁ + k₂)(k₁ + 3k₂))` for all
  `0 ≤ k₁, k₂ ≤ n`, not both `0` (a blocking plan may be taken equal within each type, by concavity
  of `√(x₁ x₂)`). The core interval is `[√3, 4 − √3] ≈ [1.732, 2.268]` for `n = 1`,
  `[√35 − 4, 8 − √35] ≈ [1.916, 2.084]` for `n = 2`, and about `[1.977, 2.023]` for `n = 6`; the
  Walrasian allocation `t = 2` (at `p = (1/2, 1/2)`) lies in all of them.
- An explicit block: `t = 1.8` is in the core of the economy but not of its second replica. Two
  copies of type 1 and one of type 2 own `(7, 5)`; giving `(2.15, 1.55)` to each type-1 copy
  (utility `√3.3325 ≈ 1.8255 > 1.8`) and `(2.7, 1.9)` to the type-2 copy (utility
  `√5.13 ≈ 2.2650 > 2.2`) uses exactly `(7, 5)`.
- `ℓ ≥ 1` is needed: for `ℓ = 0` every hypothesis holds, every replica allocation is in its core,
  and the simplex is empty.
- No convexity is needed, and blocking coalitions may treat copies of a type unequally. One type
  with `u = x₁² + x₂²` (continuous, strictly monotone, not quasiconcave) and `ω = (1, 1)`: at
  `p = (t, 1 − t)` with `0 < t < 1` the budget triangle has the vertices `(1/t, 0)` and
  `(0, 1/(1 − t))`, one of utility at least `4 > 2 = u (1, 1)`, and at `t ∈ {0, 1}` demand is
  empty, so there is no equilibrium. Accordingly `ω` is in the core of the economy (its only
  allocation) but not of the second replica, where two copies take `(2, 0)` and `(0, 2)`, of
  utility `4` each.
- The sets `Pᵢ` need not be open. One type with `u = √x₁ + √x₂` (continuous, strictly monotone,
  strictly quasiconcave) and `ω = x = (1, 1)`, a Walrasian allocation at `p = (1/2, 1/2)`: the net
  trade `(3.1, −1)` is improving, since `(4.1, 0)` has utility `√4.1 ≈ 2.025 > 2`, while
  `(3.1, −1 − δ)` leaves the orthant for every `δ > 0`.

*Needs:* 1.1–1.3, 4.2, 5.1, 5.2; Mathlib `geometric_hahn_banach_of_nonempty_interior_point`,
`convexHull`, `StrictMonoOn`, `Rat.denseRange_cast`.

### Examples

In the Cobb–Douglas box the formula of the first Check of 5.4 singles out `t = 2`: every other
diagonal allocation is blocked in some replica, and `t = 2` is the Walrasian allocation. The
theorem itself does not apply there, since `√(x₁ x₂)` is not strictly monotone on the orthant
(`(1, 0)` and `(2, 0)` both have utility `0`).

### Dependencies

5.1 uses Layer 1; 5.2 uses 5.1, Layer 1 and ConsumerTheoryDuality 1.1 and 1.2; 5.3 uses 5.1 and
Layer 1; 5.4 uses 4.2, 5.1, 5.2 and Mathlib's separation theorem.

## Scope and ownership

This roadmap owns the targets stated above: allocations, Pareto optimality and the three
equilibrium notions of an exchange economy; the Gale–Nikaido–Debreu lemma; the existence of
free-disposal and Walrasian equilibria; the first welfare theorem, the cheaper-point lemma and
the second welfare theorem; the core of an exchange economy, replica economies, the inclusion of
Walrasian allocations in the core, equal treatment and the Debreu–Scarf theorem.

Already in the libraries and therefore not targets: Mathlib's upper and lower hemicontinuity of
set-valued maps (`UpperHemicontinuousOn` and its open-set characterization), quasiconcave
functions with their convex strict superlevel sets (`QuasiconcaveOn.convex_gt`), the open
segment lemma `Convex.openSegment_closure_interior_subset_interior`, and the separation of a point
from a convex set with nonempty interior (`geometric_hahn_banach_of_nonempty_interior_point`).

Neighbouring roadmaps:

- ConsumerTheoryDuality owns budget sets, local nonsatiation on the orthant, the Marshallian
  demand and budget exhaustion (its 1.1 and 1.2); they are cited above and their definitions are
  copied verbatim. A consumer is a utility function, in the vocabulary of that roadmap. Its
  Hicksian demand (its 1.3) is the expenditure-minimization clause of a quasi-equilibrium.
- RegretMinimizationAndEquilibria defines the probability simplex `simplex` (its Conventions and
  Layer 1, 1.1), copied verbatim here for the normalized prices.
- UtilityRepresentationTheorems owns preference relations and their utility representations. Its
  2.3, Debreu's theorem, gives a continuous utility for a continuous total preorder on a
  second-countable space such as the orthant, so the statements here apply to continuous
  preferences through it; nothing of it is used, and this roadmap does not depend on that one.
- KakutaniFixedPointAndContinuousGames supplies Kakutani's theorem (its 3.1), used in 2.1, and
  Berge's maximum theorem (its 2.2), used in 3.1; its closed graph theorem (its 1.1) is an
  alternative step in 2.1. It lists Walrasian equilibrium and general equilibrium theory as
  outside its scope.
- CooperativeGames defines the core of a transferable-utility game (its 2.1) as the payoff vectors
  that no coalition's worth exceeds. The core here is a set of allocations of goods, blocked when a
  coalition can make every member strictly better with its own endowments: the core of a game
  without transferable utility, which that roadmap leaves out. Nothing of it is used.

Outside the scope: production and private ownership of firms; consumption sets other than the
orthant; uniqueness of equilibrium (gross substitutes) and its stability under price dynamics;
the structure of excess demand functions (Sonnenschein–Mantel–Debreu); economies with a continuum
of consumers and the Aumann core equivalence; core nonemptiness for games without transferable
utility; markets with indivisible goods; and every procedure for computing an equilibrium.

## Exact supplier contracts

### From Mathlib

- `Mathlib/Data/Matrix/Mul.lean`: `dotProduct` (notation `⬝ᵥ`).
- `Mathlib/Topology/Semicontinuity/Defs.lean`: `UpperHemicontinuousOn f s` (for `x ∈ s`, every
  neighbourhood of `f x` is a neighbourhood of `f x'` for `x'` near `x` in `s`),
  `UpperHemicontinuousAt`, `UpperHemicontinuousAt.upperHemicontinuousWithinAt`,
  `LowerHemicontinuousAt`, `lowerHemicontinuousAt_iff` (every open set meeting `f x` meets `f x'`
  for `x'` near `x`).
- `Mathlib/Topology/Semicontinuity/Hemicontinuity.lean`:
  `upperHemicontinuousWithinAt_iff_forall_isOpen` (for every open `u ⊇ f x`, `f x' ⊆ u` for `x'`
  near `x` within `s`).
- `Mathlib/Analysis/Convex/Quasiconvex.lean`: `QuasiconcaveOn 𝕜 s f` (every superlevel set
  `{x ∈ s | r ≤ f x}` is convex); `QuasiconcaveOn.convex_gt` (every strict superlevel set is
  convex).
- `Mathlib/Analysis/Convex/Topology.lean`: `Convex.openSegment_closure_interior_subset_interior`
  (for convex `s`, a point of the closure and a point of the interior span an open segment inside
  the interior).
- `Mathlib/Analysis/LocallyConvex/Separation.lean`:
  `geometric_hahn_banach_of_nonempty_interior_point` (if `A` is convex with nonempty interior and
  `x ∉ interior A`, some continuous linear `f ≠ 0` has `f a ≤ f x` on `A`).
- `Mathlib/Analysis/Convex/Basic.lean`, `Mathlib/Analysis/Convex/Combination.lean`: `Convex`,
  `Convex.add`, `Convex.sum_mem`; `Mathlib/Analysis/Convex/Hull.lean`: `convexHull`.
- `Mathlib/Topology/Algebra/Monoid.lean`: `IsCompact.add` (the additive form of `IsCompact.mul`:
  a sum of two compact sets is compact). `Mathlib/Topology/MetricSpace/Bounded.lean`:
  `Metric.isCompact_of_isClosed_isBounded`; `Mathlib/Topology/Order/Compact.lean`:
  `IsCompact.exists_isMaxOn`.
- `Mathlib/Order/Monotone/Defs.lean`: `MonotoneOn`, `StrictMonoOn`.
  `Mathlib/Topology/Defs/Filter.lean`: `ContinuousOn`.
  `Mathlib/Topology/Algebra/Order/Archimedean.lean`: `Rat.denseRange_cast` (the rationals are dense
  in `ℝ`), used for the rational weights of 5.4.

### From Tau Ceti

Nothing of Tau Ceti is used directly; KakutaniFixedPointAndContinuousGames builds Kakutani's
theorem on Tau Ceti's Brouwer fixed-point theorem.

### From TauCetiRoadmap.RegretMinimizationAndEquilibria

- Conventions and Layer 1, 1.1:
  `simplex ι = Set.range (fun p : Convexity.StdSimplex ℝ ι ↦ ⇑p.weights)`, copied verbatim
  and used as `simplex (Fin ℓ)`. Mathlib's `Convexity.StdSimplex.range_toFun_comp_weights`
  (`Mathlib/Geometry/Convex/ConvexSpace/Defs.lean`) identifies it with the nonnegative vectors
  of sum `1`.

### From TauCetiRoadmap.ConsumerTheoryDuality

- 1.1: `budgetSet p m = {x | 0 ≤ x ∧ p ⬝ᵥ x ≤ m}` and `LocallyNonsatiated u` (for every `x ≥ 0`
  and `ε > 0` some `z ≥ 0` with `dist z x < ε` has `u x < u z`), copied verbatim.
- 1.2: `marshallianDemand u p m`, the maximizers of `u` on `budgetSet p m`, copied verbatim; and
  `dotProduct_eq_of_mem_marshallianDemand` (for locally nonsatiated `u`, every demanded `x` has
  `p ⬝ᵥ x = m`, with no hypothesis on `p`), used in 3.2 and in the routes of 4.1 and 5.2.

### From TauCetiRoadmap.KakutaniFixedPointAndContinuousGames

- 3.1: `kakutani_fixedPoint` (for `K` nonempty, compact and convex in a finite-dimensional real
  normed space and `φ : E → Set E` with nonempty convex values in `K` at points of `K` and closed
  graph `{p | p.1 ∈ K ∧ p.2 ∈ φ p.1}`, some `x ∈ K` has `x ∈ φ x`), used in 2.1 on
  `(Fin ℓ → ℝ) × (Fin ℓ → ℝ)`.
- 2.2: `berge_maximum_theorem` (for `φ` with nonempty compact values everywhere, `f` continuous on
  the graph of `φ`, and `φ` upper and lower hemicontinuous at `x₀`: the argmax is upper
  hemicontinuous at `x₀` with a nonempty compact value there, and the value is continuous at
  `x₀`), with Mathlib's topological hemicontinuity, used in 3.1 for the truncated budget sets.
- 1.1: `isClosed_graph_iff_upperHemicontinuous` (into a compact Hausdorff space, closed graph iff
  upper hemicontinuous with closed values), an alternative step in 2.1.

## References

- Kim C. Border, lecture notes on his Caltech page (`kcborder.caltech.edu/Notes/`), with the page
  numbers printed in each file:
  - *Brief Notes on the Arrow–Debreu–McKenzie Model of an Economy* (`Arrow-Debreu.pdf`, version
    2016.02.04);
  - *(Non)-Existence of Walrasian Equilibrium* (`Walrasian.pdf`, version 2017.10.23);
  - *The First Welfare Theorem* (`FirstWelfare.pdf`, version 2016.01.19);
  - *The Second Welfare Theorem* (`SecondWelfare.pdf`, version 2016.01.26);
  - *Core of a replica economy* (`Core.pdf`, version 2017.03.28);
  - *Introduction to Correspondences* (`Correspondences.pdf`, version 2016.09.11);
  - *Fixed point theory* (`FixPt.pdf`, no version printed).
- The original papers carry their customary attributions in prose and no locator; they were not
  consulted: Gale (Math. Scand., 1955), Nikaidô (Metroeconomica, 1956) and Debreu (Proc. Natl. Acad.
  Sci. USA, 1956) for the lemma of 2.1; Arrow and Debreu (Econometrica, 1954) for existence; Debreu
  (Rev. Econ. Stud., 1963) and Debreu and Scarf (Int. Econ. Rev., 1963) for 5.4.
