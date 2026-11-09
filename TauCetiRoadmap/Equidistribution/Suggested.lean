/-
Copyright (c) 2026 The Tau Ceti contributors. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Mathlib.Topology.Instances.AddCircle.DenseSubgroup
import Mathlib.Dynamics.Ergodic.AddCircleAdd
import Mathlib.Analysis.Fourier.AddCircle
import Mathlib.Analysis.Normed.Group.AddCircle
import Mathlib.MeasureTheory.Measure.ProbabilityMeasure
import Mathlib.Dynamics.Ergodic.EmpiricalMeasure
import Mathlib.NumberTheory.DiophantineApproximation.Basic
import Mathlib.NumberTheory.DiophantineApproximation.ContinuedFractions
import Mathlib.Algebra.ContinuedFractions.Computation.ApproximationCorollaries
import Mathlib.NumberTheory.Real.GoldenRatio
import Mathlib.Data.Finset.Sort

/-!
# Equidistribution, three gaps and rhythm on the circle: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. The statements here suggest Lean forms for particular milestones, so that
contributors and reviewers converge on names and signatures; discharging all of them
finishes neither a layer nor the roadmap.

The file seeds one or two targets per layer: the `ℕ`-orbit density (Layer A), the definition
`UnifDistributed`, Weyl's criterion and the equidistribution of `n • a` (Layer B), the integer
convergent data, Lagrange's best-approximation theorem, Hurwitz's theorem and the golden
ratio's continued fraction (Layer C), and the three-gap theorem with its gap lengths through
convergents (Layer D). Every name declared here is the name the roadmap uses for the same
statement; everything introduced here is a target.

Conventions: the circle is `AddCircle T` with `[Fact (0 < T)]`, rotation is `(a + ·)`, the
`ℕ`-orbit is `(· • a : ℕ → AddCircle T)`; averages are against `AddCircle.haarAddCircle`;
`fourier k` is the character; points of `[0, 1)` are `Int.fract (n * α)`; continued fractions
are `GenContFract.of ξ` with denominators indexed from `0` and `q₀ = 1`; `φ = Real.goldenRatio`.
The imports are the specific modules the statements need.
-/

namespace TauCetiRoadmap.Equidistribution

open MeasureTheory Filter Topology Finset
open scoped Real

/-! ### Layer A: the orbit of a rotation -/

/-- **Layer A.** The `ℕ`-orbit of a point of the circle is dense iff the point has infinite
order; compare `AddCircle.denseRange_zsmul_iff`, which is the `ℤ`-orbit statement. -/
theorem AddCircle.denseRange_nsmul_iff {p : ℝ} [Fact (0 < p)] {a : AddCircle p} :
    DenseRange (· • a : ℕ → AddCircle p) ↔ addOrderOf a = 0 :=
  sorry

/-- **Layer A.** The rhythmic dichotomy: the `ℕ`-orbit is dense or finite, never both. -/
theorem AddCircle.denseRange_nsmul_xor_finite_range {p : ℝ} [Fact (0 < p)] (a : AddCircle p) :
    Xor (DenseRange (· • a : ℕ → AddCircle p)) (Set.range (· • a : ℕ → AddCircle p)).Finite :=
  sorry

/-- **Layer A.** For a rational multiple of the period, the `ℕ`-orbit has exactly `q.den`
points; compare `AddCircle.addOrderOf_coe_rat`. -/
theorem AddCircle.ncard_range_nsmul_coe_rat {p : ℝ} [Fact (0 < p)] (q : ℚ) :
    (Set.range (· • ((q * p : ℝ) : AddCircle p) : ℕ → AddCircle p)).ncard = q.den :=
  sorry

/-! ### Layer B: Weyl's criterion and the equidistribution of `nα` -/

namespace AddCircle

variable {T : ℝ} [hT : Fact (0 < T)]

/-- **Layer B.** A sequence in the circle is uniformly distributed when its Cesàro averages
of every continuous function converge to the Haar integral. -/
def UnifDistributed (x : ℕ → AddCircle T) : Prop :=
  ∀ f : C(AddCircle T, ℂ),
    Tendsto (fun N : ℕ => (N : ℂ)⁻¹ • ∑ n ∈ range N, f (x n)) atTop
      (𝓝 (∫ t, f t ∂AddCircle.haarAddCircle))

/-- **Layer B.** The empirical probability measure of the first `N` terms of a sequence
(`N ≥ 1`); the orbit form is Mathlib's `MeasureTheory.empiricalMeasure`. -/
noncomputable def seqEmpiricalMeasure (x : ℕ → AddCircle T) (N : ℕ) :
    ProbabilityMeasure (AddCircle T) :=
  sorry

