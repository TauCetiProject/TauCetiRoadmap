import Mathlib
import TauCeti.InformationTheory.LabelEntropy

/-!
# Finite Shannon theory: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the
roadmap's headline definitions and theorems against the pinned Mathlib and Tau Ceti,
each theorem with `sorry`; every definition has a real body. Every headline theorem
of the README is statable at the pins and is stated here. The README's remaining
targets, API lists and Checks are not restated.

Distributions on a finite type `α` are bare functions `p : α → ℝ`; the distribution
axioms are hypotheses of the theorems, not of the definitions. Logarithms are natural
(entropies in nats), and `Real.negMulLog` is the single building block. Layer 1's
signatures are taken from a compiling prototype (see the README's Provenance section).
The Layer 4 bridges consume Tau Ceti's label entropy directly, as they should: the
bridges are identifications with the existing development, not restatements of it.
-/

noncomputable section

open Finset Real Filter Topology
open scoped ENNReal

namespace TauCetiRoadmap.FiniteShannonTheory

variable {α β γ : Type*} [Fintype α] [Fintype β] [Fintype γ]

/-- Layer 1: Shannon entropy of a finite distribution, in nats. -/
def entropy (p : α → ℝ) : ℝ :=
  ∑ x, negMulLog (p x)

theorem entropy_nonneg {p : α → ℝ} (hp0 : ∀ x, 0 ≤ p x) (hp1 : ∑ x, p x = 1) :
    0 ≤ entropy p := by sorry

theorem entropy_point_mass [DecidableEq α] (a : α) :
    entropy (fun x => if x = a then (1 : ℝ) else 0) = 0 := by sorry

theorem entropy_uniform {p : α → ℝ} (hp : ∀ x, p x = (Fintype.card α : ℝ)⁻¹) :
    entropy p = Real.log (Fintype.card α) := by sorry

theorem entropy_le_log_card {p : α → ℝ} (hp0 : ∀ x, 0 ≤ p x)
    (hp1 : ∑ x, p x = 1) :
    entropy p ≤ Real.log (Fintype.card α) := by sorry

theorem entropy_prod (q : α → ℝ) (r : β → ℝ) :
    entropy (fun z : α × β => q z.1 * r z.2)
      = (∑ b, r b) * entropy q + (∑ a, q a) * entropy r := by sorry

/-- Layer 1 check: agreement with Mathlib's binary entropy on `Fin 2`. -/
theorem entropy_fin_two (p : ℝ) :
    entropy (fun i : Fin 2 => if i = 0 then p else 1 - p)
      = Real.binEntropy p := by sorry

/-- Layer 1: entropy is invariant under reindexing by an equivalence. -/
theorem entropy_equiv (e : α ≃ β) (p : β → ℝ) :
    entropy (p ∘ e) = entropy p := by sorry

/-- Layer 2: first marginal of a joint distribution. -/
def marginal₁ (p : α × β → ℝ) : α → ℝ := fun a => ∑ b, p (a, b)

/-- Layer 2: second marginal of a joint distribution. -/
def marginal₂ (p : α × β → ℝ) : β → ℝ := fun b => ∑ a, p (a, b)

/-- Layer 2: conditional entropy `H(X ∣ Y)` of a joint distribution. -/
def condEntropy (p : α × β → ℝ) : ℝ :=
  ∑ z, p z * Real.log (marginal₂ p z.2 / p z)

/-- Layer 2: mutual information `I(X;Y)` of a joint distribution. -/
def mutualInfo (p : α × β → ℝ) : ℝ :=
  entropy (marginal₁ p) + entropy (marginal₂ p) - entropy p

theorem condEntropy_nonneg {p : α × β → ℝ} (hp0 : ∀ z, 0 ≤ p z)
    (hp1 : ∑ z, p z = 1) :
    0 ≤ condEntropy p := by sorry

theorem entropy_eq_entropy_marginal₂_add_condEntropy {p : α × β → ℝ}
    (hp0 : ∀ z, 0 ≤ p z) (hp1 : ∑ z, p z = 1) :
    entropy p = entropy (marginal₂ p) + condEntropy p := by sorry

/-- Layer 2: conditioning reduces entropy. -/
theorem condEntropy_le_entropy {p : α × β → ℝ} (hp0 : ∀ z, 0 ≤ p z)
    (hp1 : ∑ z, p z = 1) :
    condEntropy p ≤ entropy (marginal₁ p) := by sorry

theorem mutualInfo_nonneg {p : α × β → ℝ} (hp0 : ∀ z, 0 ≤ p z)
    (hp1 : ∑ z, p z = 1) :
    0 ≤ mutualInfo p := by sorry

/-- Layer 2: mutual information is symmetric in the two coordinates. -/
theorem mutualInfo_comm {p : α × β → ℝ} :
    mutualInfo (fun z : β × α => p (z.2, z.1)) = mutualInfo p := by sorry

theorem mutualInfo_eq_zero_iff {p : α × β → ℝ} (hp0 : ∀ z, 0 ≤ p z)
    (hp1 : ∑ z, p z = 1) :
    mutualInfo p = 0 ↔
      ∀ a b, p (a, b) = marginal₁ p a * marginal₂ p b := by sorry

/-- Layer 2 check: the mutual information of a variable with itself is its
entropy, for the diagonal joint distribution. -/
theorem mutualInfo_self [DecidableEq α] {q : α → ℝ} :
    mutualInfo (fun z : α × α => if z.1 = z.2 then q z.1 else 0)
      = entropy q := by sorry

/-- Layer 2: entropy does not increase under a function of the variable
(data processing, deterministic case). -/
theorem entropy_map_le [DecidableEq γ] {p : α → ℝ} (hp0 : ∀ x, 0 ≤ p x)
    (hp1 : ∑ x, p x = 1) (f : α → γ) :
    entropy (fun c => ∑ a ∈ Finset.univ.filter (fun a => f a = c), p a)
      ≤ entropy p := by sorry

/-- Layer 2: data processing in the first coordinate: applying a
function to one variable does not increase mutual information. -/
theorem mutualInfo_map_fst_le [DecidableEq γ] {p : α × β → ℝ}
    (hp0 : ∀ z, 0 ≤ p z) (hp1 : ∑ z, p z = 1) (f : α → γ) :
    mutualInfo (fun z : γ × β =>
      ∑ a ∈ Finset.univ.filter (fun a => f a = z.1), p (a, z.2))
      ≤ mutualInfo p := by sorry

/-- Layer 2: mutual information as a `klFun` sum, matching the label-level
identity `TauCeti.labelEntropy_add_sub_pair_eq_sum_klFun` (whose measure
hypothesis is that the total mass is `0` or `1`; here the mass is `1`). -/
theorem mutualInfo_eq_sum_klFun {p : α × β → ℝ} (hp0 : ∀ z, 0 ≤ p z)
    (hp1 : ∑ z, p z = 1) :
    mutualInfo p = ∑ z, (marginal₁ p z.1 * marginal₂ p z.2) *
      InformationTheory.klFun (p z / (marginal₁ p z.1 * marginal₂ p z.2)) := by
  sorry

/-- Layer 3: finite Kullback–Leibler divergence, in nats. Total; the lemmas
carry the support hypothesis under which it is the mathematical value. -/
def relEntropy (p q : α → ℝ) : ℝ :=
  ∑ x, p x * Real.log (p x / q x)

theorem relEntropy_nonneg {p q : α → ℝ} (hp0 : ∀ x, 0 ≤ p x)
    (hq0 : ∀ x, 0 ≤ q x) (hp1 : ∑ x, p x = 1) (hq1 : ∑ x, q x = 1)
    (hsupp : ∀ x, q x = 0 → p x = 0) :
    0 ≤ relEntropy p q := by sorry

theorem relEntropy_eq_zero_iff {p q : α → ℝ} (hp0 : ∀ x, 0 ≤ p x)
    (hq0 : ∀ x, 0 ≤ q x) (hp1 : ∑ x, p x = 1) (hq1 : ∑ x, q x = 1)
    (hsupp : ∀ x, q x = 0 → p x = 0) :
    relEntropy p q = 0 ↔ p = q := by sorry

/-- Layer 3: joint convexity of relative entropy, in two-point form. -/
theorem relEntropy_convex {p₁ p₂ q₁ q₂ : α → ℝ}
    (hp₁ : ∀ x, 0 ≤ p₁ x) (hp₂ : ∀ x, 0 ≤ p₂ x)
    (hq₁ : ∀ x, 0 ≤ q₁ x) (hq₂ : ∀ x, 0 ≤ q₂ x)
    (hp₁s : ∑ x, p₁ x = 1) (hp₂s : ∑ x, p₂ x = 1)
    (hq₁s : ∑ x, q₁ x = 1) (hq₂s : ∑ x, q₂ x = 1)
    (hs₁ : ∀ x, q₁ x = 0 → p₁ x = 0) (hs₂ : ∀ x, q₂ x = 0 → p₂ x = 0)
    {t : ℝ} (ht0 : 0 ≤ t) (ht1 : t ≤ 1) :
    relEntropy (fun x => t * p₁ x + (1 - t) * p₂ x)
        (fun x => t * q₁ x + (1 - t) * q₂ x)
      ≤ t * relEntropy p₁ q₁ + (1 - t) * relEntropy p₂ q₂ := by sorry

section Bridges

variable [MeasurableSpace α] [MeasurableSpace β]

/-- Layer 3/4: the measure of a distribution: singleton masses `p x`. -/
def distMeasure (p : α → ℝ) : MeasureTheory.Measure α :=
  ∑ x, (ENNReal.ofReal (p x)) • MeasureTheory.Measure.dirac x

/-- Layer 4 bridge: distribution entropy is the label entropy of the
identity label under the distribution's own measure. -/
theorem entropy_eq_labelEntropy {p : α → ℝ} (hp0 : ∀ x, 0 ≤ p x)
    (hp1 : ∑ x, p x = 1) :
    entropy p = TauCeti.labelEntropy (distMeasure p) id := by sorry

/-- Layer 4 bridge: conditional entropy is the conditional label entropy
of the two projections. -/
theorem condEntropy_eq_condLabelEntropy {p : α × β → ℝ}
    (hp0 : ∀ z, 0 ≤ p z) (hp1 : ∑ z, p z = 1) :
    condEntropy p
      = TauCeti.condLabelEntropy (distMeasure p) Prod.fst Prod.snd := by
  sorry

/-- Layer 4 bridge: mutual information is the label-entropy gap. -/
theorem mutualInfo_eq_labelEntropy_gap {p : α × β → ℝ}
    (hp0 : ∀ z, 0 ≤ p z) (hp1 : ∑ z, p z = 1) :
    mutualInfo p = TauCeti.labelEntropy (distMeasure p) Prod.fst
      + TauCeti.labelEntropy (distMeasure p) Prod.snd
      - TauCeti.labelEntropy (distMeasure p) id := by sorry

/-- Layer 3 identification, stated in this section because it consumes
`distMeasure`: for `q` of full support, the finite divergence is
Mathlib's `klDiv` of the two mass measures, via Tau Ceti's
`klDiv_eq_sum_klFun_singleton`. -/
theorem relEntropy_eq_klDiv {p q : α → ℝ} (hp0 : ∀ x, 0 ≤ p x)
    (hq0 : ∀ x, 0 ≤ q x) (hp1 : ∑ x, p x = 1) (hq1 : ∑ x, q x = 1)
    (hqsupp : ∀ x, q x ≠ 0) :
    (InformationTheory.klDiv (distMeasure p) (distMeasure q)).toReal
      = relEntropy p q := by sorry

end Bridges

/-- Layer 5: the error probability of an estimator `g` under a joint
distribution `p`. -/
def errProb [DecidableEq α] (p : α × β → ℝ) (g : β → α) : ℝ :=
  ∑ z ∈ Finset.univ.filter (fun z => g z.2 ≠ z.1), p z

/-- Layer 5: Fano's inequality. -/
theorem fano [DecidableEq α] {p : α × β → ℝ} (hp0 : ∀ z, 0 ≤ p z)
    (hp1 : ∑ z, p z = 1) (g : β → α) (hα : 2 ≤ Fintype.card α) :
    condEntropy p ≤ Real.binEntropy (errProb p g)
      + errProb p g * Real.log ((Fintype.card α : ℝ) - 1) := by sorry

/-- Layer 5: Fano's inequality, weakened form. -/
theorem fano_weak [DecidableEq α] {p : α × β → ℝ} (hp0 : ∀ z, 0 ≤ p z)
    (hp1 : ∑ z, p z = 1) (g : β → α) (hα : 2 ≤ Fintype.card α) :
    (condEntropy p - 1) / Real.log (Fintype.card α) ≤ errProb p g := by sorry

/-- Layer 6: the `n`-fold product distribution of `p`. -/
def prodDist (p : α → ℝ) (n : ℕ) : (Fin n → α) → ℝ :=
  fun x => ∏ i, p (x i)

open Classical in
/-- Layer 6: the typical set of sequences of length `n` at tolerance `ε`. -/
def typicalSet (p : α → ℝ) (ε : ℝ) (n : ℕ) : Finset (Fin n → α) :=
  Finset.univ.filter (fun x =>
    |(-(1 / (n : ℝ)) * Real.log (prodDist p n x)) - entropy p| ≤ ε)

/-- Layer 6, AEP: the typical set has probability tending to `1`. -/
theorem typicalSet_prob_tendsto {p : α → ℝ} (hp0 : ∀ x, 0 ≤ p x)
    (hp1 : ∑ x, p x = 1) {ε : ℝ} (hε : 0 < ε) :
    Tendsto (fun n => ∑ x ∈ typicalSet p ε n, prodDist p n x)
      atTop (𝓝 1) := by sorry

/-- Layer 6, AEP: every typical sequence has probability between the two
exponential bounds (stated on the support, where all masses are
positive). -/
theorem prodDist_typical_mem_bounds {p : α → ℝ} (hp0 : ∀ x, 0 < p x)
    (hp1 : ∑ x, p x = 1) {ε : ℝ} {n : ℕ} {x : Fin n → α}
    (hx : x ∈ typicalSet p ε n) :
    Real.exp (-(n : ℝ) * (entropy p + ε)) ≤ prodDist p n x
      ∧ prodDist p n x ≤ Real.exp (-(n : ℝ) * (entropy p - ε)) := by sorry

/-- Layer 6, AEP: cardinality bounds for the typical set. -/
theorem typicalSet_card_bounds {p : α → ℝ} (hp0 : ∀ x, 0 ≤ p x)
    (hp1 : ∑ x, p x = 1) {ε : ℝ} (hε : 0 < ε) {δ : ℝ} (hδ : 0 < δ) :
    ∀ᶠ (n : ℕ) in atTop,
      (1 - δ) * Real.exp ((n : ℝ) * (entropy p - ε))
        ≤ ((typicalSet p ε n).card : ℝ)
      ∧ ((typicalSet p ε n).card : ℝ)
        ≤ Real.exp ((n : ℝ) * (entropy p + ε)) := by sorry

/-- Layer 6: the joint distribution of an input distribution `p` through
a finite channel `W`. -/
def channelJoint (p : α → ℝ) (W : α → β → ℝ) : α × β → ℝ :=
  fun z => p z.1 * W z.1 z.2

/-- Layer 6: the mutual information of a channel at an input
distribution. -/
def channelMutualInfo (p : α → ℝ) (W : α → β → ℝ) : ℝ :=
  mutualInfo (channelJoint p W)

/-- Layer 6: the capacity of a finite channel. -/
def channelCapacity (W : α → β → ℝ) : ℝ :=
  sSup {r | ∃ p : α → ℝ, (∀ x, 0 ≤ p x) ∧ (∑ x, p x) = 1
    ∧ r = channelMutualInfo p W}

/-- Layer 6: the capacity is attained. -/
theorem channelCapacity_attained [Nonempty α] {W : α → β → ℝ}
    (hW0 : ∀ a b, 0 ≤ W a b) (hW1 : ∀ a, ∑ b, W a b = 1) :
    ∃ p : α → ℝ, (∀ x, 0 ≤ p x) ∧ (∑ x, p x) = 1
      ∧ channelMutualInfo p W = channelCapacity W := by sorry

/-- Layer 6: the capacity is at most the log of the smaller alphabet. -/
theorem channelCapacity_le_log_min {W : α → β → ℝ}
    (hW0 : ∀ a b, 0 ≤ W a b) (hW1 : ∀ a, ∑ b, W a b = 1) :
    channelCapacity W
      ≤ Real.log (min (Fintype.card α : ℝ) (Fintype.card β : ℝ)) := by sorry

/-- Layer 6: the probability that a word `y` is received when `x` is sent
through the memoryless channel `W`. -/
def wordProb (W : α → β → ℝ) {n : ℕ} (x : Fin n → α) (y : Fin n → β) :
    ℝ :=
  ∏ i, W (x i) (y i)

/-- Layer 6: the error probability of message `m` for a block code
`(enc, dec)` over the channel `W`. -/
def codeError (W : α → β → ℝ) {n M : ℕ} (enc : Fin M → (Fin n → α))
    (dec : (Fin n → β) → Fin M) (m : Fin M) : ℝ :=
  1 - ∑ y ∈ Finset.univ.filter (fun y => dec y = m), wordProb W (enc m) y

/-- Layer 6: Shannon's channel coding theorem, achievability. Rates below
capacity admit block codes of arbitrarily small maximal error. -/
theorem channel_coding_achievability {W : α → β → ℝ}
    (hW0 : ∀ a b, 0 ≤ W a b) (hW1 : ∀ a, ∑ b, W a b = 1)
    {R : ℝ} (hR : R < channelCapacity W) {ε : ℝ} (hε : 0 < ε) :
    ∃ᶠ (n : ℕ) in atTop, ∃ (M : ℕ) (enc : Fin M → (Fin n → α))
      (dec : (Fin n → β) → Fin M),
      R ≤ Real.log (M : ℝ) / (n : ℝ) ∧ ∀ m, codeError W enc dec m ≤ ε := by
  sorry

/-- Layer 6: Shannon's channel coding theorem, weak converse. Above
capacity, some message always has error bounded away from zero. -/
theorem channel_coding_converse {W : α → β → ℝ}
    (hW0 : ∀ a b, 0 ≤ W a b) (hW1 : ∀ a, ∑ b, W a b = 1)
    {R : ℝ} (hR : channelCapacity W < R) :
    ∃ ε > 0, ∀ (n M : ℕ) (enc : Fin M → (Fin n → α))
      (dec : (Fin n → β) → Fin M),
      R ≤ Real.log (M : ℝ) / (n : ℝ)
        → ∃ m, ε ≤ codeError W enc dec m := by sorry

end TauCetiRoadmap.FiniteShannonTheory
