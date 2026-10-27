<!--tauceti-status:v1 {"roadmap":"IntegralLattices","to_sha":"dd217c4e42e821e7ac02aea4b5c46beb15c7b629","ts":"2026-10-27T10:39:33Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 1","state":"done"},{"id":"Layer 2","state":"done"},{"id":"Layer 3","state":"done"},{"id":"Layer 4","state":"done"},{"id":"Layer 5","state":"done"}],"readme_sha":"62339299e53699fc1778e9ce2bde6b15820d64f08460a86c36dce9e061b04d3f","roadmap":"IntegralLattices","to_sha":"dd217c4e42e821e7ac02aea4b5c46beb15c7b629"}-->
# Status: IntegralLattices

This file documents the status of the IntegralLattices roadmap up until `dd217c4` (2026-10-27T10:39:33Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** All five layers are done: the lattice and finite-form APIs carry the overlattice correspondence, every ADE discriminant-form row, and the `D₈⁺ ≅ E₈` glue isometry. Work has since moved well past the charter, into small-rank classification, genus theory and automorphism groups, none of which the roadmap required.

### Named results

- **[The `D₈⁺ ≅ E₈` isometry](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/IntegralLattice/RootLattice/D8Plus/Isometry.html#TauCeti.IntegralLattice.typeE₈IsometryD8Plus)** — spinor glue enlarges `D₈` to a lattice explicitly isometric to the `E₈` root lattice, the roadmap's summit.
- **[Nikulin's even-overlattice correspondence](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/IntegralLattice/Overlattice/Isotropic.html#TauCeti.IntegralLattice.evenIntermediateCarrierOrderIsoIsotropicSubgroup)** — even overlattices of an even lattice correspond to quadratic-isotropic subgroups of its discriminant module, with discriminant form `H⊥/H`.
- **[Unimodular lattices of rank at most nine](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/IntegralLattice/PosDef/SmallRankUnimodular.html#TauCeti.IntegralLattice.IsPosDef.nonempty_isometry_of_isUnimodular_of_finrank_le_nine)** — a positive definite unimodular lattice of rank at most nine is `Iₙ`, `E₈` or `I₁ ⊕ E₈`; in particular [`E₈` is the unique even one in rank eight](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/IntegralLattice/PosDef/SmallRankUnimodular.html#TauCeti.IntegralLattice.IsPosDef.nonempty_isometry_typeE₈RootLattice_of_isEven).
- **[The isometry group of `E₈` is its Weyl group](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/IntegralLattice/RootLattice/TypeE/WeylGroup.html#TauCeti.IntegralLattice.weylGroup_typeE₈RootLattice_eq_top)** — reflections in the 240 roots generate `O(E₈)`, which is also [the automorphism group of the pinned `E₈` root datum](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/IntegralLattice/RootLattice/TypeE/WeylGroup.html#TauCeti.IntegralLattice.typeE₈IsometryEquivAut).
- **[The genus of a unimodular lattice](https://taucetiproject.org/docs/TauCeti/NumberTheory/IntegralLattice/UnimodularGenus.html#TauCeti.IntegralLattice.sameGenus_iff_of_isUnimodular)** — two unimodular lattices share a genus exactly when their signatures and parities agree, via a [classification of unimodular forms over `ℤ₂`](https://taucetiproject.org/docs/TauCeti/NumberTheory/Padics/BilinearForm/Unimodular.html#LinearMap.BilinForm.IsSymm.equivalent_iff_two_dvd_iff_and_isSquare_det_mul_det_and_eight_dvd).

### Notable definitions and infrastructure

- [Integral lattices](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/IntegralLattice/Basic.html#TauCeti.IntegralLattice) share one carrier for definite, indefinite and degenerate forms, so the radical quotient and restriction constructions reach every case.
- The [discriminant quadratic module](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/IntegralLattice/Discriminant/Quadratic.html#TauCeti.IntegralLattice.discriminantQuadraticModule) connects an even lattice to its finite `ℚ/ℤ`-valued form, which is what the gluing theorem and the ADE calculations run on.
- The [class number](https://taucetiproject.org/docs/TauCeti/NumberTheory/IntegralLattice/ClassNumber.html#TauCeti.IntegralLattice.classNumber) counts isometry classes in a genus; it is a genus invariant and [finite for definite lattices](https://taucetiproject.org/docs/TauCeti/NumberTheory/IntegralLattice/ClassNumber.html#TauCeti.IntegralLattice.IsPosDef.finite_genusClasses), giving later mass-formula work a precise target.

### Roadmap coverage

Layers 1 to 5 are all done. Layers 1 to 3 supply the lattice, duality and finite-form APIs, with Smith invariant factors for every nondegenerate lattice. Layer 4 has the correspondence, the index and discriminant laws, and the `H⊥/H` comparison in both the even and the odd bilinear case, now joined by the theorem that [even unimodular overlattices of `L ⊥ M`](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/IntegralLattice/Overlattice/Graph.html#TauCeti.IntegralLattice.exists_eq_glueAlongDiscriminant) meeting each summand exactly are graphs of anti-isometries of discriminant forms. Layer 5 has every row of the rank-one and [ADE tables](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/IntegralLattice/RootLattice/TypeD/Basic.html#TauCeti.IntegralLattice.checkerboardDiscriminantQuadraticIsometry) and the glue isometry. Outside the charter, which explicitly excluded classification, mass formulae and automorphism groups, there is now a Weyl group for every lattice, infinite isometry groups for indefinite lattices of rank at least three, Picard-group descriptions of binary form classes, and local densities at the good primes.

## The frontier

- **Mass formula**: local densities at primes not dividing `2 det A` are [computed](https://taucetiproject.org/docs/TauCeti/NumberTheory/IntegralLattice/LocalDensity/Basic.html#Matrix.tendsto_localDensityCount_div_of_card_eq_two_mul_add_one) and [their product converges](https://taucetiproject.org/docs/TauCeti/NumberTheory/IntegralLattice/LocalDensity/EulerProduct.html#Matrix.hasProd_inv_half_localDensity_of_card_eq_two_mul_add_one); the densities at `2` and at primes dividing the determinant, and the mass formula itself, remain.
- **Classification beyond rank nine**: the minimum and norm-two estimates behind it are proved only up to rank eight or nine, although the [two-neighbour identification of `Dₙ⁺`](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/IntegralLattice/Neighbor/UnitLattice.html#TauCeti.IntegralLattice.nonempty_isometry_checkerboardPlusLattice_of_isNeighbor_unitLattice) already holds for every `n` divisible by eight, but larger ranks need new arguments.
- **Pinned root-data bridge**: `E₈` is now matched to its pinned root datum at the level of automorphism groups, but integral lattices are still not constructed from Tau Ceti's pinned root data in general; the other ADE lattices remain coordinate constructions.
- **General dyadic decomposition**: cyclic and certain rank-two 2-primary quadratic modules are classified, but no normal form for arbitrary nondegenerate 2-primary modules is established.
