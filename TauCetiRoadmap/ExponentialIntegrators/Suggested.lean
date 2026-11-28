import Mathlib

/-!
# Exponential integrators: target signatures

This file is not the roadmap: the roadmap is `README.md`. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti APIs, each with `sorry`, together with the
definitions they need; every definition has a real body. Every headline theorem of the README is
statable at the pins and is stated here. The README's remaining targets, API lists and Checks are
not restated.

The definitions `meshNode`, `oneStepSeq` and `oneStepDefect` are copied verbatim from
OneStepMethodsForODEs 1.1 and 1.2, which owns them; they are repeated here only so that the
statements elaborate without importing another roadmap.

The linear part of a semilinear equation `x' = A(t) x + b(t) F(t, x)` enters only through an
evolution family `U t s`, the solution operator from time `s` to time `t`; a solution enters
through the variation-of-constants identity it satisfies (a mild solution). The constants of the
error bounds depend on a growth bound `‖U t s‖ ≤ M exp (ω (t - s))` and never on the norm of the
linear part.
-/

noncomputable section

open Set MeasureTheory NormedSpace
open scoped NNReal InnerProductSpace

namespace TauCetiRoadmap.ExponentialIntegrators

variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]

/-! ## Copied from OneStepMethodsForODEs -/

/-- Conventions (copied verbatim from OneStepMethodsForODEs 1.1): the `n`-th node
`t₀ + h 0 + ⋯ + h (n - 1)` of the mesh with first node `t₀` and steps `h`. -/
def meshNode (t₀ : ℝ) (h : ℕ → ℝ) (n : ℕ) : ℝ := t₀ + ∑ i ∈ Finset.range n, h i

/-- Conventions (copied verbatim from OneStepMethodsForODEs 1.2): the numerical solution of the
one-step method with increment function `Φ` on the mesh with first node `t₀` and steps `h`,
started at `y₀`: `Y (n + 1) = Y n + h n • Φ (t n) (Y n) (h n)`. -/
def oneStepSeq (Φ : ℝ → E → ℝ → E) (t₀ : ℝ) (h : ℕ → ℝ) (y₀ : E) : ℕ → E
  | 0 => y₀
  | n + 1 => oneStepSeq Φ t₀ h y₀ n + h n • Φ (meshNode t₀ h n) (oneStepSeq Φ t₀ h y₀ n) (h n)

/-- Conventions (copied verbatim from OneStepMethodsForODEs 1.2): the one-step defect of a
curve `y` at `t` with step `h`. -/
def oneStepDefect (Φ : ℝ → E → ℝ → E) (y : ℝ → E) (t h : ℝ) : E :=
  y (t + h) - y t - h • Φ t (y t) h

/-! ## Layer 1: evolution families and mild solutions -/

/-- 1.1: `U t s` is an evolution family: `U t t = 1`, `U t r ∘ U r s = U t s` for `s ≤ r ≤ t`,
and `(t, s) ↦ U t s v` is continuous on `{s ≤ t}` for every `v`. -/
structure IsEvolutionFamily (U : ℝ → ℝ → E →L[ℝ] E) : Prop where
  /-- The solution operator over an interval of length zero is the identity. -/
  apply_self : ∀ t, U t t = 1
  /-- Composition along consecutive intervals. -/
  comp : ∀ s r t, s ≤ r → r ≤ t → (U t r).comp (U r s) = U t s
  /-- Strong continuity on `{(t, s) | s ≤ t}`. -/
  continuousOn : ∀ v : E, ContinuousOn (fun p : ℝ × ℝ ↦ U p.1 p.2 v) {p | p.2 ≤ p.1}

/-- 1.1: the growth bound `‖U t s‖ ≤ M exp (ω (t - s))` for `s ≤ t`. -/
def HasGrowthBound (U : ℝ → ℝ → E →L[ℝ] E) (M ω : ℝ) : Prop :=
  ∀ s t, s ≤ t → ‖U t s‖ ≤ M * Real.exp (ω * (t - s))

