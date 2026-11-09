<!--tauceti-status:v1 {"roadmap":"ClassFieldTheory","to_sha":"93d1fe508e122e53ce5538a8a3994c290753f127","ts":"2026-10-26T01:30:01Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","state":"done"},{"id":"Layer 1","state":"done"},{"id":"Layer 2","state":"done"},{"id":"Layer 3","state":"done"},{"id":"Layer 4","state":"done"},{"id":"Layer 5","state":"done"},{"id":"Layer 6","state":"done"},{"id":"Layer 7","state":"done"},{"id":"Layer 8","remaining":"localClassFieldCorrespondence_primeToResidueCharacteristic","state":"partial"},{"id":"Layer 9","state":"done"},{"id":"Layer 10","remaining":"exactness on the right of the Brauer sequence, exists_br_of_sum_eq_zero","state":"partial"},{"id":"Layer 11","remaining":"globalArtinMap_local, globalArtinMap_ideal and globalArtinMap_isArithFrobAt","state":"partial"},{"id":"Layer 12","remaining":"globalAbelianExistence, globalClassField and globalClassFieldCorrespondence, rayClassArtinMap","state":"partial"},{"id":"Layer 13","remaining":"rayClassField, hilbertClassField, narrowHilbertClassField, ringClassField and kroneckerWeber","state":"partial"},{"id":"Layer 14","state":"done"}],"readme_sha":"d4d2111cf44b6579960c785b7618376ccccf0f404dd0d602726bad705c221036","roadmap":"ClassFieldTheory","to_sha":"93d1fe508e122e53ce5538a8a3994c290753f127"}-->
# Status: ClassFieldTheory

