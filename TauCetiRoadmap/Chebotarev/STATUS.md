<!--tauceti-status:v1 {"roadmap":"Chebotarev","to_sha":"8339b5a9999c7fe7c83ad0ac2b89c5a2754fd8c8","ts":"2026-09-28T06:14:44+00:00"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 1","state":"done"},{"id":"Layer 2","state":"done"},{"id":"Layer 3","remaining":"ratio-to-log normalization, upper and lower density bounds, and finite-set dictionary","state":"partial"},{"id":"Layer 4","remaining":"canonical cyclotomic character weight and its Euler product","state":"partial"},{"id":"Layer 5","remaining":"character-series continuation, trivial pole, and nonvanishing at one","state":"partial"},{"id":"Layer 6","remaining":"the named cyclotomic Frobenius-fibre density specialization","state":"partial"},{"id":"Layer 7","state":"done"},{"id":"Layer 8","state":"done"},{"id":"Layer 9","remaining":"tagged-fibre density transfer and the prescribed squeeze","state":"partial"},{"id":"Layer 10","state":"done"},{"id":"Layer 11","remaining":"higher-degree and finite-prime discard estimates, combined error, and logarithmic-derivative identity","state":"partial"},{"id":"Layer 12","state":"untouched"},{"id":"Layer 13","state":"untouched"},{"id":"Layer 14","state":"untouched"}],"readme_sha":"28488091d47ef77d2718b7cf6a3fe61d0de0f8b81a8dff8fdc3afd1fb2446fc3","roadmap":"Chebotarev","to_sha":"8339b5a9999c7fe7c83ad0ac2b89c5a2754fd8c8"}-->
# Status: Chebotarev

This file documents the status of the Chebotarev roadmap up until `8339b5a` (2026-09-28T06:14:44+00:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The general Dirichlet-density Chebotarev theorem and its main corollaries are proved. The fixed-field and auxiliary-prime foundations are substantial, while the prescribed character-series route is partial and the weighted prime-counting and natural-density theorems have not landed.

### Named results

- **The Chebotarev density theorem** — a Frobenius conjugacy class `C` in a finite Galois extension `L/K` has Dirichlet density `#C/#Gal(L/K)` ([`NumberField.Chebotarev.hasDirichletDensity_frobeniusPrimeSet`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/Chebotarev/Density/Chebotarev.html#NumberField.Chebotarev.hasDirichletDensity_frobeniusPrimeSet)).
- **Abelian Chebotarev** — each element of an abelian Galois group occurs as Frobenius with density the reciprocal of the group order ([`NumberField.Chebotarev.hasDirichletDensity_abelianFrobenius`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/Chebotarev/Density/Abelian.html#NumberField.Chebotarev.hasDirichletDensity_abelianFrobenius)).
- **The fixed-field Frobenius fibre count** — over an unramified prime in the class of `σ`, the corresponding relative fibre over `L^⟨σ⟩` has multiplicity `#G/(#C · orderOf σ)` ([`NumberField.Chebotarev.fixedField_frobenius_fiber_card`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/Chebotarev/FixedField/FiberCount.html#NumberField.Chebotarev.fixedField_frobenius_fiber_card)).
- **Dirichlet density for primes in arithmetic progressions** — for a unit class `a` modulo nonzero `m`, rational primes congruent to `a` have density `1/φ(m)` ([`NumberField.Chebotarev.hasDirichletDensity_primesCongruent`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/Chebotarev/Density/PrimesCongruent.html#NumberField.Chebotarev.hasDirichletDensity_primesCongruent)).
- **The auxiliary-prime theorem** — an auxiliary prime above any bound satisfies the needed congruence, unramifiedness, and cyclotomic irreducibility conditions ([`NumberField.exists_auxiliaryPrime`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/Chebotarev/AuxiliaryPrime.html#NumberField.exists_auxiliaryPrime)).

### Notable definitions and infrastructure

- **The Frobenius-prime set** ([`NumberField.Chebotarev.frobeniusPrimeSet`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/Chebotarev/FrobeniusPrimeSet.html#NumberField.Chebotarev.frobeniusPrimeSet)) — carries the unramified primes of a chosen Artin class and supports both density and counting statements.
- **The crossing constant** ([`TauCeti.NumberField.Chebotarev.crossingConstant`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/Chebotarev/Crossing/CrossingConstant.html#TauCeti.NumberField.Chebotarev.crossingConstant)) — records the proportion of all cyclotomic tags whose orders meet the divisibility condition.
- **The Frobenius von Mangoldt coefficient** ([`NumberField.Chebotarev.frobeniusVonMangoldtCoeff`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/Chebotarev/PrimeCounting/VonMangoldt.html#NumberField.Chebotarev.frobeniusVonMangoldtCoeff)) — assigns prime powers to the class of the powered Frobenius, as required for the later `ψ` argument.

### Roadmap coverage

Layers 1, 2, 7, 8, and 10 have their stated class, carrier, crossing-data, fixed-field, and general Dirichlet-density results. Layers 3–6 and 9 remain partial: prime-sum and ray-class machinery has grown, and the abelian density theorem exists, but the specified normalization, cyclotomic character-series continuation, named cyclotomic fibre theorem, and tagged density transfer are not all established. Layer 11 has its coefficient, summatory functions, powered orthogonality, and prime-power removal, but lacks the other discard estimates and logarithmic-derivative identity. Layers 12–14 have no roadmap-specific weighted asymptotic, prime-counting theorem, or natural-density theorem established here.

## The frontier

- **Density normalization** — prove the equivalence between ratio and logarithmic normalization of prime sums, including upper and lower bounds and finite-set deletion; the fibre sum partition is available.
- **Cyclotomic character series** — construct the named continuation, pole, and nonvanishing statements from ray-class cancellation and the cyclotomic Artin map.
- **Tagged density transfer** — establish the per-tag density over the base and the prescribed squeeze; the abelian theorem gives the qualitative conclusion, while the tagged crossing remains useful for the weighted route.
- **Discard estimates** — show that higher-residue-degree and finite exceptional primes contribute `o(x)`, then combine these with the existing prime-power removal.
- **Weighted Chebotarev** — prove the cyclotomic boundary package and exact residue-degree-one `ϑ` contraction before the general `ψ_C(x)/x` limit and its prime-counting and natural-density corollaries.
