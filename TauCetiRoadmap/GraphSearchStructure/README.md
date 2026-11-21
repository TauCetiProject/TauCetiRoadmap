# Roadmap: graph search structure

**Summary.** Depth-first search visits the vertices of a graph by following arcs as far as possible
and backing up only when no new vertex can be reached. Each vertex receives a discovery time and a
finishing time on one shared clock, and the vertices reached from a vertex hang below it in a forest
of parent pointers. This roadmap states the classical theorems about them for a specification
rather than a procedure: a depth-first forest of a relation is a choice of discovery times,
finishing times and parent map satisfying six axioms, and every theorem holds for every such forest.
Vertex sets are arbitrary types and finiteness is assumed only for the existence theorem; the
axioms themselves make every tree of a forest finite.

The headline theorems are these.

- *Existence and parentheses.* On a finite vertex set every relation has a depth-first forest, and
  its roots can be taken in the order of any prescribed priority. In every depth-first forest, `u`
  is an ancestor of `v` exactly when the time interval of `v` lies inside that of `u`, and exactly
  when an arc path leads from `u` to `v` through vertices discovered no earlier than `u` (the
  white-path theorem).
- *Strongly connected components.* For a quiver, finishing times decrease along every arrow exactly
  when the quiver has no directed cycle. Each strongly connected component contains exactly one
  vertex without a parent inside it. If a component `C` lies strictly below a component `D` in the
  reachability order, some vertex of `C` finishes after every vertex of `D`. Hence a second
  depth-first forest of the reversed quiver, with roots taken in decreasing finishing time of the
  first, has the components as its trees (Kosaraju and Sharir). A vertex is the earliest discovered
  vertex of a sink component exactly when its low-link value equals its discovery time and every
  proper descendant has low-link value below its own (Tarjan).
- *Cut vertices and bridges.* In a depth-first forest of a simple graph every edge joins an
  ancestor to a descendant. A root is a cut vertex exactly when it has at least two children, any
  other vertex exactly when one of its children has low point at least its own discovery time, and a
  tree edge is a bridge exactly when the low point of its lower end is that end's own discovery
  time.
- *Breadth-first layers.* A connected graph is bipartite exactly when no edge joins two vertices at
  the same distance from a fixed vertex.

The roadmap builds on Tau Ceti's strongly connected components and their order, acyclic quivers
and cut vertices, and on Mathlib's bridges, graph distance and two-colourings.
GraphConnectivityAndFlows develops the structure theory of the cut vertices and bridges detected
here; SpanningTreesAndShortestPaths treats weighted distances and shortest-path trees.

Layer 1 below fixes the axioms, the priority rule for roots and the existence theorem. Layer 2
proves the parenthesis and white-path theorems and the classification of arcs. Layer 3 treats
quivers: acyclicity, strongly connected components, the Kosaraju–Sharir and Tarjan theorems.
Layer 4 treats simple graphs: normality, spanning trees, cut vertices and bridges. Layer 5 is the
bipartiteness criterion by distance layers and depends on no other layer.

## Conventions

- **The relation.** A relation `r : V → V → Prop` on an arbitrary type `V` is a directed graph:
  `r u v` is an arc from `u` to `v`. Loops `r v v` are allowed. A quiver `[Quiver V]` enters
  through `fun a b ↦ Nonempty (a ⟶ b)`, so parallel arrows collapse; its reverse is
  `fun a b ↦ Nonempty (b ⟶ a)`. A simple graph `G` enters through the symmetric irreflexive
  relation `G.Adj`; this is undirected depth-first search, and no new graph object is introduced.
- **Times.** Discovery times `pre` and finishing times `post` are functions `V → ℕ` read on one
  clock: no discovery or finishing time occurs twice (axiom (D1) below). On a finite `V` they
  need not be `0, …, 2|V| − 1`; every statement below depends only on the relative order of the
  times.
- **Infinite vertex types.** The descendants of `v` have their times between `pre v` and `post v`
  (2.1), so every tree of a forest is finite. On an infinite type a forest therefore has infinitely
  many roots; an uncountable type carries no forest, since the times are distinct natural numbers;
  and an infinite connected simple graph carries none, since by the route of 4.2 its forest would
  be a single tree. The theorems of Layers 2–4 are stated for every forest, with no finiteness
  assumption, because their routes use none.
- **The forest.** A parent map `parent : V → Option V` gives the forest; `parent v = none` makes
  `v` a root. "Ancestor" is reflexive: `v` is an ancestor of itself, and a proper descendant of `v`
  is a descendant different from `v`. The children of `u` are the `v` with `parent v = some u`, and
  `sub(v)` denotes the set of descendants of `v`.
- **The parent is data determined by the times.** Axiom (D4) says that `parent v = some u` exactly
  when the interval of `u` is the innermost interval strictly containing that of `v`. So the times
  determine `parent`. It is carried as data because the theorems speak of the forest of parent
  pointers (ancestors, children, tree edges), as the sources do, and (D4) is the one place where
  that forest is tied to the times.
- **Ties.** Roots chosen by a priority `key : V → ℕ` may tie; ties are broken arbitrarily.
- **Components and orders.** Strongly connected components are Mathlib's
  `Quiver.StronglyConnectedComponent V` with `Quiver.StronglyConnectedComponent.mk`, ordered by Tau
  Ceti's `Quiver.StronglyConnectedComponent.instPartialOrder`: `C ≤ D` when some vertex of `C` has a
  path to some vertex of `D`. A sink component is a maximal one (`IsMax`). Acyclicity is Tau Ceti's
  `TauCeti.Quiver.IsAcyclic`: every closed path is trivial, so a loop is a cycle.
- **Undirected notions.** Cut vertices are Tau Ceti's `SimpleGraph.IsCutVertex` (two other vertices
  joined by walks, all through the vertex); bridges are Mathlib's `SimpleGraph.IsBridge`, which by
  `SimpleGraph.isBridge_iff` says that deleting the edge `s(u, v)` leaves `v` unreachable from `u`.
  Distances are Mathlib's `SimpleGraph.dist`, which is `0` between vertices in different components.
- **Search procedures.** No search procedure is defined. Existence of forests (1.4) is proved by
  induction inside its proof.

## Layer 1: depth-first forests

### 1.1 Ancestors

Define `IsAncestor parent` as the reflexive-transitive closure of the relation "`b` has parent
`a`" (`parent b = some a`).

**Checks.**
- `IsAncestor parent v v` holds for every `v`, also for a root.
- With `parent b = some a` and `parent c = some b`, `a` is an ancestor of `c`, and `c` is an
  ancestor of no vertex but itself.

### 1.2 The axioms

Define `IsDFSForest r pre post parent` as the conjunction of six axioms.

- (D1) The map from `V ⊕ V` to `ℕ` taking the left copy of `v` to `pre v` and the right copy to
  `post v` is injective: the `2|V|` times are distinct.
- (D2) `pre v < post v` for every `v`.
- (D3) If `pre u < pre v < post u` then `post v < post u`.
- (D4) `parent v = some u` if and only if `pre u < pre v`, `post v < post u`, and every `w` with
  `pre w < pre v` and `post v < post w` has `pre w ≤ pre u`.
- (D5) If `parent v = some u` then `r u v`.
- (D6) If `r u v` then `pre v < post u`.

