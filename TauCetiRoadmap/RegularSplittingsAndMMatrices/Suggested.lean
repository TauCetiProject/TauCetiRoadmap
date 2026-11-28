import Mathlib

/-!
# Regular splittings and M-matrices: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib, each with `sorry`, together with the definitions
they need; every definition has a real body. Every headline theorem of the README is statable at
the pins and is stated here.

Matrices are Mathlib matrices on a finite index type `ι`, possibly empty, acting on column
vectors by `Matrix.mulVec`. The spectral radius is Mathlib's `spectralRadius ℂ`, an element of
`[0, ∞]`; for a real matrix `X` it is taken of `X.map (↑)` over `ℂ`. Nonnegativity of a real
matrix is stated entrywise, `∀ i j, 0 ≤ X i j`. Inverses of singular matrices are Mathlib's junk
value `0`, and every statement that inverts a matrix assumes what makes it invertible or says
what happens otherwise. The Jacobi and SOR iteration matrices are copied verbatim from the
roadmap IterativeMethodsForLinearSystems, §2.1.
-/

noncomputable section

open Matrix
open scoped ComplexOrder

namespace TauCetiRoadmap.RegularSplittingsAndMMatrices

/-! ## Conventions: the iteration matrices (copied verbatim) -/

section Jacobi

variable {ι 𝕜 : Type*} [Fintype ι] [DecidableEq ι] [RCLike 𝕜]

/-- Conventions. The Jacobi iteration matrix `1 − D⁻¹ A`, where `D` is the diagonal part of `A`
(copied verbatim from IterativeMethodsForLinearSystems §2.1). -/
def jacobiMatrix (A : Matrix ι ι 𝕜) : Matrix ι ι 𝕜 :=
  1 - (diagonal A.diag)⁻¹ * A

end Jacobi

section SOR

variable {ι 𝕜 : Type*} [Fintype ι] [LinearOrder ι] [RCLike 𝕜]

/-- Conventions. The strictly lower triangular part `L` of `A` (copied verbatim from
IterativeMethodsForLinearSystems §2.1). -/
def strictLowerPart (A : Matrix ι ι 𝕜) : Matrix ι ι 𝕜 :=
  Matrix.of fun i j => if j < i then A i j else 0

/-- Conventions. The strictly upper triangular part `U` of `A` (copied verbatim from
IterativeMethodsForLinearSystems §2.1). -/
def strictUpperPart (A : Matrix ι ι 𝕜) : Matrix ι ι 𝕜 :=
  Matrix.of fun i j => if i < j then A i j else 0

/-- Conventions. The SOR iteration matrix `(D + ω L)⁻¹ ((1 − ω) D − ω U)`; `ω = 1` gives the
Gauss–Seidel matrix (copied verbatim from IterativeMethodsForLinearSystems §2.1). -/
def sorMatrix (A : Matrix ι ι 𝕜) (ω : ℝ) : Matrix ι ι 𝕜 :=
  (diagonal A.diag + ω • strictLowerPart A)⁻¹ *
    ((1 - ω) • diagonal A.diag - ω • strictUpperPart A)

end SOR

/-! ## Layer 1: nonnegative matrices and the spectral radius -/

section Nonnegative

variable {ι : Type*} [Fintype ι] [DecidableEq ι]

/-- 1.1 Comparison: if every entry of a complex matrix `A` has modulus at most the corresponding
entry of a real matrix `B`, then `ρ(A) ≤ ρ(B)`. -/
theorem spectralRadius_le_spectralRadius_of_norm_le {A : Matrix ι ι ℂ} {B : Matrix ι ι ℝ}
    (hAB : ∀ i j, ‖A i j‖ ≤ B i j) :
    spectralRadius ℂ A ≤ spectralRadius ℂ (B.map ((↑) : ℝ → ℂ)) := by
  sorry

/-- 1.2 Strict comparison: if `B` is irreducible and `0 ≤ A ≤ B` entrywise with `A ≠ B`, then
`ρ(A) < ρ(B)`. -/
theorem spectralRadius_lt_spectralRadius_of_le_of_ne {A B : Matrix ι ι ℝ}
    (hB : B.IsIrreducible) (hA : ∀ i j, 0 ≤ A i j) (hAB : ∀ i j, A i j ≤ B i j) (hne : A ≠ B) :
    spectralRadius ℂ (A.map ((↑) : ℝ → ℂ)) < spectralRadius ℂ (B.map ((↑) : ℝ → ℂ)) := by
  sorry

