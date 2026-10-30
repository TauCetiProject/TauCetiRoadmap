<!--tauceti-status:v1 {"roadmap":"LocalFieldsRamification","to_sha":"5d671b97e3d9afab126136a621a8044b6f545468","ts":"2026-10-24T12:00:07Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","state":"done"},{"id":"Layer 1","state":"done"},{"id":"Layer 2","state":"done"},{"id":"Layer 3","state":"done"},{"id":"Layer 4","state":"done"}],"readme_sha":"ba0b46beb1899d5dce1c0f105ee85e2f7829db055da9c381f1c356a0750e6a66","roadmap":"LocalFieldsRamification","to_sha":"5d671b97e3d9afab126136a621a8044b6f545468"}-->
# Status: LocalFieldsRamification

This file documents the status of the LocalFieldsRamification roadmap up until `5d671b9` (2026-10-24T12:00:07Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** All five layers are done. The summit, Iwasawa's presentation of the tame quotient, is proved, as are Herbrand's theorem in both numberings and the general Hasse–Arf theorem. Tame inertia is identified both with the prime-to-p Tate module and, as a bare profinite group, with ∏_{ℓ ≠ p} ℤ_ℓ.

### Named results

- **Iwasawa's theorem** — the tame quotient G_K/P_K is isomorphic as a topological group to the profinite group ⟨σ, τ | στσ⁻¹ = τ^q⟩, via an isomorphism fixed by an arithmetic Frobenius lift and a tame inertia generator ([`nonempty_continuousMulEquiv_iwasawaGroup`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/LocalField/Tame/Presentation.html#TauCeti.nonempty_continuousMulEquiv_iwasawaGroup)).
- **The Hasse–Arf theorem** — every upper ramification break of a finite abelian extension of local fields is an integer (`hasseArf`, TauCeti#13558). The proof [detects upper breaks in a cyclic subextension](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/LocalField/Herbrand/CyclicReduction.html#TauCeti.LocalFieldsRamification.upperJump_iff_exists_isCyclic_intermediateField) and reduces the cyclic case to prime-power degree.
- **Herbrand's theorem** — for a normal subgroup H, restriction carries G^v onto (G/H)^v in the upper numbering ([`map_restrictNormalHom_upperRamificationGroup`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/LocalField/Herbrand/UpperQuotient.html#TauCeti.LocalFieldsRamification.map_restrictNormalHom_upperRamificationGroup)). The lower numbering fails this, and ℚ₂(ζ₈) gives a proved [witness](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/LocalField/WorkedExamples/CyclotomicEight/Quotient.html#TauCeti.DyadicCyclotomicEight.map_restrictSqrtTwo_lowerRamificationGroup_three_ne).
- **The structure of tame inertia** — the tame character gives I_K/P_K ≅ Ẑ^{(p')}(1), independently of the uniformizer and equivariantly for G_K ([`quotientWildInertiaSubgroupEquiv`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/LocalField/Tame/Character.html#TauCeti.quotientWildInertiaSubgroupEquiv)), and as a topological group it is [∏_{ℓ ≠ p} ℤ_ℓ](https://taucetiproject.org/docs/TauCeti/NumberTheory/LocalField/Tame/PadicCharacter.html#TauCeti.nonempty_continuousMulEquiv_piPadicInt). It is [procyclic](https://taucetiproject.org/docs/TauCeti/NumberTheory/LocalField/Tame/Quotient.html#TauCeti.exists_topologicalClosure_zpowers_eq_tameInertia) inside the tame quotient.
- **The Galois group of the maximal unramified extension is Ẑ** — with arithmetic Frobenius as the canonical generator ([`maximalUnramifiedGaloisGroupEquivZHat`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/LocalField/Unramified/ZHat.html#TauCeti.maximalUnramifiedGaloisGroupEquivZHat)).

### Notable definitions and infrastructure

- **Valuations on algebraic extensions.** The spectral norm makes any algebraic extension M/K, finite or infinite, a [normed field](https://taucetiproject.org/docs/TauCeti/NumberTheory/LocalField/AlgebraicExtension/Basic.html#TauCeti.algebraicExtensionNormedField) whose valuation is unique up to equivalence and preserved by every K-automorphism, so K^alg, K^ur and K^t can be handled as valued fields rather than only through their finite layers.
- **Wild inertia** [`wildInertiaSubgroup`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/LocalField/WildInertia.html#TauCeti.wildInertiaSubgroup) is the pro-p Sylow subgroup of inertia and cuts out the maximal tamely ramified extension. This is what makes the tame quotient a profinite group with a presentation.
- **The ℓ-adic decomposition of the Tate module** [`continuousMulEquivPiPadicTateTwist`](https://taucetiproject.org/docs/TauCeti/RingTheory/RootsOfUnity/PadicTateTwist.html#TauCeti.PrimeToPTateModule.continuousMulEquivPiPadicTateTwist) splits Ẑ^{(p')}(1) into the twists ℤ_ℓ(1), matching each factor with the ℓ-adic tame character, so ℓ-adic statements about tame inertia can be read off one prime at a time.

### Roadmap coverage

**All five layers are done.** This window added two items the revised README now names: normality of the finite-level lower ramification groups G_i(L/K) in Layer 4's ambient model, and the identification of tame inertia with ∏_{ℓ ≠ p} ℤ_ℓ. Neither reopens a layer. Layer 0 also covers infinite algebraic extensions, and the worked examples ℚ₂(√2), ℚ₂(ζ₈) and ℚ₃(√3) exercise lower and upper numbering, the different, and norm sharpness. Some of the README's inline "remains" notes lag the library.

## The frontier

- **No milestone remains open.** Every layer's milestones are proved, so this roadmap can be marked complete.
- **README bookkeeping**: several per-milestone notes still list items as remaining that the library now proves, and should be updated to match.
- **Downstream consumers**: the counting of totally ramified extensions can build on the Eisenstein generator, the integral power basis, and the different and discriminant exponents; class field theory can build on the maximal abelian extension and its Galois group; Local Galois Groups can build on the tame quotient and its presentation.
