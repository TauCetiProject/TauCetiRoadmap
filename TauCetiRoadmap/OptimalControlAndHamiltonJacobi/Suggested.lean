import Mathlib

/-!
# Optimal control and Hamilton–Jacobi equations: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib, each with `sorry`, together with the few definitions
they need; every definition has a real body. Every headline theorem of the README is statable at
the pin and is stated here. The README's remaining targets, API lists and Checks are not restated.

The state space is `EuclideanSpace ℝ (Fin n)` and controls take values in a set `U` of
`EuclideanSpace ℝ (Fin m)`. A control is a measurable function of time with values in `U`; its
trajectory is a solution in Carathéodory's sense, a curve continuous on `[t, T]` that satisfies the
integral form of `ẏ = f(y, α)`. The problem is a minimization: the cost of a pair is the running
cost integrated over `[t, T]` plus the terminal cost, and the value function is the infimum of the
costs. The Hamilton–Jacobi–Bellman equation is written `−∂ₜv + H(x, Dₓv) = 0` with
`H(x, p) = max_{u ∈ U} (−p(f(x, u)) − L(x, u))`; the covector `p` is a continuous linear form on
the state space. Viscosity solutions are tested with `C¹` functions on `ℝ × ℝⁿ`.
-/

noncomputable section

open MeasureTheory Set Filter Topology

namespace TauCetiRoadmap.OptimalControlAndHamiltonJacobi

/-! ## Layer 1: controlled trajectories -/

/-- 1.1 A finite-horizon optimal control problem: a control set `U ⊆ ℝᵐ`, dynamics
`f : ℝⁿ → ℝᵐ → ℝⁿ`, a running cost `L`, a terminal cost `g` and a terminal time `T`. -/
structure ControlProblem (n m : ℕ) where
  /-- The set of control values. -/
  U : Set (EuclideanSpace ℝ (Fin m))
  /-- The dynamics `ẏ = f(y, u)`. -/
  f : EuclideanSpace ℝ (Fin n) → EuclideanSpace ℝ (Fin m) → EuclideanSpace ℝ (Fin n)
  /-- The running cost. -/
  L : EuclideanSpace ℝ (Fin n) → EuclideanSpace ℝ (Fin m) → ℝ
  /-- The terminal cost. -/
  g : EuclideanSpace ℝ (Fin n) → ℝ
  /-- The terminal time. -/
  T : ℝ

namespace ControlProblem

variable {n m : ℕ} (P : ControlProblem n m)

/-- 1.1 An admissible pair from the initial time `t` and the initial state `x`: a measurable
control `α` with values in `U` and a trajectory `y`, continuous on `[t, T]`, along which the
velocity `f(y, α)` and the running cost `L(y, α)` are integrable on `[t, T]`, and which satisfies
`y s = x + ∫ r in t..s, f (y r) (α r)` for every `s ∈ [t, T]`. -/
structure IsAdmissiblePair (t : ℝ) (x : EuclideanSpace ℝ (Fin n))
    (α : ℝ → EuclideanSpace ℝ (Fin m)) (y : ℝ → EuclideanSpace ℝ (Fin n)) : Prop where
  measurable : Measurable α
  mem : ∀ s, α s ∈ P.U
  continuousOn : ContinuousOn y (Icc t P.T)
  integrableOn_f : IntegrableOn (fun s ↦ P.f (y s) (α s)) (Icc t P.T)
  integrableOn_L : IntegrableOn (fun s ↦ P.L (y s) (α s)) (Icc t P.T)
  eq_integral : ∀ s ∈ Icc t P.T, y s = x + ∫ r in t..s, P.f (y r) (α r)

/-- 1.1 The cost of a control `α` and a trajectory `y` from the initial time `t`:
`∫ s in t..T, L (y s) (α s) + g (y T)`. -/
def cost (t : ℝ) (α : ℝ → EuclideanSpace ℝ (Fin m)) (y : ℝ → EuclideanSpace ℝ (Fin n)) : ℝ :=
  (∫ s in t..P.T, P.L (y s) (α s)) + P.g (y P.T)

/-- 1.1 The set of costs of the admissible pairs from `(t, x)`. -/
def costs (t : ℝ) (x : EuclideanSpace ℝ (Fin n)) : Set ℝ :=
  {c | ∃ α y, P.IsAdmissiblePair t x α y ∧ P.cost t α y = c}

