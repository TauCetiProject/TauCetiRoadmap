import Mathlib

/-!
# Universal approximation: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the
few definitions they need; every definition has a real body. Every headline theorem of the README
is statable at the pins and is stated here. The README's remaining targets, API lists and Checks
are not restated.

Inputs live in a real inner product space `E`, finite-dimensional only where the Fourier transform
is used (Layer 4). A one-hidden-layer network with `m` hidden units is a `ShallowNet E m`: inner
weights `wᵢ ∈ E`, hidden biases `bᵢ`, outer weights `cᵢ` and an output bias `c₀`; for an activation
`σ : ℝ → ℝ`, an arbitrary function, it realizes `x ↦ ∑ᵢ cᵢ σ(⟪wᵢ, x⟫ + bᵢ) + c₀`. Density means
uniform approximation on every compact set of every function continuous on it (`DenseOnCompacts`).
-/

noncomputable section

open MeasureTheory Filter Topology Polynomial
open scoped RealInnerProductSpace FourierTransform

namespace TauCetiRoadmap.UniversalApproximation

/-! ## Layer 1: one-hidden-layer networks and density on compact sets -/

/-- 1.1 A one-hidden-layer network on `E` with `m` hidden units: inner weights `weight i`, hidden
biases `bias i`, outer weights `coeff i` and an output bias `outBias`. -/
structure ShallowNet (E : Type*) (m : ℕ) where
  /-- The inner weight vector of hidden unit `i`. -/
  weight : Fin m → E
  /-- The bias of hidden unit `i`. -/
  bias : Fin m → ℝ
  /-- The outer weight of hidden unit `i`. -/
  coeff : Fin m → ℝ
  /-- The output bias. -/
  outBias : ℝ

namespace ShallowNet

variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E] {m : ℕ}

/-- 1.1 The function realized by a network with activation `σ`:
`x ↦ ∑ i, coeff i * σ (⟪weight i, x⟫ + bias i) + outBias`. -/
def eval (σ : ℝ → ℝ) (N : ShallowNet E m) (x : E) : ℝ :=
  ∑ i, N.coeff i * σ (⟪N.weight i, x⟫ + N.bias i) + N.outBias

end ShallowNet

/-- 1.1 The functions realized by one-hidden-layer networks with activation `σ`, of any width. -/
def shallowNetFunctions (σ : ℝ → ℝ) (E : Type*) [NormedAddCommGroup E]
    [InnerProductSpace ℝ E] : Set (E → ℝ) :=
  {f | ∃ (m : ℕ) (N : ShallowNet E m), N.eval σ = f}

/-- 1.2 A set `S` of real functions on `X` is dense on compact sets when every function continuous
on a compact set `K` is uniformly approximated on `K`, to every accuracy, by a member of `S`. -/
def DenseOnCompacts {X : Type*} [TopologicalSpace X] (S : Set (X → ℝ)) : Prop :=
  ∀ K : Set X, IsCompact K → ∀ f : X → ℝ, ContinuousOn f K → ∀ ε : ℝ, 0 < ε →
    ∃ g ∈ S, ∀ x ∈ K, |f x - g x| < ε

variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]

/-! ## Layer 2: ridge functions and the reduction to one variable -/

/-- 2.1 Ridge functions are dense: the linear span of the functions `x ↦ h ⟪a, x⟫`, with `a ∈ E`
and `h : ℝ → ℝ` continuous, is dense on compact sets of any real inner product space. -/
theorem denseOnCompacts_span_ridge :
    DenseOnCompacts ((Submodule.span ℝ
      {g : E → ℝ | ∃ (a : E) (h : ℝ → ℝ), Continuous h ∧ g = fun x => h ⟪a, x⟫}
        : Submodule ℝ (E → ℝ)) : Set (E → ℝ)) := by
  sorry

/-- 2.2 Reduction to one variable: if the univariate networks with activation `σ` are dense on
compact subsets of `ℝ`, then the networks with activation `σ` are dense on compact subsets of
`E`. No regularity of `σ` is assumed. -/
theorem denseOnCompacts_shallowNetFunctions_of_real {σ : ℝ → ℝ}
    (hσ : DenseOnCompacts (shallowNetFunctions σ ℝ)) :
    DenseOnCompacts (shallowNetFunctions σ E) := by
  sorry

/-! ## Layer 3: the theorem of Leshno, Lin, Pinkus and Schocken -/

/-- 3.4 Leshno–Lin–Pinkus–Schocken: for a continuous activation `σ` and a nonzero inner product
space `E`, one-hidden-layer networks are dense on compact sets if and only if `σ` is not a
polynomial function. -/
theorem denseOnCompacts_shallowNetFunctions_iff [Nontrivial E] {σ : ℝ → ℝ}
    (hσ : Continuous σ) :
    DenseOnCompacts (shallowNetFunctions σ E) ↔ ¬ ∃ p : ℝ[X], ∀ t, σ t = p.eval t := by
  sorry

