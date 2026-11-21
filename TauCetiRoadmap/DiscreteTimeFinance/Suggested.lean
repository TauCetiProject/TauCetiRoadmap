import Mathlib
import TauCeti.Probability.Finance.Arbitrage

/-!
# Discrete-time finance: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the
definitions their statements need, each with a real body.

Every headline of the README is statable at the pins and is stated here: the first fundamental
theorem for `d` assets on a finite space, the second fundamental theorem (uniqueness of the
equivalent martingale measure on the terminal σ-algebra), superhedging duality, the optional
decomposition, the no-arbitrage criterion and the unique martingale measure of the
Cox–Ross–Rubinstein tree, and the superhedging price of an American claim in a complete market.
The secondary statements (pricing of attainable claims, the bridge to Tau Ceti's one-stock
market, the branching bound of complete markets, the price interval, arbitrage-free prices and
the American call) are stated as well.

Holdings, gains and arbitrage are built on Tau Ceti's `TauCeti.Finance.simpleGains` and
`TauCeti.Finance.IsArbitrage`. The Snell envelope and the first time it meets the reward are
copied verbatim from OptimalStopping 1.1 and 1.3, in a section with that roadmap's own
`variable` line.
-/

open MeasureTheory ProbabilityTheory Finset

namespace TauCetiRoadmap.DiscreteTimeFinance

/-! ## Definitions copied from OptimalStopping (used in Layer 5) -/

section CopiedFromOptimalStopping

variable {Ω : Type*} {m0 : MeasurableSpace Ω}

/-- 5.1 (copied verbatim from OptimalStopping 1.1) The Snell envelope of the reward `Z` with
horizon `N`: `U N = Z N`, `U n = max (Z n) (μ[U (n + 1) | 𝓕 n])` for `n < N`, and `U n = Z N`
for `n ≥ N`. -/
noncomputable def snellEnvelope (μ : Measure Ω) (𝓕 : Filtration ℕ m0) (Z : ℕ → Ω → ℝ) (N : ℕ)
    (n : ℕ) : Ω → ℝ :=
  if n < N then fun ω => max (Z n ω) (μ[snellEnvelope μ 𝓕 Z N (n + 1) | 𝓕 n] ω) else Z N
termination_by N - n

/-- 5.1 (copied verbatim from OptimalStopping 1.3) The first time `k` in `[n, N]` at which the
Snell envelope equals the reward (the time `N` if there is none, which happens only when
`n > N`). -/
noncomputable def optimalStoppingTime (μ : Measure Ω) (𝓕 : Filtration ℕ m0) (Z : ℕ → Ω → ℝ)
    (N n : ℕ) : Ω → WithTop ℕ :=
  fun ω => ((hittingBtwn (fun k ω => snellEnvelope μ 𝓕 Z N k ω - Z k ω) {0} n N ω : ℕ) :
    WithTop ℕ)

end CopiedFromOptimalStopping

variable {Ω : Type*} [MeasurableSpace Ω] {d : ℕ}

/-! ## Layer 1: the market and the first fundamental theorem -/

/-- 1.1 Discounted gains `∑_{s < t} ⟨H s, X (s + 1) - X s⟩` of the holdings `H` (`H s` held
over `(s, s + 1]`) in the discounted prices `X` of `d` assets: the sum over the assets of
Tau Ceti's elementary integral at the trading dates `0, 1, …, t`. -/
noncomputable def gains (X H : ℕ → Ω → Fin d → ℝ) (t : ℕ) (ω : Ω) : ℝ :=
  ∑ i, TauCeti.Finance.simpleGains id t (fun j ω => H j ω i) (fun s ω => X s ω i) t ω

/-- 1.1 No arbitrage up to the horizon `T`: no adapted holdings have discounted terminal gains
that are an arbitrage of cost `0` in Tau Ceti's sense. -/
def NoArbitrage (P : Measure Ω) (ℱ : Filtration ℕ ‹MeasurableSpace Ω›)
    (X : ℕ → Ω → Fin d → ℝ) (T : ℕ) : Prop :=
  ∀ H : ℕ → Ω → Fin d → ℝ, StronglyAdapted ℱ H →
    ¬ TauCeti.Finance.IsArbitrage P 0 (gains X H T)

/-- 1.2 The absolutely continuous martingale measures: probability measures `Q ≪ P` under
which the price process stopped at `T` is a martingale. -/
def martingaleMeasures (P : Measure Ω) (ℱ : Filtration ℕ ‹MeasurableSpace Ω›)
    (X : ℕ → Ω → Fin d → ℝ) (T : ℕ) : Set (Measure Ω) :=
  {Q | IsProbabilityMeasure Q ∧ Q ≪ P ∧ Martingale (fun t => X (min t T)) ℱ Q}

