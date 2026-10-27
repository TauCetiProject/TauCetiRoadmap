import TauCeti.KnotTheory.SeifertMatrix.SEquivalence

/-!
**This file is not the roadmap and is not exhaustive.**
These are suggested forms. The README is the definitive specification.

These signatures specify the algebraic template from physical page75 of the course
notes, using the source convention `V_ij = lk(x_i, x_j⁺)`. They do not identify the
page76 band/closure diagram or supply its basis, surface or unknotting witnesses;
those geometric comparisons are separate targets in the README and source-inputs.md.
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

end TauCetiRoadmap.GeometricTopology.SeifertFamily
