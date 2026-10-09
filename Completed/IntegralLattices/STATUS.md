<!--tauceti-status:v1 {"roadmap":"IntegralLattices","to_sha":"bdec933eca464ae2426e89369969b804a858e735","ts":"2026-10-08T22:11:39+00:00"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 1","state":"done"},{"id":"Layer 2","state":"done"},{"id":"Layer 3","state":"done"},{"id":"Layer 4","remaining":"the odd bilinear H-perp/H comparison and its componentwise form over orthogonal sums","state":"partial"},{"id":"Layer 5","state":"done"}],"readme_sha":"62339299e53699fc1778e9ce2bde6b15820d64f08460a86c36dce9e061b04d3f","roadmap":"IntegralLattices","to_sha":"bdec933eca464ae2426e89369969b804a858e735"}-->
# Status: IntegralLattices

This file documents the status of the IntegralLattices roadmap up until `bdec933` (2026-10-08T22:11:39+00:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The `D₈⁺ ≅ E₈` gluing result and the roadmap’s general lattice, duality, finite-form, and ADE layers are done. The overlattice layer remains partial: its even quadratic comparison is proved, while the odd bilinear comparison and its componentwise orthogonal-sum form are not established here. No layer is untouched.

### Named results

- **The `D₈⁺ ≅ E₈` isometry** — spinor glue enlarges `D₈` to a lattice explicitly isometric to the `E₈` root lattice ([`TauCeti.IntegralLattice.typeE₈IsometryD8Plus`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/IntegralLattice/RootLattice/D8Plus/Isometry.html#TauCeti.IntegralLattice.typeE₈IsometryD8Plus)).
- **Nikulin’s even-overlattice correspondence** — even overlattices between `L` and `L^∨` correspond in order to quadratic-isotropic subgroups of `A_L` ([`TauCeti.IntegralLattice.evenIntermediateCarrierOrderIsoIsotropicSubgroup`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/IntegralLattice/Overlattice/Isotropic.html#TauCeti.IntegralLattice.evenIntermediateCarrierOrderIsoIsotropicSubgroup)).
- **The discriminant form of an even overlattice** — for quadratic-isotropic `H`, the new discriminant form is isometric to `H⊥/H` ([`TauCeti.IntegralLattice.IntermediateCarrier.discriminantOrthogonalQuotientIsometry`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/IntegralLattice/Overlattice/OrthogonalQuotient.html#TauCeti.IntegralLattice.IntermediateCarrier.discriminantOrthogonalQuotientIsometry)).
- **The ADE discriminant forms** — the rank-one and ADE examples identify discriminant quadratic modules with their stated cyclic or Klein-four models, including their half-norm values (for example, [`TauCeti.IntegralLattice.checkerboardDiscriminantQuadraticIsometry`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/IntegralLattice/RootLattice/TypeD/Basic.html#TauCeti.IntegralLattice.checkerboardDiscriminantQuadraticIsometry)).
- **Hermite’s inequality** — for a positive definite rank-`n` integral lattice, `min L ≤ (4/3)^((n−1)/2) (det L)^(1/n)`, a result beyond this roadmap’s gluing scope ([`TauCeti.IntegralLattice.IsPosDef.minimum_le_rpow_mul_determinant_rpow`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/IntegralLattice/PosDef/Hermite.html#TauCeti.IntegralLattice.IsPosDef.minimum_le_rpow_mul_determinant_rpow)).

### Notable definitions and infrastructure

- [`TauCeti.IntegralLattice`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/IntegralLattice/Basic.html#TauCeti.IntegralLattice) keeps the carrier, integral symmetric form, and rational ambient space together, so duals and overlattices live in the same space.
- [`TauCeti.FiniteQuadraticModule`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/FiniteBilinearModule/Quadratic.html#TauCeti.FiniteQuadraticModule) supplies the `ℚ/ℤ`-valued half-norm setting for discriminant forms, orthogonal quotients, and gluing.
- The [`scale ideal`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/IntegralLattice/Ideals.html#TauCeti.IntegralLattice.scaleIdeal) and [`norm ideal`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/IntegralLattice/Ideals.html#TauCeti.IntegralLattice.normIdeal) record pairing and self-pairing values for later local arithmetic.

### Roadmap coverage

Layers 1, 2, 3, and 5 are done: the bundled lattice and radical quotient, dual and Smith descriptions of `A_L`, finite forms, and all rank-one and ADE tests were established earlier. Layer 4 has the intermediate-lattice correspondence, even-overlattice gluing, and the `D₈⁺` example; its odd bilinear `H⊥/H` comparison and the componentwise orthogonal-sum statement remain unestablished by the supplied declarations. New Gauss-sum, decomposition, and Hermite results extend the surrounding theory without changing that five-layer verdict.

## The frontier

- **Odd-overlattice discriminant form** — prove the natural bilinear isometry `A_{L_H} ≅ H⊥/H` for an integral overlattice that need not be even; the subgroup correspondence is already available.
- **Orthogonal-sum comparison** — prove that the overlattice discriminant-form isometry respects orthogonal sums componentwise, including the odd bilinear case.
- **Root-data bridge** — construct a general lattice from Tau Ceti’s pinned root data and identify its Cartan Gram matrix; the ADE calculations currently use explicit Cartan or coordinate models.
