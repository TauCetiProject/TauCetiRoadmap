# Roadmap: regret minimization and equilibria in games

**Summary.** In an online decision problem, a player chooses a mixed strategy over finitely many
actions in each round and then sees the payoff of every action. Its regret against an action after
`T` rounds is the total payoff of that action minus the player's total expected payoff, and the
external regret is the largest of these. The swap regret compares the player with every rule that
replaces each action by another, and is at least the external regret. This roadmap proves that
explicit learning procedures keep these regrets of order `√T`, and derives the consequences for
equilibria of finite games, sequential games included. Players maximize payoffs, and regret is that
of the mixed strategies, not of sampled actions.

The regret bounds concern payoff sequences of range `Δ`: at each time, all payoffs lie in an
interval of length `Δ`. Hedge plays each action with probability proportional to `exp (η S)`, where
`S` is its cumulative payoff and `η > 0` is a learning rate. For `n ≥ 2` actions, range `Δ > 0`, `T ≥ 1`
rounds and `η` tuned to these, its external regret is at most `Δ √(T log n / 2)`. Regret matching
plays each action with probability proportional to the positive part of its cumulative regret, and
uniformly if none is positive. With `n` actions, its external regret, and that of its variant regret
matching+, is at most `Δ √(n T)`.

Blackwell's approachability theorem is proved with an explicit rate. Each pair of actions has a
payoff vector in a finite-dimensional real inner product space, and the target `S` is nonempty and
closed. Call `S` response-satisfiable if against every mixed strategy of the opponent some mixed
strategy of the player has its expected payoff in `S`. If `S` is also convex, the player has a
strategy keeping the average expected payoff within `D / √T` of `S` after every `T ≥ 1` rounds,
whatever the opponent plays, where `D` is the diameter of the set of pure payoff vectors.
Conversely, if `S` is not response-satisfiable, one fixed mixed strategy of the opponent keeps every
average at least some `δ > 0` away from `S`.

In a finite game, a correlated equilibrium with tolerances `ε i` is a distribution on action
profiles under which no player `i` gains more than `ε i` in expectation by replacing each
recommended action by its image under a fixed map. It is coarse if only constant maps are tested.
Let the players use mixed strategies for `T ≥ 1` rounds, each measuring its regret against the
expected payoffs of its actions given the others' current strategies. If player `i` has external
regret at most `R i`, the empirical distribution of the product profiles is a coarse correlated
equilibrium with tolerances `R i / T`. Swap regret at most `SR i` gives a correlated equilibrium
with tolerances `SR i / T`, and the Blum–Mansour reduction, built from one copy of regret matching
per action, has swap regret at most `Δ n √T` for payoffs of range `Δ`.

For sequential decisions, strategies are recorded by their sequence forms, vectors indexed by
sequences. Kuhn's theorem in sequence form says that the sequence-form polytope consists exactly of
the sequence forms of behavioral strategies. Counterfactual regret minimization (CFR) runs regret
matching at every decision point on counterfactual values. If at each time the values at the
decision point `j` lie in an interval of length `w j`, its regret against every point of the
polytope is at most `Σ_j w j √(|A j| T)`, with `A j` the actions at `j`. In two-player zero-sum
games in sequence form, CFR self-play gives averaged sequence forms with duality gap at most the sum
of the two bounds divided by `T`. The worked example is Kuhn's three-card poker, whose value for the
first player is `−1/18`.

The roadmap builds on Mathlib for the probability simplex, Hoeffding's lemma and Sion's minimax
theorem, which gives von Neumann's minimax theorem for matrix games. Tau Ceti's Brouwer fixed-point
theorem gives the existence of Nash equilibria and of stationary distributions of row-stochastic
matrices; the theory of stationary distributions of Markov chains belongs to
[MarkovChainsAndRenewal](../MarkovChainsAndRenewal/README.md). No roadmap uses the results here.

## How to read the build

Layer 1 is the online protocol and its algorithms; Layers 2 and 3 apply it to matrix games and to
finite games; Layer 4 applies Layers 1 and 2 to sequential decision processes. Each layer opens
with its definitions. Each numbered target ends with a **Checks** list of tests that a wrong
convention or constant would fail, and a *Needs:* line naming the targets and suppliers it uses.
Every claim carries a source locator in parentheses, or says that it is proved here.
`Suggested.lean` states the definitions and headline theorems named in this README against the
pinned APIs.

## Conventions

- **Actions.** Action sets are finite and nonempty: `[Fintype ι] [Nonempty ι]`, with
  `n = Fintype.card ι`; `[DecidableEq ι]` is assumed where a statement uses `Pi.single`,
  `Function.update` or `Matrix.rowStochastic`.
- **The simplex.** `simplex ι = Set.range (fun p : Convexity.StdSimplex ℝ ι ↦ ⇑p.weights)`, the
  weight vectors of Mathlib's `Convexity.StdSimplex` (not the deprecated set `stdSimplex`);
  `Convexity.StdSimplex.range_toFun_comp_weights` identifies it with the nonnegative vectors of
  sum `1`. Mixed strategies are its points. For `p, u : ι → ℝ`, `⟨p, u⟩ = p ⬝ᵥ u`
  (`dotProduct`). The uniform strategy is `fun _ ↦ 1/n`.
- **Payoffs, not losses.** Players maximize. A payoff sequence is `u : ℕ → ι → ℝ`; it has
  **range** `Δ` (`HasRange u Δ`) when `u t a ∈ [c t, c t + Δ]` for all `t`, `a` and some
  `c : ℕ → ℝ`.
- **Online algorithms** are deterministic maps from the past payoffs to a strategy,
  `OnlineAlgorithm ι := (t : ℕ) → (Fin t → ι → ℝ) → (ι → ℝ)`, played against `u` by
  `OnlineAlgorithm.play`, `p t = A t (fun s ↦ u s)`. Bounds hold for every payoff sequence `u`, so
  they hold against adaptive adversaries. Regret is that of the mixed strategies (expected
  payoff), not of sampled actions.
- **Regret.** `regret p u T a = Σ_{t<T} (u t a − ⟨p t, u t⟩)`; the external regret is
  `max_a regret p u T a`. The swap regret is
  `swapRegret p u T = max_{φ : ι → ι} Σ_{t<T} Σ_a p t a (u t (φ a) − u t a)`.
- **Positive parts** `R⁺ = max R 0` are coordinatewise; squared norms on `ι → ℝ` are written out
  as sums `Σ_a v a²`.
- **Suprema over sets.** A supremum or infimum of a real function over a set is indexed by the
  set as a type (`⨆ x : simplex ι, f x`) or stated with `IsGreatest`; the form `⨆ x ∈ s, f x`
  is not used, because in `ℝ` it takes the value `0` at every `x ∉ s`.
- **Matrix games.** `M : Matrix ι κ ℝ` and `Matrix.payoff M x y = x ⬝ᵥ (M *ᵥ y)`, in the shape of
  Mathlib PR [#39393](https://github.com/leanprover-community/mathlib4/pull/39393), with index types
  generalized from `Fin m`, `simplex` in place of the deprecated `stdSimplex` that PR uses, and
  the same number written with `dotProduct` and `mulVec` instead of a double sum. As
  there, `Matrix.exists_saddle_point` is in Mathlib's `IsSaddlePointOn` orientation (the row
  strategy minimizes), and `Matrix.exists_mixedNash` is the textbook orientation (the row player
  maximizes `payoff M`).
- **Stationarity** of `p : ι → ℝ` for `Q : Matrix ι ι ℝ` is written out as `p ᵥ* Q = p` (a row
  vector, a left fixed vector). Mathlib's root `IsStationary` is a notion for sets of ordinals,
  and its `ProbabilityTheory.Kernel.Invariant` is the measure form, whose matrix form is
  MarkovChainsAndRenewal's.
