import Mathlib
import TauCeti.Probability.Distributions.Dirichlet.Basic

/-!
# Portfolio theory: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the
few definitions they need; every definition has a real body. Every headline theorem of the README
is statable at the pins and is stated here. The README's remaining targets, API lists and Checks
are not restated.

A market with `m` assets is described by price relatives `X : Ω → Fin m → ℝ` (one period) or
`X : ℕ → Ω → Fin m → ℝ` (period `t`), with nonnegative coordinates; a portfolio is a point of
`portfolios m = simplex (Fin m)`, the image of Mathlib's `Convexity.StdSimplex ℝ (Fin m)` in
`Fin m → ℝ`, with `simplex` copied verbatim from RegretMinimizationAndEquilibria, Layer 1, 1.1,
and its return is the dot product `b ⬝ᵥ X ω`. Since `Real.log`
is `0` at `0`, every statement that takes the logarithm of a return either assumes the return
positive almost surely or excludes the portfolios whose return vanishes with positive
probability. The expected score of an asset is a lower integral in `ℝ≥0∞`, where a positive
number divided by `0` is `∞`. The universal portfolio averages over Tau Ceti's Dirichlet law
with all parameters `1`, the uniform law on the simplex.
-/

noncomputable section

open MeasureTheory ProbabilityTheory Filter Finset Matrix
open scoped ENNReal Topology

namespace TauCetiRoadmap.PortfolioTheory

/-! ## Layer 1: log-optimal portfolios for one period -/

-- 1.1 (copied verbatim from RegretMinimizationAndEquilibria, Layer 1, 1.1)
/-- The probability simplex on a finite type, as a set of weight vectors: the weights of
Mathlib's `Convexity.StdSimplex`. -/
def simplex (ι : Type*) : Set (ι → ℝ) :=
  Set.range fun p : Convexity.StdSimplex ℝ ι ↦ ⇑p.weights

/-- 1.1 The portfolios on `m` assets: `simplex (Fin m)`, the image in `Fin m → ℝ` of Mathlib's
standard simplex `Convexity.StdSimplex ℝ (Fin m)`, that is the nonnegative vectors whose
coordinates sum to `1`. -/
abbrev portfolios (m : ℕ) : Set (Fin m → ℝ) :=
  simplex (Fin m)

section OnePeriod

variable {Ω : Type*} [MeasurableSpace Ω] {m : ℕ}

/-- 1.1 The growth rate of `b` relative to the sum of the price relatives: the expectation of
`log (⟨b, X⟩ / ∑ j, X j)`. -/
def relGrowthRate (P : Measure Ω) (X : Ω → Fin m → ℝ) (b : Fin m → ℝ) : ℝ :=
  ∫ ω, Real.log (b ⬝ᵥ X ω / ∑ j, X ω j) ∂P

/-- 1.1 The growth rate `E log ⟨b, X⟩`. -/
def growthRate (P : Measure Ω) (X : Ω → Fin m → ℝ) (b : Fin m → ℝ) : ℝ :=
  ∫ ω, Real.log (b ⬝ᵥ X ω) ∂P

/-- 1.1 A portfolio whose return is almost surely positive and whose relative log return is
integrable, so that its relative growth rate is a real number. -/
def IsAdmissible (P : Measure Ω) (X : Ω → Fin m → ℝ) (b : Fin m → ℝ) : Prop :=
  b ∈ portfolios m ∧ (∀ᵐ ω ∂P, 0 < b ⬝ᵥ X ω) ∧
    Integrable (fun ω ↦ Real.log (b ⬝ᵥ X ω / ∑ j, X ω j)) P

/-- 1.1 A log-optimal portfolio: an admissible portfolio whose relative growth rate is at least
that of every admissible portfolio. -/
def IsLogOptimal (P : Measure Ω) (X : Ω → Fin m → ℝ) (b : Fin m → ℝ) : Prop :=
  IsAdmissible P X b ∧ ∀ b', IsAdmissible P X b' → relGrowthRate P X b' ≤ relGrowthRate P X b

