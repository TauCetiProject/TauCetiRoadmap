import Mathlib
import TauCeti.Analysis.PositiveDefinite.AddGroup
import TauCeti.LinearAlgebra.Matrix.Minor

/-!
# Positive-definite sequences and Toeplitz forms: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the
two definitions they need; both definitions have real bodies. Every headline theorem of the README
is statable at the pins and is stated here. The README's remaining targets, API lists and Checks
are not restated.

Matrices are positive definite or semidefinite in Mathlib's sense (`Matrix.PosDef`,
`Matrix.PosSemidef`), which includes being Hermitian. Complex numbers carry the order in which
`0 ≤ z` means that `z` is real and nonnegative. A function `φ` on an additive commutative group is
positive definite in Tau Ceti's sense `TauCeti.IsPositiveDefiniteSub`: every form
`∑ i, ∑ j, c i * conj (c j) * φ (v i - v j)` is real and nonnegative. The Toeplitz section of size
`n` of `φ : ℤ → ℂ` has entry `φ (j - k)` in row `j` and column `k`. Moments of a measure `μ` on the
unit circle are `∫ z ^ k dμ(z)` for `k : ℤ`, as in Tau Ceti's Herglotz theorem.
-/

noncomputable section

open Matrix MeasureTheory Polynomial ComplexConjugate
open scoped ComplexOrder

namespace TauCetiRoadmap.PositiveDefiniteSequencesAndToeplitzForms

/-! ## Layer 1: determinant criteria for positivity -/

/-- 1.1 Sylvester's criterion. A Hermitian matrix of size `n` is positive definite if and only if
each of its leading principal minors, of every size `k ≤ n`, is positive. -/
theorem posDef_iff_forall_det_leadingMinor_pos {𝕜 : Type*} [RCLike 𝕜] {n : ℕ}
    {A : Matrix (Fin n) (Fin n) 𝕜} (hA : A.IsHermitian) :
    A.PosDef ↔ ∀ (k : ℕ) (hk : k ≤ n), 0 < (A.submatrix (Fin.castLE hk) (Fin.castLE hk)).det := by
  sorry

/-- 1.2 A Hermitian matrix is positive semidefinite if and only if all of its principal minors
`Matrix.principalMinor A s`, indexed by all subsets `s` of the index type, are nonnegative. -/
theorem posSemidef_iff_forall_principalMinor_nonneg {𝕜 : Type*} [RCLike 𝕜] {ι : Type*}
    [Fintype ι] [DecidableEq ι] {A : Matrix ι ι 𝕜} (hA : A.IsHermitian) :
    A.PosSemidef ↔ ∀ s : Finset ι, 0 ≤ A.principalMinor s := by
  sorry

/-! ## Layer 2: group matrices on finite abelian groups -/

/-- 2.1 The group matrix `Matrix.circulant f`, with entry `f (x - y)` in row `x` and column `y`,
of a function `f` on a finite abelian group is positive definite if and only if every Fourier
coefficient `∑ x, conj (ψ x) * f x` is real and positive. -/
theorem posDef_circulant_iff_forall_sum_conj_mul_pos {G : Type*} [AddCommGroup G] [Fintype G]
    (f : G → ℂ) :
    (Matrix.circulant f).PosDef ↔ ∀ ψ : AddChar G ℂ, 0 < ∑ x, conj (ψ x) * f x := by
  sorry

/-! ## Layer 3: Toeplitz sections of positive-definite sequences -/

/-- 3.1 The Toeplitz section of size `n` of a sequence `φ : ℤ → ℂ`: the `n × n` matrix with entry
`φ (j - k)` in row `j` and column `k`. -/
def toeplitzSection (φ : ℤ → ℂ) (n : ℕ) : Matrix (Fin n) (Fin n) ℂ :=
  Matrix.of fun j k ↦ φ ((j : ℤ) - k)

/-- 3.2 The moment sequence `k ↦ ∫ z ^ k dμ(z)` of a measure on the unit circle. -/
def circleMoment (μ : Measure Circle) (k : ℤ) : ℂ :=
  ∫ z : Circle, (z : ℂ) ^ k ∂μ

/-- 3.1 A sequence on `ℤ` is positive definite if and only if each of its Toeplitz sections is
positive semidefinite. -/
theorem isPositiveDefiniteSub_iff_forall_posSemidef_toeplitzSection (φ : ℤ → ℂ) :
    TauCeti.IsPositiveDefiniteSub φ ↔ ∀ n, (toeplitzSection φ n).PosSemidef := by
  sorry

/-- 3.2 For a finite measure `μ` on the circle, the Toeplitz section of size `n` of its moment
sequence is positive definite if and only if no set of fewer than `n` points carries `μ`. -/
theorem posDef_toeplitzSection_circleMoment_iff (μ : Measure Circle) [IsFiniteMeasure μ]
    (n : ℕ) :
    (toeplitzSection (circleMoment μ) n).PosDef ↔
      ∀ s : Finset Circle, μ (↑s)ᶜ = 0 → n ≤ s.card := by
  sorry

