<!--tauceti-status:v1 {"roadmap":"Multiquadratic","to_sha":"1d095894ac25298eb2a23398826c0f867b6d3164","ts":"2026-10-05T01:07:53Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","state":"done"},{"id":"Layer 1","state":"done"},{"id":"Layer 2","state":"done"},{"id":"Layer 3","state":"done"}],"readme_sha":"8cb02a14a0d342f08200d081e94bf0342ac75aac72504af05c903adb85eed942","roadmap":"Multiquadratic","to_sha":"1d095894ac25298eb2a23398826c0f867b6d3164"}-->
# Status: Multiquadratic

This file documents the status of the Multiquadratic roadmap up until `1d09589` (2026-10-05T01:07:53Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** All four layers are done. That covers the degree and Galois theory of multiquadratic fields, the decomposition law at every prime including a ramified 2, the genus field and the 2-rank theorem for real and imaginary quadratic fields, and every worked example the roadmap lists. Only the long horizon is open. Multiquadratic fields, the genus field and its totally real part are described inside cyclotomic fields. Kronecker–Weber for abelian fields of higher exponent and the Hilbert and ring class fields have not begun.

### Named results

- **The multiquadratic degree formula** — if no nonempty product of the radicands d₁, …, dₙ is a square in K, then K(√d₁, …, √dₙ) has degree 2ⁿ over K. The Galois group (ℤ/2)ⁿ of sign changes and the subfield lattice rest on this. [`finrank_adjoin_range`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/Multiquadratic/Degree.html#TauCeti.Multiquadratic.finrank_adjoin_range)

- **The multiquadratic decomposition law** — for squarefree radicands, the ramification index and residue degree at every rational prime are read off the radicands. At odd primes this is given by Legendre symbols, and at 2 by residues mod 4 and mod 8, ramified or not. [`inertiaDeg_eq_one_iff_forall_legendreSym_eq_one`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/Multiquadratic/ResidueDegree.html#TauCeti.Multiquadratic.inertiaDeg_eq_one_iff_forall_legendreSym_eq_one), [`inertiaDeg_eq_one_iff_of_squarefree`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/Multiquadratic/RamificationIndex.html#TauCeti.Multiquadratic.inertiaDeg_eq_one_iff_of_squarefree), [`ncard_primesOver_two_eq_two_pow_sub`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/Multiquadratic/Dyadic/Decomposition.html#TauCeti.Multiquadratic.ncard_primesOver_two_eq_two_pow_sub)

- **The genus field** — for imaginary ℚ(√d), the compositum of the quadratic fields of the prime discriminants dividing its discriminant is abelian over ℚ, unramified over ℚ(√d) at every place, and maximal with these properties. It is unique up to isomorphism. For real ℚ(√d), the maximal totally real subfield of the compositum plays this role, and the whole compositum is the narrow genus field in both signatures. [`isGenusField_candidateGenusField`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/Multiquadratic/GenusField.html#TauCeti.Multiquadratic.isGenusField_candidateGenusField)

- **The genus-field isomorphism** — over K = ℚ(√d), the compositum has Galois group Cl⁺(K)/Cl⁺(K)², which is the classical Cl(K)/Cl(K)² for imaginary K. For real K, the totally real genus field has Galois group Cl(K)/Cl(K)². [`autCandidateGenusFieldEquivNarrowElementaryTwoQuotient`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/Multiquadratic/CandidateGenusField/Relative/GenusCharacter.html#TauCeti.Multiquadratic.autCandidateGenusFieldEquivNarrowElementaryTwoQuotient)

- **The narrow 2-rank formula** — for a quadratic field of either signature, the narrow class group has 2-rank t − 1, where t is the number of ramified rational primes. [`narrowTwoRank_eq_ncard_ramifiedPrimes_sub_one`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/Multiquadratic/Quadratic/TwoRank.html#TauCeti.Multiquadratic.narrowTwoRank_eq_ncard_ramifiedPrimes_sub_one)

### Notable definitions and infrastructure

- **The narrow class group** — fractional ideals modulo principal ideals with a totally positive generator. This is the group where the t − 1 count holds for real fields; forgetting positivity costs at most one in 2-rank. [`NumberField.NarrowClassGroup`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/NumberField/NarrowClassGroup/Basic.html#NumberField.NarrowClassGroup)

- **The genus character group** — the Dirichlet characters attached to subsets of the prime discriminants dividing D. Inside a cyclotomic field of level |D|, they [cut out exactly the genus field](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/Multiquadratic/Cyclotomic/CandidateGenusField.html#TauCeti.Multiquadratic.candidateGenusField_eq_map_characterSubfield_genusCharGroup), and the even ones [cut out its totally real part](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/Multiquadratic/Cyclotomic/CandidateGenusField.html#TauCeti.Multiquadratic.map_candidateGenusFieldReal_eq_map_characterSubfield_inf_evenSubgroup). This is the explicit Kronecker–Weber description at exponent two. [`genusCharGroup`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/Multiquadratic/Legendre/PrimeDiscriminant/Dirichlet/Group.html#TauCeti.Multiquadratic.genusCharGroup)

- **Exponent-two fields are multiquadratic** — a finite Galois extension whose group has exponent dividing two is generated by square roots of base-field elements. This lets the dyadic residue-degree test be stated intrinsically, without chosen generators. [`adjoin_setOf_sq_mem_range_eq_top`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/Multiquadratic/Galois/Kummer.html#TauCeti.Multiquadratic.adjoin_setOf_sq_mem_range_eq_top)

### Roadmap coverage

All four layers are done. Layer 0 has square-class descent, the degree 2ⁿ, the sign-change isomorphism Gal ≅ (ℤ/2)ⁿ and the matching of subfields with 𝔽₂-subspaces. Layer 1 has the splitting law and Frobenius sign vector for rational radicands, the full decomposition type at every prime including a ramified 2, and the conjugate-ideal transversal count. Layer 2 has Cl/Cl², kept distinct from Cl[2], the unit-square index, and the ambiguous class number formula for imaginary fields, real fields and the narrow class group. Layer 3 has the genus and narrow genus fields in both signatures, unique up to isomorphism and with their Galois groups, the narrow t − 1 theorem, and the ordinary dichotomy t − 1 or t − 2. Every worked example is proved, including ℚ(√3), where the ordinary t − 1 formula fails.

## The frontier

- **Kronecker–Weber beyond exponent two** — only multiquadratic fields and the genus field are placed in cyclotomic fields. The ClassFieldTheory roadmap plans the general case as a consequence of its global class field correspondence.
- **Hilbert and ring class fields** — untouched. Both rest on the existence theorem of class field theory, which the ClassFieldTheory roadmap plans to supply.
