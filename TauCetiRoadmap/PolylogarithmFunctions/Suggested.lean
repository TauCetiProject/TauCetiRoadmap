import Mathlib
import TauCeti.AlgebraicTopology.UniversalCover.Action
import TauCeti.Analysis.Complex.Conformal.Monodromy
import TauCeti.Analysis.Complex.Conformal.GlobalBranch
import TauCeti.Analysis.InnerProductSpace.Laplacian.WeakMaximumPrinciple
import TauCeti.Analysis.InnerProductSpace.Laplacian.StrongMaximumPrinciple

/-!
# PolylogarithmFunctions: representative target signatures

The roadmap is `README.md`; it is definitive. This file is not the roadmap and is not
exhaustive: it records the light definitions and the theorem signatures of the roadmap that can
be stated against the pinned Mathlib and Tau Ceti, fixing names and signatures. The function on the universal cover that a continuation of the tower
defines and the action of arbitrary loop words are README targets; their carrier
`TauCeti.UniversalCover` is pinned below. Continued inversion and two-variable Abel propagation
have signatures here; the full family of continued functional equations is specified in the README.

Design choices made explicit here:

* `polylog n z` is defined for every integer weight `n`: by the logarithmic radial integral for
  `n ≥ 2`, by Mathlib's principal logarithm for `n = 1`, and by iterated Euler derivatives of
  `z / (1 - z)` for `n ≤ 0`. Its names follow the complex-order `Complex.polylog` proposed for
  Mathlib, whose integer-order restriction it is away from the poles.
* At every real `x > 1`, the total principal value is the limit from the lower half-plane,
  because Mathlib's argument lies in `(-π, π]`. At `x = 1` this limit is asserted only for
  weights `n ≥ 2`; the values for `n ≤ 1` are totalised pole values.
* Bernoulli numbers are Mathlib's `bernoulli`, with `B₁ = -1/2`; `bernoulliCoeff k = 2^k B_k / k!`.
* The single-valued `singleValued n` takes real values: the real part in odd weight and the
  imaginary part in even weight, with the continuous values at `0` and `1` assigned explicitly.
* The cross-ratio is normalised by `r(∞, 0, 1, z) = z`.
-/

noncomputable section

open scoped Topology
open Set Filter MeasureTheory

namespace TauCetiRoadmap.PolylogarithmFunctions

/-! ## Layer 1: principal polylogarithms -/

/-- The principal classical polylogarithm `Liₙ` in every integer weight (§1.1). For `n ≥ 2` it is
`((n-2)!)⁻¹ ∫₀¹ (-log t)^(n-2) (-Log(1 - t z)) dt / t`; for `n = 1` it is `-Log(1 - z)`; for
`n ≤ 0` it is `(z d/dz)^(-n)` applied to `z / (1 - z)`. The values at `z = 1` for `n ≤ 1` are
totalised values and carry no analytic statement. -/
def polylog : ℤ → ℂ → ℂ
  | .ofNat 0, z => z / (1 - z)
  | .ofNat 1, z => -Complex.log (1 - z)
  | .ofNat (k + 2), z => (k.factorial : ℂ)⁻¹ *
      ∫ t : ℝ in (0 : ℝ)..1,
        ((-Real.log t : ℝ) : ℂ) ^ k * (-Complex.log (1 - (t : ℂ) * z)) / (t : ℂ)
  | .negSucc k, z => ((fun f : ℂ → ℂ => fun w => w * deriv f w)^[k + 1]) (fun w => w / (1 - w)) z

/-- The weight-zero function is `z / (1 - z)`, so `Li₀(1/2) = 1`. -/
example : polylog 0 (1 / 2) = 1 := by
  show (1 / 2 : ℂ) / (1 - 1 / 2) = 1
  norm_num

/-- Negative weights are Euler derivatives: `Li₋₁(z) = z / (1 - z)²` away from the pole. -/
example {z : ℂ} (hz : z ≠ 1) : polylog (-1) z = z / (1 - z) ^ 2 := by
  have h1 : (1 : ℂ) - z ≠ 0 := sub_ne_zero.mpr (Ne.symm hz)
  have hd : HasDerivAt (fun w : ℂ => w / (1 - w)) ((1 * (1 - z) - z * (0 - 1)) / (1 - z) ^ 2) z :=
    (hasDerivAt_id' z).div ((hasDerivAt_const z (1 : ℂ)).sub (hasDerivAt_id' z)) h1
  show z * deriv (fun w : ℂ => w / (1 - w)) z = z / (1 - z) ^ 2
  rw [hd.deriv]
  field_simp
  ring

/-- The defining integrand of weight `k + 2` is interval integrable on `[0, 1]` for every `z`,
including `z = 1` and the interior logarithmic singularity at `t = 1/z` for real `z > 1` (§1.2). -/
theorem intervalIntegrable_polylog_integrand (k : ℕ) (z : ℂ) :
    IntervalIntegrable (fun t : ℝ =>
      ((-Real.log t : ℝ) : ℂ) ^ k * (-Complex.log (1 - (t : ℂ) * z)) / (t : ℂ)) volume 0 1 := by
  sorry

/-- The disc series in every integer weight, indexed from `k + 1 = 1` (§1.3). -/
theorem hasSum_polylog_of_norm_lt (n : ℤ) {z : ℂ} (hz : ‖z‖ < 1) :
    HasSum (fun k : ℕ => z ^ (k + 1) / ((k + 1 : ℕ) : ℂ) ^ n) (polylog n z) := by
  sorry

/-- The principal weight-one value at `3` is the lower cut value (§1.1). -/
theorem polylog_one_three :
    polylog 1 3 = -(Real.log 2 : ℂ) - Real.pi * Complex.I := by
  sorry

/-- The principal weight-one function is discontinuous at `3` (§1.5). -/
theorem not_continuousAt_polylog_one_three : ¬ ContinuousAt (polylog 1) (3 : ℂ) := by
  sorry

/-- Every weight vanishes at the origin (§1.1). -/
theorem polylog_zero_right (n : ℤ) : polylog n 0 = 0 := by
  sorry

/-- Every weight, including the nonpositive ones, has derivative `1` at the origin (§1.3). -/
theorem hasDerivAt_polylog_zero (n : ℤ) : HasDerivAt (polylog n) 1 0 := by
  sorry

/-- Nonpositive weights are rational with integer numerator and a pole of exact order `r + 1`
at `1` (§1.4). -/
theorem exists_polylog_neg_eq_div (r : ℕ) :
    ∃ p : Polynomial ℤ, p.eval 1 = (r.factorial : ℤ) ∧ ∀ z : ℂ, z ≠ 1 →
      polylog (-(r : ℤ)) z = (p.map (Int.castRingHom ℂ)).eval z * z / (1 - z) ^ (r + 1) := by
  sorry

/-- The totalised value at the pole does not make a nonpositive weight continuous there (§1.4). -/
theorem not_continuousAt_one_polylog_neg (r : ℕ) : ¬ ContinuousAt (polylog (-(r : ℤ))) 1 := by
  sorry

/-- Holomorphy on the principal domain `ℂ ∖ [1, ∞)` in every integer weight (§1.5). -/
theorem analyticOnNhd_polylog (n : ℤ) :
    AnalyticOnNhd ℂ (polylog n) {z : ℂ | 1 - z ∈ Complex.slitPlane} := by
  sorry

