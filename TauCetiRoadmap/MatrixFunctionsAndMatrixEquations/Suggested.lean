module

public import Mathlib
public import TauCeti.Analysis.Normed.Ring.StableSequence
public import TauCeti.Analysis.InnerProductSpace.Sylvester
public import TauCeti.LinearAlgebra.End.JordanChain.Basic
public import TauCeti.LinearAlgebra.Matrix.CompanionPencil

/-!
# Matrix functions and matrix equations: suggested target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is `README.md`.
This file states the headlines of `README.md` that carry a Lean name, each with every conclusion
the README attaches to it, against the pinned Mathlib and Tau Ceti, with `sorry` proofs and the
definitions they need. These are suggested forms; the README's other headlines are targets of the
same standing, stated in prose.

Conventions (README, Conventions). Square matrices are `Matrix n n ℂ` over a finite index type
`n` with decidable equality; `Fin k` appears where a size is a number. Norms come from Mathlib's
scoped instances, opened in the statement that uses them (`Matrix.Norms.L2Operator` for the
spectral norm). Matrix-valued integrals and contour integrals are entrywise, as in
LinearSystemsAndControl, so that no statement depends on a norm it does not mention. The index
of an eigenvalue `μ` of `A` is its multiplicity as a root of the minimal polynomial
(`jordanIndex`), and a function on the spectrum is given by its jet `jet μ j`, standing for
`f⁽ʲ⁾(μ)`. Statements about a general submultiplicative norm are stated in a complete normed
`ℂ`-algebra `𝔸`, of which `Matrix n n ℂ` with any scoped norm is an instance.

Two definitions are verbatim local copies of those of LinearSystemsAndControl §1.1
(`reachableSubspace`, `IsControllable`), over an arbitrary field.

Two declarations are proved here, as sanity checks, not targets: `commute_primaryFunction` and
`isHermitian_of_lyapunov`.

Bold headlines of the README not stated here: the agreement of `matrixFunction` with the
holomorphic calculus of BanachAlgebras §2.1 (§2.2), and the contour solution of the Sylvester
equation over a general cycle (§5.2), both of which need that roadmap's cycles and calculus; and
the global form of Keldysh's theorem (§7.2), the sum of the local statements over the finitely
many eigenvalues in a compact set.

The `#check` lines at the end of the file pin the Mathlib and Tau Ceti names that the README
uses, including Tau Ceti's scalar `TauCeti.companionPencil` named in its Scope.
-/

@[expose] public section

noncomputable section

namespace TauCetiRoadmap.MatrixFunctionsAndMatrixEquations

open Matrix Polynomial Filter Topology MeasureTheory Set Complex
open scoped ENNReal NNReal ComplexOrder

variable {n : Type*} [Fintype n] [DecidableEq n]

/-! ## Layer 1: primary matrix functions -/

/-! ### 1.1 Jordan blocks and the index -/

/-- The Jordan block of order `k` for the eigenvalue `μ`: `μ` on the diagonal and `1` on the
first superdiagonal. -/
def jordanBlock {R : Type*} [Ring R] (k : ℕ) (μ : R) : Matrix (Fin k) (Fin k) R :=
  Matrix.of fun i j => if i = j then μ else if (j : ℕ) = i + 1 then 1 else 0

/-- The index of `μ` for `A`: its multiplicity as a root of the minimal polynomial of `A`, the
order of the largest Jordan block of `A` for `μ` (`0` when `μ` is not an eigenvalue). -/
def jordanIndex (A : Matrix n n ℂ) (μ : ℂ) : ℕ :=
  (minpoly ℂ A).rootMultiplicity μ

/-- The upper triangular Toeplitz matrix of order `k` with entries `c (j - i) / (j - i)!` on and
above the diagonal: the value of a function with jet `c` at a Jordan block of order `k`. -/
def jetToeplitz (k : ℕ) (c : ℕ → ℂ) : Matrix (Fin k) (Fin k) ℂ :=
  Matrix.of fun i j => if i ≤ j then c ((j : ℕ) - i) / (((j : ℕ) - i).factorial : ℂ) else 0

/-- 1.1 A polynomial at a Jordan block is the Toeplitz matrix of its normalized derivatives. -/
theorem aeval_jordanBlock (k : ℕ) (μ : ℂ) (p : ℂ[X]) :
    aeval (jordanBlock k μ) p = jetToeplitz k (fun j => (derivative^[j] p).eval μ) := by
  sorry

/-- 1.1 A Jordan block of positive order `k` has the single eigenvalue `μ`, of index `k`. -/
theorem spectrum_jordanBlock {k : ℕ} (hk : 0 < k) (μ : ℂ) :
    spectrum ℂ (jordanBlock k μ) = {μ} ∧ jordanIndex (jordanBlock k μ) μ = k := by
  sorry

