module

public import Mathlib
public import TauCeti.Probability.StochasticOrder
public import TauCeti.Probability.Hazard
public import TauCeti.Probability.Quantile.Map
public import TauCeti.Analysis.Convex.LogConcave
public import TauCeti.Probability.Process.EmpiricalMeasure
public import TauCeti.MeasureTheory.OptimalTransport.Compactness

/-!
# Stochastic orders: target signatures

This file is not the roadmap: the roadmap is `README.md`, and this file is not an exhaustive
checklist. It states, against the pinned Mathlib and Tau Ceti and each with `sorry`, the
headlines of the README that carry a Lean name, each with every conclusion the README attaches
to it, together with the definitions their statements need. The README's other headlines are
targets of the same standing, stated there in prose with their locators or proof routes, and are
not stated here.

The conventions of the README are used throughout. Laws are probability measures on `ℝ` unless a
statement says otherwise. The usual stochastic order `μ ≤st ν` is not a definition: it is written
`∀ x, cdf ν x ≤ cdf μ x`, as in StandardDistributions §7.13 and Tau Ceti's
`TauCeti/Probability/StochasticOrder.lean`. The other orders compare survival functions
`μ.real (Ioi x)`, distribution functions `μ.real (Iic x)`, masses of ordered pairs of sets,
stop-loss integrals `∫ max (x - t) 0`, and lower quantiles `MeasureTheory.Measure.quantile`;
orders that need a first moment carry `Integrable id` in their definition. The implementation
namespace of the README is `TauCeti`; the prototypes live in this roadmap's namespace.
-/

@[expose] public section

noncomputable section

open MeasureTheory ProbabilityTheory Set Filter Topology
open scoped ENNReal NNReal unitInterval

namespace TauCetiRoadmap.StochasticOrders

attribute [local instance] Classical.propDecidable

/-! ## Definitions owned by MeansMajorizationAndDiscreteInequalities

Verbatim local copies; the owner is the roadmap MeansMajorizationAndDiscreteInequalities. -/

section Copies

variable {ι : Type*} [Fintype ι]

/-- Local copy of MeansMajorizationAndDiscreteInequalities §6.1 (owner): the convex order
`μ ≤cx ν` between laws on `ℝ` with finite first moment: every convex `φ` integrable under both has
`∫ φ dμ ≤ ∫ φ dν`. -/
def ConvexOrderLE (μ ν : Measure ℝ) : Prop :=
  Integrable id μ ∧ Integrable id ν ∧
    ∀ φ : ℝ → ℝ, ConvexOn ℝ Set.univ φ → Integrable φ μ → Integrable φ ν →
      ∫ x, φ x ∂μ ≤ ∫ x, φ x ∂ν

variable {M : Type*} [AddCommMonoid M] [LinearOrder M]

/-- Local copy of MeansMajorizationAndDiscreteInequalities §4.1 (owner), in the shape of Mathlib
PR #41898: the largest sum of `i` coordinates of `a`. -/
def maxSubsetSum (i : Fin (Fintype.card ι)) (a : ι → M) : M :=
  (Finset.univ.powersetCard i).sup'
    (Finset.powersetCard_nonempty.mpr (by rw [Finset.card_univ]; exact i.isLt.le))
    (fun s ↦ ∑ j ∈ s, a j)

/-- Local copy of MeansMajorizationAndDiscreteInequalities §4.1 (owner): majorization `a ≺ b`,
"`a` is majorized by `b`", in the shape of Mathlib PR #41898: equal total sums, and every largest
`i`-coordinate sum of `a` is at most that of `b`. -/
structure Majorizes (a b : ι → M) : Prop where
  sum : ∑ j, a j = ∑ j, b j
  sums : ∀ i : Fin (Fintype.card ι), maxSubsetSum i a ≤ maxSubsetSum i b

end Copies

/-! ## Layer 1: the usual stochastic order on the line -/

section UsualOrder

variable {μ ν : Measure ℝ}

/-- 1.1: the usual order is the order of expectations of monotone functions. -/
theorem cdf_le_iff_integral_le_of_monotone (μ ν : Measure ℝ) [IsProbabilityMeasure μ]
    [IsProbabilityMeasure ν] :
    (∀ x, cdf ν x ≤ cdf μ x) ↔
      ∀ φ : ℝ → ℝ, Monotone φ → Integrable φ μ → Integrable φ ν →
        ∫ x, φ x ∂μ ≤ ∫ x, φ x ∂ν := by
  sorry

/-- 1.1: two laws in the usual order with equal expectations of one strictly increasing function
are equal. -/
theorem eq_of_cdf_le_of_integral_eq [IsProbabilityMeasure μ] [IsProbabilityMeasure ν]
    (h : ∀ x, cdf ν x ≤ cdf μ x) {g : ℝ → ℝ} (hg : StrictMono g) (hgμ : Integrable g μ)
    (hgν : Integrable g ν) (heq : ∫ x, g x ∂μ = ∫ x, g x ∂ν) : μ = ν := by
  sorry

