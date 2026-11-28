# Roadmap: potential games and the price of anarchy

**Summary.** Many games of congestion share a hidden structure: a single function on strategy
profiles, a potential, changes by exactly the amount a player's own cost changes whenever that
player alone changes strategy. Such a game with finite nonempty strategy sets has an
equilibrium in pure strategies, and in games of routing with continuous nondecreasing latencies
the equilibria are exactly the minimizers of a potential. This roadmap develops potential games
for strategic games with costs and finitely many players, congestion games in their atomic and
nonatomic forms, and the classical bounds on how much worse an equilibrium can be than an
optimal outcome.

The headline theorems are these.

- *Monderer and Shapley.* A finite game has the finite improvement property, that every
  sequence of strict unilateral improvements is finite, if and only if it has a generalized
  ordinal potential; such a game with nonempty strategy sets has a pure Nash equilibrium. A game
  has an exact potential if and only if the deviators' cost changes sum to zero around every
  closed path of unilateral deviations, and it suffices to test the closed paths of four
  deviations by two players.
- *Rosenthal.* Every congestion game, with arbitrary real resource costs, has an exact potential,
  so a congestion game with finite nonempty strategy sets has a pure Nash equilibrium.
- *Wardrop equilibria and Beckmann's potential.* In a nonatomic congestion game (a routing network
  is the main example), a minimizer of Beckmann's potential, the sum over resources of the
  integral of the latency up to the load, is a Wardrop equilibrium when the latencies are
  continuous, and every Wardrop equilibrium is a minimizer when they are nondecreasing. So
  equilibria exist when the latencies are continuous and some feasible flow exists, and with
  nondecreasing latencies any two equilibria give every resource the same latency. With affine
  latencies with nonnegative coefficients the total latency of an equilibrium is at most `4/3`
  times that of every feasible flow (Roughgarden and Tardos), which Pigou's two-link network
  attains.
- *Smoothness and the bound `5/2`.* If a cost game is `(λ, μ)`-smooth with `μ < 1`, every coarse
  correlated equilibrium has expected social cost at most `λ/(1 − μ)` times the social cost of
  every profile (Roughgarden). Atomic congestion games with affine costs with nonnegative
  coefficients are `(5/3, 1/3)`-smooth, so their pure Nash equilibria and coarse correlated
  equilibria cost at most `5/2` times the optimum (Awerbuch, Azar and Epstein; Christodoulou and
  Koutsoupias), and an example with three players attains `5/2`.

The roadmap builds on RegretMinimizationAndEquilibria, whose coarse correlated equilibria it uses
and whose results on mixed Nash and correlated equilibria and no-regret play carry the smoothness
bound to those notions. From Mathlib it uses interval integrals and minima of continuous functions
on compact sets.

Below, Layer 1 proves the theorems of Monderer and Shapley, Layer 2 Rosenthal's theorem, Layer 3
the smoothness bound, and Layer 4, from Layers 2 and 3, the bound `5/2`. Layer 5, on nonatomic
games, depends on no other layer.

## Conventions

- **Games are given by costs**, which players minimize. Players form a finite type `N` with
  `[Fintype N] [DecidableEq N]`, player `i` has strategies `A i`, a pure profile is
  `a : ∀ i, A i`, and the cost game is `C : N → (∀ i, A i) → ℝ`. A unilateral deviation of `i`
  to `b` is `Function.update a i b`. The utility games of RegretMinimizationAndEquilibria
  (its Conventions), where players maximize `u`, are the cost games `C i a = −u i a`; that is how
  its equilibrium notions are applied here.
- **Finiteness.** The player set is finite in every statement: with infinitely many players a
  game can have a generalized ordinal potential and finite strategy sets without the finite
  improvement property (the Check of 1.2). Strategy sets are finite (`[∀ i, Fintype (A i)]`)
  where a theorem needs it, and only there:
  the characterizations of exact potentials in 1.3 and Rosenthal's potential in 2.1 hold for
  arbitrary strategy sets.
- **Social cost** is `socialCost C a = Σ_i C i a`. The price of anarchy is never written as a
  ratio: every bound reads `cost of the equilibrium ≤ c · cost of the comparison outcome`, for
  every comparison outcome, so that no division by an optimal cost occurs (an optimal cost may be
  `0`, as in the Check of 4.2).
- **Distributions over profiles** are vectors `ν : (∀ i, A i) → ℝ` in `simplex (∀ i, A i)`, the
  simplex of RegretMinimizationAndEquilibria (its Conventions), copied verbatim into
  `Suggested.lean`: the weight vectors of Mathlib's `Convexity.StdSimplex`, which by
  `Convexity.StdSimplex.range_toFun_comp_weights` are the nonnegative vectors of sum `1`. The
  expected social cost of `ν` is `Σ_a ν a · socialCost C a`.
- **Atomic congestion games** have a finite resource type `E` with `[DecidableEq E]`; loads are
  natural numbers and resource costs are functions `ℕ → ℝ`, of which only the values at loads
  `1, …, |N|` matter.
- **Nonatomic congestion games** have a finite type of commodities `K`, for each commodity `k` a
  finite type of routes `P k`, and a finite resource type `E`; flows are `f : ∀ k, P k → ℝ`, loads
  are real, and latencies are functions `ℝ → ℝ` of which only the values on `[0, ∞)` matter, so
  continuity and monotonicity are asked on `Set.Ici 0`. A route is a finite set of resources; a
  routing network is the case where the resources are the edges of a finite directed graph and
  the routes of `k` are its `s_k`–`t_k` paths. Every theorem of Layer 5 holds for arbitrary route
  sets.
