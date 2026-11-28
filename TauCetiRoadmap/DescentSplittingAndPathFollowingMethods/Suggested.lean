import Mathlib
import TauCeti.Analysis.Convex.Subdifferential
import TauCeti.Analysis.Convex.Conjugate

/-!
# Descent, splitting and path-following methods: suggested target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is `README.md`.
This file states the headlines of `README.md` that carry a Lean name, each with every conclusion
the README attaches to it, against the pinned Mathlib and Tau Ceti, with `sorry` proofs and the
definitions they need. These are suggested forms; the README's other headlines are targets of the
same standing, stated in prose.

Conventions (README, Conventions). Smooth methods live on a real Hilbert space with Mathlib's
`gradient` (notation `∇`) and Hessian `fderiv ℝ (∇ f)`; quasi-Newton runs live on
`EuclideanSpace ℝ ι` so that the matrix update of NewtonAndQuasiNewtonMethods applies. Methods
are predicates on sequences (`IsWolfeStep`, `IsTrustRegionRun`, `IsBFGSRun`,
`IsSpanFirstOrder`) or iterates of explicit maps (`pdhgSeq`, `pathFollowingSeq`). Weak
convergence is `WeakTendsto`, convergence in Mathlib's `WeakSpace ℝ E`. Monotone
operators are graphs `Γ : Set (E × E)`. Extended-valued functions take values in `EReal`, and
every EReal statement is an upper bound written with `+`, never with EReal subtraction.
Junk values: `x / 0 = 0`, `ContinuousLinearMap.inverse` is `0` off invertible maps, `√` is `0`
on negative reals, and `resolvent` and `prox` return their argument where no unique point
exists; every statement carries the hypothesis that keeps it off these values.

Local copies, each verbatim and inside a section with its owner's `variable` line where the
signature depends on it: `bfgsUpdate` (NewtonAndQuasiNewtonMethods 3.1), `ClosedProperConvex`
and `prox` (FirstOrderOptimization 3.2), `IsMonotoneSet` (ConvexAnalysisAndDuality 4.4), and
`logBarrier`, `strictFeasibleSet`, `SelfConcordantOn`, `newtonDecrement` and `newtonMap`
(InteriorPointMethods 1.1, 2.1, 3.5 and 4.1). The upstream theorems the README consumes are
named there, not restated here.

Five statements are proved here as checks rather than left as targets:
`IsStrongWolfeStep.isWolfeStep`, `trModel_le_of_isMinOn`, `resolvent_mem`,
`not_isSelfConcordantBarrier_id` and `newtonDecrement_eq_dualLocalNorm`.
-/

noncomputable section

open Filter Topology Set TauCeti
open scoped NNReal InnerProductSpace RealInnerProductSpace Gradient ContDiff

namespace TauCetiRoadmap.DescentSplittingAndPathFollowingMethods

/-! ## Hilbert-space methods: Layers 1, 2 and 5–7 -/

section Hilbert

variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E] [CompleteSpace E]

/-- Weak convergence: `x n → z` in Mathlib's weak topology `WeakSpace ℝ E`. In a Hilbert space
this is the convergence of every pairing `⟪y, x n⟫` to `⟪y, z⟫` (Riesz). -/
def WeakTendsto (x : ℕ → E) (z : E) : Prop :=
  Tendsto (fun n => toWeakSpace ℝ E (x n)) atTop (𝓝 (toWeakSpace ℝ E z))

/-! ### Layer 1: line searches -/

/-- 1.1 The step `α` along `p` from `x` satisfies the Wolfe conditions with constants `c₁, c₂`:
`α > 0`, sufficient decrease and the curvature condition (Nocedal–Wright (3.6)). -/
def IsWolfeStep (f : E → ℝ) (c₁ c₂ : ℝ) (x p : E) (α : ℝ) : Prop :=
  0 < α ∧ f (x + α • p) ≤ f x + c₁ * α * ⟪∇ f x, p⟫ ∧
    c₂ * ⟪∇ f x, p⟫ ≤ ⟪∇ f (x + α • p), p⟫

/-- 1.1 The strong Wolfe conditions (Nocedal–Wright (3.7)). -/
def IsStrongWolfeStep (f : E → ℝ) (c₁ c₂ : ℝ) (x p : E) (α : ℝ) : Prop :=
  0 < α ∧ f (x + α • p) ≤ f x + c₁ * α * ⟪∇ f x, p⟫ ∧
    |⟪∇ f (x + α • p), p⟫| ≤ c₂ * |⟪∇ f x, p⟫|

/-- 1.1 Check: along a descent direction a strong Wolfe step is a Wolfe step. -/
theorem IsStrongWolfeStep.isWolfeStep {f : E → ℝ} {c₁ c₂ : ℝ} {x p : E} {α : ℝ}
    (h : IsStrongWolfeStep f c₁ c₂ x p α) (hp : ⟪∇ f x, p⟫ < 0) : IsWolfeStep f c₁ c₂ x p α := by
  obtain ⟨h0, h1, h2⟩ := h
  refine ⟨h0, h1, ?_⟩
  rw [abs_of_neg hp] at h2
  have := neg_abs_le ⟪∇ f (x + α • p), p⟫
  linarith

/-- 1.1 Existence of an interval of strong Wolfe steps (Nocedal–Wright, Lemma 3.1). -/
theorem exists_Ioo_isStrongWolfeStep {f : E → ℝ} {c₁ c₂ : ℝ} {x p : E}
    (hf : ContDiff ℝ 1 f) (hp : ⟪∇ f x, p⟫ < 0)
    (hbdd : BddBelow ((fun α : ℝ => f (x + α • p)) '' Ioi 0))
    (hc₁ : 0 < c₁) (hc₁₂ : c₁ < c₂) (hc₂ : c₂ < 1) :
    ∃ a b : ℝ, 0 < a ∧ a < b ∧ ∀ α ∈ Ioo a b, IsStrongWolfeStep f c₁ c₂ x p α := by
  sorry

/-- 1.2 Zoutendijk's theorem (Nocedal–Wright, Theorem 3.2): along Wolfe steps in descent
directions, with `f` bounded below and `∇ f` Lipschitz on an open set containing the initial
sublevel set, `∑ ⟪∇ f (x k), p k⟫² / ‖p k‖² < ∞`. The source's `c₁ < c₂` is not used. -/
theorem summable_zoutendijk {f : E → ℝ} {c₁ c₂ : ℝ} {x p : ℕ → E} {α : ℕ → ℝ} {N : Set E}
    {L : ℝ≥0} (hc₁ : 0 < c₁) (hc₂ : c₂ < 1) (hbdd : BddBelow (range f))
    (hN : IsOpen N) (hsub : {y | f y ≤ f (x 0)} ⊆ N) (hdiff : DifferentiableOn ℝ f N)
    (hlip : LipschitzOnWith L (∇ f) N) (hp : ∀ k, ⟪∇ f (x k), p k⟫ < 0)
    (hα : ∀ k, IsWolfeStep f c₁ c₂ (x k) (p k) (α k))
    (hx : ∀ k, x (k + 1) = x k + α k • p k) :
    Summable fun k => ⟪∇ f (x k), p k⟫ ^ 2 / ‖p k‖ ^ 2 := by
  sorry

/-- 1.2 Directions bounded away from orthogonality (Nocedal–Wright (3.17)–(3.18)): under the
hypotheses of 1.2, if `δ ‖∇ f (x k)‖ ‖p k‖ ≤ -⟪∇ f (x k), p k⟫` with `δ > 0`, then
`∇ f (x k) → 0`. -/
theorem tendsto_gradient_of_angle {f : E → ℝ} {c₁ c₂ δ : ℝ} {x p : ℕ → E} {α : ℕ → ℝ}
    {N : Set E} {L : ℝ≥0} (hc₁ : 0 < c₁) (hc₂ : c₂ < 1)
    (hbdd : BddBelow (range f)) (hN : IsOpen N) (hsub : {y | f y ≤ f (x 0)} ⊆ N)
    (hdiff : DifferentiableOn ℝ f N) (hlip : LipschitzOnWith L (∇ f) N)
    (hp : ∀ k, ⟪∇ f (x k), p k⟫ < 0) (hα : ∀ k, IsWolfeStep f c₁ c₂ (x k) (p k) (α k))
    (hx : ∀ k, x (k + 1) = x k + α k • p k) (hδ : 0 < δ)
    (hangle : ∀ k, δ * ‖∇ f (x k)‖ * ‖p k‖ ≤ -⟪∇ f (x k), p k⟫) :
    Tendsto (fun k => ∇ f (x k)) atTop (𝓝 0) := by
  sorry

