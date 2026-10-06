<!--tauceti-status:v1 {"roadmap":"LocalFieldsRamification","to_sha":"65aa70aca528de65d24b3fc2ef2379c24498b560","ts":"2026-10-06T02:50:42Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","remaining":"a named integral basis of the integer ring in the totally ramified case","state":"partial"},{"id":"Layer 1","state":"done"},{"id":"Layer 2","state":"done"},{"id":"Layer 3","remaining":"Hasse-Arf for general abelian extensions by the prime-degree induction; the Q_2(mu_8) witnesses","state":"partial"},{"id":"Layer 4","remaining":"functoriality of inertia in a finite extension of K","state":"partial"}],"readme_sha":"11ef4db9479369bd6cfb3362939cb8971909bd2af78d097d68aa21c0bd3f4197","roadmap":"LocalFieldsRamification","to_sha":"65aa70aca528de65d24b3fc2ef2379c24498b560"}-->
# Status: LocalFieldsRamification

This file documents the status of the LocalFieldsRamification roadmap up until `65aa70a` (2026-10-06T02:50:42Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The summit is reached. The Iwasawa presentation of the tame quotient is proved, built on Herbrand's theorem in both numberings, Gal(K^ur/K) ≅ Ẑ and the tame character. Layers 1 and 2 are complete. Layer 0 lacks only a named integral basis in the totally ramified case. Layer 3 has Hasse–Arf only in prime degree, and Layer 4 lacks functoriality of inertia under a finite extension of K.

### Named results

- **Iwasawa's theorem** — the tame quotient G_K/P_K is isomorphic as a topological group to the profinite group ⟨σ, τ | στσ⁻¹ = τ^q⟩, through an isomorphism fixed by an arithmetic Frobenius lift and a tame inertia generator ([`nonempty_continuousMulEquiv_iwasawaGroup`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/LocalField/Tame/Presentation.html#TauCeti.nonempty_continuousMulEquiv_iwasawaGroup), [`tameQuotientEquiv`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/LocalField/Tame/Presentation.html#TauCeti.tameQuotientEquiv)).
- **Tame inertia is the prime-to-p Tate module** — the tame character σ ↦ (σ(π^{1/m})/π^{1/m})_m gives I_K/P_K ≅ Ẑ^{(p')}(1), independently of π and equivariantly for G_K ([`quotientWildInertiaSubgroupEquiv`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/LocalField/Tame/Character.html#TauCeti.quotientWildInertiaSubgroupEquiv)). Its ℓ-adic component for a single prime ℓ ≠ p is a surjection onto ℤ_ℓ(1) on which Frobenius acts by the q-th power ([`inertiaPadicTameCharacter`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/LocalField/Tame/PadicCharacter.html#TauCeti.inertiaPadicTameCharacter)).
- **Herbrand's theorem** — for a normal subgroup H, restriction carries G^v onto (G/H)^v in the upper numbering ([`map_restrictNormalHom_upperRamificationGroup`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/LocalField/Herbrand/UpperQuotient.html#TauCeti.LocalFieldsRamification.map_restrictNormalHom_upperRamificationGroup)), and G_u onto (G/H)_{φ(u)} in the lower. On the subgroup side, H ∩ G^v = H^{ψ(v)} ([`comap_restrictScalarsHom_upperRamificationGroup`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/LocalField/Herbrand/UpperQuotient.html#TauCeti.LocalFieldsRamification.comap_restrictScalarsHom_upperRamificationGroup)).
- **Hasse–Arf in prime degree** — the upper break of a Galois extension of prime degree is an integer ([`exists_eq_intCast_of_finrank_prime`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/LocalField/Herbrand/HasseArf.html#TauCeti.LocalFieldsRamification.UpperJump.exists_eq_intCast_of_finrank_prime)). It is read off from the norm on the unit filtration.
- **The Galois group of the maximal unramified extension is Ẑ** — with arithmetic Frobenius as the canonical generator ([`maximalUnramifiedGaloisGroupEquivZHat`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/LocalField/Unramified/ZHat.html#TauCeti.maximalUnramifiedGaloisGroupEquivZHat)).

### Notable definitions and infrastructure

- **Wild inertia** [`wildInertiaSubgroup`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/LocalField/WildInertia.html#TauCeti.wildInertiaSubgroup) is the pro-p Sylow subgroup of inertia. It maps onto every finite G_1 and cuts out K^t, whose finite Galois subextensions are exactly the tame ones. This is what makes the tame quotient a profinite group with a presentation.
- **The graded norm** [`normGradedMap`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/LocalField/Norm/Graded.html#TauCeti.normGradedMap) acts on the Herbrand-shifted pieces U(L, ψℕ v)/U(L, ψℕ v + 1) and is computed in all four regimes for cyclic extensions of prime degree. It drives the conductor and index computations, and is the comparison step of the Hasse–Arf induction.
- **The worked example ℚ₂(√2)** [`DyadicSqrtTwo`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/LocalField/WorkedExamples/DyadicSqrt/Two.html#TauCeti.DyadicSqrtTwo) is a regression test for the conventions. It has e = 2 and f = 1, different exponent 3, and a lower filtration that is everything through index 2 and trivial from index 3.

### Roadmap coverage

- **Layers 1 and 2 are done.** Layer 1 covers the filtration, Teichmüller, the structure of Kˣ, the square theorem, power classes, deep units and the finiteness of μ(K). Layer 2 gained its last item, the negative instance ℚ₂(√2)/ℚ₂ ([`not_isUnramified`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/LocalField/WorkedExamples/DyadicSqrt/Two.html#TauCeti.DyadicSqrtTwo.not_isUnramified)).
- **Layer 0 is done except for one export.** The ℚ₂(√2) values are proved. In the totally ramified case, the Eisenstein theorem gives 𝒪[L] = 𝒪[K][π], but the integral basis is not yet exported under a name.
- **Layer 3 is partial.** Proved here are the Eisenstein and tame radical theorems, the action formula, Herbrand in both numberings with break transport along towers, the different (including the value 3 for ℚ₂(√2)), and the norm package. Hasse–Arf for general abelian extensions is open, as are the ℚ₂(μ₈) witnesses.
- **Layer 4 is partial.** Inertia, wild inertia, the tame character with its ℓ-adic specialization, and the Iwasawa presentation are in place. Functoriality of inertia in a finite extension of K is missing.

## The frontier

- **Hasse–Arf for abelian extensions**: induct along a prime-degree tower ([`exists_prime_finrank_intermediateField_series`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/FieldTheory/Galois/Abelian/Tower.html#TauCeti.exists_prime_finrank_intermediateField_series)). The base case, the quotient theorem and now the tower criterion for upper breaks are all proved. What remains is the inductive step that preserves integrality.
- **The dyadic cyclotomic witnesses**: in ℚ₂(μ₈)/ℚ₂, compute φ(2) = 3/2 and exhibit G_3H/H ≠ (G/H)_3, which would turn the lower-numbering warning into a theorem. The ℚ₂(√2) quotient half is already computed.
- **Functoriality of inertia**: how I_K behaves under a finite extension of K. This is the last Layer 4 item.
- **A named integral basis for totally ramified extensions**: export the Eisenstein power basis of 𝒪[L] over 𝒪[K] under its contract name. This closes Layer 0.
