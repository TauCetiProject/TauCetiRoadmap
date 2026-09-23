# Finite graph connectivity and network flows

This roadmap develops finite graph connectivity and network flows through two complementary theories: the structure of connected graphs, and the duality between disjoint paths and separating cuts.
The main results are Menger's theorem, the block–cut forest, ear decompositions, Robbins' strong orientation theorem, max-flow/min-cut with integrality, Hoffman's circulation theorem, and Gomory–Hu cut trees.
The supporting library includes separators, path families, orientations, residual networks, flow decomposition, and minimum-cut structure.
These objects must have reusable APIs, including transport between the graph representations used by their consumers.

The structural development runs through blocks, connectivity consequences, and ears.
The quantitative development runs through flows, minimum cuts, and disjoint paths, then supports bipartite matching, bounded circulations, and cut trees.
The undirected theory uses Mathlib's `Graph`, retaining loops and parallel edges, with corollaries in `SimpleGraph`; vertex connectivity is that of the underlying simple graph, and the directed-network and cut-function theories are independent of this choice.
All multigraph targets have finitely many actual vertices, and the [conventions](#graphs-networks-and-orientations) say which also need finitely many actual edges.

**Suggested homes:** `TauCeti/Combinatorics/Graph/Connectivity/` for multigraph connectivity, `TauCeti/Combinatorics/SimpleGraph/Connectivity/` for simple-graph interfaces, `TauCeti/Combinatorics/Network/` for directed networks and flows, and adjacent modules for the representation bridges.

[`Suggested.lean`](Suggested.lean) prototypes networks, flows, circulations, the vertex-splitting and auxiliary-terminal reductions, multigraph walks and connectivity with their simple-graph interfaces, and weighted cut trees.
These are suggested forms, never an exhaustive checklist; this document is the specification.

## Milestones at a glance

| Milestone | Main results | Depends on |
| --- | --- | --- |
| 1. Shared foundations | Walks and representation bridges (1.1), cuts and path families (1.2), excess calculus and residual updates (1.3), splitting and auxiliary terminals (1.4), deletion predicates and invariants (1.5) | Existing Mathlib and Tau Ceti APIs |
| 2. Bridges and blocks | Multigraph bridges; cut-vertex criteria and block–cut forest | 1 |
| 3. Flows | Decomposition, augmentation, max-flow/min-cut, integrality, and termination (3.1), large capacities (3.2), terminal sets and undirected networks (3.3), real-valued corollaries (3.4) | 1 |
| 4. Minimum cuts | Terminal-set cut lattices (4.1), canonical cuts (4.2), and non-crossing lemmas (4.3) | 1 for 4.1 and 4.3; 1, 3 for 4.2 |
| 5. Menger | Path–separator duality (5.1) and the reductions to max-flow (5.2) | 1, 3, 4 |
| 6. Connectivity and matching consequences | Whitney inequalities and cycle criteria, preservation lemmas, fans, Dirac's cycle theorem, Kőnig and Hall | 2, 5 |
| 7. Ears and orientations | Undirected and directed ear decompositions; Robbins' theorem | 2, 6 |
| 8. Circulations and bounded flows | Hoffman and infeasibility certificates, exact and interval excess, assignment shifts, residual adjustments, extremal terminal values, integrality, and rounding | 3, 4 |
| 9. Cut trees | Gomory–Hu and recovery of minimum cuts; edge-connectivity queries | 4.1, 4.3 for cut trees; 5 for edge-connectivity queries |

Each milestone includes the elementary lemmas needed to use its definitions: constructors, extensionality where appropriate, membership and support lemmas, monotonicity, restriction, and invariance under isomorphism.
The targets below specify the additional API particular to each object.
The examples attached to each milestone or numbered target are required proved examples.

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

The following Mathlib proposals guide the corresponding interfaces:

- [#33355: vertex connectivity](https://github.com/leanprover-community/mathlib4/pull/33355): deletion-based `IsVertexReachable`, `IsVertexPreconnected`, and `IsVertexConnected`.
- [#42494: numerical edge connectivity](https://github.com/leanprover-community/mathlib4/pull/42494): `edgeReachability`, `edgeConnectivity`, their supremum definitions, and degree bounds.
- [#36756: shared walks](https://github.com/leanprover-community/mathlib4/pull/36756) and [#39053: the `Graph` instance](https://github.com/leanprover-community/mathlib4/pull/39053): `GraphLike.Walk` with vertex support and darts, following the [HasAdj discussion](https://leanprover.zulipchat.com/#narrow/channel/252551-graph-theory/topic/HasAdj/with/575843445).
  This roadmap's `Graph.Walk` has the shape of their walk type, specialized to `Graph` without the `GraphLike` class and with the API of `SimpleGraph.Walk`; Milestone 1 proves its compatibility with `SimpleGraph.Walk` and with the directed quiver paths.
- [#43017: network flows](https://github.com/leanprover-community/mathlib4/pull/43017): quivers with capacities and flow assignments indexed by arrows.
- [#34028: weak max-flow/min-cut duality](https://github.com/leanprover-community/mathlib4/pull/34028): an undirected flow formulation on simple graphs.
  Undirected flow applications use the bidirected network, with no separate undirected flow type, so this roadmap takes only the statement shapes from that proposal.
- [#33032: Kőnig's theorem](https://github.com/leanprover-community/mathlib4/pull/33032): matchings as subgraphs, vertex covers, and the equality between the sizes of maximum matchings and minimum covers.
- [#42839: 2-edge-connectivity and bridges](https://github.com/leanprover-community/mathlib4/pull/42839): `G.IsEdgeConnected 2 ↔ ∀ e, ¬ G.IsBridge e`, the simple-graph specialization in Milestone 7.
- [#37861: connected `Graph`s](https://github.com/leanprover-community/mathlib4/pull/37861): connectivity of Mathlib's multigraph type through connected components as subgraphs, defined without walks; Milestone 1 proves agreement with walk reachability.
- [#38337: unions of `Graph`s](https://github.com/leanprover-community/mathlib4/pull/38337): the union of compatible subgraphs, used when adding ears.

Build all missing prerequisites and results in Tau Ceti, following these interfaces and adopting Mathlib's resulting design when available.
An unmerged proposal is a design reference, not a dependency that contributors must wait for.
For flows, follow [#43017](https://github.com/leanprover-community/mathlib4/pull/43017) for the explicit quiver and separate capacity parameters, `PseudoFlow` and `Flow`, incoming-minus-outgoing excess, and nonnegative value at the sink.
The finite theory generalizes the coefficient type and uses finite sums; network interfaces reuse the unbundled definitions, with no separate bundled flow theory.
The precise compatibility target is [3.3](#33-mathlib-flow-compatibility).

The [Lean Zulip discussion of max-flow/min-cut](https://leanprover-community.github.io/archive/stream/252551-graph-theory/topic/max-flow.20min-cut.20help.html) records earlier quiver-based formalization work, including [maxflowmincutlean4](https://gitlab.com/Shreyas941/maxflowmincutlean4).
Coordinate with authors before integrating existing code, following the repository's porting policy.
The mathematical targets here do not require importing that implementation.

## Conventions

### Graphs, networks, and orientations

**Undirected graphs** use `G : Graph α β`, with actual vertices `V(G) ⊆ α` and edges `E(G) ⊆ β`.
The ambient types need not be finite: finiteness hypotheses concern the subtypes `V(G)` and `E(G)`, with `Fintype` instances on these subtypes when taking finite sums.
A **finite graph** has finite `V(G)` and finite `E(G)`; every multigraph target assumes a finite graph except the vertex-only targets, which assume only `[Finite V(G)]`.
The vertex-only targets are vertex connectivity and its invariant, cut vertices and vertex blocks, nonadjacent local vertex Menger, vertex-disjoint set-to-set Menger, and the vertex-structural consequences of Milestone 6; their parallel-edge sets may be infinite, and their proofs pass through simplification and lift finite path families by choosing actual edge witnesses.
Directed flow and Menger reductions use finite vertex and arrow types.
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
The finite-bound theory is parameterized by a linearly ordered additive commutative group `K`, expressed by `[AddCommGroup K] [LinearOrder K] [IsOrderedAddMonoid K]`.
The cut-function theory of Targets 4.1 and 4.3 and Milestone 9 never subtracts and is stated over a linearly ordered cancellative additive commutative monoid, `[AddCommMonoid K] [LinearOrder K] [IsOrderedCancelAddMonoid K]`, so that `ℕ` and `ℝ≥0` are instances alongside these groups; Target 4.2 uses the group.
It must not assume a unit, multiplication, division, an Archimedean property, topology, or order completeness; in particular, the same theory applies to `ℤ`, `ℚ`, and `ℝ`.
A network `N : Network K V` carries an arrow type `N.Hom v w` for every ordered pair of vertices.
Its arrow universe is independent of the vertex universe, as for `Quiver.{v}`.
Each arrow has lower and upper bounds `ℓ, u` in `K`, with a proof of `ℓ ≤ u`.
Finiteness is expressed by `[Fintype V]` and `[∀ v w, Fintype (N.Hom v w)]`.
Bounds may be negative.
An ordinary network is the specialization `ℓ = 0` of this same structure, constructed from nonnegative upper capacities; provide a constructor and simplification lemmas, not a second network type.
Neither the representation nor its bound-order invariant requires a finite graph; the theorem targets here impose the specified finiteness assumptions.
Define arrow assignments, excess, and cut capacity against an explicit arrow family `Hom : V → V → Type`, with bounds as separate parameters where needed; a `Quiver` term is never a parameter, because instance search for `Fintype (Hom v w)` does not see through `Quiver.mk`.
The network bundle exposes these definitions and bounded-assignment types through abbreviations, so bundled and unbundled networks share the same objects and theorems.
The ordinary `PseudoFlow` and `Flow` interfaces use the zero-lower-bound specialization and follow the cited Mathlib proposal.
Directed walks use Mathlib's [`Quiver.Path`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Combinatorics/Quiver/Path.html#Quiver.Path), with the quiver argument supplied explicitly from the arrow family, as in `@Quiver.Path V ⟨N.Hom⟩ s t`.
Networks and orientations share this carrier and reuse its length, composition, vertex-list, and transport API; add the missing simple-path and cycle predicates using `Quiver.Path.vertices`.
Strong connectivity is Mathlib's [`Quiver.IsStronglyConnected`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Combinatorics/Quiver/ConnectedComponent.html#Quiver.IsStronglyConnected) with the same explicit quiver argument.
Abbreviations may expose these operations through the network or arrow family, so several quivers coexist on `V` without competing instances or vertex-type synonyms.
The total arrow type is the dependent sum of the arrow types over ordered pairs of vertices.
Parallel arrows, arrows in opposite directions, loops, and zero capacities are allowed.
A bounded assignment is an arrow assignment `f` with `ℓ ≤ f ≤ u` on every arrow; neither conservation nor nonnegative arrow values are part of bounded feasibility.
All bounds are finite.
An arrow that must never be cut receives a capacity exceeding a known cut, and [Target 3.2](#32-large-capacities) shows that capping capacities at such a bound changes no minimum cut.
An ordinary `PseudoFlow` is a `K`-valued arrow assignment with proofs of nonnegativity and capacity boundedness, without a conservation condition.
A `Flow s t` adds conservation away from the terminals and nonnegative excess at the sink.
Every network sum is a `Finset.sum`; excess and flow value take values in `K`, with excess allowed to be negative and ordinary flow value required to be nonnegative.
General bounded terminal assignments have no sign restriction on their terminal value; the ordinary `Flow` type remains its nonnegative-value, zero-lower-bound specialization.
The finite theory must not require reasoning about infinite sums or infinite capacities to state its results.
Follow [#43017](https://github.com/leanprover-community/mathlib4/pull/43017)'s incoming-minus-outgoing `excessAt` and sink-value `Flow.val` conventions.
Its coefficient-generic ordinary specialization uses nonnegative capacities and arrow flows in `K`, with finite sums in `K`, in place of the proposal's `ℝ≥0` capacities and arrow flows, `EReal` excess by `tsum`, and `ENNReal` value.

**An orientation** of `G : Graph α β` orders the ends of each edge, with one directed arrow per edge identity and no additional arrows.
A loop gives one directed loop; it has a unique ordered pair of ends.
Its directed walks use the resulting arrow family on `V(G)`.
Simple-graph orientations use the existing `TauCeti.DoubledQuiver.Orientation H`, whose carrier contains exactly one dart from each reversed pair, and its `OrientedQuiver`.
The bidirected network has zero lower bounds and one arrow in each direction for every nonloop edge and one loop arrow for every loop, with the original edge's capacity on each arrow.
Milestone 1 identifies both constructions with the existing simple-graph interfaces and supplies their transport lemmas.

**Namespaces.** Undirected multigraph declarations extend `Graph` and the shared walk API in the shapes of the cited proposals.
Simple-graph declarations extend `SimpleGraph`, following [#33355](https://github.com/leanprover-community/mathlib4/pull/33355) and [#42494](https://github.com/leanprover-community/mathlib4/pull/42494) for connectivity; orientation results extend the existing Tau Ceti orientation namespace.
`Suggested.lean` keeps stand-ins for proposed definitions outside the Mathlib namespaces so that this repository keeps building when Mathlib lands them.
`Suggested.lean` prototypes `Graph.Walk` and its equivalence with the bidirected quiver paths under the names the implementation uses.

### Paths, separators, and connectivity

**Undirected walks** are `G.Walk u v`, an inductive type indexed by the ambient vertex type, with constructors `nil` at any point and `cons e h p` for `h : G.IsLink e u v`; a walk therefore retains the identity of each traversed edge, and a loop is traversed in only one way.
Its API follows `SimpleGraph.Walk`: `support`, `edges`, `length`, `append`, `reverse`, `IsPath`, `IsCycle`, splitting at a vertex, the traced subgraph, and transport along `≤` and graph isomorphisms.
Every vertex on a walk of positive length is an actual vertex; reachability requires actual vertices as endpoints, so a zero-length walk at a point outside `V(G)` witnesses nothing.
The bidirected quiver of `G` has one arrow `s → t` for each edge `e` with `G.IsLink e s t`, so a nonloop edge gives two opposite arrows and a loop gives one.
Walks between actual vertices are equivalent to its `Quiver.Path`s, preserving length, vertex sequence, and edge sequence; the flow reductions of Milestone 5 return undirected paths through this equivalence.
Paths have no repeated vertices.
An undirected cycle is a positive-length closed walk with no repeated vertices apart from its endpoints and no repeated edge identities.
Thus a loop is a one-edge cycle and two distinct parallel edges form a two-edge cycle; traversing the same edge out and back is not a cycle.
Directed paths are directed walks with no repeated vertices.
Directed cycles have positive length and no repeated vertices apart from the coinciding endpoints.
Path families are finite and contain distinct paths.
Edge-disjointness concerns identities in `E(G)` for a multigraph, unordered edges for a simple graph, and actual arrow identities in a network.
Internally vertex-disjoint paths between distinct terminals may share only those terminals.
In particular, a family cannot count the same single-edge path repeatedly merely because it has no internal vertices.

A local vertex separator for distinct terminals `s, t` excludes both terminals and destroys reachability after deletion.
The local vertex form of Menger therefore assumes that `s` and `t` are nonadjacent; in the directed case, there must be no arrow from `s` to `t`.
Deletion-based local vertex reachability for adjacent terminals can hold for every `k`, so it must not be identified with the number of internally disjoint paths without that qualification.
Milestone 5 also gives the adjacent-terminal version, counting all direct parallel edges, and its simple-graph specialization.

For vertex-disjoint paths between sets `A` and `B`, separators may meet `A ∪ B`.
Paths have one endpoint in each set, their interiors avoid `A ∪ B`, and the paths are disjoint including endpoints.
A vertex in `A ∩ B` contributes a permitted zero-length path and must belong to every separator.
There is no prescribed pairing of the endpoints.
For the edge-disjoint set-to-set version, require `A` and `B` to be disjoint; paths may share endpoints.

Multigraph reachability is defined by walks.
Vertex-reachability and vertex-connectivity are those of `G.toSimpleGraph`, following [#33355](https://github.com/leanprover-community/mathlib4/pull/33355).
Milestone 1 supplies the reachability and deletion bridges, and Milestone 5 supplies disjoint-path witnesses.
In particular, global `k`-vertex-connectivity includes `k < |V(G)|`.
Define `G.IsEdgeReachable k s t` by reachability after deleting any set of fewer than `k` actual edges, and `G.IsEdgeConnected k` by that condition for every pair of actual vertices.
Edge connectivity counts actual edges, including their multiplicities; it is not defined through simplification.
Use natural-number thresholds, coerced where an upstream predicate takes `ℕ∞`.
The predicates are the primary interface, but also define derived numerical invariants `vertexConnectivity G`, `edgeConnectivity G`, and `edgeReachability G s t` in `ℕ∞` as the suprema of the natural thresholds at which the corresponding predicates hold, following [#42494](https://github.com/leanprover-community/mathlib4/pull/42494) for the edge invariants.
Vertex connectivity is zero on the empty vertex set.
On a subsingleton actual vertex set, edge connectivity is `⊤` and vertex connectivity is zero.
Bounds by incident-edge counts or minimum degree assume at least two actual vertices.
Milestone 1 supplies the threshold equivalences and representation compatibility for these invariants.

### Flows and bounded circulations

Write `δ⁺(S)` for arrows leaving a vertex set and `δ⁻(S)` for arrows entering it.
For an arrow assignment `f`, excess is incoming flow minus outgoing flow.
An ordinary `s–t` flow satisfies `0 ≤ f ≤ u`, has zero excess away from distinct terminals `s` and `t`, and has nonnegative excess at `t`.
Its value is the excess at `t`, equivalently minus the excess at `s`.
Excess is defined on arbitrary arrow assignments, and conservation is a predicate independent of the flow structure.
Milestone 1 supplies terminal exchange in the ordinary `Flow` interface; general signed bounds use the bounded terminal assignments below.
A cut is a source side `S` with `s ∈ S` and `t ∉ S`, of capacity `u(δ⁺(S))`.
Arrows entering the source or leaving the sink are allowed.

Bounded circulations have finite signed lower and upper bounds `ℓ ≤ u`, satisfy `ℓ ≤ f ≤ u`, and have zero excess at every vertex.
More generally, bounded assignments with prescribed excess `b` satisfy `excess f = b`; a circulation is the specialization `b = 0`.
Keep this equality-based interface, and also express interval excess by `a v ≤ excess f v ≤ b v` on the same bounded assignments.
Vertex constraints are separate parameters, not fields of `Network`; Target 8.3 relates equal-endpoint intervals to exact prescribed excess.
A bounded `s–t` assignment has zero excess away from distinct terminals, with value `excess f t` of either sign.
Ordinary flows and bounded circulations share arrow assignments, excess, and bound calculations, but have separate conservation conditions.
Milestone 8 supplies named reductions from bounded circulation feasibility to ordinary max-flow, including their integrality properties.

For every feasible assignment `f` with finite bounds on `N`, its residual network has the same vertex type, arrow type `N.Hom v w ⊕ N.Hom w v` from `v` to `w`, zero lower bounds, and upper capacity `u e − f e` on a forward arrow and `f e − ℓ e` on a reverse arrow.
The arrow type does not depend on `f`: arrows of zero residual capacity are ordinary arrows, and an augmenting path is a residual path all of whose arrows have positive residual capacity, equivalently a path in the positive-capacity subnetwork of the residual network, which is how `Suggested.lean` states residual reachability.
A residual type that carried the positivity conditions would change with every augmentation, and the termination and canonical-cut arguments would then transport paths across type equalities at every step.
The two summands distinguish unused forward capacity from cancellation of an existing flow, including when original arrows exist in both directions.
For ordinary flows `ℓ = 0`, so reverse residual capacity is `f e`.
For finite bounds, the source-side cut bound is `U(S) = u(δ⁺(S)) − ℓ(δ⁻(S))`; its corresponding lower bound on terminal value is `L(S) = ℓ(δ⁺(S)) − u(δ⁻(S)) = −U(Sᶜ)`.
Ordinary directed cut capacity is the case `ℓ = 0` of `U`; undirected weighted cuts retain their existing nonnegative-capacity conventions.

## 1. Shared foundations

This milestone builds the objects every later milestone uses.
Its subsections are independent of one another except where stated, so they can be claimed separately.

### 1.1. Undirected walks, isomorphisms, and representation bridges

Build `Graph.Walk` as pinned in the conventions, with the API of `SimpleGraph.Walk`, and adopt Mathlib's shared walk type when it lands.
Supply vertex support, edge occurrences, length, concatenation, reversal, restriction, transport, path extraction, cycles, and the corresponding graph subobjects.
Supply the graph-isomorphism interface needed for transport: equivalences of the actual vertex and edge sets preserving `IsLink`, with identity, inverse, composition, and their action on walks and subgraphs, reusing Mathlib's graph maps and any available isomorphism API.
Supply the union of compatible subgraphs of a fixed graph, with vertex-set and edge-set union formulas and the inherited incidence relation, as needed when adding ears; follow [#38337](https://github.com/leanprover-community/mathlib4/pull/38337) for the general union interface.
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
  Prove compatibility with the component-based connectivity of [#37861](https://github.com/leanprover-community/mathlib4/pull/37861), including nonemptiness in `Connected` and the correspondence of components.
  Vertex-connectivity statements may then use the underlying simple graph while returning native path witnesses through the lifting API.

**Orientations and bidirected networks.** Transport walks and paths, identify the underlying undirected graph of an orientation, and prove reachability and cut-capacity correspondence for the bidirected construction.
Match oriented walks with exactly those undirected walks traversing every edge in its chosen direction; arbitrary undirected reachability need not imply directed reachability.
Prove the equivalence between orientations of `Graph.ofSimpleGraph H` and `TauCeti.DoubledQuiver.Orientation H`, preserving directed walks and strong connectivity through `OrientedQuiver`.
Identify the bidirected construction on a simple graph with its existing `DoubledQuiver` equipped with capacities.

### 1.2. Cuts, separators, and path families

Develop multigraph cuts and separators with membership lemmas, complements, restriction to induced subgraphs, edge and vertex deletion, and invariance under graph isomorphisms.
A cut is a subset of the actual vertices; its boundary is the set of actual edges with one endpoint on each side.
Prove symmetry, absence of loops from the boundary, and the cardinality and capacity formulas with parallel edges.
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
Its vertex type is `W`; deleting arrows alone while retaining all of `V` gives only the special case of a spanning subnetwork.
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
  For a nonnegative assignment, conservation at both copies of a nonterminal vertex is equivalent to original conservation and to the split-arrow value equalling both total incoming and total outgoing flow there.
  Specify the corresponding terminal excess formulas and prove that a split-arrow capacity bounds total traffic through that vertex.
- **Auxiliary terminals:** add a fresh source `σ` and sink `τ` on a sum type, retaining all original arrows with their identities, with one arrow `σ → a` for each `a ∈ A` and one arrow `b → τ` for each `b ∈ B`.
  The terminal sets `A, B` are arbitrary, including empty, and the capacities of the new arrows are parameters.
  Prove that a `σ–τ` path consists of a `σ`-arrow, an `A–B` path, and a `τ`-arrow, and that the capacity of a `σ–τ` cut is the capacity of the new arrows it crosses plus the original cut capacity of its restriction to `V`.
  Combine with vertex splitting for the vertex-disjoint versions, where the new arrows are `σ → a⁻` and `b⁺ → τ`.
- **Change of coefficients:** map networks, assignments, flows, residual capacities, and cuts along order-preserving additive group homomorphisms, including the standard embeddings `ℤ → ℚ → ℝ`.

### 1.5. Deletion predicates and numerical invariants

For the deletion predicates, supply the lemmas missing from Mathlib and from [#33355](https://github.com/leanprover-community/mathlib4/pull/33355), following their shapes: threshold monotonicity, graph monotonicity on a fixed carrier, isomorphism invariance, the zero and one cases, and the relationship between local and global statements.
`IsEdgeReachable.mono` and `isEdgeReachable_one` already exist and are reused.
Global graph monotonicity for multigraphs requires the same actual vertex set, not merely the same ambient vertex type.
Prove agreement of the native edge predicates with the existing `SimpleGraph` predicates on `Graph.ofSimpleGraph`.
Include the local threshold equivalence for `edgeReachability`, its symmetry, its value `⊤` on the diagonal, and its comparison with global edge connectivity and the number of incident nonloop edges.
Prove agreement of the numerical vertex invariant with that of the underlying simple graph and of the edge invariants with those on `Graph.ofSimpleGraph`.
Milestone 5 identifies the local edge invariant with unit-capacity multigraph minimum cuts for distinct terminals.
For every graph with finite nonempty actual vertex set, prove `G.IsVertexConnected k ↔ k ≤ G.vertexConnectivity`.
Prove `G.IsEdgeConnected k ↔ k ≤ G.edgeConnectivity` for every finite graph, in the sense of the conventions, including the empty graph.
On a subsingleton actual vertex set `IsEdgeConnected k` holds for every `k` and `IsVertexConnected k` fails for every `k ≥ 1`; keep both conventions, and let upper bounds using incident-edge counts or minimum degree assume at least two actual vertices.
Consequently, for finite graphs edge connectivity is `⊤` exactly when the actual vertex set is subsingleton, whereas vertex connectivity is always finite.

**Required examples:**

- Empty graphs, isolated vertices, and the two-vertex single-edge graph, exercising the size conventions.
- A finite multigraph on infinite ambient types, verifying that finiteness hypotheses concern only its actual vertices and edges.
- Weighted multigraph aggregation with parallel edges, loops, and zero-capacity edges, and pair capacities with nonzero diagonal entries, proving the specified cut invariance.
- Bounded assignments with negative bounds, and integer assignments carried to real bounds by change of coefficients.
- A singleton subnetwork inside a network with several vertices, verifying that its own vertex type is a singleton and its connectivity does not quantify over omitted vertices.

## 2. Bridges, cut vertices, and blocks

For a multigraph, a bridge is an actual edge whose deletion disconnects its endpoints.
Prove equivalence with increasing the number of connected components by exactly one and with lying on no undirected cycle.
Loops are never bridges, and an edge with a distinct parallel edge is not a bridge.
Prove correspondence on actual edges of `Graph.ofSimpleGraph H` with Mathlib's `SimpleGraph.IsBridge` and its `isBridge_iff_forall_cycle_notMem`; membership matters because the simple-graph predicate can also hold for a non-edge joining different components.

Articulation vertices and the block–cut forest use the underlying simple graph and its existing reachability and induced-subgraph APIs.
An cut vertex `v` is one that separates two other vertices: some `u, w ≠ v` are reachable in `G` but not in the graph induced on the complement of `{v}`.
Prove that this is equivalent to deletion of `v` increasing the number of connected components, by one or more; the count is a lemma rather than the definition, so no statement needs a `Fintype` instance on a deletion subtype.

A block is a maximal nonempty connected induced subgraph with no cut vertex of its own.
For simple graphs, bridges that are edges give two-vertex blocks, and isolated vertices give singleton blocks.
Prove that every simple-graph edge belongs to exactly one block, distinct blocks meet in at most one vertex, and a vertex lies in more than one block exactly when it is an cut vertex.
Transport these vertex blocks and cut-vertex criteria to multigraphs through simplification.
Every nonloop multigraph edge belongs to exactly one vertex block, but a two-vertex block may contain parallel edges and need not consist of a bridge.
A singleton block may carry loops; a loop at an cut vertex lies in every induced vertex block containing that vertex, so these vertex blocks do not partition loop edges.

Construct the **block–cut incidence graph**, whose two kinds of vertices are blocks and cut vertices, with adjacency given by membership.
Prove that it is a forest, that its components correspond to the components of the original graph, and that it is a tree when the original graph is connected.
Include the path correspondence that recovers separation in the original graph from the unique paths in this forest.

**Required examples:**

- Paths and cycles, including their bridges, blocks, and connectivity predicates.
- Two triangles meeting at one vertex, with its explicit block–cut tree, and a loop at the common vertex demonstrating the vertex-block convention.

## 3. Flows and max-flow/min-cut

### 3.1. Finite flows and assignment decomposition

The source–sink max-flow targets in this milestone use zero lower bounds and ordinary nonnegative-value flows.
Use the excess calculus of Milestone 1 to derive weak duality: the value of every feasible flow is at most the capacity of every terminal-separating cut.

The main targets are:

1. **Residual augmentation.** Augmenting along a simple augmenting `s–t` path by its minimum residual capacity preserves feasibility and increases flow value by that positive amount.
   Use the common residual update of Milestone 1 and derive the corresponding bounded-circulation cycle augmentation lemma.
2. **Nonnegative assignment decomposition.** Every nonnegative arrow assignment on a finite quiver, without any conservation hypothesis or capacity data, is a finite sum of positively weighted simple directed paths and directed cycles, with equality on every original arrow.
   Each path starts at a vertex with negative excess in the original assignment and ends at a vertex with positive excess in that assignment; its internal vertices have no additional excess restriction.
   A walk of weight `q` contributes its number of occurrences of an arrow times `q`, using natural-number scalar multiplication in the additive group, so no multiplicative unit is needed.
   State the supply and demand identities: the total weight of paths starting at a supply vertex is minus its original excess, and the total weight ending at a demand vertex is its original excess.
   Permit empty path and cycle families, include loops as cycles, and prove that every component assignment is bounded arrowwise by the original assignment.
   If the original assignment takes values in an additive subgroup `H`, choose every coefficient in `H`.
   Derive the ordinary `s–t` flow decomposition and the cycle-only decomposition of nonnegative zero-excess assignments as corollaries.
   For a pseudoflow conserved away from the terminals with negative excess at the designated sink, use terminal exchange to obtain paths in the opposite direction.
   These statements require nonnegative arrow values; general signed circulations use the nonnegative residual difference of [Target 8.4](#84-residual-adjustments) for cycle adjustments.
3. **Acyclic flows.** Every ordinary flow yields, by removing the cycle components of its decomposition, a flow of the same value whose assignment is arrowwise no larger and whose support contains no directed cycle; in particular it uses no loop and at most one of any two opposite arrows, and every arrow value is at most the flow value.
   Preserve values in an additive subgroup.
4. **Max-flow/min-cut.** There exist a feasible flow and a terminal-separating cut with equal value and capacity.
   Prove the equivalent optimality criteria: maximum flow, no augmenting `s–t` path, and existence of a cut attaining equality.
5. **Integrality.** Capacities in an additive subgroup `H` of `K` admit a maximum flow whose arrow values are in `H` and whose value equals the minimum cut capacity.
   This is the intrinsic form, and augmentation preserves it since residual capacities are differences of elements of `H`.
   Natural-number capacities in `ℤ`, `ℚ`, or `ℝ` are the case `H = AddSubgroup.zmultiples 1`; state that case with `ℕ`-casts and give the explicit coercion lemmas between the three coefficient types.
6. **Termination over `ℤ`.** For integer capacities, every flow value is at most the total capacity leaving the source, and augmentation strictly increases the value, so the relation "`g` has larger value than `f`" is well-founded on integer flows.
   Hence every sequence of augmentations terminates, whatever the choice of augmenting paths.
   No such assertion is made for dense or non-Archimedean coefficients.

A shortest-augmenting-path argument proves existence over every permitted coefficient type because its termination depends only on the finite residual graph, not on discreteness, Archimedeanness, or completeness of the coefficients.
This is the suggested proof route rather than part of the public interface; another proof is acceptable if it establishes the same coefficient-generic theorem without stronger assumptions.

**Required examples:**

- Networks with parallel and antiparallel arrows, a loop, and zero capacities over integer, rational, and real coefficients, exercising residual tags and finite sums.
- A capacity-feasible assignment with negative excess at the designated sink, verifying terminal exchange, and a prescribed-excess example verifying the supply and demand signs.
- A nonnegative assignment with two supply vertices, two demand vertices, and a cycle, verifying arrowwise reconstruction and the supply and demand weight identities.
- Zero and nonnegative zero-excess assignments, exercising empty decomposition families and loop cycles.

### 3.2. Large capacities

Define the capping of capacities at `B : K` as `min (cap e) B` on every arrow.
Suppose some `s–t` cut has capacity strictly below `B`.
Prove that capping changes neither the minimum `s–t` cut value nor the set of minimum `s–t` cuts, because a cut crossing an arrow of capacity at least `B` is not minimum for either capacity function.
Prove that every flow of the capped network is a flow of the original network with the same assignment, and that every flow of the original network yields, after removing its cycle components as in [Target 3.1](#31-finite-flows-and-assignment-decomposition), a flow of the capped network with the same value and an arrowwise no larger assignment.
This is the only sense in which this roadmap uses uncapacitated arrows: the reductions of [Target 5.2](#52-reductions-to-max-flow) and the bipartite network of Milestone 6 give their auxiliary arrows a capacity exceeding a known cut, and this target reads their minimum cuts off the original capacities.

**Required examples:**

- An arrow of capacity above a terminal-separating cut, with a flow whose cycle component carries more than the cut bound, showing that capping preserves the flow value after cycle removal but need not preserve the original assignment.

### 3.3. Terminal sets and undirected networks

**Terminal sets.** For disjoint finite vertex sets `A, B`, an `A–B` flow is a pseudoflow conserved outside `A ∪ B` with nonpositive excess on `A` and nonnegative excess on `B`; its value is the total excess on `B`, equivalently minus the total excess on `A`.
An `A–B` cut is a vertex set `S` with `A ⊆ S ⊆ Bᶜ`, of capacity `u(δ⁺(S))`; these are the admissible sets of [Target 4.1](#41-submodularity-and-terminal-set-cut-lattices).
Prove weak duality, the existence of an `A–B` flow and an `A–B` cut of equal value and capacity, the optimality criteria, and integrality in an additive subgroup, for all disjoint `A, B` including empty ones, where the maximum value is zero.
The suggested route is the auxiliary-terminal construction of [Target 1.4](#14-vertex-splitting-auxiliary-terminals-and-change-of-coefficients) with the capacity of `σ → a` equal to the total capacity leaving `a` and that of `b → τ` equal to the total capacity entering `b`: prove that `A–B` flows correspond exactly to `σ–τ` flows with the same original assignment and value, and that minimum `σ–τ` cuts restrict to minimum `A–B` cuts.
The reductions of [Target 5.2](#52-reductions-to-max-flow) use the same construction with other capacities.

**Undirected networks.** A flow of a weighted multigraph is a flow of its bidirected network.
Prove that every such flow has an acyclic flow of the same value ([Target 3.1](#31-finite-flows-and-assignment-decomposition)) that uses no loop arrow and at most one of the two opposite arrows of each nonloop edge.
Prove the undirected max-flow/min-cut theorem: for distinct actual vertices `s, t` there are such a flow and a set `S` containing `s` but not `t` whose value and multigraph cut capacity ([Target 1.2](#12-cuts-separators-and-path-families)) agree, every flow value is at most every cut capacity, and integrality holds in an additive subgroup.
Derive the `SimpleGraph` statement for `Sym2`-indexed capacities through `Graph.ofSimpleGraph`, in the shape of [#34028](https://github.com/leanprover-community/mathlib4/pull/34028).

**Required examples:**

- Terminal sets with several vertices on each side, one of them empty, verifying the value formula and the auxiliary-terminal correspondence.
- A weighted multigraph with parallel edges and a loop, with a bidirected flow using both directions of one edge and its normalization.

### 3.4. Real-valued corollaries

For `K = ℝ`, restate the ordinary flow interface for `ℝ≥0`-valued capacities: flows for a capacity function with values in `ℝ≥0` are the `ℝ`-valued flows for its coercion, their arrow values are `ℝ≥0`-valued by nonnegativity, the finite-sum excess cast to `EReal` equals the `tsum` expression of [#43017](https://github.com/leanprover-community/mathlib4/pull/43017) on a finite quiver, and the value cast to `ENNReal` equals that proposal's `Flow.val`.
State max-flow/min-cut and integrality for `ℝ≥0` capacities in these terms.
These are ordinary API over `ℝ`; when Mathlib lands its network flows, they are the adapter between its definitions and the coefficient-generic theory, and Tau Ceti adopts Mathlib's definitions wherever they coincide.

## 4. The structure of minimum cuts

### 4.1. Submodularity and terminal-set cut lattices

State this milestone for set functions, with the cut capacities as instances.
Targets 4.1 and 4.3 are stated over the linearly ordered cancellative additive commutative monoid of the conventions; only Target 4.2 needs the group.
A function `f : Finset V → K` is **submodular** when `f (S ∪ T) + f (S ∩ T) ≤ f S + f T` for all `S, T`, and **symmetric** when `f Sᶜ = f S` for all `S`.
A minimum `A–B` cut for disjoint terminal sets `A,B` is a minimizer of `f` over `A ⊆ S ⊆ Bᶜ`.
Either terminal set may be empty; disjointness guarantees at least one admissible set, and finiteness gives an attained minimum.
Singleton terminal sets recover minimum `s–t` cuts for distinct `s,t`; under symmetry the choice of side is immaterial after exchanging the terminal sets.
Prove that nonnegative directed outgoing cut capacity is submodular and that nonnegative undirected cut capacity is symmetric and submodular.
For finite signed bounds `ℓ ≤ u`, also prove submodularity of the upper cut bound `U` using

$$
U(S)=(u-\ell)(\delta^+(S))-\sum_{v\in S}\operatorname{excess}(\ell)(v).
$$

The first term is a cut function with nonnegative capacities; the vertex sum is modular, meaning it satisfies the submodular identity with equality.
These identities use the common excess calculus and do not depend on the circulation feasibility results.

For a submodular `f` and disjoint terminal sets `A,B`, prove that the minimum `A–B` cuts are closed under union and intersection.
Develop this family as a finite distributive lattice under inclusion, with unique smallest and largest members, characterized by containment in or containment of every minimizing side.
Supply attainment, the minimum-value characterization of a minimizing side, invariance under vertex equivalences, and the singleton-terminal specialization.
Define submodularity independently of symmetry; none of these lattice results assumes symmetry.

**Required example:** disjoint terminal sets with more than one terminal and multiple minimizing sides, verifying the smallest and largest cuts, and cases where one or both terminal sets are empty.

### 4.2. Residual characterizations and canonical cuts

Apply this lattice theory to `U` for finite signed bounds, including networks whose feasible terminal values are all negative.
For any feasible bounded `s–t` assignment and source-side cut `S`, prove the gap identity

$$
U(S)-\operatorname{val}(f)=(u-f)(\delta^+(S))+(f-\ell)(\delta^-(S)).
$$

The right-hand side is the outgoing capacity of `S` in the residual network.
For any maximum bounded terminal assignment, characterize its minimum cuts as exactly the source-side sets with no positive-capacity residual arrow leaving them.
Characterize the smallest source side as the vertices reachable from the source along positive-capacity residual arrows, and the largest as the complement of the vertices from which the sink is reachable along such arrows.
Prove that both sets are independent of the chosen maximum assignment, and recover the ordinary-flow statements by specialization.
These results assume a maximum assignment is given; Target 8.6 supplies its existence for every feasible finite-bound network.
The symmetric results below retain their symmetry hypothesis, which signed directed cut bounds need not satisfy.

**Required examples:**

- A signed-bound network exercising submodularity, the residual cut-gap identity, and the smallest and largest minimum cuts.

### 4.3. Non-crossing lemmas and minimum-cut values

Prove the **non-crossing lemma** for a symmetric submodular `f`: if `S` is a minimum `s–t` cut and distinct vertices `u, v` both lie in `S`, there exists a minimum `u–v` cut with one side contained in `S`.
Include the identities and uncrossing inequalities needed to choose such a cut without changing its value.
The proof uses only submodularity and symmetry (posimodularity); it needs no flows, and it fails without symmetry, for directed cut capacity in particular, so do not attempt a directed version.

Extend it to families with two further targets.
**Uncrossing preserves laminarity:** if a vertex set `Z` crosses `X` (all four of `Z ∩ X`, `Z ∖ X`, `X ∖ Z`, and the complement of `Z ∪ X` are nonempty), then `Z ∩ X` and `Z ∪ X` are each nested with or disjoint from every set that is nested with or disjoint from both `Z` and `X`.
Two cuts, as bipartitions, **cross** when all four intersections of a side of one with a side of the other are nonempty; a family of pairwise non-crossing cuts is not the same as a laminar family of sets, since two sides can be neither nested nor disjoint while covering the vertex set.
**Root convention:** fix a root vertex and represent every cut by its side not containing the root; prove that a pairwise non-crossing family of cuts then becomes a laminar family of sets (pairwise nested or disjoint), because two root-excluding sides cannot cover the vertex set.
**Multi-cut non-crossing lemma:** for a pairwise non-crossing family of cuts, each a minimum cut of `f` for a designated pair of vertices, and distinct vertices `s, t` separated by none of them, there is a minimum `s–t` cut crossing none of them.
Applying the single-cut lemma to one crossed member at a time is not enough on its own, since uncrossing against one cut can create a crossing with another; the laminarity lemma shows the number of crossed members strictly decreases, which is what makes the induction go through.
Prove also the **ultrametric inequality** for the minimum cut values of any `f` and distinct `s, t`, `λ(s,t) ≥ min (λ(s,v), λ(v,t))`, since every `s–t` cut separates `s` from `v` or `v` from `t`.
The intermediate vertex `v` is arbitrary; define `λ(s,s) = 0` as the diagonal convention.
These are the interface used by the cut-tree milestone.
Submodularity, the lattice, and the non-crossing lemmas rest on Milestone 1 alone; Milestone 3 enters this milestone only for the residual characterization of the canonical cuts.

## 5. Menger's theorem

### 5.1. Path–separator duality

State Menger's path–separator equalities in **witness form**: there exist a family of `k` pairwise disjoint paths and a separator of size `k`, for some `k`, and every family of disjoint paths is no larger than every separator.
For adjacent terminals, use the multiplicity correction specified under **Adjacent terminals** below in both the witnesses and the inequality.
The two statements together are the equality of optima with attainment on both sides.
The derived numerical connectivity invariants package global threshold information, but do not replace these witnesses or the inequalities that certify their optimality.

- **Local edge Menger:** for distinct terminals `s, t`, a family of pairwise edge-disjoint `s–t` paths and a set of edges whose deletion destroys `s–t` reachability, of the same size, together with the inequality between any family and any such edge set.
  Give directed-network and multigraph versions, and derive the `SimpleGraph` statements using Milestone 1.
- **Local vertex Menger:** for distinct nonadjacent terminals, the same with internally vertex-disjoint paths and terminal-excluding vertex separators.
  Give directed-network and multigraph versions with the [adjacency convention](#paths-separators-and-connectivity), returning actual edge-labelled paths, and derive the `SimpleGraph` statements.
  The multigraph statement requires only finitely many actual vertices: apply the simple-graph theorem to the simplification and lift its finite path family.
- **Adjacent terminals:** let `D` be the set of all edges joining distinct terminals `s,t`, and let `m = |D|`.
  Give both multigraph and directed versions; in the directed version, `D` consists exactly of the arrows `s → t`, and arrows `t → s` are retained and do not contribute to `m`.
  After deleting all of `D`, a terminal-excluding vertex separator of size `k` and a family of `k + m` internally vertex-disjoint paths in the original graph attain equality, for some `k`.
  The family includes the `m` distinct one-edge paths, and every such family has size at most `|X| + m` for every separator `X` in the graph with `D` deleted.
  The simple-graph corollary has `m = 1` and hence `k + 1` paths, including for the single-edge graph where `k = 0`.
- **Set-to-set Menger:** the same for vertex-disjoint `A`–`B` paths against vertex sets meeting every `A`–`B` path, with the [overlap convention](#paths-separators-and-connectivity), in directed-network and multigraph versions, with simple-graph corollaries; and edge versions for disjoint terminal sets.
  The multigraph vertex version likewise requires no finiteness of the actual edge set; the edge version retains that hypothesis.

Derive the predicate forms: local edge reachability at threshold `k` is equivalent to the existence of `k` edge-disjoint paths; local vertex reachability has the analogous equivalence under the nonadjacency hypothesis.
Relate local edge reachability to cuts as well: for distinct actual vertices `s,t`, `G.IsEdgeReachable k s t` holds exactly when `k` is at most the minimum `s–t` cut value, in `ℕ`, with capacity `1` on each actual edge.
After aggregation to pair capacities, the capacity of a pair is its edge multiplicity, not merely an adjacency indicator.
Thus the cut tree of Milestone 9 answers multigraph local edge reachability; for a simple graph this specializes to capacity `1` on edges and `0` elsewhere.
For multigraphs with finitely many actual vertices and more than `k` of them, derive the global characterization of `k`-vertex-connectivity by `k` internally vertex-disjoint paths between every pair of distinct vertices, including adjacent pairs, without assuming a finite edge set.
Derive the simple-graph specialization with the same size hypothesis.

### 5.2. Reductions to max-flow

Instantiate the vertex-splitting and auxiliary-terminal constructions of [Target 1.4](#14-vertex-splitting-auxiliary-terminals-and-change-of-coefficients) over `ℤ`, where integrality is the case `H = ⊤`, with the capacities below, and prove the correspondence in each direction.
For multigraph vertex targets with no edge-finiteness assumption, apply these finite-network reductions to the simplification and use its path-lifting and separator correspondences.
These reductions are required reusable interfaces; using them to prove Menger is the suggested proof route rather than an additional constraint on the final theorem.
In the undirected edge reduction, extract paths from the normalized flow of [Target 3.3](#33-terminal-sets-and-undirected-networks), so that one edge cannot be used twice while distinct parallel edges remain distinct.
Discard loop flows and cycle flows when extracting simple terminal-to-terminal paths.
The reductions must recover actual path families and separators, not just equalities of numerical optima.

- **Local vertex Menger:** assume distinct terminals and no original arrow `s → t`.
  Over `ℤ`, put `M = |V| + 1`, capacity `M` on original arrows and on the split arrows of `s,t`, and capacity `1` on every other split arrow; use terminals `s⁺, t⁻`.
  Prove that a separating cut of capacity below `M` crosses only internal split arrows, which give a terminal-excluding vertex separator of exactly that capacity.
  Conversely, deleting the split arrows indexed by a vertex separator destroys terminal reachability, and the reachable source side has cut capacity at most the separator's size.
  Deleting all internal split arrows gives a cut of capacity at most `|V| − 2 < M`, so these correspondences apply to minimum cuts.
- **Set-to-set Menger:** for vertex-disjoint `A–B` paths, split every vertex with capacity `1`, give original arrows capacity `M = |V| + 1`, and add capacity-`M` arrows `σ → a⁻` for `a ∈ A` and `b⁺ → τ` for `b ∈ B`.
  Every cut of capacity below `M` crosses only split arrows and yields a vertex separator of that capacity, now allowed to meet `A ∪ B`; deleting all split arrows bounds the minimum cut by `|V|`.
  Prove the reverse separator-to-cut bound and both path-family correspondences, shortening projected paths so that their interiors avoid `A ∪ B`.
  The route `σ → v⁻ → v⁺ → τ` for `v ∈ A ∩ B` projects to the permitted zero-length path.
  For edge-disjoint paths with disjoint `A,B`, use the unsplit quiver, unit original capacities, and capacity `M = |E| + 1` on `σ → a` and `b → τ`, where `E` is the total original arrow type.
  Cuts of capacity below `M` cross only original arrows; deleting all original arrows bounds the minimum cut by `|E|`.
  Supply separator-to-cut and path-family correspondences in this case as well, allowing shared path endpoints.
  Include empty terminal sets.

**Required examples:**

- Complete graphs, including the distinction between adjacent-terminal deletion connectivity and path counts.
- Parallel direct terminal edges together with a path through an internal vertex, verifying the adjacent-terminal multiplicity formula.
- Directed parallel arrows `s → t` together with arrows `t → s`, verifying that only the forward arrows contribute to the adjacent-terminal correction.
- A three-vertex path with infinitely many parallel edges on each link, verifying vertex connectivity and nonadjacent vertex Menger without a finite-edge instance.
- Overlapping terminal sets whose common vertex contributes a zero-length path, exercising the split-network projection and separator correspondence.

## 6. Connectivity and bipartite matching consequences

Prove the vertex-structural and matching consequences in the existing `SimpleGraph` vocabulary, including their application to the underlying simple graph of a multigraph.
Also prove the native multigraph Whitney inequality `vertexConnectivity G ≤ edgeConnectivity G` and the upper bound by the number of nonloop edges incident to each vertex when there are at least two actual vertices.
This count includes parallel edges separately and excludes loops; this roadmap defines no multigraph degree.
The simple-graph specialization gives the minimum-degree bound below.

- **Whitney inequalities:** `G.IsVertexConnected k` implies `G.IsEdgeConnected k`; for `[Nontrivial V]`, `G.IsEdgeConnected k` implies `k ≤ G.minDegree`.
  Derive the numerical forms `G.vertexConnectivity ≤ G.edgeConnectivity` and, on a finite nontrivial carrier, `G.edgeConnectivity ≤ G.minDegree` after coercing the degree to `ℕ∞`.
- **Directed connectivity:** for an arrow family `Q` with finite vertex and arrow types, define `IsArcReachable k s t` by reachability after deleting fewer than `k` arrows, `IsArcStrong k` by that condition for every ordered pair, and `IsVertexStrong k` by more than `k` vertices together with reachability between every two remaining vertices after deleting fewer than `k` vertices.
  Define the invariants `arcConnectivity` and `vertexStrongConnectivity` in `ℕ∞` as the suprema of the thresholds, with the same subsingleton conventions as the undirected invariants.
  Supply threshold equivalences, monotonicity in the threshold and the arrow family, deletion lemmas, and the predicate forms through directed Menger.
  Prove `vertexStrongConnectivity ≤ arcConnectivity`, and the bound of arc connectivity by every out-degree and in-degree when there are at least two vertices.
  Prove that the arc connectivity of the bidirected network of a multigraph is its edge connectivity and that its vertex strong connectivity is the multigraph's vertex connectivity.
- **Common-cycle characterizations:** for a connected simple graph with at least three vertices, each of the following is equivalent to 2-vertex-connectivity: every two distinct vertices lie on a common cycle; every two distinct edges lie on a common cycle; every vertex and every edge lie on a common cycle.
  The blocks with at least three vertices from Milestone 2 are exactly the vertex sets of the maximal 2-vertex-connected induced subgraphs.
- **Preservation lemmas:** deleting `m < k` vertices from a `k`-vertex-connected graph leaves a `(k − m)`-vertex-connected graph; adjoining a new vertex adjacent to at least `k` vertices of a `k`-vertex-connected graph gives a `k`-vertex-connected graph; adding edges preserves `k`-vertex- and `k`-edge-connectivity.
  The proofs of the fan lemma and Dirac's theorem below use the first two.
- **Fan lemma:** in a `k`-vertex-connected graph, a vertex `x` outside a set `U` with at least `k` vertices has `k` paths to distinct vertices of `U`, with interiors outside `U` and pairwise intersection exactly `{x}`.
- **Dirac's prescribed-vertex cycle theorem:** for `k ≥ 2`, every set of `k` vertices in a `k`-vertex-connected graph lies on a cycle.
  No cyclic order of those vertices is prescribed.
- **Kőnig's theorem:** in a finite bipartite graph, there exist a matching and a vertex cover of equal size, and every maximum matching has the same number of edges as every minimum vertex cover has vertices.
  Use `SimpleGraph.Subgraph.IsMatching`, `SimpleGraph.IsVertexCover`, and the extremality interfaces of Mathlib proposal [#33032](https://github.com/leanprover-community/mathlib4/pull/33032).
  Build their missing finite API here, including attainment and the matching–cover inequality.
  Build the bipartite network as a reusable interface: for bipartition `L, R`, unit capacities from the source to `L` and from `R` to the sink, and capacity `|L| + 1` on graph edges directed from `L` to `R`, so that no such edge crosses a minimum cut, with the lemmas that integral flows encode matchings and that a minimum-cut source side `S` yields the cover `(L ∖ S) ∪ (R ∩ S)`.
  Proving Kőnig through it is the suggested route, as for Menger, not a constraint on the theorem.
- **Deficiency formula (König–Ore) and Hall:** for bipartition `L, R`, the maximum size of a matching is `|L| − max_{S ⊆ L} (|S| − |N(S)|)`, where `N(S)` is the set of neighbours of `S`, in witness form: there exist a matching `M` and a set `S ⊆ L` with `|M| + |S| = |L| + |N(S)|`, and every matching and every `S ⊆ L` satisfy `|M| + |S| ≤ |L| + |N(S)|`.
  Derive it from Kőnig by reading a minimum cover `C` as `S = L ∖ C`, so that `(L ∖ S) ∪ N(S)` is again a minimum cover.
  State it also in the indexed-family form of Mathlib's Hall theorem, for `t : ι → Finset α`, with an injective choice function on the subtype of a chosen finite set of indices in place of a matching, so that consumers of either form can use it.
  The choice function is defined only on those indices, allowing the empty partial choice even when `α` is empty.
  Hall's theorem is the case of zero deficiency: derive Mathlib's `Finset.all_card_le_biUnion_card_iff_exists_injective` and `exists_isMatching_of_forall_ncard_le` from the two forms as compatibility checks; Mathlib's statements remain the library's Hall.
- **Regular bipartite graphs:** for `k ≥ 1`, a `k`-regular bipartite graph has a perfect matching, so its two sides have equal size, and its edge set is the disjoint union of `k` perfect matchings.
  Derive both from Hall, using `SimpleGraph.IsRegularOfDegree` and `Subgraph.IsPerfectMatching`.

## 7. Ear decompositions and strong orientations

An open ear in a multigraph is a positive-length path adding unused edge identities, with distinct endpoints already present and all internal vertices new.
A closed ear is an undirected cycle adding unused edge identities and meeting the existing subgraph at exactly its base vertex.
Single-edge open ears, one-edge loop ears, and two-edge closed ears using distinct parallel edges are allowed.
The unused-edge condition is required for both kinds, including loops.
An ear decomposition is **data**, not merely a proposition asserting that suitable ears exist.
The multigraph decomposition starts from a single vertex or from a cycle and adds open or closed ears, recording a graph after each prefix on the same ambient vertex and edge types.
Its internal representation is not pinned: an inductive type family indexed by the graph built so far and a finite sequence with a validity proof are both suitable.
The public API must expose the initial cycle or vertex, the number and kind of ears, the `k`-th ear, and the graph after each prefix.
It must identify the zeroth and final graphs, show that each successor prefix adds exactly its displayed ear, provide prefix decompositions and an induction principle following the construction order, and prove edge coverage and preservation of the relevant connectivity property.
A decomposition of `G` has final graph `G`, covering every actual vertex and edge, including loops and all parallel edges.
Transport decompositions of `Graph.ofSimpleGraph H` to the `H.Subgraph` interface and back, preserving the prefix API; this is the simple-graph interface prototyped in `Suggested.lean`.
An open ear decomposition of a simple graph starts from a cycle and has only open ears, expressed as a predicate on the transported data.

Prove three characterizations:

1. A finite simple graph with at least three vertices is 2-vertex-connected if and only if it has an open ear decomposition.
   This vertex-connectivity characterization also applies to the underlying simple graph of a multigraph; it does not assert that open ears cover multigraph loops.
2. A finite multigraph with nonempty actual vertex set is 2-edge-connected if and only if it can be built from one vertex by adding open or closed ears.
   Prove first that 2-edge-connectivity is equivalent to pairwise reachability of the actual vertices and absence of bridges among the actual edges, including the empty-vertex convention for that equivalence.
   Derive the simple-graph ear characterization and `H.IsEdgeConnected 2 ↔ ∀ e, ¬ H.IsBridge e` in the shape of [#42839](https://github.com/leanprover-community/mathlib4/pull/42839).
   The unrestricted simple-graph bridge predicate includes connectedness through non-edges; the multigraph bridge predicate only concerns actual edges and requires the separate reachability condition.
3. A network `N` with nonempty finite vertex type and finite arrow types is strongly connected (`N.IsStronglyConnected`) if and only if it can be built from one vertex by adding directed open or closed ears, covering every arrow.

In the directed version, ears are directed paths and cycles of `N` in the sense of the conventions, they retain arrow identities, and the directed decomposition exposes the same prefix API using subnetworks.
Loops are permitted as one-arrow closed ears.
The initial-vertex convention includes the isolated singleton with no ears; relate it to the cycle-starting formulation for strongly connected networks with at least two vertices.
Derive the directed analogue of the bridge criterion: a network with nonempty vertex type that is weakly connected, meaning every two vertices are joined by a path of the symmetrized arrow family, is strongly connected if and only if every arrow lies on a directed cycle.

Prove **Robbins' theorem** for finite multigraphs: a strongly connected orientation on `V(G)` exists if and only if `G.IsEdgeConnected 2`.
This needs no connectedness or size hypothesis: both sides hold when the actual vertex set is subsingleton, including with loops.
For nonempty connected multigraphs, derive the classical form that a strongly connected orientation exists exactly when there is no bridge.
Construct the orientation from the ear decomposition and prove strong connectivity through the directed ear characterization.
Include the componentwise result: an orientation strongly connected on each connected component exists exactly when no actual edge is a bridge.
Derive the simple-graph statements through the orientation equivalence of Milestone 1, using `TauCeti.DoubledQuiver.Orientation` in their conclusions.

**Required examples:**

- Two vertices joined by two parallel edges: edge connectivity two, a two-edge cycle and closed ear, and a strongly connected orientation, compared with the single-edge simplification.
- A loop on one vertex: a one-edge cycle and closed ear, no bridge, and no contribution to cuts.

## 8. Bounded circulations, prescribed excess, and bounded flows

Only `ℓ ≤ u` is required in this milestone; both bounds and arrow values may be negative.
Develop bounded assignments with prescribed excess, their circulation specialization, and bounded terminal assignments using the common network representation and residual construction.
Supply extensionality, restriction to connected components, behavior under disjoint unions, bound relaxation, arrow reversal, and transport under network isomorphisms and coefficient embeddings.
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
Supply extensionality, vertex-bound relaxation, component restriction and disjoint unions, network-isomorphism transport, assignment shifts, and the equal-endpoint equivalence with exact excess, preserving every arrow value.
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

Use the common update of Milestone 1 for arbitrary feasible residual assignments.
For any two feasible assignments `f, g`, construct the residual assignment with `r(e⁺) = max (g(e) − f(e)) 0` and `r(e⁻) = max (f(e) − g(e)) 0`.
Prove that updating `f` by `r` gives `g`, and that `excess r = excess g − excess f`.
Thus equal-excess assignments give a residual circulation as a corollary, with no second difference construction.
This canonical representative never uses both residual copies of an original arrow positively; arbitrary residual representatives need not be unique.
For equal-excess assignments, decompose this residual circulation into finitely many nonnegative directed cycle flows and prove that the corresponding sequence of updates stays feasible, has the same excess at every stage, and ends at `g`.
Preserve additive-subgroup values throughout.

**Required examples:**

- Two assignments with the same excess connected by residual cycle adjustments, and a residual update with nonzero excess verifying the general excess-change formula.

### 8.5. Flows and circulations

Add a fresh tagged arrow `t → s`, distinct from every existing arrow even if the endpoints already support arrows.
For any `q : K` and distinct `s,t`, put lower and upper bound `q` on that arrow and construct an equivalence between bounded `s–t` assignments of value `q` and circulations on the augmented network.
Prove both round-trip identities, preservation of every original arrow value, and recovery of `q` on the return arrow.
For zero original lower bounds and `q ≥ 0`, specialize to the ordinary `Flow` interface.
Generalize the return-arrow bounds to an interval `[a,b]`, with `a ≤ b`, to characterize feasibility with terminal value in that interval.

### 8.6. Extremal terminal values

For distinct terminals `s,t`, assume the original finite-bound network admits a bounded `s–t` assignment; do not assume zero is feasible or that the terminal value is nonnegative.
Prove attainment of a minimum value `m` and a maximum value `M`, together with source-side cuts witnessing

$$
m=\max_{s\in S,\ t\notin S} L(S),
\qquad
M=\min_{s\in S,\ t\notin S} U(S).
$$

Use the cut bounds `L` and `U` from the conventions, prove their inequalities for every feasible assignment, and characterize feasible prescribed values by `m ≤ q ≤ M`.
Prove that maximum value is equivalent to absence of a positive-capacity residual `s–t` path, and minimum value to absence of such a `t–s` path.
Give the reductions from a feasible starting assignment to the ordinary max-flow problems in the two residual directions, using the shared update and value formulas; apply the signed-bound cut lattice and canonical-cut results of Milestone 4.
If both bounds lie in an additive subgroup `H`, extrema can be attained with all arrow values in `H`; every `q ∈ H` in the feasible interval also has an `H`-valued witness.
Recover the ordinary maximum-flow theorem as the zero-lower-bound, nonnegative-value specialization.

**Required examples:**

- A return-arrow correspondence on a graph already containing an arrow from sink to source, and a bounded terminal problem whose minimum and maximum values are both negative.

### 8.7. Rounding

Let `R` be a linearly ordered ring with Mathlib's [`FloorRing`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Algebra/Order/Floor/Defs.html#FloorRing) structure.
For an `R`-valued arrow assignment whose excess at every vertex is the cast of an integer, prove existence of an integer assignment with that same integer excess and each arrow value between the floor and ceiling of its original value.
Deduce preservation of any integer lower and upper bounds respected by the original assignment, and specialize to circulations and flows of integer prescribed value.
Derive this from additive-subgroup integrality for the image of `ℤ → R`, using the floor and ceiling as bounds and the injectivity of integer casts to recover an integer assignment.
State rational and real specializations; the ring and floor structure are assumptions of this rounding target, not of the general flow theory.
No rounding assertion is made for noninteger prescribed excess.

**Required examples:**

- Rational and real fractional circulations and their integer roundings, with explicit floor and ceiling bounds.

## 9. Gomory–Hu cut trees

The general cut-tree theorem and minimum-cut recovery use Targets 4.1 and 4.3.
Milestone 5 is needed only to interpret the unit-capacity queries as edge connectivity.

For every linearly ordered cancellative additive commutative monoid `K`, every nonempty finite vertex type, and every symmetric submodular `f : Finset V → K`, prove the existence of a weighted tree on the same vertex type such that:

1. For any distinct vertices `s, t`, their minimum cut value for `f` is the minimum edge weight along their unique tree path.
2. For every tree edge `{u,v}`, deleting that edge gives a partition that is a minimum `u–v` cut for `f`, with value equal to the tree-edge weight.

Prove the resulting query theorem: any minimum-weight edge on the tree path from `s` to `t` yields an actual minimum `s–t` cut by deleting that edge.
State the instances for weighted multigraphs and pair-capacity networks as corollaries, using the cut aggregation theorem of Milestone 1.
The weighted tree is a `SimpleGraph` on the actual vertex type `V(G)` and need not be a subgraph of the original graph.
For unit capacities, parallel edges contribute their multiplicities; prove that the tree answers the edge-connectivity queries of Milestone 5 and recovers cuts as subsets of the original vertex set.
Derive the global corollaries: for a finite graph with at least two actual vertices, `edgeConnectivity G` is the minimum tree-edge weight, and for any symmetric submodular `f` the minimum cut values `λ(s,t)` over `s ≠ t` take at most `|V| − 1` distinct values, since each is a tree-edge weight.
Disconnected graphs and zero capacities are included, with zero-weight tree edges; a singleton has the one-vertex tree.

Develop the weighted-tree API needed for these statements: unique paths, fundamental partitions, minimum weights on nonempty paths, and transport under vertex equivalences.
The suggested proof is Gomory and Hu's construction with its contraction step replaced by the multi-cut non-crossing lemma; the public target is the weighted tree and its query API, not this particular construction.
In this proof, maintain a pairwise non-crossing family of chosen minimum cuts, represented by their root-excluding sides under the root convention of Milestone 4 so that it is a laminar family of sets, whose cells are the supernodes, together with a tree on the supernodes whose edges correspond to the chosen cuts.
While some supernode contains two vertices `s, t`, take a minimum `s–t` cut crossing no chosen cut, split the supernode by it, and attach each neighbouring subtree to the part on its own side of the new cut.
The useful invariant is that the family stays pairwise non-crossing and that every tree edge is one of the chosen cuts and a minimum cut for some pair of vertices taken from the two supernodes it joins.
Preserving the second half needs a witness repair when the split moves the witness vertex away from the part a subtree is attached to; Korte and Vygen's proof shows that the cut is then also minimum for a pair using `s` or `t`, by the ultrametric inequality.
When every supernode is a singleton, property 2 is this invariant, and property 1 follows from property 2 and the ultrametric inequality.
This route uses finiteness to choose a minimum cut at each step, together with the symmetry, submodularity, and non-crossing results of Milestone 4; it uses neither flows nor graph contraction, which is why it applies to every symmetric submodular function.
An implementation following it should state the invariant as a named lemma.
Gusfield's paper gives the same route as an algorithm on the original graph, with the rewiring written out explicitly.

**Required examples:**

- A disconnected weighted graph whose cut tree contains zero-weight edges.

## Scope boundaries

This roadmap owns graph connectivity, components, separators, cuts, flows, and the representation bridges between `Graph`, `SimpleGraph`, orientations, and networks.
Roadmaps that need `k`-vertex-connectivity for a fixed `k`, such as 3-connectivity in topological graph theory, use `IsVertexConnected k` from here rather than a second connectivity or component theory.
This roadmap defines no multigraph degree, contraction, drawing, or embedding; general contractions, contractible-edge and wheel theorems, planar embeddings, and surface topology are outside it.

Also outside this roadmap: general matching theory beyond the bipartite consequences above, networks with infinite capacities, minimum-cost flows and circulations, multicommodity flows, graphs with infinitely many actual vertices, edge-counting and flow theories with infinite edge sets, treewidth, algorithmic complexity bounds, Nash-Williams' orientation theorem for `2k`-edge-connected graphs, Edmonds' disjoint arborescences, the Nash-Williams–Tutte disjoint spanning tree theorems, and the condensation of a digraph into its strong components.

## Mathematical references

- Reinhard Diestel, *Graph Theory*, Chapter 3, for connectivity, Menger, blocks, fans, and ears; see the [author's book site](https://diestel-graph-theory.com/).
- Dimitri P. Bertsekas, [*Linear Network Optimization*](https://www.mit.edu/~dimitrib/LNets_Full_Book.pdf), §1.1.3 and Exercises 2.4–2.6 of §1.2, for bound transformations, feasibility, and rounding.
- Alexander Schrijver, *Combinatorial Optimization: Polyhedra and Efficiency*, Volume A, for flows, cuts, disjoint paths, circulations, and cut trees; see the [author's book page](https://homepages.cwi.nl/~lex/co/).
- Bernhard Korte and Jens Vygen, *Combinatorial Optimization: Theory and Algorithms*, Section 8.6, for the Gomory–Hu construction and the witness-repair step of its correctness proof.
- Jørgen Bang-Jensen and Gregory Gutin, *Digraphs: Theory, Algorithms and Applications*, for directed connectivity, directed ears, and network flows; see the [second edition](https://doi.org/10.1007/978-1-84800-998-1).
- Dan Gusfield, [*Very Simple Methods for All Pairs Network Flow Analysis*](https://doi.org/10.1137/0219009), SIAM Journal on Computing 19 (1990), 143–155, for the contraction-free cut-tree construction.
