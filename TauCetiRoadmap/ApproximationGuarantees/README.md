# Roadmap: approximation guarantees in combinatorial optimization

**Summary.** This roadmap states the worst-case guarantees of the classical heuristics of
combinatorial optimization as inequalities between finite combinatorial objects. Each target has
the form: every object that obeys a stated rule (a sequence of greedy choices, the vertices of a
maximal matching, a schedule that places each job on a least loaded machine, a cut that no single
move improves) costs at most a fixed factor times every competing object. No procedure, running
time or complexity class is a target. Costs, weights and distances are real, and no optimal value
is taken as an infimum.

The headline theorems are these.

- *The harmonic bound.* Let finitely many finite sets have nonnegative costs and at most `d`
  elements each. A sequence of sets in which every set covers a new element and has the least cost
  per newly covered element costs at most `H_d = 1 + 1/2 + … + 1/d` times any fractional cover.
- *Half-integrality and persistency.* An extreme point of the polyhedron of fractional vertex
  covers of a graph takes only the values `0`, `1/2` and `1`. If `x` is a fractional vertex cover
  of least weight of a finite graph with real vertex weights, some vertex cover of least weight
  contains every vertex with `x > 1/2` and no vertex with `x < 1/2`.
- *Tours from trees.* In a nonempty finite pseudometric space, every spanning tree `T` has a
  tour of length at most twice the length of `T`, and at most the length of `T` plus that of `M`
  for every perfect matching `M` of the vertices of odd degree of `T`. Every tour is at least as
  long as some spanning tree and at least twice as long as some perfect matching of any given
  even set of points.
- *List schedules.* For nonnegative processing times on `m ≥ 1` identical machines, a schedule in
  which every job is placed on a machine that is least loaded by the earlier jobs has makespan at
  most `2 − 1/m` times that of any assignment, and at most `4/3 − 1/(3m)` times when the
  processing times are nonincreasing.

The roadmap builds on Mathlib's simple graphs (matchings, vertex covers, trees, walks), its
extreme points of convex sets, its harmonic numbers and its pseudometric spaces.
GraphConnectivityAndFlows proves the equality of matching and cover numbers for bipartite
multigraphs with capacities; here graphs are arbitrary and only inequalities hold.
MarkovDecisionProcesses solves the linear programs of a discounted decision process; the programs
here are covering relaxations, of which only weak duality is used.

Layer 1 below treats set systems: fractional covers, greedy sequences, rounding by frequency and
pricing. Layer 2 treats graphs: matchings and vertex covers, fractional vertex covers, and locally
optimal cuts. Layer 3 treats pseudometric spaces: tours, with the factors `2` and `3/2` as
corollaries, and farthest-first sequences. Layer 4 treats loads: list schedules, bin packings and
the prefix bound for knapsacks. Layer 2 uses Layer 1 for two corollaries; no other layer depends
on another.

## Conventions

- **Numbers.** Costs, weights, prices, sizes, processing times and distances are real. A sign
  condition is a hypothesis of each statement that needs it and is absent where it is not needed.
- **Optimal values.** No statement mentions an optimal value. "At most `α` times the optimum" is
  stated as "at most `α` times the cost of every competitor", which is the same when an optimum
  exists and has no junk value when the family of competitors is empty.
- **Sums over sets.** A sum over a set of vertices, edges or indices is a `finsum`. A statement
  that contains one assumes the finiteness that makes it a finite sum, or has a hypothesis that
  implies it. A statement that needs no finiteness does not assume it.
- **Set systems.** A set system is a family `S : ι → Finset α` with `ι` finite. Its elements are
  the elements of the sets `S j`; an element of `α` in no set plays no role. A cover is a set `J`
  of indices such that every element of the system lies in `S i` for some `i ∈ J`. Empty sets and
  repeated sets are allowed.
- **Graphs.** A graph is a Mathlib `SimpleGraph V`. A matching is a subgraph `M` with
  `M.IsMatching`: its vertex set `M.verts` consists of the matched vertices exactly. Vertex covers
  and the vertex cover number are Mathlib's `SimpleGraph.IsVertexCover` and
  `SimpleGraph.vertexCoverNum`, the latter with values in `ℕ∞`.
- **Metric spaces.** The points form a type `V` with a `PseudoMetricSpace` structure, so distinct
  points may be at distance `0`. This is the same as a symmetric function on pairs that vanishes on
  the diagonal and satisfies the triangle inequality. A closed route is a list of points, read
  cyclically; a tour is a closed route without repetition that contains every point.
- **Orders of choice.** A rule that makes choices one after another is encoded by a list, and the
  statement quantifies over every list that obeys the rule, so every way of breaking ties is
  covered.
- **Names of methods.** Johnson, Lovász, Chvátal, Hochbaum, Bar-Yehuda, Even, Nemhauser, Trotter,
  Christofides, Serdyukov, Gonzalez and Graham are named only to say which inequality underlies
  which classical method.

## Layer 1: covering by sets

Throughout this layer `S : ι → Finset α` is a set system with `[Fintype ι]` and
`[DecidableEq α]`, and `c : ι → ℝ` is a cost on the sets.

### 1.1 Covers and fractional covers

Define `IsFractionalCover S x` for `x : ι → ℝ`: `x j ≥ 0` for every `j`, and for every element
`e` of the system the numbers `x i` over the sets `S i` containing `e` sum to at least `1`. The
cost of `x` is `∑ j, c j * x j`.

- The indicator function of a cover is a fractional cover of the same cost. So every bound against
  all fractional covers is a bound against all covers.
- *Weak duality.* If `y : α → ℝ` is nonnegative, `∑ e ∈ S j, y e ≤ c j` for every `j`, and `x` is a
  fractional cover, then the sum of `y` over the elements of the system is at most
  `∑ j, c j * x j` (Williamson and Shmoys, §1.4, the chain of inequalities on p. 21).

**Checks.**
- For the three sets `{1, 2}`, `{2, 3}`, `{1, 3}` the constant function `1/2` is a fractional cover
  of cost `3/2` for unit costs, while every cover has two sets. A definition that asked for integer
  values would not see it.
- If every set is empty there is no element, every nonnegative `x` is a fractional cover, and the
  empty set of indices is a cover.

*Needs:* Mathlib `Finset.sum`. (Proved here.)

### 1.2 Greedy sequences and the harmonic bound

