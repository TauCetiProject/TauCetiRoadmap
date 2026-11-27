module

public import Mathlib

/-!
# Runge–Kutta order theory and B-series: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is `README.md`.
This file states the headlines of `README.md` that carry a Lean name, each with every conclusion
the README attaches to it, against the pinned Mathlib and Tau Ceti, with `sorry` proofs and the
definitions they need; every definition has a real body. These are suggested forms; the README's
other headlines are targets of the same standing, stated in prose.

Conventions (README, Conventions). A field is `f : ℝ → E → E` (time first) or, for autonomous
problems, `f : E → E`, on a real normed space `E`. Rooted trees are unordered: `OrderedTree` is the
type of finite trees with ordered children, `OrderedTree.Swap` reorders the children of one vertex,
and `ButcherTree` is the quotient `Quot OrderedTree.Swap`. Functions on `ButcherTree` are defined by
evaluating the corresponding function on the representative `Quot.out`; the theorems `*_mk` say
that every representative gives the same value. B-series use the normalization
`B(a, y) = a(∅) y + ∑ h^|t| a(t) F(t)(y) / σ(t)`, with the empty tree `∅` written `none`.

Local copies. `meshNode`, `oneStepSeq`, `oneStepDefect`, `ButcherTableau`,
`ButcherTableau.IsExplicit`, `ButcherTableau.IsStage`, `ButcherTableau.stages`,
`ButcherTableau.increment`, `ButcherTableau.OrderConditions` and `ButcherTableau.HasOrder` are
verbatim copies of the definitions of the OneStepMethodsForODEs roadmap (§§1.1, 1.2, 2.1, 4.1,
4.2), each with a docstring naming its section.
-/

@[expose] public section

noncomputable section

open Filter Topology Set Asymptotics Polynomial
open scoped ContDiff Matrix NNReal

namespace TauCetiRoadmap.RungeKuttaOrderTheoryAndBSeries

attribute [local instance] Classical.propDecidable

/-! ## Local copies from OneStepMethodsForODEs -/

section LocalCopies

variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]

/-- Local copy of OneStepMethodsForODEs §1.1: the `n`-th node `t₀ + h 0 + ⋯ + h (n - 1)` of the
mesh with first node `t₀` and steps `h`. -/
def meshNode (t₀ : ℝ) (h : ℕ → ℝ) (n : ℕ) : ℝ := t₀ + ∑ i ∈ Finset.range n, h i

/-- Local copy of OneStepMethodsForODEs §1.2: the numerical solution of the one-step method with
increment function `Φ`: `Y (n + 1) = Y n + h n • Φ (t n) (Y n) (h n)`. -/
def oneStepSeq (Φ : ℝ → E → ℝ → E) (t₀ : ℝ) (h : ℕ → ℝ) (y₀ : E) : ℕ → E
  | 0 => y₀
  | n + 1 => oneStepSeq Φ t₀ h y₀ n + h n • Φ (meshNode t₀ h n) (oneStepSeq Φ t₀ h y₀ n) (h n)

/-- Local copy of OneStepMethodsForODEs §1.2: the one-step defect of a curve `y` at `t` with
step `h`. -/
def oneStepDefect (Φ : ℝ → E → ℝ → E) (y : ℝ → E) (t h : ℝ) : E :=
  y (t + h) - y t - h • Φ t (y t) h

/-- Local copy of OneStepMethodsForODEs §2.1: a Butcher tableau with `s` stages. -/
structure ButcherTableau (s : ℕ) where
  /-- The Runge–Kutta matrix. -/
  A : Matrix (Fin s) (Fin s) ℝ
  /-- The weights. -/
  b : Fin s → ℝ
  /-- The nodes. -/
  c : Fin s → ℝ

namespace ButcherTableau

variable {s : ℕ} (T : ButcherTableau s)

/-- Local copy of OneStepMethodsForODEs §2.1: `A` is strictly lower triangular. -/
def IsExplicit : Prop := ∀ i j, i ≤ j → T.A i j = 0

/-- Local copy of OneStepMethodsForODEs §2.1: the stage equations
`k i = f (t + c i * h) (y + h • ∑ j, A i j • k j)`. -/
def IsStage (f : ℝ → E → E) (t : ℝ) (y : E) (h : ℝ) (k : Fin s → E) : Prop :=
  ∀ i, k i = f (t + T.c i * h) (y + h • ∑ j, T.A i j • k j)

/-- Local copy of OneStepMethodsForODEs §2.1: the unique stage vector, and `0` otherwise. -/
def stages (f : ℝ → E → E) (t : ℝ) (y : E) (h : ℝ) : Fin s → E := by
  classical exact if hk : ∃! k, T.IsStage f t y h k then hk.choose else 0

/-- Local copy of OneStepMethodsForODEs §2.1: the increment function `∑ i, b i • k i`. -/
def increment (f : ℝ → E → E) (t : ℝ) (y : E) (h : ℝ) : E := ∑ i, T.b i • T.stages f t y h i

/-- Local copy of OneStepMethodsForODEs §4.1: the order conditions through `min p 4`. -/
def OrderConditions (p : ℕ) : Prop :=
  (1 ≤ p → ∑ i, T.b i = 1) ∧
  (2 ≤ p → ∑ i, T.b i * T.c i = 1 / 2) ∧
  (3 ≤ p → ∑ i, T.b i * T.c i ^ 2 = 1 / 3 ∧ ∑ i, T.b i * (T.A *ᵥ T.c) i = 1 / 6) ∧
  (4 ≤ p → ∑ i, T.b i * T.c i ^ 3 = 1 / 4 ∧ ∑ i, T.b i * T.c i * (T.A *ᵥ T.c) i = 1 / 8 ∧
    ∑ i, T.b i * (T.A *ᵥ fun j ↦ T.c j ^ 2) i = 1 / 12 ∧
    ∑ i, T.b i * (T.A *ᵥ (T.A *ᵥ T.c)) i = 1 / 24)

/-- Local copy of OneStepMethodsForODEs §4.2: order at least `p`, uniformly along every solution
of every smooth system on `ℝ^d`. -/
def HasOrder (p : ℕ) : Prop :=
  ∀ (d : ℕ) (f : ℝ → EuclideanSpace ℝ (Fin d) → EuclideanSpace ℝ (Fin d))
    (y : ℝ → EuclideanSpace ℝ (Fin d)) (a b : ℝ),
    ContDiff ℝ ∞ (Function.uncurry f) → IsIntegralCurveOn y f (Icc a b) →
    ∃ C : ℝ, ∀ t h, a ≤ t → 0 ≤ h → t + h ≤ b →
      ‖oneStepDefect (T.increment f) y t h‖ ≤ C * h ^ (p + 1)

