import Mathlib

/-!
# Rate-distortion theory: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib, each with `sorry`, together with the few
definitions they need; every definition has a real body. Every headline theorem of the README is
statable at the pins and is stated here. The README's remaining targets, API lists and Checks are
not restated.

A source law on a finite alphabet `A` is a vector `p : A → ℝ` with nonnegative entries summing to
`1`, and a distortion measure is any matrix `d : A → B → ℝ` on the source and reproduction
alphabets. A test channel is a channel matrix `W : A → B → ℝ` (nonnegative entries, rows summing
to `1`). The mutual information of `p` and `W` is ChannelCoding's `channelMutualInformation`, the
finite mutual information of ProbabilisticAndMetricNumberTheory §5.2 applied to the two
coordinates under the joint law; it and the definitions it rests on (`labelEntropy`,
`finiteMutualInformation`, `IsChannel`, `jointMeasure`), together with `outputLaw` and
`informationDensity`, are copied verbatim from ChannelCoding 1.1, because a roadmap's Lean file
does not import another roadmap. Logarithms are natural. The rate-distortion function
`rateDistortion p d D` is the infimum of the mutual information over the test channels whose
expected distortion is at most `D`. A source code with `M` codewords is a pair of maps `X → Fin M`
and `Fin M → Y`; for blocks of `n` letters the source law is `productLaw p n` and the distortion is
the per-letter average `blockDistortion d n`.
-/

noncomputable section

open MeasureTheory ProbabilityTheory Finset Filter Topology

namespace TauCetiRoadmap.RateDistortionTheory

/-! ## Layer 1: the rate-distortion function -/

