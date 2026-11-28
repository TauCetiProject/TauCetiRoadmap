/-
Copyright (c) 2026 The Tau Ceti contributors. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Mathlib.Topology.EMetricSpace.BoundedVariation
import Mathlib.MeasureTheory.Integral.IntervalIntegral.Basic
import Mathlib.Data.Nat.Fib.Zeckendorf
import Mathlib.NumberTheory.Real.GoldenRatio
import Mathlib.Analysis.SpecialFunctions.Log.Basic
import Mathlib.Algebra.ContinuedFractions.Computation.Basic
import Mathlib.NumberTheory.DiophantineApproximation.Basic
import Mathlib.Algebra.Order.Floor.Ring
import TauCeti.NumberTheory.DiophantineApproximation.BadlyApproximable
import TauCeti.NumberTheory.DiophantineApproximation.ContinuedFractions

/-!
# Discrepancy of irrational rotations: target signatures

`README.md` is the roadmap; this file is not the roadmap and is not exhaustive. The statements
here suggest Lean forms for the roadmap's headline theorems, so that contributors and reviewers
converge on names and signatures; discharging all of them finishes neither a layer nor the
roadmap. Each is statable against the pinned Mathlib and Tau Ceti, with `sorry`, and every
definition has its real body.

The headline theorems are:

* Layer 1: the Ostrowski numeration of the natural numbers in the convergent denominators of an
  irrational number (existence and uniqueness, the digit conditions, and Zeckendorf's
  representation as the case of the golden ratio);
* Layer 2: the Denjoy–Koksma inequality for a function of bounded variation, at a reduced
  fraction `p / q` with `|α - p / q| ≤ 1 / q ^ 2` and at the convergent denominators;
* Layer 3: the bound of the star discrepancy of `{j α}`, `j < N`, by the Ostrowski digits of `N`
  and by the partial quotients of `α`, and the bound `G(K) log (N + 1) / N` when the partial
  quotients are at most `K`, with the golden ratio as the case `K = 1`.

Conventions: continued fractions are `GenContFract.of ξ`; `convDen ξ k` is the denominator `q_k`
of the `k`-th convergent, with `q₀ = 1`; `partQuot ξ k` is the partial quotient `a_{k+1}`, so
that `q_{k+2} = a_{k+2} q_{k+1} + q_k` reads
`convDen ξ (k + 2) = partQuot ξ (k + 1) * convDen ξ (k + 1) + convDen ξ k`; digits are finitely
supported functions `b : ℕ →₀ ℕ`, with `b k` the coefficient of `q_k`; points of `[0, 1)` are
`Int.fract (j * α)`, indexed from `j = 0`; `φ = Real.goldenRatio`.

Two definitions are verbatim copies of definitions that are not at the pins: `convDen` is
`Real.convDen` of Tau Ceti, and `starDiscrepancy` is `starDiscrepancy` of
ProbabilisticAndMetricNumberTheory §2.7. An implementation uses the originals.
-/

namespace TauCetiRoadmap.RotationDiscrepancy

open Finset
open scoped Real

noncomputable section

/-! ## Supplier definitions, copied -/

/-- The denominator `q_n` of the `n`-th convergent of `ξ`. Copy of Tau Ceti's `Real.convDen`. -/
def convDen (ξ : ℝ) (n : ℕ) : ℕ :=
  (ξ.convergent n).den

/-- The star discrepancy of a finite sample, with strict cuts. Copy of `starDiscrepancy` of
ProbabilisticAndMetricNumberTheory §2.7. -/
def starDiscrepancy {N : ℕ} (x : Fin N → ℝ) : ℝ :=
  if N = 0 then 0 else sSup {v : ℝ | ∃ t ∈ Set.Icc (0 : ℝ) 1,
    v = |((Finset.univ.filter (fun j => x j < t)).card : ℝ) / (N : ℝ) - t|}

/-! ## Layer 1: Ostrowski numeration -/

/-- 1.1 The partial quotient `a_{k+1}` of `ξ` as a natural number; `0` once the continued
fraction has terminated. -/
def partQuot (ξ : ℝ) (k : ℕ) : ℕ :=
  ⌊((GenContFract.of ξ).partDens.get? k).getD 0⌋₊

/-- 1.1 The convergent denominators satisfy `q_{k+2} = a_{k+2} q_{k+1} + q_k`. -/
theorem convDen_add_two_eq {ξ : ℝ} (hξ : Irrational ξ) (k : ℕ) :
    convDen ξ (k + 2) = partQuot ξ (k + 1) * convDen ξ (k + 1) + convDen ξ k := by
  sorry

/-- 1.2 The value `∑ b_k q_k` of a digit string in the convergent denominators of `ξ`. -/
def ostrowskiValue (ξ : ℝ) (b : ℕ →₀ ℕ) : ℕ :=
  b.sum fun k c => c * convDen ξ k

