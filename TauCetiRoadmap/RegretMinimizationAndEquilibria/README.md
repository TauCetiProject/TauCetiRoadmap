# Roadmap: regret minimization and equilibria in games

**Summary.** Develop the theory of no-regret learning over finite action sets and its consequences
for equilibria of finite games. It starts with the online protocol over the probability simplex
and proves the regret bounds of the exponential-weights method (Hedge), regret matching and
regret matching+. It proves Blackwell's approachability theorem for closed convex sets, with an
explicit rate. For two-player zero-sum matrix games it spells out von Neumann's minimax theorem
and proves that average strategies of no-regret self-play are approximate equilibria. For general
finite games it proves the existence of Nash equilibria and that no-external-regret and
no-swap-regret dynamics converge to coarse correlated and correlated equilibria, the latter
through the Blum–Mansour reduction. It ends with sequential decision processes in sequence form,
the laminar regret decomposition behind counterfactual regret minimization (CFR), the CFR regret
bound, and CFR self-play in two-player zero-sum games in sequence form, with Kuhn poker as the
running example.

## Scope and ownership

This roadmap owns:

- the full-information online protocol over a finite simplex, external regret and swap regret;
- Hedge, regret matching and regret matching+, with their regret bounds;
- Blackwell approachability for closed convex sets, with the rate `D/√T`, and its converse;
- the matrix-game form of von Neumann's minimax theorem, and the approximate-equilibrium
  guarantee of no-regret self-play;
- finite normal-form games: mixed Nash equilibria and their existence, correlated and coarse
  correlated equilibria, and the convergence of no-regret dynamics to them;
- the Blum–Mansour swap-regret reduction;
- tree-form sequential decision processes, their sequence-form strategy polytopes, behavioral
  strategies, best responses, counterfactual values, the laminar regret decomposition, CFR, and
  CFR self-play in two-player zero-sum sequence-form games.

