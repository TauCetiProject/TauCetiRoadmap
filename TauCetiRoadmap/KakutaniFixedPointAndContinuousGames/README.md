# Roadmap: Kakutani's fixed-point theorem and continuous games

**Summary.** This roadmap develops the fixed-point and intersection theorems for set-valued maps
that underlie the existence of equilibria in games with continuous strategy sets. A
correspondence from a space `X` to a space `Y` assigns to each point of `X` a subset of `Y`; its
continuity is measured by upper and lower hemicontinuity in their topological form, under which
empty values are allowed. Strategy sets and the sets on which fixed points are sought are
nonempty, compact and convex, in finite-dimensional real normed spaces wherever a fixed point is
produced; the intersection theorems hold in every real normed space.

The headline theorems are these.

- *Kakutani's fixed-point theorem.* If `K` is a nonempty compact convex subset of a
  finite-dimensional real normed space and `φ` assigns to each point of `K` a nonempty convex
  subset of `K` in such a way that the graph of `φ` is closed, then `x ∈ φ(x)` for some `x ∈ K`.
  It is derived from Brouwer's fixed-point theorem.
- *Berge's maximum theorem.* If `φ` has nonempty compact values and is both upper and lower
  hemicontinuous at `x₀`, and `f` is continuous on the graph of `φ`, then the value
  `x ↦ max f(x, ·) on φ(x)` is continuous at `x₀`, and the set of maximizers is upper
  hemicontinuous at `x₀` with a nonempty compact value there.
- *The Debreu–Glicksberg–Fan theorem.* A game with finitely many players, nonempty compact convex
  strategy sets in finite-dimensional real normed spaces, payoffs continuous on the set of
  strategy profiles, and each payoff quasiconcave in the player's own strategy has a Nash
  equilibrium in pure strategies.
- *Ky Fan's minimax inequality.* If `K` is a nonempty compact convex subset of a real normed
  space, `f(x, y)` is lower semicontinuous in `y` and quasiconcave in `x` on `K`, and
  `f(x, x) ≤ 0` on `K`, then some `y ∈ K` has `f(x, y) ≤ 0` for all `x ∈ K`. It follows from Fan's
  form of the lemma of Knaster, Kuratowski and Mazurkiewicz, which is also proved.

The roadmap builds on Mathlib's upper and lower hemicontinuity of set-valued maps, its convex
hulls, quasiconcave functions and partitions of unity, and on Tau Ceti's Brouwer fixed-point
theorem for compact convex sets, which is the one fixed-point theorem it consumes. The existence
of mixed equilibria in finite games, which RegretMinimizationAndEquilibria proves, is a special
case of the Debreu–Glicksberg–Fan theorem and is not restated.

Layer 1 below shows that, into a compact Hausdorff space, a closed graph is the same as upper
hemicontinuity with closed values. Layer 2 proves Berge's maximum theorem. Layer 3 proves
Kakutani's theorem from Brouwer's. Layer 4 proves the lemma of Knaster, Kuratowski and
Mazurkiewicz, Fan's form of it and Ky Fan's minimax inequality; it depends on no other layer.
Layer 5 proves the Debreu–Glicksberg–Fan theorem from Layers 1, 2 and 3.

## Conventions

- **Correspondences.** A correspondence from `α` to `β` is a function `φ : α → Set β`. Its graph
  is `{p : α × β | p.2 ∈ φ p.1}`. When `φ` matters only on a set `K`, the graph over `K` is
  `{p | p.1 ∈ K ∧ p.2 ∈ φ p.1}`. Values may be empty unless a statement says otherwise.
- **Hemicontinuity.** Upper and lower hemicontinuity are Mathlib's `UpperHemicontinuous`,
  `UpperHemicontinuousAt`, `LowerHemicontinuous` and `LowerHemicontinuousAt`. By
  `upperHemicontinuousAt_iff_forall_isOpen`, `φ` is upper hemicontinuous at `x` exactly when for
  every open `G ⊇ φ x` the inclusion `φ x' ⊆ G` holds for all `x'` near `x`; by
  `lowerHemicontinuousAt_iff`, `φ` is lower hemicontinuous at `x` exactly when every open set
  meeting `φ x` meets `φ x'` for all `x'` near `x`. These are Border's topological definitions
  (Border, Correspondences, Definition 14, pp. 5–6). They differ from two other conventions in the
  literature: Berge calls a correspondence upper hemicontinuous only if its values are also
  nonempty and compact (as reported in Border, Correspondences, p. 6), and the metric form ("for every `ε > 0`, `φ x'` lies in the
  `ε`-neighbourhood of `φ x` for `x'` near `x`") is weaker for values that are not compact (the
  Checks of 1.1). Where a theorem needs nonempty or compact values it says so.
