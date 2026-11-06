<!--tauceti-status:v1 {"roadmap":"IntegralLattices","to_sha":"271e1af4dd54c50b9192cf3e213b7686843a0b3a","ts":"2026-10-24T23:22:30Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","state":"done"},{"id":"Layer 1","remaining":"a normal form or complete classification of finite quadratic forms from Nikulin's 1.8.2 relations (1G)","state":"partial"},{"id":"Layer 2","state":"done"},{"id":"Layer 3","remaining":"general dyadic classification (3D), 2-adic symbols (3E), genus symbols (3G), invariant form of the rational comparison (3H)","state":"partial"},{"id":"Layer B","remaining":"bijection of classes with (narrow) Picard group (B2), composition (B3), indefinite cycle reduction (B5), tori and mass (B6 to B8)","state":"partial"},{"id":"Layer 4","remaining":"proper classes (4A), adelic dictionary (4B), spinor genera (4C), rank-2 indefinite class number (4E)","state":"partial"},{"id":"Layer 5","remaining":"genus from discriminant form, existence, uniqueness, stabilization, O(L) to O(q), embedding uniqueness, 2-elementary lattices","state":"partial"},{"id":"Layer 6","remaining":"indefinite classification (6A), rank at most 9 (6C), Niemeier lattices (6E), order of O(E8) (6G)","state":"partial"},{"id":"Layer 7","remaining":"masses (7A), general stabilization and odd-prime values of local densities (7C), archimedean factor (7E), low rank (7G)","state":"partial"},{"id":"Layer 8","remaining":"the rank-24 row 6E","state":"partial"},{"id":"Layer 9","state":"untouched"}],"readme_sha":"c8d318905a5cbba2bfd00a417cbec20f5e115c3cc75dc0e7488d13978ed0da99","roadmap":"IntegralLattices","to_sha":"271e1af4dd54c50b9192cf3e213b7686843a0b3a"}-->
# Status: IntegralLattices

