<!--tauceti-status:v1 {"roadmap":"IntegralLattices","to_sha":"d9aa9a97a4bbac408801d24d6faf32e5f3994f62","ts":"2026-10-20T14:37:01+11:00"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 1","state":"done"},{"id":"Layer 2","state":"done"},{"id":"Layer 3","state":"done"},{"id":"Layer 4","state":"done"},{"id":"Layer 5","state":"done"}],"readme_sha":"62339299e53699fc1778e9ce2bde6b15820d64f08460a86c36dce9e061b04d3f","roadmap":"IntegralLattices","to_sha":"d9aa9a97a4bbac408801d24d6faf32e5f3994f62"}-->
# Status: IntegralLattices

This file documents the status of the IntegralLattices roadmap up until `d9aa9a9` (2026-10-20T14:37:01+11:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The five-layer roadmap is complete: the lattice and finite-form APIs support the overlattice correspondence, the ADE discriminant calculations, and the `D₈⁺ ≅ E₈` glue isometry. The broader finite-form classification has partial dyadic results, but no required layer of this roadmap remains partial or untouched.

### Named results

- **[The `D₈⁺ ≅ E₈` isometry](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/IntegralLattice/RootLattice/D8Plus/Isometry.html#TauCeti.IntegralLattice.typeE₈IsometryD8Plus)** — spinor glue enlarges `D₈` to a lattice explicitly isometric to the `E₈` root lattice.
- **[Nikulin's even-overlattice correspondence](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/IntegralLattice/Overlattice/Isotropic.html#TauCeti.IntegralLattice.evenIntermediateCarrierOrderIsoIsotropicSubgroup)** — even overlattices of an even lattice correspond to quadratic-isotropic subgroups of its discriminant module.
- **[The orthogonal-quotient comparison](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/IntegralLattice/Overlattice/OrthogonalQuotient.html#TauCeti.IntegralLattice.IntermediateCarrier.discriminantOrthogonalQuotientIsometry)** — the discriminant quadratic form of an even overlattice is `H⊥/H`; the [bilinear version](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/IntegralLattice/Overlattice/OrthogonalQuotient/Bilinear.html#TauCeti.IntegralLattice.IntermediateCarrier.discriminantBilinearOrthogonalQuotientIsometry) covers integral overlattices that may be odd.
- **[The ADE discriminant forms](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/IntegralLattice/RootLattice/TypeD/Basic.html#TauCeti.IntegralLattice.checkerboardDiscriminantQuadraticIsometry)** — the rank-one and ADE tables identify the finite quadratic modules and their half-norm values, with the type `D` result illustrating the noncyclic case.
- **[Nikulin's odd-order decomposition](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/FiniteBilinearModule/OddCyclic/Decomposition.html#TauCeti.FiniteQuadraticModule.exists_isometry_pi_oddCyclic)** — every nondegenerate quadratic module of odd order splits into cyclic prime-power forms.

### Notable definitions and infrastructure

- [Integral lattices](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/IntegralLattice/Basic.html#TauCeti.IntegralLattice) share one carrier for definite, indefinite and degenerate forms; the radical quotient and restriction constructions let the general API reach each case.
- [Finite quadratic modules](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/FiniteBilinearModule/Quadratic.html#TauCeti.FiniteQuadraticModule) carry the `ℚ/ℤ`-valued forms used in gluing; their [Gauss-sum invariant](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/FiniteBilinearModule/GaussSum.html#TauCeti.FiniteQuadraticModule.gaussSign) also supports calculations beyond the original charter.
- The [discriminant quadratic module](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/IntegralLattice/Discriminant/Quadratic.html#TauCeti.IntegralLattice.discriminantQuadraticModule) connects an even lattice to its finite form, enabling the gluing theorem and the ADE calculations.

### Roadmap coverage

Layers 1 to 3 are done, including duality and the finite discriminant-group API; Layer 2's Smith invariant factors cover every nondegenerate lattice. Layer 4 is done: the odd bilinear quotient and its [orthogonal-sum comparison](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/IntegralLattice/Overlattice/OrthogonalQuotient/OrthogonalSum.html#TauCeti.IntegralLattice.IntermediateCarrier.discriminantQuadraticOrthogonalQuotientIsometryOrthogonalSum) close the two gaps recorded in the earlier status. Layer 5 is done, with all ADE table rows and the glue isometry verified.

## The frontier

- **General dyadic decomposition** — extend the cyclic and rank-two block results to arbitrary nondegenerate 2-primary quadratic modules; the supplied results do not establish a complete normal form or isometry decision procedure.
- **Pinned root-data bridge** — construct integral lattices directly from Tau Ceti's pinned root data with the Cartan Gram matrices; the completed roadmap permits coordinate constructions for its ADE examples.
