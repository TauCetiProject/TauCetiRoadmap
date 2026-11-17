import Mathlib
import TauCeti.Analysis.Convex.Subdifferential
import TauCeti.Analysis.GradientFlow.MoreauYosida.Basic

/-!
# Convergence of first-order optimization methods: target signatures

This file is not the roadmap: the roadmap is `README.md`. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti APIs, each with `sorry`. Every headline theorem
is statable at the pins. `LipschitzSmoothWith` is stated here in the shape of Mathlib PR #39574
(`fderiv_descent_le`) and is replaced by Mathlib's declaration when that lands.

Suppliers used by the README and not restated here: SpectralSteepestDescent 5.1
(`le_add_fderiv_add_of_lipschitz`); Tau Ceti `StrongConvexOn.add_add_le_of_hasFDerivWithinAt`,
`exists_affine_le_of_lt` (`FenchelMoreau.lean`), `subdifferential` and
`moreauYosidaResolvent`; Mathlib `toDual_gradient`, `strongConvexOn_zero`,
`strongConvexOn_iff_convex`, `exists_norm_eq_iInf_of_complete_convex`,
`norm_eq_iInf_iff_real_inner_le_zero`, `LinearMap.IsSymmetric.eigenvectorBasis`,
`LinearMap.singularValues`, `Nat.iterate`, `Submartingale.ae_tendsto_limitProcess` and
`Submartingale.exists_ae_tendsto_of_bdd`; MathematicalStatisticsNonparametric 6.4
(`softThreshold`) and 6.5 (`metricProj`).
-/

noncomputable section

open Filter Topology MeasureTheory TauCeti
open scoped NNReal ENNReal InnerProductSpace RealInnerProductSpace Gradient

namespace TauCetiRoadmap.FirstOrderOptimization

variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E] [CompleteSpace E]

/-! ## Layer 1: smoothness and convexity inequalities -/

