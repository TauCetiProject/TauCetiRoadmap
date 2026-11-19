import Mathlib

/-!
# Online convex optimization: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the
definitions they need; every definition has a real body. Every headline theorem of the README is
statable at the pins and is stated here. The README's remaining API facts and Checks are not
restated.

The iterates of every method are sequences `ℕ → E` defined by a recursion (`ogd`) or singled out
by a minimization property (`IsFTRL`, `IsMirrorDescent`); the losses `f t` and the vectors `g t`
are arbitrary sequences, and each bound assumes that `g t` satisfies the subgradient inequality
of `f t` at the `t`-th iterate. Since the `t`-th iterate depends only on `g 0, …, g (t - 1)`, the
bounds hold against adaptive adversaries.

Five definitions restate, with identical bodies, definitions owned by roadmaps on main, so that
the statements can be made here without importing another roadmap: `metricProj` is the metric
projection of MathematicalStatisticsNonparametric 6.5, and `simplex`, `OnlineAlgorithm`,
`OnlineAlgorithm.play` and `hedge` are those of RegretMinimizationAndEquilibria (Conventions,
1.1 and 1.2). The regret bound of Hedge is that roadmap's 1.2 and is not restated.
-/

noncomputable section

open Finset MeasureTheory ProbabilityTheory
open scoped RealInnerProductSpace

namespace TauCetiRoadmap.OnlineConvexOptimization

/-! ## Layer 1: regret and the metric projection -/

/-- 1.1 The regret after `T` rounds of the plays `x` on the losses `f` against the comparator
`u`: `∑_{t < T} (f t (x t) - f t u)`. -/
def regret {α : Type*} (f : ℕ → α → ℝ) (x : ℕ → α) (T : ℕ) (u : α) : ℝ :=
  ∑ t ∈ range T, (f t (x t) - f t u)

open Classical in
/-- 1.2 The metric projection onto `s`: a point of `s` nearest to `x` when one exists, and `0`
otherwise. Identical to `metricProj` of MathematicalStatisticsNonparametric 6.5, which owns
it. -/
def metricProj {E : Type*} [NormedAddCommGroup E] (s : Set E) (x : E) : E :=
  if h : ∃ y ∈ s, ‖x - y‖ = Metric.infDist x s then h.choose else 0

section Euclidean

variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]

/-- 1.2 The projection inequality. For a nonempty complete convex set `K` in a real inner
product space, `metricProj K y` lies in `K`, and for every `u ∈ K`,
`‖metricProj K y - u‖² + ‖y - metricProj K y‖² ≤ ‖y - u‖²`. -/
theorem metricProj_mem_and_sq_norm_sub_add_le {K : Set E} (hne : K.Nonempty)
    (hc : IsComplete K) (hK : Convex ℝ K) (y : E) :
    metricProj K y ∈ K ∧ ∀ u ∈ K,
      ‖metricProj K y - u‖ ^ 2 + ‖y - metricProj K y‖ ^ 2 ≤ ‖y - u‖ ^ 2 := by
  sorry

/-! ## Layer 2: online gradient descent -/

/-- 2.1 Online gradient descent on `K` with steps `η` driven by the vectors `g`, started at
`x₀`: `x 0 = x₀` and `x (t + 1) = metricProj K (x t - η t • g t)`. -/
def ogd (K : Set E) (η : ℕ → ℝ) (g : ℕ → E) (x₀ : E) : ℕ → E
  | 0 => x₀
  | t + 1 => metricProj K (ogd K η g x₀ t - η t • g t)

