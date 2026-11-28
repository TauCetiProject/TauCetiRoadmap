import Mathlib
import TauCeti.Analysis.Normed.Module.Complexification

/-!
# Krein–Rutman theory for compact operators leaving a cone invariant

Suggested statements for the roadmap `KreinRutmanAndPositiveOperators`. The space `E` is a real
Banach space, the cone `K` is a Mathlib `ProperCone ℝ E` (a closed convex cone containing `0`),
and salience `K ∩ (-K) = {0}` is the hypothesis `(K : ConvexCone ℝ E).Salient`. The spectrum and
the spectral radius of a real operator are those of its complexification
`ContinuousLinearMap.complexify` (Tau Ceti), as for real matrices in Tau Ceti's Perron–Frobenius
files.
-/

open Set Filter Topology
open scoped ENNReal

noncomputable section

namespace KreinRutman

variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]

/-- Conventions. A cone is total when its linear span is dense. -/
def IsTotalCone (K : ProperCone ℝ E) : Prop :=
  Dense (Submodule.span ℝ (K : Set E) : Set E)

/-- Conventions. An operator is strongly positive for a cone when it maps every nonzero point of
the cone into the interior of the cone. -/
def IsStronglyPositive (K : ProperCone ℝ E) (T : E →L[ℝ] E) : Prop :=
  ∀ x ∈ K, x ≠ 0 → T x ∈ interior (K : Set E)

/-- Conventions. The spectral radius of a real operator: the spectral radius of its
complexification. -/
def realSpectralRadius (T : E →L[ℝ] E) : ℝ≥0∞ :=
  spectralRadius ℂ T.complexify

/-! ## Layer 1: positivity and the spectral radius -/

/-- 1.1 For a real `μ` beyond the spectral radius, the Neumann series `∑ μ⁻ⁿ⁻¹ Tⁿ` converges to
an inverse of `μ - T`, and this inverse maps the cone into itself. -/
theorem exists_hasSum_inverse_mapsTo [CompleteSpace E] (K : ProperCone ℝ E) (T : E →L[ℝ] E)
    (hTK : MapsTo T K K) {μ : ℝ} (hμ : realSpectralRadius T < ENNReal.ofReal μ) :
    ∃ R : E →L[ℝ] E, HasSum (fun n : ℕ => (μ ^ (n + 1))⁻¹ • T ^ n) R ∧
      (μ • 1 - T) * R = 1 ∧ R * (μ • 1 - T) = 1 ∧ MapsTo R K K := by
  sorry

/-- 1.2 Lower bound for the spectral radius: if `T` leaves a closed salient cone invariant and
`T u - c u` lies in the cone for a nonzero `u` of the cone, then `c` is at most the spectral
radius of `T`. -/
theorem ofReal_le_realSpectralRadius [CompleteSpace E] (K : ProperCone ℝ E)
    (hKs : (K : ConvexCone ℝ E).Salient) (T : E →L[ℝ] E) (hTK : MapsTo T K K) {u : E}
    (hu : u ∈ K) (hu0 : u ≠ 0) {c : ℝ} (h : T u - c • u ∈ K) :
    ENNReal.ofReal c ≤ realSpectralRadius T := by
  sorry

