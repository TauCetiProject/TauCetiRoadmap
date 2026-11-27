import Mathlib

/-!
# Quadrature rules and Peano kernels: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib, each with `sorry`, together with the few definitions
they need; every definition has a real body.

A quadrature rule on `[a, b]` with `k` nodes is a pair of vectors `w x : Fin k → ℝ` (weights and
nodes) acting by `f ↦ ∑ i, w i * f (x i)`; its error is `∫_a^b f − ∑ i, w i * f (x i)`. Derivatives
of a function on `[a, b]` are taken within `[a, b]` (`iteratedDerivWithin`). The composite
trapezoidal rule is Mathlib's `trapezoidal_integral`, whose error `trapezoidal_error` is the rule
minus the integral.
-/

noncomputable section

open Finset MeasureTheory Filter Set Topology Polynomial intervalIntegral
open scoped Nat

namespace TauCetiRoadmap.QuadratureRulesAndPeanoKernels

/-! ## Layer 1: the Peano kernel -/

/-- 1.1 The Peano kernel of order `m` of the rule with weights `w` and nodes `x` on `[a, b]`: the
error `∫_a^b g − ∑ i, w i * g (x i)` of the truncated power `g y = (y − t)ᵐ` for `t < y` and
`g y = 0` for `y ≤ t`. -/
def peanoKernel {k : ℕ} (a b : ℝ) (w x : Fin k → ℝ) (m : ℕ) (t : ℝ) : ℝ :=
  (∫ y in a..b, if t < y then (y - t) ^ m else 0) -
    ∑ i, w i * if t < x i then (x i - t) ^ m else 0

/-- 1.1 The Peano kernel theorem: for `a ≤ b`, a rule with nodes in `[a, b]` that integrates every polynomial
of degree at most `m` exactly has, on functions of class `C^(m+1)` on `[a, b]`, the error
`(1/m!) ∫_a^b K(t) f^(m+1)(t) dt`, with `K` the Peano kernel of order `m`. -/
theorem integral_sub_sum_eq_integral_peanoKernel {k m : ℕ} {a b : ℝ} {w x : Fin k → ℝ}
    {f : ℝ → ℝ} (hab : a ≤ b) (hx : ∀ i, x i ∈ Icc a b)
    (hexact : ∀ p : ℝ[X], p.natDegree ≤ m →
      ∫ y in a..b, p.eval y = ∑ i, w i * p.eval (x i))
    (hf : ContDiffOn ℝ (m + 1) f (Icc a b)) :
    (∫ y in a..b, f y) - ∑ i, w i * f (x i) =
      (∫ t in a..b, peanoKernel a b w x m t * iteratedDerivWithin (m + 1) f (Icc a b) t) /
        m ! := by
  sorry

/-- 1.2 Under the hypotheses of 1.1, if the Peano kernel of order `m` keeps one sign on
`[a, b]`, the error is `E(X^(m+1))/(m+1)! · f^(m+1)(ξ)` for some `ξ ∈ [a, b]`, where
`E(X^(m+1))` is the error of the rule on the monomial of degree `m + 1`. -/
theorem exists_integral_sub_sum_eq_of_peanoKernel_sign {k m : ℕ} {a b : ℝ} {w x : Fin k → ℝ}
    {f : ℝ → ℝ} (hab : a ≤ b) (hx : ∀ i, x i ∈ Icc a b)
    (hexact : ∀ p : ℝ[X], p.natDegree ≤ m →
      ∫ y in a..b, p.eval y = ∑ i, w i * p.eval (x i))
    (hsign : (∀ t ∈ Icc a b, 0 ≤ peanoKernel a b w x m t) ∨
      ∀ t ∈ Icc a b, peanoKernel a b w x m t ≤ 0)
    (hf : ContDiffOn ℝ (m + 1) f (Icc a b)) :
    ∃ ξ ∈ Icc a b, (∫ y in a..b, f y) - ∑ i, w i * f (x i) =
      ((∫ y in a..b, y ^ (m + 1)) - ∑ i, w i * x i ^ (m + 1)) / (m + 1)! *
        iteratedDerivWithin (m + 1) f (Icc a b) ξ := by
  sorry

/-! ## Layer 2: composite rules -/

/-- 2.2 The composite midpoint rule with `n` subintervals of width `h = (b − a)/n`:
`h ∑_{j<n} f(a + (j + 1/2) h)`. -/
def midpointRule (f : ℝ → ℝ) (n : ℕ) (a b : ℝ) : ℝ :=
  (b - a) / n * ∑ j ∈ range n, f (a + (j + 1 / 2) * ((b - a) / n))

