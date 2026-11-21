<!--tauceti-status:v1 {"roadmap":"LocalFieldsRamification","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e","ts":"2026-11-19T18:22:01+11:00"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","remaining":"0.1 the U(Q_p, i) congruence form and residue map to ZMod p; 0.3 the dyadic square-class count as 2^(N+2)","state":"partial"},{"id":"Layer 1","remaining":"the lower-break list, Sen's congruence pow_succ_dvd_lowerIndex_sub, and the Herbrand formula for upper breaks","state":"untouched"},{"id":"Layer 2","state":"done"}],"readme_sha":"1cafd1cacbbafc312e62605b016385997bf651c8a8e4b2d3c7c49048d9c2f859","roadmap":"LocalFieldsRamification","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e"}-->
# Status: LocalFieldsRamification

This file documents the status of the LocalFieldsRamification roadmap up until `b235000` (2026-11-19T18:22:01+11:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The general theory of local fields is proved: Iwasawa's presentation of the tame quotient, Herbrand's theorem and the Hasse–Arf theorem. The rewritten README now asks only for what is left over. Of its three layers, Layer 2 (Hasse–Arf) is done, Layer 0's three complements are partly done, and Layer 1, the lower breaks of cyclic p-power extensions and Sen's congruence, has not begun.

### Named results

- **Iwasawa's theorem** — the tame quotient G_K/P_K is isomorphic as a topological group to the profinite group ⟨σ, τ | στσ⁻¹ = τ^q⟩, via an isomorphism fixed by an arithmetic Frobenius lift and a tame inertia generator ([`nonempty_continuousMulEquiv_iwasawaGroup`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/LocalField/Tame/Presentation.html#TauCeti.nonempty_continuousMulEquiv_iwasawaGroup)).
- **The Hasse–Arf theorem** — every upper ramification break of a finite abelian extension of local fields is an integer (`hasseArf`). The proof [detects each break in a cyclic subextension](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/LocalField/Herbrand/CyclicReduction.html#TauCeti.LocalFieldsRamification.upperJump_iff_exists_isCyclic_intermediateField) and then treats cyclic extensions of prime-power degree.
- **Herbrand's theorem** — for a normal subgroup H, restriction carries G^v onto (G/H)^v in the upper numbering ([`map_restrictNormalHom_upperRamificationGroup`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/LocalField/Herbrand/UpperQuotient.html#TauCeti.LocalFieldsRamification.map_restrictNormalHom_upperRamificationGroup)). The lower numbering does not have this property.
- **The structure of tame inertia** — the tame character gives I_K/P_K ≅ Ẑ^{(p')}(1), independently of the uniformizer and equivariantly for G_K ([`quotientWildInertiaSubgroupEquiv`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/LocalField/Tame/Character.html#TauCeti.quotientWildInertiaSubgroupEquiv)). At finite level, its kernel on G₀ is [exactly G₁](https://taucetiproject.org/docs/TauCeti/NumberTheory/LocalField/UnitFiltration/RamificationGroup.html#TauCeti.ker_tameCharacter).
- **The Galois group of the maximal unramified extension is Ẑ** — with arithmetic Frobenius as the canonical generator ([`maximalUnramifiedGaloisGroupEquivZHat`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/LocalField/Unramified/ZHat.html#TauCeti.maximalUnramifiedGaloisGroupEquivZHat)).

### Notable definitions and infrastructure

- **Valuations on algebraic extensions.** The spectral norm makes any algebraic extension of K, finite or not, a [normed field](https://taucetiproject.org/docs/TauCeti/NumberTheory/LocalField/AlgebraicExtension/Basic.html#TauCeti.algebraicExtensionNormedField) whose valuation is unique and Galois-stable. This is how K^alg, K^ur and K^t are treated as valued fields directly.
- **Wild inertia as a field-theoretic subgroup.** [`wildInertiaSubgroup`](https://taucetiproject.org/docs/TauCeti/NumberTheory/LocalField/WildInertia.html#TauCeti.wildInertiaSubgroup) is the subgroup of G_K fixing K^t. Restriction identifies [G_K/P_K with Gal(K^t/K)](https://taucetiproject.org/docs/TauCeti/NumberTheory/LocalField/Tame/Quotient.html#TauCeti.tameQuotientEquivMaximalTameExtension), so statements about the tame quotient become statements about a field.
- **Uniformizer coordinates on graded pieces.** The [identification of the residue field with 𝔪^m/𝔪^(m+1)](https://taucetiproject.org/docs/TauCeti/RingTheory/DiscreteValuationRing/Uniformizer.html#TauCeti.residueFieldEquivMaximalIdealGradedOfUniformizer) is explicit in a chosen uniformizer, with change-of-uniformizer formulas. These are the coordinates in which the lower index σ(π)/π − 1 of Layer 1 is computed.

### Roadmap coverage

**Layer 2 is done.** Its detection, reduction and Hasse–Arf steps are all theorems of the library, and the layer states no target of its own. **Layer 0 is partial.** The unshifted norm inclusion N(U(L,i)) ⊆ U(K,⌊φ(i)⌋) of 0.2 is proved (`map_normUnits_unitFiltration_le_floor_herbrand`). For 0.1 the unit filtration of ℚ_p is described only through the p-adic norm, not yet as the congruence u ≡ 1 mod p^i in ℤ_p together with the residue map to ZMod p. For 0.3 the dyadic square-class count exists as 4·q^{e(K/ℚ₂)} but not in the degree form 2^{N+2}. **Layer 1 is untouched.** Neither the lower-break list, Sen's congruence nor the Herbrand formula for upper breaks appears in the source, although the inputs the README names for them are there.

## The frontier

- **Dyadic square classes in degree form (0.3)** — rewrite 4·q^e as 2^{[K:ℚ₂]+2} using e·f = [K:ℚ₂] and q = 2^f. All the ingredients are in the library.
- **The unit filtration of ℚ_p (0.1)** — state membership in U(ℚ_p, i) as p^i ∣ u − 1 in ℤ_p, and match the residue field with ZMod p through `PadicInt.toZMod`. This is a translation of the existing norm characterization.
- **The lower-break list (1.1)** — for a totally ramified cyclic extension of degree pʳ, show that the breaks are the c_{p^j}, that they strictly increase, and that G_{b_j} = ⟨σ^{p^j}⟩. The tame-order bound and the embedding of graded quotients into the residue field are already available.
- **Sen's congruence (1.2)** — p^{j+1} ∣ b_{j+1} − b_j, the roadmap's end theorem `pow_succ_dvd_lowerIndex_sub`. It needs 1.1 and Sen's induction on elements α_k of valuation k.
- **Explicit upper breaks (1.3)** — u_j = b₀ + Σ (b_{a+1} − b_a)/p^{a+1}. This needs 1.1 for the slopes. Integrality alone already follows from the library's Hasse–Arf for cyclic p-groups.
