<!--tauceti-status:v1 {"roadmap":"LocalFieldsRamification","to_sha":"e440f4eb3fccf5479ede3f5d6a671b4be37c9dde","ts":"2026-09-30T05:46:25Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","remaining":"the worked Q_2(sqrt 2) values; a named totally ramified integral basis","state":"partial"},{"id":"Layer 1","remaining":"the bundled deep-unit log isomorphism U(K,i) = m^i = Z_p^N; finiteness of the full torsion group mu(K)","state":"partial"},{"id":"Layer 2","remaining":"reduction equivalence with residue extensions, rigidity after fixing residue data, the divisibility-lattice statement","state":"partial"},{"id":"Layer 3","remaining":"tame Galois criterion, upper-numbering quotient theorem, the psiNat-shifted norm and graded norm maps, Hasse-Arf, the Q_2(mu_8) witnesses","state":"partial"},{"id":"Layer 4","remaining":"K^t and wild inertia P_K, the tame character on I_K/P_K, the Iwasawa presentation, translation lemmas","state":"partial"}],"readme_sha":"2f2d0d97fbe2923904921be332a6c245bafe4a046aa394c495af5eab5f5017bf","roadmap":"LocalFieldsRamification","to_sha":"e440f4eb3fccf5479ede3f5d6a671b4be37c9dde"}-->
# Status: LocalFieldsRamification

