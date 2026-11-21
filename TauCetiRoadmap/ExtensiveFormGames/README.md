# Roadmap: extensive-form games

**Summary.** This roadmap develops finite games in extensive form: game trees with decision
nodes, chance moves with given probabilities, and outcomes at the leaves. Decision nodes carry
information sets; the player who owns an information set moves at each of its nodes with the
same actions there, without knowing which node has been reached. A behavioural strategy puts a
probability distribution on the actions of each of the player's information sets, a pure
strategy picks one action at each, and a mixed strategy is a probability distribution on pure
strategies. Payoffs are real functions of the outcome, and every action set is finite.

The headline theorems are these.

- *Kuhn's theorem.* If no play meets an information set twice, every behavioural strategy of a
  player gives the same distribution of outcomes as the mixed strategy that draws its actions
  independently at its information sets, whatever the other players do. Under perfect recall
  (each player knows, at each of its information sets, the information sets it met before and
  the actions it took there), every mixed strategy of a player has a behavioural strategy with
  the same distribution of outcomes against every profile of the other players.
- *Behavioural equilibria.* Under perfect recall, if every information set has at least one
  action, the game has a Nash equilibrium in behavioural strategies.
- *The one-shot deviation principle.* In a finite game of perfect information, a profile of
  behavioural strategies is subgame perfect if and only if no player gains, in the subgame of a
  node where it moves, by changing its action at that node alone. In a multi-stage game with
  observed actions whose payoffs are continuous at infinity, a profile of pure strategies is
  subgame perfect if and only if no player gains by changing its action at one stage after one
  history.
- *Zermelo–Kuhn.* Every finite game of perfect information, chance moves allowed, in which every
  information set has at least one action, has a subgame-perfect equilibrium in pure strategies.

Explicit games show what fails without the main hypotheses, among them the absent-minded
driver and a zero-sum game without perfect recall that has no behavioural equilibrium.

The roadmap builds on RegretMinimizationAndEquilibria, whose existence theorem for mixed Nash
equilibria of finite normal-form games gives the behavioural equilibria here through the normal
form of the tree and Kuhn's theorem; it gives sequential games directly in sequence form and
leaves game trees with chance and information sets aside. MarkovDecisionProcesses proves
backward induction for one decision maker on a Markov state space; the backward induction here
is for several players on trees. From Mathlib it uses finite sums and products and the standard
simplex.

Layer 1 below sets up trees, payoffs, information conditions and strategies. Layer 2 proves
Kuhn's theorem in both directions, and Layer 3, which uses it, the existence of behavioural
equilibria. Layer 4 proves the one-shot deviation principle on trees and, from it,
Zermelo–Kuhn; it uses Layer 1 only. Layer 5, on infinite plays, uses no other layer.

## Conventions

- **Trees.** `GameTree H A Z` is an inductive type: a leaf carries an outcome `z : Z`; a chance
  node carries `n` branches with weights `p : Fin n → ℝ`, nonnegative with sum `1`; a decision
  node carries a label `h : H` and one child for each action `a : A h`. The information set `h`
  is the set of decision nodes labelled `h`, so its nodes share the action type `A h` and the
  player `player h`, where `player : H → N` is fixed; payoffs are `u : N → Z → ℝ`. Every tree has
  finite depth, and `[∀ h, Fintype (A h)]` makes it finitely branching. A chance node has at
  least one branch, since its weights sum to `1`; zero weights are allowed. A decision node with
  `A h` empty has no leaf below it; the statements exclude it where it matters.
- **Paths.** A step is a move `⟨h, a⟩` or the index of a chance branch. Nodes and subtrees are
  named by their paths from the root: `t.nodes` is the set of pairs (path, label) of the decision
  nodes, and `t.subtrees` the set of pairs (path, subtree), the whole tree having the empty path.
- **Chance is not a player.** Chance weights are part of the tree; strategies and deviations act
  only at decision nodes.
- **Profiles and the simplex.** A profile is `σ : ∀ h, A h → ℝ`, weights at every label, and
  player `i`'s behavioural strategy is its restriction to the labels with `player h = i`. A
  profile is valid when `σ h ∈ simplex (A h)` for every `h`, where `simplex ι` is the set of
  weight vectors of Mathlib's `Convexity.StdSimplex ℝ ι`, copied verbatim from
  RegretMinimizationAndEquilibria, Layer 1; on a finite type it is the set of nonnegative
  vectors of sum `1`. The identities of Layers 1 and 2 hold for arbitrary real weights of the
  other players, and say so.
- **Pure and mixed strategies.** A pure strategy of player `i` picks an action at each of its
  labels, including labels that do not occur in the tree; a mixed strategy is a point of
  `simplex` on the pure strategies. A player owning no label has exactly one pure strategy.
- **Outcome distributions and reach probabilities.** Strategies are compared through the
  distribution of the outcome at the leaves. Karlin and Peres compare the probabilities of
  reaching each node. The two agree on trees whose leaves carry distinct outcomes and whose
  decision nodes all have actions, as in their trees: the probability of reaching a node is the
  total probability of the leaves below it, for valid profiles, since the weights at every node
  sum to `1`. A tree can always be relabelled to have distinct outcomes, so 2.2, which holds for
  every outcome type, contains their Theorem 6.2.8. With a dead end (an empty `A h`) below a
  node, mass is lost there and the two notions differ.
- **Decidability.** `[DecidableEq N]` and `[∀ h, DecidableEq (A h)]` are standing instance
  arguments; `[DecidableEq H]` appears where a profile is updated at one label and
  `[DecidableEq Z]` where an outcome distribution is formed.

## Layer 1: game trees, payoffs and information

### 1.1 Game trees

Define `GameTree`, the steps `GameTree.Step`, the decision nodes `GameTree.nodes`, the subtrees
`GameTree.subtrees` and the outcomes at the leaves `GameTree.leaves`, as in the Conventions. The
tree is a finite rooted tree whose internal nodes belong to players or to chance, with
information sets on the players' nodes (Karlin–Peres, Definition 6.1.2, p. 115, without chance,
and Definition 6.2.2, p. 120; Manea, "Extensive Form Games", slides 2–5).

