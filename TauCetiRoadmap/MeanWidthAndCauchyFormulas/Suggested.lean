import Mathlib
import TauCeti.Probability.Distributions.Uniform.Sphere.Basic

/-!
# Mean width and Cauchy's formulas: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
results against the pinned Mathlib and Tau Ceti, with the few definitions they need, every
theorem with `sorry` and every definition with a real body. Every headline theorem of the README
is statable at the pins and is stated here.

`E` is a real inner product space. The support function of a set `K` is the `EReal.toReal`
of the support function of ConvexAnalysisAndDuality for the pairing `innerₗ E`,
so it is `0` at every direction for the empty set and at every direction in which `K` is
unbounded; the statements assume compact (and, where it matters, nonempty) sets. The mean width
averages the width `h_K(u) + h_K(-u)` against Tau Ceti's uniform law on the unit sphere, which is
the zero measure in dimension zero. Length of a planar boundary is the one-dimensional Euclidean
Hausdorff measure `μHE[1]`.
-/

noncomputable section

open MeasureTheory Set Metric Module
open scoped Pointwise RealInnerProductSpace

namespace TauCetiRoadmap.MeanWidthAndCauchyFormulas

/-! ## Local copy: ConvexAnalysisAndDuality, §2.1

The definition below is copied verbatim, with its `variable` line, from ConvexAnalysisAndDuality
§2.1, because a roadmap's Lean file does not import another roadmap's module. That roadmap's
statements about it (sublinearity, closedness, the closed convex hull criterion) are not copied
here. -/

namespace ConvexAnalysisAndDuality

variable {E F : Type*} [AddCommGroup E] [Module ℝ E] [AddCommGroup F] [Module ℝ F]

/-- The support function `σ_C(y) = ⨆ x ∈ C, B x y`, equal to `⊥` for empty `C`. -/
def supportFunction (B : E →ₗ[ℝ] F →ₗ[ℝ] ℝ) (C : Set E) (y : F) : EReal :=
  ⨆ x ∈ C, (B x y : EReal)

end ConvexAnalysisAndDuality

/-! ## Layer 1: support and width functions -/

section Support

variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]

/-- 1.1. The real support function `h_K(u) = sup_{x ∈ K} ⟪x, u⟫`, the real value of the support
function of ConvexAnalysisAndDuality §2.1 for the inner product pairing. -/
def realSupportFunction (K : Set E) (u : E) : ℝ :=
  (ConvexAnalysisAndDuality.supportFunction (innerₗ E) K u).toReal

/-- 1.2. The width of `K` in the direction `u`: `w_K(u) = h_K(u) + h_K(-u)`. -/
def widthFunction (K : Set E) (u : E) : ℝ :=
  realSupportFunction K u + realSupportFunction K (-u)

/-- 1.1. For a nonempty compact set the supremum defining the support function is attained, and
the support function is additive under Minkowski sums, positively homogeneous under dilations,
turns `-K` into `u ↦ h_K(-u)`, and is `R`-Lipschitz when `K` lies in the closed ball of
radius `R`. -/
theorem realSupportFunction_spec {K : Set E} (hK : IsCompact K) (hne : K.Nonempty) :
    (∀ u, IsGreatest ((fun x => ⟪x, u⟫) '' K) (realSupportFunction K u)) ∧
    (∀ {L : Set E}, IsCompact L → L.Nonempty →
      ∀ u, realSupportFunction (K + L) u = realSupportFunction K u + realSupportFunction L u) ∧
    (∀ c : ℝ, 0 ≤ c → ∀ u, realSupportFunction (c • K) u = c * realSupportFunction K u) ∧
    (∀ u, realSupportFunction (-K) u = realSupportFunction K (-u)) ∧
    (∀ R : ℝ, K ⊆ closedBall 0 R →
      ∀ u v, |realSupportFunction K u - realSupportFunction K v| ≤ R * ‖u - v‖) := by
  sorry

/-- 1.2. The width of a nonempty compact set is the support function of its difference body,
it is nonnegative, and the diameter is the largest width over unit directions. -/
theorem widthFunction_spec [Nontrivial E] {K : Set E} (hK : IsCompact K) (hne : K.Nonempty) :
    (∀ u, widthFunction K u = realSupportFunction (K - K) u) ∧
    (∀ u, 0 ≤ widthFunction K u) ∧
    IsGreatest (widthFunction K '' sphere (0 : E) 1) (diam K) := by
  sorry

