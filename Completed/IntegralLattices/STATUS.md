<!--tauceti-status:v1 {"roadmap":"IntegralLattices","to_sha":"dd217c4e42e821e7ac02aea4b5c46beb15c7b629","ts":"2026-10-27T10:39:33+00:00"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 1","state":"done"},{"id":"Layer 2","state":"done"},{"id":"Layer 3","state":"done"},{"id":"Layer 4","state":"done"},{"id":"Layer 5","state":"done"}],"readme_sha":"62339299e53699fc1778e9ce2bde6b15820d64f08460a86c36dce9e061b04d3f","roadmap":"IntegralLattices","to_sha":"dd217c4e42e821e7ac02aea4b5c46beb15c7b629"}-->
# Status: IntegralLattices

This file documents the status of the IntegralLattices roadmap up until `dd217c4` (2026-10-27T10:39:33+00:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** All five foundational layers are complete, including the discriminant-form gluing theory and the checked ADE examples; none remains partial or untouched. Beyond that charter, the low-rank unimodular classification and binary form–ideal dictionary are established, while general finite-form classification and local density evaluation remain partial.

### Named results

- **The D₈⁺–E₈ glue isometry** — spinor glue enlarges `D₈` to a lattice explicitly isometric to the positive `E₈` root lattice ([`typeE₈IsometryD8Plus`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/IntegralLattice/RootLattice/D8Plus/Isometry.html#TauCeti.IntegralLattice.typeE₈IsometryD8Plus)).
- **Nikulin's even-overlattice correspondence** — even overlattices correspond to quadratic-isotropic subgroups of the discriminant module, with the new discriminant form identified as `H⊥/H` ([`evenIntermediateCarrierOrderIsoIsotropicSubgroup`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/IntegralLattice/Overlattice/Isotropic.html#TauCeti.IntegralLattice.evenIntermediateCarrierOrderIsoIsotropicSubgroup), [`discriminantOrthogonalQuotientIsometry`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/IntegralLattice/Overlattice/OrthogonalQuotient.html#TauCeti.IntegralLattice.IntermediateCarrier.discriminantOrthogonalQuotientIsometry)).
- **Positive definite unimodular classification through rank nine** — every lattice in this range is `Iₙ`, `E₈`, or `I₁ ⊕ E₈`, up to isometry ([classification through rank nine](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/IntegralLattice/PosDef/SmallRankUnimodular.html#TauCeti.IntegralLattice.IsPosDef.nonempty_isometry_of_isUnimodular_of_finrank_le_nine)).
- **The binary form–ideal class correspondence** — proper classes of primitive forms of nonsquare discriminant correspond to the quadratic order's [Picard group](https://taucetiproject.org/docs/TauCeti/NumberTheory/BinaryQuadraticForm/Ideal/PicEquivalence.html#TauCeti.BinaryQuadraticForm.posDefProperClassEquivPic) in the positive definite case and its [narrow Picard group](https://taucetiproject.org/docs/TauCeti/NumberTheory/BinaryQuadraticForm/Ideal/Narrow/Equivalence.html#TauCeti.BinaryQuadraticForm.properClassEquivNarrowPic) at positive discriminant.
- **Unramified local density formulas** — at odd primes where the determinant is a unit, the normalized congruence counts have explicit limits in [odd rank](https://taucetiproject.org/docs/TauCeti/NumberTheory/IntegralLattice/LocalDensity/Basic.html#Matrix.tendsto_localDensityCount_div_of_card_eq_two_mul_add_one) and [even rank](https://taucetiproject.org/docs/TauCeti/NumberTheory/IntegralLattice/LocalDensity/Basic.html#Matrix.tendsto_localDensityCount_div_of_card_eq_two_mul_add_two), with the signed determinant determining the even-rank type.

### Notable definitions and infrastructure

- [Integral lattices](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/IntegralLattice/Basic.html#TauCeti.IntegralLattice) use a common rational ambient-space carrier for definite, indefinite and degenerate forms; the radical quotient lets degenerate inputs reach the nondegenerate theory.
- [Finite quadratic modules](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/FiniteBilinearModule/Quadratic.html#TauCeti.FiniteQuadraticModule) package the `ℚ/ℤ`-valued forms used in gluing, with the lattice discriminant form following the half-norm convention.
- The [pinned E₈ root-datum comparison](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/IntegralLattice/RootLattice/TypeE/WeylGroup.html#TauCeti.IntegralLattice.typeE₈IsometryEquivAut) identifies lattice isometries with automorphisms of the pinned datum, providing a concrete bridge between the lattice and root-system theories.

### Roadmap coverage

Layers 1–3 are done: lattices with forms, duality and finite discriminant groups, and finite bilinear and quadratic modules provide the required general APIs. Layer 4 is done, including the bilinear orthogonal-quotient comparison for odd integral overlattices and compatibility with orthogonal sums. Layer 5 is done, with the rank-one and ADE discriminant tables and the explicit glue isometry. These are the five layers of the completed foundational charter; the expanded arithmetic programme has a different layer numbering and remains incomplete.

## The frontier

- **General finite quadratic-form classification** — the odd-order decomposition and dyadic cyclic and rank-two cases do not yet establish a general dyadic normal form or a completeness theorem for isometry classification.
- **Uniform pinned root-data constructors** — the E₈ automorphism comparison advances the bridge, but a general construction from pinned ADE root data with verified Cartan Gram matrices is not established here.
- **Local densities at bad primes** — prove stabilization with an explicit threshold at every prime and evaluate the odd-prime factors when the determinant is not a unit; the dyadic closed evaluation belongs to `OrthogonalTamagawaAndLatticeMass`.
- **Nikulin's genus and existence criteria** — the general determination of an even genus by signature and discriminant form, and the full existence conditions, remain beyond the completed gluing theory; they require finite-form classification and the general dyadic lattice theory.