For a list `l` of indices define `gain S l j`, the number of elements of `S j` that lie in no
`S i` with `i ∈ l`. Define `IsGreedy c S l`: for every position `k` of `l`, with `p` the list of
the entries before position `k` and `j₀` the entry at position `k`, `gain S p j₀ > 0`, and
`c j₀ * gain S p j ≤ c j * gain S p j₀` for every index `j`. For nonnegative costs the second
condition says that `j₀` has the least cost per newly covered element among the sets that cover a
new element; it is written without division, and a set with no new element then satisfies it
automatically. For a set `j` with no new element and `c j < 0` the condition fails, so the
definition is meant for nonnegative costs; each statement below that needs them says so.

- A greedy sequence has no repeated entry and at most as many entries as the system has elements.
- If `c j ≥ 0` for every `j`, every greedy sequence is an initial segment of a greedy sequence
  after which every gain is `0`; the entries of the latter form a cover.
- *The harmonic bound* (`IsGreedy.sum_cost_le_harmonic_mul`). If `c j ≥ 0` and `(S j).card ≤ d` for
  every `j`, `l` is a greedy sequence and `x` a fractional cover, then
  `(l.map c).sum ≤ harmonic d * ∑ j, c j * x j` (Williamson and Shmoys, Theorem 1.12, p. 26; the
  bound against covers with the number of elements in place of `d` is their Theorem 1.11, p. 25).
  The bound is due to Johnson and Lovász for unit costs and to Chvátal in this form.
- *Unit costs.* For `c = 1` the rule reads "cover as many new elements as possible", and a greedy
  sequence has at most `harmonic d * J.card` entries for every cover `J`.
- *Tightness.* For every `n ≥ 1` take the elements `1, …, n`, the singletons `{k}` with cost `1/k`
  and the whole set with cost `1`. The singletons in the order `{n}, {n − 1}, …, {1}` form a greedy
  sequence of cost `H_n`, the whole set is a cover of cost `1`, and `d = n`.

Route for the bound: give each element `e` covered by the entry `j₀` at position `k` the price
`c j₀ / gain S p j₀`, and price `0` to the elements that the sequence does not cover. The prices
sum to the cost of the sequence. For a fixed set `S j`, list its elements in the order in which
the sequence covers them, those it does not cover last; just before the `i`-th element from the
end is covered, `S j` has at least `i` uncovered elements, so that element's price is at most
`c j / i` by the greedy condition, and the prices on `S j` sum to at most `H_d * c j`. Dividing
the prices by `H_d` and applying weak duality gives the bound. The route needs no hypothesis that
the sequence is complete.

**Checks.**
- Unit costs, `S₀ = {1, 2, 3, 4}`, `S₁ = {1, 2, 5}`, `S₂ = {3, 4, 6}`: a nonempty greedy sequence
  starts with `S₀`, after which both remaining sets have gain `1`; continued until every gain is
  `0` it has three entries, while `{S₁, S₂}` is a cover. Here `3 ≤ H_4 * 2 = 25/6`. The gain
  counts new elements only: after `S₀` the gain of `S₁` is `1`, not its size `3`.
- In the tightness family with `n = 3` the costs are `1, 1/2, 1/3` and `1`; at each step the next
  singleton ties with the whole set, and the sequence costs `11/6 = H_3`. The one-entry list of the
  whole set is greedy as well, with cost `1`: the bound is attained only for some ways of breaking
  ties.
- A negative cost breaks the bound: one set `{e}` of cost `−1` and the fractional cover `x = 100`
  give a greedy sequence of cost `−1` and `H_1 * (−100) = −100`.
- If every set is empty the only greedy sequence is the empty list.
- Extension needs nonnegative costs: for `A = {1}` of cost `−1` and `B = {2}` of cost `1` the
  list `[A]` is greedy, `B` still has gain `1`, and `[A, B]` is not greedy, because at its second
  position the condition for `j = A` reads `1 * 0 ≤ (−1) * 1`.

*Needs:* Mathlib `harmonic`, `List.take`; 1.1 for weak duality.

### 1.3 Rounding by frequency

Let `f : ℕ` be such that every `e : α` lies in at most `f` of the sets.

- (`IsFractionalCover.sum_cost_le_mul_of_card_le`) If `c j ≥ 0` for every `j` and `x` is a
  fractional cover, the indices `i` with `1 ≤ f * x i` form a cover, and the sum of their costs is
  at most `f * ∑ j, c j * x j` (Williamson and Shmoys, Lemma 1.5 and Theorem 1.6, pp. 19–20). The
  method is Hochbaum's.

Route: at least one of the at most `f` terms of a sum that is at least `1` is at least `1/f`; and
`c i ≤ c i * (f * x i)` for the selected indices.

**Checks.**
- For the three sets `{1, 2}`, `{2, 3}`, `{1, 3}` with unit costs, `f = 2` and `x = 1/2`
  everywhere, all three sets are selected and their cost `3` equals `2 * (3/2)`: the factor `f` is
  attained against the fractional cover.
- If every set is empty, `f = 0` is allowed, no index is selected and both sides are `0`. The
  threshold is `1 ≤ f * x i`; a threshold `x i ≥ 1/f` read with `1/0 = 0` would select every index
  and fail for a positive cost.
- With one set `{e}` of cost `−1`, `f = 1` and `x = 2` the selected cost `−1` exceeds
  `1 * (−2)`: nonnegative costs are needed.

*Needs:* 1.1.

### 1.4 Pricing

A pricing is a nonnegative `y : α → ℝ` with `∑ e ∈ S j, y e ≤ c j` for every `j`; the set `S j` is
tight when equality holds. Let `f` be as in 1.3.

- (`IsFractionalCover.sum_tight_cost_le_mul`) For a pricing `y` and a fractional cover `x`, the
  sum of the costs of the tight sets is at most `f * ∑ j, c j * x j` (Williamson and Shmoys, proof
  of Theorem 1.8, p. 22, with weak duality).
- If every element of the system lies in a tight set, the tight sets form a cover, whose cost is
  therefore at most `f` times the cost of every cover. For nonnegative costs such a pricing exists:
  starting from `y = 0`, raise the price of an element that lies in no tight set until one of its
  sets becomes tight (Williamson and Shmoys, Theorem 1.9, p. 24, and Theorem 7.1, p. 162). The
  method is due to Bar-Yehuda and Even.

Route: the cost of the tight sets is the sum over them of the prices of their elements, in which
each price is counted at most `f` times; then weak duality.

**Checks.**
- Elements `e₁ ∈ A ∩ B` and `e₂ ∈ B ∩ C`, unit costs, `f = 2`, `y = (1, 0)`: `A` and `B` are
  tight, with cost `2`, and `B` alone is a cover of cost `1`. The factor `2` is attained.
- A set that is paid more than its cost breaks the bound: one element in `A` of cost `10` and in
  `B` of cost `1`, price `10`. Then `A` is paid exactly, `B` is overpaid, and `10 > 2 * 1`.