- **Wardrop equilibria** are defined by the condition that every used route has the least
  latency among the routes of its commodity. Roughgarden's thesis defines flows at Nash
  equilibrium by small shifts of flow (its Definition 2.2.1) and proves the two notions equal for
  continuous nondecreasing latencies (its Proposition 2.2.2); for discontinuous latencies they
  differ, and every statement here is about the Wardrop condition.

## Layer 1: potential games

### 1.1 Pure Nash equilibria and potentials

Define, for a cost game `C`:

- `IsPureNash C a`: `C i a ≤ C i (Function.update a i b)` for every player `i` and strategy `b`;
- `IsExactPotential C Φ` for `Φ : (∀ i, A i) → ℝ`: every unilateral deviation changes the
  deviator's cost and `Φ` by the same amount,
  `C i (update a i b) − C i a = Φ (update a i b) − Φ a`;
- an ordinal potential: a deviation strictly lowers the deviator's cost exactly when it strictly
  lowers `Φ`;
- `IsGeneralizedOrdinalPotential C Φ`: a deviation that strictly lowers the deviator's cost
  strictly lowers `Φ`.

Prove:

- an exact potential is an ordinal potential, and an ordinal potential is a generalized ordinal
  potential;
- with an exact potential `Φ`, a profile is a pure Nash equilibrium exactly when no unilateral
  deviation lowers `Φ`;
- `Φ` is an exact potential of `C` if and only if, for every `i`, the function `C i − Φ` does not
  depend on player `i`'s own strategy: a game is an exact potential game exactly when it is the
  sum of a coordination game, in which all players have the cost `Φ`, and a dummy game, in which
  no player's cost depends on its own strategy;
- any two exact potentials of the same game differ by a constant, since any two profiles are
  joined by at most `|N|` unilateral deviations.

(The notions are those of Monderer and Shapley 1996; proved here.)

**Checks.**

- Matching pennies with costs, `C 1 a = −1` when the two strategies agree and `1` otherwise and
  `C 2 = −C 1`, has no pure Nash equilibrium and, by 1.2, no generalized ordinal potential.
- The prisoner's dilemma with costs `C 1 = [[1, 3], [0, 2]]` (rows: player 1 cooperates or
  defects; columns: player 2 does) and `C 2 a = C 1 (a 2, a 1)` has the exact potential `0` at
  mutual cooperation, `−1` at the two mixed profiles and `−2` at mutual defection; its unique pure
  Nash equilibrium, mutual defection, is the minimizer.
- An ordinal potential need not be exact. With two strategies each, let player 1 be indifferent
  everywhere and let player 2's costs be `(0, 1)` when player 1 plays its first strategy and
  `(0, 2)` when it plays its second. A function equal to `0` where player 2 plays its first
  strategy and `1` elsewhere is an ordinal potential, and there is no exact potential: around the
  four-cycle in which player 1 switches, player 2 switches, player 1 switches back and player 2
  switches back, the cost changes are `0, 2, 0, −1`, with total `1`.
- A generalized ordinal potential need not be ordinal. With player 1 indifferent everywhere and
  player 2's costs `(0, 0)` and `(0, 1)` in the two rows, player 2's cost is a generalized ordinal
  potential, and an ordinal potential would have to be constant on all four profiles (the
  indifferences force equal values) while strictly smaller at one profile than at another.

*Needs:* Mathlib `Function.update`. (Proved here.)

### 1.2 Improvement paths

Define `IsImprovementStep C a a'`: some player `i` has `a' = Function.update a i (a' i)` and
`C i a' < C i a`; and `HasFiniteImprovementProperty C`: there is no infinite sequence
`s : ℕ → ∀ i, A i` with an improvement step from `s k` to `s (k + 1)` for every `k`. Prove, for
finite strategy sets:

- `exists_isPureNash_of_isGeneralizedOrdinalPotential`: if `C` has a generalized ordinal potential
  and every `A i` is nonempty, `C` has a pure Nash equilibrium;
- `hasFiniteImprovementProperty_iff`: `C` has the finite improvement property if and only if it has
  a generalized ordinal potential.

Route: the potential attains its minimum on the nonempty finite set of profiles, and a minimizer
admits no deviation that strictly lowers the deviator's cost. Along an infinite improvement
sequence a generalized ordinal potential strictly decreases, which is impossible on the finite set
of profiles. Conversely, with the finite improvement property, let `Φ a` be the number of
profiles reachable from `a` by a nonempty finite sequence of improvement steps; an improvement
step from `a` to `a'` makes the set reachable from `a'` a subset of that from `a` that misses
`a'`, since otherwise there would be an improvement cycle and hence an infinite improvement
sequence. (Monderer and Shapley 1996; proved here.)

**Checks.**

- In matching pennies the four profiles form an improvement cycle, each step taken by the player
  whose cost is `1`; there is no finite improvement property, no pure equilibrium and no
  generalized ordinal potential.
- Finite strategy sets are needed in both theorems. One player with strategies `ℕ` and cost
  `C n = −n` has the exact potential `C`, an infinite improvement sequence `0, 1, 2, …` and no pure
  Nash equilibrium.
- A finite player set is needed. With players `ℕ`, strategies `{0, 1}` for each and
  `C i a = 1` when `a i = 0` and `0` otherwise, `Φ a = Σ_i 2^(−i) · [a i = 0]` is a generalized
  ordinal potential, and switching players `0, 1, 2, …` to `1` one at a time from the profile with
  all players at `0` is an infinite improvement sequence.
- On 3000 random games with one to three players and one to three strategies each, the finite
  improvement property, the existence of a generalized ordinal potential (the reachability count
  of the route) and the existence of a pure equilibrium agreed with the theorems.

