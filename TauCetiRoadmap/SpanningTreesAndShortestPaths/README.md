# Roadmap: spanning trees, shortest paths and Eulerian graphs

**Summary.** This roadmap develops the theorems of graph theory behind the classical methods of
combinatorial optimization on graphs: minimum spanning trees, shortest paths, Euler tours and the
counting of labelled trees. Every target is a statement about a graph, a weight function and a set
of edges or a function on the vertices; no procedure, data structure or running time is specified.
The undirected part works with finite simple graphs whose edges carry weights in a linearly
ordered commutative monoid, cancellative where a statement speaks of every minimum spanning
forest. Disconnected graphs are not excluded: the objects are spanning forests, which are the
spanning trees when the graph is connected. The directed part works with finite directed
multigraphs whose arrows carry weights of either sign in a linearly ordered cancellative
commutative monoid, or in a linearly ordered commutative group where differences appear.

The headline theorems are these.

- *Optimality criteria.* For a finite graph with weights in a linearly ordered cancellative
  commutative monoid, a spanning forest is of minimum weight if and only if every edge of the graph
  weighs at least as much as each edge of the forest path joining its ends, and if and only if
  every forest edge weighs at most as much as each edge of the graph joining the two sides into
  which its removal splits the forest.
- *The greedy theorem.* For a finite graph with weights in a linearly ordered commutative monoid,
  every colouring of edges produced by repeatedly colouring blue a lightest uncoloured edge
  leaving a set that no blue edge leaves, or red a heaviest uncoloured edge of a cycle without red
  edges, has a minimum spanning forest containing all blue and no red edges.
- *Potentials.* A finite directed multigraph with weights in a linearly ordered cancellative
  commutative monoid has a function on its vertices that rises along each arrow by at most the
  weight of the arrow if and only if no closed walk has negative weight. If moreover the weights
  lie in a linearly ordered commutative group, no closed walk has negative weight and `p` is a
  shortest walk from `s` to `t`, then the largest rise of such a function from `s` to `t` is the
  weight of `p`.
- *Euler's theorem.* A finite simple graph with at least one vertex has a closed walk traversing
  every edge exactly once if and only if all degrees are even and all vertices of positive degree
  lie in one connected component.

The roadmap builds on Mathlib's simple graphs, which supply trees, acyclic graphs, bridges and the
necessity half of Euler's theorem, and on Tau Ceti's directed walks along an arrow family, the
carrier of its network theory. GraphConnectivityAndFlows develops connectivity, cuts and flows on
the same carriers; nothing here is a flow statement. GeometricTopology has the weighted
matrix-tree identity, a second route to the count of labelled trees that is not repeated here.
The Bellman equations of this roadmap are the min-plus equations of shortest walks, not the
discounted fixed-point equations of MarkovDecisionProcesses.

## How to read the build

Layer 1 below treats spanning forests, fundamental cycles and cuts and the symmetric exchange
property. Layer 2 depends on Layer 1 and uses it for minimum spanning forests: the cut and cycle
properties, the optimality criteria, uniqueness, the minimax property, the greedy theorem and
Kruskal's forest. Layer 3 depends on no other layer: walk weights, distances, potentials, the
Bellman equations, the invariant behind Dijkstra's method, shortest-path trees and min-plus matrix
powers. Layer 4 proves the sufficiency half of Euler's theorem and Veblen's cycle decomposition,
and Layer 5 counts labelled trees through the Prüfer correspondence; neither depends on another
layer. Within a layer the sections are in build order.

## Conventions

- **Graphs.** An undirected graph is a Mathlib `SimpleGraph V`; its edges are elements of
  `Sym2 V`, written `s(u, v)`. A subgraph is a graph `F ≤ G` on the same vertex type. For an edge
  `f` and adjacent `u`, `v`, the graph written `F − f + uv` is
  `F.deleteEdges {f} ⊔ SimpleGraph.edge u v`. Paths and cycles are Mathlib's `Walk.IsPath` and
  `Walk.IsCycle`.
- **Spanning forests.** A spanning forest of `G` is an acyclic `F ≤ G` with the same reachability
  relation as `G`. The roadmap states everything for spanning forests. When `G` is connected they
  are the spanning trees `T ≤ G`; when `G` is not connected it has no spanning tree and the
  statements are about the forests.
- **Edge weights.** A weight is a total function `w : Sym2 V → R`; only its values on edges of the
  graph in question enter any statement. A statement that says some minimum spanning forest has a
  property assumes `[AddCommMonoid R] [LinearOrder R] [IsOrderedAddMonoid R]`. A statement about
  every minimum spanning forest also assumes cancellation, in the form used by Tau Ceti's network
  theory: `[AddCommMonoid R] [LinearOrder R] [IsOrderedCancelAddMonoid R]`. The integers, the
  rationals, the reals and the natural numbers are instances of both.
- **Finiteness.** Sums of weights are `finsum`s over edge sets, so every statement about the
  weight of a graph assumes `[Finite V]`; on an infinite vertex type the `finsum` of an infinite
  edge set is `0` and says nothing. A statement whose proof does not use finiteness does not
  assume it.
- **Directed graphs.** A directed multigraph on `V` is an arrow family `Q : V → V → Type*`, as in
  Tau Ceti's network theory: `Q u v` is the type of arrows from `u` to `v`, loops and parallel
  arrows are allowed. Walks are `TauCeti.ArrowWalk Q s t`, with their arrows listed by
  `TauCeti.ArrowWalk.arrows`; a path is a walk that repeats no vertex (`TauCeti.ArrowWalk.IsPath`).
  A weight on arrows is a `TauCeti.Assignment Q R`, and the weight of a walk is Mathlib's
  `Quiver.Path.addWeight` for the quiver with arrows `Q`. "Finite arrow family" means `[Finite V]` and
  `[∀ x y, Finite (Q x y)]`.
- **Arrow weights.** Statements with sums only assume
  `[AddCommMonoid R] [LinearOrder R] [IsOrderedCancelAddMonoid R]`; statements with differences
  assume `[AddCommGroup R] [LinearOrder R] [IsOrderedAddMonoid R]`. The statements about min-plus
  matrices use Mathlib's tropical semiring `MinTropical (WithTop R)`, whose semiring structure asks
  for `[AddCancelCommMonoid R] [LinearOrder R] [IsOrderedAddMonoid R]`; this is the same class of
  weights with cancellation carried by the algebraic structure.
- **Distances.** Distances take values in `WithTop R`, with `⊤` for "no walk". The distance is a
  relation, not a function: no infimum over a possibly empty or unbounded set is taken, so there is
  no value to misread when walks of arbitrarily small weight exist.
- **Names of methods.** Kruskal, Jarník, Prim, Borůvka, Dijkstra, Bellman and Ford are named only
  to say which theorem underlies which classical method.

## Layer 1: spanning forests and exchange

### 1.1 Spanning forests

Define `IsSpanningForest F G` for graphs `F`, `G` on `V`: `F ≤ G`, `F` is acyclic, and
`F.Reachable = G.Reachable`.

- For finite `V`, a spanning forest of `G` has `|V| − c` edges, where `c` is the number of
  connected components of `G`: `F.edgeSet.ncard + Nat.card G.ConnectedComponent = Nat.card V`.
- If `F` is a spanning forest of `G` and `u`, `v` are adjacent in `G`, there is exactly one path
  of `F` from `u` to `v`, the forest path of the pair.

**Checks.**
- A triangle has three spanning forests, each with two edges; the four-cycle has four; the complete
  graph on four vertices has sixteen.
- The graph on five vertices with two disjoint edges and an isolated vertex has exactly one
  spanning forest, itself, with `5 − 3 = 2` edges. A definition asking for a connected acyclic
  subgraph would give this graph no spanning forest at all.
- The graph without edges has itself as only spanning forest, on every vertex type, the empty one
  included.

*Needs:* Mathlib `SimpleGraph.IsAcyclic`, `SimpleGraph.IsAcyclic.subsingleton_path`,
`SimpleGraph.IsAcyclic.ncard_edgeSet_add_card_connectedComponent`. (Proved here.)

### 1.2 Fundamental cycles and cuts

