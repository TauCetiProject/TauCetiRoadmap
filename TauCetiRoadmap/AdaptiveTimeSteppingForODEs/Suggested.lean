import Mathlib

/-!
# Adaptive time stepping: selected interface prototypes

This file is not the roadmap: `README.md` is definitive. These are selected
suggested interfaces, not an exhaustive checklist. Some target theorem bodies use
`sorry`: successful elaboration does not prove those targets. Elementary
identities and direct library consequences include checked proofs.

The abstract error and controller interfaces below import only Mathlib. They
do not restate the supplier's tableaux or numerical recurrences. The embedded
pair instantiations and the bridge to OneStepMethodsForODEs remain README
targets; their supplier contracts are recorded there.
-/

noncomputable section
open Set Filter Topology
open scoped BigOperators NNReal

namespace TauCetiRoadmap.AdaptiveTimeSteppingForODEs

variable {E : Type*} [NormedAddCommGroup E]

/-- 1.2: the higher-order local error is the remainder in the embedded estimate. -/
theorem embedded_error_remainder (exactValue high low : E) :
    |‖exactValue - low‖ - ‖high - low‖| ≤ ‖exactValue - high‖ := by
  simpa only [sub_sub_sub_cancel_right] using
    (abs_norm_sub_norm_le (exactValue - low) (high - low))

/-- 1.2: a bound for the high-order error gives an additive, not relative, guarantee. -/
theorem embedded_error_bounds (exactValue high low : E) {R : ℝ}
    (hR : ‖exactValue - high‖ ≤ R) :
    ‖high - low‖ - R ≤ ‖exactValue - low‖ ∧
    ‖exactValue - low‖ ≤ ‖high - low‖ + R := by
  have hb := embedded_error_remainder exactValue high low
  have hab := abs_le.mp (hb.trans hR)
  constructor <;> linarith [hab.1, hab.2]

/-- 2.1: propagate a supplied residual envelope over successive accepted steps. -/
def residualBudget (initial L : ℝ) (h residual : ℕ → ℝ) : ℕ → ℝ
  | 0 => initial
  | n + 1 => gronwallBound (residualBudget initial L h residual n) L (residual n) (h n)

/-- 2.1: at L=0 the budget is the length-weighted residual sum. -/
theorem residualBudget_zero (initial : ℝ) (h residual : ℕ → ℝ) (n : ℕ) :
    residualBudget initial 0 h residual n =
      initial + ∑ j ∈ Finset.range n, residual j * h j := by
  induction n with
  | zero => simp [residualBudget]
  | succ n ih =>
    simp [residualBudget, gronwallBound_K0, ih, Finset.sum_range_succ, add_assoc]

variable [NormedSpace ℝ E]

/-- 1.3: a Heun–Euler indicator bound at a numerical trial state, without an exact flow. -/
theorem heunEuler_indicator_le {f : ℝ → E → E} {t h Mt : ℝ} {L : ℝ≥0} (u : E)
    (hh : 0 ≤ h) (hMt : 0 ≤ Mt) (hf : LipschitzWith L (f (t + h)))
    (ht : ‖f (t + h) u - f t u‖ ≤ Mt * h) :
    ‖(h / 2) • (f (t + h) (u + h • f t u) - f t u)‖ ≤
      (Mt + L * ‖f t u‖) * h ^ 2 / 2 := by
  sorry

