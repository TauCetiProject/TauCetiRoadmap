# Roadmap: hamiltonian cycles

**Summary.** This roadmap develops the classical sufficient conditions for a finite simple graph to
have a Hamilton cycle, a cycle through every vertex, together with the necessary conditions that
show where they stop, and the two basic theorems on spanning paths and cycles of tournaments.
Graphs are finite and simple; a graph on one vertex counts as Hamiltonian and graphs on zero or two
vertices do not, so the theorems on cycles assume at least three vertices. Every target is a
statement about a graph or a tournament, its degrees, its connectivity or its independent sets; no
procedure for finding a Hamilton cycle is specified.

The headline theorems are these.

- *The closure theorem of Bondy and Chvátal.* If two nonadjacent vertices of a graph on `n`
  vertices have degree sum at least `n`, adding the edge between them does not change whether the
  graph is Hamiltonian. Joining such pairs until none is left gives a graph, the closure, that does
  not depend on the order of the additions, and a graph is Hamiltonian if and only if its closure
  is.
- *Chvátal's theorem and its sharpness.* A graph on `n ≥ 3` vertices with degrees `d₁ ≤ ⋯ ≤ dₙ` is
  Hamiltonian if no `i` with `1 ≤ i < n/2` has both `dᵢ ≤ i` and `dₙ₋ᵢ < n − i`. Conversely, every
  non-Hamiltonian graph on `n ≥ 3` vertices has its degrees dominated, vertex by vertex under some
  bijection, by those of one of the explicit non-Hamiltonian graphs `C(m, n)` with `1 ≤ m < n/2`.
  Dirac's theorem (minimum degree at least `n/2`) and Ore's theorem (degree sum at least `n` over
  nonadjacent pairs) are special cases, and a graph on `n ≥ 3` vertices with at least
  `binom(n − 1, 2) + 2` edges is Hamiltonian.
- *The Chvátal–Erdős theorem.* A graph on at least three vertices whose independence number is at
  most its vertex connectivity is Hamiltonian.
- *Rédei's and Camion's theorems.* Every finite tournament has an odd number of spanning paths, so
  at least one; a tournament on at least two vertices has a spanning cycle if and only if it is
  strongly connected.

The roadmap builds on Mathlib's simple graphs, which supply Hamiltonian paths, Hamiltonian cycles
and Hamiltonian graphs with their basic properties, independent sets and the independence number,
and digraphs. Tau Ceti supplies vertex connectivity, the notion that GraphConnectivityAndFlows
develops; nothing here restates a connectivity theorem, and the theorem of that roadmap on cycles
through prescribed vertices is a different statement from the theorems on spanning cycles here.

## How to read the build

Layer 1 below gives the necessary conditions: toughness for cycles and paths, 2-connectivity, and
the Petersen graph as a 1-tough graph that is not Hamiltonian. Layer 2 proves the closure lemma,
defines the closure and shows that Hamiltonicity passes to and from it; it depends on no other
layer. Layer 3 depends on Layer 2 and derives from it Ore's and Dirac's theorems, the form of Ore's
theorem for Hamiltonian paths, Chvátal's and Pósa's degree-sequence conditions and the edge-count
theorem; its sharpness results use the toughness of Layer 1. Layer 4 proves the Chvátal–Erdős
theorem and its form for paths and depends on no other layer. Layer 5 treats tournaments and depends
on no other layer. Within a layer the sections are in build order.

## Conventions

- **Graphs.** A graph is a Mathlib `SimpleGraph V` with `[Fintype V]` and `[DecidableEq V]`, and
  `n` is `Fintype.card V`. Degrees are `SimpleGraph.degree`, which needs `[DecidableRel G.Adj]`;
  where a statement ranges over all graphs on `V`, as in the definition of the closure in Layer 2,
  the degrees are taken with classical decidability, and the degree of a vertex does not depend on
  the instance. Adding the edge `uv` is `G ⊔ SimpleGraph.edge u v`. Deleting a set `S` of vertices
  is `G.induce (↑S)ᶜ`, and its number of connected components is
  `Nat.card (G.induce (↑S)ᶜ).ConnectedComponent`; deleting every vertex leaves no component.
- **Hamiltonicity.** A Hamiltonian path is a walk `p : G.Walk a b` with
  `SimpleGraph.Walk.IsHamiltonian`, which visits every vertex exactly once; a Hamilton cycle is a
  closed walk with `SimpleGraph.Walk.IsHamiltonianCycle`. A graph is Hamiltonian,
  `SimpleGraph.IsHamiltonian`, when it has a Hamilton cycle or exactly one vertex. So the graph on
  one vertex is Hamiltonian, the empty graph on no vertices is not, and no graph on two vertices
  is, since a cycle has at least three vertices. Every theorem below that concludes Hamiltonicity
  assumes `3 ≤ n` unless it is stated otherwise; a theorem that concludes a Hamiltonian path
  assumes a nonempty vertex type, since a walk has a first vertex.
- **Arithmetic.** Conditions are written without natural-number subtraction or division where the
  rounding would matter: Dirac's bound `deg v ≥ n/2` is `n ≤ 2 * deg v`, a bound `deg v ≥ n − i` is
  `n ≤ deg v + i`, and `i < n/2` is `2 * i < n`. The one subtraction left, `binom(n − 1, 2)` with
  `n ≥ 3`, does not truncate.
- **Degree sequences.** The degree sequence of `G` is its list of degrees in nondecreasing order,
  `d₁ ≤ ⋯ ≤ dₙ`. A graph `G` is degree-majorised by a graph `H` on the same number of vertices when
  `dᵢ(G) ≤ dᵢ(H)` for every `i`; this holds exactly when some bijection `e` from the vertices of `G`
  to those of `H` has `deg_G v ≤ deg_H (e v)` for every `v`, which is the form used below, since it
  needs no sorting.
- **Connectivity and independence.** Vertex connectivity is Tau Ceti's
  `SimpleGraph.vertexConnectivity`, valued in `ℕ∞`: on a nonempty finite vertex type, the largest
  `k` such that the graph has more than `k` vertices and stays connected after deleting fewer than
  `k` of them, and `0` on the empty type. The complete graph on `n ≥ 1` vertices has connectivity
  `n − 1`, and a graph that is not connected has connectivity `0`. The independence number is
  Mathlib's `SimpleGraph.indepNum`, valued in `ℕ`; it is a supremum of a set of natural numbers,
  and the finiteness of `V` makes it the largest size of an independent set.