/-- 1.2 The expected score of asset `j` at the portfolio `b`, `E[X j / ⟨b, X⟩]`, computed in
`ℝ≥0∞`. -/
def score (P : Measure Ω) (X : Ω → Fin m → ℝ) (b : Fin m → ℝ) (j : Fin m) : ℝ≥0∞ :=
  ∫⁻ ω, ENNReal.ofReal (X ω j) / ENNReal.ofReal (b ⬝ᵥ X ω) ∂P

/-- 1.2 The Kuhn–Tucker conditions: a portfolio is log-optimal if and only if every expected
score is at most `1`, and at a log-optimal portfolio the score of every asset held is exactly
`1`. -/
theorem isLogOptimal_iff_score_le_one (P : Measure Ω) [IsProbabilityMeasure P]
    (X : Ω → Fin m → ℝ) (hXm : Measurable X) (hX : ∀ ω j, 0 ≤ X ω j)
    (hsum : ∀ᵐ ω ∂P, 0 < ∑ j, X ω j) (b : Fin m → ℝ) :
    (IsLogOptimal P X b ↔ b ∈ portfolios m ∧ ∀ j, score P X b j ≤ 1) ∧
      (IsLogOptimal P X b → ∀ j, 0 < b j → score P X b j = 1) := by
  sorry

/-- 1.3 A log-optimal portfolio exists. -/
theorem exists_isLogOptimal (P : Measure Ω) [IsProbabilityMeasure P] (X : Ω → Fin m → ℝ)
    (hXm : Measurable X) (hX : ∀ ω j, 0 ≤ X ω j) (hsum : ∀ᵐ ω ∂P, 0 < ∑ j, X ω j) :
    ∃ b, IsLogOptimal P X b := by
  sorry

