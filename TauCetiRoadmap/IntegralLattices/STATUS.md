<!--tauceti-status:v1 {"roadmap":"IntegralLattices","to_sha":"dec7a5857c7d85f2ce63e7890c26b1e99a537057","ts":"2026-09-30T00:20:29Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","remaining":"scale and norm ideals and the level (0D), the rational square-class comparison of 0C, and the coordinate model of A_n","state":"partial"},{"id":"Layer 1","remaining":"Nikulin generators and relations (1G), the Gauss-sum invariant (1H), Milgram (1I), the level (1J), van der Blij (1L), ADE from root data","state":"partial"},{"id":"Layer 2","remaining":"covolume, Minkowski and Hermite bounds, successive minima, and reduction with finiteness of classes (2D to 2G)","state":"partial"},{"id":"Layer 3","remaining":"3A compatibilities with sums, twists and duality; Jordan splittings, dyadic symbols, the genus and density exponents (3B to 3I)","state":"partial"},{"id":"Layer B","state":"untouched"},{"id":"Layer 4","state":"untouched"},{"id":"Layer 5","remaining":"everything except primitivity (5F): genus and discriminant form, existence, uniqueness, primitive embeddings, 2-elementary lattices","state":"partial"},{"id":"Layer 6","remaining":"indefinite classification, existence, rank at most 9, E8^2 and D16+, Niemeier lattices, and the order of O(E8); only 6F is in","state":"partial"},{"id":"Layer 7","state":"untouched"},{"id":"Layer 8","remaining":"the rows for 1G generators, 1H, 1I, 1J, the covolume identity 2D, and the rank-16 and rank-24 lattices 6D and 6E","state":"partial"},{"id":"Layer 9","state":"untouched"}],"readme_sha":"3f13c22a10d163a4d62b82fa6c02407102b9dc92f684a06245f218446706a0ad","roadmap":"IntegralLattices","to_sha":"dec7a5857c7d85f2ce63e7890c26b1e99a537057"}-->
# Status: IntegralLattices

