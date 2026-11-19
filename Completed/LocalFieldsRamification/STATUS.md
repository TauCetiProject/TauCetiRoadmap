<!--tauceti-status:v1 {"roadmap":"LocalFieldsRamification","to_sha":"aa6e43e14b2556add36c8149e543f059a45926d3","ts":"2026-11-13T23:20:12Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","state":"done"},{"id":"Layer 1","state":"done"},{"id":"Layer 2","state":"done"},{"id":"Layer 3","state":"done"},{"id":"Layer 4","state":"done"}],"readme_sha":"cc0d29a2d7ffc87832a0172faf2e2506866bd70623e2932e2e985fd367ffbae1","roadmap":"LocalFieldsRamification","to_sha":"aa6e43e14b2556add36c8149e543f059a45926d3"}-->
# Status: LocalFieldsRamification

This file documents the status of the LocalFieldsRamification roadmap up until `aa6e43e` (2026-11-13T23:20:12Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** All five layers are done, and the roadmap is complete. Its summit, Iwasawa's presentation of the tame quotient, is proved, along with Herbrand's theorem in the upper numbering and the general Hasse–Arf theorem. Recent work restates existing results in cleaner form and opens no new milestone.

### Named results

- **Iwasawa's theorem** — the tame quotient G_K/P_K is isomorphic as a topological group to the profinite group ⟨σ, τ | στσ⁻¹ = τ^q⟩, via an isomorphism fixed by an arithmetic Frobenius lift and a tame inertia generator ([`nonempty_continuousMulEquiv_iwasawaGroup`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/LocalField/Tame/Presentation.html#TauCeti.nonempty_continuousMulEquiv_iwasawaGroup)). For ℚ₂ it is [worked out explicitly](https://taucetiproject.org/docs/TauCeti/NumberTheory/LocalField/WorkedExamples/Padic/Two/Tame.html#TauCeti.exists_marked_tameQuotient_padic_two), with στσ⁻¹ = τ².
- **The Hasse–Arf theorem** — every upper ramification break of a finite abelian extension of local fields is an integer (`hasseArf`). The proof [detects upper breaks in a cyclic subextension](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/LocalField/Herbrand/CyclicReduction.html#TauCeti.LocalFieldsRamification.upperJump_iff_exists_isCyclic_intermediateField) and then handles cyclic extensions of prime-power degree.
- **Herbrand's theorem** — for a normal subgroup H, restriction carries G^v onto (G/H)^v in the upper numbering ([`map_restrictNormalHom_upperRamificationGroup`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/LocalField/Herbrand/UpperQuotient.html#TauCeti.LocalFieldsRamification.map_restrictNormalHom_upperRamificationGroup)). The lower numbering fails this, and ℚ₂(ζ₈) supplies a proved [counterexample](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/LocalField/WorkedExamples/CyclotomicEight/Quotient.html#TauCeti.DyadicCyclotomicEight.map_restrictSqrtTwo_lowerRamificationGroup_three_ne).
- **The structure of tame inertia** — the tame character gives I_K/P_K ≅ Ẑ^{(p')}(1), independently of the uniformizer and equivariantly for G_K ([`quotientWildInertiaSubgroupEquiv`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/LocalField/Tame/Character.html#TauCeti.quotientWildInertiaSubgroupEquiv)). As a bare topological group it is [∏_{ℓ ≠ p} ℤ_ℓ](https://taucetiproject.org/docs/TauCeti/NumberTheory/LocalField/Tame/PadicCharacter.html#TauCeti.nonempty_continuousMulEquiv_piPadicInt).
- **The Galois group of the maximal unramified extension is Ẑ** — with arithmetic Frobenius as the canonical generator ([`maximalUnramifiedGaloisGroupEquivZHat`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/LocalField/Unramified/ZHat.html#TauCeti.maximalUnramifiedGaloisGroupEquivZHat)).

### Notable definitions and infrastructure

- **Valuations on algebraic extensions.** The spectral norm makes any algebraic extension M/K, finite or infinite, a [normed field](https://taucetiproject.org/docs/TauCeti/NumberTheory/LocalField/AlgebraicExtension/Basic.html#TauCeti.algebraicExtensionNormedField) whose valuation is unique up to equivalence and preserved by every K-automorphism. This lets K^alg, K^ur and K^t be handled as valued fields directly, not only through their finite layers.
- **Wild inertia and the tame tower.** [`wildInertiaSubgroup`](https://taucetiproject.org/docs/TauCeti/NumberTheory/LocalField/WildInertia.html#TauCeti.wildInertiaSubgroup) is now defined as the subgroup of G_K fixing K^t. It is [closed](https://taucetiproject.org/docs/TauCeti/NumberTheory/LocalField/WildInertia.html#TauCeti.isClosed_wildInertiaSubgroup) and is cut out by a [radical criterion](https://taucetiproject.org/docs/TauCeti/NumberTheory/LocalField/WildInertia.html#TauCeti.mem_wildInertiaSubgroup_iff_pow_eq) (fix every m-th root of K for m prime to p), and membership is [tested at finite Galois level](https://taucetiproject.org/docs/TauCeti/NumberTheory/LocalField/WildInertia.html#TauCeti.mem_wildInertiaSubgroup_iff_forall_restrictNormal_mem_finiteGaloisLowerRamificationGroup) through G₁. Restriction then gives [G_K/P_K ≅ Gal(K^t/K)](https://taucetiproject.org/docs/TauCeti/NumberTheory/LocalField/Tame/Quotient.html#TauCeti.tameQuotientEquivMaximalTameExtension), so statements about the tame quotient can be read as statements about a field.
- **The Galois-equivariant logarithm.** Every K-automorphism of a finite extension [commutes with the logarithm](https://taucetiproject.org/docs/TauCeti/NumberTheory/LocalField/Logarithm.html#AlgEquiv.map_log), so Layer 1's deep-unit coordinates respect the Galois action on U(L,i).

### Roadmap coverage

**All five layers are done**, and the README records a final audit of the full specification. Layer 0 (local fields, their extensions, e and f), Layer 1 (the unit filtration, Teichmüller lifts, the deep logarithm and power classes), Layer 2 (unramified extensions, Frobenius and K^ur), Layer 3 (Eisenstein and tame extensions, both ramification numberings, Herbrand, Hasse–Arf, the different and the graded norms) and Layer 4 (wild inertia, the tame character and Iwasawa's presentation) each have every milestone proved. The worked examples ℚ₂(√2), ℚ₂(i), ℚ₂(ζ₈) and ℚ₃(√3) test lower and upper numbering, the different and the sharpness of the norm bounds. Nothing since the audit has reopened a layer.

## The frontier

- **No milestone remains open.** Every layer's milestones are proved.
- **Counting totally ramified extensions**: the README's consumer contract asks that roadmap to adopt this roadmap's canonical local-field structures and to replace its temporary arithmetic declarations with the exports listed there. That work belongs to the consumer.
- **Other downstream consumers**: class field theory can build on the maximal abelian extension and its Galois group. Local Galois Groups can build on the tame quotient, its presentation and its identification with Gal(K^t/K).
