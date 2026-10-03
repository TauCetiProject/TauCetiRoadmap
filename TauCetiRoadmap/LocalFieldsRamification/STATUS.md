<!--tauceti-status:v1 {"roadmap":"LocalFieldsRamification","to_sha":"8a32441b6e9708f9d6aeb9de8d3b11a35b9ee6ce","ts":"2026-10-01T19:24:41Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","remaining":"the worked Q_2(sqrt 2) values; a named totally ramified integral basis","state":"partial"},{"id":"Layer 1","remaining":"the Z_p^N form of the deep-unit isomorphism; finiteness of the torsion group mu(K) and its p-part","state":"partial"},{"id":"Layer 2","remaining":"reduction equivalence with residue extensions, rigidity after fixing residue data, the divisibility-lattice statement","state":"partial"},{"id":"Layer 3","remaining":"tame Galois criterion, finite-level tame-character equivariance and action formula, psiNat-shifted norm and graded norm maps, Hasse-Arf, Q_2(mu_8) witnesses","state":"partial"},{"id":"Layer 4","remaining":"P_K onto each finite G_1, the finite tame criterion for K^t, procyclic tame inertia and the marked Iwasawa presentation, translation lemmas","state":"partial"}],"readme_sha":"71341ee291c83402a632980bb8fce9bd196641c27e5589a77c36005b3bc49833","roadmap":"LocalFieldsRamification","to_sha":"8a32441b6e9708f9d6aeb9de8d3b11a35b9ee6ce"}-->
# Status: LocalFieldsRamification

