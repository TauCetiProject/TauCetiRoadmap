# Roadmap: Bernoulli bond percolation

**Summary.** This roadmap develops the first theorems of Bernoulli bond percolation on the
hypercubic lattice `ℤ^d`. Each edge between two points at distance one is open with probability
`p ∈ [0, 1]`, independently of the others; the open cluster of a point is the set of points it
reaches along open edges, `θ(p)` is the probability that the open cluster of the origin is
infinite, and the critical probability `p_c(d)` is the supremum of the `p` with `θ(p) = 0`. A
configuration is the graph of its open edges, and its law is the image of Mathlib's Bernoulli
random set of edges. No dimension is excluded: `d = 0` (one point, no edge) and `d = 1` (the
integer line) are cases of every statement whose hypotheses they meet.

The headline theorems are these.

- *Harris's inequality.* Let `u` be a subset of a countable set and let a random subset of `u`
  contain each element of `u` with probability `p`, independently. Any two measurable families of
  sets that are closed under enlarging a set are positively correlated: the probability of both is
  at least the product of the probabilities.
- *Monotonicity and the zero–one law.* `θ` is nondecreasing in `p`. For every `d` and `p`, the
  probability that some open cluster is infinite is `0` or `1`, and it is `1` exactly when
  `θ(p) > 0`.
- *The phase transition.* For every `d`, `1 / (2d − 1) ≤ p_c(d)`; on `ℤ²`, `θ(p) > 0` for every
  `p > 2/3`; and `p_c(d) ≤ 2/3` for every `d ≥ 2`. In particular `1/3 ≤ p_c(2) ≤ 2/3`.

The roadmap rests on Mathlib's product measures on infinite products and its Bernoulli random
subsets of a set, from which the percolation measure is built; on Mathlib's
Fortuin–Kasteleyn–Ginibre inequality for finite distributive lattices, which gives Harris's
inequality on finitely many edges; on Mathlib's martingale convergence theorem, which passes to
all events; and on Mathlib's Kolmogorov zero–one law. DimerModelsAndLozengeTilings develops tail
σ-algebras and the ergodicity of Bernoulli product measures under group actions; the zero–one law
here applies Kolmogorov's law to a single tail event and uses nothing from that roadmap.

## How to read the build

Layer 1 below defines the lattice, the percolation measure, `θ` and `p_c`, and proves that the
events in question are measurable and that `θ` does not depend on the base point. Layer 2 builds
the monotone coupling and deduces that `θ` is nondecreasing; it uses Layer 1. Layer 3, Harris's
inequality, depends on no other layer. Layer 4, the zero–one law, uses Layer 1. Layer 5 counts
self-avoiding walks and proves the lower bound on `p_c`; it uses Layer 1. Layer 6 introduces
planar duality on `ℤ²`, proves `θ(p) > 0` for `p > 2/3` by Peierls's argument and compares
dimensions; it uses Layers 1, 3 and 5. Within a layer the sections are in build order.

## Conventions

- **The lattice.** `ℤ^d` is `Fin d → ℤ`, and `latticeGraph d` joins `x` and `y` when
  `∑ i, |x i − y i| = 1`. Its edges are the elements of `(latticeGraph d).edgeSet`, a set of
  unordered pairs `Sym2 (Fin d → ℤ)`. The origin is `0`; `eᵢ` is the `i`-th unit vector
  `Pi.single i 1`.
- **Parameters.** `p` ranges over Mathlib's `unitInterval`, written `I`, the reals in `[0, 1]`.
  Inequalities between `p` and real numbers are between `(p : ℝ)` and those numbers.
- **Random sets.** For a set `u` in a type `ι`, Mathlib's `setBer(u, p)` is the law of a random
  subset of `ι` that contains each `i ∈ u` with probability `p`, independently, and no element
  outside `u`. It lives on `Set ι` with Mathlib's σ-algebra `Set.instMeasurableSpace`, generated
  by the events `i ∈ s`.
- **Configurations.** A configuration on `ℤ^d` is the graph of its open edges, an element of
  `SimpleGraph (Fin d → ℤ)` with Mathlib's σ-algebra `SimpleGraph.instMeasurableSpace`, generated
  by the events "`x` and `y` are adjacent". The percolation measure is the image of
  `setBer((latticeGraph d).edgeSet, p)` under `SimpleGraph.fromEdgeSet`.
- **Order and increasing events.** Graphs are ordered by inclusion of their edges (`G ≤ H`), and
  sets by inclusion. An increasing event is an upper set for this order (Mathlib `IsUpperSet`):
  if it contains a configuration, it contains every configuration with more open edges.
- **Clusters.** The open cluster of `x` in a configuration `G` is
  `(G.connectedComponentMk x).supp`, the set of vertices joined to `x` by a walk in `G`.
- **Probabilities.** Measures take values in `ℝ≥0∞`; `θ(p)` is the real number
  `(bondPercolation d p).real E` for the event `E` that the cluster of `0` is infinite.
- **Planar duality.** On `ℤ²`, a point `u` also names the dual vertex `u + (1/2, 1/2)` of the
  plane. Coordinates of points of `ℤ²` are written `(a, b)`, which is `![a, b]` in Lean.

## Layer 1: the lattice, bond percolation and open clusters

### 1.1 The lattice

Define `latticeGraph d` as above. The point `x` has the `2d` neighbours `x ± eᵢ`.

