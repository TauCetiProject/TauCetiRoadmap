module
import Mathlib

/-!
# Main conjectures for modular forms and their families, part II: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti APIs. None is statable with only a few simple
definitions at these pins, so this module has no declarations. The missing arithmetic objects
for each headline are:

* Kato's rational main conjecture for every CM newform and every prime (README §8.6), and the
  elliptic-unit generator at height zero (§7.8): the native `HeckeRing.GL2.Newform` has no
  attached Galois realization; its cyclotomic arithmetic Iwasawa cohomology, zeta morphism and
  Beilinson–Kato submodule are absent. The unmarked module structure is supplied by
  KatoEulerSystems §4.4 and is not a second target here.
* The rational equivariant equality with tame Euler factors (§6.2): native ray class fields
  and Artin reciprocity exist as `TauCeti.ClassFieldTheory.rayClassField` and
  `TauCeti.ClassFieldTheory.rayClassArtinEquiv`, but the norm limits of their p-units and class
  groups, CM theta values and elliptic-unit classes do not.
* The scalar Tamagawa theorem and the integral all-prime character-wise equality
  (§§4.2–4.5): the arithmetic two-variable cohomology complexes, fundamental lines, perfect
  complex determinants and elliptic zeta classes are absent.
* Rubin's two-variable theorem and normalized classical form (§4.8): the arithmetic norm limits
  of local units, closed global and elliptic units and ramified Galois modules are absent.
* The Katz main conjecture, its corrected one-variable control and anticyclotomic components
  (§§5.1–5.4), and Katz's functional equation and lambda identity (§5.5): the Katz measure,
  CM Coleman map and arithmetic control maps are absent, besides those norm-limit modules.
* The de Rham-normalized CM comparison and the elliptic-unit/Beilinson–Kato bridge (§§7.2,
  8.1–8.4): the canonical CM-pair realizations, their period comparisons and the arithmetic
  elliptic-unit classes are absent. A bare representation or measure would not state these headlines.
-/

namespace TauCetiRoadmap.ModularIwasawaMainConjecturesPartII

end TauCetiRoadmap.ModularIwasawaMainConjecturesPartII
