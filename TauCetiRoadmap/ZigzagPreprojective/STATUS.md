<!--tauceti-status:v1 {"roadmap":"ZigzagPreprojective","to_sha":"41e5e4923e49435450084dd38f558165776282ff","ts":"2026-10-04T21:34:46Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","state":"done"},{"id":"Layer 1","state":"done"},{"id":"Layer 2","state":"done"},{"id":"Layer 3","remaining":"inverse quantum Cartan comparison with preprojective Hilbert series","state":"partial"},{"id":"Layer 4","remaining":"self-injectivity of ADE preprojective algebras beyond A2; Hilbert series and Koszulity for non-Dynkin graphs","state":"partial"},{"id":"Layer 5","remaining":"classical Koszulity of zigzag algebras exactly off finite ADE; Koszul complex exactness beyond the second stage","state":"partial"},{"id":"Layer 6","remaining":"Calabi-Yau completion identifications for Pi2 and Gamma3","state":"partial"},{"id":"Layer 7","remaining":"derived Koszul duality, Hochschild comparison, nontriviality of the Liu-Wang deformation, intrinsic formality for trees","state":"partial"},{"id":"Layer 8","remaining":"inverse, commuting and braid homotopy equivalences; K0 action; spherical-twist comparison","state":"partial"}],"readme_sha":"269fb6a54b432760210bada03ec6b793f6419a6fe79a38740f1cd0e86a6ce60b","roadmap":"ZigzagPreprojective","to_sha":"41e5e4923e49435450084dd38f558165776282ff"}-->
# Status: ZigzagPreprojective

