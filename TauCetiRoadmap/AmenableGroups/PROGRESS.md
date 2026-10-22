# Progress log: AmenableGroups

An append-only record of what landed on the AmenableGroups roadmap, one section per window of
merged pull requests, oldest first. Generated; the prose is not security-validated.
For a current snapshot instead, read `STATUS.md` beside this file.

<!--tauceti-progress:v1 {"from_sha":"94514adec026bd4e61f02320a141f0cebd15b60e","prs":[18461,19089],"roadmap":"AmenableGroups","to_sha":"273ea28e12515bd7f9e5c2aefd933352264b83e1"}-->
## AmenableGroups: 2026-10-19 to 2026-10-21 (`94514ad` to `273ea28`)

The roadmap's first window laid down the function space and the notion of a mean that everything else is built on. [`TauCeti.UCB`](https://taucetiproject.org/docs/TauCeti/Topology/Algebra/Group/UCB.html#TauCeti.UCB) is the real Banach algebra of bounded functions on a topological group that are uniformly continuous under small left multiplication, with the three equivalent descriptions the roadmap asks for: the neighbourhood condition, convergence of left translates in supremum norm, and uniform continuity for the right uniformity ([`mem_ucb_iff_uniformContinuous`](https://taucetiproject.org/docs/TauCeti/Topology/Algebra/Group/UCB.html#TauCeti.mem_ucb_iff_uniformContinuous)). It is closed under uniform limits, a lattice with a solid norm, and complete (TauCeti#18461).

On top of it, a [`Mean`](https://taucetiproject.org/docs/TauCeti/GroupTheory/Amenable/Mean.html#TauCeti.Mean) is a positive linear functional taking the value 1 at 1, with continuity derived rather than assumed: every mean lies between the infimum and supremum of its argument, is 1-Lipschitz, and has [operator norm one](https://taucetiproject.org/docs/TauCeti/GroupTheory/Amenable/Mean.html#TauCeti.Mean.norm_toContinuousLinearMap). The means form a convex set, nonempty because evaluation at a point is one. The supporting lemmas, that a positive functional dominated at an order unit is continuous with norm its value there, were stated for general ordered normed spaces so Layers 2 and 7 can reuse them. Invariance has not appeared yet: there is no translation action on `UCB`, no invariant mean and no definition of amenability.