*Needs:* 1.1; Mathlib `Finite.exists_min`, `Finite.wellFounded_of_trans_of_irrefl`.

### 1.3 Closed paths of deviations

A path of unilateral deviations from `a` is a list `s : List (Σ i, A i)`; the entry `⟨i, b⟩`
sets player `i`'s strategy to `b`. Define `deviateAlong a s`, the profile reached, and
`pathCostChange C a s`, the sum over the entries of the change in the cost of the player who
deviates. Prove:

- `exists_isExactPotential_iff_closedPath`: `C` has an exact potential if and only if
  `pathCostChange C a s = 0` whenever `deviateAlong a s = a`;
- `exists_isExactPotential_iff_fourCycle`: `C` has an exact potential if and only if, for all
  profiles `a`, distinct players `i ≠ j` and strategies `b : A i`, `c : A j`, the four deviations
  `a → update a i b → update (update a i b) j c → update a j c → a` (players `i`, `j`, `i`, `j`)
  have total cost change `0`.

No finiteness of the strategy sets is assumed. Route: with an exact potential the cost changes
telescope to `Φ` at the end minus `Φ` at the start. Conversely, fix a base profile (if every `A i`
is nonempty; otherwise there is no profile and any `Φ` will do) and let `Φ a` be the cost change
along a path from the base to `a` that changes the players' strategies one at a time; the
closed-path condition makes this independent of the path. For four-cycles, show that the cost
change along a path is unchanged when two consecutive deviations by different players are
exchanged, which is the four-cycle condition, and reduce every closed path to one in which each
player's deviations are consecutive. (Monderer and Shapley 1996; proved here.)

**Checks.**

- Matching pennies: from the profile where both play their first strategy, the four-cycle with
  `i = 1`, `j = 2` has cost changes `2, 2, 2, 2`, total `8 ≠ 0`.
- The condition `i ≠ j` excludes nothing: four deviations of one player around a closed path have
  total cost change `0` in every game, since its consecutive cost changes telescope.
- The empty path is closed and has cost change `0`.
- On 3000 random games, half of them built as a coordination game plus a dummy game, the
  four-cycle condition held exactly when an exact potential exists (computed by propagating
  values along deviations from one profile and checking consistency), and with an exact potential
  random closed paths had total cost change `0`.

*Needs:* 1.1; Mathlib `Function.update`, `List.foldl`.

### Examples

Matching pennies, the prisoner's dilemma, and the two-by-two games of the Checks of 1.1 separating
exact, ordinal and generalized ordinal potentials.

### Dependencies

1.2 and 1.3 use 1.1; Mathlib `Finite.exists_min`, `Finite.wellFounded_of_trans_of_irrefl`,
`Function.update`, `List.foldl`. No other layer.

## Layer 2: congestion games

### 2.1 Rosenthal's theorem

Define `CongestionGame N E A`: for each player `i` and strategy `b : A i` a set of resources
`uses i b : Finset E`, and for each resource a cost `resourceCost e : ℕ → ℝ`. The load
`CongestionGame.load G a e` is the number of players whose strategy at `a` uses `e`; the cost of
player `i` is `CongestionGame.playerCost G i a = Σ_{e ∈ uses i (a i)} resourceCost e (load a e)`;
Rosenthal's potential is
`CongestionGame.rosenthalPotential G a = Σ_e Σ_{k = 1}^{load a e} resourceCost e k`. Prove:

- `CongestionGame.isExactPotential_rosenthalPotential`: Rosenthal's potential is an exact
  potential of `playerCost`, with no hypothesis on the resource costs and no finiteness of the
  strategy sets;
- `CongestionGame.exists_isPureNash`: with finite nonempty strategy sets, a congestion game has a
  pure Nash equilibrium;
- the social cost is `Σ_e load a e · resourceCost e (load a e)`.

Route: when player `i` moves from `S` to `S'`, the loads rise by one on `S' \ S`, fall by one on
`S \ S'` and are unchanged elsewhere, so both the player's cost and the potential change by
`Σ_{e ∈ S' \ S} c_e(n_e + 1) − Σ_{e ∈ S \ S'} c_e(n_e)`; then 1.2. The social cost formula is an
exchange of sums. (Rosenthal 1973; Roughgarden, Lecture 13 of the 2013 notes, Theorem 1.1 for
routing games and Section 2 for congestion games with arbitrary costs; Roughgarden 2015,
Example 4.11.)

**Checks.**

- Two players, two resources `u` with cost `2` and `v` with cost `k` at load `k`, each player
  using exactly one resource: both profiles with one player on each resource and the profile with
  both on `v` are pure Nash equilibria, with social costs `3` and `4`. Rosenthal's potential is `3`
  at all three, and `4` with both on `u`; it differs from the social cost.
- On 1500 random congestion games with up to three players, four resources and resource costs
  drawn at random (not monotone, some negative), the potential identity held at every deviation and
  a pure equilibrium existed.
- Nonempty strategy sets are needed: a player without strategies leaves no profile.

*Needs:* 1.1, 1.2; Mathlib `Finset.Icc`, `Finset.card`.

### Examples

The two-player game of the Checks, whose equilibria have social costs `3` and `4`.

### Dependencies

2.1 uses 1.1 and 1.2.

## Layer 3: smooth games

### 3.1 Smoothness