end Support

/-! ## Layer 2: the difference body -/

/-- 2.1. For a convex set `K` in a real vector space and a linearly independent finite family `v`,
the set `½(K - K)` is a translate of the parallelepiped spanned by `v` exactly
when `K` is. -/
theorem exists_half_smul_sub_eq_vadd_parallelepiped_iff {V : Type*} [AddCommGroup V]
    [Module ℝ V] {ι : Type*} [Fintype ι] {K : Set V} (hK : Convex ℝ K) {v : ι → V}
    (hv : LinearIndependent ℝ v) :
    (∃ c : V, (1 / 2 : ℝ) • (K - K) = c +ᵥ parallelepiped v) ↔
      ∃ b : V, K = b +ᵥ parallelepiped v := by
  sorry

section Measure

variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E] [FiniteDimensional ℝ E]
  [MeasurableSpace E] [BorelSpace E]

/-- 2.2. Rogers–Shephard inequality: a compact convex set `K` in an `n`-dimensional space
satisfies `vol(K - K) ≤ C(2n, n) vol(K)`. -/
theorem volume_sub_le_choose_mul_volume {K : Set E} (hK : IsCompact K) (hc : Convex ℝ K) :
    volume (K - K) ≤ ((2 * finrank ℝ E).choose (finrank ℝ E) : ENNReal) * volume K := by
  sorry

/-! ## Layer 3: mean width -/

/-- 3.1. The mean width: the average of the width over the unit sphere for the uniform law. -/
def meanWidth (K : Set E) : ℝ :=
  ∫ u, widthFunction K (u : E) ∂TauCeti.Probability.uniformSphereMeasure E

/-- 3.2. The constant `m_n = Γ(n/2) / (√π Γ((n+1)/2))`, the average of `|⟪e, u⟫|` over the unit
sphere of an `n`-dimensional space for a unit vector `e`; `m_0 = 0` since `Γ(0) = 0` in Mathlib. -/
def sphereAbsMean (n : ℕ) : ℝ :=
  Real.Gamma (n / 2) / (Real.sqrt Real.pi * Real.Gamma ((n + 1) / 2))

/-- 3.1. For nonempty compact sets the mean width is twice the average support function, it is
additive under Minkowski sums, positively homogeneous, monotone under inclusion, invariant under
rigid motions, and nonnegative. -/
theorem meanWidth_spec {K : Set E} (hK : IsCompact K) (hne : K.Nonempty) :
    meanWidth K =
      2 * ∫ u, realSupportFunction K (u : E) ∂TauCeti.Probability.uniformSphereMeasure E ∧
    (∀ {L : Set E}, IsCompact L → L.Nonempty → meanWidth (K + L) = meanWidth K + meanWidth L) ∧
    (∀ c : ℝ, 0 ≤ c → meanWidth (c • K) = c * meanWidth K) ∧
    (∀ {L : Set E}, IsCompact L → K ⊆ L → meanWidth K ≤ meanWidth L) ∧
    (∀ (f : E ≃ₗᵢ[ℝ] E) (a : E), meanWidth (a +ᵥ f '' K) = meanWidth K) ∧
    0 ≤ meanWidth K := by
  sorry

/-- 3.2. The average of `|⟪v, u⟫|` over the unit sphere is `m_d ‖v‖`, `d = finrank ℝ E`, and
the mean width of the zonotope `∑ᵢ [-wᵢ, wᵢ]` is `2 m_d ∑ᵢ ‖wᵢ‖`. -/
theorem integral_abs_inner_and_meanWidth_zonotope (v : E) :
    ∫ u, |⟪v, (u : E)⟫| ∂TauCeti.Probability.uniformSphereMeasure E =
        sphereAbsMean (finrank ℝ E) * ‖v‖ ∧
      ∀ {ι : Type*} [Fintype ι] (w : ι → E),
        meanWidth (∑ i, segment ℝ (-w i) (w i)) =
          2 * sphereAbsMean (finrank ℝ E) * ∑ i, ‖w i‖ := by
  sorry

end Measure

/-- 3.3. In the complex plane the mean width of a compact set is `(1/π) ∫₀^{2π} h_K(e^{iθ}) dθ`. -/
theorem meanWidth_eq_integral_exp {K : Set ℂ} (hK : IsCompact K) :
    meanWidth K = (1 / Real.pi) *
      ∫ θ in (0 : ℝ)..(2 * Real.pi), realSupportFunction K (Complex.exp (θ * Complex.I)) := by
  sorry

