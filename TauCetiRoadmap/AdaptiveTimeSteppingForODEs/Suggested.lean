import Mathlib

/-!
# Adaptive time stepping: target signatures

This file is not the roadmap: `README.md` is definitive. The headline signatures
below include asymptotic estimator accuracy, meshwise residual bounds, finite
completion of the defined adaptive run, and the global trajectory tolerance bound.
Admitted targets use `sorry`; elaboration does not prove them. Proved elementary
lemmas are sanity checks or steps of the proof route, not outstanding targets.

The embedded-pair instantiations and tableau bridge of 1.1 are not stated here:
the supplier's `ButcherTableau` implementation is absent from pinned Tau Ceti.
The abstract headline results need only Mathlib. The run is a noncomputable
mathematical sequence, not an executable solver.
-/

noncomputable section
open Set Filter Topology
open scoped NNReal

namespace TauCetiRoadmap.AdaptiveTimeSteppingForODEs

/-! ## Layer 1: embedded errors -/

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

/-! ## Layer 2: residual reconstruction -/

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
    (hh : 0 ≤ h) (hf : LipschitzWith L (f (t + h)))
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

/-- Sanity check: the endpoint identity also holds at zero; derivative bounds require h>0. -/
theorem heunReconstruction_endpoint (u k1 k2 : E) (h : ℝ) :
    heunReconstruction u k1 k2 h h = u + (h / 2) • (k1 + k2) := by
  by_cases hh : h = 0
  · simp [heunReconstruction, hh]
  · unfold heunReconstruction
    have hc : h ^ 2 / (2 * h) = h / 2 := by field_simp
    rw [hc]
    module

/-! ## Layer 3: tolerances and proposals -/

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
    (hlu : lower ≤ upper) :
    lower ≤ proposalFactor safety lower upper r w ∧
      proposalFactor safety lower upper r w ≤ upper := by
  unfold proposalFactor
  split_ifs <;> simp [hlu]

/-- 3.2 and 4.3: small normalised indicators imply nonshrinking proposals. -/
theorem one_le_proposalFactor {safety lower upper w : ℝ} {r : ℕ}
    (hs : 0 < safety) (hu : 1 ≤ upper) (hr : 0 < r)
    (hw : 0 ≤ w) (hsmall : w ≤ safety ^ r) :
    1 ≤ proposalFactor safety lower upper r w := by
  sorry

/-! ## Layer 4: rejection and completion -/

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

/-! ## Layer 5: global tolerance -/

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

/-! ## Headline 1.2: asymptotic exactness -/

/-- The signed embedded difference is eL-eH; nonvanishing leading error is essential. -/
theorem embedded_asymptotically_exact {eL eH : ℝ → E} {p : ℕ} {v : E}
    (hv : v ≠ 0)
    (hL : Tendsto (fun h => (h ^ (p + 1))⁻¹ • eL h) (𝓝[>] 0) (𝓝 v))
    (hH : Tendsto (fun h => (h ^ (p + 1))⁻¹ • eH h) (𝓝[>] 0) (𝓝 0)) :
    Tendsto (fun h => ‖eL h - eH h‖ / ‖eL h‖) (𝓝[>] 0) (𝓝 1) := by
  sorry

/-! ## Headline 2.1: meshwise residual certificate -/

