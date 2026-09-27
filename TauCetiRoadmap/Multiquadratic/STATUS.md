<!--tauceti-status:v1 {"roadmap":"Multiquadratic","to_sha":"759eb3ef9658ad1d756b2d42bc5882bb394586c2","ts":"2026-09-26T20:53:39Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","state":"done"},{"id":"Layer 1","state":"done"},{"id":"Layer 2","state":"done"},{"id":"Layer 3","state":"done"}],"readme_sha":"8cb02a14a0d342f08200d081e94bf0342ac75aac72504af05c903adb85eed942","roadmap":"Multiquadratic","to_sha":"759eb3ef9658ad1d756b2d42bc5882bb394586c2"}-->
# Status: Multiquadratic

This file documents the status of the Multiquadratic roadmap up until `759eb3e` (2026-09-26T20:53:39Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** All four layers are done, from the degree and Galois theory of multiquadratic fields through the genus field and the 2-rank theorem for real and imaginary quadratic fields alike, and every worked example the roadmap lists is proved. Only the long horizon is open: multiquadratic fields sit in named cyclotomic fields, but Kronecker–Weber for abelian fields of higher exponent and the Hilbert and ring class fields have not begun.

### Named results

- **The multiquadratic degree formula** — if no nonempty product of the radicands d₁, …, dₙ is a square in K, then K(√d₁, …, √dₙ) has degree 2ⁿ over K; the Galois group (ℤ/2)ⁿ of sign changes and the subfield lattice rest on it. [`finrank_adjoin_range`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/Multiquadratic/Degree.html#TauCeti.Multiquadratic.finrank_adjoin_range)

- **The multiquadratic decomposition law** — at an odd prime p dividing no radicand, every prime above p is unramified, with residue degree 1 if every radicand is a square mod p and 2 otherwise, so p splits completely exactly when every Legendre symbol is 1; the prime 2 obeys the mod-8 analogue when every radicand is 1 mod 4. [`inertiaDeg_eq_one_iff_forall_legendreSym_eq_one`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/Multiquadratic/ResidueDegree.html#TauCeti.Multiquadratic.inertiaDeg_eq_one_iff_forall_legendreSym_eq_one)

- **The genus field** — for imaginary ℚ(√d), the compositum of the quadratic fields of the prime discriminants dividing its discriminant is abelian over ℚ, unramified over ℚ(√d) at every place, and maximal with these properties; for real ℚ(√d) the maximal totally real subfield of that compositum plays this role, and the whole compositum is the narrow genus field in both signatures. [`isGenusField_candidateGenusField`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/Multiquadratic/GenusField.html#TauCeti.Multiquadratic.isGenusField_candidateGenusField), `isGenusField_candidateGenusFieldReal`

- **The genus-field isomorphism** — the compositum has Galois group Cl⁺(K)/Cl⁺(K)² over K = ℚ(√d), which is the classical Cl(K)/Cl(K)² for imaginary K, and for real K the totally real genus field has Galois group Cl(K)/Cl(K)². [`autCandidateGenusFieldEquivNarrowElementaryTwoQuotient`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/Multiquadratic/CandidateGenusField/Relative/GenusCharacter.html#TauCeti.Multiquadratic.autCandidateGenusFieldEquivNarrowElementaryTwoQuotient), `autCandidateGenusFieldRealEquivElementaryTwoQuotient`

- **The narrow 2-rank formula** — for a quadratic field of either signature, the narrow class group has 2-rank t − 1, where t is the number of ramified rational primes. [`narrowTwoRank_eq_ncard_ramifiedPrimes_sub_one`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/Multiquadratic/Quadratic/TwoRank.html#TauCeti.Multiquadratic.narrowTwoRank_eq_ncard_ramifiedPrimes_sub_one)

### Notable definitions and infrastructure

- **The narrow class group** — fractional ideals modulo principal ideals with a totally positive generator, where the t − 1 count holds for real fields; forgetting positivity costs at most one in 2-rank. [`NumberField.NarrowClassGroup`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/NumberField/NarrowClassGroup/Basic.html#NumberField.NarrowClassGroup)

- **The conjugate-ideal count** — in a Dedekind domain, when σ pairs off a finite set S of primes without fixed points, exactly 2^(#S/2) ideals A satisfy A · σA = ∏ S; in a multiquadratic field it supplies the ideals the Erdős unit-distance proof needed for its CM field. [`TauCeti.ncard_setOf_mul_map_eq_prod`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/RingTheory/DedekindDomain/ConjugateFactorization.html#TauCeti.ncard_setOf_mul_map_eq_prod)

- **The prime-discriminant character group** — the Dirichlet characters of the subsets of a family of prime discriminants; inside a cyclotomic field they cut out exactly the compositum of the corresponding quadratic fields, the intended route to a cyclotomic description of the genus field. [`genusCharGroup`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/Multiquadratic/Legendre/PrimeDiscriminant/Dirichlet/Group.html#TauCeti.Multiquadratic.genusCharGroup)

### Roadmap coverage

All four layers are done. Layer 0 has square-class descent, the degree 2ⁿ, the sign-change isomorphism Gal ≅ (ℤ/2)ⁿ and the matching of subfields with 𝔽₂-subspaces. Layer 1 has the splitting law and Frobenius sign vector, extended to [rational radicands](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/Multiquadratic/SquareClass/Splitting.html#TauCeti.Multiquadratic.ncard_primesOver_multiquadratic_iff_num_mul_den) and to the prime 2, the decomposition type at every unramified prime, and the conjugate-ideal transversal count. Layer 2 has Cl/Cl², kept distinct from Cl[2], the unit-square index, and the [ambiguous class number formula](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/Multiquadratic/Quadratic/AmbiguousClassNumber.html#TauCeti.Multiquadratic.natCard_classGroup_sq_eq_one_eq_two_pow) for imaginary fields, real fields and the narrow class group. Layer 3 has the genus and narrow genus fields in both signatures with their Galois groups, the narrow t − 1 theorem, and the [ordinary dichotomy t − 1 or t − 2](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/Multiquadratic/Quadratic/TwoRank.html#TauCeti.Multiquadratic.twoRank_eq_ncard_ramifiedPrimes_sub_one_or_sub_two). The worked examples are all proved: ℚ(√2, √3) has degree 4 (`finrank_adjoin_sqrt_two_three`), the Erdős CM field has degree 2^(g+1) (`finrank_adjoin_I_sqrt_primes`), ℚ(√−5) and ℚ(√−21) have their stated class groups, genus fields and 2-ranks, and ℚ(√3) shows the [ordinary t − 1 formula failing](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/Multiquadratic/Three/TwoRank.html#TauCeti.Multiquadratic.twoRank_ne_ncard_ramifiedPrimes_sub_one_of_minpoly_eq_X_sq_sub_three).

## The frontier

- **The genus field as a character subfield** — the character-group description is proved for a prime-discriminant compositum inside the |∏ P|-th cyclotomic field, but not yet for the genus field of ℚ(√d) itself, whose [containment in ℚ(ζ_|D|)](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/Multiquadratic/Cyclotomic/FundamentalDiscriminant.html#TauCeti.Multiquadratic.candidateGenusField_le_adjoin_exp) is already known.

- **Kronecker–Weber beyond exponent two** — only multiquadratic fields are placed in cyclotomic fields; the ClassFieldTheory roadmap plans the general case as a consequence of its global class field correspondence.

- **Hilbert and ring class fields** — untouched. The Hilbert class field of ℚ(√d), in which the genus field is the part cut out by Cl(K)/Cl(K)², rests on the existence theorem of class field theory, which the ClassFieldTheory roadmap plans to supply along with ring class fields of quadratic orders.
