import Mathlib

/-!
# Siegel–Weil and Rallis formulas on unitary groups: target signatures

This file is not the roadmap. The definitive document for this folder is `README.md`. This file
states the roadmap's headline theorems against the pinned Mathlib and Tau Ceti. None of them is
statable at the pins, for the reasons below; so nothing is stated here.

Every headline is a statement over a CM field `E` with Weil data about hermitian spaces that are
standard at every finite place: their unitary groups over the adeles with levels, rational points
and quotient measures, the Weil representation of a unitary pair on the Banach space of data with
its theta functional, zero terms and theta lifts, automorphic forms of a type with their Petersson
products, and characters of the norm-one idele class group `U(1)` with weight, tame part and
partial Euler products. Mathlib has, at the pin, CM fields (`NumberField.IsCMField`), the adele
ring of a number field (`NumberField.AdeleRing`) and the unitary group of matrices over a ring with
involution (`Matrix.unitaryGroup`); Tau Ceti has Hecke characters of number fields
(`TauCeti.GlobalNumberFields.HeckeCharacter`). Neither library has, at the pin, the adelic unitary
group of a hermitian space with its levels and quotient measure, a Weil representation or a theta
functional, or characters of `U(1)` with weight and tame part.

* Neighbours, the series of translates and the vacuum sum (1.2–1.5): they need the finite adelic
  unitary group of the standard lattice `Ô^n` of a CM field, its neighbour vectors, its multiplier
  and the cosets of its levels, and, for 1.5, the characters of `U(1)` and the partial Euler
  products of their base changes.
* The Siegel–Weil formula in Weil's range (2.6), with the Siegel sets of 2.2 and the constancy
  theorem 2.7: they need the Weil representation of a pair on the space of data, the zero terms
  along rational Lagrangians, and integration over the quotient of an adelic unitary group.
* Siegel's formula for one vector and the ratio of masses (3.2–3.5): they need the Siegel–Weil
  formula above, class sums and masses over the double cosets of the finite adelic unitary group of
  the standard hermitian form, and the density of 3.1 (c), an integral over the self-adjoint finite
  adeles. The local density bounds (3.7, 3.8) need a product of completions of `E` with its
  involution, a Haar measure on its skew elements, and disintegrations of Haar measure along a
  hermitian form.
* The doubling identity, Rallis' inner product formula for rapidly decreasing forms and for sharp
  data, the injectivity of the theta lift and the reproducing formula (4.2–4.6): they need theta
  kernels and theta lifts between forms on adelic unitary groups and Petersson products.
* Singular forms (5.3): it needs the Fourier coefficients `f_{D,T}` of 5.1 (a) of a function on an
  adelic unitary group, which average the function against an additive character over the central
  unipotent elements `z_D(M)` attached to an isotropic frame.
* The constant term along a line (6.8) and the continuation and functional equation in absolute
  values (6.9): they need theta integrals of unitary pairs and split tame characters of `U(1)` with
  their partial L-functions `L^S(x, ν)`; 6.9 is about these partial L-functions on a real
  half-line, which neither library defines.
-/

namespace TauCetiRoadmap.ShortGRH.SiegelWeilAndRallisFormulasOnUnitaryGroups

end TauCetiRoadmap.ShortGRH.SiegelWeilAndRallisFormulasOnUnitaryGroups
