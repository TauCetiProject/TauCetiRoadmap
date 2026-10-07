<!--tauceti-status:v1 {"roadmap":"Chebotarev","to_sha":"835fbbdde8c00ea84da8b4376d2b3712de1b40fd","ts":"2026-09-30T22:19:33Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 1","state":"done"},{"id":"Layer 2","state":"done"},{"id":"Layer 3","state":"done"},{"id":"Layer 4","state":"done"},{"id":"Layer 5","state":"done"},{"id":"Layer 6","state":"done"},{"id":"Layer 7","state":"done"},{"id":"Layer 8","state":"done"},{"id":"Layer 9","state":"done"},{"id":"Layer 10","state":"done"},{"id":"Layer 11","state":"done"},{"id":"Layer 12","state":"done"},{"id":"Layer 13","state":"done"},{"id":"Layer 14","state":"done"}],"readme_sha":"28488091d47ef77d2718b7cf6a3fe61d0de0f8b81a8dff8fdc3afd1fb2446fc3","roadmap":"Chebotarev","to_sha":"835fbbdde8c00ea84da8b4376d2b3712de1b40fd"}-->
# Status: Chebotarev

This file documents the status of the Chebotarev roadmap up until `835fbbd` (2026-09-30T22:19:33Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The summit has been reached. The library's source proves the Chebotarev density theorem over an arbitrary number field in Dirichlet-density form, natural-density form and prime-counting form, all without a `sorry`, together with the splitting, non-Galois and arithmetic-progression corollaries and the roadmap's acceptance tests. No milestone of the fourteen layers is known to be missing.

### Named results

- **The Chebotarev density theorem** — for a finite Galois extension `L / K` of number fields and a conjugacy class `C` of `Gal(L/K)`, the primes of `𝓞 K` with Frobenius class `C` have Dirichlet density `#C / #Gal(L/K)` ([`hasDirichletDensity_frobeniusPrimeSet`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/Chebotarev/Density/Chebotarev.html#NumberField.Chebotarev.hasDirichletDensity_frobeniusPrimeSet)).
- **Natural-density Chebotarev** — the same primes have natural density `#C / #Gal(L/K)`, measured against the prime ideal theorem for `K`, which is itself derived along the way rather than imported (`hasNaturalDensity_frobeniusPrimeSet`).
- **The Chebotarev prime number theorem** — `π_C(x)` is asymptotic to `(#C / #Gal(L/K)) Li(x)`, by way of `ψ_C(x) / x → #C / #Gal(L/K)` and then `ϑ_C` (`frobeniusPrimeCount_isEquivalent_logIntegral`, `tendsto_frobeniusPsi`).
- **The cyclic fixed-field fibre count** — over an unramified prime with Artin class `C` represented by `σ`, the primes of `L^⟨σ⟩` of residue degree one with relative Frobenius `σ` number exactly `#G / (#C · orderOf σ)` ([`fixedField_frobenius_fiber_card`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/Chebotarev/FixedField/FiberCount.html#NumberField.Chebotarev.fixedField_frobenius_fiber_card)). It carries both the density contraction and the exact weighted contraction for `ϑ`.
- **Dirichlet's theorem on primes in arithmetic progressions** — for `m ≠ 0` and `a` a unit mod `m`, the primes `p ≡ a (mod m)` have Dirichlet density `1 / φ(m)` ([`hasDirichletDensity_primesCongruent`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/Chebotarev/Density/PrimesCongruent.html#NumberField.Chebotarev.hasDirichletDensity_primesCongruent)). A natural-density version exists too, and over `ℚ(ζₙ)` the Frobenius von Mangoldt coefficient is exactly `Λ` on the progression ([`frobeniusVonMangoldtCoeff_galEquivZMod_symm`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/Chebotarev/PrimeCounting/ArithmeticProgression.html#NumberField.Chebotarev.frobeniusVonMangoldtCoeff_galEquivZMod_symm)).

### Notable definitions and infrastructure

- **The Frobenius prime set** ([`frobeniusPrimeSet`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/Chebotarev/FrobeniusPrimeSet.html#NumberField.Chebotarev.frobeniusPrimeSet)) — the public carrier for every density and counting statement, assigning no class at a ramified prime.
- **The cyclotomic Artin map on a ray class group** ([`cyclotomicArtin`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/Chebotarev/GaloisCharacter/Cyclotomic/Basic.html#NumberField.Chebotarev.cyclotomicArtin)) — it turns a Galois character weight into a ray class character, so the consumed ray-class cancellation gives continuation and nonvanishing at `s = 1`.
- **The crossing constant** ([`crossingConstant`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/Chebotarev/Crossing/CrossingConstant.html#TauCeti.NumberField.Chebotarev.crossingConstant)) — the proportion of auxiliary-group elements of order divisible by `f`. Its uniform lower bound lets the congruence level push the crossing towards `1 / #G`, first for densities and then for `ψ`.

### Roadmap coverage

All fourteen layers are done. Layers 1 to 10, the density spine, were complete already. They comprise the power API for conjugacy classes, the Frobenius fibres, prime sums, cyclotomic characters, continuation and nonvanishing, cyclotomic density, the auxiliary prime and compositum, the fixed-field fibre, and the abelian and general density theorems. The counting spine of Layers 11 to 14 is now present in the source as well. It has the Frobenius von Mangoldt coefficient with `ψ_C` and `ϑ_C`, the packaged `o(x)` discard estimate, and the exact residue-degree-one contraction for `ϑ`. Beyond that come the cyclotomic and weighted crossing asymptotics for `ψ_C`, then `ϑ_C` and `π_C`, natural density, and the consistency theorems (ramified-set deletion, Dirichlet versus natural density, the identity class, `ℚ(ζ₅)`). The acceptance tests are discharged by named witnesses, among them the `S₃` failure of column orthogonality, the `ℚ(√5)` degree witness, the `X³ - 2` exceptional prime and the `C₄` constant. One spelling departs from the README: the character weight is `galoisCharacterWeight`, not `cyclotomicCharacterWeight`.

## The frontier

- **Nothing remains on the roadmap as written.** Every layer's milestones are proved in the source. What remains is consolidation, not mathematics.
- **Interface names** — the README's public list names `cyclotomicCharacterWeight`, while the library uses `galoisCharacterWeight`. Either the README or an alias should settle the name consumers will use.
- **Effective Chebotarev** — error terms, zero-free regions and the exceptional-zero contribution are out of scope here by design. They belong to the Zeros of L-functions roadmap, which consumes `frobeniusPsi`, `frobeniusTheta` and `frobeniusPrimeCount` from this one.
