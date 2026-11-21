import Mathlib

/-!
# Iterative methods for linear systems: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib, each with `sorry`, together with the few definitions
they need; every definition has a real body. Every headline theorem of the README is statable at
the pins and is stated here. The README's remaining targets (the facts listed under 1.1, 2.1 and
4.1, and the closed form of 3.3), its API lists and its Checks are not restated.

Matrices are Mathlib matrices `Matrix ι ι 𝕜` over `𝕜 = ℝ` or `ℂ` (an `RCLike` field) on a finite
index type, acting on column vectors `ι → 𝕜` by `Matrix.mulVec`; vectors carry the product
topology. The spectral radius is Mathlib's `spectralRadius ℂ`, taken over `ℂ`: for a real matrix
it is applied to the complexified matrix. Every iterate is a mathematical object, either the
sequence given by a recurrence or a minimiser over an affine Krylov space; no procedure is
specified. Inverses of singular matrices are Mathlib's junk value `0`; each statement that needs
an inverse assumes what makes it invertible.
-/

noncomputable section

open Polynomial Matrix Filter Topology
open scoped ComplexOrder

namespace TauCetiRoadmap.IterativeMethodsForLinearSystems

/-! ## Layer 1: stationary iterations and the spectral radius -/

section Stationary

variable {ι 𝕜 : Type*} [Fintype ι] [DecidableEq ι] [RCLike 𝕜]

/-- 1.1 The stationary iterates `x₀, x₁, …` of `x ↦ G x + c`: `x (k + 1) = G x k + c`. -/
def stationaryIterate (G : Matrix ι ι 𝕜) (c x₀ : ι → 𝕜) : ℕ → ι → 𝕜
  | 0 => x₀
  | k + 1 => G *ᵥ stationaryIterate G c x₀ k + c

/-- 1.2 The powers of a complex square matrix tend to zero if and only if its spectral radius is
less than one. -/
theorem tendsto_pow_atTop_nhds_zero_iff_spectralRadius_lt_one (G : Matrix ι ι ℂ) :
    Tendsto (fun k : ℕ => G ^ k) atTop (𝓝 0) ↔ spectralRadius ℂ G < 1 := by
  sorry

/-- 1.2 The powers of a real square matrix tend to zero if and only if the spectral radius of the
same matrix over `ℂ` is less than one. -/
theorem tendsto_pow_atTop_nhds_zero_iff_spectralRadius_map_lt_one (G : Matrix ι ι ℝ) :
    Tendsto (fun k : ℕ => G ^ k) atTop (𝓝 0) ↔
      spectralRadius ℂ (G.map ((↑) : ℝ → ℂ)) < 1 := by
  sorry

/-- 1.3 The iterates of `x ↦ G x + c` converge for every `c` and every `x₀` if and only if the
powers of `G` tend to zero. -/
theorem forall_exists_tendsto_stationaryIterate_iff (G : Matrix ι ι 𝕜) :
    (∀ c x₀ : ι → 𝕜, ∃ L, Tendsto (stationaryIterate G c x₀) atTop (𝓝 L)) ↔
      Tendsto (fun k : ℕ => G ^ k) atTop (𝓝 0) := by
  sorry

/-- 1.3 If the powers of `G` tend to zero, then `1 − G` is invertible and the iterates of
`x ↦ G x + c` tend to its unique fixed point `(1 − G)⁻¹ c`, from every `x₀`. -/
theorem tendsto_stationaryIterate (G : Matrix ι ι 𝕜)
    (hG : Tendsto (fun k : ℕ => G ^ k) atTop (𝓝 0)) (c x₀ : ι → 𝕜) :
    IsUnit (1 - G) ∧ Tendsto (stationaryIterate G c x₀) atTop (𝓝 ((1 - G)⁻¹ *ᵥ c)) := by
  sorry

end Stationary

/-! ## Layer 2: Jacobi, Gauss–Seidel and successive over-relaxation -/

section Jacobi

