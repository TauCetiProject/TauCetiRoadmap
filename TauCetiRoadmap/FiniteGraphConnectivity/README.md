# Finite graph connectivity: Menger, flows, and cuts

This roadmap develops finite graph connectivity through two complementary theories: the structure of connected graphs, and the duality between disjoint paths and separating cuts.
The main results are Menger's theorem, the block–cut forest, ear decompositions, Robbins' strong orientation theorem, max-flow/min-cut with integrality, Hoffman's circulation theorem, and Gomory–Hu cut trees.
The supporting library includes separators, path families, orientations, residual networks, flow decomposition, and minimum-cut structure.
These objects must have reusable APIs, including transport between the graph representations used by their consumers.

The structural development runs through blocks, connectivity consequences, and ears.
The quantitative development runs through flows, minimum cuts, and disjoint paths, then supports bipartite matching, bounded circulations, and cut trees.
All graphs and networks in the theorem targets are finite.

**Suggested homes:** `TauCeti/Combinatorics/SimpleGraph/Connectivity/` for undirected connectivity, `TauCeti/Combinatorics/Quiver/Flow/` for directed networks, and adjacent modules for the representation bridges.

[`Suggested.lean`](Suggested.lean) prototypes the pinned structures (networks, flows, the residual network, orientations, the connectivity predicates, ear decompositions, weighted trees) and a few milestone statements.
It is read as suggested forms, never as an exhaustive checklist; this document is the specification.

## Milestones at a glance

| Milestone | Main results | Depends on |
| --- | --- | --- |
| 1. Shared foundations | Cuts, separators, disjoint path families, orientations, and network constructions | Existing Mathlib graph APIs |
| 2. Blocks | Bridge and articulation criteria; block–cut forest | 1 |
| 3. Flows | Residual augmentation, flow decomposition, max-flow/min-cut, integrality | 1 |
| 4. Minimum cuts | Submodularity, minimum-cut lattice, non-crossing lemma (1); canonical cuts (3) | 1, 3 |
| 5. Menger | Directed and undirected path–separator duality | 1, 3 |
| 6. Connectivity and matching consequences | Whitney inequalities and cycle criteria, preservation lemmas, fans, Dirac's cycle theorem, Kőnig and Hall | 2, 5 |
| 7. Ears and orientations | Undirected and directed ear decompositions; Robbins' theorem | 2, 6 |
| 8. Circulations | Hoffman, prescribed supplies and demands, integral feasibility | 3 |
| 9. Cut trees | Gomory–Hu, including recovery of minimum cuts | 4 |
| 10. Bridge to `Graph` | Transport of reachability and vertex connectivity to Mathlib's multigraph type | 1, 5 |

Each milestone includes the elementary lemmas needed to use its definitions: constructors, extensionality where appropriate, membership and support lemmas, monotonicity, restriction, and invariance under isomorphism.
The targets below specify the additional API particular to each object.

## Existing vocabulary and related work

