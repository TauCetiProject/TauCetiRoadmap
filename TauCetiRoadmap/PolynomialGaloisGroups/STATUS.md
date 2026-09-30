<!--tauceti-status:v1 {"roadmap":"PolynomialGaloisGroups","to_sha":"dec7a5857c7d85f2ce63e7890c26b1e99a537057","ts":"2026-09-30T00:20:29Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","state":"done"},{"id":"Layer 1","remaining":"primitivity of the product wreath action and the iterated chain of imprimitivity","state":"partial"},{"id":"Layer 2","state":"done"},{"id":"Layer 3","remaining":"base change of the discriminant field along F to F'","state":"partial"},{"id":"Layer 4","remaining":"Tschirnhaus transforms, resolvent factors as orbits on cosets, and the C4/D4 split over the discriminant field","state":"partial"},{"id":"Layer 5","remaining":"ResolventSpec.IsGoodPrime, the good-prime condition for reducing a resolvent","state":"partial"},{"id":"Layer 6","remaining":"the 4T1/4T3 split over the discriminant field and the C5/D5 regression theorem","state":"partial"},{"id":"Layer 9","state":"done"}],"readme_sha":"05deec1f27d2d39e56aff32b5963e3d67a4901f2a3a59d37e8664a847fe9a4ec","roadmap":"PolynomialGaloisGroups","to_sha":"dec7a5857c7d85f2ce63e7890c26b1e99a537057"}-->
# Status: PolynomialGaloisGroups

