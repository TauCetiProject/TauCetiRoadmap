# Roadmap: social choice

**Summary.** Social choice theory asks how the preferences of individual voters can be combined
into a collective ranking or a collective choice. Preferences are rankings of a set of
alternatives, with or without ties, and a profile assigns one to each voter. A social welfare
function turns every profile into a collective ranking; a social choice function turns it into a
set of chosen alternatives, or into a single alternative when it is resolute. The theorems are
axiomatic statements about such functions.

The headline theorems are these.

- *Arrow's theorem.* With finitely many voters and at least three alternatives, finitely or
  infinitely many, every social welfare function that satisfies the Pareto condition (a
  unanimous strict preference is respected) and independence of irrelevant alternatives (the
  collective comparison of two alternatives depends only on the voters' comparisons of those
  two) has a dictator, a voter whose strict preferences society always adopts, whether the
  ballots are strict rankings or rankings with ties. For strict ballots and any set of voters,
  the two axioms hold exactly when society follows the coalitions of an ultrafilter.
- *The Gibbard–Satterthwaite theorem.* With finitely many voters, a resolute social choice
  function with at least three possible outcomes that no voter can manipulate by misreporting a
  strict ranking always chooses the outcome that one fixed voter ranks highest among the possible
  outcomes. Strong monotonicity gives the same conclusion (Muller–Satterthwaite).
- *May's theorem and Sen's theorem.* For two alternatives and finitely many voters, a social
  choice function that never chooses the empty set is anonymous, neutral and positively
  responsive exactly when it is the majority rule. No social choice function that never chooses
  the empty set satisfies the Pareto condition while two different voters each control the
  collective choice between some pair of alternatives.
- *The median voter theorem.* Let finitely many voters rank alternatives on a line, each
  preference falling off on both sides of a peak. An alternative with more than half of the
  peaks at or to its left and more than half at or to its right beats every other alternative by
  majority. If there is an alternative at all, some alternative is beaten by none, and the strict
  majority relation is transitive.

The roadmap builds on Mathlib's ultrafilters, with the fact that every ultrafilter on a finite
type is principal. BooleanFunctionAnalysis states Arrow's theorem for three alternatives when one
rule decides all three pairwise contests and proves it by Fourier analysis; Arrow's theorem here
implies that statement, as the scope section explains. CooperativeGames treats voting as simple
games and power indices, which are not repeated here.

Layer 1 below defines preferences, profiles and majorities. Layer 2 proves Arrow's theorem, first
in the ultrafilter form and then for finitely many voters with strict or weak ballots. Layer 3
proves May's and Sen's theorems, Layer 4 the Muller–Satterthwaite and Gibbard–Satterthwaite
theorems. Layer 5 treats single-peaked preferences: the median voter theorem, the transitivity
of the majority relation and the strategy-proofness of the Condorcet rule. Layers 2 to 5 depend
on Layer 1 and on no other layer.

## Conventions

- **Alternatives and voters.** Alternatives form a type `α` and voters a type `ι`. Only May's
  theorem (3.1) assumes `α` finite, with `[Fintype α]` and exactly two elements. Arrow's theorem
  and its ultrafilter form (2.2 to 2.4) assume at least three alternatives, `3 ≤ ENat.card α`,
  where Mathlib's `ENat.card` is `⊤` on an infinite type; Layer 4 counts the possible outcomes
  with `Set.encard`, which is `⊤` on an infinite set; Layer 5 gives `α` a Mathlib `LinearOrder`,
  the axis. Every theorem that counts voters assumes `[Finite ι]`; the ultrafilter form of
  Arrow's theorem (2.2) and Sen's theorem (3.2) allow any type of voters, including the empty
  one.
- **Preferences.** A weak preference `WeakPref α` is a relation `rel` with Lean's `Std.Total` and
  Mathlib's `IsTrans`, a total preorder; `R.rel x y` reads "`x` is at least as good as `y`". Its
  strict part is `R.P x y`, that is `R.rel x y ∧ ¬R.rel y x`. A linear preference `LinPref α` is a
  weak preference whose relation also has `Std.Antisymm`, so that it is a linear order in
  Mathlib's sense `IsLinearOrder`, with the better alternative first; distinct alternatives are
  never indifferent. Every linear preference is a weak preference through `LinPref.toWeakPref`.
- **Profiles.** A profile is a function `p : ι → LinPref α` (or `ι → WeakPref α`). The profile in
  which voter `i` alone changes ballot to `b` is `Function.update p i b`. Writing a ranking as a
  list `a b c` means `a` above `b` above `c`.
- **Rules.** A social welfare function is a map `F : (ι → β) → WeakPref α`, where the ballots of
  type `β` are read as weak preferences through a map `w : β → WeakPref α`: here `β` is
  `LinPref α` with `w = LinPref.toWeakPref`, or `WeakPref α` with `w = id`. A social choice
  function is a map `F : (ι → LinPref α) → Set α`; the theorems that use one assume nonempty
  values. A resolute social choice function is a map `F : (ι → LinPref α) → α`, and its possible
  outcomes are `Set.range F`.