- Negative prices break it too: one element in one set of cost `−1`, price `−1`, and `x = 5`.

*Needs:* 1.1.

### Examples

- The tightness family of 1.2 for `n = 1, …, 6`, with the greedy sequence of cost `H_n` exhibited.
- A system with nonnegative costs and a set of cost `0`: every entry of a greedy sequence has
  cost `0` as long as some set of cost `0` covers a new element.

### Dependencies

Mathlib: finite sums and `harmonic`. No other layer.

## Layer 2: vertex covers, matchings and cuts

### 2.1 Matchings and vertex covers

Let `G : SimpleGraph V` and let `M : G.Subgraph` be a matching. No finiteness is assumed in this
section; cardinalities are `Set.encard`.

- `M.verts.encard = 2 * M.edgeSet.encard`.
- (`maximal_isMatching_iff`) `M` is maximal among the matchings of `G`, for the order of
  subgraphs, if and only if `M.verts` is a vertex cover of `G`. (Proved here.)
- (`encard_edgeSet_le_vertexCoverNum`) `M.edgeSet.encard ≤ G.vertexCoverNum`: a vertex cover
  contains an end of every edge of `M`, and these ends are distinct (Schrijver, §3.1, (3), p. 39).
- Consequently, for a maximal matching `M`,
  `G.vertexCoverNum ≤ M.verts.encard = 2 * M.edgeSet.encard ≤ 2 * G.vertexCoverNum` (Erickson,
  §J.5).
- Every graph has a maximal matching: the supremum of a chain of matchings is a matching, and
  Zorn's lemma applies.

Route for the equivalence: if an edge `uv` of `G` has both ends outside `M.verts`, then
`M ⊔ G.subgraphOfAdj _` is a larger matching. Conversely, if `M < M'` are matchings, `M'` has an
edge `uv` not in `M` because the edge set is strictly monotone on matchings; if `u` were matched
in `M`, to `w` say, then `u` would be adjacent to both `v` and `w` in `M'`, so `v = w` and `uv`
would be an edge of `M`.

**Checks.**
- Path `a b c d`: the matching `{bc}` is maximal, its two vertices form a vertex cover, and the
  vertex cover number is `2`. The matching `{ab, cd}` is maximal with four vertices: the factor `2`
  is attained.
- A star with three leaves: every single edge is a maximal matching, with two vertices, and the
  vertex cover number is `1`. In the complete bipartite graph with `n` vertices on each side a
  perfect matching has `2n` vertices and the vertex cover number is `n`.
- Triangle: every matching has at most one edge and the vertex cover number is `2`, so the first
  inequality can be strict.
- The matching without vertices is maximal exactly when the graph has no edge.

*Needs:* Mathlib `SimpleGraph.Subgraph.IsMatching`,
`SimpleGraph.Subgraph.IsMatching.strictMonoOn_edgeSet`,
`SimpleGraph.Subgraph.IsMatching.subgraphOfAdj`, `SimpleGraph.Subgraph.IsMatching.sup`,
`SimpleGraph.Subgraph.IsMatching.toEdge.surjective`, `SimpleGraph.IsVertexCover`,
`SimpleGraph.vertexCoverNum`, `SimpleGraph.IsVertexCover.vertexCoverNum_le`,
`SimpleGraph.vertexCoverNum_exists`, `Set.encard`, `Maximal`, `zorn_le₀`.

### 2.2 Fractional vertex covers

Define `fractionalVertexCovers G`, the set of `x : V → ℝ` with `x v ≥ 0` for every vertex and
`x u + x v ≥ 1` for every edge `uv`. It is a convex subset of `V → ℝ`. For a finite graph it is the
set of fractional covers, in the sense of 1.1, of the set system indexed by the vertices whose set
at `v` consists of the edges at `v`; every edge lies in two of these sets.

- *Half-integrality* (`eq_zero_or_half_or_one_of_mem_extremePoints`). If `x` is an extreme point of
  `fractionalVertexCovers G`, then `x v ∈ {0, 1/2, 1}` for every `v`. No finiteness is assumed
  (Williamson and Shmoys, Exercise 1.5(a), p. 32, for finite graphs). The theorem is due to
  Nemhauser and Trotter.
- *Attainment* (`exists_half_integral_minimizer`). For a finite graph and weights `w v ≥ 0`, some
  `x ∈ fractionalVertexCovers G` with values in `{0, 1/2, 1}` minimizes `∑ v, w v * x v` over
  `fractionalVertexCovers G`. (Proved here.)
- *Rounding.* For a finite graph, weights `w v ≥ 0` and `x ∈ fractionalVertexCovers G`, the set
  `{v | 1/2 ≤ x v}` is a vertex cover of weight at most `2 * ∑ v, w v * x v`. This is 1.3 with
  `f = 2` (Erickson, §J.6).
- *Pricing.* For a finite graph, let `y` be nonnegative on the edges with the prices of the edges
  at each vertex `v` summing to at most `w v`. Then the vertices at which equality holds have
  total weight at most twice the sum of all prices, hence at most twice the weight of every vertex
  cover; and they form a vertex cover when every edge has such an end. This is 1.4 with `f = 2`.

Route for half-integrality: put `h(t) = t (1 − t) |1 − 2t|` on `[0, 1]` and let `d v` be `h(x v)`
when `1/2 < x v < 1`, `−h(x v)` when `0 < x v < 1/2`, and `0` otherwise. Since `h` is Lipschitz,
`h(t) = h(1 − t)`, `h(t) ≤ t` and `h(t) ≤ |t − 1/2|`, both `x + ε d` and `x − ε d` are fractional
vertex covers for a small `ε > 0`, the same for all vertices. So an extreme point has no value
strictly between `0` and `1/2` or between `1/2` and `1`. If `x v > 1`, then `x` is the midpoint of
the two fractional vertex covers obtained by changing `x v` by `± (x v − 1)`. Route for attainment:
the fractional vertex covers with values at most `1` form a nonempty compact convex set `K`, and
for `w ≥ 0` replacing every value above `1` by `1` gives a point of `K` of no larger weight, so a
minimizer over `K` is a minimizer over all fractional vertex covers. The weight attains its
minimum on `K`, the minimizers form an extreme subset of `K`, which has an extreme point, and that
point is an extreme point of `K`. The perturbation `x ± ε d` of the argument for half-integrality
stays in `K`, because `h(t) ≤ 1 − t`, so the extreme points of `K` have values in
`{0, 1/2, 1}`.

