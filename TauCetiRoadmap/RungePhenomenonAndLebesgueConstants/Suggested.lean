import Mathlib

/-!
# Runge's phenomenon and Lebesgue constants: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
results against the pinned Mathlib, with the few definitions they need, every theorem with `sorry`
and every definition with a real body. Every headline theorem of the README is statable at the
pins and is stated here.

Interpolation uses Mathlib's `Lagrange.interpolate` on a finite set of nodes `s` with a labelling
`v` injective on `s`. The Chebyshev points, the Lebesgue function and the Lebesgue constant are
copied verbatim from the roadmap PolynomialInterpolationAndBestApproximation. Derivatives of a
function on `[a, b]` are taken within `[a, b]` (`iteratedDerivWithin`).
-/

noncomputable section

open Polynomial Set Real

namespace TauCetiRoadmap.RungePhenomenonAndLebesgueConstants

/-! ## Layer 1: Rolle's theorem with multiplicities and the Hermite error -/

/-- 1.1 Rolle's theorem with multiplicities. If `g` is `N` times continuously differentiable on
`[a, b]` and has zeros at distinct points `z i` of `[a, b]` of multiplicities `μ i` (the
derivatives within `[a, b]` of order `k < μ i` vanish at `z i`) with `∑ μ i = N + 1`, then the
`N`-th derivative within `[a, b]` vanishes somewhere in `[a, b]`. -/
theorem exists_iteratedDerivWithin_eq_zero {a b : ℝ} {N : ℕ} {g : ℝ → ℝ}
    (hg : ContDiffOn ℝ N g (Icc a b)) {ι : Type*} {s : Finset ι} {z : ι → ℝ}
    (hz : Set.InjOn z s) (hzab : ∀ i ∈ s, z i ∈ Icc a b) (μ : ι → ℕ)
    (hμ : ∑ i ∈ s, μ i = N + 1)
    (hzero : ∀ i ∈ s, ∀ k < μ i, iteratedDerivWithin k g (Icc a b) (z i) = 0) :
    ∃ ξ ∈ Icc a b, iteratedDerivWithin N g (Icc a b) ξ = 0 := by
  sorry

/-- 1.2 The Hermite interpolation error. Let `N = ∑ m i`, let `f` be `N` times continuously
differentiable on `[a, b]`, and let `p` be a polynomial of degree `< N` whose derivatives of order
`k < m i` agree with those of `f` (within `[a, b]`) at the distinct nodes `v i ∈ [a, b]`. Then for
every `x ∈ [a, b]` there is `ξ ∈ [a, b]` with
`f x - p x = f⁽ᴺ⁾(ξ) / N! * ∏ᵢ (x - v i) ^ m i`. -/
theorem exists_sub_eval_eq_hermite {ι : Type*} {s : Finset ι} {v : ι → ℝ}
    (hv : Set.InjOn v s) (m : ι → ℕ) {a b : ℝ} (hvab : ∀ i ∈ s, v i ∈ Icc a b) {f : ℝ → ℝ}
    (hf : ContDiffOn ℝ (∑ i ∈ s, m i) f (Icc a b)) {p : ℝ[X]}
    (hp : p.degree < ((∑ i ∈ s, m i : ℕ) : WithBot ℕ))
    (hfit : ∀ i ∈ s, ∀ k < m i,
      iteratedDerivWithin k f (Icc a b) (v i) = (derivative^[k] p).eval (v i))
    {x : ℝ} (hx : x ∈ Icc a b) :
    ∃ ξ ∈ Icc a b, f x - p.eval x =
      iteratedDerivWithin (∑ i ∈ s, m i) f (Icc a b) ξ / ((∑ i ∈ s, m i).factorial : ℝ) *
        ∏ i ∈ s, (x - v i) ^ m i := by
  sorry

/-! ## Layer 2: Lebesgue constants -/

/-- 2.1 The Lebesgue function of the nodes, `x ↦ ∑ᵢ |ℓᵢ(x)|` with `ℓᵢ` the Lagrange basis
polynomials (copied verbatim from PolynomialInterpolationAndBestApproximation 3.1). -/
def lebesgueFunction {ι : Type*} [DecidableEq ι] (s : Finset ι) (v : ι → ℝ) (x : ℝ) : ℝ :=
  ∑ i ∈ s, |(Lagrange.basis s v i).eval x|

/-- 2.1 The Lebesgue constant on `[a, b]`, the supremum of the Lebesgue function over `[a, b]`
(copied verbatim from PolynomialInterpolationAndBestApproximation 3.1). -/
def lebesgueConstant {ι : Type*} [DecidableEq ι] (a b : ℝ) (s : Finset ι) (v : ι → ℝ) : ℝ :=
  sSup (lebesgueFunction s v '' Icc a b)

/-- 2.1 The Lebesgue constant is the norm of the interpolation operator on `C([a, b], ℝ)`:
interpolation at nodes of `[a, b]` multiplies sup norms by at most `Λ`, and some `f`
with `‖f‖ ≤ 1` has an interpolant of norm exactly `Λ`. -/
theorem norm_interpolate_le_and_exists_eq {a b : ℝ} {ι : Type*} [DecidableEq ι]
    (s : Finset ι) (v : ι → Icc a b) :
    (∀ f : C(Icc a b, ℝ),
      ‖(Lagrange.interpolate s (fun i => (v i : ℝ)) (fun i => f (v i))).toContinuousMapOn
          (Icc a b)‖ ≤ lebesgueConstant a b s (fun i => (v i : ℝ)) * ‖f‖) ∧
    ∃ f : C(Icc a b, ℝ), ‖f‖ ≤ 1 ∧
      ‖(Lagrange.interpolate s (fun i => (v i : ℝ)) (fun i => f (v i))).toContinuousMapOn
          (Icc a b)‖ = lebesgueConstant a b s (fun i => (v i : ℝ)) := by
  sorry