Define `socialCost C a = Σ_i C i a` and `IsSmooth C λ μ`: for all profiles `a` and `o`,
`Σ_i C i (update a i (o i)) ≤ λ · socialCost C o + μ · socialCost C a`. Prove, for a
`(λ, μ)`-smooth game with `μ < 1`, that every pure Nash equilibrium `a` has
`socialCost C a ≤ λ / (1 − μ) · socialCost C o` for every profile `o`: by the equilibrium
condition, `socialCost C a ≤ Σ_i C i (update a i (o i))`, and smoothness bounds the right side.
(Roughgarden 2015, Definition 2.1 and the argument (3)–(5) of Section 2.1.) No sign of `λ` and no
sign of the costs is assumed.

**Checks.**

- In the three-player game of the Checks of 4.2 with `a` the bad equilibrium and `o` the optimum,
  `Σ_i C i (update a i (o i)) = 15 = 5/3 · 6 + 1/3 · 15`: the smoothness inequality of 4.1 holds
  with equality there, and the bound of this section reads `15 ≤ 5/2 · 6`.
- The point is that smoothness is asked of all pairs of profiles: one player with two strategies
  of costs `0` and `1` is `(1, 0)`-smooth, but it is not `(0, 1/2)`-smooth, since at `a` the
  expensive and `o` the cheap strategy that would ask `0 ≤ 1/2` and at `a` the cheap and `o` the
  expensive one `1 ≤ 0`.

*Needs:* 1.1.

### 3.2 Coarse correlated equilibria

A coarse correlated equilibrium of the cost game `C` with tolerances `ε : N → ℝ` is a coarse
correlated equilibrium in the sense of RegretMinimizationAndEquilibria, Section 3.2, of the utility
game `fun i a ↦ −C i a`: `IsCoarseCorrelatedEq (fun i a ↦ −C i a) ν ε`, which says that `ν` is a
distribution on profiles and, for every `i` and `b : A i`,
`Σ_a ν a · C i a ≤ Σ_a ν a · C i (update a i b) + ε i`. The definition is copied verbatim into
`Suggested.lean`. Prove, for finite strategy sets:

- `expectedSocialCost_le_of_isSmooth`: if `C` is `(λ, μ)`-smooth with `μ < 1`, then every such `ν`
  has `Σ_a ν a · socialCost C a ≤ (λ · socialCost C o + Σ_i ε i) / (1 − μ)` for every profile `o`.

Route: apply the equilibrium inequality with `b = o i` for each `i` and sum, then average the
smoothness inequality against `ν`, using `ν ≥ 0` and `Σ_a ν a = 1`. (Roughgarden 2015, Theorem
3.2 for `ε = 0`, and the inequality (23) with its average (25) for the tolerance term;
Roughgarden, Lecture 14 of the 2013 notes, Theorem 4.2.)

Consequences, by RegretMinimizationAndEquilibria, Section 3.2: a correlated equilibrium with
tolerances `ε` is a coarse correlated equilibrium with the same tolerances, and the product
distribution of a mixed Nash equilibrium is a coarse correlated equilibrium with `ε = 0`; so the
bound with `ε = 0` holds for mixed Nash and for correlated equilibria. By its Section 3.3, if the
players play `T ≥ 1` rounds and player `i` has external regret at most `R i` in the utility game
`−C`, the empirical distribution of the product profiles satisfies the bound with `ε i = R i / T`.

**Checks.**

- The point mass at a pure Nash equilibrium is a coarse correlated equilibrium with `ε = 0`, and
  the theorem gives the bound of 3.1 for it.
- `μ < 1` is needed: with `μ = 1` the right side divides by `0`, which Lean reads as `0`, and one
  player with one strategy and cost `1` is `(0, 1)`-smooth (`1 ≤ 0 + 1`) while its expected social
  cost `1` exceeds `0`.
- For one player with two strategies of costs `0` and `1`, the uniform distribution is a coarse
  correlated equilibrium with `ε = 1/2` and not with `ε = 0`, and the game is `(1, 0)`-smooth; the
  bound reads `1/2 ≤ 0 + 1/2` with `o` the cheap strategy.

*Needs:* 3.1; RegretMinimizationAndEquilibria Conventions (`simplex`) and Section 3.2
(`IsCoarseCorrelatedEq`); Mathlib `Convexity.StdSimplex.range_toFun_comp_weights`.

### Examples

The one-player games of the Checks, and the three-player game of 4.2.

### Dependencies

3.1 uses 1.1; 3.2 uses 3.1, RegretMinimizationAndEquilibria (Conventions, Section 3.2) and Mathlib
`Convexity.StdSimplex.range_toFun_comp_weights`. The consequences for correlated and mixed Nash
equilibria and for no-regret play cite RegretMinimizationAndEquilibria, Sections 3.2 and 3.3.

## Layer 4: affine congestion games

### 4.1 Smoothness of affine congestion games

Prove `CongestionGame.isSmooth_of_affine`: if `resourceCost e k = α e · k + β e` with `α e ≥ 0`
and `β e ≥ 0` for every resource, the game is `(5/3, 1/3)`-smooth. No finiteness of the strategy
sets is assumed.

Route: when player `i` moves from `a i` to `o i` with the others fixed, every resource it uses
has load at most `load a e + 1`, and costs are nondecreasing, so
`Σ_i C i (update a i (o i)) ≤ Σ_e load o e · (α e (load a e + 1) + β e)`. For natural numbers
`y, z` one has `3 y (z + 1) ≤ 5 y² + z²`, so
`α y (z + 1) + β y ≤ 5/3 (α y + β) y + 1/3 (α z + β) z` when `α, β ≥ 0`; take `y = load o e`,
`z = load a e` and sum over `e`, using the social cost formula of 2.1. (Christodoulou and
Koutsoupias 2005 for the inequality; Roughgarden 2015, Example 2.5.)

