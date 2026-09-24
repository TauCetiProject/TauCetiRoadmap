# Finite graph connectivity and network flows

This roadmap develops finite graph connectivity and network flows through two complementary theories: the structure of connected graphs, and the duality between disjoint paths and separating cuts.
The main results are Menger's theorem, the block–cut forest, ear decompositions, Robbins' strong orientation theorem, max-flow/min-cut with integrality, Hoffman's circulation theorem, and Gomory–Hu cut trees.
Applications include multiset capacitated Kőnig and Hall theorems, bipartite edge-colouring, and prescribed and bounded indegree orientations.
The supporting library develops reusable APIs for separators, path families, orientations, residual networks, flow decomposition, and minimum-cut structure, with transport between graph representations.

The undirected theory uses Mathlib's `Graph`, retaining loops and parallel edges, with corollaries in `SimpleGraph`; vertex connectivity is that of the underlying simple graph, and the directed-network and cut-function theories are independent of this choice.
Walk, isomorphism, deletion, bridge, and block foundations assume no finiteness; extremal and decomposition targets require finitely many actual vertices, with edge-finiteness hypotheses stated per target.

**Suggested homes:** `TauCeti/Combinatorics/Graph/Connectivity/` for multigraph connectivity, `TauCeti/Combinatorics/SimpleGraph/Connectivity/` for simple-graph interfaces, `TauCeti/Combinatorics/Network/` for directed networks and flows, and adjacent modules for bipartite matching, edge-colouring, orientations, and the representation bridges.

[`Suggested.lean`](Suggested.lean) provides suggested signatures, never an exhaustive checklist; this document is the specification.

## Milestones at a glance

| Milestone | Main results | Depends on |
| --- | --- | --- |
| 1. Shared foundations | Walks and representation bridges (1.1), cuts and path families (1.2), excess calculus and residual updates (1.3), splitting and auxiliary terminals (1.4), deletion predicates and invariants (1.5) | Existing Mathlib and Tau Ceti APIs |
| 2. Bridges and blocks | Multigraph bridges; cut-vertex criteria and block–cut forest | 1 |
| 3. Flows | Decomposition, augmentation, max-flow/min-cut, integrality, and termination (3.1), large capacities (3.2), terminal sets and undirected networks (3.3), real-valued corollaries (3.4), mixed vertex and arrow capacities (3.5) | 1 |
| 4. Minimum cuts | Terminal-set cut lattices (4.1), canonical cuts (4.2), and non-crossing lemmas (4.3) | 1 for 4.1 and 4.3; 1, 3 for 4.2 |
| 5. Menger | Path–separator duality (5.1) and the reductions to max-flow (5.2) | 1, 3, 4 |
| 6. Connectivity and matching consequences | Whitney inequalities and cycle criteria, preservation lemmas, fans, Dirac's cycle theorem, multiset capacitated Kőnig and Hall, regular bipartite decomposition and edge-colouring | 2, 5 |
| 7. Ears and orientations | Undirected and directed ear decompositions; Robbins' theorem | 2, 6 |
| 8. Circulations and bounded flows | Hoffman and infeasibility certificates, exact and interval excess, assignment shifts, residual adjustments, extremal terminal values, integrality, rounding, and prescribed and bounded indegree orientations (8.8) | 3, 4 |
| 9. Cut trees | Gomory–Hu and recovery of minimum cuts; edge-connectivity queries | 4.1, 4.3 for cut trees; 5 for edge-connectivity queries |

Each milestone supplies the **common basic API** needed to use its definitions: constructors, extensionality where appropriate, membership and support lemmas, monotonicity, restriction, and invariance under isomorphism.
The targets specify additional API and required proved examples.
**Why:** explains a design choice; **Suggested proof:** gives nonbinding proof guidance, set as a block quote when longer than one sentence.
Neither adds requirements.

## Existing vocabulary and related work

