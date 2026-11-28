import Mathlib

/-!
# Blahut–Arimoto and alternating minimization: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib, each with `sorry`, together with the few
definitions they need; every definition has a real body. Every headline theorem of the README is
statable at the pins and is stated here.

A vector `p : α → ℝ` on a finite type is read as the finite measure `vecMeasure p`, with mass
`max (p a) 0` at `a`, and the divergence of two vectors is Mathlib's Kullback–Leibler divergence
`klDiv` of these measures, valued in `ℝ≥0∞`. Layers 1 and 2 work with nonnegative vectors (finite
measures), and sets of them are written out as subsets of `{p | ∀ a, 0 ≤ p a}`; a probability
vector has nonnegative entries summing to `1`. Logarithms are natural.

Channels, their mutual information, output law, information density and capacity are those of
ChannelCoding 1.1 and 1.3: the definitions `IsChannel`, `jointMeasure`,
`channelMutualInformation`, `outputLaw`, `informationDensity` and `channelCapacity`, and the
definitions `labelEntropy` and `finiteMutualInformation` they rest on
(ProbabilisticAndMetricNumberTheory §5.1a and §5.2, as ChannelCoding copies them), are copied
verbatim from ChannelCoding at commit 3ee689ed4 of its open pull request, because a roadmap's Lean
file does not import another roadmap. The Blahut–Arimoto
sequence `blahutArimoto W p₀` iterates the map `blahutArimotoStep W`.
-/

noncomputable section

open MeasureTheory ProbabilityTheory InformationTheory Finset Filter Topology
open scoped ENNReal

namespace TauCetiRoadmap.BlahutArimotoAndAlternatingMinimization

/-! ## Layer 1: divergence projections on a finite alphabet -/

/-- 1.0 The finite measure of a vector `p : α → ℝ` on a finite type: the point mass at `a`
carries `max (p a) 0`. -/
def vecMeasure {α : Type*} [Fintype α] [MeasurableSpace α] (p : α → ℝ) : Measure α :=
  ∑ a, ENNReal.ofReal (p a) • Measure.dirac a

/-- 1.0 The Kullback–Leibler divergence `D(p ‖ q)` of two vectors on a finite type: Mathlib's
`klDiv` of their measures. For probability vectors it is `∑ a, p a * log (p a / q a)` when
`q a = 0` forces `p a = 0`, and `∞` otherwise. -/
def klDivVec {α : Type*} [Fintype α] [MeasurableSpace α] (p q : α → ℝ) : ℝ≥0∞ :=
  klDiv (vecMeasure p) (vecMeasure q)

/-- 1.1 The Pythagorean inequality for I-projections. Let `S` be a convex set of nonnegative
vectors and `p'` a minimizer of `D(· ‖ Q)` on `S`, for a nonnegative vector `Q`. Then
`D(p ‖ p') + D(p' ‖ Q) ≤ D(p ‖ Q)` for every `p ∈ S`, and every letter charged by a member `p` of
`S` with `D(p ‖ Q) < ∞` is charged by `p'`. If `S` is moreover closed and nonempty, a minimizer
exists. -/
theorem klDivVec_add_klDivVec_le {α : Type*} [Fintype α] [MeasurableSpace α]
    [MeasurableSingletonClass α] {S : Set (α → ℝ)}
    (hS : S ⊆ {p | ∀ a, 0 ≤ p a}) (hconv : Convex ℝ S) {Q : α → ℝ} (hQ : ∀ a, 0 ≤ Q a) :
    (∀ p' ∈ S, (∀ p ∈ S, klDivVec p' Q ≤ klDivVec p Q) →
      (∀ p ∈ S, klDivVec p p' + klDivVec p' Q ≤ klDivVec p Q) ∧
      ∀ p ∈ S, klDivVec p Q ≠ ∞ → ∀ a, 0 < p a → 0 < p' a) ∧
    (IsClosed S → S.Nonempty → ∃ p' ∈ S, ∀ p ∈ S, klDivVec p' Q ≤ klDivVec p Q) := by
  sorry