variable {ι 𝕜 : Type*} [Fintype ι] [DecidableEq ι] [RCLike 𝕜]

/-- 2.1 The Jacobi iteration matrix `1 − D⁻¹ A`, where `D` is the diagonal part of `A`. -/
def jacobiMatrix (A : Matrix ι ι 𝕜) : Matrix ι ι 𝕜 :=
  1 - (diagonal A.diag)⁻¹ * A

/-- 2.1 The Jacobi iterates for `A x = b`: `x (k + 1) = (1 − D⁻¹ A) x k + D⁻¹ b`. -/
def jacobiIterate (A : Matrix ι ι 𝕜) (b x₀ : ι → 𝕜) : ℕ → ι → 𝕜 :=
  stationaryIterate (jacobiMatrix A) ((diagonal A.diag)⁻¹ *ᵥ b) x₀

/-- 2.2 If `A` is strictly diagonally dominant by rows, the Jacobi iterates converge to `A⁻¹ b`
for every right-hand side and every starting vector. -/
theorem tendsto_jacobiIterate_of_sum_row_lt_diag (A : Matrix ι ι 𝕜)
    (hA : ∀ i, ∑ j ∈ Finset.univ.erase i, ‖A i j‖ < ‖A i i‖) (b x₀ : ι → 𝕜) :
    Tendsto (jacobiIterate A b x₀) atTop (𝓝 (A⁻¹ *ᵥ b)) := by
  sorry

end Jacobi

section SOR

variable {ι 𝕜 : Type*} [Fintype ι] [LinearOrder ι] [RCLike 𝕜]

/-- 2.1 The strictly lower triangular part `L` of `A`. -/
def strictLowerPart (A : Matrix ι ι 𝕜) : Matrix ι ι 𝕜 :=
  Matrix.of fun i j => if j < i then A i j else 0

/-- 2.1 The strictly upper triangular part `U` of `A`. -/
def strictUpperPart (A : Matrix ι ι 𝕜) : Matrix ι ι 𝕜 :=
  Matrix.of fun i j => if i < j then A i j else 0

/-- 2.1 The SOR iteration matrix `(D + ω L)⁻¹ ((1 − ω) D − ω U)` with relaxation parameter `ω`;
`ω = 1` gives the Gauss–Seidel matrix. -/
def sorMatrix (A : Matrix ι ι 𝕜) (ω : ℝ) : Matrix ι ι 𝕜 :=
  (diagonal A.diag + ω • strictLowerPart A)⁻¹ *
    ((1 - ω) • diagonal A.diag - ω • strictUpperPart A)

/-- 2.1 The SOR iterates for `A x = b`:
`(D + ω L) x (k + 1) = ((1 − ω) D − ω U) x k + ω b`, solved for `x (k + 1)`. -/
def sorIterate (A : Matrix ι ι 𝕜) (ω : ℝ) (b x₀ : ι → 𝕜) : ℕ → ι → 𝕜 :=
  stationaryIterate (sorMatrix A ω) (ω • ((diagonal A.diag + ω • strictLowerPart A)⁻¹ *ᵥ b)) x₀

/-- 2.2 If `A` is strictly diagonally dominant by rows, the Gauss–Seidel iterates (SOR with
`ω = 1`) converge to `A⁻¹ b` for every right-hand side and every starting vector. -/
theorem tendsto_sorIterate_one_of_sum_row_lt_diag (A : Matrix ι ι 𝕜)
    (hA : ∀ i, ∑ j ∈ Finset.univ.erase i, ‖A i j‖ < ‖A i i‖) (b x₀ : ι → 𝕜) :
    Tendsto (sorIterate A 1 b x₀) atTop (𝓝 (A⁻¹ *ᵥ b)) := by
  sorry