**Checks.**
- Triangle: the extreme points are `(1/2, 1/2, 1/2)` and the three permutations of `(1, 1, 0)`.
  With unit weights the least fractional weight is `3/2`, attained at the first, while every
  vertex cover has two vertices; rounding selects all three vertices, of weight `3 = 2 * (3/2)`.
- Single edge: the extreme points are `(1, 0)` and `(0, 1)`. The point `(1/2, 1/2)` is a
  fractional vertex cover with values in `{0, 1/2, 1}` and is not extreme, so the converse of
  half-integrality fails.
- Graph without edges: the set is the nonnegative orthant and its only extreme point is `0`.
- Attainment fails for a negative weight: on one vertex without edges and `w = −1` the weight is
  unbounded below.

*Needs:* Mathlib `Set.extremePoints`, `mem_extremePoints`, `IsCompact.exists_isMinOn`,
`IsExposed.isExtreme`, `IsExtreme.extremePoints_subset_extremePoints`,
`IsCompact.extremePoints_nonempty`; 1.3 and 1.4 for the last two bullets.

### 2.3 Persistency

- (`exists_isVertexCover_between`) Let `G` be a finite graph, `w : V → ℝ`, and let
  `x ∈ fractionalVertexCovers G` minimize `∑ v, w v * x v` over `fractionalVertexCovers G`. Then
  there is a vertex cover `C` whose weight is least among all vertex covers, with
  `{v | 1/2 < x v} ⊆ C ⊆ {v | 1/2 ≤ x v}`. The theorem is due to Nemhauser and Trotter. (Proved
  here.)

The minimizer need not be an extreme point. No sign condition on `w` is stated because a minimizer
exists only if `w ≥ 0`: raising one coordinate of a fractional vertex cover gives another.

Route: let `D` be a vertex cover of least weight, `P = {v | 1/2 < x v}` and
`R = {v | x v < 1/2}`, and put `C = (D \ R) ∪ P`. It is a vertex cover, because an edge with an
end in `R` has its other end in `P`. If `w(P \ D) > w(R ∩ D)`, lowering `x` by a small `ε` on
`P \ D` and raising it by `ε` on `R ∩ D` would give a fractional vertex cover of smaller weight:
an edge with an end `u ∈ P \ D` has its other end in `D`, and that end either lies in `R ∩ D` or
has value at least `1/2`. So `w(C) ≤ w(D)`.

**Checks.**
- Star with three leaves and unit weights: the only minimizer is `1` at the centre and `0` at
  the leaves, and the centre alone is the vertex cover of least weight.
- Single edge `uv` with unit weights: `x = (7/10, 3/10)` is a minimizer that is not extreme, and
  the statement gives the cover `{u}`.
- Without minimality the statement fails: on a single edge `uv` with `w u = 1`, `w v = 2` the
  point `x = (0, 1)` is a fractional vertex cover, `{u}` is the only vertex cover of least weight,
  and it does not contain `v`.
- Without feasibility it fails as well: for `w ≥ 0` the point `x = 0` has weight at most that of
  every fractional vertex cover, and the empty set is not a vertex cover of a graph with an edge.

*Needs:* Mathlib `SimpleGraph.IsVertexCover`; 2.2 for the definition.

### 2.4 Locally optimal cuts

For `c : Sym2 V → ℝ` and `S : Set V` define `cutWeight G c S`, the sum of `c` over the edges of
`G` with exactly one end in `S`.

- (`sum_le_two_mul_cutWeight`) Let `G` be a finite graph. If
  `cutWeight G c (S ∆ {v}) ≤ cutWeight G c S` for every vertex `v`, then
  `∑ e ∈ G.edgeSet, c e ≤ 2 * cutWeight G c S`. The weights may have either sign. For `c = 1`: a
  cut that no single move enlarges contains at least half of the edges. (Proved here.)

Route: the hypothesis at `v` says that the edges at `v` inside its side weigh at most as much as
the edges at `v` across the cut; summing over `v` counts every edge twice on each side of the
inequality.

**Checks.**
- Four-cycle `a b c d` with `S = {a, b}`: every vertex has one neighbour on each side, so no
  single move changes the cut, which has two of the four edges, while `{a, c}` cuts all four. Both
  the bound and the comparison with the largest cut are attained.
- Triangle: `S = ∅` is not locally optimal, a single vertex is, with two of the three edges.
- One edge of weight `−1`: `S = ∅` is locally optimal with cut weight `0`, and `−1 ≤ 0`.

*Needs:* Mathlib `symmDiff` on sets, `finsum`.

### Examples

- The complete bipartite graph with `2m` vertices on each side and `S` consisting of `m` vertices
  of each side: a locally optimal cut with exactly half of the edges.
- The complete graph on `n ≥ 1` vertices: the constant `1/2` is a fractional vertex cover of weight
  `n/2` for unit weights and the vertex cover number is `n − 1`.

### Dependencies

Mathlib: matchings, vertex covers, Zorn's lemma, extreme points, compactness. Layer 1 (1.3 and
1.4) for the rounding and pricing corollaries of 2.2; the other statements of this layer do not
use Layer 1.

## Layer 3: tours and centres in pseudometric spaces

Throughout this layer `V` carries `[PseudoMetricSpace V]`.

### 3.1 Lengths

Define `tourLength l` for a list `l` of points, the sum of the distances from each entry to the
next and from the last to the first: `(List.zipWith dist l (l.rotate 1)).sum`. Define
`edgeLength e` for `e : Sym2 V`, the distance between the two ends of `e`, and `graphLength H` for
a graph `H` on `V`, the sum of `edgeLength` over the edges of `H`.

- `tourLength l ≥ 0`; it is `0` for lists with at most one entry and `2 * dist a b` for `[a, b]`.
- `tourLength` is invariant under rotation and reversal of the list.
- If `V` has at least three points and `l` is a tour, the closed walk of the complete graph
  through the entries of `l` is a Hamiltonian cycle in the sense of
  `SimpleGraph.Walk.IsHamiltonianCycle`, and `tourLength l` is the sum of `edgeLength` over its
  edges.
- For a closed walk `p` of the complete graph on `V`, `tourLength p.support` is the sum of
  `edgeLength` over `p.edges`, the first and the last entry of `p.support` being the same point.

**Checks.**
- Three points at pairwise distance `1`: `[a, b, c]` has length `3`, `[a, b]` has length `2`,
  `[a]` and the empty list have length `0`. A definition without the closing step would give `2`
  for `[a, b, c]`.
- For the walk from `a` to `b` and back, `p.support = [a, b, a]` and the length is
  `dist a b + dist b a + dist a a`, twice the length of the edge.

