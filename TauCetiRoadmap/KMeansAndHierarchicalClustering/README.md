# Roadmap: k-means and hierarchical clustering

**Summary.** This roadmap proves the basic theorems about two kinds of clustering of a finite data
set: partitional clustering by the k-means cost, and hierarchical clustering by dendrograms. The
data are `n` points of a real inner product space, repetitions allowed, or `n` points with a
table of pairwise distances. Lloyd's iteration and D² seeding enter only as mathematical objects:
a self-map of the set of pairs (labelling, centres) and an explicit probability mass function on
tuples of data indices. No procedure, program or running time is a target.

The headline theorems are these.

- *Lloyd's map.* For the map that reassigns every point to a nearest centre (keeping its label
  when that label is already nearest) and then moves every nonempty cluster's centre to its
  centroid, the k-means cost never increases, it strictly decreases at every pair the map moves,
  and from every pair the `k^n`-th iterate is a fixed point: a pair in which every label is a
  nearest centre and every nonempty cluster is centred at its centroid.
- *D² seeding (Arthur–Vassilvitskii).* If the first centre is a data point chosen uniformly and
  each further centre a data point chosen with probability proportional to its squared distance
  from the centres already chosen, the expected k-means cost of the `k` chosen centres is at most
  `8(ln k + 2)` times the optimal cost.
- *Kleinberg's impossibility theorem.* On at least two points no clustering function is
  scale-invariant, rich and consistent. The ranges of the scale-invariant consistent functions
  are exactly the nonempty antichains of partitions; single linkage at a fixed scale `r > 0` is
  rich and consistent, and on at least three points single linkage at a fixed fraction
  `0 < α < 1` of the largest distance is scale-invariant and rich.
- *Dendrograms and single linkage.* On a finite set, dendrograms and ultrametrics correspond
  bijectively, and single linkage of a nonnegative dissimilarity that vanishes only on the
  diagonal gives the greatest ultrametric below it. On finite metric spaces, single linkage is
  the only hierarchical method that outputs ultrametrics, is normalized on two-point spaces and
  does not increase along distance-nonincreasing maps. For two dissimilarities vanishing on the
  diagonal and a relation that is total in both directions, if they differ by at most `η` on
  related pairs, so do their single-linkage ultrametrics.

The roadmap builds on Mathlib's centroids, harmonic numbers and partitions as equivalence
relations, and on Tau Ceti's variance decomposition of a sum of squared distances. Neighbouring
subjects are left to other roadmaps: the population k-means risk and its consistency to
StatisticalLearningTheory, single-linkage cluster counts through Rips complexes to
TopologicalDataAnalysis, and spectral clustering to KernelsAndSpectralMethods.

Layer 1 proves the four theorems on Lloyd's map; Layer 2 the Arthur–Vassilvitskii bound for D²
seeding; Layer 3 treats dendrograms, ultrametrics and single linkage; Layer 4 Kleinberg's axioms
and theorems, using the single-linkage partitions of Layer 3. Layers 1 and 3 use no other layer,
and Layer 2 uses Layer 1 only through the centroid lemma.

## Conventions

The design choices below are fixed before any target; each comes with a Check showing what goes
wrong with the plausible alternative.

- **Data.** `E` is a real inner product space and a data family is `x : Fin n → E`; points may
  repeat, and `n = 0` is allowed. The sources work in `ℝ^d` with a finite set of points; every
  statement here holds in this generality with the same proof.
- **Pairs.** A k-means state is a pair `(a, c)` of a labelling `a : Fin n → Fin k` and a centre
  map `c : Fin k → E`. The cluster of `j` is the set of `i` with `a i = j`; clusters may be empty.
  The cost of a pair is `∑ᵢ ‖xᵢ − c(aᵢ)‖²`.
- **Ties in the assignment step.** A label `j` is a nearest centre for `xᵢ` when
  `‖xᵢ − c j‖ ≤ ‖xᵢ − c j'‖` for every `j'`. The assignment step keeps `aᵢ` when it is a nearest
  centre and otherwise takes the least nearest label. **Check.** For `x = (0, 0)` in `ℝ`, `k = 2`,
  `a = (0, 1)` and `c = (0, 0)`, both labels are nearest for both points: the rule fixes the pair.
  The rule "always take the least nearest label" moves it to `((0, 0), (0, 0))` at the same cost
  `0`, so the strict decrease of 1.2 would fail; and if any nearest label may be taken, the
  labellings `(0, 1)` and `(1, 0)` can alternate for ever at cost `0`, so no iterate need be
  fixed.
- **Empty clusters in the update step.** A nonempty cluster moves its centre to the centroid of
  its points (Mathlib's `Finset.centroid`, whose value on an empty family is an unspecified
  point); an empty cluster keeps its centre. **Check.** For
  `x = (10, 12)` in `ℝ`, `a = (0, 0)` and `c = (11, 100)`, cluster `1` is empty and the pair is a
  fixed point. With the formula `|C|⁻¹ ∑_{i ∈ C} xᵢ` for every cluster `C`, an empty cluster gets
  the junk value `0` (since `0⁻¹ = 0`) and the centre `100` would jump to `0`; after translating
  data and centres by `5`, the kept centre is
  `105` but the junk centre is again `0`, so that rule does not commute with translations, and
  its fixed points would depend on the origin.
- **Partitions.** A partition of a type is a Mathlib `Setoid`; `Γ ≤ Γ'` means that `Γ` refines
  `Γ'`, `⊥` is the partition into points and `⊤` the one-block partition. `Setoid` is chosen over
  `Finpartition` because the axioms of Layer 4 and the dendrograms of Layer 3 speak of "`i` and
  `j` lie in one block", which a `Setoid` is, and because its order is the refinement order of the
  sources with no decidability or `Finset` bookkeeping. **Check.** For `Fin 2`, `⊥ < ⊤`, so the
  family of all partitions of two points is not an antichain, which is what Kleinberg's theorem
  uses.
