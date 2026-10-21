<!--tauceti-status:v1 {"roadmap":"GraphConnectivityAndFlows","to_sha":"68a457ec2b1aee486f4192ee3ea36a04f70efb8c","ts":"2026-10-20T05:58:24Z"}-->
# Status: GraphConnectivityAndFlows

This file documents the status of the GraphConnectivityAndFlows roadmap up until `68a457e` (2026-10-20T05:58:24Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Work so far is foundational, and all of it landed in this first window. The augmenting-path optimality criterion and the lattice of minimum cuts are proved, and the walk, excess and residual layers are partly built. Max-flow/min-cut itself is not yet proved, since nothing shows a maximum flow exists. Bridges and blocks, Menger, ear decompositions, circulations and Gomory–Hu trees have not begun.

### Named results

- **The augmenting-path optimality criterion** — for an `s`–`t` flow between distinct terminals, being maximum, admitting no augmenting walk in the residual network, and having value equal to some cut's capacity are equivalent ([`TauCeti.Flow.tfae_isMaximum`](https://taucetiproject.org/docs/TauCeti/Combinatorics/Network/AugmentingPath.html#TauCeti.Flow.tfae_isMaximum)), over any linearly ordered additive group, with a version for signed lower and upper bounds ([`TauCeti.BoundedFlow.tfae_isMaximum`](https://taucetiproject.org/docs/TauCeti/Combinatorics/Network/AugmentingPath.html#TauCeti.BoundedFlow.tfae_isMaximum)).
- **Maximum flows saturate a cut** — a maximum flow has value equal to the capacity of some terminal-separating cut ([`TauCeti.Flow.IsMaximum.exists_val_eq_arrowSum`](https://taucetiproject.org/docs/TauCeti/Combinatorics/Network/AugmentingPath.html#TauCeti.Flow.IsMaximum.exists_val_eq_arrowSum)), the min-cut half of max-flow/min-cut, conditional on a maximum flow being given.
- **Weak duality** — every bounded `s`–`t` assignment has value at most the cut bound of every terminal-separating set ([`TauCeti.BoundedFlow.val_le_cutBound`](https://taucetiproject.org/docs/TauCeti/Combinatorics/Network/Flow.html#TauCeti.BoundedFlow.val_le_cutBound)).
- **The lattice of minimum cuts** — for a submodular set function and disjoint terminal sets, the minimizing sides are closed under union and intersection and form a finite lattice with a smallest and a largest member ([`TauCeti.TerminalCut.minimizers`](https://taucetiproject.org/docs/TauCeti/Combinatorics/Network/MinimumCut/Basic.html#TauCeti.TerminalCut.minimizers)). A vertex lies in the smallest side exactly when it lies in every minimum cut.
- **Submodularity of cut functions** — the signed upper cut bound is submodular when lower bounds are below upper bounds ([`TauCeti.isSubmodular_cutBound`](https://taucetiproject.org/docs/TauCeti/Combinatorics/Network/CutSubmodular.html#TauCeti.isSubmodular_cutBound)), and multigraph edge-cut capacity is symmetric submodular ([`Graph.isSymmSubmodular_edgeCutCapacity`](https://taucetiproject.org/docs/TauCeti/Combinatorics/Graph/Connectivity/CutCapacity.html#Graph.isSymmSubmodular_edgeCutCapacity)).

### Notable definitions and infrastructure

- **Residual updates** ([`TauCeti.residualUpdate`](https://taucetiproject.org/docs/TauCeti/Combinatorics/Network/Residual.html#TauCeti.residualUpdate)) — one operation updating a feasible assignment along forward and reverse residual arrows. It is proved feasible, additive on excess and complete: every feasible assignment is a residual update of every other. Path and cycle augmentation, and later the circulation milestone, are specialisations of it.
- **Multigraph walks** ([`Graph.Walk`](https://taucetiproject.org/docs/TauCeti/Combinatorics/Graph/Connectivity/Walk/Basic.html#Graph.Walk)) — edge-labelled walks on Mathlib's `Graph` that keep loops and parallel edges, with paths, trails, cycles, splitting, bypassing to a path, and traced subgraphs ([`Graph.walkGraph`](https://taucetiproject.org/docs/TauCeti/Combinatorics/Graph/Connectivity/Walk/Trace.html#Graph.walkGraph)). Everything on the undirected side will be stated with these.
- **Subnetworks** ([`TauCeti.Network.Subnetwork`](https://taucetiproject.org/docs/TauCeti/Combinatorics/Network/Subnetwork.html#TauCeti.Network.Subnetwork)) — vertex and arrow selections with inherited bounds, forming a lattice under union and intersection. Together with arrow reorientation and bound replacement, they give the constructions that ear additions and capped capacities need.

### Roadmap coverage

The roadmap has no machine-tracked layers. By its nine milestones: **Milestone 1** is partial. The excess calculus, residual updates, reorientation, bound replacement, subnetworks, cut-capacity aggregation and incidence counts are in. Multigraph walks, compatible unions and directed path extraction are in. Missing are network and graph isomorphisms, the `SimpleGraph` and digraph bridges, component counts, deletion predicates and connectivity invariants, and all of 1.4 (vertex splitting, auxiliary terminals, change of coefficients). **Milestone 3** is partial: weak duality, augmentation and the optimality criterion (3.1, part of item 4) are done. Existence of a maximum flow by terminating shortest-path augmentation, decomposition, acyclic flows, integrality and 3.2–3.5 are not. **Milestone 4** has 4.1 essentially done, including the required examples, together with the symmetric terminal-exchange lemmas; 4.2–4.4 are untouched. **Milestones 2 and 5–9** are untouched.

## The frontier

- **Existence of a maximum flow** — prove that shortest-path augmentation is well-founded from any feasible flow. Combined with the optimality criterion, this gives max-flow/min-cut (3.1 item 4); integrality (item 5) should follow by tracking additive-subgroup membership.
- **Flow decomposition and acyclic flows** — decompose nonnegative assignments into weighted paths and cycles (3.1 items 2–3); the walk assignments and path extraction already in place are the ingredients.
- **Canonical residual cuts** — characterise the smallest and largest minimum `s`–`t` cuts through residual reachability from a given maximum flow (4.2). This needs nothing beyond the 4.1 lattice and the residual layer.
- **Vertex splitting and auxiliary terminals** — the constructions of 1.4 that the Menger reductions of 5.2 instantiate; untouched.
- **Representation bridges and component counts** — `Graph.ofSimpleGraph` walk correspondences and `componentCount` (1.1), which Milestone 2's bridge and block theory uses.
