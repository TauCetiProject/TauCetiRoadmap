import TauCetiRoadmap.GeometricTopology.SmallCrossingInvariantTargets
import Mathlib

/-!
These are suggested finite certificates, not the roadmap or an exhaustive list.
The README and source-input note require the geometric diagram correspondence.
Solomon columns are h1,h2,v1,v2; Whitehead columns are h1,h2,h3,v1,v2.
Hopf uses its two component arcs; Borromean reuses the existing six-arc matrix.
-/

namespace TauCetiRoadmap.GeometricTopology.Problem20Fox

/-- Rows K1,...,K4: twice the overarc minus the two underarcs. -/
def solomonMatrix : Matrix (Fin 4) (Fin 4) (ZMod 3) :=
  !![-1,-1,2,0; 2,0,-1,-1; -1,-1,0,2; 0,2,-1,-1]

theorem solomon_kernel_iff_constant (c : Fin 4 → ZMod 3) :
    solomonMatrix.mulVec c = 0 ↔ ∃ a, c = fun _ => a := by
  revert c
  decide +kernel

theorem solomon_color_count :
    Fintype.card {c : Fin 4 → ZMod 3 // solomonMatrix.mulVec c = 0} = 3 := by
  decide +kernel

/-- Rows W1,...,W5, with columns h1,h2,h3,v1,v2. -/
def whiteheadMatrix : Matrix (Fin 5) (Fin 5) (ZMod 3) :=
  !![-1,0,-1,0,2; 0,0,2,-1,-1; 2,-1,-1,0,0;
     0,2,0,-1,-1; -1,-1,0,2,0]

theorem whitehead_kernel_iff_constant (c : Fin 5 → ZMod 3) :
    whiteheadMatrix.mulVec c = 0 ↔ ∃ a, c = fun _ => a := by
  revert c
  decide +kernel

theorem whitehead_color_count :
    Fintype.card {c : Fin 5 → ZMod 3 // whiteheadMatrix.mulVec c = 0} = 3 := by
  decide +kernel

/-- The actual two Hopf crossing rows, with the two component arcs as columns. -/
def hopfMatrix : Matrix (Fin 2) (Fin 2) (ZMod 3) := !![-2,2; 2,-2]

theorem hopf_kernel_iff_constant (c : Fin 2 → ZMod 3) :
    hopfMatrix.mulVec c = 0 ↔ ∃ a, c = fun _ => a := by
  revert c
  decide +kernel

theorem hopf_color_count :
    Fintype.card {c : Fin 2 → ZMod 3 // hopfMatrix.mulVec c = 0} = 3 := by
  decide +kernel

/-- Specialize the existing native six-crossing Borromean Fox matrix, without
using its general Smith-form or Alexander-ideal admissions. -/
def borromeanMatrix : Matrix (Fin 6) (Fin 6) (ZMod 3) :=
  (SmallCrossingInvariant.foxMatrix 0).map (Int.castRingHom (ZMod 3))

theorem borromean_kernel_iff_constant (c : Fin 6 → ZMod 3) :
    borromeanMatrix.mulVec c = 0 ↔ ∃ a, c = fun _ => a := by
  revert c
  decide +kernel

theorem borromean_color_count :
    Fintype.card {c : Fin 6 → ZMod 3 // borromeanMatrix.mulVec c = 0} = 3 := by
  decide +kernel

end TauCetiRoadmap.GeometricTopology.Problem20Fox