- **Counting.** The number of voters with a property is `Set.ncard` of the set of those voters;
  with `[Finite ι]` it is the cardinality of a finite set. On an infinite type `Set.ncard` of an
  infinite set is `0`, which is why counting statements assume `[Finite ι]`.

## Layer 1: preferences, profiles and majorities

### 1.1 Preferences and renaming

Define the structures `WeakPref` and `LinPref` and the strict part `WeakPref.P` as in the
Conventions. Define `LinPref.map π r` for a permutation `π : Equiv.Perm α`: the linear
preference that ranks `π x` above `π y` exactly when `r` ranks `x` above `y`. (Weak and linear
orders as the two models of preference: Endriss, §2, p. 5.)

**Checks.**
- On three alternatives there are `6` linear preferences and `13` weak preferences.
- On `α = {a, b, c}`, with `π` the transposition of `a` and `b`, the preference `a b c` is mapped
  to `b a c`. The other reading, with `π` in place of its inverse in the definition, agrees here
  because a transposition is its own inverse; for the 3-cycle `π = (a b c)` (sending `a` to `b`)
  the definition maps `a b c` to `b c a`, while the other reading gives `c a b`.

*Needs:* Lean `Std.Total`, `Std.Antisymm`; Mathlib `IsTrans`, `Equiv.Perm`. (Definitions.)

### 1.2 Majority and Condorcet winners

Define `majorityPrefers p x y`: more voters strictly prefer `x` to `y` than `y` to `x`. Define
`IsCondorcetWinner p m`: `m` beats every other alternative by majority; and
`IsWeakCondorcetWinner p m`: no alternative beats `m`. Define `majorityWinners p`, the set of weak
Condorcet winners. For two alternatives `majorityWinners` is the simple majority rule: it chooses
the alternative preferred by more voters, and both alternatives on a tie (Endriss, pp. 10–11).

**Checks.**
- The Condorcet paradox: in the profile `a b c`, `b c a`, `c a b` of three voters, `a` beats
  `b`, `b` beats `c` and `c` beats `a`, each by two votes to one, so the profile has no weak
  Condorcet winner and `majorityWinners` is empty there. So for three or more alternatives
  `majorityWinners` is not a social choice function with nonempty values; it is used as one only
  for two alternatives (3.1).
- With no voters every alternative is a weak Condorcet winner and none is a Condorcet winner
  unless it is the only alternative.
- On two alternatives `a`, `b` and four voters, two of whom prefer `a`, `majorityWinners` is
  `{a, b}`; with three of the four preferring `a` it is `{a}`.

*Needs:* 1.1; Mathlib `Set.ncard`. (Definitions.)

### Examples

The cyclic profile of three voters on three alternatives; profiles on two alternatives with and
without ties.

### Dependencies

Lean `Std.Total`, `Std.Antisymm`; Mathlib `IsTrans`, `Equiv.Perm`, `Set.ncard`. No other layer.

## Layer 2: Arrow's theorem

### 2.1 The Arrow axioms

For a social welfare function `F` with ballots read through `w`:

- `IsPareto w F`: whenever every voter strictly prefers `x` to `y`, so does `F p` (Endriss,
  p. 6).
- `IsIIA w F`: if at two profiles `p` and `q` every voter compares `x` and `y` in the same way,
  in both directions, then `F p` and `F q` agree on whether `x` is at least as good as `y`
  (Endriss, p. 6; Geanakoplos, p. 1, where the comparison is "higher, lower, or indifferent").
- `IsDictator w F i`: whenever voter `i` strictly prefers `x` to `y`, so does `F p` (Geanakoplos,
  p. 1). A dictator decides only the strict comparisons it makes; when `i` is indifferent,
  society may rank either way.

A set `G` of voters is decisive when society strictly prefers `x` to `y` at every profile in which
every member of `G` does. Pareto says that the set of all voters is decisive, and `i` is a
dictator exactly when `{i}` is decisive.

**Checks.**
- A dictatorship (`F p = w (p i)`) satisfies both axioms, and so does, for weak ballots, the
  lexicographic rule that follows voter `1` and breaks the ties of voter `1` by voter `2`. For it
  voter `1` is a dictator, yet `F p` differs from voter `1`'s ballot whenever voter `1` is
  indifferent between two alternatives that voter `2` ranks strictly. So for weak ballots a
  dictator's ballot is not always the social ranking.
- The inverse dictatorship, which reverses voter `i`'s ballot, satisfies independence and fails
  the Pareto condition; so does every constant rule on at least two alternatives.
- For two alternatives, majority with indifference on ties satisfies both axioms and, with three
  voters, has no dictator; so at least three alternatives are needed in 2.2 to 2.4.

*Needs:* 1.1. (Definitions.)

