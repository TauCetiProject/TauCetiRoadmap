<!--tauceti-status:v1 {"roadmap":"LocalFieldsRamification","to_sha":"d2083f0f1dd2136d02467ba36efbbe1af612e89c","ts":"2026-11-08T09:37:56Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","state":"done"},{"id":"Layer 1","state":"done"},{"id":"Layer 2","state":"done"},{"id":"Layer 3","state":"done"},{"id":"Layer 4","state":"done"}],"readme_sha":"cc0d29a2d7ffc87832a0172faf2e2506866bd70623e2932e2e985fd367ffbae1","roadmap":"LocalFieldsRamification","to_sha":"d2083f0f1dd2136d02467ba36efbbe1af612e89c"}-->
# Status: LocalFieldsRamification

This file documents the status of the LocalFieldsRamification roadmap up until `d2083f0` (2026-11-08T09:37:56Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** All five layers are done, and the roadmap is complete. The summit, Iwasawa's presentation of the tame quotient, is proved, as are Herbrand's theorem in both numberings and the general Hasse–Arf theorem. The tame quotient is identified with Gal(K^t/K), and tame inertia with both the prime-to-p Tate module and ∏_{ℓ ≠ p} ℤ_ℓ.

### Named results

- **Iwasawa's theorem** — the tame quotient G_K/P_K is isomorphic as a topological group to the profinite group ⟨σ, τ | στσ⁻¹ = τ^q⟩, via an isomorphism fixed by an arithmetic Frobenius lift and a tame inertia generator ([`nonempty_continuousMulEquiv_iwasawaGroup`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/LocalField/Tame/Presentation.html#TauCeti.nonempty_continuousMulEquiv_iwasawaGroup)). For ℚ₂ it is [worked out explicitly](https://taucetiproject.org/docs/TauCeti/NumberTheory/LocalField/WorkedExamples/Padic/Two/Tame.html#TauCeti.exists_marked_tameQuotient_padic_two), with στσ⁻¹ = τ².
- **The Hasse–Arf theorem** — every upper ramification break of a finite abelian extension of local fields is an integer (`hasseArf`, TauCeti#13558). The proof [detects upper breaks in a cyclic subextension](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/LocalField/Herbrand/CyclicReduction.html#TauCeti.LocalFieldsRamification.upperJump_iff_exists_isCyclic_intermediateField) and reduces the cyclic case to prime-power degree.
- **Herbrand's theorem** — for a normal subgroup H, restriction carries G^v onto (G/H)^v in the upper numbering ([`map_restrictNormalHom_upperRamificationGroup`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/LocalField/Herbrand/UpperQuotient.html#TauCeti.LocalFieldsRamification.map_restrictNormalHom_upperRamificationGroup)). The lower numbering fails this, and ℚ₂(ζ₈) gives a proved [witness](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/LocalField/WorkedExamples/CyclotomicEight/Quotient.html#TauCeti.DyadicCyclotomicEight.map_restrictSqrtTwo_lowerRamificationGroup_three_ne).
- **The structure of tame inertia** — the tame character gives I_K/P_K ≅ Ẑ^{(p')}(1), independently of the uniformizer and equivariantly for G_K ([`quotientWildInertiaSubgroupEquiv`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/LocalField/Tame/Character.html#TauCeti.quotientWildInertiaSubgroupEquiv)), and as a topological group it is [∏_{ℓ ≠ p} ℤ_ℓ](https://taucetiproject.org/docs/TauCeti/NumberTheory/LocalField/Tame/PadicCharacter.html#TauCeti.nonempty_continuousMulEquiv_piPadicInt). An inertia element [generates it](https://taucetiproject.org/docs/TauCeti/NumberTheory/LocalField/Tame/Quotient.html#TauCeti.topologicalClosure_zpowers_toTameQuotient_eq_iff) exactly when its tame character generates the Tate module.
- **The Galois group of the maximal unramified extension is Ẑ** — with arithmetic Frobenius as the canonical generator ([`maximalUnramifiedGaloisGroupEquivZHat`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/LocalField/Unramified/ZHat.html#TauCeti.maximalUnramifiedGaloisGroupEquivZHat)).

### Notable definitions and infrastructure

- **Valuations on algebraic extensions.** The spectral norm makes any algebraic extension M/K, finite or infinite, a [normed field](https://taucetiproject.org/docs/TauCeti/NumberTheory/LocalField/AlgebraicExtension/Basic.html#TauCeti.algebraicExtensionNormedField) whose valuation is unique up to equivalence and preserved by every K-automorphism, so K^alg, K^ur and K^t can be handled as valued fields rather than only through their finite layers.
- **Wild inertia and the tame tower.** [`wildInertiaSubgroup`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/LocalField/WildInertia.html#TauCeti.wildInertiaSubgroup) is the pro-p Sylow subgroup of inertia, membership in it is tested [at finite Galois level](https://taucetiproject.org/docs/TauCeti/NumberTheory/LocalField/WildInertia.html#TauCeti.mem_wildInertiaSubgroup_iff_forall_restrictNormal_mem_finiteGaloisLowerRamificationGroup) through G₁, and it [cuts out K^t](https://taucetiproject.org/docs/TauCeti/NumberTheory/LocalField/WildInertia.html#TauCeti.maximalTameExtension_eq_fixedField_inf_separableClosure). Restriction then gives [G_K/P_K ≅ Gal(K^t/K)](https://taucetiproject.org/docs/TauCeti/NumberTheory/LocalField/Tame/Quotient.html#TauCeti.tameQuotientEquivMaximalTameExtension), carrying tame inertia onto Gal(K^t/K^ur), so statements about the tame quotient can be read as statements about a field.
- **The ℓ-adic decomposition of the Tate module** [`continuousMulEquivPiPadicTateTwist`](https://taucetiproject.org/docs/TauCeti/RingTheory/RootsOfUnity/PadicTateTwist.html#TauCeti.PrimeToPTateModule.continuousMulEquivPiPadicTateTwist) splits Ẑ^{(p')}(1) into the twists ℤ_ℓ(1), so ℓ-adic statements about tame inertia can be read off one prime at a time.

### Roadmap coverage

**All five layers are done**, and the README now records a final audit of the full specification. Nothing since has reopened a layer: the latest additions sharpen Layer 4's description of the tame tower and add a ℚ₂ example of the Iwasawa presentation, while the Layer 0 and Layer 3 arithmetic consumed by the counting of totally ramified extensions (Eisenstein generators, the different exponent, valuation orthogonality, Serre's inertia criterion) got supporting lemmas and reworked statements, not new milestones. The worked examples ℚ₂(√2), ℚ₂(ζ₈) and ℚ₃(√3) exercise lower and upper numbering, the different, and norm sharpness.

## The frontier

- **No milestone remains open.** Every layer's milestones are proved.
- **Counting totally ramified extensions**: the README's consumer contract asks that roadmap to install this roadmap's canonical local-field structures and replace its temporary arithmetic declarations with the exports listed there; that work belongs to the consumer, not here.
- **Other downstream consumers**: class field theory can build on the maximal abelian extension and its Galois group, and Local Galois Groups on the tame quotient, its presentation and its identification with Gal(K^t/K).
