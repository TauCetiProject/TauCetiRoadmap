<!--tauceti-status:v1 {"roadmap":"NumberFieldArithmetic","to_sha":"e440f4eb3fccf5479ede3f5d6a671b4be37c9dde","ts":"2026-09-30T05:46:25Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 1","state":"done"},{"id":"Layer 2","state":"done"},{"id":"Layer 3","state":"done"},{"id":"Layer 4","state":"done"},{"id":"Layer 5","state":"done"},{"id":"Layer 6","state":"done"},{"id":"Layer 7","state":"done"},{"id":"Layer 8","state":"done"}],"readme_sha":"780a031c02c365a0e96a31ca71b6d7064f95cdfc99e41132f7328a3fad8fa0ed","roadmap":"NumberFieldArithmetic","to_sha":"e440f4eb3fccf5479ede3f5d6a671b4be37c9dde"}-->
# Status: NumberFieldArithmetic

This file documents the status of the NumberFieldArithmetic roadmap up until `e440f4e` (2026-09-30T05:46:25Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Every layer's milestones are now proved. The last to close were Hilbert's different formula and the wild bound of Layer 6, the unit certificate of Layer 7.4, and the five worked fields of Layer 8. What is left is one illustrative example and the boundaries that the README itself draws.

### Named results

- **Dedekind's theorem**: when `minpoly ℤ θ` is squarefree modulo `p`, the degrees of its irreducible factors modulo `p` are the cycle lengths of a Frobenius above `p` acting on the roots ([`factorizationType_eq_cycleType_isArithFrobAt`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/NumberField/Frobenius/CycleType.html#TauCeti.NumberField.factorizationType_eq_cycleType_isArithFrobAt)).
- **The semi-local decomposition**: `K_v ⊗[K] L` is the product of the completions `L_w` over the places above `v`, so the local degrees add up to `[L : K]` ([`semilocalEquiv`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/NumberField/LocalGlobal/Semilocal/Basic.html#TauCeti.semilocalEquiv)).
- **Hilbert's different formula**: for `L/K` Galois, the exponent of `w` in the different is `Σ_{i ≥ 0} (#G_i − 1)` over the global ramification groups ([`multiplicity_differentIdeal_eq_finsum_card_ramificationGroup_sub_one`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/NumberField/LocalGlobal/Different/Exponent.html#IsDedekindDomain.HeightOneSpectrum.multiplicity_differentIdeal_eq_finsum_card_ramificationGroup_sub_one)). The permutation-action formula for fixed fields is derived from it.
- **The wild different bound**: `v_P(𝔡) ≤ e − 1 + v_P(e)` ([`multiplicity_differentIdeal_le_ramificationIdx_sub_one_add_multiplicity_span`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/NumberField/LocalGlobal/Different/Wild.html#IsDedekindDomain.HeightOneSpectrum.multiplicity_differentIdeal_le_ramificationIdx_sub_one_add_multiplicity_span)). Together with the tame criterion, it is sharp at both ends: `ℚ(√2)` attains it at `2` ([`multiplicity_differentIdeal_eq_ramificationIdx_sub_one_add`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/NumberField/WorkedExamples/Sqrt2/Ramification.html#TauCeti.NumberField.Sqrt2.multiplicity_differentIdeal_eq_ramificationIdx_sub_one_add)), and `ℚ(i)` attains the lower bound `e`.
- **Soundness of unit elimination**: in rank one, a unit that expands at a real place generates modulo torsion once every smaller candidate has been eliminated ([`UnitCandidateEliminationCertificate.sound`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/NumberField/Units/Elimination/Basic.html#TauCeti.NumberField.Units.UnitCandidateEliminationCertificate.sound)). This gives the golden ratio as a fundamental unit of `ℚ(√5)` and `θ² − θ` as one for the `−23` cubic, and with them exact regulators ([`regulator_eq_log`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/NumberField/WorkedExamples/Cubic23/Units.html#TauCeti.NumberField.Cubic23.regulator_eq_log)).

### Notable definitions and infrastructure

- **The relative discriminant ideal** ([`relDiscr`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/RingTheory/DedekindDomain/Discriminant/Basic.html#TauCeti.relDiscr)): the relative norm of the different, divisible by exactly the ramified primes. Its support is the natural excluded set for the Artin map.
- **The ideal-theoretic Artin map** ([`artinHomAway`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/NumberField/Ideal/ArtinMap.html#TauCeti.NumberFieldArithmetic.artinHomAway)): for abelian `L/K`, the homomorphism on fractional ideals away from the ramified primes that sends each prime to its Frobenius. Class field theory consumes it by name.
- **The global ramification groups** ([`Ideal.ramificationGroup`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/RingTheory/Ideal/RamificationGroup.html#Ideal.ramificationGroup)): the inertia groups of the powers `Q^(i+1)`, matched with the lower-numbering groups of the completion. Every local different formula is read globally through them.

### Roadmap coverage

- **Layers 1 to 5: done.** Layer 1 has closed its last gap, the inseparable-residue statement of 1.3 ([`inertiaDeg_eq_finInsepDegree`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/RamificationInertia/HilbertTheory/Basic.html#TauCeti.IsInertiaField.inertiaDeg_eq_finInsepDegree)).
- **Layer 6: done.** All of 6.1 to 6.5 is in: the filtration comparison, Hilbert's formula, the tame and wild exponents, and the permutation-action formula. The one gap is an illustrative example listed under 6.2, noted below.
- **Layer 7: done.** 7.4 now includes the certificate with its soundness theorem, a concrete certificate at the golden ratio, and the 98-candidate cubic certificate.
- **Layer 8: done.** The label prefix is in. The worked suite certifies what the README lists for all five fields, including Dedekind's non-monogenic field of discriminant `−503` ([`dedekindCubic_not_isMonogenic`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/NumberField/WorkedExamples/DedekindCubic/PrimesOverTwo.html#TauCeti.NumberField.dedekindCubic_not_isMonogenic)). The page coverage map of 8.2 is an accounting table in the README with no formal statement attached.

## The frontier

- **The dyadic filtration of `ℚ(i)`**: 6.2 lists `G_0 = G_1 = ℤ/2` and `G_2 = 1` at `2` among the examples for the global ramification groups, and the library does not appear to have it. The Hilbert formula and the known exponent `v_P(𝔡) = 2` should make it short.
- **Rank-one quartic fields**: the polynomial certificate needs prime degree, so a field such as `ℚ(ζ₈)` is outside it. The README excludes this case from scope. Extending the certificate is new work, not a missing milestone.
- **The class number of Dedekind's field**: the README deliberately claims no value. Claiming one would need a full Minkowski certificate with explicit generators for every prime below the bound.
- **Downstream consumers**: the Artin map, the relative discriminant and Dedekind's theorem are now stable inputs for the class field theory and Chebotarev roadmaps. The density of split primes belongs to Chebotarev, not here.
