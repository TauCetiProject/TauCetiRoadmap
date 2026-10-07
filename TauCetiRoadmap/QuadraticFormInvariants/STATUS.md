<!--tauceti-status:v1 {"roadmap":"QuadraticFormInvariants","to_sha":"1d095894ac25298eb2a23398826c0f867b6d3164","ts":"2026-10-05T01:07:53Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","remaining":"the comparison of diagonal chains with Serre's contiguous orthogonal bases (Serre IV Thm 5)","state":"partial"},{"id":"Layer 1","remaining":"Witt decomposition of a possibly degenerate form with its radical, all parts unique up to isometry","state":"partial"},{"id":"Layer 2","state":"done"},{"id":"Layer 3","remaining":"the invariant dictionary documentation, including Lam's c and the Wall caution","state":"partial"},{"id":"Layer 4","remaining":"W(R) isomorphic to Z through the signature","state":"partial"},{"id":"Layer 5","remaining":"Lam V.3.20 beyond rank three, and the homomorphism from I2 to Br(K)[2] vanishing on I3 with its quotient map","state":"partial"},{"id":"Layer 6","remaining":"the 8x8 table over Q_2, the inherited product formula, and Q(K) = Br(K)[2] with the invariant-map normalization in 6E","state":"partial"},{"id":"Layer 7","remaining":"base-change naturality of iota along a finite separable extension","state":"partial"},{"id":"Layer 8","remaining":"the exact comparison of iota of the Clifford invariant with w2, and the Q_2 table of examples","state":"partial"},{"id":"Layer 9","remaining":"the Evens-norm carrier wrappers, the value of the norm on Kummer classes, and the degree-two relative formula","state":"partial"}],"readme_sha":"6aab4e3951deec6f2399252beafa261f5bd115e6efc058010a99965e4c14a805","roadmap":"QuadraticFormInvariants","to_sha":"1d095894ac25298eb2a23398826c0f867b6d3164"}-->
# Status: QuadraticFormInvariants