/-- 1.2 Carathéodory existence for controlled equations. If `U` is compact, `f` and `L` are
continuous on `ℝⁿ × U` and `f` is Lipschitz in the state uniformly over `U`, then every measurable
control with values in `U` has, from every initial time `t ≤ T` and state `x`, a trajectory making
it an admissible pair. -/
theorem exists_isAdmissiblePair (hU : IsCompact P.U)
    (hf : ContinuousOn (Function.uncurry P.f) (univ ×ˢ P.U))
    (hL : ContinuousOn (Function.uncurry P.L) (univ ×ˢ P.U))
    {K : NNReal} (hK : ∀ u ∈ P.U, LipschitzWith K (fun x ↦ P.f x u))
    {α : ℝ → EuclideanSpace ℝ (Fin m)} (hα : Measurable α) (hαU : ∀ s, α s ∈ P.U)
    {t : ℝ} (ht : t ≤ P.T) (x : EuclideanSpace ℝ (Fin n)) :
    ∃ y, P.IsAdmissiblePair t x α y := by
  sorry

/-- 1.2 Uniqueness of trajectories. If `f` is Lipschitz in the state uniformly over `U`, two
admissible pairs with the same control and the same initial data have trajectories that agree on
`[t, T]`. -/
theorem eqOn_of_isAdmissiblePair {K : NNReal} (hK : ∀ u ∈ P.U, LipschitzWith K (fun x ↦ P.f x u))
    {t : ℝ} {x : EuclideanSpace ℝ (Fin n)} {α : ℝ → EuclideanSpace ℝ (Fin m)}
    {y₁ y₂ : ℝ → EuclideanSpace ℝ (Fin n)} (h₁ : P.IsAdmissiblePair t x α y₁)
    (h₂ : P.IsAdmissiblePair t x α y₂) :
    EqOn y₁ y₂ (Icc t P.T) := by
  sorry

/-! ## Layer 2: the value function and dynamic programming -/

/-- 2.1 The standing assumptions: `U` is compact and nonempty; `f` and `L` are continuous on
`ℝⁿ × U`, bounded there and Lipschitz in the state uniformly over `U`; `g` is bounded and
Lipschitz. -/
structure Assumptions : Prop where
  isCompact_U : IsCompact P.U
  nonempty_U : P.U.Nonempty
  continuousOn_f : ContinuousOn (Function.uncurry P.f) (univ ×ˢ P.U)
  continuousOn_L : ContinuousOn (Function.uncurry P.L) (univ ×ˢ P.U)
  bounded_f : ∃ M, ∀ x, ∀ u ∈ P.U, ‖P.f x u‖ ≤ M
  bounded_L : ∃ M, ∀ x, ∀ u ∈ P.U, |P.L x u| ≤ M
  bounded_g : ∃ M, ∀ x, |P.g x| ≤ M
  lipschitz_f : ∃ K : NNReal, ∀ u ∈ P.U, LipschitzWith K (fun x ↦ P.f x u)
  lipschitz_L : ∃ K : NNReal, ∀ u ∈ P.U, LipschitzWith K (fun x ↦ P.L x u)
  lipschitz_g : ∃ K : NNReal, LipschitzWith K P.g

/-- 2.1 The value function: the infimum of the costs of the admissible pairs from `(t, x)`. -/
def valueFunction (t : ℝ) (x : EuclideanSpace ℝ (Fin n)) : ℝ :=
  sInf (P.costs t x)

/-- 2.2 The dynamic programming principle. Under the standing assumptions, for `t ≤ τ ≤ T`, the
value at `(t, x)` is the infimum, over the admissible pairs from `(t, x)`, of the running cost on
`[t, τ]` plus the value at `(τ, y τ)`. -/
theorem valueFunction_eq_sInf (hP : P.Assumptions) {t τ : ℝ} (htτ : t ≤ τ) (hτ : τ ≤ P.T)
    (x : EuclideanSpace ℝ (Fin n)) :
    P.valueFunction t x =
      sInf {c | ∃ α y, P.IsAdmissiblePair t x α y ∧
        (∫ s in t..τ, P.L (y s) (α s)) + P.valueFunction τ (y τ) = c} := by
  sorry

/-- 2.3 Under the standing assumptions the value function is bounded and Lipschitz on
`[0, T] × ℝⁿ`. -/
theorem valueFunction_bounded_lipschitz (hP : P.Assumptions) :
    (∃ C, ∀ t ∈ Icc 0 P.T, ∀ x, |P.valueFunction t x| ≤ C) ∧
    ∃ C, ∀ t ∈ Icc 0 P.T, ∀ s ∈ Icc 0 P.T, ∀ x y,
      |P.valueFunction t x - P.valueFunction s y| ≤ C * (|t - s| + ‖x - y‖) := by
  sorry

