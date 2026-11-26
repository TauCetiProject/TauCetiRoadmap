import Mathlib

/-!
# Divisibility of derivatives of theta functions of CM lattices: target signatures

This file is not the roadmap. The definitive document for this folder is `README.md`. This file
states the roadmap's headline theorems against the pinned Mathlib and Tau Ceti. Two of the three
headlines are not statable at the pins, and the third is not stated either, for the reason given
below; so nothing is stated here.

* The count (3.3): for a prime `p` that does not split in `K = ℚ(√−d)` and a power series `F` over
  `ℂ_p` in the entries of matrices `z_τ`, one for each infinite place `τ` of `E`, of the normal
  form of 2.4, the jet of `F` along a product of minors of shape `κ` has valuation at least the
  predicted divisibility `D_p(κ)`, up to the loss `f·N³·(1 + log_p B)`. The normal form, the
  couplings `Γ_e` with their partners `−p^e·τ`, the products of minors of a diagram with a filling
  and the number `D_p(κ)` are definitions of this roadmap (2.4, 3.1); written out from Mathlib's
  multivariate power series (`MvPowerSeries`) they form a long ad hoc encoding of the setting of
  2.4 and 3.1, which is not made here.
* Divisibility of standard data (4.10, 4.11) and sharpness (5.6): statements about the jets of
  theta functions of vectors in the Weil representation of a definite Hermitian space over the CM
  field `E`, and, for 5.6, about the admissible data of OneSidedPrimeSumBoundsAndAdmissibleData.
  Neither Mathlib nor Tau Ceti has the Weil representation of a unitary dual pair, its models or its
  theta functions at the pins; the theta series `ZLattice.thetaSeries` of Tau Ceti, of a lattice in
  a real inner-product space, is not of this kind.

The statements of Layer 1 on the field `E` and its characters are steps of the routes of the
family, not headlines, and are not stated here.
-/

namespace TauCetiRoadmap.ShortGRH.DivisibilityOfThetaDerivatives

end TauCetiRoadmap.ShortGRH.DivisibilityOfThetaDerivatives
