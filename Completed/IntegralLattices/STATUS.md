<!--tauceti-status:v1 {"roadmap":"IntegralLattices","to_sha":"06fa4daa78e94b5a6f0eaae58742a89e37958e12","ts":"2026-10-01T01:25:56+00:00"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 1","state":"done"},{"id":"Layer 2","state":"done"},{"id":"Layer 3","state":"done"},{"id":"Layer 4","remaining":"bilinear H-perp/H comparison for odd overlattices and its orthogonal-sum form","state":"partial"},{"id":"Layer 5","remaining":"general bridge from Tau Ceti's pinned root data to integral lattices","state":"partial"}],"readme_sha":"62339299e53699fc1778e9ce2bde6b15820d64f08460a86c36dce9e061b04d3f","roadmap":"IntegralLattices","to_sha":"06fa4daa78e94b5a6f0eaae58742a89e37958e12"}-->
# Status: IntegralLattices

This file documents the status of the IntegralLattices roadmap up until `06fa4da` (2026-10-01T01:25:56+00:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The `D₈⁺ ≅ E₈` glue isometry, the even-overlattice correspondence, and all ADE discriminant-form calculations are proved. Layers 1–3 are complete; Layer 4 still lacks two bilinear and direct-sum comparison statements, and Layer 5 lacks the general bridge from Tau Ceti root data.

### Named results

- **The [`D₈⁺ ≅ E₈` isometry](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/IntegralLattice/RootLattice/D8Plus/Isometry.html#TauCeti.IntegralLattice.typeE₈IsometryD8Plus)** — adjoining a spinor glue class to `D₈` gives an even unimodular lattice explicitly isometric to the `E₈` root lattice.
- **[Nikulin's even-overlattice correspondence](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/IntegralLattice/Overlattice/Isotropic.html#TauCeti.IntegralLattice.evenIntermediateCarrierOrderIsoIsotropicSubgroup)** — even overlattices between `L` and `L^∨` correspond in order to quadratic-isotropic subgroups of the discriminant group.
- **[The discriminant form of an even overlattice](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/IntegralLattice/Overlattice/OrthogonalQuotient.html#TauCeti.IntegralLattice.IntermediateCarrier.discriminantOrthogonalQuotientIsometry)** — for the associated subgroup `H`, the new discriminant quadratic module is isometric to `H^⊥/H`.
- **[The Gram Smith invariant-factor decomposition](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/IntegralLattice/Discriminant/Smith.html#TauCeti.IntegralLattice.discriminantGroupInvariantFactorsEquiv)** — every nondegenerate lattice has a discriminant group expressed as cyclic factors whose orders form the divisibility chain of its Gram matrix, regardless of determinant sign.
- **[Diagonal Jordan form at an odd prime](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/IntegralLattice/Diagonalization.html#TauCeti.IntegralLattice.exists_basis_iIsOrtho_localIntegralForm_eq_unit_mul_pow)** — the localized form of a nondegenerate lattice has an orthogonal `ℤ_p`-basis with diagonal entries equal to units times powers of `p` for odd `p`.

### Notable definitions and infrastructure

- [Integral lattices](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/IntegralLattice/Basic.html#TauCeti.IntegralLattice) bundle a full integer carrier in a rational space with an integral symmetric form, supporting signatures, isometries, Gram invariants and the radical quotient.
- [The discriminant quadratic module](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/IntegralLattice/Discriminant/Quadratic.html#TauCeti.IntegralLattice.discriminantQuadraticModule) packages the half-norm form of an even nondegenerate lattice for gluing and ADE calculations.
- [The local carrier](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/IntegralLattice/Localization.html#TauCeti.IntegralLattice.LocalCarrier) places a lattice over `ℤ_p` inside its completed rational space and supports the odd-prime diagonalization theorem.

### Roadmap coverage

Layers 1–3 are done: lattices with forms and radical quotients, duality with the now-general Smith invariant factors, and finite bilinear and quadratic modules. Layer 4 is partial: the even quadratic `H^⊥/H` comparison is proved, but its bilinear counterpart for integral odd overlattices and the componentwise orthogonal-sum comparison remain. Layer 5 is partial: rank one, every ADE table row, and the `D₈ ⊂ E₈` glue isometry are proved, while a general conversion from Tau Ceti's pinned root data has not landed.

## The frontier

- **Bilinear orthogonal quotient for odd overlattices** — construct the bilinear `H^⊥/H` comparison for integral overlattices that need not be even; the finite bilinear radical-quotient machinery already exists.
- **Orthogonal-sum comparison** — prove that the overlattice discriminant-form comparison respects orthogonal sums, using the existing discriminant-group product equivalence and assembled carriers.
- **Root-data bridge** — turn pinned Tau Ceti root data into integral lattices whose Gram matrices are the named Cartan matrices, so the ADE examples can consume the root data directly.
- **Real-topological lattice comparison** — add a useful comparison with Mathlib's `IsZLattice` when it transports a theorem to the algebraic carrier; the README makes this optional.
