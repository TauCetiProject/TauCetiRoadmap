import Mathlib
import TauCeti.Probability.Quantile

/-!
# Risk measures: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the
few definitions they need; every definition has a real body. Every headline theorem of the README
is statable at the pins and is stated here. The README's remaining targets, API lists and Checks
are not restated.

A position is a function `X : Ω → ℝ`, read as a discounted payoff: larger is better. A risk
measure `ρ` is a real function of positions, read as a capital requirement, with
`ρ (X + m) = ρ X - m` for constants `m` (positions convention). Monotonicity is pointwise:
`X ≤ Y` implies `ρ Y ≤ ρ X`. Layers 1 and 2 work on all functions on a set `Ω` (finite where a
statement says so). Expectations under a probability measure `Q` on a finite set with the
discrete σ-algebra are Bochner integrals `∫ ω, -X ω ∂Q`. Value at Risk and Average Value at
Risk are functions of a law `μ` on `ℝ` and a level `t`, built on Tau Ceti's lower and upper
quantiles, and are applied to the law `P.map X` of a position under a probability measure `P`.
-/

noncomputable section

open MeasureTheory Set

namespace TauCetiRoadmap.RiskMeasures

variable {Ω : Type*}

/-! ## Layer 1: monetary, convex and coherent risk measures and acceptance sets -/

/-- 1.1 A **monetary risk measure**: antitone for the pointwise order and cash invariant,
`ρ (X + m) = ρ X - m` for every constant `m`. -/
def IsMonetaryRiskMeasure (ρ : (Ω → ℝ) → ℝ) : Prop :=
  Antitone ρ ∧ ∀ (X : Ω → ℝ) (m : ℝ), ρ (X + Function.const Ω m) = ρ X - m

/-- 1.1 A **convex risk measure**: a monetary risk measure that is convex. -/
def IsConvexRiskMeasure (ρ : (Ω → ℝ) → ℝ) : Prop :=
  IsMonetaryRiskMeasure ρ ∧ ConvexOn ℝ Set.univ ρ

/-- 1.1 A **coherent risk measure**: a convex risk measure that is positively homogeneous,
`ρ (t • X) = t * ρ X` for `t ≥ 0`. -/
def IsCoherentRiskMeasure (ρ : (Ω → ℝ) → ℝ) : Prop :=
  IsConvexRiskMeasure ρ ∧ ∀ t : ℝ, 0 ≤ t → ∀ X : Ω → ℝ, ρ (t • X) = t * ρ X

/-- 1.1 The **acceptance set** of `ρ`: the positions that need no added capital. -/
def acceptanceSet (ρ : (Ω → ℝ) → ℝ) : Set (Ω → ℝ) :=
  {X | ρ X ≤ 0}

/-- 1.3 The risk measure of a set `A` of acceptable positions: the least constant that makes a
position acceptable, `sInf {m | X + m ∈ A}`. -/
def riskMeasureOf (A : Set (Ω → ℝ)) (X : Ω → ℝ) : ℝ :=
  sInf {m : ℝ | X + Function.const Ω m ∈ A}

/-- 1.2 A monetary risk measure is convex exactly when its acceptance set is convex. -/
theorem convexOn_iff_convex_acceptanceSet {ρ : (Ω → ℝ) → ℝ} (hρ : IsMonetaryRiskMeasure ρ) :
    ConvexOn ℝ Set.univ ρ ↔ Convex ℝ (acceptanceSet ρ) := by
  sorry

/-- 1.2 A monetary risk measure is positively homogeneous exactly when its acceptance set is a
cone. -/
theorem homogeneous_iff_cone_acceptanceSet {ρ : (Ω → ℝ) → ℝ} (hρ : IsMonetaryRiskMeasure ρ) :
    (∀ t : ℝ, 0 ≤ t → ∀ X : Ω → ℝ, ρ (t • X) = t * ρ X) ↔
      ∀ t : ℝ, 0 ≤ t → ∀ X ∈ acceptanceSet ρ, t • X ∈ acceptanceSet ρ := by
  sorry

/-- 1.3 On a finite set, a set of positions that contains a constant, makes every
`{m | X + m ∈ A}` bounded below and is closed under increase defines a monetary risk measure,
whose acceptance set is the closure of `A`. -/
theorem riskMeasureOf_isMonetary_and_acceptanceSet_eq [Finite Ω] {A : Set (Ω → ℝ)}
    (hconst : ∃ c : ℝ, Function.const Ω c ∈ A)
    (hbdd : ∀ X : Ω → ℝ, BddBelow {m : ℝ | X + Function.const Ω m ∈ A})
    (hmono : ∀ X ∈ A, ∀ Y : Ω → ℝ, X ≤ Y → Y ∈ A) :
    IsMonetaryRiskMeasure (riskMeasureOf A) ∧ acceptanceSet (riskMeasureOf A) = closure A := by
  sorry

/-! ## Layer 2: dual representations on a finite set -/

