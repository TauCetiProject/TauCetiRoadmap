<!--tauceti-status:v1 {"roadmap":"PolynomialGaloisGroups","to_sha":"8a32441b6e9708f9d6aeb9de8d3b11a35b9ee6ce","ts":"2026-10-01T19:24:41Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","state":"done"},{"id":"Layer 1","state":"done"},{"id":"Layer 2","state":"done"},{"id":"Layer 3","state":"done"},{"id":"Layer 4","remaining":"Tschirnhaus transport: splitting fields agree, Galois images conjugate, and a subgroup bound carries back to f","state":"partial"},{"id":"Layer 5","state":"done"},{"id":"Layer 6","state":"done"},{"id":"Layer 9","state":"done"}],"readme_sha":"05deec1f27d2d39e56aff32b5963e3d67a4901f2a3a59d37e8664a847fe9a4ec","roadmap":"PolynomialGaloisGroups","to_sha":"8a32441b6e9708f9d6aeb9de8d3b11a35b9ee6ce"}-->
# Status: PolynomialGaloisGroups

This file documents the status of the PolynomialGaloisGroups roadmap up until `8a32441` (2026-10-01T19:24:41Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Two results are proved: the summit, Sₙ as a Galois group over ℚ in every degree, and the labelled classification of transitive subgroups of Sₙ for n ≤ 5. Every layer is done except Layer 4. There, Tschirnhaus transforms exist, but the step that carries a subgroup bound from the transform back to f is missing.

### Named results

- **Sₙ is a Galois group over ℚ**: for every n ≥ 1 there is a monic integral polynomial of degree n that is irreducible over ℚ and has the full symmetric group as its Galois group. It is van der Waerden's construction from reductions at 2, 3 and 5 ([`TauCeti.exists_monic_int_polynomial_hasFullSymmetricGaloisGroup`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/FieldTheory/GaloisGroups/Symmetric/Realization.html#TauCeti.exists_monic_int_polynomial_hasFullSymmetricGaloisGroup)).
- **The transitive subgroups of S₅**: every transitive subgroup of S₅ is conjugate to exactly one of C₅, D₅, F₂₀, A₅ and S₅. The same holds in degrees three and four ([`TauCeti.existsUnique_transitiveGroupLabel_five`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/GroupTheory/Perm/TransitiveGroupLabel/Classification.html#TauCeti.existsUnique_transitiveGroupLabel_five)).
- **The factorization theorem for resolvents**: when a specialized resolvent is separable, its irreducible factors correspond to the orbits of the Galois image on Sₙ/H, and their degrees are the orbit sizes ([`TauCeti.ResolventSpec.orbitQuotientEquivFactors`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/FieldTheory/GaloisGroups/Resolvent/Root.html#TauCeti.ResolventSpec.orbitQuotientEquivFactors)).
- **Cyclic against dihedral quartics**: an irreducible quartic in the last row of the table has label 4T1 exactly when it factors over its discriminant field ([`TauCeti.hasGaloisLabel_four_zero_iff`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/FieldTheory/GaloisGroups/Quartic/Basic.html#TauCeti.hasGaloisLabel_four_zero_iff)). This completes the quartic decision table.
- **The quintic solvability criterion**: an irreducible separable quintic has a solvable Galois group exactly when its separable F₂₀ resolvent sextic has a root in the base field ([`TauCeti.isSolvable_gal_iff_exists_isRoot_specialize_quinticF20Spec`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/FieldTheory/GaloisGroups/Resolvent/Quintic/Solvable.html#TauCeti.isSolvable_gal_iff_exists_isRoot_specialize_quinticF20Spec)). The sextic and the discriminant together still cannot separate C₅ from D₅, and that limitation is proved with explicit witnesses ([`TauCeti.discriminant_and_sextic_do_not_distinguish_C5_D5`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/FieldTheory/GaloisGroups/Certificate/Cyclic/Dihedral.html#TauCeti.discriminant_and_sextic_do_not_distinguish_C5_D5)).

### Notable definitions and infrastructure

- **Resolvent specifications**: a resolvent specification is an integral invariant whose stabilizer is exactly H, together with its orbit product written in the elementary symmetric polynomials. It can be specialized at any polynomial over any ring, so one universal object serves every polynomial, every field and every reduction mod p ([`TauCeti.ResolventSpec`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/FieldTheory/GaloisGroups/Resolvent/Spec.html#TauCeti.ResolventSpec)).
- **Galois labels**: a polynomial has label `nTj` when some numbering of its roots carries its Galois image onto a conjugate of the reference subgroup. The label does not depend on the numbering, and it transports order, parity, primitivity and solvability ([`TauCeti.HasGaloisLabel`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/FieldTheory/GaloisGroups/Label.html#TauCeti.HasGaloisLabel)).
- **Dedekind's theorem as membership**: for a prime not dividing the discriminant, the degrees of the factors of f mod p form the full cycle type of some element of the Galois image. This theorem is supplied by Number Field Arithmetic ([`TauCeti.exists_mem_range_galActionHom_fullCycleType_eq_factorDegrees`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/FieldTheory/GaloisGroups/Reduction.html#TauCeti.exists_mem_range_galActionHom_fullCycleType_eq_factorDegrees)).

### Roadmap coverage

Layers 0, 1, 2, 3, 5, 6 and 9 are done.

- **Layer 1** gained the primitive product wreath action and the iterated chain of imprimitivity.
- **Layer 3** gained base change of the discriminant field.
- **Layer 5** gained good primes for a resolvent.
- **Layer 6** gained the 4T1/4T3 split and the C₅/D₅ regression theorem.

Layer 4 is partial. It has the specifications, the descent, specialization, the factorization theorem, the degenerate case with its X⁵ − X witness, and the quartic and quintic tables. For Tschirnhaus transforms it has the transformed polynomial, admissibility, degree, separability and the correspondence of root sets. It lacks the agreement of splitting fields, the conjugacy of Galois images, and the transport of a subgroup bound back to f.

## The frontier

- **Tschirnhaus transport**: for an admissible T, show that the splitting fields of f and of its transform agree up to an `AlgEquiv` and that their Galois images are conjugate. Then show that a separable transformed resolvent with a root bounds the Galois image of f. The root-set bijection ([`Polynomial.TschirnhausAdmissible.bijOn_rootSet`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/RingTheory/Polynomial/Tschirnhaus.html#Polynomial.TschirnhausAdmissible.bijOn_rootSet)) is the starting point. This is the last open milestone of the roadmap.
