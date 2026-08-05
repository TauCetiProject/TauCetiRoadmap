/-
Copyright (c) 2026 Kitware, Inc. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Mathlib

/-!
# Berge's maximum theorem: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. The statements here suggest Lean forms for particular milestones, so that
contributors and reviewers converge on names and signatures; discharging all of them
finishes neither a Part nor the roadmap. `sorry` is allowed in this human-owned roadmap
library -- these are goals, not proofs.
-/

namespace TauCetiRoadmap.BergeMaximumTheorem

variable {P X : Type*} [TopologicalSpace P] [TopologicalSpace X]
variable {K : Set X} {g : P → X → ℝ}

/-! ## Part A -- a fixed compact feasible set -/

/-- Compactness form of approximate-minimizer stability: an approximate minimizing
sequence on a compact feasible set has a subsequence converging to a true minimizer.
It is the statement the Berge argument below consumes. -/
theorem exists_subseq_tendsto_isMinOn_of_approxMinOn [FirstCountableTopology X]
    (hK : IsCompact K) {F : X → ℝ} (hF : Continuous F)
    {z : ℕ → X} (hz : ∀ k, z k ∈ K)
    {ε : X → ℕ → ℝ} (hε : ∀ x ∈ K, Filter.Tendsto (ε x) Filter.atTop (nhds 0))
    (happrox : ∀ x ∈ K, ∀ k, F (z k) ≤ F x + ε x k) :
    ∃ φ : ℕ → ℕ, StrictMono φ ∧ ∃ ψ ∈ K, IsMinOn F K ψ ∧
      Filter.Tendsto (fun t => z (φ t)) Filter.atTop (nhds ψ) := sorry

/-- **Berge, argmin half**: the argmin correspondence over a fixed compact feasible set is
upper hemicontinuous, through Mathlib's own predicate.

The classical open-cover argument proves this with no countability or separation hypothesis
on `X`. `IsMinOn` rather than an invented argmin-set API: the predicate is Mathlib's. -/
theorem upperHemicontinuousAt_isMinOn
    (hK : IsCompact K) (hg : Continuous (Function.uncurry g)) (p₀ : P) :
    UpperHemicontinuousAt (fun p => {x ∈ K | IsMinOn (g p) K x}) p₀ := sorry

/-- **Berge, value half**: the value function is continuous. The first-countability
hypotheses and the nonemptiness of `K` are used by the proof. -/
theorem continuous_iInf_of_isCompact [FirstCountableTopology X] [FirstCountableTopology P]
    (hK : IsCompact K) (hKne : K.Nonempty) (hg : Continuous (Function.uncurry g)) :
    Continuous (fun p => ⨅ x : ↥K, g p ↑x) := sorry

/-! ## Part B -- a varying constraint

The two halves use *different* hypotheses on `K`, which is the content of the classical
proof and the reason the fixed-`K` case is a special case rather than a step: upper
semicontinuity of the value needs `K` upper hemicontinuous, lower semicontinuity needs it
lower hemicontinuous. -/

/-- **Berge, value half, varying constraint.** -/
theorem continuous_iInf_of_hemicontinuousAt [FirstCountableTopology P] [RegularSpace X]
    [T2Space X] [FirstCountableTopology X] [WeaklyLocallyCompactSpace X] {K : P → Set X}
    (hKcompact : ∀ p, IsCompact (K p)) (hKne : ∀ p, (K p).Nonempty)
    (hKu : ∀ p, UpperHemicontinuousAt K p) (hKl : ∀ p, LowerHemicontinuousAt K p)
    (hg : Continuous (Function.uncurry g)) :
    Continuous (fun p => ⨅ x : ↥(K p), g p ↑x) := sorry

/-- **Berge, argmin half, varying constraint.** Upper hemicontinuity keeps limits of
nearby feasible points feasible; lower hemicontinuity is separately needed so every feasible
competitor at the limiting parameter can be approximated nearby. Nonempty compact values
ensure the argmin correspondence is well-defined and nonempty. -/
theorem upperHemicontinuousAt_isMinOn_of_hemicontinuousAt [FirstCountableTopology P]
    [RegularSpace X] [T2Space X] [FirstCountableTopology X] [WeaklyLocallyCompactSpace X]
    {K : P → Set X}
    (hKcompact : ∀ p, IsCompact (K p)) (hKne : ∀ p, (K p).Nonempty)
    (hKu : ∀ p, UpperHemicontinuousAt K p) (hKl : ∀ p, LowerHemicontinuousAt K p)
    (hg : Continuous (Function.uncurry g)) (p₀ : P) :
    UpperHemicontinuousAt (fun p => {x ∈ K p | IsMinOn (g p) (K p) x}) p₀ := sorry

end TauCetiRoadmap.BergeMaximumTheorem
