import TauCeti.KnotTheory.SeifertMatrix.SEquivalence

/-!
**This file is not the roadmap and is not exhaustive.**
These are suggested forms. The README is the definitive specification.

These signatures specify the algebraic template from physical page75 of the course
notes, using the source convention `V_ij = lk(x_i, x_j⁺)`. They do not identify the
page76 band/closure diagram or supply its basis, surface or unknotting witnesses;
those geometric comparisons are separate required targets in the README.
The admitted theorems below are proof targets.
-/

noncomputable section

namespace TauCetiRoadmap.GeometricTopology.SeifertFamily

open Polynomial LaurentPolynomial

/-- The page75 template on zero-based indices. The endpoint diagonal entries are
`1`; every subdiagonal entry is `-1`; the superdiagonal entry is `-1` precisely
when the zero-based row is odd (the corresponding one-based row is even).
The intended family has `1 ≤ k`; at `k = 0` the index type is empty. -/
def matrix (k : ℕ) : Matrix (Fin (2 * k)) (Fin (2 * k)) ℤ :=
  fun i j =>
    if i = j ∧ (i.val = 0 ∨ i.val + 1 = 2 * k) then 1
    else if j.val + 1 = i.val then -1
    else if i.val + 1 = j.val ∧ i.val % 2 = 1 then -1
    else 0

/-- Package the concrete array in Tau Ceti's carrier of integral square matrices.
This carrier does not assert geometric realization by a Seifert surface. -/
def integralMatrix (k : ℕ) : TauCeti.KnotTheory.IntegralSquareMatrix :=
  ⟨2 * k, matrix k⟩

/-- The source's unnormalized determinant, over the polynomial ring `ℤ[X]`.
Tau Ceti's native `alexanderMatrix` instead uses `T • V - Vᵀ` over Laurent
polynomials; `nativeDeterminant_comparison` states the exact comparison. -/
def determinant (k : ℕ) : ℤ[X] :=
  ((matrix k).map (Polynomial.C : ℤ →+* ℤ[X]) -
    (Polynomial.X : ℤ[X]) • ((matrix k).map (Polynomial.C : ℤ →+* ℤ[X])).transpose).det

/-- The page75 determinant formula, including the genus-one endpoint case.
The README requires the tridiagonal leading-minor recurrence as its proof. -/
theorem determinant_eq (k : ℕ) (hk : 1 ≤ k) :
    determinant k = (-1 : ℤ[X]) ^ (k - 1) * (1 - X) ^ (2 * k) + X ^ k := by
  sorry

/-- The constant coefficient is nonzero; the `X^k` term does not contribute
because the family starts at `k = 1`. -/
theorem constantCoeff_eq (k : ℕ) (hk : 1 ≤ k) :
    (determinant k).coeff 0 = (-1 : ℤ) ^ (k - 1) := by
  sorry

/-- The top coefficient before any normalization. -/
theorem coeff_two_mul_eq (k : ℕ) (hk : 1 ≤ k) :
    (determinant k).coeff (2 * k) = (-1 : ℤ) ^ (k - 1) := by
  sorry

theorem extremeCoefficients_ne_zero (k : ℕ) (hk : 1 ≤ k) :
    (determinant k).coeff 0 ≠ 0 ∧ (determinant k).coeff (2 * k) ≠ 0 := by
  sorry

theorem natDegree_eq (k : ℕ) (hk : 1 ≤ k) :
    (determinant k).natDegree = 2 * k := by
  sorry

theorem leadingCoeff_eq (k : ℕ) (hk : 1 ≤ k) :
    (determinant k).leadingCoeff = (-1 : ℤ) ^ (k - 1) := by
  sorry

/-- Transposing and negating changes the source matrix `V - T • Vᵀ` into
Tau Ceti's `T • V - Vᵀ`. Even size makes their determinants equal. -/
theorem nativeDeterminant_comparison (k : ℕ) :
    (TauCeti.KnotTheory.alexanderMatrix (integralMatrix k).2).det =
      (determinant k).toLaurent := by
  sorry

