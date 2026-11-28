import Mathlib
import TauCeti.Probability.Distributions.Arcsine.Basic

/-!
# Random walk fluctuation theory: target signatures

The roadmap is `README.md` in this folder; this file is not the roadmap. It states the roadmap's
headline theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the few
definitions they need, all with real bodies.

The simple random walk is given by its steps on an arbitrary probability space: a sequence of
independent random variables, each with the uniform law on `{1, -1}` (in one dimension) or on the
`2d` unit vectors `± eⱼ` of `ℤ^d = Fin d → ℤ`. Its position at time `n` is the sum of the first `n`
steps, so it starts at `0`.

Every headline theorem of the README is statable at the pins and is stated here: the reflection
principle (1.2), the ballot theorem (1.3), the laws of the last zero and of the time spent
positive (2.1, 2.2), the arcsine limit for both (2.3), recurrence in dimension two (3.3) and
transience in every dimension at least three (3.4). The identity for avoiding zero (1.4) is the
case `k = 0` of the law of the last zero and is not stated separately.
-/

namespace TauCetiRoadmap.RandomWalkFluctuationTheory

open MeasureTheory ProbabilityTheory Filter Topology
open scoped ENNReal

/-! ## Layer 1: the simple random walk on the integers -/

/-- 1.1. The law of one step of the simple random walk on `ℤ`: mass `1/2` at `1` and at `-1`. -/
noncomputable def signLaw : Measure ℤ :=
  (2⁻¹ : ℝ≥0∞) • (Measure.dirac 1 + Measure.dirac (-1))

/-- 1.1. The position at time `n` of the walk with steps `ξ`: the sum of the steps `ξ 0, …,
ξ (n - 1)`, so that the walk is at `0` at time `0`. -/
def walk {Ω M : Type*} [AddCommMonoid M] (ξ : ℕ → Ω → M) (n : ℕ) (ω : Ω) : M :=
  ∑ i ∈ Finset.range n, ξ i ω

/-- 1.1. The steps `ξ` drive a simple random walk on `ℤ` under `P`: they are independent and each
has law `signLaw`. -/
structure IsSimpleRandomWalk {Ω : Type*} [MeasurableSpace Ω] (P : Measure Ω) (ξ : ℕ → Ω → ℤ) :
    Prop where
  hasLaw : ∀ i, HasLaw (ξ i) signLaw P
  indep : iIndepFun ξ P

variable {Ω : Type*} [MeasurableSpace Ω] {P : Measure Ω}

/-- 1.2. **The reflection principle.** For integers `a ≥ 0` and `b ≤ a`, the probability that the
walk reaches level `a` by time `n` and ends at `b` equals the probability that it ends at the
reflected point `2a - b`. -/
theorem measure_exists_le_walk_and_walk_eq {ξ : ℕ → Ω → ℤ} (h : IsSimpleRandomWalk P ξ)
    (n a : ℕ) (b : ℤ) (hb : b ≤ a) :
    P {ω | (∃ k ≤ n, (a : ℤ) ≤ walk ξ k ω) ∧ walk ξ n ω = b} =
      P {ω | walk ξ n ω = 2 * a - b} := by
  sorry

/-- 1.3. **The ballot theorem.** For every time `n` and every `k : ℕ`, `n` times the probability
that the walk stays strictly positive at times `1, …, n` and ends at `k` is `k` times the
probability that it ends at `k`. -/
theorem natCast_mul_measure_forall_pos_and_walk_eq {ξ : ℕ → Ω → ℤ}
    (h : IsSimpleRandomWalk P ξ) (n k : ℕ) :
    (n : ℝ≥0∞) * P {ω | (∀ j ∈ Finset.Icc 1 n, 0 < walk ξ j ω) ∧ walk ξ n ω = k} =
      k * P {ω | walk ξ n ω = k} := by
  sorry

/-! ## Layer 2: the arcsine laws -/

/-- 2.1. The time of the last visit to `0` up to time `n`: the largest `m ≤ n` with walk at `0`
(time `0` always qualifies). -/
def lastZero {Ω : Type*} (ξ : ℕ → Ω → ℤ) (n : ℕ) (ω : Ω) : ℕ :=
  ((Finset.range (n + 1)).filter fun m => walk ξ m ω = 0).sup id

/-- 2.2. The time spent positive up to time `n`: the number of steps `k ∈ {1, …, n}` whose segment
from `(k - 1, S_{k-1})` to `(k, S_k)` lies in the closed upper half-plane, that is, with
`S_{k-1} + S_k > 0`. -/
def timePositive {Ω : Type*} (ξ : ℕ → Ω → ℤ) (n : ℕ) (ω : Ω) : ℕ :=
  ((Finset.Icc 1 n).filter fun k => 0 < walk ξ (k - 1) ω + walk ξ k ω).card

