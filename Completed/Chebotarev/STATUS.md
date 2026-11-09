<!--tauceti-status:v1 {"roadmap":"Chebotarev","to_sha":"69cd1ab4dcfbb6676e344f3f193e63473eab5a3d","ts":"2026-10-25T14:11:34Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 1","state":"done"},{"id":"Layer 2","state":"done"},{"id":"Layer 3","state":"done"},{"id":"Layer 4","state":"done"},{"id":"Layer 5","state":"done"},{"id":"Layer 6","state":"done"},{"id":"Layer 7","state":"done"},{"id":"Layer 8","state":"done"},{"id":"Layer 9","state":"done"},{"id":"Layer 10","state":"done"},{"id":"Layer 11","state":"done"},{"id":"Layer 12","state":"done"},{"id":"Layer 13","state":"done"},{"id":"Layer 14","state":"done"}],"readme_sha":"28488091d47ef77d2718b7cf6a3fe61d0de0f8b81a8dff8fdc3afd1fb2446fc3","roadmap":"Chebotarev","to_sha":"69cd1ab4dcfbb6676e344f3f193e63473eab5a3d"}-->
# Status: Chebotarev

This file documents the status of the Chebotarev roadmap up until `69cd1ab` (2026-10-25T14:11:34Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The summit has been reached. The library proves the Chebotarev density theorem over an arbitrary number field in three forms, Dirichlet density, natural density and prime counting, with no `sorry` in the Chebotarev sources. The splitting, non-Galois and arithmetic-progression corollaries are proved, and so are the roadmap's acceptance tests. Every milestone of the fourteen layers is proved.

### Named results

- **The Chebotarev density theorem** — for a finite Galois extension `L / K` of number fields and a conjugacy class `C` of `Gal(L/K)`, the primes of `𝓞 K` with Frobenius class `C` have Dirichlet density `#C / #Gal(L/K)` ([`hasDirichletDensity_frobeniusPrimeSet`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/Chebotarev/Density/Chebotarev.html#NumberField.Chebotarev.hasDirichletDensity_frobeniusPrimeSet)).
- **Natural-density Chebotarev** — the same primes have natural density `#C / #Gal(L/K)`, measured against a prime ideal theorem for `K` that the development derives itself rather than imports ([`hasNaturalDensity_frobeniusPrimeSet`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/Chebotarev/PrimeCounting/FrobeniusPrimeCount.html#NumberField.Chebotarev.hasNaturalDensity_frobeniusPrimeSet)).
- **The Chebotarev prime number theorem** — `π_C(x)` is asymptotic to `(#C / #Gal(L/K)) Li(x)`. The proof goes through `ψ_C(x) / x → #C / #Gal(L/K)` and then `ϑ_C`, starting from the abelian case `ψ_σ(x) = x / #Gal(L/K) + o(x)` ([`frobeniusPsi_asymptotic_of_mul_comm`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/Chebotarev/PrimeCounting/Chebotarev.html#NumberField.Chebotarev.frobeniusPsi_asymptotic_of_mul_comm)).
- **Chebotarev for splitting types** — for an intermediate field `E = L^H`, the primes of `K` whose residue degrees in `E` form the multiset `μ` have density equal to the proportion of `Gal(L/K)` acting on the cosets of `H` with cycle type `μ` ([`hasDirichletDensity_setOf_map_inertiaDeg_eq`](https://taucetiproject.org/docs/TauCeti/NumberTheory/Chebotarev/Density/SplittingType.html#NumberField.Chebotarev.hasDirichletDensity_setOf_map_inertiaDeg_eq)). This is the classical non-Galois form, and it contains the completely split case.
- **Dirichlet's theorem on primes in arithmetic progressions** — for `m ≠ 0` and `a` a unit mod `m`, the primes `p ≡ a (mod m)` have Dirichlet density `1 / φ(m)` ([`hasDirichletDensity_primesCongruent`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/Chebotarev/Density/PrimesCongruent.html#NumberField.Chebotarev.hasDirichletDensity_primesCongruent)).

### Notable definitions and infrastructure

- **The Frobenius prime set** ([`frobeniusPrimeSet`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/Chebotarev/FrobeniusPrimeSet.html#NumberField.Chebotarev.frobeniusPrimeSet)) — the common carrier for every density and counting statement. It assigns no class at a ramified prime, so a splitting condition becomes a disjoint union of its fibres away from a finite set.
- **The cyclic fixed-field fibre count** ([`fixedField_frobenius_fiber_card`](https://taucetiproject.org/docs/TauCeti/NumberTheory/Chebotarev/FixedField/FiberCount.html#NumberField.Chebotarev.fixedField_frobenius_fiber_card)) — over an unramified prime with Artin class `C` represented by `σ`, the primes of `L^⟨σ⟩` with relative Frobenius `σ` number exactly `#G / (#C · orderOf σ)`. This count drives both the density contraction and the weighted contraction for `ϑ`.
- **The crossing constant** ([`crossingConstant`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/Chebotarev/Crossing/CrossingConstant.html#TauCeti.NumberField.Chebotarev.crossingConstant)) — the proportion of auxiliary-group elements whose order is divisible by `f`. It approaches `1 / #G` as the congruence level grows ([`exists_forall_lt_crossingConstant`](https://taucetiproject.org/docs/TauCeti/NumberTheory/Chebotarev/Crossing/CrossingConstant.html#TauCeti.NumberField.Chebotarev.exists_forall_lt_crossingConstant)), which is what carries the crossing to the general case.

### Roadmap coverage

All fourteen layers are done. The density spine, Layers 1 to 10, runs from the power API for conjugacy classes and the Frobenius fibres, through prime sums, cyclotomic characters, continuation and nonvanishing and cyclotomic density, to the auxiliary prime, the fixed-field fibre, and the abelian and general density theorems. The counting spine, Layers 11 to 14, covers the Frobenius von Mangoldt coefficient with `ψ_C` and `ϑ_C`, the `o(x)` discard and the exact weighted contraction, the crossing asymptotics, `π_C`, natural density and the consistency theorems. The acceptance tests are discharged by named witnesses. Beyond the roadmap, the cyclotomic Artin map now has a conductor, computed over `ℚ` as `(m)·∞` for `m` not `2` mod `4` ([`cyclotomicConductor_rat`](https://taucetiproject.org/docs/TauCeti/NumberTheory/Chebotarev/GaloisCharacter/Cyclotomic/Conductor.html#NumberField.Chebotarev.cyclotomicConductor_rat)). One name departs from the README: the character weight is `galoisCharacterWeight`, not `cyclotomicCharacterWeight`.

## The frontier

- **Nothing remains on the roadmap as written.** Every layer's milestones are proved in the source, so what is left is consolidation rather than new mathematics.
- **Interface names** — the README's public list names `cyclotomicCharacterWeight`, but the library uses `galoisCharacterWeight`. The README should be updated, or an alias added, so that consumers know which name to use.
- **Splitting types in natural density** — the splitting-type and residue-degree corollaries are stated for Dirichlet density only. Their natural-density forms should follow from the natural-density theorem by the same finite union of Frobenius fibres.
- **Effective Chebotarev** — error terms, zero-free regions and the exceptional-zero contribution are out of scope by design. They belong to the Zeros of L-functions roadmap, which consumes `frobeniusPsi`, `frobeniusTheta` and `frobeniusPrimeCount` from this one.
