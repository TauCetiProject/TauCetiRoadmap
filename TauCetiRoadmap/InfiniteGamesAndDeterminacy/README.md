# Roadmap: infinite games and determinacy

**Summary.** Two players take turns choosing elements of a set `X`, forever, and so build an
infinite sequence; the first player wins if the sequence lies in a fixed set `A` of sequences,
the payoff, and the second player wins otherwise. Each player sees every earlier move. The game
is determined when one of the two players has a strategy that wins against everything the other
can do. This roadmap develops these games of Gale and Stewart on the space of sequences `ℕ → X`,
with `X` discrete and the product topology, and the Banach–Mazur game, in which each move is a
nonempty finite block of letters. Every statement is about sets of sequences, strategies and the
plays they produce; no procedure for computing a strategy is specified.

The headline theorems are these.

- *The Gale–Stewart theorem.* If `X` is nonempty, every closed and every open subset of `ℕ → X`
  is determined.
- *Not every game is determined.* If `X` has at least two elements, some subset of `ℕ → X` is
  not determined. The construction diagonalises against all strategies and uses the axiom of
  choice.
- *Wolfe's theorem.* If `X` is nonempty, every countable union of closed sets, and every
  countable intersection of open sets, in `ℕ → X` is determined.
- *Banach's theorem on the Banach–Mazur game.* For nonempty `X`, the second player wins the
  Banach–Mazur game of `A` exactly when `A` is meagre, and the first player wins exactly when
  some basic open set (the sequences with a given beginning) minus `A` is meagre. Consequently a
  set with the property of Baire has a determined Banach–Mazur game, and conversely every member
  of a family of sets whose Banach–Mazur games are all determined, and which is closed under
  removing open sets, has the property of Baire.

The roadmap builds on Mathlib's product topology on sequences, with its cylinders of sequences
sharing a beginning, and on Mathlib's Baire category library, which supplies meagre sets, the
property of Baire and the Baire category theorem for completely metrizable spaces. Tau Ceti's
Ehrenfeucht–Fraïssé games, developed for the completed roadmap InfinitaryLogic, are games between
two structures with a fixed winning condition; the games here have an arbitrary payoff on
sequences, and nothing of that library is restated.

Layer 1 below defines strategies, plays and determinacy, proves the Gale–Stewart theorem for
closed sets and derives it for open sets through a shift of the game by one move. Layer 2
constructs a set that is not determined and uses only the definitions of Layer 1. Layer 3 proves
Wolfe's theorem from Layer 1. Layer 4 presents the Banach–Mazur game as a Gale–Stewart game on an
alphabet of finite blocks, proves Banach's theorem and derives the two statements on the
property of Baire; it uses the definitions of Layer 1 and no theorem of Layers 1 to 3.

## Conventions

- **Sequences and topology.** `X : Type u` is arbitrary; where a topology enters, `X` carries
  the discrete topology (`[TopologicalSpace X] [DiscreteTopology X]`) and `ℕ → X` the product
  topology, as in Moschovakis, p. 219, and Marker, p. 55. For `x : ℕ → X` and `n : ℕ`, Mathlib's
  `PiNat.cylinder x n` is the set of sequences agreeing with `x` below `n`; these cylinders are
  open (`PiNat.isOpen_cylinder`) and form a basis, and `PiNat.cylinder x 0` is the whole space.
  A cylinder is nonempty, and when `X` has at least two elements no cylinder is a single point.
- **Plays and strategies.** Positions are numbered from `0`. Player I moves at the even
  positions and player II at the odd ones. A strategy for either player is a function
  `List X → X` from the finite list of earlier moves to the next move. A strategy of player I is
  consulted only at lists of even length and one of player II only at lists of odd length, so
  this is Moschovakis's notion (p. 218), in which a strategy for I is defined on the sequences of
  even length, extended arbitrarily; Marker's strategies (Definition 6.1, p. 54) read only the
  opponent's moves, which determine the whole history once the strategy is fixed, so the two
  notions give the same winners.
- **Winning.** `play σ τ` is the infinite play when I follows `σ` and II follows `τ`; I wins the
  play when it lies in the payoff `A`. A set is determined when I has a strategy winning against
  every `τ` or II has one winning against every `σ`. At most one of the two holds, since
  `play σ τ` cannot lie both in `A` and outside it.