Let `F` be a spanning forest of `G`. For an edge `uv` of `G` outside `F`, the forest path from `u`
to `v` together with `uv` is the fundamental cycle of `uv`. For an edge `f` of `F`, the edges `xy`
of `G` whose ends are not joined in `F − f` form the fundamental cut of `f`.

- *Duality.* For an acyclic graph `F`, a path `p` of `F` from `u` to `v` and any `f : Sym2 V`:
  `f ∈ p.edges` if and only if `u` and `v` are not joined in `F.deleteEdges {f}`. This is Tau
  Ceti's `SimpleGraph.Walk.IsPath.mem_edges_iff_not_reachable_deleteEdges` and is not a target; it
  is the "duality" that the routes below cite. So `f` lies on the fundamental cycle of `uv`
  exactly when `uv` lies in the fundamental cut of `f` (Diestel, §1.9, pp. 25–26).
- *Exchange criterion* (`isSpanningForest_exchange_iff`). Let `F` be a spanning forest of `G`,
  `u`, `v` adjacent in `G`, `p` the forest path from `u` to `v` and `f` an edge of `F`. Then
  `F − f + uv` is a spanning forest of `G` if and only if `f ∈ p.edges`. No finiteness is assumed.

Route for the criterion: if `f` is on `p`, the ends of `uv` are separated in `F − f` by duality, so
adding `uv` keeps the graph acyclic and restores the reachability of `F`; if `f` is not on `p` and
`uv` is not in `F`, then `p` survives in `F − f` and `uv` closes a cycle; if `uv` is in `F`, then
`p` is that single edge, `F − f + uv = F − f`, and the ends of the bridge `f` are no longer
joined.

**Checks.**
- Four-cycle `a b c d`, `F` the path `a b c d`, `uv = da`: the forest path has the three edges of
  `F`, and removing any one of them and adding `da` gives a spanning tree.
- Star with centre `c` and leaves `x`, `y`, `z` inside the graph that also has the edge `xy`: the
  forest path from `x` to `y` is `x c y`; removing `cz` and adding `xy` isolates `z` and creates
  the triangle `x c y`, so it is not a spanning forest, in agreement with `cz` not lying on the
  path.
- When `uv` is itself an edge of `F`, the path is that edge and the criterion says that only
  `f = uv` works, giving back `F`.

*Needs:* 1.1; Mathlib `SimpleGraph.Walk.IsPath`, `SimpleGraph.deleteEdges`, `SimpleGraph.edge`,
`SimpleGraph.IsAcyclic.subsingleton_path`, `SimpleGraph.isAcyclic_sup_fromEdgeSet_iff`,
`SimpleGraph.isAcyclic_iff_forall_isBridge`, `SimpleGraph.isBridge_iff`; Tau Ceti
`SimpleGraph.Walk.IsPath.mem_edges_iff_not_reachable_deleteEdges` (the duality). (Proved here,
except as cited.)

### 1.3 Symmetric exchange

Prove `IsSpanningForest.exists_symm_exchange`: if `F` and `F'` are spanning forests of `G` and `e`
is an edge of `F'` not in `F`, there is an edge `f` of `F` not in `F'` such that `F − f + e` and
`F' − e + f` are both spanning forests of `G`. No finiteness is assumed.

Route: write `e = s(u, v)`. The ends `u`, `v` are separated in `F' − e`, so the forest path of `F`
from `u` to `v` has an edge `f = s(x, y)` whose ends are separated in `F' − e`. This `f` is not in
`F'`. It lies on the `F`-path of `e`, and by duality `e` lies on the `F'`-path from `x` to `y`;
apply the criterion of 1.2 twice.

**Checks.**
- In the four-cycle `a b c d` with `F = {ab, bc, cd}`, `F' = {bc, cd, da}` and `e = da`, the only
  edge of `F` outside `F'` is `ab`, and the two exchanges give `F'` and `F`.
- The edge `f` cannot be chosen freely among those for which `F − f + e` is a spanning forest. On
  vertices `0, 1, 2, 3` with edges `01, 02, 03, 12, 13`, let `F = {01, 02, 03}`,
  `F' = {02, 12, 13}` and `e = 13`. Then `F − 01 + 13` is a spanning tree, but `F' − 13 + 01`
  contains the triangle `0 1 2` and leaves `3` isolated. The edge `f = 03` serves both.

*Needs:* 1.1, 1.2. (Proved here.)

### Examples

The complete graph on four vertices: its sixteen spanning trees, the fundamental cycles and cuts
of the star at one vertex, and one symmetric exchange between the star and a Hamiltonian path.

### Dependencies

Mathlib `SimpleGraph.IsAcyclic`, `SimpleGraph.Walk.IsPath`, `SimpleGraph.deleteEdges`,
`SimpleGraph.edge`, `SimpleGraph.IsAcyclic.subsingleton_path`,
`SimpleGraph.IsAcyclic.ncard_edgeSet_add_card_connectedComponent`,
`SimpleGraph.isAcyclic_sup_fromEdgeSet_iff`, `SimpleGraph.isAcyclic_iff_forall_isBridge`,
`SimpleGraph.isBridge_iff`; Tau Ceti
`SimpleGraph.Walk.IsPath.mem_edges_iff_not_reachable_deleteEdges`. No other layer.

## Layer 2: minimum spanning forests

Throughout this layer `V` is finite and `w : Sym2 V → R`.

### 2.1 Weight and minimum spanning forests

Define `totalWeight w F` as the `finsum` of `w` over `F.edgeSet`, and `IsMinSpanningForest w F G`:
`F` is a spanning forest of `G` and `totalWeight w F ≤ totalWeight w F'` for every spanning forest
`F'` of `G`.

- For an edge `f` of `F`: `totalWeight w F = totalWeight w (F.deleteEdges {f}) + w f`. For `u ≠ v`
  not adjacent in `H`: `totalWeight w (H ⊔ SimpleGraph.edge u v) = totalWeight w H + w s(u, v)`.
- Every graph on a finite vertex type has a minimum spanning forest, for weights in a linearly
  ordered commutative monoid.

**Checks.**
- Triangle with weights `1, 2, 3`: one minimum spanning forest, of weight `3`.
- Four-cycle with weights `1, 2, 2, 2`: three minimum spanning forests, each of weight `5`.
- Two disjoint edges of weights `5` and `−7`: the only spanning forest has weight `−2`. An
  acyclic subgraph of least weight, without the reachability condition, would be the single edge
  of weight `−7`; with positive weights it would be the empty graph.
- The graph without edges: the minimum spanning forest is the graph itself, of weight `0`.

*Needs:* 1.1; Mathlib `finsum_mem_eq_finite_toFinset_sum`,
`SimpleGraph.exists_isAcyclic_reachable_eq_le`. (Proved here.)

### 2.2 The cut property and the cycle property

Let `S` be a set of vertices; an edge `xy` of `G` leaves `S` when `x ∈ S` and `y ∉ S`.

- `exists_isMinSpanningForest_adj_of_cut`: if `uv` leaves `S` and `w s(u, v) ≤ w s(x, y)` for every
  edge `xy` of `G` leaving `S`, some minimum spanning forest contains `uv`. (Ordered monoid.)
- `IsMinSpanningForest.adj_of_cut`: if `w s(u, v) < w s(x, y)` for every other edge `xy` of `G`
  leaving `S`, every minimum spanning forest contains `uv`. (Cancellative; Erickson, Lemma 7.2,
  p. 260, for connected graphs with distinct real weights.)
- `exists_isMinSpanningForest_notMem_of_cycle`: if `e` is an edge of a cycle `c` of `G` and
  `w e' ≤ w e` for every edge `e'` of `c`, some minimum spanning forest does not contain `e`.
  (Ordered monoid.)
- `IsMinSpanningForest.notMem_of_cycle`: if `w e' < w e` for every other edge `e'` of `c`, no
  minimum spanning forest contains `e`. (Cancellative.)

Route: take a minimum spanning forest `T`. For the cut property, if `uv ∉ T` the forest path from
`u` to `v` has an edge `f` leaving `S`; exchange `f` for `uv` by 1.2 and compare weights with the
identities of 2.1. For the cycle property, if `e ∈ T` the rest of the cycle joins the ends of `e`,
so it has an edge `g` whose ends are separated in `T − e`; exchange `e` for `g`.