This file documents the status of the ClassFieldTheory roadmap up until `93d1fe5` (2026-10-26T01:30:01Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The abstract theory, the whole local theory up to the local class-field correspondence in characteristic zero, and the local Weil group are done. Globally, the global class formation and finite global reciprocity are proved, along with every input to global existence. What remains is the local laws of the global Artin map, the assembly of global existence and the correspondence, and the named class fields.

### Named results

- **Tate's theorem** — for a class formation, [`tateIso`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ClassFieldTheory/Formation/Tate/Theorem.html#TauCeti.ClassFieldTheory.ClassFormation.tateIso) `Ĥ^r(U/V, ℤ) ≃ Ĥ^{r+2}(U/V, A^V)` is cup product with the fundamental class, in every integer degree. Nakayama's tensor-product generalization is also proved.
- **Local reciprocity for the Weil group** — for a nonarchimedean local field of characteristic zero, the local Artin map is an isomorphism of topological groups from `Kˣ` onto the topological abelianization of `W_K` ([`localWeilArtinEquiv`](https://taucetiproject.org/docs/TauCeti/NumberTheory/ClassFieldTheory/WeilGroup/Reciprocity.html#TauCeti.ClassFieldTheory.localWeilArtinEquiv)).
- **Finite global reciprocity** — for a finite Galois extension of number fields, [`globalArtinEquiv`](https://taucetiproject.org/docs/TauCeti/NumberTheory/ClassFieldTheory/Global/Reciprocity.html#TauCeti.ClassFieldTheory.globalArtinEquiv) gives `C_K / N_{L/K}(C_L) ≃ Gal(L/K)^ab`. It is the abstract Artin map of the global class formation and does not depend on the embedding of `L`.
- **The norm index theorem** — for finite abelian `L/K`, `[C_K : N_{L/K}(C_L)] = [L : K]` ([`card_ideleClassNormQuotient`](https://taucetiproject.org/docs/TauCeti/NumberTheory/ClassFieldTheory/Global/Reciprocity.html#TauCeti.ClassFieldTheory.card_ideleClassNormQuotient)).
- **Hilbert reciprocity** — the Hilbert invariants of `a, b ∈ Kˣ` sum to zero over all places of a number field ([`hilbertProductFormula`](https://taucetiproject.org/docs/TauCeti/NumberTheory/ClassFieldTheory/Global/Hilbert/Reciprocity.html#TauCeti.ClassFieldTheory.hilbertProductFormula)). Quadratic reciprocity for odd primes is [equivalent](https://taucetiproject.org/docs/TauCeti/NumberTheory/ClassFieldTheory/Global/QuadraticReciprocity.html#TauCeti.ClassFieldTheory.sum_finiteHilbertInvariantAt_add_sum_infiniteHilbertInvariantAt_eq_zero_iff) to the vanishing of their Hilbert sum.

### Notable definitions and infrastructure

- **The global invariant** — [`globalInv`](https://taucetiproject.org/docs/TauCeti/NumberTheory/ClassFieldTheory/Global/ClassFormation.html#TauCeti.ClassFieldTheory.globalInv) takes the sum of the local invariants of an idele lift after refinement. This works around the `H³` obstruction to lifting idele classes. The invariant is [injective](https://taucetiproject.org/docs/TauCeti/NumberTheory/ClassFieldTheory/Global/ClassFormation.html#TauCeti.ClassFieldTheory.globalInv_injective) and is pinned down by two equations, and it makes the idele-class formation the [global class formation](https://taucetiproject.org/docs/TauCeti/NumberTheory/ClassFieldTheory/Global/ClassFormation.html#TauCeti.ClassFieldTheory.globalClassFormation).
- **The local invariant and the local class formation** — [`invMap`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ClassFieldTheory/Brauer/Invariant.html#TauCeti.ClassFieldTheory.invMap) identifies `Br K` with `ℚ/ℤ`, and [`localClassFormation`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/ClassFieldTheory/Local/ClassFormation.html#TauCeti.ClassFieldTheory.localClassFormation) uses it as its invariant, so the Brauer side and reciprocity share one normalization.
- **The Kummer case of global existence** — [this result](https://taucetiproject.org/docs/TauCeti/NumberTheory/ClassFieldTheory/GlobalExistence/Kummer.html#TauCeti.ClassFieldTheory.exists_abelianLayer_globalNormSubgroup_eq_of_pow_mem) says that for `K ∋ ζ_p`, every open subgroup of `C_K` containing the `p`-th powers is a norm subgroup. Upward closure and descent are also proved, so the Artin–Tate induction has all of its inputs.

### Roadmap coverage

- **Done:** Layers 0–7, 9 and 14. In the source, the Tate–Nakayama theorem, `primaryComponent_tateCohomology_eq_bot`, `tateDualityPairing_perfect_mixed`, the conductor ideal and character conductors are now all present. These were the items the previous report listed as missing from Layers 0, 5 and 7.
- **Layer 8** is partial: `localClassFieldCorrespondence` is proved in characteristic zero, but the prime-to-residue-characteristic version is not.
- **Layer 10** is partial: `globalInv` is in, but exactness on the right of the Brauer sequence is not. Only surjectivity of the sum of local invariants is proved; the step that makes a family with total invariant zero the localization of a global class is missing.
- **Layer 11** is partial: the global class formation, the global Artin map, its triviality on principal ideles and tower compatibility are in. The local, ideal-theoretic and Frobenius laws are not.
- **Layer 12** is partial: the norm index, uniqueness, norm limitation, composita and intersections, and the three existence inputs are in. Still missing are `globalAbelianExistence`, the global class field, the correspondence and the ray-class Artin map.
- **Layer 13** is partial: the cyclic Hasse norm theorem now holds unconditionally. The principal ideal theorem for a class formation and the ring-class quotient are in, but no named class field and no Kronecker–Weber.

## The frontier

- **Global existence** — run the index induction from upward closure, descent and the Kummer case to get `globalAbelianExistence`. The abstract [existence induction](https://taucetiproject.org/docs/TauCeti/NumberTheory/ClassFieldTheory/Formation/ExistenceInduction.html#TauCeti.ClassFieldTheory.ClassFormation.exists_abelianLayer_normSubgroup_eq_of_forall_prime) is already in place.
- **The global class-field correspondence** — package the global class field and its order isomorphism once existence holds. Uniqueness and the inclusion test are already proved.
- **Local laws of the global Artin map** — compatibility with `localArtinAt` through decomposition groups, agreement with the ideal-theoretic Artin map at unramified primes, and the arithmetic Frobenius normalization.
- **Ray, Hilbert and ring class fields, and Kronecker–Weber** — these are applications of the correspondence and wait on it.
- **The remaining local and Brauer statements** — the prime-to-residue-characteristic local correspondence, and exactness on the right of the global Brauer sequence.