**Checks.**

- The inequality `3 y (z + 1) ≤ 5 y² + z²` holds for all natural numbers `y, z < 60`, with
  equality exactly at `(0, 0)`, `(1, 1)` and `(1, 2)` among `y, z < 6`; it fails for real numbers:
  at `y = 1/2`, `z = 0` it reads `3/2 ≤ 5/4`.
- `β ≥ 0` is needed for smoothness: one player with strategies `∅` and `{r}`, `resourceCost r k =
  −1`, `a = ∅`, `o = {r}`: the left side is `−1` and the right side `5/3 · (−1) + 0 = −5/3`.
- On 1500 random affine congestion games with nonnegative rational coefficients, the smoothness
  inequality held for every pair of profiles.

*Needs:* 2.1, 3.1.

### 4.2 The bound `5/2`

Prove, for resource costs `α e · k + β e` with `α e ≥ 0`, `β e ≥ 0`:

- `CongestionGame.socialCost_le_of_isPureNash_of_affine`: every pure Nash equilibrium `a` has
  `socialCost a ≤ 5/2 · socialCost o` for every profile `o`;
- `CongestionGame.expectedSocialCost_le_of_affine`: with finite strategy sets, every coarse
  correlated equilibrium `ν` with `ε = 0` has `Σ_a ν a · socialCost a ≤ 5/2 · socialCost o` for
  every profile `o`.

Both follow from 4.1 with 3.1 and 3.2, since `(5/3) / (1 − 1/3) = 5/2`. (Awerbuch, Azar and
Epstein 2005 and Christodoulou and Koutsoupias 2005 for pure equilibria; Roughgarden, Lecture 12
of the 2013 notes, Theorem 2.1; Roughgarden 2015, Example 2.5 with Theorem 3.2 for coarse
correlated equilibria.) By 3.2 the bound holds for mixed Nash and correlated equilibria.

**Checks.**

- The constant `5/2` is attained. Three players `i = 0, 1, 2` (indices mod 3) and six resources
  `h₀, h₁, h₂, g₀, g₁, g₂`, each with cost `k` at load `k`. Player `i` has the strategies
  `{hᵢ, gᵢ}` and `{hᵢ₊₁, hᵢ₊₂, gᵢ₊₁}`. With everyone on the first strategy every load is `1` and
  the social cost is `6`, the least possible. With everyone on the second, each `h` has load `2`
  and each `g` load `1`, so each player pays `5` and the social cost is `15 = 5/2 · 6`; a player
  who switches to its first strategy meets loads `3` and `2` and pays `5` again, so this profile
  is a pure Nash equilibrium. These two profiles are the only pure equilibria.
- `β ≥ 0` is needed: one player with the single strategy `{r}` and `resourceCost r k = −1` has
  social cost `−1` at its only profile, which is a pure equilibrium, and `−1 > 5/2 · (−1)`.
- `α ≥ 0` is needed: two players, each using exactly one of two resources `r` with cost `4 − 2k`
  and `v` with cost `k`. Both on `v` is a pure equilibrium (each pays `2`, and moving to `r` alone
  costs `2`) with social cost `4`, while both on `r` has social cost `0`.
- On 1500 random affine games with nonnegative coefficients every pure equilibrium satisfied the
  bound; the largest ratio met was `9/7`.

*Needs:* 2.1, 3.1, 3.2, 4.1.

### Examples

The three-player game attaining `5/2`, and the games of the Checks for the sign conditions.

### Dependencies

4.1 uses 2.1 and 3.1; 4.2 uses 2.1, 3.1, 3.2 and 4.1.

## Layer 5: nonatomic congestion games

### 5.1 Flows, latencies and Wardrop equilibria

Define `NonatomicGame K E P`: for each commodity `k` and route `p : P k` a set of resources
`uses k p : Finset E`, a demand `demand k : ℝ`, and a latency `latency e : ℝ → ℝ` for each
resource. For a flow `f : ∀ k, P k → ℝ` define:

- `NonatomicGame.IsFeasible G f`: `f k p ≥ 0` for all `k, p`, and `Σ_p f k p = demand k` for
  every `k`;
- `NonatomicGame.load G f e = Σ_k Σ_{p : e ∈ uses k p} f k p`;
- `NonatomicGame.routeLatency G f k p = Σ_{e ∈ uses k p} latency e (load f e)`;
- `NonatomicGame.IsWardrop G f`: `f` is feasible and `routeLatency f k p ≤ routeLatency f k q`
  whenever `f k p > 0`;
- Beckmann's potential `NonatomicGame.beckmann G f = Σ_e ∫_0^{load f e} latency e`, an interval
  integral;
- the total latency `NonatomicGame.totalLatency G f = Σ_e load f e · latency e (load f e)`.

Prove:

- the total latency equals `Σ_k Σ_p f k p · routeLatency f k p`;
- at a Wardrop equilibrium all used routes of commodity `k` have one latency `L k`, the least
  route latency of `k`, and the total latency is `Σ_k demand k · L k` (over the commodities with
  positive demand);
- the variational inequality: if `f` is a Wardrop equilibrium and `g` is feasible, then
  `Σ_e latency e (load f e) · (load g e − load f e) ≥ 0`. No hypothesis on the latencies is
  needed.

(Roughgarden 2002, Proposition 2.2.2 and Proposition 2.2.4; Roughgarden, Lecture 11 of the 2013
notes, Section 4 and the inequality (5) of Section 5; Wardrop 1952 for the principle.)

**Checks.**

