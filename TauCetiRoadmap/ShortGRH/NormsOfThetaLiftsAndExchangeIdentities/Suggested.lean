import Mathlib

/-!
# Norms of theta lifts and exchange identities for one lift: target signatures

This file is not the roadmap. The definitive document for this folder is `README.md`. This file
states the roadmap's headline theorems against the pinned Mathlib and Tau Ceti. None of them is
statable at the pins, for the reasons below; so nothing is stated here.

Every headline is a statement about the admissible data of
OneSidedPrimeSumBoundsAndAdmissibleData and about objects over the CM field of the data: the
unitary groups of Hermitian spaces with their adelic points and levels, algebraic forms on the
definite ones with their Petersson products and Hecke operators at split places, the Weil
representation of a unitary pair with its theta kernels and theta lifts, and characters of the
norm-one idele class group with their partial Hecke L-values. Mathlib has, at the pin, the unitary
group of matrices over a ring with involution (`Matrix.unitaryGroup`) and the adele ring of a
number field; Tau Ceti has Hecke characters of number fields. Neither has a theta kernel, a Weil
representation of a unitary pair, or a space of algebraic forms on a definite unitary group.

* The cost of one lift (7.5 (d)): the height of the family of ratios of Gram determinants of one
  lift along a regular family of twists. It needs the lifts, the forms and the families of twists
  of DeterminantsOfThetaLiftChains §1.3.
* The squared norm of the lift of a character from `U(1)` as a Hecke L-value (2.3), and the height
  of the inverse ratio of a main pair (6.5): they need theta lifts from `U(1)` to a definite
  unitary group and the L-values above.
* The third exchange (4.3 (a)) and the spanning of products (4.6 (d)): they need theta series on
  the adelic points of a unitary group and the exchange identity of
  DeterminantsOfThetaLiftChains, Layer 3.
* The vanishing of the periods of false lifts over a block (5.4), and the seesaw identity and the
  orthogonality of the glued forms to the false lifts (7.3 (a), (c)): they need the forms, the
  Hecke polynomial operators and the descents above.

The statements of 1.4 and 1.5 on the denominator of a projection in a finite-dimensional inner
product space with an integral structure are statable on Mathlib's carriers; they are steps towards
7.4 and 7.5, not headlines, and no signature is given for them in this file.
-/

namespace TauCetiRoadmap.ShortGRH.NormsOfThetaLiftsAndExchangeIdentities

end TauCetiRoadmap.ShortGRH.NormsOfThetaLiftsAndExchangeIdentities
