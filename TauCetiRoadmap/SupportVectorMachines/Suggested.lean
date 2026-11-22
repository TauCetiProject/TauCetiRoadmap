import Mathlib

/-!
# Support vector machines: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib, each with `sorry`, together with the few
definitions they need; every definition has a real body. Every headline theorem of the README is
statable at the pins and is stated here.

A sample is a finite family of points `x i` of a real inner product space `E`, of any dimension,
with real labels `y i`; the classifier `(w, b)` predicts the sign of `⟪w, x⟫ + b`. The hard-margin
problem minimizes `‖w‖` over the pairs with `1 ≤ y i * (⟪w, x i⟫ + b)` for every `i`; its support
vectors are the points on the margin, where this quantity equals `1`, so they are defined by the
pair and not by a choice of multipliers. The soft-margin problem minimizes
`λ ‖w‖² + (1 / m) Σ max 0 (1 - y i * (⟪w, x i⟫ + b))`, `m` the size of the sample. The
leave-one-out bound concerns samples `Fin m → E × ℝ` under the product of a measure on `E × ℝ`,
and any measurable map that chooses a hard-margin solution on every feasible sample with labels
`±1`; such a map exists (4.1).
-/

noncomputable section

open Finset MeasureTheory
open scoped BigOperators ENNReal Pointwise

namespace TauCetiRoadmap.SupportVectorMachines

section Copied

variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]

/-- 1.3 Copied verbatim from ThresholdFunctionsAndMargins 4.2: the margin of the affine classifier
`x ↦ ⟪w, x⟫ + b` on a labelled family: the least value of `y i * (⟪w, x i⟫ + b)`. -/
def affineMargin {ι : Type*} [Fintype ι] [Nonempty ι] (x : ι → E) (y : ι → ℝ) (w : E) (b : ℝ) :
    ℝ :=
  univ.inf' univ_nonempty fun i => y i * (inner ℝ w (x i) + b)

end Copied

variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E] {ι : Type*} [Fintype ι]

/-! ## Layer 1: the hard margin as a norm minimization -/

section HardMargin

/-- 1.1 The feasible set of the hard-margin problem: the pairs `(w, b)` with
`1 ≤ y i * (⟪w, x i⟫ + b)` for every `i`. -/
def hardFeasible (x : ι → E) (y : ι → ℝ) : Set (E × ℝ) :=
  {p | ∀ i, 1 ≤ y i * (inner ℝ p.1 (x i) + p.2)}

/-- 1.1 `p` solves the hard-margin problem: it is feasible, and no feasible pair has a weight
vector of smaller norm. -/
def IsHardMarginSolution (x : ι → E) (y : ι → ℝ) (p : E × ℝ) : Prop :=
  p ∈ hardFeasible x y ∧ ∀ q ∈ hardFeasible x y, ‖p.1‖ ≤ ‖q.1‖

/-- 1.1 The distance between the convex hulls of the points labelled `1` and of the points
labelled `-1`, as the distance from the origin to the difference of the two hulls. -/
def classDistance (x : ι → E) (y : ι → ℝ) : ℝ :=
  Metric.infDist 0 (convexHull ℝ (x '' {i | y i = 1}) - convexHull ℝ (x '' {i | y i = -1}))

/-- 1.2 The support vectors of the pair `p`: the indices on the margin, where
`y i * (⟪w, x i⟫ + b) = 1`. -/
def marginSet (x : ι → E) (y : ι → ℝ) (p : E × ℝ) : Finset ι :=
  {i | y i * (inner ℝ p.1 (x i) + p.2) = 1}

/-- 1.3 The hard-margin problem as a norm minimization. Let the labels be `±1`, both present, and
`δ` the distance between the hulls of the two classes. The problem is feasible exactly when
`δ > 0`. Then it has exactly one solution `p`; its weight vector has norm `2 / δ`; each class has
a point on the margin of `p`; and among the pairs `(w, b)` with `‖w‖ ≤ 1`, the affine margin
equals its largest value `δ / 2` exactly at `(w, b) = p / ‖p.1‖`. -/
theorem existsUnique_isHardMarginSolution [Nonempty ι] (x : ι → E) (y : ι → ℝ)
    (hy : ∀ i, y i = 1 ∨ y i = -1) (hpos : ∃ i, y i = 1) (hneg : ∃ i, y i = -1) :
    ((hardFeasible x y).Nonempty ↔ 0 < classDistance x y) ∧
      (0 < classDistance x y → ∃ p : E × ℝ, IsHardMarginSolution x y p ∧
        (∀ q, IsHardMarginSolution x y q → q = p) ∧ ‖p.1‖ = 2 / classDistance x y ∧
        (∃ i, y i = 1 ∧ i ∈ marginSet x y p) ∧ (∃ j, y j = -1 ∧ j ∈ marginSet x y p) ∧
        ∀ (w : E) (b : ℝ), ‖w‖ ≤ 1 →
          (affineMargin x y w b = classDistance x y / 2 ↔
            w = ‖p.1‖⁻¹ • p.1 ∧ b = ‖p.1‖⁻¹ * p.2)) := by
  sorry

