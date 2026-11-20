import Mathlib
import TauCeti.Analysis.InnerProductSpace.Projection.Gap

/-!
# Eigenvalue iterations: target signatures

The roadmap is `README.md` in this folder; this file is not the roadmap. It states the roadmap's
headline theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the
four definitions they need. Every headline theorem of the README is statable at the pins and is
stated here:

* 1.2, power iteration for an operator on a finite-dimensional complex normed space with a
  semisimple eigenvalue `λ ≠ 0`, the other eigenvalues having modulus less than `r |λ|`;
* 1.3, subspace iteration for an operator on a finite-dimensional complex inner product space
  whose spectrum is split by a circle;
* 2.1–2.3, the exact tangent bounds for power, subspace and shifted inverse iteration for an
  operator with an orthonormal basis of eigenvectors;
* 3.1–3.3, the quadratic error of the Rayleigh quotient, the Kato–Temple bound, and the local
  cubic convergence of Rayleigh quotient iteration.

`Ring.inverse` is `0` at a non-invertible operator, and the Rayleigh quotient of `0` is `0`; the
README's Conventions say how the statements read at these values.
-/

open Module Module.End Filter Topology
open scoped InnerProductSpace

namespace TauCetiRoadmap.EigenvalueIterations

/-! ## Layer 1: dominant spectral parts of a general operator -/

section Definitions

variable {𝕜 E : Type*} [NormedField 𝕜] [AddCommGroup E] [Module 𝕜 E]

/-- 1.1 The dominant subspace of `T` at level `α`: the sum of the generalized eigenspaces of `T`
for the eigenvalues of modulus at least `α`. -/
def dominantSubspace (T : Module.End 𝕜 E) (α : ℝ) : Submodule 𝕜 E :=
  ⨆ (μ : 𝕜) (_ : α ≤ ‖μ‖), T.maxGenEigenspace μ

/-- 1.1 The subdominant subspace of `T` at level `α`: the sum of the generalized eigenspaces of
`T` for the eigenvalues of modulus less than `α`. -/
def subdominantSubspace (T : Module.End 𝕜 E) (α : ℝ) : Submodule 𝕜 E :=
  ⨆ (μ : 𝕜) (_ : ‖μ‖ < α), T.maxGenEigenspace μ

end Definitions

section PowerIteration

variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℂ E] [FiniteDimensional ℂ E]

/-- 1.2 **Power iteration.** Let `λ ≠ 0` be a semisimple eigenvalue of `T` (its generalized
eigenspace is its eigenspace) and let every other eigenvalue `μ` satisfy `‖μ‖ < r ‖λ‖`. For every
starting vector `v` there is a vector `u` of the eigenspace of `λ` with
`‖λ⁻ᵏ Tᵏ v − u‖ = O(rᵏ)` (so the scaled iterates converge to `u` when `r < 1`), and `u ≠ 0`
exactly when `v` does not lie in the sum of the generalized eigenspaces of the other eigenvalues
(Saad, Theorem 4.1 and (4.2), pp. 86–87). -/
theorem exists_norm_inv_pow_smul_pow_apply_sub_le (T : Module.End ℂ E) {lam : ℂ} {r : ℝ}
    (hlam : lam ≠ 0) (hss : T.maxGenEigenspace lam = T.eigenspace lam)
    (hr : ∀ μ, T.HasEigenvalue μ → μ ≠ lam → ‖μ‖ < r * ‖lam‖) (v : E) :
    ∃ u ∈ T.eigenspace lam,
      (u ≠ 0 ↔ v ∉ ⨆ (μ : ℂ) (_ : μ ≠ lam), T.maxGenEigenspace μ) ∧
      ∃ C : ℝ, ∀ k : ℕ, ‖lam⁻¹ ^ k • (T ^ k) v - u‖ ≤ C * r ^ k := by
  sorry

end PowerIteration

section SubspaceIteration

variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℂ E] [FiniteDimensional ℂ E]