- **Tournaments.** A tournament is a Mathlib `Digraph W` with exactly one arc between any two
  distinct vertices and no loops. The names spanning path and spanning cycle are Moon's; here a
  spanning path is modelled as a list of all vertices without repetition along which consecutive
  vertices are joined by arcs, and a spanning cycle as a cyclic permutation `σ` moving every vertex
  with an arc from each `v` to `σ v`. Strong connectivity is
  `∀ u v, Relation.ReflTransGen T.Adj u v`; by Tau Ceti's `Digraph.isStronglyConnected_iff` this is
  Mathlib's `Quiver.IsStronglyConnected` for the family of arcs of the digraph, the notion that
  GraphConnectivityAndFlows uses for directed graphs.

## Layer 1: necessary conditions

### 1.1 Toughness

Prove `card_connectedComponent_induce_compl_le_of_isHamiltonian`: if `G` is Hamiltonian and `S` is
a nonempty set of vertices, deleting `S` leaves at most `#S` connected components (Bondy–Murty,
Theorem 4.2, p. 53, for nonempty proper subsets; the case `S = V` leaves no component). Prove
`card_connectedComponent_induce_compl_le_of_isHamiltonian_walk`: if `G` has a Hamiltonian path, then
for every set `S` of vertices, deleting `S` leaves at most `#S + 1` components (Bondy–Murty,
Exercise 4.2.3, p. 60, for proper subsets; for `S = V` no component is left). A Hamiltonian path
visits every vertex, so its existence makes the vertex type finite, and this statement assumes no
`Fintype` instance.

Route: deleting a nonempty `S` from a Hamilton cycle leaves at most `#S` segments of the cycle, each
lying in one component of `G − S`, and every component contains one of them; deleting `S` from a
Hamiltonian path leaves at most `#S + 1` segments. On one vertex the only nonempty `S` is `V`.

**Checks.**
- The complete bipartite graph `K_(m, m + 1)` with `m ≥ 1` violates the first inequality: deleting
  the side of size `m` leaves `m + 1` isolated vertices. So it is not Hamiltonian.
- The star with three leaves violates the second: deleting its centre leaves three components, more
  than `1 + 1`. So it has no Hamiltonian path.
- The converse fails. The graph on two adjacent vertices satisfies the first inequality for every
  nonempty `S` and is not Hamiltonian; the Petersen graph of 1.2 is a larger example.
- On one vertex the first inequality reads `0 ≤ 1`, in agreement with the convention that this
  graph is Hamiltonian.

*Needs:* Mathlib `SimpleGraph.IsHamiltonian`, `SimpleGraph.Walk.IsHamiltonian`,
`SimpleGraph.Walk.IsHamiltonianCycle`, `SimpleGraph.induce`, `SimpleGraph.ConnectedComponent`.
(Proved here.)

### 1.2 Two-connectivity and the Petersen graph

- A Hamiltonian graph on at least three vertices is 2-vertex-connected in Tau Ceti's sense,
  `G.IsVertexConnected 2`: it has at least three vertices, is connected and has no cut vertex
  (Bondy–Murty, Exercise 4.2.1 (a), p. 60). By Tau Ceti's `SimpleGraph.isVertexConnected_two_iff`
  this is the case `#S = 1` of 1.1 together with the connectedness of a Hamiltonian graph.
- A bipartite graph on at least two vertices with parts `X` and `Y` covering the vertices and
  `|X| ≠ |Y|` is not Hamiltonian (Bondy–Murty, Exercise 4.2.1 (b), p. 60); this is 1.1 with `S` the
  smaller part, and the graph has no edge when that part is empty. On one vertex the parts `{v}`
  and `∅` differ in size and the graph is Hamiltonian, so the bound on the number of vertices is
  needed.
- The Petersen graph, the graph on the 2-element subsets of a 5-element set in which two subsets
  are adjacent when they are disjoint, is not Hamiltonian, although it is 3-regular,
  3-vertex-connected and 1-tough, so it satisfies every inequality of 1.1. Deleting any one vertex
  leaves a Hamiltonian graph, and it has a Hamiltonian path (Bondy–Murty, p. 54, remark after
  Theorem 4.2, and Exercise 4.2.12, p. 61; Diestel, Chapter 10, Exercise 6, p. 335, asks for a
  1-tough graph that is not Hamiltonian).

Route for the Petersen graph: draw it as an outer 5-cycle, an inner pentagram and five spokes
joining them. A Hamilton cycle passes between the outer and the inner vertices an even number of
times, so it uses two or four spokes, and it uses exactly two of the three edges at each vertex;
each of the two cases is excluded by a short analysis of which outer and inner edges remain.

**Checks.**
- The two triangles sharing one vertex form a graph with minimum degree two that is connected but
  has a cut vertex, so it is not Hamiltonian.
- The graph on one vertex is Hamiltonian and not 2-vertex-connected, since that needs three
  vertices; the hypothesis `3 ≤ n` is needed.
- The Petersen graph: its toughness, the least value of `#S` divided by the number of components of
  `G − S` over the sets `S` that disconnect it, is `4/3`; its connectivity is `3`, its independence
  number `4`; the graph obtained by deleting any vertex is Hamiltonian.

*Needs:* 1.1; Mathlib `SimpleGraph.IsHamiltonian.connected`, `SimpleGraph.IsBipartiteWith`; Tau Ceti
`SimpleGraph.IsVertexConnected`, `SimpleGraph.IsCutVertex`,
`SimpleGraph.isVertexConnected_two_iff`. (Proved here, except as cited.)

### Examples

Complete bipartite graphs `K_(m, m + 1)`, the star with three leaves, two triangles sharing a vertex
and the Petersen graph, with the components left by the sets named in the Checks.

### Dependencies

Mathlib `SimpleGraph.IsHamiltonian`, `SimpleGraph.Walk.IsHamiltonian`,
`SimpleGraph.Walk.IsHamiltonianCycle`, `SimpleGraph.IsHamiltonian.connected`,
`SimpleGraph.induce`, `SimpleGraph.ConnectedComponent`, `SimpleGraph.IsBipartiteWith`; Tau Ceti
`SimpleGraph.IsVertexConnected`, `SimpleGraph.IsCutVertex`,
`SimpleGraph.isVertexConnected_two_iff`. No other layer.

## Layer 2: the Bondy–Chvátal closure

### 2.1 The closure lemma

