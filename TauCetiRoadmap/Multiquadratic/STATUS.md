<!--tauceti-status:v1 {"roadmap":"Multiquadratic","to_sha":"8a32441b6e9708f9d6aeb9de8d3b11a35b9ee6ce","ts":"2026-10-01T19:24:41Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","state":"done"},{"id":"Layer 1","state":"done"},{"id":"Layer 2","state":"done"},{"id":"Layer 3","state":"done"}],"readme_sha":"8cb02a14a0d342f08200d081e94bf0342ac75aac72504af05c903adb85eed942","roadmap":"Multiquadratic","to_sha":"8a32441b6e9708f9d6aeb9de8d3b11a35b9ee6ce"}-->
# Status: Multiquadratic

This file documents the status of the Multiquadratic roadmap up until `8a32441` (2026-10-01T19:24:41Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** All four layers are done. That covers the degree and Galois theory of multiquadratic fields, the genus field and the 2-rank theorem for real and imaginary quadratic fields, and every worked example the roadmap lists. Only the long horizon is open. Multiquadratic fields, and now the genus field itself, are described inside cyclotomic fields. Kronecker–Weber for abelian fields of higher exponent and the Hilbert and ring class fields have not begun.

### Named results

- **The multiquadratic degree formula** — if no nonempty product of the radicands d₁, …, dₙ is a square in K, then K(√d₁, …, √dₙ) has degree 2ⁿ over K. The Galois group (ℤ/2)ⁿ of sign changes and the subfield lattice rest on this. [`finrank_adjoin_range`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/Multiquadratic/Degree.html#TauCeti.Multiquadratic.finrank_adjoin_range)

- **The multiquadratic decomposition law** — take squarefree radicands and an odd prime p. If p divides no radicand, it is unramified, with residue degree 1 exactly when every radicand is a square mod p. If p divides some radicand, it has ramification index 2, and residue degree 1 exactly when the radicands prime to p are squares mod p and the p-free parts of the others share one Legendre symbol. At 2, the mod-8 analogue holds when every radicand is 1 mod 4. [`inertiaDeg_eq_one_iff_forall_legendreSym_eq_one`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/Multiquadratic/ResidueDegree.html#TauCeti.Multiquadratic.inertiaDeg_eq_one_iff_forall_legendreSym_eq_one), [`inertiaDeg_eq_one_iff_of_squarefree`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/Multiquadratic/RamificationIndex.html#TauCeti.Multiquadratic.inertiaDeg_eq_one_iff_of_squarefree)

- **The genus field** — for imaginary ℚ(√d), the compositum of the quadratic fields of the prime discriminants dividing its discriminant is abelian over ℚ, unramified over ℚ(√d) at every place, and maximal with these properties. It is unique up to isomorphism. For real ℚ(√d), the maximal totally real subfield of the compositum plays this role, and the whole compositum is the narrow genus field in both signatures. [`isGenusField_candidateGenusField`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/Multiquadratic/GenusField.html#TauCeti.Multiquadratic.isGenusField_candidateGenusField), [`IsGenusField.exists_algEquiv_apply_eq`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/Multiquadratic/GenusField.html#TauCeti.Multiquadratic.IsGenusField.exists_algEquiv_apply_eq)

- **The genus-field isomorphism** — over K = ℚ(√d), the compositum has Galois group Cl⁺(K)/Cl⁺(K)², which is the classical Cl(K)/Cl(K)² for imaginary K. For real K, the totally real genus field has Galois group Cl(K)/Cl(K)². [`autCandidateGenusFieldEquivNarrowElementaryTwoQuotient`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/Multiquadratic/CandidateGenusField/Relative/GenusCharacter.html#TauCeti.Multiquadratic.autCandidateGenusFieldEquivNarrowElementaryTwoQuotient)

- **The narrow 2-rank formula** — for a quadratic field of either signature, the narrow class group has 2-rank t − 1, where t is the number of ramified rational primes. [`narrowTwoRank_eq_ncard_ramifiedPrimes_sub_one`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/Multiquadratic/Quadratic/TwoRank.html#TauCeti.Multiquadratic.narrowTwoRank_eq_ncard_ramifiedPrimes_sub_one)

### Notable definitions and infrastructure

- **The narrow class group** — fractional ideals modulo principal ideals with a totally positive generator. This is the group where the t − 1 count holds for real fields; forgetting positivity costs at most one in 2-rank. [`NumberField.NarrowClassGroup`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/NumberField/NarrowClassGroup/Basic.html#NumberField.NarrowClassGroup)

- **The genus character group** — the Dirichlet characters attached to subsets of the prime discriminants dividing D. Inside a cyclotomic field of level |D|, they [cut out exactly the genus field](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/Multiquadratic/Cyclotomic/CandidateGenusField.html#TauCeti.Multiquadratic.candidateGenusField_eq_map_characterSubfield_genusCharGroup), the explicit Kronecker–Weber description at exponent two. [`genusCharGroup`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/Multiquadratic/Legendre/PrimeDiscriminant/Dirichlet/Group.html#TauCeti.Multiquadratic.genusCharGroup)

- **Frobenius at ramified primes** — at any prime of a Galois extension of number fields, the residue degree divides the order of an arithmetic Frobenius. It is 1 exactly when that Frobenius lies in inertia, and this is what reaches the ramified decomposition law. [`Ideal.inertiaDeg_eq_one_iff_mem_inertia_of_isArithFrobAt`](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/NumberField/Frobenius/DecompositionGroup.html#Ideal.inertiaDeg_eq_one_iff_mem_inertia_of_isArithFrobAt)

### Roadmap coverage

All four layers are done. Layer 0 has:

- square-class descent;
- the degree 2ⁿ;
- the sign-change isomorphism Gal ≅ (ℤ/2)ⁿ;
- the matching of subfields with 𝔽₂-subspaces.

Layer 1 has the splitting law and Frobenius sign vector, including rational radicands and the prime 2. It also has the decomposition type at every unramified prime and at every odd ramified prime, and the conjugate-ideal transversal count. Layer 2 has:

- Cl/Cl², kept distinct from Cl[2];
- the unit-square index;
- the ambiguous class number formula, for imaginary fields, real fields and the narrow class group.

Layer 3 has:

- the genus and narrow genus fields in both signatures, unique up to isomorphism, with their Galois groups;
- the narrow t − 1 theorem;
- the ordinary dichotomy, t − 1 or t − 2.

Every worked example is proved, including ℚ(√3), where the ordinary t − 1 formula fails.

## The frontier

- **Decomposition at a ramified 2** — the decomposition type is explicit at every odd prime and at 2 when every radicand is 1 mod 4, but not when 2 ramifies, which is the case the roadmap flags as the trap.
- **Kronecker–Weber beyond exponent two** — only multiquadratic fields and the genus field are placed in cyclotomic fields. The ClassFieldTheory roadmap plans the general case as a consequence of its global class field correspondence.
- **Hilbert and ring class fields** — untouched. Both rest on the existence theorem of class field theory, which the ClassFieldTheory roadmap plans to supply.