/-- 2.1 The regret bound of online gradient descent with a constant step `η > 0`: if each `g t`
is a subgradient of `f t` at the `t`-th iterate relative to `K`, then for every `u ∈ K`,
`regret ≤ ‖u - x₀‖² / (2η) + (η/2) ∑_{t < T} ‖g t‖²`. -/
theorem regret_ogd_le {K : Set E} (hc : IsComplete K) (hK : Convex ℝ K) (x₀ : E) {η : ℝ}
    (hη : 0 < η) (g : ℕ → E) (f : ℕ → E → ℝ)
    (hf : ∀ t, ∀ y ∈ K, f t (ogd K (fun _ ↦ η) g x₀ t) +
      ⟪g t, y - ogd K (fun _ ↦ η) g x₀ t⟫ ≤ f t y)
    (T : ℕ) {u : E} (hu : u ∈ K) :
    regret f (ogd K (fun _ ↦ η) g x₀) T u ≤
      ‖u - x₀‖ ^ 2 / (2 * η) + η / 2 * ∑ t ∈ range T, ‖g t‖ ^ 2 := by
  sorry

/-- 2.1 The tuned bound `D G √T`: with `‖g t‖ ≤ G`, `‖u - x₀‖ ≤ D` and the constant step
`η = D / (G √T)`, the regret after `T ≥ 1` rounds is at most `D G √T`. -/
theorem regret_ogd_le_mul_sqrt {K : Set E} (hc : IsComplete K) (hK : Convex ℝ K) (x₀ : E)
    {D G : ℝ} (hD : 0 < D) (hG : 0 < G) {T : ℕ} (hT : 0 < T) (g : ℕ → E)
    (hg : ∀ t, ‖g t‖ ≤ G) (f : ℕ → E → ℝ)
    (hf : ∀ t, ∀ y ∈ K, f t (ogd K (fun _ ↦ D / (G * Real.sqrt T)) g x₀ t) +
      ⟪g t, y - ogd K (fun _ ↦ D / (G * Real.sqrt T)) g x₀ t⟫ ≤ f t y)
    {u : E} (hu : u ∈ K) (hux : ‖u - x₀‖ ≤ D) :
    regret f (ogd K (fun _ ↦ D / (G * Real.sqrt T)) g x₀) T u ≤ D * G * Real.sqrt T := by
  sorry

/-- 2.2 Non-increasing steps on a set of diameter at most `D`: for `x₀ ∈ K`, positive
non-increasing `η` and `T ≥ 1`,
`regret ≤ D² / (2 η (T - 1)) + ∑_{t < T} (η t / 2) ‖g t‖²`. -/
theorem regret_ogd_le_of_antitone {K : Set E} (hc : IsComplete K) (hK : Convex ℝ K) {x₀ : E}
    (hx₀ : x₀ ∈ K) {D : ℝ} (hD : ∀ y ∈ K, ∀ z ∈ K, ‖y - z‖ ≤ D) {η : ℕ → ℝ}
    (hη : ∀ t, 0 < η t) (hanti : Antitone η) (g : ℕ → E) (f : ℕ → E → ℝ)
    (hf : ∀ t, ∀ y ∈ K, f t (ogd K η g x₀ t) + ⟪g t, y - ogd K η g x₀ t⟫ ≤ f t y)
    {T : ℕ} (hT : 0 < T) {u : E} (hu : u ∈ K) :
    regret f (ogd K η g x₀) T u ≤
      D ^ 2 / (2 * η (T - 1)) + ∑ t ∈ range T, η t / 2 * ‖g t‖ ^ 2 := by
  sorry

/-- 2.2 The anytime bound `(3/2) D G √T`: with `x₀ ∈ K`, `K` of diameter at most `D > 0`,
`‖g t‖ ≤ G` with `G > 0`, and the steps `η t = D / (G √(t + 1))`, the regret after every `T`
rounds is at most `(3/2) D G √T`. -/
theorem regret_ogd_le_three_halves {K : Set E} (hc : IsComplete K) (hK : Convex ℝ K) {x₀ : E}
    (hx₀ : x₀ ∈ K) {D G : ℝ} (hD0 : 0 < D) (hD : ∀ y ∈ K, ∀ z ∈ K, ‖y - z‖ ≤ D) (hG : 0 < G)
    (g : ℕ → E) (hg : ∀ t, ‖g t‖ ≤ G) (f : ℕ → E → ℝ)
    (hf : ∀ t, ∀ y ∈ K, f t (ogd K (fun t ↦ D / (G * Real.sqrt ((t : ℝ) + 1))) g x₀ t) +
      ⟪g t, y - ogd K (fun t ↦ D / (G * Real.sqrt ((t : ℝ) + 1))) g x₀ t⟫ ≤ f t y)
    (T : ℕ) {u : E} (hu : u ∈ K) :
    regret f (ogd K (fun t ↦ D / (G * Real.sqrt ((t : ℝ) + 1))) g x₀) T u ≤
      3 / 2 * D * G * Real.sqrt T := by
  sorry