/-- 1.1 The entropy, in nats, of a label `X : Ω → A` into a finite type:
`∑ a, negMulLog (μ (X = a))`. Copied from ProbabilisticAndMetricNumberTheory §5.1a, verbatim
as ChannelCoding 1.1 copies it. -/
def labelEntropy {Ω A : Type*} [MeasurableSpace Ω] [Fintype A] (μ : Measure Ω) (X : Ω → A) :
    ℝ :=
  ∑ a, Real.negMulLog (μ.real (X ⁻¹' {a}))

/-- 1.1 The finite mutual information `I(X, Y) = H(X) + H(Y) - H((X, Y))` of two labels into
finite types. Copied from ProbabilisticAndMetricNumberTheory §5.2, verbatim as ChannelCoding 1.1
copies it. -/
def finiteMutualInformation {Ω A B : Type*} [MeasurableSpace Ω] [Fintype A] [Fintype B]
    (μ : Measure Ω) (X : Ω → A) (Y : Ω → B) : ℝ :=
  labelEntropy μ X + labelEntropy μ Y - labelEntropy μ (fun ω => (X ω, Y ω))

/-- 1.1 A channel from `A` to `B`: a matrix with nonnegative entries whose rows sum to `1`;
`W a b` is the probability of the output `b` when the input is `a`. Copied verbatim from
ChannelCoding 1.1. -/
def IsChannel {A B : Type*} [Fintype B] (W : A → B → ℝ) : Prop :=
  (∀ a b, 0 ≤ W a b) ∧ ∀ a, ∑ b, W a b = 1

/-- 1.1 The joint law on `A × B` of an input drawn from `p` and the output of the channel `W`:
the point mass at `(a, b)` carries `p a * W a b`. Copied verbatim from ChannelCoding 1.1. -/
def jointMeasure {A B : Type*} [Fintype A] [Fintype B] [MeasurableSpace A] [MeasurableSpace B]
    (p : A → ℝ) (W : A → B → ℝ) : Measure (A × B) :=
  ∑ x : A × B, ENNReal.ofReal (p x.1 * W x.1 x.2) • Measure.dirac x

/-- 1.1 The mutual information `I(p, W)` of the input and the output of the channel `W` with
input law `p`: the finite mutual information of the two coordinates under `jointMeasure p W`.
Copied verbatim from ChannelCoding 1.1. -/
def channelMutualInformation {A B : Type*} [Fintype A] [Fintype B] [MeasurableSpace A]
    [MeasurableSpace B] (p : A → ℝ) (W : A → B → ℝ) : ℝ :=
  finiteMutualInformation (jointMeasure p W) Prod.fst Prod.snd

/-- 1.1 The output law `q b = ∑ a, p a * W a b` of the channel `W` with input law `p`. Copied
verbatim from ChannelCoding 1.1. -/
def outputLaw {A B : Type*} [Fintype A] (p : A → ℝ) (W : A → B → ℝ) (b : B) : ℝ :=
  ∑ a, p a * W a b

/-- 1.1 The information density `i(a; b) = log (W a b / q b)`, where `q` is the output law.
Copied verbatim from ChannelCoding 1.1. -/
def informationDensity {A B : Type*} [Fintype A] (p : A → ℝ) (W : A → B → ℝ) (a : A) (b : B) :
    ℝ :=
  Real.log (W a b / outputLaw p W b)

/-- 1.1 The expected distortion `∑ a, ∑ b, p a * W a b * d a b` of the test channel `W` for the
source law `p` and the distortion measure `d`. -/
def expectedDistortion {A B : Type*} [Fintype A] [Fintype B] (p : A → ℝ) (W : A → B → ℝ)
    (d : A → B → ℝ) : ℝ :=
  ∑ a, ∑ b, p a * W a b * d a b

/-- 1.1 For a fixed source law, the mutual information is a convex function of the test channel
on the set of channels. -/
theorem convexOn_channelMutualInformation_channel {A B : Type*} [Fintype A] [Fintype B]
    [MeasurableSpace A] [MeasurableSingletonClass A] [MeasurableSpace B]
    [MeasurableSingletonClass B] {p : A → ℝ} (hp : ∀ a, 0 ≤ p a) (hp1 : ∑ a, p a = 1) :
    ConvexOn ℝ {W : A → B → ℝ | IsChannel W} (fun W => channelMutualInformation p W) := by
  sorry

/-- 1.2 The rate-distortion function `R(D)`: the infimum of `I(p, W)` over the test channels `W`
whose expected distortion is at most `D`. -/
def rateDistortion {A B : Type*} [Fintype A] [Fintype B] [MeasurableSpace A] [MeasurableSpace B]
    (p : A → ℝ) (d : A → B → ℝ) (D : ℝ) : ℝ :=
  sInf ((fun W => channelMutualInformation p W) ''
    {W : A → B → ℝ | IsChannel W ∧ expectedDistortion p W d ≤ D})

/-- 1.2 The least distortion `D_min = ∑ a, p a * min_b d a b` that any test channel reaches. -/
def minDistortion {A B : Type*} [Fintype A] (p : A → ℝ) (d : A → B → ℝ) : ℝ :=
  ∑ a, p a * ⨅ b, d a b

/-- 1.2 The distortion `D_max = min_b ∑ a, p a * d a b` of the best constant reproduction. -/
def maxDistortion {A B : Type*} [Fintype A] (p : A → ℝ) (d : A → B → ℝ) : ℝ :=
  ⨅ b, ∑ a, p a * d a b

/-- 1.2 For `D ≥ D_min` the infimum defining `R(D)` is attained by some test channel. -/
theorem isLeast_rateDistortion {A B : Type*} [Fintype A] [Fintype B] [Nonempty B]
    [MeasurableSpace A] [MeasurableSingletonClass A] [MeasurableSpace B]
    [MeasurableSingletonClass B] {p : A → ℝ} (hp : ∀ a, 0 ≤ p a) (hp1 : ∑ a, p a = 1)
    (d : A → B → ℝ) {D : ℝ} (hD : minDistortion p d ≤ D) :
    IsLeast ((fun W => channelMutualInformation p W) ''
      {W : A → B → ℝ | IsChannel W ∧ expectedDistortion p W d ≤ D}) (rateDistortion p d D) := by
  sorry

/-- 1.3 The rate-distortion function is convex on `[D_min, ∞)`. -/
theorem convexOn_rateDistortion {A B : Type*} [Fintype A] [Fintype B] [Nonempty B]
    [MeasurableSpace A] [MeasurableSingletonClass A] [MeasurableSpace B]
    [MeasurableSingletonClass B] {p : A → ℝ} (hp : ∀ a, 0 ≤ p a) (hp1 : ∑ a, p a = 1)
    (d : A → B → ℝ) :
    ConvexOn ℝ (Set.Ici (minDistortion p d)) (rateDistortion p d) := by
  sorry

/-- 1.4 The rate-distortion function is continuous on `[D_min, ∞)`, the endpoint included. -/
theorem continuousOn_rateDistortion {A B : Type*} [Fintype A] [Fintype B] [Nonempty B]
    [MeasurableSpace A] [MeasurableSingletonClass A] [MeasurableSpace B]
    [MeasurableSingletonClass B] {p : A → ℝ} (hp : ∀ a, 0 ≤ p a) (hp1 : ∑ a, p a = 1)
    (d : A → B → ℝ) :
    ContinuousOn (rateDistortion p d) (Set.Ici (minDistortion p d)) := by
  sorry

/-- 1.5 For `D ≥ D_min`, `R(D) = 0` exactly when `D ≥ D_max`. -/
theorem rateDistortion_eq_zero_iff {A B : Type*} [Fintype A] [Fintype B] [Nonempty B]
    [MeasurableSpace A] [MeasurableSingletonClass A] [MeasurableSpace B]
    [MeasurableSingletonClass B] {p : A → ℝ} (hp : ∀ a, 0 ≤ p a) (hp1 : ∑ a, p a = 1)
    (d : A → B → ℝ) {D : ℝ} (hD : minDistortion p d ≤ D) :
    rateDistortion p d D = 0 ↔ maxDistortion p d ≤ D := by
  sorry

/-- 1.5 If the reproduction alphabet is the source alphabet and, for every letter `a` of positive
probability, `d a a = c` and `d a b > c` for `b ≠ a`, then `R(c)` is the entropy
`∑ a, negMulLog (p a)` of the source. -/
theorem rateDistortion_eq_entropy {A : Type*} [Fintype A] [MeasurableSpace A]
    [MeasurableSingletonClass A] {p : A → ℝ} (hp : ∀ a, 0 ≤ p a) (hp1 : ∑ a, p a = 1)
    {d : A → A → ℝ} {c : ℝ} (hc : ∀ a, 0 < p a → d a a = c)
    (hlt : ∀ a b, 0 < p a → a ≠ b → c < d a b) :
    rateDistortion p d c = ∑ a, Real.negMulLog (p a) := by
  sorry

/-! ## Layer 2: Hamming distortion -/

/-- 2.1 The Hamming distortion: `0` for a correct reproduction and `1` otherwise. -/
def hammingDistortion {A : Type*} [DecidableEq A] (a b : A) : ℝ :=
  if a = b then 0 else 1

/-- 2.1 The Bernoulli source law on `Fin 2`: the letter `1` has probability `θ`. -/
def bernoulliLaw (θ : ℝ) : Fin 2 → ℝ :=
  fun a => if a = 0 then 1 - θ else θ

/-- 2.2 The rate-distortion function of a Bernoulli source with Hamming distortion is
`h(θ) - h(D)` for `0 ≤ D ≤ min θ (1 - θ)`. -/
theorem rateDistortion_bernoulli {θ D : ℝ} (hθ₀ : 0 ≤ θ) (hθ₁ : θ ≤ 1) (hD₀ : 0 ≤ D)
    (hD : D ≤ min θ (1 - θ)) :
    rateDistortion (bernoulliLaw θ) hammingDistortion D =
      Real.binEntropy θ - Real.binEntropy D := by
  sorry

/-- 2.3 The rate-distortion function of the uniform source on `m` letters with Hamming
distortion is `log m - h(D) - D log (m - 1)` for `0 ≤ D ≤ 1 - 1/m`. -/
theorem rateDistortion_uniform {A : Type*} [Fintype A] [Nonempty A] [DecidableEq A]
    [MeasurableSpace A] [MeasurableSingletonClass A] {D : ℝ} (hD₀ : 0 ≤ D)
    (hD : D ≤ 1 - (Fintype.card A : ℝ)⁻¹) :
    rateDistortion (fun _ : A => (Fintype.card A : ℝ)⁻¹) hammingDistortion D =
      Real.log (Fintype.card A) - Real.binEntropy D - D * Real.log (Fintype.card A - 1) := by
  sorry

/-! ## Layer 3: source codes and the converse -/

/-- 3.1 A source code with `M` codewords from `X` to `Y`: an encoder sending each source value
to an index and a decoder sending each index to a reproduction. -/
structure SourceCode (M : ℕ) (X Y : Type*) where
  /-- The index of each source value. -/
  enc : X → Fin M
  /-- The reproduction of each index. -/
  dec : Fin M → Y

/-- 3.1 The expected distortion `∑ x, P x * e x (c.dec (c.enc x))` of the code `c` for the source
law `P` and the distortion measure `e`. -/
def codeDistortion {M : ℕ} {X Y : Type*} [Fintype X] (P : X → ℝ) (e : X → Y → ℝ)
    (c : SourceCode M X Y) : ℝ :=
  ∑ x, P x * e x (c.dec (c.enc x))

/-- 3.1 The law of `n` independent letters with law `p`: the word `x` has probability
`∏ i, p (x i)`. -/
def productLaw {A : Type*} (p : A → ℝ) (n : ℕ) : (Fin n → A) → ℝ :=
  fun x => ∏ i, p (x i)

/-- 3.1 The per-letter distortion `(∑ i, d (x i) (y i)) / n` between words of length `n`. -/
def blockDistortion {A B : Type*} (d : A → B → ℝ) (n : ℕ) : (Fin n → A) → (Fin n → B) → ℝ :=
  fun x y => (∑ i, d (x i) (y i)) / n

/-- 3.2 Single-letterization: for blocks of `n` letters of a memoryless source with the
per-letter distortion, the rate-distortion function is `n R(D)`. -/
theorem rateDistortion_productLaw {A B : Type*} [Fintype A] [Fintype B] [MeasurableSpace A]
    [MeasurableSingletonClass A] [MeasurableSpace B] [MeasurableSingletonClass B]
    {p : A → ℝ} (hp : ∀ a, 0 ≤ p a) (hp1 : ∑ a, p a = 1) (d : A → B → ℝ) (n : ℕ) (D : ℝ) :
    rateDistortion (productLaw p n) (blockDistortion d n) D = n * rateDistortion p d D := by
  sorry

/-- 3.3 The converse of the rate-distortion theorem: every code for blocks of `n` letters with
`M` codewords and expected per-letter distortion at most `D` satisfies `n R(D) ≤ log M`. -/
theorem mul_rateDistortion_le_log {A B : Type*} [Fintype A] [Fintype B] [MeasurableSpace A]
    [MeasurableSingletonClass A] [MeasurableSpace B] [MeasurableSingletonClass B]
    {p : A → ℝ} (hp : ∀ a, 0 ≤ p a) (hp1 : ∑ a, p a = 1) (d : A → B → ℝ) {n M : ℕ}
    (c : SourceCode M (Fin n → A) (Fin n → B)) {D : ℝ}
    (hc : codeDistortion (productLaw p n) (blockDistortion d n) c ≤ D) :
    n * rateDistortion p d D ≤ Real.log M := by
  sorry

/-! ## Layer 4: achievability -/

/-- 4.1 The random-coding bound: for a source law `P`, a test channel `V`, a nonnegative
distortion `e` and a reproduction `y₀`, some code with `M + 1` codewords never does worse than
`y₀` and has, for every real `γ`, expected distortion at most
`E e(X, Y) + E e(X, y₀) exp (-M / γ) + E [e(X, y₀); i(X; Y) > log γ]`, the expectations taken
under the joint law of `P` and `V`. -/
theorem exists_codeDistortion_le {X Y : Type*} [Fintype X] [Fintype Y] {P : X → ℝ}
    (hP : ∀ x, 0 ≤ P x) (hP1 : ∑ x, P x = 1) {V : X → Y → ℝ} (hV : IsChannel V)
    {e : X → Y → ℝ} (he : ∀ x y, 0 ≤ e x y) (y₀ : Y) (M : ℕ) :
    ∃ c : SourceCode (M + 1) X Y, (∀ x, e x (c.dec (c.enc x)) ≤ e x y₀) ∧
      ∀ γ : ℝ, codeDistortion P e c ≤
        expectedDistortion P V e + (∑ x, P x * e x y₀) * Real.exp (-(M / γ)) +
          ∑ x, ∑ y, if Real.log γ < informationDensity P V x y then P x * V x y * e x y₀
            else 0 := by
  sorry

/-- 4.2 The rate-distortion theorem, achievability: for `D > D_min` and every rate `R > R(D)`,
for all large `n` there is a code for blocks of `n` letters with at most `exp (n R)` codewords
and expected per-letter distortion at most `D`. -/
theorem eventually_exists_sourceCode {A B : Type*} [Fintype A] [Fintype B] [Nonempty B]
    [MeasurableSpace A] [MeasurableSingletonClass A] [MeasurableSpace B]
    [MeasurableSingletonClass B] {p : A → ℝ} (hp : ∀ a, 0 ≤ p a) (hp1 : ∑ a, p a = 1)
    (d : A → B → ℝ) {D R : ℝ} (hD : minDistortion p d < D) (hR : rateDistortion p d D < R) :
    ∀ᶠ n : ℕ in atTop, ∃ M : ℕ, (M : ℝ) ≤ Real.exp (n * R) ∧
      ∃ c : SourceCode M (Fin n → A) (Fin n → B),
        codeDistortion (productLaw p n) (blockDistortion d n) c ≤ D := by
  sorry

end TauCetiRoadmap.RateDistortionTheory
