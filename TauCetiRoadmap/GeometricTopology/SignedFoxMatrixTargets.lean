import Mathlib
import TauCeti.KnotTheory.PDCode.Alexander.Basic
import TauCeti.KnotTheory.Alexander

/-!
# Signed Fox rows: suggested targets

This file is not the roadmap and is not exhaustive; the README is definitive.
Local order is (over,incoming under,outgoing under). The finite matrices are
literal algebraic inputs; matching them to source diagrams is a geometric target.
-/
noncomputable section
namespace SignedFoxMatrixTargets
open LaurentPolynomial Matrix TauCeti TauCeti.KnotTheory
abbrev Λ := LaurentPolynomial ℤ

def localRow (w : Λ) : Fin 3 → Λ := ![1-w,w,-1]
def positiveRow : Fin 3 → Λ := localRow (T 1)
def negativeRow : Fin 3 → Λ := localRow (T (-1))
def normalizedNegativeRow : Fin 3 → Λ := ![1-T 1,-1,T 1]

def assembledRow {ι : Type*} [DecidableEq ι] (o u v : ι) (w : Λ) : ι → Λ :=
  Pi.single o (1-w) + Pi.single u w - Pi.single v 1

theorem row_sum (w : Λ) : ∑ i, localRow w i = 0 := by
  simp [localRow, Fin.sum_univ_three]

theorem negative_unit_normalization :
    IsUnit (-T 1 : Λ) ∧ ∀ i, (-T 1 : Λ) * negativeRow i = normalizedNegativeRow i := by
  constructor
  · exact (isUnit_T 1).neg
  · have htt : (T 1 : Λ) * T (-1) = 1 := by rw [← T_add]; norm_num
    intro i
    fin_cases i
    · change (-T 1 : Λ) * (1-T (-1)) = 1-T 1
      linear_combination htt
    · change (-T 1 : Λ) * T (-1) = -1
      simpa only [neg_mul] using congrArg Neg.neg htt
    · change (-T 1 : Λ) * (-1) = T 1
      ring

theorem eval_neg_one_rows :
    (fun i ↦ eval₂ (RingHom.id ℤ) (-1 : ℤˣ) (positiveRow i)) = ![2,-1,-1] ∧
    (fun i ↦ eval₂ (RingHom.id ℤ) (-1 : ℤˣ) (negativeRow i)) = ![2,-1,-1] ∧
    (fun i ↦ eval₂ (RingHom.id ℤ) (-1 : ℤˣ) (normalizedNegativeRow i)) = ![2,-1,-1] := by
  refine ⟨?_,?_,?_⟩ <;> ext i <;> fin_cases i <;>
    norm_num [positiveRow, negativeRow, localRow, normalizedNegativeRow]

theorem coincident_indices {ι : Type*} [DecidableEq ι] (a : ι) (w : Λ) :
    assembledRow a a a w = 0 := by
  ext j
  by_cases h : j = a <;> simp [assembledRow, h]

/-- Native relation is the negative of our row, read from an incoming under-slot. -/
theorem native_incoming_relation {n : ℕ} (D : OrientedPDCode n) (i : Fin n) (s : Fin 4)
    (hunder : D.isOver i s = false) (hin : D.orientation (D.crossing i s) = false) :
    D.alexanderRelation (.inr (i,s)) =
      -assembledRow (.inl (D.crossing i (s+1))) (.inl (D.crossing i s))
        (.inl (D.crossing i (s+2))) (T (D.crossingSign i)) := by
  have hw := D.alexanderWeight_of_not_isOver hunder
  rw [hin] at hw
  simp only [Bool.false_eq_true, ↓reduceIte] at hw
  rw [D.alexanderRelation_inr, hw]
  ext j
  simp [assembledRow, Pi.single_apply, Pi.smul_apply, smul_eq_mul]
  split_ifs <;> ring

def trefoilArcMatrix : Matrix (Fin 3) (Fin 3) (Polynomial ℤ) :=
  !![1-Polynomial.X,-1,Polynomial.X;
     Polynomial.X,1-Polynomial.X,-1;
     -1,Polynomial.X,1-Polynomial.X]

def trefoilMinor : Polynomial ℤ :=
  (trefoilArcMatrix.submatrix (fun i : Fin 2 ↦ i.castSucc) (fun i : Fin 2 ↦ i.castSucc)).det

def figureEightMinorMatrix : Matrix (Fin 3) (Fin 3) (Polynomial ℤ) :=
  !![1-Polynomial.X,0,-1; -1,1-Polynomial.X,0; -1,Polynomial.X,1-Polynomial.X]

theorem literal_determinants :
    trefoilMinor = 1-Polynomial.X+Polynomial.X^2 ∧
    figureEightMinorMatrix.det = -Polynomial.X^3+3*Polynomial.X^2-Polynomial.X := by
  constructor
  · simp [trefoilMinor, trefoilArcMatrix, Matrix.det_fin_two]
    ring
  · simp [figureEightMinorMatrix, Matrix.det_fin_three]
    ring

theorem exact_native_normalizations :
    T (-1) * trefoilMinor.toLaurent = alexander trefoilSeifertMatrix ∧
    T (-2) * figureEightMinorMatrix.det.toLaurent = alexander figureEightSeifertMatrix := by
  sorry

end SignedFoxMatrixTargets
