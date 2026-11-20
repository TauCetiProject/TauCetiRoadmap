<!--tauceti-status:v1 {"roadmap":"NoncongruenceModularForms","to_sha":"aa6e43e14b2556add36c8149e543f059a45926d3","ts":"2026-11-13T23:20:12Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","remaining":"0.3 corollaries (free product, torsion classes, free torsion-free subgroups, abelianization Z/6) and 0.4 lifts and projective index","state":"partial"},{"id":"Layer 1","remaining":"modularTriple, Millington's theorem, finiteness at fixed index","state":"untouched"},{"id":"Layer 2","remaining":"cusp widths, elliptic counts and genus read from the modular triple, with their geometric identifications","state":"untouched"},{"id":"Layer 3","remaining":"general level, comparison with the geometric level, wohlfahrt_strict, congruence closure, order and composition-factor obstructions","state":"partial"},{"id":"Layer 4","state":"untouched"},{"id":"Layer 5","state":"untouched"},{"id":"Layer 6","state":"untouched"},{"id":"Layer 7","state":"untouched"},{"id":"Layer 8","state":"untouched"},{"id":"Layer 9","state":"untouched"}],"readme_sha":"4ecbe61dc6da189f9aaf93e8a5d2e442868c94cdf8070a0e0e186436eab21b7f","roadmap":"NoncongruenceModularForms","to_sha":"aa6e43e14b2556add36c8149e543f059a45926d3"}-->
# Status: NoncongruenceModularForms

This file documents the status of the NoncongruenceModularForms roadmap up until `aa6e43e` (2026-11-13T23:20:12Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The triangle-group presentation of `PSL₂(ℤ)` that opens the roadmap is proved, and the strict level of Layer 3 is in place with its main laws. Everything that depends on the coset dictionary has not begun: the modular triple, the permutation invariants, Hsu's test, Farey symbols, the Belyi cover, and the modular-forms layers.

### Named results

- **The modular group is the triangle group Δ(3, 2, ∞)** — [`modularEquiv`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/Complex/Fuchsian/LevelOne/TriangleGroup.html#TauCeti.ModularGroup.modularEquiv) identifies `PSL₂(ℤ)` with `⟨x, y, z | x³, y², zyx⟩` by `x ↦ U = ST⁻¹`, `y ↦ S`, `z ↦ T`, the normalization the roadmap's coset dictionary requires. Injectivity comes from the geometric presentation given by Poincaré's polygon theorem, transported by the mirror automorphism, not from ping-pong.
- **The strict level is the lcm of the strict cusp widths** — for a finite-index `Γ ≤ SL₂(ℤ)`, with or without `−1`, [`strictLevel_eq_lcm_cuspTranslationOrbitWidth`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ModularForms/CongruenceSubgroups/StrictLevel.html#Subgroup.strictLevel_eq_lcm_cuspTranslationOrbitWidth) identifies the least `N` with all conjugates of `Tᴺ` in `Γ` with the lcm of its strict widths.
- **The intersection law for strict levels** — [`strictLevel_inf`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ModularForms/CongruenceSubgroups/StrictLevel.html#Subgroup.strictLevel_inf) gives `N_s(Γ₁ ⊓ Γ₂) = lcm(N_s(Γ₁), N_s(Γ₂))`. The same law holds cusp by cusp ([`cuspTranslationOrbitWidth_mk_inf`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ModularForms/Norm/Cusps.html#TauCeti.ModularForm.cuspTranslationOrbitWidth_mk_inf)), and the strict level is [unchanged by the normal core](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ModularForms/CongruenceSubgroups/StrictLevel.html#Subgroup.strictLevel_normalCore).

### Notable definitions and infrastructure

- **The pinned generators** [R = ST](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/Modular/Generators.html#TauCeti.ModularGroup.R) and [U = ST⁻¹](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/Modular/Generators.html#TauCeti.ModularGroup.U) record every sign relation in `SL₂(ℤ)` (`R³ = −I`, `U³ = I`, `TSU = −I`) and the projective orders 3, 2, ∞. Every later translation between source conventions relies on them.
- **The mirror automorphism** [`TriangleGroup.mirror`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/GroupTheory/TriangleGroup/Basic.html#TauCeti.TriangleGroup.mirror) of any `Δ(a, b, c)` relates the modular triple to the monodromy triple of the Belyi map that Layer 6 needs.
- **The strict level** [`Subgroup.strictLevel`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ModularForms/CongruenceSubgroups/StrictLevel.html#Subgroup.strictLevel) is the modulus in the strict Wohlfahrt theorem. It is computed for `Γ(N)`, `Γ₀(N)` and `Γ₁(N)`, and it [divides `N` for any subgroup containing `Γ(N)`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ModularForms/CongruenceSubgroups/StrictLevel.html#CongruenceSubgroup.strictLevel_dvd_of_Gamma_le).

### Roadmap coverage

Layer 0 is partial. The generators of 0.1, the homomorphism of 0.2 and the isomorphism of 0.3 are proved. Still missing are the corollaries of 0.3 (the free-product form, conjugacy of torsion elements, freeness of torsion-free subgroups with rank `1 + n/6`, the abelianization `ℤ/6`) and all of 0.4 (the lift `±Γ̄` and the projective index). Layer 3 is partial: the strict-level half of 3.1 is done, while the general level `orderOf σinf` and the comparison `N_s ∈ {N, 2N}`, the comparison with the geometric level, Wohlfahrt in both forms, the congruence closure and the order and composition-factor obstructions are not. Layers 1, 2 and 4–9 are untouched. Tau Ceti already has an analytic cusp-width formula for `Γ₀(N)`, but nothing yet reads invariants from a permutation triple.

## The frontier

- **The modular triple (1.1)** — define `modularTriple` as `cosetTriple` transported along `modularEquiv`, and prove the order relations, the LMFDB permutations and independence of the numbering. Every layer from 1 to 6 waits on this.
- **Lifts and the projective index (0.4)** — `lift Γ̄ = ±Γ̄`, the index relation, and `psl2Index` with its factor 2 when `−1 ∉ Γ`. These are short, they need only Mathlib, and Layers 3–4 need them.
- **The strict Wohlfahrt theorem (3.3)** — `IsCongruenceSubgroup Γ ↔ Gamma (strictLevel Γ) ≤ Γ`, by the Kiming–Schütt–Verrill matrix reduction. The strict level and its divisibility by any congruence modulus are now available; the signed version waits on ModularFormsPartII W1.8.
- **The free-product corollaries of 0.3** — torsion classes and the abelianization should follow from the isomorphism now in hand. Freeness of torsion-free subgroups needs Kurosh from FreeGroupsAndLimitGroups §4.11.
- **The general level (3.1)** — `orderOf σinf` as the lcm of the permutation cusp widths, and `N_s ∣ 2N`. This needs 1.1 and 2.1.
