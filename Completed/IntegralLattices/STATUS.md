<!--tauceti-status:v1 {"roadmap":"IntegralLattices","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e","ts":"2026-11-19T18:22:01+11:00"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 1","state":"done"},{"id":"Layer 2","state":"done"},{"id":"Layer 3","state":"done"},{"id":"Layer 4","state":"done"},{"id":"Layer 5","state":"done"}],"readme_sha":"62339299e53699fc1778e9ce2bde6b15820d64f08460a86c36dce9e061b04d3f","roadmap":"IntegralLattices","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e"}-->
# Status: IntegralLattices

This file documents the status of the IntegralLattices roadmap up until `b235000` (2026-11-19T18:22:01+11:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** All five layers are done. The lattice and finite-form APIs support the overlattice correspondence, the ADE discriminant tables and the `D₈⁺ ≅ E₈` glue isometry. Beyond the charter, Tau Ceti has the unimodular classification up to rank nine, a table of the 24 Niemeier lattices, and masses and class numbers of explicit genera. Still missing are a general dyadic normal form, Nikulin's existence theorems and the mass formula itself.

### Named results

- **[The `D₈⁺ ≅ E₈` isometry](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/IntegralLattice/RootLattice/D8Plus/Isometry.html#TauCeti.IntegralLattice.typeE₈IsometryD8Plus)**: spinor glue enlarges `D₈` to a lattice explicitly isometric to the `E₈` root lattice. This is the summit of the roadmap.
- **[Nikulin's even-overlattice correspondence](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/IntegralLattice/Overlattice/Isotropic.html#TauCeti.IntegralLattice.evenIntermediateCarrierOrderIsoIsotropicSubgroup)**: the even overlattices of an even lattice correspond to the quadratic-isotropic subgroups of its discriminant module. An overlattice is unimodular exactly when its subgroup is Lagrangian, [in the integral case](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/IntegralLattice/Overlattice/Dual.html#TauCeti.IntegralLattice.isUnimodular_iff_isLagrangian_discriminantSubgroup_toIntermediateCarrier) as well as the even one.
- **[Milgram's theorem](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/IntegralLattice/Milgram.html#TauCeti.IntegralLattice.gaussSign_discriminantQuadraticModule_eq_sigPos_sub_sigNeg)**: the Gauss-sum invariant of the discriminant form of an even nondegenerate lattice equals its signature `t₊ - t₋` mod 8.
- **[Unimodular lattices of rank at most nine](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/IntegralLattice/PosDef/SmallRankUnimodular.html#TauCeti.IntegralLattice.IsPosDef.nonempty_isometry_of_isUnimodular_of_finrank_le_nine)**: a positive definite unimodular lattice of rank at most nine is `Iₙ`, `E₈`, or `I₁ ⊕ E₈`.
- **[The Niemeier lattices are distinct](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/IntegralLattice/Rank24/ReferenceLattices.html#TauCeti.NiemeierType.nonempty_isometry_lattice_iff)**: the 24 tabulated even unimodular lattices of rank 24 are pairwise non-isometric, and [Leech is the only one without roots](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/IntegralLattice/Rank24/ReferenceLattices.html#TauCeti.NiemeierType.vectorsOfNorm_two_lattice_eq_empty_iff).

### Notable definitions and infrastructure

- [Integral lattices](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/IntegralLattice/Basic.html#TauCeti.IntegralLattice) use a single carrier for definite, indefinite and degenerate forms. The radical quotient and restriction constructions let the general API reach each case.
- The [discriminant quadratic module](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/IntegralLattice/Discriminant/Quadratic.html#TauCeti.IntegralLattice.discriminantQuadraticModule) connects an even lattice to its finite form. The gluing theorem, the ADE calculations and Milgram's theorem all rest on it, and isometry of such modules [can be checked prime by prime](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/FiniteBilinearModule/Primary/Decomposition.html#TauCeti.FiniteQuadraticModule.nonempty_isometry_of_forall_primaryComponent).
- The [mass](https://taucetiproject.org/docs/TauCeti/NumberTheory/IntegralLattice/Mass.html#TauCeti.IntegralLattice.mass) of a genus, together with class numbers and proper class numbers, is what a mass formula would compute. A [mass check](https://taucetiproject.org/docs/TauCeti/NumberTheory/IntegralLattice/Mass.html#TauCeti.IntegralLattice.sum_inv_natCard_isometry_eq_mass_iff) certifies that a set of class representatives is complete.

### Roadmap coverage

All five layers are done.

- **Layers 1 to 3** supply the lattice, duality, discriminant-group and finite-form APIs, with Smith invariant factors for every nondegenerate lattice.
- **Layer 4** includes the quadratic and bilinear `H⊥/H` comparisons and their orthogonal-sum versions, and the Lagrangian criterion for unimodular overlattices in both the integral and the even setting.
- **Layer 5** verifies every rank-one and [ADE table row](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/IntegralLattice/RootLattice/TypeD/Basic.html#TauCeti.IntegralLattice.checkerboardDiscriminantQuadraticIsometry) as a finite quadratic module, as well as the `D₈⁺ ≅ E₈` isometry.

Outside the charter, Tau Ceti has:

- Nikulin's odd-order decomposition and the classification of 2-elementary and cyclic dyadic finite quadratic modules;
- van der Blij's congruence and the genus of a unimodular lattice;
- the fact that a genus determines both discriminant forms;
- local densities at every prime, with closed forms at odd primes and the rank-two good-prime factor in terms of the Kronecker character;
- exact masses, including [`1/696729600` for `E₈`](https://taucetiproject.org/docs/TauCeti/NumberTheory/IntegralLattice/E8Genus.html#TauCeti.IntegralLattice.mass_typeE₈RootLattice) and `3/4` for the two-class genus of determinant 23;
- Eichler's unique decomposition into indecomposables;
- binary forms through the ring class field and Gauss reduction.

## The frontier

- **General dyadic normal form**: [sign walking](https://taucetiproject.org/docs/TauCeti/NumberTheory/Padics/BilinearForm/SignWalking.html#LinearMap.BilinForm.IsJordanSplitting.exists_signWalk_add_two_of_odd_of_odd) and [oddity fusion](https://taucetiproject.org/docs/TauCeti/NumberTheory/Padics/BilinearForm/Oddity/Fusion.html#LinearMap.BilinForm.IsJordanSplitting.exists_oddityFusion_succ) are proved for Jordan splittings over `ℤ₂`, and lattices whose constituents are all of type II are classified. Still needed:
  - assembling these moves into a canonical 2-adic symbol and an isometry criterion that allows type I constituents;
  - the matching classification of arbitrary 2-primary finite quadratic modules across several exponents.
- **The dyadic local density and the mass formula**: at 2, only the rank-one and hyperbolic-plane densities are computed. A Smith-Minkowski-Siegel formula also needs the adelic volume comparison for `SO(V)`, which the active `IntegralLattices` roadmap assigns to its successor `OrthogonalTamagawaAndLatticeMass`.
- **Nikulin's existence theorems and primitive embeddings**: [primitive embeddings](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/IntegralLattice/PrimitiveEmbedding.html#TauCeti.IntegralLattice.IsPrimitiveEmbedding) are defined, but the only example is the rank-one lattice inside the hyperbolic plane. Three results remain open:
  - existence of an even lattice with a given signature and discriminant form;
  - the existence half of Theorem 3.6.2;
  - the converse of Corollary 1.9.4.

  The uniqueness theorems go through Eichler's theorem, which the active roadmap places outside its scope.
- **Completeness of the Niemeier table**: the 24 lattices are known to be distinct, but nothing yet proves that every even unimodular lattice of rank 24 is among them. Nor is there any classification in ranks ten to twenty-three, including the even rank-sixteen pair.
- **Pinned root-data bridge**: only `E₈` is identified with the weight lattice of the pinned root datum. The other ADE types are still built from coordinates.