/-- 1.2 A digit string is an Ostrowski representation for `ξ` when every partial sum
`∑_{j ≤ k} b_j q_j` is less than `q_{k+1}`. -/
def IsOstrowskiRep (ξ : ℝ) (b : ℕ →₀ ℕ) : Prop :=
  ∀ k, ∑ j ∈ range (k + 1), b j * convDen ξ j < convDen ξ (k + 1)

/-- 1.2 The digit conditions: `b` is an Ostrowski representation exactly when `b₀ < a₁`,
`b_k ≤ a_{k+1}` for `k ≥ 1`, and `b_k = a_{k+1}` forces `b_{k-1} = 0`. -/
theorem isOstrowskiRep_iff {ξ : ℝ} (hξ : Irrational ξ) (b : ℕ →₀ ℕ) :
    IsOstrowskiRep ξ b ↔
      b 0 < partQuot ξ 0 ∧ (∀ k, b (k + 1) ≤ partQuot ξ (k + 1)) ∧
        ∀ k, b (k + 1) = partQuot ξ (k + 1) → b k = 0 := by
  sorry

/-- 1.3 Ostrowski's theorem: every natural number has exactly one Ostrowski representation in
the convergent denominators of an irrational number. -/
theorem existsUnique_isOstrowskiRep {ξ : ℝ} (hξ : Irrational ξ) (N : ℕ) :
    ∃! b : ℕ →₀ ℕ, IsOstrowskiRep ξ b ∧ ostrowskiValue ξ b = N := by
  sorry

/-- 1.3 The leading digit sits at the largest convergent denominator not exceeding the value:
the support of a representation of `N` lies below `k` exactly when `N < q_k`. -/
theorem IsOstrowskiRep.support_subset_range_iff {ξ : ℝ} (hξ : Irrational ξ) {b : ℕ →₀ ℕ}
    (hb : IsOstrowskiRep ξ b) (k : ℕ) :
    b.support ⊆ range k ↔ ostrowskiValue ξ b < convDen ξ k := by
  sorry

/-- 1.4 For the golden ratio the Ostrowski representation is Zeckendorf's: the digit of
`q_k = fib (k + 1)` is `1` when `k + 1` occurs in `Nat.zeckendorf N`, and `0` otherwise. -/
theorem IsOstrowskiRep.goldenRatio_apply {b : ℕ →₀ ℕ} (hb : IsOstrowskiRep φ b) (k : ℕ) :
    b k = if k + 1 ∈ Nat.zeckendorf (ostrowskiValue φ b) then 1 else 0 := by
  sorry

/-! ## Layer 2: the Denjoy–Koksma inequality -/

/-- 2.1 The Denjoy–Koksma inequality: for a reduced fraction `p / q` with
`|α - p / q| ≤ 1 / q ^ 2` and a `1`-periodic function `f` of bounded variation on `[0, 1]`, the
sum of `f` over `q` consecutive points of any orbit of the rotation by `α` differs from
`q ∫₀¹ f` by at most the variation of `f` over a period. -/
theorem denjoyKoksma {α : ℝ} {p : ℤ} {q : ℕ} (hq : 0 < q) (hpq : IsCoprime p (q : ℤ))
    (hα : |α - p / q| ≤ 1 / (q : ℝ) ^ 2) {f : ℝ → ℝ} (hper : Function.Periodic f 1)
    (hf : BoundedVariationOn f (Set.Icc 0 1)) (x : ℝ) :
    |∑ j ∈ range q, f (x + j * α) - q * ∫ t in (0 : ℝ)..1, f t| ≤
      (eVariationOn f (Set.Icc 0 1)).toReal := by
  sorry

/-- 2.2 The Denjoy–Koksma inequality at the convergent denominators of any real number. -/
theorem denjoyKoksma_convDen (α : ℝ) (k : ℕ) {f : ℝ → ℝ} (hper : Function.Periodic f 1)
    (hf : BoundedVariationOn f (Set.Icc 0 1)) (x : ℝ) :
    |∑ j ∈ range (convDen α k), f (x + j * α) - convDen α k * ∫ t in (0 : ℝ)..1, f t| ≤
      (eVariationOn f (Set.Icc 0 1)).toReal := by
  sorry

/-! ## Layer 3: the discrepancy of the orbit -/

/-- 3.1 Subadditivity of the star discrepancy under concatenation of samples:
`(M + N) D*(x ++ y) ≤ M D*(x) + N D*(y)`. -/
theorem add_mul_starDiscrepancy_append_le {M N : ℕ} (x : Fin M → ℝ) (y : Fin N → ℝ) :
    ((M + N : ℕ) : ℝ) * starDiscrepancy (Fin.append x y) ≤
      M * starDiscrepancy x + N * starDiscrepancy y := by
  sorry