- **Convexity.** Convex sets, convex hulls and quasiconcave functions are Mathlib's `Convex ℝ`,
  `convexHull ℝ` and `QuasiconcaveOn ℝ`: a function is quasiconcave on `K` when every superlevel
  set `{x ∈ K | r ≤ f x}` is convex. Concave functions are quasiconcave; the converse fails
  (`x ↦ x³` on `ℝ`). Under this definition a set that carries a quasiconcave function is itself
  convex (Mathlib's `QuasiconcaveOn.convex`: the superlevel set at `min (f a) (f b)` contains `a`
  and `b`), so in 4.3 and 5.2 the convexity of `K` and of the sets `S i` also follows from the
  quasiconcavity hypothesis; it is stated with the other hypotheses for readability.
- **Games.** Players form a finite type `ι` with decidable equality. Player `i` chooses a strategy
  in a set `S i` of a real normed space `E i`; a strategy profile is `s : ∀ i, E i` with
  `s ∈ Set.univ.pi S`; a unilateral deviation of `i` to `t` is `Function.update s i t`. Payoffs
  `u i : (∀ i, E i) → ℝ` are maximized. Continuity of `u i` is required on the set of profiles
  only, and quasiconcavity in the player's own strategy only at profiles.
- **Dimensions.** Kakutani's theorem and the Debreu–Glicksberg–Fan theorem assume finite
  dimension, as Brouwer's theorem does; the product `∀ i, E i` of finitely many
  finite-dimensional normed spaces is again one, with the supremum norm.

## Layer 1: closed graphs and upper hemicontinuity

### 1.1 The closed graph theorem for correspondences

Prove `isClosed_graph_iff_upperHemicontinuous`: for topological spaces `α` and `β` with `β`
compact and Hausdorff, a correspondence `φ : α → Set β` has a closed graph if and only if it is
upper hemicontinuous and every value `φ x` is closed (Border, Correspondences, Proposition 19,
p. 7, and Corollary 22, p. 8, for metric spaces; the topological form is proved here).

Route. A closed graph has closed slices, so the values are closed. For upper hemicontinuity at
`x`, let `G ⊇ φ x` be open; the complement `β ∖ G` is compact, each of its points `y` has a
product neighbourhood `U_y × V_y` of `(x, y)` that misses the graph, finitely many `V_y` cover
`β ∖ G`, and on the intersection of the corresponding `U_y` the values lie in `G`. This direction
uses compactness of `β` and no separation axiom. Conversely, a compact Hausdorff space is
regular, and Mathlib's `UpperHemicontinuousAt.mem_of_tendsto`, applied along the neighbourhood
filter of a point `(x, y)` of the closure of the graph, puts `y` in the closed set `φ x`.

**Checks.**
- Compactness of `β` is needed for "closed graph implies upper hemicontinuous": on `ℝ`, the
  correspondence with `φ 0 = {0}` and `φ x = {1/x}` for `x ≠ 0` has a closed graph, but the open
  set `(−1, 1)` contains `φ 0` and no `φ x` with `0 < |x| < 1` (Border, Correspondences,
  Example 18, p. 7).
- The Hausdorff property is needed for the converse. Give `ℕ` the cofinite topology, which is
  compact and T1 but not Hausdorff, and let `α = {0} ∪ {1/n : n ≥ 1} ⊆ ℝ` with `φ 0 = {0}` and
  `φ (1/n) = {n}`. The values are finite, hence closed; `φ` is upper hemicontinuous at `0`, since a
  cofinite open set containing `0` contains `n` for all large `n`, and at the isolated points
  `1/n`. But `(1/n, n)` converges to `(0, 1)`, as every cofinite set contains all large `n`, and
  `1 ∉ φ 0`; so the graph is not closed.
- Empty values are allowed: on `[0, 1]`, the correspondence with `φ 0 = {0}` and `φ x = ∅` for
  `x > 0` has the closed graph `{(0, 0)}` and is upper hemicontinuous; under Berge's convention it
  would not be.
- A closed graph into a compact space need not give lower hemicontinuity: on `[0, 1]`, the
  correspondence with `φ 0 = [0, 1]` and `φ x = {0}` for `x > 0` has a closed graph (two
  segments), but the open set `(1/2, 2)` meets `φ 0` and no `φ x` with `x > 0`.
- The topological definition is stronger than the metric one. The correspondence on the closed
  positive quadrant of `ℝ²` sending `x` to the points below it in both coordinates satisfies the
  metric form, but the open set made of the closed right half-plane together with the points
  `(a, b)` with `a < 0` and `b < 1/|a|` contains the value at the origin and no value at `(δ, δ)`
  for `δ > 0`, since that value contains `(a, δ/2)` for every `a < −2/δ` (Border,
  Correspondences, Example 13, p. 5).