By (D1)–(D3) two time intervals `[pre u, post u]` and `[pre v, post v]` of distinct vertices are
nested or disjoint (Erickson, §6.1, p. 228, the text after Figure 6.3). (D4) makes the parent the
innermost interval strictly containing a vertex's interval; (D5) makes tree edges arcs; (D6) says
that every out-neighbour of `u` is discovered before `u` finishes, the only axiom about arcs that
are not tree edges. The search procedure of Erickson's Figure 6.3 (p. 228) assigns times and parent
pointers in this way.

*Remark (a finite computation, not a target).* On every relation on at most four vertices (1, 2,
10, 104 and 3044 relations up to isomorphism for `n = 0, …, 4`, loops allowed) and on every simple
graph on at most five labelled vertices (1, 2, 8, 64 and 1024 graphs for `n = 1, …, 5`), the
structures with times `0, …, 2n − 1` satisfying the six axioms are exactly the outputs of
depth-first search over all orders of the roots and of the out-neighbours; counting the forests of
one representative of each relation class, there are 32632 pairs of a relation class and a forest
for `n = 4`, and 27360 pairs of a labelled graph and a forest for `n = 5`.

**Checks.**
- The empty type carries the empty forest. One vertex, with or without a loop, carries the forest
  with times `[0, 1]` and no parent.
- On `V = ℕ` with no arcs, `pre n = 2n`, `post n = 2n + 1` and no parents form a forest in which
  every vertex is a root. With the arcs `0 → n` for all `n ≥ 1` there is no forest: (D6) would put
  the infinitely many distinct times `pre n` below `post 0`.
- One arc `a → b`: `a = [0, 3]`, `b = [1, 2]`, `parent b = some a` is a forest, and (D4) forces
  `parent b = some a` from the times alone. The times `a = [0, 1]`, `b = [2, 3]` without parents
  satisfy (D1)–(D5) and violate (D6) (a "cross arc to the right").
- Each axiom is needed for the theorems of Layer 2; in each example the other five axioms hold.
  Without (D1): two vertices without arcs, both with interval `[0, 1]` and no parents; each
  interval contains the other and neither vertex is an ancestor of the other, against 2.1. Without
  (D2): `a = [0, 2]`, `b = [3, 5]`, `pre c = 4`, `post c = 1`, `parent c = some b`, one arc `b → c`;
  the interval condition of 2.1 holds for `(a, c)` but `a` is not an ancestor of `c`. Without (D3):
  crossing intervals `a = [0, 2]`, `b = [1, 3]`, no parents, one arc `a → b`, against 2.3. Without
  (D4): `a = [0, 3]`, `b = [1, 2]`, no parents, one arc `a → b`, against 2.1. Without (D5): no
  arcs, `a = [0, 3]`, `b = [1, 2]`, `parent b = some a`; `b` is a descendant of `a` with no path
  from `a`, against 2.2. Without (D6): the cross arc to the right above, against 2.3.

### 1.3 Roots by priority

Define `RootsByKey key pre parent`: for every root `x` and every `w` with `pre x ≤ pre w`,
`key w ≤ key x`. The vertices not yet discovered when `x` is discovered are those with
`pre w ≥ pre x`, so each new tree starts at an undiscovered vertex of largest priority. Any order
in which the roots are tried is of this form, with `key` the position counted from the end.

**Checks.**
- Two vertices without arcs, `key a = 1`, `key b = 0`: the forest `a = [0, 1]`, `b = [2, 3]`
  satisfies `RootsByKey key`, the forest `b = [0, 1]`, `a = [2, 3]` does not. With equal keys both
  do.

### 1.4 Existence

