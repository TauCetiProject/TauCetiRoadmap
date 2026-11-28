import Mathlib
import TauCeti.Probability.Process.MarkovChain

/-!
# Runtime analysis of evolutionary algorithms: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the
definitions they need; every definition has a real body. Every headline theorem of the README is
statable at the pins and is stated here.

Layer 1 is about a real process `X` adapted to a filtration `ℱ` on a probability space. Drift
hypotheses are conditional expectations given `ℱ t`, required almost surely on the event that the
stopping time has not yet occurred, so that nothing is asked of the process after it stops. A
stopping time takes values in `ℕ∞`, and every mean is a lower integral in `ℝ≥0∞`: a time that is
infinite with positive probability has infinite mean. Each conclusion is stated on every event
of `ℱ 0`, which is the source's bound conditional on the start.

Layers 2 to 4 are about Markov chains: Tau Ceti's path law `markovChainLaw` of a kernel, and the
mean hitting time of a set (copied verbatim from HittingAndCoverTimes 1.1). The chains of Layers 3
and 4 live on `Fin n → Bool`; one step draws a mask from a fixed law, forms the exclusive or of
the current point with the mask, and moves there when the objective does not decrease.
-/

noncomputable section

open MeasureTheory ProbabilityTheory TauCeti.Probability Finset
open scoped ENNReal

namespace TauCetiRoadmap.RuntimeAnalysisOfEvolutionaryAlgorithms

/-! ## Layer 1: drift theorems for adapted processes -/

section Drift

variable {Ω : Type*} {m : MeasurableSpace Ω} {μ : Measure Ω} [IsProbabilityMeasure μ]
  {ℱ : Filtration ℕ m} {X : ℕ → Ω → ℝ}

/-- 1.1 **Additive drift, upper bound.** If `X` is nonnegative up to a stopping time `τ` and
`X t − E[X (t+1) | ℱ t] ≥ δ > 0` before `τ`, then `E[τ; A] ≤ E[X 0; A] / δ` for every `A ∈ ℱ 0`
(Kötzing–Krejca, Thm. 5, for an arbitrary stopping time). -/
theorem additiveDrift_upper (hX : Adapted ℱ X) (hint : ∀ t, Integrable (X t) μ)
    {τ : Ω → ℕ∞} (hτ : IsStoppingTime ℱ τ) {δ : ℝ} (hδ : 0 < δ)
    (hnonneg : ∀ t : ℕ, ∀ᵐ ω ∂μ, (t : ℕ∞) ≤ τ ω → 0 ≤ X t ω)
    (hdrift : ∀ t : ℕ, ∀ᵐ ω ∂μ, (t : ℕ∞) < τ ω → μ[X (t + 1) | ℱ t] ω ≤ X t ω - δ)
    {A : Set Ω} (hA : MeasurableSet[ℱ 0] A) :
    ∫⁻ ω in A, ENat.toENNReal (τ ω) ∂μ ≤ ENNReal.ofReal ((∫ ω in A, X 0 ω ∂μ) / δ) := by
  sorry

