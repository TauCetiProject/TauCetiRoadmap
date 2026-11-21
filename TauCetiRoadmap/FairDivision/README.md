# Roadmap: fair division

**Summary.** Fair division asks when a resource can be shared so that each participant is
satisfied by a criterion fixed in advance. This roadmap proves the basic existence theorems for
three kinds of resource. A divisible cake is the interval `[0, 1)`, cut into `n + 1` consecutive
intervals and valued by the players through measures that are finite on the cake and give no
point of the cake positive mass. Indivisible goods form a finite set, allocated whole to finitely
many players whose valuations are functions on bundles. A bankrupt estate is a sum of money smaller
than or equal to the total of the claims against it.

The headline theorems are these.

- *Proportional and envy-free cake division.* For `n + 1` measures, each finite and without atoms
  on `[0, 1)`, the cake can be cut into `n + 1` intervals and the intervals handed out so that no
  player values another player's piece above its own; in particular each player receives at least
  `1/(n + 1)` of its value of the whole cake. No positivity of the measures on intervals is
  needed.
- *Envy-free cut-sets for general preferences.* If every player, at every way of cutting the cake
  into `n + 1` intervals, prefers some piece of positive length, and the set of cuts at which a
  player prefers a given piece is closed, then at some cut the players prefer pairwise different
  pieces. The proof takes Sperner's lemma on finer and finer subdivisions of the simplex of cuts
  and passes to a limit.
- *Envy-freeness up to one good.* With at least one player, finitely many goods and valuations
  that are monotone under inclusion, all goods can be allocated so that any envy of one player
  towards another disappears after removing a single good from the envied bundle. For additive
  valuations with nonnegative values such an allocation can moreover be chosen Pareto optimal,
  or alternatively balanced, with bundle sizes differing by at most one.
- *The Talmud rule.* For nonnegative claims and an estate between zero and the total claim, there
  is exactly one division of the estate in which every two claimants split what they jointly
  receive by the contested-garment rule, and it is the rule that gives constrained equal awards
  of the half-claims when the estate is at most half the total claim, and constrained equal
  losses from the half-claims otherwise.

The envy-free layer consumes the form of Sperner's lemma with owners from the roadmap
TopologicalCombinatorics, which labels the staircase subdivision of the simplex once per player.
The identical-preference case of the general envy-free theorem is the lemma of Knaster, Kuratowski
and Mazurkiewicz on the standard simplex, which KakutaniFixedPointAndContinuousGames derives from
Brouwer's theorem; neither roadmap uses the other.

Layer 1 below defines cut-sets and their pieces. Layer 2 proves proportional division, Layer 3
the two envy-free theorems; both rest on Layer 1 only, and Layer 3 also on Sperner's lemma.
Layer 4 treats indivisible goods and Layer 5 bankruptcy problems; these two use no other layer.

## Conventions

- **Players and pieces.** On the cake there are `n + 1` players, `n : ℕ`, indexed by
  `Fin (n + 1)`, and `n + 1` pieces, indexed the same way. The case `n = 0` is a single player who
  receives the whole cake. A division is a cut-set together with a permutation `π` of
  `Fin (n + 1)`: player `p` receives piece `π p`.
- **Cut-sets.** A cut-set is a point `x` of `simplex (Fin (n + 1))`, where
  `simplex ι = Set.range (fun p : Convexity.StdSimplex ℝ ι ↦ ⇑p.weights)` is the set of weight
  vectors of Mathlib's `Convexity.StdSimplex`, copied verbatim from RegretMinimizationAndEquilibria,
  Layer 1, 1.1; by `Convexity.StdSimplex.range_toFun_comp_weights` its points are the vectors of
  nonnegative reals indexed by `Fin (n + 1)` with sum `1`, and `x k` is the length of piece `k`.
  Limits and closed sets are taken in `Fin (n + 1) → ℝ`. The `k`-th cut point `cutPoint x k`, for
  `k : ℕ`, is the sum of the `x j` with `j < k`, so `cutPoint x 0 = 0` and `cutPoint x (n + 1) = 1`.
  Piece `k` is the half-open interval `piece x k` from `cutPoint x k` to `cutPoint x (k + 1)`; the
  successor is taken in `ℕ`, never in `Fin (n + 1)`. Pieces of length zero are empty.
- **Measures on the cake.** A player's values are a measure `μ` on `ℝ` with its Borel sets. The
  standing hypotheses of the cake theorems are that `μ [0, 1)` is finite and that `μ {t} = 0` for
  every `t ∈ [0, 1)`; nothing is assumed outside the cake, and the measures need not be
  probability measures. Values are in `ℝ≥0∞`.
- **Preferences on cut-sets.** In 3.1 a player's preferences are any map assigning to every
  cut-set the set of pieces the player prefers there. Ties are allowed, so the set may have
  several elements.
- **Goods and allocations.** Players form a finite type `ι` and goods a finite type `α`. An
  allocation is a map `a : α → ι`; every good is allocated. The bundle of `i` is the finite set
  of goods sent to `i`. A valuation of player `i` is any function `Finset α → ℝ`; it is additive
  when it is the sum of nonnegative values of the goods in the bundle.