/-- 2.3 The composite Simpson rule with `n` panels, that is `2n` subintervals of width
`h = (b − a)/(2n)`: `(h/3) ∑_{j<n} (f(a + 2jh) + 4 f(a + (2j+1)h) + f(a + (2j+2)h))`. -/
def simpsonRule (f : ℝ → ℝ) (n : ℕ) (a b : ℝ) : ℝ :=
  (b - a) / (6 * n) * ∑ j ∈ range n,
    (f (a + 2 * j * ((b - a) / (2 * n))) + 4 * f (a + (2 * j + 1) * ((b - a) / (2 * n))) +
      f (a + (2 * j + 2) * ((b - a) / (2 * n))))

/-- 2.1 The error of the composite trapezoidal rule with `N ≥ 1` subintervals of width
`h = (b − a)/N`, for `f` of class `C²` on `[a, b]`: the rule minus the integral is
`(b − a) h²/12 · f''(ξ)` for some `ξ ∈ [a, b]`. -/
theorem exists_trapezoidal_error_eq {f : ℝ → ℝ} {a b : ℝ} (hab : a ≤ b)
    (hf : ContDiffOn ℝ 2 f (Icc a b)) {N : ℕ} (hN : 0 < N) :
    ∃ ξ ∈ Icc a b, trapezoidal_error f N a b =
      (b - a) * ((b - a) / N) ^ 2 / 12 * iteratedDerivWithin 2 f (Icc a b) ξ := by
  sorry

/-- 2.2 The error of the composite midpoint rule with `n ≥ 1` subintervals of width
`h = (b − a)/n`, for `f` of class `C²` on `[a, b]`: the integral minus the rule is
`(b − a) h²/24 · f''(ξ)` for some `ξ ∈ [a, b]`. -/
theorem exists_integral_sub_midpointRule_eq {f : ℝ → ℝ} {a b : ℝ} (hab : a ≤ b)
    (hf : ContDiffOn ℝ 2 f (Icc a b)) {n : ℕ} (hn : 0 < n) :
    ∃ ξ ∈ Icc a b, (∫ y in a..b, f y) - midpointRule f n a b =
      (b - a) * ((b - a) / n) ^ 2 / 24 * iteratedDerivWithin 2 f (Icc a b) ξ := by
  sorry

/-- 2.3 The error of the composite Simpson rule with `n ≥ 1` panels and `h = (b − a)/(2n)`, for
`f` of class `C⁴` on `[a, b]`: the integral minus the rule is `−(b − a) h⁴/180 · f⁽⁴⁾(ξ)` for some
`ξ ∈ [a, b]`. -/
theorem exists_integral_sub_simpsonRule_eq {f : ℝ → ℝ} {a b : ℝ} (hab : a ≤ b)
    (hf : ContDiffOn ℝ 4 f (Icc a b)) {n : ℕ} (hn : 0 < n) :
    ∃ ξ ∈ Icc a b, (∫ y in a..b, f y) - simpsonRule f n a b =
      -((b - a) * ((b - a) / (2 * n)) ^ 4 / 180 * iteratedDerivWithin 4 f (Icc a b) ξ) := by
  sorry

/-- 2.4 Halving the step, for `n ≥ 1`: the trapezoidal rule with `2n` subintervals is the mean of
the trapezoidal and midpoint rules with `n`, and one Richardson step `(4 T_{2n} − T_n)/3` is the
Simpson rule with `n` panels. -/
theorem trapezoidal_two_mul_and_richardson (f : ℝ → ℝ) {n : ℕ} (hn : 0 < n) (a b : ℝ) :
    trapezoidal_integral f (2 * n) a b =
        (trapezoidal_integral f n a b + midpointRule f n a b) / 2 ∧
      (4 * trapezoidal_integral f (2 * n) a b - trapezoidal_integral f n a b) / 3 =
        simpsonRule f n a b := by
  sorry

/-! ## Layer 3: closed Newton–Cotes rules -/

/-- 3.1 The weight of node `i/n` in the closed Newton–Cotes rule with `n + 1` equally spaced nodes
`0, 1/n, …, 1` on `[0, 1]`: the integral over `[0, 1]` of the Lagrange basis polynomial of that
node. -/
def newtonCotesWeight (n : ℕ) (i : Fin (n + 1)) : ℝ :=
  ∫ y in (0 : ℝ)..1, (Lagrange.basis Finset.univ (fun j : Fin (n + 1) => (j : ℝ) / n) i).eval y

/-- 3.1 The closed Newton–Cotes rule with `n + 1 ≥ 2` nodes integrates every polynomial of degree
at most `n` exactly over `[0, 1]`, and every polynomial of degree at most `n + 1` when `n` is
even. -/
theorem integral_eq_sum_newtonCotesWeight {n : ℕ} (hn : 0 < n) :
    (∀ p : ℝ[X], p.natDegree ≤ n →
      ∫ y in (0 : ℝ)..1, p.eval y = ∑ i, newtonCotesWeight n i * p.eval ((i : ℝ) / n)) ∧
    (Even n → ∀ p : ℝ[X], p.natDegree ≤ n + 1 →
      ∫ y in (0 : ℝ)..1, p.eval y = ∑ i, newtonCotesWeight n i * p.eval ((i : ℝ) / n)) := by
  sorry