- **Choice.** Lean's logic includes the axiom of choice, and no statement carries a choice
  hypothesis. The Gale–Stewart theorem for arbitrary `X` already uses it in this form
  (Moschovakis, §7F, p. 342, notes that it is equivalent to the axiom of choice), and the
  existence of a set that is not determined uses it essentially (Moschovakis, §7F, p. 341).
- **Pointclasses.** Countable unions of closed sets (`Σ⁰₂`) are written `⋃ i, F i` with each
  `F i` closed; countable intersections of open sets (`Π⁰₂`) are Mathlib's `IsGδ`. When `X` is
  uncountable, `ℕ → X` is not separable and an open set need not be a countable union of closed
  sets (Moschovakis, p. 220), so the two classes are stated separately.
- **Category.** Meagre sets are Mathlib's `IsMeagre` (the complement lies in the filter
  `residual`), and a set with the property of Baire is Mathlib's `BaireMeasurableSet`, which by
  `BaireMeasurableSet.iff_residualEq_isOpen` differs from an open set by a meagre set. The space
  `ℕ → X` is completely metrizable, hence a Baire space, by the Mathlib instances
  `TopologicalSpace.IsCompletelyMetrizableSpace.discrete`,
  `TopologicalSpace.IsCompletelyMetrizableSpace.pi_countable` and
  `BaireSpace.of_completelyPseudoMetrizable`.

## Layer 1: Gale–Stewart games and open and closed determinacy

### 1.1 Plays, strategies and determinacy

Define `history σ τ n`, the list of the first `n` moves: it is empty for `n = 0`, and
`history σ τ (n + 1)` appends to `history σ τ n` the value of `σ` (if `n` is even) or of `τ`
(if `n` is odd) at `history σ τ n`. Define `play σ τ n` as that same value, so that `play σ τ`
is the infinite play. Define `PlayerIWins A` as `∃ σ, ∀ τ, play σ τ ∈ A`, `PlayerIIWins A` as
`∃ τ, ∀ σ, play σ τ ∉ A`, and `IsDetermined A` as their disjunction (Moschovakis, p. 218;
Marker, Definitions 6.1–6.3, pp. 54–55).

**Checks.**
- If `X` is empty there is no function `List X → X`, since `List X` contains the empty list; so
  neither player wins, and the only payoff, the empty set, is not determined. So the
  determinacy theorems of 1.2, 1.3 and Layer 3 assume `X` nonempty.
- If `X` has one element there is one play, so every set is determined: I wins it when it
  contains that play, and II wins it otherwise.
- The parity convention: on `X = Bool` the set of sequences with `f 1 = true` is won by II, who
  answers `false` at position `1`; with the roles of even and odd positions exchanged it would
  be won by I.
- Perfect information matters: on `Bool`, I wins the set of sequences with `f 2 = f 1` by
  copying at position `2` the move of II at position `1`. If I had to fix its moves in advance,
  II would win, by playing at position `1` the opposite of I's planned move at position `2`.
- On `Bool`, among the sets that depend only on the first `k` letters, I wins 3 of the 4 for
  `k = 1`, 7 of the 16 for `k = 2`, 207 of the 256 for `k = 3` and 22687 of the 65536 for
  `k = 4`, and II wins all the others. The counts follow from the alternation of quantifiers
  `∃ a₀ ∀ a₁ ∃ a₂ ∀ a₃` (for `k = 3` the count is `256 − 7²`, for `k = 4` it is
  `65536 − 207²`), and for `k ≤ 3` they agree with running every strategy of each player,
  restricted to the histories that matter, against every strategy of the other.

*Needs:* nothing beyond core Lean (`List`, `Even`).

### 1.2 The Gale–Stewart theorem

Prove `isDetermined_of_isClosed`: if `X` is nonempty and discrete and `A ⊆ ℕ → X` is closed, then
`A` is determined (Gale and Stewart; Moschovakis, Theorem 6A.2, p. 219, for every nonempty `X`;
Marker, Theorem 6.4, p. 55).