*Needs:* Mathlib `UpperHemicontinuous`, `upperHemicontinuousAt_iff_forall_isOpen`,
`UpperHemicontinuousAt.mem_of_tendsto`, `generalized_tube_lemma`.

### Examples

The correspondence `x ↦ [0, x]` from `[0, 1]` to `[0, 1]` has a closed triangular graph, so it is
upper hemicontinuous with closed values.

### Dependencies

1.1 uses only Mathlib.

## Layer 2: Berge's maximum theorem

### 2.1 The argmax correspondence

Define `argmaxCorr φ f x`, for `φ : α → Set β` and `f : α → β → ℝ`, as the set of `y ∈ φ x` with
`f x z ≤ f x y` for every `z ∈ φ x`: the maximizers of `f x` on `φ x`.

- It is empty when `φ x` is empty, and also when `f x` has no maximum on `φ x`.
- When `φ x` is nonempty and compact and `f x` is continuous on `φ x`, it is nonempty and compact,
  and it is `{y ∈ φ x | V ≤ f x y}` for the maximum value `V`, by `IsCompact.exists_isMaxOn`.

**Checks.**
- For `φ x = [0, 1]` and `f x y = x y` on `ℝ`, the value is `{1}` for `x > 0`, `{0}` for `x < 0`
  and `[0, 1]` for `x = 0`.
- For `φ x = [0, 1)` and `f x y = y` it is empty, although `φ x` is nonempty and `f x` is
  continuous: compactness of the values is needed for the maximum to exist.

*Needs:* Mathlib `IsCompact.exists_isMaxOn`.

### 2.2 The maximum theorem

Prove `berge_maximum_theorem`: let `α` and `β` be topological spaces, `φ : α → Set β` with
nonempty compact values, `f : α → β → ℝ` continuous on the graph of `φ`, and `φ` both upper and
lower hemicontinuous at `x₀`. Then the value function `V x = sSup (f x '' φ x)` is continuous at
`x₀`, and `argmaxCorr φ f` is upper hemicontinuous at `x₀` with a nonempty compact value at `x₀`
(Border, Correspondences, Propositions 33 and 34 and the Berge Maximum Theorem, p. 12, for metric
spaces; the topological form is proved here). Since the values are nonempty and compact, `V x` is
the maximum of `f x` on `φ x`.

Route. Lower hemicontinuity at `x₀` makes `V` lower semicontinuous there: a point `y₀ ∈ φ x₀` with
`f x₀ y₀ > c` has a product neighbourhood on whose part of the graph `f > c`, and `φ x` meets its
second factor for `x` near `x₀`. Upper hemicontinuity at `x₀` and compactness of `φ x₀` make `V`
upper semicontinuous there: if `f x₀ < c` on `φ x₀`, finitely many product neighbourhoods on
whose parts of the graph `f < c` cover `{x₀} × φ x₀`, and `φ x` stays inside the union of their
second factors for `x` near `x₀`. For the argmax, let `G` be open with `argmaxCorr φ f x₀ ⊆ G`. On
the compact set `φ x₀ ∖ G` one has `f x₀ y < V x₀`; as `V` is continuous at `x₀`, every such `y`
has a product neighbourhood on whose part of the graph `f x y < V x`; finitely many cover
`{x₀} × (φ x₀ ∖ G)`, and by upper hemicontinuity, for `x` near `x₀` every point of `φ x` outside
`G` lies in one of them and so is not a maximizer. The value at `x₀` is nonempty and compact by
2.1.

**Checks.**
- Lower hemicontinuity is needed for continuity of the value: with `f x y = y`, the correspondence
  `φ 0 = [0, 1]`, `φ x = {0}` for `x ≠ 0` is upper hemicontinuous with nonempty compact values, and
  `V 0 = 1` while `V x = 0` for `x ≠ 0`.
- Upper hemicontinuity is needed: `φ 0 = {0}`, `φ x = [0, 1]` for `x ≠ 0` is lower hemicontinuous,
  and `V 0 = 0` while `V x = 1` for `x ≠ 0`.
- The argmax need not be lower hemicontinuous: for the constant correspondence `[0, 1]` and
  `f x y = x y`, the argmax of 2.1 jumps from `{0}` through `[0, 1]` to `{1}` as `x` crosses `0`;
  it is upper hemicontinuous, as the theorem says, and `V x = max(x, 0)` is continuous.
- For a constant correspondence `φ x = K` with `K` compact and `f` continuous on `α × β`, the
  continuity of `V` is Mathlib's `IsCompact.continuous_sSup`.