/-- 3.2 A block of `q_k` consecutive points of the orbit of an irrational rotation has
`q_k D* < 1 + q_k / q_{k+1}`. -/
theorem convDen_mul_starDiscrepancy_block_lt {α : ℝ} (hα : Irrational α) (k n : ℕ) :
    (convDen α k : ℝ) *
        starDiscrepancy (fun j : Fin (convDen α k) => Int.fract (((n + j : ℕ) : ℝ) * α)) <
      1 + (convDen α k : ℝ) / convDen α (k + 1) := by
  sorry

/-- 3.3 The star discrepancy of the first `N` points `{j α}`, `j < N`, of an irrational
rotation is bounded through the Ostrowski digits `b` of `N`:
`N D*_N < ∑_{b_k ≠ 0} (b_k + 1)`. -/
theorem natCast_mul_starDiscrepancy_fract_lt {α : ℝ} (hα : Irrational α) {b : ℕ →₀ ℕ}
    (hb : IsOstrowskiRep α b) {N : ℕ} (hN : 0 < N) (hbN : ostrowskiValue α b = N) :
    (N : ℝ) * starDiscrepancy (fun j : Fin N => Int.fract ((j : ℕ) * α)) <
      ∑ k ∈ b.support, ((b k : ℝ) + 1) := by
  sorry

/-- 3.3 The digit bound is at most a sum of partial quotients: if the digits of `b` sit at
indices at most `n`, then `∑_{b_k ≠ 0} (b_k + 1) ≤ a₁ + ⋯ + a_{n+1}`. -/
theorem IsOstrowskiRep.sum_support_le_sum_partQuot {ξ : ℝ} (hξ : Irrational ξ) {b : ℕ →₀ ℕ}
    (hb : IsOstrowskiRep ξ b) {n : ℕ} (hn : b.support ⊆ range (n + 1)) :
    ∑ k ∈ b.support, (b k + 1) ≤ ∑ k ∈ range (n + 1), partQuot ξ k := by
  sorry

/-- 3.4 The constant `G(K)` of the bounded-quotient bound: `2 / log 2` for `K ≤ 3` and
`(K + 1) / log (K + 1)` for `K ≥ 4`. -/
def boundedQuotientConst (K : ℕ) : ℝ :=
  if K ≤ 3 then 2 / Real.log 2 else (K + 1) / Real.log (K + 1)

/-- 3.4 If the averages of the partial quotients are bounded, then `N D*_N = O(log N)`. -/
theorem exists_natCast_mul_starDiscrepancy_fract_le_log {α : ℝ} (hα : Irrational α)
    (h : ∃ C : ℝ, ∀ m : ℕ, (∑ k ∈ range m, partQuot α k : ℝ) ≤ C * m) :
    ∃ C : ℝ, ∀ N : ℕ, 2 ≤ N →
      (N : ℝ) * starDiscrepancy (fun j : Fin N => Int.fract ((j : ℕ) * α)) ≤
        C * Real.log N := by
  sorry

/-- 3.4 If every partial quotient `a_k`, `k ≥ 1`, of the irrational `α` is at most `K`, then
`N D*_N < G(K) log (N + 1)` for every `N ≥ 1`. -/
theorem natCast_mul_starDiscrepancy_fract_lt_of_partQuot_le {α : ℝ} (hα : Irrational α)
    {K : ℕ} (hK : ∀ k, partQuot α k ≤ K) {N : ℕ} (hN : 0 < N) :
    (N : ℝ) * starDiscrepancy (fun j : Fin N => Int.fract ((j : ℕ) * α)) <
      boundedQuotientConst K * Real.log (N + 1) := by
  sorry

/-- 3.4 The orbit of a badly approximable rotation has `N D*_N = O(log N)`. -/
theorem _root_.TauCeti.BadlyApproximable.exists_natCast_mul_starDiscrepancy_fract_le_log
    {α : ℝ} (hα : TauCeti.BadlyApproximable α) :
    ∃ C : ℝ, ∀ N : ℕ, 2 ≤ N →
      (N : ℝ) * starDiscrepancy (fun j : Fin N => Int.fract ((j : ℕ) * α)) ≤
        C * Real.log N := by
  sorry

/-- 3.5 Every partial quotient of the golden ratio is `1`. -/
theorem partQuot_goldenRatio (k : ℕ) : partQuot φ k = 1 := by
  sorry

/-- 3.5 The golden rotation: `N D*_N < (2 / log 2) log (N + 1)` for every `N ≥ 1`. -/
theorem natCast_mul_starDiscrepancy_fract_goldenRatio_lt {N : ℕ} (hN : 0 < N) :
    (N : ℝ) * starDiscrepancy (fun j : Fin N => Int.fract ((j : ℕ) * φ)) <
      2 / Real.log 2 * Real.log (N + 1) := by
  sorry

end

end TauCetiRoadmap.RotationDiscrepancy