This file documents the status of the IntegralLattices roadmap up until `dec7a58` (2026-09-30T00:20:29Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The roadmap has been rewritten into a much larger programme. The old summit, the `D₈ ⊂ E₈` glue calculation on top of the overlattice correspondence, now sits inside Layer 1. Layers 0 to 3 are partial, and in Layer 5 only primitivity and in Layer 6 only the two-models-of-`E₈` milestone are in. The binary theory, classes and spinor genera, masses and the LMFDB certificates have not begun.

### Named results

- **The `D₈⁺ ≅ E₈` isometry**: the spinor glue enlargement of `D₈` is isometric to the `E₈` root lattice, by an explicit map whose glue roots have the `E₈` Cartan matrix as Gram matrix. This also identifies the coordinate and Cartan models of `E₈` ([`TauCeti.IntegralLattice.typeE₈IsometryD8Plus`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/IntegralLattice/RootLattice/D8Plus/Isometry.html#TauCeti.IntegralLattice.typeE₈IsometryD8Plus)).
- **Nikulin's even-overlattice correspondence**: for an even nondegenerate lattice, the even overlattices `L ≤ M ≤ L^⋆` are order-isomorphic to the quadratic-isotropic subgroups of `A_L`, with a bilinear sibling for integral overlattices ([`TauCeti.IntegralLattice.evenIntermediateCarrierOrderIsoIsotropicSubgroup`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/IntegralLattice/Overlattice/Isotropic.html#TauCeti.IntegralLattice.evenIntermediateCarrierOrderIsoIsotropicSubgroup)).
- **The discriminant module of an overlattice is `H⊥/H`**: this holds as finite bilinear modules for every integral overlattice and as quadratic modules for even ones. It is natural in isometries, splits over orthogonal sums, and makes the overlattice unimodular exactly when `H` is Lagrangian ([`TauCeti.IntegralLattice.IntermediateCarrier.discriminantBilinearOrthogonalQuotientIsometry`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/IntegralLattice/Overlattice/OrthogonalQuotient/Bilinear.html#TauCeti.IntegralLattice.IntermediateCarrier.discriminantBilinearOrthogonalQuotientIsometry)).
- **The order of the discriminant group**: `#A_L = |det L|` for every nondegenerate lattice, and `A_L` is finite exactly when `L` is nondegenerate ([`TauCeti.IntegralLattice.natCard_discriminantGroup`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/IntegralLattice/Discriminant/Cardinality.html#TauCeti.IntegralLattice.natCard_discriminantGroup)).
- **Finiteness of the orthogonal group**: a positive definite lattice has only finitely many isometries, and so does a negative definite one by negation ([`TauCeti.IntegralLattice.IsPosDef.finite_isometry`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/IntegralLattice/PosDef/Finite.html#TauCeti.IntegralLattice.IsPosDef.finite_isometry)).

### Notable definitions and infrastructure

- [`TauCeti.IntegralLattice`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/IntegralLattice/Basic.html#TauCeti.IntegralLattice) is the single carrier the whole programme runs on: a full `ℤ`-submodule of a rational space with an integral symmetric form. Indefinite and degenerate lattices are objects of the same type, and a radical quotient carries degenerate lattices to the nondegenerate theory.
- [`TauCeti.FiniteQuadraticModule`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/FiniteBilinearModule/Quadratic.html#TauCeti.FiniteQuadraticModule) provides `ℚ/ℤ`-valued finite quadratic modules with orthogonal quotients, primary decomposition and a metabolic predicate. It is the carrier in which the discriminant forms, the gluing theorems and eventually Nikulin's theory are stated.
- [`TauCeti.IntegralLattice.localizationToCompletion`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/IntegralLattice/Localization.html#TauCeti.IntegralLattice.localizationToCompletion) is the canonical map `ℤ_p ⊗ L → ℚ_p ⊗ V`. It keeps the integral local lattice and the rational local space apart while identifying one inside the other, at `p = 2` as well, and it is where Jordan splittings will be built.

### Roadmap coverage

- **Layer 0** is partial. Everything is there except the scale and norm ideals and the level (0D), the comparison with rational square-class invariants in 0C, and the coordinate model of `Aₙ`. The carrier, the even dictionary, determinants and index, the signature and radical quotient, unimodular splitting, and the `U`, `⟨−2⟩` and `Ã₁` tests are in.
- **Layer 1** is partial. 1A to 1F are done, and so is 1K, except that `Aₙ`, `E₆` and `E₇` are built from Cartan matrices rather than from Tau Ceti's root data. 1G has quotients, primary decomposition and metabolicity but not Nikulin's generators and relations. 1L has characteristic vectors but not van der Blij's congruence. 1H, 1I and 1J are untouched.
- **Layer 2** is partial: 2A to 2C are done, and covolume, the Minkowski and Hermite bounds, successive minima and reduction (2D to 2G) are untouched.
- **Layer 3** is partial: only part of the 3A bridge is in.
- **Layer 5** has only 5F, primitivity as a direct summand, which is proved in general. **Layer 6** has only 6F, through the `D₈⁺ ≅ E₈` isometry.
- **Layer 8** is partial to the extent of its supplying rows.
- **Layers B, 4, 7 and 9** are untouched.

## The frontier

- **The Gauss-sum invariant and Milgram's theorem**: define `sign q ∈ ℤ/8` and prove it additive, then prove `t₊ − t₋ ≡ sign q_L (mod 8)` (1H, 1I). Van der Blij's congruence (1L) and the rank-8 results in Layer 6 wait on this.
- **Scale, norm ideal and level**: 0D, and the level as the exponent of `q_L` dividing `2 det L` (1J). Both are needed for the LMFDB label.
- **Jordan splittings**: 3A still needs compatibility with sums, twists, dilations and duality. After that comes 3B, the splitting `⊕ pⁱ Lᵢ` over `ℤ_p`, followed by odd-`p` classification and the genus.
- **Reduction theory**: the covolume identity `covolume(L)² = det L`, the Minkowski and Hermite bounds, and finiteness of classes of given rank and determinant (2D to 2G).
- **Nikulin's generator classification**: every nondegenerate finite quadratic form is a sum of `q_θ^{(p)}(p^k)`, `u`, `v`, together with the relations (1G). Layers 3 and 5 need it.