Route (Moschovakis, Lemma 6A.1 and the proof of Theorem 6A.2, p. 219). For a finite sequence `u`
of even length, the subgame at `u` has payoff the set of `f` with `u ++ f ∈ A`. If II has no
winning strategy in the subgame at `u`, then some move `a` of I leaves II without a winning
strategy in the subgame at `u ++ [a, b]` for every answer `b`: otherwise a choice of an answer
and a winning strategy for each `a` would combine into a winning strategy at `u`. If II has no
winning strategy in `A`, let I always choose such a move. Every position of the resulting play
has an extension in `A`, since II would otherwise win the subgame there by playing anything;
so the play is a limit of points of `A` and lies in `A`, as `A` is closed.

**Checks.**
- On `Bool`, the closed set of sequences that are constantly `false` is won by II, who plays
  `true` at position `1`; the closed set of sequences with `f (2n + 2) = f (2n + 1)` for every
  `n` is won by I, who always repeats II's last move.
- The hypothesis that `X` is nonempty is needed: for empty `X` the empty set is closed and not
  determined (1.1).

*Needs:* 1.1; Mathlib `IsClosed`, the product topology on `ℕ → X` and `PiNat.cylinder`.

### 1.3 The shift lemma and open determinacy

- `isDetermined_compl_of_isDetermined_preimage_tail`: let `B` be the set of sequences `f` whose
  tail `n ↦ f (n + 1)` lies in `A`. If `B` is determined, then so is the complement of `A`
  (Moschovakis, Theorem 6A.4 and its proof, p. 222). No topology and no hypothesis on `X` is
  needed.
- `isDetermined_of_isOpen`: if `X` is nonempty and discrete and `A ⊆ ℕ → X` is open, then `A` is
  determined (Gale and Stewart, as Moschovakis, §6H, note 2, p. 290, reports; Marker,
  Exercise 6.5, p. 55).

Route. In the game `B` the first move is wasted, and from position `1` on the player II of `B`
plays the role of player I in the game of the tail: a winning strategy of I in `B` gives II a
winning strategy in the complement of `A`, and one of II in `B` gives I one there. For open `A`,
apply the shift lemma to the closed complement of `A`: its tail preimage is closed, since the tail
map is continuous, and so determined by 1.2.

**Checks.**
- Winning `A` and winning its complement are not dual, which is why the shift is needed: on
  `Bool`, I wins both the set of sequences with `f 0 = true` and its complement.
- The correspondence of winners in the route holds on all 256 subsets `A` of `Bool`-sequences
  that depend on the first three letters (their tail preimages `B` depend on the first four): I
  wins `B` exactly when II wins the complement of `A`, computed by the alternation of quantifiers
  of 1.1.
- On `Bool` the open set of sequences with some `true` is won by I at position `0`.

*Needs:* 1.1, 1.2; Mathlib `IsOpen`, `IsClosed.preimage`, `continuous_pi`.

### Examples

Games on `Bool` decided by their first few moves, the copying game of 1.1, and the closed and open
games of 1.2 and 1.3.

### Dependencies

Mathlib's product topology on `ℕ → X`, `PiNat.cylinder`, `IsClosed.preimage`. No other layer.

## Layer 2: a set that is not determined

### 2.1 The diagonal construction

Prove `exists_not_isDetermined`: if `X` has two distinct elements, some subset of `ℕ → X` is not
determined (Gale and Stewart; Moschovakis, Exercise 6A.6, p. 222, for `X = {0, 1}`, with a hint
that gives the construction; Marker, Exercise 6.8, p. 55, for `X = ℕ`, with a hint).

