import TauCeti.KnotTheory.SeifertMatrix.SEquivalence
import Mathlib

/-!
Suggested forms are aids, not the specification; the README is definitive.
These are native matrix identities, not the geometric basis, push-off or
source-surface comparisons. Columns of P are new basis coordinates in the old basis.
-/
namespace TauCetiRoadmap.GeometricTopology.SeifertOperations
open TauCeti.KnotTheory Matrix

theorem column_basis_sEquivalent {n : ℕ} (V P : Matrix (Fin n) (Fin n) ℤ)
    (hP : IsUnit P.det) :
    IntegralSquareMatrix.SEquivalent ⟨n, V⟩ ⟨n, Pᵀ * V * P⟩ := by
  simpa only [transpose_transpose] using
    IntegralSquareMatrix.sEquivalent_congr V Pᵀ (by simpa using hP)

theorem mirror_involution {ι : Type*} (V : Matrix ι ι ℤ) :
    -(-Vᵀ)ᵀ = V := by
  simp

theorem mirror_block {ι κ : Type*} (V : Matrix ι ι ℤ) (W : Matrix κ κ ℤ) :
    -(fromBlocks V 0 0 W)ᵀ = fromBlocks (-Vᵀ) 0 0 (-Wᵀ) := by
  ext (i | i) (j | j) <;> simp

theorem trefoil_mirror : -trefoilSeifertMatrixᵀ = !![1,0; -1,1] := by
  decide +kernel

def fiveTwistMatrix : Matrix (Fin 4) (Fin 4) ℤ :=
  !![-1,1,0,0; 0,-1,1,0; 0,0,-1,1; 0,0,0,-1]

theorem fiveTwist_skew :
    fiveTwistMatrixᵀ - fiveTwistMatrix =
      !![0,-1,0,0; 1,0,-1,0; 0,1,0,-1; 0,0,1,0] := by
  decide +kernel

end TauCetiRoadmap.GeometricTopology.SeifertOperations