/-- 2.3 Kahan's bound: for a nonempty index type and a complex matrix with nonzero diagonal
entries, the SOR iteration matrix has spectral radius at least `|ω − 1|`, for every real `ω`. -/
theorem ofReal_abs_sub_one_le_spectralRadius_sorMatrix [Nonempty ι] (A : Matrix ι ι ℂ)
    (hA : ∀ i, A i i ≠ 0) (ω : ℝ) :
    ENNReal.ofReal |ω - 1| ≤ spectralRadius ℂ (sorMatrix A ω) := by
  sorry

/-- 2.4 The Ostrowski–Reich theorem: for a positive definite (Hermitian) matrix on a nonempty
index type, the SOR iterates converge to `A⁻¹ b` for every right-hand side and every starting
vector if and only if `0 < ω < 2`. -/
theorem forall_tendsto_sorIterate_iff [Nonempty ι] {A : Matrix ι ι 𝕜} (hA : A.PosDef) (ω : ℝ) :
    (∀ b x₀ : ι → 𝕜, Tendsto (sorIterate A ω b x₀) atTop (𝓝 (A⁻¹ *ᵥ b))) ↔
      0 < ω ∧ ω < 2 := by
  sorry

end SOR

/-! ## Layer 3: Chebyshev polynomials on an interval and Chebyshev iteration -/

/-- 3.1 The Chebyshev residual polynomial of degree `k` for the interval `[α, β]`:
`T_k((β + α − 2t)/(β − α)) / T_k((β + α)/(β − α))`. -/
def chebyshevResidual (α β : ℝ) (k : ℕ) : ℝ[X] :=
  C ((Chebyshev.T ℝ k).eval ((β + α) / (β - α)))⁻¹ *
    (Chebyshev.T ℝ k).comp (C ((β + α) / (β - α)) - C (2 / (β - α)) * X)

/-- 3.1 For `0 < α < β` the Chebyshev residual polynomial has degree at most `k`, value `1` at
`0`, and absolute value at most `1 / T_k((β + α)/(β − α))` on `[α, β]`. -/
theorem chebyshevResidual_spec {α β : ℝ} (hα : 0 < α) (hαβ : α < β) (k : ℕ) :
    (chebyshevResidual α β k).natDegree ≤ k ∧ (chebyshevResidual α β k).eval 0 = 1 ∧
      ∀ t ∈ Set.Icc α β, |(chebyshevResidual α β k).eval t| ≤
        ((Chebyshev.T ℝ k).eval ((β + α) / (β - α)))⁻¹ := by
  sorry

/-- 3.2 The min–max property: for `0 < α < β`, every real polynomial of degree at most `k` with
value `1` at `0` has absolute value at least `1 / T_k((β + α)/(β − α))` somewhere on `[α, β]`. -/
theorem exists_inv_eval_T_le_abs_eval {α β : ℝ} (hα : 0 < α) (hαβ : α < β) {k : ℕ} {p : ℝ[X]}
    (hp : p.natDegree ≤ k) (hp0 : p.eval 0 = 1) :
    ∃ t ∈ Set.Icc α β, ((Chebyshev.T ℝ k).eval ((β + α) / (β - α)))⁻¹ ≤ |p.eval t| := by
  sorry

section Energy

variable {ι 𝕜 : Type*} [Fintype ι] [DecidableEq ι] [RCLike 𝕜]

/-- 3.4 The energy norm `‖v‖_A = √(Re (v* A v))`; for `A = 1` it is the Euclidean norm. -/
def energyNorm (A : Matrix ι ι 𝕜) (v : ι → 𝕜) : ℝ :=
  √(RCLike.re (star v ⬝ᵥ (A *ᵥ v)))

/-- 3.4 The Chebyshev iterate `x₀ + q(A) (b − A x₀)`, where `1 − t q(t)` is the Chebyshev residual
polynomial of `[α, β]`. -/
def chebyshevIterate (A : Matrix ι ι 𝕜) (b : ι → 𝕜) (α β : ℝ) (k : ℕ) (x₀ : ι → 𝕜) :
    ι → 𝕜 :=
  x₀ + aeval A ((1 - chebyshevResidual α β k) /ₘ X) *ᵥ (b - A *ᵥ x₀)