Use Mathlib's `SimpleGraph` APIs for walks and paths, reachability, connected components, subgraphs, induced subgraphs, edge deletion, cycles, trees, degree, bipartite graphs, and matchings.
In particular, reuse [`SimpleGraph.IsEdgeConnected`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Combinatorics/SimpleGraph/Connectivity/EdgeConnectivity.html#SimpleGraph.IsEdgeConnected), [`SimpleGraph.IsBridge`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Combinatorics/SimpleGraph/Connectivity/Connected.html#SimpleGraph.IsBridge) with its cycle characterization `isBridge_iff_forall_cycle_notMem`, [`SimpleGraph.minDegree`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Combinatorics/SimpleGraph/Finite.html#SimpleGraph.minDegree), and [`Quiver.IsStronglyConnected`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Combinatorics/Quiver/ConnectedComponent.html#Quiver.IsStronglyConnected).
Mathlib also supplies the [`Graph`–`SimpleGraph` conversions](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Combinatorics/Graph/Simple.html), [graph versions of Hall's theorem](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Combinatorics/SimpleGraph/Hall.html), and the [finite-family Hall theorem](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Combinatorics/Hall/Finite.html).

The following Mathlib proposals guide the corresponding interfaces:

- [#33355: vertex connectivity](https://github.com/leanprover-community/mathlib4/pull/33355): deletion-based `IsVertexReachable`, `IsVertexPreconnected`, and `IsVertexConnected`.
- [#43017: network flows](https://github.com/leanprover-community/mathlib4/pull/43017): quivers with capacities and flow assignments indexed by arrows.
- [#34028: weak max-flow/min-cut duality](https://github.com/leanprover-community/mathlib4/pull/34028): the undirected flow–cut inequality and its connection to simple graphs.
- [#33032: Kőnig's theorem](https://github.com/leanprover-community/mathlib4/pull/33032): matchings as subgraphs, vertex covers, and the equality between the sizes of maximum matchings and minimum covers.

Build all missing prerequisites and results in Tau Ceti, following these interfaces and adopting Mathlib's resulting design when available.
An unmerged proposal is a design reference, not a dependency that contributors must wait for.
For flows, provide the finite-sum interface specified below and prove its agreement with the upstream interface; this includes the sign conversion between divergence and excess if their conventions differ.

The [Lean Zulip discussion of max-flow/min-cut](https://leanprover-community.github.io/archive/stream/252551-graph-theory/topic/max-flow.20min-cut.20help.html) records earlier quiver-based formalization work, including [maxflowmincutlean4](https://gitlab.com/Shreyas941/maxflowmincutlean4).
Coordinate with authors before integrating existing code, following the repository's porting policy.
The mathematical targets here do not require importing that implementation.

## Conventions

### Graphs, networks, and orientations

**Undirected graphs** use `SimpleGraph V`, with `[Fintype V]` for finite sums and cardinalities.
Statements carry `[DecidableEq V]` and `[DecidableRel G.Adj]` exactly where the Mathlib definitions they mention require them, as `edgeFinset` and `minDegree` do; proofs may reason classically.
Edges are unordered pairs represented by `Sym2 V` and restricted to the graph's edge set.
Weighted undirected networks assign a capacity in `ℝ≥0` to each edge; a cut counts each crossing edge once.

**Directed networks** are terms, not typeclass instances.
A network `N : Network V` is a structure carrying an arrow type `N.Hom v w : Type` for every ordered pair of vertices and a capacity in `ℝ≥0` for every arrow; finiteness is the pair of instance arguments `[Fintype V]` and `[∀ v w, Fintype (N.Hom v w)]`.
Mathlib's quiver API (`Quiver.Path`, `Quiver.IsStronglyConnected`, strongly connected components) is reached through a type synonym `N.Vert := V` carrying the `Quiver` instance `⟨N.Hom⟩`, the pattern Mathlib itself uses for `Quiver.Symmetrify`.
Quivers are typeclasses on the vertex type, so a network, its residual network, and each orientation of a graph would otherwise compete for one instance on `V`; as terms they coexist and can be quantified over.
The total arrow type is the dependent sum of the arrow types over ordered pairs of vertices.
Parallel arrows, arrows in opposite directions, loops, and zero capacities are allowed.
Capacities and flow assignments take values in `ℝ≥0`.
Every network sum is a `Finset.sum`; divergence and flow value take values in `ℝ`, since they can be negative.
The finite theory must not require reasoning about infinite sums or infinities to state its results.
Mathlib proposal #43017 takes its quiver as an explicit term with capacities indexed by `G.Hom v w`, so agreement with it is a matter of field names and sum spelling; if that API uses `tsum` or `EReal`, supply finite-sum agreement lemmas rather than a competing public notion of flow.

**An orientation** `o : G.Orientation` of a simple graph chooses one dart (`SimpleGraph.Dart`) for every edge, with no additional arrows.
The oriented graph is the type synonym `G.Oriented o := V` with the quiver instance whose arrows from `v` to `w` are the edges whose chosen dart runs from `v` to `w`, so strong connectivity is literally `Quiver.IsStronglyConnected (G.Oriented o)`.
The separate bidirected construction replaces each undirected edge by two oppositely directed arrows of the same capacity, giving a network in the sense above.
Milestone 1 supplies the transport lemmas for both constructions.

### Paths, separators, and connectivity

Undirected paths use Mathlib's simple-path predicate on walks.
Directed paths use quiver paths with an explicit no-repeated-vertices condition; quiver paths alone can repeat vertices.
Directed cycles have positive length and no repeated vertices apart from the coinciding endpoints.
Path families are finite and contain distinct paths.
Edge-disjointness concerns unordered edges in an undirected graph and actual arrow identities in a quiver.
Internally vertex-disjoint paths between distinct terminals may share only those terminals.
In particular, a family cannot count the same single-edge path repeatedly merely because it has no internal vertices.

A local vertex separator for distinct terminals `s, t` excludes both terminals and destroys reachability after deletion.
The local vertex form of Menger therefore assumes that `s` and `t` are nonadjacent; in the directed case, there must be no arrow from `s` to `t`.
Deletion-based local vertex reachability for adjacent terminals can hold for every `k`, so it must not be identified with the number of internally disjoint paths without that qualification.
Milestone 5 also gives the adjacent-terminal version for simple graphs.

For vertex-disjoint paths between sets `A` and `B`, separators may meet `A ∪ B`.
Paths have one endpoint in each set, their interiors avoid `A ∪ B`, and the paths are disjoint including endpoints.
A vertex in `A ∩ B` contributes a permitted zero-length path and must belong to every separator.
There is no prescribed pairing of the endpoints.
For the edge-disjoint set-to-set version, require `A` and `B` to be disjoint; paths may share endpoints.

Use the deletion-based connectivity predicates, with natural-number thresholds coerced where an upstream predicate takes `ℕ∞`.
Global `k`-vertex-connectivity includes the size condition `k < Fintype.card V`.
Do not introduce numerical vertex- or edge-connectivity functions for this roadmap.
On a subsingleton vertex type `IsEdgeConnected k` holds for every `k` and `IsVertexConnected k` fails for every `k ≥ 1`; keep both conventions, and let statements involving minimum degree carry `[Nontrivial V]`.

### Flows and bounded circulations

Write `δ⁺(S)` for arrows leaving a vertex set and `δ⁻(S)` for arrows entering it.
For an arrow assignment `f`, divergence is outgoing flow minus incoming flow.
An ordinary `s–t` flow satisfies `0 ≤ f ≤ u` and has zero divergence away from distinct terminals `s` and `t`.
Its value is the divergence at `s`, equivalently minus the divergence at `t`.
A cut is a source side `S` with `s ∈ S` and `t ∉ S`, of capacity `u(δ⁺(S))`.
Arrows entering the source or leaving the sink are allowed.

Bounded circulations have nonnegative lower and upper bounds `ℓ ≤ u`, satisfy `ℓ ≤ f ≤ u`, and have zero divergence at every vertex.
Ordinary flows and bounded circulations share arrow assignments, divergence, and bound calculations, but have separate conservation conditions.
Milestone 8 supplies named reductions from bounded circulation feasibility to ordinary max-flow, including their integrality properties.

The residual network of a flow `f` on `N` has the same vertex type, arrow type `N.Hom v w ⊕ N.Hom w v` from `v` to `w`, and residual capacity `u e − f e` on a forward arrow and `f e` on a reverse arrow.
The arrow type does not depend on `f`: arrows of zero residual capacity are ordinary arrows, and an augmenting path is a residual path all of whose arrows have positive residual capacity.
A residual type that carried the positivity conditions would change with every augmentation, and the termination and canonical-cut arguments would then transport paths across type equalities at every step.
The two summands distinguish unused forward capacity from cancellation of an existing flow, including when original arrows exist in both directions.
For a bounded circulation, the reverse arrow has residual capacity `f e − ℓ e`.

## 1. Shared foundations

Develop cuts and separators with membership lemmas, complements, restriction to induced subgraphs, edge and vertex deletion, and invariance under graph isomorphisms.
Relate edge separators to cuts obtained from reachable vertex sets.
Provide finite path-family APIs for taking subfamilies, reversing undirected paths, concatenating compatible paths, extracting simple paths from walks, and transporting disjointness.
Include the directed analogues needed for residual reachability and path decomposition, with support and arrow-occurrence lemmas.

Build and verify the representation changes used throughout the roadmap:

- **Orientations and bidirected networks:** transport walks, paths, reachability, and cut capacities; identify the underlying undirected graph of an orientation.
- **Vertex splitting:** replace each vertex by an entrance and exit joined by a capacity-constrained arrow, with precise lifting and projection of paths, flows, and separators.
- **Auxiliary terminals:** add a fresh source and sink on a sum type, with path and cut correspondences for terminal sets.
  Use explicit finite capacity bounds for auxiliary arrows rather than an infinite-capacity symbol.

For the deletion predicates, supply threshold monotonicity, graph monotonicity on a fixed carrier, isomorphism invariance, the zero and one cases, and the relationship between local and global statements.

## 2. Bridges, articulation vertices, and blocks

Bridges are Mathlib's `SimpleGraph.IsBridge`, defined by edge deletion and characterized by `isBridge_iff_forall_cycle_notMem` as the edges lying on no cycle; reuse both rather than restating them.
An articulation vertex `v` is one that separates two other vertices: some `u, w ≠ v` are reachable in `G` but not in the graph induced on the complement of `{v}`.
Prove that this is equivalent to deletion of `v` increasing the number of connected components; the count is a lemma rather than the definition, so no statement needs a `Fintype` instance on a deletion subtype.

A block is a maximal nonempty connected induced subgraph with no articulation vertex of its own.
Thus bridges give two-vertex blocks, and isolated vertices give singleton blocks.
Prove that every edge belongs to exactly one block, distinct blocks meet in at most one vertex, and a vertex lies in more than one block exactly when it is an articulation vertex.

Construct the **block–cut incidence graph**, whose two kinds of vertices are blocks and articulation vertices, with adjacency given by membership.
Prove that it is a forest, that its components correspond to the components of the original graph, and that it is a tree when the original graph is connected.
Include the path correspondence that recovers separation in the original graph from the unique paths in this forest.

## 3. Flows and max-flow/min-cut

Develop the finite divergence calculus: linearity for real arrow assignments, total divergence zero, and the identity equating the sum of divergences over a set with its outgoing flow minus incoming flow.
Derive weak duality: the value of every feasible flow is at most the capacity of every terminal-separating cut.
Relate the directed statement to the simple-graph flow–cut interface through the bidirected construction.

The main targets are:

1. **Residual augmentation.** Augmenting along a simple augmenting `s–t` path by its minimum residual capacity preserves feasibility and increases flow value by that positive amount.
   Prove the update formulas on original arrows and the corresponding bounded-circulation cycle augmentation lemma.
2. **Flow decomposition.** Every feasible flow of nonnegative value is a finite nonnegative sum of simple `s–t` path flows and directed cycle flows, with equality on every original arrow.
   Negative-value flows have the corresponding decomposition with the terminals exchanged.
   Circulations decompose into cycle flows, including loops; integral flows admit integral coefficients.
3. **Max-flow/min-cut.** There exist a feasible flow and a terminal-separating cut with equal value and capacity.
   Prove the equivalent optimality criteria: maximum flow, no augmenting `s–t` path, and existence of a cut attaining equality.
4. **Integrality.** Natural-number capacities admit a natural-number-valued maximum flow whose value equals the minimum cut capacity, with explicit coercion to the real-valued theorem.

For real capacities, the intended existence proof uses compactness of the nonempty feasible set in the finite-dimensional space of real arrow assignments, followed by residual reachability to obtain a minimum cut.
For integral capacities, prove termination of augmentation: each step increases the integral value, which is bounded by the total capacity leaving the source.
Termination of arbitrary augmenting-path choices with irrational capacities is not an assumption of the real theorem.

## 4. The structure of minimum cuts

Prove submodularity of directed outgoing cut capacity and of undirected cut capacity.
For fixed distinct terminals, prove that minimum-cut source sides are closed under union and intersection.
Develop this family as a finite lattice under inclusion, with unique smallest and largest source sides.

For any maximum flow, characterize the smallest source side as the vertices reachable from the source along arrows of positive residual capacity.
Characterize the largest as the complement of the vertices from which the sink is reachable along such arrows.
Deduce that these two sets are independent of the chosen maximum flow.

Prove the undirected **non-crossing lemma** as a separate target: if `S` is one side of a minimum `s–t` cut and distinct vertices `u, v` both lie in `S`, there exists a minimum `u–v` cut with one side contained in `S`.
Include the cut identities and uncrossing inequalities needed to choose such a cut without changing its capacity.
The proof uses only submodularity and the symmetry of the undirected cut function (its posimodularity); it needs no flows, and it fails for directed cut capacities, so do not attempt a directed version.
This is the interface used by the cut-tree milestone.
Submodularity, the lattice, and the non-crossing lemma rest on Milestone 1 alone; Milestone 3 enters this milestone only for the residual characterization of the canonical cuts.

## 5. Menger's theorem

Prove the following maximum-packing/minimum-separator equalities, with attainment on both sides:

- **Local edge Menger:** for distinct terminals, the maximum number of edge-disjoint paths equals the minimum number of edges whose deletion destroys terminal reachability.
  Give directed and undirected versions.
- **Local vertex Menger:** for distinct nonadjacent terminals, the maximum number of internally vertex-disjoint paths equals the minimum size of a terminal-excluding vertex separator.
  Give directed and undirected versions with the adjacency convention above.
- **Adjacent terminals in a simple graph:** the maximum number of internally vertex-disjoint `s–t` paths is one plus the minimum size of an `s–t` vertex separator after deleting the edge `{s,t}`.
- **Set-to-set Menger:** give directed and undirected vertex versions with the overlap convention above, and edge versions for disjoint terminal sets.

Use integral max-flow with unit capacities, vertex splitting, and auxiliary terminals, and prove the correspondence in each direction.
In the undirected edge reduction, cancel flow in opposite directions before extracting paths so that a single undirected edge cannot be used twice.
The reductions must recover actual path families and separators, not just equalities of numerical optima.

Derive the predicate forms: local edge reachability at threshold `k` is equivalent to the existence of `k` edge-disjoint paths; local vertex reachability has the analogous equivalence under the nonadjacency hypothesis.
For finite simple graphs with more than `k` vertices, derive the global characterization of `k`-vertex-connectivity by `k` internally vertex-disjoint paths between every pair of distinct vertices, including adjacent pairs.

## 6. Connectivity and bipartite matching consequences

Prove these consequences in the existing graph vocabulary:

- **Whitney inequalities:** `G.IsVertexConnected k` implies `G.IsEdgeConnected k`; for `[Nontrivial V]`, `G.IsEdgeConnected k` implies `k ≤ G.minDegree`.
- **Common-cycle characterizations:** for a connected simple graph with at least three vertices, each of the following is equivalent to 2-vertex-connectivity: every two distinct vertices lie on a common cycle; every two distinct edges lie on a common cycle.
  Relate the blocks with at least three vertices from Milestone 2 to maximal 2-vertex-connected induced subgraphs.
- **Preservation lemmas:** deleting `m < k` vertices from a `k`-vertex-connected graph leaves a `(k − m)`-vertex-connected graph; adjoining a new vertex adjacent to at least `k` vertices of a `k`-vertex-connected graph gives a `k`-vertex-connected graph; adding edges preserves `k`-vertex- and `k`-edge-connectivity.
  The proofs of the fan lemma and Dirac's theorem below use the first two.
- **Fan lemma:** in a `k`-vertex-connected graph, a vertex `x` outside a set `U` with at least `k` vertices has `k` paths to distinct vertices of `U`, with interiors outside `U` and pairwise intersection exactly `{x}`.
- **Dirac's prescribed-vertex cycle theorem:** for `k ≥ 2`, every set of `k` vertices in a `k`-vertex-connected graph lies on a cycle.
  No cyclic order of those vertices is prescribed.
- **Kőnig's theorem:** in a finite bipartite graph, there exist a matching and a vertex cover of equal size, and every maximum matching has the same number of edges as every minimum vertex cover has vertices.
  Use `SimpleGraph.Subgraph.IsMatching`, `SimpleGraph.IsVertexCover`, and the extremality interfaces of Mathlib proposal #33032.
  Build their missing finite API here, including attainment, the matching–cover inequality, and the flow construction that recovers witnesses.
  For bipartition `L, R`, use unit capacities from the source to `L` and from `R` to the sink, and capacity `|L| + 1` on graph edges directed from `L` to `R`, so that no such edge crosses a minimum cut.
  Prove that integral flows encode matchings and that a minimum-cut source side `S` yields the cover `(L ∖ S) ∪ (R ∩ S)`.
- **Hall from Kőnig:** derive Hall's theorem for bipartite simple graphs in the statement Mathlib already uses, `exists_isMatching_of_forall_ncard_le`: if every subset of one part has at least as many neighbours as elements, a matching saturates that part.
  The deduction must not depend on Hall itself, and the result is compared with Mathlib's theorem, not used in place of it.
  Mathlib's finite-family form of Hall is already a theorem, and Mathlib derives the graph form from it, so no incidence-graph construction is needed here.

## 7. Ear decompositions and strong orientations

An open ear is a positive-length path adding unused edges, with distinct endpoints already present and all internal vertices new.
A closed ear is a cycle adding unused edges and meeting the existing subgraph at exactly its base vertex.
Decompositions are finite and cover all vertices and all edges of the graph.
Single-edge open ears are allowed, so the decomposition can include edges between vertices already present.
Provide the API for initial segments, the subgraph built at each step, edge coverage, and preservation of the relevant connectivity property.

Prove three characterizations:

1. A finite simple graph with at least three vertices is 2-vertex-connected if and only if it has an open ear decomposition starting from a cycle.
2. A finite nonempty simple graph is 2-edge-connected (`IsEdgeConnected 2`) if and only if it can be built from one vertex by adding open or closed ears.
   Prove first that `G.IsEdgeConnected 2 ↔ ∀ e, ¬ G.IsBridge e`, the form Mathlib's edge-connectivity file names as its intended statement; note that `IsBridge` on a non-edge means its endpoints are unreachable, so the right-hand side already includes connectedness.
3. A finite nonempty quiver is strongly connected if and only if it can be built from one vertex by adding directed open or closed ears, covering every arrow.

In the directed version, ears respect arrow directions and retain arrow identities.
Loops are permitted as one-arrow closed ears.
The initial-vertex convention includes the isolated singleton with no ears; relate it to the cycle-starting formulation for strongly connected quivers with at least two vertices.

Prove **Robbins' theorem** in the form `(∃ o : G.Orientation, Quiver.IsStronglyConnected (G.Oriented o)) ↔ G.IsEdgeConnected 2`.
This needs no connectedness or size hypothesis: both sides hold on a subsingleton, and for a connected graph it is the classical statement that a strongly connected orientation exists exactly when there is no bridge, which should be derived as a corollary.
Construct the orientation from the ear decomposition, directing each ear as a directed path or cycle, and prove strong connectivity of `G.Oriented o` through the directed ear characterization.
Include the componentwise result that a graph admits an orientation strongly connected on each connected component exactly when it has no bridges.

## 8. Bounded circulations, supplies, and demands

Develop bounded circulations using the shared divergence calculus and the lower-bound residual convention.
Include subtraction of lower bounds, the resulting imbalance at each vertex, and transport between the reduced problem and the original arrow assignment.

Prove **Hoffman's circulation theorem**: for finite bounds `0 ≤ ℓ ≤ u`, a feasible circulation exists if and only if, for every vertex set `S`,

$$
\ell(\delta^-(S)) \le u(\delta^+(S)).
$$

Here a bound applied to an arrow set denotes the sum over that set.
Natural-number bounds admit a natural-number-valued feasible circulation whenever these inequalities hold.

More generally, for a prescribed real divergence `b : V → ℝ`, prove that an assignment satisfying the bounds and `div f = b` exists exactly when

$$
\sum_{v \in V} b(v)=0
\quad\text{and}\quad
\sum_{v \in S} b(v)+\ell(\delta^-(S))\le u(\delta^+(S))
\quad\text{for every }S.
$$

Positive `b` denotes supply and negative `b` demand.
For integer `b` and natural-number bounds, prove integral feasibility.
Supply the reduction to ordinary max-flow by adding auxiliary terminals and prove that saturating the required auxiliary arrows is equivalent to feasibility, preserving integrality in both directions.
Include the bridge turning an ordinary flow of prescribed nonnegative value into a circulation by adding a return arrow from sink to source with that value as both bounds.

## 9. Gomory–Hu cut trees

For every nonempty finite simple graph with nonnegative real edge capacities, prove the existence of a weighted tree on the same vertex type such that:

1. For any distinct vertices `s, t`, their minimum cut capacity in the original graph is the minimum edge weight along their unique tree path.
2. For every tree edge `{u,v}`, deleting that edge gives a partition that is a minimum `u–v` cut in the original graph, with capacity equal to the tree-edge weight.

Prove the resulting query theorem: any minimum-weight edge on the tree path from `s` to `t` yields an actual minimum `s–t` cut by deleting that edge.
The tree need not be a subgraph of the original graph.
Disconnected graphs and zero capacities are included, with zero-weight tree edges; a singleton has the one-vertex tree.

Develop the weighted-tree API needed for these statements: unique paths, fundamental partitions, minimum weights on nonempty paths, and transport under vertex equivalences.
The intended proof is the contraction-free one behind **Gusfield's method**: process the vertices in some order, and for each new vertex take a minimum cut separating it from its current tree neighbour, chosen by the non-crossing lemma so that it does not cross the cuts already fixed; the tree is then rewired on that neighbour's side.
As an existence proof this needs a minimum cut at each step, which finiteness of the vertex type supplies, together with submodularity and the non-crossing lemma from Milestone 4; it uses no flows and no graph contraction.
State the invariant maintained by the recursion (each fixed tree edge is a minimum cut for its endpoints, and every later cut lies inside one side of every earlier cut) as a named lemma, since it carries the whole correctness argument.

## 10. Bridge to Mathlib's `Graph`

Mathlib's multigraph type `Graph α β` carries loops and parallel edges, and the surface topology roadmap states its 3-connectivity results on it.
Using `Graph.toSimpleGraph` and `Graph.ofSimpleGraph`, prove that reachability and the vertex-connectivity predicates transport along the underlying simple graph, including compatibility with vertex deletion and induced subgraphs.
Since `Graph.toSimpleGraph G` has carrier `V(G)`, these statements include the required subtype equivalences.
Forgetting loops and parallel edges preserves vertex connectivity; it does not preserve edge connectivity, and the bridge states this limit.
Nothing in Milestones 1–9 consumes this milestone; it exists so that a consumer working on `Graph` reads `k`-vertex-connectivity as `IsVertexConnected k` of the underlying simple graph and inherits Menger's theorem through the transport lemmas.

## Examples and scope boundaries

Provide proved examples alongside the relevant milestones:

- Complete graphs, including the distinction between adjacent-terminal deletion connectivity and path counts.
- Paths and cycles, including their bridges, blocks, and connectivity predicates.
- Two triangles meeting at one vertex, with its explicit block–cut tree.
- Empty graphs, isolated vertices, and the two-vertex single-edge graph, exercising the size conventions.
- Networks with parallel and antiparallel arrows, a loop, and zero capacities, exercising residual tags and finite sums.
- A bounded-circulation example in which positive flow at its lower bound cannot be cancelled.
- A disconnected weighted graph whose cut tree contains zero-weight edges.

The [surface topology roadmap](https://github.com/TauCetiProject/TauCetiRoadmap/pull/271) works on `Graph` and consumes vertex connectivity through Milestone 10, reading 3-vertex-connectivity as `IsVertexConnected 3` of the underlying simple graph.
General contractions, contractible-edge and wheel theorems, planar embeddings, and surface topology belong to that roadmap.

General matching theory beyond the bipartite consequences above, min-cost and multicommodity flows, infinite graphs, treewidth, and algorithmic complexity bounds are outside this roadmap.

## Mathematical references

- Reinhard Diestel, *Graph Theory*, Chapter 3, for connectivity, Menger, blocks, fans, and ears; see the [author's book site](https://diestel-graph-theory.com/).
- Alexander Schrijver, *Combinatorial Optimization: Polyhedra and Efficiency*, Volume A, for flows, cuts, disjoint paths, circulations, and cut trees; see the [author's book page](https://homepages.cwi.nl/~lex/co/).
- Jørgen Bang-Jensen and Gregory Gutin, *Digraphs: Theory, Algorithms and Applications*, for directed connectivity, directed ears, and network flows; see the [second edition](https://doi.org/10.1007/978-1-84800-998-1).
- Dan Gusfield, [*Very Simple Methods for All Pairs Network Flow Analysis*](https://doi.org/10.1137/0219009), SIAM Journal on Computing 19 (1990), 143–155, for the contraction-free cut-tree construction.
