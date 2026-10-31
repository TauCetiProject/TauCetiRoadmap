import Mathlib
import TauCeti.Algebra.Quaternion.ComplexMatrix
import TauCeti.LinearAlgebra.CliffordAlgebra.RealForm.Basic

/-!
# Source-ordered Pauli matrices: finite comparison certificates

**This file is not the roadmap and is not exhaustive.** The README is definitive.
These matrix calculations use the order recorded on the quantum Riemannian
notes' page2. They do not authenticate its obscured quotient, its su(2)
convention or page5's unclear matrix subscript. The Clifford algebra and
quaternion embedding below are the existing native objects.
-/

noncomputable section

namespace TauCetiRoadmap.SpinGeometry.SourcePauli

open Matrix
open scoped Quaternion

/-- Source order is (Z,Y,X), whereas the standard order is (X,Y,Z). -/
def source : Fin 3 → Matrix (Fin 2) (Fin 2) ℂ :=
  ![!![1, 0; 0, -1], !![0, -Complex.I; Complex.I, 0], !![0, 1; 1, 0]]

def quaternionUnit : Fin 3 → ℍ[ℝ] :=
  ![⟨0, 1, 0, 0⟩, ⟨0, 0, 1, 0⟩, ⟨0, 0, 0, 1⟩]

/-- This is the implemented real-quaternion embedding, not a new one. -/
theorem native_quaternion_dictionary (i : Fin 3) :
    Quaternion.toComplexMatrix (quaternionUnit i) = Complex.I • source i := by
  fin_cases i <;> ext j k <;> fin_cases j <;> fin_cases k <;>
    simp [quaternionUnit, source, Quaternion.toComplexMatrix_apply]

theorem source_hermitian (i : Fin 3) : (source i).IsHermitian := by
  fin_cases i <;> ext j k <;> fin_cases j <;> fin_cases k <;>
    simp [source, Matrix.conjTranspose_apply]

theorem source_squares (i : Fin 3) : source i * source i = 1 := by
  fin_cases i <;> ext j k <;> fin_cases j <;> fin_cases k <;>
    simp [source, Matrix.mul_apply, Fin.sum_univ_two]

/-- Cyclic order carries minus i because the source permutes X and Z. -/
theorem source_cyclic_products (i : Fin 3) :
    source i * source (i + 1) = -Complex.I • source (i + 2) := by
  fin_cases i <;> ext j k <;> fin_cases j <;> fin_cases k <;>
    simp [source, Matrix.mul_apply, Fin.sum_univ_two]

theorem source_anticommuting (i j : Fin 3) (hij : i ≠ j) :
    source i * source j = -(source j * source i) := by
  fin_cases i <;> fin_cases j <;> try contradiction
  all_goals
    ext k l
    fin_cases k <;> fin_cases l <;>
      simp [source, Matrix.mul_apply, Fin.sum_univ_two]

/-- The source imaginary triple is exactly the standard quaternion triple. -/
theorem quaternion_equations (i : Fin 3) :
    (Complex.I • source i) * (Complex.I • source i) = -1 ∧
      (Complex.I • source i) * (Complex.I • source (i + 1)) =
        Complex.I • source (i + 2) := by
  fin_cases i <;> constructor <;> ext j k <;> fin_cases j <;> fin_cases k <;>
    simp [source, Matrix.mul_apply, Fin.sum_univ_two]

/-- Actual native positive form, with source e1=X and e2=Z. -/
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

/-- The existing Clifford universal property realizes the source generator map. -/
def positiveModel : CliffordAlgebra (TauCeti.realCliffordForm 2 0) →ₐ[ℝ]
    Matrix (Fin 2) (Fin 2) ℝ :=
  CliffordAlgebra.lift _ ⟨positiveVector, positiveVector_square⟩

@[simp] theorem positiveModel_generator (v : Fin 2 → ℝ) :
    positiveModel (CliffordAlgebra.ι (TauCeti.realCliffordForm 2 0) v) =
      !![v 1, v 0; v 0, -v 1] := by
  exact CliffordAlgebra.lift_ι_apply _ _ v

/-- Literal real generator equations, before the source's complex notation. -/
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
