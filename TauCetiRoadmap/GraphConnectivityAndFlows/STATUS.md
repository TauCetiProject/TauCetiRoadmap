<!--tauceti-status:v1 {"roadmap":"GraphConnectivityAndFlows","to_sha":"385ec2ddd8ddf8cc779b78c176308cb9c6b55499","ts":"2026-11-06T09:09:35Z"}-->
# Status: GraphConnectivityAndFlows

This file documents the status of the GraphConnectivityAndFlows roadmap up until `385ec2d` (2026-11-06T09:09:35Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The duality core is done: max-flow/min-cut, the structure of minimum cuts, Menger's theorem in all its forms, Gomory–Hu cut trees, and Hoffman's circulation theorem with its orientation applications. Block theory, the connectivity consequences and ear decompositions are partial, and Robbins' theorem, `st`-numberings, capacitated Hall and bipartite edge-colouring have not begun.

### Named results

- **Menger's theorem** — a finite simple graph with more than `k` vertices is `k`-vertex-connected exactly when every two vertices are joined by `k` internally disjoint paths ([`SimpleGraph.isVertexConnected_iff_forall_exists_paths`](https://taucetiproject.org/docs/TauCeti/Combinatorics/SimpleGraph/Connectivity/VertexConnectivity.html#SimpleGraph.isVertexConnected_iff_forall_exists_paths)); the local, edge, set-to-set, capacitated, directed and multigraph versions are all in, for example [`SimpleGraph.exists_paths_vertexSeparator_card_eq`](https://taucetiproject.org/docs/TauCeti/Combinatorics/SimpleGraph/Connectivity/Menger.html#SimpleGraph.exists_paths_vertexSeparator_card_eq).
- **The max-flow/min-cut theorem** — for nonnegative capacities over any linearly ordered additive group, some flow has value equal to the capacity of some cut ([`TauCeti.Flow.exists_val_eq_arrowSum`](https://taucetiproject.org/docs/TauCeti/Combinatorics/Network/ShortestAugmentation.html#TauCeti.Flow.exists_val_eq_arrowSum)), with integrality, and also for weighted multigraphs through their bidirected network ([`Graph.exists_flow_val_eq_edgeCutCapacity`](https://taucetiproject.org/docs/TauCeti/Combinatorics/Graph/Connectivity/Flow.html#Graph.exists_flow_val_eq_edgeCutCapacity)).
- **The Gomory–Hu theorem** — every symmetric submodular set function on a nonempty finite vertex type has a weighted tree whose path minima are the pairwise minimum cut values and each of whose edges cuts out a minimum cut between its ends ([`TauCeti.TerminalCut.exists_isCutTree`](https://taucetiproject.org/docs/TauCeti/Combinatorics/Network/MinimumCut/GomoryHu.html#TauCeti.TerminalCut.exists_isCutTree)).
- **Hoffman's circulation theorem** — a circulation within given lower and upper bounds exists exactly when no vertex set must receive more than it can send ([`TauCeti.exists_isCirculation_iff`](https://taucetiproject.org/docs/TauCeti/Combinatorics/Network/Hoffman.html#TauCeti.exists_isCirculation_iff)); through the edge-to-endpoint network it yields Hakimi's theorem on orientations with prescribed indegrees ([`Graph.exists_orientation_indegree_eq_iff`](https://taucetiproject.org/docs/TauCeti/Combinatorics/Graph/Orientation/Hakimi.html#Graph.exists_orientation_indegree_eq_iff)).
- **Dirac's theorem** — for `k ≥ 2`, any `k` vertices of a finite `k`-vertex-connected simple graph lie on a common cycle ([`SimpleGraph.IsVertexConnected.exists_isCycle_forall_mem_support`](https://taucetiproject.org/docs/TauCeti/Combinatorics/SimpleGraph/Connectivity/PrescribedCycle.html#SimpleGraph.IsVertexConnected.exists_isCycle_forall_mem_support)), proved from the fan lemma.

### Notable definitions and infrastructure

- **Cut trees** ([`TauCeti.TerminalCut.IsCutTree`](https://taucetiproject.org/docs/TauCeti/Combinatorics/Network/MinimumCut/CutTree.html#TauCeti.TerminalCut.IsCutTree)): the weighted-tree interface on which the query theorem, the threshold partition and the computation of edge connectivity as the least tree-edge weight are stated.
- **Multigraph orientations** ([`Graph.Orientation`](https://taucetiproject.org/docs/TauCeti/Combinatorics/Graph/Orientation/Basic.html#Graph.Orientation)): a tail and head for each actual edge, with directed walks identified with walks that follow the chosen directions; Hakimi's theorem uses them, and Robbins' theorem will.
- **Ear decompositions** ([`Graph.EarDecomposition`](https://taucetiproject.org/docs/TauCeti/Combinatorics/Graph/Connectivity/Ear/Basic.html#Graph.EarDecomposition), [`TauCeti.Network.EarDecomposition`](https://taucetiproject.org/docs/TauCeti/Combinatorics/Network/Ear/Basic.html#TauCeti.Network.EarDecomposition)): undirected and directed ears with prefix induction, the data that the ear characterizations, Robbins' theorem and `st`-numberings are built on.

### Roadmap coverage

The roadmap has no machine-tracked layers; by its nine milestones, and with the caveat that the latest facts were truncated: **Milestones 3, 4, 5 and 9** are done, including undirected max-flow/min-cut (3.3), the `Nonneg` interfaces (3.4), and the cut-tree queries, threshold partition, multigraph corollaries and the four-vertex balanced example of Milestone 9. **Milestone 8** has the main theorem of each target: Hoffman and prescribed excess, interval excess, residual cycle adjustments, the interval of feasible terminal values, rounding over floor rings, and Hakimi's theorem with its bounded-indegree forms. **Milestone 1** now has its graph isomorphisms, orientations, bidirected network, `Digraph` adapter and vertex connectivity, so its main constructions are all in. **Milestone 2** is done except the block–cut forest (2.4); cut vertices, blocks and the bridge forest are proved. **Milestone 6** is partial: Whitney's inequalities, directed connectivity, preservation lemmas, the fan lemma, Dirac's theorem and capacitated Kőnig (6.1, 6.2, 6.4–6.7) are in, 6.3 has the identification of large blocks with maximal 2-connected sets but not the common-cycle equivalences, and capacitated Hall (6.8) and edge-colouring (6.9) are untouched. **Milestone 7** is partial: ears as data (7.1) are in, 7.2 has only the direction from an ear decomposition to 2-edge-connectivity together with the bridge criterion, and Robbins (7.3) and `st`-numberings (7.4) are untouched.

## The frontier

- **Capacitated Hall and deficiency** (6.8): the Kőnig–Ore formula, capacitated Hall and the ordinary deficiency form, with the compatibility checks against Mathlib's Hall theorems. Capacitated Kőnig is in place, and the suggested proof only normalizes a minimum cover.
- **The block–cut forest** (2.4): the block–cut incidence graph, its forest property, the path correspondence and the degree formula for cut vertices. Blocks and the cut-vertex characterization are proved.
- **Ear characterizations** (7.2): the hard directions, that 2-vertex-connected graphs have open ear decompositions from any prescribed cycle, that 2-edge-connected multigraphs have ear decompositions, and that strongly connected networks have directed ones.
- **Robbins' theorem** (7.3): a finite multigraph has a strongly connected orientation exactly when it is 2-edge-connected. It waits on the directed ear characterization of 7.2.
- **Regular bipartite edge-colouring and `st`-numberings** (6.9, 7.4): the former needs 6.8, the latter the open ear decompositions of 7.2.
