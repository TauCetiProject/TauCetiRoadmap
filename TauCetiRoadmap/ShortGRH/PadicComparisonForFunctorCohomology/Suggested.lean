import Mathlib

/-!
# p-adic comparison for the cohomology of functors on test rings: target signatures

This file is not the roadmap. The definitive document for this folder is `README.md`. This file
states the roadmap's headline theorems against the pinned Mathlib and Tau Ceti. None of them is
statable at the pins, for the reasons below; so nothing is stated here.

Every headline is a statement about the cohomology of functors on test rings of
CohomologyOfFunctorsOnTestRings: `Ext` groups, among functors to abelian groups, out of the free
abelian functor on the points of a scheme restricted to test rings, with locally constant or Witt
vector coefficients, and the space `Vⁿ(Y) = ℚ_p ⊗ Hⁿ(Y_Ω, ℤ_p)` with its Galois action. Mathlib has,
at the pin, `Ext` in abelian categories (`CategoryTheory.Abelian.Ext`), the tilt (`PreTilt`),
Fontaine's map (`WittVector.fontaineTheta`), `ℂ_p` (`PadicComplex`) and proper morphisms of schemes
(`AlgebraicGeometry.IsProper`); Tau Ceti has integral perfectoid rings
(`TauCeti.Perfectoid.IsIntegralPerfectoid`). Neither has test rings, the category of `p`-adic tests
(products of `p`-complete absolutely integrally closed valuation rings over the integers of `ℂ_p`),
the cohomology `Vⁿ(Y)`, charted schemes, or the period rings `A_max` and `B_max` of
CrystallineRepresentationsAndKisinModules §1.3.

* The primitive comparison (5.2): it needs test rings, `p`-adic tests with their tilts, schemes
  charted over a field, and the cohomology of points on tests with the tilted coefficients
  `S ↦ S♭ ⊗ M`.
* The period map (5.5), with the finiteness and continuity of `Vⁿ(Y)` (5.3): it needs in addition
  `Vⁿ(Y)` with its Galois action, and period ring pairs with their coefficients
  `K ⊗_Λ (Λ ⊗_{A_inf} W(S♭))^` on `p`-adic tests.
* The Hodge–Tate weights of the values of the Hodge–Tate map (6.5): it needs the Hodge cohomology
  of functors on algebras (CohomologyOfFunctorsOnTestRings §6.1), Hodge–Tate pairs and the
  Hodge–Tate map `λ_h` of 6.3, and the period map of 5.5.
* Crystallinity and the Frobenius congruence relation (7.6): it needs `B_max`, crystalline
  representations and the linear Frobenius of CrystallineRepresentationsAndKisinModules §§3.1, 3.7,
  besides `Vⁿ(Y)` and its period map.

The statements of 3.1 on derived completeness for one element are statable on Mathlib's modules;
they are steps towards 3.2, not headlines, and no signature is given for them in this file.
-/

namespace TauCetiRoadmap.ShortGRH.PadicComparisonForFunctorCohomology

end TauCetiRoadmap.ShortGRH.PadicComparisonForFunctorCohomology