/-- 2.1: one interval of the certificate. No mesh-node differentiability is required. -/
theorem reconstruction_error_le {f : ℝ → E → E} {y U U' : ℝ → E}
    {a b δ ε : ℝ} {L : ℝ≥0}
    (hf : ∀ t, LipschitzWith L (f t))
    (hy : ContinuousOn y (Icc a b))
    (hy' : ∀ t ∈ Ico a b, HasDerivWithinAt y (f t (y t)) (Ici t) t)
    (hU : ContinuousOn U (Icc a b))
    (hU' : ∀ t ∈ Ico a b, HasDerivWithinAt U (U' t) (Ici t) t)
    (hres : ∀ t ∈ Ico a b, ‖U' t - f t (U t)‖ ≤ ε)
    (hinit : ‖y a - U a‖ ≤ δ) :
    ∀ t ∈ Icc a b, ‖y t - U t‖ ≤ gronwallBound δ L ε (t - a) := by
  simpa only [dist_eq_norm, zero_add] using
    (dist_le_of_approx_trajectories_ODE (εf := 0) hf hy hy'
      (fun _ _ => by simp) hU hU'
      (fun t ht => by simpa only [dist_eq_norm] using hres t ht)
      (by simpa only [dist_eq_norm] using hinit))

/-- 2.2: the quadratic curve through the initial value and Heun output. -/
def heunReconstruction (u k1 k2 : E) (h s : ℝ) : E :=
  u + s • k1 + (s ^ 2 / (2 * h)) • (k2 - k1)

/-- 2.2: zero step is deliberately excluded from the interpolation interface. -/
theorem heunReconstruction_endpoint (u k1 k2 : E) {h : ℝ} (hh : 0 < h) :
    heunReconstruction u k1 k2 h h = u + (h / 2) • (k1 + k2) := by
  sorry

/-- 3.1: component scales have a positive absolute part. -/
def toleranceScale {ι : Type*} (atol rtol u v : ι → ℝ) (i : ι) : ℝ :=
  atol i + rtol i * max |u i| |v i|

/-- 3.1: maximum scaled component error, with zero as the empty-set default. -/
def scaledError {ι : Type*} [Fintype ι] (atol rtol u v Δ : ι → ℝ) : ℝ :=
  ‖fun i => Δ i / toleranceScale atol rtol u v i‖

/-- 3.1: the acceptance condition controls every scaled component of the indicator. -/
theorem scaledError_le_one_iff {ι : Type*} [Fintype ι] (atol rtol u v Δ : ι → ℝ)
    (ha : ∀ i, 0 < atol i) (hr : ∀ i, 0 ≤ rtol i) :
    scaledError atol rtol u v Δ ≤ 1 ↔
      ∀ i, |Δ i| ≤ toleranceScale atol rtol u v i := by
  sorry

/-- 3.1: consistent positive changes of component units preserve the indicator. -/
theorem scaledError_units {ι : Type*} [Fintype ι] (atol rtol u v Δ scale : ι → ℝ)
    (hs : ∀ i, 0 < scale i) :
    scaledError (fun i => scale i * atol i) rtol (fun i => scale i * u i)
      (fun i => scale i * v i) (fun i => scale i * Δ i) =
      scaledError atol rtol u v Δ := by
  sorry

/-- 3.2: zero estimated error requests maximal growth, without division by zero. -/
def proposalFactor (safety lower upper : ℝ) (r : ℕ) (w : ℝ) : ℝ :=
  if w = 0 then upper
  else min upper (max lower (safety * Real.rpow w (-(1 / (r : ℝ)))))

/-- 3.2: the clipped proposal stays positive and bounded. -/
theorem proposalFactor_bounds {safety lower upper w : ℝ} {r : ℕ}
    (hl : 0 < lower) (hlu : lower ≤ upper) :
    lower ≤ proposalFactor safety lower upper r w ∧
      proposalFactor safety lower upper r w ≤ upper := by
  sorry

/-- 3.2 and 4.3: small normalised indicators imply nonshrinking proposals. -/
theorem one_le_proposalFactor {safety lower upper w : ℝ} {r : ℕ}
    (hs : 0 < safety) (hu : 1 ≤ upper) (hr : 0 < r)
    (hw : 0 ≤ w) (hsmall : w ≤ safety ^ r) :
    1 ≤ proposalFactor safety lower upper r w := by
  sorry

/-- 4.1: trial k succeeds and every previous geometrically reduced trial failed. -/
def FirstAccepted (indicator : ℝ → ℝ) (threshold θ H : ℝ) (k : ℕ) : Prop :=
  indicator (θ ^ k * H) ≤ threshold ∧
    ∀ j < k, threshold < indicator (θ ^ j * H)

/-- 4.1: local termination requires only acceptance of all sufficiently small steps. -/
theorem exists_firstAccepted {indicator : ℝ → ℝ} {threshold θ H δ : ℝ}
    (hθ : 0 < θ) (hθ1 : θ < 1) (hH : 0 < H) (hδ : 0 < δ)
    (hsmall : ∀ h, 0 < h → h ≤ H → h ≤ δ → indicator h ≤ threshold) :
    ∃ k, FirstAccepted indicator threshold θ H k := by
  sorry

/-- 4.1: the first accepted trial cannot shrink arbitrarily far below δ. -/
theorem firstAccepted_step_lower_bound {indicator : ℝ → ℝ} {threshold θ H δ : ℝ}
    {k : ℕ} (hθ : 0 < θ) (hθ1 : θ < 1) (hH : 0 < H) (hδ : 0 < δ)
    (hsmall : ∀ h, 0 < h → h ≤ H → h ≤ δ → indicator h ≤ threshold)
    (hk : FirstAccepted indicator threshold θ H k) :
    min H (θ * δ) ≤ θ ^ k * H := by
  sorry

/-- 4.2: the final combinatorial step, once a uniform nonfinal-step lower bound is proved. -/
theorem reaches_endpoint {t : ℕ → ℝ} {b m : ℝ}
    (hm : 0 < m) (ht : ∀ n, t n ≤ b)
    (hprogress : ∀ n, t n < b → t (n + 1) = b ∨ t n + m ≤ t (n + 1)) :
    ∃ n, t n = b := by
  sorry

/-- 4.2: the lower-bound induction applies to any proposal policy satisfying these bounds. -/
theorem proposal_ge_lowerBound {h P m κ δg : ℝ}
    (hm : m ≤ h) (hκ : 0 ≤ κ) (hthreshold : m ≤ κ * δg)
    (hfloor : κ * h ≤ P) (hsmall : h ≤ δg → h ≤ P) : m ≤ P := by
  by_cases hh : h ≤ δg
  · exact hm.trans (hsmall hh)
  · have hprod : κ * δg ≤ κ * h := mul_le_mul_of_nonneg_left (le_of_not_ge hh) hκ
    exact hthreshold.trans (hprod.trans hfloor)

/-- 5.1: the residual threshold that consumes a prescribed global error budget. -/
def residualTolerance (Tol L duration : ℝ) : ℝ :=
  Tol / gronwallBound 0 L 1 duration

/-- 5.1: positive duration and tolerance give a positive residual threshold. -/
theorem residualTolerance_spec {Tol L duration : ℝ}
    (hTol : 0 < Tol) (hL : 0 ≤ L) (hT : 0 < duration) :
    0 < residualTolerance Tol L duration ∧
      gronwallBound 0 L (residualTolerance Tol L duration) duration = Tol := by
  sorry

omit [NormedSpace ℝ E] in
/-- Downstream consumers: transfer a state certificate to a Lipschitz observable. -/
theorem observation_error_le {F : Type*} [NormedAddCommGroup F]
    {g : E → F} {K : ℝ≥0} (hg : LipschitzWith K g) {u v : E} {B : ℝ}
    (herror : ‖u - v‖ ≤ B) : ‖g u - g v‖ ≤ (K : ℝ) * B := by
  calc
    ‖g u - g v‖ ≤ (K : ℝ) * ‖u - v‖ := by
      simpa only [dist_eq_norm] using hg.dist_le_mul u v
    _ ≤ (K : ℝ) * B := mul_le_mul_of_nonneg_left herror K.coe_nonneg

end TauCetiRoadmap.AdaptiveTimeSteppingForODEs
