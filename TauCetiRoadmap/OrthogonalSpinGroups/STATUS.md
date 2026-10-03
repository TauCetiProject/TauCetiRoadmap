<!--tauceti-status:v1 {"roadmap":"OrthogonalSpinGroups","to_sha":"e440f4eb3fccf5479ede3f5d6a671b4be37c9dde","ts":"2026-09-30T05:46:25Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","remaining":"the worked examples: SO(H) isomorphic to K-units through the diagonal torus, and O(Q) = {±1} in dimension one","state":"partial"},{"id":"Layer 1","remaining":"1F readings in dimensions 3, 4 (split and nonsplit) and 5 over a general field; the general-field ungraded centre of 1B","state":"partial"},{"id":"Layer 2","remaining":"2B for SO and Spin, local compactness; compactness criteria 2D, 2G; open spinor kernel 2E; anisotropic p-adic rows and kernel indices of 2F","state":"partial"},{"id":"Layer 3","remaining":"all of 3C to 3G: compact-open data, adelic O, SO and Spin, diagonals, adelic spinor norm, double cosets; needs the topology of 2B","state":"untouched"}],"readme_sha":"0196a284802bf6a05f9aaa6553a77acc64a11dad2fe2520cdecd90f91d31c435","roadmap":"OrthogonalSpinGroups","to_sha":"e440f4eb3fccf5479ede3f5d6a671b4be37c9dde"}-->
# Status: OrthogonalSpinGroups

This file documents the status of the OrthogonalSpinGroups roadmap up until `e440f4e` (2026-09-30T05:46:25Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** No layer is complete, but Layers 0 and 1 are close: Layer 0 lacks only its worked examples, and Layer 1 has its whole comparison sequence and the identification Spin = U(C₀, σ) in dimensions one to five, lacking the dimension-by-dimension readings and the general-field ungraded centre. Layer 2 has its transvections, part of its local spinor-norm table and the first local topology; Layer 3 has not begun.

### Named results

- **The image of Spin is the spinor kernel** — for a nondegenerate finite-dimensional space over a field of characteristic not two, the image of `Spin(Q) → SO(Q)` is exactly the kernel of the spinor norm ([`range_spinToSpecialOrthogonal_eq_ker_spinorNorm`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/CliffordAlgebra/Spin/SpinorNorm/Basic.html#CliffordAlgebra.range_spinToSpecialOrthogonal_eq_ker_spinorNorm)).
- **Spin is the even unitary group up to dimension five** — for nondegenerate Q with `1 ≤ dim V ≤ 5`, every even Clifford unit with `reverse x * x = 1` is a Lipschitz element, so Spin(Q) = U(C₀, σ) on the nose ([`evenUnitaryGroup_le_lipschitzGroup`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/CliffordAlgebra/Spin/LowRank/Five.html#CliffordAlgebra.evenUnitaryGroup_le_lipschitzGroup)).
- **…and not beyond** — over an infinite field of characteristic not two, Spin is a proper subgroup of U(C₀, σ) in every dimension at least six ([`range_spinGroup_toUnits_ne_evenUnitaryGroup_of_six_le_finrank`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/CliffordAlgebra/Spin/LowRank/Six.html#CliffordAlgebra.range_spinGroup_toUnits_ne_evenUnitaryGroup_of_six_le_finrank)), with the split rational witness in dimension six.
- **Mathlib's Lipschitz group is the classical Clifford group** — for a nondegenerate form representing a unit, a Clifford unit lies in the closure-defined carrier exactly when its twisted conjugation preserves the vectors ([`mem_lipschitzGroup_iff_involute_act_ι_mem_range_ι`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/CliffordAlgebra/Lipschitz/CliffordGroup.html#CliffordAlgebra.mem_lipschitzGroup_iff_involute_act_ι_mem_range_ι)), settling the converse Mathlib's docstring leaves open.
- **Spin lifts of Eichler transvections** — for a nonzero isotropic `u`, `w ↦ 1 + ι w · ι u` is an injective homomorphism from `u^⊥ / K·u` into Spin(Q) lifting the transvections `E_{u,w}` ([`spinToSpecialOrthogonal_comp_spinTransvectionHom`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/CliffordAlgebra/Spin/Transvection.html#CliffordAlgebra.spinToSpecialOrthogonal_comp_spinTransvectionHom)), now also continuous and compatible with base change.

### Notable definitions and infrastructure

- [`cliffordNorm`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/CliffordAlgebra/Lipschitz/ReverseNorm.html#CliffordAlgebra.cliffordNorm), the reverse norm on the Lipschitz group, equal to `Q v` on a vector; the spinor norm descends from it, and a Lipschitz element scales into Spin exactly when it is even with square norm ([`exists_scalarUnits_mul_mem_spinGroup_iff`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/CliffordAlgebra/Lipschitz/ReverseNorm.html#CliffordAlgebra.exists_scalarUnits_mul_mem_spinGroup_iff)).
- [`spinGroupBaseChange`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/CliffordAlgebra/Spin/BaseChange.html#CliffordAlgebra.spinGroupBaseChange), with its Lipschitz and orthogonal companions, the maps along a field extension that Layer 3 will localize with.
- The topological group structure on `V ≃ₗ[K] V` from `f ↦ (f, f⁻¹)` ([`instIsTopologicalGroupLinearEquiv`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Topology/Algebra/Module/GeneralLinearGroup.html#TauCeti.instIsTopologicalGroupLinearEquiv)), the single topology 2B asks every orthogonal point group to inherit.

### Roadmap coverage

Layer 0 is partial: 0A to 0F are proved, 0C now including `SO(Q) ≃* SO(B)` for the polar form, but its worked examples (SO of the hyperbolic plane through the diagonal torus, `O(Q) = {±1}` in dimension one) are not stated. Layer 1 is partial: 1A, 1C, 1D and 1E are done, including base change of the vector representation, the named rescaling criterion and the rational rejection test; 1B lacks the general-field ungraded centre; 1F has Spin = U(C₀, σ) in dimensions one to five and strictness from six on, but of the readings by dimension only the compact real three-dimensional case (unit quaternions) exists. Layer 2 is partial: 2C and 2H are done; 2F has its real, dimension-one and isotropic rows; 2A and 2B have the topological group `V ≃ₗ[K] V`, Hausdorff and locally compact module topologies and closedness of O(Q), with SO, Spin and local compactness of the point groups outstanding; 2D, 2E and 2G have only compactness of the standard real SO(n) and Spin(n) and continuity of the Clifford norm. Layer 3 is untouched.

## The frontier

- **Point groups as topological groups (2B)** — SO(Q) closed and open in O(Q), local compactness of O(Q) and SO(Q), Spin(Q) closed and locally compact, and continuity of the determinant, of `spinToSpecialOrthogonal` and of the base-change maps.
- **Open spinor kernel (2E)** — the continuous Clifford norm is in place; what remains is openness of the square-class quotient and the descent of θ, giving `ker θ` open in O(Q).
- **Anisotropic p-adic rows (2F)** — the image for an anisotropic binary form over `ℚ_p` (index two, the norms from its discriminant extension), surjectivity in dimension at least three, and the local kernel indices 4 and 8.
- **Low-rank readings (1F)** — C₀ as a quaternion algebra in dimension three over a general field, the split and nonsplit dimension-four cases, and the symplectic reading in dimension five; the reduced-norm identification in dimension six belongs to AlgebrasWithInvolution.
- **Adelic points (Layer 3)** — the restricted-product carriers exist, but the compact-open data of 3C are stated against the topology of 2B and wait on it, and on properness of Spin → SO from 2D.