- Pigou's network: one commodity of demand `1`, two routes, each a single resource, with latencies
  `1` and `x`. Among the flows `(t, 1 − t)` the only Wardrop equilibrium is `(0, 1)`, with total
  latency `1`; the flow `(1/2, 1/2)` has total latency `3/4`, the least.
- Braess's network: resources `sv` with latency `x`, `sw` with `1`, `vt` with `1`, `wt` with `x`,
  and `vw` with `0`; one commodity of demand `1` with routes `{sv, vt}`, `{sw, wt}` and
  `{sv, vw, wt}`. The only Wardrop equilibrium sends everything along the third route, with total
  latency `2`; without the resource `vw` the equilibrium splits evenly with total latency `3/2`.
- A commodity with no route and positive demand has no feasible flow; a commodity of demand `0`
  forces its flow to be `0`.

*Needs:* Mathlib `Finset.sum_comm`.

### 5.2 Beckmann's potential

Prove:

- `NonatomicGame.isWardrop_of_isMinOn`: if every latency is continuous on `[0, ∞)`, a feasible
  flow that minimizes `beckmann` over the feasible flows is a Wardrop equilibrium;
- `NonatomicGame.isMinOn_of_isWardrop`: if every latency is nondecreasing on `[0, ∞)`, every
  Wardrop equilibrium minimizes `beckmann` over the feasible flows;
- `NonatomicGame.exists_isWardrop`: if some flow is feasible and every latency is continuous on
  `[0, ∞)`, a Wardrop equilibrium exists.

Route: for the first statement, move an amount `δ` of commodity `k` from a used route `p` to a
route `q`; the right derivative of `beckmann` at `δ = 0` is
`routeLatency f k q − routeLatency f k p` by the fundamental theorem of calculus (the loads that
decrease are positive, and the latencies are continuous from the right at the loads that
increase), and it is nonnegative at a minimizer. For the second, a nondecreasing latency makes
`x ↦ ∫_0^x latency e` lie, on `[0, ∞)`, above the line through its value at `x ≥ 0` with slope
`latency e x` (compare the integral over the interval between `x` and `y` with `latency e x`
times its length), so
`beckmann g − beckmann f ≥ Σ_e latency e (load f e) · (load g e − load f e) ≥ 0` by the
variational inequality of 5.1. For the third, the feasible flows form a nonempty compact set
(closed and bounded in a finite-dimensional space) on which `beckmann` is continuous, so it has a
minimizer, and the first statement applies. (Beckmann, McGuire and Winsten 1956; Roughgarden 2002,
Proposition 2.5.1, whose proof uses both continuity and monotonicity for both directions;
Roughgarden, Lecture 13 of the 2013 notes, Section 2. The separation of the hypotheses is proved
here.)

**Checks.**

- Continuity is needed for existence and for the first statement. Pigou's network with the latency
  `x` replaced by `x` for `x < 1` and `2` for `x ≥ 1` (nondecreasing) has no Wardrop equilibrium:
  if the second route carries less than `1` the first is used and costs more, and if it carries
  `1` it costs `2 > 1`. Its Beckmann potential at the flow with `t` on the second route is
  `1 − t + t²/2` for `0 ≤ t ≤ 1` (the value of the latency at `1` does not change the integral),
  so it is minimized at `t = 1`, which is not an equilibrium
  (Roughgarden 2002, Proposition B.1.1, shows that this network has no equilibrium in the sense
  of its Definition 2.2.1, a notion that every Wardrop equilibrium satisfies when the latencies
  are nondecreasing).
- Monotonicity is needed for the second statement. Pigou's network with latencies `1` and
  `2 − 2x`: the flows `(1, 0)`, `(1/2, 1/2)` and `(0, 1)` are Wardrop equilibria, with Beckmann
  potentials `1`, `5/4` and `1`; the middle one is not a minimizer.

*Needs:* 5.1; Mathlib `intervalIntegral.integral_hasDerivWithinAt_right`,
`MonotoneOn.intervalIntegrable`, `intervalIntegral.integral_mono_on`,
`intervalIntegral.integral_interval_sub_left`, `intervalIntegral.continuousOn_primitive_interval`,
`IsCompact.exists_isMinOn`, `Metric.isCompact_of_isClosed_isBounded`.

### 5.3 Uniqueness of the latencies

Prove `NonatomicGame.latency_load_eq_of_isWardrop`: if every latency is nondecreasing on
`[0, ∞)`, any two Wardrop equilibria `f` and `g` have
`latency e (load f e) = latency e (load g e)` for every resource `e`. Consequently all Wardrop
equilibria have the same route latencies and the same total latency, and if every latency is
strictly increasing on `[0, ∞)`, they have the same loads.

Route: write `x_e = load f e` and `y_e = load g e`. Adding the variational inequality of 5.1 for
`f` against `g` to the one for `g` against `f` gives
`Σ_e (latency e y_e − latency e x_e) · (y_e − x_e) ≤ 0`. Each term is nonnegative because the
latency is nondecreasing on `[0, ∞)` and loads of feasible flows are nonnegative, so every term
is `0`, and `latency e x_e = latency e y_e` whenever `x_e ≠ y_e`.
(Roughgarden 2002, Proposition 2.5.1, Remark 2.5.2 (a) and (b) and Corollary 2.5.3, for continuous
nondecreasing latencies, by convexity of Beckmann's potential; the statement without continuity
and this route are proved here.)

**Checks.**

- Strict monotonicity is needed for equal loads: with two parallel routes of latency `1`, every
  feasible flow is a Wardrop equilibrium.
- Monotonicity is needed: in the network of the last Check of 5.2 the three equilibria give the
  second resource the latencies `2`, `1` and `0`, and total latencies `1`, `1` and `0`.
