<!--tauceti-status:v1 {"roadmap":"NumberFieldArithmetic","to_sha":"273ea28e12515bd7f9e5c2aefd933352264b83e1","ts":"2026-10-21T07:26:02Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 1","state":"done"},{"id":"Layer 2","state":"done"},{"id":"Layer 3","state":"done"},{"id":"Layer 4","state":"done"},{"id":"Layer 5","state":"done"},{"id":"Layer 6","state":"done"},{"id":"Layer 7","state":"done"},{"id":"Layer 8","state":"done"}],"readme_sha":"7e1a4c7d55b53e2d7ebb1091bfc1ec07f8e5a59ab65f1c213ca58377056b5be5","roadmap":"NumberFieldArithmetic","to_sha":"273ea28e12515bd7f9e5c2aefd933352264b83e1"}-->
# Status: NumberFieldArithmetic

This file documents the status of the NumberFieldArithmetic roadmap up until `273ea28` (2026-10-21T07:26:02Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Every layer's milestones are proved, from the splitting dictionary to the worked invariant suite. Recent work has generalised the splitting dictionary to arbitrary Dedekind and integrally closed bases. What remains lies at the boundaries the README itself draws: higher-rank units, rank-one quartic fields, and anything that belongs to class field theory or Chebotarev.

### Named results

- **Dedekind's theorem** — when `minpoly ℤ θ` is squarefree modulo `p`, the degrees of its irreducible factors modulo `p` are the cycle lengths of a Frobenius above `p` acting on the roots ([`factorizationType_eq_cycleType_isArithFrobAt`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/NumberField/Frobenius/CycleType.html#TauCeti.NumberField.factorizationType_eq_cycleType_isArithFrobAt)).
- **The semi-local decomposition** — `K_v ⊗[K] L` is the product of the completions `L_w` over the places above `v`, so the local degrees add up to `[L : K]` ([`semilocalEquiv`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/NumberField/LocalGlobal/Semilocal/Basic.html#TauCeti.semilocalEquiv)).
- **Hilbert's different formula** — for `L/K` Galois, the exponent of `w` in the different is `Σ_{i ≥ 0} (#G_i − 1)` over the global ramification groups ([`multiplicity_differentIdeal_eq_finsum_card_ramificationGroup_sub_one`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/NumberField/LocalGlobal/Different/Exponent.html#IsDedekindDomain.HeightOneSpectrum.multiplicity_differentIdeal_eq_finsum_card_ramificationGroup_sub_one)).
- **The discriminant of a fixed field from double cosets** — the exponent of `𝔭` in the relative discriminant of `L^H` is a sum, over `H \ G / D`, of indices and ramification-group counts ([`multiplicity_relDiscr_fixedField_eq_sum`](https://taucetiproject.org/docs/TauCeti/NumberTheory/NumberField/Discriminant/FixedField.html#TauCeti.NumberField.multiplicity_relDiscr_fixedField_eq_sum)).
- **Soundness of unit elimination** — in rank one, a unit that expands at a real place generates the units modulo torsion once every smaller candidate has been eliminated ([`UnitCandidateEliminationCertificate.sound`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/NumberField/Units/Elimination/Basic.html#TauCeti.NumberField.Units.UnitCandidateEliminationCertificate.sound)). This certifies the golden ratio as the fundamental unit of `ℚ(√5)`, and `θ² − θ` for the `−23` cubic, whose 98 candidates are now shown to be exactly the general candidate list.

### Notable definitions and infrastructure

- **The double-coset law over a general base** ([`doubleCosetQuotientEquivPrimesOverOfIsIntegralClosure`](https://taucetiproject.org/docs/TauCeti/NumberTheory/RamificationInertia/DoubleCoset/IntegralClosure.html#Ideal.doubleCosetQuotientEquivPrimesOverOfIsIntegralClosure)): this indexes the primes of a non-Galois subextension by `H \ G / D` over any integrally closed base, with the fundamental identity and the `e·f` index formulas attached. The compositum and Galois-closure splitting criteria over a Dedekind base rest on it.
- **The relative discriminant ideal** ([`relDiscr`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/RingTheory/DedekindDomain/Discriminant/Basic.html#TauCeti.relDiscr)): the relative norm of the different. It is divisible by exactly the ramified primes, and it can be computed prime by prime for any subfield of a Galois extension.
- **The ideal-theoretic Artin map** ([`artinHomAway`](https://taucetiproject.org/docs/TauCeti/NumberTheory/NumberField/Ideal/ArtinMap.html#TauCeti.NumberFieldArithmetic.artinHomAway)): for abelian `L/K`, this homomorphism on the fractional ideals away from the ramified primes sends each prime to its Frobenius. It is determined by its values at primes, which is how class field theory will consume it.

### Roadmap coverage

**Layers 1 to 8 are done.** Layer 1 now holds over a general base as well. The double-coset law, its invariant formulas, and the compositum and Galois-closure statements of 1.5 are proved over Dedekind or integrally closed bases, not only for number fields. Layer 3 includes the polynomial-side corollary for arbitrary monic `f` that the Galois-groups roadmap consumes. The page coverage map of 8.2 is an accounting table in the README, with no formal statement attached.

## The frontier

- **Rank-one quartic fields**: the polynomial certificate needs prime degree, so a field such as `ℚ(ζ₈)` is outside it. The README excludes this case from scope, so extending the certificate is new work, not a missing milestone.
- **The class number of Dedekind's field**: the README deliberately claims no value. Claiming one would need a full Minkowski certificate with explicit generators for every prime below the bound.
- **The converse of the common-index-divisor obstruction**: Hensel's criterion, which says that the common index divisors are exactly the primes whose splitting type is not realisable modulo `p`, is excluded by the README and cited only.
- **Downstream consumers**: the Artin map, the relative discriminant and Dedekind's theorem are stable inputs for the class field theory and Chebotarev roadmaps. The density of split primes belongs to Chebotarev, not here.