/-- Bounds on every interval of a finite mesh, including its endpoints. -/
theorem meshwise_reconstruction_error_le
    {f : ℝ → E → E} {y : ℝ → E} {U U' : ℕ → ℝ → E}
    {t ε : ℕ → ℝ} {δ : ℝ} {L : ℝ≥0} {N : ℕ}
    (hmesh : ∀ n < N, t n < t (n + 1))
    (hf : ∀ s, LipschitzWith L (f s))
    (hy : ContinuousOn y (Icc (t 0) (t N)))
    (hy' : ∀ s ∈ Ico (t 0) (t N), HasDerivWithinAt y (f s (y s)) (Ici s) s)
    (hU : ∀ n < N, ContinuousOn (U n) (Icc (t n) (t (n + 1))))
    (hU' : ∀ n < N, ∀ s ∈ Ico (t n) (t (n + 1)),
      HasDerivWithinAt (U n) (U' n s) (Ici s) s)
    (hjoin : ∀ n, n + 1 < N → U n (t (n + 1)) = U (n + 1) (t (n + 1)))
    (hε : ∀ n < N, 0 ≤ ε n)
    (hres : ∀ n < N, ∀ s ∈ Ico (t n) (t (n + 1)),
      ‖U' n s - f s (U n s)‖ ≤ ε n)
    (hinit : ‖y (t 0) - U 0 (t 0)‖ ≤ δ) :
    ∀ n < N, ∀ s ∈ Icc (t n) (t (n + 1)),
      ‖y s - U n s‖ ≤ gronwallBound
        (residualBudget δ L (fun j => t (j + 1) - t j) ε n) L (ε n) (s - t n) := by
  sorry

/-! ## Headlines 4.2–4.3: the actual adaptive run -/

/-- Accepted state and next proposed step; no opaque propositions encode behaviour. -/
structure AdaptiveState (E : Type*) where
  time : ℝ
  value : E
  proposal : ℝ

/-- First successful geometric trial. Zero denotes absence of an accepted trial;
termination hypotheses prove that this fallback is never used before the endpoint. -/
def acceptedStep (w : ℝ → E → ℝ → ℝ) (θ T : ℝ) (s : AdaptiveState E) : ℝ := by
  classical
  let H := min s.proposal (T - s.time)
  exact if hk : ∃ k : ℕ, w s.time s.value (θ ^ k * H) ≤ 1
    then θ ^ (Nat.find hk) * H else 0

/-- Compress the finite rejection sequence into one accepted transition. At or beyond
T the state is stationary. P uses the accepted trial's old time, state and step. -/
def adaptiveTransition (Ψ : ℝ → E → ℝ → E) (w P : ℝ → E → ℝ → ℝ)
    (θ T Hmax : ℝ) (s : AdaptiveState E) : AdaptiveState E := by
  classical
  let h := acceptedStep w θ T s
  exact if s.time < T then
    ⟨s.time + h, Ψ s.time s.value h, min Hmax (P s.time s.value h)⟩ else s

/-- Mathematical sequence of accepted transitions, constant after completion. -/
def adaptiveRun (Ψ : ℝ → E → ℝ → E) (w P : ℝ → E → ℝ → ℝ)
    (θ T Hmax : ℝ) (s0 : AdaptiveState E) : ℕ → AdaptiveState E
  | 0 => s0
  | n + 1 => adaptiveTransition Ψ w P θ T Hmax
      (adaptiveRun Ψ w P θ T Hmax s0 n)

/-- The selected index really is the first accepted trial under the small-step hypothesis. -/
theorem acceptedStep_spec {w : ℝ → E → ℝ → ℝ} {θ T δ : ℝ}
    (s : AdaptiveState E) (hθ : 0 < θ) (hθ1 : θ < 1)
    (ht : s.time < T) (hp : 0 < s.proposal) (hδ : 0 < δ)
    (ha : ∀ h, 0 < h → h ≤ min s.proposal (T - s.time) → h ≤ δ →
      w s.time s.value h ≤ 1) :
    ∃ k, FirstAccepted (w s.time s.value) 1 θ (min s.proposal (T - s.time)) k ∧
      acceptedStep w θ T s = θ ^ k * min s.proposal (T - s.time) := by
  sorry

/-- 4.2: proposal-policy completion, nonfinal-step lower bound and accepted-step count.
The hypotheses are imposed only at states reached by this run. -/
theorem adaptiveRun_completion
    (Ψ : ℝ → E → ℝ → E) (w P : ℝ → E → ℝ → ℝ)
    (θ T Hmax κ δa δg : ℝ) (s0 : AdaptiveState E)
    (hθ : 0 < θ ∧ θ < 1) (hκ : 0 < κ ∧ κ ≤ 1)
    (hδa : 0 < δa) (hδg : 0 < δg)
    (ht0 : s0.time ≤ T) (hH0 : 0 < s0.proposal ∧ s0.proposal ≤ Hmax)
    (ha : ∀ n h, let s := adaptiveRun Ψ w P θ T Hmax s0 n
      s.time < T → 0 < h → h ≤ Hmax → h ≤ T - s.time → h ≤ δa →
        w s.time s.value h ≤ 1)
    (hp : ∀ n h, let s := adaptiveRun Ψ w P θ T Hmax s0 n
      s.time < T → 0 < h → h ≤ Hmax → h ≤ T - s.time →
        w s.time s.value h ≤ 1 →
        κ * h ≤ P s.time s.value h ∧ (h ≤ δg → h ≤ P s.time s.value h)) :
    let run := adaptiveRun Ψ w P θ T Hmax s0
    let m := min s0.proposal (min (θ * δa) (κ * δg))
    (∀ n, (run n).time < T →
      0 < acceptedStep w θ T (run n) ∧
      w (run n).time (run n).value (acceptedStep w θ T (run n)) ≤ 1) ∧
    (∀ n, (run n).time < T → (run (n + 1)).time < T →
      m ≤ (run (n + 1)).time - (run n).time) ∧
    ∃ N, (run N).time = T ∧ (N : ℝ) ≤ ⌈(T - s0.time) / m⌉ + 1 := by
  sorry

/-- The concrete clipped I-controller proposal, evaluated at the accepted trial. -/
def indicatorProposal (w : ℝ → E → ℝ → ℝ) (σ lower upper : ℝ) (r : ℕ)
    (t : ℝ) (u : E) (h : ℝ) : ℝ :=
  h * proposalFactor σ lower upper r (w t u h)

/-- 4.3: completion of the clipped I-controller, including the Cw=0 case. -/
theorem indicatorRun_completion
    (Ψ : ℝ → E → ℝ → E) (w : ℝ → E → ℝ → ℝ)
    (θ T Hmax σ lower upper Cw : ℝ) (r : ℕ) (s0 : AdaptiveState E)
    (hθ : 0 < θ ∧ θ < 1) (hσ : 0 < σ ∧ σ < 1)
    (hl : 0 < lower ∧ lower < 1) (hu : 1 < upper) (hr : 0 < r)
    (hC : 0 ≤ Cw) (ht0 : s0.time ≤ T)
    (hH0 : 0 < s0.proposal ∧ s0.proposal ≤ Hmax)
    (hw : ∀ n h,
      let s := adaptiveRun Ψ w (indicatorProposal w σ lower upper r) θ T Hmax s0 n
      s.time < T → 0 < h → h ≤ Hmax → h ≤ T - s.time →
        0 ≤ w s.time s.value h ∧ w s.time s.value h ≤ Cw * h ^ r) :
    let run := adaptiveRun Ψ w (indicatorProposal w σ lower upper r) θ T Hmax s0
    let δa := if Cw = 0 then Hmax else Real.rpow (1 / Cw) (1 / (r : ℝ))
    let δg := if Cw = 0 then Hmax else Real.rpow (σ ^ r / Cw) (1 / (r : ℝ))
    let m := min s0.proposal (min (θ * δa) (lower * δg))
    (∀ n, (run n).time < T →
      0 < acceptedStep w θ T (run n) ∧
      w (run n).time (run n).value (acceptedStep w θ T (run n)) ≤ 1) ∧
    (∀ n, (run n).time < T → (run (n + 1)).time < T →
      m ≤ (run (n + 1)).time - (run n).time) ∧
    ∃ N, (run N).time = T ∧ (N : ℝ) ≤ ⌈(T - s0.time) / m⌉ + 1 := by
  sorry

/-! ## Headline 5.1: global trajectory tolerance -/

/-- A completed mesh with certified residuals satisfies the requested global tolerance. -/
theorem global_reconstruction_tolerance
    {f : ℝ → E → E} {y : ℝ → E} {U U' : ℕ → ℝ → E}
    {t : ℕ → ℝ} {a T Tol : ℝ} {L : ℝ≥0} {N : ℕ}
    (hT : a < T) (hTol : 0 < Tol) (ha : t 0 = a) (hfinal : t N = T)
    (hmesh : ∀ n < N, t n < t (n + 1))
    (hf : ∀ s, LipschitzWith L (f s))
    (hy : ContinuousOn y (Icc a T))
    (hy' : ∀ s ∈ Ico a T, HasDerivWithinAt y (f s (y s)) (Ici s) s)
    (hU : ∀ n < N, ContinuousOn (U n) (Icc (t n) (t (n + 1))))
    (hU' : ∀ n < N, ∀ s ∈ Ico (t n) (t (n + 1)),
      HasDerivWithinAt (U n) (U' n s) (Ici s) s)
    (hjoin : ∀ n, n + 1 < N → U n (t (n + 1)) = U (n + 1) (t (n + 1)))
    (hres : ∀ n < N, ∀ s ∈ Ico (t n) (t (n + 1)),
      ‖U' n s - f s (U n s)‖ ≤ residualTolerance Tol L (T - a))
    (hinit : y a = U 0 a) :
    ∀ n < N, ∀ s ∈ Icc (t n) (t (n + 1)), ‖y s - U n s‖ ≤ Tol := by
  sorry

/-! ## Headline 5.2: convergence of nodal errors as tolerance vanishes -/

/-- The supplier's error bound yields convergence uniformly over the nodes even when
both their number and their positions vary with tolerance. Initial discrepancy is retained. -/
theorem nodal_error_tendsto_zero {y : ℝ → E} {Y : ℝ → ℕ → E}
    {t : ℝ → ℕ → ℝ} {N : ℝ → ℕ} {δ H : ℝ → ℝ}
    {L : ℝ≥0} {C duration : ℝ} {p : ℕ}
    (hC : 0 ≤ C) (hT : 0 ≤ duration) (hp : 0 < p)
    (hδ : Tendsto δ (𝓝[>] 0) (𝓝 0))
    (hH : Tendsto H (𝓝[>] 0) (𝓝 0))
    (hbound : ∀ tol > 0, ∀ n ≤ N tol,
      ‖y (t tol n) - Y tol n‖ ≤ gronwallBound (δ tol) L (C * H tol ^ p) duration) :
    ∀ ε > 0, ∀ᶠ tol in 𝓝[>] (0 : ℝ),
      ∀ n ≤ N tol, ‖y (t tol n) - Y tol n‖ < ε := by
  sorry

end TauCetiRoadmap.AdaptiveTimeSteppingForODEs