Route, first for `X = Bool`, following Moschovakis's hint. There are `2^ℵ₀` strategies for each
player, since `List Bool` is countably infinite, and for a fixed strategy of either player the
plays in which it is followed form a set of size `2^ℵ₀`, since the opponent's moves can be
prescribed arbitrarily. List the strategies of I as `σ_ξ` and those of II as `τ_ξ` for
`ξ < 2^ℵ₀`, and choose by transfinite recursion, at stage `ξ`, first a play `a_ξ` in which `τ_ξ`
is followed and then a play `b_ξ` in which `σ_ξ` is followed, each different from all plays
chosen before it; fewer than `2^ℵ₀` have been chosen at each stage. The set `A` of the `a_ξ` is
not determined: `σ_ξ` loses the play `b_ξ`, which is not in `A`, and `τ_ξ` loses the play `a_ξ`.
For general `X` with elements `x ≠ y`, pull this `A` back along the map sending `f` to the
sequence that is `true` where `f` takes the value `x`: a winning strategy in the pulled-back
game would give the same player a winning strategy in the game of `A` on `Bool`, by playing `x`
for `true` and `y` for `false` on the opponent's behalf, as in the hint to Moschovakis, Exercise
6A.7, p. 223. The player's own earlier moves on `X` are recomputed from the opponent's moves by
running its strategy, since the `Bool` history records only whether they equal `x`; it then
plays `true` exactly when its strategy on `X` plays `x`, and the `Bool` play is the image of the
play on `X`. The reduction from `Bool` to an arbitrary `X` is proved here.

**Checks.**
- The hypothesis is needed: if `X` has one element, every set is determined (1.1). For empty `X`
  the conclusion holds for the empty set, so the hypothesis is not an equivalence.
- The set constructed is neither closed nor open, nor a countable union of closed sets nor a
  countable intersection of open ones, by 1.2, 1.3 and Layer 3.

*Needs:* 1.1; Mathlib `Cardinal.continuum`, `Cardinal.ord` (a well-ordering of length `2^ℵ₀`).
(Proved here, following the cited hint.)

### Examples

The set constructed for `Bool`, and its pull-back to `ℕ → ℕ`.

### Dependencies

Layer 1 (the definitions of 1.1); Mathlib cardinal arithmetic and `Cardinal.ord`.

## Layer 3: Wolfe's theorem

### 3.1 Countable unions of closed sets

Prove `isDetermined_iUnion_of_isClosed`: if `X` is nonempty and discrete and every `F i` is a
closed subset of `ℕ → X`, then `⋃ i, F i` is determined (Wolfe; Moschovakis, Theorem 6A.3,
pp. 220–221, for every nonempty `X`).

Route (Moschovakis, proof of Theorem 6A.3). Define by transfinite recursion increasing sets `Wᵏ`
of positions from which I wins in an evident way: a position is in `W⁰` when I wins one of the
closed games `F i` from it, and in `Wᵏ` when, for some `i`, I wins from it the closed game of
staying, at every position of even length, inside the earlier sets `Wʲ` (`j < k`) or inside the
tree of `F i`. By induction on `k`, I wins `⋃ i, F i` from every position of `Wᵏ`, switching to
an earlier strategy as soon as an earlier set is reached. The sequence stabilises at some
ordinal; if the empty position is not in the limit, II wins by playing, through the determinacy
of the closed games of 1.2, to leave the tree of `F 0`, then that of `F 1`, and so on, without
ever entering the limit.

**Checks.**
- On `Bool` the set of eventually `false` sequences is the union of the closed sets of sequences
  that are `false` from position `n` on; it is neither closed nor open, and II wins it by always
  playing `true`.
- The hypothesis that `X` is nonempty is needed, as in 1.2.

*Needs:* 1.1, 1.2; Mathlib `IsClosed`, `Ordinal` (transfinite recursion).

### 3.2 Countable intersections of open sets

Prove `isDetermined_of_isGδ`: if `X` is nonempty and discrete, every `Gδ` subset of `ℕ → X` is
determined (Moschovakis, Corollary 6A.5, p. 222). Route: the complement of a `Gδ` set is a
countable union of closed sets, whose tail preimage is again one; apply 3.1 and the shift lemma
of 1.3.

**Checks.**
- On `Bool` the set of sequences with infinitely many `true` is `Gδ` and is won by I, who always
  plays `true`; its complement is the set of 3.1.

*Needs:* 1.3, 3.1; Mathlib `IsGδ`, `IsGδ.preimage`.

### Examples

The eventually `false` sequences and their complement.

### Dependencies

Layer 1 (1.1, 1.2, 1.3); Mathlib `IsClosed`, `IsGδ`, `IsGδ.preimage`, ordinals.

## Layer 4: the Banach–Mazur game

### 4.1 The game

