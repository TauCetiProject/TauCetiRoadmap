# Roadmap: consumer theory and duality

**Summary.** A consumer facing prices `p` with an income `m` chooses, among the bundles of goods
she can afford, one that maximizes her utility `u`. The value of this problem is the indirect
utility `v(p, m)`, and its solutions form the Marshallian demand. The dual problem asks for the
cheapest bundle that reaches a utility level `ū`; its value is the expenditure function `e(p, ū)`
and its solutions form the Hicksian demand. This roadmap develops the two problems and the
relations between them for a utility function on the nonnegative orthant of `ℝ^ℓ`, with prices
whose coordinates are all positive. Continuity, upper semicontinuity and local nonsatiation are
explicit hypotheses on `u`, stated theorem by theorem; no differentiability, monotonicity or
concavity of `u` is assumed anywhere.

The main theorems are these.

- *Duality.* If `u` is upper semicontinuous and locally nonsatiated and `m ≥ 0`, then
  `e(p, v(p, m)) = m`, and the Marshallian demand at `(p, m)` is the Hicksian demand at the level
  `v(p, m)`. If `u` is continuous and `ū` is a level that some bundle reaches with `ū ≥ u(0)`, then
  `v(p, e(p, ū)) = ū`, with no nonsatiation; and the Hicksian demand at `(p, ū)` is the
  Marshallian demand at the income `e(p, ū)` for every reachable level.
- *Shephard's lemma.* If `u` is upper semicontinuous and the Hicksian demand at `(p, ū)` is a
  single bundle `h`, then `e(·, ū)` is differentiable at `p` with gradient `h`. Conversely, where
  `e(·, ū)` is differentiable the Hicksian demand has at most one element.
- *Roy's identity.* If `v` is differentiable at `(p, m)`, every bundle `x` in the Marshallian
  demand at `(p, m)` satisfies `∂v/∂pⱼ + xⱼ ∂v/∂m = 0`, so `xⱼ = −(∂v/∂pⱼ)/(∂v/∂m)` wherever
  `∂v/∂m ≠ 0`. No semicontinuity or nonsatiation of `u` is needed.
- *The Slutsky matrix.* When the Marshallian demand is a single bundle `x(p, m)` for a continuous
  `u`, the derivative in `p` of the Hicksian demand at level `ū` is the Slutsky matrix
  `∂xᵢ/∂pⱼ + xⱼ ∂xᵢ/∂m` at `(p, e(p, ū))`, and this matrix is symmetric and negative semidefinite
  with `p` in its kernel. Negative semidefiniteness comes from the concavity of the expenditure
  function in the prices.

Shephard's lemma and Roy's identity are proved by direct envelope arguments. The roadmap builds
on Mathlib's semicontinuity, convexity and Fréchet calculus: the extreme value
theorem for upper semicontinuous functions, the symmetry of second derivatives and Euler's
identity for homogeneous functions. Tau Ceti's theorem that the Hessian of a convex function is
a positive operator gives one route to negative semidefiniteness. The support functions and
Danskin's theorem of ConvexAnalysisAndDuality are not used: Danskin's theorem concerns a supremum
over a compact index set, while the expenditure function is an infimum over a closed set that
need be neither compact nor convex.

Layer 1 defines budget sets, both demands and both value functions, with existence and budget
exhaustion; Layer 2 proves the duality identities; Layer 3 the properties of the two value
functions; Layer 4 Shephard's lemma and Roy's identity; Layer 5 the Slutsky matrix.

## Conventions

- **Commodities.** There are `ℓ` goods and a bundle is `x : Fin ℓ → ℝ` with the pointwise order;
  the consumption set is the closed orthant `0 ≤ x` (`Set.Ici 0`). A consumer is a function
  `u : (Fin ℓ → ℝ) → ℝ`, and only its values on the orthant enter any definition or statement.
  The orthant, rather than all of `ℝ^ℓ`, is what makes the budget sets compact at prices with
  positive coordinates and income `m ≥ 0`, so that demand exists; on `ℝ^ℓ` every budget set with
  `ℓ ≥ 1` is unbounded. Continuity and upper semicontinuity of `u` are `ContinuousOn u (Set.Ici 0)`
  and `UpperSemicontinuousOn u (Set.Ici 0)`, relative to the orthant.
- **Prices and income.** Prices are `p : Fin ℓ → ℝ`, the cost of `x` is `p ⬝ᵥ x`, and "prices
  with positive coordinates" is `∀ i, 0 < p i` (written `p ≫ 0` in prose). Income `m` is real.
  Derivatives in the prices are Fréchet derivatives on `Fin ℓ → ℝ` with its sup norm; the
  partial derivative in `pⱼ` is the derivative applied to `Pi.single j 1`, and the partial
  derivative of a function of `(p, m)` in `m` is the derivative applied to `(0, 1)`.
- **Junk values.** The indirect utility is `sSup` and the expenditure function `sInf` of a set
  of reals, so they take the value `0` on an empty set and on a set unbounded above or below
  (Mathlib's `Real.sSup_empty`, `Real.sInf_empty`, `Real.sSup_of_not_bddAbove`,
  `Real.sInf_of_not_bddBelow`). So `v(p, m) = 0` when `p ≥ 0` and `m < 0`, `e(p, ū) = 0` when no
  bundle reaches `ū`, and a price with a nonpositive coordinate can make the budget set unbounded. A
  Fréchet derivative `fderiv` is `0` where the function is not differentiable. Every statement
  below is checked at these values; where a statement has no differentiability hypothesis, it is
  because the statement holds at nondifferentiable points through this convention.
- **Demand is a set.** Marshallian and Hicksian demands are sets of bundles; a demand function is
  a hypothesis that the set is the singleton `{x q m'}` for a given function `x`.
- **Degenerate dimensions.** For `ℓ = 0` the orthant is one point, every budget set with `m ≥ 0`
  is that point, and no `u` is locally nonsatiated. For `ℓ = 1` and a strictly increasing `u`,
  demand is `m/p`, and the Slutsky matrix is the number `−m/p² + (m/p)(1/p) = 0`.

## Layer 1: budget sets and demand