**Checks.**
- Triangle with all weights `1` and `S` one vertex: two lightest edges leave `S`; each is in some
  minimum spanning forest and neither is in all three.
- Cancellation is needed for the two statements about every minimum spanning forest. Take weights
  in `WithTop ℕ`, a linearly ordered commutative monoid in which `⊤ + a = ⊤`. On a triangle with
  weights `1, 2, 3` and a pendant edge of weight `⊤`, each of the three spanning trees has weight
  `⊤`, so all are minimum; the tree with the triangle edges of weights `2` and `3` omits the edge
  of weight `1`, the strictly lightest edge leaving one of its two ends.

*Needs:* 1.2, 2.1. (Proved here, except as cited.)

### 2.3 Optimality criteria

For a spanning forest `F` of `G` and weights in a linearly ordered cancellative commutative
monoid, the following are equivalent.

1. `F` is a minimum spanning forest.
2. For every edge `uv` of `G` and every edge `f` of the forest path from `u` to `v`:
   `w f ≤ w s(u, v)` (`isMinSpanningForest_iff_cycle`).
3. For every edge `f` of `F` and every edge `uv` of `G` whose ends are not joined in `F − f`:
   `w f ≤ w s(u, v)` (`isMinSpanningForest_iff_cut`).

- For weights in a linearly ordered commutative monoid without cancellation, 2 and 3 are still
  equivalent to each other and imply 1.

Route: 2 and 3 are equivalent by the duality of 1.2. If 1 holds and 2 fails for `uv` and `f`,
exchanging `f` for `uv` gives a strictly lighter spanning forest. If 2 holds, let `F'` be any
spanning forest and argue by induction on the number of edges of `F'` outside `F`: for such an
edge `e`, 1.3 gives `f` in `F` outside `F'`, on the `F`-path of `e`, with `F' − e + f` a spanning
forest; then `w f ≤ w e`, so `F' − e + f` weighs no more than `F'` and has one more edge in `F`.

**Checks.**
- Four-cycle with weights `1, 2, 2, 2`: the path omitting the edge of weight `1` fails 2 at that
  edge, which is lighter than the three edges of its forest path; each of the other three paths
  satisfies 2.
- In the `WithTop ℕ` example of 2.2, the tree with the edges of weights `2`, `3` and `⊤` is
  minimum but fails 2: the omitted edge of weight `1` is lighter than both edges of its forest
  path. So 1 does not imply 2 without cancellation.

*Needs:* 1.2, 1.3, 2.1. (Proved here.)

### 2.4 Uniqueness, weights and the minimax property

Weights in a linearly ordered cancellative commutative monoid.

- `IsMinSpanningForest.eq_of_injOn`: if `w` is injective on the edges of `G`, any two minimum
  spanning forests of `G` are equal (Erickson, Lemma 7.1, p. 258, for connected graphs with real
  weights).
- `IsMinSpanningForest.ncard_weight_eq`: two minimum spanning forests have, for every `r : R`, the
  same number of edges of weight `r`.
- `IsMinSpanningForest.exists_le_of_mem_edges`: if `F` is a minimum spanning forest, `p` the path
  of `F` from `u` to `v` and `q` any walk of `G` from `u` to `v`, then every edge `f` of `p` has
  `w f ≤ w g` for some edge `g` of `q`. So the forest path minimises the largest edge weight among
  all walks between its ends.
- Hence, for every spanning forest `F'` of `G`, every edge of a minimum spanning forest weighs at
  most as much as some edge of `F'`: a minimum spanning forest minimises the largest edge weight.

Route: for two minimum spanning forests and an edge `e` of `F'` outside `F`, 1.3 gives `f` with
both exchanges spanning forests; minimality of `F` and of `F'` gives `w f ≤ w e` and `w e ≤ w f`.
With injective weights this is impossible for `e ≠ f`; in general `F' − e + f` is a minimum
spanning forest with the same weights and one more edge in `F`. The minimax property is criterion
3 of 2.3 applied to an edge of `q` whose ends are separated in `F − f`. The corresponding
statement for spanning trees of greatest weight and the smallest edge weight along a path, with
nonnegative real weights, is Schrijver, Application 1.7, equation (24), p. 21.

**Checks.**
- Four-cycle with weights `1, 2, 2, 2`: the three minimum spanning forests all have one edge of
  weight `1` and two of weight `2`.
- Triangle with weights `1, 2, 2`: the tree with the two edges of weight `2` has the least
  possible largest edge weight, `2`, but weight `4`, not `3`. So the last property does not
  characterise minimum spanning forests.
- A tree is its own unique minimum spanning forest whether or not its weights are distinct, so
  injectivity is sufficient and not necessary.

*Needs:* 1.2, 1.3, 2.1, 2.3. (Proved here, except as cited.)

### 2.5 The greedy theorem

Define the relation `GreedyColouring w G B D` between a set `B` of blue and a set `D` of red
elements of `Sym2 V` inductively.

- The empty colouring: `GreedyColouring w G ∅ ∅`.
- *Blue rule.* From `GreedyColouring w G B D`, a set `S` of vertices that no blue edge leaves, and
  an edge `uv` of `G` leaving `S`, not red, with `w s(u, v) ≤ w s(x, y)` for every edge `xy` of `G`
  leaving `S` that is not red: `GreedyColouring w G (insert s(u, v) B) D`.
- *Red rule.* From `GreedyColouring w G B D`, a cycle `c` of `G` with no red edge, and an edge `e`
  of `c`, not blue, with `w e' ≤ w e` for every edge `e'` of `c` that is not blue:
  `GreedyColouring w G B (insert e D)`.

Since no blue edge leaves `S`, the edges leaving `S` that are not red are the uncoloured ones, and
likewise on a cycle without red edges. Prove, for weights in a linearly ordered commutative
monoid:

- `GreedyColouring.exists_isMinSpanningForest`: if `GreedyColouring w G B D`, some minimum spanning
  forest `F` of `G` has `B ⊆ F.edgeSet` and no edge in `D`.
- `B` and `D` are disjoint sets of edges of `G`.
- If some edge of `G` is uncoloured, one of the two rules applies to some uncoloured edge.
- If every edge of `G` is coloured, `SimpleGraph.fromEdgeSet B` is a minimum spanning forest.

Route for the first: induction on the derivation. At a blue step, take `T` from the induction
hypothesis; if `uv ∉ T`, the `T`-path from `u` to `v` has an edge `f` leaving `S`, which is in
`T`, hence not red, and not blue because no blue edge leaves `S`; so `w s(u, v) ≤ w f` and
`T − f + uv` serves. At a red step, if `e ∈ T`, the rest of the cycle has an edge `g` whose ends
are separated in `T − e`; it is not in `T`, hence not blue, and it is not red; so `w g ≤ w e` and
`T − e + g` serves. The two rules and the invariant are Tarjan's (*Data Structures and Network
Algorithms*, 1983). The blue step for `S` a component of the blue forest is Schrijver,
Theorem 1.11, p. 19, for connected graphs with real weights.

The classical selections are instances. Colouring blue, at each step, a lightest edge leaving the
set of vertices joined to a fixed root by blue edges is the selection of Jarník and Prim. Going
through the edges in an order of nondecreasing weight, and colouring an edge blue by the blue rule
at the blue component of one of its ends when its ends lie in different blue components, and red
by the red rule on the cycle it closes otherwise, is Kruskal's; 2.6 states its outcome directly.

**Checks.**
- Triangle with all weights `1`. After `ab` and `ac` are blue, every set that `bc` leaves is left
  by a blue edge, so the blue rule does not apply to `bc`; the red rule applies on the triangle and
  colours `bc` red. Without the condition that no blue edge leaves `S`, the three edges could all
  be coloured blue, and no spanning forest contains a triangle.
- Triangle with weights `1, 2, 3`: the red rule on the triangle can only colour the edge of weight
  `3`, and the blue rule at any single vertex colours an edge of weight `1` or `2`.

*Needs:* 1.2, 2.1. (Proved here.)

### 2.6 Kruskal's forest and ties

For a relation `lt` on `Sym2 V`, define `kruskalForest lt G`: the graph whose edges are the edges
`uv` of `G` such that `u` and `v` are not joined by a walk along edges `e'` of `G` with
`lt e' s(u, v)`.

