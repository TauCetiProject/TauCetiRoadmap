import Mathlib
import TauCeti.Geometry.Neuromanifold.MLP.Polynomial

/-!
# Neuromanifolds, parametrisations and neurovarieties: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states, against the pinned Mathlib
and Tau Ceti, the roadmap's headline theorems that the pinned libraries do not already prove.

Every headline theorem of the roadmap is statable at the pins, and all but one are proved at the
Tau Ceti pin, where the README cites them by name instead of restating them here:

* parameters modulo equality of realised functions are in bijection with the neuromanifold,
  `TauCeti.Neuromanifold.quotientEquiv` (Layer 1);
* over an infinite integral domain, two parameters of a jointly polynomial model realise the
  same function exactly when the coefficients of its outputs in the input variables agree,
  `TauCeti.Neuromanifold.polynomialCoefficientMap_eq_iff`, and the neuromanifold is the image of
  the coefficient image under evaluation,
  `TauCeti.Neuromanifold.realizedFunctions_polynomialRealization` (Layer 3);
* permuting the neurons of a hidden layer of a bias-free monomial MLP, or rescaling them with the
  compensating power on the next layer, preserves the realised function,
  `TauCeti.Neuromanifold.MLPSpec.hiddenSymmetrySetoid_le_parameterSetoid` (Layer 3);
* the neurovariety and the closed-image property do not depend on the linear coordinates or the
  degree bound of the coefficient presentation, `TauCeti.Neuromanifold.neurovariety_linearEquiv_comp`
  and `TauCeti.Neuromanifold.neurovariety_extendByZero_comp` (Layer 4);
* the coefficient image of every real jointly polynomial model is semialgebraic,
  `TauCeti.Neuromanifold.isSemialgebraic_range_polynomialCoefficientCoordinates`, through Tau
  Ceti's projection theorem for `ℝ` (Layer 4);
* the real model `x ↦ w² x` has coefficient image `[0, ∞)`, which is not Zariski closed,
  `TauCeti.Neuromanifold.not_isAlgebraicImage_const_sq` (Layer 4).

The remaining headline, homogeneity in the inputs of the output polynomials of a bias-free
monomial MLP (Layer 3, §3.6), is stated below.
-/

namespace TauCetiRoadmap.Neuromanifolds

open TauCeti.Neuromanifold

/-! ## Layer 3: polynomial models and faithful coefficient coordinates -/

/-- **Homogeneity of bias-free monomial MLPs** (README §3.6; Finkel–Rodriguez–Wu–Yahl,
arXiv:2408.04569v4, Definition 1 for the networks). Let `A` be the MLP specification of depth
`L` with widths `d` whose hidden layer `j + 1` has activation `t ↦ t ^ r j` and whose output
layer is linear. Substitute zero for every bias and read each output coordinate of the network
as a polynomial in the input variables whose coefficients are polynomials in the weights. Each
of these polynomials is homogeneous of degree `∏ j, r j`, the product of the hidden exponents
(the empty product `1` when `L ≤ 1`). The zero polynomial is homogeneous of every degree, so
nothing is claimed about the total degree.

The route is induction along the layers: the inputs are homogeneous of degree `1`, a linear
layer without bias preserves the degree, and the power `t ↦ t ^ r` multiplies it by `r`. -/
theorem isHomogeneous_inputPolynomial_polynomialRealizeWeights_monomial {K : Type*}
    [CommSemiring K] {L : ℕ} (d : Fin (L + 1) → ℕ) (r : Fin (L - 1) → ℕ)
    (o : Fin (d (Fin.last L))) :
    (inputPolynomial ((MLPSpec.monomial d r : MLPSpec K L).polynomialRealizeWeights
      fun j => Polynomial.X ^ r j) o).IsHomogeneous (∏ j, r j) := by
  sorry

end TauCetiRoadmap.Neuromanifolds
