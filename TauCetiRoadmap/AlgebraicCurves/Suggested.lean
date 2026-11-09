module

public import Mathlib
public import TauCeti.FieldTheory.FunctionField.RiemannRoch.Genus

/-!
# Algebraic curves — function fields, divisors, and Riemann–Roch: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states, against the pinned
Mathlib and Tau Ceti, the roadmap's headline theorems that the pinned libraries do not
already prove, on the pinned carriers `TauCeti.IsFunctionField` and `TauCeti.genus`.

Every headline theorem of the roadmap is statable at the pins, and all but one are proved at
the Tau Ceti pin, where the README cites them by name instead of restating them here:

* the trdeg characterization `TauCeti.isFunctionField_iff_trdeg_eq_one` (Layer 0);
* the product formula `TauCeti.Divisor.degree_principal`, Riemann's theorem
  `TauCeti.exists_forall_dim_eq_degree_add_one_sub_genus` and the genus of the rational
  function field `TauCeti.genus_ratFunc` (Layer 3);
* the Riemann–Roch theorem `TauCeti.isRiemannRochDivisor_weilDifferentialDivisor` (Layer 4);
* the finiteness of the degree-zero class group over a finite constant field
  `TauCeti.Divisor.finite_ker_degreeClass` (Layer 5), and Clifford's theorem over every exact
  constant field `TauCeti.Divisor.two_mul_dim_le_degree_add_two` (Layer 8);
* the Hurwitz genus formula `TauCeti.hurwitz_genus_formula` (Layer 7);
* genus invariance under finite separable constant extension
  `TauCeti.genus_eq_genus_of_constantCompositum_eq_top`, the tensor-domain criterion
  `TauCeti.isDomain_tensorProduct_of_separating`, genus non-increase under algebraic constant
  extension `TauCeti.genus_le_genus_of_constantCompositum_eq_top`, the genus-drop formula
  `TauCeti.genus_eq_genus_add_finsum_singularityDegree` and Hilbert's different formula
  `TauCeti.Place.differentExponent_eq_finsum_card_ramificationGroup_sub_one` (Layer 8);
* the one-dimensionality of Kähler differentials
  `TauCeti.finrank_kaehlerDifferential_eq_one_of_separating`, the Kähler–Weil comparison
  `TauCeti.kaehlerDifferentialEquivWeilDifferentialOfSeparating` and the residue theorem
  `TauCeti.finsum_traceResidue_kaehlerBasisOfSeparating_coord_eq_zero` (Layer 9);
* the genus of an elliptic curve `WeierstrassCurve.Affine.genus_functionField`, the
  hyperelliptic genus `TauCeti.genus_eq_of_sq_eq` and the plane-curve genus
  `TauCeti.genus_eq_of_isHomogeneous` (Layer 10);
* the Hurwitz bound `TauCeti.natCard_le_eighty_four_mul_genus_sub_one` (Layer 11);
* the anti-equivalence between regular projective curves and function fields
  `TauCeti.AlgebraicGeometry.RegularProjectiveCurveCat.equivFunctionFieldCat` and the
  comparison of the cohomological with the function-field genus
  `TauCeti.AlgebraicGeometry.SchemeWeilDivisor.genus_eq_genus_functionField` (Layer 12).

The pinned finiteness theorem for automorphism groups, `TauCeti.finite_algEquiv_of_two_le_genus`,
assumes an algebraically closed constant field on which the Weierstrass gaps at every place stay
pairwise distinct; that hypothesis fails for non-classical curves in positive characteristic.
The general theorem is stated below.
-/

@[expose] public section

namespace TauCetiRoadmap.AlgebraicCurves

universe u v

/-! ## Layer 11: automorphisms -/

/-- **Finiteness of the automorphism group in genus at least two** (Layer 11, the headline
finiteness theorem): over a perfect field `k`, a function field `F / k` with exact constants and
genus `g ≥ 2` has finitely many `k`-automorphisms, in every characteristic. Over an algebraically
closed field this is Rosenlicht's theorem (Trans. Amer. Math. Soc. 79 (1955), §2, Theorem); a
perfect `k` reduces to its algebraic closure, because `F ⊗[k] k̄` is a field of the same genus on
which every automorphism of `F` extends.

The genus hypothesis is load-bearing: `Aut(k(x) / k) ≅ PGL₂(k)` is infinite for infinite `k`, and
translations make the automorphism group infinite in genus `1` over an algebraically closed field.
Perfectness cannot simply be dropped: over a separably closed imperfect field of characteristic
`p ≥ 5`, the field `k(x, y)` with `y ^ p - y = a x ^ p` and `a ∉ k ^ p` has exact constants, genus
`(p - 1)(p - 2) / 2 ≥ 6` and infinitely many automorphisms `x ↦ x + β`, `y ↦ y + α` with
`α ^ p - α = a β ^ p` (Rosenlicht, §3). -/
theorem finite_algEquiv_of_two_le_genus {k : Type u} {F : Type v} [Field k] [Field F]
    [Algebra k F] [PerfectField k] (hF : TauCeti.IsFunctionField k F)
    (hex : IsIntegrallyClosedIn k F) (hg : 2 ≤ TauCeti.genus k F) :
    Finite (F ≃ₐ[k] F) :=
  sorry

end TauCetiRoadmap.AlgebraicCurves

end
