<!--tauceti-status:v1 {"roadmap":"Chebotarev","to_sha":"94050b6aee7bc349e209c85bf5e2cec3c49420a8","ts":"2026-09-11T22:46:43Z"}-->
# Status: Chebotarev

This file documents the status of the Chebotarev roadmap up until `94050b6` (2026-09-11T22:46:43Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Layer 2, the Frobenius-prime carrier and its finite exceptional set, is complete. Layers 1, 4, 7, 8, and 11 are genuinely partial; no Dirichlet-density, prime-number-theorem, or natural-density form of Chebotarev has landed, and Layers 3, 5, 6, 9, 10, and 12–14 remain untouched as theorem layers.

### Named results

- **The auxiliary-prime theorem** — above any bound it produces a prime congruent to `1` modulo a prescribed nonzero level, unramified in both number fields, with the corresponding cyclotomic polynomial irreducible over the base ([`NumberField.exists_auxiliaryPrime`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/Chebotarev/AuxiliaryPrime.html#NumberField.exists_auxiliaryPrime)).
- **Artin-symbol restriction to a normal subextension** — shrinking the top field carries the Artin class to the lower Artin class with no power or inverse ([`NumberField.artinSymbol_map_restrictNormalHom`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/NumberField/ArtinSymbol.html#NumberField.artinSymbol_map_restrictNormalHom)).
- **The Artin-symbol base-change power law** — raising the base field raises the original Artin class to the intermediate residue degree ([`NumberField.artinSymbol_map_restrictScalarsHom_eq_pow_inertiaDeg`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/NumberField/ArtinSymbol.html#NumberField.artinSymbol_map_restrictScalarsHom_eq_pow_inertiaDeg)).
- **The tagged fixed-field cyclotomic theorem** — when the order of a tag's first component divides that of its second, the compositum is cyclotomic over the fixed field of the generated cyclic subgroup ([`TauCeti.fixedField_zpowers_isCyclotomicExtension`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/Chebotarev/TaggedFixedField.html#TauCeti.fixedField_zpowers_isCyclotomicExtension)).
- **Higher-prime-power removal for Frobenius `ψ`** — the contribution beyond exponent one is `o(x)`, giving the first discard estimate needed to pass from `ψ_C` to `ϑ_C` ([`NumberField.Chebotarev.frobeniusPsi_sub_frobeniusTheta_isLittleO`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/Chebotarev/PrimeCounting/VonMangoldt.html#NumberField.Chebotarev.frobeniusPsi_sub_frobeniusTheta_isLittleO)).

### Notable definitions and infrastructure

- **The Frobenius-prime set** ([`NumberField.Chebotarev.frobeniusPrimeSet`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/Chebotarev/FrobeniusPrimeSet.html#NumberField.Chebotarev.frobeniusPrimeSet)) — packages exactly the unramified primes with a prescribed Artin class; its fibres are proof-independent, equivariant, pairwise disjoint, and cover the complement of the finite ramified set.
- **The Galois-character ideal weight** ([`MonoidHom.galoisCharacterWeight`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/Chebotarev/GaloisCharacter/Weight.html#MonoidHom.galoisCharacterWeight)) — evaluates a character on the Artin symbol away from ramification and vanishes at bad primes, enabling the correctly tagged character-orthogonality formula.
- **The Frobenius von Mangoldt coefficient** ([`NumberField.Chebotarev.frobeniusVonMangoldtCoeff`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/Chebotarev/PrimeCounting/VonMangoldt.html#NumberField.Chebotarev.frobeniusVonMangoldtCoeff)) — counts prime powers using the powered Artin class, and supplies the `ψ_C` and `ϑ_C` carriers for the future weighted argument.

### Roadmap coverage

Layer 2 is done. Layer 1 now has its conjugacy-class power API, both Artin-symbol tower laws, and the split-completely criterion, but the roadmap's explicit tower regression is not established here. Layer 4 has the Frobenius orientation, character weight, and orthogonality, but not the conductor factorization or analytic series. Layer 7 has the auxiliary prime, full cyclotomic degree and ramification machinery, compositum splitting, and tagged cyclotomic fixed fields, but not all Frobenius compatibility and contraction statements. Layer 8 has its cyclic fixed-field generator and key residue-degree-one lemmas, but not the exact fibre count or exceptional set. Layer 11 has the powered coefficient, `ψ_C`, `ϑ_C`, and higher-prime-power removal; its other discard estimates and logarithmic-derivative identity are absent. Layers 3, 5, 6, 9, 10, and 12–14 have no roadmap theorem established here.

## The frontier

- **The cyclic fixed-field fibre count** — prove the exact multiplicity `#G / (#C * orderOf σ)` and the converse from relative Frobenius back to `C`; the generator, divisibility, uniqueness, and residue-degree-one ingredients are now available.
- **The fixed-field exceptional set** — identify the discarded primes of the fixed field as those lying above `ramifiedPrimes K L`, rather than merely those ramifying in `L/E`.
- **Cyclotomic character continuation** — factor the Galois-character weight through the consumed ray-class character and establish continuation, the pole of the trivial character, and nonvanishing at `s = 1`; these are the missing inputs for cyclotomic density.
- **The remaining discard estimates** — prove that residue degree above one and any finite prime set contribute `o(x)`, then package the combined error required by weighted contraction.
- **Density normalization and the first density theorem** — connect the Frobenius-prime sums to the roadmap's ratio-normalized Dirichlet density and, after continuation is available, prove the cyclotomic fibre density; the abelian crossing and general Chebotarev theorems depend on those steps.
