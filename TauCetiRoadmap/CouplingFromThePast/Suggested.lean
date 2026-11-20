import Mathlib

/-!
# Coupling from the past: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib, each with `sorry`, together with the definitions
they need; every definition has a real body. Every headline theorem of the README is statable at
the pins and is stated here. The README's remaining targets, API lists and Checks are not
restated.

A random mapping representation of a kernel `κ` is a jointly measurable `f : S → ξ → S` with
`ρ.map (f x) = κ x` for every state `x`, where `ρ` is the common law of independent noise
variables `U i`. The definitions `tvToStationary`, `tvBetweenStarts` and `mixingTime` are copied
verbatim from MarkovChainMixing 1.2 and 1.3, which owns them; they are repeated here only because
a roadmap's Lean file cannot import another roadmap's module.

Suppliers used by the statements: Mathlib `ProbabilityTheory.iIndepFun`,
`ProbabilityTheory.HasLaw`, `ProbabilityTheory.Kernel.Invariant`, the kernel powers `κ ^ t`,
`MeasureTheory.tvDist` and `Order.height`.
-/

noncomputable section

open MeasureTheory ProbabilityTheory Finset
open scoped ENNReal

namespace TauCetiRoadmap.CouplingFromThePast

variable {S ξ Ω : Type*}

/-! ## Layer 1: random maps and their compositions -/

/-- 1.1: the backward composition `F_t = f(·, u 0) ∘ f(·, u 1) ∘ ⋯ ∘ f(·, u (t − 1))`, in which
`u k` is the noise of the step from time `−(k + 1)` to time `−k`. The oldest noise acts first. -/
def backwardMap (f : S → ξ → S) (u : ℕ → ξ) : ℕ → S → S
  | 0 => id
  | t + 1 => fun x => backwardMap f u t (f x (u t))

/-- 1.1: the forward composition `G_t = f(·, u (t − 1)) ∘ ⋯ ∘ f(·, u 0)`: the grand coupling of
the chains started from every state and driven by the same noise. -/
def forwardMap (f : S → ξ → S) (u : ℕ → ξ) : ℕ → S → S
  | 0 => id
  | t + 1 => fun x => f (forwardMap f u t x) (u t)

/-- 1.2: the backward composition of `t` independent random maps has the same law, as a random
element of `S → S`, as their forward composition. -/
theorem map_backwardMap_eq_map_forwardMap [MeasurableSpace S] [MeasurableSpace ξ]
    [MeasurableSpace Ω] {f : S → ξ → S} (hf : Measurable (Function.uncurry f))
    {U : ℕ → Ω → ξ} {P : Measure Ω} (hU : ∀ i, Measurable (U i)) (hindep : iIndepFun U P)
    {ρ : Measure ξ} (hlaw : ∀ i, HasLaw (U i) ρ P) (t : ℕ) :
    P.map (fun ω => backwardMap f (fun i => U i ω) t) =
      P.map (fun ω => forwardMap f (fun i => U i ω) t) :=
  sorry

/-- 1.2: for a random mapping representation of `κ`, the backward composition of `t` maps sends
the state `x` to a random state of law `κ^t(x, ·)`. -/
theorem map_backwardMap_apply [MeasurableSpace S] [MeasurableSpace ξ] [MeasurableSpace Ω]
    {f : S → ξ → S} (hf : Measurable (Function.uncurry f)) {U : ℕ → Ω → ξ} {P : Measure Ω}
    (hU : ∀ i, Measurable (U i)) (hindep : iIndepFun U P) {ρ : Measure ξ}
    (hlaw : ∀ i, HasLaw (U i) ρ P) {κ : Kernel S S} (hrep : ∀ x, ρ.map (f x) = κ x)
    (t : ℕ) (x : S) :
    P.map (fun ω => backwardMap f (fun i => U i ω) t x) = (κ ^ t) x :=
  sorry

/-! ## Definitions copied verbatim from MarkovChainMixing 1.2 and 1.3 -/

section CopiedFromMarkovChainMixing

variable [MeasurableSpace S]

