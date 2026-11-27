import Mathlib

/-!
# Stationary time series and linear prediction: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib, each with `sorry`, together with the five
definitions they need; every definition has a real body. Every target of the README is stated
here.

A time series is a family `X : ℤ → E` in a real inner product space `E`; for centred
square-integrable random variables, `E` is `L²` and the inner product is the covariance. It is
second-order stationary when `⟪X s, X t⟫ = ⟪X 0, X (t - s)⟫` for all `s t`, and its autocovariance
is `γ h = ⟪X 0, X h⟫`. The one-step linear predictor of `X t` from `n` past values is a
combination `∑ j : Fin n, a j • X (t - 1 - j)`, so the coefficient `a j` multiplies the value at lag
`j + 1`. Matrix inverses are Mathlib's `Matrix.inv`, which is `0` for a singular matrix.
-/

noncomputable section

open Matrix Finset Filter Topology Polynomial
open scoped RealInnerProductSpace

namespace TauCetiRoadmap.StationaryTimeSeriesAndLinearPrediction

variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]

/-- 1.0 Second-order stationarity of a family `X : ℤ → E`: the inner product of `X s` and `X t`
depends only on `t - s`. -/
def IsSecondOrderStationary (X : ℤ → E) : Prop :=
  ∀ s t : ℤ, ⟪X s, X t⟫ = ⟪X 0, X (t - s)⟫

/-- 1.0 The autocovariance `γ h = ⟪X 0, X h⟫` of a family `X : ℤ → E`. -/
def autocov (X : ℤ → E) (h : ℤ) : ℝ :=
  ⟪X 0, X h⟫

/-- 1.0 The autocovariance matrix `Γₙ` of size `n`, with entry `γ (i - j)` in row `i` and
column `j`. -/
def autocovMatrix (X : ℤ → E) (n : ℕ) : Matrix (Fin n) (Fin n) ℝ :=
  Matrix.of fun i j ↦ autocov X ((i : ℤ) - j)

/-- 2.0 The Yule–Walker coefficients `Γₙ⁻¹ γₙ` of order `n`, where `γₙ` has entry `γ (i + 1)` in
row `i`. The entry at `j` is the coefficient of the value at lag `j + 1`. -/
def predCoeff (X : ℤ → E) (n : ℕ) : Fin n → ℝ :=
  (autocovMatrix X n)⁻¹ *ᵥ fun i ↦ autocov X ((i : ℤ) + 1)

/-- 2.0 The partial autocorrelation at lag `n`: the correlation of the residuals of `X n` and of
`X 0` after orthogonal projection onto the span of `X 1, …, X (n - 1)`; it is `0` when either
residual vanishes. -/
def pacf (X : ℤ → E) (n : ℕ) : ℝ :=
  let K := Submodule.span ℝ (Set.range fun j : Fin (n - 1) ↦ X ((j : ℤ) + 1))
  haveI : FiniteDimensional ℝ K := FiniteDimensional.span_of_finite ℝ (Set.finite_range _)
  ⟪X n - K.starProjection (X n), X 0 - K.starProjection (X 0)⟫ /
    (‖X n - K.starProjection (X n)‖ * ‖X 0 - K.starProjection (X 0)‖)

/-! ## Layer 1: prediction from finitely many past values -/

/-- 1.1 The normal equations. For a second-order stationary `X`, a combination
`∑ j : Fin n, a j • X (t - 1 - j)` of the `n` preceding values is a best linear predictor of `X t` if and
only if `a` solves the Yule–Walker equations `∑ j, γ (i - j) a j = γ (i + 1)`; for such `a` the
squared prediction error is `γ 0 - ∑ j, a j γ (j + 1)`. -/
theorem isLeast_norm_sub_iff_yuleWalker {X : ℤ → E} (hX : IsSecondOrderStationary X) (t : ℤ)
    (n : ℕ) (a : Fin n → ℝ) :
    ((∀ b : Fin n → ℝ,
        ‖X t - ∑ j : Fin n, a j • X (t - 1 - j)‖ ≤ ‖X t - ∑ j : Fin n, b j • X (t - 1 - j)‖) ↔
      ∀ i : Fin n, ∑ j : Fin n, autocov X ((i : ℤ) - j) * a j = autocov X ((i : ℤ) + 1)) ∧
    ((∀ i : Fin n, ∑ j : Fin n, autocov X ((i : ℤ) - j) * a j = autocov X ((i : ℤ) + 1)) →
      ‖X t - ∑ j : Fin n, a j • X (t - 1 - j)‖ ^ 2 =
        autocov X 0 - ∑ j : Fin n, a j * autocov X ((j : ℤ) + 1)) := by
  sorry

