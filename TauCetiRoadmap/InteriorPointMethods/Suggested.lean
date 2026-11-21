import Mathlib

/-!
# Interior-point methods: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib, each with `sorry`, together with the definitions
they need; every definition has a real body. Every headline theorem of the README is statable at
the pins and is stated here. The README's remaining Checks and examples are not restated.

Derivatives are Mathlib's `fderiv`: the Hessian of `f` at `x` evaluated at `(v, w)` is
`fderiv ℝ (fderiv ℝ f) x v w` and the third derivative is
`fderiv ℝ (fderiv ℝ (fderiv ℝ f)) x u v w`. `ContinuousLinearMap.inverse` is the inverse of a
continuous linear equivalence and `0` for any other map; `Real.log` is `0` at `0` and
`log |u|` at `u < 0`; these junk values are never reached under the stated hypotheses. The
Newton map `newtonMap` is copied verbatim from the roadmap NewtonAndQuasiNewtonMethods, 1.1,
inside a section with that roadmap's `variable` line, so that it has the same signature there.
-/

noncomputable section

open Filter Set
open scoped Topology

namespace TauCetiRoadmap.InteriorPointMethods

/-! ## Layer 1: the logarithmic barrier and the central path -/

section CentralPath

variable {E ι : Type*} [AddCommGroup E] [Module ℝ E] [Fintype ι]

/-- 1.1 The logarithmic barrier `φ(x) = -∑ᵢ log(-gᵢ(x))` of the constraints `gᵢ ≤ 0`. -/
def logBarrier (g : ι → E → ℝ) (x : E) : ℝ :=
  -∑ i, Real.log (-g i x)

/-- 1.1 The strictly feasible points of `S`: the `x ∈ S` with `gᵢ(x) < 0` for every `i`. -/
def strictFeasibleSet (S : Set E) (g : ι → E → ℝ) : Set E :=
  {x | x ∈ S ∧ ∀ i, g i x < 0}

/-- 1.2 The central point bound. Let `f₀` and the `gᵢ` be convex on `S`, `t > 0`, and let `x`
minimize `t f₀ + φ` over the strictly feasible points. Then for every `z ∈ S`,
`f₀(x) - m/t ≤ f₀(z) + ∑ᵢ gᵢ(z) / (-t gᵢ(x))` (the Lagrangian at the multipliers
`λᵢ = -1/(t gᵢ(x))`), and in particular `f₀(x) - m/t ≤ f₀(z)` for every feasible `z`, where `m`
is the number of constraints. No differentiability is assumed. -/
theorem centralPath_bound {S : Set E} {f₀ : E → ℝ} {g : ι → E → ℝ} {t : ℝ} {x : E}
    (hf₀ : ConvexOn ℝ S f₀) (hg : ∀ i, ConvexOn ℝ S (g i)) (ht : 0 < t)
    (hx : x ∈ strictFeasibleSet S g)
    (hmin : IsMinOn (fun z => t * f₀ z + logBarrier g z) (strictFeasibleSet S g) x) :
    (∀ z ∈ S, f₀ x - Fintype.card ι / t ≤ f₀ z + ∑ i, g i z / (-(t * g i x))) ∧
      ∀ z ∈ S, (∀ i, g i z ≤ 0) → f₀ x - Fintype.card ι / t ≤ f₀ z := by
  sorry

/-- 1.3 The centering gap. Under the hypotheses of 1.2, for every `μ > 0` and every strictly
feasible `y`, `(μ t f₀(x) + φ(x)) - (μ t f₀(y) + φ(y)) ≤ m (μ - 1 - log μ)`. -/
theorem centering_gap {S : Set E} {f₀ : E → ℝ} {g : ι → E → ℝ} {t μ : ℝ} {x y : E}
    (hf₀ : ConvexOn ℝ S f₀) (hg : ∀ i, ConvexOn ℝ S (g i)) (ht : 0 < t) (hμ : 0 < μ)
    (hx : x ∈ strictFeasibleSet S g)
    (hmin : IsMinOn (fun z => t * f₀ z + logBarrier g z) (strictFeasibleSet S g) x)
    (hy : y ∈ strictFeasibleSet S g) :
    μ * t * f₀ x + logBarrier g x - (μ * t * f₀ y + logBarrier g y) ≤
      Fintype.card ι * (μ - 1 - Real.log μ) := by
  sorry