end ControlProblem

/-! ## Layer 3: viscosity solutions of the Hamilton–Jacobi–Bellman equation -/

section Viscosity

variable {n : ℕ}

/-- 3.1 The time derivative `∂ₜφ(z) = Dφ(z)(1, 0)` of a function on `ℝ × ℝⁿ`. -/
def timeDeriv (φ : ℝ × EuclideanSpace ℝ (Fin n) → ℝ) (z : ℝ × EuclideanSpace ℝ (Fin n)) : ℝ :=
  fderiv ℝ φ z (1, 0)

/-- 3.1 The spatial derivative `Dₓφ(z) = Dφ(z) ∘ (x ↦ (0, x))`, a continuous linear form on
`ℝⁿ`. -/
def spaceDeriv (φ : ℝ × EuclideanSpace ℝ (Fin n) → ℝ) (z : ℝ × EuclideanSpace ℝ (Fin n)) :
    EuclideanSpace ℝ (Fin n) →L[ℝ] ℝ :=
  (fderiv ℝ φ z).comp (ContinuousLinearMap.inr ℝ ℝ (EuclideanSpace ℝ (Fin n)))

/-- 3.1 `u` is a viscosity subsolution of `−∂ₜu + H(x, Dₓu) = 0` on `Ω`: whenever a `C¹` function
`φ` is such that `u − φ` has a local maximum relative to `Ω` at `z ∈ Ω`,
`−∂ₜφ(z) + H(x, Dₓφ(z)) ≤ 0`, where `x` is the state coordinate of `z`. -/
def IsViscositySubsolution
    (H : EuclideanSpace ℝ (Fin n) → (EuclideanSpace ℝ (Fin n) →L[ℝ] ℝ) → ℝ)
    (Ω : Set (ℝ × EuclideanSpace ℝ (Fin n))) (u : ℝ × EuclideanSpace ℝ (Fin n) → ℝ) : Prop :=
  ∀ φ : ℝ × EuclideanSpace ℝ (Fin n) → ℝ, ContDiff ℝ 1 φ → ∀ z ∈ Ω,
    IsLocalMaxOn (fun w ↦ u w - φ w) Ω z → -timeDeriv φ z + H z.2 (spaceDeriv φ z) ≤ 0

/-- 3.1 `u` is a viscosity supersolution of `−∂ₜu + H(x, Dₓu) = 0` on `Ω`: whenever a `C¹`
function `φ` is such that `u − φ` has a local minimum relative to `Ω` at `z ∈ Ω`,
`−∂ₜφ(z) + H(x, Dₓφ(z)) ≥ 0`. -/
def IsViscositySupersolution
    (H : EuclideanSpace ℝ (Fin n) → (EuclideanSpace ℝ (Fin n) →L[ℝ] ℝ) → ℝ)
    (Ω : Set (ℝ × EuclideanSpace ℝ (Fin n))) (u : ℝ × EuclideanSpace ℝ (Fin n) → ℝ) : Prop :=
  ∀ φ : ℝ × EuclideanSpace ℝ (Fin n) → ℝ, ContDiff ℝ 1 φ → ∀ z ∈ Ω,
    IsLocalMinOn (fun w ↦ u w - φ w) Ω z → 0 ≤ -timeDeriv φ z + H z.2 (spaceDeriv φ z)

/-- 3.1 A viscosity solution is a function that is both a viscosity subsolution and a viscosity
supersolution. -/
def IsViscositySolution
    (H : EuclideanSpace ℝ (Fin n) → (EuclideanSpace ℝ (Fin n) →L[ℝ] ℝ) → ℝ)
    (Ω : Set (ℝ × EuclideanSpace ℝ (Fin n))) (u : ℝ × EuclideanSpace ℝ (Fin n) → ℝ) : Prop :=
  IsViscositySubsolution H Ω u ∧ IsViscositySupersolution H Ω u

end Viscosity

namespace ControlProblem

variable {n m : ℕ} (P : ControlProblem n m)

/-- 3.2 The Hamiltonian of a control problem, `H(x, p) = sup_{u ∈ U} (−p(f(x, u)) − L(x, u))`.
Under the standing assumptions the supremum is a maximum. -/
def hamiltonian (x : EuclideanSpace ℝ (Fin n)) (p : EuclideanSpace ℝ (Fin n) →L[ℝ] ℝ) : ℝ :=
  sSup ((fun u ↦ -p (P.f x u) - P.L x u) '' P.U)