### 1.1 Budget sets and local nonsatiation

Define `budgetSet p m` as the set of `x` with `0 ≤ x` and `p ⬝ᵥ x ≤ m`, and `LocallyNonsatiated u`:
for every `x ≥ 0` and `ε > 0` some `z ≥ 0` with `dist z x < ε` has `u x < u z` (Border,
*Traditional Derivation*, definition before Lemma 1, p. 5, for a general consumption set).

The layers below use that for `p ≫ 0` and `m ≥ 0` the budget set is nonempty (it contains `0`),
closed and bounded, so compact, and that for `m < 0` it is empty.

**Checks.**
- The improving bundle must be nonnegative. For one good and `u x = −x`, bundles `z = −ε` near
  `0` improve on `0`, so local nonsatiation in `ℝ` holds while local nonsatiation on the orthant
  fails at `0`; and 2.1 fails for this `u`: `v(1, 1) = 0` and `e(1, 0) = 0 ≠ 1`.
- At `p = (0, 1)` the budget set with `m = 1` contains every `(t, 0)`, so it is not bounded.

*Needs:* Mathlib `dotProduct`, `Metric.isCompact_of_isClosed_isBounded`. (Proved here.)

### 1.2 Marshallian demand and indirect utility

Define `marshallianDemand u p m` as the set of `x ∈ budgetSet p m` with `u y ≤ u x` for every
`y ∈ budgetSet p m`, and `indirectUtility u p m` as `sSup (u '' budgetSet p m)`.

- `marshallianDemand_nonempty`: for `u` upper semicontinuous on the orthant, `p ≫ 0` and `m ≥ 0`,
  the Marshallian demand is nonempty, and `v(p, m) = u x` for every demanded `x` (proved here).
- `dotProduct_eq_of_mem_marshallianDemand` (budget exhaustion): if `u` is locally nonsatiated,
  every demanded bundle has `p ⬝ᵥ x = m` (Border, *Traditional Derivation*, Lemma 1, p. 5). No
  hypothesis on `p` is needed: if `p ⬝ᵥ x < m`, every nonnegative bundle near `x` is affordable.

Route: the extreme value theorem for upper semicontinuous functions on the compact budget set.
The second conjunct of the first statement holds for every `u`: a demanded `x` bounds the image
above and lies in it.

**Checks.**
- Upper semicontinuity is needed: for one good with `u x = x` on `[0, 1)` and `u x = x − 1` on
  `[1, ∞)`, at `p = 1` and `m = 1` the supremum `1` is not attained and the demand is empty.
- Positive prices are needed: for `u = x₁ + x₂` at `p = (0, 1)` and `m = 1`, the utility is
  unbounded on the budget set, the demand is empty and `v(p, 1) = 0`.
- Nonsatiation is needed for exhaustion: for one good, `u x = −(x − 1)²`, `p = 1` and `m = 2`, the
  demand is `{1}`, which costs `1 < 2`.

*Needs:* 1.1; Mathlib `UpperSemicontinuousOn.exists_isMaxOn`,
`UpperSemicontinuousOn.bddAbove_of_isCompact`.

### 1.3 Hicksian demand and expenditure

Define `hicksianDemand u p ū` as the set of `x ≥ 0` with `ū ≤ u x` and `p ⬝ᵥ x ≤ p ⬝ᵥ y` for
every `y ≥ 0` with `ū ≤ u y`, and `expenditure u p ū` as the infimum of `p ⬝ᵥ x` over the upper
contour set `{x | 0 ≤ x ∧ ū ≤ u x}`.

- `hicksianDemand_nonempty`: for `u` upper semicontinuous on the orthant, `p ≫ 0` and a level
  `ū` reached by some `y ≥ 0`, the Hicksian demand is nonempty, and `e(p, ū) = p ⬝ᵥ x` for every
  `x` in it (proved here).

Route: the upper contour set is closed, and its part of cost at most `p ⬝ᵥ y` is compact; the
cost attains its minimum there.

**Checks.**
- The upper contour set uses `≥`. With the level set `{u x = ū}` instead, for one good,
  `u x = −(x − 1)²` and `ū = −4`, the infimum would be `3` (the point `x = 3`), while
  `e(1, −4) = 0`, attained at `0`.
- Upper semicontinuity is needed: for one good with `u x = x` on `[0, 1]` and `u x = x + 1` on
  `(1, ∞)`, the upper contour set at `ū = 3/2` is `(1, ∞)`, so `e(1, 3/2) = 1` is not attained.
- Positive prices are needed: for `u = x₁ x₂`, `ū = 1` and `p = (0, 1)`, the infimum `0` of `x₂`
  over `x₁ x₂ ≥ 1` is not attained.
- If no bundle reaches `ū`, the Hicksian demand is empty and `e(p, ū) = 0`.

*Needs:* 1.1; Mathlib `IsCompact.exists_isMinOn`, `Metric.isCompact_of_isClosed_isBounded`.

### Examples

Cobb–Douglas utility `x₁^(1/3) x₂^(2/3)`: demand `(m/(3p₁), 2m/(3p₂))`,
`v = c m p₁^(−1/3) p₂^(−2/3)` and `e = ū p₁^(1/3) p₂^(2/3)/c` for `ū ≥ 0`, with
`c = (1/3)^(1/3)(2/3)^(2/3)`; at `p = (2, 3)` and `m = 5`, `v ≈ 1.0095`, which agrees with a
direct search over the budget set. Leontief utility `min(x₁, x₂)`: demand
`(m/(p₁ + p₂), m/(p₁ + p₂))`, `v = m/(p₁ + p₂)`, `e = ū(p₁ + p₂)` and Hicksian demand `(ū, ū)`
for `ū ≥ 0`. Linear utility `x₁ + x₂`: `v = m/min(p₁, p₂)`, `e = ū min(p₁, p₂)`.

### Dependencies

Mathlib `dotProduct`, `Metric.isCompact_of_isClosed_isBounded`,
`UpperSemicontinuousOn.exists_isMaxOn`, `UpperSemicontinuousOn.bddAbove_of_isCompact`,
`IsCompact.exists_isMinOn`. No other layer.