/-- 2.3 Strongly convex losses: if `g t` satisfies the subgradient inequality of `f t` at the
`t`-th iterate with the quadratic term `(μ t / 2) ‖y - x t‖²`, `μ t > 0`, then with the steps
`η t = 1 / ∑_{i ≤ t} μ i`, `regret ≤ (1/2) ∑_{t < T} ‖g t‖² / ∑_{i ≤ t} μ i`. -/
theorem regret_ogd_le_of_strongConvex {K : Set E} (hc : IsComplete K) (hK : Convex ℝ K)
    (x₀ : E) {μ : ℕ → ℝ} (hμ : ∀ t, 0 < μ t) (g : ℕ → E) (f : ℕ → E → ℝ)
    (hf : ∀ t, ∀ y ∈ K,
      f t (ogd K (fun t ↦ 1 / ∑ i ∈ range (t + 1), μ i) g x₀ t) +
          ⟪g t, y - ogd K (fun t ↦ 1 / ∑ i ∈ range (t + 1), μ i) g x₀ t⟫ +
        μ t / 2 * ‖y - ogd K (fun t ↦ 1 / ∑ i ∈ range (t + 1), μ i) g x₀ t‖ ^ 2 ≤ f t y)
    (T : ℕ) {u : E} (hu : u ∈ K) :
    regret f (ogd K (fun t ↦ 1 / ∑ i ∈ range (t + 1), μ i) g x₀) T u ≤
      1 / 2 * ∑ t ∈ range T, ‖g t‖ ^ 2 / ∑ i ∈ range (t + 1), μ i := by
  sorry

/-- 2.3 The logarithmic bound: for a constant modulus `α > 0`, `‖g t‖ ≤ G` and the steps
`η t = 1 / (α (t + 1))`, `regret ≤ G² / (2α) · (1 + log T)`. -/
theorem regret_ogd_le_log {K : Set E} (hc : IsComplete K) (hK : Convex ℝ K) (x₀ : E)
    {α G : ℝ} (hα : 0 < α) (g : ℕ → E) (hg : ∀ t, ‖g t‖ ≤ G) (f : ℕ → E → ℝ)
    (hf : ∀ t, ∀ y ∈ K,
      f t (ogd K (fun t ↦ 1 / (α * ((t : ℝ) + 1))) g x₀ t) +
          ⟪g t, y - ogd K (fun t ↦ 1 / (α * ((t : ℝ) + 1))) g x₀ t⟫ +
        α / 2 * ‖y - ogd K (fun t ↦ 1 / (α * ((t : ℝ) + 1))) g x₀ t‖ ^ 2 ≤ f t y)
    (T : ℕ) {u : E} (hu : u ∈ K) :
    regret f (ogd K (fun t ↦ 1 / (α * ((t : ℝ) + 1))) g x₀) T u ≤
      G ^ 2 / (2 * α) * (1 + Real.log T) := by
  sorry

end Euclidean

section FTRL

variable {F : Type*} [NormedAddCommGroup F] [NormedSpace ℝ F]

/-! ## Layer 3: follow the regularized leader -/

