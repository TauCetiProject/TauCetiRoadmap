<!--tauceti-status:v1 {"roadmap":"HomotopySpheres","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e","ts":"2026-11-19T18:22:01+11:00"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 1","state":"untouched"},{"id":"Layer 2","state":"untouched"},{"id":"Layer 3","remaining":"3A cones and stems, James quotients and James map, EHP, Toda brackets, the Hopf invariant and its K-theory, and the Clifford sphere frames","state":"partial"},{"id":"Layer 4","state":"untouched"},{"id":"Layer 5","state":"untouched"},{"id":"Layer 6","state":"untouched"},{"id":"Layer 7","state":"untouched"},{"id":"Layer 8","state":"untouched"},{"id":"Layer 9","state":"untouched"},{"id":"Layer 9A","state":"untouched"},{"id":"Layer 10","state":"untouched"}],"readme_sha":"0ab4ace55e21cc72dbc9d0fe1ce3969d29ab033aa33f33f4071e3586b825799e","roadmap":"HomotopySpheres","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e"}-->
# Status: HomotopySpheres

This file documents the status of the HomotopySpheres roadmap up until `b235000` (2026-11-19T18:22:01+11:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Only Layer 3 has begun, and it remains thin. It now has the James reduced product with its word-length filtration, a skew-adjoint metric for Clifford modules, and the formal Adams-operation step of the Hopf-invariant-one exclusion. No layer is complete. The h-cobordism theorem, Θₙ, stable stems, Bott periodicity, surgery, the Kervaire–Milnor sequence and the Θ₆ and Θ₇ calculations have not begun, and none of the headline statements in `Suggested.lean` is proved.

### Named results

- **The Adams–Atiyah divisibility test** — consider an integral rank-two group with x² = h·y for odd h, and commuting operations ψ² and ψ³ shaped like Adams operations on a two-cell complex, with ψ²x ≡ x² mod 2. Then the half-dimension r is 1, 2 or 4 ([`eq_one_or_eq_two_or_eq_four_of_adamsOperation`](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/HopfInvariant/AdamsOperation.html#TauCeti.eq_one_or_eq_two_or_eq_four_of_adamsOperation)). This is the algebraic last step of the K-theoretic proof that odd Hopf invariant forces dimension 2, 4 or 8. Its hypotheses are stated abstractly, and no K-group yet supplies them.
- **The 2-adic divisibility of 3ʳ − 1** — 2ʳ divides 3ʳ − 1 exactly when r is 0, 1, 2 or 4 ([`Nat.two_pow_dvd_three_pow_sub_one_iff`](https://taucetiproject.org/docs/TauCeti/NumberTheory/Multiplicity.html#Nat.two_pow_dvd_three_pow_sub_one_iff)). This is the number-theoretic input to the test above.

### Notable definitions and infrastructure

- **The James reduced product** — the space of finite words in a pointed space modulo deleting the basepoint, formed in compactly generated spaces and free as a monoid on the non-basepoint points ([`JamesReducedProduct`](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/JamesReducedProduct.html#TauCeti.JamesReducedProduct)). It has a universal property for based maps into topological monoids and a test for continuity by compact Hausdorff families of words. Its [word-length filtration](https://taucetiproject.org/docs/TauCeti/AlgebraicTopology/JamesReducedProduct.html#TauCeti.JamesReducedProduct.filtration) is exhaustive, multiplicative, closed and compact under the expected hypotheses. This is the object on which the James map, the James–Hopf map and EHP will be built.
- **Skew-adjoint metrics on Clifford modules** — every module over a negative-definite Clifford algebra with a finite orthogonal basis squaring to −1 admits a positive-definite symmetric form for which Clifford vectors act skew-adjointly ([`AlgHom.exists_posDef_isSymm_isSkewAdjoint_map_cliffordAlgebraι`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/CliffordAlgebra/Module/Metric.html#AlgHom.exists_posDef_isSymm_isSkewAdjoint_map_cliffordAlgebraι)). It is the finite-module metric adapter that 3C.5 needs before the fields Aᵢx become orthonormal tangent frames on spheres.

### Roadmap coverage

Layer 3 is partial. Section 3B.1 is largely in place: reduced words, multiplication, the unit, functoriality and the filtration. It still lacks joint continuity of the multiplication on the compactly generated product and compatibility with CW structures. Section 3B.2's smash-power quotients and 3B.3–3B.6 (the James map, the connected equivalence, James–Hopf and the splitting) are absent. In 3C.5, the metric adapter and the formal Adams-operation test are present, but the Hopf invariant, the cone K-theory and the frames are not. The pointed cone and Puppe constructions and stable stems (3A), and EHP, Toda brackets and Barratt–Toda (3C.1–3C.4), are untouched. Layers 1, 2, 4, 5, 6, 7, 8, 9, 9A and 10 are untouched.

## The frontier

- **Hopf invariant one exclusion** — define the integral Hopf invariant on the two-cell mapping cone, compute the reduced K-theory of the cone with its basis x, y and Adams operations, and feed it into the landed divisibility test. Prerequisites: the 3A.2 cone sequence, TopologicalKTheory T2.5 and T3–T4, and CharacteristicClasses C6.2–C6.3.
- **James filtration quotients and the James map (3B.2–3B.3)** — identify J_r X / J_(r−1) X with the r-fold smash power, prove multiplication continuous on the compactly generated product, and build J X → ΩΣX. This needs the AlgebraicTopology Stage 4 item 8 suspension–loop adjunction.
- **Clifford tangent frames on S¹, S³, S⁷** — build the real Clifford modules of dimensions 2, 4 and 8, transport the averaged metric, and prove that the fields Aᵢx frame the tangent spaces. This relies on SpinRepresentations L7. Together with the exclusion, it gives `sphere_parallelizable_iff`.
- **Pointed cones, Puppe sequences and stable stems (3A)** — these come before EHP and every stem calculation in Layers 8–9A.
- **Morse handles and the h-cobordism theorem (Layer 1)** — not begun. It depends on the GeometricTopology collar and handle APIs.
