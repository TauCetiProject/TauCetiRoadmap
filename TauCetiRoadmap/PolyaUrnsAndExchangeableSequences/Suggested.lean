import Mathlib
import TauCeti.Probability.Exchangeability.ConditionallyIID.CoinFlips
import TauCeti.Probability.Distributions.BetaBinomial.Basic

/-!
# Pólya urns and exchangeable sequences: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
results against the pinned Mathlib and Tau Ceti, with the five definitions they need, every
theorem with `sorry` and every definition with a real body.

Draws are `Bool`-valued (`true` is a white ball). An urn starts with weight `a > 0` of white
and `b > 0` of black; after each draw one unit of the drawn colour is added. The draw process
is described by the probabilities of its finite prefixes (`polyaWordProb`), so no conditional
probability enters the definition.
-/

open MeasureTheory ProbabilityTheory Filter Topology Finset
open scoped unitInterval

noncomputable section

namespace TauCetiRoadmap.PolyaUrnsAndExchangeableSequences

open TauCeti.Probability

/-! ## Conventions -/

/-- Conventions. The probability that a Pólya urn with initial weights `a` (white) and `b`
(black) produces the word `w` of length `n` as its first `n` draws: the product over the draws
of the current weight of the colour drawn divided by the current total weight `a + b + i`. -/
def polyaWordProb (a b : ℝ) {n : ℕ} (w : Fin n → Bool) : ℝ :=
  ∏ i : Fin n,
    (if w i then a + (#{j | j < i ∧ w j = true} : ℕ) else b + (#{j | j < i ∧ w j = false} : ℕ)) /
      (a + b + ((i : ℕ) : ℝ))

/-- Conventions. `X` is the draw sequence of a Pólya urn with initial weights `a > 0` and
`b > 0` under `μ`: its draws are measurable and every prefix word has the probability
`polyaWordProb a b w`. The case `n = 0` makes `μ` a probability measure. -/
structure IsPolyaUrn {Ω : Type*} [MeasurableSpace Ω] (μ : Measure Ω) (X : ℕ → Ω → Bool)
    (a b : ℝ) : Prop where
  pos_left : 0 < a
  pos_right : 0 < b
  measurable : ∀ i, Measurable (X i)
  word : ∀ (n : ℕ) (w : Fin n → Bool),
    μ.real {ω | ∀ i : Fin n, X i.val ω = w i} = polyaWordProb a b w

/-- Conventions. The Beta mixture of fair-or-biased coin flips: draw `p` from `Beta(a, b)`,
then flip i.i.d. coins that come up `true` with probability `p`. -/
def polyaUrnLaw (a b : ℝ) : Measure (ℕ → Bool) :=
  (betaMeasure a b).bind fun p =>
    Measure.infinitePi fun _ : ℕ => ((coinKernel (Set.projIcc 0 1 zero_le_one p) :
      ProbabilityMeasure Bool) : Measure Bool)

/-- Conventions. The filtration of the draws strictly before time `n`:
`σ(X 0, …, X (n - 1))`, trivial at `n = 0`. -/
def drawFiltration {Ω : Type*} [mΩ : MeasurableSpace Ω] (X : ℕ → Ω → Bool)
    (hX : ∀ i, Measurable (X i)) : Filtration ℕ mΩ where
  seq n := ⨆ i < n, MeasurableSpace.comap (X i) inferInstance
  mono' _ _ h := biSup_mono fun _ hi => lt_of_lt_of_le hi h
  le' _ := iSup₂_le fun i _ => (hX i).comap_le

/-- Conventions. The proportion of white weight after `n` draws:
`(a + #{i < n | X i = true}) / (a + b + n)`. -/
def urnProportion {Ω : Type*} (a b : ℝ) (X : ℕ → Ω → Bool) (n : ℕ) (ω : Ω) : ℝ :=
  (a + (#{i ∈ range n | X i ω = true} : ℕ)) / (a + b + (n : ℝ))

/-! ## Layer 1: the law of the draws -/

/-- 1.1. The word probability depends only on the number `k` of white draws:
`a⁽ᵏ⁾ b⁽ⁿ⁻ᵏ⁾ / (a + b)⁽ⁿ⁾` with rising factorials (`ascPochhammer`). No hypothesis on `a, b`. -/
theorem polyaWordProb_eq (a b : ℝ) {n : ℕ} (w : Fin n → Bool) :
    polyaWordProb a b w =
      (ascPochhammer ℝ #{i | w i = true}).eval a *
          (ascPochhammer ℝ #{i | w i = false}).eval b /
        (ascPochhammer ℝ n).eval (a + b) := by
  sorry

/-- 1.2. The draws of a Pólya urn are exchangeable. -/
theorem IsPolyaUrn.exchangeable {Ω : Type*} [MeasurableSpace Ω] {μ : Measure Ω}
    {X : ℕ → Ω → Bool} {a b : ℝ} (h : IsPolyaUrn μ X a b) : Exchangeable μ X := by
  sorry

/-- 1.3. The number of white draws among the first `n` has the beta-binomial law
`BetaBin(n, a, b)`. -/
theorem IsPolyaUrn.map_card_eq_betaBinomialMeasure {Ω : Type*} [MeasurableSpace Ω]
    {μ : Measure Ω} {X : ℕ → Ω → Bool} {a b : ℝ} (h : IsPolyaUrn μ X a b) (n : ℕ) :
    μ.map (fun ω => #{i ∈ range n | X i ω = true}) = betaBinomialMeasure n a b := by
  sorry

/-! ## Layer 2: the Beta mixture of coin flips -/

/-- 2.1. A measurable `Bool`-valued process is the draw sequence of a Pólya urn with weights
`a, b > 0` if and only if its path law is the Beta mixture `polyaUrnLaw a b`. -/
theorem isPolyaUrn_iff_pathLaw_eq {Ω : Type*} [MeasurableSpace Ω] {μ : Measure Ω}
    {X : ℕ → Ω → Bool} {a b : ℝ} (ha : 0 < a) (hb : 0 < b) (hX : ∀ i, Measurable (X i)) :
    IsPolyaUrn μ X a b ↔ pathLaw μ X = polyaUrnLaw a b := by
  sorry

/-- 2.2. Bayes–Laplace rule of succession. Coins that are conditionally i.i.d. with bias `Θ`
given `Θ`, where `Θ` has law `Beta(a, b)`, form the draw sequence of a Pólya urn with weights
`a, b`: given `k` heads in `n` flips, the next flip is a head with probability
`(a + k) / (a + b + n)`. -/
theorem isPolyaUrn_of_conditionallyIIDWith {Ω : Type*} [MeasurableSpace Ω] {μ : Measure Ω}
    {X : ℕ → Ω → Bool} {a b : ℝ} (ha : 0 < a) (hb : 0 < b) (hX : ∀ i, Measurable (X i))
    {Θ : Ω → I} (hlaw : μ.map (fun ω => (Θ ω : ℝ)) = betaMeasure a b)
    (hc : ConditionallyIIDWith μ X fun ω => coinKernel (Θ ω)) :
    IsPolyaUrn μ X a b := by
  sorry

/-! ## Layer 3: the proportion martingale and its limit -/

/-- 3.1. The proportion of white weight is a martingale for the filtration of past draws. -/
theorem IsPolyaUrn.martingale_urnProportion {Ω : Type*} [MeasurableSpace Ω] {μ : Measure Ω}
    {X : ℕ → Ω → Bool} {a b : ℝ} (h : IsPolyaUrn μ X a b) :
    Martingale (urnProportion a b X) (drawFiltration X h.measurable) μ := by
  sorry

/-- 3.2. The proportion of white weight and the frequency of white draws converge almost
surely to a common limit `Θ` with values in `[0, 1]`, and `Θ` has law `Beta(a, b)`. -/
theorem IsPolyaUrn.exists_tendsto_betaMeasure {Ω : Type*} [MeasurableSpace Ω]
    {μ : Measure Ω} {X : ℕ → Ω → Bool} {a b : ℝ} (h : IsPolyaUrn μ X a b) :
    ∃ Θ : Ω → I, Measurable Θ ∧
      (∀ᵐ ω ∂μ, Tendsto (fun n => urnProportion a b X n ω) atTop (𝓝 (Θ ω : ℝ))) ∧
      (∀ᵐ ω ∂μ, Tendsto (fun n : ℕ => (#{i ∈ range n | X i ω = true} : ℝ) / n) atTop
        (𝓝 (Θ ω : ℝ))) ∧
      μ.map (fun ω => (Θ ω : ℝ)) = betaMeasure a b := by
  sorry

/-- 3.3. Given the limit proportion `Θ`, the draws are conditionally i.i.d. coin flips with
bias `Θ`: `ω ↦ coinKernel (Θ ω)` is a directing measure. -/
theorem IsPolyaUrn.conditionallyIIDWith_limit {Ω : Type*} [MeasurableSpace Ω]
    {μ : Measure Ω} {X : ℕ → Ω → Bool} {a b : ℝ} (h : IsPolyaUrn μ X a b) {Θ : Ω → I}
    (hΘ : Measurable Θ)
    (hlim : ∀ᵐ ω ∂μ, Tendsto (fun n => urnProportion a b X n ω) atTop (𝓝 (Θ ω : ℝ))) :
    ConditionallyIIDWith μ X fun ω => coinKernel (Θ ω) := by
  sorry

/-- 3.4. The proportion of white weight after `n` draws is the conditional expectation of the
limit proportion given the first `n` draws: `(a + Sₙ) / (a + b + n) = E[Θ | X 0, …, X (n - 1)]`
almost surely. -/
theorem IsPolyaUrn.urnProportion_ae_eq_condExp {Ω : Type*} [MeasurableSpace Ω]
    {μ : Measure Ω} {X : ℕ → Ω → Bool} {a b : ℝ} (h : IsPolyaUrn μ X a b) {Θ : Ω → I}
    (hlim : ∀ᵐ ω ∂μ, Tendsto (fun n => urnProportion a b X n ω) atTop (𝓝 (Θ ω : ℝ)))
    (n : ℕ) :
    urnProportion a b X n =ᵐ[μ] μ[fun ω => (Θ ω : ℝ) | drawFiltration X h.measurable n] := by
  sorry

end TauCetiRoadmap.PolyaUrnsAndExchangeableSequences