end ButcherTableau

end LocalCopies

open ButcherTableau

/-! ## Layer 1: Euler polygons in a Lipschitz rectangle -/

section EulerPolygons

variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]

/-- 1.1: the Euler polygon of `f` on the mesh with first node `t₀`, steps `h` and `N` steps,
started at `y₀`: on `[t_k, t_(k+1)]` it is `Y k + (t - t_k) • f t_k (Y k)`, with `Y` the explicit
Euler values. -/
def eulerPolygon (f : ℝ → E → E) (t₀ : ℝ) (h : ℕ → ℝ) (y₀ : E) (N : ℕ) (t : ℝ) : E :=
  y₀ + ∑ k ∈ Finset.range N, min (max (t - meshNode t₀ h k) 0) (h k) •
    f (meshNode t₀ h k) (oneStepSeq (fun r u _ ↦ f r u) t₀ h y₀ k)

/-- 1.1: on `D = [t₀, t₀ + a] × closedBall y₀ b` with `‖f‖ ≤ A`, `0 ≤ A` and `A a ≤ b`, the Euler
values and the Euler polygon stay in the ball, with `‖y_h(t) - y₀‖ ≤ A (t - t₀)`, on every mesh of
`[t₀, t₀ + a]` with nonnegative steps. -/
theorem eulerPolygon_mem_closedBall {f : ℝ → E → E} {t₀ a b A : ℝ} {y₀ : E} (hA : 0 ≤ A)
    (hAa : A * a ≤ b)
    (hbd : ∀ t ∈ Icc t₀ (t₀ + a), ∀ u ∈ Metric.closedBall y₀ b, ‖f t u‖ ≤ A)
    {h : ℕ → ℝ} {N : ℕ} (hh : ∀ k < N, 0 ≤ h k) (hN : meshNode t₀ h N ≤ t₀ + a) :
    (∀ n ≤ N, oneStepSeq (fun r u _ ↦ f r u) t₀ h y₀ n ∈ Metric.closedBall y₀ b) ∧
      ∀ t ∈ Icc t₀ (meshNode t₀ h N), ‖eulerPolygon f t₀ h y₀ N t - y₀‖ ≤ A * (t - t₀) :=
  sorry

/-- 1.2: in the Lipschitz rectangle the Euler polygons converge uniformly, as the largest step
tends to `0`, to a solution with graph in the rectangle. -/
theorem exists_eulerPolygon_uniform_limit [CompleteSpace E] {f : ℝ → E → E} {t₀ a b A : ℝ}
    {L : ℝ≥0} {y₀ : E} (hA : 0 ≤ A) (hAa : A * a ≤ b)
    (hf : ContinuousOn (Function.uncurry f) (Icc t₀ (t₀ + a) ×ˢ Metric.closedBall y₀ b))
    (hbd : ∀ t ∈ Icc t₀ (t₀ + a), ∀ u ∈ Metric.closedBall y₀ b, ‖f t u‖ ≤ A)
    (hL : ∀ t ∈ Icc t₀ (t₀ + a), LipschitzOnWith L (f t) (Metric.closedBall y₀ b)) :
    ∃ y : ℝ → E, y t₀ = y₀ ∧ (∀ t ∈ Icc t₀ (t₀ + a), y t ∈ Metric.closedBall y₀ b) ∧
      IsIntegralCurveOn y f (Icc t₀ (t₀ + a)) ∧
      ∀ ε > 0, ∃ δ > 0, ∀ (h : ℕ → ℝ) (N : ℕ), (∀ k < N, 0 ≤ h k ∧ h k ≤ δ) →
        meshNode t₀ h N = t₀ + a →
        ∀ t ∈ Icc t₀ (t₀ + a), ‖eulerPolygon f t₀ h y₀ N t - y t‖ ≤ ε :=
  sorry

end EulerPolygons

/-! ## Layer 2: rooted trees -/

/-- 2.1: finite trees whose children are ordered: a root with `m` children. -/
inductive OrderedTree : Type
  | node (m : ℕ) (child : Fin m → OrderedTree)

namespace OrderedTree

/-- 2.1: the order `|t|`, the number of vertices. -/
def order : OrderedTree → ℕ
  | node _ ch => 1 + ∑ i, order (ch i)

/-- 2.1: the density `γ(t)`, `|t| γ(t₁) ⋯ γ(t_m)`. -/
def density : OrderedTree → ℕ
  | node m ch => order (node m ch) * ∏ i, density (ch i)

/-- 2.1: the product of the factorials of the numbers of children over all vertices. -/
def orderedWeight : OrderedTree → ℕ
  | node m ch => m.factorial * ∏ i, orderedWeight (ch i)

/-- 2.1: one reordering step: permute the children of the root, or reorder inside one child. -/
inductive Swap : OrderedTree → OrderedTree → Prop
  | perm {m : ℕ} (ch : Fin m → OrderedTree) (e : Equiv.Perm (Fin m)) :
      Swap (node m ch) (node m (ch ∘ e))
  | child {m : ℕ} (ch : Fin m → OrderedTree) (i : Fin m) {t : OrderedTree} (h : Swap (ch i) t) :
      Swap (node m ch) (node m (Function.update ch i t))

end OrderedTree

/-- 2.1: rooted trees: ordered trees up to reordering of children. -/
def ButcherTree : Type := Quot OrderedTree.Swap

namespace ButcherTree

/-- 2.1: the rooted tree of an ordered tree. -/
def mk (t : OrderedTree) : ButcherTree := Quot.mk _ t

/-- 2.1: a chosen ordered representative. -/
def out (t : ButcherTree) : OrderedTree := Quot.out t

end ButcherTree

namespace OrderedTree

/-- 2.1: the symmetry `σ(t) = σ(t₁) ⋯ σ(t_m) · μ₁! μ₂! ⋯`, the `μ` counting equal subtrees,
written as `∏ i, #{j ≤ i | t_j = t_i}`. -/
def symmetry : OrderedTree → ℕ
  | node m ch => (∏ i, symmetry (ch i)) *
      ∏ i : Fin m, (Finset.univ.filter fun j : Fin m ↦
        j ≤ i ∧ ButcherTree.mk (ch j) = ButcherTree.mk (ch i)).card

end OrderedTree

