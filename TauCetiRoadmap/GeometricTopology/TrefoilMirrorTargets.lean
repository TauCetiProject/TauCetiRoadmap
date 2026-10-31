import Mathlib.GroupTheory.PresentedGroup

/-!
# Trefoil reflection on the marked presentation

**This file is not the roadmap and is not exhaustive.** The README is definitive.
The generator map and peripheral words below are algebraic targets. Their
comparison with the realized trefoil exteriors and their oriented boundary
tori is an additional geometric target in the README.
-/

namespace TauCetiRoadmap.GeometricTopology.TrefoilMirror

/-- The word `xyx (yxy)⁻¹` in the native free group. -/
def relator : FreeGroup (Fin 2) :=
  FreeGroup.of 0 * FreeGroup.of 1 * FreeGroup.of 0 *
    (FreeGroup.of 1 * FreeGroup.of 0 * FreeGroup.of 1)⁻¹

abbrev Presentation := PresentedGroup ({relator} : Set (FreeGroup (Fin 2)))

def x : Presentation := PresentedGroup.of 0

def y : Presentation := PresentedGroup.of 1

def centralWord : Presentation := (x * y) ^ 3

def positiveLongitude : Presentation := centralWord * x ^ (-6 : ℤ)

def negativeLongitude : Presentation := centralWord⁻¹ * x ^ (6 : ℤ)

/-- Generator inversion is an involutive automorphism of this presentation.
The two longitude words refer to the different geometric trefoil markings. -/
theorem exists_reflection :
    ∃ e : Presentation ≃* Presentation,
      e x = x⁻¹ ∧ e y = y⁻¹ ∧
      (∀ g, e (e g) = g) ∧
      e centralWord = centralWord⁻¹ ∧
      e positiveLongitude = negativeLongitude := by
  sorry

end TauCetiRoadmap.GeometricTopology.TrefoilMirror
