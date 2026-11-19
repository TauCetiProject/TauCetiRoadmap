# Roadmap: finite graph connectivity and network flows

**Summary.** This roadmap develops the connectivity theory of finite graphs and the theory of
flows in finite networks: the structure of connected graphs (bridges, blocks, ears, orientations)
and the duality between families of disjoint paths and separating cuts (flows, cuts,
circulations), which meet in Menger's theorem. Undirected graphs are Mathlib's multigraphs, which
keep loops and parallel edges, with corollaries for simple graphs. A directed network carries on
each arrow a lower and an upper bound in a linearly ordered additive commutative group, so that one
theory serves the integers, the rationals and the reals; the theory of minimum cuts works over a
linearly ordered cancellative commutative monoid, so that natural-number weights need no cast.
Statements are made at the generality their proofs support: a finiteness hypothesis bears on the
actual vertices or edges a statement uses, and none is imposed where a proof does not use it.

The headline theorems are these.

- *Max-flow/min-cut with integrality.* In a network with finitely many vertices and arrows,
  nonnegative capacities and distinct terminals `s` and `t`, some flow from `s` to `t` has value
  equal to the capacity of some vertex set containing `s` and not `t`. If the capacities lie in an
  additive subgroup, the flow can be chosen with all its values in that subgroup.
- *Menger's theorem.* For distinct nonadjacent vertices `s` and `t` of a graph with finitely many
  vertices, the largest number of `s–t` paths pairwise meeting only at their ends equals the least
  number of other vertices meeting every `s–t` path. The same duality holds for edge-disjoint
  paths, between vertex sets, with vertex capacities, and in directed graphs. A finite simple graph
  with more than `k` vertices is `k`-vertex-connected exactly when any two of its vertices are joined
  by `k` such paths.
- *The Gomory–Hu theorem.* Every symmetric submodular function on the subsets of a nonempty finite
  set `V` has a cut tree: a weighted tree on `V` in which the minimum cut value between any two
  points is the least weight on the path joining them, and deleting any tree edge splits `V` along
  a minimum cut between the ends of that edge.
- *Robbins' theorem.* A multigraph with finitely many vertices and edges has an orientation in
  which every vertex can reach every other exactly when any two of its vertices remain joined by a
  walk after any one edge is deleted, that is, when it is 2-edge-connected.

Around these, the roadmap proves Hoffman's circulation theorem and its interval form, the
description of the minimum cuts of a network by the upper sets of a finite poset, Hakimi's theorem
on orientations with prescribed indegrees, the bridge forest and the block–cut forest of a graph,
Whitney's ear theorem and the existence of `st`-numberings, and Kőnig's theorem that a finite
bipartite multigraph whose vertices each meet at most `k` edges has a proper edge-colouring with
`k` colours, together with the capacitated Kőnig and Hall theorems on which it rests.

The roadmap builds on Mathlib's multigraphs, simple graphs, quiver paths and strong connectivity,
and on Tau Ceti's networks, flows, cut functions and multigraph walks, which its layers name and
use. ZigzagPreprojective owns the orientations of simple graphs, which the simple-graph forms of
Robbins' theorem and of `st`-numberings use. FreeGroupsAndLimitGroups and
TemperleyLiebOperatorAlgebras take multigraph walks and component counts from the first layer, and
NeronModelsAndSemistableAbelianVarieties takes excess and signed circulations from the first and
eighth layers.

## How to read the build

Layer 1 lays the shared foundations: walks in multigraphs and their bridges to simple graphs,
quivers and orientations; cuts and separators; the excess calculus and residual updates of
networks; vertex splitting and auxiliary terminals; the connectivity predicates and their
numerical invariants. Layer 2 treats bridges, bonds, cut vertices and blocks, with the bridge forest
and the block–cut forest. Layer 3 is the theory of flows: decomposition, augmentation,
max-flow/min-cut with integrality and termination, terminal sets, undirected networks and mixed
vertex and arrow capacities. Layer 4 describes the minimum cuts of a submodular function and of a
network: their lattice, their residual description, the non-crossing lemmas and the poset of all
minimum cuts. Layer 5 proves Menger's theorem in every form, and Layer 6 its consequences:
Whitney's inequalities, directed connectivity, cycles through prescribed vertices, the fan lemma,
and bipartite matching and edge-colouring with capacities. Layer 7 treats ear decompositions,
Robbins' theorem and `st`-numberings. Layer 8 treats circulations with bounds, prescribed and
interval excess, extremal terminal values, rounding and orientations with bounded indegrees.
Layer 9 builds cut trees. There are three independent entry points: walks in multigraphs (§1.1),
the excess calculus of networks (§1.3), and abstract submodularity (§4.1); layer numbers organize
the material and do not require finishing every earlier layer. Each subsection's *Needs:* line
lists the inputs of its statements and routes, so that a target proved by another route is not
blocked behind an unrelated section.

## Conventions

1. **Generality.** The roadmap concerns finite graph theory, with results stated at the generality
   their proofs support: when a proof does not use finiteness, its statement does not assume it.
   Developments that need arguments specific to infinite graphs are outside the roadmap (Scope and
   ownership). Each layer supplies the common basic API its definitions need: constructors,
   extensionality where appropriate, membership and support lemmas, monotonicity, restriction, and
   invariance under isomorphism. A *Suggested proof* names a route and its inputs; it does not make
   the route mandatory.
2. **Undirected graphs.** A multigraph is Mathlib's `G : Graph α β`, with actual vertices
   `V(G) ⊆ α` and actual edges `E(G) ⊆ β`. Finiteness hypotheses concern these subtypes, never the
   ambient types, and finite sums use the subtype instances; a *finite graph* has finite `V(G)` and
   finite `E(G)`. Loops are allowed. Walk endpoints and separators are actual vertices; deleting
   edges counts identities in `E(G)`, parallel edges separately. `G.toSimpleGraph : SimpleGraph V(G)`
   serves properties insensitive to loops and parallel edges, and `Graph.ofSimpleGraph` carries the
   simple-graph corollaries. Simple-graph statements carry decidability instances exactly where the
   Mathlib definitions they mention require them.
3. **Weighted multigraphs and pair capacities.** A weighted multigraph is `G` with nonnegative
   capacities `c : E(G) → K`; an edge of capacity zero stays in the graph. Its cut capacity sums
   over the actual edges crossing the cut, once per edge, so parallel capacities add and loops
   contribute zero. A nonnegative pair capacity `c : Sym2 V → K` has the simple support graph with
   adjacency `v ≠ w ∧ 0 < c s(v, w)`; diagonal values are allowed and ignored by both the support
   graph and the cuts. A weighted multigraph aggregates to pair capacities on `Sym2 V(G)` by summing
   the capacities of all edges joining each pair of distinct vertices, with diagonal value zero.
   This preserves weighted cuts, not edge identities or edge-disjoint paths.
4. **Directed networks.** A network is a term `N : TauCeti.Network K V`, never a typeclass
   instance. It has an arrow type `N.Hom v w` for each ordered pair of vertices, in a universe
   independent of the vertex universe, and on each arrow a lower bound `ℓ` and an upper bound `u` in
   `K` with `ℓ ≤ u`; bounds may be negative and all bounds are finite. Parallel arrows, arrows in
   opposite directions, loops and zero capacities are allowed; the total arrow type is the dependent
   sum over ordered pairs. The carrier needs no finiteness; statements needing finitely many
   vertices or arrows assume `[Fintype V]` or `[∀ v w, Fintype (N.Hom v w)]`. An ordinary network
   is the case `ℓ = 0`, built from nonnegative upper capacities by `TauCeti.Network.ofCapacity`.
   Assignments, excess and cut capacities are defined against an explicit arrow family
   `Q : V → V → Type v` (`TauCeti.Assignment Q K`), with bounds as separate parameters; the network
   exposes them through abbreviations, and an abbreviation that ignores the lower bounds says so in
   its name (`TauCeti.Network.UpperFlow`). A `Quiver` term is never a parameter. **Why:** instance
   search for `Fintype (Q v w)` does not see through `Quiver.mk`. Every network sum is a
   `Finset.sum` in `K`; nothing needs infinite sums or infinite capacities.
5. **Coefficients.** The theory with finite bounds is over a linearly ordered additive commutative
   group, `[AddCommGroup K] [LinearOrder K] [IsOrderedAddMonoid K]`, with no unit, multiplication,
   division, Archimedean property, topology or completeness, so that it applies alike to `ℤ`, `ℚ`
   and `ℝ`. The minimum-cut theory of §4.1, §4.3 and Layer 9 never subtracts and is over a linearly
   ordered cancellative additive commutative monoid,
   `[AddCommMonoid K] [LinearOrder K] [IsOrderedCancelAddMonoid K]`, so that `ℕ` and `ℝ≥0` are
   instances; §4.2, and the submodularity of the signed cut bound `U` in §4.1, use the group. The
   definition of submodularity and its elementary closure lemmas need less (§4.1). Integrality means
   values in an additive subgroup `H` of `K`.
6. **Directed walks and strong connectivity.** Directed walks are Mathlib's `Quiver.Path` with the
   quiver supplied explicitly from the arrow family, `TauCeti.ArrowWalk Q s t`, which is
   `@Quiver.Path V ⟨Q⟩ s t`; a directed path visits no vertex twice (`TauCeti.ArrowWalk.IsPath`) and
   a directed cycle is a closed walk of positive length with no repeated vertex apart from its
   coinciding ends (`TauCeti.ArrowWalk.IsCycle`), so a loop is a cycle. Strong connectivity is
   `@Quiver.IsStronglyConnected V ⟨Q⟩`. **Why:** several quivers then coexist on `V` without
   competing instances or vertex-type synonyms.
7. **Orientations and the bidirected construction.** An orientation of `G : Graph α β` is
   `Graph.Orientation G`: a tail and a head for every actual edge, linked by that edge, so that each
   edge identity gives exactly one arrow and a loop gives one directed loop. Its arrow family is
   `Graph.Orientation.Hom`. Orientations of a simple graph `H` are
   `TauCeti.DoubledQuiver.Orientation H`, a set of darts containing exactly one dart from each
   reversed pair, with quiver `TauCeti.DoubledQuiver.OrientedQuiver H o`. The bidirected arrow
   family `Graph.BidirectedHom G` on `V(G)` has one arrow `x → y` for every edge `e` with
   `G.IsLink e x y`: an arrow in each direction for a nonloop edge and one loop for a loop. The
   bidirected network has zero lower bounds and the edge's capacity on each of its arrows
   (`Graph.bidirectedCapacity`).
8. **Undirected walks, paths and cycles.** A walk is `G.Walk x y` (`Graph.Walk`), an inductive type
   indexed by the ambient vertex type, with `nil` at any point and `cons e h p` for
   `h : G.IsLink e x y`; a walk retains the identity of each edge it traverses and traverses a loop
   in only one way. Every vertex of a walk of positive length is actual, and reachability
   (`Graph.Reachable`) requires actual endpoints, so a walk of length zero at a point outside `V(G)`
   witnesses nothing. **Why:** a walk is then determined by its vertex sequence and edge identities,
   which is all the connectivity and flow theory uses; a direction of traversal around a loop would
   double every loop walk and loop cycle. Paths, undirected and directed, repeat no vertex. An
   undirected cycle is a closed walk of positive length with no repeated vertex apart from its ends
   and no repeated edge identity: a loop is a one-edge cycle, two distinct parallel edges form a
   two-edge cycle, and traversing one edge out and back is not a cycle. Path families are finite
   and consist of distinct paths, except the capacitated packings of §5.1, which may repeat a path.
   Edge-disjointness concerns edge identities in `E(G)` for a multigraph, unordered edges for a
   simple graph, and arrow identities in a network. Internally vertex-disjoint paths between
   distinct terminals share only the terminals; a family cannot count the same one-edge path twice
   merely because it has no internal vertices.
9. **Separators.** A local vertex separator for distinct terminals `s, t` excludes both terminals
   and destroys `s–t` reachability when deleted. The local vertex form of Menger therefore assumes
   that `s` and `t` are nonadjacent, and in the directed case that there is no arrow `s → t`.
   **Why:** adjacent terminals stay reachable after deleting any set of other vertices, whatever
   their number of internally disjoint paths. §5.1 gives the adjacent-terminal version separately,
   counting all direct edges. For vertex-disjoint paths between vertex sets `A` and `B`, the
   separators may meet `A ∪ B`; a path has one end in each set and its interior avoids `A ∪ B`;
   the paths are disjoint including their ends; a vertex of `A ∩ B` contributes a path of length
   zero and belongs to every separator; no pairing of the ends is prescribed. The edge-disjoint
   set-to-set version requires `A` and `B` disjoint and allows paths to share ends.
10. **Connectivity predicates and invariants.** Multigraph reachability is by walks. Vertex
    reachability and vertex connectivity of a multigraph are those of `G.toSimpleGraph`
    (`Graph.IsVertexReachable`, `Graph.IsVertexConnected`, abbreviations of Tau Ceti's
    `SimpleGraph.IsVertexReachable` and `SimpleGraph.IsVertexConnected`); global
    `k`-vertex-connectivity includes the requirement of more than `k` vertices. Local and global
    edge connectivity, `Graph.IsEdgeReachable G k s t` and `Graph.IsEdgeConnected G k`, ask for
    reachability after deleting any set of fewer than `k` edges, for one pair or for every pair of
    actual vertices; edge connectivity counts actual edges with their multiplicities and is not
    defined through simplification. Thresholds are natural numbers, coerced to `ℕ∞` where a Mathlib
    predicate takes `ℕ∞`. The predicates are primary; the numerical invariants
    `Graph.vertexConnectivity`, `Graph.edgeConnectivity` and `Graph.edgeReachability` are the
    suprema in `ℕ∞` of the natural thresholds at which the predicates hold. On a subsingleton actual
    vertex set, edge connectivity is `⊤` and vertex connectivity is zero. Bounds by incidence counts
    or minimum degree assume at least two actual vertices.
11. **Flows, excess and cuts.** Write `δ⁺(S)` for the arrows leaving a vertex set `S` and `δ⁻(S)`
    for those entering it, and `f(F)` for the sum of `f` over an arrow set `F`. Excess is incoming
    minus outgoing (`TauCeti.excessAt`), with capacities, assignments, excess and value in `K`.
    **Why:** demand then has positive excess and supply negative excess, and one additive calculus
    serves flows and signed bounded assignments. A *pseudoflow* is an assignment with
    `0 ≤ f ≤ u` arrowwise. A flow from `s` to `t` (`TauCeti.Flow cap s t`) is a pseudoflow with
    zero excess away from the terminals and nonnegative excess at `t`; its value is its excess at
    `t`, equivalently minus its excess at `s`. A *cut* is a source side `S` with `s ∈ S` and
    `t ∉ S`, of capacity `u(δ⁺(S))`, which is `TauCeti.arrowSum cap S Sᶜ`; arrows entering the
    source or leaving the sink are allowed. A bounded assignment satisfies `ℓ ≤ f ≤ u` arrowwise,
    with no conservation or sign condition. Prescribed excess means `excessAt f = b`
    (`TauCeti.ExcessFlow lo hi b`), a bounded circulation is the case `b = 0`
    (`TauCeti.IsCirculation`), and interval excess means `a v ≤ excessAt f v ≤ b v`
    (`TauCeti.ExcessIntervalFlow lo hi a b`); vertex constraints are parameters, not fields of the
    network. A bounded `s–t` assignment (`TauCeti.BoundedFlow lo hi s t`) has zero excess away from
    the terminals and value `excessAt f t` of either sign; an ordinary flow is its zero-lower-bound,
    nonnegative-value case and shares its assignments, excess and bound calculations.
12. **Residual networks and cut bounds.** For a feasible assignment `f`, the residual arrows from
    `v` to `w` are `TauCeti.ResidualHom Q v w`, which is `Q v w ⊕ Q w v`, with zero lower bounds
    and capacity `u e − f e` on a forward arrow and `f e − ℓ e` on a reverse arrow
    (`TauCeti.residualCapacity lo hi f`). The arrow type does not depend on `f` and keeps arrows of
    capacity zero; augmenting walks lie in the positive part (`TauCeti.PositiveHom`,
    `TauCeti.PositiveReachable`). **Why:** fixed arrow types avoid transporting paths after every
    augmentation, and the tags distinguish forward capacity from cancellation even with antiparallel
    arrows. For ordinary flows the reverse capacity is `f e`. The source-side cut bound is
    `U(S) = u(δ⁺(S)) − ℓ(δ⁻(S))` (`TauCeti.cutBound lo hi S`), and the matching lower bound on the
    terminal value is `L(S) = ℓ(δ⁺(S)) − u(δ⁻(S)) = −U(Sᶜ)`; ordinary cut capacity is the case
    `ℓ = 0` of `U`. Undirected weighted cuts keep the nonnegative conventions of item 3.
13. **Mathlib proposals.** The interfaces follow the Mathlib proposals listed under Interface design
    references, read together with their design discussions; a citation does not make every
    declaration of a proposal a requirement. When such a proposal lands, Tau Ceti adopts Mathlib's
    API and refactors the affected interfaces and proofs, preserving the statements of the targets.
    An unmerged proposal is never a dependency.
14. **Homes and names.** Multigraph connectivity lives under `TauCeti/Combinatorics/Graph/`,
    simple-graph interfaces under `TauCeti/Combinatorics/SimpleGraph/`, directed networks and flows
    under `TauCeti/Combinatorics/Network/`, with adjacent modules for matching, edge-colouring,
    orientations and the representation bridges. Undirected multigraph declarations extend the
    `Graph` namespace, simple-graph declarations extend `SimpleGraph`, and orientation results extend
    the Tau Ceti orientation namespaces. Mathlib and Tau Ceti declarations are named in code font.
    The headline theorems that the pinned libraries do not prove are declared in `Suggested.lean`
    in the namespace `TauCetiRoadmap.GraphConnectivityAndFlows`, and are named here by their
    declarations there; every other target is described in prose.

### Assumptions at a glance

The table summarizes the standing hypotheses; the sections are the normative statements.

| Sections | Vertices | Edges or arrows | Coefficients | Terminals |
| --- | --- | --- | --- | --- |
| Walks, isomorphisms, bridges, bonds, cuts, separators, path families, deletion predicates, blocks and the block–cut forest (§1.1, structural part of §1.2, §1.5, §§2.1–2.4) | none | none | none | none |
| Bridge forest (§2.5), except its component count, and the bridge criterion of §7.2 | none | none | none | none |
| Threshold equivalences (§1.5) | nonempty `V(G)` for the vertex equivalence, none for the edge equivalences | none | none | none |
| Multigraph vertex-only targets other than threshold equivalences: vertex connectivity, nonadjacent local vertex Menger, vertex-capacitated and set-to-set vertex Menger, vertex consequences in Layer 6, component counts of §1.1 and §§2.1–2.5 | finite `V(G)` | none | none | distinct terminals, nonadjacent for local vertex Menger; `A, B` may overlap |
| Multigraph edge targets other than threshold equivalences and the bridge criterion: edge connectivity, edge Menger, weighted cuts, ears, Robbins (§1.2, §1.5, Layers 5 and 7) | finite `V(G)` | finite `E(G)` | cancellative monoid for weights | distinct terminals; disjoint `A, B` for edge versions |
| Directed vertex-only targets: vertex strong connectivity, local, vertex-capacitated and set-to-set vertex Menger (Layers 5 and 6) | `[Fintype V]` | none | none | no arrow `s → t` for local vertex Menger |
| Adjacent-terminal vertex Menger (§5.1) | finitely many actual vertices | only the direct terminal edges or arrows finite | none | distinct `s, t`; only arrows `s → t` counted in the directed case |
| Bipartite matching, edge-colouring, indegree orientations (§§6.7–6.9, §8.8) | finite `V(G)` | finite `E(G)` | natural capacities and indegrees | a bipartition for matching and colouring; loops allowed for orientations |
| Directed flows, arc connectivity, Menger reductions, bipartite network (Layer 3, §5.2, Layers 6 and 7) | `[Fintype V]` | `[∀ v w, Fintype (N.Hom v w)]` | linearly ordered additive group; `ℤ` for the reductions | distinct `s, t`; `A, B` possibly empty, disjoint for edge versions and terminal-set flows, overlapping for vertex versions |
| Submodularity and its closure lemmas (§4.1) | none | none | addition and order for the definition; more per lemma | none |
| Minimum cuts and cut trees (§4.1, §4.3, Layer 9) | `[Fintype V]`, nonempty for cut trees | none | linearly ordered cancellative additive monoid | disjoint `A, B`, possibly empty; distinct `s, t` |
| Residual canonical cuts, minimum-cut poset, bounded circulations, rounding (§4.2, §4.4, §§8.1–8.7) | `[Fintype V]` | finite arrow types | linearly ordered additive group with finite signed bounds; `FloorRing` for §8.7 | distinct `s, t` |

## Layer 1: shared foundations

§1.1 and §1.3 are independent; §1.2 and §1.5 use §1.1, and §1.4 uses §1.3.

### 1.1 Undirected walks, isomorphisms, and representation bridges