*Needs:* 2.1; Mathlib `UpperHemicontinuousAt`, `LowerHemicontinuousAt`,
`upperHemicontinuousAt_iff_forall_isOpen`, `lowerHemicontinuousAt_iff`,
`IsCompact.exists_isMaxOn`, `IsCompact.exists_sSup_image_eq_and_ge`.

### Examples

The budget correspondence `p ↦ {y ∈ [0, 1] | p y ≤ 1}` on prices `p ∈ (0, ∞)` has nonempty compact
values and is upper and lower hemicontinuous, and with `f p y = y` its value function is
`V p = min(1, 1/p)`, continuous, as 2.2 says.

### Dependencies

2.1 uses Mathlib; 2.2 uses 2.1 and Mathlib.

## Layer 3: Kakutani's fixed-point theorem

### 3.1 Kakutani's theorem

Prove `kakutani_fixedPoint`: let `E` be a finite-dimensional real normed space, `K ⊆ E` nonempty,
compact and convex, and `φ : E → Set E` with `φ x` a nonempty convex subset of `K` for every
`x ∈ K` and with closed graph over `K`. Then some `x ∈ K` has `x ∈ φ x` (Ozdaglar, Lecture 5,
slide 14, for subsets of a finite-dimensional Euclidean space; Kakutani, 1941, for compact convex
subsets of `ℝⁿ`). By 1.1, applied with the compact Hausdorff codomain `K`, the closed graph
hypothesis may be read as upper hemicontinuity with closed values.

Route, by approximate selections. For `ε > 0` cover `K` by finitely many open balls `B(xⱼ, ε)` with
`xⱼ ∈ K`, take a partition of unity `(λⱼ)` on `K` subordinate to them, choose `yⱼ ∈ φ xⱼ`, and set
`g x = Σⱼ λⱼ(x) yⱼ`. Then `g` is continuous and maps `K` into `K`, which is convex, so Brouwer's
theorem gives `x_ε = g x_ε`. By Carathéodory's theorem `x_ε` is a convex combination of at most
`dim E + 1` of the points `yⱼ` with `‖xⱼ − x_ε‖ < ε`. Along `ε = 1/k`, compactness gives
convergent subsequences of `x_ε`, of these points `yⱼ` and of the weights; the closed graph puts
the limits of the `yⱼ` in `φ x` for the limit `x` of `x_ε`, and convexity of `φ x` puts `x` in
`φ x`.

**Checks.**
- A continuous self-map `h` of `K` gives `φ x = {h x}`, which satisfies the hypotheses, and its
  fixed points are those of `h`: Brouwer's theorem is the single-valued case.
- On `K = [0, 1]`, `φ x = [1 − x, 1]` has the fixed points `[1/2, 1]`.
- Convex values are needed: on `[0, 1]`, `φ x = {1}` for `x < 1/2`, `φ (1/2) = {0, 1}` and
  `φ x = {0}` for `x > 1/2` has a closed graph and no fixed point.
- The closed graph is needed: `φ x = {1}` for `x ≤ 1/2` and `φ x = {0}` for `x > 1/2` has convex
  values and no fixed point.
- Convexity of `K` is needed: on the unit circle of `ℝ²`, `φ x = {−x}` has a closed graph and
  singleton values and no fixed point.
- Compactness is needed: on `K = ℝ`, `φ x = {x + 1}` has no fixed point.
- Nonempty values and nonempty `K` are needed: the empty correspondence has no fixed point, and
  neither does any correspondence on `K = ∅`.

*Needs:* Tau Ceti `TauCeti.brouwerFixedPoint_compactConvex_continuousOn`; Mathlib
`PartitionOfUnity.exists_isSubordinate`, `convexHull_eq_union` (Carathéodory), `convexHull`,
`IsCompact.isSeqCompact`.

### Examples

On `K = [0, 1]²`, the correspondence `φ (x, y) = [0, 1 − y] × {x}` has the fixed points
`(x, x)` with `x ≤ 1/2`.

### Dependencies

3.1 uses Tau Ceti's Brouwer theorem and Mathlib; the reading of its hypothesis by upper
hemicontinuity uses 1.1.

## Layer 4: intersection theorems and Ky Fan's inequality

### 4.1 The lemma of Knaster, Kuratowski and Mazurkiewicz

Prove `knaster_kuratowski_mazurkiewicz`: let `E` be a real normed space, `ι` a nonempty finite
type, `a : ι → E` and closed sets `F : ι → Set E` such that, for every finite `A ⊆ ι`, the convex
hull of the points `a i` with `i ∈ A` lies in the union of the sets `F i` with `i ∈ A`. Then the
convex hull of all the points `a i` contains a point common to all the `F i` (Border, Fixed point
theory, Theorem 2.1 and Corollary 2.3, p. 5, in `ℝᵏ`; the proof of §6.1, p. 12, holds in every real
normed space).