/-- (copied verbatim from MarkovChainMixing 1.2) The distance to stationarity
`d(t) = max_x ‖κ^t(x, ·) − π‖_TV`, used in 3.2. -/
def tvToStationary [Fintype S] [Nonempty S] (κ : Kernel S S) (π : Measure S) (t : ℕ) : ℝ :=
  univ.sup' univ_nonempty fun x ↦ tvDist ((κ ^ t) x) π / 2

/-- (copied verbatim from MarkovChainMixing 1.2) The distance between starting points
`d̄(t) = max_{x,y} ‖κ^t(x, ·) − κ^t(y, ·)‖_TV`, used in 2.1 and 3.2. -/
def tvBetweenStarts [Fintype S] [Nonempty S] (κ : Kernel S S) (t : ℕ) : ℝ :=
  univ.sup' univ_nonempty fun p : S × S ↦ tvDist ((κ ^ t) p.1) ((κ ^ t) p.2) / 2

/-- (copied verbatim from MarkovChainMixing 1.3) The mixing time `t_mix(ε)`, the least `t` with
`d(t) ≤ ε`, and `⊤` if there is none, used in 3.2. -/
def mixingTime [Fintype S] [Nonempty S] (κ : Kernel S S) (π : Measure S) (ε : ℝ) : ℕ∞ :=
  ⨅ (t : ℕ) (_ : tvToStationary κ π t ≤ ε), (t : ℕ∞)

end CopiedFromMarkovChainMixing

/-! ## Layer 2: coalescence and exactness -/

/-- 2.1: the backward coalescence time, the least `t` at which the backward composition is
constant, and `⊤` if there is none. -/
def backwardCoalescenceTime (f : S → ξ → S) (u : ℕ → ξ) : ℕ∞ :=
  ⨅ (t : ℕ) (_ : ∀ x y, backwardMap f u t x = backwardMap f u t y), (t : ℕ∞)

/-- 2.1: the forward coalescence time, the least `t` at which the forward composition is
constant, and `⊤` if there is none. -/
def forwardCoalescenceTime (f : S → ξ → S) (u : ℕ → ξ) : ℕ∞ :=
  ⨅ (t : ℕ) (_ : ∀ x y, forwardMap f u t x = forwardMap f u t y), (t : ℕ∞)

/-- 2.1: the tail of the backward coalescence time is submultiplicative,
`P(T > s + t) ≤ P(T > s) · P(T > t)`. -/
theorem measureReal_lt_backwardCoalescenceTime_add_le [MeasurableSpace S] [Countable S]
    [MeasurableSingletonClass S] [MeasurableSpace ξ] [MeasurableSpace Ω] {f : S → ξ → S}
    (hf : Measurable (Function.uncurry f)) {U : ℕ → Ω → ξ} {P : Measure Ω}
    (hU : ∀ i, Measurable (U i)) (hindep : iIndepFun U P) {ρ : Measure ξ}
    (hlaw : ∀ i, HasLaw (U i) ρ P) (s t : ℕ) :
    P.real {ω | ((s + t : ℕ) : ℕ∞) < backwardCoalescenceTime f (fun i => U i ω)} ≤
      P.real {ω | (s : ℕ∞) < backwardCoalescenceTime f (fun i => U i ω)} *
        P.real {ω | (t : ℕ∞) < backwardCoalescenceTime f (fun i => U i ω)} :=
  sorry

/-- 2.1: the backward compositions coalesce almost surely if and only if some composition of
finitely many maps is constant with positive probability. -/
theorem ae_backwardCoalescenceTime_lt_top_iff [MeasurableSpace S] [Countable S]
    [MeasurableSingletonClass S] [MeasurableSpace ξ] [MeasurableSpace Ω] {f : S → ξ → S}
    (hf : Measurable (Function.uncurry f)) {U : ℕ → Ω → ξ} {P : Measure Ω}
    (hU : ∀ i, Measurable (U i)) (hindep : iIndepFun U P) {ρ : Measure ξ}
    (hlaw : ∀ i, HasLaw (U i) ρ P) :
    (∀ᵐ ω ∂P, backwardCoalescenceTime f (fun i => U i ω) < ⊤) ↔
      ∃ t : ℕ, 0 < P {ω | backwardCoalescenceTime f (fun i => U i ω) ≤ t} :=
  sorry

