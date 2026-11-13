<!--tauceti-status:v1 {"roadmap":"GlobalNumberFields","to_sha":"d92acc5c0393646e14960dfd4972fc836aad3ebe","ts":"2026-11-09T11:59:37+11:00"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","state":"done"},{"id":"Layer 1","state":"done"},{"id":"Layer 2","state":"done"},{"id":"Layer 3","state":"done"},{"id":"Layer 4","state":"done"},{"id":"Layer 5","state":"done"},{"id":"Layer 6","state":"done"},{"id":"Layer 7","state":"done"},{"id":"Layer 8","state":"done"},{"id":"Layer 9","state":"done"},{"id":"Layer 10","state":"done"},{"id":"Layer 11","state":"done"}],"readme_sha":"d8e027e5e7e59b647dbaabdd59bcf2604ea9efe158508daa51e0d5e0d55c8a1b","roadmap":"GlobalNumberFields","to_sha":"d92acc5c0393646e14960dfd4972fc836aad3ebe"}-->
# Status: GlobalNumberFields

This file documents the status of the GlobalNumberFields roadmap up until `d92acc5` (2026-11-09T11:59:37+11:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** All twelve layers are done, and the roadmap is complete. Recent work refines finished layers rather than closing gaps: the README's warning that a ray class group need not split as a product is now a theorem, and finite adeles have a principal-parts decomposition.

### Named results

- **The ray class ideal count** — every ray class has the same main coefficient, including the Euler factors at primes dividing the modulus, and a uniform power-saving error ([`TauCeti.GlobalNumberFields.rayClassIdealCount`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/NumberField/Global/RayClass/Count/Asymptotic.html#TauCeti.GlobalNumberFields.rayClassIdealCount)).
- **Finite-order Hecke characters are ray class characters** — a Hecke character has finite order exactly when it factors through some ray class group ([`TauCeti.GlobalNumberFields.HeckeCharacter.isFiniteOrder_iff_exists_rayClassCharacter`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/NumberField/Global/HeckeCharacter/FiniteOrder.html#TauCeti.GlobalNumberFields.HeckeCharacter.isFiniteOrder_iff_exists_rayClassCharacter)).
- **The cyclotomic ray class group is the Galois group** — the ray class group of `ℚ` modulo `(n)·∞` is `Gal(ℚ(ζ_n)/ℚ)`, with the class of a prime not dividing `n` its arithmetic Frobenius ([`TauCeti.GlobalNumberFields.ratModulusEquivGal`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/NumberField/Global/Cyclotomic/RayClass.html#TauCeti.GlobalNumberFields.ratModulusEquivGal)). Without the real place the group is `(ℤ/n)ˣ/{±1}` ([`TauCeti.GlobalNumberFields.ratFiniteModulusEquivZMod`](https://taucetiproject.org/docs/TauCeti/NumberTheory/NumberField/Global/RayClass/Rat.html#TauCeti.GlobalNumberFields.ratFiniteModulusEquivZMod)).
- **When the ray class group is a product** — the ray class number equals the class number times the residue units times the sign patterns exactly when every integer unit is congruent to one modulo the modulus, and otherwise no group isomorphism with that product exists ([`TauCeti.GlobalNumberFields.card_rayClassGroup_eq_iff`](https://taucetiproject.org/docs/TauCeti/NumberTheory/NumberField/Global/RayClass/ClassNumber.html#TauCeti.GlobalNumberFields.card_rayClassGroup_eq_iff)).
- **Picard groups of orders are ray class quotients** — `Pic O` is a quotient of the ray class group of the conductor, and `NarrowPic O` of the same group with every real place added, so both are finite ([`TauCeti.GlobalNumberFields.NumberFieldOrder.mem_ker_rayClassToPic`](https://taucetiproject.org/docs/TauCeti/NumberTheory/NumberField/Global/Orders/RayClass.html#TauCeti.GlobalNumberFields.NumberFieldOrder.mem_ker_rayClassToPic)).

### Notable definitions and infrastructure

- **`S`-integral finite adeles** `∏_{v∈S} K_v × ∏_{v∉S} 𝒪_v` exhaust the finite adeles and are the closure of the `S`-integers, which turns the restricted-product condition into something proofs can use ([`IsDedekindDomain.FiniteAdeleRing.sIntegralAdeles`](https://taucetiproject.org/docs/TauCeti/RingTheory/DedekindDomain/FiniteAdeleRing/Basic.html#IsDedekindDomain.FiniteAdeleRing.sIntegralAdeles)).
- **Principal parts** of a finite adele identify `𝔸ᶠ/∏_v 𝒪_v` and `K/R` with `⨁_v K_v/𝒪_v`, a partial-fractions decomposition that localises additive questions place by place ([`IsDedekindDomain.FiniteAdeleRing.principalParts`](https://taucetiproject.org/docs/TauCeti/RingTheory/DedekindDomain/FiniteAdeleRing/PrincipalParts.html#IsDedekindDomain.FiniteAdeleRing.principalParts)).
- **The splitting `C_K ≃ C_K¹ × ℝ>0`** is an isomorphism of topological groups once an infinite place is chosen, reducing questions about the idele class group to its compact norm-one part ([`TauCeti.GlobalNumberFields.normOneProdEquiv`](https://taucetiproject.org/docs/TauCeti/NumberTheory/NumberField/Global/Ideles/Norm/Splitting.html#TauCeti.GlobalNumberFields.normOneProdEquiv)).

### Roadmap coverage

Layers 0–11 are all done. Layers 0–3 cover places and the product formula, weak approximation, moduli and ray class groups with transitions, the exact sequence and the class-number formula, and the uniform ray-class count. Layers 4–8 cover finite and full adeles, compactness of `𝔸_K/K`, ideles and the compact norm-one class group, the ray-class dictionary for open congruence subgroups, and topological base change in extensions. Layers 9–11 cover Hecke and ray class characters with conductors, infinity types and the cyclotomic case, and orders with Picard and narrow Picard groups. The class-number and unit-theorem corollaries of Layer 6 remain agreement results, not independent proofs.

## The frontier

- **Hand-off to consumers** — every layer's contracts are in place; Class Field Theory, L-functions and Chebotarev can build on the ray-class count, the Hecke-character dictionary and the congruence descriptions of `Pic O` and `NarrowPic O` without further additions here.
- **Independent idelic finiteness** — finiteness of the class group and Dirichlet's unit theorem are recovered from compactness of `C_K¹` only as agreement corollaries, since compactness was proved using them. A proof of compactness that avoids them would be new work beyond the roadmap as stated.