/-- 2.1 The **minimal penalty** of `ρ` at a probability measure `Q`: the supremum of the
`Q`-expected loss `∫ -X dQ` over the acceptance set, in the extended reals. -/
def minimalPenalty [MeasurableSpace Ω] (ρ : (Ω → ℝ) → ℝ) (Q : ProbabilityMeasure Ω) : EReal :=
  ⨆ X ∈ acceptanceSet ρ, ((∫ ω, -X ω ∂(Q : Measure Ω) : ℝ) : EReal)

/-- 2.1 **Dual representation of convex risk measures** on a finite set:
`ρ X = max_Q (E_Q[-X] - α_min Q)`, the maximum over all probability measures, attained. -/
theorem isGreatest_sub_minimalPenalty [Finite Ω] [MeasurableSpace Ω] [DiscreteMeasurableSpace Ω]
    {ρ : (Ω → ℝ) → ℝ} (hρ : IsConvexRiskMeasure ρ) (X : Ω → ℝ) :
    IsGreatest (Set.range fun Q : ProbabilityMeasure Ω =>
        ((∫ ω, -X ω ∂(Q : Measure Ω) : ℝ) : EReal) - minimalPenalty ρ Q) (ρ X : EReal) := by
  sorry

/-- 2.2 **Artzner–Delbaen–Eber–Heath** on a finite set: a coherent risk measure is the maximum
of the expected losses over the probability measures of zero minimal penalty. -/
theorem isGreatest_integral_of_isCoherent [Finite Ω] [MeasurableSpace Ω]
    [DiscreteMeasurableSpace Ω] {ρ : (Ω → ℝ) → ℝ} (hρ : IsCoherentRiskMeasure ρ) (X : Ω → ℝ) :
    IsGreatest ((fun Q : ProbabilityMeasure Ω => ∫ ω, -X ω ∂(Q : Measure Ω)) ''
      {Q | minimalPenalty ρ Q ≤ 0}) (ρ X) := by
  sorry

/-- 2.2 Conversely, the supremum of the expected losses over a nonempty set of probability
measures on a finite set is a coherent risk measure. -/
theorem isCoherent_sSup_integral [Finite Ω] [MeasurableSpace Ω] [DiscreteMeasurableSpace Ω]
    (𝒬 : Set (ProbabilityMeasure Ω)) (h𝒬 : 𝒬.Nonempty) :
    IsCoherentRiskMeasure fun X : Ω → ℝ =>
      sSup ((fun Q : ProbabilityMeasure Ω => ∫ ω, -X ω ∂(Q : Measure Ω)) '' 𝒬) := by
  sorry

/-- 2.3 The **entropic risk measure** `β⁻¹ log E_P[exp (-β X)]`. -/
def entropicRisk [MeasurableSpace Ω] (P : Measure Ω) (β : ℝ) (X : Ω → ℝ) : ℝ :=
  β⁻¹ * Real.log (∫ ω, Real.exp (-(β * X ω)) ∂P)

/-- 2.3 For `β > 0` the entropic risk measure on a finite set is a convex risk measure whose
minimal penalty is the relative entropy divided by `β`: `β * α_min Q = KL(Q ‖ P)`. -/
theorem isConvex_entropicRisk_and_minimalPenalty_eq [Finite Ω] [MeasurableSpace Ω]
    [DiscreteMeasurableSpace Ω] (P : Measure Ω) [IsProbabilityMeasure P] {β : ℝ} (hβ : 0 < β) :
    IsConvexRiskMeasure (entropicRisk P β) ∧
      ∀ Q : ProbabilityMeasure Ω, (β : EReal) * minimalPenalty (entropicRisk P β) Q =
        ((InformationTheory.klDiv (Q : Measure Ω) P : ENNReal) : EReal) := by
  sorry

/-! ## Layer 3: Value at Risk -/

/-- 3.1 **Value at Risk** at level `t` of a law `μ` on `ℝ`: minus its upper `t`-quantile. -/
def valueAtRisk (μ : Measure ℝ) (t : ℝ) : ℝ :=
  -μ.upperQuantile t

/-- 3.1 On any probability space and at every level `0 < t < 1`, Value at Risk of the law of a
position is monotone for almost sure order, cash invariant and positively homogeneous. -/
theorem valueAtRisk_monotone_cash_homogeneous [MeasurableSpace Ω] (P : Measure Ω)
    [IsProbabilityMeasure P] {t : ℝ} (h0 : 0 < t) (h1 : t < 1) :
    (∀ X Y : Ω → ℝ, AEMeasurable X P → AEMeasurable Y P → X ≤ᵐ[P] Y →
        valueAtRisk (P.map Y) t ≤ valueAtRisk (P.map X) t) ∧
      (∀ X : Ω → ℝ, AEMeasurable X P → ∀ m : ℝ,
        valueAtRisk (P.map (X + Function.const Ω m)) t = valueAtRisk (P.map X) t - m) ∧
      (∀ X : Ω → ℝ, AEMeasurable X P → ∀ c : ℝ, 0 ≤ c →
        valueAtRisk (P.map (c • X)) t = c * valueAtRisk (P.map X) t) := by
  sorry

