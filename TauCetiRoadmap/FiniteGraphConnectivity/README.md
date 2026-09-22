# Finite graph connectivity: Menger, flows, and cuts

This roadmap develops finite graph connectivity through two complementary theories: the structure of connected graphs, and the duality between disjoint paths and separating cuts.
The main results are Menger's theorem, the block–cut forest, ear decompositions, Robbins' strong orientation theorem, max-flow/min-cut with integrality, Hoffman's circulation theorem, and Gomory–Hu cut trees.
The supporting library includes separators, path families, orientations, residual networks, flow decomposition, and minimum-cut structure.
These objects must have reusable APIs, including transport between the graph representations used by their consumers.

The structural development runs through blocks, connectivity consequences, and ears.
The quantitative development runs through flows, minimum cuts, and disjoint paths, then supports bipartite matching, bounded circulations, and cut trees.
All graphs and networks in the theorem targets are finite.
The undirected edge theory uses Mathlib's `Graph`, retaining loops and parallel edges, with corollaries in `SimpleGraph`.
Vertex-connectivity and the vertex-structural consequences reuse the underlying simple graph; the directed network and symmetric-submodular-function theories are independent of this choice.

**Suggested homes:** `TauCeti/Combinatorics/Graph/Connectivity/` for multigraph connectivity, `TauCeti/Combinatorics/SimpleGraph/Connectivity/` for simple-graph interfaces, `TauCeti/Combinatorics/Network/` for directed networks and flows, and adjacent modules for the representation bridges.

[`Suggested.lean`](Suggested.lean) prototypes networks, flows, the simple-graph interfaces, and weighted trees.
[`GraphSuggested.lean`](GraphSuggested.lean) prototypes multigraph incidence walks, path lifting, edge connectivity, Menger witnesses, orientations, ear data, and weighted cut aggregation.
Both are suggested forms, never exhaustive checklists; this document is the specification.

## Milestones at a glance

| Milestone | Main results | Depends on |
| --- | --- | --- |
| 1. Shared foundations | Graph walks and connectivity, representation bridges, cuts, separators, path families, orientations, and networks | Existing Mathlib and Tau Ceti APIs |
| 2. Bridges and blocks | Multigraph bridges; articulation criteria and block–cut forest | 1 |
| 3. Flows | Residual augmentation, flow decomposition, max-flow/min-cut, integrality, and extended capacities | 1 |
| 4. Minimum cuts | Submodularity, minimum-cut lattice, non-crossing lemma (1); canonical cuts (3) | 1, 3 |
| 5. Menger | Directed and undirected path–separator duality | 1, 3, 4 |
| 6. Connectivity and matching consequences | Whitney inequalities and cycle criteria, preservation lemmas, fans, Dirac's cycle theorem, Kőnig and Hall | 2, 5 |
| 7. Ears and orientations | Undirected and directed ear decompositions; Robbins' theorem | 2, 6 |
| 8. Circulations | Hoffman, prescribed supplies and demands, integral feasibility | 3 |
| 9. Cut trees | Gomory–Hu, including recovery of minimum cuts and edge-connectivity queries | 4, 5 |

Each milestone includes the elementary lemmas needed to use its definitions: constructors, extensionality where appropriate, membership and support lemmas, monotonicity, restriction, and invariance under isomorphism.
The targets below specify the additional API particular to each object.

## Existing vocabulary and related work

