<!--tauceti-status:v1 {"roadmap":"IntegralLattices","to_sha":"df51a897f47dacef2dc5f45a9f0ac5b1d40fd313","ts":"2026-10-06T10:29:26+00:00"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 1","state":"done"},{"id":"Layer 2","state":"done"},{"id":"Layer 3","state":"done"},{"id":"Layer 4","remaining":"the bilinear H-perp/H comparison for integral odd overlattices and its orthogonal-sum form","state":"partial"},{"id":"Layer 5","state":"done"}],"readme_sha":"62339299e53699fc1778e9ce2bde6b15820d64f08460a86c36dce9e061b04d3f","roadmap":"IntegralLattices","to_sha":"df51a897f47dacef2dc5f45a9f0ac5b1d40fd313"}-->
# Status: IntegralLattices

This file documents the status of the IntegralLattices roadmap up until `df51a89` (2026-10-06T10:29:26+00:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The `D₈⁺ ≅ E₈` glue calculation, the ADE discriminant forms, and the general even-overlattice theory meet the roadmap's completion criterion. Layers 1, 2, 3 and 5 are done; Layer 4 remains partial at the bilinear comparison for integral overlattices that need not be even and its orthogonal-sum form. No layer is untouched.

### Named results

- **The `D₈⁺ ≅ E₈` isometry** — the spinor glue enlargement of `D₈` is isometric to the `E₈` root lattice by an explicit rational map ([`TauCeti.IntegralLattice.typeE₈IsometryD8Plus`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/IntegralLattice/RootLattice/D8Plus/Isometry.html#TauCeti.IntegralLattice.typeE₈IsometryD8Plus)).
- **Nikulin's even-overlattice correspondence** — even overlattices of an even nondegenerate lattice correspond to quadratic-isotropic subgroups of its discriminant form ([`TauCeti.IntegralLattice.evenIntermediateCarrierOrderIsoIsotropicSubgroup`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/IntegralLattice/Overlattice/Isotropic.html#TauCeti.IntegralLattice.evenIntermediateCarrierOrderIsoIsotropicSubgroup)).
- **The orthogonal-quotient formula for even overlattices** — the discriminant quadratic form of the overlattice associated to `H` is isometric to `H⊥/H` ([`TauCeti.IntegralLattice.IntermediateCarrier.discriminantOrthogonalQuotientIsometry`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/IntegralLattice/Overlattice/OrthogonalQuotient.html#TauCeti.IntegralLattice.IntermediateCarrier.discriminantOrthogonalQuotientIsometry)).
- **The ADE discriminant forms** — the explicit cyclic and Klein-four models identify the quadratic values, including both spinor classes of even `Dₙ` ([`TauCeti.IntegralLattice.checkerboardDiscriminantQuadraticIsometry`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/IntegralLattice/RootLattice/TypeD/Basic.html#TauCeti.IntegralLattice.checkerboardDiscriminantQuadraticIsometry)).
- **The Smith decomposition of the discriminant group** — the cyclic factors of `A_L` are the Gram matrix's Smith invariant factors for every nondegenerate lattice ([`TauCeti.IntegralLattice.discriminantGroupInvariantFactorsEquiv`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/IntegralLattice/Discriminant/Smith.html#TauCeti.IntegralLattice.discriminantGroupInvariantFactorsEquiv)).

### Notable definitions and infrastructure

- [`TauCeti.IntegralLattice`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/IntegralLattice/Basic.html#TauCeti.IntegralLattice) bundles a full integral carrier with its rational symmetric form; its radical quotient lets degenerate examples enter the nondegenerate theory.
- [`TauCeti.FiniteQuadraticModule`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/FiniteBilinearModule/Quadratic.html#TauCeti.FiniteQuadraticModule) supplies the `ℚ/ℤ`-valued forms in which gluing and the ADE calculations are stated.
- [Restriction of an integral lattice](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/IntegralLattice/Restriction.html#TauCeti.IntegralLattice.restrict) now realizes a carrier submodule in its own rationalization, making its induced form available as an integral lattice.

### Roadmap coverage

Layers 1, 2, 3 and 5 are done: the lattice and duality APIs, finite bilinear and quadratic modules, every rank-one and ADE table row, and the `D₈⁺ ≅ E₈` isometry are in place. Layer 4 is partial. Its even-overlattice correspondence and quadratic `H⊥/H` theorem are proved, but the supplied declarations do not establish the bilinear `H⊥/H` isometry for integral overlattices that may be odd or its componentwise form over orthogonal sums.

## The frontier

- **Bilinear orthogonal-quotient formula** — establish `A_{L_H} ≅ H⊥/H` as finite bilinear modules for every integral overlattice, including odd ones.
- **Orthogonal-sum compatibility** — prove that the bilinear comparison for an overlattice of an orthogonal sum agrees componentwise with the comparisons for its summands; this depends on the bilinear formula above.
