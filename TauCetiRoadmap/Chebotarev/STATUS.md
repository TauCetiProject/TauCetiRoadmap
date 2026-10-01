<!--tauceti-status:v1 {"roadmap":"Chebotarev","to_sha":"8339b5a9999c7fe7c83ad0ac2b89c5a2754fd8c8","ts":"2026-09-28T06:14:44Z"}-->
# Status: Chebotarev

This file documents the status of the Chebotarev roadmap up until `8339b5a` (2026-09-28T06:14:44Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The density spine is finished: the Chebotarev density theorem holds in Dirichlet-density form over an arbitrary number field for an arbitrary conjugacy class, with the splitting, non-Galois and arithmetic-progression corollaries. The counting spine is partial: the Frobenius von Mangoldt coefficient, `ψ_C` and `ϑ_C` are in place, but no asymptotic for them or for `π_C` is established, and natural-density Chebotarev has not begun.

### Named results

- **The Chebotarev density theorem** — for a finite Galois extension `L / K` of number fields and a conjugacy class `C` of `Gal(L/K)`, the primes of `𝓞 K` with Frobenius class `C` have density `#C / #Gal(L/K)` ([`hasDirichletDensity_frobeniusPrimeSet`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/Chebotarev/Density/Chebotarev.html#NumberField.Chebotarev.hasDirichletDensity_frobeniusPrimeSet)).
- **Chebotarev for abelian extensions** — for abelian `Gal(L/K)` each automorphism has fibre density `1 / #Gal(L/K)`; the cyclic fixed field contracts this into the general theorem ([`hasDirichletDensity_abelianFrobenius`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/Chebotarev/Density/Abelian.html#NumberField.Chebotarev.hasDirichletDensity_abelianFrobenius)).
- **The cyclic fixed-field fibre count** — over an unramified prime with Artin class `C` represented by `σ`, the primes of `L^⟨σ⟩` of residue degree one whose relative Frobenius is `σ` number exactly `#G / (#C · orderOf σ)`, an exact ratio and not a truncated division ([`fixedField_frobenius_fiber_card`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/Chebotarev/FixedField/FiberCount.html#NumberField.Chebotarev.fixedField_frobenius_fiber_card)).
- **Dirichlet's theorem on primes in arithmetic progressions, in density form** — for `m ≠ 0` and `a` a unit modulo `m`, the rational primes congruent to `a` have Dirichlet density `1 / φ(m)` ([`hasDirichletDensity_primesCongruent`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/Chebotarev/Density/PrimesCongruent.html#NumberField.Chebotarev.hasDirichletDensity_primesCongruent)).
- **Splitting completely, including the non-Galois case** — the completely split primes of a finite Galois extension have density `1 / [L : K]` ([`hasDirichletDensity_frobeniusPrimeSet_one`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/Chebotarev/Density/SplitsCompletely.html#NumberField.Chebotarev.hasDirichletDensity_frobeniusPrimeSet_one)), and for an intermediate field the count comes through its Galois closure ([`hasDirichletDensity_setOf_ncard_primesOver_eq_finrank`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/Chebotarev/Density/SplitsCompletely.html#NumberField.Chebotarev.hasDirichletDensity_setOf_ncard_primesOver_eq_finrank)).

### Notable definitions and infrastructure

- **The Frobenius prime set** ([`frobeniusPrimeSet`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/Chebotarev/FrobeniusPrimeSet.html#NumberField.Chebotarev.frobeniusPrimeSet)) — the public carrier for every density and counting statement here, assigning no class at a ramified prime; its fibres partition the unramified primes and are each infinite.
- **The cyclotomic Artin map on a ray class group** ([`cyclotomicArtin`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/Chebotarev/GaloisCharacter/Cyclotomic/Basic.html#NumberField.Chebotarev.cyclotomicArtin)) — surjective, and carrying the ray class of a prime to its Frobenius, so a Galois character weight is a ray class character and the consumed ray-class cancellation applies.
- **The crossing constant** ([`crossingConstant`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/Chebotarev/Crossing/CrossingConstant.html#TauCeti.NumberField.Chebotarev.crossingConstant)) — the proportion of auxiliary-group elements of order divisible by `f`, with the uniform bound `(1 - 2^(-r))^(#f.primeFactors) / #G` that lets the level `r` push the crossing bound to `1 / #G`.

### Roadmap coverage

Layers 1 through 10 are done: the conjugacy-class power API and both Artin-symbol tower laws, the fibres and the finite ramified set, the fibre decomposition of the prime-ideal zeta sum with its one-sided density forms, the character weight with orthogonality for arbitrary Frobenius powers, the cyclotomic ray-class factorization and a nonvanishing criterion, and the crossing apparatus of Layers 7 to 9, including the tagged counts and the exceptional set of primes above `ramifiedPrimes K L`. The Layer 5 continuation object and the Layer 6 cyclotomic density theorem are not among the declarations visible here, although the abelian and general theorems resting on them are. Layer 11 is partial: the powered coefficient, `ψ_C`, `ϑ_C`, removal of prime powers beyond the first and the identification of higher-residue-degree primes exist; the other discard estimates and the logarithmic-derivative identity do not. Layers 12 and 13 have no theorem of their own, though the generic prime-counting and natural-density transfers they consume have landed in Arithmetic Dirichlet Series. Layer 14 has only the tower-exponent regression over `ℚ(ζ₇)` at `p = 3`.

## The frontier

- **The remaining discard estimates (11.3)** — bound the contribution of primes of residue degree above one and of any finite set, then package the sum as the single `o(x)` error every crossing cites. The higher-degree prime set is identified already.
- **The cyclotomic weighted theorem (12.2)** — build the regularized boundary function from the trivial-character pole and apply the consumed Tauberian theorem to the nonnegative `Λ_σ`, giving `ψ_σ(x)/x → 1 / #Gal(F/K)` and, by summation, `ψ_K(x) ~ x`. It needs the Layer 5 exports by name.
- **The exact residue-degree-one contraction (12.3)** — the weighted analogue of the fixed-field fibre count, with no error term. The multiplicity is in place; what remains is removing prime powers on both sides so the norms agree termwise.
- **`ϑ_C` and `π_C` (Layer 13)** — once `ψ_C(x)/x → #C/#G` holds these follow from consumed transfers; the generic prime-counting comparison and `Li` ratio lemma are now present.
- **Natural-density Chebotarev (Layer 14)** — `hasNaturalDensity_frobeniusPrimeSet` needs the prime ideal theorem for `K` as denominator, and that comes from 12.2, not an import. Dirichlet density does not imply it, so Layer 10 is no shortcut here.