/-- 1.2 The equivalent martingale measures: the martingale measures `Q` with `P ≪ Q`. -/
def equivMartingaleMeasures (P : Measure Ω) (ℱ : Filtration ℕ ‹MeasurableSpace Ω›)
    (X : ℕ → Ω → Fin d → ℝ) (T : ℕ) : Set (Measure Ω) :=
  {Q | Q ∈ martingaleMeasures P ℱ X T ∧ P ≪ Q}

/-- 1.3 Pricing an attainable claim: under every martingale measure `Q ≪ P` the initial
capital of an almost surely replicated claim is its `Q`-mean, and the replicating wealth is
its `Q`-conditional expectation at every date up to the horizon. -/
theorem integral_eq_and_condExp_eq_of_attainable [Finite Ω] {P Q : Measure Ω}
    {ℱ : Filtration ℕ ‹MeasurableSpace Ω›} {X : ℕ → Ω → Fin d → ℝ} {T : ℕ}
    (hQ : Q ∈ martingaleMeasures P ℱ X T) {f : Ω → ℝ} {a : ℝ} {H : ℕ → Ω → Fin d → ℝ}
    (hH : StronglyAdapted ℱ H) (hf : f =ᵐ[P] fun ω => a + gains X H T ω) :
    ∫ ω, f ω ∂Q = a ∧ ∀ t ≤ T, Q[f | ℱ t] =ᵐ[Q] fun ω => a + gains X H t ω := by
  sorry

/-- 1.4 The first fundamental theorem for `d` assets on a finite space: no arbitrage holds iff
an equivalent martingale measure exists. -/
theorem noArbitrage_iff_nonempty_equivMartingaleMeasures [Finite Ω] {P : Measure Ω}
    [IsProbabilityMeasure P] {ℱ : Filtration ℕ ‹MeasurableSpace Ω›} {X : ℕ → Ω → Fin d → ℝ}
    {T : ℕ} (hX : ∀ t ≤ T, StronglyMeasurable[ℱ t] (X t)) :
    NoArbitrage P ℱ X T ↔ (equivMartingaleMeasures P ℱ X T).Nonempty := by
  sorry

/-- 1.5 At `d = 1` the market is Tau Ceti's one-stock market: for a positive bond `β`, no
arbitrage of the discounted stock `S / β` holds iff no self-financing strategy of Tau Ceti
trading at the dates `0, 1, …, n + 1`, with stock holdings chosen at the start of each period,
is an arbitrage. -/
theorem noArbitrage_div_iff_forall_isSelfFinancing {P : Measure Ω}
    {ℱ : Filtration ℕ ‹MeasurableSpace Ω›} {S β : ℕ → Ω → ℝ} {n : ℕ}
    (hβ : ∀ t ≤ n + 1, ∀ ω, 0 < β t ω) :
    NoArbitrage P ℱ (fun t ω (_ : Fin 1) => S t ω / β t ω) (n + 1) ↔
      ∀ a b : ℕ → Ω → ℝ, (∀ j < n + 1, StronglyMeasurable[ℱ j] (a j)) →
        TauCeti.Finance.IsSelfFinancing id (n + 1) a b S β →
        ¬ TauCeti.Finance.IsArbitrage P (fun ω => a 0 ω * S 0 ω + b 0 ω * β 0 ω)
          (fun ω => a n ω * S (n + 1) ω + b n ω * β (n + 1) ω) := by
  sorry

/-! ## Layer 2: completeness -/

/-- 2.1 Completeness: every `ℱ T`-measurable claim is replicated almost surely from a
constant initial capital. -/
def IsCompleteMarket (P : Measure Ω) (ℱ : Filtration ℕ ‹MeasurableSpace Ω›)
    (X : ℕ → Ω → Fin d → ℝ) (T : ℕ) : Prop :=
  ∀ f : Ω → ℝ, StronglyMeasurable[ℱ T] f →
    ∃ a : ℝ, ∃ H : ℕ → Ω → Fin d → ℝ, StronglyAdapted ℱ H ∧
      f =ᵐ[P] fun ω => a + gains X H T ω

/-- 2.1 The atom of `ω` in a σ-algebra `m`: the intersection of the `m`-measurable sets
containing `ω`. -/
def atomOf (m : MeasurableSpace Ω) (ω : Ω) : Set Ω :=
  ⋂₀ {s | MeasurableSet[m] s ∧ ω ∈ s}