- **Bankruptcy problems.** Claimants form a finite type `ι`, the claims are `d : ι → ℝ` and the
  estate is `E : ℝ`. The theorems assume `d i ≥ 0`, `E ≥ 0` and `E ≤ ∑ i, d i`. The positive part
  of a real `s` is `max s 0`.

## Layer 1: cut-sets and pieces

### 1.1 Cut-sets, cut points and pieces

Copy `simplex`, and define `cutPoint x k` and `piece x k`, as in the Conventions. Their basic
theory, proved here:

- For `x ∈ simplex (Fin (n + 1))` the cut points increase with `k` from `0` to `1`, the pieces are
  pairwise disjoint and their union is `[0, 1)`; so for every measure, the values of the `n + 1`
  pieces add up to the value of `[0, 1)`, the pieces being Borel sets.
- Piece `k` is empty exactly when `x k = 0`, and then every measure gives it value `0`.
- The set `simplex (Fin (n + 1))` is compact, as the image of the compact space
  `Convexity.StdSimplex ℝ (Fin (n + 1))` under the continuous map to the weights.
- If `μ [0, 1)` is finite and `μ` has no atom in `[0, 1)`, the function `t ↦ μ [0, t)` is
  continuous on `[0, 1]`: its left limits are values on increasing unions, and its right limit at
  `t < 1` is the value of `[0, t]`, which differs from `μ [0, t)` by `μ {t} = 0`. Consequently
  `x ↦ μ (piece x k)` is continuous on `simplex (Fin (n + 1))` for every `k`, being a difference of
  two values of this function at cut points that depend linearly on `x`.

**Checks.**
- For `n = 1` and `x = (1/4, 3/4)` the cut points are `0, 1/4, 1` and the pieces are `[0, 1/4)`
  and `[1/4, 1)`. For `n = 2` and `x = (1/2, 0, 1/2)` the middle piece is empty, the interval
  from `1/2` to `1/2`.
- Reading the successor of the last index in `Fin (n + 1)` would wrap to `0` and make the last
  piece the interval from `cutPoint x n` to `0`, which is always empty; with the
  successor in `ℕ` the last piece of `(1/4, 3/4)` is `[1/4, 1)`.
- Continuity of piece values needs both standing hypotheses. For the unit mass at `1/2`, the
  value of `[0, t)` jumps from `0` to `1` just after `t = 1/2`. For the measure with density
  `1/t` on `(0, 1)`, which has no atoms, `μ [0, t) = ∞` for every `t > 0` and `0` at `t = 0`.

*Needs:* RegretMinimizationAndEquilibria 1.1 (`simplex`, copied); Mathlib
`Convexity.StdSimplex.range_toFun_comp_weights`,
`Convexity.StdSimplex.isClosedEmbedding_toFun_comp_weights`, `Convexity.StdSimplex.compactSpace`,
`measurableSet_Ico`, `MeasureTheory.measure_biUnion_finset`, `Set.Ico_union_Ico_eq_Ico`,
`MeasureTheory.tendsto_measure_iUnion_atTop`, `MeasureTheory.tendsto_measure_iInter_atTop`.
(Proved here.)

### Examples

For Lebesgue measure every piece is worth its length. The cut-set with all lengths `1/(n + 1)`
gives every player, whatever the permutation, the same value of each piece.

### Dependencies

Mathlib measures on `ℝ`, Borel intervals and compactness. No other layer.

## Layer 2: proportional division

### 2.1 Proportional division into intervals

Prove `exists_proportional_intervals`: let `μ p`, for `p : Fin (n + 1)`, be measures on `ℝ` with
`μ p [0, 1)` finite and `μ p {t} = 0` for every `t ∈ [0, 1)`. Then there are a cut-set `x` and a
permutation `π` with `μ p [0, 1) ≤ (n + 1) · μ p (piece x (π p))` for every player `p`
(Karlin–Peres, Definition 11.1.1, p. 194, for the notion, and Lemma 11.1.4 with its proof, p. 194,
for the guarantee of the safe strategy in the moving-knife procedure, stated there for
probability measures with continuous distribution functions; the existence statement here is
the value of that guarantee and holds for finite measures that need not be normalised).

Route: induction on the number `r` of players left and the left end `a` of the cake left, the
cake `[a, 1)`. For each remaining player `q`, continuity (1.1) and the intermediate value theorem
give a least point `s q ≥ a` with `μ q [a, s q)` equal to `1/r` of `μ q [a, 1)`. A player `p`
with the least `s p` takes `[a, s p)`. Every other remaining player `q` has
`μ q [a, s p) ≤ μ q [a, s q)`, so `μ q [s p, 1)` is at least `(r − 1)/r` of `μ q [a, 1)`, and the
induction on `[s p, 1)` with `r − 1` players gives `q` at least `1/(r − 1)` of that. The pieces
are taken from left to right, which defines `x` and `π`. For `r = 1` the last player takes what is
left. The theorem also follows from 3.2: the `n + 1` pieces add up to the whole cake (1.1), so
the piece a player values most is worth at least the average.

