<!--tauceti-status:v1 {"roadmap":"ZigzagPreprojective","to_sha":"dec7a5857c7d85f2ce63e7890c26b1e99a537057","ts":"2026-09-30T00:20:29Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","state":"done"},{"id":"Layer 1","state":"done"},{"id":"Layer 2","state":"done"},{"id":"Layer 3","remaining":"graded K0 reading, Ext q-Euler values, inverse quantum Cartan comparison, bound-quiver module comparison","state":"partial"},{"id":"Layer 4","remaining":"finite-dimensionality and self-injectivity for ADE beyond A2; Hilbert series and Koszulity for non-Dynkin graphs","state":"partial"},{"id":"Layer 5","remaining":"classical Koszulity of zigzag algebras exactly off finite ADE, with Koszul complexes","state":"partial"},{"id":"Layer 6","remaining":"Calabi-Yau completion identifications for Pi2 and Gamma3, length-adic completion","state":"partial"},{"id":"Layer 7","state":"untouched"},{"id":"Layer 8","state":"untouched"}],"readme_sha":"269fb6a54b432760210bada03ec6b793f6419a6fe79a38740f1cd0e86a6ce60b","roadmap":"ZigzagPreprojective","to_sha":"dec7a5857c7d85f2ce63e7890c26b1e99a537057"}-->
# Status: ZigzagPreprojective