Route (Border, Fixed point theory, §6.1, p. 12). If the sets `F i` had no common point on the
compact convex set `K = convexHull ℝ (range a)`, their complements would form an open cover of
`K`; a subordinate partition of unity `(gᵢ)` gives the continuous map `x ↦ Σ gᵢ(x) a i` of `K`
into itself, which has a fixed point `z` by Brouwer's theorem, applied in the finite-dimensional
span of the points `a i`. With `A` the set of `i` such that `gᵢ(z) > 0`, the point `z` lies in the
convex hull of the `a i` with `i ∈ A` and outside every `F i` with `i ∈ A`, against the covering
hypothesis.

**Checks.**
- Closedness is needed: in `ℝ` with `a 0 = 0`, `a 1 = 1`, `F 0 = [0, 1/2)` and `F 1 = [1/2, 1]`,
  the covering hypothesis holds and `F 0 ∩ F 1 = ∅`.
- The index type must be nonempty: for empty `ι` the hypothesis holds vacuously and the convex
  hull of no points is empty.
- With `a 0 = 0`, `a 1 = 1`, `F 0 = [0, 2/3]` and `F 1 = [1/3, 1]` the common points in `[0, 1]`
  are `[1/3, 2/3]`.

*Needs:* Tau Ceti `TauCeti.brouwerFixedPoint_compactConvex_finiteSpan`; Mathlib
`PartitionOfUnity.exists_isSubordinate`, `convexHull`, `Set.Finite.isCompact_convexHull`.

### 4.2 Fan's form of the lemma

Prove `fan_kkm`: let `X` be a subset of a real normed space `E` and `F x` a closed set for each
`x ∈ X`, at least one of them compact, such that for every finite `t ⊆ X` the convex hull of `t`
lies in the union of the sets `F x` with `x ∈ t`. Then the sets `F x` with `x ∈ X` have a common
point (Border, Fixed point theory, Corollary 2.5, p. 5, in `ℝᵐ`; Fan, 1961, attributed in prose).

Route. For finitely many `x₁, …, x_k ∈ X`, 4.1 with `a j = x_j` and the sets `F x_j` gives a
common point; so the closed sets `F x ∩ F x₀`, for a compact `F x₀`, have the finite intersection
property inside a compact set, and Mathlib's `IsCompact.inter_iInter_nonempty` concludes.

**Checks.**
- The covering hypothesis with `t = {x}` gives `x ∈ F x`.
- A compact value is needed: with `X = ℕ ⊆ ℝ` and `F n = [n, ∞)`, the convex hull of a finite
  `t ⊆ ℕ` is `[min t, max t] ⊆ [min t, ∞)`, so the covering hypothesis holds, and no real number
  lies in every `F n`.

*Needs:* 4.1; Mathlib `IsCompact.inter_iInter_nonempty`.

### 4.3 Ky Fan's minimax inequality

Prove `kyFan_minimax_inequality`: let `K` be a nonempty compact convex subset of a real normed
space `E` and `f : E → E → ℝ` such that `f x` is lower semicontinuous on `K` for every `x ∈ K`,
`x ↦ f x y` is quasiconcave on `K` for every `y ∈ K`, and `f x x ≤ 0` for every `x ∈ K`. Then some
`y ∈ K` has `f x y ≤ 0` for every `x ∈ K` (Fan, 1972, attributed in prose; proved here from 4.2).

Route. Apply 4.2 with `X = K` and `F x = {y ∈ K | f x y ≤ 0}`, which is closed by lower
semicontinuity and compact as a closed subset of `K`. If a point `y` of the convex hull of a
finite `t ⊆ K` lay in no `F x` with `x ∈ t`, then `y ∈ K` by convexity and `f x y > 0` for all
`x ∈ t`. Let `r > 0` be the least of these finitely many values. The superlevel set
`{x ∈ K | r ≤ f x y}` is convex and contains `t`, hence `y`, so `f y y ≥ r > 0`, against
`f y y ≤ 0`.

**Checks.**
- Fan's lemma on closed sets is the case of an indicator: for a closed `D ⊆ K × K` containing the
  diagonal and with `{x | (x, y) ∉ D}` convex for each `y`, take `f x y = 1` when `(x, y) ∉ D` and
  `0` otherwise; the conclusion is a `y` with `(x, y) ∈ D` for all `x ∈ K` (Border, Fixed point
  theory, Corollary 4.4, p. 8, in `ℝᵐ`).
- Quasiconcavity is needed: on `K = [0, 1]`, `f x y = |x − y|` is continuous and vanishes on the
  diagonal, and `f x y ≤ 0` for all `x` fails for every `y`; the superlevel set
  `{x | 1/4 ≤ |x − 1/2|}` contains `0` and `1` but not `1/2`.
