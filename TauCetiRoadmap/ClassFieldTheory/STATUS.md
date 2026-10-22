<!--tauceti-status:v1 {"roadmap":"ClassFieldTheory","to_sha":"f91b6396a35d847a87a0d37519325918356bc0fc","ts":"2026-10-21T20:08:25Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","remaining":"the Tate-Nakayama tensor-product generalization and primaryComponent_tateCohomology_eq_bot","state":"partial"},{"id":"Layer 1","state":"done"},{"id":"Layer 2","state":"done"},{"id":"Layer 3","state":"done"},{"id":"Layer 4","state":"done"},{"id":"Layer 5","remaining":"tateDualityPairing_perfect_mixed in the named form","state":"partial"},{"id":"Layer 6","state":"done"},{"id":"Layer 7","remaining":"the conductor ideal and character conductors","state":"partial"},{"id":"Layer 8","remaining":"localClassFieldCorrespondence at both scopes, with existence stated by name","state":"partial"},{"id":"Layer 9","state":"done"},{"id":"Layer 10","remaining":"exactness on the right of the Brauer sequence and globalInv","state":"partial"},{"id":"Layer 11","remaining":"globalClassFormation, globalArtinMap and its local, principal, ideal and Frobenius laws","state":"partial"},{"id":"Layer 12","remaining":"the global Kummer case, global existence, uniqueness and the global correspondence","state":"partial"},{"id":"Layer 13","remaining":"the class fields, Kronecker-Weber and an unconditional cyclic Hasse norm theorem","state":"partial"},{"id":"Layer 14","state":"done"}],"readme_sha":"d4d2111cf44b6579960c785b7618376ccccf0f404dd0d602726bad705c221036","roadmap":"ClassFieldTheory","to_sha":"f91b6396a35d847a87a0d37519325918356bc0fc"}-->
# Status: ClassFieldTheory