- For `lt` a strict total order and `V` finite, `kruskalForest lt G` is a spanning forest of `G`,
  and it is the only spanning forest `F` of `G` such that `lt f s(u, v)` for every edge `uv` of `G`
  outside `F` and every edge `f` of the forest path from `u` to `v`.
- `isMinSpanningForest_kruskalForest`: if `lt` is a strict total order with `lt e e'` for all edges
  `e`, `e'` of `G` with `w e < w e'`, then `kruskalForest lt G` is a minimum spanning forest, for
  weights in a linearly ordered commutative monoid (Schrijver, Corollary 1.12a, p. 20, for
  connected graphs with real weights).
- `kruskalForest_adj_of_cut`: for an asymmetric relation `lt`, in particular a strict total order,
  and a set `S` of vertices, if `uv` leaves `S` and every other edge `xy` of `G` leaving `S` has
  `lt s(u, v) s(x, y)`, then `uv` is an edge of `kruskalForest lt G`. Neither finiteness nor a
  weight is involved.

The last statement is the cut property with ties broken by `lt`. It covers Borůvka's selection,
in which every component of a forest chooses its first leaving edge at the same time: all the
chosen edges lie in the one forest `kruskalForest lt G`, so together they contain no cycle.

Route: an edge `e` of `G` belongs to the forest according to the edges before `e` only, so the
part of `kruskalForest lt G` before a given edge is the Kruskal forest of the part of `G` before
it. Acyclicity: the last edge of a cycle would have its ends joined by earlier edges. Reachability:
induction along `lt` on a finite edge set. Minimality: the forest path of an edge `uv` outside the
forest consists of edges before `uv`, hence of weight at most `w s(u, v)`; apply 2.3. For the cut
statement: a walk from `u` to `v` along edges before `uv` would leave `S` along one of them, which
by hypothesis comes after `uv`.

**Checks.**
- Triangle with all weights `1`. With no order on the edges, each vertex may choose as lightest
  incident edge a different one, and the three choices form the triangle. With `ab` before `bc`
  before `ca`, the vertices `a`, `b`, `c` choose `ab`, `ab`, `bc`, the edges of the Kruskal forest.
- Triangle with weights `1, 2, 3`: for the order by weight the Kruskal forest has the edges of
  weights `1` and `2`; the edge of weight `3` has its ends joined by the two earlier edges.
- For an order under which a heavier edge precedes a lighter one the conclusion can fail: on the
  same triangle with the edge of weight `3` first, the Kruskal forest contains it and has weight
  `4` or `5`.

*Needs:* 1.1, 1.2, 2.1, 2.3; Mathlib `SimpleGraph.IsAcyclic.subsingleton_path`. (Proved here,
except as cited.)

### Examples

The complete graph on four vertices with weights `1, 1, 2, 2, 3, 3` placed so that two minimum
spanning trees exist: both trees, their common weights, the criteria of 2.3 checked on each, and
one derivation by the blue and red rules ending at each tree.

### Dependencies

Layer 1 (1.1, 1.2, 1.3). Mathlib `finsum_mem_eq_finite_toFinset_sum`,
`SimpleGraph.exists_isAcyclic_reachable_eq_le`, `SimpleGraph.IsAcyclic.subsingleton_path`.

## Layer 3: shortest walks and potentials

Throughout this layer `Q` is an arrow family on `V` and `w : TauCeti.Assignment Q R`.

### 3.1 Walk weights and distance

The weight `walkWeight w p` of a walk `p` is the sum of `w` over the arrows of `p`, with
repetitions. It is not a new notion: it abbreviates Mathlib's `Quiver.Path.addWeight` for the
quiver whose arrows are `Q`, in the way `TauCeti.ArrowWalk.length` abbreviates
`Quiver.Path.length`, and needs only `[AddMonoid R]`. Define `IsShortest w p`:
`walkWeight w p ≤ walkWeight w q` for every walk `q` with the ends of `p`;
`IsConservative w`: `0 ≤ walkWeight w c` for every closed walk `c`; and `IsDist w s t x` for
`x : WithTop R`: `x` is the least element of the set consisting of `⊤` and the weights of the
walks from `s` to `t`.

- By Mathlib's `Quiver.Path.addWeight_nil` and `Quiver.Path.addWeight_comp`, the empty walk has
  weight `0` and `walkWeight w (p.comp q) = walkWeight w p + walkWeight w q`. To prove here:
  `walkWeight w p` is the sum of `w` over the list `TauCeti.ArrowWalk.arrows p` of traversed
  arrows, in order.
- `IsDist w s t ⊤` if and only if there is no walk from `s` to `t`; for `x ≠ ⊤`, `IsDist w s t x`
  if and only if some shortest walk from `s` to `t` has weight `x`. At most one `x` satisfies
  `IsDist w s t x`.
- *Triangle inequality.* If `IsDist w s t x`, `IsDist w t u y` and `IsDist w s u z`, then
  `z ≤ x + y`.
- *Optimal substructure.* If `p.comp q` is a shortest walk, so are `p` and `q` (cancellative).
- A walk that is not a path is `p₁.comp (c.comp p₂)` with `c` a closed walk of positive length;
  hence, if the closed walks at the vertices of a walk `p` have nonnegative weight, some path with
  the ends of `p` weighs at most as much as `p`.
- If `p` is a shortest walk and `c` a closed walk at a vertex of `p`, then `0 ≤ walkWeight w c`
  (cancellative).
- *Agreement with the hop distance.* For capacities `c` on `Q`, the weight constantly `1 : ℕ` on
  the arrow family `TauCeti.PositiveHom c` of arrows of positive capacity has
  `IsDist` at `TauCeti.positiveEDist c s t` for all `s`, `t`.

**Checks.**
- One arrow `s → t` of weight `5` and arrows `s → a`, `a → t` of weight `2` each: the distance from
  `s` to `t` is `4`, from `t` to `s` it is `⊤`, from `s` to `s` it is `0`.
- One vertex with a loop of weight `−1`: the walks from the vertex to itself have weights
  `0, −1, −2, …`, so no `x` has `IsDist`. A definition by an infimum in `WithTop ℤ` would return a
  junk value here.
- With a loop of weight `0` or `1` instead, the distance from the vertex to itself is `0`.

*Needs:* Mathlib `Quiver.Path.addWeight`, `Quiver.Path.addWeight_nil`,
`Quiver.Path.addWeight_comp`; Tau Ceti `TauCeti.ArrowWalk`, `TauCeti.ArrowWalk.arrows`,
`TauCeti.ArrowWalk.length`, `TauCeti.Assignment`, `TauCeti.ArrowWalk.IsPath`; for the last bullet
`Quiver.Path.addWeight_const` (a constant weight counts arrows), `TauCeti.PositiveHom`,
`TauCeti.positiveEDist`, `TauCeti.positiveEDist_ne_top_iff`,
`TauCeti.PositiveReachable.exists_length_eq_positiveEDist`,
`TauCeti.positiveReachable_iff_nonempty_arrowWalk`. (Proved here, except as cited.)

### 3.2 Existence of shortest walks

On a finite arrow family, with weights in a linearly ordered cancellative commutative monoid:

- `exists_isPath_isShortest`: if there is a walk from `s` to `t`, and `0 ≤ walkWeight w c` for
  every closed walk `c` at a vertex `v` such that walks from `s` to `v` and from `v` to `t` exist,
  then some path from `s` to `t` is a shortest walk (Schrijver, Theorem 1.9, pp. 12–13, for real
  lengths with no directed circuit of negative length anywhere).
- `forall_exists_isDist_iff`: every pair `s`, `t` has an `x` with `IsDist w s t x` if and only if
  `w` is conservative.

Route: finitely many walks have at most a given number of arrows, so there are finitely many
paths from `s` to `t`; take one of least weight and compare with an arbitrary walk by the
splitting bullet of 3.1. If some closed walk at `v` has negative weight, a closed walk `c` of
least weight at `v` would have negative weight too, and `c.comp c` would be strictly lighter.

**Checks.**
- Finiteness of the arrow types is needed: two vertices with arrows `eₙ : s → t` of weight `−n` for
  every natural number `n` have no closed walk of positive length and no shortest walk.