/-- 1.2 The angle of a quasi-Newton direction (Nocedal–Wright (3.19)): if `B p = -g` and
`m ‖v‖² ≤ ⟪B v, v⟫` with `m ≥ 0`, then `(m / ‖B‖) ‖g‖ ‖p‖ ≤ -⟪g, p⟫`. -/
theorem div_opNorm_mul_le_neg_inner {B : E →L[ℝ] E} {g p : E} {m : ℝ} (hm : 0 ≤ m)
    (hBm : ∀ v, m * ‖v‖ ^ 2 ≤ ⟪B v, v⟫) (hBp : B p = -g) :
    m / ‖B‖ * ‖g‖ * ‖p‖ ≤ -⟪g, p⟫ := by
  sorry

/-! ### Layer 2: trust regions -/

/-- 2.1 The quadratic model `m(p) = ⟪g, p⟫ + ⟪p, B p⟫ / 2` (Nocedal–Wright (4.2), without the
constant term). -/
def trModel (g : E) (B : E →L[ℝ] E) (p : E) : ℝ :=
  ⟪g, p⟫ + ⟪p, B p⟫ / 2

/-- 2.1 The Cauchy point (Nocedal–Wright (4.11)–(4.12)); it is `0` at `g = 0`. -/
def cauchyPoint (g : E) (B : E →L[ℝ] E) (Δ : ℝ) : E :=
  if ⟪g, B g⟫ ≤ 0 then -(Δ / ‖g‖) • g
  else -(min (‖g‖ ^ 3 / (Δ * ⟪g, B g⟫)) 1 * (Δ / ‖g‖)) • g

/-- 2.1 The Cauchy decrease `‖g‖ / 2 · min(Δ, ‖g‖ / ‖B‖)`, read as `‖g‖ Δ / 2` at `B = 0`. -/
def cauchyBound (g : E) (B : E →L[ℝ] E) (Δ : ℝ) : ℝ :=
  ‖g‖ / 2 * (if ‖B‖ = 0 then Δ else min Δ (‖g‖ / ‖B‖))

/-- 2.1 Cauchy decrease (Nocedal–Wright, Lemma 4.3): the Cauchy point lies in the trust region
and decreases the model by at least `cauchyBound`. -/
theorem trModel_cauchyPoint_le (g : E) (B : E →L[ℝ] E) {Δ : ℝ} (hΔ : 0 < Δ) :
    trModel g B (cauchyPoint g B Δ) ≤ -cauchyBound g B Δ ∧ ‖cauchyPoint g B Δ‖ ≤ Δ := by
  sorry

/-- 2.1 Check: an exact minimizer of the model over the trust region decreases it by at least
`cauchyBound`, so it satisfies (4.20) with `c₁ = 1`. -/
theorem trModel_le_of_isMinOn {g : E} {B : E →L[ℝ] E} {Δ : ℝ} {p : E} (hΔ : 0 < Δ)
    (hp : IsMinOn (trModel g B) (Metric.closedBall 0 Δ) p) :
    trModel g B p ≤ -cauchyBound g B Δ :=
  (hp (mem_closedBall_zero_iff.2 (trModel_cauchyPoint_le g B hΔ).2)).trans
    (trModel_cauchyPoint_le g B hΔ).1

/-- 2.2 The ratio of actual to predicted reduction (Nocedal–Wright (4.4)). -/
def trRatio (f : E → ℝ) (B : E →L[ℝ] E) (x p : E) : ℝ :=
  (f x - f (x + p)) / -trModel (∇ f x) B p

/-- 2.2 A run of the trust-region method (Nocedal–Wright, Algorithm 4.1) with acceptance
threshold `η`, radius bound `Δmax`, steps of length at most `γ Δ k` and model decrease at least
`c₁` times the Cauchy decrease (Nocedal–Wright (4.20)). -/
structure IsTrustRegionRun (f : E → ℝ) (B : ℕ → E →L[ℝ] E) (Δmax η c₁ γ : ℝ)
    (x p : ℕ → E) (Δ : ℕ → ℝ) : Prop where
  radius_pos : 0 < Δ 0
  radius_le : Δ 0 ≤ Δmax
  norm_step_le : ∀ k, ‖p k‖ ≤ γ * Δ k
  model_decrease : ∀ k,
    trModel (∇ f (x k)) (B k) (p k) ≤ -(c₁ * cauchyBound (∇ f (x k)) (B k) (Δ k))
  accept : ∀ k, η < trRatio f (B k) (x k) (p k) → x (k + 1) = x k + p k
  reject : ∀ k, trRatio f (B k) (x k) (p k) ≤ η → x (k + 1) = x k
  shrink : ∀ k, trRatio f (B k) (x k) (p k) < 1 / 4 → Δ (k + 1) = Δ k / 4
  expand : ∀ k, 3 / 4 < trRatio f (B k) (x k) (p k) → ‖p k‖ = Δ k →
    Δ (k + 1) = min (2 * Δ k) Δmax
  keep : ∀ k, 1 / 4 ≤ trRatio f (B k) (x k) (p k) →
    ¬ (3 / 4 < trRatio f (B k) (x k) (p k) ∧ ‖p k‖ = Δ k) → Δ (k + 1) = Δ k

/-- 2.2 Global convergence with `η = 0` (Nocedal–Wright, Theorem 4.5): `liminf ‖∇ f (x k)‖ = 0`. -/
theorem IsTrustRegionRun.frequently_norm_gradient_lt {f : E → ℝ} {B : ℕ → E →L[ℝ] E}
    {Δmax c₁ γ β R₀ : ℝ} {K : ℝ≥0} {x p : ℕ → E} {Δ : ℕ → ℝ}
    (hrun : IsTrustRegionRun f B Δmax 0 c₁ γ x p Δ) (hc₁ : 0 < c₁) (hB : ∀ k, ‖B k‖ ≤ β)
    (hbdd : BddBelow (f '' {y | f y ≤ f (x 0)})) (hR₀ : 0 < R₀)
    (hdiff : DifferentiableOn ℝ f (Metric.thickening R₀ {y | f y ≤ f (x 0)}))
    (hlip : LipschitzOnWith K (∇ f) (Metric.thickening R₀ {y | f y ≤ f (x 0)}))
    (hg : ∀ k, ∇ f (x k) ≠ 0) :
    ∀ ε > 0, ∃ᶠ k in atTop, ‖∇ f (x k)‖ < ε := by
  sorry