## Layer 2: the duality between utility maximization and expenditure minimization

### 2.1 From incomes to levels

- `expenditure_indirectUtility`: for `u` upper semicontinuous on the orthant and locally
  nonsatiated, `p ≫ 0` and `m ≥ 0`, `e(p, v(p, m)) = m`.
- `marshallianDemand_eq_hicksianDemand`: under the same hypotheses the Marshallian demand at
  `(p, m)` equals the Hicksian demand at `(p, v(p, m))`.

(Border, *Traditional Derivation*, Proposition 1 (1), pp. 5–6, for maximizers; Border, *Crib Sheet
on Demand Theory*, "Statement of Equivalence", p. 1, under differentiability assumptions on `u`.
The forms here, with upper semicontinuity only and equality of sets, are proved here.)

Route: a demanded `x` costs `m` (1.2) and has `u x = v(p, m)`. A bundle `y ≥ 0` with
`u y ≥ v(p, m)` and `p ⬝ᵥ y < m` would have, by nonsatiation, a nearby nonnegative `z` with
`p ⬝ᵥ z < m` and `u z > v(p, m)`, which is impossible; so every such `y` costs at least `m`, and
`e(p, v(p, m)) = m`. The two inclusions follow. At `m = 0` both sides are about the single bundle
`0`.

**Checks.**
- Nonsatiation is needed: for a constant `u`, `v(p, 1) = c` and `e(p, c) = 0`; the Marshallian
  demand is the whole budget set and the Hicksian demand is `{0}`.
- Upper semicontinuity is needed: for one good with `u x = x` on `[0, 1)` and `x − 1` on
  `[1, ∞)` (locally nonsatiated), `v(1, 1) = 1`, not attained, and `e(1, 1) = 2`; the
  Marshallian demand at `(1, 1)` is empty and the Hicksian demand at `(1, 1)` is `{2}`.
- `m ≥ 0` is needed: for `u x = x`, `v(1, −1) = 0` and `e(1, 0) = 0 ≠ −1`.
- Positive prices are needed: for `u = x₁ + x₂` at `p = (0, 1)` and `m = 1`, `v = 0` by the
  convention on unbounded sets and `e(p, 0) = 0 ≠ 1`.
- Without nonsatiation the identity fails at a local maximum: for one good and
  `u x = sin 3x + x/5`, `v(1, 0.7) ≈ 1.1069`, attained near `0.546`, and
  `e(1, v(1, 0.7)) ≈ 0.546`.

*Needs:* 1.2, 1.3; Mathlib `UpperSemicontinuousOn.bddAbove_of_isCompact`.

### 2.2 From levels to incomes

- `indirectUtility_expenditure`: for `u` continuous on the orthant, `p ≫ 0` and a level `ū` with
  `u 0 ≤ ū` that some nonnegative bundle reaches, `v(p, e(p, ū)) = ū`.
- `hicksianDemand_eq_marshallianDemand`: for `u` continuous on the orthant, `p ≫ 0` and a level
  `ū` that some nonnegative bundle reaches, the Hicksian demand at `(p, ū)` equals the
  Marshallian demand at `(p, e(p, ū))`.

No nonsatiation is assumed in either statement (Border, *Traditional Derivation*,
Proposition 1 (2), pp. 5–6, whose proof uses only continuity and a positive cost; Border, *Crib
Sheet*, p. 1, under differentiability assumptions. The forms here are proved here).

Route: let `m = e(p, ū)`, attained at some `x̂` (1.3), so `v(p, m) ≥ u x̂ ≥ ū`. If some `y` in the
budget set had `u y > ū`, then `y ≠ 0` because `u 0 ≤ ū`, so `0 < p ⬝ᵥ y ≤ m`, and by continuity
`t y` for `t < 1` near `1` reaches `ū` at cost `t (p ⬝ᵥ y) < m`; this is impossible. For the
second statement, if `ū < u 0` both
sides are `{0}`; otherwise the first statement gives `v(p, m) = ū`, so a cost minimizer is a
utility maximizer, and a utility maximizer reaches `ū` at cost at most `m`.

**Checks.**
- No nonsatiation is needed: for one good and `u x = sin 3x + x/5`, the levels `0.3, 0.9, 1.1,
  1.5` give `e ≈ 0.095, 0.329, 0.507, 2.56` and `v(1, e)` equal to the level, up to the grid
  step.
- Lower semicontinuity is needed: for one good with `u x = 0` on `[0, 1)` and `1` on `[1, ∞)`
  (upper semicontinuous), `e(1, 1/2) = 1` and `v(1, 1) = 1 ≠ 1/2`.
- Upper semicontinuity is needed: for `u x = x` on `[0, 1]` and `x + 1` on `(1, ∞)`,
  `e(1, 3/2) = 1`, not attained, and `v(1, 1) = 1 ≠ 3/2`; the Hicksian demand at `(1, 3/2)` is
  empty and the Marshallian demand at `(1, 1)` is `{1}`.
- Lower semicontinuity is needed for the equality of sets: for two goods, `p = (1, 1)`, `ū = 1/2`
  and the upper semicontinuous `u` equal to `1` where `x₁ + x₂ ≥ 1` and `x₁ ≥ x₂`, to `1/2` where
  `x₁ + x₂ ≥ 1` and `x₁ < x₂`, and to `0` where `x₁ + x₂ < 1`: `e = 1`, the Hicksian demand is the
  whole segment `x₁ + x₂ = 1` and the Marshallian demand at income `1` is its half with
  `x₁ ≥ x₂`.
- `u 0 ≤ ū` is needed for the first statement: for `u x = x` and `ū = −1`, `e = 0` and
  `v(1, 0) = 0`. The second statement holds there: both demands are `{0}`.
- A reachable level is needed: for `u x = min(x, 1)` and `ū = 2`, `e = 0`, `v(1, 0) = 0 ≠ 2`, the
  Hicksian demand is empty and the Marshallian demand at income `0` is `{0}`.

*Needs:* 1.2, 1.3; Mathlib `ContinuousOn.upperSemicontinuousOn`.

### Examples