/-! ## Layer 4: length, Crofton's formula and Cauchy's formula -/

section Length

variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E] [FiniteDimensional ℝ E]
  [MeasurableSpace E] [BorelSpace E]

/-- 4.1. Crofton's formula for curves: for a curve `γ` continuous on `[a, b]`, `m_d` times its
length is the average over unit directions `u` of the variation of `t ↦ ⟪u, γ t⟫`. -/
theorem ofReal_mul_eVariationOn_eq_lintegral {γ : ℝ → E} {a b : ℝ}
    (hγ : ContinuousOn γ (Icc a b)) :
    ENNReal.ofReal (sphereAbsMean (finrank ℝ E)) * eVariationOn γ (Icc a b) =
      ∫⁻ u, eVariationOn (fun t => ⟪(u : E), γ t⟫) (Icc a b)
        ∂TauCeti.Probability.uniformSphereMeasure E := by
  sorry

/-- 4.2. A closed curve continuous on `[a, b]` has length at least `2 / m_d` times the mean width
of the convex hull of its trace. -/
theorem ofReal_two_mul_meanWidth_convexHull_le {γ : ℝ → E} {a b : ℝ}
    (hγ : ContinuousOn γ (Icc a b)) (hcl : γ a = γ b) :
    ENNReal.ofReal (2 * meanWidth (convexHull ℝ (γ '' Icc a b))) ≤
      ENNReal.ofReal (sphereAbsMean (finrank ℝ E)) * eVariationOn γ (Icc a b) := by
  sorry

/-- 4.3. Cauchy's perimeter formula: in a two-dimensional space, the length of the boundary of a
compact convex set with nonempty interior is `π` times its mean width. -/
theorem euclideanHausdorffMeasure_frontier_eq (hE : finrank ℝ E = 2) {K : Set E}
    (hK : IsCompact K) (hc : Convex ℝ K) (hint : (interior K).Nonempty) :
    μHE[1] (frontier K) = ENNReal.ofReal (Real.pi * meanWidth K) := by
  sorry

/-- 4.4. Barbier's theorem: in a two-dimensional space, a nonempty compact convex set of constant
width `w` has boundary length `π w`. -/
theorem euclideanHausdorffMeasure_frontier_eq_of_constant_width (hE : finrank ℝ E = 2)
    {K : Set E} (hK : IsCompact K) (hc : Convex ℝ K) (hne : K.Nonempty) {w : ℝ}
    (hw : ∀ u ∈ sphere (0 : E) 1, widthFunction K u = w) :
    μHE[1] (frontier K) = ENNReal.ofReal (Real.pi * w) := by
  sorry

/-! ## Layer 5: mean width under a decomposition of the identity -/

/-- 5.1. If unit vectors `vᵢ` and positive weights `cᵢ` decompose the identity,
`∑ᵢ cᵢ ⟪vᵢ, x⟫ vᵢ = x`, and the nonempty compact convex set `S` satisfies `|⟪vᵢ, x⟫| ≤ 1` on `S`,
then the mean width of `S` is at most `2 d m_d`, `d = finrank ℝ E`, with equality exactly when
`S` is the cube `{x | ∀ i, |⟪bᵢ, x⟫| ≤ 1}` of an orthonormal basis `b`. -/
theorem meanWidth_le_of_isotropic {ι : Type*} [Fintype ι] {S : Set E} (hS : IsCompact S)
    (hc : Convex ℝ S) (hne : S.Nonempty) {v : ι → E} {c : ι → ℝ} (hv : ∀ i, ‖v i‖ = 1)
    (hcpos : ∀ i, 0 < c i) (hdec : ∀ x, ∑ i, (c i * ⟪v i, x⟫) • v i = x)
    (hcon : ∀ i, ∀ x ∈ S, |⟪v i, x⟫| ≤ 1) :
    meanWidth S ≤ 2 * finrank ℝ E * sphereAbsMean (finrank ℝ E) ∧
      (meanWidth S = 2 * finrank ℝ E * sphereAbsMean (finrank ℝ E) ↔
        ∃ b : OrthonormalBasis (Fin (finrank ℝ E)) ℝ E, S = {x | ∀ i, |⟪b i, x⟫| ≤ 1}) := by
  sorry

end Length

end TauCetiRoadmap.MeanWidthAndCauchyFormulas