/-- 1.3 For a real square matrix, the spectral radius of the operator `v ↦ A v` on `n → ℝ` is the
spectral radius of the matrix viewed as a complex matrix. -/
theorem realSpectralRadius_toContinuousLinearMap {n : Type*} [Fintype n] [DecidableEq n]
    (A : Matrix n n ℝ) :
    realSpectralRadius (LinearMap.toContinuousLinearMap (Matrix.toLin' A)) =
      spectralRadius ℂ (A.map (↑) : Matrix n n ℂ) := by
  sorry

/-! ## Layer 2: the Krein–Rutman theorem for total cones -/

/-- 2.1 **Krein–Rutman theorem.** A compact operator leaving a closed, salient, total cone
invariant, with positive spectral radius `r`, has an eigenvector for `r` in the cone, and its
dual operator has a nonzero eigenfunctional for `r` that is nonnegative on the cone. -/
theorem exists_eigenvector_of_isCompactOperator [CompleteSpace E] (K : ProperCone ℝ E)
    (hKs : (K : ConvexCone ℝ E).Salient) (hKt : IsTotalCone K) (T : E →L[ℝ] E)
    (hT : IsCompactOperator T) (hTK : MapsTo T K K) (hr : 0 < realSpectralRadius T) :
    (∃ x ∈ K, x ≠ 0 ∧ T x = (realSpectralRadius T).toReal • x) ∧
      ∃ φ : E →L[ℝ] ℝ, φ ≠ 0 ∧ (∀ x ∈ K, 0 ≤ φ x) ∧
        φ.comp T = (realSpectralRadius T).toReal • φ := by
  sorry

/-! ## Layer 3: strongly positive operators -/

/-- 3.1 A compact strongly positive operator for a closed salient cone with a nonzero point has
positive spectral radius `r`, and `r` has an eigenvector in the interior of the cone. -/
theorem exists_eigenvector_mem_interior [CompleteSpace E] (K : ProperCone ℝ E)
    (hKs : (K : ConvexCone ℝ E).Salient) (hK0 : ∃ x ∈ K, x ≠ 0) (T : E →L[ℝ] E)
    (hT : IsCompactOperator T) (hsp : IsStronglyPositive K T) :
    0 < realSpectralRadius T ∧
      ∃ x ∈ interior (K : Set E), T x = (realSpectralRadius T).toReal • x := by
  sorry

/-- 3.2 For a compact strongly positive operator and a closed salient cone with a nonzero point,
the dual operator has an eigenfunctional for the spectral radius that is strictly positive on the
nonzero points of the cone. -/
theorem exists_strictlyPositive_eigenfunctional [CompleteSpace E] (K : ProperCone ℝ E)
    (hKs : (K : ConvexCone ℝ E).Salient) (hK0 : ∃ x ∈ K, x ≠ 0) (T : E →L[ℝ] E)
    (hT : IsCompactOperator T) (hsp : IsStronglyPositive K T) :
    ∃ φ : E →L[ℝ] ℝ, φ.comp T = (realSpectralRadius T).toReal • φ ∧
      ∀ x ∈ K, x ≠ 0 → 0 < φ x := by
  sorry

/-- 3.3 For a compact strongly positive operator and a closed salient cone with a nonzero point,
the spectral radius `r` is an algebraically simple eigenvalue, its generalized eigenspace being the
line through any eigenvector in the cone, and no other real eigenvalue has an eigenvector in the
cone. -/
theorem maxGenEigenspace_eq_span_and_eq_of_mem [CompleteSpace E] (K : ProperCone ℝ E)
    (hKs : (K : ConvexCone ℝ E).Salient) (hK0 : ∃ x ∈ K, x ≠ 0) (T : E →L[ℝ] E)
    (hT : IsCompactOperator T) (hsp : IsStronglyPositive K T) :
    (∀ x ∈ K, x ≠ 0 → T x = (realSpectralRadius T).toReal • x →
      Module.End.maxGenEigenspace (T : Module.End ℝ E) (realSpectralRadius T).toReal =
        Submodule.span ℝ {x}) ∧
    ∀ y ∈ K, y ≠ 0 → ∀ t : ℝ, T y = t • y → t = (realSpectralRadius T).toReal := by
  sorry

/-- 3.4 For a compact strongly positive operator and a closed salient cone with a nonzero point,
every spectral value other than the spectral radius `r` has modulus strictly below `r`. -/
theorem norm_lt_of_mem_spectrum [CompleteSpace E] (K : ProperCone ℝ E)
    (hKs : (K : ConvexCone ℝ E).Salient) (hK0 : ∃ x ∈ K, x ≠ 0) (T : E →L[ℝ] E)
    (hT : IsCompactOperator T) (hsp : IsStronglyPositive K T) {μ : ℂ}
    (hμ : μ ∈ spectrum ℂ T.complexify) (hμr : μ ≠ ((realSpectralRadius T).toReal : ℂ)) :
    ‖μ‖ < (realSpectralRadius T).toReal := by
  sorry

/-! ## Layer 4: comparison of spectral radii -/

/-- 4.1 Monotonicity of the spectral radius: if `T` is compact and leaves a closed, salient,
total cone invariant, and `P - T` leaves it invariant as well, then `r(T) ≤ r(P)`. -/
theorem realSpectralRadius_le [CompleteSpace E] (K : ProperCone ℝ E)
    (hKs : (K : ConvexCone ℝ E).Salient) (hKt : IsTotalCone K) (T P : E →L[ℝ] E)
    (hT : IsCompactOperator T) (hTK : MapsTo T K K) (hPT : MapsTo (P - T) K K) :
    realSpectralRadius T ≤ realSpectralRadius P := by
  sorry

/-- 4.2 Strict monotonicity: if `T` and `P` are compact, `T` is strongly positive for a closed
salient cone with a nonzero point, and `P x - T x` is a nonzero point of the cone for every
nonzero `x` of the cone, then `r(T) < r(P)`. -/
theorem realSpectralRadius_lt [CompleteSpace E] (K : ProperCone ℝ E)
    (hKs : (K : ConvexCone ℝ E).Salient) (hK0 : ∃ x ∈ K, x ≠ 0) (T P : E →L[ℝ] E)
    (hT : IsCompactOperator T) (hP : IsCompactOperator P) (hsp : IsStronglyPositive K T)
    (hPT : ∀ x ∈ K, x ≠ 0 → P x - T x ∈ K ∧ P x ≠ T x) :
    realSpectralRadius T < realSpectralRadius P := by
  sorry

end KreinRutman