It consumes, and does not re-prove, the items listed under
[Exact supplier contracts](#exact-supplier-contracts).

Out of scope:

- Sion's minimax theorem, which is Mathlib's, and Brouwer's fixed-point theorem, which is Tau
  Ceti's;
- stationary distributions of stochastic matrices, which belong to
  [MarkovChainsAndRenewal](../MarkovChainsAndRenewal/README.md);
- the minimax theorem for statistical decision problems, which belongs to
  [MathematicalStatisticsFoundations](../MathematicalStatisticsFoundations/README.md) 7.2;
- extensive-form games presented as game trees with chance nodes and information partitions, and
  their translation into sequence form; sequential games here are given in sequence form directly;
- bandit feedback, sampled and Monte Carlo CFR, neural approximations such as Deep CFR, and
  CFR+'s alternating updates and weighted averaging;
- online convex optimization over general convex sets, online mirror descent and optimistic
  methods;
- equilibrium refinements (perfect, proper, sequential), potential and congestion games,
  evolutionary dynamics, mechanism design, and the computational complexity of equilibria;
- first-order methods for smooth optimization, including the regret computation for Adam, which
  belong to [FirstOrderOptimization](../FirstOrderOptimization/README.md) (its 6.4); that roadmap
  in turn excludes online-learning regret bounds and mirror descent, so the two do not overlap.

## Conventions

- **Actions.** Action sets are finite and nonempty: `[Fintype ι] [Nonempty ι] [DecidableEq ι]`,
  with `n = Fintype.card ι`.
- **The simplex.** `simplex ι = Set.range (fun p : Convexity.StdSimplex ℝ ι ↦ ⇑p.weights)`, the
  weight vectors of Mathlib's `Convexity.StdSimplex`, which replaced the deprecated set
  `stdSimplex`; `Convexity.StdSimplex.range_toFun_comp_weights` identifies it with the
  nonnegative vectors of sum `1`. Mixed strategies are its points. For `p, u : ι → ℝ`,
  `⟨p, u⟩ = p ⬝ᵥ u` (`dotProduct`). The uniform strategy is `fun _ ↦ 1/n`.
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
- **Matrix games.** `M : Matrix ι κ ℝ` and `Matrix.payoff M x y = x ⬝ᵥ (M *ᵥ y)`, in the shape of
  Mathlib PR [#39393](https://github.com/leanprover-community/mathlib4/pull/39393), with index types
  generalized from `Fin m` and `simplex` in place of the deprecated `stdSimplex` that PR uses. As
  there, `Matrix.exists_saddle_point` is in Mathlib's `IsSaddlePointOn` orientation (the row
  strategy minimizes), and `Matrix.exists_mixedNash` is the textbook orientation (the row player
  maximizes `payoff M`).
- **Finite games.** Players `N` with `[Fintype N] [DecidableEq N]`, actions `A i` finite and
  nonempty, utilities `u : N → (∀ i, A i) → ℝ`. A mixed profile is `σ : ∀ i, A i → ℝ` with
  `σ i ∈ simplex (A i)`, and `expectedUtility u σ i = Σ_a (Π_j σ j (a j)) u i a`, written `U i σ`.
  A deviation of player `i` to `τ` is `Function.update σ i τ`. Correlated distributions are points
  of `simplex (∀ i, A i)`. Equilibrium tolerances are per player, `ε : N → ℝ`.
- **Sequential decision processes** are specified in 4.1; their counterfactual-value ranges are
  written `w j`.

## Exact supplier contracts

- Mathlib:
  - `Convexity.StdSimplex`, `Convexity.StdSimplex.range_toFun_comp_weights`
    (`Geometry/Convex/ConvexSpace/Defs.lean`), and the compactness of `simplex ι` from
    `Convexity.StdSimplex.isClosedEmbedding_toFun_comp_weights`
    (`Geometry/Convex/ConvexSpace/Topology.lean`) with the `CompactSpace` instance of
    `Convexity.StdSimplex` (`Geometry/Convex/ConvexSpace/CompactSpaceStdSimplex.lean`);
  - `IsSaddlePointOn` (`Order/SaddlePoint.lean`) and Sion's theorem for real-valued functions,
    `Sion.exists_isSaddlePointOn` (`Topology/Sion.lean`);
  - Hoeffding's lemma `ProbabilityTheory.hasSubgaussianMGF_of_mem_Icc`
    (`Probability/Moments/SubGaussian.lean`), applied to a distribution on a finite set;
  - `Matrix.rowStochastic` (`LinearAlgebra/Matrix/Stochastic.lean`);
  - `Metric.infDist`, `Metric.diam`, `convexHull_diam`, and the projection onto a closed convex
    set in a finite-dimensional inner product space through
    `exists_norm_eq_iInf_of_complete_convex` and `norm_eq_iInf_iff_real_inner_le_zero`.
- Tau Ceti:
  - `Convexity.StdSimplex.convex_range_toFun_comp_weights`
    (`TauCeti/Analysis/Convex/StdSimplex.lean`), the convexity of `simplex ι`;
  - `TauCeti.brouwerFixedPoint_compactConvex_continuousOn`
    (`TauCeti/AlgebraicTopology/Singular/BrouwerFixedPoint.lean`): a continuous self-map of a
    nonempty compact convex subset of a finite-dimensional real normed space has a fixed point.
- [MarkovChainsAndRenewal](../MarkovChainsAndRenewal/README.md): the existence of a stationary
  distribution of a finite row-stochastic matrix, in the form of Mathlib PR
  [#34713](https://github.com/leanprover-community/mathlib4/pull/34713):
  `Matrix.rowStochastic.exists_stationary_distribution`, `∃ μ, μ ∈ simplex n ∧ IsStationary μ M`
  with `IsStationary μ M ↔ μ ᵥ* M = μ`.

## Coordination

- Mathlib PR [#39393](https://github.com/leanprover-community/mathlib4/pull/39393) proves
  `Matrix.exists_saddle_point` and `Matrix.exists_mixedNash` for `Fin m × Fin n` matrix games from
  Sion's theorem; 2.1 takes its names, statements and orientation.
- Mathlib PR [#34713](https://github.com/leanprover-community/mathlib4/pull/34713), which
  [MarkovChainsAndRenewal](../MarkovChainsAndRenewal/README.md) follows, supplies the stationary
  distributions used in 3.4. The targets here state stationarity as `p ᵥ* Q = p` directly; a root
  `IsStationary` already exists in Mathlib for sets of ordinals, so the PR's name will need a
  namespace when it lands.

## How to read the build

Each layer opens with its definitions. Each numbered target ends with a **Checks** list of tests
that a wrong convention or constant would fail, and a *Needs:* line naming the targets and
suppliers it uses. Every claim carries a source locator in parentheses, or says that it is proved
here. `Suggested.lean` states the definitions and headline theorems named in this README against
the pinned APIs.

## Layer 1: online learning over the simplex

### 1.1 Regret

Define `simplex`, `HasRange`, `OnlineAlgorithm`, `OnlineAlgorithm.play`, `regret` and
`swapRegret` as in [Conventions](#conventions). Prove, when every `p t` lies in `simplex ι`:

- the regret against a mixed comparator `q ∈ simplex ι`, `Σ_{t<T} (⟨q, u t⟩ − ⟨p t, u t⟩)`,
  equals `Σ_a q a · regret p u T a`, so its maximum over the simplex is the external regret
  (`sum_sub_eq_sum_mul_regret`);
- the external regret is at most the swap regret, and both are `0` at `T = 0`
  (`regret_le_swapRegret`);
- if `u` has range `Δ`, the instantaneous regret `r t a = u t a − ⟨p t, u t⟩` satisfies
  `|r t a| ≤ Δ` (`abs_instRegret_le`).

(Cesa-Bianchi and Lugosi 2006, Sections 2.1 and 4.4; proved here.)

**Checks.**

- `n = 1`: every regret is `0`.
- `u t = fun _ ↦ c t`: the regret of every strategy against every action is `0`.
- `ι = Fin 2`, `p t = (1, 0)`, `u t = (0, 1)`: `regret p u T 1 = T`, and the swap `φ = const 1`
  attains swap regret `T`.

*Needs:* Mathlib `Convexity.StdSimplex`, `dotProduct`.

### 1.2 Hedge

Define `hedge η`: `p t a = exp (η S a) / Σ_b exp (η S b)` with `S a = Σ_{s<t} u s a`. Prove that
for `η > 0` and every payoff sequence with range `Δ`,
`max_a regret p u T a ≤ log n / η + η Δ² T / 8` (`hedge_regret_le`), and for `n ≥ 2`, `T ≥ 1`
and `Δ > 0`, `η = √(8 log n / T) / Δ` gives `max_a regret p u T a ≤ Δ √(T log n / 2)`.

The proof bounds `log (W_{t+1}/W_t)` for `W_t = Σ_a exp (η S a)` by Hoeffding's lemma applied to
the distribution `p t`. (Freund and Schapire 1997; Cesa-Bianchi and Lugosi 2006, Theorem 2.2;
proved here.)

**Checks.**

- `n = 1`: the bound is `η Δ² T / 8 ≥ 0`, and the regret is `0`.
- `T = 0`: the first bound reads `0 ≤ log n / η`.
- `u t = (1, 0)` for all `t`, `n = 2`, `Δ = 1`: the regret against action `0` is
  `Σ_t p t 1 ≤ log 2/η + η T/8`, and `p t 1 = 1/(1 + exp (η t))` decays geometrically.

*Needs:* 1.1; Mathlib `ProbabilityTheory.hasSubgaussianMGF_of_mem_Icc`.

### 1.3 Regret matching

Define `rmStrategy R = R⁺ / Σ_a (R a)⁺` if `Σ_a (R a)⁺ > 0` and the uniform strategy otherwise,
and the cumulative regret `rmRegret u`: `R 0 = 0`, `R (t+1) = R t + r t` with
`p t = rmStrategy (R t)`. Prove:

- `Σ_a ((R T a)⁺)² ≤ Σ_{t<T} Σ_a (r t a)²` (`regretMatching_sum_sq_pos_le`);
- for `u` with range `Δ`: `max_a regret p u T a ≤ Δ √(n T)` (`regretMatching_regret_le`);
- with time-varying ranges `Δ t`: `max_a regret p u T a ≤ √(n Σ_{t<T} (Δ t)²)`
  (`regretMatching_regret_le_of_ranges`).

The key identity is `⟨(R t)⁺, r t⟩ = 0`, since `p t` is proportional to `(R t)⁺`.
(Hart and Mas-Colell 2001, for unconditional regret matching; the bound is proved here.)

**Checks.**

- `n = 1`: `R t = 0` and both sides are `0`.
- `n = 2`, `u t = (1, 0)` for all `t`, `Δ = 1`: `p 0` is uniform, `R 1 = (1/2, −1/2)`, `p t = (1, 0)`
  for `t ≥ 1`, and the regret is `1/2 ≤ √(2T)`.
- `n = 2`, `u 0 = (1, 0)`, `u 1 = (0, 1)`: `p 1 = (1, 0)`, `r 1 = (0, 1)` and `R 2 = (1/2, 1/2)`.

*Needs:* 1.1.

### 1.4 Regret matching+

Define `rmPlusState u`: `Q 0 = 0`, `Q (t+1) = (Q t + r t)⁺` with `p t = rmStrategy (Q t)`. Prove
`regret p u T a ≤ Q T a` for every `a`, `Σ_a (Q T a)² ≤ Σ_{t<T} Σ_a (r t a)²`, and so
`max_a regret p u T a ≤ Δ √(n T)` (`regretMatchingPlus_regret_le`).

(Tammelin 2014, for the procedure; the bound is proved here.)

**Checks.**

- `Q t ≥ 0` coordinatewise.
- `n = 2`, `u t = (1, 0)`: `Q 1 = (1/2, 0)`, `p t = (1, 0)` for `t ≥ 1`, and `Q T = (1/2, 0)`.
- `n = 2`, `u 0 = (1, 0)`, `u 1 = (0, 1)`: `Q 2 = (1/2, 1)`, while regret matching on the same
  payoffs has `R 2 = (1/2, 1/2)` (1.3), so the two methods differ from the third step on.

*Needs:* 1.1, 1.3.

### 1.5 Blackwell approachability

Let `E` be a finite-dimensional real inner product space, `κ` finite and nonempty,
`r : ι → κ → E` a vector payoff with mixed extension `r̄ p q = Σ_i Σ_j p i q j • r i j`, `S ⊆ E`
nonempty, closed and convex, and `D = Metric.diam (Set.range fun ij : ι × κ ↦ r ij.1 ij.2)`. Call
`S` **response-satisfiable** if for every `q ∈ simplex κ` there is `p ∈ simplex ι` with
`r̄ p q ∈ S`. Prove:

- **the halfspace step:** for every `g ∈ E` with projection `π` onto `S`, if `S` is
  response-satisfiable there is `p ∈ simplex ι` with `⟨g − π, r̄ p q − π⟩ ≤ 0` for all
  `q ∈ simplex κ`, from response-satisfiability and Sion's theorem applied to the bilinear
  function `(p, q) ↦ ⟨g − π, r̄ p q − π⟩` on `simplex ι × simplex κ`;
- **approachability** (`blackwell_approachability`): if `S` is response-satisfiable, there is a
  strategy `σ : (t : ℕ) → (Fin t → κ → ℝ) → (ι → ℝ)` with values in `simplex ι` such that for
  every sequence `q : ℕ → κ → ℝ` in `simplex κ` and every `T ≥ 1`,
  `Metric.infDist ((1/T) Σ_{t<T} r̄ (p t) (q t)) S ≤ D / √T`, where `p t = σ t (fun s ↦ q s)`. The
  strategy plays any point of the simplex at `t = 0`, and at `t ≥ 1` the halfspace step at the
  average payoff `g = (1/t) Σ_{s<t} r̄ (p s) (q s)`;
- **the converse:** if `S` is not response-satisfiable, there are `q₀ ∈ simplex κ` and `δ > 0`
  such that for every strategy, the constant sequence `q t = q₀` gives
  `Metric.infDist ((1/T) Σ_{t<T} r̄ (p t) q₀) S ≥ δ` for all `T ≥ 1`.

The rate comes from `T² d_T² ≤ (T − 1)² d_{T−1}² + D²` for `d_T` the distance of the average
payoff to `S`, using `‖r − π‖² ≤ ‖r − g‖² − ‖g − π‖²` when `⟨g − π, r − π⟩ ≤ 0`; all payoffs and
averages lie in `convexHull ℝ (range r)`, of diameter `D` by `convexHull_diam`, and `d₁ ≤ D`
because response-satisfiability puts a point of `S` in that hull. (Blackwell 1956; the rate `D/√T`
is proved here.)

**Checks.**

- `E = ℝ`, `S = (−∞, 0]`, `r i j = M i j`: response-satisfiability says
  `max_q min_p payoff M p q ≤ 0`, which by 2.1 is `min_p max_q payoff M p q ≤ 0`: the row player,
  now minimizing, holds the payoff at most `0`. For `M = [[1], [−1]]` (one column) this holds with
  `p = (0, 1)`, although the textbook value of `M` for a maximizing row player is `1`.
- If `S` contains the range of `r`, every strategy approaches `S`, and the distance is `0`.
- Regret matching (1.3) is the halfspace strategy for `E = ι → ℝ`, `S` the nonpositive orthant,
  `κ` the finite set `ι → Fin 2` of `{0, 1}`-valued payoff vectors, and
  `r i v = (v a − v i)_a`: the projection of `g` is `min g 0` and `g − π = g⁺`.

*Needs:* Mathlib `Sion.exists_isSaddlePointOn`, `Convexity.StdSimplex.isClosedEmbedding_toFun_comp_weights`,
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
- `Matrix.iSup_iInf_payoff_eq`: `⨆ x ∈ simplex ι, ⨅ y ∈ simplex κ, payoff M x y =
  ⨅ y ∈ simplex κ, ⨆ x ∈ simplex ι, payoff M x y`, and this common value is `payoff M a b` for
  every pair of `Matrix.exists_mixedNash`.

(von Neumann 1928; this is `Sion.exists_isSaddlePointOn` for the bilinear payoff on the compact
convex simplices; proved here.)

**Checks.**

- Matching pennies `M = [[1, −1], [−1, 1]]`: the unique equilibrium is `(1/2, 1/2)` for both
  players, and the value is `0`.
- Rock-paper-scissors: uniform strategies, value `0`.
- `M = [[2, 0], [0, 1]]`: in `Matrix.exists_mixedNash`, `a = b = (1/3, 2/3)` and the value is
  `2/3`; in `Matrix.exists_saddle_point` the minimizing row strategy is `(1/3, 2/3)` as well and
  the maximizing column strategy is `(1/3, 2/3)`.

*Needs:* Mathlib `Sion.exists_isSaddlePointOn`, `IsSaddlePointOn`,
`Convexity.StdSimplex.isClosedEmbedding_toFun_comp_weights`; Tau Ceti
`Convexity.StdSimplex.convex_range_toFun_comp_weights`.

### 2.2 No-regret self-play

Let the row player play `x t ∈ simplex ι` with regret at most `R₁` against `u t = M *ᵥ y t`, and
the column player play `y t ∈ simplex κ` with regret at most `R₂` against `v t = −(x t ᵥ* M)`,
both over `T ≥ 1` rounds, and let `x̄`, `ȳ` be the averages. Prove the **duality gap bound**
`payoff M x ȳ − payoff M x̄ y ≤ (R₁ + R₂)/T` for all `x`, `y` in the simplices
(`gap_le_of_regret`), so that `(x̄, ȳ)` is an `ε`-equilibrium with `ε = (R₁ + R₂)/T`, and
`payoff M x̄ ȳ` and the value are within `ε` of each other. With regret matching (or regret
matching+) for both players and entries of `M` in an interval of length `Δ`:
`ε ≤ Δ (√|ι| + √|κ|)/√T` (`regretMatching_selfPlay_gap_le`).

(Freund and Schapire 1999; Cesa-Bianchi and Lugosi 2006, Chapter 7; the constants are proved
here.)

**Checks.**

- The gap `max_x payoff M x ȳ − min_y payoff M x̄ y` is `0` exactly at a saddle point, and is
  always at least `0`.
- The bound gives a second proof of 2.1's minimax equality by letting `T → ∞`.
- Matching pennies with regret matching for both players: every payoff vector against the uniform
  strategy is `0`, so both players stay uniform, every regret is `0`, and the gap is `0`.

*Needs:* 1.1, 1.3, 1.4, 2.1.

### Examples

Matching pennies, rock-paper-scissors, and `[[2, 0], [0, 1]]`.

### Dependencies

2.1 uses Sion's theorem and the simplex suppliers; 2.2 uses 1.1, 1.3, 1.4 and 2.1.

## Layer 3: finite games and correlated equilibria

### 3.1 Nash equilibria

Define `expectedUtility` and `IsNash u σ`: `σ i ∈ simplex (A i)` for all `i`, and
`U i (Function.update σ i τ) ≤ U i σ` for all `i` and all `τ ∈ simplex (A i)`. Prove:

- it suffices to test pure deviations `τ = Pi.single a 1` (`isNash_iff_pure`);
- every action in the support of `σ i` is a best response to `σ` (support equalization);
- **existence** (`exists_isNash`): every finite game has a mixed Nash equilibrium.

Existence applies the supplier Brouwer theorem to Nash's map
`σ i a ↦ (σ i a + g i a) / (1 + Σ_b g i b)` with gains `g i a = (U i (update σ i (single a 1)) −
U i σ)⁺` on the product of simplices, a compact convex subset of the finite-dimensional space
`∀ i, A i → ℝ`. (Nash 1951; proved here.)

**Checks.**

- Matching pennies: the unique equilibrium has both players uniform.
- The battle of the sexes `u₁ = [[2, 0], [0, 1]]`, `u₂ = [[1, 0], [0, 2]]` has the three equilibria
  `((1,0),(1,0))`, `((0,1),(0,1))` and `((2/3,1/3),(1/3,2/3))`.
- For two-player zero-sum games, `IsNash` is the condition of `Matrix.exists_mixedNash`.

*Needs:* Tau Ceti `TauCeti.brouwerFixedPoint_compactConvex_continuousOn`,
`Convexity.StdSimplex.convex_range_toFun_comp_weights`; Mathlib
`Convexity.StdSimplex.isClosedEmbedding_toFun_comp_weights`.

### 3.2 Correlated and coarse correlated equilibria

For `μ ∈ simplex (∀ i, A i)` and `ε : N → ℝ`, define:

- `IsCoarseCorrelatedEq u μ ε`: for all `i` and `b : A i`,
  `Σ_a μ a u i (Function.update a i b) ≤ Σ_a μ a u i a + ε i`;
- `IsCorrelatedEq u μ ε`: for all `i` and `φ : A i → A i`,
  `Σ_a μ a u i (Function.update a i (φ (a i))) ≤ Σ_a μ a u i a + ε i`.

Prove that the product of a Nash equilibrium is a correlated equilibrium with `ε = 0`; that every
correlated equilibrium is coarse correlated with the same `ε`; that both sets are convex and
compact; and that a product distribution is a `0`-correlated equilibrium exactly when its factors
form a Nash equilibrium.

(Aumann 1974; Hannan 1957 for the coarse notion; proved here.)

**Checks.**

- Aumann's chicken game `u₁ = [[6, 2], [7, 0]]`, `u₂ = u₁ᵀ`: the uniform distribution on
  `{(C, C), (C, D), (D, C)}` is a correlated equilibrium with payoff `5` for each player, above
  the symmetric mixed Nash payoff `14/3`.
- In matching pennies the coarse correlated equilibria with `ε = 0` all give both players
  expected payoff `0`.
- Tolerances are monotone: an `ε`-equilibrium is an `ε'`-equilibrium whenever `ε ≤ ε'`.

*Needs:* 3.1.

### 3.3 Convergence of no-regret dynamics

Let each player `i` play `σ t i ∈ simplex (A i)` for `t < T`, `T ≥ 1`, and let player `i`'s
payoff sequence be `deviationPayoff u σ i t b = U i (Function.update (σ t) i (Pi.single b 1))`.
Let `empiricalDistribution σ T = (1/T) Σ_{t<T} ⊗_i σ t i`, written `μ`, be the empirical
distribution of the product profiles. Prove:

- if player `i` has external regret at most `R i`, then
  `IsCoarseCorrelatedEq u μ (fun i ↦ R i / T)` (`isCoarseCorrelatedEq_of_regret`);
- if player `i` has swap regret at most `SR i`, then
  `IsCorrelatedEq u μ (fun i ↦ SR i / T)` (`isCorrelatedEq_of_swapRegret`).

Both are identities between the regret sums and the equilibrium inequalities. (Hart and
Mas-Colell 2000, for the correlated case; Cesa-Bianchi and Lugosi 2006, Chapter 7; proved here.)

**Checks.**

- `T = 1`: `μ` is a product, and the statements read off the regret of one round.
- Regret matching self-play in rock-paper-scissors with payoffs in `[−1, 1]`: `R i ≤ 2√(3T)`, so
  `μ` is a coarse correlated equilibrium with `ε i = 2√(3/T)`; regret matching controls external
  regret only, so this gives no correlated-equilibrium bound.
- For two-player zero-sum games, the coarse correlated statement for the marginals of `μ` gives
  2.2's gap bound `(R₁ + R₂)/T`.

*Needs:* 1.1, 3.2.

### 3.4 The Blum–Mansour reduction

Given `n` online algorithms `A_b` (one per action `b`), define the master algorithm: at time `t`
form the matrix `Q t ∈ Matrix.rowStochastic ℝ ι` whose row `b` is `A_b`'s strategy, play a
stationary distribution `p t` of `Q t` (supplied by MarkovChainsAndRenewal), and feed `A_b` the
payoff vector `p t b • u t`. Prove that the swap regret of the master is at most the sum of the
external regrets of the `A_b` (`swapRegret_le_sum_regret`), and that with regret matching for every
`A_b` and `u` of range `Δ`, the swap regret is at most `Δ n √T` (`blumMansour_regretMatching_le`).

The last bound uses 1.3 with time-varying ranges `p t b Δ` and
`Σ_b √(Σ_t (p t b)²) ≤ √(n T)`. (Blum and Mansour 2007; the bound with regret-matching copies is
proved here.)

**Checks.**

- `n = 1`: `Q t = (1)`, `p t = (1)`, and every regret is `0`.
- `Q t` with all rows equal to `q`: the stationary distribution is `q`, and the master plays `q`.
- If every `A_b` has external regret `0`, the master has swap regret at most `0`.

*Needs:* 1.1, 1.3; Mathlib `Matrix.rowStochastic`; MarkovChainsAndRenewal
`Matrix.rowStochastic.exists_stationary_distribution`.

### Examples

Matching pennies, the battle of the sexes, Aumann's chicken game, and regret-matching self-play in
rock-paper-scissors.

### Dependencies

3.1 uses Tau Ceti's Brouwer theorem and the simplex suppliers; 3.2 uses 3.1; 3.3 uses 1.1 and 3.2;
3.4 uses 1.1, 1.3 and MarkovChainsAndRenewal's stationary distributions.

## Layer 4: sequential decision processes and CFR

### 4.1 Tree-form sequential decision processes

A **decision process** is given by a finite type `J` of decision points, finite nonempty action
types `A j`, and a parent map `parent : J → Option (Σ j, A j)` sending `j` to the sequence that
leads to it (`none` is the empty sequence), with a rank `ρ : J → ℕ` such that
`parent j = some ⟨j', a⟩ → ρ j' < ρ j`. The **sequences** are `Option (Σ j, A j)`. Several
decision points may share a parent; this branching is the observation step. The
**sequence-form polytope** `sequenceFormPolytope parent` is

`Q = {x : Option (Σ j, A j) → ℝ | x none = 1, x ≥ 0, ∀ j, Σ_a x (some ⟨j, a⟩) = x (parent j)}`.

A **behavioral strategy** is `b : ∀ j, A j → ℝ` with `b j ∈ simplex (A j)`, and its sequence
form is `x none = 1`, `x (some ⟨j, a⟩) = x (parent j) · b j a`. For `ℓ : Option (Σ j, A j) → ℝ`,
the **best-response values** are defined by recursion on the rank, from the leaves up:
`W ⟨j, a⟩ = ℓ (some ⟨j, a⟩) + Σ_{j' : parent j' = some ⟨j, a⟩} max_{a'} W ⟨j', a'⟩`. Prove:

- `Q` is a nonempty compact convex polytope, and the sequence form of every behavioral strategy
  lies in `Q`;
- **realization:** every `x ∈ Q` is the sequence form of a behavioral strategy, taking
  `b j a = x (some ⟨j, a⟩)/x (parent j)` where the denominator is positive (Kuhn's theorem in
  sequence form);
- the points of `Q` with values in `{0, 1}` (pure strategies) are its extreme points, and
  `max_{x ∈ Q} Σ_s ℓ s x s = ℓ none + Σ_{j : parent j = none} max_a W ⟨j, a⟩`, attained at a pure
  strategy that plays a maximizing action at every decision point (`iSup_linear_eq_bestResponse`).

(Koller, Megiddo and von Stengel 1994; von Stengel 1996; proved here.)

**Checks.**

- A single decision point with `k` actions: `Q` is `{1} × simplex (Fin k)`, and the best response
  value is `ℓ none + max_a ℓ (some ⟨j, a⟩)`.
- Kuhn poker, player 1: six decision points (three cards, then three after "check, bet"), `13`
  sequences, and the second decision point for card `c` has parent `⟨(c, ""), check⟩`.
- Two decision points sharing the parent `none`: `Q` is the product of their simplices.

*Needs:* Mathlib `Convexity.StdSimplex`.

### 4.2 Counterfactual values and the laminar decomposition

Let `ℓ t : Option (Σ j, A j) → ℝ` be utility vectors, the utility of `x` at time `t` being
`Σ_s ℓ t s x s`, and let `b t` be behavioral strategies with sequence forms `x t`. Define the
**counterfactual values** by recursion on the rank, from the leaves up:

`V t ⟨j, a⟩ = ℓ t (some ⟨j, a⟩) + Σ_{j' : parent j' = some ⟨j, a⟩} Σ_{a'} b t j' a' · V t ⟨j', a'⟩`,

and the **local regrets** `R̂ j a = Σ_{t<T} (V t ⟨j, a⟩ − Σ_{a'} b t j a' V t ⟨j, a'⟩)`. Prove the
**laminar regret decomposition** (`laminar_regret_le`): for every `y ∈ Q`,

`Σ_{t<T} Σ_s ℓ t s (y s − x t s) ≤ max_{x̂ pure} Σ_j x̂ (parent j) · max_a R̂ j a
≤ Σ_j (max_a R̂ j a)⁺`,

the left side being the regret of the sequence-form player against `y` (the `none` coordinate
cancels).

(Zinkevich, Johanson, Bowling and Piccione 2007, Theorem 3; Farina, Kroer and Sandholm 2019, for
the laminar form over sequence-form polytopes; proved here.)

**Checks.**

- A single decision point: the counterfactual values are `ℓ t`, and the statement is 1.1.
- `T = 0`: every term is `0`.
- If every local regret is at most `0`, the regret of the sequence-form player is at most `0`.

*Needs:* 1.1, 4.1.

### 4.3 Counterfactual regret minimization

**CFR** runs regret matching (1.3) at every decision point on the counterfactual values
`V t ⟨j, ·⟩`. If at each `j` and `t` the values `V t ⟨j, a⟩` lie in an interval of length `w j`,
prove that the regret of the sequence-form player is at most `Σ_j w j √(|A j| T)`
(`cfr_regret_le`), and the same with regret matching+ (1.4) at every decision point. If every
`ℓ t s` lies in `[−L, L]`, then `w j = 2 L · |subtree of j|` is a valid choice, `|subtree of j|`
being the number of sequences at and below `j`.

The local-range form is proved here; with the whole-game range in place of every `w j` it implies
Zinkevich, Johanson, Bowling and Piccione 2007, Theorem 4.

**Checks.**

- A single decision point: the bound is 1.3's.
- Kuhn poker, player 1: every counterfactual value lies in `[−2/3, 2/3]` (each of the two
  opposing cards contributes at most `2/6` in absolute value), so `w j = 4/3` and the bound is
  `6 · (4/3) √(2T) = 8 √(2T)`; the same holds for player 2.
- The bound is in terms of local ranges, which may be much smaller than the range of the total
  utility.

*Needs:* 1.3, 1.4, 4.2.

### 4.4 Zero-sum games in sequence form

A two-player zero-sum game in sequence form is a pair of decision processes with polytopes
`Q₁`, `Q₂` and a payoff matrix `G : Matrix (Option (Σ j, A₁ j)) (Option (Σ k, A₂ k)) ℝ`; player 1
maximizes and player 2 minimizes `xᵀ G y = x ⬝ᵥ (G *ᵥ y)`. Prove:

- a saddle point exists on `Q₁ × Q₂`, and `max_x min_y = min_y max_x`;
- CFR self-play, in which player 1 runs CFR on `ℓ t = G *ᵥ y t` and player 2 on
  `ℓ t = −(x t ᵥ* G)`, gives averages `x̄ = (1/T) Σ x t ∈ Q₁` and `ȳ ∈ Q₂` with
  `xᵀ G ȳ − x̄ᵀ G y ≤ (R₁ + R₂)/T` for all `x ∈ Q₁`, `y ∈ Q₂` (`cfr_selfPlay_gap_le`), with `R₁`, `R₂`
  bounded by 4.3;
- **Kuhn poker** (`kuhnPoker_value`): with the sequence-form payoff matrix `kuhnPayoff` of Kuhn's
  three-card poker (cards `J < Q < K`, both players ante `1`, player 1 acts first, a bet is `1`,
  each of the six deals with probability `1/6`), the value is `−1/18`. Both players' decision
  points are `KuhnPoint = Fin 3 ⊕ Fin 3` (first and second decision with each card), with
  sequences `KuhnSeq`, parent maps `kuhnParent₁` (the second decision of player 1 follows
  "check") and `kuhnParent₂` (all at the root), and showdown sign `kuhnWin`.

The averages are averages of sequence forms, not of behavioral strategies. (Kuhn 1950 for the
value; Zinkevich, Johanson, Bowling and Piccione 2007; proved here.)

**Checks.**

- A one-decision-point game for each player is a matrix game, and the statements are 2.1 and
  2.2.
- Deterministic CFR self-play on Kuhn poker from uniform strategies, `20000` iterations: average
  value `−0.05554` and gap `0.0033`, against `−1/18 = −0.05556`; 4.3's bound gives the gap at most
  `16 √2 / √T ≈ 0.16` at `T = 20000`.
- Averaging behavioral strategies instead of sequence forms does not in general give a point
  whose sequence form is `x̄`.

*Needs:* Mathlib `Sion.exists_isSaddlePointOn`; 2.2, 4.1, 4.3.

### Examples

Kuhn poker in sequence form, and the decision process of a single player with an observation step.

### Dependencies

4.1 uses Mathlib's `Convexity.StdSimplex`; 4.2 uses 1.1 and 4.1; 4.3 uses 1.3, 1.4 and 4.2; 4.4 uses
Sion's theorem, 2.2, 4.1 and 4.3.

## Dependencies

Layer 1 uses Mathlib's simplex, Hoeffding's lemma and Sion's theorem. Layer 2 uses Layer 1 and
Sion's theorem. Layer 3 uses Layer 1, Tau Ceti's Brouwer theorem and MarkovChainsAndRenewal's
stationary distributions. Layer 4 uses Layers 1–2. The per-target *Needs:* lines are
authoritative.

## Provenance

Lean 4.33 developments by Arthur Freitas Ramos (BSD-3) cover parts of this material:
regret matching and regret matching+ with the `√(nT)` bound and `ε`-equilibria of self-play
(<https://github.com/Arthur742Ramos/verified-regret-matching-lean>), finite mixed Nash existence
through a Scarf/Brouwer development (<https://github.com/Arthur742Ramos/nash-equilibrium-lean>,
<https://github.com/Arthur742Ramos/dependent-nash-equilibrium-lean>), and finite-dimensional
obstructions for Blackwell approachability reductions
(<https://github.com/Arthur742Ramos/blackwell-approachability-lean>). Their author has not yet
been coordinated with; the roadmap develops the mathematics independently, cites this work, and
treats it as reference material, not as the specification.

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
- J. Hannan, *Approximation to Bayes risk in repeated play*, in *Contributions to the theory of
  games III*, Princeton University Press, 1957, 97–139.
- S. Hart and A. Mas-Colell, *A simple adaptive procedure leading to correlated equilibrium*,
  Econometrica **68** (2000), 1127–1150.
- S. Hart and A. Mas-Colell, *A general class of adaptive strategies*, J. Econom. Theory **98**
  (2001), 26–54.
- D. Koller, N. Megiddo and B. von Stengel, *Fast algorithms for finding randomized strategies in
  game trees*, STOC 1994, 750–759.
- H. W. Kuhn, *A simplified two-person poker*, in *Contributions to the theory of games I*,
  Princeton University Press, 1950, 97–103.
- J. Nash, *Non-cooperative games*, Ann. of Math. **54** (1951), 286–295.
- O. Tammelin, *Solving large imperfect information games using CFR+*, arXiv:1407.5042, 2014.
- J. von Neumann, *Zur Theorie der Gesellschaftsspiele*, Math. Ann. **100** (1928), 295–320.
- B. von Stengel, *Efficient computation of behavior strategies*, Games Econom. Behav. **14**
  (1996), 220–246.
- M. Zinkevich, M. Johanson, M. Bowling and C. Piccione, *Regret minimization in games with
  incomplete information*, NeurIPS 2007.
