# Roadmap: utility representation theorems

**Summary.** Economic theory describes a decision maker by a preference: a total and transitive
relation "is at least as good as" on a set of alternatives. A utility is a real function that
ranks the alternatives as the preference does. This roadmap asks when a preference has a utility,
when the utility can be chosen continuous, and when, on a space of lotteries, it can be chosen
affine, so that choices maximize an expected utility. It ends with the comparison of attitudes to
risk through the shape of that utility. Preferences are plain relations on a type, with no
structure beyond totality and transitivity, so that a type which already carries an order, such
as a space of commodity bundles, can carry a different preference.

The first main theorem, due to Cantor and Debreu, characterizes the preferences that have a
utility: those for which some countable set of alternatives meets every stretch between two
strictly ranked alternatives, where the set may meet it at one of its two ends. The lexicographic
preference on the plane, which ranks by the first coordinate and breaks ties by the second, fails
this test and has no utility. The second main theorem is Debreu's: a preference on a
second-countable space whose upper and lower contour sets are all closed has a continuous
utility; so does one on a separable space that is connected, a form due to Eilenberg and Debreu.

The third main theorem is the theorem of Herstein and Milnor. On a convex space, a preference has
a utility that preserves mixtures exactly when it satisfies a closedness condition on mixing
weights and a weak independence condition: two indifferent alternatives, each mixed half and half
with the same third alternative, give indifferent mixtures. Such a utility is unique up to a
positive affine transformation. On the simple lotteries over any set of outcomes, this gives the
theorem of von Neumann and Morgenstern: the independence axiom and the continuity axiom hold
exactly when the preference ranks lotteries by the expected value of a utility on outcomes.

