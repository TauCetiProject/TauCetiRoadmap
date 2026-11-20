import Mathlib
import TauCeti.Geometry.Symplectic.Hamiltonian.Basic

/-!
# Convergence of one-step methods for ordinary differential equations: target signatures

This file is not the roadmap: the roadmap is `README.md`. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti APIs, each with `sorry`, together with the
definitions they need; every definition has a real body. Every headline theorem of the README is
statable at the pins and is stated here. The README's remaining targets, API lists and Checks are
not restated.

Suppliers used by the README and not restated here: Mathlib `IsIntegralCurveOn`, `gronwallBound`,
`gronwallBound_mono`, `discrete_gronwall_prod_general`, `Real.add_one_le_exp`,
`image_norm_le_of_norm_deriv_right_le_deriv_boundary`, `ContractingWith.fixedPoint_isFixedPt`,
`ContractingWith.fixedPoint_unique'`, `ODE.contDiffOn_comp`, `contDiffOn_succ_iff_derivWithin`,
`uniqueDiffOn_Icc`, `taylor_mean_remainder_bound`, `HasStrictFDerivAt.to_localInverse`,
`Matrix.mul_nonsing_inv`, `Matrix.nonsing_inv_apply_not_isUnit`,
`Matrix.det_add_replicateCol_mul_replicateRow`, `Polynomial.tendsto_abv_atTop` and
`real_inner_le_norm`; Tau Ceti `TauCeti.SymplecticForm`,
`TauCeti.SymplecticForm.hamiltonianVectorField`,
`TauCeti.SymplecticForm.contDiff_hamiltonianVectorField` and
`TauCeti.SymplecticForm.apply_fderiv_hamiltonianVectorField_add`.
-/

noncomputable section

open Filter Topology Set
open scoped NNReal ContDiff Matrix InnerProductSpace

namespace TauCetiRoadmap.OneStepMethodsForODEs

variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]

/-! ## Layer 1: one-step methods and the convergence theorem -/

/-- 1.1: the `n`-th node `t₀ + h 0 + ⋯ + h (n - 1)` of the mesh with first node `t₀` and steps
`h`. -/
def meshNode (t₀ : ℝ) (h : ℕ → ℝ) (n : ℕ) : ℝ := t₀ + ∑ i ∈ Finset.range n, h i

/-- 1.2: the numerical solution of the one-step method with increment function `Φ` on the mesh
with first node `t₀` and steps `h`, started at `y₀`: `Y (n + 1) = Y n + h n • Φ (t n) (Y n) (h n)`.
-/
def oneStepSeq (Φ : ℝ → E → ℝ → E) (t₀ : ℝ) (h : ℕ → ℝ) (y₀ : E) : ℕ → E
  | 0 => y₀
  | n + 1 => oneStepSeq Φ t₀ h y₀ n + h n • Φ (meshNode t₀ h n) (oneStepSeq Φ t₀ h y₀ n) (h n)

/-- 1.2: the one-step defect of a curve `y` at `t` with step `h`: what is left when `y` is
inserted into one step of the method. The local truncation error is this divided by `h`. -/
def oneStepDefect (Φ : ℝ → E → ℝ → E) (y : ℝ → E) (t h : ℝ) : E :=
  y (t + h) - y t - h • Φ t (y t) h

/-- 1.3: discrete stability of a one-step method with Lipschitz increment function. Two sequences
whose defects are at most `h n * τ` and `ρ n` differ by at most Mathlib's `gronwallBound`. -/
theorem norm_sub_le_gronwallBound_of_oneStep {Φ : ℝ → E → ℝ → E} {t₀ τ : ℝ} {h ρ : ℕ → ℝ}
    {L : ℝ≥0} {N : ℕ} {z Y : ℕ → E} (hh : ∀ n < N, 0 ≤ h n)
    (hΦ : ∀ n < N, LipschitzWith L fun u ↦ Φ (meshNode t₀ h n) u (h n))
    (hz : ∀ n < N, ‖z (n + 1) - z n - h n • Φ (meshNode t₀ h n) (z n) (h n)‖ ≤ h n * τ)
    (hY : ∀ n < N, ‖Y (n + 1) - Y n - h n • Φ (meshNode t₀ h n) (Y n) (h n)‖ ≤ ρ n)
    {n : ℕ} (hn : n ≤ N) :
    ‖z n - Y n‖ ≤
      gronwallBound (‖z 0 - Y 0‖ + ∑ k ∈ Finset.range n, ρ k) L τ (meshNode t₀ h n - t₀) :=
  sorry

