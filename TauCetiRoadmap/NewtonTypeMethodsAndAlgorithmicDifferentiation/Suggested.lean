module

public import Mathlib
public import TauCeti.Analysis.InnerProductSpace.MoorePenrose

/-!
# Newton-type methods and algorithmic differentiation: suggested target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is `README.md`.
This file states the headlines of `README.md` that carry a Lean name, each with every conclusion
the README attaches to it, against the pinned Mathlib and Tau Ceti, with `sorry` proofs and the
definitions they need. These are suggested forms; the README's other headlines are targets of the
same standing, stated in prose.

Conventions (README, Conventions). Iterations are maps and recursively defined sequences, never
algorithms to be run: `bisectSeq`, `secantSeq`, `newtonSeq`, `broydenSeq` and `gaussNewtonSeq`
are iterates of explicit one-step maps, and the damped and inexact Newton methods are predicates
on sequences. Where an inverse or a quotient is undefined, Lean's value `0` is used:
`ContinuousLinearMap.inverse` is `0` at a map that is not invertible, so every statement that
needs an inverse carries an invertibility hypothesis or proves invertibility as a conclusion.
Derivatives are given as maps `f' : E → E →L[ℝ] F` with `HasFDerivAt f (f' x) x` on the set used;
the Newton map is defined with `fderiv`, which agrees with `f'` there. Rates are stated with
`Asymptotics.IsLittleO` along `atTop`, which needs no exception at indices where the error
vanishes. Cost models are natural-number work vectors of an explicit procedure, never running
times.

Local copies. `newtonMap`, `newtonSeq` and `kantorovichRadius` are verbatim copies of the
definitions of NewtonAndQuasiNewtonMethods, §§1.1 and 2.1. The upstream theorems consumed in the
README (that roadmap's 1.2, 2.1, 2.2 and 4.1, and Tau Ceti's Moore–Penrose inverse) are named
there, not restated here.

Five headlines are proved here outright as sanity checks: `broydenUpdate_apply_self`,
`runtime_work_le_of_forall`, `runtime_mul_attains`, `mul_colourSeed_apply` and
`card_nonzero_row_le_chromaticNumber`. Two more, `gaussNewtonSeq_quadratic` and
`tendsto_newtonSeq_predictor`, are derived here from other headlines, which remain targets.
-/

@[expose] public section

noncomputable section

open Filter Metric Set Asymptotics
open scoped Topology

namespace TauCetiRoadmap.NewtonTypeMethodsAndAlgorithmicDifferentiation

/-! ## Layer 1: scalar root finding -/

section Scalar

/-- 1.1 One bisection step on `(a, b)`: with `m` the midpoint, keep `(m, b)` when `f m < 0`
and `(a, m)` otherwise, so that an exact zero at the midpoint becomes the right endpoint. -/
def bisectStep (f : ℝ → ℝ) (ab : ℝ × ℝ) : ℝ × ℝ :=
  if f ((ab.1 + ab.2) / 2) < 0 then ((ab.1 + ab.2) / 2, ab.2) else (ab.1, (ab.1 + ab.2) / 2)

/-- 1.1 The bisection intervals: `bisectSeq f a b k` is the interval `[a_{k+1}, b_{k+1}]` of the
source numbering, which starts at `[a_1, b_1] = [a, b]`. -/
def bisectSeq (f : ℝ → ℝ) (a b : ℝ) (k : ℕ) : ℝ × ℝ :=
  (bisectStep f)^[k] (a, b)

/-- 1.1 The bisection invariant (Gautschi, §4.3.1): the intervals are nested in `[a, b]`, the
sign condition `f a_k < 0 ≤ f b_k` persists, and the width is `(b - a) / 2 ^ k`. No continuity
is needed. -/
theorem bisectSeq_invariant {f : ℝ → ℝ} {a b : ℝ} (hab : a < b) (ha : f a < 0) (hb : 0 < f b)
    (k : ℕ) :
    f (bisectSeq f a b k).1 < 0 ∧ 0 ≤ f (bisectSeq f a b k).2 ∧
      (bisectSeq f a b k).2 - (bisectSeq f a b k).1 = (b - a) / 2 ^ k ∧
      Icc (bisectSeq f a b (k + 1)).1 (bisectSeq f a b (k + 1)).2 ⊆
        Icc (bisectSeq f a b k).1 (bisectSeq f a b k).2 ∧
      Icc (bisectSeq f a b k).1 (bisectSeq f a b k).2 ⊆ Icc a b := by
  sorry

/-- 1.1 Convergence of bisection (Gautschi, §4.3.1, (4.31)): for continuous `f` there is a zero
`α ∈ [a, b]` lying in every interval, the midpoints satisfy `|x_k - α| ≤ (b - a) / 2 ^ (k + 1)`,
and both endpoint sequences converge to `α`. -/
theorem exists_bisection_root {f : ℝ → ℝ} {a b : ℝ} (hab : a < b)
    (hf : ContinuousOn f (Icc a b)) (ha : f a < 0) (hb : 0 < f b) :
    ∃ α ∈ Icc a b, f α = 0 ∧
      (∀ k, α ∈ Icc (bisectSeq f a b k).1 (bisectSeq f a b k).2 ∧
        |((bisectSeq f a b k).1 + (bisectSeq f a b k).2) / 2 - α| ≤ (b - a) / 2 ^ (k + 1)) ∧
      Tendsto (fun k ↦ (bisectSeq f a b k).1) atTop (𝓝 α) ∧
      Tendsto (fun k ↦ (bisectSeq f a b k).2) atTop (𝓝 α) := by
  sorry

/-- 1.2 One secant step on the pair `(x_{n-1}, x_n)`. The quotient is Lean's `0` when
`f x_n = f x_{n-1}`, so after an exact zero the pair becomes constant. -/
def secantStep (f : ℝ → ℝ) (x : ℝ × ℝ) : ℝ × ℝ :=
  (x.2, x.2 - f x.2 * (x.2 - x.1) / (f x.2 - f x.1))

/-- 1.2 The secant iterates `x_n` from the starting pair `(x₀, x₁)`. -/
def secantSeq (f : ℝ → ℝ) (x₀ x₁ : ℝ) (n : ℕ) : ℝ :=
  ((secantStep f)^[n] (x₀, x₁)).1