- The hypothesis of the first statement is not necessary when the order is not Archimedean. Take
  `R = ℤ × ℤ` with the lexicographic order, an arrow `s → t` of weight `(−5, 0)`, arrows `s → v`
  and `v → t` of weight `(0, 0)` and a loop at `v` of weight `(0, −1)`. The walks from `s` to `t`
  have weights `(−5, 0)` and `(0, −k)`, so the direct arrow is a shortest walk, while the loop is a
  closed walk of negative weight on a walk from `s` to `t`.
- A closed walk of negative weight that no walk from `s` to `t` meets does not matter: add to the
  first Check of 3.1 a vertex with a loop of weight `−1` and no other arrow.

*Needs:* 3.1; Tau Ceti `TauCeti.Quiver.finite_boundedPaths`, `TauCeti.ArrowWalk.IsPath`.
(Proved here, except as cited.)

### 3.3 Potentials and duality

Define `IsPotential w y` for `y : V → R`: `y v ≤ y u + w e` for every arrow `e` from `u` to `v`.

- *Weak duality.* If `y` is a potential and `p` a walk from `s` to `t`, then
  `y t ≤ y s + walkWeight w p`.
- `exists_isPotential_iff`: on a finite arrow family, with weights in a linearly ordered
  cancellative commutative monoid, a potential exists if and only if `w` is conservative.
- `isGreatest_isPotential_sub`: on a finite arrow family, with a conservative weight in a linearly
  ordered commutative group, if `p` is a shortest walk from `s` to `t`, then `walkWeight w p` is
  the greatest element of the set of values `y t − y s` over the potentials `y`: some potential
  has `y t − y s = walkWeight w p`, and by weak duality none rises by more.
- *Reweighting.* For weights in a linearly ordered commutative group and any `y : V → R`, let
  `w' e = w e + y u − y v` for an arrow `e` from `u` to `v`. Then
  `walkWeight w' p = walkWeight w p + y s − y t` for a walk `p` from `s` to `t`, so `w` and `w'`
  have the same shortest walks, and `w'` is nonnegative on every arrow if and only if `y` is a
  potential for `w` (Erickson, §9.3, pp. 311–312, with real weights).

Route: a potential and a closed walk `c` at `v` give `y v ≤ y v + walkWeight w c`, so
`0 ≤ walkWeight w c` by cancellation. Conversely let `y v` be the least weight of a path ending at
`v`, over all starting vertices; it exists because the paths are finitely many and the empty walk
at `v` is one of them, and it is a potential by the splitting bullet of 3.1. For the duality, give
every vertex `u ≠ s` a starting cost `M`, give `s` the cost `0`, and let `y v` be the least value
of the cost of `u` plus the least weight of a path from `u` to `v`; for `M` large enough,
`y s = 0` and `y t` is the weight of a shortest walk from `s` to `t`.

**Checks.**
- Directed triangle with weights `1, 1, −3`: summing the three inequalities gives `0 ≤ −1`, so
  there is no potential. With weights `1, 1, −2` the values `0, 1, 2` along the triangle are a
  potential.
- First Check of 3.1: `y s = 0`, `y a = 2`, `y t = 4` is a potential with `y t − y s = 4`, the
  distance; no potential rises by `5`.
- Finiteness of `V` is needed in `exists_isPotential_iff`: on the vertices `ℕ` with an arrow
  `0 → n` of weight `−n` and an arrow `n → 1` of weight `0` for every `n ≥ 2`, there is no closed
  walk of positive length, and a potential in `ℤ` would have `y 1 ≤ y 0 − n` for every `n`.
  Finiteness of the arrow types is needed as well, by the first Check of 3.2.

*Needs:* 3.1, 3.2; Tau Ceti `TauCeti.Quiver.finite_boundedPaths`. (Proved here, except as cited.)

### 3.4 The Bellman equations

Define `IsBellman w s y` for `y : V → WithTop R`: `y s = 0`, and for every `v ≠ s`,
`y v ≤ y u + w e` for every arrow `e` from `u` to `v`, and either `y v = ⊤` or
`y v = y u + w e` for some arrow `e` from `u` to `v`. So `y v` is the least of the values
`y u + w e` over the arrows into `v`, and `⊤` when there is none or all of them are `⊤`.

Weights in a linearly ordered cancellative commutative monoid.

- `isBellman_of_isDist`: if `IsDist w s v (d v)` for every `v`, then `IsBellman w s d`. No
  finiteness is assumed.
- `IsBellman.isDist`: if `V` is finite and every closed walk of positive length has positive
  weight, a solution `y` of the Bellman equations at `s` has `IsDist w s v (y v)` for every `v`.
  So the solution is unique.
- If `w` is conservative and `IsBellman w s y`, then `y v ≤ walkWeight w p` for every walk `p` from
  `s` to `v`: the distances from `s` are the greatest solution.

Route for uniqueness: from a vertex with a finite value follow arrows at which equality holds,
backwards. The vertices met have finite values, and none repeats, because a closed walk of such
arrows would have weight `0`. So the chain ends at `s`, and `y v` is the weight of a walk from `s`
to `v`. For the lower bound, induct along a walk from `s`, using at each return to `s` that closed
walks at `s` have nonnegative weight.

**Checks.**
- Zero cycles break uniqueness. With an arrow `s → a` of weight `5` and arrows `a → b`, `b → a` of
  weight `0`, the functions `y s = 0`, `y a = y b = c` solve the equations for every `c ≤ 5`; the
  distances are the solution with `c = 5`, the greatest.
- Unreachable vertices: with arrows `a → b`, `b → a` of weight `1` and an isolated `s`, the
  equations force `y a = y a + 2`, so `y a = y b = ⊤`.
- Finiteness is needed: vertices `s` and `vₙ` for `n ∈ ℕ` with arrows `vₙ₊₁ → vₙ` of weight `0`
  have no closed walk of positive length, and `y s = 0`, `y vₙ = 7` solves the equations although
  no `vₙ` is reachable from `s`.

*Needs:* 3.1. (Proved here.)

### 3.5 The invariant behind Dijkstra's method

Prove `isDist_eq_add_of_min_leaving`: let the weights be nonnegative, in a linearly ordered
cancellative commutative monoid, and let `IsDist w s v (d v)` for every `v`. Let `S` be a set of
vertices containing `s`, and `e` an arrow from `u ∈ S` to `v ∉ S` such that
`d u + w e ≤ d x + w e'` for every arrow `e'` from some `x ∈ S` to some `y ∉ S`. Then
`d v = d u + w e`. No finiteness is assumed. This is the step on which the proof of Schrijver,
Theorem 1.3, p. 6, rests, there for nonnegative rational lengths and `S` the set of vertices
already settled; the same conclusion about Dijkstra's method is Erickson, Theorem 8.5, p. 287.

Route: a walk from `s` to `v` leaves `S` for the first time along some arrow `e'` from `x` to `y`;
its weight is at least `d x + w e'` because the remaining arrows have nonnegative weight.

**Checks.**
- A negative arrow breaks it: arrows `s → a` of weight `2`, `s → b` of weight `3`, `b → a` of
  weight `−2`, and `S = {s}`. The arrow `s → a` minimises `d u + w e` with value `2`, but the
  distance to `a` is `1`.
- If `S` contains vertices not reachable from `s` and the minimum is attained at one of them, both
  sides are `⊤`.
- The source must lie in `S`: with arrows `s → v` of weight `1`, `s → u` and `u → v` of weight `5`
  and `S = {u}`, the only arrow leaving `S` gives `d u + w e = 10`, while the distance to `v`
  is `1`.

*Needs:* 3.1. (Proved here, except as cited.)

### 3.6 Shortest-path trees

Prove `exists_shortestPathTree`: on a finite arrow family, with weights in a linearly ordered
cancellative commutative monoid, if `0 ≤ walkWeight w c` for every closed walk `c` at a vertex
reachable from `s`, there is a set `T` of arrows such that for every `v` reachable from `s` exactly
one walk from `s` to `v` uses only arrows of `T`, and that walk is shortest.

Route: for every reachable `v ≠ s` choose a shortest walk from `s` with the fewest arrows and put
its last arrow in `T`. The fewest number of arrows of a shortest walk drops along the arrows of
`T`, so `T` has no closed walk through a reachable vertex, every reachable vertex other than `s` is
entered by one arrow of `T`, and the walk in `T` to `v` is shortest by optimal substructure. For
nonnegative rational weights the tree is described in Schrijver, §1.1, p. 7.