/-- 2.2 Global convergence with `0 < η < 1/4` (Nocedal–Wright, Theorem 4.6): `∇ f (x k) → 0`. -/
theorem IsTrustRegionRun.tendsto_norm_gradient {f : E → ℝ} {B : ℕ → E →L[ℝ] E}
    {Δmax η c₁ γ β R₀ : ℝ} {K : ℝ≥0} {x p : ℕ → E} {Δ : ℕ → ℝ}
    (hrun : IsTrustRegionRun f B Δmax η c₁ γ x p Δ) (hη : 0 < η) (hη' : η < 1 / 4)
    (hc₁ : 0 < c₁) (hB : ∀ k, ‖B k‖ ≤ β) (hbdd : BddBelow (f '' {y | f y ≤ f (x 0)}))
    (hR₀ : 0 < R₀) (hdiff : DifferentiableOn ℝ f (Metric.thickening R₀ {y | f y ≤ f (x 0)}))
    (hlip : LipschitzOnWith K (∇ f) (Metric.thickening R₀ {y | f y ≤ f (x 0)}))
    (hg : ∀ k, ∇ f (x k) ≠ 0) :
    Tendsto (fun k => ‖∇ f (x k)‖) atTop (𝓝 0) := by
  sorry

/-! ### Layer 3, first part: the unit step -/

/-- 3.1 The unit step near a nondegenerate minimizer (Nocedal–Wright, Theorem 3.6, with
`c₁ < 1/2`): if `x k → x⋆`, `∇ f x⋆ = 0`, the Hessian at `x⋆` is positive definite and the
directions satisfy (3.35), then the unit step is eventually a Wolfe step, and if the step is
eventually `1` the convergence is superlinear. -/
theorem eventually_isWolfeStep_one_and_superlinear [FiniteDimensional ℝ E] {f : E → ℝ}
    {c₁ c₂ : ℝ} {x p : ℕ → E} {α : ℕ → ℝ} {xs : E} (hc₁ : c₁ < 1 / 2) (hc₂ : 0 < c₂)
    (hf : ContDiff ℝ 2 f) (hp : ∀ k, p k ≠ 0) (hx : ∀ k, x (k + 1) = x k + α k • p k)
    (hlim : Tendsto x atTop (𝓝 xs)) (hg : ∇ f xs = 0)
    (hpd : ∀ v, v ≠ 0 → 0 < ⟪fderiv ℝ (∇ f) xs v, v⟫)
    (hdir : Tendsto (fun k => ‖∇ f (x k) + fderiv ℝ (∇ f) (x k) (p k)‖ / ‖p k‖) atTop (𝓝 0)) :
    (∀ᶠ k in atTop, IsWolfeStep f c₁ c₂ (x k) (p k) 1) ∧
      ((∀ᶠ k in atTop, α k = 1) →
        Tendsto (fun k => ‖x (k + 1) - xs‖ / ‖x k - xs‖) atTop (𝓝 0)) := by
  sorry

/-! ### Layer 4, the span condition (used on `EuclideanSpace` and on `ℓ²`) -/

/-- 4.1 Nesterov's span condition (Assumption 2.1.4): `x k - x 0` lies in the span of the
gradients at `x 0, …, x (k - 1)`. -/
def IsSpanFirstOrder (f : E → ℝ) (x : ℕ → E) : Prop :=
  ∀ k, x k - x 0 ∈ Submodule.span ℝ ((fun i => ∇ f (x i)) '' Iio k)

/-! ### Layer 5: monotone operators and resolvents -/

/-- A set `Γ ⊆ E × F` is monotone for the pairing `B` when `0 ≤ B (x₁ - x₂) (y₁ - y₂)` for any
two of its points. Copied verbatim from ConvexAnalysisAndDuality 4.4. -/
def IsMonotoneSet {E F : Type*} [AddCommGroup E] [Module ℝ E] [AddCommGroup F] [Module ℝ F]
    (B : E →ₗ[ℝ] F →ₗ[ℝ] ℝ) (Γ : Set (E × F)) : Prop :=
  ∀ p ∈ Γ, ∀ q ∈ Γ, 0 ≤ B (p.1 - q.1) (p.2 - q.2)

/-- 5.1 `T` is firmly nonexpansive on `D` (Bauschke–Combettes, Definition 4.1(i)). -/
def FirmlyNonexpansiveOn (T : E → E) (D : Set E) : Prop :=
  ∀ x ∈ D, ∀ y ∈ D, ‖T x - T y‖ ^ 2 + ‖(x - T x) - (y - T y)‖ ^ 2 ≤ ‖x - y‖ ^ 2

/-- 5.1 Characterizations of firm nonexpansiveness (Bauschke–Combettes, Proposition 4.4
(i)–(v)). -/
theorem firmlyNonexpansiveOn_tfae (T : E → E) (D : Set E) :
    List.TFAE [FirmlyNonexpansiveOn T D, FirmlyNonexpansiveOn (fun x => x - T x) D,
      LipschitzOnWith 1 (fun x => (2 : ℝ) • T x - x) D,
      ∀ x ∈ D, ∀ y ∈ D, ‖T x - T y‖ ^ 2 ≤ ⟪x - y, T x - T y⟫,
      ∀ x ∈ D, ∀ y ∈ D, 0 ≤ ⟪T x - T y, (x - T x) - (y - T y)⟫] := by
  sorry

/-- 5.2 The resolvent `J_{γΓ} z`: the unique `x` with `(x, γ⁻¹ (z - x)) ∈ Γ` when there is one,
and `z` otherwise (Bauschke–Combettes, Proposition 23.2(ii)). -/
def resolvent (Γ : Set (E × E)) (γ : ℝ) (z : E) : E := by
  classical
  exact if h : ∃! x, (x, γ⁻¹ • (z - x)) ∈ Γ then h.choose else z

omit [CompleteSpace E] in
/-- 5.2 Check: where the defining point is unique, the resolvent is that point. -/
theorem resolvent_mem {Γ : Set (E × E)} {γ : ℝ} {z : E} (h : ∃! x, (x, γ⁻¹ • (z - x)) ∈ Γ) :
    (resolvent Γ γ z, γ⁻¹ • (z - resolvent Γ γ z)) ∈ Γ := by
  rw [resolvent]
  split_ifs
  exact h.choose_spec.1

/-- 5.2 Minty's theorem (Bauschke–Combettes, Theorem 21.1): a monotone set is maximal if and
only if `ran (Id + Γ) = E`. -/
theorem maximal_isMonotoneSet_iff {Γ : Set (E × E)} (hΓ : IsMonotoneSet (innerₗ E) Γ) :
    Maximal (IsMonotoneSet (innerₗ E)) Γ ↔ ∀ z, ∃ x, (x, z - x) ∈ Γ := by
  sorry

/-- 5.2 Resolvents of maximal monotone sets (Bauschke–Combettes, Corollary 23.11(i)): for
`γ > 0` the defining point exists and is unique for every `z`, and `J_{γΓ}` is firmly
nonexpansive on `E`. -/
theorem resolvent_spec {Γ : Set (E × E)} (hΓ : Maximal (IsMonotoneSet (innerₗ E)) Γ) {γ : ℝ}
    (hγ : 0 < γ) :
    (∀ z, ∃! x, (x, γ⁻¹ • (z - x)) ∈ Γ) ∧ FirmlyNonexpansiveOn (resolvent Γ γ) univ := by
  sorry

/-- 5.2 Every firmly nonexpansive map of `E` is a resolvent (Bauschke–Combettes,
Proposition 23.8 and Corollary 23.9): the graph `{(T z, z - T z)}` is maximal monotone and its
resolvent at `γ = 1` is `T`. -/
theorem maximal_graph_resolvent_eq {T : E → E} (hT : FirmlyNonexpansiveOn T univ) :
    Maximal (IsMonotoneSet (innerₗ E)) (range fun z => (T z, z - T z)) ∧
      resolvent (range fun z => (T z, z - T z)) 1 = T := by
  sorry

/-- `g : E → EReal` is closed proper convex, in the convention of Tau Ceti's Fenchel–Moreau
theorem. Copied verbatim from FirstOrderOptimization 3.2. -/
structure ClosedProperConvex (g : E → EReal) : Prop where
  convex_epigraph : Convex ℝ {p : E × ℝ | g p.1 ≤ p.2}
  lowerSemicontinuous : LowerSemicontinuous g
  ne_bot : ∀ x, g x ≠ ⊥
  exists_ne_top : ∃ x, g x ≠ ⊤

/-- The proximal map: the unique minimizer of `u ↦ g u + ‖u - x‖² / (2η)` when it exists, and `x`
otherwise. Copied verbatim from FirstOrderOptimization 3.2. -/
def prox (g : E → EReal) (η : ℝ) (x : E) : E := by
  classical
  exact if h : ∃! p, ∀ u, g p + ((‖p - x‖ ^ 2 / (2 * η) : ℝ) : EReal) ≤
      g u + ((‖u - x‖ ^ 2 / (2 * η) : ℝ) : EReal) then h.choose else x

/-- 5.2 The resolvent of a subdifferential is the proximal map (Bauschke–Combettes,
Example 23.3). -/
theorem resolvent_subdifferential_eq_prox {g : E → EReal} (hg : ClosedProperConvex g) {η : ℝ}
    (hη : 0 < η) :
    resolvent {p : E × E | p.2 ∈ subdifferential (innerₗ E) g p.1} η = prox g η := by
  sorry

/-! ### Layer 6: fixed-point and splitting iterations -/

/-- 6.1 Fejér monotone sequences (Bauschke–Combettes, Theorem 5.5): a sequence Fejér monotone
with respect to a nonempty `C` whose weak sequential cluster points lie in `C` converges weakly
to a point of `C`. -/
theorem exists_weakTendsto_of_fejer {C : Set E} (hC : C.Nonempty) {x : ℕ → E}
    (hfej : ∀ c ∈ C, ∀ n, ‖x (n + 1) - c‖ ≤ ‖x n - c‖)
    (hclu : ∀ (φ : ℕ → ℕ) (z : E), StrictMono φ → WeakTendsto (x ∘ φ) z → z ∈ C) :
    ∃ z ∈ C, WeakTendsto x z := by
  sorry

/-- 6.2 The Krasnosel'skiĭ–Mann iteration (Bauschke–Combettes, Theorem 5.15): Fejér
monotonicity with respect to the fixed points, `T x n - x n → 0`, and weak convergence to a fixed
point. -/
theorem krasnoselskiiMann {D : Set E} (hD : IsClosed D) (hDc : Convex ℝ D) {T : E → E}
    (hTD : MapsTo T D D) (hT : LipschitzOnWith 1 T D) (hfix : ∃ y ∈ D, T y = y) {θ : ℕ → ℝ}
    (hθ : ∀ n, θ n ∈ Icc (0 : ℝ) 1) (hdiv : ¬ Summable fun n => θ n * (1 - θ n)) {x : ℕ → E}
    (hx0 : x 0 ∈ D) (hx : ∀ n, x (n + 1) = x n + θ n • (T (x n) - x n)) :
    (∀ y ∈ D, T y = y → ∀ n, ‖x (n + 1) - y‖ ≤ ‖x n - y‖) ∧
      Tendsto (fun n => T (x n) - x n) atTop (𝓝 0) ∧ ∃ z ∈ D, T z = z ∧ WeakTendsto x z := by
  sorry

/-- 6.2 The proximal-point algorithm (Bauschke–Combettes, Theorem 23.41(i)): with `∑ γ n² = ∞`
the iterates converge weakly to a zero. -/
theorem proximalPoint_weakTendsto {Γ : Set (E × E)} (hΓ : Maximal (IsMonotoneSet (innerₗ E)) Γ)
    (hzer : ∃ z, (z, (0 : E)) ∈ Γ) {γ : ℕ → ℝ} (hγ : ∀ n, 0 < γ n)
    (hdiv : ¬ Summable fun n => γ n ^ 2) {x : ℕ → E}
    (hx : ∀ n, x (n + 1) = resolvent Γ (γ n) (x n)) :
    ∃ z, (z, (0 : E)) ∈ Γ ∧ WeakTendsto x z := by
  sorry

/-- 6.2 The relaxed forward–backward algorithm for `0 ∈ Γ x + C x` with `C` `β`-cocoercive
(Bauschke–Combettes, Theorem 26.14(i)–(ii)). -/
theorem forwardBackward_weakTendsto {Γ : Set (E × E)}
    (hΓ : Maximal (IsMonotoneSet (innerₗ E)) Γ) {C : E → E} {β : ℝ} (hβ : 0 < β)
    (hC : ∀ u v, β * ‖C u - C v‖ ^ 2 ≤ ⟪u - v, C u - C v⟫) {γ : ℝ} (hγ : 0 < γ)
    (hγβ : γ < 2 * β) {θ : ℕ → ℝ} (hθ : ∀ n, θ n ∈ Icc (0 : ℝ) (2 - γ / (2 * β)))
    (hdiv : ¬ Summable fun n => θ n * (2 - γ / (2 * β) - θ n)) (hzer : ∃ z, (z, -C z) ∈ Γ)
    {x : ℕ → E} (hx : ∀ n, x (n + 1) = x n + θ n • (resolvent Γ γ (x n - γ • C (x n)) - x n)) :
    (∃ z, (z, -C z) ∈ Γ ∧ WeakTendsto x z) ∧
      ∀ z, (z, -C z) ∈ Γ → Tendsto (fun n => C (x n)) atTop (𝓝 (C z)) := by
  sorry

/-- 6.2 The Douglas–Rachford algorithm for `0 ∈ A x + B x` (Bauschke–Combettes,
Theorem 26.11(i)–(iii)): the governing sequence converges weakly to some `ȳ`, `J_{γB} ȳ` is a
zero of `A + B`, the two shadow sequences approach each other, and `J_{γB} y n ⇀ J_{γB} ȳ`. -/
theorem douglasRachford_weakTendsto {ΓA ΓB : Set (E × E)}
    (hA : Maximal (IsMonotoneSet (innerₗ E)) ΓA) (hB : Maximal (IsMonotoneSet (innerₗ E)) ΓB)
    (hzer : ∃ x u, (x, -u) ∈ ΓA ∧ (x, u) ∈ ΓB) {γ : ℝ} (hγ : 0 < γ) {θ : ℕ → ℝ}
    (hθ : ∀ n, θ n ∈ Icc (0 : ℝ) 2) (hdiv : ¬ Summable fun n => θ n * (2 - θ n)) {y : ℕ → E}
    (hy : ∀ n, y (n + 1) = y n + θ n • (resolvent ΓA γ ((2 : ℝ) • resolvent ΓB γ (y n) - y n) -
      resolvent ΓB γ (y n))) :
    ∃ ybar, WeakTendsto y ybar ∧
      (∃ u, (resolvent ΓB γ ybar, -u) ∈ ΓA ∧ (resolvent ΓB γ ybar, u) ∈ ΓB) ∧
      Tendsto (fun n => resolvent ΓB γ (y n) -
        resolvent ΓA γ ((2 : ℝ) • resolvent ΓB γ (y n) - y n)) atTop (𝓝 0) ∧
      WeakTendsto (fun n => resolvent ΓB γ (y n)) (resolvent ΓB γ ybar) := by
  sorry

end Hilbert

/-! ### Layer 7: the primal–dual hybrid gradient method -/

section PrimalDual

variable {X Y : Type*} [NormedAddCommGroup X] [InnerProductSpace ℝ X] [CompleteSpace X]
  [NormedAddCommGroup Y] [InnerProductSpace ℝ Y] [CompleteSpace Y]

/-- Layer 7: the saddle function `L(x, y) = ⟪y, K x⟫ + g x - f⋆ y` (Chambolle–Pock (3.12)), with
`f⋆` Tau Ceti's `fenchelConjugate` for the inner product of `Y`. -/
def saddleLagrangian (K : X →L[ℝ] Y) (f : Y → EReal) (g : X → EReal) (x : X) (y : Y) : EReal :=
  ((⟪y, K x⟫ : ℝ) : EReal) + g x + -fenchelConjugate (innerₗ Y) f y

/-- Layer 7: `(x, y)` is a saddle point of `saddleLagrangian`. -/
def IsSaddlePoint (K : X →L[ℝ] Y) (f : Y → EReal) (g : X → EReal) (x : X) (y : Y) : Prop :=
  ∀ x' y', saddleLagrangian K f g x y' ≤ saddleLagrangian K f g x y ∧
    saddleLagrangian K f g x y ≤ saddleLagrangian K f g x' y

/-- Layer 7: one step of PDHG (Chambolle–Pock, Algorithm 6). -/
def pdhgStep (K : X →L[ℝ] Y) (f : Y → EReal) (g : X → EReal) (τ σ : ℝ) (z : X × Y) : X × Y :=
  let x' := prox g τ (z.1 - τ • ContinuousLinearMap.adjoint K z.2)
  (x', prox (fenchelConjugate (innerₗ Y) f) σ (z.2 + σ • K ((2 : ℝ) • x' - z.1)))

