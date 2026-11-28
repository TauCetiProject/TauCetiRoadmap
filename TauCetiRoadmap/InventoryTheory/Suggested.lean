import Mathlib

/-!
# Inventory theory: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib, each with `sorry`, together with the
few definitions they need; every definition has a real body. Every headline theorem of the README
is statable at the pins and is stated here. The README's remaining targets, API lists and Checks
are not restated.

Demand laws are probability measures `μ` on `ℝ` with an integrable identity; expected costs are
Bochner integrals against `μ`, whose junk value `0` on non-integrable functions is excluded by
that hypothesis. The newsvendor rule of README 1.2 is not a target (it follows from
RiskMeasures 4.1) and is not stated here. The value of the periodic-review problem with `n`
periods to go is a real function defined by backward recursion, with the minimization over
order-up-to levels written as an `sInf` over the image of a closed ray; the theorems show that
the infimum is attained. The cost of an ordering rule is defined by the same recursion in `ℝ≥0∞`,
with lower Lebesgue integrals, so that it needs no integrability or measurability of the rule.
-/

noncomputable section

open MeasureTheory Filter Set
open scoped ENNReal

namespace TauCetiRoadmap.InventoryTheory

/-! ## Layer 1: the economic order quantity and the newsvendor -/

/-- 1.1 The average setup and holding cost per unit time of producing in cycles of length `T`,
with setup cost `K`, holding cost `h` per unit and unit time, demand rate `rate` and utilization
`ρ` (the ratio of the demand rate to the production rate; `ρ = 0` is instantaneous delivery). -/
def eoqCost (K h rate ρ T : ℝ) : ℝ :=
  h * rate * (1 - ρ) * T / 2 + K / T

/-- 1.1 The economic order quantity: for `K > 0`, `h > 0`, `rate > 0` and `ρ < 1`, the unique
minimizer of `eoqCost` over `T > 0` is `√(2K / (h · rate · (1 − ρ)))`, and the least average cost
is `√(2 K h · rate · (1 − ρ))`. -/
theorem isMinOn_eoqCost_iff {K h rate ρ : ℝ} (hK : 0 < K) (hh : 0 < h) (hrate : 0 < rate)
    (hρ : ρ < 1) :
    (∀ T, 0 < T →
      (IsMinOn (eoqCost K h rate ρ) (Ioi 0) T ↔ T = √(2 * K / (h * rate * (1 - ρ))))) ∧
    eoqCost K h rate ρ (√(2 * K / (h * rate * (1 - ρ)))) = √(2 * K * h * rate * (1 - ρ)) := by
  sorry

/-! ## Layer 2: the periodic-review recursion and base-stock levels -/

/-- 2.1 The one-period shortage and holding cost of the end-of-period stock `z`: `p` per unit
backlogged and `h` per unit held. -/
def shortageHoldingCost (p h z : ℝ) : ℝ :=
  p * max (-z) 0 + h * max z 0

/-- 2.1 The value of the periodic-review problem with `n` periods to go from stock `x`, with setup
cost `K`, unit ordering cost `c`, shortage cost `p`, holding cost `h` and demand law `μ`:
`V 0 = 0` and `V (n + 1) x = inf_{y ≥ x} ([x < y] K + c y + E[r (y − w) + V n (y − w)]) − c x`. -/
def inventoryValue (μ : Measure ℝ) (K c p h : ℝ) : ℕ → ℝ → ℝ
  | 0 => fun _ ↦ 0
  | n + 1 => fun x ↦
      sInf ((fun y ↦ (if x < y then K else 0) +
        (c * y + ∫ w, (shortageHoldingCost p h (y - w) + inventoryValue μ K c p h n (y - w)) ∂μ))
          '' Ici x) - c * x

/-- 2.1 The expected cost of raising the stock to `y` with `n + 1` periods to go, before the fixed
cost: `G n y = c y + E[r (y − w) + V n (y − w)]`, so that
`V (n + 1) x = inf_{y ≥ x} ([x < y] K + G n y) − c x`. -/
def orderUpToCost (μ : Measure ℝ) (K c p h : ℝ) (n : ℕ) (y : ℝ) : ℝ :=
  c * y + ∫ w, (shortageHoldingCost p h (y - w) + inventoryValue μ K c p h n (y - w)) ∂μ

