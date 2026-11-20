import Mathlib
import TauCeti.Probability.Distributions.Rademacher.Basic

/-!
# The law of the iterated logarithm: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the two small
definitions they need. Every headline theorem of the README is stated here.

* Layer 1: Kolmogorov's lower exponential bound for a sum of bounded independent centred
  variables, with his explicit constants.
* Layer 2: Kolmogorov's law of the iterated logarithm for bounded independent centred variables,
  and Khinchin's law for Rademacher sums.
* Layer 3: the Hartman–Wintner law for i.i.d. variables with finite variance, and its cluster
  set.

Upper and lower limits are taken in `EReal`, so that they carry no junk value; the normalising
function `iteratedLogScale` is evaluated along sequences tending to infinity, so its junk values
for arguments at most `e` affect only finitely many indices in every statement below.
-/

open MeasureTheory ProbabilityTheory Filter Real
open scoped Topology

namespace TauCetiRoadmap.LawOfTheIteratedLogarithm

variable {Ω : Type*} [MeasurableSpace Ω]

/-- Conventions. The normalising function `√(2 v log log v)` of the law of the iterated
logarithm, with Mathlib's totalised logarithm and square root. On `v ≥ 0`, the only arguments
used below, it is positive for `v > e`, `0` for `v = 0` and for `1/e ≤ v ≤ e`, and takes a
positive junk value for `0 < v < 1/e`. -/
noncomputable def iteratedLogScale (v : ℝ) : ℝ :=
  Real.sqrt (2 * v * Real.log (Real.log v))

/-- 1.1. Kolmogorov's error term `ε = max (32 √(log λ / λ)) (64 √ω)` in the lower exponential
bound, as a function of `ω = x M / B` and `λ = x² / B`. -/
noncomputable def kolmogorovEpsilon (w l : ℝ) : ℝ :=
  max (32 * Real.sqrt (Real.log l / l)) (64 * Real.sqrt w)

/-! ## Layer 1: Kolmogorov's lower exponential bound -/

/-- 1.1. **Kolmogorov's lower exponential bound** (Kolmogorov 1929, Hilfssatz IV, p. 128). Let
the `X i`, `i ∈ s`, be independent, almost everywhere measurable and centred, with `|X i| ≤ M`
almost surely, and let `B = ∑ i ∈ s, E[X i ^ 2]`. If `x > 0`, `ω = x M / B < 1/256`,
`λ = x² / B > 512` and `ε ≤ 1`, then `P(∑ i ∈ s, X i > x) > exp (-(x² / (2B)) (1 + ε))` with
`ε = max (32 √(log λ / λ)) (64 √ω)`. The hypothesis `ε ≤ 1` is not in Kolmogorov's statement;
the last step of his proof needs `ε ≤ 1.155…`. -/
theorem kolmogorov_lower_exponential_bound {ι : Type*} (P : Measure Ω) [IsProbabilityMeasure P]
    (X : ι → Ω → ℝ) (s : Finset ι) (hmeas : ∀ i ∈ s, AEMeasurable (X i) P)
    (hindep : iIndepFun X P) (hmean : ∀ i ∈ s, P[X i] = 0) {M x B : ℝ}
    (hbdd : ∀ i ∈ s, ∀ᵐ ω ∂P, |X i ω| ≤ M) (hB : ∑ i ∈ s, ∫ ω, X i ω ^ 2 ∂P = B)
    (hx : 0 < x) (hw : x * M / B < 1 / 256) (hl : 512 < x ^ 2 / B)
    (hε : kolmogorovEpsilon (x * M / B) (x ^ 2 / B) ≤ 1) :
    Real.exp (-(x ^ 2 / (2 * B)) * (1 + kolmogorovEpsilon (x * M / B) (x ^ 2 / B))) <
      P.real {ω | x < ∑ i ∈ s, X i ω} := by
  sorry

/-! ## Layer 2: Kolmogorov's law and Khinchin's law -/