This file documents the status of the QuadraticFormInvariants roadmap up until `1d09589` (2026-10-05T01:07:53Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Quaternion algebras (Layer 2) are done. The local classification by `(dim, d, s)` is in the library. The comparison `Br(K) ≅ H²` with the cup-norm theorem is proved, missing only base-change naturality. The Clifford invariant and the Stiefel-Whitney classes are defined, but the `I²` homomorphism, the full Lam V.3.20 comparison and the degree-two relative Stiefel-Whitney formula have not begun.

### Named results

- **The four-fold splitting criterion**: for units `a, b` of a field in which 2 is invertible, `ℍ[K,a,b]` splits exactly when `b` is a norm from `K(√a)`, exactly when `b = x² − a y²` is solvable, and exactly when `⟨1, −a, −b⟩` is isotropic ([`TauCeti.QuaternionAlgebra.nonempty_algEquiv_matrix_tfae`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/Quaternion/SplittingCriterion.html#TauCeti.QuaternionAlgebra.nonempty_algEquiv_matrix_tfae)).
- **The comparison isomorphism `Br(K) ≅ H²(G_K, (Kˢ)ˣ)`**: it sends a crossed product to its inflated cocycle class and is unique with that property ([`TauCeti.brauerCohomologyEquiv`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/CrossedProduct/Comparison.html#TauCeti.brauerCohomologyEquiv)). On 2-torsion it carries `[(a,b)]` to `(a) ∪ (b)` in `H²(G_K, 𝔽₂)` ([`TauCeti.brauer2EquivH2_quaternionClass`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/CrossedProduct/CupProduct.html#TauCeti.brauer2EquivH2_quaternionClass)).
- **The cup-norm theorem**: over any field in which 2 is invertible, `(a) ∪ (b) = 0` exactly when `b = x² − a y²` has a solution ([`TauCeti.cup_kummerClass_eq_zero_iff`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/FieldTheory/GaloisCohomology/MuTwo/CupNorm.html#TauCeti.cup_kummerClass_eq_zero_iff)). Over a local field this makes the Hilbert symbol the cohomological local symbol ([`TauCeti.hilbertSymbol_eq_cohomological`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/FieldTheory/GaloisCohomology/MuTwo/LocalSymbol.html#TauCeti.hilbertSymbol_eq_cohomological)).
- **The local classification** (Serre IV Thm 7): over a nonarchimedean local field with `2 ≠ 0`, regular forms are isometric exactly when dimension, discriminant and local Hasse invariant agree, and every triple outside the two forced exceptions is realized. The isotropy-by-rank theorem gives `u(K) = 4`, and the anisotropic quaternary form is unique ([`QuadraticForm.equivalent_of_finrank_eq_four_of_anisotropic`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/LocalField/QuadraticForm/AnisotropicQuaternary.html#QuadraticForm.equivalent_of_finrank_eq_four_of_anisotropic)).
- **`w₂` is the image of the Hasse invariant**: `ι(s(q)) = w₂(q)`, so two forms have the same `w₂` exactly when they have the same Hasse invariant ([`TauCeti.brauer2EquivH2_hasseInvariant`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/FieldTheory/QuadraticForm/StiefelWhitney/Hasse.html#TauCeti.brauer2EquivH2_hasseInvariant)).

### Notable definitions and infrastructure

- **The Clifford invariant**: the Brauer class of `C(q)` or `C⁰(q)`, chosen by parity, on isometry classes. It is 2-torsion and computed on forms of rank up to four, and it is what the `I²` homomorphism will be built from ([`TauCeti.RegularFormClass.cliffordInvariant`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/QuadraticForm/RegularFormClass/Clifford.html#TauCeti.RegularFormClass.cliffordInvariant)).
- **Descended Stiefel-Whitney classes**: `w₁` and `w₂` as functions of isometry classes. They satisfy the orthogonal-sum formulas and commute with restriction, so the relative formula can be stated on forms rather than on diagonalizations ([`TauCeti.sw2Class`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/FieldTheory/QuadraticForm/StiefelWhitney/Class.html#TauCeti.sw2Class)).
- **The Scharlau transfer on Witt rings**: a `W(K)`-linear map `W(L) → W(K)` satisfying Frobenius reciprocity, which is the transfer side of the relative Stiefel-Whitney formula ([`TauCeti.WittRing.scharlauTransfer`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/QuadraticForm/Transfer/Witt.html#TauCeti.WittRing.scharlauTransfer)).

### Roadmap coverage

- **Done:** Layer 2.
- **Partial, each missing one small item:**
  - Layer 0 lacks the comparison with Serre's contiguous bases.
  - Layer 1 lacks Witt decomposition for forms with a radical. Lam I.4.4 is now proved.
  - Layer 3 lacks the invariant dictionary (Lam's `c` and the Wall caution). The Gram-determinant description is in.
  - Layer 4 lacks `W(ℝ) ≅ ℤ`, which the README lists as remaining.
  - Layer 7 lacks the base-change naturality of `ι`. 7C is complete.
- **Partial, with larger gaps:**
  - Layer 5 has the Hasse and Clifford invariants. It has Lam V.3.20 only in rank at most three, and lacks the `I²` homomorphism and its vanishing on `I³`.
  - Layer 6 has 6B, 6D and the first milestone of 6E, plus 6C through the `ℚ₂` formula and the cohomological comparison. It lacks the `8 × 8` table over `ℚ₂`, the inherited product formula, and `Q(K) = Br(K)[2]` with the invariant-map normalization.
  - Layer 8 lacks only the exact Clifford comparison and the `ℚ₂` examples.
  - Layer 9 has the transfer and the degree-one formula on forms. It lacks the Evens-norm wrappers, the value of the norm on Kummer classes, and the degree-two formula.

## The frontier

- **The relative Stiefel-Whitney formula in degree two**: the carrier wrappers and the value of the Evens norm on Kummer classes, `N((a)) = (Tr a) ∪ (−d·N a) + (2) ∪ (d)`, then Kahn's four-line computation. The `w₂` side is now ready.
- **The Clifford invariant on `I²`**: extend the Lam V.3.20 comparison beyond rank three. Then prove additivity on `I²`, the values on two- and three-fold Pfister forms, and the homomorphism `I² → Br(K)[2]` killing `I³`. The plane-splitting formula for `c` is in place.
- **The Clifford comparison for `w₂`**: `ι(c(q)) = w₂(q) + A_n·((−1) ∪ d) + B_n·((−1) ∪ (−1))`. This follows from `ι(s) = w₂` once the full Lam V.3.20 comparison exists.
- **The rest of 6C and 6E**: the `ℚ₂` table, the product formula from Class Field Theory, and `Q(K) = Br(K)[2]`.
- **Base-change naturality of `ι`**, which depends on the Brauer base-change homomorphism.