Use Mathlib's `Graph` incidence, subgraph, induced-subgraph, and deletion APIs for multigraphs.
Reuse `SimpleGraph` APIs for the underlying simple graph and for simple-graph corollaries: walks and paths, reachability, connected components, cycles, trees, degree, bipartite graphs, and matchings.
In particular, reuse [`SimpleGraph.IsEdgeConnected`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Combinatorics/SimpleGraph/Connectivity/EdgeConnectivity.html#SimpleGraph.IsEdgeConnected), [`SimpleGraph.IsBridge`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Combinatorics/SimpleGraph/Connectivity/Connected.html#SimpleGraph.IsBridge) with its cycle characterization `isBridge_iff_forall_cycle_notMem`, and [`SimpleGraph.minDegree`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Combinatorics/SimpleGraph/Finite.html#SimpleGraph.minDegree).
Mathlib also supplies the [`Graph`–`SimpleGraph` conversions](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Combinatorics/Graph/Simple.html), [graph versions of Hall's theorem](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Combinatorics/SimpleGraph/Hall.html), and the [finite-family Hall theorem](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Combinatorics/Hall/Finite.html).
Reuse Tau Ceti's [`DoubledQuiver`](https://github.com/TauCetiProject/TauCeti/blob/main/TauCeti/RepresentationTheory/Quiver/Zigzag/Basic.lean), [`DoubledQuiver.Orientation` and `OrientedQuiver`](https://github.com/TauCetiProject/TauCeti/blob/main/TauCeti/RepresentationTheory/Quiver/Zigzag/Orientation.lean), supplied by [ZigzagPreprojective, Layer 0](../ZigzagPreprojective/README.md#layer-0-affine-simply-laced-diagrams-doubled-graphs-relation-quotients-and-grading-descent).
That roadmap owns the doubled-quiver and orientation constructions and their algebraic applications; this roadmap extends their connectivity and network API, importing the existing modules in its prototypes.
Exposing their arrow families as explicit quiver arguments is an adapter, not a second orientation type.
Also reuse the following Tau Ceti modules:

- [`Combinatorics.Quiver.BoundedPaths`](https://github.com/TauCetiProject/TauCeti/blob/main/TauCeti/Combinatorics/Quiver/BoundedPaths.lean) for finiteness of paths of bounded length, hence of simple paths in a finite quiver.
- [`Combinatorics.Quiver.Prefunctor`](https://github.com/TauCetiProject/TauCeti/blob/main/TauCeti/Combinatorics/Quiver/Prefunctor.lean) for length preservation under path transport and inverse-prefunctor identities.
- [`Combinatorics.Quiver.Reorient`](https://github.com/TauCetiProject/TauCeti/blob/main/TauCeti/Combinatorics/Quiver/Reorient.lean) for reversing selected arrows while retaining their identities.
  Expose its arrow families through the explicit-quiver interface and extend it with bound and assignment transport.

The following Mathlib proposals and their review discussions are references for interface design and coordination.
Each entry identifies the part relevant to this roadmap; the conventions and targets below specify the required interfaces and their mathematical scope.

- [#33355: vertex connectivity](https://github.com/leanprover-community/mathlib4/pull/33355): deletion-based `IsVertexReachable`, `IsVertexPreconnected`, and `IsVertexConnected`.
- [#42494: numerical edge connectivity](https://github.com/leanprover-community/mathlib4/pull/42494): `edgeReachability`, `edgeConnectivity`, their supremum definitions, and degree bounds.
- [#36756: shared walks](https://github.com/leanprover-community/mathlib4/pull/36756) and [#39053: the `Graph` instance](https://github.com/leanprover-community/mathlib4/pull/39053): `GraphLike.Walk` with vertex support and darts, following the [HasAdj discussion](https://leanprover.zulipchat.com/#narrow/channel/252551-graph-theory/topic/HasAdj/with/575843445).
  This roadmap uses edge-labelled inductive walks with the API of `SimpleGraph.Walk` and the representation bridges of Target 1.1.
  The [dart construction in #39053](https://github.com/leanprover-community/mathlib4/blob/455aa1d6e5c7215f1270da70e328056af9607545/Mathlib/Combinatorics/Graph/GraphLike.lean#L22) distinguishes two directions of a loop, whereas this roadmap records a single traversal.
  A map forgetting those directions identifies distinct walks: a graph with one vertex and one loop has two length-one walks in that construction and one here.
  The general `GraphLike` hierarchy is outside this roadmap's scope.
- [#43017: network flows](https://github.com/leanprover-community/mathlib4/pull/43017): quivers with capacities and flow assignments indexed by arrows.
  Arrow indexing retains parallel edges; this roadmap develops finite sums over general coefficients, with the real-valued specialization in Target 3.4.
- [#34028: weak max-flow/min-cut duality](https://github.com/leanprover-community/mathlib4/pull/34028): an undirected flow formulation on simple graphs.
  Undirected flow applications use the bidirected network, with no separate undirected flow type, so this roadmap takes only the statement shapes from that proposal.
- [#33032: Kőnig's theorem](https://github.com/leanprover-community/mathlib4/pull/33032): matchings as subgraphs, vertex covers, and the equality between the sizes of maximum matchings and minimum covers.
- [#33313: edge colourings](https://github.com/leanprover-community/mathlib4/pull/33313): `SimpleGraph.EdgeColoring`, `EdgeColorable`, and `chromaticIndex`, using colourings of the line graph; Target 6.9 supplies the bipartite theorem and transport from multigraph edge identities.
  See also the related [#43128](https://github.com/leanprover-community/mathlib4/pull/43128).
  The [edge-colouring discussion](https://leanprover-community.github.io/archive/stream/252551-graph-theory/topic/edge.20coloring.html) also records earlier work; follow the porting policy before reusing it.
- [#42839: 2-edge-connectivity and bridges](https://github.com/leanprover-community/mathlib4/pull/42839): `G.IsEdgeConnected 2 ↔ ∀ e, ¬ G.IsBridge e`, the simple-graph specialization in Milestone 7.
- [#37861: connected `Graph`s](https://github.com/leanprover-community/mathlib4/pull/37861): connectivity of Mathlib's multigraph type through connected components as subgraphs, defined without walks; Milestone 1 proves agreement with walk reachability.
- [#38337: unions of `Graph`s](https://github.com/leanprover-community/mathlib4/pull/38337): compatible unions, used when adding ears.
  Target 1.1 requires the least-upper-bound interface for compatible graphs; the proposal's choice of incidence for conflicting edge identities is outside scope.

Build all missing prerequisites and results in Tau Ceti, using Mathlib's existing vocabulary and the interfaces specified here.
Read proposals together with their design discussions; a citation alone does not make every declaration or representation choice in a branch a requirement.
Adopt Mathlib's resulting APIs and refactor the affected interfaces and proofs when they land, preserving the mathematical statements of the targets.
An unmerged proposal is not a dependency that contributors must wait for.

The [Lean Zulip discussion of max-flow/min-cut](https://leanprover-community.github.io/archive/stream/252551-graph-theory/topic/max-flow.20min-cut.20help.html) records earlier quiver-based formalization work, including [maxflowmincutlean4](https://gitlab.com/Shreyas941/maxflowmincutlean4).
This implementation is a reference, not a dependency.
Coordinate with authors before integrating existing code, following the repository's porting policy.

## Conventions

### Assumptions at a glance

The table summarizes the hypotheses of the milestones; the targets are the normative statements, and the conventions below give the details.

| Targets | Vertices | Edges or arrows | Coefficients | Terminals |
| --- | --- | --- | --- | --- |
| Walks, isomorphisms, bridges, cuts, separators, path families, deletion predicates, blocks (1.1, structural part of 1.2, 1.5, 2) | none | none | none | none |
| Multigraph vertex-only targets: vertex connectivity, nonadjacent local vertex Menger, vertex-capacitated Menger, set-to-set vertex Menger, vertex consequences of Milestone 6, component counts of Milestone 2 | finite `V(G)` | none | none | distinct terminals, nonadjacent for local vertex Menger; `A, B` may overlap |
| Multigraph edge targets: edge connectivity, edge Menger, weighted cuts, ears, Robbins (1.2, 1.5, 5, 7) | finite `V(G)` | finite `E(G)` | cancellative monoid for weights | distinct terminals; disjoint `A, B` for edge versions |
| Directed vertex-only targets: vertex strong connectivity, directed local, vertex-capacitated, and set-to-set vertex Menger (5, 6) | `[Fintype V]` | none | none | no arrow `s → t` for local vertex Menger |
| Adjacent-terminal vertex Menger (5.1) | finite actual vertices | only the direct terminal edges or arrows must be finite | none | distinct `s, t`; only arrows `s → t` counted in the directed case |
| Bipartite matching, edge-colouring, indegree orientations (6.7–6.9, 8.8) | finite `V(G)` | finite `E(G)` | natural capacities and indegrees | bipartition for matching and colouring; loops allowed for orientations |
| Directed flows, arc connectivity, Menger reductions, bipartite network (3, 5.2, 6, 7) | `[Fintype V]` | `[∀ v w, Fintype (N.Hom v w)]` | linearly ordered additive group; `ℤ` for the reductions | distinct `s, t`; `A, B` possibly empty, disjoint for edge versions and terminal-set flows, overlapping allowed for vertex versions |
| Submodularity and its closure lemmas (4.1) | none | none | addition and order for the definition; stronger assumptions per lemma | none |
| Minimum cuts and cut trees (4.1, 4.3, 9) | `[Fintype V]`, nonempty for cut trees | none | linearly ordered cancellative additive monoid | disjoint `A, B`, possibly empty; distinct `s, t` |
| Residual canonical cuts, bounded circulations, rounding (4.2, 8.1–8.7) | `[Fintype V]` | finite arrow types | linearly ordered additive group with finite signed bounds; `FloorRing` for Target 8.7 | distinct `s, t` |

### Graphs, networks, and orientations

**Undirected graphs** use `G : Graph α β`, with actual vertices `V(G) ⊆ α` and edges `E(G) ⊆ β`.
Vertex and edge finiteness are independent hypotheses on these subtypes, not the ambient types; use subtype `Fintype` instances for finite sums.
A **finite graph** has finite `V(G)` and finite `E(G)`.
The foundations concerning walks, deletion, membership, and transport use no finiteness unless their statements count or sum over a set.
Walk endpoints and separators belong to `V(G)`; deleting edges counts identities in `E(G)`, including separate parallel edges.
Loops are allowed.
Use `G.toSimpleGraph : SimpleGraph V(G)` for properties insensitive to loops and parallel edges, and `Graph.ofSimpleGraph` to state and prove the simple-graph corollaries.
Simple-graph statements carry decidability instances exactly where the Mathlib definitions they mention require them; proofs may reason classically.

A weighted multigraph is `G` together with nonnegative capacities `c : E(G) → K`; zero capacities retain the edge in the graph.
Its cut capacity sums over actual crossing edges, once per edge, so parallel capacities add and loops contribute zero.
For the pair-capacity interface, a nonnegative `c : Sym2 V → K` has simple support graph with adjacency `v ≠ w ∧ 0 < c(s(v,w))`.
Diagonal capacities are allowed and ignored by both the support graph and cuts.
Aggregate a weighted multigraph to pair capacities on `Sym2 V(G)` by summing capacities of all edges joining each pair of distinct vertices and setting diagonal values to zero.
This aggregation preserves weighted cuts, not individual edge identities or unweighted edge-disjoint paths.

**Directed networks** are terms, not typeclass instances.

- **Coefficients.** The finite-bound theory is parameterized by a linearly ordered additive commutative group `K`, expressed by `[AddCommGroup K] [LinearOrder K] [IsOrderedAddMonoid K]`.
  It must not assume a unit, multiplication, division, an Archimedean property, topology, or order completeness; in particular, the same theory applies to `ℤ`, `ℚ`, and `ℝ`.
  The minimum-cut theory of Targets 4.1 and 4.3 and Milestone 9 never subtracts and is stated over a linearly ordered cancellative additive commutative monoid, `[AddCommMonoid K] [LinearOrder K] [IsOrderedCancelAddMonoid K]`, so that `ℕ` and `ℝ≥0` are instances alongside these groups; Target 4.2 uses the group.
  The definition and elementary closure lemmas for submodularity use the weaker assumptions specified in Target 4.1.
- **Carrier.** A network `N : Network K V` carries an arrow type `N.Hom v w` for every ordered pair of vertices, in a universe independent of the vertex universe, as for `Quiver.{v}`.
  Each arrow has lower and upper bounds `ℓ, u` in `K`, with a proof of `ℓ ≤ u`; bounds may be negative, and all bounds are finite.
  Parallel arrows, arrows in opposite directions, loops, and zero capacities are allowed; the total arrow type is the dependent sum of the arrow types over ordered pairs of vertices.
  The carrier and bound-order invariant need no finiteness; targets requiring finite vertices or arrows use `[Fintype V]` or `[∀ v w, Fintype (N.Hom v w)]`, respectively.
  An ordinary network is the specialization `ℓ = 0` of this same structure, constructed from nonnegative upper capacities; provide a constructor and simplification lemmas, not a second network type.
  Define arrow assignments, excess, and cut capacity against an explicit arrow family `Hom : V → V → Type`, with bounds as separate parameters where needed; the network bundle exposes these definitions and the bounded-assignment types through abbreviations, so bundled and unbundled networks share the same objects and theorems.
  Abbreviations ignoring a network's lower bounds, such as its ordinary flow type, say so in their names.
  A `Quiver` term is never a parameter.
  **Why:** instance search for `Fintype (Hom v w)` does not see through `Quiver.mk`.
- **Sums.** Every network sum is a `Finset.sum` in `K`; the finite theory requires no infinite sums or infinite capacities.
- **Directed walks.** Use Mathlib's [`Quiver.Path`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Combinatorics/Quiver/Path.html#Quiver.Path), with the quiver argument supplied explicitly from the arrow family, as in `@Quiver.Path V ⟨N.Hom⟩ s t`.
  Networks and orientations share this carrier and reuse its length, composition, vertex-list, and transport API; add the missing simple-path and cycle predicates using `Quiver.Path.vertices`.
  Strong connectivity is Mathlib's [`Quiver.IsStronglyConnected`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Combinatorics/Quiver/ConnectedComponent.html#Quiver.IsStronglyConnected) with the same explicit quiver argument.
  Abbreviations may expose these operations through the network or arrow family.
  **Why:** several quivers then coexist on `V` without competing instances or vertex-type synonyms.

**An orientation** of `G : Graph α β` orders the ends of each edge, with one directed arrow per edge identity and no additional arrows.
A loop gives one directed loop; it has a unique ordered pair of ends.
Its directed walks use the resulting arrow family on `V(G)`.
Simple-graph orientations use the existing `TauCeti.DoubledQuiver.Orientation H`, whose carrier contains exactly one dart from each reversed pair, and its `OrientedQuiver`.
The bidirected network has zero lower bounds and one arrow in each direction for every nonloop edge and one loop arrow for every loop, with the original edge's capacity on each arrow.
Milestone 1 identifies both constructions with the existing simple-graph interfaces and supplies their transport lemmas.

**Namespaces.** Undirected multigraph declarations extend `Graph`.
Simple-graph declarations extend `SimpleGraph`, following [#33355](https://github.com/leanprover-community/mathlib4/pull/33355) and [#42494](https://github.com/leanprover-community/mathlib4/pull/42494) for connectivity; orientation results extend the existing Tau Ceti orientation namespace.
`Suggested.lean` keeps stand-ins for proposed definitions outside the Mathlib namespaces.
**Why:** the prototype namespace avoids name conflicts with additions to Mathlib.

### Paths, separators, and connectivity

**Undirected walks** are `G.Walk u v`, an inductive type indexed by the ambient vertex type, with constructors `nil` at any point and `cons e h p` for `h : G.IsLink e u v`; a walk therefore retains the identity of each traversed edge, and a loop is traversed in only one way.
Every vertex on a walk of positive length is an actual vertex; reachability requires actual vertices as endpoints, so a zero-length walk at a point outside `V(G)` witnesses nothing.
**Why:** edge identities and the vertex sequence suffice for the connectivity and flow targets, including loops; they do not record a separate direction of traversal around a loop.
The bidirected quiver has one arrow `s → t` per edge `e` with `G.IsLink e s t`; Target 1.1 identifies its paths with walks between actual vertices for use in the flow reductions.
Undirected and directed paths have no repeated vertices.
An undirected cycle is a positive-length closed walk with no repeated vertices apart from its endpoints and no repeated edge identities.
Thus a loop is a one-edge cycle and two distinct parallel edges form a two-edge cycle; traversing the same edge out and back is not a cycle.
Directed cycles have positive length and no repeated vertices apart from the coinciding endpoints.
Path families are finite and contain distinct paths, except for the explicitly repeated capacitated packings of Target 5.1.
Edge-disjointness concerns identities in `E(G)` for a multigraph, unordered edges for a simple graph, and actual arrow identities in a network.
Internally vertex-disjoint paths between distinct terminals may share only those terminals.
In particular, a family cannot count the same single-edge path repeatedly merely because it has no internal vertices.

A local vertex separator for distinct terminals `s, t` excludes both terminals and destroys reachability after deletion.
The local vertex form of Menger therefore assumes that `s` and `t` are nonadjacent; in the directed case, there must be no arrow from `s` to `t`.
**Why:** adjacent terminals can satisfy deletion-based vertex reachability for every `k`, exceeding their internally disjoint path count.
Milestone 5 also gives the adjacent-terminal version, counting all direct parallel edges, and its simple-graph specialization.

For vertex-disjoint paths between sets `A` and `B`, separators may meet `A ∪ B`.
Paths have one endpoint in each set, their interiors avoid `A ∪ B`, and the paths are disjoint including endpoints.
A vertex in `A ∩ B` contributes a permitted zero-length path and must belong to every separator.
There is no prescribed pairing of the endpoints.
For the edge-disjoint set-to-set version, require `A` and `B` to be disjoint; paths may share endpoints.

Multigraph reachability is defined by walks.
Vertex-reachability and vertex-connectivity are those of `G.toSimpleGraph`, following [#33355](https://github.com/leanprover-community/mathlib4/pull/33355).
In particular, global `k`-vertex-connectivity includes `k < |V(G)|`.
Define `G.IsEdgeReachable k s t` by reachability after deleting any set of fewer than `k` actual edges, and `G.IsEdgeConnected k` by that condition for every pair of actual vertices.
Edge connectivity counts actual edges, including their multiplicities; it is not defined through simplification.
Use natural-number thresholds, coerced where an upstream predicate takes `ℕ∞`.
The predicates are the primary interface, but also define derived numerical invariants `vertexConnectivity G`, `edgeConnectivity G`, and `edgeReachability G s t` in `ℕ∞` as the suprema of the natural thresholds at which the corresponding predicates hold, following [#42494](https://github.com/leanprover-community/mathlib4/pull/42494) for the edge invariants.
On a subsingleton actual vertex set, edge connectivity is `⊤` and vertex connectivity is zero.
Bounds by incident-edge counts or minimum degree assume at least two actual vertices.
Milestone 1 supplies the threshold equivalences and representation compatibility for these invariants.

### Flows and bounded circulations

Write `δ⁺(S)` for arrows leaving a vertex set and `δ⁻(S)` for arrows entering it.
An ordinary `PseudoFlow` is an arrow assignment with proofs of `0 ≤ f ≤ u`; a `Flow s t` adds zero excess away from distinct terminals and nonnegative excess at `t`.
Use incoming-minus-outgoing `excessAt`, with capacities, assignments, excess, and value in `K` and all sums finite.
Flow value is `excess f t`, equivalently `−excess f s`.
**Why:** demand has positive excess, supply has negative excess, and the same additive calculus serves ordinary flows and signed bounded assignments.
Define excess on arbitrary assignments and conservation independently of `Flow`.
A cut is a source side `S` with `s ∈ S` and `t ∉ S`, of capacity `u(δ⁺(S))`.
Arrows entering the source or leaving the sink are allowed.

A bounded assignment satisfies `ℓ ≤ f ≤ u` arrowwise, with no conservation or sign restriction.
Prescribed excess means `excess f = b`; a bounded circulation is the case `b = 0`.
Keep this equality-based interface, and also express interval excess by `a v ≤ excess f v ≤ b v` on the same bounded assignments.
Vertex constraints are separate parameters, not fields of `Network`; Target 8.3 relates equal-endpoint intervals to exact prescribed excess.
A bounded `s–t` assignment has zero excess away from distinct terminals, with value `excess f t` of either sign.
The prototypes call bounded terminal assignments `BoundedFlow`, exact-excess assignments `Realizes`, and interval-excess assignments `RealizesWithin`.
Ordinary `Flow` is the zero-lower-bound, nonnegative-value specialization of bounded terminal assignments, sharing their assignments, excess, and bound calculations.

For every feasible assignment `f` with finite bounds on `N`, its residual network has the same vertex type, arrow type `N.Hom v w ⊕ N.Hom w v` from `v` to `w`, zero lower bounds, and upper capacity `u e − f e` on a forward arrow and `f e − ℓ e` on a reverse arrow.
The arrow type is independent of `f` and retains zero-capacity arrows; augmenting paths lie in its positive-capacity subnetwork.
**Why:** fixed arrow types avoid path transport after every augmentation, while the sum tags distinguish forward capacity from cancellation even with antiparallel original arrows.
For ordinary flows `ℓ = 0`, so reverse residual capacity is `f e`.
For finite bounds, the source-side cut bound is `U(S) = u(δ⁺(S)) − ℓ(δ⁻(S))`; its corresponding lower bound on terminal value is `L(S) = ℓ(δ⁺(S)) − u(δ⁻(S)) = −U(Sᶜ)`.
Ordinary directed cut capacity is the case `ℓ = 0` of `U`; undirected weighted cuts retain their existing nonnegative-capacity conventions.

## 1. Shared foundations

Targets 1.1 and 1.3 are independent; Targets 1.2 and 1.5 use 1.1, and Target 1.4 uses 1.3.

### 1.1. Undirected walks, isomorphisms, and representation bridges

These structural constructions and their transport lemmas assume no finiteness.

Build `Graph.Walk` as pinned in the conventions, with the API of `SimpleGraph.Walk`.
Supply `support`, `edges`, `length`, `append`, `reverse`, `IsPath`, `IsCycle`, splitting at a vertex, path extraction, traced subgraphs, restriction, and transport along `≤` and graph isomorphisms.
Supply the graph-isomorphism interface needed for transport: equivalences of the actual vertex and edge sets preserving `IsLink`, with identity, inverse, composition, and their action on walks and subgraphs, reusing Mathlib's graph maps and any available isomorphism API.
For `G.Compatible H`, supply a union `U` with `V(U) = V(G) ∪ V(H)`, `E(U) = E(G) ∪ E(H)`, and `U.IsLink e x y ↔ G.IsLink e x y ∨ H.IsLink e x y`.
Prove `G ≤ U`, `H ≤ U`, and `U ≤ K ↔ G ≤ K ∧ H ≤ K`, together with commutativity and associativity for pairwise compatible graphs.
Specialize to subgraphs of a fixed graph, which are automatically compatible, and prove that their union remains a subgraph of it; these are the unions used when adding ears.
Build the bidirected quiver and the equivalence between walks and its paths, preserving length, vertex sequence, edge sequence, and simple paths.
For cycles, the directed walk must additionally have distinct underlying undirected edges: a directed two-cycle using opposite arrows of one edge is not an undirected cycle.

Build the following bridges in this milestone, before consumers use them:

- **Simple graphs:** walks in `Graph.ofSimpleGraph H` correspond to `H.Walk`, preserving endpoints, supports, edges, paths, cycles, and both disjointness predicates.
  Include subgraph, deletion, orientation, and ear-data transport, with the structural transport available here and its ear-decomposition instance proved in Milestone 7.
- **Simplification:** project multigraph simple paths to `G.toSimpleGraph` and lift simple paths by choosing actual edges, preserving the vertex sequence.
  Prove that these operations preserve internally vertex-disjoint families and their cardinalities for nonadjacent terminals, and vertex-disjoint set-to-set families.
  Projection need not preserve distinctness for adjacent terminals, since different direct edges project to the same one-edge path; handle them by the multiplicity formula of Milestone 5.
  Do not assert preservation of edge-disjointness under simplification.
- **Connectivity and deletion:** relate native reachability to simplification, and prove compatibility of vertex deletion and induced subgraphs with the necessary subtype equivalences.
  Prove `toSimpleGraph (Graph.ofSimpleGraph H) ≃ H` using the existing isomorphism, and the reverse round trip up to vertex and edge isomorphism for a graph satisfying `Graph.Simple`.
  Characterize the subgraphs induced by reachability classes as the minimal nonempty closed subgraphs, and prove that `Connected` is equivalent to nonempty walk preconnectivity and to being a component of itself, agreeing with [#37861](https://github.com/leanprover-community/mathlib4/pull/37861).
  Vertex-connectivity statements may then use the underlying simple graph while returning native path witnesses through the lifting API.

**Orientations and bidirected networks.** Transport walks and paths, identify the underlying undirected graph of an orientation, and prove reachability and cut-capacity correspondence for the bidirected construction.
Match oriented walks with exactly those undirected walks traversing every edge in its chosen direction; arbitrary undirected reachability need not imply directed reachability.
Prove the equivalence between orientations of `Graph.ofSimpleGraph H` and `TauCeti.DoubledQuiver.Orientation H`, preserving directed walks and strong connectivity through `OrientedQuiver`.
Identify the bidirected construction on a simple graph with its existing `DoubledQuiver` equipped with capacities.

**Digraphs.** Adapt `D : Digraph V` to the explicit arrow family `Q v w := PLift (D.Adj v w)`.
Prove its adjacency, walk, reachability, vertex-deletion, and arrow-deletion correspondences, and identify weak connectivity with reachability in `D.toSimpleGraphInclusive`.
Transport the directed connectivity and Menger statements of Milestones 5 and 6 and the directed ear characterization of Milestone 7 to this interface; retain loops, with at most one arrow per ordered pair.

### 1.2. Cuts, separators, and path families

Develop multigraph cuts and separators with complements, restriction to induced subgraphs, and edge and vertex deletion.
A cut is a subset of the actual vertices; its boundary is the set of actual edges with one endpoint on each side.
Prove symmetry, absence of loops from the boundary, and the cardinality and capacity formulas with parallel edges.
The cut, separator, boundary, and path-family results assume no finiteness; the cardinality, capacity, and aggregation formulas assume a finite graph.
For the weighted aggregation defined in the conventions, prove equality of the multigraph and pair-capacity cut functions, hence preservation of minimum-cut values and minimizing partitions.
Prove invariance of pair-capacity cuts and support graphs under changing diagonal capacities.
Relate edge separators to cuts obtained from reachable vertex sets.
Provide finite path-family APIs for taking subfamilies, reversing undirected paths, concatenating compatible paths, extracting simple paths from walks, and transporting disjointness.
Include the directed analogues needed for residual reachability and path decomposition, with support and arrow-occurrence lemmas.

### 1.3. Excess calculus, subnetworks, bounds, and residual updates

Develop the finite excess calculus on arbitrary signed arrow assignments: additivity, negation, total excess zero, and the identity equating the sum of excesses over a set with its incoming flow minus outgoing flow.
The algebraic identities require only an additive commutative group of values.
For assignments conserved away from two terminals, derive the opposite-terminal-excess identity.
Prove that a pseudoflow conserved away from `s,t` with nonpositive excess at `t` gives a `Flow t s` with the same arrow assignment and value equal to minus the original excess at `t`.

**Subnetworks and network isomorphisms.** A subnetwork of `N` specifies an actual vertex set `W ⊆ V` and a subset of the original arrows whose endpoints lie in `W`, with inherited bounds.
Its vertex type is `W`.
Supply inclusion maps, induced subnetworks, vertex and arrow deletion, singleton subnetworks with no arrows, unions inside a fixed network, and restriction and transport of walks.
Unions have the unions of the actual vertex and arrow sets, including when vertices are isolated.
Prove the membership and prefix-inclusion lemmas needed to add ears, and evaluate strong connectivity on the subnetwork's actual vertices.
A network isomorphism consists of a vertex equivalence and arrow equivalences over corresponding endpoints, preserving both bounds.
Supply identity, inverse, composition, and transport of subnetworks, assignments, excess, feasibility, and walks; excess transport assumes finite vertex and arrow types.

Supply same-arrows bound replacement, extensionality in both bound functions, and transport of feasible assignments when lower bounds decrease and upper bounds increase.
Include replacement of only the upper bounds for ordinary networks; capping at a bound is the case [Target 3.2](#32-large-capacities) uses.
For finite bounds, reversing an arrow and negating its assigned value replaces its bounds by `−u, −ℓ`; prove preservation of feasibility and vertex excess, including for loops and parallel arrows.

Build the shared residual-update operation for arbitrary feasible assignments with finite bounds here.
For any feasible residual assignment `r`, define `f'(e) = f(e) + r(e⁺) − r(e⁻)` and prove feasibility and `excess f' = excess f + excess r`, with no conservation assumption on `r`.
A residual circulation preserves excess; a residual terminal flow changes only terminal excess, with value increasing by its residual value in the same direction and decreasing by that value in the opposite direction.
Supply zero-update and arrowwise formulas and preservation of values in an additive subgroup.
Path and cycle augmentation specialize this operation, including for general signed original bounds; Milestone 3 uses the zero-lower-bound specialization.

### 1.4. Vertex splitting, auxiliary terminals, and change of coefficients

Build the following network constructions generically in their capacities; [Target 5.2](#52-reductions-to-max-flow) instantiates them with the capacities that make cuts correspond to separators.

- **Vertex splitting:** for an explicit finite quiver, use vertices `V × Bool`, writing `v⁻` for the entrance and `v⁺` for the exit.
  Retain each original arrow `v → w` as a distinct tagged arrow `v⁺ → w⁻`, and add one tagged split arrow `v⁻ → v⁺` for every vertex, including isolated vertices and vertices with loops.
  All lower bounds are zero; the construction accepts separate nonnegative capacities on the original and split arrows.
  Lift an original path from `s` to `t` to a split path from `s⁻` to `t⁺`, including the split arrows at its endpoints; project by removing split arrows and retaining original arrow identities.
  Prove the round trips on paths, allowing the endpoint split-arrow segments to be removed when the chosen split terminals are `s⁺, t⁻`.
  For a nonnegative split assignment, conservation at both copies of a nonterminal vertex is equivalent to the conjunction `incoming = splitFlow` and `splitFlow = outgoing`, where incoming and outgoing sums use the retained original arrows.
  In particular, these equalities imply conservation for the projected original assignment; original conservation alone does not determine the split-arrow value.
  Specify the corresponding terminal excess formulas and prove that a split-arrow capacity bounds total traffic through that vertex.
- **Auxiliary terminals:** add a fresh source `σ` and sink `τ` on a sum type, retaining all original arrows with their identities, with one arrow `σ → a` for each `a ∈ A` and one arrow `b → τ` for each `b ∈ B`.
  The terminal sets `A, B` are arbitrary, including empty, and the capacities of the new arrows are parameters.
  Prove that a simple `σ–τ` path consists of a `σ`-arrow, an original path from a vertex of `A` to a vertex of `B`, and a `τ`-arrow; this projected path may pass through further vertices of `A ∪ B`.
  Trimming it to the segment from its last vertex in `A` to the first vertex in `B` at or after it gives an `A–B` path in the sense of the [conventions](#paths-separators-and-connectivity), whose interior avoids `A ∪ B`; the two positions coincide when that vertex lies in `A ∩ B`, giving the permitted zero-length path.
  Trimming preserves vertex-disjointness and arrow-disjointness of families but does not invert lifting, so state lifting, projection, and trimming as three operations.
  Prove that the capacity of a `σ–τ` cut is the capacity of the new arrows it crosses plus the original cut capacity of its restriction to `V`.
  Prove the **normalization lemma**: for disjoint `A, B`, when every arrow `σ → a` has capacity at least the total capacity leaving `a` and every arrow `b → τ` at least the total capacity entering `b`, the set `R = ((S ∩ V) ∪ A) ∖ B` obtained from a `σ–τ` cut `S` satisfies `A ⊆ R ⊆ Bᶜ` and its original cut capacity is at most the `σ–τ` cut capacity of `S`.
  **Why:** restricting a minimum auxiliary cut to `V` need not retain all of `A`.
  Combine with vertex splitting for the vertex-disjoint versions, where the new arrows are `σ → a⁻` and `b⁺ → τ`.
- **Change of coefficients:** map networks, assignments, flows, residual capacities, and cuts along order-preserving additive group homomorphisms, including the standard embeddings `ℤ → ℚ → ℝ`.

### 1.5. Deletion predicates and numerical invariants

The definitions and structural predicate lemmas assume no finiteness; the statements about finite numerical invariants and incidence counts carry the hypotheses specified below.

For the deletion predicates, supply the lemmas missing from Mathlib and from [#33355](https://github.com/leanprover-community/mathlib4/pull/33355), following their shapes: threshold monotonicity, graph monotonicity on a fixed carrier, the zero and one cases, and the relationship between local and global statements.
`SimpleGraph.IsEdgeReachable.mono`, `isEdgeReachable_one`, and `IsEdgeReachable.trans` already exist and are reused.
For native multigraph local edge reachability, prove reflexivity, symmetry, and transitivity without finiteness assumptions, so that each threshold defines an equivalence relation.
Global graph monotonicity for multigraphs requires the same actual vertex set, not merely the same ambient vertex type.
Prove agreement of the native edge predicates with the existing `SimpleGraph` predicates on `Graph.ofSimpleGraph`.
Include the local threshold equivalence for `edgeReachability`, its symmetry, its value `⊤` on the diagonal, and its comparison with global edge connectivity.
For distinct terminals in a finite graph, bound local edge reachability by the number of incident nonloop edges at either terminal.
Prove agreement of the numerical vertex invariant with that of the underlying simple graph and of the edge invariants with those on `Graph.ofSimpleGraph`.
Milestone 5 identifies the local edge invariant with unit-capacity multigraph minimum cuts for distinct terminals.
For every graph with finite nonempty actual vertex set, prove `G.IsVertexConnected k ↔ k ≤ G.vertexConnectivity`.
Prove `G.IsEdgeConnected k ↔ k ≤ G.edgeConnectivity` for every finite graph, in the sense of the conventions, including the empty graph.
Prove the subsingleton conventions of the [path conventions](#paths-separators-and-connectivity) as lemmas: for finite graphs, edge connectivity is `⊤` exactly when the actual vertex set is subsingleton, whereas vertex connectivity is always finite.

For finite actual edge sets, develop incidence counts using Mathlib's `G.incidenceSet v` and `G.loopSet v`.
The nonloop incident-edge count is `(G.incidenceSet v ∖ G.loopSet v).ncard`; parallel edges count separately.
Also supply the count of all incident edges, counting a loop once, and the counts of edges internal to or incident with a vertex set, again counting each edge identity once.
Prove edge-deletion and disjoint-union formulas and compatibility with simple-graph degree on `Graph.ofSimpleGraph`.
On loopless graphs the two vertex counts agree; Target 6.9 uses this count as degree, while Target 8.8 counts a loop once toward indegree.

**Required examples:**

- Empty graphs, isolated vertices, and the two-vertex single-edge graph, exercising the size conventions.
- A finite multigraph on infinite ambient types, verifying that finiteness hypotheses concern only its actual vertices and edges.
- Weighted multigraph aggregation with parallel edges, loops, and zero-capacity edges, and pair capacities with nonzero diagonal entries, proving the specified cut invariance.
- Bounded assignments with negative bounds, and integer assignments carried to real bounds by change of coefficients.
- A singleton subnetwork inside a network with several vertices, verifying that its own vertex type is a singleton and its connectivity does not quantify over omitted vertices.

## 2. Bridges, cut vertices, and blocks

### 2.1. Bridges

For a multigraph, a bridge is an actual edge whose deletion disconnects its endpoints.
Prove equivalence with lying on no undirected cycle and with splitting the component of its endpoints into two components, and, for finite `V(G)`, with increasing the number of connected components by exactly one.
Loops are never bridges, and an edge with a distinct parallel edge is not a bridge.
Define a multigraph forest by absence of undirected cycles and prove that this is equivalent to every actual edge being a bridge, without finiteness assumptions.
Recover `SimpleGraph.isAcyclic_iff_forall_edge_isBridge` through the walk and bridge correspondences.
Prove correspondence on actual edges of `Graph.ofSimpleGraph H` with Mathlib's `SimpleGraph.IsBridge` and its `isBridge_iff_forall_cycle_notMem`; membership matters because the simple-graph predicate can also hold for a non-edge joining different components.

### 2.2. Cut vertices

Cut vertices and the block–cut forest use the underlying simple graph and its existing reachability and induced-subgraph APIs.
A cut vertex `v` is one that separates two other vertices: some `u, w ≠ v` are reachable in `G` but not in the graph induced on the complement of `{v}`.
Prove that this is equivalent to deletion of `v` increasing the number of connected components, by one or more, for finite `V(G)`.
**Why:** the reachability definition needs neither finiteness nor `Fintype` instances on deletion subtypes.

### 2.3. Blocks

A block is a maximal nonempty connected induced subgraph with no cut vertex of its own.
For simple graphs, bridges that are edges give two-vertex blocks, and isolated vertices give singleton blocks.
Prove that every simple-graph edge belongs to exactly one block, distinct blocks meet in at most one vertex, and a vertex lies in more than one block exactly when it is a cut vertex.
Transport these vertex blocks and cut-vertex criteria to multigraphs through simplification.
Every nonloop multigraph edge belongs to exactly one vertex block, but a two-vertex block may contain parallel edges and need not consist of a bridge.
A singleton block may carry loops; a loop at a cut vertex lies in every induced vertex block containing that vertex, so these vertex blocks do not partition loop edges.

### 2.4. The block–cut forest

Construct the **block–cut incidence graph**, whose two kinds of vertices are blocks and cut vertices, with adjacency given by membership.
Prove that it is a forest, that its components correspond to the components of the original graph, and that it is a tree when the original graph is connected.
Include the path correspondence that recovers separation in the original graph from the unique paths in this forest.

**Required examples:**

- Paths and cycles, including their bridges, blocks, and connectivity predicates.
- Two triangles meeting at one vertex, with its explicit block–cut tree, and a loop at the common vertex demonstrating the vertex-block convention.

## 3. Flows and max-flow/min-cut

### 3.1. Finite flows and assignment decomposition

Derive weak duality from the excess calculus of [Target 1.3](#13-excess-calculus-subnetworks-bounds-and-residual-updates): the value of every feasible flow is at most the capacity of every terminal-separating cut.
Every target in this section concerns ordinary flows, with zero lower bounds and nonnegative value.

1. **Residual augmentation.** Augmenting along a simple augmenting `s–t` path by its minimum residual capacity preserves feasibility and increases flow value by that positive amount.
   Use the common residual update of Milestone 1 and derive the corresponding bounded-circulation cycle augmentation lemma.
2. **Nonnegative assignment decomposition.** Every nonnegative arrow assignment on a finite quiver, without any conservation hypothesis or capacity data, is a finite sum of positively weighted simple directed paths and directed cycles, with equality on every original arrow.
   Each path starts at a vertex of negative original excess and ends at one of positive original excess, with no excess restriction on internal vertices.
   A walk of weight `q` contributes `n • q` to each arrow it traverses `n` times, using natural-number scalar multiplication without a multiplicative unit.
   State the supply and demand identities: the total weight of paths starting at a supply vertex is minus its original excess, and the total weight ending at a demand vertex is its original excess.
   Permit empty path and cycle families, include loops as cycles, and prove that every component assignment is bounded arrowwise by the original assignment.
   Bound the total number of weighted components by the number of arrows with positive original value; this bound precedes any expansion of integer weights into unit paths.
   If the original assignment takes values in an additive subgroup `H`, choose every coefficient in `H`.
   **Suggested proof:** cancel cycles, then peel maximal paths from the acyclic support, removing a support arrow at each step.
   Derive the ordinary `s–t` flow decomposition and the cycle-only decomposition of nonnegative zero-excess assignments as corollaries.
   For a pseudoflow conserved away from the terminals with negative excess at the designated sink, use terminal exchange to obtain paths in the opposite direction.
   These statements require nonnegative arrow values; general signed circulations use the nonnegative residual difference of [Target 8.4](#84-residual-adjustments) for cycle adjustments.
3. **Acyclic flows.** Every ordinary flow has an acyclic flow of the same value: a flow whose assignment is arrowwise no larger and whose support contains no directed cycle; in particular it uses no loop and at most one of any two opposite arrows, and every arrow value is at most the flow value.
   Preserve values in an additive subgroup.
   A decomposition without cycle components need not have acyclic support: unit flows along `s → a → b → t` and `s → b → a → t` together contain the cycle `a → b → a`.
   **Suggested proof:** repeatedly cancel a support cycle by its minimum arrow value, strictly shrinking support; then use path decomposition to bound each arrow value by the total flow value.
4. **Max-flow/min-cut.** There exist a feasible flow and a terminal-separating cut with equal value and capacity.
   Prove the equivalent optimality criteria: maximum flow, no augmenting `s–t` path, and existence of a cut attaining equality.
5. **Integrality.** Capacities in an additive subgroup `H` of `K` admit a maximum flow whose arrow values are in `H` and whose value equals the minimum cut capacity.
   **Why:** residual capacities and augmentations preserve additive-subgroup membership.
   Natural-number capacities in `ℤ`, `ℚ`, or `ℝ` are the case `H = AddSubgroup.zmultiples 1`; state that case with `ℕ`-casts and give the explicit coercion lemmas between the three coefficient types.
6. **Termination over `ℤ`.** For integer capacities, every flow value is at most the total capacity leaving the source, and augmentation strictly increases the value, so the relation "`g` has larger value than `f`" is well-founded on integer flows.
   Hence every sequence of augmentations terminates, whatever the choice of augmenting paths.
   No such assertion is made for dense or non-Archimedean coefficients.

**Suggested proof:** the shortest-augmenting-path termination bound depends only on the finite residual graph, independently of coefficient discreteness, Archimedeanness, or completeness.

**Required examples:**

- Networks with parallel and antiparallel arrows, a loop, and zero capacities over integer, rational, and real coefficients, exercising residual tags and finite sums.
- A capacity-feasible assignment with negative excess at the designated sink, verifying terminal exchange, and a prescribed-excess example verifying the supply and demand signs.
- A nonnegative assignment with two supply vertices, two demand vertices, and a cycle, verifying arrowwise reconstruction and the supply and demand weight identities.
- Zero and nonnegative zero-excess assignments, exercising empty decomposition families and loop cycles.
- The two-path flow of item 3, whose decomposition has no cycle component while its support contains a directed cycle, together with its acyclic flow.

### 3.2. Large capacities

Prove that capping capacities at `B : K`, meaning replacing every `cap e` by `min (cap e) B`, changes neither the minimum `s–t` cut value nor the set of minimum `s–t` cuts whenever some `s–t` cut has capacity strictly below `B`.
Prove that every flow of the capped network is a flow of the original network with the same assignment, and that every flow of the original network yields, after removing the cycle components of a decomposition from [Target 3.1](#31-finite-flows-and-assignment-decomposition), a flow of the capped network with the same value and an arrowwise no larger assignment.
Arrows that must never occur in a minimum cut receive finite capacities exceeding a known cut, as in [Target 5.2](#52-reductions-to-max-flow) and the bipartite network of Milestone 6.

**Required examples:**

- An arrow of capacity above a terminal-separating cut, with a flow whose cycle component carries more than the cut bound, showing that capping preserves the flow value after cycle removal but need not preserve the original assignment.

### 3.3. Terminal sets and undirected networks

**Terminal sets.** For disjoint finite vertex sets `A, B`, an `A–B` flow is a pseudoflow conserved outside `A ∪ B` with nonpositive excess on `A` and nonnegative excess on `B`; its value is the total excess on `B`, equivalently minus the total excess on `A`.
An `A–B` cut is a vertex set `S` with `A ⊆ S ⊆ Bᶜ`, of capacity `u(δ⁺(S))`; these are the admissible sets of [Target 4.1](#41-submodularity-and-terminal-set-cut-lattices).
Prove weak duality, the existence of an `A–B` flow and an `A–B` cut of equal value and capacity, the optimality criteria, and integrality in an additive subgroup, for all disjoint `A, B` including empty ones, where the maximum value is zero.
In the auxiliary-terminal construction of [Target 1.4](#14-vertex-splitting-auxiliary-terminals-and-change-of-coefficients), give `σ → a` capacity equal to the total capacity leaving `a` and `b → τ` capacity equal to the total capacity entering `b`.
Prove the following reusable correspondences:

1. `A–B` flows correspond exactly to `σ–τ` flows with the same original assignment and value.
2. Every `A–B` cut `R` gives the `σ–τ` cut `R ∪ {σ}` of the same capacity.
3. Normalizing a minimum `σ–τ` cut by the normalization lemma of Target 1.4 gives a minimum `A–B` cut of the same capacity.

**Undirected networks.** A flow of a weighted multigraph is a flow of its bidirected network.
Prove that every such flow has an acyclic flow of the same value ([Target 3.1](#31-finite-flows-and-assignment-decomposition)) that uses no loop arrow and at most one of the two opposite arrows of each nonloop edge.
Prove the undirected max-flow/min-cut theorem: for distinct actual vertices `s, t` there are such a flow and a set `S` containing `s` but not `t` whose value and multigraph cut capacity ([Target 1.2](#12-cuts-separators-and-path-families)) agree, every flow value is at most every cut capacity, and integrality holds in an additive subgroup.
Derive the `SimpleGraph` statement for `Sym2`-indexed capacities through `Graph.ofSimpleGraph`, in the shape of [#34028](https://github.com/leanprover-community/mathlib4/pull/34028).

**Required examples:**

- Terminal sets with several vertices on each side, one of them empty, verifying the value formula and the auxiliary-terminal correspondence.
- A weighted multigraph with parallel edges and a loop, with a bidirected flow using both directions of one edge and its normalization.

### 3.4. Real-valued corollaries

For `K = ℝ`, expose flows with `ℝ≥0`-valued capacities as ordinary flows for their coercion to `ℝ`, with arrow values in `ℝ≥0` by nonnegativity.
Supply coercion lemmas recovering the real arrow assignment, its capacity bounds, and the equality between real cut capacity and the coercion of the cut capacity computed in `ℝ≥0`.
Keep excess and flow value in `ℝ`, and state max-flow/min-cut and additive-subgroup integrality for these capacities using the generic theory.
**Why:** nonnegative capacities can use their natural subtype while excess retains the additive-group operations needed for conservation and residual updates.

### 3.5. Mixed vertex and arrow capacities

For a finite directed quiver, distinct terminals `s,t`, nonnegative arrow capacities `u(e) : K`, and nonnegative capacities `c(v) : K` on nonterminal vertices, constrain an ordinary flow by `∑ e entering v, f(e) ≤ c(v)` for each `v ≠ s,t`.
Conservation makes the incoming and outgoing traffic equal there; a loop contributes once to each sum.
A mixed separator is a pair `(X,F)` of a terminal-excluding vertex set and a set of original arrow identities such that deleting both destroys `s–t` reachability.
Its weight is `∑ v ∈ X, c(v) + ∑ e ∈ F, u(e)`, including any selected arrows incident to deleted vertices.
Prove existence of a flow and a mixed separator of equal value and weight, together with weak duality for every such pair.
Use the ordinary flow theorem's coefficient assumptions on `K`.
When all capacities lie in an additive subgroup `H`, supply an attaining flow with every arrow value in `H`.

Use the splitting interface of Target 1.4, retaining capacity `u(e)` on each original arrow, capacity `c(v)` on each nonterminal split arrow, and terminals `s⁺,t⁻`.
Give the terminal split arrows capacity `∑ e, u(e)`, which bounds their traffic and requires no distinguished positive unit.
Prove the flow correspondence preserving value and the internal traffic formulas.
Map any split cut to the mixed separator formed by its crossing nonterminal split arrows and crossing original arrows, with equal weight, and map any mixed separator to a cut of no greater capacity.
No cut can cross a terminal split arrow in the outgoing direction with these terminals, so the cut–separator correspondences hold for any nonnegative terminal split capacities.
Only the correspondence with all original flows uses the bound `∑ e, u(e)`.
Recover ordinary max-flow/min-cut by taking every vertex capacity to be `∑ e, u(e)`.

**Required examples:**

- A rational-capacity network whose minimum mixed separator uses both a vertex and an arrow, and a zero-capacity example.

## 4. The structure of minimum cuts

### 4.1. Submodularity and terminal-set cut lattices

A function `f : L → K` on a lattice `L` is **submodular** when `f (a ⊔ b) + f (a ⊓ b) ≤ f a + f b` for all `a, b`; for `f : Finset V → K` this reads `f (S ∪ T) + f (S ∩ T) ≤ f S + f T`, and such an `f` is **symmetric** when `f Sᶜ = f S` for all `S`.
Define submodularity on lattices; symmetry and minimum cuts concern `Finset V`.
The definition requires only `[Add K] [LE K]`.
Prove that constant functions are submodular when the order is reflexive, that sums of submodular functions are submodular in an ordered additive commutative monoid, and that precomposition with a lattice homomorphism preserves submodularity under the definition's assumptions.
The closure of minimizers requires only a partially ordered cancellative additive commutative monoid; the finite minimum-cut theory below uses a linear order to obtain attained minima.
A minimum `A–B` cut for disjoint terminal sets `A,B` is a minimizer of `f` over `A ⊆ S ⊆ Bᶜ`.
Either terminal set may be empty; disjointness guarantees at least one admissible set, and finiteness gives an attained minimum.
Singleton terminal sets recover minimum `s–t` cuts for distinct `s,t`; under symmetry the choice of side is immaterial after exchanging the terminal sets.
State the minimum-cut results for such set functions, with the cut capacities as instances, over the linearly ordered cancellative additive commutative monoid of the conventions; only Target 4.2 needs the group.
Prove that nonnegative directed outgoing cut capacity is submodular and that nonnegative undirected cut capacity is symmetric and submodular.
For finite signed bounds `ℓ ≤ u`, also prove submodularity of the upper cut bound `U` using

$$
U(S)=(u-\ell)(\delta^+(S))-\sum_{v\in S}\operatorname{excess}(\ell)(v).
$$

**Suggested proof:** the first term is submodular and the vertex sum satisfies the submodular identity with equality; use Target 1.3 without circulation feasibility.

For a submodular `f` on a lattice and a predicate closed under `⊔` and `⊓`, prove that the minimizers of `f` among the elements satisfying the predicate are closed under `⊔` and `⊓`.
For a submodular `f : Finset V → K` and disjoint terminal sets `A,B`, derive that the minimum `A–B` cuts are closed under union and intersection, the instance for the predicate `A ⊆ S ⊆ Bᶜ`.
Develop this family as a finite distributive lattice under inclusion, with unique smallest and largest members, characterized by containment in or containment of every minimizing side.
Supply attainment, the minimum-value characterization of a minimizing side, invariance under vertex equivalences, and the singleton-terminal specialization.
Derive the membership corollaries: the minimum `A–B` cut is unique exactly when the smallest and largest members coincide; a vertex of the smallest member lies on the source side of every minimum cut, and a vertex outside the largest member lies on the source side of none.
Define submodularity independently of symmetry; none of these lattice results assumes symmetry.

**Required example:** disjoint terminal sets with more than one terminal and multiple minimizing sides, verifying the smallest and largest cuts, and cases where one or both terminal sets are empty.

### 4.2. Residual characterizations and canonical cuts

For any feasible bounded `s–t` assignment with finite signed bounds and any source-side cut `S`, prove the gap identity

$$
U(S)-\operatorname{val}(f)=(u-f)(\delta^+(S))+(f-\ell)(\delta^-(S)).
$$

The right-hand side is the outgoing capacity of `S` in the residual network.
For any maximum bounded terminal assignment, characterize its minimum cuts as exactly the source-side sets with no positive-capacity residual arrow leaving them.
Characterize the smallest source side as the vertices reachable from the source along positive-capacity residual arrows, and the largest as the complement of the vertices from which the sink is reachable along such arrows.
Prove that both sets are independent of the chosen maximum assignment, and recover the ordinary-flow statements by specialization.
Derive the residual forms of the membership corollaries of Target 4.1: a vertex lies on the source side of every minimum cut exactly when it is reachable from the source along positive-capacity residual arrows, on the source side of none exactly when the sink is reachable from it along such arrows, and the minimum cut is unique exactly when every vertex satisfies one of the two.
These results apply the lattice theory of Target 4.1 to `U`, including for networks whose feasible terminal values are all negative; they assume a maximum assignment is given, and Target 8.6 supplies its existence for every feasible finite-bound network.
The symmetric results below retain their symmetry hypothesis, which signed directed cut bounds need not satisfy.

**Required examples:**

- A signed-bound network exercising submodularity, the residual cut-gap identity, and the smallest and largest minimum cuts.

### 4.3. Non-crossing lemmas and minimum-cut values

Prove the **non-crossing lemma** for a symmetric submodular `f`: if `S` is a minimum `s–t` cut and distinct vertices `u, v` both lie in `S`, there exists a minimum `u–v` cut with one side contained in `S`.
Include the identities and uncrossing inequalities needed to choose such a cut without changing its value.
There is no directed version: the lemma fails without symmetry, for directed cut capacity in particular.

Extend it to families with two further targets.
**Uncrossing preserves laminarity:** if a vertex set `Z` crosses `X` (all four of `Z ∩ X`, `Z ∖ X`, `X ∖ Z`, and the complement of `Z ∪ X` are nonempty), then `Z ∩ X` and `Z ∪ X` are each nested with or disjoint from every set that is nested with or disjoint from both `Z` and `X`.
Two cuts, as bipartitions, **cross** when all four intersections of a side of one with a side of the other are nonempty.
**Root convention:** fix a root vertex and represent every cut by its side not containing the root; prove that a pairwise non-crossing family of cuts then becomes a laminar family of sets (pairwise nested or disjoint), because two root-excluding sides cannot cover the vertex set.
**Why:** without the root convention, non-crossing sides can cover the vertex set without being nested or disjoint.
**Multi-cut non-crossing lemma:** for a pairwise non-crossing family of cuts, each a minimum cut of `f` for a designated pair of vertices, and distinct vertices `s, t` separated by none of them, there is a minimum `s–t` cut crossing none of them.
**Why:** successive uncrossings can create new crossings; the laminarity lemma makes the number of crossed members strictly decrease.
Prove also the **ultrametric inequality** for the minimum cut values of any `f` and distinct `s, t`, `λ(s,t) ≥ min (λ(s,v), λ(v,t))`, since every `s–t` cut separates `s` from `v` or `v` from `t`.
The intermediate vertex `v` is arbitrary; define `λ(s,s) = 0` as the diagonal convention.
These are the interface used by the cut-tree milestone.
Submodularity, the lattice, and the non-crossing lemmas rest on Milestone 1 alone; Milestone 3 enters this milestone only for the residual characterization of the canonical cuts.

## 5. Menger's theorem

### 5.1. Path–separator duality

All versions assume finitely many actual vertices.
Edge-disjoint versions also require finite edge or arrow sets; vertex versions do not, except that adjacent-terminal Menger requires finite direct terminal edges or arrows.
Give every version for multigraphs and directed networks, with `SimpleGraph` and `Digraph` corollaries through [Target 1.1](#11-undirected-walks-isomorphisms-and-representation-bridges), retaining actual edge or arrow identities in path witnesses.

For every version, prove **attainment and weak duality**: some admissible path family or packing has size equal to a separator's cardinality or specified weight, and every admissible family or packing has size at most every separator's cardinality or weight.
For adjacent terminals, add the correction `m` below to the separator size in both statements.
**Why:** numerical connectivity invariants alone supply neither attaining witnesses nor their optimality certificates.

- **Local edge Menger:** for distinct terminals `s, t`, use pairwise edge-disjoint `s–t` paths and sets of edge or arrow identities whose deletion destroys `s–t` reachability.
- **Local vertex Menger:** for distinct nonadjacent terminals, use internally vertex-disjoint paths and terminal-excluding vertex separators, following the [directed adjacency convention](#paths-separators-and-connectivity).
- **Vertex-capacitated Menger:** under the same terminal assumptions and with capacities `c : V → ℕ`, a **packing** is a finite indexed family of `s–t` paths, repetitions allowed, in which each nonterminal vertex `v` occurs in at most `c v` members counted with repetition.
  A terminal-excluding vertex separator `X` has weight `∑ v ∈ X, c v`.
  The local vertex Menger statements are the case `c = 1`: a packing is then a family of distinct internally vertex-disjoint paths, since two members sharing an internal vertex would exceed its capacity and the adjacency hypothesis excludes members without internal vertices.
- **Adjacent terminals:** let `D` be the set of all edges joining distinct terminals `s,t`, and let `m = |D|`.
  In the directed version, `D` consists exactly of arrows `s → t`; arrows `t → s` are retained and do not contribute to `m`.
  After deleting all of `D`, a terminal-excluding vertex separator of size `k` and a family of `k + m` internally vertex-disjoint paths in the original graph attain equality, for some `k`.
  The attaining family includes all `m` distinct one-edge paths; weak duality bounds every internally vertex-disjoint family by `|X| + m` for every separator `X` after deleting `D`.
  The simple-graph corollary has `m = 1` and hence `k + 1` paths, including for the single-edge graph where `k = 0`.
- **Set-to-set Menger:** use vertex-disjoint `A`–`B` paths and vertex sets meeting every such path, with the [overlap convention](#paths-separators-and-connectivity).
  Also give the edge-disjoint version for disjoint terminal sets, with edge or arrow separators and shared endpoints allowed.
- **Vertex-capacitated set-to-set Menger:** for arbitrary terminal sets `A, B` and capacities `c : V → ℕ`, a packing is a finite indexed family of `A–B` paths with repetition, whose interiors avoid `A ∪ B`, such that each vertex `v`, including endpoints, belongs to at most `c v` members counted with repetition.
  A separator may meet the terminal sets and has weight `∑ v ∈ X, c v`.
  Recover vertex-disjoint set-to-set Menger at `c = 1`; for `v ∈ A ∩ B`, a zero-length path may be repeated up to `c v` times, and every separator contains `v` even when `c v = 0`.
  Include empty terminal sets and zero capacities.

To obtain vertex versions without finite edge or arrow sets, use simplification or one arrow per inhabited `Q v w`, then lift paths by choosing actual edges or arrows.
Prove preservation of vertex usage and separators, allowing repeated paths in capacitated packings; handle direct edges separately in the adjacent-terminal case.

Derive the predicate forms for distinct terminals: local edge reachability at threshold `k` is equivalent to the existence of `k` edge-disjoint paths; local vertex reachability has the analogous equivalence under the nonadjacency hypothesis.
Relate local edge reachability to cuts as well: for distinct actual vertices `s,t`, `G.IsEdgeReachable k s t` holds exactly when `k` is at most the minimum `s–t` cut value, in `ℕ`, with capacity `1` on each actual edge.
After aggregation to pair capacities, the capacity of a pair is its edge multiplicity, not merely an adjacency indicator.
Thus the cut tree of Milestone 9 answers multigraph local edge reachability; for a simple graph this specializes to capacity `1` on edges and `0` elsewhere.
For multigraphs with finitely many actual vertices and more than `k` of them, derive the global characterization of `k`-vertex-connectivity by `k` internally vertex-disjoint paths between every pair of distinct vertices, including adjacent pairs, without assuming a finite edge set.
Derive the simple-graph specialization with the same size hypothesis.

### 5.2. Reductions to max-flow

Instantiate the vertex-splitting and auxiliary-terminal constructions of [Target 1.4](#14-vertex-splitting-auxiliary-terminals-and-change-of-coefficients) over `ℤ`, where integrality is the case `H = ⊤`, with the capacities below, and prove the correspondence in each direction.
For vertex targets with no edge- or arrow-finiteness assumption, apply these finite-network reductions to the simplification, or in the directed case to the arrow family with one arrow per inhabited `Q v w`, and use its path-lifting and separator correspondences.
These reductions are required reusable interfaces.
In the undirected edge reduction, extract paths from the normalized flow of [Target 3.3](#33-terminal-sets-and-undirected-networks), so that one edge cannot be used twice while distinct parallel edges remain distinct.
Discard loop flows and cycle flows when extracting simple terminal-to-terminal paths.
The reductions must recover actual path families and separators, not just equalities of numerical optima.

- **Local and vertex-capacitated vertex Menger:** assume distinct terminals, no original arrow `s → t`, and vertex capacities `c : V → ℕ`; the unit case `c = 1` gives local vertex Menger.
  Over `ℤ`, put `M = (∑ v, c v) + 1`, capacity `M` on original arrows and on the split arrows of `s,t`, and capacity `c v` on the split arrow of every other vertex `v`; use terminals `s⁺, t⁻`.
  Obtain the cut–separator correspondences by specializing [Target 3.5](#35-mixed-vertex-and-arrow-capacities) to `K = ℤ` and `u = M`; these maps are independent of the terminal split capacities.
  Nonadjacency makes deletion of all internal vertices a separator of weight at most `M − 1`, and a mixed separator of weight below `M` contains no original arrows.
  Deduce the pure vertex-separator statements as corollaries: a cut below `M` gives a separator of exactly that weight, and a vertex separator gives a cut of no greater capacity; in particular, these apply to minimum cuts.
  After discarding cycle components, an integral flow decomposes into unit paths with repetition, and the number of members through a nonterminal vertex `v` equals the flow on its split arrow, which is at most `c v`; with `c = 1` the members are distinct and internally vertex-disjoint.
- **Set-to-set Menger:** for vertex capacities `c : V → ℕ`, split every vertex `v` with capacity `c v`, give original arrows capacity `M = (∑ v, c v) + 1`, and add capacity-`M` arrows `σ → a⁻` for `a ∈ A` and `b⁺ → τ` for `b ∈ B`.
  Every cut of capacity below `M` crosses only split arrows and yields a vertex separator of that weight, now allowed to meet `A ∪ B`; deleting all split arrows bounds the minimum cut by `∑ v, c v`.
  Prove the reverse separator-to-cut bound and both packing-to-flow and flow-to-packing correspondences, preserving size and value.
  Shortening projected paths so that their interiors avoid `A ∪ B` does not increase vertex usage and retains each indexed member, even when several become the same path.
  The route `σ → v⁻ → v⁺ → τ` for `v ∈ A ∩ B` projects to the permitted zero-length path, with its repetitions bounded by `c v`.
  Specialize to `c = 1` to recover vertex-disjoint families and `M = |V| + 1`.
  For edge-disjoint paths with disjoint `A,B`, use the unsplit quiver, unit original capacities, and capacity `M = |E| + 1` on `σ → a` and `b → τ`, where `E` is the total original arrow type.
  Cuts of capacity below `M` cross only original arrows; deleting all original arrows bounds the minimum cut by `|E|`.
  Supply separator-to-cut and path-family correspondences in this case as well, allowing shared path endpoints.
  Include empty terminal sets.

**Required examples:**

- Complete graphs, including the distinction between adjacent-terminal deletion connectivity and path counts.
- Parallel direct terminal edges together with a path through an internal vertex, verifying the adjacent-terminal multiplicity formula.
- Directed parallel arrows `s → t` together with arrows `t → s`, verifying that only the forward arrows contribute to the adjacent-terminal correction.
- A three-vertex path with infinitely many parallel edges on each link, verifying vertex connectivity and nonadjacent vertex Menger without a finite-edge instance.
- That three-vertex graph with one additional direct terminal edge, verifying the adjacent-terminal formula with finite `D` and an infinite total edge set.
- Overlapping terminal sets whose common vertex contributes a zero-length path, exercising the split-network projection and separator correspondence.
- A vertex of capacity two through which every `s–t` path passes, verifying that the vertex-capacitated packing repeats a path and that the separator weight is two.
- Vertex-capacitated terminal sets with an endpoint of capacity two and an overlapping vertex of capacity zero or two, verifying endpoint usage, repeated zero-length paths, and the weighted separator equality.

## 6. Connectivity, bipartite matching, and edge-colouring

The vertex-structural consequences below assume a finite vertex set and use the existing `SimpleGraph` vocabulary, including their application to multigraphs with finite actual vertex sets and arbitrary edge sets through simplification.
The native edge-connectivity bounds and the matching and colouring targets assume finite actual vertex and edge sets.
The matching and colouring targets retain multigraph edge identities and provide `SimpleGraph` corollaries.
Also prove the native multigraph Whitney inequality `vertexConnectivity G ≤ edgeConnectivity G` and the upper bound by the number of nonloop edges incident to each vertex when there are at least two actual vertices.
Use the nonloop incidence count of Target 1.5, counting parallel edges separately.
The simple-graph specialization gives the minimum-degree bound below.

### 6.1. Whitney inequalities

`G.IsVertexConnected k` implies `G.IsEdgeConnected k`; for `[Nontrivial V]`, `G.IsEdgeConnected k` implies `k ≤ G.minDegree`.
Derive the numerical forms `G.vertexConnectivity ≤ G.edgeConnectivity` and, on a finite nontrivial carrier, `G.edgeConnectivity ≤ G.minDegree` after coercing the degree to `ℕ∞`.

### 6.2. Directed connectivity

For an arrow family `Q` on a finite vertex type, define `IsArcReachable k s t` by reachability after deleting fewer than `k` arrows, `IsArcStrong k` by that condition for every ordered pair, and `IsVertexStrong k` by more than `k` vertices together with reachability between every two remaining vertices after deleting fewer than `k` vertices.
The vertex statements assume nothing about the arrow types; the arrow-counting characterizations through directed edge Menger and the degree bounds assume finite arrow types.
Define the invariants `arcConnectivity` and `vertexStrongConnectivity` in `ℕ∞` as the suprema of the thresholds, with the same subsingleton conventions as the undirected invariants.
Supply threshold equivalences, monotonicity in the threshold and the arrow family, deletion lemmas, and the predicate forms through directed Menger.
Prove `vertexStrongConnectivity ≤ arcConnectivity`, and the bound of arc connectivity by every out-degree and in-degree when there are at least two vertices.
Prove that the arc connectivity of the bidirected network of a multigraph is its edge connectivity and that its vertex strong connectivity is the multigraph's vertex connectivity.
Give the `Digraph` corollaries through the adapter of [Target 1.1](#11-undirected-walks-isomorphisms-and-representation-bridges).

### 6.3. Common-cycle characterizations

For a connected simple graph with at least three vertices, each of the following is equivalent to 2-vertex-connectivity: every two distinct vertices lie on a common cycle; every two distinct edges lie on a common cycle; every vertex and every edge lie on a common cycle.
The blocks with at least three vertices from Milestone 2 are exactly the vertex sets of the maximal 2-vertex-connected induced subgraphs.

### 6.4. Preservation lemmas

Deleting `m < k` vertices from a `k`-vertex-connected graph leaves a `(k − m)`-vertex-connected graph; adjoining a new vertex adjacent to at least `k` vertices of a `k`-vertex-connected graph gives a `k`-vertex-connected graph; adding edges preserves `k`-vertex- and `k`-edge-connectivity.

### 6.5. The fan lemma

In a `k`-vertex-connected graph, a vertex `x` outside a set `U` with at least `k` vertices has `k` paths to distinct vertices of `U`, with interiors outside `U` and pairwise intersection exactly `{x}`.

### 6.6. Dirac's prescribed-vertex cycle theorem

For `k ≥ 2`, every set of `k` vertices in a `k`-vertex-connected graph lies on a cycle.
No cyclic order of those vertices is prescribed.

### 6.7. Multiset capacitated Kőnig's theorem

**Theorem.**

Let `G` be a finite bipartite multigraph with a specified partition `V(G) = L ⊔ R`, so every edge joins the two sides and there are no loops.
For capacities `b : V(G) → ℕ`, a **multiset capacitated matching** assigns a multiplicity `x(e) : ℕ` to every actual edge, with `usage(x,v) = ∑ e incident to v, x(e) ≤ b(v)` at every vertex; its size is `∑ e, x(e)`.
An edge may be used repeatedly, independently of whether the graph has parallel edges.
A vertex cover `C ⊆ V(G)` meets every edge and has weight `b(C) = ∑ v ∈ C, b(v)`.
Prove that there exist a feasible multiset matching and a vertex cover of equal size and weight, and that every feasible multiset matching has size at most the weight of every cover.
Include zero capacities, isolated vertices, empty sides, and the empty graph.

**API and correspondences.**

Supply the bipartition interface with restriction under edge deletion and the common basic API.
On `Graph.ofSimpleGraph H`, identify a covering bipartition with `H.IsBipartiteWith L R` together with `L ∪ R = Set.univ`, using the vertex correspondence of Target 1.1.
Mathlib's `IsBipartiteWith` alone permits isolated vertices outside both sides.
For matchings, supplement the common basic API with zero matching, restriction to selected edges, monotonicity in vertex capacities, addition under added capacities, usage and size formulas, and saturation of a vertex or side.
Prove that the total usage on either bipartition side equals the matching size.
At `b = 1`, identify these objects with ordinary edge matchings, with no repeated edges, and transport the result to `SimpleGraph.Subgraph.IsMatching`, `SimpleGraph.IsVertexCover`, and the extremality interfaces of [#33032](https://github.com/leanprover-community/mathlib4/pull/33032).
Represent an ordinary multigraph matching by selected actual edges with pairwise disjoint endpoint sets and no loops; its associated subgraph has exactly their endpoints as vertices, without isolated vertices.
Supply the edge-set/subgraph correspondence and perfect-matching predicate, where every actual vertex is incident to exactly one selected edge.
Build the missing finite matching and cover API here.

Supply the matching-to-packing and cover-to-separator correspondences for vertex-capacitated set-to-set Menger with `A = L`, `B = R`, and `c = b`.
Such trimmed paths have length one because `L ∪ R` contains every vertex, so repeated paths encode precisely the edge multiplicities.
Also expose the bipartite network: source-to-`L` and `R`-to-sink capacities are `b(v)`, and each actual edge directed from `L` to `R` has capacity `b(L) + 1`.
Prove value-preserving correspondences between integral flows and multiset matchings, between covers and cuts of the same weight, and between cuts of capacity below `b(L) + 1` and covers of the same weight via `(L ∖ S) ∪ (R ∩ S)`.
Capacity `b(L) + 1` suffices because cutting all source arrows has capacity `b(L)`.

### 6.8. Capacitated Hall and deficiency

For the same finite bipartite multigraph and capacities, let `N(S) ⊆ R` be the neighbours of `S ⊆ L`, ignoring multiplicity when forming this vertex set.
Prove the capacitated Kőnig–Ore formula in witness form: there exist a feasible multiset matching `x` and a set `S ⊆ L` such that `size(x) = b(L ∖ S) + b(N(S))`, and every feasible `x` and every `S ⊆ L` satisfy the corresponding inequality.
Derive the numerical formula `max size(x) = b(L) − max_{S ⊆ L} (b(S) − b(N(S)))`, with natural subtraction.
Derive **capacitated Hall**: a feasible multiset matching saturating every vertex of `L` exists if and only if `b(S) ≤ b(N(S))` for every `S ⊆ L`.
It can saturate both sides if and only if these inequalities hold and `b(L) = b(R)`.
Provide the versions with the two sides exchanged.

At `b = 1`, recover ordinary Hall and the deficiency formula, including witnesses `M, S` with `|M| + |S| = |L| + |N(S)|` and the inequality for every matching and every `S ⊆ L`.
State ordinary deficiency also for `t : ι → Finset α` with finite `ι`, using an injective choice function on the subtype of a selected set of indices in place of a matching.
The choice function is defined only on those indices, allowing the empty partial choice even when `α` is empty.
Recover Mathlib's finite theorem `Finset.all_card_le_biUnion_card_iff_existsInjective'` and the finite specialization of `SimpleGraph.exists_isMatching_of_forall_ncard_le` as compatibility checks; the latter also covers locally finite infinite graphs, which are outside this extremal development.
Mathlib's statements remain the library's Hall interfaces.
**Suggested proof:** normalize a minimum cover to `(L ∖ S) ∪ N(S)` and apply the matching–cover inequality.

### 6.9. Regular bipartite multigraphs and edge-colouring

For a finite bipartite multigraph, use the number of incident edge identities from Target 1.5 as its degree; there are no loops, and parallel edges count separately.
For `k ≥ 1`, a `k`-regular bipartite multigraph has a perfect matching and its two sides have equal size.
For every `k : ℕ`, its edge set is the disjoint union of `k` perfect matchings; when `k = 0`, the graph is edgeless and the family is empty, without requiring a perfect matching to exist.
The empty graph is included, with empty perfect matchings.
Prove that deleting a perfect matching from a `k`-regular bipartite multigraph gives a `(k − 1)`-regular bipartite multigraph on the same actual vertices, with the incidence and edge-partition formulas needed to iterate.
Derive the simple-graph results using `SimpleGraph.IsRegularOfDegree` and `Subgraph.IsPerfectMatching`.
**Suggested proof:** Hall and incidence counting, then repeated perfect-matching deletion.

A proper edge-colouring with colour type `C` assigns a colour to every actual edge, with distinct incident edges receiving different colours.
Build the simple line graph whose vertices are actual edge identities and whose adjacency means distinct edges sharing an endpoint, with adjacency lemmas and compatibility with `SimpleGraph.lineGraph`.
Express edge-colourings as colourings of this line graph, reusing `SimpleGraph.Coloring` and its relabelling and transport operations.
Use Mathlib's `Graph.Loopless` hypothesis for the common basic API, injective relabelling of colours, restriction to edge-deleted subgraphs, and the equivalence between colourings and partitions into matchings.
For every `k : ℕ`, prove **Kőnig's edge-colouring theorem** in the form: a finite bipartite multigraph admits a proper edge-colouring by `Fin k` if and only if every vertex has degree at most `k`.
Equivalently, its edges can be partitioned into `k` matchings, with empty colour classes allowed; for `k = 0` this is exactly the edgeless case.
Deduce that the least number of colours is the maximum degree, defining that maximum to be zero for an empty vertex set.
Supply simple-graph corollaries and the edge-colouring transport to the interface of [#33313](https://github.com/leanprover-community/mathlib4/pull/33313).

Build a finite regular-completion interface for `G : Graph α β` with a specified bipartition and every degree at most `k`.
Construct a finite `k`-regular bipartite `G' : Graph (α ⊕ ℕ) (β ⊕ ℕ)`, using `Sum.inl` to retain original vertex and edge identities and `Sum.inr` for additional ones.
Require `Sum.inl x ∈ V(G') ↔ x ∈ V(G)`, `Sum.inl e ∈ E(G') ↔ e ∈ E(G)`, and `G'.IsLink (Sum.inl e) (Sum.inl x) (Sum.inl y) ↔ G.IsLink e x y`.
The specified sides of `G'` must restrict along `Sum.inl` to the specified sides of `G`.
Prove that restricting to the original vertex and edge images recovers `G` through the isomorphism interface of Target 1.1; this restriction deletes added edges even when both endpoints are original vertices.
Supply the incidence inclusion and colour-restriction lemmas, so a proper colouring of `G'` pulls back to one of `G`.
**Suggested proof:** equalize side sizes with isolated vertices, pair degree deficits, then restrict a perfect-matching colouring of the completion.

**Required examples:**

- A single edge with capacity two at both ends, whose optimal multiset matching uses that edge twice and whose minimum cover has weight two.
- Zero vertex capacities and isolated vertices, and a capacitated Hall obstruction witnessed by an explicit subset of one side.
- Two vertices joined by `k` parallel edges, with `k` perfect matchings and a proper edge-colouring requiring `k` colours.
- An irregular bipartite graph, its regular completion, and the restricted colouring; also the empty and edgeless cases with zero colours.
- An isolated vertex: no perfect matching, but an empty perfect-matching decomposition and a proper colouring by `Fin 0`.

## 7. Ear decompositions and strong orientations

### 7.1. Ear decompositions as data

An open ear in a multigraph is a positive-length path adding unused edge identities, with distinct endpoints already present and all internal vertices new.
A closed ear is an undirected cycle adding unused edge identities and meeting the existing subgraph at exactly its base vertex.
Single-edge open ears, one-edge loop ears, and two-edge closed ears using distinct parallel edges are allowed.
The unused-edge condition is required for both kinds, including loops.
For a closed ear in a simple graph it follows from the cycle and vertex-intersection conditions, since every cycle edge has a new endpoint; prove this implication for the transported interface.
An ear decomposition is **data**, not merely a proposition asserting that suitable ears exist.
The multigraph decomposition starts from a single vertex or from a cycle and adds open or closed ears, recording a graph after each prefix on the same ambient vertex and edge types.
Its internal representation is not pinned: an inductive type family indexed by the graph built so far and a finite sequence with a validity proof are both suitable.
The public API must expose the initial cycle or vertex, the number and kind of ears, the `k`-th ear, and the graph after each prefix.
It must identify the zeroth and final graphs, show that each successor prefix adds exactly its displayed ear, provide prefix decompositions and an induction principle following the construction order, and prove edge coverage and preservation of the relevant connectivity property.
A decomposition of `G` has final graph `G`, covering every actual vertex and edge, including loops and all parallel edges.
Transport decompositions of `Graph.ofSimpleGraph H` to the `H.Subgraph` interface and back, preserving the prefix API; this is the simple-graph interface prototyped in `Suggested.lean`.
An open ear decomposition of a simple graph starts from a cycle and has only open ears, expressed as a predicate on the transported data.

### 7.2. Ear characterizations

Prove three characterizations:

1. A finite simple graph with at least three vertices is 2-vertex-connected if and only if it has an open ear decomposition.
   This vertex-connectivity characterization also applies to the underlying simple graph of a multigraph; it does not assert that open ears cover multigraph loops.
2. A finite multigraph with nonempty actual vertex set is 2-edge-connected if and only if it can be built from one vertex by adding open or closed ears.
   Prove first that 2-edge-connectivity is equivalent to pairwise reachability of the actual vertices and absence of bridges among the actual edges, including the empty-vertex convention for that equivalence.
   Derive the simple-graph ear characterization and `H.IsEdgeConnected 2 ↔ ∀ e, ¬ H.IsBridge e` in the shape of [#42839](https://github.com/leanprover-community/mathlib4/pull/42839).
   **Why:** `SimpleGraph.IsBridge` can hold for non-edges between components; multigraph bridges concern only actual edges.
3. A network `N` with nonempty finite vertex type and finite arrow types is strongly connected (`N.IsStronglyConnected`) if and only if it can be built from one vertex by adding directed open or closed ears, covering every arrow.

In the directed version, ears are directed paths and cycles of `N` in the sense of the conventions, they retain arrow identities, and the directed decomposition exposes the same prefix API using subnetworks.
Loops are permitted as one-arrow closed ears.
The initial-vertex convention includes the isolated singleton with no ears; relate it to the cycle-starting formulation for strongly connected networks with at least two vertices.
Derive the directed analogue of the bridge criterion: a network with nonempty vertex type that is weakly connected, meaning every two vertices are joined by a path of the symmetrized arrow family, is strongly connected if and only if every arrow lies on a directed cycle.
Give the `Digraph` ear and directed-cycle characterizations through the adapter of [Target 1.1](#11-undirected-walks-isomorphisms-and-representation-bridges).

### 7.3. Robbins' theorem

Prove **Robbins' theorem** for finite multigraphs: a strongly connected orientation on `V(G)` exists if and only if `G.IsEdgeConnected 2`.
This needs no connectedness or size hypothesis: both sides hold when the actual vertex set is subsingleton, including with loops.
For nonempty connected multigraphs, derive the classical form that a strongly connected orientation exists exactly when there is no bridge.
**Suggested proof:** orient ears and apply the directed ear characterization.
Include the componentwise result: an orientation strongly connected on each connected component exists exactly when no actual edge is a bridge.
Derive the simple-graph statements through the orientation equivalence of Milestone 1, using `TauCeti.DoubledQuiver.Orientation` in their conclusions.

**Required examples:**

- Two vertices joined by two parallel edges: edge connectivity two, a two-edge cycle and closed ear, and a strongly connected orientation, compared with the single-edge simplification.
- A loop on one vertex: a one-edge cycle and closed ear, no bridge, and no contribution to cuts.

## 8. Bounded circulations, prescribed excess, and indegree orientations

Targets 8.1–8.7 concern finite vertex and arrow types.
Only `ℓ ≤ u` is required for their bounds; both bounds and arrow values may be negative.
Develop exact-excess assignments, their circulation specialization, and bounded terminal assignments using the common network and residual constructions.
Supply extensionality, component restriction, disjoint unions, bound relaxation, arrow reversal, and transport under network isomorphisms and coefficient embeddings.
The extensionality, component, disjoint-union, and network-isomorphism API also applies to interval excess.
For componentwise feasibility, explicitly recover that the sum of prescribed excess on each underlying undirected component must be zero.

### 8.1. Signed circulation algebra and assignment shifts

On a fixed finite quiver, signed assignments with zero excess form an additive subgroup of all arrow assignments.
Prove that two assignments have the same excess exactly when their difference is a signed circulation, and that adding a signed circulation preserves excess; bounded feasible circulations themselves need not be closed under addition.
For any reference assignment `h`, construct the equivalence taking `f` to `g = f − h`, replacing the bounds by `ℓ − h, u − h` and prescribed excess by `b − excess h`; no feasibility assumption on `h` is required.
Its inverse adds `h`; prove the arrowwise identities, the excess formula, both round trips, the identity shift, and composition of shifts by adding their reference assignments.
Restrict the equivalence to exact excess and to interval excess, shifting both vertex endpoints by `−excess h` in the latter case.
Preserve values in an additive subgroup whenever the reference assignment takes values in it.
Lower-bound subtraction is the specialization `h = ℓ`, identified with the ordinary network having zero lower bounds and upper capacities `u − ℓ`.
For circulations this shifted problem generally has prescribed excess `−excess ℓ`, not zero; taking a known feasible assignment as the reference instead gives zero prescribed excess for assignments with that same excess.

**Required examples:**

- A bounded-circulation example in which flow at its lower bound cannot be cancelled, and lower-bound subtraction produces nonzero prescribed excess.
- An arbitrary reference assignment outside the original bounds, exercising the shift equivalence, and a feasible reference reducing prescribed excess to zero.

### 8.2. Feasibility and certificates

Prove **Hoffman's circulation theorem**: a feasible circulation exists if and only if, for every vertex set `S`,

$$
\ell(\delta^-(S)) \le u(\delta^+(S)).
$$

Here a bound applied to an arrow set denotes the sum over that set.
More generally, an assignment satisfying the bounds and `excess f = b` exists exactly when

$$
\sum_{v \in V} b(v)=0
\quad\text{and}\quad
\sum_{v \in S} b(v)+\ell(\delta^+(S))\le u(\delta^-(S))
\quad\text{for every }S.
$$

Positive `b` denotes demand and negative `b` supply.
Give a witness alternative: either a feasible assignment, or a nonzero total prescribed excess, or a vertex set violating the displayed inequality strictly.
For circulations the total-excess obstruction vanishes, leaving a feasible circulation or a violating Hoffman cut.
When `b` and both bounds take values in an additive subgroup `H`, prove existence with all arrow values in `H` whenever the feasibility conditions hold.
Supply the reduction to ordinary max-flow by adding auxiliary terminals and prove that saturating the required auxiliary arrows is equivalent to feasibility, preserving values in `H` in both directions.
After lower-bound subtraction, write `b' = b − excess ℓ`; add an arrow from the auxiliary source to each vertex of capacity `max (−b'(v)) 0`, and from each vertex to the auxiliary sink of capacity `max b'(v) 0`.
For balanced `b'`, prove the required flow value is `∑ v, max b'(v) 0`, and that it is attained exactly when all these auxiliary arrows are saturated.

**Required examples:**

- Signed bounds crossing zero, an arrow with two negative bounds, and a loop with equal negative bounds, exercising feasibility, reversal, and residual capacities.
- A feasible bounded assignment and a strict violating-cut certificate for an infeasible one.

### 8.3. Interval excess

For finite vertex bounds `a ≤ b`, develop assignments with `a v ≤ excess f v ≤ b v` on the same bounded-assignment carrier as exact excess.
In addition to the common API and shifts of Target 8.1, supply vertex-bound relaxation and the equal-endpoint equivalence with exact excess, preserving every arrow value.
Construct a network on the original vertices together with one fresh vertex `r`, retaining all original arrows and adding one arrow `v → r` with bounds `[a(v), b(v)]` for each original vertex.
Prove an equivalence with circulations on this network: the auxiliary arrow at `v` carries exactly the original excess at `v`, and conservation at `r` follows from total excess zero.
Prove both round trips and the original-arrow and auxiliary-arrow formulas, including for empty vertex types and loops.
Derive the following feasibility criterion from Hoffman, where `a(S)` and `b(S)` denote vertex sums:

$$
a(S)\le U(S^c)\quad\text{and}\quad -U(S)\le b(S)
\qquad\text{for every }S.
$$

Include the whole-vertex-set case `a(V) ≤ 0 ≤ b(V)` and its componentwise versions; these are necessary balance conditions, not sufficient substitutes for all cut inequalities.
Give the witness alternative of a feasible assignment or a set strictly violating one of these inequalities, and recover the exact prescribed-excess criterion when `a = b`.
When edge bounds and both vertex bounds take values in an additive subgroup `H`, derive a feasible assignment with all arrow values in `H` whenever the criterion holds, using the same circulation reduction.
These vertex bounds constrain net supply and demand; limits on total traffic through a vertex use the vertex-splitting construction instead.

**Required examples:**

- Exact excess recovered from equal interval endpoints, a feasible flexible supply-and-demand problem, and an interval-excess problem with a strict cut obstruction despite its total interval containing zero.
- Empty-vertex and loop examples for the interval-excess circulation reduction.

### 8.4. Residual adjustments

For any two feasible assignments `f, g`, construct the residual assignment with `r(e⁺) = max (g(e) − f(e)) 0` and `r(e⁻) = max (f(e) − g(e)) 0`.
Prove that updating `f` by `r`, with the common update of [Target 1.3](#13-excess-calculus-subnetworks-bounds-and-residual-updates), gives `g`, and that `excess r = excess g − excess f`.
Thus equal-excess assignments give a residual circulation as a corollary, with no second difference construction.
This canonical representative never uses both residual copies of an original arrow positively; arbitrary residual representatives need not be unique.
For equal-excess assignments, decompose this residual circulation into finitely many nonnegative directed cycle flows and prove that the corresponding sequence of updates stays feasible, has the same excess at every stage, and ends at `g`.
Preserve additive-subgroup values throughout.

**Required examples:**

- Two assignments with the same excess connected by residual cycle adjustments, and a residual update with nonzero excess verifying the general excess-change formula.

### 8.5. Flows and circulations

For any `q : K` and distinct `s,t`, construct an equivalence between bounded `s–t` assignments of value `q` and circulations on the network augmented by a fresh tagged arrow `t → s` with lower and upper bound `q`.
The new arrow is distinct from every existing arrow, even if the endpoints already support arrows.
Prove both round-trip identities, preservation of every original arrow value, and recovery of `q` on the return arrow.
For zero original lower bounds and `q ≥ 0`, specialize to the ordinary `Flow` interface.
Generalize the return-arrow bounds to an interval `[a,b]`, with `a ≤ b`, to characterize feasibility with terminal value in that interval.

### 8.6. Extremal terminal values

For distinct terminals `s,t` and a finite-bound network admitting some bounded `s–t` assignment, prove attainment of a minimum value `m` and a maximum value `M`, together with source-side cuts witnessing

$$
m=\max_{s\in S,\ t\notin S} L(S),
\qquad
M=\min_{s\in S,\ t\notin S} U(S).
$$

Do not assume that zero is feasible or that the terminal value is nonnegative.
Use the cut bounds `L` and `U` from the conventions, prove their inequalities for every feasible assignment, and characterize feasible prescribed values by `m ≤ q ≤ M`.
Prove that maximum value is equivalent to absence of a positive-capacity residual `s–t` path, and minimum value to absence of such a `t–s` path.
Give the reductions from a feasible starting assignment to the ordinary max-flow problems in the two residual directions, using the shared update and value formulas; apply the signed-bound cut lattice and canonical-cut results of Milestone 4.
If both bounds lie in an additive subgroup `H`, extrema can be attained with all arrow values in `H`; every `q ∈ H` in the feasible interval also has an `H`-valued witness.
Recover the ordinary maximum-flow theorem as the zero-lower-bound, nonnegative-value specialization.

**Required examples:**

- A return-arrow correspondence on a graph already containing an arrow from sink to source, and a bounded terminal problem whose minimum and maximum values are both negative.

### 8.7. Rounding

For a linearly ordered ring `R` with Mathlib's [`FloorRing`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Algebra/Order/Floor/Defs.html#FloorRing) structure and an `R`-valued arrow assignment whose excess at every vertex is the cast of an integer, prove existence of an integer assignment with that same integer excess and each arrow value between the floor and ceiling of its original value.
Deduce preservation of any integer lower and upper bounds respected by the original assignment, and specialize to circulations and flows of integer prescribed value.
**Suggested proof:** apply integrality to the image of `ℤ → R` with floor and ceiling bounds, then lift through the injective cast.
State rational and real specializations; the ring and floor structure are assumptions of this rounding target, not of the general flow theory.
No rounding assertion is made for noninteger prescribed excess.

**Required examples:**

- Rational and real fractional circulations and their integer roundings, with explicit floor and ceiling bounds.

### 8.8. Prescribed and bounded indegree orientations

Let `G` be a finite multigraph, allowing loops and parallel edges, and let `o` be an orientation in the sense of Milestone 1.
Define `indegree(o,v)` to count actual edges whose chosen head is `v`; a loop contributes one.
Use the incidence API of Target 1.5: `E(S)` is the set of actual edges with both endpoints in `S`, and `I(S)` is the set of actual edges with at least one endpoint in `S`, each edge counted once.
For a natural-valued vertex function `d`, write `d(S) = ∑ v ∈ S, d(v)`.
Supply the indegree and outdegree sum identities, restriction under edge deletion, reversal exchanging indegree and outdegree, disjoint-union formulas, and transport through the simple-graph orientation equivalence.
In particular, `∑ v, indegree(o,v) = |E(G)|`, including loops.

Prove **Hakimi's prescribed-indegree theorem**: an orientation with `indegree(o,v) = d(v)` for every vertex exists if and only if

$$
d(V(G)) = |E(G)| \quad\text{and}\quad |E(S)| \le d(S) \text{ for every } S \subseteq V(G).
$$

For bounds `a, b : V(G) → ℕ` with `a ≤ b` pointwise, prove the **bounded-indegree theorem**: an orientation satisfying `a(v) ≤ indegree(o,v) ≤ b(v)` for every vertex exists if and only if

$$
|E(S)| \le b(S) \quad\text{and}\quad a(S) \le |I(S)| \text{ for every } S \subseteq V(G).
$$

Recover the exact theorem at `a = b = d`, proving that the total balance and internal-edge inequalities imply the incident-edge inequalities by complementation.
State the upper-bound corollary: an orientation with `indegree(o,v) ≤ b(v)` exists exactly when `|E(S)| ≤ b(S)` for every `S`.
State the lower-bound corollary with `a(S) ≤ |I(S)|`, and derive the corresponding outdegree versions by reversal.
Give witness alternatives: an orientation satisfying the requested bounds or a vertex set strictly violating one of the inequalities; for prescribed indegrees, also allow failure of the total balance.
No connectivity condition is imposed on the orientation.

Build the edge-to-endpoint assignment reduction over `ℤ` as a reusable interface.
Use one node for each actual edge and one node for each actual vertex, with a capacity-one arrow from an edge node to each of its distinct endpoints; a loop therefore has one such arrow.
Prescribe excess `−1` at every edge node and excess in `[a(v), b(v)]` at each vertex node.
Prove a bijection between integral feasible assignments and orientations satisfying these bounds, recovering each chosen head from the unique outgoing unit at its edge node.
Supply both round trips, the arrow-value and indegree formulas, and the reduction of the feasibility inequalities to the two displayed families.
Derive feasibility and integrality from Targets 8.2 and 8.3; the exact and upper-bound specializations share this construction.

**Required examples:**

- A loop contributing one to indegree and two parallel edges with independently chosen heads.
- A prescribed-indegree function satisfying every internal-edge inequality but failing the total balance, so that no realizing orientation exists.
- Feasible unequal lower and upper bounds, and examples witnessing each of the two kinds of subset obstruction.
- Empty graphs and isolated vertices, including the forced indegree zero at an isolated vertex.

## 9. Gomory–Hu cut trees

For every linearly ordered cancellative additive commutative monoid `K`, every nonempty finite vertex type, and every symmetric submodular `f : Finset V → K`, prove the existence of a weighted tree on the same vertex type such that:

1. For any distinct vertices `s, t`, their minimum cut value for `f` is the minimum edge weight along their unique tree path.
2. For every tree edge `{u,v}`, deleting that edge gives a partition that is a minimum `u–v` cut for `f`, with value equal to the tree-edge weight.

Prove the resulting query theorem: any minimum-weight edge on the tree path from `s` to `t` yields an actual minimum `s–t` cut by deleting that edge.
Prove the **threshold partition**: deleting tree edges of weight below `k : K` leaves distinct `s, t` connected exactly when `λ(s,t) ≥ k`.
Its components are the classes of the equivalence relation `s = t ∨ λ(s,t) ≥ k`; the equality disjunct is needed because `λ(s,s) = 0`.
For unit capacities, identify them with the local `k`-edge reachability classes of Milestone 5.
State the instances for weighted multigraphs and pair-capacity networks as corollaries, using the cut aggregation theorem of Milestone 1.
The weighted tree is a `SimpleGraph` on the actual vertex type `V(G)` and need not be a subgraph of the original graph.
For unit capacities, parallel edges contribute their multiplicities; prove that the tree answers the edge-connectivity queries of Milestone 5 and recovers cuts as subsets of the original vertex set.
For at least two vertices, also prove that the minimum of `f(S)` over nonempty proper subsets `S` is the minimum tree-edge weight, and that deleting any edge of minimum weight yields an attaining partition.
Derive the global corollaries: for a finite graph with at least two actual vertices, `edgeConnectivity G` is the minimum tree-edge weight, and for any symmetric submodular `f` the minimum cut values `λ(s,t)` over `s ≠ t` take at most `|V| − 1` distinct values, since each is a tree-edge weight.
Disconnected graphs and zero capacities are included, with zero-weight tree edges; a singleton has the one-vertex tree.
The general cut-tree theorem and minimum-cut recovery use Targets 4.1 and 4.3; Milestone 5 is needed only to interpret the unit-capacity queries as edge connectivity.

Develop the weighted-tree API needed for these statements: unique paths, fundamental partitions, minimum weights on nonempty paths, and transport under vertex equivalences.

> **Suggested proof:** use the contraction-free Gomory–Hu construction, maintaining non-crossing minimum cuts and a tree on their cells.
> Apply Target 4.3 to split a cell; preserve the invariant that each tree edge represents a minimum cut between witnesses in its incident cells, repairing witnesses after rewiring via the ultrametric inequality.
> See Korte–Vygen §8.6 for witness repair and Gusfield for the construction.
> This route uses only finiteness, symmetry, and submodularity, so it applies at the stated coefficient generality.

**Required examples:**

- A disconnected weighted graph whose cut tree contains zero-weight edges.

## Scope boundaries

This roadmap owns graph connectivity, components, separators, cuts, flows, and the representation bridges between `Graph`, `SimpleGraph`, orientations, and networks.
Roadmaps that need `k`-vertex-connectivity for a fixed `k`, such as 3-connectivity in topological graph theory, use `IsVertexConnected k` from here rather than a second connectivity or component theory.
Incidence counts, indegree and outdegree for orientations, and the matching and edge-colouring API required by the bipartite targets are in scope.
The roadmap does not develop unrestricted multigraph degree or colouring theory.

The following are outside scope:

- General matching theory beyond the bipartite targets, arbitrary-profit matching, minimum-cost flows and circulations, general-graph edge-colouring, and list edge-colouring.
- Dilworth's theorem, completion of partial orientations to strong orientations (mixed Robbins), Nash-Williams' orientation theorem for `2k`-edge-connected graphs, Edmonds' disjoint arborescences, and the Nash-Williams–Tutte disjoint spanning tree theorems.
- Networks with infinite capacities, multicommodity flows, algorithmic complexity bounds, and condensation into strong components.
- Extremal, flow, and ear-decomposition theory with infinitely many actual vertices, beyond the finiteness-free foundations of Milestones 1 and 2, and edge-counting or flow theories with infinite edge sets.
- General graph contractions, contractible-edge and wheel theorems, treewidth, drawings, planar embeddings, and surface topology.

## Mathematical references

- Reinhard Diestel, *Graph Theory*, Chapter 3, for connectivity, Menger, blocks, fans, and ears; see the [author's book site](https://diestel-graph-theory.com/).
- Dimitri P. Bertsekas, [*Linear Network Optimization*](https://www.mit.edu/~dimitrib/LNets_Full_Book.pdf), §1.1.3 and Exercises 2.4–2.6 of §1.2, for bound transformations, feasibility, and rounding.
- Alexander Schrijver, *Combinatorial Optimization: Polyhedra and Efficiency*, Volume A, for flows, cuts, disjoint paths, circulations, and cut trees; see the [author's book page](https://homepages.cwi.nl/~lex/co/).
- Bernhard Korte and Jens Vygen, *Combinatorial Optimization: Theory and Algorithms*, Section 8.6, for the Gomory–Hu construction and the witness-repair step of its correctness proof.
- Jørgen Bang-Jensen and Gregory Gutin, *Digraphs: Theory, Algorithms and Applications*, for directed connectivity, directed ears, and network flows; see the [second edition](https://doi.org/10.1007/978-1-84800-998-1).
- Dan Gusfield, [*Very Simple Methods for All Pairs Network Flow Analysis*](https://doi.org/10.1137/0219009), SIAM Journal on Computing 19 (1990), 143–155, for the contraction-free cut-tree construction.
- András Frank and András Gyárfás, [*How to orient the edges of a graph?*](https://www.renyi.hu/~gyarfas/Cikkek/09_FrankGyarfas_HowToOrientTheEdgesOfAGraph.pdf), for orientation degree bounds; loops in Target 8.8 contribute forced units at their vertices.