A move of the Banach–Mazur game is a nonempty finite sequence of elements of `X`, encoded as a
pair `(x, w) : X × List X` standing for `x :: w`. Define `concatMoves m : ℕ → X`, the
concatenation of the moves `m 0, m 1, …`: its letter `k` is the letter `k` of the concatenation
of the first `k + 1` moves, which has at least `k + 1` letters. Define `banachMazurPayoff A` as
the preimage of `A` under `concatMoves`. The Banach–Mazur game of `A` is the Gale–Stewart game of
1.1 on the alphabet `X × List X` with payoff `banachMazurPayoff A`: I and II alternately extend
a finite sequence by nonempty blocks, and I wins when the infinite sequence produced lies in `A`
(Marker, p. 58, for `X = ℕ`, where each player plays the extended sequence; Moschovakis, p. 226,
plays basic neighbourhoods, shrinking in radius, of one of the book's product spaces, finite
products of `ω` and of perfect Polish spaces).

**Checks.**
- `concatMoves` agrees with the concatenation of the blocks on its first 40 letters for the
  moves `(i mod 3, [])`, `(1, [0, …, 0])` with `i mod 4` zeros, and `(i, [0, 1, …, i − 1])`.
- Moves are nonempty: if a player could add an empty block, both could stall and no infinite
  sequence would be produced.
- On `Bool` the set of sequences with `f 1 = true` is won by II in the Gale–Stewart game (1.1)
  and by I in the Banach–Mazur game, who opens with the block `[false, true]`.

*Needs:* 1.1; core `List.flatMap`, `List.getD`.

### 4.2 Banach's theorem

- `playerIIWins_banachMazurPayoff_iff_isMeagre`: if `X` is nonempty and discrete, II wins the
  Banach–Mazur game of `A ⊆ ℕ → X` if and only if `A` is meagre (Banach, as Moschovakis, §6H,
  note 1, p. 290, reports; Moschovakis, Exercise 6A.14 (i), pp. 226–227, with its hint; Marker,
  Lemma 6.19, p. 59, for `X = ℕ`).
- `playerIWins_banachMazurPayoff_iff`: if `X` is discrete, I wins the Banach–Mazur game of `A` if
  and only if `PiNat.cylinder x n \ A` is meagre for some `x` and `n` (Moschovakis,
  Exercise 6A.14 (ii), p. 227, with its hint; Marker, Lemma 6.20, p. 59, for the forward
  implication and `X = ℕ`). No nonemptiness is assumed: for empty `X` both sides are false.

Marker's proofs, for `X = ℕ`, apply verbatim to countable `X`; Moschovakis's are for the basic
neighbourhoods of the book's product spaces, which are separable, and Oxtoby generalised the
theorem to arbitrary topological spaces (Moschovakis, §6H, note 1, p. 290). For an arbitrary
discrete `X` the statements are proved here along the following route, which needs no
countability.

Route for the first statement. If `A` is contained in the union of closed nowhere dense sets
`Fₙ`, II answers at its `n`-th turn with a block after which the cylinder of the current
sequence misses `Fₙ`; this is possible because `Fₙ` is closed with empty interior, and the
resulting sequence lies outside every `Fₙ`. Conversely, let `τ` win for II. By Zorn's lemma
build families `𝓕₁, 𝓕₂, …` of positions after a move of II in which II followed `τ`, each
position of `𝓕ₖ₊₁` extending one of `𝓕ₖ` by one round (`𝓕₀` holds the empty position only),
the finite sequences of distinct members of each `𝓕ₖ` incompatible (neither a prefix of the
other), and each family maximal among those extending `𝓕ₖ` in this way. Maximality makes the
union `Gₖ` of their cylinders dense, by induction on `k`, because I can open any round with a
block that enters a given cylinder; each `Gₖ` is open. A point of all the `Gₖ` lies in the
cylinder of exactly one member of each family, these members are nested, and the point is the
play in which II follows `τ` along them; so it is not in `A`. Hence `A` lies in the union of the
closed nowhere dense complements of the `Gₖ`, and is meagre. For countable `X` the families can
be replaced by all positions at once, as Marker does.

