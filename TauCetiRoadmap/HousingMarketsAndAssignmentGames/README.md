# Roadmap: housing markets and assignment games

**Summary.** Two markets for indivisible goods are treated here. In a housing market each of
finitely many agents owns one house and ranks all the houses strictly; no money changes hands.
An allocation gives every agent one house, and it is in the strict core when no group of agents
can reallocate their own houses so that nobody in the group is worse off and somebody is better
off. In an assignment game finitely many buyers face finitely many sellers, each seller owning
one house; buyer `i` values the house of seller `j` at a real number `v i j`, and money can be
transferred. An outcome matches buyers to sellers and splits the value of every matched pair
into nonnegative payoffs of the buyer and the seller; it is in the core when no buyer and seller
could both do better by trading with each other. Values may be negative, and the numbers of
buyers and sellers may differ.

The main theorems are these.

- *Top trading cycles.* The strict core of a housing market consists of exactly one allocation.
  An allocation is in it exactly when the agents can be sorted into rounds, each round trading
  only among its members, so that every agent receives its favourite among the houses of its own
  and later rounds.
- *Strategy-proofness.* No agent obtains a house it strictly prefers by misreporting its
  ranking, when the others report theirs and the strict-core allocation is used.
- *The core of the assignment game (Shapley and Shubik).* An outcome is in the core if and only
  if its matching has the largest total value and its payoffs form a cover of least total, a
  cover being a pair of nonnegative payoff vectors with `v i j ≤ u i + p j` for all `i`, `j`.
  Every matching of largest value carries a core outcome.
- *Prices and the lattice.* The seller payoffs of core outcomes are exactly the prices of the
  competitive (Walrasian) equilibria. Covers of least total are closed under taking the larger
  buyer payoffs with the smaller seller payoffs, and conversely. In the core every buyer gets at
  most its marginal contribution, the value of the game minus the value without that buyer, and
  one core outcome gives every buyer exactly that; symmetrically for sellers.

The roadmap builds on Mathlib's partial bijections and Hall's marriage theorem, and on
Egerváry's theorem, MinimumCostFlowsAndWeightedBipartiteMatching 2.2: the largest weight of a
matching equals the least total of a weighted cover. That roadmap owns the weight of a matching
and weighted covers, and its theorem for real values is used in the proofs of 2.2, 2.3 and 3.3
without being restated here. The core of a coalitional game, developed in CooperativeGames, is a
different object from the core outcomes here, which carry a matching.

Layer 1 treats housing markets and is independent of the rest. Layer 2 characterizes the core of
the assignment game. Layer 3 uses Layer 2 to identify the core with the competitive equilibria
and to prove the lattice property and the formulas for the two extreme core points.

## Conventions