*Needs:* Mathlib `PseudoMetricSpace`, `dist_comm`, `dist_self`, `dist_nonneg`, `List.rotate`,
`List.zipWith`, `Sym2.lift`, `finsum`, `SimpleGraph.Walk.support`, `SimpleGraph.Walk.edges`,
`SimpleGraph.Walk.IsHamiltonianCycle`. (Proved here.)

### 3.2 Shortcutting

- (`tourLength_le_of_sublist`) If `l'` is a sublist of `l`, then
  `tourLength l' ≤ tourLength l` (Williamson and Shmoys, §2.4, the argument before Theorem 2.12,
  pp. 45–46).

Route: removing one entry replaces two consecutive steps by one, which is no longer by the
triangle inequality; a list with one entry has length `0`.

**Checks.**
- Points `0, 1, 2, 3` of the real line: `[0, 2, 1, 3]` has length `8` and its sublist `[0, 2, 3]`
  has length `6`. The list `[0, 1, 2, 3]` has the same entries as `[0, 2, 1, 3]` and length `6`,
  so the statement is about sublists and not about subsets in any order.

*Needs:* Mathlib `dist_triangle`, `List.Sublist`; 3.1.

### 3.3 Trees and matchings below a tour

Let `l` be a list that contains every point of `V`; then `V` is finite.

- (`exists_isTree_graphLength_le_tourLength`) If `V` is nonempty, some tree `T` on `V` has
  `graphLength T ≤ tourLength l` (Williamson and Shmoys, Lemma 2.10, p. 44). Hence a spanning tree
  of least length is at most as long as `l`.
- (`exists_isMatching_two_mul_graphLength_le_tourLength`) If `U : Set V` has an even number of
  points, some matching `M` of the complete graph on `V` with `M.verts = U` has
  `2 * graphLength M.spanningCoe ≤ tourLength l` (Williamson and Shmoys, proof of Theorem 2.13,
  pp. 46–47). Hence a matching of least length among those with vertex set `U` is at most half
  as long as `l`.

Route: by 3.2 pass to a tour. For the tree take the path through the tour without its closing
step. For the matching pass, by 3.2 again, to the sublist of the points of `U`; its steps
alternate between two perfect matchings of `U` whose lengths sum to its length.

**Checks.**
- Points `0, 1, 2, 3` of the real line. Every tour has length at least `6`. The path
  `0 1 2 3` is a spanning tree of length `3`; the spanning tree with edges `03`, `02`, `13` has
  length `7`, so the statement is not about every tree. For `U` all four points the matching
  `{01, 23}` has length `2`, and `{03, 12}` has length `4`, more than half of `6`. For
  `U = {0, 3}` the only matching has length `3`, exactly half.
- A set with an odd number of points is the vertex set of no matching.
- For the empty type the list `[]` contains every point and there is no tree, so the first
  statement needs a point.

*Needs:* Mathlib `SimpleGraph.IsTree`, `SimpleGraph.Subgraph.IsMatching`,
`SimpleGraph.Subgraph.spanningCoe`, `Set.ncard`; 3.1, 3.2.

### 3.4 Tours from trees

Let `V` be finite and `T` a tree on `V`.

- For every point `a` there is a closed walk of `T` from `a` to `a` that traverses every edge of
  `T` exactly twice; it visits every point.
- *Doubling* (`exists_tour_le_two_mul_graphLength`). There is a tour `l` with
  `tourLength l ≤ 2 * graphLength T` (Williamson and Shmoys, Theorem 2.12, p. 46; Erickson,
  Theorem J.5). More precisely, every sublist of the support of a walk as in the first bullet has
  length at most `2 * graphLength T`, by 3.1 and 3.2, and the list of first occurrences is a tour.
- The number of vertices of odd degree of `T` is even. Let `M` be a matching of the complete graph
  on `V` whose vertex set is the set of vertices of odd degree of `T`. For every point `a` there is
  a closed walk of the complete graph from `a` to `a` in which every unordered pair `e` occurs as
  an edge as many times as it is an edge of `T` plus as it is an edge of `M` (`0`, `1` or `2`
  times).
- *Tree plus matching* (`exists_tour_le_graphLength_add`). For `T` and `M` as in the previous
  bullet there is a tour `l` with `tourLength l ≤ graphLength T + graphLength M.spanningCoe`
  (Williamson and Shmoys, Theorem 2.13, p. 46; Erickson, Theorem J.6). More precisely, every
  sublist of the support of a walk as in the previous bullet has at most this length. The method
  is due to Christofides and to Serdyukov.
- *The factors `2` and `3/2`.* If `T` has least length among the trees on `V`, every list `l` of
  the second bullet satisfies `tourLength l ≤ 2 * tourLength l'` for every list `l'` containing
  every point. If moreover `M` has least length among the matchings with its vertex set, every
  list `l` of the fourth bullet satisfies `tourLength l ≤ 3/2 * tourLength l'`. These follow from
  3.3.

Route for the walks: the first by induction on the tree, removing a leaf. For the second, the
multiset of edges of `T` and `M` has even degree at every vertex and is connected through `T`;
split off closed trails and splice them along `T`, as in the proof of Euler's theorem, with the
pairs that are edges of both `T` and `M` counted twice.

**Checks.**
- A centre `z` at distance `1` from three points that are at pairwise distance `2`: the star `T`
  has length `3`, every tour has length `6`, and doubling attains `2 * graphLength T`.
- Points `0, 1, 2, 3` of the real line with the path `T`: its vertices of odd degree are `0` and
  `3`, `M` is the edge `03`, and `T` with `M` is a cycle of length `6 = 3 + 3`.
- Two points at distance `1`: `T` is the edge, both points have odd degree, `M` is the same edge,
  the closed walk traverses it twice, and the tour `[a, b]` has length `2 = 1 + 1`. An encoding of
  `T` with `M` as a simple graph would lose the second copy of the edge.
- One point: `T` has no edge, `M` has no vertex, and the tour `[a]` has length `0`.
- The path on the integers is a tree and no list contains every integer, so finiteness is needed.

*Needs:* Mathlib `SimpleGraph.IsTree`, `SimpleGraph.Walk.support`, `SimpleGraph.Walk.edges`,
`SimpleGraph.even_card_odd_degree_vertices`, `SimpleGraph.neighborSet`, `Set.ncard`; 3.1 and
3.2, and 3.3 for the last bullet.

### 3.5 Farthest-first sequences

Define `IsFarthestFirst l` for a list `l` of points: for every position `i ≥ 1` of `l`, with `p`
the list of the entries before position `i` and `z` the entry at position `i`, every point `x`
has an entry `c` of `p` with `dist x c ≤ dist z c'` for every entry `c'` of `p`. That is, the
distance from `z` to the set of earlier entries is the largest possible. The first entry is
arbitrary.