**Checks.**
- For `n = 0` the single player receives `[0, 1)` and the inequality is an equality.
- Atoms break the theorem: two players who both carry the unit mass at `1/2` would each need the
  piece containing `1/2`, and only one piece contains it.
- Finiteness is needed: two players with the density `1/t` on `(0, 1)` value `[0, 1)` at `∞`,
  and only the piece starting at `0`, if it has positive length, is worth `∞`.
- For a player whose measure vanishes the inequality holds for every piece.

*Needs:* 1.1; Mathlib `intermediate_value_Icc`, `Equiv.Perm`. (Proved here, following the
cited route.)

### Examples

Two players: the first cuts where its value of `[0, c)` is half its value of the cake, and the
second takes the piece it values more; each receives at least half by its own measure.

### Dependencies

1.1; Mathlib. No other layer.

## Layer 3: envy-free division

### 3.1 Envy-free cut-sets for closed, hungry preferences

Prove `exists_envyFree_of_closed_hungry`: let `pref p x ⊆ Fin (n + 1)` be the set of pieces that
player `p` prefers at the cut-set `x`. Assume that for all `p` and `k` the set of cut-sets `x`
with `k ∈ pref p x` is closed, and that at every cut-set `x` each player prefers some piece `k`
with `x k > 0`. Then there are a cut-set `x` and a permutation `π` with `π p ∈ pref p x` for every
`p` (Su, §3, the theorem on p. 6, with its proof on pp. 6–7 for three players and in §4,
pp. 7–8, for `n + 1` players; Su attributes the argument to Simmons). Su's hungry players never
prefer an empty piece when a nonempty one exists; here it is enough that some preferred piece is
nonempty, which is all the proof uses.

Route. Fix `N ≥ 1`. For a point `y` of the grid `simplexGrid n N` of TopologicalCombinatorics,
`y / N` is a cut-set; let `L p y` be a piece `k ∈ pref p (y / N)` with `y k > 0`, which the hunger
hypothesis provides, and any label at points off the grid. Since `y k ≠ 0`, each `L p` is a Sperner
labelling, and TopologicalCombinatorics 1.3 gives grid points `y p`, pairwise within one in every
coordinate, at which `p ↦ L p (y p)` is a bijection, that is a permutation `π_N` with
`π_N p ∈ pref p (y p / N)`. Some permutation `π` occurs for infinitely many `N`; along those `N`,
compactness of `simplex (Fin (n + 1))` (1.1) gives a subsequence on which `y 0 / N` converges to a
cut-set `x`. Every `y p / N` lies within `1/N` of `y 0 / N` in every coordinate and converges to `x`
as well, and the closedness hypothesis passes `π p ∈ pref p (y p / N)` to the limit.

**Checks.**
- For `n = 0` the only cut-set is `(1)`; hunger forces piece `0` to be preferred there, and `π`
  is the identity.
- Hunger is needed: two players who at every cut-set prefer piece `0` alone have closed
  preference sets, and never prefer different pieces; the hypothesis fails at `x = (0, 1)`.
- Closedness is needed: two players who both prefer piece `0` alone when `x 0 > 1/2` and piece
  `1` alone when `x 0 ≤ 1/2` are hungry (the preferred piece has length at least `1/2`), and
  never prefer different pieces; the set where piece `0` is preferred is not closed.
- When all players have the same preferences the conclusion is a cut-set at which every piece is
  preferred.

*Needs:* 1.1; TopologicalCombinatorics 1.3 (`exists_close_bijective_labels`, with
`simplexGrid` and `IsSpernerLabelling` of its 1.1); Mathlib `Finite.exists_infinite_fiber`,
`IsCompact.tendsto_subseq`, `IsClosed.mem_of_tendsto`, `Equiv.ofBijective`. (Proved here,
following the cited route.)

### 3.2 Envy-free division into intervals

Prove `exists_envyFree_intervals`: let `μ p`, for `p : Fin (n + 1)`, be measures on `ℝ` with
`μ p [0, 1)` finite and `μ p {t} = 0` for every `t ∈ [0, 1)`. Then there are a cut-set `x` and a
permutation `π` with `μ p (piece x (π q)) ≤ μ p (piece x (π p))` for all players `p` and `q`
(Karlin–Peres, Corollary 11.1.8 with its proof, pp. 197–198, for strictly increasing continuous
distribution functions of probability measures; Theorem 11.1.7, pp. 196–197, gives the
`ε`-envy-free form under Assumption 11.1.5, p. 195, that every player gives positive value to
every nonempty interval). Neither positivity nor normalisation is needed here.

