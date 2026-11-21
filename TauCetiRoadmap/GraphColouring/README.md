# Roadmap: graph colouring

**Summary.** This roadmap develops the classical bounds on the chromatic number and the chromatic
index of a simple graph in terms of its degrees, together with the graphs that show where each
bound stops. A colouring assigns colours to the vertices so that adjacent vertices differ; an edge
colouring assigns colours to the edges so that edges with a common end differ. Graphs are simple;
each statement says whether the vertex set must be finite, and the empty graph and the graphs
without edges are admitted throughout. Every target is a statement about a
graph, its colourings, its degrees, its independent sets or its orientations; no procedure for
finding a colouring is specified.

The headline theorems are these.

- *Brooks' theorem and its extremal graphs.* A connected finite graph of maximum degree `Δ` that
  is neither complete nor an odd cycle can be coloured with `Δ` colours. Every finite graph can be
  coloured with `Δ + 1` colours, and a connected finite graph needs `Δ + 1` colours exactly when
  it is complete or an odd cycle.
- *Vizing's theorem.* The edges of a finite simple graph of maximum degree `Δ` can be coloured
  with `Δ + 1` colours, and at least `Δ` are needed. A `d`-regular graph with `d ≥ 1` on an odd
  number of vertices needs `d + 1`.
- *The theorem of Gallai, Roy and Vitaver.* If some orientation of a graph has no directed path
  with `k` arcs, the graph can be coloured with `k` colours. So every orientation of a finite
  graph has a directed path with at least `χ(G)` vertices, and every graph that can be coloured
  with `k` colours has an acyclic orientation with no directed path on more than `k` vertices.
- *Mycielski's construction.* The Mycielskian of a graph has chromatic number exactly one more,
  and it has no triangle when the graph has none. Hence for every `k` there is a finite graph
  with no triangle and chromatic number `k`.

The roadmap builds on Mathlib's simple graphs, which supply colourings, the chromatic number with
values in `ℕ∞`, degrees, cliques, independent sets, cycle graphs, line graphs and a compactness
theorem for homomorphisms into finite graphs. Orientations are those of the Tau Ceti library, a
choice of one dart over each edge, with their quivers of chosen darts and acyclicity, as
ZigzagPreprojective uses them. GraphConnectivityAndFlows proves Kőnig's theorem that a bipartite
graph has chromatic index equal to its maximum degree; it is not restated here. Planar graphs
and the five- and four-colour theorems are not treated here.

## How to read the build

Layer 1 below proves the upper bounds from degrees and degeneracy and the lower bounds from
independent sets, among them the two Nordhaus–Gaddum inequalities for a graph and its complement;
it depends on no other layer. Layer 2 proves Brooks' theorem and characterizes the connected
graphs that need `Δ + 1` colours. Layer 3 treats orientations and the theorem of Gallai, Roy and
Vitaver; Layer 4 treats the Mycielskian; Layer 5 treats edge colourings, Vizing's theorem and its
regular graphs of odd order. Layers 2, 3, 4 and 5 depend on no other layer. Within a layer the
sections are in build order.

## Conventions

- **Graphs.** A graph is a Mathlib `SimpleGraph V`. Where a statement needs finitely many vertices
  it assumes `[Fintype V]`, and `n` is `Fintype.card V`; the empty vertex type is allowed. `Gᶜ` is
  the complement. A graph is complete when it is `⊤`; on at most one vertex `⊤` and `⊥` agree.
  `G.Connected` includes nonemptiness, so the empty graph is not connected.
- **Colourings.** A colouring of `G` by `α` is a Mathlib `G.Coloring α`, a homomorphism to the
  complete graph on `α`. `G.Colorable k` says that a colouring by `Fin k` exists; `G.Colorable 0`
  holds exactly on the empty vertex type, and `G.Colorable 1` exactly when `G` has no edge. The
  chromatic number `G.chromaticNumber` lies in `ℕ∞`: it is `⊤` when no `k` works, and on a finite
  vertex type it is at most `n`, `0` on the empty type. Statements use `G.Colorable k` where a
  natural number of colours is given and `G.chromaticNumber` otherwise; arithmetic on the latter
  is in `ℕ∞`, where `⊤ + 1 = ⊤`.
- **Degrees.** `G.degree v`, `G.maxDegree` and `G.minDegree` are Mathlib's, for `[Fintype V]` and
  `[DecidableRel G.Adj]`; the maximum and minimum degree are `0` on the empty type. The degree of
  `v` inside a finite set `s` of vertices is the number `#{w ∈ s | G.Adj v w}` of its neighbours in
  `s`.
- **Independent sets and cliques.** `G.indepNum` and `G.cliqueNum` are Mathlib's, valued in `ℕ`;
  on a finite type they are the largest sizes of an independent set and of a clique, and `0` on
  the empty type. An independent set of `G` is a clique of `Gᶜ`.
- **Odd cycles.** `IsOddCycle G` says that `G` is isomorphic to Mathlib's `cycleGraph m` for some
  odd `m ≥ 3`. `cycleGraph 3` is the triangle, which is both complete and an odd cycle.
- **Edge colourings.** A proper edge colouring of `G` by `α` is a colouring by `α` of Mathlib's
  line graph `G.lineGraph`, whose vertices are the edges of `G`, two of them adjacent when they
  are distinct and share an end. The chromatic index of `G`, written `χ'(G)`, is
  `G.lineGraph.chromaticNumber`. A graph without edges has chromatic index `0`. No new carrier is
  introduced. GraphConnectivityAndFlows §6.9 expresses the edge colourings of its multigraphs as
  colourings of a line graph of its own, on their edge identities, which it relates to
  `SimpleGraph.lineGraph`.
