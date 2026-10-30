<!--tauceti-status:v1 {"roadmap":"IntegralLattices","to_sha":"dd217c4e42e821e7ac02aea4b5c46beb15c7b629","ts":"2026-10-27T10:39:33Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 1","state":"done"},{"id":"Layer 2","state":"done"},{"id":"Layer 3","state":"done"},{"id":"Layer 4","state":"done"},{"id":"Layer 5","state":"done"}],"readme_sha":"62339299e53699fc1778e9ce2bde6b15820d64f08460a86c36dce9e061b04d3f","roadmap":"IntegralLattices","to_sha":"dd217c4e42e821e7ac02aea4b5c46beb15c7b629"}-->
# Status: IntegralLattices

This file documents the status of the IntegralLattices roadmap up until `dd217c4` (2026-10-27T10:39:33Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** All five layers are done: the lattice and finite-form APIs carry the overlattice correspondence, the ADE discriminant tables, and the `D₈⁺ ≅ E₈` glue isometry. Work beyond the charter now includes the classification of positive definite unimodular lattices up to rank nine and a growing genus theory, while the dyadic normal form for finite quadratic modules and the mass formula remain partial or absent.

### Named results

- **[The `D₈⁺ ≅ E₈` isometry](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/IntegralLattice/RootLattice/D8Plus/Isometry.html#TauCeti.IntegralLattice.typeE₈IsometryD8Plus)** — spinor glue enlarges `D₈` to a lattice explicitly isometric to the `E₈` root lattice, the summit of the roadmap.
- **[Nikulin's even-overlattice correspondence](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/IntegralLattice/Overlattice/Isotropic.html#TauCeti.IntegralLattice.evenIntermediateCarrierOrderIsoIsotropicSubgroup)** — even overlattices of an even lattice correspond to quadratic-isotropic subgroups of its discriminant module.
- **[The ADE discriminant forms](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/IntegralLattice/RootLattice/TypeD/Basic.html#TauCeti.IntegralLattice.checkerboardDiscriminantQuadraticIsometry)** — every row of the rank-one and ADE table is identified as a finite quadratic module with its half-norm values, not just a group order.
- **[Unimodular lattices of rank at most nine](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/IntegralLattice/PosDef/SmallRankUnimodular.html#TauCeti.IntegralLattice.IsPosDef.nonempty_isometry_of_isUnimodular_of_finrank_le_nine)** — a positive definite unimodular lattice of rank at most nine is `Iₙ`, `E₈`, or `I₁ ⊕ E₈`; in particular [`E₈` is the unique even one of rank eight](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/IntegralLattice/PosDef/SmallRankUnimodular.html#TauCeti.IntegralLattice.IsPosDef.nonempty_isometry_typeE₈RootLattice_of_isEven).
- **[The isometry group of `E₈` is its Weyl group](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/IntegralLattice/RootLattice/TypeE/WeylGroup.html#TauCeti.IntegralLattice.weylGroup_typeE₈RootLattice_eq_top)** — reflections in the 240 roots generate every isometry of the `E₈` lattice.

### Notable definitions and infrastructure

- [Integral lattices](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/IntegralLattice/Basic.html#TauCeti.IntegralLattice) share one carrier for definite, indefinite and degenerate forms; the radical quotient and restriction constructions let the general API reach each case.
- The [discriminant quadratic module](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/IntegralLattice/Discriminant/Quadratic.html#TauCeti.IntegralLattice.discriminantQuadraticModule) connects an even lattice to its finite form, enabling the gluing theorem and the ADE calculations.
- The [unit-norm splitting](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/IntegralLattice/PosDef/UnitNormSplitting.html#TauCeti.IntegralLattice.IsPosDef.unitNormDecomposition) writes a positive definite lattice as `Iₖ` plus a part with no norm-one vectors, which reduces small-rank classification to the lattices without such vectors.

### Roadmap coverage

All five layers are done. Layers 1 to 3 supply the lattice, duality, discriminant-group and finite-form APIs, with Smith invariant factors for every nondegenerate lattice. Layer 4 includes the quadratic and bilinear `H⊥/H` comparisons and their orthogonal-sum versions. Layer 5 verifies every ADE table row and the `D₈⁺ ≅ E₈` isometry. Work outside the charter covers Nikulin's odd-order decomposition of finite quadratic modules, the Gauss-sum invariant, class numbers that are finite for definite genera, the genus of a unimodular lattice determined by signature and parity, local densities at primes not dividing `2 det`, and the arithmetic of binary lattices.

## The frontier

- **General dyadic decomposition** — extend the cyclic and rank-two block results to arbitrary nondegenerate 2-primary quadratic modules; no complete normal form or isometry decision procedure is established.
- **Unimodular classification beyond rank nine** — the neighbour results already identify two-neighbours of `Iₙ` without norm-one vectors as `Dₙ⁺` when `8 ∣ n`, but no classification in rank ten or above, including even rank sixteen, has landed.
- **Local densities at the bad primes** — densities and their Euler product are established only at primes not dividing `2 det A`; the dyadic density and densities at primes dividing the determinant are not, so no mass formula can yet be assembled.
- **Pinned root-data bridge** — for `E₈` the lattice is now identified with the weight lattice of the pinned root datum, matching isometries with datum automorphisms; no such bridge exists for the other ADE types, whose lattices are still built from coordinates.