/-- 3.2 **Value at Risk is not subadditive**: at every level `0 < t < 1` there are a probability
measure on a four-point space and two positions whose sum has larger Value at Risk than the sum
of their Values at Risk. -/
theorem exists_valueAtRisk_add_gt {t : ℝ} (h0 : 0 < t) (h1 : t < 1) :
    ∃ (P : Measure (Fin 2 × Fin 2)) (_ : IsProbabilityMeasure P) (X Y : Fin 2 × Fin 2 → ℝ),
      valueAtRisk (P.map X) t + valueAtRisk (P.map Y) t < valueAtRisk (P.map (X + Y)) t := by
  sorry

/-! ## Layer 4: Average Value at Risk -/

/-- 4.1 **Average Value at Risk** at level `t` of a law `μ` on `ℝ`: the average of `valueAtRisk μ s`
over the levels `0 < s < t`. -/
def averageValueAtRisk (μ : Measure ℝ) (t : ℝ) : ℝ :=
  t⁻¹ * ∫ s in Set.Ioo 0 t, valueAtRisk μ s

/-- 4.1 **Rockafellar–Uryasev formula**: for a law with integrable negative part and
`0 < t < 1`, `AVaR_t = min_z (z + t⁻¹ E[(-x - z)⁺])`, and the minimizers are exactly the points
of `[VaR_t, -q⁻(t)]`, with `q⁻` the lower quantile. -/
theorem isLeast_averageValueAtRisk (μ : Measure ℝ) [IsProbabilityMeasure μ]
    (hμ : Integrable (fun x : ℝ => max (-x) 0) μ) {t : ℝ} (h0 : 0 < t) (h1 : t < 1) :
    IsLeast (Set.range fun z : ℝ => z + t⁻¹ * ∫ x, max (-x - z) 0 ∂μ)
        (averageValueAtRisk μ t) ∧
      {z : ℝ | z + t⁻¹ * ∫ x, max (-x - z) 0 ∂μ = averageValueAtRisk μ t} =
        Set.Icc (valueAtRisk μ t) (-μ.quantile t) := by
  sorry

/-- 4.2 **Average Value at Risk is coherent**: on any probability space and at every level
`0 < t < 1`, on positions with integrable negative part it is monotone for almost sure order
(only the smaller position's negative part is assumed integrable), cash invariant, positively
homogeneous and subadditive. -/
theorem averageValueAtRisk_coherent [MeasurableSpace Ω] (P : Measure Ω) [IsProbabilityMeasure P]
    {t : ℝ} (h0 : 0 < t) (h1 : t < 1) :
    (∀ X Y : Ω → ℝ, AEMeasurable X P → AEMeasurable Y P →
        Integrable (fun ω => max (-X ω) 0) P →
        X ≤ᵐ[P] Y → averageValueAtRisk (P.map Y) t ≤ averageValueAtRisk (P.map X) t) ∧
      (∀ X : Ω → ℝ, AEMeasurable X P → Integrable (fun ω => max (-X ω) 0) P → ∀ m : ℝ,
        averageValueAtRisk (P.map (X + Function.const Ω m)) t =
          averageValueAtRisk (P.map X) t - m) ∧
      (∀ X : Ω → ℝ, AEMeasurable X P → Integrable (fun ω => max (-X ω) 0) P → ∀ c : ℝ,
        0 ≤ c → averageValueAtRisk (P.map (c • X)) t = c * averageValueAtRisk (P.map X) t) ∧
      (∀ X Y : Ω → ℝ, AEMeasurable X P → AEMeasurable Y P →
        Integrable (fun ω => max (-X ω) 0) P → Integrable (fun ω => max (-Y ω) 0) P →
        averageValueAtRisk (P.map (X + Y)) t ≤
          averageValueAtRisk (P.map X) t + averageValueAtRisk (P.map Y) t) := by
  sorry

/-- 4.3 **Dual representation of Average Value at Risk**: for an integrable position and
`0 < t ≤ 1`, `AVaR_t` is the maximum of `E_Q[-X]` over the probability measures `Q` with
`t • Q ≤ P`. -/
theorem isGreatest_integral_averageValueAtRisk [MeasurableSpace Ω] (P : Measure Ω)
    [IsProbabilityMeasure P] {X : Ω → ℝ} (hX : Integrable X P) {t : ℝ} (h0 : 0 < t)
    (h1 : t ≤ 1) :
    IsGreatest ((fun Q : ProbabilityMeasure Ω => ∫ ω, -X ω ∂(Q : Measure Ω)) ''
        {Q | ENNReal.ofReal t • (Q : Measure Ω) ≤ P})
      (averageValueAtRisk (P.map X) t) := by
  sorry

end TauCetiRoadmap.RiskMeasures