- **Orientations and directed paths.** An orientation of `G` is a Tau Ceti
  `TauCeti.DoubledQuiver.Orientation G`: a set of darts of `G` containing exactly one of the two
  darts over each edge. Its arcs form the quiver `TauCeti.DoubledQuiver.OrientedQuiver G o`, whose
  vertices are those of `G`, with one arrow from `u` to `v` exactly when the dart `(u, v)` is
  chosen. A directed walk is a Mathlib `Quiver.Path` in this quiver; its length is its number of
  arcs, and its list of vertices, `Quiver.Path.vertices`, has one more entry. A directed path is a
  directed walk whose list of vertices has no repetition. GraphConnectivityAndFlows likewise takes
  the directed walks of orientations to be Mathlib quiver paths, with simple paths read off
  `Quiver.Path.vertices` (its Conventions, under graphs, networks and orientations), although it
  passes the quiver of arrows as an explicit argument where this roadmap uses the instance on
  `TauCeti.DoubledQuiver.OrientedQuiver G o`. An orientation is acyclic when its quiver is
  `TauCeti.Quiver.IsAcyclic`: every directed closed walk is trivial.

## Layer 1: degree bounds and independent sets

### 1.1 Degeneracy and the maximum degree

- `colorable_succ_of_forall_exists_card_le`: if every nonempty finite set `s` of vertices contains
  a vertex with at most `k` neighbours in `s`, then `G.Colorable (k + 1)`. No finiteness of `V` is
  assumed. For a finite graph the least such `k` is the largest minimum degree of an induced
  subgraph, so this is the bound `χ(G) ≤ 1 + max δ(H)` over the induced subgraphs `H` of `G`
  (Szekeres and Wilf, 1968; Bondy–Murty, Exercise 8.1.5, p. 121; Diestel, Proposition 5.2.2,
  p. 127, which takes the maximum over all subgraphs, with the same value).
- `colorable_maxDegree_add_one`: every finite graph satisfies `G.Colorable (G.maxDegree + 1)`
  (Bondy–Murty, Corollary 8.1.2, p. 118). It is the case `k = Δ` of the first statement.

Route for a finite graph: induction on `n`. Remove a vertex `v` with at most `k` neighbours; the
rest satisfies the same hypothesis, so it has a colouring by `k + 1` colours, and one of them is
not used on the neighbours of `v`. Equivalently, list the vertices so that each has at most `k`
neighbours earlier in the list and give each vertex the first colour not used on those neighbours;
this is the proof, not a target. For an infinite graph every finite subgraph satisfies the
hypothesis, so it is `(k + 1)`-colourable, and Mathlib's
`SimpleGraph.nonempty_hom_of_forall_finite_subgraph_hom` assembles these colourings into a
homomorphism to the complete graph on `Fin (k + 1)`.

**Checks.**
- The hypothesis must hold for every subset, not only for `V`: the complete graph on four vertices
  with one more vertex joined to one of them has minimum degree `1` and chromatic number `4`; its
  least admissible `k` is `3`.
- The star `K_(1, 5)` has `k = 1`, so it is `2`-colourable, while `Δ + 1 = 6`.
- For `k = 0` the hypothesis says that `G` has no edge, and `G.Colorable 1` says the same.
- On the empty vertex type the hypothesis is vacuous and every `G.Colorable m` holds; there
  `Δ = 0` and `χ = 0`.
- Complete graphs and odd cycles attain `Δ + 1`: `χ(Kₙ) = n` with `Δ = n − 1` for `n ≥ 1`, and
  `χ(C₂ₘ₊₁) = 3` with `Δ = 2` for `m ≥ 1`.

*Needs:* Mathlib `SimpleGraph.Colorable`, `SimpleGraph.Coloring`, `SimpleGraph.maxDegree`,
`SimpleGraph.degree_le_maxDegree`, `SimpleGraph.nonempty_hom_of_forall_finite_subgraph_hom`.
(Proved here, except as cited.)

### 1.2 Independent sets

Prove `card_le_chromaticNumber_mul_indepNum`: on a finite vertex type, `n ≤ χ(G) · α(G)` in `ℕ∞`,
where `α(G)` is `G.indepNum` (Diestel, Chapter 5, Exercise 52, p. 152, in the form
`χ(G) ≥ ⌈n/α(G)⌉`). The other lower bound of that exercise, `ω(G) ≤ χ(G)`, is Mathlib's
`SimpleGraph.cliqueNum_le_chromaticNumber` and is not restated.

Route: the colour classes of a colouring by `Fin k` are independent
(`SimpleGraph.Coloring.isIndepSet_colorClass`), so each has at most `α(G)` vertices
(`SimpleGraph.IsIndepSet.card_le_indepNum`), and they partition `V`.

**Checks.**
- `C₅`: `5 ≤ 3 · 2`, strict; `C₇`: `7 ≤ 3 · 3`; the Petersen graph: `10 ≤ 3 · 4`.
- `Kₙ` attains the bound, `n = n · 1`; on the empty type both sides are `0`.

*Needs:* Mathlib `SimpleGraph.chromaticNumber`, `SimpleGraph.indepNum`,
`SimpleGraph.Coloring.isIndepSet_colorClass`, `SimpleGraph.IsIndepSet.card_le_indepNum`,
`SimpleGraph.Colorable.chromaticNumber_le`. (Proved here.)

### 1.3 A graph and its complement

- `chromaticNumber_add_chromaticNumber_compl_le`: on a finite vertex type,
  `χ(G) + χ(Gᶜ) ≤ n + 1` (Nordhaus and Gaddum, 1956; Bondy–Murty, Exercise 8.1.4 (b), p. 121).