/-- 1.3 **Subspace iteration.** Let `α > 0` and let every eigenvalue `μ` of `T` with `‖μ‖ < α`
satisfy `‖μ‖ < r α`. If `W` has the dimension of the dominant subspace and meets the subdominant
subspace only in `0`, then the gap `‖P_{Tᵏ W} − P_U‖` between `Tᵏ W` and the dominant subspace `U`
is `O(rᵏ)` (Saad, Theorem 5.1 and its proof, pp. 116–117). -/
theorem exists_projectionGap_map_pow_dominantSubspace_le (T : Module.End ℂ E) {α r : ℝ}
    (hα : 0 < α) (hr : ∀ μ, T.HasEigenvalue μ → ‖μ‖ < α → ‖μ‖ < r * α) (W : Submodule ℂ E)
    (hdim : finrank ℂ W = finrank ℂ (dominantSubspace T α))
    (hW : Disjoint W (subdominantSubspace T α)) :
    ∃ C : ℝ, ∀ k : ℕ,
      Submodule.projectionGap (W.map (T ^ k)) (dominantSubspace T α) ≤ C * r ^ k := by
  sorry

end SubspaceIteration

/-! ## Layer 2: operators with an orthonormal basis of eigenvectors -/

section Orthonormal

variable {𝕜 : Type*} [RCLike 𝕜] {E : Type*} [NormedAddCommGroup E] [InnerProductSpace 𝕜 E]
  [FiniteDimensional 𝕜 E] {ι : Type*} [Fintype ι]

/-- 2.1 **Power iteration, tangent bound.** If `T` has an orthonormal basis of eigenvectors and
every eigenvalue other than `λ` has modulus at most `ρ ‖λ‖`, then with `P` the orthogonal
projection onto the eigenspace of `λ`,
`‖P v‖ ‖(1 − P) Tᵏ v‖ ≤ ρᵏ ‖(1 − P) v‖ ‖P Tᵏ v‖`; that is, the tangent of the angle between
`Tᵏ v` and the eigenspace is at most `ρᵏ` times that of `v`. -/
theorem norm_starProjection_mul_norm_pow_apply_sub_le (T : E →L[𝕜] E)
    (b : OrthonormalBasis ι 𝕜 E) (d : ι → 𝕜) (hbd : ∀ i, T (b i) = d i • b i) {lam : 𝕜}
    {ρ : ℝ} (hρ : ∀ i, d i ≠ lam → ‖d i‖ ≤ ρ * ‖lam‖) (v : E) (k : ℕ) :
    ‖(eigenspace (T : E →ₗ[𝕜] E) lam).starProjection v‖ *
        ‖(T ^ k) v - (eigenspace (T : E →ₗ[𝕜] E) lam).starProjection ((T ^ k) v)‖ ≤
      ρ ^ k * ‖v - (eigenspace (T : E →ₗ[𝕜] E) lam).starProjection v‖ *
        ‖(eigenspace (T : E →ₗ[𝕜] E) lam).starProjection ((T ^ k) v)‖ := by
  sorry

/-- 2.2 **Subspace iteration, tangent bound.** If `T` has an orthonormal basis of eigenvectors
and every eigenvalue of modulus less than `α` has modulus at most `ρ α`, let `U` be the dominant
subspace at level `α` and `s(Z)` the directed gap `‖P_{U⊥} P_Z‖` from a subspace `Z` to `U`. Then
`s(Tᵏ W) √(1 − s(W)²) ≤ ρᵏ s(W) √(1 − s(Tᵏ W)²)` for every subspace `W`: the largest principal
tangent from `Tᵏ W` to `U` is at most `ρᵏ` times that from `W` (Arbenz, Theorem 8.6, p. 149). -/
theorem directedProjectionGap_map_pow_mul_sqrt_le (T : E →L[𝕜] E)
    (b : OrthonormalBasis ι 𝕜 E) (d : ι → 𝕜) (hbd : ∀ i, T (b i) = d i • b i) {α ρ : ℝ}
    (hρ : ∀ i, ‖d i‖ < α → ‖d i‖ ≤ ρ * α) (W : Submodule 𝕜 E) (k : ℕ) :
    Submodule.directedProjectionGap (W.map ((T ^ k : E →L[𝕜] E) : E →ₗ[𝕜] E))
          (dominantSubspace (T : E →ₗ[𝕜] E) α) *
        √(1 - Submodule.directedProjectionGap W (dominantSubspace (T : E →ₗ[𝕜] E) α) ^ 2) ≤
      ρ ^ k * Submodule.directedProjectionGap W (dominantSubspace (T : E →ₗ[𝕜] E) α) *
        √(1 - Submodule.directedProjectionGap (W.map ((T ^ k : E →L[𝕜] E) : E →ₗ[𝕜] E))
          (dominantSubspace (T : E →ₗ[𝕜] E) α) ^ 2) := by
  sorry

