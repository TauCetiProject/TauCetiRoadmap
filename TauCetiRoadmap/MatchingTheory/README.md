# Roadmap: matching theory

**Summary.** A matching in a graph is a set of edges no two of which share a vertex. This roadmap
develops the classical theory of the largest matchings of a finite simple graph, which need not be
bipartite. Its central number is the matching number, the largest size of a matching, and its
central objects are the odd components that remain when a set of vertices is deleted: each of them
must either send a matching edge to the deleted set or leave one of its own vertices unmatched.
Matchings and perfect matchings are the library's, and most theorems assume a finite vertex set.
Every target is a statement about graphs and their matchings; no procedure for finding a matching
is specified.

The headline theorems are these.

- *Berge's theorem.* A matching of a finite graph is as large as possible if and only if no path
  joins two unmatched vertices with its edges lying alternately outside and inside the matching.
- *The Tutte–Berge formula.* For every set `U` of vertices of a finite graph on `n` vertices, twice
  the matching number plus the number of odd components of the graph with `U` deleted is at most
  `n + |U|`, and some `U` attains equality. Tutte's perfect matching theorem is the case in which
  the matching number is `n/2`.
- *The Gallai–Edmonds structure theorem.* Let `D` be the set of vertices missed by some largest
  matching, `A` the set of the other vertices with a neighbour in `D`, and `C` the rest. Every
  component of the subgraph on `D` is factor-critical: deleting any one of its vertices leaves a
  graph with a perfect matching. The subgraph on `C` has a perfect matching, and the set `A`
  attains equality in the Tutte–Berge formula. Every largest matching matches the vertices of `A`
  into distinct components of `D`.
- *Petersen's theorem and Gallai's identity.* A finite graph in which every vertex has degree three
  and no edge is a bridge has a perfect matching. For a graph without isolated vertices, the
  matching number plus the least size of a set of edges meeting every vertex equals the number of
  vertices.

The roadmap builds on Mathlib's simple graphs, which supply matchings and perfect matchings, vertex
covers and the vertex cover number, bridges, odd components, and Tutte's theorem itself, which the
Tutte–Berge formula extends. GraphConnectivityAndFlows develops Kőnig's theorem that a bipartite
graph has a matching as large as its smallest vertex cover, together with Hall's theorem and their
forms with capacities; this roadmap does not restate them, and uses Kőnig's theorem once, to derive
Kőnig's theorem on edge covers from Gallai's identities.

The layers are in build order. Layer 1 defines the matching number, maximum matchings and the edge
cover number and proves Gallai's identities. Layer 2 proves Berge's theorem on augmenting paths.
Layer 3 proves the Tutte–Berge formula. Layer 4 treats factor-critical graphs, Gallai's lemma and
the Gallai–Edmonds decomposition. Layer 5 proves Petersen's theorem and the existence of perfect
matchings in connected vertex-transitive graphs of even order.

## Conventions

- **Graphs.** A graph is a Mathlib `SimpleGraph V`. Every theorem that concerns a maximum matching,
  odd components or the Gallai–Edmonds sets assumes `[Finite V]`; the identity `ν + ρ = n` of 1.2
  and the definitions hold on every vertex type. `n` is `Nat.card V`.
- **Matchings.** A matching is a subgraph `M : G.Subgraph` with `M.IsMatching`: every vertex of
  `M.verts` has exactly one neighbour in `M`, so `M.verts` is the set of matched vertices. Its size
  is `M.edgeSet.encard`, in `ℕ∞`. A perfect matching is Mathlib's
  `SimpleGraph.Subgraph.IsPerfectMatching`, a matching with `M.verts = Set.univ`.
- **Sizes in `ℕ∞`.** The matching number and the edge cover number are a supremum and an infimum
  in `ℕ∞`, in the style of Mathlib's `SimpleGraph.vertexCoverNum`. They have their intended values
  on every vertex type: on the empty type both are `0`, on the complete graph on `ℕ` the matching
  number is `⊤`, and the edge cover number of a graph with an isolated vertex is `⊤`, the infimum
  of the empty family. A supremum in `ℕ` of the sizes of finite matchings would instead give `0` on
  the complete graph on `ℕ`, the junk value of an unbounded supremum in `ℕ`.
- **Odd components.** For a set `U` of vertices, `o(G − U)` is the number of connected components
  of odd size of the graph obtained by deleting `U`, written exactly as in Mathlib's
  `SimpleGraph.IsTutteViolator`: the graph is `((⊤ : G.Subgraph).deleteVerts U).coe` and the count
  is the `Set.ncard` of its `SimpleGraph.oddComponents`. So `U` is a Tutte violator in Mathlib's
  sense exactly when `|U| < o(G − U)`. Deleting every vertex leaves no component.
- **Arithmetic.** Identities that would need a division or a natural-number subtraction are written
  without them: the Tutte–Berge formula `ν(G) = min_U (n + |U| − o(G − U)) / 2` is written as
  `2ν(G) + o(G − U) ≤ n + |U|` for every `U`, with equality for some `U`, in `ℕ∞`.
- **Bridges.** Mathlib's `SimpleGraph.IsBridge G e` is defined for every `e : Sym2 V`: it says that
  deleting `e` leaves the two ends of `e` unreachable from each other. For a pair `e` that is not an
  edge it holds exactly when its ends lie in different components, so a graph has no bridge in the
  usual sense when no edge `e ∈ G.edgeSet` satisfies it; requiring `¬G.IsBridge e` for every `e`
  would also force any two vertices to be joined by a path.