/-- 2.2 The second fundamental theorem: under no arbitrage the market is complete iff all
equivalent martingale measures agree on `ℱ T`. -/
theorem isCompleteMarket_iff_subsingleton_trim [Finite Ω] {P : Measure Ω}
    {ℱ : Filtration ℕ ‹MeasurableSpace Ω›} {X : ℕ → Ω → Fin d → ℝ} {T : ℕ}
    (hX : ∀ t ≤ T, StronglyMeasurable[ℱ t] (X t)) (hNA : NoArbitrage P ℱ X T) :
    IsCompleteMarket P ℱ X T ↔
      ((fun Q : Measure Ω => Q.trim (ℱ.le T)) ''
        equivMartingaleMeasures P ℱ X T).Subsingleton := by
  sorry

/-- 2.3 In a complete arbitrage-free market every atom of `ℱ t`, `t < T`, meets at most
`d + 1` atoms of `ℱ (t + 1)` in points of positive mass. -/
theorem ncard_image_atomOf_le [Finite Ω] {P : Measure Ω}
    {ℱ : Filtration ℕ ‹MeasurableSpace Ω›} {X : ℕ → Ω → Fin d → ℝ} {T : ℕ}
    (hX : ∀ t ≤ T, StronglyMeasurable[ℱ t] (X t)) (hNA : NoArbitrage P ℱ X T)
    (hC : IsCompleteMarket P ℱ X T) {t : ℕ} (ht : t < T) (ω₀ : Ω) :
    (atomOf (ℱ (t + 1)) '' {ω | P {ω} ≠ 0 ∧ ω ∈ atomOf (ℱ t) ω₀}).ncard ≤ d + 1 := by
  sorry

/-! ## Layer 3: superhedging and the optional decomposition -/

/-- 3.1 The superhedging prices of a claim `f`: the initial capitals from which some adapted
holdings dominate `f` almost surely at `T`. -/
def superhedgingPrices (P : Measure Ω) (ℱ : Filtration ℕ ‹MeasurableSpace Ω›)
    (X : ℕ → Ω → Fin d → ℝ) (T : ℕ) (f : Ω → ℝ) : Set ℝ :=
  {a | ∃ H : ℕ → Ω → Fin d → ℝ, StronglyAdapted ℱ H ∧ f ≤ᵐ[P] fun ω => a + gains X H T ω}

/-- 3.2 Superhedging duality: the least superhedging price exists; it is the largest mean of
`f` over the absolutely continuous martingale measures and the least upper bound of its means
over the equivalent ones. -/
theorem superhedging_duality [Finite Ω] [MeasurableSingletonClass Ω]
    {P : Measure Ω} [IsProbabilityMeasure P]
    {ℱ : Filtration ℕ ‹MeasurableSpace Ω›} {X : ℕ → Ω → Fin d → ℝ} {T : ℕ}
    (hX : ∀ t ≤ T, StronglyMeasurable[ℱ t] (X t)) (hNA : NoArbitrage P ℱ X T) (f : Ω → ℝ) :
    ∃ π : ℝ, IsLeast (superhedgingPrices P ℱ X T f) π ∧
      IsGreatest ((fun Q => ∫ ω, f ω ∂Q) '' martingaleMeasures P ℱ X T) π ∧
      IsLUB ((fun Q => ∫ ω, f ω ∂Q) '' equivMartingaleMeasures P ℱ X T) π := by
  sorry

/-- 3.3 The means of a claim over the equivalent martingale measures form a single point, and
then the claim is attainable at that price, or an open interval. -/
theorem image_equivMartingaleMeasures_eq [Finite Ω] [MeasurableSingletonClass Ω]
    {P : Measure Ω} [IsProbabilityMeasure P]
    {ℱ : Filtration ℕ ‹MeasurableSpace Ω›} {X : ℕ → Ω → Fin d → ℝ} {T : ℕ}
    (hX : ∀ t ≤ T, StronglyMeasurable[ℱ t] (X t)) (hNA : NoArbitrage P ℱ X T) (f : Ω → ℝ) :
    (∃ c : ℝ, (fun Q => ∫ ω, f ω ∂Q) '' equivMartingaleMeasures P ℱ X T = {c} ∧
        ∃ H : ℕ → Ω → Fin d → ℝ, StronglyAdapted ℱ H ∧ f =ᵐ[P] fun ω => c + gains X H T ω) ∨
      ∃ lo hi : ℝ, lo < hi ∧
        (fun Q => ∫ ω, f ω ∂Q) '' equivMartingaleMeasures P ℱ X T = Set.Ioo lo hi := by
  sorry