/-- 3.1 `x` is a sequence of follow-the-regularized-leader iterates on `K` for the regularizer
`ψ`, the step `η` and the linear losses `g`: each `x t` lies in `K` and minimizes
`y ↦ ψ y + η ∑_{s < t} g s y` over `K`. -/
def IsFTRL (K : Set F) (ψ : F → ℝ) (η : ℝ) (g : ℕ → StrongDual ℝ F) (x : ℕ → F) : Prop :=
  ∀ t, x t ∈ K ∧ IsMinOn (fun y ↦ ψ y + η * ∑ s ∈ range t, g s y) K (x t)

/-- 3.1 The regret bound of follow the regularized leader: for a `μ`-strongly convex
regularizer on `K` (`μ > 0`, strong convexity for the norm of `F`) and `η > 0`, if each `g t`
is a subgradient of `f t` at `x t` relative to `K`, then for every `u ∈ K`,
`regret ≤ (ψ u - ψ (x 0)) / η + η / (2μ) · ∑_{t < T} ‖g t‖²`, the norm of `g t` being the
dual norm. -/
theorem regret_le_of_isFTRL {K : Set F} {ψ : F → ℝ} {μ η : ℝ} (hμ : 0 < μ)
    (hψ : StrongConvexOn K μ ψ) (hη : 0 < η) {g : ℕ → StrongDual ℝ F} {x : ℕ → F}
    (hx : IsFTRL K ψ η g x) (f : ℕ → F → ℝ) (hf : ∀ t, ∀ y ∈ K, f t (x t) + g t (y - x t) ≤ f t y)
    (T : ℕ) {u : F} (hu : u ∈ K) :
    regret f x T u ≤ (ψ u - ψ (x 0)) / η + η / (2 * μ) * ∑ t ∈ range T, ‖g t‖ ^ 2 := by
  sorry

end FTRL

/-! ### 3.2 The entropic regularizer and Hedge -/

section Entropic

variable {ι : Type*} [Fintype ι] [Nonempty ι]

/-- 3.2 The probability simplex on a finite type, as a set of weight vectors. Identical to
`simplex` of RegretMinimizationAndEquilibria (Conventions), which owns it. -/
def simplex (ι : Type*) : Set (ι → ℝ) :=
  Set.range fun p : Convexity.StdSimplex ℝ ι ↦ ⇑p.weights

/-- 3.2 A deterministic online algorithm: the strategy at time `t` from the payoffs before `t`.
Identical to `OnlineAlgorithm` of RegretMinimizationAndEquilibria 1.1, which owns it. -/
abbrev OnlineAlgorithm (ι : Type*) := (t : ℕ) → (Fin t → ι → ℝ) → (ι → ℝ)

/-- 3.2 The strategies an online algorithm plays against the payoff sequence `u`. Identical to
`OnlineAlgorithm.play` of RegretMinimizationAndEquilibria 1.1, which owns it. -/
def OnlineAlgorithm.play (A : OnlineAlgorithm ι) (u : ℕ → ι → ℝ) (t : ℕ) : ι → ℝ :=
  A t fun s ↦ u s

/-- 3.2 Hedge with learning rate `η`. Identical to `hedge` of RegretMinimizationAndEquilibria
1.2, which owns it. -/
def hedge (η : ℝ) : OnlineAlgorithm ι := fun _ past a ↦
  Real.exp (η * ∑ s, past s a) / ∑ b, Real.exp (η * ∑ s, past s b)

/-- 3.2 The objective of follow the regularized leader on the simplex with the negative entropy
as regularizer: `∑_a q a log (q a) + η ∑_{s < t} ⟨g s, q⟩`. -/
def entropicObjective (η : ℝ) (g : ℕ → ι → ℝ) (t : ℕ) (q : ι → ℝ) : ℝ :=
  ∑ a, q a * Real.log (q a) + η * ∑ s ∈ range t, g s ⬝ᵥ q