- (`IsFarthestFirst.exists_dist_le_two_mul`) Let `l` be farthest-first, `C` a finite set of at
  most `l.length` points and `r` a real number such that every point is within distance `r` of a
  point of `C`. Then every point is within distance `2 * r` of an entry of `l` (Williamson and
  Shmoys, Theorem 2.3, p. 39; Erickson, Theorem J.7). No finiteness of `V` is assumed. The method
  is due to Gonzalez.

Route: if some `x` were farther than `2r` from every entry, the entries together with `x` would be
`l.length + 1` points at pairwise distances greater than `2r`, and two of them would be within
`r` of the same point of `C`.

**Checks.**
- Points `0, 1, 2` of the real line: `[0]` is farthest-first and covers with radius `2`, while
  `C = {1}` covers with radius `1`; the factor `2` is attained. `[0, 2]` is farthest-first and
  `[0, 1]` is not.
- A list with repeated entries can be farthest-first, for instance when it is longer than the
  number of points.
- Without the restriction to positions `i ≥ 1` no nonempty list would satisfy the condition, since
  the list of entries before the first is empty.

*Needs:* Mathlib `dist_triangle`, `dist_comm`, `List.take`.

### Examples

- The points `0, 1, …, n − 1` of the real line: every tour has length at least `2 (n − 1)`, and
  the tour in increasing order attains it; the path is the spanning tree of least length `n − 1`.
- A two-point space with distance `0`: every statement of the layer holds with all lengths `0`.

### Dependencies

Mathlib: pseudometric spaces, lists, trees, matchings and walks of simple graphs. No other layer.

## Layer 4: schedules and packings

### 4.1 Loads and list schedules

For `p : ι → ℝ` on a finite type and `σ : ι → κ` define `load p σ i`, the sum of `p j` over the
`j` with `σ j = i`. For `p : Fin n → ℝ`, `σ : Fin n → Fin m` and `m ≥ 1` define `makespan p σ`,
the largest load of a machine. Define `IsListSchedule p σ`: for every job `j` and every machine
`i`, the sum of `p k` over the jobs `k < j` with `σ k = σ j` is at most the sum over the jobs
`k < j` with `σ k = i`. That is, each job is placed on a machine that is least loaded by the
earlier jobs.

- Every `p` has a list schedule on `m ≥ 1` machines, and every initial segment of a list schedule
  is a list schedule of the initial segment of `p`.
- For `p ≥ 0` and every assignment `τ` on `m ≥ 1` machines, `makespan p τ` is at least
  `(∑ j, p j) / m` and at least every `p j`.

**Checks.**
- `p = (1, 1, 2)` and `m = 2`: in a list schedule the two unit jobs go to different machines, so
  the makespan is `3`; the assignment that puts them on one machine has makespan `2` and is not a
  list schedule.
- Without jobs the makespan is `0` on every `m ≥ 1`.

*Needs:* Mathlib `Finset.sup'`. (Proved here.)

### 4.2 Bounds for list schedules

Let `m ≥ 1`, `p : Fin n → ℝ` with `p j ≥ 0`, `σ` a list schedule and `τ` any assignment.

- If `n ≥ 1`, `makespan p σ ≤ (∑ j, p j) / m + (1 − 1/m) * p j₀` for some job `j₀`.
- (`IsListSchedule.makespan_le`) `makespan p σ ≤ (2 − 1/m) * makespan p τ` (Williamson and Shmoys,
  §2.3, the refinement after Theorem 2.5, pp. 41–42, and Theorem 2.6). The bound is Graham's.
- *Tightness.* For `m ≥ 1` take `m (m − 1)` jobs with `p = 1` followed by one job with `p = m`.
  Every list schedule has makespan `2m − 1`, and the assignment that gives the last job a machine
  of its own and `m` unit jobs to each other machine has makespan `m`.
- (`IsListSchedule.makespan_le_of_antitone`) If moreover `p` is nonincreasing,
  `makespan p σ ≤ (4/3 − 1/(3m)) * makespan p τ`. The constant is Graham's; Williamson and Shmoys,
  Theorem 2.7 and Lemma 2.8, p. 42, give the argument with the constant `4/3`.
- *Tightness.* For `m ≥ 1` take the processing times `2m − 1, 2m − 1, 2m − 2, 2m − 2, …,
  m + 1, m + 1, m, m, m`. Every list schedule has makespan `4m − 1`, and some assignment has
  makespan `3m`.

Route for the first two: let `j₀` be the last job on a machine of largest load. When it was
placed, every machine had load at least that machine's load from the earlier jobs, so that load
is at most `(∑ j, p j − p j₀) / m`. Route for the last bound: it suffices to treat lists in which
a last job on a machine of largest load is the last job `j₀` of the list, by passing to an
initial segment. If `3 * p j₀ ≤ makespan p τ`, the first bullet gives the bound. Otherwise every
job is longer than a third of `makespan p τ`, so `τ` puts at most two jobs on each machine, and
in that case a list schedule of a nonincreasing list has the least makespan.

**Checks.**
- `m = 1`: both factors are `1` and every assignment has makespan `∑ j, p j`.
- `m = 2`: `p = (1, 1, 2)` gives `3 = (2 − 1/2) * 2`, and `p = (3, 3, 2, 2, 2)` gives `7` for
  every list schedule against `6`, with `7/6 = 4/3 − 1/6`.
- Negative times break the first bound: `p = (−2, −2)`, `m = 2`. Placing both jobs on the first
  machine is a list schedule, since after the first job that machine is the least loaded; its
  makespan is `0`, the load of the idle machine, and the assignment to two machines has makespan
  `−2`.
- The order matters: `p = (1, 1, 2)` gives makespan `3` and the nonincreasing order `(2, 1, 1)`
  gives `2`.

*Needs:* Mathlib `Antitone`; 4.1. (The two tightness families are proved here.)

### 4.3 Bin packings

A packing of items with sizes `s : ι → ℝ` into `k` bins of capacity `1` is a map `f : ι → Fin k`
with `load s f b ≤ 1` for every bin `b`.

- If `f` is a packing into `k ≥ 2` bins and `load s f b + load s f b' > 1` for all consecutive
  bins `b`, `b'`, every bin has positive load and the integer part of `k/2` is less than
  `∑ i, s i`.
