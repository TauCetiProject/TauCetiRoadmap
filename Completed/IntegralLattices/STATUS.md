<!--tauceti-status:v1 {"roadmap":"IntegralLattices","to_sha":"385ec2ddd8ddf8cc779b78c176308cb9c6b55499","ts":"2026-11-06T09:09:35Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 1","state":"done"},{"id":"Layer 2","state":"done"},{"id":"Layer 3","state":"done"},{"id":"Layer 4","state":"done"},{"id":"Layer 5","state":"done"}],"readme_sha":"62339299e53699fc1778e9ce2bde6b15820d64f08460a86c36dce9e061b04d3f","roadmap":"IntegralLattices","to_sha":"385ec2ddd8ddf8cc779b78c176308cb9c6b55499"}-->
# Status: IntegralLattices

This file documents the status of the IntegralLattices roadmap up until `385ec2d` (2026-11-06T09:09:35Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** All five layers are done: the lattice and finite-form APIs carry the overlattice correspondence, the ADE discriminant tables, and the `D₈⁺ ≅ E₈` glue isometry. Work beyond the charter has reached classification of unimodular lattices up to rank nine, masses and class numbers of genera, and part of Nikulin's 2-elementary theory, while a general dyadic normal form and the mass formula itself are still absent.

### Named results

- **[The `D₈⁺ ≅ E₈` isometry](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/IntegralLattice/RootLattice/D8Plus/Isometry.html#TauCeti.IntegralLattice.typeE₈IsometryD8Plus)** — spinor glue enlarges `D₈` to a lattice explicitly isometric to the `E₈` root lattice, the summit of the roadmap.
- **[Nikulin's even-overlattice correspondence](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/IntegralLattice/Overlattice/Isotropic.html#TauCeti.IntegralLattice.evenIntermediateCarrierOrderIsoIsotropicSubgroup)** — even overlattices of an even lattice correspond to quadratic-isotropic subgroups of its discriminant module.
- **[The ADE discriminant forms](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/IntegralLattice/RootLattice/TypeD/Basic.html#TauCeti.IntegralLattice.checkerboardDiscriminantQuadraticIsometry)** — every row of the rank-one and ADE table is identified as a finite quadratic module with its half-norm values, not just a group order.
- **[Unimodular lattices of rank at most nine](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/IntegralLattice/PosDef/SmallRankUnimodular.html#TauCeti.IntegralLattice.IsPosDef.nonempty_isometry_of_isUnimodular_of_finrank_le_nine)** — a positive definite unimodular lattice of rank at most nine is `Iₙ`, `E₈`, or `I₁ ⊕ E₈`.
- **[The mass of the `E₈` genus](https://taucetiproject.org/docs/TauCeti/NumberTheory/IntegralLattice/E8Genus.html#TauCeti.IntegralLattice.mass_typeE₈RootLattice)** — the genus of `E₈` is a single class, and its mass is `1/696729600`, the reciprocal of the order of the isometry group, which reflections in the 240 roots generate.

### Notable definitions and infrastructure

- [Integral lattices](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/IntegralLattice/Basic.html#TauCeti.IntegralLattice) share one carrier for definite, indefinite and degenerate forms; the radical quotient and restriction constructions let the general API reach each case.
- The [discriminant quadratic module](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/IntegralLattice/Discriminant/Quadratic.html#TauCeti.IntegralLattice.discriminantQuadraticModule) connects an even lattice to its finite form. It underlies the gluing theorem and the ADE calculations, and now also the statement that the genus determines the discriminant form.
- The [mass](https://taucetiproject.org/docs/TauCeti/NumberTheory/IntegralLattice/Mass.html#TauCeti.IntegralLattice.mass) of a genus, with the proper mass and [proper class number](https://taucetiproject.org/docs/TauCeti/NumberTheory/IntegralLattice/ProperClassNumber.html#TauCeti.IntegralLattice.properClassNumber), is the target a mass formula would compute. A [mass check](https://taucetiproject.org/docs/TauCeti/NumberTheory/IntegralLattice/Mass.html#TauCeti.IntegralLattice.sum_inv_natCard_isometry_eq_mass_iff) already certifies complete sets of class representatives, as for the LMFDB record of `E₈`.

### Roadmap coverage

All five layers are done. Layers 1 to 3 supply the lattice, duality, discriminant-group and finite-form APIs, with Smith invariant factors for every nondegenerate lattice. Layer 4 includes the quadratic and bilinear `H⊥/H` comparisons and their orthogonal-sum versions. Layer 5 verifies every ADE table row and the `D₈⁺ ≅ E₈` isometry. Work outside the charter now covers Nikulin's odd-order decomposition and the classification of 2-elementary finite quadratic modules; the Gauss-sum invariant; class numbers, proper class numbers and masses; the genus of a unimodular lattice; the fact that [the genus determines the discriminant quadratic form](https://taucetiproject.org/docs/TauCeti/NumberTheory/IntegralLattice/Localization/Discriminant/Form.html#TauCeti.IntegralLattice.SameGenus.nonempty_isometry_discriminantQuadraticModule); local densities at every prime, with closed forms at odd primes; the volume of `O(n)`; Eichler's unique decomposition into indecomposable components; and binary forms through the ring class field.

## The frontier

- **The dyadic local density** — densities exist at every prime and have a closed form at odd primes, but at 2 only rank-one and hyperbolic-plane values and the bookkeeping of Cho's density exponent are proved; with the volume of `O(n)` and the odd-prime densities in place, this is what stands between the current material and a Smith-Minkowski-Siegel mass formula.
- **General dyadic normal form** — finite quadratic modules are classified when 2-elementary, and `ℤ₂`-lattices when every Jordan constituent is of type II; a normal form or isometry criterion for arbitrary 2-primary modules, and for `ℤ₂`-lattices with type I constituents, is not established.
- **Nikulin's existence and uniqueness theorems** — only the necessity half of Theorem 3.6.2 for even 2-elementary lattices, and the easy half of Corollary 1.9.4, have landed; existence of a lattice with given invariants, and the converse that signature and discriminant form determine the genus, remain open.
- **Unimodular classification beyond rank nine** — two-neighbours of `Iₙ` without norm-one vectors are identified as `Dₙ⁺` when `8 ∣ n`, but no classification in rank ten or above, including even rank sixteen, has landed.
- **Pinned root-data bridge** — for `E₈` the lattice is identified with the weight lattice of the pinned root datum; the other ADE types are still built from coordinates.