/-- 3.4 Under the standing assumptions the value function is a viscosity solution of
`−∂ₜv + H(x, Dₓv) = 0` on `(0, T) × ℝⁿ`. -/
theorem isViscositySolution_valueFunction (hP : P.Assumptions) :
    IsViscositySolution P.hamiltonian (Ioo 0 P.T ×ˢ univ)
      (fun z ↦ P.valueFunction z.1 z.2) := by
  sorry

end ControlProblem

/-! ## Layer 4: comparison and uniqueness -/

section Comparison

variable {n : ℕ}

/-- 4.1 The comparison principle. Let `H` satisfy `|H(x, p) − H(y, p)| ≤ ω(‖x − y‖ (1 + ‖p‖))` and
`|H(x, p) − H(x, q)| ≤ ω₁(‖p − q‖)` for functions `ω`, `ω₁` tending to `0` at `0⁺`. If `u` and `w`
are bounded and continuous on `[0, T] × ℝⁿ`, `u` is a viscosity subsolution and `w` a viscosity
supersolution of `−∂ₜu + H(x, Dₓu) = 0` on `(0, T) × ℝⁿ`, and `u(T, ·) ≤ w(T, ·)`, then `u ≤ w`
on `[0, T] × ℝⁿ`. -/
theorem le_of_isViscositySubsolution_of_isViscositySupersolution
    {H : EuclideanSpace ℝ (Fin n) → (EuclideanSpace ℝ (Fin n) →L[ℝ] ℝ) → ℝ} {ω ω₁ : ℝ → ℝ}
    (hω : Tendsto ω (𝓝[≥] 0) (𝓝 0)) (hω₁ : Tendsto ω₁ (𝓝[≥] 0) (𝓝 0))
    (hHx : ∀ x y p, |H x p - H y p| ≤ ω (‖x - y‖ * (1 + ‖p‖)))
    (hHp : ∀ x p q, |H x p - H x q| ≤ ω₁ ‖p - q‖)
    {T : ℝ} {u w : ℝ × EuclideanSpace ℝ (Fin n) → ℝ}
    (hu : ContinuousOn u (Icc 0 T ×ˢ univ)) (hw : ContinuousOn w (Icc 0 T ×ˢ univ))
    (hub : ∃ C, ∀ z ∈ Icc 0 T ×ˢ univ, |u z| ≤ C) (hwb : ∃ C, ∀ z ∈ Icc 0 T ×ˢ univ, |w z| ≤ C)
    (hsub : IsViscositySubsolution H (Ioo 0 T ×ˢ univ) u)
    (hsup : IsViscositySupersolution H (Ioo 0 T ×ˢ univ) w)
    (hT : ∀ x, u (T, x) ≤ w (T, x)) :
    ∀ z ∈ Icc 0 T ×ˢ univ, u z ≤ w z := by
  sorry

end Comparison

namespace ControlProblem

variable {n m : ℕ} (P : ControlProblem n m)

/-- 4.2 Uniqueness. Under the standing assumptions the value function is the only function that is
bounded and continuous on `[0, T] × ℝⁿ`, is a viscosity solution of `−∂ₜw + H(x, Dₓw) = 0` on
`(0, T) × ℝⁿ` and equals `g` at time `T`. -/
theorem eqOn_valueFunction_of_isViscositySolution (hP : P.Assumptions)
    {w : ℝ × EuclideanSpace ℝ (Fin n) → ℝ} (hw : ContinuousOn w (Icc 0 P.T ×ˢ univ))
    (hwb : ∃ C, ∀ z ∈ Icc 0 P.T ×ˢ univ, |w z| ≤ C)
    (hsol : IsViscositySolution P.hamiltonian (Ioo 0 P.T ×ˢ univ) w)
    (hT : ∀ x, w (P.T, x) = P.g x) :
    EqOn w (fun z ↦ P.valueFunction z.1 z.2) (Icc 0 P.T ×ˢ univ) := by
  sorry

/-! ## Layer 5: the verification theorem -/