/-- 3.2 The weights of the closed Newton–Cotes rules with `2, …, 8` and `10` nodes are positive;
the rule with `9` nodes has the weights
`(989, 5888, −928, 10496, −4540, 10496, −928, 5888, 989)/28350`, three of them negative, and the
rule with `11` nodes has the negative weight `−48525/598752` at the node `2/10`. -/
theorem newtonCotesWeight_pos_and_eight :
    (∀ n ∈ ({1, 2, 3, 4, 5, 6, 7, 9} : Finset ℕ), ∀ i, 0 < newtonCotesWeight n i) ∧
    (∀ i, newtonCotesWeight 8 i =
      (![989, 5888, -928, 10496, -4540, 10496, -928, 5888, 989] : Fin 9 → ℝ) i / 28350) ∧
    newtonCotesWeight 10 2 = -48525 / 598752 := by
  sorry

/-! ## Layer 4: convergence for continuous integrands -/

/-- 4.1 A sequence of rules on `[a, b]`, each with distinct nodes in `[a, b]`, converges to the
integral for every function continuous on `[a, b]` if and only if it converges for every
polynomial and the sums `∑ i, |w n i|` are bounded. -/
theorem tendsto_rule_iff {a b : ℝ} {k : ℕ → ℕ} {w x : (n : ℕ) → Fin (k n) → ℝ}
    (hx : ∀ n i, x n i ∈ Icc a b) (hinj : ∀ n, Function.Injective (x n)) :
    (∀ f : ℝ → ℝ, ContinuousOn f (Icc a b) →
      Tendsto (fun n => ∑ i, w n i * f (x n i)) atTop (𝓝 (∫ y in a..b, f y))) ↔
    ((∀ p : ℝ[X],
      Tendsto (fun n => ∑ i, w n i * p.eval (x n i)) atTop (𝓝 (∫ y in a..b, p.eval y))) ∧
      ∃ C, ∀ n, ∑ i, |w n i| ≤ C) := by
  sorry

/-! ## Layer 5: the trapezoidal rule for periodic integrands -/

/-- 5.1 If `f` is of class `C^(2m)` on `[a, b]`, `m ≥ 1`, and its derivatives of the odd orders
`1, 3, …, 2m − 1` take equal values at `a` and `b`, the composite trapezoidal rule with `N ≥ 1`
subintervals of width `h` has error at most `|B_(2m)|/(2m)! · h^(2m) ∫_a^b |f^(2m)|`. -/
theorem abs_trapezoidal_error_le_of_odd_deriv_eq {f : ℝ → ℝ} {a b : ℝ} (hab : a ≤ b) {m : ℕ}
    (hm : 0 < m) (hf : ContDiffOn ℝ (2 * m) f (Icc a b))
    (hodd : ∀ j ∈ Finset.Icc 1 m, iteratedDerivWithin (2 * j - 1) f (Icc a b) a =
      iteratedDerivWithin (2 * j - 1) f (Icc a b) b)
    {N : ℕ} (hN : 0 < N) :
    |trapezoidal_error f N a b| ≤
      |(bernoulli (2 * m) : ℝ)| / (2 * m)! * ((b - a) / N) ^ (2 * m) *
        ∫ y in a..b, |iteratedDerivWithin (2 * m) f (Icc a b) y| := by
  sorry

/-- 5.2 If `f` is holomorphic, `2π`-periodic and bounded by `M` in the strip `|Im z| < a`, then
for every `N ≥ 1` the `N`-point trapezoidal rule on `[0, 2π]` has error at most
`4πM/(e^(aN) − 1)`. -/
theorem norm_trapezoid_sub_integral_le_of_strip {f : ℂ → ℂ} {a M : ℝ} (ha : 0 < a)
    (hf : DifferentiableOn ℂ f {z | |z.im| < a})
    (hper : ∀ z : ℂ, |z.im| < a → f (z + 2 * Real.pi) = f z)
    (hM : ∀ z : ℂ, |z.im| < a → ‖f z‖ ≤ M) {N : ℕ} (hN : 0 < N) :
    ‖(2 * Real.pi / N : ℂ) * ∑ j ∈ range N, f (2 * Real.pi * j / N) -
        ∫ y in (0 : ℝ)..2 * Real.pi, f y‖ ≤
      4 * Real.pi * M / (Real.exp (a * N) - 1) := by
  sorry

end TauCetiRoadmap.QuadratureRulesAndPeanoKernels