This file documents the status of the LocalFieldsRamification roadmap up until `e440f4e` (2026-09-30T05:46:25Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The arithmetic of a single finite extension is essentially in place, and so is the unramified theory up to Gal(K^ur/K) ≅ Ẑ. Every layer still has gaps, though. Layer 3 lacks the norm-side results and Hasse–Arf. Layer 4 has inertia but not wild inertia, the tame character on I_K/P_K, or the Iwasawa presentation.

### Named results

- **The fundamental identity**: the intrinsic ramification index and residue degree satisfy e(L/K)·f(L/K) = [L:K] ([`ramificationIndex_mul_inertiaDegree`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/LocalField/InertiaDegree.html#TauCeti.ramificationIndex_mul_inertiaDegree)).
- **The Galois group of the maximal unramified extension is Ẑ**, with arithmetic Frobenius as the canonical generator ([`maximalUnramifiedGaloisGroupEquivZHat`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/LocalField/Unramified/ZHat.html#TauCeti.maximalUnramifiedGaloisGroupEquivZHat)). It rests on existence and uniqueness of the unramified extension of each degree ([`existsUnique_isUnramified_finrank_eq`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/LocalField/Unramified/Existence.html#TauCeti.existsUnique_isUnramified_finrank_eq)).
- **Herbrand's theorem**: for a normal subgroup H, restriction carries the lower ramification group G_u onto (G/H)_{φ(u)} ([`map_restrictNormalHom_lowerRamificationGroupReal`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/LocalField/Herbrand/Quotient.html#TauCeti.LocalFieldsRamification.map_restrictNormalHom_lowerRamificationGroupReal)). With it come the tower law φ_{M/K} = φ_{L/K} ∘ φ_{M/L} ([`herbrand_tower`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/LocalField/Herbrand/Tower.html#TauCeti.LocalFieldsRamification.herbrand_tower)) and its analogues for ψ and ψℕ.
- **Hilbert's formula for the different**: for L/K finite Galois, d(L/K) = ∑_{i≥0}(#G_i − 1) ([`differentExponent_eq_finsum_lowerRamificationGroup`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/LocalField/Different/Hilbert.html#TauCeti.differentExponent_eq_finsum_lowerRamificationGroup)). It is unconditional now that local monogenicity is proved ([`exists_integerRing_adjoin_eq_top`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/LocalField/Monogenic.html#TauCeti.exists_integerRing_adjoin_eq_top)).
- **The power-class count**: #(Kˣ/(Kˣ)ⁿ) = n·#μ_n(K)·q^{v_K(n)} whenever n ≠ 0 in K, including p ∣ n in mixed characteristic ([`card_powerClasses`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/LocalField/PowerSubgroup/Basic.html#TauCeti.card_powerClasses)). It gives #(ℚ_2ˣ/(ℚ_2ˣ)²) = 8 ([`card_squareClasses_padic_two`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/LocalField/SquareClass.html#TauCeti.card_squareClasses_padic_two)).

### Notable definitions and infrastructure

- **Total ramification and Eisenstein generators**: [`IsTotallyRamified`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/LocalField/RamificationIndex.html#TauCeti.IsTotallyRamified) is equivalent to generation by an Eisenstein root ([`isTotallyRamified_iff_exists_eisenstein_generator`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/LocalField/Eisenstein/TotallyRamified.html#TauCeti.isTotallyRamified_iff_exists_eisenstein_generator)). A totally and tamely ramified extension is K(π^{1/e}) ([`exists_pow_eq_uniformizer_of_isTamelyRamified`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/LocalField/TamelyRamified.html#TauCeti.IsTotallyRamified.exists_pow_eq_uniformizer_of_isTamelyRamified)). This supplies what Counting Totally Ramified Extensions consumes.
- **The inertia subgroup**: [`inertiaSubgroup`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/LocalField/Unramified/Inertia.html#TauCeti.inertiaSubgroup) is closed and normal in G_K, with G_K/I_K ≅ Gal(K^ur/K) ([`quotientInertiaSubgroupEquiv`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/LocalField/Unramified/Inertia.html#TauCeti.quotientInertiaSubgroupEquiv)). The Frobenius lifts form a coset of I_K. This is the frame in which wild inertia and the tame quotient will be stated.
- **The integral inverse Herbrand function**: [`psiNat`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/LocalField/Herbrand/Basic.html#TauCeti.LocalFieldsRamification.psiNat) is the only conversion from Herbrand values to unit depths, and the shifted norm inclusion is to be stated in terms of it.

### Roadmap coverage

All five layers are partial, but most are close.

- **Layer 0** lacks only the worked ℚ_2(√2) values. A named integral basis in the totally ramified case is also missing, though it is implicit in the fact that any uniformizer generates 𝒪[L].
- **Layer 1** has the filtration and its splittings, the square theorem with its sharpness, the power-class count in both regimes with its absolute-value form, openness of power subgroups, the dyadic count, and U(K,1) pro-p. Log and exp are inverse on deep units but are not bundled as U(K,i) ≅ 𝓂[K]^i ≅ ℤ_p^N, and finiteness of the whole torsion group μ(K) is not stated.
- **Layer 2** has the predicate with its étale comparison, composita and base change, Frobenius, norms, existence and uniqueness inside a fixed closure, K^ur ≅ Ẑ, and the ℚ_2(√5) examples. The reduction equivalence with residue extensions and the residue-data rigidity statement are open.
- **Layer 3** has:
  - the Eisenstein characterization and the factorization L/L₀/K (in the source);
  - the tame radical theorem and tame towers;
  - monogenicity and Eisenstein orthogonality;
  - injective quotient embeddings, and G_1 as the Sylow p-subgroup of G_0;
  - lower-numbering Herbrand, the tower laws, and ψℕ;
  - the different and discriminant package.

  Open are the tame Galois criterion and embedding into μ_e, the upper-numbering quotient statement, the ℚ_2(μ_8) witnesses, the norm on the unit filtration beyond the unramified case, and Hasse–Arf.
- **Layer 4** has the ambient model and inertia, with its exact sequence and Frobenius lifts. Nothing further has begun.

## The frontier

- **The upper-numbering quotient theorem**: (G/H)^v = G^v H/H should now follow from the lower-numbering Herbrand theorem and the ψ tower law. It is the form Hasse–Arf transports along.
- **The Herbrand-shifted norm**: N(U(L, ψℕ(i))) ⊆ U(K,i) for Galois L/K, then the four graded norm maps for cyclic totally ramified extensions of prime degree. These use ψℕ and the level-t quotient embedding, both now available.
- **Hasse–Arf**: integrality of upper breaks for abelian extensions, via the prime-order quotient induction. It is blocked on the two items above.
- **Wild inertia and the tame character**: K^t, P_K = Gal(Kˢ/K^t) as the pro-p Sylow subgroup of I_K, and I_K/P_K ≅ Ẑ^{(p')}(1). The finite-level Sylow statement and the tame radical theorem are in place, and the Iwasawa presentation follows these.
- **The deep-unit isomorphism**: log and exp should be packaged as a topological isomorphism U(K,i) ≅ 𝓂[K]^i and hence ℤ_p^N. The power-class count and openness no longer wait on it.
