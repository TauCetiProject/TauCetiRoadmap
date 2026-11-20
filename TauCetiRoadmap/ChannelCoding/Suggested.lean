import Mathlib

/-!
# Channel coding: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib, each with `sorry`, together with the few
definitions they need; every definition has a real body. Every headline theorem of the README is
statable at the pins and is stated here; Shannon's random-coding bound (README 2.3) follows from
Feinstein's lemma with `γ = M e^τ` and is not stated separately. The README's remaining targets,
API lists and Checks are not restated.

A channel from a finite input alphabet `A` to a finite output alphabet `B` is a matrix
`W : A → B → ℝ` with nonnegative entries and rows summing to `1`; an input law is a vector
`p : A → ℝ` with nonnegative entries summing to `1`. The mutual information of an input law and
a channel is the finite mutual information `finiteMutualInformation` of
ProbabilisticAndMetricNumberTheory §5.2, applied to the input and output coordinates under the
joint law of the pair; its definition and that of the finite-label entropy `labelEntropy`
(ProbabilisticAndMetricNumberTheory §5.1a) are copied here because a roadmap's Lean file does not
import another roadmap. Logarithms are natural. A code with `M` messages is a pair of maps
`Fin M → X` and `Y → Fin M`; the memoryless use of a channel on words of length `n` is the
channel `productChannel W n`.
-/

noncomputable section

open MeasureTheory ProbabilityTheory Finset Filter Topology

namespace TauCetiRoadmap.ChannelCoding

/-! ## Layer 1: channels, mutual information and capacity -/