Route for the second statement. If `PiNat.cylinder x n \ A` is meagre, I opens with a nonempty
block beginning with the first `n` letters of `x` and then plays as II does in the first part,
avoiding the nowhere dense sets that cover the cylinder minus `A`. Conversely, let `σ` win for I
with first block `w`. Then II wins the Banach–Mazur game of the cylinder of `w` minus `A` by
pretending to be I in the game of `A`. An opening block incompatible with `w` already leaves
that cylinder, and II may play anything. If the opening properly extends `w`, II reads its
letters beyond `w` as the first answer of an opponent of `σ` and answers with the reply of `σ`.
If the opening is a prefix of `w`, possibly `w` itself, II answers with one block made of the
rest of `w`, one further letter read as the opponent's first answer, and the reply of `σ` to it.
From then on II answers each block of its opponent with the reply of `σ` to the same block, so
the sequence produced is a play of `σ` and lies in `A`. The first statement then makes the
cylinder of `w` minus `A` meagre.

**Checks.**
- On `Bool` the set of eventually `false` sequences is meagre, a countable union of points each
  of which is closed with empty interior, and II wins its Banach–Mazur game by always playing the
  block `[true]`; I wins the game of its complement with the cylinder of length `0`.
- On `Bool`, of the 256 sets that depend only on the first three letters, I wins the
  Banach–Mazur game of the 255 nonempty ones (a nonempty such set contains a cylinder, which I's
  first block can reach) and II that of the empty one, against 207 won by I in the Gale–Stewart
  game (1.1).
- If `X` has one element, the only meagre set is the empty set, since the single point is open;
  II wins the game of the empty set and I that of the whole space.
- The hypothesis that `X` is nonempty is needed in the first statement: for empty `X` the empty
  set is meagre and II has no strategy.

*Needs:* 4.1; Mathlib `IsMeagre`, `IsNowhereDense`, `isMeagre_iff_countable_union_isNowhereDense`,
`IsMeagre.mono`, `PiNat.cylinder`, `PiNat.isOpen_cylinder`, Zorn's lemma (`zorn_subset`).

### 4.3 The property of Baire gives determinacy

Prove `isDetermined_banachMazurPayoff_of_baireMeasurableSet`: if `X` is nonempty and discrete and
`A ⊆ ℕ → X` has the property of Baire, then the Banach–Mazur game of `A` is determined
(Moschovakis, Exercise 6A.16, p. 227, the direction from (ii) to (i), with its hint).

Route: `A` differs from an open set `U` by a meagre set. If `U` is empty, `A` is meagre and II
wins by 4.2. Otherwise `U` contains a cylinder, which minus `A` is meagre, and I wins by 4.2.

**Checks.**
- The hypothesis that `X` is nonempty is needed: for empty `X` the empty set has the property of
  Baire and its game is not determined.
- On `Bool` the complement of a point is open, so has the property of Baire; it is won by I.

*Needs:* 4.2; Mathlib `BaireMeasurableSet`, `BaireMeasurableSet.iff_residualEq_isOpen`.

### 4.4 Determinacy gives the property of Baire

Prove `baireMeasurableSet_of_isDetermined_banachMazurPayoff`: let `X` be discrete and `Λ` a family
of subsets of `ℕ → X` such that the Banach–Mazur game of every member of `Λ` is determined and
`B \ U` belongs to `Λ` whenever `B` does and `U` is open. Then every member of `Λ` has the
property of Baire (Marker, Theorem 6.21 and its proof, p. 60, for the projective subsets of
`ℕ → ℕ` under projective determinacy, whose proof uses exactly these two properties; Moschovakis,
Exercise 6A.15, p. 227, for adequate pointclasses). With 4.3, when `X` is nonempty, a family
closed under removing open sets has all its Banach–Mazur games determined if and only if all its
members have the property of Baire; for empty `X` the family consisting of the empty set has the
property of Baire and no determined game.

Route. Let `U` be the union of the cylinders `N` with `N \ A` meagre; it is open. The set
`U \ A` is meagre: the shortest beginnings defining such cylinders give pairwise disjoint
cylinders covering `U`, the meagre parts inside disjoint open sets combine level by level into
countably many nowhere dense sets (a union of nowhere dense sets lying in pairwise disjoint open
sets is nowhere dense: a nonempty open set meeting one of the open sets contains a nonempty open
set inside it that misses the closure of its piece, and so misses every piece; one meeting none
of them misses every piece already), and for countable `X` it is simply a countable union. The set
`A \ U` belongs to `Λ`, so its game is determined. If I won it, some cylinder `N` would have
`N \ (A \ U)` meagre, hence `N \ A` meagre and `N ⊆ U`, so `N` itself would be meagre, against
the Baire category theorem in `ℕ → X`. So II wins, `A \ U` is meagre by 4.2, and `A` differs
from the open set `U` by a meagre set.

