<!--tauceti-status:v1 {"roadmap":"IntegralLattices","to_sha":"6b896c7c411221eb78639e4be8ead6e479a62893","ts":"2026-10-13T10:00:25+00:00"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 1","state":"done"},{"id":"Layer 2","state":"done"},{"id":"Layer 3","state":"done"},{"id":"Layer 4","remaining":"the bilinear H-perp/H comparison for integral odd overlattices and its componentwise orthogonal-sum form","state":"partial"},{"id":"Layer 5","state":"done"}],"readme_sha":"62339299e53699fc1778e9ce2bde6b15820d64f08460a86c36dce9e061b04d3f","roadmap":"IntegralLattices","to_sha":"6b896c7c411221eb78639e4be8ead6e479a62893"}-->
# Status: IntegralLattices

This file documents the status of the IntegralLattices roadmap up until `6b896c7` (2026-10-13T10:00:25+00:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The `D₈⁺ ≅ E₈` glue calculation and the ADE discriminant-form table are proved. Layers 1 to 3 and 5 are done; Layer 4 remains partial because the bilinear quotient comparison for integral odd overlattices and its orthogonal-sum form are not established here. No listed layer is untouched.

### Named results

- **The `D₈⁺ ≅ E₈` isometry** — the spinor-glue enlargement of `D₈` is carried to the `E₈` root lattice by an explicit rational isometry ([`TauCeti.IntegralLattice.typeE₈IsometryD8Plus`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/IntegralLattice/RootLattice/D8Plus/Isometry.html#TauCeti.IntegralLattice.typeE₈IsometryD8Plus)).
- **Nikulin’s even-overlattice correspondence** — even overlattices of an even nondegenerate lattice correspond to quadratic-isotropic subgroups of its discriminant group ([`TauCeti.IntegralLattice.evenIntermediateCarrierOrderIsoIsotropicSubgroup`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/IntegralLattice/Overlattice/Isotropic.html#TauCeti.IntegralLattice.evenIntermediateCarrierOrderIsoIsotropicSubgroup)).
- **The discriminant form of an even overlattice** — for quadratic-isotropic `H`, the discriminant quadratic module of the associated even overlattice is `H⊥/H` ([`TauCeti.IntegralLattice.IntermediateCarrier.discriminantOrthogonalQuotientIsometry`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/IntegralLattice/Overlattice/OrthogonalQuotient.html#TauCeti.IntegralLattice.IntermediateCarrier.discriminantOrthogonalQuotientIsometry)).
- **The ADE discriminant forms** — the `Aₙ`, `Dₙ`, `E₆`, `E₇` and `E₈` calculations identify the quadratic values as well as the underlying groups, including the parity-dependent `Dₙ` cases ([`TauCeti.IntegralLattice.checkerboardDiscriminantQuadraticIsometry`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/IntegralLattice/RootLattice/TypeD/Basic.html#TauCeti.IntegralLattice.checkerboardDiscriminantQuadraticIsometry)).
- **The discriminant-group invariant factors** — the Smith factors of any nondegenerate Gram matrix give a cyclic decomposition of the discriminant group, with product `|det L|` ([`TauCeti.IntegralLattice.discriminantGroupInvariantFactorsEquiv`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/IntegralLattice/Discriminant/Smith.html#TauCeti.IntegralLattice.discriminantGroupInvariantFactorsEquiv)).

### Notable definitions and infrastructure

- [`TauCeti.IntegralLattice`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/IntegralLattice/Basic.html#TauCeti.IntegralLattice) packages a full integral carrier and symmetric rational form; its radical quotient lets degenerate examples enter the nondegenerate theory.
- [`TauCeti.FiniteQuadraticModule`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/FiniteBilinearModule/Quadratic.html#TauCeti.FiniteQuadraticModule) provides the setting for finite `ℚ/ℤ`-valued forms, orthogonal quotients and the gluing calculation.
- [`TauCeti.IntegralLattice.discriminantQuadraticModule`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/IntegralLattice/Discriminant/Quadratic.html#TauCeti.IntegralLattice.discriminantQuadraticModule) gives an even lattice its half-norm form, compatible with isometries and orthogonal sums.

### Roadmap coverage

Layers 1, 2 and 3 supply the lattice, duality and finite-form APIs, and Layer 5 supplies the rank-one and ADE checks, including the `D₈⁺` glue example; all four are done. Layer 4 has the even-overlattice correspondence, its quadratic `H⊥/H` comparison and the index and determinant laws, but remains partial pending the bilinear comparison for integral odd overlattices and the componentwise orthogonal-sum statement.

## The frontier

- **Odd-overlattice quotient** — prove that the discriminant bilinear module of an integral overlattice associated to bilinear-isotropic `H` is isometric to `H⊥/H`.
- **Orthogonal-sum compatibility** — prove that the quotient comparison splits componentwise for orthogonal sums of lattices and isotropic subgroups.
- **Root-data bridge** — construct integral lattices directly from Tau Ceti’s pinned root data with the prescribed Cartan Gram matrices; the ADE examples currently use coordinate models, which the README permits.