/-- 1.1: `x` is a mild solution on `[a, c]` of the semilinear equation with evolution family `U`,
scalar weight `b` and nonlinearity `F`: for `a ≤ s ≤ t ≤ c`,
`x t = U t s (x s) + ∫_s^t b r • U t r (F r (x r)) dr`. -/
def IsMildSolutionOn (U : ℝ → ℝ → E →L[ℝ] E) (b : ℝ → ℝ) (F : ℝ → E → E) (x : ℝ → E)
    (a c : ℝ) : Prop :=
  ∀ s t, a ≤ s → s ≤ t → t ≤ c → x t = U t s (x s) + ∫ r in s..t, b r • U t r (F r (x r))

/-- 1.2: the one-sided growth bound. On a real inner product space, if `⟪A r v, v⟫ ≤ ω ‖v‖²`
for all `r ∈ [s, t₁]` and all `v`, every solution of `x' = A(t) x` on `[s, t₁]` satisfies
`‖x t‖ ≤ exp (ω (t - s)) ‖x s‖`, whatever the norms of the operators `A r`. -/
theorem norm_le_exp_mul_norm_of_inner_le {H : Type*} [NormedAddCommGroup H]
    [InnerProductSpace ℝ H] {A : ℝ → H →L[ℝ] H} {x : ℝ → H} {s t₁ ω : ℝ}
    (hA : ∀ r ∈ Icc s t₁, ∀ v, ⟪A r v, v⟫_ℝ ≤ ω * ‖v‖ ^ 2)
    (hx : ∀ r ∈ Icc s t₁, HasDerivWithinAt x (A r (x r)) (Icc s t₁) r) :
    ∀ t ∈ Icc s t₁, ‖x t‖ ≤ Real.exp (ω * (t - s)) * ‖x s‖ := by
  sorry

/-! ## Layer 2: the φ-functions -/

section Phi

variable {𝔸 : Type*} [NormedRing 𝔸] [NormedAlgebra ℝ 𝔸] [CompleteSpace 𝔸]

/-- 2.1: the φ-functions on a complete normed real algebra: `phi 0 X = exp X` and, for
`k ≥ 0`, `phi (k + 1) X = ∫₀¹ θ^k / k! • exp ((1 - θ) • X) dθ`. -/
def phi : ℕ → 𝔸 → 𝔸
  | 0, X => exp X
  | k + 1, X => ∫ θ in (0 : ℝ)..1, (θ ^ k / (k.factorial : ℝ)) • exp ((1 - θ) • X)

/-- 2.1: the recursion `phi k X = (1 / k!) • 1 + X * phi (k + 1) X`. -/
theorem phi_eq_inv_factorial_smul_one_add_mul (k : ℕ) (X : 𝔸) :
    phi k X = ((k.factorial : ℝ)⁻¹) • (1 : 𝔸) + X * phi (k + 1) X := by
  sorry

/-- 2.2: if `‖exp (s • X)‖ ≤ M exp (ω s)` for `s ∈ [0, 1]`, then
`‖phi (k + 1) X‖ ≤ M phi (k + 1) ω`, the right side being the real φ-function at `ω`. -/
theorem norm_phi_succ_le {X : 𝔸} {M ω : ℝ}
    (hX : ∀ s ∈ Icc (0 : ℝ) 1, ‖exp (s • X)‖ ≤ M * Real.exp (ω * s)) (k : ℕ) :
    ‖phi (k + 1) X‖ ≤ M * phi (k + 1) ω := by
  sorry

end Phi

/-! ## Layer 3: the exponential Euler method -/

/-- 3.1: one step of the exponential Euler method from `(t, u)` with step `h`:
`U (t + h) t u + ∫_t^{t+h} b r • U (t + h) r (F t u) dr`. -/
def expEulerStep (U : ℝ → ℝ → E →L[ℝ] E) (b : ℝ → ℝ) (F : ℝ → E → E) (t : ℝ) (u : E)
    (h : ℝ) : E :=
  U (t + h) t u + ∫ r in t..t + h, b r • U (t + h) r (F t u)