/-- **Layer B.** On an orbit of the rotation the sequence form is Mathlib's orbit form. -/
theorem seqEmpiricalMeasure_const_add_nsmul (x₀ a : AddCircle T) (N : ℕ) :
    (seqEmpiricalMeasure (fun n : ℕ => x₀ + n • a) (N + 1) : Measure (AddCircle T)) =
      MeasureTheory.empiricalMeasure (a + ·) x₀ N :=
  sorry

/-- **Layer B.** Uniform distribution is weak convergence of the empirical measures to the
Haar probability measure, tested as in
`MeasureTheory.ProbabilityMeasure.tendsto_iff_forall_integral_tendsto`. -/
theorem unifDistributed_iff_tendsto_seqEmpiricalMeasure (x : ℕ → AddCircle T) :
    UnifDistributed x ↔
      Tendsto (seqEmpiricalMeasure x) atTop
        (𝓝 (AddCircle.haarAddCircle : Measure (AddCircle T)).toProbabilityMeasure) :=
  sorry

/-- **Layer B, Weyl's criterion.** Uniform distribution iff every nontrivial Weyl sum is
`o(N)`. The reverse direction is `span_fourier_closure_eq_top`; the forward direction is
`fourierCoeff_fourier`. -/
theorem unifDistributed_iff_forall_weylSum_tendsto_zero (x : ℕ → AddCircle T) :
    UnifDistributed x ↔
      ∀ k : ℤ, k ≠ 0 →
        Tendsto (fun N : ℕ => (N : ℂ)⁻¹ • ∑ n ∈ range N, fourier k (x n)) atTop (𝓝 0) :=
  sorry

/-- **Layer B.** A uniformly distributed sequence is dense. -/
theorem UnifDistributed.denseRange {x : ℕ → AddCircle T} (hx : UnifDistributed x) :
    DenseRange x :=
  sorry

/-- **Layer B, equidistribution of `nα`.** The `ℕ`-orbit of a point of infinite order is
uniformly distributed; the Weyl sums are geometric sums (`geom_sum_eq`, `fourier_norm`). -/
theorem unifDistributed_nsmul {a : AddCircle T} (ha : addOrderOf a = 0) :
    UnifDistributed (fun n : ℕ => n • a) :=
  sorry

/-- **Layer B.** The real form on the unit circle: for irrational `α`, the fractional parts
`{nα}` fall in `[u, v)` with asymptotic frequency `v − u`. -/
theorem tendsto_card_filter_fract_mem_Ico_div {α : ℝ} (hα : Irrational α) {u v : ℝ}
    (hu : 0 ≤ u) (huv : u ≤ v) (hv : v ≤ 1) :
    Tendsto (fun N : ℕ =>
        (((range N).filter fun n : ℕ => Int.fract ((n : ℝ) * α) ∈ Set.Ico u v).card : ℝ) / N)
      atTop (𝓝 (v - u)) :=
  sorry

end AddCircle

/-! ### Layer C: convergents, best approximations and Hurwitz -/

namespace Real

/-- **Layer C.** The integer numerators of the convergents of a real number, so that
`(GenContFract.of ξ).nums n = convNum ξ n`. -/
noncomputable def convNum (ξ : ℝ) (n : ℕ) : ℤ :=
  sorry

/-- **Layer C.** The natural-number denominators of the convergents of a real number, so that
`(GenContFract.of ξ).dens n = convDen ξ n` and `convDen ξ 0 = 1`
(`GenContFract.zeroth_den_eq_one`). -/
noncomputable def convDen (ξ : ℝ) (n : ℕ) : ℕ :=
  sorry

theorem coe_convNum (ξ : ℝ) (n : ℕ) : ((convNum ξ n : ℤ) : ℝ) = (GenContFract.of ξ).nums n :=
  sorry

theorem coe_convDen (ξ : ℝ) (n : ℕ) : ((convDen ξ n : ℕ) : ℝ) = (GenContFract.of ξ).dens n :=
  sorry

/-- **Layer C.** The convergent as a reduced fraction; compare `Real.convs_eq_convergent`. -/
theorem convergent_eq_convNum_div_convDen (ξ : ℝ) (n : ℕ) :
    Real.convergent ξ n = (convNum ξ n : ℚ) / (convDen ξ n : ℚ) :=
  sorry

/-- **Layer C.** The signed error `qₙ ξ − pₙ`. -/
noncomputable def convErr (ξ : ℝ) (n : ℕ) : ℝ :=
  convDen ξ n * ξ - convNum ξ n