/-- 3.3 Every Toeplitz section of `φ` is positive definite if and only if `φ (-k) = conj (φ k)` for
every `k` and every Toeplitz determinant of `φ` is positive. -/
theorem forall_posDef_toeplitzSection_iff (φ : ℤ → ℂ) :
    (∀ n, (toeplitzSection φ n).PosDef) ↔
      (∀ k, φ (-k) = conj (φ k)) ∧ ∀ n, 0 < (toeplitzSection φ n).det := by
  sorry

/-- 3.4 If a positive-definite sequence on `ℤ` has a Toeplitz section of size `n + 1` that is not
positive definite, then it is the moment sequence of a measure with at most `n` atoms: there are a
set `s` of at most `n` points of the circle and positive weights `w` with
`φ k = ∑ z ∈ s, w z * z ^ k` for every `k`. The Toeplitz section of size `m` then has rank
`min m (card s)`. -/
theorem exists_finset_of_not_posDef_toeplitzSection {φ : ℤ → ℂ}
    (hφ : TauCeti.IsPositiveDefiniteSub φ) {n : ℕ} (h : ¬(toeplitzSection φ (n + 1)).PosDef) :
    ∃ (s : Finset Circle) (w : Circle → ℝ), s.card ≤ n ∧ (∀ z ∈ s, 0 < w z) ∧
      (∀ k : ℤ, φ k = ∑ z ∈ s, (w z : ℂ) * (z : ℂ) ^ k) ∧
      ∀ m, (toeplitzSection φ m).rank = min m s.card := by
  sorry

/-! ## Layer 4: the Fejér–Riesz theorem -/

/-- 4.1 The Fejér–Riesz theorem. A trigonometric polynomial `∑_{|k| ≤ n} a k z ^ k` that is real and
nonnegative at every point of the unit circle, and not zero at every point, is `|q z|²` on the
circle for exactly one polynomial `q` of degree at most `n` that has no zero in the open unit disc
and a real positive constant coefficient. -/
theorem existsUnique_polynomial_fejerRiesz (n : ℕ) (a : ℤ → ℂ)
    (hnonneg : ∀ z : Circle, 0 ≤ ∑ k ∈ Finset.Icc (-(n : ℤ)) n, a k * (z : ℂ) ^ k)
    (hne : ∃ z : Circle, ∑ k ∈ Finset.Icc (-(n : ℤ)) n, a k * (z : ℂ) ^ k ≠ 0) :
    ∃! q : ℂ[X], q.natDegree ≤ n ∧ (∀ w : ℂ, ‖w‖ < 1 → q.eval w ≠ 0) ∧ 0 < q.coeff 0 ∧
      ∀ z : Circle,
        ∑ k ∈ Finset.Icc (-(n : ℤ)) n, a k * (z : ℂ) ^ k = ((‖q.eval (z : ℂ)‖ ^ 2 : ℝ) : ℂ) := by
  sorry

/-! ## Layer 5: the truncated trigonometric moment problem -/

/-- 5.1 The Carathéodory–Fejér theorem. The Toeplitz section of size `N` of `φ` is positive
semidefinite if and only if there are a set `s` of points of the circle, as many as the rank of the
section, and positive weights `w` with `φ k = ∑ z ∈ s, w z * z ^ k` for every `|k| < N`. -/
theorem posSemidef_toeplitzSection_iff_exists_finset (φ : ℤ → ℂ) (N : ℕ) :
    (toeplitzSection φ N).PosSemidef ↔
      ∃ (s : Finset Circle) (w : Circle → ℝ), s.card = (toeplitzSection φ N).rank ∧
        (∀ z ∈ s, 0 < w z) ∧ ∀ k : ℤ, |k| < N → φ k = ∑ z ∈ s, (w z : ℂ) * (z : ℂ) ^ k := by
  sorry

/-- 5.2 The Carathéodory–Toeplitz theorem. The Toeplitz section of size `N` of `φ` is positive
semidefinite if and only if some finite measure on the circle has moments `φ k` for `|k| < N`. -/
theorem posSemidef_toeplitzSection_iff_exists_measure (φ : ℤ → ℂ) (N : ℕ) :
    (toeplitzSection φ N).PosSemidef ↔
      ∃ μ : Measure Circle, IsFiniteMeasure μ ∧ ∀ k : ℤ, |k| < N → circleMoment μ k = φ k := by
  sorry

/-- 5.3 If the Toeplitz section of size `N` of `φ` is not positive definite, at most one finite
measure on the circle has moments `φ k` for `|k| < N`. -/
theorem measure_eq_of_not_posDef_toeplitzSection {φ : ℤ → ℂ} {N : ℕ}
    (h : ¬(toeplitzSection φ N).PosDef) {μ ν : Measure Circle} [IsFiniteMeasure μ]
    [IsFiniteMeasure ν] (hμ : ∀ k : ℤ, |k| < N → circleMoment μ k = φ k)
    (hν : ∀ k : ℤ, |k| < N → circleMoment ν k = φ k) : μ = ν := by
  sorry

end TauCetiRoadmap.PositiveDefiniteSequencesAndToeplitzForms
