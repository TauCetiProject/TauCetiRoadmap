<!--tauceti-status:v1 {"roadmap":"AdelicAlgebraicGroups","to_sha":"d25d526e576659755e7a68a568facb24cb7cf97f","ts":"2026-11-24T20:52:12Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","remaining":"Fubini, factorizable integrals, functoriality, linear Haar change of variables, and the normalized Haar measures on adeles and ideles","state":"partial"},{"id":"Layer 1","remaining":"integral models, the restricted-product comparison, restriction of scalars, G_a/G_m/GL_n comparisons, reductive unimodularity, product levels","state":"partial"},{"id":"Layer 2","state":"untouched"},{"id":"Layer 3","state":"untouched"},{"id":"Layer 4","remaining":"only neat linear automorphisms exist; neat levels, weak and strong approximation, double cosets and Hecke maps remain","state":"partial"},{"id":"Layer 5","remaining":"GL1 quotients, the GL2/Q component decomposition and principal levels, Riemann-surface structure, definite quaternion groups","state":"partial"}],"readme_sha":"9107d80e24bbd1bd34558ebb7e399c4b06a8cea6ce4d940c6c388e67d6202373","roadmap":"AdelicAlgebraicGroups","to_sha":"d25d526e576659755e7a68a568facb24cb7cf97f"}-->
# Status: AdelicAlgebraicGroups

