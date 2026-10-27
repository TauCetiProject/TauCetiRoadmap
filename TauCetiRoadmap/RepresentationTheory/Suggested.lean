import Mathlib

/-!
# Representation theory: target signatures

The roadmap is `README.md` in this folder; this file is not the roadmap. It states the headline
theorems of the family index against the pinned Mathlib and Tau Ceti.

The family index has no headline theorems of its own, so nothing is stated here. The index
`README.md` is the map of the family: it lists the member roadmaps and the order in which they
supply one another. Each member roadmap owns its headline theorems and states them in its own
`Suggested.lean`:

* `SemisimpleAlgebras/Suggested.lean` (Artin–Wedderburn, density, Skolem–Noether, the Brauer group);
* `CharacterTheory/Suggested.lean` (orthogonality and completeness of irreducible characters);
* `InductionRestriction/Suggested.lean` (Frobenius reciprocity, Mackey, Clifford theory);
* `ModularInduction/Suggested.lean` (Artin induction in `G₀(k[G])` in every characteristic);
* `RootSystems/Suggested.lean` (the Cartan–Killing classification of root systems);
* `AdoIwasawa/Suggested.lean` (faithful finite-dimensional representations over any field);
* `LieHighestWeight/Suggested.lean` (highest-weight classification, Weyl character formula);
* `ClassicalGroups/Suggested.lean` (Weyl construction, Schur polynomials as characters);
* `SchurWeyl/Suggested.lean` (Specht modules, hook-length formula, Schur–Weyl duality);
* `CompactGroups/Suggested.lean` (the Peter–Weyl theorem);
* `LieGroups/Suggested.lean` (the Lie correspondence, Lie's third theorem, Weyl integration);
* `SpinRepresentations/Suggested.lean` (Pin and Spin as double covers, spin representations);
* `QuiverRepresentations/Suggested.lean` (Gabriel's theorem).

Restating any of these here would plan a second time what a member roadmap already plans, and a
roadmap file may not import another roadmap's module, so this file states nothing.
-/

namespace TauCetiRoadmap.RepresentationTheory

end TauCetiRoadmap.RepresentationTheory