/-- 1.1 The Jordan canonical form: every complex matrix is similar to a block diagonal matrix of
Jordan blocks, and the index of each eigenvalue is the largest order of a block for it. -/
theorem exists_jordanForm (A : Matrix n n ℂ) :
    ∃ (p : ℕ) (m : Fin p → ℕ) (μ : Fin p → ℂ) (e : (Σ k, Fin (m k)) ≃ n) (Z : Matrix n n ℂ),
      IsUnit Z ∧ (∀ k, 0 < m k) ∧
      A = Z * reindex e e (blockDiagonal' fun k => jordanBlock (m k) (μ k)) * Z⁻¹ ∧
      ∀ ν, jordanIndex A ν = (Finset.univ.filter fun k => μ k = ν).sup m := by
  sorry

/-! ### 1.2 The primary matrix function -/

/-- `r` interpolates the jet `jet` on the spectrum of `A`: its derivatives of order less than the
index agree with the jet at every eigenvalue. -/
def IsHermiteInterpolant (A : Matrix n n ℂ) (jet : ℂ → ℕ → ℂ) (r : ℂ[X]) : Prop :=
  ∀ μ ∈ spectrum ℂ A, ∀ j < jordanIndex A μ, (derivative^[j] r).eval μ = jet μ j

/-- The primary matrix function `f(A)` of the jet `jet` (standing for the values `f⁽ʲ⁾(μ)` on
the spectrum): `r(A)` for a Hermite interpolant `r`. An interpolant always exists (BanachAlgebras
§2.2), so the fallback value `0` is never used. -/
def primaryFunction (A : Matrix n n ℂ) (jet : ℂ → ℕ → ℂ) : Matrix n n ℂ := by
  classical
  exact if h : ∃ r, IsHermiteInterpolant A jet r then aeval A h.choose else 0

/-- The matrix function `f(A)` of a scalar function: the primary function of its jet. It is
meaningful when `f` is differentiable often enough at the eigenvalues; the statements below
assume holomorphy near the spectrum. -/
def matrixFunction (f : ℂ → ℂ) (A : Matrix n n ℂ) : Matrix n n ℂ :=
  primaryFunction A fun μ j => iteratedDeriv j f μ

/-- 1.2 Every Hermite interpolant gives the primary function. -/
theorem primaryFunction_eq_aeval {A : Matrix n n ℂ} {jet : ℂ → ℕ → ℂ} {r : ℂ[X]}
    (hr : IsHermiteInterpolant A jet r) : primaryFunction A jet = aeval A r := by
  sorry

/-- 1.2 Two jets give the same primary function exactly when they agree on the spectrum below
the index. -/
theorem primaryFunction_eq_iff (A : Matrix n n ℂ) (jet jet' : ℂ → ℕ → ℂ) :
    primaryFunction A jet = primaryFunction A jet' ↔
      ∀ μ ∈ spectrum ℂ A, ∀ j < jordanIndex A μ, jet μ j = jet' μ j := by
  sorry

/-- 1.2 The Jordan-form definition: for any Jordan form `A = Z J Z⁻¹`, the primary function is
`Z f(J) Z⁻¹`, with `f(J_k)` the Toeplitz matrix of the jet at the eigenvalue of the block. -/
theorem primaryFunction_eq_conj_blockDiagonal (A : Matrix n n ℂ) (jet : ℂ → ℕ → ℂ) {p : ℕ}
    (m : Fin p → ℕ) (μ : Fin p → ℂ) (e : (Σ k, Fin (m k)) ≃ n) (Z : Matrix n n ℂ) (hZ : IsUnit Z)
    (hA : A = Z * reindex e e (blockDiagonal' fun k => jordanBlock (m k) (μ k)) * Z⁻¹) :
    primaryFunction A jet =
      Z * reindex e e (blockDiagonal' fun k => jetToeplitz (m k) (jet (μ k))) * Z⁻¹ := by
  sorry

/-! ### 1.3 Properties -/

/-- 1.3 Every matrix commuting with `A` commutes with `f(A)`; in particular `f(A)` commutes
with `A`. Proved here: `f(A)` is a polynomial in `A`. -/
theorem commute_primaryFunction {A X : Matrix n n ℂ} (h : Commute X A) (jet : ℂ → ℕ → ℂ) :
    Commute X (primaryFunction A jet) := by
  classical
  unfold primaryFunction
  split_ifs with hr
  · induction hr.choose using Polynomial.induction_on' with
    | add p q hp hq => rw [map_add]; exact hp.add_right hq
    | monomial k c =>
      rw [aeval_monomial]
      exact Commute.mul_right (Algebra.commutes c X).symm (h.pow_right k)
  · exact Commute.zero_right X

/-- 1.3 Transposition: `f(Aᵀ) = f(A)ᵀ`. -/
theorem primaryFunction_transpose (A : Matrix n n ℂ) (jet : ℂ → ℕ → ℂ) :
    primaryFunction Aᵀ jet = (primaryFunction A jet)ᵀ := by
  sorry

/-- 1.3 Similarity: `f(Z A Z⁻¹) = Z f(A) Z⁻¹` for invertible `Z`. -/
theorem primaryFunction_conj (A : Matrix n n ℂ) (jet : ℂ → ℕ → ℂ) {Z : Matrix n n ℂ}
    (hZ : IsUnit Z) :
    primaryFunction (Z * A * Z⁻¹) jet = Z * primaryFunction A jet * Z⁻¹ := by
  sorry

/-- 1.3 Spectral mapping: the eigenvalues of `f(A)` are the `f(μ)`. -/
theorem spectrum_primaryFunction (A : Matrix n n ℂ) (jet : ℂ → ℕ → ℂ) :
    spectrum ℂ (primaryFunction A jet) = (fun μ => jet μ 0) '' spectrum ℂ A := by
  sorry

/-- 1.3 Block upper triangular matrices: `f` of a block upper triangular matrix is block upper
triangular with diagonal blocks `f(A₁₁)` and `f(A₂₂)`. -/
theorem primaryFunction_fromBlocks_zero₂₁ {p q : Type*} [Fintype p] [DecidableEq p] [Fintype q]
    [DecidableEq q] (A₁₁ : Matrix p p ℂ) (A₁₂ : Matrix p q ℂ) (A₂₂ : Matrix q q ℂ)
    (jet : ℂ → ℕ → ℂ) :
    ∃ Y, primaryFunction (fromBlocks A₁₁ A₁₂ 0 A₂₂) jet =
      fromBlocks (primaryFunction A₁₁ jet) Y 0 (primaryFunction A₂₂ jet) := by
  sorry

/-- 1.3 Block diagonal matrices: `f(diag(A₁₁, A₂₂)) = diag(f(A₁₁), f(A₂₂))`. -/
theorem primaryFunction_fromBlocks_diagonal {p q : Type*} [Fintype p] [DecidableEq p]
    [Fintype q] [DecidableEq q] (A₁₁ : Matrix p p ℂ) (A₂₂ : Matrix q q ℂ) (jet : ℂ → ℕ → ℂ) :
    primaryFunction (fromBlocks A₁₁ 0 0 A₂₂) jet =
      fromBlocks (primaryFunction A₁₁ jet) 0 0 (primaryFunction A₂₂ jet) := by
  sorry

/-! ## Layer 2: power series, the Cauchy integral and approximation -/

/-! ### 2.1 Power series -/

/-- The jet of the power series `∑ₖ a k (z - α)ᵏ` at `μ`, by termwise differentiation:
`seriesJet a α μ j = ∑ₖ a (k + j) (k + j)! / k! (μ - α)ᵏ`. Off the closed disc of convergence
the series diverges and the value is the junk `0`; the statements below never use it there. -/
def seriesJet (a : ℕ → ℂ) (α μ : ℂ) (j : ℕ) : ℂ :=
  ∑' k, a (k + j) * ((k + j).descFactorial j : ℂ) * (μ - α) ^ k

/-- 2.1 The power-series criterion: `∑ₖ a k (A - α)ᵏ` converges if and only if every eigenvalue
lies inside the circle of convergence, or on it with the series differentiated `index - 1`
times convergent there. -/
theorem summable_smul_sub_pow_iff (A : Matrix n n ℂ) (a : ℕ → ℂ) (α : ℂ) :
    Summable (fun k => a k • (A - α • 1) ^ k) ↔
      ∀ μ ∈ spectrum ℂ A,
        (‖μ - α‖₊ : ℝ≥0∞) < (FormalMultilinearSeries.ofScalars ℂ a).radius ∨
          ((‖μ - α‖₊ : ℝ≥0∞) = (FormalMultilinearSeries.ofScalars ℂ a).radius ∧
            Summable fun k => a (k + (jordanIndex A μ - 1)) *
              ((k + (jordanIndex A μ - 1)).descFactorial (jordanIndex A μ - 1) : ℂ) *
                (μ - α) ^ k) := by
  sorry

/-- 2.1 When the series converges, its sum is the primary function of the series jet. -/
theorem hasSum_smul_sub_pow (A : Matrix n n ℂ) (a : ℕ → ℂ) (α : ℂ)
    (h : Summable fun k => a k • (A - α • 1) ^ k) :
    HasSum (fun k => a k • (A - α • 1) ^ k) (primaryFunction A (seriesJet a α)) := by
  sorry

/-! ### 2.2 The Cauchy integral on a circle -/

/-- 2.2 The Cauchy integral: for `f` holomorphic on a disc and continuous on its closure, with
the spectrum of `A` inside the disc, `f(A) = (2πi)⁻¹ ∮ f(ζ) (ζ I - A)⁻¹ dζ` (entrywise). -/
theorem matrixFunction_eq_circleIntegral (A : Matrix n n ℂ) {f : ℂ → ℂ} {c : ℂ} {R : ℝ}
    (hf : DiffContOnCl ℂ f (Metric.ball c R)) (hA : spectrum ℂ A ⊆ Metric.ball c R) :
    matrixFunction f A = (2 * π * I)⁻¹ •
      Matrix.of fun i j => ∮ z in C(c, R), f z * (z • (1 : Matrix n n ℂ) - A)⁻¹ i j := by
  sorry

/-! ### 2.3 Approximation bounds -/

open scoped Matrix.Norms.L2Operator in
/-- 2.3 The resolvent bound on a circle, in the spectral norm. -/
theorem norm_matrixFunction_sub_le (A : Matrix n n ℂ) {f g : ℂ → ℂ} {c : ℂ} {R : ℝ}
    (hf : DiffContOnCl ℂ f (Metric.ball c R)) (hg : DiffContOnCl ℂ g (Metric.ball c R))
    (hA : spectrum ℂ A ⊆ Metric.ball c R) :
    ‖matrixFunction f A - matrixFunction g A‖ ≤ (2 * π)⁻¹ *
      ∫ θ in (0 : ℝ)..(2 * π), ‖f (circleMap c R θ) - g (circleMap c R θ)‖ *
        ‖(circleMap c R θ • (1 : Matrix n n ℂ) - A)⁻¹‖ * |R| := by
  sorry

open scoped Matrix.Norms.L2Operator in
/-- 2.3 The diagonalizable bound: for `A = Z diag(d) Z⁻¹`,
`‖f(A) - g(A)‖₂ ≤ κ₂(Z) maxᵢ |f(dᵢ) - g(dᵢ)|`. -/
theorem norm_primaryFunction_sub_le_of_diagonal {A Z : Matrix n n ℂ} {d : n → ℂ}
    (hZ : IsUnit Z) (hA : A = Z * diagonal d * Z⁻¹) (jet jet' : ℂ → ℕ → ℂ) :
    ‖primaryFunction A jet - primaryFunction A jet'‖ ≤
      TauCeti.conditionNumber Z * ⨆ i, ‖jet (d i) 0 - jet' (d i) 0‖ := by
  sorry

open scoped Matrix.Norms.L2Operator in
/-- 2.3 For normal `A` the condition number is replaced by `1`. -/
theorem norm_primaryFunction_sub_le_of_isStarNormal {A : Matrix n n ℂ} (hA : IsStarNormal A)
    (jet jet' : ℂ → ℕ → ℂ) :
    ‖primaryFunction A jet - primaryFunction A jet'‖ ≤
      ⨆ μ : spectrum ℂ A, ‖jet μ 0 - jet' μ 0‖ := by
  sorry

/-! ## Layer 3: the Fréchet derivative and the condition number -/

/-! ### 3.1 The Fréchet derivative -/

open scoped Matrix.Norms.L2Operator in
/-- 3.1 Holomorphic case: for `f` holomorphic on an open set containing the spectrum, `X ↦ f(X)`
is Fréchet differentiable at `A`, and the derivative is the corner of `f` at the block matrix
`[[A, E], [0, A]]`. -/
theorem exists_hasFDerivAt_matrixFunction (A : Matrix n n ℂ) {f : ℂ → ℂ} {D : Set ℂ}
    (hD : IsOpen D) (hf : DifferentiableOn ℂ f D) (hA : spectrum ℂ A ⊆ D) :
    ∃ L : Matrix n n ℂ →L[ℂ] Matrix n n ℂ, HasFDerivAt (matrixFunction f) L A ∧
      ∀ E, matrixFunction f (fromBlocks A E 0 A) =
        fromBlocks (matrixFunction f A) (L E) 0 (matrixFunction f A) := by
  sorry

/-- The matrix function of a function of a real variable, at a matrix with real spectrum: the
primary function of the real derivatives at the real parts of the eigenvalues. -/
def realMatrixFunction (f : ℝ → ℂ) (A : Matrix n n ℂ) : Matrix n n ℂ :=
  primaryFunction A fun μ j => iteratedDeriv j f μ.re

open scoped Matrix.Norms.L2Operator in
/-- 3.1 Real case: for `A` with spectrum in an open set `D ⊆ ℝ` and `f` of class
`C^{2N-1}` on `D`, `N` the order of `A`, the derivative exists within the matrices with
spectrum in `D`, with the same block formula. -/
theorem exists_hasFDerivWithinAt_realMatrixFunction (A : Matrix n n ℂ) {f : ℝ → ℂ}
    {D : Set ℝ} (hD : IsOpen D) (hf : ContDiffOn ℝ (2 * Fintype.card n - 1 : ℕ) f D)
    (hA : spectrum ℂ A ⊆ ofReal '' D) :
    ∃ L : Matrix n n ℂ →L[ℂ] Matrix n n ℂ,
      HasFDerivWithinAt (realMatrixFunction f) L {X | spectrum ℂ X ⊆ ofReal '' D} A ∧
      ∀ E, realMatrixFunction f (fromBlocks A E 0 A) =
        fromBlocks (realMatrixFunction f A) (L E) 0 (realMatrixFunction f A) := by
  sorry

/-! ### 3.2 The condition number -/

/-- The relative condition number of a map `F` at `x`: the limit superior as `ε → 0⁺` of the
largest relative change `‖F(x + h) - F(x)‖ / (ε ‖F(x)‖)` over `‖h‖ ≤ ε ‖x‖`, in `ℝ≥0∞`. -/
def relativeCondition {E G : Type*} [NormedAddCommGroup E] [NormedAddCommGroup G]
    (F : E → G) (x : E) : ℝ≥0∞ :=
  limsup (fun ε : ℝ => ⨆ (h : E) (_ : ‖h‖ ≤ ε * ‖x‖),
    ENNReal.ofReal (‖F (x + h) - F x‖ / (ε * ‖F x‖))) (𝓝[>] 0)

/-- 3.2 Rice's formula: if `F` is Fréchet differentiable at `x`, the largest relative change
converges, and the relative condition number is `‖L‖ ‖x‖ / ‖F x‖`. At `F x = 0` both sides are
the junk value `0` (division by zero), so no hypothesis `F x ≠ 0` is needed. -/
theorem relativeCondition_eq {E G : Type*} [NormedAddCommGroup E] [NormedSpace ℂ E]
    [NormedAddCommGroup G] [NormedSpace ℂ G] {F : E → G} {L : E →L[ℂ] G} {x : E}
    (hF : HasFDerivAt F L x) :
    Tendsto (fun ε : ℝ => ⨆ (h : E) (_ : ‖h‖ ≤ ε * ‖x‖),
        ENNReal.ofReal (‖F (x + h) - F x‖ / (ε * ‖F x‖))) (𝓝[>] 0)
        (𝓝 (ENNReal.ofReal (‖L‖ * ‖x‖ / ‖F x‖))) ∧
      relativeCondition F x = ENNReal.ofReal (‖L‖ * ‖x‖ / ‖F x‖) := by
  sorry

/-! ### 3.3 Power series in a Banach algebra -/

/-- 3.3 The derivative of a power series: for `‖x‖` below the radius of convergence of
`∑ₖ a k zᵏ`, the map `y ↦ ∑ₖ a k yᵏ` has derivative
`E ↦ ∑ₖ a (k + 1) ∑_{j ≤ k} xʲ E x^{k-j}`, of norm at most `∑ₖ (k + 1) |a (k + 1)| ‖x‖ᵏ`, for
every submultiplicative norm. -/
theorem hasFDerivAt_tsum_smul_pow {𝔸 : Type*} [NormedRing 𝔸] [NormedAlgebra ℂ 𝔸]
    [CompleteSpace 𝔸] (a : ℕ → ℂ) {x : 𝔸}
    (hx : (‖x‖₊ : ℝ≥0∞) < (FormalMultilinearSeries.ofScalars ℂ a).radius) :
    ∃ L : 𝔸 →L[ℂ] 𝔸, HasFDerivAt (fun y => ∑' k, a k • y ^ k) L x ∧
      (∀ E, L E = ∑' k, a (k + 1) • ∑ j ∈ Finset.range (k + 1), x ^ j * E * x ^ (k - j)) ∧
      ‖L‖ ≤ ∑' k, ((k + 1 : ℕ) : ℝ) * ‖a (k + 1)‖ * ‖x‖ ^ k := by
  sorry

/-- 3.3 The value bound `‖∑ₖ a k xᵏ‖ ≤ ∑ₖ |a k| ‖x‖ᵏ`, for a norm with `‖1‖ = 1`. -/
theorem norm_tsum_smul_pow_le {𝔸 : Type*} [NormedRing 𝔸] [NormedAlgebra ℂ 𝔸] [NormOneClass 𝔸]
    [CompleteSpace 𝔸] (a : ℕ → ℂ) {x : 𝔸}
    (hx : (‖x‖₊ : ℝ≥0∞) < (FormalMultilinearSeries.ofScalars ℂ a).radius) :
    ‖∑' k, a k • x ^ k‖ ≤ ∑' k, ‖a k‖ * ‖x‖ ^ k := by
  sorry

/-! ## Layer 4: Padé approximants of the exponential and scaling and squaring -/

/-! ### 4.1 The Padé approximants -/

/-- The numerator `p_{km}` of the `[k/m]` Padé approximant of the exponential. -/
def padeNum (k m : ℕ) : ℂ[X] :=
  ∑ j ∈ Finset.range (k + 1), C (((k + m - j).factorial * k.factorial : ℂ) /
    ((k + m).factorial * (k - j).factorial * j.factorial)) * X ^ j

/-- The denominator `q_{km}` of the `[k/m]` Padé approximant of the exponential. -/
def padeDen (k m : ℕ) : ℂ[X] :=
  ∑ j ∈ Finset.range (m + 1), C (((k + m - j).factorial * m.factorial : ℂ) /
    ((k + m).factorial * (m - j).factorial * j.factorial) * (-1) ^ j) * X ^ j

/-- 4.1 The order condition: `q_{km}(z) eᶻ - p_{km}(z)` vanishes to order at least
`k + m + 1` at `0`. -/
theorem le_analyticOrderAt_padeDen_mul_exp_sub_padeNum (k m : ℕ) :
    ((k + m + 1 : ℕ) : ℕ∞) ≤
      analyticOrderAt (fun z => (padeDen k m).eval z * exp z - (padeNum k m).eval z) 0 := by
  sorry

/-- 4.1 Uniqueness: a pair `(p, q)` with `deg p ≤ k`, `deg q ≤ m`, `q(0) = 1` and the order
condition is `(p_{km}, q_{km})`. -/
theorem eq_padeNum_of_le_analyticOrderAt {k m : ℕ} {p q : ℂ[X]} (hp : p.natDegree ≤ k)
    (hq : q.natDegree ≤ m) (hq0 : q.eval 0 = 1)
    (h : ((k + m + 1 : ℕ) : ℕ∞) ≤ analyticOrderAt (fun z => q.eval z * exp z - p.eval z) 0) :
    p = padeNum k m ∧ q = padeDen k m := by
  sorry

/-! ### 4.2 Scaling and squaring -/

/-- `ν_m`: the least modulus of a zero of `q_{mm}`, in `ℝ≥0∞` (`⊤` when there is none). -/
def padeRadius (m : ℕ) : ℝ≥0∞ :=
  ⨅ z ∈ (padeDen m m).roots, (‖z‖₊ : ℝ≥0∞)

variable {𝔸 : Type*} [NormedRing 𝔸] [NormedAlgebra ℂ 𝔸] [CompleteSpace 𝔸]

/-- The diagonal Padé approximant `r_m(X) = q_{mm}(X)⁻¹ p_{mm}(X)` in a Banach algebra. -/
def padeApprox (m : ℕ) (X : 𝔸) : 𝔸 :=
  Ring.inverse (aeval X (padeDen m m)) * aeval X (padeNum m m)

/-- The logarithm series `log(1 + G) = ∑_{k ≥ 1} (-1)^{k+1} Gᵏ / k`. -/
def logOneAdd (G : 𝔸) : 𝔸 :=
  ∑' k : ℕ, ((-1 : ℂ) ^ k / (k + 1 : ℂ)) • G ^ (k + 1)

/-- The Taylor coefficients `cᵢ` of `e^{-x} r_m(x) - 1` at `0`. -/
def padeResidualCoeff (m i : ℕ) : ℂ :=
  iteratedDeriv i (fun z => exp (-z) * ((padeNum m m).eval z / (padeDen m m).eval z) - 1) 0 /
    (i.factorial : ℂ)

/-- 4.2 The residual `e^{-x} r_m(x) - 1` vanishes to order `2m + 1` at `0`. -/
theorem padeResidualCoeff_eq_zero {m i : ℕ} (hi : i ≤ 2 * m) : padeResidualCoeff m i = 0 := by
  sorry

/-- 4.2 Scaling and squaring is exact for a perturbed argument: if `X = 2⁻ˢ A` satisfies
`ρ(e^{-X} r_m(X) - 1) < 1`, then `r_m(X)^{2ˢ} = e^{A + ΔA}` with
`ΔA = 2ˢ log(e^{-X} r_m(X))`, and `ΔA` commutes with `A`. The source's second condition
`ρ(X) < ν_m` is implied: if `q_{mm}(X)` is not invertible then `r_m(X)` is the junk `0` and the
spectral radius is `1`. -/
theorem padeApprox_pow_eq_exp (m s : ℕ) (A : 𝔸)
    (h : spectralRadius ℂ (NormedSpace.exp (-((2 : ℂ) ^ s)⁻¹ • A) *
      padeApprox m (((2 : ℂ) ^ s)⁻¹ • A) - 1) < 1) :
    padeApprox m (((2 : ℂ) ^ s)⁻¹ • A) ^ (2 ^ s) =
        NormedSpace.exp (A + (2 : ℂ) ^ s • logOneAdd (NormedSpace.exp (-((2 : ℂ) ^ s)⁻¹ • A) *
          padeApprox m (((2 : ℂ) ^ s)⁻¹ • A) - 1)) ∧
      Commute A ((2 : ℂ) ^ s • logOneAdd (NormedSpace.exp (-((2 : ℂ) ^ s)⁻¹ • A) *
          padeApprox m (((2 : ℂ) ^ s)⁻¹ • A) - 1)) := by
  sorry

/-- 4.2 The backward error bound: with `θ = ‖2⁻ˢ A‖` and `F = ∑ᵢ |cᵢ| θⁱ < 1`, the
hypothesis of `padeApprox_pow_eq_exp` holds, `ρ(2⁻ˢ A) < ν_m`, and
`‖ΔA‖ / ‖A‖ ≤ -log(1 - F) / θ`, for every submultiplicative norm. -/
theorem norm_padeBackwardError_le (m s : ℕ) {A : 𝔸}
    (hF : ∑' i, (‖padeResidualCoeff m i‖₊ : ℝ≥0∞) * (‖((2 : ℂ) ^ s)⁻¹ • A‖₊ : ℝ≥0∞) ^ i < 1) :
    spectralRadius ℂ (NormedSpace.exp (-((2 : ℂ) ^ s)⁻¹ • A) *
        padeApprox m (((2 : ℂ) ^ s)⁻¹ • A) - 1) < 1 ∧
      spectralRadius ℂ (((2 : ℂ) ^ s)⁻¹ • A) < padeRadius m ∧
      ‖(2 : ℂ) ^ s • logOneAdd (NormedSpace.exp (-((2 : ℂ) ^ s)⁻¹ • A) *
          padeApprox m (((2 : ℂ) ^ s)⁻¹ • A) - 1)‖ / ‖A‖ ≤
        -Real.log (1 - (∑' i, (‖padeResidualCoeff m i‖₊ : ℝ≥0∞) *
          (‖((2 : ℂ) ^ s)⁻¹ • A‖₊ : ℝ≥0∞) ^ i).toReal) / ‖((2 : ℂ) ^ s)⁻¹ • A‖ := by
  sorry

/-! ## Layer 5: the Sylvester equation -/

variable {m' : Type*} [Fintype m'] [DecidableEq m']

/-- The Sylvester map `X ↦ A X - X B` on `m' × n` matrices. -/
def sylvesterMap (A : Matrix m' m' ℂ) (B : Matrix n n ℂ) :
    Matrix m' n ℂ →ₗ[ℂ] Matrix m' n ℂ :=
  mulLeftLinearMap n ℂ A - mulRightLinearMap m' ℂ B

/-- 5.1 The spectrum of the Sylvester map is the set of differences `λ - μ`. -/
theorem spectrum_sylvesterMap (A : Matrix m' m' ℂ) (B : Matrix n n ℂ) :
    spectrum ℂ (sylvesterMap A B) = image2 (· - ·) (spectrum ℂ A) (spectrum ℂ B) := by
  sorry

/-- 5.1 The Sylvester equation is uniquely solvable for every right side if and only if the
spectra of `A` and `B` are disjoint. -/
theorem bijective_sylvesterMap_iff (A : Matrix m' m' ℂ) (B : Matrix n n ℂ) :
    Function.Bijective (sylvesterMap A B) ↔ Disjoint (spectrum ℂ A) (spectrum ℂ B) := by
  sorry

/-- 5.2 The contour solution on a circle separating the two spectra. -/
theorem sylvesterMap_circleIntegral (A : Matrix m' m' ℂ) (B : Matrix n n ℂ) (C : Matrix m' n ℂ)
    {c : ℂ} {R : ℝ} (hA : spectrum ℂ A ⊆ Metric.ball c R)
    (hB : Disjoint (spectrum ℂ B) (Metric.closedBall c R)) :
    sylvesterMap A B ((2 * π * I)⁻¹ • Matrix.of fun i j =>
      ∮ z in C(c, R), ((z • (1 : Matrix m' m' ℂ) - A)⁻¹ * C * (z • (1 : Matrix n n ℂ) - B)⁻¹)
        i j) = C := by
  sorry

/-- 5.3 The half-line solution: if the eigenvalues of `A` have positive and those of `B` negative
real part, the integrand `e^{-tA} C e^{tB}` is integrable on `(0, ∞)` and its integral solves
`A X - X B = C`. -/
theorem sylvesterMap_integral (A : Matrix m' m' ℂ) (B : Matrix n n ℂ) (C : Matrix m' n ℂ)
    (hA : ∀ μ ∈ spectrum ℂ A, 0 < μ.re) (hB : ∀ μ ∈ spectrum ℂ B, μ.re < 0) :
    (∀ i j, IntegrableOn (fun t : ℝ =>
      (NormedSpace.exp (-(t : ℂ) • A) * C * NormedSpace.exp ((t : ℂ) • B)) i j) (Ioi 0)) ∧
    sylvesterMap A B (Matrix.of fun i j => ∫ t in Ioi (0 : ℝ),
      (NormedSpace.exp (-(t : ℂ) • A) * C * NormedSpace.exp ((t : ℂ) • B)) i j) = C := by
  sorry

/-! ## Layer 6: the Lyapunov equation and the reachability Gramian -/

/-- 6.1 The Lyapunov map `X ↦ A X + X Aᴴ` is bijective if and only if `λ + μ̄ ≠ 0` for all
eigenvalues `λ`, `μ` of `A`. -/
theorem bijective_sylvesterMap_neg_conjTranspose_iff (A : Matrix n n ℂ) :
    Function.Bijective (sylvesterMap A (-Aᴴ)) ↔
      ∀ μ ∈ spectrum ℂ A, ∀ ν ∈ spectrum ℂ A, μ + star ν ≠ 0 := by
  sorry

/-- 6.1 When the Lyapunov map is bijective, the solution for a Hermitian right side is
Hermitian. Proved here: `Xᴴ` solves the same equation, and the map is injective. -/
theorem isHermitian_of_lyapunov {A X C : Matrix n n ℂ}
    (hA : Function.Bijective (sylvesterMap A (-Aᴴ))) (hC : C.IsHermitian)
    (hX : A * X + X * Aᴴ = C) : X.IsHermitian := by
  have key : ∀ Y : Matrix n n ℂ, sylvesterMap A (-Aᴴ) Y = A * Y + Y * Aᴴ := fun Y => by
    simp [sylvesterMap, sub_eq_add_neg]
  have hXH : A * Xᴴ + Xᴴ * Aᴴ = C := by
    have := congrArg conjTranspose hX
    rw [conjTranspose_add, conjTranspose_mul, conjTranspose_mul, conjTranspose_conjTranspose,
      hC.eq] at this
    rw [← this, add_comm]
  exact hA.1 (by rw [key, key, hXH, hX])

/-- The Lyapunov integral `∫₀^∞ e^{tA} C e^{tAᴴ} dt`, entrywise. -/
def lyapunovIntegral (A C : Matrix n n ℂ) : Matrix n n ℂ :=
  Matrix.of fun i j => ∫ t in Ioi (0 : ℝ),
    (NormedSpace.exp ((t : ℂ) • A) * C * NormedSpace.exp ((t : ℂ) • Aᴴ)) i j

/-- 6.2 For stable `A` the integrand is integrable and the Lyapunov integral is the unique
solution of `A X + X Aᴴ + C = 0`. -/
theorem lyapunovIntegral_spec {A : Matrix n n ℂ} (hA : ∀ μ ∈ spectrum ℂ A, μ.re < 0)
    (C : Matrix n n ℂ) :
    (∀ i j, IntegrableOn (fun t : ℝ =>
      (NormedSpace.exp ((t : ℂ) • A) * C * NormedSpace.exp ((t : ℂ) • Aᴴ)) i j) (Ioi 0)) ∧
    A * lyapunovIntegral A C + lyapunovIntegral A C * Aᴴ + C = 0 ∧
    ∀ Y, A * Y + Y * Aᴴ + C = 0 → Y = lyapunovIntegral A C := by
  sorry

/-- 6.2 Positivity transfer: for stable `A`, a positive semidefinite (definite) `C` gives a
positive semidefinite (definite) solution. -/
theorem posSemidef_lyapunovIntegral {A : Matrix n n ℂ} (hA : ∀ μ ∈ spectrum ℂ A, μ.re < 0)
    {C : Matrix n n ℂ} :
    (C.PosSemidef → (lyapunovIntegral A C).PosSemidef) ∧
      (C.PosDef → (lyapunovIntegral A C).PosDef) := by
  sorry

variable {q : Type*} [Fintype q]

/-- The reachability Gramian `∫₀^∞ e^{tA} B Bᴴ e^{tAᴴ} dt` of the pair `(A, B)`. -/
def reachabilityGramian (A : Matrix n n ℂ) (B : Matrix n q ℂ) : Matrix n n ℂ :=
  lyapunovIntegral A (B * Bᴴ)

/-- 6.3 For stable `A` the reachability Gramian is positive semidefinite and is the unique
solution of `A P + P Aᴴ + B Bᴴ = 0`. -/
theorem reachabilityGramian_spec {A : Matrix n n ℂ} (hA : ∀ μ ∈ spectrum ℂ A, μ.re < 0)
    (B : Matrix n q ℂ) :
    (reachabilityGramian A B).PosSemidef ∧
      A * reachabilityGramian A B + reachabilityGramian A B * Aᴴ + B * Bᴴ = 0 ∧
      ∀ Y, A * Y + Y * Aᴴ + B * Bᴴ = 0 → Y = reachabilityGramian A B := by
  sorry

section ControlCopies

variable {K : Type*} [Field K] {m : Type*} [Fintype m]

/-- Local copy of LinearSystemsAndControl §1.1, `reachableSubspace`: the span of the columns of
`A ^ k * B` for all `k : ℕ`. -/
def reachableSubspace (A : Matrix n n K) (B : Matrix n m K) : Submodule K (n → K) :=
  ⨆ k : ℕ, LinearMap.range (A ^ k * B).mulVecLin

/-- Local copy of LinearSystemsAndControl §1.1, `IsControllable`: the reachable subspace is the
whole state space. -/
def IsControllable (A : Matrix n n K) (B : Matrix n m K) : Prop :=
  reachableSubspace A B = ⊤

end ControlCopies

/-- 6.3 For stable `A` the reachability Gramian is positive definite if and only if `(A, B)` is
controllable. -/
theorem posDef_reachabilityGramian_iff {A : Matrix n n ℂ} (hA : ∀ μ ∈ spectrum ℂ A, μ.re < 0)
    (B : Matrix n q ℂ) : (reachabilityGramian A B).PosDef ↔ IsControllable A B := by
  sorry

/-! ## Layer 7: nonlinear eigenvalue problems -/

/-! ### 7.1 Jordan chains -/

/-- The `j`th Taylor coefficient `F⁽ʲ⁾(λ) / j!` of a matrix-valued function, entrywise. -/
def taylorCoeff (F : ℂ → Matrix n n ℂ) (lam : ℂ) (j : ℕ) : Matrix n n ℂ :=
  Matrix.of fun a b => iteratedDeriv j (fun z => F z a b) lam / (j.factorial : ℂ)

/-- `(v 0, …, v (k - 1))` is a (right) Jordan chain of length `k` for `F` at `lam`: `v 0 ≠ 0`
and `F(z) (∑_{i<k} (z - lam)ⁱ v i)` vanishes to order `k` at `lam`. -/
def IsJordanChain (F : ℂ → Matrix n n ℂ) (lam : ℂ) (k : ℕ) (v : ℕ → n → ℂ) : Prop :=
  0 < k ∧ v 0 ≠ 0 ∧
    ∀ i < k, ∑ j ∈ Finset.range (i + 1), taylorCoeff F lam j *ᵥ v (i - j) = 0

/-- `(w 0, …, w (k - 1))` is a left Jordan chain of length `k` for `F` at `lam`: a Jordan chain
of `F*` for the conjugated vectors, written with `wᴴ` on the left. -/
def IsLeftJordanChain (F : ℂ → Matrix n n ℂ) (lam : ℂ) (k : ℕ) (w : ℕ → n → ℂ) : Prop :=
  0 < k ∧ w 0 ≠ 0 ∧
    ∀ i < k, ∑ j ∈ Finset.range (i + 1), star (w (i - j)) ᵥ* taylorCoeff F lam j = 0

/-- A complete system of Jordan chains for `F` at `lam`: `d` chains `v j` of lengths `m j` whose
heads form a basis of the kernel of `F lam`, each of maximal length among the chains whose head
lies outside the span of the earlier heads. The lengths are the partial multiplicities. -/
structure IsCompleteJordanSystem (F : ℂ → Matrix n n ℂ) (lam : ℂ) (d : ℕ) (m : Fin d → ℕ)
    (v : Fin d → ℕ → n → ℂ) : Prop where
  chain : ∀ j, IsJordanChain F lam (m j) (v j)
  linearIndependent : LinearIndependent ℂ fun j => v j 0
  span_eq : Submodule.span ℂ (range fun j => v j 0) = LinearMap.ker (F lam).mulVecLin
  maximal : ∀ j k (u : ℕ → n → ℂ), IsJordanChain F lam k u →
    u 0 ∉ Submodule.span ℂ (range fun i : {i : Fin d // i < j} => v i 0) → k ≤ m j

/-- 7.1 At an eigenvalue of a function holomorphic near it whose determinant does not vanish to
infinite order, a complete system of Jordan chains exists, with `d` the geometric
multiplicity. -/
theorem exists_isCompleteJordanSystem {F : ℂ → Matrix n n ℂ} {lam : ℂ}
    (hF : ∀ a b, AnalyticAt ℂ (fun z => F z a b) lam)
    (hreg : analyticOrderAt (fun z => (F z).det) lam ≠ ⊤) :
    ∃ (m : Fin (Module.finrank ℂ (LinearMap.ker (F lam).mulVecLin)) → ℕ) (v : _ → ℕ → n → ℂ),
      IsCompleteJordanSystem F lam _ m v := by
  sorry

/-! ### 7.2 Keldysh's theorem -/

/-- 7.2 Keldysh's theorem at simple eigenvalues: on an open set where `F` is holomorphic with
finitely many eigenvalues, all simple, `F(z)⁻¹ = ∑ᵢ vᵢ wᵢᴴ / (z - λᵢ) + R(z)` with `R`
holomorphic, right and left eigenvectors normalized by `wᵢᴴ F'(λᵢ) vᵢ = 1`. -/
theorem keldysh_simple {F : ℂ → Matrix n n ℂ} {Ω : Set ℂ} (hΩ : IsOpen Ω)
    (hF : ∀ a b, AnalyticOnNhd ℂ (fun z => F z a b) Ω) (Λ : Finset ℂ) (hΛΩ : ↑Λ ⊆ Ω)
    (hΛ : ∀ z ∈ Ω, (F z).det = 0 ↔ z ∈ Λ)
    (hsimple : ∀ lam ∈ Λ, analyticOrderAt (fun z => (F z).det) lam = 1) :
    ∃ v w : ℂ → n → ℂ,
      (∀ lam ∈ Λ, F lam *ᵥ v lam = 0 ∧ star (w lam) ᵥ* F lam = 0 ∧
        star (w lam) ⬝ᵥ (taylorCoeff F lam 1 *ᵥ v lam) = 1) ∧
      ∃ R : ℂ → Matrix n n ℂ, (∀ a b, AnalyticOnNhd ℂ (fun z => R z a b) Ω) ∧
        ∀ z ∈ Ω, z ∉ Λ →
          (F z)⁻¹ = ∑ lam ∈ Λ, (z - lam)⁻¹ • vecMulVec (v lam) (star (w lam)) + R z := by
  sorry

/-- 7.2 Keldysh's theorem at one eigenvalue: for a complete system of Jordan chains `v` there
are left Jordan chains `w` such that `F(z)⁻¹` minus the principal part
`∑ⱼ ∑_{k=1}^{mⱼ} (z - λ)⁻ᵏ ∑_{l=0}^{mⱼ-k} v j l (w j (mⱼ - k - l))ᴴ` is holomorphic at `λ`. -/
theorem keldysh_local {F : ℂ → Matrix n n ℂ} {lam : ℂ}
    (hF : ∀ a b, AnalyticAt ℂ (fun z => F z a b) lam)
    (hreg : analyticOrderAt (fun z => (F z).det) lam ≠ ⊤) {d : ℕ} {m : Fin d → ℕ}
    {v : Fin d → ℕ → n → ℂ} (hv : IsCompleteJordanSystem F lam d m v) :
    ∃ w : Fin d → ℕ → n → ℂ, (∀ j, IsLeftJordanChain F lam (m j) (w j)) ∧
      ∃ R : ℂ → Matrix n n ℂ, (∀ a b, AnalyticAt ℂ (fun z => R z a b) lam) ∧
        ∀ᶠ z in 𝓝[≠] lam, (F z)⁻¹ =
          ∑ j, ∑ k ∈ Finset.Icc 1 (m j), ((z - lam) ^ k)⁻¹ •
            ∑ l ∈ Finset.range (m j - k + 1), vecMulVec (v j l) (star (w j (m j - k - l))) +
          R z := by
  sorry

/-! ### 7.3 Block companion linearization -/

/-- The matrix polynomial `P(z) = ∑_{j ≤ d + 1} zʲ Dⱼ` of degree at most `ℓ = d + 1`. -/
def matrixPolyEval {R : Type*} [CommRing R] (d : ℕ) (D : ℕ → Matrix n n R) (z : R) :
    Matrix n n R :=
  ∑ j ∈ Finset.range (d + 2), z ^ j • D j

/-- The block companion pencil of `P` with `ℓ = d + 1` block rows: first block row
`(D₀, …, D_{ℓ-2}, D_{ℓ-1} + z D_ℓ)`, and block row `i ≥ 1` with `-z I` in block column `i - 1`
and `I` in block column `i`. -/
def blockCompanionPencil {R : Type*} [CommRing R] (d : ℕ) (D : ℕ → Matrix n n R) (z : R) :
    Matrix (Fin (d + 1) × n) (Fin (d + 1) × n) R :=
  Matrix.of fun p p' =>
    if (p.1 : ℕ) = 0 then D p'.1 p.2 p'.2 + (if (p'.1 : ℕ) = d then z * D (d + 1) p.2 p'.2 else 0)
    else if p.2 ≠ p'.2 then 0
    else if p.1 = p'.1 then 1
    else if (p.1 : ℕ) = p'.1 + 1 then -z else 0

/-- 7.3 The pencil maps `b(z) ⊗ v` to `e₁ ⊗ P(z) v`, with `b(z) = (1, z, …, z^{ℓ-1})`. -/
theorem blockCompanionPencil_mulVec {R : Type*} [CommRing R] (d : ℕ) (D : ℕ → Matrix n n R)
    (z : R) (v : n → R) :
    blockCompanionPencil d D z *ᵥ (fun p => z ^ (p.1 : ℕ) * v p.2) =
      fun p => if (p.1 : ℕ) = 0 then (matrixPolyEval d D z *ᵥ v) p.2 else 0 := by
  sorry

/-- 7.3 `det L(z) = det P(z)` over every commutative ring; over `K[X]` with `z = X` this is the
identity of the two determinant polynomials. -/
theorem det_blockCompanionPencil {R : Type*} [CommRing R] (d : ℕ) (D : ℕ → Matrix n n R)
    (z : R) : (blockCompanionPencil d D z).det = (matrixPolyEval d D z).det := by
  sorry

/-- 7.3 The kernel of `L(λ)` consists of the vectors `b(λ) ⊗ v` with `P(λ) v = 0`. -/
theorem blockCompanionPencil_mulVec_eq_zero_iff {K : Type*} [Field K] (d : ℕ)
    (D : ℕ → Matrix n n K) (lam : K) (x : Fin (d + 1) × n → K) :
    blockCompanionPencil d D lam *ᵥ x = 0 ↔
      ∃ v, matrixPolyEval d D lam *ᵥ v = 0 ∧ x = fun p => lam ^ (p.1 : ℕ) * v p.2 := by
  sorry

/-- 7.3 Equal geometric multiplicities. -/
theorem finrank_ker_blockCompanionPencil {K : Type*} [Field K] (d : ℕ) (D : ℕ → Matrix n n K)
    (lam : K) :
    Module.finrank K (LinearMap.ker (blockCompanionPencil d D lam).mulVecLin) =
      Module.finrank K (LinearMap.ker (matrixPolyEval d D lam).mulVecLin) := by
  sorry

/-- 7.3 A left null vector of `L(λ)` has a nonzero first block, which is a left null vector of
`P(λ)`. -/
theorem vecMul_blockCompanionPencil_eq_zero {K : Type*} [Field K] (d : ℕ) (D : ℕ → Matrix n n K)
    (lam : K) {y : Fin (d + 1) × n → K} (hy : y ≠ 0)
    (h : y ᵥ* blockCompanionPencil d D lam = 0) :
    (fun a => y (0, a)) ≠ 0 ∧ (fun a => y (0, a)) ᵥ* matrixPolyEval d D lam = 0 := by
  sorry

end TauCetiRoadmap.MatrixFunctionsAndMatrixEquations

#check @TauCeti.conditionNumber
#check @Module.End.maxGenEigenspace
#check @Module.End.iSup_maxGenEigenspace_eq_top
#check @minpoly
#check @Polynomial.rootMultiplicity
#check @circleIntegral
#check @FormalMultilinearSeries.ofScalars
#check @FormalMultilinearSeries.radius
#check @NormedSpace.exp
#check @spectralRadius
#check @analyticOrderAt
#check @mulLeftLinearMap
#check @mulRightLinearMap
#check @Matrix.blockDiagonal'
#check @Matrix.fromBlocks
#check @Matrix.PosDef
#check @Ring.inverse
#check @Module.End.exists_jordanChainBasis
#check @TauCeti.companionPencil
#check @TauCeti.det_companionPencil
#check @ContinuousLinearMap.sylvester
#check @spectrum.map_polynomial_aeval
#check @intervalIntegral.norm_integral_le_integral_norm
#check @HasFDerivAt
#check @HasFDerivWithinAt
#check @ContDiffOn
#check @ContinuousLinearMap.opNorm
#check @Filter.limsup
#check @ENNReal.ofReal
#check @NormOneClass
#check @norm_tsum_le_tsum_norm
#check @Complex.exp
#check @Polynomial.natDegree
#check @spectrum.pow_nnnorm_pow_one_div_tendsto_nhds_spectralRadius
#check @Matrix.kroneckerMap
#check @spectrum
#check @hasDerivAt_exp_smul_const
#check @MeasureTheory.integral_Ioi_of_hasDerivAt_of_tendsto
#check @MeasureTheory.IntegrableOn
#check @Matrix.conjTranspose
#check @Matrix.IsHermitian
#check @Matrix.PosSemidef
#check @Matrix.exp_conjTranspose
#check @iteratedDeriv
#check @AnalyticAt
#check @AnalyticOnNhd
#check @LinearIndependent
#check @Matrix.vecMulVec
#check @Matrix.mulVec
#check @Matrix.vecMul
#check @Matrix.det
#check @LinearMap.ker
#check @Module.finrank
#check @Summable
#check @DiffContOnCl
#check @cfc