This file documents the status of the ZigzagPreprojective roadmap up until `dec7a58` (2026-09-30T00:20:29Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Layers 0–2 are done, including the componentwise corrections, the skew-zigzag classification and self-injectivity. Layers 3–6 are partial: Layer 6 has only its constructions and `H⁰`, and nothing on Koszulity has landed. Layers 7 and 8 have not begun.

### Named results

- **Couture's classification of skew-zigzag algebras** — two skew parameters on a finite graph have the same class in `H¹(G, kˣ)` exactly when their algebras are isomorphic by an isomorphism fixing the vertex idempotents. Graded and up-to-graph-automorphism versions exist as well ([`TauCeti.SkewZigzagParameter.cohomologyClass_eq_iff_exists_vertexFixing_algEquiv`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/RepresentationTheory/Quiver/Zigzag/Cohomology.html#TauCeti.SkewZigzagParameter.cohomologyClass_eq_iff_exists_vertexFixing_algEquiv)).
- **Non-Dynkin preprojective algebras are infinite-dimensional** — for a connected finite graph not isomorphic to a Dynkin diagram, the preprojective algebra of every orientation is infinite-dimensional over every field ([`TauCeti.not_module_finite_preprojectiveAlgebra_orientedQuiver_of_not_exists_dynkinType_iso`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/RepresentationTheory/Quiver/Preprojective/InfiniteDimensional.html#TauCeti.not_module_finite_preprojectiveAlgebra_orientedQuiver_of_not_exists_dynkinType_iso)).
- **Quadratic dual of the zigzag algebra** — it is the signless preprojective algebra. That algebra agrees with the ordinary preprojective algebra for a bipartite graph, and provably cannot be matched with it by any gauge on a non-bipartite graph when `2 ≠ 0` ([`TauCeti.quadraticDualQuadraticZigzagEquivSignless`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/RepresentationTheory/Quiver/Zigzag/Quadratic/Dual.html#TauCeti.quadraticDualQuadraticZigzagEquivSignless)).
- **Zeroth cohomology of the Ginzburg algebra** — `H⁰(Π₂(Q)) ≅ Π_k(Q)` as algebras, a doubled path going to the class of the same path ([`TauCeti.preprojectiveEquivGinzburgTwoCohomologyZero`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/Homology/Ginzburg/ZerothCohomology.html#TauCeti.preprojectiveEquivGinzburgTwoCohomologyZero)).
- **Graded Cartan formula** — the graded Cartan matrix of the zigzag algebra is `(1 + q²) I + q A_G`, and it equals the graded dimensions of Homs between vertex projectives ([`TauCeti.zigzagGradedCartanMatrix_eq`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/RepresentationTheory/Quiver/Zigzag/CartanMatrix.html#TauCeti.zigzagGradedCartanMatrix_eq)).

### Notable definitions and infrastructure

- First cohomology of a simple graph, functorial in graph isomorphisms and coefficient maps. It is the target of the skew-zigzag classification and of its scalar-extension statement ([`SimpleGraph.FirstCohomology`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Combinatorics/SimpleGraph/Cohomology/Basic.html#SimpleGraph.FirstCohomology)).
- The quadratic dual of a quadratic path-algebra quotient, with its universal property and involutive orthogonal complement. This is the ground for the Layer 5 comparisons and eventually Koszulity ([`TauCeti.PathAlgebra.quadraticDual`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/RepresentationTheory/Quiver/PathAlgebra/Quadratic/Dual.html#TauCeti.PathAlgebra.quadraticDual)).
- The two-dimensional Ginzburg differential. It has `d(t_i) = ρ_i`, `d² = 0` and bidegree `(1, 0)`, and is the object Layers 7–8 will work with ([`TauCeti.ginzburgTwoDifferential`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/Homology/Ginzburg/Basic.html#TauCeti.ginzburgTwoDifferential)).

### Roadmap coverage

- **Layers 0–2**: done. The public componentwise algebra has a basis, a multiplication table and a grading. Its dimension is `2|V| + 2|E|`, its centre has dimension `|V|` plus the number of components, and its symmetric perfect trace pairing and self-injectivity are proved for every finite graph. The affine star descriptions landed. The skew side has gauge equivalence, the classification (including scalar extension), tree triviality, even and odd cycles with the characteristic-two identification, and skew bases, centres and traces.
- **Layer 3**: partial. Projectives, their radical layers and socle, shifts, Homs, the Cartan formula and the projective `q`-Hom matrix are done. A graded `K₀` presentation, Ext `q`-Euler values and the inverse quantum Cartan comparison are untouched. The bound-quiver module comparison is not established here.
- **Layer 4**: partial. The opposite-algebra comparison, the moment-map comparison and non-Dynkin infinite-dimensionality are done. Finite-dimensionality and self-injectivity are proved only for `A₁` and `A₂`, and Hilbert series and Koszulity are untouched.
- **Layer 5**: partial. Items 1–2 are done: the quadratic dual, the bipartite comparison, the non-bipartite obstruction and the characteristic-two collapse. Classical Koszulity is untouched.
- **Layer 6**: partial. `Π₂(Q)` and `Γ₃(Q, W)` are constructed as DG algebras, with `H⁰(Π₂(Q)) ≅ Π(Q)`. The Calabi–Yau completion identifications and the length-adic completion are untouched.
- **Layers 7–8**: untouched.
- **Named examples**: the zigzag computations for `A₁`, `A₂`, `D₄`, `E₈` and affine `E₈` are done: dimensions `14, 30, 34`, centres `5, 9, 10`, the Cartan matrices, the singular affine specialisation at `q = −1`, and the signless comparisons. Finite-dimensionality of the `D₄` and `E₈` preprojective algebras, Koszulity for affine `E₈`, and formality are open.

## The frontier

- **Finite ADE preprojective algebras** — prove finite-dimensionality and self-injectivity of `Π(Q)` for all finite ADE graphs, in particular the named `D₄` and `E₈`. Only `A₁` and `A₂` are done ([`TauCeti.moduleInjective_preprojectiveAlgebra_A2`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/RepresentationTheory/Quiver/Preprojective/ADE/A2/SelfInjective.html#TauCeti.moduleInjective_preprojectiveAlgebra_A2)).
- **Koszulity** — Etingof–Eu Hilbert series and Koszulity for non-Dynkin preprojective algebras, and the Layer 5 theorem that the zigzag algebra is Koszul exactly off finite ADE. The quadratic dual is in place, but no Koszul complex has landed.
- **Calabi–Yau completions** — identify `Π₂(Q)` and `Γ₃(Q, W)` with the sibling roadmap's derived and deformed completions, and build the length-adic completion. This needs the sibling's completion.
- **Remaining Layer 3** — Ext `q`-Euler values under the finite-support predicates, and the inverse quantum Cartan comparison with preprojective graded dimensions. The latter waits on the Hilbert-series work above.
- **Derived Koszul duality and braid complexes** — Layers 7–8 are untouched. Their starting point, `Π₂(Q)`, now exists.