/-- 1.2 Toeplitz determinants are products of prediction errors. For a second-order stationary
`X` and every time `t`, `det Γₙ` is the product over `k < n` of the squared distance from `X t` to
the span of its `k` preceding values. -/
theorem det_autocovMatrix_eq_prod {X : ℤ → E} (hX : IsSecondOrderStationary X) (t : ℤ) (n : ℕ) :
    (autocovMatrix X n).det = ∏ k : Fin n,
      Metric.infDist (X t)
        (Submodule.span ℝ (Set.range fun j : Fin k ↦ X (t - 1 - j)) : Set E) ^ 2 := by
  sorry

/-- 1.3 If `γ 0 > 0` and `γ h → 0` as `h → ∞`, every autocovariance matrix is positive
definite. -/
theorem posDef_autocovMatrix_of_tendsto_zero {X : ℤ → E} (hX : IsSecondOrderStationary X)
    (h0 : 0 < autocov X 0) (hlim : Tendsto (autocov X) atTop (𝓝 0)) (n : ℕ) :
    (autocovMatrix X n).PosDef := by
  sorry

/-! ## Layer 2: the Durbin–Levinson recursion and partial autocorrelations -/

/-- 2.1 The Durbin–Levinson recursion. If `Γₙ₊₁` is positive definite, the coefficients of order
`n + 1` arise from those of order `n`: the last one is
`(γ (n + 1) - ∑ j, φₙ j γ (n - j)) / vₙ`, where `vₙ = γ 0 - ∑ j, φₙ j γ (j + 1)`; the others are
`φₙ j - φₙ₊₁,ₙ₊₁ φₙ (rev j)`; and `vₙ₊₁ = vₙ (1 - φₙ₊₁,ₙ₊₁ ^ 2)`. -/
theorem predCoeff_succ {X : ℤ → E} (n : ℕ) (hpd : (autocovMatrix X (n + 1)).PosDef) :
    predCoeff X (n + 1) (Fin.last n) =
        (autocov X ((n : ℤ) + 1) - ∑ j : Fin n, predCoeff X n j * autocov X ((n : ℤ) - j)) /
          (autocov X 0 - ∑ j : Fin n, predCoeff X n j * autocov X ((j : ℤ) + 1)) ∧
      (∀ j : Fin n, predCoeff X (n + 1) j.castSucc =
        predCoeff X n j - predCoeff X (n + 1) (Fin.last n) * predCoeff X n j.rev) ∧
      autocov X 0 - ∑ j : Fin (n + 1), predCoeff X (n + 1) j * autocov X ((j : ℤ) + 1) =
        (autocov X 0 - ∑ j : Fin n, predCoeff X n j * autocov X ((j : ℤ) + 1)) *
          (1 - predCoeff X (n + 1) (Fin.last n) ^ 2) := by
  sorry

/-- 2.2 For a second-order stationary `X`, the partial autocorrelation at lag `n + 1` is the last
Yule–Walker coefficient of order `n + 1`. -/
theorem pacf_eq_predCoeff_last {X : ℤ → E} (hX : IsSecondOrderStationary X) (n : ℕ) :
    pacf X (n + 1) = predCoeff X (n + 1) (Fin.last n) := by
  sorry

/-- 2.3 For a second-order stationary `X`, `Γₙ₊₂` is positive definite if and only if `Γₙ₊₁` is
positive definite and the partial autocorrelation at lag `n + 1` has absolute value less than
`1`. -/
theorem posDef_autocovMatrix_succ_iff {X : ℤ → E} (hX : IsSecondOrderStationary X) (n : ℕ) :
    (autocovMatrix X (n + 2)).PosDef ↔
      (autocovMatrix X (n + 1)).PosDef ∧ |pacf X (n + 1)| < 1 := by
  sorry

/-- 2.4 If `X t - ∑ j, φ j • X (t - 1 - j)` is orthogonal to every `X s` with `s < t`, the
partial autocorrelation vanishes at every lag greater than `p`. -/
theorem pacf_eq_zero_of_lt {X : ℤ → E} {p : ℕ} (φ : Fin p → ℝ)
    (horth : ∀ s t : ℤ, s < t → ⟪X t - ∑ j, φ j • X (t - 1 - j), X s⟫ = 0)
    {h : ℕ} (hh : p < h) : pacf X h = 0 := by
  sorry

/-! ## Layer 3: autoregressions, causality and the Wold decomposition -/

