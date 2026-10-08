<!--tauceti-status:v1 {"roadmap":"IntegralLattices","to_sha":"8334df225e9c15d22464fe5432d849ee6391c09a","ts":"2026-10-07T18:27:27Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","state":"done"},{"id":"Layer 1","remaining":"Nikulin relations 1.8.2 (1G), odd Gauss-sum values and Theorem 1.11.3 (1H), Milgram (1I), van der Blij (1L)","state":"partial"},{"id":"Layer 2","remaining":"Minkowski and Hermite bounds (2E), Minkowski's second theorem (2F), reduction and finiteness of classes (2G)","state":"partial"},{"id":"Layer 3","remaining":"3A compatibilities; Jordan splittings, odd-p and dyadic classification, the genus and density exponents (3B to 3I)","state":"partial"},{"id":"Layer B","state":"untouched"},{"id":"Layer 4","state":"untouched"},{"id":"Layer 5","remaining":"everything except primitivity (5F): genus and discriminant form, existence, uniqueness, primitive embeddings, 2-elementary lattices","state":"partial"},{"id":"Layer 6","remaining":"indefinite classification, existence, rank at most 9, E8^2 and D16+, Niemeier lattices, and the order of O(E8); only 6F is in","state":"partial"},{"id":"Layer 7","state":"untouched"},{"id":"Layer 8","remaining":"the rows for the 1G relations, 1H, 1I, and the rank-16 and rank-24 lattices 6D and 6E","state":"partial"},{"id":"Layer 9","state":"untouched"}],"readme_sha":"c8d318905a5cbba2bfd00a417cbec20f5e115c3cc75dc0e7488d13978ed0da99","roadmap":"IntegralLattices","to_sha":"8334df225e9c15d22464fe5432d849ee6391c09a"}-->
# Status: IntegralLattices

