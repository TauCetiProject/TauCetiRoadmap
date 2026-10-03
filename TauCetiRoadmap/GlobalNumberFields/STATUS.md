<!--tauceti-status:v1 {"roadmap":"GlobalNumberFields","to_sha":"0d3161a2e5e92314bf045690e177580179a2f8d9","ts":"2026-09-30T18:26:01Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","remaining":"functoriality of normalized absolute values under finite extensions","state":"partial"},{"id":"Layer 1","state":"done"},{"id":"Layer 2","state":"done"},{"id":"Layer 3","state":"done"},{"id":"Layer 4","remaining":"complete the placewise finite-adele API","state":"partial"},{"id":"Layer 5","remaining":"a standard rational adele fundamental domain","state":"partial"},{"id":"Layer 6","remaining":"class-group finiteness and Dirichlet unit theorem agreement corollaries","state":"partial"},{"id":"Layer 7","remaining":"the identity component and profiniteness of its quotient","state":"partial"},{"id":"Layer 8","remaining":"topological base change, extension norm maps, and tower compatibility","state":"partial"},{"id":"Layer 9","remaining":"finite local components, finite and ray conductors, and the Dirichlet dictionary over Q","state":"partial"},{"id":"Layer 10","remaining":"algebraic Hecke characters, the norm-character separation, and cyclotomic arithmetic","state":"partial"},{"id":"Layer 11","remaining":"Picard functoriality, ideal class monoid, Gorenstein criterion, conductor descriptions, and extension-contraction","state":"partial"}],"readme_sha":"9758201ebb7766bd14822ca2e9ba8a03f0c902afa3272e4c0f5488354cb7590e","roadmap":"GlobalNumberFields","to_sha":"0d3161a2e5e92314bf045690e177580179a2f8d9"}-->
# Status: GlobalNumberFields

This file documents the status of the GlobalNumberFields roadmap up until `0d3161a` (2026-09-30T18:26:01Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Weak approximation, the ray-class carriers, and uniform ray-class ideal counting are complete. Adeles, ideles, Hecke characters, infinity types, and orders all have substantial partial developments, each with named gaps. Cyclotomic arithmetic has not begun.

### Named results

- **The product formula** — normalized absolute values over all finite and infinite places have product one ([`TauCeti.GlobalNumberFields.finprod_normalizedAbsValue_eq_one`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/NumberField/Global/Places/Basic.html#TauCeti.GlobalNumberFields.finprod_normalizedAbsValue_eq_one)).
- **The ray class ideal count** — every ray class has the same main coefficient, including the Euler factors at primes dividing the modulus, and a uniform power-saving error ([`TauCeti.GlobalNumberFields.rayClassIdealCount`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/NumberField/Global/RayClass/Count/Asymptotic.html#TauCeti.GlobalNumberFields.rayClassIdealCount)).
- **Compactness of the norm-one idele class group** — the idele classes of norm one form a compact subgroup ([`TauCeti.GlobalNumberFields.IdeleClassGroup.isCompact_normOne`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/NumberField/Global/Ideles/Norm/Compact.html#TauCeti.GlobalNumberFields.IdeleClassGroup.isCompact_normOne)).
- **Finite-order Hecke characters are ray class characters** — a Hecke character has finite order exactly when it factors through some ray class group, which relies on every open subgroup of the idele class group containing a ray subgroup ([`TauCeti.GlobalNumberFields.HeckeCharacter.isFiniteOrder_iff_exists_rayClassCharacter`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/NumberField/Global/HeckeCharacter/FiniteOrder.html#TauCeti.GlobalNumberFields.HeckeCharacter.isFiniteOrder_iff_exists_rayClassCharacter)).
- **Classification of archimedean characters** — every continuous character of `ℂˣ` is `z ↦ |z|^s (z/|z|)^k` for unique `s : ℂ` and `k : ℤ` ([`TauCeti.complexUnitsCharacterEquiv`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/SpecialFunctions/Complex/ArchimedeanCharacter.html#TauCeti.complexUnitsCharacterEquiv)). The real case, `|x|^s sgn(x)^ε`, is the companion [`TauCeti.realUnitsCharacterEquiv`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/Analysis/SpecialFunctions/Complex/ArchimedeanCharacter.html#TauCeti.realUnitsCharacterEquiv).

### Notable definitions and infrastructure

- **The ray class quotient of idele classes** is surjective with the ray subgroup as its kernel. It is the bridge along which ray class characters become Hecke characters ([`TauCeti.GlobalNumberFields.rayClassQuotient`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/NumberField/Global/Ideles/Ray/ClassQuotient.html#TauCeti.GlobalNumberFields.rayClassQuotient)).
- **Continuous infinity types** record the archimedean parameters of any Hecke character. Algebraic and finite-order types embed into them injectively, so statements can say which of the three carriers they concern ([`TauCeti.GlobalNumberFields.ContinuousInfinityType`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/NumberField/Global/InfinityType/Basic.html#TauCeti.GlobalNumberFields.ContinuousInfinityType)).
- **The narrow Picard group of an order** is invertible fractional ideals modulo those with a totally positive generator. It maps onto the wide Picard group, with kernel the principal narrow classes ([`TauCeti.GlobalNumberFields.NarrowPic`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/NumberField/Global/Orders/NarrowPic.html#TauCeti.GlobalNumberFields.NarrowPic)).

### Roadmap coverage

Layers 1–3 are done. Layer 3 now includes the agreement of the trivial-modulus count with the total ideal count.

Layer 0 is partial. The product formula is proved, and the real and complex completions are identified with `ℝ` and `ℂ`, but functoriality under finite extensions is not established here.

Layers 4–6 are partial. Strong approximation and both compactness theorems are proved, but three things are not recorded: the placewise finite-adele API, a standard fundamental domain over `ℚ`, and the class-group and unit-theorem agreement corollaries.

Layer 7 is partial. Ray subgroups are now cofinal among open subgroups, but the identity component and its profinite quotient are not described.

Layer 8 is partial. There are continuous extension maps, but no topological base change or norm maps.

Layer 9 is partial. It has the finite-order equivalence, the shift and unitary part, primitivity, and components at infinite places. It lacks finite local components, conductors, and the Dirichlet dictionary over `ℚ`.

Layer 10 is partial. The archimedean classification, the three carriers, and identity-component algebraicity of infinity types are in place. Algebraic Hecke characters and cyclotomic arithmetic are absent.

Layer 11 is partial. It has the conductor, proper ideals, the wide and narrow Picard groups, and order morphisms, but the later constructions listed under the frontier below are missing.

## The frontier

- **Algebraic Hecke characters** — define `HeckeCharacter.IsAlgebraic` through the existing identity-component predicate. Then prove that finite-order characters are algebraic and that the norm character with nonzero exponent is not. Its failure to have finite order is already proved.
- **Conductors of Hecke characters** — define finite local components, the finite conductor ideal, and the least ray conductor. The finite-order factoring theorem supplies the modulus to minimize.
- **Functoriality of Picard groups** — build `mapPic` and `mapNarrowPic` along order morphisms and prove the naturality square. The total-positivity lemma these maps need is already proved. The ideal class monoid, the Gorenstein criterion, and the conductor's index and discriminant descriptions also remain.
- **The identity component of the idele class group** — describe `D_K`, show it lies in every ray subgroup, and prove `C_K/D_K` profinite. Cofinality and the archimedean part of open subgroups are in place.
- **Topological adele base change** — the continuous algebra equivalence under the module topology, its component and tower compatibilities, and the extension norm maps.
