# Roadmap: repeated games and bargaining

**Summary.** Two players who can split a surplus must agree on how. Nash answered with axioms:
a solution should not depend on the units of the utility scales, should not leave both players
better off unclaimed, should treat symmetric players symmetrically, and should not change when
alternatives it did not choose are removed. Rubinstein answered with a game: the players take
turns proposing divisions of a pie and discount the future. When a game is repeated forever,
threats of future punishment sustain outcomes that no single play supports, and the folk
theorems say which. This roadmap states these four results for two-person bargaining
problems, alternating offers over the pie `[0, 1]` and finite games repeated forever
with observed actions. Its headline theorems:

- *Nash's bargaining theorem.* On a compact convex set of payoff pairs, every point of which is
  at least the disagreement point and some point of which is strictly above it in both
  coordinates, the product of the two gains has exactly one maximizer. A rule choosing a point of
  every such problem satisfies affine covariance, Pareto optimality, symmetry and independence of
  irrelevant alternatives if and only if it chooses that maximizer.
- *Rubinstein's theorem.* With discount factors in `[0, 1)`, the profile in which player `0`,
  proposing first, claims `(1 − δ₁)/(1 − δ₀δ₁)` and each responder accepts exactly the offers
  worth at least its discounted share as next proposer is a subgame-perfect equilibrium in pure
  strategies. For positive discount factors, in every pure subgame-perfect equilibrium, after
  every history without agreement that ends a round, the offer of the next round is the share
  prescribed by that profile and it is accepted at once.
- *The folk theorem for average payoffs.* For a finite game with nonempty action sets, the
  average payoff vectors of Nash equilibria of the infinitely repeated game, in behavioural
  strategies, are exactly the payoff vectors in the convex hull of the stage payoffs that give
  every player at least its minmax value against independent mixing.
- *The Nash-threat folk theorem.* If a point of that convex hull gives every player more than a
  Nash equilibrium of the stage game does, then for every `ε > 0` and every discount factor close
  enough to `1` the discounted repeated game has a subgame-perfect equilibrium whose payoff
  vector is within `ε` of it. No public randomization device is assumed.

The roadmap builds on ExtensiveFormGames, whose multi-stage games with observed actions, pure
subgame perfection and one-shot deviation principle carry the bargaining game. It takes the
mixed strategies, expected utilities and Nash equilibria of finite games from
RegretMinimizationAndEquilibria. Repeated games with mixed strategies need the law of an
infinite play, built here from Mathlib's Ionescu-Tulcea construction; the strong law for
martingale differences comes from MarkovDecisionProcesses.

Layer 1 below proves Nash's theorem, and Layer 2 Rubinstein's; neither uses another layer.
Layer 3 sets up stage games, behavioural profiles and the law of play; Layer 4 proves the folk
theorem for average payoffs and Layer 5 the Nash-threat folk theorem, each from Layer 3.

## Conventions

- **Bargaining problems** (Layer 1) live in `ℝ × ℝ` with the product order, so `d ≤ x` means
  `d.1 ≤ x.1` and `d.2 ≤ x.2`. A solution is any map `F : Set (ℝ × ℝ) → ℝ × ℝ → ℝ × ℝ`; the axioms
  constrain it on bargaining problems only.
- **Alternating offers** (Layer 2) are a multi-stage game with observed actions in the sense of
  ExtensiveFormGames, Layer 5, with players `Fin 2`. Round `k` occupies stages `2k` and `2k + 1`;
  player `0` proposes in even rounds and player `1` in odd ones. At every stage each player
  chooses a `BargainingAction`, an offer in `unitInterval` (always read as player `0`'s share, so
  player `1` receives one minus it) and an answer in `Bool` (`true` accepts). Only the proposer's
  offer at stage `2k` and the responder's answer at stage `2k + 1` affect payoffs; the other
  coordinates are ignored. This is the encoding that ExtensiveFormGames 5.1 describes for games
  that end. Discount factors are `δ : Fin 2 → ℝ`, written `δ₀`, `δ₁`.
- **Stage games** (Layers 3 to 5): players form a finite type `N` with decidable equality; player
  `i` has a finite nonempty action type `A i` with decidable equality, a measurable space
  structure and measurable singletons (so every subset is measurable); payoffs are
  `u : N → (∀ i, A i) → ℝ`. Mixed strategies of the stage game are weight vectors in `simplex`,
  as in RegretMinimizationAndEquilibria; mixed actions in the repeated game are `PMF`s. The two
  meet only in the proofs: the weights `x i` give the `PMF` with masses `x i b`.
- **Histories and plays.** A history of length `t` is `Fin t → ∀ j, A j`. The law `playLaw σ t₀ h`
  of the play after the history `h` is a measure on `ℕ → ∀ j, A j` whose coordinate `m` is the
  action profile of stage `t₀ + m`. Discounted payoffs are normalized by the factor `1 − δ`, as in
  Manea's slides, so that they are on the scale of the stage payoffs.

## Layer 1: Nash's bargaining theorem

### 1.1 Bargaining problems and the Nash point

Define `IsBargainingProblem S d`: `S` is compact and convex, every point of `S` is at least `d`,
and some point of `S` is strictly larger than `d` in both coordinates (Karlin–Peres, Definition
12.4.2, p. 210, which asks for a closed bounded set; in `ℝ × ℝ` that is a compact one). Define
the Nash product `nashProduct d x = (x.1 − d.1)(x.2 − d.2)` and `IsNashPoint S d a`: `a ∈ S` and
`nashProduct d x ≤ nashProduct d a` for every `x ∈ S` (Definition 12.4.4, p. 211; since every
point of `S` is at least `d`, the constraint `x ≥ d` of the source is automatic).

Prove `existsUnique_isNashPoint`: on a bargaining problem the Nash product has exactly one
maximizer (Karlin–Peres, Remark 12.4.5, p. 211, with its proof).

Route. Existence: `S` is nonempty and compact and the product is continuous
(`IsCompact.exists_isMaxOn`). Uniqueness: the maximal value `α` is positive, because a point
strictly above `d` gives a positive product; so both coordinates of a maximizer exceed those of
`d`. If `a ≠ b` are maximizers, translate `d` to `0`; then `a₁ a₂ = b₁ b₂ = α`, and the midpoint,
which lies in `S` by convexity, has product `(2α + a₁ b₂ + b₁ a₂)/4 > α`, since
`a₁ b₂ + b₁ a₂ ≥ 2√(a₁ b₂ b₁ a₂) = 2α` with equality only when `a₁ b₂ = b₁ a₂`, which with
`a₁ a₂ = b₁ b₂` forces `a = b`.