/-- Native Conway normalization uses `T(-k)`; no private Alexander carrier or
normalization is introduced. -/
theorem nativeAlexander_comparison (k : ℕ) :
    TauCeti.KnotTheory.alexander (integralMatrix k).2 =
      T (-(k : ℤ)) * (determinant k).toLaurent := by
  sorry

/-- A polynomial reciprocal about degree `n`, allowing leading zero coefficients. -/
def kondoSymmetricPolynomial (n : ℕ) (a : Fin (n + 1) → ℤ) : ℤ[X] :=
  (∑ j : Fin n, Polynomial.C (a j.castSucc) * (X ^ (2 * n - j.val) + X ^ j.val)) +
    Polynomial.C (a (Fin.last n)) * X ^ n

/-- The finite integer solution of the second-difference equations. Kondo's last
alpha parameter additionally includes `n - 1`, as specified in the README. -/
def kondoParameter (n : ℕ) (a : Fin (n + 1) → ℤ) (j : Fin n) : ℤ :=
  ∑ i : Fin (n + 1),
    if i.val ≤ j.val then ((j.val - i.val + 1 : ℕ) : ℤ) * a i else 0

/-- Kondo's final parameter includes the source correction term. -/
def kondoAlpha (n : ℕ) (a : Fin (n + 1) → ℤ) (j : Fin n) : ℤ :=
  kondoParameter n a j + if j.val + 1 = n then (n : ℤ) - 1 else 0

/-- The selected symmetric linking parameters, with reversed first row/column.
The diagonal is a geometric twist parameter, interpreted by the README. -/
def kondoBandLinking (n : ℕ) (a : Fin (n + 1) → ℤ) :
    Matrix (Fin n) (Fin n) ℤ :=
  fun i j => if i.val = 0 then kondoAlpha n a j.rev
    else if j.val = 0 then kondoAlpha n a i.rev else 0

theorem kondoBandLinking_symmetric (n : ℕ) (a : Fin (n + 1) → ℤ) :
    (kondoBandLinking n a).transpose = kondoBandLinking n a := by
  ext i j
  by_cases hi : i.val = 0 <;> by_cases hj : j.val = 0
  · have h : i = j := Fin.ext (hi.trans hj.symm)
    subst h
    rfl
  all_goals simp [kondoBandLinking, Matrix.transpose_apply, hi, hj]

/-- The reciprocal polynomial multiplying `(X - 1)^2`; the central monomial
occurs once, including the `n = 1` case. -/
def kondoCore (n : ℕ) (β : Fin n → ℤ) : ℤ[X] :=
  ∑ j : Fin n, Polynomial.C (β j) *
    (if j.val + 1 = n then X ^ (n - 1)
      else X ^ (2 * n - 2 - j.val) + X ^ j.val)

/-- Normalization supplies the central coefficient after solving the triangular
integer system. This is the algebraic input to the geometric realization theorem. -/
theorem kondo_reconstruction (n : ℕ) (hn : 1 ≤ n) (a : Fin (n + 1) → ℤ)
    (h : (kondoSymmetricPolynomial n a).eval 1 = 1) :
    kondoSymmetricPolynomial n a =
      X ^ n + (X - 1) ^ 2 * kondoCore n (kondoParameter n a) := by
  sorry

/-- The normalized polynomial in the symmetric variable used by the independent
unknotting-one realization target. This does not identify its knot with page76. -/
theorem nativeAlexander_symmetric_power (k : ℕ) (hk : 1 ≤ k) :
    TauCeti.KnotTheory.alexander (integralMatrix k).2 =
      1 + (-1 : ℤ[T;T⁻¹]) ^ (k - 1) * (T 1 + T (-1) - 2) ^ k := by
  sorry

/-- A realization of the prescribed polynomial is nontrivial, so a one-change
unknotting certificate gives exact unknotting number one, rather than only an upper bound. -/
theorem nativeAlexander_ne_one (k : ℕ) (hk : 1 ≤ k) :
    TauCeti.KnotTheory.alexander (integralMatrix k).2 ≠ 1 := by
  sorry

end TauCetiRoadmap.GeometricTopology.SeifertFamily