- Continuity is not needed. Roughgarden 2002, Proposition B.1.2 (the example behind the failure
  of uniqueness without continuity in its Remark 2.5.2 (c)), gives two flows with different
  costs in a network with discontinuous latencies; they are equilibria in the sense of its
  Definition 2.2.1 but not Wardrop equilibria. With latencies `0` on `[0, 1/3]` and `1` above, and
  `1/2` on `[0, 1/3]` and `1` above, the flow `(1/3, 2/3)` uses the second route at latency `1`
  while the first has latency `0`, and the flow `(2/3, 1/3)` uses the first at latency `1` while
  the second has latency `1/2`.
- On 3000 random networks of two or three resources with nondecreasing step latencies, every pair
  of Wardrop equilibria among the flows with coordinates in `(1/12)ℤ` gave every resource the same
  latency.

*Needs:* 5.1.

### 5.4 The bound `4/3`

Prove `NonatomicGame.totalLatency_le_of_affine`: if `latency e x = α e · x + β e` with `α e ≥ 0`
and `β e ≥ 0`, every Wardrop equilibrium `f` and every feasible flow `g` satisfy
`totalLatency f ≤ 4/3 · totalLatency g`.

Route: write `x = load f e`, `y = load g e`. Since `α (x y − y² − x²/4) ≤ 0` and `β x ≥ 0`,
`latency e x · y ≤ latency e y · y + x · latency e x / 4`; summing over `e` and using the
variational inequality of 5.1 gives `totalLatency f ≤ totalLatency g + totalLatency f / 4`.
(Roughgarden and Tardos 2002; Roughgarden 2002, Theorem 3.2.6; Roughgarden, Lecture 11 of the
2013 notes, Theorem 3.3 and its proof in Section 5.)

**Checks.**

- Pigou's network attains `4/3`: total latencies `1` at the equilibrium and `3/4` at the flow
  `(1/2, 1/2)`. Braess's network attains it too: `2` against `3/2`.
- `β ≥ 0` is needed: one route through one resource of latency `−1` and demand `1` has total
  latency `−1` at its only flow, and `−1 > 4/3 · (−1)`.
- `α ≥ 0` is needed: Pigou's network with latencies `1` and `2 − 2x` has the Wardrop equilibrium
  `(1/2, 1/2)` with total latency `1`, while the flow `(0, 1)` has total latency `0`.
- On 400 random affine networks with one or two commodities and nonnegative integer coefficients,
  the bound held between every Wardrop equilibrium and every feasible flow with coordinates in
  `(1/6)ℤ`, and between the numerical minimizers of `beckmann` and of the total latency.

*Needs:* 5.1.

### Examples

Pigou's network, its variants with a step latency and with the decreasing latency `2 − 2x`, and
Braess's network.

### Dependencies

5.1 uses Mathlib `Finset.sum_comm`; 5.2 uses 5.1 and the Mathlib interval-integral and compactness
declarations listed there; 5.3 and 5.4 use 5.1.
No other layer.

## Scope and ownership

This roadmap owns: pure Nash equilibria of cost games, exact, ordinal and generalized ordinal
potentials, improvement paths and the finite improvement property, and the characterizations of
exact potential games by closed paths, four-cycles and the coordination–dummy decomposition;
atomic congestion games and Rosenthal's theorem; smoothness and the extension of smoothness bounds
to coarse correlated equilibria; the smoothness of affine congestion games and the bound `5/2`;
nonatomic congestion games, Wardrop equilibria, Beckmann's potential, existence and uniqueness of
equilibrium latencies, and the bound `4/3`.

At the pins, neither Mathlib nor Tau Ceti has strategic games in cost form, potentials,
congestion games or Wardrop equilibria; the nearest material is Sion's minimax theorem in Mathlib
(`Topology/Sion.lean`) and the Ehrenfeucht–Fraïssé games of Tau Ceti's model theory
(`ModelTheory/BackAndForth/Game`), neither of which is used here.

Used from other roadmaps, and not restated:

- RegretMinimizationAndEquilibria owns finite games in utility form, mixed Nash equilibria and
  their existence (its 3.1), correlated and coarse correlated equilibria with the facts that
  correlated equilibria are coarse correlated and that product distributions of mixed Nash
  equilibria are correlated equilibria (its 3.2), and the passage from no-regret play to
  approximate equilibria (its 3.3). This roadmap applies its notions to the utility game `−C`;
  its `simplex` and `IsCoarseCorrelatedEq` are copied verbatim into `Suggested.lean`. That roadmap
  lists potential and congestion games as outside its scope.

Neighbouring subjects that this roadmap does not touch:

- GraphConnectivityAndFlows owns flows on networks with conservation at the vertices, their
  decomposition into paths and cycles, and max-flow/min-cut. Flows here are given on routes, as
  amounts per route, and no decomposition, conservation law or cut is used.
- The roadmaps CooperativeGames (games in coalitional form) and PopulationDynamics (whose scope
  excludes the replicator equation and evolutionary stability), open roadmaps not on main, have no
  statement in common with this one, and this roadmap does not depend on either.
- MathematicalStatisticsFoundations 7.2 treats statistical games and their minimax theorem, a
  different object.

Outside the scope: weighted potential games and weighted congestion games; the converse of
Rosenthal's theorem (every finite exact potential game is isomorphic to a congestion game);
mixed strategies in potential games; best-response, better-response and no-regret dynamics as
procedures, and their convergence rates; the price of anarchy for polynomial latencies and the
Pigou bound for general latency classes; the tightness of smoothness bounds (Roughgarden's
completeness theorem for congestion games); approximate equilibria with multiplicative
tolerances; the price of stability; network formation and cost-sharing games; mechanism design,
auctions, social choice and fair division; and the computational complexity of equilibria.