**Checks.**
- On the triangle with vertices `(0, 0)`, `(4, 0)`, `(0, 2)` and `d = (0, 0)` the Nash point is
  `(2, 1)`, with product `2`: on the edge `x₁/4 + x₂/2 = 1` the product `x₁ (2 − x₁/2)` peaks at
  `x₁ = 2`.
- A point strictly above `d` is needed: for the segment from `(0, 0)` to `(1, 0)` and
  `d = (0, 0)`, every point has product `0`, so every point maximizes it.
- Compactness is needed: on `{x ≥ 0 | x₁ + x₂ < 2}` the products approach `1` and never reach it.
- Convexity is needed: on the three points `(0, 0)`, `(2, 1)`, `(1, 2)` with `d = (0, 0)` both
  `(2, 1)` and `(1, 2)` have the largest product, `2`.

*Needs:* Mathlib `IsCompact.exists_isMaxOn`, `Convex.add_smul_mem`.

### 1.2 The axioms and Nash's theorem

With `scaleShift α β x = (α.1 x.1 + β.1, α.2 x.2 + β.2)`, define for a map `F`:

- `IsBargainingSolution F`: `F S d ∈ S` for every bargaining problem (Definition 12.4.3, p. 210);
- `IsAffineCovariantSolution F`: `F (scaleShift α β '' S) (scaleShift α β d)` equals
  `scaleShift α β (F S d)` whenever `α.1 > 0` and `α.2 > 0`;
- `IsParetoSolution F`: if `a ∈ S` and `F S d ≤ a`, then `a = F S d`;
- `IsSymmetricSolution F`: if `d.1 = d.2` and `S` is invariant under exchanging the coordinates,
  then `(F S d).1 = (F S d).2`;
- `IsIIASolution F`: if `(S, d)` and `(S', d)` are bargaining problems, `S ⊆ S'` and `F S' d ∈ S`,
  then `F S d = F S' d`

(the four axioms of Karlin–Peres, pp. 210–211, each quantified over bargaining problems; the
image of a bargaining problem under `scaleShift α β` with positive `α` is again one).

Prove `nash_bargaining`: `F` is a solution satisfying the four axioms if and only if
`IsNashPoint S d (F S d)` for every bargaining problem `(S, d)` (Karlin–Peres, Theorem 12.4.6,
pp. 211–213).

Route.
- (←) By 1.1, `F S d` is the unique Nash point. Covariance: the image of `S` is a bargaining
  problem whose Nash products are those of `S` times `α.1 α.2 > 0`. Pareto: a point `a' ≥ a`
  different from the Nash point `a` has a larger product, since `a` is strictly above `d`.
  Symmetry: the exchange of the coordinates of the Nash point is again a Nash point. IIA: the
  Nash point of `S'` lying in `S` is a Nash point of `S`.
- (→) Let `a` be the Nash point of `(S, d)` and `Ψ = scaleShift α β` with `α_i = 1/(a_i − d_i)`
  and `β_i = −d_i α_i`, so that `Ψ d = 0` and `Ψ a = (1, 1)`, the Nash point of `Ψ '' S` by the
  covariance of Nash points. Every `x ∈ Ψ '' S` satisfies `x₁ + x₂ ≤ 2`: the product
  `(1 − λ + λ x₁)(1 − λ + λ x₂)` at the points of the segment from `(1, 1)` to `x` is at most `1`
  and equals `1` at `λ = 0`, so its derivative there, `x₁ + x₂ − 2`, is at most `0`. Hence
  `Ψ '' S` lies in the triangle `T` with vertices `(0, 0)`, `(2, 0)`, `(0, 2)`, a symmetric
  bargaining problem with disagreement point `0` (compact by `Set.Finite.isCompact_convexHull`).
  By symmetry `F T 0 = (c, c)` with `c ≤ 1`, and by Pareto optimality against `(1, 1) ∈ T`,
  `F T 0 = (1, 1)`. This lies in `Ψ '' S`, so IIA gives `F (Ψ '' S) 0 = (1, 1)`, and covariance
  gives `Ψ (F S d) = (1, 1) = Ψ a`, so `F S d = a`.

The source compares `S` with the convex hull of `S` and its mirror image; the triangle `T` does
the same work and is a bargaining problem without a compactness argument for that hull.

**Checks.**
- Covariance on the triangle of 1.1 with `α = (2, 3)` and `β = (1, −1)`: the image has vertices
  `(1, −1)`, `(9, −1)`, `(1, 5)`, disagreement point `(1, −1)`, and Nash point `(5, 2)`, the image
  of `(2, 1)`.
- IIA on the same triangle: the quadrilateral with vertices `(0, 0)`, `(2, 0)`, `(2, 1)`, `(0, 2)`
  contains `(2, 1)` and has it as Nash point.
- Symmetry cannot be dropped: the rule that maximizes `x₁` and then `x₂` is a covariant, Pareto
  optimal solution with IIA, and on the triangle with vertices `(0, 0)`, `(2, 0)`, `(0, 2)` it
  chooses `(2, 0)`, while the Nash point is `(1, 1)`.
- Covariance cannot be dropped: the leximin rule, which maximizes the smaller of the two gains
  `x_i − d_i` over `S` and then the larger, is a Pareto optimal, symmetric solution with IIA (it
  maximizes a total preorder that strictly increases along every weak domination, and on a
  convex compact `S` its maximizer exists and is unique, since two maximizers with gains
  `(m, M)` and `(M, m)`, `m < M`, would have a midpoint with both gains above `m`). On the
  triangle of 1.1 it picks `(4/3, 4/3)`, whose image is `(11/3, 3)`, but on the image triangle
  it picks `(31/7, 17/7)`. The rule choosing only the
  largest `d + (t, t)` in `S` would not do: on `[0, 2] × [0, 1]` with `d = 0` it picks `(1, 1)`,
  which `(2, 1)` dominates, so it is not Pareto optimal either.

*Needs:* 1.1; Mathlib `Set.Finite.isCompact_convexHull`, `IsCompact.image`,
`Convex.is_linear_image`, `Convex.vadd`, `Prod.swap`.

### Examples