/-- 3.4 With `ℱ 0` trivial, `a` is an arbitrage-free price of an `ℱ T`-measurable claim `f`
(some adapted price process from `a` to `f` keeps the enlarged market free of arbitrage) iff
`a` is the mean of `f` under an equivalent martingale measure. -/
theorem exists_noArbitrage_snoc_iff [Finite Ω] {P : Measure Ω} [IsProbabilityMeasure P]
    {ℱ : Filtration ℕ ‹MeasurableSpace Ω›} {X : ℕ → Ω → Fin d → ℝ} {T : ℕ}
    (hX : ∀ t ≤ T, StronglyMeasurable[ℱ t] (X t))
    (h0 : ∀ s, MeasurableSet[ℱ 0] s → s = ∅ ∨ s = Set.univ) {f : Ω → ℝ}
    (hf : StronglyMeasurable[ℱ T] f) (a : ℝ) :
    (∃ Y : ℕ → Ω → ℝ, (∀ t ≤ T, StronglyMeasurable[ℱ t] (Y t)) ∧ Y 0 = (fun _ => a) ∧
        Y T = f ∧ NoArbitrage P ℱ (fun t ω => Fin.snoc (X t ω) (Y t ω)) T) ↔
      a ∈ (fun Q => ∫ ω, f ω ∂Q) '' equivMartingaleMeasures P ℱ X T := by
  sorry

/-- 3.5 The optional decomposition: an adapted process is a supermartingale under every
equivalent martingale measure iff it is one under every absolutely continuous martingale
measure iff it is its initial value plus gains minus an adapted nondecreasing process
starting at `0`. -/
theorem optional_decomposition [Finite Ω] {P : Measure Ω}
    {ℱ : Filtration ℕ ‹MeasurableSpace Ω›} {X : ℕ → Ω → Fin d → ℝ} {T : ℕ}
    (hX : ∀ t ≤ T, StronglyMeasurable[ℱ t] (X t)) (hNA : NoArbitrage P ℱ X T)
    {V : ℕ → Ω → ℝ} (hV : ∀ t ≤ T, StronglyMeasurable[ℱ t] (V t)) :
    List.TFAE
      [∀ Q ∈ equivMartingaleMeasures P ℱ X T, Supermartingale (fun t => V (min t T)) ℱ Q,
       ∀ Q ∈ martingaleMeasures P ℱ X T, Supermartingale (fun t => V (min t T)) ℱ Q,
       ∃ H : ℕ → Ω → Fin d → ℝ, ∃ C : ℕ → Ω → ℝ, StronglyAdapted ℱ H ∧
         (∀ t ≤ T, StronglyMeasurable[ℱ t] (C t)) ∧ C 0 = 0 ∧
         (∀ t < T, C t ≤ᵐ[P] C (t + 1)) ∧
         ∀ t ≤ T, V t =ᵐ[P] fun ω => V 0 ω + gains X H t ω - C t ω] := by
  sorry

/-! ## Layer 4: the Cox–Ross–Rubinstein tree -/

/-- 4.1 The coin revealed at time `t`: the coordinate `t - 1` of the path, as `1` or `0`, for
`1 ≤ t ≤ T`, and `0` otherwise. -/
def crrCoin (T t : ℕ) (ω : Fin T → Bool) : ℝ :=
  if h : 0 < t ∧ t ≤ T then (if ω ⟨t - 1, by omega⟩ then 1 else 0) else 0

/-- 4.1 The filtration of the tree: `ℱ t` is generated by the first `t` coordinates. -/
noncomputable def crrFiltration (T : ℕ) :
    Filtration ℕ (inferInstance : MeasurableSpace (Fin T → Bool)) :=
  Filtration.natural (crrCoin T) fun _ => .of_discrete

/-- 4.1 The discounted price `S₀ ∏_{k < t} (1 + R k)` of the single asset, with discounted
return `R k = b` on an up move and `a` on a down move. -/
def crrPrice (T : ℕ) (S₀ a b : ℝ) (t : ℕ) (ω : Fin T → Bool) : Fin 1 → ℝ :=
  fun _ => S₀ * ∏ k ∈ univ.filter (fun k : Fin T => (k : ℕ) < t),
    (if ω k then 1 + b else 1 + a)

/-- 4.1 The product measure on the paths with up-probability `q`. -/
noncomputable def crrMeasure (T : ℕ) (q : ℝ) : Measure (Fin T → Bool) :=
  ∑ ω, ENNReal.ofReal (∏ k, if ω k then q else 1 - q) • Measure.dirac ω

