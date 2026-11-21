<!--tauceti-status:v1 {"roadmap":"GraphConnectivityAndFlows","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e","ts":"2026-11-19T18:22:01+11:00"}-->
# Status: GraphConnectivityAndFlows

This file documents the status of the GraphConnectivityAndFlows roadmap up until `b235000` (2026-11-19T18:22:01+11:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Every summit the roadmap names is proved: max-flow/min-cut, the poset of minimum cuts, Menger's theorem, Hoffman's circulation theorem, Hakimi's orientation theorem, Gomory–Hu cut trees, the block–cut forest, the three ear characterizations, Robbins' theorem, `st`-numberings, capacitated Hall and Kőnig's edge-colouring theorem. The remaining ear-decomposition interfaces and edge-colouring examples have now landed too, and no gap against the README is evident.

### Named results

- **The max-flow/min-cut theorem** — for nonnegative capacities, some flow's value equals some cut's capacity. This holds over any linearly ordered additive group, with integrality in any subgroup containing the capacities ([`TauCeti.Flow.exists_val_eq_arrowSum`](https://taucetiproject.org/docs/TauCeti/Combinatorics/Network/ShortestAugmentation.html#TauCeti.Flow.exists_val_eq_arrowSum)), and there are undirected and set-to-set versions.
- **Menger's theorem** — the maximum number of internally disjoint paths between two nonadjacent vertices equals the minimum size of a separating vertex set ([`SimpleGraph.exists_paths_vertexSeparator_card_eq`](https://taucetiproject.org/docs/TauCeti/Combinatorics/SimpleGraph/Connectivity/Menger.html#SimpleGraph.exists_paths_vertexSeparator_card_eq)). It is also proved in arrow-disjoint, edge-disjoint, set-to-set and capacitated forms, and globally for `k`-connected multigraphs ([`Graph.isVertexConnected_iff_forall_exists_paths`](https://taucetiproject.org/docs/TauCeti/Combinatorics/Graph/Connectivity/Menger/Vertex.html#Graph.isVertexConnected_iff_forall_exists_paths)).
- **The Gomory–Hu theorem** — every symmetric submodular set function on a nonempty finite type has a cut tree whose path minima give all pairwise minimum cut values ([`TauCeti.TerminalCut.exists_isCutTree`](https://taucetiproject.org/docs/TauCeti/Combinatorics/Network/MinimumCut/GomoryHu.html#TauCeti.TerminalCut.exists_isCutTree)).
- **Robbins' theorem** — a multigraph with finitely many edges has a strongly connected orientation exactly when it is 2-edge-connected, proved by orienting a directed ear decomposition ([`Graph.exists_stronglyConnected_orientation_iff`](https://taucetiproject.org/docs/TauCeti/Combinatorics/Graph/Orientation/StronglyConnected.html#Graph.exists_stronglyConnected_orientation_iff)).
- **Kőnig's edge-colouring theorem** — a finite bipartite multigraph has a proper `k`-edge-colouring exactly when no vertex meets more than `k` edges ([`Graph.IsBipartition.nonempty_edgeColoring_iff_forall_incidenceCount_le`](https://taucetiproject.org/docs/TauCeti/Combinatorics/Graph/Matching/EdgeColoring.html#Graph.IsBipartition.nonempty_edgeColoring_iff_forall_incidenceCount_le)). For simple graphs this says that the chromatic index is the maximum degree ([`SimpleGraph.IsBipartite.chromaticIndex_eq_maxDegree`](https://taucetiproject.org/docs/TauCeti/Combinatorics/Graph/Matching/EdgeColoring.html#SimpleGraph.IsBipartite.chromaticIndex_eq_maxDegree)).

### Notable definitions and infrastructure

- **Residual updates** ([`TauCeti.residualUpdate`](https://taucetiproject.org/docs/TauCeti/Combinatorics/Network/Residual.html#TauCeti.residualUpdate)): a single operation that updates any feasible assignment along residual arrows. Augmentation, the minimum-cut theory and the circulation adjustments are all special cases.
- **Multigraph orientations** ([`Graph.Orientation`](https://taucetiproject.org/docs/TauCeti/Combinatorics/Graph/Orientation/Basic.html#Graph.Orientation)): these carry the directed theory over to undirected graphs, giving undirected max-flow/min-cut, the indegree theorems and Robbins' theorem.
- **Ear decompositions as data** ([`Graph.EarDecomposition`](https://taucetiproject.org/docs/TauCeti/Combinatorics/Graph/Connectivity/Ear/Basic.html#Graph.EarDecomposition), [`TauCeti.Network.EarDecomposition`](https://taucetiproject.org/docs/TauCeti/Combinatorics/Network/Ear/Basic.html#TauCeti.Network.EarDecomposition)): ears are recorded with prefix and induction API. They now move between multigraphs and simple graphs ([`Graph.EarDecomposition.toSimpleGraph`](https://taucetiproject.org/docs/TauCeti/Combinatorics/Graph/Connectivity/Ear/OfSimpleGraph.html#Graph.EarDecomposition.toSimpleGraph)) and are available for Mathlib's `Digraph`.

### Roadmap coverage

The roadmap has no machine-tracked layers. Measured against its nine milestones, **Milestones 2 through 9** have all their main theorems and **Milestone 1** shows no evident gap. Milestone 6 now includes the simple-graph form of Kőnig's edge-colouring theorem and the required edge-colouring examples: parallel edges, an irregular graph with its regular completion, and the isolated-vertex and empty cases. Milestone 7 now includes ear transport between `Graph.ofSimpleGraph H` and `SimpleGraph`, the simple-graph 2-edge-connected ear characterization ([`SimpleGraph.isEdgeConnected_two_iff_exists_earDecomposition_initial_eq_singletonSubgraph`](https://taucetiproject.org/docs/TauCeti/Combinatorics/SimpleGraph/Connectivity/Ear/EdgeConnected.html#SimpleGraph.isEdgeConnected_two_iff_exists_earDecomposition_initial_eq_singletonSubgraph)) and the `Digraph` ear corollary ([`Digraph.forall_reflTransGen_iff_nonempty_earDecomposition`](https://taucetiproject.org/docs/TauCeti/Combinatorics/Digraph/Ear.html#Digraph.forall_reflTransGen_iff_nonempty_earDecomposition)). This snapshot has not checked every common-basic-API item the README asks of each milestone, so small interface gaps may remain.

## The frontier

- **No open mathematical target.** Ear transport, the `Digraph` ear corollary and the edge-colouring examples, the last outstanding items, have landed. What remains is to audit the common basic API of each milestone against the README, and to adopt Mathlib's interfaces if the related proposals the README cites are merged.