The fourth main theorem is Pratt's. For two continuous strictly increasing utilities `u` and `v` of
wealth on an interval, `u` is a concave function of `v` exactly when, for every lottery on the
interval under which both utilities are integrable, the certainty equivalent under `u` (the sure
wealth whose utility is the lottery's expected utility) is at most the one under `v`. For utilities
that are twice differentiable with positive derivative, this holds exactly when the Arrow–Pratt
coefficient `−u″/u′` of `u` is at least that of `v` at every interior point. A utility on an
interval gives every lottery with a mean and an integrable utility an expected utility no larger
than the utility of its mean exactly when it is concave on the interval.

The roadmap builds on Mathlib's order theory, its convex spaces with their simple lotteries and
affine maps, and its concave functions and integrals. The finite games of
RegretMinimizationAndEquilibria take mixed strategies among the weight vectors of the same simple
lotteries and define their own expected utility of a strategy profile, without a preference
relation. Comparisons of lotteries by stochastic order belong to StandardDistributions.

Layer 1 below defines preferences, utilities, order-dense sets, continuity and the lexicographic
preference. Layer 2 proves the existence theorems for utilities and continuous utilities. Layer 3
proves the Herstein–Milnor and von Neumann–Morgenstern theorems. Layer 4 treats certainty
equivalents, risk aversion and Pratt's theorems. Layers 2 and 3 depend on Layer 1; Layer 4 depends
on no other layer.

## Conventions

- **Preferences.** A preference on a type `α` is a relation `R : α → α → Prop`, read "`R x y`:
  `x` is at least as good as `y`", that is total, Lean's `Std.Total R`, and transitive, Mathlib's
  `IsTrans α R`. Totality makes it reflexive. No structure bundles these: statements take the two
  classes as instance arguments on an arbitrary relation, so a type that already has an order (the
  real plane, a space of commodity vectors) can carry a different preference. The strict part
  `strictPart R x y` is `R x y ∧ ¬R y x`; `x` and `y` are indifferent when `R x y` and `R y x`.
- **Utilities.** `IsUtility R u` for `u : α → ℝ` means `R x y ↔ u y ≤ u x` for all `x`, `y`.
  Debreu calls such a function order-preserving. Composing a utility with a strictly increasing
  map of the reals gives another utility for the same relation.
- **Topology.** A preference on a topological space is continuous, `IsContinuousPref R`, when for
  every `x` the upper contour set `{y | R y x}` and the lower contour set `{y | R x y}` are closed.
  Topologies are arbitrary Mathlib `TopologicalSpace` instances; second countability is Mathlib's
  `SecondCountableTopology`, separability `TopologicalSpace.SeparableSpace`, and connectedness
  `PreconnectedSpace`, which allows the empty space.
- **Mixtures.** A space of mixtures is a Mathlib convex space `Convexity.ConvexSpace ℝ X`. For a
  weight `α` in Mathlib's `unitInterval` (the reals in `[0, 1]`), `mix α x y` is the mixture
  `α x + (1 − α) y`, Mathlib's `Convexity.convexCombPair α (1 − α)`; `half` is the weight `1/2`.
  Every convex set in a real vector space is a convex space, and so is ℝ itself (Mathlib's
  instance `Convexity.convexSpaceSelf`), in which `mix α s t = α s + (1 − α) t`. A real function
  `U` on `X` preserves mixtures when it is affine in Mathlib's sense, `Convexity.IsAffineMap ℝ U`,
  which asks that it preserve every finite convex combination.
- **Lotteries on outcomes.** A simple lottery on a type `C` of outcomes is Mathlib's
  `Convexity.StdSimplex ℝ C`: nonnegative weights with finite support summing to `1`. These form a
  convex space under pointwise mixing of the weights, with the point mass
  `Convexity.StdSimplex.single c` at `c`. No finiteness or nonemptiness of `C` is assumed.
- **Lotteries on wealth.** In Layer 4 an interval of wealth levels is a set `D ⊆ ℝ` with Mathlib's
  `Set.OrdConnected D`; it may be empty, a point, open, closed or unbounded. A lottery on `D` is a
  probability measure `μ` on ℝ with `∀ᵐ x ∂μ, x ∈ D`, and expected utilities are Bochner
  integrals. Utilities of wealth are functions `ℝ → ℝ` whose values outside `D` play no role.
  Every statement that integrates a function assumes its integrability, which carries its
  almost-everywhere strong measurability. Derivatives are Mathlib's `deriv`, used only at interior
  points of `D`.

## Layer 1: preferences and utility

### 1.1 Utilities

Define the strict part `strictPart R` and the predicate `IsUtility R u` of the Conventions
(Debreu 1954, p. 160, where a complete ordering and an order-preserving function are defined;
Border, *Preference and Rational Choice*, Definition 10, p. 9, and §14, p. 17).

**Checks.**
- If `IsUtility R u` holds, `R` is total and transitive, since `≤` on ℝ is; so the class
  hypotheses of the theorems below are needed only where no utility is given.
- On ℝ with `R x y` given by `y ≤ x`, the identity, `exp` and `arctan` are utilities and
  `x ↦ x²` is not: it gives `−1` and `1` the same value although `1` is strictly better.
- A plausible wrong convention, `R x y ↔ u x ≤ u y`, makes the identity a utility of the reversed
  order: under it `R 1 0` would require `1 ≤ 0`. The convention here puts the better
  alternative first in `R` and gives it the larger value.
- Two utilities `u`, `v` of one relation agree in order: `u x ≤ u y ↔ v x ≤ v y`. So
  `v = f ∘ u` for the map `f` from the range of `u` to the range of `v` sending `u x` to `v x`,
  which is well defined and strictly increasing; utilities are unique only up to such maps.

*Needs:* Lean's `Std.Total`, Mathlib's `IsTrans`. (Proved here.)

### 1.2 Order-dense sets

Define `IsOrderDense R D` for a set `D ⊆ α`: whenever `x` is strictly preferred to `y`, some
`d ∈ D` has `R x d` and `R d y`. The point `d` may be indifferent to `x` or to `y`. This is the
condition of Debreu's Lemma II (Debreu 1954, p. 161), which he describes as a weakening, suggested
by Savage, of Cantor's condition that `d` lie strictly between (p. 159, footnote, and p. 161).

**Checks.**
- On the two-point chain `0 < 1`, the set `{0}` is order dense and so is the whole chain, while no
  set meets Cantor's strict condition, since nothing lies strictly between `1` and `0`. The chain
  has the utility `id`, so the strict form of the condition would make the theorem of 2.1 false;
  this is the plausible wrong definition, and the weak form is the one used.
- Every type is order dense in itself for a reflexive `R`, in particular a total one: take
  `d = x`.
- In the lexicographic preference of 1.4, a set that is order dense meets every vertical line,
  since `(a, 1)` is strictly preferred to `(a, 0)` and only points of the line `{a} × ℝ` lie
  between them; so it is uncountable.

*Needs:* 1.1. (Proved here.)

### 1.3 Continuous preferences

Define `IsContinuousPref R` on a topological space: every upper and every lower contour set is
closed (Debreu 1954, p. 160, the closedness assumption and the definition of a natural topology;
Border, *Technical Results on Regular Preferences and Demand*, the definition before Lemma 2,
pp. 2–3).

**Checks.**
- A preference with a continuous utility is continuous: its contour sets are preimages of closed
  half-lines (Border, *Technical Results*, Proposition 3, p. 3).
- For a total preorder on any topological space, continuity is equivalent to the closedness of
  the graph `{(x, y) | R x y}` in the product. Given `x` strictly preferred to `y`, if some `z`
  lies strictly between, the strict upper set of `z` and the strict lower set of `z` are open
  neighbourhoods of `x` and of `y` whose points are strictly ranked; if none does, the strict upper
  set of `y` and the strict lower set of `x` serve. For metric spaces this is Border, *Technical
  Results*, Lemma 2, p. 3, and Rubinstein's claim on the definitions C1 and C2, p. 17.
- The lexicographic preference of 1.4 is not continuous: `(1 + 1/n, −5)` is at least as good as
  `(1, 0)` for every `n ≥ 1`, and the limit `(1, −5)` is not.

*Needs:* 1.1; Mathlib `IsClosed`. (Proved here.)

### 1.4 The lexicographic preference

Define `lexPref p q` on `ℝ × ℝ`: `q.1 < p.1`, or `p.1 = q.1` and `q.2 ≤ p.2` (Debreu 1954,
footnote 1, p. 164; Border, *Preference and Rational Choice*, Example 41, p. 17).

**Checks.**
- `lexPref p q` holds exactly when `toLex q ≤ toLex p` in Mathlib's lexicographic order on
  `Lex (ℝ × ℝ)`; it is a linear order, so total and transitive.
- `lexPref (1, 0) (0, 5)` holds and `lexPref (0, 5) (1, 0)` does not: a larger first coordinate
  wins whatever the second.

*Needs:* 1.1; Mathlib `toLex`, `Prod.Lex`. (Proved here.)

### Examples

The two-point chain, the real line with its order and the utilities `id`, `exp` and `arctan`, and
the lexicographic plane with its vertical lines.

### Dependencies

Lean's `Std.Total`; Mathlib `IsTrans`, `IsClosed`, `toLex`, `Prod.Lex`. No other layer.

## Layer 2: existence of utility

### 2.1 The Cantor–Debreu theorem

Prove `exists_isUtility_iff_exists_countable_isOrderDense`: a total preorder `R` on any type has a
utility if and only if some countable set is order dense for `R` (Debreu 1954, Lemma II, p. 161,
for the sufficiency, with the existence of an order-preserving function; the necessity is proved
here).

Route for the sufficiency: pass to the linear order of indifference classes. Each pair of classes
with nothing strictly between them (a jump) has an end in `D`, by density, and each point of `D`
ends at most two jumps, so the jumps are countable and their ends may be added to `D`. Map the
countable linear order of the classes of `D` strictly increasingly into the rationals of
`(0, 1)` by Mathlib's `Order.embedding_from_countable_to_dense` (or by Ouwehand's explicit
induction, p. 18), and set `u x` to the supremum of `0` and the values at the points of `D` at most
as good as `x`. If `x` is
strictly preferred to `y`, the enlarged `D` has points `d₁`, `d₂` with `x` at least as good as
`d₁`, `d₁` strictly preferred to `d₂`, and `d₂` at least as good as `y`: if nothing lies
strictly between `x` and `y`, take the two ends of that jump; otherwise take `z` strictly between,
`d₂` in `D` between `z` and `y`, and for `d₁` the upper end of the jump from `z` to `x` if nothing
lies strictly between them, or else a point of `D` between `x` and a point strictly between `z`
and `x`. Then `u y ≤ f d₂ < f d₁ ≤ u x` for the embedding `f`, so `u` is strictly increasing
across classes. Route for the necessity: given a utility `u`, choose for each pair of rationals
`q < r` with some `u x` in `(q, r)` one such `x`, and add both ends of each jump of the ranking;
the jumps are countable because each leaves an open interval free of values of `u`, and these
intervals are disjoint and each contains a rational.