- (`succ_le_two_mul_of_adjacent_load`) Let `ι` be nonempty, `f` a packing into `k` bins with
  `load s f b + load s f b' > 1` for all consecutive bins `b`, `b'`, and `g` a packing into `k'`
  bins. Then `k + 1 ≤ 2 * k'`. No sign condition on the sizes is needed. The pairing of
  consecutive bins is the argument of Williamson and Shmoys, §3.3, pp. 73–74, which states the
  weaker `k ≤ 2k' + 1`. (Proved here.)
- The hypothesis holds when no two bins of `f` have contents that fit into one bin. For
  nonnegative sizes it also holds, with the bins numbered in the order in which they are opened,
  for every packing built item by item in which a new bin is opened only for an item that does
  not fit into the bin opened last.
- *Tightness.* For `k' ≥ 1` take `k' (2k' − 1)` items of size `1/(2k' − 1)`. Putting `k'` items in
  each of `2k' − 1` bins gives loads `k'/(2k' − 1) > 1/2`, so no two bins can be merged, while
  `2k' − 1` items fill a bin exactly and `k'` bins suffice.

Route: pair the bins `(1, 2), (3, 4), …`; each pair has load greater than `1`, a bin left over
has positive load, and `k'` bins hold a total size of at most `k'`.

**Checks.**
- Six items of size `1/3`, two in each of three bins: consecutive loads sum to `4/3`, two bins
  suffice, and `3 + 1 = 2 * 2`.
- Without items `k = 1` and `k' = 0` satisfy all other hypotheses and `2 ≤ 0` fails.
- If `f` may overfill bins the statement fails: sizes `−1, 5/2, −1` in three bins have
  consecutive loads summing to `3/2`, and one bin holds all three items.

*Needs:* 4.1 for `load`.

### 4.4 The prefix bound for knapsacks

Let `v, w : Fin n → ℝ` be nonnegative values and weights, listed so that
`v j * w i ≤ v i * w j` for all `i < j`: the value per unit of weight is nonincreasing, written
without division and for all pairs.

- (`sum_value_le_sum_prefix`) If `A` is a set of items and `k : ℕ` with
  `∑ i ∈ A, w i < ∑ i < k, w i`, then `∑ i ∈ A, v i ≤ ∑ i < k, v i`. (Proved here.)
- *Knapsack.* Let `W` be a capacity and `k < n` such that the first `k` items weigh at most `W`
  and the first `k + 1` items weigh more than `W`. Every set of items of weight at most `W` has
  value at most `∑ i < k, v i + v k`. If item `k` alone weighs at most `W`, the more valuable of
  the first `k` items together and item `k` alone is a set of weight at most `W` and of at least
  half the value of every such set (Williamson and Shmoys, Exercise 3.1, p. 77, which takes the
  most valuable single item). If all items together weigh at most `W`, they are the most valuable
  such set.

Route: compare `A` with the set `P` of the first `k` items. Items of `A \ P` come after those of
`P \ A`, so summing the order condition over the pairs gives
`v(A \ P) * w(P \ A) ≤ v(P \ A) * w(A \ P)`; and `0 ≤ w(A \ P) < w(P \ A)`.

**Checks.**
- Items `(v, w) = (3, 1), (4, 2), (5, 3)` and `W = 4`: `k = 2`, the first two items are worth `7`,
  the best set of weight at most `4` is the first and third with value `8 ≤ 7 + 5`.
- The strict inequality is needed: for `(1, 0), (5, 0)`, which satisfy the order condition,
  `A = {second}` weighs `0`, as much as the first item, and is worth more.
- The order condition for consecutive items only is not enough: `(1, 2), (0, 0), (5, 1)` satisfies
  it, and the third item weighs less than the first and is worth more.
- Items `(2, 1), (W, W)` with capacity `W > 4`: here `k = 1`, the first item is worth `2`, less
  than half of the value `W` of the second, so the single item cannot be dropped from the
  knapsack statement.
- Signs are needed: for the single item `(−2, 1)` the empty set weighs less and is worth more; for
  `(1, −2)` and `k = 0` the item weighs less than nothing and is worth more.

*Needs:* Mathlib `Finset.sum`.

### Examples

- The two tightness families of 4.2 for `m = 1, 2, 3, 4`.
- The tightness family of 4.3 for `k' = 1, 2, 3`.

### Dependencies

Mathlib: finite sums and `Finset.sup'`. No other layer.

## Scope and ownership

This roadmap owns the definitions and theorems stated above: fractional covers of a set system,
greedy sequences with the harmonic bound, rounding by frequency and pricing; the comparison of
matchings with vertex covers in arbitrary graphs, the fractional vertex cover polyhedron with
half-integrality and persistency, and locally optimal cuts; tour lengths, shortcutting, the tree
and matching bounds, tours from trees, and farthest-first sequences; list schedules with both of
Graham's bounds, the bound for bin packings and the prefix bound for knapsacks.

Already in the libraries and therefore not targets:

- Vertex covers and the vertex cover number of a simple graph with their basic properties
  (`SimpleGraph.IsVertexCover`, `SimpleGraph.vertexCoverNum`,
  `SimpleGraph.IsVertexCover.vertexCoverNum_le`, `SimpleGraph.vertexCoverNum_exists`).
- Matchings of simple graphs (`SimpleGraph.Subgraph.IsMatching`,
  `SimpleGraph.Subgraph.IsPerfectMatching`) and Hall's theorem for bipartite simple graphs
  (`SimpleGraph.exists_isMatching_of_forall_ncard_le`).
- Extreme points, the existence of extreme points of compact sets, and the extreme value theorem
  (`Set.extremePoints`, `IsCompact.extremePoints_nonempty`, `IsCompact.exists_isMinOn`).
- Harmonic numbers with the logarithmic bound `harmonic_le_one_add_log`, which turns the factor
  `H_d` of 1.2 into `1 + log d`.

Left to other roadmaps:

- GraphConnectivityAndFlows 6.7 owns the theorem of Kőnig for bipartite multigraphs with vertex
  capacities, including the inequality between matchings and covers in that setting, and its 6.8
  owns the capacitated theorem of Hall. Section 2.1 above concerns arbitrary simple graphs with
  unit capacities, where the two numbers differ by a factor of up to `2`, and proves no equality.
- MarkovDecisionProcesses, Layer 5, owns the pair of linear programs of a discounted decision
  process. The programs above are covering relaxations, and the weak duality of 1.1 is proved for
  them directly.

No Tau Ceti module and no roadmap is a supplier.

Outside the scope: implementations of any of the classical methods, running times, data structures
and machine models; complexity classes and the hardness of approximation; approximation schemes;
randomized rounding and semidefinite relaxations; the maximization of submodular functions, the
maximum coverage problem included; general linear programming duality; the theory of minimum
spanning trees beyond the comparison of 3.3, and Euler's theorem for simple graphs; minimum-weight
perfect matchings as an optimization problem; the sharper constants known for particular bin
packing rules; scheduling with precedence constraints, release dates or unrelated machines; the
asymmetric and the non-metric travelling salesman problems; stable matchings.

