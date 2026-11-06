module

public import Mathlib

/-!
# Algebraic curves — function fields, divisors, and Riemann–Roch: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states, against the pinned
Mathlib and Tau Ceti, the roadmap's headline theorems that the pinned libraries do not
already prove.

Every headline theorem of the roadmap is proved at the Tau Ceti pin and is cited at its
layer of the README by its pinned name, so this file states nothing: the trdeg
characterization `TauCeti.isFunctionField_iff_trdeg_eq_one` (Layer 0), the product formula
`TauCeti.Divisor.degree_principal` (Layer 3), the Riemann–Roch theorem
`TauCeti.isRiemannRochDivisor_weilDifferentialDivisor` (Layer 4), Clifford's theorem
`TauCeti.Divisor.two_mul_dim_le_degree_add_two` (Layer 5), the Hurwitz genus formula
`TauCeti.hurwitz_genus_formula` (Layer 7), the tensor-domain criterion
`TauCeti.isDomain_tensorProduct_of_separating`, genus invariance under finite separable
constant extension `TauCeti.genus_eq_genus_of_constantCompositum_eq_top` and genus
non-increase under algebraic constant extension
`TauCeti.genus_le_genus_of_constantCompositum_eq_top` (Layer 8), the one-dimensionality of
Kähler differentials `TauCeti.finrank_kaehlerDifferential_eq_one_of_separating` and the
residue theorem `TauCeti.finsum_traceResidue_kaehlerBasisOfSeparating_coord_eq_zero`
(Layer 9), the hyperelliptic genus `TauCeti.genus_eq_of_sq_eq` (Layer 10), finiteness of
the automorphism group in genus at least two `TauCeti.finite_algEquiv_of_two_le_genus` and
the Hurwitz bound `TauCeti.natCard_le_eighty_four_mul_genus_sub_one` (Layer 11), and the
regular projective model `TauCeti.AlgebraicGeometry.twoChartModel`, its projectivity
`AlgebraicGeometry.Scheme.isProjectiveOver_of_isCurveOver`, the anti-equivalence
`TauCeti.AlgebraicGeometry.RegularProjectiveCurveCat.equivFunctionFieldCat` and the
cohomological genus comparison `TauCeti.AlgebraicGeometry.twoChartModel.genus_eq_genus`
(Layer 12).
-/

@[expose] public section

namespace TauCetiRoadmap.AlgebraicCurves

end TauCetiRoadmap.AlgebraicCurves
