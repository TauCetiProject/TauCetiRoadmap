module

import Mathlib

/-!
# Higher Hida and Coleman theory: target signatures

The roadmap is README.md; this file is not the roadmap. It states the roadmap's
headline theorems against the pinned Mathlib and Tau Ceti APIs whenever their
carriers are available. None of the following headlines is statable at these pins:

* Derived arithmetic Hida control (README §4.6) and integral Iwasawa Serre duality
  (§4.8) for Siegel varieties of every genus lack the Siegel moduli schemes over
  `ℤ_(p)` with their normal toroidal models, the polarized ordinary Igusa towers, the
  supported coherent cohomology of automorphic bundles with its solid ordinary
  localization, and the universal perfect complex over the torus Iwasawa algebra
  built from them.
* Integral amplitude in genera one and two (§4.9) and rational amplitude in every
  genus (§8.4) lack the same universal Iwasawa complexes, and the second also the
  analytic overconvergent Siegel families compared with them.
* Regular and singular geometric classicality (§5.8) lacks abelian-type Shimura
  varieties, their Hodge–Tate period maps and Bruhat tubes, and finite-slope supported
  coherent cohomology with its Bruhat Cousin spectral sequence.
* The cohomological eigenvariety (§7.1) and the equidimensionality and deformation of
  interior eigenpackets (§7.5) lack rigid analytic weight spaces of torus characters,
  the analytic coefficient sheaves on Shimura varieties and their family cohomology.
* Sharp interior slope bounds (§7.6) and sharp Siegel slope bounds (§8.5) lack the
  finite-slope coherent cohomology of Shimura varieties on which the bounds are
  stated, and the integral supported overconvergent model of §8.1.
* The two-term Klingen control theorem (§9.8) lacks the Siegel threefold at Klingen
  level, its height-one Igusa tower, the one-variable partial-ordinary complex over
  `ℤ_p[[ℤ_p^×]]` and the ordinary coherent cohomology it specializes to.

Mathlib provides `DerivedCategory`, `CondensedMod` and `CondensedMod.IsSolid`, and Tau
Ceti the cohomology groups `TauCeti.AlgebraicGeometry.Scheme.Modules.Cohomology` of a
sheaf of modules on a scheme. Neither has Siegel moduli schemes or other Shimura
varieties, their toroidal compactifications, Igusa towers, coherent cohomology with
partial supports as a complex over an Iwasawa algebra, or analytic localization of
solid modules, so no weaker stand-in is stated here. The weight, chamber, slope and
normalization formulas specifying these constructions are targets and Checks in
README.md.
-/

namespace TauCetiRoadmap.HigherHidaAndColemanTheory

end TauCetiRoadmap.HigherHidaAndColemanTheory