/-- 3.4 Error bound of Chebyshev iteration: if `A` is Hermitian with every eigenvalue in
`[α, β]`, `0 < α < β`, the error of the Chebyshev iterate is at most `1 / T_k((β + α)/(β − α))`
times the initial error, both in the energy norm and in the Euclidean norm. -/
theorem energyNorm_chebyshevIterate_sub_le {A : Matrix ι ι 𝕜} (hA : A.IsHermitian) {α β : ℝ}
    (hα : 0 < α) (hαβ : α < β) (hspec : ∀ i, hA.eigenvalues i ∈ Set.Icc α β)
    (b x₀ : ι → 𝕜) (k : ℕ) :
    energyNorm A (chebyshevIterate A b α β k x₀ - A⁻¹ *ᵥ b) ≤
        ((Chebyshev.T ℝ k).eval ((β + α) / (β - α)))⁻¹ * energyNorm A (x₀ - A⁻¹ *ᵥ b) ∧
      energyNorm 1 (chebyshevIterate A b α β k x₀ - A⁻¹ *ᵥ b) ≤
        ((Chebyshev.T ℝ k).eval ((β + α) / (β - α)))⁻¹ * energyNorm 1 (x₀ - A⁻¹ *ᵥ b) := by
  sorry

end Energy

/-! ## Layer 4: Krylov spaces and conjugate gradients -/

section Krylov

variable {ι 𝕜 : Type*} [Fintype ι] [DecidableEq ι] [RCLike 𝕜]

/-- 4.1 The Krylov space `K_k(A, r) = span {r, A r, …, A^(k−1) r}`. -/
def krylov (A : Matrix ι ι 𝕜) (r : ι → 𝕜) (k : ℕ) : Submodule 𝕜 (ι → 𝕜) :=
  Submodule.span 𝕜 (Set.range fun i : Fin k => (A ^ (i : ℕ)) *ᵥ r)

/-- 4.2 `x` is a `k`-th conjugate gradient iterate for `A x = b` from `x₀`: it lies in
`x₀ + K_k(A, b − A x₀)` and minimises the energy norm of the error `x − A⁻¹ b` there. -/
def IsCGIterate (A : Matrix ι ι 𝕜) (b x₀ : ι → 𝕜) (k : ℕ) (x : ι → 𝕜) : Prop :=
  x - x₀ ∈ krylov A (b - A *ᵥ x₀) k ∧
    ∀ y, y - x₀ ∈ krylov A (b - A *ᵥ x₀) k →
      energyNorm A (x - A⁻¹ *ᵥ b) ≤ energyNorm A (y - A⁻¹ *ᵥ b)

/-- 4.2 For positive definite `A` the `k`-th conjugate gradient iterate exists and is unique. -/
theorem existsUnique_isCGIterate {A : Matrix ι ι 𝕜} (hA : A.PosDef) (b x₀ : ι → 𝕜) (k : ℕ) :
    ∃! x, IsCGIterate A b x₀ k x := by
  sorry

/-- 4.2 The Galerkin characterization: for positive definite `A`, a point of `x₀ + K_k` is the
`k`-th conjugate gradient iterate if and only if its residual `b − A x` is orthogonal to `K_k`. -/
theorem isCGIterate_iff {A : Matrix ι ι 𝕜} (hA : A.PosDef) (b x₀ : ι → 𝕜) (k : ℕ)
    (x : ι → 𝕜) :
    IsCGIterate A b x₀ k x ↔ x - x₀ ∈ krylov A (b - A *ᵥ x₀) k ∧
      ∀ v ∈ krylov A (b - A *ᵥ x₀) k, star v ⬝ᵥ (b - A *ᵥ x) = 0 := by
  sorry