## Exact supplier contracts

### From Mathlib

- `Mathlib/Logic/Function/Basic.lean`: `Function.update` (`Function.update a i b` agrees with `a`
  except at `i`, where it is `b`; needs `[DecidableEq N]`).
- `Mathlib/Data/Fintype/Lattice.lean`: `Finite.exists_min` (a function on a nonempty finite
  type to a linear order attains its minimum).
- `Mathlib/Data/Fintype/Card.lean`: `Finite.wellFounded_of_trans_of_irrefl` (a transitive
  irreflexive relation on a finite type is well founded).
- Core `List.foldl`; `Finset.Icc`, `Finset.card`, `Finset.sum_comm`.
- `Mathlib/Geometry/Convex/ConvexSpace/Defs.lean`: `Convexity.StdSimplex` and
  `Convexity.StdSimplex.range_toFun_comp_weights` (for a finite type, the weight vectors are the
  nonnegative vectors of sum `1`).
- `Mathlib/MeasureTheory/Integral/IntervalIntegral/FundThmCalculus.lean`:
  `intervalIntegral.integral_hasDerivWithinAt_right` (for `f` interval integrable on `[a, b]`,
  strongly measurable at the filter and continuous within `t` at `b`, the primitive
  `u ↦ ∫_a^u f` has derivative `f b` within `s` at `b`, for the admissible pairs of filters).
  `Mathlib/MeasureTheory/Integral/DominatedConvergence.lean`:
  `intervalIntegral.continuousOn_primitive_interval` (the primitive of a function integrable on
  `[a, b]` is continuous there). `Mathlib/MeasureTheory/Integral/IntervalIntegral/Basic.lean`:
  `intervalIntegral.integral_interval_sub_left`
  (`∫_a^b f − ∫_a^c f = ∫_c^b f` for `f` interval integrable on `[a, b]` and `[a, c]`);
  `intervalIntegral.integral_mono_on` (for `a ≤ b` and `f ≤ g` on `[a, b]`, both interval
  integrable, `∫_a^b f ≤ ∫_a^b g`).
  `MonotoneOn.intervalIntegrable` (a function monotone on `[a, b]` is interval integrable there).
- `Mathlib/Topology/Order/Compact.lean`: `IsCompact.exists_isMinOn` (a function continuous on a
  nonempty compact set attains its minimum there); `Mathlib/Topology/MetricSpace/Bounded.lean`:
  `Metric.isCompact_of_isClosed_isBounded` (in a proper space a closed bounded
  set is compact).
- `IsMinOn`, `ContinuousOn`, `MonotoneOn`, `Set.Ici` with their standard meanings.

### From TauCetiRoadmap.RegretMinimizationAndEquilibria

- Conventions: `simplex ι`, the weight vectors of `Convexity.StdSimplex ℝ ι`; copied verbatim.
- Section 3.2: `IsCoarseCorrelatedEq u μ ε` (`μ ∈ simplex (∀ i, A i)` and, for every `i` and
  `b : A i`, `Σ_a μ a · u i (update a i b) ≤ Σ_a μ a · u i a + ε i`), copied verbatim; and its
  statements that a correlated equilibrium is a coarse correlated equilibrium with the same
  tolerances and that the product distribution of a mixed profile `σ` is a correlated equilibrium
  with `ε = 0` exactly when `σ` is a Nash equilibrium (`IsNash`, its 3.1).
- Section 3.3: its first theorem, that the empirical distribution of `T ≥ 1` rounds of
  play in which player `i` has external regret at most `R i` is a coarse correlated equilibrium
  with tolerances `R i / T`.

## References

- T. Roughgarden, *Intrinsic robustness of the price of anarchy*, Journal of the ACM 62 (2015),
  no. 5, article 32. Read in the author's version of 14 July 2015 on `timroughgarden.org`
  (`papers/robust.pdf`): Definition 2.1 and the argument (3)–(5) in Section 2.1, Example 2.5,
  the definition (15) of coarse correlated equilibria in Section 3.1, Theorem 3.2, the
  inequalities (23) and (25) in Section 3.2, and Example 4.11.
- T. Roughgarden, *Selfish Routing*, PhD thesis, Cornell University, 2002, on `timroughgarden.org`
  (`papers/thesis.pdf`): Definition 2.2.1, Propositions 2.2.2, 2.2.4 and 2.5.1, Remark 2.5.2,
  Corollary 2.5.3, Theorem 3.2.6 and Propositions B.1.1 and B.1.2 of Appendix B.
- T. Roughgarden, *CS364A: Algorithmic Game Theory*, lecture notes, Stanford University, Fall
  2013, on `timroughgarden.org` (`f13/l/l11.pdf` to `l14.pdf`): Lecture 11, Sections 2 to 5 and
  Theorem 3.3; Lecture 12, Section 2 and Theorem 2.1; Lecture 13, Theorem 1.1 and Section 2;
  Lecture 14, Definition 3.1 and Theorem 4.2.
- The papers of Wardrop (1952), Beckmann, McGuire and Winsten (1956), Rosenthal (1973), Monderer
  and Shapley (1996), Roughgarden and Tardos (2002), Awerbuch, Azar and Epstein (2005) and
  Christodoulou and Koutsoupias (2005) are attributed as the sources above attribute them; they
  were not consulted, and no locator is given for them. The results of Monderer and Shapley in
  Layer 1 carry no locator and are proved in the layers above.