/-- 3.2 Hedge is follow the regularized leader with the entropic regularizer. For every real
`η`, loss vectors `g` and time `t`, the strategy that Hedge plays at time `t` against the
payoffs `-g` lies in the simplex, is the unique minimizer of `entropicObjective η g t` over the
simplex, and the minimum value is `-log ∑_a exp (-η ∑_{s < t} g s a)`. -/
theorem hedge_play_neg_isMinOn_entropicObjective (η : ℝ) (g : ℕ → ι → ℝ) (t : ℕ) :
    (hedge η).play (fun s ↦ -g s) t ∈ simplex ι ∧
      entropicObjective η g t ((hedge η).play (fun s ↦ -g s) t) =
        -Real.log (∑ a, Real.exp (-(η * ∑ s ∈ range t, g s a))) ∧
      ∀ q ∈ simplex ι, entropicObjective η g t ((hedge η).play (fun s ↦ -g s) t) ≤
          entropicObjective η g t q ∧
        (entropicObjective η g t q = entropicObjective η g t ((hedge η).play (fun s ↦ -g s) t) →
          q = (hedge η).play (fun s ↦ -g s) t) := by
  sorry

end Entropic

section MirrorDescent

variable {F : Type*} [NormedAddCommGroup F] [NormedSpace ℝ F]

/-! ## Layer 4: mirror descent -/

/-- 4.1 The Bregman divergence of `ψ` at `v`: `ψ u - ψ v - ψ'(v) (u - v)`, with `ψ'(v)` the
Fréchet derivative of `ψ` at `v`. -/
def bregmanDiv (ψ : F → ℝ) (u v : F) : ℝ :=
  ψ u - ψ v - fderiv ℝ ψ v (u - v)

/-- 4.2 `x` is a sequence of mirror-descent iterates on `K` for the mirror map `ψ`, the step `η`
and the linear losses `g`: each `x t` lies in `K` and `x (t + 1)` minimizes
`y ↦ η g t y + bregmanDiv ψ y (x t)` over `K`. -/
def IsMirrorDescent (K : Set F) (ψ : F → ℝ) (η : ℝ) (g : ℕ → StrongDual ℝ F) (x : ℕ → F) :
    Prop :=
  ∀ t, x t ∈ K ∧ IsMinOn (fun y ↦ η * g t y + bregmanDiv ψ y (x t)) K (x (t + 1))

/-- 4.2 The regret bound of mirror descent: for a `μ`-strongly convex `ψ` on `K` (`μ > 0`)
that is differentiable at every iterate, and `η > 0`, if each `g t` is a subgradient of `f t`
at `x t` relative to `K`, then for every `u ∈ K`,
`regret ≤ bregmanDiv ψ u (x 0) / η + η / (2μ) · ∑_{t < T} ‖g t‖²`. -/
theorem regret_le_of_isMirrorDescent {K : Set F} {ψ : F → ℝ} {μ η : ℝ} (hμ : 0 < μ)
    (hψ : StrongConvexOn K μ ψ) (hη : 0 < η) {g : ℕ → StrongDual ℝ F} {x : ℕ → F}
    (hx : IsMirrorDescent K ψ η g x) (hd : ∀ t, DifferentiableAt ℝ ψ (x t)) (f : ℕ → F → ℝ)
    (hf : ∀ t, ∀ y ∈ K, f t (x t) + g t (y - x t) ≤ f t y) (T : ℕ) {u : F} (hu : u ∈ K) :
    regret f x T u ≤ bregmanDiv ψ u (x 0) / η + η / (2 * μ) * ∑ t ∈ range T, ‖g t‖ ^ 2 := by
  sorry

end MirrorDescent


/-! ## Layer 5: online-to-batch conversion -/