/-- 4.2 No arbitrage in the tree iff the discounted returns straddle `0`. -/
theorem crr_noArbitrage_iff {T : ℕ} {P : Measure (Fin T → Bool)}
    (hP : ∀ ω, P {ω} ≠ 0) {S₀ a b : ℝ} (hS₀ : 0 < S₀) (hab : a < b) (hT : 1 ≤ T) :
    NoArbitrage P (crrFiltration T) (crrPrice T S₀ a b) T ↔ a < 0 ∧ 0 < b := by
  sorry

/-- 4.3 When `-1 < a < 0 < b` the tree has exactly one equivalent martingale measure: the
product measure with up-probability `-a / (b - a)`. -/
theorem crr_equivMartingaleMeasures {T : ℕ} {P : Measure (Fin T → Bool)}
    (hP : ∀ ω, P {ω} ≠ 0) {S₀ a b : ℝ} (hS₀ : 0 < S₀) (ha₁ : -1 < a) (ha : a < 0)
    (hb : 0 < b) :
    equivMartingaleMeasures P (crrFiltration T) (crrPrice T S₀ a b) T =
      {crrMeasure T (-a / (b - a))} := by
  sorry

/-! ## Layer 5: American claims -/

/-- 5.1 The superhedging prices of an American claim with discounted payoff process `Z`: the
initial capitals from which some adapted holdings keep the wealth above the payoff at every
date up to `T`, almost surely. -/
def americanSuperhedgingPrices (P : Measure Ω) (ℱ : Filtration ℕ ‹MeasurableSpace Ω›)
    (X : ℕ → Ω → Fin d → ℝ) (T : ℕ) (Z : ℕ → Ω → ℝ) : Set ℝ :=
  {a | ∃ H : ℕ → Ω → Fin d → ℝ, StronglyAdapted ℱ H ∧
    ∀ t ≤ T, Z t ≤ᵐ[P] fun ω => a + gains X H t ω}

/-- 5.2 In a complete market the least superhedging price of an American claim is the mean of
its Snell envelope at `0` under the equivalent martingale measure, and a superhedge from that
capital replicates the payoff at the first time the envelope meets it. -/
theorem isLeast_americanSuperhedgingPrices [Finite Ω] {P Q : Measure Ω}
    {ℱ : Filtration ℕ ‹MeasurableSpace Ω›} {X : ℕ → Ω → Fin d → ℝ} {T : ℕ}
    (hC : IsCompleteMarket P ℱ X T) (hQ : Q ∈ equivMartingaleMeasures P ℱ X T) {Z : ℕ → Ω → ℝ}
    (hZ : ∀ t ≤ T, StronglyMeasurable[ℱ t] (Z t)) :
    IsLeast (americanSuperhedgingPrices P ℱ X T Z) (∫ ω, snellEnvelope Q ℱ Z T 0 ω ∂Q) ∧
      ∃ H : ℕ → Ω → Fin d → ℝ, StronglyAdapted ℱ H ∧
        (∀ t ≤ T, Z t ≤ᵐ[P] fun ω => (∫ ω', snellEnvelope Q ℱ Z T 0 ω' ∂Q) + gains X H t ω) ∧
        stoppedValue (fun t ω => (∫ ω', snellEnvelope Q ℱ Z T 0 ω' ∂Q) + gains X H t ω)
            (optimalStoppingTime Q ℱ Z T 0) =ᵐ[P]
          stoppedValue Z (optimalStoppingTime Q ℱ Z T 0) := by
  sorry

/-- 5.3 The American call is worth the European call: for a nonnegative strike and a
positive nondecreasing deterministic numéraire, the Snell envelope of the discounted call
payoff is the conditional expectation of the discounted terminal payoff. -/
theorem snellEnvelope_call_eq_condExp {Q : Measure Ω} [IsProbabilityMeasure Q]
    {ℱ : Filtration ℕ ‹MeasurableSpace Ω›} {X : ℕ → Ω → Fin d → ℝ} {T : ℕ}
    (hQ : Martingale (fun t => X (min t T)) ℱ Q) {B : ℕ → ℝ} (hB : ∀ t ≤ T, 0 < B t)
    (hBm : ∀ t < T, B t ≤ B (t + 1)) {K : ℝ} (hK : 0 ≤ K) (i : Fin d) :
    ∀ t ≤ T, snellEnvelope Q ℱ (fun s ω => max (X s ω i - K / B s) 0) T t =ᵐ[Q]
      Q[fun ω => max (X T ω i - K / B T) 0 | ℱ t] := by
  sorry

end TauCetiRoadmap.DiscreteTimeFinance