/-- 1.4: the convergence theorem. A one-step method whose defect along `y` is at most
`C * s ^ (p + 1)` and whose increment function is `L`-Lipschitz has global error at most
`gronwallBound ‖y t₀ - y₀‖ L (C * hmax ^ p) (t n - t₀)` on every mesh with steps in
`[0, hmax]`. -/
theorem norm_sub_oneStepSeq_le {Φ : ℝ → E → ℝ → E} {y : ℝ → E} {t₀ b hmax C : ℝ} {L : ℝ≥0}
    {p N : ℕ} {h : ℕ → ℝ} (y₀ : E) (hh : ∀ n < N, 0 ≤ h n ∧ h n ≤ hmax)
    (hb : meshNode t₀ h N ≤ b)
    (hΦ : ∀ n < N, LipschitzWith L fun u ↦ Φ (meshNode t₀ h n) u (h n))
    (hdef : ∀ t s, t₀ ≤ t → 0 ≤ s → s ≤ hmax → t + s ≤ b →
      ‖oneStepDefect Φ y t s‖ ≤ C * s ^ (p + 1))
    {n : ℕ} (hn : n ≤ N) :
    ‖y (meshNode t₀ h n) - oneStepSeq Φ t₀ h y₀ n‖ ≤
      gronwallBound ‖y t₀ - y₀‖ L (C * hmax ^ p) (meshNode t₀ h n - t₀) :=
  sorry

/-- 1.5: a consistent one-step method with continuous, Lipschitz increment function converges on
every family of meshes whose largest step tends to `0`. -/
theorem exists_forall_norm_sub_oneStepSeq_le_of_consistent {f : ℝ → E → E} {Φ : ℝ → E → ℝ → E}
    {y : ℝ → E} {a b h₀ : ℝ} {L : ℝ≥0} (hh₀ : 0 < h₀) (hy : IsIntegralCurveOn y f (Icc a b))
    (hcont : Continuous fun q : ℝ × E × ℝ ↦ Φ q.1 q.2.1 q.2.2)
    (hcons : ∀ t u, Φ t u 0 = f t u)
    (hΦ : ∀ t s, 0 ≤ s → s ≤ h₀ → LipschitzWith L fun u ↦ Φ t u s)
    {ε : ℝ} (hε : 0 < ε) :
    ∃ δ > 0, ∀ (h : ℕ → ℝ) (N : ℕ), (∀ n < N, 0 ≤ h n ∧ h n ≤ δ) → meshNode a h N ≤ b →
      ∀ n ≤ N, ‖y (meshNode a h n) - oneStepSeq Φ a h (y a) n‖ ≤ ε :=
  sorry

/-! ## Layer 2: Runge–Kutta methods -/

/-- 2.1: a Butcher tableau with `s` stages: the matrix `A`, the weights `b` and the nodes `c`. -/
structure ButcherTableau (s : ℕ) where
  /-- The Runge–Kutta matrix. -/
  A : Matrix (Fin s) (Fin s) ℝ
  /-- The weights. -/
  b : Fin s → ℝ
  /-- The nodes. -/
  c : Fin s → ℝ

namespace ButcherTableau

variable {s : ℕ} (T : ButcherTableau s)

/-- 2.1: the tableau is explicit: `A` is strictly lower triangular. -/
def IsExplicit : Prop := ∀ i j, i ≤ j → T.A i j = 0