/-- 1.2 I-projection onto a linear family. Let `Q` have positive entries and let the linear
family `L` of probability vectors `p` with `∑ a, p a * f i a = c i` for every `i` be nonempty.
Some `p' ∈ L` satisfies the Pythagorean identity `D(p ‖ Q) = D(p ‖ p') + D(p' ‖ Q)` for every
`p ∈ L`, and if `L` contains a vector with positive entries, `p'` lies in the exponential family
through `Q`: `p' a = C * Q a * exp (∑ i, θ i * f i a)`. -/
theorem exists_klDivVec_eq_add_linearFamily {α ι : Type*} [Fintype α] [MeasurableSpace α]
    [MeasurableSingletonClass α] [Fintype ι] (f : ι → α → ℝ) (c : ι → ℝ) {Q : α → ℝ}
    (hQ : ∀ a, 0 < Q a)
    (hL : ∃ p : α → ℝ, ((∀ a, 0 ≤ p a) ∧ ∑ a, p a = 1) ∧ ∀ i, ∑ a, p a * f i a = c i) :
    ∃ p' : α → ℝ, ((∀ a, 0 ≤ p' a) ∧ ∑ a, p' a = 1) ∧ (∀ i, ∑ a, p' a * f i a = c i) ∧
      (∀ p : α → ℝ, ((∀ a, 0 ≤ p a) ∧ ∑ a, p a = 1) → (∀ i, ∑ a, p a * f i a = c i) →
        klDivVec p Q = klDivVec p p' + klDivVec p' Q) ∧
      ((∃ p : α → ℝ, ((∀ a, 0 < p a) ∧ ∑ a, p a = 1) ∧ ∀ i, ∑ a, p a * f i a = c i) →
        ∃ θ : ι → ℝ, ∃ C : ℝ, ∀ a, p' a = C * Q a * Real.exp (∑ i, θ i * f i a)) := by
  sorry

/-- 1.3 The four-point property of reverse I-projections. Let `S` be a convex set of nonnegative
vectors, `P` a nonnegative vector with `D(P ‖ q) < ∞` for some `q ∈ S`, and `q' ∈ S`. Then `q'`
minimizes `D(P ‖ ·)` on `S` if and only if `D(P' ‖ q') ≤ D(P' ‖ q) + D(P' ‖ P)` for every
nonnegative vector `P'` and every `q ∈ S`. -/
theorem forall_klDivVec_le_iff {α : Type*} [Fintype α] [MeasurableSpace α]
    [MeasurableSingletonClass α] {S : Set (α → ℝ)}
    (hS : S ⊆ {p | ∀ a, 0 ≤ p a}) (hconv : Convex ℝ S) {P : α → ℝ}
    (hP : ∀ a, 0 ≤ P a) (hfin : ∃ q ∈ S, klDivVec P q ≠ ∞) {q' : α → ℝ}
    (hq' : q' ∈ S) :
    (∀ q ∈ S, klDivVec P q' ≤ klDivVec P q) ↔
      ∀ P' : α → ℝ, (∀ a, 0 ≤ P' a) → ∀ q ∈ S,
        klDivVec P' q' ≤ klDivVec P' q + klDivVec P' P := by
  sorry

/-! ## Layer 2: alternating minimization of divergence -/

/-- 2.1 The telescoping bound for alternating minimization. Let `P` and `Q` be convex sets of
nonnegative vectors, `p n ∈ P` a minimizer of `D(· ‖ q n)` on `P` and `q (n + 1) ∈ Q` a
minimizer of `D(p n ‖ ·)` on `Q`, with `D(p 0 ‖ q 0) < ∞`. Then `D(p n ‖ q n)` is nonincreasing
and `n D(p n ‖ q n) ≤ n D(x ‖ y) + D(x ‖ p 0)` for all `x ∈ P`, `y ∈ Q` and `n`. -/
theorem antitone_and_mul_klDivVec_le {α : Type*} [Fintype α] [MeasurableSpace α]
    [MeasurableSingletonClass α] {P Q : Set (α → ℝ)}
    (hP : P ⊆ {p | ∀ a, 0 ≤ p a}) (hQ : Q ⊆ {p | ∀ a, 0 ≤ p a})
    (hPc : Convex ℝ P) (hQc : Convex ℝ Q) {p q : ℕ → α → ℝ} (hp : ∀ n, p n ∈ P)
    (hq : ∀ n, q n ∈ Q) (hpmin : ∀ n, ∀ x ∈ P, klDivVec (p n) (q n) ≤ klDivVec x (q n))
    (hqmin : ∀ n, ∀ y ∈ Q, klDivVec (p n) (q (n + 1)) ≤ klDivVec (p n) y)
    (hfin : klDivVec (p 0) (q 0) ≠ ∞) :
    Antitone (fun n => klDivVec (p n) (q n)) ∧
      ∀ x ∈ P, ∀ y ∈ Q, ∀ n : ℕ,
        (n : ℝ≥0∞) * klDivVec (p n) (q n) ≤ n * klDivVec x y + klDivVec x (p 0) := by
  sorry

/-- 2.2 Convergence of alternating minimization. Under the hypotheses of 2.1 without the
finiteness of `D(p 0 ‖ q 0)`, if every letter charged by some member of `Q` is charged by `q 0`,
then `D(p n ‖ q n)` tends to the infimum of `D(x ‖ y)` over `x ∈ P` and `y ∈ Q`. -/
theorem tendsto_klDivVec_alternating {α : Type*} [Fintype α] [MeasurableSpace α]
    [MeasurableSingletonClass α] {P Q : Set (α → ℝ)}
    (hP : P ⊆ {p | ∀ a, 0 ≤ p a}) (hQ : Q ⊆ {p | ∀ a, 0 ≤ p a})
    (hPc : Convex ℝ P) (hQc : Convex ℝ Q) {p q : ℕ → α → ℝ} (hp : ∀ n, p n ∈ P)
    (hq : ∀ n, q n ∈ Q) (hpmin : ∀ n, ∀ x ∈ P, klDivVec (p n) (q n) ≤ klDivVec x (q n))
    (hqmin : ∀ n, ∀ y ∈ Q, klDivVec (p n) (q (n + 1)) ≤ klDivVec (p n) y)
    (hsupp : ∀ y ∈ Q, ∀ a, 0 < y a → 0 < q 0 a) :
    Tendsto (fun n => klDivVec (p n) (q n)) atTop
      (𝓝 (⨅ x ∈ P, ⨅ y ∈ Q, klDivVec x y)) := by
  sorry

/-! ## Layer 3: capacity of a finite channel -/

/-- 3.0 The entropy, in nats, of a label `X : Ω → A` into a finite type:
`∑ a, negMulLog (μ (X = a))`. Copied from ProbabilisticAndMetricNumberTheory §5.1a, verbatim
as ChannelCoding 1.1 copies it. -/
def labelEntropy {Ω A : Type*} [MeasurableSpace Ω] [Fintype A] (μ : Measure Ω) (X : Ω → A) :
    ℝ :=
  ∑ a, Real.negMulLog (μ.real (X ⁻¹' {a}))

/-- 3.0 The finite mutual information `I(X, Y) = H(X) + H(Y) - H((X, Y))` of two labels into
finite types. Copied from ProbabilisticAndMetricNumberTheory §5.2, verbatim as ChannelCoding 1.1
copies it. -/
def finiteMutualInformation {Ω A B : Type*} [MeasurableSpace Ω] [Fintype A] [Fintype B]
    (μ : Measure Ω) (X : Ω → A) (Y : Ω → B) : ℝ :=
  labelEntropy μ X + labelEntropy μ Y - labelEntropy μ (fun ω => (X ω, Y ω))

/-- 3.0 A channel from `A` to `B`: a matrix with nonnegative entries whose rows sum to `1`;
`W a b` is the probability of the output `b` when the input is `a`. Copied verbatim from
ChannelCoding 1.1. -/
def IsChannel {A B : Type*} [Fintype B] (W : A → B → ℝ) : Prop :=
  (∀ a b, 0 ≤ W a b) ∧ ∀ a, ∑ b, W a b = 1

/-- 3.0 The joint law on `A × B` of an input drawn from `p` and the output of the channel `W`:
the point mass at `(a, b)` carries `p a * W a b`. Copied verbatim from ChannelCoding 1.1. -/
def jointMeasure {A B : Type*} [Fintype A] [Fintype B] [MeasurableSpace A] [MeasurableSpace B]
    (p : A → ℝ) (W : A → B → ℝ) : Measure (A × B) :=
  ∑ x : A × B, ENNReal.ofReal (p x.1 * W x.1 x.2) • Measure.dirac x

/-- 3.0 The mutual information `I(p, W)` of the input and the output of the channel `W` with
input law `p`: the finite mutual information of the two coordinates under `jointMeasure p W`.
Copied verbatim from ChannelCoding 1.1. -/
def channelMutualInformation {A B : Type*} [Fintype A] [Fintype B] [MeasurableSpace A]
    [MeasurableSpace B] (p : A → ℝ) (W : A → B → ℝ) : ℝ :=
  finiteMutualInformation (jointMeasure p W) Prod.fst Prod.snd

/-- 3.0 The output law `q b = ∑ a, p a * W a b` of the channel `W` with input law `p`. Copied
verbatim from ChannelCoding 1.1. -/
def outputLaw {A B : Type*} [Fintype A] (p : A → ℝ) (W : A → B → ℝ) (b : B) : ℝ :=
  ∑ a, p a * W a b

/-- 3.0 The information density `i(a; b) = log (W a b / q b)`, where `q` is the output law.
Copied verbatim from ChannelCoding 1.1. -/
def informationDensity {A B : Type*} [Fintype A] (p : A → ℝ) (W : A → B → ℝ) (a : A) (b : B) :
    ℝ :=
  Real.log (W a b / outputLaw p W b)

/-- 3.0 The capacity `C(W)` of a channel: the supremum of `I(p, W)` over the input laws. Copied
verbatim from ChannelCoding 1.3. -/
def channelCapacity {A B : Type*} [Fintype A] [Fintype B] [MeasurableSpace A]
    [MeasurableSpace B] (W : A → B → ℝ) : ℝ :=
  sSup ((fun p => channelMutualInformation p W) '' {p : A → ℝ | (∀ a, 0 ≤ p a) ∧ ∑ a, p a = 1})

section Capacity

variable {A B : Type*} [Fintype A] [Fintype B] [MeasurableSpace A] [MeasurableSingletonClass A]
  [MeasurableSpace B] [MeasurableSingletonClass B]

/-- 3.1 The golden formula: for a channel `W`, an input law `p` and every nonnegative vector `Q`
on the outputs, `∑ a, p a * D(W a ‖ Q) = I(p, W) + D(q ‖ Q)`, where `q` is the output law. -/
theorem sum_mul_klDivVec_eq {W : A → B → ℝ} (hW : IsChannel W) {p : A → ℝ}
    (hp : (∀ a, 0 ≤ p a) ∧ ∑ a, p a = 1) {Q : B → ℝ} (hQ : ∀ b, 0 ≤ Q b) :
    ∑ a, ENNReal.ofReal (p a) * klDivVec (W a) Q =
      ENNReal.ofReal (channelMutualInformation p W) + klDivVec (outputLaw p W) Q := by
  sorry

/-- 3.2 The Kuhn–Tucker conditions: an input law `p` attains the capacity if and only if, for
some constant `c`, `D(W a ‖ q) = c` for every input `a` with `p a > 0` and `D(W a ‖ q) ≤ c` for
every input `a`, where `q` is the output law of `p`; and then `D(W a ‖ q) = C(W)` for every `a`
with `p a > 0`. -/
theorem channelMutualInformation_eq_channelCapacity_iff {W : A → B → ℝ} (hW : IsChannel W)
    {p : A → ℝ} (hp : (∀ a, 0 ≤ p a) ∧ ∑ a, p a = 1) :
    (channelMutualInformation p W = channelCapacity W ↔
      ∃ c : ℝ≥0∞, (∀ a, 0 < p a → klDivVec (W a) (outputLaw p W) = c) ∧
        ∀ a, klDivVec (W a) (outputLaw p W) ≤ c) ∧
    (channelMutualInformation p W = channelCapacity W →
      ∀ a, 0 < p a → klDivVec (W a) (outputLaw p W) = ENNReal.ofReal (channelCapacity W)) := by
  sorry

/-- 3.3 Capacity as a divergence radius: on a nonempty input alphabet, the capacity is the least
value of `max_a D(W a ‖ Q)` over the probability vectors `Q` on the outputs, and the only `Q`
attaining it is the output law of any input law attaining the capacity. -/
theorem isLeast_iSup_klDivVec [Nonempty A] {W : A → B → ℝ} (hW : IsChannel W) :
    IsLeast ((fun Q => ⨆ a, klDivVec (W a) Q) '' {Q : B → ℝ | (∀ b, 0 ≤ Q b) ∧ ∑ b, Q b = 1})
        (ENNReal.ofReal (channelCapacity W)) ∧
      ∀ p : A → ℝ, ((∀ a, 0 ≤ p a) ∧ ∑ a, p a = 1) →
        channelMutualInformation p W = channelCapacity W →
        ∀ Q : B → ℝ, ((∀ b, 0 ≤ Q b) ∧ ∑ b, Q b = 1) →
          (⨆ a, klDivVec (W a) Q) ≤ ENNReal.ofReal (channelCapacity W) → Q = outputLaw p W := by
  sorry

end Capacity

/-! ## Layer 4: the Blahut–Arimoto sequence -/

/-- 4.0 One Blahut–Arimoto update of an input law `p`: the input `a` is reweighted by
`exp (∑ b, W a b * i(a; b))`, the exponential of the divergence of the row `W a` from the
output law, and the result is normalized. -/
def blahutArimotoStep {A B : Type*} [Fintype A] [Fintype B] (W : A → B → ℝ) (p : A → ℝ) (a : A) : ℝ :=
  p a * Real.exp (∑ b, W a b * informationDensity p W a b) /
    ∑ a', p a' * Real.exp (∑ b, W a' b * informationDensity p W a' b)

/-- 4.0 The Blahut–Arimoto sequence started at `p₀`: the `n`-th iterate of
`blahutArimotoStep W`. -/
def blahutArimoto {A B : Type*} [Fintype A] [Fintype B] (W : A → B → ℝ) (p₀ : A → ℝ) (n : ℕ) : A → ℝ :=
  (blahutArimotoStep W)^[n] p₀

section BlahutArimoto

variable {A B : Type*} [Fintype A] [Fintype B] [MeasurableSpace A] [MeasurableSingletonClass A]
  [MeasurableSpace B] [MeasurableSingletonClass B]

/-- 4.1 Arimoto's sandwich: for a channel and an input law `p`, with
`Z = ∑ a, p a * exp (∑ b, W a b * i(a; b))`, the mutual information of `p` is at most `log Z`,
and `log Z` is at most the mutual information of the updated law. -/
theorem channelMutualInformation_le_log_le {W : A → B → ℝ} (hW : IsChannel W) {p : A → ℝ}
    (hp : (∀ a, 0 ≤ p a) ∧ ∑ a, p a = 1) :
    channelMutualInformation p W ≤
        Real.log (∑ a, p a * Real.exp (∑ b, W a b * informationDensity p W a b)) ∧
      Real.log (∑ a, p a * Real.exp (∑ b, W a b * informationDensity p W a b)) ≤
        channelMutualInformation (blahutArimotoStep W p) W := by
  sorry

/-- 4.2 The rate of the Blahut–Arimoto sequence. For an input law `p'` attaining the capacity
and an input law `p₀` charging every input that `p'` charges,
`n (C(W) - I(pₙ, W)) ≤ ∑ a, p' a * log (p' a / p₀ a) = D(p' ‖ p₀)` for every `n`; from the
uniform law the bound is `log |A|`. -/
theorem mul_channelCapacity_sub_le {W : A → B → ℝ} (hW : IsChannel W) :
    (∀ p₀ : A → ℝ, ((∀ a, 0 ≤ p₀ a) ∧ ∑ a, p₀ a = 1) →
      ∀ p' : A → ℝ, ((∀ a, 0 ≤ p' a) ∧ ∑ a, p' a = 1) →
        channelMutualInformation p' W = channelCapacity W → (∀ a, 0 < p' a → 0 < p₀ a) →
        ∀ n : ℕ,
          n * (channelCapacity W - channelMutualInformation (blahutArimoto W p₀ n) W) ≤
            ∑ a, p' a * Real.log (p' a / p₀ a)) ∧
    ∀ n : ℕ, n * (channelCapacity W -
        channelMutualInformation (blahutArimoto W (fun _ => (Fintype.card A : ℝ)⁻¹) n) W) ≤
      Real.log (Fintype.card A) := by
  sorry

/-- 4.3 Convergence of the Blahut–Arimoto sequence from an input law with positive entries: the
mutual information and the upper bound `max_a D(W a ‖ qₙ)` tend to the capacity, and the laws
converge to an input law attaining the capacity. -/
theorem tendsto_blahutArimoto {W : A → B → ℝ} (hW : IsChannel W) {p₀ : A → ℝ}
    (hp₀ : (∀ a, 0 < p₀ a) ∧ ∑ a, p₀ a = 1) :
    Tendsto (fun n => channelMutualInformation (blahutArimoto W p₀ n) W) atTop
        (𝓝 (channelCapacity W)) ∧
      Tendsto (fun n => ⨆ a, klDivVec (W a) (outputLaw (blahutArimoto W p₀ n) W)) atTop
        (𝓝 (ENNReal.ofReal (channelCapacity W))) ∧
      ∃ p' : A → ℝ, ((∀ a, 0 ≤ p' a) ∧ ∑ a, p' a = 1) ∧
        channelMutualInformation p' W = channelCapacity W ∧
        Tendsto (blahutArimoto W p₀) atTop (𝓝 p') := by
  sorry

end BlahutArimoto

end TauCetiRoadmap.BlahutArimotoAndAlternatingMinimization
