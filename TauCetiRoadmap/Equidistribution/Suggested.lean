/-
Copyright (c) 2026 The Tau Ceti contributors. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Mathlib
import TauCeti.Probability.Process.EmpiricalMeasure

/-!
# Equidistribution, three gaps and rhythm on the circle: target signatures

`README.md` is the roadmap; this file is not the roadmap and is not exhaustive. The statements
here suggest Lean forms for the roadmap's headline theorems, so that contributors and reviewers
converge on names and signatures; discharging all of them finishes neither a layer nor the
roadmap. Each is statable against the pinned Mathlib and Tau Ceti, with `sorry`, and every
definition has its real body.

The headline theorems are:

* Layer 1: the rhythmic dichotomy for the `ℕ`-orbit of a point of `AddCircle p` (dense or
  finite, never both) and the number of points of the orbit of a rational multiple of the period;
* Layer 2: the equidistribution of the `ℕ`-orbit of a point of infinite order in `AddCircle T`,
  as weak convergence of the empirical measures to the Haar probability measure;
* Layer 3: the integer data of the convergents of a real number, the alternation and decay of
  the convergent errors, Lagrange's theorem that the convergent denominators are exactly the best
  approximations of the second kind, the convergent form of Hurwitz's theorem, its sharpness at
  the golden ratio, and the continued fraction of the golden ratio;
* Layer 4: the three-gap theorem for `{nα}`, uniform in `α`, the identification of the gap
  lengths through the convergent denominators of an irrational `α`, and the golden rotation.

Conventions: the circle is `AddCircle T` with `[Fact (0 < T)]`, rotation is `(a + ·)`, the
`ℕ`-orbit is `(· • a : ℕ → AddCircle T)`; averages are against `AddCircle.haarAddCircle`; points
of `[0, 1)` are `Int.fract (n * α)`; continued fractions are `GenContFract.of ξ` with
denominators indexed from `0` and `q₀ = 1`; `φ = Real.goldenRatio`. The roadmap's own
declarations live in the namespaces `Rotation` (Layers 1, 2 and 4) and `ContFrac` (Layer 3), so
that every name from `AddCircle`, `Real` and `GenContFract` is Mathlib's.

All headline theorems of the roadmap are statable at the pins.
-/

namespace TauCetiRoadmap.Equidistribution

open MeasureTheory Filter Topology Finset
open scoped Real

/-! ## Layer 1: the orbit of a rotation -/

namespace Rotation

/-- **Layer 1.** The rhythmic dichotomy: the `ℕ`-orbit of a point of the circle is dense or
finite, never both. The dense case is `AddCircle.denseRange_zsmul_iff` through
`denseRange_zsmul_iff_nsmul`, the finite case is `IsOfFinAddOrder.finite_multiples`. -/
theorem denseRange_nsmul_xor_finite_range {p : ℝ} [Fact (0 < p)] (a : AddCircle p) :
    Xor (DenseRange (· • a : ℕ → AddCircle p)) (Set.range (· • a : ℕ → AddCircle p)).Finite :=
  sorry

/-- **Layer 1.** For a rational multiple of the period, the `ℕ`-orbit has exactly `q.den`
points; compare `AddCircle.addOrderOf_coe_rat`. -/
theorem ncard_range_nsmul_coe_rat {p : ℝ} [Fact (0 < p)] (q : ℚ) :
    (Set.range (· • ((q * p : ℝ) : AddCircle p) : ℕ → AddCircle p)).ncard = q.den :=
  sorry

/-! ## Layer 2: equidistribution of the orbit -/

/-- **Layer 2.** The `ℕ`-orbit of a point of infinite order in `AddCircle T` is equidistributed:
its empirical probability measures converge weakly to the Haar probability measure. -/
theorem tendsto_empiricalMeasure_nsmul {T : ℝ} [Fact (0 < T)] {a : AddCircle T}
    (ha : addOrderOf a = 0) :
    Tendsto (TauCeti.Probability.empiricalMeasure (fun n : ℕ => n • a)) atTop
      (𝓝 (AddCircle.haarAddCircle : Measure (AddCircle T)).toProbabilityMeasure) :=
  sorry

end Rotation

/-! ## Layer 3: convergents, best approximations and Hurwitz -/

namespace ContFrac

/-- **Layer 3.** The integer numerator `pₙ` of the `n`-th convergent of a real number, so that
`((convNum ξ n : ℤ) : ℝ) = (GenContFract.of ξ).nums n`. -/
noncomputable def convNum (ξ : ℝ) (n : ℕ) : ℤ :=
  (Real.convergent ξ n).num

