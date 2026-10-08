<!--tauceti-status:v1 {"roadmap":"ZigzagPreprojective","to_sha":"8334df225e9c15d22464fe5432d849ee6391c09a","ts":"2026-10-07T18:27:27Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","state":"done"},{"id":"Layer 1","state":"done"},{"id":"Layer 2","state":"done"},{"id":"Layer 3","remaining":"inverse quantum Cartan comparison with preprojective Hilbert series","state":"partial"},{"id":"Layer 4","remaining":"self-injectivity for E8 and the An, Dn families; non-Dynkin Koszulity (injectivity of the Koszul complex's left map) and Hilbert series","state":"partial"},{"id":"Layer 5","remaining":"classical Koszulity of zigzag algebras exactly off finite ADE; Koszul complex exactness beyond the second stage","state":"partial"},{"id":"Layer 6","remaining":"Calabi-Yau completion identifications for Pi2 and Gamma3","state":"partial"},{"id":"Layer 7","remaining":"derived Koszul duality, Hochschild comparison, nontriviality of the Liu-Wang deformation, intrinsic formality for trees","state":"partial"},{"id":"Layer 8","remaining":"inverse, commuting and braid homotopy equivalences; K0 action; spherical-twist comparison","state":"partial"}],"readme_sha":"269fb6a54b432760210bada03ec6b793f6419a6fe79a38740f1cd0e86a6ce60b","roadmap":"ZigzagPreprojective","to_sha":"8334df225e9c15d22464fe5432d849ee6391c09a"}-->
# Status: ZigzagPreprojective