Prove `exists_isDFSForest_rootsByKey`: if `V` is finite, then for every relation `r` and every
`key : V → ℕ` there are `pre`, `post` and `parent` with `IsDFSForest r pre post parent` and
`RootsByKey key pre parent`. (Proved here; the forest is that of Erickson, Figure 6.3, p. 228, but
the axioms are this roadmap's and existence is derived.)

Route, by two strong inductions; no procedure is defined.

- *One tree.* Let `U` be a finite set, `x ∈ U`, `t ∈ ℕ`, and `R` the set of `y` with
  `ReflTransGen (fun a b ↦ r a b ∧ b ∈ U) x y`. Claim: there are `pre`, `post`, `parent` such that
  the `2|R|` times of the vertices of `R` are exactly `t, …, t + 2|R| − 1`, `pre x = t`,
  `post x = t + 2|R| − 1`, `parent x = none`, (D1)–(D5) hold for vertices of `R` (with `w` in (D4)
  ranging over `R`), and (D6′): if `y ∈ R`, `r y z` and `z ∈ U`, then `z ∈ R` and `pre z < post y`.
  Strong induction on `|U|`. List the out-neighbours of `x` in `U ∖ {x}` as `y₁, …, y_k`. Put
  `U₀ = U ∖ {x}`, `t₀ = t + 1`. For `i = 1, …, k`: if `yᵢ ∈ U_(i−1)`, apply the induction hypothesis
  to `U_(i−1)` (of size less than `|U|`), `yᵢ` and `t_(i−1)`, obtaining a tree on a set `Rᵢ`; set
  `parent yᵢ = some x`, `Uᵢ = U_(i−1) ∖ Rᵢ` and `tᵢ = t_(i−1) + 2|Rᵢ|`. Otherwise `Rᵢ = ∅`,
  `Uᵢ = U_(i−1)`, `tᵢ = t_(i−1)`. Set `pre x = t`, `post x = t_k`. The `Rᵢ` are disjoint because
  `Rᵢ ⊆ U_(i−1)`. The set `S = {x} ∪ R₁ ∪ ⋯ ∪ R_k` lies in `R` and is closed under arcs into `U`:
  an arc from `x` into `U` ends at `x` or at some `yᵢ`, which lies in `Rᵢ` if `yᵢ ∈ U_(i−1)` and
  otherwise in some `Rⱼ` with `j < i`; an arc from `y ∈ Rᵢ` to `z ∈ U` ends in `Rᵢ` by (D6′) of
  the induction when `z ∈ U_(i−1)`, and otherwise at `x` or in some `Rⱼ` with `j < i`. As `R` is the
  least set containing `x` and closed under arcs into `U`, `S = R`, and
  `|R| = 1 + |R₁| + ⋯ + |R_k|`, so `t_k = t + 2|R| − 1`. The times of `Rᵢ` form the block
  `t_(i−1), …, tᵢ − 1`; the blocks are consecutive inside `(t, t_k)`, which gives (D1)–(D3). For
  (D4): the containing intervals of `v ∈ Rᵢ` are those inside `Rᵢ` and the interval of `x`, whose
  `pre` is smallest; the interval of `yᵢ` is the whole block, so `x` is the only interval
  containing it and `parent yᵢ = some x` is right, while the parents of the other vertices of
  `Rᵢ` are those of the induction; `x` lies in no other interval. (D5) holds since `r x yᵢ`. For
  (D6′): if `y = x`, then `z = x` or `z ∈ R ∖ {x}`, and `pre z < t_k = post x`; if `y ∈ Rᵢ`, then
  either `z ∈ U_(i−1)` and the induction applies, or `z = x` and `pre x = t < post y`, or `z ∈ Rⱼ`
  with `j < i` and `pre z < t_(i−1) ≤ pre y < post y`.
- *The forest.* Strong induction on the finite set `W` of undiscovered vertices, starting from
  `W = V` and `t = 0`. If `W` is empty, stop. Otherwise choose `x ∈ W` of largest `key`
  (`Finset.exists_max_image`), apply the claim to `W`, `x` and `t`, obtaining a tree on `R ⊆ W`,
  and continue with `W ∖ R` and `t + 2|R|`. Intervals of different trees are disjoint, so (D1)–(D5)
  hold tree by tree and every vertex chosen as `x` is a root. For (D6), let `r y z` with `y` in the
  tree built from `W`: if `z ∈ W`, (D6′) applies; otherwise `z` lies in an earlier tree and
  `pre z < t ≤ pre y < post y`. For `RootsByKey`: when `x` is chosen with `pre x = t`, the vertices
  `w` with `pre w ≥ t` are exactly those of `W`, and `key w ≤ key x` by the choice of `x`.

**Checks.**
- Finiteness is needed. On `V = ℕ` with no arcs and `key = id`, every vertex is a root by (D5); the
  root with the least discovery time would need the largest key among all vertices discovered after
  it, which do not have a largest key. A forest without the priority condition exists there
  (`pre n = 2n`, `post n = 2n + 1`).
- On the empty type the statement gives the empty functions; on one vertex, `[0, 1]`.

*Needs:* 1.2, 1.3; Mathlib `Finset.exists_max_image`, `Relation.ReflTransGen`.

### Examples

- The forest of one arc `a → b` searched from `a` (1.2), and the same arc searched from `b` first:
  `b = [0, 1]`, `a = [2, 3]`, two roots.

### Dependencies

Layer 1 uses Mathlib only.

## Layer 2: parentheses, white paths and arc classes

Throughout, `h : IsDFSForest r pre post parent` for an arbitrary relation `r`. The routes use three
facts about the axioms, proved inside them.

- (L1) For `u ≠ v` the intervals of `u` and `v` are nested or disjoint: say `pre u < pre v`
  (by (D1)); then either `pre v < post u` and (D3) gives `post v < post u`, or `post u < pre v`.
- (L2) The vertices `w` whose interval strictly contains that of `v` (`pre w < pre v` and
  `post v < post w`) form a chain under nesting, by (L1), and their discovery times are distinct
  numbers below `pre v`. If there is one, the one with the largest discovery time is `parent v`, by
  (D4); if there is none, `parent v = none`, again by (D4).
- (L3) Following parents strictly lowers `pre` (by (D4)), so every vertex has a root ancestor; the
  ancestors of a vertex are pairwise comparable (2.1 and (L2)), so the root ancestor is unique,
  and every proper ancestor of a vertex is its parent or a proper ancestor of its parent.

### 2.1 The parenthesis theorem

Prove `IsDFSForest.isAncestor_iff`: `IsAncestor parent u v` if and only if `pre u ≤ pre v` and
`post v ≤ post u` (Erickson, Lemma 6.1, (a) ⇔ (b), p. 230, with proof on pp. 230–231; Erickson's
form `u.pre ≤ v.pre < v.post ≤ u.post` has the middle inequality, which is (D2)).

Route. (⇒) Induction on the closure; each parent step shrinks the interval by (D4). (⇐) Strong
induction on `pre v`. If `u = v` the closure is reflexive. Otherwise `pre u < pre v` and
`post v < post u` by (D1), so the interval of `u` strictly contains that of `v`, and by (L2)
`parent v = some p` with `pre u ≤ pre p` (the third clause of (D4) at `w = u`). If `p = u` we are
done. Otherwise `pre u < pre p < pre v < post u`, so (D3) gives `post p < post u`; the induction
hypothesis applied to `p` gives `IsAncestor parent u p`, and one more step reaches `v`.

**Checks.**
- For the arcs `a → b`, `a → c` and the forest `a = [0, 5]`, `b = [1, 2]`, `c = [3, 4]` with both
  parents `a`, the intervals of `b` and `c` are disjoint and neither is an ancestor of the other;
  `a` is an ancestor of both.
- The theorem fails without (D1), (D2) or (D4) (the Checks of 1.2).

*Needs:* 1.1, 1.2.

### 2.2 The white-path theorem

Prove `IsDFSForest.isAncestor_iff_reflTransGen`: `IsAncestor parent u v` if and only if `v` is
reached from `u` along arcs `a → b` with `pre u ≤ pre b`, that is
`ReflTransGen (fun a b ↦ r a b ∧ pre u ≤ pre b) u v` (Erickson, Lemma 6.1, (a) ⇔ (d), p. 230, with
proof on pp. 230–231). The condition `pre u ≤ pre b` says that `b` is still undiscovered just
before `u` is (Erickson, §6.1, "Classifying Vertices and Edges", p. 228).

Route. (⇒) Induction on the closure: a parent step `parent c = some b` is an arc `r b c` by (D5),
and `pre u ≤ pre c` by 2.1. (⇐) Induction along the path with the invariant `pre u ≤ pre b` and
`post b ≤ post u`. For an arc `a → b` with the invariant at `a` and `pre u ≤ pre b`, (D6) gives
`pre b < post a ≤ post u`; so `b = u`, or `pre u < pre b < post u` and (D3) gives
`post b < post u`. At `v` the invariant and 2.1 give the conclusion.

**Checks.**
- One arc `a → b` with the forest `b = [0, 1]`, `a = [2, 3]` (searched from `b` first): the arc
  leads to `b`, discovered before `a` (`pre b = 0 < 2 = pre a`), and `b` is not a descendant of
  `a`.
- Without (D5) the theorem fails (the Check of 1.2).

*Needs:* 1.1, 1.2, 2.1.

### 2.3 Classes of arcs

Prove `IsDFSForest.isAncestor_or_isAncestor_or_post_lt`: for every arc `r u v`, `u` is an ancestor
of `v` (a tree or forward arc), or `v` is an ancestor of `u` (a back arc; a loop is one), or
`post v < pre u` (a cross arc). The fourth configuration, `post u < pre v`, does not occur
(Erickson, §6.1, p. 229, the four classes of edges, and Figure 6.5, p. 230). Whether a forward
arc is a tree arc is whether `parent v = some u`.

Route. (D6) gives `pre v < post u`. If `pre u ≤ pre v`, then `u = v` or (L1) nests `v` in `u`, and
2.1 applies. If `pre v < pre u`, then `pre u < post v` and (D3) nests `u` in `v` (2.1), or
`post v < pre u` by (D1).

**Checks.**
- One loop `r v v`: `v` is its own ancestor; the loop is a back arc.
- Without (D3) or (D6) the statement fails (the Checks of 1.2); the cross arc to the right is
  exactly what (D6) excludes.

*Needs:* 1.1, 1.2, 2.1.

### Examples

- Erickson's Figure 6.4 (p. 229) draws a forest with its intervals; the four arc classes of 2.3 are
  drawn in his Figure 6.5 (p. 230).

### Dependencies

Layer 2 depends on Layer 1.

## Layer 3: acyclicity and strongly connected components

Throughout, `V` carries a quiver and `h : IsDFSForest (fun a b ↦ Nonempty (a ⟶ b)) pre post parent`.
Paths of the quiver and the closure `ReflTransGen (fun a b ↦ Nonempty (a ⟶ b))` are exchanged by
Tau Ceti's `Quiver.reachable_iff_reflTransGen`, and `mk a = mk b` (writing `mk` for
`Quiver.StronglyConnectedComponent.mk`) means paths in both directions
(`Quiver.StronglyConnectedComponent.eq`). The routes use *convexity*: if `a` and `b` lie in one
component `C` and `a ⇝ c ⇝ b`, then `c ∈ C`, because `c ⇝ b ⇝ a`.

