# Progress log: CStarClassification

An append-only record of what landed on the CStarClassification roadmap, one section per window of
merged pull requests, oldest first. Generated; the prose is not security-validated.
For a current snapshot instead, read `STATUS.md` beside this file.

<!--tauceti-progress:v1 {"from_sha":"2bbe1262e86db28bfcfd58ca46d1de3729fb3272","prs":[39205],"roadmap":"CStarClassification","to_sha":"aa6e43e14b2556add36c8149e543f059a45926d3"}-->
## CStarClassification: 2026-11-13 to 2026-11-13 (`2bbe126` to `aa6e43e`)

The classification roadmap has its first foundation stone: [approximate unitary equivalence](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/CStarAlgebra/ApproximateUnitaryEquivalence/Basic.html#TauCeti.ApproximatelyUnitarilyEquivalent) of *-homomorphisms into a unital C*-algebra, where on every finite set one map is approximated by the other conjugated by a unitary of the target (TauCeti#39205). The source and the maps may be nonunital. It is [an equivalence relation](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/CStarAlgebra/ApproximateUnitaryEquivalence/Basic.html#TauCeti.ApproximatelyUnitarilyEquivalent.equivalence) and is preserved by [precomposition](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/CStarAlgebra/ApproximateUnitaryEquivalence/Basic.html#TauCeti.ApproximatelyUnitarilyEquivalent.precomp) with any map and by postcomposition with a unital one. Equivalent maps have equal pointwise norms, so one is injective exactly when the other is. For a separable source, the relation is [equivalent to pointwise convergence along a sequence of unitaries](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/CStarAlgebra/ApproximateUnitaryEquivalence/Sequential.html#TauCeti.ApproximatelyUnitarilyEquivalent.iff_exists_unitary_seq). That is the sequential form the intertwining arguments will use.

This is only the unital-target version of §1.1. The versions with unitaries in the multiplier algebra or the minimal unitization are still missing, as are asymptotic unitary equivalence and the fact that equivalent maps agree on K-theory. Nothing yet touches the finite-dimensional classification of maps, Elliott's intertwining, or anything beyond Layer 1.