end HardMargin

/-! ## Layer 2: support vectors, multipliers and the dual problem -/

section Duality

/-- 2.1 `α` is a multiplier vector for the pair `p`: it is nonnegative, vanishes off the
support vectors of `p`, satisfies `Σ α i * y i = 0`, and expands the weight vector as
`p.1 = Σ (α i * y i) • x i`. -/
def IsMarginMultiplier (x : ι → E) (y : ι → ℝ) (p : E × ℝ) (α : ι → ℝ) : Prop :=
  (∀ i, 0 ≤ α i) ∧ (∀ i, α i ≠ 0 → i ∈ marginSet x y p) ∧ ∑ i, α i * y i = 0 ∧
    p.1 = ∑ i, (α i * y i) • x i

/-- 2.1 The support-vector theorem and its converse: a feasible pair solves the hard-margin
problem exactly when it has a multiplier vector, so that the weight vector of a solution is a
nonnegative combination of the labelled support vectors. The labels are arbitrary reals. -/
theorem isHardMarginSolution_iff_exists_isMarginMultiplier (x : ι → E) (y : ι → ℝ)
    {p : E × ℝ} (hp : p ∈ hardFeasible x y) :
    IsHardMarginSolution x y p ↔ ∃ α, IsMarginMultiplier x y p α := by
  sorry

/-- 2.2 The dual objective `Σ α i - ‖Σ (α i * y i) • x i‖² / 2`. -/
def dualObjective (x : ι → E) (y : ι → ℝ) (α : ι → ℝ) : ℝ :=
  ∑ i, α i - ‖∑ i, (α i * y i) • x i‖ ^ 2 / 2

/-- 2.2 The dual feasible set: the nonnegative `α` with `Σ α i * y i = 0`. -/
def dualFeasible (y : ι → ℝ) : Set (ι → ℝ) :=
  {α | (∀ i, 0 ≤ α i) ∧ ∑ i, α i * y i = 0}

/-- 2.2 Lagrangian duality for the hard margin, with arbitrary real labels: the primal problem
is feasible exactly when the dual objective is bounded above on the dual feasible set; for every
solution `p` the dual maximum is `‖p.1‖² / 2`, attained exactly at the multiplier vectors
of `p`. -/
theorem isGreatest_dualObjective (x : ι → E) (y : ι → ℝ) :
    ((hardFeasible x y).Nonempty ↔ BddAbove (dualObjective x y '' dualFeasible y)) ∧
      ∀ p, IsHardMarginSolution x y p →
        IsGreatest (dualObjective x y '' dualFeasible y) (‖p.1‖ ^ 2 / 2) ∧
          ∀ α ∈ dualFeasible y, (dualObjective x y α = ‖p.1‖ ^ 2 / 2 ↔
            IsMarginMultiplier x y p α) := by
  sorry

end Duality

/-! ## Layer 3: the soft margin -/

section SoftMargin

/-- 3.1 The soft-margin objective with regularization `lam`:
`lam ‖w‖² + (1 / m) Σ max 0 (1 - y i * (⟪w, x i⟫ + b))`, the regularized average hinge loss. -/
def softObjective (x : ι → E) (y : ι → ℝ) (lam : ℝ) (p : E × ℝ) : ℝ :=
  lam * ‖p.1‖ ^ 2 + (Fintype.card ι : ℝ)⁻¹ * ∑ i, max 0 (1 - y i * (inner ℝ p.1 (x i) + p.2))

/-- 3.1 The feasible set of the slack-variable form: slacks `ξ i ≥ 0` with
`1 - ξ i ≤ y i * (⟪w, x i⟫ + b)`. -/
def slackFeasible (x : ι → E) (y : ι → ℝ) : Set ((E × ℝ) × (ι → ℝ)) :=
  {q | ∀ i, 0 ≤ q.2 i ∧ 1 - q.2 i ≤ y i * (inner ℝ q.1.1 (x i) + q.1.2)}

/-- 3.1 The objective of the slack-variable form: `lam ‖w‖² + (1 / m) Σ ξ i`. -/
def slackObjective (lam : ℝ) (q : (E × ℝ) × (ι → ℝ)) : ℝ :=
  lam * ‖q.1.1‖ ^ 2 + (Fintype.card ι : ℝ)⁻¹ * ∑ i, q.2 i

