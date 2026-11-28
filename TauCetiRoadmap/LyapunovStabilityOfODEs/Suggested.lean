import Mathlib

/-!
# Lyapunov stability of ordinary differential equations: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the
few definitions they need; every definition has a real body. Every headline theorem of the README
is statable at the pins and is stated here. The two intermediate targets that the README states in
prose, the invariance of the ω-limit set of a bounded forward solution (2.2) and the indefinite
Lyapunov equation for a matrix with an eigenvalue in the open right half-plane (5.1), are not
restated.

A vector field is a function `f : E → E` on a finite-dimensional real normed space, continuously
differentiable on all of `E`. A forward solution from `x` is a curve `γ : ℝ → E` with `γ 0 = x`
and Mathlib's `IsIntegralCurveOn γ (fun _ ↦ f) (Set.Ici 0)`; only its values for `t ≥ 0` matter.
Every stability notion asks for a forward solution from each nearby point as well as a bound on
every such solution, so that it is not satisfied vacuously by a field whose solutions escape in
finite time. The Lie derivative of `V` along `f` at `x` is `fderiv ℝ V x (f x)`. The linearization
statements are made on `n → ℝ`, with the Jacobian given as a matrix `A` acting by `A *ᵥ v` and its
eigenvalues taken in `ℂ`, as in the definition of Hurwitz matrices of LinearSystemsAndControl,
Section 5.1.
-/

noncomputable section

open Filter Topology Metric Set Matrix

namespace TauCetiRoadmap.LyapunovStabilityOfODEs

variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]

/-! ## Layer 1: stability of an equilibrium -/

/-- 1.1 The forward solutions of `x' = f x` from `x`: curves `γ` with `γ 0 = x` whose derivative
within `[0, ∞)` at every `t ≥ 0` is `f (γ t)`. -/
def forwardSolutions (f : E → E) (x : E) : Set (ℝ → E) :=
  {γ | γ 0 = x ∧ IsIntegralCurveOn γ (fun _ ↦ f) (Ici 0)}

/-- 1.2 `x₀` is Lyapunov stable for `x' = f x`: for every `ε > 0` there is `δ > 0` such that from
every point within `δ` of `x₀` there is a forward solution, and every forward solution from such
a point stays within `ε` of `x₀` for all `t ≥ 0`. -/
def IsLyapunovStable (f : E → E) (x₀ : E) : Prop :=
  ∀ ε > 0, ∃ δ > 0, ∀ x, dist x x₀ < δ →
    (forwardSolutions f x).Nonempty ∧
      ∀ γ ∈ forwardSolutions f x, ∀ t, 0 ≤ t → dist (γ t) x₀ < ε

/-- 1.3 `x₀` is asymptotically stable: it is Lyapunov stable, and for some `δ > 0` there is a
forward solution from every point within `δ` of `x₀`, and every such solution tends to `x₀`. -/
def IsAsymptoticallyStable (f : E → E) (x₀ : E) : Prop :=
  IsLyapunovStable f x₀ ∧ ∃ δ > 0, ∀ x, dist x x₀ < δ →
    (forwardSolutions f x).Nonempty ∧ ∀ γ ∈ forwardSolutions f x, Tendsto γ atTop (𝓝 x₀)

/-- 1.3 `x₀` is globally asymptotically stable: it is Lyapunov stable, there is a forward
solution from every point, and every forward solution tends to `x₀`. -/
def IsGloballyAsymptoticallyStable (f : E → E) (x₀ : E) : Prop :=
  IsLyapunovStable f x₀ ∧ ∀ x,
    (forwardSolutions f x).Nonempty ∧ ∀ γ ∈ forwardSolutions f x, Tendsto γ atTop (𝓝 x₀)

