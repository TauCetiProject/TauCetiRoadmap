import Mathlib

/-!
# Igusa varieties, compactified period fibres and torsion concentration: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. This file states the roadmap's headline theorems against the pinned Mathlib and
Tau Ceti; none is statable at the pins, so it declares nothing.

No headline theorem is statable against Mathlib `6b7abb3` and Tau Ceti `a91d3aa`:

* The integral PEL representative, universal-cover automorphism and central-leaf dimension
  theorems (Layer 0), and the Igusa tower and cohomology comparisons (Layer 1), require
  p-divisible groups with PEL structures, central leaves and Igusa varieties. These carriers
  are absent.
* The affineness and boundary-stratum theorems for partial Igusa compactifications (Layer 2)
  require the Igusa towers, their partial compactifications and Ekedahl–Oort strata.
* The PEL tensor transport of the crystalline comparison, the integral Hodge–Tate
  classification with PEL structures and the Hecke, local Shimura and spectral-centre adapters
  (3.0a–3.0i) require relative Fargues–Fontaine curves with bundles, PEL p-divisible groups,
  Artin v-stacks, local Shimura towers, lisse coefficient categories and Hecke functors.
* The compactified Hodge–Tate period-fibre theorems and Mantovan filtration (3.17–3.27)
  require perfectoid Shimura varieties, period maps and Igusa cohomology.
* The two Igusa degree bounds (4.9–4.10), the genericity-forces-ordinarity theorem (5.6),
  Pink's formula and the boundary length obstruction (6.5–6.7) require the Igusa cohomology
  complexes, nearby cycles and their geometric Hecke actions.
* Caraiani–Scholze vanishing and its integral, irreducible and middle-degree forms
  (7.5–7.8), and the Caraiani–Newton export (7.15), require the unitary Shimura spaces, their
  local systems and boundary cohomology with the specified Hecke actions.
* Supercuspidal support and lifting (7.9), the parameter comparisons and elliptic local trace
  (7.9a–7.9b), parameter irrelevance, central support and Koshikawa local vanishing
  (7.10–7.11), and the ordinary comparison and global vanishing (7.12–7.14) require smooth
  parabolic induction for inner forms, the geometric excursion action and local Shimura
  cohomology, as well as the Shimura period geometry.

Mathlib's linear `WittVector.Isocrystal`, scheme étale sites and `DerivedCategory`, and
Tau Ceti's reductive group schemes, Hecke rings and topological Frobenius orbit space,
provide parts of the foundations. They do not provide the geometric objects or functors
in these statements. Defining them is the substantive work of the specified layers and
suppliers, rather than a few auxiliary definitions needed to state a theorem.
-/

namespace TauCetiRoadmap.IgusaVarietiesAndTorsionConcentration

end TauCetiRoadmap.IgusaVarietiesAndTorsionConcentration
