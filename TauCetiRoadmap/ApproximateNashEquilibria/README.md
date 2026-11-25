# Roadmap: approximate Nash equilibria of bimatrix games

**Summary.** In a bimatrix game the row player chooses a mixed strategy `x` over finitely many
rows, the column player a mixed strategy `y` over finitely many columns, and they receive the
expected payoffs `xᵀ A y` and `xᵀ B y`. A pair is an `ε`-approximate Nash equilibrium if neither
player can gain more than `ε` by deviating. It is `ε`-well-supported if, more strongly, every
action played with positive probability is within `ε` of a best response. Additive tolerances
only mean something once the scale of the payoffs is fixed, so the constructions here assume
that all entries of `A` and `B` lie in `[0, 1]`.

The first layer develops the two notions. Every `ε`-well-supported equilibrium is
`ε`-approximate, with no assumption on the payoffs; the converse fails, and at `ε = 0` both
notions are the Nash equilibria. A positive affine change of the payoffs multiplies the
tolerance by the same factor, which is why the normalisation is needed. The exact equilibria are
the Nash equilibria of RegretMinimizationAndEquilibria for two players, and for every `ε > 0`
there is a `δ > 0`, depending on the game, such that every `δ`-approximate equilibrium lies
within `ε` of an exact one.

The second layer proves two constructions for games with payoffs in `[0, 1]`. For `ε > 0`,
deleting the actions that are worse than some other action by at least `ε/2` and renormalising
turns every
`ε²/8`-approximate equilibrium into an `ε`-well-supported one whose supports lie inside the
original supports, whatever the numbers of actions. The construction of Daskalakis, Mehta and
Papadimitriou gives a `1/2`-approximate equilibrium with supports of size at most two and one:
pick any row, a best response of the column player to it, and a best response of the row player
to that column, and let the row player mix the two rows evenly.

The third layer is about equilibria with small supports. A mixed strategy is `k`-uniform if it is
the uniform distribution on a multiset of `k` actions. Sampling `k` actions independently from a
mixed strategy shows that, for finitely many functions with values in `[0, 1]`, some `k`-uniform
strategy loses at most `ε` against it on all of them as soon as `log |J| < 2 k ε²`, where `|J|`
counts the functions. Applied to both strategies of a Nash equilibrium, this gives the headline:
in every game with payoffs in `[0, 1]`, `m ≥ 1` rows and `n ≥ 1` columns, for every `ε > 0`
and `k` with `2 log (2 max(m, n)) < k ε²`, there is a `k`-uniform `ε`-well-supported
equilibrium, inside the supports of any given Nash equilibrium and with payoffs within `ε/2` of
it.

The roadmap builds on RegretMinimizationAndEquilibria, whose probability simplex, expected
utility and Nash equilibria it copies and whose existence theorem for Nash equilibria gives the
unconditional form of the headline, and on Mathlib's Hoeffding inequality. Layer 1 holds the
definitions and their relations, Layer 2 the two constructions, Layer 3 the sampling theorem and
its consequence.

## Conventions

- **Games.** Rows `ι` and columns `κ` are finite types (`[Fintype ι] [Fintype κ]`), with
  `m = Fintype.card ι` and `n = Fintype.card κ`; payoff matrices are `A B : Matrix ι κ ℝ`, `A`
  for the row player and `B` for the column player, and both players maximize. `[DecidableEq]`
  is assumed where a statement uses `Pi.single` or multisets, and `[Nonempty]` only where an
  existence statement needs it.
- **Mixed strategies** are the points of `simplex ι` (copied verbatim from
  RegretMinimizationAndEquilibria, Conventions), the weight vectors of Mathlib's
  `Convexity.StdSimplex`; `Convexity.StdSimplex.range_toFun_comp_weights` identifies it with the
  nonnegative vectors of sum `1`. For an empty action type the simplex is empty.
- **Payoffs.** The expected payoffs are `x ⬝ᵥ (A *ᵥ y)` and `x ⬝ᵥ (B *ᵥ y)`; the first is the
  number RegretMinimizationAndEquilibria calls `Matrix.payoff A x y` (its 2.1), written out here
  because that definition sits at the root namespace and a copy would declare the same name
  twice. The payoff of row `a` against `y` is `(A *ᵥ y) a`, that of column `b` against `x` is
  `(x ᵥ* B) b`, and `x ⬝ᵥ (B *ᵥ y) = (x ᵥ* B) ⬝ᵥ y` (Mathlib `Matrix.dotProduct_mulVec`).
- **Normalisation.** The theorems of Layers 2 and 3 assume `∀ a b, A a b ∈ Set.Icc 0 1` and
  the same for `B` (for 3.1, values of the functions in `[0, 1]`); those of Layer 1 assume
  nothing on the payoffs. Each assumption comes with a Check showing it is needed.
- **Tolerances.** `ε` is a real number. For a negative `ε` no pair is `ε`-approximate or
  `ε`-well-supported; with payoffs in `[0, 1]` every pair of mixed strategies is `1`-well-supported.
- **`k`-uniform strategies.** `IsKUniform k x` says `x a = count a s / k` for a multiset `s` of
  `k` actions, with the division in `ℝ`. For `k = 0` it forces `x = 0`, which is not a mixed
  strategy; for `k ≥ 1` a `k`-uniform vector is a mixed strategy. The hypotheses on `k` in Layer 3
  are strict inequalities that exclude `k = 0`.
- **Logarithms and casts.** `Real.log` of a natural number is that of its cast to `ℝ`
  (`Real.log 0 = 0`). In `2 * Real.log (2 * max m n)` the maximum is taken in `ℕ` and cast.