**Checks.**
- Arrows `s → a`, `a → b`, `b → a` of weight `0`. All three arrows lie on shortest walks, and the
  set of all three has infinitely many walks from `s` to `a`; `T = {s → a, a → b}` has exactly one
  to each vertex.
- Two parallel arrows `s → t` of the same weight: `T` contains exactly one of them.

*Needs:* 3.1, 3.2. (Proved here, except as cited.)

### 3.7 Min-plus matrix powers

The weights lie in a linearly ordered cancellative commutative monoid, given as
`[AddCancelCommMonoid R] [LinearOrder R] [IsOrderedAddMonoid R]` so that `MinTropical (WithTop R)`
is a semiring. For `[∀ x y, Fintype (Q x y)]` define
`arcMatrix w : Matrix V V (MinTropical (WithTop R))`: the entry at `(u, v)` is the tropical sum,
that is the minimum, of the weights of the arrows from `u` to `v`, and the tropical zero `⊤` when
there is none. With `[Fintype V] [DecidableEq V]` the matrix `1 + arcMatrix w` has in addition the
tropical one, the weight `0`, on the diagonal.

- `isLeast_untrop_one_add_arcMatrix_pow`: the `(s, t)` entry of `(1 + arcMatrix w) ^ k` is the
  least element of the set consisting of `⊤` and the weights of the walks from `s` to `t` with at
  most `k` arrows (Schrijver, Theorem 1.10, p. 13, with real weights; Erickson, §9.7,
  pp. 316–317).
- If `w` is conservative and `V` has `n` elements, `IsDist w s t` holds at the `(s, t)` entry of
  `(1 + arcMatrix w) ^ (n − 1)`.
- `one_add_arcMatrix_pow_card_eq_iff`: with `n` the number of vertices, the rows of `s` in
  `(1 + arcMatrix w) ^ n` and in `(1 + arcMatrix w) ^ (n − 1)` are equal if and only if
  `0 ≤ walkWeight w c` for every closed walk `c` at a vertex reachable from `s`.

Written out entry by entry, `(1 + arcMatrix w) ^ (k + 1) = (1 + arcMatrix w) ^ k * (1 + arcMatrix w)`
is the relaxation recursion of Bellman and Ford: the least weight with at most `k + 1` arrows at
`t` is the smaller of the least weight with at most `k` arrows at `t` and the least value, over
the arrows `e` from `u` to `t`, of the least weight with at most `k` arrows at `u` plus `w e`.

Route for the last statement: if the two rows agree, the row is unchanged by further
multiplication, so every vertex `v` reachable from `s` has a shortest walk `p` from `s`, and a
closed walk `c` at `v` of negative weight would make `p.comp c` strictly lighter. Conversely a walk
with `n` arrows repeats a vertex, and the splitting bullet of 3.1 removes a closed walk of
nonnegative weight.

**Checks.**
- Arrows `s → a`, `a → t` of weight `1` and `s → t` of weight `5`: the `(s, t)` entries of the
  powers `0, 1, 2` are `⊤, 5, 2`, and the `(s, s)` entry of the power `0` is `0`.
- One vertex with a loop of weight `−1`: here `n − 1 = 0`, and the entries of the powers `0` and
  `1` are `0` and `−1`, so the rows differ, as they must.
- The diagonal matters: in the first example the `(s, t)` entry of the square of `arcMatrix w`
  alone is `2`, the weight of the only walk with exactly two arrows, and that of its cube is `⊤`,
  while the cube of `1 + arcMatrix w` still has `2` there.

*Needs:* 3.1, 3.2; Mathlib `MinTropical`, `MinTropical.trop`, `MinTropical.untrop`,
`MinTropical.instCommSemiring`, `WithTop.linearOrderedAddCommMonoidWithTop`, `Matrix.mul_apply`.
(Proved here, except as cited.)

### Examples

A directed graph on five vertices with one negative arrow and no negative closed walk: its
distances from one source, a potential attaining the distance to the farthest vertex, the solution
of the Bellman equations, a shortest-path tree, and the first four powers of `1 + arcMatrix w`.

### Dependencies

Tau Ceti `TauCeti.ArrowWalk`, `TauCeti.ArrowWalk.arrows`, `TauCeti.ArrowWalk.length`,
`TauCeti.ArrowWalk.IsPath`, `TauCeti.Assignment`, `TauCeti.Quiver.finite_boundedPaths`,
`TauCeti.PositiveHom`, `TauCeti.positiveEDist`, `TauCeti.positiveEDist_ne_top_iff`,
`TauCeti.PositiveReachable.exists_length_eq_positiveEDist`,
`TauCeti.positiveReachable_iff_nonempty_arrowWalk`. Mathlib `Quiver.Path.addWeight`,
`Quiver.Path.addWeight_nil`, `Quiver.Path.addWeight_comp`, `MinTropical`, `MinTropical.trop`,
`MinTropical.untrop`, `MinTropical.instCommSemiring`, `WithTop.linearOrderedAddCommMonoidWithTop`,
`Matrix.mul_apply`. No other layer.

## Layer 4: Eulerian trails and cycle decompositions

Throughout this layer `G` is a simple graph on a finite vertex type, with decidable adjacency so
that Mathlib's `SimpleGraph.degree` is defined. A walk is Eulerian (`SimpleGraph.Walk.IsEulerian`)
when it traverses every edge of `G` exactly once.

### 4.1 Euler's theorem

- `exists_isEulerian_circuit_iff`: if `V` is nonempty, a closed Eulerian walk exists at some vertex
  if and only if every degree is even and any two vertices of positive degree are joined by a walk
  (Diestel, Theorem 1.8.1, p. 22, for connected graphs).
- `exists_isEulerian_trail_iff`: for `u ≠ v`, an Eulerian walk from `u` to `v` exists if and only
  if the vertices of odd degree are exactly `u` and `v` and any two vertices of positive degree
  are joined by a walk.

Route for sufficiency of the first: take a longest closed walk without repeated edges. At every
vertex it uses an even number of the edges there, so the graph of unused edges has even degrees.
If an edge is unused, connectivity gives an unused edge at a vertex `x` of the walk, and a closed
walk of positive length without repeated edges through `x` in the graph of unused edges can be
spliced in, against maximality. The second follows from the first applied to the graph with a new
vertex joined to `u` and `v`.

**Checks.**
- On the empty vertex type the degree and connectivity conditions hold and no closed walk exists;
  so the first statement needs a vertex.
- Isolated vertices are allowed: a triangle with a fourth, isolated vertex has a closed Eulerian
  walk, starting on the triangle. A statement asking for a connected graph would exclude it, and
  one asking the walk to start at a prescribed vertex would fail at the isolated one.
- Two disjoint triangles: all degrees are `2` and there is no Eulerian walk.
- The complete graph on four vertices has four vertices of odd degree and no Eulerian walk; the
  path on three vertices has one between its ends and none that is closed.

*Needs:* Mathlib `SimpleGraph.Walk.IsEulerian`, `SimpleGraph.Walk.IsEulerian.even_degree_iff`,
`SimpleGraph.Walk.IsEulerian.mem_support_of_not_isIsolated`, `SimpleGraph.degree`. (Proved here,
except as cited.)

### 4.2 Veblen's theorem

Prove `forall_even_degree_iff_exists_cycle_partition`: every degree of `G` is even if and only if
there is a set of pairwise disjoint subsets of `Sym2 V`, each the edge set of a cycle of `G`, whose
union is `G.edgeSet` (Diestel, Proposition 1.9.1, (ii) and (iii), p. 24).

Route: a graph with an edge and all degrees even contains a cycle; delete its edges and repeat.

**Checks.**
- Two triangles with one common vertex: the degrees are `2, 2, 4, 2, 2` and the two triangles are
  the decomposition.
- The graph without edges: the empty set of cycles.
- Finiteness is needed: the two-way infinite path has all degrees `2` and no cycle.

*Needs:* Mathlib `SimpleGraph.Walk.IsCycle`, `SimpleGraph.Walk.edgeSet`, `SimpleGraph.degree`.
(Proved here, except as cited.)

### Examples

