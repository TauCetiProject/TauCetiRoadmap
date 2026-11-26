import Mathlib

/-!
# Congruences of twisted theta lifts: target signatures

This file is not the roadmap. The definitive document for this folder is `README.md`. This file
states the roadmap's headline theorems against the pinned Mathlib and Tau Ceti. None of the five
headlines of the README's Summary is statable at the pins, for the reasons below; so nothing is
stated here.

* Regular families of twists (7.3) and the bound for denominators (6.9): statements about the
  admissible data of OneSidedPrimeSumBoundsAndAdmissibleData, the algebraic forms on the definite
  unitary groups of Hermitian spaces over the CM field of the data, their theta lifts, the
  projections onto the spaces of lifts and the denominators of these projections at a prime `ℓ`.
  Neither Mathlib nor Tau Ceti declares, at the pins, spaces of automorphic forms on adelic unitary
  groups with their Hecke operators, or theta lifts between them.
* Ribet's element (6.5) and main summands (2.8): statements about `ℓ`-adic representations of the
  absolute Galois group of a CM field that are conjugate self-dual of a level, with Hodge–Tate
  jumps and killing polynomials at the places above `ℓ` (1.1, 1.2), and about the representations
  attached to Hecke eigensystems of forms on definite unitary groups. The local conditions above
  `ℓ` are defined through the period ring `B_max` (SelmerBoundsForAnticyclotomicTwists §3.1), and
  neither library declares a crystalline period ring (`B_cris` or `B_max`); the attached
  representations need the forms of the previous item.
* Taylor–Wiles places in a triangle (4.3): a statement about the even classes of the Tate twists
  `(O/ℓ^ν)(−e)` over the CM field of the data and about Frobenius data at auxiliary places, in the
  sense of the definitions of 4.1 and of the filter of most Frobenius data (1.1). These are
  definitions of this roadmap and of its background, built on modules of cocycles of the absolute
  Galois group with local conditions; they are not encoded here.

Layer 3 (Ribet's method to first order: 3.2 to 3.7) is algebra over a group and a discrete
valuation ring, and its statements could be written on Mathlib's carriers, with Tau Ceti's
`Submodule.minorsIdeal` for the Fitting ideal of 3.1 (1). They are steps towards 6.5, not headlines,
and they are stated in terms of the trace ideals, tie ideals, triangle costs and Ribet cocycles
defined in 3.1; no signature is given for them in this file.
-/

namespace TauCetiRoadmap.ShortGRH.CongruencesOfTwistedThetaLifts

end TauCetiRoadmap.ShortGRH.CongruencesOfTwistedThetaLifts