**Checks.**
- A countable type is order dense in itself, so every total preorder on a countable type has a
  utility; on a finite type the number of classes ranked strictly below gives one.
- The lexicographic preference has no countable order-dense set (1.2), so 2.1 gives 2.2.
- With `D` required to meet Cantor's strict condition, the two-point chain would be a
  counterexample (1.2).
- On the empty type both sides hold, with `D = ∅`.
- The class hypotheses are needed. Without totality, the empty relation on a nonempty type has
  the order-dense set `∅` (it has no strictly ranked pair) and no utility. Without transitivity,
  the cyclic relation on three points in which `a` beats `b`, `b` beats `c` and `c` beats `a` is
  total, the three points form a countable order-dense set, and there is no utility.

*Needs:* 1.1, 1.2; Mathlib `Order.embedding_from_countable_to_dense`, `Set.Countable`. (Proved
here, following the cited route.)

### 2.2 The lexicographic preference has no utility

Prove `not_exists_isUtility_lexPref`: no function `ℝ × ℝ → ℝ` is a utility for `lexPref` (Debreu
1954, footnote 1, p. 164; Border, *Preference and Rational Choice*, Example 41, p. 17; Rubinstein,
the claim on p. 15, for the unit square, whose restriction argument gives the plane).

Route: for a utility `u`, the open intervals `(u (a, 0), u (a, 1))` for `a ∈ ℝ` are nonempty and
pairwise disjoint, since `(b, 0)` is strictly better than `(a, 1)` when `a < b`; choosing a
rational in each gives an injection of ℝ into ℚ, against Mathlib's `Cardinal.not_countable_real`.

**Checks.**
- The restriction of `lexPref` to any single vertical line `{a} × ℝ` has the utility
  `(a, t) ↦ t`, and its restriction to the horizontal axis has the utility `(s, 0) ↦ s`; the
  obstruction is the uncountable family of lines.
- The utility `(s, t) ↦ s` gives every point of a vertical line the same value, so it is not a
  utility: `(0, 1)` is strictly better than `(0, 0)`.

*Needs:* 1.1, 1.4; Mathlib `Cardinal.not_countable_real`. (Proved here, following the cited
route.)

### 2.3 Debreu's theorem

Prove `exists_continuous_isUtility_of_secondCountable`: a continuous total preorder on a
second-countable topological space has a continuous utility (Debreu 1954, Theorem II, p. 163,
whose "perfectly separable" is second countable; Bosi and Estevan, Corollary 3.2, p. 9).

Route: choose a point in each nonempty set of a countable base, and both ends of each jump; the
jumps are countable because each jump `a < b` gives a basic open set inside the strict lower set
of `b` containing a point of `a`, and different jumps give different basic sets (Debreu 1954,
pp. 163–164). The resulting countable set is order dense, so 2.1 gives a utility `u`. A utility
need not be continuous. Debreu's 1954 argument for continuity has a gap, which he repaired in
1964 by the gap lemma (Ouwehand, §1, p. 17): for every set `S ⊆ ℝ` there is a strictly increasing
`g : S → ℝ` such that every gap of `g(S)` (a maximal nondegenerate interval missing `g(S)` with
points of `g(S)` on both sides) is open (Ouwehand, Theorem 1, p. 17, with the proof on
pp. 18–19). Apply it to `S = u(X)`. Then `g ∘ u` is a utility, and each set
`{x | t < g (u x)}` is empty, the whole space, a strict upper contour set (when `t` is a value of
`g ∘ u`, or lies in a gap, whose lower end is a value since the gap is open) or a union of strict
upper contour sets (otherwise), hence open by continuity of the preference; likewise for
`{x | g (u x) < t}`, with the upper end of a gap, so `g ∘ u` is continuous (the open rays
generate the topology of ℝ). This last step is proved here; Ouwehand, §3,
p. 20, makes the corresponding remark for `g` on `S` with its order topology.

**Checks.**
- The closedness of the contour sets cannot be dropped: the plane is second countable and the
  lexicographic preference has no utility at all (2.2, 1.3).
- Second countability cannot be dropped: on the double arrow space `[0, 1] × {0, 1}` with the
  lexicographic order and its order topology, the order is continuous and the space is separable,
  but the uncountably many jumps `(a, 0) < (a, 1)` each need a point of an order-dense set, so by
  2.1 there is no utility.
- On ℝ with its order, `id` is a continuous utility. The preference on ℝ given by `R x y` when
  `⌊y⌋ ≤ ⌊x⌋` has the utility `x ↦ ⌊x⌋` but no continuous one, and it is not continuous: its
  upper contour set at `1` is `[1, ∞)` and its lower contour set at `0` is `(−∞, 1)`, which is not
  closed.

*Needs:* 1.1, 1.2, 1.3, 2.1; Mathlib `SecondCountableTopology`,
`TopologicalSpace.exists_countable_basis`. (Proved here, following the cited route.)

### 2.4 The Eilenberg–Debreu theorem

Prove `exists_continuous_isUtility_of_separable_preconnected`: a continuous total preorder on a
separable topological space that is connected (possibly empty) has a continuous utility (Debreu
1954, Theorem I, p. 162, with its proof on p. 163, crediting Eilenberg; Rubinstein, Proposition
(Debreu), p. 19, for convex subsets of `ℝⁿ`).

Route: let `Z` be a countable dense set. If `x` is strictly preferred to `y`, the closed sets
`{w | R y w}` and `{w | R w x}` are disjoint and nonempty, so by connectedness they do not cover
the space; the remaining set of points strictly between `y` and `x` is open and nonempty and meets
`Z`. So `Z` is order dense, and the continuity argument of 2.3 applies.

**Checks.**
- Connectedness cannot be dropped: the double arrow space of 2.3 is separable and not connected,
  and its order has no utility.
- On a connected space a continuous preference has no jumps, by the route; the floor preference of
  2.3 has jumps and is not continuous.

*Needs:* 1.1, 1.2, 1.3, 2.1, the continuity argument of 2.3; Mathlib
`TopologicalSpace.SeparableSpace`, `TopologicalSpace.exists_countable_dense`, `PreconnectedSpace`.
(Proved here, following the cited route.)