- **Housing markets.** The agents form a finite type `ι` (`[Fintype ι]`); agent `i` owns the
  house called `i`. A housing market is `HousingMarket ι`: for each agent `i` a relation
  `prefers i` on houses which is a strict total order (Mathlib's `IsStrictTotalOrder`), with
  `prefers i a b` read "agent `i` strictly prefers house `a` to house `b`". Preferences are
  strict throughout: no agent is indifferent between two houses. An allocation is a permutation
  `π : Equiv.Perm ι`, agent `i` receiving house `π i`, the house owned by agent `π i`.
- **Coalitions.** A coalition is a `Finset ι`. A reallocation within a coalition `A` is a
  permutation `σ` of `ι` mapping `A` into `A`; its values outside `A` play no role. Since `A` is
  finite, `σ` restricted to `A` is a permutation of `A`, and every permutation of `A` arises so.
- **Assignment games.** Buyers form a finite type `ι` and sellers a finite type `κ`; either may
  be empty, and they need not have the same number of elements. The values are any real
  `v : ι → κ → ℝ`. A matching is a partial bijection `M : ι ≃. κ` (Mathlib's `PEquiv`): `M i` is
  `some j` when buyer `i` is matched to seller `j` and `none` when `i` is unmatched, and
  `M.symm j` is the buyer matched to `j`, if any. The empty matching always exists. Buyer payoffs
  are `u : ι → ℝ` and seller payoffs (prices) `p : κ → ℝ`; vectors are ordered coordinatewise,
  and `u ⊔ u'`, `u ⊓ u'` are the coordinatewise maximum and minimum.
- **The value of the game.** `assignmentValue v` is the supremum in `ℝ` of the weights of all
  matchings. There are finitely many matchings and at least one, so this supremum is a largest
  weight; for an empty type of buyers or sellers it is `0`. (Mathlib has no `Finite` instance for
  `ι ≃. κ`; finiteness follows from the injectivity of the coercion to `ι → Option κ` by
  `Finite.of_injective`.) Removing buyer `i` is modelled by
  `Function.update v i 0`, the values with row `i` replaced by zeros; with partial matchings this
  has the value of the game without buyer `i`. Removing seller `j` is
  `fun i ↦ Function.update (v i) j 0`.
- **Source conventions.** Karlin and Peres take as many buyers as sellers and nonnegative values,
  use perfect matchings except in their definition of an outcome (§17.5), and call the core
  outcomes by another name. Their reduction of the general
  case (zero rows or columns for missing agents, and the positive part of the values) is built
  into the definitions here: with partial matchings a pair of negative value is never matched in
  a matching of largest weight, and a cover of `v` is the same as a cover of its positive part,
  since payoffs are nonnegative.

## Layer 1: housing markets and top trading cycles

### 1.1 Housing markets and the strict core

Define the structure `HousingMarket ι` as in the Conventions. Define
`WeaklyBlocks P π A σ`: the reallocation `σ` maps `A` into `A`, differs from `π` at some member
of `A`, and every member `i` of `A` with `σ i ≠ π i` has `P.prefers i (σ i) (π i)`. Define
`IsInStrictCore P π`: no coalition `A` and reallocation `σ` weakly block `π` (Karlin–Peres, §10.4,
p. 186, where blocking is defined for a nonempty set of agents and a permutation of it that
differs from the allocation on it). The coalition reallocates the houses its members own, not
the houses they receive under `π`.

**Checks.**
- On the empty type of agents the identity is the only allocation and it is in the strict core;
  on one agent likewise.
- Three agents `a`, `b`, `c` with rankings `a: b > a > c`, `b: a > c > b`, `c: a > b > c`. The
  allocation in which `a` and `b` swap and `c` keeps its house is in the strict core. The
  allocation `a ↦ b, b ↦ c, c ↦ a` (each agent receiving the house of the agent named after the
  arrow) is weakly blocked by `{a, b}` swapping their own houses: `a` keeps house `b` and `b`
  gains, trading house `c` for house `a`. No coalition blocks it with every member strictly
  better off, so the strict core is smaller than the core defined by strict improvement of every
  member.
- Two agents `a`, `b` who both rank house `a` first. The swap is not in the strict core, since
  `{a}` alone, keeping its own house, blocks it. Under the weaker notion in which a coalition
  may only reallocate the houses its members receive under `π`, the swap would pass, since
  every reallocation of `{a, b}` other than the swap is the identity and makes `b` worse off.
- Strictness of preferences matters: if both agents of a two-agent market were indifferent
  between the two houses, nobody could strictly gain and both allocations would be unblocked;
  `HousingMarket` excludes this.

*Needs:* Mathlib `IsStrictTotalOrder`, `Equiv.Perm`, `Finset`.

### 1.2 Existence and uniqueness

Prove `existsUnique_isInStrictCore`: for every housing market on a finite type of agents, exactly
one allocation is in the strict core (existence: Karlin–Peres, Lemma 10.4.1 (1), p. 186;
uniqueness: Karlin–Peres, Remark 10.4.2, p. 186, posed as Exercise 10.13, p. 191, with a hint;
proved here along that hint).

Route, in three steps.
1. *Top trading cycles.* Put `S₁ = ι`. While `Sₖ` is nonempty, let each agent of `Sₖ` point to
   the owner of its favourite house in `Sₖ`. This map of `Sₖ` to itself has a periodic point (on
   a nonempty finite set two iterates of a point agree, by Mathlib's
   `Finite.exists_ne_map_eq_of_infinite`), so the union `Cₖ` of its cycles is nonempty; each agent
   of `Cₖ` receives the house it points to, and `Sₖ₊₁ = Sₖ \ Cₖ`. Every agent is removed after at
   most `#ι` rounds. Writing `r i = k` for `i ∈ Cₖ`, the resulting permutation `π` keeps every
   round and gives every agent its favourite house among the agents of rounds at least its own.
2. *Allocations with rounds are unblocked* (Karlin–Peres, proof of Lemma 10.4.1 (1), p. 186).
   Let `r : ι → ℕ` and `π` be as in the conclusion of step 1, and suppose `A`, `σ` weakly block
   `π`. Among the members of `A` that change house choose `j` with `r j` least. The members of `A`
   in rounds before `r j` keep their houses under `σ`, and `π` maps those rounds into themselves,
   so `σ` maps the set of these members onto itself; hence `σ j` is not one of them, and
   `σ j ∈ A` lies in round `r j` or later. Then `j` prefers `π j` to `σ j ≠ π j`, against the
   blocking.
3. *Uniqueness.* Let `π'` be in the strict core and `π` the allocation of step 1. If they differ,
   take the first round `k` on which they differ. The members of earlier rounds hold the houses
   of earlier rounds under both allocations, so every `i ∈ Cₖ` receives under `π'` a house of
   `Sₖ`, and the coalition `Cₖ` with the reallocation `π` weakly blocks `π'`: each member that
   changes house moves to its favourite house in `Sₖ`.

**Checks.**
- In the three-agent market of 1.1, round 1 is the cycle `a → b → a` (`c` points to `a` and is
  not on a cycle); round 2 is `c` pointing to itself. So the strict core is the swap of `a` and
  `b`, as stated in 1.1.
- On all 216 markets with three agents the strict core has exactly one element, the allocation
  of step 1.

*Needs:* 1.1; Mathlib `Finite.exists_ne_map_eq_of_infinite`.

### 1.3 The top-trading-cycles description

Prove `isInStrictCore_iff_exists_round`: an allocation `π` is in the strict core if and only if
there is `r : ι → ℕ` with `r (π i) = r i` for every `i`, such that for all agents `i`, `j` with
`r i ≤ r j` either `j = π i` or `i` prefers `π i` to `j`. (Proved here; the sufficiency is the
argument of Karlin–Peres, proof of Lemma 10.4.1 (1), p. 186, for an arbitrary assignment of
rounds.)

Route: the sufficiency is step 2 of 1.2. For the necessity, the rounds of step 1 of 1.2 describe
an allocation in the strict core, which is `π` by the uniqueness of 1.2.

**Checks.**
- In the three-agent market of 1.1, the rounds `r a = r b = 0`, `r c = 1` describe the swap of `a`
  and `b`.
- The condition `r (π i) = r i` is needed: for the allocation `a ↦ b, b ↦ c, c ↦ a` of 1.1 and
  the rounds `r a = r c = 0`, `r b = 1`, agents `a` and `c` receive their favourite houses
  overall and `b` receives house `c`, which it prefers to the only house `b` of its round; but
  this allocation is not in the strict core.

*Needs:* 1.2.

### 1.4 Strategy-proofness

Prove `not_prefers_of_isInStrictCore`: let the housing markets `P` and `P'` have the same
preferences for every agent other than `ℓ`, let `π` be in the strict core of `P` and `π'` in the
strict core of `P'`. Then `ℓ`, ranking by its preference in `P`, does not strictly prefer
`π' ℓ` to `π ℓ` (Karlin–Peres, Lemma 10.4.1 (2), p. 186, for the allocation of top trading
cycles).

Route: take rounds `r` for `π` in `P` by 1.3, and let `T` be the set of agents of rounds before
`r ℓ`. By induction over the rounds before `r ℓ`, `π'` agrees with `π` on `T`: if it agrees on the
earlier rounds, every agent `i` of the next round receives under `π'` a house of that round or
later, `i ≠ ℓ` ranks as in `P`, and the round, reallocated by `π`, would otherwise weakly block
`π'` in `P'`. So the houses of `T` go to agents of `T` under `π'`, and `π' ℓ` lies in round `r ℓ`
or later, where `π ℓ` is the favourite of `ℓ` in `P`.

**Checks.**
- On all 216 markets with three agents, for each agent and each of its six possible reports, the
  house the agent receives under the false report is never strictly better by its true ranking.
- The hypothesis that the other agents' preferences agree is needed. Two agents, `a` ranking
  `b > a`. If `b` ranks `a > b`, the strict core is the swap and `a` receives house `b`; if `b`
  ranks `b > a`, the strict core is the identity and `a` receives house `a`. Taking the second
  market as `P` and the first as `P'`, with `ℓ = a`, agent `a` strictly prefers `π' a = b` to
  `π a = a`.

*Needs:* 1.1, 1.3.

### Examples

The three-agent market of 1.1 with its rounds and its two unblocked-by-strict-improvement
allocations; the two-agent market in which both agents rank the same house first.

### Dependencies

Mathlib `IsStrictTotalOrder`, `Equiv.Perm`, `Finset`, `Finite.exists_ne_map_eq_of_infinite`. No
other layer.

## Layer 2: the core of the assignment game

### 2.1 Matchings, covers and outcomes

The weight `matchingWeight v M` of a matching, the sum of `v i j` over the matched pairs, written
`∑ i, ∑ j ∈ (M i).toFinset, v i j`, and the weighted covers `IsWeightCover v u p`, for which `u`
and `p` are nonnegative and `v i j ≤ u i + p j` for all `i`, `j`, are those of
MinimumCostFlowsAndWeightedBipartiteMatching 2.2, stated there over a linearly ordered commutative
ring `K` and used here with `K = ℝ`; `Suggested.lean` copies both verbatim. A weighted cover is
called a cover below. Define `IsMaxWeightMatching v M`, that no matching has larger weight;
`assignmentValue v`, the supremum of the weights of all matchings; and `IsMinCover v u p`: a
cover whose total `∑ i, u i + ∑ j, p j` is at most that of every cover (Karlin–Peres,
Theorem 17.1.1 and Remarks 17.1.2 (1), p. 299, for a square nonnegative matrix; the definition
here admits any real values and any numbers of buyers and sellers). Define
`IsOutcome v M u p`: `u` and `p` are nonnegative, `u i + p j = v i j` whenever `M i = some j`,
`u i = 0` when `M i = none` and `p j = 0` when `M.symm j = none`; and `IsCoreOutcome v M u p`: an
outcome with `v i j ≤ u i + p j` for every buyer `i` and seller `j`, so that no buyer and seller can
both gain by trading with each other (Karlin–Peres, Definition 17.5.1, p. 306, for as many buyers as
sellers and nonnegative values).

**Checks.**
- One buyer and one seller with `v = 5`: the core outcomes are the matched pair with
  `u + p = 5`, `0 ≤ u ≤ 5`; the empty matching is not in the core, since it forces `u = p = 0`
  and `5 ≤ 0` fails. The value of the game is `5`.
- One buyer and one seller with `v = −1`: the only core outcome is the empty matching with
  `u = p = 0`, and the value of the game is `0`. With perfect matchings in place of partial ones
  the value would be `−1`, while every cover has total at least `0`. With partial matchings no
  sign condition on the values is needed.
- The equation on matched pairs is needed: with one buyer, one seller, `v = 5`, the matched pair
  with `u = p = 3` satisfies every other condition and is not an outcome; its total `6` exceeds
  the value `5`.

*Needs:* MinimumCostFlowsAndWeightedBipartiteMatching 2.2 `matchingWeight`, `IsWeightCover`;
Mathlib `PEquiv`, `PEquiv.symm`, `Option.toFinset`, `iSup`, `Finite.of_injective`.

### 2.2 Core outcomes are optimal matchings with minimum covers

Prove `isCoreOutcome_iff`: for all real values `v`, any matching `M` and any payoffs `u`, `p`,
`(M, u, p)` is a core outcome if and only if `M` is a matching of largest weight and `(u, p)` is
a minimum cover (Shapley and Shubik; Karlin–Peres, Proposition 17.5.2, p. 306, for as many
buyers as sellers and nonnegative values, reduced to it by Remark 17.1.3, p. 300, and §17.2.2,
p. 304; the statement here admits any real values and any numbers of buyers and sellers).

Route.
1. *Weak duality.* For every matching `M'` and every cover, `matchingWeight v M'` is at most
   `∑ i, u i + ∑ j, p j`: sum `v i j ≤ u i + p j` over the matched pairs and add the remaining
   nonnegative payoffs.
2. *Strong duality.* Some cover has total `assignmentValue v`. This is `egervary` of
   MinimumCostFlowsAndWeightedBipartiteMatching 2.2 for `K = ℝ`, `w = v` and `H = ⊤`, whose
   hypothesis holds by `AddSubgroup.mem_top`; that theorem allows weights of any sign, unmatched
   elements on either side and sides of different sizes, either of them empty, as here. It gives
   an `m` that is the greatest weight of a matching, so `assignmentValue v = m` by
   `IsGreatest.csSup_eq` (`assignmentValue v` is the supremum of the range of
   `matchingWeight v`), and that is the least total of a cover, attained by some cover.
3. *The equivalence.* If `(M, u, p)` is a core outcome, its total is `matchingWeight v M`, so by
   step 1 `M` is of largest weight and `(u, p)` a minimum cover. Conversely, if `M` is of largest
   weight and `(u, p)` a minimum cover, steps 1 and 2 give
   `matchingWeight v M = ∑ i, u i + ∑ j, p j`; writing the right side as the sum of `u i + p j`
   over the matched pairs plus the payoffs of the unmatched agents, every one of these
   nonnegative slacks is zero, which are the conditions of an outcome.

**Checks.**
- Two buyers, two sellers, `v = [[3, 1], [2, 2]]` (rows are buyers). The diagonal matching has
  weight `5` and is the only matching of largest weight. The minimum covers are `p₁ = 3 − u₁`,
  `p₂ = 2 − u₂` with `0 ≤ u₁ ≤ 3`, `0 ≤ u₂ ≤ 2` and `|u₁ − u₂| ≤ 1`; so `u = (3, 0)`,
  `p = (0, 2)` is not a cover, since `v 2 1 = 2 > u₂ + p₁ = 0`.
- Two buyers and one seller with values `4` and `3`: the matchings of largest weight match the
  first buyer; the core outcomes have `u₁ = 4 − p`, `u₂ = 0` and `3 ≤ p ≤ 4`.
- The identity holds for every value matrix with entries in `{−1, 0, 1, 2}` on at most four
  agents in total, every matching, and every pair of payoff vectors with entries in `{0, 1, 2}`.

*Needs:* 2.1; MinimumCostFlowsAndWeightedBipartiteMatching 2.2 `egervary`; Mathlib
`AddSubgroup.mem_top`, `IsGreatest.csSup_eq`.

### 2.3 Nonemptiness of the core

Prove `exists_isCoreOutcome`: for every matching `M` of largest weight there are payoffs `u`, `p`
with `(M, u, p)` a core outcome. Since there are finitely many matchings, one of them has largest
weight, so the core of every assignment game is nonempty (Karlin–Peres, Proposition 17.5.2,
p. 306, its second sentence, for as many buyers as sellers and nonnegative values; the statement
here admits any real values and any numbers of buyers and sellers).

Route: `egervary` (step 2 of 2.2) gives a cover of total `assignmentValue v`, which is a minimum
cover by step 1 of 2.2; apply 2.2.

**Checks.**
- With no buyers, the only matching is empty and the only core outcome has every price `0`.
- In the one-pair market with `v = −1`, the matching of largest weight is the empty one, and it
  carries the core outcome `u = p = 0`; the full matching is not of largest weight and carries
  none.

*Needs:* 2.2; MinimumCostFlowsAndWeightedBipartiteMatching 2.2 `egervary`.

### Examples

The one-pair markets with `v = 5` and `v = −1`, the two-by-two market `[[3, 1], [2, 2]]`, and the
market of two buyers with values `4` and `3` for one house.

### Dependencies

MinimumCostFlowsAndWeightedBipartiteMatching 2.2 (`matchingWeight`, `IsWeightCover`,
`egervary`); Mathlib `PEquiv`, `Option.toFinset`, `iSup`, `Finite.of_injective`,
`AddSubgroup.mem_top`, `IsGreatest.csSup_eq`. No other layer.

## Layer 3: competitive prices and the lattice of core payoffs

### 3.1 Walrasian equilibria

Define `IsWalrasianEquilibrium v M p`: the prices are nonnegative; a buyer `i` matched to `j` has
`p j ≤ v i j` and `v i k − p k ≤ v i j − p j` for every seller `k`; an unmatched buyer has
`v i k ≤ p k` for every `k`; and an unmatched seller has price `0`. So every buyer receives a house
it demands at the prices `p`, receiving no house being worth `0`, and every unsold house is free.
Prove `isWalrasianEquilibrium_iff`: `(M, p)` is a Walrasian equilibrium if and only if
`(M, u, p)` is a core outcome for some `u` (Karlin–Peres, Lemma 17.2.2, p. 301, for as many
buyers as sellers, nonnegative values and perfect matchings, with the demand graph of
Definition 17.2.1, p. 301; the identity of the core with the competitive equilibria is
attributed to Shapley and Shubik in Karlin–Peres, Notes to Chapter 17, pp. 309–310).

Route: given a Walrasian equilibrium, let `u i = v i j − p j` when `M i = some j` and `u i = 0`
otherwise; the conditions of the equilibrium are the conditions of a core outcome. Conversely, in
a core outcome `u i = v i j − p j ≥ v i k − p k` for a matched buyer and `0 ≥ v i k − p k` for an
unmatched one.

**Checks.**
- Two buyers with values `4` and `3` for one house: the price `5/2` with the first buyer matched
  is not a Walrasian equilibrium, since the unmatched second buyer has `3 > 5/2`; accordingly no
  core outcome has that price. The price `3` is one.
- The nonnegativity of prices is needed: one buyer, one seller, `v = 0`, the pair matched at the
  price `−1` meets every other condition, but no core outcome has a negative price.
- The condition on unsold houses is needed: with the two buyers above and a second house that
  both value at `0`, the first buyer matched to the first house at the price `3`, the price `10`
  on the unsold second house meets every other condition, and
  no core outcome has it, since an unmatched seller gets `0`.

*Needs:* 2.1.

### 3.2 The lattice of minimum covers

Define `corePrices v`, the set of `p` such that `(M, u, p)` is a core outcome for some `M` and
`u`, and `coreUtilities v`, the set of such `u`. Prove `IsMinCover.sup_inf`: if `(u, p)` and
`(u', p')` are minimum covers, so are `(u ⊔ u', p ⊓ p')` and `(u ⊓ u', p ⊔ p')` (Shapley and
Shubik; Karlin–Peres, Lemma 17.2.4 and (17.4) in its proof, pp. 301–302, for as many buyers as
sellers and nonnegative values; the statement here admits any real values and any numbers of
buyers and sellers).

Route (Karlin–Peres, proof of Lemma 17.2.4): fix a matching `M` of largest weight; by 2.2 both
covers make `(M, ·, ·)` a core outcome. The new pair is a nonnegative cover: at each pair
`(i, j)`, if `p j ≤ p' j` then `(u i ⊔ u' i) + p j ≥ u i + p j ≥ v i j`, and symmetrically if
`p' j ≤ p j`. On a matched pair, `u i + p j = u' i + p' j = v i j`, so the order of `p j`,
`p' j` is the reverse of that of `u i`, `u' i`, and the new pair splits `v i j` exactly; at
unmatched agents both payoffs are `0`. So the new pair forms a core outcome with `M`, and 2.2 makes
it a minimum cover. By 2.2 and the existence of a matching of largest weight, `corePrices v` is the
set of `p` for which some `(u, p)` is a minimum cover; hence it, and likewise `coreUtilities v`, is
closed under `⊔` and `⊓`, and by 3.1 `corePrices v` is the set of Walrasian equilibrium prices.

**Checks.**
- In the market `[[3, 1], [2, 2]]` of 2.2, the minimum covers `(u, p) = ((1, 0), (2, 2))` and
  `((0, 1), (3, 1))` give `((1, 1), (2, 1))` and `((0, 0), (3, 2))`, both of total `5`, while the
  coordinatewise maximum of both parts, `((1, 1), (3, 2))`, has total `7` and is not a minimum
  cover.

*Needs:* 2.2, 3.1.

### 3.3 The two extreme core points

Prove `isGreatest_coreUtilities_and_isLeast_corePrices`: for a matching `M` of largest weight,
the vector of marginal contributions of the buyers,
`ū i = assignmentValue v − assignmentValue (Function.update v i 0)`, is the greatest element of
`coreUtilities v`, and the least element of `corePrices v` is `v i j − ū i` at a seller `j`
matched by `M` to `i` and `0` at a seller unmatched by `M` (Karlin–Peres, Corollary 17.2.5,
Theorem 17.2.6 with (17.5) and (17.6), p. 302, for as many buyers as sellers and nonnegative
values; proved there for the lowest envy-free prices, which are the least core prices by 3.1;
the formula is attributed to Demange and to Leonard in Karlin–Peres, Notes to Chapter 17,
p. 310).

Prove `isGreatest_corePrices_and_isLeast_coreUtilities`: symmetrically, the vector of marginal
contributions of the sellers,
`p̄ j = assignmentValue v − assignmentValue (fun i ↦ Function.update (v i) j 0)`, is the greatest
element of `corePrices v`, and the least element of `coreUtilities v` is `v i j − p̄ j` at a
buyer `i` matched by `M` to `j` and `0` at a buyer unmatched by `M` (Karlin–Peres,
Corollary 17.2.9 with (17.9) and (17.10), p. 304, for as many buyers as sellers and nonnegative
values, for the highest envy-free prices).

Route for the first theorem. *Upper bound:* for a core outcome `(M', u, p)` and a buyer `i`,
replacing `u i` by `0` gives a cover of the values without buyer `i`, so by step 1 of 2.2
`assignmentValue (Function.update v i 0) ≤ ∑ u + ∑ p − u i = assignmentValue v − u i`. *A core
outcome attains it* (Karlin–Peres, proof of Theorem 17.2.6 and Claim 17.2.8, pp. 302–303). By
step 1 of 2.2 and `egervary` (step 2 of 2.2) the minimum covers are the covers of total
`assignmentValue v`, a nonempty closed set on which every payoff lies between `0` and
`assignmentValue v`, hence compact (`Metric.isCompact_of_isClosed_isBounded`); so by Mathlib's
`IsCompact.exists_isMinOn` one of them, `(ū', p̲)`, has least `∑ j, p̲ j`. For every minimum
cover `(u, p)`, 3.2 makes `p̲ ⊓ p` the prices of a minimum cover, so its total is at least that of
`p̲` and `p̲ ≤ p` coordinatewise (Karlin–Peres, Corollary 17.2.5). By 2.2 every minimum cover
forms a core outcome with `M`, so its buyer payoffs are `v i j − p j` at a buyer matched to `j`
and `0` at an unmatched buyer; hence `ū' ≥ u` for every `u ∈ coreUtilities v`. It remains to show
`ū' i = ū i`, that is, that `((0, ū'₋ᵢ), p̲)`, a cover of `Function.update v i 0` of total
`assignmentValue v − ū' i`, is a minimum cover of it. This is Karlin–Peres's Claim 17.2.8, which
they prove for a square nonnegative matrix with Hall's marriage theorem (Mathlib's
`Finset.all_card_le_biUnion_card_iff_exists_injective`); it transfers to `v` through a padding.
Put `N = ι ⊕ κ`, index rows by `N` (a buyer `inl i`, or a dummy buyer `inr j`) and columns by `N`
(a dummy seller `inl i`, or a seller `inr j`), and let `w (inl i) (inr j) = max (v i j) 0` and
`w = 0` elsewhere, a square nonnegative matrix. Then `assignmentValue w = assignmentValue v`:
dropping the pairs of negative value from a matching of `v` does not lower its weight and leaves,
read on `N`, a matching of `w` of the same weight, while a matching of `w` restricted to its pairs
`(inl i, inr j)` with `v i j > 0` is a matching of `v` of the same weight. A cover of `w`
restricted to the buyers `inl i` and the sellers `inr j` is a cover of `v`, of total at most that
of `w`'s cover, the dummy agents' payoffs being nonnegative; a cover of `v` extended by zeros is a
cover of `w` of the same total. By step 1 of 2.2 and `egervary` for `v` and for `w`, the minimum
covers of each are its covers of total `assignmentValue v`; so restriction maps the minimum covers
of `w` onto those of `v`, every dummy agent's payoff being `0`, and `(ū', p̲)` extended by zeros
is a minimum cover of `w` whose prices have least sum, that is, the lowest envy-free price vector
of `w` with its utility vector, the hypothesis of Claim 17.2.8 (Karlin–Peres, Corollary 17.2.5
and the proof of Lemma 17.2.4, p. 302: the envy-free prices are the price parts of the minimum
covers). Zeroing row `inl i` of `w` gives the padding
of `Function.update v i 0`, so the claim for `w`, read through the same correspondence for
`Function.update v i 0`, gives the claim for `v`. Comparing totals gives `ū' i = ū i`. The least
prices follow from 2.2: along `M` the prices of a core outcome are `v i j − u i` and `0` at sellers
unmatched by `M`, so the least prices go with the greatest buyer payoffs. The second theorem is
the first applied to the transposed values, with buyers and sellers exchanged.