- Lower semicontinuity is needed: on `K = [0, 1]`, let `T y = 1` for `y ≤ 1/2` and `T y = 0` for
  `y > 1/2`, and `f x y = (y − T y)² − (x − T y)²`. It is concave in `x` and vanishes on the
  diagonal, and taking `x = T y` shows that the conclusion would force `y = T y`, which no `y`
  satisfies. Here `f 1 (1/2) = 1/4` while `f 1 y → −3/4` as `y` decreases to `1/2`.
- Compactness is needed: on `K = [0, ∞)`, `f x y = x − y` is continuous, linear in `x` and zero on
  the diagonal, and `f (y + 1) y = 1 > 0` for every `y`.

*Needs:* 4.2; Mathlib `QuasiconcaveOn`, `LowerSemicontinuousOn`, `Convex.convexHull_subset_iff`.

### Examples

For a continuous self-map `h` of a nonempty compact convex `K` in a finite-dimensional real inner
product space, `f x y = ‖y − h y‖² − ‖x − h y‖²` satisfies the hypotheses of 4.3, and the point it
gives, tested at `x = h y`, is a fixed point of `h`.

### Dependencies

4.1 uses Tau Ceti's Brouwer theorem and Mathlib; 4.2 uses 4.1; 4.3 uses 4.2. The layer uses no
other layer.

## Layer 5: existence of pure equilibria

### 5.1 Pure Nash equilibria

Define `IsPureNashEquilibrium S u s`, for strategy sets `S i ⊆ E i` and payoffs
`u i : (∀ i, E i) → ℝ`: `s i ∈ S i` for every `i`, and `u i (Function.update s i t) ≤ u i s` for
every player `i` and every `t ∈ S i`.

**Checks.**
- In matching pennies with pure strategies `S i = {0, 1}` (player 1 gains `1` on a match and loses
  `1` otherwise, player 2 the reverse), no profile is an equilibrium.
- With no players there is exactly one profile, and it is an equilibrium.
- In the Cournot duopoly with `S 1 = S 2 = [0, 1]` and `u i s = s i (1 − s 1 − s 2)`, the best
  reply to `s j` is `(1 − s j)/2`, and the only equilibrium is `(1/3, 1/3)`, with payoff `1/9` to
  each player.

### 5.2 The Debreu–Glicksberg–Fan theorem

Prove `exists_isPureNashEquilibrium`: if `ι` is finite, each `E i` is a finite-dimensional real
normed space, each `S i` is nonempty, compact and convex, each `u i` is continuous on the set of
profiles `Set.univ.pi S`, and `t ↦ u i (Function.update s i t)` is quasiconcave on `S i` for every
profile `s`, then a pure Nash equilibrium exists (Ozdaglar, Lecture 6, §4, p. 6-7; the route of
Lecture 5, slides 20–24; Debreu, 1952, Glicksberg, 1952, and Fan, 1952, attributed in prose).

Route. On the set `P = Set.univ.pi S` of profiles, a nonempty compact convex subset of the
finite-dimensional space `∀ i, E i`, let `Bᵢ s` be the argmax (2.1) of `t ↦ u i (update s i t)` on
the constant correspondence `S i`. By 2.2, applied on the space `P` with the constant
correspondence, which is upper and lower hemicontinuous, `Bᵢ` is upper hemicontinuous with
nonempty compact values; its values are convex, being superlevel sets of a quasiconcave function
at its maximum; and by 1.1 into the compact Hausdorff space `S i` its graph over `P` is closed.
The product correspondence `B s = Πᵢ Bᵢ s` then has nonempty convex values and a closed graph over
`P`, and a fixed point of `B`, given by 3.1, is a pure Nash equilibrium.

**Checks.**
- Mixed equilibria of finite games are the special case of simplices: with `S i` the simplex of
  probability vectors on a finite action set and `u i` the expected payoff, which is multilinear,
  hence continuous and linear in the player's own strategy, the theorem gives a mixed equilibrium.
- Equilibria need not be unique: with `S 1 = S 2 = [0, 1]` and `u i s = s 1 s 2 − (s i)²/2`, each
  payoff is strictly concave in the player's own strategy, the best reply to `t` is `t`, and every
  `(t, t)` is an equilibrium (Ozdaglar, Lecture 6, §4, Example 3, pp. 6-7 and 6-8).
- Quasiconcavity is needed: with `S 1 = S 2 = [0, 1]`, `u 1 s = −(s 1 − s 2)²` and
  `u 2 s = (s 1 − s 2)²`, player 1's best reply to `t` is `t` and player 2's best reply to `t` is
  `1` for `t < 1/2`, `0` for `t > 1/2` and `{0, 1}` for `t = 1/2`, so no profile is an equilibrium.