/-- 1.3 For an entrywise nonnegative real matrix `B`, `ρ(B) < 1` if and only if `1 − B` is
invertible with entrywise nonnegative inverse. -/
theorem spectralRadius_map_lt_one_iff {B : Matrix ι ι ℝ} (hB : ∀ i j, 0 ≤ B i j) :
    spectralRadius ℂ (B.map ((↑) : ℝ → ℂ)) < 1 ↔
      IsUnit (1 - B) ∧ ∀ i j, 0 ≤ (1 - B)⁻¹ i j := by
  sorry

/-! ## Layer 2: regular splittings -/

/-- 2.1 For a regular splitting `A = M − N` (`M` invertible, `M⁻¹ ≥ 0`, `N ≥ 0` entrywise),
`ρ(M⁻¹ N) < 1` if and only if `A` is invertible with entrywise nonnegative inverse. -/
theorem spectralRadius_inv_mul_lt_one_iff {A M N : Matrix ι ι ℝ} (hAMN : A = M - N)
    (hM : IsUnit M) (hMinv : ∀ i j, 0 ≤ M⁻¹ i j) (hN : ∀ i j, 0 ≤ N i j) :
    spectralRadius ℂ ((M⁻¹ * N).map ((↑) : ℝ → ℂ)) < 1 ↔
      IsUnit A ∧ ∀ i j, 0 ≤ A⁻¹ i j := by
  sorry

/-- 2.2 For a regular splitting `A = M − N` of an invertible `A` with `A⁻¹ ≥ 0` entrywise,
`ρ(M⁻¹ N) = τ / (1 + τ)` with `τ = ρ(A⁻¹ N)`. -/
theorem spectralRadius_inv_mul_eq {A M N : Matrix ι ι ℝ} (hAMN : A = M - N)
    (hM : IsUnit M) (hMinv : ∀ i j, 0 ≤ M⁻¹ i j) (hN : ∀ i j, 0 ≤ N i j)
    (hA : IsUnit A) (hAinv : ∀ i j, 0 ≤ A⁻¹ i j) :
    spectralRadius ℂ ((M⁻¹ * N).map ((↑) : ℝ → ℂ)) =
      spectralRadius ℂ ((A⁻¹ * N).map ((↑) : ℝ → ℂ)) /
        (1 + spectralRadius ℂ ((A⁻¹ * N).map ((↑) : ℝ → ℂ))) := by
  sorry

end Nonnegative

section Ordered

variable {ι : Type*} [Fintype ι] [LinearOrder ι]

/-- 2.3 If `A` has nonpositive off-diagonal entries and is invertible with entrywise
nonnegative inverse (a nonsingular M-matrix), then the Jacobi matrix and, for `0 < ω ≤ 1`, the
SOR matrix of `A` have spectral radius less than one. -/
theorem spectralRadius_jacobiMatrix_lt_one_and_sorMatrix_lt_one {A : Matrix ι ι ℝ}
    (hZ : ∀ i j, i ≠ j → A i j ≤ 0) (hA : IsUnit A) (hAinv : ∀ i j, 0 ≤ A⁻¹ i j) :
    spectralRadius ℂ ((jacobiMatrix A).map ((↑) : ℝ → ℂ)) < 1 ∧
      ∀ ω : ℝ, 0 < ω → ω ≤ 1 → spectralRadius ℂ ((sorMatrix A ω).map ((↑) : ℝ → ℂ)) < 1 := by
  sorry