/-- **Layer 3.** The natural-number denominator `qₙ` of the `n`-th convergent of a real number,
so that `((convDen ξ n : ℕ) : ℝ) = (GenContFract.of ξ).dens n` and `convDen ξ 0 = 1`. -/
noncomputable def convDen (ξ : ℝ) (n : ℕ) : ℕ :=
  (Real.convergent ξ n).den

/-- **Layer 3.** The signed error `qₙ ξ − pₙ` of the `n`-th convergent. -/
noncomputable def convErr (ξ : ℝ) (n : ℕ) : ℝ :=
  convDen ξ n * ξ - convNum ξ n

/-- **Layer 3.** The convergent errors alternate in sign: `qₙ ξ − pₙ` is positive exactly for
even `n`, because the convergents lie alternately below and above `ξ`. -/
theorem convErr_pos_iff {ξ : ℝ} (hξ : Irrational ξ) (n : ℕ) : 0 < convErr ξ n ↔ Even n :=
  sorry

/-- **Layer 3.** The convergent errors strictly decrease in absolute value. The hypothesis is
needed: for `ξ = 1/2` the error at `n = 1` vanishes. -/
theorem abs_convErr_succ_lt {ξ : ℝ} (hξ : Irrational ξ) (n : ℕ) :
    |convErr ξ (n + 1)| < |convErr ξ n| :=
  sorry

/-- **Layer 3.** The upper bound `|qₙ ξ − pₙ| < 1 / qₙ₊₁`, strict for irrational `ξ`. The
hypothesis is needed: for `ξ = 1/2` and `n = 0` both sides are `1/2`. -/
theorem abs_convErr_lt_inv_convDen_succ {ξ : ℝ} (hξ : Irrational ξ) (n : ℕ) :
    |convErr ξ n| < 1 / (convDen ξ (n + 1) : ℝ) :=
  sorry

