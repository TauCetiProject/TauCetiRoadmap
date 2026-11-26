module

public import Mathlib
public import TauCeti.LinearAlgebra.Matrix.GeneralLinearGroup.Diagonal.Basic

/-!
# Algebraic modular forms and Serre weights, Part II: target signatures

The roadmap is README.md; this file is not the roadmap. It states the roadmap's
headline theorems against the pinned Mathlib and Tau Ceti APIs.

One headline is statable on native carriers. The arbitrary-level degree of the
literal determinant-p double coset, the tame intersection index times p+1, is
stated with the pinned subgroup index, conjugation action, special linear
reduction maps and diagonal general linear elements. The small symmetric-power
irreducibility used by Layer 8 is a supplier's theorem (ArithmeticGaloisRepresentations
§7.8) and is imported, not restated here.

The following headline theorems are not statable at the pins:

* The all-component integral genus-two expansion principle and saturation lack
  the integral Siegel model, automorphic coefficient sheaves and cusp charts.
* Genus-two rank geometry and simple primary Hasse zeros lack the polarized
  integral Siegel models and their rank strata and crystalline deformation maps.
* Global secondary Hasse extension on spherical and paramodular levels and the
  spherical Cartier square root lack the BT1 crystal, determinant sheaves and
  nonordinary surface carriers.
* Equivariant torsion Hasse weight shifts and the two-affine minimal cover lack
  the Siegel section modules, Hasse sections and minimal formal model.
* Integral residual Hecke coefficients and the corrected Q2 theorem lack the
  covariant all-component binary-index series with transported tame markings,
  the local unramified p-correspondence with identity tame component, and its
  comparison with the rational GSp4 coefficient action. Only the degree of the
  literal rational binary double coset is stated below; its comparison with the
  local branches on the marked cusp family lacks these carriers.
  A scalar operator identity on arbitrary endomorphisms would not state this theorem.
* Oriented neighbor reciprocity at tame level lacks the marked binary-index
  local-branch and literal-coset correspondences with their distinct tame
  multiplicities, coefficient maps and cusp transports.
* Integral geometric T and Q2 actions with finite and K/O coefficients and
  formal Hartogs lack the integral coherent isogeny correspondences, the
  associated bundle cohomology and the open formal-model comparison.
* Geometric scalar and vector theta, and superspecial nonvanishing, lack the
  genus-two logarithmic de Rham bundle, connection, strata and section modules.
* Negative-weight vanishing and scalar/vector low-weight theta injectivity lack
  those geometric section modules and the normalized geometric theta maps.
* Saturated ordinary expansions, the injective integral classical comparison
  and the normalized marked Klingen pullback–trace comparison lack the full
  genus-two Igusa tower, its function module and the correspondence retaining
  disjointness from its multiplicative Klingen marking.

No formal-series substitute or proposition-valued proxy is asserted for these
geometric theorems.
-/

@[expose] public section

namespace TauCetiRoadmap.AlgebraicModularFormsAndSerreWeightsPartII

open Matrix
open scoped MatrixGroups Pointwise

/-! ## Layer 5: Formal coefficient operators and Q₂ -/

/-- Literal determinant-p cosets at arbitrary tame congruence level (README §5.2). Let `p` be
prime, `N` prime to `p`, and `Γ(N) ≤ Γ ≤ SL₂(ℤ)`. Let `Γ_ℚ` be the image of `Γ` in `GL₂(ℚ)`,
`H` the image of the reduction of `Γ` modulo `N` in `GL₂(ℤ/N)`, and `g = diag(p, 1)` both in
`GL₂(ℚ)` and in `GL₂(ℤ/N)`. Then the degree `[Γ_ℚ : Γ_ℚ ∩ g Γ_ℚ g⁻¹]` of the double coset
`Γ g Γ` is `p + 1` times the tame index `[H : H ∩ g H g⁻¹]`. This refines the tame-level
coset count accompanying CG20, Lemma 8.3. -/
theorem relIndex_conj_diag_eq_tameIndex_mul (N p : ℕ) (hp : p.Prime) (hpN : p.Coprime N)
    (Γ : Subgroup SL(2, ℤ)) (hΓ : CongruenceSubgroup.Gamma N ≤ Γ) :
    (ConjAct.toConjAct (TauCeti.diagGL (ι := Fin 2)
          ![Units.mk0 (p : ℚ) (by exact_mod_cast hp.ne_zero), 1]) •
        Γ.map (SpecialLinearGroup.mapGL ℚ)).relIndex (Γ.map (SpecialLinearGroup.mapGL ℚ)) =
      (p + 1) *
        (ConjAct.toConjAct (TauCeti.diagGL (ι := Fin 2) ![ZMod.unitOfCoprime p hpN, 1]) •
            (Γ.map (SpecialLinearGroup.map (Int.castRingHom (ZMod N)))).map
              SpecialLinearGroup.toGL).relIndex
          ((Γ.map (SpecialLinearGroup.map (Int.castRingHom (ZMod N)))).map
            SpecialLinearGroup.toGL) := by
  sorry

end TauCetiRoadmap.AlgebraicModularFormsAndSerreWeightsPartII
