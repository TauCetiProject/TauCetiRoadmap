import Mathlib

/-!
# Implicit atlases and rational virtual fundamental classes: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti, and none of them is statable at the pins, so
the file states nothing. The headline theorems, and what each lacks, are:

* The comparison of virtual cohomology with Čech cohomology of the virtual orientation sheaf
  (Layer V3.4) and the virtual fundamental class with its finite-subatlas independence (Layer
  V4.3). Both need the implicit-atlas structure of Layer V1 (equivariant thickenings,
  coordinate changes on zero fibers, quotient, freeness, product-projection and covering
  axioms), the virtual cochain complex of Layer V2 (TopologicalSheafCohomology TS5's flag total
  of relative invariant singular chains on deformation spaces) and cover-colimit Čech cohomology
  with sheaf coefficients on compact Hausdorff spaces (TopologicalSheafCohomology TS1). None
  exists at the pins: Mathlib's `CategoryTheory.cechComplexFunctor` is the Čech complex of one
  fixed cover, and the virtual class is a functional constructed from these complexes.
* The boundary law, cobordism and refinement invariance, regular-manifold normalization and the
  Euler comparison (Layer V5). They need the virtual class, relative Čech cohomology of the pair
  (X, ∂X) and, for the Euler comparison, the zero-set atlas of a smooth section.
* The stratified quasi-isomorphism and the product formula (Layer V6). They need cell-like
  stratified atlases, the stratified virtual complex, and the rational Čech external product on
  compact Hausdorff spaces with coefficients in rank-one local systems.
* The fiber-product identity between the virtual class of a transverse fiber product and the
  virtual class of the product evaluated on a supported Gysin image (Layer V7.3). It needs
  fiber-product atlases, supported Čech cohomology with its excision and tautness comparisons,
  and the diagonal Thom class of CharacteristicClasses §C2.

Invariance of domain, which Layer V6.2 uses, is stated by AbelianSchemesAndArithmeticModuliPartII
§B2.9 and is not a headline of this roadmap.
-/

namespace TauCetiRoadmap.ImplicitAtlases

end TauCetiRoadmap.ImplicitAtlases
