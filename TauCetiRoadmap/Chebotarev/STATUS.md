<!--tauceti-status:v1 {"roadmap":"Chebotarev","to_sha":"d8476fa9f4c2cec35cabffce100e7c2e75966e6c","ts":"2026-09-09T22:44:31Z"}-->
# Status: Chebotarev

This file documents the status of the Chebotarev roadmap up until `d8476fa` (2026-09-09T22:44:31Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Layer 2's Frobenius-prime carrier and finite-exceptional-set package is complete, and most of the algebraic infrastructure for Layers 1 and 7 is present. Layers 4, 8, and 11 are genuinely partial; the analytic continuation, both Chebotarev density theorems, and the weighted prime-counting argument have not begun.

### Named results

- **The auxiliary-prime theorem** — above any bound it produces a rational prime congruent to `1` modulo a prescribed nonzero level, unramified in both number fields, with `Φ_q` irreducible over the base ([`NumberField.exists_auxiliaryPrime`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/Chebotarev/AuxiliaryPrime.html#NumberField.exists_auxiliaryPrime)).
- **The Artin-symbol tower laws** — restriction to a normal subextension carries the Artin class down unchanged, while raising the base raises it to the intervening residue degree ([`NumberField.artinSymbol_map_restrictNormalHom`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/NumberField/ArtinSymbol.html#NumberField.artinSymbol_map_restrictNormalHom), [`NumberField.artinSymbol_map_restrictScalarsHom_eq_pow_inertiaDeg`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/NumberField/ArtinSymbol.html#NumberField.artinSymbol_map_restrictScalarsHom_eq_pow_inertiaDeg)).
- **The unramified-prime partition** — the Frobenius fibres over all conjugacy classes are exactly the complement of the finite ramified set ([`NumberField.Chebotarev.iUnion_frobeniusPrimeSet`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/Chebotarev/FrobeniusPrimeSet.html#NumberField.Chebotarev.iUnion_frobeniusPrimeSet)).
- **The tagged fixed-field cyclotomic theorem** — a tag whose first-coordinate order divides the second makes the compositum cyclotomic over the field fixed by the cyclic subgroup it generates ([`TauCeti.fixedField_zpowers_isCyclotomicExtension`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/Chebotarev/TaggedFixedField.html#TauCeti.fixedField_zpowers_isCyclotomicExtension)).
- **Higher-prime-power removal for Frobenius fibres** — the difference between the Frobenius `ψ` and `ϑ` functions is `o(x)` ([`NumberField.Chebotarev.frobeniusPsi_sub_frobeniusTheta_isLittleO`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/Chebotarev/PrimeCounting/VonMangoldt.html#NumberField.Chebotarev.frobeniusPsi_sub_frobeniusTheta_isLittleO)).

### Notable definitions and infrastructure

- **The Frobenius prime set** ([`NumberField.Chebotarev.frobeniusPrimeSet`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/Chebotarev/FrobeniusPrimeSet.html#NumberField.Chebotarev.frobeniusPrimeSet)) — records unramifiedness dependently and then selects the Artin class, so later density statements never assign a Frobenius class at a ramified prime.
- **The Galois-character weight** ([`MonoidHom.galoisCharacterWeight`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/Chebotarev/GaloisCharacter/Weight.html#MonoidHom.galoisCharacterWeight)) — packages `χ(Frob 𝔭)` multiplicatively and sets ramified primes to zero; its unitary form and inverse-tag orthogonality prepare the character expansion.
- **The Frobenius von Mangoldt coefficient** ([`NumberField.Chebotarev.frobeniusVonMangoldtCoeff`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/Chebotarev/PrimeCounting/VonMangoldt.html#NumberField.Chebotarev.frobeniusVonMangoldtCoeff)) — filters prime powers by the powered Artin class, and supports the corresponding `ψ_C` and `ϑ_C` functions.

### Roadmap coverage

Layer 2 is done. Layer 1 has the conjugacy-class power API, both tower laws, and the split-completely characterization, but the stated cyclotomic tower regression is not established here. Layers 4 and 7 are partial: character weights and orthogonality exist, as do the auxiliary prime, full-degree/intersection results, product decomposition, and tagged fixed-field core, but the conductor/series interface and full tagged-fibre contraction do not. Layer 8 has cyclic fixed-field and divisibility infrastructure but not its exact residue-degree-one fibre count. Layer 11 has the powered coefficient, both summatory functions, and higher-prime-power removal, but not the other discard estimates or logarithmic-derivative identity. Layers 3, 5–6, 9–10, and 12–14 are untouched at theorem level.

## The frontier

- **The fixed-field fibre count** — prove the exact number `#G / (#C · orderOf σ)` of residue-degree-one primes above each prime in class `C`; the cyclic fixed-field and divisibility lemmas are now available.
- **Cyclotomic character-series continuation** — factor the character weight through the consumed ray-class carrier, then establish continuation and nonvanishing at `s = 1`; this still depends on the roadmap's ray-class counting and cancellation contracts.
- **Density normalization** — connect Frobenius prime sums to the all-prime denominator and justify logarithmic normalization, including deletion of the finite ramified set.
- **Crossing and abelian density** — finish the tagged Frobenius fibres, their contraction hypotheses, and the cyclic-group count before carrying cyclotomic density through the auxiliary-prime construction.
- **Weighted transfer and the summit** — add the residue-degree-above-one, finite-set, and total discard estimates, then prove the weighted crossing; the general `ψ_C`, `π_C`, Dirichlet-density, and natural-density theorems all remain beyond it.