- Continuity is needed: one player with `S = [0, 1]` and `u s = s` for `s < 1`, `u 1 = 0` has a
  quasiconcave payoff with no maximizer.
- Compactness is needed: one player with `S = [0, 1)` and `u s = s` has no maximizer.
- Convexity of the strategy sets is not a separate requirement: by the convention on
  quasiconcavity it follows from the quasiconcavity hypothesis. The matching pennies game of 5.1,
  with compact strategy sets `{0, 1}`, continuous payoffs and no equilibrium, violates that
  hypothesis, because `{0, 1}` is itself a superlevel set of each payoff in the player's own
  strategy and is not convex.

*Needs:* 1.1, 2.1, 2.2, 3.1, 5.1; Mathlib `isCompact_univ_pi`, `convex_pi`, `QuasiconcaveOn`.

### Examples

The Cournot duopoly of 5.1 satisfies the hypotheses of 5.2, its payoffs being concave in the
player's own quantity.

### Dependencies

5.1 uses Mathlib; 5.2 uses 1.1, 2.1, 2.2, 3.1 and 5.1.

## Scope and ownership

This roadmap owns the targets stated above: the closed graph theorem for correspondences into a
compact Hausdorff space; the argmax correspondence and Berge's maximum theorem; Kakutani's
fixed-point theorem in finite dimension; the lemma of Knaster, Kuratowski and Mazurkiewicz in a
real normed space, Fan's form of it and Ky Fan's minimax inequality; pure Nash equilibria and the
Debreu–Glicksberg–Fan theorem.

Already in the libraries and therefore not targets:

- Mathlib's upper and lower hemicontinuity with their open-set and sequential characterizations,
  including `UpperHemicontinuousAt.mem_of_tendsto` (into a regular space, a limit of points of the
  values along a convergent net lies in a closed value) and `UpperHemicontinuous.isClosed_domain`, and Michael's
  selection theorem; Mathlib's `IsCompact.continuous_sSup`, the maximum theorem for a constant
  correspondence; Mathlib's Sion minimax theorem (`Sion.exists_isSaddlePointOn`), a statement
  about saddle points of a function of two variables, which is not Ky Fan's inequality and is not
  restated.
- Tau Ceti's Brouwer fixed-point theorem for nonempty compact convex subsets of a
  finite-dimensional real normed space and of a finite-dimensional subspace of any real normed
  space, which 3.1 and 4.1 consume.

Left to other roadmaps:

- RegretMinimizationAndEquilibria owns finite normal-form games, their mixed Nash equilibria and
  the existence theorem `exists_isNash` (its 3.1), proved there from Brouwer's theorem. That
  theorem is the case of simplices of 5.2 (the first Check of 5.2); it is not restated here, and
  this roadmap consumes nothing from that one.
- PotentialGamesAndPriceOfAnarchy (a roadmap not on main) treats pure equilibria of games given by
  costs with finite strategy sets, found through potentials, in its 1.1; its objects are finite
  and its route is a potential, while 5.2 concerns convex strategy sets and uses a fixed point.
  This roadmap does not depend on that one.
- ConvexAnalysisAndDuality (an open roadmap, not on main) names Berge's maximum theorem among the
  subjects outside its scope and states no part of it.

Outside the scope: the extension of Kakutani's theorem to compact convex subsets of locally convex
spaces (Fan and Glicksberg) and the Schauder–Tychonoff theorem it rests on, which the pins do not
provide; Glicksberg's theorem on mixed equilibria of games with compact metric strategy spaces;
equilibria of discontinuous games; Walrasian equilibrium and every theorem of general equilibrium
theory; generalized games with constrained strategy sets; Sperner's lemma; selection theorems;
and every procedure for computing a fixed point or an equilibrium.

## Exact supplier contracts

### From Mathlib

- `Mathlib/Topology/Semicontinuity/Defs.lean`: `UpperHemicontinuous`, `UpperHemicontinuousAt`
  (for every neighbourhood `t` of the set `f x`, `t` is a neighbourhood of `f x'` for `x'` near
  `x`), `LowerHemicontinuous`, `LowerHemicontinuousAt`; `lowerHemicontinuousAt_iff` (every open
  `u` meeting `f x` meets `f x'` for `x'` near `x`); `LowerSemicontinuousOn`.
- `Mathlib/Topology/Semicontinuity/Hemicontinuity.lean`:
  `upperHemicontinuousAt_iff_forall_isOpen` (`UpperHemicontinuousAt f x` if and only if for every
  open `u ⊇ f x`, `f x' ⊆ u` for `x'` near `x`); `UpperHemicontinuousAt.mem_of_tendsto` (for
  `[RegularSpace β]`, `f` upper hemicontinuous at `x₀` with `f x₀` closed, `x → x₀` and `y → y₀`
  along a filter with `y n ∈ f (x n)` frequently: `y₀ ∈ f x₀`).