/-- 2.2 Base-stock levels: without setup cost, for an integrable demand law, `0 ≤ c < p` and
`h > 0`, every value function and every order-up-to cost is convex, the order-up-to cost is
coercive and has a global minimizer, and for every global minimizer `S` of `G n` the value with
`n + 1` periods to go is attained by raising the stock to `max S x`. -/
theorem baseStock_inventoryValue (μ : Measure ℝ) [IsProbabilityMeasure μ]
    (hμ : Integrable (fun w ↦ w) μ) {c p h : ℝ} (hc : 0 ≤ c) (hcp : c < p) (hh : 0 < h)
    (n : ℕ) :
    ConvexOn ℝ univ (inventoryValue μ 0 c p h n) ∧
    ConvexOn ℝ univ (orderUpToCost μ 0 c p h n) ∧
    Tendsto (orderUpToCost μ 0 c p h n) atBot atTop ∧
    Tendsto (orderUpToCost μ 0 c p h n) atTop atTop ∧
    (∃ S, IsMinOn (orderUpToCost μ 0 c p h n) univ S) ∧
    ∀ S, IsMinOn (orderUpToCost μ 0 c p h n) univ S → ∀ x,
      inventoryValue μ 0 c p h (n + 1) x = orderUpToCost μ 0 c p h n (max S x) - c * x := by
  sorry

/-! ## Layer 3: K-convexity and (s, S) levels -/

/-- 3.1 Scarf's `K`-convexity: on every interval `[x, y]` the function lies below the chord from
`(x, g x)` to `(y, g y + K)`. For `K = 0` this is convexity. -/
def KConvex (K : ℝ) (g : ℝ → ℝ) : Prop :=
  ∀ ⦃x y : ℝ⦄, x ≤ y → ∀ ⦃a b : ℝ⦄, 0 ≤ a → 0 ≤ b → a + b = 1 →
    g (a * x + b * y) ≤ a * g x + b * (g y + K)

/-- 3.2 The reorder point attached to a level `S`: the infimum of the points `x ≤ S` with
`g x ≤ K + g S`. -/
def reorderPoint (K : ℝ) (g : ℝ → ℝ) (S : ℝ) : ℝ :=
  sInf {x | x ≤ S ∧ g x ≤ K + g S}

/-- 3.2 Scarf's structural lemma: a lower semicontinuous `K`-convex function tending to `+∞` at
both ends has a global minimizer, and for every global minimizer `S`, with `s` its reorder point,
`s ≤ S`, `g s ≤ K + g S`, `g x > K + g S` for `x < s`, `g` is strictly decreasing on `(−∞, s]`,
and `g x ≤ K + g z` whenever `s ≤ x ≤ z`. -/
theorem kConvex_reorderPoint {K : ℝ} {g : ℝ → ℝ} (hg : KConvex K g)
    (hlsc : LowerSemicontinuous g) (hbot : Tendsto g atBot atTop)
    (htop : Tendsto g atTop atTop) :
    (∃ S, IsMinOn g univ S) ∧
    ∀ S, IsMinOn g univ S →
      reorderPoint K g S ≤ S ∧ g (reorderPoint K g S) ≤ K + g S ∧
      (∀ x < reorderPoint K g S, K + g S < g x) ∧
      StrictAntiOn g (Iic (reorderPoint K g S)) ∧
      ∀ x z, reorderPoint K g S ≤ x → x ≤ z → g x ≤ K + g z := by
  sorry

/-- 3.3 Scarf's theorem: for an integrable demand law, `K ≥ 0`, `0 ≤ c < p` and `h > 0`, every
order-up-to cost is `K`-convex, continuous and coercive and has a global minimizer, and for every
global minimizer `S` of `G n`, with `s` its reorder point, the value with `n + 1` periods to go is
`K + G n S − c x` below `s` and `G n x − c x` from `s` on. -/
theorem scarf_inventoryValue (μ : Measure ℝ) [IsProbabilityMeasure μ]
    (hμ : Integrable (fun w ↦ w) μ) {K c p h : ℝ} (hK : 0 ≤ K) (hc : 0 ≤ c) (hcp : c < p)
    (hh : 0 < h) (n : ℕ) :
    KConvex K (orderUpToCost μ K c p h n) ∧
    Continuous (orderUpToCost μ K c p h n) ∧
    Tendsto (orderUpToCost μ K c p h n) atBot atTop ∧
    Tendsto (orderUpToCost μ K c p h n) atTop atTop ∧
    (∃ S, IsMinOn (orderUpToCost μ K c p h n) univ S) ∧
    ∀ S, IsMinOn (orderUpToCost μ K c p h n) univ S → ∀ x,
      inventoryValue μ K c p h (n + 1) x =
        (if x < reorderPoint K (orderUpToCost μ K c p h n) S
          then K + orderUpToCost μ K c p h n S
          else orderUpToCost μ K c p h n x) - c * x := by
  sorry