This file documents the status of the LocalFieldsRamification roadmap up until `8a32441` (2026-10-01T19:24:41Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The arithmetic of a single finite extension, the unramified theory up to Gal(K^ur/K) ≅ Ẑ, and Herbrand's theorem in both numberings are in place, and Layer 4 now has wild inertia, the tame character and the Iwasawa relation. Every layer is still partial: Layer 3 lacks the norm maps on the unit filtration and Hasse–Arf, and Layer 4 lacks the Iwasawa presentation itself.

### Named results

- **The Galois group of the maximal unramified extension is Ẑ**, with arithmetic Frobenius as the canonical generator ([`maximalUnramifiedGaloisGroupEquivZHat`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/LocalField/Unramified/ZHat.html#TauCeti.maximalUnramifiedGaloisGroupEquivZHat)).
- **Herbrand's theorem**: for a normal subgroup H, restriction carries G_u onto (G/H)_{φ(u)} in the lower numbering ([`map_restrictNormalHom_lowerRamificationGroupReal`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/LocalField/Herbrand/Quotient.html#TauCeti.LocalFieldsRamification.map_restrictNormalHom_lowerRamificationGroupReal)) and G^v onto (G/H)^v in the upper numbering ([`map_restrictNormalHom_upperRamificationGroup`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/LocalField/Herbrand/UpperQuotient.html#TauCeti.LocalFieldsRamification.map_restrictNormalHom_upperRamificationGroup)).
- **Hilbert's formula for the different**: for L/K finite Galois, d(L/K) = ∑_{i≥0}(#G_i − 1) ([`differentExponent_eq_finsum_lowerRamificationGroup`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/LocalField/Different/Hilbert.html#TauCeti.differentExponent_eq_finsum_lowerRamificationGroup)).
- **Tame inertia is the prime-to-p Tate module**: the tame character σ ↦ (σ(π^{1/m})/π^{1/m})_m gives I_K/P_K ≅ Ẑ^{(p')}(1) as topological groups, independently of π and equivariantly for G_K ([`quotientWildInertiaSubgroupEquiv`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/LocalField/Tame/Character.html#TauCeti.quotientWildInertiaSubgroupEquiv)).
- **The Iwasawa relation**: in G_K/P_K, conjugation by an arithmetic Frobenius lift σ raises tame inertia to the q-th power ([`toTameQuotient_mul_toTameQuotient_mul_inv`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/LocalField/Tame/Quotient.html#TauCeti.IsArithFrobeniusLift.toTameQuotient_mul_toTameQuotient_mul_inv)).

### Notable definitions and infrastructure

- **Wild inertia**: [`wildInertiaSubgroup`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/LocalField/WildInertia.html#TauCeti.wildInertiaSubgroup) is the subgroup fixing K^t = K^ur(π^{1/m} : p ∤ m). It is closed and normal, is the inverse limit of the finite-level G_1, and is the unique pro-p Sylow subgroup of I_K ([`isProPSylow_wildInertiaSubgroup`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/LocalField/WildInertia.html#TauCeti.isProPSylow_wildInertiaSubgroup)).
- **The prime-to-p Tate module** [`PrimeToPTateModule`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/RingTheory/RootsOfUnity/TateModule.html#TauCeti.PrimeToPTateModule), the inverse limit of the μ_m with p ∤ m, is compact and totally disconnected, and G_K acts on it through the roots of unity. It is the Ẑ^{(p')}(1) of the tame character.
- **The deep-unit logarithm** [`deepUnitExpLogEquiv`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/LocalField/DeepUnits.html#TauCeti.deepUnitExpLogEquiv): U(K,i) ≅ 𝓂[K]^i as topological groups when (p − 1)i > e, with the exponential as inverse.

### Roadmap coverage

All five layers are partial.

- **Layer 0** lacks only the worked ℚ_2(√2) values and a named integral basis in the totally ramified case.
- **Layer 1** has the filtration and its splittings, the square theorem with its sharpness, the power-class count in both regimes ([`card_powerClasses`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/LocalField/PowerSubgroup/Basic.html#TauCeti.card_powerClasses)), openness, U(K,1) pro-p, and the bundled deep-unit logarithm. The ℤ_p^N form of the deep units and finiteness of μ(K), with its p-part, are missing.
- **Layer 2** has the predicate, Frobenius, norms, existence and uniqueness inside a fixed closure, and K^ur with Gal(K^ur/K) ≅ Ẑ. The reduction equivalence with residue extensions, rigidity after fixing residue data and the divisibility lattice are open.
- **Layer 3** has the Eisenstein and tame radical theorems, monogenicity, the quotient embeddings with G_1 the Sylow subgroup of G_0, Herbrand's theorem in both numberings with ψℕ, the different package with Hilbert's formula, and the trace of powers of the maximal ideal. Open are the tame Galois criterion and embedding into μ_e, the action formula and the finite-level equivariance of θ_0 under conjugation, the effect of ψ on jumps, the shifted norm inclusion and the graded norm maps, Hasse–Arf, and the ℚ_2(μ_8) witnesses.
- **Layer 4** has the ambient model, inertia with its exact sequence and Frobenius lifts, the image of I_K in each finite Galois group as G_0, wild inertia, the tame character and the Iwasawa relation. Open are the image of P_K in each finite Galois group as all of G_1, the criterion that a finite subextension lies in K^t exactly when it is tame, the specialization at one prime ℓ ≠ p, the presentation itself, the translation lemmas, and functoriality of inertia in a finite extension of K.

## The frontier

- **The Iwasawa presentation**: prove tame inertia procyclic with a generator lifting to I_K, then build the marked isomorphism G_K/P_K ≅ ⟨σ, τ | στσ⁻¹ = τ^q⟩ and its Ẑ coordinate. The split sequence and the relation are in place.
- **Wild inertia at finite level**: P_K is proved to map into G_1(L/K) but not yet onto it, and a finite Galois subextension should lie in K^t exactly when it is tame.
- **The Herbrand-shifted norm**: N(U(L, ψℕ(i))) ⊆ U(K,i) for Galois L/K, then the four graded norm maps for cyclic totally ramified extensions of prime degree. Serre's norm lemma and the trace computation supply the local input.
- **Hasse–Arf**: integrality of upper breaks for abelian extensions, by the prime-order induction. The upper-numbering quotient theorem is available, so it waits only on the norm maps.
- **The finite-level twist**: θ_0(gσg⁻¹) = θ_0(σ)^q for g acting on the residue field as x ↦ x^q, and the action formula θ_i(στσ⁻¹) = θ_0(σ)^i θ_i(τ). The translation lemmas consume the first.