namespace ButcherTree

/-- 2.1: the order of a rooted tree. -/
def order (t : ButcherTree) : ℕ := t.out.order

/-- 2.1: the density of a rooted tree. -/
def density (t : ButcherTree) : ℕ := t.out.density

/-- 2.1: the symmetry of a rooted tree. -/
def symmetry (t : ButcherTree) : ℕ := t.out.symmetry

/-- 2.1: the product of the factorials of the numbers of children. -/
def orderedWeight (t : ButcherTree) : ℕ := t.out.orderedWeight

/-- 2.2: the number of ordered representatives of a rooted tree. -/
def orderingCount (t : ButcherTree) : ℕ := Nat.card {τ : OrderedTree // mk τ = t}

/-- 2.3: the number `θ_n` of rooted trees of order `n`. -/
def treeCount (n : ℕ) : ℕ := Nat.card {t : ButcherTree // t.order = n}

/-- 2.1: order, density, symmetry and the ordered weight do not depend on the representative. -/
theorem invariants_mk (τ : OrderedTree) :
    (mk τ).order = τ.order ∧ (mk τ).density = τ.density ∧ (mk τ).symmetry = τ.symmetry ∧
      (mk τ).orderedWeight = τ.orderedWeight :=
  sorry

/-- 2.1: finite rooted trees in Mathlib's order-theoretic sense (`_root_.RootedTree`), up to order
isomorphism. -/
def finiteRootedTreeSetoid : Setoid {t : _root_.RootedTree.{0} // Finite t} where
  r t t' := Nonempty (t.1 ≃o t'.1)
  iseqv := ⟨fun _ ↦ ⟨OrderIso.refl _⟩, fun ⟨e⟩ ↦ ⟨e.symm⟩, fun ⟨e⟩ ⟨e'⟩ ↦ ⟨e.trans e'⟩⟩

/-- 2.1: Butcher trees are the isomorphism classes of finite Mathlib rooted trees, by a bijection
that sends the order to the number of elements. -/
theorem exists_equiv_finiteRootedTree :
    ∃ e : ButcherTree ≃ Quotient finiteRootedTreeSetoid,
      ∀ (t : ButcherTree) (t' : {t : _root_.RootedTree.{0} // Finite t}),
        e t = Quotient.mk _ t' → t.order = Nat.card t'.1 :=
  sorry

/-- 2.2: `σ(t) ν(t) = ∏ (children)!`, where `ν(t)` counts the orderings of `t`. -/
theorem symmetry_mul_orderingCount (t : ButcherTree) :
    t.symmetry * t.orderingCount = t.orderedWeight :=
  sorry

/-- 2.3: there are finitely many trees of each order; `θ_1, …, θ_10` and the numbers of trees of
order at most `1, …, 10`. -/
theorem treeCount_values :
    (∀ n, Finite {t : ButcherTree // t.order = n}) ∧
      (List.range 10).map (fun n ↦ treeCount (n + 1)) = [1, 1, 2, 4, 9, 20, 48, 115, 286, 719] ∧
      (List.range 10).map (fun p ↦ ∑ n ∈ Finset.range (p + 1), treeCount (n + 1)) =
        [1, 2, 4, 8, 17, 37, 85, 200, 486, 1205] :=
  sorry

/-- 2.3: the generating function `∑ θ_n x^(n-1) = ∏ (1 - x^n)^(-θ_n)`, modulo every power of `x`.
-/
theorem trunc_treeCount_generatingFunction (N : ℕ) :
    PowerSeries.trunc N (PowerSeries.mk fun n ↦ (treeCount (n + 1) : ℚ)) =
      PowerSeries.trunc N
        (∏ n ∈ Finset.range N, ((1 : PowerSeries ℚ) - PowerSeries.X ^ (n + 1))⁻¹ ^
          treeCount (n + 1)) :=
  sorry

/-- 2.4: `σ(t) γ(t)` divides `|t|!`; the quotient is the number of monotone labellings. -/
theorem symmetry_mul_density_dvd_factorial (t : ButcherTree) :
    t.symmetry * t.density ∣ t.order.factorial :=
  sorry

/-- 2.4: `∑_{|t| = n} n! / (σ(t) γ(t)) = (n - 1)!` and `∑_{|t| = n} n! / σ(t) = n ^ (n - 1)`. -/
theorem sum_factorial_div_symmetry {n : ℕ} (hn : 1 ≤ n) :
    ∑ᶠ t : {t : ButcherTree // t.order = n},
        (n.factorial : ℚ) / (t.1.symmetry * t.1.density) = (n - 1).factorial ∧
      ∑ᶠ t : {t : ButcherTree // t.order = n}, (n.factorial : ℚ) / t.1.symmetry =
        (n : ℚ) ^ (n - 1) :=
  sorry

end ButcherTree

/-! ## Layer 3: elementary differentials and B-series -/

section BSeries

variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]

/-- 3.1: the elementary differential `F(t)(y) = f^(m)(y) (F(t₁)(y), …, F(t_m)(y))`. -/
def OrderedTree.differential (f : E → E) (y : E) : OrderedTree → E
  | .node m ch => iteratedFDeriv ℝ m f y (fun i ↦ OrderedTree.differential f y (ch i))

/-- 3.1: the elementary differential of a rooted tree. -/
def ButcherTree.differential (f : E → E) (t : ButcherTree) (y : E) : E := t.out.differential f y

/-- 3.1: for `f` of class `C^(|τ| - 1)` the elementary differential does not depend on the
representative. -/
theorem ButcherTree.differential_mk {f : E → E} (τ : OrderedTree)
    (hf : ContDiff ℝ (τ.order - 1) f)
    (y : E) : (ButcherTree.mk τ).differential f y = τ.differential f y :=
  sorry

/-- 3.2: the B-series truncated after order `N`:
`a ∅ • y + ∑_{1 ≤ |t| ≤ N} (h ^ |t| a t / σ t) • F(t)(y)`. -/
def bSeries (a : Option ButcherTree → ℝ) (f : E → E) (N : ℕ) (h : ℝ) (y : E) : E :=
  a none • y + ∑ n ∈ Finset.Icc 1 N,
    ∑ᶠ t : {t : ButcherTree // t.order = n},
      (h ^ n * a (some t.1) / t.1.symmetry) • t.1.differential f y

/-- 3.2: the coefficients `e(∅) = 1`, `e(t) = 1 / γ(t)` of the exact flow. -/
def exactCoeff : Option ButcherTree → ℝ
  | none => 1
  | some t => 1 / t.density

/-- 3.2: the solution of a `C^N` autonomous field is its B-series `B(e, y₀)` up to
`O(h ^ (N + 1))`. -/
theorem isBigO_sub_bSeries_exactCoeff {f : E → E} {N : ℕ} (hf : ContDiff ℝ N f) {u : ℝ → E}
    (hu : ∀ᶠ t in 𝓝 0, HasDerivAt u (f (u t)) t) :
    (fun h ↦ u h - bSeries exactCoeff f N h (u 0)) =O[𝓝 0] fun h ↦ h ^ (N + 1) :=
  sorry

/-- 3.3: the stage weights `Φ_j(t) = ∏_k ∑_l a_jl Φ_l(t_k)`. -/
def OrderedTree.stageWeight {s : ℕ} (T : ButcherTableau s) : OrderedTree → Fin s → ℝ
  | .node _ ch, j => ∏ k, ∑ l, T.A j l * OrderedTree.stageWeight T (ch k) l

/-- 3.3: the elementary weight `Φ(t) = ∑_j b_j Φ_j(t)`. -/
def OrderedTree.weight {s : ℕ} (T : ButcherTableau s) (t : OrderedTree) : ℝ :=
  ∑ j, T.b j * t.stageWeight T j

/-- 3.3: the elementary weight of a rooted tree. -/
def ButcherTree.weight {s : ℕ} (T : ButcherTableau s) (t : ButcherTree) : ℝ := t.out.weight T

/-- 3.3: the elementary weights do not depend on the representative. -/
theorem ButcherTree.weight_mk {s : ℕ} (T : ButcherTableau s) (τ : OrderedTree) :
    (ButcherTree.mk τ).weight T = τ.weight T ∧
      (ButcherTree.mk τ).out.stageWeight T = τ.stageWeight T :=
  sorry

/-- 3.3: the B-series coefficients `1, Φ` of one Runge–Kutta step. -/
def ButcherTableau.rkCoeff {s : ℕ} (T : ButcherTableau s) : Option ButcherTree → ℝ
  | none => 1
  | some t => t.weight T

/-- 3.4: the stage equations have a unique branch through `h = 0`, of class `C^r`. -/
theorem ButcherTableau.exists_stageBranch [CompleteSpace E] {s : ℕ} (T : ButcherTableau s)
    {f : ℝ → E → E} {r : ℕ} (hr : 1 ≤ r) (hf : ContDiff ℝ r (Function.uncurry f)) (t : ℝ)
    (y : E) :
    ∃ δ > 0, ∃ k : ℝ → Fin s → E, ContDiffOn ℝ r k (Metric.ball 0 δ) ∧
      (∀ h ∈ Metric.ball (0 : ℝ) δ, T.IsStage f t y h (k h)) ∧
      ∀ k' : ℝ → Fin s → E, ContinuousAt k' 0 → (∀ᶠ h in 𝓝 0, T.IsStage f t y h (k' h)) →
        k' =ᶠ[𝓝 0] k :=
  sorry

/-- 3.4: along a continuous branch of stages, one Runge–Kutta step is the B-series
`B(Φ, y)` up to `O(h ^ (N + 1))`. -/
theorem ButcherTableau.isBigO_step_sub_bSeries {s : ℕ} (T : ButcherTableau s) {f : E → E}
    {N : ℕ} (hf : ContDiff ℝ N f) {y : E} {k : ℝ → Fin s → E} (hk : ContinuousAt k 0)
    (hst : ∀ᶠ h in 𝓝 0, T.IsStage (fun _ ↦ f) 0 y h (k h)) :
    (fun h ↦ (y + h • ∑ i, T.b i • k h i) - bSeries T.rkCoeff f N h y) =O[𝓝 0]
      fun h ↦ h ^ (N + 1) :=
  sorry

end BSeries

/-! ## Layer 4: the order conditions -/

namespace ButcherTableau

variable {s : ℕ} (T : ButcherTableau s)

/-- 4.1: the tree conditions `Φ(t) = 1 / γ(t)` for every rooted tree with `|t| ≤ p`. -/
def TreeConditions (p : ℕ) : Prop := ∀ t : ButcherTree, t.order ≤ p → t.weight T = 1 / t.density

/-- 4.1: autonomous order at least `p`: along every continuous stage branch, for every smooth
autonomous system on `ℝ^d`, the local error is `O(h ^ (p + 1))`. -/
def HasAutonomousOrder (p : ℕ) : Prop :=
  ∀ (d : ℕ) (f : EuclideanSpace ℝ (Fin d) → EuclideanSpace ℝ (Fin d))
    (u : ℝ → EuclideanSpace ℝ (Fin d)) (k : ℝ → Fin s → EuclideanSpace ℝ (Fin d)),
    ContDiff ℝ ∞ f → (∀ᶠ t in 𝓝 0, HasDerivAt u (f (u t)) t) → ContinuousAt k 0 →
    (∀ᶠ h in 𝓝 0, T.IsStage (fun _ ↦ f) 0 (u 0) h (k h)) →
    (fun h ↦ u h - (u 0 + h • ∑ i, T.b i • k h i)) =O[𝓝 0] fun h ↦ h ^ (p + 1)

/-- 4.1: local order at least `p` for non-autonomous smooth systems, along every continuous
stage branch. -/
def HasLocalOrder (p : ℕ) : Prop :=
  ∀ (d : ℕ) (f : ℝ → EuclideanSpace ℝ (Fin d) → EuclideanSpace ℝ (Fin d))
    (u : ℝ → EuclideanSpace ℝ (Fin d)) (k : ℝ → Fin s → EuclideanSpace ℝ (Fin d)) (t₀ : ℝ),
    ContDiff ℝ ∞ (Function.uncurry f) → (∀ᶠ t in 𝓝 t₀, HasDerivAt u (f t (u t)) t) →
    ContinuousAt k 0 → (∀ᶠ h in 𝓝 0, T.IsStage f t₀ (u t₀) h (k h)) →
    (fun h ↦ u (t₀ + h) - (u t₀ + h • ∑ i, T.b i • k h i)) =O[𝓝 0] fun h ↦ h ^ (p + 1)

/-- 4.2: Butcher's theorem: autonomous order `p` is equivalent to the tree conditions. -/
theorem hasAutonomousOrder_iff_treeWeight (p : ℕ) :
    T.HasAutonomousOrder p ↔ T.TreeConditions p :=
  sorry

/-- 4.3: under the row-sum condition, local order equals autonomous order. -/
theorem hasLocalOrder_iff_hasAutonomousOrder (hc : ∀ i, T.c i = ∑ j, T.A i j) (p : ℕ) :
    T.HasLocalOrder p ↔ T.HasAutonomousOrder p :=
  sorry

/-- 4.4: for explicit tableaux with `c = A 𝟙`, the uniform order of OneStepMethodsForODEs §4.2 is
equivalent to the tree conditions, for every `p`. -/
theorem hasOrder_iff_treeConditions_of_isExplicit (hT : T.IsExplicit)
    (hc : ∀ i, T.c i = ∑ j, T.A i j) (p : ℕ) : T.HasOrder p ↔ T.TreeConditions p :=
  sorry

/-- 4.4: for `p ≤ 4` and `c = A 𝟙` the tree conditions are the eight conditions of
OneStepMethodsForODEs §4.1. -/
theorem treeConditions_iff_orderConditions (hc : ∀ i, T.c i = ∑ j, T.A i j) {p : ℕ}
    (hp : p ≤ 4) : T.TreeConditions p ↔ T.OrderConditions p :=
  sorry

/-- 4.4: the bushy and tall trees: under `c = A 𝟙` the tree conditions through `p` give the
quadrature conditions `∑ b c^q = 1 / (q + 1)`, `q < p`, and `bᵀ A^(k-1) 𝟙 = 1 / k!`, `k ≤ p`. -/
theorem quadrature_of_treeConditions (hc : ∀ i, T.c i = ∑ j, T.A i j) {p : ℕ}
    (hp : T.TreeConditions p) :
    (∀ q < p, ∑ i, T.b i * T.c i ^ q = 1 / (q + 1)) ∧
      ∀ k, 1 ≤ k → k ≤ p → T.b ⬝ᵥ (T.A ^ (k - 1) *ᵥ fun _ ↦ 1) = 1 / k.factorial :=
  sorry

/-! ## Layer 5: simplifying assumptions and the Butcher barriers -/

/-- 5.1: `B(p)`: `∑ b_i c_i^q = 1 / (q + 1)` for `q < p`. -/
def SimplifyingB (p : ℕ) : Prop := ∀ q < p, ∑ i, T.b i * T.c i ^ q = 1 / (q + 1)

/-- 5.1: `C(η)`: `∑_j a_ij c_j^q = c_i^(q+1) / (q + 1)` for all `i` and `q < η`. -/
def SimplifyingC (η : ℕ) : Prop :=
  ∀ q < η, ∀ i, ∑ j, T.A i j * T.c j ^ q = T.c i ^ (q + 1) / (q + 1)

/-- 5.1: `D(ζ)`: `∑_i b_i c_i^q a_ij = b_j (1 - c_j^(q+1)) / (q + 1)` for all `j` and `q < ζ`. -/
def SimplifyingD (ζ : ℕ) : Prop :=
  ∀ q < ζ, ∀ j, ∑ i, T.b i * T.c i ^ q * T.A i j = T.b j * (1 - T.c j ^ (q + 1)) / (q + 1)

/-- 5.1: Butcher's theorem on simplifying assumptions. -/
theorem hasAutonomousOrder_of_simplifying {p η ζ : ℕ} (hp : p ≤ η + ζ + 1) (hp' : p ≤ 2 * η + 2)
    (hB : T.SimplifyingB p) (hC : T.SimplifyingC η) (hD : T.SimplifyingD ζ) :
    T.TreeConditions p ∧ T.HasAutonomousOrder p :=
  sorry

/-- 5.2: first Butcher barrier: an explicit method satisfying the tree conditions of order
`p ≥ 5` has at least `p + 1` stages. -/
theorem add_one_le_of_treeConditions (hT : T.IsExplicit) {p : ℕ} (hp : 5 ≤ p)
    (hcond : T.TreeConditions p) : p + 1 ≤ s :=
  sorry

/-- 5.2: second Butcher barrier: for `p ≥ 7`, at least `p + 2` stages. -/
theorem add_two_le_of_treeConditions (hT : T.IsExplicit) {p : ℕ} (hp : 7 ≤ p)
    (hcond : T.TreeConditions p) : p + 2 ≤ s :=
  sorry

/-- 5.2: third Butcher barrier: for `p ≥ 8`, at least `p + 3` stages. -/
theorem add_three_le_of_treeConditions (hT : T.IsExplicit) {p : ℕ} (hp : 8 ≤ p)
    (hcond : T.TreeConditions p) : p + 3 ≤ s :=
  sorry

end ButcherTableau

/-- 5.2: the barriers are attained through order eight: explicit methods of orders `5, 6, 7, 8`
with `6, 7, 9, 11` stages. -/
theorem exists_isExplicit_treeConditions :
    (∃ T : ButcherTableau 6, T.IsExplicit ∧ T.TreeConditions 5) ∧
      (∃ T : ButcherTableau 7, T.IsExplicit ∧ T.TreeConditions 6) ∧
      (∃ T : ButcherTableau 9, T.IsExplicit ∧ T.TreeConditions 7) ∧
      (∃ T : ButcherTableau 11, T.IsExplicit ∧ T.TreeConditions 8) :=
  sorry

/-! ## Layer 6: collocation methods -/

section Collocation

variable {s : ℕ}

/-- 6.1: the collocation tableau of the nodes `c`: `a_ij = ∫_0^{c_i} ℓ_j`, `b_j = ∫_0^1 ℓ_j`. -/
def collocationTableau (c : Fin s → ℝ) : ButcherTableau s where
  A i j := ∫ τ in (0 : ℝ)..c i, (Lagrange.basis Finset.univ c j).eval τ
  b j := ∫ τ in (0 : ℝ)..1, (Lagrange.basis Finset.univ c j).eval τ
  c := c

/-- 6.1: a collocation tableau satisfies `B(s)`, `C(s)` and `c = A 𝟙`. -/
theorem collocationTableau_simplifying {c : Fin s → ℝ} (hc : Function.Injective c) :
    (collocationTableau c).SimplifyingB s ∧ (collocationTableau c).SimplifyingC s ∧
      ∀ i, c i = ∑ j, (collocationTableau c).A i j :=
  sorry

variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]

/-- 6.2: the `E`-valued polynomial `σ ↦ ∑_m σ ^ m • p m` of degree at most `s`. -/
def polyValue (p : Fin (s + 1) → E) (σ : ℝ) : E := ∑ m : Fin (s + 1), σ ^ (m : ℕ) • p m

/-- 6.2: its derivative `σ ↦ ∑_m m σ ^ (m - 1) • p m`. -/
def polyDeriv (p : Fin (s + 1) → E) (σ : ℝ) : E :=
  ∑ m : Fin (s + 1), ((m : ℕ) * σ ^ ((m : ℕ) - 1)) • p m

/-- 6.2: for `0 < |h|` small the collocation polynomial `u (t₀ + σ) = polyValue p σ` exists and is
unique, its slopes at the nodes solve the stage equations of `collocationTableau c`, and
`u (t₀ + h)` is the Runge–Kutta step. -/
theorem existsUnique_collocationPolynomial [CompleteSpace E] {c : Fin s → ℝ}
    (hc : Function.Injective c) {f : ℝ → E → E} {L : ℝ≥0} (hL : ∀ t, LipschitzWith L (f t))
    (t₀ : ℝ) (y₀ : E) :
    ∃ h₀ > 0, ∀ h : ℝ, h ≠ 0 → |h| < h₀ →
      (∃! p : Fin (s + 1) → E, polyValue p 0 = y₀ ∧
        ∀ i, polyDeriv p (c i * h) = f (t₀ + c i * h) (polyValue p (c i * h))) ∧
      ∀ p : Fin (s + 1) → E, polyValue p 0 = y₀ →
        (∀ i, polyDeriv p (c i * h) = f (t₀ + c i * h) (polyValue p (c i * h))) →
        (collocationTableau c).IsStage f t₀ y₀ h (fun j ↦ polyDeriv p (c j * h)) ∧
          polyValue p h = y₀ + h • ∑ j, (collocationTableau c).b j • polyDeriv p (c j * h) :=
  sorry

/-- 6.3: a tableau with distinct nodes and `B(s)` is the collocation tableau of its nodes iff
`C(s)` holds. -/
theorem ButcherTableau.eq_collocationTableau_iff (T : ButcherTableau s)
    (hc : Function.Injective T.c) (hB : T.SimplifyingB s) :
    T = collocationTableau T.c ↔ T.SimplifyingC s :=
  sorry

/-- 6.4: if the node polynomial is orthogonal to the polynomials of degree `< r`, the collocation
method has order at least `s + r`. -/
theorem collocation_hasAutonomousOrder {c : Fin s → ℝ} (hc : Function.Injective c) {r : ℕ}
    (hM : ∀ q < r, ∫ τ in (0 : ℝ)..1, τ ^ q * ∏ i, (τ - c i) = 0) :
    (collocationTableau c).TreeConditions (s + r) ∧
      (collocationTableau c).HasAutonomousOrder (s + r) ∧
      (collocationTableau c).HasLocalOrder (s + r) :=
  sorry

/-- 6.5: the node polynomial of the Gauss methods, the shifted Legendre polynomial. -/
def gaussNodePoly (s : ℕ) : ℝ[X] := (shiftedLegendre s).map (Int.castRingHom ℝ)

/-- 6.5: the node polynomial `D^(s-1) (X^(s-1) (X - 1)^s)` of the Radau IIA methods. -/
def radauIIANodePoly (s : ℕ) : ℝ[X] := derivative^[s - 1] (X ^ (s - 1) * (X - 1) ^ s)

/-- 6.5: the node polynomial `D^(s-2) (X^(s-1) (X - 1)^(s-1))` of the Lobatto IIIA methods. -/
def lobattoIIIANodePoly (s : ℕ) : ℝ[X] := derivative^[s - 2] (X ^ (s - 1) * (X - 1) ^ (s - 1))

/-- 6.5: the Gauss methods have order exactly `2 s`. -/
theorem gauss_hasAutonomousOrder {c : Fin s → ℝ} (hc : Function.Injective c)
    (hroot : ∀ i, (gaussNodePoly s).IsRoot (c i)) :
    (collocationTableau c).HasAutonomousOrder (2 * s) ∧
      ¬ (collocationTableau c).HasAutonomousOrder (2 * s + 1) :=
  sorry

/-- 6.5: the Radau IIA methods have order exactly `2 s - 1`. -/
theorem radauIIA_hasAutonomousOrder (hs : 1 ≤ s) {c : Fin s → ℝ} (hc : Function.Injective c)
    (hroot : ∀ i, (radauIIANodePoly s).IsRoot (c i)) :
    (collocationTableau c).HasAutonomousOrder (2 * s - 1) ∧
      ¬ (collocationTableau c).HasAutonomousOrder (2 * s) :=
  sorry

/-- 6.5: the Lobatto IIIA methods have order exactly `2 s - 2`. -/
theorem lobattoIIIA_hasAutonomousOrder (hs : 2 ≤ s) {c : Fin s → ℝ} (hc : Function.Injective c)
    (hroot : ∀ i, (lobattoIIIANodePoly s).IsRoot (c i)) :
    (collocationTableau c).HasAutonomousOrder (2 * s - 2) ∧
      ¬ (collocationTableau c).HasAutonomousOrder (2 * s - 1) :=
  sorry

/-- 6.6: an `s`-stage tableau satisfies the tree conditions of order at most `2 s`. -/
theorem ButcherTableau.le_two_mul_of_treeConditions (T : ButcherTableau s) {p : ℕ}
    (hp : T.TreeConditions p) : p ≤ 2 * s :=
  sorry

/-- 6.6: the tree conditions of order `2 s` hold only for the Gauss method: the nodes `A 𝟙` are
distinct zeros of the shifted Legendre polynomial and `A`, `b` are those of their collocation
tableau. -/
theorem ButcherTableau.eq_gauss_of_treeConditions (T : ButcherTableau s)
    (hp : T.TreeConditions (2 * s)) :
    Function.Injective (T.A *ᵥ fun _ ↦ 1) ∧
      (∀ i, (gaussNodePoly s).IsRoot ((T.A *ᵥ fun _ ↦ 1) i)) ∧
      T.A = (collocationTableau (T.A *ᵥ fun _ ↦ 1)).A ∧
      T.b = (collocationTableau (T.A *ᵥ fun _ ↦ 1)).b :=
  sorry

end Collocation

/-! ## Layer 7: composition of B-series and the Butcher group -/

namespace OrderedTree

/-- 7.1: the ordered subtrees `θ` containing the root, each with the forest `τ \ θ` of removed
subtrees: for each child, either the whole child is removed or a subtree of it is kept. -/
def cuts : OrderedTree → List (OrderedTree × List OrderedTree)
  | node m ch =>
    (List.ofFn fun i : Fin m ↦
        ((none, [ch i]) :: (cuts (ch i)).map fun q ↦ (some q.1, q.2) :
          List (Option OrderedTree × List OrderedTree))).sections.map fun l ↦
      (node (l.filterMap Prod.fst).length fun i ↦ (l.filterMap Prod.fst).get i,
        (l.map Prod.snd).flatten)

end OrderedTree

/-- 7.1: the composition product
`(a b)(t) = b(∅) a(t) + ∑_{θ} b(θ) ∏_{δ ∈ t \ θ} a(δ)`, over the nonempty subtrees `θ` that contain
the root, and `(a b)(∅) = b(∅)`. -/
def butcherProduct (a b : Option ButcherTree → ℝ) : Option ButcherTree → ℝ
  | none => b none
  | some t => b none * a (some t) +
      ((t.out.cuts).map fun q ↦
        b (some (ButcherTree.mk q.1)) * (q.2.map fun δ ↦ a (some (ButcherTree.mk δ))).prod).sum

/-- 7.1: the composition product can be computed from any representative. -/
theorem butcherProduct_some_mk (a b : Option ButcherTree → ℝ) (τ : OrderedTree) :
    butcherProduct a b (some (ButcherTree.mk τ)) = b none * a (some (ButcherTree.mk τ)) +
      ((τ.cuts).map fun q ↦
        b (some (ButcherTree.mk q.1)) * (q.2.map fun δ ↦ a (some (ButcherTree.mk δ))).prod).sum :=
  sorry

/-- 7.2: the composition law `B(b, B(a, y)) = B(a b, y)` for `a(∅) = 1`, up to `O(h ^ (N + 1))`
for a `C^N` field. -/
theorem isBigO_bSeries_comp {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] {f : E → E}
    {N : ℕ} (hf : ContDiff ℝ N f) {a : Option ButcherTree → ℝ} (ha : a none = 1)
    (b : Option ButcherTree → ℝ) (y : E) :
    (fun h ↦ bSeries b f N h (bSeries a f N h y) - bSeries (butcherProduct a b) f N h y)
      =O[𝓝 0] fun h ↦ h ^ (N + 1) :=
  sorry

/-- 7.3: the composite tableau: a step of `T₁` followed by a step of `T₂`. -/
def ButcherTableau.comp {s₁ s₂ : ℕ} (T₁ : ButcherTableau s₁) (T₂ : ButcherTableau s₂) :
    ButcherTableau (s₁ + s₂) where
  A := Matrix.reindex finSumFinEquiv finSumFinEquiv
    (Matrix.fromBlocks T₁.A 0 (Matrix.of fun _ j ↦ T₁.b j) T₂.A)
  b := Sum.elim T₁.b T₂.b ∘ finSumFinEquiv.symm
  c := Sum.elim T₁.c (fun i ↦ 1 + T₂.c i) ∘ finSumFinEquiv.symm

/-- 7.3: the elementary weights of the composite tableau are the composition product. -/
theorem ButcherTableau.rkCoeff_comp {s₁ s₂ : ℕ} (T₁ : ButcherTableau s₁)
    (T₂ : ButcherTableau s₂) : (T₁.comp T₂).rkCoeff = butcherProduct T₁.rkCoeff T₂.rkCoeff :=
  sorry

/-- 7.4: the composition product is associative whenever the middle factor has `b(∅) = 1`, in
particular on the maps with `a(∅) = 1`. -/
theorem butcherProduct_assoc (a : Option ButcherTree → ℝ) {b : Option ButcherTree → ℝ}
    (hb : b none = 1) (c : Option ButcherTree → ℝ) :
    butcherProduct (butcherProduct a b) c = butcherProduct a (butcherProduct b c) :=
  sorry

/-- 7.4: the unit `1(∅) = 1`, `1(t) = 0`, and inverses: the maps with `a(∅) = 1` form a group. -/
theorem butcherProduct_unit_inv {a : Option ButcherTree → ℝ} (ha : a none = 1) :
    butcherProduct (fun x ↦ if x = none then 1 else 0) a = a ∧
      butcherProduct a (fun x ↦ if x = none then 1 else 0) = a ∧
      ∃ a' : Option ButcherTree → ℝ, a' none = 1 ∧
        butcherProduct a a' = (fun x ↦ if x = none then 1 else 0) ∧
        butcherProduct a' a = (fun x ↦ if x = none then 1 else 0) :=
  sorry

/-- 7.4: the Butcher group is not commutative. -/
theorem exists_butcherProduct_ne :
    ∃ a b : Option ButcherTree → ℝ, a none = 1 ∧ b none = 1 ∧
      butcherProduct a b ≠ butcherProduct b a :=
  sorry

/-! ## Layer 8: asymptotic expansion of the global error and extrapolation -/

section Expansion

variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [CompleteSpace E]

/-- 8.1: Gragg's theorem. A consistent one-step method, smooth on an open set `U` around the
solution, whose defect is `h ^ (p + 1) d(t) + O(h ^ (p + 2))`, has a global error expansion
`∑_{j=p}^{N} e_j(t) h^j + O(h ^ (N + 1))` on uniform meshes, with smooth `e_j`, `e_j(t₀) = 0`, and
`e_p' = ∂_y f(t, y(t)) e_p + d`. -/
theorem exists_globalErrorExpansion {f : ℝ → E → E} {Φ : ℝ → E → ℝ → E} {y : ℝ → E}
    {d : ℝ → E} {U : Set (ℝ × E × ℝ)} {t₀ T : ℝ} {p : ℕ}
    (hf : ContDiff ℝ ∞ (Function.uncurry f)) (hU : IsOpen U)
    (hyU : ∀ t ∈ Icc t₀ T, (t, y t, (0 : ℝ)) ∈ U)
    (hΦ : ContDiffOn ℝ ∞ (fun q : ℝ × E × ℝ ↦ Φ q.1 q.2.1 q.2.2) U)
    (hcons : ∀ t u, (t, u, (0 : ℝ)) ∈ U → Φ t u 0 = f t u)
    (hy : IsIntegralCurveOn y f (Icc t₀ T))
    (hd : ∀ t ∈ Ico t₀ T, (fun h ↦ oneStepDefect Φ y t h - h ^ (p + 1) • d t) =O[𝓝[>] 0]
      fun h ↦ h ^ (p + 2))
    {N : ℕ} (hN : p ≤ N) :
    ∃ e : ℕ → ℝ → E, (∀ j, e j t₀ = 0) ∧ (∀ j, ContDiffOn ℝ ∞ (e j) (Icc t₀ T)) ∧
      (∀ t ∈ Ico t₀ T,
        HasDerivWithinAt (e p) (fderiv ℝ (f t) (y t) (e p t) + d t) (Icc t₀ T) t) ∧
      ∃ C h₀ : ℝ, 0 < h₀ ∧ ∀ (h : ℝ) (n : ℕ), 0 < h → h ≤ h₀ → t₀ + n * h ≤ T →
        ‖y (t₀ + n * h) - oneStepSeq Φ t₀ (fun _ ↦ h) (y t₀) n -
            ∑ j ∈ Finset.Icc p N, h ^ j • e j (t₀ + n * h)‖ ≤ C * h ^ (N + 1) :=
  sorry

/-- 8.2: for a symmetric method the expansion of 8.1 contains only even powers of `h`. -/
theorem exists_globalErrorExpansion_even {f : ℝ → E → E} {Φ : ℝ → E → ℝ → E} {y : ℝ → E}
    {d : ℝ → E} {U : Set (ℝ × E × ℝ)} {t₀ T : ℝ} {p : ℕ}
    (hf : ContDiff ℝ ∞ (Function.uncurry f)) (hU : IsOpen U)
    (hyU : ∀ t ∈ Icc t₀ T, (t, y t, (0 : ℝ)) ∈ U)
    (hΦ : ContDiffOn ℝ ∞ (fun q : ℝ × E × ℝ ↦ Φ q.1 q.2.1 q.2.2) U)
    (hcons : ∀ t u, (t, u, (0 : ℝ)) ∈ U → Φ t u 0 = f t u)
    (hsymm : ∀ t u h, (t, u, h) ∈ U → (t + h, u + h • Φ t u h, -h) ∈ U →
      Φ (t + h) (u + h • Φ t u h) (-h) = Φ t u h)
    (hy : IsIntegralCurveOn y f (Icc t₀ T))
    (hd : ∀ t ∈ Ico t₀ T, (fun h ↦ oneStepDefect Φ y t h - h ^ (p + 1) • d t) =O[𝓝[>] 0]
      fun h ↦ h ^ (p + 2))
    {N : ℕ} (hN : p ≤ N) :
    ∃ e : ℕ → ℝ → E, (∀ j, e j t₀ = 0) ∧ (∀ j, Odd j → e j = 0) ∧
      (∀ j, ContDiffOn ℝ ∞ (e j) (Icc t₀ T)) ∧
      ∃ C h₀ : ℝ, 0 < h₀ ∧ ∀ (h : ℝ) (n : ℕ), 0 < h → h ≤ h₀ → t₀ + n * h ≤ T →
        ‖y (t₀ + n * h) - oneStepSeq Φ t₀ (fun _ ↦ h) (y t₀) n -
            ∑ j ∈ Finset.Icc p N, h ^ j • e j (t₀ + n * h)‖ ≤ C * h ^ (N + 1) :=
  sorry

end Expansion

/-- 8.3: for `p ≥ 1` and distinct step numbers `n_1, …, n_k ≥ 1` there are unique weights with
`∑ w_i = 1` and `∑ w_i / n_i ^ (p + q) = 0` for `q < k - 1`. -/
theorem existsUnique_extrapolationWeights {k p : ℕ} (hk : 1 ≤ k) (hp : 1 ≤ p) {n : Fin k → ℕ+}
    (hn : Function.Injective n) :
    ∃! w : Fin k → ℝ, ∑ i, w i = 1 ∧ ∀ q < k - 1, ∑ i, w i / ((n i : ℕ) : ℝ) ^ (p + q) = 0 :=
  sorry

/-- 8.3: with any weights satisfying the equations of `existsUnique_extrapolationWeights`, the
extrapolated value `∑ w_i T_{i,1}`, with `T_{i,1}` the result of `n_i` steps of size `H / n_i`,
is a method of order `p + k - 1`: its defect is `O(H ^ (p + k))`. -/
theorem isBigO_extrapolation {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
    [CompleteSpace E] {f : ℝ → E → E} {Φ : ℝ → E → ℝ → E} {y : ℝ → E} {d : ℝ → E}
    {U : Set (ℝ × E × ℝ)} {t₀ T : ℝ} {p k : ℕ}
    (hf : ContDiff ℝ ∞ (Function.uncurry f)) (hU : IsOpen U)
    (hyU : ∀ t ∈ Icc t₀ T, (t, y t, (0 : ℝ)) ∈ U)
    (hΦ : ContDiffOn ℝ ∞ (fun q : ℝ × E × ℝ ↦ Φ q.1 q.2.1 q.2.2) U)
    (hcons : ∀ t u, (t, u, (0 : ℝ)) ∈ U → Φ t u 0 = f t u)
    (hy : IsIntegralCurveOn y f (Icc t₀ T))
    (hd : ∀ t ∈ Ico t₀ T, (fun h ↦ oneStepDefect Φ y t h - h ^ (p + 1) • d t) =O[𝓝[>] 0]
      fun h ↦ h ^ (p + 2))
    {n : Fin k → ℕ+} {w : Fin k → ℝ} (hw₁ : ∑ i, w i = 1)
    (hw : ∀ q < k - 1, ∑ i, w i / ((n i : ℕ) : ℝ) ^ (p + q) = 0) :
    ∀ t ∈ Ico t₀ T, (fun H ↦ y (t + H) -
        ∑ i, w i • oneStepSeq Φ t (fun _ ↦ H / ((n i : ℕ) : ℝ)) (y t) (n i : ℕ)) =O[𝓝[>] 0]
      fun H ↦ H ^ (p + k) :=
  sorry

/-! Mathlib declarations named in the README. -/
#check @ContDiffAt.implicitFunction
#check @ContDiffAt.isSymmSndFDerivAt
#check @ContDiffAt.iteratedFDeriv_comp_perm
#check @IsPicardLindelof.exists_eq_forall_mem_Icc_hasDerivWithinAt
#check @ODE_solution_unique_of_mem_Icc
#check @taylor_mean_remainder_bound
#check @finsum
#check @List.sections
#check @Lagrange.basis
#check @Polynomial.shiftedLegendre
#check @PowerSeries.trunc
#check @IsIntegralCurveOn
#check @gronwallBound

end TauCetiRoadmap.RungeKuttaOrderTheoryAndBSeries