The triangle with vertices `(0, 0)`, `(4, 0)`, `(0, 2)`, its image under an affine map and a
quadrilateral inside it; the lexicographic and the leximin rules as rules that fail one axiom
each.

### Dependencies

Mathlib `IsCompact.exists_isMaxOn`, `Convex.add_smul_mem`, `Set.Finite.isCompact_convexHull`,
`IsCompact.image`, `Convex.is_linear_image`, `Convex.vadd`, `Prod.swap`. No other layer.

## Layer 2: alternating offers

### 2.1 The game

Copy verbatim, from ExtensiveFormGames 5.1, the pure profiles `StageProfile N A`, the play
`play s t₀ h` from a history `h` of length `t₀`, and `IsStageSubgamePerfect u s` (after every
history no player gains by replacing its strategy with any pure one). With the actions
`BargainingAction = unitInterval × Bool`, define `proposer k` (`0` for even `k`, `1` for odd `k`),
`responder k`, the offer `offerAt ω k` of round `k` (the proposer's offer at stage `2k`),
`AcceptedAt ω k` (the responder's answer at stage `2k + 1` is `true`), and
`bargainingPayoff δ i ω`: if `k` is the first round whose offer is accepted and `x` its offer, it
is `δ₀ ^ k x` for player `0` and `δ₁ ^ k (1 − x)` for player `1`; with no acceptance it is `0`.
Define `IsOpenHistory h`: no answer `true` of a responder appears in `h` at a response stage.
This is Rubinstein's game of Manea's slides ("Single-Deviation Principle and Bargaining",
slide 10) for the set of utility pairs `{u ≥ 0 | u₁ + u₂ ≤ 1}`, with offers restricted to its
Pareto frontier.

**Checks.**
- For `δ` in `[0, 1)²` the payoffs are continuous at infinity in the sense of ExtensiveFormGames
  5.1: two plays that agree before stage `2K` either reach the same first acceptance or both
  give each player at most `δ_i ^ K` in absolute value.
- The play in which player `0` offers `1/2` in round `0` and player `1` accepts gives `(1/2, 1/2)`;
  if player `1` rejects it and player `0` accepts player `1`'s offer `x` in round `1`, the play
  gives `(δ₀ x, δ₁ (1 − x))`.

*Needs:* ExtensiveFormGames 5.1 (`StageProfile`, `play`, `IsStageSubgamePerfect`, copied).

### 2.2 Rubinstein's equilibrium

Define `rubinsteinShare δ k`, player `0`'s share in round `k`: `(1 − δ₁)/(1 − δ₀δ₁)` when `k` is
even, `δ₀ (1 − δ₁)/(1 − δ₀δ₁)` when `k` is odd; player `1`'s share as proposer is then
`(1 − δ₀)/(1 − δ₀δ₁)`. Define `rubinsteinProfile δ`: every player's offer at stage `t` is
`rubinsteinShare δ (t / 2)` (clamped to `[0, 1]`, which changes nothing for `δ` in `[0, 1)²`); at
stage `2k + 1` the answer is "accept" exactly when the offer `y` of stage `2k` satisfies
`y ≤ rubinsteinShare δ k` for even `k` (player `1` keeps at least `δ₁` times its share as next
proposer) and `rubinsteinShare δ k ≤ y` for odd `k`.

Prove `isStageSubgamePerfect_rubinsteinProfile`: if `0 ≤ δ_i < 1` for both players,
`rubinsteinProfile δ` is subgame perfect for `bargainingPayoff δ` (Manea, "Single-Deviation
Principle and Bargaining", slide 11, the stationary equilibrium, with `g₂(u₁) = 1 − u₁`; slide 19
for the payoffs).

Route. The payoffs are continuous at infinity (the first Check of 2.1), so by the pure one-shot
deviation principle of ExtensiveFormGames 5.2 it suffices that no one-shot change gains. After a
history with an acceptance, payoffs are fixed. The profile reads only the stage and the last
offer, so changes of ignored coordinates change nothing. A responder compares accepting with the
continuation from the next round, where it proposes and, normalized to that round, receives its
share `x*_r`; the acceptance rule is optimal, ties included. A proposer offering more to the
responder is accepted and receives less; offering less is rejected, and normalized to the
current round it then receives `δ_p` times its share as next responder, `δ_p · δ_p x*_p < x*_p`.
The identities used are `1 − x*₀ = δ₁ x*₁` and `1 − x*₁ = δ₀ x*₀`, with `x*_p` the share of the
proposer `p`; for `δ` in `[0, 1)²` both shares lie in `(0, 1]`. Positivity of the discount
factors is not used here; it is needed in 2.3.

**Checks.**
- `δ = (1/2, 1/2)`: player `0` receives `2/3` in round `0`; in odd rounds player `0`'s share is
  `1/3`. `δ = (9/10, 1/2)`: `10/11`; `δ = (1/3, 2/3)`: `3/7`.
- The shares solve Manea's equations `m₀ = δ₀ (1 − m₁)`, `m₁ = δ₁ (1 − m₀)`, with player `0`
  receiving `1 − m₁`: for `δ = (1/2, 1/2)`, `m₀ = m₁ = 1/3`.
- Ties must be accepted: if player `1` rejected the offer `2/3` itself, for `δ = (1/2, 1/2)`, player
  `0` would receive `y < 2/3` from every accepted offer `y` and `1/6` from every rejected one, so
  it would have no best offer, and the modified profile is not subgame perfect.
- Nonnegative discount factors are needed: for `δ = (1/2, −1/2)` the share of round `0` is
  `6/5`, offered as `1` after clamping, and the share of odd rounds is `3/5`. Offered `11/20` in
  round `1`, player `0` receives `11/40` by accepting and `1/4` by rejecting (its offer `1` of
  round `2` is accepted), yet the profile rejects, so it is not subgame perfect.

*Needs:* 2.1; ExtensiveFormGames 5.1 (`IsContinuousAtInfinity`) and 5.2 (the pure one-shot
deviation principle); Mathlib `Set.projIcc`, `Nat.find_spec`, `Nat.find_min'`.

### 2.3 Uniqueness of the outcome

Prove `acceptedAt_and_offerAt_of_isStageSubgamePerfect`: if `0 < δ_i < 1` for both players and
`s` is a pure subgame-perfect profile for `bargainingPayoff δ`, then after every open history `h`
of `2k` stages the play `play s (2k) h` has the offer of round `k` accepted, and that offer is
`rubinsteinShare δ k`. In particular the play from the empty history gives `(x*₀, 1 − x*₀)`, with
agreement in round `0`.

Manea, "Single-Deviation Principle and Bargaining", slide 13, Theorem 2, states uniqueness for
behaviour strategies, except for the answers to Pareto-inefficient offers, which do not occur
here; the proof, slides 14–18, proceeds by iterated conditional dominance. The statement here is
for pure profiles, the objects of ExtensiveFormGames 5.1, and is about outcomes after every open
history; the route below, a sup–inf argument on one fixed profile, is proved here.

Route. Fix `s`. For a proposer `p` with responder `r`, let `M_p` and `m_p` be the supremum and the
infimum, over the open histories of `2k` stages with `proposer k = p`, of `p`'s payoff from the
play after the history divided by `δ_p ^ k` (this division is where `δ_p > 0` is used); they
lie in `[0, 1]`. Normalized payoffs of the two
players in one subgame add up to at most `1`.
- A responder who rejects reaches an open history of the next round, where it proposes, so
  rejecting is worth at least `δ_r m_r` and at most `δ_r M_r`. By subgame perfection the
  responder accepts every offer that leaves it more than `δ_r M_r`; such offers exist since
  `δ_r M_r < 1`, so the proposer can secure `1 − δ_r M_r − η` for every `η > 0`, and
  `m_p ≥ 1 − δ_r M_r`.
- If the offer is accepted, the responder's share is at least `δ_r m_r`, so the proposer has at
  most `1 − δ_r m_r`; if rejected, the proposer has at most `δ_p (1 − m_r) ≤ 1 − δ_r m_r`, the
  difference being `(1 − δ_p) − m_r (δ_r − δ_p) ≥ min(1 − δ_p, 1 − δ_r) ≥ 0` since
  `0 ≤ m_r ≤ 1`. So `M_p ≤ 1 − δ_r m_r`.
- Combining the four inequalities, `M₀ (1 − δ₀δ₁) ≤ 1 − δ₁` and `m₀ (1 − δ₀δ₁) ≥ 1 − δ₁`, and
  likewise for player `1`: the normalized payoff of the proposer after every open history is
  exactly `x*_p`.
- After an open history, rejection gives the proposer at most `δ_p (1 − x*_r) = δ_p² x*_p < x*_p`,
  since `x*_p > 0`; so the offer is accepted, and the proposer's share is `x*_p`, which is the
  offer `rubinsteinShare δ k` read as player `0`'s share.

**Checks.**
- The strategies themselves are not unique: changing `rubinsteinProfile δ` in a coordinate the
  payoffs ignore (the responder's offer at a proposal stage) keeps it subgame perfect, which is
  why the theorem is about the play.
- Positive discount factors are needed: for `δ = (1/2, 0)` the profile that agrees with
  `rubinsteinProfile δ` except that player `1` offers player `0` the whole pie in odd rounds is
  subgame perfect (player `1`'s payoffs from round `1` on are all `0`, and player `0` accepts `1`
  since `δ₀ ≥ δ₀²`), and in round `1` it offers `1`, not `rubinsteinShare δ 1 = 1/2`.
- Discount factors below `1` are needed: for `δ = (1, 1)` and every `c` in `[0, 1]` the profile
  that always offers `c`, with player `1` accepting `y ≤ c` and player `0` accepting `y ≥ c`, is
  subgame perfect, so the share is not determined (and `rubinsteinShare δ k` is the junk value
  `0/0 = 0`).

*Needs:* 2.1, 2.2; ExtensiveFormGames 5.1 (`play`, `IsStageSubgamePerfect`); Mathlib
`Nat.find_spec`, `Nat.find_min'`.

### Examples

The shares for `δ = (1/2, 1/2)`, `(9/10, 1/2)` and `(1/3, 2/3)`; the negative discount factor
`δ₁ = −1/2` as the failure of 2.2, and the patient case `δ = (1, 1)` and the impatient case
`δ₁ = 0` as the two failures of 2.3.

### Dependencies

ExtensiveFormGames 5.1 and 5.2; Mathlib `Set.projIcc`, `Nat.find_spec`, `Nat.find_min'`. No
other layer.

## Layer 3: repeated games

### 3.1 Stage games, feasible payoffs and minmax values

Copy verbatim, from RegretMinimizationAndEquilibria, `simplex` (Conventions) and
`expectedUtility` and `IsNash` (3.1). Define `payoffPolytope u`, the convex hull of the payoff
vectors `fun i ↦ u i a` of the action profiles `a` (Karlin–Peres, Definition 6.4.7, pp. 131–132;
Manea, "Repeated Games", slide 6), and `minmaxValue u i`, the infimum over profiles `x` with
`x j ∈ simplex (A j)` for `j ≠ i` of the largest of the payoffs
`expectedUtility u (Function.update x i (Pi.single b 1)) i` over `b : A i` (Karlin–Peres,
Definition 6.4.8, p. 132; Manea, slide 4). The other players mix independently.

- The infimum is attained, by compactness of the simplices and continuity of the largest payoff.
- A Nash equilibrium `x` of the stage game gives each player at least its minmax value.

**Checks.**
- The prisoner's dilemma with payoffs `(3, 3)`, `(0, 4)`, `(4, 0)`, `(1, 1)` for `(C, C)`, `(C, D)`,
  `(D, C)`, `(D, D)`: both minmax values are `1`, against `D`.
- Matching pennies with payoffs `±1`: the minmax values are `0`, against the uniform mixture; if
  the other player could use only pure actions they would be `1` (Manea, slide 4).
- Independent and correlated punishment differ. Let players `1` and `2` choose bits and player
  `3` choose `0`, `1` or `2`, winning `1` for `0` if both bits are `0`, for `1` if both are `1`, for
  `2` if they differ. Its minmax value is `4/9`, at the independent mixtures giving each bit `1`
  with probability `1/3`. Indeed, if the bits are `1` with probabilities `p` and `q`, write
  `b = pq` and `s = p + q`; the three outcomes have probabilities `1 − s + b`, `b` and `s − 2b`.
  If the first and the third were below `4/9`, then `5/9 + b < s < 4/9 + 2b`, so `b > 1/9`, and
  `2√b ≤ s < 4/9 + 2b` forces `√b < 1/3` or `√b > 2/3`; hence `b > 4/9`. So the largest of the
  three is at least `4/9`, with equality at `p = q = 1/3` (values `4/9`, `1/9`, `4/9`). A joint
  distribution of the two bits putting `1/3` on `(0, 0)`, `1/3` on
  `(1, 1)` and `1/3` on the other two would hold it to `1/3`; against pure actions it is `1`.

*Needs:* RegretMinimizationAndEquilibria Conventions and 3.1 (copied); Mathlib `convexHull`,
`Convexity.StdSimplex.compactSpace`, `Convexity.StdSimplex.isClosedEmbedding_toFun_comp_weights`,
`IsCompact.exists_isMinOn`.

### 3.2 Behavioural profiles and the law of the play

Define `BehaviouralProfile N A`: player `i`'s mixed action at stage `t` as a `PMF (A i)` that
depends on the history of length `t` (Karlin–Peres, Definition 6.4.1, p. 130; Manea, slide 3).
Define `jointPMF p`, the law of the profile drawn independently from `p i`, with masses
`∏ i, p i (a i)`, and `playLaw σ t₀ h`, the law of the play after the history `h`: the first
profile has law `jointPMF (fun i ↦ σ i t₀ h)`, and given the profiles of stages `t₀` to `t₀ + n`
the next has law `jointPMF` of the mixed actions at the history extended by them
(`Kernel.trajMeasure` with Tau Ceti's `Kernel.ofPMF` kernels).

- `playLaw σ t₀ h` is a probability measure, and its law of the first coordinates and the next
  one is the law of the first coordinates followed by the kernel
  (`Kernel.map_frestrictLe_trajMeasure_compProd_eq_map_trajMeasure`): the conditional law of
  each stage's profile given the past is `jointPMF` of the prescribed mixed actions.

**Checks.**
- Two players with `p 0` uniform on two actions and `p 1` giving `1/3` and `2/3`: `jointPMF p`
  has masses `1/6`, `1/3`, `1/6`, `1/3`.
- If every `σ i t h` is `PMF.pure (s i t h)`, then `playLaw σ t₀ h` is the point mass at the play
  `m ↦ play s t₀ h (t₀ + m)` of ExtensiveFormGames 5.1.

*Needs:* 3.1; Mathlib `PMF.ofFintype`, `Fintype.prod_sum`, `PMF.tsum_coe`, `tsum_fintype`,
`PMF.toMeasure`, `Kernel.trajMeasure`,
`Kernel.map_frestrictLe_trajMeasure_compProd_eq_map_trajMeasure`, `Fin.append`; Tau Ceti
`Kernel.ofPMF`.

### Examples

The prisoner's dilemma, matching pennies and the three-player game of 3.1; product laws and the
pure plays.

### Dependencies

RegretMinimizationAndEquilibria Conventions and 3.1 (copied); Mathlib `convexHull`,
`Convexity.StdSimplex.compactSpace`, `Convexity.StdSimplex.isClosedEmbedding_toFun_comp_weights`,
`IsCompact.exists_isMinOn`, `PMF.ofFintype`, `Fintype.prod_sum`, `PMF.tsum_coe`, `tsum_fintype`,
`PMF.toMeasure`, `Kernel.trajMeasure`,
`Kernel.map_frestrictLe_trajMeasure_compProd_eq_map_trajMeasure`, `Fin.append`; Tau Ceti
`Kernel.ofPMF`.

## Layer 4: the folk theorem for average payoffs

### 4.1 Average payoffs and Nash equilibria

Define `averagePayoff u i ω T`, the average of `u i (ω t)` over `t < T`, and
`IsAverageNash u σ g`: for every player `j`, almost surely under `playLaw σ 0` from the empty
history the averages of `j` converge; the expectation of their upper limit is `g j`; and for
every behavioural strategy `τ` of `j` the expectation of the upper limit of `j`'s averages under
`playLaw (Function.update σ j τ) 0` is at most `g j`. This is Karlin–Peres, Definition 6.4.9,
pp. 132–133: the limit is required to exist for `σ` only, deviations are measured by the upper
limit, and since the averages of `σ` converge almost surely the expectation of their upper limit
is that of their limit.

**Checks.**
- Upper limits matter for deviations: for one player whose payoff is `1` in the stages
  `[2^k, 2^(k+1))` with `k` odd and `0` otherwise, the averages at `T = 2^(k+1)` alternate near
  `1/3` and `2/3`; such a play has no limit, so a profile producing it surely is no equilibrium,
  and as a deviation it counts `2/3`.

*Needs:* 3.2; Mathlib `Measurable.limsup`.

### 4.2 The folk theorem

Prove `exists_isAverageNash_iff`: there is a behavioural profile `σ` with
`IsAverageNash u σ g` if and only if `g ∈ payoffPolytope u` and `minmaxValue u i ≤ g i` for every
`i` (Karlin–Peres, Theorem 6.4.10, p. 133, with the proof in §6.4.3, pp. 133–134).

Route.
- Strong law: for a bounded sequence of payoffs whose conditional expectations given the past
  are `c t`, the averages of the differences tend to `0` almost surely. This is
  MarkovDecisionProcesses 6.1 (`ae_tendsto_zero_noise`) with step sizes `1/(t + 1)`, for which
  its recursion makes `W t` the average of `w 0, …, w (t − 1)` whatever `W 0` is. The filtration
  is `MeasureTheory.Filtration.piLE`, whose index `t` holds the coordinates up to `t`, and `w t`
  is the payoff of stage `t + 1` minus its conditional expectation given the coordinates up to
  `t`; so `w t` is measurable for index `t + 1`, has conditional mean `0` for index `t` and is
  bounded, and the single stage `0` left out does not change the limit of the averages. The
  conditional expectation is the integral against the kernel of 3.2 at the history up to stage
  `t`, by the identity of 3.2 and `MeasureTheory.Filtration.piLE_eq_comap_frestrictLe`.
- (→) Each average vector over `T ≥ 1` stages lies in `payoffPolytope u`, which is compact and
  convex (`Set.Finite.isCompact_convexHull`), so the almost sure limit does, and so does its
  expectation (`Convex.integral_mem`, `MeasureTheory.eval_integral`). If `g i < minmaxValue u i`,
  let player `i` play at every history a best pure reply to the others' prescribed mixed
  actions; its conditional expected payoff is at least `minmaxValue u i` at every stage, so by
  the strong law its upper limit is almost surely at least that, more than `g i`.
- (←) Write `g` as a convex combination of payoff vectors. For rational weights with common
  denominator `D`, cycle through `D` profiles with the weights as frequencies; in general, follow
  cycles for rational approximations `g(1), g(2), …` in successive blocks long enough that the
  averages tend to `g`, as in the source's inequality (6.3). As long as no one has deviated
  everyone plays the plan; after a first deviation by a single player `j` (by several at once:
  anything), the others play, independently, mixed actions attaining `minmaxValue u j` forever.
  Under `σ` the play is the plan and the averages tend to `g`. Under a deviation of `j`, on the
  event that `j` never deviates the play is the plan; after a deviation of `j`, its conditional
  expected payoff is at most `minmaxValue u j ≤ g j` at every stage, and the strong law bounds
  the upper limit by `g j`.

**Checks.**
- The prisoner's dilemma of 3.1: the cycle `(C, C)`, `(C, C)`, `(D, C)` has averages `(10/3, 2)`, a
  point of the polytope above the minmax values `(1, 1)`, so it is an equilibrium payoff;
  `(0, 4)` is in the polytope and gives player `0` less than `1`, so it is not.
- Matching pennies: the polytope is the segment `x₁ + x₂ = 0` between `(1, −1)` and `(−1, 1)`,
  and the minmax values are `0`, so `(0, 0)` is the only equilibrium payoff; the pure minmax value
  `1` in place of `0` would leave no vector at all.
- The three-player game of 3.1: a vector giving player `3` a payoff in `[1/3, 4/9)` is not an
  equilibrium payoff, although correlated punishment could hold player `3` to `1/3`.

*Needs:* 3.1, 3.2, 4.1; MarkovDecisionProcesses 6.1 (`ae_tendsto_zero_noise`); Mathlib
`MeasureTheory.Filtration.piLE`, `MeasureTheory.Filtration.piLE_eq_comap_frestrictLe`,
`Set.Finite.isCompact_convexHull`, `Convex.integral_mem`,
`MeasureTheory.eval_integral`, `mem_convexHull_iff_exists_fintype`, `Rat.denseRange_cast`,
`Finite.exists_max`, `IsCompact.exists_isMinOn`.

### Examples

Cycles in the prisoner's dilemma; matching pennies, where only the mixed minmax value gives a
nonempty set; the three-player game.

### Dependencies

3.1, 3.2; MarkovDecisionProcesses 6.1; Mathlib `Measurable.limsup`,
`MeasureTheory.Filtration.piLE`, `MeasureTheory.Filtration.piLE_eq_comap_frestrictLe`,
`Set.Finite.isCompact_convexHull`, `Convex.integral_mem`,
`MeasureTheory.eval_integral`, `mem_convexHull_iff_exists_fintype`, `Rat.denseRange_cast`,
`Finite.exists_max`, `IsCompact.exists_isMinOn`. Layers 1, 2 and 5 are not used.

## Layer 5: the Nash-threat folk theorem with discounting

### 5.1 Discounted payoffs and subgame perfection

Define `discountedPayoff u δ σ t₀ h i`, the normalized discounted payoff of player `i` after the
history `h`: `(1 − δ)` times the expectation under `playLaw σ t₀ h` of `∑' m, δ ^ m * u i (ω m)`
(Manea, "Repeated Games", slide 3), and `IsDiscountedSubgamePerfect u δ σ`: after every history,
no player gains by replacing its strategy with any behavioural strategy.

**Checks.**
- The behavioural profile that plays the action profile `a` with probability `1` after every
  history has discounted payoff `u i a` for every `δ` in `[0, 1)`.
- Grim trigger in the prisoner's dilemma of 3.1 (`(C, C)` until someone deviates, `(D, D)`
  afterwards) is subgame perfect exactly when `δ ≥ 1/3`: the best deviation gives
  `(1 − δ) 4 + δ`, which is at most `3` exactly then.

*Needs:* 3.2.

### 5.2 The Nash-threat folk theorem

Prove `exists_isDiscountedSubgamePerfect`: let `x` be a Nash equilibrium of the stage game
(`IsNash u x`) and `v ∈ payoffPolytope u` with `expectedUtility u x i < v i` for every `i`. Then
for every `ε > 0` there is `δ₀ < 1` such that for every `δ` with `δ₀ < δ < 1` some profile `σ`
satisfies `IsDiscountedSubgamePerfect u δ σ` and `|discountedPayoff u δ σ 0 h₀ i − v i| ≤ ε` for
every `i`, with `h₀` the empty history.

Manea, "Repeated Games", slide 7, Theorem 1 (Friedman 1971), gives the payoff `v` exactly, with a
public randomization device that correlates the players' actions; slide 14 notes that the device
can be dispensed with, by Sorin (1986) and Fudenberg and Maskin (1991). The game here has no such
device, and the statement is the approximate one, proved here with the source's punishment.

Route. Choose rational weights on the action profiles whose combination `v'` is within `ε/2` of
`v` and still exceeds `expectedUtility u x` in every coordinate, and a cycle of length `D` of
action profiles with these frequencies. The profile plays the cycle while no one has deviated
and the mixed actions of `x` forever after any deviation. After a deviation the others play `x`
whatever happens, so each player's conditional expected payoff at every later stage is at most
`expectedUtility u x i` whatever it does, since `x` is a Nash equilibrium, with equality when it
plays `x` too. On the cycle, at phase `k`, the continuation value
`(1 − δ)/(1 − δ^D) ∑_{m < D} δ^m u i (c ((k + m) % D))` tends to `v' i` as `δ → 1`, uniformly in
the `D` phases, while a first deviation at the current stage is worth at most
`(1 − δ) max u i + δ · expectedUtility u x i`, which tends to `expectedUtility u x i < v' i`. For
`δ` near `1` no first deviation gains, at any phase; summing over the stage of the first
deviation, no deviation gains, and the value at phase `0` is within `ε/2` of `v'`.

**Checks.**
- The prisoner's dilemma of 3.1 with the cycle `(C, C)`, `(C, C)`, `(D, C)`, which averages
  `(10/3, 2)`, and reversion to `(D, D)`: at `δ = 3/4` the values from phase `0` are
  `(120/37, 84/37)` and no deviation gains at any phase; at `δ = 1/2` player `1` gains by playing
  `D` at the second stage of the cycle, `5/2` against the value `15/7` there.
- A mixed punishment: in the game with payoffs `(2, 1)` at `(0, 0)`, `(1, 2)` at `(1, 1)` and
  `(0, 0)` otherwise, the mixed equilibrium (player `0` plays `0` with probability `2/3`, player
  `1` with probability `1/3`) gives `(2/3, 2/3)`. Alternating `(0, 0)` and `(1, 1)`, with reversion
  to it, gives `(5/3, 4/3)` at `δ = 1/2`, and no deviation gains for any `δ` in `(0, 1)`: a
  one-stage deviation earns `0` and then `2/3` per stage.
- Why the statement is approximate: at `δ = 3/4` the reordered cycle `(D, C)`, `(C, C)`, `(C, C)`
  gives player `0` the value `127/37`, not `120/37`, so a cycle's discounted value depends on its
  order and on `δ`, and only tends to the average.

*Needs:* 3.1, 3.2, 5.1; Mathlib `mem_convexHull_iff_exists_fintype`, `Rat.denseRange_cast`,
`tendsto_pow_atTop_nhds_zero_of_lt_one`, `tsum_geometric_of_lt_one`, `PMF.toMeasure_pure`.

### Examples

Grim trigger and a cycle with reversion in the prisoner's dilemma.

### Dependencies

3.1, 3.2; Mathlib `mem_convexHull_iff_exists_fintype`, `Rat.denseRange_cast`,
`tendsto_pow_atTop_nhds_zero_of_lt_one`, `tsum_geometric_of_lt_one`, `PMF.toMeasure_pure`.
Layers 1, 2 and 4 are not used.

## Scope and ownership

This roadmap owns two-person bargaining problems, the Nash point and the four axioms with Nash's
theorem; the bargaining payoffs, open histories, Rubinstein's shares and profile and the
uniqueness of the subgame-perfect outcome; the payoff polytope and the minmax value of a finite
game; behavioural profiles of repeated games, the product law of a stage and the law of the play
after a history; average payoffs and Nash equilibria with average payoffs, with the folk theorem;
discounted payoffs, discounted subgame perfection and the Nash-threat folk theorem.

Taken from other roadmaps:

- ExtensiveFormGames, Layer 5 (multi-stage games with observed actions): `StageProfile`, `play`
  and `IsStageSubgamePerfect` (5.1) are copied verbatim, and its continuity at infinity (5.1) and
  pure one-shot deviation principle (5.2) are used in the route of 2.2; neither is restated.
  Its objects fit Rubinstein's game, whose pure strategies may use offers from a continuum and
  whose payoffs are continuous at infinity. They do not fit Layers 3 to 5: there mixed actions at
  every history are needed (punishment at the minmax value and a stage Nash equilibrium are in
  general mixed), so a play is random and needs a law; and average payoffs are not continuous at
  infinity, so its 5.2 does not apply to them. That
  roadmap leaves behavioural strategies on infinite histories, the law of an infinite play,
  average payoffs, folk theorems and bargaining aside.
- RegretMinimizationAndEquilibria (Conventions and 3.1): `simplex`, `expectedUtility` and `IsNash`
  are copied verbatim; no theorem of it is restated. Its finite games are the stage games here.
- MarkovDecisionProcesses 6.1 (the scalar noise lemma, `ae_tendsto_zero_noise`) gives the strong
  law for martingale differences used in the route of 4.2; it is not restated. Its 1.1 builds
  the trajectory law of one decision maker's history-dependent policy from an initial state, by
  the same Ionescu-Tulcea construction. `playLaw` is a different object: there is no state, the
  law starts after an arbitrary history of the game (subgame perfection needs every history),
  and each stage's kernel is the product of the players' mixed actions. For an MDP with one
  state and actions `∀ j, A j`, and the policy whose kernels are `jointPMF` of the mixed actions
  `σ i` at the actions of the history, forgetting the state coordinate maps that trajectory law
  to `playLaw σ 0 Fin.elim0`, since the two constructions then have the same initial law and
  the same kernels; nothing here uses this.

Neighbouring roadmaps. CooperativeGames places games without transferable utility, bargaining
problems and the Nash bargaining solution outside its scope; Layer 1 here treats the last two,
and neither roadmap uses the other. InfiniteGamesAndDeterminacy studies infinite games given by a
set of winning plays; the plays of Layers 2 to 5 are infinite too, but carry real payoffs, and no
statement passes between the two.

The pinned libraries have no bargaining problems, repeated games or folk theorems. Mathlib's
Ionescu-Tulcea construction and Tau Ceti's kernels of probability mass functions are used for
the law of the play, not restated.

Not treated here: bargaining with more than two players, the Kalai–Smorodinsky solution and other
bargaining solutions; Rubinstein's game over general sets of utility pairs, with risk of
breakdown, or in behaviour strategies over a continuum of offers; the connection between
Rubinstein's shares and the Nash point as the discount factors tend to `1`; folk theorems with
public randomization, the exact discounted folk theorem without it, the folk theorem of
Fudenberg and Maskin for minmax punishment under full dimension, finitely repeated games,
imperfect monitoring and incomplete information; evolutionary folk theorems; algorithms of every
kind.

## Exact supplier contracts

### From Mathlib

- `Mathlib/Topology/Order/Compact.lean`: `IsCompact.exists_isMaxOn`,
  `IsCompact.exists_isMinOn` (a continuous real function on a nonempty compact set attains its
  maximum, its minimum).
- `Mathlib/Topology/Compactness/Compact.lean`: `IsCompact.image`.
- `Mathlib/Analysis/Convex/Basic.lean`: `Convex.add_smul_mem`, `Convex.is_linear_image`,
  `Convex.vadd`; `Mathlib/Analysis/Convex/Hull.lean`: `convexHull`;
  `Mathlib/Analysis/Convex/Combination.lean`: `mem_convexHull_iff_exists_fintype` (a point of the
  convex hull of a set is a finite convex combination of its points);
  `Mathlib/Analysis/Convex/Topology.lean`: `Set.Finite.isCompact_convexHull`.
- `Mathlib/Analysis/Convex/Integral.lean`: `Convex.integral_mem` (the expectation of an
  integrable function with values almost surely in a closed convex set lies in it);
  `Mathlib/MeasureTheory/SpecificCodomains/Pi.lean`: `MeasureTheory.eval_integral`.
- `Mathlib/Geometry/Convex/ConvexSpace/CompactSpaceStdSimplex.lean`:
  `Convexity.StdSimplex.compactSpace`; `Mathlib/Geometry/Convex/ConvexSpace/Topology.lean`:
  `Convexity.StdSimplex.isClosedEmbedding_toFun_comp_weights`.
- `Mathlib/Order/Interval/Set/ProjIcc.lean`: `Set.projIcc`; `Mathlib/Topology/UnitInterval.lean`:
  `unitInterval`.
- `Mathlib/Data/Nat/Find.lean`: `Nat.find_spec`, `Nat.find_min'` (the least natural number with a
  property); `Fin.append`.
- `Mathlib/Probability/ProbabilityMassFunction/Constructions.lean`: `PMF.ofFintype`;
  `Mathlib/Probability/ProbabilityMassFunction/Basic.lean`: `PMF.tsum_coe`, `PMF.toMeasure`;
  `Mathlib/Probability/ProbabilityMassFunction/Monad.lean`: `PMF.toMeasure_pure`; `tsum_fintype`;
  `Mathlib/Algebra/BigOperators/Ring/Finset.lean`: `Fintype.prod_sum`.
- `Mathlib/Probability/Kernel/IonescuTulcea/Traj.lean`: `Kernel.trajMeasure` (the law of the
  trajectory of a family of Markov kernels from an initial law) and
  `Kernel.map_frestrictLe_trajMeasure_compProd_eq_map_trajMeasure` (the law of the first `a + 1`
  coordinates followed by the kernel `κ a` is the law of the first `a + 2`).
- `Mathlib/MeasureTheory/Constructions/BorelSpace/Order.lean`: `Measurable.limsup`;
  `Mathlib/Probability/Process/Filtration.lean`: `MeasureTheory.Filtration.piLE` (the filtration
  whose index `t` is generated by the coordinates up to `t`) and
  `MeasureTheory.Filtration.piLE_eq_comap_frestrictLe` (that σ-algebra is the pullback by the
  restriction to the coordinates up to `t`).
- `Mathlib/Analysis/SpecificLimits/Basic.lean`: `tendsto_pow_atTop_nhds_zero_of_lt_one`,
  `tsum_geometric_of_lt_one`; `Rat.denseRange_cast`; `Finite.exists_max`; `Prod.swap`.

### From Tau Ceti

- `TauCeti/Probability/Kernel/PMF.lean`: `Kernel.ofPMF` (the Markov kernel on a countable space
  with measurable singletons whose row at `a` is the measure of the `PMF` at `a`), with its
  `IsMarkovKernel` instance, which `Kernel.trajMeasure` requires.

### From TauCetiRoadmap.ExtensiveFormGames

- 5.1: `StageProfile N A = ∀ i, (t : ℕ) → (Fin t → ∀ j, A j) → A i`; `play s t₀ h`, equal to `h`
  before stage `t₀` and to the actions of `s` from `t₀` on; `IsStageSubgamePerfect u s`: for all
  `i`, `s'`, `t₀`, `h`, `u i (play (Function.update s i s') t₀ h) ≤ u i (play s t₀ h)` (with
  `[DecidableEq N]`). All three are copied verbatim into `Suggested.lean` with the same names in
  this roadmap's namespace. Also `IsContinuousAtInfinity u`: for every `i` and `ε > 0` there is
  `T` with `|u i p − u i q| ≤ ε` whenever `p` and `q` agree before `T`.
- 5.2, the pure one-shot deviation principle: for `u` continuous at infinity, a pure profile is
  subgame perfect if and only if no player gains by changing only its action at one stage after
  one history. Used in the route of 2.2.

### From TauCetiRoadmap.RegretMinimizationAndEquilibria

- Conventions: `simplex ι = Set.range (fun p : Convexity.StdSimplex ℝ ι ↦ ⇑p.weights)`.
- 3.1: `expectedUtility u σ i = ∑_a (∏_j σ j (a j)) * u i a` and `IsNash u σ` (every `σ i` in
  `simplex (A i)`, and no `τ ∈ simplex (A i)` raises the expected utility of `i`), for players
  `N` with `[Fintype N] [DecidableEq N]` and actions with `[∀ i, Fintype (A i)]`,
  `[∀ i, Nonempty (A i)]`, `[∀ i, DecidableEq (A i)]`. All three are copied verbatim, with the
  same variable line.

### From TauCetiRoadmap.MarkovDecisionProcesses

- 6.1: `ae_tendsto_zero_noise`: for a filtration `ℱ`, step sizes `α` adapted with values in
  `[0, 1]`, noise `w t` that is `ℱ (t + 1)`-measurable and square integrable with
  `P[w t | ℱ t] = 0` and conditional second moments bounded by an almost surely bounded `B t`,
  `∑ α = ∞` and `∑ α² < ∞` almost surely, the recursion `W (t + 1) = (1 − α t) W t + α t w t`
  tends to `0` almost surely. Used with `α t = 1/(t + 1)` in the route of 4.2.

## References

- Anna R. Karlin and Yuval Peres, *Game Theory, Alive*, American Mathematical Society; the
  authors' PDF dated 13 December 2016, hosted at the University of Washington
  (homes.cs.washington.edu/~karlin/GameTheoryBook.pdf): §6.4 (Definitions 6.4.1, 6.4.7–6.4.9,
  Theorem 6.4.10 and its proof in §6.4.3) and §12.4 (Definitions 12.4.2–12.4.4, Remark 12.4.5,
  Theorem 12.4.6 with its proof); the page numbers above are those printed in that PDF.
- Mihai Manea, "Single-Deviation Principle and Bargaining", lecture slides for 14.126 Game
  Theory, MIT, Spring 2016 (dated 2 March 2016), MIT OpenCourseWare,
  ocw.mit.edu/courses/14-126-game-theory-spring-2016/resources/mit14_126s16_bargaining/; slide
  numbers as printed.
- Mihai Manea, "Repeated Games", lecture slides for the same course (dated 27 June 2016), MIT
  OpenCourseWare,
  ocw.mit.edu/courses/14-126-game-theory-spring-2016/resources/mit14_126s16_repeated/; slide
  numbers as printed. Both sets of slides are published under CC BY-NC-SA 4.0.
- Attributions made in prose, as the texts above give them: John Nash (1950) for the bargaining
  solution (Karlin–Peres, Notes to Chapter 12, p. 214; Manea, "Single-Deviation Principle and
  Bargaining", slide 20); Rubinstein (1982) for alternating offers (the same slides, slide 10);
  Friedman (1971) for the Nash-threat folk theorem, and
  Sorin (1986) and Fudenberg and Maskin (1991) for dispensing with public randomization (Manea,
  "Repeated Games", slides 7 and 14).
