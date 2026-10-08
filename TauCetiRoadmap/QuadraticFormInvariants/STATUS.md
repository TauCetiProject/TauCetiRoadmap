<!--tauceti-status:v1 {"roadmap":"QuadraticFormInvariants","to_sha":"8334df225e9c15d22464fe5432d849ee6391c09a","ts":"2026-10-07T18:27:27Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","remaining":"the comparison of diagonal chains with Serre's contiguous orthogonal bases (Serre IV Thm 5)","state":"partial"},{"id":"Layer 1","remaining":"Witt decomposition of a possibly degenerate form with its radical, all parts unique up to isometry","state":"partial"},{"id":"Layer 2","state":"done"},{"id":"Layer 3","remaining":"the invariant dictionary documentation, including Lam's c and the Wall caution","state":"partial"},{"id":"Layer 4","state":"done"},{"id":"Layer 5","remaining":"additivity of c on I2, the homomorphism I2 to Br(K)[2] vanishing on I3, and its quotient map","state":"partial"},{"id":"Layer 6","remaining":"the 8x8 Hilbert-symbol table over Q_2 and the product formula inherited from Class Field Theory","state":"partial"},{"id":"Layer 7","remaining":"base-change naturality of iota along a finite separable extension","state":"partial"},{"id":"Layer 8","remaining":"the exact comparison of iota of the Clifford invariant with w2, and the Q_2 table of examples","state":"partial"},{"id":"Layer 9","remaining":"the value of the Evens norm on Kummer classes and the degree-two relative formula","state":"partial"}],"readme_sha":"1998a1018a9c779037c84025ce946b08225fb84e074bac2e79b62e89184ec925","roadmap":"QuadraticFormInvariants","to_sha":"8334df225e9c15d22464fe5432d849ee6391c09a"}-->
# Status: QuadraticFormInvariants