/-- 2.1. **Kolmogorov's law of the iterated logarithm** (Kolmogorov 1929, p. 126, conditions I
and II, and the main theorem of §§2–3). Let `X n` be independent, almost everywhere
measurable and centred, with `|X n| ≤ m n` almost surely for deterministic bounds `m n`, and let
`B n = ∑ i < n, E[X i ^ 2]`. If `B n → ∞` and `m n = o(√(B (n+1) / log log B (n+1)))`, then almost
surely the upper limit of `S n / √(2 B n log log B n)` is `1` and the lower limit is `-1`, where
`S n = ∑ i < n, X i`. -/
theorem kolmogorov_lil (P : Measure Ω) [IsProbabilityMeasure P] (X : ℕ → Ω → ℝ)
    (hmeas : ∀ n, AEMeasurable (X n) P) (hindep : iIndepFun X P) (hmean : ∀ n, P[X n] = 0)
    (m : ℕ → ℝ) (hbdd : ∀ n, ∀ᵐ ω ∂P, |X n ω| ≤ m n) (B : ℕ → ℝ)
    (hB : ∀ n, B n = ∑ i ∈ Finset.range n, ∫ ω, X i ω ^ 2 ∂P)
    (hBtop : Tendsto B atTop atTop)
    (hm : Tendsto (fun n => m n / Real.sqrt (B (n + 1) / Real.log (Real.log (B (n + 1)))))
      atTop (𝓝 0)) :
    ∀ᵐ ω ∂P,
      limsup (fun n => (((∑ i ∈ Finset.range n, X i ω) / iteratedLogScale (B n) : ℝ) : EReal))
          atTop = 1 ∧
        liminf (fun n => (((∑ i ∈ Finset.range n, X i ω) / iteratedLogScale (B n) : ℝ) : EReal))
          atTop = -1 := by
  sorry

/-- 2.2. **Khinchin's law of the iterated logarithm** (Khinchin, 1924). If the `X n` are
independent with the Rademacher law, then almost surely the upper limit of
`S n / √(2 n log log n)` is `1` and the lower limit is `-1`, where `S n = ∑ i < n, X i`. -/
theorem khinchin_lil (P : Measure Ω) [IsProbabilityMeasure P] (X : ℕ → Ω → ℝ)
    (hindep : iIndepFun X P) (hlaw : ∀ n, HasLaw (X n) TauCeti.Probability.rademacherMeasure P) :
    ∀ᵐ ω ∂P,
      limsup (fun n : ℕ => (((∑ i ∈ Finset.range n, X i ω) / iteratedLogScale n : ℝ) : EReal))
          atTop = 1 ∧
        liminf (fun n : ℕ => (((∑ i ∈ Finset.range n, X i ω) / iteratedLogScale n : ℝ) : EReal))
          atTop = -1 := by
  sorry

/-! ## Layer 3: the Hartman–Wintner law -/

/-- 3.1. **The Hartman–Wintner law of the iterated logarithm** (Durrett, Theorem 8.5.2, p. 418,
for `E[X 0 ^ 2] = 1`; Hartman and Wintner, 1941). If the `X n` are independent and identically
distributed with `E[X 0] = 0` and `σ² = E[X 0 ^ 2] < ∞`, then almost surely the upper limit of
`S n / √(2 n log log n)` is `σ` and the lower limit is `-σ`. -/
theorem hartman_wintner (P : Measure Ω) [IsProbabilityMeasure P] (X : ℕ → Ω → ℝ)
    (hindep : iIndepFun X P) (hident : ∀ n, IdentDistrib (X n) (X 0) P P)
    (hL2 : MemLp (X 0) 2 P) (hmean : P[X 0] = 0) :
    ∀ᵐ ω ∂P,
      limsup (fun n : ℕ => (((∑ i ∈ Finset.range n, X i ω) / iteratedLogScale n : ℝ) : EReal))
          atTop = ((Real.sqrt (∫ ω, X 0 ω ^ 2 ∂P) : ℝ) : EReal) ∧
        liminf (fun n : ℕ => (((∑ i ∈ Finset.range n, X i ω) / iteratedLogScale n : ℝ) : EReal))
          atTop = -((Real.sqrt (∫ ω, X 0 ω ^ 2 ∂P) : ℝ) : EReal) := by
  sorry

/-- 3.2. **The cluster set in the Hartman–Wintner law** (Durrett, Exercise 8.5.2, p. 419). Under
the hypotheses of 3.1, almost surely the set of cluster points of `S n / √(2 n log log n)` is the
interval `[-σ, σ]`. -/
theorem hartman_wintner_clusterPt (P : Measure Ω) [IsProbabilityMeasure P] (X : ℕ → Ω → ℝ)
    (hindep : iIndepFun X P) (hident : ∀ n, IdentDistrib (X n) (X 0) P P)
    (hL2 : MemLp (X 0) 2 P) (hmean : P[X 0] = 0) :
    ∀ᵐ ω ∂P, ∀ c : ℝ,
      MapClusterPt c atTop (fun n : ℕ => (∑ i ∈ Finset.range n, X i ω) / iteratedLogScale n) ↔
        c ∈ Set.Icc (-Real.sqrt (∫ ω, X 0 ω ^ 2 ∂P)) (Real.sqrt (∫ ω, X 0 ω ^ 2 ∂P)) := by
  sorry

end TauCetiRoadmap.LawOfTheIteratedLogarithm