### Examples

The finite and countable total preorders, the lexicographic plane, the double arrow space, the
floor preference on ℝ, and continuous preferences on convex subsets of `ℝⁿ`.

### Dependencies

Layer 1; Mathlib `Order.embedding_from_countable_to_dense`, `Set.Countable`,
`Cardinal.not_countable_real`, `SecondCountableTopology`, `TopologicalSpace.exists_countable_basis`,
`TopologicalSpace.SeparableSpace`, `TopologicalSpace.exists_countable_dense`, `PreconnectedSpace`.

## Layer 3: mixture spaces and expected utility

### 3.1 The Herstein–Milnor theorem

Define `mix` and `half` as in the Conventions, and for a relation `R` on a convex space `X`:

- `IsMixtureContinuous R`: for all `x`, `y`, `z`, the weights `α ∈ [0, 1]` with `mix α x y` at
  least as good as `z` form a closed subset of `unitInterval`, and so do those with `z` at least
  as good as `mix α x y` (Herstein and Milnor, Axiom 2, p. 293);
- `IsHalfIndependent R`: if `x` and `x'` are indifferent, then for every `y` the mixtures
  `mix half x y` and `mix half x' y` are indifferent (Herstein and Milnor, Axiom 3, p. 293).

Prove `exists_isAffineMap_isUtility_iff`: a total preorder on a convex space satisfies these two
axioms if and only if it has an affine utility (Herstein and Milnor, Theorem 8, p. 297, for
mixture sets, with the remark on p. 293 that each axiom holds whenever such a utility exists;
Border, *Aspects of Normative Decision Theory*, Theorem 9, p. 12, with independence for all
weights). Prove `exists_pos_affine_of_isAffineMap_isUtility`: two affine utilities `U`, `V` of one
relation satisfy `V = a U + b` with `a > 0` (proved here from Herstein and Milnor, Theorem 7,
p. 296).

Route: a convex space is a mixture set in Herstein and Milnor's sense (p. 292), because its
binary mixtures satisfy their three identities by the unit and associativity laws of
`Convexity.ConvexSpace`. Their Theorems 1–6 (pp. 293–295) show that for `a` strictly better than
`b` the mixtures `λ a + (1 − λ) b` increase strictly with `λ`, and that every `x` between them is
indifferent to exactly one of them; the weight so attached to `x` is a utility on the preference
interval between `b` and `a` that preserves binary mixtures. Normalizing at two fixed strictly
ranked points and letting the interval grow gives the utility on `X` (pp. 295–297). A function
that preserves binary mixtures preserves every finite convex combination, by induction on the
size of the support with Mathlib's `Convexity.StdSimplex.convexCombPair_restrict_restrict_compl`,
so the utility is `Convexity.IsAffineMap ℝ`. If every two points are indifferent, any constant is
an affine utility. For uniqueness, both sides are constant when every two points are indifferent;
otherwise fix `r₁` strictly better than `r₀`, take the unique `a > 0` and `b` with
`V = a U + b` at `r₀` and `r₁`, and apply Theorem 7 on each preference interval containing
`r₀`, `r₁` and a given point. The converse direction of the theorem: if `U` is affine, the weights
in `IsMixtureContinuous` are those with `α U x + (1 − α) U y ≥ U z` or `≤ U z`, closed sets, and
`U (mix half x y) = U x / 2 + U y / 2`.

**Checks.**
- Independence cannot be dropped. On the lotteries over two outcomes `a`, `b`, rank a lottery by
  `min(p a, 1/2)`. This preference is total, transitive and mixture continuous, but the lotteries
  with `p a = 3/5` and `p a = 4/5` are indifferent while their even mixtures with the point mass at
  `b`, with `p a = 3/10` and `2/5`, are strictly ranked. An affine utility constant on the
  lotteries with `p a ≥ 1/2` is constant everywhere, so none exists.
- Continuity cannot be dropped. On the lotteries over three outcomes `a`, `b`, `c`, rank
  lexicographically by `p a` and then `p b`. This satisfies independence for every weight, but
  the mixtures of the point masses at `a` and `c` with weight `α > 0` on `a` are all strictly
  better than the point mass at `b` (checked for `α = 1/1000, 1/2, 999/1000`), while weight `0`
  gives one strictly worse, so the set of weights is `(0, 1]`, not closed. It has no utility at
  all, by the argument of 2.2 applied to the segments `p a = t`.
- A utility need not be affine to represent an affine-representable preference: on the lotteries
  over `a`, `b`, both `p a` and `(p a)²` are utilities for the ranking by `p a`, and only the
  first is affine; `(p a)²` is not of the form `a' (p a) + b'`, as the uniqueness statement
  requires of two affine ones.

*Needs:* 1.1; Mathlib `Convexity.ConvexSpace`, `Convexity.convexCombPair`,
`Convexity.IsAffineMap`, `Convexity.StdSimplex.convexCombPair_restrict_restrict_compl`,
`unitInterval`. (Proved here, following the cited route.)

### 3.2 The von Neumann–Morgenstern theorem

For a relation `R` on a convex space define:

- `IsMixtureIndependent R`: for every weight `0 < α < 1` and all `x`, `y`, `z`, `R x y` holds if
  and only if `R (mix α x z) (mix α y z)` does (Rubinstein, axiom I, p. 97);
- `IsMixtureSolvable R`: whenever `x` is strictly preferred to `y` and `y` to `z`, some weight
  `0 < α < 1` makes `mix α x z` indifferent to `y` (Rubinstein, property C*, p. 98, which he
  states as a consequence of his topological continuity axiom, leaving the verification to the
  reader).

Define `expectedUtility u p` for `u : C → ℝ` and a simple lottery `p` on `C`: the sum of
`p c * u c` over the support of `p`. Prove `exists_isUtility_expectedUtility_iff`: a total
preorder on the simple lotteries over any type `C` satisfies these two axioms if and only if
`expectedUtility u` is a utility for it for some `u : C → ℝ` (Rubinstein, Theorem (vNM), p. 99,
for a finite set of prizes and his topological continuity axiom; the statement here allows any
`C`, which the route through 3.1 gives). Prove `exists_pos_affine_of_isUtility_expectedUtility`:
two such `u`, `v` satisfy `v = a u + b` with `a > 0` (Rubinstein, the uniqueness of vNM utilities,
p. 100).

