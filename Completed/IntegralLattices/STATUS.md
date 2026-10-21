<!--tauceti-status:v1 {"roadmap":"IntegralLattices","to_sha":"d7618661490c084b3699702eef2929388de5bcc0","ts":"2026-10-20T19:02:05Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 1","state":"done"},{"id":"Layer 2","state":"done"},{"id":"Layer 3","state":"done"},{"id":"Layer 4","remaining":"the bilinear comparison A_{L_H} = H-perp/H for integral but odd overlattices, and its componentwise form over orthogonal sums","state":"partial"},{"id":"Layer 5","state":"done"}],"readme_sha":"62339299e53699fc1778e9ce2bde6b15820d64f08460a86c36dce9e061b04d3f","roadmap":"IntegralLattices","to_sha":"d7618661490c084b3699702eef2929388de5bcc0"}-->
# Status: IntegralLattices

This file documents the status of the IntegralLattices roadmap up until `d761866` (2026-10-20T19:02:05Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The completion criterion is met. Layers 1, 2, 3 and 5 are done, and so is the `D₈⁺ ≅ E₈` isometry. Layer 4 is done except for two secondary clauses: the bilinear `H⊥/H` comparison for odd overlattices, and its orthogonal-sum form. Work has since moved on to the theory of discriminant forms and to lattice arithmetic beyond the roadmap's scope.

### Named results

- **The `D₈⁺ ≅ E₈` isometry**: the spinor glue enlargement of the checkerboard lattice `D₈` is isometric to the `E₈` root lattice, by an explicit map whose glue roots have the `E₈` Cartan matrix as Gram matrix ([`TauCeti.IntegralLattice.typeE₈IsometryD8Plus`](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/IntegralLattice/RootLattice/D8Plus/Isometry.html#TauCeti.IntegralLattice.typeE₈IsometryD8Plus)).
- **Nikulin's even-overlattice correspondence**: for an even nondegenerate lattice, even overlattices `L ≤ M ≤ L^∨` correspond order-isomorphically to the quadratic-isotropic subgroups of `A_L`, with a separate bilinear version for integral overlattices ([`TauCeti.IntegralLattice.evenIntermediateCarrierOrderIsoIsotropicSubgroup`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/IntegralLattice/Overlattice/Isotropic.html#TauCeti.IntegralLattice.evenIntermediateCarrierOrderIsoIsotropicSubgroup)).
- **The discriminant form of an even overlattice is `H⊥/H`**: `A_{L_H} ≅ H⊥/H` as finite quadratic modules, naturally in lattice isometries, so `L_H` is unimodular exactly when `H` is Lagrangian.
- **The ADE discriminant forms**: for `Aₙ`, `Dₙ` of each parity, `E₆`, `E₇` and `E₈`, the discriminant quadratic module is identified up to isometry with an explicit cyclic or Klein-four model, quadratic values included ([`TauCeti.IntegralLattice.checkerboardDiscriminantQuadraticIsometry`](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/IntegralLattice/RootLattice/TypeD/Basic.html#TauCeti.IntegralLattice.checkerboardDiscriminantQuadraticIsometry)).
- **Milgram's theorem**: the Gauss-sum invariant of the discriminant form of an even nondegenerate lattice is its signature mod 8. In particular every even unimodular lattice has signature divisible by 8 ([`TauCeti.IntegralLattice.gaussSign_discriminantQuadraticModule_eq_sigPos_sub_sigNeg`](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/IntegralLattice/Milgram.html#TauCeti.IntegralLattice.gaussSign_discriminantQuadraticModule_eq_sigPos_sub_sigNeg)).

### Notable definitions and infrastructure

- [`TauCeti.IntegralLattice`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/IntegralLattice/Basic.html#TauCeti.IntegralLattice) is the single carrier: a full `ℤ`-submodule of a rational space with an integral symmetric form, with nondegeneracy as a mixin. Indefinite and degenerate lattices are objects of the same type.
- [`TauCeti.FiniteQuadraticModule`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/FiniteBilinearModule/Quadratic.html#TauCeti.FiniteQuadraticModule) carries the discriminant-form calculations. It now has Gauss sums, Nikulin's generator decomposition, and his theorem that the bilinear form together with the Gauss-sum invariant determines a nondegenerate module up to isometry ([`nonempty_isometry_iff_bilinear_isometry_and_gaussSign_eq`](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/FiniteBilinearModule/Comparison.html#TauCeti.FiniteQuadraticModule.nonempty_isometry_iff_bilinear_isometry_and_gaussSign_eq)).
- [`TauCeti.IntegralLattice.glueAlongDiscriminant`](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/IntegralLattice/Overlattice/Graph.html#TauCeti.IntegralLattice.glueAlongDiscriminant) glues two even nondegenerate lattices along an anti-isometry of their discriminant forms. The result is even and unimodular, has the summed signature, and contains both lattices primitively.

### Roadmap coverage

Layers 1, 2, 3 and 5 are done, including the cyclic decomposition of `A_L` with Smith invariant factors for every nondegenerate lattice, and every row of the Layer 5 table. In Layer 5, type `D` and `E₈` use Tau Ceti's simple-root coordinates, while `Aₙ`, `E₆` and `E₇` are built from their Cartan matrices, which the README allows. Layer 4 is done except for the bilinear comparison `A_{L_H} ≅ H⊥/H` for integral but odd overlattices and its componentwise form over orthogonal sums. The optional real comparison now has a substantive instance: the square of the covolume of a realized lattice is its determinant ([`covolume_range_sq_eq_determinant`](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/IntegralLattice/PosDef/Covolume.html#TauCeti.IntegralLattice.covolume_range_sq_eq_determinant)). Van der Blij's congruence, Minkowski and Hermite bounds, Kneser neighbors, Jordan splittings and binary quadratic forms lie outside this roadmap, in the broader integral quadratic forms programme.

## The frontier

- **Bilinear `H⊥/H` for odd overlattices**: the isometry `A_{L_H} ≅ H⊥/H` of discriminant bilinear modules for an integral overlattice that need not be even. Nothing in the evidence shows it has landed.
- **Orthogonal-sum form of the comparison**: the README's componentwise statement for `A_{L_H} ≅ H⊥/H` over `L ⊥ M`. The equivalence `A_{L⊥M} ≃ A_L × A_M` already exists.
- **Lattices from Tau Ceti's root data**: turn a pinned root datum into an `IntegralLattice` whose Gram matrix is its Cartan matrix. Positive definiteness of the simply-laced Cartan matrices is already proved, but no such conversion has landed.