### 3.1 Acyclicity

Prove `IsDFSForest.isAcyclic_iff`: `TauCeti.Quiver.IsAcyclic V` if and only if `post v < post u`
for every arrow `u ⟶ v` (Erickson, §6.2, p. 231, and §6.3, p. 232). Erickson states the cyclic
side as `u.post < v.post` for some edge, which misses loops; with the strict inequality used here a
loop `u ⟶ u` violates the condition, as it must, since a loop is a cycle for Tau Ceti.

Route. (⇐) A closed path that is not trivial ends with an arrow `b ⟶ a`, so `post a < post b`,
while along its first part, a path from `a` to `b`, finishing times do not increase (induction):
contradiction, so every closed path is trivial (`TauCeti.Quiver.isAcyclic_def`). (⇒) Take an arrow
`e : u ⟶ v` and apply 2.3. If `u = v`, `e.toPath` is a closed path of length one
(`Quiver.Path.length_toPath`), so not trivial. If `v` is a proper descendant of `u`,
`post v < post u` by 2.1 and (D1). If `v` is a proper ancestor of `u`, 2.2 (⇒) gives a path
`q` from `v` to `u`, and `q.comp e.toPath` is a closed path of positive length
(`Quiver.Path.length_comp`). For a cross arc, `post v < pre u < post u`. The same case analysis
shows that the condition holds exactly when no arc is a back arc.

*Remark (not a target).* For a finite acyclic quiver, listing the vertices by increasing finishing
time gives a list in which no arrow runs from a vertex to one listed after it, the convention of
Tau Ceti's `TauCeti.Quiver.IsAcyclic.exists_pairwise_isEmpty_hom`; its reversal is Erickson's
topological order (p. 232).

**Checks.**
- One vertex with a loop: not acyclic, and `post v < post u` fails for the loop. The non-strict
  condition `post v ≤ post u` holds there, so it does not characterize acyclicity.
- The arc `a → b` with `a = [0, 3]`, `b = [1, 2]`: acyclic, `post b = 2 < 3 = post a`.

*Needs:* 2.1, 2.2, 2.3; Tau Ceti `TauCeti.Quiver.IsAcyclic`, `TauCeti.Quiver.isAcyclic_def`,
`Quiver.reachable_iff_reflTransGen`; Mathlib `Quiver.Hom.toPath`, `Quiver.Path.comp`,
`Quiver.Path.length_toPath`, `Quiver.Path.length_comp`.

### 3.2 Components are subtrees

Prove `IsDFSForest.existsUnique_parent_not_mem`: every strongly connected component `C` contains
exactly one vertex `v` such that `parent v` is `none` or lies outside `C` (Erickson, Lemma 6.2,
p. 238, with proof on pp. 238–239). This vertex is the one of `C` discovered first, and every vertex
of `C` is its descendant (Erickson, p. 239, where it is called the root of `C`).

Route. Choose `v₀ ∈ C` (`Quiver.StronglyConnectedComponent.mk_surjective`) of least discovery time
(`Nat.find` on the discovery times of `C`). Every `w ∈ C` is a descendant of `v₀`: a path from
`v₀` to `w` stays in `C` by convexity, so its vertices have `pre ≥ pre v₀`, and 2.2 (⇐) applies.
Existence: a parent `u` of `v₀` has `pre u < pre v₀` by (D4), so `u ∉ C`. Uniqueness: if `w ∈ C`
and `w ≠ v₀`, then `w` is a proper descendant of `v₀`, so `parent w = some p` with `pre v₀ ≤ pre p`
by (L2) and 2.1, and `p` is a descendant of `v₀` (2.1, with (D3) when `p ≠ v₀`). Then
`v₀ ⇝ p` (2.2) and `p → w ⇝ v₀` (D5), so `p ∈ C` by convexity.

**Checks.**
- Arcs `a → b`, `b → a`, `a → c` with `a = [0, 5]`, `b = [1, 2]`, `c = [3, 4]`, both parents `a`:
  the components are `{a, b}` and `{c}`; the vertices with no parent in their own component are
  `a` and `c`, one in each.
- One arc `b → a` searched with `a = [0, 1]`, `b = [2, 3]`: two trees, two components, each vertex
  a root.

*Needs:* 2.1, 2.2; Mathlib `Quiver.StronglyConnectedComponent.eq`; Tau Ceti
`Quiver.StronglyConnectedComponent.mk_surjective`, `Quiver.reachable_iff_reflTransGen`.

### 3.3 Finishing times reverse the order of components

Prove `IsDFSForest.exists_forall_post_lt`: if `mk u < mk v`, there is `x` with `mk x = mk u` such
that `post y < post x` for every `y` with `mk y = mk v`. The witness is the earliest vertex of
`mk u` (3.2), which also finishes last in its component. So listing the components by decreasing
largest finishing time puts every component before all components it reaches. Erickson proves only
the special case that the vertex finishing last overall lies in a component with nothing below it
(Lemma 6.3, p. 240, with proof); the general statement is derived here (Proved here).

Route. For a component `C` write `ρ(C)` for its earliest vertex (3.2); every `y ∈ C` is a
descendant of `ρ(C)`, so `post y ≤ post ρ(C)` by 2.1.

- *Claim.* If `a ∈ C`, `b ∈ D`, `C ≠ D` and there is an arrow `a ⟶ b`, then
  `post ρ(D) < post ρ(C)`. The discovery times of `ρ(C)` and `ρ(D)` differ (they are distinct
  vertices, (D1)). If `pre ρ(D) < pre ρ(C)`: were `ρ(D)` an ancestor of `ρ(C)`, then
  `ρ(D) ⇝ ρ(C) ⇝ a → b ⇝ ρ(D)` (2.2 and the components) would put `ρ(C)` in `D`; so by (L1) and
  2.1 the two intervals are disjoint and `post ρ(D) < pre ρ(C) < post ρ(C)`. If
  `pre ρ(C) < pre ρ(D)`: take a path from `ρ(C)` to `a` inside `C` and from `b` to `ρ(D)` inside
  `D` (convexity); all its vertices have `pre ≥ pre ρ(C)` (those in `C` by the choice of `ρ(C)`,
  those in `D` because `pre ≥ pre ρ(D)`), so by 2.2 `ρ(D)` is a proper descendant of `ρ(C)`, and
  `post ρ(D) < post ρ(C)` by 2.1 and (D1).
- *Conclusion.* From `mk u ≤ mk v` take a path `u ⇝ v`. Along it the value `post ρ(mk z)` stays
  equal inside a component and drops strictly at an arrow between components (Claim), so
  `post ρ(mk v) ≤ post ρ(mk u)`; equality would give `ρ(mk v) = ρ(mk u)` by (D1) and so
  `mk u = mk v`. Take `x = ρ(mk u)`.

**Checks.**
- The example of 3.2: `{a, b} < {c}`; `a` finishes at `5`, after `c` at `4`. The least finishing
  time of `{a, b}` is `post b = 2 < 4`, so the statement with least finishing times is false.
