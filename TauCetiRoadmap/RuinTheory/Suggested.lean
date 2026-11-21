import Mathlib
import TauCeti.Probability.Renewal.Basic

/-!
# Ruin theory: target signatures

The roadmap is `README.md` in this folder; this file is not the roadmap. It states the roadmap's
headline theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the two
definitions they need, both with real bodies.

The increments `Y 0, Y 1, …` of the embedded random walk are real random variables on a measurable
space `Ω` with a measure `P`; in the insurance reading `Y i` is the `i`-th claim minus the
premium earned since the previous claim. The walk at time `n` is the partial sum
`∑ i ∈ Finset.range n, Y i`, so it is `0` at time `0`. Ruin from initial capital `u` is the event
that some partial sum is strictly larger than `u`, that is, that the reserve `u − Sₙ` is strictly
negative at some time `n ≥ 0`.

Every headline theorem of the README is statable at the pins and is stated here: the reduction of
continuous-time ruin to the embedded walk (1.2), the net-profit dichotomy (1.3), uniqueness,
existence and the sign of the drift for the adjustment coefficient (2.1), the exponential
martingale (2.2), Lundberg's inequality (3.1), the overshoot identity (3.2) and the exact ruin
probabilities for exponential claims (4.1, 4.2).
-/

namespace TauCetiRoadmap.RuinTheory

open MeasureTheory ProbabilityTheory Filter Topology Finset
open scoped ENNReal NNReal

variable {Ω : Type*} [MeasurableSpace Ω] {P : Measure Ω}

/-! ## Layer 1: the embedded random walk and its ruin probability -/

/-- 1.1. The ruin probability from initial capital `u` of the walk with increments `Y`: the
probability that some partial sum `∑ i ∈ Finset.range n, Y i`, `n ≥ 0`, is strictly larger than
`u`. For `u < 0` the time `n = 0` already gives ruin. -/
noncomputable def ruinProb (P : Measure Ω) (Y : ℕ → Ω → ℝ) (u : ℝ) : ℝ≥0∞ :=
  P {ω | ∃ n, u < ∑ i ∈ range n, Y i ω}

/-- 1.1. The time of ruin from initial capital `u`: the first `n ≥ 0` at which the partial sum
`∑ i ∈ Finset.range n, Y i` is strictly larger than `u`, and `⊤` if there is none. -/
noncomputable def ruinTime (Y : ℕ → Ω → ℝ) (u : ℝ) : Ω → WithTop ℕ :=
  hittingAfter (fun n ω ↦ ∑ i ∈ range n, Y i ω) (Set.Ioi u) 0

/-- 1.2. **Ruin happens at claim instants.** Let the waiting times `T 0, T 1, …` between claims be
measurable, independent, identically distributed and not almost surely zero, let the claims
`Z 0, Z 1, …` be almost surely nonnegative, and let `c` be the premium rate. The probability that
the reserve `u + c t − (Z 0 + ⋯ + Z (n − 1))`, where `n` is the number of claims in `[0, t]`, is
strictly negative at some time `t ≥ 0` equals the ruin probability of the embedded walk with
increments `Z i − c T i`. -/
theorem measure_exists_reserve_neg_eq_ruinProb (T : ℕ → Ω → ℝ≥0) (Z : ℕ → Ω → ℝ) (c u : ℝ)
    (hT : ∀ n, Measurable (T n)) (hindep : iIndepFun T P)
    (hid : ∀ n, IdentDistrib (T n) (T 0) P P) (hzero : P {ω | T 0 ω = 0} < 1)
    (hZ : ∀ n, 0 ≤ᵐ[P] Z n) :
    P {ω | ∃ t : ℝ≥0, ∃ n : ℕ, TauCeti.Probability.renewalCount T t ω = n ∧
        u + c * t < ∑ i ∈ range n, Z i ω} =
      ruinProb P (fun i ω ↦ Z i ω - c * T i ω) u := by
  sorry

/-- 1.3. **The net-profit condition, favourable side.** For measurable, independent, identically
distributed increments with strictly negative mean, ruin from any capital `u ≥ 0` has probability
strictly less than one, and the ruin probability tends to `0` as the capital tends to infinity. -/
theorem ruinProb_lt_one_and_tendsto_zero (Y : ℕ → Ω → ℝ) (hY : ∀ i, Measurable (Y i))
    (hindep : iIndepFun Y P) (hid : ∀ i, IdentDistrib (Y i) (Y 0) P P)
    (hneg : ∫ ω, Y 0 ω ∂P < 0) :
    (∀ u, 0 ≤ u → ruinProb P Y u < 1) ∧ Tendsto (ruinProb P Y) atTop (𝓝 0) := by
  sorry