- `card_le_chromaticNumber_mul_chromaticNumber_compl`: on a finite vertex type,
  `n ≤ χ(G) · χ(Gᶜ)` (Nordhaus and Gaddum, 1956; proved here from 1.2).

Route for the sum: induction on `n`, deleting a vertex `v`. Write `G'` for `G − v`, so that
`G'ᶜ = Gᶜ − v` and `χ(G') + χ(G'ᶜ) ≤ n` by induction. Each of `χ(G)` and `χ(Gᶜ)` exceeds its value
on `G'` by at most one. If `χ(G) = χ(G') + 1`, every colouring of `G'` by `χ(G')` colours uses all
of them on the neighbours of `v`, so `deg_G v ≥ χ(G')`; likewise for `Gᶜ`. Both cannot happen when
`χ(G') + χ(G'ᶜ) = n`, since `deg_G v + deg_Gᶜ v = n − 1`. Route for the product: by 1.2,
`n ≤ χ(G) · α(G)`, and `α(G) = ω(Gᶜ) ≤ χ(Gᶜ)` by Mathlib's `SimpleGraph.cliqueNum_compl` and
`SimpleGraph.cliqueNum_le_chromaticNumber`. The two remaining inequalities of Nordhaus and Gaddum,
`2√n ≤ χ(G) + χ(Gᶜ)` and `χ(G) · χ(Gᶜ) ≤ ((n + 1)/2)²`, follow from these two by the inequality
between the arithmetic and geometric means.

**Checks.**
- `Kₙ` attains both bounds: `n + 1` and `n · 1`.
- `C₅` is isomorphic to its complement: `3 + 3 = 6 = n + 1`, and `3 · 3 = 9 ≥ 5`.
- `C₇`: `χ = 3` and `χ(C₇ᶜ) = 4`, so `7 ≤ 8` and `12 ≥ 7`.
- On the empty type `0 ≤ 1` and `0 ≤ 0`; on one vertex `1 + 1 = 2`.

*Needs:* 1.2; Mathlib `SimpleGraph.chromaticNumber`, `SimpleGraph.cliqueNum_compl`,
`SimpleGraph.cliqueNum_le_chromaticNumber`, `SimpleGraph.induce`. (Proved here, except as cited.)

### Examples

Complete graphs, odd and even cycles, stars, the complete graph on four vertices with a pendant
vertex and the Petersen graph, with their chromatic numbers, maximum degrees, independence numbers
and the least `k` of 1.1. Every statement of this layer holds on all labelled graphs with at most
seven vertices.

### Dependencies

Mathlib `SimpleGraph.Colorable`, `SimpleGraph.Coloring`, `SimpleGraph.chromaticNumber`,
`SimpleGraph.maxDegree`, `SimpleGraph.degree_le_maxDegree`,
`SimpleGraph.nonempty_hom_of_forall_finite_subgraph_hom`, `SimpleGraph.indepNum`,
`SimpleGraph.Coloring.isIndepSet_colorClass`, `SimpleGraph.IsIndepSet.card_le_indepNum`,
`SimpleGraph.Colorable.chromaticNumber_le`, `SimpleGraph.cliqueNum_compl`,
`SimpleGraph.cliqueNum_le_chromaticNumber`, `SimpleGraph.induce`. No other layer.

## Layer 2: Brooks' theorem

### 2.1 Brooks' theorem

Define `IsOddCycle G` as in the Conventions. Prove `colorable_maxDegree_of_connected`: if `V` is
finite, `G` is connected, `G ≠ ⊤` and `G` is not an odd cycle, then `G.Colorable G.maxDegree`
(Brooks, 1941; Bondy–Murty, Theorem 8.4, p. 122; Diestel, Theorem 5.2.4, p. 127).

Route (Diestel, proof of Theorem 5.2.4, pp. 128–129): induction on `n`. If `Δ ≤ 2`, `G` is a path
or a cycle; a connected graph with `Δ ≤ 1` is `K₁` or `K₂`, both complete, and a path on at least
three vertices or an even cycle is `2`-colourable. For `Δ ≥ 3`, suppose `G` is not
`Δ`-colourable and pick a vertex `v`. Every component of `G − v` is `Δ`-colourable: by
induction, or, when it is complete or an odd cycle, because one of its vertices is adjacent to
`v`, so that its maximum degree is less than `Δ`. Every `Δ`-colouring of `G − v` uses all `Δ`
colours on the neighbours `v₁, …, v_Δ` of `v`. For colours
`i ≠ j` the vertices `vᵢ` and `vⱼ` lie in one component of the subgraph spanned by the colours `i`
and `j`, and that component is a path from `vᵢ` to `vⱼ`; for distinct `i`, `j`, `l` the paths for
`{i, j}` and `{i, l}` meet only in `vᵢ`. If the neighbours of `v` are pairwise adjacent, `G` is
`K_(Δ + 1)`; otherwise, with `v₁` and `v₂` nonadjacent, exchanging two colours along one path
gives a colouring that violates the last property.

**Checks.**
- Each exclusion is needed: `Kₙ` with `n ≥ 1` and every odd cycle have `χ = Δ + 1`.
- Connectivity is needed: the disjoint union of a triangle and an isolated vertex is neither
  complete nor an odd cycle, and has `χ = 3 > 2 = Δ`.
- The Petersen graph has `Δ = 3` and `χ = 3`; `K_(3, 3)` has `Δ = 3` and `χ = 2`.
- The theorem holds on every connected labelled graph with at most seven vertices; on six vertices
  it applies to 26703 of the 32768 labelled graphs.

