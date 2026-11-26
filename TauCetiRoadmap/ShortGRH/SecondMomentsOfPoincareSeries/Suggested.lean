import Mathlib

/-!
# Second moments of Poincaré series: target signatures

This file is not the roadmap. The definitive document for this folder is `README.md`. This file
states the roadmap's headline theorems against the pinned Mathlib and Tau Ceti. None of them is
statable at the pins, so nothing is stated here.

Every headline is a statement about filling data over a CM field (4.1) or about the data of
OneSidedPrimeSumBoundsAndAdmissibleData: the unitary group of a Hermitian space over a CM field,
with its points over the finite adeles, open compact subgroups and their reduction at chosen
places, automorphic forms on it and on the definite groups `U(X₀)` and `U(W_j)`, and Bessel
functions of discrete series of the real unitary groups `U(p, q)` (Layer 3). Neither Mathlib nor
Tau Ceti has these carriers at the pins. Mathlib has the predicate `NumberField.IsCMField`, the
adele rings `NumberField.AdeleRing` and `IsDedekindDomain.FiniteAdeleRing`, and the unitary group
`Matrix.unitaryGroup` of square matrices over a ring with involution; this gives the points of
`U(n)` in one coefficient ring, not the group scheme of a Hermitian space over a number field, its
adelic points with their topology and Haar measures, its lattices and class sets, or the
automorphic forms on it. Neither library has a square-integrable representation or a formal degree.

* The second moments of the operators `P*·s·P` and the good forms (4.15), on admissible filling
  data.
* The dimension of the target (5.6), through the equality of multiplicities of Layer 2.
* The second moment of the Poincaré map of the data and one good translate (5.7).

All three lack the carriers above. The statements of Layer 1 on spreading maps, for a finite group
acting unitarily on a finite-dimensional inner-product space, are statable in Mathlib; they are
steps of the route to 5.7 and to Theorem B of OneSidedPrimeSumBoundsAndAdmissibleData, not
headlines, and are not stated here.
-/

namespace TauCetiRoadmap.ShortGRH.SecondMomentsOfPoincareSeries

end TauCetiRoadmap.ShortGRH.SecondMomentsOfPoincareSeries
