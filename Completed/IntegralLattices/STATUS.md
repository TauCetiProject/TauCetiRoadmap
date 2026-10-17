<!--tauceti-status:v1 {"roadmap":"IntegralLattices","to_sha":"350ad38b42d6006b517d1e8c86c9c32ba88e0990","ts":"2026-10-17T14:09:55+00:00"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 1","state":"done"},{"id":"Layer 2","state":"done"},{"id":"Layer 3","state":"done"},{"id":"Layer 4","remaining":"the bilinear H-perp/H comparison for integral odd overlattices and its componentwise orthogonal-sum form","state":"partial"},{"id":"Layer 5","state":"done"}],"readme_sha":"62339299e53699fc1778e9ce2bde6b15820d64f08460a86c36dce9e061b04d3f","roadmap":"IntegralLattices","to_sha":"350ad38b42d6006b517d1e8c86c9c32ba88e0990"}-->
# Status: IntegralLattices

This file documents the status of the IntegralLattices roadmap up until `350ad38` (2026-10-17T14:09:55+00:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The `D₈⁺ ≅ E₈` glue calculation, the ADE discriminant forms, and Layers 1–3 and 5 are complete. Layer 4 remains partial: the bilinear orthogonal-quotient comparison for integral odd overlattices and its componentwise orthogonal-sum form are not established in the supplied evidence.

### Named results

- **[The `D₈⁺ ≅ E₈` isometry](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/IntegralLattice/RootLattice/D8Plus/Isometry.html#TauCeti.IntegralLattice.typeE₈IsometryD8Plus)** — the spinor glue enlargement of `D₈` is explicitly isometric to the `E₈` root lattice.
- **[Nikulin’s even-overlattice correspondence](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/IntegralLattice/Overlattice/Isotropic.html#TauCeti.IntegralLattice.evenIntermediateCarrierOrderIsoIsotropicSubgroup)** — even overlattices between `L` and `L^∨` correspond in order to quadratic-isotropic subgroups of `A_L`.
- **[The orthogonal-quotient formula for even overlattices](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/IntegralLattice/Overlattice/OrthogonalQuotient.html#TauCeti.IntegralLattice.IntermediateCarrier.discriminantOrthogonalQuotientIsometry)** — the discriminant quadratic module of the overlattice attached to `H` is isometric to `H^⊥/H`.
- **[Nikulin’s odd-order decomposition](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/FiniteBilinearModule/OddCyclic/Decomposition.html#TauCeti.FiniteQuadraticModule.exists_isometry_pi_oddCyclic)** — every nondegenerate finite quadratic module of odd order splits orthogonally into cyclic prime-power forms.
- **[Gauss sums under isotropic reduction](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/FiniteBilinearModule/Orthogonal/GaussSum.html#TauCeti.FiniteQuadraticModule.gaussSum_eq_card_mul_gaussSum_orthogonalQuotient)** — for a quadratic-isotropic subgroup `H`, the Gauss sum of `A` is `|H|` times that of `H^⊥/H`.

### Notable definitions and infrastructure

- [The integral lattice carrier](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/IntegralLattice/Basic.html#TauCeti.IntegralLattice) admits indefinite and degenerate forms; its radical quotient connects the latter to nondegenerate duality and gluing.
- [Finite quadratic modules](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/FiniteBilinearModule/Quadratic.html#TauCeti.FiniteQuadraticModule) provide the common setting for discriminant forms, isotropic subgroups, orthogonal quotients and the newer cyclic classifications.
- [The Gauss-sum invariant](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/FiniteBilinearModule/GaussSum.html#TauCeti.FiniteQuadraticModule.gaussSign) records a nondegenerate module’s normalized Gauss sum in `ℤ/8`, making the new generator calculations comparable across orthogonal sums and isotropic reduction.

### Roadmap coverage

Layers 1 and 2 have the lattice, duality and Smith-invariant APIs; Layer 3 has the finite bilinear and quadratic module theory and lattice discriminant forms. Layer 5’s rank-one and ADE tables, including the `D₈⁺ ≅ E₈` glue calculation, are complete. Layer 4 has the even and bilinear-isotropic overlattice correspondences, the even quadratic `H^⊥/H` comparison, and index and discriminant laws, but lacks the odd integral bilinear comparison and its componentwise orthogonal-sum statement. Thus Layers 1, 2, 3 and 5 are done, and Layer 4 is partial.

## The frontier

- **Odd integral overlattices** — construct the bilinear isometry `A_{L_H} ≅ H^⊥/H` for an integral overlattice that need not be even, using the existing bilinear-isotropic correspondence.
- **Orthogonal-sum compatibility** — prove the orthogonal-quotient comparison componentwise for sums of overlattices; the discriminant module already splits over orthogonal sums.
- **Root-data bridge** — optionally turn Tau Ceti’s pinned ADE root data directly into integral lattices with the prescribed Cartan Gram matrices; the table computations already use coordinate models permitted by the README.
