import Mathlib

/-!
# Belyi maps, dessins d'enfants, and three-point covers: target signatures

This file is not the roadmap; the roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib and Tau Ceti, as far as the pinned carriers make
them statable, and declares the two group-theoretic lemmas of README §Pinned conventions that the
PeripheralActions roadmap consumes by name (`conjugation_transfer` and
`opposite_third_peripheral`).

## Headline theorems proved in Tau Ceti

These are not restated here; README.md names each one at its milestone. The names are those of
Tau Ceti revision `2fd255d997f4`, the revision README §Exact supplier contracts declares.

* Layer 3.2, the Frobenius product-one formula:
  `TauCeti.card_productOneTriples_eq_sum_characterTable`.
* Layer 3.4, the passport-size formula:
  `TauCeti.PassportSpec.passportSize_eq_genCountType_mul_card_centralizer_div_card_normalizer`.
* Layers 4.4 and 4.5, the trichotomy of triangle groups:
  `TauCeti.TriangleGroup.finite_iff_isSphericalParameterSignature` and
  `TauCeti.TriangleGroup.infinite_of_inv_add_inv_add_inv_lt_one`.
* Layer 5.6, the fundamental group of the thrice-punctured sphere:
  `TauCeti.ThricePuncturedSphere.fundamentalGroupMulEquivFreeGroup`.
* Layer 6.3, the classification of its finite covers at three levels:
  `TauCeti.ConnectedFiberNumberedCoverClass.tripleEquiv`,
  `TauCeti.ConnectedCoverClass.isoClassEquiv` and
  `TauCeti.ConnectedPointedCoverClass.markedClassEquiv`.
* Layer 7.7, topological branched covers are classified by their unbranched parts:
  `TauCeti.TopBranchedCover.IsoClass.restrict_bijective`.
* Layer 8.6, analytic Riemann existence for three-point covers:
  `TauCeti.AnalyticBelyiPair.isoClassEquivConnectedIsoClass`.
* Layer 10.3, Belyi's polynomial lemma:
  `TauCeti.exists_polynomial_aeval_mem_criticalValues_subset`.
* Layer 10.4, a curve over an algebraic extension of `ℚ` admits a Belyi map:
  `TauCeti.IsFunctionField.exists_isAlgebraicBelyiPair`.
* Layer 13.5, faithfulness in its polynomial form:
  `TauCeti.exists_polynomial_criticalValues_subset_comp_ne_map`.

## Headline theorems not stated here

* Layer 13.5 (`Gal(ℚ̄/ℚ)` acts faithfully on isomorphism classes of algebraic Belyi pairs over
  `ℚ̄`). Its statement is `FaithfulSMul` of `AlgebraicClosure ℚ ≃ₐ[ℚ] AlgebraicClosure ℚ` on
  `TauCeti.AlgebraicBelyiPair.IsoClass (AlgebraicClosure ℚ)`, for the Galois action that the module
  `TauCeti.FieldTheory.FunctionField.Belyi.GaloisAction` declares. Tau Ceti has that module, and
  the carrier `TauCeti.AlgebraicBelyiPair`, from revision `2fd255d997f4`; the revision this
  repository's `lake-manifest.json` pins for this file has neither, and Mathlib has no algebraic
  Belyi pair, so the statement cannot be written against it.
* Layer 9.8 (analytic and algebraic Belyi pairs over `ℂ` have the same isomorphism classes),
  Layer 10.7 (every algebraic Belyi pair over `ℂ` is the base change of one over `ℚ̄`) and Layer
  11.6 (a pair with trivial automorphism group is defined over its field of moduli). Besides the
  carriers `TauCeti.AnalyticBelyiPair` and `TauCeti.AlgebraicBelyiPair`, absent from the pinned
  revision as above, each needs a construction of the roadmap that revision `2fd255d997f4` does
  not have either: the algebraic pair of an analytic pair, which rests on the bijection between
  points and places (README 9.4, 9.5); base change of a pair along the transcendental extension
  `ℚ̄ ⊂ ℂ` (README 9.1C); and the field-of-definition certificate, a pair over a number field
  with an isomorphism of its base change (README 11.5).
* Layer 12.6 (the geometric fundamental group is the profinite completion of `FreeGroup (Fin 2)`)
  and Layer 12.11 (the branch-cycle theorem). There is no carrier for the Galois group of the
  maximal extension of `ℚ̄(t)` unramified outside the three marked places, nor for the outer
  Galois action on it; each is a construction of the roadmap (README 12.5, 12.8), not a simple
  definition.
* Layers 13.3 and 13.4 (the outer Galois action on the free pro-`ℓ` group of rank two is
  peripheral of cyclotomic exponent). They need the descended outer action of Layer 13.1, which
  rests on the carriers of Layers 12.5 and 12.8.
-/

namespace TauCetiRoadmap.BelyiMaps

universe u

/-! ## Pinned conventions -/

/-- **§Pinned conventions, the third peripheral element in the opposite convention.** A source
writing `P · T · C' = 1` has third peripheral element `C' = (P * T)⁻¹`, and this is the conjugate
`P * C * P⁻¹` of the roadmap's `C = (T * P)⁻¹`, **not** `P⁻¹ * C * P`. It is a word identity in
any group. -/
theorem opposite_third_peripheral {G : Type u} [Group G] (P T : G) :
    (P * T)⁻¹ = P * ((T * P)⁻¹) * P⁻¹ := by group

/-- **§Pinned conventions, the conjugation-transfer lemma.** Let `φ` be an automorphism of a group
`G` and `pow` a self-map of `G` commuting with conjugation. If `φ x = c⁻¹ * pow x * c`, then for
every `q` the image of the conjugate `q * x * q⁻¹` is the conjugate of `pow (q * x * q⁻¹)` by the
**computed** element `q * c * (φ q)⁻¹`, which involves `φ q` and is not `c` multiplied by `q` on
one side. Layer 13.3 applies it with `pow` a pro-`ℓ` power, at `q = P` and `x = C`, to pass to the
opposite convention for the third peripheral element. -/
theorem conjugation_transfer {G : Type u} [Group G] (φ : G ≃* G) (pow : G → G)
    (hpow : ∀ q x : G, pow (q * x * q⁻¹) = q * pow x * q⁻¹)
    {x c : G} (hx : φ x = c⁻¹ * pow x * c) (q : G) :
    φ (q * x * q⁻¹) =
      (q * c * (φ q)⁻¹)⁻¹ * pow (q * x * q⁻¹) * (q * c * (φ q)⁻¹) := by
  have h : φ (q * x * q⁻¹) = φ q * (c⁻¹ * pow x * c) * (φ q)⁻¹ := by
    simp [map_mul, map_inv, hx]
  rw [h, hpow]
  group

end TauCetiRoadmap.BelyiMaps