/-- Layer 7: the PDHG iterates from `z₀`. -/
def pdhgSeq (K : X →L[ℝ] Y) (f : Y → EReal) (g : X → EReal) (τ σ : ℝ) (z₀ : X × Y) (k : ℕ) :
    X × Y :=
  (pdhgStep K f g τ σ)^[k] z₀

/-- Layer 7: the ergodic gap bound (Chambolle–Pock, Theorem 5.1 with `h = 0`): with
`τ σ ‖K‖² ≤ 1`, for `x ∈ dom g`, `y ∈ dom f⋆` and the averages of iterates `1, …, k`,
`L(X̄ₖ, y) ≤ L(x, Ȳₖ) + (‖x - x⁰‖²/τ + ‖y - y⁰‖²/σ) / k`. -/
theorem pdhg_gap_le {K : X →L[ℝ] Y} {f : Y → EReal} {g : X → EReal} {τ σ : ℝ}
    (hf : ClosedProperConvex f) (hg : ClosedProperConvex g) (hτ : 0 < τ) (hσ : 0 < σ)
    (hK : τ * σ * ‖K‖ ^ 2 ≤ 1) (z₀ : X × Y) {k : ℕ} (hk : 0 < k) {x : X} (hx : g x ≠ ⊤)
    {y : Y} (hy : fenchelConjugate (innerₗ Y) f y ≠ ⊤) :
    saddleLagrangian K f g ((k : ℝ)⁻¹ • ∑ i ∈ Finset.Icc 1 k, (pdhgSeq K f g τ σ z₀ i).1) y ≤
      saddleLagrangian K f g x ((k : ℝ)⁻¹ • ∑ i ∈ Finset.Icc 1 k, (pdhgSeq K f g τ σ z₀ i).2) +
        (((‖x - z₀.1‖ ^ 2 / τ + ‖y - z₀.2‖ ^ 2 / σ) / k : ℝ) : EReal) := by
  sorry

