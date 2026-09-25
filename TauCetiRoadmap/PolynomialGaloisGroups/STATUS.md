<!--tauceti-status:v1 {"roadmap":"PolynomialGaloisGroups","to_sha":"ac726e8cab29a86a2ecc95cc1462c3d13261d38f","ts":"2026-09-22T20:57:37Z"}-->
# Status: PolynomialGaloisGroups

This file documents the status of the PolynomialGaloisGroups roadmap up until `ac726e8` (2026-09-22T20:57:37Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The discriminant, orbit/factor, resolvent, low-degree classification, and three-prime realization cores are established. Layer 1 still has structural gaps, Layer 0 lacks the final conjugate-field quotient, Layer 4 lacks Tschirnhaus transforms, and the certificate/search boundary in Layer 6 remains unfinished.

### Named results

- **The orbit–factor correspondence** — Galois orbits on the roots of a nonzero polynomial are in bijection with its monic irreducible factors, with the orbit represented by a root sent to its minimal polynomial ([`TauCeti.orbitQuotientEquivFactors`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/FieldTheory/GaloisGroups/Orbits.html#TauCeti.orbitQuotientEquivFactors)).
- **The discriminant test** — away from characteristic two, a monic separable polynomial has square discriminant exactly when its root-action image lies in the alternating group ([`Polynomial.Monic.isSquare_discr_iff_range_le_alternatingGroup`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/FieldTheory/GaloisGroups/Discriminant/Basic.html#Polynomial.Monic.isSquare_discr_iff_range_le_alternatingGroup)).
- **The resolvent criterion** — when the specialized resolvent is separable, a base-field root is equivalent to the Galois image lying in a conjugate of the specification subgroup ([`TauCeti.ResolventSpec.exists_isRoot_specialize_iff_exists_le_map_conj`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/FieldTheory/GaloisGroups/Resolvent/Root.html#TauCeti.ResolventSpec.exists_isRoot_specialize_iff_exists_le_map_conj)).
- **Classification through degree five** — every transitive subgroup in degrees three, four, and five has exactly one of the roadmap's reference labels ([`TauCeti.existsUnique_transitiveGroupLabel_three`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/GroupTheory/Perm/TransitiveGroupLabel/Classification.html#TauCeti.existsUnique_transitiveGroupLabel_three), [`TauCeti.existsUnique_transitiveGroupLabel_four`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/GroupTheory/Perm/TransitiveGroupLabel/Classification.html#TauCeti.existsUnique_transitiveGroupLabel_four), [`TauCeti.existsUnique_transitiveGroupLabel_five`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/GroupTheory/Perm/TransitiveGroupLabel/Classification.html#TauCeti.existsUnique_transitiveGroupLabel_five)).
- **The three-prime realization of Sₙ** — every positive degree has a monic integral polynomial irreducible over ℚ whose Galois action is the full symmetric group ([`TauCeti.exists_monic_int_polynomial_hasFullSymmetricGaloisGroup`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/FieldTheory/GaloisGroups/Symmetric/Realization.html#TauCeti.exists_monic_int_polynomial_hasFullSymmetricGaloisGroup)).

### Notable definitions and infrastructure

- **Full cycle type** — [`Equiv.Perm.fullCycleType`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/GroupTheory/Perm/Partition.html#Equiv.Perm.fullCycleType) records fixed points as parts equal to one, making permutation data match factor-degree multisets.
- **Resolvent specifications** — [`TauCeti.ResolventSpec`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/FieldTheory/GaloisGroups/Resolvent/Spec.html#TauCeti.ResolventSpec) packages an exact stabilizer, an integral invariant, and its descended orbit product for reusable quartic and quintic constructions.
- **Factor degrees** — [`Polynomial.factorDegrees`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/RingTheory/Polynomial/FactorDegrees.html#Polynomial.factorDegrees) is the reduction-side carrier consumed by the imported factorization theorem and all good-prime recognition results.

### Roadmap coverage

Layer 0 is mostly done: degree bookkeeping, `fullCycleType`, orbit/factor and transitivity statements, stabilizers, and normal-closure comparisons are present, but the conjugate-field classification by G/N_G(H) is not established. Layer 1 is partial: wreath products, imprimitivity, extremal block results, and the recognition lemmas are present, while the block-stabilizer order isomorphism and Jordan's general p-cycle theorem are absent. Layer 2 is complete. Layer 3 is complete, including the quadratic discriminant field. Layer 4 has the universal descent, root criterion, and quartic/quintic specifications, but no Tschirnhaus-transform API. Layer 5 has factor degrees, finite-field Frobenius orbits, the imported membership consequence, and its recognition corollaries; a separately named good-prime/resolvent-good-prime layer is not evidenced. Layer 6 has the reference groups, uniqueness/classification, label predicates, and cubic/quartic/quintic tests, but not the `QuinticCertificate` carrier and soundness theorem. Layer 9 is complete.

## The frontier

- **The block–stabilizer correspondence** — prove the order isomorphism between blocks containing a point and the subgroup interval above its point stabilizer; this is the missing structural base of Layer 1.
- **Jordan's p-cycle theorem** — establish that a primitive subgroup containing a p-cycle with p + 3 ≤ n contains Aₙ; the current recognition results do not supply this general case.
- **Conjugate fields** — identify conjugate simple subfields with conjugate point stabilizers and count them by G/N_G(H); the normal-closure and stabilizer comparison is available, but this quotient statement is not.
- **Tschirnhaus transforms** — define admissible coefficient-side transforms and transport separability, splitting fields, and Galois-image conjugacy so resolvent separation can be repaired constructively.
- **The quintic certificate** — add the finite `QuinticCertificate`, its verification predicate and Boolean checker, and the one-way soundness theorem; no existence or search claim belongs here.