- **Distance functions.** A distance function on `X` is `d : X → X → ℝ` with `d x y = 0` exactly
  when `x = y`, `d ≥ 0` and `d` symmetric (Kleinberg's notion); a metric adds the triangle
  inequality. An ultrametric vanishes exactly on the diagonal, is symmetric and satisfies
  `u x z ≤ max(u x y, u y z)`; nonnegativity follows from `0 = u x x ≤ max(u x y, u y x)`.
  Mathlib's `IsUltrametricDist` is a class on a type with one fixed distance; here the
  ultrametric varies on a fixed type (single linkage of different `d`), so it is a predicate on
  functions.
- **Dendrograms.** A dendrogram is a family `θ : ℝ → Setoid X` that is the partition into points
  at every scale `r ≤ 0`, is monotone, is `⊤` at some scale, and for every `r` is constant on some
  interval `[r, r + ε]` with `ε > 0`. Carlsson and Mémoli index dendrograms by `[0, ∞)`; extending
  by `⊥` on the negative scales is a bijection between the two notions. **Check.** The family
  that is `⊥` for `r < 1` and `⊤` for `r ≥ 1` on two points is a dendrogram; the family that is
  `⊥` for `r ≤ 1` and `⊤` for `r > 1` is not, since it is not constant on any `[1, 1 + ε]`, and
  for it the least scale at which the two points share a block does not exist.
- **Single linkage.** Single linkage of `d` at scale `r` is the equivalence relation generated by
  `d x y ≤ r` (Mathlib's `Relation.EqvGen.setoid`): `x` and `y` share a block when a chain from `x`
  to `y` has all its steps of length at most `r`. The same construction applied to an ultrametric
  is the inverse of the passage from dendrograms to ultrametrics, so one definition serves both.
- **Junk values.** `⨅` over an empty index type in `ℝ` is `0`, and so is `sInf ∅`. Each definition
  below says where such a value can arise and why it does not enter a statement.

## Layer 1: the k-means cost and Lloyd's map

### 1.1 Pairs, assignment, update and Lloyd's map

Define `pairCost x s` for `s = (a, c)` as `∑ᵢ ‖xᵢ − c(aᵢ)‖²`; `IsNearest x c i j` as
`‖xᵢ − c j‖ ≤ ‖xᵢ − c j'‖` for all `j'`; `assignStep x a c` by the tie rule of the Conventions
(the least nearest label is Mathlib's `Fin.find`); `cluster a j` as the `Finset` of `i` with
`a i = j`; `updateStep x a c` by the empty-cluster rule; and `lloydMap x (a, c) = (a', c')` with
`a' = assignStep x a c` and `c' = updateStep x a' c`.

- The assignment step makes every label a nearest centre for `c`: the label kept is nearest by
  the test, and a least nearest label exists because `Fin k` is nonempty when there is a label.
- The centroid lemma (Arthur–Vassilvitskii, Lemma 2.1): for a nonempty finite set `S` of indices
  with centroid `g` and every `z`, `∑_{i ∈ S} ‖xᵢ − z‖² = ∑_{i ∈ S} ‖xᵢ − g‖² + |S| ‖g − z‖²`. It
  is Tau Ceti's `Finset.sum_mul_norm_sub_sq_eq` for the weights `1/|S|`, multiplied by `|S|`: the
  weights sum to `1` by `Finset.sum_centroidWeights_eq_one_of_card_ne_zero`, and their weighted
  mean is the centroid by `Finset.centroid_def` and
  `Finset.affineCombination_eq_linear_combination`. In particular the centroid is the unique
  minimizer of `z ↦ ∑_{i ∈ S} ‖xᵢ − z‖²`.

**Checks.**
- For `x = (0, 2, 10)` in `ℝ`, `k = 2`, `a = (0, 0, 1)`, `c = (5, 5)`: the cost is
  `25 + 9 + 25 = 59`; the assignment keeps `a` (5 is nearest for every point since both centres
  coincide), the update gives `c' = (1, 10)`, and the cost of the image is `1 + 1 + 0 = 2`.
- For `x = (0, 4)`, `k = 2`, `a = (0, 0)` and `c = (0, 3)`: the assignment gives `(0, 1)`, and the
  update `(0, 4)`, a fixed point of cost `0`. A rule that updated before assigning would move
  `c` to `(2, 3)` and then assign `(0, 1)`, a different map.

*Needs:* Mathlib `Finset.centroid`, `Finset.centroid_def`,
`Finset.affineCombination_eq_linear_combination`,
`Finset.sum_centroidWeights_eq_one_of_card_ne_zero`, `Fin.find`, `Fin.find_spec`, `Fin.find_min`;
Tau Ceti `Finset.sum_mul_norm_sub_sq_eq`.

### 1.2 Monotonicity and strict decrease

Prove `pairCost_lloydMap_le`: `pairCost x (lloydMap x s) ≤ pairCost x s` for every pair `s`
(Shalev-Shwartz–Ben-David, Lemma 22.1, §22.2.1, p. 313, for points of `ℝ^d` and an arbitrary tie
rule; Arthur–Vassilvitskii, §2.1). Prove `pairCost_lloydMap_lt`: if
`lloydMap x s ≠ s` then `pairCost x (lloydMap x s) < pairCost x s`. (Proved here.)

Route. Write `s = (a, c)` and `lloydMap x s = (a', c')`. Termwise
`‖xᵢ − c(aᵢ)‖ ≥ ‖xᵢ − c(a'ᵢ)‖`, since `a'ᵢ` is nearest; so the cost of `(a, c)` is at least that of
`(a', c)`. Cluster by cluster, the centroid lemma gives that the cost of `(a', c)` minus that of
`(a', c')` is `∑_j |C_j| ‖g_j − c_j‖²` over the nonempty clusters `C_j` of `a'`, with centroids
`g_j`; empty clusters contribute nothing to either cost. This gives monotonicity. If the two costs
are equal, both differences vanish: then `c_j = g_j` on every nonempty cluster, so `c' = c`
(empty clusters keep their centres); and the termwise inequalities are equalities, so every `aᵢ`
is nearest and the tie rule gives `a' = a`. So `lloydMap x s = s`.

**Checks.**
- In the first Check of 1.1 the cost drops from `59` to `2`.
- The strict decrease fails for the least-label tie rule (the Check on ties in the Conventions).

*Needs:* 1.1 (the centroid lemma and the nearest property of the assignment step).

### 1.3 Fixed points

Prove `isFixedPt_lloydMap_iff`: `(a, c)` is a fixed point of `lloydMap x` if and only if every
`aᵢ` is a nearest centre for `c` and every nonempty cluster `C_j` of `a` has `c_j` equal to its
centroid. (Proved here.)

Route. If every label is nearest, the assignment step returns `a`; then the update returns `c`
exactly when every nonempty cluster is centred at its centroid. Conversely, a fixed point has
`assignStep x a c = a`, and every label the assignment step returns is nearest.

**Checks.**
- The pair `((0, 0), (11, 100))` for `x = (10, 12)` is a fixed point, although `100` is no
  centroid: its cluster is empty.
- A pair of least cost is a fixed point, by 1.2. The converse fails: for `x = (0, 2, 3)` in `ℝ`
  and `k = 2`, the labelling `(0, 1, 1)` with centres `(0, 5/2)` has cost `1/2`, the least
  possible, and the labelling `(0, 0, 1)` with centres `(1, 3)` has cost `2`; both are fixed
  points (in the second the point `2` is at distance `1` from both centres and keeps its label).
- The tie rule decides the fixed points: the pair with labelling `(1, 1, 0)` and centres `(3, 1)`
  is fixed, since the tied point `2` keeps label `1`; the least-label rule would move it to
  label `0`.

*Needs:* 1.1.

### 1.4 The iterates reach a fixed point

Prove `isFixedPt_lloydMap_iterate`: for every pair `s`, `(lloydMap x)^[k^n] s` is a fixed point of
`lloydMap x`. (Proved here; Arthur–Vassilvitskii, §1, observe that the cost decreases, so that
no clustering repeats, and that there are at most `k^n` clusterings.)

Route. Write `s_m = (a_m, c_m)` for the iterates. For `m ≥ 1` the centres `c_m` are the centroids
of the nonempty clusters of `a_m`, so the cost of `s_m` is the within-cluster sum of squares
`W(a_m) = ∑_j ∑_{i ∈ C_j} ‖xᵢ − g_j‖²` of the labelling alone. If none of `s_1, …, s_M` is a fixed
point, 1.2 gives `W(a_1) > W(a_2) > ⋯ > W(a_{M+1})`, so these `M + 1` labellings are distinct and
`M + 1 ≤ k^n`. Hence some `s_m` with `1 ≤ m ≤ k^n` is fixed, and then so is `s_{k^n}`. When
`k = 0` and `n ≥ 1` there is no pair, and when `n = 0` the only labelling is empty and `s_1 = s_0`.

**Checks.**
- In the second Check of 1.1 the first iterate is already fixed, with `k^n = 4`.
- Exact rational computation for every data family `x` in `ℝ` that is a nondecreasing tuple with
  entries in `{0, 1, 3}` and `n ≤ 5` (`56` families), every `k ≤ 3`, every labelling and every
  centre map with values in `{0, 1, 2, 3}` (`442321` pairs): monotonicity, strict decrease, the
  fixed-point criterion and a fixed point within `k^n` steps hold in every case, and no orbit
  needs more than four steps.

*Needs:* 1.2, 1.3.

### Examples

The three-point line `(0, 2, 3)` with its two fixed points of costs `1/2` and `2`; the tie and
empty-cluster examples of the Conventions.

### Dependencies

Mathlib `Finset.centroid`, `Finset.centroid_def`, `Finset.affineCombination_eq_linear_combination`,
`Finset.sum_centroidWeights_eq_one_of_card_ne_zero`, `Fin.find`, `Fin.find_spec`, `Fin.find_min`,
`Function.IsFixedPt`; Tau Ceti `Finset.sum_mul_norm_sub_sq_eq`. No other layer.

## Layer 2: D² seeding

### 2.1 The seeding law

Assume `k ≥ 1` where a cost of centres is taken (an instance `NeZero k`). Define
`centreCost x z = ∑ᵢ minⱼ ‖xᵢ − z_j‖²` for `z : Fin k → E` (a `Finset.inf'` over the nonempty
`Fin k`), and `optCost x` as the infimum of `centreCost x z` over all `z : Fin k → E`. For a tuple
`c : Fin k → Fin n` of chosen indices define `seedSqDist x c j i` as the least squared distance from
`xᵢ` to `x_{c l}` over `l < j` (used for `j ≥ 1`; at `j = 0` the index type is empty and the junk
value `0` is never read), `seedStep x c j` as `1/n` for `j = 0`, as
`seedSqDist x c j (c j) / ∑_m seedSqDist x c j m` for `j ≥ 1` when the denominator is positive, and
as `1/n` when it vanishes, and `seedProb x c = ∏_j seedStep x c j`.

- `seedStep x c j` depends only on `c 0, …, c j`, so `seedProb` is the law of a sequential choice:
  the first index uniform, and index `i` at step `j` with probability `D(xᵢ)² / ∑_m D(x_m)²`, where
  `D` is the distance to the points already chosen (Arthur–Vassilvitskii, §2.2, steps 1a–1c).
- `optCost x` is attained and equals the least within-cluster sum of squares `W(a)` over all
  labellings `a : Fin n → Fin k`: for any `z`, labelling each point by a nearest centre gives a
  pair of cost `centreCost x z ≥ W(a)` by the centroid lemma, and the centroids of an optimal
  labelling (any centre for an empty cluster) give `centreCost ≤ W(a)`.

Prove `seedProb_nonneg_and_sum_eq_one`: for `n ≥ 1`, `seedProb x c ≥ 0` for every `c` and
`∑_c seedProb x c = 1`. (Proved here.) Route: summing over the last index first, each step's
weights sum to `1` (the squared distances divided by their sum, or `n` times `1/n`), and induction
on `k` (for `k = 0` the only tuple has the empty product `1`).

**Checks.**
- For `x = (p, p)` and `k = 2`, all four tuples have probability `1/4`: after the first choice
  every squared distance is `0` and the uniform convention applies. With the junk quotient
  `0 / 0 = 0` instead, all four would have probability `0` and the masses would sum to `0`.
- The hypothesis `n ≥ 1` is needed: for `n = 0` and `k = 1` there is no tuple and the sum is `0`.
- For `x = (0, 2)` in `ℝ` and `k = 1`: the expected cost is `(4 + 4)/2 = 4 = 2 · optCost x`, with
  `optCost x = 2`, the value `2φ_OPT` of Arthur–Vassilvitskii's Lemma 3.1.

*Needs:* Mathlib `Fin.prod_univ_castSucc`, `Finset.sum_div`; 1.1 (the centroid lemma) for the
description of `optCost`.

### 2.2 The Arthur–Vassilvitskii bound

Prove `expected_centreCost_seed_le`: for `k ≥ 1`,
`∑_c seedProb x c · centreCost x (x ∘ c) ≤ 8 (ln k + 2) · optCost x`
(Arthur–Vassilvitskii, Theorem 1.1 = Theorem 3.1, §3, with Lemmas 3.1–3.3). The source treats a
set of points of `ℝ^d`; the statement here allows repeated points, `n < k`, and any real inner
product space, and the route below says where each matters.

Route, following §3 of the source. Fix a labelling `a*` with `W(a*) = optCost x` (2.1), with
clusters `A_1, …, A_k`, some possibly empty, and write `φ_OPT(A) = ∑_{i ∈ A} ‖xᵢ − g_A‖²`. For a
current nonempty tuple of chosen indices write `φ(B)` for the contribution of the points of `B`
to the cost of the chosen centres.

1. (Lemma 3.1.) If the one centre is chosen uniformly from a nonempty `A`, the expected `φ(A)` is
   `2 φ_OPT(A)`: by the centroid lemma, `(1/|A|) ∑_{a₀ ∈ A} ∑_{a ∈ A} ‖a − a₀‖² = 2 φ_OPT(A)`.
2. (Lemma 3.2.) If a centre is added from `A` with probability proportional to `D²` within `A`, the
   expected `φ(A)` is at most `8 φ_OPT(A)`: by the triangle inequality for `D` (a minimum of
   distances, from `dist_triangle`) and `(s + t)² ≤ 2s² + 2t²`, `D(a₀)² ≤ 2D(a)² + 2‖a − a₀‖²`;
   average over `a ∈ A`, substitute into the expectation, bound the two resulting minima by
   `‖a − a₀‖²` and by `D(a)²`, and finish with step 1.
3. (Lemma 3.3.) Let `u ≥ 1` clusters of `a*` contain no chosen index, with union `X_u`, and
   `X_c` the other points. After `t ≤ u` further D² steps the expected cost is at most
   `(φ(X_c) + 8 φ_OPT(X_u)) (1 + H_t) + ((u − t)/u) φ(X_u)`, where `H_t` is the harmonic number.
   The proof is by induction on `(t, u)` from the cases `t = 0` and `t = u = 1`; the inductive step
   splits on whether the next index falls in `X_c` (probability `φ(X_c)/φ`) or in an uncovered
   cluster `A` (probability `φ(A)/φ`, then step 2), uses that adding a centre never increases the
   cost, and uses `∑_A φ(A)² ≥ φ(X_u)²/u` over the `u` uncovered clusters (the power-mean
   inequality, Mathlib's `sq_sum_le_card_mul_sum_sq`). Empty clusters of `a*` take part with
   `φ(A) = φ_OPT(A) = 0` and are never chosen; when the current
   cost `φ` is `0` every further cost is `0` and the uniform convention of 2.1 is harmless.
4. (Theorem 3.1.) The first index falls in `A` with probability `|A|/n`; by step 1 and step 3 with
   `t = u = k − 1` the expected cost is at most `8 optCost x · (1 + H_{k−1})`, and
   `1 + H_{k−1} ≤ 2 + ln k` by Mathlib's `harmonic_le_one_add_log` and `Real.log_le_log` (for
   `k ≥ 2`; for `k = 1` the bound is `2 optCost x` from step 1).

The expectation of each step is a finite sum against the weights `seedStep`, so steps 1–4 are
identities and inequalities between finite sums, obtained by summing over the last index first as
in 2.1.

**Checks.**
- For `x = (0, 2)` and `k = 2` the expected cost is `0`: the second index is the other point with
  probability `1`.
- Exact rational computation of the expected cost against `8 (ln k + 2) optCost x` for every
  `x ∈ {0, 1, 3, 7}^n` (`1 ≤ n ≤ 5`), every `x ∈ {(0,0), (1,0), (0,2), (5,5)}^4` and `k ≤ 3`:
  the masses sum to `1` and the bound holds in all `4860` cases, the largest ratio of the expected
  cost to the bound being about `0.153`; when `optCost x = 0` the expected cost is `0`.

*Needs:* 2.1; 1.1 (the centroid lemma); Mathlib `harmonic`, `harmonic_le_one_add_log`,
`Real.log_le_log`, `sq_sum_le_card_mul_sum_sq`, `dist_triangle`, `Finset.sum_div`.

### Examples

The two-point line `(0, 2)` with `k = 1` (expected cost `2 optCost`) and `k = 2` (expected cost
`0`); the repeated point with the uniform convention.

### Dependencies

1.1 (the centroid lemma); Mathlib `Finset.inf'`, `harmonic`, `harmonic_le_one_add_log`,
`Real.log_le_log`, `sq_sum_le_card_mul_sum_sq`, `dist_triangle`, `Fin.prod_univ_castSucc`,
`Finset.sum_div`.

## Layer 3: dendrograms, ultrametrics and single linkage

### 3.1 Definitions

Define `IsDistance d`, `IsMetricDist d`, `IsUltrametric u` and `IsDendrogram θ` as in the
Conventions; `dendrogramUltra θ x y` as `sInf {r | 0 ≤ r ∧ θ r x y}`; `singleLinkage d r` as
`Relation.EqvGen.setoid` of `d x y ≤ r`; and `singleLinkageUltra d = dendrogramUltra
(singleLinkage d)`.

- For a dendrogram the set in `dendrogramUltra θ x y` is nonempty (by monotonicity it contains
  `max(t, 0)` for a scale `t` where `θ` is `⊤`) and bounded below by `0`, so `sInf` is its least
  element by the right-constancy of `θ`.
  The bound `0 ≤ r` keeps the set bounded below for an arbitrary family `θ`.
- `singleLinkage d r` is `⊥` for `r < 0` when `d ≥ 0`, and is antitone in `d` and monotone in `r`.

**Checks.**
- The ultrametric on `{0, 1, 2, 3}` with `u(0,1) = 1`, `u(2,3) = 2` and `u = 3` on the other pairs
  of distinct points gives the partition `{0,1}, {2}, {3}` at scale `1.5`, `{0,1}, {2,3}` at
  scale `2` and `⊤` at scale `3`; at scale `0.5` it gives `⊥`.
- For the path `0 — 1 — 2` with `d(0,1) = d(1,2) = 1` and `d(0,2) = 2`, single linkage at scale
  `1` is `⊤`: `0` and `2` are joined through `1` although `d(0,2) = 2`.

*Needs:* Mathlib `Relation.EqvGen.setoid`, `Setoid` with its complete lattice.

### 3.2 Dendrograms are ultrametrics

Prove, on any type `X`:

- `isUltrametric_dendrogramUltra`: for a dendrogram `θ`, `dendrogramUltra θ` is an ultrametric,
  and for `r ≥ 0`, `θ r x y` holds exactly when `dendrogramUltra θ x y ≤ r`;
- `isDendrogram_singleLinkage`: for `X` finite and an ultrametric `u`, `singleLinkage u` is a
  dendrogram, and for `r ≥ 0`, `singleLinkage u r x y` holds exactly when `u x y ≤ r`;
- `singleLinkage_dendrogramUltra` and `dendrogramUltra_singleLinkage`: the two constructions are
  inverse to each other, `singleLinkage (dendrogramUltra θ) = θ` for a dendrogram `θ` and
  `dendrogramUltra (singleLinkage u) = u` for an ultrametric `u`

(Carlsson–Mémoli, Theorem 9, p. 1439, with Lemma 10 and §3.3.1–3.3.3, pp. 1439–1442, for finite
`X`; the source checks the round trips in one sentence). Only the second statement uses
finiteness.

Route. For a dendrogram, the least scale `r(x, y)` exists by right-constancy; the block relation
at scale `r ≥ 0` holds exactly when `r(x, y) ≤ r` by monotonicity; the strong triangle inequality
follows by evaluating `θ` at `max(r(x,y), r(y,z))` and using transitivity; `r(x, y) = 0` forces
`θ 0 x y`, so `x = y`. For an ultrametric, `u x y ≤ r` is already an equivalence relation for
`r ≥ 0`, so it equals the relation it generates; for `r < 0` both sides are `⊥`. On a finite set
`u` takes finitely many values, which gives a scale where everything is joined and
right-constancy. The round trips follow from the two descriptions of the blocks.

**Checks.**
- The family `θ` that is `⊥` for `r ≤ 1` and `⊤` for `r > 1` on two points (not a dendrogram)
  gives `dendrogramUltra θ x y = 1` for `x ≠ y`, but `θ 1 x y` fails: right-constancy is what
  makes the block relation a closed ball.
- Finiteness is needed in the second statement: on `ℕ` the function `u x y = max(x, y)` for
  `x ≠ y` (and `0` on the diagonal) is an ultrametric whose single linkage is never `⊤`.
- Exact computation for all ultrametrics with values in `{1, 2, 3}` on one to four points
  (`76` of them): the round trip and the closed-ball description at the nine scales
  `−1, 0, 1/2, 1, 3/2, 2, 5/2, 3, 7/2` hold.

*Needs:* 3.1; Mathlib `Relation.EqvGen`, `csInf_le`, `le_csInf`, `Set.Finite`.

### 3.3 Single linkage is the maximal subdominant ultrametric

Prove `isGreatest_singleLinkageUltra`: for `X` finite and `d ≥ 0` vanishing only on the
diagonal (`d x y = 0` forces `x = y`), `singleLinkageUltra d` is the greatest element of the set
of ultrametrics `u ≤ d`
(Carlsson–Mémoli, Example 7, Lemma 12 and Corollary 14, p. 1442, for finite metric spaces; the
maximality is stated in Example 7 and proved here). Symmetry and the triangle inequality of `d`
are not assumed, and `d x x` may be positive: single linkage does not read the diagonal.

Route. `singleLinkage d` is a dendrogram: at scale `0` only pairs `(x, x)` satisfy `d ≤ 0`, the
scale `max d` joins everything, and `d` takes finitely many values; so `singleLinkageUltra d` is an
ultrametric by 3.2. It is at most `d`, since `x` and `y` are joined at scale `d x y`. If `u ≤ d` is
an ultrametric and `x`, `y` are joined at scale `r`, every step of the chain has `u ≤ d ≤ r` (in
one of its two directions, and `u` is symmetric), so `u x y ≤ r` by the strong triangle
inequality; hence `u ≤ singleLinkageUltra d`.

**Checks.**
- For `d(0,1) = 1`, `d(1,0) = 2` on two points the greatest ultrametric below `d` has value `1`.
- Finiteness is needed: on `{q ∈ ℚ : 0 ≤ q ≤ 1}` with `d(p, q) = |p − q|`, chains with small
  steps join every two points at every positive scale, so the single-linkage function vanishes
  off the diagonal and is not an ultrametric.
- Both conditions on `d` are needed: if `d x y = 0` or `d x y < 0` for some `x ≠ y`, an
  ultrametric `u ≤ d` would have `u x y ≤ 0` with `x ≠ y`, and if `d x x < 0` it would have
  `u x x < 0`; so no ultrametric lies below `d` and the set has no greatest element.
- Exact comparison with every ultrametric with values in `{1, 3/2, 2, 5/2, 3}` below `d`, for
  every `d`, symmetric or not, on at most three points with values in `{1, 2, 3}` off the
  diagonal and `0` or `1` on it (`5871` cases).

*Needs:* 3.1, 3.2.

### 3.4 Characterization of single linkage

Define `IsFunctorialMethod T` for `T : (n : ℕ) → (Fin n → Fin n → ℝ) → Fin n → Fin n → ℝ`, a
hierarchical clustering method on the finite metric spaces `(Fin n, d)`: `T n d` is an
ultrametric for every metric `d`; on the two-point space at distance `δ > 0` the value `T 2 d 0 1`
is `δ`; and for metrics `d_X` on `Fin n`, `d_Y` on `Fin m` and any map `φ` with
`d_Y(φ x, φ x') ≤ d_X(x, x')`, `T m d_Y (φ x) (φ x') ≤ T n d_X x x'`. Prove
`isFunctorialMethod_iff`: `IsFunctorialMethod T` holds exactly when `T n d = singleLinkageUltra d`
for every metric `d` on every `Fin n`.

This is Carlsson–Mémoli's Theorem 18 (p. 1451, proof pp. 1463–1464), which states the uniqueness
under a further condition (III), that `T` never joins two points below the least distance
between distinct points; §3.4.1 (p. 1443) says that the conditions characterize single linkage.
In their proof (III) gives the lower bound of step (B); the route below obtains that bound from
maps onto two-point spaces instead, so the statement carries no such condition. (Proved here for
the lower bound and for the direction that single linkage has the properties; step (A) follows
the source.)

Route. Single linkage is functorial: its values are ultrametrics by 3.3, its value on a
two-point space at distance `δ` is `δ`, and a distance-nonincreasing map sends a chain with steps
at most `r` to such a chain. Conversely let `T` be functorial, `d` a metric on `Fin n`,
`u = T n d` and `u*` the single-linkage ultrametric, and let `x ≠ x'`. (A) `u ≤ u*`: take a chain
from `x` to `x'` with all steps at most `δ = u*(x, x') > 0`; each step is the image of the
two-point space at distance
`δ` under a distance-nonincreasing map, so each step has `u ≤ δ` by the second and third
conditions, and `u(x, x') ≤ δ` by the strong triangle inequality. (B) `u ≥ u*`: let
`0 ≤ r' < u*(x, x')`, let `S` be the block of `x` in `singleLinkage d r'` (it omits `x'`), and let
`δ` be the least distance from `S` to its complement, which exceeds `r'`. The map sending `S` to
`0` and its complement to `1` is distance-nonincreasing onto the two-point space at distance `δ`,
so `u(x, x') ≥ δ > r'` by the second and third conditions; hence `u(x, x') ≥ u*(x, x')`.

**Checks.**
- The ultrametric condition is needed: the identity method `T n d = d` satisfies the other two
  conditions, and on the three-point metric with distances `1, 1, 2` it gives `2` where single
  linkage gives `1`.
- The two-point condition is needed: `T n d = 2 · singleLinkageUltra d` is an ultrametric method
  satisfying the map condition.
- The map condition is needed: the method giving every pair of distinct points the largest
  distance is an ultrametric method with the two-point property, and the inclusion of the
  two-point space at distance `1` into the three-point metric with `d(0,1) = d(0,2) = 1`,
  `d(1,2) = 2` is distance-nonincreasing but sends the value `1` to `2`.
- Exact check of the map condition for single linkage over all metrics with values in
  `{1, 2, 3}` on one to three points and all distance-nonincreasing maps between them (`9238`
  maps).

*Needs:* 3.1, 3.2, 3.3.

### 3.5 Stability of single linkage

Prove `abs_singleLinkageUltra_sub_le`: let `d_X` and `d_Y` vanish on the diagonal, let `R` be a
relation between `X` and `Y` such that every point of `X` is related to some point of `Y` and
every point of `Y` to some point of `X`, and let `|d_X(x, x') − d_Y(y, y')| ≤ η` whenever `R x y`
and `R x' y'`. Then the functions `singleLinkageUltra d_X` and `singleLinkageUltra d_Y` satisfy
the same bound on related pairs (Carlsson–Mémoli, Proposition 26, p. 1457, proof p. 1464, for
finite metric spaces and in Gromov–Hausdorff form). Finiteness, symmetry and a sign of `d_X`,
`d_Y` are not assumed.

Route, following the source's proof. Let `x`, `x'` be joined at a scale `r ≥ 0` by a chain
`x = x₀, …, x_m = x'` whose steps satisfy `d_X ≤ r` in one direction (`m = 0` when `x = x'`).
Choose `y₀ = y`, `y_m = y'` and `yᵢ` related to `xᵢ` in between; every step of the new chain is at
most `r + η` in the matching direction, and when `m = 0` the points `y`, `y'` are both related to
`x`, so `d_Y(y, y') ≤ d_X(x, x) + η = η`. So `y`, `y'` are joined at scale `r + η`, and
`η ≥ |d_X(x, x) − d_Y(y, y)| = 0`. Any two points `x`, `x'` are joined at the scale
`max(d_X(x, x'), 0)`, and likewise in `Y`, so no infimum here is over an empty set. Taking the
infimum over `r`, `singleLinkageUltra d_Y y y' ≤ singleLinkageUltra d_X x x' + η`; exchange the
roles of `X` and `Y`. (The source's proof writes the step bound with `η` where its normalisation
of the distortion requires `2η`; the conclusion is unaffected.)

**Checks.**
- Totality is needed: for `X = {0, 1, 2}` with `d(0,1) = 10`, `d(0,2) = d(1,2) = 1`, `Y = {0, 1}`
  with `d(0,1) = 10`, and `R = {(0,0), (1,1)}`, related pairs have the same distances, but the
  single-linkage values are `1` and `10`.
- The diagonal condition is needed on each side: for `X` a point `p` with `d_X(p, p) = 50`,
  `Y = {0, 1}` with `d_Y(0, 1) = d_Y(1, 0) = 100`, `d_Y` zero on the diagonal, and `R` everything,
  the least admissible `η` is `50`, but the single-linkage values at `(p, p)` and `(0, 1)` are `0`
  and `100`; exchanging `X` and `Y` gives the other side.
- Exact check over all relations total in both directions between `X` of one to three points,
  with `d_X` zero on the diagonal, not necessarily symmetric, with values in `{−1, 0, 2}`, and `Y`
  of one to three points with `d_Y` symmetric, zero on the diagonal, with values in `{0, 1, 3}`,
  for `|X| · |Y| ≤ 6` and `η` the largest difference on related pairs (`61708` triples,
  `1058233` related pairs).

*Needs:* 3.1, 3.2; Mathlib `Relation.EqvGen`, `le_csInf`, `csInf_le`.

### Examples

The three-point path with distances `1, 1, 2`, whose single-linkage ultrametric is constant `1`;
the four-point ultrametric of the Check of 3.1 and its dendrogram.

### Dependencies

Mathlib `Relation.EqvGen.setoid`, `Relation.EqvGen`, `Setoid` with its complete lattice,
`IsGreatest`, `csInf_le`, `le_csInf`, `Set.Finite`. No other layer.

## Layer 4: Kleinberg's axioms

### 4.1 Clustering functions and the three properties

A clustering function on `n` points is any `F : (Fin n → Fin n → ℝ) → Setoid (Fin n)`; only its
values on distance functions (3.1) enter. Define `ScaleInvariant F` (`F (α d) = F d` for every
distance function `d` and `α > 0`), `Rich F` (every partition is `F d` for some distance function
`d`), `IsTransformation Γ d d'` (`d' ≤ d` within the blocks of `Γ` and `d' ≥ d` across them),
`Consistent F` (for distance functions `d`, `d'` with `d'` an `F d`-transformation of `d`,
`F d' = F d`) and `clusterRange F`, the image of the set of distance functions (Kleinberg, §2).

**Checks.**
- The constant function `F d = ⊥` is scale-invariant and consistent, and its range `{⊥}` is an
  antichain; it is not rich for `n ≥ 2`.
- For `n = 1` every clustering function is scale-invariant, rich and consistent: there is one
  partition. So the bound `n ≥ 2` of 4.2 is needed.

*Needs:* 3.1.

### 4.2 The impossibility theorem

Prove `isAntichain_clusterRange`: the range of a scale-invariant consistent clustering function
is an antichain for refinement (Kleinberg, Theorem 3.1). Prove
`not_scaleInvariant_rich_consistent`: for `n ≥ 2` no clustering function is scale-invariant, rich
and consistent (Kleinberg, Theorem 2.1; Shalev-Shwartz–Ben-David, Theorem 22.4, p. 319, with a
short direct proof on a set of at least three points).

Route (Kleinberg's). By consistency every `Γ` in the range has a forcing pair `a < b`: every
distance function at most `a` within the blocks and at least `b` across them is sent to `Γ`. If
`Γ₀ < Γ₁` both lie in the range, a distance function that is very small within the blocks of
`Γ₀`, between `a₂` and `a₁` within the blocks of `Γ₁` only, and at least `b₁` across `Γ₁` is sent
to `Γ₁`; a rescaling makes it conform to the forcing pair of `Γ₀`, and scale-invariance gives a
contradiction. For `n ≥ 2`, `⊥ < ⊤`, so the set of all partitions is not an antichain.

**Checks.**
- For `n = 2` both partitions `⊥` and `⊤` lie in the range of a rich function, and `⊥ < ⊤`.

*Needs:* 4.1.

### 4.3 Antichains are ranges

Prove `exists_clusterRange_eq`: every nonempty antichain `A` of partitions of `Fin n` is the
range of a scale-invariant consistent clustering function (Kleinberg, Theorem 3.2). The source
says "every antichain"; the empty set is not a range, since distance functions exist.

Route (Kleinberg's). Send `d` to a partition `Γ ∈ A` minimizing the sum of `d i j` over the pairs
`i < j` in one block of `Γ`, ties broken by a fixed linear order on the finite set of partitions.
Scaling multiplies every sum by `α`. A distance function below `n⁻³` within the blocks of `Γ` and
at least `1` across them has sum below `1` exactly at refinements of `Γ`, so it is sent to `Γ`
since `A` is an antichain. For a `Γ`-transformation `d'` of `d` with `F d = Γ`, the decrease of the
sum from `d` to `d'` is largest at `Γ`, so `Γ` still minimizes, with the same tie order.

**Checks.**
- For `n = 4` and `A` the seven partitions into two blocks, exact enumeration of the distance
  functions with values in `{1, 2, 3}` confirms consistency, and their images are all of `A`.

*Needs:* 4.1; Mathlib `Finset.exists_min_image`, a linear order on `Setoid (Fin n)` from
`Fintype.equivFin`.

### 4.4 Single linkage satisfies two of the three

Prove `rich_consistent_singleLinkage`: for `r > 0`, `d ↦ singleLinkage d r` is rich and
consistent (Kleinberg, Theorem 2.2(c), for `n ≥ 2`; the statement holds for every `n`). Prove
`scaleInvariant_rich_singleLinkage`: for `n ≥ 3` and `0 < α < 1`,
`d ↦ singleLinkage d (α · maxᵢⱼ d i j)` is scale-invariant and rich (Kleinberg, Theorem 2.2(b)).
The source states these without proof. (Proved here.)

Route. Distance `r`: for richness use `r/2` within the blocks of `Γ` and `2r` across them;
consistency holds because the blocks of `singleLinkage d r` are joined by steps inside them,
which a transformation does not lengthen, and points in different blocks are at distance more
than `r`, which a transformation does not shorten. Scale `α`: the threshold scales with `d`. For
richness of `Γ ≠ ⊤` use `ε ≤ α` within blocks and `1` across them (the maximum is `1`); for
`Γ = ⊤` use distance `ε ≤ α` between consecutive points of `0, 1, …, n − 1` and `1` between all
other pairs, so that the maximum is `1` and the threshold joins the path; such other pairs exist
exactly when `n ≥ 3`.

**Checks.**
- `r > 0` is needed: at `r = 0` every distance function gives `⊥`.
- For `n = 2` and `α = 1/2` every distance function gives `⊥` (the only distance is the maximum),
  so `n ≥ 3` is needed; for `α = 1` every distance function gives `⊤`, and for `α ≤ 0` every one
  gives `⊥`.
- Exact enumeration for `n = 3` with values in `{1, 2, 3, 4}`: distance `2` single linkage is
  consistent and reaches all five partitions, and scale `1/2` single linkage reaches all five.

*Needs:* 4.1; 3.1 (`singleLinkage`).

### Examples

The three-point space with the five partitions reached by both single-linkage rules; the
two-block antichain on four points.

### Dependencies

3.1 (`IsDistance`, `singleLinkage`); Mathlib `Setoid`, `IsAntichain`, `Finset.exists_min_image`,
`Fintype.equivFin`.

## Scope and ownership

This roadmap owns the definitions and theorems stated above: the k-means cost of a pair, the tie
and empty-cluster conventions, Lloyd's map with its monotonicity, its fixed points and the fixed
point its iterates reach; the D² seeding law and the Arthur–Vassilvitskii bound; dendrograms
and their correspondence with ultrametrics, single linkage as the maximal subdominant
ultrametric, its characterization and its stability in correspondence form; Kleinberg's axioms
with his impossibility theorem, the antichain theorem and its converse, and the two
single-linkage rules.

Already in the libraries and therefore not targets: centroids of finite families
(`Finset.centroid`, Mathlib) and the weighted variance decomposition from which the centroid
lemma follows (`Finset.sum_mul_norm_sub_sq_eq`, Tau Ceti); harmonic numbers and
`H_n ≤ 1 + ln n`; partitions as `Setoid` with refinement. Mathlib's `IsUltrametricDist` is a
class on a type with one fixed distance and is not the predicate `IsUltrametric` on functions
used above.

Left to other roadmaps:

- StatisticalLearningTheory 5.4 defines the population k-means risk `kMeansRisk μ C` of a finite
  set of centres, valued in `ℝ≥0∞`, and states Pollard's consistency of empirical k-means. For a
  measurable structure on `E` in which points are measurable (the Borel one, for instance), at
  the measure `∑ᵢ δ_{xᵢ}` and a nonempty `C` it is `ENNReal.ofReal (centreCost x z)` for any
  `z : Fin k → E` whose set of values is `C`; this roadmap keeps the real form on tuples, because
  D² seeding chooses tuples with repetitions, and it states nothing about measures or
  consistency.
- TopologicalDataAnalysis 4.5 counts the single-linkage clusters at a scale through Rips
  complexes and minimum spanning trees, and its 5.4 defines correspondences and their
  distortion and proves that Mathlib's Gromov–Hausdorff distance is half the infimum of the
  distortions. 3.5 above is stated with an explicit relation and depends on neither;
  Carlsson–Mémoli's Gromov–Hausdorff form of it is not stated here.
- SpanningTreesAndShortestPaths 2.4 proves the minimax property of minimum spanning forests,
  which TopologicalDataAnalysis 4.5 uses; this roadmap works with chains directly, and no
  spanning tree enters it.
- KernelsAndSpectralMethods 2.2 treats the normalized cut and the spectral relaxation of
  clustering, and its 5.1 classical multidimensional scaling.

Outside the scope: Gaussian mixture models, their identifiability and the EM algorithm for them
(the monotonicity of EM is MathematicalStatisticsSemiparametric 7.2); the lower bound `2 ln k` for
D² seeding (Arthur–Vassilvitskii, Theorem 4.1) and seeding with other powers of `D`; the
computational complexity of k-means; complete and average linkage; Kleinberg's k-cluster
stopping rule (its range, the partitions into `k` blocks, is an antichain covered by 4.3); the
convergence of single linkage for samples of a measure (Carlsson–Mémoli, §5.3).

## Exact supplier contracts

### From Mathlib

- `Mathlib/LinearAlgebra/AffineSpace/Centroid.lean`: `Finset.centroid ℝ s p` (the affine
  combination of `p` over `s` with weights `1/|s|`; intended for nonempty `s`),
  `Finset.centroid_def` (it is `s.affineCombination ℝ p (s.centroidWeights ℝ)`) and
  `Finset.sum_centroidWeights_eq_one_of_card_ne_zero` (the weights sum to `1` when `s` is
  nonempty). `Mathlib/LinearAlgebra/AffineSpace/Combination.lean`:
  `Finset.affineCombination_eq_linear_combination` (in a module, an affine combination with
  weights summing to `1` is the linear combination `∑ wᵢ • pᵢ`).
- `Mathlib/Data/Fin/Tuple/Basic.lean`: `Fin.find p h` (the least index satisfying `p`, given that
  one exists), `Fin.find_spec`, `Fin.find_min`.
- `Mathlib/NumberTheory/Harmonic/Defs.lean` and `Bounds.lean`: `harmonic` and
  `harmonic_le_one_add_log` (`H_n ≤ 1 + ln n` for every `n`).
  `Mathlib/Analysis/SpecialFunctions/Log/Basic.lean`: `Real.log_le_log` (the logarithm is
  monotone on positive reals).
- `Mathlib/Algebra/Order/Chebyshev.lean`: `sq_sum_le_card_mul_sum_sq`
  (`(∑_{i ∈ s} fᵢ)² ≤ |s| ∑_{i ∈ s} fᵢ²`, the power-mean step of 2.2).
  `Mathlib/Topology/MetricSpace/Pseudo/Defs.lean`: `dist_triangle`.
- `Mathlib/Algebra/BigOperators/Fin.lean`: `Fin.prod_univ_castSucc` (splitting off the last
  factor of a product over `Fin (k + 1)`); `Finset.sum_div`; `Finset.inf'`;
  `Finset.exists_min_image`; `Fintype.equivFin`.
- `Mathlib/Logic/Relation.lean`: `Relation.EqvGen` and `Relation.EqvGen.setoid` (the equivalence
  relation generated by a relation). `Mathlib/Order/Setoid/Basic.lean` and
  `Mathlib/Data/Setoid/Basic.lean`: the complete lattice of `Setoid X`, `Setoid.le_def`
  (`r ≤ s` iff `r x y` implies `s x y`).
- `Mathlib/Order/ConditionallyCompleteLattice/Basic.lean`: `csInf_le`, `le_csInf`.
  `Mathlib/Order/Antichain.lean`: `IsAntichain`. `Mathlib/Order/Bounds/Defs.lean`: `IsGreatest`.
  `Mathlib/Logic/Function/Defs.lean`: `Function.IsFixedPt`.
  `Mathlib/Data/Set/Finite/Basic.lean`: `Set.Finite`.

### From Tau Ceti

- `TauCeti/Analysis/InnerProductSpace/CompleteSquare.lean`: `Finset.sum_mul_norm_sub_sq_eq` (in a
  real inner product space, for weights `wᵢ` summing to `1` over `s` and every `y`,
  `∑_{i ∈ s} wᵢ ‖y − xᵢ‖² = ‖y − m‖² + ∑_{i ∈ s} wᵢ ‖m − xᵢ‖²` with `m = ∑_{i ∈ s} wᵢ • xᵢ`), the
  centroid lemma of 1.1.

## References

- David Arthur and Sergei Vassilvitskii, *k-means++: the advantages of careful seeding*,
  Proceedings of the ACM–SIAM Symposium on Discrete Algorithms (SODA), 2007; the copy on
  Vassilvitskii's page at Stanford. §1, Lemma 2.1 and §2.1–2.2; Theorem 1.1; §3 with
  Lemmas 3.1, 3.2, 3.3 and Theorem 3.1; Theorem 4.1.
- Gunnar Carlsson and Facundo Mémoli, *Characterization, stability and convergence of
  hierarchical clustering methods*, Journal of Machine Learning Research 11 (2010), 1425–1470,
  open on the journal's site. Theorem 9 (p. 1439), Lemma 10 (p. 1440), §3.3 (pp. 1439–1442),
  Example 7, Lemma 12 and Corollary 14 (p. 1442), §3.4.1 (p. 1443), Theorem 18 (p. 1451) with its
  proof (pp. 1463–1464), Proposition 26 (p. 1457) with its proof (p. 1464).
- Jon Kleinberg, *An impossibility theorem for clustering*, Advances in Neural Information
  Processing Systems (NIPS 2002); the copy on Kleinberg's page at Cornell. §2 with Theorems 2.1
  and 2.2; §3 with Theorems 3.1 and 3.2.
- Shai Shalev-Shwartz and Shai Ben-David, *Understanding Machine Learning: From Theory to
  Algorithms*, Cambridge University Press, 2014; the authors' PDF. §22.2.1 and Lemma 22.1
  (p. 313), Theorem 22.4 (p. 319), and §22.7 (p. 320), which names the iteration after Stuart
  Lloyd and dates it 1957.
