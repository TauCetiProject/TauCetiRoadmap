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
defines, the action of arbitrary loop words and the continued functional equations are README
targets; their carrier `TauCeti.UniversalCover` is pinned below.

Design choices made explicit here:

* `polylog n z` is defined for every integer weight `n`: by the logarithmic radial integral for
  `n ≥ 2`, by Mathlib's principal logarithm for `n = 1`, and by iterated Euler derivatives of
  `z / (1 - z)` for `n ≤ 0`. Its names follow the complex-order `Complex.polylog` proposed for
  Mathlib, whose integer-order restriction it is away from the poles.
* On the cut `[1, ∞)` the total value is the limit from the lower half-plane, because Mathlib's
  argument lies in `(-π, π]`.
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

/-- The odd-weight endpoint keeps the zeta value. -/
example : singleValued 3 1 = (riemannZeta 3).re := by
  simp [singleValued, show Odd 3 by decide]

/-- The even-weight endpoint is zero. -/
example : singleValued 2 1 = 0 := by
  simp [singleValued, show ¬ Odd 2 by decide]

/-- The extension of `Lₙ` to the Riemann sphere `OnePoint ℂ`, with value `0` at `∞` (§4.7). -/
def singleValuedSphere (n : ℕ) : OnePoint ℂ → ℝ := fun p => p.elim 0 (singleValued n)

/-- The value at infinity is zero. -/
example (n : ℕ) : singleValuedSphere n OnePoint.infty = 0 := rfl

/-- On a finite point the sphere extension is `Lₙ` itself. -/
example (n : ℕ) (z : ℂ) : singleValuedSphere n z = singleValued n z := rfl

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

/-- The lower endpoint is unshifted. -/
example : rogers 0 = 0 := by simp [rogers]

/-- The upper endpoint is `π²/6`. -/
example : rogers 1 = Real.pi ^ 2 / 6 := by simp [rogers]

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

/- README targets stated there and not here: the branch function `polylogBranch` on the universal
cover with its determinations and the action of arbitrary loop words (§§2.2–2.3), the continued
functional equations along common argument paths (§3.5), the sphere cross-ratio
`crossRatioSphere` with the projective five-term relation at a point `∞` and the
Goncharov–Rudenko cyclic form (§5.8), branchwise sectorial growth (§7.3), the endpoint moduli at
`1` and `∞` (§7.4) and compact bounds for every real derivative (§7.5). -/


/- Additional API targets specified in the README:

* §1.1: `polylog_one_weight`, `polylog_zero_weight`, `polylog_neg_succ`,
  `polylog_add_two_eq_integral`, `polylog_congr`.
* §1.2: `polylog_integrand_ae_congr`, `uniformIntegrable_polylog_integrand`.
* §1.4: `analyticOnNhd_polylog_nonpos`.
* §1.7: `hasSum_polylog_of_norm_le_one`.
* §2.1: `polylogTower_zero`, `polylogTower_succ`, `polylogTower_trunc`, `polylogTower_ode`.
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
* §4.2: `singleValued_formula`, `singleValued_zero`, `singleValued_one`,
  `singleValuedSphere_infty`, `singleValuedSphere_coe`.
* §4.3: `singleValued_eq_polylogBranch`.
* §4.4: `contDiffOn_singleValued`.
* §4.7: `continuous_singleValued`.
* §4.8: `singleValued_three_differential`, `singleValued_three_one_pos`.
* §5.1: `blochWigner_formula`, `blochWigner_zero`, `blochWigner_one`,
  `blochWigner_exp_eq_im_expZeta`.
* §5.3: `blochWigner_sixfold`.
* §5.4: `blochWigner_differential_eq_eta`, `blochWigner_derivative_two`.
* §5.8: `crossRatio_swap`, `crossRatio_zero_one`,
  `blochWignerSphere_crossRatio_fiveTerm`, `blochWigner_bracket_cyclic`.
* §6.1: `rogers_formula`, `rogers_zero`, `rogers_one`, `rogers_eq_polylog`, `rogers_mem_Icc`.
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