Use Mathlib's `Graph` incidence, subgraph, induced-subgraph, and deletion APIs for multigraphs.
Reuse `SimpleGraph` APIs for the underlying simple graph and for simple-graph corollaries: walks and paths, reachability, connected components, cycles, trees, degree, bipartite graphs, and matchings.
In particular, reuse [`SimpleGraph.IsEdgeConnected`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Combinatorics/SimpleGraph/Connectivity/EdgeConnectivity.html#SimpleGraph.IsEdgeConnected), [`SimpleGraph.IsBridge`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Combinatorics/SimpleGraph/Connectivity/Connected.html#SimpleGraph.IsBridge) with its cycle characterization `isBridge_iff_forall_cycle_notMem`, and [`SimpleGraph.minDegree`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Combinatorics/SimpleGraph/Finite.html#SimpleGraph.minDegree).
Mathlib also supplies the [`Graph`–`SimpleGraph` conversions](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Combinatorics/Graph/Simple.html), [graph versions of Hall's theorem](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Combinatorics/SimpleGraph/Hall.html), and the [finite-family Hall theorem](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Combinatorics/Hall/Finite.html).
Reuse Tau Ceti's [`DoubledQuiver`](https://github.com/TauCetiProject/TauCeti/blob/main/TauCeti/RepresentationTheory/Quiver/Zigzag/Basic.lean), [`DoubledQuiver.Orientation` and `OrientedQuiver`](https://github.com/TauCetiProject/TauCeti/blob/main/TauCeti/RepresentationTheory/Quiver/Zigzag/Orientation.lean), supplied by [ZigzagPreprojective, Layer 0](../ZigzagPreprojective/README.md#layer-0-affine-simply-laced-diagrams-doubled-graphs-relation-quotients-and-grading-descent).
That roadmap owns the doubled-quiver and orientation constructions and their algebraic applications; this roadmap extends their connectivity and network API, importing the existing modules in its prototypes.
Exposing their arrow families as explicit quiver arguments is an adapter, not a second orientation type.

The following Mathlib proposals guide the corresponding interfaces:

- [#33355: vertex connectivity](https://github.com/leanprover-community/mathlib4/pull/33355): deletion-based `IsVertexReachable`, `IsVertexPreconnected`, and `IsVertexConnected`.
- [#42494: numerical edge connectivity](https://github.com/leanprover-community/mathlib4/pull/42494): `edgeReachability`, `edgeConnectivity`, their supremum definitions, and degree bounds.
- [#36756: shared walks](https://github.com/leanprover-community/mathlib4/pull/36756) and [#39053: the `Graph` instance](https://github.com/leanprover-community/mathlib4/pull/39053): `GraphLike.Walk` with vertex support and darts, following the [HasAdj discussion](https://leanprover.zulipchat.com/#narrow/channel/252551-graph-theory/topic/HasAdj/with/575843445).
  Use this direction for the undirected representation bridges and prove compatibility with existing `SimpleGraph.Walk` and the directed quiver paths.
- [#43017: network flows](https://github.com/leanprover-community/mathlib4/pull/43017): quivers with capacities and flow assignments indexed by arrows.
- [#34028: weak max-flow/min-cut duality](https://github.com/leanprover-community/mathlib4/pull/34028): an undirected flow formulation on simple graphs.
  Undirected flow applications use the bidirected network, with no separate undirected flow type, so this roadmap takes only the statement shapes from that proposal.
- [#33032: Kőnig's theorem](https://github.com/leanprover-community/mathlib4/pull/33032): matchings as subgraphs, vertex covers, and the equality between the sizes of maximum matchings and minimum covers.
- [#42839: 2-edge-connectivity and bridges](https://github.com/leanprover-community/mathlib4/pull/42839): `G.IsEdgeConnected 2 ↔ ∀ e, ¬ G.IsBridge e`, the simple-graph specialization in Milestone 7.
- [#37861: connected `Graph`s](https://github.com/leanprover-community/mathlib4/pull/37861): connectivity of Mathlib's multigraph type through connected components as subgraphs, defined without walks; Milestone 1 proves agreement with walk reachability.

Build all missing prerequisites and results in Tau Ceti, following these interfaces and adopting Mathlib's resulting design when available.
An unmerged proposal is a design reference, not a dependency that contributors must wait for.
For flows, follow [#43017](https://github.com/leanprover-community/mathlib4/pull/43017) for the explicit quiver and separate capacity parameters, `PseudoFlow` and `Flow`, incoming-minus-outgoing excess, and nonnegative value at the sink.
The finite theory generalizes the coefficient type and uses finite sums; the network bundle exposes this interface through abbreviations, with no separate bundled flow theory.
Compatibility with that proposal is a target of Milestone 3, proved in an isolated compatibility module against a local copy of its definitions in its own shape.
The local copy is only a fixture for the correspondence theorems and must not grow a parallel flow theory.
When Mathlib supplies those definitions, replace the fixture with an import; the correspondence theorems remain the adapter between Mathlib's real-valued interface and the generic finite theory specified here.
If Mathlib supplies the generic theory as well, adopt its definitions and API and remove the corresponding local definitions and redundant adapters.

The [Lean Zulip discussion of max-flow/min-cut](https://leanprover-community.github.io/archive/stream/252551-graph-theory/topic/max-flow.20min-cut.20help.html) records earlier quiver-based formalization work, including [maxflowmincutlean4](https://gitlab.com/Shreyas941/maxflowmincutlean4).
Coordinate with authors before integrating existing code, following the repository's porting policy.
The mathematical targets here do not require importing that implementation.

## Conventions

### Graphs, networks, and orientations

**Undirected graphs** use `G : Graph α β`, with actual vertices `V(G) ⊆ α` and edges `E(G) ⊆ β`.
The ambient types need not be finite: theorem hypotheses are `[Finite V(G)]` and `[Finite E(G)]`, or `Fintype` instances on these subtypes when taking finite sums.
Walk endpoints and separators belong to `V(G)`; deleting edges counts identities in `E(G)`, including separate parallel edges.
Loops are allowed.
Use `G.toSimpleGraph : SimpleGraph V(G)` for properties insensitive to loops and parallel edges, and `Graph.ofSimpleGraph` to state and prove the simple-graph corollaries.
Simple-graph statements carry decidability instances exactly where the Mathlib definitions they mention require them; proofs may reason classically.

A weighted multigraph is `G` together with nonnegative capacities `c : E(G) → K`; zero capacities retain the edge in the graph.
Its cut capacity sums over actual crossing edges, once per edge, so parallel capacities add and loops contribute zero.
For the pair-capacity interface, a nonnegative `c : Sym2 V → K` has simple support graph with adjacency `v ≠ w ∧ 0 < c(s(v,w))`.
Diagonal capacities are allowed and ignored by both the support graph and cuts; prove invariance under changing them.
Aggregate a weighted multigraph to pair capacities on `Sym2 V(G)` by summing capacities of all edges joining each pair of distinct vertices and setting diagonal values to zero.
Prove equality of the two cut functions, hence preservation of minimum-cut values and minimizing partitions.
This aggregation preserves weighted cuts, not individual edge identities or unweighted edge-disjoint paths.

**Directed networks** are terms, not typeclass instances.
The finite-capacity theory is parameterized by a linearly ordered additive commutative group `K`, expressed by `[AddCommGroup K] [LinearOrder K] [IsOrderedAddMonoid K]`.
It must not assume a unit, multiplication, division, an Archimedean property, topology, or order completeness; in particular, the same theory applies to `ℤ`, `ℚ`, and `ℝ`.
A network `N : Network C V` is a structure carrying an arrow type `N.Hom v w : Type v` for every ordered pair of vertices, in a universe independent of the vertex universe as for `Quiver.{v}`, a capacity in `C` for every arrow, and a proof that every capacity is nonnegative; finiteness is the pair of instance arguments `[Fintype V]` and `[∀ v w, Fintype (N.Hom v w)]`.
The capacity type `C` is `K` for an ordinary network and `WithTop K` for an extended one.
Define arrow assignments, excess, and cut capacity against an explicit quiver, with capacities a separate parameter where needed and the value type of an assignment independent of the capacity type.
The network bundle exposes these definitions and the flow types through abbreviations, so bundled and unbundled networks share the same objects and theorems.
Directed walks use Mathlib's [`Quiver.Path`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Combinatorics/Quiver/Path.html#Quiver.Path), with the quiver argument supplied explicitly from the arrow family, as in `@Quiver.Path V ⟨N.Hom⟩ s t`.
Networks and orientations share this carrier and reuse its length, composition, vertex-list, and transport API; add the missing simple-path and cycle predicates using `Quiver.Path.vertices`.
Strong connectivity is Mathlib's [`Quiver.IsStronglyConnected`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Combinatorics/Quiver/ConnectedComponent.html#Quiver.IsStronglyConnected) with the same explicit quiver argument.
Abbreviations may expose these operations through the network or arrow family, so several quivers coexist on `V` without competing instances or vertex-type synonyms.
As terms, networks coexist and can be quantified over.
The total arrow type is the dependent sum of the arrow types over ordered pairs of vertices.
Parallel arrows, arrows in opposite directions, loops, and zero capacities are allowed.
A `PseudoFlow` is a `K`-valued arrow assignment with proofs of nonnegativity and capacity boundedness, without a conservation condition.
A `Flow s t` adds conservation away from the terminals and nonnegative excess at the sink.
Every network sum is a `Finset.sum`; excess and flow value take values in `K`, with excess allowed to be negative and flow value required to be nonnegative.
The finite theory must not require reasoning about infinite sums or infinite capacities to state its results.
Follow [#43017](https://github.com/leanprover-community/mathlib4/pull/43017)'s incoming-minus-outgoing `excessAt` and sink-value `Flow.val` conventions.
The coefficient-generic finite theory uses nonnegative capacities and arrow flows in `K`, with finite sums in `K`, in place of the proposal's `ℝ≥0` capacities and arrow flows, `EReal` excess by `tsum`, and `ENNReal` value.
The network bundle is a convenience around this explicit-quiver interface, not a second definition of flow.
Because capacities are bundled, supply a same-arrows capacity-replacement construction, extensionality in the capacity function, and transport of assignments and feasible flows when the replacement capacities are pointwise larger; extension to `WithTop K` and truncation of `⊤` are instances of it.
Milestone 3 specializes to `K = ℝ`, uses a local copy of that proposal's `PseudoFlow` and `Flow` in exactly its shape, and proves the finite-real correspondences for pseudoflows, flows, excess, and value.
The correspondence preserves arrow assignments after coercing between nonnegative reals and real values with nonnegativity proofs; excess agrees after coercion to `EReal`, and the nonnegative sink value agrees after coercion to `ENNReal`.

**Infinite capacities** belong to an extended-capacity API around the residual-flow core, not inside it.
An extended network is a network with capacity type `WithTop K`; its flows remain finite `K`-valued assignments, so only the flow structure is separate, while its cut capacities lie in `WithTop K`.
An ordinary network extends to one with the same arrows, and replacing an extended network's infinite capacities by a finite bound produces an ordinary network with the same arrows.
Do not define extended-valued flows or take `WithTop` subtraction as flow cancellation: in particular, `⊤ - ⊤ = 0` is not a valid account of residual capacity.
Prove that if an `s–t` cut of finite capacity `B` exists, replacing every infinite capacity by `B` preserves the minimum-cut value and yields a finite maximum flow attaining it in the original extended network.
If no finite `s–t` cut exists, prove that finite feasible flow values are cofinal in `K`: for every `b : K`, some feasible flow has value at least `b`.
For nontrivial `K`, deduce unboundedness: for every `b : K`, some feasible flow has value strictly greater than `b`.
Together these results are the extended max-flow/min-cut statement: finite cuts give an attained common value, while the absence of a finite cut gives cofinal finite flow values, which are unbounded when `K` is nontrivial.
For `K = ℝ`, also state the dichotomy as an equality in `WithTop ℝ` between `sSup` of the set of finite flow values, which is `⊤` exactly when that set is unbounded, and the minimum extended cut capacity.

**An orientation** of `G : Graph α β` orders the ends of each edge, with one directed arrow per edge identity and no additional arrows.
A loop gives one directed loop; it has a unique ordered pair of ends.
Its directed walks use the resulting arrow family on `V(G)`.
On `Graph.ofSimpleGraph H`, prove equivalence with the existing `TauCeti.DoubledQuiver.Orientation H`, whose carrier contains exactly one dart from each reversed pair, and compatibility with its `OrientedQuiver`.
Use that existing type for the simple-graph statements, with no parallel orientation structure.
The bidirected network has one arrow in each direction for every nonloop edge and one loop arrow for every loop, with the original edge's capacity on each arrow.
On a simple graph, identify this construction with the existing `DoubledQuiver` equipped with capacities.
Milestone 1 supplies the transport lemmas for both constructions.

**Namespaces.** Undirected multigraph declarations extend `Graph` and the shared walk API in the shapes of the cited proposals.
Simple-graph declarations extend `SimpleGraph`, following [#33355](https://github.com/leanprover-community/mathlib4/pull/33355) and [#42494](https://github.com/leanprover-community/mathlib4/pull/42494) for connectivity; orientation results extend the existing Tau Ceti orientation namespace.
`Suggested.lean` keeps stand-ins for proposed definitions outside the Mathlib namespaces so that this repository keeps building when Mathlib lands them.
`GraphSuggested.lean` prototypes the bidirected-network side of multigraph path transport using `Quiver.Path`; the implementation's native undirected walks follow the shared `GraphLike.Walk` design, with the correspondence required in Milestone 1.

### Paths, separators, and connectivity

Undirected walks retain the identity of each traversed edge, following the shared walk proposal; paths have no repeated vertices.
An undirected cycle is a positive-length closed walk with no repeated vertices apart from its endpoints and no repeated edge identities.
Thus a loop is a one-edge cycle and two distinct parallel edges form a two-edge cycle; traversing the same edge out and back is not a cycle.
For simple graphs, prove that these predicates agree with Mathlib's `Walk.IsPath` and `Walk.IsCycle`.
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

Define multigraph reachability by walks and prove agreement with `G.toSimpleGraph.Reachable` and the component-based connectivity of [#37861](https://github.com/leanprover-community/mathlib4/pull/37861).
Vertex-reachability and vertex-connectivity are those of `G.toSimpleGraph`, following [#33355](https://github.com/leanprover-community/mathlib4/pull/33355); prove equivalence with native vertex deletion and path witnesses.
In particular, global `k`-vertex-connectivity includes `k < |V(G)|`.
Define `G.IsEdgeReachable k s t` by reachability after deleting any set of fewer than `k` actual edges, and `G.IsEdgeConnected k` by that condition for every pair of actual vertices.
Prove agreement with the existing `SimpleGraph` predicates on `Graph.ofSimpleGraph`; do not define edge connectivity through simplification.
Use natural-number thresholds, coerced where an upstream predicate takes `ℕ∞`.
The predicates are the primary interface, but also define derived numerical invariants `vertexConnectivity G`, `edgeConnectivity G`, and `edgeReachability G s t` in `ℕ∞` as the suprema of the natural thresholds at which the corresponding predicates hold, following [#42494](https://github.com/leanprover-community/mathlib4/pull/42494) for the edge invariants.
Include the local threshold equivalence for `edgeReachability`, its symmetry, its value `⊤` on the diagonal, and its comparison with global edge connectivity and the number of incident nonloop edges.
The numerical vertex invariant agrees with that of the underlying simple graph; the edge invariants specialize through `Graph.ofSimpleGraph`, and agree with unit-capacity multigraph minimum cuts.
For every finite graph with nonempty actual vertex set, prove `G.IsVertexConnected k ↔ k ≤ G.vertexConnectivity`; define vertex connectivity to be zero on the empty vertex set.
Prove `G.IsEdgeConnected k ↔ k ≤ G.edgeConnectivity` for every finite graph, including the empty graph.
On a subsingleton actual vertex set `IsEdgeConnected k` holds for every `k` and `IsVertexConnected k` fails for every `k ≥ 1`; keep both conventions, and let upper bounds using incident-edge counts or minimum degree assume at least two actual vertices.
Consequently, for finite graphs edge connectivity is `⊤` exactly when the actual vertex set is subsingleton, whereas vertex connectivity is always finite.

### Flows and bounded circulations

Write `δ⁺(S)` for arrows leaving a vertex set and `δ⁻(S)` for arrows entering it.
For an arrow assignment `f`, excess is incoming flow minus outgoing flow.
An ordinary `s–t` flow satisfies `0 ≤ f ≤ u`, has zero excess away from distinct terminals `s` and `t`, and has nonnegative excess at `t`.
Its value is the excess at `t`, equivalently minus the excess at `s`.
Define excess and its algebraic API on arbitrary arrow assignments, and state conservation independently of the flow structure.
Prove that a pseudoflow conserved away from `s,t` with nonpositive excess at `t` gives a `Flow t s` with the same arrow assignment; its value is the negation of the original excess at `t`.
No second flow type for negative terminal values is required.
A cut is a source side `S` with `s ∈ S` and `t ∉ S`, of capacity `u(δ⁺(S))`.
Arrows entering the source or leaving the sink are allowed.

Bounded circulations have nonnegative lower and upper bounds `ℓ ≤ u`, satisfy `ℓ ≤ f ≤ u`, and have zero excess at every vertex.
Ordinary flows and bounded circulations share arrow assignments, excess, and bound calculations, but have separate conservation conditions.
Milestone 8 supplies named reductions from bounded circulation feasibility to ordinary max-flow, including their integrality properties.

The residual network of a flow `f` on `N` has the same vertex type, arrow type `N.Hom v w ⊕ N.Hom w v` from `v` to `w`, and residual capacity `u e − f e` on a forward arrow and `f e` on a reverse arrow.
The arrow type does not depend on `f`: arrows of zero residual capacity are ordinary arrows, and an augmenting path is a residual path all of whose arrows have positive residual capacity, equivalently a path in the positive-capacity subnetwork of the residual network, which is how `Suggested.lean` states residual reachability.
A residual type that carried the positivity conditions would change with every augmentation, and the termination and canonical-cut arguments would then transport paths across type equalities at every step.
The two summands distinguish unused forward capacity from cancellation of an existing flow, including when original arrows exist in both directions.
For a bounded circulation, the reverse arrow has residual capacity `f e − ℓ e`.

## 1. Shared foundations

Build the shared undirected walk and path prerequisites in the shapes of [#36756](https://github.com/leanprover-community/mathlib4/pull/36756) and [#39053](https://github.com/leanprover-community/mathlib4/pull/39053), including their missing dependencies, and adopt Mathlib's interfaces as they land.
Supply vertex support, edge occurrences, length, concatenation, reversal, restriction, transport, path extraction, cycles, and the corresponding graph subobjects.
Supply the graph-isomorphism interface needed for transport: equivalences of the actual vertex and edge sets preserving `IsLink`, with identity, inverse, composition, and their action on walks and subgraphs, reusing Mathlib's graph maps and any available isomorphism API.
Supply the union of compatible subgraphs of a fixed graph, with vertex-set and edge-set union formulas and the inherited incidence relation, as needed when adding ears; follow [#38337](https://github.com/leanprover-community/mathlib4/pull/38337) for the general union interface.
Every native walk has a corresponding path of the bidirected quiver with the same vertex sequence and underlying edge sequence, and conversely; prove preservation of length and simple paths.
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

Develop multigraph cuts and separators with membership lemmas, complements, restriction to induced subgraphs, edge and vertex deletion, and invariance under graph isomorphisms.
A cut is a subset of the actual vertices; its boundary is the set of actual edges with one endpoint on each side.
Prove symmetry, absence of loops from the boundary, the cardinality and capacity formulas with parallel edges, and the weighted aggregation theorem from the conventions.
Relate edge separators to cuts obtained from reachable vertex sets.
Provide finite path-family APIs for taking subfamilies, reversing undirected paths, concatenating compatible paths, extracting simple paths from walks, and transporting disjointness.
Include the directed analogues needed for residual reachability and path decomposition, with support and arrow-occurrence lemmas.

Build and verify the representation changes used throughout the roadmap:

- **Orientations and bidirected networks:** transport walks and paths, identify the underlying undirected graph of an orientation, and prove reachability and cut-capacity correspondence for the bidirected construction.
  Match oriented walks with exactly those undirected walks traversing every edge in its chosen direction; arbitrary undirected reachability need not imply directed reachability.
  Prove the simple-graph equivalences with the existing `DoubledQuiver` and `OrientedQuiver` APIs.
- **Vertex splitting:** replace each vertex by an entrance and exit joined by a capacity-constrained arrow, with precise lifting and projection of paths, flows, and separators.
- **Auxiliary terminals:** add a fresh source and sink on a sum type, with path and cut correspondences for terminal sets.
  Supply both the extended-capacity construction using `⊤` and its ordinary finite truncation, with a proved bound large enough for the reduction.
- **Change of coefficients:** map networks, assignments, flows, residual capacities, and cuts along order-preserving additive group homomorphisms, including the standard embeddings `ℤ → ℚ → ℝ` and their `WithTop` extensions.

For the deletion predicates, supply the lemmas missing from Mathlib and from [#33355](https://github.com/leanprover-community/mathlib4/pull/33355), following their shapes: threshold monotonicity, graph monotonicity on a fixed carrier, isomorphism invariance, the zero and one cases, and the relationship between local and global statements.
`IsEdgeReachable.mono` and `isEdgeReachable_one` already exist and are reused.

## 2. Bridges, articulation vertices, and blocks

For a multigraph, a bridge is an actual edge whose deletion disconnects its endpoints.
Prove equivalence with increasing the number of connected components and with lying on no undirected cycle.
Loops are never bridges, and an edge with a distinct parallel edge is not a bridge.
Prove correspondence on actual edges of `Graph.ofSimpleGraph H` with Mathlib's `SimpleGraph.IsBridge` and its `isBridge_iff_forall_cycle_notMem`; membership matters because the simple-graph predicate can also hold for a non-edge joining different components.

Articulation vertices and the block–cut forest use the underlying simple graph and its existing reachability and induced-subgraph APIs.
An articulation vertex `v` is one that separates two other vertices: some `u, w ≠ v` are reachable in `G` but not in the graph induced on the complement of `{v}`.
Prove that this is equivalent to deletion of `v` increasing the number of connected components; the count is a lemma rather than the definition, so no statement needs a `Fintype` instance on a deletion subtype.

A block is a maximal nonempty connected induced subgraph with no articulation vertex of its own.
For simple graphs, bridges that are edges give two-vertex blocks, and isolated vertices give singleton blocks.
Prove that every simple-graph edge belongs to exactly one block, distinct blocks meet in at most one vertex, and a vertex lies in more than one block exactly when it is an articulation vertex.
Transport these vertex blocks and articulation criteria to multigraphs through simplification.
Every nonloop multigraph edge belongs to exactly one vertex block, but a two-vertex block may contain parallel edges and need not consist of a bridge.
A singleton block may carry loops; a loop at an articulation vertex lies in every induced vertex block containing that vertex, so these vertex blocks do not partition loop edges.

Construct the **block–cut incidence graph**, whose two kinds of vertices are blocks and articulation vertices, with adjacency given by membership.
Prove that it is a forest, that its components correspond to the components of the original graph, and that it is a tree when the original graph is connected.
Include the path correspondence that recovers separation in the original graph from the unique paths in this forest.

## 3. Flows and max-flow/min-cut

Develop the finite excess calculus over the coefficient type: additivity, total excess zero, and the identity equating the sum of excesses over a set with its incoming flow minus outgoing flow.
Derive weak duality: the value of every feasible flow is at most the capacity of every terminal-separating cut.

The main targets are:

1. **Residual augmentation.** Augmenting along a simple augmenting `s–t` path by its minimum residual capacity preserves feasibility and increases flow value by that positive amount.
   Prove the update formulas on original arrows and the corresponding bounded-circulation cycle augmentation lemma.
2. **Flow decomposition.** Every flow is a finite nonnegative sum of simple `s–t` path flows and directed cycle flows, with equality on every original arrow.
   For a pseudoflow conserved away from the terminals with negative excess at the designated sink, apply the terminal-exchange construction to obtain the corresponding decomposition into paths in the opposite direction and cycles.
   Circulations decompose into cycle flows, including loops; flows with values in an additive subgroup admit coefficients in that subgroup.
3. **Max-flow/min-cut.** There exist a feasible flow and a terminal-separating cut with equal value and capacity.
   Prove the equivalent optimality criteria: maximum flow, no augmenting `s–t` path, and existence of a cut attaining equality.
4. **Integrality.** Capacities in an additive subgroup `H` of `K` admit a maximum flow whose arrow values are in `H` and whose value equals the minimum cut capacity.
   This is the intrinsic form, and augmentation preserves it since residual capacities are differences of elements of `H`.
   Natural-number capacities in `ℤ`, `ℚ`, or `ℝ` are the case `H = AddSubgroup.zmultiples 1`; state that case with `ℕ`-casts and give the explicit coercion lemmas between the three coefficient types.

A shortest-augmenting-path argument proves existence over every permitted coefficient type because its termination depends only on the finite residual graph, not on discreteness, Archimedeanness, or completeness of the coefficients.
This is the suggested proof route rather than part of the public interface; another proof is acceptable if it establishes the same coefficient-generic theorem without stronger assumptions.
For integer capacities, prove termination of augmentation: each step increases the integer value, which is bounded by the total capacity leaving the source.
Termination of arbitrary augmenting-path choices over dense or non-Archimedean coefficients is not an assumption of the general theorem.

Develop the extended-capacity API from the conventions as a boundary around this finite theorem.
Prove the ordinary-to-extended embedding and cut-capacity coercion, truncation at a finite bound, preservation of flows under truncation and extension, attainment when a finite terminal-separating cut exists, and cofinality of finite flow values when none exists, with unboundedness for nontrivial coefficients.
State weak duality between finite flow values and extended cut capacities without converting `⊤` to a finite coefficient.

## 4. The structure of minimum cuts

State this milestone for set functions, with the cut capacities as instances.
A function `f : Finset V → K` is **submodular** when `f (S ∪ T) + f (S ∩ T) ≤ f S + f T` for all `S, T`, and **symmetric** when `f Sᶜ = f S` for all `S`.
A minimum `s–t` cut for `f` is a minimizer of `f` over the sets containing `s` and not `t`; under symmetry the choice of side is immaterial.
Prove that directed outgoing cut capacity is submodular and that undirected cut capacity is symmetric and submodular.

For a submodular `f` and fixed distinct terminals, prove that the minimum `s–t` cuts are closed under union and intersection.
Develop this family as a finite lattice under inclusion, with unique smallest and largest members.

For a network and any maximum flow, characterize the smallest source side as the vertices reachable from the source along arrows of positive residual capacity.
Characterize the largest as the complement of the vertices from which the sink is reachable along such arrows.
Deduce that these two sets are independent of the chosen maximum flow.

Prove the **non-crossing lemma** for a symmetric submodular `f` as a separate target: if `S` is a minimum `s–t` cut and distinct vertices `u, v` both lie in `S`, there exists a minimum `u–v` cut with one side contained in `S`.
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

State Menger's path–separator equalities in **witness form**: there exist a family of `k` pairwise disjoint paths and a separator of size `k`, for some `k`, and every family of disjoint paths is no larger than every separator.
For adjacent terminals, use the multiplicity correction specified below in both the witnesses and the inequality.
The two statements together are the equality of optima with attainment on both sides.
The derived numerical connectivity invariants package global threshold information, but do not replace these witnesses or the inequalities that certify their optimality.

- **Local edge Menger:** for distinct terminals `s, t`, a family of pairwise edge-disjoint `s–t` paths and a set of edges whose deletion destroys `s–t` reachability, of the same size, together with the inequality between any family and any such edge set.
  Give directed-network and multigraph versions, and derive the `SimpleGraph` statements using Milestone 1.
- **Local vertex Menger:** for distinct nonadjacent terminals, the same with internally vertex-disjoint paths and terminal-excluding vertex separators.
  Give directed-network and multigraph versions with the adjacency convention above, returning actual edge-labelled paths, and derive the `SimpleGraph` statements.
- **Adjacent terminals:** let `D` be the set of all edges joining distinct terminals `s,t`, and let `m = |D|`.
  After deleting all of `D`, a terminal-excluding vertex separator of size `k` and a family of `k + m` internally vertex-disjoint paths in the original graph attain equality, for some `k`.
  The family includes the `m` distinct one-edge paths, and every such family has size at most `|X| + m` for every separator `X` in the graph with `D` deleted.
  The simple-graph corollary has `m = 1` and hence `k + 1` paths, including for the single-edge graph where `k = 0`.
- **Set-to-set Menger:** the same for vertex-disjoint `A`–`B` paths against vertex sets meeting every `A`–`B` path, with the overlap convention above, in directed-network and multigraph versions, with simple-graph corollaries; and edge versions for disjoint terminal sets.

Build the unit-capacity, vertex-splitting, and auxiliary-terminal reductions to max-flow over `ℤ`, where integrality is the case `H = ⊤`, and prove the correspondence in each direction.
These reductions are required reusable interfaces; using them to prove Menger is the suggested proof route rather than an additional constraint on the final theorem.
In the undirected edge reduction, cancel flow in opposite directions separately for each original edge identity before extracting paths, so that one edge cannot be used twice while distinct parallel edges remain distinct.
Discard loop flows and cycle flows when extracting simple terminal-to-terminal paths.
The reductions must recover actual path families and separators, not just equalities of numerical optima.

Derive the predicate forms: local edge reachability at threshold `k` is equivalent to the existence of `k` edge-disjoint paths; local vertex reachability has the analogous equivalence under the nonadjacency hypothesis.
Relate local edge reachability to cuts as well: for distinct actual vertices `s,t`, `G.IsEdgeReachable k s t` holds exactly when `k` is at most the minimum `s–t` cut value with capacity `1 : ℤ` on each actual edge.
After aggregation to pair capacities, the capacity of a pair is its edge multiplicity, not merely an adjacency indicator.
Thus the cut tree of Milestone 9 answers multigraph local edge reachability; for a simple graph this specializes to capacity `1` on edges and `0` elsewhere.
For finite multigraphs with more than `k` actual vertices, and for simple graphs, derive the global characterization of `k`-vertex-connectivity by `k` internally vertex-disjoint paths between every pair of distinct vertices, including adjacent pairs.

## 6. Connectivity and bipartite matching consequences

Prove the vertex-structural and matching consequences in the existing `SimpleGraph` vocabulary, including their application to the underlying simple graph of a multigraph.
Also prove the native multigraph Whitney inequality `vertexConnectivity G ≤ edgeConnectivity G` and the upper bound by the number of nonloop edges incident to each vertex when there are at least two actual vertices.
This count includes parallel edges separately and needs no separate degree theory; the surface topology roadmap owns degree with loops counted twice.
The simple-graph specialization gives the minimum-degree bound below.

- **Whitney inequalities:** `G.IsVertexConnected k` implies `G.IsEdgeConnected k`; for `[Nontrivial V]`, `G.IsEdgeConnected k` implies `k ≤ G.minDegree`.
  Derive the numerical forms `G.vertexConnectivity ≤ G.edgeConnectivity` and, on a finite nontrivial carrier, `G.edgeConnectivity ≤ G.minDegree` after coercing the degree to `ℕ∞`.
- **Common-cycle characterizations:** for a connected simple graph with at least three vertices, each of the following is equivalent to 2-vertex-connectivity: every two distinct vertices lie on a common cycle; every two distinct edges lie on a common cycle.
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
- **Deficiency formula (König–Ore) and Hall:** for bipartition `L, R`, the maximum size of a matching is `|L| − max_{S ⊆ L} (|S| − |N(S)|)`, in witness form: there exist a matching `M` and a set `S ⊆ L` with `|M| + |S| = |L| + |N(S)|`, and every matching and every `S ⊆ L` satisfy `|M| + |S| ≤ |L| + |N(S)|`.
  Derive it from Kőnig by reading a minimum cover `C` as `S = L ∖ C`, so that `(L ∖ S) ∪ N(S)` is again a minimum cover.
  State it also in the indexed-family form of Mathlib's Hall theorem, for `t : ι → Finset α`, with an injective choice function on the subtype of a chosen finite set of indices in place of a matching, so that consumers of either form can use it.
  The choice function is defined only on those indices, allowing the empty partial choice even when `α` is empty.
  Hall's theorem is the case of zero deficiency: derive Mathlib's `Finset.all_card_le_biUnion_card_iff_exists_injective` and `exists_isMatching_of_forall_ncard_le` from the two forms as compatibility checks; Mathlib's statements remain the library's Hall.

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
3. A network `N` with nonempty finite vertex type is strongly connected (`N.IsStronglyConnected`) if and only if it can be built from one vertex by adding directed open or closed ears, covering every arrow.

In the directed version, ears are directed paths and cycles of `N` in the sense of the conventions, they retain arrow identities, and the directed decomposition exposes the same prefix API using subnetworks.
Loops are permitted as one-arrow closed ears.
The initial-vertex convention includes the isolated singleton with no ears; relate it to the cycle-starting formulation for strongly connected networks with at least two vertices.

Prove **Robbins' theorem** for finite multigraphs: an orientation is strongly connected on `V(G)` if and only if `G.IsEdgeConnected 2`.
This needs no connectedness or size hypothesis: both sides hold when the actual vertex set is subsingleton, including with loops.
For nonempty connected multigraphs, derive the classical form that a strongly connected orientation exists exactly when there is no bridge.
Construct the orientation from the ear decomposition and prove strong connectivity through the directed ear characterization.
Include the componentwise result: an orientation strongly connected on each connected component exists exactly when no actual edge is a bridge.
Derive the simple-graph statements through the orientation equivalence of Milestone 1, using `TauCeti.DoubledQuiver.Orientation` in their conclusions.

## 8. Bounded circulations, supplies, and demands

Develop bounded circulations using the shared excess calculus and the lower-bound residual convention.
Include subtraction of lower bounds, the resulting imbalance at each vertex, and transport between the reduced problem and the original arrow assignment.

Prove **Hoffman's circulation theorem**: for finite bounds `0 ≤ ℓ ≤ u`, a feasible circulation exists if and only if, for every vertex set `S`,

$$
\ell(\delta^-(S)) \le u(\delta^+(S)).
$$

Here a bound applied to an arrow set denotes the sum over that set.
Bounds in an additive subgroup `H` of `K` admit a feasible circulation with values in `H` whenever these inequalities hold.

More generally, for a prescribed excess `b : V → K`, prove that an assignment satisfying the bounds and `excess f = b` exists exactly when

$$
\sum_{v \in V} b(v)=0
\quad\text{and}\quad
\sum_{v \in S} b(v)+\ell(\delta^+(S))\le u(\delta^-(S))
\quad\text{for every }S.
$$

Positive `b` denotes demand and negative `b` supply.
For `b` and bounds with values in an additive subgroup `H`, prove feasibility with values in `H`.
Supply the reduction to ordinary max-flow by adding auxiliary terminals and prove that saturating the required auxiliary arrows is equivalent to feasibility, preserving values in `H` in both directions.
Include the bridge turning an ordinary flow of prescribed nonnegative value into a circulation by adding a return arrow from sink to source with that value as both bounds.

## 9. Gomory–Hu cut trees

For every permitted coefficient type, every nonempty finite vertex type, and every symmetric submodular `f : Finset V → K`, prove the existence of a weighted tree on the same vertex type such that:

1. For any distinct vertices `s, t`, their minimum cut value for `f` is the minimum edge weight along their unique tree path.
2. For every tree edge `{u,v}`, deleting that edge gives a partition that is a minimum `u–v` cut for `f`, with value equal to the tree-edge weight.

Prove the resulting query theorem: any minimum-weight edge on the tree path from `s` to `t` yields an actual minimum `s–t` cut by deleting that edge.
State the instances for weighted multigraphs and pair-capacity networks as corollaries, using the cut aggregation theorem of Milestone 1.
The weighted tree is a `SimpleGraph` on the actual vertex type `V(G)` and need not be a subgraph of the original graph.
For unit capacities, parallel edges contribute their multiplicities; prove that the tree answers the edge-connectivity queries of Milestone 5 and recovers cuts as subsets of the original vertex set.
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

## Examples and scope boundaries

Provide proved examples alongside the relevant milestones:

- Complete graphs, including the distinction between adjacent-terminal deletion connectivity and path counts.
- Paths and cycles, including their bridges, blocks, and connectivity predicates.
- Two triangles meeting at one vertex, with its explicit block–cut tree, and a loop at the common vertex demonstrating the vertex-block convention.
- Empty graphs, isolated vertices, and the two-vertex single-edge graph, exercising the size conventions.
- Two vertices joined by two parallel edges: edge connectivity two, a two-edge cycle and closed ear, and a strongly connected orientation, compared with the single-edge simplification.
- A loop on one vertex: a one-edge cycle and closed ear, no bridge, and no contribution to cuts.
- Parallel direct terminal edges together with a path through an internal vertex, verifying the adjacent-terminal multiplicity formula.
- A finite multigraph on infinite ambient types, verifying that finiteness hypotheses concern only its actual vertices and edges.
- Weighted multigraph aggregation with parallel edges, loops, and zero-capacity edges, and pair capacities with nonzero diagonal entries, proving the specified cut invariance.
- Networks with parallel and antiparallel arrows, a loop, and zero capacities over integer, rational, and real coefficients, exercising residual tags and finite sums.
- A capacity-feasible assignment with negative excess at the designated sink, verifying terminal exchange, and a prescribed-excess example verifying the supply and demand signs.
- An extended network with an uncapacitated arrow and a finite terminal-separating cut, together with its finite truncation, and an extended network whose finite flow values are unbounded.
- A bounded-circulation example in which positive flow at its lower bound cannot be cancelled.
- A disconnected weighted graph whose cut tree contains zero-weight edges.

General contractions, contractible-edge and wheel theorems, planar embeddings, and surface topology are outside this roadmap.
The [surface topology roadmap](https://github.com/TauCetiProject/TauCetiRoadmap/pull/271) owns drawings, embeddings, multigraph degree, contractions, and the contractible-edge and wheel theorems.
Its 3-connectivity targets use `SimpleGraph`; their `IsThreeConnected` is the specialization `IsVertexConnected 3` of this roadmap's vertex-connectivity API.
This roadmap owns graph connectivity, components, separators, and their representation bridges; the surface topology development uses that common API for its underlying multigraphs and its simple-graph theorems.
No second component or 3-connectivity theory is required in the surface topology development.

General matching theory beyond the bipartite consequences above, min-cost and multicommodity flows, infinite graphs, treewidth, and algorithmic complexity bounds are outside this roadmap.

## Mathematical references

- Reinhard Diestel, *Graph Theory*, Chapter 3, for connectivity, Menger, blocks, fans, and ears; see the [author's book site](https://diestel-graph-theory.com/).
- Alexander Schrijver, *Combinatorial Optimization: Polyhedra and Efficiency*, Volume A, for flows, cuts, disjoint paths, circulations, and cut trees; see the [author's book page](https://homepages.cwi.nl/~lex/co/).
- Bernhard Korte and Jens Vygen, *Combinatorial Optimization: Theory and Algorithms*, Section 8.6, for the Gomory–Hu construction and the witness-repair step of its correctness proof.
- Jørgen Bang-Jensen and Gregory Gutin, *Digraphs: Theory, Algorithms and Applications*, for directed connectivity, directed ears, and network flows; see the [second edition](https://doi.org/10.1007/978-1-84800-998-1).
- Dan Gusfield, [*Very Simple Methods for All Pairs Network Flow Analysis*](https://doi.org/10.1137/0219009), SIAM Journal on Computing 19 (1990), 143–155, for the contraction-free cut-tree construction.