**Checks.**
- A leaf has no decision node and exactly one subtree, itself.
- The tree in which a decision node with two actions leads to two leaves has one decision node,
  with the empty path, and three subtrees.
- A chance node with weights `(1, 0)` keeps its zero-weight branch: both branches are subtrees.

*Needs:* nothing beyond the inductive type.

### 1.2 Payoffs and outcome distributions

Define `Profile H A`, `simplex` (copied verbatim, as in the Conventions), the expected payoff
`expectedPayoff u t σ` of `u : Z → ℝ` and the outcome distribution `outcomeProb t σ : Z → ℝ`, by
recursion on the tree: at a leaf `u z` and `Pi.single z 1`; at a chance node the sum over branches
weighted by `p`; at a decision node labelled `h` the sum over actions weighted by `σ h`. Prove
`expectedPayoff_eq_sum_outcomeProb`: for every `u`, `t` and every profile `σ`, valid or not,
`expectedPayoff u t σ = ∑_{z ∈ t.leaves} outcomeProb t σ z * u z`.

Route: induction on the tree, with the support fact that `outcomeProb t σ z = 0` for `z` not an
outcome at a leaf of `t`: the sum over the outcomes of `t` equals the sum over those of each
child, and linearity of the finite sums. (Proved here.)

**Checks.**
- At a leaf both sides are `u z`.
- A chance node with weights `(1, 0)` leading to the leaf `true` and to a decision node with
  leaves `false`, `true`: with `u = 1` at `true` and `0` at `false`, the expected payoff is `1` for
  every profile, since the zero-weight branch contributes nothing.
- For valid profiles the outcome distribution sums to `1` on a tree without dead ends. For the
  weights `(1, 1)` at one decision node with two leaves it has total mass `2`, and the identity
  still holds: neither side assumes valid weights.

*Needs:* Mathlib `Finset.sum_subset`, `Finset.mul_sum`, `Finset.sum_comm`, `Pi.single_apply`.

### 1.3 Experience, perfect recall, perfect information, absent-mindedness

Define the experience `experience player i π` of player `i` along a path `π`: the list of the
moves `⟨h, a⟩` of `π` with `player h = i`, in order; chance steps and the other players' moves
are dropped. This is Karlin–Peres's history `H(v)` of the information sets of `i` met and the
actions taken there (Definition 6.2.2, p. 120). Define, for a tree `t`:

- `IsPerfectRecall player t`: any two nodes of one information set `h` have the same experience
  of `player h` (Karlin–Peres, Remark 6.2.3, p. 120; Manea, "Extensive Form Games", slide 11, in
  the equivalent form that all nodes of the set are reached through the same sequence of the
  player's own actions);
- `IsPerfectInformation t`: every information set has at most one node (Karlin–Peres, Definition
  6.2.2, p. 120; Manea, slide 20);
- `IsNonAbsentMinded t`: no path to a node of an information set `h` contains a move at `h`.

Prove `IsPerfectRecall.isNonAbsentMinded`: perfect recall implies non-absent-mindedness.

Route: if the path `π` to a node of `h` contains a move `⟨h, a⟩`, the part of `π` before that
move is the path to another node of `h`; the experience of `player h` along `π` is that of the
shorter path followed by `⟨h, a⟩` and possibly more, so the two are of different lengths and
differ. (Proved here.)

**Checks.**
- The absent-minded driver (Manea, slide 17): four decision nodes in a chain, all with the same
  label and the actions "exit" and "continue"; the second node's path contains a move at the
  label, so the tree is not non-absent-minded, and the experiences of the first two nodes, the
  empty list and a list of length one, differ, so it has no perfect recall.
- The forgetful tree: one player chooses at label `0`, then at label `1` after either choice.
  It is non-absent-minded, and has no perfect recall, since the two nodes of label `1` have the
  experiences `[⟨0, false⟩]` and `[⟨0, true⟩]`.
- Matching pennies as a tree: player `0` chooses at label `0`, then player `1` chooses at label
  `1`, whose two nodes are reached by different moves of player `0`. The tree has perfect recall,
  since player `1`'s experience is empty at both nodes, and not perfect information. A definition
  comparing whole paths instead of the owner's experience would deny it perfect recall.
- Chance steps are not recalled: a chance node with weights `(1/2, 1/2)` leading to two nodes of
  one label has perfect recall, both experiences being empty.

*Needs:* Mathlib `List.filterMap_append`.

### 1.4 Strategies and Nash equilibrium

Define `deviate player i b σ`, the profile in which player `i` plays `b` at its labels and the
others play `σ`; the type `PureStrategy A player i` of pure strategies of `i`; `pureProfile s`,
the weights `Pi.single (s h) 1` of a pure profile `s : ∀ h, A h`; and `withPure player i s σ`, in
which `i` plays its pure strategy `s` and the others play `σ`. Define `IsBehaviouralNash player
t u σ`: `σ` is valid, and for every player `i` and every `b` valid at the labels of `i`,
`expectedPayoff (u i) t (deviate player i b σ) ≤ expectedPayoff (u i) t σ` (Karlin–Peres,
Corollary 6.2.9, p. 122, for the notion; Manea, slide 7, defines Nash equilibria of the extensive
form through its strategic form instead).

**Checks.**
- A player owning no label cannot deviate: `deviate player i b σ = σ` for every `b`.
- Deviations are behavioural, not only pure. In the absent-minded driver of 1.3 with payoff `1`
  at the third exit and `0` elsewhere, "always exit" has payoff `0`, and its only pure
  alternative, "always continue", also has payoff `0`; continuing with probability `2/3` has
  payoff `(2/3)² (1/3) = 4/27`. So "always exit" is not a behavioural Nash equilibrium although
  no pure strategy improves on it.
- The threat game (Manea, slides 8–9, with finite payoffs in place of Manea's): player `0`
  gives or not; player `1`, seeing the choice, explodes (payoff `−10` to both) or not; giving
  yields `(−1, 1)` and not giving `(0, 0)`. Of its `8` pure profiles exactly `3` are Nash
  equilibria, among them "give; explode only if not given", with payoffs `(−1, 1)`.

*Needs:* 1.2; Mathlib `Pi.single_apply`.

### Examples

The absent-minded driver, the forgetful tree, matching pennies as a tree and the threat game,
with their information conditions and the equilibria of the last.

### Dependencies

Mathlib `Convexity.StdSimplex`, `Finset.sum_subset`, `Finset.mul_sum`, `Finset.sum_comm`,
`Pi.single_apply`, `List.filterMap_append`; `simplex` copied from
RegretMinimizationAndEquilibria, Layer 1. No other layer.

## Layer 2: Kuhn's theorem

Throughout, `t` is a tree with `[Fintype H]` (so that pure strategies form a finite type),
`i` is a player, and `Ω(e)`, for a list `e` of moves of `i`, is the set of pure strategies `s`
of `i` with `s g = a` for every `⟨g, a⟩` in `e`.

### 2.1 Behavioural to mixed

Prove `outcomeProb_deviate_eq_sum_prod`: if `IsNonAbsentMinded t` and `b h ∈ simplex (A h)` for
every `h` with `player h = i`, then for every profile `σ` of arbitrary real weights,
`outcomeProb t (deviate player i b σ)` equals
`∑_s (∏_h b h (s h)) • outcomeProb t (withPure player i s σ)`, the sum over the pure strategies
`s` of `i` and the product over the labels of `i`. The product weights are a point of `simplex`
on the pure strategies, by `Fintype.prod_sum`. Of the validity of `b`, the route uses only that
the weights at each label of `i` sum to `1`; the simplex form is the one in which 3.1 applies
2.1.

Sources: Manea, "Extensive Form Games", slide 10, formula (1), introduces this outcome
equivalence, and slide 12, Theorem 1, states it for games with perfect recall; Karlin–Peres,
p. 121 after Definition 6.2.4, describes the induced mixed strategy, which chooses independently
at each information set. The statement here assumes only non-absent-mindedness, which it needs
(the driver below). (Proved here.)

Route: for a subtree reached by the path `π`, with `e = experience player i π`, prove by
induction on the subtree that `(∏_{⟨g, a⟩ ∈ e} b g a) • outcomeProb t' (deviate player i b σ)`
equals `∑_{s ∈ Ω(e)} (∏_h b h (s h)) • outcomeProb t' (withPure player i s σ)`.
- At a leaf, `∑_{s ∈ Ω(e)} ∏_h b h (s h) = ∏_{⟨g, a⟩ ∈ e} b g a`: the labels in `e` are distinct,
  because a path meeting a label twice would contain a move at the label before reaching a node
  of it, which non-absent-mindedness excludes; the factors of the other labels sum to `1` each
  (`Fintype.prod_sum`).
- At a chance node and at a node of another player, both sides are the same linear combination
  of the children's sides, with the weights `p` or `σ h`, since `deviate` and `withPure` agree
  with `σ` off the labels of `i`.
- At a node of `i` with label `h`, the left side is the sum over `a` of the left sides of the
  children for the experience `e ++ [⟨h, a⟩]`, and `Ω(e)` is the disjoint union over `a` of
  `Ω(e ++ [⟨h, a⟩])`, the pure strategies of `Ω(e)` with `s h = a`.
At the root `e` is empty and the claim is the theorem.

**Checks.**
- Player `i` chooses `L` or `R` at `h`; after `L` a chance node with weights `(1/2, 1/2)` leads
  to two nodes of `i`'s label `h'` with actions `c`, `d`; `R` leads to a leaf. Order the five
  leaves as first node `c`, first node `d`, second node `c`, second node `d`, then `R`. With
  `b h = (1/3, 2/3)` and `b h' = (1/4, 3/4)` both sides are `(1/24, 1/8, 1/24, 1/8, 2/3)`, the
  right side as the mixture of the pure strategies `(L, c)`, `(L, d)`, `(R, c)`, `(R, d)` with
  weights `1/12`, `1/4`, `1/6`, `1/2`.
- The sums of the weights matter: on the same tree, with a further label `g` of `i` that no node
  carries and `b g = (1, 1)`, the right side is twice the left.
- Non-absent-mindedness is needed: the absent-minded driver has two pure strategies, with
  outcome distributions the first exit and "past the fourth exit", so every mixed strategy puts
  mass `0` on the third exit; continuing with probability `2/3` gives the distribution
  `(1/3, 2/9, 4/27, 8/81, 16/81)` on the four exits and "past the fourth", with mass `4/27` on the
  third.
- On a leaf both sides are `Pi.single z 1`; a player owning no label has one pure strategy and an
  empty product `1`.

*Needs:* 1.2, 1.3; Mathlib `Fintype.prod_sum`, `Finset.mul_sum`, `Finset.sum_comm`,
`Finset.sum_fiberwise`, `Pi.single_apply`, `List.filterMap_append`,
`Convexity.StdSimplex.range_toFun_comp_weights`.

### 2.2 Mixed to behavioural

Prove `exists_behavioural_outcomeProb_eq`: if `IsPerfectRecall player t` and `μ` is a mixed
strategy of `i` (a point of `simplex` on its pure strategies), there is `b`, valid at the labels
of `i`, such that for every profile `σ` of arbitrary real weights
`outcomeProb t (deviate player i b σ) = ∑_s μ s • outcomeProb t (withPure player i s σ)`. One `b`
serves against every profile of the others.

(Karlin–Peres, Theorem 6.2.8 with its proof, pp. 121–122, with Definitions 6.2.4 and 6.2.6 and
Remark 6.2.7, p. 121; Manea, "Extensive Form Games", slides 12–13, Theorem 1 and formula (2),
with proof.) Karlin–Peres's trees (Definition 6.1.2) have no chance moves, and they compare
reach probabilities against the other players' strategies; the statement here allows chance,
compares outcome distributions (see the Conventions) and holds for arbitrary real weights of the
others. It is proved here along the sources' construction.

Route: for a label `h` of `i` that occurs in `t`, let `e_h` be the experience of `i` at any node
of `h`, well defined by perfect recall, and set
`b h a = μ(Ω(e_h ++ [⟨h, a⟩])) / μ(Ω(e_h))` when the denominator is positive; at other labels of
`i`, and when it is `0`, let `b h` be any point of `simplex (A h)`, which is nonempty because
`PureStrategy A player i` is. The sets `Ω(e_h ++ [⟨h, a⟩])` partition `Ω(e_h)` by the value
`s h`, so `b h ∈ simplex (A h)`, and `μ(Ω(e_h)) · b h a = μ(Ω(e_h ++ [⟨h, a⟩]))` for every `a`,
both sides being `0` when `μ(Ω(e_h)) = 0`. For a subtree reached by `π`, with
`e = experience player i π`, prove by induction on the subtree that
`μ(Ω(e)) • outcomeProb t' (deviate player i b σ)` equals
`∑_{s ∈ Ω(e)} μ s • outcomeProb t' (withPure player i s σ)`. Leaves, chance nodes and nodes of
other players are as in 2.1; at a node of `i` with label `h`, perfect recall gives `e = e_h`, and
the identity above with the partition of `Ω(e)` by `s h` gives the step. At the root,
`μ(Ω([])) = 1`.

Along `e_h ++ [⟨h, a⟩]`, for `h` occurring in `t`, the product of the weights `b` telescopes to
`μ(Ω(e_h ++ [⟨h, a⟩]))`, the realization plan of `μ`.

**Checks.**
- On the tree of 2.1, `μ = 1/2 (L, c) + 1/2 (R, d)` gives `b h = (1/2, 1/2)` and `b h' = (1, 0)`,
  and both sides are `(1/4, 0, 1/4, 0, 1/2)`. The marginal weights `(1/2, 1/2)` of `μ` at `h'` in
  place of the conditional ones give `(1/8, 1/8, 1/8, 1/8, 1/2)`.
- Perfect recall is needed: in the forgetful tree of 1.3, `μ = 1/2 (false, false) + 1/2 (true,
  true)` has outcome distribution `1/2` at `(false, false)` and at `(true, true)`. For any real
  weights `b`, the outcome `(a, c)` has mass `b 0 a · b 1 c`, so the masses of `(false, false)`
  and `(true, true)` multiply to that of `(false, true)` times that of `(true, false)`; but
  `1/4 ≠ 0`.
- Validity of `μ` is needed: if `i` owns one label, at the root of a tree whose two children are
  leaves, `μ = (2, −1)` gives the mass `−1` to a leaf, which no valid `b` does.

*Needs:* 1.2, 1.3; Mathlib `Finset.sum_fiberwise`, `Finset.mul_sum`, `Finset.sum_comm`,
`Pi.single_apply`, `List.filterMap_append`, `Convexity.StdSimplex.range_toFun_comp_weights`.

### Examples

The tree of 2.1 in both directions; the forgetful tree and the absent-minded driver as the two
failures.

### Dependencies

1.2 and 1.3; Mathlib `Fintype.prod_sum`, `Finset.mul_sum`, `Finset.sum_comm`,
`Finset.sum_fiberwise`, `Pi.single_apply`, `List.filterMap_append`,
`Convexity.StdSimplex.range_toFun_comp_weights`.

## Layer 3: behavioural equilibria under perfect recall

### 3.1 Existence

Prove `exists_isBehaviouralNash`: if `A h` is nonempty for every `h` and `IsPerfectRecall player
t`, then for every `u` there is a profile `σ` with `IsBehaviouralNash player t u σ`. Neither the
players nor the labels need to form a finite type. (Karlin–Peres, Corollary 6.2.9, p. 122, stated
after Theorem 6.2.8 without a separate proof; Remark 6.2.5, p. 121, for the mixed equilibrium of
the normal form; Manea, "Extensive Form Games", slides 7 and 18.) The deduction is proved here.

Route.
- Restriction to the labels of `t`. The labels of the decision nodes of `t` form a finite set
  `L`, by induction on the tree. The same tree over the label type `L` has the same expected
  payoffs and outcome distributions for the restricted profiles, and has perfect recall; a
  profile on `L` extends to `H` by `Pi.single` at a chosen action outside `L`, and payoffs in `t`
  do not depend on weights at labels outside `L`, by induction on the tree.
- The normal form. The players owning a label in `L` form a finite set `P` (Mathlib
  `Set.fintypeRange`); player `p ∈ P` has the finite nonempty type of pure strategies over `L`
  (decidable equality by `Fintype.decidablePiFintype`), and the payoff of a pure profile is
  `expectedPayoff (u p) t` at the pure profile it assembles. RegretMinimizationAndEquilibria 3.1,
  `exists_isNash`, gives a mixed equilibrium `μ` of this finite game, in the sense of its
  `IsNash` and `expectedUtility`.
- Behavioural strategies. For each `p ∈ P`, 2.2 applied to `μ p` gives `b p`; set
  `σ h = b (player h) h` on `L`, and the chosen points elsewhere. Then `σ` is valid.
- Payoffs. By 1.2 payoffs are sums against outcome distributions. Applying 2.2 to one player of
  `P` after another, at profiles in which some players already play pure strategies (2.2 holds
  for every profile of the others), gives `expectedPayoff (u i) t σ = expectedUtility … μ i`.
- Deviations. For `i ∈ P` and `b'` valid at the labels of `i`, 2.1 (with 1.3 for
  non-absent-mindedness) turns `deviate player i b' σ` into the product mixed strategy `τ` of
  `b'`, a point of `simplex`; expanding the others as before,
  `expectedPayoff (u i) t (deviate player i b' σ)` is the expected utility of
  `Function.update μ i τ`, which `IsNash` bounds by that of `μ`. A player outside `P` owns no
  label of `t`, and its deviations do not change the payoff.

**Checks.**
- Matching pennies as a tree (1.3) has perfect recall and no pure Nash equilibrium; its only
  behavioural Nash equilibrium plays `(1/2, 1/2)` at both labels.
- Perfect recall is needed. Player `0` chooses `a` at label `0`, player `1` chooses `b` at label
  `1` without seeing `a`, then player `0` chooses `c` at label `2`, having forgotten `a` and not
  seeing `b`; player `0` receives `1` and player `1` pays `1` if `b = c ≠ a`, and both receive `0`
  otherwise. The tree is non-absent-minded and has no perfect recall. With `p`, `r`, `q` the
  probabilities of `true` at the three labels, player `0`'s payoff is
  `f = (1 − p) r q + p (1 − r)(1 − q)`. Against any `r`, player `0` obtains `max(r, 1 − r) ≥ 1/2`
  with `(p, q) = (0, 1)` or `(1, 0)`; against any `(p, q)`, player `1` holds `f` to
  `min(p (1 − q), (1 − p) q) ≤ 1/4` with `r = 0` or `r = 1`, since the product of the two is
  `p (1 − p) q (1 − q) ≤ 1/16`. At an equilibrium `f` would be at least `1/2` and at most `1/4`,
  so there is no behavioural Nash equilibrium.
- Nonempty action sets are needed: with `H` a point, `A` of it empty and `t` a leaf, `simplex`
  of the empty type is empty and there is no valid profile.
- On a leaf every valid profile is an equilibrium; with one player the theorem gives a
  behavioural strategy of largest payoff.

*Needs:* 1.2, 1.3, 1.4, 2.1, 2.2; RegretMinimizationAndEquilibria 3.1 (`exists_isNash`, `IsNash`,
`expectedUtility`); Mathlib `Set.fintypeRange`, `Fintype.decidablePiFintype`, `Fintype.prod_sum`,
`Pi.single_apply`, `Convexity.StdSimplex.range_toFun_comp_weights`.

### Examples

Matching pennies as a tree; the zero-sum game with a forgetful player.

### Dependencies

Layers 1 and 2; RegretMinimizationAndEquilibria 3.1; Mathlib `Set.fintypeRange`,
`Fintype.decidablePiFintype`, `Fintype.prod_sum`, `Pi.single_apply`,
`Convexity.StdSimplex.range_toFun_comp_weights`.

## Layer 4: subgame perfection and backward induction

### 4.1 Subgames and one-shot deviations

Define `IsSubgamePerfect player t u σ`: for every subtree `t'` of `t`, reached by `π`, such that
every node of `t` whose label occurs in `t'` has a path extending `π` (no information set
crosses the root of `t'`), `IsBehaviouralNash player t' u σ` holds. Profiles are indexed by
labels, so the restriction of `σ` to the subgame is `σ` itself, and the whole tree is a subgame
(Manea, "Extensive Form Games", slide 26, Definition 1, and slide 28, Definition 2;
Karlin–Peres, p. 120: subgames do not split information sets). Define
`IsOneShotUnimprovable player t u σ`: at every decision node of `t`, with label `h`, and for
every action `a`, the player `player h` does not gain in the subtree of that node from
`Function.update σ h (Pi.single a 1)`, the profile that plays `a` at `h` and agrees with `σ`
elsewhere (Manea, "Single-Deviation Principle and Bargaining", slide 3, Definition 1, for
multi-stage games).

**Checks.**
- The threat game of 1.4: "give; explode only if not given" is a Nash equilibrium and not subgame
  perfect, since in the subgame after not giving, exploding gives player `1` the payoff `−10`
  instead of `0`; of the `8` pure profiles only "do not give; never explode" is subgame perfect
  (Manea, slide 9, counts three pure Nash equilibria, one subgame perfect). The same profile
  fails one-shot unimprovability at that node. Karlin–Peres, Example 6.1.4, p. 116, is a second
  instance.

*Needs:* 1.1, 1.4.

### 4.2 The one-shot deviation principle on trees

Prove `isSubgamePerfect_iff_isOneShotUnimprovable`: if `IsPerfectInformation t` and `σ` is
valid, then `IsSubgamePerfect player t u σ ↔ IsOneShotUnimprovable player t u σ`. Profiles are
behavioural and the one-shot deviations are to pure actions; deviations to mixed actions at one
node follow by linearity.

Source: Manea, "Single-Deviation Principle and Bargaining", slides 3–8, Definition 1, Theorem 1
and its proof, for multi-stage games with observed actions (Layer 5); the form for trees with
chance and behavioural strategies is proved here.

Route.
- Label locality: `expectedPayoff u t σ = expectedPayoff u t σ'` when `σ` and `σ'` agree at the
  labels of the decision nodes of `t`, by induction on the tree. Under perfect information the
  label of a node does not occur below it, and distinct children have disjoint sets of labels.
- (→) Under perfect information every subtree is a subgame: a label occurring in the subtree
  at the path `ρ` occurs in `t` only at `π ++ ρ`. At a node labelled `h`, the one-shot deviation
  to `a` is `deviate player (player h) b σ` with `b = Function.update σ h (Pi.single a 1)`, valid
  at the labels of `player h`, so the Nash inequality in that subgame is the one-shot inequality.
- (←) Fix a player `i` and `b` valid at its labels, and prove by induction on subtrees that `i`
  does not gain in any subtree from `deviate player i b σ`; this gives the Nash inequality in
  every subgame. At a chance node, or a node of another player, the weights there are the same
  under both profiles and nonnegative, and the induction hypothesis applies to each child. At a
  node of `i` labelled `h`, with `v_a(·)` the payoff of `i` in the child of `a` and `v(σ)` its
  payoff at the node: `v_a(σ)` is, by label locality, the payoff at the node of the one-shot
  deviation to `a`, so `v_a(σ) ≤ v(σ)`, and since `b h` is nonnegative of sum `1`,
  `∑_a b h a · v_a(deviation) ≤ ∑_a b h a · v_a(σ) ≤ v(σ)`.

**Checks.**
- Perfect information is needed for (→), even under perfect recall. A chance node with weights
  `(1/2, 1/2)` leads to two nodes of one label `h` of a single player, with
  actions `L`, `R`; the payoffs are `1`, `0` at the first node and `0`, `3` at the second. The tree
  has perfect recall. Its subgames are the whole tree and the four leaves, five of its seven
  subtrees, since no other subtree contains both nodes of `h`. For the weights `(x, 1 − x)`
  at `h`, the payoff is `x/2 + 3 (1 − x)/2`, so `σ` is subgame perfect exactly for `x = 0` (pure
  `R`, payoff `3/2`); one-shot unimprovability asks `1 ≤ x` at the first node and `3 ≤ 3 (1 − x)`
  at the second, so no profile satisfies it. In particular pure `R` is subgame perfect, and
  playing `L` at the first node alone gains `1 > 0` there.
- Perfect information is needed for (←) too, once a label repeats along a path. In the
  absent-minded driver of 1.4 (payoff `1` at the third exit), "always exit" is one-shot
  unimprovable: at the third node it already earns `1`, and at the other nodes both pure
  actions give `0` in the subtree, as it does. It is not subgame perfect, since the whole tree
  is a subgame and continuing with probability `2/3` earns `4/27 > 0` there.
- Validity is needed: on a leaf with weights `(2, 0)` at a label that does not occur, the tree
  has no decision node, so one-shot unimprovability holds, while subgame perfection fails because
  `IsBehaviouralNash` requires valid weights.
- On the threat game the equivalence holds profile by profile: the threat profile fails both
  sides, "do not give; never explode" satisfies both.

*Needs:* 1.1, 1.3, 1.4, 4.1; Mathlib `Function.update_self`, `Function.update_of_ne`,
`Finset.sum_le_sum`, `Finset.sum_mul`, `List.prefix_append`,
`Convexity.StdSimplex.range_toFun_comp_weights`.

### 4.3 Zermelo–Kuhn

Prove `exists_pure_isSubgamePerfect`: if `A h` is nonempty for every `h` and
`IsPerfectInformation t`, then for every `u` there is a pure profile `s : ∀ h, A h` with
`IsSubgamePerfect player t u (pureProfile s)`. Chance moves are allowed.

Sources: Karlin–Peres, Theorem 6.1.7, p. 118, for trees without chance, whose proof is left
there as Exercise 6.a; Manea, "Extensive Form Games", slide 20, Theorem 2 (backward induction
gives a pure Nash equilibrium), and slide 28 (subgame perfection coincides with backward
induction under perfect information, stated without proof). (Proved here.)

Route: by induction on the tree, build `s` such that `pureProfile s` is one-shot unimprovable,
then apply 4.2 (←); `pureProfile s` is valid since `Pi.single a 1 ∈ simplex`.
- At a leaf any `s` serves; `Nonempty (A h)` gives a choice at every label.
- At a chance node or a decision node, take the profiles of the children given by induction
  and glue them: under perfect information the children's label sets are disjoint and do not
  contain the label of the node, and by label locality (4.2) each child keeps its payoffs, so
  one-shot unimprovability inside the children is kept.
- At a decision node labelled `h`, choose an action `a*` maximizing the payoff of `player h` in
  the child of `a` under the glued profile (Mathlib `Finite.exists_max`), and set `s h = a*`. The
  one-shot deviation to `a` at the node has the payoff of the child of `a`, by label locality,
  which is at most that of `a*`.

**Checks.**
- The threat game: the construction gives "do not give; never explode", the unique pure
  subgame-perfect equilibrium of 4.1.
- Perfect information is needed: matching pennies as a tree (1.3) has no pure Nash equilibrium,
  and the whole tree is a subgame.
- Nonempty action sets are needed: with `H` a point and `A` of it empty there is no pure profile,
  even on a leaf.
- Ties and zero-weight chance branches: with all payoffs equal every pure profile is subgame
  perfect; after a chance branch of weight `0` the construction still optimizes, as subgame
  perfection requires.

*Needs:* 1.1, 1.3, 1.4, 4.2; Mathlib `Finite.exists_max`, `Function.update_self`,
`Function.update_of_ne`, `Convexity.StdSimplex.range_toFun_comp_weights`.

### Examples

The threat game and matching pennies as a tree; the chance tree with one non-singleton
information set, where the one-shot test and subgame perfection come apart.

### Dependencies

1.1, 1.3, 1.4; Mathlib `Function.update_self`, `Function.update_of_ne`, `Finset.sum_le_sum`,
`Finset.sum_mul`, `Finite.exists_max`, `List.prefix_append`,
`Convexity.StdSimplex.range_toFun_comp_weights`. Layers 2 and 3 are not used.

## Layer 5: multi-stage games with observed actions

### 5.1 Plays, continuity at infinity and one-shot deviations

Players form a type `N` with decidable equality, and player `i` has an action type `A i`, of any
cardinality. At each stage `t = 0, 1, 2, …` every player chooses an action, knowing the history
of action profiles of the stages before `t`. Define:

- `StageProfile N A`, the pure strategy profiles: player `i`'s action at stage `t` as a function
  of the history `Fin t → ∀ j, A j`;
- `play s t₀ h`, the play from the history `h` of length `t₀`: `h` at the stages `t < t₀`, and from
  stage `t₀` on the actions of `s` given the play up to each stage;
- `IsContinuousAtInfinity u` for payoffs `u : N → (ℕ → ∀ j, A j) → ℝ` on plays: for every `i` and
  `ε > 0` there is `T` with `|u i p − u i q| ≤ ε` whenever `p` and `q` agree at the stages `< T`
  (Manea, "Single-Deviation Principle and Bargaining", slide 4, Definition 2);
- `IsStageSubgamePerfect u s`: after every history `h`, no player `i` gains by replacing its
  strategy with any `s'`;
- `IsStageOneShotUnimprovable u s`: after every history `h` of length `t₀`, no player gains by
  changing only its stage-`t₀` action, to any `a`.

Every play is infinite. A game that ends, such as alternating-offer bargaining after an
acceptance, is encoded by payoffs that do not depend on the play after the end, and action sets
that depend on the history by one action type for all histories whose unused coordinates the
payoffs ignore (in bargaining, an offer and an answer for each player at every stage). The
one-shot change replaces the stage-`t₀` action after every history of length `t₀`; from `h`, no
other history of that length is reached.

**Checks.**
- `play s 0 h` is the play of `s` from the start, and at stage `t₀` the play from `h` is the
  profile `fun i ↦ s i t₀ h`.
- Discounted payoffs `u i p = (1 − δ) ∑_t δ^t g i (p t)` with `0 ≤ δ < 1` and `|g i| ≤ M` are
  continuous at infinity: plays agreeing before `T` have payoffs within `2 M δ^T`. Payoffs that
  depend only on the stages `< T` are continuous at infinity with that `T`.
- The payoff `1` if every action is `true` and `0` otherwise, for one player with actions
  `true`, `false`, is not continuous at infinity: the play that is `true` throughout and the one
  that switches to `false` at stage `T` agree before `T` and differ by `1`.

*Needs:* nothing beyond the definitions.

### 5.2 The one-shot deviation principle, infinite horizon

Prove `isStageSubgamePerfect_iff`: if `u` is continuous at infinity, a pure profile `s` is
subgame perfect if and only if it is one-shot unimprovable. Any set of players and any action
types are allowed.

Source: Manea, "Single-Deviation Principle and Bargaining", slides 5–8, Theorem 1 and its proof,
for finitely many players and behaviour strategies; the statement for pure strategies against
pure deviations and any set of players is proved here along the same truncation argument.

Route. (→) A one-shot change is a deviation. (←) Suppose player `i` gains `ε > 0` from `s'` after
the history `h` of length `t₀`.
- Prefix lemma: for `t₁ ≥ t₀`, `play s t₀ h` equals the play of `s` from its own first `t₁`
  stages, by strong induction on the stage.
- Truncation: take `T` from continuity at infinity for `ε/2` and `T' = max T (t₀ + 1)`; the
  strategy that follows `s'` at the stages `< T'` and `s i` from `T'` on produces a play from `h`
  that agrees with that of `s'` before `T'`, so `i` still gains at least `ε/2`.
- Backward replacement: for `k` from `T'` down to `t₀ + 1`, replace the stage-`(k − 1)` actions
  by those of `s i`. From `h` the play reaches one history of length `k − 1`, where the two
  strategies differ by a one-shot change; by the prefix lemma and one-shot unimprovability at that
  history, the payoff of `i` does not decrease. After the last step the strategy agrees with
  `s i` at every stage from `t₀` on, and its play from `h` is that of `s`, a contradiction.

**Checks.**
- Continuity at infinity is needed: for the payoff of the last Check of 5.1 and `s` = "always
  `false`", every one-shot change after every history leaves infinitely many `false` stages, with
  payoff `0 ≤ 0`, while "always `true`" gains `1` from the empty history.

*Needs:* 5.1; Mathlib `abs_sub_le`, `Function.update_self`, `Function.update_of_ne`.

### Examples

Discounted repeated payoffs as payoffs continuous at infinity; the payoff "always `true`" as the
failure of the principle without it.

### Dependencies

5.1; Mathlib `abs_sub_le`, `Function.update_self`, `Function.update_of_ne`. No other layer.

## Scope and ownership

This roadmap owns finite game trees with chance moves and information sets as defined above,
their payoffs and outcome distributions, experience, perfect recall, perfect information and
non-absent-mindedness; behavioural, pure and mixed strategies on trees and behavioural Nash
equilibria; Kuhn's theorem in both directions; the existence of behavioural equilibria under
perfect recall; subgames, subgame perfection and the one-shot deviation principle on trees;
Zermelo–Kuhn; and, for multi-stage games with observed actions, pure strategy profiles, plays,
continuity at infinity and the pure one-shot deviation principle.

Taken from other roadmaps:

- RegretMinimizationAndEquilibria 3.1 (Nash equilibria of finite games) states `exists_isNash`, the
  existence of a mixed Nash equilibrium of a finite normal-form game; it is consumed by the route of
  3.1 above and not restated. On a tree in which the players move one after another, each at a
  single information set containing all its nodes, 3.1 here gives back that theorem: it extends that
  theorem to trees, and its route reduces to it. Its `simplex` (1.1) is copied verbatim. Its 4.1
  (tree-form sequential decision processes) is about one player's decision process given by a parent
  map, whose decision points play the part of information sets and in which chance and the other
  players appear only through the branching of observations, and identifies the sequence-form
  polytope with the sequence forms of behavioural strategies. Kuhn's theorem here (2.1, 2.2) is
  about game trees with chance, several players and information sets, mixed strategies over pure
  strategies, and equality of outcome distributions against every profile of the others; its route
  does not use 4.1. The products of the weights of the behavioural strategy built in 2.2 along a
  player's experience are the masses of the realization plan of the mixed strategy (a remark there);
  no statement here is in sequence form. Its scope places game trees with chance nodes and
  information partitions, and equilibrium refinements, outside it.
- MarkovDecisionProcesses 2.1 (backward induction) optimizes one decision maker's return on a
  Markov state space. Zermelo–Kuhn and the one-shot deviation principle here are equilibrium
  statements for several players on trees; a one-player tree is a finite-horizon problem on
  histories, but no route here consumes 2.1.

Neighbouring roadmap: InfiniteGamesAndDeterminacy owns Gale–Stewart games, in which two players
alternately choose elements of a set `X` forever and player I wins when the play lies in a given
set of sequences, and their determinacy; its 1.2 (`isDetermined_of_isClosed`) and 1.3
(`isDetermined_of_isOpen`) give the determinacy of closed and of open sets. On a tree with two
players, no chance moves and, at each leaf, payoff `1` for one player and `0` for the other, 4.3
gives a pure subgame-perfect profile; the whole tree is a subgame, so the player whose payoff is
`1` under that profile wins against every pure strategy of the other. This is the determinacy of
finite win–lose games of perfect information. Encoded on sequences, with `X` containing every
action, a move of the other player inserted wherever one player moves twice in a row, a loss for
the first player to make an illegal move and arbitrary moves after a leaf, the winning set
depends only on a bounded number of positions, so it is open and closed and 1.2 makes it
determined. It is the same fact under this encoding; no statement transfers formally, since the
trees, plays and strategies of the two roadmaps are different objects. Layer 5 is no closer:
it proves no existence theorem, and a `0`–`1` payoff is continuous at infinity only when it
depends on a bounded number of stages, which the payoff of the last Check of 5.1, the indicator
of a closed set, does not.
Neither roadmap uses the other.

The pinned libraries have no game trees, extensive forms, subgames or behavioural strategies.
Tau Ceti's Ehrenfeucht–Fraïssé strategies (`TauCeti/ModelTheory/BackAndForth/Game/`) are
strategies for back-and-forth games of model theory and are unrelated.

Not treated here: behavioural strategies on infinite histories, the law of an infinite play,
and the one-shot deviation principle for behavioural strategies in infinite-horizon games;
multi-stage games with simultaneous moves on the tree carrier; average payoffs of repeated
games, folk theorems and public randomization; bargaining; sequential equilibrium, beliefs and
other refinements; the planning paradox of the absent-minded driver; reduced normal forms as
objects of study and the translation of trees into sequence form; Kuhn poker as a tree; infinite
action sets on trees; algorithms of every kind (backward induction is a proof here, not a
target).

## Exact supplier contracts

### From Mathlib

- `Mathlib/Geometry/Convex/ConvexSpace/Defs.lean`: `Convexity.StdSimplex ℝ ι` (weights,
  nonnegative and of total `1`), and `Convexity.StdSimplex.range_toFun_comp_weights` (on a finite
  type, the set of weight vectors is the set of nonnegative vectors of sum `1`), which puts
  `Pi.single a 1` and the product weights of 2.1 in `simplex`.
- `Mathlib/Algebra/BigOperators/Ring/Finset.lean`: `Fintype.prod_sum` (a product over a finite
  type of finite sums is the sum over choice functions of the products), `Finset.mul_sum`,
  `Finset.sum_mul`.
- `Mathlib/Algebra/BigOperators/Group/Finset/Sigma.lean`: `Finset.sum_comm`.
  `Mathlib/Algebra/BigOperators/Group/Finset/Basic.lean`: `Finset.sum_subset` (a sum over a
  larger set whose extra terms vanish is unchanged), `Finset.sum_fiberwise` (a sum split along
  the fibres of a map).
- `Mathlib/Algebra/Order/BigOperators/Group/Finset.lean`: `Finset.sum_le_sum` (termwise
  inequality of finite sums).
- `Mathlib/Algebra/Notation/Pi/Basic.lean`: `Pi.single_apply`.
- `Mathlib/Logic/Function/Basic.lean`: `Function.update_self`, `Function.update_of_ne`.
- `Mathlib/Data/Fintype/Lattice.lean`: `Finite.exists_max` (a real function on a finite
  nonempty type attains its maximum).
- `Mathlib/Data/Set/Finite/Range.lean`: `Set.fintypeRange` (the range of a map from a finite
  type, with decidable equality on the target, is finite).
- `Mathlib/Data/Fintype/Defs.lean`: `Fintype.decidablePiFintype` (decidable equality of
  functions on a finite type).
- `Mathlib/Algebra/Order/Group/Abs.lean`: `abs_sub_le` (the triangle inequality for `|a − c|`).
- Lean core `Init/Data/List/Lemmas.lean`: `List.filterMap_append`; `Init/Data/List/Sublist.lean`:
  `List.prefix_append` (a list is a prefix of its extensions), for the prefix relation `<+:`.

### From TauCetiRoadmap.RegretMinimizationAndEquilibria

- 1.1: `simplex ι = Set.range (fun p : Convexity.StdSimplex ℝ ι ↦ ⇑p.weights)`, copied verbatim
  into `Suggested.lean` (same name in this roadmap's namespace, same body).
- 3.1 (Nash equilibria): for players `N` with `[Fintype N] [DecidableEq N]` and action types
  `A i` with `[∀ i, Fintype (A i)] [∀ i, Nonempty (A i)] [∀ i, DecidableEq (A i)]`,
  `expectedUtility u σ i = ∑_a (∏_j σ j (a j)) * u i a`; `IsNash u σ`, that is,
  `σ i ∈ simplex (A i)` for every `i` and
  `expectedUtility u (Function.update σ i τ) i ≤ expectedUtility u σ i` for every `i` and every
  `τ ∈ simplex (A i)`; and `exists_isNash`: every such game has a profile with
  `IsNash u σ`. Used in the route of 3.1 above, on the normal form of the tree restricted to its
  labels; no statement of `Suggested.lean` mentions these names.

## References

- Anna R. Karlin and Yuval Peres, *Game Theory, Alive*, American Mathematical Society; the
  authors' PDF dated 13 December 2016, hosted at the University of Washington
  (homes.cs.washington.edu/~karlin/GameTheoryBook.pdf), Chapter 6; the page numbers above are
  those printed in that PDF.
- Mihai Manea, "Extensive Form Games", lecture slides for 14.126 Game Theory, MIT, Spring 2016
  (dated 2 March 2016), MIT OpenCourseWare,
  ocw.mit.edu/courses/14-126-game-theory-spring-2016/resources/mit14_126s16_extensive/; slide
  numbers as printed.
- Mihai Manea, "Single-Deviation Principle and Bargaining", lecture slides for the same course
  (dated 2 March 2016), MIT OpenCourseWare,
  ocw.mit.edu/courses/14-126-game-theory-spring-2016/resources/mit14_126s16_bargaining/; slide
  numbers as printed.
- Attributions made in prose, as the texts above give them: Ernst Zermelo (1913) and Harold W.
  Kuhn (1953) for backward induction in games of perfect information, and Kuhn (1953) for the
  equivalence of mixed and behavioural strategies under perfect recall (Karlin–Peres, Notes to
  Chapter 6, p. 134; Manea, slides 12 and 20); Reinhard Selten (1965) for subgame perfection
  (Karlin–Peres, p. 134); Piccione and Rubinstein (1997) for the absent-minded driver (Manea,
  slide 17).
