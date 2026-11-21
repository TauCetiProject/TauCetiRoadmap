<!--tauceti-status:v1 {"roadmap":"EquivariantIntersectionTheory","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e","ts":"2026-11-19T18:22:01+11:00"}-->
<!--tauceti-coverage:v1 {"layers":[{"id":"Layer 0","remaining":"0.3 comparison with AlgebraicVectorBundles L2A, 0.4 weighted polynomial rings, 0.5 the generic discriminant","state":"partial"},{"id":"Layer 1","state":"untouched"},{"id":"Layer 2","state":"untouched"},{"id":"Layer 3","state":"untouched"}],"readme_sha":"9c05538fe1c667288e1b48471681b404e99bfc957bd8165b9645bf773ee70b01","roadmap":"EquivariantIntersectionTheory","to_sha":"b2350004c40546f72a9ed4f47921b94b9517174e"}-->
# Status: EquivariantIntersectionTheory

This file documents the status of the EquivariantIntersectionTheory roadmap up until `b235000` (2026-11-19T18:22:01+11:00). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Layer 0, the commutative algebra of graded rings, is about half done: the shift classification (0.1) and homogeneous generators on a connected spectrum (0.2) are proved, and the grading of a localisation (0.3) is in apart from one comparison. Weighted polynomial rings (0.4), the generic discriminant (0.5), and Layers 1, 2 and 3 have not started.

### Named results

- **The classification of shifts** — the shifts `A(d)` and `A(e)` of a graded ring are graded-isomorphic exactly when `d − e` is the degree of a homogeneous unit ([`TauCeti.sub_mem_homogeneousUnitDegrees_iff`](https://taucetiproject.org/docs/TauCeti/RingTheory/GradedAlgebra/Homogeneous/Units.html#TauCeti.sub_mem_homogeneousUnitDegrees_iff)); in module form, a compatible grading of `A` with a homogeneous unit is a shift ([`TauCeti.exists_linearEquiv_iff_exists_isUnit_mem`](https://taucetiproject.org/docs/TauCeti/RingTheory/GradedAlgebra/Homogeneous/Units.html#TauCeti.exists_linearEquiv_iff_exists_isUnit_mem)).
- **Homogeneous generators on a connected spectrum** — over a ring with connected prime spectrum, every grading of the free module `A` compatible with the ring grading has a homogeneous unit ([`TauCeti.GradedAlgebra.exists_isUnit_mem_of_connected`](https://taucetiproject.org/docs/TauCeti/RingTheory/GradedAlgebra/Homogeneous/Generator.html#TauCeti.GradedAlgebra.exists_isUnit_mem_of_connected)); with the previous result, the shift class group then classifies all such gradings.
- **Units of Laurent polynomials over a connected base** — if `Spec R` is connected, a unit of `R[T, T⁻¹]` has one unit coefficient and all others nilpotent ([`LaurentPolynomial.exists_isUnit_coeff_of_isUnit`](https://taucetiproject.org/docs/TauCeti/Algebra/Polynomial/Laurent/Units/Connected.html#LaurentPolynomial.exists_isUnit_coeff_of_isUnit)); this is the input to 0.2, used in place of the README's domain-only lemma.
- **Homogeneous unit degrees of a graded group algebra** — when `R[G]` is graded through a homomorphism `f`, those degrees are the range of `f` ([`TauCeti.homogeneousUnitDegrees_gradeBy`](https://taucetiproject.org/docs/TauCeti/Algebra/MonoidAlgebra/Grading.html#TauCeti.homogeneousUnitDegrees_gradeBy)), so the Laurent ring with `T` in degree `w` has shift class group [`ZMod |w|`](https://taucetiproject.org/docs/TauCeti/Algebra/Polynomial/Laurent/Units.html#TauCeti.shiftClassGroupLaurentPolynomialEquiv).

### Notable definitions and infrastructure

- **The shift class group** ([`TauCeti.ShiftClassGroup`](https://taucetiproject.org/docs/TauCeti/RingTheory/GradedAlgebra/Homogeneous/Units.html#TauCeti.ShiftClassGroup)), the degree group modulo the degrees of homogeneous units. It is the group that 1.2 is to identify with the `𝔾_m`-equivariant Picard group of `Spec A`, and that Layer 3 reads off as `ℤ/e` and `ℤ/12`.
- **The grading of a localisation at a homogeneous element** ([`TauCeti.GradedAlgebra.awayGrading`](https://taucetiproject.org/docs/TauCeti/RingTheory/GradedAlgebra/Localization/Away.html#TauCeti.GradedAlgebra.awayGrading)), in which `a / fⁿ` has degree `deg a − n e`, negative degrees included. It is a graded algebra, the localisation map is a graded homomorphism, and its degree-zero part is Mathlib's homogeneous localisation ([`TauCeti.GradedAlgebra.awayGradingZeroEquiv`](https://taucetiproject.org/docs/TauCeti/RingTheory/GradedAlgebra/Localization/Away.html#TauCeti.GradedAlgebra.awayGradingZeroEquiv)). This is the ring on which 0.4 computes unit degrees `eℤ`.

### Roadmap coverage

Layer 0 is partial: 0.1 and 0.2 are done; 0.3 is done except for the comparison of its nonnegative-degree part with the affine graded-ring interface of AlgebraicVectorBundles L2A; 0.4 (weighted polynomial rings and their localisations) and 0.5 (the generic discriminant) have nothing in the library. Layers 1, 2 and 3 are untouched.

## The frontier

- **Weighted polynomial rings (0.4)** — prove that the homogeneous unit degrees of `k[σ]` are `⊥` for any weights, and `eℤ` after inverting a weighted homogeneous prime of weight `e`, using factoriality of `k[σ]`; its prerequisites 0.2 and the grading of 0.3 are now in place.
- **The generic discriminant (0.5)** — weight `m(m − 1)` and primality in characteristic `0` of the discriminant of `Xᵐ + a₂ Xᵐ⁻² + ⋯ + aₘ`, giving the `ℤ/12` input for `M_{1,1}`; needs 0.4.
- **The localisation comparison (0.3)** — identify the nonnegative degrees of the localisation grading with the localisation comparison of AlgebraicVectorBundles L2A; it depends on that roadmap's interface.
- **Linearised invertible sheaves (1.1)** — the groupoid and `Pic^G(X)` for an action of a flat group scheme, on the actions, quotient stacks and Picard groups of SchemeAndStackFoundations; it opens Layer 1 and everything after it.
- **`𝔾_m` on an affine scheme (1.2)** — identify linearisations of `O` on `Spec A` with compatible gradings of `A`, turning 0.1 and 0.2 into `Pic^{𝔾_m}(Spec A) ≅ ShiftClassGroup` for connected `Spec A` with `Pic(A) = 0`; needs 1.1.