/-! ## Layer 4: optimality of ordering rules -/

/-- 4.1 The expected cost, with `n` periods to go from stock `x`, of the ordering rule that with
`m + 1` periods to go raises the stock `x` to `π m x`, defined by the backward recursion of the
value with lower Lebesgue integrals in `ℝ≥0∞`. -/
def orderingRuleCost (μ : Measure ℝ) (K c p h : ℝ) (π : ℕ → ℝ → ℝ) : ℕ → ℝ → ℝ≥0∞
  | 0 => fun _ ↦ 0
  | n + 1 => fun x ↦
      ENNReal.ofReal ((if x < π n x then K else 0) + c * (π n x - x)) +
        ∫⁻ w, (ENNReal.ofReal (shortageHoldingCost p h (π n x - w)) +
          orderingRuleCost μ K c p h π n (π n x - w)) ∂μ

/-- 4.1 Verification theorem: under the hypotheses of 3.3, no ordering rule that never lowers the
stock costs less than the value, and a rule that at every stage and stock chooses a minimizer of
`y ↦ [x < y] K + G n y` over `y ≥ x` costs exactly the value. -/
theorem inventoryValue_le_orderingRuleCost (μ : Measure ℝ) [IsProbabilityMeasure μ]
    (hμ : Integrable (fun w ↦ w) μ) {K c p h : ℝ} (hK : 0 ≤ K) (hc : 0 ≤ c) (hcp : c < p)
    (hh : 0 < h) (π : ℕ → ℝ → ℝ) (hπ : ∀ n x, x ≤ π n x) :
    (∀ n x, ENNReal.ofReal (inventoryValue μ K c p h n x) ≤ orderingRuleCost μ K c p h π n x) ∧
    ((∀ n x, IsMinOn (fun y ↦ (if x < y then K else 0) + orderUpToCost μ K c p h n y)
        (Ici x) (π n x)) →
      ∀ n x, orderingRuleCost μ K c p h π n x = ENNReal.ofReal (inventoryValue μ K c p h n x)) := by
  sorry

/-! ## Layer 5: zero-inventory ordering under concave costs -/

section Deterministic

variable {n : ℕ}

/-- 5.1 The stock at the end of period `t` of the production plan `x` against the demands `d`,
starting from zero stock. -/
def inventoryLevel (d x : Fin n → ℝ) (t : Fin n) : ℝ :=
  ∑ j ∈ Finset.Iic t, (x j - d j)

/-- 5.1 The stock at the start of period `t` (zero for the first period). -/
def openingInventory (d x : Fin n → ℝ) (t : Fin n) : ℝ :=
  ∑ j ∈ Finset.Iio t, (x j - d j)

/-- 5.1 A production plan: nonnegative production, no shortage at the end of any period, and zero
stock at the end of the horizon. -/
def IsProductionPlan (d x : Fin n → ℝ) : Prop :=
  (∀ t, 0 ≤ x t ∧ 0 ≤ inventoryLevel d x t) ∧ ∑ j, (x j - d j) = 0

/-- 5.1 The cost of a plan: production cost `g t (x t)` and holding cost `h t` of the end stock in
each period. -/
def planCost (g h : Fin n → ℝ → ℝ) (d x : Fin n → ℝ) : ℝ :=
  ∑ t, (g t (x t) + h t (inventoryLevel d x t))

/-- 5.1 Zero-inventory ordering: for nonnegative demands and production and holding costs concave
on `[0, ∞)`, some optimal production plan produces only in periods that it enters with zero
stock. -/
theorem exists_isProductionPlan_zeroInventoryOrdering (d : Fin n → ℝ) (hd : ∀ t, 0 ≤ d t)
    (g h : Fin n → ℝ → ℝ) (hg : ∀ t, ConcaveOn ℝ (Ici 0) (g t))
    (hh : ∀ t, ConcaveOn ℝ (Ici 0) (h t)) :
    ∃ x, IsProductionPlan d x ∧ (∀ t, openingInventory d x t * x t = 0) ∧
      ∀ y, IsProductionPlan d y → planCost g h d x ≤ planCost g h d y := by
  sorry

end Deterministic

end TauCetiRoadmap.InventoryTheory
