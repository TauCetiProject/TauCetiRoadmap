import Mathlib

/-!
# Cohomology of functors on test rings: target signatures

This file is not the roadmap. The definitive document for this folder is `README.md`. This file
names the roadmap's headline theorems and says why none of them is stated against the pinned
Mathlib and Tau Ceti; so no Lean signature is stated here.

Every headline is a statement about Ext groups in a category of functors to abelian groups: on
test rings (1.2, 1.3) for the first three, on Hodge pairs (6.1) for the last two. Mathlib has, at
the pin, the Ext groups of an abelian category (`CategoryTheory.Abelian.Ext`), which exist for
categories of functors to abelian groups by `CategoryTheory.HasExt.standard`, the free abelian
group functor `AddCommGrpCat.free`, and the divisibility condition `PreValuationRing`. Neither
library has, at the pin, absolutely integrally closed rings, the category of test rings, the
coefficient functor of locally constant functions on spectra of test rings (`LC_Λ` of 1.3), or the
properness of functors on rings of 1.4 (a). Each headline would first need these objects as
definitions with bodies, which this file does not contain.

* Proper base change, 4.3 (a): besides the objects above, it needs the closed fibre of a functor
  over a local ring (1.3).
* The projective line formula for `ℤ/ℓ` coefficients, 5.5 (c): it also needs the functor `ℙ¹` of
  5.1, tests over a ring (1.3), and the class `η` of 5.1, an `Ext²` class on the category of points
  of `ℙ¹` built from the Kummer sequence and the cocycle of `O(1)`.
* Smooth base change, 5.6 (b): it also needs tests over a ring and the charting condition of
  1.4 (d), defined through étale charts, open subfunctors and closed classes of functors.
* The fixed point formula, 6.6 (c): it needs the category of Hodge pairs and Hodge cohomology (6.1),
  the classes of points `cl(w)` of 6.3, defined through Grothendieck's symbol and the existence of
  local classes, and the scaled graph and Jacobian ratios of 6.6.
* The Woods Hole formula, vanishing half, 7.5: it needs Hodge cohomology and the Hodge–Tate maps
  `λ_h` of PadicComparisonForFunctorCohomology §6.3, built on `p`-adic tests, which neither library
  has.
-/

namespace TauCetiRoadmap.ShortGRH.CohomologyOfFunctorsOnTestRings

end TauCetiRoadmap.ShortGRH.CohomologyOfFunctorsOnTestRings