**Checks.**
- In `ℤ²` the neighbours of `(0, 0)` are `(1, 0)`, `(−1, 0)`, `(0, 1)` and `(0, −1)`; the point
  `(1, 1)` is not one. A definition by the maximum distance (the king's graph) would give `(0, 0)`
  eight neighbours, `(1, 1)` among them.
- For `d = 1` the graph joins consecutive integers. For `d = 0` the type `Fin 0 → ℤ` has one
  point and the graph has no edge.

*Needs:* Mathlib `SimpleGraph.fromRel`. (Proved here.)

### 1.2 Bernoulli bond percolation

Define `bondPercolation d p` as the image of `setBer((latticeGraph d).edgeSet, p)` under
`SimpleGraph.fromEdgeSet`.

- It is a probability measure, and almost every configuration is a subgraph of `latticeGraph d`.
- For distinct edges `f₁, …, f_k` of the lattice, the probability that all are open is `p ^ k`
  and the probability that all are closed is `(1 − p) ^ k`.

**Checks.**
- The edge from `(0, 0)` to `(1, 0)` is open with probability `p`: at `p = 1/3` the value is
  `1/3`, where a convention exchanging the roles of open and closed would give `2/3`.
- At `p = 0` the measure is the point mass at the graph with no edge, and at `p = 1` the point
  mass at `latticeGraph d` (Mathlib `ProbabilityTheory.setBernoulli_zero`,
  `ProbabilityTheory.setBernoulli_one`).
- The pair `{(0, 0), (1, 1)}` is an edge with probability `0`, whatever `p`.
- The edges from `(0, 0)` to `(1, 0)` and from `(0, 0)` to `(0, 1)` are both open with
  probability `p²`, which is `1/4` at `p = 1/2`.

*Needs:* 1.1; Mathlib `ProbabilityTheory.setBernoulli`, `ProbabilityTheory.setBernoulli_eq_map`,
`ProbabilityTheory.setBernoulli_ae_subset`, `MeasureTheory.Measure.infinitePi_pi`,
`ProbabilityTheory.bernoulliMeasure`, `SimpleGraph.fromEdgeSet`,
`SimpleGraph.measurable_fromEdgeSet`. (Proved here.)

### 1.3 The percolation probability and the critical probability

Define `percolationProb d p`, the number `θ(p)`, as the probability that the open cluster of `0` is
infinite, and `criticalProb d`, the number `p_c(d)`, as the supremum of the reals `(p : ℝ)` over
the `p : I` with `θ(p) = 0` (Grimmett, display (3.1), p. 40).

- `θ(0) = 0`, so the set whose supremum is taken contains `0`; it lies in `[0, 1]`, so
  `0 ≤ p_c(d) ≤ 1`.

**Checks.**
- At `p = 0` the cluster of `0` is `{0}`, so `θ(0) = 0`. For `d ≥ 1`, at `p = 1` the cluster is all
  of `ℤ^d`, so `θ(1) = 1`.
- For `d = 0` every cluster is a single point, `θ` vanishes identically and `p_c(0) = 1`. The
  variant "infimum of the `p` with `θ(p) > 0`" takes the infimum of the empty set here, which is
  `0` for Mathlib's `sInf` on `ℝ`, while the supremum taken above is `1`.

*Needs:* 1.2; Mathlib `SimpleGraph.ConnectedComponent.supp`, `MeasureTheory.Measure.real`,
`ProbabilityTheory.setBernoulli_zero`. (Proved here.)

### 1.4 Measurability of the cluster events

Prove `measurableSet_supp_infinite`: for a countable vertex type `V` and a vertex `x`, the events
"the connected component of `x` is infinite" and "some connected component is infinite" are
measurable subsets of `SimpleGraph V`.

Route: `x` and `y` are joined exactly when, for some finite list of vertices from `x` to `y`, all
consecutive pairs are adjacent; there are countably many lists, so this event is measurable. The
component of `x` is infinite exactly when, for every finite set `F` of vertices (countably many),
some `y ∉ F` is joined to `x`. The second event is the union over the countably many `x`
(Duminil-Copin, the two displays on p. 2).

**Checks.**
- For a finite `V` both events are empty.
- Countability is used: for an uncountable `V` every measurable set of graphs is determined by the
  adjacency of countably many pairs, and the event that the component of `x` is infinite is not.

*Needs:* Mathlib `SimpleGraph.instMeasurableSpace`, `SimpleGraph.measurable_iff_adj`,
`SimpleGraph.ConnectedComponent.supp`. (Proved here.)

### 1.5 Translation invariance

Prove `bondPercolation_real_supp_infinite_eq`: for every `x ∈ ℤ^d`, the probability that the open
cluster of `x` is infinite equals `θ(p)`.

Route: translation by `x` is an automorphism of `latticeGraph d`; it permutes the edges, and
`setBer` of the edge set is invariant under a permutation of `Sym2 (Fin d → ℤ)` that maps the
edge set onto itself, since it is the image of a product measure whose factor at a pair depends
only on whether the pair is an edge (Mathlib
`MeasureTheory.Measure.infinitePi_map_piCongrLeft`). The translated configuration has the
translated clusters.

**Checks.**
- The events for `x = (1, 0)` and for `0` differ: the configuration whose only edges are those of
  the half-line from `(1, 0)` to the right lies in the first and not in the second. Only their
  probabilities agree.

*Needs:* 1.2, 1.3, 1.4; Mathlib `MeasureTheory.Measure.infinitePi_map_piCongrLeft`,
`ProbabilityTheory.setBernoulli_eq_map`. (Proved here.)

### Examples

The lattice on `ℤ` and on `ℤ²`; the measures at `p = 0` and `p = 1`; the cluster of the origin
in the configuration with no open edge and in the full lattice.

### Dependencies

Mathlib `SimpleGraph.fromRel`, `SimpleGraph.fromEdgeSet`, `SimpleGraph.measurable_fromEdgeSet`,
`SimpleGraph.instMeasurableSpace`, `SimpleGraph.measurable_iff_adj`,
`SimpleGraph.ConnectedComponent.supp`, `ProbabilityTheory.setBernoulli`,
`ProbabilityTheory.setBernoulli_eq_map`, `ProbabilityTheory.setBernoulli_ae_subset`,
`ProbabilityTheory.bernoulliMeasure`, `MeasureTheory.Measure.infinitePi_pi`,
`MeasureTheory.Measure.infinitePi_map_piCongrLeft`, `MeasureTheory.Measure.real`,
`ProbabilityTheory.setBernoulli_zero`. No other layer.

## Layer 2: the monotone coupling

### 2.1 Coupling through uniform variables

Prove `map_infinitePi_volume_eq_setBernoulli`: for any type `ι`, any `u : Set ι` and any `p`, the
image of the product of uniform laws on `[0, 1]` (Mathlib's `volume` on `I`) under
`U ↦ {i | i ∈ u ∧ U i < p}` is `setBer(u, p)` (Grimmett, Section 3.4, p. 53; Duminil-Copin,
Proposition 2.1, p. 5, with `≤` in place of `<`, which changes nothing up to null sets). Since
`{i | i ∈ u ∧ U i < p} ⊆ {i | i ∈ u ∧ U i < q}` for `p ≤ q`, the measures `setBer(u, p)` for all
`p` are coupled monotonically.

Route: Mathlib `MeasureTheory.Measure.infinitePi_map_pi` reduces the claim to one coordinate. For
`i ∈ u` the image of the uniform law under `U ↦ (U < p)` gives the value true mass `p`
(Mathlib `unitInterval.volume_apply`); for `i ∉ u` the image is the point mass at false, which is
`Ber(False, False, p)` (Mathlib `ProbabilityTheory.bernoulliMeasure_self_eq_dirac`). Mathlib
`ProbabilityTheory.setBernoulli_eq_map` identifies the result.

**Checks.**
- One coordinate: the uniform law gives `[0, p)` mass `p`; at `p = 1/3` this is `1/3`.
- At `p = 0` the random set is always empty, matching `setBer(u, 0) = dirac ∅`.
- An element outside `u` never belongs to the random set, whatever `U`.

*Needs:* Mathlib `MeasureTheory.Measure.infinitePi_map_pi`, `unitInterval.volume_apply`,
`ProbabilityTheory.bernoulliMeasure_self_eq_dirac`, `ProbabilityTheory.setBernoulli_eq_map`.
(Proved here.)

### 2.2 Increasing events are monotone in the parameter

Prove `setBernoulli_le_of_isUpperSet`: if `S` is a measurable upper set of `Set ι` and `p ≤ q`,
then `setBer(u, p) S ≤ setBer(u, q) S` (Grimmett, Theorem 3.27, p. 53; Duminil-Copin,
Corollary 2.2, p. 5).

Route: by 2.1 both sides are probabilities of the coupled sets; the set for `p` is contained in
the set for `q`, and `S` is an upper set, so the first event is contained in the second.

**Checks.**
- For `S = {s | i₀ ∈ s}` with `i₀ ∈ u` the value is `p`.
- The upper-set hypothesis is needed: `S = {s | i₀ ∉ s}` with `i₀ ∈ u` has probability `1 − p`,
  which decreases.
- For `i₀ ∉ u` the event `{s | i₀ ∈ s}` has probability `0` for every `p`.
- Exhaustively, for `ι = u` with three elements, each of the 20 upper sets of `Set ι` has a
  probability nondecreasing along `p = 0, 1/10, …, 1`.

*Needs:* 2.1; Mathlib `IsUpperSet`. (Proved here.)

### 2.3 Monotonicity of θ and the two phases

Prove `percolationProb_mono`: `θ` is nondecreasing on `I`. Prove `percolationProb_phases`: if
`(p : ℝ) < p_c(d)` then `θ(p) = 0`, and if `p_c(d) < (p : ℝ)` then `θ(p) > 0` (Grimmett, p. 40,
the display after (3.1); Duminil-Copin, p. 5, the remark after Corollary 2.2).

Route: the event that the cluster of `0` is infinite is an upper set of graphs
(Mathlib `SimpleGraph.Reachable.mono`), and `SimpleGraph.fromEdgeSet` is monotone
(`SimpleGraph.fromEdgeSet_mono`), so its preimage in `Set (Sym2 (Fin d → ℤ))` is a measurable upper
set (1.4) and 2.2 applies. For the phases: if `p < p_c(d)`, some `q` with `θ(q) = 0` exceeds `p`
(Mathlib `exists_lt_of_lt_csSup`) and monotonicity gives `θ(p) = 0`; if `p > p_c(d)`, then `p`
is not in the set, which is bounded above by `1` (Mathlib `le_csSup`), so `θ(p) ≠ 0`.

**Checks.**
- For `d = 1`, `θ` is `0` on `[0, 1)` and `1` at `1`: nondecreasing and not continuous.
- At `p = p_c(d)` nothing is claimed: for `d = 1`, `θ(p_c(1)) = θ(1) = 1 > 0`, while for `d = 0`,
  `θ(p_c(0)) = θ(1) = 0`.

*Needs:* 1.3, 1.4, 2.2; Mathlib `SimpleGraph.Reachable.mono`, `SimpleGraph.fromEdgeSet_mono`,
`le_csSup`, `exists_lt_of_lt_csSup`. (Proved here.)

### Examples

The coupled random sets for `p = 1/3` and `p = 2/3` from one family of uniform variables; the
events "a given element belongs" and "a given element does not belong".

### Dependencies

Layer 1 (1.3, 1.4). Mathlib `MeasureTheory.Measure.infinitePi_map_pi`,
`unitInterval.volume_apply`, `ProbabilityTheory.bernoulliMeasure_self_eq_dirac`,
`ProbabilityTheory.setBernoulli_eq_map`, `IsUpperSet`, `SimpleGraph.Reachable.mono`,
`SimpleGraph.fromEdgeSet_mono`, `le_csSup`, `exists_lt_of_lt_csSup`.

## Layer 3: Harris's inequality

### 3.1 Harris's inequality for Bernoulli random sets

Prove `setBernoulli_mul_le_of_isUpperSet`: let `ι` be countable, `u : Set ι` and `p : I`. If `S`
and `T` are measurable upper sets of `Set ι`, then

    setBer(u, p) S * setBer(u, p) T ≤ setBer(u, p) (S ∩ T).

This is Harris's inequality, the case of product measure in the FKG inequality (Duminil-Copin,
Proposition 2.3, p. 6, stated there for the edges of `ℤ^d`; its proof uses only an enumeration of
the index set; Grimmett, Exercise 4.2, p. 83, for finitely many coordinates). The statement is made
for a countable `ι`, the setting of the sources and of every use in Layer 6.

Route. *Finitely many coordinates.* Fix a finite set `F ⊆ ι` and functions `f`, `g` on `Set F` that
are nonnegative and nondecreasing for inclusion. The product weights
`μ(s) = p ^ |s ∩ u| (1 − p) ^ |(F ∩ u) \ s|` (and `0` if `s` meets `F \ u`) satisfy
`μ(s) μ(t) = μ(s ∩ t) μ(s ∪ t)`, and Mathlib's `fkg`, on the finite distributive lattice `Set F`,
gives `E[f] E[g] ≤ E[f g]`. *All events.* Enumerate `ι` and let `𝓕ₙ` be generated by the events
`iₖ ∈ s` for `k < n`. The conditional expectations of the indicators of `S` and `T` given `𝓕ₙ`
are, by the independence of the coordinates, averages over the remaining coordinates, hence
nonnegative nondecreasing functions of the first `n` coordinates, and the finite case applies to
them. By Mathlib `MeasureTheory.Integrable.tendsto_eLpNorm_condExp` they converge in `L¹` to the
indicators, and since all functions lie in `[0, 1]` their products converge in `L¹` too.

**Checks.**
- `ι = u = {a, b}`, `p = 1/2`, `S` = "the set meets `{a, b}`", `T` = "`a` belongs": the left side
  is `3/4 · 1/2 = 3/8` and the right side is `P(T) = 1/2`.
- Equality for events on disjoint coordinates: `S` = "`a` belongs", `T` = "`b` belongs" give
  `1/4 = 1/4`.
- An increasing and a decreasing event are not positively correlated: `S` = "`a` belongs" and
  `T` = "`a` does not belong" give `1/4` on the left and `0` on the right.
- At `p ∈ {0, 1}` the measure is a point mass and both sides are `0` or `1` and equal.
- Exhaustively, for `ι = u` with three elements, all 400 ordered pairs of the 20 upper sets and
  `p ∈ {0, 1/3, 1/2, 2/3, 1}` satisfy the inequality; so do the cases `u` with two elements and
  `u = ∅` inside the same `ι`.
- The lattice identity of the route holds with equality for every pair of subsets of a
  three-element `F` at the same values of `p`.

*Needs:* Mathlib `fkg`, `ProbabilityTheory.setBernoulli_eq_map`,
`ProbabilityTheory.setBernoulli_singleton`, `ProbabilityTheory.iIndepFun_infinitePi`,
`MeasureTheory.Integrable.tendsto_eLpNorm_condExp`, `IsUpperSet`. (Proved here, except as cited.)

### Examples

The random subset of a two-element set at `p = 1/2` with the events "meets the set", "contains
`a`", "contains `b`" and "does not contain `a`".

### Dependencies

Mathlib `fkg`, `ProbabilityTheory.setBernoulli_eq_map`, `ProbabilityTheory.setBernoulli_singleton`,
`ProbabilityTheory.iIndepFun_infinitePi`, `MeasureTheory.Integrable.tendsto_eLpNorm_condExp`,
`IsUpperSet`. No other layer.

## Layer 4: the zero–one law for an infinite cluster

### 4.1 The zero–one law

Prove `bondPercolation_exists_infinite_eq_zero_or_one`: for every `d` and `p`, the probability
under `bondPercolation d p` that some open cluster is infinite is `0` or `1` (Grimmett, p. 90,
with Exercise 5.8, p. 130; Duminil-Copin, Lemma 2.8 and the remark after Corollary 2.9, p. 11).

Route: for `d = 0` there is a single vertex and the event is empty. For `d ≥ 1` enumerate the
countably infinite type `Sym2 (Fin d → ℤ)` as `e₀, e₁, …`; under `setBer` the events `eₖ ∈ s` are
independent (Mathlib `ProbabilityTheory.iIndepFun_infinitePi`). Deleting finitely many edges from a
graph with an infinite component leaves an infinite component, since that component splits into
finitely many pieces; so for every `n` the event equals the event that the graph with
`e₀, …, eₙ₋₁` deleted has an infinite component, which depends only on the coordinates `k ≥ n`.
The event is therefore measurable for the tail σ-algebra of the coordinates, and Mathlib's
`ProbabilityTheory.measure_zero_or_one_of_measurableSet_limsup_atTop` gives the conclusion.

**Checks.**
- For `d = 0` the probability is `0` for every `p`; for `d = 1` it is `0` for `p < 1` (by 5.2
  and 4.2 below) and `1` at `p = 1`.
- Events that depend on finitely many edges are not of this kind: on `ℤ²` the origin is isolated
  with probability `(1 − p)⁴`, which lies strictly between `0` and `1` for `0 < p < 1`.

*Needs:* 1.2, 1.4; Mathlib `ProbabilityTheory.iIndepFun_infinitePi`,
`ProbabilityTheory.measure_zero_or_one_of_measurableSet_limsup_atTop`,
`ProbabilityTheory.setBernoulli_eq_map`. (Proved here.)

### 4.2 Existence of an infinite cluster and θ

Prove `bondPercolation_exists_infinite_eq_one_iff`: the probability that some open cluster is
infinite equals `1` if and only if `θ(p) > 0`. With 4.1 it equals `0` if and only if `θ(p) = 0`
(Grimmett, p. 90; Duminil-Copin, p. 2 and Corollary 2.9, p. 11).

Route: the event contains the event that the cluster of `0` is infinite, so its probability is at
least `θ(p)`, and 4.1 turns a positive probability into `1`. Conversely, it is the union over the
countably many `x` of the events that the cluster of `x` is infinite, each of probability `θ(p)` by
1.5; if `θ(p) = 0` the union is null (Mathlib `MeasureTheory.measure_iUnion_null`).

**Checks.**
- For `d = 2` and `p > 2/3`, 6.3 below gives `θ(p) > 0`, so an infinite open cluster exists
  almost surely; for `p < 1/3`, 5.2 below gives `θ(p) = 0`, so none exists almost surely.

*Needs:* 1.3, 1.5, 4.1; Mathlib `MeasureTheory.measure_iUnion_null`. (Proved here.)

### Examples

`ℤ` at `p < 1` and at `p = 1`; the single vertex of `d = 0`.

### Dependencies

Layer 1 (1.2–1.5). Mathlib `ProbabilityTheory.iIndepFun_infinitePi`,
`ProbabilityTheory.measure_zero_or_one_of_measurableSet_limsup_atTop`,
`ProbabilityTheory.setBernoulli_eq_map`, `MeasureTheory.measure_iUnion_null`.

## Layer 5: self-avoiding walks and the lower bound

### 5.1 Counting self-avoiding walks

A self-avoiding walk is a walk that visits no vertex twice, Mathlib's `SimpleGraph.Walk.IsPath`.
Prove:

- `card_isPath_length_le`: for `n ≥ 1` and `x ∈ ℤ^d`, there are finitely many paths of length `n`
  in `latticeGraph d` starting at `x`, and at most `2d (2d − 1)^(n − 1)` of them (Grimmett,
  inequality (3.5), p. 41).
- `card_isPath_length_getVert_one_le`: for every `y`, at most `(2d − 1)^(n − 1)` paths of length
  `n` start at `x` and have second vertex `y` (Mathlib `SimpleGraph.Walk.getVert`).

The counts are natural numbers and `2d − 1` is the truncated difference, which only matters for
`d = 0`.

Route: the first step has at most `2d` choices; each later step must avoid the vertex just left,
leaving at most `2d − 1` choices. Finiteness follows from the same bound on all walks.

**Checks.**
- On `ℤ²` the numbers of paths of lengths `1, …, 6` from `0` are `4, 12, 36, 100, 284, 780`, against
  the bounds `4, 12, 36, 108, 324, 972`; with a prescribed first step they are
  `1, 3, 9, 25, 71, 195`, against `1, 3, 9, 27, 81, 243` (exhaustive enumeration up to `n = 10`).
- On `ℤ` there are exactly two paths of each length `n ≥ 1`, so the first bound is attained.
- On `ℤ³` the numbers of lengths `1, …, 4` are `6, 30, 150, 726`, against `6, 30, 150, 750`.
- The hypothesis `n ≥ 1` is needed for the first statement: for `d = 0` and `n = 0` there is one
  path (the empty walk at the only vertex) and the bound is `2 · 0 · (0 − 1)^0 = 0`. For `n ≥ 1`
  and `d = 0` there is no path and the bound is `0`.
- In the second statement, for `n = 0` the only path is the empty walk, whose vertex number `1` is
  `x` itself, and the bound is `1`.

*Needs:* 1.1; Mathlib `SimpleGraph.Walk.IsPath`, `SimpleGraph.Walk.getVert`. (Proved here.)

### 5.2 No percolation for small p

Prove `percolationProb_eq_zero_of_mul_lt_one`: if `(2d − 1) p < 1` then `θ(p) = 0`. Prove
`one_div_le_criticalProb`: `1 / (2d − 1) ≤ p_c(d)` for every `d`, the difference being taken in
`ℝ` (Grimmett, proof of Theorem 3.2, p. 41, and Theorem 3.12, p. 44, with the bound on the
connective constant of Theorem 3.10, p. 43; Duminil-Copin, Theorem 1.1, p. 2, with the cruder
count `(2d)ⁿ`).

Route: if the cluster of `0` is infinite then for every `n` some path of length `n` from `0` has
all its edges open; each such path has `n` distinct edges, open together with probability `pⁿ`,
so `θ(p) ≤ 2d (2d − 1)^(n − 1) pⁿ` by 5.1, which tends to `0` when `(2d − 1) p < 1`. For the
second statement with `d ≥ 1`, every `p < 1/(2d − 1)` has `θ(p) = 0`, so `p_c(d)` is at least
each such `p`; for `d = 0` the left side is `−1`.

**Checks.**
- `d = 2`: `θ(p) = 0` for `p < 1/3`, and `p_c(2) ≥ 1/3`.
- `d = 1`: the hypothesis is `p < 1`, and `θ(1) = 1` shows that the strict inequality is
  needed; with `p_c(1) ≤ 1` this gives `p_c(1) = 1`.
- `d = 0`: the hypothesis `−p < 1` always holds, and `θ` vanishes identically.

*Needs:* 1.2, 1.3, 5.1; Mathlib `MeasureTheory.measure_iUnion_le`,
`MeasureTheory.Measure.infinitePi_pi`, `le_csSup`. (Proved here, except as cited.)

### Examples

Self-avoiding walks of length at most four on `ℤ²` and on `ℤ`; the bound on `θ(1/4)` on `ℤ²`,
which is at most `4 · 3^(n − 1) · 4^(−n)` for every `n`.

### Dependencies

Layer 1 (1.1–1.3). Mathlib `SimpleGraph.Walk.IsPath`, `SimpleGraph.Walk.getVert`,
`MeasureTheory.measure_iUnion_le`, `MeasureTheory.Measure.infinitePi_pi`, `le_csSup`.

## Layer 6: planar duality and the upper bound

### 6.1 The closed dual graph and surrounding cycles

On `ℤ²`, define `closedDualGraph G`: the points `u` and `v = u + eᵢ` (`i = 0, 1`) are adjacent
when the primal edge from `v` to `u + (1, 1)` is not an edge of `G`. In the plane, the dual edge
from `u + (1/2, 1/2)` to `v + (1/2, 1/2)` crosses exactly that primal edge at its midpoint, and
every primal edge is crossed by exactly one dual edge. Define `rayEdges`, the dual edges from
`(k, −1)` to `(k, 0)` for `k ≥ 0`, which cross the primal edges from `(k, 0)` to `(k + 1, 0)`, that
is, the half-line `{(t, 0) : t > 0}`. A closed walk `c` in a graph on `ℤ²` `Surrounds` the origin
when it uses an odd number of edges of `rayEdges`, counted with multiplicity.

For a cycle, which is a simple closed polygon in the plane, `Surrounds` says that the half-line
from the origin meets it an odd number of times, the parity test for the origin to lie inside;
the definition itself is combinatorial and is what the targets below use.

**Checks.**
- `closedDualGraph` of the graph with no edge is `latticeGraph 2`, and `closedDualGraph` of
  `latticeGraph 2` has no edge.
- The dual edge from `(0, 0)` to `(1, 0)`, that is from `(1/2, 1/2)` to `(3/2, 1/2)`, crosses the
  primal edge from `(1, 0)` to `(1, 1)`, not the primal edge from `(0, 0)` to `(1, 0)`; a
  definition reading the edge from `u` to `v` would put dual and primal edges on top of each other.
- Let `G` be `latticeGraph 2` without the four edges at the origin. The cycle through
  `(−1, −1), (0, −1), (0, 0), (−1, 0)` lies in `closedDualGraph G` and uses one edge of
  `rayEdges` (the one with `k = 0`), so it surrounds the origin. For the graph with no edge, in
  which every edge is closed, the cycle through `(0, −1), (1, −1), (1, 0), (0, 0)` uses the two
  edges with `k = 0` and `k = 1`, so it does not surround the origin; it surrounds `(1, 0)`.

*Needs:* 1.1; Mathlib `SimpleGraph.fromRel`, `SimpleGraph.Walk.edges`. (Proved here.)

### 6.2 Finite clusters are enclosed by closed dual cycles

Prove `exists_isCycle_surrounds_of_finite`: for every graph `G` on `ℤ²` whose connected component
of `0` is finite, there is a cycle (Mathlib `SimpleGraph.Walk.IsCycle`) in `closedDualGraph G`
that surrounds the origin (Grimmett, p. 41 and Figure 3.1, p. 42; Duminil-Copin, p. 3 and
Figure 2). The statement makes no assumption that `G` is a subgraph of the lattice: the closed
dual graph reads only lattice edges, and removing the other edges of `G` shrinks the component.

Route: let `C` be the finite component of `0` and `K` the union of the closed unit squares of the
plane centred at the points of `C`. Consider the dual edges that cross a primal edge with exactly
one endpoint in `C`; those primal edges are not in `G`, so these dual
edges lie in `closedDualGraph G`, and they form the boundary of `K`. Every dual vertex meets an
even number of them, so they decompose into cycles. A walk from `0` along the half-line `y = 0`
to the right leaves `K`, and the number of times it crosses the boundary of `K` is odd and equals
the number of boundary edges in `rayEdges`; by additivity of this count mod `2` over the
decomposition, one of the cycles uses an odd number of edges of `rayEdges`.

**Checks.**
- If the cluster of `0` is `{0}`, the square of 6.1 around the origin serves.
- If the cluster is `{(0, 0), (1, 0)}`, the cycle of length `6` through `(−1, −1), (0, −1),
  (1, −1), (1, 0), (0, 0), (−1, 0)` serves: it uses the edge of `rayEdges` with `k = 1` and not the
  one with `k = 0`, whose primal edge is open.
- If `G` has the single edge from `0` to `(5, 5)`, the component of `0` is `{(0, 0), (5, 5)}` and
  the square around the origin of the first Check serves.
- Random tests with random edges inside the box `[−3, 3]²`: with every other edge closed, a cycle
  of closed dual edges surrounding the origin was found in all 3000 samples; with every edge of
  the ring out to `[−5, 5]²` open, such a cycle near the box was found in exactly those of 3000
  samples in which the cluster of the origin does not reach the ring.

*Needs:* 6.1; Mathlib `SimpleGraph.Walk.IsCycle`, `SimpleGraph.ConnectedComponent.supp`.
(Proved here, except as cited.)

### 6.3 Peierls's argument on ℤ²

Prove `percolationProb_pos_of_two_thirds_lt`: on `ℤ²`, `θ(p) > 0` for every `p > 2/3` (Grimmett,
Theorem 3.12, p. 44, which gives `p_c(2) ≤ 1 − 1/κ` for the connective constant `κ`, with
`κ ≤ 3` by Theorem 3.10, p. 43; the case of `p` close to `1` is Grimmett, proof of Theorem 3.2,
p. 42, and Duminil-Copin, Theorem 1.1, p. 3).

Route. Fix `p > 2/3` and put `q = 3(1 − p) < 1`. For `m ≥ 0` let `A_m` be the event that the `m`
primal edges from `(k, 0)` to `(k + 1, 0)`, `0 ≤ k < m`, are open, of probability `p^m`, and let
`B_m` be the event that `closedDualGraph G` has a cycle that surrounds the origin and uses an edge
of `rayEdges` with `k ≥ m`.

1. If `A_m` holds and the cluster of `0` is finite, the cycle of 6.2 uses an odd, hence positive,
   number of edges of `rayEdges`, none with `k < m`, since their primal edges are open; so `B_m`
   holds. Thus `A_m ∩ B_mᶜ` lies in the event that the cluster of `0` is infinite.
2. `A_m` is increasing and `B_m` is decreasing, since closing more edges adds dual edges. `B_m` is
   measurable: it is the union, over the countably many cycles of the dual lattice that surround
   the origin and use an edge of `rayEdges` with `k ≥ m`, of the events that all primal edges
   crossed by the cycle are closed. Harris's inequality 3.1, applied to
   the measurable upper sets `A_m` and `B_mᶜ` of edge sets, and the measurability of the event
   that the cluster of `0` is infinite (1.4) give `θ(p) ≥ p^m (1 − P(B_m))`.
3. A cycle of length `n` surrounding the origin and using the edge of `rayEdges` with index `k`
   has `n ≥ 2k + 4`: a closed walk uses an even number of the dual edges from `(j, −1)` to
   `(j, 0)`, `j ∈ ℤ`, so it also uses one with `j ≤ −1`; it therefore visits a column at most
   `−1` and the column `k`, which takes at least `2(k + 1)` horizontal steps, and it uses at
   least two of these vertical edges. Rotating it and reversing it if needed, it becomes a cycle
   starting at `(k, 0)` whose first step is to `(k, −1)`; its first `n` vertices form a path of
   length `n − 1` with that first step, and there are at most `3^(n − 2)` such paths (5.1,
   `d = 2`). Its `n` edges cross `n`
   distinct primal edges, all closed with probability `(1 − p)^n`. Hence
   `P(B_m) ≤ ∑_{k ≥ m} ∑_{n ≥ 2k + 4} 3^(n − 2) (1 − p)^n = q^(2m + 4) / (9 (1 − q)(1 − q²))`.
4. The right side tends to `0` as `m` grows; for `m` with `P(B_m) < 1`, step 2 gives `θ(p) > 0`.

**Checks.**
- The cycles of length `n` that start at `(k, 0)` with first step to `(k, −1)` number `2, 6, 28,
  140, 744, 4116` for `n = 4, 6, 8, 10, 12, 14` (for each `k`), within the bound `3^(n − 2)`; those
  among them that surround the origin exist only for `n ≥ 2k + 4`, and for `n = 2k + 4` there is
  exactly one (the boundary of the rectangle with dual corners `(−1, −1)` and `(k, 0)`).
- The numbers of distinct cycles (as sets of dual edges) of lengths `4, 6, 8, 10, 12, 14` that
  surround the origin are `1, 4, 22, 124, 726, 4352` (exhaustive enumeration).
- At `p = 4/5`, `q = 3/5` and the bound of step 3 with `m = 0` is `9/160`, so `θ(4/5) ≥ 151/160`.
- At `p = 7/10`, `q = 9/10`, the bound of step 3 is below `1` from `m = 7` on.
- At `p = 2/3` the series of step 3 diverges, and the route gives nothing.

*Needs:* 1.2, 1.3, 1.4, 3.1, 5.1, 6.1, 6.2; Mathlib `MeasureTheory.measure_iUnion_le`,
`MeasureTheory.Measure.infinitePi_pi`, `SimpleGraph.fromEdgeSet_mono`. (Proved here, except as
cited.)

### 6.4 Comparison of dimensions and the upper bound

Prove `percolationProb_le_of_le`: if `d ≤ d'` then `θ_d(p) ≤ θ_{d'}(p)` for every `p`, where
`θ_d` is `percolationProb d` (the observation behind Grimmett, inequality (3.6), p. 41, which
compares the critical probabilities). Prove `criticalProb_le_two_thirds`: `p_c(d) ≤ 2/3` for
every `d ≥ 2`.

Route: extending by zeros embeds `ℤ^d` into `ℤ^{d'}` as an induced subgraph of the lattice. The
image of `bondPercolation d' p` under pulling back along the embedding
(`SimpleGraph.comap`, a measurable map by `SimpleGraph.measurable_iff_adj`) is
`bondPercolation d p`, since the lattice edges of the copy of `ℤ^d` are
distinct coordinates of the product and the restriction of a product measure to a set of
coordinates is the product over that set (Mathlib
`MeasureTheory.Measure.infinitePi_map_restrict'`); a walk in the pulled-back graph maps to a walk
in the original, injectively on vertices, so an infinite cluster of `0` in the copy gives one in
`ℤ^{d'}`. For the second statement, if `θ_d(p) = 0` then `θ_2(p) = 0` by the first, so
`p ≤ 2/3` by 6.3; hence `2/3` bounds the set whose supremum is `p_c(d)`.

**Checks.**
- `d ≥ 2` is needed: `p_c(1) = 1 > 2/3` (5.2) and `p_c(0) = 1`.
- For `d = 0 ≤ d'` the first statement is `0 ≤ θ_{d'}(p)`.
- With 5.2: `1/3 ≤ p_c(2) ≤ 2/3`, `1/5 ≤ p_c(3) ≤ 2/3`, and `1/(2d − 1) ≤ p_c(d) ≤ 2/3` for every
  `d ≥ 2`.

*Needs:* 1.2, 1.3, 1.4, 6.3; Mathlib `SimpleGraph.comap`, `SimpleGraph.measurable_iff_adj`,
`MeasureTheory.Measure.infinitePi_map_restrict'`, `Real.sSup_le`. (Proved here, except as cited.)

### Examples

The closed dual cycles around a cluster of one and of two vertices; the bound of step 3 of 6.3 at
`p = 4/5`; the copy of `ℤ²` in `ℤ³`.

### Dependencies

Layers 1 (1.1–1.4), 3 (3.1) and 5 (5.1). Mathlib `SimpleGraph.fromRel`,
`SimpleGraph.Walk.edges`, `SimpleGraph.Walk.IsCycle`, `SimpleGraph.ConnectedComponent.supp`,
`SimpleGraph.comap`, `SimpleGraph.measurable_iff_adj`, `SimpleGraph.fromEdgeSet_mono`,
`MeasureTheory.measure_iUnion_le`, `MeasureTheory.Measure.infinitePi_pi`,
`MeasureTheory.Measure.infinitePi_map_restrict'`, `Real.sSup_le`.

## Scope and ownership

This roadmap owns the nearest-neighbour graph on `ℤ^d`, the measure `bondPercolation` with `θ` and
`p_c`, the measurability and translation invariance of the cluster events, the monotone coupling of
Bernoulli random sets and the monotonicity of increasing events, Harris's inequality for Bernoulli
random sets on a countable type, the zero–one law for an infinite cluster, the counting of
self-avoiding walks on `ℤ^d`, the closed dual graph of a configuration on `ℤ²` with planar duality
for finite clusters, Peierls's argument and the comparison of dimensions.

Already in the libraries and therefore not targets:

- Bernoulli measures (`ProbabilityTheory.bernoulliMeasure`), product measures on arbitrary
  products (`MeasureTheory.Measure.infinitePi`) and Bernoulli random subsets of a set
  (`ProbabilityTheory.setBernoulli`), with their values at `p = 0` and `p = 1`.
- The binomial random graph `SimpleGraph.binomialRandom`, the same construction on all pairs of
  distinct vertices; `bondPercolation` restricts it to the lattice edges.
- The four functions theorem, the Holley inequality and the FKG inequality on finite distributive
  lattices (`four_functions_theorem`, `holley`, `fkg` in
  `Mathlib/Combinatorics/SetFamily/FourFunctions.lean`), and the Harris–Kleitman inequality for
  families of finite sets (`IsUpperSet.le_card_inter_finset` in
  `Mathlib/Combinatorics/SetFamily/HarrisKleitman.lean`), which is the case of 3.1 with `p = 1/2`
  and finite `ι` in counting form.
- Kolmogorov's zero–one law (`ProbabilityTheory.measure_zero_or_one_of_measurableSet_limsup_atTop`)
  and Lévy's upward theorem (`MeasureTheory.Integrable.tendsto_eLpNorm_condExp`).
- In Tau Ceti, the tail σ-algebra of an ℕ-indexed process (`TauCeti.Probability.tailProcess`) and
  the ergodicity of the one-sided Bernoulli shift
  (`MeasureTheory.Measure.ergodic_shift_infinitePi_const`). The zero–one law 4.1 above reads the
  edges along an enumeration and applies Mathlib's Kolmogorov law to one event directly, so it
  uses neither.
- Walks, paths, cycles, reachability and connected components of simple graphs, and the σ-algebra
  on simple graphs (`SimpleGraph.instMeasurableSpace`).

Left to other roadmaps: DimerModelsAndLozengeTilings owns tail σ-algebras of product spaces under a
proper group action, the triviality of the tail σ-algebra under Bernoulli product measures and
their ergodicity (its 4.1 and 4.3). The zero–one law 4.1 above is about one event, proved from
Mathlib's Kolmogorov law along an enumeration of the edges; it does not restate those sections,
and ergodicity under translations is not used.

Not treated here: Kesten's theorem `p_c(2) = 1/2`, the converse of 6.2, the uniqueness of the
infinite cluster, exponential decay of the cluster size below `p_c`, continuity of `θ`, the
van den Berg–Kesten and Reimer inequalities, Russo's formula, the Russo–Seymour–Welsh theory, the
existence and value of the connective constant, site percolation, other lattices and percolation
on trees.

## Exact supplier contracts

### From Mathlib

- `Mathlib/Combinatorics/SimpleGraph/Basic.lean`: `SimpleGraph.fromRel` (`(fromRel r).Adj v w ↔
  v ≠ w ∧ (r v w ∨ r w v)`, `SimpleGraph.fromRel_adj`); `SimpleGraph.fromEdgeSet` (the graph whose
  edges are the non-diagonal elements of a set of unordered pairs) and
  `SimpleGraph.fromEdgeSet_mono` (monotone for inclusion).
- `Mathlib/Combinatorics/SimpleGraph/Maps.lean`: `SimpleGraph.comap` (the graph pulled back along a
  map of vertices).
- `Mathlib/MeasureTheory/Constructions/SimpleGraph.lean`: `SimpleGraph.instMeasurableSpace` (the
  σ-algebra induced by adjacency); `SimpleGraph.measurable_iff_adj` (a graph-valued map is
  measurable iff each adjacency is); `SimpleGraph.measurable_fromEdgeSet`.
- `Mathlib/Combinatorics/SimpleGraph/Connectivity/Connected.lean`: `SimpleGraph.Reachable.mono`
  (reachability passes to a larger graph), `SimpleGraph.ConnectedComponent.supp` (the vertices of
  a component). `Mathlib/Combinatorics/SimpleGraph/Paths.lean`: `SimpleGraph.Walk.IsPath`
  (no repeated vertex), `SimpleGraph.Walk.IsCycle` (a closed walk of positive length with no
  repeated edge and no repeated vertex other than the endpoints). `SimpleGraph.Walk.edges`
  (`Mathlib/Combinatorics/SimpleGraph/Walk/Basic.lean`: the list of edges of a walk) and
  `SimpleGraph.Walk.getVert` (`Mathlib/Combinatorics/SimpleGraph/Walk/Traversal.lean`: vertex number
  `n` of a walk, the endpoint once `n` exceeds the length).
- `Mathlib/Probability/Distributions/Bernoulli.lean`: `ProbabilityTheory.bernoulliMeasure`
  (`Ber(x, y, p)`, mass `p` at `x` and `1 − p` at `y`) and
  `ProbabilityTheory.bernoulliMeasure_self_eq_dirac` (`Ber(x, x, p)` is the point mass at `x`).
- `Mathlib/Probability/Distributions/SetBernoulli.lean`: `ProbabilityTheory.setBernoulli`, written
  `setBer(u, p)`, a probability measure on `Set ι`; `ProbabilityTheory.setBernoulli_eq_map` (the
  image of `infinitePi fun i ↦ Ber(i ∈ u, False, p)` under `P ↦ {i | P i}`);
  `ProbabilityTheory.setBernoulli_zero`, `ProbabilityTheory.setBernoulli_one` (the point masses at
  `∅` and `u`); `ProbabilityTheory.setBernoulli_ae_subset` (for countable `ι`, almost every set is
  contained in `u`); `ProbabilityTheory.setBernoulli_singleton` (for countable `ι`, finite `u` and
  `s ⊆ u`, the mass of `{s}` is `p ^ |s| (1 − p) ^ |u \ s|`).
- `Mathlib/Probability/ProductMeasure.lean`: `MeasureTheory.Measure.infinitePi` (the product of
  a family of probability measures); `MeasureTheory.Measure.infinitePi_pi` (the mass of a
  product of measurable sets over a finite set of indices is the product of the masses);
  `MeasureTheory.Measure.infinitePi_map_pi` (the image under a coordinatewise measurable map is the
  product of the images); `MeasureTheory.Measure.infinitePi_map_piCongrLeft` (invariance under
  reindexing by an equivalence); `MeasureTheory.Measure.infinitePi_map_restrict'` (the image under
  restriction to a set `I` of indices is the product over `I`).
- `Mathlib/Probability/Independence/InfinitePi.lean`: `ProbabilityTheory.iIndepFun_infinitePi`
  (the coordinates are independent under `infinitePi`).
- `Mathlib/Probability/Independence/ZeroOne.lean`:
  `ProbabilityTheory.measure_zero_or_one_of_measurableSet_limsup_atTop` (for independent
  sub-σ-algebras `s n` below the ambient one, an event measurable for `limsup s atTop` has measure
  `0` or `1`).
- `Mathlib/Probability/Martingale/Convergence.lean`:
  `MeasureTheory.Integrable.tendsto_eLpNorm_condExp` (for a finite measure, a filtration `𝓕` and
  an integrable `g` measurable for `⨆ n, 𝓕 n`, the conditional expectations of `g` given `𝓕 n`
  converge to `g` in `L¹`).
- `Mathlib/Combinatorics/SetFamily/FourFunctions.lean`: `fkg` (on a finite distributive lattice,
  for `μ ≥ 0` with `μ a μ b ≤ μ (a ⊓ b) μ (a ⊔ b)` and nonnegative monotone `f`, `g`:
  `(∑ μ f)(∑ μ g) ≤ (∑ μ)(∑ μ f g)`).
- `Mathlib/MeasureTheory/Constructions/UnitInterval.lean`: the measure `volume` on `I` and
  `unitInterval.volume_apply` (it is Lebesgue measure of the image in `ℝ`).
- `Mathlib/MeasureTheory/OuterMeasure/Basic.lean`: `MeasureTheory.measure_iUnion_le` (countable
  subadditivity) and `MeasureTheory.measure_iUnion_null` (a countable union of null sets is
  null). `Mathlib/MeasureTheory/Measure/MeasureSpaceDef.lean`: `MeasureTheory.Measure.real` (the
  real value of a measure).
- `Mathlib/Order/Defs/Unbundled.lean`: `IsUpperSet`.
- `Mathlib/Order/ConditionallyCompleteLattice/Basic.lean`: `le_csSup` (an element of a set bounded
  above is at most its supremum) and `exists_lt_of_lt_csSup` (if `b` is below the supremum of a
  nonempty set, some element of the set exceeds `b`).
  `Mathlib/Algebra/Order/Archimedean/Real/Basic.lean`: `Real.sSup_le`
  (if every element is at most `a ≥ 0`, so is the supremum).

No declaration of Tau Ceti is used.

## References

- Hugo Duminil-Copin, *Introduction to Bernoulli percolation*, lecture notes for a course at
  IHÉS, version of October 7, 2018, available from the author's page at IHÉS; the page numbers
  above are those of that version.
- Geoffrey Grimmett, *Probability on Graphs: Random Processes on Graphs and Lattices*, second
  edition, Cambridge University Press, 2018 (IMS Textbooks 8); the author's PDF of January 2018,
  available from his page at the University of Cambridge. The page numbers above are those
  printed in that PDF.
- Attributions made in prose without a locator: S. R. Broadbent and J. M. Hammersley (the model,
  1957); T. E. Harris (the correlation inequality for product measure and `θ(1/2) = 0` on `ℤ²`,
  1960); C. M. Fortuin, P. W. Kasteleyn and J. Ginibre (the FKG inequality, 1971); R. Peierls (the
  contour argument, 1936); J. M. Hammersley and K. W. Morton (the connective constant, 1954);
  H. Kesten (`p_c(2) = 1/2`, 1980).