/-- 1.4 The outer iterations. Let `t₀ > 0`, `μ > 1`, and let `x k` minimize
`μ ^ k t₀ f₀ + φ` over the strictly feasible points for every `k`. If
`log (m / (ε t₀)) / log μ ≤ k` with `ε > 0`, then `f₀(x k) - f₀(z) ≤ ε` for every feasible `z`. -/
theorem barrierCenters_sub_le {S : Set E} {f₀ : E → ℝ} {g : ι → E → ℝ} {t₀ μ ε : ℝ}
    (hf₀ : ConvexOn ℝ S f₀) (hg : ∀ i, ConvexOn ℝ S (g i)) (ht₀ : 0 < t₀) (hμ : 1 < μ)
    (hε : 0 < ε) {x : ℕ → E} (hx : ∀ k, x k ∈ strictFeasibleSet S g)
    (hmin : ∀ k, IsMinOn (fun z => μ ^ k * t₀ * f₀ z + logBarrier g z)
      (strictFeasibleSet S g) (x k))
    {k : ℕ} (hk : Real.log (Fintype.card ι / (ε * t₀)) / Real.log μ ≤ k) :
    ∀ z ∈ S, (∀ i, g i z ≤ 0) → f₀ (x k) - f₀ z ≤ ε := by
  sorry

end CentralPath

/-! ## Layer 2: self-concordant functions -/

section SelfConcordance

variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]

/-- 2.1 `f` is self-concordant on `U`: `U` is open, `f` is `C³` and convex on `U` (so `U` is
convex), and `|D³f(x)[v, v, v]| ≤ 2 (D²f(x)[v, v]) ^ (3/2)` for every `x ∈ U` and every `v`. The
barrier property is not part of the definition; theorems that need it assume it. -/
structure SelfConcordantOn (f : E → ℝ) (U : Set E) : Prop where
  isOpen : IsOpen U
  contDiffOn : ContDiffOn ℝ 3 f U
  convexOn : ConvexOn ℝ U f
  abs_third_le : ∀ x ∈ U, ∀ v : E,
    |fderiv ℝ (fderiv ℝ (fderiv ℝ f)) x v v v| ≤
      2 * fderiv ℝ (fderiv ℝ f) x v v ^ ((3 : ℝ) / 2)

/-- 2.2 Affine substitution: if `f` is self-concordant on `U`, then `y ↦ f (A y + b)` is
self-concordant on `{y | A y + b ∈ U}`. -/
theorem SelfConcordantOn.comp_affine {F : Type*} [NormedAddCommGroup F] [NormedSpace ℝ F]
    {f : E → ℝ} {U : Set E} (hf : SelfConcordantOn f U) (A : F →L[ℝ] E) (b : E) :
    SelfConcordantOn (fun y => f (A y + b)) {y | A y + b ∈ U} := by
  sorry

/-- 2.3 Weighted sums: if each `f i` (`i ∈ s`) is self-concordant on `U i` and `1 ≤ α i`, then
`∑ i ∈ s, α i f i` is self-concordant on `⋂ i ∈ s, U i`. -/
theorem SelfConcordantOn.sum {κ : Type*} (s : Finset κ) {f : κ → E → ℝ} {U : κ → Set E}
    {α : κ → ℝ} (hf : ∀ i ∈ s, SelfConcordantOn (f i) (U i)) (hα : ∀ i ∈ s, 1 ≤ α i) :
    SelfConcordantOn (fun x => ∑ i ∈ s, α i * f i x) (⋂ i ∈ s, U i) := by
  sorry

/-- 2.4 The logarithmic barrier of the polyhedron `{x | aᵢ x ≤ bᵢ}`,
`x ↦ -∑ᵢ log(bᵢ - aᵢ x)`, is self-concordant on the interior `{x | ∀ i, aᵢ x < bᵢ}` and tends to
`+∞` at every frontier point of it. -/
theorem logBarrier_linear {ι : Type*} [Fintype ι] (a : ι → E →L[ℝ] ℝ) (b : ι → ℝ) :
    SelfConcordantOn (logBarrier fun i x => a i x - b i)
        (strictFeasibleSet univ fun i x => a i x - b i) ∧
      ∀ y ∈ frontier (strictFeasibleSet univ fun i x => a i x - b i),
        Tendsto (logBarrier fun i x => a i x - b i)
          (𝓝[strictFeasibleSet univ fun i x => a i x - b i] y) atTop := by
  sorry

