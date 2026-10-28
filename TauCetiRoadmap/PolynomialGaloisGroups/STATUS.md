<!--tauceti-status:v1 {"roadmap":"PolynomialGaloisGroups","to_sha":"c1c6773446bac0f89a4abc381a38d2ab43040bc5","ts":"2026-10-21T00:36:19Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","state":"done"},{"id":"Layer 1","state":"done"},{"id":"Layer 2","state":"done"},{"id":"Layer 3","state":"done"},{"id":"Layer 4","state":"done"},{"id":"Layer 5","state":"done"},{"id":"Layer 6","state":"done"},{"id":"Layer 9","state":"done"}],"readme_sha":"5dcb80b0bb4846e52dac8669db54cb6206b81c314cfa66e07041170f631ace57","roadmap":"PolynomialGaloisGroups","to_sha":"c1c6773446bac0f89a4abc381a38d2ab43040bc5"}-->
# Status: PolynomialGaloisGroups

This file documents the status of the PolynomialGaloisGroups roadmap up until `c1c6773` (2026-10-21T00:36:19Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Every milestone of every listed layer is proved. The summit is Sₙ as a Galois group over ℚ in every degree, and beside it stands the labelled classification of transitive subgroups of Sₙ for n ≤ 5. Recent work has completed the invariants of the label table, most recently the full cycle types of each row, and has made the separability hypothesis on resolvents an explicit piece of evidence.

### Named results

- **Sₙ is a Galois group over ℚ** — for every n ≥ 1 there is a monic integral polynomial of degree n that is irreducible over ℚ and has the full symmetric group as its Galois group. The proof is van der Waerden's construction from reductions at 2, 3 and 5 ([`TauCeti.exists_monic_int_polynomial_hasFullSymmetricGaloisGroup`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/FieldTheory/GaloisGroups/Symmetric/Realization.html#TauCeti.exists_monic_int_polynomial_hasFullSymmetricGaloisGroup)).
- **The transitive subgroups of S₅** — every transitive subgroup of S₅ is conjugate to exactly one of C₅, D₅, F₂₀, A₅ and S₅, and the analogous statements hold in degrees three and four ([`TauCeti.existsUnique_transitiveGroupLabel_five`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/GroupTheory/Perm/TransitiveGroupLabel/Classification.html#TauCeti.existsUnique_transitiveGroupLabel_five)).
- **The discriminant test** — away from characteristic two, a monic separable polynomial has square discriminant exactly when the parity character of its Galois group is trivial ([`Polynomial.Monic.isSquare_discr_iff_sign_eq_one`](https://taucetiproject.org/docs/TauCeti/FieldTheory/GaloisGroups/Discriminant/Basic.html#Polynomial.Monic.isSquare_discr_iff_sign_eq_one)). Read label by label, the even labels are `1T1`, `3T1`, `4T2`, `4T4`, `5T1`, `5T2` and `5T4`.
- **The factorization theorem for resolvents** — when a specialized resolvent is separable, its irreducible factors correspond to the orbits of the Galois image on Sₙ/H, and their degrees are the orbit sizes ([`TauCeti.ResolventSpec.orbitQuotientEquivFactors`](https://taucetiproject.org/docs/TauCeti/FieldTheory/GaloisGroups/Resolvent/Root.html#TauCeti.ResolventSpec.orbitQuotientEquivFactors)). Tschirnhaus transforms carry a resolvent bound back to the original polynomial when the resolvent degenerates.
- **The quintic solvability criterion** — an irreducible separable quintic has a solvable Galois group exactly when its separable F₂₀ resolvent sextic has a root in the base field ([`TauCeti.isSolvable_gal_iff_exists_isRoot_specialize_quinticF20Spec`](https://taucetiproject.org/docs/TauCeti/FieldTheory/GaloisGroups/Resolvent/Quintic/Solvable.html#TauCeti.isSolvable_gal_iff_exists_isRoot_specialize_quinticF20Spec)).

### Notable definitions and infrastructure

- **Resolvent specifications** — an integral invariant whose stabilizer is exactly H, together with its orbit product in the elementary symmetric polynomials. One universal object specializes to every polynomial, every field and every reduction mod p ([`TauCeti.ResolventSpec`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/FieldTheory/GaloisGroups/Resolvent/Spec.html#TauCeti.ResolventSpec)). Its separability hypothesis is packaged as [separation evidence](https://taucetiproject.org/docs/TauCeti/FieldTheory/GaloisGroups/Resolvent/Spec.html#TauCeti.ResolventSeparationEvidence), which a good prime supplies and which survives base change.
- **Galois labels** — a polynomial has label `nTj` when some numbering of its roots carries its Galois image onto a conjugate of the reference subgroup. The label does not depend on the numbering, and it transports order, parity, primitivity, solvability and the full cycle types ([`TauCeti.HasGaloisLabel`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/FieldTheory/GaloisGroups/Label.html#TauCeti.HasGaloisLabel)).
- **The parity character** — the sign of the Galois action on the roots, as a character of `p.Gal` that can be computed in any splitting extension. It is trivial exactly when the image is in the alternating group ([`Polynomial.Gal.sign`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/FieldTheory/GaloisGroups/Parity.html#Polynomial.Gal.sign)).

### Roadmap coverage

Layers 0, 1, 2, 3, 4, 5, 6 and 9 are all done. Layer 0 also has the correct statement without separability, that transitivity means a unit times a power of one irreducible. Layer 2's primitivity criterion now has a form with no degree hypothesis. Layer 3's acceptance tests are proved: the quadratic formula, an even image for X³ − 3X − 1 and an odd one for X³ − 2. Every row of Layer 6's table now carries its cycle types, fixed points included. As the README specifies, the existence of an admissible Tschirnhaus transform over an infinite field is not a milestone and is not proved.

## The frontier

- **Nothing within the stated scope remains.** Every milestone of the listed layers is proved. The README puts Hilbert irreducibility, the realization of Aₙ over ℚ, transitive groups in degrees 6 to 11 and Chebotarev density outside this roadmap, so further work would need a new roadmap.
- **Existence of admissible Tschirnhaus transforms** — the classical statement that over an infinite field some T separates the roots. The README excludes it as a milestone, but it is the natural complement to the transport theorem.
- **Characteristic two** — the discriminant test is vacuous there, since every monic discriminant is a square. The replacement is Berlekamp's invariant, which the README puts outside this roadmap.