/-- The Euler recursion `z · Li'ₙ₊₁(z) = Liₙ(z)` on the principal domain, including `z = 0`
(§1.5). -/
theorem mul_deriv_polylog_add_one (n : ℤ) {z : ℂ} (hz : 1 - z ∈ Complex.slitPlane) :
    z * deriv (polylog (n + 1)) z = polylog n z := by
  sorry

/-- The radial integral recursion on the principal domain (§1.5). -/
theorem polylog_add_one_eq_integral (n : ℕ) (hn : 1 ≤ n) {z : ℂ}
    (hz : 1 - z ∈ Complex.slitPlane) :
    polylog ((n : ℤ) + 1) z = ∫ t : ℝ in (0 : ℝ)..1, polylog n ((t : ℂ) * z) / (t : ℂ) := by
  sorry

/-- Conjugation on the principal domain; it is not asserted on the cut (§1.6). -/
theorem polylog_conj (n : ℤ) {z : ℂ} (hz : 1 - z ∈ Complex.slitPlane) :
    polylog n (starRingEnd ℂ z) = starRingEnd ℂ (polylog n z) := by
  sorry

/-- Continuity on the closed unit disc from weight two on (§1.7). -/
theorem continuousOn_polylog_closedBall (n : ℕ) (hn : 2 ≤ n) :
    ContinuousOn (polylog n) (Metric.closedBall 0 1) := by
  sorry

/-- Closed-disc conjugation follows from continuity after the principal-domain identity (§1.7). -/
theorem polylog_conj_of_norm_le_one (n : ℕ) (hn : 2 ≤ n) {z : ℂ} (hz : ‖z‖ ≤ 1) :
    polylog n (starRingEnd ℂ z) = starRingEnd ℂ (polylog n z) := by
  sorry

/-- Continuity at `1` for unrestricted complex approach, beyond closed-disc continuity (§1.7). -/
theorem continuousAt_polylog_one (n : ℕ) (hn : 2 ≤ n) : ContinuousAt (polylog n) 1 := by
  sorry

/-- The endpoint value is Mathlib's Riemann zeta value (§1.7). -/
theorem polylog_one_eq_riemannZeta (n : ℕ) (hn : 2 ≤ n) : polylog n 1 = riemannZeta n := by
  sorry

/-- On the unit circle the polylogarithm is Mathlib's exponential zeta function (§1.7). -/
theorem polylog_exp_eq_expZeta (n : ℕ) (hn : 2 ≤ n) (a : ℝ) :
    polylog n (Complex.exp (2 * Real.pi * Complex.I * a)) = HurwitzZeta.expZeta a n := by
  sorry

/-! ## Layer 2: branches and monodromy -/

/-- The classical tower as a single vector-valued germ (§2.1): entry `0` is `Log z` and entry
`i ≥ 1` is `Liᵢ z`. Continuing this one germ continues every weight along the same path, which
is what makes a branch of the tower coherent. -/
def polylogTower (N : ℕ) (z : ℂ) : Fin (N + 1) → ℂ :=
  fun i => if (i : ℕ) = 0 then Complex.log z else polylog (i : ℕ) z

/-- Entry `0` is the logarithm and entry `1` is `-Log(1 - z)`. -/
example (z : ℂ) : polylogTower 2 z 0 = Complex.log z ∧ polylogTower 2 z 1 = -Complex.log (1 - z) :=
  ⟨rfl, rfl⟩

/-- On `ℂ ∖ ((-∞, 0] ∪ [1, ∞))` the principal tower is analytic (§2.1). -/
theorem analyticOnNhd_polylogTower (N : ℕ) :
    AnalyticOnNhd ℂ (polylogTower N)
      {z : ℂ | z ∈ Complex.slitPlane ∧ 1 - z ∈ Complex.slitPlane} := by
  sorry

/-- The tower germ at `1/2` continues along every path in `ℂ ∖ {0, 1}` (§2.1). -/
theorem continuesInside_polylogTower (N : ℕ) :
    TauCeti.ContinuesInside (polylogTower N) {z : ℂ | z ≠ 0 ∧ z ≠ 1} (1 / 2) := by
  sorry

/-- Truncation of the principal tower preserves every retained entry (§2.1). -/
theorem polylogTower_trunc (N M : ℕ) (hMN : M ≤ N) (z : ℂ) (i : Fin (M + 1)) :
    polylogTower N z ⟨i, by omega⟩ = polylogTower M z i := by
  sorry

/-- Choosing the `T₁` branch only in weight one breaks the weight-two ODE (§2.1). -/
theorem polylogTower_incoherent_two :
    deriv (polylog 2) (1 / 2) ≠ (polylog 1 (1 / 2) - 2 * Real.pi * Complex.I) / (1 / 2) := by
  sorry

/-- Monodromy about `0` (§2.3): continuing along the counterclockwise circle `|z| = 1/2` from
`1/2` adds `2πi` to the logarithm and fixes every `Liₙ`. -/
theorem polylogTower_monodromy_zero (N : ℕ) {f : unitInterval → ℂ → Fin (N + 1) → ℂ}
    (hf : TauCeti.IsAnalyticContinuationAlong f
      (fun t : unitInterval => Complex.exp (2 * Real.pi * Complex.I * (t : ℝ)) / 2) univ)
    (h0 : f 0 =ᶠ[𝓝 (1 / 2 : ℂ)] polylogTower N) :
    f 1 =ᶠ[𝓝 (1 / 2 : ℂ)] fun z i =>
      polylogTower N z i + if (i : ℕ) = 0 then 2 * Real.pi * Complex.I else 0 := by
  sorry

/-- Monodromy about `1` (§2.3): continuing along the counterclockwise circle `|z - 1| = 1/2`
from `1/2` fixes the logarithm and subtracts `2πi Log(z)^(n-1)/(n-1)!` from `Liₙ`. -/
theorem polylogTower_monodromy_one (N : ℕ) {f : unitInterval → ℂ → Fin (N + 1) → ℂ}
    (hf : TauCeti.IsAnalyticContinuationAlong f
      (fun t : unitInterval => 1 - Complex.exp (2 * Real.pi * Complex.I * (t : ℝ)) / 2) univ)
    (h0 : f 0 =ᶠ[𝓝 (1 / 2 : ℂ)] polylogTower N) :
    f 1 =ᶠ[𝓝 (1 / 2 : ℂ)] fun z i =>
      polylogTower N z i - if (i : ℕ) = 0 then 0 else
        2 * Real.pi * Complex.I * Complex.log z ^ ((i : ℕ) - 1) /
          (((i : ℕ) - 1).factorial : ℂ) := by
  sorry

/- The general continuation calculus is Tau Ceti's; the universal cover carries the function the
continued tower defines, with the fundamental group acting by prepending the inverse loop class,
so prefixing a counterclockwise loop `γ` is the action of `[γ]⁻¹`. -/
#check @TauCeti.monodromy_theorem
#check @TauCeti.ContinuesInside.exists_analyticOnNhd
#check @TauCeti.UniversalCover.smul_mk