- `Mathlib/Topology/Compactness/Compact.lean`: `generalized_tube_lemma` (compact `s`, `t` with `s ×ˢ t` inside an open `n` have open
  neighbourhoods whose product lies in `n`); `IsCompact.inter_iInter_nonempty` (a compact set
  meets the intersection of a family of closed sets if it meets every finite subintersection);
  `isCompact_univ_pi`. `Mathlib/Topology/Sequences.lean`: `IsCompact.isSeqCompact`.
- `Mathlib/Topology/Order/Compact.lean`: `IsCompact.exists_isMaxOn` (a function continuous on a
  nonempty compact set attains its maximum there); `IsCompact.exists_sSup_image_eq_and_ge`;
  `IsCompact.continuous_sSup` (for `f` continuous on `γ × β` and `K` compact,
  `x ↦ sSup (f x '' K)` is continuous).
- `Mathlib/Topology/PartitionOfUnity.lean`: `PartitionOfUnity.exists_isSubordinate` (in a normal
  paracompact space, a closed set covered by open sets `U i` carries a partition of unity
  subordinate to them).
- `Mathlib/Analysis/Convex/Hull.lean`, `Mathlib/Analysis/Convex/Caratheodory.lean`,
  `Mathlib/Analysis/Convex/Topology.lean`: `convexHull`, `Convex.convexHull_subset_iff`;
  `convexHull_eq_union` (Carathéodory: the convex hull is the union of the convex hulls of its
  affinely independent finite subsets); `Set.Finite.isCompact_convexHull`.
- `Mathlib/Analysis/Convex/Basic.lean`: `Convex`, `convex_pi`.
  `Mathlib/Analysis/Convex/Quasiconvex.lean`: `QuasiconcaveOn` (every superlevel set
  `{x ∈ s | r ≤ f x}` is convex); `QuasiconcaveOn.convex` (a set carrying a quasiconcave function
  is convex).

### From Tau Ceti

- `TauCeti/AlgebraicTopology/Singular/BrouwerFixedPoint.lean`:
  `TauCeti.brouwerFixedPoint_compactConvex_continuousOn` (for `E` a finite-dimensional real
  normed space and `C ⊆ E` nonempty, compact and convex, a function continuous on `C` and mapping
  `C` into itself has a fixed point in `C`); `TauCeti.brouwerFixedPoint_compactConvex_finiteSpan`
  (for a nonempty compact convex `C` lying in a finite-dimensional subspace of an arbitrary real
  normed space, every continuous self-map of `C` has a fixed point).

## References

- Kim C. Border, *Introduction to Correspondences*, lecture notes, Caltech, version
  2016.09.11, author's page `kcborder.caltech.edu/Notes/Correspondences.pdf`: Definition 14
  (pp. 5–6) and Example 13 (p. 5), the conventions of other authors (p. 6), Example 18 and
  Proposition 19 (p. 7), Corollary 22 (p. 8), Propositions 33 and 34 and the Berge Maximum Theorem
  (p. 12, proof p. 13). All spaces in these notes are metric spaces.
- Kim C. Border, *Fixed point theory*, lecture notes excerpted from his book *Fixed point theorems
  with applications to economics and game theory* (Cambridge University Press, 1985), author's
  page `kcborder.caltech.edu/Notes/FixPt.pdf`: Theorem 2.1, Corollaries 2.3 and 2.5 (p. 5),
  Corollary 4.4 (p. 8), §6.1 (p. 12).
- Asu Ozdaglar, *6.254 Game Theory with Engineering Applications*, MIT OpenCourseWare, Spring
  2010: Lecture 5 slides, *Existence of a Nash equilibrium* (18 February 2010), slides 14 and
  20–24; Lecture 6 notes, *Continuous and discontinuous games* (23 February 2010), §4 and
  Example 3, pp. 6-7 and 6-8.
- The original papers carry their customary attributions in prose and no locator; they were not
  consulted: Knaster, Kuratowski and Mazurkiewicz (Fund. Math., 1929), Kakutani (Duke Math. J.,
  1941), Debreu (Proc. Natl. Acad. Sci. USA, 1952), Glicksberg (Proc. Amer. Math. Soc., 1952), Fan
  (Proc. Natl. Acad. Sci. USA, 1952; Math. Ann., 1961; and *A minimax inequality and
  applications*, in *Inequalities III*, 1972) and Berge (*Espaces topologiques et fonctions
  multivoques*, 1959).
