<!--tauceti-status:v1 {"roadmap":"PolynomialGaloisGroups","to_sha":"1d095894ac25298eb2a23398826c0f867b6d3164","ts":"2026-10-05T01:07:53Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","state":"done"},{"id":"Layer 1","state":"done"},{"id":"Layer 2","state":"done"},{"id":"Layer 3","state":"done"},{"id":"Layer 4","state":"done"},{"id":"Layer 5","state":"done"},{"id":"Layer 6","state":"done"},{"id":"Layer 9","state":"done"}],"readme_sha":"05deec1f27d2d39e56aff32b5963e3d67a4901f2a3a59d37e8664a847fe9a4ec","roadmap":"PolynomialGaloisGroups","to_sha":"1d095894ac25298eb2a23398826c0f867b6d3164"}-->
# Status: PolynomialGaloisGroups

This file documents the status of the PolynomialGaloisGroups roadmap up until `1d09589` (2026-10-05T01:07:53Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Every milestone of every listed layer is now proved. The summit is Sₙ as a Galois group over ℚ in every degree, and the labelled classification of transitive subgroups of Sₙ for n ≤ 5 stands beside it. The last gap was in Layer 4: carrying a resolvent bound from a Tschirnhaus transform back to the original polynomial. That gap is now closed.

### Named results

- **Sₙ is a Galois group over ℚ** — for every n ≥ 1 there is a monic integral polynomial of degree n that is irreducible over ℚ and has the full symmetric group as its Galois group. This is van der Waerden's construction from reductions at 2, 3 and 5 ([`TauCeti.exists_monic_int_polynomial_hasFullSymmetricGaloisGroup`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/FieldTheory/GaloisGroups/Symmetric/Realization.html#TauCeti.exists_monic_int_polynomial_hasFullSymmetricGaloisGroup)).
- **The transitive subgroups of S₅** — every transitive subgroup of S₅ is conjugate to exactly one of C₅, D₅, F₂₀, A₅ and S₅, and the same holds in degrees three and four ([`TauCeti.existsUnique_transitiveGroupLabel_five`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/GroupTheory/Perm/TransitiveGroupLabel/Classification.html#TauCeti.existsUnique_transitiveGroupLabel_five)).
- **The factorization theorem for resolvents** — when a specialized resolvent is separable, its irreducible factors correspond to the orbits of the Galois image on Sₙ/H, and their degrees are the orbit sizes ([`TauCeti.ResolventSpec.orbitQuotientEquivFactors`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/FieldTheory/GaloisGroups/Resolvent/Root.html#TauCeti.ResolventSpec.orbitQuotientEquivFactors)).
- **Resolvents through a Tschirnhaus transform** — if T is admissible for f and the transformed resolvent is separable with a root in the base field, then the Galois image of f lies in a conjugate of H. This is the classical remedy for a degenerate resolvent ([`TauCeti.ResolventSpec.exists_le_map_conj_of_isRoot_specialize_tschirnhausPolynomial`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/FieldTheory/GaloisGroups/Resolvent/Tschirnhaus.html#TauCeti.ResolventSpec.exists_le_map_conj_of_isRoot_specialize_tschirnhausPolynomial)).
- **The quintic solvability criterion** — an irreducible separable quintic has a solvable Galois group exactly when its separable F₂₀ resolvent sextic has a root in the base field ([`TauCeti.isSolvable_gal_iff_exists_isRoot_specialize_quinticF20Spec`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/FieldTheory/GaloisGroups/Resolvent/Quintic/Solvable.html#TauCeti.isSolvable_gal_iff_exists_isRoot_specialize_quinticF20Spec)). The sextic and the discriminant together still cannot separate C₅ from D₅, and that limitation is proved with explicit witnesses.

### Notable definitions and infrastructure

- **Resolvent specifications** — an integral invariant whose stabilizer is exactly H, together with its orbit product written in the elementary symmetric polynomials. It can be specialized at any polynomial over any ring, so one universal object serves every polynomial, every field and every reduction mod p ([`TauCeti.ResolventSpec`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/FieldTheory/GaloisGroups/Resolvent/Spec.html#TauCeti.ResolventSpec)).
- **Galois labels** — a polynomial has label `nTj` when some numbering of its roots carries its Galois image onto a conjugate of the reference subgroup. The label does not depend on the numbering, and it transports order, parity, primitivity and solvability ([`TauCeti.HasGaloisLabel`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/FieldTheory/GaloisGroups/Label.html#TauCeti.HasGaloisLabel)). The reference subgroups are now also identified abstractly, for instance 5T3 with `AGL(1, 5)` ([`TauCeti.referenceSubgroupFiveTwoMulEquivAffineGroup`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/GroupTheory/Perm/TransitiveGroupLabel/Affine.html#TauCeti.referenceSubgroupFiveTwoMulEquivAffineGroup)).
- **Dedekind's theorem as membership** — for a prime not dividing the discriminant, the degrees of the factors of f mod p form the full cycle type of some element of the Galois image. The theorem itself is supplied by Number Field Arithmetic ([`TauCeti.exists_mem_range_galActionHom_fullCycleType_eq_factorDegrees`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/FieldTheory/GaloisGroups/Reduction.html#TauCeti.exists_mem_range_galActionHom_fullCycleType_eq_factorDegrees)).

### Roadmap coverage

Layers 0, 1, 2, 3, 4, 5, 6 and 9 are all done. Layer 4 was the last to finish. For admissible Tschirnhaus transforms it now has agreement of splitting fields up to an `AlgEquiv`, conjugacy of the Galois images, and transport of the subgroup bound back to f. Its root-enumeration milestones on splitting and separability are also explicit now, and so is the validity of depressing a quartic. As the README specifies, the existence of an admissible transform over an infinite field is not a milestone and is not proved.

## The frontier

- **Nothing within the stated scope remains.** Every milestone of the listed layers is proved. The README places several neighbouring subjects explicitly outside this roadmap: Hilbert irreducibility, realizing Aₙ over ℚ, classifying transitive groups in degrees 6 to 11, and Chebotarev density. Any further work would need a new roadmap rather than a continuation of this one.
- **Existence of admissible Tschirnhaus transforms** — the classical statement that over an infinite field some T separates the roots. The README excludes it as a milestone, but it is the natural complement to the transport theorem.
