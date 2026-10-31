import TauCetiRoadmap.GeometricTopology.KnotGrowthTargets
import TauCeti.KnotTheory.SeifertMatrix.SEquivalence
import TauCeti.KnotTheory.TristramLevine.Alexander
import Mathlib

/-!
Suggested forms are aids, not the specification; the README is definitive.
The three admitted uniform invariant/Smith statements are future proof targets.
The integer parameterization covers exactly the all-odd genus-one domain.
No array identity supplies its missing geometric surface or source comparison.
-/

noncomputable section
namespace TauCetiRoadmap.GeometricTopology.PretzelSeifert

open Polynomial LaurentPolynomial TauCeti.KnotTheory

/-- p=2a+1, q=2b+1, r=2c+1, in the native push-second convention. -/
def matrix (a b c : ℤ) : Matrix (Fin 2) (Fin 2) ℤ :=
  !![a+b+1, b; b+1, b+c+1]

def coefficient (a b c : ℤ) : ℤ := a*b+a*c+b*c+a+b+c+1

def discriminant (p q r : ℤ) : ℤ := p*q+p*r+q*r

theorem rational_adapter (a b c : ℤ) :
    (matrix a b c).map (Int.castRingHom ℚ) =
      (KnotGrowth.pretzelSeifert (2*(a : ℚ)+1) (2*(b : ℚ)+1) (2*(c : ℚ)+1)).transpose := by
  ext i j
  fin_cases i <;> fin_cases j <;>
    simp [matrix, KnotGrowth.pretzelSeifert, Matrix.transpose_apply] <;> ring

theorem odd_discriminant (a b c : ℤ) :
    discriminant (2*a+1) (2*b+1) (2*c+1) = 4 * coefficient a b c - 1 := by
  unfold discriminant coefficient
  ring

theorem matrix_det (a b c : ℤ) : (matrix a b c).det = coefficient a b c := by
  simp [matrix, coefficient, Matrix.det_fin_two]
  ring

theorem skew (a b c : ℤ) :
    (matrix a b c).transpose - matrix a b c = !![0, 1; -1, 0] := by
  ext i j
  fin_cases i <;> fin_cases j <;>
    simp [matrix, Matrix.transpose_apply, Matrix.sub_apply]

theorem mirror (a b c : ℤ) :
    matrix (-a-1) (-b-1) (-c-1) = -(matrix a b c).transpose := by
  ext i j
  fin_cases i <;> fin_cases j <;>
    simp [matrix, Matrix.transpose_apply, Matrix.neg_apply] <;> ring

def ordinaryDet (a b c : ℤ) : ℤ[X] :=
  ((Polynomial.X : ℤ[X]) • (matrix a b c).map (Polynomial.C : ℤ →+* ℤ[X]) -
    ((matrix a b c).map (Polynomial.C : ℤ →+* ℤ[X])).transpose).det

theorem ordinaryDet_eq (a b c : ℤ) :
    ordinaryDet a b c = Polynomial.C (coefficient a b c) * (1-X)^2 + X := by
  simp [ordinaryDet, matrix, coefficient, Matrix.det_fin_two,
    Matrix.sub_apply, Matrix.smul_apply, Matrix.transpose_apply]
  ring

theorem alexander_eq (a b c : ℤ) :
    alexander (matrix a b c) =
      1 + LaurentPolynomial.C (coefficient a b c) * (T 1 + T (-1) - 2) := by
  sorry

def realMatrix (a b c : ℤ) : Matrix (Fin 2) (Fin 2) ℝ :=
  (matrix a b c).map (Int.castRingHom ℝ)

theorem classical_signature (a b c : ℤ) :
    Matrix.signature (realMatrix a b c) =
      if discriminant (2*a+1) (2*b+1) (2*c+1) < 0 then 0
      else if 0 < a+b+1 then 2 else -2 := by
  sorry

def parameterGcd (p q r : ℤ) : ℕ := Nat.gcd (Nat.gcd p.natAbs q.natAbs) r.natAbs

def smithDiagonal (p q r : ℤ) : Matrix (Fin 2) (Fin 2) ℤ :=
  let g := parameterGcd p q r
  !![(g : ℤ), 0; 0, ((discriminant p q r).natAbs / g : ℕ)]

/-- Nat division by zero makes the all-zero branch the zero matrix. -/
theorem smith (p q r : ℤ) :
    ∃ P Q : Matrix (Fin 2) (Fin 2) ℤ,
      IsUnit P.det ∧ IsUnit Q.det ∧
        P * KnotGrowth.pretzelGoeritz p q r * Q = smithDiagonal p q r := by
  sorry

theorem first_example : matrix (-2) 2 3 = !![1, 2; 3, 6] := by decide +kernel

theorem signature_example : matrix 1 2 (-4) = !![4, 2; 3, -1] := by decide +kernel

theorem signature_symmetric :
    matrix 1 2 (-4) + (matrix 1 2 (-4)).transpose = !![8, 5; 5, -2] := by
  decide +kernel

theorem right_trefoil_basis :
    (!![1, 0; 0, -1] : Matrix (Fin 2) (Fin 2) ℤ) * matrix (-1) (-1) (-1) *
      !![1, 0; 0, -1] = trefoilSeifertMatrix := by
  decide +kernel

end TauCetiRoadmap.GeometricTopology.PretzelSeifert