/-- 3.1 If the real polynomial `φ` has no zero in the closed unit disc, every solution `ψ` of
`∑_{k ≤ m} φₖ ψ (m - k) = [m = 0]` is absolutely summable. -/
theorem summable_abs_of_convolution_eq {φ : ℝ[X]}
    (hφ : ∀ z : ℂ, ‖z‖ ≤ 1 → aeval z φ ≠ 0) {ψ : ℕ → ℝ}
    (hψ : ∀ m : ℕ, ∑ k ∈ range (m + 1), φ.coeff k * ψ (m - k) = if m = 0 then 1 else 0) :
    Summable fun j ↦ |ψ j| := by
  sorry

/-- 3.2 Causal autoregressions. Let `Z` be white noise of variance `σ² > 0` in a real Hilbert
space. The equation `∑ₖ φₖ • X (t - k) = Z t` has a solution `X t = ∑' j, ψ j • Z (t - j)` with
`ψ` absolutely summable if and only if `φ` has no zero in the closed unit disc. -/
theorem exists_causal_solution_iff [CompleteSpace E] {Z : ℤ → E} {σ2 : ℝ} (hσ : 0 < σ2)
    (hZ : ∀ s t : ℤ, ⟪Z s, Z t⟫ = if s = t then σ2 else 0) (φ : ℝ[X]) :
    (∀ z : ℂ, ‖z‖ ≤ 1 → aeval z φ ≠ 0) ↔
      ∃ ψ : ℕ → ℝ, (Summable fun j ↦ |ψ j|) ∧ ∀ t : ℤ,
        ∑ k ∈ range (φ.natDegree + 1),
          φ.coeff k • ∑' j : ℕ, ψ j • Z (t - k - j) = Z t := by
  sorry

/-- 3.3 Uniqueness of the bounded solution. If `φ` has no zero in the closed unit disc and `ψ`
solves `∑_{k ≤ m} φₖ ψ (m - k) = [m = 0]`, every bounded `X` with `∑ₖ φₖ • X (t - k) = Z t` for
all `t` is `X t = ∑' j, ψ j • Z (t - j)`, the series converging. -/
theorem hasSum_of_bounded_solution {φ : ℝ[X]} (hφ : ∀ z : ℂ, ‖z‖ ≤ 1 → aeval z φ ≠ 0)
    {ψ : ℕ → ℝ}
    (hψ : ∀ m : ℕ, ∑ k ∈ range (m + 1), φ.coeff k * ψ (m - k) = if m = 0 then 1 else 0)
    {X Z : ℤ → E} (hb : ∃ C, ∀ t, ‖X t‖ ≤ C)
    (hXZ : ∀ t : ℤ, ∑ k ∈ range (φ.natDegree + 1), φ.coeff k • X (t - k) = Z t) (t : ℤ) :
    HasSum (fun j : ℕ ↦ ψ j • Z (t - j)) (X t) := by
  sorry

/-- 3.4 The Wold decomposition. Let `X` be second-order stationary in a real Hilbert space, `Mₜ`
the closed span of the `X s` with `s ≤ t`, and `Zₜ = X t - P_{Mₜ₋₁} (X t)` the innovation, with
`σ² = ‖Z 0‖²`. If `σ² > 0` and `ψ j = ⟪X 0, Z (-j)⟫ / σ²`, then `ψ 0 = 1`, `ψ` is square
summable, `Z` is white noise of variance `σ²` with `Zₜ ∈ Mₜ`, and for every `t` the series
`∑ j, ψ j • Z (t - j)` converges and its difference `Vₜ` from `X t` lies in every `Mₛ` and is
orthogonal to every `Zₛ`. -/
theorem wold_decomposition [CompleteSpace E] {X : ℤ → E} (hX : IsSecondOrderStationary X) :
    let M : ℤ → Submodule ℝ E := fun t ↦ (Submodule.span ℝ (X '' Set.Iic t)).topologicalClosure
    let Z : ℤ → E := fun t ↦ X t - (M (t - 1)).starProjection (X t)
    let ψ : ℕ → ℝ := fun j ↦ ⟪X 0, Z (-j)⟫ / ‖Z 0‖ ^ 2
    0 < ‖Z 0‖ ^ 2 →
      ψ 0 = 1 ∧ (Summable fun j ↦ ψ j ^ 2) ∧
      (∀ s t : ℤ, ⟪Z s, Z t⟫ = if s = t then ‖Z 0‖ ^ 2 else 0) ∧ (∀ t, Z t ∈ M t) ∧
      ∀ t : ℤ, (Summable fun j : ℕ ↦ ψ j • Z (t - j)) ∧
        (∀ s, X t - ∑' j : ℕ, ψ j • Z (t - j) ∈ M s) ∧
        ∀ s, ⟪Z s, X t - ∑' j : ℕ, ψ j • Z (t - j)⟫ = 0 := by
  sorry

end TauCetiRoadmap.StationaryTimeSeriesAndLinearPrediction
