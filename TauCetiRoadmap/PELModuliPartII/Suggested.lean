module

import Mathlib

/-!
# Siegel and PEL moduli problems, part II: target signatures

The roadmap is `README.md`; this file is not the roadmap. It is the roadmap's acceptance test: it
states, against the pinned Mathlib and Tau Ceti, the headline theorems that the finished roadmap
will prove. None of them is statable at the pins, so this file states nothing; each headline is
listed here with the carrier it lacks.

* Formal smoothness of the unramified unitary Rapoport–Zink space `N_n` of relative dimension
  `n - 1` (README §1.2), regular semistable reduction of the almost self-dual space (§2.2), formal
  smoothness of the exotic space over every finite extension of `ℚ_p` (§3.4) and its two connected
  components (§3.7), and regular semistable reduction of the Krämer space (§5.7). They lack a
  category of formal schemes and formal smoothness of their morphisms (Tau Ceti's
  `TauCeti.FormalScheme.Spf` gives only the underlying space and the structure sheaf of an affine
  formal spectrum), and strict formal `O`-modules or `p`-divisible groups over a base, with their
  relative duals and polarizations.
* Finite étaleness of the integral CM moduli at every prime (§6.6). It lacks abelian schemes over a
  base with an `O_F`-action, the Kottwitz condition on their Lie algebras, polarizations of a given
  type, and Deligne–Mumford stacks; Tau Ceti's `AbelianVariety` is over a field only.
* Smoothness, quasi-projectivity and projectivity of the localized, exotic and neat unitary
  integral models (§§7.6, 7.7, 8.7), their regular semistable reduction at Krämer and almost
  self-dual places (§§7.8, 7.9, 8.4). They lack the same abelian schemes with PEL structure over a
  base, their moduli functors and the PEL moduli of PELModuli and ShimuraCompactifications.
* The basic-locus uniformizations (§§9.5–9.10). They lack, besides the above, completions of a
  scheme along a closed subset as formal schemes and quotients of formal schemes by discrete
  groups.
* The Tate–Dieudonné comparison for basic CM pairs (§9.1). Its hypothesis, that the two
  `𝔭`-parts are isoclinic of the same slope, and its `p`-adic conclusion need the rational
  Dieudonné modules (isocrystals) of abelian varieties over `F̄_p`, which are not at the pins:
  Mathlib's `WittVector.Isocrystal` is the abstract notion, with no functor from abelian varieties.
  The `ℓ`-adic side alone could be assembled from Tau Ceti's Tate module of an abelian group, but
  without the hypothesis the statement is false (README §9.1, Checks).
-/

namespace TauCetiRoadmap.PELModuliPartII

end TauCetiRoadmap.PELModuliPartII
