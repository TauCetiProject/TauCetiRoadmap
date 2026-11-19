module

import Mathlib

/-!
# Springer resolutions and characteristic cycles: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the simple
definitions they need. None of the headline theorems is statable at the pins, so this file
declares nothing; for each headline, the list below says which carrier is missing.

The pins supply part of the vocabulary. Mathlib has schemes, fibre products, the locally finite
cycle group `AlgebraicGeometry.AlgebraicCycle`, module length, adic completion, Coxeter systems
with `CoxeterSystem.length`, sheaves of modules and derived categories. Tau Ceti has the Bruhat
order `CoxeterSystem.BruhatLE`, split reductive groups as `TauCeti.ReductiveCommHopfAlgCat`, Borel
Hopf ideals `TauCeti.HopfIdeal.IsBorel`, the fppf quotient sheaf
`CommHopfAlgCat.fppfHomogeneousQuotient` (with no representability), and Verma modules
`TauCeti.VermaModule` with their irreducible quotients for Killing-semisimple Lie algebras.
They do not supply the following, and nothing is stated in place of the headlines that need them.

* Properness of the Grothendieck simultaneous resolution and its finite étale Weyl covering over
  the regular semisimple locus (README §2.3), the reduced local complete intersection double
  incidence scheme and its Weyl-labelled components (§§3.7–3.8), the birational component
  projections (§3.9), Cohen–Macaulayness of the components and flatness of the Cartan maps
  (§§4.3–4.4), and geometric normality of the components (§5.4). These lack the flag scheme `G/B`
  of a split reductive group (the scheme representing the fppf quotient), its associated Borel Lie
  bundle and the incidence schemes `g̃ ⊂ G/B × 𝔤` and `X = g̃ ×_𝔤 g̃` built from it.
* The field and reductive-centre comparisons of the Springer resolution and the conormal
  description of the Steinberg components (§§6.1–6.5). These lack the flag scheme, the nilpotent
  cone as the zero fibre of the adjoint quotient of a split reductive group, and the cotangent and
  conormal bundles of schemes.
* Filtration-independence of characteristic cycles of coherent D-modules (§§8.4–8.6), Kashiwara's
  equivalence and the Bernstein inequality (§§9.2–9.3), finite length of holonomic modules and
  intermediate extension (§§9.5–9.6). These lack the sheaf of algebraic differential operators on
  a smooth scheme (neither library has a ring of differential operators, nor the Weyl algebra),
  its module categories, good filtrations and the associated graded sheaf on the cotangent bundle.
* Beilinson–Bernstein localisation and its equivariant principal-block form (§§10.1–10.4). These
  lack the sheaf of differential operators on the flag scheme, the localisation functor, and the
  category of strongly equivariant regular holonomic modules.
* The Verma characteristic-cycle identity, triangularity of simple cycles and the three integral
  bases (§§11.1, 11.2, 11.4). These lack the localised Verma and simple D-modules and the reduced
  Steinberg variety with its component cycles.
* The Kazhdan–Lusztig multiplicity theorem `[M(w w₀ · 0) : L(v w₀ · 0)] = P_(w₀ w, w₀ v)(1)`
  (§11.3). This lacks the Hecke algebra of a Coxeter system with its Kazhdan–Lusztig basis and
  polynomials, and composition multiplicities in the principal block of category O: Tau Ceti's
  Verma modules carry no finite-length theory or category-O structure.
* Partial-flag saturation of simple cycles (§12.2). This lacks the parabolic quotient `G/P_w`
  as a scheme, the smooth pullback of D-modules, and the Steinberg components carrying the simple
  cycles.
* Formal detection of the Cartan graph and the zero-operator tangent bound with its smoothness
  criterion (§§13.3–13.5). These lack the incidence components, the Cartan graphs and the
  induced maps of completed local schemes, and the tangent spaces of the incidence components and
  of the Bruhat orbit closures.
* The completed Kazhdan–Lusztig cycle identity (§§14.2–14.4). This lacks the Cartan zero fibres
  of the incidence components, the simple-cycle coefficients and the completed local schemes of
  the Steinberg components.
-/

namespace TauCetiRoadmap.SpringerResolutionAndCharacteristicCycles

end TauCetiRoadmap.SpringerResolutionAndCharacteristicCycles