/-- `f` is `K`-smooth: differentiable, with first-order Taylor remainder at most
`K / 2 * dist x y ^ 2` (Mathlib PR #39574). -/
structure LipschitzSmoothWith (𝕜 : Type*) [NontriviallyNormedField 𝕜] {F G : Type*}
    [NormedAddCommGroup F] [NormedSpace 𝕜 F] [NormedAddCommGroup G] [NormedSpace 𝕜 G]
    (K : ℝ≥0) (f : F → G) : Prop where
  differentiable : Differentiable 𝕜 f
  fderiv_norm_le : ∀ x y, ‖f y - f x - fderiv 𝕜 f x (y - x)‖ ≤ K / 2 * dist x y ^ 2

/-- 1.1: a Lipschitz gradient gives smoothness (from SpectralSteepestDescent 5.1). -/
theorem LipschitzSmoothWith.of_lipschitzWith_gradient {K : ℝ≥0} {f : E → ℝ}
    (hd : Differentiable ℝ f) (hL : LipschitzWith K (∇ f)) : LipschitzSmoothWith ℝ K f :=
  sorry

/-- 1.1: the gradient bound at a lower bound. -/
theorem LipschitzSmoothWith.norm_gradient_sq_le {K : ℝ≥0} {f : E → ℝ} {m : ℝ}
    (hf : LipschitzSmoothWith ℝ K f) (hm : ∀ y, m ≤ f y) (x : E) :
    ‖∇ f x‖ ^ 2 ≤ 2 * K * (f x - m) :=
  sorry

/-- 1.2: the convex smooth lower bound. Uses the first-order inequality of a convex
differentiable function, `StrongConvexOn.add_add_le_of_hasFDerivWithinAt` at `μ = 0`. -/
theorem ConvexOn.add_inner_gradient_add_le {K : ℝ≥0} {f : E → ℝ} (hK : 0 < K)
    (hc : ConvexOn ℝ Set.univ f) (hf : LipschitzSmoothWith ℝ K f) (x y : E) :
    f x + ⟪∇ f x, y - x⟫ + ‖∇ f y - ∇ f x‖ ^ 2 / (2 * K) ≤ f y :=
  sorry

/-- 1.2: cocoercivity of the gradient of a convex smooth function. -/
theorem ConvexOn.norm_gradient_sub_sq_le_inner {K : ℝ≥0} {f : E → ℝ} (hK : 0 < K)
    (hc : ConvexOn ℝ Set.univ f) (hf : LipschitzSmoothWith ℝ K f) (x y : E) :
    ‖∇ f x - ∇ f y‖ ^ 2 / K ≤ ⟪∇ f x - ∇ f y, x - y⟫ :=
  sorry

/-- 1.2: the gradient of a `K`-smooth function on a Hilbert space is `K`-Lipschitz, with no
convexity hypothesis (the Baillon–Haddad theorem applied to `f + K / 2 * ‖·‖ ^ 2`). -/
theorem LipschitzSmoothWith.lipschitzWith_gradient {K : ℝ≥0} {f : E → ℝ}
    (hf : LipschitzSmoothWith ℝ K f) : LipschitzWith K (∇ f) :=
  sorry

/-- 1.3: the strongly convex and smooth gradient inequality (Nesterov, Theorem 2.1.12). -/
theorem StrongConvexOn.inner_gradient_sub_ge {K : ℝ≥0} {μ : ℝ} {f : E → ℝ} (hμ : 0 < μ)
    (hs : StrongConvexOn Set.univ μ f) (hf : LipschitzSmoothWith ℝ K f) (x y : E) :
    μ * K / (μ + K) * ‖x - y‖ ^ 2 + 1 / (μ + K) * ‖∇ f x - ∇ f y‖ ^ 2 ≤
      ⟪∇ f x - ∇ f y, x - y⟫ :=
  sorry

/-- 1.3: a continuous strongly convex function on a Hilbert space has a unique minimizer. -/
theorem StrongConvexOn.existsUnique_isMinOn {μ : ℝ} {f : E → ℝ} (hμ : 0 < μ)
    (hs : StrongConvexOn Set.univ μ f) (hcont : Continuous f) :
    ∃! x, IsMinOn f Set.univ x :=
  sorry

/-- 1.4: the Polyak–Łojasiewicz condition with constant `μ`. -/
structure PolyakLojasiewicz (μ : ℝ) (f : E → ℝ) : Prop where
  bddBelow : BddBelow (Set.range f)
  le : ∀ x, 2 * μ * (f x - ⨅ y, f y) ≤ ‖∇ f x‖ ^ 2

/-- 1.4: least squares satisfies the Polyak–Łojasiewicz condition with the square of the
smallest nonzero singular value, whatever the rank. -/
theorem polyakLojasiewicz_leastSquares {F : Type*} [NormedAddCommGroup F]
    [InnerProductSpace ℝ F] [FiniteDimensional ℝ E] [FiniteDimensional ℝ F]
    (A : E →ₗ[ℝ] F) (b : F) {σ : ℝ} (hσ : 0 < σ)
    (hmin : ∀ i, A.singularValues i ≠ 0 → σ ≤ A.singularValues i) :
    PolyakLojasiewicz (σ ^ 2) (fun x ↦ ‖A x - b‖ ^ 2 / 2) :=
  sorry

/-! ## Layer 2: gradient descent -/

/-- One step of gradient descent with step size `η`. -/
def gradientStep (f : E → ℝ) (η : ℝ) (x : E) : E := x - η • ∇ f x

/-- The `k`-th iterate of gradient descent from `x₀`. -/
def gradientDescent (f : E → ℝ) (η : ℝ) (x₀ : E) (k : ℕ) : E := (gradientStep f η)^[k] x₀

/-- 2.1: summability of squared gradient norms for a smooth function bounded below. -/
theorem gradientDescent_sum_norm_gradient_sq_le {K : ℝ≥0} {f : E → ℝ} {m η : ℝ}
    (hf : LipschitzSmoothWith ℝ K f) (hm : ∀ y, m ≤ f y) (hη : 0 < η) (hηK : η * K ≤ 1)
    (x₀ : E) (k : ℕ) :
    ∑ i ∈ Finset.range k, ‖∇ f (gradientDescent f η x₀ i)‖ ^ 2 ≤ 2 * (f x₀ - m) / η :=
  sorry

/-- 2.1: the gradients along gradient descent tend to `0`. -/
theorem tendsto_gradient_gradientDescent {K : ℝ≥0} {f : E → ℝ} {m η : ℝ}
    (hf : LipschitzSmoothWith ℝ K f) (hm : ∀ y, m ≤ f y) (hη : 0 < η) (hηK : η * K ≤ 1)
    (x₀ : E) :
    Tendsto (fun k ↦ ∇ f (gradientDescent f η x₀ k)) atTop (𝓝 0) :=
  sorry

/-- 2.2: the `O(1/k)` rate for convex smooth functions. -/
theorem gradientDescent_convex_rate {K : ℝ≥0} {f : E → ℝ} {η : ℝ} {xstar : E}
    (hc : ConvexOn ℝ Set.univ f) (hf : LipschitzSmoothWith ℝ K f)
    (hmin : ∀ y, f xstar ≤ f y) (hη : 0 < η) (hηK : η * K ≤ 1) (x₀ : E) {k : ℕ} (hk : 1 ≤ k) :
    f (gradientDescent f η x₀ k) - f xstar ≤ ‖x₀ - xstar‖ ^ 2 / (2 * η * k) :=
  sorry

/-- 2.2: in finite dimension the iterates converge to a minimizer. -/
theorem tendsto_gradientDescent_of_convex [FiniteDimensional ℝ E] {K : ℝ≥0} {f : E → ℝ} {η : ℝ}
    (hc : ConvexOn ℝ Set.univ f) (hf : LipschitzSmoothWith ℝ K f)
    (hex : ∃ xstar, ∀ y, f xstar ≤ f y) (hη : 0 < η) (hηK : η * K ≤ 1) (x₀ : E) :
    ∃ xstar, (∀ y, f xstar ≤ f y) ∧ Tendsto (gradientDescent f η x₀) atTop (𝓝 xstar) :=
  sorry

/-- 2.3: the linear rate under the Polyak–Łojasiewicz condition. -/
theorem gradientDescent_polyakLojasiewicz_rate {K : ℝ≥0} {μ : ℝ} {f : E → ℝ} (hK : 0 < K)
    (hf : LipschitzSmoothWith ℝ K f) (hpl : PolyakLojasiewicz μ f) (x₀ : E) (k : ℕ) :
    f (gradientDescent f (1 / K) x₀ k) - ⨅ y, f y ≤ (1 - μ / K) ^ k * (f x₀ - ⨅ y, f y) :=
  sorry

/-- 2.4: the linear rate for strongly convex smooth functions. -/
theorem gradientDescent_strongConvex_rate {K : ℝ≥0} {μ η : ℝ} {f : E → ℝ} {xstar : E}
    (hμ : 0 < μ) (hs : StrongConvexOn Set.univ μ f) (hf : LipschitzSmoothWith ℝ K f)
    (hmin : ∀ y, f xstar ≤ f y) (hη : 0 < η) (hηK : η * (μ + K) ≤ 2) (x₀ : E) (k : ℕ) :
    ‖gradientDescent f η x₀ k - xstar‖ ^ 2 ≤
      (1 - 2 * η * μ * K / (μ + K)) ^ k * ‖x₀ - xstar‖ ^ 2 :=
  sorry

/-! ## Layer 3: projections, proximal maps and nonsmooth methods -/

/-- `g : E → EReal` is closed proper convex, in the convention of Tau Ceti's Fenchel–Moreau
theorem. -/
structure ClosedProperConvex (g : E → EReal) : Prop where
  convex_epigraph : Convex ℝ {p : E × ℝ | g p.1 ≤ p.2}
  lowerSemicontinuous : LowerSemicontinuous g
  ne_bot : ∀ x, g x ≠ ⊥
  exists_ne_top : ∃ x, g x ≠ ⊤

/-- The projection onto a set: the unique nearest point when it exists, and `x` otherwise. On a
nonempty closed convex set it is `metricProj` of MathematicalStatisticsNonparametric 6.5, whose
value where no nearest point exists is `0`. -/
def convexProjection (C : Set E) (x : E) : E := by
  classical
  exact if h : ∃! p, p ∈ C ∧ ∀ z ∈ C, ‖x - p‖ ≤ ‖x - z‖ then h.choose else x

/-- 3.1: firm nonexpansiveness of the projection onto a closed convex set. -/
theorem convexProjection_firmlyNonexpansive {C : Set E} (hne : C.Nonempty)
    (hcl : IsClosed C) (hcv : Convex ℝ C) (x y : E) :
    ‖convexProjection C x - convexProjection C y‖ ^ 2 ≤
      ⟪convexProjection C x - convexProjection C y, x - y⟫ :=
  sorry

/-- The proximal map: the unique minimizer of `u ↦ g u + ‖u - x‖² / (2η)` when it exists, and `x`
otherwise. -/
def prox (g : E → EReal) (η : ℝ) (x : E) : E := by
  classical
  exact if h : ∃! p, ∀ u, g p + ((‖p - x‖ ^ 2 / (2 * η) : ℝ) : EReal) ≤
      g u + ((‖u - x‖ ^ 2 / (2 * η) : ℝ) : EReal) then h.choose else x

/-- 3.2: the penalized function of a closed proper convex function has a unique minimizer. -/
theorem existsUnique_prox {g : E → EReal} (hg : ClosedProperConvex g) {η : ℝ} (hη : 0 < η)
    (x : E) :
    ∃! p, ∀ u, g p + ((‖p - x‖ ^ 2 / (2 * η) : ℝ) : EReal) ≤
      g u + ((‖u - x‖ ^ 2 / (2 * η) : ℝ) : EReal) :=
  sorry

/-- 3.2: the Moreau–Yosida resolvent of a closed proper convex function is the proximal point. -/
theorem moreauYosidaResolvent_eq_prox {g : E → EReal}
    (hg : ClosedProperConvex g) {η : ℝ} (hη : 0 < η) (x : E) :
    moreauYosidaResolvent g η.toNNReal x = {prox g η x} :=
  sorry

/-- 3.2: the subdifferential characterization of the proximal map. -/
theorem eq_prox_iff {g : E → EReal} (hg : ClosedProperConvex g) {η : ℝ}
    (hη : 0 < η) (x p : E) :
    p = prox g η x ↔ η⁻¹ • (x - p) ∈ subdifferential (innerₗ E) g p :=
  sorry

/-- 3.3: the rate of the subgradient method. A function with a subgradient at every point is
convex, so convexity is not a separate hypothesis. -/
theorem subgradientMethod_rate {f : E → ℝ} {s : E → E} {G : ℝ} {xstar : E} (η : ℕ → ℝ)
    (hs : ∀ x, s x ∈ subdifferential (innerₗ E) (fun z ↦ (f z : EReal)) x)
    (hG : ∀ x, ‖s x‖ ≤ G) (hη : ∀ i, 0 < η i) (hmin : ∀ y, f xstar ≤ f y)
    (x : ℕ → E) (hx : ∀ i, x (i + 1) = x i - η i • s (x i)) (k : ℕ) :
    ∃ i ≤ k, f (x i) - f xstar ≤
      (‖x 0 - xstar‖ ^ 2 + G ^ 2 * ∑ j ∈ Finset.range (k + 1), η j ^ 2) /
        (2 * ∑ j ∈ Finset.range (k + 1), η j) :=
  sorry

/-- One step of proximal gradient descent. -/
def proxGradientStep (f : E → ℝ) (g : E → EReal) (η : ℝ) (x : E) : E :=
  prox g η (x - η • ∇ f x)

/-- 3.4: the `O(1/k)` rate of proximal gradient descent. -/
theorem proxGradient_rate {K : ℝ≥0} {f : E → ℝ} {g : E → EReal} {η : ℝ}
    {xstar : E} (hc : ConvexOn ℝ Set.univ f) (hf : LipschitzSmoothWith ℝ K f)
    (hg : ClosedProperConvex g) (hmin : ∀ y, (f xstar : EReal) + g xstar ≤ f y + g y)
    (hη : 0 < η) (hηK : η * K ≤ 1) (x₀ : E) {k : ℕ} (hk : 1 ≤ k) :
    let xk := (proxGradientStep f g η)^[k] x₀
    (f xk : EReal) + g xk ≤
      (f xstar : EReal) + g xstar + ((‖x₀ - xstar‖ ^ 2 / (2 * η * k) : ℝ) : EReal) :=
  sorry

/-! ## Layer 4: momentum and acceleration -/

/-- One heavy-ball step on the state `(x, x_prev)`. -/
def heavyBallStep (f : E → ℝ) (α β : ℝ) (s : E × E) : E × E :=
  (s.1 - α • ∇ f s.1 + β • (s.1 - s.2), s.1)

/-- 4.1: the accelerated rate of the heavy-ball method on quadratics. -/
theorem heavyBall_quadratic_rate [FiniteDimensional ℝ E] {A : E →L[ℝ] E} {b xstar : E}
    {μ K : ℝ} (hA : (A : E →ₗ[ℝ] E).IsSymmetric) (hμ : 0 < μ)
    (hlow : ∀ v, μ * ‖v‖ ^ 2 ≤ ⟪A v, v⟫) (hup : ∀ v, ⟪A v, v⟫ ≤ K * ‖v‖ ^ 2)
    (hstar : A xstar = b) (x₀ : E) :
    let f : E → ℝ := fun x ↦ ⟪A x, x⟫ / 2 - ⟪b, x⟫
    let α := 4 / (√K + √μ) ^ 2
    let q := (√K - √μ) / (√K + √μ)
    ∃ c, ∀ k : ℕ, ‖((heavyBallStep f α (q ^ 2))^[k] (x₀, x₀)).1 - xstar‖ ≤ c * (k + 1) * q ^ k :=
  sorry

/-- The FISTA state `(x_k, x_{k-1}, t_k)` advanced by one step, for `k ≥ 1`. -/
def fistaStep (f : E → ℝ) (g : E → EReal) (η : ℝ) (s : E × E × ℝ) : E × E × ℝ :=
  let t' := (1 + √(1 + 4 * s.2.2 ^ 2)) / 2
  let y := s.1 + ((s.2.2 - 1) / t') • (s.1 - s.2.1)
  (proxGradientStep f g η y, s.1, t')

/-- 4.2: the `O(1/k²)` rate of FISTA. The state after `k - 1` steps from
`(x₁, x₀, 1)` holds `x_k`, where `x₁ = proxGradientStep f g η x₀`. -/
theorem fista_rate {K : ℝ≥0} {f : E → ℝ} {g : E → EReal} {η : ℝ}
    {xstar : E} (hc : ConvexOn ℝ Set.univ f) (hf : LipschitzSmoothWith ℝ K f)
    (hg : ClosedProperConvex g) (hmin : ∀ y, (f xstar : EReal) + g xstar ≤ f y + g y)
    (hη : 0 < η) (hηK : η * K ≤ 1) (x₀ : E) {k : ℕ} (hk : 1 ≤ k) :
    let xk := ((fistaStep f g η)^[k - 1] (proxGradientStep f g η x₀, x₀, 1)).1
    (f xk : EReal) + g xk ≤
      (f xstar : EReal) + g xstar + ((2 * ‖x₀ - xstar‖ ^ 2 / (η * (k + 1) ^ 2) : ℝ) : EReal) :=
  sorry

/-- One constant-momentum FISTA step on the state `(x_k, x_{k-1})`. -/
def fistaConstantMomentumStep (f : E → ℝ) (g : E → EReal) (η q : ℝ) (s : E × E) : E × E :=
  (proxGradientStep f g η (s.1 + q • (s.1 - s.2)), s.1)

/-- 4.3: the accelerated linear rate of FISTA with constant momentum. -/
theorem fistaConstantMomentum_rate {K : ℝ≥0} {μ : ℝ} {f : E → ℝ} {g : E → EReal} {xstar : E}
    (hμ : 0 < μ) (hμK : μ ≤ K) (hs : StrongConvexOn Set.univ μ f)
    (hf : LipschitzSmoothWith ℝ K f) (hg : ClosedProperConvex g)
    (hmin : ∀ y, (f xstar : EReal) + g xstar ≤ f y + g y) (x₀ : E) (hx₀ : g x₀ ≠ ⊤) (k : ℕ) :
    let κ : ℝ := K / μ
    let q := (√κ - 1) / (√κ + 1)
    let xk := ((fistaConstantMomentumStep f g (1 / K) q)^[k] (x₀, x₀)).1
    (f xk : EReal) + g xk ≤ (f xstar : EReal) + g xstar +
      (((1 - 1 / √κ) ^ k * (f x₀ + (g x₀).toReal - (f xstar + (g xstar).toReal) +
        μ / 2 * ‖x₀ - xstar‖ ^ 2) : ℝ) : EReal) :=
  sorry

/-! ## Layer 5: stochastic approximation -/

section Stochastic

variable {Ω : Type*} {m₀ : MeasurableSpace Ω} {P : Measure Ω} [IsProbabilityMeasure P]

/-- 5.1: the Robbins–Siegmund theorem: convergence where the perturbations are summable. -/
theorem ae_tendsto_of_robbinsSiegmund {ℱ : Filtration ℕ m₀} {V a β ζ : ℕ → Ω → ℝ}
    (hV : StronglyAdapted ℱ V) (ha : StronglyAdapted ℱ a) (hβ : StronglyAdapted ℱ β)
    (hζ : StronglyAdapted ℱ ζ) (hV0 : ∀ n ω, 0 ≤ V n ω) (ha0 : ∀ n ω, 0 ≤ a n ω)
    (hβ0 : ∀ n ω, 0 ≤ β n ω) (hζ0 : ∀ n ω, 0 ≤ ζ n ω) (hVi : ∀ n, Integrable (V n) P)
    (hrec : ∀ n, P[V (n + 1) | ℱ n] ≤ᵐ[P] fun ω ↦ (1 + a n ω) * V n ω + β n ω - ζ n ω) :
    ∀ᵐ ω ∂P, Summable (a · ω) → Summable (β · ω) →
      ∃ l : ℝ, Tendsto (fun n ↦ V n ω) atTop (𝓝 l) :=
  sorry

/-- 5.1: the Robbins–Siegmund theorem: summability of the decrease terms. -/
theorem ae_summable_of_robbinsSiegmund {ℱ : Filtration ℕ m₀} {V a β ζ : ℕ → Ω → ℝ}
    (hV : StronglyAdapted ℱ V) (ha : StronglyAdapted ℱ a) (hβ : StronglyAdapted ℱ β)
    (hζ : StronglyAdapted ℱ ζ) (hV0 : ∀ n ω, 0 ≤ V n ω) (ha0 : ∀ n ω, 0 ≤ a n ω)
    (hβ0 : ∀ n ω, 0 ≤ β n ω) (hζ0 : ∀ n ω, 0 ≤ ζ n ω) (hVi : ∀ n, Integrable (V n) P)
    (hrec : ∀ n, P[V (n + 1) | ℱ n] ≤ᵐ[P] fun ω ↦ (1 + a n ω) * V n ω + β n ω - ζ n ω) :
    ∀ᵐ ω ∂P, Summable (a · ω) → Summable (β · ω) → Summable (ζ · ω) :=
  sorry

/-- 5.1: the integrable form, with a deterministic factor. -/
theorem robbinsSiegmund_integrable {ℱ : Filtration ℕ m₀} {V β ζ : ℕ → Ω → ℝ} {a : ℕ → ℝ}
    (hV : StronglyAdapted ℱ V) (hβ : StronglyAdapted ℱ β) (hζ : StronglyAdapted ℱ ζ)
    (hV0 : ∀ n ω, 0 ≤ V n ω) (hβ0 : ∀ n ω, 0 ≤ β n ω) (hζ0 : ∀ n ω, 0 ≤ ζ n ω)
    (hVi : ∀ n, Integrable (V n) P) (hβi : ∀ n, Integrable (β n) P)
    (ha0 : ∀ n, 0 ≤ a n) (ha : Summable a)
    (hβs : Summable fun n ↦ ∫ ω, β n ω ∂P)
    (hrec : ∀ n, P[V (n + 1) | ℱ n] ≤ᵐ[P] fun ω ↦ (1 + a n) * V n ω + β n ω - ζ n ω) :
    (∀ᵐ ω ∂P, Summable (β · ω)) ∧ BddAbove (Set.range fun n ↦ ∫ ω, V n ω ∂P) ∧
      Summable fun n ↦ ∫ ω, ζ n ω ∂P :=
  sorry

/-- The SGD model: iterates driven by an unbiased gradient oracle with conditional variance at
most `σ²`. -/
structure IsSGD (ℱ : Filtration ℕ m₀) (P : Measure Ω) (f : E → ℝ) (η : ℕ → ℝ) (σ : ℝ)
    (x g : ℕ → Ω → E) : Prop where
  step : ∀ n ω, x (n + 1) ω = x n ω - η n • g n ω
  adapted : StronglyAdapted ℱ x
  measurable_oracle : ∀ n, StronglyMeasurable[ℱ (n + 1)] (g n)
  integrable_sq : ∀ n, Integrable (fun ω ↦ ‖g n ω‖ ^ 2) P
  integrable_noise_sq : ∀ n, Integrable (fun ω ↦ ‖g n ω - ∇ f (x n ω)‖ ^ 2) P
  unbiased : ∀ n, P[g n | ℱ n] =ᵐ[P] fun ω ↦ ∇ f (x n ω)
  variance : ∀ n, P[fun ω ↦ ‖g n ω - ∇ f (x n ω)‖ ^ 2 | ℱ n] ≤ᵐ[P] fun _ ↦ σ ^ 2

/-- 5.3: the nonconvex constant-step rate of SGD. -/
theorem sgd_nonconvex_rate {ℱ : Filtration ℕ m₀} {K : ℝ≥0} {f : E → ℝ} {m η σ : ℝ} {x₀ : E}
    {x g : ℕ → Ω → E} (hf : LipschitzSmoothWith ℝ K f) (hm : ∀ y, m ≤ f y) (hη : 0 < η)
    (hηK : η * K ≤ 1) (hsgd : IsSGD ℱ P f (fun _ ↦ η) σ x g) (hx0 : x 0 = fun _ ↦ x₀)
    {N : ℕ} (hN : 1 ≤ N) :
    (1 / N : ℝ) * ∑ n ∈ Finset.range N, ∫ ω, ‖∇ f (x n ω)‖ ^ 2 ∂P ≤
      2 * (f x₀ - m) / (η * N) + K * η * σ ^ 2 :=
  sorry

/-- 5.3: the constant-step rate of SGD on strongly convex smooth functions. -/
theorem sgd_strongConvex_constant_rate {ℱ : Filtration ℕ m₀} {K : ℝ≥0} {f : E → ℝ}
    {μ η σ : ℝ} {x₀ xstar : E} {x g : ℕ → Ω → E} (hμ : 0 < μ)
    (hs : StrongConvexOn Set.univ μ f) (hf : LipschitzSmoothWith ℝ K f)
    (hmin : ∀ y, f xstar ≤ f y) (hη : 0 < η) (hηK : η * K ≤ 1)
    (hsgd : IsSGD ℱ P f (fun _ ↦ η) σ x g) (hx0 : x 0 = fun _ ↦ x₀) (n : ℕ) :
    ∫ ω, ‖x n ω - xstar‖ ^ 2 ∂P ≤ (1 - η * μ) ^ n * ‖x₀ - xstar‖ ^ 2 + η * σ ^ 2 / μ :=
  sorry

/-- 5.3: the `O(1/n)` rate of SGD on strongly convex smooth functions. -/
theorem sgd_strongConvex_rate {ℱ : Filtration ℕ m₀} {K : ℝ≥0} {f : E → ℝ} {μ σ : ℝ}
    {x₀ xstar : E} {x g : ℕ → Ω → E} {n₀ : ℕ} (hμ : 0 < μ) (hs : StrongConvexOn Set.univ μ f)
    (hf : LipschitzSmoothWith ℝ K f) (hmin : ∀ y, f xstar ≤ f y) (hn₀ : 2 * K / μ ≤ n₀)
    (hsgd : IsSGD ℱ P f (fun n ↦ 2 / (μ * (n + n₀))) σ x g) (hx0 : x 0 = fun _ ↦ x₀) (n : ℕ) :
    ∫ ω, ‖x n ω - xstar‖ ^ 2 ∂P ≤
      max (n₀ * ‖x₀ - xstar‖ ^ 2) (4 * σ ^ 2 / μ ^ 2) / (n + n₀) :=
  sorry

/-- 5.4: almost-sure convergence of SGD on convex smooth functions under Robbins–Monro step
sizes, in finite dimension. -/
theorem sgd_convex_ae_tendsto [FiniteDimensional ℝ E] {ℱ : Filtration ℕ m₀} {K : ℝ≥0}
    {f : E → ℝ} {η : ℕ → ℝ} {σ : ℝ}
    {x₀ : E} {x g : ℕ → Ω → E} (hc : ConvexOn ℝ Set.univ f) (hf : LipschitzSmoothWith ℝ K f)
    (hex : ∃ xstar, ∀ y, f xstar ≤ f y) (hη : ∀ n, 0 < η n)
    (hdiv : ¬ Summable η) (hsq : Summable fun n ↦ η n ^ 2) (hsgd : IsSGD ℱ P f η σ x g)
    (hx0 : x 0 = fun _ ↦ x₀) :
    ∀ᵐ ω ∂P, ∃ xstar, (∀ y, f xstar ≤ f y) ∧ Tendsto (fun n ↦ x n ω) atTop (𝓝 xstar) :=
  sorry

end Stochastic

/-! ## Layer 6: adaptive methods -/

/-- 6.1: summability of preconditioned squared gradients. -/
theorem preconditioned_sum_le {K : ℝ≥0} {f : E → ℝ} {m : ℝ} (hf : LipschitzSmoothWith ℝ K f)
    (hm : ∀ y, m ≤ f y) (P : E ≃L[ℝ] E) {p η : ℝ} (hp : 0 < p)
    (hP : ∀ v, p * ‖v‖ ^ 2 ≤ ⟪P v, v⟫) (hη : 0 < η) (hηK : η * K ≤ p) (x : ℕ → E)
    (hx : ∀ i, x (i + 1) = x i - η • P.symm (∇ f (x i))) (k : ℕ) :
    ∑ i ∈ Finset.range k, ⟪∇ f (x i), P.symm (∇ f (x i))⟫ ≤ 2 * (f (x 0) - m) / η :=
  sorry

/-- 6.2: AdaGrad-Norm on a smooth function bounded below has summable squared gradients for
every step size and initial accumulator. -/
theorem adaGradNorm_summable {K : ℝ≥0} {f : E → ℝ} {m η b₀ : ℝ} (hf : LipschitzSmoothWith ℝ K f)
    (hm : ∀ y, m ≤ f y) (hη : 0 < η) (hb₀ : 0 < b₀) (x : ℕ → E) (b : ℕ → ℝ) (hb0 : b 0 = b₀)
    (hb : ∀ k, b (k + 1) = √(b k ^ 2 + ‖∇ f (x k)‖ ^ 2))
    (hx : ∀ k, x (k + 1) = x k - (η / b (k + 1)) • ∇ f (x k)) :
    Summable fun k ↦ ‖∇ f (x k)‖ ^ 2 :=
  sorry

/-- The first moment of Adam: `m 0 = 0`, `m t = β₁ m (t-1) + (1 - β₁) g t`. -/
def adamFirstMoment {ι : Type*} (β₁ : ℝ) (g : ℕ → EuclideanSpace ℝ ι) : ℕ → EuclideanSpace ℝ ι
  | 0 => 0
  | t + 1 => β₁ • adamFirstMoment β₁ g t + (1 - β₁) • g (t + 1)

/-- The second moment of Adam: `v 0 = 0`, `v t = β₂ v (t-1) + (1 - β₂) g t²`, coordinatewise. -/
def adamSecondMoment {ι : Type*} (β₂ : ℝ) (g : ℕ → EuclideanSpace ℝ ι) : ℕ → ι → ℝ
  | 0 => 0
  | t + 1 => fun i ↦ β₂ * adamSecondMoment β₂ g t i + (1 - β₂) * g (t + 1) i ^ 2

/-- 6.3: the coordinatewise step bound of Adam with bias correction. -/
theorem adam_step_le {ι : Type*} {β₁ β₂ : ℝ} (hβ₁ : 0 ≤ β₁) (hβ₂ : β₂ < 1) (hβ : β₁ ^ 2 < β₂)
    (g : ℕ → EuclideanSpace ℝ ι) {t : ℕ} (ht : 1 ≤ t) (i : ι) :
    let r := β₁ ^ 2 / β₂
    |adamFirstMoment β₁ g t i / (1 - β₁ ^ t)| ≤
      (1 - β₁) / (1 - β₁ ^ t) * √((1 - β₂ ^ t) / (1 - β₂)) * √((1 - r ^ t) / (1 - r)) *
        √(adamSecondMoment β₂ g t i / (1 - β₂ ^ t)) :=
  sorry

/-- The Reddi–Kale–Kumar online losses `f_t x = C x` for `t % 3 = 1` and `-x` otherwise. -/
def reddiLoss (C : ℝ) (t : ℕ) (x : ℝ) : ℝ := if t % 3 = 1 then C * x else -x

/-- The gradient of `reddiLoss C t`. -/
def reddiGrad (C : ℝ) (t : ℕ) : ℝ := if t % 3 = 1 then C else -1

/-- 6.4: projected Adam with `β₁ = 0` returns to the worst point `1` every third step. The state
is `(x_t, v_{t-1})`, started at `(1, 0)` for `t = 1`. -/
theorem reddi_iterate {C α : ℝ} (hC : 2 < C) (hα : 0 < α) (hα' : α < √(1 - 1 / (1 + C ^ 2)))
    (x v : ℕ → ℝ) (hx1 : x 1 = 1) (hv0 : v 0 = 0)
    (hv : ∀ t, 1 ≤ t → v t = 1 / (1 + C ^ 2) * v (t - 1) +
      (1 - 1 / (1 + C ^ 2)) * reddiGrad C t ^ 2)
    (hx : ∀ t, 1 ≤ t →
      x (t + 1) = max (-1) (min 1 (x t - α / √t * reddiGrad C t / √(v t)))) :
    (∀ t, 1 ≤ t → 0 < x t ∧ x t ≤ 1) ∧ ∀ s, x (3 * s + 1) = 1 :=
  sorry

/-- 6.4: the regret of the Reddi–Kale–Kumar sequence against `-1` grows linearly. -/
theorem reddi_regret {C α : ℝ} (hC : 2 < C) (hα : 0 < α) (hα' : α < √(1 - 1 / (1 + C ^ 2)))
    (x v : ℕ → ℝ) (hx1 : x 1 = 1) (hv0 : v 0 = 0)
    (hv : ∀ t, 1 ≤ t → v t = 1 / (1 + C ^ 2) * v (t - 1) +
      (1 - 1 / (1 + C ^ 2)) * reddiGrad C t ^ 2)
    (hx : ∀ t, 1 ≤ t →
      x (t + 1) = max (-1) (min 1 (x t - α / √t * reddiGrad C t / √(v t)))) (n : ℕ) :
    (2 * C - 4) * n ≤
      ∑ t ∈ Finset.Icc 1 (3 * n), reddiLoss C t (x t) -
        ∑ t ∈ Finset.Icc 1 (3 * n), reddiLoss C t (-1) :=
  sorry

end TauCetiRoadmap.FirstOrderOptimization
