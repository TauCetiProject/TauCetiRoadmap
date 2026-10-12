<!--tauceti-status:v1 {"roadmap":"Chebotarev","to_sha":"8334df225e9c15d22464fe5432d849ee6391c09a","ts":"2026-10-07T18:27:27Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 1","state":"done"},{"id":"Layer 2","state":"done"},{"id":"Layer 3","state":"done"},{"id":"Layer 4","state":"done"},{"id":"Layer 5","state":"done"},{"id":"Layer 6","state":"done"},{"id":"Layer 7","state":"done"},{"id":"Layer 8","state":"done"},{"id":"Layer 9","state":"done"},{"id":"Layer 10","state":"done"},{"id":"Layer 11","state":"done"},{"id":"Layer 12","state":"done"},{"id":"Layer 13","state":"done"},{"id":"Layer 14","state":"done"}],"readme_sha":"28488091d47ef77d2718b7cf6a3fe61d0de0f8b81a8dff8fdc3afd1fb2446fc3","roadmap":"Chebotarev","to_sha":"8334df225e9c15d22464fe5432d849ee6391c09a"}-->
# Status: Chebotarev

This file documents the status of the Chebotarev roadmap up until `8334df2` (2026-10-07T18:27:27Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The summit has been reached. The library proves the Chebotarev density theorem over an arbitrary number field in Dirichlet-density, natural-density and prime-counting form, with no `sorry` in the Chebotarev sources. The splitting, non-Galois and arithmetic-progression corollaries and the roadmap's acceptance tests are proved too. No milestone of the fourteen layers is known to be missing.

### Named results

- **The Chebotarev density theorem** — for a finite Galois extension `L / K` of number fields and a conjugacy class `C` of `Gal(L/K)`, the primes of `𝓞 K` with Frobenius class `C` have Dirichlet density `#C / #Gal(L/K)` ([`hasDirichletDensity_frobeniusPrimeSet`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/Chebotarev/Density/Chebotarev.html#NumberField.Chebotarev.hasDirichletDensity_frobeniusPrimeSet)).
- **Natural-density Chebotarev** — the same primes have natural density `#C / #Gal(L/K)`, measured against a prime ideal theorem for `K` that is derived along the way rather than imported ([`hasNaturalDensity_frobeniusPrimeSet`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/Chebotarev/PrimeCounting/FrobeniusPrimeCount.html#NumberField.Chebotarev.hasNaturalDensity_frobeniusPrimeSet)).
- **The Chebotarev prime number theorem** — `π_C(x)` is asymptotic to `(#C / #Gal(L/K)) Li(x)`, reached through `ψ_C(x) / x → #C / #Gal(L/K)` and then `ϑ_C`. The abelian case, `ψ_σ(x) = x / #Gal(L/K) + o(x)`, is the base of the crossing ([`frobeniusPsi_asymptotic_of_mul_comm`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/Chebotarev/PrimeCounting/Chebotarev.html#NumberField.Chebotarev.frobeniusPsi_asymptotic_of_mul_comm)).
- **The cyclic fixed-field fibre count** — over an unramified prime with Artin class `C` represented by `σ`, the primes of `L^⟨σ⟩` of residue degree one with relative Frobenius `σ` number exactly `#G / (#C · orderOf σ)` ([`fixedField_frobenius_fiber_card`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/Chebotarev/FixedField/FiberCount.html#NumberField.Chebotarev.fixedField_frobenius_fiber_card)). This count carries both the density contraction and the weighted contraction for `ϑ`.
- **Dirichlet's theorem on primes in arithmetic progressions** — for `m ≠ 0` and `a` a unit mod `m`, the primes `p ≡ a (mod m)` have Dirichlet density `1 / φ(m)` ([`hasDirichletDensity_primesCongruent`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/Chebotarev/Density/PrimesCongruent.html#NumberField.Chebotarev.hasDirichletDensity_primesCongruent)). Over `ℚ(ζₙ)` the Frobenius von Mangoldt coefficient is exactly `Λ` restricted to the progression ([`frobeniusVonMangoldtCoeff_galEquivZMod_symm`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/Chebotarev/PrimeCounting/ArithmeticProgression.html#NumberField.Chebotarev.frobeniusVonMangoldtCoeff_galEquivZMod_symm)).

### Notable definitions and infrastructure

- **The Frobenius prime set** ([`frobeniusPrimeSet`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/Chebotarev/FrobeniusPrimeSet.html#NumberField.Chebotarev.frobeniusPrimeSet)) — the common carrier for every density and counting statement. It assigns no class at a ramified prime.
- **The cyclotomic Artin map on a ray class group** ([`cyclotomicArtin`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/Chebotarev/GaloisCharacter/Cyclotomic/Basic.html#NumberField.Chebotarev.cyclotomicArtin)) — it turns a Galois character weight into a ray class character, so the consumed ray-class cancellation gives continuation and nonvanishing at `s = 1`.
- **The crossing constant** ([`crossingConstant`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/Chebotarev/Crossing/CrossingConstant.html#TauCeti.NumberField.Chebotarev.crossingConstant)) — the proportion of auxiliary-group elements whose order is divisible by `f`. Its uniform lower bound lets the congruence level push the crossing towards `1 / #G`, first for densities and then for `ψ`.

### Roadmap coverage

All fourteen layers are done. The density spine, Layers 1 to 10, covers the power API for conjugacy classes, the Frobenius fibres, prime sums, cyclotomic characters, continuation and nonvanishing, cyclotomic density, the auxiliary prime and compositum, the fixed-field fibre, and the abelian and general density theorems. The counting spine, Layers 11 to 14, covers the Frobenius von Mangoldt coefficient with `ψ_C` and `ϑ_C`, the `o(x)` discard and exact weighted contraction, the crossing asymptotics for `ψ_C`, then `ϑ_C`, `π_C`, natural density and the consistency theorems. The acceptance tests are discharged by named witnesses. The `ℚ(ζ₇) ⊃ ℚ(√-7) ⊃ ℚ` tower test now identifies the quadratic subfield explicitly through a Gaussian period ([`seventhCyclotomicQuadraticSubfield_eq_adjoin_sqrtNegSeven`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/NumberField/Cyclotomic/SeventhCyclotomic/Quadratic.html#TauCeti.NumberField.seventhCyclotomicQuadraticSubfield_eq_adjoin_sqrtNegSeven)). One spelling departs from the README: the character weight is `galoisCharacterWeight`, not `cyclotomicCharacterWeight`.

## The frontier

- **Nothing remains on the roadmap as written.** Every layer's milestones are proved in the source, so what is left is consolidation rather than new mathematics.
- **Interface names** — the README's public list names `cyclotomicCharacterWeight`, but the library uses `galoisCharacterWeight`. The README should be updated, or an alias added, to fix the name consumers will use.
- **Effective Chebotarev** — error terms, zero-free regions and the exceptional-zero contribution are out of scope here by design. They belong to the Zeros of L-functions roadmap, which consumes `frobeniusPsi`, `frobeniusTheta` and `frobeniusPrimeCount` from this one.