This file documents the status of the IntegralLattices roadmap up until `271e1af` (2026-10-24T23:22:30Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Layer 0 (the basic dictionary) and Layer 2 (positive definite reduction) are done, and the discriminant-form theory of Layer 1 is complete apart from classifying finite quadratic forms. The local theory, binary lattices, classes and neighbours, Nikulin's theory, the unimodular classification and now local densities are all partial. The LMFDB certificates have not begun.

### Named results

- **Milgram's theorem** — for an even nondegenerate lattice, the Gauss-sum invariant of the discriminant form is `t₊ − t₋ mod 8`, so an even unimodular lattice has signature divisible by 8 (`TauCeti.IntegralLattice.gaussSign_discriminantQuadraticModule_eq_sigPos_sub_sigNeg`).
- **Hermite's inequality** — a positive definite lattice of rank `n` has `min L ≤ (4/3)^{(n−1)/2} (det L)^{1/n}`, with equality for `A₂` ([`IsPosDef.minimum_le_rpow_mul_determinant_rpow`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/IntegralLattice/PosDef/Hermite.html#TauCeti.IntegralLattice.IsPosDef.minimum_le_rpow_mul_determinant_rpow)). It underlies [finiteness of the classes in a definite genus](https://taucetiproject.org/docs/TauCeti/NumberTheory/IntegralLattice/ClassNumber.html#TauCeti.IntegralLattice.IsPosDef.finite_genusClasses).
- **Failure of cancellation** — `E₈ ⊕ E₈` and `D₁₆⁺` lie in one genus and are not isometric, but [`E₈ ⊕ E₈ ⊕ U ≅ D₁₆⁺ ⊕ U`](https://taucetiproject.org/docs/TauCeti/NumberTheory/IntegralLattice/Cancellation.html#TauCeti.IntegralLattice.nonempty_isometry_orthogonalSum_hyperbolicPlane_e8PowLattice). The isometry comes from the general fact that Kneser neighbours become isometric after adding a hyperbolic plane.
- **Infinitude of `O(L)` for indefinite lattices** — a nondegenerate indefinite lattice of rank at least three [has infinitely many isometries](https://taucetiproject.org/docs/TauCeti/NumberTheory/IntegralLattice/IndefiniteIsometry.html#TauCeti.IntegralLattice.infinite_isometry_of_isIndefinite). The isotropic case uses Eichler transvections, and the anisotropic case uses Pell units in a binary sublattice.
- **Odd unimodular `ℤ₂`-lattices** — two such forms of equal rank are [isometric exactly when](https://taucetiproject.org/docs/TauCeti/NumberTheory/Padics/BilinearForm/OddUnimodular.html#LinearMap.BilinForm.IsSymm.equivalent_iff_isSquare_det_mul_det_and_eight_dvd_of_odd) their determinants agree up to squares and their characteristic vectors have the same norm mod 8.

### Notable definitions and infrastructure

- [`TauCeti.IntegralLattice`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/IntegralLattice/Basic.html#TauCeti.IntegralLattice) is the single carrier, covering indefinite and degenerate lattices too.
- [`TauCeti.FiniteQuadraticModule`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/FiniteBilinearModule/Quadratic.html#TauCeti.FiniteQuadraticModule) holds the finite forms. It carries Nikulin's generators and relations, the Gauss-sum invariant, the [even-overlattice correspondence](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/IntegralLattice/Overlattice/Isotropic.html#TauCeti.IntegralLattice.evenIntermediateCarrierOrderIsoIsotropicSubgroup) with isotropic subgroups, and now the [orthogonal group](https://taucetiproject.org/docs/TauCeti/LinearAlgebra/FiniteBilinearModule/OrthogonalGroup.html#TauCeti.FiniteQuadraticModule.orthogonalGroup). Layer 5 will be stated here.
- The genus and the [class number](https://taucetiproject.org/docs/TauCeti/NumberTheory/IntegralLattice/ClassNumber.html#TauCeti.IntegralLattice.classNumber): the genus is defined by isometry of all localizations. Signature, determinant, the completed rational spaces and the dyadic density profile are proved to be genus invariants. Layers 4, 5 and 9 quote this.

### Roadmap coverage

- **Layers 0 and 2** are done. Layer 0's last gaps, the real-form comparison (0E) and the cancellation counterexample (0F), have landed.
- **Layer 1** is done except 1G, where a normal form or completeness theorem for finite quadratic forms is still missing.
- **Layer 3** is partial. 3A–3C and 3F are done, and so is the unimodular part of 3D. 3H has the comparison between the genus and the rational local forms, but not yet stated in terms of the invariants. 3I is attached to lattices and the genus. The general dyadic classification, 2-adic symbols and genus symbols (3E, 3G) are absent.
- **Layer B** is partial. B1 and the form side of B4 are done, including the determinant-23 example. B2 has its maps for both signs, but injectivity only for negative discriminant and no bijection. B5 has Lagrange reduction but no indefinite cycles. B3 and B6–B8 are absent.
- **Layer 4** is partial. It has class sets and the class number (4A, without proper classes), infinitude of indefinite `O(L)` (4F), and neighbours at odd primes (4G). Spinor genera and the adelic dictionary (4B, 4C), and the rank-2 indefinite class number (4E), are absent.
- **Layer 5** has primitivity (5F) and gluing in both directions for 5G, and nothing else. **Layer 6** has 6B, 6D and 6F. **Layer 7** has only the local density counting function, with stabilization at odd primes of unit determinant (part of 7C). **Layer 8** lacks only the rank-24 row 6E. **Layer 9** is untouched.

## The frontier

- **The binary dictionary**: prove that the map from proper classes to the (narrow) Picard group is a bijection (B2). Injectivity exists for `Δ < 0`, and the `Δ > 0` map is in place. Then the rank-2 indefinite class number (4E) and the ambiguous-class criterion of B4 follow.
- **Local densities at odd primes**: extend stabilization from unit determinant to every nondegenerate `ℤ_p`-lattice, with explicit `r₀`, and evaluate the density in closed form (7C). Finite-field quadric counts are in hand.
- **Dyadic classification and genus symbols**: go from the unimodular classification to all dyadic lattices, then to Conway–Sloane symbols and genus symbols (3D, 3E, 3G).
- **The genus from discriminant forms**: prove that signature and `q_L` determine the genus of an even lattice (5A). This needs the dyadic work above and the classification of finite quadratic forms (1G).
- **Niemeier lattices**: define the 24 reference lattices (6E). The Golay Construction A roots are classified, and 6E completes Layer 8.
