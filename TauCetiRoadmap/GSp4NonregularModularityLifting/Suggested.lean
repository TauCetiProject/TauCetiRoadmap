module

public import Mathlib

/-!
# Minimal modularity lifting for GSp₄ in nonregular weight: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's
headline theorems against the pinned Mathlib and Tau Ceti whenever every carrier in a
statement exists at the pins or is a simple definition on native objects. None of the
headline theorems is statable at the pins, so this file declares nothing. Mathlib and Tau Ceti
carry no Siegel threefold, no Siegel modular form, no coherent automorphic coefficient, no
`GSp₄`-valued Galois representation attached to an automorphic form and no Galois deformation
ring at the pins; every headline below mentions at least one of them.

The headline theorems and the carrier each lacks:

* Minimal `R = T` with positive-rank cuspidal freeness in weight `(a,2)` (§§8.2–8.3) and
  classical modularity of ordinary crystalline lifts of weight `(a,2)`, `a ≥ 4` (§8.5): the
  cuspidal coherent sections `H⁰(X₁(Q), ω(a,2)(−D))` of the compactified Siegel threefold with
  their normalized integral Hecke actions, the selected cuspidal Hecke algebra, the universal
  fixed-multiplier symplectic deformation ring and Siegel cusp forms with their Galois
  representations.
* The two Hasse-projection injections (§4.8), the scalar and vector theta operators with
  their injectivity (§4.2) and the secondary Hasse section (§3.2): the mod `p` Siegel
  threefold, its Hasse invariants, automorphic bundles, Gauss–Manin connection and
  `q`-expansions.
* All-degree characteristic-zero interpolation and qualified crystalline specialization
  (§§2.3–2.4): coherent eigensystems of the Siegel threefold and the crystalline period
  functors.
* The ordinary weight-two Galois representation, its pure monodromy upgrade, dual-spin
  overconvergent interpolation and completed-eigenspace isotypy (§§2.5–2.8): automorphic
  local parameters, `GSp₄` pseudocharacters and higher-Coleman completed eigenspaces.
* The regular Hecke-valued representation (§3.5) and the singular minimal deformation
  (§5.2): integral coherent Hecke images and the local deformation data at `p`.
* The finite-coefficient Klingen comparison (§6.4) and selected balance (§7.4):
  compactified Klingen covers, their pullback and trace maps, and the selected coherent
  module with its integral `p`-idempotent.
* Variable-weight ordinary `R = T` and control (§9.2), ordinary `p`-adic modularity (§9.3)
  and parallel parabolic lifting (§9.4): Siegel Hida families and universal ordinary
  deformation rings.
* Characteristic-zero local freeness (§10.7), multiplicity one at regular points (§11.3),
  support and four-chamber rank one (§§11.4–11.5) and classical weight-two modularity
  lifting (§11.6): the four higher-Hida modules, their arithmetic specialization, Hecke
  support and the higher-Coleman classicality criterion.

The nondegenerate ordinary-root condition (§0.1) and the `R`-regular weight predicate (§11.1)
are statable, but each is a polynomial condition on free field or integer variables rather
than a headline, so they stay in the README as targets with their Checks.
-/

namespace TauCetiRoadmap.GSp4NonregularModularityLifting

-- No target is statable at the pins; see README.md.

end TauCetiRoadmap.GSp4NonregularModularityLifting
