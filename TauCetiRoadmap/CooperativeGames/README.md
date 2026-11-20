# Roadmap: cooperative games in characteristic-function form

**Summary.** Develop the theory of cooperative games with transferable utility on a finite set of
players. A game assigns a real worth to every coalition. The roadmap builds the vector space of
such set functions with its basis of unanimity games and the Harsanyi dividends, which are the
Möbius transform on the subset lattice. It defines the core and proves Shapley's theorems on
convex games: every marginal vector lies in the core, the marginal vectors are exactly the extreme
points of the core, and the core is their convex hull; it proves the converse of Ichiishi and
Weber's inclusion of the core of any game in the convex hull of the marginal vectors. It proves
the Bondareva–Shapley theorem, that the core is nonempty exactly when the game is balanced, in the
form with all balanced weights, in the sharp form with minimal balanced collections, and as a
linear programming duality. It defines the Shapley value by Shapley's coalition formula and proves
the random-order formula, efficiency, the dividend formula, Shapley's uniqueness theorem, Young's
characterization by marginal contributions, and that the Shapley value of a convex game lies in
its core. It treats simple games, whose core is determined by the veto players, and the Banzhaf
value. It ends with two applications: the permutation-sampling estimator of the Shapley value,
which is unbiased and satisfies a Hoeffding bound, and the baseline game of a function of several
variables, whose Shapley value recovers the summands of an additive function.

## How to read the build

Layer 1 is the algebra of set functions: the classes of games and the unanimity basis. Layer 2
defines the core and the marginal vectors and relates them; it uses 1.1. Layer 3 is the
Bondareva–Shapley theory; it uses only the core of 2.1. Layer 4 is the Shapley value; it uses
the dividends of 1.2, the marginal vectors of 2.2 and, for 4.6 alone, the core and 2.3. Layer 5
uses 1.2, 2.1, 2.2, 4.1 and 4.2. Layer 6 uses 2.2, 4.1 and 4.2. Layers 3 and 4 are independent
of each other, and Layers 5 and 6 are independent of each other and of Layer 3.

Each numbered target ends with a **Checks** list of tests that a wrong convention or a wrong
constant would fail, and a *Needs:* line naming the targets and suppliers it uses. Every claim
carries a source locator in parentheses, or says that it is proved here. `Suggested.lean` states
the definitions and headline theorems named in this README against the pinned APIs.

## Conventions

- **Players and coalitions.** `ι` is the type of players. A coalition is a `Finset ι`, and
  `[DecidableEq ι]` is assumed wherever a statement forms a union or an insertion of coalitions
  or decides an inclusion `S ⊆ T` or a membership `i ∈ S`. From 2.1 on `ι` is finite,
  `[Fintype ι]`; `n = Fintype.card ι`, and `univ` is the grand coalition. The statements 1.1,
  the inversion formula of 1.2 and the dividend criterion of 1.2 do not mention the grand
  coalition and hold for every `ι`. No statement assumes that `ι` is nonempty unless it says
  so.
- **Set functions and games.** A set function is `v : Finset ι → ℝ`; `v S` is the worth of `S`.
  A **game** is a set function with `v ∅ = 0`. Definitions are made for set functions. A theorem
  assumes `v ∅ = 0`, or `v ∅ ≤ 0`, only where its conclusion fails for some set function
  without the hypothesis, and a Check then gives such a set function. Set functions form the real
  vector space `Finset ι → ℝ` with pointwise operations, and games form a subspace of it.
- **Classes.** `v` is **monotone** when `Monotone v`; **superadditive** when
  `v S + v T ≤ v (S ∪ T)` for all disjoint `S`, `T`; **additive** when `v S = ∑ i ∈ S, a i` for
  some `a : ι → ℝ`; **convex**, or supermodular, when `v S + v T ≤ v (S ∪ T) + v (S ∩ T)` for
  all `S`, `T`. Convexity is stated with Tau Ceti's predicate, as `TauCeti.IsSubmodular (-v)`;
  no predicate of this roadmap wraps it.
- **Payoff vectors.** A payoff vector is `x : ι → ℝ`, and `x(S)` abbreviates `∑ i ∈ S, x i`.
- **Orders.** An order of the players is a bijection `σ : ι ≃ Fin (Fintype.card ι)`; `σ i` is
  the position of `i`, and `i` precedes `j` when `σ i < σ j`. There are `n!` orders.
- **Values.** A value is a map `ψ : (Finset ι → ℝ) → ι → ℝ`. A characterization theorem assumes
  its axioms only on the class of games it names, and concludes on that class.
- **Symmetric and null players.** Players `i` and `j` are **symmetric** in `v` when
  `v (insert i S) = v (insert j S)` for every `S` containing neither. Player `i` is **null** in
  `v` when `v (insert i S) = v S` for every `S`.
- **Sampling.** A sample of `m` orders is `s : Fin m → ι ≃ Fin (Fintype.card ι)`. The samples
  form a finite type with `(n!) ^ m` elements, and "the fraction of samples such that" and "the
  mean over all samples" are the normalized count and the normalized sum over it. This is
  independent uniform sampling of `m` orders with replacement.
- **Factorials and powers** are those of natural numbers, cast to `ℝ`. Every division in a
  definition or a displayed theorem is by a factorial, by a power of `2` or by the size of a
  coalition that contains a named player, except the division by `m` in the estimator of 6.1 and
  by `(b − a) ^ 2` in its bound; the Checks of 6.1 treat `m = 0` and `a = b`.

## Layer 1: set functions, unanimity games and dividends

### 1.1 Classes of games

