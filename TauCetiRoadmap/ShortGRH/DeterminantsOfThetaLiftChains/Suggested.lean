import Mathlib

/-!
# Determinants of theta lift chains: target signatures

This file is not the roadmap. The definitive document for this folder is `README.md`. This file
states the roadmap's headline theorems against the pinned Mathlib and Tau Ceti. None of them is
statable at the pins, so nothing is stated here.

Every headline is a statement about automorphic forms on unitary groups of Hermitian spaces over
the CM field `E` of the data of OneSidedPrimeSumBoundsAndAdmissibleData, about theta lifts and
theta integrals between them, and about Hecke L-values of characters of `U(1)`. Neither Mathlib nor
Tau Ceti has these carriers at the pins. Mathlib has the predicate `NumberField.IsCMField`, the
adele rings `NumberField.AdeleRing` and `IsDedekindDomain.FiniteAdeleRing`, and the unitary group
`Matrix.unitaryGroup` of square matrices over a ring with involution; this gives the points of
`U(n)` in one coefficient ring, not the group scheme of a Hermitian space over a number field, its
adelic points with their topology and Haar measures, its lattices and class sets, or the
automorphic forms on it. Neither library has the Weil representation of a unitary dual pair or its
theta kernel.

* Theorem C (6.3): for linearly independent target forms `y₁, …, y_n` with `n ≥ (1 − 4/b²)·d`, of
  index at most `δ` and covolume at most `c` in the twisted lattice of the target forms,
  `d·(h_main − 3·f·a·(log b)⁴) ≤ c + 2δ`.
* Its inputs: the norm of one lift (2.2), the exchange identity (3.9), and the norm of the chain of
  lifts with its two determinants (4.4).

All of them lack the carriers above, and with them the target forms, the chains `Θ_ξ` and their
twisted lattice.
-/

namespace TauCetiRoadmap.ShortGRH.DeterminantsOfThetaLiftChains

end TauCetiRoadmap.ShortGRH.DeterminantsOfThetaLiftChains
