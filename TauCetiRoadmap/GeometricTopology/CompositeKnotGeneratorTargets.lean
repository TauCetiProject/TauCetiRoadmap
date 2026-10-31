import Mathlib.GroupTheory.PresentedGroup
import Mathlib.GroupTheory.SemidirectProduct

/-!
**This file is not the roadmap and is not exhaustive.** The README is definitive.
The two-trefoil connected-sum geometry and its meridian/Tietze comparison are
separate targets. The statement below concerns the literal presented group.
-/

namespace TauCetiRoadmap.GeometricTopology.CompositeKnotGenerators

/-- Generator 0 is the shared meridian; 1 and 2 belong to the two trefoils. -/
def braidRelator (i : Fin 3) : FreeGroup (Fin 3) :=
  (FreeGroup.of 0 * FreeGroup.of i * FreeGroup.of 0) *
    (FreeGroup.of i * FreeGroup.of 0 * FreeGroup.of i)⁻¹

def relators : Set (FreeGroup (Fin 3)) := {braidRelator 1, braidRelator 2}

abbrev Presentation := PresentedGroup relators

/-- The order-18 generalized-dihedral quotient excludes every pair of ordinary
abstract group generators, not only pairs of meridians. -/
theorem no_two_generators (g h : Presentation) :
    Subgroup.closure ({g,h} : Set Presentation) ≠ ⊤ := by
  sorry

#check PresentedGroup.toGroup
#check PresentedGroup.closure_range_of

end TauCetiRoadmap.GeometricTopology.CompositeKnotGenerators
