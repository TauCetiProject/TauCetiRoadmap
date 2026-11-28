import Mathlib

/-!
# Entropy and source coding: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib, each with `sorry`, together with the few
definitions they need; every definition has a real body. Every headline theorem of the README is
statable at the pins and is stated here. The README's remaining targets, API lists and Checks are
not restated.

A source is a label `X : Ω → ι` into a finite type on a probability space; its entropy is the
finite-label entropy `labelEntropy` of ProbabilisticAndMetricNumberTheory §5.1a, in nats, whose
definition is copied here together with that of `condLabelEntropy`, because a roadmap's Lean file
does not import another roadmap. Codes are maps `ι → List α` into words over a finite code
alphabet `α` with `D = Fintype.card α` letters; prefix-freeness is Mathlib's
`InformationTheory.IsPrefixFree`, under which the empty word alone is a prefix-free set, so a
one-symbol source has optimal expected length `0`.
-/

noncomputable section

open MeasureTheory ProbabilityTheory Finset Filter Topology InformationTheory

namespace TauCetiRoadmap.EntropyAndSourceCoding

variable {Ω : Type*} [MeasurableSpace Ω]

/-! ## Layer 1: entropy of families of labels -/

/-- 1.1 The entropy, in nats, of a label `X : Ω → A` into a finite type:
`∑ a, negMulLog (μ (X = a))`. Copied from ProbabilisticAndMetricNumberTheory §5.1a. -/
def labelEntropy {A : Type*} [Fintype A] (μ : Measure Ω) (X : Ω → A) : ℝ :=
  ∑ a, Real.negMulLog (μ.real (X ⁻¹' {a}))

/-- 1.1 The conditional entropy `H(X | Y) = ∑_{a,b} p_ab log (p_b / p_ab)`, with
`p_ab = μ (X = a, Y = b)` and `p_b = μ (Y = b)`. Copied from ProbabilisticAndMetricNumberTheory
§5.1a. -/
def condLabelEntropy {A B : Type*} [Fintype A] [Fintype B] (μ : Measure Ω) (X : Ω → A)
    (Y : Ω → B) : ℝ :=
  ∑ a, ∑ b, μ.real (X ⁻¹' {a} ∩ Y ⁻¹' {b}) *
    Real.log (μ.real (Y ⁻¹' {b}) / μ.real (X ⁻¹' {a} ∩ Y ⁻¹' {b}))

/-- 1.1 The joint label `X_S = (X i)_{i ∈ S}` of the members of a family of labels indexed by a
finite set `S`. -/
def subLabel {ι : Type*} {A : ι → Type*} (X : (i : ι) → Ω → A i) (S : Finset ι) :
    Ω → ((i : S) → A i) :=
  fun ω i => X i ω

/-- 1.1 Submodularity of entropy: `H(X_{S ∪ T}) + H(X_{S ∩ T}) ≤ H(X_S) + H(X_T)`. -/
theorem labelEntropy_subLabel_union_add_inter_le {ι : Type*} [DecidableEq ι] {A : ι → Type*}
    [∀ i, Fintype (A i)] [∀ i, MeasurableSpace (A i)] [∀ i, MeasurableSingletonClass (A i)]
    (μ : Measure Ω) [IsProbabilityMeasure μ] {X : (i : ι) → Ω → A i}
    (hX : ∀ i, Measurable (X i)) (S T : Finset ι) :
    labelEntropy μ (subLabel X (S ∪ T)) + labelEntropy μ (subLabel X (S ∩ T)) ≤
      labelEntropy μ (subLabel X S) + labelEntropy μ (subLabel X T) := by
  sorry

/-- 1.2 Shearer's lemma: if every index lies in at least `k` of the sets `F j`, then
`k · H(X) ≤ ∑_j H(X_{F j})`. -/
theorem mul_labelEntropy_le_sum_labelEntropy_subLabel {ι : Type*} [Fintype ι] [DecidableEq ι]
    {A : ι → Type*} [∀ i, Fintype (A i)] [∀ i, MeasurableSpace (A i)]
    [∀ i, MeasurableSingletonClass (A i)] (μ : Measure Ω) [IsProbabilityMeasure μ]
    {X : (i : ι) → Ω → A i} (hX : ∀ i, Measurable (X i)) {m : ℕ} (F : Fin m → Finset ι)
    (k : ℕ) (hF : ∀ i, k ≤ #{j | i ∈ F j}) :
    k * labelEntropy μ (subLabel X univ) ≤ ∑ j, labelEntropy μ (subLabel X (F j)) := by
  sorry

/-- 1.2 Shearer's lemma for projections: if every index lies in at least `k ≥ 1` of the sets
`F j`, a finite set `T` of families satisfies `|T|^k ≤ ∏_j |T restricted to F j|`. -/
theorem card_pow_le_prod_card_image_restrict {ι : Type*} [DecidableEq ι] {A : ι → Type*}
    [∀ i, DecidableEq (A i)] {m : ℕ} (F : Fin m → Finset ι) {k : ℕ} (hk : 0 < k)
    (hF : ∀ i, k ≤ #{j | i ∈ F j}) (T : Finset ((i : ι) → A i)) :
    #T ^ k ≤ ∏ j, #(T.image (F j).restrict) := by
  sorry

/-- 1.3 Fano's inequality: for every map `g`, with `Pₑ = μ (g Y ≠ X)`,
`H(X | Y) ≤ h(Pₑ) + Pₑ log (|A| - 1)`, where `h` is the binary entropy in nats. -/
theorem condLabelEntropy_le_binEntropy_add_mul_log {A B : Type*} [Fintype A] [Fintype B]
    [MeasurableSpace A] [MeasurableSingletonClass A] [MeasurableSpace B]
    [MeasurableSingletonClass B] (μ : Measure Ω) [IsProbabilityMeasure μ] {X : Ω → A}
    {Y : Ω → B} (hX : Measurable X) (hY : Measurable Y) (g : B → A) :
    condLabelEntropy μ X Y ≤
      Real.binEntropy (μ.real {ω | g (Y ω) ≠ X ω}) +
        μ.real {ω | g (Y ω) ≠ X ω} * Real.log (Fintype.card A - 1) := by
  sorry

/-! ## Layer 2: prefix codes and the optimal expected length -/

/-- 2.1 A prefix code: an injective assignment of words to symbols whose set of codewords is
prefix-free. -/
def IsPrefixCode {ι α : Type*} (c : ι → List α) : Prop :=
  Function.Injective c ∧ IsPrefixFree (Set.range c)

/-- 2.1 The converse of Kraft's inequality: lengths whose Kraft sum is at most `1` are the
lengths of a prefix code. -/
theorem exists_isPrefixCode_length_eq {ι α : Type*} [Fintype ι] [Fintype α] [Nonempty α]
    (ℓ : ι → ℕ) (h : ∑ i, (1 / (Fintype.card α : ℝ)) ^ ℓ i ≤ 1) :
    ∃ c : ι → List α, IsPrefixCode c ∧ ∀ i, (c i).length = ℓ i := by
  sorry

/-- 2.2 The expected length `∑_a μ (X = a) · |c a|` of a code for the source `X`. -/
def expectedLength {ι α : Type*} [Fintype ι] (μ : Measure Ω) (X : Ω → ι) (c : ι → List α) :
    ℝ :=
  ∑ a, μ.real (X ⁻¹' {a}) * (c a).length

/-- 2.2 The optimal expected length `L*` of a prefix code over the alphabet `α` for the source
`X`. -/
def minExpectedLength {ι : Type*} [Fintype ι] (μ : Measure Ω) (X : Ω → ι) (α : Type*) : ℝ :=
  sInf {L | ∃ c : ι → List α, IsPrefixCode c ∧ expectedLength μ X c = L}

/-- 2.2 The source coding bounds: `H(X) ≤ L* log D ≤ H(X) + log D`. -/
theorem labelEntropy_le_log_mul_minExpectedLength {ι α : Type*} [Fintype ι]
    [MeasurableSpace ι] [MeasurableSingletonClass ι] [Fintype α] (μ : Measure Ω)
    [IsProbabilityMeasure μ] {X : Ω → ι} (hX : Measurable X) (hα : 2 ≤ Fintype.card α) :
    labelEntropy μ X ≤ Real.log (Fintype.card α) * minExpectedLength μ X α ∧
      Real.log (Fintype.card α) * minExpectedLength μ X α ≤
        labelEntropy μ X + Real.log (Fintype.card α) := by
  sorry

/-- 2.2 The strict upper bound `L* log D < H(X) + log D` for a source charging every symbol. -/
theorem log_mul_minExpectedLength_lt {ι α : Type*} [Fintype ι] [MeasurableSpace ι]
    [MeasurableSingletonClass ι] [Fintype α] (μ : Measure Ω) [IsProbabilityMeasure μ]
    {X : Ω → ι} (hX : Measurable X) (hα : 2 ≤ Fintype.card α)
    (hpos : ∀ a, 0 < μ.real (X ⁻¹' {a})) :
    Real.log (Fintype.card α) * minExpectedLength μ X α <
      labelEntropy μ X + Real.log (Fintype.card α) := by
  sorry

/-- 2.3 Uniquely decodable codes do no better than prefix codes: `L* ≤` the expected length of
every injective code whose set of codewords is uniquely decodable. -/
theorem minExpectedLength_le_expectedLength {ι α : Type*} [Fintype ι] [Fintype α] [Nonempty α]
    (μ : Measure Ω) (X : Ω → ι) (c : ι → List α) (hc : Function.Injective c)
    (hud : IsUniquelyDecodable (Set.range c)) :
    minExpectedLength μ X α ≤ expectedLength μ X c := by
  sorry

/-- 2.4 Over a binary alphabet, two symbols `a ≠ b` of least mass have codewords of greatest
length that differ only in their last letter, in some optimal prefix code. -/
theorem exists_isPrefixCode_optimal_siblings {ι α : Type*} [Fintype ι] [Fintype α]
    (hα : Fintype.card α = 2) (μ : Measure Ω) (X : Ω → ι) {a b : ι} (hab : a ≠ b)
    (hmin : ∀ c, c ≠ a → c ≠ b →
      μ.real (X ⁻¹' {a}) ≤ μ.real (X ⁻¹' {c}) ∧ μ.real (X ⁻¹' {b}) ≤ μ.real (X ⁻¹' {c})) :
    ∃ c : ι → List α, IsPrefixCode c ∧ expectedLength μ X c = minExpectedLength μ X α ∧
      (∀ d, (c d).length ≤ (c b).length) ∧
      ∃ (w : List α) (x y : α), x ≠ y ∧ c a = w ++ [x] ∧ c b = w ++ [y] := by
  sorry

/-- 2.4 The source obtained from `X` by merging the symbol `b` into the symbol `a`. -/
def mergeLabel {ι : Type*} [DecidableEq ι] (X : Ω → ι) {a b : ι} (hab : a ≠ b) :
    Ω → {c : ι // c ≠ b} :=
  fun ω => if h : X ω = b then ⟨a, hab⟩ else ⟨X ω, h⟩

/-- 2.4 The merge identity behind the optimality of Huffman codes: over a binary alphabet, if
`a ≠ b` have least mass, `L*(X) = L*(X') + μ (X = a) + μ (X = b)` for the merged source `X'`. -/
theorem minExpectedLength_eq_minExpectedLength_mergeLabel_add {ι α : Type*} [Fintype ι]
    [DecidableEq ι] [MeasurableSpace ι] [MeasurableSingletonClass ι] [Fintype α]
    (hα : Fintype.card α = 2) (μ : Measure Ω) [IsProbabilityMeasure μ] {X : Ω → ι}
    (hX : Measurable X) {a b : ι} (hab : a ≠ b)
    (hmin : ∀ c, c ≠ a → c ≠ b →
      μ.real (X ⁻¹' {a}) ≤ μ.real (X ⁻¹' {c}) ∧ μ.real (X ⁻¹' {b}) ≤ μ.real (X ⁻¹' {c})) :
    minExpectedLength μ X α =
      minExpectedLength μ (mergeLabel X hab) α + μ.real (X ⁻¹' {a}) + μ.real (X ⁻¹' {b}) := by
  sorry

/-! ## Layer 3: memoryless sources -/

/-- 3.1 The block `(X 0, …, X (n - 1))` of the first `n` letters of a source. -/
def blockLabel {ι : Type*} (X : ℕ → Ω → ι) (n : ℕ) : Ω → (Fin n → ι) :=
  fun ω i => X i ω

/-- 3.1 The typical set: the words `x` of length `n` whose probability `∏ i, μ (X₀ = x i)` lies
between `exp (-n (H + ε))` and `exp (-n (H - ε))`, where `H` is the entropy of `X₀`. -/
def typicalSet {ι : Type*} [Fintype ι] (μ : Measure Ω) (X₀ : Ω → ι) (ε : ℝ) (n : ℕ) :
    Finset (Fin n → ι) := by
  classical
  exact {x | Real.exp (-(n * (labelEntropy μ X₀ + ε))) ≤ ∏ i, μ.real (X₀ ⁻¹' {x i}) ∧
    ∏ i, μ.real (X₀ ⁻¹' {x i}) ≤ Real.exp (-(n * (labelEntropy μ X₀ - ε)))}

/-- 3.1 The typical set has at most `exp (n (H + ε))` words. -/
theorem card_typicalSet_le {ι : Type*} [Fintype ι] [MeasurableSpace ι]
    [MeasurableSingletonClass ι] (μ : Measure Ω) [IsProbabilityMeasure μ] {X₀ : Ω → ι}
    (hX₀ : Measurable X₀) (ε : ℝ) (n : ℕ) :
    (#(typicalSet μ X₀ ε n) : ℝ) ≤ Real.exp (n * (labelEntropy μ X₀ + ε)) := by
  sorry

/-- 3.1 The asymptotic equipartition property: for an independent identically distributed
source and `ε > 0`, the probability that the first `n` letters form a typical word tends to `1`. -/
theorem tendsto_measureReal_typicalSet {ι : Type*} [Fintype ι] [MeasurableSpace ι]
    [MeasurableSingletonClass ι] (μ : Measure Ω) [IsProbabilityMeasure μ] {X : ℕ → Ω → ι}
    (hX : ∀ i, Measurable (X i)) (hind : iIndepFun X μ)
    (hid : ∀ i, IdentDistrib (X i) (X 0) μ μ) {ε : ℝ} (hε : 0 < ε) :
    Tendsto (fun n => μ.real (blockLabel X n ⁻¹' ↑(typicalSet μ (X 0) ε n))) atTop (𝓝 1) := by
  sorry

/-- 3.1 For an independent identically distributed source, `ε > 0` and `δ > 0`, the typical set
eventually has at least `(1 - δ) exp (n (H - ε))` words. -/
theorem eventually_card_typicalSet_ge {ι : Type*} [Fintype ι] [MeasurableSpace ι]
    [MeasurableSingletonClass ι] (μ : Measure Ω) [IsProbabilityMeasure μ] {X : ℕ → Ω → ι}
    (hX : ∀ i, Measurable (X i)) (hind : iIndepFun X μ)
    (hid : ∀ i, IdentDistrib (X i) (X 0) μ μ) {ε δ : ℝ} (hε : 0 < ε) (hδ : 0 < δ) :
    ∀ᶠ n : ℕ in atTop, (1 - δ) * Real.exp (n * (labelEntropy μ (X 0) - ε)) ≤
      #(typicalSet μ (X 0) ε n) := by
  sorry

/-- 3.2 Smallest sets of high probability: for `0 < δ < 1` and `ε > 0`, eventually some set of
at most `exp (n (H + ε))` words carries probability at least `1 - δ`, and every set of words
carrying probability at least `1 - δ` has at least `exp (n (H - ε))` words. -/
theorem eventually_exists_card_le_and_forall_card_ge {ι : Type*} [Fintype ι]
    [MeasurableSpace ι] [MeasurableSingletonClass ι] (μ : Measure Ω) [IsProbabilityMeasure μ]
    {X : ℕ → Ω → ι} (hX : ∀ i, Measurable (X i)) (hind : iIndepFun X μ)
    (hid : ∀ i, IdentDistrib (X i) (X 0) μ μ) {δ ε : ℝ} (hδ₀ : 0 < δ) (hδ₁ : δ < 1)
    (hε : 0 < ε) :
    ∀ᶠ n : ℕ in atTop,
      (∃ B : Finset (Fin n → ι), 1 - δ ≤ μ.real (blockLabel X n ⁻¹' ↑B) ∧
        (#B : ℝ) ≤ Real.exp (n * (labelEntropy μ (X 0) + ε))) ∧
      ∀ B : Finset (Fin n → ι), 1 - δ ≤ μ.real (blockLabel X n ⁻¹' ↑B) →
        Real.exp (n * (labelEntropy μ (X 0) - ε)) ≤ #B := by
  sorry

/-- 3.3 The source coding theorem for blocks: for an independent identically distributed source,
the optimal expected length per letter of prefix codes for blocks of `n` letters tends to
`H / log D`. -/
theorem tendsto_minExpectedLength_blockLabel_div {ι : Type*} [Fintype ι] [MeasurableSpace ι]
    [MeasurableSingletonClass ι] (μ : Measure Ω) [IsProbabilityMeasure μ] {X : ℕ → Ω → ι}
    (hX : ∀ i, Measurable (X i)) (hind : iIndepFun X μ)
    (hid : ∀ i, IdentDistrib (X i) (X 0) μ μ) (α : Type*) [Fintype α]
    (hα : 2 ≤ Fintype.card α) :
    Tendsto (fun n : ℕ => minExpectedLength μ (blockLabel X n) α / n) atTop
      (𝓝 (labelEntropy μ (X 0) / Real.log (Fintype.card α))) := by
  sorry

end TauCetiRoadmap.EntropyAndSourceCoding
