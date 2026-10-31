import Mathlib
import TauCeti.KnotTheory.Alexander
import TauCeti.KnotTheory.SeifertMatrix.SEquivalence
import TauCeti.KnotTheory.Signature

/-!
# Seifert determinants: suggested targets

This file is not the roadmap and is not exhaustive; the README is definitive.
Ordinary polynomial degree and symmetric Laurent support are different notions.
The geometric realization and stabilization comparisons are roadmap targets.
-/
noncomputable section
namespace SeifertDeterminantTargets
open Matrix TauCeti.KnotTheory

def ordinaryDet {n : ℕ} (V : Matrix (Fin n) (Fin n) ℤ) : Polynomial ℤ :=
  ((Polynomial.X : Polynomial ℤ) • V.map Polynomial.C -
    V.transpose.map Polynomial.C).det

def symDet {ι : Type*} [Fintype ι] [DecidableEq ι] (V : Matrix ι ι ℤ) : ℤ :=
  (V + V.transpose).det

/-- Reuse Polynomial.coeff_det_X_add_C_zero/card and natDegree_det_X_add_C_le. -/
theorem ordinary_package {g : ℕ} (V : Matrix (Fin (2*g)) (Fin (2*g)) ℤ) :
    (ordinaryDet V).toLaurent = (alexanderMatrix V).det ∧
    (ordinaryDet V).coeff 0 = V.det ∧
    (ordinaryDet V).coeff (2*g) = V.det ∧
    (ordinaryDet V).natDegree ≤ 2*g ∧
    (V.det ≠ 0 → (ordinaryDet V).natDegree = 2*g ∧ (ordinaryDet V).coeff 0 ≠ 0) := by
  sorry

theorem laurent_endpoints {g : ℕ} (V : Matrix (Fin (2*g)) (Fin (2*g)) ℤ) :
    (alexander V).coeff (-(g:ℤ)) = V.det ∧
    (alexander V).coeff (g:ℤ) = V.det ∧
    ∀ k ∈ (alexander V).coeff.support, -(g:ℤ) ≤ k ∧ k ≤ (g:ℤ) := by
  sorry

/-- The translated ordinary representative has even degree; Laurent max degree need not. -/
theorem symmetric_translation (f : LaurentPolynomial ℤ) (hne : f ≠ 0)
    (hsym : LaurentPolynomial.invert f = f)
    (hunit : LaurentPolynomial.eval₂ (RingHom.id ℤ) (1 : ℤˣ) f = 1) :
    ∃ (M : ℕ) (P : Polynomial ℤ),
      P.toLaurent = LaurentPolynomial.T (M:ℤ) * f ∧
      P.natDegree = 2*M ∧ P.coeff 0 ≠ 0 ∧
      (-(M:ℤ)) ∈ f.coeff.support ∧ (M:ℤ) ∈ f.coeff.support ∧
      ∀ k ∈ f.coeff.support, -(M:ℤ) ≤ k ∧ k ≤ (M:ℤ) := by
  sorry

theorem symDet_enlargements {n : ℕ} (V : Matrix (Fin n) (Fin n) ℤ) (ξ : Fin n → ℤ) :
    symDet (enlargeColumn V ξ) = -symDet V ∧
    symDet (enlargeRow V ξ) = -symDet V := by
  sorry

theorem natAbs_symDet_sEquivalent (V W : IntegralSquareMatrix)
    (h : IntegralSquareMatrix.SEquivalent V W) :
    (symDet V.2).natAbs = (symDet W.2).natAbs := by
  sorry

theorem signed_eval_neg_one {g : ℕ} (V : Matrix (Fin (2*g)) (Fin (2*g)) ℤ) :
    LaurentPolynomial.eval₂ (RingHom.id ℤ) (-1 : ℤˣ) (alexander V) =
      (-1 : ℤ)^g * symDet V := by
  sorry

/-- Matrix.signature V already reads the quadratic form of the symmetric part. -/
theorem odd_det_even_signature {g : ℕ} (V : Matrix (Fin (2*g)) (Fin (2*g)) ℤ)
    (hintersection : (V - V.transpose).det = 1) :
    Odd (symDet V) ∧ symDet V ≠ 0 ∧
    Even (Matrix.signature (V.map ((↑) : ℤ → ℝ))) := by
  sorry

/-- Disc surface of the unknot, before adding a trivial tube. -/
def emptyMatrix : Matrix (Fin 0) (Fin 0) ℤ := 0

/-- Native column enlargement by zero, the algebraic model of that tube. -/
def stabilizedMatrix : Matrix (Fin 2) (Fin 2) ℤ :=
  enlargeColumnFin emptyMatrix 0

theorem stabilizedMatrix_eq : stabilizedMatrix = !![0,1;0,0] := by
  ext i j
  fin_cases i <;> fin_cases j <;> rfl

theorem determinant_not_invariant :
    emptyMatrix.det = 1 ∧ stabilizedMatrix.det = 0 ∧
    IntegralSquareMatrix.SEquivalent ⟨0, emptyMatrix⟩ ⟨2, stabilizedMatrix⟩ ∧
    alexander emptyMatrix = 1 ∧ alexander stabilizedMatrix = 1 := by
  refine ⟨by simp, ?_, IntegralSquareMatrix.sEquivalent_enlargeColumn emptyMatrix 0,
    alexander_of_isEmpty emptyMatrix, ?_⟩
  · simp [stabilizedMatrix_eq, Matrix.det_fin_two]
  · rw [stabilizedMatrix_eq, alexander_fin_two]
    simp

end SeifertDeterminantTargets
