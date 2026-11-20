import Mathlib
import TauCeti.Analysis.InnerProductSpace.Polar.Finite
import TauCeti.Analysis.InnerProductSpace.UnitarilyInvariantSeminorm.Frobenius

/-!
# The polar retraction on the Stiefel manifold: target signatures

**This file is not the roadmap.** The definitive document is `README.md`. This file states the
roadmap's headline theorems against the pinned Mathlib and Tau Ceti APIs, with `sorry` proofs; the
proofs are the targets. Every headline theorem of the README is statable at the pins and is stated
here: the retraction constants (1.2, 1.3), R.-C. Li's perturbation bounds for the polar factor
(2.1–2.3), the pullback bound and the rate of polar gradient descent (3.1, 3.2), the pullback
bound for Newton–Schulz steps (4.2), and the one-step Newton–Schulz iteration (5.1–5.4). The
API facts of 1.1 and 4.1, Li's one-sided form 2.4 and the Stiefel instance 2.5 are README targets
not stated here.

Matrices are real, `Matrix (Fin n) (Fin p) ℝ`, with Mathlib's Frobenius norm
(`open scoped Matrix.Norms.Frobenius`); the operator norm of a matrix `A` is written
`‖LinearMap.toContinuousLinearMap (Matrix.toEuclideanLin A)‖`, the right side of Mathlib's
`Matrix.l2_opNorm_def`. The pairing `⟪A, B⟫ = tr(Aᵀ B)` is written `Matrix.trace (Aᵀ * B)`.
-/

noncomputable section

open Finset TauCeti
open scoped Matrix Matrix.Norms.Frobenius

namespace TauCetiRoadmap.StiefelPolarRetraction

variable {𝕜 E F : Type*} [RCLike 𝕜]
  [NormedAddCommGroup E] [InnerProductSpace 𝕜 E] [FiniteDimensional 𝕜 E]
  [NormedAddCommGroup F] [InnerProductSpace 𝕜 F] [FiniteDimensional 𝕜 F]

/-! ## Layer 1: the polar retraction at matrix level -/

/-- 1.1. The matrix polar factor: the matrix of Tau Ceti's canonical polar factor
`LinearMap.polarFactor` of `Matrix.toEuclideanLin A`. The definition is copied verbatim from
SpectralSteepestDescent 6.1. For a real matrix of full column rank it is `A (Aᵀ A)^(-1/2)`. -/
def matrixPolarFactor {m n : Type*} [Fintype m] [Fintype n] [DecidableEq n]
    (A : Matrix m n 𝕜) : Matrix m n 𝕜 :=
  Matrix.toEuclideanLin.symm (Matrix.toEuclideanLin A).polarFactor

/-- 1.2. For `Xᵀ X = 1` and tangent `Z`, the polar retraction moves `X` by at most `‖Z‖_F`, with
`‖R − X‖_F² = 2 Σᵢ (1 − (1 + sᵢ²)^(-1/2))` over the singular values `sᵢ` of `Z`. -/
theorem norm_polar_sub_le {n p : ℕ} {X Z : Matrix (Fin n) (Fin p) ℝ} (hX : Xᵀ * X = 1)
    (hZ : Xᵀ * Z + Zᵀ * X = 0) :
    ‖matrixPolarFactor (X + Z) - X‖ ^ 2 =
        2 * ∑ i ∈ range p,
          (1 - (Real.sqrt (1 + (Matrix.toEuclideanLin Z).singularValues i ^ 2))⁻¹) ∧
      ‖matrixPolarFactor (X + Z) - X‖ ≤ ‖Z‖ := sorry

/-- 1.3. For `Xᵀ X = 1` and tangent `Z`, the polar retraction agrees with `X + Z` to second order:
`‖R − X − Z‖_F² = Σᵢ (√(1 + sᵢ²) − 1)²`, `‖R − X − Z‖_F ≤ ½ ‖Z‖_F²` and
`‖R − X − Z‖_op ≤ ½ ‖Z‖_op²`. -/
theorem norm_polar_sub_sub_le {n p : ℕ} {X Z : Matrix (Fin n) (Fin p) ℝ} (hX : Xᵀ * X = 1)
    (hZ : Xᵀ * Z + Zᵀ * X = 0) :
    ‖matrixPolarFactor (X + Z) - X - Z‖ ^ 2 =
        ∑ i ∈ range p, (Real.sqrt (1 + (Matrix.toEuclideanLin Z).singularValues i ^ 2) - 1) ^ 2 ∧
      ‖matrixPolarFactor (X + Z) - X - Z‖ ≤ ‖Z‖ ^ 2 / 2 ∧
      ‖LinearMap.toContinuousLinearMap (Matrix.toEuclideanLin (matrixPolarFactor (X + Z) - X - Z))‖
        ≤ ‖LinearMap.toContinuousLinearMap (Matrix.toEuclideanLin Z)‖ ^ 2 / 2 := sorry

