import Mathlib.Probability.Kernel.Invariance
import Mathlib.Probability.Process.HittingTime
import Mathlib.Probability.StrongLaw
import TauCeti.Probability.Process.MarkovChain

/-!
# Markov chains and renewal processes: suggested target signatures

**`README.md` is the definitive roadmap document.** This file is not the roadmap and is
not exhaustive: it records suggested Lean forms for selected milestones. Discharging
every statement here neither finishes a milestone nor the roadmap. The admitted proofs
are targets, not claimed implementations; definitions below have explicit bodies.

These examples consume Tau Ceti's existing path law, Mathlib's kernel powers, invariant
measures, and hitting times. Later interfaces must use the supplier APIs identified in
the README rather than opaque stand-ins for renewal or point-process hypotheses.
-/

noncomputable section

open MeasureTheory ProbabilityTheory Filter
open scoped ENNReal NNReal Topology

namespace TauCetiRoadmap.MarkovChainsAndRenewal

section Chains

variable {S : Type*} [MeasurableSpace S] [Countable S]
  [MeasurableSingletonClass S] [Nonempty S]
  (κ : Kernel S S) [IsMarkovKernel κ]

/-- Reachability includes the length-zero path. -/
def Reaches (x y : S) : Prop := ∃ n : ℕ, 0 < (κ ^ n) x {y}

/-- Countable-state irreducibility. -/
def Irreducible : Prop := ∀ x y : S, Reaches κ x y

/-- Strictly positive return lengths; a state with none has period zero. -/
def returnLengths (x : S) : Set ℕ := {n | 0 < n ∧ 0 < (κ ^ n) x {x}}

/-- First return, as opposed to entrance at time zero. -/
def firstReturn (x : S) : (ℕ → S) → WithTop ℕ :=
  hittingAfter (fun n (w : ℕ → S) => w n) {x} 1

/-- The extended expectation includes nonreturn as infinite time. -/
def meanReturn (x : S) : ℝ≥0∞ :=
  ∫⁻ w, (if h : firstReturn x w = ⊤ then ⊤
    else ((firstReturn x w).untop h : ℝ≥0∞)) ∂
    (TauCeti.Probability.markovChainLaw (Measure.dirac x) κ)

/-- Layer 0: the time-n marginal uses the existing homogeneous path law. -/
theorem markovChainLaw_map_eval (ν : Measure S) [IsProbabilityMeasure ν] (n : ℕ) :
    (TauCeti.Probability.markovChainLaw ν κ).map (fun w => w n) = (κ ^ n) ∘ₘ ν := by
  sorry

/-- Layer 2: recurrence is characterized by the divergent Green function. -/
theorem recurrent_iff_green_eq_top (x : S) :
    (TauCeti.Probability.markovChainLaw (Measure.dirac x) κ)
        {w | firstReturn x w < ⊤} = 1 ↔
      (∑' n : ℕ, (κ ^ n) x {x}) = ⊤ := by
  sorry

/-- Layer 3: finite irreducible chains have a unique invariant probability. -/
theorem existsUnique_invariant_probability [Finite S] (hκ : Irreducible κ) :
    ∃! π : Measure S, IsProbabilityMeasure π ∧ κ.Invariant π := by
  sorry

/-- Layer 3: Kac's singleton formula, without an aperiodicity hypothesis. -/
theorem invariant_mass_eq_inv_meanReturn (π : Measure S) [IsProbabilityMeasure π]
    (hκ : Irreducible κ) (hπ : κ.Invariant π) (x : S) :
    π {x} = (meanReturn κ x)⁻¹ := by
  sorry

/-- Layer 3: the singleton test for the existing detailed-balance predicate. -/
theorem isReversible_iff_singletons (π : Measure S) [IsProbabilityMeasure π] :
    κ.IsReversible π ↔ ∀ x y : S, π {x} * κ x {y} = π {y} * κ y {x} := by
  sorry

end Chains

section Renewals

variable {Ω : Type*} [MeasurableSpace Ω]

/-- `T 0` is the first increment; the artificial arrival at zero is `arrival T 0`. -/
def arrival (T : ℕ → Ω → ℝ≥0) (n : ℕ) (ω : Ω) : ℝ≥0 :=
  ∑ i ∈ Finset.range n, T i ω

/-- Count genuine arrivals, retaining multiplicities and genuine arrivals at zero. -/
def renewalCount (T : ℕ → Ω → ℝ≥0) (t : ℝ≥0) (ω : Ω) : ℝ≥0∞ :=
  ∑' n : ℕ, if arrival T (n + 1) ω ≤ t then 1 else 0

/-- Layer 4: measurability is available before almost-sure finiteness. -/
theorem measurable_renewalCount (T : ℕ → Ω → ℝ≥0)
    (hT : ∀ n, Measurable (T n)) (t : ℝ≥0) :
    Measurable (renewalCount T t) := by
  sorry

/-- Layer 4: nonnegative i.i.d. increments not concentrated at zero do not explode.
The almost-sure quantifier is outside the quantifier over all times. -/
theorem renewalCount_ae_finite (P : Measure Ω) [IsProbabilityMeasure P]
    (T : ℕ → Ω → ℝ≥0) (hT : ∀ n, Measurable (T n))
    (hindep : iIndepFun T P) (hid : ∀ n, IdentDistrib (T n) (T 0) P P)
    (hzero : P {ω | T 0 ω = 0} < 1) :
    ∀ᵐ ω ∂P, ∀ t : ℝ≥0, renewalCount T t ω < ⊤ := by
  sorry

end Renewals

end TauCetiRoadmap.MarkovChainsAndRenewal