Prove `isHamiltonian_sup_edge_iff`: if `u ≠ v` are nonadjacent in `G` and
`n ≤ deg u + deg v`, then `G ⊔ edge u v` is Hamiltonian if and only if `G` is (Bondy–Murty,
Lemma 4.4.1, pp. 55–56). No bound on `n` is assumed: for `n ≤ 3` no such pair exists, since each of
two distinct nonadjacent vertices has at most `n − 2` neighbours and `2(n − 2) < n`. The hypotheses
`u ≠ v` and nonadjacency say that an edge is added; without them `G ⊔ edge u v` is `G` and the
statement is empty.

Route: one direction is monotonicity. For the other, a Hamilton cycle of `G + uv` that is not one
of `G` passes through `uv`, so `G` has a Hamiltonian path `u = x₁, …, xₙ = v`. The sets of indices
`i` with `u` adjacent to `xᵢ₊₁` and with `xᵢ` adjacent to `v` lie in `{1, …, n − 1}` and have sizes
`deg u` and `deg v`, so they meet; a common index `i` gives the Hamilton cycle
`x₁ ⋯ xᵢ xₙ xₙ₋₁ ⋯ xᵢ₊₁ x₁` of `G`.

**Checks.**
- The bound `n` cannot be lowered to `n − 1`: the path on three vertices is not Hamiltonian, its
  ends are nonadjacent with degree sum `2 = n − 1`, and adding the edge between them gives a
  triangle.
- In `K_(m, m + 1)` two vertices of the larger side have degree sum `2m = n − 1`; the lemma does
  not apply, and the graph is not Hamiltonian (1.1).

*Needs:* Mathlib `SimpleGraph.IsHamiltonian`, `SimpleGraph.IsHamiltonian.mono`,
`SimpleGraph.Walk.IsHamiltonianCycle`, `SimpleGraph.edge`, `SimpleGraph.degree`. (Proved here,
following the cited route.)

### 2.2 The closure

Define `IsDegreeClosed H`: any two distinct nonadjacent vertices of `H` have degree sum less than
`n`. Define the closure `degreeClosure G` as the infimum of all degree-closed graphs `H` with
`G ≤ H`; the complete graph is one of them. Prove `isLeast_degreeClosure`: the closure is itself
degree-closed, so it is the least degree-closed graph containing `G` (Bondy–Murty, Lemma 4.4.2,
p. 56, where the closure is built by adding edges one at a time).

- `eq_degreeClosure_iff_reflTransGen`, the closure does not depend on the order of the additions:
  call `K'` a one-edge addition to `K` when `K' = K ⊔ edge u v` for distinct nonadjacent vertices
  `u`, `v` of `K` with `n ≤ deg_K u + deg_K v`. A graph `H` is `degreeClosure G` if and only if `H`
  is degree-closed and is reached from `G` by a finite sequence of one-edge additions, which is
  `Relation.ReflTransGen` of that relation. So every sequence of additions that continues until no
  pair is left ends at `degreeClosure G`, and at least one such sequence exists (Bondy–Murty,
  Lemma 4.4.2, p. 56).

Route: by induction along a sequence of additions, every graph of the sequence lies below every
degree-closed `H ≥ G`, since an added pair has degree sum at least `n` in the current graph and so
in `H`, and must be adjacent in `H`. Each addition adds an edge, so a sequence that continues while
a pair is left stops after at most `binom(n, 2)` additions, at a degree-closed graph; that graph is
the least degree-closed graph above `G`, which is therefore the infimum.

**Checks.**
- The 5-cycle is degree-closed (each nonadjacent pair has degree sum `4 < 5`), so it is its own
  closure; it is Hamiltonian, so a Hamiltonian graph need not have complete closure.
- The Petersen graph is its own closure (degree sums `6 < 10`).
- The 5-cycle with one chord has complete closure: its two vertices of degree three are joined by
  the chord, each is nonadjacent to one vertex of degree two, and the sums `3 + 2 = 5` allow those
  two edges; afterwards every remaining pair has degree sum at least `5`.
- With the threshold `n − 1` in place of `n`, the closure of the path on three vertices would be
  the triangle; 2.3 would then fail, by the Check of 2.1.

*Needs:* Mathlib `SimpleGraph.degree`, `SimpleGraph.edge`, `Relation.ReflTransGen`, the complete
lattice of simple graphs on `V` (`sInf`). (Proved here, following the cited route.)

### 2.3 Hamiltonicity of the closure

Prove `isHamiltonian_degreeClosure_iff`: `degreeClosure G` is Hamiltonian if and only if `G` is
(Bondy–Murty, Theorem 4.4, p. 57).

- If `n ≥ 3` and `degreeClosure G` is the complete graph, `G` is Hamiltonian (Bondy–Murty,
  Corollary 4.4, p. 57).

Route: apply 2.1 at each addition of a sequence as in 2.2; the degree condition of 2.1 holds in the
current graph at each step. The corollary uses Mathlib's `SimpleGraph.isHamiltonian_top`.

**Checks.**
- The 5-cycle with one chord is Hamiltonian, as the corollary predicts from its complete closure.
- The path on three vertices is its own closure and is not Hamiltonian.

*Needs:* 2.1, 2.2; Mathlib `SimpleGraph.isHamiltonian_top`. (Proved here, following the cited
route.)

### Examples

The closures of the 5-cycle, of the 5-cycle with one chord, of the path on three vertices and of the
Petersen graph, each computed by additions in two different orders.

### Dependencies

Mathlib `SimpleGraph.IsHamiltonian`, `SimpleGraph.IsHamiltonian.mono`,
`SimpleGraph.Walk.IsHamiltonianCycle`, `SimpleGraph.edge`, `SimpleGraph.degree`,
`SimpleGraph.isHamiltonian_top`, `Relation.ReflTransGen`. No other layer.

## Layer 3: degree conditions

Throughout this layer `G` has `[DecidableRel G.Adj]`.

### 3.1 Ore's and Dirac's theorems