/-- 1.2 **Additive drift, lower bound.** If `X τ ≤ 0` whenever `τ` is finite,
`X t − E[X (t+1) | ℱ t] ≤ δ` with `δ > 0` and `E[|X (t+1) − X t| | ℱ t] ≤ c` before `τ`, then
`E[X 0; A] / δ ≤ E[τ; A]` for every `A ∈ ℱ 0` (Kötzing–Krejca, Thm. 7, for an arbitrary
stopping time). -/
theorem additiveDrift_lower (hX : Adapted ℱ X) (hint : ∀ t, Integrable (X t) μ)
    {τ : Ω → ℕ∞} (hτ : IsStoppingTime ℱ τ) {δ c : ℝ} (hδ : 0 < δ)
    (hstop : ∀ᵐ ω ∂μ, ∀ t : ℕ, τ ω = t → X t ω ≤ 0)
    (hdrift : ∀ t : ℕ, ∀ᵐ ω ∂μ, (t : ℕ∞) < τ ω → X t ω - δ ≤ μ[X (t + 1) | ℱ t] ω)
    (hstep : ∀ t : ℕ, ∀ᵐ ω ∂μ, (t : ℕ∞) < τ ω →
      μ[fun ω' => |X (t + 1) ω' - X t ω'| | ℱ t] ω ≤ c)
    {A : Set Ω} (hA : MeasurableSet[ℱ 0] A) :
    ENNReal.ofReal ((∫ ω in A, X 0 ω ∂μ) / δ) ≤ ∫⁻ ω in A, ENat.toENNReal (τ ω) ∂μ := by
  sorry

/-- 1.3 **Variable drift, upper bound.** Let `T` be the first time `X` drops below `xmin > 0`.
If `X 0 ≥ xmin`, `X` is nonnegative up to `T` and takes values in an interval `D ∋ xmin` before
`T`, and `X t − E[X (t+1) | ℱ t] ≥ h (X t)` before `T` for a function `h` that is monotone and
positive on `D`, then `E[T; A] ≤ (xmin / h xmin) P(A) + E[∫_{xmin}^{X 0} 1/h; A]` for every
`A ∈ ℱ 0` (Kötzing–Krejca, Thm. 9). -/
theorem variableDrift_upper (hX : Adapted ℱ X) (hint : ∀ t, Integrable (X t) μ)
    {xmin : ℝ} (hxmin : 0 < xmin) {D : Set ℝ} (hD : D.OrdConnected) (hxD : xmin ∈ D)
    {h : ℝ → ℝ} (hmono : MonotoneOn h D) (hpos : ∀ x ∈ D, 0 < h x)
    (hstart : ∀ᵐ ω ∂μ, xmin ≤ X 0 ω)
    (hnonneg : ∀ t : ℕ, ∀ᵐ ω ∂μ,
      (t : ℕ∞) ≤ hittingAfter X (Set.Iio xmin) 0 ω → 0 ≤ X t ω)
    (hmemD : ∀ t : ℕ, ∀ᵐ ω ∂μ, (t : ℕ∞) < hittingAfter X (Set.Iio xmin) 0 ω → X t ω ∈ D)
    (hdrift : ∀ t : ℕ, ∀ᵐ ω ∂μ, (t : ℕ∞) < hittingAfter X (Set.Iio xmin) 0 ω →
      h (X t ω) ≤ X t ω - μ[X (t + 1) | ℱ t] ω)
    {A : Set Ω} (hA : MeasurableSet[ℱ 0] A) :
    ∫⁻ ω in A, ENat.toENNReal (hittingAfter X (Set.Iio xmin) 0 ω) ∂μ ≤
      ENNReal.ofReal (xmin / h xmin * μ.real A + ∫ ω in A, (∫ z in xmin..X 0 ω, (h z)⁻¹) ∂μ) := by
  sorry

/-- 1.4 **Multiplicative drift, upper bound.** Let `T` be the first time `X` drops below
`xmin > 0`. If `X 0 ≥ xmin`, `X` is nonnegative up to `T` and `X t − E[X (t+1) | ℱ t] ≥ δ X t`
before `T` with `δ > 0`, then `E[T; A] ≤ (P(A) + E[log (X 0 / xmin); A]) / δ` for every `A ∈ ℱ 0`
(Kötzing–Krejca, Cor. 11). -/
theorem multiplicativeDrift_upper (hX : Adapted ℱ X) (hint : ∀ t, Integrable (X t) μ)
    {xmin δ : ℝ} (hxmin : 0 < xmin) (hδ : 0 < δ) (hstart : ∀ᵐ ω ∂μ, xmin ≤ X 0 ω)
    (hnonneg : ∀ t : ℕ, ∀ᵐ ω ∂μ,
      (t : ℕ∞) ≤ hittingAfter X (Set.Iio xmin) 0 ω → 0 ≤ X t ω)
    (hdrift : ∀ t : ℕ, ∀ᵐ ω ∂μ, (t : ℕ∞) < hittingAfter X (Set.Iio xmin) 0 ω →
      δ * X t ω ≤ X t ω - μ[X (t + 1) | ℱ t] ω)
    {A : Set Ω} (hA : MeasurableSet[ℱ 0] A) :
    ∫⁻ ω in A, ENat.toENNReal (hittingAfter X (Set.Iio xmin) 0 ω) ∂μ ≤
      ENNReal.ofReal ((μ.real A + ∫ ω in A, Real.log (X 0 ω / xmin) ∂μ) / δ) := by
  sorry

/-- 1.5 **Multiplicative drift, upper tail.** Let `T` be the first time `X` drops below
`xmin > 0`. If `X` is nonnegative up to `T` and `X t − E[X (t+1) | ℱ t] ≥ δ X t` before `T`, then
`P(A ∩ {T > t}) ≤ exp(−δ t) E[X 0; A] / xmin` for every `t ∈ ℕ` and every `A ∈ ℱ 0`
(the integer-time form of Lengler, Thm. 18, for every real `δ`). -/
theorem multiplicativeDrift_tail (hX : Adapted ℱ X) (hint : ∀ t, Integrable (X t) μ)
    {xmin δ : ℝ} (hxmin : 0 < xmin)
    (hnonneg : ∀ t : ℕ, ∀ᵐ ω ∂μ,
      (t : ℕ∞) ≤ hittingAfter X (Set.Iio xmin) 0 ω → 0 ≤ X t ω)
    (hdrift : ∀ t : ℕ, ∀ᵐ ω ∂μ, (t : ℕ∞) < hittingAfter X (Set.Iio xmin) 0 ω →
      δ * X t ω ≤ X t ω - μ[X (t + 1) | ℱ t] ω)
    {A : Set Ω} (hA : MeasurableSet[ℱ 0] A) (t : ℕ) :
    μ (A ∩ {ω | (t : ℕ∞) < hittingAfter X (Set.Iio xmin) 0 ω}) ≤
      ENNReal.ofReal (Real.exp (-δ * t) * (∫ ω in A, X 0 ω ∂μ) / xmin) := by
  sorry

end Drift

/-! ## Layer 2: drift and fitness levels for Markov chains -/

section MeanHittingTime

variable {S : Type*} [MeasurableSpace S] [MeasurableSingletonClass S]

/-- 2.1 (copied verbatim from HittingAndCoverTimes 1.1) The mean hitting time `E_ν τ_A` of a set
`A` by the chain with initial law `ν`, where `τ_A` is the first time `n ≥ 0` with `X_n ∈ A` and
`⊤` if there is none. -/
def meanHittingTime (κ : Kernel S S) [IsMarkovKernel κ] (ν : Measure S) (A : Set S) : ℝ≥0∞ :=
  ∫⁻ ω, ENat.toENNReal (hittingAfter (fun n (ω : ℕ → S) => ω n) A 0 ω) ∂markovChainLaw ν κ

/-- 2.1 **Drift bound for Markov chains.** If a measurable `g : S → ℝ≥0∞` satisfies
`∫ g dκ(x) + δ ≤ g x` off a measurable set `A`, with `δ > 0`, then the mean hitting time of `A`
from the initial law `ν` is at most `∫ g dν / δ`. -/
theorem meanHittingTime_le_of_drift (κ : Kernel S S) [IsMarkovKernel κ] (ν : Measure S)
    [IsProbabilityMeasure ν] {A : Set S} (hA : MeasurableSet A) {g : S → ℝ≥0∞}
    (hg : Measurable g) {δ : ℝ} (hδ : 0 < δ)
    (hdrift : ∀ x ∉ A, ∫⁻ y, g y ∂κ x + ENNReal.ofReal δ ≤ g x) :
    meanHittingTime κ ν A ≤ (∫⁻ x, g x ∂ν) / ENNReal.ofReal δ := by
  sorry

/-- 2.2 **The fitness-level method.** Let `f : S → ℕ` be measurable and `m ∈ ℕ`. If from every
`x` with `f x < m` the chain never moves to a lower level and moves to a strictly higher level
with probability at least `p (f x)`, then the mean time to reach `{f ≥ m}` from `ν` is at most
`∫ ∑_{f x ≤ i < m} 1 / p i dν(x)` (Doerr, Thm. 1.8.6, in expectation, for Markov chains). -/
theorem meanHittingTime_le_of_fitnessLevels (κ : Kernel S S) [IsMarkovKernel κ] (ν : Measure S)
    [IsProbabilityMeasure ν] {f : S → ℕ} (hf : Measurable f) (m : ℕ) (p : ℕ → ℝ≥0∞)
    (hlow : ∀ x, f x < m → κ x {y | f y < f x} = 0)
    (hup : ∀ x, f x < m → p (f x) ≤ κ x {y | f x < f y}) :
    meanHittingTime κ ν {y | m ≤ f y} ≤ ∫⁻ x, ∑ i ∈ Finset.Ico (f x) m, (p i)⁻¹ ∂ν := by
  sorry

end MeanHittingTime

/-! ## Layer 3: elitist mutation chains on bit strings; OneMax -/

section BitStrings

variable {n : ℕ}

/-- 3.1 The number of ones of a bit string. -/
def oneMax (x : Fin n → Bool) : ℕ := (univ.filter fun i => x i = true).card

/-- 3.1 The length of the longest all-ones prefix of a bit string: the number of positions `i`
such that `x j` is true for every `j ≤ i`. -/
def leadingOnes (x : Fin n → Bool) : ℕ :=
  (univ.filter fun i : Fin n => ∀ j ≤ i, x j = true).card

/-- 3.1 The offspring of `x` under the mask `m`: the coordinatewise exclusive or. -/
def offspring (x m : Fin n → Bool) : Fin n → Bool := fun i => xor (x i) (m i)

/-- 3.1 One elitist step: the offspring replaces `x` when its objective value is at least that
of `x`. -/
def elitistStep {β : Type*} [LinearOrder β] (f : (Fin n → Bool) → β) (x m : Fin n → Bool) :
    Fin n → Bool :=
  if f x ≤ f (offspring x m) then offspring x m else x

/-- 3.1 The elitist mutation chain of the objective `f` with mask law `M`: from `x`, draw a mask
`m` from `M` and move to `elitistStep f x m`. -/
def elitistKernel {β : Type*} [LinearOrder β] (f : (Fin n → Bool) → β)
    (M : Measure (Fin n → Bool)) : Kernel (Fin n → Bool) (Fin n → Bool) :=
  Kernel.ofFunOfCountable fun x => M.map (elitistStep f x)

/-- 3.1 The elitist mutation chain of a probability law of masks is a Markov kernel. -/
instance {β : Type*} [LinearOrder β] (f : (Fin n → Bool) → β) (M : Measure (Fin n → Bool))
    [IsProbabilityMeasure M] : IsMarkovKernel (elitistKernel f M) :=
  ⟨fun x => show IsProbabilityMeasure (M.map (elitistStep f x)) from inferInstance⟩

/-- 3.1 Standard bit mutation with rate `p`: the mask has independent coordinates, each true
(the bit is flipped) with probability `p`. -/
def bitFlipMask (n : ℕ) (p : unitInterval) : Measure (Fin n → Bool) :=
  Measure.pi fun _ => bernoulliMeasure true false p

/-- 3.1 The law of a standard bit mutation mask is a probability measure. -/
instance (n : ℕ) (p : unitInterval) : IsProbabilityMeasure (bitFlipMask n p) := by
  unfold bitFlipMask
  infer_instance

/-- 3.1 Random local search: the mask flips exactly one coordinate, chosen uniformly. -/
def rlsMask (n : ℕ) [NeZero n] : Measure (Fin n → Bool) :=
  (uniformOn (Set.univ : Set (Fin n))).map fun i j => decide (j = i)

/-- 3.1 The law of a random local search mask is a probability measure. -/
instance (n : ℕ) [NeZero n] : IsProbabilityMeasure (rlsMask n) := by
  unfold rlsMask
  infer_instance

/-- 3.2 **OneMax, upper bound.** For standard bit mutation with rate `1/n`, the mean time to reach
the all-ones string from a string with `k` zeros is at most `n H_k (1 − 1/n)^(−(n−1))`, and so at
most `e n (1 + log n)`. -/
theorem meanHittingTime_oneMax_le (p : unitInterval) (hp : (p : ℝ) = 1 / n)
    (x : Fin n → Bool) :
    meanHittingTime (elitistKernel oneMax (bitFlipMask n p)) (Measure.dirac x)
        {fun _ => true} ≤
      ENNReal.ofReal (n * (harmonic (n - oneMax x) : ℝ) / (1 - 1 / (n : ℝ)) ^ (n - 1)) ∧
    meanHittingTime (elitistKernel oneMax (bitFlipMask n p)) (Measure.dirac x)
        {fun _ => true} ≤
      ENNReal.ofReal (Real.exp 1 * n * (1 + Real.log n)) := by
  sorry

/-- 3.3 **Lower tail.** For any objective, any target point `x⋆`, standard bit mutation with any
rate `p` and a uniform start, the probability that `x⋆` has been reached by time `t` is at most
`(1 − (1 − p)^t / 2)^n`. -/
theorem hittingTime_le_prob_le {β : Type*} [LinearOrder β] (f : (Fin n → Bool) → β)
    (xstar : Fin n → Bool) (p : unitInterval) (t : ℕ) :
    markovChainLaw (uniformOn (Set.univ : Set (Fin n → Bool)))
        (elitistKernel f (bitFlipMask n p))
        {ω | hittingAfter (fun k (ω : ℕ → Fin n → Bool) => ω k) {xstar} 0 ω ≤ t} ≤
      ENNReal.ofReal ((1 - (1 - (p : ℝ)) ^ t / 2) ^ n) := by
  sorry

/-- 3.4 **Lower bound.** For any objective, any target point `x⋆`, standard bit mutation with
rate `1/n` and a uniform start, the mean time to reach `x⋆` is at least
`(1 − 1/e)(n − 1) log (n/2)`. -/
theorem meanHittingTime_ge_of_bitFlip {β : Type*} [LinearOrder β] (f : (Fin n → Bool) → β)
    (xstar : Fin n → Bool) (p : unitInterval) (hp : (p : ℝ) = 1 / n) :
    ENNReal.ofReal ((1 - Real.exp (-1)) * ((n : ℝ) - 1) * Real.log (n / 2)) ≤
      meanHittingTime (elitistKernel f (bitFlipMask n p))
        (uniformOn (Set.univ : Set (Fin n → Bool))) {xstar} := by
  sorry

/-- 3.5 **Random local search on OneMax.** From a string with `k` zeros, the mean time to reach
the all-ones string is exactly `n H_k`. -/
theorem meanHittingTime_rls_oneMax [NeZero n] (x : Fin n → Bool) :
    meanHittingTime (elitistKernel oneMax (rlsMask n)) (Measure.dirac x) {fun _ => true} =
      ENNReal.ofReal (n * (harmonic (n - oneMax x) : ℝ)) := by
  sorry

/-! ## Layer 4: LeadingOnes -/

/-- 4.1 **The LeadingOnes formula.** For any probability law `M` of masks and a uniform start,
the mean time to reach the all-ones string is `½ ∑_{i<n} 1 / q_i`, where `q_i` is the
probability that the mask is false at every position `j < i` and true at `i` (and `1/0 = ⊤`)
(Doerr, Thm. 3). -/
theorem meanHittingTime_leadingOnes (M : Measure (Fin n → Bool)) [IsProbabilityMeasure M] :
    meanHittingTime (elitistKernel leadingOnes M)
        (uniformOn (Set.univ : Set (Fin n → Bool))) {fun _ => true} =
      2⁻¹ * ∑ i : Fin n, (M {m | (∀ j < i, m j = false) ∧ m i = true})⁻¹ := by
  sorry

/-- 4.2 **LeadingOnes under standard bit mutation.** For `0 < p < 1` and a uniform start the
mean time to reach the all-ones string is `((1 − p)^(1−n) − (1 − p)) / (2 p²)`. -/
theorem meanHittingTime_leadingOnes_bitFlip (p : unitInterval) (hp0 : 0 < (p : ℝ))
    (hp1 : (p : ℝ) < 1) :
    meanHittingTime (elitistKernel leadingOnes (bitFlipMask n p))
        (uniformOn (Set.univ : Set (Fin n → Bool))) {fun _ => true} =
      ENNReal.ofReal (((1 - (p : ℝ)) ^ (1 - (n : ℤ)) - (1 - (p : ℝ))) / (2 * (p : ℝ) ^ 2)) := by
  sorry

/-- 4.3 **LeadingOnes with rate `1/n`.** For `n ≥ 2` the mean time from a uniform start lies
between `(n² + n)/2` and `((e − 1) n² + n)/2`. -/
theorem meanHittingTime_leadingOnes_bounds (hn : 2 ≤ n) (p : unitInterval)
    (hp : (p : ℝ) = 1 / n) :
    ENNReal.ofReal (((n : ℝ) ^ 2 + n) / 2) ≤
        meanHittingTime (elitistKernel leadingOnes (bitFlipMask n p))
          (uniformOn (Set.univ : Set (Fin n → Bool))) {fun _ => true} ∧
      meanHittingTime (elitistKernel leadingOnes (bitFlipMask n p))
          (uniformOn (Set.univ : Set (Fin n → Bool))) {fun _ => true} ≤
        ENNReal.ofReal (((Real.exp 1 - 1) * (n : ℝ) ^ 2 + n) / 2) := by
  sorry

end BitStrings

end TauCetiRoadmap.RuntimeAnalysisOfEvolutionaryAlgorithms
