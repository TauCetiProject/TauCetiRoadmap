<!--tauceti-status:v1 {"roadmap":"GlobalNumberFields","to_sha":"9f176e4010052205628245465aca32a983374f16","ts":"2026-09-26T15:54:11Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","remaining":"real and complex completion identifications and remaining functoriality","state":"partial"},{"id":"Layer 1","state":"done"},{"id":"Layer 2","state":"done"},{"id":"Layer 3","remaining":"trivial-modulus agreement with total ideal counting","state":"partial"},{"id":"Layer 4","remaining":"complete the placewise finite-adele API","state":"partial"},{"id":"Layer 5","remaining":"a standard rational adele fundamental domain","state":"partial"},{"id":"Layer 6","remaining":"class-group finiteness and Dirichlet agreement corollaries","state":"partial"},{"id":"Layer 7","remaining":"cofinality of ray subgroups and the identity-component description","state":"partial"},{"id":"Layer 8","remaining":"topological base change, extension norm maps, and tower compatibility","state":"partial"},{"id":"Layer 9","remaining":"finite-order factoring equivalence, local components, conductor, and Dirichlet dictionary","state":"partial"},{"id":"Layer 10","state":"untouched"},{"id":"Layer 11","remaining":"conductor, Picard groups, ideal class monoid, and functoriality","state":"partial"}],"readme_sha":"9758201ebb7766bd14822ca2e9ba8a03f0c902afa3272e4c0f5488354cb7590e","roadmap":"GlobalNumberFields","to_sha":"9f176e4010052205628245465aca32a983374f16"}-->
# Status: GlobalNumberFields

This file documents the status of the GlobalNumberFields roadmap up until `9f176e4` (2026-09-26T15:54:11Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Uniform ray-class ideal counting and its character cancellation are proved, as are the compactness theorems for the additive adele quotient and the norm-one idele class group. The place, counting, adelic, and Hecke-character layers still have specified gaps; infinity types and cyclotomic arithmetic have not begun.

### Named results

- **The product formula** — normalized absolute values over all finite and infinite places have product one ([`TauCeti.GlobalNumberFields.finprod_normalizedAbsValue_eq_one`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/NumberField/Global/Places/Basic.html#TauCeti.GlobalNumberFields.finprod_normalizedAbsValue_eq_one)).
- **The ray class ideal count** — every ray class has the same main coefficient and a uniform power-saving error; its coefficient includes the Euler factors at primes dividing the finite modulus ([`TauCeti.GlobalNumberFields.rayClassIdealCount`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/NumberField/Global/RayClass/Count/Asymptotic.html#TauCeti.GlobalNumberFields.rayClassIdealCount), [`TauCeti.GlobalNumberFields.rayClassIdealMainTerm_eq`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/NumberField/Global/RayClass/MainTerm.html#TauCeti.GlobalNumberFields.rayClassIdealMainTerm_eq)).
- **Ray class character cancellation** — the partial sums of a nontrivial character over integral ideals prime to the modulus have a power-saving bound ([`TauCeti.GlobalNumberFields.rayClassCharacter_partialSums`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/NumberField/Global/RayClass/Character/PartialSums.html#TauCeti.GlobalNumberFields.rayClassCharacter_partialSums)).
- **Compactness of the additive adele quotient** — the full adele ring modulo the diagonal number field is compact ([`TauCeti.GlobalNumberFields.compactSpace_quotient_principalSubgroup`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/NumberField/Global/Adeles/CompactQuotient.html#TauCeti.GlobalNumberFields.compactSpace_quotient_principalSubgroup)).
- **Compactness of the norm-one idele class group** — the subgroup of idele classes with norm one is compact ([`TauCeti.GlobalNumberFields.IdeleClassGroup.isCompact_normOne`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/NumberField/Global/Ideles/Norm/Compact.html#TauCeti.GlobalNumberFields.IdeleClassGroup.isCompact_normOne)).

### Notable definitions and infrastructure

- **The ray class group** puts coprimality in its ideal carrier and supports the intrinsic fractional-generator criterion, transition maps, and the class-number formula ([`TauCeti.GlobalNumberFields.RayClassGroup`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/NumberField/Global/RayClass/Basic.html#TauCeti.GlobalNumberFields.RayClassGroup)).
- **The ray class quotient of idele classes** is surjective with the ray subgroup as its kernel, giving the finite idelic description used by character pullback ([`TauCeti.GlobalNumberFields.rayClassQuotient`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/NumberField/Global/Ideles/Ray/ClassQuotient.html#TauCeti.GlobalNumberFields.rayClassQuotient)).
- **Number-field orders** now have a carrier spanning the ambient field, but the conductor and Picard groups remain to be built ([`TauCeti.GlobalNumberFields.NumberFieldOrder`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/NumberField/Global/Orders/Basic.html#TauCeti.GlobalNumberFields.NumberFieldOrder)).

### Roadmap coverage

Layers 1–2 are done: mixed-place weak approximation has its sign and valuation consequences, and the ray-class carriers have their exact sequence, class-number, and narrow-class comparisons. Layers 0 and 3 are partial: the product formula is proved, but the completion identifications remain open; the uniform count and cancellation are proved, but the stated trivial-modulus agreement with total ideal counting is absent. Layers 4–6 are partial despite the finite-idele class-group quotient, strong approximation, and both compactness results: the finite-adele placewise API, the rational fundamental domain, and the compactness agreement corollaries are not fully established here. Layers 7–9 are partial: the ray-class quotient and continuous adele extension maps exist, while cofinality of ray subgroups, topological base change and extension norms, and the finite-order character equivalence and conductor remain open. Layer 10 is untouched; Layer 11 has only its order carrier.

## The frontier

- **Ray-subgroup cofinality** — prove that every open subgroup of the idele class group contains a ray subgroup, then describe the identity component and its profinite quotient; the open ray subgroups and quotient map are already available.
- **Topological adele base change** — construct the continuous algebra equivalence with the module topology and its finite and infinite component comparisons; continuous extension maps are in place, but the norm maps and tower laws also remain.
- **Finite-order Hecke characters** — prove that open kernel and finite order are equivalent to factoring through a ray class group, then define the least ray conductor; only the forward open-kernel implication and character pullback are established.
- **Complete the counting agreement** — identify the trivial-modulus count with the classical total ideal count; the uniform ray-class asymptotic and trivial-modulus main coefficient are already proved.
- **Orders and Picard groups** — define the conductor, invertible proper fractional ideals, Picard groups, and the ideal class monoid; the order carrier is available, but none of these later constructions is recorded.