- `isHamiltonian_of_ore`: if `n ≥ 3` and every two distinct nonadjacent vertices have degree sum at
  least `n`, then `G` is Hamiltonian (Ore, 1960; proved here from 2.3, as Bondy–Murty, p. 57, derive
  Dirac's theorem after Corollary 4.4).
- `isHamiltonian_of_dirac`: if `n ≥ 3` and `n ≤ 2 * deg v` for every vertex `v`, then `G` is
  Hamiltonian (Dirac, 1952; Diestel, Theorem 10.1.1, p. 324; Bondy–Murty, Theorem 4.3, p. 54).

Route: under Ore's condition no pair is left for the closure to keep nonadjacent, so the closure is
complete; apply 2.3. Dirac's condition implies Ore's.

**Checks.**
- The bound is sharp. For `n = 2m + 1` with `m ≥ 1`, two complete graphs on `m + 1` vertices
  sharing one vertex have minimum degree `m`, so `2 * δ = n − 1`, and the shared vertex is a cut
  vertex; `K_(m, m + 1)` also has minimum degree `m` and is not Hamiltonian by 1.1 (Diestel, p. 324,
  for the first; both have nonadjacent pairs of degree sum `n − 1`).
- The hypothesis `n ≥ 3` is needed: the graph on two adjacent vertices has `2 * δ = 2 = n` and is
  not Hamiltonian, and on the empty vertex type both conditions hold vacuously while the graph is
  not Hamiltonian.
- Ore's theorem is stronger than Dirac's: the complete graph on four vertices with a fifth vertex
  joined to two of them has degrees `2, 3, 3, 4, 4`, so it fails Dirac's condition at the vertex of
  degree `2`, while each nonadjacent pair has degree sum `2 + 3 = 5`, so it satisfies Ore's.

*Needs:* 2.3; Mathlib `SimpleGraph.degree`, `SimpleGraph.isHamiltonian_top`. (Proved here, except
as cited.)

### 3.2 Hamiltonian paths

Prove `exists_isHamiltonian_walk_of_ore`: if `V` is nonempty and every two distinct nonadjacent
vertices have degree sum at least `n − 1` (written `n ≤ deg u + deg v + 1`), then `G` has a
Hamiltonian path.

Route: join a new vertex `z` to every vertex of `G`, as Diestel does for Corollary 10.2.2, p. 329.
The new graph has `n + 1` vertices; a nonadjacent pair of it is a nonadjacent pair of `G` with
degree sum raised by two, to at least `n + 1`. For `n ≥ 2` it is Hamiltonian by 3.1, and deleting
`z` from a Hamilton cycle leaves a Hamiltonian path of `G`; for `n = 1` the single vertex is a
Hamiltonian path. (Proved here.)

**Checks.**
- The bound is sharp: two disjoint complete graphs on `m` vertices have degree sum `2m − 2 = n − 2`
  over nonadjacent pairs and no Hamiltonian path, since they are not connected.
- Nonemptiness is needed: on the empty vertex type the condition holds and there is no walk.

*Needs:* 3.1; Mathlib `SimpleGraph.Walk.IsHamiltonian`, `SimpleGraph.Walk.IsHamiltonianCycle`.

### 3.3 Chvátal's and Pósa's conditions

Define `ChvatalCondition d` for a function `d : V → ℕ`: for every `i` with `1 ≤ i` and `2 * i < n`,
if at least `i` vertices have `d v ≤ i`, then at least `i + 1` vertices have `n ≤ d v + i`. For a
nondecreasing listing `d₁ ≤ ⋯ ≤ dₙ` of the values of `d` this says that `dᵢ ≤ i` implies
`dₙ₋ᵢ ≥ n − i` for every `1 ≤ i < n/2`: "at least `i` values are at most `i`" is `dᵢ ≤ i`, and "at
least `i + 1` values are at least `n − i`" is `dₙ₋ᵢ ≥ n − i`.

- `isHamiltonian_of_chvatalCondition`: if `n ≥ 3` and the degree function of `G` satisfies
  Chvátal's condition, then `G` is Hamiltonian (Chvátal, 1972; Bondy–Murty, Theorem 4.5, p. 57;
  Diestel, Theorem 10.2.1, p. 328, which states it for integer sequences: every graph whose degree
  sequence dominates a sequence satisfying the condition is Hamiltonian; the sequence of `G` itself
  gives this statement).
- *Pósa's theorem.* If `n ≥ 3`, fewer than `k` vertices have degree at most `k` for every `k ≥ 1`
  with `2k + 1 < n`, and, when `n` is odd, at most `(n − 1)/2` vertices have degree at most
  `(n − 1)/2`, then `G` is Hamiltonian (Pósa, 1962; Diestel, Chapter 10, Exercise 9, p. 336, asks
  to derive from Chvátal's theorem the weaker form in which fewer than `i` vertices have degree at
  most `i` for every `1 ≤ i < n/2`). Route: these conditions imply Chvátal's, since they make the
  hypothesis of Chvátal's condition false for `2i + 1 < n`, and for odd `n` and `i = (n − 1)/2`
  they give at least `i + 1` vertices of degree at least `i + 1 = n − i`.

Route for Chvátal's theorem: show that the closure is complete and apply 2.3. If not, choose
nonadjacent `u`, `v` in the closure with `deg u ≤ deg v` and `deg u + deg v` as large as possible,
and put `m = deg u`, measured in the closure; then `m < n/2`. If `m = 0`, then `u` has degree `0`
in `G` as well, so the case `i = 1` of the condition, which applies because `n ≥ 3`, gives a vertex
of degree `n − 1` in `G`; it is adjacent to `u`, which is absurd. So `m ≥ 1`. The vertices
nonadjacent to `v` have degree at most `m` and there are at least `m` of them; the vertices
nonadjacent to `u`, together with `u`, have degree less than `n − m` and there are at least `n − m`
of them. Degrees in `G` are at most those in the closure, so `G` has at least `m` vertices of degree
at most `m` and at most `m` vertices of degree at least `n − m`, against Chvátal's condition.

**Checks.**
- The counting form and the sorted form agree on every sequence of `n ≤ 7` values in
  `{0, …, n − 1}`.
- The 5-cycle with the two chords from one vertex (degrees `2, 2, 3, 3, 4`) satisfies Chvátal's
  condition, though not Ore's: for `i = 2`, two values are at most `2` and three are at least `3`.
- The triangle with a vertex of degree two attached to each side (degrees `2, 2, 2, 4, 4, 4`)
  satisfies Chvátal's condition but not Pósa's: three vertices have degree at most `2`, not fewer
  than `2`.
- Chvátal's condition is not necessary, and does not detect every complete closure: the 5-cycle
  with one chord (degrees `2, 2, 2, 3, 3`) fails it at `i = 2`, having only two values at least
  `3`, and has complete closure (2.2).

*Needs:* 2.2, 2.3; Mathlib `SimpleGraph.degree`, `Finset.filter`. (Proved here, following the cited
route.)