/-- Layer 7: weak convergence of PDHG (Chambolle–Pock, Theorem 5.1, last sentence): with
`τ σ ‖K‖² < 1` and a saddle point, the iterates converge weakly to a saddle point. -/
theorem pdhg_weakTendsto {K : X →L[ℝ] Y} {f : Y → EReal} {g : X → EReal} {τ σ : ℝ}
    (hf : ClosedProperConvex f) (hg : ClosedProperConvex g) (hτ : 0 < τ) (hσ : 0 < σ)
    (hK : τ * σ * ‖K‖ ^ 2 < 1) (hsad : ∃ p : X × Y, IsSaddlePoint K f g p.1 p.2)
    (z₀ : X × Y) :
    ∃ p : X × Y, IsSaddlePoint K f g p.1 p.2 ∧
      WeakTendsto (fun k => (pdhgSeq K f g τ σ z₀ k).1) p.1 ∧
      WeakTendsto (fun k => (pdhgSeq K f g τ σ z₀ k).2) p.2 := by
  sorry

end PrimalDual

/-! ## Layer 3, second part: BFGS with a Wolfe line search -/

section Updates

open Matrix

variable {ι : Type*} [Fintype ι] [DecidableEq ι]

/-- The BFGS update of a Hessian approximation `B` along a step `s` with gradient change `y`:
`B - B s sᵀ B / (sᵀ B s) + y yᵀ / (yᵀ s)`. Copied verbatim, with its `variable` line, from
NewtonAndQuasiNewtonMethods 3.1. -/
def bfgsUpdate (B : Matrix ι ι ℝ) (s y : ι → ℝ) : Matrix ι ι ℝ :=
  B - (s ⬝ᵥ (B *ᵥ s))⁻¹ • vecMulVec (B *ᵥ s) (s ᵥ* B) + (y ⬝ᵥ s)⁻¹ • vecMulVec y y

end Updates

section BFGS

open Matrix

variable {ι : Type*} [Fintype ι] [DecidableEq ι]

/-- 3.2 The quasi-Newton direction `-B⁻¹ g` on `EuclideanSpace ℝ ι`. -/
def bfgsDirection (B : Matrix ι ι ℝ) (g : EuclideanSpace ℝ ι) : EuclideanSpace ℝ ι :=
  WithLp.toLp 2 (-(B⁻¹ *ᵥ g.ofLp))

/-- 3.2 A run of BFGS with a Wolfe line search (Nocedal–Wright, Algorithm 6.1): `B 0` is
positive definite, every step is a Wolfe step along `-(B k)⁻¹ ∇ f (x k)`, and `B (k + 1)` is the
BFGS update along `s = x (k + 1) - x k` and `y = ∇ f (x (k + 1)) - ∇ f (x k)`. Positive
definiteness is Mathlib's `Matrix.PosDef`. -/
structure IsBFGSRun (f : EuclideanSpace ℝ ι → ℝ) (c₁ c₂ : ℝ) (x : ℕ → EuclideanSpace ℝ ι)
    (B : ℕ → Matrix ι ι ℝ) (α : ℕ → ℝ) : Prop where
  posDef_zero : (B 0).PosDef
  wolfe : ∀ k, IsWolfeStep f c₁ c₂ (x k) (bfgsDirection (B k) (∇ f (x k))) (α k)
  step : ∀ k, x (k + 1) = x k + α k • bfgsDirection (B k) (∇ f (x k))
  update : ∀ k, B (k + 1) =
    bfgsUpdate (B k) (x (k + 1) - x k).ofLp (∇ f (x (k + 1)) - ∇ f (x k)).ofLp

/-- 3.2 The run is well defined (Nocedal–Wright §6.1, from NewtonAndQuasiNewtonMethods 3.2):
while the gradient does not vanish, every `B k` is positive definite and `sₖ ⬝ᵥ yₖ > 0`. -/
theorem IsBFGSRun.posDef {f : EuclideanSpace ℝ ι → ℝ} {c₁ c₂ : ℝ}
    {x : ℕ → EuclideanSpace ℝ ι} {B : ℕ → Matrix ι ι ℝ} {α : ℕ → ℝ}
    (hrun : IsBFGSRun f c₁ c₂ x B α) (hc₂ : c₂ < 1) (hg : ∀ k, ∇ f (x k) ≠ 0) (k : ℕ) :
    (B k).PosDef ∧ 0 < (x (k + 1) - x k).ofLp ⬝ᵥ (∇ f (x (k + 1)) - ∇ f (x k)).ofLp := by
  sorry

/-- 3.2 Global convergence of BFGS (Nocedal–Wright, Theorem 6.5, under Assumption 6.1): on a
convex initial sublevel set with Hessian between `m` and `M`, the iterates converge to the
minimizer of `f`. -/
theorem IsBFGSRun.tendsto_isMin {f : EuclideanSpace ℝ ι → ℝ} {c₁ c₂ m M : ℝ}
    {x : ℕ → EuclideanSpace ℝ ι} {B : ℕ → Matrix ι ι ℝ} {α : ℕ → ℝ}
    (hrun : IsBFGSRun f c₁ c₂ x B α) (hc₁ : 0 < c₁) (hc₂ : c₂ < 1) (hf : ContDiff ℝ 2 f)
    (hconv : Convex ℝ {y | f y ≤ f (x 0)}) (hm : 0 < m)
    (hH : ∀ y, f y ≤ f (x 0) → ∀ z, m * ‖z‖ ^ 2 ≤ ⟪fderiv ℝ (∇ f) y z, z⟫ ∧
      ⟪fderiv ℝ (∇ f) y z, z⟫ ≤ M * ‖z‖ ^ 2) :
    ∃ xs, (∀ y, f xs ≤ f y) ∧ Tendsto x atTop (𝓝 xs) := by
  sorry

