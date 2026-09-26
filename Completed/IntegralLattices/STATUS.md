<!--tauceti-status:v1 {"roadmap":"IntegralLattices","to_sha":"8745177e39945cdda39b4203688f5f6bb380a0b9","ts":"2026-09-01T22:18:35Z"}-->
# Status: IntegralLattices

This file documents the status of the IntegralLattices roadmap up until `8745177` (2026-09-01T22:18:35Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The general APIs of Layers 1 to 4, every row of the Layer 5 table, and the `D₈ ⊂ E₈` glue calculation are formalized, the README's completion criterion. What remains partial is two secondary clauses of Layer 4 (the bilinear `H⊥/H` comparison for odd overlattices and its orthogonal-sum form) and the invariant-factor chain of Layer 2; a general bridge from Tau Ceti's pinned root data has not begun.

### Named results

- **The `D₈⁺ ≅ E₈` isometry** — the spinor glue enlargement of the checkerboard lattice `D₈` is isometric, as an integral lattice, to the `E₈` root lattice, via a rational map sending Bourbaki's simple roots to eight glue roots whose Gram matrix is the `E₈` Cartan matrix; `D₈⁺` is even and unimodular with trivial discriminant form ([`TauCeti.IntegralLattice.typeE₈IsometryD8Plus`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/IntegralLattice/RootLattice/D8Plus/Isometry.html#TauCeti.IntegralLattice.typeE₈IsometryD8Plus)).
- **Nikulin's even-overlattice correspondence** — for an even nondegenerate lattice, even overlattices `L ≤ M ≤ L^∨` are order-isomorphic to quadratic-isotropic subgroups of `A_L`, with the integral/bilinear-isotropic version stated separately and `[L_H:L]=|H|`, `disc(L_H)·|H|²=disc(L)` alongside ([`TauCeti.IntegralLattice.evenIntermediateCarrierOrderIsoIsotropicSubgroup`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/IntegralLattice/Overlattice/Isotropic.html#TauCeti.IntegralLattice.evenIntermediateCarrierOrderIsoIsotropicSubgroup)).
- **The discriminant form of an even overlattice** — `A_M ≅ H⊥/H` as finite quadratic modules for `H = M/L`, with representative formulas, the order identity, naturality in lattice isometries, and the corollary that `L_H` is unimodular exactly when `H` is Lagrangian ([`TauCeti.IntegralLattice.IntermediateCarrier.discriminantOrthogonalQuotientIsometry`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/IntegralLattice/Overlattice/OrthogonalQuotient.html#TauCeti.IntegralLattice.IntermediateCarrier.discriminantOrthogonalQuotientIsometry)).
- **The order of the discriminant group** — `#A_L = |det Gram L|` for every nondegenerate lattice, with the load-bearing converse that `L^∨` is a full lattice, and `A_L` finite, exactly when `L` is nondegenerate ([`TauCeti.IntegralLattice.natCard_discriminantGroup`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/IntegralLattice/Discriminant/Cardinality.html#TauCeti.IntegralLattice.natCard_discriminantGroup)).
- **The ADE discriminant forms** — `Aₙ`, `Dₙ` of even and odd rank, `E₆`, `E₇` and `E₈` each have their discriminant quadratic module identified up to isometry with an explicit cyclic or Klein-four model carrying the table's half-norm values, not merely the group order; even `Dₙ` is the case order alone cannot settle ([`TauCeti.IntegralLattice.checkerboardDiscriminantQuadraticIsometry`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/IntegralLattice/RootLattice/TypeD/Basic.html#TauCeti.IntegralLattice.checkerboardDiscriminantQuadraticIsometry)).

### Notable definitions and infrastructure

- [`TauCeti.IntegralLattice`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/IntegralLattice/Basic.html#TauCeti.IntegralLattice) — a full `ℤ`-submodule of a rational space with a symmetric integral form and nondegeneracy as a mixin, carrying signature and definiteness predicates, isometries with a complete invariance package, Gram invariants, scaling, orthogonal sums, rationalization in both directions, and the radical quotient that lets a degenerate lattice such as affine `Ã₁` reach the nondegenerate theory.
- [`TauCeti.FiniteQuadraticModule`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/FiniteBilinearModule/Quadratic.html#TauCeti.FiniteQuadraticModule) — finite abelian groups with `ℚ/ℤ`-valued quadratic maps over their bilinear counterparts, with morphisms, isometries, orthogonal complements and the double-perp formula, primary decomposition as an isometry, and the induced module on `H⊥/H`; the cyclic and Klein-four models that name the ADE forms live here.
- [`TauCeti.IntegralLattice.discriminantQuadraticModule`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/IntegralLattice/Discriminant/Quadratic.html#TauCeti.IntegralLattice.discriminantQuadraticModule) — the half-norm discriminant form of an even nondegenerate lattice, proved nondegenerate, functorial in isometries, compatible with orthogonal sums and negation, with `A_L` decomposed into cyclic groups by Smith normal form.

### Roadmap coverage

- Layer 1 (lattices with forms): done, including the three acceptance examples and the radical quotient `Ã₁ → A₁`.
- Layer 2 (duality and the discriminant group): done except that the invariant-factor divisibility chain and its identification with the Smith form of the Gram matrix are stated only for positive-determinant Gram matrices.
- Layer 3 (finite bilinear and quadratic modules): done.
- Layer 4 (overlattices): done except the bilinear comparison `A_{L_H} ≅ H⊥/H` for integral but odd overlattices and the componentwise form of that comparison over orthogonal sums; the correspondence, duality, index and integrality/evenness are componentwise and natural.
- Layer 5 (rank one and ADE): rank one, all table rows and `D₈ ⊂ E₈` done. Untouched: a general conversion of Tau Ceti's root data into integral lattices; type `D` and `E₈` consume Tau Ceti's simple-root coordinates, the others are built on `Fin n → ℚ` from their Cartan matrices.

## The frontier

- **Bilinear `H⊥/H` for odd overlattices** — construct the orthogonal quotient of a finite bilinear module and the isometry `A_{L_H} ≅ H⊥/H` of discriminant bilinear modules for an integral overlattice that need not be even; the radical-quotient machinery on finite bilinear modules is in place.
- **Orthogonal-sum naturality of the comparison** — the README's componentwise statement for `A_{L_H} ≅ H⊥/H`; the equivalence `A_{L⊥M} ≃ A_L × A_M` and the assembled carriers exist.
- **Invariant factors in general** — extend the divisibility chain and Gram-matrix Smith identification from positive-determinant to all nondegenerate Gram matrices, covering indefinite and negative-definite lattices.
- **The Tau Ceti root-data bridge** — turn a pinned root datum into an `IntegralLattice` with its Cartan matrix as Gram matrix, so ADE lattices are derived rather than re-entered.
- **`IsZLattice` comparison** — optional per the README; nothing landed.