**Checks.**
- The closure under removing open sets is used: a set containing the cylinder of sequences
  beginning with `true` is won by I whatever it contains elsewhere, so a family consisting of the
  union of that cylinder with a set without the property of Baire inside the cylinder of
  sequences beginning with `false` satisfies the determinacy hypothesis and not the conclusion.
  Such a set exists by the axiom of choice: Moschovakis, Exercise 2H.6, p. 83, constructs one
  among the reals, and the construction of its hint uses only that the space is perfect and
  Polish, which the cylinder is.
- For empty `X` every member of `Λ` is empty, and the statement holds without a nonemptiness
  hypothesis.

*Needs:* 4.2; Mathlib `BaireMeasurableSet.iff_residualEq_isOpen`, `not_isMeagre_of_isOpen`,
`IsNowhereDense`, `isMeagre_iff_countable_union_isNowhereDense`, `PiNat.isOpen_cylinder`,
`BaireSpace.of_completelyPseudoMetrizable` with the instances of the Conventions,
`isMeagre_iUnion`.

### Examples

The eventually `false` sequences on `Bool` and their complement, cylinders, and sets depending on
finitely many letters, in both games.

### Dependencies

Layer 1 (the definitions of 1.1). Mathlib `IsMeagre`, `IsNowhereDense`, `BaireMeasurableSet`,
`BaireSpace`, `PiNat.cylinder`, `zorn_subset`. No theorem of Layers 1 to 3 is used.

## Scope and ownership

This roadmap owns the targets stated above: Gale–Stewart games on `ℕ → X` with their strategies,
plays and determinacy; the determinacy of closed and open sets and the shift lemma; a set that is
not determined; Wolfe's theorem for countable unions of closed sets and countable intersections
of open sets; the Banach–Mazur game on `ℕ → X`, Banach's theorem, and the two theorems relating
its determinacy to the property of Baire.

Already in the libraries and therefore not targets: Mathlib's product topology and cylinders
(`PiNat.cylinder`, `PiNat.isOpen_cylinder`), meagre and nowhere dense sets, the property of Baire
with its characterisation through open sets (`BaireMeasurableSet.iff_residualEq_isOpen`), and the
Baire category theorem for completely metrizable spaces, which covers `ℕ → X` through the
instances named in the Conventions. Mathlib's `Descriptive.tree` (trees of finite sequences in
the sense of descriptive set theory) is available for the trees of the closed sets in the route
of 3.1. Tau Ceti's Ehrenfeucht–Fraïssé games (`TauCeti/ModelTheory/BackAndForth/Game/`), built
for the completed roadmap InfinitaryLogic, are games between two structures with
Duplicator's strategies as their own objects; the Gale–Stewart theorem here is a statement about
arbitrary payoffs and does not restate any of them. Tau Ceti's `TauCeti.banachMazurDist`
(`TauCeti/Analysis/Normed/Module/BanachMazur.lean`) is the Banach–Mazur distance between normed
spaces and is unrelated to the game of Layer 4.

Neighbouring roadmaps:

- BorelEquivalenceRelations, in its introduction and in its list of subjects outside its scope,
  says that infinite games and determinacy, and in particular the Banach–Mazur and Choquet games,
  belong to separate roadmaps. This roadmap uses nothing of it and states nothing it states.
- NoncompactQuantumSymmetry (Layer 4, section M1.BorelRealization) takes on in its proof route
  the strong-Choquet criterion for separable metrizable spaces and the winning-strategy
  construction it requires, when no library supplies them. Choquet games are not treated here.

Outside the scope: Borel determinacy and Martin's theorem, determinacy of `Σ⁰₃` and higher
classes, projective determinacy and large cardinals, the axiom of determinacy, Wadge's lemma, the
perfect-set game, games on reals and measure-theoretic games, Choquet games, quasistrategies and
determinacy without choice, finite games, and every procedure for computing strategies.

