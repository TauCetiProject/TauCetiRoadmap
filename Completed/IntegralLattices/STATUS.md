<!--tauceti-status:v1 {"roadmap":"IntegralLattices","to_sha":"06fa4daa78e94b5a6f0eaae58742a89e37958e12","ts":"2026-10-01T01:25:56Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 1","state":"done"},{"id":"Layer 2","state":"done"},{"id":"Layer 3","state":"done"},{"id":"Layer 4","remaining":"the bilinear comparison A_{L_H} = H-perp/H for integral but odd overlattices, and its componentwise form over orthogonal sums","state":"partial"},{"id":"Layer 5","state":"done"}],"readme_sha":"62339299e53699fc1778e9ce2bde6b15820d64f08460a86c36dce9e061b04d3f","roadmap":"IntegralLattices","to_sha":"06fa4daa78e94b5a6f0eaae58742a89e37958e12"}-->
# Status: IntegralLattices

This file documents the status of the IntegralLattices roadmap up until `06fa4da` (2026-10-01T01:25:56Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The roadmap's completion criterion is met. The general APIs of Layers 1 to 3, every row of the Layer 5 table, and the `D₈⁺ ≅ E₈` isometry are formalized, and the Layer 2 invariant factors now cover every nondegenerate lattice. Layer 4 is done except for two secondary clauses: the bilinear `H⊥/H` comparison for odd overlattices and its orthogonal-sum form. The evidence here does not establish either one.

### Named results

- **The `D₈⁺ ≅ E₈` isometry**: the spinor glue enlargement of the checkerboard lattice `D₈` is isometric to the `E₈` root lattice. The isometry is an explicit rational map whose glue roots have the `E₈` Cartan matrix as their Gram matrix ([`TauCeti.IntegralLattice.typeE₈IsometryD8Plus`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/IntegralLattice/RootLattice/D8Plus/Isometry.html#TauCeti.IntegralLattice.typeE₈IsometryD8Plus)).
- **Nikulin's even-overlattice correspondence**: for an even nondegenerate lattice, the even overlattices `L ≤ M ≤ L^∨` are order-isomorphic to the quadratic-isotropic subgroups of `A_L`, with a separate bilinear version for integral overlattices ([`TauCeti.IntegralLattice.evenIntermediateCarrierOrderIsoIsotropicSubgroup`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/IntegralLattice/Overlattice/Isotropic.html#TauCeti.IntegralLattice.evenIntermediateCarrierOrderIsoIsotropicSubgroup)).
- **The discriminant form of an even overlattice is `H⊥/H`**: as finite quadratic modules, `A_{L_H} ≅ H⊥/H`, naturally in lattice isometries. As a consequence, `L_H` is unimodular exactly when `H` is Lagrangian.
- **The ADE discriminant forms**: for `Aₙ`, for `Dₙ` of each parity, and for `E₆`, `E₇` and `E₈`, the discriminant quadratic module is identified up to isometry with an explicit cyclic or Klein-four model. The identification covers the half-norm values, not just the group order ([`TauCeti.IntegralLattice.checkerboardDiscriminantQuadraticIsometry`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/IntegralLattice/RootLattice/TypeD/Basic.html#TauCeti.IntegralLattice.checkerboardDiscriminantQuadraticIsometry)).
- **The cyclic decomposition of the discriminant group**: for every nondegenerate lattice, `A_L` is a product of cyclic groups. Their orders are the Smith invariant factors of the Gram matrix, form a divisibility chain, and multiply to `|det L|` ([`TauCeti.IntegralLattice.discriminantGroupInvariantFactorsEquiv`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/IntegralLattice/Discriminant/Smith.html#TauCeti.IntegralLattice.discriminantGroupInvariantFactorsEquiv), building on [`TauCeti.IntegralLattice.natCard_discriminantGroup`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/IntegralLattice/Discriminant/Cardinality.html#TauCeti.IntegralLattice.natCard_discriminantGroup)).

### Notable definitions and infrastructure

- [`TauCeti.IntegralLattice`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/IntegralLattice/Basic.html#TauCeti.IntegralLattice) is the single carrier: a full `ℤ`-submodule of a rational space with an integral symmetric form, with nondegeneracy as a mixin. Indefinite and degenerate lattices are objects of the same type, and the radical quotient brings a degenerate lattice such as affine `Ã₁` into the nondegenerate theory.
- [`TauCeti.FiniteQuadraticModule`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/FiniteBilinearModule/Quadratic.html#TauCeti.FiniteQuadraticModule) provides finite abelian groups with `ℚ/ℤ`-valued quadratic forms, together with orthogonal complements, primary decomposition and `H⊥/H` quotients. The ADE models and the gluing theorem are stated in this setting.
- [`TauCeti.IntegralLattice.discriminantQuadraticModule`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/IntegralLattice/Discriminant/Quadratic.html#TauCeti.IntegralLattice.discriminantQuadraticModule) is the half-norm discriminant form of an even lattice. It is nondegenerate, functorial in isometries, and compatible with orthogonal sums and negation, so overlattice and ADE calculations can be compared as quadratic modules.

### Roadmap coverage

Layers 1, 2, 3 and 5 are done. Layer 2's last gap closed when the invariant-factor chain and its Smith identification were extended from positive-determinant Gram matrices to every nondegenerate one. In Layer 5, type `D` and `E₈` use Tau Ceti's simple-root coordinates, while `Aₙ`, `E₆` and `E₇` are built on coordinate spaces from their Cartan matrices. The README allows this as an alternative to consuming the root data. Layer 4 is done except for the bilinear comparison `A_{L_H} ≅ H⊥/H` for integral but odd overlattices and its componentwise form over orthogonal sums. Recent work on positive definite lattices, characteristic vectors and localization at `p` lies outside this roadmap's scope and belongs to the larger quadratic-forms programme.

## The frontier

- **Bilinear `H⊥/H` for odd overlattices**: the isometry `A_{L_H} ≅ H⊥/H` of discriminant bilinear modules for an integral overlattice that need not be even. The supplied evidence does not show that it has landed.
- **Orthogonal-sum form of the comparison**: the README's componentwise statement for `A_{L_H} ≅ H⊥/H`. The equivalence `A_{L⊥M} ≃ A_L × A_M` already exists.
- **Lattices from Tau Ceti's root data**: turn a pinned root datum into an `IntegralLattice` whose Gram matrix is its Cartan matrix. Positive definiteness of the simply-laced Cartan matrices is now proved ([`TauCeti.DynkinType.posDef_map_intCast_cartanMatrix_of_isSimplyLaced`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/RootSystem/FiniteType/SimplyLaced.html#TauCeti.DynkinType.posDef_map_intCast_cartanMatrix_of_isSimplyLaced)).
- **`IsZLattice` comparison**: optional per the README, and nothing has landed.