### 3.4 Chvátal's extremal graphs

Define `chvatalGraph m n` on `Fin n`: two vertices `i ≠ j` are adjacent when one of them is at least
`n − m` (written `n ≤ i + m`) or both are at least `m`. For `1 ≤ m` and `2m < n` it is the join of a
complete graph on `m` vertices with the disjoint union of `m` isolated vertices and a complete graph
on `n − 2m` vertices, the graph `C(m, n)` of Bondy–Murty, p. 58, and of Diestel, Figure 10.2.1,
p. 329. Its degree sequence is `m` copies of `m`, `n − 2m` copies of `n − m − 1` and `m` copies of
`n − 1`.

- `not_isHamiltonian_chvatalGraph`: for `1 ≤ m` and `2m < n`, `C(m, n)` is not Hamiltonian:
  deleting the `m` vertices of degree `n − 1` leaves `m + 1` components (Bondy–Murty, p. 59, from
  Theorem 4.2).
- `exists_chvatalGraph_degree_majorizes`: every non-Hamiltonian graph on `n ≥ 3` vertices is
  degree-majorised by some `C(m, n)` with `1 ≤ m` and `2m < n`: some bijection `e` from its vertices
  to `Fin n` has `deg v ≤ deg (e v)` for every `v` (Chvátal, 1972; Bondy–Murty, Theorem 4.6, p. 59;
  Diestel, proof of Theorem 10.2.1, p. 329). So the graphs `C(m, n)` are, up to degree
  majorisation, the only obstructions; and since `C(m, n)` violates Chvátal's condition at `i = m`
  and at no other `i`, no single instance of the condition can be dropped.

Route: by 3.3 some `m` with `1 ≤ m`, `2m < n` has `dₘ ≤ m` and `dₙ₋ₘ < n − m`; then the degree
sequence is dominated term by term by that of `C(m, n)`; match the vertices in sorted order.

**Checks.**
- `C(0, n)` is the complete graph, and `C(1, n)` is a complete graph on `n − 1` vertices with one
  more vertex joined to a single one of them.
- `C(2, 5)` has degrees `2, 2, 2, 4, 4` and seven edges; it is `K_(2, 3)` with the edge between the
  two vertices of the smaller side added.
- `K_(2, 3)` (degrees `2, 2, 2, 3, 3`) is degree-majorised by `C(2, 5)` and not by `C(1, 5)`, whose
  smallest degree is `1`.
- The Petersen graph is degree-majorised by `C(3, 10)` and `C(4, 10)`, and not by `C(1, 10)` or
  `C(2, 10)`, whose smallest degrees are `1` and `2`.
- For `n ≤ 13` the degrees of `C(m, n)` violate Chvátal's condition exactly at `i = m`.
- Every non-Hamiltonian graph on `3 ≤ n ≤ 7` vertices is degree-majorised by some `C(m, n)`. The
  bound `n ≥ 3` is needed: no graph on two vertices is Hamiltonian, and no `m` has `1 ≤ m` and
  `2m < 2`.

*Needs:* 1.1, 3.3; Mathlib `SimpleGraph.fromRel`, `SimpleGraph.degree`. (Proved here, following the
cited route.)

### 3.5 Edge counts

- `isHamiltonian_of_choose_add_two_le_card_edgeFinset`: a graph on `n ≥ 3` vertices with at least
  `binom(n − 1, 2) + 2` edges is Hamiltonian.
- `not_isHamiltonian_iff_of_card_edgeFinset_eq`: a graph on `n ≥ 3` vertices with exactly
  `binom(n − 1, 2) + 1` edges is non-Hamiltonian if and only if it is isomorphic to `C(1, n)` or
  `n = 5` and it is isomorphic to `C(2, 5)`.

(Ore, 1961, and Bondy, 1972; Bondy–Murty, Corollary 4.6, p. 60.)

Route: a non-Hamiltonian graph is degree-majorised by some `C(m, n)` (3.4), so it has at most as
many edges, and the number of edges of `C(m, n)` is
`binom(n − 1, 2) + 1 − (m − 1)(m − 2)/2 − (m − 1)(n − 2m − 1)`, which is largest exactly for
`m = 1`, and also for `m = 2` when `n = 5`. Equality of edge counts forces equality of degree
sequences, and a graph with the degree sequence of `C(1, n)`, or of `C(2, 5)`, is isomorphic to it.

**Checks.**
- The edge count of `C(m, n)` above agrees with the count from its definition for all `n ≤ 9`.
- For `n = 3` the bound `binom(2, 2) + 2 = 3` gives the triangle, and the only non-Hamiltonian graph
  with two edges is the path, which is `C(1, 3)`.
- For `n = 5`, `C(1, 5)` and `C(2, 5)` both have seven edges and are not isomorphic, since their
  smallest degrees are `1` and `2`.
- For `n ≤ 2` no graph has `binom(n − 1, 2) + 2` edges, so the first statement is of interest only
  for `n ≥ 3`, where `n − 1` does not truncate.
- Both statements hold on all graphs with `3 ≤ n ≤ 7` vertices.

*Needs:* 3.4; Mathlib `SimpleGraph.edgeFinset`, `SimpleGraph.sum_degrees_eq_twice_card_edges`,
`SimpleGraph.Iso`. (Proved here, following the cited route.)

### Examples

The 5-cycle with the two chords from one vertex, the triangle with a vertex of degree two on each
side, the graphs `C(1, 5)` and `C(2, 5)` and the Petersen graph, with their degree sequences and the
conditions they satisfy or fail.

### Dependencies

Layers 1 and 2. Mathlib `SimpleGraph.degree`, `SimpleGraph.isHamiltonian_top`,
`SimpleGraph.Walk.IsHamiltonian`, `SimpleGraph.Walk.IsHamiltonianCycle`, `SimpleGraph.fromRel`,
`SimpleGraph.edgeFinset`, `SimpleGraph.sum_degrees_eq_twice_card_edges`, `SimpleGraph.Iso`,
`Finset.filter`.

## Layer 4: connectivity and independence

### 4.1 The Chvátal–Erdős theorem

- `isHamiltonian_of_indepNum_le_vertexConnectivity`: if `n ≥ 3` and the independence number of `G`
  is at most its vertex connectivity, then `G` is Hamiltonian (Chvátal and Erdős, 1972; Diestel,
  Proposition 10.1.2, p. 325).
