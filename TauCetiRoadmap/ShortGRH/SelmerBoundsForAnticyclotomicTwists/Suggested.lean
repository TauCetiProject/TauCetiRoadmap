import Mathlib

/-!
# Selmer bounds for anticyclotomic twists: target signatures

This file is not the roadmap. The definitive document for this folder is `README.md`. This file
states the roadmap's headline theorems against the pinned Mathlib and Tau Ceti. Neither of the two
headlines of the README's Summary is statable at the pins, for the reasons below; so nothing is
stated here.

* The twisting theorem (5.4; general form 2.7): for finitely many `ℓ`-adic representations of
  main-summand type there is one `m`-fold twist all of whose first `m` powers have small
  ramification, make the twisted Selmer groups short and keep the ratios of twisted to untwisted
  Hecke `L`-values barely divisible by `ℓ`. The statement of 5.4 is about the admissible data of
  OneSidedPrimeSumBoundsAndAdmissibleData §3.2, their tame characters of `U(1)` and the `L`-values
  of ramified pairs (DeterminantsOfThetaLiftChains §1.1), main summands and Selmer lengths with
  divisible coefficients (CongruencesOfTwistedThetaLifts §§1.3, 1.5), and cocycles that obey the
  crystalline relations above `ℓ` (4.1). The general form 2.7 is about Selmer data and
  Stickelberger systems (1.1, 2.3), which are definitions of this roadmap built on cocycles of the
  absolute Galois group of a CM field and on class groups of `U(1)`. Neither Mathlib nor Tau Ceti
  declares these carriers at the pins, and they are not encoded here.
* The defect of the dual of a summand at a place above `ℓ` (4.6, through 3.6 and 3.7): a bound for
  the length by which the crystalline cocycles of a lattice over a local Galois group fail to be
  orthogonal, under cup products, to those of a class of lattices. Crystalline cocycles and the
  classes of lattices are defined through the period ring `B_max` (3.1). Neither
  Mathlib nor Tau Ceti declares a crystalline period ring (`B_cris` or `B_max`) at the pins.

The statements of Layers 1 to 3 that precede these (the descent 1.5, the estimate at roots of unity
2.6, the exponent bounds 3.3 to 3.5) are steps of the route, not headlines, and are not stated here.
-/

namespace TauCetiRoadmap.ShortGRH.SelmerBoundsForAnticyclotomicTwists

end TauCetiRoadmap.ShortGRH.SelmerBoundsForAnticyclotomicTwists