/-- 2.1: `k` solves the stage equations `k i = f (t + c i * h) (y + h • ∑ j, A i j • k j)`. -/
def IsStage (f : ℝ → E → E) (t : ℝ) (y : E) (h : ℝ) (k : Fin s → E) : Prop :=
  ∀ i, k i = f (t + T.c i * h) (y + h • ∑ j, T.A i j • k j)

/-- 2.1: the stage vector: the unique solution of the stage equations when there is exactly
one, and `0` otherwise. -/
def stages (f : ℝ → E → E) (t : ℝ) (y : E) (h : ℝ) : Fin s → E := by
  classical exact if hk : ∃! k, T.IsStage f t y h k then hk.choose else 0

/-- 2.1: the increment function `∑ i, b i • k i` of the Runge–Kutta method. -/
def increment (f : ℝ → E → E) (t : ℝ) (y : E) (h : ℝ) : E := ∑ i, T.b i • T.stages f t y h i

/-- 2.2: the Lipschitz constant in `y` of the increment function of an explicit method, for a
field that is `L`-Lipschitz in `y` and a step of size `h`: `L * |b|ᵀ (∑ m < s, (h L |A|) ^ m) 𝟙`. -/
def explicitLipschitzConst (L h : ℝ) : ℝ :=
  L * ∑ i, |T.b i| *
    ((∑ m ∈ Finset.range s, (h * L) ^ m • (T.A.map fun x ↦ |x|) ^ m) *ᵥ fun _ ↦ (1 : ℝ)) i

/-- 2.1: an explicit tableau has exactly one stage vector, for every field, point and step. -/
theorem existsUnique_isStage_of_isExplicit (hT : T.IsExplicit) (f : ℝ → E → E) (t : ℝ) (y : E)
    (h : ℝ) : ∃! k, T.IsStage f t y h k :=
  sorry