This file documents the status of the AdelicAlgebraicGroups roadmap up until `d25d526` (2026-11-24T20:52:12Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The foundations have started. Layer 0, the measure theory of restricted products, is largely in place except for its integration theorems and the adelic and idelic normalizations. Layer 1 has adelic points and the discreteness of rational points but no integral models yet. Layer 5 has the first pieces of the `GL₂` example. Characters and Tamagawa measures, reduction theory, approximation and Hecke maps (Layers 2–4) have essentially not begun.

### Named results

**Discreteness of rational points** — for a finite-type commutative Hopf algebra over a number field, the rational points embed in the adelic points as a [discrete](https://taucetiproject.org/docs/TauCeti/NumberTheory/NumberField/Global/AdelicPoints/Discrete.html#TauCeti.AdelicPoints.isDiscrete_range_diagonal) and [closed](https://taucetiproject.org/docs/TauCeti/NumberTheory/NumberField/Global/AdelicPoints/Discrete.html#TauCeti.AdelicPoints.isClosed_range_diagonal) subset.

**The finite-adelic discreteness criterion** — `G(K)` is discrete in `G(𝔸_{K,f})` [exactly when it meets a compact open subgroup in a finite set](https://taucetiproject.org/docs/TauCeti/NumberTheory/NumberField/Global/AdelicPoints/Discrete.html#TauCeti.AdelicPoints.discreteTopology_range_finiteDiagonal_iff); so `K` is [not discrete](https://taucetiproject.org/docs/TauCeti/Examples/NumberTheory/NumberField/Global/AdelicPoints/Discrete.html#TauCeti.FiniteAdelicDiscreteness.not_discreteTopology_range_algebraMap) in its finite adeles.

**The Haar character of a local field** — multiplication by `x` scales additive Haar measure on a nonarchimedean local field by [`q^(-v(x))`](https://taucetiproject.org/docs/TauCeti/NumberTheory/LocalField/HaarCharacter.html#MeasureTheory.distribHaarChar_eq_zpow), and the Haar measure giving the integers mass one is [unique](https://taucetiproject.org/docs/TauCeti/NumberTheory/LocalField/HaarCharacter.html#TauCeti.existsUnique_isAddHaarMeasure_measure_integer_eq_one).

**Unimodularity of restricted products** — the modular character of a restricted product is the [finitary product of the local ones](https://taucetiproject.org/docs/TauCeti/MeasureTheory/Measure/Haar/RestrictedProduct.html#RestrictedProduct.modularCharacter_eq_finprod), so a restricted product of unimodular groups [is unimodular](https://taucetiproject.org/docs/TauCeti/MeasureTheory/Measure/Haar/RestrictedProduct.html#RestrictedProduct.modularCharacter_eq_one).

**`GL₂` component groups** — for compact `U ⊂ GL₂(𝔸_f)`, [`GL₂(ℚ)⁺ ∩ gUg⁻¹ = SL₂(ℚ) ∩ gUg⁻¹`](https://taucetiproject.org/docs/TauCeti/NumberTheory/ModularForms/AdelicComponentGroup.html#TauCeti.AdelicExamples.GL2.componentGroup_eq_ker_det_inf). This holds because compact subgroups of the finite ideles lie in the [integral units](https://taucetiproject.org/docs/TauCeti/RingTheory/DedekindDomain/FiniteAdeleRing/Topology.html#TauCeti.le_integralUnits_of_isCompact).

### Notable definitions and infrastructure

- The [adelic points](https://taucetiproject.org/docs/TauCeti/NumberTheory/NumberField/Global/AdelicPoints/Basic.html#TauCeti.AdelicPoints) of a Hopf algebra, with finite, infinite and local parts and a [splitting away from finitely many places](https://taucetiproject.org/docs/TauCeti/NumberTheory/NumberField/Global/AdelicPoints/Away.html#TauCeti.AdelicPoints.awayContinuousMulEquiv). Every later layer is stated on this carrier.
- The congruence levels `K₀(N)`, `K₁(N)` and the [principal level](https://taucetiproject.org/docs/TauCeti/RingTheory/DedekindDomain/FiniteAdeleRing/CongruenceLevel.html#IsDedekindDomain.FiniteAdeleRing.principalLevel) `K(N)` in `GL₂(𝔸_f)` over a Dedekind domain. They are proved compact open through the [open embedding of `GL_n(Ô)`](https://taucetiproject.org/docs/TauCeti/RingTheory/DedekindDomain/FiniteAdeleRing/CongruenceLevel.html#IsDedekindDomain.FiniteAdeleRing.isOpenEmbedding_integralGL), and they are the levels the `GL₂` example needs.
- The restricted and convergent products of local Haar measures, together with the Borel structure and second countability of restricted products. Changing finitely many local normalizations [rescales the convergent product accordingly](https://taucetiproject.org/docs/TauCeti/MeasureTheory/Measure/Haar/RestrictedProduct.html#TauCeti.convergentHaarProduct_eq_smul_of_eq_smul), which is what Tamagawa measures will need.

### Roadmap coverage

**Layer 0** is partial. Done: the Borel structure, the local Haar character, the restricted and convergent Haar products with changes of normalization and of integral subgroups, unimodularity, and the failure of products of form measures. Missing: Fubini, factorizable integrals, functoriality, linear change of variables, and the normalized Haar measures on the adeles and ideles. **Layer 1** is partial. Done: adelic points, discreteness and closedness of rational points, splitting off places, triviality of the modular character on compact and central elements. Missing: integral models, the restricted-product comparison, restriction of scalars, the concrete groups `G_a`, `G_m` and `GL_n`, reductive unimodularity, and general product levels. **Layers 2 and 3** are untouched. **Layer 4** is partial only in that the library already has neat linear automorphisms, with powers and the triviality of finite-order neat elements. Neatness for algebraic groups, approximation, double cosets and Hecke maps are not started. **Layer 5** is partial. Done: the `GL₂` congruence levels, the determinant computation for component groups, the raw Möbius action, and `GL₂(ℝ)/ℝ^× SO(2) ≃ ℂ ∖ ℝ`. Missing: `GL₁` and the quaternion examples.

## The frontier

- **The restricted-product comparison** — identify `G(𝔸_{F,f})` with `Πʳ v, [G(F_v), 𝓗(𝒪_v)]` through an integral model. This is the next Layer 1 milestone, and the concrete groups `G_m`, `GL_n` and the product levels are stated through it.
- **Adelic and idelic Haar measures** — the second countability and Borel structure of `𝔸_K`, the normalized measures on `𝔸_{K,f}`, `𝔸_K` and `𝔸_K^×`, and the idele norm as their Haar character. The local character and the convergent products these need are done.
- **Fubini and factorizable integrals** — integration against restricted products of Haar measures, the remaining analytic piece of Layer 0.
- **The `GL₂/ℚ` level quotient** — decompose `GL₂(ℚ)\GL₂(𝔸)/K_∞U` into copies of `Γ_c\ℍ`. This needs class-number and strong-approximation inputs from Layers 3 and 4, so it is not near.
- **Rational characters and `G(𝔸)^1`** — the first milestones of Layer 2, which nothing yet addresses.