/-- 3.5 Hornik's theorem: networks with a continuous, bounded, nonconstant activation are dense on
compact sets. Cybenko's continuous sigmoidal activations are a special case. -/
theorem denseOnCompacts_shallowNetFunctions_of_bounded {σ : ℝ → ℝ} (hσ : Continuous σ)
    (hb : ∃ M, ∀ t, |σ t| ≤ M) (hnc : ∃ s t, σ s ≠ σ t) :
    DenseOnCompacts (shallowNetFunctions σ E) := by
  sorry

/-! ## Layer 4: Maurey's lemma and Barron's theorem -/

/-- 4.1 Maurey's lemma: if `f` is a convex combination of points of `G`, all of norm at most `b`,
then for every `k ≥ 1` some average of `k` points of `G` (repetitions allowed) is within
`(b ^ 2 - ‖f‖ ^ 2) / k` of `f` in squared norm. -/
theorem maurey_convexHull {G : Set E} {b : ℝ} (hG : ∀ g ∈ G, ‖g‖ ≤ b) {f : E}
    (hf : f ∈ convexHull ℝ G) {k : ℕ} (hk : 0 < k) :
    ∃ g : Fin k → E, (∀ i, g i ∈ G) ∧
      ‖f - (k : ℝ)⁻¹ • ∑ i, g i‖ ^ 2 ≤ (b ^ 2 - ‖f‖ ^ 2) / k := by
  sorry

/-- 4.2 Maurey's lemma for the closed convex hull: if `f` lies in the closure of the convex hull of
`G`, all of whose points have norm at most `b`, then for every `k ≥ 1` and every
`c > b ^ 2 - ‖f‖ ^ 2` some average of `k` points of `G` is within `c / k` of `f` in squared
norm. -/
theorem maurey_closure_convexHull {G : Set E} {b : ℝ} (hG : ∀ g ∈ G, ‖g‖ ≤ b) {f : E}
    (hf : f ∈ closure (convexHull ℝ G)) {k : ℕ} (hk : 0 < k) {c : ℝ}
    (hc : b ^ 2 - ‖f‖ ^ 2 < c) :
    ∃ g : Fin k → E, (∀ i, g i ∈ G) ∧ ‖f - (k : ℝ)⁻¹ • ∑ i, g i‖ ^ 2 ≤ c / k := by
  sorry

/-- 4.3 A sigmoidal activation in Barron's sense: measurable, bounded, with limit `0` at `-∞` and
limit `1` at `+∞`. -/
def IsSigmoidal (σ : ℝ → ℝ) : Prop :=
  Measurable σ ∧ (∃ M, ∀ t, |σ t| ≤ M) ∧ Tendsto σ atBot (𝓝 0) ∧ Tendsto σ atTop (𝓝 1)

section Barron

variable [FiniteDimensional ℝ E] [MeasurableSpace E] [BorelSpace E]

/-- 4.4 The Barron norm `∫ 2π ‖ξ‖ ‖𝓕 f ξ‖ dξ` of a real function `f`, with Mathlib's Fourier
transform `𝓕 f ξ = ∫ exp(-2πi⟪x, ξ⟫) f x dx`; it is Barron's constant `∫ |ω| |f̃(ω)| dω` for the
unit ball. -/
def barronNorm (f : E → ℝ) : ℝ :=
  ∫ ξ, 2 * Real.pi * ‖ξ‖ * ‖𝓕 (fun x => (f x : ℂ)) ξ‖

/-- 4.5 Barron's theorem: let `f` be continuous and integrable, with `ξ ↦ ‖ξ‖ ‖𝓕 f ξ‖`
integrable. For every sigmoidal activation, every probability measure `μ` carried by the closed
ball of radius `r` about `0` and every `m ≥ 1`, some network with `m` hidden units approximates
`f` in `L²(μ)` with squared error at most `(2 r C) ^ 2 / m`, where `C` is the Barron norm of
`f`. -/
theorem exists_shallowNet_lintegral_sq_le {f : E → ℝ} (hf : Continuous f) (hfi : Integrable f)
    (hB : Integrable (fun ξ : E => ‖ξ‖ * ‖𝓕 (fun x => (f x : ℂ)) ξ‖))
    {σ : ℝ → ℝ} (hσ : IsSigmoidal σ) {r : ℝ} (μ : Measure E) [IsProbabilityMeasure μ]
    (hμ : μ (Metric.closedBall 0 r)ᶜ = 0) {m : ℕ} (hm : 0 < m) :
    ∃ N : ShallowNet E m,
      ∫⁻ x, ENNReal.ofReal ((f x - N.eval σ x) ^ 2) ∂μ ≤
        ENNReal.ofReal ((2 * r * barronNorm f) ^ 2 / m) := by
  sorry

end Barron

end TauCetiRoadmap.UniversalApproximation