The walk theory is Tau Ceti's `Graph.Walk`, with the API of `SimpleGraph.Walk`: `Graph.Walk.length`,
`Graph.Walk.support`, `Graph.Walk.edges`, `Graph.Walk.append`, `Graph.Walk.reverse`,
`Graph.Walk.IsTrail`, `Graph.Walk.IsPath` and `Graph.Walk.IsCycle`; reachability `Graph.Reachable`
with its reflexivity on actual vertices, symmetry and transitivity; splitting at a vertex
(`Graph.Walk.takeUntil`, `Graph.Walk.dropUntil`); path extraction (`Graph.Walk.bypass`,
`Graph.Reachable.exists_isPath`); the traced subgraph `Graph.walkGraph`; transport along `≤`
(`Graph.Walk.mapLe`, `Graph.Walk.transfer`); graph isomorphisms `Graph.Iso` (equivalences of the
actual vertex and edge sets preserving `IsLink`) with `Graph.Iso.refl`, `Graph.Iso.symm`,
`Graph.Iso.trans` and their action on walks `Graph.Iso.mapWalk`; and the union `Graph.Compatible.union`
of compatible graphs, with `V(U) = V(G) ∪ V(H)`, `E(U) = E(G) ∪ E(H)` and `IsLink` the disjunction,
an upper bound of both and the least one, commutative and associative for pairwise compatible
graphs, and a subgraph of `K` when both are (`Graph.IsSubgraph.union_le`); two subgraphs of one
graph are always compatible (Mathlib's `Graph.Compatible.of_le_le`), and their unions are the ones
used when adding ears. These assume no finiteness. The bidirected quiver `Graph.BidirectedHom G` and the equivalence
`Graph.Walk.bidirectedEquiv` between walks between actual vertices and its directed walks preserve
length, vertex and edge sequences and paths; a directed cycle there corresponds to an undirected
cycle exactly when its underlying edges are distinct
(`Graph.Walk.isCycle_iff_isCycle_toBidirected_and_isTrail`), since the two opposite arrows of one
edge form a directed two-cycle that is not an undirected cycle.

Walks of `Graph.ofSimpleGraph H` correspond to `H.Walk` (`SimpleGraph.walkEquivOfSimpleGraph`, with
`SimpleGraph.Walk.toGraph` and `Graph.Walk.toSimpleGraph`), preserving ends, supports, edges, paths
and cycles, and reachability (`SimpleGraph.reachable_ofSimpleGraph_iff`). Native reachability agrees
with reachability in the simplification (`Graph.toSimpleGraph_reachable_iff`), and vertex deletion
commutes with simplification (`Graph.toSimpleGraphDeleteVertsIso`); `toSimpleGraph` of
`Graph.ofSimpleGraph H` is isomorphic to `H` (Mathlib's `Graph.toSimpleGraphOfSimpleGraphIso`).
The components of `G` are the minimal nonempty closed subgraphs, `Graph.IsConnectedComponentOf`,
which are the subgraphs induced by the reachability classes
(`Graph.isConnectedComponentOf_iff_exists_eq_connectedComponentSubgraph`); `Graph.Connected` is
being a component of itself, equivalently a nonempty actual vertex set any two points of which are
reachable (`Graph.connected_iff_forall_reachable`). The component type is equivalent to
`G.toSimpleGraph.ConnectedComponent` (`Graph.connectedComponentEquiv`) with no finiteness. The
component count `Graph.componentCount` is the cardinality of that type, equal to
`Nat.card G.toSimpleGraph.ConnectedComponent` (`Graph.componentCount_eq_natCard_toSimpleGraph`); it
is zero exactly when `V(G)` is empty, when there are finitely many components
(`Graph.componentCount_eq_zero_iff`, so in particular for finite `V(G)`), one exactly when `G` is
connected (`Graph.componentCount_eq_one_iff`), zero for the empty graph (`Graph.componentCount_bot`),
and `Nat.card H.ConnectedComponent` on `Graph.ofSimpleGraph H` (`Graph.componentCount_ofSimpleGraph`).
The arrows of an orientation are exactly the actual edges, each linking its tail and head, so the
underlying undirected graph of an orientation is `G` (`Graph.Orientation.totalHomEquiv`,
`Graph.Orientation.Hom.isLink`). Oriented walks are exactly the undirected walks traversing every
edge in its chosen direction
(`Graph.Walk.FollowsOrientation`, `Graph.Orientation.walkEquiv`), so undirected reachability need
not give directed reachability. Bidirected cut capacity is undirected cut capacity
(`Graph.arrowSum_bidirectedCapacity`). A digraph `D : Digraph V` is the arrow family
`Digraph.AdjHom D`, `PLift (D.Adj v w)`, with its walk, reachability, strong connectivity,
vertex-deletion and arrow-deletion correspondences (`Digraph.arrowWalkEquiv`,
`Digraph.nonempty_arrowWalk_iff_reflTransGen`, `Digraph.isStronglyConnected_iff`,
`Digraph.reflTransGen_induce_compl_iff`, `Digraph.reflTransGen_sdiff_iff`), and weak connectivity
is reachability in `D.toSimpleGraphInclusive` (`Digraph.weaklyConnectedComponent_mk_eq_mk_iff`); it
keeps loops and has at most one arrow per ordered pair.

The targets of this section (Diestel, *Graph Theory*, §1.9 and Chapter 3):

- **Isomorphisms on subgraphs.** A graph isomorphism transports subgraphs, induced subgraphs and
  closed subgraphs, compatibly with identity, inverse and composition.
- **Simple graphs.** The correspondence of walks of `Graph.ofSimpleGraph H` with `H.Walk` preserves
  both disjointness predicates: two walks are internally disjoint, or edge-disjoint, exactly when
  their images are. Subgraphs of `Graph.ofSimpleGraph H` correspond to `H.Subgraph`, compatibly with
  deletion, and so do orientations: there is an equivalence between `Graph.Orientation` of
  `Graph.ofSimpleGraph H` and `TauCeti.DoubledQuiver.Orientation H` preserving directed walks and
  strong connectivity through `TauCeti.DoubledQuiver.OrientedQuiver`. The structural part of the
  transport of ear data is built here; its instance for ear decompositions is §7.1.
- **Simplification.** Multigraph paths project to paths of `G.toSimpleGraph`, and paths of
  `G.toSimpleGraph` lift to multigraph paths by choosing actual edges, both preserving the vertex
  sequence. For nonadjacent terminals these operations preserve internally disjoint families and
  their cardinalities, and they preserve vertex-disjoint set-to-set families. Projection need not
  preserve distinctness for adjacent terminals, since different direct edges project to the same
  one-edge path; §5.1 handles them by its multiplicity formula. No preservation of edge-disjointness
  is asserted.
- **Induced subgraphs and simple graphs.** The simplification of the induced subgraph `G.induce X`
  is isomorphic to the subgraph of `G.toSimpleGraph` induced on the actual vertices in `X`. A graph
  satisfying `Graph.Simple` is isomorphic (`Graph.Iso`) to `Graph.ofSimpleGraph G.toSimpleGraph`.
  `Graph.ofSimpleGraph H` is connected exactly when `H` is, including for the empty graph.
- **Isolated vertices.** An isolated actual vertex `x` of any `G`, with or without loops, gives the
  component `G.induce {x}`.
- **Bidirected simple graphs.** For a simple graph `H` on `V`, along the identification of
  `V(Graph.ofSimpleGraph H)` with `V`, the bidirected arrows of `Graph.ofSimpleGraph H` correspond
  bijectively to the arrows of `TauCeti.DoubledQuiver H`, one for each dart; for pair capacities
  `c : Sym2 V → K`, both arrows over an edge carry the capacity of that edge.

*Needs:* Mathlib `Graph`, `Graph.ofSimpleGraph`, `Graph.toSimpleGraph`, `Graph.Simple`,
`SimpleGraph.Subgraph`; Tau Ceti `Graph.Walk`, `Graph.Iso`, `Graph.BidirectedHom`,
`SimpleGraph.walkEquivOfSimpleGraph`, `Graph.toSimpleGraphDeleteVertsIso`, `Graph.Orientation`,
`Graph.Orientation.walkEquiv`, `TauCeti.DoubledQuiver`, `TauCeti.DoubledQuiver.Orientation`
(ZigzagPreprojective §0.2).

**Checks.**
- On the graph with one vertex and one loop `e`, there is exactly one walk of length one, `cons e`,
  and it is a cycle. A walk built from darts, with a loop traversed in two directions, has two such
  walks.
- On two vertices `u, w` joined by distinct parallel edges `e, f`, the closed walk `u, e, w, f, u`
  is a cycle of length two, while `u, e, w, e, u` is not, since it repeats the edge identity `e`.
  Its image in the simplification traverses one edge twice, so the multigraph cycle has no
  simple-graph counterpart.
- On actual vertices `{1, 2, 3}` with one edge `1–2` and a loop at `3`, the component count is two:
  an isolated vertex with a loop is a component. The empty graph has component count zero.

### 1.2 Cuts, separators, and path families

A cut is a set of actual vertices; its boundary is Mathlib's `G.edgeCut S`, the actual edges with
one end on each side, and `G.IsEdgeCut F` is the predicate on edge sets. The boundary of the
complement is the same (`Graph.edgeCut_vertexSet_diff`); on a subgraph it is the intersection with
the subgraph's edges (`Graph.IsSubgraph.edgeCut_eq_inter`); deleting edges `F` removes them from it
(`Graph.edgeCut_deleteEdges`); loops never lie in it (`Graph.IsLoopAt.notMem_edgeCut`). Weighted cut
capacity is `Graph.edgeCutCapacity`, the cardinality of the boundary for unit capacities
(`Graph.edgeCutCapacity_one`), with complements `Graph.edgeCutCapacity_compl`; the aggregation of
item 3 of the conventions is `Graph.pairCapacity`, and it preserves weighted cuts
(`Graph.pairCutCapacity_pairCapacity`, with the pair cut function `TauCeti.pairCutCapacity`). Pair
cut capacities and support graphs do not change when diagonal capacities change
(`TauCeti.pairCutCapacity_eq_of_offDiagonal_eq`, `TauCeti.capacitySupport_eq_of_offDiagonal_eq`).
Edge separators relate to the cuts of reachable sets: the boundary of the set reachable from `x`
after deleting `F` lies in `F` (`Graph.edgeCut_setOf_reachable_deleteEdges_subset`), and deleting a
boundary disconnects (`Graph.not_reachable_deleteEdges_edgeCut`). Directed paths have their
extraction and reachability-after-deletion API (`TauCeti.ArrowWalk.exists_isPath_arrows_subset`,
`TauCeti.ReachableWithout`, `TauCeti.reachableWithout_iff_exists_isPath`,
`TauCeti.ReachableAvoiding`). The cut, separator, boundary and path-family statements assume no
finiteness; the cardinality, capacity and aggregation formulas assume a finite graph.

The targets of this section (Diestel, *Graph Theory*, §1.9):

- **Vertex deletion.** After deleting a vertex set `X`, the boundary of `S` consists of the boundary
  edges of `S` in `G` with no end in `X`.
- **Separators.** Vertex separators (sets of actual vertices whose deletion destroys reachability
  between two terminals or two terminal sets) and edge separators, with the conventions above: a
  superset of a separator separates, a separator of `G` separates every subgraph of `G` on which the
  terminals remain, and separators restrict to induced subgraphs and behave under edge and vertex
  deletion as the boundary does.
- **Aggregation and minimum cuts.** Since aggregation preserves the cut function, it preserves the
  minimum cut value between any two actual vertices and the sets attaining it, for every weight
  function, not only for unit capacities.
- **Path families.** For finite families of paths: subfamilies, reversal of undirected paths,
  concatenation of compatible paths, extraction of simple paths from walks, and transport of
  disjointness along these operations, with the directed analogues used for residual reachability
  and path decomposition.

*Needs:* §1.1; Mathlib `Graph.edgeCut`, `Graph.IsEdgeCut`; Tau Ceti `Graph.edgeCutCapacity`,
`Graph.pairCapacity`, `TauCeti.pairCutCapacity`, `TauCeti.TerminalCut.pairMinimumValue`.

**Checks.**
- Two vertices `u, w` joined by three parallel edges of capacities `1, 2, 0`, with a loop of
  capacity `5` at `u`: the boundary of `{u}` has three edges, its capacity is `3`, and the
  aggregated pair capacity of `{u, w}` is `3`, with diagonal value zero. Counting the loop would
  give `8`; merging parallel edges into one simple edge would lose the multiplicities.

### 1.3 Excess calculus, subnetworks, bounds, and residual updates

The excess calculus on arbitrary signed assignments is Tau Ceti's: additivity and negation
(`TauCeti.excessAt_add`, `TauCeti.excessAt_neg`), total excess zero (`TauCeti.sum_excessAt`), and the
sum of excesses over a set as its incoming minus its outgoing flow
(`TauCeti.sum_excessAt_eq_arrowSum_sub`), over an additive commutative group. Excess is the additive
homomorphism `TauCeti.excessHom Q K : Assignment Q K →+ (V → K)` (`TauCeti.excessHom_apply`),
compatible with additive coefficient maps (`TauCeti.map_excessAt`) and with transport along vertex
and arrow equivalences (`TauCeti.excessAt_comp_equiv`). Signed circulations are its kernel
(`TauCeti.isCirculation_iff_mem_ker`), and each nonempty fibre of prescribed excess is a translate
of the kernel (`TauCeti.setOf_excessAt_eq_eq_vadd_ker`), with no capacity constraint. An assignment
conserved away from two terminals has opposite excesses at them
(`TauCeti.excessAt_source_eq_neg_sink`), and a pseudoflow conserved away from `s, t` with
nonpositive excess at `t` is a flow from `t` to `s` with the same assignment and value minus its
excess at `t` (`TauCeti.BoundedFlow.swapFlow`, `TauCeti.BoundedFlow.val_swap`).

A subnetwork `TauCeti.Network.Subnetwork` records an actual vertex set and a set of original arrows
with ends in it, with inherited bounds and vertex type the actual vertex set
(`TauCeti.Network.Subnetwork.toNetwork`); induced subnetworks, vertex and arrow deletion, singleton
subnetworks without arrows (`TauCeti.Network.singletonSubnetwork`) and unions inside a fixed network,
keeping isolated vertices, are Tau Ceti's. A network isomorphism `TauCeti.Network.Iso` is a vertex
equivalence with arrow equivalences over corresponding ends preserving both bounds, with identity,
inverse and composition and the transport of assignments, excess, feasibility, walks and flows
(`TauCeti.Network.Iso.assignmentEquiv`, `TauCeti.Network.Iso.excessAt_assignmentEquiv`,
`TauCeti.Network.Iso.mapPath`, `TauCeti.Network.Iso.mapBoundedFlow`, `TauCeti.Network.Iso.mapFlow`).
Bounds are replaced on the same arrows by `TauCeti.Network.replaceBounds` and
`TauCeti.Network.replaceUpper`, the latter for ordinary networks, capping at a bound being the case
§3.2 uses; feasible assignments transport when lower bounds decrease and
upper bounds increase (`TauCeti.BoundedFlow.mono`, `TauCeti.Flow.mono`). Reversing a set of arrows
and negating their values replaces their bounds by `−u, −ℓ` and preserves feasibility and excess,
loops and parallel arrows included (`TauCeti.Network.reorient`,
`TauCeti.reorientAssignment_mem_Icc_iff`, `TauCeti.excessAt_reorientAssignment`).

The residual update of a feasible assignment `f` by a residual assignment `r` is
`f'(e) = f(e) + r(e⁺) − r(e⁻)` (`TauCeti.residualUpdate`). It is feasible when `r` is
(`TauCeti.residualUpdate_mem_Icc`), it satisfies `excess f' = excess f + excess r` with no
conservation hypothesis on `r` (`TauCeti.excessAt_residualUpdate`), a residual circulation preserves
excess (`TauCeti.IsCirculation.excessAt_residualUpdate`), a residual terminal flow raises the value
by its own value when it runs in the same direction and lowers it by its value when it runs in the
opposite direction (`TauCeti.BoundedFlow.val_update`, with `TauCeti.BoundedFlow.val_swap`), and the update by zero, the arrowwise formula
and values in an additive subgroup are `TauCeti.residualUpdate_zero`,
`TauCeti.residualUpdate_apply` and `TauCeti.residualUpdate_mem`. Path and cycle augmentation
specialize it, for general signed bounds (`TauCeti.residualUpdate_walkAssignment_mem_Icc`).

The targets of this section (Schrijver, *Combinatorial Optimization*, Vol. A; Bertsekas, *Linear
Network Optimization*, §1.1.3):

- **Network abbreviations.** The network exposes cut capacity, the cut bound `U` and the types of
  exact-excess and interval-excess assignments through abbreviations, as it does assignments and
  excess.
- **The residual network.** For a feasible assignment `f` of a network with finite bounds, the
  residual network is a network on the same vertices with arrows `TauCeti.ResidualHom`, zero lower
  bounds and capacities `TauCeti.residualCapacity`; its upper bounds are nonnegative by feasibility.
- **Subnetworks.** Walks restrict to a subnetwork when all their arrows lie in it, and transport
  from a subnetwork to the network; adding an ear to a subnetwork satisfies the membership and
  prefix-inclusion lemmas §7.2 uses; strong connectivity of a subnetwork is evaluated on its own
  actual vertices, so a singleton subnetwork is strongly connected whatever the rest of the
  network; and subnetworks transport along network isomorphisms.
- **Isomorphisms and paths.** `TauCeti.Network.Iso.mapPath` maps vertex lists by the vertex
  equivalence and preserves directed paths and cycles.
- **Extensionality.** Two networks with the same arrow family and the same lower and upper bounds
  are equal.

*Needs:* Tau Ceti `TauCeti.Network`, `TauCeti.excessAt`, `TauCeti.excessHom`,
`TauCeti.Network.Subnetwork`, `TauCeti.Network.Iso`, `TauCeti.residualUpdate`,
`TauCeti.residualCapacity`.

**Checks.**
- On two vertices with one arrow `s → t` carrying `1`, the excess is `1` at `t` and `−1` at `s`; a
  loop carrying any value contributes zero to the excess of its vertex. The opposite sign convention,
  outgoing minus incoming, makes the value of a flow negative.

### 1.4 Vertex splitting, auxiliary terminals, and change of coefficients

These constructions are generic in their capacities; §5.2 instantiates them with the capacities that
make cuts correspond to separators.

*Vertex splitting* is Tau Ceti's `TauCeti.SplitHom Q` on `V × Bool`, writing `v⁻` for the entrance
and `v⁺` for the exit: each original arrow `v → w` is kept, with its identity, as an arrow
`v⁺ → w⁻`, and each vertex, isolated or carrying loops, gets one split arrow `v⁻ → v⁺`; the network
`TauCeti.SplitHom.network` has zero lower bounds and separate nonnegative capacities on original and
split arrows. Original paths lift and split paths project (`TauCeti.ArrowWalk.splitLift`,
`TauCeti.ArrowWalk.splitProj`, `TauCeti.ArrowWalk.splitEquiv`, `TauCeti.ArrowWalk.isPath_splitLift`),
including the removal of the end split arrows for the terminals `s⁺, t⁻`. Conservation at both
copies of a nonterminal vertex is equivalent to `incoming = splitFlow` and `splitFlow = outgoing`
for any split assignment (`TauCeti.SplitHom.excessAt_entrance_eq_zero_and_excessAt_exit_eq_zero_iff`),
these imply conservation of the projected assignment
(`TauCeti.SplitHom.excessAt_originalAssignment_eq_zero`), and the terminal excess formulas and the
bound of the traffic through a vertex by its split capacity are `TauCeti.SplitHom.excessAt_entrance`,
`TauCeti.SplitHom.excessAt_exit` and `TauCeti.SplitHom.arrowSum_originalAssignment_univ_singleton_le`.

*Auxiliary terminals* are Tau Ceti's `TauCeti.AuxTerminalHom Q A B` on `V ⊕ Bool`: a fresh source `σ`
and sink `τ`, all original arrows with their identities, one arrow `σ → a` for each `a ∈ A` and one
arrow `b → τ` for each `b ∈ B`, for arbitrary, possibly empty, terminal sets, with capacities
`TauCeti.auxTerminalCapacity`. The capacity of a `σ–τ` cut is the capacity of the new arrows it
crosses plus the original cut capacity of its restriction to `V`
(`TauCeti.arrowSum_auxTerminalCapacity`). The *normalization lemma*: for disjoint `A, B` and
nonnegative original capacities, when every arrow `σ → a` has capacity at least the total capacity
leaving `a` and every arrow `b → τ` at least the total capacity entering `b`, the set
`R = ((S ∩ V) ∪ A) ∖ B` obtained from a `σ–τ` cut `S` satisfies `A ⊆ R ⊆ Bᶜ` and its original cut
capacity is at most the `σ–τ` cut capacity of `S`
(`TauCeti.arrowSum_union_sdiff_le_arrowSum_auxTerminalCapacity`,
`TauCeti.TerminalCut.isAdmissible_union_sdiff`). **Why:** restricting a minimum auxiliary cut to `V`
need not keep all of `A`. Every walk from a vertex of `A` to a vertex of `B` contains a path from
`A` to `B` whose interior avoids `A ∪ B` (`TauCeti.ArrowWalk.exists_isPath_interior_notMem`), and
original walks lift to and project from `σ–τ` walks
(`TauCeti.AuxTerminalHom.exists_arrowWalk_vertices_eq`,
`TauCeti.AuxTerminalHom.exists_arrowWalk_map_vertices_subset`).

*Change of coefficients* along order-preserving additive maps is Tau Ceti's for networks,
assignments, flows, residual capacities and cuts (`TauCeti.Network.map`, `TauCeti.Assignment.map`,
`TauCeti.BoundedFlow.map`, `TauCeti.Flow.map`, `TauCeti.Assignment.map_residualCapacity`,
`TauCeti.map_cutBound`, `TauCeti.map_arrowSum`).

The targets of this section (Schrijver, *Combinatorial Optimization*, Vol. A):

- **Paths through auxiliary terminals.** A simple `σ–τ` path consists of one arrow `σ → a`, an
  original path from `a ∈ A` to a vertex of `B`, and one arrow into `τ`; the original path may pass
  through further vertices of `A ∪ B`. Trimming it to the segment from its last vertex in `A` to the
  first vertex of `B` at or after it gives an `A–B` path in the sense of the conventions, of length
  zero when that vertex lies in `A ∩ B`. Lifting, projection and trimming are operations on paths,
  three separate ones since trimming does not invert lifting, and trimming preserves the
  vertex-disjointness and arrow-disjointness of families.
- **Splitting with auxiliary terminals.** For the vertex-disjoint versions, the combination of the
  two constructions with new arrows `σ → a⁻` and `b⁺ → τ`, with its path and cut correspondences.
- **The standard embeddings.** The order-preserving additive embeddings `ℤ → ℚ → ℝ`, with change of
  coefficients specialized to them.

*Needs:* §1.3; Tau Ceti `TauCeti.SplitHom`, `TauCeti.AuxTerminalHom`, `TauCeti.ArrowWalk`,
`TauCeti.Network.map`.

### 1.5 Deletion predicates and numerical invariants

The simple-graph predicates are Mathlib's `SimpleGraph.IsEdgeReachable` and
`SimpleGraph.IsEdgeConnected`, with `SimpleGraph.IsEdgeReachable.mono`,
`SimpleGraph.isEdgeReachable_one`, `SimpleGraph.IsEdgeReachable.trans` and
`SimpleGraph.IsEdgeReachable.anti`, and Tau Ceti's `SimpleGraph.IsEdgeConnected.mono` and
`SimpleGraph.edgeConnectivity`. For multigraphs, Tau Ceti has threshold monotonicity
(`Graph.IsEdgeReachable.anti`, `Graph.IsEdgeConnected.anti`, `Graph.IsVertexReachable.anti`,
`Graph.IsVertexConnected.anti`), graph monotonicity, global forms on a fixed actual vertex set
(`Graph.IsEdgeConnected.mono`, `Graph.IsVertexConnected.mono`, `Graph.vertexConnectivity_mono`), the
zero and one cases (`Graph.isEdgeReachable_one`, `Graph.isEdgeConnected_one`,
`Graph.isVertexConnected_zero`, `Graph.isVertexConnected_one`), and the relation between local and
global forms. Local edge reachability at each threshold is an equivalence relation on the actual
vertices (`Graph.isEdgeReachable_equivalence`), with no finiteness; it is not reflexive at a point
outside `V(G)` for a positive threshold (`Graph.isEdgeReachable_self_iff`). The native edge
predicates agree with Mathlib's on `Graph.ofSimpleGraph` (`Graph.isEdgeReachable_ofSimpleGraph_iff`,
`Graph.isEdgeConnected_ofSimpleGraph_iff`). The local invariant `Graph.edgeReachability` has its
threshold equivalence (`Graph.isEdgeReachable_iff_le_edgeReachability`), symmetry
(`Graph.edgeReachability_comm`), the value `⊤` at an actual vertex (`Graph.edgeReachability_self`;
at a point outside `V(G)` it is zero), and its comparison with global edge connectivity
(`Graph.edgeConnectivity_le_edgeReachability`, `Graph.edgeConnectivity_eq_iInf_edgeReachability`).
For distinct terminals, local edge reachability is at most the number of nonloop edges at either
terminal when that terminal has finitely many nonloop edges, in particular in a finite graph
(`Graph.edgeReachability_le_nonloopIncidenceCount` with `Graph.edgeReachability_comm`); §5.1
identifies it with a unit-capacity minimum cut. The numerical vertex invariant is that of the
simplification by definition (`Graph.vertexConnectivity`), with `Graph.vertexConnectivity_ofSimpleGraph`
and `Graph.edgeConnectivity_ofSimpleGraph` on simple graphs. The threshold equivalences hold without
finiteness: `G.IsVertexConnected k ↔ k ≤ G.vertexConnectivity` for nonempty `V(G)`
(`Graph.isVertexConnected_iff_le_vertexConnectivity`) and `G.IsEdgeConnected k ↔ k ≤ G.edgeConnectivity`
for every graph, the empty one included (`Graph.isEdgeConnected_iff_le_edgeConnectivity`). Edge
connectivity is `⊤` exactly when the actual vertex set is subsingleton, for finitely many edges
(`Graph.edgeConnectivity_eq_top_iff`, with `Graph.edgeConnectivity_eq_top_of_subsingleton`), while
vertex connectivity is finite for finite `V(G)` (`Graph.vertexConnectivity_ne_top`) and zero on a
subsingleton (`Graph.vertexConnectivity_of_subsingleton`).

Incidence counts use Mathlib's `G.incidenceSet v` and `G.loopSet v`: the nonloop count
`Graph.nonloopIncidenceCount` is `(G.incidenceSet v ∖ G.loopSet v).ncard`, parallel edges counted
separately; `Graph.incidenceCount` counts all incident edges, a loop once; the edges inside a vertex
set and those meeting it, each counted once, are `Graph.internalEdges` and `Graph.incidentEdges`.
Edge deletion (`Graph.incidenceCount_deleteEdges`, `Graph.nonloopIncidenceCount_deleteEdges`) and
simple-graph degree on `Graph.ofSimpleGraph` (`Graph.incidenceCount_ofSimpleGraph`) are Tau Ceti's,
and on loopless graphs the two counts agree (`Graph.nonloopIncidenceCount_eq_incidenceCount`); §6.9
uses the incidence count as degree, and §8.8 counts a loop once toward indegree.

The targets of this section (Diestel, *Graph Theory*, Chapter 3):

- **Numerical monotonicity.** `Graph.edgeConnectivity` does not decrease when edges are added on
  the same actual vertex set.
- **The local edge invariant of a simple graph.** On `Graph.ofSimpleGraph H`, the local invariant
  `Graph.edgeReachability` at two vertices is the supremum in `ℕ∞` of the natural thresholds at
  which Mathlib's `SimpleGraph.IsEdgeReachable` holds for `H`.
- **Incidence formulas.** Deletion formulas for the internal and incident edges of a vertex set,
  and disjoint-union formulas for both vertex counts and both edge-set counts.

*Needs:* §1.1; Mathlib `SimpleGraph.IsEdgeReachable`, `Graph.incidenceSet`, `Graph.loopSet`; Tau Ceti
`Graph.IsEdgeReachable`, `Graph.edgeReachability`, `Graph.edgeConnectivity`,
`Graph.vertexConnectivity`, `Graph.incidenceCount`.

**Checks.**
- Two vertices joined by `k ≥ 1` parallel edges have edge connectivity `k` and vertex connectivity
  one, while their simplification, a single edge, has edge connectivity one. A definition of edge
  connectivity through the simplification would give one.
- The graph with one vertex has edge connectivity `⊤` and vertex connectivity zero; `K₄` has vertex
  connectivity three and not four, since four-vertex-connectivity needs more than four vertices.

### Examples

These are required proved examples of Layer 1.

- The empty graph, an isolated vertex and the two-vertex single-edge graph, exercising the size
  conventions of the invariants. Tau Ceti computes their component counts and the edge connectivity
  of parallel edges; the remaining size conventions are targets.
- A finite multigraph on infinite ambient types, verifying that the finiteness hypotheses concern
  only its actual vertices and edges; Tau Ceti does this for vertex connectivity, and the edge and
  component statements are targets.
- Weighted aggregation with parallel edges, loops and edges of capacity zero, and pair capacities
  with nonzero diagonal values, verifying the cut invariance.
- Bounded assignments with negative bounds, and integer assignments carried to real bounds by change
  of coefficients (Tau Ceti's `TauCeti/Combinatorics/Network/Examples.lean`).
- A singleton subnetwork inside a network with several vertices: its vertex type is a singleton and
  its strong connectivity does not quantify over the omitted vertices.

### Dependencies

Layer 1 uses Mathlib's `Graph`, `SimpleGraph`, `Digraph`, `Quiver.Path` and
`Quiver.IsStronglyConnected`, Tau Ceti's walks, networks, excess, residual updates, splitting and
auxiliary terminals named above, and ZigzagPreprojective §0.2 for the orientations of simple graphs.
It uses no later layer.

## Layer 2: bridges, bonds, cut vertices, and blocks

### 2.1 Bridges

Mathlib's `Graph.IsBridge e` is `G.IsEdgeCut {e}`. It holds exactly when `e` is an actual edge
whose deletion disconnects its ends (`Graph.isBridge_iff_exists_not_reachable_deleteEdges`), exactly
when `e` lies on no cycle (`Graph.isBridge_iff_forall_cycle_notMem`), and, when there are finitely
many components, exactly when deleting `e` raises the component count by one
(`Graph.isBridge_iff_componentCount_deleteEdges_eq_add_one`). Loops are never bridges
(`Graph.IsLoopAt.not_isBridge`), nor is an edge with a distinct parallel edge
(`Graph.IsLink.not_isBridge_of_isLink_of_ne`). A multigraph forest is `Graph.IsForest`, the absence
of cycles, equivalent to every actual edge being a bridge with no finiteness
(`Graph.isForest_iff_forall_isBridge`); it agrees with Mathlib's `SimpleGraph.IsAcyclic` on
`Graph.ofSimpleGraph` (`Graph.isForest_ofSimpleGraph_iff`, through Mathlib's
`SimpleGraph.isAcyclic_iff_forall_isBridge`). On `Graph.ofSimpleGraph H`, the bridges are the edges
of `H` that are bridges in Mathlib's sense (`Graph.isBridge_ofSimpleGraph_iff`, compared with
`SimpleGraph.isBridge_iff_forall_cycle_notMem`); membership matters because Mathlib's
`SimpleGraph.IsBridge` also holds for a non-edge joining two components. Mathlib's `Graph.IsBond` is
an inclusion-minimal nonempty edge cut, independently of cardinality or capacity, with
`Graph.isBond_singleton_iff_isBridge`. For a connected multigraph and a set `S` of actual vertices,
`G.edgeCut S` is a bond exactly when the graphs induced on `S` and on `V(G) ∖ S` are connected
(`Graph.Connected.isBond_edgeCut_iff`); bonds restrict to components
(`Graph.IsClosedSubgraph.isBond_iff`, Mathlib's `Graph.IsBond.of_isClosedSubgraph`).

The targets of this section (Diestel, *Graph Theory*, §1.9):

- **Splitting a component.** An actual edge is a bridge exactly when deleting it splits the
  component containing its ends into exactly two components, one containing each end.
- **Isomorphisms.** Edge cuts, bonds and bridges transport along `Graph.Iso`.

*Needs:* §1.1, §1.2; Mathlib `Graph.IsBridge`, `Graph.IsBond`; Tau Ceti
`Graph.IsLink.reachable_iff_reachable_deleteEdges_or`, `Graph.Iso`.

**Checks.**
- A single edge `u–w` is a bridge and `{e}` is a bond. Two vertices joined by two parallel edges have
  no bridge, and the boundary of `{u}` is a bond with two edges, although the simplification is a
  single bridge.

### 2.2 Cut vertices

A cut vertex `v` separates two other vertices: some `u, w ≠ v` are reachable in `G` but not after
deleting `v`. This is Tau Ceti's `Graph.IsCutVertex`, and `SimpleGraph.IsCutVertex` is its form on
`Graph.ofSimpleGraph`. When the graph after deleting `v` has finitely many components, `v` is a cut
vertex exactly when deleting it increases the number of components
(`Graph.isCutVertex_iff_componentCount_lt_componentCount_deleteVerts`). **Why:** the reachability
definition needs neither finiteness nor `Fintype` instances on deletion subtypes.

The target of this section (Diestel, *Graph Theory*, Chapter 3): `v` is a cut vertex of `G` exactly
when it is a cut vertex of `G.toSimpleGraph`.

*Needs:* §1.1; Tau Ceti `Graph.IsCutVertex`, `SimpleGraph.IsCutVertex`.

### 2.3 Blocks

A block is a maximal nonempty set of vertices inducing a connected graph without a cut vertex of its
own, Tau Ceti's `SimpleGraph.IsBlock`; an isolated vertex gives a singleton block, and these are the
only singleton blocks (`SimpleGraph.isBlock_singleton_iff_isIsolated`). Distinct blocks meet in at
most one vertex (`SimpleGraph.IsBlock.inter_subsingleton`), so a block containing both ends of an
edge is unique (`SimpleGraph.IsBlock.eq_of_adj_mem`); on a finite vertex type every edge lies in
exactly one block (`SimpleGraph.Adj.existsUnique_isBlock_superset_pair`) and a vertex is a cut vertex
exactly when it lies in two distinct blocks (`SimpleGraph.isCutVertex_iff_exists_isBlock_ne`, with
`SimpleGraph.IsBlock.isCutVertex_of_ne` holding without finiteness).

The targets of this section (Diestel, *Graph Theory*, Chapter 3):

- **Bridges.** The ends of a bridge that is an edge form a two-vertex block.
- **Without finiteness.** Every edge lies in exactly one block, and a vertex is a cut vertex exactly
  when it lies in more than one block, for simple graphs on any vertex type. *Suggested proof:*
  being connected without a cut vertex is preserved by unions of chains, so Zorn's lemma gives a
  block containing any edge.
- **Multigraphs.** The vertex blocks of a multigraph are the blocks of its simplification, and the
  cut-vertex criteria transport. Every nonloop edge lies in exactly one vertex block, but a
  two-vertex block may contain parallel edges and then is not a bridge; a singleton block may carry
  loops; and a loop at a cut vertex lies in every vertex block containing that vertex, so vertex
  blocks do not partition loop edges.

*Needs:* §1.1, §2.2; Tau Ceti `SimpleGraph.IsBlock`, `SimpleGraph.IsCutVertex`.

### 2.4 The block–cut forest

Define `blockCutGraph`: for a simple graph `G`, the simple graph whose vertices are the blocks and
the cut vertices of `G`, a block being adjacent to a cut vertex exactly when it contains it. Prove
`isAcyclic_blockCutGraph`, that it is a forest, with no finiteness, and `isTree_blockCutGraph`, that
it is a tree when `G` is connected (Diestel, *Graph Theory*, Chapter 3). Prove also:

- its components correspond to the components of `G`;
- the path correspondence: for vertices `x, y` in the same component and a cut vertex `c` distinct
  from both, `c` separates `x` from `y` exactly when `c` lies on the path of the forest between a block containing
  `x` and a block containing `y`;
- for a finite vertex type and a cut vertex `v`, the degree of `v` in the block–cut forest is the
  number of components into which deleting `v` splits the component of `v`; equivalently, the number
  of components after deleting `v`, plus one, is the number of components of `G` plus that degree.
  The multigraph form, with `Graph.componentCount (G.deleteVerts {v})`, follows through §1.1.

*Suggested proof:* a cycle of the block–cut graph passes through at least two blocks, and the union
of its blocks is connected without a cut vertex, contradicting the maximality of a block.

*Needs:* §1.1, §2.3; Tau Ceti `SimpleGraph.IsBlock`, `SimpleGraph.IsBlock.isCutVertex_of_ne`,
`TauCeti.IsTree.neighborSetEquivConnectedComponentCompl`; Mathlib `SimpleGraph.IsAcyclic`,
`SimpleGraph.IsTree`.

**Checks.**
- For two triangles meeting at one vertex `v`, the blocks are the two triangles and `v` is the only
  cut vertex, so the block–cut graph is a path with three vertices. Deleting `v` leaves two
  components and the degree of `v` is two, as the formula `2 + 1 = 1 + 2` requires.
- For the path `a–b–c`, the blocks are `{a, b}` and `{b, c}` and the block–cut graph is the path
  `{a, b}`, `b`, `{b, c}`. Defining blocks as the maximal 2-vertex-connected induced subgraphs would
  give no block at all here, losing both edges.

### 2.5 The bridge forest

The bridge forest is Tau Ceti's. Its vertices are the components left after deleting all bridges,
`Graph.BridgeComponent`, with the vertex-to-component map `Graph.bridgeComponentOf` and the set of
bridges `Graph.bridgeSet`; `Graph.bridgeForest` has exactly the original bridge identities as edges
(`Graph.edgeSet_bridgeForest`), each joining the components of its ends (`Graph.bridgeForest_isLink`),
which are distinct (`Graph.IsBridge.bridgeComponentOf_ne`). It is a forest
(`Graph.isForest_bridgeForest`), so no two bridges join the same pair of components
(`Graph.IsForest.eq_of_isLink`); its components correspond to those of `G`
(`Graph.connectedComponentEquivBridgeForest`, `Graph.componentCount_bridgeForest`), and it is
connected, hence a tree, exactly when `G` is (`Graph.connected_bridgeForest_iff`). Paths project by
omitting edges inside a component and forest paths lift between any prescribed original ends in their
end components (`Graph.Walk.toBridgeForest`, `Graph.Walk.liftBridgeForest`,
`Graph.Walk.exists_liftBridgeForest_isPath`). Deleting a set of bridges separates two original
vertices exactly when deleting the corresponding forest edges separates their images
(`Graph.reachable_deleteEdges_iff_reachable_bridgeForest_deleteEdges`). Each component left after
deleting all bridges is connected and bridgeless (`Graph.BridgeComponent.not_isBridge`,
`Graph.not_isBridge_deleteEdges_bridgeSet`). These assume no finiteness. For finite `V(G)` the set
of bridges is finite (`Graph.finite_bridgeSet`) and the number of components left after deleting all
bridges is the number of bridges plus `G.componentCount`
(`Graph.componentCount_deleteEdges_bridgeSet`), with no finiteness of `E(G)`. The construction is
direct, without a general theory of contraction.

The target of this section (Diestel, *Graph Theory*, §1.9): the empty graph has the empty bridge
forest, and the statements above cover isolated vertices, loops, parallel edges and disconnected
graphs, as the examples below verify.

*Needs:* §1.1, §2.1; Tau Ceti `Graph.bridgeForest`, `Graph.componentCount`.

**Checks.**
- Two triangles joined by one bridge, together with an isolated vertex: one bridge, three components
  after deleting it, and `3 = 1 + 2`, the number of bridges plus the two components of the graph. For
  two triangles meeting at a vertex there is no bridge, and the bridge forest has a single vertex.

### Examples

These are required proved examples of Layer 2; Tau Ceti proves the two-vertex cases with parallel
edges, and the others are targets.

- Paths and cycles, with their bridges, blocks and connectivity predicates.
- Two triangles meeting at one vertex, with their block–cut tree, and a loop at the common vertex
  demonstrating the convention for vertex blocks.
- A bond with several edges and a bridge forming a singleton bond, with the connected-side
  characterization checked in each case.
- Two triangles joined by a bridge together with an isolated vertex, with the bridge forest and its
  component count, compared with two triangles meeting at a vertex, whose bridge forest has one
  vertex.

### Dependencies

Layer 2 uses Layer 1 (walks, components and their count, edge cuts), Mathlib's bridges, bonds and
acyclic simple graphs, and Tau Ceti's bridges, cut vertices, blocks and bridge forest named above.

## Layer 3: flows and max-flow/min-cut

### 3.1 Finite flows and assignment decomposition

Every target of this section concerns ordinary flows, with zero lower bounds and nonnegative value;
the coefficients are those of the conventions. Weak duality, the value of every flow being at most
the capacity of every cut, is Tau Ceti's `TauCeti.Flow.val_le_arrowSum`, with the signed form
`TauCeti.BoundedFlow.val_le_cutBound`.

1. **Residual augmentation.** Augmenting along a residual walk with no repeated arrow, simple
   augmenting paths in particular, by its least residual capacity preserves feasibility and raises
   the value by that positive amount (`TauCeti.Flow.augmentBottleneck`,
   `TauCeti.Flow.val_augmentBottleneck`, `TauCeti.Flow.val_lt_val_augmentBottleneck`); it is the
   residual update of §1.3, which also gives cycle augmentation for bounded circulations.
2. **Decomposition of nonnegative assignments.** Every nonnegative assignment on a finite quiver,
   with no conservation or capacity hypothesis, is a finite sum of positively weighted simple paths
   and cycles, with equality on every arrow (`TauCeti.exists_pathCycleDecomposition`,
   `TauCeti.PathCycleDecomposition`). Each path runs from a vertex of negative excess to one of
   positive excess, a walk of weight `q` contributes `n • q` to an arrow it traverses `n` times, the
   total weight of the paths leaving a supply vertex is minus its excess and the total weight
   entering a demand vertex is its excess, the families may be empty and loops are cycles, every
   component is bounded arrowwise by the assignment, the number of components is at most the number
   of arrows of positive value, and the weights lie in an additive subgroup containing the values.
   The ordinary `s–t` decomposition and the cycle decomposition of nonnegative circulations
   (`TauCeti.PathCycleDecomposition.paths_eq_nil`) are corollaries.
3. **Acyclic flows.** Every flow has an acyclic flow of the same value, arrowwise no larger, using no
   loop and at most one of two opposite arrows, with every arrow value at most the flow value and
   values in any additive subgroup containing the original ones (`TauCeti.Flow.exists_isAcyclic`,
   `TauCeti.Flow.exists_isAcyclic_mem`, `TauCeti.Flow.toFun_le_val_of_isAcyclic`). A decomposition
   without cycles need not have acyclic support: unit flows along `s → a → b → t` and
   `s → b → a → t` together contain the cycle `a → b → a`.
4. **Max-flow/min-cut.** For distinct terminals and nonnegative capacities, some flow and some cut
   have equal value and capacity (`TauCeti.Flow.exists_val_eq_arrowSum`); a flow is maximum exactly
   when it has no augmenting path, exactly when some cut attains its value
   (`TauCeti.Flow.tfae_isMaximum`). Shortest-path augmentation is a reusable terminating relation:
   a step augments along a positive residual path of least length by its full bottleneck
   (`TauCeti.BoundedFlow.ShortestAugmentationStep`, for signed bounds and hence for ordinary flows);
   it is well founded from any feasible start over every coefficient group of the conventions
   (`TauCeti.BoundedFlow.wellFounded_shortestAugmentationStep`), a flow has no successor exactly when
   it is maximum (`TauCeti.BoundedFlow.isMaximum_iff_forall_not_shortestAugmentationStep`), a
   shortest augmenting path exists whenever an augmenting path does
   (`TauCeti.BoundedFlow.exists_shortestAugmentationStep_iff`), and each step keeps feasibility and
   strictly raises the value (`TauCeti.BoundedFlow.ShortestAugmentationStep.val_lt`). Path search
   and complexity bounds are not targets.
5. **Integrality.** For distinct terminals and nonnegative capacities in an additive subgroup `H`,
   some maximum flow has its values in `H` (`TauCeti.Flow.exists_isMaximum_mem`) and its value is the
   minimum cut capacity (`TauCeti.Flow.IsMaximum.exists_val_eq_arrowSum`). Natural capacities with
   integer values are `TauCeti.NatFlow`, with `TauCeti.NatFlow.exists_val_eq_coe_arrowSum`.
6. **Termination for cyclic capacity subgroups.** For capacities in `AddSubgroup.zmultiples d` with
   `0 < d`, every flow with values in the subgroup has value `n • d` for some `n : ℕ`
   (`TauCeti.Flow.exists_nsmul_eq_val`), each augmentation keeps the values in the subgroup and raises
   the value by at least `d` (`TauCeti.Flow.AugmentsTo.mem`, `TauCeti.Flow.AugmentsTo.val_add_le`), so
   the relation "has larger value" is well founded on such flows (`TauCeti.Flow.wellFounded_val_lt`)
   and every sequence of augmentations terminates whatever the choice of augmenting paths
   (`TauCeti.Flow.acc_augmentsTo`), with no Archimedean hypothesis. The integer and rational
   specializations are `TauCeti.Flow.acc_augmentsTo_int` and `TauCeti.Flow.acc_augmentsTo_rat`, the
   latter through `Rat.exists_forall_mem_zmultiples_inv_natCast`, which puts finitely many rationals
   in the subgroup generated by the reciprocal of a common denominator. No such assertion is made for
   capacities outside a cyclic subgroup, where augmentation can fail to terminate; there item 4
   relies on the shortest-path rule.

The targets of this section (Schrijver, *Combinatorial Optimization*, Vol. A):

- **Terminal exchange and decomposition.** A pseudoflow conserved away from `s, t` with negative
  excess at `t` decomposes into paths from `t` to `s` and cycles, through
  `TauCeti.BoundedFlow.swapFlow` and item 2. The general signed circulation is treated in §8.4.
- **Natural capacities over `ℚ` and `ℝ`.** For natural capacities cast into `ℚ` or `ℝ`, some maximum
  flow has natural values. Casting along the embeddings of §1.4 sends integer flows to rational and
  real flows of the same value, and some maximum rational or real flow is the cast of an integer
  flow.
- **The bound of item 6.** For distinct terminals and nonnegative capacities in
  `AddSubgroup.zmultiples d`, the total capacity leaving the source is `m • d` for some `m : ℕ`, and
  a flow with values in the subgroup has value `n • d` with `n ≤ m`.

*Needs:* §1.3, §1.4; Tau Ceti `TauCeti.Flow`, `TauCeti.BoundedFlow`, `TauCeti.residualUpdate`,
`TauCeti.exists_pathCycleDecomposition`.

**Checks.**
- On four vertices `s, a, b, t` over the lexicographically ordered group `ℤ × ℤ`, give `s → a`,
  `s → b`, `a → t` and `b → t` capacity `(1, 0)` and `a → b` capacity `(0, 1)`. Augmenting from zero
  alternately along `s → a → b → t` and along `s → b → a → t`, the second through the reverse
  residual arrow of `a → b`, every bottleneck is `(0, 1)`: the outer residual capacities stay of the
  form `(1, −j)`, larger than `(0, 1)`. After `2m` steps the outer arrows carry `(0, m)`, `a → b`
  carries zero and the value is `(0, 2m)`, so the sequence never terminates. Shortest augmentation
  from zero uses the two paths of length two and reaches the maximum `(2, 0)` in two steps, certified
  by the cut `{s}`. A termination argument resting on the discreteness of the values would fail
  here; the shortest-path rule does not.

### 3.2 Large capacities

For nonnegative capacities, capping at `B : K`, replacing each capacity `cap e` by
`min (cap e) B`, changes neither the minimum cut value nor the set of minimum cuts when some cut has
capacity below `B`; Tau Ceti proves this for terminal sets, the `s–t` case being `A = {s}`,
`B = {t}` (`TauCeti.isMinimum_arrowSum_inf_iff`, `TauCeti.minimumValue_arrowSum_inf`). Every flow of
the capped network is a flow of the original one with the same assignment (`TauCeti.Flow.mono`), and
every flow of the original network of value at most `B` yields, after removing the cycle components
of a decomposition, a flow of the capped network with the same value and an arrowwise smaller
assignment (`TauCeti.PathCycleDecomposition.cappedFlow`, `TauCeti.Flow.exists_flow_inf`). Arrows
that must never be cut receive finite capacities above a known cut; §5.2 and §6.7 use this.

The target of this section (Schrijver, *Combinatorial Optimization*, Vol. A): nonnegativity is
needed. With arrows `s → a`, `a → t` and `s → t` of capacities `2`, `1` and `−1`, the minimum cut is
`{s, a}` alone, of capacity `0`, below `B = 1`; capping at `1` makes `{s}` a minimum cut as well.

*Needs:* §3.1; Tau Ceti `TauCeti.isMinimum_arrowSum_inf_iff`, `TauCeti.PathCycleDecomposition`.

### 3.3 Terminal sets and undirected networks

**Terminal sets.** For vertex sets `A, B`, an `A–B` flow (`TauCeti.SetFlow cap A B`) is a pseudoflow
conserved outside `A ∪ B` with nonpositive excess on `A` and nonnegative excess on `B`; its value is
the total excess on `B`, equivalently minus the total excess on `A`
(`TauCeti.SetFlow.sum_excessAt_source`). An `A–B` cut is a set `S` with `A ⊆ S ⊆ Bᶜ`
(`TauCeti.TerminalCut.IsAdmissible`) of capacity `u(δ⁺(S))`. Weak duality, the existence of a flow
and a cut of equal value and capacity for disjoint `A, B`, the optimality criteria and integrality
are `TauCeti.SetFlow.val_le_arrowSum`, `TauCeti.SetFlow.exists_val_eq_arrowSum`,
`TauCeti.SetFlow.tfae_isMaximum` and `TauCeti.SetFlow.exists_isMaximum_mem`, for all `A, B`
including empty ones, where the maximum value is zero (`TauCeti.SetFlow.val_empty_left`,
`TauCeti.SetFlow.val_empty_right`). With the auxiliary terminals of §1.4 and capacities
`TauCeti.setFlowCapacity` (the total capacity leaving `a` on `σ → a`, entering `b` on `b → τ`):
`A–B` flows correspond to `σ–τ` flows with the same original assignment and value
(`TauCeti.SetFlow.auxFlowEquiv`); every `A–B` cut `R` gives the `σ–τ` cut `R ∪ {σ}` of the same
capacity (`TauCeti.TerminalCut.IsAdmissible.arrowSum_auxTerminalCapacity`); and normalizing a
minimum `σ–τ` cut gives a minimum `A–B` cut of the same capacity
(`TauCeti.TerminalCut.IsMinimum.isMinimum_union_sdiff`).

**Undirected networks.** A flow of a weighted multigraph is a flow of its bidirected network,
`TauCeti.Flow (G.bidirectedCapacity c) s t`. Every such flow has an acyclic flow of the same value,
using no loop arrow and at most one of the two opposite arrows of each nonloop edge (§3.1, item 3).
The undirected max-flow/min-cut theorem, for distinct actual vertices `s, t`, gives such a flow and a
set `S` containing `s` but not `t` whose value and multigraph cut capacity agree, with integrality in
an additive subgroup (`Graph.exists_flow_val_eq_edgeCutCapacity`,
`Graph.exists_flow_val_eq_edgeCutCapacity_mem`), and every flow value is at most every cut capacity
(`TauCeti.Flow.val_le_edgeCutCapacity`).

The target of this section (Schrijver, *Combinatorial Optimization*, Vol. A): the `SimpleGraph`
statement for capacities indexed by `Sym2 V`, through `Graph.ofSimpleGraph` and the aggregation of
§1.2, in the shape of the Mathlib proposal on weak max-flow/min-cut duality: for distinct `s, t`
some flow of the bidirected network and some `S` with `s ∈ S`, `t ∉ S` have value equal to the pair
cut capacity of `S`.

*Needs:* §1.2, §1.4, §3.1; Tau Ceti `TauCeti.SetFlow`, `Graph.bidirectedCapacity`,
`Graph.exists_flow_val_eq_edgeCutCapacity`, `TauCeti.pairCutCapacity`.

### 3.4 Nonnegative coefficient interfaces

Nonnegative capacities use Mathlib's `Nonneg K`, the subtype `{k : K // 0 ≤ k}`. Flows for such
capacities are ordinary flows over `K` for the coerced capacities (`TauCeti.NonnegFlow`), with their
values bundled in `Nonneg K` (`TauCeti.Flow.nonnegAssignment`), the coercion lemmas recovering the
assignment, its bounds and the cut capacity through `Nonneg.coeAddMonoidHom`
(`TauCeti.Flow.nonnegAssignment_le`, `TauCeti.coe_arrowSum_nonneg`), excess and value staying in `K`,
and max-flow/min-cut with integrality with no further assumption
(`TauCeti.NonnegFlow.exists_val_eq_coe_arrowSum_mem`). The `ℚ≥0` and `ℝ≥0` interfaces are
`TauCeti.NNRatFlow` and `TauCeti.NNRealFlow`, and natural capacities give natural values with their
round trip, bound and cut-sum formulas (`TauCeti.NatFlow`, `TauCeti.Flow.natAssignment`,
`TauCeti.coe_arrowSum_nat`), excess staying integer. **Why:** nonnegative capacities use their
natural subtype while excess keeps the group operations that conservation and residual updates need.

The target of this section: `Nonneg ℤ` is identified with `ℕ` through the integer coercion and
`Int.toNat`, compatibly with the natural values of flows.

*Needs:* §3.1; Mathlib `Nonneg`; Tau Ceti `TauCeti.NonnegFlow`, `TauCeti.NatFlow`.

### 3.5 Mixed vertex and arrow capacities

For a finite quiver, distinct terminals, nonnegative arrow capacities `u(e)` and nonnegative
capacities `c(v)` on nonterminal vertices, a flow respects the vertex capacities when the traffic
entering each nonterminal `v` is at most `c(v)` (`TauCeti.Flow.RespectsVertexCapacity`); conservation
makes entering and leaving traffic equal there, and a loop counts once in each. A mixed separator
`(X, F)` is a set of nonterminal vertices and a set of original arrows whose joint deletion destroys
`s–t` reachability (`TauCeti.IsMixedSeparator`), of weight `∑ v ∈ X, c(v) + ∑ e ∈ F, u(e)`. Weak
duality, the existence of a flow and a separator of equal value and weight, and integrality in an
additive subgroup are `TauCeti.Flow.RespectsVertexCapacity.val_le` and
`TauCeti.Flow.exists_respectsVertexCapacity_val_eq_mem`. The route is the splitting of §1.4 with
capacity `u(e)` on original arrows, `c(v)` on nonterminal split arrows, terminals `s⁺, t⁻` and the
terminal split capacity `∑ e, u(e)` (`TauCeti.mixedSplitCapacity`), with the value-preserving flow
correspondence `TauCeti.Flow.mixedSplitEquiv`, split cuts giving mixed separators of equal weight for
any terminal split capacities (`TauCeti.SplitHom.isMixedSeparator_cutVertices_cutArrows`,
`TauCeti.SplitHom.arrowSum_assignment_compl_eq_weight`), and mixed separators giving cuts of no
greater capacity (`TauCeti.IsMixedSeparator.exists_arrowSum_le`).

The target of this section (Schrijver, *Combinatorial Optimization*, Vol. A): ordinary
max-flow/min-cut is recovered by taking every vertex capacity to be `∑ e, u(e)`, which every flow
respects (`TauCeti.Flow.respectsVertexCapacity_arrowSum`).

*Needs:* §1.4, §3.1; Tau Ceti `TauCeti.Flow.RespectsVertexCapacity`, `TauCeti.IsMixedSeparator`.

### Examples

These are required proved examples of Layer 3; where Tau Ceti proves one, it is said.

- Networks with parallel and antiparallel arrows, a loop and zero capacities over `ℤ`, `ℚ` and `ℝ`,
  exercising residual tags and finite sums; Tau Ceti's examples cover parallel, antiparallel and loop
  arrows with positive capacities, and zero capacities with residual tags are a target.
- A capacity-feasible assignment with negative excess at the designated sink, verifying terminal
  exchange, and a prescribed-excess example verifying the signs of supply and demand (the latter in
  Tau Ceti's `TauCeti/Combinatorics/Network/Hoffman.lean`).
- A nonnegative assignment with two supply vertices, two demand vertices and a cycle, verifying the
  arrowwise reconstruction and the supply and demand weight identities.
- Zero and nonnegative zero-excess assignments, exercising empty decomposition families and loop
  cycles.
- The two-path flow of §3.1 item 3, whose decomposition has no cycle while its support contains one,
  with its acyclic flow (Tau Ceti's `TauCeti/Combinatorics/Network/Examples.lean`).
- The lexicographic network of the Check in §3.1, with the induction on the augmentation sequence
  and the two-step shortest augmentation.
- An arrow of capacity above a separating cut with a flow whose cycle component carries more than
  the bound, showing that capping preserves the value after removing cycles but not the assignment
  (Tau Ceti's `TauCeti/Combinatorics/Network/Capping.lean`).
- Terminal sets with several vertices on each side and one of them empty, verifying the value
  formula and the auxiliary-terminal correspondence; Tau Ceti proves the case with both sides
  nonempty.
- A weighted multigraph with parallel edges and a loop, with a bidirected flow using both directions
  of one edge and its acyclic normalization.
- A network with natural capacities returning natural values, and networks with fractional rational
  and real capacities verifying the coercion and cut formulas (Tau Ceti's
  `TauCeti/Combinatorics/Network/Nonnegative.lean`).
- A rational-capacity network whose minimum mixed separator uses both a vertex and an arrow, and an
  example with zero capacities.

### Dependencies

Layer 3 uses Layer 1 (excess calculus, residual updates, splitting, auxiliary terminals and cut
capacities) and Tau Ceti's flows named above. It uses no later layer: the admissible sets of a
terminal-set cut are Tau Ceti's `TauCeti.TerminalCut.IsAdmissible`.

## Layer 4: the structure of minimum cuts

### 4.1 Submodularity and terminal-set cut lattices

A function `f : L → K` on a lattice is submodular when `f (a ⊔ b) + f (a ⊓ b) ≤ f a + f b` for all
`a, b`, Tau Ceti's `TauCeti.IsSubmodular`, which needs only `[Add K] [LE K]`; for `f : Finset V → K`
this reads `f (S ∪ T) + f (S ∩ T) ≤ f S + f T`, and `f` is symmetric submodular when moreover
`f Sᶜ = f S` (`TauCeti.IsSymmSubmodular`, defined on any Boolean algebra). Constant functions are
submodular for a preorder (`TauCeti.isSubmodular_const`), sums of submodular functions are
submodular in an ordered additive commutative monoid (`TauCeti.IsSubmodular.add`), and precomposition
with a lattice homomorphism preserves submodularity (`TauCeti.IsSubmodular.comp_latticeHom`). The
minimizers of a submodular function among the elements satisfying a predicate closed under `⊔` and
`⊓` are closed under `⊔` and `⊓`, over a cancellative monoid
(`TauCeti.IsSubmodular.isSublattice_minimizers`).

A minimum `A–B` cut for disjoint terminal sets is a minimizer of `f` over `A ⊆ S ⊆ Bᶜ`
(`TauCeti.TerminalCut.IsAdmissible`, `TauCeti.TerminalCut.IsMinimum`); either terminal set may be
empty, disjointness gives an admissible set, and finiteness gives an attained minimum
(`TauCeti.TerminalCut.exists_minimum`). Singleton terminal sets recover minimum `s–t` cuts
(`TauCeti.TerminalCut.isMinimum_singleton_iff`), and under symmetry exchanging the terminal sets
exchanges the sides (`TauCeti.TerminalCut.isMinimum_compl_iff`,
`TauCeti.IsSymmSubmodular.smallest_symm_eq_compl_largest`). Nonnegative directed outgoing cut
capacity is submodular (`TauCeti.isSubmodular_outgoingArrowSum`); nonnegative undirected cut capacity
is symmetric submodular (`Graph.isSymmSubmodular_edgeCutCapacity`,
`TauCeti.isSymmSubmodular_pairCutCapacity`); and for finite signed bounds `ℓ ≤ u` the upper cut bound
`U` is submodular (`TauCeti.isSubmodular_cutBound`), through the identity
`U(S) = (u − ℓ)(δ⁺(S)) − ∑ v ∈ S, excess(ℓ)(v)` (`TauCeti.cutBound_eq_arrowSum_sub_sum_excessAt`), whose
first term is submodular and whose vertex sum is modular, with no circulation feasibility. The
minimum `A–B` cuts are closed under union and intersection (`TauCeti.TerminalCut.IsMinimum.union`,
`TauCeti.TerminalCut.IsMinimum.inter`) and form a finite distributive lattice
`TauCeti.TerminalCut.minimizers` with a smallest and a largest member
(`TauCeti.TerminalCut.smallest`, `TauCeti.TerminalCut.largest`), characterized by containment in, or
of, every minimizing side (`TauCeti.TerminalCut.smallest_eq_iff`,
`TauCeti.TerminalCut.largest_eq_iff`). Attainment, the minimum-value characterization of a
minimizing side (`TauCeti.TerminalCut.isMinimum_iff_value_eq`), invariance under vertex equivalences
(`TauCeti.TerminalCut.isMinimum_map_iff`) and the membership corollaries are Tau Ceti's: the minimum
cut is unique exactly when the smallest and largest members coincide
(`TauCeti.TerminalCut.existsUnique_minimum_iff`), a vertex of the smallest member lies on the source
side of every minimum cut (`TauCeti.TerminalCut.mem_smallest_iff`), and a vertex outside the largest
member lies on the source side of none (`TauCeti.TerminalCut.mem_largest_iff`). Submodularity is
defined independently of symmetry, and none of these lattice results assumes symmetry (Schrijver,
*Combinatorial Optimization*, Vol. A).

The target of this section: constant functions are submodular for any reflexive relation `≤`, with
no transitivity, under the definition's assumption `[Add K] [LE K]`. Its required example is Tau
Ceti's (Examples below).

*Needs:* Tau Ceti `TauCeti.IsSubmodular`, `TauCeti.TerminalCut.IsMinimum`,
`TauCeti.TerminalCut.minimizers`; §1.3 for the cut bound `U`.

**Checks.**
- On `Fin 6` with `f S = 1` when `4 ∈ S` and `0` otherwise, for sources `{0, 1}` and sinks `{2, 3}`,
  the minimum cuts are exactly `{0, 1}` and `{0, 1, 5}`: the smallest is `{0, 1}` and the largest
  `{0, 1, 5}`. The largest admissible set, `{0, 1, 4, 5}`, has value one, so the largest minimum cut
  is not the complement of the sinks.

### 4.2 Residual characterizations and canonical cuts

For a feasible bounded `s–t` assignment `f` with finite signed bounds and a source side `S`, the gap
identity `U(S) − val(f) = (u − f)(δ⁺(S)) + (f − ℓ)(δ⁻(S))` holds, the right side being the capacity
leaving `S` in the residual network (`TauCeti.BoundedFlow.cutBound_sub_val`,
`TauCeti.arrowSum_residualCapacity`). For a maximum bounded terminal assignment and `s ≠ t`, the
minimum cuts are exactly the source sides that no positive residual arrow leaves
(`TauCeti.BoundedFlow.IsMaximum.isMinimum_cutBound_iff`); the smallest source side is the set of
vertices reachable from `s` along positive residual arrows, and the largest is the complement of the
set from which `t` is so reachable
(`TauCeti.BoundedFlow.IsMaximum.isLeast_filter_positiveReachable`,
`TauCeti.BoundedFlow.IsMaximum.isGreatest_compl_filter_positiveReachable`); both sets are independent
of the chosen maximum assignment (`TauCeti.BoundedFlow.IsMaximum.positiveReachable_source_iff`,
`TauCeti.BoundedFlow.IsMaximum.positiveReachable_sink_iff`). In residual form, a vertex lies on the
source side of every minimum cut exactly when it is reachable from `s` along positive residual
arrows, on the source side of none exactly when `t` is reachable from it, and the minimum cut is
unique exactly when every vertex satisfies one of the two
(`TauCeti.BoundedFlow.IsMaximum.forall_isMinimum_mem_iff`,
`TauCeti.BoundedFlow.IsMaximum.forall_isMinimum_notMem_iff`,
`TauCeti.BoundedFlow.IsMaximum.existsUnique_isMinimum_iff`), with the ordinary-flow statements
(`TauCeti.Flow.IsMaximum.isMinimum_iff`, `TauCeti.Flow.IsMaximum.existsUnique_isMinimum_iff`). These
apply the lattice of §4.1 to `U`, including for networks whose feasible terminal values are all
negative; they assume a maximum assignment is given, which exists for every feasible network with
finite bounds (`TauCeti.BoundedFlow.exists_isMaximum`). The symmetric results of §4.3 keep their
symmetry hypothesis, which signed directed cut bounds need not satisfy (Picard–Queyranne).

The target of this section: the independence of the two residual sets from the chosen maximum
assignment, restated for ordinary flows.

*Needs:* §1.3, §4.1; Tau Ceti `TauCeti.BoundedFlow.IsMaximum`, `TauCeti.cutBound`,
`TauCeti.PositiveReachable`.

### 4.3 Non-crossing lemmas and minimum-cut values

The *non-crossing lemma* for a symmetric submodular `f` on a finite type: if `S` is a minimum `s–t`
cut and distinct `u, v` both lie in `S`, some minimum cut between `u` and `v` has a side contained in
`S` (`TauCeti.TerminalCut.IsMinimum.exists_isMinimum_subset`), with the uncrossing identities and
inequalities that choose it without changing its value
(`TauCeti.TerminalCut.IsMinimum.uncross_union_inter`, `TauCeti.TerminalCut.IsMinimum.uncross_sdiff`,
`TauCeti.IsSymmSubmodular.sdiff_add_sdiff_le`). There is no directed version: the lemma fails without
symmetry, for directed cut capacity in particular.

Two sets are nested or disjoint (`Finset.NestedOrDisjoint`), and two cuts, as bipartitions, cross
when all four intersections of a side of one with a side of the other are nonempty
(`Finset.Crosses`, `Finset.crosses_iff`). *Uncrossing preserves laminarity:* if `Z` crosses `X`,
then `Z ∩ X` and `Z ∪ X` are each nested with or disjoint from every set nested with or disjoint from
both `Z` and `X` (`Finset.NestedOrDisjoint.inter`, `Finset.NestedOrDisjoint.union`, which need less).
*Root convention:* fixing a root and representing every cut by its side not containing the root, a
pairwise non-crossing family of cuts becomes laminar, because two root-excluding sides cannot cover
the vertex set (`Finset.not_crosses_iff_nestedOrDisjoint`, `Finset.sideAvoiding`,
`Finset.pairwise_nestedOrDisjoint_image_sideAvoiding`). **Why:** without the root convention,
non-crossing sides can cover the vertex set without being nested or disjoint. The *multi-cut
non-crossing lemma*: for a pairwise non-crossing family of cuts, each a minimum cut of `f` for some
pair of vertices, and distinct `s, t` separated by none of them, some minimum `s–t` cut crosses none
of them (`TauCeti.TerminalCut.exists_isMinimum_forall_not_crosses`). **Why:** successive uncrossings
can create new crossings; laminarity makes the number of crossed members decrease. The *ultrametric
inequality* `λ(s, t) ≥ min (λ(s, v), λ(v, t))` holds for every `f`, distinct `s, t` and every `v`,
since every `s–t` cut separates `s` from `v` or `v` from `t`
(`TauCeti.TerminalCut.min_pairMinimumValue_le`), where `λ` is `TauCeti.TerminalCut.pairMinimumValue`
with `λ(s, s) = 0` (`TauCeti.TerminalCut.pairMinimumValue_self`). These are the interface of the
cut-tree layer; none of them needs flow theory (Korte–Vygen, *Combinatorial Optimization*, §8.6).

This section has no further target.

*Needs:* §4.1; Tau Ceti `TauCeti.TerminalCut.exists_isMinimum_forall_not_crosses`,
`TauCeti.TerminalCut.min_pairMinimumValue_le`, `Finset.Crosses`.

**Checks.**
- The non-crossing lemma needs symmetry. On vertices `0, 1, 2, 3` with directed capacities
  `0 → 1 : 1`, `0 → 3 : 3`, `2 → 0 : 2`, `2 → 3 : 2`, `3 → 0 : 2`, `3 → 1 : 2`, the set `{0, 3}` is a
  minimum `0–1` cut of value `3`; the only minimum `0–3` cut is `{0, 1}`, of value `3`, and the only
  minimum `3–0` cut is `{1, 3}`, of value `2`, and no side of either lies inside `{0, 3}`.

### 4.4 The poset of all minimum cuts

For a maximum bounded `s–t` assignment `f` with distinct terminals, the positive residual quiver of
§4.2 has its strongly connected components (Mathlib's `Quiver.StronglyConnectedComponent`;
`TauCeti.BoundedFlow.ResidualComponent`), ordered by residual reachability, `C ≤ D` when a vertex of
`C` reaches a vertex of `D` (`Quiver.StronglyConnectedComponent.instPartialOrder`, with
`TauCeti.BoundedFlow.residualComponent_le_residualComponent`): independent of representatives,
antisymmetric, with a finite quotient. The components reachable from the source component lie on
every minimum-cut source side and those that reach the sink component on none
(`TauCeti.BoundedFlow.IsMaximum.mem_of_residualComponent_le`,
`TauCeti.BoundedFlow.IsMaximum.notMem_of_residualComponent_le`); these two sets are disjoint, and the
remaining *free* components carry the induced order (`TauCeti.BoundedFlow.FreeComponent`). The
minimum-cut source sides under inclusion are order-isomorphic to the upper sets of the poset of free
components ordered by inclusion, `(UpperSet P)ᵒᵈ`, since Mathlib orders `UpperSet P` by reverse
inclusion (`TauCeti.BoundedFlow.IsMaximum.minimizersOrderIso`): the forward map takes the free
components inside a source side, the inverse takes their vertices with all vertices forced onto the
source side, with the vertex-membership formula and the correspondence of union and intersection
(`TauCeti.BoundedFlow.IsMaximum.mem_minimizersOrderIso_iff`,
`TauCeti.BoundedFlow.IsMaximum.mem_minimizersOrderIso_symm_iff`,
`TauCeti.BoundedFlow.IsMaximum.coe_minimizersOrderIso_sup`,
`TauCeti.BoundedFlow.IsMaximum.coe_minimizersOrderIso_inf`). The smallest and largest cuts are the
images of the empty and full upper sets, and the minimum cut is unique exactly when there is no free
component (`TauCeti.BoundedFlow.IsMaximum.existsUnique_isMinimum_iff_isEmpty`); the ordinary-flow
form is `TauCeti.Flow.IsMaximum.minimizersOrderIso`. The signed statement needs no nonnegative
terminal value, and no algorithm for components or for enumerating cuts is a target
(Picard–Queyranne, *On the structure of all minimum cuts in a network and applications*).

This section has no further target; its required example is Tau Ceti's.

*Needs:* §4.1, §4.2; Mathlib `Quiver.StronglyConnectedComponent`, `UpperSet`; Tau Ceti
`TauCeti.BoundedFlow.IsMaximum.minimizersOrderIso`.

**Checks.**
- On `s, a, b, t` with unit capacities on `s → a`, `a → t`, `s → b`, `b → t` and `a → b`, the maximum
  flow sends one unit along each two-arrow path and nothing along `a → b`. The positive residual
  arrows are `a → s`, `t → a`, `b → s`, `t → b` and `a → b`, so the free components are `{a}` and
  `{b}` with `a < b`. The upper sets `∅`, `{b}` and `{a, b}` give the minimum cuts `{s}`, `{s, b}`
  and `{s, a, b}`, each of capacity `2`; `{s, a}` has capacity `3`. Choosing `a` forces `b`, which an
  order by reverse reachability would get backwards.

### Examples

The required examples of Layer 4 are Tau Ceti's: disjoint terminal sets with several terminals and
several minimizing sides, with their smallest and largest cuts and the cases of empty terminal sets
(`TauCeti/Combinatorics/Network/MinimumCut/Basic.lean`); a signed-bound network exercising
submodularity, the gap identity and the smallest and largest minimum cuts
(`TauCeti/Combinatorics/Network/MinimumCut/Residual.lean`); and the four-vertex network of the Check
in §4.4 (`TauCeti/Combinatorics/Network/MinimumCut/Poset.lean`).

### Dependencies

Layer 4 uses Layer 1 for the excess identity of `U` and the residual capacities, Mathlib's lattices,
upper sets and strongly connected components, and Tau Ceti's minimum-cut theory named above. §4.1
and §4.3 use no flow theory.

## Layer 5: Menger's theorem

### 5.1 Path–separator duality

All versions assume finitely many actual vertices; edge-disjoint versions also assume finitely many
edges or arrows, and vertex versions do not, except that the adjacent-terminal versions need finitely
many direct terminal edges or arrows. Each version has attainment, some admissible family or packing
whose size equals the cardinality or weight of a separator, and weak duality, every family or packing
being at most every separator; witnesses keep actual edge and arrow identities. **Why:** numerical
connectivity invariants alone give neither attaining witnesses nor their certificates (Diestel,
*Graph Theory*, Chapter 3; Schrijver, *Combinatorial Optimization*, Vol. A).

- **Local edge Menger**, for distinct terminals, with pairwise edge-disjoint paths and sets of edge or
  arrow identities whose deletion destroys reachability: `TauCeti.exists_paths_arrowSeparator_card_eq`
  with weak duality `TauCeti.card_le_card_of_not_reachableWithout` for networks,
  `Graph.exists_paths_edgeSeparator_card_eq` with `Graph.card_le_encard_of_not_reachable_deleteEdges`
  for multigraphs, and `SimpleGraph.exists_paths_edgeSeparator_card_eq` for simple graphs.
- **Local vertex Menger**, for distinct nonadjacent terminals (no arrow `s → t` in the directed case),
  with internally disjoint paths and terminal-excluding separators:
  `TauCeti.exists_paths_vertexSeparator_card_eq`, `Graph.exists_paths_vertexSeparator_card_eq`,
  `SimpleGraph.exists_paths_vertexSeparator_card_eq` and `Digraph.exists_paths_vertexSeparator_card_eq`,
  with weak duality `TauCeti.card_le_card_of_not_reachableAvoiding`,
  `Graph.card_le_encard_of_not_reachable_deleteVerts` and
  `SimpleGraph.card_le_card_of_not_reachable_induce`.
- **Vertex-capacitated Menger**, for capacities `c : V → ℕ`: a packing is a finite indexed family of
  `s–t` paths, repetitions allowed, in which each nonterminal `v` lies on at most `c v` members, and a
  separator `X` has weight `∑ v ∈ X, c v`: `TauCeti.exists_paths_vertexSeparator_sum_eq`,
  `Graph.exists_paths_vertexSeparator_sum_eq`, `SimpleGraph.exists_paths_vertexSeparator_sum_eq` and
  `Digraph.exists_paths_vertexSeparator_sum_eq`, with weak duality
  `TauCeti.card_le_sum_of_not_reachableAvoiding`. The case `c = 1` is local vertex Menger: two members
  sharing an internal vertex would exceed its capacity, and nonadjacency excludes members without
  internal vertices.
- **Adjacent terminals.** Let `D` be the set of edges joining distinct terminals `s, t`, in the
  directed case exactly the arrows `s → t` (arrows `t → s` are kept and not counted), and `m = |D|`.
  After deleting `D`, a terminal-excluding vertex separator of size `k` and a family of `k + m`
  internally disjoint paths in the original graph, including all `m` one-edge paths, attain equality;
  weak duality bounds every such family by `|X| + m`: `TauCeti.exists_paths_isMixedSeparator_card_eq`
  with `TauCeti.card_le_card_add_card_of_isMixedSeparator`,
  `Graph.exists_paths_vertexSeparator_card_add_card_eq` with
  `Graph.card_le_card_add_card_of_not_reachable_deleteEdges_deleteVerts`, and the simple-graph
  corollary with `m = 1`, `SimpleGraph.exists_paths_vertexSeparator_card_add_one_eq`, which covers the
  single-edge graph with `k = 0`.
- **Set-to-set Menger**, with vertex-disjoint `A–B` paths and vertex sets meeting every such path,
  under the overlap convention: `TauCeti.exists_paths_setSeparator_card_eq` and
  `SimpleGraph.exists_paths_setSeparator_card_eq`; the edge-disjoint version for disjoint terminal
  sets, with paths allowed to share ends: `TauCeti.exists_paths_setArrowSeparator_card_eq`,
  `Graph.exists_paths_setEdgeSeparator_card_eq` and `SimpleGraph.exists_paths_setEdgeSeparator_card_eq`.
- **Vertex-capacitated set-to-set Menger**, for arbitrary `A, B` and `c : V → ℕ`: packings of `A–B`
  paths whose interiors avoid `A ∪ B`, each vertex, ends included, on at most `c v` members, and
  separators allowed to meet `A ∪ B`: `TauCeti.exists_paths_setSeparator_sum_eq` and
  `SimpleGraph.exists_paths_setSeparator_sum_eq`. At `c = 1` this is vertex-disjoint set-to-set
  Menger; a vertex of `A ∩ B` gives a path of length zero repeated up to `c v` times and lies in every
  separator, even when `c v = 0`; empty terminal sets and zero capacities are included.

The predicate forms for distinct terminals are Tau Ceti's: local edge reachability at threshold `k`
is the existence of `k` edge-disjoint paths (`Graph.isEdgeReachable_iff_exists_paths`,
`SimpleGraph.isEdgeReachable_iff_exists_paths`, `TauCeti.forall_reachableWithout_iff_exists_paths`),
and local vertex reachability, for nonadjacent terminals, is the existence of `k` internally disjoint
paths (`Graph.isVertexReachable_iff_exists_paths`, `SimpleGraph.isVertexReachable_iff_exists_paths`,
`TauCeti.forall_reachableAvoiding_iff_exists_paths`, `Digraph.forall_reachableAvoiding_iff_exists_paths`).
For distinct actual vertices, `G.IsEdgeReachable k s t` holds exactly when `k` is at most the minimum
`s–t` cut value with capacity one on each actual edge
(`Graph.isEdgeReachable_iff_le_pairMinimumValue`, `Graph.edgeReachability_eq_pairMinimumValue`); after
aggregation the capacity of a pair is its edge multiplicity
(`Graph.edgeReachability_eq_pairMinimumValue_pairCapacity`). A finite simple graph with more than `k`
vertices is `k`-vertex-connected exactly when any two distinct vertices, adjacent ones included, are
joined by `k` internally disjoint paths (`SimpleGraph.isVertexConnected_iff_forall_exists_paths`), and
the directed analogue is `TauCeti.isVertexStrong_iff_exists_paths`.

The targets of this section (Diestel, *Graph Theory*, Chapter 3; Bang-Jensen–Gutin, *Digraphs*):

- **Multigraph set-to-set Menger.** The vertex-disjoint and vertex-capacitated set-to-set versions for
  multigraphs, with native path witnesses, by the simplification of §1.1.
- **Digraph corollaries.** The local edge, adjacent-terminal, set-to-set, vertex-capacitated
  set-to-set and edge set-to-set versions for `Digraph`, through the arrow family `Digraph.AdjHom` of
  §1.1.
- **Simplification lemmas.** To obtain vertex versions without finitely many edges or arrows, pass to
  the simplification, or in the directed case to one arrow per inhabited `Q v w`, and lift paths by
  choosing actual edges or arrows; these preserve vertex usage and separators, allow repeated paths in
  capacitated packings, and treat direct edges separately in the adjacent case. The vertex theorems
  above use this inside their proofs; the target is the standalone lemmas.
- **Global multigraph Menger.** A multigraph with finitely many actual vertices, more than `k` of
  them, is `k`-vertex-connected exactly when any two distinct actual vertices, adjacent ones included,
  are joined by `k` internally disjoint native paths, with no finite edge set.
- **Simple graphs and cut values.** For a simple graph, local edge reachability is the minimum cut
  value of the pair capacity that is one on edges and zero elsewhere.

*Needs:* §1.1, §1.2, §1.4, §1.5, Layer 3 (max-flow/min-cut, integrality, decomposition); §4.1 for
cut minimization only, without the lattice, residual-poset or uncrossing results; Tau Ceti's Menger
theorems named above.

### 5.2 Reductions to max-flow

The reductions instantiate vertex splitting and auxiliary terminals over `ℤ`, where integrality is
the case `H = ⊤`, and recover actual path families and separators, not only equalities of optima.
For vertex targets without finitely many edges or arrows they apply to the simplification, or to one
arrow per inhabited `Q v w`, with the path-lifting and separator correspondences of §5.1. Tau Ceti's
Menger theorems use routes of their own: flows decompose into packings
(`TauCeti.Flow.exists_paths_card_eq_val_card_filter_le`, `TauCeti.Flow.exists_paths_card_eq_val`),
split cuts give mixed separators (`TauCeti.SplitHom.isMixedSeparator_cutVertices_cutArrows`),
set-to-set flows give arrow-disjoint paths (`TauCeti.SetFlow.exists_paths_card_eq_val`) and cuts give
arrow separators (`TauCeti.TerminalCut.IsAdmissible.not_reachableWithout_of_cut_subset`). The
reductions below are reusable interfaces and are the targets of this section (Schrijver,
*Combinatorial Optimization*, Vol. A).

- **Local and vertex-capacitated vertex Menger.** For distinct terminals, no arrow `s → t` and
  `c : V → ℕ`, put `M = (∑ v, c v) + 1`, capacity `M` on original arrows and on the split arrows of
  `s` and `t`, capacity `c v` on the split arrow of every other vertex, and terminals `s⁺, t⁻`. The
  cut–separator maps are those of §3.5 with `K = ℤ` and `u = M`, independent of the terminal split
  capacities. Nonadjacency makes the deletion of all internal vertices a separator of weight at most
  `M − 1`, and a mixed separator of weight below `M` contains no original arrow, so a cut below `M`
  gives a vertex separator of exactly its weight and a vertex separator gives a cut of no greater
  capacity. After removing cycles, an integral flow decomposes into unit paths with repetition, the
  number of members through a nonterminal `v` being the flow on its split arrow, at most `c v`; for
  `c = 1` the members are distinct and internally disjoint. A packing gives a flow of its size.
- **Set-to-set Menger.** Split every vertex `v` with capacity `c v`, give original arrows capacity
  `M = (∑ v, c v) + 1`, and add arrows `σ → a⁻` for `a ∈ A` and `b⁺ → τ` for `b ∈ B` of capacity `M`.
  Every cut below `M` crosses only split arrows and gives a vertex separator of its weight, allowed
  to meet `A ∪ B`; deleting all split arrows bounds the minimum cut by `∑ v, c v`. Prove the reverse
  separator-to-cut bound and the packing-to-flow and flow-to-packing correspondences preserving size
  and value; shortening projected paths so that their interiors avoid `A ∪ B` does not increase vertex
  usage and keeps each indexed member, even when several become equal, and the route
  `σ → v⁻ → v⁺ → τ` for `v ∈ A ∩ B` projects to the path of length zero, repeated at most `c v`
  times. The case `c = 1` recovers vertex-disjoint families with `M = |V| + 1`.
- **Edge-disjoint set-to-set Menger.** For disjoint `A, B`, use the unsplit quiver, unit original
  capacities and capacity `M = |E| + 1` on `σ → a` and `b → τ`, where `E` is the total arrow type:
  cuts below `M` cross only original arrows, deleting all original arrows bounds the minimum cut by
  `|E|`, and the separator-to-cut and path-family correspondences hold, with shared path ends allowed.
  In the undirected reduction, paths are extracted from the acyclic normalization of §3.3, so that one
  edge is never used twice while distinct parallel edges stay distinct, and loop and cycle flows are
  discarded. Empty terminal sets are included.

*Needs:* §1.4, §3.1, §3.3, §3.5, §5.1.

### Examples

These are required proved examples of Layer 5.

- Complete graphs, including the difference between deletion connectivity and path counts for
  adjacent terminals.
- Parallel direct edges between the terminals together with a path through an internal vertex,
  verifying the adjacent-terminal multiplicity formula.
- Directed parallel arrows `s → t` with arrows `t → s`, verifying that only the forward arrows count
  in the adjacent-terminal correction.
- A path on three vertices with infinitely many parallel edges on each link, verifying vertex
  connectivity and nonadjacent vertex Menger without finitely many edges.
- That graph with one more direct terminal edge, verifying the adjacent-terminal formula with finite
  `D` and infinitely many edges in all.
- Overlapping terminal sets whose common vertex contributes a path of length zero, exercising the
  split-network projection and the separator correspondence.
- A vertex of capacity two through which every `s–t` path passes, so that the capacitated packing
  repeats a path and the separator has weight two.
- Capacitated terminal sets with an end of capacity two and a common vertex of capacity zero or two,
  verifying the usage of ends, repeated paths of length zero and the weighted separator equality.

### Dependencies

Layer 5 uses Layers 1 and 3, and §4.1 for cut minimization only. It uses no later layer.

## Layer 6: connectivity, bipartite matching, and edge-colouring

The vertex-structural results of this layer assume finitely many vertices and use the `SimpleGraph`
vocabulary, applying to multigraphs with finitely many actual vertices and any edge set through
simplification. The native bounds on edge connectivity and the matching and colouring targets assume
finitely many actual vertices and edges, keep multigraph edge identities and give `SimpleGraph`
corollaries.

### 6.1 Whitney inequalities

For simple graphs, `G.IsVertexConnected k` implies `G.IsEdgeConnected k`
(`SimpleGraph.IsVertexConnected.isEdgeConnected`), and on a finite nontrivial vertex type
`G.IsEdgeConnected k` implies `k ≤ G.minDegree` (`SimpleGraph.IsEdgeConnected.le_minDegree`); the
numerical forms are `SimpleGraph.vertexConnectivity_le_edgeConnectivity` and
`SimpleGraph.edgeConnectivity_le_minDegree`. For multigraphs, the native Whitney inequality
`vertexConnectivity G ≤ edgeConnectivity G` is `Graph.vertexConnectivity_le_edgeConnectivity`, with
predicate form `Graph.IsVertexConnected.isEdgeConnected`, and with at least two actual vertices edge
connectivity is at most the number of nonloop edges at each vertex, parallel edges counted separately
(`Graph.edgeConnectivity_le_nonloopIncidenceCount`, `Graph.vertexConnectivity_le_nonloopIncidenceCount`).
The simple-graph specialization is the minimum-degree bound (Diestel, *Graph Theory*, Chapter 3).

This section has no further target.

*Needs:* §1.5, §5.1; Tau Ceti's inequalities named above.

### 6.2 Directed connectivity

For an arrow family `Q`, `TauCeti.IsArcReachable Q k s t` asks for reachability after deleting fewer
than `k` arrows, `TauCeti.IsArcStrong` asks it for every ordered pair, and `TauCeti.IsVertexStrong`
asks for more than `k` vertices and reachability between any two remaining vertices after deleting
fewer than `k` vertices; these need no finite vertex type. The invariants `TauCeti.arcConnectivity`
and `TauCeti.vertexStrongConnectivity` in `ℕ∞` are suprema of thresholds, with the subsingleton
conventions of the undirected invariants (`TauCeti.arcConnectivity_eq_top_of_subsingleton`,
`TauCeti.vertexStrongConnectivity_eq_zero_of_subsingleton`). The threshold equivalences are
`TauCeti.isArcStrong_iff_le_arcConnectivity` and, for a nonempty vertex type,
`TauCeti.isVertexStrong_iff_le_vertexStrongConnectivity`; on the empty type the invariant is zero but
no `IsVertexStrong k` holds. Threshold monotonicity, the case of threshold one
(`TauCeti.isArcStrong_one`), vertex strength bounding arc strength
(`TauCeti.vertexStrongConnectivity_le_arcConnectivity`) and, with at least two vertices, arc
connectivity bounded by the number of arrows leaving, or entering, each vertex, loops included
(`TauCeti.arcConnectivity_le_card_out`, `TauCeti.arcConnectivity_le_card_in`), are Tau Ceti's. The
predicate forms through directed Menger are Tau Ceti's as well: `TauCeti.IsArcReachable Q k s t` is
by definition the left side of `TauCeti.forall_reachableWithout_iff_exists_paths`, so for finitely
many vertices and arrows it holds exactly when there are `k` arrow-disjoint `s–t` paths, and
`TauCeti.IsArcStrong` asks this for every ordered pair (`TauCeti.isArcStrong_def`).

The targets of this section (Bang-Jensen–Gutin, *Digraphs*):

- **API.** Monotonicity of the predicates and invariants in the arrow family, and their deletion
  lemmas.
- **Loop-free degree bounds.** With at least two vertices, arc connectivity is at most the number of
  non-loop arrows leaving, and at most the number entering, each vertex with finitely many such
  arrows; this is the directed analogue of the nonloop bound of §6.1.
- **The bidirected network.** The arc connectivity of the bidirected network of a multigraph is its
  edge connectivity, and its vertex strong connectivity is the vertex connectivity of the multigraph.
- **Digraphs.** The `Digraph` forms through `Digraph.AdjHom`.

*Needs:* §1.1, §1.5, §5.1; Tau Ceti `TauCeti.IsArcReachable`, `TauCeti.IsVertexStrong`,
`TauCeti.forall_reachableWithout_iff_exists_paths`.

### 6.3 Common-cycle characterizations

The blocks with at least three vertices are exactly the vertex sets of the maximal 2-vertex-connected
induced subgraphs (`SimpleGraph.isBlock_and_three_le_encard_iff_maximal_isVertexConnected_two`, with no
finiteness).

The target of this section (Diestel, *Graph Theory*, Chapter 3): for a connected finite simple graph
with at least three vertices, each of the following is equivalent to 2-vertex-connectivity: every two
distinct vertices lie on a common cycle; every two distinct edges lie on a common cycle; every vertex
and every edge lie on a common cycle.

*Needs:* §2.3, §5.1; Tau Ceti `SimpleGraph.IsVertexConnected`, `SimpleGraph.isVertexConnected_two_iff`.

**Checks.**
- In two triangles meeting at a vertex `v`, a vertex of one triangle other than `v` and an edge of the
  other triangle lie on no common cycle, while every two vertices of one triangle do; the graph is
  connected with five vertices and has the cut vertex `v`, so the vertex–edge condition detects it.

### 6.4 Preservation lemmas

Deleting a finite set of at most `k` vertices from a `k`-vertex-connected graph leaves a graph that
is `(k − m)`-vertex-connected for `m` the number deleted
(`SimpleGraph.IsVertexConnected.induce_compl_of_encard_le`); a vertex adjacent to at least `k`
vertices of a `k`-vertex-connected graph keeps it `k`-vertex-connected when adjoined
(`SimpleGraph.isVertexConnected_of_induce_compl_singleton`); adding edges preserves `k`-vertex- and
`k`-edge-connectivity (`SimpleGraph.IsVertexConnected.mono`, `SimpleGraph.IsEdgeConnected.mono`, and
for multigraphs on the same actual vertices `Graph.IsVertexConnected.mono`,
`Graph.IsEdgeConnected.mono`).

The target of this section: the vertex forms of §§6.3–6.6 for multigraphs with finitely many actual
vertices, through simplification, the cycle conditions of §6.3 being read in the simplification.

*Needs:* §1.1, §1.5; Tau Ceti's preservation lemmas named above.

### 6.5 The fan lemma

In a `k`-vertex-connected finite graph, a vertex `x` outside a set `U` of at least `k` vertices has
`k` paths to distinct vertices of `U`, with interiors outside `U` and pairwise meeting only in `x`
(`SimpleGraph.IsVertexConnected.exists_fan`, with the fan form of Menger
`SimpleGraph.exists_fan_separator_card_eq`) (Diestel, *Graph Theory*, Chapter 3).

This section has no target beyond its multigraph form in §6.4.

*Needs:* §5.1.

### 6.6 Dirac's prescribed-vertex cycle theorem

For `k ≥ 2`, every set of at most `k` vertices of a finite `k`-vertex-connected graph lies on a common
cycle, in no prescribed order (`SimpleGraph.IsVertexConnected.exists_isCycle_forall_mem_support`)
(Diestel, *Graph Theory*, Chapter 3).

This section has no target beyond its multigraph form in §6.4.

*Needs:* §6.5.

### 6.7 Multiset capacitated Kőnig's theorem

Define `IsBipartition`: `IsBipartition G L R` says that the finite sets `L, R` of actual vertices of
a multigraph `G` are disjoint and cover `V(G)`, and that every edge joins them, so that there are no
loops. Define `edgeUsage`: for multiplicities `x : E(G) → ℕ`, `edgeUsage G x v` is the sum of the
multiplicities of the edges at `v`. Let `G` be a finite multigraph with `IsBipartition G L R`. For
capacities `b : V(G) → ℕ`, a *multiset capacitated matching* assigns a multiplicity `x e : ℕ` to every
actual edge with `edgeUsage G x v ≤ b v` at every vertex; its size is `∑ e, x e`. An edge may be used repeatedly, whether or not the graph
has parallel edges. A vertex cover `C` meets every edge and has weight `b(C) = ∑ v ∈ C, b v`. Prove
`exists_capacitatedMatching_cover_eq`: some multiset capacitated matching and some vertex cover have
equal size and weight, and every multiset capacitated matching has size at most the weight of every
cover; zero capacities, isolated vertices, empty sides and the empty graph are included (Schrijver,
*Combinatorial Optimization*, Vol. A).

API and correspondences, all targets:

- the bipartition interface with restriction under edge deletion and the common basic API; on
  `Graph.ofSimpleGraph H`, a bipartition is Mathlib's `H.IsBipartiteWith L R` together with
  `L ∪ R = Set.univ`, since `IsBipartiteWith` alone allows isolated vertices outside both sides;
- for matchings: the zero matching, restriction to selected edges, monotonicity in the capacities,
  addition under added capacities, the usage and size formulas, saturation of a vertex or a side, and
  the total usage on either side being the size;
- at `b = 1`, the identification with ordinary edge matchings, without repeated edges, and the
  transport to Mathlib's `SimpleGraph.Subgraph.IsMatching` and `SimpleGraph.IsVertexCover` and to the
  extremality interfaces of the Mathlib proposal on Kőnig's theorem; an ordinary multigraph matching
  is a set of actual edges with pairwise disjoint ends and no loops, whose subgraph has exactly their
  ends as vertices, with the edge-set/subgraph correspondence and the perfect-matching predicate,
  every actual vertex meeting exactly one selected edge;
- the matching-to-packing and cover-to-separator correspondences with the vertex-capacitated
  set-to-set Menger theorem for `A = L`, `B = R` and `c = b`, whose trimmed paths have length one
  because `L ∪ R` contains every vertex, so that repeated paths encode the multiplicities;
- the bipartite network, with source arrows to `L` and arrows from `R` to the sink of capacity `b v`
  and each actual edge directed from `L` to `R` of capacity `b(L) + 1`: value-preserving
  correspondences between integral flows and multiset capacitated matchings, between covers and cuts
  of the same weight, and between cuts of capacity below `b(L) + 1` and covers of the same weight via
  `(L ∖ S) ∪ (R ∩ S)`. Capacity `b(L) + 1` suffices because cutting all source arrows costs `b(L)`.

*Needs:* §1.5, §3.2, §5.1; Mathlib `SimpleGraph.IsBipartiteWith`, `SimpleGraph.Subgraph.IsMatching`,
`SimpleGraph.IsVertexCover`; Tau Ceti `TauCeti.exists_paths_setSeparator_sum_eq`,
`TauCeti.Flow.exists_isMaximum_mem`.

**Checks.**
- A single edge whose two ends both have capacity two: the optimal matching uses the edge twice, of
  size two, and a minimum cover is one end, of weight two. A definition forbidding repeated edges
  would cap the size at one and break the equality with the cover.

### 6.8 Capacitated Hall and deficiency

For the same graph and capacities, let `N(S) ⊆ R` be the set of neighbours of `S ⊆ L`, multiplicity
ignored. The targets of this section (Schrijver, *Combinatorial Optimization*, Vol. A):

- **Capacitated Kőnig–Ore formula**, in witness form: some multiset capacitated matching `x` and some
  `S ⊆ L` satisfy `size(x) = b(L ∖ S) + b(N(S))`, and every `x` and every `S ⊆ L` satisfy the
  inequality `size(x) ≤ b(L ∖ S) + b(N(S))`; numerically, the largest size is
  `b(L) − max over S ⊆ L of (b(S) − b(N(S)))`, with natural subtraction, which is harmless since
  `S = ∅` contributes zero and every `b(S) ≤ b(L)`.
- **Capacitated Hall**, `exists_capacitatedMatching_saturating_left_iff`: a multiset capacitated
  matching saturating every vertex of `L` exists if and only if `b(S) ≤ b(N(S))` for every `S ⊆ L`.
  It saturates both sides if and only if moreover `b(L) = b(R)`. The versions with the sides
  exchanged follow.
- **Ordinary Hall and deficiency.** At `b = 1`, ordinary Hall and the deficiency formula, with
  witnesses `M, S` satisfying `|M| + |S| = |L| + |N(S)|` and the inequality for every matching and
  every `S ⊆ L`. Ordinary deficiency also holds for a family `t : ι → Finset α` with finite `ι`: some
  set `D` of indices with an injective choice function on `D` choosing `f i ∈ t i`, and some set `S`
  of indices, satisfy `|D| + |S| = |ι| + |⋃ i ∈ S, t i|`, and every set `D'` of indices with an
  injective choice function on it and every set `S` of indices satisfy
  `|D'| + |S| ≤ |ι| + |⋃ i ∈ S, t i|`; the choice function is defined only on its set of indices,
  so the empty partial choice is allowed even when `α` is empty. Mathlib's
  `Finset.all_card_le_biUnion_card_iff_existsInjective'` and the finite case of
  `SimpleGraph.exists_isMatching_of_forall_ncard_le` are recovered as compatibility checks; Mathlib's
  statements remain the library's Hall interfaces, and the latter also covers locally finite infinite
  graphs, which are outside this development.

*Suggested proof:* normalize a minimum cover to `(L ∖ S) ∪ N(S)` and apply the matching–cover
inequality of §6.7.

*Needs:* §6.7; Mathlib `Finset.all_card_le_biUnion_card_iff_existsInjective'`,
`SimpleGraph.exists_isMatching_of_forall_ncard_le`.

**Checks.**
- With `L = {a}`, `R = {r}`, two parallel edges `a–r`, `b(a) = 2` and `b(r) = 1`: `N({a}) = {r}` and
  `b(N({a})) = 1 < 2`, so no matching saturates `a`, although `a` meets two edges. Counting
  neighbours with multiplicity would wrongly allow it.

### 6.9 Regular bipartite multigraphs and edge-colouring

For a finite bipartite multigraph the degree of a vertex is its incidence count (§1.5); there are no
loops, and parallel edges count separately. The targets of this section (Schrijver, *Combinatorial
Optimization*, Vol. A):

- **Regular bipartite multigraphs.** For `k ≥ 1`, a `k`-regular bipartite multigraph has a perfect
  matching and its two sides have equal size. For every `k : ℕ`, its edge set is the disjoint union of
  `k` perfect matchings; for `k = 0` the graph is edgeless and the family is empty, without requiring
  a perfect matching to exist; the empty graph is included. Deleting a perfect matching from a
  `k`-regular bipartite multigraph leaves a `(k − 1)`-regular bipartite multigraph on the same actual
  vertices, with the incidence and partition formulas needed to iterate. The simple-graph results use
  `SimpleGraph.IsRegularOfDegree` and `SimpleGraph.Subgraph.IsPerfectMatching`. *Suggested proof:*
  Hall and incidence counting, then repeated deletion of perfect matchings.
- **Edge-colourings.** A proper edge-colouring with colour type `C` assigns a colour to every actual
  edge, distinct edges with a common end receiving distinct colours. The line graph of a multigraph is
  the simple graph on the actual edge identities in which distinct edges sharing an end are adjacent,
  with its adjacency lemmas and its compatibility with Mathlib's `SimpleGraph.lineGraph`; edge
  colourings are colourings of it, reusing `SimpleGraph.Coloring` with its relabelling and transport.
  For loopless multigraphs (Mathlib's `Graph.Loopless`): the common basic API, injective relabelling of
  colours, restriction to edge-deleted subgraphs, and the equivalence between colourings and
  partitions into matchings.
- **Kőnig's edge-colouring theorem**, `exists_edgeColoring_iff`: for every `k : ℕ`, a finite
  bipartite multigraph has a proper edge-colouring by `Fin k` if and only if every vertex has degree at
  most `k`. Equivalently, its edges partition into `k` matchings, empty colour classes allowed; for
  `k = 0` this is exactly the edgeless case. The least number of colours is the maximum degree,
  defined to be zero for an empty vertex set. The simple-graph corollaries, and the transport to the
  edge-colouring interface of the Mathlib proposal on edge colourings, follow.
- **Regular completion.** For `G : Graph α β` with a bipartition and every degree at most `k`,
  construct a finite `k`-regular bipartite `G' : Graph (α ⊕ ℕ) (β ⊕ ℕ)`, `Sum.inl` keeping the original
  vertex and edge identities and `Sum.inr` giving the new ones, with
  `Sum.inl x ∈ V(G') ↔ x ∈ V(G)`, `Sum.inl e ∈ E(G') ↔ e ∈ E(G)` and
  `G'.IsLink (Sum.inl e) (Sum.inl x) (Sum.inl y) ↔ G.IsLink e x y`, whose sides restrict along
  `Sum.inl` to those of `G`. Restricting to the images of the original vertices and edges recovers `G`
  up to `Graph.Iso`, deleting added edges even between original vertices; the incidence inclusion
  holds, the edges of `G` at `x` being sent by `Sum.inl` into the edges of `G'` at `Sum.inl x`; and a
  proper colouring of `G'` restricts to one of `G`. *Suggested proof:* equalize the sides with isolated vertices, pair the
  degree deficits, then restrict a colouring of the completion by perfect matchings.

*Needs:* §1.1, §1.5, §6.8; Mathlib `SimpleGraph.lineGraph`, `SimpleGraph.Coloring`,
`SimpleGraph.IsRegularOfDegree`, `Graph.Loopless`; Tau Ceti `Graph.incidenceCount`.

**Checks.**
- Two vertices joined by `k` parallel edges need `k` colours, and their edge set is the union of `k`
  perfect matchings of one edge each. The triangle has every degree two but needs three colours, so
  the theorem needs bipartiteness; the four-cycle needs two.

### Examples

These are required proved examples of Layer 6.

- A single edge with capacity two at both ends, whose optimal multiset matching uses it twice and
  whose minimum cover has weight two.
- Zero capacities and isolated vertices, and a capacitated Hall obstruction witnessed by an explicit
  subset of one side.
- Two vertices joined by `k` parallel edges, with `k` perfect matchings and a proper edge-colouring
  needing `k` colours.
- An irregular bipartite graph, its regular completion and the restricted colouring; the empty and
  edgeless cases with zero colours.
- An isolated vertex: no perfect matching, but an empty decomposition into perfect matchings and a
  proper colouring by `Fin 0`.

### Dependencies

Layer 6 uses Layers 1 and 5, Layer 2 for the blocks of §6.3, and Layer 3 for the bipartite network
of §§6.7–6.9, which use no block theory.

## Layer 7: ear decompositions and strong orientations

### 7.1 Ear decompositions as data

An open ear added to a subgraph `H` of a multigraph is a path of positive length with distinct ends
in `H`, internal vertices outside `H` and edge identities outside `H`; a closed ear added to `H` is a
cycle meeting `H` exactly at its base vertex and using no edge of `H`. Single-edge open ears, one-edge loop ears
and two-edge closed ears on distinct parallel edges are allowed; the unused-edge condition applies to
both kinds, loops included. An ear decomposition is data, not a proposition: Tau Ceti's `Graph.Ear`
and `Graph.EarDecomposition G H` record a start, one actual vertex or a cycle (`Graph.EarStart`), the
ears in order, and the graph after each prefix on the same ambient types, with the initial graph
(`Graph.EarDecomposition.initial`), the kind and walk of each ear (`Graph.EarDecomposition.kindAt`,
`Graph.EarDecomposition.walkAt`), each successor stage adding exactly its displayed ear, the final
graph `H`, prefix decompositions (`Graph.EarDecomposition.prefix`) and an induction principle in the
order of construction (`Graph.EarDecomposition.prefix_induction`). A decomposition of `G` is a term of
`G.EarDecomposition G`. An open ear decomposition starts from a cycle and has only open ears
(`Graph.EarDecomposition.IsOpen`).

The targets of this section (Diestel, *Graph Theory*, Chapter 3):

- **Coverage and connectivity.** A decomposition of `G` covers every actual vertex and edge,
  loops and all parallel edges included: every actual edge lies in the start or in exactly one ear,
  and every actual vertex lies in the start or is an internal vertex of exactly one ear; the number
  of ears of each kind; adding an open or closed ear preserves 2-edge-connectivity, and adding an open ear
  preserves 2-vertex-connectivity.
- **Simple graphs.** Decompositions of `Graph.ofSimpleGraph H` transport to the `H.Subgraph`
  interface and back, preserving the prefix API (the instance of the transport of §1.1), and the open
  predicate is expressed on the transported data. For a closed ear in a simple graph the unused-edge
  condition follows from the cycle and vertex conditions, since every edge of a cycle has a new end.

*Needs:* §1.1; Tau Ceti `Graph.EarDecomposition`, `Graph.walkGraph`, `Graph.Compatible.union`.

### 7.2 Ear characterizations

Without finiteness, a multigraph is 2-edge-connected exactly when its actual vertices are pairwise
reachable and none of its actual edges is a bridge, both sides holding for the empty vertex set
(`Graph.isEdgeConnected_two_iff_forall_reachable_and_forall_not_isBridge`); the multigraph criterion
agrees with Mathlib's `SimpleGraph.isEdgeConnected_two_iff_forall_not_isBridge` under
`Graph.ofSimpleGraph` (`Graph.preconnected_and_forall_not_isBridge_ofSimpleGraph_iff`). **Why:**
`SimpleGraph.IsBridge` can hold for non-edges between components, while multigraph bridges are actual
edges.

The targets of this section (Diestel, *Graph Theory*, Chapter 3; Bang-Jensen–Gutin, *Digraphs*, for
directed ears):

1. **Whitney's ear theorem**, `isVertexConnected_two_iff_exists_isOpen_earDecomposition`: a finite
   simple graph `H` with at least three vertices is 2-vertex-connected if and only if
   `Graph.ofSimpleGraph H` has an open ear decomposition. Existence starts from any prescribed cycle,
   `exists_isOpen_earDecomposition_initial_eq`: for each cycle `c` of a 2-vertex-connected finite
   simple graph, some open ear decomposition has initial graph exactly the graph traced by `c`. The
   prescribed-edge corollary chooses an initial cycle through a given edge. The characterization
   applies to the simplification of a multigraph; it does not assert that open ears cover loops.
2. **Ears and 2-edge-connectivity**, `isEdgeConnected_two_iff_exists_earDecomposition`: a finite
   multigraph with an actual vertex is 2-edge-connected if and only if it is built from one vertex by
   adding open and closed ears, that is, it has an ear decomposition whose start is not a cycle. The
   simple-graph form follows through §7.1.
3. **Directed ears.** A network `N` with nonempty finite vertex type and finite arrow types is
   strongly connected if and only if it is built from one vertex by adding directed open and closed
   ears, covering every arrow. Directed ears are directed paths and cycles of `N` keeping arrow
   identities, loops being one-arrow closed ears, and the directed decomposition has the prefix API of
   §7.1 with the subnetworks of §1.3. The start from one vertex includes the isolated singleton with
   no ears, and is related to the start from a cycle for strongly connected networks with at least
   two vertices. The directed analogue of the bridge criterion: a network with nonempty vertex type
   that is weakly connected, any two vertices being joined by a path of the symmetrized arrow family,
   is strongly connected if and only if every arrow lies on a directed cycle. The `Digraph` forms
   follow through `Digraph.AdjHom`.

*Needs:* §1.1, §1.3, §2.1, §5.1 or §6.3 for vertex paths, §7.1; Tau Ceti `Graph.EarDecomposition`,
`SimpleGraph.IsVertexConnected`, `Graph.IsEdgeConnected`, `TauCeti.ArrowWalk.IsCycle`.

**Checks.**
- In the four-cycle `a, b, c, d` with the chord `a–c`, the four-cycle followed by the chord as a
  single-edge open ear is an open ear decomposition, and so is the triangle `a, b, c` followed by the
  open ear `a, d, c`. Two vertices joined by two parallel edges are built from one vertex by one closed
  ear of two edges, and are 2-edge-connected, while their simplification, a single edge, is not.

### 7.3 Robbins' theorem

The targets of this section (Bang-Jensen–Gutin, *Digraphs*):

- **Robbins' theorem**, `exists_isStronglyConnected_orientation_iff`: a finite multigraph has an
  orientation that is strongly connected on its actual vertices if and only if it is 2-edge-connected.
  No connectedness or size hypothesis is needed: both sides hold when the actual vertex set is
  subsingleton, loops included.
- **Classical and componentwise forms.** A nonempty connected finite multigraph has a strongly
  connected orientation exactly when it has no bridge; an orientation strongly connected on each
  component exists exactly when no actual edge is a bridge.
- **Simple graphs**, `exists_isStronglyConnected_doubledQuiverOrientation_iff`: a finite simple graph
  has an orientation `TauCeti.DoubledQuiver.Orientation` whose quiver is strongly connected if and only
  if it is 2-edge-connected, through the orientation equivalence of §1.1.

*Suggested proof:* orient the ears of a decomposition from §7.2 and apply the directed ear
characterization.

*Needs:* §1.1, §7.2; Tau Ceti `Graph.Orientation`, `TauCeti.DoubledQuiver.Orientation`; Mathlib
`Quiver.IsStronglyConnected`.

**Checks.**
- A single edge has no strongly connected orientation and is not 2-edge-connected; two vertices joined
  by two parallel edges, oriented in opposite directions, are strongly connected, while their
  simplification is not. A loop on one vertex is a one-edge cycle and a closed ear, not a bridge, and
  contributes nothing to cuts.

### 7.4 `st`-numberings and acyclic orientations

The targets of this section (Even–Tarjan, *Computing an st-numbering*):

- **Existence**, `exists_stNumbering`: for a finite 2-vertex-connected simple graph and an edge with
  ordered ends `s, t`, the vertices can be numbered bijectively by `Fin |V|` with `s` numbered zero
  and `t` numbered `|V| − 1`, so that every other vertex has a lower-numbered and a higher-numbered
  neighbour.
- **API.** Injectivity, extremality of the ends, reversal exchanging `s` and `t`, transport under
  graph isomorphisms, and preservation when edges are added on the same vertex type.
- **The orientation.** Orienting each edge from its lower-numbered to its higher-numbered end, with
  `TauCeti.DoubledQuiver.Orientation` (for instance through
  `TauCeti.DoubledQuiver.Orientation.ofLinearOrder`), gives an orientation with no directed closed walk
  of positive length, in which `s` is the only vertex with no incoming arrow and `t` the only vertex
  with no outgoing arrow, every vertex is reachable from `s` and reaches `t`, compatibly with the
  vertex and arrow equivalences of `TauCeti.DoubledQuiver.OrientedQuiver`. No planarity assumption or
  drawing algorithm is involved.

*Suggested proof:* start an open ear decomposition with a cycle through `st` (§7.2), order the
vertices along the other `s–t` arc, and insert the internal vertices of each new ear between its
ordered ends.

*Needs:* §7.2; Tau Ceti `TauCeti.DoubledQuiver.Orientation`,
`TauCeti.DoubledQuiver.OrientedQuiver.isAcyclic_ofLinearOrder`.

**Checks.**
- In the four-cycle `a, b, c, d` with the chord `a–c` and the edge `s = a`, `t = b`, the numbering
  `a ↦ 0`, `d ↦ 1`, `c ↦ 2`, `b ↦ 3` is an `st`-numbering: `d` has neighbours numbered `0` and `2`,
  and `c` has neighbours numbered `1` and `3`. Numbering `c ↦ 1`, `d ↦ 2` instead fails at `d`,
  whose neighbours `a` and `c` are both lower.

### Examples

These are required proved examples of Layer 7.

- Two vertices joined by two parallel edges: edge connectivity two, a two-edge cycle and closed ear,
  and a strongly connected orientation, compared with the simplification to one edge.
- A loop on one vertex: a one-edge cycle and closed ear, no bridge, and no contribution to cuts.
- The four-cycle with a chord: open ear decompositions starting from the four-cycle and from a
  triangle, and an `st`-numbering with its acyclic orientation for a chosen edge.

### Dependencies

Layer 7 uses Layers 1 and 2, the vertex path results of Layer 5 or 6, and §§7.1–7.2 for §§7.3–7.4.

## Layer 8: bounded circulations, prescribed excess, and indegree orientations

§§8.1–8.7 concern finite vertex and arrow types; only `ℓ ≤ u` is required of the bounds, and both
bounds and values may be negative. Exact-excess assignments, circulations and bounded terminal
assignments share the network and residual constructions of Layer 1 (`TauCeti.ExcessFlow`,
`TauCeti.IsCirculation`, `TauCeti.BoundedFlow`). Bounded terminal assignments have extensionality,
bound relaxation (`TauCeti.BoundedFlow.mono`), transport under network isomorphisms
(`TauCeti.Network.Iso.mapBoundedFlow`) and coefficient maps (`TauCeti.BoundedFlow.map`), and a
vertex set closed under arrows has total excess zero (`TauCeti.sum_excessAt_eq_zero_of_forall_mem_iff`,
with the interval forms `TauCeti.ExcessIntervalFlow.sum_le_zero_of_forall_mem_iff` and
`TauCeti.ExcessIntervalFlow.zero_le_sum_of_forall_mem_iff`).

The targets common to the layer (Bertsekas, *Linear Network Optimization*, §1.1.3): for exact-excess
and interval-excess assignments, extensionality (they are subtypes), restriction to components,
disjoint unions of networks and of assignments, bound relaxation, arrow reversal, and transport
under network isomorphisms and coefficient embeddings; for bounded terminal assignments, restriction
to components, disjoint unions and arrow reversal; and, for componentwise feasibility, that the
prescribed excess sums to zero on each component of the underlying undirected graph.

### 8.1 Signed circulation algebra and assignment shifts

On a fixed finite quiver, the signed assignments of zero excess are the kernel of `TauCeti.excessHom`
(`TauCeti.isCirculation_iff_mem_ker`); two assignments have the same excess exactly when their
difference is a signed circulation (`TauCeti.excessAt_eq_iff_isCirculation_sub`), and adding a signed
circulation preserves excess, while feasible circulations with bounds need not be closed under
addition. For any reference assignment `h`, with no feasibility assumption, `f ↦ f − h` is an
equivalence replacing the bounds by `ℓ − h, u − h` and the prescribed excess by `b − excess h`
(`TauCeti.ExcessFlow.shiftEquiv`, with `TauCeti.ExcessFlow.shiftEquiv_apply_val` and
`TauCeti.ExcessFlow.shiftEquiv_symm_apply_val`); for interval excess both vertex endpoints shift by
`−excess h` (`TauCeti.ExcessIntervalFlow.shiftEquiv`); values in an additive subgroup are preserved
when `h` takes values in it (`TauCeti.ExcessFlow.shiftEquiv_apply_mem_iff`). Lower-bound subtraction is
the case `h = ℓ`, onto the ordinary network with capacities `u − ℓ` and prescribed excess
`b − excess ℓ` (`TauCeti.ExcessFlow.shiftLowerEquiv`), which for circulations is in general not zero;
a feasible reference of the same excess gives prescribed excess zero
(`TauCeti.ExcessFlow.circulationEquiv`).

The target of this section (Bertsekas, *Linear Network Optimization*, §1.1.3): the shift by zero is
the identity, and shifting by `h` and then by `h'` is the shift by `h + h'`.

*Needs:* §1.3; Tau Ceti `TauCeti.excessHom`, `TauCeti.ExcessFlow.shiftEquiv`.

**Checks.**
- On two vertices with arrows `v → w` and `w → v`, each with bounds `[1, 2]`, the circulation with
  value one on both arrows sits at its lower bounds and cannot be decreased. Lower-bound subtraction
  gives capacities `1` on both arrows and prescribed excess `b − excess ℓ = 0` here, because the lower
  bounds themselves circulate; with the lower bound `1` on `v → w` and `0` on `w → v`, the prescribed
  excess becomes `−1` at `w` and `1` at `v`. Keeping the prescribed excess zero after the shift would
  accept the shifted assignment zero, whose unshifted assignment, `1` on `v → w` and `0` on `w → v`,
  is not a circulation.

### 8.2 Feasibility and certificates

*Hoffman's circulation theorem*: a feasible circulation exists if and only if
`ℓ(δ⁻(S)) ≤ u(δ⁺(S))` for every vertex set `S` (`TauCeti.exists_isCirculation_iff`). More generally,
an assignment within the bounds with `excess f = b` exists exactly when `∑ v, b v = 0` and
`b(S) + ℓ(δ⁺(S)) ≤ u(δ⁻(S))` for every `S` (`TauCeti.ExcessFlow.nonempty_iff`), positive `b` being
demand and negative `b` supply. The witness alternative, a feasible assignment or a nonzero total
prescribed excess or a set violating the inequality strictly, is
`TauCeti.ExcessFlow.nonempty_or_certificate`, and for circulations a feasible circulation or a
violating Hoffman cut is `TauCeti.exists_isCirculation_or_cut`. When `b` and both bounds take values
in an additive subgroup `H`, a feasible assignment with values in `H` exists whenever one exists
(`TauCeti.ExcessFlow.exists_mem_iff`, `TauCeti.exists_isCirculation_mem_iff`). The reduction to
max-flow adds auxiliary terminals after lower-bound subtraction, with `b' = b − excess ℓ`, an arrow
from the auxiliary source to each vertex of capacity `max (−b' v) 0` and from each vertex to the
auxiliary sink of capacity `max (b' v) 0` (`TauCeti.excessCapacity`): saturating these arrows is
equivalent to feasibility, preserving values in `H` both ways (`TauCeti.ExcessFlow.auxFlowEquiv`,
`TauCeti.ExcessFlow.auxFlowEquiv_mem_iff`), and for balanced `b'` the required value is
`∑ v, max (b' v) 0`, attained exactly when all auxiliary arrows are saturated
(`TauCeti.Flow.val_le_sum_max`, `TauCeti.Flow.val_eq_sum_max_iff`) (Schrijver, *Combinatorial
Optimization*, Vol. A; Bertsekas, *Linear Network Optimization*, Exercises 2.4–2.6 of §1.2).

This section has no target beyond its examples.

*Needs:* §1.3, §3.1, §8.1; Tau Ceti `TauCeti.exists_isCirculation_iff`, `TauCeti.ExcessFlow.nonempty_iff`.

**Checks.**
- One arrow `v → w` with bounds `[0, 1]`: the prescribed excess `b(w) = 1`, `b(v) = −1` (demand at
  `w`) is realized by the value one, and the condition holds at `S = {w}` as `1 + 0 ≤ 1`. The
  prescribed excess `b(v) = 1`, `b(w) = −1` is infeasible, witnessed at `S = {v}` by `1 + 0 > 0`. The
  convention of excess as outgoing minus incoming exchanges the two verdicts.

### 8.3 Interval excess

For finite vertex bounds `a ≤ b`, interval-excess assignments `TauCeti.ExcessIntervalFlow lo hi a b`
live on the same carrier, with the shifts of §8.1 and, at equal endpoints, an equivalence with exact
excess preserving every arrow value (`TauCeti.ExcessIntervalFlow.equivExcessFlow`). The network on the
original vertices and one fresh vertex `r`, keeping all original arrows and adding an arrow `v → r`
with bounds `[a v, b v]` for each original vertex (`TauCeti.IntervalExcessHom`,
`TauCeti.Network.intervalExcess`), has circulations equivalent to the interval-excess assignments, the
auxiliary arrow at `v` carrying the original excess at `v` and conservation at `r` following from
total excess zero (`TauCeti.ExcessIntervalFlow.circulationEquiv`), including for empty vertex types and
loops. From Hoffman, writing `a(S)` and `b(S)` for vertex sums, a feasible assignment exists exactly
when `a(S) ≤ U(Sᶜ)` and `−U(S) ≤ b(S)` for every `S` (`TauCeti.ExcessIntervalFlow.nonempty_iff`); the
whole-set case `a(V) ≤ 0 ≤ b(V)` and its componentwise versions are necessary balance conditions, not
substitutes for the cut inequalities (`TauCeti.ExcessIntervalFlow.sum_le_zero`,
`TauCeti.ExcessIntervalFlow.zero_le_sum`); the witness alternative is
`TauCeti.ExcessIntervalFlow.nonempty_or_certificate`, the exact criterion is recovered at `a = b`
(`TauCeti.ExcessFlow.nonempty_iff_forall_cutBound`), and integrality in `H` is
`TauCeti.ExcessIntervalFlow.exists_mem_iff`. These vertex bounds constrain net supply and demand;
limits on the total traffic through a vertex use vertex splitting instead.

The targets of this section (Schrijver, *Combinatorial Optimization*, Vol. A): vertex-bound
relaxation, enlarging the intervals `[a v, b v]` keeping every feasible assignment feasible, and the
common API of the layer for interval excess.

*Needs:* §8.1, §8.2; Tau Ceti `TauCeti.ExcessIntervalFlow`, `TauCeti.cutBound`.

### 8.4 Residual adjustments

For feasible assignments `f, g`, the residual assignment with `r(e⁺) = max (g e − f e) 0` and
`r(e⁻) = max (f e − g e) 0` (`TauCeti.residualDifference`) lies within the residual capacities, the
update of `f` by `r` is `g` (`TauCeti.residualUpdate_residualDifference`), and
`excess r = excess g − excess f` (`TauCeti.excessAt_residualDifference`); equal-excess assignments thus
give a residual circulation (`TauCeti.isCirculation_residualDifference`), with no second difference
construction. This representative never uses both residual copies of an arrow positively
(`TauCeti.residualDifference_inl_inf_inr`); arbitrary residual representatives need not be unique. For
equal-excess assignments, the residual circulation decomposes into finitely many nonnegative cycle
flows, and the corresponding updates stay feasible, keep the excess at every stage, and end at `g`
(`TauCeti.PathCycleDecomposition.cycleUpdate`, `TauCeti.PathCycleDecomposition.cycleUpdate_mem_Icc`,
`TauCeti.PathCycleDecomposition.excessAt_cycleUpdate`), with values in an additive subgroup preserved
throughout (`TauCeti.residualDifference_mem`, `TauCeti.PathCycleDecomposition.cycleUpdate_mem`).

This section has no further target; its required examples are Tau Ceti's
(`TauCeti/Combinatorics/Network/Examples.lean`).

*Needs:* §1.3, §3.1.

### 8.5 Flows and circulations

For any `q : K` and distinct `s, t`, bounded `s–t` assignments of value `q` correspond to circulations
of the network with a fresh tagged arrow `t → s` of bounds `q, q`, distinct from every existing arrow
(`TauCeti.ReturnHom`, `TauCeti.BoundedFlow.returnEquiv`), with both round trips, every original arrow
value preserved and `q` recovered on the return arrow; the ordinary case with zero lower bounds and
`q ≥ 0` is `TauCeti.Flow.returnEquiv`. With return bounds an interval `[a, b]`, the correspondence
characterizes the assignments with terminal value in that interval
(`TauCeti.BoundedFlow.returnIntervalEquiv`, which needs no `a ≤ b`).

This section has no further target.

*Needs:* §8.1.

### 8.6 Extremal terminal values

For distinct terminals and a network with finite bounds admitting some bounded `s–t` assignment, the
minimum value `m` and the maximum value `M` are attained (`TauCeti.BoundedFlow.exists_isMaximum`,
`TauCeti.BoundedFlow.exists_isMinimum`), with source-side cuts witnessing `m = max L(S)` and
`M = min U(S)` over the sets `S` with `s ∈ S`, `t ∉ S`
(`TauCeti.BoundedFlow.IsMaximum.exists_val_eq_cutBound`,
`TauCeti.BoundedFlow.IsMinimum.exists_val_eq_neg_cutBound_compl`), neither zero nor a nonnegative value
being assumed. Every feasible assignment satisfies `L(S) ≤ val f ≤ U(S)`
(`TauCeti.BoundedFlow.val_le_cutBound`, `TauCeti.BoundedFlow.neg_cutBound_compl_le_val`), and the
feasible prescribed values are exactly those with `m ≤ q ≤ M` (`TauCeti.BoundedFlow.range_val_eq_Icc`).
Maximum value is the absence of a positive residual `s–t` path, and minimum value the absence of a
positive residual `t–s` path (`TauCeti.BoundedFlow.isMaximum_iff_not_positiveReachable`,
`TauCeti.BoundedFlow.isMinimum_iff_not_positiveReachable`). If both bounds lie in an additive subgroup
`H`, the extrema are attained with values in `H`, and every `q ∈ H` in the feasible interval has a
witness with values in `H` (`TauCeti.BoundedFlow.exists_isMinimum_isMaximum_mem`,
`TauCeti.BoundedFlow.exists_val_eq_mem`); the ordinary maximum-flow theorem is the zero-lower-bound,
nonnegative-value case.

The target of this section (Schrijver, *Combinatorial Optimization*, Vol. A): the reductions from a
feasible starting assignment `f` to the ordinary max-flow problems of its residual network in the two
directions, through the shared update and value formulas (`TauCeti.BoundedFlow.update`,
`TauCeti.BoundedFlow.val_update`): `M` is the value of `f` plus the maximum value of an ordinary flow
from `s` to `t` in the residual network of `f`, and `m` is the value of `f` minus the maximum value
of one from `t` to `s`; the cut lattice and canonical cuts of Layer 4 apply.

*Needs:* §4.1, §4.2, §8.5; Tau Ceti `TauCeti.BoundedFlow`, `TauCeti.BoundedFlow.update`.

### 8.7 Rounding

For a linearly ordered ring `R` with Mathlib's `FloorRing` structure and an `R`-valued assignment
whose excess at every vertex is the cast of an integer, some integer assignment has the same integer
excess and every arrow value between the floor and the ceiling of the original one
(`TauCeti.exists_integerRounding`, for a ring with a linear order compatible with addition and a floor); it
keeps any integer lower and upper bounds the original respects
(`TauCeti.exists_integerRounding_mem_Icc`), specializes to circulations and to flows of integer value
(`TauCeti.exists_integerRounding_isCirculation`, `TauCeti.Flow.exists_integerRounding`), and to the
rationals and reals (`TauCeti.exists_integerRounding_rat`, `TauCeti.exists_integerRounding_real`). The
ring and floor structure are assumptions of this section only, and no rounding is asserted for
non-integer prescribed excess (Bertsekas, *Linear Network Optimization*, Exercises 2.4–2.6 of §1.2).

This section has no further target; its required examples are Tau Ceti's
(`TauCeti/Combinatorics/Network/Rounding.lean`).

*Needs:* §8.2.

### 8.8 Prescribed and bounded indegree orientations

Let `G` be a finite multigraph, loops and parallel edges allowed, and `o : G.Orientation`. Its
indegree `Graph.Orientation.indegree o v` counts the actual edges with head `v`, a loop once, and
`Graph.Orientation.outdegree` dually; `E(S)` is `Graph.internalEdges S`, the actual edges with both
ends in `S`, and `I(S)` is `Graph.incidentEdges S`, those with an end in `S`, each counted once; for
`d : V(G) → ℕ` write `d(S) = ∑ v ∈ S, d v`. The indegrees sum to `|E(G)|`, loops included
(`Graph.Orientation.sum_indegree`), and reversal exchanges indegree and outdegree
(`Graph.Orientation.indegree_reverse`). *Hakimi's theorem*: an orientation with indegree `d v` at
every vertex exists if and only if `d(V(G)) = |E(G)|` and `|E(S)| ≤ d(S)` for every `S`
(`Graph.exists_orientation_indegree_eq_iff`). For `a ≤ b` pointwise, an orientation with
`a v ≤ indegree ≤ b v` exists if and only if `|E(S)| ≤ b(S)` and `a(S) ≤ |I(S)|` for every `S`
(`Graph.exists_orientation_indegree_mem_Icc_iff`), the exact theorem being the case `a = b = d`, where
the total balance and the internal-edge inequalities imply the incident-edge ones by complementation.
The upper-bound and lower-bound corollaries are `Graph.exists_orientation_indegree_le_iff` and
`Graph.exists_orientation_le_indegree_iff`, with outdegree versions by reversal; the witness
alternatives, an orientation or a vertex set violating an inequality strictly, or for prescribed
indegrees a failure of total balance, are `Graph.exists_orientation_indegree_mem_Icc_or_certificate`
and `Graph.exists_orientation_indegree_eq_or_certificate`. No connectivity is imposed on the
orientation. The reduction is the edge-to-endpoint network over `ℤ` (`Graph.EndpointHom`): one node for
each actual edge and each actual vertex, a capacity-one arrow from an edge node to each of its distinct
ends, so one arrow for a loop, prescribed excess `−1` at each edge node and in `[a v, b v]` at each
vertex node (`Graph.endpointBound`); integral feasible assignments correspond to orientations within
the bounds, the head of an edge being read off from the unique unit leaving its node
(`Graph.orientationEndpointEquiv`), and feasibility comes from §§8.2–8.3 (Frank–Gyárfás, *How to orient
the edges of a graph?*).

The targets of this section: restriction of orientations under edge deletion, disjoint-union formulas
for indegree and outdegree, and transport through the orientation equivalence of §1.1 for simple
graphs.

*Needs:* §1.1, §1.5, §8.3; Tau Ceti `Graph.Orientation.indegree`,
`Graph.exists_orientation_indegree_mem_Icc_iff`.

**Checks.**
- On a triangle, the indegree vectors `(1, 1, 1)` and `(2, 1, 0)` are realized, while `(3, 0, 0)` is
  not, although its total is three: the internal-edge inequality fails at the set of the two other
  vertices, which span one edge and have indegree sum zero. A criterion keeping only the total balance
  would accept it.
- A single vertex with one loop has indegree exactly one in its only orientation, so `d = 1` is the
  only realizable prescription; counting a loop twice would require `d = 2`.

### Examples

These are required proved examples of Layer 8; where Tau Ceti proves one, it is said.

- A bounded circulation with flow at a lower bound that cannot be cancelled, where lower-bound
  subtraction gives nonzero prescribed excess (Tau Ceti's `TauCeti/Combinatorics/Network/Shift.lean`).
- A reference assignment outside the bounds, exercising the shift equivalence (Tau Ceti's), and a
  feasible reference reducing the prescribed excess to zero.
- Bounds crossing zero, an arrow with two negative bounds and a loop with equal negative bounds,
  exercising feasibility, arrow reversal (`TauCeti.Network.reorient`) and residual capacities.
- A feasible bounded assignment and a strictly violating cut for an infeasible one (Tau Ceti's
  `TauCeti/Combinatorics/Network/Hoffman.lean`).
- Exact excess from equal interval endpoints, a feasible flexible supply-and-demand problem, an
  interval problem with a strict cut obstruction although its total interval contains zero, and the
  empty-vertex and loop cases of the interval reduction (Tau Ceti's
  `TauCeti/Combinatorics/Network/IntervalExcess.lean`).
- Two assignments of equal excess joined by cycle adjustments, and a residual update of nonzero excess
  verifying the excess-change formula (Tau Ceti's).
- A return-arrow correspondence on a network that has an arrow from sink to source as well, and a
  terminal problem whose minimum and maximum values are both negative (Tau Ceti's
  `TauCeti/Combinatorics/Network/ReturnArrow.lean` and `TauCeti/Combinatorics/Network/TerminalValues.lean`).
- Rational and real fractional circulations with their integer roundings and explicit floor and
  ceiling bounds (Tau Ceti's).
- A loop contributing one to indegree and two parallel edges with independently chosen heads.
- A prescription satisfying every internal-edge inequality but failing the total balance, so that no
  orientation realizes it.
- Feasible unequal lower and upper bounds, and examples of each of the two kinds of subset
  obstruction.
- Empty graphs and isolated vertices, including the forced indegree zero at an isolated vertex.

### Dependencies

Layer 8 uses Layer 1 (excess, residual updates, reversal), Layer 3 (max-flow and decomposition),
§§4.1–4.2 for §8.6, and Tau Ceti's circulation theory named above.

## Layer 9: Gomory–Hu cut trees

### 9.1 Cut trees and minimum-cut queries

For every linearly ordered cancellative additive commutative monoid `K`, every nonempty finite vertex
type and every symmetric submodular `f : Finset V → K`, there is a weighted tree on `V`, a
`SimpleGraph V` with weights `w : Sym2 V → K`, such that (1) for distinct `s, t` the minimum cut value
`λ(s, t)` is the least weight on the tree path between them, and (2) deleting a tree edge `{u, v}`
splits `V` along a minimum `u–v` cut whose value is the weight of the edge. This is the Gomory–Hu
theorem, `TauCeti.TerminalCut.exists_isCutTree`, for the structures
`TauCeti.TerminalCut.IsFlowEquivalentTree` (property 1) and `TauCeti.TerminalCut.IsCutTree`
(property 2), the side of a tree edge being `SimpleGraph.edgeSide`. Any edge of least weight on the
tree path from `s` to `t` gives a minimum `s–t` cut by deletion
(`TauCeti.TerminalCut.IsCutTree.isMinimum_edgeSide_of_mem_edges`). The *threshold partition*: deleting
the tree edges of weight below `k` leaves distinct `s, t` connected exactly when `λ(s, t) ≥ k`
(`TauCeti.TerminalCut.IsFlowEquivalentTree.reachable_deleteEdges_iff`), so the components are the
classes of the equivalence relation `s = t ∨ λ(s, t) ≥ k`, the equality being needed because
`λ(s, s) = 0`. Given a flow-equivalent tree, the values `λ(s, t)` with `s ≠ t` take at most `|V| − 1`
distinct values (`TauCeti.TerminalCut.IsFlowEquivalentTree.card_image_pairMinimumValue_le`), and the
side of an edge of least weight has value at most that of every set separating two vertices
(`TauCeti.TerminalCut.IsCutTree.apply_edgeSide_le`). Unique tree paths and their fundamental partitions
are Mathlib's `SimpleGraph.IsTree.existsUnique_path` and Tau Ceti's `SimpleGraph.edgeSide`
(`SimpleGraph.IsTree.not_crosses_edgeSide`). The construction is contraction-free, keeping
non-crossing minimum cuts and a tree on their cells, and uses only finiteness, symmetry and
submodularity, so it holds at the stated generality (Gusfield, *Very simple methods for all pairs
network flow analysis*; Korte–Vygen, *Combinatorial Optimization*, §8.6, for the witness repair).

The targets of this section (Schrijver, *Combinatorial Optimization*, Vol. A):

- **Instances.** The cut-tree theorem for weighted multigraphs and for pair-capacity networks, through
  the cut aggregation of §1.2; the tree is a `SimpleGraph` on `V(G)` and need not be a subgraph of the
  original graph.
- **Unit capacities.** With capacity one on each actual edge, parallel edges contributing their
  multiplicities, the tree answers the local edge-connectivity queries of §5.1, its threshold classes
  are the local `k`-edge reachability classes, and it recovers cuts as subsets of the original vertex
  set.
- **The global minimum cut.** With at least two vertices, the least value of `f(S)` over nonempty
  proper subsets `S` is the least tree-edge weight, attained by deleting any edge of least weight; for
  a finite graph with at least two actual vertices, `Graph.edgeConnectivity` is the least tree-edge
  weight of the unit-capacity tree.
- **The number of values.** For every symmetric submodular `f`, the values `λ(s, t)` over `s ≠ t` take
  at most `|V| − 1` distinct values, each being a tree-edge weight.
- **The weighted-tree API.** The least weight on a nonempty path, as a definition, and the transport
  of flow-equivalent trees and cut trees under vertex equivalences.

Disconnected graphs and zero capacities are included, with tree edges of weight zero, and a singleton
has the one-vertex tree. The general theorem and the recovery of minimum cuts use §4.1 and §4.3;
Layer 5 is needed only to read the unit-capacity queries as edge connectivity.

*Needs:* §1.2, §4.1, §4.3, §5.1 for the unit-capacity queries; Tau Ceti
`TauCeti.TerminalCut.exists_isCutTree`, `Graph.isSymmSubmodular_edgeCutCapacity`,
`TauCeti.isSymmSubmodular_pairCutCapacity`, `Graph.edgeReachability_eq_pairMinimumValue`.

**Checks.**
- On `Fin 4`, `f(S) = min (|S|, 4 − |S|)` is symmetric and submodular, a concave function of `|S|`,
  and every distinct pair has minimum cut value one. The unit-weight path `0, 1, 2, 3` has the right
  path minima, but deleting its middle edge gives `f({0, 1}) = 2`, not a minimum cut; the unit-weight
  star centred at `0` satisfies both properties. Checking only the path minima would accept the path.

### Examples

These are required proved examples of Layer 9.

- A disconnected weighted graph whose cut tree has edges of weight zero.
- On `Fin 4`, the function `f(S) = min (|S|, 4 − |S|)` of the Check above: symmetry and submodularity,
  the proof that no nonnegative real pair-capacity function on the same four vertices has this cut
  function after casting to `ℝ`, the pair values, the failing path and the star. Tau Ceti proves
  symmetry, the pair values, the path and the star; submodularity and the non-representability are
  targets. **Why:** the example separates numerical pairwise values from actual minimum-cut witnesses
  and exercises symmetric submodularity beyond graph cut capacities.

### Dependencies

Layer 9 uses §1.2, §4.1 and §4.3, Layer 5 for the unit-capacity queries, and Tau Ceti's cut trees
named above.

## Downstream consumers

- FreeGroupsAndLimitGroups uses §1.1: multigraph walks, native connectivity, component subgraphs and
  the component count.
- TemperleyLiebOperatorAlgebras uses §1.1: walks, component counts and the simple-graph bridge of
  edge-labelled graphs.
- NeronModelsAndSemistableAbelianVarieties uses §1.1 (component count), §1.3 (assignments and excess)
  and §8.1 (signed circulations and the excess fibres).

## Scope and ownership

**This roadmap owns** graph connectivity, components, separators, cuts, flows and the representation
bridges between `Graph`, `SimpleGraph`, orientations and networks. Roadmaps that need
`k`-vertex-connectivity for a fixed `k`, such as 3-connectivity in topological graph theory, use
`SimpleGraph.IsVertexConnected` and `Graph.IsVertexConnected` from here rather than a second
connectivity or component theory. Incidence counts, indegree and outdegree for orientations, the
bridge forest, `st`-numberings, the residual component poset of minimum cuts, and the matching and
edge-colouring API required by the bipartite targets are in scope; unrestricted multigraph degree or
colouring theory is not developed.

**In the library.** Much of the theory above is in the Tau Ceti library, named in each section and in
the supplier contracts: multigraph walks, isomorphisms, unions, the bidirected quiver and the
simple-graph walk bridge (§1.1); edge cuts, cut capacities and aggregation (§1.2); the excess
calculus, subnetworks, network isomorphisms, bound replacement, reversal and residual updates (§1.3);
vertex splitting, auxiliary terminals and change of coefficients (§1.4); the deletion predicates,
numerical invariants and incidence counts (§1.5); bridges, bonds, cut vertices, blocks and the bridge
forest (§§2.1–2.3, §2.5); weak duality, augmentation, decomposition, acyclic flows, max-flow/min-cut,
shortest augmentation, integrality and termination, capping, terminal-set and undirected flows,
nonnegative coefficients and mixed capacities (Layer 3); submodularity, the cut lattices, the residual
cuts, the non-crossing lemmas and the poset of minimum cuts (Layer 4); Menger's theorem in its
directed, multigraph, simple-graph and digraph local forms, with its predicate forms and the global
simple-graph form (§5.1); Whitney's inequalities, directed connectivity, the preservation lemmas, the
fan lemma and Dirac's theorem (§§6.1–6.6); ear decompositions as data and the bridge criterion for
2-edge-connectivity (§§7.1–7.2); the circulation theory of §§8.1–8.7 and the indegree theorems of
§8.8; and the Gomory–Hu theorem with its query and threshold theorems (§9.1). Mathlib supplies the
multigraph and simple-graph vocabulary, edge cuts, bridges and bonds, the simple-graph edge
connectivity predicates, quiver paths and strong connectivity, matchings, vertex covers, line graphs,
colourings and Hall's theorem.

**Owned elsewhere and consumed here.** The doubled quiver of a simple graph and its orientations,
`TauCeti.DoubledQuiver` and `TauCeti.DoubledQuiver.Orientation` with their quivers
`TauCeti.DoubledQuiver.OrientedQuiver`, belong to
[ZigzagPreprojective](../ZigzagPreprojective/README.md), Layer 0 (§0.2), with their algebraic
applications; this roadmap extends their connectivity and network API, and exposing their arrow
families as explicit quiver arguments is an adapter, not a second orientation type.

**Prior work.** The Lean Zulip discussion of max-flow/min-cut records earlier quiver-based work,
including the `maxflowmincutlean4` repository; it is a reference, not a dependency, and its code is
integrated only after coordinating with its authors, following the repository's porting policy.

**Outside the roadmap.**

- Adapters to the proposed `GraphLike.Walk` and `FlowNetwork` APIs of Mathlib.
- General matching theory beyond the bipartite targets, matchings with arbitrary profits, minimum-cost
  flows and circulations, edge-colouring of general graphs, and list edge-colouring.
- Dilworth's theorem, completion of partial orientations to strong orientations (mixed Robbins),
  Nash-Williams' orientation theorem for `2k`-edge-connected graphs, Edmonds' disjoint arborescences,
  and the Nash-Williams–Tutte theorems on disjoint spanning trees.
- Networks with infinite capacities, multicommodity flows, bounds on algorithmic complexity, and
  algorithms computing strongly connected components or enumerating cuts.
- Separate developments of infinite graph theory: Menger's theorem and other extremal results on
  infinitely many actual vertices, infinite rays and ends, infinite matching and edge-colouring,
  infinite ear decompositions, and edge-counting or flow theories with infinite edge sets. For context,
  Mathlib's `Order.KonigLemma`, `Combinatorics.Hall.Basic` and `Combinatorics.SimpleGraph.Ends.Properties` and Tau
  Ceti's `TauCeti.Topology.Compactness.InverseSystem` connect finite constructions to compactness,
  infinite matchings and graph ends.
- General graph contractions, contractible-edge and wheel theorems, treewidth, drawings, planar
  embeddings and surface topology.

## Exact supplier contracts

### From Mathlib

- Multigraphs: `Graph` with `Graph.IsLink`, `Graph.Inc`, `Graph.Adj`, `Graph.incidenceSet`,
  `Graph.loopSet`, `Graph.Loopless`, `Graph.Simple`, subgraphs, induced subgraphs and deletion; the
  conversions `Graph.toSimpleGraph`, `Graph.ofSimpleGraph` and `Graph.toSimpleGraphOfSimpleGraphIso`;
  edge cuts and bridges `Graph.edgeCut`, `Graph.IsEdgeCut`, `Graph.IsBridge`, `Graph.IsBond`,
  `Graph.isBond_singleton_iff_isBridge`, `Graph.edgeCut_vertexSet_diff`,
  `Graph.IsSubgraph.edgeCut_eq_inter`, `Graph.IsBond.of_isClosedSubgraph`, assumed as stated in
  `Mathlib/Combinatorics/Graph/`.
- Simple graphs: `SimpleGraph.Walk`, `SimpleGraph.Reachable`, `SimpleGraph.ConnectedComponent`,
  `SimpleGraph.IsAcyclic`, `SimpleGraph.IsTree`, `SimpleGraph.IsTree.existsUnique_path`,
  `SimpleGraph.IsBridge` with `SimpleGraph.isBridge_iff_forall_cycle_notMem` (for an edge, a bridge
  lies on no cycle) and `SimpleGraph.isAcyclic_iff_forall_isBridge`; `SimpleGraph.IsEdgeReachable` and
  `SimpleGraph.IsEdgeConnected` with thresholds in `ℕ∞`, `SimpleGraph.IsEdgeReachable.mono`,
  `SimpleGraph.IsEdgeReachable.anti`, `SimpleGraph.isEdgeReachable_one`,
  `SimpleGraph.IsEdgeReachable.trans` and `SimpleGraph.isEdgeConnected_two_iff_forall_not_isBridge`
  (2-edge-connected exactly when no bridge); `SimpleGraph.minDegree`; `SimpleGraph.IsBipartiteWith`,
  `SimpleGraph.Subgraph.IsMatching`, `SimpleGraph.Subgraph.IsPerfectMatching`,
  `SimpleGraph.IsVertexCover`, `SimpleGraph.IsRegularOfDegree`, `SimpleGraph.lineGraph`,
  `SimpleGraph.Coloring`; Hall's theorem `SimpleGraph.exists_isMatching_of_forall_ncard_le` (a
  bipartite locally finite graph satisfying Hall's condition on one side has a matching saturating it)
  and `Finset.all_card_le_biUnion_card_iff_existsInjective'` (Hall's theorem for finite families).
- Directed structure: `Digraph` with `Digraph.toSimpleGraphInclusive`; `Quiver.Path`,
  `Quiver.IsStronglyConnected` (every vertex has a path to every vertex, vacuous on the empty type) and
  `Quiver.StronglyConnectedComponent`.
- Order and algebra: `Nonneg` with `Nonneg.coeAddMonoidHom`, `AddSubgroup.zmultiples`, `UpperSet`,
  `FloorRing`, the ordered-group classes `IsOrderedAddMonoid` and `IsOrderedCancelAddMonoid`.

### From Tau Ceti

Paths are under `TauCeti/Combinatorics/` unless stated otherwise; every declaration is assumed as
stated in its file and as described in the section that uses it.

- Multigraph walks and bridges to other representations (`Graph/Connectivity/Walk/`, `Graph/Union.lean`,
  `Graph/Isomorphism.lean`, `Graph/Delete.lean`): `Graph.Walk` and its API named in §1.1,
  `Graph.Reachable`, `Graph.walkGraph`, `Graph.Iso`, `Graph.Compatible.union`,
  `Graph.IsSubgraph.union_le`, `Graph.BidirectedHom`, `Graph.Walk.bidirectedEquiv`,
  `SimpleGraph.walkEquivOfSimpleGraph`, `SimpleGraph.Walk.toGraph`, `Graph.toSimpleGraph_reachable_iff`,
  `Graph.toSimpleGraphDeleteVertsIso`.
- Components (`Graph/Connectivity/Component.lean`): `Graph.IsConnectedComponentOf`, `Graph.Connected`,
  `Graph.connectedComponentEquiv`, `Graph.componentCount` and the count lemmas of §1.1.
- Orientations and digraphs (`Graph/Orientation/`, `Digraph/`): `Graph.Orientation`,
  `Graph.Orientation.Hom`, `Graph.Orientation.walkEquiv`, `Graph.Orientation.indegree`,
  `Graph.Orientation.outdegree`, `Digraph.AdjHom` and the digraph correspondences of §1.1.
- Simple-graph orientations (`TauCeti/RepresentationTheory/Quiver/Zigzag/Orientation.lean`, owned by
  ZigzagPreprojective §0.2): `TauCeti.DoubledQuiver`, `TauCeti.DoubledQuiver.Orientation`,
  `TauCeti.DoubledQuiver.OrientedQuiver`, `TauCeti.DoubledQuiver.Orientation.ofLinearOrder` and
  `TauCeti.DoubledQuiver.OrientedQuiver.isAcyclic_ofLinearOrder` (the orientation of a linear order is
  acyclic).
- Cuts and connectivity of multigraphs (`Graph/Connectivity/`, `Graph/Incidence.lean`):
  `Graph.edgeCutCapacity`, `Graph.pairCapacity`, `Graph.pairCutCapacity_pairCapacity`,
  `Graph.isSymmSubmodular_edgeCutCapacity`, `Graph.IsEdgeReachable`, `Graph.IsEdgeConnected`,
  `Graph.edgeReachability`, `Graph.edgeConnectivity`, `Graph.IsVertexReachable`,
  `Graph.IsVertexConnected`, `Graph.vertexConnectivity`, `Graph.nonloopIncidenceCount`,
  `Graph.incidenceCount`, `Graph.internalEdges`, `Graph.incidentEdges`, and the lemmas of §1.2 and §1.5.
- Bridges, bonds, cut vertices and blocks (`Graph/Connectivity/Bridge/`, `Graph/Connectivity/Bond.lean`,
  `Graph/Connectivity/CutVertex.lean`, `SimpleGraph/Connectivity/`): `Graph.isBridge_iff_forall_cycle_notMem`,
  `Graph.IsForest`, `Graph.Connected.isBond_edgeCut_iff`, `Graph.IsCutVertex`,
  `SimpleGraph.IsCutVertex`, `SimpleGraph.IsBlock` with the block lemmas of §2.3,
  `Graph.bridgeForest` with the lemmas of §2.5, and `TauCeti.IsTree.neighborSetEquivConnectedComponentCompl`
  (`SimpleGraph/BranchComponents.lean`: the components left after deleting a tree vertex correspond to
  its neighbours).
- Simple-graph connectivity (`SimpleGraph/Connectivity/`): `SimpleGraph.IsVertexReachable`,
  `SimpleGraph.IsVertexConnected` (more than `k` vertices, any two `k`-vertex-reachable),
  `SimpleGraph.vertexConnectivity`, `SimpleGraph.edgeConnectivity`, `SimpleGraph.isVertexConnected_two_iff`,
  the Menger theorems, the Whitney inequalities, the preservation lemmas, `SimpleGraph.IsVertexConnected.exists_fan`,
  `SimpleGraph.IsVertexConnected.exists_isCycle_forall_mem_support`, `SimpleGraph.edgeSide` and
  `SimpleGraph.isBlock_and_three_le_encard_iff_maximal_isVertexConnected_two`.
- Ear decompositions (`Graph/Connectivity/Ear/Basic.lean`): `Graph.Ear`, `Graph.EarStart`,
  `Graph.EarDecomposition` with `Graph.EarDecomposition.IsOpen`, `Graph.EarDecomposition.initial`,
  `Graph.EarDecomposition.prefix` and `Graph.EarDecomposition.prefix_induction`; and
  `Graph.isEdgeConnected_two_iff_forall_reachable_and_forall_not_isBridge`
  (`Graph/Connectivity/EdgeConnectivity.lean`).
- Networks (`Network/`): `TauCeti.Network`, `TauCeti.Network.ofCapacity`, `TauCeti.Assignment`,
  `TauCeti.excessAt`, `TauCeti.excessHom`, `TauCeti.arrowSum`, `TauCeti.cutBound`,
  `TauCeti.IsCirculation`, `TauCeti.ArrowWalk`, `TauCeti.ReachableWithout`, `TauCeti.ReachableAvoiding`,
  `TauCeti.Network.Subnetwork`, `TauCeti.Network.Iso`, `TauCeti.Network.replaceBounds`,
  `TauCeti.Network.reorient`, `TauCeti.ResidualHom`, `TauCeti.residualCapacity`,
  `TauCeti.residualUpdate`, `TauCeti.residualDifference`, `TauCeti.PositiveHom`,
  `TauCeti.PositiveReachable`, `TauCeti.SplitHom`, `TauCeti.AuxTerminalHom`, `TauCeti.Network.map`, with
  the lemmas of §§1.3–1.4.
- Flows (`Network/`): `TauCeti.BoundedFlow`, `TauCeti.Flow`, `TauCeti.Flow.exists_val_eq_arrowSum`
  (max-flow/min-cut for nonnegative capacities and distinct terminals), `TauCeti.Flow.tfae_isMaximum`,
  `TauCeti.Flow.exists_isMaximum_mem`, `TauCeti.BoundedFlow.wellFounded_shortestAugmentationStep`,
  `TauCeti.exists_pathCycleDecomposition`, `TauCeti.Flow.exists_isAcyclic`,
  `TauCeti.Flow.acc_augmentsTo`, `TauCeti.isMinimum_arrowSum_inf_iff`, `TauCeti.SetFlow`,
  `Graph.exists_flow_val_eq_edgeCutCapacity`, `TauCeti.NonnegFlow`, `TauCeti.NatFlow`,
  `TauCeti.Flow.exists_respectsVertexCapacity_val_eq_mem`, with the lemmas of Layer 3.
- Minimum cuts (`TauCeti/Order/Lattice/Submodular.lean`, `TauCeti/Data/Finset/Laminar.lean`,
  `Network/MinimumCut/`, `Network/CutSubmodular.lean`): `TauCeti.IsSubmodular`,
  `TauCeti.IsSymmSubmodular`, `TauCeti.TerminalCut.IsAdmissible`, `TauCeti.TerminalCut.IsMinimum`,
  `TauCeti.TerminalCut.minimizers`, `TauCeti.TerminalCut.smallest`, `TauCeti.TerminalCut.largest`,
  `TauCeti.TerminalCut.pairMinimumValue`, `TauCeti.isSubmodular_cutBound`,
  `TauCeti.BoundedFlow.IsMaximum.isMinimum_cutBound_iff`,
  `TauCeti.TerminalCut.IsMinimum.exists_isMinimum_subset`,
  `TauCeti.TerminalCut.exists_isMinimum_forall_not_crosses`, `Finset.Crosses`,
  `Finset.NestedOrDisjoint`, `TauCeti.BoundedFlow.IsMaximum.minimizersOrderIso`, with the lemmas of
  Layer 4.
- Menger (`Network/Menger/`, `Graph/Connectivity/Menger/`, `SimpleGraph/Connectivity/Menger.lean`,
  `Digraph/Menger.lean`, `Network/Connectivity.lean`): the theorems named in §5.1 and §6.2, including
  `TauCeti.exists_paths_vertexSeparator_card_eq` (local vertex Menger for networks with finitely many
  vertices and no arrow `s → t`), `Graph.exists_paths_edgeSeparator_card_eq`,
  `SimpleGraph.isVertexConnected_iff_forall_exists_paths`, `Graph.isEdgeReachable_iff_le_pairMinimumValue`,
  `TauCeti.IsArcReachable`, `TauCeti.IsArcStrong`, `TauCeti.IsVertexStrong`, `TauCeti.arcConnectivity`
  and `TauCeti.vertexStrongConnectivity`.
- Circulations and orientations (`Network/Hoffman.lean`, `Network/Shift.lean`,
  `Network/IntervalExcess.lean`, `Network/CycleAdjustment.lean`, `Network/ReturnArrow.lean`,
  `Network/TerminalValues.lean`, `Network/Rounding.lean`, `Graph/Orientation/Hakimi.lean`):
  `TauCeti.ExcessFlow`, `TauCeti.ExcessIntervalFlow`, `TauCeti.exists_isCirculation_iff` (Hoffman's
  theorem), `TauCeti.ExcessFlow.nonempty_iff`, `TauCeti.ExcessIntervalFlow.nonempty_iff`,
  `TauCeti.ExcessFlow.shiftEquiv`, `TauCeti.BoundedFlow.returnEquiv`,
  `TauCeti.BoundedFlow.range_val_eq_Icc`, `TauCeti.exists_integerRounding`,
  `Graph.exists_orientation_indegree_eq_iff` (Hakimi's theorem),
  `Graph.exists_orientation_indegree_mem_Icc_iff` and `Graph.orientationEndpointEquiv`, with the lemmas of
  Layer 8.
- Cut trees (`Network/MinimumCut/CutTree.lean`, `Network/MinimumCut/GomoryHu.lean`):
  `TauCeti.TerminalCut.IsFlowEquivalentTree`, `TauCeti.TerminalCut.IsCutTree`,
  `TauCeti.TerminalCut.exists_isCutTree` (the Gomory–Hu theorem for symmetric submodular functions over
  a linearly ordered cancellative monoid on a nonempty finite type), with the lemmas of §9.1.
- Supporting modules for examples and constructions: `SimpleGraph/Acyclic.lean`,
  `SimpleGraph/PathGraph.lean`, `SimpleGraph/Connected.lean`, `SimpleGraph/CycleGraph.lean`,
  `SimpleGraph/Sum.lean`, `Quiver/BoundedPaths.lean` (finitely many paths of bounded length),
  `Quiver/Prefunctor.lean` and `Quiver/Reorient.lean`, and
  `TauCeti.IsTree.exists_equiv_pathGraph_components`.

### From TauCetiRoadmap.ZigzagPreprojective

- §0.2: the doubled quiver of a simple graph and its orientations, as listed under From Tau Ceti;
  this roadmap uses them as stated there.

## References

- Reinhard Diestel, *Graph Theory*, §1.9 and Chapter 3, for bonds, connectivity, Menger, blocks, fans
  and ears; see the [author's book site](https://diestel-graph-theory.com/).
- Dimitri P. Bertsekas, [*Linear Network Optimization*](https://www.mit.edu/~dimitrib/LNets_Full_Book.pdf),
  §1.1.3 and Exercises 2.4–2.6 of §1.2, for bound transformations, feasibility and rounding.
- Alexander Schrijver, *Combinatorial Optimization: Polyhedra and Efficiency*, Volume A, for flows,
  cuts, disjoint paths, circulations and cut trees; see the
  [author's book page](https://homepages.cwi.nl/~lex/co/).
- Bernhard Korte and Jens Vygen, *Combinatorial Optimization: Theory and Algorithms*, Section 8.6, for
  the Gomory–Hu construction and the witness-repair step of its correctness proof.
- Jørgen Bang-Jensen and Gregory Gutin, *Digraphs: Theory, Algorithms and Applications*, for directed
  connectivity, directed ears and network flows; see the
  [second edition](https://doi.org/10.1007/978-1-84800-998-1).
- Dan Gusfield, [*Very Simple Methods for All Pairs Network Flow Analysis*](https://doi.org/10.1137/0219009),
  SIAM Journal on Computing 19 (1990), 143–155, for the contraction-free cut-tree construction.
- Jean-Claude Picard and Maurice Queyranne,
  [*On the structure of all minimum cuts in a network and applications*](https://publications.polymtl.ca/5993/),
  for the residual reachability order and its description of every minimum cut.
- Shimon Even and Robert Endre Tarjan, [*Computing an st-numbering*](https://doi.org/10.1016/0304-3975(76)90086-4),
  for `st`-numberings and their relation to acyclic orientations; only the existence and structural
  consequences are targets here.
- András Frank and András Gyárfás,
  [*How to orient the edges of a graph?*](https://www.renyi.hu/~gyarfas/Cikkek/09_FrankGyarfas_HowToOrientTheEdgesOfAGraph.pdf),
  for orientation degree bounds; loops in §8.8 contribute forced units at their vertices.
- The [Lean Zulip discussion of max-flow/min-cut](https://leanprover-community.github.io/archive/stream/252551-graph-theory/topic/max-flow.20min-cut.20help.html),
  recording earlier quiver-based formalization work, including
  [maxflowmincutlean4](https://gitlab.com/Shreyas941/maxflowmincutlean4).
- Mathlib documentation: [`Graph.edgeCut`, `Graph.IsEdgeCut`, `Graph.IsBridge` and `Graph.IsBond`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Combinatorics/Graph/Connected/EdgeCut.html);
  [`SimpleGraph.IsEdgeConnected`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Combinatorics/SimpleGraph/Connectivity/EdgeConnectivity.html#SimpleGraph.IsEdgeConnected);
  [`SimpleGraph.IsBridge`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Combinatorics/SimpleGraph/Connectivity/Connected.html#SimpleGraph.IsBridge);
  [`SimpleGraph.minDegree`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Combinatorics/SimpleGraph/Finite.html#SimpleGraph.minDegree);
  the [`Graph`–`SimpleGraph` conversions](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Combinatorics/Graph/Simple.html);
  [graph versions of Hall's theorem](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Combinatorics/SimpleGraph/Hall.html);
  the [finite-family Hall theorem](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Combinatorics/Hall/Finite.html);
  [`Quiver.Path`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Combinatorics/Quiver/Path.html#Quiver.Path);
  [`Quiver.IsStronglyConnected`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Combinatorics/Quiver/ConnectedComponent.html#Quiver.IsStronglyConnected);
  [`Quiver.StronglyConnectedComponent`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Combinatorics/Quiver/ConnectedComponent.html#Quiver.StronglyConnectedComponent);
  [`Nonneg`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Algebra/Order/Nonneg/Basic.html#Nonneg);
  [`FloorRing`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Algebra/Order/Floor/Defs.html#FloorRing);
  [`Order.KonigLemma`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Order/KonigLemma.html),
  [`Combinatorics.Hall.Basic`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Combinatorics/Hall/Basic.html)
  and [`Combinatorics.SimpleGraph.Ends.Properties`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Combinatorics/SimpleGraph/Ends/Properties.html).
- Mathlib's [`SimpleGraph.isEdgeConnected_two_iff_forall_not_isBridge`](https://github.com/leanprover-community/mathlib4/blob/bbeef91203015d10f6aaa3154121ef827e06eee8/Mathlib/Combinatorics/SimpleGraph/Connectivity/EdgeConnectivity.lean#L161).
- Tau Ceti modules: [`DoubledQuiver`](https://github.com/TauCetiProject/TauCeti/blob/main/TauCeti/RepresentationTheory/Quiver/Zigzag/Basic.lean),
  [`DoubledQuiver.Orientation` and `OrientedQuiver`](https://github.com/TauCetiProject/TauCeti/blob/main/TauCeti/RepresentationTheory/Quiver/Zigzag/Orientation.lean),
  [`Combinatorics.SimpleGraph.BranchComponents`](https://github.com/TauCetiProject/TauCeti/blob/main/TauCeti/Combinatorics/SimpleGraph/BranchComponents.lean),
  [`Combinatorics.SimpleGraph.Acyclic`](https://github.com/TauCetiProject/TauCeti/blob/main/TauCeti/Combinatorics/SimpleGraph/Acyclic.lean),
  [`PathGraph`](https://github.com/TauCetiProject/TauCeti/blob/main/TauCeti/Combinatorics/SimpleGraph/PathGraph.lean),
  [`Connected`](https://github.com/TauCetiProject/TauCeti/blob/main/TauCeti/Combinatorics/SimpleGraph/Connected.lean),
  [`CycleGraph`](https://github.com/TauCetiProject/TauCeti/blob/main/TauCeti/Combinatorics/SimpleGraph/CycleGraph.lean),
  [`Sum`](https://github.com/TauCetiProject/TauCeti/blob/main/TauCeti/Combinatorics/SimpleGraph/Sum.lean),
  [`Combinatorics.Quiver.BoundedPaths`](https://github.com/TauCetiProject/TauCeti/blob/main/TauCeti/Combinatorics/Quiver/BoundedPaths.lean),
  [`Combinatorics.Quiver.Prefunctor`](https://github.com/TauCetiProject/TauCeti/blob/main/TauCeti/Combinatorics/Quiver/Prefunctor.lean),
  [`Combinatorics.Quiver.Reorient`](https://github.com/TauCetiProject/TauCeti/blob/main/TauCeti/Combinatorics/Quiver/Reorient.lean),
  [`Topology.Compactness.InverseSystem`](https://github.com/TauCetiProject/TauCeti/blob/main/TauCeti/Topology/Compactness/InverseSystem.lean).

### Interface design references

These Mathlib proposals and their review discussions are references for interface design and
coordination; each entry names the part relevant here, and the conventions and sections specify the
required interfaces and their scope.

- [#33355: vertex connectivity](https://github.com/leanprover-community/mathlib4/pull/33355):
  deletion-based `IsVertexReachable`, `IsVertexPreconnected` and `IsVertexConnected`.
- [#42494: numerical edge connectivity](https://github.com/leanprover-community/mathlib4/pull/42494):
  `edgeReachability`, `edgeConnectivity`, their supremum definitions and degree bounds.
- [#36756: shared walks](https://github.com/leanprover-community/mathlib4/pull/36756) and
  [#39053: the `Graph` instance](https://github.com/leanprover-community/mathlib4/pull/39053):
  `GraphLike.Walk` with vertex support and darts, following the
  [HasAdj discussion](https://leanprover.zulipchat.com/#narrow/channel/252551-graph-theory/topic/HasAdj/with/575843445).
  These proposals rest on the `GraphLike` hierarchy of
  [#36743](https://github.com/leanprover-community/mathlib4/pull/36743). The
  [dart construction in #39053](https://github.com/leanprover-community/mathlib4/blob/455aa1d6e5c7215f1270da70e328056af9607545/Mathlib/Combinatorics/Graph/GraphLike.lean#L22)
  splits every loop into a forward and a backward dart, so a graph with one vertex and one loop has two
  walks of length one there; the
  [loop-dart discussion](https://github.com/leanprover-community/mathlib4/pull/36743#discussion_r3191440123)
  records the trade-off. This roadmap uses edge-labelled inductive walks with the API of
  `SimpleGraph.Walk` and records a loop traversal once, as the
  [`WList` walks](https://github.com/apnelson1/Matroid/tree/main/Matroid/Graph/WList) of the library
  that `Graph` originates from do; §1.1 connects them to `SimpleGraph.Walk` and `Quiver.Path`. A map
  forgetting loop directions identifies the two dart walks of a loop with the single walk here; no
  target depends on the direction of a loop. The general `GraphLike` hierarchy is outside the roadmap.
- [#43017: network flows](https://github.com/leanprover-community/mathlib4/pull/43017): quivers with
  capacities and flow assignments indexed by arrows; arrow indexing keeps parallel edges, and this
  roadmap develops finite sums over general coefficients, with the nonnegative interfaces of §3.4.
- [#34028: weak max-flow/min-cut duality](https://github.com/leanprover-community/mathlib4/pull/34028):
  an undirected flow formulation on simple graphs; undirected flows here use the bidirected network,
  with no separate undirected flow type, so only the statement shapes are taken (§3.3).
- [#33032: Kőnig's theorem](https://github.com/leanprover-community/mathlib4/pull/33032): matchings as
  subgraphs, vertex covers, and the equality of the sizes of maximum matchings and minimum covers.
- [#33313: edge colourings](https://github.com/leanprover-community/mathlib4/pull/33313):
  `SimpleGraph.EdgeColoring`, `EdgeColorable` and `chromaticIndex`, using colourings of the line graph;
  §6.9 supplies the bipartite theorem and the transport from multigraph edge identities. See also the
  related [#43128](https://github.com/leanprover-community/mathlib4/pull/43128). The
  [edge-colouring discussion](https://leanprover-community.github.io/archive/stream/252551-graph-theory/topic/edge.20coloring.html)
  records earlier work; the porting policy applies before reusing it.
- [#37861: connected `Graph`s](https://github.com/leanprover-community/mathlib4/pull/37861):
  connectivity of Mathlib's multigraphs through connected components as subgraphs, defined without
  walks; §1.1 relates it to walk reachability.
- [#38337: unions of `Graph`s](https://github.com/leanprover-community/mathlib4/pull/38337): compatible
  unions, used when adding ears; §1.1 uses the least-upper-bound interface for compatible graphs, and
  the proposal's choice of incidence for conflicting edge identities is outside the roadmap.