Route: apply 3.1 with `pref p x` the set of pieces of greatest value for `μ p` at `x`. These sets
are closed because piece values are continuous on `simplex (Fin (n + 1))` (1.1). They are hungry: if
a most valuable piece is empty, the greatest value is `0`, so every piece has value `0` and every
piece of positive length, of which there is one since the lengths add up to `1`, is most valuable.
The source uses its positivity assumption at this point, to make the favourite piece nonempty; here
it is not needed, because an empty piece never has positive value. The `ε`-envy-free form of the
source is the step before the limit in 3.1: any two of the close points of 1.3 have cut points
within `n/N` of each other, so the piece values of every player at them differ by at most twice the
modulus of continuity `ω p` of `t ↦ μ p [0, t)` at `n/N`, and at any of the points the assignment
`π_N` leaves player `p` an envy of at most `4 · ω p (n/N)`.

**Checks.**
- Two players whose measures are both the uniform measure on `[1/2, 1)` with total mass `1`
  vanish on `[0, 1/2)`; the cut-set `(3/4, 1/4)` gives both pieces the value `1/2` for both
  players, so it is envy-free with either assignment.
- The unit mass at `1/2` for two players and the density `1/t` on `(0, 1)` for two players are
  counterexamples as in 2.1.
- Three players with densities `(2, 1, 0)`, `(0, 1, 2)` and `(1, 0, 2)` on the thirds of
  `[0, 1)`, each labelling a grid point by its most valuable nonempty piece (least index among
  ties) at the vertices it owns: on the grids `N = 3, 6, 12, 24` there are `3, 1, 7, 23` fully
  labelled cells, and the largest envy at any vertex of any of them, with the assignment of that
  cell, is `1, 1/3, 1/3, 1/6`, within the bound `4 · ω p (n/N) ≤ 16/N` that the route gives for
  densities at most `2` and `n = 2`.

*Needs:* 1.1, 3.1. (Proved here; the route through 3.1 replaces the source's limit over
`ε`.)

### Examples

For Lebesgue measure and any players the equal cut-set is envy-free with every permutation. For
two players the cut-set at which the first player values both pieces equally, with the second
player taking the piece it values more, is envy-free.

### Dependencies

1.1; TopologicalCombinatorics 1.3; Mathlib compactness of `simplex (Fin (n + 1))` and sequences.
Layer 2 is not used.

## Layer 4: indivisible goods

### 4.1 Bundles, envy-freeness up to one good and Pareto optimality

Define `bundle a i`, the set of goods that the allocation `a` sends to `i`. Define
`IsEF1 u a`: for all players `i` and `j`, either `u i (bundle a j) ≤ u i (bundle a i)`, or some
good `g` of the bundle of `j` has `u i (bundle a j \ {g}) ≤ u i (bundle a i)`. The good is
removed from the envied bundle, not from the envious player's own. Define `IsParetoOptimal u a`:
every allocation `b` that gives every player at least its value under `a` gives every player at
most that value (Caragiannis–Kurokawa–Moulin–Procaccia–Shah–Wang, Definitions 2.2 and 2.4,
p. 12:6). The source writes EF1 with a good of the bundle of `j` always present and notes in its
footnote 1 that an empty envied bundle needs separate treatment; the first alternative above
covers it, and with a monotone valuation nobody envies an empty bundle.

**Checks.**
- One good valued `1` by two players and given to player `0`: player `1` envies the bundle of
  `0`, and removing the good removes the envy, so the allocation is EF1. Removing a good from the
  envious player's own bundle instead would fail, since that bundle is empty.
- Two goods valued `1` each by two players, both given to player `0`: removing either good
  leaves value `1 > 0` for player `1`, so the allocation is not EF1.
- With no goods the only allocation is EF1, every bundle being empty; with no players and at
  least one good there is no allocation.

*Needs:* Mathlib `Finset.filter`, `Finset.erase`. (Proved here.)

### 4.2 EF1 allocations for monotone valuations

Prove `exists_isEF1_of_monotone`: if `ι` is nonempty and every valuation `u i` is monotone under
inclusion, some allocation `a` has `IsEF1 u a` (Bouveret–Chevaleyre–Maudet, Theorem 12.8 with its
proof sketch, Handbook of Computational Social Choice, p. 301, where the conclusion is envy at most
the largest marginal value, attributed to Lipton, Markakis, Mossel and Saberi; Caragiannis et al.,
§1.3, p. 12:4, trace the notion of EF1 to the same paper).

Route: allocate the goods one at a time and keep the invariant that the allocation of the goods
already placed is EF1. With no goods allocated the invariant holds. Before adding a good, while the
envy graph (an edge from `i` to `j` when `i` values the bundle of `j` above its own) has a cycle,
give each player on a cycle the bundle it envies: the bundles stay the same as a family, players off
the cycle keep theirs, players on it strictly gain, so EF1 survives, and the sum of the players'
values strictly increases, so this stops among the finitely many allocations of those goods. An
acyclic envy graph on a nonempty set of players has a player whom nobody envies; give the new good
to that player `i`. Its own value does not decrease, by monotonicity, and every `j` values the new
bundle of `i` without the new good as before, which is at most its own. This last step is where
monotonicity is used.

**Checks.**
- Monotonicity is needed: one good that both of two players value at `−1` (and the empty bundle
  at `0`); whoever receives it values the other's empty bundle above its own, so no allocation is
  EF1.