For Cobb–Douglas, Leontief and the quasilinear utility `x₁ + 2√x₂` (in the region
`m ≥ p₁²/p₂`, where demand is `(m/p₁ − p₁/p₂, (p₁/p₂)²)`, `v = m/p₁ + p₁/p₂` and
`e = p₁ ū − p₁²/p₂` for `ū ≥ 2p₁/p₂`), the four statements of this layer hold identically in
`p`, `m` and `ū`.

### Dependencies

Layer 1. Mathlib `UpperSemicontinuousOn.bddAbove_of_isCompact`,
`ContinuousOn.upperSemicontinuousOn`.

## Layer 3: properties of the expenditure and indirect utility functions

### 3.1 The expenditure function

Prove `expenditure_concaveOn_homogeneous_monotone`: for every `u` and every level `ū`, on the
closed orthant of prices `e(·, ū)` is concave, satisfies `e(t p, ū) = t e(p, ū)` for `t ≥ 0`, and
is monotone (Border, *Convex analysis and profit/cost/support functions*, the Proposition on the
cost function `c_A`, p. 1; Border, *Crib Sheet*, p. 1).

Route: on prices `p ≥ 0` the costs of nonnegative bundles are nonnegative, so the infimum is over
a set bounded below, and an infimum of linear functions of `p` is concave and positively
homogeneous; Mathlib's `Real.sInf_smul_of_nonneg` gives homogeneity. If no bundle reaches `ū`,
`e(·, ū)` is `0` and all three statements hold.

**Checks.**
- For linear utility `x₁ + x₂` and `ū = 1`, `e(p, 1) = min(p₁, p₂)`: concave and not linear.
- At `t = 0`, `e(0, ū) = 0` when some bundle reaches `ū`, the cost of every bundle being `0`.

*Needs:* 1.3; Mathlib `ConcaveOn`, `Real.sInf_smul_of_nonneg`.

### 3.2 Homogeneity and monotonicity of the indirect utility

Prove `indirectUtility_homogeneous_monotone`: for `u` upper semicontinuous on the orthant,
`p ≫ 0` and `m ≥ 0`, `v(t p, t m) = v(p, m)` for `t > 0`, `v(q, m) ≤ v(p, m)` for `q ≥ p`,
`v(p, m) ≤ v(p, m')` for `m' ≥ m`, and, if `u` is locally nonsatiated, `v(p, m) < v(p, m')` for
`m' > m` (Border, *Crib Sheet*, p. 1, for a smooth, strictly monotone and strongly quasiconcave
`u`; the form here, for an upper semicontinuous `u`, is proved here).

Route: homogeneity holds because the budget sets coincide; the monotonicity statements compare
budget sets, which are nonempty and on which `u` is bounded above. For the strict statement, a
demanded bundle at `m` costs at most `m < m'`, and a nearby improving bundle is affordable at
`m'`.

**Checks.**
- Cobb–Douglas: `v(t p, t m) = v(p, m)`, and `v` decreases in each price and increases in `m`.
- Nonsatiation is needed for strictness: a constant `u` has `v(p, ·)` constant.
- Upper semicontinuity is needed for the price comparison: for one good with `u x = 1/(1 − x)` on
  `[0, 1)` and `0` on `[1, ∞)`, `v(1, 1.5) = 0` by the convention on unbounded sets, while
  `v(2, 1.5) = 4`.

*Needs:* 1.2; Mathlib `UpperSemicontinuousOn.bddAbove_of_isCompact`.

### 3.3 Quasiconvexity of the indirect utility

Prove `quasiconvexOn_indirectUtility`: for `u` upper semicontinuous on the orthant, `v` is
quasiconvex in `(p, m)` on the set of pairs with `p ≫ 0` and `m ≥ 0` (Border, *Crib Sheet*,
"Quasiconvexity of indirect utility", p. 3, in `p` for fixed income; the joint form in `(p, m)`
has the same proof and is the one stated here).

Route: a bundle affordable at a convex combination of two price–income pairs is affordable at
one of them, so the budget set of the combination lies in the union of the two budget sets, and
its supremum is at most the larger of the two.

**Checks.**
- Upper semicontinuity is needed: for one good with `u x = 1/(1 − x)` on `[0, 1)` and `0` on
  `[1, ∞)` at `p = 1`, `v(1, 0.5) = 2`, `v(1, 2) = 0` by the convention on unbounded sets, and
  `v(1, 0.75) = 4 > 2`, with `0.75` between `0.5` and `2`.
- Quasiconvex is not convex: for one good and `u x = √x`, `v(p, m) = √(m/p)`, and
  `v(1, 2) = √2 > (v(1, 0) + v(1, 4))/2 = 1`.

*Needs:* 1.2; Mathlib `QuasiconvexOn`, `UpperSemicontinuousOn.bddAbove_of_isCompact`.

### Examples

Cobb–Douglas, Leontief and linear utility, with the formulas of Layer 1. For Cobb–Douglas,
`e(·, ū) = ū p₁^(1/3) p₂^(2/3)/c` is concave and homogeneous of degree one, and `v` is
quasiconvex in `(p, m)`.

### Dependencies

Layer 1. Mathlib `ConcaveOn`, `QuasiconvexOn`, `Real.sInf_smul_of_nonneg`,
`UpperSemicontinuousOn.bddAbove_of_isCompact`.

## Layer 4: Shephard's lemma and Roy's identity

### 4.1 Shephard's lemma

- `hasFDerivAt_expenditure`: for `u` upper semicontinuous on the orthant and `p ≫ 0`, if the
  Hicksian demand at `(p, ū)` is `{h}`, then `q ↦ e(q, ū)` has at `p` the derivative
  `q ↦ q ⬝ᵥ h`, so `∂e/∂pᵢ = hᵢ`.
- `subsingleton_hicksianDemand_of_differentiableAt`: for every `u` and `p ≫ 0`, if `e(·, ū)` is
  differentiable at `p`, the Hicksian demand at `(p, ū)` has at most one element.