*Needs:* Mathlib `SimpleGraph.Connected`, `SimpleGraph.maxDegree`, `SimpleGraph.Colorable`,
`SimpleGraph.cycleGraph`, `SimpleGraph.Iso`, `SimpleGraph.colorable_iff_forall_connectedComponent`.
(Proved here, following the cited route.)

### 2.2 The graphs that need `Δ + 1` colours

Prove `chromaticNumber_eq_maxDegree_add_one_iff`: a connected finite graph has
`χ(G) = Δ(G) + 1` if and only if it is complete or an odd cycle (Bondy–Murty, §8.2, p. 122, the
remark before Theorem 8.4; Diestel, p. 127, the remark before Theorem 5.2.4).

Route: if `G` is neither, 2.1 gives `χ ≤ Δ`. Conversely Mathlib computes `χ(Kₙ) = n`
(`SimpleGraph.chromaticNumber_top`) with `Δ(Kₙ) = n − 1` (`SimpleGraph.maxDegree_top`, `n ≥ 1`
since `G` is connected), and `χ(Cₘ) = 3` for odd `m ≥ 3`
(`SimpleGraph.chromaticNumber_cycleGraph_of_odd`), with `Δ = 2`; both values transfer along an
isomorphism (`SimpleGraph.chromaticNumber_congr`, `SimpleGraph.Iso.maxDegree_eq`).

**Checks.**
- Connectivity is needed: the triangle with an isolated vertex has `χ = 3 = Δ + 1`.
- `K₁` is complete and has `χ = 1 = 0 + 1`; `K₂` has `χ = 2 = 1 + 1`.
- On every connected labelled graph with at most seven vertices the two sides agree.

*Needs:* 2.1; Mathlib `SimpleGraph.chromaticNumber_top`, `SimpleGraph.maxDegree_top`,
`SimpleGraph.chromaticNumber_cycleGraph_of_odd`, `SimpleGraph.chromaticNumber_congr`,
`SimpleGraph.Iso.maxDegree_eq`. (Proved here, except as cited.)

### Examples

Complete graphs, cycles of each parity, paths, the triangle with an isolated vertex, `K_(3, 3)` and
the Petersen graph, with `χ` and `Δ`.

### Dependencies

Mathlib `SimpleGraph.Connected`, `SimpleGraph.maxDegree`, `SimpleGraph.Colorable`,
`SimpleGraph.cycleGraph`, `SimpleGraph.Iso`, `SimpleGraph.colorable_iff_forall_connectedComponent`,
`SimpleGraph.chromaticNumber_top`, `SimpleGraph.maxDegree_top`,
`SimpleGraph.chromaticNumber_cycleGraph_of_odd`, `SimpleGraph.chromaticNumber_congr`,
`SimpleGraph.Iso.maxDegree_eq`. No other layer.

## Layer 3: orientations and directed paths

### 3.1 The theorem of Gallai, Roy and Vitaver

Prove `colorable_of_forall_length_lt`: if `o` is an orientation of `G` and every directed path has
fewer than `k` arcs, then `G.Colorable k` (Gallai, 1968; Roy, 1967; Vitaver, 1962; Bondy–Murty,
Theorem 10.1, p. 174, for finite graphs; Diestel, Chapter 5, Exercise 18, p. 149, the implication
from (ii) to (i)). No finiteness of `V` is assumed. For a finite graph, taking for `k` the number
of vertices of a longest directed path, this says that every orientation has a directed path with
at least `χ(G)` vertices.

Route for a finite graph (Bondy–Murty, proof of Theorem 10.1): remove a minimal set `A` of arcs
whose removal leaves no directed cycle, and give each vertex `v` the number of vertices of a
longest directed path starting at `v` in what remains. An arc `(u, v)` that remains extends such a
path from `v` to a longer one from `u`; an arc `(u, v)` in `A` lies, by minimality, on a directed
cycle of the remaining arcs together with it, so a remaining directed path runs from `v` to `u`.
In both cases the two ends get different values, and the values lie in `{1, …, k}`. For an
infinite graph, apply this to every finite subgraph with the restricted orientation and use
Mathlib's `SimpleGraph.nonempty_hom_of_forall_finite_subgraph_hom`.

**Checks.**
- The existence of a directed path with at least `χ(G)` vertices needs finiteness: the complete
  graph on `ℕ`, oriented from the smaller to the larger end (Tau Ceti's
  `TauCeti.DoubledQuiver.Orientation.ofLinearOrder`), has `χ = ⊤` and only finite directed paths,
  so no directed path has at least `χ` vertices. It has directed paths with any number of arcs,
  so the hypothesis of the theorem fails for every `k` and the theorem itself is not contradicted.
- Every orientation of `C₅` has a directed path with at least three vertices; the cyclic one has
  one through all five.
- For `Kₙ` every orientation, a tournament, has a directed path through all `n` vertices
  (Bondy–Murty, Corollary 10.1, p. 175).
- For `k = 0` the hypothesis fails on every nonempty type, since a single vertex is a directed
  path with no arc, and on the empty type `G.Colorable 0` holds.
- On every labelled graph with at most five vertices, every orientation has a directed path with
  at least `χ` vertices, and the least number of vertices of a longest directed path, over all
  orientations and over the acyclic ones, is `χ`.

*Needs:* Tau Ceti `TauCeti.DoubledQuiver.Orientation`, `TauCeti.DoubledQuiver.OrientedQuiver`;
Mathlib `Quiver.Path`, `Quiver.Path.vertices`, `SimpleGraph.Colorable`,
`SimpleGraph.nonempty_hom_of_forall_finite_subgraph_hom`. (Proved here, following the cited
route.)

### 3.2 Sharpness

