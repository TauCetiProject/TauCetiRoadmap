<!--tauceti-status:v1 {"roadmap":"BordismFormalGroups","to_sha":"e8ea0d187d0e20fa24ab5f68cfc27b2d40b876bd","ts":"2026-10-25T17:19:50Z"}-->
# Status: BordismFormalGroups

This file documents the status of the BordismFormalGroups roadmap up until `e8ea0d1` (2026-10-25T17:19:50Z). There may have been subsequent updates.

It is generated, and its prose is not security-validated; see
https://github.com/TauCetiProject/TauCetiProgress for what that means.

## Where this roadmap stands

**At a glance.** Most of F1, the formal-group algebra, is now in place. That includes the Lazard ring with its graded universal property, the any-ring symmetric cocycle lemma, the indecomposables of L, morphisms and strict isomorphisms, the coordinate-change Hopf algebroid, the exponent-two logarithm and height. Still open in F1: Lazard's polynomial theorem, the bundled and graded forms of the exponent-two logarithm, coordinate independence of height and the classification by height. F2 (Quillen's theorem) through F6 have not begun.

### Named results

- **The symmetric 2-cocycle lemma** — over every commutative ring, torsion included, a homogeneous symmetric additive 2-cocycle of degree n ≥ 2 is r · Cₙ for a unique r ([`existsUnique_eq_smul_lazardCocycle`](https://taucetiproject.org/docs/TauCeti/RingTheory/FormalGroup/SymmetricCocycle/Classification.html#TauCeti.existsUnique_eq_smul_lazardCocycle)). When 2 = 0 there is a refinement for cocycles with zero diagonal: they vanish in degrees 2ᵏ ([`eq_zero_of_two_eq_zero_of_aeval_X_X_eq_zero`](https://taucetiproject.org/docs/TauCeti/RingTheory/FormalGroup/SymmetricCocycle/CharTwo.html#TauCeti.eq_zero_of_two_eq_zero_of_aeval_X_X_eq_zero)) and are multiples of (X+Y)ⁿ − Xⁿ − Yⁿ in all other degrees.
- **Lazard's computation of the indecomposables** — I/I² of the Lazard ring is a free ℤ-module on explicit generators xₙ of degree 2n ([`LazardRing.cotangentBasis`](https://taucetiproject.org/docs/TauCeti/RingTheory/FormalGroup/LazardRing/Indecomposable.html#TauCeti.LazardRing.cotangentBasis)). This is the core input to L ≅ ℤ[x₁, x₂, …].
- **The graded universal property of the Lazard ring** — graded ring maps L → A correspond to commutative formal group laws over A whose coefficient aᵢⱼ lies in degree 2(i + j − 1) ([`LazardRing.gradedLift`](https://taucetiproject.org/docs/TauCeti/RingTheory/FormalGroup/LazardRing/Basic.html#TauCeti.LazardRing.gradedLift)). The ungraded bijection was already in place.
- **Quillen's logarithm in exponent two** — if 2 = 0 and [2]_F = 0, then F has a unique logarithm X + ⋯ that is additive along F and has no terms of degree 2ᵏ, k ≥ 1 ([`existsUnique_logarithm_of_nsmulSeries_two_eq_zero`](https://taucetiproject.org/docs/TauCeti/RingTheory/FormalGroup/ExponentTwo.html#FormalGroup.existsUnique_logarithm_of_nsmulSeries_two_eq_zero)). No division by two is used.
- **Representability of strict coordinate changes** — pairs of a commutative formal group law and a strict coordinate correspond to ring maps out of L[b₁, b₂, …] ([`LazardRing.coordinateChangeLift`](https://taucetiproject.org/docs/TauCeti/RingTheory/FormalGroup/CoordinateChange/Lazard.html#TauCeti.LazardRing.coordinateChangeLift)). The counit, conjugation and [coassociative coproduct](https://taucetiproject.org/docs/TauCeti/RingTheory/FormalGroup/CoordinateChange/HopfAlgebroid.html#TauCeti.LazardRing.coproduct_coassoc) satisfy the Hopf-algebroid equations.

### Notable definitions and infrastructure

- **Formal group homomorphisms and isomorphisms** [`FormalGroupHom`](https://taucetiproject.org/docs/TauCeti/RingTheory/FormalGroup/Hom.html#TauCeti.FormalGroupHom) and [`FormalGroupIso`](https://taucetiproject.org/docs/TauCeti/RingTheory/FormalGroup/Hom.html#TauCeti.FormalGroupIso), with a strictness class, follow the cited Mathlib shapes. Over a ℚ-algebra the logarithm is bundled as [the unique strict isomorphism to 𝔾ₐ](https://taucetiproject.org/docs/TauCeti/RingTheory/FormalGroup/Logarithm.html#FormalGroup.logIso). Height classification and F3's p-typical theory need these morphisms.
- **Height** [`FormalGroup.height`](https://taucetiproject.org/docs/TauCeti/RingTheory/FormalGroup/Height.html#FormalGroup.height) over characteristic-p fields is read from the [p-power degree of the first term of the p-series](https://taucetiproject.org/docs/TauCeti/RingTheory/FormalGroup/Height.html#FormalGroup.exists_order_nsmulSeries_eq_pow). It is ∞ for 𝔾ₐ, 1 for 𝔾ₘ, and invariant under field extension.
- **Points in topologically nilpotent elements** [`TopNilpotentPoint`](https://taucetiproject.org/docs/TauCeti/RingTheory/FormalGroup/TopNilpotentPoint.html#FormalGroup.TopNilpotentPoint) is the group of points that the README asks for, with the sum given by a convergent series. It is identified with the earlier power-series points.

### Roadmap coverage

**F1 is partial but close.** Done: the n-series, invariant differential, the ℚ-algebra logarithm and exponential (now bundled as a strict isomorphism), the formal inverse, base change, morphisms and isomorphisms, topologically nilpotent points, the ungraded and graded Lazard ring with its universal property, the any-ring cocycle lemma with uniqueness and its characteristic-two obstruction form, the indecomposables of L, additive power series in characteristic p, strict coordinate-change representability with its Hopf-algebroid equations, existence and uniqueness of the exponent-two logarithm, and height with base-extension invariance. Not done: L ≅ ℤ[x₁, x₂, …]; the exponent-two logarithm as a bundled `FormalGroupIso`, with base-change naturality and its graded real-orientation version; coordinate independence of height; and the classification over separably closed fields. **F2 through F6 are untouched**: complex orientations and Quillen's theorem, p-typical and Brown–Peterson theories, comodules and Adams–Novikov, Landweber exactness, chromatic localization and torus Euler cancellation.

## The frontier

- **Lazard's polynomial theorem** — lift the generators xₙ of I/I² to L and prove that the resulting map ℤ[x₁, x₂, …] → L is an isomorphism. For a connected graded ring, surjectivity should follow from the indecomposables computation; the integral independence argument is what remains.
- **Bundled exponent-two logarithm** — package the normalized logarithm and its inverse exponential as a strict `FormalGroupIso` to 𝔾ₐ, prove base-change naturality, and give the graded version with aᵢ in degree i.
- **Coordinate independence of height** — show that height is unchanged under isomorphism of formal group laws. The morphism API is now available.
- **Classification by height** — over a separably closed field of characteristic p, prove that two commutative formal group laws are isomorphic exactly when their heights agree. ModularCurves consumes this result.
- **Quillen's theorem (F2)** — the first layer beyond the algebra. It needs complex orientations and MU from GeneralizedCohomology, and Lazard's polynomial theorem for the coefficient comparison.