- `exists_isHamiltonian_walk_of_indepNum_le`: if `V` is nonempty and the independence number is at
  most the vertex connectivity plus one, then `G` has a Hamiltonian path (Chvátal and Erdős, 1972;
  proved here from the first statement).

Route for the first statement (Diestel, proof of Proposition 10.1.2, p. 325): the connectivity is
at least `1`, since the independence number of a nonempty graph is, and `G` is `2`-connected: if
`κ = 1` then `α = 1`, so `G` is complete and `κ = n − 1 ≥ 2`, which is absurd. So `G` has a cycle;
let `C` be a longest one. If `C` misses a component `D` of `G − C`, no two neighbours of `D` on `C`
are consecutive on `C`, so these neighbours separate `D` from the rest of `C` and there are at
least `κ` of them; their successors on `C` and a vertex of `D` form an independent set of size more
than `κ`, contradicting `α ≤ κ`.

Route for the second statement: join a new vertex to every vertex; this raises the connectivity by
one and keeps the independence number. For `n ≥ 2` the first statement applies to the new graph,
and its Hamilton cycle without the new vertex is a Hamiltonian path of `G`; for `n = 1` the single
vertex is a Hamiltonian path.

**Checks.**
- The bound is sharp: `K_(m, m + 1)` has connectivity `m` and independence number `m + 1` and is not
  Hamiltonian; `K_(m, m + 2)` has connectivity `m`, independence number `m + 2` and no Hamiltonian
  path.
- The hypothesis `n ≥ 3` is needed: the graph on two adjacent vertices has connectivity `1` and
  independence number `1`.
- On the empty vertex type the independence number and the connectivity are both `0`, so the
  hypothesis of the second statement holds and there is no walk; nonemptiness is needed.
- The 5-cycle has connectivity `2` and independence number `2`; the Petersen graph has `3` and `4`,
  so the theorem does not apply to it.

*Needs:* Mathlib `SimpleGraph.indepNum`, `SimpleGraph.IsIndepSet.card_le_indepNum`,
`SimpleGraph.Walk.IsHamiltonianCycle`; Tau Ceti `SimpleGraph.vertexConnectivity`,
`SimpleGraph.isVertexConnected_iff_le_vertexConnectivity`, `SimpleGraph.isVertexConnected_iff`.
(Proved here, except as cited.)

### Examples

Complete bipartite graphs, the 5-cycle, the Petersen graph and complete graphs, the last with
connectivity `n − 1` and independence number `1`.

### Dependencies

Mathlib `SimpleGraph.indepNum`, `SimpleGraph.IsIndepSet.card_le_indepNum`,
`SimpleGraph.Walk.IsHamiltonian`, `SimpleGraph.Walk.IsHamiltonianCycle`; Tau Ceti
`SimpleGraph.vertexConnectivity`, `SimpleGraph.isVertexConnected_iff_le_vertexConnectivity`,
`SimpleGraph.isVertexConnected_iff`. No other layer.

## Layer 5: tournaments

### 5.1 Tournaments, spanning paths and spanning cycles

Define `IsTournament T` for a digraph `T` on `W`: no two vertices have arcs in both directions, and
any two distinct vertices have an arc in one direction (Moon, §1, p. 1). In particular a tournament
has no loops. Define `IsSpanningPath D l`: the list `l` has no repetition, contains every vertex,
and has an arc from each entry to the next. Define `IsSpanningCycle D σ`: the permutation `σ` is a
cycle in Mathlib's sense, moves every vertex, and has an arc from each `v` to `σ v` (Moon, §4,
p. 7).

**Checks.**
- On the empty vertex type the empty list is a spanning path, and on one vertex the one-element list
  is; neither type has a spanning cycle, since a cycle moves at least two points.
- Without the condition that `σ` moves every vertex, the digraph on three vertices with a loop at
  one vertex and arcs in both directions between the other two would have a spanning cycle, the
  transposition of those two.
- Without the asymmetry condition, the digraph on two vertices with both arcs would count as a
  tournament; it has two spanning paths, so 5.2 would fail for it.

*Needs:* Mathlib `Digraph`, `List.Nodup`, `List.IsChain`, `Equiv.Perm.IsCycle`.

### 5.2 Rédei's theorem

- `IsTournament.odd_card_isSpanningPath`: every tournament on a finite vertex type has an odd number
  of spanning paths (Rédei, 1934; Moon, Theorem 14, p. 28).
- In particular every tournament on a finite vertex type has a spanning path (Rédei, 1934; Moon,
  §9, p. 28; Diestel, Chapter 10, Exercise 1, p. 335). This is the positivity of the count above,
  and it has the direct proof below, which does not use the parity statement.

Route for existence: induction on the number of vertices, inserting a new vertex `x` into a
spanning path `v₁ ⋯ vₖ` of the rest: before `v₁` if `x → v₁`, after `vₖ` if `vₖ → x`, and otherwise
between `vᵢ` and `vᵢ₊₁` for the last `i` with `vᵢ → x`.

Route for parity (Moon, proof of Theorem 14, pp. 28–31), for `n ≥ 2`; the cases `n ≤ 1` are the
first Check. Work modulo two, with `A` the dominance matrix, `Aₖ` the matrix `A` with column `k`
replaced by ones, and principal minors indexed by subsets `e` of the vertices, the empty minor
being `1`.

1. The number `h` of spanning paths is congruent to the sum over `k`, and over the subsets `e`
   containing a fixed vertex, of the product of the minor of `Aₖ` on `e` and its minor on the
   complement of `e`. In the expansion, the permutations with one cycle contribute `h` in total: a
   spanning path that starts at `k` is a cyclic permutation whose arc into `k` is not required.
   A term from a permutation with `r > 1` cycles occurs for `2^(r − 1)` subsets `e`.
2. Adding the all-ones matrix to `A` changes the determinant by the sum of the determinants of the
   `Aₖ`, and off the diagonal it gives the transpose of `A`, with ones on the diagonal. Hence the
   sum over `k` of the determinants of the `Aₖ` is congruent to the sum of the principal minors of
   `A` on the proper subsets, and the same holds inside every principal submatrix.
3. The minor of `Aₖ` on a set that does not contain `k` is the minor of `A`. Splitting the sum
   of 1 according to whether `k` lies in `e`, and applying 2 inside the principal submatrix on `e`
   or on its complement, writes `h` as the sum, over all pairs of subsets `e₁ ⊊ e`, of the product
   of the minor of `A` on `e₁` and its minor on the complement of `e`. Exchanging the pair
   `(e₁, e)` with the pair of complements `(eᶜ, e₁ᶜ)` matches the terms two by two, except the
   term with `e₁` empty and `e` everything, which is `1`.