- Exhaustively, the procedure of the route ends in an EF1 allocation for every pair of monotone
  valuations on two goods with values in `{0, 1, 2}`, every triple on two goods with values in
  `{0, 1}`, and every pair on three goods with values in `{0, 1}`.

*Needs:* 4.1; Mathlib `Finset.exists_max_image`, `Finset.erase`. (Proved here; the source's
proof sketch with the invariant changed from bounded envy to EF1.)

### 4.3 Balanced EF1 allocations for additive valuations

Prove `exists_isEF1_balanced`: if `ι` is nonempty and `v i g ≥ 0` for all `i` and `g`, some
allocation `a` is EF1 for the additive valuations `A ↦ ∑ g ∈ A, v i g` and has
`|bundle a i| ≤ |bundle a j| + 1` for all `i`, `j` (Caragiannis et al., §3, p. 12:7, the
argument for allocation in rounds).

Route: order the players and let them take, in turn and cyclically, a remaining good of greatest
value to them until no good is left. The bundle sizes then differ by at most one. For a player
`i`, cut the sequence of choices into stretches beginning at the turns of `i`: in each stretch
`i`'s good is worth at least as much to `i` as each good taken after it in that stretch. So `i`
values its bundle at least as much as the bundle of any `j` without the good `j` took before the
first turn of `i`, if any; additivity and nonnegativity give the sums.

**Checks.**
- For three goods valued `(1, 1, 1)` by both of two players, a balanced allocation gives sizes
  `2` and `1`; it is EF1, while giving all three goods to one player is neither balanced nor EF1.
- Nonnegativity is needed: the one-good example of 4.2 with value `−1` is additive.

*Needs:* 4.1; Mathlib `Finset.sum_le_sum`. (Proved here, following the cited route.)

### 4.4 EF1 and Pareto optimal allocations for additive valuations

Prove `exists_isEF1_isParetoOptimal`: if `ι` is nonempty and `v i g ≥ 0` for all `i` and `g`,
some allocation is both EF1 and Pareto optimal for the additive valuations
`A ↦ ∑ g ∈ A, v i g` (Caragiannis et al., Theorem 3.2 with its proof, pp. 12:8–12:9, for every
allocation of maximum Nash welfare).

Route: choose an allocation that first makes the set of players with positive value as large as
possible and then maximises the product of their values (Caragiannis et al., Definition 3.1 and the
two-stage description after it, pp. 12:7–12:8; unlike the source, players outside the set may hold
goods, which the step on players of value `0` below handles). An improvement for some player that
hurts nobody would raise the product or enlarge the set, so it is Pareto optimal. A good held by a
player of value `0` is worth `0` to every player: moving it would raise the product or enlarge the
set; so nobody envies a player of value `0`. If `i` and `j` have positive value and `i` envied `j`
after removal of every single good, moving from `j` to `i` a good `g` of `j`'s bundle with
`v i g > 0` and least ratio `v j g / v i g` would keep `j` positive and raise the product (the
computation of the source). If `i` has value `0` and `j` positive value, fix `h` in `j`'s bundle
with `v j h > 0`; a good other than `h` in `j`'s bundle that `i` values positively could be moved to
`i` and would enlarge the set, so removing `h` removes the envy.

**Checks.**
- Optimality alone is not fairness: two goods valued `1` each by player `0` and `2` each by
  player `1`; the allocation of greatest total value gives both goods to player `1`, and
  player `0` still envies after removing one good. The allocation of greatest product splits
  the goods, with values `1` and `2`.
- Exhaustively, every allocation of maximum Nash welfare in the two-stage sense is EF1 and Pareto
  optimal for all additive valuations with values in `{0, 1, 2}` for two players and up to four
  goods, three players and three goods, and with values in `{0, 1}` for three players and four
  goods.

*Needs:* 4.1; Mathlib `Finite.exists_max`, `Finset.prod_pos`. (Proved here, following the cited
proof.)

### Examples

Five goods and three players with additive values: allocation in rounds gives bundle sizes
`2, 2, 1`. For identical additive values every EF1 allocation is an allocation in which no
player's value exceeds another's by more than the largest value of one good.

### Dependencies

4.1; Mathlib finite sets and sums. No other layer.

## Layer 5: bankruptcy problems and the Talmud rule

### 5.1 Divisions, the contested-garment rule and the Talmud allocation

Define `garmentShare a b t = (t + max (t − b) 0 − max (t − a) 0) / 2`: when `t` is divided
between claims `a` and `b`, the claimant with claim `a` receives what the other concedes,
`max (t − b) 0`, and half of what remains after both concessions. Define `IsDivision d E x`: every
`0 ≤ x i ≤ d i` and the `x i` add up to `E` (Karlin–Peres, Definition 11.2.1, p. 198, which states
the upper bound; the lower bound is part of the definition here, and without it, for `E < 0`,
nonnegative claims and at least one claimant, the vector with every award `E/|ι|` would be a
garment-consistent division). Define
`IsGarmentConsistent d x`: for all `i ≠ j`, `x i = garmentShare (d i) (d j) (x i + x j)`, the
pairwise consistency of Karlin–Peres, Definition 11.2.2, p. 200, with the garment rule of p. 199.
Define `IsTalmudAllocation d E x`: the `x i` add up to `E` and for some `l` every `x i` equals
`min (d i / 2) l` when `2E ≤ ∑ d`, and `d i − min (d i / 2) l` otherwise (Karlin–Peres,
Theorem 11.2.3, pp. 200–201). Facts, proved here:

- `garmentShare a b t + garmentShare b a t = t`, and `t ↦ garmentShare a b t` is nondecreasing,
  piecewise linear with slopes `0`, `1/2` and `1`.
- For two claimants with `0 ≤ t ≤ a + b`, `a, b ≥ 0`, the pair of garment shares is the Talmud
  allocation of `t` (constrained equal awards of `a/2, b/2` when `t ≤ (a + b)/2`, constrained
  equal losses from them otherwise).
- For nonnegative claims and `0 ≤ E ≤ ∑ d` a Talmud allocation exists, by the intermediate value
  theorem for the nondecreasing continuous function `l ↦ ∑ i, min (d i / 2) l`, and it is
  unique; its awards satisfy `0 ≤ x i ≤ d i`.

**Checks.**
- Claims `1/2` and `1` with `t = 1` give shares `1/4` and `3/4`.
- Claims `(1, 3)` and `E = 2`: the Talmud allocation is `(1/2, 3/2)`. Claims `(2, 4, 6)` and
  `E = 9`, above half the total `12`: losses `(1, 1, 1)` from the half-claims `(1, 2, 3)`, so
  `(1, 3, 5)`; each pair splits its total by the garment rule.
- Proportional division is not garment-consistent: for claims `(1, 2)` and `E = 1` it gives
  `(1/3, 2/3)` while the Talmud allocation is `(1/2, 1/2)`. Constrained equal awards of the full
  claims give `(1, 2)` for claims `(1, 3)` and `E = 3`, against the Talmud `(1/2, 5/2)`;
  constrained equal losses give `(0, 1)` for `E = 1`, against `(1/2, 1/2)`.
- For `t` from `0` to `4` in steps of `1/2`, the share of claim `1` against claim `3` is
  `0, 1/4, 1/2, 1/2, 1/2, 1/2, 1/2, 3/4, 1`.
- For `E = ∑ d` the Talmud allocation is `d`; for `E = 0` it is `0`; a zero claim receives `0`.

*Needs:* Mathlib `intermediate_value_Icc`, `max`, `min`. (Proved here.)

### 5.2 Uniqueness of the garment-consistent division

Prove `existsUnique_isDivision_isGarmentConsistent`: if every `d i ≥ 0` and `0 ≤ E ≤ ∑ i, d i`,
exactly one `x` is a division of `E` that is pairwise consistent with the garment rule
(Karlin–Peres, Theorem 11.2.3 with its proof, pp. 200–201, for rules defined on all bankruptcy
problems with total claim above the estate; the form here is for one problem at a time and
allows the estate to equal the total claim).

Route. Existence: the Talmud allocation (5.1) is a division, and it is garment-consistent because
its restriction to two claimants is the Talmud allocation of their joint award, as constrained
equal awards and losses on half-claims restrict to themselves, and for two claimants the Talmud
allocation is the garment rule (5.1). Uniqueness, as in the source: two different divisions `x`
and `y` with the same total have claimants `i` and `j` with `x i < y i` and `x j > y j`; after
exchanging the roles of `x` and `y` if necessary `x i + x j ≥ y i + y j`, and monotonicity of the
garment share in the amount divided (5.1) gives `x i ≥ y i`, a contradiction.

**Checks.**
- The hypothesis `E ≥ 0` is needed: for claims `(1, 1)` and `E = −1` no awards are nonnegative
  with total `E`; the vector `(−1/2, −1/2)` is garment-consistent with total `−1` and is excluded
  only by the lower bound of the awards.
- Nonnegative claims are needed: for claims `(−1, 2)` and `E = 0` garment consistency forces
  the first award to be `−1/2`, below `0` and above its claim `−1`, so no division is consistent.
- `E ≤ ∑ d` is needed: for claims `(1, 1)` and `E = 3` there is no division.
- On a grid search with step `1/4` over awards in `[−2, D + 2]`, for all claim vectors with
  entries in `{0, …, 4}`, at most three claimants and total claim `D ≤ 6`, and every estate from
  `0` to `D` in steps of `1/2`, the only garment-consistent vector with total `E` is the Talmud
  allocation, even without the bound of the awards by the claims.

*Needs:* 5.1. (Proved here, following the cited route.)

### 5.3 The garment-consistent division is the Talmud allocation

Prove `isDivision_isGarmentConsistent_iff_isTalmudAllocation`: under the hypotheses of 5.2, a
vector `x` is a garment-consistent division of `E` exactly when it is the Talmud allocation
(Karlin–Peres, Theorem 11.2.3, pp. 200–201).

Route: the Talmud allocation is a garment-consistent division (the existence part of 5.2), and
by the uniqueness of 5.2 there is no other.

