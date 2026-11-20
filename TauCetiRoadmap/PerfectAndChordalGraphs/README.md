# Roadmap: perfect and chordal graphs

**Summary.** The chromatic number of a graph is at least its clique number, and in general it can
be much larger for reasons that no small part of the graph reveals. A graph is perfect when this
lower bound is attained by the graph and by every induced subgraph of it. This roadmap develops
the structure theory of chordal graphs, the graphs in which every cycle of length at least four
has a chord, proves that the three classical families of chordal graphs, comparability graphs and
interval graphs consist of perfect graphs, and proves Lovász's perfect graph theorem. Graphs are
simple. Dirac's separator theorem holds for every graph, and the theorems on simplicial vertices
and elimination orderings are about finite graphs; perfection is defined through the finite
induced subgraphs, and the theorems about it need no finiteness. Every target is a statement
about graphs, orders or families of sets; no procedure for recognizing a class or colouring a
graph is specified.

The headline theorems are these.

- *Dirac's theorem and the theorem of Fulkerson and Gross.* A graph is chordal if and only if
  every minimal set of vertices separating two given vertices is a clique. A finite graph is
  chordal if and only if its vertices can be listed so that the later neighbours of each vertex
  are pairwise adjacent. A finite chordal graph that is not complete has two nonadjacent
  vertices whose neighbourhoods are cliques.
- *Chordal, comparability and interval graphs are perfect.* Every chordal graph is perfect. A
  graph whose adjacency is comparability in a strict partial order is perfect. The intersection
  graph of a family of order-connected subsets of a linear order (an interval graph) is chordal,
  and its complement is a comparability graph.
- *The perfect graph theorem.* A graph is perfect if and only if its complement is perfect, and
  if and only if every finite set `s` of vertices has at most `α(G[s]) · ω(G[s])` elements.

The roadmap builds on Mathlib's simple graphs: their induced subgraphs and induced containment,
cycle graphs, cliques, the clique number, the independence number and the chromatic number.
QuiverRepresentationsPartII states Dilworth's theorem for finite posets, which gives the
perfection of complements of comparability graphs. GraphColouring, an open roadmap, proves bounds
on the chromatic number and leaves perfect graphs to this one. The strong perfect graph theorem is
not a target.

## How to read the build

Layer 1 below defines chordal graphs, simplicial vertices, minimal separators and perfect
elimination orderings, and proves Dirac's separator theorem, Dirac's simplicial vertex theorem and
the theorem of Fulkerson and Gross, in that order; it depends on no other layer. Layer 2 defines
perfect graphs and proves that chordal graphs are perfect from the elimination orderings of
Layer 1. Layer 3 treats comparability graphs, with Dilworth's theorem from QuiverRepresentationsPartII
for their complements, and interval graphs, whose chordality and whose complements it proves
directly; it uses the definitions of Layers 1 and 2, and the perfection of interval graphs follows
with Layer 2. Layer 4 proves the replication lemma, the perfect graph theorem and Lovász's
characterization by `α · ω`; it uses only the definition of perfection from Layer 2. Within a
layer the sections are in build order.

## Conventions

- **Graphs.** A graph is a Mathlib `SimpleGraph V`. `G.induce s` is the graph induced on a set `s`
  of vertices, with vertex type the subtype of `s`. `Gᶜ` is the complement. A clique is a set on
  which `G.IsClique` holds; the empty set and every singleton are cliques. Where finiteness is
  needed a statement assumes `[Finite V]`; the empty vertex type is allowed throughout.
- **Chordal graphs.** `IsChordal G` says that for no `n ≥ 4` is the cycle graph `cycleGraph n` an
  induced subgraph of `G`, in the sense of Mathlib's `SimpleGraph.IsIndContained` (an injective map
  of vertices that preserves and reflects adjacency). This is the usual definition, every cycle of
  length at least four has a chord: a cycle without a chord is an induced cycle, and an induced
  cycle has no chord. The two definitions agree on every graph with at most five vertices.
- **Separators.** A set `S` separates `a` from `b` when `a ∉ S`, `b ∉ S` and `b` is not reachable
  from `a` in `G.induce Sᶜ`; it is a minimal `a`–`b` separator when no proper subset separates `a`
  from `b`, in the sense of Mathlib's `Minimal`. Minimality is for the fixed pair `a`, `b`: a
  minimal `a`–`b` separator may contain a minimal separator of another pair. No set separates a
  vertex from itself or from a neighbour.
- **Orderings.** An ordering of `V` is a bijection `σ : V ≃ Fin n`; `w` comes after `v` when
  `σ v < σ w`. A perfect elimination ordering is one in which the neighbours of every vertex that
  come after it are pairwise adjacent (Vandenberghe–Andersen, §4.1, p. 274, the higher
  neighbourhoods; the reverse of such an ordering has the same property for earlier neighbours).
