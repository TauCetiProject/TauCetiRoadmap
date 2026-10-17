<!--tauceti-status:v1 {"roadmap":"IntegralLattices","to_sha":"ead24a3b604c3df52bdc2b656f23d15d370ee0e8","ts":"2026-10-15T19:35:38+00:00"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 1","state":"done"},{"id":"Layer 2","state":"done"},{"id":"Layer 3","state":"done"},{"id":"Layer 4","remaining":"the bilinear H-perp/H comparison for integral odd overlattices and its componentwise orthogonal-sum form","state":"partial"},{"id":"Layer 5","state":"done"}],"readme_sha":"62339299e53699fc1778e9ce2bde6b15820d64f08460a86c36dce9e061b04d3f","roadmap":"IntegralLattices","to_sha":"ead24a3b604c3df52bdc2b656f23d15d370ee0e8"}-->
# Status: IntegralLattices

This file documents the status of the IntegralLattices roadmap up until `ead24a3` (2026-10-15T19:35:38+00:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The roadmap’s summit, the gluing construction `D₈⁺ ≅ E₈`, is proved, along with the general lattice, discriminant-form and ADE layers. Layer 4 remains partial on the supplied evidence: its bilinear quotient comparison for odd overlattices and the orthogonal-sum comparison are not established here. No planned layer is untouched.

### Named results

- **The `D₈⁺ ≅ E₈` isometry** — the spinor glue enlargement of `D₈` is [isometric to the `E₈` root lattice](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/IntegralLattice/RootLattice/D8Plus/Isometry.html#TauCeti.IntegralLattice.typeE₈IsometryD8Plus).
- **Nikulin’s even-overlattice correspondence** — [even overlattices](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/IntegralLattice/Overlattice/Isotropic.html#TauCeti.IntegralLattice.evenIntermediateCarrierOrderIsoIsotropicSubgroup) of an even nondegenerate lattice correspond to quadratic-isotropic subgroups of its discriminant group.
- **The discriminant form of an even overlattice** — the [quadratic discriminant module of `L_H`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/IntegralLattice/Overlattice/OrthogonalQuotient.html#TauCeti.IntegralLattice.IntermediateCarrier.discriminantOrthogonalQuotientIsometry) is isometric to `H⊥/H`.
- **The ADE discriminant forms** — the rank-one and ADE cases have explicit quadratic-module identifications, including [even](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/IntegralLattice/RootLattice/TypeD/Basic.html#TauCeti.IntegralLattice.checkerboardDiscriminantQuadraticIsometry) and [odd](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/IntegralLattice/RootLattice/TypeD/Basic.html#TauCeti.IntegralLattice.checkerboardCyclicQuadraticIsometry) `Dₙ`.
- **Hermite’s inequality** — for a positive definite integral lattice of rank `n ≥ 1`, [the minimum is at most `(4/3)^((n−1)/2) (det L)^(1/n)`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/IntegralLattice/PosDef/Hermite.html#TauCeti.IntegralLattice.IsPosDef.minimum_le_rpow_mul_determinant_rpow), with [equality for `A₂`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/IntegralLattice/RootLattice/TypeA/Hermite.html#TauCeti.IntegralLattice.minimum_typeARootLattice_two_eq_rpow_mul_determinant_rpow).

### Notable definitions and infrastructure

- The [integral lattice](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/IntegralLattice/Basic.html#TauCeti.IntegralLattice) is a full integer carrier in a rational space with an integral symmetric form; its radical quotient lets degenerate examples enter the nondegenerate theory.
- [Finite quadratic modules](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/FiniteBilinearModule/Quadratic.html#TauCeti.FiniteQuadraticModule) carry the `ℚ/ℤ`-valued half-norm forms used in the gluing theorem and ADE calculations.
- The [Gauss-sum invariant](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/FiniteBilinearModule/GaussSum.html#TauCeti.FiniteQuadraticModule.gaussSign) records a nondegenerate finite quadratic form’s normalized Gauss sum in `ℤ/8`; its additive and isotropic-reduction laws support later signature comparisons.

### Roadmap coverage

Layers 1, 2, 3 and 5 are done: they provide the lattice and duality APIs, finite forms, and all specified rank-one and ADE examples, culminating in `D₈⁺ ≅ E₈`. Layer 4 has the even-overlattice correspondence and quadratic `H⊥/H` theorem, but remains partial because the supplied declarations do not establish the bilinear version for integral odd overlattices or its componentwise form over orthogonal sums. Hermite’s bound, successive minima and the Gauss-sum theory extend beyond this roadmap’s completion criterion.

## The frontier

- **Odd-overlattice quotient** — prove the bilinear isometry `A_{L_H} ≅ H⊥/H` when `L_H` is integral but need not be even, using the existing intermediate-lattice correspondence.
- **Orthogonal-sum compatibility** — prove the componentwise `H⊥/H` comparison under orthogonal sums, after the bilinear comparison is available.
- **Root-data bridge** — construct a general map from Tau Ceti’s pinned root data to integral lattices with the stated Cartan Gram matrix; the existing ADE examples use specific coordinate models.
