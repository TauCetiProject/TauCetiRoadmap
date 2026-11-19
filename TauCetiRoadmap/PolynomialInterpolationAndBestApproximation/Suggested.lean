import Mathlib

/-!
# Polynomial interpolation and best approximation: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib, each with `sorry`, together with the few definitions
they need; every definition has a real body. Every headline theorem of the README is statable at
the pins and is stated here. The README's remaining Checks and proof routes are not restated.

Interpolation uses Mathlib's `Lagrange.interpolate` on a finite set of nodes `s` with an injective
labelling `v`. Uniform approximation takes place in `C(Set.Icc a b, ℝ)` with its supremum norm;
a real polynomial `p` acts there as `p.toContinuousMapOn (Set.Icc a b)`, and the error of best
approximation by polynomials of degree at most `n` is the distance `Metric.infDist` to the set of
such functions. Sets of reals whose supremum is taken are bounded in every statement that uses
them.
-/

noncomputable section

open Polynomial Set Real

namespace TauCetiRoadmap.PolynomialInterpolationAndBestApproximation

/-! ## Layer 1: the interpolation error -/

/-- 1.1 The interpolation error formula (Cauchy). If `f` is `N` times continuously differentiable
on `[a, b]`, where `N` is the number of nodes, the nodes are distinct points of `[a, b]` and
`x ∈ [a, b]`, there is `ξ ∈ [a, b]` with
`f x - p x = f⁽ᴺ⁾(ξ) / N! * ∏ᵢ (x - xᵢ)`, `p` the interpolating polynomial of degree `< N`. -/
theorem exists_sub_eval_interpolate_eq {ι : Type*} [DecidableEq ι] {s : Finset ι} {v : ι → ℝ}
    (hv : Set.InjOn v s) {a b : ℝ} (hvab : ∀ i ∈ s, v i ∈ Icc a b) {f : ℝ → ℝ}
    (hf : ContDiffOn ℝ s.card f (Icc a b)) {x : ℝ} (hx : x ∈ Icc a b) :
    ∃ ξ ∈ Icc a b, f x - (Lagrange.interpolate s v (fun i => f (v i))).eval x =
      iteratedDerivWithin s.card f (Icc a b) ξ / (s.card.factorial : ℝ) * ∏ i ∈ s, (x - v i) := by
  sorry

/-- 1.2 The Chebyshev points of the first kind: `chebyshevRoot n i = cos ((2i + 1)π / (2n))`;
for `i < n` these are the `n` zeros of `T n`. -/
def chebyshevRoot (n i : ℕ) : ℝ :=
  Real.cos ((2 * i + 1) * π / (2 * n))

/-- 1.2 The node polynomial of the `n + 1` Chebyshev points is `T (n + 1) / 2 ^ n`. -/
theorem nodal_chebyshevRoot (n : ℕ) :
    Lagrange.nodal (Finset.range (n + 1)) (chebyshevRoot (n + 1)) =
      C ((2 : ℝ) ^ n)⁻¹ * Chebyshev.T ℝ ((n : ℤ) + 1) := by
  sorry

/-- 1.3 Interpolation at the Chebyshev points. If `f` is `n + 1` times continuously
differentiable on `[-1, 1]` and `|f⁽ⁿ⁺¹⁾| ≤ M` there, the interpolating polynomial at the `n + 1`
Chebyshev points differs from `f` by at most `M / (2 ^ n (n + 1)!)` on `[-1, 1]`. -/
theorem abs_sub_eval_interpolate_chebyshevRoot_le (n : ℕ) {f : ℝ → ℝ}
    (hf : ContDiffOn ℝ (n + 1) f (Icc (-1) 1)) {M : ℝ}
    (hM : ∀ y ∈ Icc (-1 : ℝ) 1, |iteratedDerivWithin (n + 1) f (Icc (-1) 1) y| ≤ M)
    {x : ℝ} (hx : x ∈ Icc (-1 : ℝ) 1) :
    |f x - (Lagrange.interpolate (Finset.range (n + 1)) (chebyshevRoot (n + 1))
        (fun i => f (chebyshevRoot (n + 1) i))).eval x| ≤
      M / (2 ^ n * ((n + 1).factorial : ℝ)) := by
  sorry

/-! ## Layer 2: best uniform approximation -/

/-- 2.1 The polynomials of degree at most `n`, as continuous functions on `[a, b]`. -/
def polyDegLE (a b : ℝ) (n : ℕ) : Set C(Icc a b, ℝ) :=
  {g | ∃ p : ℝ[X], p.natDegree ≤ n ∧ p.toContinuousMapOn (Icc a b) = g}