/-! ## Layer 2: perturbation of the polar factor -/

/-- 2.1. Li's Theorem 1, stated over `𝕜` for unitarily invariant seminorms (Li: complex matrices,
unitarily invariant norms; his proof is carried over in the README): for injective maps between
spaces of equal dimension `n`, in every unitarily invariant seminorm,
`N(U_A − U_B) ≤ 2 / (σₙ(A) + σₙ(B)) · N(A − B)`, where `σₙ` is the smallest singular value. -/
theorem map_polarFactor_sub_le_of_finrank_eq (N : UnitarilyInvariantSeminorm 𝕜 E F)
    {A B : E →ₗ[𝕜] F} (hEF : Module.finrank 𝕜 E = Module.finrank 𝕜 F)
    (hA : Function.Injective A) (hB : Function.Injective B) :
    N (A.polarFactor - B.polarFactor) ≤
      2 / (A.singularValues (Module.finrank 𝕜 E - 1) +
        B.singularValues (Module.finrank 𝕜 E - 1)) * N (A - B) := sorry

/-- 2.2. Li's Theorem 2, stated over `𝕜` for unitarily invariant seminorms: for injective maps
into a space of larger dimension, in every unitarily invariant seminorm,
`N(U_A − U_B) ≤ (2 / (σₙ(A) + σₙ(B)) + 1 / max(σₙ(A), σₙ(B))) · N(A − B)`. -/
theorem map_polarFactor_sub_le_of_finrank_lt (N : UnitarilyInvariantSeminorm 𝕜 E F)
    {A B : E →ₗ[𝕜] F} (hEF : Module.finrank 𝕜 E < Module.finrank 𝕜 F)
    (hA : Function.Injective A) (hB : Function.Injective B) :
    N (A.polarFactor - B.polarFactor) ≤
      (2 / (A.singularValues (Module.finrank 𝕜 E - 1) +
          B.singularValues (Module.finrank 𝕜 E - 1)) +
        1 / max (A.singularValues (Module.finrank 𝕜 E - 1))
          (B.singularValues (Module.finrank 𝕜 E - 1))) * N (A - B) := sorry

/-- 2.3. Li's Theorem 3, stated over `𝕜`: under the hypotheses of 2.2, in the Frobenius norm,
`‖U_A − U_B‖_F ≤ √((2 / (σₙ(A) + σₙ(B)))² + (1 / max(σₙ(A), σₙ(B)))²) · ‖A − B‖_F`. -/
theorem frobenius_polarFactor_sub_le (A B : E →ₗ[𝕜] F)
    (hEF : Module.finrank 𝕜 E < Module.finrank 𝕜 F)
    (hA : Function.Injective A) (hB : Function.Injective B) :
    UnitarilyInvariantSeminorm.frobenius 𝕜 E F (A.polarFactor - B.polarFactor) ≤
      Real.sqrt ((2 / (A.singularValues (Module.finrank 𝕜 E - 1) +
            B.singularValues (Module.finrank 𝕜 E - 1))) ^ 2 +
          (1 / max (A.singularValues (Module.finrank 𝕜 E - 1))
            (B.singularValues (Module.finrank 𝕜 E - 1))) ^ 2) *
        UnitarilyInvariantSeminorm.frobenius 𝕜 E F (A - B) := sorry

/-! ## Layer 3: the pullback constant and the rate -/

/-- 3.1. The unit ball of the operator norm, `B = {A | ‖A‖_op ≤ 1}`. -/
def opUnitBall (n p : ℕ) : Set (Matrix (Fin n) (Fin p) ℝ) :=
  {A | ‖LinearMap.toContinuousLinearMap (Matrix.toEuclideanLin A)‖ ≤ 1}