/-- 1.4 `x₀` is exponentially stable: there are `δ > 0`, `C` and `α > 0` such that from every
point `x` within `δ` of `x₀` there is a forward solution, and every such solution satisfies
`dist (γ t) x₀ ≤ C exp (-α t) dist x x₀` for all `t ≥ 0`. -/
def IsExponentiallyStable (f : E → E) (x₀ : E) : Prop :=
  ∃ δ > 0, ∃ C α : ℝ, 0 < α ∧ ∀ x, dist x x₀ < δ →
    (forwardSolutions f x).Nonempty ∧
      ∀ γ ∈ forwardSolutions f x, ∀ t, 0 ≤ t → dist (γ t) x₀ ≤ C * Real.exp (-(α * t)) * dist x x₀

/-! ## Layer 2: limit sets of bounded solutions -/

/-- 2.1 The union of the complete orbits of `f` that lie in `S`: the points `y` through which
some solution `η` of `x' = f x` defined on all of `ℝ` passes at time `0` while staying in `S` at
all times. -/
def completeOrbitSet (f : E → E) (S : Set E) : Set E :=
  {y | ∃ η : ℝ → E, η 0 = y ∧ IsIntegralCurve η (fun _ ↦ f) ∧ ∀ t, η t ∈ S}

/-! ## Layer 3: Lyapunov's direct method and the invariance principle -/

/-- 3.1 **Lyapunov's stability theorem.** Let `f` be continuously differentiable, and let `V` be
differentiable on a ball around `x₀`, zero at `x₀`, positive at the other points of the ball, with
nonpositive Lie derivative along `f` on the ball. Then `x₀` is Lyapunov stable. -/
theorem isLyapunovStable_of_lyapunov [FiniteDimensional ℝ E] {f : E → E} {V : E → ℝ} {x₀ : E}
    {r : ℝ} (hf : ContDiff ℝ 1 f) (hr : 0 < r) (hV : DifferentiableOn ℝ V (ball x₀ r))
    (hV₀ : V x₀ = 0) (hpos : ∀ x ∈ ball x₀ r, x ≠ x₀ → 0 < V x)
    (hdec : ∀ x ∈ ball x₀ r, fderiv ℝ V x (f x) ≤ 0) :
    IsLyapunovStable f x₀ := by
  sorry

/-- 3.2 **Lyapunov's asymptotic stability theorem.** Under the hypotheses of 3.1 with a Lie
derivative that is negative at every point of the ball other than `x₀`, the point `x₀` is
asymptotically stable. -/
theorem isAsymptoticallyStable_of_lyapunov [FiniteDimensional ℝ E] {f : E → E} {V : E → ℝ}
    {x₀ : E} {r : ℝ} (hf : ContDiff ℝ 1 f) (hr : 0 < r) (hV : DifferentiableOn ℝ V (ball x₀ r))
    (hV₀ : V x₀ = 0) (hpos : ∀ x ∈ ball x₀ r, x ≠ x₀ → 0 < V x)
    (hdec : ∀ x ∈ ball x₀ r, x ≠ x₀ → fderiv ℝ V x (f x) < 0) :
    IsAsymptoticallyStable f x₀ := by
  sorry

/-- 3.3 **LaSalle's invariance principle.** Let `f` be continuously differentiable, `V`
differentiable, and `γ` a forward solution whose values for `t ≥ 0` form a bounded set, along
which the Lie derivative of `V` is nonpositive. Then `γ t` eventually lies within every
`ε > 0` of the union of the complete orbits contained in the set where the Lie derivative
vanishes; in particular that union is nonempty. -/
theorem eventually_mem_thickening_completeOrbitSet [FiniteDimensional ℝ E] {f : E → E}
    {V : E → ℝ} {γ : ℝ → E} (hf : ContDiff ℝ 1 f) (hV : Differentiable ℝ V)
    (hγ : IsIntegralCurveOn γ (fun _ ↦ f) (Ici 0)) (hb : Bornology.IsBounded (γ '' Ici 0))
    (hdec : ∀ t, 0 ≤ t → fderiv ℝ V (γ t) (f (γ t)) ≤ 0) :
    ∀ ε > 0, ∀ᶠ t in atTop,
      γ t ∈ thickening ε (completeOrbitSet f {x | fderiv ℝ V x (f x) = 0}) := by
  sorry

