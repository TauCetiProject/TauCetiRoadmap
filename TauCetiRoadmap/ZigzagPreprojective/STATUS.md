<!--tauceti-status:v1 {"roadmap":"ZigzagPreprojective","to_sha":"163ce800f7f3b5089428c699474f28f877d6759b","ts":"2026-09-29T08:26:13+00:00"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","remaining":"componentwise centre decomposition","state":"partial"},{"id":"Layer 1","remaining":"dedicated A2 presentation and remaining skew classification and trace cases","state":"partial"},{"id":"Layer 2","remaining":"disconnected and rank-one centre formulas, and skew centre calculations","state":"partial"},{"id":"Layer 3","remaining":"bound-quiver and K0 comparisons, Ext q-Euler values, and inverse Cartan comparison","state":"partial"},{"id":"Layer 4","remaining":"finite-ADE finite dimensionality and self-injectivity; non-Dynkin Hilbert series and Koszulity","state":"partial"},{"id":"Layer 5","remaining":"quadratic-dual identification, Koszul complexes, and finite-ADE criterion","state":"partial"},{"id":"Layer 6","remaining":"completion, Calabi–Yau comparisons, and the Hochschild class of a potential","state":"partial"},{"id":"Layer 7","remaining":"derived Koszul duality, Hochschild comparison, and intrinsic formality","state":"untouched"},{"id":"Layer 8","remaining":"braid complexes, their action, and spherical-twist comparison","state":"untouched"}],"readme_sha":"269fb6a54b432760210bada03ec6b793f6419a6fe79a38740f1cd0e86a6ce60b","roadmap":"ZigzagPreprojective","to_sha":"163ce800f7f3b5089428c699474f28f877d6759b"}-->
# Status: ZigzagPreprojective

This file documents the status of the ZigzagPreprojective roadmap up until `163ce80` (2026-09-29T08:26:13+00:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The affine and strict-algebra foundations support a componentwise zigzag basis, self-injectivity, skew classification with specified isomorphisms, and the Ginzburg zeroth-cohomology comparison. Layers 0–6 still have stated milestones open; derived duality, deformation theory, and braid actions in Layers 7–8 have not begun.

### Named results

- **Couture’s vertex-fixing classification** — two skew-zigzag parameters have the same class in graph `H¹(G,kˣ)` exactly when their relation quotients admit a graded algebra isomorphism fixing every vertex idempotent ([`TauCeti.SkewZigzagParameter.cohomologyClass_eq_iff_exists_graded_vertexFixing_algEquiv`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/RepresentationTheory/Quiver/Zigzag/Skew/Grading.html#TauCeti.SkewZigzagParameter.cohomologyClass_eq_iff_exists_graded_vertexFixing_algEquiv)).
- **Classification up to graph automorphisms** — the `H¹` classes lie in the same automorphism orbit exactly when the skew quotients are isomorphic by a map preserving the vertex-idempotent span, assuming the coefficient ring has only trivial idempotents ([`TauCeti.SkewZigzagParameter.exists_firstCohomologyRelabel_eq_iff_exists_algEquiv_mem_span`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/RepresentationTheory/Quiver/Zigzag/Skew/Automorphism.html#TauCeti.SkewZigzagParameter.exists_firstCohomologyRelabel_eq_iff_exists_algEquiv_mem_span)).
- **Ginzburg zeroth cohomology** — the additive preprojective algebra is isomorphic to `H⁰` of the two-dimensional Ginzburg DG algebra ([`TauCeti.preprojectiveEquivGinzburgTwoCohomologyZero`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/Homology/Ginzburg/ZerothCohomology.html#TauCeti.preprojectiveEquivGinzburgTwoCohomologyZero)).
- **Self-injectivity of ordinary zigzag algebras** — the public algebra is self-injective for every finite simple graph, including isolated vertices ([`TauCeti.moduleInjective_zigzagAlgebra`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/RepresentationTheory/Quiver/Zigzag/SelfInjective.html#TauCeti.moduleInjective_zigzagAlgebra)).
- **Graded Cartan formula** — for graphs without isolated vertices, the vertex-projective matrix is `(1+q²)I+qA_G` ([`TauCeti.zigzagGradedCartanMatrix_eq`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/RepresentationTheory/Quiver/Zigzag/CartanMatrix.html#TauCeti.zigzagGradedCartanMatrix_eq)).

### Notable definitions and infrastructure

- The [componentwise vertex–arrow–volume basis](https://taucetiproject.github.io/TauCeti/docs/TauCeti/RepresentationTheory/Quiver/Zigzag/Componentwise/Decomposition.html#TauCeti.zigzagAlgebraBasis) extends basis calculations to singleton components and supports the public dimension and trace formulas.
- The [two-dimensional Ginzburg DG algebra](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/Homology/Ginzburg/Basic.html#TauCeti.isDGAlgebra_ginzburgTwoDifferential) puts the preprojective relators in the differential of degree `-1` loops.
- The distinct [three-dimensional Ginzburg DG algebra](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/Homology/Ginzburg/ThreeDimensional.html#TauCeti.isDGAlgebra_ginzburgThreeDifferential) uses a potential and cyclic derivatives.

### Roadmap coverage

Layer 0 is partial: affine diagrams, doubled graphs, quotients, gradings, and componentwise basis and trace are in place, but the requested componentwise centre decomposition is not established. Layers 1–2 remain partial: tree and cycle gauge results, skew bases and traces, and the ordinary public basis, dimension, trace and self-injectivity are proved; dedicated `A₂` checks and disconnected and skew centre formulas remain. Layer 3 has projective radical layers and the projective `q`-Hom form, but no `K₀` comparison or Ext `q`-Euler theorem. Layer 4 has orientation, gauge and opposite-algebra comparisons and a moment-map formulation, but not the finite-ADE/non-Dynkin dichotomy. Layer 5 has signless relations, a bipartite comparison and an odd-cycle obstruction, but no quadratic-dual or Koszul theorem. Layer 6 has both DG constructions and `H⁰`, but no completion or Calabi–Yau identification. Layers 7–8 are untouched.

## The frontier

- **Componentwise centres** — compute the centre of the public ordinary algebra for disconnected graphs and singleton factors, then extend the calculation to skew parameters.
- **Quadratic and Koszul duality** — identify the signless quotient as the actual quadratic dual for connected graphs with at least three vertices; the bipartite sign comparison is available, but Koszul complexes and the finite-ADE criterion remain.
- **Preprojective dimension dichotomy** — prove finite dimensionality and self-injectivity for finite ADE and the Hilbert-series/Koszul result for non-Dynkin graphs; cycle and quadratic-relator obstructions supply partial infinite-dimensionality results.
- **Ginzburg completion comparison** — construct the length-adic comparison and identify the two- and three-dimensional DG algebras with the appropriate Calabi–Yau completions under their stated hypotheses.
- **Derived duality and braid actions** — build the tree-level derived Koszul and Hochschild comparisons before the formality theorem, and then the bimodule braid complexes and spherical-twist comparison.