/-- 3.1: the increment function of the exponential Euler method, `h⁻¹ • (step - u)`, so that
`u + h • expEulerIncrement U b F t u h` is the step for `h ≠ 0` and `u` for `h = 0`. -/
def expEulerIncrement (U : ℝ → ℝ → E →L[ℝ] E) (b : ℝ → ℝ) (F : ℝ → E → E) (t : ℝ) (u : E)
    (h : ℝ) : E :=
  h⁻¹ • (expEulerStep U b F t u h - u)

/-- 3.2: the defect of the exponential Euler method along a mild solution is at most
`B M M₂ exp (ω h) h² / 2`, where `M₂` is a Lipschitz constant of `r ↦ F r (x r)`. -/
theorem norm_oneStepDefect_expEulerIncrement_le [CompleteSpace E]
    {U : ℝ → ℝ → E →L[ℝ] E} {b : ℝ → ℝ} {F : ℝ → E → E} {x : ℝ → E} {a c M ω B : ℝ}
    {M₂ : ℝ≥0} (hU : IsEvolutionFamily U) (hUg : HasGrowthBound U M ω) (hω : 0 ≤ ω)
    (hb : ContinuousOn b (Icc a c)) (hB : ∀ r ∈ Icc a c, |b r| ≤ B)
    (hx : IsMildSolutionOn U b F x a c) (hg : LipschitzOnWith M₂ (fun r ↦ F r (x r)) (Icc a c))
    {t h : ℝ} (ht : a ≤ t) (hh : 0 ≤ h) (htc : t + h ≤ c) :
    ‖oneStepDefect (expEulerIncrement U b F) x t h‖ ≤
      B * M * M₂ * Real.exp (ω * h) * h ^ 2 / 2 := by
  sorry

/-- 3.3: the global error of the exponential Euler method. Its constants depend on the growth
bound `(M, ω)` of the evolution family, the bound `B` of the weight, the Lipschitz constant `L`
of `F` in `x` and the Lipschitz constant `M₂` of `r ↦ F r (x r)`, and not on the linear part. -/
theorem norm_sub_oneStepSeq_expEulerIncrement_le [CompleteSpace E]
    {U : ℝ → ℝ → E →L[ℝ] E} {b : ℝ → ℝ} {F : ℝ → E → E} {x : ℝ → E} {a c M ω B hmax : ℝ}
    {L M₂ : ℝ≥0} (hU : IsEvolutionFamily U) (hUg : HasGrowthBound U M ω) (hω : 0 ≤ ω)
    (hb : ContinuousOn b (Icc a c)) (hB : ∀ r ∈ Icc a c, |b r| ≤ B)
    (hF : ∀ t, LipschitzWith L (F t))
    (hx : IsMildSolutionOn U b F x a c) (hg : LipschitzOnWith M₂ (fun r ↦ F r (x r)) (Icc a c))
    {h : ℕ → ℝ} {N : ℕ} (hh : ∀ n < N, 0 ≤ h n ∧ h n ≤ hmax) (hN : meshNode a h N ≤ c)
    (y₀ : E) {n : ℕ} (hn : n ≤ N) :
    ‖x (meshNode a h n) - oneStepSeq (expEulerIncrement U b F) a h y₀ n‖ ≤
      M * Real.exp ((ω + M * B * L) * (meshNode a h n - a)) *
        (‖x a - y₀‖ + B * M₂ * hmax * (meshNode a h n - a) / 2) := by
  sorry

/-! ## Layer 4: a second-order exponential Runge–Kutta method -/

/-- 4.1: one step of the second-order exponential Runge–Kutta method with nodes `0, 1`: the
exponential Euler step `a` is corrected by
`∫_t^{t+h} (b r (r - t) / h) • U (t + h) r (F (t + h) a - F t u) dr`. -/
def expRK2Step (U : ℝ → ℝ → E →L[ℝ] E) (b : ℝ → ℝ) (F : ℝ → E → E) (t : ℝ) (u : E)
    (h : ℝ) : E :=
  expEulerStep U b F t u h +
    ∫ r in t..t + h,
      (b r * ((r - t) / h)) • U (t + h) r (F (t + h) (expEulerStep U b F t u h) - F t u)