**Checks.**
- Two buyers with values `4` and `3` for one house: the marginal contributions are `ū = (1, 0)`
  and `p̄ = 4`; the least core price is `4 − 1 = 3`, the second-highest value, and the core prices
  are the interval `[3, 4]`.
- In the market `[[3, 1], [2, 2]]` of 2.2: the value without buyer 1 is `2` and without buyer 2 is
  `3`, so `ū = (3, 2)` and the least prices are `(0, 0)`; the value without seller 1 is `2` and
  without seller 2 is `3`, so `p̄ = (3, 2)` and the least buyer payoffs are `(0, 0)`.
- One buyer, one seller, `v = 5`: `ū = 5` and `p̄ = 5`, the two ends of the segment of core
  outcomes of 2.1.
- The matching in the formula for the least prices must be of largest weight: in the one-pair
  market with `v = −1`, the full matching would give the least price `−1 − 0 = −1`, which is
  not a core price.
- All four formulas hold for every value matrix with entries in `{−1, 0, 1, 2}` on at most two
  buyers and two sellers, compared with the extreme values of a linear program.

*Needs:* 2.2, 2.3, 3.1, 3.2; MinimumCostFlowsAndWeightedBipartiteMatching 2.2 `egervary`;
Mathlib `Function.update`, `IsGreatest`, `IsLeast`, `ciSup_le`,
`Metric.isCompact_of_isClosed_isBounded`, `IsCompact.exists_isMinOn`,
`Finset.all_card_le_biUnion_card_iff_exists_injective`.