/-- 1.1 The entropy, in nats, of a label `X : Ω → A` into a finite type:
`∑ a, negMulLog (μ (X = a))`. Copied from ProbabilisticAndMetricNumberTheory §5.1a. -/
def labelEntropy {Ω A : Type*} [MeasurableSpace Ω] [Fintype A] (μ : Measure Ω) (X : Ω → A) :
    ℝ :=
  ∑ a, Real.negMulLog (μ.real (X ⁻¹' {a}))

/-- 1.1 The finite mutual information `I(X, Y) = H(X) + H(Y) - H((X, Y))` of two labels into
finite types. Copied from ProbabilisticAndMetricNumberTheory §5.2. -/
def finiteMutualInformation {Ω A B : Type*} [MeasurableSpace Ω] [Fintype A] [Fintype B]
    (μ : Measure Ω) (X : Ω → A) (Y : Ω → B) : ℝ :=
  labelEntropy μ X + labelEntropy μ Y - labelEntropy μ (fun ω => (X ω, Y ω))

/-- 1.1 A channel from `A` to `B`: a matrix with nonnegative entries whose rows sum to `1`;
`W a b` is the probability of the output `b` when the input is `a`. -/
def IsChannel {A B : Type*} [Fintype B] (W : A → B → ℝ) : Prop :=
  (∀ a b, 0 ≤ W a b) ∧ ∀ a, ∑ b, W a b = 1

/-- 1.1 The joint law on `A × B` of an input drawn from `p` and the output of the channel `W`:
the point mass at `(a, b)` carries `p a * W a b`. -/
def jointMeasure {A B : Type*} [Fintype A] [Fintype B] [MeasurableSpace A] [MeasurableSpace B]
    (p : A → ℝ) (W : A → B → ℝ) : Measure (A × B) :=
  ∑ x : A × B, ENNReal.ofReal (p x.1 * W x.1 x.2) • Measure.dirac x

/-- 1.1 The mutual information `I(p, W)` of the input and the output of the channel `W` with
input law `p`: the finite mutual information of the two coordinates under `jointMeasure p W`. -/
def channelMutualInformation {A B : Type*} [Fintype A] [Fintype B] [MeasurableSpace A]
    [MeasurableSpace B] (p : A → ℝ) (W : A → B → ℝ) : ℝ :=
  finiteMutualInformation (jointMeasure p W) Prod.fst Prod.snd

/-- 1.1 The output law `q b = ∑ a, p a * W a b` of the channel `W` with input law `p`. -/
def outputLaw {A B : Type*} [Fintype A] (p : A → ℝ) (W : A → B → ℝ) (b : B) : ℝ :=
  ∑ a, p a * W a b

/-- 1.1 The information density `i(a; b) = log (W a b / q b)`, where `q` is the output law. -/
def informationDensity {A B : Type*} [Fintype A] (p : A → ℝ) (W : A → B → ℝ) (a : A) (b : B) :
    ℝ :=
  Real.log (W a b / outputLaw p W b)

/-- 1.1 The mutual information is the average of the information density under the joint law:
`I(p, W) = ∑ a, ∑ b, p a * W a b * i(a; b)`, for a channel `W` and nonnegative weights `p`
(the identity does not use `∑ a, p a = 1`). -/
theorem channelMutualInformation_eq_sum {A B : Type*} [Fintype A] [Fintype B]
    [MeasurableSpace A] [MeasurableSingletonClass A] [MeasurableSpace B]
    [MeasurableSingletonClass B] {p : A → ℝ} (hp : ∀ a, 0 ≤ p a)
    {W : A → B → ℝ} (hW : IsChannel W) :
    channelMutualInformation p W = ∑ a, ∑ b, p a * W a b * informationDensity p W a b := by
  sorry

/-- 1.2 For a fixed channel, the mutual information is a concave function of the input law on
the simplex of input laws. -/
theorem concaveOn_channelMutualInformation {A B : Type*} [Fintype A] [Fintype B]
    [MeasurableSpace A] [MeasurableSingletonClass A] [MeasurableSpace B]
    [MeasurableSingletonClass B] {W : A → B → ℝ} (hW : IsChannel W) :
    ConcaveOn ℝ {p : A → ℝ | (∀ a, 0 ≤ p a) ∧ ∑ a, p a = 1}
      (fun p => channelMutualInformation p W) := by
  sorry

/-- 1.3 The capacity `C(W)` of a channel: the supremum of `I(p, W)` over the input laws. -/
def channelCapacity {A B : Type*} [Fintype A] [Fintype B] [MeasurableSpace A]
    [MeasurableSpace B] (W : A → B → ℝ) : ℝ :=
  sSup ((fun p => channelMutualInformation p W) '' {p : A → ℝ | (∀ a, 0 ≤ p a) ∧ ∑ a, p a = 1})

/-- 1.3 For a nonempty input alphabet the capacity is a maximum: some input law attains it. -/
theorem isGreatest_channelCapacity {A B : Type*} [Fintype A] [Nonempty A] [Fintype B]
    [MeasurableSpace A] [MeasurableSingletonClass A] [MeasurableSpace B]
    [MeasurableSingletonClass B] {W : A → B → ℝ} (hW : IsChannel W) :
    IsGreatest ((fun p => channelMutualInformation p W) ''
      {p : A → ℝ | (∀ a, 0 ≤ p a) ∧ ∑ a, p a = 1}) (channelCapacity W) := by
  sorry

/-- 1.4 The memoryless use of `W` on words of length `n`: the probability of the output word `y`
for the input word `x` is `∏ i, W (x i) (y i)`. -/
def productChannel {A B : Type*} (W : A → B → ℝ) (n : ℕ) : (Fin n → A) → (Fin n → B) → ℝ :=
  fun x y => ∏ i, W (x i) (y i)

/-- 1.4 Tensorization: the capacity of the memoryless use of `W` on words of length `n` is
`n * C(W)`. -/
theorem channelCapacity_productChannel {A B : Type*} [Fintype A] [Fintype B]
    [MeasurableSpace A] [MeasurableSingletonClass A] [MeasurableSpace B]
    [MeasurableSingletonClass B] {W : A → B → ℝ} (hW : IsChannel W) (n : ℕ) :
    channelCapacity (productChannel W n) = n * channelCapacity W := by
  sorry

/-- 1.5 The binary symmetric channel with crossover probability `δ`: each bit is flipped with
probability `δ`. -/
def bsc (δ : ℝ) : Fin 2 → Fin 2 → ℝ :=
  fun a b => if a = b then 1 - δ else δ

/-- 1.5 The binary erasure channel with erasure probability `ε`: the outputs `0` and `1` are
the bits and the output `2` is the erasure, received with probability `ε`; otherwise the input
bit is received. -/
def bec (ε : ℝ) : Fin 2 → Fin 3 → ℝ :=
  fun a b => if b = 2 then ε else if b = Fin.castSucc a then 1 - ε else 0

/-- 1.5 The capacity of the binary symmetric channel is `log 2 - h(δ)`. -/
theorem channelCapacity_bsc {δ : ℝ} (hδ₀ : 0 ≤ δ) (hδ₁ : δ ≤ 1) :
    channelCapacity (bsc δ) = Real.log 2 - Real.binEntropy δ := by
  sorry

/-- 1.5 The capacity of the binary erasure channel is `(1 - ε) log 2`. -/
theorem channelCapacity_bec {ε : ℝ} (hε₀ : 0 ≤ ε) (hε₁ : ε ≤ 1) :
    channelCapacity (bec ε) = (1 - ε) * Real.log 2 := by
  sorry

/-! ## Layer 2: codes for one use of a channel -/

/-- 2.1 A code with `M` messages for a channel from `X` to `Y`: an encoder sending each message
to a codeword and a decoder sending each output to a message. -/
structure ChannelCode (M : ℕ) (X Y : Type*) where
  /-- The codeword of each message. -/
  enc : Fin M → X
  /-- The message decoded from each output. -/
  dec : Y → Fin M

/-- 2.1 The probability that the message `m` is decoded wrongly: the probability under the row
`V (c.enc m)` of the outputs that `c.dec` does not send to `m`. -/
def errorProb {M : ℕ} {X Y : Type*} [Fintype Y] (V : X → Y → ℝ) (c : ChannelCode M X Y)
    (m : Fin M) : ℝ :=
  ∑ y with c.dec y ≠ m, V (c.enc m) y

/-- 2.1 The average error probability `M⁻¹ ∑ m, errorProb V c m` (equally likely messages). -/
def avgErrorProb {M : ℕ} {X Y : Type*} [Fintype Y] (V : X → Y → ℝ) (c : ChannelCode M X Y) :
    ℝ :=
  (M : ℝ)⁻¹ * ∑ m, errorProb V c m

/-- 2.2 Feinstein's lemma: for every input law `p`, every `M ≥ 1` and every `γ > 0` there is a
code with `M` messages each of whose error probabilities is at most
`P[i(X; Y) < log γ] + M / γ`, the probability taken under the joint law. -/
theorem exists_errorProb_le {X Y : Type*} [Fintype X] [Fintype Y] [MeasurableSpace X]
    [MeasurableSingletonClass X] [MeasurableSpace Y] [MeasurableSingletonClass Y]
    {p : X → ℝ} (hp : ∀ x, 0 ≤ p x) (hp1 : ∑ x, p x = 1) {V : X → Y → ℝ} (hV : IsChannel V)
    {M : ℕ} (hM : 0 < M) {γ : ℝ} (hγ : 0 < γ) :
    ∃ c : ChannelCode M X Y, ∀ m, errorProb V c m ≤
      (jointMeasure p V).real {xy | informationDensity p V xy.1 xy.2 < Real.log γ} + M / γ := by
  sorry

/-- 2.4 The weak converse: every code with `M` messages and average error probability `Pₑ`
satisfies `(1 - Pₑ) log M ≤ C(V) + h(Pₑ)`. -/
theorem one_sub_avgErrorProb_mul_log_le {X Y : Type*} [Fintype X] [Fintype Y]
    [MeasurableSpace X] [MeasurableSingletonClass X] [MeasurableSpace Y]
    [MeasurableSingletonClass Y] {V : X → Y → ℝ} (hV : IsChannel V) {M : ℕ}
    (c : ChannelCode M X Y) :
    (1 - avgErrorProb V c) * Real.log M ≤
      channelCapacity V + Real.binEntropy (avgErrorProb V c) := by
  sorry

/-! ## Layer 3: the coding theorem for discrete memoryless channels -/

/-- 3.1 A finite-blocklength bound: for every input law `p`, word length `n`, `M ≥ 1` and
`δ > 0`, the memoryless use of `W` has a code with `M` messages each of whose error
probabilities is at most `v / (n δ²) + M exp (-n (I(p, W) - δ))`, where `v` is the variance of
the information density under the joint law. -/
theorem exists_errorProb_productChannel_le {A B : Type*} [Fintype A] [Fintype B]
    [MeasurableSpace A] [MeasurableSingletonClass A] [MeasurableSpace B]
    [MeasurableSingletonClass B] {p : A → ℝ} (hp : ∀ a, 0 ≤ p a) (hp1 : ∑ a, p a = 1)
    {W : A → B → ℝ} (hW : IsChannel W) (n : ℕ) {M : ℕ} (hM : 0 < M) {δ : ℝ} (hδ : 0 < δ) :
    ∃ c : ChannelCode M (Fin n → A) (Fin n → B), ∀ m, errorProb (productChannel W n) c m ≤
      variance (fun ab : A × B => informationDensity p W ab.1 ab.2) (jointMeasure p W) /
          (n * δ ^ 2) +
        M * Real.exp (-(n * (channelMutualInformation p W - δ))) := by
  sorry

/-- 3.2 Shannon's noisy-channel coding theorem, achievability: for every rate `R < C(W)` and
every `ε > 0`, for all large `n` there is a code for words of length `n` with at least
`exp (n R)` messages each of whose error probabilities is at most `ε`. -/
theorem eventually_exists_errorProb_le {A B : Type*} [Fintype A] [Nonempty A] [Fintype B]
    [MeasurableSpace A] [MeasurableSingletonClass A] [MeasurableSpace B]
    [MeasurableSingletonClass B] {W : A → B → ℝ} (hW : IsChannel W) {R : ℝ}
    (hR : R < channelCapacity W) {ε : ℝ} (hε : 0 < ε) :
    ∀ᶠ n : ℕ in atTop, ∃ M : ℕ, Real.exp (n * R) ≤ M ∧
      ∃ c : ChannelCode M (Fin n → A) (Fin n → B), ∀ m, errorProb (productChannel W n) c m ≤ ε := by
  sorry

/-- 3.3 Shannon's noisy-channel coding theorem, converse: for every rate `R > C(W)` there is
`η > 0` such that, for all large `n`, every code for words of length `n` with at least
`exp (n R)` messages has average error probability at least `η`. -/
theorem exists_pos_le_avgErrorProb {A B : Type*} [Fintype A] [Fintype B] [MeasurableSpace A]
    [MeasurableSingletonClass A] [MeasurableSpace B] [MeasurableSingletonClass B]
    {W : A → B → ℝ} (hW : IsChannel W) {R : ℝ} (hR : channelCapacity W < R) :
    ∃ η > 0, ∀ᶠ n : ℕ in atTop, ∀ M : ℕ, Real.exp (n * R) ≤ M →
      ∀ c : ChannelCode M (Fin n → A) (Fin n → B), η ≤ avgErrorProb (productChannel W n) c := by
  sorry

end TauCetiRoadmap.ChannelCoding
