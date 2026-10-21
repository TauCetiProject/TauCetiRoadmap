<!--tauceti-status:v1 {"roadmap":"NumberFieldArithmetic","to_sha":"1d095894ac25298eb2a23398826c0f867b6d3164","ts":"2026-10-05T01:07:53Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 1","state":"done"},{"id":"Layer 2","state":"done"},{"id":"Layer 3","state":"done"},{"id":"Layer 4","state":"done"},{"id":"Layer 5","state":"done"},{"id":"Layer 6","state":"done"},{"id":"Layer 7","state":"done"},{"id":"Layer 8","state":"done"}],"readme_sha":"780a031c02c365a0e96a31ca71b6d7064f95cdfc99e41132f7328a3fad8fa0ed","roadmap":"NumberFieldArithmetic","to_sha":"1d095894ac25298eb2a23398826c0f867b6d3164"}-->
# Status: NumberFieldArithmetic

This file documents the status of the NumberFieldArithmetic roadmap up until `1d09589` (2026-10-05T01:07:53Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Every layer's milestones are proved, from the splitting dictionary to the worked invariant suite. The last open example, the dyadic filtration of `ℚ(i)`, has now landed. What remains lies at the boundaries the README itself draws: higher-rank units, rank-one quartic fields, and anything that belongs to class field theory or Chebotarev.

### Named results

- **Dedekind's theorem**: when `minpoly ℤ θ` is squarefree modulo `p`, the degrees of its irreducible factors modulo `p` are the cycle lengths of a Frobenius above `p` acting on the roots ([`factorizationType_eq_cycleType_isArithFrobAt`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/NumberField/Frobenius/CycleType.html#TauCeti.NumberField.factorizationType_eq_cycleType_isArithFrobAt)).
- **The semi-local decomposition**: `K_v ⊗[K] L` is the product of the completions `L_w` over the places above `v`, so the local degrees add up to `[L : K]` ([`semilocalEquiv`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/NumberField/LocalGlobal/Semilocal/Basic.html#TauCeti.semilocalEquiv)).
- **Hilbert's different formula**: for `L/K` Galois, the exponent of `w` in the different is `Σ_{i ≥ 0} (#G_i − 1)` over the global ramification groups ([`multiplicity_differentIdeal_eq_finsum_card_ramificationGroup_sub_one`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/NumberField/LocalGlobal/Different/Exponent.html#IsDedekindDomain.HeightOneSpectrum.multiplicity_differentIdeal_eq_finsum_card_ramificationGroup_sub_one)). In `ℚ(i)` at `2`, where `G_0 = G_1` is the whole group and `G_2 = 1`, it recovers the exponent `2` ([`mem_ramificationGroup_iff`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/NumberField/WorkedExamples/GaussianRationals/Ramification/Group.html#TauCeti.NumberField.GaussianRationals.mem_ramificationGroup_iff)).
- **The discriminant of a fixed field from double cosets**: the exponent of `𝔭` in the relative discriminant of `L^H` is a sum over `H \ G / D` of indices and ramification-group counts ([`multiplicity_relDiscr_fixedField_eq_sum`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/NumberField/Discriminant/FixedField.html#TauCeti.NumberField.multiplicity_relDiscr_fixedField_eq_sum)). It combines the double-coset law, whose primes have `e·f = |HσD|/|H|`, with the permutation-action formula.
- **Soundness of unit elimination**: in rank one, a unit that expands at a real place generates modulo torsion once every smaller candidate has been eliminated ([`UnitCandidateEliminationCertificate.sound`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/NumberField/Units/Elimination/Basic.html#TauCeti.NumberField.Units.UnitCandidateEliminationCertificate.sound)). This certifies the golden ratio for `ℚ(√5)` and `θ² − θ` for the `−23` cubic, together with their regulators ([`regulator_eq_log`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/NumberField/WorkedExamples/Cubic23/Units.html#TauCeti.NumberField.Cubic23.regulator_eq_log)).

### Notable definitions and infrastructure

- **The relative discriminant ideal** ([`relDiscr`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/RingTheory/DedekindDomain/Discriminant/Basic.html#TauCeti.relDiscr)): the relative norm of the different, divisible by exactly the ramified primes, and now computable prime by prime for any subfield of a Galois extension.
- **The ideal-theoretic Artin map** ([`artinHomAway`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/NumberField/Ideal/ArtinMap.html#TauCeti.NumberFieldArithmetic.artinHomAway)): for abelian `L/K`, the homomorphism on fractional ideals away from the ramified primes that sends each prime to its Frobenius. It is now determined by its values at primes ([`artinHomAway_eq_of_apply_prime`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/NumberField/Ideal/ArtinMap.html#TauCeti.NumberFieldArithmetic.artinHomAway_eq_of_apply_prime)), which is how class field theory will consume it.
- **The global ramification groups** ([`Ideal.ramificationGroup`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/RingTheory/Ideal/RamificationGroup.html#Ideal.ramificationGroup)): the inertia groups of the powers `Q^(i+1)`, matched with the lower-numbering groups of the completion. `G_0` is trivial exactly at unramified primes.

### Roadmap coverage

- **Layers 1 to 8: done.** Layer 1 now also has the decomposition-group form of the splitting criterion over a general base, and the invariant formulas and special cases of the double-coset law. Layer 2 has the cyclotomic Frobenius computation, `Frob ↦ p mod n`. Layer 6 has its `ℚ(i)` example and the discriminant exponent of a fixed field. Layer 7's subfield dictionary covers a field embedded in a normal closure. The page coverage map of 8.2 is an accounting table in the README with no formal statement attached.

## The frontier

- **Rank-one quartic fields**: the polynomial certificate needs prime degree, so a field such as `ℚ(ζ₈)` is outside it. The README excludes this case from scope. Extending the certificate is new work, not a missing milestone.
- **The class number of Dedekind's field**: the README deliberately claims no value. Claiming one would need a full Minkowski certificate with explicit generators for every prime below the bound.
- **Downstream consumers**: the Artin map, the relative discriminant and Dedekind's theorem are now stable inputs for the class field theory and Chebotarev roadmaps. The density of split primes belongs to Chebotarev, not here.