/-- 2.1 The error `Eₙ(f)` of best uniform approximation of `f` on `[a, b]` by polynomials of
degree at most `n`: the distance in the supremum norm from `f` to `polyDegLE a b n`. -/
def bestApproxError (a b : ℝ) (n : ℕ) (f : C(Icc a b, ℝ)) : ℝ :=
  Metric.infDist f (polyDegLE a b n)

/-- 2.2 de la Vallée-Poussin's lower bound. If `p` has degree at most `n` and `f - p` takes
values of alternating sign at `n + 2` increasing points of `[a, b]`, then `Eₙ(f)` is at least
the least of the `|f(xᵢ) - p(xᵢ)|`. -/
theorem inf'_abs_le_bestApproxError {a b : ℝ} {n : ℕ} (f : C(Icc a b, ℝ)) {p : ℝ[X]}
    (hp : p.natDegree ≤ n) (x : Fin (n + 2) → Icc a b) (hx : StrictMono x)
    (hsign : ∀ i : Fin (n + 1),
      (f (x i.castSucc) - p.eval (x i.castSucc : ℝ)) * (f (x i.succ) - p.eval (x i.succ : ℝ)) < 0) :
    Finset.univ.inf' Finset.univ_nonempty (fun i => |f (x i) - p.eval (x i : ℝ)|) ≤
      bestApproxError a b n f := by
  sorry

/-- 2.3 Chebyshev's alternation theorem. For `a < b`, a polynomial `p` of degree at most `n` is
a best uniform approximation of `f` exactly when there are `n + 2` increasing points of
`[a, b]` at which `f - p` takes the values `σ (-1)ⁱ ‖f - p‖` for a sign `σ = ±1`. -/
theorem norm_sub_eq_bestApproxError_iff {a b : ℝ} (hab : a < b) {n : ℕ} (f : C(Icc a b, ℝ))
    {p : ℝ[X]} (hp : p.natDegree ≤ n) :
    ‖f - p.toContinuousMapOn (Icc a b)‖ = bestApproxError a b n f ↔
      ∃ x : Fin (n + 2) → Icc a b, StrictMono x ∧ ∃ σ : ℝ, (σ = 1 ∨ σ = -1) ∧
        ∀ i, f (x i) - p.eval (x i : ℝ) =
          σ * (-1) ^ (i : ℕ) * ‖f - p.toContinuousMapOn (Icc a b)‖ := by
  sorry

/-- 2.4 Existence and uniqueness of the polynomial of best uniform approximation: for `a < b`
there is exactly one real polynomial of degree at most `n` whose distance to `f` is `Eₙ(f)`. -/
theorem existsUnique_bestApprox {a b : ℝ} (hab : a < b) (n : ℕ) (f : C(Icc a b, ℝ)) :
    ∃! p : ℝ[X], p.natDegree ≤ n ∧
      ‖f - p.toContinuousMapOn (Icc a b)‖ = bestApproxError a b n f := by
  sorry

/-! ## Layer 3: Lebesgue functions and constants -/

/-- 3.1 The Lebesgue function of the nodes: `x ↦ ∑ᵢ |ℓᵢ(x)|`, `ℓᵢ` the Lagrange basis
polynomials. -/
def lebesgueFunction {ι : Type*} [DecidableEq ι] (s : Finset ι) (v : ι → ℝ) (x : ℝ) : ℝ :=
  ∑ i ∈ s, |(Lagrange.basis s v i).eval x|

/-- 3.1 The Lebesgue constant on `[a, b]`: the supremum of the Lebesgue function over `[a, b]`
(a continuous function on a compact set, so the supremum is a maximum when `a ≤ b`). -/
def lebesgueConstant {ι : Type*} [DecidableEq ι] (a b : ℝ) (s : Finset ι) (v : ι → ℝ) : ℝ :=
  sSup (lebesgueFunction s v '' Icc a b)

/-- 3.2 Lebesgue's inequality: interpolation at `n + 1` distinct nodes of `[a, b]` is within the
factor `1 + Λ` of best approximation, `‖f - p‖ ≤ (1 + Λ) Eₙ(f)`. -/
theorem norm_sub_interpolate_le {a b : ℝ} {ι : Type*} [DecidableEq ι] {s : Finset ι} {n : ℕ}
    (hs : s.card = n + 1) {v : ι → Icc a b} (hv : Set.InjOn (fun i => (v i : ℝ)) s)
    (f : C(Icc a b, ℝ)) :
    ‖f - (Lagrange.interpolate s (fun i => (v i : ℝ)) (fun i => f (v i))).toContinuousMapOn
        (Icc a b)‖ ≤
      (1 + lebesgueConstant a b s (fun i => (v i : ℝ))) * bestApproxError a b n f := by
  sorry