This file documents the status of the QuadraticFormInvariants roadmap up until `8334df2` (2026-10-07T18:27:27Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Quaternion algebras (Layer 2) and the Witt ring (Layer 4) are done. The local classification by `(dim, d, s)`, `Br(K) ≅ H²` with the cup-norm theorem, and Lam's full comparison of the Clifford and Hasse invariants are all proved. Three things have not started: the `I²` homomorphism, the exact Clifford comparison for `w₂`, and the degree-two relative Stiefel-Whitney formula.

### Named results

- **The four-fold splitting criterion**: for units `a, b` of a field in which 2 is invertible, `ℍ[K,a,b]` splits exactly when `b` is a norm from `K(√a)`, exactly when `b = x² − a y²` is solvable, and exactly when `⟨1, −a, −b⟩` is isotropic ([`TauCeti.QuaternionAlgebra.nonempty_algEquiv_matrix_tfae`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/Quaternion/SplittingCriterion.html#TauCeti.QuaternionAlgebra.nonempty_algEquiv_matrix_tfae)).
- **The comparison isomorphism `Br(K) ≅ H²(G_K, (Kˢ)ˣ)`**: it sends a crossed product to its inflated cocycle class, and on 2-torsion it carries `[(a,b)]` to `(a) ∪ (b)` ([`TauCeti.brauerCohomologyEquiv`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/CrossedProduct/Comparison.html#TauCeti.brauerCohomologyEquiv)). From this comes the cup-norm theorem: `(a) ∪ (b) = 0` exactly when `b = x² − a y²` is solvable ([`TauCeti.cup_kummerClass_eq_zero_iff`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/FieldTheory/GaloisCohomology/MuTwo/CupNorm.html#TauCeti.cup_kummerClass_eq_zero_iff)).
- **The local classification** (Serre IV Thm 7): over a nonarchimedean local field with `2 ≠ 0`, regular forms are classified by dimension, discriminant and Hasse invariant, and `u(K) = 4` with a unique anisotropic quaternary form ([`QuadraticForm.equivalent_of_finrank_eq_four_of_anisotropic`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/LocalField/QuadraticForm/AnisotropicQuaternary.html#QuadraticForm.equivalent_of_finrank_eq_four_of_anisotropic)). In addition, every 2-torsion Brauer class is a quaternion class ([`TauCeti.BrauerGroup.quaternionSubgroup_eq_twoTorsion`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/LocalField/Quaternion/Invariant.html#TauCeti.BrauerGroup.quaternionSubgroup_eq_twoTorsion)), and its local invariant is `1/2` exactly when the Hilbert symbol is `−1`.
- **Lam's comparison of the Clifford and Hasse invariants** (Lam V.3.20), in every rank: `c(q)` equals `s(q)` up to powers of `[(−1, d)]` and `[(−1,−1)]` that depend only on the dimension ([`TauCeti.RegularFormClass.cliffordInvariant_eq_hasseInvariant_mul`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/QuadraticForm/RegularFormClass/Clifford.html#TauCeti.RegularFormClass.cliffordInvariant_eq_hasseInvariant_mul)).
- **`w₂` is the image of the Hasse invariant**: `ι(s(q)) = w₂(q)` ([`TauCeti.brauer2EquivH2_hasseInvariant`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/FieldTheory/QuadraticForm/StiefelWhitney/Hasse.html#TauCeti.brauer2EquivH2_hasseInvariant)).

### Notable definitions and infrastructure

- **The Clifford invariant**: the Brauer class of `C(q)` or `C⁰(q)`, chosen by parity, defined on isometry classes ([`TauCeti.RegularFormClass.cliffordInvariant`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/QuadraticForm/RegularFormClass/Clifford.html#TauCeti.RegularFormClass.cliffordInvariant)). Its values on the generators of `I²` and `I³` are already computed: `[(a,b)]` on a two-fold Pfister form, and trivial on a three-fold one. Those values are what the `I²` homomorphism will be built from.
- **The signature** on Witt classes over an ordered field, which gives `W(K) ≅ ℤ` for every real closed `K`, `ℝ` included ([`TauCeti.WittRing.equivInt`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/QuadraticForm/Witt/Signature.html#TauCeti.WittRing.equivInt)).
- **The Scharlau transfer on Witt rings** satisfies Frobenius reciprocity ([`TauCeti.WittRing.scharlauTransfer`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/QuadraticForm/Transfer/Witt.html#TauCeti.WittRing.scharlauTransfer)). Kahn's basis computes the twisted trace form of a quadratic extension as `⟨Tr a, d·Tr a/N a⟩`. These give the transfer side of the relative Stiefel-Whitney formula.

### Roadmap coverage

- **Done:** Layers 2 and 4.
- **Partial, each missing one small item:**
  - Layer 0 lacks the comparison with Serre's contiguous bases.
  - Layer 1 lacks Witt decomposition for forms with a radical.
  - Layer 3 lacks the invariant dictionary: Lam's `c` and the Wall caution.
  - Layer 7 lacks the base-change naturality of `ι`.
- **Partial, with larger gaps:**
  - Layer 5 has the Hasse and Clifford invariants and the full Lam V.3.20 comparison. It lacks additivity on `I²`, the homomorphism `I² → Br(K)[2]`, and its descent to `I²/I³`.
  - Layer 6 has everything except the `8 × 8` table over `ℚ₂` and the product formula inherited from Class Field Theory. 6E is now complete.
  - Layer 8 lacks the exact Clifford comparison and the `ℚ₂` examples.
  - Layer 9 has the transfer, Kahn's basis, the degree-one formula and the Evens norm along a quadratic extension. It lacks the value of that norm on Kummer classes and the degree-two formula.

## The frontier

- **The `I²` homomorphism**: prove `c(q ⊥ r) = c(q)·c(r)` when both summands lie in `I²`. It should follow from Lam V.3.20 and the orthogonal-sum formula for `s`. The generator values are in place, so `cliffordHomI2`, its vanishing on `I³`, and the quotient map `cliffordHomI2Bar` then follow.
- **The Clifford comparison for `w₂`**: `ι(c(q)) = w₂(q) + A_n·((−1) ∪ d) + B_n·((−1) ∪ (−1))`. Both `ι(s) = w₂` and the full Lam V.3.20 are now proved, so this is a matter of carrying one through the other.
- **The relative Stiefel-Whitney formula in degree two**: compute the Evens norm on Kummer classes, `N((a)) = (Tr a) ∪ (−d·N a) + (2) ∪ (d)`. The Kummer characters on `G_L` give the input in the right shape. Then do Kahn's computation against the twisted trace form.
- **The rest of Layer 6**: the `ℚ₂` table on `{±1, ±5, ±2, ±10}`, and the sign product formula taken from Class Field Theory's Hilbert reciprocity.
- **Base-change naturality of `ι`**: this needs the Brauer base-change homomorphism, which the semisimple-algebras roadmap states only in prose.