/-- 2.1: the backward and the forward coalescence times have the same law. -/
theorem map_backwardCoalescenceTime_eq_map_forwardCoalescenceTime [MeasurableSpace S]
    [Countable S] [MeasurableSingletonClass S] [MeasurableSpace ξ] [MeasurableSpace Ω]
    {f : S → ξ → S} (hf : Measurable (Function.uncurry f)) {U : ℕ → Ω → ξ} {P : Measure Ω}
    (hU : ∀ i, Measurable (U i)) (hindep : iIndepFun U P) {ρ : Measure ξ}
    (hlaw : ∀ i, HasLaw (U i) ρ P) :
    P.map (fun ω => backwardCoalescenceTime f (fun i => U i ω)) =
      P.map (fun ω => forwardCoalescenceTime f (fun i => U i ω)) :=
  sorry

/-- 2.1: for every random mapping representation, `d̄(t) ≤ P(T > t)`. -/
theorem tvBetweenStarts_le_measureReal_lt_backwardCoalescenceTime [MeasurableSpace S]
    [Fintype S] [Nonempty S] [MeasurableSingletonClass S] [MeasurableSpace ξ]
    [MeasurableSpace Ω] {f : S → ξ → S} (hf : Measurable (Function.uncurry f))
    {U : ℕ → Ω → ξ} {P : Measure Ω} (hU : ∀ i, Measurable (U i)) (hindep : iIndepFun U P)
    {ρ : Measure ξ} (hlaw : ∀ i, HasLaw (U i) ρ P) {κ : Kernel S S}
    (hrep : ∀ x, ρ.map (f x) = κ x) (t : ℕ) :
    tvBetweenStarts κ t ≤
      P.real {ω | (t : ℕ∞) < backwardCoalescenceTime f (fun i => U i ω)} :=
  sorry

/-- 2.2: **Propp and Wilson's theorem.** If the backward compositions coalesce almost surely,
their common value at the coalescence time has law `π` for every invariant probability `π`. -/
theorem hasLaw_backwardMap_backwardCoalescenceTime [MeasurableSpace S] [Countable S]
    [MeasurableSingletonClass S] [MeasurableSpace ξ] [MeasurableSpace Ω] {f : S → ξ → S}
    (hf : Measurable (Function.uncurry f)) {U : ℕ → Ω → ξ} {P : Measure Ω}
    (hU : ∀ i, Measurable (U i)) (hindep : iIndepFun U P) {ρ : Measure ξ}
    (hlaw : ∀ i, HasLaw (U i) ρ P) {κ : Kernel S S} (hrep : ∀ x, ρ.map (f x) = κ x)
    (π : Measure S) [IsProbabilityMeasure π] (hπ : κ.Invariant π)
    (hT : ∀ᵐ ω ∂P, backwardCoalescenceTime f (fun i => U i ω) < ⊤) (x : S) :
    HasLaw
      (fun ω => backwardMap f (fun i => U i ω) (backwardCoalescenceTime f (fun i => U i ω)).toNat x)
      π P :=
  sorry

/-- 2.2: if the backward compositions coalesce almost surely, the law of their common value at
the coalescence time is invariant for `κ`. -/
theorem invariant_map_backwardMap_backwardCoalescenceTime [MeasurableSpace S] [Countable S]
    [MeasurableSingletonClass S] [MeasurableSpace ξ] [MeasurableSpace Ω] {f : S → ξ → S}
    (hf : Measurable (Function.uncurry f)) {U : ℕ → Ω → ξ} {P : Measure Ω}
    (hU : ∀ i, Measurable (U i)) (hindep : iIndepFun U P) {ρ : Measure ξ}
    (hlaw : ∀ i, HasLaw (U i) ρ P) {κ : Kernel S S} (hrep : ∀ x, ρ.map (f x) = κ x)
    (hT : ∀ᵐ ω ∂P, backwardCoalescenceTime f (fun i => U i ω) < ⊤) (x : S) :
    κ.Invariant
      (P.map fun ω =>
        backwardMap f (fun i => U i ω) (backwardCoalescenceTime f (fun i => U i ω)).toNat x) :=
  sorry

