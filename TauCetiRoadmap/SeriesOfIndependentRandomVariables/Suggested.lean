import Mathlib
import TauCeti.Probability.Distributions.Rademacher.Basic

/-!
# Series of independent random variables: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the
three definitions they need; every definition has a real body. Every headline theorem of the
README is statable at the pins and is stated here. The README's API lists and Checks are not
restated.

Random variables are real valued, `X : ℕ → Ω → ℝ`, on a probability space `(Ω, μ)`; independence
is Mathlib's `iIndepFun`. The `n`-th partial sum is `∑ i ∈ range n, X i ω`, so that the empty sum
is `0`. Convergence of a random series at `ω` means convergence of its partial sums, written as
`∃ l, Tendsto (fun n ↦ partialSum X n ω) atTop (𝓝 l)`: Mathlib's `Summable` is unconditional
summation and is used only for series of nonnegative numbers, where the two notions agree.
Variances are Mathlib's `variance`, which is `0` for a variable that is not square integrable, so
every statement that sums variances of unbounded variables assumes `MemLp _ 2`.
-/

noncomputable section

open MeasureTheory ProbabilityTheory Filter Finset Topology

namespace TauCetiRoadmap.SeriesOfIndependentRandomVariables

variable {Ω : Type*} [MeasurableSpace Ω] {μ : Measure Ω} [IsProbabilityMeasure μ]

/-! ## Layer 1: Kronecker's lemma -/

/-- 1.1 Kronecker's lemma: if `b` is monotone and tends to infinity and the series
`∑ x i / b i` converges, then `(x 0 + ⋯ + x (n - 1)) / b n → 0`. -/
theorem tendsto_sum_div_of_tendsto_sum_div {x b : ℕ → ℝ} (hb : Monotone b)
    (hb_top : Tendsto b atTop atTop) {s : ℝ}
    (hs : Tendsto (fun n ↦ ∑ i ∈ range n, x i / b i) atTop (𝓝 s)) :
    Tendsto (fun n ↦ (∑ i ∈ range n, x i) / b n) atTop (𝓝 0) := by
  sorry

/-! ## Layer 2: maximal inequalities -/

/-- 2.1 The `n`-th partial sum `X 0 ω + ⋯ + X (n - 1) ω`; it is `0` for `n = 0`. -/
def partialSum (X : ℕ → Ω → ℝ) (n : ℕ) (ω : Ω) : ℝ :=
  ∑ i ∈ range n, X i ω

/-- 2.1 The Lévy–Ottaviani inequality: for independent `X i` and real `a`, `c`, if
`c ≤ P(|S n - S k| ≤ a)` for every `1 ≤ k ≤ n`, then
`c · P(max_{1 ≤ k ≤ n} |S k| > 2a) ≤ P(|S n| > a)`. -/
theorem levy_ottaviani (X : ℕ → Ω → ℝ) (hX : ∀ i, Measurable (X i)) (hind : iIndepFun X μ)
    (n : ℕ) (a c : ℝ)
    (hc : ∀ k ∈ Icc 1 n, c ≤ μ.real {ω | |partialSum X n ω - partialSum X k ω| ≤ a}) :
    c * μ.real {ω | ∃ k ∈ Icc 1 n, 2 * a < |partialSum X k ω|} ≤
      μ.real {ω | a < |partialSum X n ω|} := by
  sorry

/-- 2.2 Lévy's inequalities for symmetric summands: if the `X i` are independent and each has the
law of its negative, then `P(max_{1 ≤ k ≤ n} S k > a) ≤ 2 P(S n > a)` and
`P(max_{1 ≤ k ≤ n} |S k| > a) ≤ 2 P(|S n| > a)` for every real `a`. -/
theorem levy_symmetric (X : ℕ → Ω → ℝ) (hX : ∀ i, Measurable (X i)) (hind : iIndepFun X μ)
    (hsymm : ∀ i, IdentDistrib (X i) (fun ω ↦ -X i ω) μ μ) (n : ℕ) (a : ℝ) :
    μ.real {ω | ∃ k ∈ Icc 1 n, a < partialSum X k ω} ≤
        2 * μ.real {ω | a < partialSum X n ω} ∧
      μ.real {ω | ∃ k ∈ Icc 1 n, a < |partialSum X k ω|} ≤
        2 * μ.real {ω | a < |partialSum X n ω|} := by
  sorry

/-! ## Layer 3: convergence of random series -/

/-- 3.1 Kolmogorov's two-series theorem: for independent square-integrable `X i`, if the series
of means converges and the series of variances is finite, the series `∑ X i` converges almost
surely. -/
theorem ae_exists_tendsto_partialSum_of_summable_variance (X : ℕ → Ω → ℝ)
    (hX : ∀ i, Measurable (X i)) (hind : iIndepFun X μ) (hL2 : ∀ i, MemLp (X i) 2 μ)
    (hmean : ∃ m, Tendsto (fun n ↦ ∑ i ∈ range n, μ[X i]) atTop (𝓝 m))
    (hvar : Summable fun i ↦ variance (X i) μ) :
    ∀ᵐ ω ∂μ, ∃ l, Tendsto (fun n ↦ partialSum X n ω) atTop (𝓝 l) := by
  sorry

/-- 3.2 Truncation at level `c`: `x` when `|x| ≤ c`, and `0` otherwise. -/
def truncate (c x : ℝ) : ℝ :=
  if |x| ≤ c then x else 0