/-- 1.3 Any two log-optimal portfolios have almost surely equal returns. -/
theorem ae_eq_of_isLogOptimal (P : Measure Ω) [IsProbabilityMeasure P] (X : Ω → Fin m → ℝ)
    (hXm : Measurable X) (hX : ∀ ω j, 0 ≤ X ω j) (hsum : ∀ᵐ ω ∂P, 0 < ∑ j, X ω j)
    {b b' : Fin m → ℝ} (hb : IsLogOptimal P X b) (hb' : IsLogOptimal P X b') :
    (fun ω ↦ b ⬝ᵥ X ω) =ᵐ[P] fun ω ↦ b' ⬝ᵥ X ω := by
  sorry

/-- 1.4 The horse-race market with odds `o`: when horse `ω` wins, asset `ω` pays `o ω` per unit
and every other asset pays nothing. -/
def horseRace (o : Fin m → ℝ) (ω : Fin m) : Fin m → ℝ :=
  Pi.single ω (o ω)

/-- 1.4 In a horse race with positive odds, the log-optimal portfolios are exactly the
win-probability vector, whatever the odds. -/
theorem isLogOptimal_horseRace_iff (P : Measure (Fin m)) [IsProbabilityMeasure P]
    (o : Fin m → ℝ) (ho : ∀ j, 0 < o j) (b : Fin m → ℝ) :
    IsLogOptimal P (horseRace o) b ↔ b = fun j ↦ P.real {j} := by
  sorry

/-- 1.5 The growth rate of betting the fraction `f` of wealth on an event of probability `p`
at net odds `o` to `1`. -/
def kellyGrowth (p o f : ℝ) : ℝ :=
  p * Real.log (1 + o * f) + (1 - p) * Real.log (1 - f)

/-- 1.5 Kelly's criterion: for `0 ≤ p < 1` and `o > 0`, the fraction `max 0 (p - (1 - p) / o)`
is the unique maximizer of the growth rate over `[0, 1)`. -/
theorem kelly_isGreatest {p o : ℝ} (hp0 : 0 ≤ p) (hp1 : p < 1) (ho : 0 < o) :
    max 0 (p - (1 - p) / o) ∈ Set.Ico (0 : ℝ) 1 ∧
      IsGreatest (kellyGrowth p o '' Set.Ico 0 1) (kellyGrowth p o (max 0 (p - (1 - p) / o))) ∧
      ∀ f ∈ Set.Ico (0 : ℝ) 1,
        kellyGrowth p o f = kellyGrowth p o (max 0 (p - (1 - p) / o)) →
          f = max 0 (p - (1 - p) / o) := by
  sorry

end OnePeriod

/-! ## Layer 2: repeated investment and asymptotic optimality -/

section Repeated

variable {Ω : Type*} {m : ℕ}

/-- 2.1 The wealth after `n` periods of the strategy `b` from initial wealth `1`. -/
def wealth (b X : ℕ → Ω → Fin m → ℝ) (n : ℕ) (ω : Ω) : ℝ :=
  ∏ t ∈ range n, b t ω ⬝ᵥ X t ω

/-- 2.1 The asymptotic optimality principle: if the strategy `bstar` satisfies the conditional
Kuhn–Tucker conditions, then for every nonanticipating strategy `b` the wealth ratio is a
nonnegative supermartingale of mean at most `1` that converges almost surely to a limit of mean
at most `1`, and almost surely, for every `ε > 0`, eventually `S_n ≤ exp (ε n) S*_n`. -/
theorem logOptimal_asymptotic {m0 : MeasurableSpace Ω} (P : Measure Ω) [IsProbabilityMeasure P]
    (ℱ : Filtration ℕ m0) (X b bstar : ℕ → Ω → Fin m → ℝ)
    (hX : ∀ t ω j, 0 ≤ X t ω j) (hXm : ∀ t, StronglyMeasurable[ℱ (t + 1)] (X t))
    (hbm : ∀ t, StronglyMeasurable[ℱ t] (b t)) (hb : ∀ t ω, b t ω ∈ portfolios m)
    (hbsm : ∀ t, StronglyMeasurable[ℱ t] (bstar t))
    (hbs : ∀ t ω, bstar t ω ∈ portfolios m)
    (hpos : ∀ t, ∀ᵐ ω ∂P, 0 < bstar t ω ⬝ᵥ X t ω)
    (hint : ∀ t j, Integrable (fun ω ↦ X t ω j / (bstar t ω ⬝ᵥ X t ω)) P)
    (hKT : ∀ t j, P[fun ω ↦ X t ω j / (bstar t ω ⬝ᵥ X t ω) | ℱ t] ≤ᵐ[P] 1) :
    Supermartingale (fun n ω ↦ wealth b X n ω / wealth bstar X n ω) ℱ P ∧
      (∀ n, ∫ ω, wealth b X n ω / wealth bstar X n ω ∂P ≤ 1) ∧
      (∃ Y : Ω → ℝ, Integrable Y P ∧ ∫ ω, Y ω ∂P ≤ 1 ∧
        ∀ᵐ ω ∂P, Tendsto (fun n ↦ wealth b X n ω / wealth bstar X n ω) atTop (𝓝 (Y ω))) ∧
      ∀ᵐ ω ∂P, ∀ ε > 0, ∀ᶠ n in atTop,
        wealth b X n ω ≤ Real.exp (ε * n) * wealth bstar X n ω := by
  sorry

/-- 2.2 Breiman's theorem for independent, identically distributed price relatives: the
constant log-optimal portfolio is asymptotically at least as good as every nonanticipating
strategy, and when `log ∑ j, X 0 j` is integrable its wealth grows at the exponential rate
`E log ⟨bstar, X 0⟩`. -/
theorem breiman [MeasurableSpace Ω] (P : Measure Ω) [IsProbabilityMeasure P]
    (X : ℕ → Ω → Fin m → ℝ) (hXm : ∀ t, Measurable (X t)) (hind : iIndepFun X P)
    (hid : ∀ t, IdentDistrib (X t) (X 0) P P) (hX : ∀ t ω j, 0 ≤ X t ω j)
    (hsum : ∀ᵐ ω ∂P, 0 < ∑ j, X 0 ω j) {bstar : Fin m → ℝ} (hbs : IsLogOptimal P (X 0) bstar)
    (g : (t : ℕ) → (Fin t → Fin m → ℝ) → Fin m → ℝ) (hgm : ∀ t, Measurable (g t))
    (hg : ∀ t y, g t y ∈ portfolios m) :
    (∀ᵐ ω ∂P, ∀ ε > 0, ∀ᶠ n in atTop,
        wealth (fun t ω ↦ g t fun s ↦ X s ω) X n ω ≤
          Real.exp (ε * n) * wealth (fun _ _ ↦ bstar) X n ω) ∧
      (Integrable (fun ω ↦ Real.log (∑ j, X 0 ω j)) P →
        ∀ᵐ ω ∂P, Tendsto (fun n : ℕ ↦ Real.log (wealth (fun _ _ ↦ bstar) X n ω) / n) atTop
          (𝓝 (growthRate P (X 0) bstar))) := by
  sorry

end Repeated

/-! ## Layer 3: the universal portfolio -/

section Universal

variable {m : ℕ}

/-- 3.1 The wealth after `n` periods of the constant rebalanced portfolio `b` on the market
sequence `x`. -/
def crpWealth (x : ℕ → Fin m → ℝ) (n : ℕ) (b : Fin m → ℝ) : ℝ :=
  ∏ i ∈ range n, b ⬝ᵥ x i

/-- 3.1 The uniform law on the portfolio simplex: Tau Ceti's Dirichlet law with all parameters
`1`. -/
abbrev uniformSimplex (m : ℕ) : Measure (EuclideanSpace ℝ (Fin m)) :=
  TauCeti.Probability.dirichletMeasure fun _ ↦ (1 : ℝ)

/-- 3.1 The average of the constant rebalanced wealths over the uniform law on the simplex. -/
def universalWealth (x : ℕ → Fin m → ℝ) (n : ℕ) : ℝ :=
  ∫ b, crpWealth x n (fun j ↦ b j) ∂uniformSimplex m

/-- 3.1 Cover's universal portfolio for period `n` (counting from `0`): the average of all
portfolios weighted by the wealth they have earned in the first `n` periods. -/
def universalPortfolio (x : ℕ → Fin m → ℝ) (n : ℕ) (j : Fin m) : ℝ :=
  (∫ b, b j * crpWealth x n (fun k ↦ b k) ∂uniformSimplex m) / universalWealth x n

/-- 3.1 The wealth of the universal portfolio is the average constant rebalanced wealth. -/
theorem prod_universalPortfolio_eq [NeZero m] (x : ℕ → Fin m → ℝ) (hx : ∀ i j, 0 ≤ x i j)
    (n : ℕ) : ∏ i ∈ range n, universalPortfolio x i ⬝ᵥ x i = universalWealth x n := by
  sorry

/-- 3.2 Cover's bound in the form of Blum and Kalai: on every market sequence with nonnegative
price relatives, every constant rebalanced portfolio earns at most `(n + m - 1 choose m - 1)`
times the wealth of the universal portfolio. -/
theorem crpWealth_le_choose_mul_universalWealth (x : ℕ → Fin m → ℝ) (hx : ∀ i j, 0 ≤ x i j)
    (n : ℕ) {b : Fin m → ℝ} (hb : b ∈ portfolios m) :
    crpWealth x n b ≤ ((n + m - 1).choose (m - 1) : ℝ) * universalWealth x n := by
  sorry

end Universal

/-! ## Layer 4: the mean–variance frontier -/

section MeanVariance

variable {ι : Type*} [Fintype ι]

/-- 4.1 A portfolio with weights summing to `1` and mean return `r`; short positions are
allowed. -/
def IsFeasible (μ : ι → ℝ) (r : ℝ) (w : ι → ℝ) : Prop :=
  ∑ i, w i = 1 ∧ μ ⬝ᵥ w = r

/-- 4.1 A frontier portfolio: a feasible portfolio of least variance `w ⬝ᵥ S *ᵥ w` among the
feasible portfolios of the same mean. -/
def IsFrontier (S : Matrix ι ι ℝ) (μ : ι → ℝ) (r : ℝ) (w : ι → ℝ) : Prop :=
  IsFeasible μ r w ∧ ∀ v, IsFeasible μ r v → w ⬝ᵥ (S *ᵥ w) ≤ v ⬝ᵥ (S *ᵥ v)

/-- 4.1 For a positive semidefinite covariance matrix, a feasible portfolio is a frontier
portfolio if and only if `S *ᵥ w` is a combination of the constant vector `1` and `μ`. -/
theorem isFrontier_iff {S : Matrix ι ι ℝ} (hS : S.PosSemidef) {μ : ι → ℝ} {r : ℝ}
    {w : ι → ℝ} (hw : IsFeasible μ r w) :
    IsFrontier S μ r w ↔ ∃ a c : ℝ, S *ᵥ w = a • (1 : ι → ℝ) + c • μ := by
  sorry

/-- 4.2 For a positive semidefinite covariance matrix, a frontier portfolio exists for every
attainable mean. -/
theorem exists_isFrontier {S : Matrix ι ι ℝ} (hS : S.PosSemidef) {μ : ι → ℝ} {r : ℝ}
    (h : ∃ v, IsFeasible μ r v) : ∃ w, IsFrontier S μ r w := by
  sorry

/-- 4.3 The two-fund theorem: every affine combination of two frontier portfolios is a frontier
portfolio for the corresponding mean. No hypothesis on `S` is needed. -/
theorem isFrontier_affineCombination {S : Matrix ι ι ℝ} {μ : ι → ℝ} {r₁ r₂ : ℝ}
    {w₁ w₂ : ι → ℝ} (h₁ : IsFrontier S μ r₁ w₁) (h₂ : IsFrontier S μ r₂ w₂) (α : ℝ) :
    IsFrontier S μ (α * r₁ + (1 - α) * r₂) (α • w₁ + (1 - α) • w₂) := by
  sorry

/-- 4.4 The frontier for a positive definite covariance matrix when `1` and `μ` are linearly
independent: with `A = μ ⬝ᵥ S⁻¹ *ᵥ μ`, `B = 1 ⬝ᵥ S⁻¹ *ᵥ μ`, `C = 1 ⬝ᵥ S⁻¹ *ᵥ 1` and
`D = A C - B²`, the frontier portfolio of mean `r` is unique, equal to
`S⁻¹ *ᵥ (((A - B r) / D) • 1 + ((C r - B) / D) • μ)`, and its variance is
`(C r² - 2 B r + A) / D`. -/
theorem isFrontier_iff_eq_of_posDef [DecidableEq ι] {S : Matrix ι ι ℝ} (hS : S.PosDef) {μ : ι → ℝ}
    (hind : LinearIndependent ℝ ![(1 : ι → ℝ), μ]) (r : ℝ) (w : ι → ℝ) :
    let A := μ ⬝ᵥ (S⁻¹ *ᵥ μ)
    let B := (1 : ι → ℝ) ⬝ᵥ (S⁻¹ *ᵥ μ)
    let C := (1 : ι → ℝ) ⬝ᵥ (S⁻¹ *ᵥ (1 : ι → ℝ))
    let D := A * C - B ^ 2
    (IsFrontier S μ r w ↔
        w = S⁻¹ *ᵥ (((A - B * r) / D) • (1 : ι → ℝ) + ((C * r - B) / D) • μ)) ∧
      (IsFrontier S μ r w → w ⬝ᵥ (S *ᵥ w) = (C * r ^ 2 - 2 * B * r + A) / D) := by
  sorry

end MeanVariance

end TauCetiRoadmap.PortfolioTheory
