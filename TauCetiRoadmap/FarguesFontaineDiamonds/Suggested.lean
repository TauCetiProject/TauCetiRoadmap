import Mathlib
import TauCeti.AlgebraicGeometry.AdicSpace.Spa.Analytic

/-!
# FarguesFontaineDiamonds: representative target signatures

The roadmap is README.md, the definitive specification. This file records suggested forms
for a subset of its targets, not an exhaustive checklist. Every signature uses carriers
available in the pinned Mathlib and Tau Ceti. The geometric product, Frobenius quotient,
sites, analytic Cartier divisors and enhanced coefficient comparisons are specified in the
README. Their constructions and their full geometric hypotheses belong to those targets.

The signatures here retain the algebraic compatible-root equation and the complete
normed-ring consequence of the divisor multiplication bound. In particular, a unit
denominator and a strictly positive lower bound are explicit hypotheses. Library checks
pin the existing Witt, valuation and ideal vocabulary used by the geometric targets.
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
#check Ideal.IsPrime.mul_mem_iff_mem_or_mem
#check Ideal.span_singleton_mul_left_unit
#check Ideal.span_singleton_eq_top
#check AntilipschitzWith.injective
#check AntilipschitzWith.isClosed_range

/-! ## Layer F4: algebraic and normed-ring milestones for the untilt divisor -/

/-- The compatible-root equation used in F4's root annulus: dividing two compatible
p-power root families by units preserves the transition equations. The full perfectoid
annulus and its tilt are specified by `root_annulus_tilt` in the README (FS II.1.1). -/
theorem root_annulus_tilt {B : Type u} [CommRing B]
    (pRoot varpiRoot ratioRoot : ℕ → B) (p : ℕ)
    (hRatio : ∀ m, ratioRoot m * varpiRoot m = pRoot m)
    (hp : ∀ m, pRoot (m + 1) ^ p = pRoot m)
    (hv : ∀ m, varpiRoot (m + 1) ^ p = varpiRoot m)
    (hunit : ∀ m, IsUnit (varpiRoot m)) :
    ∀ m, ratioRoot (m + 1) ^ p = ratioRoot m := by
  sorry

/-- Completeness and a positive lower bound make multiplication injective with closed
image. This is the normed-ring part of F4's `rational_strict_exactness`; the identification
with the untilt quotient pair and rational restriction maps is specified in the README. -/
theorem rational_strict_exactness {B : Type u} [NormedCommRing B] [CompleteSpace B]
    (xi : B) (c : ℝ) (hc : 0 < c) (hbound : ∀ b : B, c * ‖b‖ ≤ ‖xi * b‖) :
    Function.Injective (fun b : B => xi * b) ∧
      IsClosed (Set.range (fun b : B => xi * b)) := by
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
    boundary_supremum, multiplication_lower_bound, untilt_closed_divisor,
    untilt_sheaf_exactness, curve_untilt_divisor, untilt_quotient_sections_field,
    untilt_orbit_invariance;
F5: completed_derived_equiv, ordinary_bounded_below, completed_global_sections,
    derived_pullback_tensor, adic_derived_equiv, adic_global_sections.
-/

end TauCeti.FFDiamond