(Border, *Duality Approach to Demand Properties*, p. 2, by the envelope theorem under smoothness
assumptions; Border, *Convex analysis and profit/cost/support functions*, the Proposition under
"Comparative statics", p. 4, for a closed convex set with a unique minimizer. The upper contour
set here need be neither convex nor compact; the form here is proved here.)

Route, the direct envelope argument. Upper bound: `e(q) ≤ q ⬝ᵥ h` for all `q ≫ 0`, with equality
at `p`. Lower bound: for `q` near `p`, the Hicksian demand at `q` is nonempty (1.3) and lies in
the compact set of bundles of the upper contour set with `p ⬝ᵥ x ≤ 2 e(p) + 1`, say. Since
`e(·, ū)` is continuous at `p`, being concave on the open set of prices `≫ 0` (3.1), a limit of
minimizers `x_q` as `q → p` is a minimizer at `p`, so `x_q → h`. Then
`(q − p) ⬝ᵥ x_q ≤ e(q) − e(p) ≤ (q − p) ⬝ᵥ h`, and the difference of the two sides is
`o(‖q − p‖)`. Converse: if `x` is in the Hicksian demand, `q ↦ q ⬝ᵥ x − e(q)` is nonnegative near
`p` and vanishes at `p`, so its derivative at `p` is zero and `x` is the gradient of `e(·, ū)` at
`p`; two such bundles are equal.

**Checks.**
- Uniqueness is needed: for linear utility `x₁ + x₂`, `ū = 1` and `p = (1, 1)`, the Hicksian
  demand is the segment `x₁ + x₂ = 1`, and `e(q, 1) = min(q₁, q₂)` has one-sided partial
  derivatives `0` and `1` in `q₁` at `p`.
- Differentiability of `u` is not needed: for Leontief utility the Hicksian demand `(ū, ū)` is
  unique and `e = ū(p₁ + p₂)` has gradient `(ū, ū)`.
- Upper semicontinuity is needed: let `u` be `1` on the set `A` of the bundle `(1, 0)` and the
  bundles `(0, 1 + 1/n)`, `n ≥ 1`, and `0` elsewhere. At `p = (1, 1)` and `ū = 1` the Hicksian
  demand is `{(1, 0)}`, the others costing `1 + 1/n`, but `e(q, 1) = min(q₁, q₂)` near `p`, with
  the infimum over the second family not attained when `q₂ < q₁`.
- Positive prices are needed: for `u = x₁ − √x₂`, `ū = 1` and `p = (1, 0)`, the Hicksian demand
  is `{(1, 0)}`, while at `q = (1, −δ)` the cost `1 + √t − δ t` of `(1 + √t, t)` is unbounded below,
  so `e(q, 1) = 0` by convention and `e(p, 1) = 1`.
- Positive prices are needed in the converse: for one good, `u x = x`, `ū = 0` and `p = 0`, the
  Hicksian demand is `[0, ∞)`, and `e(q, 0) = 0` for every `q` (the infimum `0` for `q ≥ 0`, the
  convention on unbounded sets for `q < 0`), which is differentiable.

*Needs:* 1.3, 3.1; Mathlib `Metric.isCompact_of_isClosed_isBounded`,
`ConcaveOn.continuousOn_interior`, `IsLocalMin.hasFDerivAt_eq_zero`.

### 4.2 Roy's identity

Prove `roy_identity`: for every `u`, `p`, `m` and every `x` in the Marshallian demand at `(p, m)`,
with `V (q, m') = v(q, m')`, the partial derivatives of `V` at `(p, m)` satisfy
`∂V/∂pⱼ + xⱼ ∂V/∂m = 0`, and if `∂V/∂m ≠ 0`, then `xⱼ = −(∂V/∂pⱼ)/(∂V/∂m)` (Border, *Duality
Approach*, p. 1, and *Traditional Derivation*, "Roy's Law", p. 9, under smoothness assumptions
and with a unique interior demand; the form here is proved here).

Route, the direct envelope argument. Where `V` is not differentiable both partial derivatives are
`0` and both statements hold, so assume it is; then `V` is continuous at `(p, m)` and
`V(p, m) = u x`. If `p ⬝ᵥ x = m`: `x` is affordable at `(q, q ⬝ᵥ x)` for every `q`, so
`V(q, q ⬝ᵥ x) ≥ u x` for `q` near `p` (near `(p, m)` the value `V` is close to `u x`, so where
`u x > 0` it is not the junk value `0`, and where `u x ≤ 0` the junk value `0` is at least `u x`);
the function `q ↦ V(q, q ⬝ᵥ x)` has a local minimum at `p`, and the chain rule gives the identity.
If `p ⬝ᵥ x < m`: `x` stays affordable at `(q, m)` for `q` near `p`, so `V(·, m)` has a local
minimum at `p` and `∂V/∂pⱼ = 0`; and `V(p, ·)` equals `u x` on `[p ⬝ᵥ x, m]`, so `∂V/∂m = 0`. No
nonsatiation, semicontinuity or uniqueness of demand is used.

**Checks.**
- Cobb–Douglas: `−(∂v/∂p₁)/(∂v/∂m) = m/(3p₁) = x₁`.
- `∂V/∂m ≠ 0` is needed for the quotient: for `u = (x₁ + x₂ − 1)³` (continuous and locally
  nonsatiated) at `p = (1, 2)` and `m = 1`, near `(p, m)` the indirect utility is
  `(m'/q₁ − 1)³`, all three partial derivatives vanish at `(p, m)`, and the demand is `(1, 0)`;
  the quotient `−0/0` is `0` in Lean, while `x₁ = 1`.
- A satiated utility: for `u = −(x₁ − 1)² − (x₂ − 1)²`, `p₁ + p₂ > m` and `p` such that the bundle
  `(1, 1) − ((p₁ + p₂ − m)/(p₁² + p₂²)) p` is nonnegative, the demand is that bundle and
  `v = −(p₁ + p₂ − m)²/(p₁² + p₂²)`; the identity holds
  identically (at `p = (1, 2)`, `m = 1.5` the demand `(0.7, 0.4)` agrees with a grid search).

*Needs:* 1.2; Mathlib `IsLocalMin.hasFDerivAt_eq_zero`, `HasFDerivAt.comp`.