**Checks.**
- The transitive tournament on `n` vertices, in which `i → j` exactly when `i < j`, has exactly one
  spanning path; the cyclic triangle has three.
- The 64 labelled tournaments on four vertices have `1`, `3` or `5` spanning paths, for 24, 16 and
  24 of them; the 1024 on five vertices have between `1` and `15`, always odd, and the tournament on
  `ℤ/5` with `i → i + 1, i + 2` has `15`.
- The tournaments on no vertices and on one vertex have exactly one spanning path, the empty list
  and the one-element list, so the parity statement holds there too.
- Finiteness is needed: a list is finite, so a tournament on an infinite vertex type has no
  spanning path.

*Needs:* 5.1; Mathlib `List.IsChain`, `Nat.card`. (Proved here, following the cited routes.)

### 5.3 Camion's theorem

Prove `IsTournament.exists_isSpanningCycle_iff`: a tournament on a finite vertex type with at least
two vertices has a spanning cycle if and only if it is strongly connected (Camion, 1959; Moon, §4,
p. 7, for `n ≥ 3`; on two vertices both sides fail).

- A tournament on a finite vertex type is strongly connected if and only if no partition of its
  vertices into two nonempty sets `A`, `B` has every vertex of `B` dominating every vertex of `A`
  (Moon, Theorem 2, p. 6, with the definition of a reducible tournament in §2, p. 2).

Route: a spanning cycle makes every vertex reachable from every other. Conversely, Moon's Theorem 3,
p. 7, shows by induction on `k` that in a strongly connected tournament on `n ≥ 3` vertices every
vertex lies on a cycle of each length `3 ≤ k ≤ n`; the case `k = n` is a spanning cycle. The
induction starts from a 3-cycle and lengthens the cycle by one vertex at a time, either inserting a
vertex that both dominates and is dominated by vertices of the cycle, or using an arc from the
vertices dominated by the whole cycle to those dominating it.

**Checks.**
- On no vertices and on one vertex the tournament is strongly connected and has no spanning cycle,
  so at least two vertices are needed; on two vertices the tournament is neither strongly
  connected nor has a spanning cycle.
- The cyclic triangle is strongly connected and has a spanning cycle; the transitive tournament on
  three vertices has neither.
- Of the 64 labelled tournaments on four vertices, the 24 strongly connected ones are exactly those
  with a spanning cycle, and they are the ones with five spanning paths.

*Needs:* 5.1; Mathlib `Relation.ReflTransGen`, `Equiv.Perm.IsCycle`; Tau Ceti
`Digraph.isStronglyConnected_iff` for the comparison with `Quiver.IsStronglyConnected`. (Proved
here, following the cited route.)

### Examples

All tournaments on at most four vertices up to isomorphism, with their spanning paths and spanning
cycles, and the cyclic tournament on five vertices.

### Dependencies

Mathlib `Digraph`, `List.Nodup`, `List.IsChain`, `Equiv.Perm.IsCycle`, `Relation.ReflTransGen`,
`Nat.card`; Tau Ceti `Digraph.isStronglyConnected_iff`. No other layer.

## Scope and ownership

This roadmap owns the targets stated above: toughness for Hamiltonian cycles and paths and the
non-Hamiltonicity of the Petersen graph; the Bondy–Chvátal closure lemma, the closure and its
Hamiltonicity; Ore's, Dirac's, Chvátal's and Pósa's theorems, the form of Ore's theorem for paths,
Chvátal's extremal graphs and the edge-count theorem; the Chvátal–Erdős theorem and its form for
paths; tournaments, their spanning paths and spanning cycles, and the theorems of Rédei and Camion.

Already in the libraries and therefore not targets:

- Mathlib's Hamiltonian paths, cycles and graphs with the conventions of the Conventions above, and
  their basic facts: a Hamiltonian path is a path, a Hamilton cycle has length `n`, Hamiltonicity is
  monotone in the graph (`SimpleGraph.IsHamiltonian.mono`), a Hamiltonian graph is connected
  (`SimpleGraph.IsHamiltonian.connected`), a graph with a bridge is not Hamiltonian
  (`SimpleGraph.IsBridge.not_isHamiltonian`), graphs on two vertices are not Hamiltonian
  (`SimpleGraph.not_isHamiltonian_of_card_eq_two`), complete graphs and cycle graphs on at least
  three vertices are (`SimpleGraph.isHamiltonian_top`, `SimpleGraph.isHamiltonian_cycleGraph`), and
  a cyclic permutation along adjacent vertices gives a Hamilton cycle
  (`SimpleGraph.IsHamiltonian.of_perm`).
- Tau Ceti's vertex connectivity with its threshold form and its characterization at threshold two
  (`SimpleGraph.vertexConnectivity`, `SimpleGraph.IsVertexConnected`,
  `SimpleGraph.isVertexConnected_two_iff`), which 1.2 and 4.1 consume, and its identification of
  strong connectivity of a digraph with reachability of every vertex from every other along arcs
  (`Digraph.isStronglyConnected_iff`), the form in which 5.3 states it.

Left to other roadmaps:

- GraphConnectivityAndFlows owns vertex and edge connectivity, cut vertices and blocks (its 2.2,
  2.3), directed connectivity (its 6.2) and Dirac's theorem that every `k` vertices of a
  `k`-connected graph lie on a common cycle (its 6.6). That theorem prescribes vertices that a cycle
  must contain; the theorems here ask for a cycle containing all vertices. Nothing is restated.

