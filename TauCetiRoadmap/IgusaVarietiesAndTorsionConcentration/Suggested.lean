import Mathlib

/-!
# Igusa varieties, compactified period fibres and torsion concentration: headline targets

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`.

No headline theorem is statable against Mathlib `6b7abb3` and Tau Ceti `a91d3aa`:

* The integral PEL representative, universal-cover automorphism and central-leaf dimension
  theorems (IG.0), and the Igusa tower and cohomology comparisons (IG.1), require p-divisible
  groups with PEL structures, central leaves and Igusa varieties. These carriers are absent.
* The affineness and boundary-stratum theorems for partial Igusa compactifications (IG.2)
  require the Igusa towers, their partial compactifications and Ekedahl–Oort strata.
* The curve-bundle classification, integral Hodge–Tate classification and geometric spectral
  action (IG.F) require relative Fargues–Fontaine curves with bundles, PEL p-divisible groups,
  Artin v-stacks, local shtukas and their lisse coefficient categories and Hecke functors.
* The compactified Hodge–Tate period-fibre theorems and Mantovan filtration
  (IG.3.17–IG.3.27) require perfectoid Shimura varieties, period maps and Igusa cohomology.
* The two Igusa degree bounds (IG.4.9–IG.4.10), genericity-forces-ordinarity theorem
  (IG.5.6), Pink formula and boundary length obstruction (IG.6.5–IG.6.7) require the actual
  Igusa cohomology complexes, nearby cycles and their geometric Hecke actions.
* Caraiani–Scholze vanishing and its integral, irreducible and middle-degree forms
  (IG.7.5–IG.7.8), and the Caraiani–Newton export (IG.7.15), require the unitary Shimura
  spaces, their local systems and boundary cohomology with the specified Hecke actions.
* Supercuspidal support and lifting (IG.7.9), parameter irrelevance and Koshikawa local
  vanishing (IG.7.10–IG.7.11), and the ordinary comparison and global vanishing
  (IG.7.12–IG.7.14) require smooth parabolic induction for inner forms, the geometric
  excursion action and local-shtuka cohomology, as well as the Shimura period geometry.

Mathlib's linear `WittVector.Isocrystal`, scheme étale sites and `DerivedCategory`, and
Tau Ceti's reductive group schemes, Hecke rings and topological Frobenius orbit space,
provide parts of the foundations. They do not provide the geometric objects or functors
in these statements. Defining them is the substantive work of the specified layers and
suppliers, rather than a few auxiliary definitions needed to state a theorem.
-/

namespace TauCetiRoadmap.IgusaVarietiesAndTorsionConcentration

end TauCetiRoadmap.IgusaVarietiesAndTorsionConcentration