### Examples

Cobb–Douglas, Leontief and the quasilinear utility: Shephard's lemma and Roy's identity hold
identically with the formulas of Layers 1 and 2. Linear utility at `p₁ = p₂`: the expenditure
function has a kink and the Hicksian demand is a segment.

### Dependencies

Layers 1 and 3. Mathlib `Metric.isCompact_of_isClosed_isBounded`,
`ConcaveOn.continuousOn_interior`, `IsLocalMin.hasFDerivAt_eq_zero`, `HasFDerivAt.comp`.

## Layer 5: the Slutsky matrix

### 5.1 The Slutsky equation

Define `slutskyMatrix x p m` for a function `x : (Fin ℓ → ℝ) → ℝ → Fin ℓ → ℝ` as the matrix with
entry `∂xᵢ/∂pⱼ + xⱼ ∂xᵢ/∂m` at `(p, m)`, the partial derivatives being taken from the Fréchet
derivative of `Function.uncurry x` at `(p, m)`.

Prove `hasFDerivAt_hicksian_slutskyMatrix`: let `u` be continuous on the orthant, let the
Marshallian demand be `{x q m'}` for every `q ≫ 0` and `m' ≥ 0`, let `p ≫ 0`, and let some
nonnegative bundle reach `ū`. Then for every `q ≫ 0` the Hicksian demand at `(q, ū)` is
`{x q (e(q, ū))}`; and if `x` is differentiable at `(p, e(p, ū))`, the Hicksian demand function
`q ↦ x q (e(q, ū))` has at `p` the derivative given by the Slutsky matrix at `(p, e(p, ū))`
(Border, *Duality Approach*, pp. 2–3; *Traditional Derivation*, "Slutsky decomposition", p. 8;
*Crib Sheet*, pp. 2–3, all under smoothness assumptions on `u`; the form here is proved here).

Route: the first statement is 2.2 with the hypothesis on demand. For the second, 4.1 at `p`
gives the gradient `x p (e(p, ū))` of `e(·, ū)`, and the chain rule for `q ↦ (q, e(q, ū))`
followed by `Function.uncurry x` gives the derivative `∂xᵢ/∂pⱼ + ∂xᵢ/∂m · xⱼ`.

**Checks.**
- Cobb–Douglas with weights `1/3, 2/3` at `p = (2, 3)`, `m = 5`: the Slutsky matrix is
  `[[−5/18, 5/27], [5/27, −10/81]]`, and the derivative of the Hicksian demand agrees with it.
- The order of the indices matters: for the quasilinear utility at `p = (1, 1)`, `m = 3` (demand
  `(2, 1)`), the Slutsky matrix is `[[−2, 2], [2, −2]]`, while the variant
  `∂xᵢ/∂pⱼ + xᵢ ∂xⱼ/∂m` gives `[[−2, 1], [3, −2]]`, which is not symmetric and sends `p` to
  `(−1, 1)`. The variant `∂xᵢ/∂pⱼ − xⱼ ∂xᵢ/∂m` gives, for Cobb–Douglas at `p = (1, 1)`, `m = 3`,
  the matrix `[[−4/3, −2/3], [−2/3, −10/3]]`, which sends `p` to `(−2, −4)`.
- Differentiability of `x` is needed for the second statement: for the quasilinear utility at
  `p = (1, 1)` and `ū = 2`, the Hicksian demand is `(ū − 2q₁/q₂, (q₁/q₂)²)` when `ū ≥ 2q₁/q₂`
  and `(0, (ū/2)²)` otherwise, so `∂h₂/∂q₁` is `2` on one side and `0` on the other; `x` is not
  differentiable at `(p, e(p, 2)) = (p, 1)`.
- Leontief: the Hicksian demand `(ū, ū)` is constant in `q` and the Slutsky matrix is `0`.
- Continuity of `u` is needed for the first statement, even with a single-valued Marshallian
  demand. For two goods let `u x = −exp(−x₁) − exp(−x₂) + 2` where `x₁ ≥ 1` and
  `u x = −exp(−x₁) − exp(−x₂)` elsewhere: `u` is upper semicontinuous, and the Marshallian
  demand is a single bundle at every `q ≫ 0` and `m' ≥ 0` (an affordable bundle with `x₁ ≥ 1`
  beats every bundle with `x₁ < 1`, and `−exp(−x₁) − exp(−x₂)` is strictly concave). At
  `p = (1, 1)` and `ū = −2/√e` the Hicksian demand is `{(1/2, 1/2), (1, 0)}`, both of cost `1`,
  of utility `ū` and `1 − 1/e`, while the Marshallian demand at income `1` is `{(1, 0)}`. So
  the first statement fails at `q = (1, 1)`. Every other hypothesis holds with `p = (2, 1)`:
  `e(p, ū) = 3/2 + log(27/32) ≈ 1.3301 < 2 = p₁`, so near `(p, e(p, ū))` no bundle with
  `x₁ ≥ 1` is affordable and `x` is the smooth interior demand of `−exp(−x₁) − exp(−x₂)`. (With
  `p = (1, 1)` instead, `x` jumps at `((1, 1), 1)` and is not differentiable there.)

*Needs:* 2.2, 4.1; Mathlib `HasFDerivAt.comp`, `Function.uncurry`, `Matrix.toLin'`,
`LinearMap.toContinuousLinearMap`.

### 5.2 Symmetry, negative semidefiniteness and the kernel

Prove `slutskyMatrix_isSymm_negSemidef`: under the hypotheses of 5.1 on `u` and `x`, for `p ≫ 0`
and every level `ū`, the Slutsky matrix at `(p, e(p, ū))` is symmetric, satisfies
`w ⬝ᵥ S w ≤ 0` for every `w`, and sends `p` to `0` (Border, *Duality Approach*, pp. 2–3;
*Crib Sheet*, p. 3; Border, *Convex analysis and profit/cost/support functions*, pp. 4–5, for the
negative semidefiniteness of the derivative of a cost-minimizing selection; all under smoothness
assumptions; the form here is proved here).

