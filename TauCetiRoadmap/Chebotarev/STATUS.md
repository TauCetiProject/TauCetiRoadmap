<!--tauceti-status:v1 {"roadmap":"Chebotarev","to_sha":"b1ab119fa96ae6d2d8f43e2aa8159a148ba67f57","ts":"2026-09-27T20:34:44+00:00"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 1","remaining":"the named cyclotomic-tower regression for both Frobenius restriction laws","state":"partial"},{"id":"Layer 2","state":"done"},{"id":"Layer 3","remaining":"the ratio-to-logarithm density dictionary, including upper and lower bounds","state":"partial"},{"id":"Layer 4","remaining":"the public cyclotomicCharacterWeight interface and its Euler-product theorem","state":"partial"},{"id":"Layer 5","state":"done"},{"id":"Layer 6","state":"done"},{"id":"Layer 7","state":"done"},{"id":"Layer 8","remaining":"the named cyclotomic-tower regression for the powered relative Frobenius","state":"partial"},{"id":"Layer 9","state":"done"},{"id":"Layer 10","state":"done"},{"id":"Layer 11","remaining":"separate degree-above-one and finite-prime discard estimates, and the degree-four powered-filter regression","state":"partial"},{"id":"Layer 12","state":"done"},{"id":"Layer 13","state":"done"},{"id":"Layer 14","remaining":"the named cyclic-degree-four agreement regression","state":"partial"}],"readme_sha":"28488091d47ef77d2718b7cf6a3fe61d0de0f8b81a8dff8fdc3afd1fb2446fc3","roadmap":"Chebotarev","to_sha":"b1ab119fa96ae6d2d8f43e2aa8159a148ba67f57"}-->
# Status: Chebotarev

This file documents the status of the Chebotarev roadmap up until `b1ab119` (2026-09-27T20:34:44+00:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Chebotarev's Dirichlet and natural density theorems, its weighted `ψ` theorem, and the prime-counting asymptotic are proved. Several supporting layers remain partial against the roadmap's exact interface and regression requirements; no theorem layer is untouched.

### Named results

- **Chebotarev's Dirichlet-density theorem** — a Frobenius class `C` in a finite Galois extension `L/K` has density `#C/#Gal(L/K)` ([`hasDirichletDensity_frobeniusPrimeSet`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/Chebotarev/Density/Chebotarev.html#NumberField.Chebotarev.hasDirichletDensity_frobeniusPrimeSet)).
- **Weighted Chebotarev** — the Frobenius Chebyshev function satisfies `ψ_C(x) = (#C/#Gal(L/K))x + o(x)` ([`frobeniusPsi_asymptotic`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/Chebotarev/PrimeCounting/Chebotarev.html#NumberField.Chebotarev.frobeniusPsi_asymptotic)).
- **Prime-counting Chebotarev** — the number of primes in `C` up to norm `x` is asymptotic to `(#C/#Gal(L/K)) Li(x)` ([`frobeniusPrimeCount_isEquivalent_logIntegral`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/Chebotarev/PrimeCounting/FrobeniusPrimeCount.html#NumberField.Chebotarev.frobeniusPrimeCount_isEquivalent_logIntegral)).
- **Natural-density Chebotarev** — among all primes of `K`, the class `C` has proportion `#C/#Gal(L/K)` ([`hasNaturalDensity_frobeniusPrimeSet`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/Chebotarev/PrimeCounting/FrobeniusPrimeCount.html#NumberField.Chebotarev.hasNaturalDensity_frobeniusPrimeSet)).
- **The cyclic fixed-field fibre count** — degree-one primes with the prescribed relative Frobenius occur with multiplicity `#Gal(L/K)/(#C · orderOf σ)` over each prime in `C` ([`fixedField_frobenius_fiber_card`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/Chebotarev/FixedField/FiberCount.html#NumberField.Chebotarev.fixedField_frobenius_fiber_card)).

### Notable definitions and infrastructure

- **The Frobenius-prime set** ([`frobeniusPrimeSet`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/Chebotarev/FrobeniusPrimeSet.html#NumberField.Chebotarev.frobeniusPrimeSet)) — gives the density and counting theorems their common carrier of unramified primes.
- **The powered Frobenius von Mangoldt coefficient** ([`frobeniusVonMangoldtCoeff`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/Chebotarev/PrimeCounting/VonMangoldt.html#NumberField.Chebotarev.frobeniusVonMangoldtCoeff)) — assigns a prime-power term according to the powered Frobenius class, enabling the weighted theorem.
- **The cyclotomic Artin map** ([`cyclotomicArtin`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/Chebotarev/GaloisCharacter/Cyclotomic/Basic.html#NumberField.Chebotarev.cyclotomicArtin)) — factors the character weight through a ray class group for the continuation argument.

### Roadmap coverage

Layers 2, 5–7, 9–10, and 12–13 are done: they supply the prime carrier, character continuation, cyclotomic and abelian density, crossing data, general Dirichlet density, weighted transfer, and prime counts. Layers 1 and 8 remain partial because the prescribed cyclotomic-tower regression is not established, although the fixed-field count and exceptional-prime carrier now exist. Layer 3 has prime-sum and finite-deletion results but lacks the complete ratio-to-logarithm normalization dictionary. Layer 4 has Frobenius orientation, character weights, and orthogonality, but the roadmap's public `cyclotomicCharacterWeight` interface is not established. Layer 11 has the weighted coefficient, character expansion, and combined discard bound, but the separately named discard estimates and degree-four powered-filter regression are not established. Layer 14 has natural density and its agreement with Dirichlet density, but the requested degree-four agreement regression is not established.

## The frontier

- **Density normalization** — prove the full equivalence between the ratio to the all-prime sum and logarithmic normalization, including upper and lower bounds and finite ramified-set deletion.
- **Cyclotomic character interface** — supply the roadmap's canonical `cyclotomicCharacterWeight` and its Euler-product statement, connecting it explicitly to the established Galois weight and ray-class factorization.
- **Weighted discard package** — state the residue-degree-above-one and finite-prime estimates separately, alongside the existing [combined `o(x)` bound](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/Chebotarev/PrimeCounting/Discard.html#NumberField.Chebotarev.frobeniusDiscard_isLittleO).
- **Cyclotomic-tower regression** — prove the prescribed `ℚ(ζ₇) ⊃ ℚ(√−7) ⊃ ℚ` example at `p = 3`, checking both restriction laws and the residue-degree exponent.
- **Degree-four powered-filter regression** — show explicitly that a prime with Frobenius `g` contributes its square term to the `g²` coefficient, completing the requested counting and consistency checks.
