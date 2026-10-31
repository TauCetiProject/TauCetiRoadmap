import Mathlib
import TauCeti.Algebra.TemperleyLieb.Basic
import TauCeti.KnotTheory.PDCode.Kauffman

/-!
# Universal bracket coefficients: suggested targets

This file is not the roadmap and is not exhaustive; the README is definitive.
Coefficient necessity is a two-strand open-tangle statement. The reduced
state-sum comparison uses nonempty diagrams and never divides by the loop value.
-/
noncomputable section
namespace UniversalBracketTargets
open TauCeti TemperleyLieb LaurentPolynomial

variable {R : Type*} [CommRing R]

theorem crossing_matrix (a b c : R) :
    twoStrandRep c (crossing c a b (0 : Fin 1)) = !![a,0;b,a+b*c] := by
  ext i j
  fin_cases i <;> fin_cases j <;>
    simp [crossing_def, twoStrandRep_e, Matrix.smul_apply, smul_eq_mul]

theorem reidemeister_two_iff (a b c : R) :
    crossing (n := 2) c a b (0 : Fin 1) * crossing (n := 2) c b a (0 : Fin 1) = 1 ↔
      a*b=1 ∧ a^2+b^2+a*b*c=0 := by
  sorry

abbrev CoeffPoly := MvPolynomial (Fin 3) ℤ
def coefficientIdeal : Ideal CoeffPoly :=
  Ideal.span ({MvPolynomial.X 0 * MvPolynomial.X 1 - 1,
    MvPolynomial.X 0 ^ 2 + MvPolynomial.X 1 ^ 2 +
      MvPolynomial.X 0 * MvPolynomial.X 1 * MvPolynomial.X 2} : Set CoeffPoly)
abbrev UniversalCoeff := CoeffPoly ⧸ coefficientIdeal

theorem universal_laurent_equiv :
    ∃ e : UniversalCoeff ≃+* LaurentPolynomial ℤ,
      e (Ideal.Quotient.mk coefficientIdeal (MvPolynomial.X 0)) = T 1 ∧
      e (Ideal.Quotient.mk coefficientIdeal (MvPolynomial.X 1)) = T (-1) ∧
      e (Ideal.Quotient.mk coefficientIdeal (MvPolynomial.X 2)) = -(T 2 + T (-2)) := by
  sorry

def reducedStateSum {n : ℕ} (D : PDCode n) (a b c : R) : R :=
  ∑ s : Fin n → Bool, (∏ i, if s i then a else b) * c^(D.stateLoopCount s - 1)

def unreducedStateSum {n : ℕ} (D : PDCode n) (a b c : R) : R :=
  ∑ s : Fin n → Bool, (∏ i, if s i then a else b) * c^(D.stateLoopCount s)

theorem state_sum_specialization {n : ℕ} (D : PDCode n) (hne : 0 < D.componentCount)
    (a : Rˣ) :
    reducedStateSum D (a:R) ((a⁻¹:Rˣ):R) (jonesDelta a) = D.kauffmanBracket a ∧
    unreducedStateSum D (a:R) ((a⁻¹:Rˣ):R) (jonesDelta a) =
      jonesDelta a * D.kauffmanBracket a := by
  sorry

theorem curl_coefficients (a b c : R) (hab : a*b=1) (hpoly : a^2+b^2+a*b*c=0) :
    a*c+b = -a^3 ∧ b*c+a = -b^3 ∧ (a*c+b)*(b*c+a)=1 := by
  sorry

end UniversalBracketTargets
