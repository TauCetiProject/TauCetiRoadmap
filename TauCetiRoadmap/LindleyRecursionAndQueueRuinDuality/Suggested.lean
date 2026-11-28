import Mathlib
import TauCeti.Probability.Exchangeability.Basic

/-!
# Lindley recursion and queue–ruin duality: target signatures

The roadmap is `README.md` in this folder; this file is not the roadmap. It states the roadmap's
headline theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the
three definitions they need, all with real bodies: the Lindley recursion, the ruin probability,
copied verbatim from RuinTheory 1.1, and the transition kernel of the recursion.

The increments `ξ 0, ξ 1, …` are real numbers in Layer 1 and real random variables on a measurable
space `Ω` with a measure `P` in Layers 2 and 3; in the queueing reading `ξ n` is the service time of
the `n`-th customer minus the time between the arrivals of the `n`-th and the `(n + 1)`-st. The
walk at time `n` is the partial sum `∑ i ∈ Finset.range n, ξ i`, so it is `0` at time `0`. The
running maximum of the walk up to time `n` is a `Finset.sup'` over `Finset.range (n + 1)`, and its
supremum over all times enters only through the event that some partial sum is strictly larger
than `u`, so that no statement uses a supremum of an unbounded family.

Every headline theorem of the README is statable at the pins and is stated here: Lindley's
pathwise identity (1.2), the discrete Skorokhod problem (1.3), the equality in law with the
running maximum (2.1), the queue–ruin duality (2.2), the forgetting of the initial waiting time
(2.3), the preservation of an invariant law (3.2), the stationary law for negative drift (3.3),
the positive-drift case (3.4) and the M/M/1 stationary law (4.1).
-/

namespace TauCetiRoadmap.LindleyRecursionAndQueueRuinDuality

open MeasureTheory ProbabilityTheory Filter Topology Finset
open scoped ENNReal NNReal

/-! ## Layer 1: the recursion on real sequences -/

/-- 1.1. The Lindley recursion with initial value `w` driven by the real sequence `ξ`:
`lindley w ξ 0 = w` and `lindley w ξ (n + 1) = max (lindley w ξ n + ξ n) 0`. -/
noncomputable def lindley (w : ℝ) (ξ : ℕ → ℝ) : ℕ → ℝ
  | 0 => w
  | n + 1 => max (lindley w ξ n + ξ n) 0

