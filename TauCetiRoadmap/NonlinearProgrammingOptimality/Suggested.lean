import Mathlib

/-!
# Optimality conditions in nonlinear programming: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib, each with `sorry`, together with the few definitions they
need, all with real bodies.

The problem is to minimize `f : E → ℝ` over the feasible set
`{x | (∀ i, g i x ≤ 0) ∧ ∀ j, h j x = 0}`, where `E` is a finite-dimensional real normed space,
the inequality constraints `g i` are indexed by a finite type `ι` and the equality constraints
`h j` by a finite type `κ`; either type may be empty. Derivatives are Mathlib's `fderiv`, so a
gradient is a continuous linear functional, and the Hessian in a direction `d` is
`fderiv ℝ (fderiv ℝ f) x d d`. The tangent cone is Mathlib's `posTangentConeAt`.

Every headline theorem of the README is stated here: the Gould–Tolle characterization of
Guignard's condition (2.1), the Fritz John theorem (2.2), Gauvin's theorem for the
Mangasarian–Fromovitz condition (2.3), existence and uniqueness of multipliers under linear
independence (2.4), and the second-order necessary (3.2) and sufficient (3.3) conditions.
-/

namespace TauCetiRoadmap.NonlinearProgrammingOptimality

open Filter Topology

variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]
  {ι κ : Type*} [Fintype ι] [Fintype κ]

/-! ## Layer 1: feasible sets, cones and constraint qualifications -/

/-- 1.1 The feasible set: the points where every inequality constraint is nonpositive and every
equality constraint vanishes. -/
def feasibleSet (g : ι → E → ℝ) (h : κ → E → ℝ) : Set E :=
  {x | (∀ i, g i x ≤ 0) ∧ ∀ j, h j x = 0}

/-- 1.1 The linearized cone at `x`: the directions `d` with `g i' (x) d ≤ 0` for every inequality
constraint active at `x` (that is, `g i x = 0`) and `h j' (x) d = 0` for every equality
constraint. -/
def linearizedCone (g : ι → E → ℝ) (h : κ → E → ℝ) (x : E) : Set E :=
  {d | (∀ i, g i x = 0 → fderiv ℝ (g i) x d ≤ 0) ∧ ∀ j, fderiv ℝ (h j) x d = 0}