The octahedron, which has all degrees `4`: one closed Eulerian walk and one decomposition into
four triangles.

### Dependencies

Mathlib `SimpleGraph.Walk.IsEulerian`, `SimpleGraph.Walk.IsEulerian.even_degree_iff`,
`SimpleGraph.Walk.IsEulerian.mem_support_of_not_isIsolated`, `SimpleGraph.Walk.IsCycle`,
`SimpleGraph.Walk.edgeSet`, `SimpleGraph.degree`. No other layer.

## Layer 5: counting labelled trees

A tree on `V` is a `SimpleGraph V` with Mathlib's `SimpleGraph.IsTree`. The degree of `v` in `T`
is written without decidability assumptions as `(T.neighborSet v).ncard`.

### 5.1 The Prüfer correspondence

Prove `exists_equiv_isTree_pruferCode`: if `V` is finite with `n ≥ 2` elements, there is a
bijection from the trees on `V` to the functions `Fin (n − 2) → V` under which every vertex `v`
occurs in the image of a tree `T` exactly `deg_T v − 1` times.

Route: for a linear order on `V`, remove the least leaf of the tree, record its neighbour, and
repeat until two vertices remain; a vertex is recorded once for each neighbour it loses before it
becomes a leaf or one of the last two. The inverse reads off the least vertex that does not occur
in the rest of the sequence (Keller and Trotter, §5.6, for `V = {1, …, n}`; the count of
occurrences is proved here).

**Checks.**
- `n = 2`: one tree and one function from the empty type; both vertices have degree `1` and occur
  `0` times.
- `n = 3`: three trees, and the sequence of length `1` names the vertex of degree `2`.
- A star with centre `c` on `n` vertices corresponds to the constant sequence `c`, in which `c`
  occurs `n − 2 = deg c − 1` times.
- `n = 1` is excluded for a reason: there is one tree and one function from `Fin 0`, but the vertex
  has degree `0`, not `0 + 1`.

*Needs:* Mathlib `SimpleGraph.IsTree`, `SimpleGraph.IsTree.exists_vert_degree_one_of_nontrivial`,
`SimpleGraph.Connected.induce_compl_singleton_of_degree_eq_one`. (Proved here, except as cited.)

### 5.2 Cayley's formula and prescribed degrees

- `card_isTree`: a nonempty finite type with `n` elements carries `n ^ (n − 2)` trees, with the
  subtraction of natural numbers (Keller and Trotter, Theorem 5.39, for `V = {1, …, n}`).
- `card_isTree_degree_eq`: let `V` be finite with `n` elements and `d : V → ℕ` with `1 ≤ d v` for
  all `v` and `(∑ v, d v) + 2 = 2 * n`. The number of trees on `V` in which every `v` has degree
  `d v` is the multinomial coefficient `(n − 2)! / ∏ v, (d v − 1)!`, Mathlib's `Nat.multinomial`
  of the function `v ↦ d v − 1`.

Both follow from 5.1 by counting sequences; `n = 1` in the first is counted directly.

**Checks.**
- `n = 1, 2, 3, 4, 5`: `1, 1, 3, 16, 125` trees. For `n = 1` the exponent `1 − 2` is `0` in `ℕ`
  and `1 ^ 0 = 1` is the correct count.
- The empty type carries no tree, while `0 ^ 0 = 1`; so the first statement needs a vertex.
- `n = 4` and degrees `2, 2, 1, 1`: the coefficient is `2! / (1! 1! 0! 0!) = 2`, the two paths
  whose inner vertices are the two vertices of degree `2`. Degrees `3, 1, 1, 1`: one star.
- Both hypotheses on `d` are needed. On three vertices, `d = (2, 2, 0)` sums to `2 (n − 1)` and no
  tree has these degrees, while the coefficient of `(1, 1, 0)` is `2`; and `d = (1, 1, 1)` has no
  tree either, while the coefficient of `(0, 0, 0)` is `1`. For `n = 1` the two hypotheses
  contradict each other, so the statement says nothing there.

*Needs:* 5.1; Mathlib `Nat.multinomial`, `SimpleGraph.IsTree`. (Proved here, except as cited.)

### Examples

The sixteen trees on four vertices listed with their sequences: four stars with constant
sequences and twelve paths with sequences of two different vertices.

### Dependencies

Mathlib `SimpleGraph.IsTree`, `SimpleGraph.IsTree.exists_vert_degree_one_of_nontrivial`,
`SimpleGraph.Connected.induce_compl_singleton_of_degree_eq_one`, `Nat.multinomial`. No other
layer.

## Scope and ownership

This roadmap owns the definitions and theorems stated above: spanning forests with their exchange
properties, minimum spanning forests, the greedy colouring relation and Kruskal's forest; shortest
walks, distances as a relation, conservative weights, potentials, the Bellman equations and the
min-plus matrix of an arrow family; the sufficiency half of Euler's theorem and Veblen's theorem;
the Prüfer correspondence and the two counts of labelled trees.

Already in the libraries and therefore not targets:

- The characterizations of trees in Mathlib: unique paths (`SimpleGraph.isTree_iff_existsUnique_path`),
  connected with `n − 1` edges (`SimpleGraph.isTree_iff_connected_and_card`), acyclic with `n − 1`
  edges (`SimpleGraph.isTree_iff_isAcyclic_and_ncard_edgeSet_add_one_eq_card`), minimally
  connected (`SimpleGraph.isTree_iff_minimal_connected`) and maximally acyclic
  (`SimpleGraph.isTree_iff_maximal_isAcyclic`).
- The existence of spanning forests and trees and the extension of acyclic subgraphs to them
  (`SimpleGraph.exists_isAcyclic_reachable_eq_le`,
  `SimpleGraph.exists_isAcyclic_reachable_eq_le_of_le_of_isAcyclic`,
  `SimpleGraph.Connected.exists_isTree_le`), and the two descriptions of spanning forests that make
  the definition of 1.1 agree with Mathlib's usage: `SimpleGraph.maximal_isAcyclic_iff_reachable_eq`
  and `SimpleGraph.Connected.maximal_le_isAcyclic_iff_isTree`.
- The necessity half of Euler's theorem (`SimpleGraph.Walk.IsEulerian.even_degree_iff`,
  `SimpleGraph.Walk.IsEulerian.card_odd_degree`).
- Topological orderings of acyclic quivers
  (`TauCeti.Quiver.IsAcyclic.exists_pairwise_isEmpty_hom`) and the partial order of strongly
  connected components by reachability (`Quiver.StronglyConnectedComponent.instPartialOrder`, in
  `TauCeti/Combinatorics/Quiver/StronglyConnectedComponent.lean`).
- The duality between the path of an acyclic graph and the deletion of one of its edges
  (`SimpleGraph.Walk.IsPath.mem_edges_iff_not_reachable_deleteEdges`), which 1.2 cites.
- The weight of a path of a quiver as the sum of the weights of its arrows
  (`Quiver.Path.addWeight`), with its values on the empty path and on a composite
  (`Quiver.Path.addWeight_nil`, `Quiver.Path.addWeight_comp`); `walkWeight` above only abbreviates
  it for an arrow family.
- The distance counted in arrows of positive capacity (`TauCeti.positiveEDist`), which 3.1 compares
  with the weighted notion.

Left to other roadmaps:

- GraphConnectivityAndFlows owns bridges and bonds (its 2.1), flows and cuts (its 3 and 4),
  Menger's theorem (its 5), directed connectivity (its 6.2), acyclic orientations from
  `st`-numberings (its 7.4) and Gomory–Hu trees (its 9). It lists the disjoint spanning tree
  theorems of Nash-Williams and Tutte and Edmonds' disjoint arborescences as outside its scope;
  they are outside this one too.
- GeometricTopology 4.4.5 owns the weighted matrix-tree identity over every commutative ring.
  `card_isTree` above is proved through the Prüfer correspondence and does not restate that
  identity or any determinant.
- MarkovDecisionProcesses 1.2 owns the Bellman operators of discounted Markov decision processes,
  contractions whose fixed points are values. The equations of 3.4 above have no discount and no
  expectation, and their uniqueness comes from positive closed walks, not from contraction.