/-- 2.5 The log-determinant along a symmetric line: for every square real matrix `X` and every
symmetric `V`, `t ↦ -log det (X + t V)` is self-concordant on `{t | X + t V is positive
definite}`. -/
theorem selfConcordantOn_neg_log_det {n : Type*} [Fintype n] [DecidableEq n]
    (X V : Matrix n n ℝ) (hV : V.IsHermitian) :
    SelfConcordantOn (fun t : ℝ => -Real.log (X + t • V).det) {t : ℝ | (X + t • V).PosDef} := by
  sorry

/-! ## Layer 3: local behaviour of a self-concordant function -/

/-- 3.1 The local norm `|h|ₓ = (D²f(x)[h, h]) ^ (1/2)` defined by the Hessian of `f` at `x`. -/
def localNorm (f : E → ℝ) (x h : E) : ℝ :=
  √(fderiv ℝ (fderiv ℝ f) x h h)

/-- 3.1 The basic inequality: for `f` self-concordant on `U` and `x ∈ U`,
`|D³f(x)[h₁, h₂, h₃]| ≤ 2 |h₁|ₓ |h₂|ₓ |h₃|ₓ` for all `h₁, h₂, h₃`. -/
theorem SelfConcordantOn.abs_third_le_localNorm {f : E → ℝ} {U : Set E}
    (hf : SelfConcordantOn f U) {x : E} (hx : x ∈ U) (h₁ h₂ h₃ : E) :
    |fderiv ℝ (fderiv ℝ (fderiv ℝ f)) x h₁ h₂ h₃| ≤
      2 * localNorm f x h₁ * localNorm f x h₂ * localNorm f x h₃ := by
  sorry

/-- 3.2 Hessian comparison: for `x, x + h ∈ U` with `r = |h|ₓ < 1` and every `g`,
`(1 - r)² D²f(x)[g, g] ≤ D²f(x + h)[g, g] ≤ D²f(x)[g, g] / (1 - r)²`. -/
theorem SelfConcordantOn.hessian_comparison {f : E → ℝ} {U : Set E}
    (hf : SelfConcordantOn f U) {x h : E} (hx : x ∈ U) (hxh : x + h ∈ U)
    (hr : localNorm f x h < 1) (g : E) :
    (1 - localNorm f x h) ^ 2 * fderiv ℝ (fderiv ℝ f) x g g ≤
        fderiv ℝ (fderiv ℝ f) (x + h) g g ∧
      fderiv ℝ (fderiv ℝ f) (x + h) g g ≤
        fderiv ℝ (fderiv ℝ f) x g g / (1 - localNorm f x h) ^ 2 := by
  sorry

/-- 3.3 Bounds on the function: for `x, x + h ∈ U` and `r = |h|ₓ`,
`f(x) + Df(x)[h] + r - log(1 + r) ≤ f(x + h)`, and if `r < 1`,
`f(x + h) ≤ f(x) + Df(x)[h] - r - log(1 - r)`. -/
theorem SelfConcordantOn.bounds {f : E → ℝ} {U : Set E} (hf : SelfConcordantOn f U) {x h : E}
    (hx : x ∈ U) (hxh : x + h ∈ U) :
    f x + fderiv ℝ f x h + (localNorm f x h - Real.log (1 + localNorm f x h)) ≤ f (x + h) ∧
      (localNorm f x h < 1 →
        f (x + h) ≤
          f x + fderiv ℝ f x h + (-localNorm f x h - Real.log (1 - localNorm f x h))) := by
  sorry

/-- 3.4 The Dikin ellipsoid: if `f` is self-concordant on `U` and tends to `+∞` at every frontier
point of `U`, then `x + h ∈ U` for every `x ∈ U` and every `h` with `|h|ₓ < 1`. -/
theorem SelfConcordantOn.add_mem_of_localNorm_lt_one {f : E → ℝ} {U : Set E}
    (hf : SelfConcordantOn f U) (hbar : ∀ y ∈ frontier U, Tendsto f (𝓝[U] y) atTop) {x h : E}
    (hx : x ∈ U) (hr : localNorm f x h < 1) : x + h ∈ U := by
  sorry

/-- 3.5 The Newton decrement `λ(x) = (Df(x)[D²f(x)⁻¹ Df(x)]) ^ (1/2)`. -/
def newtonDecrement (f : E → ℝ) (x : E) : ℝ :=
  √(fderiv ℝ f x ((fderiv ℝ (fderiv ℝ f) x).inverse (fderiv ℝ f x)))