This file documents the status of the ClassFieldTheory roadmap up until `f91b639` (2026-10-21T20:08:25Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The abstract theory (Layers 1–4) and the local class formation with finite local reciprocity (Layer 6) are done, and so is the local Weil group. Globally, both fundamental inequalities, the sum formula for Brauer classes and Hilbert reciprocity are proved; the global invariant, the global class formation and everything that rests on global reciprocity are not.

### Named results

- **Tate's theorem** — for a class formation, [`tateIso`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ClassFieldTheory/Formation/Tate/Theorem.html#TauCeti.ClassFieldTheory.ClassFormation.tateIso) `Ĥ^r(U/V, ℤ) ≃ Ĥ^{r+2}(U/V, A^V)` is cup product with the fundamental class, in every integer degree.
- **Local reciprocity for the Weil group** — for a nonarchimedean local field of characteristic zero, the local Artin map is an isomorphism of topological groups from `Kˣ` onto the topological abelianization of `W_K` ([`localWeilArtinEquiv`](https://taucetiproject.org/docs/TauCeti/NumberTheory/ClassFieldTheory/WeilGroup/Reciprocity.html#TauCeti.ClassFieldTheory.localWeilArtinEquiv)).
- **Tate's local Euler characteristic formula** — the Euler characteristic of a finite smooth discrete Galois module over a finite extension of `ℚ_p` is the normalized absolute value of its order ([`localEulerCharacteristic_eq_localCardNorm`](https://taucetiproject.org/docs/TauCeti/NumberTheory/ClassFieldTheory/Local/EulerCharacteristic/Theorem.html#TauCeti.ClassFieldTheory.localEulerCharacteristic_eq_localCardNorm)).
- **The second fundamental inequality** — on every finite layer of the idele-class formation, the order of `H²` divides the degree ([`natCard_H2_globalFormation_dvd_degree`](https://taucetiproject.org/docs/TauCeti/NumberTheory/ClassFieldTheory/Global/IdeleClass/SecondInequality.html#TauCeti.ClassFieldTheory.natCard_H2_globalFormation_dvd_degree)) and `H¹` [vanishes](https://taucetiproject.org/docs/TauCeti/NumberTheory/ClassFieldTheory/Global/IdeleClass/SecondInequality.html#TauCeti.ClassFieldTheory.subsingleton_h1_globalFormation).
- **Hilbert reciprocity** — the Hilbert invariants of `a, b ∈ Kˣ` sum to zero over all places of a number field ([`hilbertProductFormula`](https://taucetiproject.org/docs/TauCeti/NumberTheory/ClassFieldTheory/Global/Hilbert/Reciprocity.html#TauCeti.ClassFieldTheory.hilbertProductFormula)), proved from [the sum formula](https://taucetiproject.org/docs/TauCeti/NumberTheory/ClassFieldTheory/Global/Brauer/SumFormula.html#TauCeti.ClassFieldTheory.sumLocalInv_brLocalization_eq_zero) for Brauer classes. Quadratic reciprocity for two odd primes is [equivalent](https://taucetiproject.org/docs/TauCeti/NumberTheory/ClassFieldTheory/Global/QuadraticReciprocity.html#TauCeti.ClassFieldTheory.sum_finiteHilbertInvariantAt_add_sum_infiniteHilbertInvariantAt_eq_zero_iff) to the vanishing of their Hilbert sum, as are the supplementary laws.

### Notable definitions and infrastructure

- **The local invariant and the local class formation** — [`invMap`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ClassFieldTheory/Brauer/Invariant.html#TauCeti.ClassFieldTheory.invMap) identifies `Br K` with `ℚ/ℤ`, and [`localClassFormation`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ClassFieldTheory/Local/ClassFormation.html#TauCeti.ClassFieldTheory.localClassFormation) uses it as its invariant, so the Brauer side and reciprocity share one normalization.
- **The descended invariant** — [`ClassFormation.ofDescendedInv`](https://taucetiproject.org/docs/TauCeti/NumberTheory/ClassFieldTheory/Formation/DescendedInvariant.html#TauCeti.ClassFieldTheory.ClassFormation.ofDescendedInv) builds a class formation from an invariant defined on lifts after refinement; it is how the sum of local invariants will become `globalInv`.
- **Local Artin symbols at the places of a number field** — [`localArtinAt`](https://taucetiproject.org/docs/TauCeti/NumberTheory/ClassFieldTheory/Global/LocalArtin/FinitePlace.html#TauCeti.ClassFieldTheory.localArtinAt) and the archimedean [`infiniteArtinAt`](https://taucetiproject.org/docs/TauCeti/NumberTheory/ClassFieldTheory/Brauer/Archimedean/ArtinMap.html#TauCeti.ClassFieldTheory.infiniteArtinAt) are the local factors of the future global Artin map, and a [character formula](https://taucetiproject.org/docs/TauCeti/NumberTheory/ClassFieldTheory/Global/CharacterCarry.html#TauCeti.ClassFieldTheory.ClassFormation.apply_artinMap_eq_finsum_of_inv_eq_ideleSumLocalInv) already ties them to any idele-class formation whose invariant is the sum of local invariants.

### Roadmap coverage

- **Done:** Layers 1–4, 6, 9 and 14. Layer 14 states quadratic reciprocity as the equivalence above.
- **Layer 0** is partial: the Tate–Nakayama tensor-product generalization and `primaryComponent_tateCohomology_eq_bot` are missing.
- **Layer 5** is partial: duality is stated on the cochain model, not as the named `tateDualityPairing_perfect_mixed`.
- **Layer 7** is partial: `geometricArtinMap` is in; the conductor ideal and character conductors are not in evidence.
- **Layer 8** is partial. Uniqueness, norm limitation, upward closure, conductors of local class fields and injectivity of the Artin map in characteristic zero are in. `localClassFieldCorrespondence` is not, and existence itself does not appear by name in the evidence.
- **Layer 10** is partial. Missing: exactness on the right of the Brauer sequence, and `globalInv`.
- **Layer 11** is partial: only the local factors and the character formula exist.
- **Layer 12** is partial: idelic norm subgroups, admissible moduli, [`abelianConductor`](https://taucetiproject.org/docs/TauCeti/NumberTheory/ClassFieldTheory/Global/AdmissibleModulus.html#TauCeti.ClassFieldTheory.abelianConductor) and the abstract [existence induction](https://taucetiproject.org/docs/TauCeti/NumberTheory/ClassFieldTheory/Formation/ExistenceInduction.html#TauCeti.ClassFieldTheory.ClassFormation.exists_abelianLayer_normSubgroup_eq_of_forall_prime) are in. Existence and the correspondence are not.
- **Layer 13** is partial: a cyclic Hasse norm theorem assuming `H¹` vanishing, the ring-class quotient and the principal ideal theorem for a class formation are in; no class field yet.

## The frontier

- **`globalInv` and the global class formation** — apply the descended invariant to the sum of local invariants on idele classes and package `globalClassFormation`. Its inputs are all in place.
- **Global Artin reciprocity** — transport the abstract Artin map to `C_K / N_{L/K}(C_L) ≃ Gal(L/K)^ab`. Then prove its local, principal-idele, ideal-theoretic and Frobenius laws.
- **Global existence and the correspondence** — the abstract induction and the Kummer index computations are in; the global Kummer case needs reciprocity. The class fields of Layer 13 and Kronecker–Weber come after.
- **The local class-field correspondence** — package `localClassFieldCorrespondence` at both scopes from the Layer 8 pieces.
- **The Tate–Nakayama theorem and the named duality pairing** — `Ĥ^r(Γ, M) ≃ Ĥ^{r+2}(Γ, M ⊗ C)` when `Tor₁(M, C) = 0`, and `tateDualityPairing_perfect_mixed` in the README's named form.
