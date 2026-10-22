import Mathlib.LinearAlgebra.Matrix.Notation
import Mathlib.Data.Matrix.Mul
import Mathlib.Tactic

/-!
# Four-dimensional compatibility: coefficient normalization

**This file is not the roadmap and is not exhaustive.** The README is definitive.
The matrix below represents `g(Au,v) = ω(u,v)` in a positively oriented
orthonormal frame when
`ω = a(e¹² + e³⁴) + b(e¹³ - e²⁴) + c(e¹⁴ + e²³)`.
The generic Hodge-star, norm and smooth-bundle comparisons remain README targets.
-/

namespace TauCetiRoadmap.HeegaardFloer.FourDimensionalCompatibility

open Matrix

/-- Entries `ω(e_i,e_j)` in the ordered orthonormal frame. -/
def omegaGram (a b c : ℝ) : Matrix (Fin 4) (Fin 4) ℝ :=
  !![0,  a,  b,  c;
    -a,  0,  c, -b;
    -b, -c,  0,  a;
    -c,  b, -a,  0]

def selfDualMatrix (a b c : ℝ) : Matrix (Fin 4) (Fin 4) ℝ :=
  !![0, -a, -b, -c;
     a,  0, -c,  b;
     b,  c,  0, -a;
     c, -b,  a,  0]

theorem selfDualMatrix_eq_transpose_omegaGram (a b c : ℝ) :
    selfDualMatrix a b c = (omegaGram a b c).transpose := by
  ext i j
  fin_cases i <;> fin_cases j <;> simp [selfDualMatrix, omegaGram]

theorem omegaGram_exteriorNormSq (a b c : ℝ) :
    (∑ i : Fin 4, ∑ j : Fin 4, if i < j then (omegaGram a b c i j) ^ 2 else 0) =
      2 * (a ^ 2 + b ^ 2 + c ^ 2) := by
  norm_num [omegaGram, Fin.sum_univ_succ]
  ring

theorem selfDualMatrix_transpose (a b c : ℝ) :
    (selfDualMatrix a b c).transpose = -selfDualMatrix a b c := by
  ext i j
  fin_cases i <;> fin_cases j <;> simp [selfDualMatrix]

theorem selfDualMatrix_sq (a b c : ℝ) :
    selfDualMatrix a b c * selfDualMatrix a b c =
      (-(a ^ 2 + b ^ 2 + c ^ 2)) • (1 : Matrix (Fin 4) (Fin 4) ℝ) := by
  ext i j
  fin_cases i <;> fin_cases j <;>
    simp [selfDualMatrix, Matrix.mul_apply, Fin.sum_univ_succ] <;> ring

theorem selfDualMatrix_sq_of_unit (a b c : ℝ)
    (h : a ^ 2 + b ^ 2 + c ^ 2 = 1) :
    selfDualMatrix a b c * selfDualMatrix a b c =
      -(1 : Matrix (Fin 4) (Fin 4) ℝ) := by
  rw [selfDualMatrix_sq, h]
  simp

theorem selfDualMatrix_orthogonal_of_unit (a b c : ℝ)
    (h : a ^ 2 + b ^ 2 + c ^ 2 = 1) :
    (selfDualMatrix a b c).transpose * selfDualMatrix a b c =
      (1 : Matrix (Fin 4) (Fin 4) ℝ) := by
  rw [selfDualMatrix_transpose, Matrix.neg_mul, selfDualMatrix_sq_of_unit a b c h]
  simp

/-- The sign-sensitive identity `ω(u,Jv) = g(u,v)`, with `J = A`. -/
theorem omegaGram_mul_selfDualMatrix_of_unit (a b c : ℝ)
    (h : a ^ 2 + b ^ 2 + c ^ 2 = 1) :
    omegaGram a b c * selfDualMatrix a b c =
      (1 : Matrix (Fin 4) (Fin 4) ℝ) := by
  have hgram : omegaGram a b c = (selfDualMatrix a b c).transpose := by
    rw [selfDualMatrix_eq_transpose_omegaGram, Matrix.transpose_transpose]
  rw [hgram, selfDualMatrix_orthogonal_of_unit a b c h]

end TauCetiRoadmap.HeegaardFloer.FourDimensionalCompatibility
