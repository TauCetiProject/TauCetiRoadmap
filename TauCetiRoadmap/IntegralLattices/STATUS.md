<!--tauceti-status:v1 {"roadmap":"IntegralLattices","to_sha":"1d095894ac25298eb2a23398826c0f867b6d3164","ts":"2026-10-05T01:07:53Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","remaining":"the levels of the root-lattice examples in 0G","state":"partial"},{"id":"Layer 1","remaining":"dyadic decomposition and Nikulin relations (1G), odd Gauss-sum values and Theorem 1.11.3 (1H), Milgram (1I), van der Blij (1L)","state":"partial"},{"id":"Layer 2","remaining":"Minkowski and Hermite bounds, successive minima, reduction and finiteness of classes (2E to 2G)","state":"partial"},{"id":"Layer 3","remaining":"3A compatibilities; Jordan splittings, odd-p and dyadic classification, the genus and density exponents (3B to 3I)","state":"partial"},{"id":"Layer B","state":"untouched"},{"id":"Layer 4","state":"untouched"},{"id":"Layer 5","remaining":"everything except primitivity (5F): genus and discriminant form, existence, uniqueness, primitive embeddings, 2-elementary lattices","state":"partial"},{"id":"Layer 6","remaining":"indefinite classification, existence, rank at most 9, E8^2 and D16+, Niemeier lattices, and the order of O(E8); only 6F is in","state":"partial"},{"id":"Layer 7","state":"untouched"},{"id":"Layer 8","remaining":"the rows for 1G generators and relations, 1H, 1I, and the rank-16 and rank-24 lattices 6D and 6E","state":"partial"},{"id":"Layer 9","state":"untouched"}],"readme_sha":"3f13c22a10d163a4d62b82fa6c02407102b9dc92f684a06245f218446706a0ad","roadmap":"IntegralLattices","to_sha":"1d095894ac25298eb2a23398826c0f867b6d3164"}-->
# Status: IntegralLattices

