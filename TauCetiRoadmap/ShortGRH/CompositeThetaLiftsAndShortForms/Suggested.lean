import Mathlib

/-!
# Composite theta lifts and short forms: target signatures

This file is not the roadmap. The definitive document for this folder is `README.md`. This file
states the roadmap's headline theorems against the pinned Mathlib and Tau Ceti. None of them is
statable at the pins, so nothing is stated here.

Every headline is a statement about the source forms, algebraic modular forms on the definite
unitary group `U(X₀)` of a Hermitian space over the CM field `E` of the data of
OneSidedPrimeSumBoundsAndAdmissibleData, about the Hecke operators acting on them, and about their
composite lifts, combinations of chains of theta lifts between definite unitary groups restricted
to `Y_m` (ThetaLiftChainsAndTheSeesawIdentity Layer 2). Neither Mathlib nor Tau Ceti has these
carriers at the pins. Mathlib has the predicate `NumberField.IsCMField`, the adele rings
`NumberField.AdeleRing` and `IsDedekindDomain.FiniteAdeleRing`, and the unitary group
`Matrix.unitaryGroup` of square matrices over a ring with involution; this gives the points of
`U(n)` in one coefficient ring, not the group scheme of a Hermitian space over a number field, its
adelic points, its lattices and class sets, or the automorphic forms on it. Neither library has
the Weil representation of a unitary dual pair or its theta kernel.

* Divisibility at each prime (4.9): numbers `err(p) ≥ 0` with `Σ_p err(p)·log p ≤ f·a·(log b)³`
  over every finite set of primes such that, for every prime `p` and every embedding `ι : ℂ → ℂ_p`,
  the integral ramified source forms have a submodule of colength at most `err(p)·dim` on which
  every composite lift with a twist of modulus prime to `p` has `ι`-adic valuation at least
  `gain(p) − err(p)`.
* Size (5.4): for the trivial twist, a bound for the squared norms of all Galois conjugates of the
  values of the composite lift of `φ` by those of `φ`, the main amount, the total remainder and the
  gains.
* Short forms (5.7): the ramified source forms are spanned by forms integral at every prime whose
  values have all conjugates of squared norm at most `exp(f·a·(log b)³)`.

All three lack the carriers above. Layer 1 is algebra over a Frobenius cycle that serves the
colength bound of 4.9; its statements are steps of that route, not headlines, and are not stated
here.
-/

namespace TauCetiRoadmap.ShortGRH.CompositeThetaLiftsAndShortForms

end TauCetiRoadmap.ShortGRH.CompositeThetaLiftsAndShortForms
