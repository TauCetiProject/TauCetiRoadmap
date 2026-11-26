import Mathlib

/-!
# Weil representations on Banach spaces of data: target signatures

This file is not the roadmap. The definitive document for this folder is `README.md`. This file
states the roadmap's headline theorems against the pinned Mathlib and Tau Ceti. None of them is
statable at the pins, for the reasons below; so nothing is stated here.

Every headline is a statement about the objects that the roadmap builds: the Banach space of data
of a hermitian space over a CM field with Weil data (3.1, 3.4), the action on it of the adelic
unitary group of the space, the theta functional, and the theta kernels and theta lifts of a
unitary dual pair (6.1, 6.4). Mathlib has, at the pin, CM fields (`NumberField.IsCMField`), the
adele ring of a number field (`NumberField.AdeleRing`), the unitary group of matrices over a ring
with an involution (`Matrix.unitaryGroup`) and the spaces `MeasureTheory.Lp`; Tau Ceti has Hecke
characters of number fields (`TauCeti.GlobalNumberFields.HeckeCharacter`). Neither has the adelic
unitary group of a hermitian space over a CM field with its rational points and heights, a
Heisenberg representation on a space of functions, a Weil representation, a theta functional, a
theta kernel or a theta lift.

* The adelic Weil representation (3.5, 3.6, 5.6): the representation of the adelic unitary group
  on the space of data, its operator bound and the theta functional invariant under the rational
  points. It needs Weil data (3.1), the space of data (3.4) and the adelic unitary group of the
  space with its rational points (AdelicUnitaryGroupsAndAlgebraicModularForms §3.1).
* Convergence and adjointness of theta lifts (6.4): although stated for any jointly continuous
  representation on a Banach space with an invariant functional, it needs the adelic unitary
  groups of two hermitian spaces, their heights (AdelicUnitaryGroupsAndAlgebraicModularForms
  §4.2), the quotient integrals and the automorphic, rapidly decreasing functions with their
  Petersson products.
* Rapid decay (6.6): it needs the theta kernels of a pair (6.1), data named by Schwartz–Bruhat
  functions above a set of places (5.4) and the moments of Fock vectors (2.3).
* Lifts between discrete-series types (7.2, 7.3): they need the discrete-series kernels of
  HolomorphicDiscreteSeriesOfUnitaryGroups §4.1, forms of a type
  (AdelicUnitaryGroupsAndAlgebraicModularForms §5.1), the Fock model at the real places (2.1) and
  the theta lifts of 6.4.
* Seesaw, unfolding and periods (7.4, 8.8, 8.9, 8.10): they need theta lifts; 8.8 also needs the
  Bessel groups of graded spaces (8.1) and the constant terms of data (8.7), and 8.9 and 8.10 the
  splittings of 5.1 and the terms of theta kernels at rational matrices (6.12).
* The unramified correspondence at split places (9.3): it needs the Hecke polynomial operators of
  9.2 on representations of the finite adelic unitary group and the Weil representation of a
  pair (6.1).
-/

namespace TauCetiRoadmap.ShortGRH.WeilRepresentationsOnBanachSpacesOfData

end TauCetiRoadmap.ShortGRH.WeilRepresentationsOnBanachSpacesOfData