### Examples

The market of two buyers with values `4` and `3` for one house, whose core prices run from the
second-highest to the highest value; the two-by-two market `[[3, 1], [2, 2]]`, whose minimum
covers form, in the buyer payoffs, the pentagon `|u₁ − u₂| ≤ 1`, `0 ≤ u₁ ≤ 3`, `0 ≤ u₂ ≤ 2` with
vertices `(0, 0)`, `(1, 0)`, `(3, 2)`, `(1, 2)`, `(0, 1)`.

### Dependencies

Layer 2; MinimumCostFlowsAndWeightedBipartiteMatching 2.2 (`egervary`, in 3.3). Mathlib
`Function.update`, `IsGreatest`, `IsLeast`, `ciSup_le`, `IsCompact.exists_isMinOn`,
`Metric.isCompact_of_isClosed_isBounded`, `Finset.all_card_le_biUnion_card_iff_exists_injective`.

## Scope and ownership

This roadmap owns housing markets with strict preferences, their strict core, the description of
its unique element by top trading cycles and its strategy-proofness; and the assignment game with
real values and any numbers of buyers and sellers: matchings of largest weight and the value of
the game, minimum covers, outcomes and core outcomes, the characterization and nonemptiness of
the core, Walrasian equilibria and their identity with the core, the lattice of minimum covers,
and the formulas for the buyer-optimal and seller-optimal core points.

