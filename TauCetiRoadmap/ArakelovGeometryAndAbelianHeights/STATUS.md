<!--tauceti-status:v1 {"roadmap":"ArakelovGeometryAndAbelianHeights","to_sha":"58174b5fcdf1ac017fecf4e3c64a05b1c92a4fe2","ts":"2026-11-25T12:15:24Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 1","remaining":"determinant bundles; tensor additivity and the Pic^ group of hermitian lines; non-free duality and base change; Green functions, CH^1 and point heights (1.8-1.15)","state":"partial"},{"id":"Layer 2","remaining":"the Faltings metric (2.1) and the norm-equals-covolume identification of 2.2; metrized Hodge line and 2.3-2.10 untouched","state":"partial"},{"id":"Layer 3","state":"untouched"},{"id":"Layer 4","state":"untouched"},{"id":"Layer 5","state":"untouched"},{"id":"Layer 6","state":"untouched"}],"readme_sha":"39a8555a780c9356c99c3d05aaa39c28a5de4ccad10c7b125b3ed2278f2c07de","roadmap":"ArakelovGeometryAndAbelianHeights","to_sha":"58174b5fcdf1ac017fecf4e3c64a05b1c92a4fe2"}-->
# Status: ArakelovGeometryAndAbelianHeights

This file documents the status of the ArakelovGeometryAndAbelianHeights roadmap up until `58174b5` (2026-11-25T12:15:24Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Only Layer 1 has real content. Within it, the rank-one theory over `Spec O_K` is well advanced: hermitian bundle operations, the section degree and Arakelov divisors. Determinants, the hermitian Picard group and everything from Green functions to point heights are still missing. Layer 2 has only the lattice computation behind §2.2. Layers 3–6 have not begun.

### Named results

- **Principal Arakelov divisors have degree zero.** The degree `log N(𝔞) + Σ_v λ_v` vanishes on `(f)` for every `f ∈ K^×`, which is the product formula ([`ArakelovDivisor.degree_principal`](https://taucetiproject.org/docs/TauCeti/NumberTheory/NumberField/ArakelovDivisor/Basic.html#TauCeti.ArakelovDivisor.degree_principal)).
- **The exact sequence for the compactified Picard group.** The sequence `0 → ℝ^{r₁+r₂}/log|O_K^×| → Pic^(O_K) → Cl(K) → 0` is proved in three parts: the left map is [injective](https://taucetiproject.org/docs/TauCeti/NumberTheory/NumberField/ArakelovDivisor/Basic.html#TauCeti.ArakelovPicardGroup.ofInfinitePartQuotient_injective), the sequence is [exact in the middle](https://taucetiproject.org/docs/TauCeti/NumberTheory/NumberField/ArakelovDivisor/Basic.html#TauCeti.ArakelovPicardGroup.exact_ofInfinitePartQuotient_toClassGroup), and the right map is [surjective](https://taucetiproject.org/docs/TauCeti/NumberTheory/NumberField/ArakelovDivisor/Basic.html#TauCeti.ArakelovPicardGroup.toClassGroup_surjective). Here `Pic^(O_K)` is the group of divisor classes.
- **Independence of the section.** On a hermitian line, `log #(L/O_K s) − Σ_σ log ‖s‖_σ` does not depend on the nonzero section `s` ([`HermitianMetric.sectionDegree_eq_sectionDegree`](https://taucetiproject.org/docs/TauCeti/NumberTheory/NumberField/HermitianBundle/Degree/Basic.html#TauCeti.HermitianMetric.sectionDegree_eq_sectionDegree)).
- **The degree of `O(D)` is the degree of `D`.** The hermitian line of an Arakelov divisor has the same Arakelov degree as the divisor ([`ArakelovDivisor.sectionDegree_hermitianMetric`](https://taucetiproject.org/docs/TauCeti/NumberTheory/NumberField/ArakelovDivisor/HermitianLine.html#TauCeti.ArakelovDivisor.sectionDegree_hermitianMetric)). Principal shifts give [isometric lines](https://taucetiproject.org/docs/TauCeti/NumberTheory/NumberField/ArakelovDivisor/HermitianLine.html#TauCeti.ArakelovDivisor.isometryEquivAddPrincipal).
- **The covolume of `ℤ^g + τℤ^g`.** This lattice has covolume `|det Im τ|`. With a general period matrix `(Ω₁ | Ω₂)` the covolume is `|det Ω₁|²·|det Im τ|` ([`ZLattice.covolume_eq_abs_det_im`](https://taucetiproject.org/docs/TauCeti/Algebra/Module/ZLattice/PeriodMatrix.html#ZLattice.covolume_eq_abs_det_im), [`ZLattice.covolume_eq_normSq_det_mul_abs_det_im`](https://taucetiproject.org/docs/TauCeti/Algebra/Module/ZLattice/PeriodMatrix.html#ZLattice.covolume_eq_normSq_det_mul_abs_det_im)).

### Notable definitions and infrastructure

- **Hermitian bundles over `O_K`** ([`HermitianBundle`](https://taucetiproject.org/docs/TauCeti/NumberTheory/NumberField/HermitianBundle/Basic.html#TauCeti.HermitianBundle)). Every bundle construction in §1.2 except the determinant is built on this structure: orthogonal sums, [tensor products](https://taucetiproject.org/docs/TauCeti/NumberTheory/NumberField/HermitianBundle/TensorProduct.html#TauCeti.HermitianBundle.tmul), [duals](https://taucetiproject.org/docs/TauCeti/NumberTheory/NumberField/HermitianBundle/Dual.html#TauCeti.HermitianBundle.dual) with `Ē ≅ Ē^∨∨` isometrically, sub-bundles, [quotient metrics](https://taucetiproject.org/docs/TauCeti/NumberTheory/NumberField/HermitianBundle/Submodule.html#TauCeti.HermitianBundle.quotient), and [base change](https://taucetiproject.org/docs/TauCeti/NumberTheory/NumberField/HermitianBundle/BaseChange.html#TauCeti.HermitianBundle.baseChange) that agrees with iterated base change up to canonical isometry. An older parallel carrier, [`HermitianVectorBundle`](https://taucetiproject.org/docs/TauCeti/NumberTheory/Arakelov/HermitianVectorBundle.html#TauCeti.HermitianVectorBundle), duplicates part of the degree API.
- **The section degree** ([`HermitianMetric.sectionDegree`](https://taucetiproject.org/docs/TauCeti/NumberTheory/NumberField/HermitianBundle/Degree/Basic.html#TauCeti.HermitianMetric.sectionDegree)). It is the rank-one Arakelov degree. Its proved properties are the effect of rescaling, the value on fractional ideals, invariance under isometry, and the [lattice index term](https://taucetiproject.org/docs/TauCeti/NumberTheory/NumberField/HermitianBundle/Degree/Basic.html#TauCeti.HermitianMetric.sectionDegree_map_eq_add_log_cardQuot_range) for `L ⊂ L′`.

### Roadmap coverage

**Layer 1 is partial.**

- §1.4 is done.
- §1.1, §1.3 and §1.7 are largely done. They lack the group `Pic^(O_K)` of isometry classes of hermitian lines, the higher-rank degree and slope, and the isomorphism from divisor classes to hermitian lines.
- §1.2 has every construction except determinants and the identities involving them.
- §1.5 and §1.6 have the lattice index term. Duality and base change are proved only for a generating section. Additivity under tensor products, direct sums and exact sequences is missing.
- §1.8–§1.15 are untouched: Green functions, `ĈH¹`, point heights, Northcott, the projective-space comparison, and norms of hermitian lines.

**Layer 2 is partial.** Only the lattice-covolume computation behind §2.2 exists, together with its checks for covolumes 1 and 2.

**Layers 3–6 are untouched.**

## The frontier

- **Determinant bundles (§1.2).** Still needed: `det Ē` with its metric, and the isometries `det(Ē ⊕ F̄) ≅ det Ē ⊗ det F̄` and `det Ē ≅ det F̄ ⊗ det Q̄`. These unlock the higher-rank degree, the slope, and additivity for sums and exact sequences (§1.3, §1.5). The Gram-metric exterior algebra in the library may serve the fibrewise part.
- **Tensor additivity and the hermitian Picard group (§1.1, §1.5, §1.7).** Still needed: `deg(L̄ ⊗ M̄) = deg L̄ + deg M̄`, the group of isometry classes under `⊗`, the degree homomorphism on it, and its isomorphism with the divisor classes.
- **Duality and base change for non-free lines (§1.5, §1.6).** Both formulas currently assume that the section generates the module. The general case needs the generic-section form of the degree through a fractional ideal.
- **Arithmetic divisors and point heights (§1.8–§1.14).** Not started. These depend on SchemeAndStackFoundations §§3.4–3.5 and ComplexComparisonPartII for Green currents.
- **The Faltings metric (§2.1, completing §2.2).** The covolume side is ready. It still needs the norm `2^(−g)|∫ α ∧ ᾱ|` on top forms and the Hodge line supplied by AbelianSchemesAndArithmeticModuli.