/-- 2.1. **The law of the last zero.** For `k ≤ n`, the last zero up to time `2n` is at `2k` with
probability `u₂ₖ · u₂ₙ₋₂ₖ`, where `uₘ` is the probability that the walk is at `0` at time `m`.
For `k = 0` it gives the identity `P(S_j ≠ 0 for j = 1, …, 2n) = u₂ₙ` for avoiding zero (1.4). -/
theorem measure_lastZero_eq {ξ : ℕ → Ω → ℤ} (h : IsSimpleRandomWalk P ξ) {n k : ℕ}
    (hk : k ≤ n) :
    P {ω | lastZero ξ (2 * n) ω = 2 * k} =
      P {ω | walk ξ (2 * k) ω = 0} * P {ω | walk ξ (2 * (n - k)) ω = 0} := by
  sorry

/-- 2.2. **The law of the time spent positive.** For `k ≤ n`, the time spent positive up to time
`2n` equals `2k` with probability `u₂ₖ · u₂ₙ₋₂ₖ`, the same law as the last zero. -/
theorem measure_timePositive_eq {ξ : ℕ → Ω → ℤ} (h : IsSimpleRandomWalk P ξ) {n k : ℕ}
    (hk : k ≤ n) :
    P {ω | timePositive ξ (2 * n) ω = 2 * k} =
      P {ω | walk ξ (2 * k) ω = 0} * P {ω | walk ξ (2 * (n - k)) ω = 0} := by
  sorry

/-- 2.3. **The arcsine laws.** The last zero and the time spent positive up to time `2n`, divided
by `2n`, converge in distribution to Tau Ceti's arcsine law on `[0, 1]`. -/
theorem tendstoInDistribution_arcsine {ξ : ℕ → Ω → ℤ} [IsProbabilityMeasure P]
    (h : IsSimpleRandomWalk P ξ) :
    TendstoInDistribution (fun n ω => (lastZero ξ (2 * n) ω : ℝ) / (2 * n)) atTop id
        (fun _ => P) TauCeti.Probability.arcsineMeasure ∧
      TendstoInDistribution (fun n ω => (timePositive ξ (2 * n) ω : ℝ) / (2 * n)) atTop id
        (fun _ => P) TauCeti.Probability.arcsineMeasure := by
  sorry

/-! ## Layer 3: Pólya's theorem -/

/-- 3.1. The law of one step of the simple random walk on `ℤ^d`: mass `1/(2d)` at each of the
`2d` vectors `± eⱼ`. For `d = 0` it is the zero measure. -/
noncomputable def latticeStepLaw (d : ℕ) : Measure (Fin d → ℤ) :=
  ((2 * d : ℕ) : ℝ≥0∞)⁻¹ •
    ∑ j : Fin d, (Measure.dirac (Pi.single j 1) + Measure.dirac (-Pi.single j 1))

/-- 3.1. The steps `ξ` drive a simple random walk on `ℤ^d` under `P`: they are independent and each
has law `latticeStepLaw d`. -/
structure IsLatticeWalk (d : ℕ) {Ω : Type*} [MeasurableSpace Ω] (P : Measure Ω)
    (ξ : ℕ → Ω → Fin d → ℤ) : Prop where
  hasLaw : ∀ i, HasLaw (ξ i) (latticeStepLaw d) P
  indep : iIndepFun ξ P

/-- 3.3. **Pólya's theorem, dimension two.** The simple random walk on `ℤ²` is at the origin at
infinitely many times, almost surely. -/
theorem ae_frequently_walk_eq_zero_two {ξ : ℕ → Ω → Fin 2 → ℤ} (h : IsLatticeWalk 2 P ξ) :
    ∀ᵐ ω ∂P, ∃ᶠ n in atTop, walk ξ n ω = 0 := by
  sorry

/-- 3.4. **Pólya's theorem, dimensions three and more.** For `d ≥ 3`, the simple random walk on
`ℤ^d` returns to the origin at some positive time with probability strictly less than one. -/
theorem measure_exists_walk_eq_zero_lt_one {d : ℕ} (hd : 3 ≤ d) {ξ : ℕ → Ω → Fin d → ℤ}
    (h : IsLatticeWalk d P ξ) :
    P {ω | ∃ n, 1 ≤ n ∧ walk ξ n ω = 0} < 1 := by
  sorry

end TauCetiRoadmap.RandomWalkFluctuationTheory