/-- 4.3 The residuals of the conjugate gradient iterates are mutually orthogonal. -/
theorem star_residual_dotProduct_residual_eq_zero {A : Matrix ι ι 𝕜} (hA : A.PosDef)
    {b x₀ : ι → 𝕜} {x : ℕ → ι → 𝕜} (hx : ∀ k, IsCGIterate A b x₀ k (x k)) {i j : ℕ}
    (hij : i ≠ j) :
    star (b - A *ᵥ x i) ⬝ᵥ (b - A *ᵥ x j) = 0 := by
  sorry

/-- 4.3 The steps `x (k + 1) − x k` of the conjugate gradient iterates are mutually conjugate
with respect to `A`. -/
theorem star_step_dotProduct_mulVec_step_eq_zero {A : Matrix ι ι 𝕜} (hA : A.PosDef)
    {b x₀ : ι → 𝕜} {x : ℕ → ι → 𝕜} (hx : ∀ k, IsCGIterate A b x₀ k (x k)) {i j : ℕ}
    (hij : i ≠ j) :
    star (x (i + 1) - x i) ⬝ᵥ (A *ᵥ (x (j + 1) - x j)) = 0 := by
  sorry

/-- 4.4 Polynomial optimality: the error of the `k`-th conjugate gradient iterate is `p(A) e₀` for
a polynomial `p` of degree at most `k` with `p(0) = 1`, and its energy norm is at most that of
`p(A) e₀` for every such `p`, where `e₀ = x₀ − A⁻¹ b`. -/
theorem IsCGIterate.polynomial_optimal {A : Matrix ι ι 𝕜} (hA : A.PosDef) {b x₀ : ι → 𝕜}
    {k : ℕ} {x : ι → 𝕜} (hx : IsCGIterate A b x₀ k x) :
    (∃ p : 𝕜[X], p.natDegree ≤ k ∧ p.eval 0 = 1 ∧
        x - A⁻¹ *ᵥ b = aeval A p *ᵥ (x₀ - A⁻¹ *ᵥ b)) ∧
      ∀ p : 𝕜[X], p.natDegree ≤ k → p.eval 0 = 1 →
        energyNorm A (x - A⁻¹ *ᵥ b) ≤ energyNorm A (aeval A p *ᵥ (x₀ - A⁻¹ *ᵥ b)) := by
  sorry

/-- 4.4 Finite termination: once `k` reaches the dimension of the largest Krylov space of the
initial residual (the grade of `b − A x₀`, at most the size of the matrix), the `k`-th conjugate
gradient iterate is the solution. -/
theorem IsCGIterate.eq_of_finrank_le {A : Matrix ι ι 𝕜} (hA : A.PosDef) {b x₀ : ι → 𝕜} {k : ℕ}
    {x : ι → 𝕜} (hx : IsCGIterate A b x₀ k x)
    (hk : Module.finrank 𝕜 (krylov A (b - A *ᵥ x₀) (Fintype.card ι)) ≤ k) :
    x = A⁻¹ *ᵥ b := by
  sorry

/-- 4.5 The convergence bound: if `A` is Hermitian with every eigenvalue in `[α, β]`,
`0 < α ≤ β`, and `κ = β / α`, the `k`-th conjugate gradient iterate satisfies
`‖x − A⁻¹ b‖_A ≤ 2 ((√κ − 1)/(√κ + 1))^k ‖x₀ − A⁻¹ b‖_A`. -/
theorem IsCGIterate.energyNorm_sub_le {A : Matrix ι ι 𝕜} (hA : A.IsHermitian) {α β : ℝ}
    (hα : 0 < α) (hαβ : α ≤ β) (hspec : ∀ i, hA.eigenvalues i ∈ Set.Icc α β) {b x₀ : ι → 𝕜}
    {k : ℕ} {x : ι → 𝕜} (hx : IsCGIterate A b x₀ k x) :
    energyNorm A (x - A⁻¹ *ᵥ b) ≤
      2 * ((√(β / α) - 1) / (√(β / α) + 1)) ^ k * energyNorm A (x₀ - A⁻¹ *ᵥ b) := by
  sorry

end Krylov