This file documents the status of the PolynomialGaloisGroups roadmap up until `dec7a58` (2026-09-30T00:20:29Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The summit, Sₙ as a Galois group over ℚ in every degree, is proved, and so is the classification of the transitive subgroups of Sₙ for n ≤ 5, together with its label predicates. Layers 0, 2 and 9 are done, and every other layer is partial. The main work still open is Tschirnhaus transforms, the step that separates C₄ from D₄ over the discriminant field, and primitivity of the product wreath action.

### Named results

- **Sₙ is a Galois group over ℚ** — for every n ≥ 1 there is a monic integral polynomial of degree n, irreducible over ℚ, with full symmetric Galois group. It is built from reductions at 2, 3 and 5 ([`TauCeti.exists_monic_int_polynomial_hasFullSymmetricGaloisGroup`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/FieldTheory/GaloisGroups/Symmetric/Realization.html#TauCeti.exists_monic_int_polynomial_hasFullSymmetricGaloisGroup)).
- **The transitive subgroups of S₅** — every transitive subgroup of S₅ is conjugate to exactly one of C₅, D₅, F₂₀, A₅ and S₅, and likewise in degrees three and four ([`TauCeti.existsUnique_transitiveGroupLabel_five`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/GroupTheory/Perm/TransitiveGroupLabel/Classification.html#TauCeti.existsUnique_transitiveGroupLabel_five)).
- **The discriminant test** — away from characteristic 2, a monic separable polynomial has square discriminant exactly when its Galois image consists of even permutations ([`Polynomial.Monic.isSquare_discr_iff_range_le_alternatingGroup`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/FieldTheory/GaloisGroups/Discriminant/Basic.html#Polynomial.Monic.isSquare_discr_iff_range_le_alternatingGroup)).
- **The quintic solvability criterion** — an irreducible separable quintic has a solvable Galois group exactly when its separable F₂₀ resolvent sextic has a root in the base field ([`TauCeti.isSolvable_gal_iff_exists_isRoot_specialize_quinticF20Spec`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/FieldTheory/GaloisGroups/Resolvent/Quintic/Solvable.html#TauCeti.isSolvable_gal_iff_exists_isRoot_specialize_quinticF20Spec)).
- **Soundness of quintic certificates** — a certificate that checks for a monic integral quintic proves the label it claims, by one of five routes, each with a worked instance ([`TauCeti.QuinticCertificate.check_sound`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/FieldTheory/GaloisGroups/Certificate/Check.html#TauCeti.QuinticCertificate.check_sound)).

### Notable definitions and infrastructure

- **Resolvent specifications** — an integral invariant with exact stabilizer H, plus its orbit product written in the elementary symmetric polynomials, specialized at any polynomial over any ring. A root of it confines the Galois image to a conjugate of H ([`TauCeti.ResolventSpec`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/FieldTheory/GaloisGroups/Resolvent/Spec.html#TauCeti.ResolventSpec), [`TauCeti.ResolventSpec.exists_isRoot_specialize_iff_exists_le_map_conj`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/FieldTheory/GaloisGroups/Resolvent/Root.html#TauCeti.ResolventSpec.exists_isRoot_specialize_iff_exists_le_map_conj)).
- **Galois labels** — a polynomial has label `nTj` when some numbering of its roots carries the Galois image onto a conjugate of the reference subgroup. The label is proved independent of the numbering, and it transports order, parity, primitivity and solvability ([`TauCeti.HasGaloisLabel`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/FieldTheory/GaloisGroups/Label.html#TauCeti.HasGaloisLabel)).
- **Dedekind's theorem as membership** — for a prime not dividing the discriminant, the factor degrees of f mod p form a full cycle type of the Galois image. It rests on the theorem supplied by Number Field Arithmetic ([`TauCeti.exists_mem_range_galActionHom_fullCycleType_eq_factorDegrees`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/FieldTheory/GaloisGroups/Reduction.html#TauCeti.exists_mem_range_galActionHom_fullCycleType_eq_factorDegrees)).

### Roadmap coverage

Three layers are done:

- **Layer 0** is done. It has `fullCycleType` under that name with its `Fin 4` examples, the bijection between orbits and irreducible factors, the equivalence of transitivity and irreducibility, the normal-closure isomorphism and conjugate fields.
- **Layer 2** is done. It has stabilizers as relative Galois groups, the correspondence between blocks and intermediate fields, primitivity, 2-transitivity, and the Galois group of a product as a fibre product.
- **Layer 9** is done. It has the predicate with its regression test for `X ^ n`, the theorem itself, and the three alternating examples.

The other layers are partial:

- **Layer 1** has general wreath products, the imprimitivity embedding, both extremal block cases, Jordan's theorem for a p-cycle and all the recognition theorems. It lacks primitivity of the product action and the iterated chain of imprimitivity.
- **Layer 3** has everything except base change of the discriminant field along F → F′.
- **Layer 4** has specifications, the descent, specialization, the resolvent criterion, and the quartic and quintic items. It lacks Tschirnhaus transforms, the theorem matching resolvent factors with orbits on cosets, and the C₄/D₄ split.
- **Layer 5** lacks only `ResolventSpec.IsGoodPrime`.
- **Layer 6** has the classification, order recognition, the tables and the certificates. It lacks the 4T1/4T3 split and the regression theorem `discriminant_and_sextic_do_not_distinguish_C5_D5`.

## The frontier

- **Separating 4T1 from 4T3** — in the last row of the quartic table, decide the label by whether f stays irreducible over the discriminant field. Both [`TauCeti.hasGaloisLabel_four_zero_or_two_iff`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/FieldTheory/GaloisGroups/Quartic/Basic.html#TauCeti.hasGaloisLabel_four_zero_or_two_iff) and [`TauCeti.discrField`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/FieldTheory/GaloisGroups/Discriminant/Field.html#TauCeti.discrField) exist, and this one step settles the gap in both Layer 4 and Layer 6.
- **The C₅/D₅ regression theorem** — state that the cyclic quintic and X⁵ − 5X − 12 share a square discriminant and a sextic with a rational root, yet have different labels. Both labels are already proved.
- **Resolvent factors as orbits** — show that, for a separable specialized resolvent, the factor degrees are the orbit sizes of the Galois image on Sₙ/H. The rational-root corollary is already there.
- **Tschirnhaus transforms** — the transformed polynomial, admissibility, and transport of a subgroup bound back to f.
- **Remaining small items** — primitivity of the product wreath action, base change of the discriminant field, and `ResolventSpec.IsGoodPrime`.