/-- 3.2 Superlinear convergence of BFGS (Nocedal–Wright, Theorem 6.6, with `c₁ < 1/2`): under
Assumption 6.2 and `∑ ‖x k - x⋆‖ < ∞`, the Dennis–Moré condition holds, the unit step is
eventually a Wolfe step, and if the step is eventually `1` the convergence is superlinear. -/
theorem IsBFGSRun.superlinear {f : EuclideanSpace ℝ ι → ℝ} {c₁ c₂ : ℝ}
    {x : ℕ → EuclideanSpace ℝ ι} {B : ℕ → Matrix ι ι ℝ} {α : ℕ → ℝ} {xs : EuclideanSpace ℝ ι}
    (hrun : IsBFGSRun f c₁ c₂ x B α) (hc₁ : c₁ < 1 / 2) (hc₂ : 0 < c₂) (hc₂' : c₂ < 1)
    (hf : ContDiff ℝ 2 f) (hlim : Tendsto x atTop (𝓝 xs)) (hg : ∇ f xs = 0)
    (hpd : ∀ v, v ≠ 0 → 0 < ⟪fderiv ℝ (∇ f) xs v, v⟫)
    (hlip : ∃ L : ℝ, ∀ᶠ y in 𝓝 xs,
      ‖fderiv ℝ (∇ f) y - fderiv ℝ (∇ f) xs‖ ≤ L * ‖y - xs‖)
    (hsum : Summable fun k => ‖x k - xs‖) :
    Tendsto (fun k => ‖Matrix.toEuclideanCLM (𝕜 := ℝ) (B k) (x (k + 1) - x k) -
        fderiv ℝ (∇ f) xs (x (k + 1) - x k)‖ / ‖x (k + 1) - x k‖) atTop (𝓝 0) ∧
      (∀ᶠ k in atTop, IsWolfeStep f c₁ c₂ (x k) (bfgsDirection (B k) (∇ f (x k))) 1) ∧
      ((∀ᶠ k in atTop, α k = 1) →
        Tendsto (fun k => ‖x (k + 1) - xs‖ / ‖x k - xs‖) atTop (𝓝 0)) := by
  sorry

end BFGS

/-! ## Layer 4: lower complexity bounds -/

section LowerBounds

/-- 4.1 The `i`-th coordinate of `x`, and `0` past the dimension. -/
def chainCoord {n : ℕ} (x : EuclideanSpace ℝ (Fin n)) (i : ℕ) : ℝ :=
  if h : i < n then x.ofLp ⟨i, h⟩ else 0

/-- 4.1 Nesterov's chain quadratic (§2.1.2), with coordinates numbered from `0`:
`L/4 (½ [x₀² + ∑_{i < k-1} (xᵢ - xᵢ₊₁)² + x_{k-1}²] - x₀)`. -/
def chainQuadratic (n k : ℕ) (L : ℝ) (x : EuclideanSpace ℝ (Fin n)) : ℝ :=
  L / 4 * ((chainCoord x 0 ^ 2 + ∑ i ∈ Finset.range (k - 1),
      (chainCoord x i - chainCoord x (i + 1)) ^ 2 + chainCoord x (k - 1) ^ 2) / 2 -
    chainCoord x 0)

/-- 4.1 Its minimizer: coordinates `1 - (i + 1)/(k + 1)` for `i < k` and `0` after. -/
def chainMinimizer (n k : ℕ) : EuclideanSpace ℝ (Fin n) :=
  WithLp.toLp 2 fun i => if (i : ℕ) < k then 1 - ((i : ℕ) + 1 : ℝ) / (k + 1) else 0

/-- 4.1 The chain quadratic (Nesterov, §2.1.2, pp. 69–70): for `1 ≤ k ≤ n` it is
smooth and convex with `L`-Lipschitz gradient, `chainMinimizer n k` minimizes it with value
`L/8 (-1 + 1/(k + 1))`, and `‖chainMinimizer n k‖² ≤ (k + 1)/3`. -/
theorem chainQuadratic_spec {n k : ℕ} (hk : 1 ≤ k) (hkn : k ≤ n) (L : ℝ≥0) :
    ContDiff ℝ ∞ (chainQuadratic n k L) ∧ ConvexOn ℝ univ (chainQuadratic n k L) ∧
      LipschitzWith L (∇ (chainQuadratic n k L)) ∧
      IsMinOn (chainQuadratic n k L) univ (chainMinimizer n k) ∧
      chainQuadratic n k L (chainMinimizer n k) = L / 8 * (-1 + 1 / (k + 1)) ∧
      ‖chainMinimizer n k‖ ^ 2 ≤ (k + 1) / 3 := by
  sorry

/-- 4.1 The span lemma (Nesterov, Lemma 2.1.5): a span method started at `0` on a chain
quadratic has `x k` supported in the first `k` coordinates. -/
theorem chainCoord_eq_zero_of_isSpanFirstOrder {n p : ℕ} {L : ℝ}
    {x : ℕ → EuclideanSpace ℝ (Fin n)} (hx0 : x 0 = 0)
    (hx : IsSpanFirstOrder (chainQuadratic n p L) x) {k i : ℕ} (hki : k ≤ i) :
    chainCoord (x k) i = 0 := by
  sorry

/-- 4.2 The lower bound for smooth convex functions (Nesterov, Theorem 2.1.7): for
`2 k + 1 ≤ n`, every `x₀` and every `R > 0` there is a smooth convex `f` with `L`-Lipschitz
gradient and a minimizer `x⋆` with `‖x₀ - x⋆‖ = R` such that every span method from `x₀` has
`f (x k) - f x⋆ ≥ 3 L R² / (32 (k + 1)²)` and `‖x k - x⋆‖² ≥ R² / 8`. The prescribed distance
keeps the statement from being met by a function minimized at `x₀`. -/
theorem exists_lowerBound_smoothConvex {n k : ℕ} (hkn : 2 * k + 1 ≤ n) (L : ℝ≥0)
    (x₀ : EuclideanSpace ℝ (Fin n)) {R : ℝ} (hR : 0 < R) :
    ∃ f : EuclideanSpace ℝ (Fin n) → ℝ, ContDiff ℝ ∞ f ∧ ConvexOn ℝ univ f ∧
      LipschitzWith L (∇ f) ∧ ∃ xs, ‖x₀ - xs‖ = R ∧ (∀ y, f xs ≤ f y) ∧
        ∀ x : ℕ → EuclideanSpace ℝ (Fin n), x 0 = x₀ → IsSpanFirstOrder f x →
          3 * L * R ^ 2 / (32 * (k + 1) ^ 2) ≤ f (x k) - f xs ∧
            R ^ 2 / 8 ≤ ‖x k - xs‖ ^ 2 := by
  sorry

/-- 4.2 The lower bound for strongly convex functions on `ℓ²` (Nesterov, Theorem 2.1.13): for
`0 < μ ≤ L`, every `x₀` and every `R > 0` there is a smooth `μ`-strongly convex `f` with
`L`-Lipschitz gradient and a minimizer `x⋆` with `‖x₀ - x⋆‖ = R` such that every span method
from `x₀` has, with `q = (√(L/μ) - 1)/(√(L/μ) + 1)`, `‖x k - x⋆‖² ≥ q^(2k) R²` and
`f (x k) - f x⋆ ≥ μ/2 q^(2k) R²` for every `k`. -/
theorem exists_lowerBound_strongConvex {μ : ℝ} {L : ℝ≥0} (hμ : 0 < μ) (hμL : μ ≤ L)
    (x₀ : lp (fun _ : ℕ => ℝ) 2) {R : ℝ} (hR : 0 < R) :
    ∃ f : lp (fun _ : ℕ => ℝ) 2 → ℝ, ContDiff ℝ ∞ f ∧ StrongConvexOn univ μ f ∧
      LipschitzWith L (∇ f) ∧ ∃ xs, ‖x₀ - xs‖ = R ∧ (∀ y, f xs ≤ f y) ∧
        ∀ x : ℕ → lp (fun _ : ℕ => ℝ) 2, x 0 = x₀ → IsSpanFirstOrder f x → ∀ k : ℕ,
          ((√(L / μ) - 1) / (√(L / μ) + 1)) ^ (2 * k) * R ^ 2 ≤ ‖x k - xs‖ ^ 2 ∧
            μ / 2 * ((√(L / μ) - 1) / (√(L / μ) + 1)) ^ (2 * k) * R ^ 2 ≤
              f (x k) - f xs := by
  sorry

end LowerBounds

/-! ## Layer 8: self-concordant barriers and short-step path following -/

section LogBarrier

variable {E ι : Type*} [AddCommGroup E] [Module ℝ E] [Fintype ι]

/-- The logarithmic barrier `φ(x) = -∑ᵢ log(-gᵢ(x))` of the constraints `gᵢ ≤ 0`. Copied
verbatim, with its `variable` line, from InteriorPointMethods 1.1. -/
def logBarrier (g : ι → E → ℝ) (x : E) : ℝ :=
  -∑ i, Real.log (-g i x)

/-- The strictly feasible points of `S`: the `x ∈ S` with `gᵢ(x) < 0` for every `i`. Copied
verbatim, with its `variable` line, from InteriorPointMethods 1.1. -/
def strictFeasibleSet (S : Set E) (g : ι → E → ℝ) : Set E :=
  {x | x ∈ S ∧ ∀ i, g i x < 0}

end LogBarrier

section NewtonMap

/- The `variable` line of NewtonAndQuasiNewtonMethods, as in InteriorPointMethods 4.1. -/
variable {E F : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [NormedAddCommGroup F]
  [NormedSpace ℝ F]

/-- The Newton map of `f`: `x ↦ x - f'(x)⁻¹ f(x)`. Copied verbatim, with its `variable` line, from
InteriorPointMethods 4.1 (itself a copy of NewtonAndQuasiNewtonMethods 1.1). -/
def newtonMap (f : E → F) (x : E) : E :=
  x - (fderiv ℝ f x).inverse (f x)

end NewtonMap

section SelfConcordance

variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]

/-- `f` is self-concordant on `U`. Copied verbatim, with its `variable` line, from
InteriorPointMethods 2.1. -/
structure SelfConcordantOn (f : E → ℝ) (U : Set E) : Prop where
  isOpen : IsOpen U
  contDiffOn : ContDiffOn ℝ 3 f U
  convexOn : ConvexOn ℝ U f
  abs_third_le : ∀ x ∈ U, ∀ v : E,
    |fderiv ℝ (fderiv ℝ (fderiv ℝ f)) x v v v| ≤
      2 * fderiv ℝ (fderiv ℝ f) x v v ^ ((3 : ℝ) / 2)

/-- The Newton decrement `λ(x) = (Df(x)[D²f(x)⁻¹ Df(x)]) ^ (1/2)`. Copied verbatim, with its
`variable` line, from InteriorPointMethods 3.5. -/
def newtonDecrement (f : E → ℝ) (x : E) : ℝ :=
  √(fderiv ℝ f x ((fderiv ℝ (fderiv ℝ f) x).inverse (fderiv ℝ f x)))

/-- 8.1 A `ν`-self-concordant barrier for `U` (Nesterov, Definition 5.3.2 in the form (5.3.6)):
`F` is self-concordant on `U` and `DF(x)[v]² ≤ ν D²F(x)[v, v]`. The blow-up at the frontier is
not part of the definition; theorems that need it assume it. -/
structure IsSelfConcordantBarrier (F : E → ℝ) (U : Set E) (ν : ℝ) : Prop
    extends SelfConcordantOn F U where
  sq_fderiv_le : ∀ x ∈ U, ∀ v : E, fderiv ℝ F x v ^ 2 ≤ ν * fderiv ℝ (fderiv ℝ F) x v v

/-- 8.1 `-log` is a `1`-self-concordant barrier for `(0, ∞)` (Nesterov, Example 5.3.1). -/
theorem isSelfConcordantBarrier_neg_log :
    IsSelfConcordantBarrier (fun x : ℝ => -Real.log x) (Ioi 0) 1 := by
  sorry

/-- 8.1 Check (negative control): a nonconstant linear function is a barrier for no `ν`. -/
theorem not_isSelfConcordantBarrier_id (ν : ℝ) :
    ¬ IsSelfConcordantBarrier (fun x : ℝ => x) univ ν := by
  intro h
  have hid : fderiv ℝ (fun x : ℝ => x) = fun _ => ContinuousLinearMap.id ℝ ℝ :=
    funext fun _ => fderiv_fun_id
  have := h.sq_fderiv_le 0 (mem_univ _) 1
  simp [hid] at this
  linarith

/-- 8.2 Sums of barriers (Nesterov, Theorem 5.3.2): parameters add. -/
theorem IsSelfConcordantBarrier.add {F₁ F₂ : E → ℝ} {U₁ U₂ : Set E} {ν₁ ν₂ : ℝ}
    (h₁ : IsSelfConcordantBarrier F₁ U₁ ν₁) (h₂ : IsSelfConcordantBarrier F₂ U₂ ν₂)
    (hν₁ : 0 ≤ ν₁) (hν₂ : 0 ≤ ν₂) :
    IsSelfConcordantBarrier (fun x => F₁ x + F₂ x) (U₁ ∩ U₂) (ν₁ + ν₂) := by
  sorry

/-- 8.2 Affine substitution (Nesterov, Theorem 5.3.3): the parameter is unchanged. -/
theorem IsSelfConcordantBarrier.comp_affine {G : Type*} [NormedAddCommGroup G]
    [NormedSpace ℝ G] {F : E → ℝ} {U : Set E} {ν : ℝ} (h : IsSelfConcordantBarrier F U ν)
    (A : G →L[ℝ] E) (b : E) :
    IsSelfConcordantBarrier (fun y => F (A y + b)) {y | A y + b ∈ U} ν := by
  sorry

/-- 8.2 The logarithmic barrier of `m` strict linear inequalities is an `m`-self-concordant
barrier (Nesterov, Example 5.3.1 with Theorems 5.3.2–5.3.3). -/
theorem isSelfConcordantBarrier_logBarrier {ι : Type*} [Fintype ι] (a : ι → E →L[ℝ] ℝ)
    (b : ι → ℝ) :
    IsSelfConcordantBarrier (logBarrier fun i x => a i x - b i)
      (strictFeasibleSet univ fun i x => a i x - b i) (Fintype.card ι) := by
  sorry

/-- 8.3 The barrier inequality (Nesterov, Theorem 5.3.7, for points of `U`):
`DF(x)[y - x] < ν`. -/
theorem IsSelfConcordantBarrier.fderiv_sub_lt {F : E → ℝ} {U : Set E} {ν : ℝ}
    (h : IsSelfConcordantBarrier F U ν) (hν : 0 < ν) {x y : E} (hx : x ∈ U) (hy : y ∈ U) :
    fderiv ℝ F x (y - x) < ν := by
  sorry

/-- 8.4 Minimizers from a small Newton decrement (Nesterov, Theorem 5.1.13 with `M = 1`): in
finite dimension, a self-concordant `f` tending to `+∞` at the frontier of `U`, with positive
definite Hessian on `U` and `λ(x) < 1` at some `x ∈ U`, has a unique minimizer on `U`. -/
theorem existsUnique_isMinOn_of_newtonDecrement_lt_one [FiniteDimensional ℝ E] {f : E → ℝ}
    {U : Set E} (hf : SelfConcordantOn f U) (hbar : ∀ y ∈ frontier U, Tendsto f (𝓝[U] y) atTop)
    (hpd : ∀ x ∈ U, ∀ v : E, v ≠ 0 → 0 < fderiv ℝ (fderiv ℝ f) x v v) {x : E} (hx : x ∈ U)
    (hlam : newtonDecrement f x < 1) :
    ∃! z, z ∈ U ∧ IsMinOn f U z := by
  sorry

/-- 8.4 The full Newton step (Nesterov, Theorem 5.2.2, (5.2.6) with `M = 1`): if `λ(x) < 1`
then the Newton point lies in `U` and `λ(x₊) ≤ (λ / (1 - λ))²`. -/
theorem newtonMap_mem_and_newtonDecrement_le [FiniteDimensional ℝ E] {f : E → ℝ} {U : Set E}
    (hf : SelfConcordantOn f U) (hbar : ∀ y ∈ frontier U, Tendsto f (𝓝[U] y) atTop)
    (hpd : ∀ x ∈ U, ∀ v : E, v ≠ 0 → 0 < fderiv ℝ (fderiv ℝ f) x v v) {x : E} (hx : x ∈ U)
    (hlam : newtonDecrement f x < 1) :
    newtonMap (fderiv ℝ f) x ∈ U ∧
      newtonDecrement f (newtonMap (fderiv ℝ f) x) ≤
        (newtonDecrement f x / (1 - newtonDecrement f x)) ^ 2 := by
  sorry

/-- 8.5 Central points (Nesterov (5.3.19)–(5.3.21), Definition 5.3.3): in finite dimension, a
continuous strictly convex `F` on a bounded nonempty `U` tending to `+∞` at the frontier has, for
every `t`, a unique minimizer of `t c + F` on `U`; `t = 0` gives the analytic center. -/
theorem existsUnique_isMinOn_linear_add [FiniteDimensional ℝ E] {F : E → ℝ} {U : Set E}
    (hF : StrictConvexOn ℝ U F) (hcont : ContinuousOn F U) (hU : Bornology.IsBounded U)
    (hne : U.Nonempty) (hbar : ∀ y ∈ frontier U, Tendsto F (𝓝[U] y) atTop)
    (c : E →L[ℝ] ℝ) (t : ℝ) :
    ∃! z, z ∈ U ∧ IsMinOn (fun x => t * c x + F x) U z := by
  sorry

/-- 8.6 The gap on the central path (Nesterov, Theorem 5.3.10, (5.3.23)):
`c(x⋆(t)) - c(y) ≤ ν / t` for every `y ∈ U`. -/
theorem centralPath_gap {F : E → ℝ} {U : Set E} {ν t : ℝ} (h : IsSelfConcordantBarrier F U ν)
    (hν : 0 ≤ ν) (c : E →L[ℝ] ℝ) (ht : 0 < t) {xt : E} (hxt : xt ∈ U)
    (hmin : IsMinOn (fun x => t * c x + F x) U xt) :
    ∀ y ∈ U, c xt - c y ≤ ν / t := by
  sorry

/-- 8.6 The gap under approximate centering (Nesterov, Theorem 5.3.10, (5.3.24)): if
`λ_{tc+F}(x) ≤ β < 1` then `c(x) - c(y) ≤ (ν + (β + √ν) β / (1 - β)) / t` for every `y ∈ U`. -/
theorem approxCentering_gap [FiniteDimensional ℝ E] {F : E → ℝ} {U : Set E} {ν t β : ℝ}
    (h : IsSelfConcordantBarrier F U ν) (hν : 0 ≤ ν)
    (hbar : ∀ y ∈ frontier U, Tendsto F (𝓝[U] y) atTop)
    (hpd : ∀ x ∈ U, ∀ v : E, v ≠ 0 → 0 < fderiv ℝ (fderiv ℝ F) x v v) (c : E →L[ℝ] ℝ)
    (ht : 0 < t) {x : E} (hx : x ∈ U) (hβ : β < 1)
    (hlam : newtonDecrement (fun z => t * c z + F z) x ≤ β) :
    ∀ y ∈ U, c x - c y ≤ (ν + (β + √ν) * β / (1 - β)) / t := by
  sorry

/-- 8.7 The dual local norm `‖s‖⋆ₓ = (s[D²F(x)⁻¹ s]) ^ (1/2)` of a functional `s`. -/
def dualLocalNorm (F : E → ℝ) (x : E) (s : E →L[ℝ] ℝ) : ℝ :=
  √(s ((fderiv ℝ (fderiv ℝ F) x).inverse s))

/-- 8.7 Check: the Newton decrement is the dual local norm of the derivative. -/
theorem newtonDecrement_eq_dualLocalNorm (F : E → ℝ) (x : E) :
    newtonDecrement F x = dualLocalNorm F x (fderiv ℝ F x) :=
  rfl

/-- 8.7 The centering radius `β(τ) = τ² (1 + τ + τ / (1 + τ + τ²))` (Nesterov, Lemma 5.2.2). -/
def centeringRadius (τ : ℝ) : ℝ :=
  τ ^ 2 * (1 + τ + τ / (1 + τ + τ ^ 2))

/-- 8.7 One step of the path-following scheme (Nesterov (5.3.25)): `t₊ = t + γ / ‖c‖⋆ₓ`, then a
damped Newton step for `t₊ c + F` with damping `1 / (1 + λ² / (1 + λ))`. -/
def pathFollowingStep (F : E → ℝ) (c : E →L[ℝ] ℝ) (γ : ℝ) (p : ℝ × E) : ℝ × E :=
  let t := p.1 + γ / dualLocalNorm F p.2 c
  let s := t • c + fderiv ℝ F p.2
  let l := dualLocalNorm F p.2 s
  (t, p.2 - (1 + l ^ 2 / (1 + l))⁻¹ • (fderiv ℝ (fderiv ℝ F) p.2).inverse s)

/-- 8.7 The main path-following scheme (Nesterov (5.3.29)) from `(0, x₀)`. -/
def pathFollowingSeq (F : E → ℝ) (c : E →L[ℝ] ℝ) (γ : ℝ) (x₀ : E) (k : ℕ) : ℝ × E :=
  (pathFollowingStep F c γ)^[k] (0, x₀)

/-- 8.7 Short-step path following (Nesterov, Theorem 5.3.11 and its proof), with explicit
constants: for `0 < τ ≤ 1/2`, `β = β(τ)`, `γ = τ - β`, an analytic center `x_F` and a start with
`λ_F(x₀) ≤ β`, every iterate `k ≥ 1` lies in `U`, is approximately centred,
`tₖ ≥ γ (1 - 2β) / ((1 - β) ‖c‖⋆_{x_F}) · (1 + γ / (β + √ν))^(k-1)`, and
`c(xₖ) - c(y) ≤ (ν + (β + √ν) β / (1 - β)) / tₖ` for every `y ∈ U`. -/
theorem pathFollowingSeq_spec [FiniteDimensional ℝ E] {F : E → ℝ} {U : Set E} {ν τ : ℝ}
    (h : IsSelfConcordantBarrier F U ν) (hbar : ∀ y ∈ frontier U, Tendsto F (𝓝[U] y) atTop)
    (hpd : ∀ x ∈ U, ∀ v : E, v ≠ 0 → 0 < fderiv ℝ (fderiv ℝ F) x v v) {xF : E} (hxF : xF ∈ U)
    (hcen : IsMinOn F U xF) {c : E →L[ℝ] ℝ} (hc : c ≠ 0) (hτ : 0 < τ) (hτ' : τ ≤ 1 / 2)
    {x₀ : E} (hx₀ : x₀ ∈ U) (hlam₀ : newtonDecrement F x₀ ≤ centeringRadius τ) {k : ℕ}
    (hk : 1 ≤ k) :
    let β := centeringRadius τ
    let γ := τ - β
    let p := pathFollowingSeq F c γ x₀ k
    p.2 ∈ U ∧ newtonDecrement (fun z => p.1 * c z + F z) p.2 ≤ β ∧
      γ * (1 - 2 * β) / ((1 - β) * dualLocalNorm F xF c) * (1 + γ / (β + √ν)) ^ (k - 1) ≤
        p.1 ∧
      ∀ y ∈ U, c p.2 - c y ≤ (ν + (β + √ν) * β / (1 - β)) / p.1 := by
  sorry

end SelfConcordance

end TauCetiRoadmap.DescentSplittingAndPathFollowingMethods