This file documents the status of the ZigzagPreprojective roadmap up until `8334df2` (2026-10-07T18:27:27Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Layers 0–2 are done. Layers 3–6 are partial. Every finite ADE preprojective algebra is known to be finite-dimensional, and self-injectivity now reaches `D₄`, but neither Koszulity theorem nor any Calabi–Yau completion identification has landed. Layers 7 and 8 have their first constructions, Liu–Wang's affine `D₄` `A∞` deformation and the braid complexes, but none of their theorems.

### Named results

- **The finite/infinite dichotomy for preprojective algebras.** For every orientation, the preprojective algebra of a finite simply-laced Dynkin diagram is finite-dimensional over every field ([`TauCeti.finiteDimensional_preprojectiveAlgebra_of_isSimplyLaced`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/RepresentationTheory/Quiver/Preprojective/ADE/FiniteDimensional.html#TauCeti.finiteDimensional_preprojectiveAlgebra_of_isSimplyLaced)), and that of a connected non-Dynkin graph is infinite-dimensional ([`TauCeti.not_module_finite_preprojectiveAlgebra_orientedQuiver_of_not_exists_dynkinType_iso`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/RepresentationTheory/Quiver/Preprojective/InfiniteDimensional.html#TauCeti.not_module_finite_preprojectiveAlgebra_orientedQuiver_of_not_exists_dynkinType_iso)).
- **Self-injectivity of the `D₄` preprojective algebra.** For every orientation and over every field, `Π(D₄)` is left and right self-injective. The proof goes through a 28-element walk basis and a Frobenius form on the signless algebra ([`TauCeti.moduleInjective_preprojectiveAlgebra_D4`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/RepresentationTheory/Quiver/Preprojective/ADE/D4/SelfInjective.html#TauCeti.moduleInjective_preprojectiveAlgebra_D4)).
- **Couture's classification of skew-zigzag algebras.** Two skew parameters have the same class in `H¹(G, kˣ)` exactly when their algebras are isomorphic by an isomorphism fixing the vertex idempotents. A graded version modulo graph automorphisms also holds ([`TauCeti.SkewZigzagParameter.cohomologyClass_eq_iff_exists_vertexFixing_algEquiv`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/RepresentationTheory/Quiver/Zigzag/Cohomology.html#TauCeti.SkewZigzagParameter.cohomologyClass_eq_iff_exists_vertexFixing_algEquiv)).
- **The graded Cartan formula.** The zigzag algebra's graded Cartan matrix is `(1 + q²) I + q A_G`, and it records the graded dimensions of Homs between vertex projectives ([`TauCeti.zigzagGradedCartanMatrix_eq`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/RepresentationTheory/Quiver/Zigzag/CartanMatrix.html#TauCeti.zigzagGradedCartanMatrix_eq)).
- **The quadratic dual of the zigzag algebra.** It is the signless preprojective algebra. For bipartite graphs this is the ordinary preprojective algebra, and on non-bipartite graphs with `2 ≠ 0` it is provably not gauge-equivalent to it ([`TauCeti.quadraticDualQuadraticZigzagEquivSignless`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/RepresentationTheory/Quiver/Zigzag/Quadratic/Dual.html#TauCeti.quadraticDualQuadraticZigzagEquivSignless)).

### Notable definitions and infrastructure

- The Koszul complex `0 → e_vΠ → ⨁_b e_iΠ → e_vΠ → S_v → 0` of a vertex module of the preprojective algebra, for any finite quiver over any commutative ring. It is proved exact at its two right-hand terms ([`TauCeti.sum_preprojectiveMk_ofArrow_mul_eq_zero_iff`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/RepresentationTheory/Quiver/Preprojective/KoszulComplex.html#TauCeti.sum_preprojectiveMk_ofArrow_mul_eq_zero_iff)). Non-Dynkin Koszulity is thereby reduced to injectivity of the left-hand map.
- The Khovanov–Seidel braid complexes `B_i = [P_i ⊗ e_i Z ⟶ Z]` and their inverses, as complexes of graded bimodules. These are the objects whose braid relations Layer 8 must prove ([`TauCeti.zigzagBraidComplex`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/RepresentationTheory/Quiver/Zigzag/Braid/Basic.html#TauCeti.zigzagBraidComplex)).
- Quartic loop deformations, which give a minimal, strictly unital `A∞` structure on the zigzag algebra for each combination of closed walks of length four. Liu–Wang's affine `D₄` example is one instance ([`TauCeti.zigzagLoopAInfinityAlgebra`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/RepresentationTheory/Quiver/Zigzag/AInfinity/Loop.html#TauCeti.zigzagLoopAInfinityAlgebra)).

### Roadmap coverage

- **Layers 0–2**: done. This covers the affine diagrams, the componentwise algebra with its basis, dimension, centre and symmetric Frobenius trace, and the full skew-zigzag theory.
- **Layer 3**: partial. Projectives, Homs, the Cartan formula, its reading in `G₀` and Ext-Euler values on pairs of projectives are done. The inverse quantum Cartan comparison with preprojective Hilbert series is untouched.
- **Layer 4**: partial. Orientation independence, the moment-map comparison and the finite/infinite dichotomy are done. Self-injectivity is proved for `A₁`, `A₂` and `D₄` only. The type-`A` signless corners have bases, but the `Dₙ` fork corner has only a dimension bound. Non-Dynkin Koszulity and Hilbert series are open, with the Koszul complex exact except at its left end.
- **Layer 5**: partial. The quadratic dual and the bipartite and non-bipartite comparisons are done. For classical Koszulity, only the first two exact stages of the zigzag Koszul complex and the `A₁`/`A₂` resolutions exist.
- **Layer 6**: partial. `Π₂(Q)`, `Γ₃(Q, W)`, `H⁰(Π₂(Q)) ≅ Π(Q)` and the completion are done. The Calabi–Yau completion identifications are untouched.
- **Layers 7–8**: partial, at the level of constructions. For Layer 8 there is also the vanishing of `e_i Z ⊗_Z Z e_j` at nonadjacent vertices.

## The frontier

- **Koszulity off Dynkin type.** For the preprojective algebra, prove the left map `e_vΠ → ⨁_b e_iΠ` injective for connected non-Dynkin quivers, and deduce the Hilbert series. For the zigzag algebra, extend the Koszul complex beyond its second stage. Layer 3's inverse-Cartan comparison waits on both.
- **Self-injectivity of ADE preprojective algebras.** `D₄` is done. `E₈` and the `Aₙ`, `Dₙ` families remain. The type-`A` corner bases are a step toward the families, and `Dₙ` still needs a basis of its fork corner.
- **Braid relations.** Prove that `B_i` and its inverse complex are mutually inverse, that `B_i` and `B_j` commute for nonadjacent vertices and satisfy the braid relation for adjacent ones, then compute the action on graded `K₀`.
- **Liu–Wang formality.** Prove that the affine `D₄` deformation is nontrivial up to `A∞` isomorphism, then establish the Hochschild comparison and intrinsic formality for trees. This needs derived Koszul duality for `Π₂(Q)`, which has not begun.
- **Calabi–Yau completions.** Identify `Π₂(Q)` and `Γ₃(Q, W)` with the sibling roadmap's derived and deformed completions. This waits on that roadmap's completion.