## Exact supplier contracts

### From Mathlib

- `Mathlib/Topology/MetricSpace/PiNat.lean`: `PiNat.cylinder x n` (the sequences `y` with
  `y i = x i` for every `i < n`); `PiNat.isOpen_cylinder` (cylinders are open when every factor
  is discrete).
- `Mathlib/Topology/GDelta/Basic.lean`: `IsGδ` (an intersection of a countable family of open
  sets); `IsGδ.preimage` (preimages under continuous maps); `residual` (the filter generated by
  dense open sets); `IsNowhereDense` (the closure has empty interior); `IsMeagre` (the complement
  belongs to `residual`); `isMeagre_iff_countable_union_isNowhereDense` (meagre if and only if
  contained in a countable union of nowhere dense sets); `IsMeagre.mono`; `isMeagre_iUnion` (a
  countable union of meagre sets is meagre).
- `Mathlib/Topology/Baire/BaireMeasurable.lean`: `BaireMeasurableSet` (measurable for the
  σ-algebra generated by the Borel sets and the meagre sets);
  `BaireMeasurableSet.iff_residualEq_isOpen` (equivalently, equal to an open set outside a meagre
  set).
- `Mathlib/Topology/Baire/Lemmas.lean`: `not_isMeagre_of_isOpen` (in a Baire space a nonempty
  open set is not meagre).
- `Mathlib/Topology/Baire/CompleteMetrizable.lean`: `BaireSpace.of_completelyPseudoMetrizable`.
  `Mathlib/Topology/Metrizable/CompletelyMetrizable.lean`:
  `TopologicalSpace.IsCompletelyMetrizableSpace.discrete` (a discrete space is completely
  metrizable) and `TopologicalSpace.IsCompletelyMetrizableSpace.pi_countable` (a countable product
  of completely metrizable spaces is completely metrizable).
- `Mathlib/Topology/Continuous.lean`: `IsClosed.preimage`. `Mathlib/Topology/Constructions.lean`:
  `continuous_pi` (for the continuity of the tail map).
- `Mathlib/Order/Zorn.lean`: `zorn_subset`. `Mathlib/SetTheory/Cardinal/Continuum.lean`:
  `Cardinal.continuum`. `Mathlib/SetTheory/Ordinal/Basic.lean`: `Cardinal.ord` (the least ordinal
  of a given cardinality), with transfinite recursion on ordinals.
  `Mathlib/SetTheory/Descriptive/Tree.lean`: `Descriptive.tree`.
- Core Lean: `List`, `List.flatMap`, `List.getD`, `Even` with its decidability on `ℕ`.

### From Tau Ceti

Nothing is imported. `TauCeti/ModelTheory/BackAndForth/Game/Finite.lean` and
`TauCeti/ModelTheory/BackAndForth/Game/Infinite.lean` are named in the scope section only, as a
boundary.

## References

- Yiannis N. Moschovakis, *Descriptive Set Theory*, second edition, American Mathematical Society,
  2009; the version posted on the author's page (`www.math.ucla.edu/~ynm/lectures/dst2009/`,
  file `dst2009.pdf`, dated April 8, 2009), with its printed page numbers: §6A, pp. 218–227
  (Lemma 6A.1, Theorems 6A.2–6A.4, Corollary 6A.5, Exercises 6A.6, 6A.7, 6A.14–6A.16), §6H,
  notes 1–3, pp. 290–291, §7F, pp. 341–342, and Exercise 2H.6, p. 83. The items numbered as
  exercises are stated with hints, which the routes above follow where they say so.
- David Marker, *Descriptive Set Theory*, lecture notes, University of Illinois at Chicago,
  Fall 2002, on the author's page (`homepages.math.uic.edu/~marker/math512/dst.pdf`): §6,
  Definitions 6.1–6.3, Theorem 6.4, Exercises 6.5 and 6.8, the Banach–Mazur game on p. 58,
  Lemmas 6.19 and 6.20 and Theorem 6.21, pp. 54–60.
- The papers of Gale and Stewart (1953) and Wolfe (1955), Banach's unpublished proof, and
  Oxtoby's generalisation (1957) are named as Moschovakis, §6H, attributes them; they were not
  opened, and no locator into them is given.