/-- 1.2: the usual order is closed under mixtures. -/
theorem cdf_bind_le_of_ae {α : Type*} [MeasurableSpace α] (ρ : Measure α)
    [IsProbabilityMeasure ρ] (κ η : Kernel α ℝ) [IsMarkovKernel κ] [IsMarkovKernel η]
    (h : ∀ᵐ a ∂ρ, ∀ x, cdf (η a) x ≤ cdf (κ a) x) (x : ℝ) :
    cdf (η ∘ₘ ρ) x ≤ cdf (κ ∘ₘ ρ) x := by
  sorry

/-- 1.2: mixing a stochastically increasing family against ordered mixing laws. -/
theorem cdf_bind_le_of_monotone_kernel (κ : Kernel ℝ ℝ) [IsMarkovKernel κ]
    (hκ : ∀ θ θ' : ℝ, θ ≤ θ' → ∀ x, cdf (κ θ') x ≤ cdf (κ θ) x) {ρ₁ ρ₂ : Measure ℝ}
    [IsProbabilityMeasure ρ₁] [IsProbabilityMeasure ρ₂] (hρ : ∀ x, cdf ρ₂ x ≤ cdf ρ₁ x)
    (x : ℝ) : cdf (κ ∘ₘ ρ₂) x ≤ cdf (κ ∘ₘ ρ₁) x := by
  sorry

/-- 1.3: the usual order is closed under weak limits. -/
theorem cdf_le_of_tendsto {μs νs : ℕ → ProbabilityMeasure ℝ} {μ' ν' : ProbabilityMeasure ℝ}
    (hμ : Tendsto μs atTop (𝓝 μ')) (hν : Tendsto νs atTop (𝓝 ν'))
    (h : ∀ n x, cdf (νs n : Measure ℝ) x ≤ cdf (μs n : Measure ℝ) x) (x : ℝ) :
    cdf (ν' : Measure ℝ) x ≤ cdf (μ' : Measure ℝ) x := by
  sorry

end UsualOrder

/-! ## Layer 2: the usual order on partially ordered spaces -/

section OrderedSpaces

/-- The usual stochastic order on a preordered measurable space: every measurable upper set has
at most the mass under `μ` that it has under `ν`. -/
def StochasticLE {α : Type*} [MeasurableSpace α] [Preorder α] (μ ν : Measure α) : Prop :=
  ∀ s : Set α, MeasurableSet s → IsUpperSet s → μ s ≤ ν s

/-- 2.1: on the line, the order of upper sets is the order of distribution functions. -/
theorem stochasticLE_iff_cdf_le (μ ν : Measure ℝ) [IsProbabilityMeasure μ]
    [IsProbabilityMeasure ν] : StochasticLE μ ν ↔ ∀ x, cdf ν x ≤ cdf μ x := by
  sorry

/-- 2.1: the order of upper sets is the order of expectations of bounded monotone measurable
functions. -/
theorem stochasticLE_iff_integral_le {α : Type*} [MeasurableSpace α] [Preorder α]
    (μ ν : Measure α) [IsProbabilityMeasure μ] [IsProbabilityMeasure ν] :
    StochasticLE μ ν ↔
      ∀ f : α → ℝ, Monotone f → Measurable f → (∃ C, ∀ x, |f x| ≤ C) →
        ∫ x, f x ∂μ ≤ ∫ x, f x ∂ν := by
  sorry

/-- 2.2: Strassen's ordered coupling theorem (Kamae–Krengel–O'Brien): on a Polish space with a
closed partial order, `μ` is below `ν` exactly when some coupling is carried by ordered pairs. -/
theorem stochasticLE_iff_exists_isCoupling {α : Type*} [TopologicalSpace α] [PolishSpace α]
    [MeasurableSpace α] [BorelSpace α] [PartialOrder α] [OrderClosedTopology α]
    (μ ν : Measure α) [IsProbabilityMeasure μ] [IsProbabilityMeasure ν] :
    StochasticLE μ ν ↔ ∃ π : Measure (α × α), TauCeti.IsCoupling π μ ν ∧ ∀ᵐ z ∂π, z.1 ≤ z.2 := by
  sorry

/-- 2.3: the sequential criterion: ordered first marginals and conditional laws of the next
coordinate that increase along ordered conditions give ordered joint laws. -/
theorem StochasticLE.compProd {α : Type*} [TopologicalSpace α] [PolishSpace α]
    [MeasurableSpace α] [BorelSpace α] [PartialOrder α] [OrderClosedTopology α]
    {μ₁ ν₁ : Measure α} [IsProbabilityMeasure μ₁] [IsProbabilityMeasure ν₁]
    (κ η : Kernel α ℝ) [IsMarkovKernel κ] [IsMarkovKernel η] (h₁ : StochasticLE μ₁ ν₁)
    (h : ∀ x y : α, x ≤ y → ∀ t, cdf (η y) t ≤ cdf (κ x) t) :
    StochasticLE (μ₁ ⊗ₘ κ) (ν₁ ⊗ₘ η) := by
  sorry

/-- 2.3: products of ordered laws are ordered. -/
theorem StochasticLE.pi {n : ℕ} {μ ν : Fin n → Measure ℝ} [∀ i, IsProbabilityMeasure (μ i)]
    [∀ i, IsProbabilityMeasure (ν i)] (h : ∀ i x, cdf (ν i) x ≤ cdf (μ i) x) :
    StochasticLE (Measure.pi μ) (Measure.pi ν) := by
  sorry

end OrderedSpaces

/-! ## Layer 3: hazard rate, reversed hazard rate, likelihood ratio and mean residual life -/

section RatioOrders

/-- The hazard rate order `μ ≤hr ν`: `S_μ(y) S_ν(x) ≤ S_μ(x) S_ν(y)` for `x ≤ y`, where `S` is
the survival function. -/
def HazardRateLE (μ ν : Measure ℝ) : Prop :=
  ∀ x y : ℝ, x ≤ y → μ.real (Ioi y) * ν.real (Ioi x) ≤ μ.real (Ioi x) * ν.real (Ioi y)

/-- The reversed hazard rate order `μ ≤rh ν`: `F_μ(y) F_ν(x) ≤ F_μ(x) F_ν(y)` for `x ≤ y`. -/
def ReversedHazardRateLE (μ ν : Measure ℝ) : Prop :=
  ∀ x y : ℝ, x ≤ y → μ.real (Iic y) * ν.real (Iic x) ≤ μ.real (Iic x) * ν.real (Iic y)

/-- The likelihood ratio order `μ ≤lr ν`: for measurable `s` lying below `t`,
`μ(t) ν(s) ≤ μ(s) ν(t)`. -/
def LikelihoodRatioLE (μ ν : Measure ℝ) : Prop :=
  ∀ s t : Set ℝ, MeasurableSet s → MeasurableSet t → (∀ x ∈ s, ∀ y ∈ t, x ≤ y) →
    μ.real t * ν.real s ≤ μ.real s * ν.real t

/-- The mean residual life order `μ ≤mrl ν` between laws with finite first moment:
`S_ν(t) ∫ (x - t)⁺ dμ ≤ S_μ(t) ∫ (x - t)⁺ dν` for every `t`. -/
def MeanResidualLifeLE (μ ν : Measure ℝ) : Prop :=
  Integrable id μ ∧ Integrable id ν ∧
    ∀ t : ℝ, ν.real (Ioi t) * ∫ x, max (x - t) 0 ∂μ ≤ μ.real (Ioi t) * ∫ x, max (x - t) 0 ∂ν

variable {μ ν : Measure ℝ} [IsProbabilityMeasure μ] [IsProbabilityMeasure ν]

/-- 3.2: the likelihood ratio order implies the hazard rate order. -/
theorem LikelihoodRatioLE.hazardRateLE (h : LikelihoodRatioLE μ ν) : HazardRateLE μ ν := by
  sorry

/-- 3.2: the likelihood ratio order implies the reversed hazard rate order. -/
theorem LikelihoodRatioLE.reversedHazardRateLE (h : LikelihoodRatioLE μ ν) :
    ReversedHazardRateLE μ ν := by
  sorry

/-- 3.2: the hazard rate order implies the usual order. -/
theorem HazardRateLE.cdf_le (h : HazardRateLE μ ν) (x : ℝ) : cdf ν x ≤ cdf μ x := by
  sorry

/-- 3.2: the reversed hazard rate order implies the usual order. -/
theorem ReversedHazardRateLE.cdf_le (h : ReversedHazardRateLE μ ν) (x : ℝ) :
    cdf ν x ≤ cdf μ x := by
  sorry

/-- 3.2: the hazard rate order implies the mean residual life order. -/
theorem HazardRateLE.meanResidualLifeLE (h : HazardRateLE μ ν) (hμ : Integrable id μ)
    (hν : Integrable id ν) : MeanResidualLifeLE μ ν := by
  sorry

/-- 3.3: the likelihood ratio order for laws with densities with respect to a common reference
measure is the almost-everywhere monotonicity of the density ratio. -/
theorem likelihoodRatioLE_withDensity_iff {ρ : Measure ℝ} [SigmaFinite ρ] {f g : ℝ → ℝ≥0∞}
    (hf : Measurable f) (hg : Measurable g) (hμ : μ = ρ.withDensity f)
    (hν : ν = ρ.withDensity g) :
    LikelihoodRatioLE μ ν ↔ ∀ᵐ z ∂(ρ.prod ρ), z.1 ≤ z.2 → f z.2 * g z.1 ≤ f z.1 * g z.2 := by
  sorry

/-- 3.3: the likelihood ratio order is the usual order of all conditional laws. -/
theorem likelihoodRatioLE_iff_cond :
    LikelihoodRatioLE μ ν ↔
      ∀ s : Set ℝ, MeasurableSet s → μ s ≠ 0 → ν s ≠ 0 → ∀ x, cdf (ν[|s]) x ≤ cdf (μ[|s]) x := by
  sorry

/-- 3.3: the hazard rate order is the usual order of the residual lives. -/
theorem hazardRateLE_iff_cond_Ioi :
    HazardRateLE μ ν ↔
      ∀ t : ℝ, μ (Ioi t) ≠ 0 → ν (Ioi t) ≠ 0 →
        ∀ x, cdf (ν[|Ioi t]) x ≤ cdf (μ[|Ioi t]) x := by
  sorry

/-- 3.3: a pointwise comparison of hazard rates of laws with densities gives the hazard rate
order. -/
theorem hazardRateLE_of_hazard_le {f g : ℝ → ℝ}
    (hμ : μ = volume.withDensity fun t ↦ ENNReal.ofReal (f t))
    (hν : ν = volume.withDensity fun t ↦ ENNReal.ofReal (g t)) (hfm : AEMeasurable f)
    (hgm : AEMeasurable g) (hf : 0 ≤ᵐ[volume] f) (hg : 0 ≤ᵐ[volume] g)
    (hsupp : ∀ t, cdf μ t < 1 → cdf ν t < 1)
    (hhaz : ∀ᵐ t, cdf μ t < 1 → g t / (1 - cdf ν t) ≤ f t / (1 - cdf μ t)) :
    HazardRateLE μ ν := by
  sorry

/-- 3.4: nondecreasing maps preserve the likelihood ratio order. -/
theorem LikelihoodRatioLE.map (h : LikelihoodRatioLE μ ν) {φ : ℝ → ℝ} (hφ : Monotone φ) :
    LikelihoodRatioLE (μ.map φ) (ν.map φ) := by
  sorry

/-- 3.4: nondecreasing maps preserve the hazard rate order. -/
theorem HazardRateLE.map (h : HazardRateLE μ ν) {φ : ℝ → ℝ} (hφ : Monotone φ) :
    HazardRateLE (μ.map φ) (ν.map φ) := by
  sorry

/-- 3.4: convolution with a log-concave density preserves the likelihood ratio order. -/
theorem LikelihoodRatioLE.conv_withDensity (h : LikelihoodRatioLE μ ν) {ρ : Measure ℝ}
    [IsProbabilityMeasure ρ] {k : ℝ → ℝ≥0∞} (hk : Measurable k) (hlc : TauCeti.LogConcave k)
    (hρ : ρ = volume.withDensity k) : LikelihoodRatioLE (μ ∗ ρ) (ν ∗ ρ) := by
  sorry

/-- 3.4: convolution with a law of log-concave survival function preserves the hazard rate
order. -/
theorem HazardRateLE.conv (h : HazardRateLE μ ν) {ρ : Measure ℝ} [IsProbabilityMeasure ρ]
    (hlc : TauCeti.LogConcave fun x : ℝ ↦ ρ (Ioi x)) : HazardRateLE (μ ∗ ρ) (ν ∗ ρ) := by
  sorry

/-- 3.5: Poisson laws increase in the likelihood ratio order with the rate. -/
theorem likelihoodRatioLE_map_cast_poissonMeasure {r s : ℝ≥0} (hrs : r ≤ s) :
    LikelihoodRatioLE ((poissonMeasure r).map (Nat.cast : ℕ → ℝ))
      ((poissonMeasure s).map (Nat.cast : ℕ → ℝ)) := by
  sorry

/-- 3.5: binomial laws increase in the likelihood ratio order with the number of trials and the
success probability. -/
theorem likelihoodRatioLE_map_cast_binomial {n m : ℕ} {p q : I} (hnm : n ≤ m) (hpq : p ≤ q) :
    LikelihoodRatioLE ((binomial n p).map (Nat.cast : ℕ → ℝ))
      ((binomial m q).map (Nat.cast : ℕ → ℝ)) := by
  sorry

/-- 3.5: Gamma laws increase in the likelihood ratio order with the shape and decrease with the
rate. -/
theorem likelihoodRatioLE_gammaMeasure {a b r s : ℝ} (ha : 0 < a) (hab : a ≤ b) (hs : 0 < s)
    (hsr : s ≤ r) : LikelihoodRatioLE (gammaMeasure a r) (gammaMeasure b s) := by
  sorry

/-- 3.5: Gaussian laws of a common variance increase in the likelihood ratio order with the
mean. -/
theorem likelihoodRatioLE_gaussianReal {m₁ m₂ : ℝ} (hm : m₁ ≤ m₂) (v : ℝ≥0) :
    LikelihoodRatioLE (gaussianReal m₁ v) (gaussianReal m₂ v) := by
  sorry

end RatioOrders

/-! ## Layer 4: convex-type orders and martingale couplings -/

section ConvexTypeOrders

/-- The increasing convex order `μ ≤icx ν` between laws with finite first moment: every
nondecreasing convex `φ` integrable under both has `∫ φ dμ ≤ ∫ φ dν`. -/
def IncreasingConvexOrderLE (μ ν : Measure ℝ) : Prop :=
  Integrable id μ ∧ Integrable id ν ∧
    ∀ φ : ℝ → ℝ, Monotone φ → ConvexOn ℝ Set.univ φ → Integrable φ μ → Integrable φ ν →
      ∫ x, φ x ∂μ ≤ ∫ x, φ x ∂ν

variable {μ ν : Measure ℝ} [IsProbabilityMeasure μ] [IsProbabilityMeasure ν]

/-- 4.1: the stop-loss characterization of the increasing convex order. -/
theorem increasingConvexOrderLE_iff_stopLoss :
    IncreasingConvexOrderLE μ ν ↔ Integrable id μ ∧ Integrable id ν ∧
      ∀ t : ℝ, ∫ x, max (x - t) 0 ∂μ ≤ ∫ x, max (x - t) 0 ∂ν := by
  sorry

/-- 4.1: the upper quantile-integral characterization of the increasing convex order. -/
theorem increasingConvexOrderLE_iff_quantile :
    IncreasingConvexOrderLE μ ν ↔ Integrable id μ ∧ Integrable id ν ∧
      ∀ p ∈ Icc (0 : ℝ) 1, ∫ u in Ioo p 1, μ.quantile u ≤ ∫ u in Ioo p 1, ν.quantile u := by
  sorry

/-- 4.1: the lower quantile-integral characterization of the convex order. -/
theorem convexOrderLE_iff_quantile :
    ConvexOrderLE μ ν ↔ Integrable id μ ∧ Integrable id ν ∧ ∫ x, x ∂μ = ∫ x, x ∂ν ∧
      ∀ p ∈ Icc (0 : ℝ) 1, ∫ u in Ioo 0 p, ν.quantile u ≤ ∫ u in Ioo 0 p, μ.quantile u := by
  sorry

/-- 4.2: Strassen's theorem on the line: the convex order between laws with finite first moment is
the existence of a martingale kernel. -/
theorem convexOrderLE_iff_exists_martingale_kernel (hμ : Integrable id μ)
    (hν : Integrable id ν) :
    ConvexOrderLE μ ν ↔ ∃ κ : Kernel ℝ ℝ, IsMarkovKernel κ ∧ ν = κ ∘ₘ μ ∧
      ∀ᵐ x ∂μ, Integrable id (κ x) ∧ ∫ y, y ∂(κ x) = x := by
  sorry

/-- 4.2: the increasing convex order is the existence of a submartingale kernel. -/
theorem increasingConvexOrderLE_iff_exists_submartingale_kernel (hμ : Integrable id μ)
    (hν : Integrable id ν) :
    IncreasingConvexOrderLE μ ν ↔ ∃ κ : Kernel ℝ ℝ, IsMarkovKernel κ ∧ ν = κ ∘ₘ μ ∧
      ∀ᵐ x ∂μ, Integrable id (κ x) ∧ x ≤ ∫ y, y ∂(κ x) := by
  sorry

/-- 4.2: the increasing convex order is a usual-order step followed by a convex-order step. -/
theorem increasingConvexOrderLE_iff_exists_cdf_le_convexOrderLE (hμ : Integrable id μ)
    (hν : Integrable id ν) :
    IncreasingConvexOrderLE μ ν ↔
      ∃ ρ : Measure ℝ, IsProbabilityMeasure ρ ∧ (∀ x, cdf ρ x ≤ cdf μ x) ∧ ConvexOrderLE ρ ν := by
  sorry

/-- 4.3: the Karlin–Novikoff cut criterion: a single crossing of the distribution functions, from
`F_μ ≤ F_ν` to `F_ν ≤ F_μ`, and ordered means give the increasing convex order. -/
theorem increasingConvexOrderLE_of_cdf_crossing (hμ : Integrable id μ) (hν : Integrable id ν)
    (hmean : ∫ x, x ∂μ ≤ ∫ x, x ∂ν) (c : ℝ) (hleft : ∀ x < c, cdf μ x ≤ cdf ν x)
    (hright : ∀ x, c ≤ x → cdf ν x ≤ cdf μ x) : IncreasingConvexOrderLE μ ν := by
  sorry

/-- 4.4: the convex order is closed under convolution. -/
theorem ConvexOrderLE.conv {μ₂ ν₂ : Measure ℝ} [IsProbabilityMeasure μ₂]
    [IsProbabilityMeasure ν₂] (h₁ : ConvexOrderLE μ ν) (h₂ : ConvexOrderLE μ₂ ν₂) :
    ConvexOrderLE (μ ∗ μ₂) (ν ∗ ν₂) := by
  sorry

/-- 4.4: the convex order is closed under mixtures with integrable mixtures. -/
theorem ConvexOrderLE.bind {α : Type*} [MeasurableSpace α] (ρ : Measure α)
    [IsProbabilityMeasure ρ] (κ η : Kernel α ℝ) [IsMarkovKernel κ] [IsMarkovKernel η]
    (h : ∀ᵐ a ∂ρ, ConvexOrderLE (κ a) (η a)) (hκ : Integrable id (κ ∘ₘ ρ))
    (hη : Integrable id (η ∘ₘ ρ)) : ConvexOrderLE (κ ∘ₘ ρ) (η ∘ₘ ρ) := by
  sorry

/-- 4.4: laws in the convex order with equal expectations of one strictly convex function are
equal. -/
theorem eq_of_convexOrderLE_of_integral_eq (h : ConvexOrderLE μ ν) {φ : ℝ → ℝ}
    (hφ : StrictConvexOn ℝ Set.univ φ) (hφμ : Integrable φ μ) (hφν : Integrable φ ν)
    (heq : ∫ x, φ x ∂μ = ∫ x, φ x ∂ν) : μ = ν := by
  sorry

/-- 4.5: the mean residual life order implies the increasing convex order. -/
theorem MeanResidualLifeLE.increasingConvexOrderLE (h : MeanResidualLifeLE μ ν) :
    IncreasingConvexOrderLE μ ν := by
  sorry

/-- 4.5: the mean residual life order is the increasing convex order of the residual lives. -/
theorem meanResidualLifeLE_iff_cond_Ioi (hμ : Integrable id μ) (hν : Integrable id ν) :
    MeanResidualLifeLE μ ν ↔
      ∀ t : ℝ, μ (Ioi t) ≠ 0 → ν (Ioi t) ≠ 0 → IncreasingConvexOrderLE (μ[|Ioi t]) (ν[|Ioi t]) := by
  sorry

end ConvexTypeOrders

/-! ## Layer 5: dispersion, star and Lorenz orders -/

section QuantileOrders

/-- The dispersive order `μ ≤disp ν`: every spread between two interior quantiles of `μ` is at
most the corresponding spread of `ν`. -/
def DispersiveLE (μ ν : Measure ℝ) : Prop :=
  ∀ u v : ℝ, 0 < u → u ≤ v → v < 1 →
    μ.quantile v - μ.quantile u ≤ ν.quantile v - ν.quantile u

/-- The star order `μ ≤* ν` for laws carried by `(0, ∞)`: the ratio of the quantile functions
`ν.quantile / μ.quantile` is nondecreasing on `(0, 1)`, written without division. -/
def StarOrderLE (μ ν : Measure ℝ) : Prop :=
  ∀ u v : ℝ, 0 < u → u ≤ v → v < 1 →
    ν.quantile u * μ.quantile v ≤ ν.quantile v * μ.quantile u

/-- The Lorenz curve `L_μ(u) = (∫_0^u Q_μ) / E μ`. It is used for integrable laws with positive
mean and `u ∈ [0, 1]`. -/
def lorenzCurve (μ : Measure ℝ) (u : ℝ) : ℝ :=
  (∫ x, x ∂μ)⁻¹ * ∫ v in Ioc 0 u, μ.quantile v

/-- The Lorenz order `μ ≤L ν` between integrable laws with positive means: the Lorenz curve of `ν`
lies below that of `μ`. -/
def LorenzOrderLE (μ ν : Measure ℝ) : Prop :=
  Integrable id μ ∧ Integrable id ν ∧ 0 < ∫ x, x ∂μ ∧ 0 < ∫ x, x ∂ν ∧
    ∀ u ∈ Icc (0 : ℝ) 1, lorenzCurve ν u ≤ lorenzCurve μ u

/-- The Gini index `1 - 2 ∫_0^1 L_μ`. -/
def giniIndex (μ : Measure ℝ) : ℝ :=
  1 - 2 * ∫ u in (0 : ℝ)..1, lorenzCurve μ u

variable {μ ν : Measure ℝ} [IsProbabilityMeasure μ] [IsProbabilityMeasure ν]

/-- 5.1: laws in the dispersive order with a common finite left endpoint are in the usual
order. -/
theorem DispersiveLE.cdf_le_of_tendsto_quantile (h : DispersiveLE μ ν) {a : ℝ}
    (hμ : Tendsto μ.quantile (𝓝[>] 0) (𝓝 a)) (hν : Tendsto ν.quantile (𝓝[>] 0) (𝓝 a))
    (x : ℝ) : cdf ν x ≤ cdf μ x := by
  sorry

/-- 5.1: the dispersive order implies the convex order of the centred laws. -/
theorem DispersiveLE.convexOrderLE_map_sub (h : DispersiveLE μ ν) (hμ : Integrable id μ)
    (hν : Integrable id ν) :
    ConvexOrderLE (μ.map fun x ↦ x - ∫ y, y ∂μ) (ν.map fun x ↦ x - ∫ y, y ∂ν) := by
  sorry

/-- 5.2: for laws on `(0, ∞)`, the star order is the dispersive order of the logarithms. -/
theorem starOrderLE_iff_dispersiveLE_map_log (hμ : μ (Iic 0) = 0) (hν : ν (Iic 0) = 0) :
    StarOrderLE μ ν ↔ DispersiveLE (μ.map Real.log) (ν.map Real.log) := by
  sorry

/-- 5.3: the Lorenz curve is convex on `[0, 1]`. -/
theorem convexOn_lorenzCurve (hμ : Integrable id μ) (hpos : 0 < ∫ x, x ∂μ) :
    ConvexOn ℝ (Icc 0 1) (lorenzCurve μ) := by
  sorry

/-- 5.3: the Lorenz order is the convex order of the laws scaled to mean one. -/
theorem lorenzOrderLE_iff_convexOrderLE (hμ : Integrable id μ) (hν : Integrable id ν)
    (hμpos : 0 < ∫ x, x ∂μ) (hνpos : 0 < ∫ x, x ∂ν) :
    LorenzOrderLE μ ν ↔
      ConvexOrderLE (μ.map fun x ↦ x / ∫ y, y ∂μ) (ν.map fun x ↦ x / ∫ y, y ∂ν) := by
  sorry

/-- 5.3: for laws on `(0, ∞)` with finite means, the star order implies the Lorenz order. -/
theorem StarOrderLE.lorenzOrderLE (h : StarOrderLE μ ν) (hμ0 : μ (Iic 0) = 0)
    (hν0 : ν (Iic 0) = 0) (hμ : Integrable id μ) (hν : Integrable id ν) : LorenzOrderLE μ ν := by
  sorry

/-- 5.3: the Gini index is monotone along the Lorenz order. -/
theorem LorenzOrderLE.giniIndex_le (h : LorenzOrderLE μ ν) : giniIndex μ ≤ giniIndex ν := by
  sorry

/-- 5.3: the Gini index is the mean absolute difference of two independent draws divided by twice
the mean. -/
theorem giniIndex_eq_integral_abs_sub (hμ : Integrable id μ) (hpos : 0 < ∫ x, x ∂μ) :
    giniIndex μ = (∫ z, |z.1 - z.2| ∂(μ.prod μ)) / (2 * ∫ x, x ∂μ) := by
  sorry

/-- 5.4: for vectors with equal positive totals, majorization is the Lorenz order of the
empirical laws. -/
theorem majorizes_iff_lorenzOrderLE {ι : Type*} [Fintype ι] [Nonempty ι] (x y : ι → ℝ)
    (hsum : ∑ i, x i = ∑ i, y i) (hpos : 0 < ∑ i, y i) :
    Majorizes x y ↔
      LorenzOrderLE (TauCeti.Probability.empiricalFiniteMeasure x : Measure ℝ)
        (TauCeti.Probability.empiricalFiniteMeasure y : Measure ℝ) := by
  sorry

end QuantileOrders

/-! ## Sanity checks of the definitions -/

section SanityChecks

/-- Sanity check of the definition: the likelihood ratio order is not implied by the hazard rate
and reversed hazard rate orders together (Shaked–Shanthikumar, Remark 1.C.2): the uniform law on
`{1, 2, 3, 4}` is below the law with masses `0.1, 0.3, 0.2, 0.4` in both, and not in the
likelihood ratio order, since the pair `{2} ≤ {3}` gives `0.25 · 0.3 > 0.25 · 0.2`. -/
theorem not_likelihoodRatioLE_example :
    let μ : Measure ℝ := (4 : ℝ≥0∞)⁻¹ • (Measure.dirac 1 + Measure.dirac 2 + Measure.dirac 3 +
      Measure.dirac 4)
    let ν : Measure ℝ := (1 / 10 : ℝ≥0∞) • Measure.dirac 1 + (3 / 10 : ℝ≥0∞) • Measure.dirac 2 +
      (2 / 10 : ℝ≥0∞) • Measure.dirac 3 + (4 / 10 : ℝ≥0∞) • Measure.dirac 4
    HazardRateLE μ ν ∧ ReversedHazardRateLE μ ν ∧ ¬ LikelihoodRatioLE μ ν := by
  sorry

/-- Sanity check of the definition: the mean residual life order needs first moments, so the
Cauchy law is not below itself, while the survival clause alone would hold reflexively. -/
theorem not_meanResidualLifeLE_cauchy :
    ¬ MeanResidualLifeLE (volume.withDensity fun x : ℝ ↦ ENNReal.ofReal (π⁻¹ * (1 + x ^ 2)⁻¹))
      (volume.withDensity fun x : ℝ ↦ ENNReal.ofReal (π⁻¹ * (1 + x ^ 2)⁻¹)) := by
  sorry

end SanityChecks

/-! ## Library declarations consumed

Every Mathlib or Tau Ceti name that the README writes in code font is pinned here. -/

#check @ProbabilityTheory.cdf
#check @MeasureTheory.Measure.real
#check @MeasureTheory.Measure.quantile
#check @MeasureTheory.Measure.cdf_le_iff_quantile_le
#check @MeasureTheory.Measure.monotoneOn_quantile
#check @MeasureTheory.Measure.quantile_le_iff
#check @MeasureTheory.Measure.measurePreserving_quantile
#check @MeasureTheory.Measure.integrableOn_quantile_iff
#check @MeasureTheory.Measure.setIntegral_quantile_eq_integral
#check @MeasureTheory.Measure.quantile_map_of_monotoneOn
#check @MeasureTheory.Measure.quantile_map_of_monotone
#check @MeasureTheory.Measure.measurable_quantile_cdf_family
#check @MeasureTheory.Measure.quantileCoupling
#check @MeasureTheory.Measure.isCoupling_quantileCoupling
#check @MeasureTheory.Measure.ae_fst_le_snd_quantileCoupling
#check @MeasureTheory.Measure.exists_isCoupling_ae_fst_le_snd_iff_cdf_le
#check @MeasureTheory.Measure.cdf_le_trans
#check @MeasureTheory.Measure.eq_of_cdf_le_cdf_le
#check @MeasureTheory.Measure.cdf_map_le_cdf_map_of_monotone
#check @MeasureTheory.Measure.cdf_conv_le_cdf_conv
#check @ProbabilityTheory.HasLaw.cdf_le_of_ae_le
#check @TauCeti.IsCoupling
#check @TauCeti.IsCoupling.cdf_le_of_ae_fst_le_snd
#check @TauCeti.exists_isCoupling_tendsto_of_isTightMeasureSet
#check @TauCeti.Probability.one_sub_cdf_eq_mul_exp_neg_integral
#check @TauCeti.Probability.absolutelyContinuousOnInterval_cdf_of_eq_withDensity
#check @TauCeti.Probability.ae_hasDerivAt_cdf_of_eq_withDensity
#check @TauCeti.LogConcave
#check @TauCeti.Probability.empiricalFiniteMeasure
#check @TauCeti.Probability.integral_empiricalFiniteMeasure
#check @ProbabilityTheory.cond
#check @MeasureTheory.Measure.conv
#check @MeasureTheory.Measure.bind
#check @MeasureTheory.Measure.compProd
#check @MeasureTheory.Measure.pi
#check @MeasureTheory.Measure.disintegrate
#check @MeasureTheory.Measure.condKernel
#check @MeasureTheory.ProbabilityMeasure
#check @isCompact_closure_of_isTightMeasureSet
#check @MeasureTheory.ProbabilityMeasure.tendsto_iff_forall_integral_tendsto
#check @ProbabilityTheory.IsMarkovKernel
#check @ProbabilityTheory.poissonMeasure
#check @ProbabilityTheory.binomial
#check @ProbabilityTheory.gammaMeasure
#check @ProbabilityTheory.gaussianReal
#check @ConvexOn.map_integral_le
#check @StrictConvexOn
#check @IsUpperSet
#check @OrderClosedTopology
#check @holley
#check @MeasureTheory.lintegral_eq_lintegral_meas_lt
#check @MeasureTheory.Measure.cdf_le_refl
#check @StrictConvexOn.ae_eq_const_or_map_average_lt
#check @TauCeti.Probability.intervalIntegrable_div_one_sub_cdf_of_eq_withDensity
#check @TauCeti.Probability.one_sub_cdf_eq_exp_neg_integral_of_eq_withDensity
#check @VitaliFamily

end TauCetiRoadmap.StochasticOrders