/-! ## Layer 5: minimal residuals -/

section MinimalResidual

variable {ι 𝕜 : Type*} [Fintype ι] [DecidableEq ι] [RCLike 𝕜]

/-- 5.1 `x` is a `k`-th minimal residual (GMRES) iterate for `A x = b` from `x₀`: it lies in
`x₀ + K_k(A, b − A x₀)` and minimises the Euclidean norm of the residual `b − A x` there. -/
def IsGMRESIterate (A : Matrix ι ι 𝕜) (b x₀ : ι → 𝕜) (k : ℕ) (x : ι → 𝕜) : Prop :=
  x - x₀ ∈ krylov A (b - A *ᵥ x₀) k ∧
    ∀ y, y - x₀ ∈ krylov A (b - A *ᵥ x₀) k →
      energyNorm 1 (b - A *ᵥ x) ≤ energyNorm 1 (b - A *ᵥ y)

/-- 5.1 A `k`-th minimal residual iterate exists for every square matrix, singular or not. -/
theorem exists_isGMRESIterate (A : Matrix ι ι 𝕜) (b x₀ : ι → 𝕜) (k : ℕ) :
    ∃ x, IsGMRESIterate A b x₀ k x := by
  sorry

/-- 5.1 Polynomial optimality: the residual of a `k`-th minimal residual iterate is `p(A) r₀` for
a polynomial `p` of degree at most `k` with `p(0) = 1`, and its Euclidean norm is at most that of
`p(A) r₀` for every such `p`, where `r₀ = b − A x₀`. -/
theorem IsGMRESIterate.polynomial_optimal {A : Matrix ι ι 𝕜} {b x₀ : ι → 𝕜} {k : ℕ}
    {x : ι → 𝕜} (hx : IsGMRESIterate A b x₀ k x) :
    (∃ p : 𝕜[X], p.natDegree ≤ k ∧ p.eval 0 = 1 ∧
        b - A *ᵥ x = aeval A p *ᵥ (b - A *ᵥ x₀)) ∧
      ∀ p : 𝕜[X], p.natDegree ≤ k → p.eval 0 = 1 →
        energyNorm 1 (b - A *ᵥ x) ≤ energyNorm 1 (aeval A p *ᵥ (b - A *ᵥ x₀)) := by
  sorry

/-- 5.2 For a normal complex matrix, the residual of a `k`-th minimal residual iterate is at most
`M ‖r₀‖` whenever `p` has degree at most `k`, `p(0) = 1` and `|p| ≤ M` on the spectrum of `A`. -/
theorem IsGMRESIterate.energyNorm_one_residual_le {A : Matrix ι ι ℂ} [IsStarNormal A]
    {b x₀ : ι → ℂ} {k : ℕ} {x : ι → ℂ} (hx : IsGMRESIterate A b x₀ k x) {p : ℂ[X]}
    (hp : p.natDegree ≤ k) (hp0 : p.eval 0 = 1) {M : ℝ}
    (hM : ∀ z ∈ spectrum ℂ A, ‖p.eval z‖ ≤ M) :
    energyNorm 1 (b - A *ᵥ x) ≤ M * energyNorm 1 (b - A *ᵥ x₀) := by
  sorry

/-- 5.3 Finite termination: for invertible `A`, once `k` reaches the grade of `b − A x₀`, every
`k`-th minimal residual iterate solves `A x = b`. -/
theorem IsGMRESIterate.mulVec_eq_of_finrank_le {A : Matrix ι ι 𝕜} (hA : IsUnit A)
    {b x₀ : ι → 𝕜} {k : ℕ} {x : ι → 𝕜} (hx : IsGMRESIterate A b x₀ k x)
    (hk : Module.finrank 𝕜 (krylov A (b - A *ᵥ x₀) (Fintype.card ι)) ≤ k) :
    A *ᵥ x = b := by
  sorry

end MinimalResidual

end TauCetiRoadmap.IterativeMethodsForLinearSystems