**Checks.**
- For claims `(1, 3)` and `E = 3`, above half the total claim, the Talmud allocation is
  `(1/2, 5/2)`: losses `(1/2, 1/2)` from the half-claims `(1/2, 3/2)`.
- The hypotheses are needed. For claims `(1, 1)` and `E = −1` the Talmud allocation
  `(−1/2, −1/2)` exists and is not a division. For claims `(1, 1)` and `E = 3` the losses
  `(−1/2, −1/2)` give the Talmud allocation `(3/2, 3/2)`, above the claims. For claims `(−1, 2)`
  and `E = 0` the Talmud allocation is `(−1/2, 1/2)`, and there is no division.

*Needs:* 5.1, 5.2. (Proved here.)

### Examples

The garment problem: one claimant claims half of the garment and the other all of it; the first
receives a quarter and the second three quarters. A third claimant with claim `0` changes
nothing.

### Dependencies

5.1; Mathlib real arithmetic and the intermediate value theorem. No other layer.

## Scope and ownership

This roadmap owns: cut-sets of the interval and their pieces; proportional and envy-free
division of `[0, 1)` into intervals for finite measures without atoms on the cake; envy-free
cut-sets for closed, hungry preferences; envy-freeness up to one good, with Pareto optimality
and balance in the additive case; the contested-garment rule, garment consistency and the Talmud
allocation.

Supplied by other roadmaps:

- RegretMinimizationAndEquilibria, Layer 1, 1.1, defines `simplex`, the probability simplex as
  a set of weight vectors; it is copied verbatim, and the cut-sets are its points on
  `Fin (n + 1)`.
- TopologicalCombinatorics, 1.3, states Sperner's lemma with owners on its staircase subdivision,
  for `n + 1` Sperner labellings of the grid `simplexGrid n N`. The route of 3.1 above uses it
  exactly in that form, one labelling per player, and restates no form of Sperner's lemma.
  Its downstream section names the envy-free theorem of 3.1 as a consumer.

Bordering, and not used:

- KakutaniFixedPointAndContinuousGames, 4.1, proves the lemma of Knaster, Kuratowski and
  Mazurkiewicz in a real normed space. Taking the same preference sets for all players in 3.1,
  with `k` preferred at `x` when `x` lies in the `k`-th closed set, gives that lemma on the
  standard simplex of `Fin (n + 1) → ℝ` with its vertices as the points: the covering hypothesis
  there is the hunger hypothesis here. 3.1 is the many-player form and is proved from Sperner's
  lemma; this roadmap does not depend on that one, and 4.1 there is not used here.