/-- Prefixing `T₁` before the upper semicircle to `-1` changes the dilogarithm to the
still real value `23π²/12`; the initial germ is the generator formula of §2.3 (§3.6). -/
theorem polylogBranch_two_T1_neg_one (N : ℕ) (hN : 2 ≤ N)
    {f : unitInterval → ℂ → Fin (N + 1) → ℂ}
    (hf : TauCeti.IsAnalyticContinuationAlong f
      (fun t : unitInterval => -(1 / 4 : ℂ) + (3 / 4 : ℂ) *
        Complex.exp (Real.pi * Complex.I * (t : ℝ))) univ)
    (h0 : f 0 =ᶠ[𝓝 (1 / 2 : ℂ)] fun z i =>
      if i = 0 then Complex.log z else
        polylog (i.val : ℤ) z - 2 * Real.pi * Complex.I *
          Complex.log z ^ (i.val - 1) / ((i.val - 1).factorial : ℂ)) :
    f 1 (-1) ⟨2, by omega⟩ = 23 * (Real.pi : ℂ) ^ 2 / 12 := by
  sorry

/-- The upper-minus-lower jump across the cut at `x > 1` (§2.4). Counterclockwise monodromy
about `1` has the opposite sign (§2.3). -/
theorem tendsto_polylog_jump (n : ℕ) (hn : 1 ≤ n) (x : ℝ) (hx : 1 < x) :
    Tendsto (fun t : ℝ => polylog n ((x : ℂ) + (t : ℂ) * Complex.I) -
      polylog n ((x : ℂ) - (t : ℂ) * Complex.I)) (𝓝[>] 0)
      (𝓝 (2 * Real.pi * Complex.I * (Real.log x : ℂ) ^ (n - 1) / ((n - 1).factorial : ℂ))) := by
  sorry

/-- The total value on the cut is the limit from the lower half-plane, in every weight (§2.4). -/
theorem tendsto_polylog_lower (n : ℤ) (x : ℝ) (hx : 1 < x) :
    Tendsto (fun t : ℝ => polylog n ((x : ℂ) - (t : ℂ) * Complex.I)) (𝓝[>] 0)
      (𝓝 (polylog n x)) := by
  sorry

/-! ## Layer 3: classical functional equations -/

/-- Distribution in every integer weight on the star domain where every `ζ z` avoids the cut;
the factor `m^(n-1)` is an integer power, so it is `1/m` in weight zero (§3.1). -/
theorem polylog_distribution (n : ℤ) (m : ℕ) (hm : 0 < m) {z : ℂ}
    (hz : ∀ j ∈ Finset.range m,
      1 - Complex.exp (2 * Real.pi * Complex.I * j / m) * z ∈ Complex.slitPlane) :
    polylog n (z ^ m) = (m : ℂ) ^ (n - 1) *
      ∑ j ∈ Finset.range m, polylog n (Complex.exp (2 * Real.pi * Complex.I * j / m) * z) := by
  sorry

/-- Nonpositive weights satisfy distribution wherever `z ^ m ≠ 1` (§3.1). -/
theorem polylog_distribution_of_nonpos (n : ℤ) (hn : n ≤ 0) (m : ℕ) (hm : 0 < m) {z : ℂ}
    (hz : z ^ m ≠ 1) :
    polylog n (z ^ m) = (m : ℂ) ^ (n - 1) *
      ∑ j ∈ Finset.range m, polylog n (Complex.exp (2 * Real.pi * Complex.I * j / m) * z) := by
  sorry

/-- Bernoulli inversion for every `z ∉ [0, 1]`, with principal `Log(-z)`; on `(1, ∞)` both sides
are lower boundary values (§3.2). -/
theorem polylog_inversion (n : ℕ) (hn : 1 ≤ n) {z : ℂ}
    (hz : ¬ (z.im = 0 ∧ 0 ≤ z.re ∧ z.re ≤ 1)) :
    polylog n z + (-1 : ℂ) ^ n * polylog n z⁻¹ =
      -(2 * Real.pi * Complex.I) ^ n / (n.factorial : ℂ) *
        (Polynomial.bernoulli n).eval₂ (algebraMap ℚ ℂ)
          ((1 / 2 : ℂ) + Complex.log (-z) / (2 * Real.pi * Complex.I)) := by
  sorry

/-- Inversion in nonpositive weight: the sum is `-1` in weight zero and `0` below (§3.2). -/
theorem polylog_inversion_of_nonpos (n : ℤ) (hn : n ≤ 0) {z : ℂ} (hz0 : z ≠ 0) (hz1 : z ≠ 1) :
    polylog n z + (-1 : ℂ) ^ n * polylog n z⁻¹ = if n = 0 then -1 else 0 := by
  sorry

/-- Euler reflection for every `z ∈ ℂ`: off `(-∞, 0] ∪ [1, ∞)` all values are principal, and on
those rays Mathlib's total values are limits from one and the same half-plane (§3.3). -/
theorem polylog_reflection (z : ℂ) :
    polylog 2 z + polylog 2 (1 - z) =
      (Real.pi : ℂ) ^ 2 / 6 - Complex.log z * Complex.log (1 - z) := by
  sorry

/-- Abel's five-term identity with principal values on `‖x‖ + ‖y‖ < 1` (§3.4). -/
theorem polylog_abel {x y : ℂ} (hxy : ‖x‖ + ‖y‖ < 1) :
    polylog 2 (x * y / ((1 - x) * (1 - y))) =
      polylog 2 (x / (1 - y)) + polylog 2 (y / (1 - x)) - polylog 2 x - polylog 2 y -
        Complex.log (1 - x) * Complex.log (1 - y) := by
  sorry

/-- Continued inversion uses principal polylogarithm germs at `-1` and a separate
logarithm germ at `1`, continued along the negated argument path (§3.5). -/
theorem polylog_inversion_continuation (n : ℕ) (hn : 1 ≤ n)
    {c : unitInterval → ℂ} (hc : ∀ t, c t ≠ 0 ∧ c t ≠ 1) (hc0 : c 0 = -1)
    {f g l : unitInterval → ℂ → ℂ}
    (hf : TauCeti.IsAnalyticContinuationAlong f c univ)
    (hg : TauCeti.IsAnalyticContinuationAlong g (fun t => (c t)⁻¹) univ)
    (hl : TauCeti.IsAnalyticContinuationAlong l (fun t => -c t) univ)
    (hf0 : f 0 =ᶠ[𝓝 (-1 : ℂ)] polylog n)
    (hg0 : g 0 =ᶠ[𝓝 (-1 : ℂ)] polylog n)
    (hl0 : l 0 =ᶠ[𝓝 (1 : ℂ)] Complex.log) :
    f 1 (c 1) + (-1 : ℂ) ^ n * g 1 ((c 1)⁻¹) =
      -(2 * Real.pi * Complex.I) ^ n / (n.factorial : ℂ) *
        (Polynomial.bernoulli n).eval₂ (algebraMap ℚ ℂ)
          ((1 / 2 : ℂ) + l 1 (-c 1) / (2 * Real.pi * Complex.I)) := by
  sorry