/-- 5.1 Online-to-batch conversion. Let `ξ t` be random elements of `Ξ` with common law `μ`, let
`x t` be random points of a convex set `K` such that `x t` is measurable for a σ-algebra
`𝓕 t` independent of `ξ t`, let `f x z` be jointly measurable, convex in `x` on `K` and bounded
on `K × Ξ`, and let `α t > 0` be deterministic weights. Then for `T ≥ 1` and `u ∈ K`, the risk
`F x = ∫ f x z ∂μ` of the `α`-weighted average of `x 0, …, x (T - 1)` has expectation at most
`F u` plus the expected regret of the losses `α t * f · (ξ t)` divided by `∑_{t < T} α t`. -/
theorem integral_risk_weightedAverage_le {Ω Ξ V : Type*} [MeasurableSpace Ω]
    {P : Measure Ω} [IsProbabilityMeasure P] [MeasurableSpace Ξ] {μ : Measure Ξ}
    [NormedAddCommGroup V] [NormedSpace ℝ V] [FiniteDimensional ℝ V] [MeasurableSpace V]
    [BorelSpace V] {K : Set V} (f : V → Ξ → ℝ) (hf : Measurable (Function.uncurry f))
    {M : ℝ} (hM : ∀ x ∈ K, ∀ z, |f x z| ≤ M) (hconv : ∀ z, ConvexOn ℝ K fun x ↦ f x z)
    (ξ : ℕ → Ω → Ξ) (hξ : ∀ t, Measurable (ξ t)) (hlaw : ∀ t, P.map (ξ t) = μ)
    (𝓕 : ℕ → MeasurableSpace Ω) (h𝓕 : ∀ t, 𝓕 t ≤ ‹MeasurableSpace Ω›)
    (hind : ∀ t, Indep (𝓕 t) (MeasurableSpace.comap (ξ t) ‹MeasurableSpace Ξ›) P)
    (x : ℕ → Ω → V) (hx : ∀ t, Measurable[𝓕 t] (x t)) (hxK : ∀ t ω, x t ω ∈ K)
    (α : ℕ → ℝ) (hα : ∀ t, 0 < α t) {T : ℕ} (hT : 0 < T) {u : V} (hu : u ∈ K) :
    ∫ ω, (∫ z, f ((∑ t ∈ range T, α t)⁻¹ • ∑ t ∈ range T, α t • x t ω) z ∂μ) ∂P ≤
      ∫ z, f u z ∂μ +
        (∫ ω, regret (fun t y ↦ α t * f y (ξ t ω)) (fun t ↦ x t ω) T u ∂P) /
          ∑ t ∈ range T, α t := by
  sorry

/-! ## Layer 6: the lower bound -/

/-- 6.1 The mean absolute value of a simple random walk: for every `T`, the average of
`|ε₀ + ⋯ + ε_{T-1}|` over all `2^T` sign sequences is at least `√(T/2)`. -/
theorem sqrt_half_le_mean_abs_sum_signs (T : ℕ) :
    Real.sqrt ((T : ℝ) / 2) ≤
      (∑ ε : Fin T → Bool, |∑ i, (if ε i then (1 : ℝ) else -1)|) / 2 ^ T := by
  sorry

/-- 6.2 The lower bound for online linear optimization. Let `v`, `w` be points of a real inner
product space, `L ≥ 0`, and `A` any deterministic strategy, which plays `A t (g 0, …, g (t-1))`
at time `t`. For every `T` there are vectors `g t` with `‖g t‖ ≤ L` and a comparator
`u ∈ {v, w}` such that the regret of `A` on the linear losses `⟪g t, ·⟫` is at least
`L ‖v - w‖ √(T/8)`. -/
theorem exists_regret_ge {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E] (v w : E)
    {L : ℝ} (hL : 0 ≤ L) (A : (t : ℕ) → (Fin t → E) → E) (T : ℕ) :
    ∃ g : ℕ → E, (∀ t, ‖g t‖ ≤ L) ∧ ∃ u ∈ ({v, w} : Set E),
      L * ‖v - w‖ * Real.sqrt ((T : ℝ) / 8) ≤
        regret (fun t y ↦ ⟪g t, y⟫) (fun t ↦ A t fun s ↦ g s) T u := by
  sorry

end TauCetiRoadmap.OnlineConvexOptimization