- **Notation.** `ν(G)` is the matching number, `ρ(G)` the edge cover number, `α(G)` Mathlib's
  independence number `SimpleGraph.indepNum` and `τ(G)` Mathlib's `SimpleGraph.vertexCoverNum`.

## Layer 1: the matching number and Gallai's identities

### 1.1 Matching number, maximum matchings and edge covers

Define `matchingNumber G`, the supremum in `ℕ∞` of `M.edgeSet.encard` over the matchings `M` of
`G`. Define `IsMaximumMatching M`: `M` is a matching and every matching of `G` has at most as many
edges as `M`. Define `edgeCoverNum G`, the infimum in `ℕ∞` of `F.encard` over the sets `F` of edges
of `G` such that every vertex lies on some edge of `F` (Schrijver, §3.1, (2), p. 39, for finite
graphs).

- On a finite vertex type a maximum matching exists, and a matching `M` is a maximum matching if
  and only if `M.edgeSet.encard = matchingNumber G`. (Proved here.)
- On a finite vertex type, `2 * matchingNumber G ≤ n`, with equality if and only if `G` has a
  perfect matching. (Proved here; the even count of matched vertices is Mathlib's
  `SimpleGraph.Subgraph.IsMatching.even_card`.)

**Checks.**
- The Petersen graph has matching number `5` and exactly six perfect matchings.
- The star `K_(1,3)` has matching number `1` and edge cover number `3`; the triangle has matching
  number `1` and edge cover number `2`.
- On the empty vertex type both numbers are `0`: the empty subgraph is the only matching, and the
  empty set of edges meets every vertex.
- The graph with one edge and one isolated vertex has edge cover number `⊤`.
- A maximum matching is not the same as a maximal one. In the path `a b c d` the matching `{bc}`
  cannot be enlarged by adding an edge, yet it has one edge and the matching number is `2`.

*Needs:* Mathlib `SimpleGraph.Subgraph.IsMatching`, `SimpleGraph.Subgraph.IsPerfectMatching`,
`SimpleGraph.Subgraph.IsMatching.even_card`, `Set.encard`.

### 1.2 Gallai's identities

- If `V` is finite, `α(G) + τ(G) = n`: the complement of an independent set is a vertex cover and
  conversely (Gallai; Schrijver, §3.1, (1) and Theorem 3.1, p. 39). (Proved here from Mathlib's
  `SimpleGraph.isIndepSet_compl_iff_isVertexCover`.)
- `matchingNumber_add_edgeCoverNum`: if every vertex of `G` has a neighbour, then
  `matchingNumber G + edgeCoverNum G = ENat.card V` (Gallai; Schrijver, Theorem 3.1, p. 39, for
  finite graphs without isolated vertices). On an infinite vertex type both sides are `⊤`, since
  every edge cover of an infinite vertex set is infinite.

Route (as in Schrijver, proof of Theorem 3.1, pp. 39–40): for `ρ ≤ n − ν`, extend a maximum
matching by one edge at every vertex it leaves unmatched; these `n − 2ν` edges are distinct, as no
two unmatched vertices are adjacent. For `ν ≥ n − ρ`, a minimum edge cover `F` has
`Σ_v (deg_F(v) − 1) = 2|F| − n` surplus edge ends; repeatedly discarding an edge of `F` at a vertex
that lies on two or more of them discards at most that many edges and ends with a matching of at
least `n − |F|` edges.

**Checks.**
- The star `K_(1,3)`: `1 + 3 = 4`; the triangle: `1 + 2 = 3`; the Petersen graph: `5 + 5 = 10` and
  `α + τ = 4 + 6 = 10`.
- The hypothesis on isolated vertices is needed: one edge and one isolated vertex give
  `1 + ⊤ = ⊤`, not `3`.
- On every graph with at most seven vertices up to isomorphism, `ν + ρ = n` when there is no
  isolated vertex and `α + τ = n` always.

*Needs:* 1.1; Mathlib `SimpleGraph.isIndepSet_compl_iff_isVertexCover`, `SimpleGraph.indepNum`,
`SimpleGraph.vertexCoverNum`, `ENat.card`.

### 1.3 Kőnig's edge cover theorem

