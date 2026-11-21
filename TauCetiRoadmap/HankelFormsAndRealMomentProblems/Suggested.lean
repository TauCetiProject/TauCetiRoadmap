import Mathlib

/-!
# Hankel forms and real moment problems: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib, each with `sorry`, together with the few
definitions they need; every definition has a real body. Every headline theorem of the README is
statable at the pins and is stated here. The README's remaining targets, API lists and Checks are
not restated.

Measures are Mathlib measures on `ℝ` with its Borel σ-algebra. A measure represents a sequence
`m : ℕ → ℝ` when every power `x ↦ xᵏ` is integrable for it and its integral is `m k`; the
truncated form asks this only for `k ≤ d`. The integrability is part of the definition, so no
statement depends on the value `0` that Mathlib gives the integral of a non-integrable function.
Positive (semi)definiteness is Mathlib's `Matrix.PosDef` / `Matrix.PosSemidef`, which for the
infinite Hankel matrix indexed by `ℕ` quantifies over finitely supported vectors. The Riesz
functional `L_m(p) = ∑ₖ pₖ m k` of a polynomial `p` is written `p.sum fun k a => a * m k`.
-/

noncomputable section

open MeasureTheory

namespace TauCetiRoadmap.HankelFormsAndRealMomentProblems

/-! ## Layer 1: Hankel forms of sequences and of measures -/

/-- 1.1. The Hankel matrix `(m (i + j))` of a real sequence, indexed by `ℕ × ℕ`. -/
def hankelMatrix (m : ℕ → ℝ) : Matrix ℕ ℕ ℝ :=
  Matrix.of fun i j => m (i + j)

/-- 1.1. The leading `n × n` section `(m (i + j))_{i,j<n}` of the Hankel matrix. -/
def hankelSection (m : ℕ → ℝ) (n : ℕ) : Matrix (Fin n) (Fin n) ℝ :=
  Matrix.of fun i j => m ((i : ℕ) + j)

/-- 1.1. The Hankel matrix of `m` is positive semidefinite iff every section is, iff the Riesz
functional `L_m(p) = ∑ₖ pₖ m k` is nonnegative on every square `p²`. -/
theorem posSemidef_hankelMatrix_iff (m : ℕ → ℝ) :
    ((hankelMatrix m).PosSemidef ↔ ∀ n, (hankelSection m n).PosSemidef) ∧
      ((hankelMatrix m).PosSemidef ↔
        ∀ p : Polynomial ℝ, 0 ≤ (p * p).sum fun k a => a * m k) := by
  sorry

/-- 1.1. The kernel of a positive Riesz functional is an ideal: if the Hankel matrix of `m` is
positive semidefinite and `L_m(p²) = 0`, then `L_m(p q) = 0` for every polynomial `q`. -/
theorem sum_mul_eq_zero_of_sum_mul_self_eq_zero {m : ℕ → ℝ} (hm : (hankelMatrix m).PosSemidef)
    {p : Polynomial ℝ} (hp : ((p * p).sum fun k a => a * m k) = 0) (q : Polynomial ℝ) :
    ((p * q).sum fun k a => a * m k) = 0 := by
  sorry

/-- 1.2. `μ` represents `m` up to degree `d`: for every `k ≤ d` the power `xᵏ` is
`μ`-integrable and `∫ xᵏ dμ = m k`. The case `k = 0` makes `μ` finite. -/
def RepresentsUpTo (μ : Measure ℝ) (m : ℕ → ℝ) (d : ℕ) : Prop :=
  ∀ k ≤ d, Integrable (fun x : ℝ => x ^ k) μ ∧ ∫ x, x ^ k ∂μ = m k

/-- 1.2. `μ` represents `m`: every power `xᵏ` is `μ`-integrable and `∫ xᵏ dμ = m k`. -/
def Represents (μ : Measure ℝ) (m : ℕ → ℝ) : Prop :=
  ∀ k, Integrable (fun x : ℝ => x ^ k) μ ∧ ∫ x, x ^ k ∂μ = m k

/-- 1.2. The rank of a moment section: if `μ` represents `m` up to degree `2n`, the section of
size `n + 1` has rank `min (n + 1) |supp μ|`. -/
theorem rank_hankelSection_eq_min {μ : Measure ℝ} {m : ℕ → ℝ} {n : ℕ}
    (hμ : RepresentsUpTo μ m (2 * n)) :
    ((hankelSection m (n + 1)).rank : ℕ∞) = min ((n + 1 : ℕ) : ℕ∞) μ.support.encard := by
  sorry

/-! ## Layer 2: the Hamburger moment problem -/

/-- 2.1. Uniqueness for a singular section: if the section of size `k + 1` is not positive
definite, at most one measure represents `m` up to degree `2k`. -/
theorem eq_of_representsUpTo_of_not_posDef {μ ν : Measure ℝ} {m : ℕ → ℝ} {k : ℕ}
    (hm : ¬ (hankelSection m (k + 1)).PosDef)
    (hμ : RepresentsUpTo μ m (2 * k)) (hν : RepresentsUpTo ν m (2 * k)) : μ = ν := by
  sorry

