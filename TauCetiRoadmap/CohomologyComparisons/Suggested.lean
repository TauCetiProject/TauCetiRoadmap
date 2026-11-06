import Mathlib

/-!
# p-adic cohomology comparisons: target signatures

**This file is not the roadmap.** The roadmap is `README.md`, which carries every target,
API list and Check. This file is the roadmap's acceptance test: it states the headline
theorems against the pinned Mathlib and Tau Ceti, each with `sorry`; it states no theorem because none is statable at the pins.

No headline theorem can be stated against the pinned Mathlib and Tau Ceti libraries.
The missing objects are mathematical constructions, rather than abbreviations of the
available coefficient rings or ordinary derived categories:

* The integral smooth specialization diagram (Layer 1), good-reduction crystalline
  comparison (§§3.3–3.5), torsion inequalities and integral lattice recovery (Layer 5)
  require formal schemes with their special and generic fibres, AΩ cohomology,
  crystalline cohomology and Breuil–Kisin–Fargues modules.
* Hodge–de Rham and Hodge–Tate degeneration (§§2.14–2.15), the relative infinitesimal
  comparisons and analytic F-crystal equivalence (§§2.19–2.24), and the relative filtered
  comparison (§6.3) require rigid analytic de Rham complexes, the relative infinitesimal
  site and analytic prismatic F-crystals with their realizations.
* The nearby-cycle pullback (§3.8) requires syntomic coefficients, filtered derived
  de Rham cohomology and the nearby-cycle sheaf. The semistable, algebraic Beilinson and
  proper rigid C_st comparisons (§§4.3–4.12), including log-prismatic agreement (§4.6),
  require log-crystalline, prismatic and Hyodo–Kato realizations and semistable periods.
* Trace, cycle, Gysin and higher Chern compatibility (§§6.4–6.8) require the geometric
  class and trace maps in these cohomology theories.
* The shared canonical-subgroup theorem and perfectoid modular tower (§6.2) require
  abelian schemes with Hasse invariants and finite flat subgroup geometry. Pan's graded,
  almost-integral and finite-period comparisons (§§6.11–6.15) require that tower, its
  Hodge–Tate map, logarithmic period sheaves and completed cohomology.

Mathlib supplies scheme pro-étale cohomology, Witt vectors, Fontaine's theta map and the
rings BDeRhamPlus and BDeRham. These do not supply the formal or rigid analytic
realizations above. Definitions of coefficient maps, scalar monodromy transport,
truncated module lengths or a formal Chern polynomial cannot state these comparison
results without the missing geometric objects.
-/

namespace TauCetiRoadmap.CohomologyComparisons

end TauCetiRoadmap.CohomologyComparisons