- Erickson's special case follows: if `post w ≤ post v` for all `w` and `mk w < mk v`, the theorem
  gives a vertex finishing after `v`.

*Needs:* 2.1, 2.2, 3.2; Tau Ceti `Quiver.StronglyConnectedComponent.instPartialOrder`,
`Quiver.StronglyConnectedComponent.mk_le_mk`.

### 3.4 The Kosaraju–Sharir theorem

Prove `IsDFSForest.isAncestor_iff_mk_eq_of_rootsByKey`: let `h` be a depth-first forest of the
quiver and `h'` a depth-first forest (`pre'`, `post'`, `parent'`) of the reversed relation
`fun a b ↦ Nonempty (b ⟶ a)` with `RootsByKey post pre' parent'`, so that each new tree of the
second forest starts at an undiscovered vertex finishing latest in the first. Then for every root
`x` of the second forest and every `v`, `v` lies in the tree of `x` if and only if `mk v = mk x`.
Erickson, §6.6, "Kosaraju and Sharir's Algorithm", p. 240, states it with the first search on the
reversed graph and the second on the graph itself; the statement here is the same theorem applied to
the reversed quiver, whose strongly connected components are those of the quiver. Erickson argues
through his Lemma 6.3 and the remark that reversing a graph reverses its graph of components; the
route here is derived from 2.2 and 3.3 (Proved here).

Route. Strong induction on `pre' x` over the roots `x` of the second forest.

- (⇒) If `v` lies in the tree of `x`, 2.2 for the second forest gives a reversed path from `x` to
  `v`, that is a path `v ⇝ x`, so `mk v ≤ mk x`. Suppose `mk v < mk x`. By 3.3 there is `y` with
  `mk y = mk v` and `post x < post y`. By `RootsByKey`, `pre' x ≤ pre' y` would force
  `post y ≤ post x`; so `pre' y < pre' x`. Let `x₀` be the root ancestor of `y` in the second forest
  (L3); `pre' x₀ ≤ pre' y < pre' x` by 2.1. The induction hypothesis at `x₀` gives
  `mk x₀ = mk y = mk v` and then that `v` lies in the tree of `x₀`. So `v` has the two root
  ancestors `x` and `x₀ ≠ x`, against (L3).
- (⇐) If `mk w = mk x`, take a reversed path from `x` to `w` inside `mk x` (convexity). Each vertex
  `z` on it has `pre' z ≥ pre' x`: otherwise its root ancestor `x₀` has `pre' x₀ < pre' x`, the
  induction hypothesis at `x₀` gives `mk x₀ = mk z = mk x` and then that `x` lies in the tree of
  `x₀`, which is impossible for a root `x ≠ x₀`. Then 2.2 (⇐) for the second forest applies.

**Checks.**
- One arrow `a → b`, first forest `a = [0, 3]`, `b = [1, 2]`. The reversed relation has the arc
  `b → a`; roots by decreasing finishing time start at `a`, which reaches nothing, then `b`: trees
  `{a}` and `{b}`, the two components.
- The reversal is needed: a second forest of the same quiver with roots by decreasing finishing time
  starts at `a` and has the tree `{a, b}`, not a component.
- The direction of the priority is needed: in the reversed relation, the forest `b = [0, 3]`,
  `a = [1, 2]` (roots by increasing finishing time) has the tree `{b, a}`; it does not satisfy
  `RootsByKey post`.

*Needs:* 1.3, 2.1, 2.2, 3.3; Mathlib `Quiver.StronglyConnectedComponent.eq`.

### 3.5 Tarjan's low-link criterion

Define `lowLink r pre parent v` as the least element of the set consisting of `pre v` and the
values `pre x` over arcs `w → x` from descendants `w` of `v`: Erickson's `low(v)`, the smallest
discovery time reachable from `v` by tree edges followed by at most one further arc (§6.6,
"Tarjan's Algorithm", p. 242). Counting tree arcs as well changes nothing, since a tree arc out of a
descendant ends at a descendant, whose discovery time exceeds `pre v`. The set contains `pre v`, so
`sInf` is its least element (`Nat.sInf_mem`) and `lowLink v ≤ pre v`.

Prove `IsDFSForest.isMax_and_le_iff_lowLink`: `mk v` is a sink component and `v` is its earliest
vertex if and only if `lowLink v = pre v` and `lowLink w < pre w` for every proper descendant `w`
of `v` (Erickson, Lemma 6.4, p. 242, with proof).