/-- 2.1. A positive semidefinite Hankel sequence with a section of size `n` that is not
positive definite is the moment sequence of fewer than `n` positive point masses, and its
section of size `N` has rank `min N` (the number of points). -/
theorem exists_atomic_of_not_posDef {m : ℕ → ℝ} (hm : (hankelMatrix m).PosSemidef) {n : ℕ}
    (hn : ¬ (hankelSection m n).PosDef) :
    ∃ s : Finset ℝ, s.card < n ∧ ∃ w : ℝ → ℝ, (∀ x ∈ s, 0 < w x) ∧
      (∀ k, m k = ∑ x ∈ s, w x * x ^ k) ∧ ∀ N, (hankelSection m N).rank = min N s.card := by
  sorry

/-- 2.2. Hamburger's theorem, semidefinite form: the Hankel matrix of `m` is positive
semidefinite iff some measure on `ℝ` represents `m`. -/
theorem posSemidef_hankelMatrix_iff_exists_represents (m : ℕ → ℝ) :
    (hankelMatrix m).PosSemidef ↔ ∃ μ : Measure ℝ, Represents μ m := by
  sorry

/-! ## Layer 3: the half-line and compact intervals -/

/-- 3.1. Stieltjes's theorem, semidefinite form: the Hankel matrices of `m` and of its shift are
positive semidefinite iff some measure carried by `[0, ∞)` represents `m`. -/
theorem stieltjes_iff_exists_represents (m : ℕ → ℝ) :
    ((hankelMatrix m).PosSemidef ∧ (hankelMatrix fun k => m (k + 1)).PosSemidef) ↔
      ∃ μ : Measure ℝ, Represents μ m ∧ ∀ᵐ x ∂μ, 0 ≤ x := by
  sorry

/-- 3.1. Stieltjes's theorem, strict form: all Hankel determinants of `m` and of its shift are
positive iff some measure with infinite support carried by `[0, ∞)` represents `m`. -/
theorem stieltjes_det_pos_iff (m : ℕ → ℝ) :
    ((∀ n, 0 < (hankelSection m n).det) ∧ ∀ n, 0 < (hankelSection (fun k => m (k + 1)) n).det) ↔
      ∃ μ : Measure ℝ, Represents μ m ∧ (∀ᵐ x ∂μ, 0 ≤ x) ∧ μ.support.Infinite := by
  sorry

/-- 3.2. Compact intervals: for `a ≤ b`, the Hankel matrices of `m` and of
`(a + b) m_(k+1) − m_(k+2) − a b m_k` are positive semidefinite iff some measure carried by
`[a, b]` represents `m`; that measure is then the only measure on `ℝ` representing `m`. -/
theorem exists_unique_represents_Icc_iff {a b : ℝ} (hab : a ≤ b) (m : ℕ → ℝ) :
    ((hankelMatrix m).PosSemidef ∧
        (hankelMatrix fun k => (a + b) * m (k + 1) - m (k + 2) - a * b * m k).PosSemidef) ↔
      ∃ μ : Measure ℝ, Represents μ m ∧ (∀ᵐ x ∂μ, x ∈ Set.Icc a b) ∧
        ∀ ν : Measure ℝ, Represents ν m → ν = μ := by
  sorry

/-- 3.3. A sequence is completely monotone when `∑_{j ≤ n} (−1)ʲ C(n, j) m (k + j) ≥ 0` for all
`n` and `k`, that is `(−1)ⁿ Δⁿ m ≥ 0` for the forward difference `Δ`. -/
def IsCompletelyMonotoneSeq (m : ℕ → ℝ) : Prop :=
  ∀ n k : ℕ, 0 ≤ ∑ j ∈ Finset.range (n + 1), (-1 : ℝ) ^ j * (n.choose j : ℝ) * m (k + j)

/-- 3.3. Hausdorff's theorem: a sequence is completely monotone iff some measure carried by
`[0, 1]` represents it. -/
theorem isCompletelyMonotoneSeq_iff_exists_represents (m : ℕ → ℝ) :
    IsCompletelyMonotoneSeq m ↔ ∃ μ : Measure ℝ, Represents μ m ∧ ∀ᵐ x ∂μ, x ∈ Set.Icc 0 1 := by
  sorry

/-! ## Layer 4: the truncated Hamburger moment problem -/

/-- 4.1. The truncated Hamburger moment problem (Curto–Fialkow): some measure represents `m`
up to degree `2k` iff the section of size `k + 1` is positive semidefinite and either positive
definite or of the same rank as the section of size `k`. -/
theorem exists_representsUpTo_iff (m : ℕ → ℝ) (k : ℕ) :
    (∃ μ : Measure ℝ, RepresentsUpTo μ m (2 * k)) ↔
      (hankelSection m (k + 1)).PosSemidef ∧
        ((hankelSection m (k + 1)).PosDef ∨
          (hankelSection m k).rank = (hankelSection m (k + 1)).rank) := by
  sorry

/-- 4.2. Minimal representing measures: if some measure represents `m` up to degree `2k`, so
does a sum of positive point masses at exactly `rank` (section of size `k + 1`) points. -/
theorem exists_atomic_of_representsUpTo {μ : Measure ℝ} {m : ℕ → ℝ} {k : ℕ}
    (hμ : RepresentsUpTo μ m (2 * k)) :
    ∃ s : Finset ℝ, s.card = (hankelSection m (k + 1)).rank ∧ ∃ w : ℝ → ℝ,
      (∀ x ∈ s, 0 < w x) ∧ ∀ j ≤ 2 * k, m j = ∑ x ∈ s, w x * x ^ j := by
  sorry

end TauCetiRoadmap.HankelFormsAndRealMomentProblems