### 2.2 Decisive coalitions form an ultrafilter

Prove `isPareto_and_isIIA_iff_exists_ultrafilter`: if `α` has at least three elements, a social
welfare function `F` on profiles of linear preferences satisfies the Pareto condition and
independence of irrelevant alternatives if and only if some ultrafilter `U` on `ι` satisfies
`(F p).P x y ↔ {i | (p i).P x y} ∈ U` for all `p`, `x`, `y`. There is no condition on `ι`. In
particular the decisive sets of such an `F` are exactly the members of `U`, and every `F p` is a
linear order, since of two complementary sets of voters exactly one lies in `U`. (Kirman and
Sondermann, 1972; Endriss, p. 8, describes the decisive coalitions as an ultrafilter and derives
Arrow's theorem from it; proved here.)

Route. For the reverse direction, `(F p).rel x y` is `¬(F p).P y x`, which depends only on the set
of voters who strictly prefer `y` to `x`; and the set of all voters lies in `U`. For the forward
direction, take `U` to be the family of decisive sets. Pareto puts the set of all voters in it,
and the empty set is not decisive because `(F p).P x y` and `(F p).P y x` exclude each other.
Two lemmas from Endriss's proof of Theorem 1, pp. 6–7, carry the rest. First, if society strictly
prefers `x` to `y` whenever exactly the members of `G` strictly prefer `x` to `y`, then `G` is
decisive (Endriss builds the profile for four distinct alternatives `x`, `y`, `x'`, `y'`; when they
are not distinct, the same construction on three alternatives, applied repeatedly through a third
alternative when `(x', y')` is `(y, x)`, gives the other cases). Second, for a decisive `G` split
into disjoint `G₁` and `G₂`, the profile in which `G₁` votes `x y z`, `G₂` votes `y z x` and
everyone else `z x y` shows that `G₁` or `G₂` is decisive. With `G₂` the complement of `G₁` inside
the set of all voters this shows that a set or its complement is decisive. Supersets of decisive
sets are decisive, and two disjoint sets are never both decisive (let one strictly prefer `x` to `y`
and the other `y` to `x`). So for decisive `A` and `B`, splitting `B` into `A ∩ B` and `B \ A` shows
that `A ∩ B` is decisive.

**Checks.**
- On `ι = ℕ`, for a nonprincipal ultrafilter `U`, the rule "society strictly prefers `x` to `y`
  when the voters who do form a set in `U`" satisfies both axioms and has no dictator, because no
  singleton lies in `U` (Fishburn, 1970, as cited by Endriss, p. 7, for the existence of such a
  rule). So finiteness of `ι` is needed in 2.3.
- With no voters both sides fail: no ultrafilter exists on the empty type, and the Pareto
  condition would demand that society strictly prefer `x` to `y` and `y` to `x`.
- For two alternatives `a`, `b` and three voters, majority satisfies both axioms, and the family
  of sets of at least two voters is not an ultrafilter (it is not closed under intersection), so
  the forward direction fails without the bound on `α`.

*Needs:* 2.1; Mathlib `Ultrafilter`, `ENat.card`. (Proved here, following the cited route.)

### 2.3 Arrow's theorem for linear ballots

Prove `exists_isDictator_of_isPareto_of_isIIA`: if `ι` is finite and `α` has at least three
elements, finitely or infinitely many, every `F : (ι → LinPref α) → WeakPref α` satisfying the
Pareto condition and independence of irrelevant alternatives has a dictator (Arrow, 1951;
Endriss, Theorem 1, p. 6, for linear orders as values, with a set of alternatives that need not
be finite, p. 4, and the remark on p. 7 that its finiteness does not matter). A social welfare
function with linear values is the special case that composes with `LinPref.toWeakPref`.

This is the classical form of Arrow's theorem and is stated as the headline of the layer,
although it follows from 2.2 in two steps (below) and also from 2.4 (see 2.4).

Route: by 2.2 and Mathlib's `Ultrafilter.eq_pure_of_finite`, the ultrafilter is `pure i` for some
voter `i`, and `{j | (p j).P x y} ∈ pure i` says that `i` strictly prefers `x` to `y`.

**Checks.**
- For linear ballots a dictator `i` fixes the whole ranking: `F p` equals `p i` read as a weak
  preference, since `p i` ranks any two distinct alternatives strictly. This fails for weak
  ballots (2.1).
- On three alternatives and two or three voters, and on four alternatives and two voters, a
  search over all social welfare functions satisfying independence (each is a choice, for every
  pair of alternatives, of a collective comparison as a function of the voters' comparisons of
  that pair) finds that every one with weak-preference values satisfying the Pareto condition is
  a dictatorship.
- With one voter the Pareto condition alone forces `F p` to be the voter's ballot, so the
  identity is the only rule. For weak ballots it is not: with one voter, a rule that breaks the
  voter's ties by a fixed weak order satisfies both axioms.
- On two alternatives and three voters, majority satisfies both axioms and has no dictator.

*Needs:* 2.2; Mathlib `Ultrafilter.eq_pure_of_finite`, `Ultrafilter.mem_pure`. (Proved here.)

### 2.4 Arrow's theorem for weak ballots

Prove `exists_isDictator_of_isPareto_of_isIIA_weakPref`: if `ι` is finite and `α` has at least
three elements, finitely or infinitely many, every `F : (ι → WeakPref α) → WeakPref α`
satisfying the Pareto condition and independence of irrelevant alternatives has a dictator
(Arrow, 1951; Geanakoplos, statement "Arrow's Theorem", p. 1, for weak orders as ballots and
values). By the first Check of 2.1 the dictator's ballot need not be the social ranking.

Route: Geanakoplos's first proof, pp. 1–2. For a fixed alternative `b`, at a profile where every
voter puts `b` at the top or the bottom, society does as well; moving `b` from the bottom to the
top voter by voter finds a voter who is pivotal for `b`; this voter is a dictator over every pair
not containing `b`, and comparing the pivotal voters of two alternatives shows they coincide.
Geanakoplos takes the set of alternatives finite; no step of this route uses that.

2.4 implies 2.3. Fix a linear order on `α` and let a rule `F` on linear ballots act on a profile
of weak ballots by first breaking every voter's ties by that order. The extended rule satisfies
the Pareto condition and independence whenever `F` does, since the refined comparison of `x` and
`y` depends only on the voter's comparison of `x` and `y`, and it agrees with `F` on linear
ballots; so its dictator is a dictator of `F`. The other way there is no such direct reduction:
a rule on weak ballots, restricted to linear ballots, has a dictator there by 2.3, and that voter
must still be shown to dictate at profiles with ties.

**Checks.**
- On three alternatives with two or three voters, the search of 2.3 over rules on weak ballots
  finds that every rule satisfying the Pareto condition has a dictator, although not every such
  rule is a dictatorship: the lexicographic rule of 2.1 is one of them.
- On two alternatives and two voters there is a rule on weak ballots satisfying both axioms with
  no dictator: indifference unless both voters, or one voter with the other indifferent, strictly
  prefer one alternative.

*Needs:* 2.1. (Proved here, following the cited route.)

### Examples

Dictatorships, the lexicographic rule, inverse dictatorships and constant rules on three
alternatives; majority on two alternatives; rules given by ultrafilters on an infinite set of
voters.

### Dependencies

Layer 1. Mathlib `Ultrafilter`, `Ultrafilter.eq_pure_of_finite`, `Ultrafilter.mem_pure`.

## Layer 3: majority on two alternatives and liberal rights

### 3.1 May's theorem

For a social choice function `F : (ι → LinPref α) → Set α` define:

- `IsAnonymous F`: `F (p ∘ σ) = F p` for every permutation `σ` of the voters.
- `IsNeutral F`: renaming the alternatives in every ballot by `π` renames the chosen set,
  `F (fun i => (p i).map π) = π '' F p`.
- `IsPositivelyResponsive F`: if `x ∈ F p`, and `q ≠ p` is a profile in which every voter who
  strictly prefers `x` to some `y` at `p` still does, while every comparison between two
  alternatives other than `x` is as at `p`, then `F q = {x}`.

(Endriss, p. 10.) Prove `isAnonymous_and_isNeutral_and_isPositivelyResponsive_iff`: if `ι` is
finite and `α` has exactly two elements, a social choice function with nonempty values is
anonymous, neutral and positively responsive if and only if it equals `majorityWinners` (May,
1952; Endriss, Theorem 3, p. 11). Any finite number of voters is allowed, including none.

Route: Endriss's proof, p. 11. On two alternatives a profile is determined by the set of voters
preferring the first, and by anonymity only its size matters. If some profile with a margin of
one vote for `x` lets `y` win, moving one supporter of `x` to `y` gives, by positive
responsiveness, `y` alone, and by neutrality the mirror situation, a contradiction. For an even
number of voters, neutrality forces both alternatives at a tie, since swapping the alternatives
maps a tied profile to one of the same size; positive responsiveness then fixes every other
profile. With no voters there is one profile, and neutrality gives both alternatives.

**Checks.**
- For every number of voters from `0` to `3`, a search over all social choice functions with
  nonempty values on two alternatives finds exactly one with the three properties, the majority
  rule; among the anonymous ones the same holds up to `8` voters.
- Each property is needed. With two voters, the dictatorship of voter `1` is neutral and
  positively responsive and not anonymous; the rule choosing `{a}` unless both voters prefer `b`
  is anonymous and positively responsive and not neutral; the constant rule `{a, b}` is anonymous
  and neutral and not positively responsive.
- The condition `q ≠ p` is needed: without it, for an even number of voters no function has the
  three properties, since at a tie both alternatives are chosen.
- Nonemptiness is needed: the rule with empty values everywhere is anonymous, neutral and
  positively responsive.

*Needs:* 1.1, 1.2; Mathlib `Equiv.Perm`, `Set.image`. (Proved here, following the cited route.)

### 3.2 Sen's theorem

Define `IsParetoChoice F`: an alternative `y` such that every voter strictly prefers some `x` to
`y` is not chosen. Define `IsDecisiveOver F i x y`: `x ≠ y`, and at every profile whichever of
`x`, `y` voter `i` ranks lower is not chosen (Endriss, p. 9). Prove
`false_of_isParetoChoice_of_isDecisiveOver`: no social choice function with nonempty values
satisfies the Pareto condition while two different voters `i ≠ j` are each decisive over some
pair of distinct alternatives (Sen, 1970; Endriss, Theorem 2, p. 9, assumes every voter decisive
over a pair and remarks that two suffice). Voters and alternatives may be infinite.

Route: Endriss's proof, p. 9, for four distinct alternatives `x₁, y₁, x₂, y₂`: let `i` rank `x₁`
above `y₁`, `j` rank `x₂` above `y₂`, everyone rank `y₁` above `x₂` and `y₂` above `x₁`, and these
four above all others. Decisiveness excludes `y₁` and `y₂`, and Pareto excludes the rest. When the
two pairs share an alternative or coincide, a profile on the at most three alternatives involved,
placed above all others, does the same: if the pairs coincide, `i` and `j` rank them oppositely.

**Checks.**
- For two to four alternatives and two or three voters, every choice of two distinct voters and
  two pairs, overlapping or not, has a profile at which Pareto and decisiveness exclude every
  alternative.
- The voters must differ: on finitely many alternatives, one voter `i` decisive over every pair
  is consistent with Pareto, by the rule that chooses `i`'s top alternative.
- On two alternatives two voters decisive over the same pair already conflict, at a profile where
  they disagree.

*Needs:* 1.1. (Proved here, following the cited route.)

### Examples

Majority, dictatorships and constant rules on two alternatives; the profile of Sen's proof on four
alternatives.

### Dependencies

Layer 1. Mathlib `Equiv.Perm`, `Set.image`.

## Layer 4: monotonicity and manipulation

### 4.1 The Muller–Satterthwaite theorem

For a resolute social choice function `F : (ι → LinPref α) → α` define `IsStronglyMonotone F`: if
every voter who strictly prefers `F p` to some `y` at `p` still does at `q`, then `F q = F p`
(Endriss, p. 11; Endriss also asks `p ≠ q`, which changes nothing). Define
`IsDictatorialOnRange F`: some voter `i` is such that, at every profile, `F p` is the alternative
`i` ranks highest among the possible outcomes `Set.range F`. Prove
`isDictatorialOnRange_of_isStronglyMonotone`: if `ι` is finite and `F` has at least three possible
outcomes, `3 ≤ (Set.range F).encard` (finitely or infinitely many), a strongly monotone `F` is
dictatorial on its range (Muller and Satterthwaite, 1977; Endriss, Theorem 4, p. 12, for
surjective `F`, where the range is all of `α`, and a set of alternatives that need not be
finite, p. 4).

Route. For surjective `F` follow Endriss's proof, pp. 12–13: strong monotonicity gives
independence (if `F p = x` and the voters ranking `x` above `y` are the same at `q`, then
`F q ≠ y`) and, with surjectivity, the Pareto condition; then the decisive-coalition argument of
2.2 for resolute rules finds a dictator. For the range `Y` of `F` in general, extend each profile
of linear preferences on `Y` to `α` by placing the alternatives outside `Y` below all of `Y` in a
fixed order, and let `G` be `F` at the extended profile. If `F p = y`, every voter who puts `y`
above an alternative at `p` still does at the extension of the restriction of `p` to `Y`, so
strong monotonicity gives `F` the value `y` there. So `G` is onto `Y`, strongly monotone, and
`F p = G` of the restriction of `p`; the surjective case applied to `G` gives the conclusion.

**Checks.**
- A constant rule is strongly monotone and has one possible outcome (Endriss, p. 13); the rule
  on three alternatives that chooses `a` unless both of two voters rank `b` above `a`, and then
  `b`, is strongly monotone with two possible outcomes and is not dictatorial on its range. So
  three possible outcomes are needed.
- On four alternatives, the rule that chooses voter `1`'s highest-ranked alternative among
  `a`, `b`, `c` is strongly monotone and dictatorial on its range, but does not always choose
  voter `1`'s top alternative: dictatorship over all of `α` would be false.
- A search over all resolute social choice functions on three alternatives with two or three
  voters, and on four alternatives with two voters, finds that every strongly monotone one with
  at least three possible outcomes is dictatorial on its range.

*Needs:* 1.1; Mathlib `Set.range`, `Set.encard`. (Proved here, following the cited route.)

### 4.2 The Gibbard–Satterthwaite theorem

Define `IsStrategyProof F`: no voter `i`, by replacing the ballot `p i` with any ballot `b`,
obtains an outcome `F (Function.update p i b)` that `p i` strictly prefers to `F p` (Endriss,
p. 14). Prove `isDictatorialOnRange_of_isStrategyProof`: if `ι` is finite and `F` has at least
three possible outcomes, finitely or infinitely many, a strategy-proof `F` is dictatorial on its
range (Gibbard, 1973;
Satterthwaite, 1975, in the form with the range; Endriss, Theorem 5, p. 14, for surjective `F`).

Route: Endriss's proof, p. 14: a strategy-proof rule is strongly monotone. If `F p = x`,
`F q ≠ x` and the voters ranking `x` above any `y` at `p` still do at `q`, change the ballots
from `p` to `q` one voter at a time. Every intermediate profile keeps the voters ranking `x`
above each `y`, and at the first change that moves the outcome from `x` to some `x'`, the voter
`i` who changed gains by one of the two ballots: by the earlier one if `i` ranks `x` above `x'`
at the later profile, and by the later one otherwise, since then `i` also ranks `x'` above `x` at
the earlier profile. This uses the finiteness of `ι`. Then apply 4.1.

**Checks.**
- The rule of the first Check of 4.1 with two outcomes is strategy-proof and not dictatorial on
  its range; with two alternatives, majority among three voters is strategy-proof and not
  dictatorial. So three possible outcomes are needed, and a hypothesis of unanimity or Pareto
  would be stronger than needed: each implies that every alternative is a possible outcome.
- Plurality on `a`, `b`, `c` with ties broken in the order `a`, `b`, `c` is not strategy-proof:
  at the profile `a b c`, `b c a`, `c b a` it chooses `a`, and the third voter, by voting
  `b c a`, obtains `b`, which that voter prefers to `a`.
- On `ι = ℕ` and three alternatives, with a nonprincipal ultrafilter `U`, the rule choosing the
  top alternative of the ranking of 2.2 given by `U` is onto, strategy-proof (no single voter
  changes membership in `U`) and not dictatorial; so finiteness of `ι` is needed.
- The search of the third Check of 4.1, with strategy-proofness in place of strong monotonicity,
  finds only rules dictatorial on their range.

*Needs:* 4.1; Mathlib `Function.update`. (Proved here, following the cited route.)

### Examples

Constant rules, rules with two possible outcomes, dictatorships restricted to a range and
plurality on three alternatives.

### Dependencies

Layer 1. Mathlib `Set.range`, `Set.encard`, `Function.update`. No other layer.

## Layer 5: single-peaked preferences

Throughout this layer `α` carries a Mathlib `LinearOrder`, the axis on which the alternatives
lie; preferences are linear preferences as before and are unrelated to that order.

### 5.1 Single-peaked preferences and the median voter theorem

Define `IsSinglePeakedAt r t`: for alternatives `x` and `y` on the same side of `t`, with `x`
nearer to `t` (that is `t ≤ x < y` or `y < x ≤ t`), `r` strictly prefers `x` to `y` (Elkind,
Lackner and Peters, Definition 4, p. 12, after Black, 1948). Then `t` is the top alternative of
`r`.

- `isCondorcetWinner_of_median`: if every voter's preference is single-peaked at `t i`, and `m`
  is such that more than half of the voters have `t i ≤ m` and more than half have `m ≤ t i`,
  then `m` is a Condorcet winner. For an odd number of voters the median of the peaks satisfies
  both conditions, so the median peak is a Condorcet winner (Black, 1948; Elkind, Lackner and
  Peters, Proposition 3.4 and the remark after it, p. 14).
- `exists_isWeakCondorcetWinner`: if `α` is nonempty, `ι` finite and every voter's preference is
  single-peaked at some peak, the profile has a weak Condorcet winner (Elkind, Lackner and Peters,
  Proposition 3.4, p. 14).

Route: if `y > m`, every voter with `t i ≤ m` strictly prefers `m` to `y`, since `t i ≤ m < y`;
these are more than half of the voters, so fewer than half prefer `y` to `m`. The case `y < m` is
symmetric. For the weak form take `m` the peak in position `⌈(n + 1)/2⌉` when the peaks are
sorted: at least half of the voters have their peak at or below `m`, and at least half at or
above; with no voters every alternative is a weak Condorcet winner.

**Checks.**
- For a fixed axis with `k ≥ 1` alternatives there are `2 ^ (k − 1)` single-peaked linear
  preferences, and a preference single-peaked at `t` has top `t`.
- On the axis `a < b < c`, the cyclic profile of 1.2 is not single-peaked, and it is not
  single-peaked for any of the six orders of the axis.
- The two counting conditions must be strict, and each is needed. On `a < b < c` with the
  ballots `a b c` and `c b a`, `b` has exactly half of the peaks on each side and ties with `a`
  and with `c`: it is a weak and not a strict Condorcet winner. With the ballots `a b c` and
  `b a c`, both peaks lie at or below `b` but only one of the two at or above it, and `b` ties
  with `a`.
- With the two ballots `a b c` and `b c a` on `a < b < c` (peaks `a` and `b`), `b` beats `c` and
  the other two pairs tie; the weak Condorcet winners are `a` and `b`, and there is no Condorcet
  winner.
- For up to five alternatives and up to four voters, every single-peaked profile satisfies both
  statements.

*Needs:* 1.1, 1.2; Mathlib `LinearOrder`, `Set.ncard`. (Proved here, following the cited route.)

### 5.2 Transitivity of the majority relation

Prove `majorityPrefers_trans`: for a profile of single-peaked preferences with finitely many
voters, if `x` beats `y` and `y` beats `z` by majority, then `x` beats `z` by majority. For an odd
number of voters no two distinct alternatives tie, so the majority relation is then a linear order
(Elkind, Lackner and Peters, Corollary 3.5, p. 14, for odd numbers of voters, and the remark on
quasi-transitivity after it, p. 15, for every number).

Route (the second proof of Corollary 3.5, adjusted as that remark says). Suppose `x` beats `y`,
`y` beats `z`, and `x` does not beat `z`. Strict majorities for `x` over `y` and for `y` over `z`
meet in a voter ranking `x y z`. A strict majority and a set of at least half of the voters meet,
so some voter ranks `z x y` and some ranks `y z x`. Then each of `x`, `y`, `z` is ranked last of
the three by some voter, while for single-peaked preferences the middle one of the three on the
axis is never ranked last of the three.

**Checks.**
- In the profile `a b c`, `b c a` of the second Check of 5.1, the relation "at least as many
  voters prefer `x` to `y` as `y` to `x`" is not transitive: it holds for `c` against `a` and
  for `a` against `b` (ties), but not for `c` against `b`. The strict relation, in which only `b`
  beats `c`, is transitive.
- The cyclic profile of 1.2 shows that single-peakedness is needed.
- Every single-peaked profile in the range of the last Check of 5.1 has a transitive strict
  majority relation, complete when the number of voters is odd.

*Needs:* 1.1, 1.2; Mathlib `LinearOrder`, `Set.ncard`. (Proved here, following the cited route.)

### 5.3 Strategy-proofness of the Condorcet rule

Prove `not_P_of_isCondorcetWinner_update`: if `a` is a Condorcet winner of `p` and `c` is a
Condorcet winner of `Function.update p i b`, then voter `i` does not strictly prefer `c` to `a` at
`p` (Elkind, Lackner and Peters, Proposition 3.1, p. 11). With 5.1, for an odd number of voters
the rule choosing the median peak on single-peaked profiles is therefore strategy-proof on that
domain, onto, and for three or more voters not dictatorial, so the Gibbard–Satterthwaite theorem
of 4.2 fails on this domain (Elkind, Lackner and Peters, Example 7, p. 16).

Route: if `a ≠ c` and `i` prefers `c` to `a`, then `i` is not among the voters preferring `a` to
`c` at `p`; these remain at the new profile, and the voters preferring `c` to `a` there are at most
those at `p` together with `i`, who was one of them already. So `a` still beats `c`, against `c`
being a Condorcet winner.

**Checks.**
- On three alternatives with one to three voters, and on four alternatives with one to three
  voters, every profile with a Condorcet winner and every single change of ballot satisfy the
  statement.
- For up to five alternatives and an odd number of at most three voters, no voter changes the
  median peak to one strictly preferred by reporting another single-peaked ballot.
- The median rule on three voters is onto (a unanimous peak is chosen) and is not dictatorial:
  each voter is outvoted by the other two.

*Needs:* 1.2; Mathlib `Function.update`, `Set.ncard`. (Proved here, following the cited route.)

### Examples

Profiles on the axis `a < b < c < d < e` with three and four voters; the cyclic profile as a
non-example.

### Dependencies

Layer 1. Mathlib `LinearOrder`, `Set.ncard`, `Function.update`. No other layer.

## Scope and ownership

This roadmap owns the targets stated above: weak and linear preferences, profiles, the majority
relation and Condorcet winners; the Arrow axioms, the ultrafilter characterization of the rules
satisfying them and Arrow's theorem for linear and for weak ballots; May's theorem and Sen's
theorem; the Muller–Satterthwaite and Gibbard–Satterthwaite theorems in the form with the range;
single-peaked preferences, the median voter theorem, the transitivity of the strict majority
relation on single-peaked profiles and the strategy-proofness of the Condorcet rule.

Already in the library and therefore not targets: Mathlib's ultrafilters and the theorem that an
ultrafilter on a finite type is principal (`Ultrafilter.eq_pure_of_finite`), which turns 2.2 into
2.3; nothing in Mathlib or Tau Ceti treats preference aggregation.

Related roadmaps:

- BooleanFunctionAnalysis 6.3 (Arrow's theorem, with Kalai's formula in 6.2) states that a
  `±1`-valued function `f` on the cube which, used as the rule for each of the three pairwise
  contests between three candidates, never produces three equal outcomes on a profile is a
  coordinate function or the negative of one, and proves it by Fourier analysis. That is a
  statement about one rule applied to all three contests, with no Pareto condition, so that
  inverse dictators are allowed. The theorems of Layer 2 above allow any number of at least three
  alternatives, a different rule for each pair, and ballots with or without ties, and they assume
  the Pareto condition. On three alternatives 2.3 implies 6.3: the profile in which every voter
  ranks the candidates in one common order gives two equal points of the cube and their
  complement, so `f` takes different values at the all-zero and the all-one point; then `f` or
  `−f` decides the three contests by a rule with linear values that satisfies the Pareto
  condition and independence, and its dictator is the coordinate. 6.3 does not imply the
  theorems here. Nothing of that roadmap is restated, and this roadmap does not depend on it.
- CooperativeGames treats weighted voting games, simple games and the Shapley–Shubik and Banzhaf
  power indices; none of them is treated here.

Outside the scope: auctions, payments and mechanism design with quasi-linear utilities (the
Vickrey, Clarke–Groves and Myerson theorems) are not treated here; nor are matching markets and
stable matching, judgment aggregation, Wilson's theorem without the Pareto condition, quantitative
forms of Arrow's theorem, Moulin's characterization of strategy-proof rules on single-peaked
domains, irresolute forms of the Gibbard–Satterthwaite theorem, single-crossing and Euclidean
domains, scoring rules and their axiomatizations, and all questions of computing or manipulating
rules efficiently.

## Exact supplier contracts

### From Mathlib

- `Mathlib/Order/Filter/Ultrafilter/Defs.lean`: `Ultrafilter` (a filter, not containing the empty
  set, that contains each set or its complement); `Ultrafilter.mem_pure`
  (`s ∈ (pure a : Ultrafilter α) ↔ a ∈ s`).
- `Mathlib/Order/Filter/Ultrafilter/Basic.lean`: `Ultrafilter.eq_pure_of_finite` (for
  `[Finite α]`, every `f : Ultrafilter α` is `pure a` for some `a`).
- `Mathlib/Order/Defs/Unbundled.lean`: `IsTrans` (transitivity of a relation), and
  `IsLinearOrder`, named in the Conventions for comparison. Lean core `Init/Core.lean`:
  `Std.Total` (`r a b ∨ r b a`), `Std.Antisymm` (`r a b → r b a → a = b`).
- `Mathlib/Logic/Equiv/Defs.lean`: `Equiv.Perm` (permutations, acting on voters in 3.1 and on
  alternatives in 1.1 and 3.1). `Mathlib/Logic/Function/Basic.lean`: `Function.update`.
- `Mathlib/Data/Set/Card.lean`: `Set.ncard` (cardinality of a set, `0` on infinite sets), with
  `Set.ncard_univ` (`(univ : Set α).ncard = Nat.card α`), and `Set.encard` (cardinality in
  `ℕ∞`, `⊤` on infinite sets). `Mathlib/SetTheory/Cardinal/Finite.lean`: `ENat.card`
  (cardinality of a type in `ℕ∞`, `⊤` on an infinite type). Basic Mathlib: `Set.range`,
  `Set.image`, `LinearOrder`, `Nat.card`, `Fintype.card`.

## References

- Ulle Endriss, *Logic and Social Choice Theory*, in A. Gupta and J. van Benthem (eds.), *Logic
  and Philosophy Today*, College Publications, 2011; the version on the author's page at the
  University of Amsterdam, with its page numbers: §2, pp. 4–15, Theorems 1 to 5 and the
  definitions before them.
- John Geanakoplos, *Three Brief Proofs of Arrow's Impossibility Theorem*, Cowles Foundation
  Discussion Paper 1123R, Yale University, revised August 1996, pp. 1–2: the statement of Arrow's
  theorem for transitive preferences with ties and the first proof.
- Edith Elkind, Martin Lackner and Dominik Peters, *Preference Restrictions in Computational
  Social Choice: A Survey*, arXiv:2205.09092, version 2, March 2025: §3.1 (Proposition 3.1) and
  §3.2 (Definition 4, Proposition 3.4, Corollary 3.5 and the remarks after it, Example 7),
  pp. 11–16.
- The works of Arrow (1951), Black (1948), May (1952), Sen (1970), Kirman and Sondermann (1972),
  Gibbard (1973), Satterthwaite (1975), Muller and Satterthwaite (1977) and Fishburn (1970) are
  named as the three texts above attribute them. The forms of the Muller–Satterthwaite and
  Gibbard–Satterthwaite theorems with the range, the ultrafilter characterization for an
  arbitrary set of voters and the overlapping cases of Sen's theorem carry their customary
  attributions without a locator and are proved in the layers above from statements the texts
  contain.