/-- 2.4 The Stein–Rosenberg theorem: if `A` has positive diagonal and nonpositive off-diagonal
entries, then for `ρ_J` the spectral radius of the Jacobi matrix and `ρ_G` that of the
Gauss–Seidel matrix exactly one of the following holds: `ρ_J = ρ_G = 0`;
`0 < ρ_G < ρ_J < 1`; `ρ_J = ρ_G = 1`; `1 < ρ_J < ρ_G`. No irreducibility is assumed. -/
theorem stein_rosenberg {A : Matrix ι ι ℝ} (hD : ∀ i, 0 < A i i)
    (hZ : ∀ i j, i ≠ j → A i j ≤ 0) :
    (spectralRadius ℂ ((jacobiMatrix A).map ((↑) : ℝ → ℂ)) = 0 ∧
        spectralRadius ℂ ((sorMatrix A 1).map ((↑) : ℝ → ℂ)) = 0) ∨
      (0 < spectralRadius ℂ ((sorMatrix A 1).map ((↑) : ℝ → ℂ)) ∧
        spectralRadius ℂ ((sorMatrix A 1).map ((↑) : ℝ → ℂ)) <
          spectralRadius ℂ ((jacobiMatrix A).map ((↑) : ℝ → ℂ)) ∧
        spectralRadius ℂ ((jacobiMatrix A).map ((↑) : ℝ → ℂ)) < 1) ∨
      (spectralRadius ℂ ((jacobiMatrix A).map ((↑) : ℝ → ℂ)) = 1 ∧
        spectralRadius ℂ ((sorMatrix A 1).map ((↑) : ℝ → ℂ)) = 1) ∨
      (1 < spectralRadius ℂ ((jacobiMatrix A).map ((↑) : ℝ → ℂ)) ∧
        spectralRadius ℂ ((jacobiMatrix A).map ((↑) : ℝ → ℂ)) <
          spectralRadius ℂ ((sorMatrix A 1).map ((↑) : ℝ → ℂ))) := by
  sorry

end Ordered

/-! ## Layer 3: irreducible diagonal dominance -/

section Dominance

variable {ι K : Type*} [Fintype ι] [DecidableEq ι] [NormedField K]

/-- 3.1 `A` is irreducibly diagonally dominant (by rows): the matrix of moduli `‖A i j‖` is
irreducible, every row satisfies `∑_(j ≠ i) ‖A i j‖ ≤ ‖A i i‖`, and some row satisfies it
strictly. -/
def IsIrreduciblyDiagDominant (A : Matrix ι ι K) : Prop :=
  (Matrix.of fun i j => ‖A i j‖).IsIrreducible ∧
    (∀ i, ∑ j ∈ Finset.univ.erase i, ‖A i j‖ ≤ ‖A i i‖) ∧
    ∃ i, ∑ j ∈ Finset.univ.erase i, ‖A i j‖ < ‖A i i‖

/-- 3.1 Taussky's theorem: an irreducibly diagonally dominant matrix has nonzero determinant. -/
theorem det_ne_zero_of_isIrreduciblyDiagDominant {A : Matrix ι ι K}
    (hA : IsIrreduciblyDiagDominant A) : A.det ≠ 0 := by
  sorry

end Dominance

section DominanceIteration

variable {ι : Type*} [Fintype ι] [LinearOrder ι]

/-- 3.2 If `A` or its transpose is irreducibly diagonally dominant, or `A` is strictly
diagonally dominant by columns, then the Jacobi and the Gauss–Seidel matrices of `A` have
spectral radius less than one. -/
theorem spectralRadius_jacobiMatrix_lt_one_and_sorMatrix_one_lt_one {A : Matrix ι ι ℂ}
    (hA : IsIrreduciblyDiagDominant A ∨ IsIrreduciblyDiagDominant Aᵀ ∨
      ∀ i, ∑ j ∈ Finset.univ.erase i, ‖A j i‖ < ‖A i i‖) :
    spectralRadius ℂ (jacobiMatrix A) < 1 ∧ spectralRadius ℂ (sorMatrix A 1) < 1 := by
  sorry

end DominanceIteration

/-! ## Layer 4: splittings of Hermitian matrices -/

section Hermitian

variable {ι : Type*} [Fintype ι] [DecidableEq ι]

/-- 4.1 The Householder–John theorem with its converse: if `A = M − N` with `M` invertible and
`Mᴴ + N` positive definite, then `ρ(M⁻¹ N) < 1` if and only if `A` is positive definite. -/
theorem spectralRadius_inv_mul_lt_one_iff_posDef {A M N : Matrix ι ι ℂ} (hAMN : A = M - N)
    (hM : IsUnit M) (hMN : (Mᴴ + N).PosDef) :
    spectralRadius ℂ (M⁻¹ * N) < 1 ↔ A.PosDef := by
  sorry

/-- 4.2 For a positive definite `A`, the Jacobi matrix has spectral radius less than one if and
only if `2 D − A` is positive definite, `D` the diagonal part of `A`. -/
theorem spectralRadius_jacobiMatrix_lt_one_iff_posDef {A : Matrix ι ι ℂ} (hA : A.PosDef) :
    spectralRadius ℂ (jacobiMatrix A) < 1 ↔ ((2 : ℂ) • diagonal A.diag - A).PosDef := by
  sorry

end Hermitian

end TauCetiRoadmap.RegularSplittingsAndMMatrices
