<!--tauceti-status:v1 {"roadmap":"NumberFieldArithmetic","to_sha":"ecb4a7b62fd4acf11ddc30fb0c6a353882b77ace","ts":"2026-09-18T11:03:03Z"}-->
# Status: NumberFieldArithmetic

This file documents the status of the NumberFieldArithmetic roadmap up until `ecb4a7b` (2026-09-18T11:03:03Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Layers 1 to 4 are substantially complete: the splitting dictionary, Frobenius elements and the Artin map, Dedekind's theorem with the index theory beneath it, and the relative discriminant ideal. Layer 5 has only its first two milestones, Layer 6 has not begun, and Layers 7 and 8 have monogenicity and the intrinsic label predicate but little else.

### Named results

- **Dedekind's theorem** — the multiset of degrees of the monic irreducible factors of `minpoly ℤ θ` modulo `p` is the cycle type of a Frobenius at a prime above `p` acting on the roots of `minpoly ℚ θ`, with one part `1` restored for each fixed root ([`factorizationType_eq_cycleType_isArithFrobAt`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/NumberField/DedekindTheorem.html#TauCeti.NumberField.factorizationType_eq_cycleType_isArithFrobAt)).
- **Dedekind's criterion** — the factorization of `minpoly ℤ θ` modulo `p` decides whether `p` divides the index `[𝓞 K : ℤ[θ]]` ([`not_dvd_index_iff`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/NumberField/Index/DedekindCriterion.html#TauCeti.NumberField.IntegralPrimitiveElement.not_dvd_index_iff)).
- **The double-coset splitting law** — for `M/K` Galois with group `G` and `E` the fixed field of `H ≤ G`, the primes of `𝓞 E` above `p` are indexed by `H \ G / D` ([`doubleCosetQuotientEquivPrimesOver`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/RamificationInertia/DoubleCoset/Basic.html#Ideal.doubleCosetQuotientEquivPrimesOver)).
- **Stickelberger's congruence** — the discriminant of a number field is `0` or `1` modulo `4` ([`discr_emod_four_eq_zero_or_one`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/NumberField/Discriminant/Stickelberger.html#TauCeti.NumberField.discr_emod_four_eq_zero_or_one)).
- **Ramification is the support of the relative discriminant** — a nonzero prime divides it exactly when some prime above it is ramified, with no separability hypothesis on residue fields ([`dvd_relDiscr_iff_exists_not_isUnramifiedAt`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/RingTheory/DedekindDomain/Discriminant/Ramification.html#TauCeti.dvd_relDiscr_iff_exists_not_isUnramifiedAt)).

### Notable definitions and infrastructure

- **The relative discriminant ideal** ([`relDiscr`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/RingTheory/DedekindDomain/Discriminant/Basic.html#TauCeti.relDiscr)) — the relative norm of the different, with transitivity in towers, localization, a coefficientwise valuation formula, and reconciliation with the signed integer discriminant over `ℤ`.
- **The ideal-theoretic Artin map** ([`artinHomAway`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/NumberField/Ideal/ArtinMap.html#TauCeti.NumberFieldArithmetic.artinHomAway)) — a homomorphism on the fractional ideals prime to a chosen finite set, sending each prime outside it to the Frobenius there; for abelian extensions it is specialised to the complement of the ramified support.
- **The index of an integral primitive element** ([`index`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/NumberField/Index/Basic.html#TauCeti.NumberField.IntegralPrimitiveElement.index)) — `[𝓞 K : ℤ[θ]]` as a number, which lets monogenicity, Dedekind's criterion and common index divisors be phrased as arithmetic about it.

### Roadmap coverage

- **Layers 1 and 2: done.** The splitting criterion in all three forms; complete splitting in composita and normal closures; the decomposition and inertia dictionary without residue separability; the double-coset law with its value formula, naturality and index formulas; and for Frobenius, existence, uniqueness, order `f`, generation of the decomposition group, restriction, the tower formula, the Artin symbol and map, and the order-two conjugation at a ramified real place.
- **Layer 3: done except 3.6 and 3.10.** Index theory, the index formula, Dedekind's criterion, the splitting-field instance, Dedekind's theorem and common index divisors are in. Of the relative Dedekind–Kummer theorem only the irreducibility criterion landed; the correspondence matching `e` and `f` over a general base, and the polynomial-side corollary for arbitrary monic `f`, are absent.
- **Layer 4: done**, including the ramified support, discriminants of bases in a tower, and Stickelberger.
- **Layer 5: 5.1 and 5.2 only.** Adic completions are nonarchimedean local fields, with the residue-field identification and residue cardinality, and the canonical map between completions is characterised by continuity. Milestones 5.3 to 5.10 and all of Layer 6 are untouched.
- **Layers 7 and 8: one milestone each.** Monogenicity is defined and proved for quadratic and cyclotomic fields; the intrinsic label prefix exists and is unique, with the signed discriminant recovered from it. The subfield dictionary, the coverage map and the worked suite are untouched.

## The frontier

- **Layer 3.10, the polynomial-side corollary** — the statement for arbitrary monic `f : ℤ[X]` that the polynomial Galois groups roadmap consumes by name. Its prerequisites are in place; what remains is the reduction to irreducible factors.
- **Layer 3.6, the relative Dedekind–Kummer theorem** — the correspondence over a general base between primes above `p` and monic irreducible factors of `minpoly A θ` modulo `p`, the residue degree being the factor degree and the ramification index its multiplicity.
- **Layer 5.3, the semi-local decomposition** — `K_v ⊗[K] L ≃ ∏_w L_w`, pinned by its value on pure tensors. Milestones 5.4 to 5.10 rest on it, and so does Layer 6, which needs the localization of the different from 5.9.
- **Layer 6, global ramification consequences** — the lower filtration, the different-exponent formula, and the exact tame and wild exponents. Blocked on Layer 5.
- **Layer 7.4, certifying a named unit at rank one** — the certificate that a named unit generates the units modulo torsion, and its polynomial form at prime degree. Only finiteness of the bounded units is done.