/-- 2.3 **One step of shifted inverse iteration.** If `T` has an orthonormal basis of
eigenvectors and every eigenvalue other than `λ` lies at distance at least `δ` from `λ`, then for
every shift `σ` and every `x`, with `y = (T − σ)⁻¹ x` and `P` the orthogonal projection onto the
eigenspace of `λ`, `(δ − ‖λ − σ‖) ‖P x‖ ‖(1 − P) y‖ ≤ ‖λ − σ‖ ‖(1 − P) x‖ ‖P y‖`
(Saad, (4.5), p. 89, for the rate of inverse iteration). -/
theorem sub_mul_norm_starProjection_mul_norm_inverse_apply_sub_le (T : E →L[𝕜] E)
    (b : OrthonormalBasis ι 𝕜 E) (d : ι → 𝕜) (hbd : ∀ i, T (b i) = d i • b i) {lam σ : 𝕜}
    {δ : ℝ} (hδ : ∀ i, d i ≠ lam → δ ≤ ‖d i - lam‖) (x : E) :
    (δ - ‖lam - σ‖) * ‖(eigenspace (T : E →ₗ[𝕜] E) lam).starProjection x‖ *
        ‖Ring.inverse (T - σ • 1) x -
          (eigenspace (T : E →ₗ[𝕜] E) lam).starProjection (Ring.inverse (T - σ • 1) x)‖ ≤
      ‖lam - σ‖ * ‖x - (eigenspace (T : E →ₗ[𝕜] E) lam).starProjection x‖ *
        ‖(eigenspace (T : E →ₗ[𝕜] E) lam).starProjection (Ring.inverse (T - σ • 1) x)‖ := by
  sorry

/-! ## Layer 3: Rayleigh quotients -/

/-- 3.1 The Rayleigh quotient `⟪x, T x⟫ / ‖x‖²`, with values in `𝕜`; it is `0` at `x = 0`. -/
noncomputable def rayleigh (T : E →L[𝕜] E) (x : E) : 𝕜 :=
  ⟪x, T x⟫_𝕜 / ((‖x‖ ^ 2 : ℝ) : 𝕜)

/-- 3.1 **The Rayleigh quotient is quadratically accurate.** If `T` has an orthonormal basis of
eigenvectors and every eigenvalue lies within `c` of `λ`, then
`‖x‖² ‖R(x) − λ‖ ≤ c ‖(1 − P) x‖²`, with `P` the orthogonal projection onto the eigenspace of
`λ`: the error of the Rayleigh quotient is at most `c sin² θ` for the angle `θ` between `x` and
the eigenspace (Arbenz, (7.21)–(7.23), pp. 132–133, for the largest eigenvalue of a symmetric
matrix). -/
theorem sq_norm_mul_norm_rayleigh_sub_le (T : E →L[𝕜] E) (b : OrthonormalBasis ι 𝕜 E)
    (d : ι → 𝕜) (hbd : ∀ i, T (b i) = d i • b i) {lam : 𝕜} {c : ℝ}
    (hc : ∀ i, ‖d i - lam‖ ≤ c) (x : E) :
    ‖x‖ ^ 2 * ‖rayleigh T x - lam‖ ≤
      c * ‖x - (eigenspace (T : E →ₗ[𝕜] E) lam).starProjection x‖ ^ 2 := by
  sorry

/-- 3.3 The Rayleigh quotient iteration without normalization: `x₀` is given and
`x_{k+1} = (T − R(x_k))⁻¹ x_k`, with `Ring.inverse` (so `x_{k+1} = 0` when the shift is an
eigenvalue). -/
noncomputable def rqiSeq (T : E →L[𝕜] E) (x₀ : E) : ℕ → E
  | 0 => x₀
  | k + 1 => Ring.inverse (T - rayleigh T (rqiSeq T x₀ k) • 1) (rqiSeq T x₀ k)