Route: independence gives half independence, and, as in Rubinstein's lemma (p. 97), mixtures of a
strictly better and a worse lottery improve strictly with the weight on the better one. With
solvability this makes each set of weights in `IsMixtureContinuous` empty, a single point, all of
`[0, 1]` or a closed interval ending at `0` or at `1`, so 3.1 gives an affine utility `U`. Put
`u c = U (single c)`. A simple lottery is the convex combination of the point masses of its
support (Mathlib's `Convexity.StdSimplex.iConvexComb_single`), so affinity gives
`U p = expectedUtility u p`, by `Convexity.iConvexComb_eq_sum` in ℝ. Conversely `expectedUtility u`
is affine in `p`, which gives both axioms: the weight `α = (U y − U z) / (U x − U z)` solves.
Uniqueness: `expectedUtility u` and `expectedUtility v` are affine utilities of one relation, so
3.1 gives `a > 0` and `b`, and evaluating at point masses gives `v c = a u c + b`.

**Checks.**
- `expectedUtility u (single c) = u c`; on the lottery with weights `1/2`, `1/2` on `c`, `d` it is
  `(u c + u d) / 2`.
- Ranking lotteries by their largest weight `max_c p c` is continuous but fails independence:
  the point masses at two outcomes are indifferent, with value `1`, and the even mixture of one of
  them with itself is that point mass, while its even mixture with the other has value `1/2`
  (Rubinstein, p. 99).
- The lexicographic ranking of 3.1 satisfies independence and fails solvability; the ranking by
  `min(p a, 1/2)` of 3.1 fails independence.
- On the empty type of outcomes there are no lotteries, and both sides of the theorem hold.
- `u` and `2 u + 7` give the same ranking; `u` and `exp ∘ u` in general do not: with `u` taking
  the values `0`, `1`, `2` on three outcomes, the point mass at the middle outcome is indifferent
  to the even mixture of the other two under `u`, but not under `exp ∘ u`, since
  `e ≠ (1 + e²) / 2`.

*Needs:* 1.1, 3.1; Mathlib `Convexity.StdSimplex`, `Convexity.StdSimplex.single`,
`Convexity.StdSimplex.iConvexComb_single`, `Convexity.iConvexComb_eq_sum`, `Finsupp.sum`.
(Proved here, following the cited route.)

### Examples

Lotteries over two and three outcomes with the rankings by `p a`, by `min(p a, 1/2)`, by the
largest weight and lexicographically; convex subsets of `ℝⁿ` as mixture spaces.

### Dependencies

Layer 1; Mathlib `Convexity.ConvexSpace`, `Convexity.convexCombPair`, `Convexity.IsAffineMap`,
`Convexity.StdSimplex`, `Convexity.StdSimplex.single`,
`Convexity.StdSimplex.convexCombPair_restrict_restrict_compl`,
`Convexity.StdSimplex.iConvexComb_single`, `Convexity.iConvexComb_eq_sum`, `unitInterval`. Not
Layer 2.

## Layer 4: risk aversion

### 4.1 Certainty equivalents

Define `IsCertaintyEquivalent D u μ c`: `c ∈ D` and `u c = ∫ x, u x ∂μ`. Prove
`existsUnique_isCertaintyEquivalent`: if `D` is an interval, `u` is continuous and strictly
increasing on `D`, `μ` is a probability measure concentrated on `D` and `u` is `μ`-integrable,
then `μ` has exactly one certainty equivalent (Border, *Pedantic Notes on the Risk Premium and
Risk Aversion*, Lemma 1, p. 1, for the risk premium, which is the mean minus the certainty
equivalent when the mean exists).

Route: `u(D)` is an interval by the intermediate value theorem, and the integral of a function
with values in an interval against a probability measure lies in that interval: at an endpoint
that the interval omits, the integral could equal it only if the function did almost everywhere.
Uniqueness is strict monotonicity.

**Checks.**
- For `u = log` on `(0, ∞)` and the lottery with weights `1/2`, `1/2` on wealth `1` and `4`, the
  certainty equivalent is `2`, the geometric mean; for `u = √x` it is `((1 + 2)/2)² = 9/4`; the
  mean is `5/2`.
- For `u x = −e^(−x)` and the lottery with weights `1/2`, `1/2` on `0` and `1`, the certainty
  equivalent is `−log((1 + e⁻¹)/2) ≈ 0.3799`; for `u x = −e^(−2x)` it is
  `−log((1 + e⁻²)/2)/2 ≈ 0.2831`.
- Without strict monotonicity uniqueness fails: for `u x = −x²` on `[−1, 1]` and the same lottery,
  both `±1/√2` are certainty equivalents.

*Needs:* Mathlib `IsPreconnected.intermediate_value`, `Set.OrdConnected.isPreconnected`,
`MeasureTheory.integral_mono_ae`, `MeasureTheory.Integrable`. (Proved here.)

### 4.2 Risk aversion and concavity

Prove `riskAverse_iff_concaveOn`: on an interval `D`, `∫ u dμ ≤ u (∫ x dμ)` for every probability
measure `μ` concentrated on `D` with integrable identity and integrable `u` if and only if `u` is
concave on `D` (Rubinstein, the claim on p. 111, for lotteries with finite support).

Route: for the converse, two-point measures turn the inequality into concavity. For the direct
implication the mean `m` lies in `D`; if `m` is interior, a concave function on an interval has a
supporting line `ℓ` at `m` with `u ≤ ℓ` on `D`, and integrating gives `∫ u ≤ ℓ m = u m`; if `m` is
an endpoint of `D`, the measure is the point mass at `m`. Mathlib's
`ConcaveOn.le_map_integral` gives the inequality when `D` is closed and `u` is continuous on it;
the statement here asks for neither.

**Checks.**
- For `u x = x²` on `[0, 1]`, which is not concave, the lottery with weights `1/2`, `1/2` on `0`
  and `1` gives `∫ u = 1/2 > 1/4 = u(1/2)`.
- `u` with `u 0 = −1` and `u x = x` for `0 < x ≤ 1` is concave on `[0, 1]` (checked on a grid of
  points and weights) and discontinuous at `0`; for the same lottery `∫ u = 0 ≤ 1/2 = u(1/2)`.
  Mathlib's version does not apply to it, which is why the statement is proved here.
- For `D = ∅` both sides hold: there is no such measure, and every function is concave on `∅`.

*Needs:* Mathlib `ConcaveOn`, `ConcaveOn.slope_anti_adjacent`, `MeasureTheory.Measure.dirac`,
`MeasureTheory.integral_mono_ae`. (Proved here, following the cited route.)

### 4.3 Pratt's theorem

Prove `exists_concaveOn_comp_iff_certaintyEquivalent_le`: for an interval `D` and utilities `u`,
`v` continuous and strictly increasing on `D`, there is `g` concave on `v(D)` with `u = g ∘ v` on
`D` if and only if, for every probability measure concentrated on `D` with `u` and `v` integrable,
every certainty equivalent for `u` is at most every certainty equivalent for `v` (Pratt's theorem
in Border, *Pedantic Notes*, Theorem 6, pp. 3–4, stated with risk premia for lotteries whose mean
exists; Rubinstein, the claim on p. 113, for lotteries with finite support). Under the hypotheses
of 4.1 both certainty equivalents exist, so the right-hand side compares them; when the mean
exists, it says that the risk premium under `u` is at least that under `v`.

Route: as Border does. The function `g = u ∘ v⁻¹` on `v(D)` is the only candidate (Border,
Lemma 5, p. 3). Concavity of `g` gives `∫ u = ∫ g ∘ v ≤ g (∫ v) = g (v cv) = u cv` by 4.2 applied
to `g` on the interval `v(D)` and the image measure of `μ` under `v`; so `u cu ≤ u cv` and
`cu ≤ cv`. (The set `v(D)` is an interval since `v` is continuous on `D`. As `v` is integrable,
it is almost everywhere measurable, so the image measure `ν` is a probability measure, it is
concentrated on `v(D)`, and the identity is `ν`-integrable because `v` is `μ`-integrable. The
function `g` is concave, hence continuous, on the interior of `v(D)`, which misses at most two
points of `v(D)`; so `g` agrees `ν`-almost everywhere with a measurable function, and by
Mathlib's `MeasureTheory.integrable_map_measure` and `MeasureTheory.integral_map` it is
`ν`-integrable with `∫ g dν = ∫ g ∘ v dμ = ∫ u dμ`.) Conversely, for points `x₁`, `x₂` of `D`
and a weight `a`, the lottery `a δ(x₁) + (1 − a) δ(x₂)` has the certainty equivalent
`v⁻¹ (a v x₁ + (1 − a) v x₂)` for `v` and one for `u` by 4.1, and the right side gives the
concavity inequality of `g = u ∘ v⁻¹` at `v x₁`, `v x₂`.

**Checks.**
- For `u = log` and `v = √x` on `(0, ∞)`, `g y = 2 log y` is concave, and the lottery of 4.1 has
  certainty equivalents `2 ≤ 9/4`.
- For `u x = −e^(−2x)` and `v x = −e^(−x)`, `g y = −y²` on `v(ℝ) = (−∞, 0)` is concave, and the
  lottery of 4.1 has certainty equivalents `0.2831 ≤ 0.3799`, risk premia `0.2169 ≥ 0.1201`.
- Strict monotonicity of `u` cannot be dropped: for `u x = −x²` and `v x = x` on `[−1, 1]`,
  `u = g ∘ v` with `g y = −y²` concave, but on the lottery of 4.1 the certainty equivalent `1/√2`
  for `u` exceeds the certainty equivalent `1/2` for `v`.
- With `v` the identity, the left side says that `u` is concave, and the right side that every
  certainty equivalent is at most the mean, in agreement with 4.2 for strictly increasing `u`.

*Needs:* 4.1, 4.2; Mathlib `ConcaveOn`, `ConcaveOn.continuousOn_interior`, `StrictMonoOn`,
`ContinuousOn`, `MeasureTheory.Measure.map`, `MeasureTheory.integrable_map_measure`,
`MeasureTheory.integral_map`, `MeasureTheory.Measure.dirac`. (Proved here, following the cited
route.)

### 4.4 The Arrow–Pratt coefficient

Define `arrowPratt u x = −deriv (deriv u) x / deriv u x`. Prove
`exists_concaveOn_comp_iff_arrowPratt_le`: for an interval `D` and `u`, `v` continuous on `D`,
twice differentiable on the interior of `D` with positive first derivative there, there is `g`
concave on `v(D)` with `u = g ∘ v` on `D` if and only if `arrowPratt v x ≤ arrowPratt u x` at
every interior point `x` (Border, *Pedantic Notes*, Theorem 8, p. 5, with its proof on pp. 6–7;
Rubinstein, p. 114).

Route: `u` and `v` are strictly increasing on `D` by Mathlib's `strictMonoOn_of_deriv_pos`. On
the interior of `v(D)` the function `g = u ∘ v⁻¹` is twice differentiable, with `g′ = u′ / v′`
taken at `v⁻¹ y` (Mathlib's `HasDerivAt.of_local_left_inverse`), and differentiating `u = g ∘ v`
twice gives `u″ / u′ = (g″ / g′) v′ + v″ / v′` at each interior point. Since `g′ > 0` and
`v′ > 0`, the coefficient inequality holds at `x` exactly when `g″ (v x) ≤ 0`. Since
`g = u ∘ v⁻¹` is continuous on `v(D)` and twice differentiable on its interior, it is concave on
`v(D)` exactly when `g″ ≤ 0` on that interior: one direction is Mathlib's
`concaveOn_of_deriv2_nonpos`, the other Mathlib's `ConcaveOn.antitoneOn_deriv` (`g′` is
antitone on the open interval, so its derivative is not positive). Any `g` in the left side
agrees with `u ∘ v⁻¹` on `v(D)`, hence near every interior point.

**Checks.**
- `arrowPratt log x = 1/x`, `arrowPratt √· x = 1/(2x)` and, for `u x = −e^(−a x)` with `a > 0`,
  `arrowPratt u x = a` at every `x`; in agreement with 4.3, `log` is more risk averse than `√·`
  and `−e^(−2x)` than `−e^(−x)`.
- The coefficient does not change when `u` is replaced by `c u + d` with `c > 0`.
- If `D` is a single point, its interior is empty, the right side holds, and so does the left.

*Needs:* Mathlib `deriv`, `strictMonoOn_of_deriv_pos`, `HasDerivAt.of_local_left_inverse`,
`concaveOn_of_deriv2_nonpos`, `ConcaveOn.antitoneOn_deriv`, `ConcaveOn`; none of 4.1–4.3. (Proved
here, following the cited route.)

### Examples

Logarithmic, square-root, power and exponential utilities on their intervals, and lotteries on two
wealth levels.

### Dependencies

Mathlib `ConcaveOn`, `ConcaveOn.slope_anti_adjacent`, `ConcaveOn.continuousOn_interior`,
`StrictMonoOn`, `ContinuousOn`, `deriv`, `strictMonoOn_of_deriv_pos`,
`HasDerivAt.of_local_left_inverse`, `concaveOn_of_deriv2_nonpos`, `ConcaveOn.antitoneOn_deriv`,
`IsPreconnected.intermediate_value`, `Set.OrdConnected.isPreconnected`,
`MeasureTheory.Integrable`, `MeasureTheory.integral_mono_ae`, `MeasureTheory.Measure.map`,
`MeasureTheory.integrable_map_measure`, `MeasureTheory.integral_map`,
`MeasureTheory.Measure.dirac`. No other layer: the link with
Layer 3, that a preference on lotteries over wealth with a von Neumann–Morgenstern utility `u`
ranks them by `∫ u`, is the motivation and not an input.

## Scope and ownership

This roadmap owns utilities of total preorders on an arbitrary type, taken as unbundled
relations, order density and continuity of preferences, the Cantor–Debreu, Debreu and
Eilenberg–Debreu representation theorems, the lexicographic counterexample, mixture continuity
and independence on convex spaces, the Herstein–Milnor and von Neumann–Morgenstern theorems
with their uniqueness statements, certainty equivalents, the characterization of risk aversion by
concavity, and Pratt's theorems in their global and local forms with the Arrow–Pratt coefficient.

Already in the libraries and therefore not targets: the embedding of a countable linear order in a
dense one (Mathlib's `Order.embedding_from_countable_to_dense`), which gives 2.1 for countable
types; the uncountability of ℝ; Mathlib's convex spaces, simple lotteries and affine maps, and
Jensen's inequality for continuous concave functions on closed sets (`ConcaveOn.le_map_integral`),
of which 4.2 is the extension to arbitrary intervals and functions.

Left to other roadmaps:

- RegretMinimizationAndEquilibria takes the mixed strategies of finite games among the weight
  vectors of Mathlib's simple lotteries and defines its own `expectedUtility` of a strategy profile
  for payoffs given as data; it defines no preference relation, and nothing of it is restated. The
  `expectedUtility u p` of 3.2 is a different object, the expectation of `u` under one simple
  lottery on an arbitrary type of outcomes.
- MeansMajorizationAndDiscreteInequalities, §1.3, defines the quasi-arithmetic mean of finitely
  many weighted points of an interval with a continuous strictly increasing generator and
  characterizes, for all such finite data, when the mean with one generator is at most the mean
  with another. For a lottery with finitely many values the certainty equivalent of 4.1 is the
  quasi-arithmetic mean of those values with generator `u`, so 4.3 with its right side
  restricted to such lotteries is equivalent to that comparison with generators `u` and `v` (the
  inverse of the increasing convex function `v ∘ u⁻¹` on `u(D)` is the concave function
  `u ∘ v⁻¹` on `v(D)`).
  Here 4.1 and 4.3 are stated for every probability measure concentrated on the interval, and this
  roadmap does not depend on that one. Its convex order of laws on the line is not used here.
- StandardDistributions, §7.13, owns stochastic order on the line; no stochastic dominance
  statement is made here, and the comparisons of Layer 4 are between two utilities on one lottery,
  not between two lotteries.
- SocialChoice 1.1 defines weak preferences bundled, `WeakPref α`, a relation `rel` with
  `Std.Total rel` and `IsTrans α rel` as fields, and their strict part `WeakPref.P` by the formula
  of `strictPart` here; it aggregates profiles of them and has no utility functions. The
  preferences here are the same total preorders, unbundled so that a type with an order of its own
  can carry another one. Every statement here about an arbitrary preference `R` applies to `R.rel`
  for `R : WeakPref α`, the fields `R.total` and `R.trans` supplying its two instances, and
  `strictPart R.rel` is `R.P` by definition. Nothing of that roadmap is restated or used, and
  neither roadmap depends on the other.

Outside the scope: budget sets, demand, indirect utility, expenditure functions and the Slutsky
matrix; monotonicity, local nonsatiation and convexity of preferences on commodity spaces; revealed
preference and the rationalization of choice; social choice and the aggregation of preferences;
semicontinuous utilities (Rader's theorem); subjective expected utility (Savage, Anscombe–Aumann);
representations of incomplete preferences; Ross's strengthening of Pratt's theorem, relative risk
aversion and the limit of the risk premium for small risks; monetary risk measures.

## Exact supplier contracts

### From Mathlib

- `Mathlib/Order/Defs/Unbundled.lean`: `IsTrans α r` (`r a b → r b c → r a c`). Lean core:
  `Std.Total r` (`r a b ∨ r b a` for all `a`, `b`).
- `Mathlib/Order/CountableDenseLinearOrder.lean`: `Order.embedding_from_countable_to_dense` (for a
  countable linear order `α` and a densely ordered nontrivial linear order `β`, an order embedding
  `α ↪o β` exists).
- `Mathlib/Analysis/Real/Cardinality.lean`: `Cardinal.not_countable_real` (`Set.univ : Set ℝ` is
  not countable). `Mathlib/Order/Lex.lean`: `toLex`; `Mathlib/Data/Prod/Lex.lean`: the
  lexicographic order `Prod.Lex` on `Lex (α × β)`.
- `Mathlib/Topology/Bases.lean`: `SecondCountableTopology`, `TopologicalSpace.SeparableSpace`,
  `TopologicalSpace.exists_countable_basis`, `TopologicalSpace.exists_countable_dense`.
  `Mathlib/Topology/Connected/Basic.lean`: `PreconnectedSpace`.
  `Mathlib/Topology/Order/IntermediateValue.lean`: `IsPreconnected.intermediate_value`;
  `Set.OrdConnected.isPreconnected` (an order-connected set of a densely ordered order topology is
  preconnected). `Mathlib/Topology/UnitInterval.lean`: `unitInterval`, `unitInterval.nonneg`,
  `unitInterval.one_sub_nonneg`.
- `Mathlib/Geometry/Convex/ConvexSpace/Defs.lean`: `Convexity.StdSimplex R X` (finitely supported
  nonnegative weights summing to `1`), `Convexity.StdSimplex.single`,
  `Convexity.ConvexSpace R X` (an operation `sConvexComb` with the unit law and the associativity
  law), `Convexity.convexCombPair s t _ _ _ x y` (the combination with weights `s`, `t`),
  `Convexity.IsAffineMap R f` (`f` preserves `sConvexComb`),
  `Convexity.StdSimplex.iConvexComb_single` (a simple lottery is the combination of the point
  masses of its support), `Convexity.StdSimplex.convexCombPair_restrict_restrict_compl` (over a
  linearly ordered semifield, a simple lottery is the binary combination of its restrictions to a
  set and to the complement). `Mathlib/Geometry/Convex/ConvexSpace/Module.lean`:
  `Convexity.convexSpaceSelf` (ℝ as a convex space), `Convexity.iConvexComb_eq_sum` (in a module,
  a combination is the weighted sum), `Convexity.convexCombPair_eq_sum`.
- `Mathlib/Analysis/Convex/Function.lean`: `ConcaveOn 𝕜 s f` (`s` convex and the concavity
  inequality on `s`). `Mathlib/Analysis/Convex/Slope.lean`: `ConcaveOn.slope_anti_adjacent`.
  `Mathlib/Analysis/Convex/Continuous.lean`: `ConcaveOn.continuousOn_interior` (concave on `C`
  in a finite-dimensional space: continuous on the interior of `C`).
  `Mathlib/Analysis/Convex/Integral.lean`: `ConcaveOn.le_map_integral` (for a probability measure,
  `g` concave and continuous on a closed convex `s`, `f` integrable with values in `s` almost
  everywhere and `g ∘ f` integrable: `∫ g ∘ f ≤ g (∫ f)`).
  `Mathlib/Analysis/Convex/Deriv.lean`: `concaveOn_of_deriv2_nonpos` (continuous on a convex
  `D`, twice differentiable on its interior with `deriv^[2] f ≤ 0` there: concave on `D`);
  `ConcaveOn.antitoneOn_deriv` (concave on `S` and differentiable at every point of `S`: `deriv f`
  is antitone on `S`).
- `Mathlib/Analysis/Calculus/Deriv/MeanValue.lean`: `strictMonoOn_of_deriv_pos` (continuous on a
  convex `D` with positive derivative on its interior: strictly increasing on `D`).
  `Mathlib/Analysis/Calculus/Deriv/Inverse.lean`: `HasDerivAt.of_local_left_inverse` (the
  derivative of a local inverse at a point where the derivative is nonzero).
- `Mathlib/MeasureTheory/Function/L1Space/Integrable.lean`: `MeasureTheory.Integrable`
  (almost-everywhere strongly measurable with finite integral of the norm) and
  `MeasureTheory.integrable_map_measure` (for `f` almost everywhere measurable and `g` almost
  everywhere strongly measurable for `μ.map f`: `g` is integrable for `μ.map f` iff `g ∘ f` is
  for `μ`);
  `Mathlib/MeasureTheory/Integral/Bochner/Basic.lean`: the Bochner integral,
  `MeasureTheory.integral_mono_ae` and `MeasureTheory.integral_map` (under the same hypotheses,
  `∫ g d(μ.map f) = ∫ g ∘ f dμ`); `Mathlib/MeasureTheory/Measure/Dirac/Def.lean`:
  `MeasureTheory.Measure.dirac`; `Mathlib/MeasureTheory/Measure/Map.lean`:
  `MeasureTheory.Measure.map`; `Mathlib/MeasureTheory/Measure/Typeclasses/Probability.lean`:
  `MeasureTheory.IsProbabilityMeasure`.

## References

- Gérard Debreu, "Representation of a preference ordering by a numerical function", in R. M.
  Thrall, C. H. Coombs and R. L. Davis (eds.), *Decision Processes*, Wiley, 1954, pp. 159–165;
  Cowles Foundation Paper 97, the scan the Cowles Foundation served at
  `cowles.econ.yale.edu/P/cp/p00b/p0097.pdf`, read in the Internet Archive capture of
  19 July 2010. Page numbers are those of the book.
- I. N. Herstein and John Milnor, "An axiomatic approach to measurable utility", *Econometrica* 21
  (1953), pp. 291–297; Cowles Foundation Paper 65, read in the same way
  (`cowles.econ.yale.edu/P/cp/p00b/p0065.pdf`, capture of 22 June 2010).
- Peter Ouwehand, "A simple proof of Debreu's Gap Lemma", *ORiON* 26 (2010), pp. 17–20, open
  access under CC BY on the journal's site. Debreu's correction, "Continuity properties of Paretian
  utility", *International Economic Review* 5 (1964), pp. 285–293, is attributed as Ouwehand
  attributes it and was not consulted.
- Gianni Bosi and Asier Estevan, "Continuous representations of preferences by means of two
  continuous functions", arXiv:2402.07908v1, 2024, Corollary 3.2.
- Kim C. Border, lecture notes on his Caltech page (`kcborder.caltech.edu/Notes/`):
  *Introductory Notes on Preference and Rational Choice* (`Choice.pdf`, version 2020.10.05);
  *Technical Results on Regular Preferences and Demand* (`Demand0-Preferences.pdf`, version
  2019.10.30); *Aspects of Normative Decision Theory* (`Decision.pdf`, version 2016.05.04);
  *Pedantic Notes on the Risk Premium and Risk Aversion* (`RiskAversion.pdf`, version
  2018.11.30). Page numbers are those printed in each file.
- Ariel Rubinstein, *Lecture Notes in Microeconomic Theory: The Economic Agent*, second edition,
  Princeton University Press, 2012; the revised version of January 2015 on the author's page
  (`arielrubinstein.tau.ac.il/Rubinstein2007.pdf`), Lectures 2, 7 and 8, with the printed page
  numbers of that file.
- The theorems of Cantor (1895), Eilenberg (1941), von Neumann and Morgenstern (1944), Arrow (1965)
  and Pratt (1964) are attributed as Debreu, Herstein and Milnor, Border and Rubinstein attribute
  them; those works were not consulted.