/-- 3.1. The standing hypotheses on the cost: `f` is differentiable at every point of `B` with
Frobenius gradient `gradf` (that is, `Df(A) Z = tr((gradf A)ᵀ Z)`), the gradient is `L`-Lipschitz
on `B` and bounded by `G` there, both in the Frobenius norm. -/
structure SmoothOnOpBall {n p : ℕ} (f : Matrix (Fin n) (Fin p) ℝ → ℝ)
    (gradf : Matrix (Fin n) (Fin p) ℝ → Matrix (Fin n) (Fin p) ℝ) (L G : ℝ) : Prop where
  differentiableAt : ∀ A ∈ opUnitBall n p, DifferentiableAt ℝ f A
  fderiv_apply : ∀ A ∈ opUnitBall n p, ∀ Z, fderiv ℝ f A Z = Matrix.trace ((gradf A)ᵀ * Z)
  lipschitz : ∀ A ∈ opUnitBall n p, ∀ A' ∈ opUnitBall n p, ‖gradf A - gradf A'‖ ≤ L * ‖A - A'‖
  norm_le : ∀ A ∈ opUnitBall n p, ‖gradf A‖ ≤ G

/-- 3.1. Explicit pullback constant of the polar retraction: for `Xᵀ X = 1` and tangent `Z`,
`f(R) ≤ f(X) + ⟪∇f(X), Z⟫ + ((L + G)/2) ‖Z‖_F²`. -/
theorem polar_pullback_le {n p : ℕ} {f : Matrix (Fin n) (Fin p) ℝ → ℝ}
    {gradf : Matrix (Fin n) (Fin p) ℝ → Matrix (Fin n) (Fin p) ℝ} {L G : ℝ}
    (hf : SmoothOnOpBall f gradf L G) {X Z : Matrix (Fin n) (Fin p) ℝ} (hX : Xᵀ * X = 1)
    (hZ : Xᵀ * Z + Zᵀ * X = 0) :
    f (matrixPolarFactor (X + Z)) ≤
      f X + Matrix.trace ((gradf X)ᵀ * Z) + (L + G) / 2 * ‖Z‖ ^ 2 := sorry

/-- 3.2. Gradient descent with the polar retraction:
`X_{k+1} = U(X_k − η (∇f(X_k) − X_k sym(X_kᵀ ∇f(X_k))))`, from `X₀`. -/
def polarStepSeq {n p : ℕ} (gradf : Matrix (Fin n) (Fin p) ℝ → Matrix (Fin n) (Fin p) ℝ)
    (η : ℝ) (X₀ : Matrix (Fin n) (Fin p) ℝ) (k : ℕ) : Matrix (Fin n) (Fin p) ℝ :=
  Nat.rec X₀ (fun _ X ↦ matrixPolarFactor
    (X - η • (gradf X - X * ((1 / 2 : ℝ) • (Xᵀ * gradf X + (gradf X)ᵀ * X))))) k

/-- 3.2. The rate with the constant of 3.1: for `0 < η` and `η (L + G) ≤ 1`, every iterate has
orthonormal columns, each step decreases `f` by at least `(η/2) ‖grad_k‖_F²`, and
`Σ_{k<K} ‖grad_k‖_F² ≤ 2 (f(X₀) − f_low)/η`, where
`grad_k = ∇f(X_k) − X_k sym(X_kᵀ ∇f(X_k))`. -/
theorem sum_sq_norm_rgrad_le {n p : ℕ} {f : Matrix (Fin n) (Fin p) ℝ → ℝ}
    {gradf : Matrix (Fin n) (Fin p) ℝ → Matrix (Fin n) (Fin p) ℝ} {L G flow η : ℝ}
    (hf : SmoothOnOpBall f gradf L G) (hlow : ∀ A ∈ opUnitBall n p, flow ≤ f A)
    (hη : 0 < η) (hηL : η * (L + G) ≤ 1) {X₀ : Matrix (Fin n) (Fin p) ℝ} (hX₀ : X₀ᵀ * X₀ = 1)
    (K : ℕ) :
    (∀ k, (polarStepSeq gradf η X₀ k)ᵀ * polarStepSeq gradf η X₀ k = 1 ∧
      f (polarStepSeq gradf η X₀ (k + 1)) ≤ f (polarStepSeq gradf η X₀ k) -
        η / 2 * ‖gradf (polarStepSeq gradf η X₀ k) - polarStepSeq gradf η X₀ k *
          ((1 / 2 : ℝ) • ((polarStepSeq gradf η X₀ k)ᵀ * gradf (polarStepSeq gradf η X₀ k) +
            (gradf (polarStepSeq gradf η X₀ k))ᵀ * polarStepSeq gradf η X₀ k))‖ ^ 2) ∧
    ∑ k ∈ range K, ‖gradf (polarStepSeq gradf η X₀ k) - polarStepSeq gradf η X₀ k *
          ((1 / 2 : ℝ) • ((polarStepSeq gradf η X₀ k)ᵀ * gradf (polarStepSeq gradf η X₀ k) +
            (gradf (polarStepSeq gradf η X₀ k))ᵀ * polarStepSeq gradf η X₀ k))‖ ^ 2 ≤
      2 * (f X₀ - flow) / η := sorry

