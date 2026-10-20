<!--tauceti-status:v1 {"roadmap":"QuadraticFormInvariants","to_sha":"68a457ec2b1aee486f4192ee3ea36a04f70efb8c","ts":"2026-10-20T05:58:24Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","state":"done"},{"id":"Layer 1","state":"done"},{"id":"Layer 2","state":"done"},{"id":"Layer 3","state":"done"},{"id":"Layer 4","state":"done"},{"id":"Layer 5","state":"done"},{"id":"Layer 6","state":"done"},{"id":"Layer 7","state":"done"},{"id":"Layer 8","state":"done"},{"id":"Layer 9","remaining":"the finite dyadic specialization over an arbitrary finite extension of Q_2; only Q_2(sqrt 5)/Q_2 is computed, on all sixteen square classes","state":"partial"}],"readme_sha":"5221c62cb98c724d5bc1ddbed7e55e96be4b6265450add8adacb88cabd4b418c","roadmap":"QuadraticFormInvariants","to_sha":"68a457ec2b1aee486f4192ee3ea36a04f70efb8c"}-->
# Status: QuadraticFormInvariants

This file documents the status of the QuadraticFormInvariants roadmap up until `68a457e` (2026-10-20T05:58:24Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Nine of the ten layers are done, including all three of the roadmap's high points: the four-fold splitting criterion, the local classification, and Kahn's relative Stiefel-Whitney formula in degree two. What remains is in Layer 9, whose finite dyadic acceptance example has been computed only for `ℚ₂(√5)/ℚ₂`.

### Named results

- **The four-fold splitting criterion** — for units `a, b` of a field with `2` invertible, `ℍ[K,a,b]` is a matrix algebra exactly when `b` is a norm from `K(√a)`, when `b = x² − a y²` is solvable, and when `⟨1, −a, −b⟩` is isotropic ([`TauCeti.QuaternionAlgebra.nonempty_algEquiv_matrix_tfae`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/Quaternion/SplittingCriterion.html#TauCeti.QuaternionAlgebra.nonempty_algEquiv_matrix_tfae)).
- **The local classification with realization** (O'Meara 63:20 and 63:23, Serre IV Thm 7 and Prop 6) — over a nonarchimedean local field with `2 ≠ 0`, the map sending a regular form to its rank, discriminant and Hasse invariant is a bijection onto the admissible triples ([`TauCeti.RegularFormClass.localInvariantsEquiv`](https://taucetiproject.org/docs/TauCeti/NumberTheory/LocalField/QuadraticForm/Invariants.html#TauCeti.RegularFormClass.localInvariantsEquiv)).
- **Hilbert's product formula** — for `a, b` in a number field, the local Hilbert symbols over the finite and real places multiply to `1` ([`TauCeti.hilbertSymbol_productFormula`](https://taucetiproject.org/docs/TauCeti/NumberTheory/QuadraticForm/Global/ProductFormula.html#TauCeti.hilbertSymbol_productFormula)). It is Class Field Theory's Hilbert reciprocity, read through the sign dictionary.
- **The Brauer comparison, with base change** — `Br(K) ≅ H²(G_K, (Kˢ)ˣ)` ([`TauCeti.brauerCohomologyEquiv`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/CrossedProduct/Comparison.html#TauCeti.brauerCohomologyEquiv)) carries `[(a,b)]` to `(a) ∪ (b)` on 2-torsion. On every 2-torsion class, it turns scalar extension along a finite separable `L/K` into restriction ([`TauCeti.brauer2EquivH2_baseChange`](https://taucetiproject.org/docs/TauCeti/Algebra/CrossedProduct/BaseChange/Naturality.html#TauCeti.brauer2EquivH2_baseChange)).
- **The relative Stiefel-Whitney formula in degree two** (Kahn, Théorème 2) — for a quadratic extension `L/K` and `a ∈ Lˣ`, `w₂(Tr_*⟨a⟩) = w₂(Tr_*⟨1⟩) + N^{Ev}((a)) + w₁(Tr_*⟨1⟩) ∪ cor(a)`. The Evens norm term is computed by Serre's `Pin⁺` matrix argument (`sw2Class_formClass_traceTransfer_smul_sq`).

### Notable definitions and infrastructure

- **The Clifford homomorphism on `I²`**. Lam's comparison, which writes `c(q)` as `s(q)` times powers of `[(−1,d)]` and `[(−1,−1)]` fixed by the dimension ([`TauCeti.RegularFormClass.cliffordInvariant_eq_hasseInvariant_mul`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/QuadraticForm/RegularFormClass/Clifford.html#TauCeti.RegularFormClass.cliffordInvariant_eq_hasseInvariant_mul)) makes the Clifford invariant additive on `I²`, and it descends to `I²/I³ → Br(K)[2]` (`cliffordHomI2Bar`).
- **The Hilbert symbol as a bilinear form**. On a local field the symbol is a nondegenerate symmetric `𝔽₂`-bilinear form on square classes ([`TauCeti.hilbertSymbolForm`](https://taucetiproject.org/docs/TauCeti/NumberTheory/LocalField/QuadraticForm/HilbertSymbolForm.html#TauCeti.hilbertSymbolForm)). This is how the roadmap determines the symbol over a dyadic field, where no closed formula of Serre's shape exists. The sharp norm-group bounds for units of odd defect exponent complete that determination.
- **Explicit `𝔽₂` cocycle classes and the `Pin⁺` plane**. Hand-written continuous 2-cocycles have classes in `H²`, and cups of characters are product cocycles ([`TauCeti.ContCohomology.cup11_homClass`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/RepresentationTheory/Homological/ContCohomology/Cup/TrivialF2/Inhomogeneous.html#TauCeti.ContCohomology.cup11_homClass)). Every cochain-level computation in Layer 9 is read through these classes.

### Roadmap coverage

- **Done:** Layers 0 to 8. Three of them were completed recently. Layer 3 has its invariant dictionary (O'Meara's product, Serre's `ε`, Lam's `s` and `c`, and the Wall caution). Layer 6 has the general product formula, realization, and the sharp defect bounds. Layer 7 has base-change naturality of `ι` for every 2-torsion class. Layer 0 has also gained the rank-one boundary example: `⟨1⟩ ≅ ⟨4⟩` over `ℚ`, but no diagonal chain joins them.
- **Partial:** Layer 9. Both relative formulas hold for quadratic extensions in degrees one and two, and Scharlau transfer commutes with base change. The dyadic example covers all sixteen square classes of `ℚ₂(√5)` ([`existsUnique_relative_traceTransfer_values_of_odd`](https://taucetiproject.org/docs/TauCeti/NumberTheory/LocalField/WorkedExamples/DyadicSqrt/Five/Relative.html#TauCeti.DyadicSqrtFive.existsUnique_relative_traceTransfer_values_of_odd)), but not a general finite extension of `ℚ₂`.

## The frontier

- **The finite dyadic specialization**: state the two Layer 9 identities over an arbitrary finite extension `K/ℚ₂` with `L = K(√d)`, as computations in `H²(G_K, 𝔽₂)`. The inputs are in place: the square-class count of a finite extension, the Hilbert symbol form, and the formula for the Evens norm of a Kummer class scaled by a base unit. Only the case `K = ℚ₂`, `L = ℚ₂(√5)` is done.
- **Handing off to the global theory**: the local invariants and the product formula are what `GlobalQuadraticForms` consumes for Hasse–Minkowski and global classification. That work is outside this roadmap.