- **Distances.** Distances between mixed strategies are measured in the sup norm of `ι → ℝ`
  (Mathlib's norm on finite products).

## Layer 1: approximate and well-supported equilibria

### 1.1 The two notions and their basic relations

Define:

- `IsApproxNash A B ε x y`: `x ∈ simplex ι`, `y ∈ simplex κ`,
  `x' ⬝ᵥ (A *ᵥ y) ≤ x ⬝ᵥ (A *ᵥ y) + ε` for every `x' ∈ simplex ι`, and
  `x ⬝ᵥ (B *ᵥ y') ≤ x ⬝ᵥ (B *ᵥ y) + ε` for every `y' ∈ simplex κ`;
- `IsWellSupportedNash A B ε x y`: `x ∈ simplex ι`, `y ∈ simplex κ`, and
  `(A *ᵥ y) a' ≤ (A *ᵥ y) a + ε` for all `a'` whenever `0 < x a`, and
  `(x ᵥ* B) b' ≤ (x ᵥ* B) b + ε` for all `b'` whenever `0 < y b`.

Prove (`isApproxNash_basic`), for all real `ε` and all `A`, `B`, `x`, `y`:

- every `ε`-well-supported equilibrium is `ε`-approximate;
- pure deviations suffice: `IsApproxNash A B ε x y` holds if and only if `x`, `y` are mixed
  strategies, `(A *ᵥ y) a ≤ x ⬝ᵥ (A *ᵥ y) + ε` for every row `a` and
  `(x ᵥ* B) b ≤ x ⬝ᵥ (B *ᵥ y) + ε` for every column `b`;
- `IsApproxNash A B 0 x y` holds if and only if `IsWellSupportedNash A B 0 x y`;
- for `c > 0` and real `d`, `d'`, the pair is `cε`-approximate for `(c A + d, c B + d')` (every
  entry shifted by `d`, respectively `d'`) if and only if it is `ε`-approximate for `(A, B)`.

The definitions are those of Chen, Deng and Teng (Definitions 7 and 8, p. 17), with "an action
worse by more than `ε` has weight zero" written as an inequality on the support. Daskalakis,
Mehta and Papadimitriou define approximate equilibria by pure deviations and note that every
well-supported equilibrium is approximate and that equilibria are unchanged by scaling and
shifting the payoffs (DMP, §2); Chen, Deng and Teng state the first item for `n × n` games with
entries in `[0, 1]` and `0 ≤ ε ≤ 1` (Lemma 5, part 2, p. 18). Here it holds with no hypothesis.
(Proved here.)

*Proof route.* Write `r = A *ᵥ y` and `M = max_a r a`. First item: for `x' ∈ simplex ι`,
`x' ⬝ᵥ r ≤ M`; and `x ⬝ᵥ r = Σ_{x a > 0} x a · r a ≥ (M − ε) Σ_a x a = M − ε`, since every
`a` with `x a > 0` has `r a ≥ M − ε`. Columns likewise, with `x ⬝ᵥ (B *ᵥ y') = (x ᵥ* B) ⬝ᵥ y'`.
Second item: `Pi.single a 1` is a mixed strategy and `Pi.single a 1 ⬝ᵥ r = r a`; conversely
`x' ⬝ᵥ r = Σ_a x' a · r a ≤ Σ_a x' a (x ⬝ᵥ r + ε) = x ⬝ᵥ r + ε`. Third item: one direction is
the first item at `ε = 0`; for the other, the second item gives `M ≤ x ⬝ᵥ r`, so
`Σ_a x a (M − r a) = M − x ⬝ᵥ r ≤ 0` is a sum of nonnegative terms, each of which vanishes:
`x a > 0` forces `r a = M`; columns likewise. Fourth item: for mixed `x'` and `y`,
`x' ⬝ᵥ ((c A + d) *ᵥ y) = c (x' ⬝ᵥ (A *ᵥ y)) + d`, since both have sum `1`; so each inequality for
`(c A + d, cε)` is the one for `(A, ε)` multiplied by `c > 0` with `d` added on both sides, and
the simplex conditions are the same.

*Needs:* Mathlib `Convexity.StdSimplex.range_toFun_comp_weights`, `Matrix.dotProduct_mulVec`,
`single_dotProduct`.

**Checks.**

- One column, `A = [[1], [0]]`, `x = (9/10, 1/10)`: the pair is a `1/10`-approximate equilibrium
  (the row player loses `1/10`), but the second row, played with probability `1/10`, is worse by
  `1`, so it is not `1/10`-well-supported. The converse of the first item fails.
- `A = 0`, `B = [[0, 0], [0, 1]]`, `x = (1/2, 1/2)`, `y = (1, 0)`: the pair is exactly
  `1/2`-approximate; multiplying both matrices by `10` makes it exactly `5`-approximate, as the
  fourth item says with `c = 10`. A tolerance is meaningful only relative to the payoff range.
- `c = 0` is excluded: with `c = 0` both matrices are constant and every pair of mixed
  strategies is `0`-approximate.
- With entries in `[0, 1]`, `(A *ᵥ y) a ∈ [0, 1]` for mixed `y`, so every pair of mixed
  strategies is `1`-well-supported and, by the first item, `1`-approximate.

### 1.2 Exact equilibria are the Nash equilibria of the finite game

Copy verbatim from RegretMinimizationAndEquilibria (3.1) `expectedUtility` and `IsNash`, with its
`variable` line. Encode a bimatrix game as a two-player finite game: players `Bool` (`false` the
row player, `true` the column player), action sets `biActions ι κ p = cond p κ ι` with the
instances `biActions.instFintype`, `biActions.instNonempty` and `biActions.instDecidableEq`
defined by cases on the player, utilities `biUtility A B` (`A` at `false`, `B` at `true`, of the
two coordinates of a pure profile) and the mixed profile `biProfile x y` (`x` at `false`, `y` at
`true`). Here `ι` and `κ` lie in one universe, as one action family requires, and are nonempty,
as the instances of `IsNash` require.

Prove (`isApproxNash_zero_iff_isNash`): `IsApproxNash A B 0 x y` holds if and only if
`IsNash (biUtility A B) (biProfile x y)`. (Proved here.)

*Proof route.* The map `a ↦ (a false, a true)` is an equivalence from the pure profiles
`∀ p, biActions ι κ p` to `ι × κ`, and `∏_p σ p (a p) = σ true (a true) · σ false (a false)`
(`Fintype.prod_bool`); reindexing the sum (`Fintype.sum_equiv`) shows that
`expectedUtility (biUtility A B) (biProfile x y) false` equals
`Σ_{a,b} x a · y b · A a b = x ⬝ᵥ (A *ᵥ y)`, and the same with `B` at `true`, for all weight
vectors `x`, `y`.
`Function.update (biProfile x y) false τ = biProfile τ y` and
`Function.update (biProfile x y) true τ = biProfile x τ` (case analysis on the player), and
`biProfile x y p ∈ simplex (biActions ι κ p)` for both `p` says `x ∈ simplex ι` and
`y ∈ simplex κ`. So the condition of `IsNash` at `false` is the row condition of
`IsApproxNash A B 0 x y` and the one at `true` the column condition.

*Needs:* RegretMinimizationAndEquilibria 3.1 (`expectedUtility`, `IsNash`, copied); Mathlib
`Fintype.prod_bool`, `Fintype.sum_equiv`.

**Checks.**

- The battle of the sexes `A = [[2, 0], [0, 1]]`, `B = [[1, 0], [0, 2]]`: on the grid of
  strategies with denominator `30` the `0`-approximate equilibria are exactly
  `((1, 0), (1, 0))`, `((0, 1), (0, 1))` and `((2/3, 1/3), (1/3, 2/3))`, the three equilibria
  RegretMinimizationAndEquilibria lists in the Checks of its 3.1.
- Which player is which: at the pure profile `biProfile (Pi.single a 1) (Pi.single b 1)` the
  product of the weights is `1` at the action pair `(a, b)` and `0` elsewhere, so the expected
  utility of player `false` is `A a b` and that of player `true` is `B a b`.

### 1.3 Approximate equilibria are close to exact ones

Prove (`exists_pos_forall_isApproxNash_near`): for every game `(A, B)` and every `ε > 0` there
is `δ > 0` such that for every `δ`-approximate equilibrium `(x, y)` there is a
`0`-approximate equilibrium `(x₀, y₀)` with `‖x − x₀‖ < ε` and `‖y − y₀‖ < ε`. The `δ` depends
on the game. (Proved here.)

*Proof route.* Let `S = simplex ι ×ˢ simplex κ`, a compact set: each simplex is the range of the
continuous weight map on the compact space `Convexity.StdSimplex ℝ ι`
(`Convexity.StdSimplex.compactSpace`, `Convexity.StdSimplex.isClosedEmbedding_toFun_comp_weights`,
`isCompact_range`). Let `g (x, y)` be the larger of `max_a (A *ᵥ y) a − x ⬝ᵥ (A *ᵥ y)` and
`max_b (x ᵥ* B) b − x ⬝ᵥ (B *ᵥ y)`, a continuous function (a maximum of finitely many
polynomials). By the second item of 1.1, for `(x, y) ∈ S` and `δ ≥ 0`, `(x, y)` is
`δ`-approximate if and only if `g (x, y) ≤ δ`; in particular `g ≥ 0` on `S`. Let `E` be the set
of `0`-approximate equilibria and `K` the set of `p ∈ S` such that for every `q ∈ E`,
`ε ≤ ‖p.1 − q.1‖` or `ε ≤ ‖p.2 − q.2‖`. `K` is an intersection of closed sets inside `S`, hence
compact (`IsCompact.of_isClosed_subset`). If `K` is empty, take `δ = 1`: a `1`-approximate
equilibrium lies in `S` but not in `K`, which is the claim. Otherwise `g` attains its minimum on
`K` at some `p₀` (`IsCompact.exists_isMinOn`), and `g p₀ > 0`: if `g p₀ = 0`, then `p₀ ∈ E`, and
`q = p₀` violates the defining condition of `K` because `ε > 0`. Take `δ = g p₀ / 2`. A
`δ`-approximate `p` lies in `S` with `g p ≤ δ < g p₀`, so `p ∉ K`, which is the claim. If `ι` or
`κ` is empty, `S` and `K` are empty and there are no approximate equilibria.

*Needs:* 1.1; Mathlib `Convexity.StdSimplex.compactSpace`,
`Convexity.StdSimplex.isClosedEmbedding_toFun_comp_weights`, `isCompact_range`,
`IsCompact.of_isClosed_subset`, `IsCompact.exists_isMinOn`.

**Checks.**

- Matching pennies with payoffs in `{0, 1}`, `A = [[1, 0], [0, 1]]`, `B = [[0, 1], [1, 0]]`,
  `x = (p, 1 − p)`, `y = (q, 1 − q)`: the two regrets add up to `|p − 1/2| + |q − 1/2|` (exact on
  a grid with denominator `48`), and the unique equilibrium is the uniform pair; so every
  `δ`-approximate equilibrium is within `2δ` of it, and `δ = ε/4` works for this game.
- `δ` cannot be chosen from `ε` alone: in the one-row game with `B = [[0, t]]`, `0 < t ≤ 1`, the
  unique equilibrium has the column player on the second column, while `y = (1, 0)` is a
  `t`-approximate equilibrium at distance `1` from it.
- `ε > 0` is needed: in a `1 × 1` game the unique pair is an equilibrium, and no distance is
  negative.

### Examples

The `1 × 2` and `2 × 1` games of the Checks, matching pennies, the battle of the sexes, and the
games `A = 0`, `B = [[0, 0], [0, 1]]` scaled by `1` and by `10`.

### Dependencies

1.1 uses Mathlib's simplex and dot products; 1.2 uses 1.1 and RegretMinimizationAndEquilibria 3.1
(copied definitions); 1.3 uses 1.1 and Mathlib's compactness of the simplex.

## Layer 2: two constructions in normalised games

### 2.1 From approximate to well-supported equilibria

Prove (`exists_isWellSupportedNash_of_isApproxNash`): let all entries of `A` and `B` lie in
`[0, 1]`, let `ε ≥ 0`, and let `(u, v)` be an `ε²/8`-approximate equilibrium. Then there is an
`ε`-well-supported equilibrium `(x, y)` with `u a ≠ 0` whenever `x a ≠ 0` and `v b ≠ 0`
whenever `y b ≠ 0`.

The method, deleting the actions that are worse than another by at least `ε/2` and
renormalising, is that of Chen, Deng and Teng (Lemma 5, part 1, and its proof, p. 18), stated
there for `n × n` games with the tolerance `ε²/(8n)`. Here the games are rectangular and the
tolerance does not depend on the size: a single deviation that moves all the deleted weight to a
best response bounds the deleted mass directly. Since an `ε²/(8n)`-approximate equilibrium is
`ε²/8`-approximate, the statement contains theirs. (Proved here.)

*Proof route.* If `ε = 0`, take `(u, v)` itself (1.1, third item). If `ε ≥ 1`, take `(u, v)`
itself: with entries in `[0, 1]` every pair of mixed strategies is `1`-well-supported. Let
`0 < ε < 1`. Rows: put `r = A *ᵥ v`, let `S` be the set of rows `a` with `r a' ≥ r a + ε/2` for
some `a'`, `m = Σ_{a ∈ S} u a`, and `a⋆` a maximizer of `r` (which exists, `u` being a mixed
strategy on a nonempty type), so `a⋆ ∉ S`. The mixed strategy that moves the weight of `S` to
`a⋆` gains `Σ_{a ∈ S} u a (r a⋆ − r a) ≥ (ε/2) m`, and the gain is at most `ε²/8`; so
`m ≤ ε/4 < 1`. Columns: with `c = u ᵥ* B`, define `S'` and `m' ≤ ε/4` in the same way. Put
`x a = u a / (1 − m)` for `a ∉ S` and `0` on `S`, and `y b = v b / (1 − m')` for `b ∉ S'` and `0`
on `S'`; both are mixed strategies, supported inside the supports of `u` and `v`. Payoffs
against `y` differ from those against `v` by a nearly constant amount: for every row `a`,
`(A *ᵥ y) a − r a = (m'/(1 − m')) D a − E a` with `D a = Σ_{b ∉ S'} A a b · v b ∈ [0, 1 − m']` and
`E a = Σ_{b ∈ S'} A a b · v b ∈ [0, m']` (entries in `[0, 1]`). Hence for rows `a`, `a'`,
`((A *ᵥ y) a' − (A *ᵥ y) a) − (r a' − r a) ≤ m' + m' ≤ ε/2`. If `x a > 0`, then `a ∉ S`, so
`r a' < r a + ε/2` and `(A *ᵥ y) a' < (A *ᵥ y) a + ε` for every `a'`. Columns likewise, with `x`,
`u`, `m` and the entries of `B`.

*Needs:* 1.1.

**Checks.**

- All `2 × 2` games with entries in `{0, 1/2, 1}` and all `(u, v)` on the grid with denominator
  `4`, and all `2 × 2` games with entries in `{0, 1}` and the grid with denominator `8`: for
  the three least `ε` in `{1/8, 1/4, …, 7/8, 1, 3/2, 2, 3, 7/2}` with `ε²/8` at least the regret of
  `(u, v)`, the construction of the route gives an `ε`-well-supported equilibrium inside the
  supports, and the deleted masses are at most `ε/4` (exact).
- The payoffs must be normalised. With `A = [[0, 31], [1, 0]]`, `B = [[1, 0], [0, 0]]`,
  `u = (1, 0)`, `v = (31/32, 1/32)` and `ε = 1/2`, the pair `(u, v)` is `1/32`-approximate and
  `1/32 = ε²/8`; `B` has entries in `[0, 1]`. A well-supported pair inside the supports must have
  `x = (1, 0)`; against it the second column is worse by `1`, so `y = (1, 0)`; against that the
  first row is worse by `1`. So no `1/2`-well-supported equilibrium lies inside the supports.
- `ε ≥ 0` is needed: in a `1 × 1` game the unique pair is `1/8`-approximate (`ε = −1`), and no
  pair is `−1`-well-supported.

### 2.2 A `1/2`-approximate equilibrium with supports of size at most two

Prove (`isApproxNash_half`): let all entries of `A` and `B` lie in `[0, 1]`, let `a₁` be any
row, `b` a best response of the column player to `a₁` (`B a₁ b' ≤ B a₁ b` for all `b'`), and
`a₂` a best response of the row player to `b` (`A a' b ≤ A a₂ b` for all `a'`). Then the row
strategy `(1/2) • Pi.single a₁ 1 + (1/2) • Pi.single a₂ 1` against the column strategy
`Pi.single b 1` is a `1/2`-approximate equilibrium. The row strategy is supported on `{a₁, a₂}`
(the single row `a₁` when `a₁ = a₂`) and the column strategy on `{b}`; every game with nonempty
action sets has such a triple, since a function on a finite nonempty type has a maximizer
(`Finite.exists_max`).

(Daskalakis, Mehta and Papadimitriou, §3, Theorem 1 and its proof, for games with `n` actions
per player; here rectangular, with the same proof.)

*Proof route.* By the second item of 1.1 it suffices to test pure deviations. Row player: the
payoff is `(A a₁ b + A a₂ b)/2` and the best deviation is `a₂`, so the gain is
`(A a₂ b − A a₁ b)/2 ≤ 1/2`, as `A a₂ b ≤ 1` and `A a₁ b ≥ 0`. Column player: the payoff is
`(B a₁ b + B a₂ b)/2`, and for every `b'`,
`(B a₁ b' + B a₂ b')/2 ≤ B a₁ b / 2 + 1/2 ≤ (B a₁ b + B a₂ b)/2 + 1/2`, using `B a₁ b' ≤ B a₁ b`,
`B a₂ b' ≤ 1` and `B a₂ b ≥ 0`.

*Needs:* 1.1; Mathlib `Finite.exists_max` (for the existence of a triple).

**Checks.**

- The bound is attained: `A = 0`, `B = [[0, 0], [0, 1]]`, `a₁` the first row, `b` the first
  column (a best response to `a₁`, tied), `a₂` the second row (a best response to `b`, tied):
  against `x = (1/2, 1/2)` the second column pays `1/2` and `b` pays `0`.
- All `2 × 2` games with entries in `{0, 1/2, 1}` and every admissible choice of `a₁`, `b`, `a₂`
  (23328 instances): the regret never exceeds `1/2` (exact).
- The payoffs must be normalised: with `A = [[0], [2]]` (one column) the row player's gain is `1`;
  with `A = 0` and `B = [[0, 0], [0, 2]]` the column player's gain is `1`. In each case the other
  matrix has entries in `[0, 1]`.
- Pure strategies for both players do not suffice for any tolerance below `1`: in matching
  pennies with payoffs in `{0, 1}` every pure pair leaves one player a gain of `1`.

### Examples

Matching pennies with payoffs in `{0, 1}`; the game `A = 0`, `B = [[0, 0], [0, 1]]`; the
counterexample `A = [[0, 31], [1, 0]]`, `B = [[1, 0], [0, 0]]` of 2.1.

### Dependencies

2.1 and 2.2 use 1.1; 2.2 uses Mathlib `Finite.exists_max` for the existence of its triple.

## Layer 3: equilibria with small supports

### 3.1 The sampling theorem

Define `IsKUniform k x`: there is a multiset `s` of actions with `Multiset.card s = k` and
`x a = count a s / k` for every `a`.

Prove (`exists_isKUniform_ge`): let `J` be a finite type, `f : J → ι → ℝ` with values in
`[0, 1]`, `x` a mixed strategy, `ε > 0` and `k` a natural number with
`Real.log |J| < 2 k ε²`. Then there is a `k`-uniform `x'` with `x a ≠ 0` whenever `x' a ≠ 0`
and `x ⬝ᵥ f c − ε ≤ x' ⬝ᵥ f c` for every `c ∈ J`.

The inequality is strict. With `≤`, one function (`log 1 = 0`) would admit `k = 0`, and the only
`0`-uniform vector is `0`. Lipton and Young (Theorem 2 and its proof, p. 3) state it for the
columns of a zero-sum matrix game (the functions `a ↦ M a c`, `|J|` the number of columns) with
`k ≥ ln |J| / (2ε²)` in the statement and the strict inequality in the proof, and attribute it
also to Althöfer. Here the family is any finite family, with the same proof, and the support
condition is added. (Proved here.)

*Proof route.* The hypothesis forces `k ≥ 1`, because `Real.log |J| ≥ 0`
(`Real.log_natCast_nonneg`). Give `ι` the discrete σ-algebra (`⊤`; every function out of it is
measurable, `measurable_from_top`), let `P` be the law of `x`, the measure of the probability
mass function with masses `x a` (`PMF.ofFintype`, `PMF.toMeasure`, the masses summing to `1` by
`ENNReal.ofReal_sum_of_nonneg`), and let `μ = Measure.pi (fun _ : Fin k ↦ P)` on `Fin k → ι`, a
probability measure. Fix `c ∈ J`. For `s : Fin k` let `Z s ω = x ⬝ᵥ f c − f c (ω s)`.

- `x ⬝ᵥ f c` is the mean of `ω ↦ f c (ω s)` (`MeasureTheory.measurePreserving_eval`,
  `PMF.integral_eq_sum`), so `hasSubgaussianMGF_of_mem_Icc`, applied to `ω ↦ −f c (ω s)` with
  values in `[−1, 0]`, says that `Z s` has a sub-Gaussian moment generating function with
  parameter `(‖0 − (−1)‖₊/2)² = 1/4`.
- The `Z s`, `s : Fin k`, are independent under `μ` (`iIndepFun_pi`).
- Hoeffding's inequality (`measure_sum_ge_le_of_iIndepFun`, at level `k ε ≥ 0`) bounds the
  measure of `E c = {ω | k ε ≤ Σ_s Z s ω}` by `exp (−(kε)²/(2 · k/4)) = exp (−2 k ε²)`.

The set `N` of `ω` with `x (ω s) = 0` for some `s` is `μ`-null, since each coordinate has law
`P`. By the union bound (`measureReal_iUnion_fintype_le`), `N ∪ ⋃_c E c` has measure at most
`|J| exp (−2 k ε²)`, which is `< 1`: trivially if `|J| = 0`, and otherwise because
`Real.log |J| < 2 k ε²` means `|J| < exp (2 k ε²)` (`Real.log_lt_iff_lt_exp`). So some `ω` lies
outside. Let `s` be the multiset of the values `ω 0, …, ω (k − 1)` (`Multiset.card_map`) and
`x' a = count a s / k`. Then `x' ⬝ᵥ f c = (1/k) Σ_s f c (ω s)`, and `ω ∉ E c` says
`x ⬝ᵥ f c − x' ⬝ᵥ f c < ε`; `ω ∉ N` says that every action of `s` has positive weight under `x`.

*Needs:* Mathlib `ProbabilityTheory.HasSubgaussianMGF.measure_sum_ge_le_of_iIndepFun`,
`ProbabilityTheory.hasSubgaussianMGF_of_mem_Icc`, `ProbabilityTheory.iIndepFun_pi`,
`MeasureTheory.Measure.pi`, `MeasureTheory.measurePreserving_eval`, `PMF.ofFintype`,
`PMF.toMeasure`, `PMF.integral_eq_sum`, `MeasureTheory.measureReal_iUnion_fintype_le`,
`ENNReal.ofReal_sum_of_nonneg`, `measurable_from_top`, `Real.log_lt_iff_lt_exp`,
`Real.log_natCast_nonneg`, `Multiset.card_map`.

**Checks.**

- Every `x` with weights in multiples of `1/4` on `1`, `2` or `3` actions, every multiset of at
  most three functions (at most two for three actions) with values in `{0, 1/2, 1}`,
  `ε ∈ {1/2, 1/3}` and the two least admissible `k`: an exhaustive search over the `k`-uniform
  vectors inside the support of `x` finds one that loses at most `ε` on every function (28840
  instances, exact).
- Strictness: for one function the non-strict form admits `k = 0`, where `x' = 0`; with
  `f = (1, 0)`, `x = (1, 0)` and `ε = 1/2` the inequality `0 ≥ 1 − 1/2` fails.
- Normalisation: `f 0 = (4, 0)`, `f 1 = (0, 4)`, `x = (1/2, 1/2)`, `ε = 1`, `k = 1`
  (`log 2 < 2`): each `1`-uniform `x'` loses `2` on one of the two functions. With values
  `(1, 0)` and `(0, 1)` instead, `x' = (1, 0)` loses `1/2`.
- `ε > 0` is needed: for `x` pure the only `k`-uniform `x'` inside its support is `x`, and with
  `ε = −1`, one function and `k = 1` the conclusion `x ⬝ᵥ f + 1 ≤ x ⬝ᵥ f` fails.

### 3.2 Uniform equilibria with logarithmic support

Let all entries of `A` and `B` lie in `[0, 1]`, `ε > 0`, and `k` a natural number with
`2 · Real.log (2 · max m n) < k ε²`. Prove:

- (`exists_isKUniform_near_isApproxNash_zero`) for every `0`-approximate equilibrium
  `(xs, ys)` there are `k`-uniform `x` and `y`, supported inside the supports of `xs` and `ys`,
  such that `(x, y)` is `ε`-well-supported and `|x ⬝ᵥ (A *ᵥ y) − xs ⬝ᵥ (A *ᵥ ys)| ≤ ε/2` and
  `|x ⬝ᵥ (B *ᵥ y) − xs ⬝ᵥ (B *ᵥ ys)| ≤ ε/2`;
- (`exists_isKUniform_isWellSupportedNash`) if `ι` and `κ` are nonempty and lie in one universe,
  there are `k`-uniform `x` and `y` such that `(x, y)` is `ε`-well-supported.

By the first item of 1.1 these pairs are also `ε`-approximate. That approximate equilibria with
supports of logarithmic size exist is due to Lipton, Markakis and Mehta. The hypothesis on `k`
is the one the route below gives, from 3.1 with accuracy `ε/2`; it gives
well-supported equilibria and holds for rectangular games. (Proved here.)

*Proof route.* For the first item, `xs` and `ys` are mixed strategies, so `ι` and `κ` are
nonempty. Apply 3.1 to `ys` on `κ`, with `J = ι ⊕ ι`, the functions `b ↦ A a b` and
`b ↦ 1 − A a b` for each row `a`, and accuracy `ε/2`. Its hypothesis
`Real.log (2 m) < 2 k (ε/2)²` follows from the hypothesis on `k`, since `|ι ⊕ ι| = 2 m`
(`Fintype.card_sum`) and `Real.log (2 m) ≤ Real.log (2 · max m n)` (`Real.log_le_log`).
It gives a `k`-uniform `y` inside the support of `ys`; as `k ≥ 1`, `y` is a mixed strategy, and
the two families of inequalities give `|(A *ᵥ y) a − (A *ᵥ ys) a| ≤ ε/2` for every row `a`.
Likewise 3.1 applied to `xs` with the functions `a ↦ B a b` and `a ↦ 1 − B a b` gives `x` with
`|(x ᵥ* B) b − (xs ᵥ* B) b| ≤ ε/2` for every column `b`. By the third item of 1.1, every row `a`
with `xs a > 0` has `(A *ᵥ ys) a = v := max_a (A *ᵥ ys) a = xs ⬝ᵥ (A *ᵥ ys)`. So for `x a > 0`,
hence `xs a > 0`, and every `a'`,
`(A *ᵥ y) a ≥ v − ε/2 ≥ (A *ᵥ ys) a' − ε/2 ≥ (A *ᵥ y) a' − ε`, and `(A *ᵥ y) a ≤ v + ε/2`;
averaging over `x` gives `|x ⬝ᵥ (A *ᵥ y) − v| ≤ ε/2`. Columns likewise, with
`x ⬝ᵥ (B *ᵥ y) = (x ᵥ* B) ⬝ᵥ y`. The two samples are drawn separately, so no joint union bound
is needed. For the second item, RegretMinimizationAndEquilibria's `exists_isNash` (3.1), applied
to `biUtility A B` with the instances of 1.2, gives `σ` with
`IsNash (biUtility A B) σ`; `σ = biProfile (σ false) (σ true)` (case analysis on the player), so
by 1.2 `(σ false, σ true)` is a `0`-approximate equilibrium, and the first item applies. The
universe condition comes from this route: RegretMinimizationAndEquilibria's action family lives
in one universe.

*Needs:* 1.1, 1.2, 3.1; RegretMinimizationAndEquilibria 3.1 (`exists_isNash`); Mathlib
`Fintype.card_sum`, `Real.log_le_log`, `Matrix.dotProduct_mulVec`.

**Checks.**

- For `m = n = 2` the least admissible `k` is `3` for `ε = 1`, `4` for `ε = 9/10` and `12` for
  `ε = 1/2` (`2 log 4 < 3`). Take every `2 × 2` game with entries in `{0, 1/2, 1}` with each of
  its pure equilibria and, when the indifference equations have a unique solution with all
  weights positive, that completely mixed equilibrium (11988 pairs of a game and an
  equilibrium), with `ε = 1, k = 3` and with `ε = 9/10, k = 4`; and every `2 × 2` game with
  entries in `{0, 1}` with its equilibria found the same way (580 pairs), with `ε = 1/2, k = 12`.
  In each case an exhaustive search finds a `k`-uniform `ε`-well-supported pair inside the
  supports with both payoffs within `ε/2`.
- The payoffs must be normalised: with `A = [[7, 0], [0, 7]]`, `B = [[0, 1], [1, 0]]` (entries of
  `B` in `[0, 1]`), `ε = 1/2` and `k = 13` (`2 log 4 < 13/4`), the uniform pair is an equilibrium
  but no pair of `13`-uniform strategies is `1/2`-well-supported: the row player's two payoffs
  differ by `7 |2q − 1| ≥ 7/13` for every `13`-uniform `y = (q, 1 − q)`, so the row strategy is
  pure, and then one of the two players is worse off by `1` or `7`. With `A = [[1, 0], [0, 1]]`
  a `13`-uniform `1/2`-well-supported pair exists.
- `ε > 0` is needed: in a `1 × 1` game `k = 2` satisfies `2 log 2 < k ε²` for `ε = −1`, and no
  pair is `−1`-well-supported.
- Matching pennies with payoffs in `{0, 1}` and `ε = 1/4`: no `1`-uniform pair is
  `1/4`-approximate and a `2`-uniform one is (the uniform pair), so `k` must grow as `ε`
  shrinks.

### Examples

Matching pennies; the counterexample `A = [[7, 0], [0, 7]]`, `B = [[0, 1], [1, 0]]`; all `2 × 2`
games over `{0, 1/2, 1}` with their pure and completely mixed equilibria.

### Dependencies

3.1 uses Mathlib's product measures, independence, Hoeffding's lemma and inequality and the union
bound; 3.2 uses 1.1, 1.2, 3.1 and RegretMinimizationAndEquilibria 3.1 (`exists_isNash`).

## Scope and ownership

This roadmap owns the definitions `IsApproxNash`, `IsWellSupportedNash` and `IsKUniform`, the
two-player encoding `biActions` (with its three instances), `biUtility` and `biProfile`, and the
targets 1.1–3.2. It copies `simplex`, `expectedUtility` and `IsNash` verbatim from
RegretMinimizationAndEquilibria (Conventions and 3.1), writes that roadmap's `Matrix.payoff` out
as `x ⬝ᵥ (A *ᵥ y)`, and uses its existence theorem `exists_isNash` (3.1) for the second item of
3.2. The second and third items of 1.1 are, through 1.2, the two-player cases of the
sufficiency of pure deviations and of the support property of Nash equilibria that
RegretMinimizationAndEquilibria states in its 3.1; they are stated here for the bimatrix notions,
with their short proofs, because 1.3, 2.1, 2.2 and 3.2 use them in this form.

Stated by RegretMinimizationAndEquilibria and not restated here: the minimax theorem for matrix
games (its 2.1); the guarantee that the averages of two no-regret players in a zero-sum game have
a small duality gap, which its 2.2 reads as an approximate equilibrium; the existence of Nash
equilibria and the sufficiency of pure deviations for `IsNash` (its 3.1); correlated and coarse
correlated equilibria (its 3.2 and 3.3).

These are classical facts about approximate equilibria of bimatrix games with payoffs in
`[0, 1]`; the recent preprint *An Exact Polynomial-Time Algorithm for 1/5-Approximate Nash
Equilibria in Bimatrix Games* (Google Research, cogentic_research_papers, 2026) recalls several of
them in its introduction; nothing here rests on it and none of its results is stated.

Not treated here: learning dynamics in games; lower bounds on the support size of approximate
equilibria; the approximation constants below `1/2` and the procedures that reach them; the
relation between approximate equilibria and the duality gap in zero-sum games; approximate
equilibria of games with more than two players; and the computational complexity of approximate
equilibria. No algorithm, running time or complexity class is a target: 2.1, 2.2 and 3.2 are
existence theorems about strategy pairs.

## Exact supplier contracts

### From Mathlib

- `Mathlib/Geometry/Convex/ConvexSpace/Defs.lean`:
  `Convexity.StdSimplex.range_toFun_comp_weights` (for a finite index type, the range of the
  weight map is the set of nonnegative vectors of sum `1`);
  `Mathlib/Geometry/Convex/ConvexSpace/Topology.lean`:
  `Convexity.StdSimplex.isClosedEmbedding_toFun_comp_weights` (finite index type);
  `Mathlib/Geometry/Convex/ConvexSpace/CompactSpaceStdSimplex.lean`:
  `Convexity.StdSimplex.compactSpace` (finite index type).
- `Mathlib/Data/Matrix/Mul.lean`: `Matrix.dotProduct_mulVec` (`v ⬝ᵥ (A *ᵥ w) = (v ᵥ* A) ⬝ᵥ w`),
  `single_dotProduct` (`Pi.single i c ⬝ᵥ v = c * v i`).
- `Mathlib/Data/Fintype/BigOperators.lean`: `Fintype.prod_bool`;
  `Mathlib/Algebra/BigOperators/Group/Finset/Defs.lean`: `Fintype.sum_equiv` (sums over
  equivalent finite types); `Mathlib/Data/Fintype/Sum.lean`: `Fintype.card_sum`;
  `Mathlib/Data/Fintype/Lattice.lean`: `Finite.exists_max` (finite nonempty domain);
  `Mathlib/Data/Multiset/MapFold.lean`: `Multiset.card_map`.
- `Mathlib/Topology/Compactness/Compact.lean`: `isCompact_range` (compact domain, continuous
  map), `IsCompact.of_isClosed_subset`; `Mathlib/Topology/Order/Compact.lean`:
  `IsCompact.exists_isMinOn` (nonempty compact set, function continuous on it).
- `Mathlib/Analysis/SpecialFunctions/Log/Basic.lean`: `Real.log_le_log` (`0 < x`, `x ≤ y`),
  `Real.log_lt_iff_lt_exp` (`0 < x`), `Real.log_natCast_nonneg`.
- `Mathlib/Probability/Moments/SubGaussian.lean`:
  `ProbabilityTheory.HasSubgaussianMGF.measure_sum_ge_le_of_iIndepFun` (independent variables
  `X i`, each with a sub-Gaussian moment generating function with parameter `c i : ℝ≥0` on a
  finite set `s`, and `0 ≤ ε`: `μ.real {ω | ε ≤ Σ_{i ∈ s} X i ω} ≤ exp (−ε²/(2 Σ_{i ∈ s} c i))`);
  `ProbabilityTheory.hasSubgaussianMGF_of_mem_Icc` (probability measure, `X` a.e. measurable and
  a.e. in `[a, b]`: `X − μ[X]` has parameter `(‖b − a‖₊/2)²`).
- `Mathlib/Probability/Independence/Basic.lean`: `ProbabilityTheory.iIndepFun_pi` (probability
  measures, a.e. measurable `X i`: the coordinates of `Measure.pi μ` are independent).
- `Mathlib/MeasureTheory/Constructions/Pi.lean`: `MeasureTheory.Measure.pi` and its probability
  instance, `MeasureTheory.measurePreserving_eval` (probability measures);
  `Mathlib/MeasureTheory/Measure/Real.lean`: `MeasureTheory.measureReal_iUnion_fintype_le`;
  `Mathlib/MeasureTheory/MeasurableSpace/Basic.lean`: `measurable_from_top`.
- `Mathlib/Probability/ProbabilityMassFunction/Constructions.lean`: `PMF.ofFintype` (masses of sum
  `1`); `Mathlib/Probability/ProbabilityMassFunction/Basic.lean`: `PMF.toMeasure`;
  `Mathlib/Probability/ProbabilityMassFunction/Integrals.lean`: `PMF.integral_eq_sum` (finite
  type, measurable singletons); `Mathlib/Basic/ENNReal/BigOperators.lean`:
  `ENNReal.ofReal_sum_of_nonneg` (nonnegative terms).

### From Tau Ceti

Nothing is used. The pinned Tau Ceti has no game theory; its Nash functions are semialgebraic
functions, unrelated to equilibria.

### From TauCetiRoadmap.RegretMinimizationAndEquilibria

- Conventions: `simplex` (copied verbatim).
- 2.1: `Matrix.payoff` (`x ⬝ᵥ (M *ᵥ y)`), written out rather than copied.
- 3.1: `expectedUtility` and `IsNash` (copied verbatim, with its `variable` line: players
  `[Fintype N] [DecidableEq N]`, action sets finite, nonempty, with decidable equality, in one
  universe); `exists_isNash` (every finite game has a mixed Nash equilibrium), used in 3.2.

## References

- X. Chen, X. Deng and S.-H. Teng, *Computing Nash equilibria: approximation and smoothed
  complexity*, arXiv:cs/0602043v2 (2006): Definitions 7 and 8, p. 17; Lemma 5 and its proof,
  p. 18.
- C. Daskalakis, A. Mehta and C. Papadimitriou, *A note on approximate Nash equilibria*, in
  *Internet and Network Economics (WINE 2006)*, Lecture Notes in Computer Science 4286, Springer,
  2006; journal version Theoret. Comput. Sci. 410 (2009), 1581–1588. Read in the authors'
  camera-ready version of the conference paper: §2 (definitions, normalisation), §3 Theorem 1
  and its proof. Cited above as DMP.
- R. J. Lipton and N. E. Young, *Simple strategies for large zero-sum games with applications to
  complexity theory*, STOC 1994; arXiv:cs/0205035v1 (2002): Definition 1 and Theorem 2 with its
  proof, p. 3. They attribute Theorem 2 also to I. Althöfer, *On sparse approximations to
  randomized strategies and convex combinations*, Linear Algebra Appl. 199 (1994).
- R. J. Lipton, E. Markakis and A. Mehta, *Playing large games using simple strategies*,
  Proceedings of the 4th ACM Conference on Electronic Commerce (2003), 36–41: the existence of
  approximate equilibria with supports of logarithmic size, attributed in prose (3.2).