Outside the scope: every procedure as a target (moving knives, cut and choose, the draft, envy
cycles appear only inside proof routes), query models and the bounds on the number of cuts or
queries, Stromquist's theorem that no finite procedure gives envy-free connected pieces for three
or more players, necklace splitting, division into measurable rather than interval pieces beyond
what intervals give (the theorem of Dubins and Spanier, Lyapunov's convexity theorem), division of
chores and of mixed goods, envy-free division of rent, envy-freeness up to any good and the
maximin share, and consistency of the Talmud allocation on sets of more than two claimants.

## Exact supplier contracts

### From Mathlib

- `Mathlib/MeasureTheory/Constructions/BorelSpace/Order.lean`: `measurableSet_Ico` (half-open
  intervals are Borel).
- `Mathlib/MeasureTheory/Measure/Basic.lean`: `MeasureTheory.measure_biUnion_finset` (the measure
  of a finite pairwise disjoint union of measurable sets is the sum of the measures).
- `Mathlib/MeasureTheory/Measure/Continuity.lean`: `MeasureTheory.tendsto_measure_iUnion_atTop`
  (along a monotone family the measures converge to the measure of the union),
  `MeasureTheory.tendsto_measure_iInter_atTop` (along an antitone family of null-measurable sets,
  one of them of finite measure, the measures converge to the measure of the intersection).
- `Mathlib/Order/Interval/Set/LinearOrder.lean`: `Set.Ico_union_Ico_eq_Ico` (for `a ≤ b ≤ c`
  the intervals `[a, b)` and `[b, c)` join to `[a, c)`).
- `Mathlib/Topology/MetricSpace/Bounded.lean`: `Metric.isCompact_of_isClosed_isBounded` (closed
  bounded sets of a proper space are compact). `Mathlib/Topology/Sequences.lean`:
  `IsCompact.tendsto_subseq` (a sequence in a compact set of a first-countable space has a
  subsequence converging in the set). `Mathlib/Topology/Neighborhoods.lean`:
  `IsClosed.mem_of_tendsto` (a limit of points eventually in a closed set lies in it).
- `Mathlib/Topology/Order/IntermediateValue.lean`: `intermediate_value_Icc` (a function continuous
  on `[a, b]` takes every value between `f a` and `f b` on `[a, b]`).
- `Mathlib/Data/Fintype/Pigeonhole.lean`: `Finite.exists_infinite_fiber` (a map from an infinite
  type to a finite one has an infinite fibre). `Mathlib/Data/Fintype/Lattice.lean`:
  `Finite.exists_max` (a function on a nonempty finite type attains its maximum).
  `Mathlib/Data/Finset/Max.lean`: `Finset.exists_max_image` (a function on a nonempty finite set
  attains its maximum there).
- `Mathlib/Algebra/Order/BigOperators/Group/Finset.lean`: `Finset.sum_le_sum` (termwise
  inequalities add up). `Mathlib/Algebra/Order/BigOperators/GroupWithZero/Finset.lean`:
  `Finset.prod_pos` (a finite product of positive reals is positive). `Finset.filter`,
  `Finset.erase`; `Mathlib/Logic/Equiv/Defs.lean`: `Equiv.Perm`, `Equiv.ofBijective` (the
  equivalence given by a bijection); `MeasureTheory.Measure`, `ℝ≥0∞`.
- `Mathlib/Geometry/Convex/ConvexSpace/Defs.lean`: `Convexity.StdSimplex` (finitely supported
  weights, nonnegative with sum `1`), `Convexity.StdSimplex.range_toFun_comp_weights` (the range
  of the weights on a finite type is the set of nonnegative vectors of sum `1`).
  `Mathlib/Geometry/Convex/ConvexSpace/Topology.lean`:
  `Convexity.StdSimplex.isClosedEmbedding_toFun_comp_weights` (the map to the weights is a closed
  embedding). `Mathlib/Geometry/Convex/ConvexSpace/CompactSpaceStdSimplex.lean`:
  `Convexity.StdSimplex.compactSpace` (the standard simplex on a finite type is compact).

### From Tau Ceti

Nothing is consumed.

### From TauCetiRoadmap.RegretMinimizationAndEquilibria

- Layer 1, 1.1: `simplex ι = Set.range (fun p : Convexity.StdSimplex ℝ ι ↦ ⇑p.weights)`, copied
  verbatim into `Suggested.lean` and used for `ι = Fin (n + 1)` as the set of cut-sets. Nothing
  else of that roadmap is used.

### From TauCetiRoadmap.TopologicalCombinatorics

- 1.1: `simplexGrid n N`, the integer vectors on `Fin (n + 1)` with nonnegative coordinates and
  sum `N`, and `IsSpernerLabelling n N lab`, every grid point `y` labelled by an index with
  `y (lab y) ≠ 0`.
- 1.3, `exists_close_bijective_labels`: for `n + 1` Sperner labellings `L p` of
  `simplexGrid n N` there are grid points `y p`, with `|y p i − y q i| ≤ 1` for all `p, q, i`,
  such that `p ↦ L p (y p)` is a bijection of `Fin (n + 1)`. Used in 3.1 for every `N ≥ 1`;
  nothing else of that roadmap is assumed. The statements of this roadmap do not mention the grid,
  so no definition of that roadmap is copied into `Suggested.lean`.

## References

- Anna R. Karlin and Yuval Peres, *Game Theory, Alive*, American Mathematical Society; the copy
  dated December 13, 2016 on A. Karlin's page at the University of Washington, with the book's
  page numbers:
  Definition 11.1.1 and Lemma 11.1.4 (p. 194), Assumption 11.1.5 (p. 195), Theorem 11.1.7
  (pp. 196–197), Corollary 11.1.8 (pp. 197–198), Definition 11.2.1 (p. 198), the garment rule
  (p. 199), Definition 11.2.2 and Theorem 11.2.3 (pp. 200–201).
- Francis Edward Su, *Rental harmony: Sperner's lemma in fair division*, Amer. Math. Monthly 106
  (1999), 930–942; the copy on the author's page at Harvey Mudd College, with its own page
  numbers: §3 (the theorem on p. 6 and its proof, pp. 6–7) and §4 (pp. 7–8).
- Ioannis Caragiannis, David Kurokawa, Hervé Moulin, Ariel D. Procaccia, Nisarg Shah and Junxing
  Wang, *The unreasonable fairness of maximum Nash welfare*, ACM Trans. Econ. Comput. 7 (2019),
  Article 12; the copy on A. D. Procaccia's page: §1.3 (p. 12:4), §2 with Definitions 2.2 and 2.4
  (pp. 12:5–12:6), §3 with Definition 3.1 and Theorem 3.2 (pp. 12:7–12:9).
- Sylvain Bouveret, Yann Chevaleyre and Nicolas Maudet, *Fair allocation of indivisible goods*,
  Chapter 12 of F. Brandt, V. Conitzer, U. Endriss, J. Lang and A. D. Procaccia (eds.), *Handbook
  of Computational Social Choice*, Cambridge University Press, 2016; the copy of the book on the
  page of A. D. Procaccia, one of its editors, who hold its copyright: Theorem 12.8 and its proof
  sketch (p. 301).
- R. J. Lipton, E. Markakis, E. Mossel and A. Saberi (2004) are named for envy-cycle allocation
  as the Handbook and Caragiannis et al. attribute it, F. Simmons for the Sperner approach to
  cake division as Su does, and R. J. Aumann and M. Maschler for the Talmud rule; no locator into
  their papers is given.
