import Mathlib
import TauCeti.Algebra.Quaternion.ComplexMatrix
import TauCeti.LinearAlgebra.CliffordAlgebra.RealForm.Basic

/-!
# Pauli matrices in the (Z,Y,X) order: finite comparison certificates

**This file is not the roadmap and is not exhaustive.** The README is definitive.
The matrices are the Pauli matrices `Z = diag(1, -1)`, `Y = [[0, -i], [i, 0]]`,
`X = [[0, 1], [1, 0]]` in the order `(Z, Y, X)`, compared with the native quaternion
embedding and the positive-plane model of README G1.1 (`e₁ ↦ X`, `e₂ ↦ Z`).
The Clifford algebra and quaternion embedding below are the existing native objects.
-/

noncomputable section

namespace TauCetiRoadmap.SpinGeometry.SourcePauli

open Matrix
open scoped Quaternion

/-- The Pauli matrices in the order (Z,Y,X); the standard order is (X,Y,Z). -/
def source : Fin 3 → Matrix (Fin 2) (Fin 2) ℂ :=
  ![!![1, 0; 0, -1], !![0, -Complex.I; Complex.I, 0], !![0, 1; 1, 0]]

/-- The quaternion units `i`, `j`, `k`, in the order matching `source`. -/
def quaternionUnit : Fin 3 → ℍ[ℝ] :=
  ![⟨0, 1, 0, 0⟩, ⟨0, 0, 1, 0⟩, ⟨0, 0, 0, 1⟩]

/-- This is the implemented real-quaternion embedding, not a new one. -/
theorem native_quaternion_dictionary (i : Fin 3) :
    Quaternion.toComplexMatrix (quaternionUnit i) = Complex.I • source i := by
  fin_cases i <;> ext j k <;> fin_cases j <;> fin_cases k <;>
    simp [quaternionUnit, source, Quaternion.toComplexMatrix_apply]

/-- Each Pauli matrix is Hermitian. -/
theorem source_hermitian (i : Fin 3) : (source i).IsHermitian := by
  fin_cases i <;> ext j k <;> fin_cases j <;> fin_cases k <;>
    simp [source, Matrix.conjTranspose_apply]

/-- Each Pauli matrix squares to the identity. -/
theorem source_squares (i : Fin 3) : source i * source i = 1 := by
  fin_cases i <;> ext j k <;> fin_cases j <;> fin_cases k <;>
    simp [source, Matrix.mul_apply, Fin.sum_univ_two]

/-- Cyclic products carry −i because (Z,Y,X) is an odd permutation of (X,Y,Z). -/
theorem source_cyclic_products (i : Fin 3) :
    source i * source (i + 1) = -Complex.I • source (i + 2) := by
  fin_cases i <;> ext j k <;> fin_cases j <;> fin_cases k <;>
    simp [source, Matrix.mul_apply, Fin.sum_univ_two]

/-- Distinct Pauli matrices anticommute. -/
theorem source_anticommuting (i j : Fin 3) (hij : i ≠ j) :
    source i * source j = -(source j * source i) := by
  fin_cases i <;> fin_cases j <;> try contradiction
  all_goals
    ext k l
    fin_cases k <;> fin_cases l <;>
      simp [source, Matrix.mul_apply, Fin.sum_univ_two]

/-- The triple (iZ, iY, iX), in the (Z,Y,X) order, satisfies the quaternion equations
i² = −1 and ij = k of the standard triple. -/
theorem quaternion_equations (i : Fin 3) :
    (Complex.I • source i) * (Complex.I • source i) = -1 ∧
      (Complex.I • source i) * (Complex.I • source (i + 1)) =
        Complex.I • source (i + 2) := by
  fin_cases i <;> constructor <;> ext j k <;> fin_cases j <;> fin_cases k <;>
    simp [source, Matrix.mul_apply, Fin.sum_univ_two]

/-- The generator map of the positive-plane model on the native positive form,
with e₁ ↦ X and e₂ ↦ Z. -/
def positiveVector : (Fin 2 → ℝ) →ₗ[ℝ] Matrix (Fin 2) (Fin 2) ℝ where
  toFun v := !![v 1, v 0; v 0, -v 1]
  map_add' v w := by ext i j; fin_cases i <;> fin_cases j <;> simp [add_comm]
  map_smul' r v := by ext i j; fin_cases i <;> fin_cases j <;> simp

/-- Squares match the actual Tau Ceti signature-(2,0) form. -/
theorem positiveVector_square (v : Fin 2 → ℝ) :
    positiveVector v * positiveVector v =
      algebraMap ℝ (Matrix (Fin 2) (Fin 2) ℝ) (TauCeti.realCliffordForm 2 0 v) := by
  have hform : TauCeti.realCliffordForm 2 0 v = v 0 * v 0 + v 1 * v 1 := by
    rw [TauCeti.realCliffordForm_apply, Fin.sum_univ_two]
    simp [TauCeti.realCliffordWeight]
  rw [hform]
  ext i j
  fin_cases i <;> fin_cases j <;>
    simp [positiveVector, Matrix.mul_apply, Fin.sum_univ_two,
      Algebra.algebraMap_eq_smul_one] <;> ring

/-- The existing Clifford universal property realizes the positive-plane generator map
e₁ ↦ X, e₂ ↦ Z. -/
def positiveModel : CliffordAlgebra (TauCeti.realCliffordForm 2 0) →ₐ[ℝ]
    Matrix (Fin 2) (Fin 2) ℝ :=
  CliffordAlgebra.lift _ ⟨positiveVector, positiveVector_square⟩

/-- The positive-plane model sends the generator `v` to the real matrix
`[[v 1, v 0], [v 0, -v 1]]`, so `e₁ ↦ X` and `e₂ ↦ Z`. -/
@[simp] theorem positiveModel_generator (v : Fin 2 → ℝ) :
    positiveModel (CliffordAlgebra.ι (TauCeti.realCliffordForm 2 0) v) =
      !![v 1, v 0; v 0, -v 1] := by
  exact CliffordAlgebra.lift_ι_apply _ _ v

/-- Literal real generator equations in the positive-plane model. -/
theorem positive_generators :
    positiveVector ![1, 0] = !![0, 1; 1, 0] ∧
    positiveVector ![0, 1] = !![1, 0; 0, -1] ∧
    positiveVector ![1, 0] * positiveVector ![0, 1] = !![0, -1; 1, 0] := by
  constructor
  · ext i j; fin_cases i <;> fin_cases j <;> simp [positiveVector]
  constructor
  · ext i j; fin_cases i <;> fin_cases j <;> simp [positiveVector]
  ext i j
  fin_cases i <;> fin_cases j <;> simp [positiveVector, Matrix.mul_apply, Fin.sum_univ_two]

end TauCetiRoadmap.SpinGeometry.SourcePauli
