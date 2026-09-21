<!--tauceti-status:v1 {"roadmap":"Multiquadratic","to_sha":"fb8b54eb064a435b1ce44077d6de14fb3239ddd4","ts":"2026-09-20T11:23:11Z"}-->
# Status: Multiquadratic

This file documents the status of the Multiquadratic roadmap up until `fb8b54e` (2026-09-20T11:23:11Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The core of Layers 0–3 is established at the roadmap's stated scope: multiquadratic degree and Galois/subfield theory, splitting and ramification, the elementary-2 class-group quotient, and the genus-field/2-rank summit. Two requested worked examples and the long-horizon explicit class-field constructions remain open.

### Named results

- **The multiquadratic degree formula** — square-class-independent radicands generate an extension of degree 2ⁿ, the base for the later Galois and subfield statements. [Lean declaration](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/Multiquadratic/Degree.html#TauCeti.Multiquadratic.finrank_adjoin_range)

- **The rational-radicand splitting law** — away from the radicands' numerator and denominator primes, a rational prime splits completely exactly when every radicand is a quadratic residue. [Lean declaration](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/Multiquadratic/SquareClass/Splitting.html#TauCeti.Multiquadratic.ncard_primesOver_multiquadratic_iff_num_mul_den)

- **The genus-field maximality theorem** — for an imaginary quadratic base, the prime-discriminant compositum is maximal among abelian-over-ℚ extensions unramified at every place. [Lean declaration](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/Multiquadratic/GenusField.html#TauCeti.Multiquadratic.isGenusField_candidateGenusField)

- **The genus-field/class-group isomorphism** — the relative Galois group is canonically the narrow class group modulo squares, with the ordinary quotient in the imaginary case. [Lean declaration](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/Multiquadratic/CandidateGenusField/Relative/GenusCharacter.html#TauCeti.Multiquadratic.autCandidateGenusFieldEquivNarrowElementaryTwoQuotient)

- **The narrow 2-rank formula** — for either signature, rank₂ Cl⁺(K) = t − 1, where t counts ramified rational primes. [Lean declaration](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/Multiquadratic/Quadratic/TwoRank.html#TauCeti.Multiquadratic.narrowTwoRank_eq_ncard_ramifiedPrimes_sub_one)

### Notable definitions and infrastructure

- **The narrow class group** — quotienting by totally positive principal ideals makes the real genus-theory statements expressible. [Definition](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/NumberField/NarrowClassGroup/Basic.html#NumberField.NarrowClassGroup)

- **Genus characters** — prime-discriminant characters descend to the narrow class group and separate its classes modulo squares. [Definition](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/Multiquadratic/Quadratic/GenusCharacter/Basic.html#TauCeti.Multiquadratic.genusCharFun)

- **The unrestricted Artin map** — fractional ideals map directly to Frobenius automorphisms in everywhere-unramified abelian extensions, supplying the reciprocity interface. [Definition](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/NumberField/Ideal/UnramifiedArtinMap.html#TauCeti.NumberFieldArithmetic.unramifiedArtinHom)

### Roadmap coverage

Layer 0 is done, including square-class rank/degree, the elementary-abelian Galois group, and the subfield lattice. Layer 1 is done at the stated precision, including rational and dyadic splitting and fundamental-discriminant ramification. Layer 2 is done: Cl/Cl² remains distinct from Cl[2], and the [ordinary ambiguous-class formula](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/Multiquadratic/Quadratic/AmbiguousClassNumber.html#TauCeti.Multiquadratic.natCard_classGroup_sq_eq_one_eq_two_pow) and narrow counterpart are available. Layer 3 is done for the imaginary genus field and the finite-place narrow genus field, including the Artin isomorphisms and the narrow t − 1 theorem; the ordinary real rank is characterized as t − 1 or t − 2. The [ℚ(√−5) genus-field](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/Multiquadratic/MinusFive/GenusField.html#TauCeti.Multiquadratic.candidateGenusField_neg_five_eq) and [ℚ(√−21) 2-rank](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/Multiquadratic/MinusTwentyOne/TwoRank.html#TauCeti.Multiquadratic.twoRank_eq_two_of_minpoly_eq_X_sq_add_twenty_one) checks land, but the ℚ(√2, √3) and Erdős CM degree checks do not. Cyclotomic containment has begun; explicit Kronecker–Weber, Hilbert class-field, and ring-class-field constructions have not.

## The frontier

- **The ℚ(√2, √3) worked example** — state and discharge the degree-4 instance explicitly; the [generic degree theorem](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/Multiquadratic/Degree.html#TauCeti.Multiquadratic.finrank_adjoin_range) is present, but this declaration is not.

- **The Erdős CM-field example** — derive the degree 2ᵍ⁺¹ for ℚ(i, √q₀, …, √q₍g−1₎); no such worked-example declaration is supplied.

- **Explicit Kronecker–Weber** — extend the current [cyclotomic containment](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/Multiquadratic/Cyclotomic/FundamentalDiscriminant.html#TauCeti.Multiquadratic.candidateGenusField_le_adjoin_exp) to the full explicit abelian-over-ℚ realization and its Gauss-sum machinery.

- **Hilbert and ring class fields** — the roadmap's longer class-field constructions remain untouched beyond the genus-field quotient.