- **Numbers.** `ω(G)` is `G.cliqueNum` and `α(G)` is `G.indepNum`, valued in `ℕ`; on a finite type
  they are the largest sizes of a clique and of an independent set, and both are `0` on the empty
  type. `χ(G)` is `G.chromaticNumber`, valued in `ℕ∞`; it is `0` exactly on the empty type and at
  most the number of vertices on a finite type. `ω(G) ≤ χ(G)` is Mathlib's
  `SimpleGraph.cliqueNum_le_chromaticNumber`.
- **Perfection.** `IsPerfect G` says that `χ(G[s]) = ω(G[s])` for every finite set `s` of
  vertices, where `G[s]` is `G.induce s`. On a finite vertex type these are all the induced
  subgraphs, and this is Diestel's definition (Diestel, §5.5, p. 139). The empty set gives
  `0 = 0`. Since the definition only looks at finite induced subgraphs, the theorems about
  perfection make no finiteness assumption; each reduces at once to finite graphs.
- **Orders and intervals.** A comparability graph is `SimpleGraph.fromRel r` for a strict partial
  order `r` (an irreflexive transitive relation, Mathlib's `IsStrictOrder`); `fromRel r` joins
  distinct `u`, `v` when `r u v` or `r v u`, so `r` is a transitive orientation of the graph. The
  intersection graph of a family `I : V → Set α` joins distinct `u`, `v` when `I u ∩ I v` is
  nonempty. An interval graph is the intersection graph of a family of order-connected sets
  (`Set.OrdConnected`) in a linear order: closed, open and half-open intervals of `ℝ` are
  order-connected, and so is the empty set, which gives an isolated vertex.

## Layer 1: chordal graphs

### 1.1 Chordal graphs, simplicial vertices, separators and orderings

Define `IsChordal G`, `IsSimplicial G v` (the neighbours of `v` form a clique), `IsSeparator G a b S`,
`IsMinimalSeparator G a b S` and `IsPerfectEliminationOrder G σ` as in the Conventions
(Vandenberghe–Andersen, §3.1, p. 256, §3.3, p. 260, §3.4, p. 263, §4.2, p. 276; Diestel, §5.5,
p. 140).

- An induced subgraph of a chordal graph is chordal: an induced cycle of `G.induce s` composed with
  Mathlib's `SimpleGraph.Embedding.induce` is an induced cycle of `G`
  (`SimpleGraph.IsIndContained.trans`).
- `S` separates `a` from `b` exactly when every walk from `a` to `b` has a vertex in `S` and
  `a, b ∉ S`; a superset of a separator that avoids `a` and `b` is a separator, so `S` is minimal
  exactly when no `S ∖ {x}` with `x ∈ S` separates `a` from `b`.

**Checks.**
- `cycleGraph 4` is not chordal; complete graphs, forests and the diamond (the complete graph on
  `{0, 1, 2, 3}` without the edge `03`) are. The numbers of chordal graphs on the labelled vertex
  sets with `1, …, 6` elements are `1, 2, 8, 61, 822, 18154`.
- On two isolated vertices the empty set is a minimal separator of the pair, and it is a clique.
  In the diamond the only minimal separator of any pair is `{1, 2}`, a clique.
- The 4-cycle `0 1 2 3` with one pendant vertex attached to each of its vertices: `{1, 3}` is a
  minimal `0`–`2` separator and not a clique, while every inclusion-minimal set whose deletion
  disconnects the graph is a single vertex. So the notion "minimal for a pair" of the Conventions
  cannot be replaced by "inclusion-minimal disconnecting set" in 1.2.
- On the path `0 1 2` the ordering `0, 1, 2` is a perfect elimination ordering and `1, 0, 2` is
  not: the later neighbours `0` and `2` of `1` are nonadjacent.

*Needs:* Mathlib `SimpleGraph.IsIndContained`, `SimpleGraph.IsIndContained.trans`,
`SimpleGraph.Embedding.induce`, `SimpleGraph.cycleGraph`, `SimpleGraph.IsClique`,
`SimpleGraph.neighborSet`, `SimpleGraph.induce`, `SimpleGraph.Reachable`, `Minimal`.

### 1.2 Dirac's separator theorem

Prove `isChordal_iff_forall_isMinimalSeparator_isClique`: `G` is chordal if and only if every
minimal `a`–`b` separator, for all vertices `a`, `b`, is a clique (Dirac, 1961;
Vandenberghe–Andersen, Theorem 3.1, p. 261, for finite graphs). No finiteness is assumed: the
route below uses none.

Route (Vandenberghe–Andersen, proof of Theorem 3.1, pp. 261–262, with the minimal separator
constructed instead of chosen by finiteness). If every minimal separator is a clique and `C` is an
induced cycle on at least four vertices, take two nonconsecutive vertices `a`, `b` of `C`; they are
nonadjacent. Let `D` be the component of `b` in the graph obtained by deleting the neighbours of
`a`, and `T` the set of neighbours of `a` that have a neighbour in `D`. Every path from `a` to `b`
enters `D` from a vertex of `T`, so `T` separates `a` from `b`; deleting any `x` from `T` reopens
the path from `a` through `x` and `D` to `b`, so `T` is minimal. It meets both arcs of `C` between
`a` and `b`, in two vertices that are not consecutive on `C`; as `T` is a clique they are
adjacent, a chord. Conversely, if `S`
is a minimal `a`–`b` separator of a chordal graph and `x, y ∈ S` are distinct and nonadjacent,
minimality gives each of `x`, `y` a neighbour in the component `Cₐ` of `a` and in the component
`C_b` of `b` in `G − S`; shortest `x`–`y` paths through `Cₐ` and through `C_b` form a cycle of
length at least four without a chord, which is absurd.

**Checks.**
- The Checks of 1.1: the diamond satisfies both sides, and the 4-cycle with pendants fails both.
- The theorem holds on every graph with at most six vertices and on a random sample of 800 graphs
  with seven vertices.
- The construction of the route on an infinite graph: on the path on `ℤ` with `a = 0`, `b = 2`,
  it gives `{1}`, the only minimal `0`–`2` separator; the set `{−1, 1}` of all neighbours of `0`
  also separates them and is not minimal.

*Needs:* 1.1; Mathlib `SimpleGraph.IsClique`, `SimpleGraph.Reachable`, `Minimal`. (Proved here,
except as cited.)

### 1.3 Simplicial vertices

Prove `IsChordal.exists_isSimplicial_not_adj`: for `[Finite V]`, a chordal graph `G` with `G ≠ ⊤`
has two distinct nonadjacent simplicial vertices (Dirac, 1961; Vandenberghe–Andersen, Theorem 3.3,
p. 264). In particular every chordal graph on a finite nonempty vertex type has a simplicial
vertex: if `G = ⊤`, every vertex is simplicial.

Route (Vandenberghe–Andersen, proof of Theorem 3.3, pp. 264–265): induction on the number of
vertices. For nonadjacent `a`, `b` take a minimal `a`–`b` separator `S`, a clique by 1.2, and the
components `Cₐ`, `C_b` of `G − S`. The graphs induced on `Cₐ ∪ S` and on `C_b ∪ S` are chordal and
smaller; each is complete or has two nonadjacent simplicial vertices, and since `S` is a clique one
of them lies in `Cₐ` (respectively `C_b`), where its neighbourhood is the same as in `G`.

**Checks.**
- `G ≠ ⊤` is needed: the triangle is chordal and has no two nonadjacent vertices. On the empty
  vertex type and on one vertex `G = ⊤`.
- Finiteness is needed: the two-way infinite path on `ℤ` is chordal, since it has no cycle, is not
  complete, and has no simplicial vertex, each vertex having two nonadjacent neighbours.
- The simplicial vertices of the diamond are `0` and `3`, which are nonadjacent; those of the path
  `0 1 2` are `0` and `2`.

*Needs:* 1.1, 1.2; Mathlib `SimpleGraph.IsClique`, `SimpleGraph.induce`. (Proved here, except as
cited.)

### 1.4 Perfect elimination orderings

Prove `isChordal_iff_exists_isPerfectEliminationOrder`: for `[Finite V]`, `G` is chordal if and
only if some bijection `σ : V ≃ Fin n` is a perfect elimination ordering (Fulkerson and Gross,
1965; Vandenberghe–Andersen, Theorem 4.1, p. 276).

Route: if `σ` is a perfect elimination ordering and `C` is a cycle on at least four vertices, the
vertex of `C` that comes first has two neighbours on `C` that come after it; they are adjacent, a
chord (Vandenberghe–Andersen, §4.1, p. 276). Conversely, by induction on the number of vertices,
put a simplicial vertex `v` (1.3) first and follow it by a perfect elimination ordering of the
chordal graph `G − v`.

**Checks.**
- On the empty vertex type the empty ordering is a perfect elimination ordering and the empty
  graph is chordal.
- `cycleGraph 4` has no perfect elimination ordering: whichever vertex comes first has two
  nonadjacent later neighbours.
- For every graph with at most five vertices, a search over all orderings finds a perfect
  elimination ordering exactly when the graph is chordal; for six vertices the same holds with the
  search organized by first vertices.

*Needs:* 1.1, 1.3; Mathlib `SimpleGraph.IsClique`, `SimpleGraph.induce`, `Equiv`. (Proved here,
except as cited.)

### Examples

Complete graphs, forests, the diamond, the cycles `cycleGraph n` for `n ≥ 4`, the 4-cycle with a
pendant vertex at each vertex, and the path on `ℤ`, with their minimal separators, simplicial
vertices and perfect elimination orderings.

### Dependencies

Mathlib `SimpleGraph.IsIndContained`, `SimpleGraph.IsIndContained.trans`,
`SimpleGraph.Embedding.induce`, `SimpleGraph.cycleGraph`, `SimpleGraph.IsClique`,
`SimpleGraph.neighborSet`, `SimpleGraph.induce`, `SimpleGraph.Reachable`, `Minimal`, `Equiv`. No
other layer.

## Layer 2: perfect graphs and chordal graphs

### 2.1 Perfect graphs

Define `IsPerfect G` as in the Conventions (Diestel, §5.5, p. 139).

- An induced subgraph of a perfect graph is perfect, and a graph isomorphic to a perfect graph is
  perfect.

**Checks.**
- `cycleGraph 5` is not perfect: `χ = 3` and `ω = 2`. `cycleGraph 4` and `cycleGraph 6` are
  perfect, as is every bipartite graph.
- The condition must hold for the induced subgraphs, not only for `G`: the disjoint union of
  `cycleGraph 5` and a triangle has `χ = ω = 3` and is not perfect.
- Every graph on at most four vertices is perfect; on five labelled vertices, exactly
  `1012 = 1024 − 12` graphs are, the 12 exceptions being the labelled 5-cycles.
- The empty set contributes `χ = 0 = ω`, so the graph on the empty vertex type is perfect.

*Needs:* Mathlib `SimpleGraph.induce`, `SimpleGraph.chromaticNumber`, `SimpleGraph.cliqueNum`.

### 2.2 Chordal graphs are perfect

Prove `IsChordal.isPerfect`: every chordal graph is perfect (Diestel, Proposition 5.5.2, p. 140;
Vandenberghe–Andersen, §5.3, p. 298).

Route: for a finite set `s`, the graph `G[s]` is chordal (1.1) and finite, so it has a perfect
elimination ordering (1.4). Colour its vertices from the last to the first, each with a colour
not used on its already coloured neighbours. These neighbours are its later neighbours; with the
vertex they form a clique, so there are at most `ω(G[s]) − 1` of them, and `ω(G[s])` colours
suffice (Vandenberghe–Andersen, §5.2, pp. 297–298, give this colouring through an elimination
tree). With `ω ≤ χ` this gives equality. Diestel's proof instead decomposes the graph along
complete separators.

**Checks.**
- The converse fails: `cycleGraph 4` and the complement of `cycleGraph 6` (the triangular prism)
  are perfect and not chordal.
- The theorem holds on every graph with at most six vertices.

*Needs:* 1.1, 1.4, 2.1; Mathlib `SimpleGraph.cliqueNum_le_chromaticNumber`,
`SimpleGraph.IsClique.card_le_cliqueNum`, `SimpleGraph.Coloring.mk`,
`SimpleGraph.Colorable.chromaticNumber_le`. (Proved here, except as cited.)

### Examples

`cycleGraph 5`, the disjoint union of `cycleGraph 5` and a triangle, `cycleGraph 4`, the
triangular prism, and chordal graphs coloured along perfect elimination orderings.

### Dependencies

Layer 1. Mathlib `SimpleGraph.induce`, `SimpleGraph.chromaticNumber`, `SimpleGraph.cliqueNum`,
`SimpleGraph.cliqueNum_le_chromaticNumber`, `SimpleGraph.IsClique.card_le_cliqueNum`,
`SimpleGraph.Coloring.mk`, `SimpleGraph.Colorable.chromaticNumber_le`.

## Layer 3: comparability graphs and interval graphs

### 3.1 Comparability graphs

Define `IsComparabilityGraph G`: `G = SimpleGraph.fromRel r` for some `r` with `IsStrictOrder V r`
(Diestel, Chapter 5, Exercise 43, p. 151, with a partial ordering of the vertex set; the strict
part of a partial order is a strict order and conversely).

**Checks.**
- A bipartite graph with parts `X`, `Y` is a comparability graph: orient every edge from `X` to
  `Y`; no two arcs compose, so the orientation is transitive. In particular `cycleGraph 4` is one.
- `cycleGraph 5` is not a comparability graph: none of its `32` orientations is transitive.
- Transitivity is what restricts the class: without it every graph `G` would qualify, since
  `SimpleGraph.fromRel G.Adj = G` and `G.Adj` is irreflexive.

*Needs:* Mathlib `SimpleGraph.fromRel`, `SimpleGraph.fromRel_adj`, `IsStrictOrder`.

### 3.2 Comparability graphs and their complements are perfect

- `IsComparabilityGraph.isPerfect`: every comparability graph is perfect (Diestel, Chapter 5,
  Exercise 43, p. 151).
- The complement of every comparability graph is perfect (Dilworth, 1950, as attributed in the
  literature). This is proved here from Dilworth's theorem, before and independently of Layer 4;
  since it also follows in one step from the first statement and the perfect graph theorem 4.2,
  `Suggested.lean` does not state it separately.

Route for the first statement: in `G[s]`, cliques are chains of `r` on `s`. Colour `x ∈ s` by the
number of elements of a longest chain in `s` ending at `x`; comparable elements get different
colours, and the colours lie between `1` and `ω(G[s])` (Mirsky, 1971). Route for the second: in
`Gᶜ[s]`, cliques are antichains and independent sets are chains. Dilworth's theorem,
QuiverRepresentationsPartII §4.3 (`finite_dilworth`), applied to the partial order on `s` given by
`x ≤ y ↔ x = y ∨ r x y`, partitions `s` into as many chains as an antichain has elements; colouring
by the chains gives `χ(Gᶜ[s]) ≤ ω(Gᶜ[s])`.

**Checks.**
- `K_(2, 3)` is a comparability graph, not chordal, with `χ = ω = 2`; its complement, a triangle and
  an edge, has `χ = ω = 3`.
- The complement of a bipartite graph is perfect (Diestel, Chapter 5, Exercise 41, p. 151), a case
  of the second statement.
- Both statements hold for every strict order on at most four points and for 2000 random strict
  orders on five to seven points.

*Needs:* 2.1, 3.1; Mathlib `SimpleGraph.cliqueNum_le_chromaticNumber`,
`SimpleGraph.IsClique.card_le_cliqueNum`, `SimpleGraph.Coloring.mk`,
`SimpleGraph.Colorable.chromaticNumber_le`, `SimpleGraph.exists_isNClique_cliqueNum`;
QuiverRepresentationsPartII §4.3 (`finite_dilworth`). (Proved here, except as cited.)

### 3.3 Interval graphs

Define `intersectionGraph I` for `I : V → Set α` as in the Conventions.

- `isChordal_intersectionGraph`: if `α` is a linear order and every `I v` is order-connected, the
  intersection graph is chordal (Diestel, Chapter 5, Exercise 44 (i), p. 151, for real intervals).
- `isComparabilityGraph_compl_intersectionGraph`: under the same hypotheses its complement is a
  comparability graph (Diestel, Chapter 5, Exercise 44 (ii), p. 151, for real intervals).

So interval graphs are perfect, by 2.2. The converse, that a chordal graph whose
complement is a comparability graph is an interval graph (Gilmore and Hoffman, 1964, as Diestel
quotes it on p. 151), is not a target.

Route for chordality: two disjoint nonempty order-connected sets lie one entirely below the other.
In an induced cycle `v₁ ⋯ vₖ` with `k ≥ 4`, say `I v₁` lies below `I v₃`, and `I v₂` contains the
points between a point `p` of `I v₁ ∩ I v₂` and a point `q` of `I v₂ ∩ I v₃`
(`Set.OrdConnected.uIcc_subset`). The union of `I v₃, …, I vₖ` is order-connected, since
consecutive sets meet, and it contains `q` and a point `t` of `I vₖ ∩ I v₁`, so `t < q`. If
`p ≤ t`, then `t ∈ I v₂` and `v₂ vₖ` is a chord; if `t < p`, then `p` lies in some `I vⱼ` with
`4 ≤ j ≤ k`, and `v₂ vⱼ` is a chord. Route for the complement: order the nonempty sets by "every
point of `I u` is below every point of `I v`", a strict order whose comparable pairs are exactly
the disjoint pairs, and put the indices with empty sets below all others, in any linear order
among themselves.

**Checks.**
- Closed and open intervals give different graphs: `[0, 2]`, `[1, 3]`, `[2, 4]` give a triangle,
  and `(0, 2)`, `(1, 3)`, `(2, 4)` a path. Both are chordal.
- Order-connectedness is needed: the sets `{0, 1}`, `{1, 2}`, `{2, 3}`, `{3, 0}` of `ℕ` have
  intersection graph `cycleGraph 4`.
- The relation "entirely below" is reflexive at an empty set, so the indices with empty sets must
  be ordered separately, as in the route; with them the complement is still a comparability graph.
- Both statements hold on 4000 random families of up to seven order-connected subsets of finite
  chains, about a tenth of the sets empty, and the complement statement on 5000 more families with
  more empty sets.

*Needs:* 1.1, 3.1; Mathlib `SimpleGraph.fromRel`, `SimpleGraph.fromRel_adj`, `Set.OrdConnected`,
`Set.OrdConnected.uIcc_subset`, `IsStrictOrder`. (Proved here, except as cited.)

### Examples

Bipartite graphs, `K_(2, 3)` and its complement, `cycleGraph 5` without a transitive orientation,
and families of closed, open and empty intervals with their intersection graphs and the orders on
their complements.

### Dependencies

Layers 1 and 2 (definitions and, for the perfection of interval graphs, 2.2). Mathlib
`SimpleGraph.fromRel`, `SimpleGraph.fromRel_adj`, `IsStrictOrder`, `Set.OrdConnected`,
`Set.OrdConnected.uIcc_subset`, `SimpleGraph.cliqueNum_le_chromaticNumber`,
`SimpleGraph.IsClique.card_le_cliqueNum`, `SimpleGraph.Coloring.mk`,
`SimpleGraph.Colorable.chromaticNumber_le`, `SimpleGraph.exists_isNClique_cliqueNum`.
QuiverRepresentationsPartII §4.3.

## Layer 4: the perfect graph theorem

### 4.1 The replication lemma

Define `replicate G x` on `Option V`: the old vertices `some v` keep their adjacencies, and the new
vertex `none` is joined to `some x` and to `some w` for every neighbour `w` of `x` (Diestel, §5.5,
p. 142). Prove `IsPerfect.replicate`: replicating a vertex of a perfect graph gives a perfect graph
(Lovász, 1972; Diestel, Lemma 5.5.5, p. 142).

Route (Diestel, proof of Lemma 5.5.5, pp. 142–143): induction on the number of vertices of the
finite induced subgraph. If the clique number goes up, one new colour suffices. Otherwise `x`
lies in no maximum clique; in a colouring of `G` by `ω` colours, deleting the colour class `X` of
`x` except `x` leaves a graph of clique number `ω − 1`, coloured by `ω − 1` colours by perfection,
and `(X ∖ {x}) ∪ {x'}` is independent and takes the last colour.

**Checks.**
- Replicating the vertex of the graph on one vertex gives an edge; replicating a vertex of
  `cycleGraph 5` gives a graph with `χ = ω = 3` that is not perfect, as it contains `cycleGraph 5`.
- Perfection is needed, not only `χ = ω` for the graph itself (Diestel, Chapter 5, Exercise 47,
  p. 151): the 5-cycle `0 5 1 2 3` with a sixth vertex `4` joined to `0`, `2`, `3` has
  `χ = ω = 3`, and replicating `1` gives `χ = 4`, `ω = 3`.
- The lemma holds for every perfect graph on at most five vertices and every vertex.

*Needs:* 2.1; Mathlib `SimpleGraph.fromRel`, `SimpleGraph.Coloring.isIndepSet_colorClass`,
`SimpleGraph.cliqueNum_le_chromaticNumber`, `SimpleGraph.Colorable.chromaticNumber_le`. (Proved
here, following the cited route.)

### 4.2 The perfect graph theorem

Prove `isPerfect_compl_iff`: `Gᶜ` is perfect if and only if `G` is (Lovász, 1972; Diestel,
Theorem 5.5.4, p. 142).

Route (Diestel, proof of Theorem 5.5.4, p. 143, discussed on p. 144): the graph induced on `s`
in `Gᶜ` is the complement of `G[s]`, so it suffices to show that a finite perfect graph `H` has a
clique meeting every independent set of size `α(H)`. Take one disjoint copy of each such independent set and
build on their union the graph that replicates each vertex `v` once for each set containing it;
it arises from an induced subgraph of `H` by repeated replication, so it is perfect by 4.1. It
has the copies as disjoint independent sets of maximum size, so its chromatic number, hence its
clique number, is their number, and a maximum clique meets every copy. Removing such cliques
`α(H)` times covers `H` by `α(H)` cliques, which is `χ(Hᶜ) ≤ ω(Hᶜ)`, using `ω(Hᶜ) = α(H)`
(Mathlib's `SimpleGraph.cliqueNum_compl`).

**Checks.**
- `cycleGraph 7` has `χ = 3`, `ω = 2`, and its complement `χ = 4`, `ω = 3`: both are imperfect, as
  the theorem requires.
- `cycleGraph 5` is isomorphic to its complement.
- The theorem holds on every graph with at most six vertices.

*Needs:* 2.1, 4.1; Mathlib `SimpleGraph.cliqueNum_compl`, `SimpleGraph.indepNum`,
`SimpleGraph.IsIndepSet.card_le_indepNum`, `SimpleGraph.cliqueNum_le_chromaticNumber`. (Proved
here, following the cited route.)

### 4.3 Lovász's characterization

Prove `isPerfect_iff_card_le_indepNum_mul_cliqueNum`: `G` is perfect if and only if every finite
set `s` of vertices satisfies `#s ≤ α(G[s]) · ω(G[s])` (Lovász, 1972; Diestel, Theorem 5.5.6,
p. 144). The condition is symmetric in `G` and `Gᶜ`, by `SimpleGraph.cliqueNum_compl`, so this gives
a second proof of 4.2.

Route (Diestel, proof of Theorem 5.5.6, pp. 144–145, due to Gasparian, 1996). Necessity: a
colouring of `G[s]` by `ω` colours has classes of at most `α` elements. Sufficiency, by induction on
`#s`, for a minimal imperfect `G[s]` with `α`, `ω` its numbers: from `αω + 1` independent sets
`A₀, …, A_(αω)` built from an independent set of size `α` and colourings of the graphs with one of
its vertices deleted, and maximum cliques `Kᵢ` disjoint from `Aᵢ`, the incidence matrices give a
product equal to `J − I` of size `αω + 1` (`J` the all-ones matrix), which is invertible; since
the first factor has `#s` columns, `#s ≥ αω + 1` (`Matrix.rank_mul_le_left`,
`Matrix.rank_le_width`).

**Checks.**
- `cycleGraph 5`: `α · ω = 2 · 2 = 4 < 5`, so the condition fails at `s = V`.
- The empty set gives `0 ≤ 0`.
- The equivalence holds on every graph with at most six vertices and on 800 random graphs with
  seven vertices.

*Needs:* 2.1; Mathlib `SimpleGraph.indepNum`, `SimpleGraph.cliqueNum`, `SimpleGraph.cliqueNum_compl`,
`SimpleGraph.Coloring.isIndepSet_colorClass`, `SimpleGraph.IsIndepSet.card_le_indepNum`,
`Matrix.rank_mul_le_left`, `Matrix.rank_le_width`. (Proved here, following the cited route.)

### Examples

`cycleGraph 5`, `cycleGraph 7` and their complements, the replicated graphs of 4.1, and the
covering of a perfect graph's complement by cliques in the route of 4.2.

### Dependencies

Layer 2 (the definition of perfection). Mathlib `SimpleGraph.fromRel`,
`SimpleGraph.Coloring.isIndepSet_colorClass`, `SimpleGraph.cliqueNum_le_chromaticNumber`,
`SimpleGraph.Colorable.chromaticNumber_le`, `SimpleGraph.cliqueNum_compl`, `SimpleGraph.indepNum`,
`SimpleGraph.cliqueNum`, `SimpleGraph.IsIndepSet.card_le_indepNum`, `Matrix.rank_mul_le_left`,
`Matrix.rank_le_width`.

## Scope and ownership

This roadmap owns the targets stated above: chordal graphs, simplicial vertices, minimal
separators and perfect elimination orderings with the theorems of Dirac and of Fulkerson and
Gross; perfect graphs and the perfection of chordal graphs; comparability graphs and their
complements; interval graphs, their chordality and their complements; the replication lemma, the
perfect graph theorem and Lovász's characterization.

Already in the libraries and therefore not targets:

- Mathlib's induced subgraphs and induced containment (`SimpleGraph.induce`,
  `SimpleGraph.IsIndContained` with its transitivity), cycle graphs, cliques, the clique number,
  the independence number with `SimpleGraph.cliqueNum_compl`, colourings and the chromatic number,
  and the bound `SimpleGraph.cliqueNum_le_chromaticNumber`. Mathlib has no chordal graphs, perfect
  graphs, comparability graphs or interval graphs, and neither has Tau Ceti.
- Tau Ceti's Menger theorem for simple graphs
  (`TauCeti/Combinatorics/SimpleGraph/Connectivity/Menger.lean`) phrases separation by deleting a
  set of vertices and asking for non-reachability in the induced graph, as `IsSeparator` does here;
  it has no minimal separators.

Left to other roadmaps:

- QuiverRepresentationsPartII §4.3 owns Dilworth's theorem for finite posets, which 3.2 uses; it is
  not restated. GraphConnectivityAndFlows owns separators, cuts and connectivity in general (its
  §1.2) and excludes Dilworth's theorem and treewidth. The minimal `a`–`b` separators here are its
  local vertex separators for a pair of simple-graph vertices, with minimality added; minimal
  separators and their cliques are not stated there.
- GraphColouring (an open roadmap, not on main) proves bounds on the chromatic number and lists
  perfect graphs outside its scope; this roadmap does not depend on it. Its bound
  `n ≤ χ(G) · α(G)` (its §1.2) is a different statement from 4.3, which bounds `n` by `α · ω`.
- GraphConnectivityAndFlows §6.7 owns Kőnig's theorem, in a capacitated form, from which Diestel
  derives the perfection of complements of bipartite graphs; here that is a case of 3.2.

Outside the scope: the strong perfect graph theorem of Chudnovsky, Robertson, Seymour and Thomas
(Diestel, Theorem 5.5.3, p. 141), stated here only as the pointer that a graph is perfect exactly
when neither it nor its complement has an induced odd cycle of length at least five; clique trees,
tree decompositions and the characterization of chordal graphs by pasting along cliques (Diestel,
Proposition 5.5.1, p. 140); treewidth and chordal completions; the theorem of Gilmore and Hoffman
and other characterizations of interval graphs; recognition of every class and all colouring or
elimination procedures and their running times; Shannon capacity and the theta function;
infinite chordal graphs for the theorems on simplicial vertices and elimination orderings.

## Exact supplier contracts

### From Mathlib

- `Mathlib/Combinatorics/SimpleGraph/Copy.lean`: `SimpleGraph.IsIndContained G H`
  (`Nonempty (G ↪g H)`: an injective map of vertices preserving and reflecting adjacency);
  `SimpleGraph.IsIndContained.trans`.
- `Mathlib/Combinatorics/SimpleGraph/Maps.lean`: `SimpleGraph.induce` (the graph on the subtype of a
  set), `SimpleGraph.Embedding.induce` (its inclusion as an induced subgraph).
- `Mathlib/Combinatorics/SimpleGraph/CycleGraph.lean`: `SimpleGraph.cycleGraph n` (on `Fin n`,
  `a` adjacent to `a ± 1`; no edges for `n ≤ 1`).
- `Mathlib/Combinatorics/SimpleGraph/Basic.lean`: `SimpleGraph.neighborSet`, `SimpleGraph.fromRel`
  and `SimpleGraph.fromRel_adj` (`(fromRel r).Adj v w ↔ v ≠ w ∧ (r v w ∨ r w v)`).
- `Mathlib/Combinatorics/SimpleGraph/Connectivity/Connected.lean`: `SimpleGraph.Reachable`.
- `Mathlib/Combinatorics/SimpleGraph/Clique.lean`: `SimpleGraph.IsClique`; `SimpleGraph.cliqueNum`
  and `SimpleGraph.indepNum` (suprema in `ℕ` of the sizes of cliques and independent sets);
  `SimpleGraph.IsClique.card_le_cliqueNum` and `SimpleGraph.IsIndepSet.card_le_indepNum` (for
  `[Finite α]`); `SimpleGraph.exists_isNClique_cliqueNum` (some clique has `cliqueNum` elements);
  `SimpleGraph.cliqueNum_compl` (`Gᶜ.cliqueNum = G.indepNum`).
- `Mathlib/Combinatorics/SimpleGraph/Coloring/Vertex.lean`: `SimpleGraph.chromaticNumber` (the
  infimum in `ℕ∞` of the `n` with `G.Colorable n`); `SimpleGraph.Coloring.mk`;
  `SimpleGraph.Coloring.isIndepSet_colorClass`; `SimpleGraph.Colorable.chromaticNumber_le`;
  `SimpleGraph.cliqueNum_le_chromaticNumber` (`↑G.cliqueNum ≤ G.chromaticNumber`).
- `Mathlib/Order/Defs/Unbundled.lean`: `IsStrictOrder` (irreflexive and transitive), `Minimal`
  (`P x ∧ ∀ y, P y → y ≤ x → x ≤ y`).
- `Mathlib/Order/Interval/Set/OrdConnected.lean`: `Set.OrdConnected`,
  `Set.OrdConnected.uIcc_subset` (in a linear order, an order-connected set contains the interval
  between any two of its points).
- `Mathlib/LinearAlgebra/Matrix/Rank.lean`: `Matrix.rank_mul_le_left` (`(A * B).rank ≤ A.rank`),
  `Matrix.rank_le_width` (the rank of an `m × n` matrix is at most `n`).

### From TauCetiRoadmap.QuiverRepresentationsPartII

- §4.3, `finite_dilworth`: for a finite partial order there are an antichain `A` and a set `C` of
  nonempty, pairwise disjoint chains covering the carrier with `#A = #C`; no nonemptiness is
  assumed. Used in 3.2 for the complements of comparability graphs.

## References

- Reinhard Diestel, *Graph Theory*, sixth edition, 2025; the free preview of the main text on the
  author's site (`diestel-graph-theory.com`, chapter file `Ch5.pdf` of June 2024), Chapter 5, §5.5,
  pp. 139–145, and the exercises, pp. 148–152. The exercises are numbered within the chapter.
- Lieven Vandenberghe and Martin S. Andersen, *Chordal Graphs and Semidefinite Optimization*,
  Foundations and Trends in Optimization 1 (4), 2014, pp. 241–433, in the copy on L. Vandenberghe's
  page at UCLA: §§3.1–3.4, pp. 256–265, §§4.1–4.2, pp. 274–277, and §§5.2–5.3, pp. 297–298.
- The papers of Dirac (1961), Fulkerson and Gross (1965), Dilworth (1950), Mirsky (1971), Lovász (1972, two papers), Gasparian (1996), Gilmore and Hoffman
  (1964) and Chudnovsky, Robertson, Seymour and Thomas (2006) are named as the two texts above and
  the customary attributions credit them; no locator into them is given. The perfection of
  complements of comparability graphs (3.2) and the forms of 3.3 for order-connected sets in a
  linear order are not stated in that generality in the two texts; they are proved here.