/-- Abel's identity propagates for seven analytic germs on the two-variable base. The initial
germ specifies all five dilogarithms and both logarithms; local agreement transports their
identity along any path in the nonsingular locus (§3.5). -/
theorem abel_functionalEquation_continuation {c : unitInterval → ℂ × ℂ}
    (hc : Continuous c)
    (hcM : ∀ t, (c t).1 * (c t).2 * (1 - (c t).1) * (1 - (c t).2) *
      (1 - (c t).1 - (c t).2) ≠ 0)
    (hc0 : c 0 = (1 / 4, 1 / 4))
    {F : unitInterval → (ℂ × ℂ) → Fin 7 → ℂ}
    (hFa : ∀ t, AnalyticAt ℂ (F t) (c t))
    (hFl : ∀ t, ∀ᶠ u in 𝓝 t, F u =ᶠ[𝓝 (c u)] F t)
    (hF0 : F 0 =ᶠ[𝓝 ((1 / 4, 1 / 4) : ℂ × ℂ)] fun z =>
      ![polylog 2 (z.1 * z.2 / ((1 - z.1) * (1 - z.2))),
        polylog 2 (z.1 / (1 - z.2)), polylog 2 (z.2 / (1 - z.1)),
        polylog 2 z.1, polylog 2 z.2, Complex.log (1 - z.1), Complex.log (1 - z.2)]) :
    F 1 (c 1) 0 = F 1 (c 1) 1 + F 1 (c 1) 2 - F 1 (c 1) 3 - F 1 (c 1) 4 -
      F 1 (c 1) 5 * F 1 (c 1) 6 := by
  sorry

/-- The negative-real value, real and finite (§3.6). -/
theorem polylog_two_neg_one : polylog 2 (-1) = -(Real.pi : ℂ) ^ 2 / 12 := by
  sorry

/-- The midpoint value, with its logarithmic correction (§3.6). -/
theorem polylog_two_half :
    polylog 2 (1 / 2) = (Real.pi : ℂ) ^ 2 / 12 - (Real.log 2 : ℂ) ^ 2 / 2 := by
  sorry

/-! ## Layer 4: single-valued polylogarithms -/

/-- The coefficients `cₖ = 2^k Bₖ / k!` of Zagier's single-valued combination (§4.1). -/
def bernoulliCoeff (k : ℕ) : ℚ := 2 ^ k * bernoulli k / k.factorial

/-- `c₁ = -1`: the convention `B₁ = -1/2` is part of the definition. -/
example : bernoulliCoeff 1 = -1 := by norm_num [bernoulliCoeff, bernoulli_one]

/-- `c₂ = 1/3`. -/
example : bernoulliCoeff 2 = 1 / 3 := by norm_num [bernoulliCoeff, bernoulli_two, Nat.factorial]

/-- The series `exp(s) · ∑ cₖ sᵏ` is even: its odd coefficients vanish (§4.1). -/
theorem sum_bernoulliCoeff_div_factorial_of_odd {k : ℕ} (hk : Odd k) :
    ∑ j ∈ Finset.range (k + 1), bernoulliCoeff j / ((k - j).factorial : ℚ) = 0 := by
  sorry

/-- Zagier's real single-valued polylogarithm `Lₙ` (§4.2): the real part (odd `n`) or imaginary
part (even `n`) of `∑_{k<n} cₖ Li_{n-k}(z) log^k|z|` off `{0, 1}`, with `Lₙ(0) = 0` and
`Lₙ(1)` equal to `ζ(n)` in odd weight and `0` in even weight. Meaningful for `n ≥ 2`. -/
def singleValued (n : ℕ) (z : ℂ) : ℝ :=
  if z = 0 then 0
  else if z = 1 then (if Odd n then (riemannZeta n).re else 0)
  else
    let w : ℂ := ∑ k ∈ Finset.range n,
      (bernoulliCoeff k : ℂ) * polylog ((n : ℤ) - k) z * (Real.log ‖z‖ : ℂ) ^ k
    if Odd n then w.re else w.im

/-- The endpoint at `1` keeps the zeta value exactly in odd weight (§4.2). -/
theorem singleValued_one (n : ℕ) :
    singleValued n 1 = if Odd n then (riemannZeta n).re else 0 := by
  simp [singleValued]

/-- Weight two includes the logarithmic argument correction (§4.2). -/
example {z : ℂ} (hz0 : z ≠ 0) (hz1 : z ≠ 1) :
    singleValued 2 z = (polylog 2 z).im + Complex.arg (1 - z) * Real.log ‖z‖ := by
  simp [singleValued, hz0, hz1, show ¬ Odd 2 by decide, Finset.sum_range_succ,
    bernoulliCoeff, bernoulli_one, polylog, Complex.log_im, Complex.mul_im]
  ring

/-- In odd weight three, the unit-circle projection is the real part (§4.2). -/
example {z : ℂ} (hz : ‖z‖ = 1) (hz1 : z ≠ 1) :
    singleValued 3 z = (polylog 3 z).re := by
  have hz0 : z ≠ 0 := by intro h; simp [h] at hz
  simp [singleValued, hz0, hz1, hz, show Odd 3 by decide, Finset.sum_range_succ,
    bernoulliCoeff]

/-- The extension of `Lₙ` to the Riemann sphere `OnePoint ℂ`, with value `0` at `∞` (§4.7). -/
def singleValuedSphere (n : ℕ) : OnePoint ℂ → ℝ := fun p => p.elim 0 (singleValued n)

/-- The value at infinity is zero (§4.2). -/
theorem singleValuedSphere_infty (n : ℕ) : singleValuedSphere n OnePoint.infty = 0 := rfl

/-- On a finite point the sphere extension is `Lₙ` itself (§4.2). -/
theorem singleValuedSphere_coe (n : ℕ) (z : ℂ) : singleValuedSphere n z = singleValued n z := rfl

/-- On the unit circle `Lₙ` is the parity projection of `Liₙ` (§4.2). -/
theorem singleValued_of_norm_eq_one (n : ℕ) (hn : 2 ≤ n) {z : ℂ} (hz : ‖z‖ = 1) :
    singleValued n z = if Odd n then (polylog n z).re else (polylog n z).im := by
  sorry

/-- Branch independence (§4.3): Zagier's combination of the values of any continuation of the
tower along any path in `ℂ ∖ {0, 1}` from `1/2` is `Lₙ` at the endpoint. -/
theorem singleValued_eq_of_isAnalyticContinuationAlong (n : ℕ) (hn : 2 ≤ n)
    {c : unitInterval → ℂ} (hcX : ∀ t, c t ≠ 0 ∧ c t ≠ 1) (hc0 : c 0 = 1 / 2)
    {f : unitInterval → ℂ → Fin (n + 1) → ℂ} (hf : TauCeti.IsAnalyticContinuationAlong f c univ)
    (h0 : f 0 =ᶠ[𝓝 (1 / 2 : ℂ)] polylogTower n) :
    singleValued n (c 1) =
      let w : ℂ := ∑ k ∈ Finset.range n, (bernoulliCoeff k : ℂ) *
        f 1 (c 1) ⟨n - k, Nat.sub_lt_succ n k⟩ * (Real.log ‖c 1‖ : ℂ) ^ k
      if Odd n then w.re else w.im := by
  sorry

