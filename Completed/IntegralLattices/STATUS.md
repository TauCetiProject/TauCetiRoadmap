<!--tauceti-status:v1 {"roadmap":"IntegralLattices","to_sha":"3f152d13bafc0d5e14a4078b4d288b90965dd0c5","ts":"2026-10-10T08:53:26+00:00"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 1","state":"done"},{"id":"Layer 2","state":"done"},{"id":"Layer 3","state":"done"},{"id":"Layer 4","remaining":"the bilinear H-perp/H comparison for integral odd overlattices and its orthogonal-sum compatibility","state":"partial"},{"id":"Layer 5","state":"done"}],"readme_sha":"62339299e53699fc1778e9ce2bde6b15820d64f08460a86c36dce9e061b04d3f","roadmap":"IntegralLattices","to_sha":"3f152d13bafc0d5e14a4078b4d288b90965dd0c5"}-->
# Status: IntegralLattices

This file documents the status of the IntegralLattices roadmap up until `3f152d1` (2026-10-10T08:53:26+00:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The roadmap’s principal gluing result and its ADE examples are formalized. Layers 1, 2, 3 and 5 are done; Layer 4 remains partial because the bilinear comparison for integral odd overlattices and its orthogonal-sum form are not established in the supplied evidence.

### Named results

- **The `D₈⁺ ≅ E₈` isometry** — spinor glue enlarges the checkerboard lattice `D₈` to a lattice explicitly isometric to the `E₈` root lattice ([`TauCeti.IntegralLattice.typeE₈IsometryD8Plus`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/IntegralLattice/RootLattice/D8Plus/Isometry.html#TauCeti.IntegralLattice.typeE₈IsometryD8Plus)).
- **Nikulin’s even-overlattice correspondence** — even overlattices of an even nondegenerate lattice correspond, in order, to quadratic-isotropic subgroups of its discriminant group ([`TauCeti.IntegralLattice.evenIntermediateCarrierOrderIsoIsotropicSubgroup`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/IntegralLattice/Overlattice/Isotropic.html#TauCeti.IntegralLattice.evenIntermediateCarrierOrderIsoIsotropicSubgroup)).
- **The discriminant form of an even overlattice** — for quadratic-isotropic `H`, the new discriminant form is isometric to `H⊥/H` ([`TauCeti.IntegralLattice.IntermediateCarrier.discriminantOrthogonalQuotientIsometry`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/IntegralLattice/Overlattice/OrthogonalQuotient.html#TauCeti.IntegralLattice.IntermediateCarrier.discriminantOrthogonalQuotientIsometry)).
- **The ADE discriminant forms** — explicit quadratic-module isometries verify the `A`, `D` and exceptional `E` tables, including half-norm values; the [even `Dₙ` calculation](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/IntegralLattice/RootLattice/TypeD/Basic.html#TauCeti.IntegralLattice.checkerboardDiscriminantQuadraticIsometry) is one example.
- **The cyclic decomposition of the discriminant group** — its factors are the Smith invariant factors of the Gram matrix for every nondegenerate lattice, including indefinite ones ([`TauCeti.IntegralLattice.discriminantGroupInvariantFactorsEquiv`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/IntegralLattice/Discriminant/Smith.html#TauCeti.IntegralLattice.discriminantGroupInvariantFactorsEquiv)).

### Notable definitions and infrastructure

- [`TauCeti.IntegralLattice`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/IntegralLattice/Basic.html#TauCeti.IntegralLattice) packages a full integral carrier with its symmetric form, allowing the same framework to handle indefinite and degenerate examples.
- [`TauCeti.FiniteQuadraticModule`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/FiniteBilinearModule/Quadratic.html#TauCeti.FiniteQuadraticModule) hosts the `ℚ/ℤ`-valued forms used by the ADE calculations and gluing theorem; new odd-order decomposition and dyadic cyclic presentations extend this foundation.
- [`TauCeti.IntegralLattice.discriminantQuadraticModule`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/IntegralLattice/Discriminant/Quadratic.html#TauCeti.IntegralLattice.discriminantQuadraticModule) gives even lattices the half-norm form needed to compare their overlattices.

### Roadmap coverage

Layers 1–3 are done: the lattice, duality and finite-form APIs support the gluing calculation. Layer 5 is done, including the rank-one and ADE forms and the `D₈` glue example. Layer 4 has its correspondence, index laws and even-overlattice quadratic comparison, but still lacks the bilinear `A_{L_H} ≅ H⊥/H` theorem for integral odd overlattices and the componentwise orthogonal-sum statement. The new positive definite bounds belong to the broader quadratic-forms programme and do not close those gaps.

## The frontier

- **Odd-overlattice discriminant comparison** — construct the bilinear isometry `A_{L_H} ≅ H⊥/H` for an integral overlattice that need not be even, using the existing subgroup correspondence and orthogonal quotient.
- **Orthogonal-sum compatibility** — prove that the comparison for an overlattice of an orthogonal sum agrees componentwise with those for its summands.
