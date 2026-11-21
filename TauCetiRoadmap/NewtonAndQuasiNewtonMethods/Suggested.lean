import Mathlib

/-!
# Newton and quasi-Newton methods: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib, each with `sorry`, together with the definitions
they need; every definition has a real body. Every headline theorem of the README is statable at
the pins and is stated here. The README's remaining API facts and Checks are not restated.

The Newton map of `f : E → F` is `x ↦ x - (fderiv ℝ f x).inverse (f x)`, where
`ContinuousLinearMap.inverse` is the inverse of a continuous linear equivalence and `0` for any
other map; so at a point where the derivative is not invertible the Newton map is the identity.
The Newton sequence is the iterate of the Newton map. Quasi-Newton updates are explicit functions
of a matrix `B` or `H` and two vectors `s`, `y`; a reciprocal `c⁻¹` or quotient `a / c` with
`c = 0` is `0`, as everywhere in Mathlib.
-/

noncomputable section

open Filter Metric Matrix
open scoped Topology

namespace TauCetiRoadmap.NewtonAndQuasiNewtonMethods

variable {E F : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [NormedAddCommGroup F]
  [NormedSpace ℝ F]

/-! ## Layer 1: the Newton map and local convergence -/

/-- 1.1 The Newton map of `f`: `x ↦ x - f'(x)⁻¹ f(x)`, with Mathlib's
`ContinuousLinearMap.inverse`, which is `0` when `fderiv ℝ f x` is not invertible (and then the
Newton map fixes `x`). -/
def newtonMap (f : E → F) (x : E) : E :=
  x - (fderiv ℝ f x).inverse (f x)

/-- 1.1 The Newton sequence from `x₀`: the `k`-th iterate of the Newton map. -/
def newtonSeq (f : E → F) (x₀ : E) (k : ℕ) : E :=
  (newtonMap f)^[k] x₀

/-- 1.2 The quadratic remainder estimate. On a convex set `S` where `g` has derivative `g'`
(within `S`) and `g'` is `L`-Lipschitz, `‖g y - g x - g' x (y - x)‖ ≤ L / 2 * ‖y - x‖ ^ 2`. -/
theorem norm_sub_sub_fderiv_le {g : E → F} {g' : E → E →L[ℝ] F} {S : Set E} {L : ℝ}
    (hS : Convex ℝ S) (hg : ∀ u ∈ S, HasFDerivWithinAt g (g' u) S u)
    (hL : ∀ u ∈ S, ∀ v ∈ S, ‖g' u - g' v‖ ≤ L * ‖u - v‖) {x y : E} (hx : x ∈ S) (hy : y ∈ S) :
    ‖g y - g x - g' x (y - x)‖ ≤ L / 2 * ‖y - x‖ ^ 2 := by
  sorry

/-- 1.3 Local quadratic convergence of Newton's method (Ferreira, Theorem 13 with `p = 1`).
Let `f` be continuously differentiable on the ball `B(x⋆, κ)` between Banach spaces, with
`f x⋆ = 0`, `f'(x⋆) = A` invertible, and the affine-invariant radial Lipschitz condition
`‖A⁻¹ (f'(x) - f'(x⋆ + τ (x - x⋆)))‖ ≤ K (1 - τ) ‖x - x⋆‖` for `x` in the ball and `τ ∈ [0, 1]`.
Let `r = min κ (2 / (3 K))`. From every `x₀ ∈ B(x⋆, r)` the Newton sequence stays in `B(x⋆, r)`,
converges to `x⋆`, and `‖x_(k+1) - x⋆‖ ≤ K ‖x_k - x⋆‖² / (2 (1 - K ‖x_k - x⋆‖))`. -/
theorem newtonSeq_local_quadratic [CompleteSpace E] [CompleteSpace F] {f : E → F}
    {f' : E → E →L[ℝ] F} {xStar : E} {κ K : ℝ} (A : E ≃L[ℝ] F) (hκ : 0 < κ) (hK : 0 < K)
    (hf : ∀ x ∈ ball xStar κ, HasFDerivAt f (f' x) x) (hf' : ContinuousOn f' (ball xStar κ))
    (hzero : f xStar = 0) (hA : f' xStar = (A : E →L[ℝ] F))
    (hrad : ∀ x ∈ ball xStar κ, ∀ τ ∈ Set.Icc (0 : ℝ) 1,
      ‖(A.symm : F →L[ℝ] E).comp (f' x - f' (xStar + τ • (x - xStar)))‖ ≤
        K * (1 - τ) * ‖x - xStar‖)
    {x₀ : E} (hx₀ : x₀ ∈ ball xStar (min κ (2 / (3 * K)))) :
    (∀ k, newtonSeq f x₀ k ∈ ball xStar (min κ (2 / (3 * K))) ∧
      ‖newtonSeq f x₀ (k + 1) - xStar‖ ≤
        K * ‖newtonSeq f x₀ k - xStar‖ ^ 2 / (2 * (1 - K * ‖newtonSeq f x₀ k - xStar‖))) ∧
    Tendsto (newtonSeq f x₀) atTop (𝓝 xStar) := by
  sorry

/-- 1.4 Uniqueness of the zero (Ferreira, Theorem 2 for the majorant `t ↦ K t² / 2 - t`; the case
`p = 1` of Theorem 13). Under the hypotheses of 1.3 (without a starting point), `x⋆` is the only
zero of `f` in `B(x⋆, min κ (2 / K))`. -/
theorem eq_of_mem_ball_of_eq_zero [CompleteSpace E] [CompleteSpace F] {f : E → F}
    {f' : E → E →L[ℝ] F} {xStar : E} {κ K : ℝ} (A : E ≃L[ℝ] F) (hκ : 0 < κ) (hK : 0 < K)
    (hf : ∀ x ∈ ball xStar κ, HasFDerivAt f (f' x) x) (hf' : ContinuousOn f' (ball xStar κ))
    (hzero : f xStar = 0) (hA : f' xStar = (A : E →L[ℝ] F))
    (hrad : ∀ x ∈ ball xStar κ, ∀ τ ∈ Set.Icc (0 : ℝ) 1,
      ‖(A.symm : F →L[ℝ] E).comp (f' x - f' (xStar + τ • (x - xStar)))‖ ≤
        K * (1 - τ) * ‖x - xStar‖)
    {z : E} (hz : z ∈ ball xStar (min κ (2 / K))) (hfz : f z = 0) : z = xStar := by
  sorry

/-! ## Layer 2: the Newton–Kantorovich theorem -/

/-- 2.1 The Kantorovich radius `t⋆ = (1 - √(1 - 2 b L)) / L`, the smaller root of
`t ↦ L t² / 2 - t + b`. -/
def kantorovichRadius (L b : ℝ) : ℝ :=
  (1 - √(1 - 2 * b * L)) / L

/-- 2.1 The outer radius `t⋆⋆ = (1 + √(1 - 2 b L)) / L`, the larger root of
`t ↦ L t² / 2 - t + b`. -/
def kantorovichOuterRadius (L b : ℝ) : ℝ :=
  (1 + √(1 - 2 * b * L)) / L

/-- 2.1 The Newton–Kantorovich theorem (Ferreira–Svaiter, Theorem 1). Let `f` be continuous on
`C`, with derivative `f'` on the interior of `C`, `x₀` interior, `f'(x₀) = A` invertible,
`‖A⁻¹ (f' y - f' x)‖ ≤ L ‖x - y‖` on `C`, `‖A⁻¹ f(x₀)‖ ≤ b`, `0 < L`, `0 < b`, `2 b L ≤ 1`, and
`B[x₀, t⋆] ⊆ C`. Then the Newton sequence stays in `B(x₀, t⋆)` and converges to a zero `x⋆` of
`f`, which is the only zero of `f` in `B[x₀, t⋆]`, and `‖x⋆ - x_(k+1)‖ ≤ ‖x⋆ - x_k‖ / 2`. -/
theorem newtonKantorovich [CompleteSpace E] [CompleteSpace F] {f : E → F}
    {f' : E → E →L[ℝ] F} {C : Set E} {x₀ : E} {L b : ℝ} (A : E ≃L[ℝ] F)
    (hfc : ContinuousOn f C) (hf : ∀ x ∈ interior C, HasFDerivAt f (f' x) x)
    (hx₀ : x₀ ∈ interior C) (hA : f' x₀ = (A : E →L[ℝ] F))
    (hLip : ∀ x ∈ C, ∀ y ∈ C, ‖(A.symm : F →L[ℝ] E).comp (f' y - f' x)‖ ≤ L * ‖x - y‖)
    (hb : ‖A.symm (f x₀)‖ ≤ b) (hL : 0 < L) (hb0 : 0 < b) (hbL : 2 * b * L ≤ 1)
    (hC : closedBall x₀ (kantorovichRadius L b) ⊆ C) :
    (∀ k, newtonSeq f x₀ k ∈ ball x₀ (kantorovichRadius L b)) ∧
    ∃ xStar ∈ closedBall x₀ (kantorovichRadius L b), f xStar = 0 ∧
      Tendsto (newtonSeq f x₀) atTop (𝓝 xStar) ∧
      (∀ z ∈ closedBall x₀ (kantorovichRadius L b), f z = 0 → z = xStar) ∧
      ∀ k, ‖xStar - newtonSeq f x₀ (k + 1)‖ ≤ ‖xStar - newtonSeq f x₀ k‖ / 2 := by
  sorry

/-- 2.2 The quadratic rate and the wider uniqueness ball (Ferreira–Svaiter, Theorem 1, the case
`2 b L < 1`). Under the hypotheses of 2.1 with `2 b L < 1`, the limit `x⋆` satisfies
`‖x⋆ - x_(k+1)‖ ≤ L / (2 √(1 - 2 b L)) ‖x⋆ - x_k‖²`, and it is the only zero of `f` in `B[x₀, ρ]`
for every `ρ` with `t⋆ ≤ ρ < t⋆⋆` and `B[x₀, ρ] ⊆ C`. -/
theorem newtonKantorovich_quadratic [CompleteSpace E] [CompleteSpace F] {f : E → F}
    {f' : E → E →L[ℝ] F} {C : Set E} {x₀ : E} {L b : ℝ} (A : E ≃L[ℝ] F)
    (hfc : ContinuousOn f C) (hf : ∀ x ∈ interior C, HasFDerivAt f (f' x) x)
    (hx₀ : x₀ ∈ interior C) (hA : f' x₀ = (A : E →L[ℝ] F))
    (hLip : ∀ x ∈ C, ∀ y ∈ C, ‖(A.symm : F →L[ℝ] E).comp (f' y - f' x)‖ ≤ L * ‖x - y‖)
    (hb : ‖A.symm (f x₀)‖ ≤ b) (hL : 0 < L) (hb0 : 0 < b) (hbL : 2 * b * L < 1)
    (hC : closedBall x₀ (kantorovichRadius L b) ⊆ C) :
    ∃ xStar, f xStar = 0 ∧ Tendsto (newtonSeq f x₀) atTop (𝓝 xStar) ∧
      (∀ k, ‖xStar - newtonSeq f x₀ (k + 1)‖ ≤
        L / (2 * √(1 - 2 * b * L)) * ‖xStar - newtonSeq f x₀ k‖ ^ 2) ∧
      ∀ ρ, kantorovichRadius L b ≤ ρ → ρ < kantorovichOuterRadius L b →
        closedBall x₀ ρ ⊆ C → ∀ z ∈ closedBall x₀ ρ, f z = 0 → z = xStar := by
  sorry

/-! ## Layer 3: the BFGS and DFP updates -/

section Updates

variable {ι : Type*} [Fintype ι] [DecidableEq ι]

/-- 3.1 The BFGS update of a Hessian approximation `B` along a step `s` with gradient change `y`:
`B - B s sᵀ B / (sᵀ B s) + y yᵀ / (yᵀ s)`. -/
def bfgsUpdate (B : Matrix ι ι ℝ) (s y : ι → ℝ) : Matrix ι ι ℝ :=
  B - (s ⬝ᵥ (B *ᵥ s))⁻¹ • vecMulVec (B *ᵥ s) (s ᵥ* B) + (y ⬝ᵥ s)⁻¹ • vecMulVec y y

/-- 3.1 The BFGS update of an inverse Hessian approximation `H`:
`(I - ρ s yᵀ) H (I - ρ y sᵀ) + ρ s sᵀ` with `ρ = 1 / (yᵀ s)`. -/
def bfgsInvUpdate (H : Matrix ι ι ℝ) (s y : ι → ℝ) : Matrix ι ι ℝ :=
  (1 - (y ⬝ᵥ s)⁻¹ • vecMulVec s y) * H * (1 - (y ⬝ᵥ s)⁻¹ • vecMulVec y s) +
    (y ⬝ᵥ s)⁻¹ • vecMulVec s s

/-- 3.1 The DFP update of a Hessian approximation `B`:
`(I - ρ y sᵀ) B (I - ρ s yᵀ) + ρ y yᵀ` with `ρ = 1 / (yᵀ s)`. -/
def dfpUpdate (B : Matrix ι ι ℝ) (s y : ι → ℝ) : Matrix ι ι ℝ :=
  (1 - (y ⬝ᵥ s)⁻¹ • vecMulVec y s) * B * (1 - (y ⬝ᵥ s)⁻¹ • vecMulVec s y) +
    (y ⬝ᵥ s)⁻¹ • vecMulVec y y

/-- 3.1 The DFP update of an inverse Hessian approximation `H`:
`H - H y yᵀ H / (yᵀ H y) + s sᵀ / (sᵀ y)`. -/
def dfpInvUpdate (H : Matrix ι ι ℝ) (s y : ι → ℝ) : Matrix ι ι ℝ :=
  H - (y ⬝ᵥ (H *ᵥ y))⁻¹ • vecMulVec (H *ᵥ y) (y ᵥ* H) + (s ⬝ᵥ y)⁻¹ • vecMulVec s s

/-- 3.1 The secant equation for the BFGS update: if `sᵀ y ≠ 0` and `sᵀ B s ≠ 0`, then
`bfgsUpdate B s y` maps `s` to `y`. -/
theorem bfgsUpdate_mulVec (B : Matrix ι ι ℝ) {s y : ι → ℝ} (hsy : s ⬝ᵥ y ≠ 0)
    (hsBs : s ⬝ᵥ (B *ᵥ s) ≠ 0) : bfgsUpdate B s y *ᵥ s = y := by
  sorry

/-- 3.2 Hereditary positive definiteness of BFGS (Dennis–Moré 1977, Theorem 7.8). If `B` is
positive definite and `sᵀ y ≠ 0`, the BFGS update is positive definite iff `0 < sᵀ y`. -/
theorem bfgsUpdate_posDef_iff {B : Matrix ι ι ℝ} (hB : B.PosDef) {s y : ι → ℝ}
    (hsy : s ⬝ᵥ y ≠ 0) : (bfgsUpdate B s y).PosDef ↔ 0 < s ⬝ᵥ y := by
  sorry

/-- 3.2 Hereditary positive definiteness of DFP (Dennis–Moré 1977, Theorem 7.7). If `B` is
positive definite and `sᵀ y ≠ 0`, the DFP update is positive definite iff `0 < sᵀ y`. -/
theorem dfpUpdate_posDef_iff {B : Matrix ι ι ℝ} (hB : B.PosDef) {s y : ι → ℝ}
    (hsy : s ⬝ᵥ y ≠ 0) : (dfpUpdate B s y).PosDef ↔ 0 < s ⬝ᵥ y := by
  sorry

/-- 3.3 The inverse of the BFGS update (Dennis–Moré 1977, Theorem 7.8). If `B` is symmetric and
invertible, `sᵀ y ≠ 0` and `sᵀ B s ≠ 0`, then `(bfgsUpdate B s y)⁻¹ = bfgsInvUpdate B⁻¹ s y`. -/
theorem inv_bfgsUpdate {B : Matrix ι ι ℝ} (hB : B.IsSymm) (hdet : IsUnit B.det) {s y : ι → ℝ}
    (hsy : s ⬝ᵥ y ≠ 0) (hsBs : s ⬝ᵥ (B *ᵥ s) ≠ 0) :
    (bfgsUpdate B s y)⁻¹ = bfgsInvUpdate B⁻¹ s y := by
  sorry

/-- 3.3 The inverse of the DFP update (Dennis–Moré 1977, Theorem 7.7). If `B` is symmetric and
invertible, `sᵀ y ≠ 0` and `yᵀ B⁻¹ y ≠ 0`, then `(dfpUpdate B s y)⁻¹ = dfpInvUpdate B⁻¹ s y`. -/
theorem inv_dfpUpdate {B : Matrix ι ι ℝ} (hB : B.IsSymm) (hdet : IsUnit B.det) {s y : ι → ℝ}
    (hsy : s ⬝ᵥ y ≠ 0) (hyHy : y ⬝ᵥ (B⁻¹ *ᵥ y) ≠ 0) :
    (dfpUpdate B s y)⁻¹ = dfpInvUpdate B⁻¹ s y := by
  sorry

/-- 3.4 The least-change characterization of DFP (Dennis–Moré 1977, Theorem 7.3 with `c = y`).
Let `B` be symmetric and `W` positive definite with `W s = y`. Among the symmetric matrices `X`
with `X s = y`, the DFP update is the unique one minimizing
`trace (W⁻¹ (X - B) W⁻¹ (X - B))`, the square of the Frobenius norm of
`W^(-1/2) (X - B) W^(-1/2)`. -/
theorem dfpUpdate_least_change {B W : Matrix ι ι ℝ} (hB : B.IsSymm) (hW : W.PosDef)
    {s y : ι → ℝ} (hWs : W *ᵥ s = y) :
    (dfpUpdate B s y).IsSymm ∧ dfpUpdate B s y *ᵥ s = y ∧
      ∀ X : Matrix ι ι ℝ, X.IsSymm → X *ᵥ s = y → X ≠ dfpUpdate B s y →
        trace (W⁻¹ * (dfpUpdate B s y - B) * W⁻¹ * (dfpUpdate B s y - B)) <
          trace (W⁻¹ * (X - B) * W⁻¹ * (X - B)) := by
  sorry

end Updates

/-! ## Layer 4: the Dennis–Moré characterization -/

/-- 4.1 The Dennis–Moré characterization of superlinear convergence (Dennis–Moré 1974,
Theorem 2.2). Let `E` be finite-dimensional, `f` Gâteaux differentiable on an open convex `D`
with derivative `f'`, continuous at `x⋆ ∈ D` with `f'(x⋆)` invertible. Let
`x_(k+1) = x_k - B_k⁻¹ f(x_k)` with invertible `B_k`, `x_k ∈ D`, `x_k → x⋆` and `x_k ≠ x⋆`
eventually. Then `x_k → x⋆` superlinearly and `f x⋆ = 0` if and only if
`‖(B_k - f'(x⋆)) s_k‖ / ‖s_k‖ → 0`, where `s_k = x_(k+1) - x_k`. -/
theorem superlinear_iff_dennisMore [FiniteDimensional ℝ E] {f : E → E} {f' : E → E →L[ℝ] E}
    {D : Set E} {xStar : E} {x : ℕ → E} {B : ℕ → E →L[ℝ] E} (hD : IsOpen D)
    (hDc : Convex ℝ D) (hxStar : xStar ∈ D)
    (hf : ∀ z ∈ D, ∀ h : E, HasLineDerivAt ℝ f (f' z h) z h)
    (hcont : ContinuousAt f' xStar) (hinv : (f' xStar).IsInvertible)
    (hB : ∀ k, (B k).IsInvertible) (hx : ∀ k, x (k + 1) = x k - (B k).inverse (f (x k)))
    (hxD : ∀ k, x k ∈ D) (hlim : Tendsto x atTop (𝓝 xStar))
    (hne : ∀ᶠ k in atTop, x k ≠ xStar) :
    (Tendsto (fun k ↦ ‖x (k + 1) - xStar‖ / ‖x k - xStar‖) atTop (𝓝 0) ∧ f xStar = 0) ↔
      Tendsto (fun k ↦ ‖(B k - f' xStar) (x (k + 1) - x k)‖ / ‖x (k + 1) - x k‖) atTop
        (𝓝 0) := by
  sorry

/-! ## Layer 5: quadratic termination -/

section Termination

variable {ι : Type*} [Fintype ι] [DecidableEq ι]

/-- 5.1 The inverse update of Broyden's class with parameter `φ`:
`(1 - φ) • dfpInvUpdate H s y + φ • bfgsInvUpdate H s y`. -/
def broydenInvUpdate (φ : ℝ) (H : Matrix ι ι ℝ) (s y : ι → ℝ) : Matrix ι ι ℝ :=
  (1 - φ) • dfpInvUpdate H s y + φ • bfgsInvUpdate H s y

/-- 5.1 One step on the quadratic `x ↦ xᵀ A x / 2 - bᵀ x` from the pair `(x, H)`: the gradient
`g = A x - b`, the direction `d = H g`, the exact line-search step `s = -((gᵀ d) / (dᵀ A d)) d`,
the new point `x + s` and the new matrix `broydenInvUpdate φ H s (A s)`. -/
def quadraticStep (A : Matrix ι ι ℝ) (b : ι → ℝ) (φ : ℝ)
    (p : (ι → ℝ) × Matrix ι ι ℝ) : (ι → ℝ) × Matrix ι ι ℝ :=
  let g := A *ᵥ p.1 - b
  let d := p.2 *ᵥ g
  let s := -((g ⬝ᵥ d) / (d ⬝ᵥ (A *ᵥ d))) • d
  (p.1 + s, broydenInvUpdate φ p.2 s (A *ᵥ s))

/-- 5.1 The sequence of pairs `(x_k, H_k)` from `(x₀, H₀)`, with parameter `φ k` at step `k`. -/
def quadraticSeq (A : Matrix ι ι ℝ) (b : ι → ℝ) (φ : ℕ → ℝ) (x₀ : ι → ℝ) (H₀ : Matrix ι ι ℝ) :
    ℕ → (ι → ℝ) × Matrix ι ι ℝ
  | 0 => (x₀, H₀)
  | k + 1 => quadraticStep A b (φ k) (quadraticSeq A b φ x₀ H₀ k)

/-- 5.2 Quadratic termination of Broyden's class with exact line searches (Dennis–Moré 1977,
Theorem 8.1). If `A` and `H₀` are positive definite and `0 ≤ φ k` for all `k`, then some
`x_l` with `l ≤ n` is the minimizer `A⁻¹ b`, and if no `x_k` with `k < n` is, then
`H_n = A⁻¹`; here `n` is the dimension. -/
theorem quadraticSeq_terminates {A H₀ : Matrix ι ι ℝ} (hA : A.PosDef) (hH₀ : H₀.PosDef)
    (b : ι → ℝ) (x₀ : ι → ℝ) {φ : ℕ → ℝ} (hφ : ∀ k, 0 ≤ φ k) :
    (∃ l ≤ Fintype.card ι, (quadraticSeq A b φ x₀ H₀ l).1 = A⁻¹ *ᵥ b) ∧
      ((∀ k < Fintype.card ι, (quadraticSeq A b φ x₀ H₀ k).1 ≠ A⁻¹ *ᵥ b) →
        (quadraticSeq A b φ x₀ H₀ (Fintype.card ι)).2 = A⁻¹) := by
  sorry

end Termination

end TauCetiRoadmap.NewtonAndQuasiNewtonMethods