/-- 1.2 Uniqueness of the zero on `I_ε` (Gautschi, proof of Theorem 4.5.1): for a simple zero `α`
and the curvature bound `ε M < 1`, `α` is the only zero of `f` in `[α - ε, α + ε]`. -/
theorem secant_eq_of_mem_of_eq_zero {f : ℝ → ℝ} {α ε M : ℝ} (hε : 0 < ε)
    (hf : ContDiffOn ℝ 2 f (Icc (α - ε) (α + ε))) (hα : f α = 0)
    (hα' : derivWithin f (Icc (α - ε) (α + ε)) α ≠ 0)
    (hM : ∀ s ∈ Icc (α - ε) (α + ε), ∀ t ∈ Icc (α - ε) (α + ε),
      |iteratedDerivWithin 2 f (Icc (α - ε) (α + ε)) s /
        (2 * derivWithin f (Icc (α - ε) (α + ε)) t)| ≤ M)
    (hεM : ε * M < 1) {x : ℝ} (hx : x ∈ Icc (α - ε) (α + ε)) (hfx : f x = 0) : x = α := by
  sorry

/-- 1.2 Local convergence of the secant method (Gautschi, Theorem 4.5.1): for a simple zero `α`
and `ε M < 1`, from distinct starting
points in `I_ε` all iterates stay in `I_ε`, consecutive iterates from `x₁` on coincide exactly
when the iteration has reached `α`, and the iterates converge to `α`. -/
theorem secantSeq_mem_and_tendsto {f : ℝ → ℝ} {α ε M x₀ x₁ : ℝ} (hε : 0 < ε)
    (hf : ContDiffOn ℝ 2 f (Icc (α - ε) (α + ε))) (hα : f α = 0)
    (hα' : derivWithin f (Icc (α - ε) (α + ε)) α ≠ 0)
    (hM : ∀ s ∈ Icc (α - ε) (α + ε), ∀ t ∈ Icc (α - ε) (α + ε),
      |iteratedDerivWithin 2 f (Icc (α - ε) (α + ε)) s /
        (2 * derivWithin f (Icc (α - ε) (α + ε)) t)| ≤ M)
    (hεM : ε * M < 1) (hx₀ : x₀ ∈ Icc (α - ε) (α + ε)) (hx₁ : x₁ ∈ Icc (α - ε) (α + ε))
    (h01 : x₀ ≠ x₁) :
    (∀ n, secantSeq f x₀ x₁ n ∈ Icc (α - ε) (α + ε)) ∧
      (∀ n, 1 ≤ n → (secantSeq f x₀ x₁ (n + 1) = secantSeq f x₀ x₁ n ↔
        secantSeq f x₀ x₁ n = α)) ∧
      Tendsto (secantSeq f x₀ x₁) atTop (𝓝 α) := by
  sorry

/-- 1.2 The error recursion of the secant method (Gautschi, (4.52); Stoer–Bulirsch, (5.9.11)):
`|x_{n+1} - α| ≤ M |x_n - α| |x_{n-1} - α|` for `n ≥ 1`. -/
theorem abs_secantSeq_sub_le {f : ℝ → ℝ} {α ε M x₀ x₁ : ℝ} (hε : 0 < ε)
    (hf : ContDiffOn ℝ 2 f (Icc (α - ε) (α + ε))) (hα : f α = 0)
    (hα' : derivWithin f (Icc (α - ε) (α + ε)) α ≠ 0)
    (hM : ∀ s ∈ Icc (α - ε) (α + ε), ∀ t ∈ Icc (α - ε) (α + ε),
      |iteratedDerivWithin 2 f (Icc (α - ε) (α + ε)) s /
        (2 * derivWithin f (Icc (α - ε) (α + ε)) t)| ≤ M)
    (hεM : ε * M < 1) (hx₀ : x₀ ∈ Icc (α - ε) (α + ε)) (hx₁ : x₁ ∈ Icc (α - ε) (α + ε))
    (h01 : x₀ ≠ x₁) (n : ℕ) (hn : 1 ≤ n) :
    |secantSeq f x₀ x₁ (n + 1) - α| ≤
      M * |secantSeq f x₀ x₁ n - α| * |secantSeq f x₀ x₁ (n - 1) - α| := by
  sorry

/-- 1.2 The golden-ratio bound (Gautschi, Theorem 4.5.2 and (4.54)): with
`p = (1 + √5) / 2` and `E = max (M |x₀ - α|) ((M |x₁ - α|) ^ (1 / p))`, every iterate satisfies
`M |x_n - α| ≤ E ^ (p ^ n)`, and `E < 1`. -/
theorem secantSeq_error_le_rpow {f : ℝ → ℝ} {α ε M x₀ x₁ : ℝ} (hε : 0 < ε)
    (hf : ContDiffOn ℝ 2 f (Icc (α - ε) (α + ε))) (hα : f α = 0)
    (hα' : derivWithin f (Icc (α - ε) (α + ε)) α ≠ 0)
    (hM : ∀ s ∈ Icc (α - ε) (α + ε), ∀ t ∈ Icc (α - ε) (α + ε),
      |iteratedDerivWithin 2 f (Icc (α - ε) (α + ε)) s /
        (2 * derivWithin f (Icc (α - ε) (α + ε)) t)| ≤ M)
    (hεM : ε * M < 1) (hx₀ : x₀ ∈ Icc (α - ε) (α + ε)) (hx₁ : x₁ ∈ Icc (α - ε) (α + ε))
    (h01 : x₀ ≠ x₁) :
    max (M * |x₀ - α|) ((M * |x₁ - α|) ^ (1 / ((1 + √5) / 2))) < 1 ∧
    ∀ n : ℕ, M * |secantSeq f x₀ x₁ n - α| ≤
      max (M * |x₀ - α|) ((M * |x₁ - α|) ^ (1 / ((1 + √5) / 2))) ^ (((1 + √5) / 2) ^ n) := by
  sorry

end Scalar

/-! ## Layer 2: local theory of Newton's method -/

section Newton

variable {E F : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [NormedAddCommGroup F]
  [NormedSpace ℝ F]

/-- Local copy of NewtonAndQuasiNewtonMethods §1.1: the Newton map
`x ↦ x - (fderiv ℝ f x).inverse (f x)`, the identity where the derivative is not invertible. -/
def newtonMap (f : E → F) (x : E) : E :=
  x - (fderiv ℝ f x).inverse (f x)

/-- Local copy of NewtonAndQuasiNewtonMethods §1.1: the `k`-th iterate of the Newton map. -/
def newtonSeq (f : E → F) (x₀ : E) (k : ℕ) : E :=
  (newtonMap f)^[k] x₀

/-- Local copy of NewtonAndQuasiNewtonMethods §2.1: the Kantorovich radius
`t⋆ = (1 - √(1 - 2 b L)) / L`. -/
def kantorovichRadius (L b : ℝ) : ℝ :=
  (1 - √(1 - 2 * b * L)) / L

/-- 2.1 Superlinearity of the Newton map at a nondegenerate zero without a Lipschitz condition
(Nocedal–Wright, Theorem 11.2, (11.8)): `N(x) - x⋆ = o(x - x⋆)` as `x → x⋆`. -/
theorem newtonMap_sub_isLittleO [CompleteSpace E] [CompleteSpace F] {f : E → F}
    {f' : E → E →L[ℝ] F} {xStar : E} {κ : ℝ} (A : E ≃L[ℝ] F) (hκ : 0 < κ)
    (hf : ∀ x ∈ ball xStar κ, HasFDerivAt f (f' x) x) (hf' : ContinuousAt f' xStar)
    (hzero : f xStar = 0) (hA : f' xStar = (A : E →L[ℝ] F)) :
    (fun x ↦ newtonMap f x - xStar) =o[𝓝 xStar] (fun x ↦ x - xStar) := by
  sorry

/-- 2.1 Local superlinear convergence of Newton's method (Nocedal–Wright, Theorem 11.2): there is
a ball about `x⋆` that the Newton sequence never leaves, in which it converges to `x⋆`
superlinearly. -/
theorem newtonSeq_superlinear [CompleteSpace E] [CompleteSpace F] {f : E → F}
    {f' : E → E →L[ℝ] F} {xStar : E} {κ : ℝ} (A : E ≃L[ℝ] F) (hκ : 0 < κ)
    (hf : ∀ x ∈ ball xStar κ, HasFDerivAt f (f' x) x) (hf' : ContinuousAt f' xStar)
    (hzero : f xStar = 0) (hA : f' xStar = (A : E →L[ℝ] F)) :
    ∃ δ > 0, ∀ x₀ ∈ ball xStar δ, (∀ k, newtonSeq f x₀ k ∈ ball xStar δ) ∧
      Tendsto (newtonSeq f x₀) atTop (𝓝 xStar) ∧
      (fun k ↦ newtonSeq f x₀ (k + 1) - xStar) =o[atTop] (fun k ↦ newtonSeq f x₀ k - xStar) := by
  sorry

/-- 2.2 Affine-covariant local convergence (Deuflhard–Hohmann, Theorem 4.10; Deuflhard,
Theorem 2.3). On a convex `D` with invertible derivatives and the affine-covariant
Lipschitz condition with constant `ω`, from `x₀ ∈ D` with `ρ = ‖x₀ - x⋆‖ < 2 / ω` and
`B(x⋆, ρ) ⊆ D`, the Newton iterates stay in `D`, satisfy
`‖x_{k+1} - x⋆‖ ≤ (ω / 2) ‖x_k - x⋆‖²`, lie in `B(x⋆, ρ)` from `k = 1` on when `x₀ ≠ x⋆`, and
converge to `x⋆`. -/
theorem newtonSeq_affineCovariant {f : E → F} {f' : E → E →L[ℝ] F} {D : Set E} {ω : ℝ}
    {xStar x₀ : E} (hDc : Convex ℝ D)
    (hf : ∀ x ∈ D, HasFDerivAt f (f' x) x) (hinv : ∀ x ∈ D, (f' x).IsInvertible)
    (hcov : ∀ x ∈ D, ∀ y ∈ D, ‖(f' x).inverse ((f' y - f' x) (y - x))‖ ≤ ω * ‖y - x‖ ^ 2)
    (hxStar : xStar ∈ D) (hzero : f xStar = 0) (hx₀ : x₀ ∈ D) (hρ : ‖x₀ - xStar‖ < 2 / ω)
    (hball : ball xStar ‖x₀ - xStar‖ ⊆ D) :
    (∀ k, newtonSeq f x₀ k ∈ D ∧
      ‖newtonSeq f x₀ (k + 1) - xStar‖ ≤ ω / 2 * ‖newtonSeq f x₀ k - xStar‖ ^ 2) ∧
    (x₀ ≠ xStar → ∀ k, newtonSeq f x₀ (k + 1) ∈ ball xStar ‖x₀ - xStar‖) ∧
    Tendsto (newtonSeq f x₀) atTop (𝓝 xStar) := by
  sorry

/-- 2.2 Uniqueness of the zero (Deuflhard–Hohmann, Theorem 4.10; Deuflhard, Theorem 2.3): under
the affine-covariant condition on a convex `D`, `x⋆` is the only zero of `f` in
`D ∩ B(x⋆, 2 / ω)`. -/
theorem eq_of_affineCovariant_of_eq_zero {f : E → F} {f' : E → E →L[ℝ] F} {D : Set E} {ω : ℝ}
    {xStar : E} (hDc : Convex ℝ D) (hf : ∀ x ∈ D, HasFDerivAt f (f' x) x)
    (hinv : ∀ x ∈ D, (f' x).IsInvertible)
    (hcov : ∀ x ∈ D, ∀ y ∈ D, ‖(f' x).inverse ((f' y - f' x) (y - x))‖ ≤ ω * ‖y - x‖ ^ 2)
    (hxStar : xStar ∈ D) (hzero : f xStar = 0) {z : E} (hz : z ∈ D)
    (hzb : z ∈ ball xStar (2 / ω)) (hfz : f z = 0) : z = xStar := by
  sorry

/-- 2.3 The a priori bound of the Newton–Kantorovich theorem (Ciarlet, Theorem 7.7-3), in the
affine-covariant form of NewtonAndQuasiNewtonMethods §2.1 and under its hypotheses. The
derivative is invertible at every interior point of `C` within `1 / L` of `x₀`, and the Newton
sequence converges to a zero `x⋆` with `‖x⋆ - x_k‖ ≤ (L t⋆) ^ (2 ^ k) / (L 2 ^ k)`, where
`t⋆ = kantorovichRadius L b`. -/
theorem newtonKantorovich_apriori [CompleteSpace E] [CompleteSpace F] {f : E → F}
    {f' : E → E →L[ℝ] F} {C : Set E} {x₀ : E} {L b : ℝ} (A : E ≃L[ℝ] F)
    (hfc : ContinuousOn f C) (hf : ∀ x ∈ interior C, HasFDerivAt f (f' x) x)
    (hx₀ : x₀ ∈ interior C) (hA : f' x₀ = (A : E →L[ℝ] F))
    (hLip : ∀ x ∈ C, ∀ y ∈ C, ‖(A.symm : F →L[ℝ] E).comp (f' y - f' x)‖ ≤ L * ‖x - y‖)
    (hb : ‖A.symm (f x₀)‖ ≤ b) (hL : 0 < L) (hb0 : 0 < b) (hbL : 2 * b * L ≤ 1)
    (hC : closedBall x₀ (kantorovichRadius L b) ⊆ C) :
    (∀ x ∈ interior C, ‖x - x₀‖ < 1 / L → (f' x).IsInvertible) ∧
    ∃ xStar, f xStar = 0 ∧ Tendsto (newtonSeq f x₀) atTop (𝓝 xStar) ∧
      ∀ k : ℕ, ‖xStar - newtonSeq f x₀ k‖ ≤
        (L * kantorovichRadius L b) ^ (2 ^ k) / (L * 2 ^ k) := by
  sorry

end Newton

/-! ## Layer 3: globalized and inexact Newton methods -/

section Damped

variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E] [FiniteDimensional ℝ E]

/-- 3.1 The Newton direction `d = Df(x)⁻¹ f(x)`; it is `0` where `Df(x)` is not invertible. -/
def newtonDir (f : E → E) (x : E) : E :=
  (fderiv ℝ f x).inverse (f x)

/-- 3.1 The merit function `h(x) = ‖f x‖²`. -/
def sqResidual (f : E → E) (x : E) : ℝ :=
  ‖f x‖ ^ 2

/-- 3.1 The reciprocal condition number `1 / (‖A‖ ‖A⁻¹‖)` in the operator norm; it is `0` where
`A` is not invertible. -/
def invCond (A : E →L[ℝ] E) : ℝ :=
  (‖A‖ * ‖A.inverse‖)⁻¹

/-- 3.1 The acceptance test of the damped Newton method (Stoer–Bulirsch, (5.4.2.4)) for the step
length `2⁻ʲ`: `h(x - 2⁻ʲ d) ≤ h(x) - 2⁻ʲ (γ / 4) ‖d‖ ‖Dh(x)‖` with `γ = invCond (Df(x))`. -/
def IsDampedAcceptable (f : E → E) (x : E) (j : ℕ) : Prop :=
  sqResidual f (x - (1 / 2 : ℝ) ^ j • newtonDir f x) ≤
    sqResidual f x - (1 / 2 : ℝ) ^ j * (invCond (fderiv ℝ f x) / 4) * ‖newtonDir f x‖ *
      ‖fderiv ℝ (sqResidual f) x‖

/-- 3.1 A damped Newton sequence (Stoer–Bulirsch, (5.4.2.4)): at every step `j` is the least
acceptable exponent, and `x_{k+1} = x_k - 2⁻ⁱ d_k` for an `i ≤ j` minimizing `h(x_k - 2⁻ˡ d_k)`
over `l ≤ j`. -/
def IsDampedNewtonSeq (f : E → E) (x : ℕ → E) : Prop :=
  ∀ k, ∃ j, IsLeast {j | IsDampedAcceptable f (x k) j} j ∧ ∃ i ≤ j,
    x (k + 1) = x k - (1 / 2 : ℝ) ^ i • newtonDir f (x k) ∧
    ∀ l ≤ j, sqResidual f (x (k + 1)) ≤ sqResidual f (x k - (1 / 2 : ℝ) ^ l • newtonDir f (x k))

/-- 3.1 The Newton direction is a descent direction of `h` (Stoer–Bulirsch, (5.4.2.2)):
`Dh(x)(-d) = -2 h(x)`. -/
theorem fderiv_sqResidual_neg_newtonDir {f : E → E} {x : E} (hf : DifferentiableAt ℝ f x)
    (hinv : (fderiv ℝ f x).IsInvertible) :
    fderiv ℝ (sqResidual f) x (-newtonDir f x) = -2 * sqResidual f x := by
  sorry

/-- 3.1 Stationary points of `h` are zeros of `f` where `Df` is invertible (Stoer–Bulirsch,
(5.4.2.3)). -/
theorem fderiv_sqResidual_eq_zero_iff {f : E → E} {x : E} (hf : DifferentiableAt ℝ f x)
    (hinv : (fderiv ℝ f x).IsInvertible) :
    fderiv ℝ (sqResidual f) x = 0 ↔ f x = 0 := by
  sorry

/-- 3.1 Global convergence of the damped Newton method (Stoer–Bulirsch, Theorem (5.4.2.5)). If the
level set `K = {x | h x ≤ h x₀}` is compact, `f` is `C¹` on an open set containing `K` and `Df` is
invertible on `K`, then a damped Newton sequence from `x₀` exists, and every such sequence stays
in `K`, has a cluster point, and all its cluster points are zeros of `f`. -/
theorem dampedNewton_global {f : E → E} {x₀ : E} {U : Set E}
    (hK : IsCompact {x | sqResidual f x ≤ sqResidual f x₀}) (hU : IsOpen U)
    (hKU : {x | sqResidual f x ≤ sqResidual f x₀} ⊆ U) (hf : ContDiffOn ℝ 1 f U)
    (hinv : ∀ x, sqResidual f x ≤ sqResidual f x₀ → (fderiv ℝ f x).IsInvertible) :
    (∃ x : ℕ → E, x 0 = x₀ ∧ IsDampedNewtonSeq f x) ∧
    ∀ x : ℕ → E, x 0 = x₀ → IsDampedNewtonSeq f x →
      (∀ k, sqResidual f (x k) ≤ sqResidual f x₀) ∧
      (∃ z, sqResidual f z ≤ sqResidual f x₀ ∧ MapClusterPt z atTop x) ∧
      ∀ z, MapClusterPt z atTop x → f z = 0 := by
  sorry

end Damped

section Inexact

variable {E F : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [CompleteSpace E]
  [NormedAddCommGroup F] [NormedSpace ℝ F] [CompleteSpace F]

/-- 3.2 An inexact Newton sequence with forcing terms `η` (Nocedal–Wright, (11.17); Kelley, (6.1)):
the step `s_k = x_{k+1} - x_k` satisfies `‖f(x_k) + f'(x_k) s_k‖ ≤ η_k ‖f(x_k)‖`. -/
def IsInexactNewtonSeq (f : E → F) (f' : E → E →L[ℝ] F) (η : ℕ → ℝ) (x : ℕ → E) : Prop :=
  ∀ k, ‖f (x k) + f' (x k) (x (k + 1) - x k)‖ ≤ η k * ‖f (x k)‖

/-- 3.2 The one-step estimate of inexact Newton (Kelley, Theorem 6.1.1): under the standard
assumptions there are `δ` and `K` with `‖x + s - x⋆‖ ≤ K (‖x - x⋆‖ + η) ‖x - x⋆‖` whenever
`x ∈ B(x⋆, δ)` and `‖f x + f' x s‖ ≤ η ‖f x‖`. -/
theorem inexactNewton_one_step {f : E → F} {f' : E → E →L[ℝ] F} {xStar : E} {κ γ : ℝ}
    (A : E ≃L[ℝ] F) (hκ : 0 < κ) (hf : ∀ x ∈ ball xStar κ, HasFDerivAt f (f' x) x)
    (hLip : ∀ x ∈ ball xStar κ, ∀ y ∈ ball xStar κ, ‖f' x - f' y‖ ≤ γ * ‖x - y‖)
    (hzero : f xStar = 0) (hA : f' xStar = (A : E →L[ℝ] F)) :
    ∃ δ > 0, ∃ K, ∀ x ∈ ball xStar δ, ∀ (s : E) (η : ℝ), ‖f x + f' x s‖ ≤ η * ‖f x‖ →
      ‖x + s - xStar‖ ≤ K * (‖x - xStar‖ + η) * ‖x - xStar‖ := by
  sorry

/-- 3.2 Local linear convergence of inexact Newton (Nocedal–Wright, Theorem 11.3(i); Kelley,
Theorem 6.1.2) with a derivative continuous at `x⋆`: for forcing terms bounded by a small `η̄`
the iterates stay in a ball and converge q-linearly. -/
theorem inexactNewton_linear {f : E → F} {f' : E → E →L[ℝ] F} {xStar : E} {κ : ℝ}
    (A : E ≃L[ℝ] F) (hκ : 0 < κ) (hf : ∀ x ∈ ball xStar κ, HasFDerivAt f (f' x) x)
    (hf' : ContinuousAt f' xStar) (hzero : f xStar = 0) (hA : f' xStar = (A : E →L[ℝ] F)) :
    ∃ ηBar > 0, ∃ δ > 0, ∃ q < 1, ∀ (η : ℕ → ℝ) (x : ℕ → E), x 0 ∈ ball xStar δ →
      (∀ k, η k ≤ ηBar) → IsInexactNewtonSeq f f' η x →
      (∀ k, x k ∈ ball xStar δ ∧ ‖x (k + 1) - xStar‖ ≤ q * ‖x k - xStar‖) ∧
      Tendsto x atTop (𝓝 xStar) := by
  sorry

/-- 3.2 Local superlinear convergence of inexact Newton (Nocedal–Wright, Theorem 11.3(ii); Kelley,
Theorem 6.1.2): bounded forcing terms tending to `0` give `e_{k+1} = o(e_k)`. -/
theorem inexactNewton_superlinear {f : E → F} {f' : E → E →L[ℝ] F} {xStar : E} {κ : ℝ}
    (A : E ≃L[ℝ] F) (hκ : 0 < κ) (hf : ∀ x ∈ ball xStar κ, HasFDerivAt f (f' x) x)
    (hf' : ContinuousAt f' xStar) (hzero : f xStar = 0) (hA : f' xStar = (A : E →L[ℝ] F)) :
    ∃ ηBar > 0, ∃ δ > 0, ∀ (η : ℕ → ℝ) (x : ℕ → E), x 0 ∈ ball xStar δ →
      (∀ k, η k ≤ ηBar) → Tendsto η atTop (𝓝 0) → IsInexactNewtonSeq f f' η x →
      Tendsto x atTop (𝓝 xStar) ∧
      (fun k ↦ x (k + 1) - xStar) =o[atTop] (fun k ↦ x k - xStar) := by
  sorry

/-- 3.2 Local quadratic convergence of inexact Newton (Nocedal–Wright, Theorem 11.3(iii); Kelley,
Theorem 6.1.2): with a Lipschitz derivative and `η_k ≤ c ‖f(x_k)‖`, the errors satisfy
`‖e_{k+1}‖ ≤ K ‖e_k‖²`. -/
theorem inexactNewton_quadratic {f : E → F} {f' : E → E →L[ℝ] F} {xStar : E} {κ γ c : ℝ}
    (A : E ≃L[ℝ] F) (hκ : 0 < κ) (hf : ∀ x ∈ ball xStar κ, HasFDerivAt f (f' x) x)
    (hLip : ∀ x ∈ ball xStar κ, ∀ y ∈ ball xStar κ, ‖f' x - f' y‖ ≤ γ * ‖x - y‖)
    (hzero : f xStar = 0) (hA : f' xStar = (A : E →L[ℝ] F)) :
    ∃ δ > 0, ∃ K, ∀ (η : ℕ → ℝ) (x : ℕ → E), x 0 ∈ ball xStar δ →
      (∀ k, η k ≤ c * ‖f (x k)‖) → IsInexactNewtonSeq f f' η x →
      (∀ k, ‖x (k + 1) - xStar‖ ≤ K * ‖x k - xStar‖ ^ 2) ∧ Tendsto x atTop (𝓝 xStar) := by
  sorry

/-- 3.2 Any forcing bound below `1` suffices in the weighted norm `‖f'(x⋆) ·‖` (after Kelley,
Theorem 6.1.4, with a derivative continuous at `x⋆`): for `η̄ < t < 1` the weighted errors
contract by `t`. -/
theorem inexactNewton_weighted {f : E → F} {f' : E → E →L[ℝ] F} {xStar : E} {κ : ℝ}
    (A : E ≃L[ℝ] F) (hκ : 0 < κ) (hf : ∀ x ∈ ball xStar κ, HasFDerivAt f (f' x) x)
    (hf' : ContinuousAt f' xStar) (hzero : f xStar = 0) (hA : f' xStar = (A : E →L[ℝ] F))
    {ηBar t : ℝ} (ht : ηBar < t) (ht1 : t < 1) :
    ∃ δ > 0, ∀ (η : ℕ → ℝ) (x : ℕ → E), x 0 ∈ ball xStar δ →
      (∀ k, η k ≤ ηBar) → IsInexactNewtonSeq f f' η x →
      (∀ k, ‖A (x (k + 1) - xStar)‖ ≤ t * ‖A (x k - xStar)‖) ∧
      Tendsto x atTop (𝓝 xStar) := by
  sorry

end Inexact

/-! ## Layer 4: Broyden's method -/

section Broyden

variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E] [FiniteDimensional ℝ E]

/-- 4.1 Broyden's update `B₊ = B + (y - B s) sᵀ / ‖s‖²`; it is `B` when `s = 0`. -/
def broydenUpdate (B : E →L[ℝ] E) (s y : E) : E →L[ℝ] E :=
  B + (‖s‖ ^ 2)⁻¹ • (innerSL ℝ s).smulRight (y - B s)

/-- 4.1 One step of Broyden's method on the pair `(x, B)`: `s = -B⁻¹ f(x)`, `x₊ = x + s`,
`B₊ = broydenUpdate B s (f x₊ - f x)`. -/
def broydenStep (f : E → E) (p : E × (E →L[ℝ] E)) : E × (E →L[ℝ] E) :=
  (p.1 - p.2.inverse (f p.1),
    broydenUpdate p.2 (-p.2.inverse (f p.1)) (f (p.1 - p.2.inverse (f p.1)) - f p.1))

/-- 4.1 The Broyden iterates `(x_k, B_k)` from `(x₀, B₀)`. -/
def broydenSeq (f : E → E) (x₀ : E) (B₀ : E →L[ℝ] E) (k : ℕ) : E × (E →L[ℝ] E) :=
  (broydenStep f)^[k] (x₀, B₀)

omit [FiniteDimensional ℝ E] in
/-- 4.1 The secant equation `B₊ s = y` (Nocedal–Wright, (11.27)). -/
theorem broydenUpdate_apply_self (B : E →L[ℝ] E) {s : E} (y : E) (hs : s ≠ 0) :
    broydenUpdate B s y s = y := by
  have h : ‖s‖ ^ 2 ≠ 0 := by positivity
  simp [broydenUpdate, smul_smul, inv_mul_cancel₀ h]

omit [FiniteDimensional ℝ E] in
/-- 4.1 The least-change property (Nocedal–Wright, Lemma 11.4): among all `X` with `X s = y`,
Broyden's update is closest to `B` in the operator norm. -/
theorem norm_broydenUpdate_sub_le (B X : E →L[ℝ] E) (s y : E) (hX : X s = y) :
    ‖broydenUpdate B s y - B‖ ≤ ‖X - B‖ := by
  sorry

omit [FiniteDimensional ℝ E] in
/-- 4.1 Invertibility of the update (after Kelley, Proposition 7.3.1, the Sherman–Morrison
criterion): for invertible `B` and `s ≠ 0`, `B₊` is invertible iff `⟪s, B⁻¹ y⟫ ≠ 0`. -/
theorem isInvertible_broydenUpdate_iff {B : E →L[ℝ] E} (hB : B.IsInvertible) {s : E} (y : E)
    (hs : s ≠ 0) :
    (broydenUpdate B s y).IsInvertible ↔ inner ℝ s (B.inverse y) ≠ 0 := by
  sorry

omit [FiniteDimensional ℝ E] in
/-- 4.2 Bounded deterioration (Kelley, Theorem 7.2.2): with a derivative Lipschitz with constant
`γ` on a ball about `x⋆`, for `x, x + s` in the ball and `y = f(x + s) - f x`,
`‖B₊ - f'(x⋆)‖ ≤ ‖B - f'(x⋆)‖ + (γ / 2)(‖x - x⋆‖ + ‖x + s - x⋆‖)`. -/
theorem norm_broydenUpdate_sub_fderiv_le {f : E → E} {f' : E → E →L[ℝ] E} {xStar : E}
    {κ γ : ℝ} (hf : ∀ x ∈ ball xStar κ, HasFDerivAt f (f' x) x)
    (hLip : ∀ x ∈ ball xStar κ, ∀ y ∈ ball xStar κ, ‖f' x - f' y‖ ≤ γ * ‖x - y‖)
    (B : E →L[ℝ] E) {x s : E} (hx : x ∈ ball xStar κ) (hxs : x + s ∈ ball xStar κ) :
    ‖broydenUpdate B s (f (x + s) - f x) - f' xStar‖ ≤
      ‖B - f' xStar‖ + γ / 2 * (‖x - xStar‖ + ‖x + s - xStar‖) := by
  sorry

/-- 4.2 Local q-linear convergence of Broyden's method (Kelley, Theorem 7.2.3): for every
`r ∈ (0, 1)`, from `x₀` near `x⋆` and `B₀` near `f'(x⋆)` all `B_k` are invertible and the errors
contract by `r`. -/
theorem broydenSeq_linear {f : E → E} {f' : E → E →L[ℝ] E} {xStar : E} {κ γ : ℝ}
    (A : E ≃L[ℝ] E) (hκ : 0 < κ) (hf : ∀ x ∈ ball xStar κ, HasFDerivAt f (f' x) x)
    (hLip : ∀ x ∈ ball xStar κ, ∀ y ∈ ball xStar κ, ‖f' x - f' y‖ ≤ γ * ‖x - y‖)
    (hzero : f xStar = 0) (hA : f' xStar = (A : E →L[ℝ] E)) {r : ℝ} (hr : 0 < r)
    (hr1 : r < 1) :
    ∃ δ > 0, ∃ δB > 0, ∀ (x₀ : E) (B₀ : E →L[ℝ] E), x₀ ∈ ball xStar δ →
      ‖B₀ - (A : E →L[ℝ] E)‖ < δB →
      (∀ k, (broydenSeq f x₀ B₀ k).2.IsInvertible ∧
        ‖(broydenSeq f x₀ B₀ (k + 1)).1 - xStar‖ ≤ r * ‖(broydenSeq f x₀ B₀ k).1 - xStar‖) ∧
      Tendsto (fun k ↦ (broydenSeq f x₀ B₀ k).1) atTop (𝓝 xStar) := by
  sorry

/-- 4.2 Local superlinear convergence of Broyden's method (Kelley, Theorem 7.2.4;
Nocedal–Wright, Theorem 11.5). -/
theorem broydenSeq_superlinear {f : E → E} {f' : E → E →L[ℝ] E} {xStar : E} {κ γ : ℝ}
    (A : E ≃L[ℝ] E) (hκ : 0 < κ) (hf : ∀ x ∈ ball xStar κ, HasFDerivAt f (f' x) x)
    (hLip : ∀ x ∈ ball xStar κ, ∀ y ∈ ball xStar κ, ‖f' x - f' y‖ ≤ γ * ‖x - y‖)
    (hzero : f xStar = 0) (hA : f' xStar = (A : E →L[ℝ] E)) :
    ∃ δ > 0, ∃ δB > 0, ∀ (x₀ : E) (B₀ : E →L[ℝ] E), x₀ ∈ ball xStar δ →
      ‖B₀ - (A : E →L[ℝ] E)‖ < δB →
      Tendsto (fun k ↦ (broydenSeq f x₀ B₀ k).1) atTop (𝓝 xStar) ∧
      (fun k ↦ (broydenSeq f x₀ B₀ (k + 1)).1 - xStar) =o[atTop]
        (fun k ↦ (broydenSeq f x₀ B₀ k).1 - xStar) := by
  sorry

end Broyden

/-! ## Layer 5: the Gauss–Newton method -/

section GaussNewton

variable {E F : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E] [FiniteDimensional ℝ E]
  [NormedAddCommGroup F] [InnerProductSpace ℝ F] [FiniteDimensional ℝ F]

/-- 5.1 The Gauss–Newton map `x ↦ x - f'(x)⁺ f(x)` with Tau Ceti's Moore–Penrose inverse. -/
def gaussNewtonMap (f : E → F) (x : E) : E :=
  x - ((fderiv ℝ f x : E →L[ℝ] F) : E →ₗ[ℝ] F).moorePenroseInverse (f x)

/-- 5.1 The Gauss–Newton iterates. -/
def gaussNewtonSeq (f : E → F) (x₀ : E) (k : ℕ) : E :=
  (gaussNewtonMap f)^[k] x₀

/-- 5.1 Fixed points of the Gauss–Newton map are the solutions of the normal equations
`f'(x)* f(x) = 0` (Deuflhard–Hohmann, p. 94). -/
theorem gaussNewtonMap_eq_self_iff {f : E → F} {f'x : E →L[ℝ] F} {x : E}
    (hf : HasFDerivAt f f'x x) :
    gaussNewtonMap f x = x ↔ ContinuousLinearMap.adjoint f'x (f x) = 0 := by
  sorry

/-- 5.1 The one-step estimate of Gauss–Newton (Deuflhard–Hohmann, (4.15) in the proof of
Theorem 4.14): `‖x₊ - x⋆‖ ≤ (ω / 2) ‖x - x⋆‖² + κ⋆ ‖x - x⋆‖`. -/
theorem norm_gaussNewtonMap_sub_le {f : E → F} {f' : E → E →L[ℝ] F} {D : Set E} {ω κ : ℝ}
    {xStar : E} (hDc : Convex ℝ D) (hf : ∀ x ∈ D, HasFDerivAt f (f' x) x)
    (hinj : ∀ x ∈ D, Function.Injective (f' x))
    (hcov : ∀ x ∈ D, ∀ y ∈ D,
      ‖((f' x : E →L[ℝ] F) : E →ₗ[ℝ] F).moorePenroseInverse ((f' y - f' x) (y - x))‖ ≤
        ω * ‖y - x‖ ^ 2)
    (hκ : ∀ x ∈ D, ‖((f' x : E →L[ℝ] F) : E →ₗ[ℝ] F).moorePenroseInverse (f xStar)‖ ≤
      κ * ‖x - xStar‖)
    (hxStar : xStar ∈ D) {x : E} (hx : x ∈ D) :
    ‖gaussNewtonMap f x - xStar‖ ≤ ω / 2 * ‖x - xStar‖ ^ 2 + κ * ‖x - xStar‖ := by
  sorry

/-- 5.1 Local convergence of Gauss–Newton (Deuflhard–Hohmann, Theorem 4.14): for
`ρ = ‖x₀ - x⋆‖ < 2 (1 - κ⋆) / ω` with `B(x⋆, ρ) ⊆ D`, the iterates stay in `D`, lie in
`B(x⋆, ρ)` from `k = 1` on when `x₀ ≠ x⋆`, and converge to `x⋆`. -/
theorem gaussNewtonSeq_tendsto {f : E → F} {f' : E → E →L[ℝ] F} {D : Set E} {ω κ : ℝ}
    {xStar x₀ : E} (hDc : Convex ℝ D) (hf : ∀ x ∈ D, HasFDerivAt f (f' x) x)
    (hinj : ∀ x ∈ D, Function.Injective (f' x))
    (hcov : ∀ x ∈ D, ∀ y ∈ D,
      ‖((f' x : E →L[ℝ] F) : E →ₗ[ℝ] F).moorePenroseInverse ((f' y - f' x) (y - x))‖ ≤
        ω * ‖y - x‖ ^ 2)
    (hκ : ∀ x ∈ D, ‖((f' x : E →L[ℝ] F) : E →ₗ[ℝ] F).moorePenroseInverse (f xStar)‖ ≤
      κ * ‖x - xStar‖)
    (hxStar : xStar ∈ D) (hx₀ : x₀ ∈ D) (hρ : ‖x₀ - xStar‖ < 2 * (1 - κ) / ω)
    (hball : ball xStar ‖x₀ - xStar‖ ⊆ D) :
    (∀ k, gaussNewtonSeq f x₀ k ∈ D) ∧
    (x₀ ≠ xStar → ∀ k, gaussNewtonSeq f x₀ (k + 1) ∈ ball xStar ‖x₀ - xStar‖) ∧
    Tendsto (gaussNewtonSeq f x₀) atTop (𝓝 xStar) := by
  sorry

/-- 5.1 Uniqueness (Deuflhard–Hohmann, Theorem 4.14): `x⋆` is the only fixed point of the
Gauss–Newton map in `D ∩ B(x⋆, 2 (1 - κ⋆) / ω)`. -/
theorem eq_of_gaussNewtonMap_eq_self {f : E → F} {f' : E → E →L[ℝ] F} {D : Set E} {ω κ : ℝ}
    {xStar : E} (hDc : Convex ℝ D) (hf : ∀ x ∈ D, HasFDerivAt f (f' x) x)
    (hinj : ∀ x ∈ D, Function.Injective (f' x))
    (hcov : ∀ x ∈ D, ∀ y ∈ D,
      ‖((f' x : E →L[ℝ] F) : E →ₗ[ℝ] F).moorePenroseInverse ((f' y - f' x) (y - x))‖ ≤
        ω * ‖y - x‖ ^ 2)
    (hκ : ∀ x ∈ D, ‖((f' x : E →L[ℝ] F) : E →ₗ[ℝ] F).moorePenroseInverse (f xStar)‖ ≤
      κ * ‖x - xStar‖)
    (hxStar : xStar ∈ D) {z : E} (hz : z ∈ D) (hzb : ‖z - xStar‖ < 2 * (1 - κ) / ω)
    (hfix : gaussNewtonMap f z = z) : z = xStar := by
  sorry

/-- 5.1 Quadratic convergence for compatible problems (Deuflhard–Hohmann, Theorem 4.14 with
`κ⋆ = 0`): if `f x⋆ = 0` and `‖x₀ - x⋆‖ < 2 / ω`, then `‖x_{k+1} - x⋆‖ ≤ (ω / 2) ‖x_k - x⋆‖²`.
Derived here from `gaussNewtonSeq_tendsto` and `norm_gaussNewtonMap_sub_le`. -/
theorem gaussNewtonSeq_quadratic {f : E → F} {f' : E → E →L[ℝ] F} {D : Set E} {ω : ℝ}
    {xStar x₀ : E} (hDc : Convex ℝ D) (hf : ∀ x ∈ D, HasFDerivAt f (f' x) x)
    (hinj : ∀ x ∈ D, Function.Injective (f' x))
    (hcov : ∀ x ∈ D, ∀ y ∈ D,
      ‖((f' x : E →L[ℝ] F) : E →ₗ[ℝ] F).moorePenroseInverse ((f' y - f' x) (y - x))‖ ≤
        ω * ‖y - x‖ ^ 2)
    (hxStar : xStar ∈ D) (hzero : f xStar = 0) (hx₀ : x₀ ∈ D) (hρ : ‖x₀ - xStar‖ < 2 / ω)
    (hball : ball xStar ‖x₀ - xStar‖ ⊆ D) :
    ∀ k, ‖gaussNewtonSeq f x₀ (k + 1) - xStar‖ ≤ ω / 2 * ‖gaussNewtonSeq f x₀ k - xStar‖ ^ 2 := by
  have hκ : ∀ x ∈ D, ‖((f' x : E →L[ℝ] F) : E →ₗ[ℝ] F).moorePenroseInverse (f xStar)‖ ≤
      0 * ‖x - xStar‖ := fun x _ ↦ by simp [hzero]
  have hD := (gaussNewtonSeq_tendsto hDc hf hinj hcov hκ hxStar hx₀ (by simpa using hρ) hball).1
  intro k
  have h := norm_gaussNewtonMap_sub_le hDc hf hinj hcov hκ hxStar (hD k)
  rw [zero_mul, add_zero] at h
  simpa only [gaussNewtonSeq, Function.iterate_succ_apply'] using h

end GaussNewton

/-! ## Layer 6: continuation -/

section Continuation

variable {E F : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [NormedAddCommGroup F]
  [NormedSpace ℝ F]

/-- 6.1 A predictor `x̂` of order `p` for the path `x` near `s = 0` (Deuflhard–Hohmann,
Definition 4.21): `‖x(s) - x̂(s)‖ ≤ η |s| ^ p` for `|s| ≤ ε`. -/
def IsPredictorOfOrder (x xHat : ℝ → E) (p : ℕ) (η ε : ℝ) : Prop :=
  ∀ s, |s| ≤ ε → ‖x s - xHat s‖ ≤ η * |s| ^ p

/-- 6.1 The classical predictor `x̂(s) = x(0)` has order `1` (Deuflhard–Hohmann, Lemma 4.22). -/
theorem isPredictorOfOrder_const {x x' : ℝ → E} {η ε : ℝ}
    (hx : ∀ t ∈ Icc (-ε) ε, HasDerivWithinAt x (x' t) (Icc (-ε) ε) t)
    (hη : ∀ t ∈ Icc (-ε) ε, ‖x' t‖ ≤ η) :
    IsPredictorOfOrder x (fun _ ↦ x 0) 1 η ε := by
  sorry

/-- 6.1 The tangent predictor `x̂(s) = x(0) + s x'(0)` has order `2` with `η = C / 2`
(Deuflhard–Hohmann, Lemma 4.23). -/
theorem isPredictorOfOrder_tangent {x x' x'' : ℝ → E} {C ε : ℝ}
    (hx : ∀ t ∈ Icc (-ε) ε, HasDerivWithinAt x (x' t) (Icc (-ε) ε) t)
    (hx' : ∀ t ∈ Icc (-ε) ε, HasDerivWithinAt x' (x'' t) (Icc (-ε) ε) t)
    (hC : ∀ t ∈ Icc (-ε) ε, ‖x'' t‖ ≤ C) :
    IsPredictorOfOrder x (fun s ↦ x 0 + s • x' 0) 2 (C / 2) ε := by
  sorry

/-- 6.2 The step-size criterion (Deuflhard–Hohmann, Theorem 4.24, with `min` for the printed
`max`), for one parameter value `s`: if `f(·, s)` satisfies the hypotheses of 2.2 on `D` with
constant `ω`, `x(s) ∈ D` is its zero, and the predictor has order `p` with `η |s| ^ p < 2 / ω`,
Newton's method from `x̂(s)` converges to `x(s)`. Derived here from `newtonSeq_affineCovariant`. -/
theorem tendsto_newtonSeq_predictor {f : ℝ → E → F} {f' : ℝ → E → E →L[ℝ] F} {D : Set E}
    {x xHat : ℝ → E} {p : ℕ} {η ε ω s : ℝ} (hDc : Convex ℝ D)
    (hf : ∀ y ∈ D, HasFDerivAt (f s) (f' s y) y) (hinv : ∀ y ∈ D, (f' s y).IsInvertible)
    (hcov : ∀ y ∈ D, ∀ z ∈ D,
      ‖(f' s y).inverse ((f' s z - f' s y) (z - y))‖ ≤ ω * ‖z - y‖ ^ 2)
    (hxD : x s ∈ D) (hzero : f s (x s) = 0) (hpred : IsPredictorOfOrder x xHat p η ε)
    (hs : |s| ≤ ε) (hstep : η * |s| ^ p < 2 / ω) (hHat : xHat s ∈ D)
    (hball : ball (x s) (η * |s| ^ p) ⊆ D) :
    Tendsto (newtonSeq (f s) (xHat s)) atTop (𝓝 (x s)) := by
  have h₁ : ‖xHat s - x s‖ ≤ η * |s| ^ p := by rw [norm_sub_rev]; exact hpred s hs
  exact (newtonSeq_affineCovariant hDc hf hinv hcov hxD hzero hHat (h₁.trans_lt hstep)
    ((ball_subset_ball h₁).trans hball)).2.2

end Continuation

/-! ## Layer 7: algorithmic differentiation on a register model -/

section AD

variable {ι : Type*} [Fintype ι] [DecidableEq ι]

/-- 7.1 An elemental step `v_out ← φ(v_{args 0}, …, v_{args (a-1)})` on the register file
`ι → ℝ`, with its open domain and its derivative (after Griewank–Walther, Table 2.2 and
Assumption (ED)). Arguments may alias each other and the output register. -/
structure ElementalStep (ι : Type*) where
  /-- The number of arguments. -/
  arity : ℕ
  /-- The argument registers. -/
  args : Fin arity → ι
  /-- The output register, overwritten by the step. -/
  out : ι
  /-- The open domain of the elemental function. -/
  dom : Set (Fin arity → ℝ)
  isOpen_dom : IsOpen dom
  /-- The elemental function. -/
  φ : (Fin arity → ℝ) → ℝ
  /-- Its derivative. -/
  dφ : (Fin arity → ℝ) → (Fin arity → ℝ) →L[ℝ] ℝ
  hasFDerivAt : ∀ u ∈ dom, HasFDerivAt φ (dφ u) u

namespace ElementalStep

/-- 7.1 Execution of one step: overwrite the output register. -/
def exec (I : ElementalStep ι) (v : ι → ℝ) : ι → ℝ :=
  Function.update v I.out (I.φ (v ∘ I.args))

/-- 7.2 The tangent step `v̇_out ← Σ_j ∂_j φ · v̇_{args j}`: the elementary Jacobian of
Griewank–Walther (3.7) acting on the register file. -/
def tangent (I : ElementalStep ι) (v vDot : ι → ℝ) : ι → ℝ :=
  Function.update vDot I.out (I.dφ (v ∘ I.args) (vDot ∘ I.args))

/-- 7.2 The adjoint step with overwriting, the transpose (3.11) of Griewank–Walther acting on the
register file: read `c = v̄_out`, set `v̄_out ← 0`, then `v̄_{args j} += c · ∂_j φ` for every
`j`. -/
def adjoint (I : ElementalStep ι) (v vBar : ι → ℝ) : ι → ℝ :=
  Function.update vBar I.out 0 +
    ∑ j, Pi.single (I.args j) (vBar I.out * I.dφ (v ∘ I.args) (Pi.single j 1))

end ElementalStep

/-- 7.1 Running a program of elemental steps. -/
def run : List (ElementalStep ι) → (ι → ℝ) → (ι → ℝ)
  | [], v => v
  | I :: P, v => run P (I.exec v)

/-- 7.1 The domain of a program: every step's arguments lie in its elemental domain. -/
def runDom : List (ElementalStep ι) → Set (ι → ℝ)
  | [] => univ
  | I :: P => {v | v ∘ I.args ∈ I.dom ∧ I.exec v ∈ runDom P}

/-- 7.2 The forward (tangent) sweep. -/
def runTangent : List (ElementalStep ι) → (ι → ℝ) → (ι → ℝ) → (ι → ℝ)
  | [], _, vDot => vDot
  | I :: P, v, vDot => runTangent P (I.exec v) (I.tangent v vDot)

/-- 7.2 The reverse (adjoint) sweep: the steps are undone in reverse order, each at the register
state before it. -/
def runAdjoint : List (ElementalStep ι) → (ι → ℝ) → (ι → ℝ) → (ι → ℝ)
  | [], _, vBar => vBar
  | I :: P, v, vBar => I.adjoint v (runAdjoint P (I.exec v) vBar)

/-- 7.1 Smoothness of composite functions (Griewank–Walther, Proposition 2.1): the domain of a
program is open, and the program is `C^d` there when every elemental is. -/
theorem isOpen_runDom_and_contDiffOn (P : List (ElementalStep ι)) {d : WithTop ℕ∞}
    (hP : ∀ I ∈ P, ContDiffOn ℝ d I.φ I.dom) :
    IsOpen (runDom P) ∧ ContDiffOn ℝ d (run P) (runDom P) := by
  sorry

/-- 7.2 The forward sweep computes the derivative (Griewank–Walther, (3.8)–(3.9) and
Table 3.4). -/
theorem runTangent_eq_fderiv (P : List (ElementalStep ι)) {v : ι → ℝ} (hv : v ∈ runDom P) :
    DifferentiableAt ℝ (run P) v ∧ ∀ vDot, runTangent P v vDot = fderiv ℝ (run P) v vDot := by
  sorry

/-- 7.2 The reverse sweep is the transpose of the forward sweep (Griewank–Walther, (3.4) and
(3.10)): `⟨x̄, ẋ⟩ = ⟨ȳ, ẏ⟩`. No domain hypothesis is needed; the identity is algebraic. -/
theorem runAdjoint_pairing (P : List (ElementalStep ι)) (v vBar vDot : ι → ℝ) :
    ∑ i, runAdjoint P v vBar i * vDot i = ∑ i, vBar i * runTangent P v vDot i := by
  sorry

/-- 7.2 The reverse sweep seeded with the `o`-th unit vector computes the gradient of the `o`-th
output register (Griewank–Walther, (3.3)). -/
theorem runAdjoint_single_eq_fderiv (P : List (ElementalStep ι)) {v : ι → ℝ}
    (hv : v ∈ runDom P) (o : ι) (vDot : ι → ℝ) :
    ∑ i, runAdjoint P v (Pi.single o 1) i * vDot i = fderiv ℝ (fun w ↦ run P w o) v vDot := by
  sorry

end AD

/-! ## Layer 8: complexity of derivative evaluation -/

section Complexity

/-- 8.1 The elemental types of the four-component cost model (Griewank–Walther, §4.4):
constants, additions and subtractions, multiplications, and univariate nonlinear functions. -/
inductive ElementalKind
  | const
  | addSub
  | mul
  | unary
  deriving DecidableEq

/-- 8.1 `WORK` of evaluation per elemental, as (moves, adds, mults, nlops) (Griewank–Walther,
(4.7)). -/
def workEval : ElementalKind → Fin 4 → ℕ
  | .const => ![1, 0, 0, 0]
  | .addSub => ![3, 1, 0, 0]
  | .mul => ![3, 0, 1, 0]
  | .unary => ![2, 0, 0, 1]

/-- 8.1 `WORK` of the tangent procedure per elemental (Griewank–Walther, (4.16)). -/
def workTangent : ElementalKind → Fin 4 → ℕ
  | .const => ![2, 0, 0, 0]
  | .addSub => ![6, 2, 0, 0]
  | .mul => ![6, 1, 3, 0]
  | .unary => ![4, 0, 1, 2]

/-- 8.1 `WORK` of the vector tangent procedure with `p` directions per elemental
(Griewank–Walther, Table 4.15). -/
def workTangentVec (p : ℕ) : ElementalKind → Fin 4 → ℕ
  | .const => ![1 + p, 0, 0, 0]
  | .addSub => ![3 + 3 * p, 1 + p, 0, 0]
  | .mul => ![3 + 3 * p, p, 1 + 2 * p, 0]
  | .unary => ![2 + 2 * p, 0, p, 2]

/-- 8.1 `WORK` of the gradient (reverse) procedure per elemental (Griewank–Walther, (4.20)). -/
def workGradient : ElementalKind → Fin 4 → ℕ
  | .const => ![2, 0, 0, 0]
  | .addSub => ![9, 3, 0, 0]
  | .mul => ![11, 2, 3, 0]
  | .unary => ![7, 1, 1, 2]

/-- 8.1 `WORK` of the vector gradient procedure with `q` adjoint directions per elemental
(Griewank–Walther, (4.22) and Table 4.18). -/
def workGradientVec (q : ℕ) : ElementalKind → Fin 4 → ℕ
  | .const => ![1 + q, 0, 0, 0]
  | .addSub => ![3 + 6 * q, 1 + 2 * q, 0, 0]
  | .mul => ![5 + 6 * q, 2 * q, 1 + 2 * q, 0]
  | .unary => ![3 + 4 * q, q, q, 2]

/-- 8.1 `WORK` of a procedure on an evaluation trace, additive over the elementals
(Griewank–Walther, Assumption (TA)). -/
def work (W : ElementalKind → Fin 4 → ℕ) (P : List ElementalKind) : Fin 4 → ℕ :=
  (P.map W).sum

/-- 8.1 The runtime functional `TIME = w ⬝ WORK` (Griewank–Walther, (4.8)). -/
def runtime (w : Fin 4 → ℝ) (W : Fin 4 → ℕ) : ℝ :=
  ∑ i, w i * W i

/-- 8.1 Admissible runtime weights `w = (μ, 1, π, ν)` with `μ ≥ π ≥ 1` and `ν ≥ 2π`
(Griewank–Walther, (4.11)). -/
structure IsRuntimeWeight (w : Fin 4 → ℝ) : Prop where
  adds : w 1 = 1
  mults_le_moves : w 2 ≤ w 0
  one_le_mults : 1 ≤ w 2
  two_mults_le_nlops : 2 * w 2 ≤ w 3

/-- 8.1 Boundedness of additive tasks (Griewank–Walther, Proposition 4.3 and (4.12)): a bound on
the runtime ratio for every elemental bounds it for every trace. A proved sanity check of `work`
and `runtime`: induction on the trace and linearity of `runtime`. -/
theorem runtime_work_le_of_forall {w : Fin 4 → ℝ} {W W' : ElementalKind → Fin 4 → ℕ} {c : ℝ}
    (h : ∀ e, runtime w (W e) ≤ c * runtime w (W' e)) (P : List ElementalKind) :
    runtime w (work W P) ≤ c * runtime w (work W' P) := by
  induction P with
  | nil => simp [runtime, work]
  | cons e P ih =>
    have hadd : ∀ U V : Fin 4 → ℕ, runtime w (U + V) = runtime w U + runtime w V := by
      intro U V; simp [runtime, mul_add, Finset.sum_add_distrib]
    simp only [work, List.map_cons, List.sum_cons] at ih ⊢
    rw [hadd, hadd, mul_add]
    exact add_le_add (h e) ih

/-- 8.2 Tangents cost at most `5/2` evaluations (Griewank–Walther, (4.17)). -/
theorem runtime_workTangent_le {w : Fin 4 → ℝ} (hw : IsRuntimeWeight w)
    (P : List ElementalKind) :
    runtime w (work workTangent P) ≤ 5 / 2 * runtime w (work workEval P) := by
  sorry

/-- 8.2 `p ≥ 1` tangents cost at most `1 + 3p/2` evaluations (Griewank–Walther, (4.18)). -/
theorem runtime_workTangentVec_le {w : Fin 4 → ℝ} (hw : IsRuntimeWeight w) {p : ℕ} (hp : 1 ≤ p)
    (P : List ElementalKind) :
    runtime w (work (workTangentVec p) P) ≤ (1 + 3 * p / 2) * runtime w (work workEval P) := by
  sorry

/-- 8.3 The cheap gradient principle (Griewank–Walther, (4.21) and Rule 8): a gradient costs at
most `4` evaluations. -/
theorem runtime_workGradient_le {w : Fin 4 → ℝ} (hw : IsRuntimeWeight w)
    (P : List ElementalKind) :
    runtime w (work workGradient P) ≤ 4 * runtime w (work workEval P) := by
  sorry

/-- 8.3 `q ≥ 1` adjoints cost at most `3/2 + 5q/2` evaluations (Griewank–Walther, (4.23)). -/
theorem runtime_workGradientVec_le {w : Fin 4 → ℝ} (hw : IsRuntimeWeight w) {q : ℕ} (hq : 1 ≤ q)
    (P : List ElementalKind) :
    runtime w (work (workGradientVec q) P) ≤ (3 / 2 + 5 * q / 2) * runtime w (work workEval P) := by
  sorry

/-- 8.3 The four bounds are attained by a single multiplication at `w = (1, 1, 1, 2)`. -/
theorem runtime_mul_attains (p q : ℕ) :
    IsRuntimeWeight ![1, 1, 1, 2] ∧
    runtime ![1, 1, 1, 2] (work workTangent [.mul]) =
      5 / 2 * runtime ![1, 1, 1, 2] (work workEval [.mul]) ∧
    runtime ![1, 1, 1, 2] (work (workTangentVec p) [.mul]) =
      (1 + 3 * p / 2) * runtime ![1, 1, 1, 2] (work workEval [.mul]) ∧
    runtime ![1, 1, 1, 2] (work workGradient [.mul]) =
      4 * runtime ![1, 1, 1, 2] (work workEval [.mul]) ∧
    runtime ![1, 1, 1, 2] (work (workGradientVec q) [.mul]) =
      (3 / 2 + 5 * q / 2) * runtime ![1, 1, 1, 2] (work workEval [.mul]) := by
  refine ⟨⟨rfl, by norm_num, by norm_num, by norm_num⟩, ?_, ?_, ?_, ?_⟩ <;>
    simp [runtime, work, workEval, workTangent, workTangentVec, workGradient, workGradientVec,
      Fin.sum_univ_four] <;> ring

/-- 8.4 The column intersection graph of a sparse matrix: distinct columns are adjacent when they
have a nonzero entry in a common row (Griewank–Walther, §8.1, p. 164). -/
def columnGraph {m n : ℕ} (A : Matrix (Fin m) (Fin n) ℝ) : SimpleGraph (Fin n) :=
  SimpleGraph.fromRel fun j j' ↦ ∃ i, A i j ≠ 0 ∧ A i j' ≠ 0

/-- 8.4 The colour seed matrix `S j k = [c j = k]` of a column colouring. -/
def colourSeed {n p : ℕ} (c : Fin n → Fin p) : Matrix (Fin n) (Fin p) ℝ :=
  Matrix.of fun j k ↦ if c j = k then 1 else 0

/-- 8.4 Column compression (Curtis–Powell–Reid; Griewank–Walther, (8.6)–(8.8)): for a colouring
`c` of the column intersection graph, the compressed matrix `A S` contains every nonzero entry:
`(A S) i (c j) = A i j` when `A i j ≠ 0`. -/
theorem mul_colourSeed_apply {m n p : ℕ} (A : Matrix (Fin m) (Fin n) ℝ)
    (c : (columnGraph A).Coloring (Fin p)) {i : Fin m} {j : Fin n} (hij : A i j ≠ 0) :
    (A * colourSeed c) i (c j) = A i j := by
  rw [Matrix.mul_apply, Finset.sum_eq_single j]
  · simp [colourSeed]
  · intro j' _ hj'
    by_cases h : A i j' = 0
    · simp [h]
    · have hadj : (columnGraph A).Adj j' j := ⟨hj', Or.inl ⟨i, h, hij⟩⟩
      simp [colourSeed, c.valid hadj]
  · simp

/-- 8.4 The number of nonzeros in any row is at most the chromatic number of the column
intersection graph, since the nonzero columns of a row form a clique; so a colouring needs at
least that many colours. -/
theorem card_nonzero_row_le_chromaticNumber {m n : ℕ} (A : Matrix (Fin m) (Fin n) ℝ)
    (i : Fin m) :
    ((Finset.univ.filter fun j ↦ A i j ≠ 0).card : ℕ∞) ≤ (columnGraph A).chromaticNumber := by
  refine SimpleGraph.IsClique.card_le_chromaticNumber ?_
  intro j hj j' hj' hne
  simp only [Finset.coe_filter, Finset.mem_univ, true_and] at hj hj'
  exact ⟨hne, Or.inl ⟨i, hj, hj'⟩⟩

end Complexity

/-! ## Library declarations named in the README -/

#check @ContinuousLinearMap.inverse
#check @ContinuousLinearMap.IsInvertible
#check @ContinuousLinearMap.adjoint
#check @ContinuousLinearMap.smulRight
#check @innerSL
#check @Asymptotics.IsLittleO
#check @MapClusterPt
#check @IsCompact
#check @HasFDerivAt
#check @fderiv
#check @DifferentiableAt
#check @ContDiffOn
#check @derivWithin
#check @iteratedDerivWithin
#check @Convex.norm_image_sub_le_of_norm_hasFDerivWithin_le
#check @ContDiffAt.implicitFunction
#check @ContDiffAt.contDiffAt_implicitFunction
#check @ContDiffAt.hasStrictFDerivAt_implicitFunction
#check @EuclideanSpace
#check @SimpleGraph.fromRel
#check @SimpleGraph.Coloring
#check @SimpleGraph.chromaticNumber
#check @SimpleGraph.IsClique.card_le_chromaticNumber
#check @LinearMap.moorePenroseInverse
#check @HasDerivWithinAt

end TauCetiRoadmap.NewtonTypeMethodsAndAlgorithmicDifferentiation
