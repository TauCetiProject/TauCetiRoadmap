<!--tauceti-status:v1 {"roadmap":"HomotopySpheres","to_sha":"aa6e43e14b2556add36c8149e543f059a45926d3","ts":"2026-11-13T23:20:12Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 1","state":"untouched"},{"id":"Layer 2","state":"untouched"},{"id":"Layer 3","remaining":"everything but the Clifford metric adapter: 3A cones and stems, James, EHP, Toda brackets, Hopf invariant one and the sphere frames","state":"partial"},{"id":"Layer 4","state":"untouched"},{"id":"Layer 5","state":"untouched"},{"id":"Layer 6","state":"untouched"},{"id":"Layer 7","state":"untouched"},{"id":"Layer 8","state":"untouched"},{"id":"Layer 9","state":"untouched"},{"id":"Layer 9A","state":"untouched"},{"id":"Layer 10","state":"untouched"}],"readme_sha":"86d478106c2109c522c4b4c55846fca5f74053be28c1408eb0a9c6baf18f6893","roadmap":"HomotopySpheres","to_sha":"aa6e43e14b2556add36c8149e543f059a45926d3"}-->
# Status: HomotopySpheres

This file documents the status of the HomotopySpheres roadmap up until `aa6e43e` (2026-11-13T23:20:12Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Almost nothing has been built yet. The only landed work is one algebraic ingredient of Layer 3's construction of tangent frames on S¹, S³ and S⁷. The h-cobordism theorem, the group Θₙ, stable stems, Bott periodicity, surgery, the Kervaire–Milnor sequence, and the Θ₆ and Θ₇ calculations have not begun, and none of the headline statements in `Suggested.lean` is proved in the library.

### Notable definitions and infrastructure

- **Skew-adjoint metrics on Clifford modules** — every module over a negative-definite Clifford algebra with a finite orthogonal basis squaring to −1 admits a positive-definite symmetric form for which every Clifford vector acts skew-adjointly ([`AlgHom.exists_posDef_isSymm_isSkewAdjoint_map_cliffordAlgebraι`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/CliffordAlgebra/Module/Metric.html#AlgHom.exists_posDef_isSymm_isSkewAdjoint_map_cliffordAlgebraι)). The form is obtained by averaging over the finite signed monomial group. Together with the [scaling identity](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/CliffordAlgebra/Module/Metric.html#AlgHom.bilinForm_map_cliffordAlgebraι_apply_map_cliffordAlgebraι_apply) for skew-adjoint vectors, this is the "finite-module metric adapter" that the roadmap requires before Clifford generators Aᵢ can give orthonormal tangent fields Aᵢx on the unit sphere.

### Roadmap coverage

Layer 3 is partial only in a nominal sense. Its single landed piece is the metric adapter inside 3C.5. The pointed and Puppe constructions (3A), the James construction (3B), EHP and Toda brackets (3C.1–3C.4), the Adams–Atiyah Hopf-invariant-one exclusion, and the frames themselves are all absent. Layers 1, 2, 4, 5, 6, 7, 8, 9, 9A and 10 are untouched: no h-cobordism or handle-calculus results, no Θₙ, no stable orthogonal groups or Bott chain, no framing comparison, no almost-framed or surgery groups, and no stem calculations. The E₈ lattice plumbing elsewhere in Tau Ceti is the lattice datum that Section 6B consumes. The plumbed manifolds P⁴ᵏ themselves have not been built.

## The frontier

- **Clifford tangent frames on S¹, S³, S⁷** — build the real Clifford modules of dimensions 2, 4 and 8, transport the averaged metric to Euclidean space, and prove that the fields Aᵢx form a smooth orthonormal basis of x^⊥. This yields the tangent trivializations. It is the direct continuation of the landed work, and it relies on the Clifford classification table from SpinRepresentations L7.
- **The exclusion half of `sphere_parallelizable_iff`** — the Hopf construction from a tangent frame, the integral Hopf invariant on the two-cell mapping cone, and the K-theoretic proof that odd Hopf invariant forces d ∈ {2, 4, 8}. This waits on 3A.2's cone sequences and on Adams operations and the Chern character from TopologicalKTheory and CharacteristicClasses.
- **Pointed convenient constructions (3A)** — reduced cones, mapping cones, Puppe sequences and the stable stems. These come before the James construction, EHP and every stem calculation, and they consume AlgebraicTopology Stage 4 item 8.
- **Morse handles and the h-cobordism theorem (Layer 1)** — not begun. It depends on the GeometricTopology collar and handle APIs and on the Heegaard Floer trajectory inputs.
- **Stable orthogonal groups and Bott periodicity (4A–4B)** — not begun. It depends on the TopologicalKTheory T1.5–T1.6 classifiers and on the RiemannianGeometry and MorseTheory inputs for the geodesic argument.
