import Mathlib
import TauCeti.AlgebraicGeometry.AdicSpace.Spa.Analytic
import TauCeti.AlgebraicGeometry.AdicSpace.FarguesFontaine.Quotient

/-!
# FarguesFontaineDiamonds: representative target signatures

The roadmap is README.md, the definitive specification. This file records suggested forms
for a subset of its targets, not an exhaustive checklist. Every signature uses carriers
available in the pinned Mathlib and Tau Ceti. The geometric product, Frobenius quotient,
sites, analytic Cartier divisors and enhanced coefficient comparisons are specified in the
README. Their constructions and their full geometric hypotheses belong to those targets.

The theorem here states the algebraic compatible-root equation with unit denominators.
Library checks pin the existing Witt, valuation, Frobenius-window and orbit-space
vocabulary, and the normed-ring results used by the geometric targets.
-/

noncomputable section

namespace TauCeti.FFDiamond

universe u

#check WittVector.map
#check WittVector.map_teichmuller
#check WittVector.fontaineTheta
#check WittVector.fontaineTheta_teichmuller
#check WittVector.frobeniusEquiv
#check TauCeti.ValuationSpectrum
#check TauCeti.ValuationSpectrum.spaAnalytic_eq_spa_of_isTateRing
#check TauCeti.FarguesFontaine.spaY
#check TauCeti.FarguesFontaine.windowU
#check TauCeti.FarguesFontaine.windowV
#check TauCeti.FarguesFontaine.frobeniusHomeomorph
#check TauCeti.FarguesFontaine.spaX
#check TauCeti.FarguesFontaine.quotientMap
#check TauCeti.FarguesFontaine.quotientMap_eq_iff
#check Ideal.IsPrime.mul_mem_iff_mem_or_mem
#check Ideal.span_singleton_mul_left_unit
#check Ideal.span_singleton_eq_top
#check AddMonoidHomClass.antilipschitz_of_bound
#check AddMonoidHom.mulLeft
#check AntilipschitzWith.injective
#check AntilipschitzWith.isClosed_range

/-! ## Layer F4: compatible roots for the untilt divisor -/

/-- Quotients of compatible p-power root families with unit denominators satisfy the
same transition equations. This is the algebraic step of the README target
`root_annulus_tilt` (FS, proof of II.1.1, p.48). -/
theorem compatibleRoots_ratio_pow {B : Type u} [CommRing B]
    (pRoot varpiRoot ratioRoot : ℕ → B) (p : ℕ)
    (hRatio : ∀ m, ratioRoot m * varpiRoot m = pRoot m)
    (hp : ∀ m, pRoot (m + 1) ^ p = pRoot m)
    (hv : ∀ m, varpiRoot (m + 1) ^ p = varpiRoot m)
    (hunit : ∀ m, IsUnit (varpiRoot m)) :
    ∀ m, ratioRoot (m + 1) ^ p = ratioRoot m := by
  sorry

/-
The README specifies the remaining geometric interfaces in their own layers:
F0: analytic_interface, qp_factorisation, chart_category_interface;
F1: bounded_witt_theta, affinoid_product, point_naturality, product_iso,
    projection_field_naturality;
F2: frobenius_equivariance, adic_graph_relation, diamond_graph_relation,
    diamond_quotient_cover, effective_quotient, quotient_iso, quotient_spatiality_choices;
F3: chart_site_compatibility, sheaf_descent, finite_cover_descent;
F4: AnalyticCartierIdeal, IsClosedCartier, analytic_cartier_closed_iff,
    section_untilt_equiv, primitive_equation_interface, root_extension_frame,
    root_annulus_tilt, boundary_supremum, multiplication_lower_bound,
    rational_strict_exactness, untilt_closed_divisor,
    untilt_sheaf_exactness, curve_untilt_divisor, untilt_quotient_sections_field,
    untilt_orbit_invariance;
F5: completed_derived_equiv, ordinary_bounded_below, completed_global_sections,
    derived_pullback_tensor, adic_derived_equiv, adic_global_sections.
-/

end TauCeti.FFDiamond