/-- 3.2 Kolmogorov's three series at level `c`: `∑ P(|X i| > c) < ∞`, the series of the means of
the truncated variables converges, and the series of their variances is finite. -/
def ThreeSeries (X : ℕ → Ω → ℝ) (c : ℝ) (μ : Measure Ω) : Prop :=
  Summable (fun i ↦ μ.real {ω | c < |X i ω|}) ∧
    (∃ m, Tendsto (fun n ↦ ∑ i ∈ range n, ∫ ω, truncate c (X i ω) ∂μ) atTop (𝓝 m)) ∧
    Summable (fun i ↦ variance (fun ω ↦ truncate c (X i ω)) μ)

/-- 3.2 Kolmogorov's three-series theorem: for independent `X i` and every level `c > 0`, the
series `∑ X i` converges almost surely if and only if the three series at level `c` converge. -/
theorem ae_exists_tendsto_partialSum_iff_threeSeries (X : ℕ → Ω → ℝ)
    (hX : ∀ i, Measurable (X i)) (hind : iIndepFun X μ) {c : ℝ} (hc : 0 < c) :
    (∀ᵐ ω ∂μ, ∃ l, Tendsto (fun n ↦ partialSum X n ω) atTop (𝓝 l)) ↔
      ThreeSeries X c μ := by
  sorry

/-- 3.3 Lévy's equivalence theorem, convergence in probability: if the partial sums of independent
`X i` converge in probability to `g`, they converge to `g` almost surely. -/
theorem ae_tendsto_partialSum_of_tendstoInMeasure (X : ℕ → Ω → ℝ)
    (hX : ∀ i, Measurable (X i)) (hind : iIndepFun X μ) {g : Ω → ℝ}
    (h : TendstoInMeasure μ (partialSum X) atTop g) :
    ∀ᵐ ω ∂μ, Tendsto (fun n ↦ partialSum X n ω) atTop (𝓝 (g ω)) := by
  sorry

/-- 3.3 Lévy's equivalence theorem, convergence in law: if the partial sums of independent `X i`
converge in distribution, they converge almost surely. -/
theorem ae_exists_tendsto_partialSum_of_tendstoInDistribution (X : ℕ → Ω → ℝ)
    (hX : ∀ i, Measurable (X i)) (hind : iIndepFun X μ)
    {Ω' : Type*} [MeasurableSpace Ω'] {μ' : Measure Ω'} [IsProbabilityMeasure μ'] {Z : Ω' → ℝ}
    (h : TendstoInDistribution (partialSum X) atTop Z (fun _ ↦ μ) μ') :
    ∀ᵐ ω ∂μ, ∃ l, Tendsto (fun n ↦ partialSum X n ω) atTop (𝓝 l) := by
  sorry

/-- 3.4 Rademacher series: for independent signs `ε i` with `P(ε i = 1) = P(ε i = -1) = 1/2` and
real `a i`, the series `∑ a i ε i` converges almost surely if and only if `∑ a i ^ 2 < ∞`. -/
theorem ae_exists_tendsto_sum_mul_rademacher_iff (ε : ℕ → Ω → ℝ)
    (hε : ∀ i, HasLaw (ε i) TauCeti.Probability.rademacherMeasure μ) (hind : iIndepFun ε μ)
    (a : ℕ → ℝ) :
    (∀ᵐ ω ∂μ, ∃ l, Tendsto (fun n ↦ ∑ i ∈ range n, a i * ε i ω) atTop (𝓝 l)) ↔
      Summable fun i ↦ a i ^ 2 := by
  sorry

/-! ## Layer 4: strong laws -/

/-- 4.1 Kolmogorov's strong law with norming constants: for independent square-integrable `X i`
and `b` monotone with `b n → ∞`, if `∑ Var(X i) / b i ^ 2 < ∞` then
`(∑_{i < n} (X i - E X i)) / b n → 0` almost surely. -/
theorem ae_tendsto_sum_sub_integral_div (X : ℕ → Ω → ℝ) (hX : ∀ i, Measurable (X i))
    (hind : iIndepFun X μ) (hL2 : ∀ i, MemLp (X i) 2 μ) {b : ℕ → ℝ} (hb : Monotone b)
    (hb_top : Tendsto b atTop atTop) (hvar : Summable fun i ↦ variance (X i) μ / b i ^ 2) :
    ∀ᵐ ω ∂μ, Tendsto (fun n ↦ (∑ i ∈ range n, (X i ω - μ[X i])) / b n) atTop (𝓝 0) := by
  sorry

/-- 4.2 The Marcinkiewicz–Zygmund strong law: for i.i.d. `X i` and `0 < p < 2`,
`S n / n ^ (1 / p) → 0` almost surely if and only if `E |X 0| ^ p < ∞` and, when `p ≥ 1`,
`E X 0 = 0`. -/
theorem ae_tendsto_partialSum_div_rpow_iff (X : ℕ → Ω → ℝ) (hX : ∀ i, Measurable (X i))
    (hind : iIndepFun X μ) (hident : ∀ i, IdentDistrib (X i) (X 0) μ μ) {p : ℝ}
    (hp : 0 < p) (hp2 : p < 2) :
    (∀ᵐ ω ∂μ, Tendsto (fun n : ℕ ↦ partialSum X n ω / (n : ℝ) ^ (1 / p)) atTop (𝓝 0)) ↔
      Integrable (fun ω ↦ |X 0 ω| ^ p) μ ∧ (1 ≤ p → μ[X 0] = 0) := by
  sorry

end TauCetiRoadmap.SeriesOfIndependentRandomVariables