/-- Real analyticity on `ℂ ∖ {0, 1}`, across the classical cut (§4.4). -/
theorem analyticOnNhd_singleValued (n : ℕ) (hn : 2 ≤ n) :
    AnalyticOnNhd ℝ (singleValued n) ({0, 1} : Set ℂ)ᶜ := by
  sorry

/-- The real differential in every weight, at every point of `ℂ ∖ {0, 1}` (§4.5). -/
theorem singleValued_differential (n : ℕ) (hn : 2 ≤ n) {z : ℂ} (hz0 : z ≠ 0) (hz1 : z ≠ 1) :
    DifferentiableAt ℝ (singleValued n) z ∧ ∀ v : ℂ,
      fderiv ℝ (singleValued n) z v =
        let w : ℂ :=
          (∑ k ∈ Finset.range n, (bernoulliCoeff k : ℂ) * polylog ((n : ℤ) - k - 1) z *
            (Real.log ‖z‖ : ℂ) ^ k * (v / z)) +
          (∑ k ∈ (Finset.range n).erase 0, (k : ℂ) * (bernoulliCoeff k : ℂ) *
            polylog ((n : ℤ) - k) z * (Real.log ‖z‖ : ℂ) ^ (k - 1) * ((v / z).re : ℂ))
        if Odd n then w.re else w.im := by
  sorry

/-- Inversion: `Lₙ(z) + (-1)ⁿ Lₙ(1/z) = 0` for `z ≠ 0` (§4.6). -/
theorem singleValued_inv (n : ℕ) (hn : 2 ≤ n) {z : ℂ} (hz : z ≠ 0) :
    singleValued n z + (-1 : ℝ) ^ n * singleValued n z⁻¹ = 0 := by
  sorry

/-- Conjugation: `Lₙ(z̄) = (-1)^(n-1) Lₙ(z)` for every `z` (§4.6). -/
theorem singleValued_conj (n : ℕ) (hn : 2 ≤ n) (z : ℂ) :
    singleValued n (starRingEnd ℂ z) = (-1 : ℝ) ^ (n - 1) * singleValued n z := by
  sorry

/-- Distribution for every `z ∈ ℂ` and `m ≥ 1` (§4.6). -/
theorem singleValued_distribution (n : ℕ) (hn : 2 ≤ n) (m : ℕ) (hm : 0 < m) (z : ℂ) :
    singleValued n (z ^ m) = (m : ℝ) ^ (n - 1) *
      ∑ j ∈ Finset.range m, singleValued n (Complex.exp (2 * Real.pi * Complex.I * j / m) * z) := by
  sorry

/-- Continuity on the Riemann sphere, hence on `ℂ` (§4.7). -/
theorem continuous_singleValuedSphere (n : ℕ) (hn : 2 ≤ n) :
    Continuous (singleValuedSphere n) := by
  sorry

/-- The weight-two sphere extension tends to zero along the positive imaginary axis (§4.7). -/
theorem singleValuedSphere_two_tendsto_zero :
    Tendsto (fun t : ℝ => singleValuedSphere 2 (((t : ℂ) * Complex.I : ℂ) : OnePoint ℂ))
      (𝓝[>] 0) (𝓝 0) := by
  sorry

/-- The weight-three sphere extension tends to zero at imaginary infinity (§4.7). -/
theorem singleValuedSphere_three_tendsto_infty :
    Tendsto (fun t : ℝ => singleValuedSphere 3 (((t : ℂ) * Complex.I : ℂ) : OnePoint ℂ))
      atTop (𝓝 0) := by
  sorry

/-- The weight-three sphere extension tends to the zeta value from both sides of `1` (§4.7). -/
theorem singleValuedSphere_three_tendsto_one :
    Tendsto (fun t : ℝ => singleValuedSphere 3
      ((1 + (t : ℂ) * Complex.I : ℂ) : OnePoint ℂ)) (𝓝 0) (𝓝 (riemannZeta 3).re) := by
  sorry

/-- `L₃(-1) = -3 ζ(3) / 4` (§4.8). -/
theorem singleValued_three_neg_one : singleValued 3 (-1) = -(3 / 4 : ℝ) * (riemannZeta 3).re := by
  sorry

/-- `L₃` is differentiable at `1` with zero real derivative (§4.8). -/
theorem hasFDerivAt_singleValued_three_one :
    HasFDerivAt (singleValued 3) (0 : ℂ →L[ℝ] ℝ) (1 : ℂ) := by
  sorry

/-! ## Layer 5: the Bloch–Wigner dilogarithm and the five-term relation -/

/-- The Bloch–Wigner dilogarithm `D(z) = Im Li₂(z) + Arg(1 - z) log|z|`, with `D(0) = D(1) = 0`
(§5.1). -/
def blochWigner (z : ℂ) : ℝ :=
  if z = 0 ∨ z = 1 then 0 else (polylog 2 z).im + Complex.arg (1 - z) * Real.log ‖z‖

/-- On the unit circle the argument correction vanishes. -/
example : blochWigner Complex.I = (polylog 2 Complex.I).im := by
  simp [blochWigner, Complex.ext_iff]

/-- At the cut point `2` the correction is `π log 2`, which cancels the lower-value jump. -/
example : blochWigner 2 = (polylog 2 2).im + Real.pi * Real.log 2 := by
  norm_num [blochWigner, Complex.arg_neg_one]

/-- Weight two of Zagier's family is the Bloch–Wigner function, everywhere (§5.2). -/
theorem singleValued_two (z : ℂ) : singleValued 2 z = blochWigner z := by
  sorry

/-- `D(1 - z) = -D(z)` for every `z` (§5.3). -/
theorem blochWigner_one_sub (z : ℂ) : blochWigner (1 - z) = -blochWigner z := by
  sorry

/-- `D(1/z) = -D(z)` for every `z`, including `z = 0` (§5.3). -/
theorem blochWigner_inv (z : ℂ) : blochWigner z⁻¹ = -blochWigner z := by
  sorry

/-- `D(z̄) = -D(z)` for every `z` (§5.3). -/
theorem blochWigner_conj (z : ℂ) : blochWigner (starRingEnd ℂ z) = -blochWigner z := by
  sorry

/-- `D` vanishes on the real axis (§5.3). -/
theorem blochWigner_ofReal (x : ℝ) : blochWigner x = 0 := by
  sorry

/-- The unit-circle Fourier series `D(e^{it}) = ∑ sin(kt)/k²` (§5.1). -/
theorem hasSum_blochWigner_exp (t : ℝ) :
    HasSum (fun k : ℕ => Real.sin ((k + 1 : ℕ) * t) / ((k + 1 : ℕ) : ℝ) ^ 2)
      (blochWigner (Complex.exp ((t : ℂ) * Complex.I))) := by
  sorry

/-- The real derivative of `D` at every `z ∉ {0, 1}`, including the cut (§5.4). -/
theorem blochWigner_differential {z : ℂ} (hz0 : z ≠ 0) (hz1 : z ≠ 1) :
    DifferentiableAt ℝ blochWigner z ∧ ∀ v : ℂ,
      fderiv ℝ blochWigner z v =
        -Real.log ‖z‖ * (v / (1 - z)).im - Real.log ‖1 - z‖ * (v / z).im := by
  sorry