Already in the libraries and therefore not targets:

- Mathlib's partial bijections and Hall's marriage theorem.

Taken from other roadmaps:

- MinimumCostFlowsAndWeightedBipartiteMatching 2.2 (Egerváry's theorem) owns the weight of a
  matching and weighted covers over linearly ordered commutative rings; `matchingWeight` and
  `IsWeightCover` are copied verbatim, and `egervary` in the case `K = ℝ`, `H = ⊤` is used in the
  routes of 2.2, 2.3 and 3.3 and is not restated. For nonnegative square matrices that case is
  Karlin–Peres, Theorem 17.1.1, whose matchings are perfect; for nonnegative values a perfect
  matching and a partial one give the same largest weight. Conversely 2.3, applied to a matching
  of largest weight (one exists, there being finitely many matchings), and 2.2 give back that
  case, since the total of a core outcome is the weight of its matching. This roadmap depends on
  that one.

Boundaries with other roadmaps:

- CooperativeGames, Layer 2 (2.1, the core of a coalitional game), defines the core of a game in
  characteristic-function form and lists assignment games outside its scope. The core outcomes
  here are triples of a matching and two payoff vectors; the theorem that their payoff vectors
  form the core of the coalitional game whose worth of a coalition is the largest weight of a
  matching inside it is not treated here, and this roadmap does not depend on that one.
- MechanismDesign 3.3 defines, for finitely many agents and a finite nonempty type of outcomes,
  the Clarke pivot `clarkePivot b i`, the largest total reported value of the agents other than
  `i`, and the VCG payment `vcgPayment f b i`, the pivot minus the others' reported value of the
  outcome `f b`. Take the matchings `ι ≃. κ` as outcomes and the buyers as agents, buyer `i`
  valuing a matching at `v i j` when it gives `i` the house `j` and at `0` when it leaves `i`
  unmatched. The welfare of a matching is then its weight, the pivot of buyer `i` is
  `assignmentValue (Function.update v i 0)`, and for every welfare-maximizing rule `f` buyer
  `i`'s VCG payment is `v i j − ū i` when `f` gives `i` the house `j`, the least core price of
  3.3 at that house, and `0` when `f` leaves `i` unmatched; this holds for all real values and
  whichever matching of largest weight `f` picks. This identity is not stated here, and this
  roadmap does not depend on that one.

Outside the scope: two-sided matching without transfers and every notion of matching it uses;
housing markets with indifferences, with existing tenants or with several houses per agent; group
strategy-proofness and the characterizations of top trading cycles among mechanisms; the
uniqueness of the competitive allocation of a housing market; assignment games with seller
reservation values beyond the reduction of the Conventions; balanced outcomes and the nucleolus
of the assignment game; auctions and every procedure for computing matchings, prices or
allocations.

## Exact supplier contracts

### From Mathlib

- `Mathlib/Order/Defs/Unbundled.lean`: `IsStrictTotalOrder α lt` (`lt` is irreflexive,
  transitive and trichotomous). `Mathlib/Logic/Equiv/Defs.lean`: `Equiv.Perm`.
  `Mathlib/Data/Finset/Defs.lean`: `Finset`.
- `Mathlib/Data/Fintype/Pigeonhole.lean`: `Finite.exists_ne_map_eq_of_infinite` (a map from an
  infinite type to a finite one takes some value twice).
- `Mathlib/Basic/PEquiv.lean`: `PEquiv` (`α ≃. β`, a partial function `α → Option β` with a
  partial inverse, `M.symm j = some i ↔ M i = some j`), `PEquiv.symm`.
  `Mathlib/Data/Finset/Option.lean`: `Option.toFinset` (`∅` for `none`, `{a}` for `some a`).
- `Mathlib/Order/ConditionallyCompleteLattice/Indexed.lean`: `iSup` in `ℝ`, `ciSup_le` (for a
  nonempty index type, a common upper bound bounds the supremum).
  `Mathlib/Order/ConditionallyCompletePartialOrder/Basic.lean`: `IsGreatest.csSup_eq` (a greatest
  element of a set is its supremum).
- `Mathlib/Algebra/Group/Subgroup/Lattice.lean`: `AddSubgroup.mem_top` (every element lies in the
  subgroup `⊤`).
- `Mathlib/Combinatorics/Hall/Basic.lean`:
  `Finset.all_card_le_biUnion_card_iff_exists_injective` (Hall's marriage theorem: for finite sets
  `t i`, a system of distinct representatives exists if and only if every finite set of indices
  `s` has `#s ≤ #(s.biUnion t)`).
- `Mathlib/Logic/Function/Basic.lean`: `Function.update`. `Mathlib/Order/Bounds/Defs.lean`:
  `IsGreatest`, `IsLeast`.
- `Mathlib/Data/Fintype/EquivFin.lean`: `Finite.of_injective` (a type injecting into a finite
  type is finite). `Mathlib/Topology/Order/Compact.lean`: `IsCompact.exists_isMinOn` (a
  continuous function on a nonempty compact set attains its minimum).
  `Mathlib/Topology/MetricSpace/Bounded.lean`: `Metric.isCompact_of_isClosed_isBounded` (in a
  proper space a closed bounded set is compact).

### From TauCetiRoadmap.MinimumCostFlowsAndWeightedBipartiteMatching

- 2.2, Egerváry's theorem, in the section with the variables
  `{ι κ : Type*} [Fintype ι] [Fintype κ]` and
  `{K : Type*} [CommRing K] [LinearOrder K] [IsStrictOrderedRing K]`:
  `matchingWeight (w : ι → κ → K) (M : ι ≃. κ) : K := ∑ i, ∑ j ∈ (M i).toFinset, w i j`;
  `IsWeightCover (w : ι → κ → K) (u : ι → K) (p : κ → K) : Prop :=
  (∀ i, 0 ≤ u i) ∧ (∀ j, 0 ≤ p j) ∧ ∀ i j, w i j ≤ u i + p j`; and
  `egervary (w : ι → κ → K) (H : AddSubgroup K) (hw : ∀ i j, w i j ∈ H) :
  ∃ m : K, IsGreatest (Set.range (matchingWeight w)) m ∧
  IsLeast {x | ∃ u p, IsWeightCover w u p ∧ ∑ i, u i + ∑ j, p j = x} m ∧
  ∃ u p, IsWeightCover w u p ∧ (∀ i, u i ∈ H) ∧ (∀ j, p j ∈ H) ∧ ∑ i, u i + ∑ j, p j = m`.
  The two definitions are copied verbatim into `Suggested.lean`, which imports only `Mathlib`;
  `egervary` is used with `K = ℝ` and `H = ⊤`.

## References

- Anna R. Karlin and Yuval Peres, *Game Theory, Alive*, American Mathematical Society, 2017; the
  PDF on A. R. Karlin's page (`homes.cs.washington.edu/~karlin/GameTheoryBook.pdf`, title page
  dated 13 December 2016), with the page numbers printed in that file: §10.4 with Lemma 10.4.1 and
  Remark 10.4.2, p. 186, the Notes to Chapter 10, p. 187, Exercise 10.13, p. 191; Chapter 17,
  §§17.1, 17.2 and 17.5, pp. 299–306, and its Notes, pp. 309–310.
- The papers of Shapley and Shubik (1971), Shapley and Scarf (1974), Demange (1982) and Leonard
  (1983) are named as Karlin and Peres attribute the results, in their Notes to Chapters 10 and
  17; top trading cycles are attributed there, after Shapley and Scarf, to David Gale. No locator
  into these papers is given.