Route (Erickson's argument, checked step by step).

- (⇐) *Claim 1:* every vertex reachable from `v` is a descendant of `v`. Along a path from `v`,
  an arc `w → x` from a descendant `w` has `pre v = lowLink v ≤ pre x` (`Nat.sInf_le`) and
  `pre x < post w ≤ post v` ((D6), 2.1), so `x = v` or (D3) nests `x` in `v`. *Claim 2:* every
  descendant `w` reaches `v`, by strong induction on `pre w`: for `w ≠ v`, `lowLink w < pre w`
  gives a descendant `w'` of `w` and an arc `w' → x` with `pre x < pre w`; `x` is reachable from `v`
  and so is a descendant of `v` (Claim 1), and the induction hypothesis gives `x ⇝ v`. Hence a
  component above `mk v` contains a descendant of `v`, which reaches `v`, so `mk v` is maximal;
  and every `w ∈ mk v` is a descendant, so `pre v ≤ pre w` by 2.1.
- (⇒) Every vertex reachable from `v` lies in `mk v` (maximality), hence is a descendant of `v`
  (3.2, `v` being earliest). So every value `pre x` in the set of `lowLink v` belongs to a
  descendant `x`, and `lowLink v = pre v`. For a proper descendant `w`: `w ∈ mk v`, so `w ⇝ v`. On
  this path let `x` be the first vertex that is not a descendant of `w` (`v` is not one), with
  predecessor `w'`, a descendant of `w`. Then `pre x < post w' ≤ post w` by (D6) and 2.1; if
  `pre w ≤ pre x`, (D3) would make `x` a descendant of `w`; so `pre x < pre w` and
  `lowLink w ≤ pre x < pre w`.

**Checks.**
- The cycle `a → b → c → a` searched from `a` (`a = [0, 5]`, `b = [1, 4]`, `c = [2, 3]`): all three
  low-link values are `0`; `a` satisfies the right side and is the earliest vertex of the sink
  component `{a, b, c}`.
- The sink condition cannot be dropped. One arc `b → a` with `a = [0, 1]`, `b = [2, 3]`: `b` is the
  earliest (only) vertex of its component, but `lowLink b = 0 < 2`; its component reaches `{a}` and
  is not a sink. Here `lowLink a = 0 = pre a` and `{a}` is a sink.

*Needs:* 2.1, 2.2, 3.2; Mathlib `Nat.sInf_mem`, `Nat.sInf_le`.

### Examples

- Erickson's Figures 6.13 and 6.14 (pp. 238–239) show the components of a graph as subtrees of a
  depth-first forest.

### Dependencies

Layer 3 depends on Layers 1 and 2. 3.4 needs 3.3, which needs 3.2; 3.5 needs 3.2.

## Layer 4: undirected search, cut vertices and bridges

Throughout, `G` is a simple graph and `h : IsDFSForest G.Adj pre post parent`.

### 4.1 Depth-first forests of graphs are normal

Prove `IsDFSForest.isAncestor_or_isAncestor_of_adj`: if `G.Adj u v`, then `u` is an ancestor of
`v` or `v` is an ancestor of `u`. In Diestel's language the tree is normal: adjacent vertices are
comparable in the tree order (Diestel, §1.5, the definition of a normal tree, p. 15; normal
spanning trees are called depth-first search trees after Lemma 1.5.4, p. 16; that search produces
them is Diestel's Exercise 29, p. 32).

Route. By 2.3 the only other case is `post v < pre u`; but `G.Adj v u` and (D6) give
`pre u < post v`.

**Checks.**
- The triangle `a, b, c` searched from `a` (`a = [0, 5]`, `b = [1, 4]`, `c = [2, 3]`): the edge
  `a – c` joins `c` to its ancestor `a`; no cross edges occur.
- For directed relations the statement fails: two arcs `a → b`, `a → c`, both children of `a`, and
  an arc `c → b` (with `b = [1, 2]`, `c = [3, 4]`) is a cross arc.

*Needs:* 2.3.

### 4.2 Spanning trees

Prove `IsDFSForest.isTree_fromRel`: if `G` is connected, the graph whose edges are the pairs
`{a, b}` with `parent b = some a` (`SimpleGraph.fromRel`) is a tree. With 4.1 and 1.4 this gives,
for finite connected graphs, a normal spanning tree (Diestel, Proposition 1.5.5, p. 16, proves
existence for all connected graphs by another route). (Proved here.)

Route. Common facts used here and below: (F1) the descendants of a root form a connected
component of `G`: tree edges join them ((D5)), and by 4.1 a neighbour of a descendant `w` is a
descendant of `w` or an ancestor of `w`, and the ancestors of `w` are descendants of the root
(L3). For 4.2: `V` is nonempty, and by (F1) and connectivity every vertex is a descendant of one
root, so there is exactly one root (a second root would be a proper descendant of the first and
have a parent). The tree graph is connected by the parent chains to the root. It has no cycle: on
a cycle, the vertex `z` of largest `pre` has two distinct neighbours on it; each is `parent z` or
a child of `z`, and a child has larger `pre`; so both are `parent z`, a contradiction.

**Checks.**
- The path `a – b – c` searched from `b` first: `b = [0, 5]` with children `a` and `c`; the tree
  edges are `a – b` and `b – c`.
- Connectivity is needed: two vertices without edges carry a forest with two roots, and its tree
  graph has no edge, so it is not connected.

*Needs:* 1.2, 4.1; Mathlib `SimpleGraph.fromRel`, `SimpleGraph.IsTree`.

### 4.3 Low points

Define `lowPoint G pre parent v` as the least element of the set consisting of `pre v` and the
values `pre x` over edges `w – x` with `w` a descendant of `v` and `parent w ≠ some x`. The edge
from a vertex to its own parent, a tree edge, is not counted; every other edge at a descendant is.
As for `lowLink`, `sInf` is the least element and `lowPoint v ≤ pre v`.

The route lemmas of 4.4–4.6, for a child `v` of `u`:

- (F2) If `v ≠ v'` are children of one vertex, no vertex of `sub(v)` is comparable with one of
  `sub(v')`, so no edge joins `sub(v)` and `sub(v')` (4.1). Indeed `v` is not an ancestor of `v'`:
  its discovery time exceeds that of the parent of `v'`, the innermost interval containing `v'`.
- (F3) An edge from `w ∈ sub(v)` to `x ∉ sub(v)` ends at a proper ancestor of `v` (4.1, (L3)).
- (F4) `pre u ≤ lowPoint v` if and only if no edge joins `sub(v)` to a proper ancestor of `u`. An
  edge `w – x` with `w ∈ sub(v)` and `x` a proper ancestor of `u` is counted (`parent w` lies in
  `sub(v) ∪ {u}`, and `x` does not), and `pre x < pre u`. Conversely, a counted edge with
  `pre x < pre u` has `x` an ancestor of `w` (4.1; a descendant would have `pre x ≥ pre v`), hence
  `x ∉ sub(v)`, so `x` is a proper ancestor of `v` (F3) other than `u`, hence of `u` (L3).
- (F5) `lowPoint v = pre v` if and only if `u – v` is the only edge between `sub(v)` and its
  complement. An edge `w – x` other than `u – v` with `w ∈ sub(v)`, `x ∉ sub(v)` is counted (for
  `w = v`, `parent v = some u` and `x ≠ u`; for `w ≠ v`, `parent w ∈ sub(v)`), and `x` is a proper
  ancestor of `v` (F3), so `pre x < pre v`. Conversely a counted value `pre x < pre v` comes from an
  edge `w – x` leaving `sub(v)` that is not `v – u`, since that edge has `parent v = some u`.

By (F4) and (F5), `pre u < lowPoint v` holds exactly when `lowPoint v = pre v`.

**Checks.**
- One edge `a – b` searched from `a` (`a = [0, 3]`, `b = [1, 2]`): `lowPoint b = 1 = pre b`, while
  `lowLink` of the symmetric relation gives `lowLink b = 0`, because the edge `b – a` back to the
  parent counts there. The edge is a bridge, so 4.6 would fail with `lowLink`.
- The triangle searched from `a`: `lowPoint b = lowPoint c = 0`.

### 4.4 Roots

Prove `IsDFSForest.isCutVertex_iff_of_parent_eq_none`: a root `u` is a cut vertex if and only if
it has at least two distinct children. (Proved here; the low-point criteria of 4.4–4.6 are due to
Hopcroft and Tarjan. The nearest opened statement is Diestel, Lemma 1.5.4 (i), p. 15, with proof on
p. 16: in a normal tree, incomparable vertices are separated by the common part of their
down-closures.)

Route. Use Tau Ceti's `SimpleGraph.isCutVertex_iff_exists_forall_walk_mem_support`. (⇐) For
children `v ≠ w` of `u`: `v` and `w` are joined through `u` by tree edges; `w ∉ sub(v)` (F2); a
walk from `v` leaves `sub(v)` along an edge to a proper ancestor of `v` (F3), and the only one is
`u`, which as a root has no proper ancestor; so every walk from `v` to `w` passes through `u`.
(⇒) Suppose `u` has at most one child `c`. Two vertices `a, b ≠ u` joined by a walk: if neither
lies in `sub(u)`, the walk avoids `sub(u)`, which is a component by (F1); otherwise both lie in
`sub(u) ∖ {u} = sub(c)`, and the tree paths from `c` down to `a` and to `b` avoid `u`. So `u` is
not a cut vertex.

**Checks.**
- The path `a – b – c` searched from `b` first: the root `b` has the two children `a`, `c` and is
  a cut vertex. Searched from `a`: the root `a` has one child and is not a cut vertex.
- The hypothesis `parent u = none` is needed: in the path `a – b – c` searched from `a`, `b` has
  one child and is a cut vertex.

*Needs:* 4.1, 4.2 (the fact (F1)), 4.3 (the facts (F2), (F3)); Tau Ceti `SimpleGraph.IsCutVertex`,
`SimpleGraph.isCutVertex_iff_exists_forall_walk_mem_support`.

### 4.5 Vertices with a parent

Prove `IsDFSForest.isCutVertex_iff_of_parent_eq_some`: if `parent u = some p`, then `u` is a cut
vertex if and only if some child `v` of `u` has `pre u ≤ lowPoint v`. (Proved here.)

Route. (⇐) Let `v` be such a child. `v` and `p` are joined through `u`, and `p ∉ sub(v)`. A walk
from `v` leaves `sub(v)` along an edge to a proper ancestor of `v` (F3); by (F4) it is not a proper
ancestor of `u`, so it is `u` (L3). (⇒) Suppose every child `v` of `u` has an edge from `sub(v)` to
a proper ancestor of `u` (F4). Let `ρ` be the root ancestor of `u`. Vertices outside `sub(ρ)` are
joined among themselves by walks avoiding `sub(ρ)`, a component (F1). In `sub(ρ) ∖ {u}`: every
vertex `z ∉ sub(u)` is joined to `ρ` by its parent chain, which avoids `u` because `u` is not an
ancestor of `z`; every `sub(v)` is connected by tree edges and has an edge to a proper ancestor of
`u`, which lies in `sub(ρ) ∖ sub(u)`. So any two vertices other than `u` that are joined by a walk
are joined by one avoiding `u`.

**Checks.**
- The path `a – b – c` searched from `a`: `lowPoint c = 2 ≥ 1 = pre b`, and `b` is a cut vertex.
- The triangle searched from `a`: `b` has the child `c` with `lowPoint c = 0 < 1 = pre b`; no
  vertex is a cut vertex.
- The criterion fails at a root: one edge `a – b` searched from `a` has `pre a ≤ lowPoint b`, but
  `a` is not a cut vertex. So 4.4 and 4.5 are separate statements.

*Needs:* 4.1, 4.2, 4.3; Tau Ceti `SimpleGraph.IsCutVertex`,
`SimpleGraph.isCutVertex_iff_exists_forall_walk_mem_support`.

### 4.6 Bridges

Prove `IsDFSForest.isBridge_iff`: if `parent v = some u`, the edge `s(u, v)` is a bridge if and only
if `lowPoint v = pre v`. (Proved here.)

Route. By `SimpleGraph.isBridge_iff` the edge is a bridge exactly when `v` is not reachable from
`u` after deleting it. (⇐) By (F5) the only edge leaving `sub(v)` is `u – v`; after deleting it,
every walk from `v` stays in `sub(v)`, and `u ∉ sub(v)`. (⇒) Otherwise (F5) gives an edge `w – x`
other than `u – v` with `w ∈ sub(v)` and `x` a proper ancestor of `v`, so `x = u` or `x` is a
proper ancestor of `u` (L3). The tree path from `v` down to `w`, the edge `w – x`, and the tree
path from `x` down to `u` (through ancestors of `u`, none of them `v`) join `v` to `u` without the
edge `u – v`.

Every edge that is not a tree edge lies on the cycle it closes with the tree path between its ends
(4.1), so it is not a bridge (`SimpleGraph.isBridge_iff_forall_cycle_notMem`); this remark is not a
target.

**Checks.**
- One edge `a – b`: `lowPoint b = pre b` and the edge is a bridge. In the triangle no edge is a
  bridge and `lowPoint b = lowPoint c = 0`.
- The path `a – b – c` from `a`: `lowPoint b = 1 = pre b` and `lowPoint c = 2 = pre c`; both edges
  are bridges.

*Needs:* 4.1, 4.3; Mathlib `SimpleGraph.IsBridge`, `SimpleGraph.isBridge_iff`,
`SimpleGraph.deleteEdges`.

### Examples

- Diestel's Figure 1.5.2 (p. 15) draws a normal spanning tree.

### Dependencies

Layer 4 depends on Layers 1 and 2 (through 2.1 and 2.3). Within the layer, 4.4 and 4.5 need 4.1,
4.2 and 4.3, and 4.6 needs 4.1 and 4.3.

## Layer 5: breadth-first layers

### 5.1 Bipartiteness by distance layers

The layers of breadth-first search from `s` in a connected graph are the classes `G.dist s · = k`;
that an edge joins equal or consecutive layers is Mathlib's `SimpleGraph.Adj.diff_dist_adj`.

Prove `isBipartite_iff_forall_adj_dist_ne`: if `G` is connected, then for every vertex `s`, `G` is
bipartite (`SimpleGraph.IsBipartite`, two-colourable) if and only if no edge joins two vertices at
the same distance from `s`. (Proved here; Diestel, Proposition 1.6.1, p. 17, bipartite if and only
if no odd cycle, is the nearest opened statement.)

Route. (⇒) By `SimpleGraph.two_colorable_iff_forall_loop_even` every closed walk has even length. An
edge `u – v` with `G.dist s u = G.dist s v = k` gives walks of length `k` from `s` to `u` and to `v`
(`SimpleGraph.Reachable.exists_walk_length_eq_dist`, using connectivity), and the closed walk from
`s` to `u`, across the edge, and back from `v` to `s` (`SimpleGraph.Walk.append`,
`SimpleGraph.Walk.reverse`) has odd length `2k + 1`. (⇐) Colour `v` by `G.dist s v` modulo `2`. For
an edge `u – v` the distances are unequal and differ by at most one
(`SimpleGraph.Adj.diff_dist_adj`), so their parities differ, and the colouring is proper
(`SimpleGraph.Coloring.colorable`). Connectivity is used in (⇒) only; the second Check shows that
(⇒) needs it.

**Checks.**
- The 4-cycle `0 – 1 – 2 – 3 – 0` from `0`: distances `0, 1, 2, 1`; no edge inside a layer, and it
  is bipartite. The triangle from `0`: distances `0, 1, 1`, the edge `1 – 2` lies inside a layer,
  and it is not bipartite.
- Connectivity is needed for (⇒): a single edge `x – y` together with an isolated vertex `s` is
  bipartite, but `G.dist s x = G.dist s y = 0` (the value of `dist` between components).

*Needs:* Mathlib `SimpleGraph.dist`, `SimpleGraph.Adj.diff_dist_adj`,
`SimpleGraph.two_colorable_iff_forall_loop_even`,
`SimpleGraph.Reachable.exists_walk_length_eq_dist`, `SimpleGraph.Coloring.colorable`.

### Examples

- Every connected labelled graph on at most six vertices, with every choice of `s`, satisfies 5.1;
  for `n = 6` these are 160224 pairs, 142038 of them non-bipartite.

### Dependencies

Layer 5 depends on no other layer.

## Scope and ownership

This roadmap owns the depth-first forest axioms and the theorems stated above about them: existence
with a root priority, the parenthesis and white-path theorems, the classes of arcs, acyclicity by
finishing times, components as subtrees, the order of finishing times on components, the
Kosaraju–Sharir and Tarjan criteria, normality and spanning trees for graphs, the low-point
criteria for cut vertices and bridges, and the bipartiteness criterion by distance layers.

Already in the libraries, and cited, not restated:

- Strongly connected components and their reachability order: Mathlib
  `Quiver.StronglyConnectedComponent`, Tau Ceti `Quiver.StronglyConnectedComponent.instPartialOrder`
  and `Quiver.StronglyConnectedComponent.mk_le_mk`. 3.3 and 3.4 do not define the order; they say
  that the finishing times of every depth-first forest realize it.
- Acyclic quivers and their topological orders: Tau Ceti `TauCeti.Quiver.IsAcyclic` and
  `TauCeti.Quiver.IsAcyclic.exists_pairwise_isEmpty_hom`. 3.1 gives a criterion by finishing times
  and does not restate the existence of an order.
- Cut vertices of simple graphs: Tau Ceti `SimpleGraph.IsCutVertex`; bridges: Mathlib
  `SimpleGraph.IsBridge`. Existence of spanning trees of connected graphs: Mathlib
  `SimpleGraph.Connected.exists_isTree_le`; 4.2 is the different statement that the tree edges of
  every depth-first forest of a connected graph form one.
- That an edge joins equal or consecutive distance layers (Mathlib `SimpleGraph.Adj.diff_dist_adj`)
  and that two-colourability means no odd closed walk (Mathlib
  `SimpleGraph.two_colorable_iff_forall_loop_even`).

Left to other roadmaps:

- GraphConnectivityAndFlows, Layer 2 (bridges, bonds, cut vertices and blocks: 2.1 bridges, 2.2 cut
  vertices, 2.3 blocks, 2.4 the block–cut forest), owns the structure theory of cut vertices,
  bridges and blocks; 4.4–4.6 above characterize cut vertices and bridges through a depth-first
  forest and use only the library predicates. Blocks and biconnected components obtained from low
  points are not treated here. Its Layer 7 (ear decompositions, Robbins' theorem and
  `st`-numberings, 7.1–7.4) owns those objects; their construction from a depth-first forest is not
  treated here. Its scope places algorithms computing strongly connected components outside; the
  theorems of Layer 3 above are statements about forests, not algorithms.
- SpanningTreesAndShortestPaths, Layer 3 (shortest walks and potentials), owns walk weights and
  distances as a relation (3.1) and shortest-path trees of weighted arrow families (3.6). 5.1 above
  is about the parity of the hop distance of a simple graph, which is Mathlib's `SimpleGraph.dist`;
  this roadmap does not depend on that one.

Not treated here: breadth-first search trees as structures, directed breadth-first layers,
dominator trees, the characterization of depth-first vertex orderings by a three-point condition,
and every running time, data structure and search procedure. The comparison of the six axioms with
the outputs of depth-first search is recorded only as the finite computation in 1.2; no such
statement is made, because no search procedure is defined.

## Exact supplier contracts

### From Mathlib

- `Relation.ReflTransGen` (`Mathlib/Logic/Relation.lean`): the reflexive-transitive closure, used in
  `IsAncestor` and in 2.2.
- `Finset.exists_max_image`: a nonempty finite set has an element of largest image (1.4).
- `Nat.sInf_mem`, `Nat.sInf_le`: the infimum of a nonempty set of naturals belongs to it and is
  below each of its elements (3.5, 4.3).
- `Quiver.StronglyConnectedComponent`, `Quiver.StronglyConnectedComponent.mk` and
  `Quiver.StronglyConnectedComponent.eq` (`Mathlib/Combinatorics/Quiver/ConnectedComponent.lean`):
  `mk a = mk b` iff there are paths from `a` to `b` and from `b` to `a`.
- `Quiver.Path`, `Quiver.Hom.toPath`, `Quiver.Path.comp`, `Quiver.Path.length_toPath`,
  `Quiver.Path.length_comp` (`Mathlib/Combinatorics/Quiver/Path.lean`): paths, the path of one
  arrow (length one) and composition (lengths add) (3.1).
- `SimpleGraph.IsBridge`, `SimpleGraph.isBridge_iff` (for all `u v`, `G.IsBridge s(u, v)` iff `v` is
  not reachable from `u` in `G.deleteEdges {s(u, v)}`),
  `SimpleGraph.isBridge_iff_forall_cycle_notMem` (for an edge), `SimpleGraph.deleteEdges` (the first
  three in `Mathlib/Combinatorics/SimpleGraph/Connectivity/Connected.lean`).
- `SimpleGraph.fromRel` (adjacency `v ≠ w` and `r v w ∨ r w v`), `SimpleGraph.IsTree` (connected
  and acyclic), `SimpleGraph.Connected.exists_isTree_le` (cited in the scope only)
  (`Mathlib/Combinatorics/SimpleGraph/Acyclic.lean` for the last two).
- `SimpleGraph.dist`, `SimpleGraph.Adj.diff_dist_adj`,
  `SimpleGraph.Reachable.exists_walk_length_eq_dist`
  (`Mathlib/Combinatorics/SimpleGraph/Metric.lean`), `SimpleGraph.Walk.append`,
  `SimpleGraph.Walk.reverse`.
- `SimpleGraph.IsBipartite` (an abbreviation of `G.Colorable 2`,
  `Mathlib/Combinatorics/SimpleGraph/Bipartite.lean`),
  `SimpleGraph.two_colorable_iff_forall_loop_even`
  (`Mathlib/Combinatorics/SimpleGraph/Coloring/Constructions.lean`),
  `SimpleGraph.Coloring.colorable`.

### From Tau Ceti

- `Quiver.StronglyConnectedComponent.instPartialOrder`, `Quiver.StronglyConnectedComponent.mk_le_mk`
  (`mk a ≤ mk b` iff a path from `a` to `b`), `Quiver.StronglyConnectedComponent.mk_surjective`
  (`TauCeti/Combinatorics/Quiver/StronglyConnectedComponent.lean`).
- `Quiver.reachable_iff_reflTransGen`: reachability is the reflexive-transitive closure of "some
  arrow" (`TauCeti/Combinatorics/Quiver/Reachable.lean`).
- `TauCeti.Quiver.IsAcyclic`, `TauCeti.Quiver.isAcyclic_def` (every closed path is
  `Quiver.Path.nil`) (`TauCeti/RepresentationTheory/Quiver/Acyclic/Basic.lean`);
  `TauCeti.Quiver.IsAcyclic.exists_pairwise_isEmpty_hom`
  (`TauCeti/RepresentationTheory/Quiver/Acyclic/TopologicalSort.lean`), cited in 3.1's remark.
- `SimpleGraph.IsCutVertex`, `SimpleGraph.isCutVertex_iff_exists_forall_walk_mem_support` (`v` is a
  cut vertex iff some `u, w ≠ v` are reachable and every walk from `u` to `w` passes through `v`)
  (`TauCeti/Combinatorics/SimpleGraph/Connectivity/CutVertex.lean`).

## References

- Jeff Erickson, *Algorithms*, first edition (2019), Chapter 6, "Depth-First Search", author's site
  `https://jeffe.cs.illinois.edu/teaching/algorithms/book/06-dfs.pdf` (Creative Commons
  Attribution 4.0). Used: §6.1 with Figure 6.3 (p. 228), "Classifying Vertices and Edges"
  (pp. 228–229), Figures 6.4 and 6.5 (pp. 229–230), Lemma 6.1 (p. 230); §6.2 (p. 231); §6.3
  (p. 232); §6.6, Lemma 6.2 (p. 238), the root of a component (p. 239), "Kosaraju and Sharir's
  Algorithm" with Lemma 6.3 (p. 240), "Tarjan's Algorithm" with Lemma 6.4 (p. 242).
- Reinhard Diestel, *Graph Theory*, sixth edition (2025), Chapter 1, in the free preview linked
  from the author's book site `https://diestel-graph-theory.com/basic.html`. Used: §1.5,
  normal trees (p. 15), Lemma 1.5.4 (pp. 15–16), Proposition 1.5.5 (p. 16), Exercise 29 (p. 32);
  §1.6, Proposition 1.6.1 (p. 17).