/-- 1.3. **The net-profit condition, unfavourable side.** For measurable, independent, identically
distributed increments with strictly positive mean, ruin is certain from every initial capital. -/
theorem ruinProb_eq_one (Y : ℕ → Ω → ℝ) (hY : ∀ i, Measurable (Y i))
    (hindep : iIndepFun Y P) (hid : ∀ i, IdentDistrib (Y i) (Y 0) P P)
    (hpos : 0 < ∫ ω, Y 0 ω ∂P) (u : ℝ) :
    ruinProb P Y u = 1 := by
  sorry

/-! ## Layer 2: the adjustment coefficient and the exponential martingale -/

/-- 2.1. **Uniqueness of the adjustment coefficient.** If `X` is not almost surely zero, the
equation `E[exp (R X)] = 1` has at most one strictly positive solution `R`. -/
theorem adjustmentCoefficient_unique [IsProbabilityMeasure P] {X : Ω → ℝ}
    (hX : ¬ X =ᵐ[P] 0) {R₁ R₂ : ℝ} (hR₁ : 0 < R₁) (hR₂ : 0 < R₂)
    (h₁ : mgf X P R₁ = 1) (h₂ : mgf X P R₂ = 1) :
    R₁ = R₂ := by
  sorry

/-- 2.1. **Existence of the adjustment coefficient.** If `X` has strictly negative mean and
`E[exp (r X)] ≥ 1` for some `r > 0`, then `E[exp (R X)] = 1` for some `R` with `0 < R ≤ r`. -/
theorem exists_adjustmentCoefficient [IsProbabilityMeasure P] {X : Ω → ℝ}
    (hneg : ∫ ω, X ω ∂P < 0) {r : ℝ} (hr : 0 < r) (h1 : 1 ≤ mgf X P r) :
    ∃ R ∈ Set.Ioc 0 r, mgf X P R = 1 := by
  sorry

/-- 2.1. **An adjustment coefficient forces negative drift.** If `X` is integrable and not almost
surely zero, and `E[exp (R X)] = 1` for some `R > 0`, then `E[X] < 0`. -/
theorem integral_neg_of_mgf_eq_one [IsProbabilityMeasure P] {X : Ω → ℝ}
    (hint : Integrable X P) (hX : ¬ X =ᵐ[P] 0) {R : ℝ} (hR : 0 < R) (h : mgf X P R = 1) :
    ∫ ω, X ω ∂P < 0 := by
  sorry

/-- 2.2. **The exponential martingale.** Let `ℱ` be a filtration such that each increment `Y i`
is `ℱ (i + 1)`-measurable and independent of `ℱ i`, and let `exp (r Y i)` be integrable for every
`i`. Then `exp (r Sₙ) / ∏ i < n, E[exp (r Y i)]` is a martingale for `ℱ`. -/
theorem martingale_exp_mul_sum_div_prod_mgf [IsProbabilityMeasure P] (Y : ℕ → Ω → ℝ)
    (ℱ : Filtration ℕ ‹MeasurableSpace Ω›) (hadapt : ∀ i, StronglyMeasurable[ℱ (i + 1)] (Y i))
    (hind : ∀ i, Indep (MeasurableSpace.comap (Y i) inferInstance) (ℱ i) P) {r : ℝ}
    (hint : ∀ i, Integrable (fun ω ↦ Real.exp (r * Y i ω)) P) :
    Martingale (fun n ω ↦ Real.exp (r * ∑ i ∈ range n, Y i ω) / ∏ i ∈ range n, mgf (Y i) P r)
      ℱ P := by
  sorry

/-! ## Layer 3: Lundberg's inequality and the overshoot identity -/

/-- 3.1. **Lundberg's inequality.** For measurable, independent, identically distributed
increments and `R ≥ 0` with `exp (R Y 0)` integrable and `E[exp (R Y 0)] ≤ 1` (in particular for
the adjustment coefficient), the probability that the walk ever reaches `u` or more is at most
`exp (−R u)`, for every real `u`. In particular the ruin probability is at most `exp (−R u)`. -/
theorem measure_exists_le_sum_le_exp (Y : ℕ → Ω → ℝ) (hY : ∀ i, Measurable (Y i))
    (hindep : iIndepFun Y P) (hid : ∀ i, IdentDistrib (Y i) (Y 0) P P) {R : ℝ} (hR : 0 ≤ R)
    (hint : Integrable (fun ω ↦ Real.exp (R * Y 0 ω)) P) (h : mgf (Y 0) P R ≤ 1) (u : ℝ) :
    P {ω | ∃ n, u ≤ ∑ i ∈ range n, Y i ω} ≤ ENNReal.ofReal (Real.exp (-(R * u))) := by
  sorry