/-! ## Layer 4: Newton–Schulz from a point of the manifold -/

/-- 4.1. The odd polynomial step `X ↦ ∑ⱼ cⱼ X (X† X)ʲ` (copied verbatim from
SpectralSteepestDescent 3.1). -/
def oddStep {n : ℕ} (c : Fin n → ℝ) (X : E →ₗ[𝕜] F) : E →ₗ[𝕜] F :=
  ∑ j, ((c j : ℝ) : 𝕜) • (X ∘ₗ (LinearMap.adjoint X ∘ₗ X) ^ (j : ℕ))

/-- 4.1. The cubic Newton–Schulz coefficients, `g(t) = (3t − t³)/2` (copied verbatim from
SpectralSteepestDescent 4.1). -/
def cubicCoeffs : Fin 2 → ℝ := ![3 / 2, -1 / 2]

/-- 4.1. The cubic Newton–Schulz step on matrices, `Ψ A = ½ A (3 − Aᵀ A)`: SpectralSteepestDescent's
`oddStep cubicCoeffs` transported along `Matrix.toEuclideanLin`. -/
def nsStep {n p : ℕ} (A : Matrix (Fin n) (Fin p) ℝ) : Matrix (Fin n) (Fin p) ℝ :=
  Matrix.toEuclideanLin.symm (oddStep cubicCoeffs (Matrix.toEuclideanLin A))

/-- 4.2. Pullback bound for `m ≥ 1` Newton–Schulz steps in place of the polar factor: for
`Xᵀ X = 1`, tangent `Z` and `‖Z‖_op ≤ ζ < √2`,
`f(Ψ^[m](X + Z)) ≤ f(X) + ⟪∇f(X), Z⟫ + ((L + G)/2 + ((2 + √3)/8) G ζ²) ‖Z‖_F²`. -/
theorem ns_pullback_le {n p : ℕ} {f : Matrix (Fin n) (Fin p) ℝ → ℝ}
    {gradf : Matrix (Fin n) (Fin p) ℝ → Matrix (Fin n) (Fin p) ℝ} {L G ζ : ℝ}
    (hf : SmoothOnOpBall f gradf L G) {X Z : Matrix (Fin n) (Fin p) ℝ} (hX : Xᵀ * X = 1)
    (hZ : Xᵀ * Z + Zᵀ * X = 0)
    (hZζ : ‖LinearMap.toContinuousLinearMap (Matrix.toEuclideanLin Z)‖ ≤ ζ)
    (hζ : ζ < Real.sqrt 2) {m : ℕ} (hm : 1 ≤ m) :
    f (nsStep^[m] (X + Z)) ≤ f X + Matrix.trace ((gradf X)ᵀ * Z) +
      ((L + G) / 2 + (2 + Real.sqrt 3) / 8 * G * ζ ^ 2) * ‖Z‖ ^ 2 := sorry

/-! ## Layer 5: one Newton–Schulz step per iteration -/

/-- 5.1. One step from an arbitrary `Y`: for skew `W`, `Z = W Y`, `‖Y‖_op ≤ 1` and
`‖Z‖_F² ≤ 1/4`, the step `Ψ(Y + Z)` has operator norm at most `1` and
`‖1 − Ψ(Y + Z)ᵀ Ψ(Y + Z)‖_F ≤ (D + ‖Z‖_F²)²` with `D = ‖1 − Yᵀ Y‖_F`. -/
theorem ns_defect_le {n p : ℕ} {Y : Matrix (Fin n) (Fin p) ℝ} {W : Matrix (Fin n) (Fin n) ℝ}
    (hW : Wᵀ = -W) (hY : ‖LinearMap.toContinuousLinearMap (Matrix.toEuclideanLin Y)‖ ≤ 1)
    (hZ : ‖W * Y‖ ^ 2 ≤ 1 / 4) :
    ‖LinearMap.toContinuousLinearMap (Matrix.toEuclideanLin (nsStep (Y + W * Y)))‖ ≤ 1 ∧
      ‖(1 : Matrix (Fin p) (Fin p) ℝ) - (nsStep (Y + W * Y))ᵀ * nsStep (Y + W * Y)‖ ≤
        (‖(1 : Matrix (Fin p) (Fin p) ℝ) - Yᵀ * Y‖ + ‖W * Y‖ ^ 2) ^ 2 := sorry