This file documents the status of the IntegralLattices roadmap up until `8334df2` (2026-10-07T18:27:27Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Layer 0 is done, and the overlattice and discriminant-form theory of Layer 1 is solid. Nikulin's generator decomposition now holds for every nondegenerate finite quadratic form. Layers 1 to 3, 5, 6 and 8 are partial. Milgram's theorem, reduction theory, the genus, the binary theory, spinor genera, masses and the LMFDB certificates have not begun.

### Named results

- **The `D₈⁺ ≅ E₈` isometry** — the spinor glue enlargement of `D₈` is isometric to the `E₈` root lattice, which also identifies the coordinate and Cartan models of `E₈` ([`TauCeti.IntegralLattice.typeE₈IsometryD8Plus`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/IntegralLattice/RootLattice/D8Plus/Isometry.html#TauCeti.IntegralLattice.typeE₈IsometryD8Plus)).
- **Nikulin's even-overlattice correspondence** — even overlattices `L ≤ M ≤ L^⋆` of an even nondegenerate lattice correspond to quadratic-isotropic subgroups `H` of `A_L`, and the discriminant form of `M` is `H⊥/H` ([`TauCeti.IntegralLattice.evenIntermediateCarrierOrderIsoIsotropicSubgroup`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/IntegralLattice/Overlattice/Isotropic.html#TauCeti.IntegralLattice.evenIntermediateCarrierOrderIsoIsotropicSubgroup)).
- **Nikulin's generator decomposition** — every nondegenerate finite quadratic form is an orthogonal sum of the odd cyclic forms `q_θ^{(p)}(p^k)`, the dyadic cyclic forms and the rank-two forms `u` and `v`. The source states this as `TauCeti.FiniteQuadraticModule.exists_isometry_prod_pi_generators`, built on the [odd-order case](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/FiniteBilinearModule/OddCyclic/Decomposition.html#TauCeti.FiniteQuadraticModule.exists_isometry_pi_oddCyclic) and the [rank-two dyadic classification](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/FiniteBilinearModule/Dyadic/RankTwo/Classification.html#TauCeti.FiniteQuadraticModule.nonempty_isometry_dyadicU_or_dyadicV_restrict_zmultiples_sup).
- **Additivity of the Gauss-sum invariant** — the class `sign q ∈ ℤ/8` defined by `G(q) = √#A · e^{2πi·sign q/8}` is additive over orthogonal sums. It vanishes on metabolic modules and takes Nikulin's values on the dyadic generators ([`TauCeti.FiniteQuadraticModule.gaussSign_prod`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/FiniteBilinearModule/GaussSum.html#TauCeti.FiniteQuadraticModule.gaussSign_prod)).
- **The covolume identity** — a nondegenerate integral lattice realised in Euclidean space has `covolume² = det L` ([`TauCeti.IntegralLattice.covolume_range_sq_eq_determinant`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/IntegralLattice/PosDef/Covolume.html#TauCeti.IntegralLattice.covolume_range_sq_eq_determinant)).

### Notable definitions and infrastructure

- [`TauCeti.IntegralLattice`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/IntegralLattice/Basic.html#TauCeti.IntegralLattice) is the single carrier for the whole programme: a full `ℤ`-submodule of a rational space with an integral symmetric form, indefinite and degenerate lattices included. Its [restriction to an arbitrary submodule](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/IntegralLattice/Restriction.html#TauCeti.IntegralLattice.restrict), in that submodule's own ambient space, is what makes unimodular splittings into honest lattice isometries.
- [`TauCeti.FiniteQuadraticModule`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/FiniteBilinearModule/Quadratic.html#TauCeti.FiniteQuadraticModule) carries `ℚ/ℤ`-valued finite quadratic forms, with orthogonal quotients, Gauss sums and Nikulin's generators. The discriminant-form side of Layers 3 and 5 will be stated here.
- [`TauCeti.IntegralLattice.successiveMinimum`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/IntegralLattice/PosDef/SuccessiveMinima.html#TauCeti.IntegralLattice.successiveMinimum) measures successive minima as integral norms. Independent vectors attaining all of them exist, which is the input reduction theory needs.

### Roadmap coverage

- **Layer 0** is done. The standard lattice `Iₙ` and the two restriction constructors were the last pieces, and the levels of the root-lattice examples are in the source.
- **Layer 1** is partial. 1A to 1F, 1J and 1K are done. 1G has the full generator decomposition, but not Nikulin's relations (Proposition 1.8.2). 1H lacks the odd-generator values and Theorem 1.11.3. 1I is untouched, and 1L lacks van der Blij's congruence.
- **Layer 2** is partial. 2A to 2D are done. 2F has successive minima and vectors attaining them, but not Minkowski's second theorem. 2E and 2G are untouched.
- **Layer 3** is partial. Part of the 3A bridge is in, and the local form is diagonal at odd primes. The dyadic non-diagonalisability of `U` is proved. Jordan splittings in general, the dyadic classification and the genus have not begun.
- **Layers 5 and 6** have only primitivity (5F) and the two models of `E₈` (6F). **Layer 8** is partial to the extent of its supplying rows.
- **Layers B, 4, 7 and 9** are untouched.

## The frontier

- **Nikulin's relations**: now that every nondegenerate form decomposes into generators, prove Proposition 1.8.2 so that the decomposition becomes a classification (1G). Layers 3 and 5 need it.
- **Gauss-sum values at odd primes and Nikulin 1.11.3**: compute `sign q_θ^{(p)}(p^k) ≡ k²(1−p) + 4kη`. Then prove that forms with isometric bilinear forms are isometric exactly when their invariants agree (1H).
- **Milgram's theorem**: `t₊ − t₋ ≡ sign q_L (mod 8)` (1I). Van der Blij (1L) and the rank-8 results of Layer 6 wait on it.
- **Minkowski's bounds**: Minkowski's and Hermite's bounds on `min L` (2E), then Minkowski's second theorem for the successive minima (2F). Reduction and the finiteness of classes (2G) follow.
- **Jordan splittings**: turn the odd-prime diagonalisation into the splitting `⊕ pⁱ Lᵢ` with unique invariants (3B, 3C), and handle `ℤ₂` separately (3D).