/-- At the cut point `2`, the transverse derivative is nonzero (§5.4). -/
theorem blochWigner_derivative_two (v : ℂ) :
    fderiv ℝ blochWigner (2 : ℂ) v = Real.log 2 * v.im := by
  sorry

/-- The Euclidean Laplacian `ΔD(z) = -2 Im z / (|z|² |1 - z|²)` (§5.5). -/
theorem laplacian_blochWigner {z : ℂ} (hz0 : z ≠ 0) (hz1 : z ≠ 1) :
    Laplacian.laplacian blochWigner z = -2 * z.im / (‖z‖ ^ 2 * ‖1 - z‖ ^ 2) := by
  sorry

/- The weak and strong minimum principles used for positivity are Tau Ceti's. -/
#check @TauCeti.ge_of_laplacian_nonpos_ge_frontier
#check @TauCeti.eqOn_const_of_laplacian_nonpos_of_isMinOn

/-- Strict positivity on the upper half-plane (§5.6). -/
theorem blochWigner_pos {z : ℂ} (hz : 0 < z.im) : 0 < blochWigner z := by
  sorry

/-- Strict negativity on the lower half-plane (§5.6). -/
theorem blochWigner_neg {z : ℂ} (hz : z.im < 0) : blochWigner z < 0 := by
  sorry

/-- The alternating five-term relation; with Lean's `0⁻¹ = 0` the only hypotheses needed are
`x ≠ 0` and `y ≠ 0` (§5.7). -/
theorem blochWigner_fiveTerm {x y : ℂ} (hx : x ≠ 0) (hy : y ≠ 0) :
    blochWigner x - blochWigner y + blochWigner (y / x) -
      blochWigner ((1 - x⁻¹) / (1 - y⁻¹)) + blochWigner ((1 - x) / (1 - y)) = 0 := by
  sorry

/-- The five-term relation in Abel's arguments, for all `x y : ℂ` (§5.7). -/
theorem blochWigner_abel (x y : ℂ) :
    blochWigner (x * y / ((1 - x) * (1 - y))) =
      blochWigner (y / (1 - x)) + blochWigner (x / (1 - y)) - blochWigner x - blochWigner y := by
  sorry

/-- Zagier's cyclic form of the five-term relation, for `x y ≠ 1` (§5.7). -/
theorem blochWigner_fiveTerm_cyclic {x y : ℂ} (hxy : x * y ≠ 1) :
    blochWigner x + blochWigner y + blochWigner ((1 - x) / (1 - x * y)) +
      blochWigner (1 - x * y) + blochWigner ((1 - y) / (1 - x * y)) = 0 := by
  sorry

/-- The cross-ratio normalised so that `r(∞, 0, 1, z) = z` (§5.8). -/
def crossRatio (a b c d : ℂ) : ℂ := (a - c) * (b - d) / ((a - d) * (b - c))

/-- Invariance under the product of the two disjoint transpositions `(a b)(c d)`. -/
example (a b c d : ℂ) : crossRatio b a d c = crossRatio a b c d := by
  unfold crossRatio; ring

/-- Coincident entries give `1` only when the denominator is nonzero; totalisation gives `0`
when it vanishes (§5.8). -/
example : crossRatio 0 0 1 2 = 1 ∧ crossRatio 0 0 0 2 = 0 := by
  norm_num [crossRatio]

/-- The field-general sphere cross-ratio by cancellation in the four one-infinity cases.
Two or more infinities receive zero; projective identities use distinct tuples (§5.8). -/
def crossRatioSphere {K : Type*} [Field K] : OnePoint K → OnePoint K → OnePoint K → OnePoint K → K
  | .some a, .some b, .some c, .some d => (a - c) * (b - d) / ((a - d) * (b - c))
  | .infty, .some b, .some c, .some d => (b - d) / (b - c)
  | .some a, .infty, .some c, .some d => (a - c) / (a - d)
  | .some a, .some b, .infty, .some d => (b - d) / (a - d)
  | .some a, .some b, .some c, .infty => (a - c) / (b - c)
  | _, _, _, _ => 0

/-- Exchanging the first two points in a rational tuple inverts its nonzero cross-ratio (§5.8). -/
example :
    crossRatioSphere (OnePoint.infty : OnePoint ℚ) (0 : ℚ) (1 : ℚ) (3 : ℚ) = 3 ∧
      crossRatioSphere ((0 : ℚ) : OnePoint ℚ) OnePoint.infty (1 : ℚ) (3 : ℚ) = 1 / 3 := by
  norm_num [crossRatioSphere]

/-- The coordinate swap preserves the cross-ratio across its pole in characteristic three (§5.8). -/
example :
    let g : Matrix.GeneralLinearGroup (Fin 2) (ZMod 3) :=
      Matrix.GeneralLinearGroup.mkOfDetNeZero !![0, 1; 1, 0]
        (by norm_num [Matrix.det_fin_two]; decide)
    crossRatioSphere (g • (OnePoint.infty : OnePoint (ZMod 3)))
        (g • ((0 : ZMod 3) : OnePoint (ZMod 3)))
        (g • ((1 : ZMod 3) : OnePoint (ZMod 3)))
        (g • ((2 : ZMod 3) : OnePoint (ZMod 3))) =
      crossRatioSphere (OnePoint.infty : OnePoint (ZMod 3)) (0 : ZMod 3) (1 : ZMod 3) (2 : ZMod 3) ∧
      crossRatioSphere (OnePoint.infty : OnePoint (ZMod 3)) (0 : ZMod 3) (1 : ZMod 3) (2 : ZMod 3) = 2 := by
  have h2 : (2 : ZMod 3) ≠ 0 := by decide
  have hi2 : (2 : ZMod 3)⁻¹ = 2 := ZMod.inv_eq_of_mul_eq_one 3 2 2 (by decide)
  dsimp only
  rw [OnePoint.smul_infty_eq_ite]
  simp only [OnePoint.smul_some_eq_ite]
  norm_num [Matrix.GeneralLinearGroup.mkOfDetNeZero, crossRatioSphere, h2, hi2]

/-- On finite points the sphere cross-ratio agrees with its affine formula (§5.8). -/
theorem crossRatioSphere_finite {K : Type*} [Field K] (a b c d : K) :
    crossRatioSphere (a : OnePoint K) b c d = (a - c) * (b - d) / ((a - d) * (b - c)) := rfl

/-- Cancellation when the first point is infinity (§5.8). -/
theorem crossRatioSphere_infty_first {K : Type*} [Field K] (b c d : K) :
    crossRatioSphere (OnePoint.infty : OnePoint K) b c d = (b - d) / (b - c) := rfl

/-- Cancellation when the second point is infinity (§5.8). -/
theorem crossRatioSphere_infty_second {K : Type*} [Field K] (a c d : K) :
    crossRatioSphere (a : OnePoint K) OnePoint.infty c d = (a - c) / (a - d) := rfl

/-- Cancellation when the third point is infinity (§5.8). -/
theorem crossRatioSphere_infty_third {K : Type*} [Field K] (a b d : K) :
    crossRatioSphere (a : OnePoint K) b OnePoint.infty d = (b - d) / (a - d) := rfl

