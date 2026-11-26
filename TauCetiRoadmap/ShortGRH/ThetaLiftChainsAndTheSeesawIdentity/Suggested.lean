import Mathlib

/-!
# Theta lift chains and the seesaw identity: target signatures

This file is not the roadmap. The definitive document for this folder is `README.md`. This file
states the roadmap's headline theorems against the pinned Mathlib and Tau Ceti. None of them is
statable at the pins, so nothing is stated here.

Every headline is a statement about automorphic forms on the unitary groups of Hermitian spaces
over the CM field `E` of the data of OneSidedPrimeSumBoundsAndAdmissibleData (the spaces `X_j`,
`Y_j`, `W_j` and `V_j` of 2.1), about the theta lifts between them with their kernels (Layer 1),
and about the source forms, target forms, chain data, composite lifts and the Poincaré map built
from these (Layer 2). Neither Mathlib nor Tau Ceti has these carriers at the pins. Mathlib has the
predicate `NumberField.IsCMField`, the adele rings `NumberField.AdeleRing` and
`IsDedekindDomain.FiniteAdeleRing`, and the unitary group `Matrix.unitaryGroup` of square matrices
over a ring with involution; this gives the points of `U(n)` in one coefficient ring, not the group
scheme of a Hermitian space over a number field, its adelic points with their topology and Haar
measures, its lattices and class sets, or the automorphic forms on it. Neither library has the
Weil representation of a unitary dual pair or its theta kernel; the theta series
`ZLattice.thetaSeries` of Tau Ceti, of a lattice in a real inner-product space, is not of this
kind.

* The seesaw identity (3.20): for every linear form `t` on the values of the forms on `X_0` and
  every archimedean point `g` of `U(Y_0)` there is `c ∈ ℂ^×` such that every twist `ϑ` has a chain
  datum `Ψ` (2.12) with `Θ_ϑ(𝒫_{g,t}φ) = c·comp_ϑ(Ψ)(φ)` for every ramified source form `φ`. It
  lacks the carriers above, and with them the lower chain `Θ_ϑ`, the Poincaré map `𝒫_{g,t}`, the
  chain data and the composite lift `comp_ϑ`.
-/

namespace TauCetiRoadmap.ShortGRH.ThetaLiftChainsAndTheSeesawIdentity

end TauCetiRoadmap.ShortGRH.ThetaLiftChainsAndTheSeesawIdentity
