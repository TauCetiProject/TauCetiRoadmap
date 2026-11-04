<!--tauceti-status:v1 {"roadmap":"QuadraticFormInvariants","to_sha":"e8ea0d187d0e20fa24ab5f68cfc27b2d40b876bd","ts":"2026-10-25T17:19:50Z"}-->
# Status: QuadraticFormInvariants

**Current audit (2026-10-28): incomplete.** The actual upward-`ULift` transport and
Brauer/cohomology naturality square remain open. See the
[coverage audit](README.md#completion-audit-2026-10-28). The dated generated snapshot below
is retained as historical reporting and does not establish current completion.

This file documents the status of the QuadraticFormInvariants roadmap up until `e8ea0d1` (2026-10-25T17:19:50Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** All ten layers are done. That includes the roadmap's three high points: the four-fold splitting criterion, the local classification, and Kahn's relative Stiefel-Whitney formula in degree two. The last open item, the finite dyadic specialization of that formula, now holds over every nonarchimedean local field in which `2` is invertible.

### Named results

- **The four-fold splitting criterion** — for units `a, b` of a field with `2` invertible, `ℍ[K,a,b]` is a matrix algebra exactly when `b` is a norm from `K(√a)`, exactly when `b = x² − a y²` is solvable, and exactly when `⟨1, −a, −b⟩` is isotropic ([`TauCeti.QuaternionAlgebra.nonempty_algEquiv_matrix_tfae`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Algebra/Quaternion/SplittingCriterion.html#TauCeti.QuaternionAlgebra.nonempty_algEquiv_matrix_tfae)).
- **The local classification with realization** (O'Meara 63:20 and 63:23, Serre IV Thm 7 and Prop 6) — over a nonarchimedean local field with `2 ≠ 0`, sending a regular form to its rank, discriminant and Hasse invariant is a bijection onto the admissible triples ([`TauCeti.RegularFormClass.localInvariantsEquiv`](https://taucetiproject.org/docs/TauCeti/NumberTheory/LocalField/QuadraticForm/Invariants.html#TauCeti.RegularFormClass.localInvariantsEquiv)).
- **Hilbert's product formula** — for `a, b` in a number field, the local Hilbert symbols at the finite and real places multiply to `1` ([`TauCeti.hilbertSymbol_productFormula`](https://taucetiproject.org/docs/TauCeti/NumberTheory/QuadraticForm/Global/ProductFormula.html#TauCeti.hilbertSymbol_productFormula)).
- **The Brauer comparison** — `Br(K) ≅ H²(G_K, (Kˢ)ˣ)` ([`TauCeti.brauerCohomologyEquiv`](https://taucetiproject.org/docs/TauCeti/Algebra/CrossedProduct/Comparison.html#TauCeti.brauerCohomologyEquiv)) is determined by its value on crossed products and carries `[(a,b)]` to `(a) ∪ (b)` on 2-torsion. It also turns scalar extension along a finite separable `L/K` into restriction ([`TauCeti.brauer2EquivH2_baseChange`](https://taucetiproject.org/docs/TauCeti/Algebra/CrossedProduct/BaseChange/Naturality.html#TauCeti.brauer2EquivH2_baseChange)).
- **The relative Stiefel-Whitney formula in degree two** (Kahn, Théorème 2) — for a quadratic extension `L/K` and `a ∈ Lˣ`, `w₂(Tr_*⟨a⟩) = w₂(Tr_*⟨1⟩) + N^{Ev}((a)) + w₁(Tr_*⟨1⟩) ∪ cor(a)` ([`TauCeti.sw2Class_formClass_traceTransfer_smul_sq`](https://taucetiproject.org/docs/TauCeti/FieldTheory/QuadraticForm/StiefelWhitney/QuadraticExtension.html#TauCeti.sw2Class_formClass_traceTransfer_smul_sq)). Over a local field, every term is a Hilbert symbol times one fixed nonzero class ([`TauCeti.galoisEvens_kummerClass_eq_hilbertSymbol_smul`](https://taucetiproject.org/docs/TauCeti/NumberTheory/LocalField/QuadraticForm/StiefelWhitney/Transfer.html#TauCeti.galoisEvens_kummerClass_eq_hilbertSymbol_smul)).

### Notable definitions and infrastructure

- **The Clifford homomorphism on `I²`**. Lam's comparison ([`TauCeti.RegularFormClass.cliffordInvariant_eq_hasseInvariant_mul`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/LinearAlgebra/QuadraticForm/RegularFormClass/Clifford.html#TauCeti.RegularFormClass.cliffordInvariant_eq_hasseInvariant_mul)) writes `c(q)` as `s(q)` times powers of `[(−1,d)]` and `[(−1,−1)]`, with exponents fixed by the dimension. This makes the Clifford invariant additive on `I²`, so it descends to `I²/I³ → Br(K)[2]`.
- **The Hilbert symbol as a bilinear form**. On a local field the symbol is a nondegenerate symmetric `𝔽₂`-bilinear form on square classes ([`TauCeti.hilbertSymbolForm`](https://taucetiproject.org/docs/TauCeti/NumberTheory/LocalField/QuadraticForm/HilbertSymbolForm.html#TauCeti.hilbertSymbolForm)). This is how the roadmap pins down the symbol over a dyadic field, where no closed formula of Serre's shape exists.
- **Kummer cups as Hilbert symbols**. Over a local field, every cup `(a) ∪ (b)` is `(a, b)_K` times a fixed nonzero class ([`TauCeti.cup_kummerClass_eq_hilbertSymbol_smul`](https://taucetiproject.org/docs/TauCeti/NumberTheory/LocalField/QuadraticForm/Cup/Basic.html#TauCeti.cup_kummerClass_eq_hilbertSymbol_smul)). This identifies `H²(G_K, 𝔽₂)` with signs, and it is what turns the Layer 9 identities into computations.

### Roadmap coverage

**Done:** Layers 0 to 9. Layer 9 was the last to close. Both relative formulas now hold for quadratic extensions, and Scharlau transfer commutes with base change. The dyadic specialization covers every finite extension of `ℚ₂`, in the form "both sides are explicit `ZMod 2` multiples of one class, with Hilbert-symbol coefficients". Fully tabulated cases are `ℚ₂` and `ℚ₂(√5)/ℚ₂`, where all sixteen square classes are covered ([`existsUnique_relative_traceTransfer_values_of_odd`](https://taucetiproject.org/docs/TauCeti/NumberTheory/LocalField/WorkedExamples/DyadicSqrt/Five/Relative.html#TauCeti.DyadicSqrtFive.existsUnique_relative_traceTransfer_values_of_odd)), and the unramified quadratic extension of any finite extension of `ℚ₂`, where `w₂(Tr_*⟨1⟩) ≠ 0` exactly when the ramification index is odd.

## The frontier

- **Explicit dyadic tables beyond `ℚ₂`**: over a general finite extension of `ℚ₂`, the Layer 9 identities reduce to Hilbert symbols, but those symbols are pinned down only abstractly, through the bilinear form and the defect bounds. Numerical tables exist only for `ℚ₂` and `ℚ₂(√5)`. The new §63A integral bases and unit-norm descriptions are the natural inputs for further cases. This is beyond the roadmap's stated milestones.
- **Handing off to the global theory**: the local invariants and the product formula are what `GlobalQuadraticForms` consumes for Hasse–Minkowski and global classification. That work is outside this roadmap.