/-- 3.5 Suboptimality: in finite dimension, if `f` is self-concordant on `U`, its Hessian at
`x ∈ U` is positive definite and `λ = λ(x) < 1`, then `f(x) - f(y) ≤ -λ - log(1 - λ)` for every
`y ∈ U`. -/
theorem SelfConcordantOn.sub_le_of_newtonDecrement_lt_one [FiniteDimensional ℝ E] {f : E → ℝ}
    {U : Set E} (hf : SelfConcordantOn f U) {x : E} (hx : x ∈ U)
    (hpd : ∀ v : E, v ≠ 0 → 0 < fderiv ℝ (fderiv ℝ f) x v v)
    (hlam : newtonDecrement f x < 1) {y : E} (hy : y ∈ U) :
    f x - f y ≤ -newtonDecrement f x - Real.log (1 - newtonDecrement f x) := by
  sorry

/-! ## Layer 4: the damped Newton method -/

section NewtonMap

/- The `variable` line of NewtonAndQuasiNewtonMethods, so that the copy below has the owner's
signature. -/
variable {E F : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [NormedAddCommGroup F]
  [NormedSpace ℝ F]

/-- 4.1 The Newton map of `f`: `x ↦ x - f'(x)⁻¹ f(x)`, with Mathlib's
`ContinuousLinearMap.inverse`, which is `0` when `fderiv ℝ f x` is not invertible (and then the
Newton map fixes `x`). Copied verbatim, with its `variable` line, from
NewtonAndQuasiNewtonMethods 1.1. -/
def newtonMap (f : E → F) (x : E) : E :=
  x - (fderiv ℝ f x).inverse (f x)

end NewtonMap

/-- 4.1 The damped Newton map `x ↦ x + (1 + λ(x))⁻¹ e(x)`, where `e(x) = -D²f(x)⁻¹ Df(x)` is the
Newton step of the gradient map `fderiv ℝ f`. -/
def dampedNewtonMap (f : E → ℝ) (x : E) : E :=
  x + (1 + newtonDecrement f x)⁻¹ • (newtonMap (fderiv ℝ f) x - x)

/-- 4.1 The damped Newton sequence from `x₀`: the `k`-th iterate of the damped Newton map. -/
def dampedNewtonSeq (f : E → ℝ) (x₀ : E) (k : ℕ) : E :=
  (dampedNewtonMap f)^[k] x₀

/-- 4.2 One damped Newton step: in finite dimension, for `f` self-concordant on `U`, tending to
`+∞` at the frontier of `U`, with positive definite Hessian on `U`, and `x ∈ U`, the damped Newton
iterate `x₊` lies in `U`, `f(x₊) ≤ f(x) - (λ - log(1 + λ))` with `λ = λ(x)`, and
`λ(x₊) ≤ 2 λ²`. -/
theorem dampedNewtonMap_spec [FiniteDimensional ℝ E] {f : E → ℝ} {U : Set E}
    (hf : SelfConcordantOn f U) (hbar : ∀ y ∈ frontier U, Tendsto f (𝓝[U] y) atTop)
    (hpd : ∀ x ∈ U, ∀ v : E, v ≠ 0 → 0 < fderiv ℝ (fderiv ℝ f) x v v) {x : E} (hx : x ∈ U) :
    dampedNewtonMap f x ∈ U ∧
      f (dampedNewtonMap f x) ≤
        f x - (newtonDecrement f x - Real.log (1 + newtonDecrement f x)) ∧
      newtonDecrement f (dampedNewtonMap f x) ≤ 2 * newtonDecrement f x ^ 2 := by
  sorry

/-- 4.3 The two phases of the damped Newton sequence. Under the hypotheses of 4.2, let `x₀ ∈ U`
and `p ≤ f` on `U`, and write `γ = 1/4 - log (5/4)`. Some `k₀ ≤ (f(x₀) - p)/γ` has
`2 λ(x_(k₀ + j)) ≤ (1/2) ^ (2 ^ j)` for every `j`; and for `0 < ε ≤ 1/2`, every
`l ≥ (f(x₀) - p)/γ + log₂ log₂ (1/ε)` has `f(x_l) - f(y) ≤ ε` for all `y ∈ U`. -/
theorem dampedNewtonSeq_two_phase [FiniteDimensional ℝ E] {f : E → ℝ} {U : Set E}
    (hf : SelfConcordantOn f U) (hbar : ∀ y ∈ frontier U, Tendsto f (𝓝[U] y) atTop)
    (hpd : ∀ x ∈ U, ∀ v : E, v ≠ 0 → 0 < fderiv ℝ (fderiv ℝ f) x v v) {x₀ : E} (hx₀ : x₀ ∈ U)
    {p : ℝ} (hp : ∀ y ∈ U, p ≤ f y) :
    (∃ k₀ : ℕ, (k₀ : ℝ) ≤ (f x₀ - p) / (1 / 4 - Real.log (5 / 4)) ∧
        ∀ j : ℕ, 2 * newtonDecrement f (dampedNewtonSeq f x₀ (k₀ + j)) ≤ (1 / 2) ^ (2 ^ j)) ∧
      ∀ ε : ℝ, 0 < ε → ε ≤ 1 / 2 → ∀ l : ℕ,
        (f x₀ - p) / (1 / 4 - Real.log (5 / 4)) + Real.logb 2 (Real.logb 2 (1 / ε)) ≤ l →
          ∀ y ∈ U, f (dampedNewtonSeq f x₀ l) - f y ≤ ε := by
  sorry

end SelfConcordance

/-! ## Layer 5: Newton steps per centering step -/

/-- 5.1 Newton steps per centering step. In a finite-dimensional space, let `f₀` and the `gᵢ` be
convex on `S`, `t > 0`, `μ > 0`, and let `x` minimize `t f₀ + φ` over the strictly feasible set
`S°`. Suppose `F = μ t f₀ + φ` is self-concordant on `S°`, tends to `+∞` at its frontier and has
positive definite Hessian on it. Then the damped Newton sequence of `F` from `x` has some
`k₀ ≤ m (μ - 1 - log μ)/γ` with `2 λ_F(x_(k₀ + j)) ≤ (1/2) ^ (2 ^ j)` for every `j`, and for
`0 < ε ≤ 1/2` every `l ≥ m (μ - 1 - log μ)/γ + log₂ log₂ (1/ε)` has `F(x_l) - F(y) ≤ ε` for all
`y ∈ S°`; here `γ = 1/4 - log (5/4)`. -/
theorem centering_dampedNewtonSeq {E ι : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
    [FiniteDimensional ℝ E] [Fintype ι] {S : Set E} {f₀ : E → ℝ} {g : ι → E → ℝ} {t μ : ℝ}
    {x : E} (hf₀ : ConvexOn ℝ S f₀) (hg : ∀ i, ConvexOn ℝ S (g i)) (ht : 0 < t) (hμ : 0 < μ)
    (hx : x ∈ strictFeasibleSet S g)
    (hmin : IsMinOn (fun z => t * f₀ z + logBarrier g z) (strictFeasibleSet S g) x)
    (hF : SelfConcordantOn (fun z => μ * t * f₀ z + logBarrier g z) (strictFeasibleSet S g))
    (hbar : ∀ y ∈ frontier (strictFeasibleSet S g),
      Tendsto (fun z => μ * t * f₀ z + logBarrier g z) (𝓝[strictFeasibleSet S g] y) atTop)
    (hpd : ∀ y ∈ strictFeasibleSet S g, ∀ v : E, v ≠ 0 →
      0 < fderiv ℝ (fderiv ℝ fun z => μ * t * f₀ z + logBarrier g z) y v v) :
    (∃ k₀ : ℕ, (k₀ : ℝ) ≤
        Fintype.card ι * (μ - 1 - Real.log μ) / (1 / 4 - Real.log (5 / 4)) ∧
        ∀ j : ℕ, 2 * newtonDecrement (fun z => μ * t * f₀ z + logBarrier g z)
          (dampedNewtonSeq (fun z => μ * t * f₀ z + logBarrier g z) x (k₀ + j)) ≤
            (1 / 2) ^ (2 ^ j)) ∧
      ∀ ε : ℝ, 0 < ε → ε ≤ 1 / 2 → ∀ l : ℕ,
        Fintype.card ι * (μ - 1 - Real.log μ) / (1 / 4 - Real.log (5 / 4)) +
            Real.logb 2 (Real.logb 2 (1 / ε)) ≤ l →
          ∀ y ∈ strictFeasibleSet S g,
            μ * t * f₀ (dampedNewtonSeq (fun z => μ * t * f₀ z + logBarrier g z) x l) +
                logBarrier g (dampedNewtonSeq (fun z => μ * t * f₀ z + logBarrier g z) x l) -
              (μ * t * f₀ y + logBarrier g y) ≤ ε := by
  sorry

end TauCetiRoadmap.InteriorPointMethods