/-- Cancellation when the fourth point is infinity (§5.8). -/
theorem crossRatioSphere_infty_fourth {K : Type*} [Field K] (a b c : K) :
    crossRatioSphere (a : OnePoint K) b c OnePoint.infty = (a - c) / (b - c) := rfl

/-- Homogeneous determinants compute the sphere cross-ratio of distinct points (§5.8). -/
theorem crossRatioSphere_eq_det {K : Type*} [Field K] [DecidableEq K]
    (s : Fin 4 → OnePoint K) (hs : Function.Injective s)
    (v : Fin 4 → Fin 2 → K) (hv : ∀ i, v i ≠ 0)
    (hrep : ∀ i, OnePoint.equivProjectivization K (s i) = Projectivization.mk K (v i) (hv i)) :
    crossRatioSphere (s 0) (s 1) (s 2) (s 3) =
      (v 0 0 * v 2 1 - v 0 1 * v 2 0) * (v 1 0 * v 3 1 - v 1 1 * v 3 0) /
        ((v 0 0 * v 3 1 - v 0 1 * v 3 0) * (v 1 0 * v 2 1 - v 1 1 * v 2 0)) := by
  sorry

/-- Projective linear transformations preserve the cross-ratio, including poles (§5.8). -/
theorem crossRatioSphere_mobius {K : Type*} [Field K] [DecidableEq K]
    (g : Matrix.GeneralLinearGroup (Fin 2) K) (s : Fin 4 → OnePoint K)
    (hs : Function.Injective s) :
    crossRatioSphere (g • s 0) (g • s 1) (g • s 2) (g • s 3) =
      crossRatioSphere (s 0) (s 1) (s 2) (s 3) := by
  sorry

/-- Every injective projective five-tuple has the normal form `(∞,0,1,x,y)` over its field (§5.8). -/
theorem normalize_five {K : Type*} [Field K] [DecidableEq K]
    (s : Fin 5 → OnePoint K) (hs : Function.Injective s) :
    ∃ (g : Matrix.GeneralLinearGroup (Fin 2) K) (x y : K),
      x ≠ 0 ∧ x ≠ 1 ∧ y ≠ 0 ∧ y ≠ 1 ∧ x ≠ y ∧
        ∀ i, g • s i = ![OnePoint.infty, ((0 : K) : OnePoint K), ((1 : K) : OnePoint K),
          (x : OnePoint K), (y : OnePoint K)] i := by
  sorry

/-- The alternating projective five-term identity includes all possible positions of infinity (§5.8). -/
theorem blochWignerSphere_crossRatio_fiveTerm (s : Fin 5 → OnePoint ℂ)
    (hs : Function.Injective s) :
    blochWigner (crossRatioSphere (s 1) (s 2) (s 3) (s 4)) -
      blochWigner (crossRatioSphere (s 0) (s 2) (s 3) (s 4)) +
      blochWigner (crossRatioSphere (s 0) (s 1) (s 3) (s 4)) -
      blochWigner (crossRatioSphere (s 0) (s 1) (s 2) (s 4)) +
      blochWigner (crossRatioSphere (s 0) (s 1) (s 2) (s 3)) = 0 := by
  sorry

/-- The projective five-term relation for five distinct finite points (§5.8). -/
theorem blochWigner_crossRatio_fiveTerm (s : Fin 5 → ℂ) (hs : Function.Injective s) :
    blochWigner (crossRatio (s 1) (s 2) (s 3) (s 4)) -
      blochWigner (crossRatio (s 0) (s 2) (s 3) (s 4)) +
      blochWigner (crossRatio (s 0) (s 1) (s 3) (s 4)) -
      blochWigner (crossRatio (s 0) (s 1) (s 2) (s 4)) +
      blochWigner (crossRatio (s 0) (s 1) (s 2) (s 3)) = 0 := by
  sorry

/-! ## Layer 6: the Rogers dilogarithm -/

/-- The interval Rogers dilogarithm `R(x) = Li₂(x) + (1/2) log x log(1 - x)` on `(0, 1)`, with
`R(0) = 0` and `R(1) = π²/6` (§6.1). Values off `[0, 1]` carry no theorem. -/
def rogers (x : ℝ) : ℝ :=
  if x = 0 then 0 else if x = 1 then Real.pi ^ 2 / 6
  else (polylog 2 x).re + Real.log x * Real.log (1 - x) / 2

/-- The lower endpoint is unshifted (§6.1). -/
theorem rogers_zero : rogers 0 = 0 := by simp [rogers]

/-- The upper endpoint is `π²/6` (§6.1). -/
theorem rogers_one : rogers 1 = Real.pi ^ 2 / 6 := by simp [rogers]

/-- At the midpoint the logarithmic correction is nonzero (§6.1). -/
example : rogers (1 / 2) = (polylog 2 (1 / 2)).re + (Real.log 2) ^ 2 / 2 := by
  norm_num [rogers, Real.log_div]
  ring

/-- The logarithmic endpoint singularity prevents differentiability at zero (§6.2). -/
theorem not_differentiableAt_rogers_zero : ¬ DifferentiableAt ℝ rogers (0 : ℝ) := by
  sorry

/-- The logarithmic endpoint singularity prevents differentiability at one (§6.2). -/
theorem not_differentiableAt_rogers_one : ¬ DifferentiableAt ℝ rogers (1 : ℝ) := by
  sorry

/-- Continuity on `[0, 1]` (§6.2). -/
theorem continuousOn_rogers : ContinuousOn rogers (Icc 0 1) := by
  sorry

/-- The symmetric derivative on `(0, 1)` (§6.2). -/
theorem hasDerivAt_rogers {x : ℝ} (hx : x ∈ Ioo 0 1) :
    HasDerivAt rogers (-(Real.log (1 - x) / x + Real.log x / (1 - x)) / 2) x := by
  sorry

/-- Strict monotonicity on `[0, 1]` (§6.2). -/
theorem strictMonoOn_rogers : StrictMonoOn rogers (Icc 0 1) := by
  sorry

/-- Reflection on the closed interval (§6.3). -/
theorem rogers_add_rogers_one_sub {x : ℝ} (hx : x ∈ Icc 0 1) :
    rogers x + rogers (1 - x) = Real.pi ^ 2 / 6 := by
  sorry

/-- The exact interval pentagon (§6.4). -/
theorem rogers_pentagon {x y : ℝ} (hx : x ∈ Ioo 0 1) (hy : y ∈ Ioo 0 1) :
    rogers x + rogers y = rogers (x * y) + rogers (x * (1 - y) / (1 - x * y)) +
      rogers (y * (1 - x) / (1 - x * y)) := by
  sorry

/-- The midpoint value (§6.5). -/
theorem rogers_half : rogers (1 / 2) = Real.pi ^ 2 / 12 := by
  sorry

/-- The golden-ratio values `R(ρ) = π²/10` and `R(ρ²) = π²/15`, `ρ = (√5 - 1)/2` (§6.5). -/
theorem rogers_golden :
    rogers ((Real.sqrt 5 - 1) / 2) = Real.pi ^ 2 / 10 ∧
      rogers (((Real.sqrt 5 - 1) / 2) ^ 2) = Real.pi ^ 2 / 15 := by
  sorry