/-- **Layer C.** Fibonacci growth of the denominators (compare
`GenContFract.succ_nth_fib_le_of_nth_den`). -/
theorem fib_succ_le_convDen (ξ : ℝ) (hξ : Irrational ξ) (n : ℕ) :
    Nat.fib (n + 1) ≤ convDen ξ n :=
  sorry

/-- **Layer C, Lagrange.** Convergent denominators are best approximations: no smaller positive
`q` brings `q ξ` closer to an integer than `qₙ ξ` is, for `n ≥ 1`. -/
theorem abs_convErr_le_norm_of_lt_convDen_succ {ξ : ℝ} (hξ : Irrational ξ) {n : ℕ}
    (hn : 1 ≤ n) {q : ℕ} (hq : 0 < q) (hq' : q < convDen ξ (n + 1)) :
    |convErr ξ n| ≤ ‖((q * ξ : ℝ) : UnitAddCircle)‖ :=
  sorry

/-- **Layer C, Hurwitz.** Infinitely many rationals satisfy `|ξ − p/q| < 1/(√5 q²)`;
compare `Real.infinite_rat_abs_sub_lt_one_div_den_sq_of_irrational`. The name and statement are
those of Mathlib pull request #43281, so that its landing replaces this target by an import. -/
theorem infinite_rat_abs_sub_lt_one_div_sqrt_five_mul_den_sq_of_irrational {ξ : ℝ}
    (hξ : Irrational ξ) :
    {t : ℚ | |ξ - t| < 1 / (√5 * (t.den : ℝ) ^ 2)}.Infinite :=
  sorry

/-- **Layer C, sharpness of Hurwitz at the golden ratio.** For every `c > √5` only finitely many
rationals satisfy `|φ − p/q| < 1/(c q²)`. -/
theorem finite_setOf_abs_goldenRatio_sub_lt_of_sqrt_five_lt {c : ℝ} (hc : √5 < c) :
    {q : ℚ | |goldenRatio - q| < 1 / (c * (q.den : ℝ) ^ 2)}.Finite :=
  sorry

/-- **Layer C.** The continued fraction of `φ` is `[1; 1, 1, 1, …]`. -/
theorem goldenRatio_partDens (n : ℕ) :
    (GenContFract.of goldenRatio).partDens.get? n = some (1 : ℝ) :=
  sorry

/-- **Layer C.** The convergent denominators of `φ` are the Fibonacci numbers. -/
theorem convDen_goldenRatio (n : ℕ) : convDen goldenRatio n = Nat.fib (n + 1) :=
  sorry

/-- **Layer C.** The exact error of the `n`-th convergent of `φ`; compare
`Real.fib_succ_sub_goldenRatio_mul_fib` (which gives `fib (n + 2) - φ * fib (n + 1) = ψ ^ (n + 1)`);
`convErr` is the negative of that left-hand side, hence the sign. -/
theorem convErr_goldenRatio (n : ℕ) : convErr goldenRatio n = -(goldenConj ^ (n + 1)) :=
  sorry

end Real

/-! ### Layer D: the three-gap theorem -/

namespace Rotation

/-- **Layer D.** The first `N` points of the rotation by `α`, as fractional parts in `[0, 1)`. -/
noncomputable def orbitFract (α : ℝ) (N : ℕ) : Finset ℝ :=
  (range N).image fun n : ℕ => Int.fract (n * α)

/-- **Layer D.** The multiset of gaps between consecutive points of `orbitFract α N`, including
the wrap-around gap from the largest point to `1`; the gaps sum to `1` for `N ≥ 1`. -/
noncomputable def gaps (α : ℝ) (N : ℕ) : Multiset ℝ :=
  sorry

/-- **Layer D.** The least positive point of the orbit, `η⁺` (meaningful for
`2 ≤ (orbitFract α N).card`). -/
noncomputable def etaPos (α : ℝ) (N : ℕ) : ℝ :=
  sInf (((orbitFract α N).erase 0 : Finset ℝ) : Set ℝ)

/-- **Layer D.** The wrap-around gap from the largest point to `1`, `η⁻`. -/
noncomputable def etaNeg (α : ℝ) (N : ℕ) : ℝ :=
  1 - sSup ((orbitFract α N : Finset ℝ) : Set ℝ)

theorem gaps_sum (α : ℝ) {N : ℕ} (hN : 0 < N) : (gaps α N).sum = 1 :=
  sorry

theorem card_gaps (α : ℝ) (N : ℕ) : Multiset.card (gaps α N) = (orbitFract α N).card :=
  sorry

/-- **Layer D, the three-gap theorem in its sharp form, uniform in `α`.** Every gap is one of
`η⁺`, `η⁻`, `η⁺ + η⁻`. -/
theorem gaps_toFinset_subset (α : ℝ) {N : ℕ} (hN : 2 ≤ (orbitFract α N).card) :
    (gaps α N).toFinset ⊆ {etaPos α N, etaNeg α N, etaPos α N + etaNeg α N} :=
  sorry

/-- **Layer D, the three-gap theorem, uniform in `α`.** At most three distinct gap lengths. -/
theorem card_toFinset_gaps_le_three (α : ℝ) (N : ℕ) : (gaps α N).toFinset.card ≤ 3 :=
  sorry

/-- **Layer D.** When three lengths occur they are `η⁺`, `η⁻` and their sum. -/
theorem gaps_toFinset_eq_of_card_eq_three (α : ℝ) (N : ℕ)
    (h : (gaps α N).toFinset.card = 3) :
    (gaps α N).toFinset = {etaPos α N, etaNeg α N, etaPos α N + etaNeg α N} :=
  sorry

/-- **Layer D, gap lengths from the continued fraction** (the case `k ≥ 1`, written with the
index `k + 1`). For irrational `α` and `qₖ₊₁ < N ≤ qₖ₊₂`, with `m = ⌊(N − 1 − qₖ)/qₖ₊₁⌋`, the gap
lengths are among `|qₖ₊₁ α − pₖ₊₁|`, `|qₖ α − pₖ| − m |qₖ₊₁ α − pₖ₊₁|` and their sum. -/
theorem gaps_toFinset_subset_of_convDen_lt {α : ℝ} (hα : Irrational α) {N k : ℕ}
    (hk : Real.convDen α (k + 1) < N) (hN : N ≤ Real.convDen α (k + 2)) :
    (gaps α N).toFinset ⊆
      let e₁ := |Real.convErr α (k + 1)|
      let e₀ := |Real.convErr α k|
      let m : ℕ := (N - 1 - Real.convDen α k) / Real.convDen α (k + 1)
      ({e₁, e₀ - m * e₁, e₀ - m * e₁ + e₁} : Finset ℝ) :=
  sorry

/-- **Layer D, the golden rotation.** Every gap is at most `φ²` times every other. -/
theorem gaps_goldenRatio_le_sq_mul {N : ℕ} (hN : 0 < N) :
    ∀ s ∈ gaps Real.goldenRatio N, ∀ t ∈ gaps Real.goldenRatio N,
      s ≤ Real.goldenRatio ^ 2 * t :=
  sorry

/-! ### Checks (the README's worked examples, as discriminating tests) -/

/-- Check (Layer A, non-example): the orbit of `1/2` on the unit circle is finite, so not dense. -/
example : ¬ DenseRange (· • ((1 / 2 : ℝ) : UnitAddCircle) : ℕ → UnitAddCircle) := by
  sorry

/-- Check (Layer B, non-example): a constant sequence is not uniformly distributed. -/
example (x₀ : UnitAddCircle) : ¬ AddCircle.UnifDistributed (fun _ : ℕ => x₀) := by
  sorry

/-- Check (Layer B): the orbit of `√2` on the unit circle is uniformly distributed. -/
example : AddCircle.UnifDistributed (fun n : ℕ => n • ((√2 : ℝ) : UnitAddCircle)) := by
  sorry

/-- Check (Layer C): the second convergent of `√2` is `7/5`. -/
example : Real.convNum (√2) 2 = 7 ∧ Real.convDen (√2) 2 = 5 := by
  sorry

/-- Check (Layer C): `convDen φ 4 = 5`. -/
example : Real.convDen Real.goldenRatio 4 = 5 := by
  sorry

/-- Check (Layer D, rational `α`): five beats of `1/3` give three points and one gap length. -/
example : (orbitFract (1 / 3) 5).card = 3 ∧ (gaps (1 / 3) 5).toFinset.card = 1 := by
  sorry

/-- Check (Layer D): the three gaps of `√2` at `N = 3`. -/
example : (gaps (√2) 3).toFinset = {√2 - 1, 3 - 2 * √2} := by
  sorry

/-- Check (Layer D): at `N = 5 = convDen φ 4` the golden rotation has exactly two gap lengths. -/
example : (gaps Real.goldenRatio 5).toFinset.card = 2 := by
  sorry

end Rotation

end TauCetiRoadmap.Equidistribution