If `V` is finite, `G` is bipartite (Mathlib's `SimpleGraph.IsBipartite`) and every vertex has a
neighbour, then `α(G) = ρ(G)` (Kőnig; Schrijver, Corollary 3.3a, p. 42).

Route: by 1.2, `α = n − τ` and `ρ = n − ν`, and Kőnig's matching theorem `ν = τ` for finite
bipartite graphs is GraphConnectivityAndFlows §6.7 at unit capacities.

**Checks.**
- `K_(1,3)`: `α = ρ = 3`; the 6-cycle: `α = ρ = 3`; `K_(2,3)`: `α = ρ = 3`.
- Bipartiteness is needed: the triangle has `α = 1` and `ρ = 2`.

*Needs:* 1.2; GraphConnectivityAndFlows §6.7; Mathlib `SimpleGraph.IsBipartite`.

### Examples

Stars, paths, cycles, complete bipartite graphs, the Petersen graph, the empty vertex type, and a
graph with an isolated vertex, with their matching, edge cover, independence and vertex cover
numbers.

### Dependencies

Mathlib `SimpleGraph.Subgraph.IsMatching`, `SimpleGraph.Subgraph.IsPerfectMatching`,
`SimpleGraph.Subgraph.IsMatching.even_card`, `SimpleGraph.isIndepSet_compl_iff_isVertexCover`,
`SimpleGraph.indepNum`, `SimpleGraph.vertexCoverNum`, `SimpleGraph.IsBipartite`, `Set.encard`,
`ENat.card`; GraphConnectivityAndFlows §6.7 for 1.3. No other layer.

## Layer 2: augmenting paths and Berge's theorem

### 2.1 Augmenting paths

Define `IsAugmentingPath M p` for a walk `p : G.Walk u v`: `p` is a path, `u ≠ v`, neither `u` nor
`v` lies in `M.verts`, and for every index `i` the `i`-th edge of `p` lies in `M` exactly when `i`
is odd (Schrijver, §3.2, (6), p. 40). The first and the last edges are then outside `M`, so the
length of `p` is odd.

- If `M` is a matching and `p` is an augmenting path for it, exchanging the edges of `p` in and out
  of `M` gives a matching with one more edge, whose vertex set is `M.verts` together with `u` and
  `v` (Schrijver, §3.2, (7), pp. 40–41). (Proved here.)

**Checks.**
- In the path `a b c d` with `M = {bc}`, the whole path is augmenting, and the exchange gives the
  perfect matching `{ab, cd}`.
- Alternation is needed. In `K_(1,3)` with `M` the edge from the centre to one leaf, the other two
  leaves are unmatched and joined by a path through the centre, but both of its edges lie outside
  `M`; `M` is a maximum matching.
- The condition `u ≠ v` excludes the path of length zero at an unmatched vertex.

*Needs:* 1.1; Mathlib `SimpleGraph.Walk.IsPath`, `SimpleGraph.Walk.edges`.

### 2.2 Berge's theorem

Prove `isMaximumMatching_iff_forall_not_isAugmentingPath`: if `V` is finite and `M` is a matching
of `G`, then `M` is a maximum matching if and only if there is no augmenting path for `M` (Berge,
1957; Schrijver, Theorem 3.2, p. 41; Diestel, Chapter 2, Exercise 1, p. 56, asks whether the
bipartite form extends to all graphs).

Route (after Schrijver, proof of Theorem 3.2, p. 41, which uses the union of the two matchings
where this sketch uses their symmetric difference): one direction is 2.1. For the other, if `M'`
is a larger matching, every vertex has degree at most two in the symmetric difference of the edge
sets of `M` and `M'`, so its components are paths and even cycles whose edges alternate between the
two matchings, and one of the paths has more edges of `M'` than of `M`; that path is augmenting for
`M`.

**Checks.**
- Finiteness is needed. On the vertices `w, 0, 1, 2, …` with edges `w0` and `i(i + 1)` for every
  `i`, the matching of the edges `(2k + 1)(2k + 2)` has `⊤` edges, so it is a maximum matching, and
  the edge `w0` is an augmenting path for it.
- On every graph with at most seven vertices up to isomorphism, and on 600 random graphs with eight
  vertices, a matching is maximum exactly when no augmenting path exists.

*Needs:* 2.1, 1.1; Mathlib `SimpleGraph.Walk.IsPath`, `SimpleGraph.Walk.edges`,
`SimpleGraph.Subgraph.IsMatching`.

### Examples

The path `a b c d` with its three matchings of one edge, the star `K_(1,3)`, and the infinite path
with a pendant vertex of the Check of 2.2.

### Dependencies

Layer 1. Mathlib `SimpleGraph.Walk.IsPath`, `SimpleGraph.Walk.edges`,
`SimpleGraph.Subgraph.IsMatching`.

## Layer 3: the Tutte–Berge formula

Throughout this layer `V` is finite.

### 3.1 Odd components and the easy inequality

Define `numOddComponents G U`, the number `o(G − U)` of the Conventions.

- `two_mul_matchingNumber_add_numOddComponents_le`: for every set `U` of vertices,
  `2ν(G) + o(G − U) ≤ n + |U|` (Schrijver, proof of Theorem 5.1, (3), p. 78).
- For every `U`, `n + |U| − o(G − U)` is even, since the number of odd components of a finite graph
  has the parity of its number of vertices (Mathlib `SimpleGraph.odd_ncard_oddComponents`).

Route: each odd component of `G − U` contains a vertex that `M` leaves unmatched or matches into
`U`, and at most `|U|` of them are matched into `U`; so every matching leaves at least
`o(G − U) − |U|` vertices unmatched.

**Checks.**
- For `K_(1,3)` and `U` its centre: `2 · 1 + 3 = 4 + 1`.
- The cubic graph on sixteen vertices of 5.1, `U` its central vertex: `o(G − U) = 3`, so
  `2ν + 3 ≤ 17` and `ν ≤ 7`; the matching number is `7`.
- For `U = V` the inequality reads `2ν ≤ 2n`.

*Needs:* 1.1; Mathlib `SimpleGraph.oddComponents`, `SimpleGraph.odd_ncard_oddComponents`,
`SimpleGraph.Subgraph.deleteVerts`, `SimpleGraph.Subgraph.coe`.

### 3.2 The Tutte–Berge formula

Prove `exists_two_mul_matchingNumber_add_numOddComponents_eq`: some set `U` of vertices satisfies
`2ν(G) + o(G − U) = n + |U|`, so that `ν(G)` is the least value of `(n + |U| − o(G − U)) / 2`
(Berge, 1958; Schrijver, Theorem 5.1, p. 78; Diestel, Chapter 2, Exercise 20, p. 58, in the form
"`G` has `k` disjoint edges if and only if `o(G − U) ≤ |U| + n − 2k` for every `U`").

- *Tutte's theorem, recovered.* By 1.1, `G` has a perfect matching if and only if `2ν(G) = n`,
  which by 3.1 and the formula holds if and only if `o(G − U) ≤ |U|` for every `U` (Schrijver,
  Corollary 5.1a, p. 79). This is Mathlib's `SimpleGraph.tutte`, which is not restated.
- *The edge cover formula.* If every vertex has a neighbour, `2ρ(G)` is the largest value over sets
  `W` of vertices of `|W|` plus the number of odd components of the subgraph induced on `W`
  (Schrijver, Corollary 5.1b, p. 79). Route: 1.2 and the formula, with `W` the complement of `U`.

Route: let `d` be the largest value of `o(G − U) − |U|`, which is at least `0` (take `U` empty) and
has the parity of `n`. Join `d` new vertices to each other and to every vertex of `G`. The new graph
has an even number of vertices and satisfies Tutte's condition: deleting a set that misses a new
vertex leaves a connected graph, and deleting a set `U` together with all new vertices leaves
`o(G − U) ≤ |U| + d` odd components. By Mathlib's `SimpleGraph.tutte` it has a perfect matching,
whose edges inside `G` form a matching of `G` leaving at most `d` vertices unmatched; with 3.1 this
gives the formula. (Proved here.)

**Checks.**
- In the path `a b c d`, the sets `∅`, `{a}` and `{b}` all attain equality (`4 + 0 = 4`,
  `4 + 1 = 5`, `4 + 1 = 5`), so the minimizing set is not unique.
- For `K_(1,3)` the empty set does not attain equality (`2 + 0 < 4`) and the centre does.
- The edge cover formula for `K_(1,3)`: the three leaves give `3 + 3 = 6 = 2ρ`.
- On every graph with at most seven vertices up to isomorphism, and on 900 random graphs with eight
  or nine vertices, the least value of `n + |U| − o(G − U)` over all `U` is `2ν`.

*Needs:* 3.1, 1.1, 1.2 for the edge cover formula; Mathlib `SimpleGraph.tutte`,
`SimpleGraph.IsTutteViolator`, `SimpleGraph.Subgraph.IsPerfectMatching`.

### Examples

Paths, stars, `K_(2,3)`, the cubic graph on sixteen vertices of 5.1, and graphs with a perfect
matching, each with a set attaining the formula.

### Dependencies

Layer 1. Mathlib `SimpleGraph.oddComponents`, `SimpleGraph.odd_ncard_oddComponents`,
`SimpleGraph.Subgraph.deleteVerts`, `SimpleGraph.Subgraph.coe`, `SimpleGraph.tutte`,
`SimpleGraph.IsTutteViolator`, `SimpleGraph.Subgraph.IsPerfectMatching`.

## Layer 4: factor-critical graphs and the Gallai–Edmonds decomposition

Throughout this layer `V` is finite.

### 4.1 Factor-critical sets

Define `IsFactorCriticalOn G S` for a set `S` of vertices: `S` is nonempty and, for every `v ∈ S`,
some matching `M` of `G` has `M.verts = S \ {v}`. Such a matching uses only edges of `G` with both
ends in `S`, so this says that the subgraph induced on `S` is factor-critical in the sense of
Diestel, Chapter 2, p. 45: it is nonempty, and deleting any one vertex leaves a graph with a
perfect matching. Diestel also asks that the graph itself have no perfect matching; for a finite
graph this follows, since its order is then odd. The graph `G` is factor-critical when
`IsFactorCriticalOn G Set.univ`.

- A factor-critical set has odd size, and the subgraph induced on it is connected. (Proved here:
  if the induced subgraph had two components `K` and `L`, deleting a vertex of `K` would show `L`
  even and deleting a vertex of `L` would show `L` odd.)

**Checks.**
- Odd cycles, complete graphs on an odd number of vertices and a single vertex are factor-critical;
  for a single vertex the matching is empty.
- The path on three vertices has a matching missing exactly one vertex, but is not
  factor-critical: deleting its middle vertex leaves two isolated vertices. So "some vertex is
  missed by a near-perfect matching" is weaker than the definition.
- Without the nonemptiness condition the empty set would be factor-critical.

*Needs:* Mathlib `SimpleGraph.Subgraph.IsMatching`, `SimpleGraph.induce`.

### 4.2 Gallai's lemma

Prove `isFactorCriticalOn_univ_iff`: `G` is factor-critical if and only if it is connected and
every vertex is missed by some maximum matching (Gallai, 1963; proved here, following the argument
of Schrijver cited in the route).

Route: the forward direction is 4.1, together with the remark that for odd `n` a matching missing
only `v` has `(n − 1) / 2` edges and is maximum by 1.1. The converse is an extremal argument, the
one in the second half of Schrijver's proof of Theorem 5.1, p. 79. It suffices that no maximum
matching misses two vertices. Otherwise, among all triples of a maximum matching `M` and two
vertices it misses, pick one minimizing the distance in `G` (finite, by connectivity) between the
two vertices; the distance is at least `2`, as `M` cannot be enlarged. An inner vertex `t` of a
shortest path between them is missed by some maximum matching; among those, pick `N` sharing the
most edges with `M`. Minimality forces `N` to cover both ends of the path, and since `M` and `N`
cover equally many vertices, `M` covers a vertex `x ≠ t` that `N` misses. The `M`-partner of `x`
is covered by `N`, as `N` is maximum; trading the `N`-edge at that partner for the `M`-edge at `x`
yields a maximum matching that still misses `t` and shares one more edge with `M`, a contradiction.
Since some maximum matching misses a vertex, every maximum matching then misses exactly one, and a
maximum matching missing `v` covers exactly `V \ {v}`.

**Checks.**
- Connectivity is needed: two disjoint triangles have every vertex missed by some maximum matching,
  and six vertices, so they are not factor-critical.
- The path on three vertices is connected, and its middle vertex is covered by every maximum
  matching; it is not factor-critical.
- On every graph with at most seven vertices up to isomorphism, factor-criticality holds exactly
  when the graph is connected and every vertex is missed by some maximum matching.

*Needs:* 4.1, 1.1; Mathlib `SimpleGraph.Connected`, `SimpleGraph.dist`.

### 4.3 The Gallai–Edmonds decomposition

Define `gallaiEdmondsD G`, the set `D(G)` of vertices missed by some maximum matching;
`gallaiEdmondsA G`, the set `A(G)` of vertices outside `D(G)` with a neighbour in `D(G)`; and
`gallaiEdmondsC G`, the set `C(G)` of the remaining vertices. No vertex of `C(G)` is adjacent to a
vertex of `D(G)`.

Prove `gallaiEdmonds` (Gallai, 1964; Edmonds, 1965; Goemans, Lecture 3, Theorem 2, p. 3-2, whose
proof shows the perfect matching of the subgraph on `C(G)` in its Claim 9, p. 3-4):

- every connected component of the subgraph induced on `D(G)` is factor-critical in the sense of
  4.1;
- the subgraph induced on `C(G)` has a perfect matching: some matching of `G` has vertex set exactly
  `C(G)`;
- `U = A(G)` attains equality in the Tutte–Berge formula:
  `2ν(G) + o(G − A(G)) = n + |A(G)|`.

Consequently the components of `G − A(G)` of odd size are exactly the components of the subgraph
induced on `D(G)`, and those of even size are the components of the subgraph induced on `C(G)`
(Goemans, Lecture 3, Theorem 2 (ii)–(iv), p. 3-2). Diestel, Theorem 2.2.3, p. 45, proves a shorter
form: some set `S` of vertices is matchable to the components of `G − S`, and all of these are
factor-critical; his notes to Chapter 2, p. 60, present it as a reduced version of the theorem of
Gallai and Edmonds and refer to Lovász and Plummer for the full statement.

Route, without Edmonds' algorithm, which Goemans' proof uses: first prove the stability lemma: for
`a ∈ A(G)`, `ν(G − a) = ν(G) − 1`, and `G − a` has the sets `D(G)`, `A(G) \ {a}` and `C(G)`.
Every maximum matching covers `a`, so `ν` drops by exactly one, and removing the edge at `a` from a
maximum matching of `G` that misses `u` shows `D(G) ⊆ D(G − a)`. Conversely, let `N` be a maximum
matching of `G − a` missing `u`, let `d ∈ D(G)` be a neighbour of `a` and `M` a maximum matching
of `G` missing `d`. The component `P` of `u` in the symmetric difference of `N` and `M` is a path;
it cannot end, with an edge of `M`, at a vertex other than `a` that `N` misses, since it would then
be augmenting for `N` in `G − a`. Exchanging the edges of `P` in `M`, and adding the edge `ad` when
`P` ends at `a`, gives a maximum matching of `G` missing `u`. So `D(G − a) = D(G)`, and the other
two sets follow because `a ∉ D(G)`.
Deleting the vertices of `A(G)` one at a time gives a graph in which no vertex of `D(G)` has a
neighbour outside `D(G)`. Each component of the subgraph on `D(G)` is then a component of that graph
in which every vertex is missed by some maximum matching, so it is factor-critical by 4.2; the
vertices of `C(G)` are covered by every maximum matching and have no neighbour in `D(G)`, so a
maximum matching restricted to `C(G)` is perfect. Counting the edges of such a matching in each
component and adding `|A(G)|` gives the equality. (Proved here, following this route.)

**Checks.**
- `K_(1,3)`: `D` is the set of leaves, `A` the centre, `C` empty, and `2 · 1 + 3 = 4 + 1`.
- `K_(2,3)`: `D` is the side with three vertices, `A` the side with two, `C` empty; `ν = 2`, and
  `2 · 2 + 3 = 5 + 2`.
- A graph with a perfect matching (the path `a b c d`, `K_4`, the Petersen graph) has `D` and `A`
  empty and `C = V`; conversely `D` is empty only when `G` has a perfect matching.
- One edge and an isolated vertex: `D` is the isolated vertex, `A` is empty, `C` is the edge.
- The edgeless graph on three vertices has `D = V`, and an odd cycle has `D = V`; the empty vertex
  type has all three sets empty.
- On every graph with at most seven vertices up to isomorphism, and on 900 random graphs with eight
  or nine vertices, all three statements hold and the odd components of `G − A(G)` are the
  components of the subgraph on `D(G)`; the stability lemma holds for every vertex of `A(G)` of
  every graph with at most seven vertices and of 400 random graphs with eight vertices.

*Needs:* 4.2, 4.1, 3.1, 1.1; Mathlib `SimpleGraph.induce`, `SimpleGraph.ConnectedComponent.supp`.

### 4.4 Maximum matchings and the decomposition

Prove `IsMaximumMatching.gallaiEdmonds`: every maximum matching `M` of `G`

- matches each vertex of `A(G)` to a vertex of `D(G)`;
- matches distinct vertices of `A(G)` into distinct components of the subgraph on `D(G)`;
- matches each vertex of `C(G)` to a vertex of `C(G)`;
- in each component of the subgraph on `D(G)`, leaves exactly one vertex that is not matched to a
  vertex of the same component.

(Gallai, 1964; Edmonds, 1965; the argument is the one Diestel gives on p. 47 for a set `S` as in
his Theorem 2.2.3.)

Route: by 3.1 at `U = A(G)`, every matching leaves at least `o(G − A(G)) − |A(G)|` vertices
unmatched, and by 4.3 a maximum matching leaves exactly that many. Equality forces each vertex of
`A(G)` to be matched into its own odd component of `G − A(G)`, and each such component to have
exactly one vertex not matched inside it; a vertex of `C(G)` is covered by `M`, by the definition
of `D(G)`, and its partner is not in `D(G)`, nor in `A(G)`, since every vertex of `A(G)` is matched
into `D(G)`. (Proved here, following this route.)

**Checks.**
- `K_(1,3)`: every maximum matching joins the centre to one leaf; each leaf is a component of the
  subgraph on `D` with exactly one vertex not matched inside it.
- `K_(2,3)`: the two vertices of `A` are matched to two of the three isolated vertices of `D`, and
  the third is unmatched.
- The statement holds for every maximum matching of every graph with at most seven vertices up to
  isomorphism and of 900 random graphs with eight or nine vertices.

*Needs:* 4.3, 3.1, 1.1; Mathlib `SimpleGraph.induce`, `SimpleGraph.ConnectedComponent`.

### Examples

Stars, `K_(2,3)`, the path on three vertices, odd cycles, two disjoint triangles, a graph with an
isolated vertex and graphs with perfect matchings, with their sets `D`, `A`, `C` and their maximum
matchings.

### Dependencies

Layers 1 and 3. Mathlib `SimpleGraph.Subgraph.IsMatching`, `SimpleGraph.Connected`,
`SimpleGraph.dist`, `SimpleGraph.induce`, `SimpleGraph.ConnectedComponent`, `SimpleGraph.ConnectedComponent.supp`.

## Layer 5: perfect matchings in regular and symmetric graphs

### 5.1 Petersen's theorem

Prove `exists_isPerfectMatching_of_isRegularOfDegree_three`: a finite graph in which every vertex
has degree `3` and no edge is a bridge has a perfect matching (Petersen, 1891; Diestel, Corollary
2.2.2, p. 45; Schrijver, Exercise 5.2, p. 80). The graph need not be connected.

Route (the counting argument of Diestel's proof of Corollary 2.2.2, p. 45): by Mathlib's
`SimpleGraph.tutte` it suffices that `o(G − U) ≤ |U|` for every `U`. Fix an odd component `K` of
`G − U` and let `e(K, U)` be the number of edges between `K` and `U`. Counting edge ends at the
vertices of `K` gives `3|K| = 2·(edges inside K) + e(K, U)`, so `e(K, U)` is odd. It is not `1`,
since a single edge leaving `K` would be a bridge, so `e(K, U) ≥ 3`. Summing over the odd
components, `3·o(G − U) ≤ e(G − U, U) ≤ 3|U|`, the last because every vertex of `U` has degree
`3`.

**Checks.**
- The Petersen graph is 3-regular and has no bridge; it has six perfect matchings.
- The bridges matter. Take three copies of `K_4`, subdivide one edge of each by a new vertex, and
  join the three new vertices to one further vertex: the result is 3-regular on sixteen vertices,
  has three bridges, and deleting the central vertex leaves three odd components, so it has no
  perfect matching.
- The degree condition matters: `K_(2,4)` has no bridge and six vertices, and its matching number
  is `2`.
- Two disjoint copies of `K_4` satisfy the hypotheses and have a perfect matching.
- In 2400 random 3-regular graphs with four to fourteen vertices, every one without a bridge has a
  perfect matching.

*Needs:* Mathlib `SimpleGraph.tutte`, `SimpleGraph.IsRegularOfDegree`, `SimpleGraph.IsBridge`,
`SimpleGraph.isBridge_iff`, `SimpleGraph.sum_degrees_eq_twice_card_edges`. (Proved here, following
the cited route.)

### 5.2 Vertex-transitive graphs

Prove `exists_isPerfectMatching_of_vertexTransitive`: if `V` is finite, `G` is connected, every
vertex can be sent to every other by an automorphism of `G`, and `n` is even, then `G` has a
perfect matching (Diestel, Chapter 2, Exercise 19, p. 58).

Route: an automorphism maps maximum matchings to maximum matchings, so `D(G)` is invariant and is
either empty or all of `V`. If it is all of `V`, `G` is factor-critical by 4.2 and has odd order by
4.1. So `D(G)` is empty, and every maximum matching is perfect.

**Checks.**
- Connectivity is needed: two disjoint triangles form a vertex-transitive graph on six vertices
  without a perfect matching.
- Evenness is needed: the 5-cycle is connected and vertex-transitive.
- The cube, the Petersen graph, the prism over the 5-cycle, `K_(3,3)` and every connected circulant
  graph with at most twelve vertices satisfy the theorem.

*Needs:* 4.1, 4.2, 4.3 (the set `D(G)`); Mathlib `SimpleGraph.Iso`,
`SimpleGraph.Subgraph.IsMatching.map`. (Proved here, following this route.)

### Examples

The Petersen graph, the cubic graph on sixteen vertices with three bridges, `K_(2,4)`, two disjoint
copies of `K_4`, cycles, cubes and circulant graphs.

### Dependencies

Layer 4 (for 5.2). Mathlib `SimpleGraph.tutte`, `SimpleGraph.IsRegularOfDegree`,
`SimpleGraph.IsBridge`, `SimpleGraph.isBridge_iff`, `SimpleGraph.sum_degrees_eq_twice_card_edges`,
`SimpleGraph.Iso`, `SimpleGraph.Subgraph.IsMatching.map`.

## Scope and ownership

This roadmap owns the targets stated above: the matching number, maximum matchings and the edge
cover number with Gallai's identities and Kőnig's edge cover theorem; augmenting paths and Berge's
theorem; the Tutte–Berge formula with the edge cover formula; factor-critical sets, Gallai's lemma,
the Gallai–Edmonds decomposition and the structure of maximum matchings; Petersen's theorem on
cubic graphs and perfect matchings in vertex-transitive graphs.

Already in the libraries and therefore not targets:

- Mathlib's matchings and perfect matchings with their basic facts
  (`SimpleGraph.Subgraph.IsMatching`, `SimpleGraph.Subgraph.IsPerfectMatching`, the even number of
  matched vertices), odd components and the parity of their number, vertex covers with
  `SimpleGraph.isIndepSet_compl_iff_isVertexCover` and `SimpleGraph.vertexCoverNum`, Hall's
  theorem for bipartite graphs, and Tutte's theorem `SimpleGraph.tutte`, which 3.2 and 5.1 consume
  and which the Tutte–Berge formula of 3.2 extends.
- Tau Ceti's perfect matchings of a finite type, the fixed-point-free involutions of
  `TauCeti/Combinatorics/Enumerative/PerfectMatching.lean` with their count `(2m − 1)‼`, are a
  different object (all pairings of a set, with no graph) and are not used.

Left to other roadmaps:

- GraphConnectivityAndFlows owns Kőnig's matching theorem and Hall's theorem with capacities and
  deficiency (its §6.7 and §6.8), perfect matchings and edge-colourings of regular bipartite
  multigraphs (its §6.9), and ear decompositions (its §7). 1.3 consumes §6.7 at unit capacities;
  nothing of that roadmap is restated. That roadmap leaves general matching theory beyond the
  bipartite case to others, and this roadmap is that theory.
- ApproximationGuarantees §2.1 (an open roadmap, not on main) states that a matching is maximal
  exactly when its vertices form a vertex cover and that a matching has at most `τ(G)` edges. Those
  statements concern maximal matchings and the vertex cover number; the targets here concern
  maximum matchings, the edge cover number and odd components, and none of them restates the
  statements of that section. This roadmap does not depend on that one.
- MatroidOptimization (an open roadmap, not on main) treats Kőnig's theorem as a case of matroid
  intersection without restating it; nothing here concerns matroids. This roadmap does not depend
  on that one.
- StableMatching (an open roadmap, not on main) treats stable matchings in two-sided markets;
  nothing here concerns preferences. This roadmap does not depend on that one.

Outside the scope: weighted matchings and the matching polytope, Edmonds' blossom algorithm and
every procedure for finding a matching, running times; the odd ear characterization of
factor-critical graphs, elementary graphs, bricks and the tight cut decomposition; `b`-matchings,
`f`-factors and Tutte's `f`-factor theorem; Petersen's theorem that every regular graph of positive
even degree has a 2-factor, which needs Euler tours, and the strengthenings of Petersen's theorem
that prescribe or avoid edges; counting perfect matchings (permanents, Pfaffians, the
van der Waerden and Bregman bounds); fractional matchings; the matching polynomial; matchings in
random and infinite graphs beyond the definitions of Layer 1.

## Exact supplier contracts

### From Mathlib

- `Mathlib/Combinatorics/SimpleGraph/Matching.lean`: `SimpleGraph.Subgraph.IsMatching` (every
  vertex of `M.verts` has a unique neighbour in `M`); `SimpleGraph.Subgraph.IsPerfectMatching`
  (a matching with `M.IsSpanning`); `SimpleGraph.Subgraph.IsMatching.even_card` (for a finite
  vertex set of `M`, its size is even); `SimpleGraph.Subgraph.IsMatching.map` (for an injective
  graph homomorphism `f`, the image `M.map f` of a matching `M` is a matching).
- `Mathlib/Combinatorics/SimpleGraph/Tutte.lean`: `SimpleGraph.IsTutteViolator G u`
  (`u.ncard < ((⊤ : G.Subgraph).deleteVerts u).coe.oddComponents.ncard`); `SimpleGraph.tutte` (for
  `[Finite V]`: `G` has a perfect matching if and only if no set is a Tutte violator).
- `Mathlib/Combinatorics/SimpleGraph/Connectivity/Finite.lean`: `SimpleGraph.oddComponents` (the
  components whose support has odd `Set.ncard`); `SimpleGraph.odd_ncard_oddComponents` (for
  `[Finite V]`, the number of odd components is odd if and only if `Nat.card V` is).
- `Mathlib/Combinatorics/SimpleGraph/Subgraph.lean`: `SimpleGraph.Subgraph.deleteVerts`,
  `SimpleGraph.Subgraph.coe`.
- `Mathlib/Combinatorics/SimpleGraph/VertexCover.lean`: `SimpleGraph.IsVertexCover`,
  `SimpleGraph.vertexCoverNum` (the infimum in `ℕ∞` of the `Set.encard` of the vertex covers),
  `SimpleGraph.isIndepSet_compl_iff_isVertexCover` (`G.IsIndepSet cᶜ ↔ G.IsVertexCover c`).
- `Mathlib/Combinatorics/SimpleGraph/Clique.lean`: `SimpleGraph.indepNum` (the supremum in `ℕ` of
  the sizes of the independent sets).
- `Mathlib/Combinatorics/SimpleGraph/Connectivity/Connected.lean`: `SimpleGraph.IsBridge`,
  `SimpleGraph.isBridge_iff` (`G.IsBridge s(u, v) ↔ ¬(G.deleteEdges {s(u, v)}).Reachable u v`),
  `SimpleGraph.Connected`, `SimpleGraph.ConnectedComponent`, `SimpleGraph.ConnectedComponent.supp`.
  `Mathlib/Combinatorics/SimpleGraph/Metric.lean`: `SimpleGraph.dist` (the length of a shortest
  walk, `0` when there is none).
- `Mathlib/Combinatorics/SimpleGraph/Finite.lean`: `SimpleGraph.IsRegularOfDegree` (every vertex has
  degree `d`, for a locally finite graph). `Mathlib/Combinatorics/SimpleGraph/DegreeSum.lean`:
  `SimpleGraph.sum_degrees_eq_twice_card_edges`.
- `Mathlib/Combinatorics/SimpleGraph/Bipartite.lean`: `SimpleGraph.IsBipartite`.
- `Mathlib/Combinatorics/SimpleGraph/Maps.lean`: `SimpleGraph.induce`, `SimpleGraph.Iso`.
  `Mathlib/Combinatorics/SimpleGraph/Paths.lean`: `SimpleGraph.Walk.IsPath` (a walk without
  repeated vertices). `Mathlib/Combinatorics/SimpleGraph/Walk/Basic.lean`: `SimpleGraph.Walk.edges`
  (the list of edges of a walk, in order).
- Basic Mathlib: `Set.encard`, `Set.ncard`, `ENat.card`, `Nat.card`.

### From TauCetiRoadmap.GraphConnectivityAndFlows

- §6.7, the multiset capacitated Kőnig theorem, at unit capacities: for a finite bipartite graph
  the largest size of a matching equals the least size of a vertex cover, transported to Mathlib's
  `SimpleGraph.Subgraph.IsMatching` and `SimpleGraph.IsVertexCover`. Consumed by 1.3 only.

## References

- Alexander Schrijver, *A Course in Combinatorial Optimization*, lecture notes, version of
  March 23, 2017, on the author's page (`homepages.cwi.nl/~lex/files/dict.pdf`): §3.1 with (1),
  (2) and Theorem 3.1, p. 39; §3.2 with (6), (7) and Theorem 3.2, pp. 40–41; Corollary 3.3a,
  p. 42; §5.1 with Theorem 5.1, p. 78, Corollaries 5.1a and 5.1b, p. 79, and Exercise 5.2, p. 80.
- Reinhard Diestel, *Graph Theory*, sixth edition, 2025; the free preview of Chapter 2 on the
  author's site (`diestel-graph-theory.com`, chapter file of June 2024): Theorem 2.2.1, p. 44;
  Corollary 2.2.2, the definition of factor-critical graphs and Theorem 2.2.3, p. 45; the
  discussion of maximum matchings, p. 47; Exercises 1, 19 and 20, pp. 56–58; the notes, p. 60.
- Michel X. Goemans, *Advanced Combinatorial Optimization*, MIT course 18.438, Lecture 3 of
  17 September 2009 (scribe Aleksander Mądry), on the author's page
  (`math.mit.edu/~goemans/18438F09/lec3.pdf`): Theorem 1 (Tutte–Berge formula), p. 3-1, and
  Theorem 2 (the Gallai–Edmonds decomposition), p. 3-2, with its proof, pp. 3-2 to 3-5.
- The papers of Petersen (1891), Tutte (1947), Berge (1957, 1958), Gallai (1959, 1963, 1964) and
  Edmonds (1965) are named as the sources above attribute the results, or by customary attribution
  where they do not (Berge's theorem of 2.2 and Gallai's lemma of 4.2); no locator is given for
  them. L. Lovász and M. D. Plummer, *Matching Theory* (1986), is the comprehensive account that
  Diestel cites for the full Gallai–Edmonds theorem; it was not consulted.