/-- 3.1 The soft margin is regularized hinge-loss minimization: for every `lam`, a feasible
`((w, b), ξ)` minimizes the slack form exactly when `(w, b)` minimizes the soft-margin objective
and each slack is the hinge loss. For `lam > 0` the soft-margin objective has a minimizer, and all
its minimizers have the same weight vector. -/
theorem softObjective_minimizers (x : ι → E) (y : ι → ℝ) (lam : ℝ) :
    (∀ q : (E × ℝ) × (ι → ℝ),
      (q ∈ slackFeasible x y ∧ IsMinOn (slackObjective lam) (slackFeasible x y) q) ↔
        (IsMinOn (softObjective x y lam) Set.univ q.1 ∧
          ∀ i, q.2 i = max 0 (1 - y i * (inner ℝ q.1.1 (x i) + q.1.2)))) ∧
      (0 < lam → (∃ p, IsMinOn (softObjective x y lam) Set.univ p) ∧
        ∀ p q, IsMinOn (softObjective x y lam) Set.univ p →
          IsMinOn (softObjective x y lam) Set.univ q → p.1 = q.1) := by
  sorry

/-- 3.2 The soft margin is exact for weak regularization: if `p` is feasible for the hard
margin with a multiplier vector `α`, and `0 < lam` with `2 lam m α i ≤ 1` for every `i`, then the
minimizers of the soft-margin objective are exactly the solutions of the hard-margin problem. -/
theorem isMinOn_softObjective_iff_isHardMarginSolution (x : ι → E) (y : ι → ℝ) {p : E × ℝ}
    (hp : p ∈ hardFeasible x y) {α : ι → ℝ} (hα : IsMarginMultiplier x y p α) {lam : ℝ}
    (hlam : 0 < lam) (hle : ∀ i, 2 * lam * Fintype.card ι * α i ≤ 1) (q : E × ℝ) :
    IsMinOn (softObjective x y lam) Set.univ q ↔ IsHardMarginSolution x y q := by
  sorry

end SoftMargin

/-! ## Layer 4: the leave-one-out bound -/

section LeaveOneOut

/-- 4.1 A measurable choice of hard-margin solutions: for a separable space `E`, some Borel
measurable map on the space of samples `S : ι → E × ℝ` returns a solution of the hard-margin
problem for every sample with labels `±1` for which that problem is feasible. -/
theorem exists_measurable_isHardMarginSolution [MeasurableSpace E] [BorelSpace E]
    [SecondCountableTopology E] :
    ∃ A : (ι → E × ℝ) → E × ℝ, Measurable A ∧ ∀ S : ι → E × ℝ,
      (∀ i, (S i).2 = 1 ∨ (S i).2 = -1) →
      (hardFeasible (fun i => (S i).1) (fun i => (S i).2)).Nonempty →
      IsHardMarginSolution (fun i => (S i).1) (fun i => (S i).2) (A S) := by
  sorry

/-- 4.2 The misclassification risk of the classifier `p` under a measure `D` on `E × ℝ`: the
mass of the points `(x, y)` with `y * (⟪w, x⟫ + b) ≤ 0`, ties counted as errors. -/
def misclassRisk [MeasurableSpace E] (D : Measure (E × ℝ)) (p : E × ℝ) : ℝ≥0∞ :=
  D {z | z.2 * (inner ℝ p.1 z.1 + p.2) ≤ 0}

/-- 4.2 The leave-one-out bound: let `D` be σ-finite with labels `±1` almost everywhere, `m ≥ 1`,
almost every sample of size `m + 1` separable, and `A` a family of measurable maps choosing a
hard-margin solution on every feasible sample with labels `±1`. Then the expected risk of the
classifier `A m S` on `m` points is at most the expected number of support vectors of
`A (m + 1) S` on `m + 1` points, divided by `m + 1`. -/
theorem lintegral_misclassRisk_le [MeasurableSpace E] [BorelSpace E]
    [SecondCountableTopology E] (D : Measure (E × ℝ)) [SigmaFinite D]
    (hlab : ∀ᵐ z ∂D, z.2 = 1 ∨ z.2 = -1) {m : ℕ} (hm : 1 ≤ m)
    (A : (n : ℕ) → (Fin n → E × ℝ) → E × ℝ) (hAm : ∀ n, Measurable (A n))
    (hA : ∀ n (S : Fin n → E × ℝ), (∀ i, (S i).2 = 1 ∨ (S i).2 = -1) →
      (hardFeasible (fun i => (S i).1) (fun i => (S i).2)).Nonempty →
      IsHardMarginSolution (fun i => (S i).1) (fun i => (S i).2) (A n S))
    (hsep : ∀ᵐ S ∂(Measure.pi fun _ : Fin (m + 1) => D),
      (hardFeasible (fun i => (S i).1) (fun i => (S i).2)).Nonempty) :
    ∫⁻ S, misclassRisk D (A m S) ∂(Measure.pi fun _ : Fin m => D) ≤
      (∫⁻ S, ((marginSet (fun i => (S i).1) (fun i => (S i).2) (A (m + 1) S)).card : ℝ≥0∞)
        ∂(Measure.pi fun _ : Fin (m + 1) => D)) / (m + 1) := by
  sorry

end LeaveOneOut

end TauCetiRoadmap.SupportVectorMachines