Outside the scope: travelling-salesman tours and every statement with edge weights, planar graphs
(Tait's conjecture, Tutte's theorem on 4-connected planar graphs, Grinberg's criterion), Hamilton
cycles in random graphs, the complexity of deciding Hamiltonicity and every procedure for finding a
Hamilton cycle, Euler tours, the squares of graphs (Fleischner's theorem), local degree conditions
(the theorem of Asratian and Khachatrian), degree conditions for bipartite graphs (the theorems of
Moon and Moser), the form of Chvátal's theorem for Hamiltonian paths, the toughness conjecture,
pancyclicity, and infinite graphs.

## Exact supplier contracts

### From Mathlib

- `Mathlib/Combinatorics/SimpleGraph/Hamiltonian.lean`: `SimpleGraph.Walk.IsHamiltonian` (for
  `[DecidableEq α]`: every vertex occurs exactly once in the support of the walk);
  `SimpleGraph.Walk.IsHamiltonianCycle` (a cycle whose tail is a Hamiltonian path);
  `SimpleGraph.IsHamiltonian` (for `[Fintype α] [DecidableEq α]`:
  `Fintype.card α ≠ 1 → ∃ a, ∃ p : G.Walk a a, p.IsHamiltonianCycle`);
  `SimpleGraph.IsHamiltonian.mono` (`G ≤ H → G.IsHamiltonian → H.IsHamiltonian`);
  `SimpleGraph.IsHamiltonian.connected`; `SimpleGraph.isHamiltonian_top`
  (`3 ≤ Fintype.card α → (completeGraph α).IsHamiltonian`).
- `Mathlib/Combinatorics/SimpleGraph/Finite.lean`: `SimpleGraph.degree` (for a `Fintype` instance on
  the neighbour set, given by `[Fintype V] [DecidableRel G.Adj]`); `SimpleGraph.edgeFinset`.
  `Mathlib/Combinatorics/SimpleGraph/DegreeSum.lean`: `SimpleGraph.sum_degrees_eq_twice_card_edges`
  (the sum of the degrees is twice the number of edges).
- `Mathlib/Combinatorics/SimpleGraph/Basic.lean`: `SimpleGraph.fromRel` (`(fromRel r).Adj a b` is
  `a ≠ b ∧ (r a b ∨ r b a)`). `Mathlib/Combinatorics/SimpleGraph/Operations.lean`:
  `SimpleGraph.edge` (the graph with the single edge `s(u, v)`, and no edge when `u = v`).
  `Mathlib/Combinatorics/SimpleGraph/Maps.lean`: `SimpleGraph.induce` (the induced graph on a set of
  vertices), `SimpleGraph.Iso`. `Mathlib/Combinatorics/SimpleGraph/Connectivity/Connected.lean`:
  `SimpleGraph.ConnectedComponent` (the quotient by reachability).
- `Mathlib/Combinatorics/SimpleGraph/Clique.lean`: `SimpleGraph.indepNum` (the supremum in `ℕ` of
  the sizes of independent sets); `SimpleGraph.IsIndepSet.card_le_indepNum` (for `[Finite α]`, an
  independent finite set has at most `indepNum` elements).
  `Mathlib/Combinatorics/SimpleGraph/Bipartite.lean`: `SimpleGraph.IsBipartiteWith`.
- `Mathlib/Combinatorics/Digraph/Basic.lean`: `Digraph` (a relation `Adj` on the vertices, loops
  allowed). `Mathlib/Logic/Relation.lean`: `Relation.ReflTransGen`.
  `Mathlib/GroupTheory/Perm/Cycle/Basic.lean`: `Equiv.Perm.IsCycle` (a permutation with a nonfixed
  point `x` such that every nonfixed point is in the orbit of `x`). Batteries
  `Batteries/Data/List/Basic.lean`: `List.IsChain` (a relation between consecutive entries of a
  list). Core and basic Mathlib: `List.Nodup`, `Nat.card`, `Finset.filter`.

### From Tau Ceti

- `TauCeti/Combinatorics/SimpleGraph/Connectivity/VertexConnectivity.lean`:
  `SimpleGraph.IsVertexConnected G k` for `k : ℕ∞` (at least `k + 1` vertices, and any two vertices
  stay reachable after deleting fewer than `k` other vertices); `SimpleGraph.isVertexConnected_iff`
  (equivalently, the graph stays preconnected after deleting any set of fewer than `k` vertices);
  `SimpleGraph.isVertexConnected_two_iff` (2-vertex-connected if and only if at least three
  vertices, connected and no cut vertex); `SimpleGraph.vertexConnectivity` (the supremum in `ℕ∞` of
  the natural `k` with `G.IsVertexConnected k`, `0` on the empty type);
  `SimpleGraph.isVertexConnected_iff_le_vertexConnectivity` (for `[Nonempty V]` and `k : ℕ`,
  `G.IsVertexConnected k ↔ k ≤ G.vertexConnectivity`).
- `TauCeti/Combinatorics/SimpleGraph/Connectivity/CutVertex.lean`: `SimpleGraph.IsCutVertex G v`
  (deleting `v` separates two other vertices that are reachable from each other in `G`).
- `TauCeti/Combinatorics/Digraph/ArrowWalk.lean`: `Digraph.isStronglyConnected_iff` (Mathlib's
  `Quiver.IsStronglyConnected` for the arrow family `Digraph.AdjHom D`, with one arrow from `v` to
  `w` exactly when `D.Adj v w`, holds if and only if `∀ v w, Relation.ReflTransGen D.Adj v w`).
  The statements of Layer 5 use the right-hand side and do not import this module.

## References

- J. A. Bondy and U. S. R. Murty, *Graph Theory with Applications*, North-Holland, 1976, Chapter 4,
  §4.2 and its exercises, pp. 53–61. The page numbers are those of the printed book, in the scan
  that the authors posted chapter by chapter on J. A. Bondy's page
  (`www.math.jussieu.fr/~jabondy/books/gtwa/gtwa.html`, Chapter 4 as `pdf/chapter4.pdf`; the page
  is kept by the Internet Archive, capture of 16 June 2012).
- Reinhard Diestel, *Graph Theory*, sixth edition, 2025; the free preview of the main text on the
  author's site (`diestel-graph-theory.com`, chapter file of June 2024), Chapter 10, §§10.1–10.2,
  the exercises and the notes, pp. 323–337. The exercises are numbered within the chapter.
- John W. Moon, *Topics on Tournaments*, Holt, Rinehart and Winston, 1968; the electronic edition
  of Project Gutenberg (eBook 42833, 2013), §§1–4 and 9, with the page numbers of that edition.
- The papers of Dirac (1952), Ore (1961), Bondy (1972), Chvátal (1972), Chvátal and Erdős (1972),
  Bondy and Chvátal (1974), Rédei (1934) and Camion (1959) are named as the three books above
  attribute the results. Ore's theorem of 3.1 (Ore, 1960), Pósa's theorem of 3.3 (Pósa, 1962) and
  the path form of the Chvátal–Erdős theorem in 4.1 are not stated in those books; they carry their
  customary attributions, no locator is given for them, and each is proved in the layers above
  from a statement that the books do contain.