This file documents the status of the ZigzagPreprojective roadmap up until `41e5e49` (2026-10-04T21:34:46Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Layers 0–2 are done. Layers 3–6 are partial: finite-dimensionality is now settled for every finite ADE preprojective algebra, but nothing on Koszulity or Calabi–Yau completions has landed. Layers 7 and 8 have their first constructions, Liu–Wang's affine `D₄` `A∞` deformation and the braid complexes, but none of their theorems.

### Named results

- **The finite/infinite dichotomy for preprojective algebras.** For every orientation, the preprojective algebra of a finite simply-laced Dynkin diagram is finite-dimensional over every field ([`TauCeti.finiteDimensional_preprojectiveAlgebra_of_isSimplyLaced`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/RepresentationTheory/Quiver/Preprojective/ADE/FiniteDimensional.html#TauCeti.finiteDimensional_preprojectiveAlgebra_of_isSimplyLaced)), and that of a connected non-Dynkin graph is infinite-dimensional ([`TauCeti.not_module_finite_preprojectiveAlgebra_orientedQuiver_of_not_exists_dynkinType_iso`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/RepresentationTheory/Quiver/Preprojective/InfiniteDimensional.html#TauCeti.not_module_finite_preprojectiveAlgebra_orientedQuiver_of_not_exists_dynkinType_iso)).
- **Couture's classification of skew-zigzag algebras.** Two skew parameters have the same class in `H¹(G, kˣ)` exactly when their algebras are isomorphic by an isomorphism fixing the vertex idempotents. There is also a graded version modulo graph automorphisms ([`TauCeti.SkewZigzagParameter.cohomologyClass_eq_iff_exists_vertexFixing_algEquiv`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/RepresentationTheory/Quiver/Zigzag/Cohomology.html#TauCeti.SkewZigzagParameter.cohomologyClass_eq_iff_exists_vertexFixing_algEquiv)).
- **The graded Cartan formula.** The zigzag algebra's graded Cartan matrix is `(1 + q²) I + q A_G`, and it records the graded dimensions of Homs between vertex projectives ([`TauCeti.zigzagGradedCartanMatrix_eq`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/RepresentationTheory/Quiver/Zigzag/CartanMatrix.html#TauCeti.zigzagGradedCartanMatrix_eq)).
- **The quadratic dual of the zigzag algebra.** It is the signless preprojective algebra. This is the ordinary preprojective algebra for bipartite graphs, and provably not gauge-equivalent to it on non-bipartite graphs when `2 ≠ 0` ([`TauCeti.quadraticDualQuadraticZigzagEquivSignless`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/RepresentationTheory/Quiver/Zigzag/Quadratic/Dual.html#TauCeti.quadraticDualQuadraticZigzagEquivSignless)).
- **Zeroth cohomology of the Ginzburg algebra.** `H⁰(Π₂(Q)) ≅ Π_k(Q)` as algebras ([`TauCeti.preprojectiveEquivGinzburgTwoCohomologyZero`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/Homology/Ginzburg/ZerothCohomology.html#TauCeti.preprojectiveEquivGinzburgTwoCohomologyZero)).

### Notable definitions and infrastructure

- The Khovanov–Seidel braid complexes `B_i = [P_i ⊗ e_i Z ⟶ Z]` and their inverses, as complexes of graded bimodules. Their coevaluation comes from the Casimir element of the Frobenius trace. These are the objects whose braid relations Layer 8 must prove ([`TauCeti.zigzagBraidComplex`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/RepresentationTheory/Quiver/Zigzag/Braid/Basic.html#TauCeti.zigzagBraidComplex)).
- Quartic loop deformations, which give a minimal, strictly unital `A∞` structure on the zigzag algebra for each combination of closed walks of length four. Liu–Wang's affine `D₄` example is one instance ([`TauCeti.zigzagLoopAInfinityAlgebra`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/RepresentationTheory/Quiver/Zigzag/AInfinity/Loop.html#TauCeti.zigzagLoopAInfinityAlgebra)).
- The length-adic completion `Π̂₂(Q)`, with `Π₂(Q)` embedded as its finite-support part. This separates the ordinary and completed Ginzburg algebras, as derived Koszul duality requires ([`TauCeti.completedGinzburgTwo`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/Homology/Ginzburg/Completion.html#TauCeti.completedGinzburgTwo)).

### Roadmap coverage

- **Layers 0–2**: done. This covers the affine diagrams, the componentwise algebra with its basis, dimension, centre and symmetric Frobenius trace, and the full skew-zigzag theory, including scalar extension.
- **Layer 3**: partial. Projectives, their Loewy layers, Homs, the Cartan formula, the reading through the graded Cartan map to `G₀`, the bound-quiver presentation of vertex projectives and Ext-Euler values on pairs of projectives are done. The inverse quantum Cartan comparison with preprojective Hilbert series is untouched.
- **Layer 4**: partial. Orientation independence, the moment-map comparison and the finite/infinite dichotomy are done. Self-injectivity is proved only for `A₁` and `A₂`, and Hilbert series and Koszulity for non-Dynkin graphs are untouched.
- **Layer 5**: partial. The quadratic dual and the bipartite and non-bipartite comparisons are done. For classical Koszulity, only the first two exact stages of the Koszul complex and the `A₁`/`A₂` periodic resolutions exist.
- **Layer 6**: partial. `Π₂(Q)`, `Γ₃(Q, W)`, `H⁰` and the completion are done. The Calabi–Yau completion identifications are untouched.
- **Layers 7–8**: partial, at the level of constructions only, as described above.

## The frontier

- **Classical Koszulity of zigzag algebras.** Extend the exact Koszul complex beyond its second stage and prove Koszulity exactly off finite ADE. The non-Dynkin Hilbert series of Layer 4 and the inverse-Cartan comparison of Layer 3 depend on this.
- **Self-injectivity of ADE preprojective algebras.** Finite-dimensionality is now known for all types, but self-injectivity only for `A₁` and `A₂`. The named `D₄` and `E₈` are the next cases.
- **Braid relations.** Prove that the complexes `B_i` and `B_i'` are mutually inverse, commute for nonadjacent vertices and satisfy the braid relation for adjacent ones, then compute the action on graded `K₀`.
- **Liu–Wang formality.** Prove that the affine `D₄` deformation is nontrivial up to `A∞` isomorphism, then establish the Hochschild comparison and the intrinsic-formality theorem for trees. This needs derived Koszul duality for `Π₂(Q)`, which has not begun.
- **Calabi–Yau completions.** Identify `Π₂(Q)` and `Γ₃(Q, W)` with the sibling roadmap's derived and deformed completions; this waits on that roadmap's completion.