- **Finite games.** Players `N` with `[Fintype N] [DecidableEq N]`, actions `A i` finite and
  nonempty, utilities `u : N → (∀ i, A i) → ℝ`. A mixed profile is `σ : ∀ i, A i → ℝ` with
  `σ i ∈ simplex (A i)`, and `expectedUtility u σ i = Σ_a (Π_j σ j (a j)) u i a`, written `U i σ`.
  A deviation of player `i` to `τ` is `Function.update σ i τ`. Correlated distributions are points
  of `simplex (∀ i, A i)`. Equilibrium tolerances are per player, `ε : N → ℝ`.
- **Sequential decision processes** are specified in 4.1; their counterfactual-value ranges are
  written `w j`.

## Coordination

- Mathlib PR [#39393](https://github.com/leanprover-community/mathlib4/pull/39393) proves
  `Matrix.exists_saddle_point` and `Matrix.exists_mixedNash` for `Fin m × Fin n` matrix games from
  Sion's theorem; 2.1 takes its names, statements and orientation.
- Mathlib PR [#34713](https://github.com/leanprover-community/mathlib4/pull/34713) develops
  stationary distributions of finite stochastic matrices; 3.4 takes the name
  `Matrix.rowStochastic.exists_stationary_distribution` and the vector form `μ ᵥ* M = μ` of its
  existence theorem.

## Layer 1: online learning over the simplex

### 1.1 Regret

Define `simplex`, `HasRange`, `OnlineAlgorithm`, `OnlineAlgorithm.play`, `regret` and
`swapRegret` as in [Conventions](#conventions). Prove:

- for `q ∈ simplex ι` and arbitrary plays `p`, the regret against the mixed comparator `q`,
  `Σ_{t<T} (⟨q, u t⟩ − ⟨p t, u t⟩)`, equals `Σ_a q a · regret p u T a`, so its maximum over the
  simplex is the external regret (`sum_sub_eq_sum_mul_regret`);
- when every `p t` lies in `simplex ι`, the external regret is at most the swap regret
  (`regret_le_swapRegret`); the swap regret is at least `0`, and both are `0` at `T = 0`;
- when every `p t` lies in `simplex ι` and `u` has range `Δ`, the instantaneous regret
  `r t a = u t a − ⟨p t, u t⟩` satisfies `|r t a| ≤ Δ` (`abs_instRegret_le`).

(Cesa-Bianchi and Lugosi 2006, Sections 2.1 and 4.4, for external and internal regret; Blum and
Mansour 2007, Section 2, for swap regret; proved here.)

**Checks.**

- `simplex`: `simplex (Fin 2)` contains `(1/2, 1/2)` and `(1, 0)`, and neither `(2, −1)` (sum
  `1`, a negative weight) nor `(1/2, 1/4)`; for `n = 1` it is `{(1)}`.
- `HasRange`: a sequence with `u t = fun _ ↦ c t` has range `0`; `u t = (t, t + 1)` has range `1`
  although it is unbounded; `u t = (0, 1)` has range `Δ` exactly when `Δ ≥ 1`, and no sequence
  has a negative range.
- `OnlineAlgorithm.play`: `play A u 0` does not depend on `u`, and `play A u t` depends only on
  `u s` for `s < t`.
- `n = 1`, `p t ∈ simplex ι`: every regret is `0`.
- `u t = fun _ ↦ c t`, `p t ∈ simplex ι`: the regret against every action is `0`.
- `ι = Fin 2`, `p t = (1, 0)`, `u t = (0, 1)`: `regret p u T 1 = T`, and the swap `φ = const 1`
  attains swap regret `T`.
- `ι = Fin 2`, `p t = (0, 1)`, `u t = (0, 1)`: `regret p u T 0 = −T` and `regret p u T 1 = 0`,
  and the swap regret is `0`, attained by `φ = id`.

*Needs:* Mathlib `Convexity.StdSimplex`, `Convexity.StdSimplex.range_toFun_comp_weights`,
`dotProduct`.

### 1.2 Hedge

Define `hedge η`: `p t a = exp (η S a) / Σ_b exp (η S b)` with `S a = Σ_{s<t} u s a`. Prove that
for `η > 0` and every payoff sequence with range `Δ`,
`max_a regret p u T a ≤ log n / η + η Δ² T / 8` (`hedge_regret_le`), and that for `n ≥ 2`,
`T ≥ 1` and `Δ > 0`, the learning rate `η = √(8 log n / T) / Δ` gives
`max_a regret p u T a ≤ Δ √(T log n / 2)` (`hedge_regret_le_sqrt`).

The proof bounds `log (W_{t+1}/W_t)` for `W_t = Σ_a exp (η S a)` by Hoeffding's lemma applied to
the distribution `p t`. (Freund and Schapire 1997, Section 2 and Theorem 2, for the method;
Cesa-Bianchi and Lugosi 2006, Theorem 2.2, for the bound; proved here.)

**Checks.**

- `n = 1`: the bound is `η Δ² T / 8 ≥ 0`, and the regret is `0`.
- `T = 0`: the first bound reads `0 ≤ log n / η`.
- `u t = (1, 0)` for all `t`, `n = 2`, `Δ = 1`: the regret against action `0` is
  `Σ_t p t 1 ≤ log 2/η + η T/8`, and `p t 1 = 1/(1 + exp (η t))` decays geometrically. With the
  weights `exp (−η S a)` of the loss convention, `p t 1` would tend to `1` and the regret would
  grow linearly.
- `η = 0` gives the uniform strategy at every time, with regret `T/2` in the same example: the
  hypothesis `η > 0` is used.

*Needs:* 1.1; Mathlib `ProbabilityTheory.hasSubgaussianMGF_of_mem_Icc`.

### 1.3 Regret matching

Define `rmStrategy R = R⁺ / Σ_a (R a)⁺` if `Σ_a (R a)⁺ > 0` and the uniform strategy otherwise,
and the cumulative regret `rmRegret u`: `R 0 = 0`, `R (t+1) = R t + r t` with
`p t = rmStrategy (R t)` and `r t a = u t a − ⟨p t, u t⟩`. Prove:

- `rmStrategy R ∈ simplex ι` for every `R`, and `regret p u T a = R T a`;
- `Σ_a ((R T a)⁺)² ≤ Σ_{t<T} Σ_a (r t a)²` (`regretMatching_sum_sq_pos_le`);
- for `u` with range `Δ`: `max_a regret p u T a ≤ Δ √(n T)` (`regretMatching_regret_le`);
- with time-varying ranges `Δ t`: `max_a regret p u T a ≤ √(n Σ_{t<T} (Δ t)²)`
  (`regretMatching_regret_le_of_ranges`).

The key identity is `⟨(R t)⁺, r t⟩ = 0`: `p t` is proportional to `(R t)⁺` when `(R t)⁺ ≠ 0`, and
both sides vanish when `(R t)⁺ = 0`, whatever is played then.
(Hart and Mas-Colell 2000, Section 4(c), Theorem B, for the procedure and its consistency; Hart
and Mas-Colell 2001, Theorem 3.3 with the `ℓ₂` potential; the bound is proved here.)

**Checks.**

- `rmStrategy 0` and `rmStrategy (−1, −2)` are uniform; `rmStrategy (3, −1, 1) = (3/4, 0, 1/4)`.
- `n = 1`: `R t = 0`, and both sides of the first inequality are `0`.
- `n = 2`, `u t = (1, 0)` for all `t`, `Δ = 1`: `p 0` is uniform, `R 1 = (1/2, −1/2)`, `p t = (1, 0)`
  for `t ≥ 1`, and the regret is `1/2 ≤ √(2T)` for `T ≥ 1`.
- `n = 2`, `u 0 = (1, 0)`, `u 1 = (0, 1)`: `p 1 = (1, 0)`, `r 1 = (0, 1)` and `R 2 = (1/2, 1/2)`.

*Needs:* 1.1.

### 1.4 Regret matching+

Define `rmPlusState u`: `Q 0 = 0`, `Q (t+1) = (Q t + r t)⁺` with `p t = rmStrategy (Q t)`. Prove
`regret p u T a ≤ Q T a` for every `a`, `Σ_a (Q T a)² ≤ Σ_{t<T} Σ_a (r t a)²`, and so, for `u`
with range `Δ`, `max_a regret p u T a ≤ Δ √(n T)` (`regretMatchingPlus_regret_le`).

(Tammelin 2014, Section 2, for the procedure; Tammelin, Burch, Johanson and Bowling 2015,
Theorem 1, for the bound; proved here.)

**Checks.**

- `Q t ≥ 0` coordinatewise.
- `n = 2`, `u t = (1, 0)`: `Q 1 = (1/2, 0)`, `p t = (1, 0)` for `t ≥ 1`, and `Q T = (1/2, 0)`.
- `n = 2`, `u 0 = (1, 0)`, `u 1 = (0, 1)`: `Q 2 = (1/2, 1)`, while regret matching on the same
  payoffs has `R 2 = (1/2, 1/2)` (1.3), so the two methods play `(1/3, 2/3)` and `(1/2, 1/2)` at
  `t = 2`.

*Needs:* 1.1, 1.3.

### 1.5 Blackwell approachability

Let `E` be a finite-dimensional real inner product space, `κ` finite and nonempty,
`r : ι → κ → E` a vector payoff with mixed extension
`mixedPayoff r p q = Σ_i Σ_j (p i · q j) • r i j`, written `r̄ p q`, `S ⊆ E` nonempty and closed,
and `D = Metric.diam (Set.range fun ij : ι × κ ↦ r ij.1 ij.2)`. Call `S` **response-satisfiable**
(`ResponseSatisfiable r S`) if for every `q ∈ simplex κ` there is `p ∈ simplex ι` with
`r̄ p q ∈ S`. Prove:

- **the halfspace step:** for `S` convex and response-satisfiable, `g ∈ E` and `π` the
  projection of `g` onto `S`, there is `p ∈ simplex ι` with `⟨g − π, r̄ p q − π⟩ ≤ 0` for all
  `q ∈ simplex κ`, from response-satisfiability and Sion's theorem applied to the function
  `(p, q) ↦ ⟨g − π, r̄ p q − π⟩`, affine in each variable, on `simplex ι × simplex κ`;
- **approachability** (`blackwell_approachability`): if `S` is convex and response-satisfiable,
  there is a strategy `σ : (t : ℕ) → (Fin t → κ → ℝ) → (ι → ℝ)` with values in `simplex ι` such
  that for every sequence `q : ℕ → κ → ℝ` in `simplex κ` and every `T ≥ 1`,
  `Metric.infDist ((1/T) Σ_{t<T} r̄ (p t) (q t)) S ≤ D / √T`, where `p t = σ t (fun s ↦ q s)`. The
  strategy plays any point of the simplex at `t = 0`, and at `t ≥ 1` the halfspace step at the
  average payoff `g = (1/t) Σ_{s<t} r̄ (p s) (q s)`;
- **the converse** (`blackwell_converse`): if `S` is not response-satisfiable, there are
  `q₀ ∈ simplex κ` and `δ > 0` such that for every sequence `p t ∈ simplex ι`,
  `Metric.infDist ((1/T) Σ_{t<T} r̄ (p t) q₀) S ≥ δ` for all `T ≥ 1`. Here `S` need not be
  convex: the compact set `{r̄ p q₀ | p ∈ simplex ι}` is convex, contains every average, and is
  disjoint from the closed set `S`.

The rate comes from `T² d_T² ≤ (T − 1)² d_{T−1}² + D²` for `d_T` the distance of the average
payoff to `S`, using `‖r − π‖² ≤ ‖r − g‖² − ‖g − π‖²` when `⟨g − π, r − π⟩ ≤ 0`; all payoffs and
averages lie in `convexHull ℝ (range r)`, of diameter `D` by `convexHull_diam`, and `d₁ ≤ D`
because response-satisfiability puts a point of `S` in that hull. (Blackwell 1956, Theorem 1 for the
halfspace condition and Theorem 3 for closed convex sets and the converse; the source treats
realized random payoffs with convergence of probability one and states no rate. The
expected-payoff form and the rate `D/√T` are proved here.)

**Checks.**

- `mixedPayoff r (Pi.single i 1) (Pi.single j 1) = r i j`, and `mixedPayoff r p q` lies in the
  convex hull of the range of `r` for `p`, `q` in the simplices.
- `E = ℝ`, `S = (−∞, 0]`, `r i j = M i j`: response-satisfiability says
  `max_q min_p p ⬝ᵥ (M *ᵥ q) ≤ 0`, and the theorem gives a row strategy holding the average payoff
  at most `D/√T` against every column sequence. For `M = [[1], [−1]]` (one column) it holds with
  `p = (0, 1)`; for `M = [[1], [1]]` it fails, and the converse holds with `δ = 1`.
- If `S` contains the range of `r`, every strategy approaches `S`, and the distance is `0`.
- `S = ∅` is excluded: `Metric.infDist x ∅ = 0`, so the converse would fail.
- Regret matching (1.3) is the halfspace strategy for `E = EuclideanSpace ℝ ι`, `S` the
  nonpositive orthant, `κ` the finite set `ι → Fin 2` of `{0, 1}`-valued payoff vectors, and
  `r i v = (v a − v i)_a`: the projection of `g` is `min g 0` and `g − π = g⁺`.

*Needs:* Mathlib `Sion.exists_isSaddlePointOn`,
`Convexity.StdSimplex.isClosedEmbedding_toFun_comp_weights`, `Convexity.StdSimplex.compactSpace`,
`exists_norm_eq_iInf_of_complete_convex`, `norm_eq_iInf_iff_real_inner_le_zero`, `Metric.infDist`,
`Metric.diam`, `convexHull_diam`; Tau Ceti `Convexity.StdSimplex.convex_range_toFun_comp_weights`.

### Examples

Hedge and regret matching on rock-paper-scissors payoffs; Blackwell approachability of the
nonpositive orthant.

### Dependencies

1.1 uses Mathlib's `Convexity.StdSimplex`; 1.2 uses 1.1 and Hoeffding's lemma; 1.3 uses 1.1; 1.4
uses 1.1 and 1.3; 1.5 uses Sion's theorem, the simplex suppliers and the projection onto closed
convex sets.

## Layer 2: two-player zero-sum matrix games

### 2.1 The minimax theorem for matrix games

Define `Matrix.payoff`. Prove:

- `Matrix.exists_saddle_point`: there are `a ∈ simplex ι` and `b ∈ simplex κ` with
  `IsSaddlePointOn (simplex ι) (simplex κ) (payoff M) a b`, that is,
  `payoff M a y ≤ payoff M x b` for all `x ∈ simplex ι`, `y ∈ simplex κ` (the row strategy
  minimizes);
- `Matrix.exists_mixedNash`: there are `a`, `b` in the simplices with
  `payoff M x b ≤ payoff M a b ≤ payoff M a y` for all `x`, `y` (the row player maximizes), which
  is `Matrix.exists_saddle_point` for `−M`;
- `Matrix.iSup_iInf_payoff_eq`: `⨆ x : simplex ι, ⨅ y : simplex κ, payoff M x y` equals
  `⨅ y : simplex κ, ⨆ x : simplex ι, payoff M x y`, and this common value, the **value** of `M`,
  is `payoff M a b` for every pair of `Matrix.exists_mixedNash`.

(von Neumann 1928, Section 2 for the statement and Section 3 for the proof; this is
`Sion.exists_isSaddlePointOn` for the bilinear payoff on the compact convex simplices; proved
here.)

**Checks.**

- Matching pennies `M = [[1, −1], [−1, 1]]`: the unique equilibrium is `(1/2, 1/2)` for both
  players, and the value is `0`.
- Rock-paper-scissors: uniform strategies, value `0`.
- `M = [[2, 0], [0, 1]]`: in `Matrix.exists_mixedNash`, `a = b = (1/3, 2/3)` and the value is
  `2/3`.
- `M = [[1], [0]]` (one column) separates the two orientations: in `Matrix.exists_mixedNash`
  `a = (1, 0)` and the value is `1`; in `Matrix.exists_saddle_point` the minimizing row strategy
  is `a = (0, 1)` and `payoff M a b = 0`.

*Needs:* Mathlib `Sion.exists_isSaddlePointOn`, `IsSaddlePointOn`,
`Convexity.StdSimplex.isClosedEmbedding_toFun_comp_weights`, `Convexity.StdSimplex.compactSpace`;
Tau Ceti `Convexity.StdSimplex.convex_range_toFun_comp_weights`.

### 2.2 No-regret self-play

Let the row player play `x t ∈ simplex ι` with regret at most `R₁` against `u t = M *ᵥ y t`, and
the column player play `y t ∈ simplex κ` with regret at most `R₂` against `v t = −(x t ᵥ* M)`,
both over `T ≥ 1` rounds, and let `x̄`, `ȳ` be the averages. Prove (`gap_le_of_regret`) that `x̄`
and `ȳ` lie in the simplices and satisfy the **duality gap bound**
`payoff M x ȳ − payoff M x̄ y ≤ (R₁ + R₂)/T` for all `x`, `y` in the simplices, so that `(x̄, ȳ)`
is an `ε`-equilibrium with `ε = (R₁ + R₂)/T`, and `payoff M x̄ ȳ` and the value are within `ε` of
each other. With regret matching for both players, each reading the other's strategies before
time `t`, and entries of `M` in an interval of length `Δ`:
`ε ≤ Δ (√|ι| + √|κ|)/√T` (`regretMatching_selfPlay_gap_le`); the same bound holds with regret
matching+ for either player.

(Freund and Schapire 1999, Sections 5 and 6.1; Cesa-Bianchi and Lugosi 2006, Section 7.3; the
constants are proved here.)

**Checks.**

- The gap `max_x payoff M x ȳ − min_y payoff M x̄ y` is `0` exactly at a saddle point, and is
  always at least `0`.
- The bound gives a second proof of 2.1's minimax equality by letting `T → ∞`.
- Matching pennies with regret matching for both players: every payoff vector against the uniform
  strategy is `0`, so both players stay uniform, every regret is `0`, and the gap is `0`.
- `T = 0` is excluded: the averages are then the zero vector, which is not in the simplex.

*Needs:* 1.1, 1.3, 1.4, 2.1; Tau Ceti `Convexity.StdSimplex.convex_range_toFun_comp_weights`.

### Examples

Matching pennies, rock-paper-scissors, `[[2, 0], [0, 1]]` and the one-column game `[[1], [0]]`.

### Dependencies

2.1 uses Sion's theorem and the simplex suppliers; 2.2 uses 1.1, 1.3, 1.4, 2.1 and the convexity
of the simplex.

## Layer 3: finite games and correlated equilibria

### 3.1 Nash equilibria

Define `expectedUtility` and `IsNash u σ`: `σ i ∈ simplex (A i)` for all `i`, and
`U i (Function.update σ i τ) ≤ U i σ` for all `i` and all `τ ∈ simplex (A i)`. Prove:

- `U i` is affine in each `σ j` separately, and for a mixed profile `σ` it suffices to test pure
  deviations `τ = Pi.single a 1` (`isNash_iff_pure`);
- for a Nash equilibrium `σ`, every action `a` with `σ i a > 0` is a best response to `σ`
  (support equalization);
- **existence** (`exists_isNash`): every finite game has a mixed Nash equilibrium.

Existence applies the supplier Brouwer theorem to Nash's map
`σ i a ↦ (σ i a + g i a) / (1 + Σ_b g i b)` with gains
`g i a = (U i (update σ i (single a 1)) − U i σ)⁺` on the product of simplices, a nonempty compact convex subset of the finite-dimensional
space `∀ i, A i → ℝ`. (Nash 1951, Theorem 1; proved here.)

**Checks.**

- `expectedUtility` at a pure profile `σ i = Pi.single (a i) 1` is `u i a`; for two players with
  `u 1 = M`, it is `payoff M (σ 1) (σ 2)`.
- Matching pennies: the unique equilibrium has both players uniform, and no pure profile is an
  equilibrium.
- The battle of the sexes `u₁ = [[2, 0], [0, 1]]`, `u₂ = [[1, 0], [0, 2]]` has exactly the three
  equilibria `((1,0),(1,0))`, `((0,1),(0,1))` and `((2/3,1/3),(1/3,2/3))`.
- For two-player zero-sum games, `IsNash` is the condition of `Matrix.exists_mixedNash`.
- With no players there is one profile, and it is an equilibrium; a player with an empty action
  set is excluded, since `simplex` of an empty type is empty.

*Needs:* Tau Ceti `TauCeti.brouwerFixedPoint_compactConvex_continuousOn`,
`Convexity.StdSimplex.convex_range_toFun_comp_weights`; Mathlib
`Convexity.StdSimplex.isClosedEmbedding_toFun_comp_weights`, `Convexity.StdSimplex.compactSpace`.

### 3.2 Correlated and coarse correlated equilibria

For `μ ∈ simplex (∀ i, A i)` and `ε : N → ℝ`, define:

- `IsCoarseCorrelatedEq u μ ε`: for all `i` and `b : A i`,
  `Σ_a μ a u i (Function.update a i b) ≤ Σ_a μ a u i a + ε i`;
- `IsCorrelatedEq u μ ε`: for all `i` and `φ : A i → A i`,
  `Σ_a μ a u i (Function.update a i (φ (a i))) ≤ Σ_a μ a u i a + ε i`.

Prove that every correlated equilibrium is coarse correlated with the same `ε`; that for each `ε`
both sets are convex and compact, and nonempty when `ε ≥ 0`; and that the product distribution
`μ a = Π_i σ i (a i)` of a mixed profile `σ` is a correlated equilibrium with `ε = 0` exactly
when `σ` is a Nash equilibrium, and exactly when it is a coarse correlated equilibrium with
`ε = 0`.

(Aumann 1974, Section 3 for equilibria in correlated strategies and Example 2.7 for the chicken
game; Hart and Mas-Colell 2000, Section 4(c), for the no-regret property behind the coarse
notion, attributed there to Hannan; proved here.)

**Checks.**

- Aumann's chicken game `u₁ = [[6, 2], [7, 0]]`, `u₂ = u₁ᵀ`: the uniform distribution on
  `{(C, C), (C, D), (D, C)}` is a correlated equilibrium with payoff `5` for each player, above
  the symmetric mixed Nash payoff `14/3`.
- In matching pennies the coarse correlated equilibria with `ε = 0` all give both players
  expected payoff `0`.
- Rock-paper-scissors with payoffs `1`, `0`, `−1`: the uniform distribution on the three ties is
  a coarse correlated equilibrium with `ε = 0` (every constant deviation earns `0`) and not a
  correlated equilibrium (the swap to the action beating the recommendation earns `1`).
- For `ε i < 0` the sets may be empty: in matching pennies no distribution is a coarse correlated
  equilibrium with `ε = (−1, −1)`.

*Needs:* 3.1; Mathlib `Convexity.StdSimplex.isClosedEmbedding_toFun_comp_weights`,
`Convexity.StdSimplex.compactSpace`; Tau Ceti
`Convexity.StdSimplex.convex_range_toFun_comp_weights`.

### 3.3 Convergence of no-regret dynamics

Let each player `i` play `σ t i ∈ simplex (A i)` for `t < T`, `T ≥ 1`, and let player `i`'s
payoff sequence be `deviationPayoff u σ i t b = U i (Function.update (σ t) i (Pi.single b 1))`.
Let `empiricalDistribution σ T = (1/T) Σ_{t<T} ⊗_i σ t i`, written `μ`, be the empirical
distribution of the product profiles. Prove:

- if player `i` has external regret at most `R i`, then
  `IsCoarseCorrelatedEq u μ (fun i ↦ R i / T)` (`isCoarseCorrelatedEq_of_regret`);
- if player `i` has swap regret at most `SR i`, then
  `IsCorrelatedEq u μ (fun i ↦ SR i / T)` (`isCorrelatedEq_of_swapRegret`).

Both are identities between the regret sums and the equilibrium inequalities. (Hart and Mas-Colell
2000, Section 3, Proposition, for the correlated case in its asymptotic form; Blum and Mansour
2007, Section 2.1, Theorem 3; Cesa-Bianchi and Lugosi 2006, Section 7.4; the finite-`T`
statements are proved here.)

**Checks.**

- `T = 1`: `μ` is a product, and the statements read off the regret of one round.
- `T = 0`: `empiricalDistribution σ 0 = 0` is not a distribution, so `T ≥ 1` is used.
- `empiricalDistribution`: for two players with two actions who both play action `0` at time `0`
  and action `1` at time `1`, and `T = 2`, it is `1/2` on `(0, 0)` and on `(1, 1)` and `0`
  elsewhere; the product of the averaged marginals is `1/4` everywhere.
- For two players with `u 1 = M`, `deviationPayoff u σ 1 t = M *ᵥ σ t 2`.
- `deviationPayoff`: in matching pennies with `σ t 2 = (1, 0)`, `deviationPayoff u σ 1 t = (1, −1)`
  whatever `σ t 1` is.
- `deviationPayoff`: `⟨σ t i, deviationPayoff u σ i t⟩ = U i (σ t)`; in the previous example with
  `σ t 1 = (1/4, 3/4)` both sides are `−1/2`.
- Regret matching self-play in rock-paper-scissors with payoffs in `[−1, 1]`: `R i ≤ 2√(3T)`, so
  `μ` is a coarse correlated equilibrium with `ε i = 2√(3/T)`; regret matching controls external
  regret only, so this gives no correlated-equilibrium bound.
- For two-player zero-sum games, the coarse correlated statement for the marginals of `μ` gives
  2.2's gap bound `(R₁ + R₂)/T`.

*Needs:* 1.1, 3.1, 3.2; Tau Ceti `Convexity.StdSimplex.convex_range_toFun_comp_weights`.

### 3.4 The Blum–Mansour reduction

Prove that every `Q ∈ Matrix.rowStochastic ℝ ι` has a stationary distribution: there is
`p ∈ simplex ι` with `p ᵥ* Q = p` (`Matrix.rowStochastic.exists_stationary_distribution`), by
the supplier Brouwer theorem for the continuous self-map `p ↦ p ᵥ* Q` of the simplex.

Given `n` online algorithms `A_b` (one per action `b`), define the master algorithm: at time `t`
form the matrix `Q t ∈ Matrix.rowStochastic ℝ ι` whose row `b` is `A_b`'s strategy, play a
stationary distribution `p t` of `Q t`, and feed `A_b` the payoff vector `p t b • u t`. Prove:

- for all plays `p t` and matrices `Q t` with `p t ᵥ* Q t = p t`, the swap regret of `p` is at
  most the sum over `b` of the external regrets of the rows `Q · b` against the payoffs
  `p · b • u ·` (`swapRegret_le_sum_regret`); this step uses stationarity only, neither
  `p t ∈ simplex ι` nor `Q t ∈ Matrix.rowStochastic ℝ ι`;
- with `p t ∈ simplex ι`, regret matching for every `A_b` and `u` of range `Δ`, the swap regret
  is at most `Δ n √T` (`blumMansour_regretMatching_le`).

The last bound uses 1.3 with time-varying ranges `p t b Δ` and
`Σ_b √(Σ_t (p t b)²) ≤ √(n T)`. (Blum and Mansour 2007, Section 3, Theorem 5, for the reduction;
the stationary distribution and the bound with regret-matching copies are proved here.)

**Checks.**

- `n = 1`: `Q t = (1)`, `p t = (1)`, and every regret is `0`.
- `Q t` with all rows equal to `q`: the stationary distribution is `q`, and the master plays `q`.
- `Q = [[1, 0], [1, 0]]`: `p = (1, 0)` satisfies `p ᵥ* Q = p`, while `Q *ᵥ p = (1, 1) ≠ p`; the
  stationary vector is a left fixed vector.
- `Q = 1`: every point of the simplex is stationary; `Q = [[0, 1], [1, 0]]`: only `(1/2, 1/2)`.
- If every `A_b` has external regret at most `0`, the master has swap regret at most `0`.

*Needs:* 1.1, 1.3; Mathlib `Matrix.rowStochastic`, `Matrix.nonneg_vecMul_of_mem_rowStochastic`,
`Matrix.vecMul_dotProduct_one_eq_one_rowStochastic`,
`Convexity.StdSimplex.isClosedEmbedding_toFun_comp_weights`, `Convexity.StdSimplex.compactSpace`;
Tau Ceti `TauCeti.brouwerFixedPoint_compactConvex_continuousOn`,
`Convexity.StdSimplex.convex_range_toFun_comp_weights`.

### Examples

Matching pennies, the battle of the sexes, Aumann's chicken game, and regret-matching self-play in
rock-paper-scissors.

### Dependencies

3.1 uses Tau Ceti's Brouwer theorem and the simplex suppliers; 3.2 uses 3.1 and the simplex
suppliers; 3.3 uses 1.1, 3.1 and 3.2; 3.4 uses 1.1, 1.3, Mathlib's `Matrix.rowStochastic`, Tau
Ceti's Brouwer theorem and the simplex suppliers.

## Layer 4: sequential decision processes and CFR

### 4.1 Tree-form sequential decision processes

A **decision process** is given by a finite type `J` of decision points, finite nonempty action
types `A j`, and a parent map `parent : J → Option (Σ j, A j)` sending `j` to the sequence that
leads to it (`none` is the empty sequence), with a rank `ρ : J → ℕ` such that
`parent j = some ⟨j', a⟩ → ρ j' < ρ j`. The **sequences** are `Option (Σ j, A j)`. Several
decision points may share a parent; this branching is the observation step. The
**sequence-form polytope** `sequenceFormPolytope parent` is

`Q = {x : Option (Σ j, A j) → ℝ | x none = 1, x ≥ 0, ∀ j, Σ_a x (some ⟨j, a⟩) = x (parent j)}`.

A **behavioral strategy** is `b : ∀ j, A j → ℝ` with `b j ∈ simplex (A j)`. For arbitrary weights
`b : ∀ j, A j → ℝ`, `x` is the **sequence form** of `b` (`IsSequenceForm parent b x`) when
`x none = 1` and `x (some ⟨j, a⟩) = x (parent j) · b j a`; the rank makes it unique. For
`ℓ : Option (Σ j, A j) → ℝ`, the **best-response values** `W` (`IsBestResponseValue parent ℓ W`)
satisfy the recursion on the rank, from the leaves up,
`W ⟨j, a⟩ = ℓ (some ⟨j, a⟩) + Σ_{j' : parent j' = some ⟨j, a⟩} max_{a'} W ⟨j', a'⟩`. Prove:

- every `x ∈ Q` has values in `[0, 1]`, and `Q` is nonempty, compact and convex;
- **realization** (`mem_sequenceFormPolytope_iff`): the points of `Q` are exactly the sequence
  forms of the behavioral strategies; for `x ∈ Q` take `b j a = x (some ⟨j, a⟩)/x (parent j)`
  where the denominator is positive and any point of `simplex (A j)` elsewhere (Kuhn's theorem
  in sequence form);
- the points of `Q` with values in `{0, 1}` (pure strategies) are its extreme points
  (`Set.extremePoints`), and `Q` is their convex hull;
- **best response** (`isGreatest_linear_bestResponse`): the maximum of `x ↦ Σ_s ℓ s x s` over
  `Q` is `ℓ none + Σ_{j : parent j = none} max_a W ⟨j, a⟩`, attained at a pure strategy that
  plays a maximizing action at every decision point.

(Koller, Megiddo and von Stengel 1994, Lemma 5.1; von Stengel 1996, Definition 3.3 and
Proposition 3.4 for realization plans and Corollary 4.2 for Kuhn's theorem. The sources treat
game trees with perfect recall; the statements for decision processes are proved here.)

**Checks.**

- `IsSequenceForm`: with `j₀` (actions `a`, `a'`, parent `none`) and `j₁` (actions `c`, `c'`, parent
  `⟨j₀, a⟩`), `b j₀ = (1/2, 1/2)` and `b j₁ = (1/4, 3/4)` give `x = (1; 1/2, 1/2; 1/8, 3/8)`, and
  `1/8 + 3/8 = x (some ⟨j₀, a⟩)`; setting `x (some ⟨j, a⟩) = b j a` would give `(1/4, 3/4)` at
  `j₁`, of sum `1 ≠ 1/2`.
- `IsSequenceForm`: with `b j₀ = (0, 1)` in the same process, `x` vanishes on both sequences of
  `j₁` for every `b j₁`, so distinct behavioral strategies have the same sequence form.
- `IsSequenceForm`: for one decision point and `b j = (2, −1)`, `x = (1; 2, −1)` is the sequence
  form of `b` and is not in `Q`; the realization theorem uses `b j ∈ simplex (A j)`.
- A single decision point with `k` actions: `Q` is `{1} × simplex (Fin k)`, and the best response
  value is `ℓ none + max_a ℓ (some ⟨j, a⟩)`.
- `J` empty: `Q = {1}`, and the maximum is `ℓ none`.
- Kuhn poker, player 1: six decision points (three cards, then three after "check, bet"), `13`
  sequences, and the second decision point for card `c` has parent `⟨(c, ""), check⟩`.
- Two decision points sharing the parent `none`: `Q` is the product of their simplices. Two
  decision points `j₁`, `j₂` sharing the parent `⟨j₀, a⟩`: both `Σ_a' x (some ⟨j₁, a'⟩)` and
  `Σ_a' x (some ⟨j₂, a'⟩)` equal `x (some ⟨j₀, a⟩)`.
- The rank is used: for one decision point with `parent j = some ⟨j, a⟩` the constraint reads
  `Σ_a' x (some ⟨j, a'⟩) = x (some ⟨j, a⟩)`, and `Q` is unbounded.
- With `ℓ = −1` at every sequence and one decision point, the maximum is `−2`; a supremum taking
  the value `0` outside `Q` would give `0`.

*Needs:* Mathlib `Convexity.StdSimplex`, `Convexity.StdSimplex.range_toFun_comp_weights`,
`Convexity.StdSimplex.isClosedEmbedding_toFun_comp_weights`, `Set.extremePoints`.

### 4.2 Counterfactual values and the laminar decomposition

Let `ℓ t : Option (Σ j, A j) → ℝ` be utility vectors, the utility of `x` at time `t` being
`Σ_s ℓ t s x s`, and let `b t : ∀ j, A j → ℝ` be weights (behavioral strategies in 4.3) with
sequence forms `x t`. The **counterfactual values** `V t`
(`IsCounterfactualValue parent (ℓ t) (b t) (V t)`) satisfy the recursion on the rank, from the leaves up,

`V t ⟨j, a⟩ = ℓ t (some ⟨j, a⟩) + Σ_{j' : parent j' = some ⟨j, a⟩} Σ_{a'} b t j' a' · V t ⟨j', a'⟩`,

and the **local regrets** are
`localRegret b V T j a = Σ_{t<T} (V t ⟨j, a⟩ − Σ_{a'} b t j a' V t ⟨j, a'⟩)`, written `R̂ j a`.
Prove the **laminar regret decomposition**: for every `y ∈ Q`,

- `Σ_{t<T} Σ_s ℓ t s (y s − x t s) = Σ_j Σ_a y (some ⟨j, a⟩) · R̂ j a`, an identity that uses
  neither `y ≥ 0` nor `b t j ∈ simplex (A j)`;
- hence `Σ_{t<T} Σ_s ℓ t s (y s − x t s) ≤ Σ_j y (parent j) · max_a R̂ j a`;
- hence `Σ_{t<T} Σ_s ℓ t s (y s − x t s) ≤ Σ_j (max_a R̂ j a)⁺` (`laminar_regret_le`), because
  `0 ≤ y (parent j) ≤ 1`.

The left side is the regret of the sequence-form player against `y` (the `none` coordinate
cancels).

(Zinkevich, Johanson, Bowling and Piccione 2007, Theorem 3; Farina, Kroer and Sandholm 2019,
section "Laminar regret decomposition", Theorems 1 and 2, for the laminar form over products of
simplices; the identity over the sequence-form polytope is proved here.)

**Checks.**

- A single decision point: the counterfactual values are `ℓ t` on its sequences, the local
  regret is `regret` of 1.1, and the identity is `sum_sub_eq_sum_mul_regret`.
- `T = 0`: every term is `0`.
- If every local regret is at most `0`, the regret of the sequence-form player is at most `0`.
- Two decision points `j₀` (actions `a`, `a'`) and `j₁` with `parent j₁ = some ⟨j₀, a⟩`:
  `V t ⟨j₀, a⟩ = ℓ t (some ⟨j₀, a⟩) + Σ_{a''} b t j₁ a'' ℓ t (some ⟨j₁, a''⟩)` and
  `V t ⟨j₀, a'⟩ = ℓ t (some ⟨j₀, a'⟩)`: the values at `j₀` do not involve `b t j₀`.

*Needs:* 1.1, 4.1.

### 4.3 Counterfactual regret minimization

**CFR** (`IsCFR parent ℓ b x V`) runs regret matching (1.3) at every decision point on the
counterfactual values: `x t` is the sequence form of `b t`, `V t` are the counterfactual values
for `ℓ t` and `b t`, and `b t j = rmStrategy (localRegret b V t j)`. If at each `j` and `t` the
values `V t ⟨j, a⟩` lie in an interval `[c t j, c t j + w j]` of length `w j`, prove that the
regret of the sequence-form player against every `y ∈ Q` is at most `Σ_j w j √(|A j| T)`
(`cfr_regret_le`), and the same with regret matching+ (1.4) at every decision point. If every
`ℓ t s` lies in `[−L, L]`, then `w j = 2 L · |subtree of j|` is a valid choice, `|subtree of j|`
being the number of sequences `some ⟨j', a⟩` with `j'` equal to `j` or below it.

The local-range form is proved here; with the whole-game range in place of every `w j` it implies
the bound of Zinkevich, Johanson, Bowling and Piccione 2007, Theorem 4, which is stated for the
average regret.

**Checks.**

- A single decision point: `IsCFR` is regret matching of 1.3 on `ℓ t`, and the bound is 1.3's.
- `b 0 j` is uniform at every `j`, since `localRegret b V 0 j = 0`.
- Kuhn poker, player 1: every counterfactual value lies in `[−2/3, 2/3]` (each of the two
  opposing cards contributes at most `2/6` in absolute value), so `w j = 4/3` and the bound is
  `6 · (4/3) √(2T) = 8 √(2T)`; the same holds for player 2.
- The bound is in terms of local ranges, which may be much smaller than the range of the total
  utility.

*Needs:* 1.3, 1.4, 4.1, 4.2.

### 4.4 Zero-sum games in sequence form

A two-player zero-sum game in sequence form is a pair of decision processes with polytopes
`Q₁`, `Q₂` and a payoff matrix `G : Matrix (Option (Σ j, A₁ j)) (Option (Σ k, A₂ k)) ℝ`; player 1
maximizes and player 2 minimizes `xᵀ G y = x ⬝ᵥ (G *ᵥ y)`. Prove:

- a saddle point exists on `Q₁ × Q₂`, and `max_x min_y = min_y max_x`, by Sion's theorem on the
  compact convex sets of 4.1;
- if `x t ∈ Q₁` and `y t ∈ Q₂` have regrets at most `R₁` against `ℓ t = G *ᵥ y t` and `R₂` against
  `ℓ t = −(x t ᵥ* G)` over `T ≥ 1` rounds, the averages `x̄ = (1/T) Σ x t ∈ Q₁` and `ȳ ∈ Q₂`
  satisfy `xᵀ G ȳ − x̄ᵀ G y ≤ (R₁ + R₂)/T` for all `x ∈ Q₁`, `y ∈ Q₂`;
- **CFR self-play** (`cfr_selfPlay_gap_le`): if player 1 runs CFR on `ℓ t = G *ᵥ y t` with local
  ranges `w₁`, and player 2 on `ℓ t = −(x t ᵥ* G)` with local ranges `w₂`, then for `T ≥ 1` the
  averages lie in `Q₁` and `Q₂` and
  `xᵀ G ȳ − x̄ᵀ G y ≤ (Σ_j w₁ j √(|A₁ j| T) + Σ_k w₂ k √(|A₂ k| T))/T` for all `x ∈ Q₁`, `y ∈ Q₂`;
- **Kuhn poker** (`kuhnPoker_value`): with the sequence-form payoff matrix `kuhnPayoff` of Kuhn's
  three-card poker (cards `J < Q < K`, both players ante `1`, player 1 acts first, a bet is `1`,
  each of the six deals with probability `1/6`), the value is `−1/18`: there are `x ∈ Q₁` with
  `xᵀ G y' ≥ −1/18` for all `y' ∈ Q₂` and `y ∈ Q₂` with `x'ᵀ G y ≤ −1/18` for all `x' ∈ Q₁`. Both
  players' decision points are `KuhnPoint = Fin 3 ⊕ Fin 3` (first and second decision with each
  card), with sequences `KuhnSeq`, parent maps `kuhnParent₁` (the second decision of player 1
  follows "check") and `kuhnParent₂` (all at the root), and showdown sign `kuhnWin`.

The averages are averages of sequence forms, not of behavioral strategies. (The value `−1/18` is
proved here; Zinkevich, Johanson, Bowling and Piccione 2007, Theorem 2, and Farina, Kroer and Sandholm
2019, Theorem 3, for self-play; proved here.)

**Checks.**

- A one-decision-point game for each player is a matrix game, and the statements are 2.1 and
  2.2.
- `kuhnPayoff` has `kuhnPayoff (some ⟨inl K, bet⟩) (some ⟨inr J, call⟩) = 2/6`,
  `kuhnPayoff (some ⟨inl J, check⟩) (some ⟨inl Q, check⟩) = −1/6` and
  `kuhnPayoff (some ⟨inr J, fold⟩) (some ⟨inl K, bet⟩) = −1/6`, and vanishes when both cards
  are equal.
- Kuhn poker's equilibria: for `α ∈ [0, 1/3]`, player 1 bets `J` with probability `α` and `K`
  with probability `3α`, checks `Q`, and after "check, bet" calls with `Q` with probability
  `α + 1/3`, always with `K` and never with `J`; player 2 after a check bets `K` always and `J`
  with probability `1/3`, and after a bet calls with `K` always and with `Q` with probability
  `1/3`. Each of these strategies of player 1 guarantees `−1/18`, and player 2's holds player 1
  to `−1/18`.
- CFR self-play on Kuhn poker, `T = 1000`: the average value is `−0.05556` and the gap `0.0145`,
  against `−1/18 = −0.05556`; 4.3's bound gives the gap at most `16 √2 / √T ≈ 0.72`.
- Averaging behavioral strategies instead of sequence forms does not in general give a point
  whose sequence form is `x̄`.

*Needs:* Mathlib `Sion.exists_isSaddlePointOn`; 2.2, 4.1, 4.3.

### Examples

Kuhn poker in sequence form, and the decision process of a single player with an observation step.

### Dependencies

4.1 uses Mathlib's `Convexity.StdSimplex`; 4.2 uses 1.1 and 4.1; 4.3 uses 1.3, 1.4, 4.1 and 4.2;
4.4 uses Sion's theorem, 2.2, 4.1 and 4.3.

## Dependencies

Layer 1 uses Mathlib's simplex, Hoeffding's lemma and Sion's theorem. Layer 2 uses Layer 1 and
Sion's theorem. Layer 3 uses Layer 1, Mathlib's `Matrix.rowStochastic` and Tau Ceti's Brouwer
theorem. Layer 4 uses Layers 1–2. The per-target *Needs:* lines are authoritative.

## Downstream consumers

No roadmap on main consumes these targets.
[MathematicalStatisticsFoundations](../MathematicalStatisticsFoundations/README.md) 7.2 proves
its minimax theorem for finite statistical games from Sion's theorem and does not use 2.1.

## Provenance

Lean 4 developments by Arthur Freitas Ramos (BSD-3) cover parts of this material:
regret matching and regret matching+ with the `√(nT)` bound and `ε`-equilibria of self-play
(<https://github.com/Arthur742Ramos/verified-regret-matching-lean>), finite mixed Nash existence
through a Scarf/Brouwer development (<https://github.com/Arthur742Ramos/nash-equilibrium-lean>,
<https://github.com/Arthur742Ramos/dependent-nash-equilibrium-lean>), and finite-dimensional
obstructions for Blackwell approachability reductions
(<https://github.com/Arthur742Ramos/blackwell-approachability-lean>). The roadmap develops the
mathematics independently of them, cites this work, and treats it as reference material, not as
the specification.

## Scope and ownership

This roadmap owns:

- the full-information online protocol over a finite simplex, external regret and swap regret;
- Hedge, regret matching and regret matching+, with their regret bounds;
- Blackwell approachability for closed convex sets, with the rate `D/√T`, and its converse;
- the matrix-game form of von Neumann's minimax theorem, and the approximate-equilibrium
  guarantee of no-regret self-play;
- finite normal-form games: mixed Nash equilibria and their existence, correlated and coarse
  correlated equilibria, and the convergence of no-regret dynamics to them;
- the Blum–Mansour swap-regret reduction, with the existence of a stationary distribution of an
  arbitrary finite row-stochastic matrix as a fixed-point statement (3.4);
- tree-form sequential decision processes, their sequence-form strategy polytopes, behavioral
  strategies, best responses, counterfactual values, the laminar regret decomposition, CFR, and
  CFR self-play in two-player zero-sum sequence-form games.

It consumes, and does not re-prove, the items listed under
[Exact supplier contracts](#exact-supplier-contracts).

Out of scope:

- Sion's minimax theorem, which is Mathlib's, and Brouwer's fixed-point theorem, which is Tau
  Ceti's;
- the theory of stationary distributions of Markov chains, which belongs to
  [MarkovChainsAndRenewal](../MarkovChainsAndRenewal/README.md), Layer 3: stationarity as
  `Kernel.Invariant` with its finite matrix form, and existence and uniqueness for irreducible
  positive recurrent chains. Target 3.4 keeps one statement, existence for an arbitrary finite
  row-stochastic matrix, which has no irreducibility hypothesis and is a fixed-point argument;
- the minimax theorem for statistical decision problems, which belongs to
  [MathematicalStatisticsFoundations](../MathematicalStatisticsFoundations/README.md) 7.2 and is
  about risk sets of randomized decision rules, not about matrices;
- sampled play: the almost-sure and high-probability forms of the regret bounds and of
  Blackwell's theorem for realized actions. Every statement here is about the mixed strategies
  and their expected payoffs;
- extensive-form games presented as game trees with chance nodes and information partitions, and
  their translation into sequence form; sequential games here are given in sequence form directly;
- bandit feedback, sampled and Monte Carlo CFR, neural approximations such as Deep CFR, and
  CFR+'s alternating updates and weighted averaging;
- online convex optimization over general convex sets, online mirror descent and optimistic
  methods;
- equilibrium refinements (perfect, proper, sequential), potential and congestion games,
  evolutionary dynamics, mechanism design, and the computational complexity of equilibria;
- first-order methods for smooth optimization, including the regret computation for Adam, which
  belong to the FirstOrderOptimization roadmap (its 6.4); that roadmap excludes online-learning
  regret bounds and mirror descent, so the two do not overlap.

## Exact supplier contracts

- Mathlib:
  - `Convexity.StdSimplex`, `Convexity.StdSimplex.range_toFun_comp_weights`
    (`Geometry/Convex/ConvexSpace/Defs.lean`): for a finite type, the weight vectors are the
    nonnegative vectors of sum `1`; the compactness of `simplex ι` from
    `Convexity.StdSimplex.isClosedEmbedding_toFun_comp_weights`
    (`Geometry/Convex/ConvexSpace/Topology.lean`) with the instance
    `Convexity.StdSimplex.compactSpace` (`Geometry/Convex/ConvexSpace/CompactSpaceStdSimplex.lean`);
  - `IsSaddlePointOn X Y f a b` (`Order/SaddlePoint.lean`), which says `f a y ≤ f x b` for all
    `x ∈ X`, `y ∈ Y`, and Sion's theorem for real-valued functions,
    `Sion.exists_isSaddlePointOn` (`Topology/Sion.lean`): for `X` and `Y` nonempty, convex and
    compact in real topological vector spaces and `f` with `f · y` lower semicontinuous and
    quasiconvex on `X` for every `y ∈ Y` and `f x ·` upper semicontinuous and quasiconcave on `Y`
    for every `x ∈ X`, there are `a ∈ X` and `b ∈ Y` with `IsSaddlePointOn X Y f a b`;
  - Hoeffding's lemma `ProbabilityTheory.hasSubgaussianMGF_of_mem_Icc`
    (`Probability/Moments/SubGaussian.lean`): for a probability measure `μ` and an almost
    everywhere measurable `X` with values in `[a, b]` almost surely, `X − μ[X]` has a
    sub-Gaussian moment generating function with parameter `((b − a)/2)²`; it is applied to a
    distribution on a finite set;
  - `Matrix.rowStochastic` (`LinearAlgebra/Matrix/Stochastic.lean`), with
    `Matrix.nonneg_vecMul_of_mem_rowStochastic` and
    `Matrix.vecMul_dotProduct_one_eq_one_rowStochastic`: `x ᵥ* Q` is nonnegative with the same
    coordinate sum as `x` for nonnegative `x`;
  - `Metric.infDist`, `Metric.diam`, `convexHull_diam` (`Analysis/Normed/Module/Convex.lean`),
    `Set.extremePoints`, and the projection onto a nonempty complete convex set `K` of a real
    inner product space (`Analysis/InnerProductSpace/Projection/Minimal.lean`):
    `exists_norm_eq_iInf_of_complete_convex` gives `v ∈ K` with `‖u − v‖ = ⨅ w : K, ‖u − w‖`, and
    `norm_eq_iInf_iff_real_inner_le_zero` says that `v ∈ K` is such a point exactly when
    `⟪u − v, w − v⟫ ≤ 0` for all `w ∈ K`.
- Tau Ceti:
  - `Convexity.StdSimplex.convex_range_toFun_comp_weights`
    (`TauCeti/Analysis/Convex/StdSimplex.lean`), the convexity of `simplex ι`;
  - `TauCeti.brouwerFixedPoint_compactConvex_continuousOn`
    (`TauCeti/AlgebraicTopology/Singular/BrouwerFixedPoint.lean`): a function that is continuous
    on a nonempty compact convex subset `C` of a finite-dimensional real normed space and maps
    `C` into itself has a fixed point in `C`.

## References

- R. J. Aumann, *Subjectivity and correlation in randomized strategies*, J. Math. Econom. **1**
  (1974), 67–96.
- D. Blackwell, *An analog of the minimax theorem for vector payoffs*, Pacific J. Math. **6**
  (1956), 1–8.
- A. Blum and Y. Mansour, *From external to internal regret*, J. Mach. Learn. Res. **8** (2007),
  1307–1324.
- N. Cesa-Bianchi and G. Lugosi, *Prediction, learning, and games*, Cambridge University Press,
  2006.
- G. Farina, C. Kroer and T. Sandholm, *Online convex optimization for sequential decision
  processes and extensive-form games*, AAAI 2019, arXiv:1809.03075.
- Y. Freund and R. E. Schapire, *A decision-theoretic generalization of on-line learning and an
  application to boosting*, J. Comput. System Sci. **55** (1997), 119–139.
- Y. Freund and R. E. Schapire, *Adaptive game playing using multiplicative weights*, Games
  Econom. Behav. **29** (1999), 79–103.
- S. Hart and A. Mas-Colell, *A simple adaptive procedure leading to correlated equilibrium*,
  Econometrica **68** (2000), 1127–1150.
- S. Hart and A. Mas-Colell, *A general class of adaptive strategies*, J. Econom. Theory **98**
  (2001), 26–54.
- D. Koller, N. Megiddo and B. von Stengel, *Fast algorithms for finding randomized strategies in
  game trees*, STOC 1994, 750–759.
- J. Nash, *Non-cooperative games*, Ann. of Math. **54** (1951), 286–295.
- O. Tammelin, *Solving large imperfect information games using CFR+*, arXiv:1407.5042, 2014.
- O. Tammelin, N. Burch, M. Johanson and M. Bowling, *Solving heads-up limit Texas hold'em*,
  IJCAI 2015, 645–652.
- J. von Neumann, *Zur Theorie der Gesellschaftsspiele*, Math. Ann. **100** (1928), 295–320.
- B. von Stengel, *Efficient computation of behavior strategies*, Games Econom. Behav. **14**
  (1996), 220–246.
- M. Zinkevich, M. Johanson, M. Bowling and C. Piccione, *Regret minimization in games with
  incomplete information*, NeurIPS 2007.