Outside the scope: implementations of any of the classical methods, running times, data structures
and machine models; the matroid form of the greedy theorem and of the exchange property; Steiner
trees; arborescences of minimum weight; minimum-cost flows; the recursion over intermediate
vertices for all pairs of vertices; Euler tours of multigraphs and of directed graphs, for which
Mathlib's `SimpleGraph.Walk.IsEulerian` is not the carrier; the deletion and contraction recursion
for the number of spanning trees, which needs contraction of multigraphs; random spanning trees;
planar and dynamic variants; and infinite graphs beyond the statements above that assume no
finiteness.

## Exact supplier contracts

### From Mathlib

- `Mathlib/Combinatorics/SimpleGraph/Acyclic.lean`: `SimpleGraph.IsAcyclic` and `SimpleGraph.IsTree`;
  `SimpleGraph.IsAcyclic.subsingleton_path` (an acyclic graph has at most one path between two
  vertices, as a `Subsingleton` of `G.Path u v`);
  `SimpleGraph.IsAcyclic.ncard_edgeSet_add_card_connectedComponent` (for `[Finite V]` and `G`
  acyclic, `G.edgeSet.ncard + Nat.card G.ConnectedComponent = Nat.card V`);
  `SimpleGraph.isAcyclic_sup_fromEdgeSet_iff`
  (`(G ⊔ edge u v).IsAcyclic ↔ G.IsAcyclic ∧ (G.Reachable u v → u = v ∨ G.Adj u v)`);
  `SimpleGraph.isAcyclic_iff_forall_isBridge` (acyclic if and only if every edge is a bridge);
  `SimpleGraph.exists_isAcyclic_reachable_eq_le` (`∃ F ≤ G, F.IsAcyclic ∧ F.Reachable = G.Reachable`,
  no hypothesis); `SimpleGraph.IsTree.exists_vert_degree_one_of_nontrivial` (for
  `[Fintype V] [Nontrivial V] [DecidableRel G.Adj]`, a tree has a vertex of degree `1`);
  `SimpleGraph.Connected.induce_compl_singleton_of_degree_eq_one` (removing a vertex of degree `1`
  from a connected graph leaves a connected graph).
- `Mathlib/Combinatorics/SimpleGraph/Connectivity/Connected.lean`: `SimpleGraph.isBridge_iff`
  (`G.IsBridge s(u, v) ↔ ¬(G.deleteEdges {s(u, v)}).Reachable u v`).
  `Mathlib/Combinatorics/SimpleGraph/DeleteEdges.lean`: `SimpleGraph.deleteEdges` (`G.deleteEdges s`
  is `G` without the edges in `s`). `Mathlib/Combinatorics/SimpleGraph/Operations.lean`:
  `SimpleGraph.edge` (`edge u v` is the graph with the single edge `s(u, v)`, and no edge when
  `u = v`).
- `Mathlib/Combinatorics/SimpleGraph/Trails.lean`: `SimpleGraph.Walk.IsEulerian` (for
  `[DecidableEq V]`: every edge of `G` occurs exactly once among the edges of the walk);
  `SimpleGraph.Walk.IsEulerian.even_degree_iff` (for an Eulerian walk from `u` to `v`,
  `[Fintype V] [DecidableRel G.Adj]`: `Even (G.degree w) ↔ (u ≠ v → w ≠ u ∧ w ≠ v)`);
  `SimpleGraph.Walk.IsEulerian.mem_support_of_not_isIsolated` (an Eulerian walk visits every vertex
  that is not isolated).
- `Mathlib/Combinatorics/SimpleGraph/Paths.lean`: `SimpleGraph.Walk.IsPath`,
  `SimpleGraph.Walk.IsCycle`; `Mathlib/Combinatorics/SimpleGraph/Walk/Basic.lean`:
  `SimpleGraph.Walk.edgeSet`; `Mathlib/Combinatorics/SimpleGraph/Finite.lean`: `SimpleGraph.degree`
  (for a `Fintype` instance on the neighbour set).
- `Mathlib/Algebra/BigOperators/Finprod.lean`: `finsum_mem_eq_finite_toFinset_sum` (a `finsum` over
  a finite set is the `Finset` sum over it).
- `Mathlib/Algebra/Tropical/Basic.lean`: `MinTropical`, `MinTropical.trop`, `MinTropical.untrop`
  and `MinTropical.instCommSemiring` (a commutative semiring on `MinTropical R` for
  `[LinearOrderedAddCommMonoidWithTop R]`, with tropical addition the minimum and tropical
  multiplication the addition of `R`); `Mathlib/Algebra/Order/AddGroupWithTop.lean`:
  `WithTop.linearOrderedAddCommMonoidWithTop`, which gives that structure on `WithTop R` for
  `[AddCancelCommMonoid R] [LinearOrder R] [IsOrderedAddMonoid R]`.
- `Mathlib/Combinatorics/Quiver/Path/Weight.lean`: `Quiver.Path.addWeight` (for `[Quiver V]`,
  `[AddMonoid R]` and `w : ∀ {i j : V}, (i ⟶ j) → R`, the sum of `w` along a path, defined by
  recursion on the path); `Quiver.Path.addWeight_nil` (it is `0` on the empty path);
  `Quiver.Path.addWeight_comp` (`addWeight w (p.comp q) = addWeight w p + addWeight w q`).
- `Mathlib/Data/Matrix/Mul.lean`: `Matrix.mul_apply`. `Mathlib/Data/Nat/Choose/Multinomial.lean`:
  `Nat.multinomial`.

### From Tau Ceti

- `TauCeti/Combinatorics/SimpleGraph/Connectivity/EdgeSide.lean`:
  `SimpleGraph.Walk.IsPath.mem_edges_iff_not_reachable_deleteEdges`: for an acyclic `G`, a path
  `p : G.Walk s t` and `e : Sym2 V`, `e ∈ p.edges ↔ ¬(G.deleteEdges {e}).Reachable s t`.
- `TauCeti/Combinatorics/Quiver/PathWeight.lean`: `Quiver.Path.addWeight_const`,
  `p.addWeight (fun _ => c) = p.length • c`.
- `TauCeti/Combinatorics/Network/Basic.lean`: `TauCeti.Assignment Q K`, a value in `K` for every
  arrow of the family `Q`, with strict-implicit endpoints.
- `TauCeti/Combinatorics/Network/Walk.lean`: `TauCeti.ArrowWalk Q s t`, Mathlib's `Quiver.Path` for
  the quiver with arrows `Q`; `TauCeti.ArrowWalk.arrows`, the list of traversed arrows as elements
  of `Σ x y, Q x y`; `TauCeti.ArrowWalk.length`, the number of arrows of a walk, an abbreviation of
  `Quiver.Path.length`; `TauCeti.ArrowWalk.IsPath` (the list of vertices
  has no repetition); `TauCeti.PositiveHom c`, the subfamily of arrows `e` with `0 < c e`;
  `TauCeti.positiveReachable_iff_nonempty_arrowWalk`.
- `TauCeti/Combinatorics/Network/Distance.lean`: `TauCeti.positiveEDist c s t : ℕ∞`, the least
  length of a walk from `s` to `t` along arrows of positive capacity, `⊤` when there is none;
  `TauCeti.positiveEDist_ne_top_iff`; `TauCeti.PositiveReachable.exists_length_eq_positiveEDist`
  (a walk attaining it exists when `t` is positively reachable from `s`).
- `TauCeti/Combinatorics/Quiver/BoundedPaths.lean`: `TauCeti.Quiver.finite_boundedPaths` (for a
  quiver with `[Finite V]` and finite arrow types, the paths from `a` to `b` of length at most `n`
  form a finite type). It is applied to the quiver whose arrows are `Q`.

## References

- Reinhard Diestel, *Graph Theory*, sixth edition, Springer, 2025; the electronic preview edition
  on the author's site, Chapter 1.
- Jeff Erickson, *Algorithms*, first edition, 2019, Chapters 7, 8 and 9; freely available from the
  author's site, `jeffe.cs.illinois.edu/teaching/algorithms`.
- Mitchel T. Keller and William T. Trotter, *Applied Combinatorics*, 2017 edition, §5.6; an open
  textbook, `appliedcombinatorics.org`.
- Alexander Schrijver, *A Course in Combinatorial Optimization*, lecture notes, CWI and University
  of Amsterdam, version of March 23, 2017, Chapter 1; available from the author's page at CWI.
