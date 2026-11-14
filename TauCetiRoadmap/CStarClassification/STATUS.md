<!--tauceti-status:v1 {"roadmap":"CStarClassification","to_sha":"aa6e43e14b2556add36c8149e543f059a45926d3","ts":"2026-11-13T23:20:12Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 1","remaining":"multiplier and unitization versions, asymptotic equivalence and K-theory invariance in 1.1; finite-dimensional maps, semiprojectivity, cancellation, Elliott intertwining","state":"partial"},{"id":"Layer 2","state":"untouched"},{"id":"Layer 3","state":"untouched"},{"id":"Layer 4","state":"untouched"},{"id":"Layer 5","state":"untouched"},{"id":"Layer 6","state":"untouched"},{"id":"Layer 7","state":"untouched"},{"id":"Layer 8","state":"untouched"}],"readme_sha":"5d7545f971657b75fad0c3646919d596fdc1f853a68d44294f77bdf57e2eee98","roadmap":"CStarClassification","to_sha":"aa6e43e14b2556add36c8149e543f059a45926d3"}-->
# Status: CStarClassification

This file documents the status of the CStarClassification roadmap up until `aa6e43e` (2026-11-13T23:20:12Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The roadmap has just started. Layer 1 has one piece of its first section: approximate unitary equivalence with unitaries in a unital target, along with its sequential characterisation. No headline theorem has landed, and Layers 2–8 have not begun.

### Notable definitions and infrastructure

- **Approximate unitary equivalence in a unital target** ([`ApproximatelyUnitarilyEquivalent`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/CStarAlgebra/ApproximateUnitaryEquivalence/Basic.html#TauCeti.ApproximatelyUnitarilyEquivalent)): the Kirchberg–Phillips relation on *-homomorphisms into a unital C*-algebra, extended to nonunital sources and maps. It is an equivalence relation, compatible with composition on either side (unital maps on the left), and it preserves pointwise norms and injectivity. Elliott's intertwining theorem and every uniqueness theorem in the roadmap are stated in terms of this relation.
- **The sequential criterion** ([`iff_exists_unitary_seq`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/CStarAlgebra/ApproximateUnitaryEquivalence/Sequential.html#TauCeti.ApproximatelyUnitarilyEquivalent.iff_exists_unitary_seq)): for a separable source, the relation holds exactly when a single sequence of target unitaries conjugates one map to the other pointwise in the limit. This is the form the inductive-limit arguments consume.

### Roadmap coverage

Layer 1 is partial. In §1.1 only the unital-target relation and its sequential form are done. The multiplier-algebra and unitization versions, asymptotic unitary equivalence, invariance under restriction and stabilisation, and equality of the induced K₀ and K₁ maps all remain. §1.2–§1.5 have not started: maps between finite-dimensional algebras, finite-dimensional semiprojectivity, projection cancellation, and Elliott's intertwining. Layers 2–8 are untouched: AF structure and classification, dimension groups and UHF algebras, pure infiniteness, O₂ uniqueness and exact embedding, tensor absorption, the homomorphism picture of KK, and Kirchberg–Phillips.

## The frontier

- **Finishing §1.1**: add the multiplier-algebra and minimal-unitization versions with their sequential criteria, and asymptotic unitary equivalence with no condition on `u(0)`. The multiplier version needs CStarAlgebras C1's multiplier algebras, and the K-theory invariance needs OperatorKTheory K1–K2.
- **Maps between finite-dimensional algebras (§1.2)**: classify them by multiplicity matrices up to unitary conjugacy. This depends on the finite-dimensional block decomposition and inclusion matrices from VonNeumannAlgebras.
- **Elliott's approximate intertwining (§1.5)**: for separable unital algebras, maps that are mutually inverse up to approximate unitary equivalence should give an isomorphism. The unital-target relation now in place is the one this statement uses. The general inductive-system form also needs CStarAlgebras C5's inductive limits.
- **Finite-dimensional semiprojectivity and cancellation (§1.3–§1.4)**: these need CStarAlgebras C9's matrix-unit stability and OperatorKTheory's K₀. They are the gateway to AF structure in Layer 2.