Prove `exists_isAcyclic_orientation_of_colorable`: if `G.Colorable k`, some orientation of `G` is
acyclic and has no directed path with `k` arcs (Bondy–Murty, p. 174, the remark after
Theorem 10.1; Diestel, Chapter 5, Exercise 18, p. 149, the implication from (i) to (iii)). With 3.1
this makes `χ(G)`, for a finite graph, the least over all orientations of the number of vertices
of a longest directed path.

Route: given a colouring `c` by `Fin k`, choose the darts `(u, v)` with `c u < c v`. Adjacent
vertices have different colours, so exactly one dart over each edge is chosen; colours increase
strictly along every directed walk, so a directed walk has at most `k` vertices, and in
particular has distinct vertices, and no directed closed walk is nontrivial. For a colouring by
`Bool` this orientation, each edge directed toward its end of colour `true`, is Tau Ceti's
`SimpleGraph.Coloring.sourceSink`; the library has no statement about its directed paths.

**Checks.**
- `C₅` with a colouring by three colours: the orientation from lower to higher colour has longest
  directed paths on three vertices; with `k = 2` the statement does not apply, as `C₅` is not
  `2`-colourable.
- Acyclicity is not implied by the bound on the length: the cyclic orientation of the triangle
  has no directed path with three arcs and is not acyclic.

*Needs:* Tau Ceti `TauCeti.DoubledQuiver.Orientation`, `TauCeti.DoubledQuiver.OrientedQuiver`,
`TauCeti.Quiver.IsAcyclic`; Mathlib `Quiver.Path`, `SimpleGraph.Coloring`. (Proved here.)

### Examples

All orientations of the graphs on at most four vertices with their longest directed paths, the
transitive and cyclic orientations of the triangle, and the orientation of `C₅` from a colouring
by three colours.

### Dependencies

Tau Ceti `TauCeti.DoubledQuiver.Orientation`, `TauCeti.DoubledQuiver.OrientedQuiver`,
`TauCeti.Quiver.IsAcyclic`; Mathlib `Quiver.Path`, `Quiver.Path.vertices`, `SimpleGraph.Coloring`,
`SimpleGraph.Colorable`, `SimpleGraph.nonempty_hom_of_forall_finite_subgraph_hom`. No other layer.

## Layer 4: Mycielski's construction

### 4.1 The Mycielskian

Define `mycielskian G`, a graph on `V ⊕ V ⊕ Unit`: the vertices `inl v` carry a copy of `G`; the
vertex `inr (inl v)`, the shadow of `v`, is joined to every `inl w` with `w` adjacent to `v` in
`G`; the apex `inr (inr ())` is joined to every shadow; there are no other edges (Mycielski, 1955;
Bondy–Murty, proof of Theorem 8.7, p. 129). On `n` vertices with `m` edges it has `2n + 1`
vertices and `3m + n` edges.

**Checks.**
- The Mycielskian of `K₂` is isomorphic to the `5`-cycle, and that of the `5`-cycle to the
  Grötzsch graph, with
  `11` vertices and `20` edges (Bondy–Murty, p. 129).
- The Mycielskian of `K₁` has three vertices and one edge, between the shadow and the apex; that of
  the empty graph is a single vertex.
- A shadow is not joined to its own vertex, nor to another shadow: joining shadows would create a
  triangle with the apex.

*Needs:* Mathlib `SimpleGraph.fromRel`.

### 4.2 Chromatic number and triangles

- `chromaticNumber_mycielskian`: for every graph `G`, `χ(mycielskian G) = χ(G) + 1` in `ℕ∞`. No
  finiteness is assumed; if `χ(G) = ⊤`, both sides are `⊤`.
- `cliqueFree_three_mycielskian`: if `G` has no triangle, neither has `mycielskian G`.

(Bondy–Murty, proof of Theorem 8.7, pp. 129–130.)

Route: a colouring of `G` by `k` colours extends to `mycielskian G` by giving each shadow the colour
of its vertex and the apex a new colour. Conversely, from a colouring of `mycielskian G` by `k`
colours with the apex coloured `k`, no shadow has colour `k`; recolouring each vertex of colour `k`
with the colour of its shadow gives a colouring of `G` by `k − 1` colours. For `k = 0` the apex
alone rules out a colouring. A triangle contains at most one shadow, since the shadows are
pairwise nonadjacent, and not the apex, whose neighbours are all shadows. A triangle of vertices
`inl u`, `inl v`, `inl w` is a triangle of `G`, and so is `u`, `v`, `w` for a triangle
`inr (inl u)`, `inl v`, `inl w`.

**Checks.**
- Iterating from `K₂` gives triangle-free graphs on `2, 5, 11, 23` vertices with chromatic numbers
  `2, 3, 4, 5`; in general `3 · 2^(k − 2) − 1` vertices for chromatic number `k ≥ 2`
  (Bondy–Murty, p. 130).
- `χ(mycielskian K₁) = 2` and `χ` of the Mycielskian of the empty graph is `1`.
- On every labelled graph with at most five vertices the Mycielskian has chromatic number one
  more, and it is triangle-free whenever the graph is.

*Needs:* 4.1; Mathlib `SimpleGraph.chromaticNumber`, `SimpleGraph.Colorable`,
`SimpleGraph.CliqueFree`. (Proved here, following the cited route.)

### 4.3 Triangle-free graphs of every chromatic number

Prove `exists_cliqueFree_three_chromaticNumber_eq`: for every `k : ℕ` there are `n` and a graph on
`Fin n` with no triangle and chromatic number `k` (Mycielski, 1955; Bondy–Murty, Theorem 8.7,
p. 129; Diestel, Chapter 5, Exercise 22, p. 149).

