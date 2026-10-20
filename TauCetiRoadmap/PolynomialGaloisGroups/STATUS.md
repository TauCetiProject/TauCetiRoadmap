<!--tauceti-status:v1 {"roadmap":"PolynomialGaloisGroups","to_sha":"c7ae9d762d2bc9436e7c2ed5006e64ac24822b2d","ts":"2026-10-13T09:39:50+11:00"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","state":"done"},{"id":"Layer 1","state":"done"},{"id":"Layer 2","state":"done"},{"id":"Layer 3","state":"done"},{"id":"Layer 4","state":"done"},{"id":"Layer 5","state":"done"},{"id":"Layer 6","state":"done"},{"id":"Layer 9","state":"done"}],"readme_sha":"05deec1f27d2d39e56aff32b5963e3d67a4901f2a3a59d37e8664a847fe9a4ec","roadmap":"PolynomialGaloisGroups","to_sha":"c7ae9d762d2bc9436e7c2ed5006e64ac24822b2d"}-->
# Status: PolynomialGaloisGroups

This file documents the status of the PolynomialGaloisGroups roadmap up until `c7ae9d7` (2026-10-13T09:39:50+11:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Every milestone of every listed layer is proved. The summit is Sₙ as a Galois group over ℚ in every degree, and the labelled classification of transitive subgroups of Sₙ for n ≤ 5 stands beside it. Since then, the work has filled in the label table, recently its parity column, and has recorded where the standard tests stop being decisive.

### Named results

- **Sₙ is a Galois group over ℚ** — for every n ≥ 1 there is a monic integral polynomial of degree n that is irreducible over ℚ and has the full symmetric group as its Galois group, by van der Waerden's construction from reductions at 2, 3 and 5 ([`TauCeti.exists_monic_int_polynomial_hasFullSymmetricGaloisGroup`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/FieldTheory/GaloisGroups/Symmetric/Realization.html#TauCeti.exists_monic_int_polynomial_hasFullSymmetricGaloisGroup)).
- **The transitive subgroups of S₅** — every transitive subgroup of S₅ is conjugate to exactly one of C₅, D₅, F₂₀, A₅ and S₅, and the same holds in degrees three and four ([`TauCeti.existsUnique_transitiveGroupLabel_five`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/GroupTheory/Perm/TransitiveGroupLabel/Classification.html#TauCeti.existsUnique_transitiveGroupLabel_five)).
- **The discriminant test by label** — away from characteristic two, a labelled monic polynomial has square discriminant exactly when its label is one of `1T1`, `3T1`, `4T2`, `4T4`, `5T1`, `5T2`, `5T4` ([`TauCeti.HasGaloisLabel.isSquare_discr_iff_label`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/FieldTheory/GaloisGroups/Label.html#TauCeti.HasGaloisLabel.isSquare_discr_iff_label)).
- **The factorization theorem for resolvents** — when a specialized resolvent is separable, its irreducible factors correspond to the orbits of the Galois image on Sₙ/H, and their degrees are the orbit sizes ([`TauCeti.ResolventSpec.orbitQuotientEquivFactors`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/FieldTheory/GaloisGroups/Resolvent/Root.html#TauCeti.ResolventSpec.orbitQuotientEquivFactors)). Tschirnhaus transforms carry a resolvent bound back to the original polynomial when the resolvent degenerates.
- **The quintic solvability criterion** — an irreducible separable quintic has a solvable Galois group exactly when its separable F₂₀ resolvent sextic has a root in the base field ([`TauCeti.isSolvable_gal_iff_exists_isRoot_specialize_quinticF20Spec`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/FieldTheory/GaloisGroups/Resolvent/Quintic/Solvable.html#TauCeti.isSolvable_gal_iff_exists_isRoot_specialize_quinticF20Spec)).

### Notable definitions and infrastructure

- **Resolvent specifications** — an integral invariant whose stabilizer is exactly H, together with its orbit product in the elementary symmetric polynomials. One universal object specializes to every polynomial, every field and every reduction mod p ([`TauCeti.ResolventSpec`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/FieldTheory/GaloisGroups/Resolvent/Spec.html#TauCeti.ResolventSpec)).
- **Galois labels** — a polynomial has label `nTj` when some numbering of its roots carries its Galois image onto a conjugate of the reference subgroup. The label is independent of the numbering, and it transports order, parity, primitivity and solvability ([`TauCeti.HasGaloisLabel`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/FieldTheory/GaloisGroups/Label.html#TauCeti.HasGaloisLabel)).
- **The parity character** — the sign of the Galois action on the roots, as a character of `p.Gal` that can be computed in any splitting extension. It is trivial exactly when the image is in the alternating group ([`Polynomial.Gal.sign`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/FieldTheory/GaloisGroups/Parity.html#Polynomial.Gal.sign)).

### Roadmap coverage

Layers 0, 1, 2, 3, 4, 5, 6 and 9 are all done. Layer 3's discriminant test is now also phrased through the intrinsic parity character and read off label by label. Layer 5 adds a lower bound on the group order from factor degrees. It also has a proved example, X⁵ − 5X − 12, showing that factorization types cannot separate D₅ from A₅. As the README specifies, the existence of an admissible Tschirnhaus transform over an infinite field is not a milestone and is not proved.

## The frontier

- **Nothing within the stated scope remains.** Every milestone of the listed layers is proved. The README places Hilbert irreducibility, realizing Aₙ over ℚ, transitive groups in degrees 6 to 11 and Chebotarev density outside this roadmap, so further work would need a new roadmap.
- **Existence of admissible Tschirnhaus transforms** — the classical statement that over an infinite field some T separates the roots. The README excludes it as a milestone, but it is the natural complement to the transport theorem.
- **Characteristic two** — the discriminant test is vacuous there, since every monic discriminant is a square. The replacement is Berlekamp's invariant, which the README puts outside this roadmap.