/-- 3.3 The Lebesgue constant of the `n` Chebyshev points on `[-1, 1]` is at most
`(2/π) log n + 3`. -/
theorem lebesgueConstant_chebyshevRoot_le (n : ℕ) :
    lebesgueConstant (-1) 1 (Finset.range n) (chebyshevRoot n) ≤ 2 / π * Real.log n + 3 := by
  sorry

/-! ## Layer 4: inequalities of Bernstein and Markov -/

/-- 4.1 The real trigonometric polynomial `θ ↦ ∑_{k ≤ n} (a k cos kθ + b k sin kθ)` of degree at
most `n`. -/
def trigPoly (n : ℕ) (a b : ℕ → ℝ) (θ : ℝ) : ℝ :=
  ∑ k ∈ Finset.range (n + 1), (a k * Real.cos (k * θ) + b k * Real.sin (k * θ))

/-- 4.1 Bernstein's inequality for trigonometric polynomials: if `|t| ≤ M` on `ℝ` and `t` has
degree at most `n`, then `|t'| ≤ n M` on `ℝ`. -/
theorem abs_deriv_trigPoly_le (n : ℕ) (a b : ℕ → ℝ) {M : ℝ}
    (hM : ∀ θ, |trigPoly n a b θ| ≤ M) (θ : ℝ) :
    |deriv (trigPoly n a b) θ| ≤ n * M := by
  sorry

/-- 4.2 Bernstein's inequality for algebraic polynomials: if `p` has degree at most `n` and
`|p| ≤ M` on `[-1, 1]`, then `√(1 - x²) |p'(x)| ≤ n M` for `x ∈ [-1, 1]`. -/
theorem sqrt_one_sub_sq_mul_abs_derivative_le {n : ℕ} {p : ℝ[X]} (hp : p.natDegree ≤ n) {M : ℝ}
    (hM : ∀ x ∈ Icc (-1 : ℝ) 1, |p.eval x| ≤ M) {x : ℝ} (hx : x ∈ Icc (-1 : ℝ) 1) :
    √(1 - x ^ 2) * |p.derivative.eval x| ≤ n * M := by
  sorry

/-- 4.3 Markov's inequality: if `p` has degree at most `n` and `|p| ≤ M` on `[-1, 1]`, then
`|p'| ≤ n² M` on `[-1, 1]`. -/
theorem abs_derivative_le_sq_mul {n : ℕ} {p : ℝ[X]} (hp : p.natDegree ≤ n) {M : ℝ}
    (hM : ∀ x ∈ Icc (-1 : ℝ) 1, |p.eval x| ≤ M) {x : ℝ} (hx : x ∈ Icc (-1 : ℝ) 1) :
    |p.derivative.eval x| ≤ (n : ℝ) ^ 2 * M := by
  sorry

/-! ## Layer 5: moduli of continuity, Jackson's theorem and Bernstein polynomials -/

/-- 5.1 The modulus of continuity `ω(f, δ)`: the supremum of `|f x - f y|` over pairs at
distance at most `δ`. It is used for continuous functions on compact spaces, where this set of
reals is bounded. -/
def modulusOfContinuity {X : Type*} [PseudoMetricSpace X] (f : X → ℝ) (δ : ℝ) : ℝ :=
  sSup {d | ∃ x y, dist x y ≤ δ ∧ d = |f x - f y|}

/-- 5.1 The scaling inequality for the modulus of continuity on an interval:
`ω(f, λδ) ≤ (1 + λ) ω(f, δ)` for `λ ≥ 0`. -/
theorem modulusOfContinuity_mul_le {a b : ℝ} (f : C(Icc a b, ℝ)) {δ l : ℝ} (hl : 0 ≤ l) :
    modulusOfContinuity f (l * δ) ≤ (1 + l) * modulusOfContinuity f δ := by
  sorry

/-- 5.2 Jackson's theorem: for `n ≥ 1` and `f` continuous on `[a, b]`,
`Eₙ(f) ≤ 6 ω(f, (b - a) / (2n))`. -/
theorem bestApproxError_le_modulusOfContinuity {a b : ℝ} (f : C(Icc a b, ℝ)) {n : ℕ}
    (hn : 1 ≤ n) :
    bestApproxError a b n f ≤ 6 * modulusOfContinuity f ((b - a) / (2 * n)) := by
  sorry

/-- 5.3 The rate of the Bernstein polynomials (Popoviciu): for `n ≥ 1` and `f` continuous on
`[0, 1]`, `‖Bₙ f - f‖ ≤ (3/2) ω(f, 1/√n)`. -/
theorem norm_bernsteinApproximation_sub_le (f : C(unitInterval, ℝ)) {n : ℕ} (hn : 1 ≤ n) :
    ‖bernsteinApproximation n f - f‖ ≤ 3 / 2 * modulusOfContinuity f (1 / √n) := by
  sorry

end TauCetiRoadmap.PolynomialInterpolationAndBestApproximation