/-- **Layer 3, Lagrange.** No smaller positive `q` brings `q ξ` closer to an integer than
`qₙ ξ` is, for every `n ≥ 0`. -/
theorem abs_convErr_le_norm_of_lt_convDen_succ {ξ : ℝ} (hξ : Irrational ξ) {n : ℕ} {q : ℕ}
    (hq : 0 < q) (hq' : q < convDen ξ (n + 1)) :
    |convErr ξ n| ≤ ‖((q * ξ : ℝ) : UnitAddCircle)‖ :=
  sorry

/-- **Layer 3, Lagrange's characterization.** For irrational `ξ`, a positive `q` is a best
approximation of the second kind, in that every smaller positive `q'` has `q' ξ` strictly farther
from an integer than `q ξ` is, exactly when `q = qₙ` for some `n ≥ 0`. At `n = 0` and `q₀ = 1`
the condition is vacuous, so `q = 1` is always a best approximation. -/
theorem isBestApprox_iff {ξ : ℝ} (hξ : Irrational ξ) {q : ℕ} (hq : 0 < q) :
    (∀ q' : ℕ, 0 < q' → q' < q →
        ‖((q * ξ : ℝ) : UnitAddCircle)‖ < ‖((q' * ξ : ℝ) : UnitAddCircle)‖) ↔
      ∃ n : ℕ, convDen ξ n = q :=
  sorry

/-- **Layer 3, Hurwitz in convergent form.** Among any three consecutive convergents of an
irrational `ξ` one satisfies `qₖ |qₖ ξ − pₖ| < 1 / √5`. -/
theorem exists_convDen_mul_abs_convErr_lt_inv_sqrt_five {ξ : ℝ} (hξ : Irrational ξ) (n : ℕ) :
    ∃ k : ℕ, n ≤ k ∧ k ≤ n + 2 ∧ (convDen ξ k : ℝ) * |convErr ξ k| < 1 / √5 :=
  sorry

/-- **Layer 3, sharpness of Hurwitz at the golden ratio.** For every `c > √5` only finitely many
rationals satisfy `|φ − p/q| < 1/(c q²)`. -/
theorem finite_setOf_abs_goldenRatio_sub_lt_of_sqrt_five_lt {c : ℝ} (hc : √5 < c) :
    {q : ℚ | |Real.goldenRatio - q| < 1 / (c * (q.den : ℝ) ^ 2)}.Finite :=
  sorry

/-- **Layer 3.** The continued fraction of `φ` is `[1; 1, 1, 1, …]`. -/
theorem goldenRatio_partDens (n : ℕ) :
    (GenContFract.of Real.goldenRatio).partDens.get? n = some (1 : ℝ) :=
  sorry

/-- **Layer 3.** The convergent denominators of `φ` are the Fibonacci numbers. -/
theorem convDen_goldenRatio (n : ℕ) : convDen Real.goldenRatio n = Nat.fib (n + 1) :=
  sorry

/-- **Layer 3.** The exact error of the `n`-th convergent of `φ`; compare
`Real.fib_succ_sub_goldenRatio_mul_fib`, which gives `fib (n + 1) - φ * fib n = ψ ^ n`
(`convErr` is the negative of the corresponding left-hand side, hence the sign). -/
theorem convErr_goldenRatio (n : ℕ) :
    convErr Real.goldenRatio n = -(Real.goldenConj ^ (n + 1)) :=
  sorry

end ContFrac

/-! ## Layer 4: the three-gap theorem -/

namespace Rotation

/-- **Layer 4.** The first `N` points of the rotation by `α`, as fractional parts in `[0, 1)`. -/
noncomputable def orbitFract (α : ℝ) (N : ℕ) : Finset ℝ :=
  (range N).image fun n : ℕ => Int.fract (n * α)

/-- **Layer 4.** The multiset of gaps between consecutive points of `orbitFract α N`, including
the wrap-around gap from the largest point to `1`; the gaps sum to `1` for `N ≥ 1`. -/
noncomputable def gaps (α : ℝ) (N : ℕ) : Multiset ℝ :=
  let s := (orbitFract α N).sort (· ≤ ·)
  ((List.zipWith (· - ·) (s.tail ++ [1]) s : List ℝ) : Multiset ℝ)

/-- **Layer 4.** The least positive point of the orbit, `η⁺` (meaningful for
`2 ≤ (orbitFract α N).card`). -/
noncomputable def etaPos (α : ℝ) (N : ℕ) : ℝ :=
  sInf (((orbitFract α N).erase 0 : Finset ℝ) : Set ℝ)

/-- **Layer 4.** The wrap-around gap from the largest point to `1`, `η⁻`. -/
noncomputable def etaNeg (α : ℝ) (N : ℕ) : ℝ :=
  1 - sSup ((orbitFract α N : Finset ℝ) : Set ℝ)

/-- **Layer 4, the three-gap theorem in its sharp form, uniform in `α`.** Every gap is one of
`η⁺`, `η⁻`, `η⁺ + η⁻`. -/
theorem gaps_toFinset_subset (α : ℝ) {N : ℕ} (hN : 2 ≤ (orbitFract α N).card) :
    (gaps α N).toFinset ⊆ {etaPos α N, etaNeg α N, etaPos α N + etaNeg α N} :=
  sorry

/-- **Layer 4, the three-gap theorem, uniform in `α`.** At most three distinct gap lengths. -/
theorem card_toFinset_gaps_le_three (α : ℝ) (N : ℕ) : (gaps α N).toFinset.card ≤ 3 :=
  sorry

/-- **Layer 4, gap lengths from the continued fraction** (the case `k ≥ 1`, written with the
index `k + 1`). For irrational `α` and `qₖ₊₁ < N ≤ qₖ₊₂`, with `m = ⌊(N − 1 − qₖ)/qₖ₊₁⌋`, the gap
lengths are among `|qₖ₊₁ α − pₖ₊₁|`, `|qₖ α − pₖ| − m |qₖ₊₁ α − pₖ₊₁|` and their sum. -/
theorem gaps_toFinset_subset_of_convDen_lt {α : ℝ} (hα : Irrational α) {N k : ℕ}
    (hk : ContFrac.convDen α (k + 1) < N) (hN : N ≤ ContFrac.convDen α (k + 2)) :
    (gaps α N).toFinset ⊆
      let e₁ := |ContFrac.convErr α (k + 1)|
      let e₀ := |ContFrac.convErr α k|
      let m : ℕ := (N - 1 - ContFrac.convDen α k) / ContFrac.convDen α (k + 1)
      ({e₁, e₀ - m * e₁, e₀ - m * e₁ + e₁} : Finset ℝ) :=
  sorry

/-- **Layer 4, the golden rotation.** Every gap is at most `φ²` times every other. -/
theorem gaps_goldenRatio_le_sq_mul {N : ℕ} (hN : 0 < N) :
    ∀ s ∈ gaps Real.goldenRatio N, ∀ t ∈ gaps Real.goldenRatio N,
      s ≤ Real.goldenRatio ^ 2 * t :=
  sorry

end Rotation

end TauCetiRoadmap.Equidistribution