/-- 3.4 **The Barbashin–Krasovskii theorem.** Let `f` be continuously differentiable and `V`
differentiable, zero at `x₀`, positive elsewhere and radially unbounded, with nonpositive Lie
derivative everywhere. If the only forward solution along which the Lie derivative of `V`
vanishes for all `t ≥ 0` is the one that stays at `x₀`, then `x₀` is globally asymptotically
stable. -/
theorem isGloballyAsymptoticallyStable_of_lyapunov [FiniteDimensional ℝ E] {f : E → E}
    {V : E → ℝ} {x₀ : E} (hf : ContDiff ℝ 1 f) (hV : Differentiable ℝ V) (hV₀ : V x₀ = 0)
    (hpos : ∀ x, x ≠ x₀ → 0 < V x) (hrad : Tendsto V (cocompact E) atTop)
    (hdec : ∀ x, fderiv ℝ V x (f x) ≤ 0)
    (hinv : ∀ γ : ℝ → E, IsIntegralCurveOn γ (fun _ ↦ f) (Ici 0) →
      (∀ t, 0 ≤ t → fderiv ℝ V (γ t) (f (γ t)) = 0) → ∀ t, 0 ≤ t → γ t = x₀) :
    IsGloballyAsymptoticallyStable f x₀ := by
  sorry

/-! ## Layer 4: instability -/

/-- 4.1 **Chetaev's instability theorem.** Let `f` be continuously differentiable and `V`
continuously differentiable on a ball around `x₀`, with points where `V > 0` arbitrarily close to
`x₀`, and with positive Lie derivative at every point of the ball where `V > 0`. Then `x₀` is not
Lyapunov stable. -/
theorem not_isLyapunovStable_of_chetaev [FiniteDimensional ℝ E] {f : E → E} {V : E → ℝ}
    {x₀ : E} {r : ℝ} (hf : ContDiff ℝ 1 f) (hr : 0 < r) (hV : ContDiffOn ℝ 1 V (ball x₀ r))
    (hcl : x₀ ∈ closure {x | 0 < V x})
    (hinc : ∀ x ∈ ball x₀ r, 0 < V x → 0 < fderiv ℝ V x (f x)) :
    ¬ IsLyapunovStable f x₀ := by
  sorry

/-! ## Layer 5: Lyapunov's indirect method -/

/-- 5.2 **Exponential stability from the linearization.** Let `f` on `n → ℝ` be continuously
differentiable with `f x₀ = 0`, and let its derivative at `x₀` be the matrix `A`. If every complex
eigenvalue of `A` has negative real part, then `x₀` is exponentially stable. -/
theorem isExponentiallyStable_of_re_neg {n : Type*} [Fintype n] [DecidableEq n]
    {f : (n → ℝ) → n → ℝ} {x₀ : n → ℝ} {A : Matrix n n ℝ} (hf : ContDiff ℝ 1 f) (hx₀ : f x₀ = 0)
    (hA : ∀ v, fderiv ℝ f x₀ v = A *ᵥ v)
    (hH : ∀ μ ∈ spectrum ℂ (A.map (algebraMap ℝ ℂ)), μ.re < 0) :
    IsExponentiallyStable f x₀ := by
  sorry

/-- 5.3 **Instability from the linearization.** Let `f` on `n → ℝ` be continuously
differentiable, and let its derivative at `x₀` be the matrix `A`. If some complex eigenvalue of
`A` has positive real part, then `x₀` is not Lyapunov stable. -/
theorem not_isLyapunovStable_of_re_pos {n : Type*} [Fintype n] [DecidableEq n]
    {f : (n → ℝ) → n → ℝ} {x₀ : n → ℝ} {A : Matrix n n ℝ} (hf : ContDiff ℝ 1 f)
    (hA : ∀ v, fderiv ℝ f x₀ v = A *ᵥ v)
    (hμ : ∃ μ ∈ spectrum ℂ (A.map (algebraMap ℝ ℂ)), 0 < μ.re) :
    ¬ IsLyapunovStable f x₀ := by
  sorry

end TauCetiRoadmap.LyapunovStabilityOfODEs