/-- The classical golden-ratio values follow after the Rogers pentagon (§6.5). Both
logarithmic corrections have the same sign and size. -/
theorem polylog_two_golden :
    polylog 2 (((Real.sqrt 5 - 1) / 2 : ℝ) : ℂ) =
      (Real.pi : ℂ) ^ 2 / 10 - (Real.log ((Real.sqrt 5 - 1) / 2) : ℂ) ^ 2 ∧
    polylog 2 ((((Real.sqrt 5 - 1) / 2 : ℝ) : ℂ) ^ 2) =
      (Real.pi : ℂ) ^ 2 / 15 - (Real.log ((Real.sqrt 5 - 1) / 2) : ℂ) ^ 2 := by
  sorry

/-! ## Layer 7: analytic estimates -/

/-- Geometric truncation bound on a smaller disc, weights `n ≥ 1` (§7.1). -/
theorem norm_polylog_sub_partialSum_le (n N : ℕ) (hn : 1 ≤ n) {r : ℝ} (hr0 : 0 ≤ r)
    (hr1 : r < 1) {z : ℂ} (hz : ‖z‖ ≤ r) :
    ‖polylog n z - ∑ k ∈ Finset.range N, z ^ (k + 1) / ((k + 1 : ℕ) : ℂ) ^ n‖ ≤
      r ^ (N + 1) / (((N + 1 : ℕ) : ℝ) ^ n * (1 - r)) := by
  sorry

/-- The closed-disc tail bound `N^(1-n)/(n-1)`, weights `n ≥ 2` (§7.2). -/
theorem norm_polylog_sub_partialSum_le_of_norm_le_one (n N : ℕ) (hn : 2 ≤ n) (hN : 1 ≤ N)
    {z : ℂ} (hz : ‖z‖ ≤ 1) :
    ‖polylog n z - ∑ k ∈ Finset.range N, z ^ (k + 1) / ((k + 1 : ℕ) : ℂ) ^ n‖ ≤
      ((N : ℝ) ^ (n - 1) * ((n - 1 : ℕ) : ℝ))⁻¹ := by
  sorry

/-- The uniform Fourier error for `D` on the unit circle (§7.2). -/
theorem abs_blochWigner_exp_sub_le (N : ℕ) (hN : 1 ≤ N) (t : ℝ) :
    |blochWigner (Complex.exp ((t : ℂ) * Complex.I)) -
      ∑ k ∈ Finset.range N, Real.sin ((k + 1 : ℕ) * t) / ((k + 1 : ℕ) : ℝ) ^ 2| ≤ 1 / N := by
  sorry

/-- The small-argument modulus of `Lₙ`, uniform in direction (§7.4). -/
theorem exists_abs_singleValued_le (n : ℕ) (hn : 2 ≤ n) :
    ∃ C : ℝ, 0 < C ∧ ∀ z : ℂ, 0 < ‖z‖ → ‖z‖ ≤ 1 / 2 →
      |singleValued n z| ≤ C * ‖z‖ * (1 + |Real.log ‖z‖| ^ (n - 1)) := by
  sorry

/-- `Lₙ` is bounded on `ℂ` (§7.7). -/
theorem exists_abs_singleValued_le_const (n : ℕ) (hn : 2 ≤ n) :
    ∃ M : ℝ, ∀ z : ℂ, |singleValued n z| ≤ M := by
  sorry

/-- `D` has no real derivative at `0`: `D(it) = t(1 - log|t|) + O(|t|³(1 + |log|t||))` (§7.6). -/
theorem not_differentiableAt_blochWigner_zero : ¬ DifferentiableAt ℝ blochWigner 0 := by
  sorry

/-- The logarithmic singularity also prevents a real derivative at `1` (§7.6). -/
theorem not_differentiableAt_blochWigner_one : ¬ DifferentiableAt ℝ blochWigner (1 : ℂ) := by
  sorry

/- README targets stated there and not here: the branch function `polylogBranch` on the universal
cover with its determinations and the action of arbitrary loop words (§§2.2–2.3), continued
distribution and reflection along common argument paths (§3.5), the
Goncharov–Rudenko cyclic form (§5.8), branchwise sectorial growth (§7.3), the endpoint moduli at
`1` and `∞` (§7.4) and compact bounds for every real derivative (§7.5). -/


/- Additional API targets specified in the README:

* §1.1: `polylog_one_weight`, `polylog_zero_weight`, `polylog_neg_succ`,
  `polylog_add_two_eq_integral`, `polylog_congr`.
* §1.2: `polylog_integrand_ae_congr`, `uniformIntegrable_polylog_integrand`.
* §1.4: `analyticOnNhd_polylog_nonpos`.
* §1.7: `hasSum_polylog_of_norm_le_one`.
* §2.1: `polylogTower_zero`, `polylogTower_succ`, `polylogTower_ode`.
* §2.2: `polylogBranch_basepointLift`, `polylogBranch_eq_of_isAnalyticContinuationAlong`,
  `polylogBranch_trans`, `polylogBranch_trunc`, `analyticOn_polylogBranch_comp_section`,
  `exists_section_of_isSimplyConnected`, `polylogBranch_principal`,
  `polylogBranch_principal_entries`.
* §2.3: `polylogBranch_T₀`, `polylogBranch_T₁`, `polylogBranch_smul`.
* §2.4: `continuousWithinAt_polylog_closedLowerHalfPlane`.
* §3.5: `isAnalyticContinuationAlong_functionalEquation`, `functionalEquation_branch_change`.
* §3.6: `polylog_two_one`.
* §4.1: `bernoulliCoeff_zero`, `bernoulliCoeff_one`, `bernoulliCoeff_two`,
  `bernoulliCoeff_of_odd`, `bernoulliCoeff_powerSeries`.
* §4.2: `singleValued_formula`, `singleValued_zero`.
* §4.3: `singleValued_eq_polylogBranch`.
* §4.4: `contDiffOn_singleValued`.
* §4.7: `continuous_singleValued`.
* §4.8: `singleValued_three_differential`, `singleValued_three_one_pos`.
* §5.1: `blochWigner_formula`, `blochWigner_zero`, `blochWigner_one`,
  `blochWigner_exp_eq_im_expZeta`.
* §5.3: `blochWigner_sixfold`.
* §5.4: `blochWigner_differential_eq_eta`.
* §5.8: `crossRatio_swap`, `crossRatio_zero_one`,
  `blochWigner_bracket_cyclic`.
* §6.1: `rogers_formula`, `rogers_eq_polylog`, `rogers_mem_Icc`.
* §6.2: `analyticOnNhd_rogers`.
* §7.1: `norm_polylog_sub_partialSum_le_of_nonpos`.
* §7.2: `abs_singleValued_exp_sub_le`.
* §7.3: `polylogBranch_isBigO_zero`, `polylogBranch_isBigO_infty`,
  `polylogBranch_tendsto_one`.
* §7.4: `exists_abs_singleValued_le_of_two_le_norm`, `exists_abs_singleValued_sub_le_one`.
* §7.5: `exists_norm_iteratedFDeriv_singleValued_le`, `lipschitzOnWith_singleValued`.
* §7.6: `blochWigner_I_mul_asymptotic`.
* §7.7: `abs_sum_singleValued_sub_le`.
-/

end TauCetiRoadmap.PolylogarithmFunctions