Route: the empty graph for `k = 0` and `K₁` for `k = 1`; for `k ≥ 2`, the `(k − 2)`-fold
Mycielskian of `K₂`, transported to `Fin n` along an equivalence with its vertex type
(`SimpleGraph.chromaticNumber_congr`).

**Checks.**
- `k = 3` is witnessed by `C₅` and `k = 4` by the Grötzsch graph.
- The bound `ω(G) ≤ χ(G)` is therefore far from an equality: these graphs have `ω = 2` for
  `k ≥ 2`.

*Needs:* 4.2; Mathlib `SimpleGraph.chromaticNumber_congr`, `SimpleGraph.Iso`. (Proved here,
following the cited route.)

### Examples

The Mycielskians of the empty graph, `K₁`, `K₂`, `C₅` and the edgeless graphs, with their numbers
of vertices and edges and their chromatic numbers.

### Dependencies

Mathlib `SimpleGraph.fromRel`, `SimpleGraph.chromaticNumber`, `SimpleGraph.Colorable`,
`SimpleGraph.CliqueFree`, `SimpleGraph.chromaticNumber_congr`, `SimpleGraph.Iso`. No other layer.

## Layer 5: edge colourings

### 5.1 Vizing's theorem

Prove `maxDegree_le_chromaticNumber_lineGraph_le`: on a finite vertex type,
`Δ(G) ≤ χ'(G) ≤ Δ(G) + 1` (Vizing, 1964; Bondy–Murty, Theorem 6.2, p. 93; Diestel, Theorem 5.3.2,
p. 132).

Route: the edges at a vertex of degree `Δ` are pairwise adjacent in the line graph, which gives
the lower bound (`SimpleGraph.le_chromaticNumber_of_pairwise_adj`). For the upper bound (Diestel,
proof of Theorem 5.3.2, pp. 132–133): induction on the number of edges. In a colouring of `G − e`
by `Δ + 1` colours every vertex misses some colour. If `G` had no such colouring, then for every
edge `xy` and every colouring of `G − xy` with a colour `α` missing at `x` and `β` missing at `y`,
the path from `y` whose edges are coloured alternately `α` and `β` would end at `x`, since
otherwise exchanging `α` and `β` on it frees `α` for `xy`. Take a maximal sequence `y₀, …, y_l` of
distinct neighbours of `x` in which the colour of `xyᵢ₊₁` in a colouring of `G − xy₀` is missing
at `yᵢ`, and shift these colours along the sequence. The alternating path of the last shifted
colouring, from `y_l`, ends at `x` with a last edge `yᵢx` for some `i < l`; comparing it with the alternating path from `yᵢ` in the
`i`-th shifted colouring shows that the latter ends at `y_l` and not at `x`, against this property.

**Checks.**
- Both values occur: `χ'(K₄) = 3 = Δ` and `χ'(K₃) = 3 = Δ + 1`; `χ'(C₂ₘ) = 2` for `m ≥ 2` and
  `χ'(C₂ₘ₊₁) = 3` for `m ≥ 1`.
- The Petersen graph has `Δ = 3` and `χ' = 4` (Bondy–Murty, Exercise 6.1.2, p. 93), although it
  has an even number of vertices.
- `χ'(K_(m, n)) = max(m, n)`: for `K_(1, 5)`, `K_(2, 3)`, `K_(3, 3)` and `K_(2, 4)` the values are
  `5, 3, 3, 4`.
- A graph without edges has `Δ = 0 = χ'`; on the empty vertex type both are `0`.
- The statement holds on every labelled graph with at most six vertices.

*Needs:* Mathlib `SimpleGraph.lineGraph`, `SimpleGraph.maxDegree`,
`SimpleGraph.exists_maximal_degree_vertex`, `SimpleGraph.le_chromaticNumber_of_pairwise_adj`,
`SimpleGraph.Colorable`. (Proved here, following the cited route.)

### 5.2 Regular graphs of odd order

Prove `chromaticNumber_lineGraph_of_isRegularOfDegree`: if `G` is `d`-regular with `d ≥ 1` and `n`
is odd, then `χ'(G) = d + 1` (Bondy–Murty, Exercise 6.2.2, p. 96). In particular
`χ'(K₂ₘ₊₁) = 2m + 1` for `m ≥ 1` (Bondy–Murty, Exercise 6.2.1, p. 96).

Route: every colour class is a matching, which covers an even number of the `n` vertices and so
has at most `(n − 1)/2` edges; `G` has `nd/2` edges, more than `d(n − 1)/2`. So `d` colours do not
suffice, and 5.1 gives `d + 1`, since `Δ = d` on the nonempty type.

**Checks.**
- `d ≥ 1` is needed: the graph without edges on three vertices is `0`-regular, of odd order, and
  has `χ' = 0`.
- Odd order is needed: `K₄` and `K₆` are regular with `χ' = 3` and `5`, equal to `Δ`.
- The odd cycles are the case `d = 2`: `χ' = 3`.

*Needs:* 5.1; Mathlib `SimpleGraph.IsRegularOfDegree`, `SimpleGraph.lineGraph`,
`SimpleGraph.sum_degrees_eq_twice_card_edges`. (Proved here, except as cited.)

### Examples

Complete graphs on up to seven vertices, cycles, complete bipartite graphs and the Petersen graph,
with their chromatic indices.

### Dependencies

Mathlib `SimpleGraph.lineGraph`, `SimpleGraph.maxDegree`, `SimpleGraph.exists_maximal_degree_vertex`,
`SimpleGraph.le_chromaticNumber_of_pairwise_adj`, `SimpleGraph.Colorable`,
`SimpleGraph.IsRegularOfDegree`, `SimpleGraph.sum_degrees_eq_twice_card_edges`. No other layer.

