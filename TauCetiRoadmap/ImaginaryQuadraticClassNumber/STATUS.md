<!--tauceti-status:v1 {"roadmap":"ImaginaryQuadraticClassNumber","to_sha":"b4b3ce57a438a4ec6e21ef62e4a5607ae920a5e0","ts":"2026-10-23T19:26:26Z"}-->
# Status: ImaginaryQuadraticClassNumber

This file documents the status of the ImaginaryQuadraticClassNumber roadmap up until `b4b3ce5` (2026-10-23T19:26:26Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The fields themselves are mostly in place (H1.1): the radicand classification, the complex embeddings and the signature are all proved. Three lanes have only their first step: the form–ideal correspondence (H1.3), the analytic class number formula (H2.2) and the Siegel functions (H3.2). Neither summit has been started: there is no uniform finiteness theorem and no class-number-one classification.

### Named results

- **The radicand classification of imaginary quadratic fields**: every totally complex quadratic number field is ℚ-isomorphic to ℚ(√d) for exactly one negative squarefree integer d. ([`NumberField.existsUnique_neg_squarefree_algEquiv`](https://taucetiproject.org/docs/TauCeti/NumberTheory/NumberField/Quadratic/Radicand.html#NumberField.existsUnique_neg_squarefree_algEquiv))
- **The squarefree radicand is an isomorphism invariant**: ℚ(√d) and ℚ(√e) with d, e squarefree are isomorphic exactly when d = e. ([`NumberField.nonempty_algEquiv_iff_of_squarefree`](https://taucetiproject.org/docs/TauCeti/NumberTheory/NumberField/Quadratic/Radicand.html#NumberField.nonempty_algEquiv_iff_of_squarefree))
- **The two complex embeddings**: every complex embedding of ℚ(√d), d < 0, is either the distinguished one or its complex conjugate, so the field has exactly one complex place. ([`QuadraticAlgebra.ringHom_eq_or_eq_conjugate`](https://taucetiproject.org/docs/TauCeti/NumberTheory/NumberField/Quadratic/ComplexEmbedding.html#QuadraticAlgebra.ringHom_eq_or_eq_conjugate), [`QuadraticAlgebra.nrComplexPlaces_eq_one`](https://taucetiproject.org/docs/TauCeti/NumberTheory/NumberField/Quadratic/ComplexEmbedding.html#QuadraticAlgebra.nrComplexPlaces_eq_one))
- **Positivity of L(1, χ) for real characters**: the continued L-function of a nontrivial quadratic Dirichlet character takes a positive real value at s = 1. This is the per-character input to the class number formula; it gives no bound that is uniform in the conductor. ([`DirichletCharacter.LFunction_apply_one_pos`](https://taucetiproject.org/docs/TauCeti/NumberTheory/LSeries/QuadraticCharacter.html#DirichletCharacter.LFunction_apply_one_pos))
- **Injectivity of the form-to-ideal map**: properly inequivalent primitive positive definite forms of discriminant −n have distinct classes in the Picard group of the order. ([`TauCeti.BinaryQuadraticForm.posDefProperClassToPic_injective`](https://taucetiproject.org/docs/TauCeti/NumberTheory/BinaryQuadraticForm/Ideal/Class.html#TauCeti.BinaryQuadraticForm.posDefProperClassToPic_injective))

### Notable definitions and infrastructure

- **The distinguished complex embedding** ([`QuadraticAlgebra.complexEmbedding`](https://taucetiproject.org/docs/TauCeti/NumberTheory/NumberField/Quadratic/ComplexEmbedding.html#QuadraticAlgebra.complexEmbedding)) sends √d into the upper half-plane. This fixes the orientation that the CM part needs for τ_D and for the oriented ideal lattices.
- **The Siegel function** ([`TauCeti.ModularForm.siegelFunction`](https://taucetiproject.org/docs/TauCeti/NumberTheory/ModularForms/SiegelFunction.html#TauCeti.ModularForm.siegelFunction)) is built as a phase times the theta product [`TauCeti.qTheta`](https://taucetiproject.org/docs/TauCeti/Analysis/SpecialFunctions/QPochhammer.html#TauCeti.qTheta). It is proved holomorphic and nowhere zero, with its behaviour under τ ↦ τ + 1 and under integral shifts of r. These are the starting point for the level-2 norms in H3.3.
- **The Picard class of a form** ([`TauCeti.BinaryQuadraticForm.posDefProperClassToPic`](https://taucetiproject.org/docs/TauCeti/NumberTheory/BinaryQuadraticForm/Ideal/Class.html#TauCeti.BinaryQuadraticForm.posDefProperClassToPic)) carries proper form classes into the GlobalNumberFields Picard group, which is the carrier the roadmap requires.

### Roadmap coverage

**H1.1** is largely done. Still missing are explicit algebra equivalences evaluated on the generator, the Q×/(Q×)² criterion for arbitrary rational parameters, and the naturality statements. **H1.3** is partial: it has injectivity but not surjectivity, composition, the f = 1 comparison with the class group, or the certified reduced-form enumeration. **H2.2** is partial: it has positivity of L(1, χ), but neither ζ_K = ζ·L(χ_D) nor h(D) = w√|D| L(1, χ_D)/(2π). **H3.2** is partial: it has the construction, holomorphy, nonvanishing and translations, but not the full SL₂ law, g₀g₁g₂ = 2ζ₈ or γ₂. Nothing specific to this roadmap has landed for H1.2, H1.4, H2.1, H2.3–H2.4, H3.1 or H3.3–H3.6. The library does contain related supplier material (quadratic orders, reduced forms, a Hurwitz class number) that this roadmap has not yet connected to.

## The frontier

- **Surjectivity of the form–ideal map (H1.3)**: show that every invertible proper ideal class contains a lattice aℤ + ((−b + √D)/2)ℤ for a primitive form. This completes the bijection, after which the reduced-form enumeration can compute class numbers.
- **The character χ_D (H2.1)**: build the primitive quadratic character of conductor |D| and its values at split, inert and ramified primes, including 2. The positivity result can then be specialised to it.
- **The class number formula (H2.2)**: factor ζ_K as ζ·L(χ_D), compare residues and obtain h(D) = w_D√|D| L(1, χ_D)/(2π). This needs H2.1 and the unit counts from H1.2.
- **Units and maximal orders (H1.2)**: show the unit group has order 6, 4 or 2 according as D is −3, −4 or anything else, and transport the integral bases to the ℚ(√d) models.
- **The Siegel function's SL₂ law and γ₂ (H3.2)**: the S-transformation with its root-of-unity factor, then g₀g₁g₂ = 2ζ₈ and γ₂ = (g_i¹² + 16)/g_i⁴.