## Exact supplier contracts

### From Mathlib

- `Mathlib/Combinatorics/SimpleGraph/Matching.lean`: `SimpleGraph.Subgraph.IsMatching` (every
  vertex of the subgraph has exactly one neighbour in it);
  `SimpleGraph.Subgraph.IsMatching.subgraphOfAdj` (the subgraph of a single edge is a matching);
  `SimpleGraph.Subgraph.IsMatching.sup` (the supremum of two matchings with disjoint supports is a
  matching); `SimpleGraph.Subgraph.IsMatching.toEdge.surjective` (the map from matched vertices to
  edges of the matching is surjective); `SimpleGraph.Subgraph.IsMatching.strictMonoOn_edgeSet`
  (the edge set is strictly monotone on matchings).
- `Mathlib/Combinatorics/SimpleGraph/VertexCover.lean`: `SimpleGraph.IsVertexCover G c` (every
  edge has an end in `c : Set V`); `SimpleGraph.vertexCoverNum G : ℕ∞` (the infimum of `encard`
  over the vertex covers); `SimpleGraph.IsVertexCover.vertexCoverNum_le`
  (`G.vertexCoverNum ≤ c.encard` for a vertex cover `c`); `SimpleGraph.vertexCoverNum_exists`
  (some vertex cover has `encard` equal to the vertex cover number, with no hypothesis).
- `Mathlib/Combinatorics/SimpleGraph/Subgraph.lean`: `SimpleGraph.Subgraph`, with `verts`,
  `edgeSet` and `SimpleGraph.Subgraph.spanningCoe` (the graph on all of `V` with the edges of the
  subgraph). `Mathlib/Combinatorics/SimpleGraph/Basic.lean`: `SimpleGraph.neighborSet`.
- `Mathlib/Combinatorics/SimpleGraph/Acyclic.lean`: `SimpleGraph.IsTree` (connected and acyclic; a
  tree on `V` has a vertex, since connected graphs do).
- `Mathlib/Combinatorics/SimpleGraph/Walk/Basic.lean`: `SimpleGraph.Walk.support` (the list of
  vertices of a walk, both ends included) and `SimpleGraph.Walk.edges` (its list of edges).
  `Mathlib/Combinatorics/SimpleGraph/Hamiltonian.lean`: `SimpleGraph.Walk.IsHamiltonianCycle` (for
  `[DecidableEq V]`: a cycle whose tail visits every vertex exactly once).
- `Mathlib/Combinatorics/SimpleGraph/DegreeSum.lean`: `SimpleGraph.even_card_odd_degree_vertices`
  (for `[Fintype V]` and `[DecidableRel G.Adj]`, the number of vertices of odd degree is even).
- `Mathlib/Analysis/Convex/Extreme.lean`: `Set.extremePoints 𝕜 A`; `mem_extremePoints` (a point of
  `A` is extreme when it lies in no open segment between two points of `A` other than the
  degenerate one); `IsExtreme.extremePoints_subset_extremePoints` (the extreme points of an
  extreme subset are extreme points of the set). `Mathlib/Analysis/Convex/Exposed.lean`:
  `IsExposed.isExtreme` (the set of maximizers of a continuous linear functional on `A` is an
  extreme subset). `Mathlib/Analysis/Convex/KreinMilman.lean`:
  `IsCompact.extremePoints_nonempty` (a nonempty compact subset of a Hausdorff locally convex real
  topological vector space has an extreme point).
- `Mathlib/Topology/Order/Compact.lean`: `IsCompact.exists_isMinOn` (a function that is
  continuous on a nonempty compact set attains its minimum on it).
- `Mathlib/NumberTheory/Harmonic/Defs.lean`: `harmonic : ℕ → ℚ`, the sum of `1/(i + 1)` for
  `i < n`.
- `Mathlib/Topology/MetricSpace/Pseudo/Defs.lean`: `PseudoMetricSpace`, `dist_self`, `dist_comm`,
  `dist_triangle` (`dist x z ≤ dist x y + dist y z`), `dist_nonneg`.
- `Mathlib/Data/Sym/Sym2.lean`: `Sym2.lift` (a symmetric function of two arguments as a function
  on unordered pairs). `Mathlib/Order/SymmDiff.lean`: `symmDiff`.
  `Mathlib/Data/Set/Card.lean`: `Set.encard`, `Set.ncard`.
  `Mathlib/Algebra/BigOperators/Finprod.lean`: `finsum`.
  `Mathlib/Algebra/BigOperators/Group/Finset/Defs.lean`: `Finset.sum`.
  `Mathlib/Data/Finset/Lattice/Fold.lean`: `Finset.sup'`. `Mathlib/Order/Defs/Unbundled.lean`:
  `Maximal`. `Mathlib/Order/Zorn.lean`: `zorn_le₀` (a set in which every chain has an upper bound
  in the set has a maximal element). `Mathlib/Order/Monotone/Defs.lean`: `Antitone`.
- Lists, from Lean's core library and Batteries, both imported by Mathlib: `List.Sublist`,
  `List.zipWith`, `List.take`, and `List.rotate` (`l.rotate 1` moves the first entry to the end).

## References

- David P. Williamson and David B. Shmoys, *The Design of Approximation Algorithms*, Cambridge
  University Press, 2011; the electronic web edition of 2011 from `designofapproxalgs.com`, whose
  page numbers are used above. Chapters 1, 2, 3 and 7.
- Jeff Erickson, *Algorithms*, extra lecture notes, "J. Approximation Algorithms", the version
  dated 2018 on the author's site `jeffe.cs.illinois.edu/teaching/algorithms`.
- Alexander Schrijver, *A Course in Combinatorial Optimization*, lecture notes, CWI and University
  of Amsterdam, version of March 23, 2017, §3.1; available from the author's page at CWI.

The following original papers are named for attribution and were not consulted: D. S. Johnson
(1974) and L. Lovász (1975) for the greedy bound with unit costs; V. Chvátal (1979) for costs and
the comparison with fractional covers; D. S. Hochbaum (1982) for rounding by frequency;
R. Bar-Yehuda and S. Even (1981) for pricing; G. L. Nemhauser and L. E. Trotter (1975) for
half-integrality and persistency; N. Christofides (1976) and A. I. Serdyukov (1978) for the tree
with a matching; T. F. Gonzalez (1985) for farthest-first sequences; R. L. Graham (1966, 1969) for
list schedules.
