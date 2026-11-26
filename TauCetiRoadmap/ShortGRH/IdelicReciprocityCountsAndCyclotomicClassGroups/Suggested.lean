import Mathlib

/-!
# Roadmap: idelic reciprocity, cocycle counts and cyclotomic class groups: target signatures

This file is not the roadmap. The definitive document for this folder is `README.md`. This file
states the roadmap's headline theorems against the pinned Mathlib and Tau Ceti. None of them is
statable at the pins in a few lines, for the reasons below; so nothing is stated here.

All five are statements about the absolute Galois group of a number field read at the places of
one fixed algebraic closure, or about characters of its finite ideles. Mathlib has, at the pin,
the absolute Galois group `Field.absoluteGaloisGroup`, the decomposition and inertia subgroups of a
valuation subring (`ValuationSubring.decompositionSubgroup`, `ValuationSubring.inertiaSubgroup`),
the `p`-adic cyclotomic character `cyclotomicCharacter`, the finite adeles and `Module.length`.
Tau Ceti has local class field theory with an absolute Artin map
(`TauCeti.ClassFieldTheory.artinMap`), global class field theory at finite Galois layers
(`TauCeti.ClassFieldTheory.globalArtinMap`, with values in `Gal(L/K)^ab`), Hecke characters of
number fields (`TauCeti.GlobalNumberFields.HeckeCharacter`) and the `L`-function of a ray class
character (`TauCeti.LFunctions.heckeLFunctionC`). What each headline needs beyond this:

* The cocycle counts (4.4 (b) and 4.5 (d)): split places with Frobenius elements at places of the
  algebraic closure, the `N`-units of the closure, the trivialised cocycles of 4.1, the Selmer
  cocycles with local conditions of 3.1 and the module of relations of 4.5. None of these is in
  the pinned libraries, and each is a definition. Tau Ceti has Selmer groups of cohomology classes
  with local conditions (`TauCeti.ContCohomology.SelmerStructure.selmerGroup`), not modules of
  cocycles with conditions on functions on decomposition groups.
* Grunwald's theorem in prime exponent (6.1): the Artin map of 2.2 from the finite ideles to the
  abelianised absolute Galois group. At the pins the global Artin map exists only at finite Galois
  layers; the absolute map is assembled from these in 2.2.
* Hecke `L`-functions at `s = 1` (8.4): the partial Euler product `L^S(s, ψ)` of a character of the
  finite ideles with integral angular exponents, which in general has infinite order, and the
  prime densities of 8.1. The pinned `L`-functions of Hecke characters are those of characters of
  finite order, through their ray class characters.
* The `ℓ`-adic avatar (9.1): the avatar `r_θ`, built from the Artin map of 2.2 and the existence
  theorem 2.3 (c), and the local conditions at a place of the algebraic closure of
  GaloisRepresentationsOfUnitaryEigenforms §1.3 (finite type, Hodge–Tate jumps, polynomials killing
  Frobenius on the periods of CrystallineRepresentationsAndKisinModules §3.1). Tau Ceti has
  algebraic Hecke characters (`TauCeti.GlobalNumberFields.HeckeCharacter.IsAlgebraic`) but not
  their `ℓ`-adic characters, and neither library has the period ring `B_max`.
* The odd classes (10.7): the module `Sha_e(O, ν)` of 10.1, cocycles of the absolute Galois group of
  a CM field with values in `(O/ℓ^ν)(−e)`, unramified outside `ℓ`, with conditions on the inertia
  and decomposition groups above `ℓ` and odd under complex conjugation. It is a definition that
  neither library has, and the integer `X` of 10.7 is bounded through it.
-/

namespace TauCetiRoadmap.ShortGRH.IdelicReciprocityCountsAndCyclotomicClassGroups

end TauCetiRoadmap.ShortGRH.IdelicReciprocityCountsAndCyclotomicClassGroups