/-- 2.2 The equally spaced points `-1 + 2 j / n` of `[-1, 1]`; for `j ≤ n` these are the
`n + 1` nodes of step `2 / n` from `-1` to `1` when `n ≥ 1`. -/
def equispacedNode (n j : ℕ) : ℝ :=
  -1 + 2 * j / n

/-- 2.2 Exponential growth of the Lebesgue constants of equally spaced points: for `n ≥ 1` and
the `n + 1` equally spaced points of `[-1, 1]`, `2 ^ (n - 2) / n ^ 2 < Λ`, written
`2 ^ n / (4 n ^ 2) < Λ`. -/
theorem lt_lebesgueConstant_equispacedNode {n : ℕ} (hn : 1 ≤ n) :
    (2 : ℝ) ^ n / (4 * n ^ 2) <
      lebesgueConstant (-1) 1 (Finset.range (n + 1)) (equispacedNode n) := by
  sorry

/-- 2.3 For `n ≥ 1` the Lebesgue constant of the `n + 1` equally spaced points of `[-1, 1]` is at
most `2 ^ n`. -/
theorem lebesgueConstant_equispacedNode_le {n : ℕ} (hn : 1 ≤ n) :
    lebesgueConstant (-1) 1 (Finset.range (n + 1)) (equispacedNode n) ≤ 2 ^ n := by
  sorry

/-- 2.4 The Chebyshev points of the first kind, `cos ((2 i + 1) π / (2 n))`
(copied verbatim from PolynomialInterpolationAndBestApproximation 1.2). -/
def chebyshevRoot (n i : ℕ) : ℝ :=
  Real.cos ((2 * i + 1) * π / (2 * n))

/-- 2.4 For `n ≥ 1` the Lebesgue function of the `n` Chebyshev points at `x = 1` is
`(1 / n) ∑_{i < n} cot ((2 i + 1) π / (4 n))`. -/
theorem lebesgueFunction_chebyshevRoot_one {n : ℕ} (hn : 1 ≤ n) :
    lebesgueFunction (Finset.range n) (chebyshevRoot n) 1 =
      (∑ i ∈ Finset.range n, Real.cot ((2 * i + 1) * π / (4 * n))) / n := by
  sorry

/-- 2.5 For `n ≥ 1` the Lebesgue constant of the `n` Chebyshev points on `[-1, 1]` is at least
`(2 / π) log n`. -/
theorem two_div_pi_mul_log_le_lebesgueConstant_chebyshevRoot {n : ℕ} (hn : 1 ≤ n) :
    2 / π * Real.log n ≤ lebesgueConstant (-1) 1 (Finset.range n) (chebyshevRoot n) := by
  sorry

/-! ## Layer 3: the Runge example -/

/-- 3.1 Interpolation of the Cauchy kernel. Over a field, for nodes distinct on `s` and a point
`z` that is not a node, the interpolant `p` of `x ↦ 1 / (x - z)` satisfies
`(X - z) p = 1 - ω / ω(z)`, where `ω` is the node polynomial. -/
theorem X_sub_C_mul_interpolate_inv_sub {K : Type*} [Field K] {ι : Type*} [DecidableEq ι]
    {s : Finset ι} {v : ι → K} (hv : Set.InjOn v s) {z : K} (hz : ∀ i ∈ s, v i ≠ z) :
    (X - C z) * Lagrange.interpolate s v (fun i => (v i - z)⁻¹) =
      1 - C ((Lagrange.nodal s v).eval z)⁻¹ * Lagrange.nodal s v := by
  sorry

/-- 3.2 Runge's function `1 / (1 + 25 x ^ 2)`. -/
def rungeFunction (x : ℝ) : ℝ :=
  1 / (1 + 25 * x ^ 2)

/-- 3.2 Divergence of equally spaced interpolation for Runge's function: for `n ≥ 1`, at the
midpoint `1 - 1 / n` of the last subinterval, the interpolant at the `n + 1` equally spaced points
errs by at least `(7 / 5) ^ n / (1352 n ^ 2)`. -/
theorem pow_div_le_abs_rungeFunction_sub_interpolate_equispaced {n : ℕ} (hn : 1 ≤ n) :
    (7 / 5 : ℝ) ^ n / (1352 * n ^ 2) ≤
      |rungeFunction (1 - 1 / (n : ℝ)) -
        (Lagrange.interpolate (Finset.range (n + 1)) (equispacedNode n)
          (fun j => rungeFunction (equispacedNode n j))).eval (1 - 1 / (n : ℝ))| := by
  sorry

/-- 3.3 Convergence of Chebyshev interpolation for Runge's function: on `[-1, 1]` the
interpolant at the `n + 1` Chebyshev points errs by at most
`1 / sinh ((n + 1) arsinh (1 / 5))`. -/
theorem abs_rungeFunction_sub_interpolate_chebyshevRoot_le (n : ℕ) {x : ℝ}
    (hx : x ∈ Icc (-1 : ℝ) 1) :
    |rungeFunction x -
        (Lagrange.interpolate (Finset.range (n + 1)) (chebyshevRoot (n + 1))
          (fun i => rungeFunction (chebyshevRoot (n + 1) i))).eval x| ≤
      1 / Real.sinh ((n + 1) * Real.arsinh (1 / 5)) := by
  sorry

end TauCetiRoadmap.RungePhenomenonAndLebesgueConstants