/-- 1.2 The linear independence constraint qualification (LICQ) at `x`: the derivatives of the
active inequality constraints and of all equality constraints form a linearly independent
family. -/
def LICQ (g : ι → E → ℝ) (h : κ → E → ℝ) (x : E) : Prop :=
  LinearIndependent ℝ
    (Sum.elim (fun i : {i // g i x = 0} => fderiv ℝ (g i) x) (fun j => fderiv ℝ (h j) x))

/-- 1.2 The Mangasarian–Fromovitz constraint qualification (MFCQ) at `x`: the derivatives of
the equality constraints are linearly independent, and some direction `d` has
`g i' (x) d < 0` for every active `i` and `h j' (x) d = 0` for every `j`. -/
def MFCQ (g : ι → E → ℝ) (h : κ → E → ℝ) (x : E) : Prop :=
  LinearIndependent ℝ (fun j => fderiv ℝ (h j) x) ∧
    ∃ d : E, (∀ i, g i x = 0 → fderiv ℝ (g i) x d < 0) ∧ ∀ j, fderiv ℝ (h j) x d = 0

/-- 1.2 Guignard's constraint qualification at `x`: every continuous linear functional that is
nonpositive on the tangent cone of the feasible set is nonpositive on the linearized cone, that
is, the two cones have the same polar. -/
def GuignardCQ (g : ι → E → ℝ) (h : κ → E → ℝ) (x : E) : Prop :=
  ∀ φ : StrongDual ℝ E, (∀ d ∈ posTangentConeAt (feasibleSet g h) x, φ d ≤ 0) →
    ∀ d ∈ linearizedCone g h x, φ d ≤ 0

/-! ## Layer 2: first-order conditions -/

/-- 2.1 `(μ, ν)` is a Karush–Kuhn–Tucker multiplier for `f` at `x`: `μ ≥ 0`, complementary
slackness `μ i * g i x = 0`, and stationarity of the Lagrangian,
`f' (x) + ∑ i, μ i • g i' (x) + ∑ j, ν j • h j' (x) = 0`. -/
def IsKKTMultiplier (f : E → ℝ) (g : ι → E → ℝ) (h : κ → E → ℝ) (x : E)
    (μ : ι → ℝ) (ν : κ → ℝ) : Prop :=
  (∀ i, 0 ≤ μ i) ∧ (∀ i, μ i * g i x = 0) ∧
    fderiv ℝ f x + ∑ i, μ i • fderiv ℝ (g i) x + ∑ j, ν j • fderiv ℝ (h j) x = 0

/-- 2.1 The set of Karush–Kuhn–Tucker multipliers for `f` at `x`. -/
def kktMultipliers (f : E → ℝ) (g : ι → E → ℝ) (h : κ → E → ℝ) (x : E) :
    Set ((ι → ℝ) × (κ → ℝ)) :=
  {p | IsKKTMultiplier f g h x p.1 p.2}

/-- 2.1 **Gould–Tolle.** At a feasible point, Guignard's condition holds exactly when every
objective that is differentiable at the point and has a local minimum there on the feasible set
has a Karush–Kuhn–Tucker multiplier. -/
theorem guignardCQ_iff_forall_kktMultipliers_nonempty {g : ι → E → ℝ} {h : κ → E → ℝ}
    {x : E} (hx : x ∈ feasibleSet g h) :
    GuignardCQ g h x ↔ ∀ f : E → ℝ, DifferentiableAt ℝ f x →
      IsLocalMinOn f (feasibleSet g h) x → (kktMultipliers f g h x).Nonempty := by
  sorry

/-- 2.2 **The Fritz John theorem.** At a local minimizer, with the objective and the active
inequality constraints differentiable, the inactive ones continuous and the equality constraints
strictly differentiable, there are multipliers `μ₀ ≥ 0`, `μ ≥ 0` and `ν`, not all zero, with
complementary slackness and `μ₀ • f' (x) + ∑ i, μ i • g i' (x) + ∑ j, ν j • h j' (x) = 0`. -/
theorem exists_fritzJohn {f : E → ℝ} {g : ι → E → ℝ} {h : κ → E → ℝ} {x : E}
    (hx : x ∈ feasibleSet g h) (hmin : IsLocalMinOn f (feasibleSet g h) x)
    (hf : DifferentiableAt ℝ f x) (hg : ∀ i, g i x = 0 → DifferentiableAt ℝ (g i) x)
    (hgc : ∀ i, ContinuousAt (g i) x) (hh : ∀ j, HasStrictFDerivAt (h j) (fderiv ℝ (h j) x) x) :
    ∃ (μ₀ : ℝ) (μ : ι → ℝ) (ν : κ → ℝ), (μ₀, μ, ν) ≠ 0 ∧ 0 ≤ μ₀ ∧ (∀ i, 0 ≤ μ i) ∧
      (∀ i, μ i * g i x = 0) ∧
      μ₀ • fderiv ℝ f x + ∑ i, μ i • fderiv ℝ (g i) x + ∑ j, ν j • fderiv ℝ (h j) x = 0 := by
  sorry

/-- 2.3 **Gauvin's theorem.** At a local minimizer, under the smoothness hypotheses of the
Fritz John theorem, the Mangasarian–Fromovitz condition holds exactly when the set of
Karush–Kuhn–Tucker multipliers is nonempty and compact. -/
theorem mfcq_iff_kktMultipliers_nonempty_and_isCompact {f : E → ℝ} {g : ι → E → ℝ}
    {h : κ → E → ℝ} {x : E}
    (hx : x ∈ feasibleSet g h) (hmin : IsLocalMinOn f (feasibleSet g h) x)
    (hf : DifferentiableAt ℝ f x) (hg : ∀ i, g i x = 0 → DifferentiableAt ℝ (g i) x)
    (hgc : ∀ i, ContinuousAt (g i) x) (hh : ∀ j, HasStrictFDerivAt (h j) (fderiv ℝ (h j) x) x) :
    MFCQ g h x ↔ (kktMultipliers f g h x).Nonempty ∧ IsCompact (kktMultipliers f g h x) := by
  sorry

/-- 2.4 **KKT under LICQ.** At a local minimizer, under the smoothness hypotheses of the Fritz
John theorem and the linear independence condition, there is exactly one Karush–Kuhn–Tucker
multiplier. -/
theorem existsUnique_isKKTMultiplier_of_licq {f : E → ℝ} {g : ι → E → ℝ} {h : κ → E → ℝ}
    {x : E} (hx : x ∈ feasibleSet g h) (hmin : IsLocalMinOn f (feasibleSet g h) x)
    (hf : DifferentiableAt ℝ f x) (hg : ∀ i, g i x = 0 → DifferentiableAt ℝ (g i) x)
    (hgc : ∀ i, ContinuousAt (g i) x) (hh : ∀ j, HasStrictFDerivAt (h j) (fderiv ℝ (h j) x) x)
    (hlicq : LICQ g h x) :
    ∃! p : (ι → ℝ) × (κ → ℝ), IsKKTMultiplier f g h x p.1 p.2 := by
  sorry

/-! ## Layer 3: second-order conditions -/

/-- 3.1 The critical cone at `x`: the directions of the linearized cone along which the first
derivative of the objective is nonpositive. -/
def criticalCone (f : E → ℝ) (g : ι → E → ℝ) (h : κ → E → ℝ) (x : E) : Set E :=
  {d | d ∈ linearizedCone g h x ∧ fderiv ℝ f x d ≤ 0}

/-- 3.1 The quadratic form of the Hessian of the Lagrangian `f + ∑ μ i g i + ∑ ν j h j` at `x`,
evaluated at the direction `d`. -/
noncomputable def lagrangianHessian (f : E → ℝ) (g : ι → E → ℝ) (h : κ → E → ℝ) (x : E)
    (μ : ι → ℝ) (ν : κ → ℝ) (d : E) : ℝ :=
  fderiv ℝ (fderiv ℝ f) x d d + ∑ i, μ i * fderiv ℝ (fderiv ℝ (g i)) x d d +
    ∑ j, ν j * fderiv ℝ (fderiv ℝ (h j)) x d d

/-- 3.2 **Second-order necessary condition.** At a local minimizer where the objective, the
active inequality constraints and the equality constraints are `C²`, the inactive inequality
constraints are continuous and LICQ holds, the Hessian of the Lagrangian of the
Karush–Kuhn–Tucker multiplier is nonnegative on the critical cone. -/
theorem lagrangianHessian_nonneg_of_licq {f : E → ℝ} {g : ι → E → ℝ} {h : κ → E → ℝ} {x : E}
    (hx : x ∈ feasibleSet g h) (hmin : IsLocalMinOn f (feasibleSet g h) x)
    (hf : ContDiffAt ℝ 2 f x) (hg : ∀ i, g i x = 0 → ContDiffAt ℝ 2 (g i) x)
    (hgc : ∀ i, ContinuousAt (g i) x) (hh : ∀ j, ContDiffAt ℝ 2 (h j) x)
    (hlicq : LICQ g h x) {μ : ι → ℝ} {ν : κ → ℝ} (hkkt : IsKKTMultiplier f g h x μ ν)
    {d : E} (hd : d ∈ criticalCone f g h x) :
    0 ≤ lagrangianHessian f g h x μ ν d := by
  sorry

/-- 3.3 **Second-order sufficient condition.** At a feasible point with a Karush–Kuhn–Tucker
multiplier whose Lagrangian Hessian is positive on the nonzero directions of the critical cone,
with the objective, the active inequality constraints and the equality constraints `C²`, the
objective grows at least quadratically on the feasible set near the point; no constraint
qualification is assumed. -/
theorem exists_quadratic_growth_of_lagrangianHessian_pos {f : E → ℝ} {g : ι → E → ℝ}
    {h : κ → E → ℝ} {x : E} (hx : x ∈ feasibleSet g h)
    (hf : ContDiffAt ℝ 2 f x) (hg : ∀ i, g i x = 0 → ContDiffAt ℝ 2 (g i) x)
    (hh : ∀ j, ContDiffAt ℝ 2 (h j) x) {μ : ι → ℝ} {ν : κ → ℝ}
    (hkkt : IsKKTMultiplier f g h x μ ν)
    (hpos : ∀ d ∈ criticalCone f g h x, d ≠ 0 → 0 < lagrangianHessian f g h x μ ν d) :
    ∃ σ : ℝ, 0 < σ ∧ ∀ᶠ y in 𝓝[feasibleSet g h] x, f x + σ * ‖y - x‖ ^ 2 ≤ f y := by
  sorry

end TauCetiRoadmap.NonlinearProgrammingOptimality