/-- 5.1 The verification theorem. Let `t ≤ T` and let `w` be `C¹` on `ℝ × ℝⁿ` with `w(T, ·) = g`,
such that `0 ≤ ∂ₜw(s, x) + Dₓw(s, x)(f(x, u)) + L(x, u)` for all `s ∈ [t, T)`, all `x` and all
`u ∈ U`. If an admissible pair `(α̂, ŷ)` from `(t, x)` attains equality,
`∂ₜw + Dₓw(f) + L = 0` along it, for almost every `s ∈ [t, T]`, then its cost `w(t, x)` is the
least cost of the admissible pairs from `(t, x)`. -/
theorem isLeast_costs_of_hjb {w : ℝ × EuclideanSpace ℝ (Fin n) → ℝ} (hw : ContDiff ℝ 1 w)
    (hwT : ∀ x, w (P.T, x) = P.g x) {t : ℝ} (htT : t ≤ P.T)
    (hHJB : ∀ s ∈ Ico t P.T, ∀ x, ∀ u ∈ P.U,
      0 ≤ timeDeriv w (s, x) + spaceDeriv w (s, x) (P.f x u) + P.L x u)
    {x : EuclideanSpace ℝ (Fin n)} {α : ℝ → EuclideanSpace ℝ (Fin m)}
    {y : ℝ → EuclideanSpace ℝ (Fin n)} (hαy : P.IsAdmissiblePair t x α y)
    (hmin : ∀ᵐ s ∂volume.restrict (Icc t P.T),
      timeDeriv w (s, y s) + spaceDeriv w (s, y s) (P.f (y s) (α s)) + P.L (y s) (α s) = 0) :
    P.cost t α y = w (t, x) ∧ IsLeast (P.costs t x) (w (t, x)) := by
  sorry

/-! ## Layer 6: Pontryagin's maximum principle -/

/-- 6.2 Pontryagin's maximum principle for the fixed-time free-endpoint problem, in minimum form.
Let `U` be compact, `f` and `L` continuous on `ℝⁿ × U` and differentiable in the state with
partial derivatives continuous on `ℝⁿ × U`, and `g` of class `C¹`. Let `(α, y)` be an admissible
pair from `(t, x)` whose cost is at most the cost of every admissible pair from `(t, x)`, and let
the costate `p`, continuous on `[t, T]`, solve the adjoint equation
`p s = Dg(y T) + ∫ r in s..T, (p r ∘ ∂ₓf(y r, α r) + ∂ₓL(y r, α r))`. Then for almost every
`s ∈ [t, T]` the control value `α s` minimizes `u ↦ p s (f(y s, u)) + L(y s, u)` over `U`. -/
theorem pontryagin_minimum_principle (hU : IsCompact P.U)
    (hf : ContinuousOn (Function.uncurry P.f) (univ ×ˢ P.U))
    (hL : ContinuousOn (Function.uncurry P.L) (univ ×ˢ P.U))
    (hfd : ∀ u ∈ P.U, Differentiable ℝ (fun x ↦ P.f x u))
    (hLd : ∀ u ∈ P.U, Differentiable ℝ (fun x ↦ P.L x u))
    (hfd' : ContinuousOn (fun z : EuclideanSpace ℝ (Fin n) × EuclideanSpace ℝ (Fin m) ↦
      fderiv ℝ (fun x ↦ P.f x z.2) z.1) (univ ×ˢ P.U))
    (hLd' : ContinuousOn (fun z : EuclideanSpace ℝ (Fin n) × EuclideanSpace ℝ (Fin m) ↦
      fderiv ℝ (fun x ↦ P.L x z.2) z.1) (univ ×ˢ P.U))
    (hg : ContDiff ℝ 1 P.g)
    {t : ℝ} {x : EuclideanSpace ℝ (Fin n)} {α : ℝ → EuclideanSpace ℝ (Fin m)}
    {y : ℝ → EuclideanSpace ℝ (Fin n)} (hαy : P.IsAdmissiblePair t x α y)
    (hopt : ∀ c ∈ P.costs t x, P.cost t α y ≤ c)
    {p : ℝ → EuclideanSpace ℝ (Fin n) →L[ℝ] ℝ} (hp : ContinuousOn p (Icc t P.T))
    (hadj : ∀ s ∈ Icc t P.T, p s = fderiv ℝ P.g (y P.T) +
      ∫ r in s..P.T, ((p r).comp (fderiv ℝ (fun x ↦ P.f x (α r)) (y r)) +
        fderiv ℝ (fun x ↦ P.L x (α r)) (y r))) :
    ∀ᵐ s ∂volume.restrict (Icc t P.T), ∀ u ∈ P.U,
      p s (P.f (y s) (α s)) + P.L (y s) (α s) ≤ p s (P.f (y s) u) + P.L (y s) u := by
  sorry

end ControlProblem

end TauCetiRoadmap.OptimalControlAndHamiltonJacobi
