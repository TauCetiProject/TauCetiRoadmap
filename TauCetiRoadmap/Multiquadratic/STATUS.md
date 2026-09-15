<!--tauceti-status:v1 {"roadmap":"Multiquadratic","to_sha":"0ee6c02965225fade09d17692899c65b89c3c61b","ts":"2026-09-03T15:53:32Z"}-->
# Status: Multiquadratic

This file documents the status of the Multiquadratic roadmap up until `0ee6c02` (2026-09-03T15:53:32Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** The multiquadratic, splitting, and field-theoretic genus-field layers are established, and the imaginary quadratic 2-rank summit is complete. The class-group comparison is still partial—the real narrow formula and an actual `Gal(K_gen/K) ≅ Cl(K)/Cl(K)²` are absent—and the long-horizon class-field constructions have not begun.

### Named results

- **[The multiquadratic degree formula](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/Multiquadratic/Degree.html#TauCeti.Multiquadratic.finrank_adjoin_range)** — square-class independent radicands generate an extension of degree `2ⁿ`.

- **[The multiquadratic Frobenius criterion](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/Multiquadratic/Frobenius.html#TauCeti.NumberField.isArithFrobAt_multiquadratic_eq_one_iff)** — away from the ramified primes, Frobenius is trivial exactly when every radicand is a quadratic residue.

- **[The imaginary quadratic genus-field theorem](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/Multiquadratic/GenusField.html#TauCeti.Multiquadratic.isGenusField_candidateGenusField)** — the compositum of the prime-discriminant quadratic fields is the maximal extension unramified at every place over `ℚ(√d)` and abelian over `ℚ`, for negative squarefree `d`.

- **[The narrow genus-field theorem](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/Multiquadratic/Unramified/NarrowGenusField.html#TauCeti.Multiquadratic.isNarrowGenusField_candidateGenusField)** — for any squarefree nonsquare `d`, that compositum is maximal among the abelian-over-`ℚ` extensions unramified over `ℚ(√d)` at every finite place.

- **[The imaginary quadratic 2-rank formula](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/Multiquadratic/Quadratic/TwoRank.html#TauCeti.Multiquadratic.twoRank_eq_ncard_ramifiedPrimes_sub_one)** — the class-group 2-rank is `t - 1`, with `t` the number of ramified rational primes.

### Notable definitions and infrastructure

- **[The narrow class group](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/NumberField/NarrowClassGroup/Basic.html#NumberField.NarrowClassGroup)** — quotienting by totally positive principal ideals makes the real quadratic version of genus theory expressible.

- **[The general subfield-lattice equivalence](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/Multiquadratic/Subfield/Lattice.html#TauCeti.Multiquadratic.intermediateFieldEquivSubmodule)** — intermediate fields now correspond order-reversingly to `𝔽₂`-subspaces for arbitrary square-class independent radicands, removing the earlier prime-radicand restriction.

- **[Genus characters](https://taucetiproject.github.io/TauCeti/docs/TauCeti/NumberTheory/Multiquadratic/Quadratic/GenusCharacter/Basic.html#TauCeti.Multiquadratic.genusCharFun)** — products of prime-discriminant characters now extend to ideals coprime to their modulus and are invariant under coprime narrow-principal comparison, preparing the missing real lower bound.

### Roadmap coverage

Layers 0 and 1 are done at the roadmap's stated precision: degree, explicit elementary-abelian Galois group, the general subfield lattice, Frobenius and complete splitting away from ramification, and ramification controlled by the fundamental discriminant, including at `2`. Layer 2 is partial: `Cl/Cl²`, the exact unit-square index, narrow class groups, ambiguous-ideal descent, and the ordinary and narrow upper bounds exist, but no full ambiguous class number formula is stated. Layer 3 identifies both the imaginary genus field and the general narrow genus field and proves `2-rank = t - 1` for imaginary quadratic fields; it does not yet prove the Galois-group/class-group isomorphism or the real narrow equality. The class numbers and 2-ranks of `ℚ(√-5)` and `ℚ(√-21)` are verified, while the requested `ℚ(√2,√3)` and Erdős CM-field examples are not established by the supplied declarations.

## The frontier

- **Real narrow 2-rank formula** — descend the coprime-ideal genus characters to enough independent characters of `Cl⁺(K)/Cl⁺(K)²` to complement the existing upper bound and prove `rank₂ Cl⁺(K) = t - 1`.

- **Galois group versus `Cl/Cl²`** — construct the actual reciprocity or Artin map giving `Gal(K_gen/K) ≅ Cl(K)/Cl(K)²`; for imaginary quadratic fields only equality of the two finite cardinalities is established.

- **Ambiguous class number formula** — upgrade the ambiguous-ideal descent and resulting rank bounds to the formula requested in Layer 2.

- **Remaining worked examples** — state and discharge `[ℚ(√2,√3):ℚ] = 4` and the degree `2^(g+1)` of the Erdős CM family; neither conclusion appears among the supplied declarations.
