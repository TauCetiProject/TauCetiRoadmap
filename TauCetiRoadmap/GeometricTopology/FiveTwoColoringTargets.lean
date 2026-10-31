import Mathlib

/-!
# The literal colouring matrix for the source 5₂ diagram

**This file is not the roadmap and is not exhaustive.** The README is definitive.
These algebraic certificates use the source arc order. The realized diagram,
arc correspondence and geometric knot identification remain README targets.
-/

namespace TauCetiRoadmap.GeometricTopology.FiveTwoColoring

/-- Twice the overarc minus the two underarcs, in source row order. -/
def matrix : Matrix (Fin 5) (Fin 5) ℤ :=
  !![2,-1,-1,0,0; -1,0,2,-1,0; -1,0,0,2,-1;
     0,-1,0,-1,2; 0,2,-1,0,-1]

def rowOps : Matrix (Fin 5) (Fin 5) ℤ :=
  !![1,0,0,0,0; 0,1,0,0,0; 0,0,1,0,0;
     -6,-3,-2,-1,0; 1,1,1,1,1]

def columnOps : Matrix (Fin 5) (Fin 5) ℤ :=
  !![0,0,0,0,1; 0,0,0,1,1; -1,0,0,-1,1;
     -2,-1,0,-2,1; -4,-2,-1,-4,1]

theorem smith_certificate :
    rowOps * matrix * columnOps = Matrix.diagonal ![1,1,1,7,0] := by
  decide +kernel

theorem rowOps_det : rowOps.det = -1 := by decide +kernel

theorem columnOps_det : columnOps.det = 1 := by decide +kernel

/-- This statement covers every commutative ring, including composite moduli. -/
theorem kernel_formula {R : Type*} [CommRing R] (v : Fin 5 → R) :
    (matrix.map (Int.castRingHom R)).mulVec v = 0 ↔
      ∃ c a : R, (7 : R) * a = 0 ∧
        v = ![c, c+a, c-a, c-2*a, c-4*a] := by
  sorry

end TauCetiRoadmap.GeometricTopology.FiveTwoColoring