/-- 4.1: the increment function of the method of `expRK2Step`. -/
def expRK2Increment (U : ℝ → ℝ → E →L[ℝ] E) (b : ℝ → ℝ) (F : ℝ → E → E) (t : ℝ) (u : E)
    (h : ℝ) : E :=
  h⁻¹ • (expRK2Step U b F t u h - u)

/-- 4.2: the defect of the second-order method along a mild solution is at most
`B M exp (ω h) h³ (M₃ / 12 + L B M M₂ exp (ω h) / 4)`, where `r ↦ F r (x r)` is
`M₂`-Lipschitz with an `M₃`-Lipschitz derivative. -/
theorem norm_oneStepDefect_expRK2Increment_le [CompleteSpace E]
    {U : ℝ → ℝ → E →L[ℝ] E} {b : ℝ → ℝ} {F : ℝ → E → E} {x g' : ℝ → E} {a c M ω B : ℝ}
    {L M₂ M₃ : ℝ≥0} (hU : IsEvolutionFamily U) (hUg : HasGrowthBound U M ω) (hω : 0 ≤ ω)
    (hb : ContinuousOn b (Icc a c)) (hB : ∀ r ∈ Icc a c, |b r| ≤ B)
    (hF : ∀ t, LipschitzWith L (F t))
    (hx : IsMildSolutionOn U b F x a c) (hg : LipschitzOnWith M₂ (fun r ↦ F r (x r)) (Icc a c))
    (hg' : ∀ r ∈ Icc a c, HasDerivWithinAt (fun r ↦ F r (x r)) (g' r) (Icc a c) r)
    (hg'L : LipschitzOnWith M₃ g' (Icc a c))
    {t h : ℝ} (ht : a ≤ t) (hh : 0 ≤ h) (htc : t + h ≤ c) :
    ‖oneStepDefect (expRK2Increment U b F) x t h‖ ≤
      B * M * Real.exp (ω * h) * h ^ 3 *
        (M₃ / 12 + L * B * M * M₂ * Real.exp (ω * h) / 4) := by
  sorry

/-- 4.3: the global error of the second-order method is `O(hmax²)`, with constants
`C = B M L (1 + M exp (ω hmax) (1 + B hmax L)) / 2` and
`D = B M (M₃ / 12 + L B M M₂ exp (ω hmax) / 4)` that do not depend on the linear part. -/
theorem norm_sub_oneStepSeq_expRK2Increment_le [CompleteSpace E]
    {U : ℝ → ℝ → E →L[ℝ] E} {b : ℝ → ℝ} {F : ℝ → E → E} {x g' : ℝ → E} {a c M ω B hmax : ℝ}
    {L M₂ M₃ : ℝ≥0} (hU : IsEvolutionFamily U) (hUg : HasGrowthBound U M ω) (hω : 0 ≤ ω)
    (hb : ContinuousOn b (Icc a c)) (hB : ∀ r ∈ Icc a c, |b r| ≤ B)
    (hF : ∀ t, LipschitzWith L (F t))
    (hx : IsMildSolutionOn U b F x a c) (hg : LipschitzOnWith M₂ (fun r ↦ F r (x r)) (Icc a c))
    (hg' : ∀ r ∈ Icc a c, HasDerivWithinAt (fun r ↦ F r (x r)) (g' r) (Icc a c) r)
    (hg'L : LipschitzOnWith M₃ g' (Icc a c))
    {h : ℕ → ℝ} {N : ℕ} (hh : ∀ n < N, 0 ≤ h n ∧ h n ≤ hmax) (hN : meshNode a h N ≤ c)
    (y₀ : E) {n : ℕ} (hn : n ≤ N) :
    ‖x (meshNode a h n) - oneStepSeq (expRK2Increment U b F) a h y₀ n‖ ≤
      Real.exp ((ω + B * M * L * (1 + M * Real.exp (ω * hmax) * (1 + B * hmax * L)) / 2) *
          (meshNode a h n - a)) *
        (M * ‖x a - y₀‖ +
          B * M * (M₃ / 12 + L * B * M * M₂ * Real.exp (ω * hmax) / 4) * hmax ^ 2 *
            (meshNode a h n - a)) := by
  sorry