/-- 2.2: the increment function of an explicit method is Lipschitz in `y` with constant
`explicitLipschitzConst`. -/
theorem norm_increment_sub_le_of_isExplicit (hT : T.IsExplicit) {f : ℝ → E → E} {L : ℝ≥0}
    (hf : ∀ t, LipschitzWith L (f t)) (t h : ℝ) (y y' : E) :
    ‖T.increment f t y h - T.increment f t y' h‖ ≤ T.explicitLipschitzConst L |h| * ‖y - y'‖ :=
  sorry

/-- 2.3: for a field that is `L`-Lipschitz in `y` on a Banach space, the stage equations have
exactly one solution as soon as `|h| * L * α < 1`, where `α` bounds the absolute row sums of
`A`. -/
theorem existsUnique_isStage [CompleteSpace E] {f : ℝ → E → E} {L : ℝ≥0} {α h : ℝ}
    (hα : ∀ i, ∑ j, |T.A i j| ≤ α) (hf : ∀ t, LipschitzWith L (f t)) (hsmall : |h| * L * α < 1)
    (t : ℝ) (y : E) : ∃! k, T.IsStage f t y h k :=
  sorry

/-- 2.3: the increment function of any Runge–Kutta method is Lipschitz in `y` with constant
`L * ∑ i, |b i| / (1 - |h| * L * α)` when `|h| * L * α < 1`. -/
theorem norm_increment_sub_le [CompleteSpace E] {f : ℝ → E → E} {L : ℝ≥0} {α h : ℝ}
    (hα : ∀ i, ∑ j, |T.A i j| ≤ α) (hf : ∀ t, LipschitzWith L (f t)) (hsmall : |h| * L * α < 1)
    (t : ℝ) (y y' : E) :
    ‖T.increment f t y h - T.increment f t y' h‖ ≤
      L * (∑ i, |T.b i|) / (1 - |h| * L * α) * ‖y - y'‖ :=
  sorry

end ButcherTableau

open ButcherTableau

/-! ## Layer 3: Euler, midpoint and trapezoidal methods with explicit constants -/

/-- 3.1: the explicit Euler method. -/
def explicitEuler : ButcherTableau 1 := ⟨!![0], ![1], ![0]⟩

/-- 3.2: the explicit midpoint method (modified Euler method). -/
def explicitMidpoint : ButcherTableau 2 := ⟨!![0, 0; 1 / 2, 0], ![0, 1], ![0, 1 / 2]⟩

/-- 3.2: the explicit trapezoidal method (improved Euler method), often called Heun's method. -/
def heun : ButcherTableau 2 := ⟨!![0, 0; 1, 0], ![1 / 2, 1 / 2], ![0, 1]⟩

/-- 3.3: the implicit Euler method. -/
def implicitEuler : ButcherTableau 1 := ⟨!![1], ![1], ![1]⟩

/-- 3.3: the implicit midpoint method. -/
def implicitMidpoint : ButcherTableau 1 := ⟨!![1 / 2], ![1], ![1 / 2]⟩

/-- 3.3: the trapezoidal rule. -/
def trapezoid : ButcherTableau 2 := ⟨!![0, 0; 1 / 2, 1 / 2], ![1 / 2, 1 / 2], ![0, 1]⟩

/-- 3.1: the global error of the explicit Euler method on a mesh with steps in `[0, hmax]`, for
a solution whose derivative is `M`-Lipschitz: `e ^ (L (t n - a)) ‖e 0‖ +
M hmax / (2 L) (e ^ (L (t n - a)) - 1)`, in the form of `gronwallBound`. -/
theorem explicitEuler_error_le {f : ℝ → E → E} {y : ℝ → E} {a b hmax : ℝ} {L M : ℝ≥0}
    {h : ℕ → ℝ} {N : ℕ} (y₀ : E) (hy : IsIntegralCurveOn y f (Icc a b))
    (hf : ∀ t, LipschitzWith L (f t)) (hM : LipschitzOnWith M (fun r ↦ f r (y r)) (Icc a b))
    (hh : ∀ n < N, 0 ≤ h n ∧ h n ≤ hmax) (hb : meshNode a h N ≤ b) {n : ℕ} (hn : n ≤ N) :
    ‖y (meshNode a h n) - oneStepSeq (explicitEuler.increment f) a h y₀ n‖ ≤
      gronwallBound ‖y a - y₀‖ L (M * hmax / 2) (meshNode a h n - a) :=
  sorry

/-- 3.2: the defect of the explicit trapezoidal method along a solution whose derivative is
`M₂`-Lipschitz and whose second derivative `y₂` is `M₃`-Lipschitz. -/
theorem heun_defect_le {f : ℝ → E → E} {y y₂ : ℝ → E} {a b t h : ℝ} {L M₂ M₃ : ℝ≥0}
    (hy : IsIntegralCurveOn y f (Icc a b)) (hf : ∀ r, LipschitzWith L (f r))
    (hM₂ : LipschitzOnWith M₂ (fun r ↦ f r (y r)) (Icc a b))
    (hy₂ : ∀ r ∈ Icc a b, HasDerivWithinAt (fun r ↦ f r (y r)) (y₂ r) (Icc a b) r)
    (hM₃ : LipschitzOnWith M₃ y₂ (Icc a b)) (ht : a ≤ t) (hh : 0 ≤ h) (hth : t + h ≤ b) :
    ‖oneStepDefect (heun.increment f) y t h‖ ≤ (M₃ / 12 + L * M₂ / 4) * h ^ 3 :=
  sorry

/-- 3.2: the defect of the explicit midpoint method, under the hypotheses of `heun_defect_le`. -/
theorem explicitMidpoint_defect_le {f : ℝ → E → E} {y y₂ : ℝ → E} {a b t h : ℝ}
    {L M₂ M₃ : ℝ≥0} (hy : IsIntegralCurveOn y f (Icc a b)) (hf : ∀ r, LipschitzWith L (f r))
    (hM₂ : LipschitzOnWith M₂ (fun r ↦ f r (y r)) (Icc a b))
    (hy₂ : ∀ r ∈ Icc a b, HasDerivWithinAt (fun r ↦ f r (y r)) (y₂ r) (Icc a b) r)
    (hM₃ : LipschitzOnWith M₃ y₂ (Icc a b)) (ht : a ≤ t) (hh : 0 ≤ h) (hth : t + h ≤ b) :
    ‖oneStepDefect (explicitMidpoint.increment f) y t h‖ ≤ (M₃ / 24 + L * M₂ / 8) * h ^ 3 :=
  sorry

/-- 3.3: the defect of the implicit Euler method for `h * L < 1`. -/
theorem implicitEuler_defect_le [CompleteSpace E] {f : ℝ → E → E} {y : ℝ → E} {a b t h : ℝ}
    {L M₂ : ℝ≥0} (hy : IsIntegralCurveOn y f (Icc a b)) (hf : ∀ r, LipschitzWith L (f r))
    (hM₂ : LipschitzOnWith M₂ (fun r ↦ f r (y r)) (Icc a b)) (ht : a ≤ t) (hh : 0 ≤ h)
    (hth : t + h ≤ b) (hL : h * L < 1) :
    ‖oneStepDefect (implicitEuler.increment f) y t h‖ ≤ M₂ * h ^ 2 / (2 * (1 - h * L)) :=
  sorry

/-- 3.3: the defect of the implicit midpoint method for `h * L < 2`. -/
theorem implicitMidpoint_defect_le [CompleteSpace E] {f : ℝ → E → E} {y y₂ : ℝ → E}
    {a b t h : ℝ} {L M₂ M₃ : ℝ≥0} (hy : IsIntegralCurveOn y f (Icc a b))
    (hf : ∀ r, LipschitzWith L (f r))
    (hM₂ : LipschitzOnWith M₂ (fun r ↦ f r (y r)) (Icc a b))
    (hy₂ : ∀ r ∈ Icc a b, HasDerivWithinAt (fun r ↦ f r (y r)) (y₂ r) (Icc a b) r)
    (hM₃ : LipschitzOnWith M₃ y₂ (Icc a b)) (ht : a ≤ t) (hh : 0 ≤ h) (hth : t + h ≤ b)
    (hL : h * L < 2) :
    ‖oneStepDefect (implicitMidpoint.increment f) y t h‖ ≤
      (M₃ / 24 + L * M₂ / 8) * h ^ 3 / (1 - h * L / 2) :=
  sorry

/-- 3.3: the defect of the trapezoidal rule for `h * L < 2`. -/
theorem trapezoid_defect_le [CompleteSpace E] {f : ℝ → E → E} {y y₂ : ℝ → E} {a b t h : ℝ}
    {L M₃ : ℝ≥0} (hy : IsIntegralCurveOn y f (Icc a b)) (hf : ∀ r, LipschitzWith L (f r))
    (hy₂ : ∀ r ∈ Icc a b, HasDerivWithinAt (fun r ↦ f r (y r)) (y₂ r) (Icc a b) r)
    (hM₃ : LipschitzOnWith M₃ y₂ (Icc a b)) (ht : a ≤ t) (hh : 0 ≤ h) (hth : t + h ≤ b)
    (hL : h * L < 2) :
    ‖oneStepDefect (trapezoid.increment f) y t h‖ ≤ M₃ * h ^ 3 / (12 * (1 - h * L / 2)) :=
  sorry

/-! ## Layer 4: order conditions through order four -/

namespace ButcherTableau

variable {s : ℕ} (T : ButcherTableau s)

/-- 4.1: the order conditions of the rooted trees with at most `min p 4` vertices: one for
`p = 1`, two for `p = 2`, four for `p = 3` and eight for `p ≥ 4`. -/
def OrderConditions (p : ℕ) : Prop :=
  (1 ≤ p → ∑ i, T.b i = 1) ∧
  (2 ≤ p → ∑ i, T.b i * T.c i = 1 / 2) ∧
  (3 ≤ p → ∑ i, T.b i * T.c i ^ 2 = 1 / 3 ∧ ∑ i, T.b i * (T.A *ᵥ T.c) i = 1 / 6) ∧
  (4 ≤ p → ∑ i, T.b i * T.c i ^ 3 = 1 / 4 ∧ ∑ i, T.b i * T.c i * (T.A *ᵥ T.c) i = 1 / 8 ∧
    ∑ i, T.b i * (T.A *ᵥ fun j ↦ T.c j ^ 2) i = 1 / 12 ∧
    ∑ i, T.b i * (T.A *ᵥ (T.A *ᵥ T.c)) i = 1 / 24)

/-- 4.2: the method has order at least `p`: along every solution of every smooth system on a
Euclidean space `ℝ^d`, the one-step defect is `O(h ^ (p + 1))` uniformly on the interval. -/
def HasOrder (p : ℕ) : Prop :=
  ∀ (d : ℕ) (f : ℝ → EuclideanSpace ℝ (Fin d) → EuclideanSpace ℝ (Fin d))
    (y : ℝ → EuclideanSpace ℝ (Fin d)) (a b : ℝ),
    ContDiff ℝ ∞ (Function.uncurry f) → IsIntegralCurveOn y f (Icc a b) →
    ∃ C : ℝ, ∀ t h, a ≤ t → 0 ≤ h → t + h ≤ b →
      ‖oneStepDefect (T.increment f) y t h‖ ≤ C * h ^ (p + 1)

/-- 4.2: the order conditions are sufficient: for an explicit tableau with `c = A 𝟙` satisfying
the order conditions through `p ≤ 4`, and a field of class `C ^ p` on a real normed space, the
defect along every solution is `O(h ^ (p + 1))`. -/
theorem exists_norm_oneStepDefect_le_of_orderConditions (hT : T.IsExplicit)
    (hc : ∀ i, T.c i = ∑ j, T.A i j) {p : ℕ} (hp : p ≤ 4) (hord : T.OrderConditions p)
    {f : ℝ → E → E} {y : ℝ → E} {a b : ℝ} (hf : ContDiff ℝ p (Function.uncurry f))
    (hy : IsIntegralCurveOn y f (Icc a b)) :
    ∃ C : ℝ, ∀ t h, a ≤ t → 0 ≤ h → t + h ≤ b →
      ‖oneStepDefect (T.increment f) y t h‖ ≤ C * h ^ (p + 1) :=
  sorry

/-- 4.3: for an explicit tableau with `c = A 𝟙` and `p ≤ 4`, order at least `p` is equivalent to
the order conditions through `p`. -/
theorem hasOrder_iff_orderConditions (hT : T.IsExplicit) (hc : ∀ i, T.c i = ∑ j, T.A i j)
    {p : ℕ} (hp : p ≤ 4) : T.HasOrder p ↔ T.OrderConditions p :=
  sorry

end ButcherTableau

/-- 4.4: the classical fourth-order Runge–Kutta method. -/
def rk4 : ButcherTableau 4 :=
  ⟨!![0, 0, 0, 0; 1 / 2, 0, 0, 0; 0, 1 / 2, 0, 0; 0, 0, 1, 0], ![1 / 6, 1 / 3, 1 / 3, 1 / 6],
    ![0, 1 / 2, 1 / 2, 1]⟩

/-- 4.4: the classical Runge–Kutta method has order exactly four. -/
theorem rk4_hasOrder : rk4.HasOrder 4 ∧ ¬ rk4.HasOrder 5 :=
  sorry

/-! ## Layer 5: linear stability -/

namespace ButcherTableau

variable {s : ℕ} (T : ButcherTableau s)

/-- 5.1: the stability function `R z = 1 + z bᵀ (1 - z A)⁻¹ 𝟙`. Where `1 - z A` is singular the
matrix inverse is Mathlib's junk value `0`, and `R z = 1`. -/
def stabilityFunction (z : ℂ) : ℂ :=
  1 + z * ∑ i, (T.b i : ℂ) *
    (((1 : Matrix (Fin s) (Fin s) ℂ) - z • T.A.map (algebraMap ℝ ℂ))⁻¹ *ᵥ fun _ ↦ (1 : ℂ)) i

/-- 5.2: the stability region: the `z` at which `1 - z A` is invertible and `‖R z‖ ≤ 1`. -/
def stabilityRegion : Set ℂ :=
  {z | ((1 : Matrix (Fin s) (Fin s) ℂ) - z • T.A.map (algebraMap ℝ ℂ)).det ≠ 0 ∧
    ‖T.stabilityFunction z‖ ≤ 1}

/-- 5.2: A-stability: the stability region contains the closed left half-plane. -/
def IsAStable : Prop := {z : ℂ | z.re ≤ 0} ⊆ T.stabilityRegion

/-- 5.2: L-stability: A-stability together with `R z → 0` as `z → ∞`. -/
def IsLStable : Prop :=
  T.IsAStable ∧ Tendsto (fun z ↦ ‖T.stabilityFunction z‖) (cocompact ℂ) (𝓝 0)

/-- 5.1: on the linear test equation `y' = lam * y` one step of a Runge–Kutta method multiplies
by `R (h * lam)`. -/
theorem add_smul_sum_eq_stabilityFunction_mul {lam y : ℂ} {t h : ℝ} {k : Fin s → ℂ}
    (hdet : ((1 : Matrix (Fin s) (Fin s) ℂ) - (h * lam) • T.A.map (algebraMap ℝ ℂ)).det ≠ 0)
    (hk : T.IsStage (fun _ u ↦ lam * u) t y h k) :
    y + h • ∑ i, T.b i • k i = T.stabilityFunction (h * lam) * y :=
  sorry

/-- 5.1: an explicit method with `s ≤ 4` stages satisfying the order conditions through `s` has
stability function `∑ k ≤ s, z ^ k / k !`. -/
theorem stabilityFunction_eq_sum_of_orderConditions (hT : T.IsExplicit)
    (hc : ∀ i, T.c i = ∑ j, T.A i j) (hs : s ≤ 4) (hord : T.OrderConditions s) (z : ℂ) :
    T.stabilityFunction z = ∑ k ∈ Finset.range (s + 1), z ^ k / (k.factorial : ℂ) :=
  sorry

/-- 5.3: the stability region of an explicit method with `∑ i, b i = 1` is bounded; in
particular no such method is A-stable. -/
theorem isBounded_stabilityRegion_of_isExplicit (hT : T.IsExplicit) (hb : ∑ i, T.b i = 1) :
    Bornology.IsBounded T.stabilityRegion :=
  sorry

/-- 5.4: an explicit method with `s` stages does not have order greater than `s`. -/
theorem not_hasOrder_of_isExplicit (hT : T.IsExplicit) {p : ℕ} (hp : s < p) : ¬ T.HasOrder p :=
  sorry

end ButcherTableau

/-- 5.2: the stability region of the explicit Euler method is the closed disc of radius `1`
centred at `-1`. -/
theorem stabilityRegion_explicitEuler :
    explicitEuler.stabilityRegion = Metric.closedBall (-1 : ℂ) 1 :=
  sorry

/-- 5.2: the stability region of the implicit midpoint method is the closed left half-plane. -/
theorem stabilityRegion_implicitMidpoint :
    implicitMidpoint.stabilityRegion = {z : ℂ | z.re ≤ 0} :=
  sorry

/-- 5.2: the implicit Euler method is L-stable. -/
theorem implicitEuler_isLStable : implicitEuler.IsLStable :=
  sorry

/-! ## Layer 6: contractivity and structure preservation -/

section Contractivity

variable {F : Type*} [NormedAddCommGroup F] [InnerProductSpace ℝ F]

/-- 6.1: the implicit Euler method on a field with one-sided Lipschitz constant `μ`: two steps
from `y` and `y'` differ by at most `‖y - y'‖ / (1 - h * μ)`. -/
theorem implicitEuler_norm_sub_le {f : ℝ → F → F} {μ t h : ℝ} {y y' : F} {k k' : Fin 1 → F}
    (hf : ∀ r u v, ⟪f r u - f r v, u - v⟫_ℝ ≤ μ * ‖u - v‖ ^ 2) (hh : 0 ≤ h) (hμ : h * μ < 1)
    (hk : implicitEuler.IsStage f t y h k) (hk' : implicitEuler.IsStage f t y' h k') :
    ‖(y + h • ∑ i, implicitEuler.b i • k i) - (y' + h • ∑ i, implicitEuler.b i • k' i)‖ ≤
      ‖y - y'‖ / (1 - h * μ) :=
  sorry

/-- 6.1: the implicit midpoint method on a field with one-sided Lipschitz constant `μ ≥ 0`: two
steps from `y` and `y'` differ by at most `(1 + h μ / 2) / (1 - h μ / 2) * ‖y - y'‖`. -/
theorem implicitMidpoint_norm_sub_le {f : ℝ → F → F} {μ t h : ℝ} {y y' : F} {k k' : Fin 1 → F}
    (hf : ∀ r u v, ⟪f r u - f r v, u - v⟫_ℝ ≤ μ * ‖u - v‖ ^ 2) (hh : 0 ≤ h) (hμ₀ : 0 ≤ μ)
    (hμ : h * μ < 2) (hk : implicitMidpoint.IsStage f t y h k)
    (hk' : implicitMidpoint.IsStage f t y' h k') :
    ‖(y + h • ∑ i, implicitMidpoint.b i • k i) -
        (y' + h • ∑ i, implicitMidpoint.b i • k' i)‖ ≤
      (1 + h * μ / 2) / (1 - h * μ / 2) * ‖y - y'‖ :=
  sorry

end Contractivity

namespace ButcherTableau

variable {s : ℕ} (T : ButcherTableau s)

/-- 6.2: Cooper's theorem. A Runge–Kutta method with `b i * A i j + b j * A j i = b i * b j`
preserves every quadratic invariant `u ↦ B u u` of the field. -/
theorem bilin_add_smul_sum_eq_of_isStage
    (hT : ∀ i j, T.b i * T.A i j + T.b j * T.A j i = T.b i * T.b j)
    (B : LinearMap.BilinForm ℝ E) {f : ℝ → E → E} (hB : ∀ t u, B (f t u) u + B u (f t u) = 0)
    {t h : ℝ} {y : E} {k : Fin s → E} (hk : T.IsStage f t y h k) :
    B (y + h • ∑ i, T.b i • k i) (y + h • ∑ i, T.b i • k i) = B y y :=
  sorry

/-- 6.3: a Runge–Kutta method with `b i * A i j + b j * A j i = b i * b j` is symplectic: for a
`C²` Hamiltonian with `L`-Lipschitz Hamiltonian vector field and `|h| * L * α < 1`, the derivative
of the step map preserves the symplectic form. -/
theorem symplecticForm_fderiv_step_eq {V : Type*} [NormedAddCommGroup V] [NormedSpace ℝ V]
    [FiniteDimensional ℝ V] (ω₀ : TauCeti.SymplecticForm V) {H : V → ℝ} {L : ℝ≥0} {α h : ℝ}
    (hT : ∀ i j, T.b i * T.A i j + T.b j * T.A j i = T.b i * T.b j)
    (hα : ∀ i, ∑ j, |T.A i j| ≤ α) (hH : ContDiff ℝ 2 H)
    (hX : LipschitzWith L (ω₀.hamiltonianVectorField H)) (hsmall : |h| * L * α < 1)
    (t : ℝ) (y u v : V) :
    ω₀ (fderiv ℝ (fun x ↦ x + h • T.increment (fun _ ↦ ω₀.hamiltonianVectorField H) t x h) y u)
        (fderiv ℝ (fun x ↦ x + h • T.increment (fun _ ↦ ω₀.hamiltonianVectorField H) t x h) y v) =
      ω₀ u v :=
  sorry

end ButcherTableau

end TauCetiRoadmap.OneStepMethodsForODEs