## Scope and ownership

This roadmap owns the targets stated above: the degeneracy bound and the bound `Δ + 1`, the lower
bound from the independence number and the two Nordhaus–Gaddum inequalities; Brooks' theorem and
the characterization of the connected graphs with `χ = Δ + 1`; the theorem of Gallai, Roy and
Vitaver and its sharpness; the Mycielskian, its chromatic number and its triangles, and
triangle-free graphs of every chromatic number; Vizing's theorem and the regular graphs of odd
order with chromatic index `d + 1`.

Already in the libraries and therefore not targets:

- Mathlib's colourings, colourability and chromatic number with their basic facts: monotonicity
  in the graph (`SimpleGraph.Colorable.mono_left`), the clique bound
  (`SimpleGraph.cliqueNum_le_chromaticNumber`), the chromatic numbers of complete graphs, paths,
  cycles and complete bipartite graphs (`SimpleGraph.chromaticNumber_top`,
  `SimpleGraph.chromaticNumber_pathGraph`, `SimpleGraph.chromaticNumber_cycleGraph_of_odd`,
  `SimpleGraph.chromaticNumber_cycleGraph_of_even`,
  `SimpleGraph.CompleteBipartiteGraph.chromaticNumber`), the characterization of bipartite graphs
  as those with `χ ≤ 2` (`SimpleGraph.chromaticNumber_le_two_iff_isBipartite`), the colourability
  of a graph through its connected components, and the theorem of Andrásfai, Erdős and Sós
  (`SimpleGraph.colorable_of_cliqueFree_lt_minDegree`).
- Mathlib's compactness theorem for homomorphisms into a finite graph
  (`SimpleGraph.nonempty_hom_of_forall_finite_subgraph_hom`), the theorem of de Bruijn and Erdős in
  the form used by 1.1 and 3.1.
- Tau Ceti's orientations of a simple graph, their quivers and acyclicity, which ZigzagPreprojective
  uses and which 3.1 and 3.2 consume.

Left to other roadmaps:

- GraphConnectivityAndFlows §6.9 owns Kőnig's edge-colouring theorem, that a finite bipartite
  multigraph has a proper edge colouring by `k` colours exactly when its maximum degree is at most
  `k`, with its simple-graph corollaries and its identification of edge colourings with colourings
  of its own line graph on edge identities, related there to `SimpleGraph.lineGraph`. In the notation above it says `χ'(G) = Δ(G)` for bipartite `G`, the lower
  bound of 5.1 attained; it is not restated. That roadmap leaves general-graph edge colouring
  aside, and 5.1 and 5.2 are about general graphs. Its Conventions take the directed walks of
  orientations to be Mathlib quiver paths, as Layer 3 does; the simple-path predicates it adds
  there are written here directly through `Quiver.Path.vertices`.