/-- 1.2. **Lindley's pathwise identity.** For a real sequence `ξ` and `w ≥ 0`, the value of the
recursion at time `n` is the larger of `w + ξ 0 + ⋯ + ξ (n − 1)` and the largest of the sums
`ξ k + ⋯ + ξ (n − 1)` over `0 ≤ k ≤ n` (the empty sum, `k = n`, is `0`). -/
theorem lindley_eq_max_sup' {w : ℝ} (hw : 0 ≤ w) (ξ : ℕ → ℝ) (n : ℕ) :
    lindley w ξ n =
      max (w + ∑ i ∈ range n, ξ i)
        ((range (n + 1)).sup' nonempty_range_add_one fun k ↦ ∑ i ∈ Ico k n, ξ i) := by
  sorry

/-- 1.3. **The discrete Skorokhod problem.** Let `w ≥ 0`, let `ξ` be a real sequence and write
`x n = w + ξ 0 + ⋯ + ξ (n − 1)`. The recursion solves the reflection problem for `x`: it is
nonnegative, and the regulator `lindley w ξ n − x n` is nondecreasing in `n` and increases only
at times when the recursion is `0`. Conversely every pair `(z, l)` with `z n = x n + l n`,
`z ≥ 0`, `l 0 = 0`, `l` nondecreasing and increasing only at times when `z` is `0` has
`z = lindley w ξ`. -/
theorem lindley_solves_skorokhod_and_unique {w : ℝ} (hw : 0 ≤ w) (ξ : ℕ → ℝ) :
    ((∀ n, 0 ≤ lindley w ξ n) ∧
      Monotone (fun n ↦ lindley w ξ n - (w + ∑ i ∈ range n, ξ i)) ∧
      ∀ n, lindley w ξ n - (w + ∑ i ∈ range n, ξ i) <
          lindley w ξ (n + 1) - (w + ∑ i ∈ range (n + 1), ξ i) →
        lindley w ξ (n + 1) = 0) ∧
    ∀ z l : ℕ → ℝ, (∀ n, z n = w + (∑ i ∈ range n, ξ i) + l n) → (∀ n, 0 ≤ z n) →
      l 0 = 0 → Monotone l → (∀ n, l n < l (n + 1) → z (n + 1) = 0) → z = lindley w ξ := by
  sorry

/-! ## Layer 2: waiting times and the maximum of the walk -/

section RuinProb

variable {Ω : Type*} [MeasurableSpace Ω] {P : Measure Ω}

/-- 2.2. The ruin probability (copied verbatim from RuinTheory 1.1) from initial
capital `u` of the walk with increments `Y`: the probability that some partial sum
`∑ i ∈ Finset.range n, Y i`, `n ≥ 0`, is strictly larger than `u`. For `u < 0` the time `n = 0`
already gives ruin. -/
noncomputable def ruinProb (P : Measure Ω) (Y : ℕ → Ω → ℝ) (u : ℝ) : ℝ≥0∞ :=
  P {ω | ∃ n, u < ∑ i ∈ range n, Y i ω}

end RuinProb

variable {Ω : Type*} [MeasurableSpace Ω] {P : Measure Ω}

/-- 2.1. **The waiting time has the law of the running maximum.** If the increments are
measurable and the law of `(ξ 0, …, ξ (n − 1))` is invariant under permutations (in particular
for independent, identically distributed increments), the recursion started at `0` has at time
`n` the law of `max_{0 ≤ k ≤ n} (ξ 0 + ⋯ + ξ (k − 1))`. -/
theorem identDistrib_lindley_sup' (ξ : ℕ → Ω → ℝ) (hξ : ∀ i, Measurable (ξ i)) (n : ℕ)
    (hex : TauCeti.Probability.ExchangeableAt P ξ n) :
    IdentDistrib (fun ω ↦ lindley 0 (fun i ↦ ξ i ω) n)
      (fun ω ↦ (range (n + 1)).sup' nonempty_range_add_one fun k ↦ ∑ i ∈ range k, ξ i ω)
      P P := by
  sorry

/-- 2.2. **Queue–ruin duality.** For measurable exchangeable increments and every real `u`, the
probability that the waiting time at time `n` (started at `0`) is strictly larger than `u`
equals the probability of ruin from capital `u` by time `n`, it is nondecreasing in `n`, and it
tends to the ruin probability `ruinProb P ξ u`. -/
theorem measure_lt_lindley_tendsto_ruinProb (ξ : ℕ → Ω → ℝ) (hξ : ∀ i, Measurable (ξ i))
    (hex : TauCeti.Probability.Exchangeable P ξ) (u : ℝ) :
    (∀ n, P {ω | u < lindley 0 (fun i ↦ ξ i ω) n} =
        P {ω | ∃ k ≤ n, u < ∑ i ∈ range k, ξ i ω}) ∧
      Monotone (fun n ↦ P {ω | u < lindley 0 (fun i ↦ ξ i ω) n}) ∧
      Tendsto (fun n ↦ P {ω | u < lindley 0 (fun i ↦ ξ i ω) n}) atTop
        (𝓝 (ruinProb P ξ u)) := by
  sorry

/-- 2.3. **Forgetting the initial waiting time.** For measurable, independent, identically
distributed increments with strictly negative mean and a measurable initial waiting time
`W₀ ≥ 0` almost surely, with any dependence on the increments, the probability that the
waiting time at time `n` is strictly larger than `u` tends to `ruinProb P ξ u`, for every real
`u`. -/
theorem tendsto_measure_lt_lindley_of_integral_neg (ξ : ℕ → Ω → ℝ)
    (hξ : ∀ i, Measurable (ξ i)) (hindep : iIndepFun ξ P)
    (hid : ∀ i, IdentDistrib (ξ i) (ξ 0) P P) (hneg : ∫ ω, ξ 0 ω ∂P < 0)
    (W₀ : Ω → ℝ) (hW₀ : Measurable W₀) (hW₀nn : 0 ≤ᵐ[P] W₀) (u : ℝ) :
    Tendsto (fun n ↦ P {ω | u < lindley (W₀ ω) (fun i ↦ ξ i ω) n}) atTop
      (𝓝 (ruinProb P ξ u)) := by
  sorry

/-! ## Layer 3: the stationary law -/

/-- 3.1. The transition kernel of the Lindley recursion with increment law `m`: from
`x` it moves to `max (x + y) 0` with `y` drawn from `m`. For an s-finite `m`, its value at `x`
is the image of `m` under `y ↦ max (x + y) 0`. -/
noncomputable def lindleyKernel (m : Measure ℝ) : Kernel ℝ ℝ :=
  (Kernel.deterministic id measurable_id ×ₖ Kernel.const ℝ m).map fun p ↦ max (p.1 + p.2) 0

/-- 3.2. **Started from an invariant law, the waiting time keeps it.** For measurable,
independent, identically distributed increments and an initial waiting time `W₀` of law `ν`,
independent of the whole sequence of increments, where `ν` is invariant for the Lindley kernel of
the law of `ξ 0`, the waiting time at every time `n` has law `ν`. -/
theorem hasLaw_lindley_of_invariant (ξ : ℕ → Ω → ℝ) (hξ : ∀ i, Measurable (ξ i))
    (hindep : iIndepFun ξ P) (hid : ∀ i, IdentDistrib (ξ i) (ξ 0) P P) (W₀ : Ω → ℝ)
    {ν : Measure ℝ} (hW₀ : HasLaw W₀ ν P) (hW₀ξ : IndepFun W₀ (fun ω i ↦ ξ i ω) P)
    (hν : (lindleyKernel (P.map (ξ 0))).Invariant ν) (n : ℕ) :
    HasLaw (fun ω ↦ lindley (W₀ ω) (fun i ↦ ξ i ω) n) ν P := by
  sorry

/-- 3.3. **The stationary law for negative drift.** For measurable, independent, identically
distributed increments with strictly negative mean, the Lindley kernel of the law of `ξ 0` has
exactly one invariant probability measure `π`, and `π (Ioi u) = ruinProb P ξ u` for every real
`u`. -/
theorem invariant_lindleyKernel_of_integral_neg (ξ : ℕ → Ω → ℝ) (hξ : ∀ i, Measurable (ξ i))
    (hindep : iIndepFun ξ P) (hid : ∀ i, IdentDistrib (ξ i) (ξ 0) P P)
    (hneg : ∫ ω, ξ 0 ω ∂P < 0) :
    ∃ π : Measure ℝ, IsProbabilityMeasure π ∧ (lindleyKernel (P.map (ξ 0))).Invariant π ∧
      (∀ u, π (Set.Ioi u) = ruinProb P ξ u) ∧
      ∀ ν : Measure ℝ, IsProbabilityMeasure ν → (lindleyKernel (P.map (ξ 0))).Invariant ν →
        ν = π := by
  sorry

/-- 3.4. **Positive drift.** For measurable, independent, identically distributed increments
with strictly positive mean, the Lindley kernel of the law of `ξ 0` has no invariant probability
measure, and for every initial waiting time `W₀ ≥ 0` almost surely and every real `u` the
probability that the waiting time at time `n` is strictly larger than `u` tends to `1`. -/
theorem not_exists_invariant_lindleyKernel_of_integral_pos (ξ : ℕ → Ω → ℝ)
    (hξ : ∀ i, Measurable (ξ i)) (hindep : iIndepFun ξ P)
    (hid : ∀ i, IdentDistrib (ξ i) (ξ 0) P P) (hpos : 0 < ∫ ω, ξ 0 ω ∂P) :
    (¬ ∃ ν : Measure ℝ, IsProbabilityMeasure ν ∧ (lindleyKernel (P.map (ξ 0))).Invariant ν) ∧
      ∀ (W₀ : Ω → ℝ), 0 ≤ᵐ[P] W₀ → ∀ u : ℝ,
        Tendsto (fun n ↦ P {ω | u < lindley (W₀ ω) (fun i ↦ ξ i ω) n}) atTop (𝓝 1) := by
  sorry

/-! ## Layer 4: the M/M/1 queue -/

/-- 4.1. **The M/M/1 queue.** Let `0 < lam < mu` and `ρ = lam / mu`. For service times of
exponential law of rate `mu` and independent interarrival times of exponential law of rate
`lam`, the unique invariant probability measure of the Lindley kernel of the law of service
minus interarrival time is `(1 − ρ) δ₀ + ρ · Exp(mu − lam)`: an atom `1 − ρ` at `0` and an
exponential tail `ρ exp (−(mu − lam) u)` for `u ≥ 0`. -/
theorem invariant_lindleyKernel_mm1_iff {lam mu : ℝ} (hlam : 0 < lam) (hlt : lam < mu)
    (ν : Measure ℝ) [IsProbabilityMeasure ν] :
    (lindleyKernel (((expMeasure mu).prod (expMeasure lam)).map fun p ↦ p.1 - p.2)).Invariant
        ν ↔
      ν = ENNReal.ofReal (1 - lam / mu) • Measure.dirac 0 +
        ENNReal.ofReal (lam / mu) • expMeasure (mu - lam) := by
  sorry

end TauCetiRoadmap.LindleyRecursionAndQueueRuinDuality