Under local nonsatiation every `(p, m)` with `m ≥ 0` has the form `(p, e(p, v(p, m)))` by 2.1, so
the statement covers the Slutsky matrix at every price–income pair. Negative semidefiniteness is
derived from the concavity of the expenditure function only.

Route. If no bundle reaches `ū` or `ū ≤ u 0`, then `e(·, ū) = 0`, `x q 0 = 0` for all `q ≫ 0`,
and the matrix at `(p, 0)` is `0`. If `x` is not differentiable at `(p, e(p, ū))` the matrix is
`0`. Otherwise, by 5.1 and 2.2 the Hicksian demand at each `q ≫ 0` is a single bundle, so by 4.1
`e(·, ū)` is differentiable near `p` with gradient the Hicksian demand, whose derivative at `p` is
the Slutsky matrix (5.1). So the matrix is the second derivative of `e(·, ū)` at `p`:
- symmetry is Mathlib's `second_derivative_symmetric_of_eventually`;
- negative semidefiniteness follows from the concavity of 3.1, either through Tau Ceti's
  `ConvexOn.isPositive_of_hasFDerivAt_gradient` applied to `−e(·, ū)` after transport to
  `EuclideanSpace ℝ (Fin ℓ)` by `EuclideanSpace.equiv`, or directly: the supergradient
  inequalities at `p` and `p + t w` give `(h(p + t w) − h(p)) ⬝ᵥ (t w) ≤ 0`, and dividing by `t²`
  and letting `t → 0` gives `w ⬝ᵥ S w ≤ 0`;
- the kernel: the Hicksian demand is unchanged when `q` is scaled by `t > 0`, so Mathlib's Euler
  identity `HasFDerivAt.apply_self_eq_smul_of_eventuallyEq`, with the constant scaling function
  `1` and its derivative `0`, gives `S p = 0`.

**Checks.**
- Cobb–Douglas at `p = (2, 3)`, `m = 5`: the matrix of 5.1 is symmetric, has eigenvalues
  `−65/162` and `0`, and sends `(2, 3)` to `0`.
- Quasilinear at `p = (2, 3)`, `m = 5`: `[[−2/3, 4/9], [4/9, −8/27]]`, eigenvalues `−26/27` and
  `0`, kernel spanned by `(2, 3)`.
- One good: the matrix is `0` (Conventions).

*Needs:* 2.2, 3.1, 4.1, 5.1; Mathlib `second_derivative_symmetric_of_eventually`,
`HasFDerivAt.apply_self_eq_smul_of_eventuallyEq`, `EuclideanSpace.equiv`, `Matrix.IsSymm`,
`Matrix.mulVec`; Tau Ceti `ConvexOn.isPositive_of_hasFDerivAt_gradient`.

### Examples

The Slutsky matrices of Cobb–Douglas, Leontief and the quasilinear utility, with their
eigenvalues and kernels, and the two wrong variants of the definition evaluated on them.

### Dependencies

Layers 2, 3 and 4. Mathlib `HasFDerivAt.comp`, `Function.uncurry`, `Matrix.toLin'`,
`LinearMap.toContinuousLinearMap`, `second_derivative_symmetric_of_eventually`,
`HasFDerivAt.apply_self_eq_smul_of_eventuallyEq`, `EuclideanSpace.equiv`, `Matrix.IsSymm`,
`Matrix.mulVec`; Tau Ceti `ConvexOn.isPositive_of_hasFDerivAt_gradient`.

## Scope and ownership

This roadmap owns the targets stated above: budget sets and local nonsatiation on the orthant;
Marshallian and Hicksian demand, the indirect utility and the expenditure function, with
existence and budget exhaustion; the duality identities of Layer 2; concavity, homogeneity and
monotonicity of the expenditure function, and homogeneity, monotonicity and quasiconvexity of the
indirect utility; Shephard's lemma with its converse and Roy's identity; the Slutsky matrix, the
Slutsky equation, and the symmetry, negative semidefiniteness and kernel of the matrix.

Already in the libraries and therefore not targets:

- Mathlib's extreme value theorem and boundedness for upper semicontinuous functions on compact
  sets (`UpperSemicontinuousOn.exists_isMaxOn`, `UpperSemicontinuousOn.bddAbove_of_isCompact`),
  the vanishing of the derivative at a local minimum (`IsLocalMin.hasFDerivAt_eq_zero`), the
  symmetry of second derivatives (`second_derivative_symmetric_of_eventually`) and Euler's
  identity for homogeneous functions (`HasFDerivAt.apply_self_eq_smul_of_eventuallyEq`), which
  Layers 1, 4 and 5 consume.
- Tau Ceti's theorem that the derivative of the gradient of a convex function is a positive
  operator (`ConvexOn.isPositive_of_hasFDerivAt_gradient`), one of the two routes of 5.2.

Neighbouring roadmaps:

- UtilityRepresentationTheorems owns preferences and their utility representations; the
  statements here are about a utility function. Its 2.3, Debreu's theorem
  (`exists_continuous_isUtility_of_secondCountable`), gives a continuous utility `w` for every
  continuous total preorder on a second-countable space, in particular on the subtype
  `Set.Ici (0 : Fin ℓ → ℝ)`. Then `u x = w (x ⊔ 0)` is continuous and represents the preference
  on the orthant, so it satisfies the hypotheses of continuity and upper semicontinuity here.
  Local nonsatiation, a unique demand and the differentiability of the value functions or of
  demand, which other statements here assume, are not given by 2.3. Nothing of that roadmap is
  used, and this roadmap does not depend on it.
- ConvexAnalysisAndDuality defines the support function of a set as a supremum in the extended
  reals (its 2.1), characterizes the differentiability of a convex function at an interior point
  of its domain by a singleton subdifferential (its 3.3), and proves Danskin's theorem for a
  supremum over a nonempty compact index set (its 3.4). For `p ≫ 0` and a reachable level, the
  expenditure at `p` is minus the support function of the upper contour set at `−p` for the dot
  product pairing; that set is
  closed but need be neither convex nor compact, and 4.1 is proved here directly. This roadmap
  does not depend on that one.