/-- 5.2. The one-step Newton–Schulz iteration `Y_{k+1} = Ψ(Y_k − η S_k Y_k)` with
`S_k = skew(∇f(Y_k) Y_kᵀ)`, from `Y₀`. -/
def nsDescentSeq {n p : ℕ} (gradf : Matrix (Fin n) (Fin p) ℝ → Matrix (Fin n) (Fin p) ℝ)
    (η : ℝ) (Y₀ : Matrix (Fin n) (Fin p) ℝ) (k : ℕ) : Matrix (Fin n) (Fin p) ℝ :=
  Nat.rec Y₀ (fun _ Y ↦ nsStep
    (Y - (η • ((1 / 2 : ℝ) • (gradf Y * Yᵀ - (gradf Y * Yᵀ)ᵀ))) * Y)) k

/-- 5.2. For `0 < η` and `3 η (L + G) ≤ 1`, from `Y₀ᵀ Y₀ = 1`, every iterate lies in `B` and has
`‖1 − Y_kᵀ Y_k‖_F ≤ 4 (η G)⁴`. -/
theorem ns_iterates_feasible {n p : ℕ} {f : Matrix (Fin n) (Fin p) ℝ → ℝ}
    {gradf : Matrix (Fin n) (Fin p) ℝ → Matrix (Fin n) (Fin p) ℝ} {L G η : ℝ}
    (hf : SmoothOnOpBall f gradf L G) (hη : 0 < η) (hηL : η * (3 * (L + G)) ≤ 1)
    {Y₀ : Matrix (Fin n) (Fin p) ℝ} (hY₀ : Y₀ᵀ * Y₀ = 1) (k : ℕ) :
    nsDescentSeq gradf η Y₀ k ∈ opUnitBall n p ∧
      ‖(1 : Matrix (Fin p) (Fin p) ℝ) - (nsDescentSeq gradf η Y₀ k)ᵀ * nsDescentSeq gradf η Y₀ k‖
        ≤ 4 * (η * G) ^ 4 := sorry

/-- 5.3. The rate of the one-step Newton–Schulz iteration: for `0 < η` and `3 η (L + G) ≤ 1`,
`Σ_{k<K} ‖skew(∇f(Y_k) Y_kᵀ)‖_F² ≤ 2 (f(Y₀) − f_low)/η`. -/
theorem sum_sq_norm_skew_le {n p : ℕ} {f : Matrix (Fin n) (Fin p) ℝ → ℝ}
    {gradf : Matrix (Fin n) (Fin p) ℝ → Matrix (Fin n) (Fin p) ℝ} {L G flow η : ℝ}
    (hf : SmoothOnOpBall f gradf L G) (hlow : ∀ A ∈ opUnitBall n p, flow ≤ f A)
    (hη : 0 < η) (hηL : η * (3 * (L + G)) ≤ 1) {Y₀ : Matrix (Fin n) (Fin p) ℝ}
    (hY₀ : Y₀ᵀ * Y₀ = 1) (K : ℕ) :
    ∑ k ∈ range K,
      ‖(1 / 2 : ℝ) • (gradf (nsDescentSeq gradf η Y₀ k) * (nsDescentSeq gradf η Y₀ k)ᵀ -
        (gradf (nsDescentSeq gradf η Y₀ k) * (nsDescentSeq gradf η Y₀ k)ᵀ)ᵀ)‖ ^ 2 ≤
      2 * (f Y₀ - flow) / η := sorry

/-- 5.4. The stationarity measure of 5.3 against the Riemannian gradient: for `Xᵀ X = 1` and any
`G₀`, `½ ‖grad‖_F² ≤ ‖skew(G₀ Xᵀ)‖_F² ≤ ‖grad‖_F²` with `grad = G₀ − X sym(Xᵀ G₀)`. -/
theorem sq_norm_skew_mul_transpose_le {n p : ℕ} {X G₀ : Matrix (Fin n) (Fin p) ℝ}
    (hX : Xᵀ * X = 1) :
    ‖G₀ - X * ((1 / 2 : ℝ) • (Xᵀ * G₀ + G₀ᵀ * X))‖ ^ 2 / 2 ≤
        ‖(1 / 2 : ℝ) • (G₀ * Xᵀ - (G₀ * Xᵀ)ᵀ)‖ ^ 2 ∧
      ‖(1 / 2 : ℝ) • (G₀ * Xᵀ - (G₀ * Xᵀ)ᵀ)‖ ^ 2 ≤
        ‖G₀ - X * ((1 / 2 : ℝ) • (Xᵀ * G₀ + G₀ᵀ * X))‖ ^ 2 := sorry

end TauCetiRoadmap.StiefelPolarRetraction
