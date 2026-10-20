<!--tauceti-status:v1 {"roadmap":"IntegralLattices","to_sha":"c1700319076ee4007035a29454414afddb73e78a","ts":"2026-10-17T01:16:24Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","remaining":"positive definiteness compared with the real form (0E); the stated failure of cancellation, which needs the E8^2 and D16+ pair (0F)","state":"partial"},{"id":"Layer 1","remaining":"a normal form or complete classification of finite quadratic forms from the 1.8.2 relations, and O(q) as a group (1G)","state":"partial"},{"id":"Layer 2","state":"done"},{"id":"Layer 3","remaining":"odd dyadic unimodular forms (3D), 2-adic symbols (3E), genus symbols (3G), rational comparison (3H), density profile of a lattice (3I)","state":"partial"},{"id":"Layer B","remaining":"classes to Picard group bijection (B2), composition (B3), units and isometries (B4), indefinite reduction (B5), tori and mass (B6 to B8)","state":"partial"},{"id":"Layer 4","remaining":"class sets and class numbers, double cosets, spinor genera, Eichler, general p-neighbours; only the even 2-neighbour exists","state":"partial"},{"id":"Layer 5","remaining":"genus from discriminant form, existence, uniqueness, embeddings, 2-elementary lattices; only 5F and one direction of 5G are in","state":"partial"},{"id":"Layer 6","remaining":"indefinite classification (6A), rank at most 9 (6C), E8^2 vs D16+ (6D), Niemeier lattices (6E), order of O(E8) (6G)","state":"partial"},{"id":"Layer 7","state":"untouched"},{"id":"Layer 8","remaining":"the rank-16 and rank-24 rows 6D and 6E","state":"partial"},{"id":"Layer 9","state":"untouched"}],"readme_sha":"c8d318905a5cbba2bfd00a417cbec20f5e115c3cc75dc0e7488d13978ed0da99","roadmap":"IntegralLattices","to_sha":"c1700319076ee4007035a29454414afddb73e78a"}-->
# Status: IntegralLattices

This file documents the status of the IntegralLattices roadmap up until `c170031` (2026-10-17T01:16:24Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Positive definite reduction theory (Layer 2) is done, and the discriminant-form theory of Layer 1 is complete apart from the classification of finite quadratic forms. The local theory, binary lattices, neighbours, Nikulin's embedding theory and the unimodular classification have each started, while masses and the LMFDB certificates have not begun.

### Named results

- **Milgram's theorem** — for an even nondegenerate lattice, the Gauss-sum invariant of the discriminant form is `t₊ − t₋ mod 8`. In particular, an even unimodular lattice has signature divisible by 8. The source states this as `TauCeti.IntegralLattice.gaussSign_discriminantQuadraticModule_eq_sigPos_sub_sigNeg`.
- **Van der Blij's congruence** — in a nondegenerate unimodular lattice, every characteristic vector has norm congruent to `t₊ − t₋` mod 8, for every signature and both parities (`TauCeti.IntegralLattice.vanDerBlij`).
- **Hermite's inequality** — a positive definite lattice of rank `n` has `min L ≤ (4/3)^{(n−1)/2} (det L)^{1/n}`, with equality for `A₂` ([`TauCeti.IntegralLattice.IsPosDef.minimum_le_rpow_mul_determinant_rpow`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/IntegralLattice/PosDef/Hermite.html#TauCeti.IntegralLattice.IsPosDef.minimum_le_rpow_mul_determinant_rpow)). Minkowski's convex-body bound and his second theorem on successive minima are also proved.
- **Finiteness of positive definite classes** — Minkowski-reduced bases exist and have Gram entries bounded by the rank and determinant. Hence there are finitely many isometry classes of positive definite lattices of given rank and bounded determinant (`TauCeti.IntegralLattice.finite_of_pairwise_isEmpty_isometry`).
- **Nikulin's even-overlattice correspondence** — even overlattices of an even nondegenerate lattice correspond to isotropic subgroups `H` of `A_L`, and the overlattice has discriminant form `H⊥/H` ([`TauCeti.IntegralLattice.evenIntermediateCarrierOrderIsoIsotropicSubgroup`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/IntegralLattice/Overlattice/Isotropic.html#TauCeti.IntegralLattice.evenIntermediateCarrierOrderIsoIsotropicSubgroup)).

### Notable definitions and infrastructure

- [`TauCeti.IntegralLattice`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/IntegralLattice/Basic.html#TauCeti.IntegralLattice) is the single carrier for the programme, covering indefinite and degenerate lattices as well. Every layer states its results about it.
- [`TauCeti.FiniteQuadraticModule`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/FiniteBilinearModule/Quadratic.html#TauCeti.FiniteQuadraticModule) carries the `ℚ/ℤ`-valued finite forms. It has Nikulin's generators, all the relations of his Proposition 1.8.2 as explicit isometries, the Gauss-sum invariant with its values on every generator, and Theorem 1.11.3. Layer 5 will be stated here.
- `TauCeti.IntegralLattice.SameGenus` defines the genus by isometry of all localizations. Jordan splittings exist at every prime, and they decide the local class at odd primes. This is what Layers 4, 5 and 9 will quote.

### Roadmap coverage

- **Layer 2** is done.
- **Layer 0** is partial, not done as previously reported. It lacks two items: the comparison of positive definiteness with the real form (0E), and the stated failure of cancellation (0F), which waits on the `E₈² / D₁₆⁺` pair.
- **Layer 1** is done except 1G. There the relations are proved but give no normal form or completeness theorem, and `O(q)` is not yet a group.
- **Layer 3** is partial. 3A to 3C are done, and the genus is defined (3F), although reducing it to finitely many primes still assumes equal determinants. The dyadic theory is limited to even unimodular forms (3D) and a combinatorial density profile (3I). 2-adic symbols, genus symbols and the rational comparison (3E, 3G, 3H) are absent.
- **Layer B** is partial. B1 is done. B2, B4 and B5 have the form-side work, the split branch and definite reduction, but not the bijection with ideal classes. B3 and B6 to B8 are absent.
- **Layers 4, 5 and 6** are thin. Layer 4 has only the even 2-neighbour construction (4G). Layer 5 has primitivity (5F) and one direction of gluing (5G). Layer 6 has existence of even unimodular definite lattices in ranks divisible by 8 (6B) and `D₈⁺ ≅ E₈` (6F), with `E₈²`, `D₁₆⁺` and the Golay lattice constructed but not compared.
- **Layer 8** supplies every row except 6D and 6E.
- **Layers 7 and 9** are untouched.

## The frontier

- **Classifying finite quadratic forms**: turn Nikulin's generators and relations into a normal form, or a decision procedure for isometry of generator sums (1G). Layer 5 rests on it.
- **The genus from discriminant forms**: prove that the signature and `q_L` determine the genus (Nikulin 1.9.4, 5A). The prerequisites are showing that the genus determines the determinant and a classification at `p = 2`.
- **Dyadic classification and genus symbols**: classify odd unimodular `ℤ₂`-lattices and Conway–Sloane 2-adic symbols (3D, 3E). Then attach the density profile of 3I to an actual Jordan splitting.
- **`E₈²` versus `D₁₆⁺`**: show the two are in one genus but not isometric, for example by counting roots (6D). This also supplies the cancellation counterexample of 0F and a Layer 8 row.
- **The binary dictionary**: map proper classes of binary lattices to the (narrow) Picard group of the quadratic order and prove it bijective (B2), then add indefinite cycle reduction (B5).