/-! ## Layer 5: DDIM as the exponential Euler method -/

/-- 5.1: the signal level `α λ = (1 + exp (-2 λ))^(-1/2)` at log signal-to-noise ratio `λ`. -/
def lsnrSignal (l : ℝ) : ℝ := (Real.sqrt (1 + Real.exp (-2 * l)))⁻¹

/-- 5.1: the noise level `σ λ = (1 + exp (2 λ))^(-1/2)` at log signal-to-noise ratio `λ`. -/
def lsnrNoise (l : ℝ) : ℝ := (Real.sqrt (1 + Real.exp (2 * l)))⁻¹

/-- 5.1: the evolution family of the linear part `σ(λ)² x`: multiplication by `α λ' / α λ`. -/
def lsnrFamily (l' l : ℝ) : E →L[ℝ] E := (lsnrSignal l' / lsnrSignal l) • (1 : E →L[ℝ] E)

/-- 5.2: one deterministic DDIM step from level `λ` to level `λ'` with noise predictor `ε`:
`α λ' • ((x - σ λ • ε λ x) / α λ) + σ λ' • ε λ x`. -/
def ddimStep (ε : ℝ → E → E) (l l' : ℝ) (x : E) : E :=
  (lsnrSignal l' / lsnrSignal l) • (x - lsnrNoise l • ε l x) + lsnrNoise l' • ε l x

/-- 5.2: the DDIM iterates on the mesh with first level `λ₀` and steps `h`. -/
def ddimSeq (ε : ℝ → E → E) (l₀ : ℝ) (h : ℕ → ℝ) (x₀ : E) : ℕ → E
  | 0 => x₀
  | n + 1 => ddimStep ε (meshNode l₀ h n) (meshNode l₀ h (n + 1)) (ddimSeq ε l₀ h x₀ n)

/-- 5.2: a DDIM step is the exponential Euler step for `dx/dλ = σ(λ)² x - σ(λ) ε(λ, x)` with the
evolution family `lsnrFamily`, the weight `-σ` and the frozen nonlinearity `ε`. -/
theorem ddimStep_eq_expEulerStep [CompleteSpace E] (ε : ℝ → E → E) (l h : ℝ) (x : E) :
    ddimStep ε l (l + h) x = expEulerStep lsnrFamily (fun r ↦ -lsnrNoise r) ε l x h := by
  sorry

/-- 5.3: the global error of DDIM for a solution of `dx/dλ = σ(λ)² x - σ(λ) ε(λ, x)` on
`[λ₀, λ₁]`, for a noise predictor `ε` that is `L`-Lipschitz in `x` and `M₂`-Lipschitz in `λ`
along the solution. -/
theorem norm_sub_ddimSeq_le [CompleteSpace E] {ε : ℝ → E → E} {x : ℝ → E} {l₀ l₁ hmax : ℝ}
    {L M₂ : ℝ≥0} (hε : ∀ l, LipschitzWith L (ε l))
    (hx : ∀ l ∈ Icc l₀ l₁,
      HasDerivWithinAt x (lsnrNoise l ^ 2 • x l - lsnrNoise l • ε l (x l)) (Icc l₀ l₁) l)
    (hg : LipschitzOnWith M₂ (fun l ↦ ε l (x l)) (Icc l₀ l₁))
    {h : ℕ → ℝ} {N : ℕ} (hh : ∀ n < N, 0 ≤ h n ∧ h n ≤ hmax) (hN : meshNode l₀ h N ≤ l₁)
    (x₀ : E) {n : ℕ} (hn : n ≤ N) :
    ‖x (meshNode l₀ h n) - ddimSeq ε l₀ h x₀ n‖ ≤
      Real.exp ((1 + L) * (meshNode l₀ h n - l₀)) *
        (‖x l₀ - x₀‖ + M₂ * hmax * (meshNode l₀ h n - l₀) / 2) := by
  sorry

end TauCetiRoadmap.ExponentialIntegrators
