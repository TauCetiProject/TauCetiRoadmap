<!--tauceti-status:v1 {"roadmap":"LocalFieldsRamification","to_sha":"1d095894ac25298eb2a23398826c0f867b6d3164","ts":"2026-10-05T01:07:53Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","remaining":"the worked Q_2(sqrt 2) values; a named totally ramified integral basis","state":"partial"},{"id":"Layer 1","state":"done"},{"id":"Layer 2","remaining":"the negative instance Q_2(sqrt 2)/Q_2","state":"partial"},{"id":"Layer 3","remaining":"Hasse-Arf for general abelian extensions by the prime-degree induction; the Q_2(mu_8) witnesses","state":"partial"},{"id":"Layer 4","remaining":"specialization of the tame character at one prime l != p; functoriality of inertia in a finite extension of K","state":"partial"}],"readme_sha":"71341ee291c83402a632980bb8fce9bd196641c27e5589a77c36005b3bc49833","roadmap":"LocalFieldsRamification","to_sha":"1d095894ac25298eb2a23398826c0f867b6d3164"}-->
# Status: LocalFieldsRamification

This file documents the status of the LocalFieldsRamification roadmap up until `1d09589` (2026-10-05T01:07:53Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The summit is reached: the Iwasawa presentation of the tame quotient is proved, on top of Herbrand's theorem in both numberings, Gal(K^ur/K) ≅ Ẑ and the tame character. Layer 1 is complete. The other layers are partial: Layer 3 has Hasse–Arf only in prime degree, Layer 4 lacks two side statements, and Layers 0 and 2 lack only dyadic worked examples.

### Named results

- **Iwasawa's theorem** — the tame quotient G_K/P_K is isomorphic as a topological group to the profinite group ⟨σ, τ | στσ⁻¹ = τ^q⟩, through an isomorphism determined by an arithmetic Frobenius lift and a tame inertia generator ([`nonempty_continuousMulEquiv_iwasawaGroup`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/LocalField/Tame/Presentation.html#TauCeti.nonempty_continuousMulEquiv_iwasawaGroup), [`tameQuotientEquiv`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/LocalField/Tame/Presentation.html#TauCeti.tameQuotientEquiv)).
- **Tame inertia is the prime-to-p Tate module** — the tame character σ ↦ (σ(π^{1/m})/π^{1/m})_m gives I_K/P_K ≅ Ẑ^{(p')}(1), independently of π and equivariantly for G_K ([`quotientWildInertiaSubgroupEquiv`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/LocalField/Tame/Character.html#TauCeti.quotientWildInertiaSubgroupEquiv)).
- **Herbrand's theorem** — for a normal subgroup H, restriction carries G^v onto (G/H)^v in the upper numbering ([`map_restrictNormalHom_upperRamificationGroup`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/LocalField/Herbrand/UpperQuotient.html#TauCeti.LocalFieldsRamification.map_restrictNormalHom_upperRamificationGroup)), and G_u onto (G/H)_{φ(u)} in the lower.
- **Hasse–Arf in prime degree** — the upper break of a Galois extension of prime degree is an integer ([`exists_eq_intCast_of_finrank_prime`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/LocalField/Herbrand/HasseArf.html#TauCeti.LocalFieldsRamification.UpperJump.exists_eq_intCast_of_finrank_prime)), read off from the norm on the unit filtration.
- **The Galois group of the maximal unramified extension is Ẑ** — with arithmetic Frobenius as the canonical generator ([`maximalUnramifiedGaloisGroupEquivZHat`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/LocalField/Unramified/ZHat.html#TauCeti.maximalUnramifiedGaloisGroupEquivZHat)).

### Notable definitions and infrastructure

- **Wild inertia** [`wildInertiaSubgroup`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/LocalField/WildInertia.html#TauCeti.wildInertiaSubgroup) is the pro-p Sylow subgroup of inertia, maps onto every finite G_1, and cuts out K^t, whose finite Galois subextensions are exactly the tame ones. It is what makes the tame quotient a profinite group with a presentation.
- **The graded norm** [`normGradedMap`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/LocalField/Norm/Graded.html#TauCeti.normGradedMap) on the Herbrand-shifted pieces U(L, ψℕ v)/U(L, ψℕ v + 1), computed in all four regimes for cyclic extensions of prime degree. It drives the conductor and index computations, and will drive the Hasse–Arf induction.
- **The deep-unit logarithm** `deepUnitExpLogEquiv`: U(K,i) ≅ 𝓂[K]^i when (p − 1)i > e. Through a basis it gives U(K,i) ≅ ℤ_p^{[K:ℚ_p]} ([`nonempty_deepUnitEquivPiPadicInt`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/LocalField/DeepUnits/Coordinates.html#TauCeti.nonempty_deepUnitEquivPiPadicInt)).

### Roadmap coverage

- **Layer 1 is done.** It covers the filtration, Teichmüller, the structure of Kˣ, the square theorem, power classes and deep units. The roots of unity μ(K) are finite, with order (q − 1)·#μ_{p^∞}(K) ([`natCard_torsion_units`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/LocalField/RootsOfUnity/Torsion.html#TauCeti.natCard_torsion_units)).
- **Layers 0 and 2 are done apart from worked examples.** Layer 0 lacks the ℚ_2(√2) values and a named integral basis in the totally ramified case. Layer 2 now has the reduction equivalence, rigidity after fixing residue data, and the divisibility lattice. It lacks only the negative instance ℚ_2(√2).
- **Layer 3 is partial.** Eisenstein and tame radical theorems, the tame Galois criterion, the action formula, Herbrand in both numberings, the different, and the norm package with its shifted inclusion and graded maps are all proved. Open are Hasse–Arf for general abelian extensions and the ℚ_2(μ_8) witnesses, including non-compatibility of the lower numbering with quotients.
- **Layer 4 is partial.** Inertia, wild inertia, the tame character, the Iwasawa presentation, its geometric translation and the finite-level Frobenius twist are in place. Open are the specialization of the tame character at a single prime ℓ ≠ p and functoriality of inertia in a finite extension of K.

## The frontier

- **Hasse–Arf for abelian extensions**: induct along a prime-degree tower of the abelian extension ([`exists_prime_finrank_intermediateField_series`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/FieldTheory/Galois/Abelian/Tower.html#TauCeti.exists_prime_finrank_intermediateField_series)), transporting breaks with upper-numbering Herbrand. The prime-degree base case, the tower and the quotient theorem are all in place.
- **The dyadic cyclotomic witnesses**: in ℚ_2(μ_8)/ℚ_2, compute φ(2) = 3/2 and exhibit G_3H/H ≠ (G/H)_3. This would close the lower-numbering warning as a theorem.
- **Layer 4 side statements**: the ℓ-adic specialization of Ẑ^{(p')}(1) for one prime ℓ ≠ p, and functoriality of I_K under a finite extension of K.
- **The ℚ_2(√2) example**: its e, f and normalized values, and its failure to be unramified. This one example would close Layers 0 and 2.
- **A named integral basis for totally ramified extensions**: the Eisenstein theorem already shows 𝒪[L] = 𝒪[K][π]. What remains is to export the power basis under its contract name.