With the classes of [Conventions](#conventions), prove:

- **increasing marginal contributions:** `v` is convex if and only if
  `v (insert i S) − v S ≤ v (insert i T) − v T` for all `S ⊆ T` and all `i ∉ T`
  (`isSubmodular_neg_iff_forall_insert`), for every set function `v` on every `ι`;
- a convex game is superadditive;
- a superadditive set function has `v ∅ ≤ 0`, and a superadditive set function with nonnegative
  values is monotone;
- nonnegative multiples of convex set functions are convex, and sums are convex by the supplier
  `IsSubmodular.add`; an additive set function and its negative are convex by the supplier
  `isSubmodular_finsetSum`, so adding an additive set function preserves convexity;
- **measure games:** for `m : ι → ℝ` with nonnegative values and `f : ℝ → ℝ` convex on
  `Set.Ici 0`, the set function `S ↦ f (∑ i ∈ S, m i)` is convex.

(Shapley RM-4571, Section 1: (1)–(3) for the classes, the remark after (3) for the second item,
the unnumbered display on increasing marginal utility for the first, and (4) of Section 1.1 for
measure games; proved here.)

**Checks.**

- `v S = |S| ^ 2` on three players is convex: the marginal contribution of a player to a
  coalition of size `s` is `2 s + 1`, which increases with `s`.
- The majority game on three players, `v S = 1` for `|S| ≥ 2` and `0` otherwise, is monotone and
  superadditive and not convex: `v {1, 2} + v {2, 3} = 2` and `v {1, 2, 3} + v {2} = 1`.
- The constant set function `1` is convex, with equality throughout, and not superadditive,
  since `1 + 1 > 1`: "a convex game is superadditive" needs `v ∅ = 0`.
- `v S = √|S|` on two players has `v {1} + v {2} = 2 > √2 + 0`: it satisfies the reversed
  inequality and is not convex.

*Needs:* Tau Ceti `TauCeti.IsSubmodular`, `IsSubmodular.add`, `isSubmodular_finsetSum`.

### 1.2 Unanimity games and dividends

Define `unanimity S`, for a coalition `S`, as the set function with value `1` at the coalitions
that contain `S` and `0` at the others. Define the **dividend** of `S` in `v` as

    dividend v S = ∑ R ∈ S.powerset, (-1) ^ (|S| − |R|) * v R.

Prove:

- **inversion:** `∑ S ∈ T.powerset, dividend v S = v T` for every set function `v` and every
  coalition `T`, on every `ι` (`sum_powerset_dividend`);
- **the unanimity basis:** for finite `ι` and `d : Finset ι → ℝ`,
  `v = ∑ S, d S • unanimity S` if and only if `d = dividend v` (`eq_sum_smul_unanimity_iff`).
  So the functions `unanimity S` form a basis of `Finset ι → ℝ`, which has dimension `2 ^ n`,
  and the coordinates of `v` are its dividends;
- `dividend v ∅ = v ∅`, so the functions `unanimity S` with `S` nonempty form a basis of the
  space of games, which has dimension `2 ^ n − 1`;
- `dividend` is linear in `v`, and the dividend of `unanimity S` is `1` at `S` and `0` at every
  other coalition;
- the dividends of the additive set function `S ↦ ∑ i ∈ S, a i` are `a i` at `{i}` and `0` at
  every other coalition;
- `unanimity S` is convex, monotone, and takes the values `0` and `1`; it is a game exactly when
  `S` is nonempty;
- **the dividend criterion:** if `dividend v S ≥ 0` for every `S` with at least two players,
  then `v` is convex (`isSubmodular_neg_of_dividend_nonneg`), on every `ι`.

The inversion follows by exchanging the two sums: the coefficient of `v R` is the signed sum
over the coalitions between `R` and `T`, which is `1` for `R = T` and `0` otherwise by the
first supplier; the second gives the dimension of the space of games. The criterion holds
because `v` restricted to the subsets of a coalition `U` is the sum of
`dividend v S • unanimity S` over `S ⊆ U`, the terms with at most one player are additive or
constant, and the others are convex. (Shapley P-295, Lemma 3 with (7) and (8), for the expansion
of a game; the criterion is proved here.)

**Checks.**

- The majority game on three players has dividend `1` at each pair, `−2` at the grand coalition
  and `0` elsewhere; the dividends of the subsets of the grand coalition sum to `3 − 2 = 1`.
- `unanimity {1}` has dividend `1` at `{1}`. The sign `(-1) ^ |R|` in place of
  `(-1) ^ (|S| − |R|)` would give `−1`.
- The constant set function `1` is `unanimity ∅`: its dividend is `1` at `∅` and `0` elsewhere,
  and it is not a game.
- `v S = max (|S| − 1) 0` on three players is convex and has dividend `−1` at the grand
  coalition: the converse of the dividend criterion fails.

*Needs:* 1.1; Tau Ceti `Finset.sum_Icc_neg_one_pow_card_sub_card_left`,
`TauCeti.card_nonempty_finset`.

### Examples

The majority game on three players, `v S = |S| ^ 2`, and the unanimity games.

### Dependencies

1.1 uses Tau Ceti's `TauCeti.IsSubmodular` with its two closure lemmas; 1.2 uses 1.1 and Tau
Ceti's signed sum over an interval of finsets and count of nonempty finsets.

## Layer 2: the core and marginal vectors

From here on `ι` is finite.

### 2.1 Payoff vectors, imputations and the core

A payoff vector `x` is **efficient** for `v` when `∑ i, x i = v univ`, and **individually
rational** when `v {i} ≤ x i` for every `i`; an **imputation** is an efficient individually
rational payoff vector. Define the **core**

    core v = {x | ∑ i, x i = v univ ∧ ∀ S, v S ≤ ∑ i ∈ S, x i}.

The coalition `S` ranges over all finsets, the empty one included. Prove, for every set function
`v`:

- for nonempty `ι`, the set of imputations is nonempty if and only if `∑ i, v {i} ≤ v univ`, and
  it is then the convex hull of the `n` points `j ↦ v {j} + (v univ − ∑ k, v {k}) * δ i j`,
  where `δ i j` is `1` for `i = j` and `0` otherwise;
- `core v` is convex and closed, and every `x ∈ core v` has
  `v {i} ≤ x i ≤ v univ − v (univ \ {i})`, so `core v` is compact and is contained in the set of
  imputations;
- if `core v` is nonempty, then `v ∅ ≤ 0` and `∑ k, v (P k) ≤ v univ` for every partition of
  `univ` into coalitions `P k`;
- the core of the additive set function `S ↦ ∑ i ∈ S, a i` is `{a}`;
- for `c > 0` and `a : ι → ℝ`, `x ∈ core v` if and only if `c • x + a` is in the core of
  `S ↦ c * v S + ∑ i ∈ S, a i`;
- `x ∈ core v` and `y ∈ core w` give `x + y ∈ core (v + w)`.

(Shapley RM-4601, Section 2, (1)–(2), and Nisan et al., Definition 15.3, in the cost convention
with the inequalities reversed, for the definition; Shapley P-295, Section 5, for the simplex of
imputations; proved here.)

**Checks.**

- Two players with `v {1} = v {2} = 0` and `v {1, 2} = 1`: the core is the segment
  `x₁ + x₂ = 1`, `x ≥ 0`, which is the set of imputations. `(1/2, 1/2)` is in it; `(2, −1)` is
  efficient and is not, since `x₂ < v {2}`. With the inequalities reversed, as for cost games,
  `(1/2, 1/2)` would be excluded.
- The majority game on three players has an empty core: the three pair constraints add up to
  `2 (x₁ + x₂ + x₃) ≥ 3`, against `x₁ + x₂ + x₃ = 1`.
- The glove game on three players, `v S = 1` when `S` contains player `1` and one of the players
  `2`, `3`, and `0` otherwise, has core `{(1, 0, 0)}`.
- If `v ∅ = 1` the core is empty, whatever the other values, by the constraint at `S = ∅`.
- For `c = 0` the covariance statement fails when `core v` is empty: the core of an additive set
  function is a point.
- For empty `ι` and `v ∅ = 1`: `∑ i, v {i} = 0 ≤ 1 = v univ`, and no payoff vector is efficient,
  so the imputation statement needs `ι` nonempty.

*Needs:* Mathlib `Metric.isCompact_of_isClosed_isBounded`.

### 2.2 Orders and marginal vectors

For an order `σ` define `predecessors σ i` as the coalition of the players `j` with
`σ j < σ i`, and the **marginal vector**

    marginalVector v σ i = v (insert i (predecessors σ i)) − v (predecessors σ i).

Prove:

- the number of orders is `n!` (the supplier), and for `i` and `S` with `i ∉ S` the number of
  orders `σ` with `predecessors σ i = S` is `|S|! * (n − 1 − |S|)!`;
- **telescoping:** for every `k ≤ n`, the sum of `marginalVector v σ i` over the `k` players in
  the first `k` positions of `σ` is `v P − v ∅`, where `P` is the coalition of those players; in
  particular `∑ i, marginalVector v σ i = v univ − v ∅`;
- `marginalVector v σ` is linear in `v`, and for the additive set function `S ↦ ∑ i ∈ S, a i` it
  is `a`, for every `σ`.

(Shapley RM-4571, Section 2.3, (9)–(10); proved here.)

**Checks.**

- `v S = |S| ^ 2` on three players: the order `1, 2, 3` gives `(1, 3, 5)`, and the six marginal
  vectors are the six rearrangements of `(1, 3, 5)`.
- The majority game on three players: the order `1, 2, 3` gives `(0, 1, 0)`; the second player
  completes a majority.
- With `σ j ≤ σ i` in place of `σ j < σ i` the player `i` would be its own predecessor and every
  marginal vector would be `0`.
- For empty `ι` there is exactly one order, and its marginal vector is the empty vector.
- `n = 3`, `S = {2}`, `i = 1`: one order, `2, 1, 3`, has `predecessors σ 1 = {2}`, and
  `1! * 1! = 1`.

*Needs:* Mathlib `Fintype.card_equiv`.

### 2.3 Marginal vectors of convex games

Prove, for a game `v` (`v ∅ = 0`): `v` is convex if and only if `marginalVector v σ ∈ core v`
for every order `σ` (`isSubmodular_neg_iff_forall_marginalVector_mem_core`).

For the forward direction, let `x = marginalVector v σ` and let `T` be a coalition other than
`univ`. Let `j` be the first player in the order `σ` outside `T`; its predecessors lie in `T`,
so by 1.1 `x j ≤ v (insert j T) − v T`, that is `x(T) − v T ≥ x(insert j T) − v (insert j T)`.
Repeating until the coalition is `univ` gives `x(T) − v T ≥ x(univ) − v univ = 0` by the
telescoping identity. For the converse, given `S` and `T`, take an order that lists `S ∩ T`
first, then `S \ T`, then `T \ S`. Its marginal vector `x` has `x(S ∩ T) = v (S ∩ T)`,
`x(S) = v S` and `x(S ∪ T) = v (S ∪ T)` by telescoping, and `x(T) ≥ v T` gives
`v (S ∪ T) − v S + v (S ∩ T) ≥ v T`. (Shapley RM-4571, Lemma 3 and its proof, for the forward
direction; the converse, known as Ichiishi's theorem, is proved here.)

**Checks.**

- `v S = |S| ^ 2` on three players: `(1, 3, 5)` satisfies `x₁ + x₂ = 4 = v {1, 2}`,
  `x₁ + x₃ = 6 ≥ 4`, `x₂ + x₃ = 8 ≥ 4` and `x₁ = 1 = v {1}`, and sums to `9`.
- The majority game on three players is not convex, and `(0, 1, 0)` gives the coalition `{1, 3}`
  the amount `0 < 1`.
- The constant set function `1` on one player is convex; its marginal vector is `0` and its core
  is empty. The equivalence needs `v ∅ = 0`.

*Needs:* 1.1, 2.1, 2.2.

### 2.4 The core and the convex hull of the marginal vectors

Prove:

- **Weber's inclusion:** for a game `v`,
  `core v ⊆ convexHull ℝ (Set.range (marginalVector v))`
  (`core_subset_convexHull_range_marginalVector`);
- for a convex game `v`, `(core v).extremePoints ℝ = Set.range (marginalVector v)`
  (`extremePoints_core_eq_range_marginalVector`);
- for a convex game `v`, `core v = convexHull ℝ (Set.range (marginalVector v))`
  (`core_eq_convexHull_range_marginalVector`).

For the inclusion, the convex hull `W` of the finitely many marginal vectors is compact, hence
closed. If `x ∈ core v` were outside `W`, the separation supplier would give `y : ι → ℝ` with
`∑ i, y i * x i < ∑ i, y i * marginalVector v σ i` for every `σ`. Choose `σ` listing the players
in order of decreasing `y`, and let `P k` be the coalition of its first `k` players and `y_k` the
value of `y` at its `k`-th player. Summation by parts and `v ∅ = 0` give

    ∑ i, y i * marginalVector v σ i = ∑ k < n, (y_k − y_(k+1)) * v (P k) + y_n * v univ,

with the sum over `1 ≤ k < n`, and the same identity holds for `x` with `x(P k)` in place of
`v (P k)`. Since `y_k − y_(k+1) ≥ 0`, `x(P k) ≥ v (P k)` and `x(univ) = v univ`, the left side is
at most `∑ i, y i * x i`, a contradiction. For a convex game the reverse inclusion holds because
the core is convex and contains the marginal vectors by 2.3. The extreme points of a convex hull
lie in the generating set; conversely `marginalVector v σ` is the only point of the core at
which the `n` constraints of the coalitions `P 1 ⊂ … ⊂ P n` are equalities, because these
equations determine a payoff vector, so it is an extreme point. (Shapley RM-4571, Theorems 2
and 3, for the extreme points of the core of a convex game; the inclusion is proved here.)

**Checks.**

- `v S = |S| ^ 2` on three players: the core is the hexagon in the plane `x₁ + x₂ + x₃ = 9`
  whose vertices are the six rearrangements of `(1, 3, 5)`.
- Two players with `v {1} = v {2} = 0`, `v {1, 2} = 1`: the marginal vectors are `(0, 1)` and
  `(1, 0)` and the core is the segment between them.
- The majority game on three players: the marginal vectors are the three unit vectors, their
  convex hull is a triangle and the core is empty, so equality fails without convexity.
- The glove game of 2.1 is not convex; its marginal vectors are the three unit vectors, its core
  `{(1, 0, 0)}` lies in their convex hull, and `(0, 1, 0)` is a marginal vector outside the core.
- One player with `v ∅ = −1` and `v {1} = 0`: the core is `{0}` and the only marginal vector is
  `1`, so the inclusion needs `v ∅ = 0`.
- For an additive game every marginal vector is `a`, and the core is `{a}`.

*Needs:* 2.1, 2.2, 2.3; Mathlib `Set.Finite.isCompact_convexHull`,
`geometric_hahn_banach_point_closed`, `Finset.sum_range_by_parts`,
`extremePoints_convexHull_subset`.

### Examples

The two-player game with `v {1, 2} = 1`, the majority and glove games on three players, and
`v S = |S| ^ 2`, whose core is a hexagon.

### Dependencies

2.1 uses Mathlib's Heine–Borel theorem; 2.2 uses Mathlib's count of bijections; 2.3 uses 1.1,
2.1 and 2.2; 2.4 uses 2.1–2.3 and Mathlib's separation theorem, summation by parts, and the
compactness and extreme points of convex hulls.

## Layer 3: balanced weights and the Bondareva–Shapley theorem

### 3.1 Balanced weights

Define `IsBalanced w`, for `w : Finset ι → ℝ`, as a structure with fields
`nonneg : ∀ S, 0 ≤ w S` and `sum_eq_one : ∀ i, ∑ S with i ∈ S, w S = 1`: the weights are
nonnegative, and the coalitions containing any given player have total weight `1`. The weight of
the empty coalition is not constrained; it occurs in no balance equation, and for a game it
multiplies `v ∅ = 0`. Prove:

- **double counting:** for balanced `w` and every payoff vector `x`,
  `∑ S, w S * x(S) = ∑ i, x i`;
- the indicator of a partition of `univ` into nonempty coalitions is balanced; so is the weight
  `1 / (n − 1).choose (k − 1)` on the coalitions of size `k` and `0` elsewhere, for `1 ≤ k ≤ n`;
- if `w` is balanced then `w S ≤ 1` for every nonempty `S`;
- the set of balanced weights is convex and closed, and the set of balanced weights with
  `w ∅ = 0` is compact; every balanced `w` is a balanced weight with `w ∅ = 0` plus a nonnegative
  multiple of the indicator of `{∅}`.

(Nisan et al., Definition 15.5, where the weights are indexed by all subsets; Shapley RM-4601,
Section 1; proved here.)

**Checks.**

- Three players: weight `1/2` on each pair is balanced, since each player is in two pairs;
  weight `1` on each pair is not.
- Three players: weight `1` on `{1}` and on `{2, 3}` is balanced. No positive weights on
  `{1, 2}` and `{2, 3}` alone are balanced: players `1` and `3` force both weights to be `1`,
  and player `2` then has total weight `2`.
- For empty `ι` there is no balance equation and every nonnegative `w` is balanced.
- A weight with `w {1} = −1` and `w {1, 2} = 2` on two players, completed by `w {2} = −1`,
  satisfies the balance equations and is not balanced.

*Needs:* Mathlib `Metric.isCompact_of_isClosed_isBounded`.

### 3.2 The Bondareva–Shapley theorem

Prove, for every set function `v`: `core v` is nonempty if and only if
`∑ S, w S * v S ≤ v univ` for every balanced `w` (`core_nonempty_iff_forall_isBalanced`).

If `x ∈ core v` and `w` is balanced, then `∑ S, w S * v S ≤ ∑ S, w S * x(S) = v univ` by double
counting. For the converse, apply Tucker's key lemma in `V = (ι → ℝ) × ℝ` to the family
consisting of `(1_S, −v S)` for each coalition `S`, of `(−1_univ, v univ)`, and of `(0, 1)`, at
the index of `(0, 1)`; here `1_S` is the indicator vector of `S`. It gives nonnegative
coefficients `λ S`, `μ`, `τ` with

    ∑ S, λ S • (1_S, −v S) + μ • (−1_univ, v univ) + τ • (0, 1) = 0

and a functional `(z, t) ↦ ∑ i, p i * z i + q * t`, nonnegative on the family, with `τ + q > 0`.
Nonnegativity on the family says `q ≥ 0`, `p(S) ≥ q * v S` for all `S`, and
`p(univ) ≤ q * v univ`. If `q > 0`, then `p / q ∈ core v`. If `q = 0`, then `τ > 0`, the first
component gives `∑ S, λ S • 1_S = μ • 1_univ`, and the second gives
`∑ S, λ S * v S = μ * v univ + τ > μ * v univ`. If `μ > 0`, the weights `λ S / μ` are balanced
and violate the inequality. If `μ = 0`, then `λ S = 0` for nonempty `S`, so `λ ∅ * v ∅ = τ > 0`
and `v ∅ > 0`; the weight `1` on `univ` increased by `1` at `∅` is then balanced, with value
`v univ + v ∅ > v univ`.
(Nisan et al., Theorem 15.6, for cost games, where it bears the names of Bondareva and Shapley,
and Shapley RM-4601, Theorem 1; proved here.)

**Checks.**

- The majority game on three players: weight `1/2` on each pair gives `3/2 > 1 = v univ`, so the
  core is empty, as in 2.1.
- Two players with `v {1} = v {2} = 0`, `v {1, 2} = 1`: the balanced weights with `w ∅ = 0` are
  `w {1} = w {2} = 1 − t`, `w {1, 2} = t` with `0 ≤ t ≤ 1`, and `∑ S, w S * v S = t ≤ 1`.
- Three players with `v {i} = 0`, `v {1, 2} = a`, `v {1, 3} = b`, `v {2, 3} = c` and
  `v univ = 1`: the core is nonempty exactly when `a + b + c ≤ 2` and `a, b, c ≤ 1` (Shapley
  RM-4601, Section 3, (6)–(7)).
- One player with `v ∅ = 1`, `v {1} = 0`: the core is empty, and `w ∅ = 1`, `w {1} = 1` is
  balanced with `∑ S, w S * v S = 1 > 0`. Both sides of the equivalence are false, and they
  would disagree if `w ∅` were required to vanish.
- Empty `ι`: the core is nonempty exactly when `v ∅ = 0`, and `w ∅ * v ∅ ≤ v ∅` holds for all
  `w ∅ ≥ 0` exactly when `v ∅ = 0`.

*Needs:* 2.1, 3.1; Tau Ceti
`TauCeti.exists_nonneg_sum_smul_eq_zero_and_coeff_add_dual_pos_at`.

### 3.3 Minimal balanced collections

The **support** of a balanced `w` is the collection of the coalitions `S` with `w S > 0`. A
collection of nonempty coalitions is **balanced** when it is the support of a balanced weight,
and **minimal balanced** when no proper subcollection is balanced. Prove:

- a minimal balanced collection is the support of exactly one balanced weight, and it has at
  most `n` coalitions;
- `w` is an extreme point of the set `{w | IsBalanced w}` if and only if `w` is balanced,
  `w ∅ = 0`, and the support of `w` is a minimal balanced collection;
- **the sharp form:** for a set function `v` with `v ∅ ≤ 0`, `core v` is nonempty if and only if
  `∑ S, w S * v S ≤ v univ` for every extreme point `w` of `{w | IsBalanced w}`
  (`core_nonempty_iff_forall_mem_extremePoints`).

The set of balanced weights with `w ∅ = 0` is compact and convex, so by the Krein–Milman theorem
it is the closure of the convex hull of its extreme points, and a linear inequality that holds at
the extreme points holds on it; a general balanced weight adds the term `w ∅ * v ∅ ≤ 0`. Then
apply 3.2. (Shapley RM-4601, Section 1 for uniqueness of the weights, Lemma 2 for the extreme
points, and Theorem 2. That source takes balanced sets among the proper coalitions; here
`{univ}` is one more minimal balanced collection, with the inequality `v univ ≤ v univ`. Proved
here.)

**Checks.**

- Three players: there are six extreme points, the indicators of the five partitions of
  `{1, 2, 3}` and the weight `1/2` on each pair.
- Four players: there are `42` extreme points, and each support has at most four coalitions.
- Three players with `v {i} = 0`: the six inequalities are `v univ ≤ v univ`, `0 ≤ v univ`,
  the three inequalities `v {i, j} ≤ v univ`, and
  `v {1, 2} + v {1, 3} + v {2, 3} ≤ 2 * v univ`; the last is (8) of Shapley RM-4601,
  Section 3.
- One player: the only extreme point is weight `1` on `{1}`, the inequality is
  `v {1} ≤ v {1}`, and the core is `{v {1}}` when `v ∅ ≤ 0`.
- One player with `v ∅ = 1`: the inequality at the extreme point holds and the core is empty,
  so the sharp form needs `v ∅ ≤ 0`.

*Needs:* 3.1, 3.2; Mathlib `closure_convexHull_extremePoints`.

### 3.4 Duality for the core

Prove, for a set function `v` with `v ∅ ≤ 0`: there is a real `c` that is the least element of

    {t | ∃ x : ι → ℝ, (∀ S, v S ≤ ∑ i ∈ S, x i) ∧ ∑ i, x i = t}

and the greatest element of `{t | ∃ w, IsBalanced w ∧ ∑ S, w S * v S = t}`
(`exists_isLeast_isGreatest_isBalanced`). Moreover `c ≥ v univ`, with equality exactly when
`core v` is nonempty.

The first set is closed, nonempty and bounded below by `v univ`, and the payoff vectors of total
at most a given bound that meet all constraints form a compact set, so the least element `c`
exists. Double counting gives `∑ S, w S * v S ≤ c` for every balanced `w`, and the weight `1` on
`univ` has value `v univ`, which settles the case `c = v univ`. If `c > v univ`, take `t` with
`v univ ≤ t < c`. The set function `v'` that agrees with `v` except for `v' univ = t` has an
empty core, since a point of it would meet all constraints with total `t < c`. So 3.2 gives a
balanced `w` with `∑ S ≠ univ, w S * v S > (1 − w univ) * t`; here `w univ < 1` because
`v ∅ ≤ 0`, and the weights `w S / (1 − w univ)` on the nonempty coalitions other than `univ`
are balanced with value greater than `t`. So the supremum of the second set is `c`, and it is
attained on the compact set of balanced weights with `w ∅ = 0`, to which the supremum may be
restricted because `v ∅ ≤ 0`. For empty `ι` the first set is `{0}` and the second is the set of
the `w ∅ * v ∅` with `w ∅ ≥ 0`, whose greatest element is `0`. (Nisan et al., the linear
programs (15.1) and (15.2) in the proof of Theorem 15.6, for cost games; proved here.)

**Checks.**

- The majority game on three players: `c = 3/2`, attained by `x = (1/2, 1/2, 1/2)` and by the
  weight `1/2` on each pair.
- A set function with `v ∅ ≤ 0` and a nonempty core has `c = v univ`, attained by a core point
  and by the weight `1` on `univ`.
- If `v ∅ = 1` the first set is empty, so the statement needs `v ∅ ≤ 0`.
- Two players with `v {1} = v {2} = 1`, `v {1, 2} = 0`: `c = 2`, attained by `x = (1, 1)` and by
  the weight `1` on `{1}` and on `{2}`.

*Needs:* 2.1, 3.1, 3.2; Mathlib `IsCompact.exists_isMinOn`, `IsCompact.exists_isMaxOn`,
`Metric.isCompact_of_isClosed_isBounded`.

### Examples

The majority game on three players, with empty core and `c = 3/2`; the three-player games with
prescribed worths of the pairs.

### Dependencies

3.1 uses Mathlib's Heine–Borel theorem; 3.2 uses 2.1, 3.1 and Tau Ceti's form of Tucker's key
lemma; 3.3 uses 3.1, 3.2 and the Krein–Milman theorem; 3.4 uses 2.1, 3.1, 3.2, the Heine–Borel
theorem and the extreme value theorem.

## Layer 4: the Shapley value

### 4.1 The coalition formula and the random-order formula

Define the **Shapley value**

    shapleyValue v i =
      ∑ S ∈ (univ.erase i).powerset, |S|! * (n − |S| − 1)! / n! * (v (insert i S) − v S).

Prove:

- **the random-order formula:**
  `shapleyValue v i = (∑ σ, marginalVector v σ i) / n!`, the sum over all orders `σ`
  (`shapleyValue_eq_sum_marginalVector`);
- the weights `|S|! * (n − |S| − 1)! / n!` are positive and sum to `1` over the coalitions `S`
  not containing `i`;
- `shapleyValue` is linear in `v`;
- for exactly two players `i ≠ j`,
  `shapleyValue v i = ((v {i} − v ∅) + (v {i, j} − v {j})) / 2`; for one player,
  `shapleyValue v i = v {i} − v ∅`.

The random-order formula follows from the count of 2.2: the orders in which the predecessors of
`i` are exactly `S` number `|S|! * (n − 1 − |S|)!`. (Shapley P-295, formulas (12)–(13), where
the sum is indexed by the coalitions containing `i`, and Section 6 for the random order; Shapley
RM-4571, (12); Nisan et al., Section 15.6.1; Maleki et al., equation (1).)

**Checks.**

- The majority game on three players: each player has value `1/3`.
- The glove game of 2.1: the values are `(2/3, 1/6, 1/6)`.
- `n = 3`: the weights are `1/3` for `|S| = 0`, `1/6` for each of the two coalitions with
  `|S| = 1`, and `1/3` for `|S| = 2`; they sum to `1`.
- The weight `1 / 2 ^ (n − 1)` for every `S` gives `1/2` to each player of the majority game,
  with sum `3/2`.
- Two players with `v ∅ = 0`, `v {1} = 1`, `v {2} = 2`, `v {1, 2} = 5`: the values are
  `(1 + 3) / 2 = 2` and `(2 + 4) / 2 = 3`.

*Needs:* 2.2.

### 4.2 Efficiency, symmetry, null players and monotonicity

Prove, for every set function `v`:

- **efficiency:** `∑ i, shapleyValue v i = v univ − v ∅` (`sum_shapleyValue`);
- **anonymity:** for a permutation `π` of `ι`, the set function `S ↦ v (S.image π.symm)` has
  Shapley value `shapleyValue v (π.symm i)` at `i`;
- **desirability:** if `v (insert i S) ≤ v (insert j S)` for every `S` containing neither `i`
  nor `j`, then `shapleyValue v i ≤ shapleyValue v j`; so symmetric players have equal values;
- **null players:** a null player has value `0`; more generally, if
  `v (insert i S) = v S + c` for every `S` not containing `i`, then `shapleyValue v i = c`;
- **strong monotonicity:** if `v (insert i S) − v S ≤ w (insert i S) − w S` for every `S` not
  containing `i`, then `shapleyValue v i ≤ shapleyValue w i`;
- **covariance:** the Shapley value of `S ↦ c * v S + ∑ i ∈ S, a i` at `i` is
  `c * shapleyValue v i + a i`;
- **individual rationality:** if `v` is superadditive, then `v {i} ≤ shapleyValue v i`;
- **duality:** `S ↦ v univ − v (univ \ S)` has the same Shapley value as `v`.

Efficiency follows from the random-order formula and the telescoping identity of 2.2. For
desirability, split the coalitions `S` not containing `i` according to whether they contain `j`:
`shapleyValue v j − shapleyValue v i` is a sum, over the coalitions `T` containing neither, of a
positive weight times `v (insert j T) − v (insert i T)`. (Shapley P-295, Axioms 1–3 and
Corollaries 1 and 3; proved here.)

**Checks.**

- One player with `v ∅ = 1`, `v {1} = 3`: the value is `2 = v univ − v ∅`, not `v univ`.
- The glove game: players `2` and `3` are symmetric and have the same value `1/6`; the values
  sum to `1`.
- Player `3` is null in `unanimity {1, 2}` on three players and has value `0`.
- The weighted voting game with quota `3` and weights `(2, 1, 1)` is the glove game; the player
  of weight `2` is at least as desirable as the others and has the larger value.

*Needs:* 2.2, 4.1.

### 4.3 The dividend formula

Prove:

- for nonempty `S`, the Shapley value of `unanimity S` is `1 / |S|` at the players of `S` and
  `0` at the others;
- **the dividend formula:** `shapleyValue v i = ∑ S with i ∈ S, dividend v S / |S|` for every
  set function `v` (`shapleyValue_eq_sum_dividend`).

The players outside `S` are null in `unanimity S` and those of `S` are symmetric, so the first
item follows from 4.2; the second follows by linearity from the unanimity basis of 1.2, the
function `unanimity ∅` having Shapley value `0`. (Shapley P-295, Lemma 2 and formula (10).)

**Checks.**

- The majority game on three players: each player is in two pairs of dividend `1` and in the
  grand coalition of dividend `−2`, and `1/2 + 1/2 − 2/3 = 1/3`.
- `unanimity {1, 2}` on three players has Shapley value `(1/2, 1/2, 0)`.
- The constant set function `1` has Shapley value `0`: the dividend at `∅` is in no sum.

*Needs:* 1.2, 4.1, 4.2.

### 4.4 Shapley's uniqueness theorem

Let `C` be an additive submonoid of `Finset ι → ℝ` that consists of games and contains
`c • unanimity S` for every `c ≥ 0` and every nonempty `S`. Let `ψ` be a value such that, for
all `v, w ∈ C`:

- **efficiency:** `∑ i, ψ v i = v univ`;
- **equal treatment:** `ψ v i = ψ v j` whenever `i` and `j` are symmetric in `v`;
- **null players:** `ψ v i = 0` whenever `i` is null in `v`;
- **additivity:** `ψ (v + w) = ψ v + ψ w`.

Prove that `ψ v = shapleyValue v` for every `v ∈ C`
(`eq_shapleyValue_of_efficient_of_symmetric_of_null_of_additive`).

The class of all games, the superadditive games, the monotone games and the convex games are
such classes `C`. The Shapley value satisfies the four axioms on every such class, by 4.1
and 4.2. Equal treatment follows from anonymity, since the transposition of two symmetric players
fixes `v`; so the theorem holds with anonymity in place of equal treatment.

For `c ≥ 0` and nonempty `S`, the first three axioms give `ψ (c • unanimity S) i = c / |S|` for
`i ∈ S` and `0` otherwise, which is the Shapley value by 4.3. Write `v ∈ C` by 1.2 as `p − q`,
where `p` and `q` are the sums of `|dividend v S| • unanimity S` over the nonempty `S` with
positive and with negative dividend. Then `p, q ∈ C` and `v + q = p`, and additivity gives
`ψ v = ψ p − ψ q`, with `ψ p` and `ψ q` sums of the values just computed; the Shapley value
satisfies the same identities. (Shapley P-295, the Theorem of Section 3, for superadditive games
with a finite carrier, with anonymity as Axiom 1 and with efficiency and the null player
property combined as Axiom 2; the form on a class `C` is proved here.)

**Checks.**

- The Banzhaf value of 5.3 satisfies equal treatment, null players and additivity, and is not
  efficient: on the majority game it gives `1/2` to each player.
- For a fixed order `σ`, `v ↦ marginalVector v σ` is efficient on games, gives null players `0`
  and is additive, and does not treat symmetric players equally: on the majority game it is a
  unit vector.
- Equal division, `ψ v i = v univ / n`, is efficient, treats symmetric players equally and is
  additive, and gives the null player of `unanimity {1, 2}` on three players `1/3`.
- Equal division of `v univ` among the players that are not null is efficient on games, treats
  symmetric players equally and gives null players `0`; it is not additive, and on the glove
  game it gives `(1/3, 1/3, 1/3)`, not `(2/3, 1/6, 1/6)`.
- One player, `C` the set functions with `v ∅` a natural number and `v {1} ≥ 5 * v ∅`, and
  `ψ v 1 = v {1}`: all four axioms hold on `C`, which contains the nonnegative multiples of
  `unanimity {1}`, and at `v ∅ = 1`, `v {1} = 5` the Shapley value is `4`, not `5`. So `C` must
  consist of games.
- Two players, `C` the natural multiples of the game `v₀` with `v₀ {1} = 0`, `v₀ {2} = 1`,
  `v₀ {1, 2} = 3`, and `ψ v = (v univ, 0)`: the four axioms hold on `C`, because for `k ≥ 1` no
  player is null in `k • v₀` and the two players are not symmetric. But `ψ v₀ = (3, 0)` and the
  Shapley value of `v₀` is `(1, 2)`. So `C` must contain the multiples of the unanimity games.

*Needs:* 1.2, 4.1, 4.2, 4.3.

### 4.5 Young's characterization

Let `ψ` be a value such that, for all games `v`, `w`:

- **efficiency:** `∑ i, ψ v i = v univ`;
- **equal treatment:** `ψ v i = ψ v j` whenever `i` and `j` are symmetric in `v`;
- **marginality:** `ψ v i = ψ w i` whenever `v (insert i S) − v S = w (insert i S) − w S` for
  every `S`.

Prove that `ψ v = shapleyValue v` for every game `v`
(`eq_shapleyValue_of_efficient_of_symmetric_of_marginal`).

Marginality follows from strong monotonicity, applied in both directions, so the theorem holds
with strong monotonicity in its place, which is Young's axiom; the Shapley value is strongly
monotone by 4.2. The proof is by induction on the number of coalitions with nonzero dividend in
`v`. If there is none, `v = 0`, all players are symmetric and efficiency gives `ψ v = 0`.
Otherwise let `R` be the intersection of the coalitions with nonzero dividend. For `i ∉ R`, the
game `w = ∑ S with i ∈ S, dividend v S • unanimity S` has fewer nonzero dividends and the same
marginal contributions of `i` as `v`, so `ψ v i = ψ w i`, which is the Shapley value of `w` and
of `v` at `i` by induction and by marginality of the Shapley value. The players of `R` are
symmetric in `v`, so they share equally what efficiency leaves, for `ψ` and for the Shapley
value alike. (Proved here.)

**Checks.**

- Equal division is efficient and treats symmetric players equally. On two players, player `1`
  has the same marginal contributions in `unanimity {1}` and in `unanimity {1} + unanimity {2}`,
  and equal division gives it `1/2` and `1`.
- For a fixed order `σ`, `v ↦ marginalVector v σ` is efficient on games and satisfies
  marginality, and does not treat symmetric players equally.
- The Banzhaf value treats symmetric players equally and satisfies marginality, and is not
  efficient.

*Needs:* 1.2, 4.1, 4.2.

### 4.6 The Shapley value of a convex game

Prove: for a convex game `v`, `shapleyValue v ∈ core v` (`shapleyValue_mem_core`).

By 4.1 the Shapley value is the average of the marginal vectors, which lie in the convex set
`core v` by 2.3. (Shapley RM-4571, Theorem 4.)

**Checks.**

- `v S = |S| ^ 2` on three players: the Shapley value is `(3, 3, 3)`, the centre of the hexagon
  of 2.4.
- The glove game has core `{(1, 0, 0)}` and Shapley value `(2/3, 1/6, 1/6)`: a nonempty core
  does not suffice.
- The constant set function `1` is convex and has an empty core, so the statement needs
  `v ∅ = 0`.

*Needs:* 2.1, 2.3, 4.1.

### Examples

The majority and glove games on three players, the unanimity games, and the two-player closed
form.

### Dependencies

4.1 uses 2.2; 4.2 uses 2.2 and 4.1; 4.3 uses 1.2, 4.1 and 4.2; 4.4 uses 1.2, 4.1, 4.2 and 4.3; 4.5
uses 1.2, 4.1 and 4.2; 4.6 uses 2.1, 2.3 and 4.1.

## Layer 5: simple games and the Banzhaf value

### 5.1 Simple games and veto players

A **simple game** is a monotone game with values in `{0, 1}` and `v univ = 1`. A coalition `S`
is **winning** when `v S = 1`. A **veto player** is a player that belongs to every winning
coalition. The **weighted voting game** with quota `q` and weights `p : ι → ℝ`, where `p ≥ 0`
and `0 < q ≤ ∑ i, p i`, has `v S = 1` when `q ≤ ∑ i ∈ S, p i` and `v S = 0` otherwise. Prove:

- **the core of a simple game:** for a set function `v` with values in `{0, 1}` and
  `v univ = 1`, `core v` is the set of the `x` with `x i ≥ 0` for all `i`, `∑ i, x i = 1`, and
  `x i = 0` for every `i` that is outside some winning coalition
  (`core_eq_of_forall_eq_zero_or_eq_one`); neither monotonicity nor `v ∅ = 0` is used;
- so the core of such a `v` is nonempty if and only if there is a veto player, and it is then
  the convex hull of the unit vectors of the veto players;
- a weighted voting game is a simple game, and `unanimity S` with `S` nonempty is a simple game
  whose veto players are the players of `S`;
- a simple game is superadditive if and only if no two winning coalitions are disjoint.

If `x ∈ core v` then `x i ≥ v {i} ≥ 0`, and for a winning `S` not containing `i`,
`x i ≤ 1 − x(S) ≤ 0`. Conversely, if `x` is a distribution of one unit among the veto players,
a winning coalition contains them all and receives `1`, and a losing coalition receives at least
`0`. (Proved here.)

**Checks.**

- The majority game on three players has no veto player and an empty core.
- The weighted voting game with quota `3` and weights `(2, 1, 1)` is the glove game: player `1`
  is its only veto player and the core is `{(1, 0, 0)}`.
- `unanimity {1, 2}` on three players has core the segment from `(1, 0, 0)` to `(0, 1, 0)`.
- The zero game has core `{0}` and no winning coalition, so the right side is the set of all
  `x ≥ 0` with `∑ i, x i = 1`, which does not contain `0`: the statement needs `v univ = 1`.
- Two players with `v ∅ = 0`, `v {1} = 1/2`, `v {2} = 0` and `v {1, 2} = 1`: the only winning
  coalition is `{1, 2}`, so `(0, 1)` satisfies the three conditions, and it is outside the core
  since `x₁ < v {1}`: the statement needs the values `0` and `1`.
- The set function on three players with `v {1} = v univ = 1` and `0` elsewhere is not monotone;
  its only veto player is `1`, and its core is `{(1, 0, 0)}`.

*Needs:* 1.2, 2.1.

### 5.2 The Shapley–Shubik index

The Shapley value of a simple game is its **Shapley–Shubik index**. Player `i` is **pivotal** in
the order `σ` when `v (predecessors σ i) = 0` and `v (insert i (predecessors σ i)) = 1`. Prove,
for a monotone set function `v` with values in `{0, 1}`:

- `shapleyValue v i` is the number of orders in which `i` is pivotal, divided by `n!`;
- if `v ∅ = 0` and `v univ = 1`, every order has exactly one pivotal player;
- in a weighted voting game, `p i ≤ p j` implies `shapleyValue v i ≤ shapleyValue v j`.

The first two follow from 4.1 and 2.2, since the marginal contributions are `0` or `1`; the
third from desirability in 4.2. (Shapley P-295, Example 5 and (23), for the third item; proved
here.)

**Checks.**

- Quota `3`, weights `(2, 1, 1)`: the players are pivotal in `4`, `1` and `1` of the `6` orders,
  and the index is `(2/3, 1/6, 1/6)`.
- Quota `5`, weights `(3, 2, 1, 1)`: the players are pivotal in `14`, `6`, `2` and `2` of the
  `24` orders, and the index is `(7/12, 1/4, 1/12, 1/12)`.
- The set function on three players with `v {1} = v univ = 1` and `0` elsewhere is not
  monotone. Player `2` is pivotal in the two orders `1, 3, 2` and `3, 1, 2`, which would give
  `1/3`; its marginal contribution in the order `1, 2, 3` is `−1`, and its Shapley value is
  `1/6`.

*Needs:* 2.2, 4.1, 4.2, 5.1.

### 5.3 The Banzhaf value

Define the **Banzhaf value**

    banzhafValue v i = (∑ S ∈ (univ.erase i).powerset, (v (insert i S) − v S)) / 2 ^ (n − 1).

Prove, for every set function `v`:

- `banzhafValue` is linear in `v`; it satisfies the anonymity, desirability, null player and
  strong monotonicity statements of 4.2;
- the Banzhaf value of `unanimity S`, for nonempty `S`, is `1 / 2 ^ (|S| − 1)` at the players of
  `S` and `0` at the others;
- **the dividend formula:**
  `banzhafValue v i = ∑ S with i ∈ S, dividend v S / 2 ^ (|S| − 1)`
  (`banzhafValue_eq_sum_dividend`);
- for `n ≤ 2` the Banzhaf value equals the Shapley value;
- for a monotone `v` with values in `{0, 1}`, `banzhafValue v i` is the number of coalitions
  `S` not containing `i` with `v S = 0` and `v (insert i S) = 1`, divided by `2 ^ (n − 1)`.

(Proved here.)

**Checks.**

- The majority game on three players: `(1/2, 1/2, 1/2)`, with sum `3/2`, so the Banzhaf value is
  not efficient.
- `unanimity univ` on three players: `(1/4, 1/4, 1/4)`, with sum `3/4`, while the Shapley value
  is `(1/3, 1/3, 1/3)`.
- Quota `3`, weights `(2, 1, 1)`: `(3/4, 1/4, 1/4)`; quota `5`, weights `(3, 2, 1, 1)`:
  `(5/8, 3/8, 1/8, 1/8)`.
- The majority game by the dividend formula: `1/2 + 1/2 − 2/4 = 1/2`.

*Needs:* 1.2, 4.1.

### Examples

The majority game, the weighted voting games with quota `3` and weights `(2, 1, 1)` and with
quota `5` and weights `(3, 2, 1, 1)`, and the unanimity games.

### Dependencies

5.1 uses 1.2 and 2.1; 5.2 uses 2.2, 4.1, 4.2 and 5.1; 5.3 uses 1.2 and 4.1.

## Layer 6: sampling and baseline attribution

### 6.1 Permutation sampling

For a sample `s` of `m` orders define the **permutation-sampling estimator**

    permutationEstimator v s i = (∑ k, marginalVector v (s k) i) / m.

Prove, for every set function `v` and player `i`:

- **unbiasedness:** for `m ≥ 1`, the mean of `permutationEstimator v s i` over all samples `s`
  of `m` orders is `shapleyValue v i` (`sum_permutationEstimator_div`);
- **variance:** for `m ≥ 1`, the mean over all samples of
  `(permutationEstimator v s i − shapleyValue v i) ^ 2` is `1 / m` times the mean over all
  orders `σ` of `(marginalVector v σ i − shapleyValue v i) ^ 2`;
- **Hoeffding's bound:** if `a ≤ v (insert i S) − v S ≤ b` for every `S` not containing `i`, and
  `ε ≥ 0`, then the fraction of samples `s` of `m` orders with
  `|permutationEstimator v s i − shapleyValue v i| ≥ ε` is at most
  `2 * exp (−2 * m * ε ^ 2 / (b − a) ^ 2)`
  (`card_filter_le_abs_permutationEstimator_sub_div_le`); the fraction with
  `permutationEstimator v s i − shapleyValue v i ≥ ε`, and the fraction with
  `shapleyValue v i − permutationEstimator v s i ≥ ε`, are each at most
  `exp (−2 * m * ε ^ 2 / (b − a) ^ 2)`;
- so for `ε > 0`, `0 < δ ≤ 1`, `a < b` and `m ≥ (b − a) ^ 2 * log (2 / δ) / (2 * ε ^ 2)`, the
  fraction of samples with deviation at least `ε` is at most `δ`.

Unbiasedness is the random-order formula of 4.1, summed over the `m` coordinates. For the bound,
give the finite type of samples the uniform probability, which is the product of the uniform
probabilities on the orders by `uniformOn_pi`; the coordinates are independent, each
`marginalVector v (s k) i` lies in `[a, b]` and has mean `shapleyValue v i`, so by Hoeffding's
lemma each centred coordinate is sub-Gaussian with parameter `((b − a) / 2) ^ 2`, and Hoeffding's
inequality at `m * ε` gives `exp (−(m ε) ^ 2 / (2 * m * (b − a) ^ 2 / 4))`. The lower tail is the
upper tail for `−v`. (Štrumbelj and Kononenko 2010, Section 3.2, equation (7) and the remark
that the estimator is unbiased with variance the population variance over `m`; Maleki et al.,
Section 3.3, inequality (4), and Section 4.2; proved here.)

**Checks.**

- `m = 1`: the estimator is one marginal contribution, and unbiasedness is the random-order
  formula.
- The majority game on three players, `m = 1`, `ε = 2/3`: the marginal contribution of a player
  is `1` in two of the six orders, the deviation from `1/3` is at least `2/3` in a fraction
  `1/3` of the samples, and the bound is `2 * exp (−8/9) ≈ 0.82`. With `m = 2`, `ε = 1/2`: the
  fraction is `1/9` and the bound is `2 * exp (−1) ≈ 0.74`.
- `m = 0`: the estimator is `0` by the convention for division by zero, and its mean over the
  single empty sample is `0`, so unbiasedness needs `m ≥ 1`; the bound holds, since its right
  side is `2`.
- `a = b`: every marginal contribution of `i` equals `a`, the right side is `2` by the convention
  for division by zero, and the bound holds.
- `ε = −1`, `m = 50`, `b − a = 1`: every sample has deviation at least `ε`, and
  `2 * exp (−100) < 1`, so the bound needs `ε ≥ 0`.
- `δ = 1/20`, `ε = 1/10`, `b − a = 1`: `m ≥ 185` suffices.

*Needs:* 2.2, 4.1; Mathlib `ProbabilityTheory.hasSubgaussianMGF_of_mem_Icc`,
`ProbabilityTheory.HasSubgaussianMGF.measure_sum_ge_le_of_iIndepFun`,
`ProbabilityTheory.iIndepFun_pi`, `ProbabilityTheory.uniformOn_univ`,
`ProbabilityTheory.uniformOn_pi`.

### 6.2 The baseline game

Let `α : ι → Type*`, `f : (∀ i, α i) → ℝ`, an input `x` and a baseline `x₀` in `∀ i, α i`.
Define the **baseline game**

    baselineGame f x x₀ S = f (S.piecewise x x₀) − f x₀,

the change of `f` when the coordinates in `S` are moved from the baseline to the input. Prove:

- `baselineGame f x x₀` is a game, and its worth at `univ` is `f x − f x₀`;
- `baselineGame f x x₀` is linear in `f`, so its Shapley value is linear in `f`;
- **completeness:** `∑ i, shapleyValue (baselineGame f x x₀) i = f x − f x₀`, which is
  `sum_shapleyValue` of 4.2 applied to the baseline game;
- **additive functions:** if `f z = c + ∑ j, g j (z j)` for a real `c` and
  `g : ∀ j, α j → ℝ`, then `shapleyValue (baselineGame f x x₀) i = g i (x i) − g i (x₀ i)`
  (`shapleyValue_baselineGame_of_additive`);
- **unchanged coordinates:** if `x i = x₀ i`, or if `f` does not depend on the coordinate `i`,
  then `shapleyValue (baselineGame f x x₀) i = 0`;
- **exchange:** `shapleyValue (baselineGame f x₀ x) i = −shapleyValue (baselineGame f x x₀) i`;
- when `ι` consists of two coordinates `i ≠ j`, writing `f (u, w)` for the value of `f` at the
  point with coordinates `u` at `i` and `w` at `j`, the Shapley value at `i` is
  `((f (x i, x₀ j) − f (x₀ i, x₀ j)) + (f (x i, x j) − f (x₀ i, x j))) / 2`.

For an additive `f` the baseline game is the additive game with
`a i = g i (x i) − g i (x₀ i)`, whose Shapley value is `a` by covariance. In the two remaining
cases player `i` is null, and the exchange is the duality of 4.2 applied to
`baselineGame f x x₀`. The estimator of 6.1 applies to the baseline game with `a = −ω` and
`b = ω`, where `ω` is the oscillation of `f` on the points `S.piecewise x x₀`: a marginal
contribution is a difference of two values of `f` at such points, so `b − a` is twice the
oscillation and cannot be taken smaller in general (for two coordinates with
`f (x₀ 1, x₀ 2) = f (x 1, x 2) = 0` and `f (x 1, x₀ 2) = f (x₀ 1, x 2) = 1`, the marginal
contributions of the first coordinate are `1` and `−1`, while `ω = 1`). (Sundararajan and Najmi 2020,
Section 2.3, equation (3), whose set function is this one plus the constant `f x₀`, with the
same marginal contributions; proved here.)

**Checks.**

- `f z = z₁ * z₂` on `ℝ × ℝ`, `x = (3, 5)`, `x₀ = (0, 0)`: the values are `(15/2, 15/2)`, with
  sum `15`.
- The same `f` and `x` with `x₀ = (1, 1)`: the values are `(6, 8)`, with sum `14 = 15 − 1`.
- `f = max`, `x = (3, 5)`, `x₀ = (1, 1)`: the values are `(1, 3)`, with sum `4 = 5 − 1`.
- `f z = ∑ i, c i * z i`: the value at `i` is `c i * (x i − x₀ i)`.
- Without the subtraction of `f x₀` the worth of `∅` would be `f x₀`, and the Shapley values
  would be the same, by the formula of 4.1.

*Needs:* 4.1, 4.2; Mathlib `Finset.piecewise`, `Finset.piecewise_empty`, `Finset.piecewise_univ`.

### Examples

Sampling for the majority game; the baseline games of a product, of a maximum and of a linear
function.

### Dependencies

6.1 uses 2.2, 4.1 and Mathlib's Hoeffding lemma and inequality, independence of coordinates
under a product measure, and the uniform measure on a finite type and on a finite product; 6.2
uses 4.1, 4.2 and Mathlib's `Finset.piecewise`.

## Downstream consumers

No roadmap on main consumes these targets.

## Provenance

The roadmap is written from the literature cited below. The repository
[lean4-mlir](https://github.com/brettkoonce/lean4-mlir) (BSD-3), by the author of this roadmap,
uses this material numerically in its demonstrations and has no Lean proofs of it:
`scripts/demos/plant_shapley.py` computes the exact two-player Shapley value of 4.1 for a leaf
region and its background, and estimates the Shapley values of a grid of image regions by the
permutation sampling of 6.1; `scripts/demos/rs_shapley.py` computes exact five-player Shapley
values over groups of spectral bands from the `32` coalition worths. In both, the worth of a
coalition is a trained network's output with the absent players replaced by a baseline, as in
6.2. No formalization of this material in Lean, Coq or Isabelle is used.

## Scope and ownership

This roadmap owns:

- set functions on the coalitions of a finite player set, the classes of superadditive, monotone
  and convex games, unanimity games and Harsanyi dividends;
- payoff vectors, imputations and the core;
- orders of the players, marginal vectors, and the theorems of Shapley, Ichiishi and Weber
  relating them to the core;
- balanced weights, minimal balanced collections, the Bondareva–Shapley theorem and the linear
  programming duality behind it;
- the Shapley value: the coalition, random-order and dividend formulas, its properties, and the
  characterizations of Shapley and of Young;
- simple games and weighted voting games, the Shapley–Shubik index, and the Banzhaf value with
  its dividend formula;
- the permutation-sampling estimator of the Shapley value;
- the baseline game of a function of several variables.

It consumes, and does not re-prove, the items listed under
[Exact supplier contracts](#exact-supplier-contracts).

Out of scope:

- games without transferable utility, bargaining problems and the Nash bargaining solution;
- the nucleolus, the kernel, the bargaining set, stable sets, and the least core beyond the
  duality statement 3.4;
- values other than the Shapley and Banzhaf values: semivalues and probabilistic values, the
  multilinear extension, the potential and consistency characterizations, weighted values, and
  the characterizations of the Banzhaf value, which compare games on different player sets;
- games with infinitely many players and values of non-atomic games, and set functions with
  values in an ordered field other than `ℝ`;
- coalition structures, games on graphs, and games with restricted cooperation;
- cost-sharing mechanisms, mechanism design and auctions;
- stable matching and assignment games;
- submodular functions on a general lattice, their closure under sums and the lattices of their
  minimizers, which [GraphConnectivityAndFlows](../GraphConnectivityAndFlows/README.md) 4.1 owns
  and Tau Ceti provides; 1.1 states the convexity of a game with that predicate;
- noncooperative games: matrix games, Nash equilibria and correlated equilibria belong to the
  RegretMinimizationAndEquilibria roadmap;
- general linear programming duality and Farkas' lemma: 3.2 and 3.4 are proved from one theorem
  of the alternative of Tau Ceti and state only the duality of the core;
- the Möbius function of a general locally finite order, which is Mathlib's `IncidenceAlgebra`;
  1.2 proves the inversion on the subset lattice with its explicit signs;
- the complexity of computing values, and sampling schemes other than independent uniform orders;
- attribution methods other than the baseline game: conditional-expectation games, integrated
  gradients, and attributions for a random baseline.

## Exact supplier contracts

- Tau Ceti:
  - `TauCeti.IsSubmodular` (`TauCeti/Order/Lattice/Submodular.lean`): for `f : L → K` on a
    lattice `L`, `IsSubmodular f` means `f (a ⊔ b) + f (a ⊓ b) ≤ f a + f b` for all `a`, `b`. On
    `L = Finset ι` the join is the union and the meet is the intersection. `IsSubmodular.add`:
    the pointwise sum of two submodular functions with values in an ordered additive commutative
    monoid is submodular. `isSubmodular_finsetSum`: `S ↦ ∑ i ∈ S, f i` is submodular, for
    `[DecidableEq ι]`.
  - `TauCeti.exists_nonneg_sum_smul_eq_zero_and_coeff_add_dual_pos_at`
    (`TauCeti/Geometry/Convex/Cone/Alternative.lean`), Tucker's key lemma: for a family
    `a : J → V` indexed by a `Fintype J`, in a vector space `V` over a linearly ordered field `K`,
    and an index `k`, there are `x : J → K` and `y : Module.Dual K V` with `0 ≤ x`,
    `∑ j, x j • a j = 0`, `0 ≤ y (a j)` for all `j`, and `0 < x k + y (a k)`.
  - `Finset.sum_Icc_neg_one_pow_card_sub_card_left` (`TauCeti/Data/Finset/Basic.lean`): for
    finsets `s`, `t` of a type with decidable equality and a ring `R`,
    `∑ u ∈ Finset.Icc s t, (-1 : R) ^ (u.card − s.card)` is `1` if `s = t` and `0` otherwise.
  - `TauCeti.card_nonempty_finset` (same file): a finite type `ι` has `2 ^ Nat.card ι − 1`
    nonempty finsets.
- Mathlib:
  - `Fintype.card_equiv` (`Mathlib/Data/Fintype/Perm.lean`): for finite types `α`, `β` and
    `e : α ≃ β`, `Fintype.card (α ≃ β) = (Fintype.card α)!`;
  - `Metric.isCompact_of_isClosed_isBounded` (`Mathlib/Topology/MetricSpace/Bounded.lean`): a
    closed bounded subset of a proper metric space is compact;
  - `IsCompact.exists_isMinOn` and `IsCompact.exists_isMaxOn`
    (`Mathlib/Topology/Order/Compact.lean`): a real function continuous on a nonempty compact set
    attains its minimum and its maximum there;
  - `Set.Finite.isCompact_convexHull` (`Mathlib/Analysis/Convex/Topology.lean`): the convex hull
    of a finite subset of a real topological vector space is compact;
  - `geometric_hahn_banach_point_closed` (`Mathlib/Analysis/LocallyConvex/Separation.lean`): for
    a closed convex set `t` in a locally convex real topological vector space and `x ∉ t`, there
    are a continuous linear functional `f` and a real `u` with `f x < u` and `u < f b` for all
    `b ∈ t`;
  - `Finset.sum_range_by_parts` (`Mathlib/Algebra/BigOperators/Module.lean`): summation by parts
    over `Finset.range n`;
  - `extremePoints_convexHull_subset` (`Mathlib/Analysis/Convex/Extreme.lean`): the extreme
    points of `convexHull 𝕜 A` lie in `A`;
  - `closure_convexHull_extremePoints` (`Mathlib/Analysis/Convex/KreinMilman.lean`), the
    Krein–Milman theorem: a compact convex subset `s` of a Hausdorff locally convex real
    topological vector space is the closure of the convex hull of `s.extremePoints ℝ`;
  - `ProbabilityTheory.hasSubgaussianMGF_of_mem_Icc`
    (`Mathlib/Probability/Moments/SubGaussian.lean`), Hoeffding's lemma: if `X` is almost
    everywhere measurable and almost surely in `Set.Icc a b` under a probability measure `μ`,
    then `X − μ[X]` has a sub-Gaussian moment generating function with parameter
    `(‖b − a‖₊ / 2) ^ 2`;
  - `ProbabilityTheory.HasSubgaussianMGF.measure_sum_ge_le_of_iIndepFun` (same file), Hoeffding's
    inequality: for independent `X i` with sub-Gaussian parameters `c i` on a finset `s` and
    `0 ≤ ε`, `μ.real {ω | ε ≤ ∑ i ∈ s, X i ω} ≤ exp (−ε ^ 2 / (2 * ∑ i ∈ s, c i))`;
  - `ProbabilityTheory.iIndepFun_pi` (`Mathlib/Probability/Independence/Basic.lean`): functions
    of distinct coordinates are independent under a product of probability measures, when each is
    almost everywhere measurable;
  - `ProbabilityTheory.uniformOn_univ` (`Mathlib/Probability/UniformOn.lean`): on a finite type
    `Ω`, `uniformOn Set.univ s = Measure.count s / Fintype.card Ω`;
  - `ProbabilityTheory.uniformOn_pi` (same file): for a finite index type, a finite type `Ω` in
    which singletons are measurable and sets `f k` of `Ω`,
    `uniformOn (Set.univ.pi f) = Measure.pi fun k ↦ uniformOn (f k)`;
  - `Finset.piecewise` with `Finset.piecewise_empty` and `Finset.piecewise_univ`
    (`Mathlib/Data/Finset/Piecewise.lean`): `S.piecewise x x₀ i` is `x i` for `i ∈ S` and `x₀ i`
    otherwise; `∅.piecewise x x₀ = x₀` and `univ.piecewise x x₀ = x`.

## References

- S. Maleki, L. Tran-Thanh, G. Hines, T. Rahwan and A. Rogers, *Bounding the estimation error of
  sampling-based Shapley value approximation*, arXiv:1306.4265, 2013.
- N. Nisan, T. Roughgarden, É. Tardos and V. V. Vazirani (eds.), *Algorithmic game theory*,
  Cambridge University Press, 2007; Chapter 15, *Cost sharing*, by K. Jain and M. Mahdian.
- L. S. Shapley, *A value for n-person games*, RAND paper P-295, 1952; published in
  *Contributions to the theory of games II*, Ann. of Math. Stud. **28**, Princeton University
  Press, 1953, 307–317. Cited as Shapley P-295, with the numbering of the RAND paper.
- L. S. Shapley, *Notes on n-person games VII: cores of convex games*, RAND memorandum
  RM-4571-PR, 1965; published as *Cores of convex games*, Internat. J. Game Theory **1** (1971),
  11–26. Cited as Shapley RM-4571, with the numbering of the memorandum.
- L. S. Shapley, *On balanced sets and cores*, RAND memorandum RM-4601-PR, 1965; published in
  Naval Res. Logist. Quart. **14** (1967), 453–460. Cited as Shapley RM-4601, with the numbering
  of the memorandum.
- E. Štrumbelj and I. Kononenko, *An efficient explanation of individual classifications using
  game theory*, J. Mach. Learn. Res. **11** (2010), 1–18.
- M. Sundararajan and A. Najmi, *The many Shapley values for model explanation*, ICML 2020,
  arXiv:1908.08474.
