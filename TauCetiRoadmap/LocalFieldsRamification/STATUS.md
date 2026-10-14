<!--tauceti-status:v1 {"roadmap":"LocalFieldsRamification","to_sha":"c7ae9d762d2bc9436e7c2ed5006e64ac24822b2d","ts":"2026-10-13T09:39:50+11:00"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","state":"done"},{"id":"Layer 1","state":"done"},{"id":"Layer 2","state":"done"},{"id":"Layer 3","state":"done"},{"id":"Layer 4","state":"done"}],"readme_sha":"11ef4db9479369bd6cfb3362939cb8971909bd2af78d097d68aa21c0bd3f4197","roadmap":"LocalFieldsRamification","to_sha":"c7ae9d762d2bc9436e7c2ed5006e64ac24822b2d"}-->
# Status: LocalFieldsRamification

This file documents the status of the LocalFieldsRamification roadmap up until `c7ae9d7` (2026-10-13T09:39:50+11:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Every layer is now done. The summit, Iwasawa's presentation of the tame quotient, was already proved. The general Hasse–Arf theorem, the ℚ₂(ζ₈) witnesses, the integral power basis of a totally ramified extension and the functoriality of inertia along a finite extension, which were the last open milestones, are now in the library.

### Named results

- **Iwasawa's theorem** — the tame quotient G_K/P_K is isomorphic as a topological group to the profinite group ⟨σ, τ | στσ⁻¹ = τ^q⟩, via an isomorphism determined by an arithmetic Frobenius lift and a tame inertia generator ([`nonempty_continuousMulEquiv_iwasawaGroup`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/LocalField/Tame/Presentation.html#TauCeti.nonempty_continuousMulEquiv_iwasawaGroup)).
- **The Hasse–Arf theorem** — every upper ramification break of a finite abelian extension of local fields is an integer (`hasseArf`, TauCeti#13558). Upper breaks are first [detected in a cyclic subextension](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/LocalField/Herbrand/CyclicReduction.html#TauCeti.LocalFieldsRamification.upperJump_iff_exists_isCyclic_intermediateField), and the cyclic case then reduces to prime-power degree.
- **Herbrand's theorem** — for a normal subgroup H, restriction carries G^v onto (G/H)^v in the upper numbering ([`map_restrictNormalHom_upperRamificationGroup`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/LocalField/Herbrand/UpperQuotient.html#TauCeti.LocalFieldsRamification.map_restrictNormalHom_upperRamificationGroup)). The lower numbering does not commute with quotients, and ℚ₂(ζ₈) gives a proved [witness, G₃H/H ≠ (G/H)₃](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/LocalField/WorkedExamples/CyclotomicEight/Quotient.html#TauCeti.DyadicCyclotomicEight.map_restrictSqrtTwo_lowerRamificationGroup_three_ne).
- **Tame inertia is the prime-to-p Tate module** — the tame character gives I_K/P_K ≅ Ẑ^{(p')}(1), independently of the uniformizer and equivariantly for G_K ([`quotientWildInertiaSubgroupEquiv`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/LocalField/Tame/Character.html#TauCeti.quotientWildInertiaSubgroupEquiv)).
- **The Galois group of the maximal unramified extension is Ẑ** — with arithmetic Frobenius as the canonical generator ([`maximalUnramifiedGaloisGroupEquivZHat`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/LocalField/Unramified/ZHat.html#TauCeti.maximalUnramifiedGaloisGroupEquivZHat)).

### Notable definitions and infrastructure

- **Wild inertia** [`wildInertiaSubgroup`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/LocalField/WildInertia.html#TauCeti.wildInertiaSubgroup) is the pro-p Sylow subgroup of inertia, and it cuts out the maximal tamely ramified extension. This is what makes the tame quotient a profinite group with a presentation.
- **The graded norm** [`normGradedMap`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/LocalField/Norm/Graded.html#TauCeti.normGradedMap) acts on the Herbrand-shifted pieces of the unit filtration. It is computed in all four regimes for cyclic extensions of prime degree, and Hasse–Arf compares conductors with norms through it.
- **The integral power basis** [`integralPowerBasis`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/LocalField/Monogenic.html#TauCeti.IsTotallyRamified.integralPowerBasis) writes 𝒪[L] as 𝒪[K][ϖ] for any uniformizer ϖ of a totally ramified L/K, and valuations can be read off from its coordinates. This is the Eisenstein power basis consumed by the counting of totally ramified extensions.

### Roadmap coverage

**All five layers are done.** Layers 1 and 2 were already complete. Layer 0 closed with the named integral basis in the totally ramified case. Layer 3 closed with the general Hasse–Arf theorem and the two ℚ₂(ζ₈) witnesses: lower numbering fails under quotients, and φ(2) = 3/2. Layer 4 closed with functoriality of inertia along a finite extension L/K: I_L is the preimage of I_K and has index e(L/K) in it. The general Hasse–Arf theorem and the inertia functoriality are checked against the library source and do not yet have documentation links here.

## The frontier

- **No milestone remains open.** The four items the previous report listed as open have all been proved. This roadmap is ready to be marked complete.
- **Downstream consumers**: the counting of totally ramified extensions, which the README names as a consumer contract, can now build on the Eisenstein generator, integral monogenicity, the different and discriminant exponents, and the integral power basis.