/-- 3.2. **The overshoot identity.** For measurable, independent, identically distributed increments
that are not almost surely zero and `R > 0` with `E[exp (R Y 0)] = 1`, the expectation of
`exp (R ξ)` on the event of ruin, where `ξ = S_τ − u` is the overshoot of the level `u` at the
time of ruin `τ`, equals `exp (−R u)`, for every real `u`. -/
theorem setIntegral_exp_overshoot (Y : ℕ → Ω → ℝ) (hY : ∀ i, Measurable (Y i))
    (hindep : iIndepFun Y P) (hid : ∀ i, IdentDistrib (Y i) (Y 0) P P)
    (hnd : ¬ Y 0 =ᵐ[P] 0) {R : ℝ} (hR : 0 < R) (h : mgf (Y 0) P R = 1) (u : ℝ) :
    ∫ ω in {ω | ruinTime Y u ω ≠ ⊤},
        Real.exp (R * (stoppedValue (fun n ω ↦ ∑ i ∈ range n, Y i ω) (ruinTime Y u) ω - u)) ∂P =
      Real.exp (-(R * u)) := by
  sorry

/-! ## Layer 4: exponential claims -/

/-- 4.1. **Exponential claims.** Let the pairs `(Z i, W i)` be measurable, independent and
identically distributed, with `Z 0` and `W 0` independent, `Z 0` exponential of rate `δ` and
`W 0 ≥ 0` almost surely, and let `R > 0` satisfy `E[exp (R (Z 0 − W 0))] = 1`. Then the ruin
probability of the walk with increments `Z i − W i` is `(1 − R/δ) exp (−R u)` for every `u ≥ 0`. -/
theorem ruinProb_eq_of_hasLaw_expMeasure (Z W : ℕ → Ω → ℝ) (hZ : ∀ i, Measurable (Z i))
    (hW : ∀ i, Measurable (W i)) (hindep : iIndepFun (fun i ω ↦ (Z i ω, W i ω)) P)
    (hid : ∀ i, IdentDistrib (fun ω ↦ (Z i ω, W i ω)) (fun ω ↦ (Z 0 ω, W 0 ω)) P P)
    (hZW : IndepFun (Z 0) (W 0) P) {δ : ℝ} (hlaw : HasLaw (Z 0) (expMeasure δ) P)
    (hW0 : 0 ≤ᵐ[P] W 0) {R : ℝ} (hR : 0 < R) (h : mgf (fun ω ↦ Z 0 ω - W 0 ω) P R = 1)
    {u : ℝ} (hu : 0 ≤ u) :
    ruinProb P (fun i ω ↦ Z i ω - W i ω) u =
      ENNReal.ofReal ((1 - R / δ) * Real.exp (-(R * u))) := by
  sorry

/-- 4.2. **Exponential claims and exponential waiting times.** Let the pairs `(Z i, T i)` be
measurable, independent and identically distributed, with `Z 0` and `T 0` independent, `Z 0`
exponential of rate `δ`, `T 0` exponential of rate `lam`, and let the premium rate `c` satisfy the
net-profit condition `lam < c δ`. Then the ruin probability of the walk with increments
`Z i − c T i` is `(lam / (c δ)) exp (−(δ − lam / c) u)` for every `u ≥ 0`. -/
theorem ruinProb_eq_of_exponential_claims_and_waiting_times (Z T : ℕ → Ω → ℝ)
    (hZ : ∀ i, Measurable (Z i)) (hT : ∀ i, Measurable (T i))
    (hindep : iIndepFun (fun i ω ↦ (Z i ω, T i ω)) P)
    (hid : ∀ i, IdentDistrib (fun ω ↦ (Z i ω, T i ω)) (fun ω ↦ (Z 0 ω, T 0 ω)) P P)
    (hZT : IndepFun (Z 0) (T 0) P) {δ lam c : ℝ} (hZlaw : HasLaw (Z 0) (expMeasure δ) P)
    (hTlaw : HasLaw (T 0) (expMeasure lam) P) (hnet : lam < c * δ) {u : ℝ} (hu : 0 ≤ u) :
    ruinProb P (fun i ω ↦ Z i ω - c * T i ω) u =
      ENNReal.ofReal (lam / (c * δ) * Real.exp (-((δ - lam / c) * u))) := by
  sorry

end TauCetiRoadmap.RuinTheory