- KakutaniFixedPointAndContinuousGames, 2.2, states Berge's maximum theorem. The continuity of
  the indirect utility and the upper hemicontinuity of demand are not stated here, and nothing
  here uses that theorem.
- NonlinearProgrammingOptimality lists the sensitivity of solutions and multipliers to
  parameters as outside its scope. Shephard's lemma and Roy's identity here are derivatives of the
  optimal values of two parametric problems, proved without Lagrange multipliers or
  differentiability of the objective; they are not statements of that roadmap.
- MathematicalStatisticsFoundations, 8.4, states Slutsky's lemma on convergence in distribution,
  an unrelated object; the matrix here is `slutskyMatrix`.

Outside the scope: revealed preference, including the derivation of negative semidefiniteness
from the weak axiom; exchange economies and equilibrium; producer theory (profit and cost
functions, Hotelling's lemma); the integrability problem (recovering a utility from a demand
function satisfying the Slutsky conditions); the continuity of demand and of the value functions
in the parameters; welfare measures (compensating and equivalent variation); consumption sets
other than the orthant; nonlinear prices.

## Exact supplier contracts

### From Mathlib

- `Mathlib/Data/Matrix/Mul.lean`: `dotProduct` (notation `⬝ᵥ`, `v ⬝ᵥ w = ∑ i, v i * w i`),
  `Matrix.mulVec` (notation `*ᵥ`). `Mathlib/LinearAlgebra/Matrix/Symmetric.lean`: `Matrix.IsSymm`
  (`Aᵀ = A`). `Mathlib/LinearAlgebra/Matrix/ToLin.lean`: `Matrix.toLin'` (the linear map
  `v ↦ M *ᵥ v`). `Mathlib/Topology/Algebra/Module/FiniteDimension.lean`:
  `LinearMap.toContinuousLinearMap` (for a finite-dimensional domain, a linear map as a continuous
  linear map).
- `Mathlib/Topology/MetricSpace/Bounded.lean`: `Metric.isCompact_of_isClosed_isBounded` (in a
  proper space, a closed bounded set is compact). `Mathlib/Topology/Order/Compact.lean`:
  `IsCompact.exists_isMinOn` (a function continuous on a nonempty compact set attains its
  minimum there).
- `Mathlib/Topology/Semicontinuity/Basic.lean`: `UpperSemicontinuousOn`;
  `UpperSemicontinuousOn.exists_isMaxOn` (on a nonempty compact set an upper semicontinuous
  function attains its maximum); `UpperSemicontinuousOn.bddAbove_of_isCompact` (and is bounded
  above); `ContinuousOn.upperSemicontinuousOn`.
- `Mathlib/Algebra/Order/Archimedean/Real/Basic.lean`: `Real.sSup_empty`, `Real.sInf_empty`,
  `Real.sSup_of_not_bddAbove`, `Real.sInf_of_not_bddBelow` (the value `0` on empty and unbounded
  sets). `Mathlib/Basic/Real/Pointwise.lean`: `Real.sInf_smul_of_nonneg`
  (`sInf (a • s) = a • sInf s` for `0 ≤ a`).
- `Mathlib/Analysis/Convex/Function.lean`: `ConcaveOn`. `Mathlib/Analysis/Convex/Continuous.lean`:
  `ConcaveOn.continuousOn_interior` (in finite dimension, concave on `C` implies continuous on the
  interior of `C`). `Mathlib/Analysis/Convex/Quasiconvex.lean`:
  `QuasiconvexOn 𝕜 s f` (every sublevel set `{x ∈ s | f x ≤ r}` is convex).
- `Mathlib/Analysis/Calculus/LocalExtr/Basic.lean`: `IsLocalMin.hasFDerivAt_eq_zero` (a local
  minimum of a function with derivative `f'` has `f' = 0`).
  `Mathlib/Analysis/Calculus/FDeriv/Comp.lean`: `HasFDerivAt.comp` (the chain rule).
  `Mathlib/Analysis/Calculus/FDeriv/Symmetric.lean`: `second_derivative_symmetric_of_eventually`
  (over `ℝ`, if `f` has derivative `f' y` at every `y` near `x` and `f'` has derivative `f''` at
  `x`, then `f'' v w = f'' w v`). `Mathlib/Analysis/Calculus/LineDeriv/Basic.lean`:
  `HasFDerivAt.apply_self_eq_smul_of_eventuallyEq` (if `f (t • x) = w t • f x` for `t` near `1`
  and `w` has derivative `w'` at `1`, then `L x = w' • f x`).
- `Mathlib/Analysis/InnerProductSpace/PiL2.lean`: `EuclideanSpace.equiv` (the continuous linear
  equivalence between `EuclideanSpace 𝕜 ι` and `ι → 𝕜`). Core: `Function.uncurry`.

### From Tau Ceti

- `TauCeti/Analysis/Convex/Hessian.lean`: `ConvexOn.isPositive_of_hasFDerivAt_gradient` (on a
  real Hilbert space, if `F : E → ℝ` is convex on a neighbourhood `s` of `x`, differentiable near
  `x`, and its gradient has derivative `H` at `x`, then `H` is a positive operator: symmetric
  with `⟪H v, v⟫ ≥ 0`). The statements of `Suggested.lean` do not mention it and do not import
  the module.

## References

- Kim C. Border, lecture notes on his Caltech page (`kcborder.caltech.edu/Notes/`), with the page
  numbers printed in each file:
  - *Traditional Derivation of Demand Properties* (`Demand1.pdf`, version 2016.01.14);
  - *Duality Approach to Demand Properties* (`Demand2.pdf`, version 2020.10.12);
  - *Crib Sheet on Demand Theory* (`DemandBrief.pdf`, version 2016.01.15);
  - *Convex analysis and profit/cost/support functions* (`Profit-Cost.pdf`, version
    2016.05.04).
- The duality identities, Shephard's lemma, Roy's identity and the Slutsky equation carry the
  names Border gives them. Border's derivations assume a twice differentiable, strictly monotone
  and strongly quasiconcave utility with interior demand; every statement here drops those
  assumptions, and each one that the notes state only under them is marked "proved here" at its
  locator, with the route given above.
