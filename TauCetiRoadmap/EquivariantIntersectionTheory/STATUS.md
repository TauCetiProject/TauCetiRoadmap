<!--tauceti-status:v1 {"roadmap":"EquivariantIntersectionTheory","to_sha":"1c6a1a4e61e51f1bcef7784fdd6d5131235b7299","ts":"2026-11-11T04:46:07Z"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","remaining":"0.2 homogeneous generators on a connected spectrum, 0.3 the grading of A_f, 0.4 weighted polynomial rings, 0.5 the generic discriminant","state":"partial"},{"id":"Layer 1","state":"untouched"},{"id":"Layer 2","state":"untouched"},{"id":"Layer 3","state":"untouched"}],"readme_sha":"8e54dfa33bddba87f63aee24ea07da6611574e993bdb08a8420f3385f6100c3b","roadmap":"EquivariantIntersectionTheory","to_sha":"1c6a1a4e61e51f1bcef7784fdd6d5131235b7299"}-->
# Status: EquivariantIntersectionTheory

This file documents the status of the EquivariantIntersectionTheory roadmap up until `1c6a1a4` (2026-11-11T04:46:07Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Only Layer 0, the commutative algebra of graded rings, has begun: its first milestone, the shift classification (0.1), is proved, and the rest of the layer is open. Linearised invertible sheaves and the Picard group of a quotient stack (Layer 1), equivariant Chow groups (Layer 2) and the classical computations (Layer 3) have not started.

### Named results

- **The classification of shifts** — the shifts `A(d)` and `A(e)` of a graded ring are graded-isomorphic exactly when `d − e` is the degree of a homogeneous unit ([`TauCeti.sub_mem_homogeneousUnitDegrees_iff`](https://taucetiproject.org/docs/TauCeti/RingTheory/GradedAlgebra/Homogeneous/Units.html#TauCeti.sub_mem_homogeneousUnitDegrees_iff)).
- **Shift classification, module form** — a grading of `A` compatible with the ring grading and carrying a homogeneous unit `u` of degree `c` is `u` times the shift `A(−c)` in every degree ([`TauCeti.eq_map_mulLeft_of_isUnit_mem`](https://taucetiproject.org/docs/TauCeti/RingTheory/GradedAlgebra/Homogeneous/Units.html#TauCeti.eq_map_mulLeft_of_isUnit_mem)); such a grading is a shift exactly when it has a homogeneous generator ([`TauCeti.exists_linearEquiv_iff_exists_isUnit_mem`](https://taucetiproject.org/docs/TauCeti/RingTheory/GradedAlgebra/Homogeneous/Units.html#TauCeti.exists_linearEquiv_iff_exists_isUnit_mem)).
- **Homogeneous unit degrees of a graded group algebra** — when `R[G]` is graded through a homomorphism `f`, the degrees of its homogeneous units are exactly the range of `f` ([`TauCeti.homogeneousUnitDegrees_gradeBy`](https://taucetiproject.org/docs/TauCeti/Algebra/MonoidAlgebra/Grading.html#TauCeti.homogeneousUnitDegrees_gradeBy)); for the Laurent ring with `T` in degree `w` this makes the shift class group `ZMod |w|` ([`TauCeti.shiftClassGroupLaurentPolynomialEquiv`](https://taucetiproject.org/docs/TauCeti/Algebra/Polynomial/Laurent/Units.html#TauCeti.shiftClassGroupLaurentPolynomialEquiv)), the graded ring of `𝔾_m` acting on itself by `s ↦ s^w`.

### Notable definitions and infrastructure

- **The degree group of homogeneous units** ([`TauCeti.homogeneousUnitDegrees`](https://taucetiproject.org/docs/TauCeti/RingTheory/GradedAlgebra/Homogeneous/Units.html#TauCeti.homogeneousUnitDegrees)) and **the shift class group** ([`TauCeti.ShiftClassGroup`](https://taucetiproject.org/docs/TauCeti/RingTheory/GradedAlgebra/Homogeneous/Units.html#TauCeti.ShiftClassGroup)), the quotient of the degree group by it. Because inverses of homogeneous units are homogeneous of the opposite degree, membership is simply being such a degree ([`TauCeti.mem_homogeneousUnitDegrees_iff`](https://taucetiproject.org/docs/TauCeti/RingTheory/GradedAlgebra/Homogeneous/Units.html#TauCeti.mem_homogeneousUnitDegrees_iff)). This is the group that 1.2 is to identify with the `𝔾_m`-equivariant Picard group of `Spec A`, and that Layer 3 reads off as `ℤ/e` and `ℤ/12`.
- **Units of Laurent polynomials.** Over a ring without zero divisors every unit of `R[T;T⁻¹]` is a unit monomial, already in the library as `LaurentPolynomial.isUnit_iff`. This is the Laurent lemma that the README's 0.2 route applies over each `A/p`.

### Roadmap coverage

Layer 0 is partial: 0.1 is done, with the zero-ring and Laurent cases of its Checks. Of 0.2, the Laurent units lemma exists but the connected-spectrum theorem `exists_isUnit_mem_of_connected` does not; 0.3 (the grading of `A_f` in all degrees), 0.4 (weighted polynomial rings and their localisations) and 0.5 (the generic discriminant) have nothing in the library. Layers 1, 2 and 3 are untouched.

## The frontier

- **Homogeneous generators on a connected spectrum (0.2)** — prove that when `A` has no nontrivial idempotents every compatible grading of `A` has a homogeneous unit, by the README's clopen-cover argument; with 0.1 this makes the shift class group classify all gradings of the free module `A`. The Laurent units input is already there.
- **The grading of a localisation at a homogeneous element (0.3)** — define `awayGrading` with negative degrees, prove it internal, and compare its degree-zero part with `HomogeneousLocalization.Away`; the comparison on nonnegative degrees needs the affine graded-ring interface of AlgebraicVectorBundles L2A.
- **Weighted polynomial rings (0.4)** — homogeneous unit degrees `⊥` for `k[σ]` and `eℤ` after inverting a weighted homogeneous prime of weight `e`; needs 0.2 and 0.3.
- **The generic discriminant (0.5)** — weight `m(m − 1)` and primality in characteristic `0` of the depressed discriminant, giving the `ℤ/12` input of `M_{1,1}`; needs 0.4.
- **Linearised invertible sheaves (1.1)** — the groupoid and `Pic^G(X)` for an action of a flat group scheme, on the actions, quotient stacks and Picard groups of SchemeAndStackFoundations; it opens Layer 1 and everything after it.