Open Mathlib proposals on the same objects, which this roadmap follows in design and does not wait
for: a greedy colouring with the bound `χ ≤ Δ + 1`
([mathlib4 #38357](https://github.com/leanprover-community/mathlib4/pull/38357)), the extension of a
colouring across one vertex of small degree
([#42343](https://github.com/leanprover-community/mathlib4/pull/42343)), and edge colourings defined
as colourings of `SimpleGraph.lineGraph`, with the chromatic index and Vizing's theorem
([#33313](https://github.com/leanprover-community/mathlib4/pull/33313),
[#43128](https://github.com/leanprover-community/mathlib4/pull/43128) and the stack ending in
[#43134](https://github.com/leanprover-community/mathlib4/pull/43134)). Both edge-colouring
proposals build their edge colourings from colourings of `SimpleGraph.lineGraph`, the carrier that
the Conventions above use, so 5.1 and 5.2 concern the same object.

Not treated here: planar graphs and the five- and four-colour theorems, the theorem of Grötzsch on
triangle-free planar graphs, list colourings and choice numbers, perfect graphs, chromatic
polynomials, critical graphs as a subject, the theorem of Erdős on graphs of large girth and
chromatic number, edge colourings of multigraphs with multiplicity (Vizing's general bound and
Shannon's bound), total colourings, Hajós' construction and conjecture, and every procedure for
finding a colouring and its running time.

## Exact supplier contracts

### From Mathlib

- `Mathlib/Combinatorics/SimpleGraph/Coloring/Vertex.lean`: `SimpleGraph.Coloring` (an abbreviation
  for `G →g completeGraph α`); `SimpleGraph.Colorable n` (`Nonempty (G.Coloring (Fin n))`);
  `SimpleGraph.chromaticNumber` (the infimum in `ℕ∞` of the `n` with `G.Colorable n`);
  `SimpleGraph.Coloring.isIndepSet_colorClass` (each colour class is independent);
  `SimpleGraph.Colorable.chromaticNumber_le` (`G.Colorable n → G.chromaticNumber ≤ n`);
  `SimpleGraph.colorable_iff_forall_connectedComponent` (`G.Colorable n` exactly when each connected
  component is); `SimpleGraph.le_chromaticNumber_of_pairwise_adj` (`n ≤ Nat.card ι` and pairwise
  adjacent `f : ι → V` give `n ≤ G.chromaticNumber`); `SimpleGraph.chromaticNumber_top`
  (`[Fintype V]`: the complete graph has chromatic number `Fintype.card V`);
  `SimpleGraph.cliqueNum_le_chromaticNumber`; `SimpleGraph.chromaticNumber_congr` (isomorphic graphs
  have equal chromatic numbers).
- `Mathlib/Combinatorics/SimpleGraph/Coloring/Constructions.lean`:
  `SimpleGraph.chromaticNumber_cycleGraph_of_odd` (`2 ≤ n`, `Odd n`: chromatic number `3`).
- `Mathlib/Combinatorics/SimpleGraph/CycleGraph.lean`: `SimpleGraph.cycleGraph n` (on `Fin n`,
  `i` adjacent to `i ± 1`; no edges for `n ≤ 1`, and `cycleGraph 3` is the triangle).
- `Mathlib/Combinatorics/SimpleGraph/Finite.lean`: `SimpleGraph.maxDegree` (the largest degree,
  `0` on the empty type, for `[Fintype V] [DecidableRel G.Adj]`); `SimpleGraph.degree_le_maxDegree`;
  `SimpleGraph.exists_maximal_degree_vertex` (`[Nonempty V]`: some vertex has degree
  `G.maxDegree`); `SimpleGraph.maxDegree_top` (`[DecidableEq V]`: `Fintype.card V − 1`);
  `SimpleGraph.Iso.maxDegree_eq` (isomorphic graphs have equal maximum degree);
  `SimpleGraph.IsRegularOfDegree` (every vertex has degree `d`).
  `Mathlib/Combinatorics/SimpleGraph/DegreeSum.lean`: `SimpleGraph.sum_degrees_eq_twice_card_edges`.
- `Mathlib/Combinatorics/SimpleGraph/Clique.lean`: `SimpleGraph.CliqueFree n` (no clique on `n`
  vertices); `SimpleGraph.indepNum` (the supremum in `ℕ` of the sizes of independent sets);
  `SimpleGraph.IsIndepSet.card_le_indepNum` (`[Finite α]`: an independent finite set has at most
  `indepNum` elements); `SimpleGraph.cliqueNum_compl` (`Gᶜ.cliqueNum = G.indepNum`).
- `Mathlib/Combinatorics/SimpleGraph/LineGraph.lean`: `SimpleGraph.lineGraph` (on `G.edgeSet`, two
  edges adjacent when distinct with a common end).
- `Mathlib/Combinatorics/SimpleGraph/Finsubgraph.lean`:
  `SimpleGraph.nonempty_hom_of_forall_finite_subgraph_hom` (`[Finite W]`: if every subgraph of `G`
  with finitely many vertices has a homomorphism to `F : SimpleGraph W`, then so has `G`).
- `Mathlib/Combinatorics/SimpleGraph/Basic.lean`: `SimpleGraph.fromRel` (`(fromRel r).Adj a b` is
  `a ≠ b ∧ (r a b ∨ r b a)`). `Mathlib/Combinatorics/SimpleGraph/Maps.lean`: `SimpleGraph.Iso`,
  `SimpleGraph.induce`. `Mathlib/Combinatorics/SimpleGraph/Connectivity/Connected.lean`:
  `SimpleGraph.Connected` (preconnected and nonempty).
- `Mathlib/Combinatorics/Quiver/Path.lean`: `Quiver.Path` and its `length`.
  `Mathlib/Combinatorics/Quiver/Path/Vertices.lean`: `Quiver.Path.vertices` (the list of vertices of
  a path, of length one more than the path).

### From Tau Ceti

- `TauCeti/RepresentationTheory/Quiver/Zigzag/Orientation.lean`:
  `TauCeti.DoubledQuiver.Orientation G` (a set `carrier` of darts of `G` with
  `d.symm ∈ carrier ↔ d ∉ carrier` for every dart `d`);
  `TauCeti.DoubledQuiver.OrientedQuiver G o` (the vertices of `G`, with an arrow from `u` to `v`
  exactly for an adjacency `h` whose dart `⟨(u, v), h⟩` lies in `o`; at most one arrow between
  two vertices); `TauCeti.DoubledQuiver.Orientation.ofLinearOrder` (each edge directed from its
  smaller to its larger end), used in a Check of 3.1; `SimpleGraph.Coloring.sourceSink` (each
  edge directed toward its end of colour `true` under a colouring by `Bool`), named in 3.2.
- `TauCeti/RepresentationTheory/Quiver/Acyclic/Basic.lean`: `TauCeti.Quiver.IsAcyclic V` (every
  `Quiver.Path a a` is `Quiver.Path.nil`). `Suggested.lean` imports only the orientation module,
  which imports this one.

## References

- J. A. Bondy and U. S. R. Murty, *Graph Theory with Applications*, North-Holland, 1976:
  Chapter 6, §§6.1–6.2 and their exercises, pp. 91–96; Chapter 8, §§8.1, 8.2 and 8.5, pp. 117–130;
  Chapter 10, §10.1, pp. 174–175. The page numbers are those of the printed book, in the scan that
  the authors posted chapter by chapter on J. A. Bondy's page
  (`www.math.jussieu.fr/~jabondy/books/gtwa/gtwa.html`, files `pdf/chapter6.pdf`,
  `pdf/chapter8.pdf` and `pdf/chapter10.pdf`), kept by the Internet Archive in captures of March
  and April 2012.
- Reinhard Diestel, *Graph Theory*, sixth edition, 2025; the free preview of the main text on the
  author's site (`diestel-graph-theory.com`, chapter file `Ch5.pdf` of June 2024), Chapter 5,
  §§5.2–5.3 and the exercises, pp. 126–152. The exercises are numbered within the chapter.
- The papers of Brooks (1941), Vizing (1964), Mycielski (1955), Gallai (1968), Roy (1967), Vitaver
  (1962), Nordhaus and Gaddum (1956) and Szekeres and Wilf (1968) are named as the two books above
  attribute the results; Vitaver's paper, which neither book names, carries its customary
  attribution. No locator into these papers is given. The product inequality of 1.3 is not stated
  in the two books; it is proved here from Exercise 52 of Diestel's Chapter 5.