/-- 3.3 The tangent `‖(1 − P) x‖ / ‖P x‖` of the angle between `x` and the eigenspace of `λ`,
with `P` the orthogonal projection onto that eigenspace; it is `0` when `P x = 0`. -/
noncomputable def tanToEigenspace (T : E →L[𝕜] E) (lam : 𝕜) (x : E) : ℝ :=
  ‖x - (eigenspace (T : E →ₗ[𝕜] E) lam).starProjection x‖ /
    ‖(eigenspace (T : E →ₗ[𝕜] E) lam).starProjection x‖

/-- 3.3 **Local cubic convergence of Rayleigh quotient iteration.** If `T` has an orthonormal
basis of eigenvectors, every eigenvalue lies within `c` of `λ`, every eigenvalue other than `λ`
lies at distance at least `δ` from `λ`, and `2 c ‖(1 − P) x₀‖² < δ ‖P x₀‖²`, then the tangents
`t_k` of the Rayleigh quotient iterates satisfy `t_{k+1} ≤ (2 c / δ) t_k³` for every `k` and tend
to `0` (Arbenz, Theorem 7.14, p. 141). -/
theorem tanToEigenspace_rqiSeq_succ_le_and_tendsto (T : E →L[𝕜] E)
    (b : OrthonormalBasis ι 𝕜 E) (d : ι → 𝕜) (hbd : ∀ i, T (b i) = d i • b i) {lam : 𝕜}
    {c δ : ℝ} (hc : ∀ i, ‖d i - lam‖ ≤ c) (hδ : ∀ i, d i ≠ lam → δ ≤ ‖d i - lam‖) (x₀ : E)
    (h₀ : 2 * c * ‖x₀ - (eigenspace (T : E →ₗ[𝕜] E) lam).starProjection x₀‖ ^ 2 <
      δ * ‖(eigenspace (T : E →ₗ[𝕜] E) lam).starProjection x₀‖ ^ 2) :
    (∀ k, tanToEigenspace T lam (rqiSeq T x₀ (k + 1)) ≤
        2 * c / δ * tanToEigenspace T lam (rqiSeq T x₀ k) ^ 3) ∧
      Tendsto (fun k ↦ tanToEigenspace T lam (rqiSeq T x₀ k)) atTop (𝓝 0) := by
  sorry

end Orthonormal

section KatoTemple

variable {𝕜 : Type*} [RCLike 𝕜] {E : Type*} [NormedAddCommGroup E] [InnerProductSpace 𝕜 E]
  [FiniteDimensional 𝕜 E]

/-- 3.2 **The Kato–Temple bound.** Let `T` be symmetric and `x ≠ 0`, with Rayleigh quotient
`R = R(x)` and normalized squared residual `ε² = ‖T x − R x‖² / ‖x‖²`. If the open interval
`(a, b)` contains `R` and exactly one eigenvalue `λ` of `T`, then
`−ε² / (R − a) ≤ R − λ ≤ ε² / (b − R)` (Saad, Lemma 3.2 and Theorem 3.8, p. 62). -/
theorem kato_temple (T : E →L[𝕜] E) (hT : (T : E →ₗ[𝕜] E).IsSymmetric) {x : E} (hx : x ≠ 0)
    {a b lam : ℝ} (ha : a < T.rayleighQuotient x) (hb : T.rayleighQuotient x < b)
    (hlam : HasEigenvalue (T : E →ₗ[𝕜] E) (lam : 𝕜)) (hlamab : lam ∈ Set.Ioo a b)
    (huniq : ∀ μ : ℝ, HasEigenvalue (T : E →ₗ[𝕜] E) (μ : 𝕜) → μ ∈ Set.Ioo a b → μ = lam) :
    -(‖T x - (T.rayleighQuotient x : 𝕜) • x‖ ^ 2 / ‖x‖ ^ 2) / (T.rayleighQuotient x - a) ≤
        T.rayleighQuotient x - lam ∧
      T.rayleighQuotient x - lam ≤
        ‖T x - (T.rayleighQuotient x : 𝕜) • x‖ ^ 2 / ‖x‖ ^ 2 / (b - T.rayleighQuotient x) := by
  sorry

end KatoTemple

end TauCetiRoadmap.EigenvalueIterations