This file documents the status of the IntegralLattices roadmap up until `1d09589` (2026-10-05T01:07:53Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The overlattice and discriminant-form theory of Layer 1 is solid, the Gauss-sum invariant now exists, and Nikulin's generator classification is done in odd order. Layers 0 to 3, 5, 6 and 8 are partial. Milgram's theorem, reduction theory, the genus, the binary theory, spinor genera, masses and the LMFDB certificates have not begun.

### Named results

- **The `D₈⁺ ≅ E₈` isometry** — the spinor glue enlargement of `D₈` is isometric to the `E₈` root lattice, which also identifies the coordinate and Cartan models of `E₈` ([`TauCeti.IntegralLattice.typeE₈IsometryD8Plus`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/IntegralLattice/RootLattice/D8Plus/Isometry.html#TauCeti.IntegralLattice.typeE₈IsometryD8Plus)).
- **Nikulin's even-overlattice correspondence** — even overlattices `L ≤ M ≤ L^⋆` of an even nondegenerate lattice correspond to quadratic-isotropic subgroups `H` of `A_L`, and the discriminant form of `M` is `H⊥/H` ([`TauCeti.IntegralLattice.evenIntermediateCarrierOrderIsoIsotropicSubgroup`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/IntegralLattice/Overlattice/Isotropic.html#TauCeti.IntegralLattice.evenIntermediateCarrierOrderIsoIsotropicSubgroup)).
- **Additivity of the Gauss-sum invariant** — the class `sign q ∈ ℤ/8` defined by `G(q) = √#A · e^{2πi·sign q/8}` is additive over orthogonal sums, vanishes on metabolic modules and takes Nikulin's values on the dyadic generators ([`TauCeti.FiniteQuadraticModule.gaussSign_prod`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/FiniteBilinearModule/GaussSum.html#TauCeti.FiniteQuadraticModule.gaussSign_prod)).
- **Nikulin's decomposition in odd order** — every nondegenerate finite quadratic form of odd order is an orthogonal sum of cyclic forms `q_θ^{(p)}(p^k)` ([`TauCeti.FiniteQuadraticModule.exists_isometry_pi_oddCyclic`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/FiniteBilinearModule/OddCyclic/Decomposition.html#TauCeti.FiniteQuadraticModule.exists_isometry_pi_oddCyclic)).
- **The covolume identity** — a nondegenerate integral lattice realised in Euclidean space has `covolume² = det L` ([`TauCeti.IntegralLattice.covolume_range_sq_eq_determinant`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/IntegralLattice/PosDef/Covolume.html#TauCeti.IntegralLattice.covolume_range_sq_eq_determinant)).

### Notable definitions and infrastructure

- [`TauCeti.IntegralLattice`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/IntegralLattice/Basic.html#TauCeti.IntegralLattice) is the single carrier for the whole programme: a full `ℤ`-submodule of a rational space with an integral symmetric form, with indefinite and degenerate lattices included.
- [`TauCeti.FiniteQuadraticModule`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/FiniteBilinearModule/Quadratic.html#TauCeti.FiniteQuadraticModule) carries `ℚ/ℤ`-valued finite quadratic forms. It now has orthogonal quotients, Gauss sums and Nikulin's generators, and it is where the discriminant-form side of Layers 3 and 5 will be stated.
- [`TauCeti.IntegralLattice.level`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/IntegralLattice/Level.html#TauCeti.IntegralLattice.level) is defined intrinsically through the dual lattice. For even lattices it is the annihilator of `q_L`, and it divides `2 det L`. The LMFDB label needs this.

### Roadmap coverage

- **Layer 0** is done except for 0G, which asks for the levels of the root-lattice examples. Only rank-one and unimodular levels are computed. Scale and norm ideals, the rational square-class comparison and the coordinate model of `Aₙ` are now in.
- **Layer 1** is partial. 1A to 1F, 1J and 1K are done. 1G has the odd-order decomposition and the dyadic cyclic and Klein-four cases, but not the full dyadic decomposition or Nikulin's relations. 1H lacks the odd-generator values and Theorem 1.11.3. 1I is untouched, and 1L lacks van der Blij's congruence.
- **Layer 2** is partial: 2A to 2D are done, and the Minkowski and Hermite bounds, successive minima and reduction (2E to 2G) are untouched.
- **Layer 3** is partial. Part of the 3A bridge is in, the local form is diagonal at odd primes, and the dyadic non-diagonalisability of `U` is proved. Jordan splittings in general, the dyadic classification and the genus have not begun.
- **Layers 5 and 6** have only primitivity (5F) and the two models of `E₈` (6F). **Layer 8** is partial to the extent of its supplying rows.
- **Layers B, 4, 7 and 9** are untouched.

## The frontier

- **Gauss-sum values at odd primes and Nikulin 1.11.3**: compute `sign q_θ^{(p)}(p^k) ≡ k²(1−p) + 4kη`, then prove that forms with isometric bilinear forms are isometric exactly when their invariants agree (1H).
- **Milgram's theorem**: `t₊ − t₋ ≡ sign q_L (mod 8)` (1I), now that the invariant and its overlattice invariance are in. Van der Blij (1L) and the rank-8 results in Layer 6 wait on it.
- **The dyadic generator classification and the relations**: extend the cyclic and Klein-four cases to every nondegenerate 2-primary form, then prove Nikulin's Proposition 1.8.2 (1G).
- **Jordan splittings**: turn the odd-prime diagonalisation into the splitting `⊕ pⁱ Lᵢ` with unique invariants (3B, 3C), and handle `ℤ₂` separately (3D). The remaining 3A compatibilities are still open.
- **Minkowski and Hermite bounds**: with the covolume identity in, 2E and the finiteness of classes in 2G are the next steps in reduction theory.
