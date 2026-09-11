<!--tauceti-status:v1 {"roadmap":"Chebotarev","to_sha":"00381680ab2a0cb970acc235c613906f7811bffc","ts":"2026-09-11T15:17:25Z"}-->
# Status: Chebotarev

This file documents the status of the Chebotarev roadmap up until `0038168` (2026-09-11T15:17:25Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Layers 1 and 2—the conjugacy-class/Frobenius foundations and the partition of unramified primes into Frobenius fibres—are complete. The cyclotomic crossing, cyclic fixed-field fibre, and Frobenius-weighted counting layers are genuinely partial; density normalization, analytic continuation, Chebotarev density, and all final asymptotic and natural-density results have not begun.

### Named results

- **The auxiliary-prime theorem** — above any bound, it produces a rational prime in the required congruence class, unramified in both number fields, for which the cyclotomic polynomial is irreducible over the base ([`NumberField.exists_auxiliaryPrime`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/Chebotarev/AuxiliaryPrime.html#NumberField.exists_auxiliaryPrime)).
- **The Artin-symbol tower laws** — restriction to a normal subextension preserves the Artin symbol without a power, while raising the base field raises it to the intermediate residue degree ([`NumberField.artinSymbol_map_restrictNormalHom`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/NumberField/ArtinSymbol.html#NumberField.artinSymbol_map_restrictNormalHom), [`NumberField.artinSymbol_map_restrictScalarsHom_eq_pow_inertiaDeg`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/NumberField/ArtinSymbol.html#NumberField.artinSymbol_map_restrictScalarsHom_eq_pow_inertiaDeg)).
- **The unramified-prime partition** — the Frobenius fibres over all conjugacy classes have union exactly the complement of the finite ramified set ([`NumberField.Chebotarev.iUnion_frobeniusPrimeSet`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/Chebotarev/FrobeniusPrimeSet.html#NumberField.Chebotarev.iUnion_frobeniusPrimeSet)).
- **Cyclotomicity over a tagged fixed field** — a tag whose first-coordinate order divides the second-coordinate order makes the compositum cyclotomic over the field fixed by the cyclic subgroup it generates ([`TauCeti.fixedField_zpowers_isCyclotomicExtension`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/Chebotarev/TaggedFixedField.html#TauCeti.fixedField_zpowers_isCyclotomicExtension)).
- **Higher-prime-power removal** — the difference between Frobenius `ψ` and `ϑ` is `o(x)`, so the powered terms beyond exponent one are already negligible at the scale needed for prime counting ([`NumberField.Chebotarev.frobeniusPsi_sub_frobeniusTheta_isLittleO`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/Chebotarev/PrimeCounting/VonMangoldt.html#NumberField.Chebotarev.frobeniusPsi_sub_frobeniusTheta_isLittleO)).

### Notable definitions and infrastructure

- **The Frobenius prime set** ([`NumberField.Chebotarev.frobeniusPrimeSet`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/Chebotarev/FrobeniusPrimeSet.html#NumberField.Chebotarev.frobeniusPrimeSet)) — gives the roadmap its canonical prime carrier, with proof-independence, equivariance, disjointness, and complement-of-ramification laws.
- **The Galois-character ideal weight** ([`MonoidHom.galoisCharacterWeight`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/Chebotarev/GaloisCharacter/Weight.html#MonoidHom.galoisCharacterWeight)) — packages the character of Frobenius multiplicatively and sets the ramified Euler factors to zero, enabling the tagged character-orthogonality formula.
- **The Frobenius von Mangoldt coefficient** ([`NumberField.Chebotarev.frobeniusVonMangoldtCoeff`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/Chebotarev/PrimeCounting/VonMangoldt.html#NumberField.Chebotarev.frobeniusVonMangoldtCoeff)) — records prime powers using the powered Artin class and feeds the corresponding `ψ_C` and `ϑ_C` summatory functions.

### Roadmap coverage

Layers 1–2 are done. Layer 3 is untouched. Layer 4 has the Frobenius orientation, character weight, and pointwise orthogonality, but not the conductor comparison or analytic series; Layers 5–6 are untouched. Layer 7 has the auxiliary prime, cyclotomic irreducibility and disjointness, compositum splitting, and tagged fixed-field cyclotomicity, but not the complete tagged-fibre and contraction package. Layer 8 has both tower laws, the cyclic fixed-field Galois structure, exact group-order divisibility, and residue-degree-one/unique-prime ingredients, but not the stated exact fibre count or exceptional-set theorem. Layer 9–10 are untouched. Layer 11 has the coefficient, `ψ_C`, `ϑ_C`, and higher-prime-power estimate, but not the other discard estimates or logarithmic-derivative identity. Layers 12–14 are untouched.

## The frontier

- **The cyclic fixed-field fibre count** — prove the exact number `#G / (#C * orderOf σ)` of residue-degree-one primes with relative Frobenius `σ`; the cyclic Galois structure, degree-one contraction, uniqueness above the contracted prime, and exact divisibility are now available.
- **The tagged crossing package** — finish the Frobenius compatibility, pairwise tagged-fibre disjointness, and contraction hypotheses needed to turn the auxiliary-prime construction into Layer 9's lower bounds.
- **Prime-sum normalization** — define the Frobenius prime sums and prove equivalence between all-prime normalization, logarithmic normalization, and deletion of the finite ramified set.
- **Cyclotomic character series** — construct the continued series and prove analyticity and nonvanishing at one; the roadmap identifies ray-class counting and character partial-sum cancellation from Global Number Fields as prerequisites not established here.
- **The remaining discard estimates** — control residue degree above one and finite exceptional sets, then combine them with higher-prime-power removal before any weighted crossing or Tauberian argument.
