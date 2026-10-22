<!--tauceti-status:v1 {"roadmap":"AmenableGroups","to_sha":"273ea28e12515bd7f9e5c2aefd933352264b83e1","ts":"2026-10-21T07:26:02Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 1","remaining":"translations L_g, invariant means and amenability, weak-* compactness of means, pullback along homomorphisms, real/complex correspondence","state":"partial"},{"id":"Layer 2","state":"untouched"},{"id":"Layer 3","state":"untouched"},{"id":"Layer 4","state":"untouched"},{"id":"Layer 5","state":"untouched"},{"id":"Layer 6","state":"untouched"},{"id":"Layer 7","state":"untouched"},{"id":"Layer 8","state":"untouched"}],"readme_sha":"51be0dfb64115f2b4fa585b7fdf7435900536966ec8f1a49a6143d3e25ca4710","roadmap":"AmenableGroups","to_sha":"273ea28e12515bd7f9e5c2aefd933352264b83e1"}-->
# Status: AmenableGroups

This file documents the status of the AmenableGroups roadmap up until `273ea28` (2026-10-21T07:26:02Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Only the foundations of Layer 1 exist: the space `UCB(G)` of bounded left-uniformly continuous functions and the theory of (not yet invariant) means on it. Translation, invariance and the definition of amenability itself have not landed, so every layer from 2 onwards is untouched.

### Notable definitions and infrastructure

- **The space `UCB(G)`** — [`TauCeti.UCB`](https://taucetiproject.org/docs/TauCeti/Topology/Algebra/Group/UCB.html#TauCeti.UCB) is the closed subalgebra of bounded continuous real functions with `sup_x |f(ux) − f(x)| → 0` as `u → 1`, for an arbitrary topological group with no separation hypothesis. It is identified with bounded uniform continuity for the right uniformity ([`mem_ucb_iff_uniformContinuous`](https://taucetiproject.org/docs/TauCeti/Topology/Algebra/Group/UCB.html#TauCeti.mem_ucb_iff_uniformContinuous)), is complete, and is a lattice with a solid norm, so it is the Banach space on which means will act.
- **Means** — a [`Mean`](https://taucetiproject.org/docs/TauCeti/GroupTheory/Amenable/Mean.html#TauCeti.Mean) is a positive linear functional with `m(1) = 1`. Continuity is derived: a mean lies between the infimum and supremum of its argument, is 1-Lipschitz and has [operator norm one](https://taucetiproject.org/docs/TauCeti/GroupTheory/Amenable/Mean.html#TauCeti.Mean.norm_toContinuousLinearMap). The means form a convex set of continuous functionals, nonempty because [evaluation at a point](https://taucetiproject.org/docs/TauCeti/GroupTheory/Amenable/Mean.html#TauCeti.Mean.eval) is a mean.
- **Order-unit bounds for positive functionals** — a positive functional dominated at an order unit `u` (every `f ≤ ‖f‖·u`) is [continuous](https://taucetiproject.org/docs/TauCeti/Analysis/Normed/Order/PositiveLinearMap.html#PositiveLinearMap.continuous_of_forall_le_norm_smul) with norm its value at `u`. The roadmap wants these shared positivity lemmas for reuse in Layers 2 and 7.

### Roadmap coverage

Layer 1 is partial. Item 1 (the UCB space, its three equivalent descriptions, closure under products, lattice operations and uniform limits, the complete normed structure) and most of item 3 (means and their bounds, norm and convexity) are done. Still missing from Layer 1: the translation isometries `L_g` and their continuity (item 2), invariant means and convexity of the invariant ones, the weak-* compact space of means and its finite-intersection criterion (item 4), pullback along continuous homomorphisms (item 5), and the real/complex correspondence (item 6). Layers 2–8 (discrete means and contents, equidecompositions and `F₂`, closure theory, Følner criteria, abelian groups, the Haar L∞ characterization and Tarski's alternative) are untouched.

## The frontier

- **Left translation on `UCB(G)`** — construct `L_g f = f(g⁻¹ ·)` as a linear isometry equivalence, with its action laws and norm-continuity of `g ↦ L_g f`, and right translations commuting with it. This is what lets invariance and amenability be defined.
- **Invariant means and amenability** — define left invariance and amenability as existence of an invariant mean, and prove that the invariant means form a convex set.
- **Weak-* compactness of means** — place means in the weak-* closed unit ball, prove positivity, normalization and each invariance equation define closed sets, and derive the finite-intersection and cluster-point criteria that Layer 4's directed unions depend on.
- **Transport along homomorphisms** — pullback `UCB(H) → UCB(G)` along a continuous homomorphism, and transfer of amenability along continuous surjections and topological isomorphisms.
- **Discrete specialization (Layer 2)** — once amenability is defined, identify `UCB` with all bounded functions on a discrete group and build the mean–content correspondence and the finite-group example.
