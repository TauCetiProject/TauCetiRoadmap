<!--tauceti-status:v1 {"roadmap":"IntegralLattices","to_sha":"9d7938f58e17773edab07ee8284e55c8a5e2831f","ts":"2026-10-07T14:05:03+00:00"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 1","state":"done"},{"id":"Layer 2","state":"done"},{"id":"Layer 3","state":"done"},{"id":"Layer 4","remaining":"the bilinear H-perp/H comparison for integral odd overlattices and its componentwise form over orthogonal sums","state":"partial"},{"id":"Layer 5","state":"done"}],"readme_sha":"62339299e53699fc1778e9ce2bde6b15820d64f08460a86c36dce9e061b04d3f","roadmap":"IntegralLattices","to_sha":"9d7938f58e17773edab07ee8284e55c8a5e2831f"}-->
# Status: IntegralLattices

This file documents the status of the IntegralLattices roadmap up until `9d7938f` (2026-10-07T14:05:03+00:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The `D₈⁺ ≅ E₈` summit, the discriminant-form tables and the general lattice foundations are established. Layers 1, 2, 3 and 5 are done; Layer 4 remains partial because the bilinear `H⊥/H` comparison for odd overlattices and its componentwise form are not established. No layer in this five-layer roadmap is untouched.

### Named results

- **[The `D₈⁺ ≅ E₈` isometry](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/IntegralLattice/RootLattice/D8Plus/Isometry.html#TauCeti.IntegralLattice.typeE₈IsometryD8Plus)** — enlarging `D₈` by its spinor glue gives the `E₈` root lattice.
- **[Nikulin's even-overlattice correspondence](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/IntegralLattice/Overlattice/Isotropic.html#TauCeti.IntegralLattice.evenIntermediateCarrierOrderIsoIsotropicSubgroup)** — even overlattices of an even nondegenerate lattice correspond to quadratic-isotropic subgroups of its discriminant form.
- **[The discriminant form of an even overlattice](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/IntegralLattice/Overlattice/OrthogonalQuotient.html#TauCeti.IntegralLattice.IntermediateCarrier.discriminantOrthogonalQuotientIsometry)** — for a quadratic-isotropic subgroup `H`, the new discriminant form is isometric to `H⊥/H`.
- **[The Smith decomposition of the discriminant group](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/IntegralLattice/Discriminant/Smith.html#TauCeti.IntegralLattice.discriminantGroupInvariantFactorsEquiv)** — every nondegenerate lattice has cyclic discriminant factors whose orders form a divisibility chain and multiply to its discriminant.
- **[The Gauss-sum invariant](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/FiniteBilinearModule/GaussSum.html#TauCeti.FiniteQuadraticModule.gaussSign)** — the normalized Gauss sum of a nondegenerate finite quadratic module determines a class in `ℤ/8`, additive under orthogonal sums.

### Notable definitions and infrastructure

- **[Integral lattices](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/IntegralLattice/Basic.html#TauCeti.IntegralLattice)** use one full integer submodule of a rational space with an integral symmetric form; the same carrier accommodates indefinite and degenerate examples and supports the radical quotient.
- **[Finite quadratic modules](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/FiniteBilinearModule/Quadratic.html#TauCeti.FiniteQuadraticModule)** carry the `ℚ/ℤ`-valued forms used in the gluing theorem and the ADE calculations.

### Roadmap coverage

Layers 1 to 3 are done: the lattice and duality APIs, finite discriminant groups, and finite bilinear and quadratic modules are in place. Layer 5 is done, with the rank-one and ADE discriminant-form rows and the `D₈⁺ ≅ E₈` isometry. Layer 4 has its integral and even overlattice correspondences and the quadratic `H⊥/H` theorem, but remains partial: the corresponding bilinear isometry for an integral odd overlattice and the orthogonal-sum comparison are not established. The newer Gauss-sum and dyadic results extend the finite-form theory beyond this roadmap's completion criterion.

## The frontier

- **Bilinear discriminant comparison** — prove `A_{L_H} ≅ H⊥/H` as finite bilinear modules for an integral overlattice that need not be even; the existing even-overlattice theorem covers the quadratic case.
- **Orthogonal-sum comparison** — prove that the `H⊥/H` isometry splits componentwise for orthogonal sums, after the bilinear case is available.
