<!--tauceti-status:v1 {"roadmap":"GraphConnectivityAndFlows","to_sha":"1b19ebb4ca6fab1281fb00c21dee68df6ff21243","ts":"2026-11-11T12:36:39Z"}-->
# Status: GraphConnectivityAndFlows

This file documents the status of the GraphConnectivityAndFlows roadmap up until `1b19ebb` (2026-11-11T12:36:39Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Every summit the roadmap names is now proved: max-flow/min-cut, the poset of minimum cuts, Menger's theorem, Hoffman's circulation theorem, Hakimi's orientation theorem, Gomory–Hu cut trees, the block–cut forest, the three ear characterizations, Robbins' theorem, `st`-numberings, capacitated Hall and Kőnig's edge-colouring theorem. What is left is interface work around the ear decompositions and a few required examples.

### Named results

- **The max-flow/min-cut theorem** — for nonnegative capacities some flow's value equals some cut's capacity, over any linearly ordered additive group and with integrality in any subgroup containing the capacities ([`TauCeti.Flow.exists_val_eq_arrowSum`](https://taucetiproject.org/docs/TauCeti/Combinatorics/Network/ShortestAugmentation.html#TauCeti.Flow.exists_val_eq_arrowSum)), with undirected versions for weighted multigraphs and simple graphs.
- **Menger's theorem** — the maximum number of internally disjoint paths between two nonadjacent vertices equals the minimum size of a separating vertex set ([`SimpleGraph.exists_paths_vertexSeparator_card_eq`](https://taucetiproject.org/docs/TauCeti/Combinatorics/SimpleGraph/Connectivity/Menger.html#SimpleGraph.exists_paths_vertexSeparator_card_eq)), in arrow-disjoint, edge-disjoint, set-to-set and capacitated forms, and globally for `k`-connected multigraphs ([`Graph.isVertexConnected_iff_forall_exists_paths`](https://taucetiproject.org/docs/TauCeti/Combinatorics/Graph/Connectivity/Menger/Vertex.html#Graph.isVertexConnected_iff_forall_exists_paths)).
- **The Gomory–Hu theorem** — every symmetric submodular set function on a nonempty finite type has a cut tree whose path minima give all pairwise minimum cut values ([`TauCeti.TerminalCut.exists_isCutTree`](https://taucetiproject.org/docs/TauCeti/Combinatorics/Network/MinimumCut/GomoryHu.html#TauCeti.TerminalCut.exists_isCutTree)).
- **Robbins' theorem** — a multigraph with finitely many edges has a strongly connected orientation exactly when it is 2-edge-connected, proved by orienting a directed ear decomposition ([`Graph.exists_stronglyConnected_orientation_iff`](https://taucetiproject.org/docs/TauCeti/Combinatorics/Graph/Orientation/StronglyConnected.html#Graph.exists_stronglyConnected_orientation_iff)).
- **Kőnig's edge-colouring theorem** — a finite bipartite multigraph has a proper `k`-edge-colouring exactly when no vertex meets more than `k` edges, so its chromatic index is its maximum degree ([`Graph.IsBipartition.nonempty_edgeColoring_iff_forall_incidenceCount_le`](https://taucetiproject.org/docs/TauCeti/Combinatorics/Graph/Matching/EdgeColoring.html#Graph.IsBipartition.nonempty_edgeColoring_iff_forall_incidenceCount_le)).

### Notable definitions and infrastructure

- **Residual updates** ([`TauCeti.residualUpdate`](https://taucetiproject.org/docs/TauCeti/Combinatorics/Network/Residual.html#TauCeti.residualUpdate)): one operation updating any feasible assignment along residual arrows, which augmentation, the minimum-cut theory and the circulation adjustments all specialise.
- **Multigraph orientations** ([`Graph.Orientation`](https://taucetiproject.org/docs/TauCeti/Combinatorics/Graph/Orientation/Basic.html#Graph.Orientation)): they carry the directed theory over to undirected graphs, giving undirected max-flow/min-cut, the indegree theorems and Robbins' theorem.
- **Ear decompositions** ([`Graph.EarDecomposition`](https://taucetiproject.org/docs/TauCeti/Combinatorics/Graph/Connectivity/Ear/Basic.html#Graph.EarDecomposition), [`TauCeti.Network.EarDecomposition`](https://taucetiproject.org/docs/TauCeti/Combinatorics/Network/Ear/Basic.html#TauCeti.Network.EarDecomposition)): ears as data, with prefix and induction API, now characterizing 2-vertex-, 2-edge- and strong connectivity and feeding Robbins' theorem and `st`-numberings.

### Roadmap coverage

The roadmap has no machine-tracked layers; by its nine milestones, **Milestones 2, 3, 4, 5, 8 and 9** have all their main theorems; for Milestone 2 that now includes multigraph blocks and the block–cut forest with its path correspondence and component-count formula. **Milestone 1** shows no evident gap. **Milestone 6** has its main theorems throughout: the common-cycle and block characterizations of 2-connectivity, capacitated Kőnig–Ore and Hall with ordinary Hall and deficiency, regular bipartite decomposition, regular completion and edge-colouring; the required edge-colouring examples (parallel edges, an irregular completion, an isolated vertex) were not found among the examples. **Milestone 7** is done except for interfaces: the open-ear characterization with prescribed cycle, the multigraph 2-edge-connected and directed characterizations, Robbins' theorem in all its forms and the Lempel–Even–Cederbaum theorem on `st`-numberings are proved, but the simple-graph form of the 2-edge-connected characterization, the transport of ear decompositions between multigraphs and simple graphs, and the `Digraph` ear corollary were not found.

## The frontier

- **Ear-decomposition transport (7.1–7.2).** Carry ear decompositions of `Graph.ofSimpleGraph H` to and from the `SimpleGraph` interface, and derive from it the simple-graph 2-edge-connected ear characterization; the multigraph theorem and the simple-graph open-ear theory both exist.
- **The `Digraph` ear corollary (7.2).** State the directed ear characterization for `Digraph` through the adapter; the directed-cycle characterization of strong connectivity for digraphs is already there.
- **Edge-colouring examples (6.9).** The `k` parallel edges needing `k` colours, an irregular graph with its regular completion and restricted colouring, and the edgeless and isolated-vertex cases with zero colours.