/-! ## Layer 3: monotone updates -/

/-- 3.1: for an update that is monotone in the state for every noise value, on a partial order
with least and greatest elements, the backward and the forward compositions are constant exactly
when they agree at `⊥` and `⊤`, so both coalescence times are meeting times of the two extreme
trajectories. -/
theorem coalescenceTime_eq_iInf_bot_eq_top [PartialOrder S] [OrderBot S] [OrderTop S]
    {f : S → ξ → S} (hmono : ∀ v, Monotone fun x => f x v) (u : ℕ → ξ) :
    backwardCoalescenceTime f u =
        ⨅ (t : ℕ) (_ : backwardMap f u t ⊥ = backwardMap f u t ⊤), (t : ℕ∞) ∧
      forwardCoalescenceTime f u =
        ⨅ (t : ℕ) (_ : forwardMap f u t ⊥ = forwardMap f u t ⊤), (t : ℕ∞) :=
  sorry

/-- 3.2: for a monotone random mapping representation on a finite partial order with least and
greatest elements, `P(T > t) ≤ ℓ · d̄(t)`, where `ℓ` is the height of `⊤`, the largest number of
strict steps in a chain of states. -/
theorem measureReal_lt_backwardCoalescenceTime_le_height_mul [MeasurableSpace S] [Fintype S]
    [MeasurableSingletonClass S] [PartialOrder S] [OrderBot S] [OrderTop S]
    [MeasurableSpace ξ] [MeasurableSpace Ω] {f : S → ξ → S}
    (hf : Measurable (Function.uncurry f)) (hmono : ∀ v, Monotone fun x => f x v)
    {U : ℕ → Ω → ξ} {P : Measure Ω} (hU : ∀ i, Measurable (U i)) (hindep : iIndepFun U P)
    {ρ : Measure ξ} (hlaw : ∀ i, HasLaw (U i) ρ P) {κ : Kernel S S}
    (hrep : ∀ x, ρ.map (f x) = κ x) (t : ℕ) :
    P.real {ω | (t : ℕ∞) < backwardCoalescenceTime f (fun i => U i ω)} ≤
      (Order.height (⊤ : S)).toNat * tvBetweenStarts κ t :=
  sorry

/-- 3.2: for a monotone random mapping representation and a probability measure `π`, if
`t_mix(ε) ≤ t` then `P(T > j t) ≤ ℓ · (2ε)^j` for every `j`. -/
theorem measureReal_lt_backwardCoalescenceTime_mul_le [MeasurableSpace S] [Fintype S]
    [MeasurableSingletonClass S] [PartialOrder S] [OrderBot S] [OrderTop S]
    [MeasurableSpace ξ] [MeasurableSpace Ω] {f : S → ξ → S}
    (hf : Measurable (Function.uncurry f)) (hmono : ∀ v, Monotone fun x => f x v)
    {U : ℕ → Ω → ξ} {P : Measure Ω} (hU : ∀ i, Measurable (U i)) (hindep : iIndepFun U P)
    {ρ : Measure ξ} (hlaw : ∀ i, HasLaw (U i) ρ P) {κ : Kernel S S}
    (hrep : ∀ x, ρ.map (f x) = κ x) (π : Measure S) [IsProbabilityMeasure π] {ε : ℝ}
    {t : ℕ} (ht : mixingTime κ π ε ≤ t) (j : ℕ) :
    P.real {ω | ((j * t : ℕ) : ℕ∞) < backwardCoalescenceTime f (fun i => U i ω)} ≤
      (Order.height (⊤ : S)).toNat * (2 * ε) ^ j :=
  sorry

end TauCetiRoadmap.CouplingFromThePast
