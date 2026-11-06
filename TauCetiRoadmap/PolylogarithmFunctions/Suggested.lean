import Mathlib
import TauCeti.AlgebraicTopology.ThricePuncturedSphere.PeripheralLoops
import TauCeti.AlgebraicTopology.UniversalCover.Action
import TauCeti.Analysis.Complex.Conformal.Continuation.Basic

/-!
# Polylogarithm functions: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. These statements give Lean forms for headline results against the pinned APIs; proving them does not
finish the supporting theory required by a layer or by the roadmap.

The statements cover the principal analytic continuation (§1.5), the branch on
Tau Ceti's universal cover and polynomial monodromy (§§2.1–2.3), classical functional equations
and their coherent continuation (§§3.1–3.5), Zagier's branch independence, real analyticity,
the all-weight real differential, inversion, distribution and sphere continuity (§§4.3–4.7), the Bloch–Wigner Laplacian,
positivity and five-term relations (§§5.5–5.8), the Rogers pentagon (§6.4), and quantitative disc and Fourier tails, sectorial branch
growth, endpoint moduli and the Bloch–Wigner logarithmic expansion (§§7.1–7.6).

All objects needed for these results exist at the pins or have the concrete definitions
below. In particular, the universal cover, thrice-punctured sphere and peripheral classes
are Tau Ceti's own carriers. The branch and its polynomial action are asserted to exist,
with their terminal-continuation characterization; no data are postulated. Polynomiality
of the action is expressed by coordinate polynomials in Mathlib's `MvPolynomial`, and the
inverse is polynomial because the same condition applies to the inverse group element.
No headline statement is omitted for lack of a carrier at the pins.

The integral selects the lower principal value on the cut. Bernoulli numbers use
`B₁ = -1/2`; the single-valued family is real-valued, with real projection in odd weight
and imaginary projection in even weight. Its endpoint values are part of its definition.
The sphere cross-ratio has normalization `r(∞, 0, 1, z) = z` over every field.
-/

noncomputable section

open scoped Topology
open Set Filter MeasureTheory

namespace TauCetiRoadmap.PolylogarithmFunctions

/-! ## Layer 1: Principal polylogarithms -/

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

/-- Holomorphy on the principal domain `ℂ ∖ [1, ∞)` in every integer weight (§1.5). -/
theorem analyticOnNhd_polylog (n : ℤ) :
    AnalyticOnNhd ℂ (polylog n) {z : ℂ | 1 - z ∈ Complex.slitPlane} := by
  sorry

/-! ## Layer 2: Coherent continuation and monodromy -/

/-- The classical tower as a single vector-valued germ (§2.1): entry `0` is `Log z` and entry
`i ≥ 1` is `Liᵢ z`. Continuing this one germ continues every weight along the same path, which
is what makes a branch of the tower coherent. -/
def polylogTower (N : ℕ) (z : ℂ) : Fin (N + 1) → ℂ :=
  fun i => if (i : ℕ) = 0 then Complex.log z else polylog (i : ℕ) z

/-- The tower defines a branch on the universal cover, equivariant for a polynomial action
of the fundamental group with the two prescribed peripheral transformations (§§2.1–2.3).
The action prefixes inverse loops, so the counterclockwise formulas use `periph0⁻¹` and
`periph1⁻¹`. Its value on every based path is the endpoint of a continuation of the tower. -/
theorem exists_polylogBranch_monodromy (N : ℕ) :
    ∃ (B : TauCeti.UniversalCover TauCeti.ThricePuncturedSphere.basePt → Fin (N + 1) → ℂ)
      (ρ : FundamentalGroup TauCeti.ThricePuncturedSphere
        TauCeti.ThricePuncturedSphere.basePt →* Equiv.Perm (Fin (N + 1) → ℂ)),
      (∀ (z : TauCeti.ThricePuncturedSphere)
        (γ : Path TauCeti.ThricePuncturedSphere.basePt z),
        ∃ f : unitInterval → ℂ → Fin (N + 1) → ℂ,
          TauCeti.IsAnalyticContinuationAlong f (fun t => (γ t : ℂ)) univ ∧
          (f 0 =ᶠ[𝓝 (1 / 2 : ℂ)] polylogTower N) ∧
          B ⟨z, Path.Homotopic.Quotient.mk γ⟩ = f 1 (z : ℂ)) ∧
      (∀ g i, ∃ P : MvPolynomial (Fin (N + 1)) ℂ,
        ∀ w, ρ g w i = MvPolynomial.eval w P) ∧
      (∀ w i, ρ TauCeti.ThricePuncturedSphere.periph0⁻¹ w i =
        w i + if (i : ℕ) = 0 then 2 * Real.pi * Complex.I else 0) ∧
      (∀ w i, ρ TauCeti.ThricePuncturedSphere.periph1⁻¹ w i =
        w i - if (i : ℕ) = 0 then 0 else
          2 * Real.pi * Complex.I * w 0 ^ ((i : ℕ) - 1) /
            (((i : ℕ) - 1).factorial : ℂ)) ∧
      (∀ g p, B (g • p) = ρ g (B p)) := by
  sorry

/-! ## Layer 3: Classical functional equations -/

/-- Distribution in every integer weight on the star domain where every `ζ z` avoids the cut;
the factor `m^(n-1)` is an integer power, so it is `1/m` in weight zero (§3.1). -/
theorem polylog_distribution (n : ℤ) (m : ℕ) (hm : 0 < m) {z : ℂ}
    (hz : ∀ j ∈ Finset.range m,
      1 - Complex.exp (2 * Real.pi * Complex.I * j / m) * z ∈ Complex.slitPlane) :
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

/-! ## Layer 4: Single-valued polylogarithms -/

/-- The coefficients `cₖ = 2^k Bₖ / k!` of Zagier's single-valued combination (§4.1). -/
def bernoulliCoeff (k : ℕ) : ℚ := 2 ^ k * bernoulli k / k.factorial

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

/-- The extension of `Lₙ` to the Riemann sphere `OnePoint ℂ`, with value `0` at `∞` (§4.7). -/
def singleValuedSphere (n : ℕ) : OnePoint ℂ → ℝ := fun p => p.elim 0 (singleValued n)

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

/-- The real differential in every weight, in an arbitrary direction, including on the cut.
The principal lower values in the finite sums give the same differential as any coherent
local determination (§4.5). -/
theorem fderiv_singleValued (n : ℕ) (hn : 2 ≤ n) {z : ℂ}
    (hz0 : z ≠ 0) (hz1 : z ≠ 1) (v : ℂ) :
    fderiv ℝ (singleValued n) z v =
      let l := Real.log ‖z‖
      let w := (∑ k ∈ Finset.range n, (bernoulliCoeff k : ℂ) *
        polylog ((n : ℤ) - k - 1) z * (l : ℂ) ^ k * (v / z)) +
        ∑ k ∈ Finset.Icc 1 (n - 1), (k : ℂ) * (bernoulliCoeff k : ℂ) *
          polylog ((n : ℤ) - k) z * (l : ℂ) ^ (k - 1) * ((v / z).re : ℂ)
      if Odd n then w.re else w.im := by
  sorry

/-- Inversion: `Lₙ(z) + (-1)ⁿ Lₙ(1/z) = 0` for `z ≠ 0` (§4.6). -/
theorem singleValued_inv (n : ℕ) (hn : 2 ≤ n) {z : ℂ} (hz : z ≠ 0) :
    singleValued n z + (-1 : ℝ) ^ n * singleValued n z⁻¹ = 0 := by
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

/-! ## Layer 5: Bloch–Wigner identities -/

/-- The Bloch–Wigner dilogarithm `D(z) = Im Li₂(z) + Arg(1 - z) log|z|`, with `D(0) = D(1) = 0`
(§5.1). -/
def blochWigner (z : ℂ) : ℝ :=
  if z = 0 ∨ z = 1 then 0 else (polylog 2 z).im + Complex.arg (1 - z) * Real.log ‖z‖

/-- The Euclidean Laplacian `ΔD(z) = -2 Im z / (|z|² |1 - z|²)` (§5.5). -/
theorem laplacian_blochWigner {z : ℂ} (hz0 : z ≠ 0) (hz1 : z ≠ 1) :
    Laplacian.laplacian blochWigner z = -2 * z.im / (‖z‖ ^ 2 * ‖1 - z‖ ^ 2) := by
  sorry

/-- Strict positivity on the upper half-plane (§5.6). -/
theorem blochWigner_pos {z : ℂ} (hz : 0 < z.im) : 0 < blochWigner z := by
  sorry

/-- The alternating five-term relation; with Lean's `0⁻¹ = 0` the only hypotheses needed are
`x ≠ 0` and `y ≠ 0` (§5.7). -/
theorem blochWigner_fiveTerm {x y : ℂ} (hx : x ≠ 0) (hy : y ≠ 0) :
    blochWigner x - blochWigner y + blochWigner (y / x) -
      blochWigner ((1 - x⁻¹) / (1 - y⁻¹)) + blochWigner ((1 - x) / (1 - y)) = 0 := by
  sorry

/-- The field-general sphere cross-ratio by cancellation in the four one-infinity cases.
Two or more infinities receive zero; projective identities use distinct tuples (§5.8). -/
def crossRatioSphere {K : Type*} [Field K] : OnePoint K → OnePoint K → OnePoint K → OnePoint K → K
  | .some a, .some b, .some c, .some d => (a - c) * (b - d) / ((a - d) * (b - c))
  | .infty, .some b, .some c, .some d => (b - d) / (b - c)
  | .some a, .infty, .some c, .some d => (a - c) / (a - d)
  | .some a, .some b, .infty, .some d => (b - d) / (a - d)
  | .some a, .some b, .some c, .infty => (a - c) / (b - c)
  | _, _, _, _ => 0

/-- The alternating projective five-term identity includes all possible positions of infinity (§5.8). -/
theorem blochWignerSphere_crossRatio_fiveTerm (s : Fin 5 → OnePoint ℂ)
    (hs : Function.Injective s) :
    blochWigner (crossRatioSphere (s 1) (s 2) (s 3) (s 4)) -
      blochWigner (crossRatioSphere (s 0) (s 2) (s 3) (s 4)) +
      blochWigner (crossRatioSphere (s 0) (s 1) (s 3) (s 4)) -
      blochWigner (crossRatioSphere (s 0) (s 1) (s 2) (s 4)) +
      blochWigner (crossRatioSphere (s 0) (s 1) (s 2) (s 3)) = 0 := by
  sorry

/-! ## Layer 6: Rogers dilogarithm -/

/-- The interval Rogers dilogarithm `R(x) = Li₂(x) + (1/2) log x log(1 - x)` on `(0, 1)`, with
`R(0) = 0` and `R(1) = π²/6` (§6.1). Values off `[0, 1]` carry no theorem. -/
def rogers (x : ℝ) : ℝ :=
  if x = 0 then 0 else if x = 1 then Real.pi ^ 2 / 6
  else (polylog 2 x).re + Real.log x * Real.log (1 - x) / 2

/-- The exact interval pentagon (§6.4). -/
theorem rogers_pentagon {x y : ℝ} (hx : x ∈ Ioo 0 1) (hy : y ∈ Ioo 0 1) :
    rogers x + rogers y = rogers (x * y) + rogers (x * (1 - y) / (1 - x * y)) +
      rogers (y * (1 - x) / (1 - x * y)) := by
  sorry

/-! ## Layer 7: Analytic estimates -/

/-- Uniform geometric tail bound for positive weights on every smaller closed disc (§7.1). -/
theorem norm_polylog_sub_partialSum_le (n N : ℕ) (hn : 1 ≤ n)
    {r : ℝ} (hr0 : 0 ≤ r) (hr1 : r < 1) {z : ℂ} (hz : ‖z‖ ≤ r) :
    ‖polylog n z - ∑ k ∈ Finset.Icc 1 N, z ^ k / (k : ℂ) ^ n‖ ≤
      r ^ (N + 1) / ((N + 1 : ℝ) ^ n * (1 - r)) := by
  sorry

/-- The nonpositive-weight tail is bounded by the corresponding Euler derivative of the
geometric tail; unlike the positive-weight estimate it retains polynomial growth (§7.1). -/
theorem norm_polylog_sub_partialSum_le_of_nonpos (n : ℤ) (hn : n ≤ 0) (N : ℕ)
    {r : ℝ} (hr0 : 0 ≤ r) (hr1 : r < 1) {z : ℂ} (hz : ‖z‖ ≤ r) :
    ‖polylog n z - ∑ k ∈ Finset.Icc 1 N, z ^ k / (k : ℂ) ^ n‖ ≤
      ((fun f : ℝ → ℝ => fun x => x * deriv f x)^[(-n).toNat])
        (fun x => x ^ (N + 1) / (1 - x)) r := by
  sorry

/-- Uniform polynomial tail bound on the whole closed disc, including the zeta endpoint (§7.2). -/
theorem norm_polylog_sub_partialSum_le_closedDisc (n N : ℕ) (hn : 2 ≤ n) (hN : 1 ≤ N)
    {z : ℂ} (hz : ‖z‖ ≤ 1) :
    ‖polylog n z - ∑ k ∈ Finset.Icc 1 N, z ^ k / (k : ℂ) ^ n‖ ≤
      1 / ((N : ℝ) ^ (n - 1) * (n - 1 : ℝ)) := by
  sorry

/-- Uniform Fourier tail in every weight; odd weights use cosines and even weights sines (§7.2). -/
theorem abs_singleValued_exp_sub_le (n N : ℕ) (hn : 2 ≤ n) (hN : 1 ≤ N) (t : ℝ) :
    |singleValued n (Complex.exp (t * Complex.I)) -
      ∑ k ∈ Finset.Icc 1 N,
        (if Odd n then Real.cos (k * t) else Real.sin (k * t)) / (k : ℝ) ^ n| ≤
      1 / ((N : ℝ) ^ (n - 1) * (n - 1 : ℝ)) := by
  sorry

/-- An open punctured angular sector of radius `δ`, angle `θ` and half-width `w` (§7.3). -/
def puncturedSector (θ w δ : ℝ) : Set ℂ :=
  {z | 0 < ‖z‖ ∧ ‖z‖ < δ ∧ |Complex.arg (z * Complex.exp (-θ * Complex.I))| < w}

/-- A holomorphic determination of the weight-`n` polylogarithm on `V`: each local germ is
obtained from the principal germ at `1/2` by continuation inside the twice-punctured plane.
The terminal germ, rather than only its value, identifies the determination (§§2.2, 7.3). -/
def IsPolylogBranchOn (n : ℕ) (f : ℂ → ℂ) (V : Set ℂ) : Prop :=
  ∀ z ∈ V, ∃ (c : unitInterval → ℂ) (g : unitInterval → ℂ → ℂ),
    (∀ t, c t ≠ 0 ∧ c t ≠ 1) ∧ c 0 = 1 / 2 ∧ c 1 = z ∧
    TauCeti.IsAnalyticContinuationAlong g c univ ∧
    (g 0 =ᶠ[𝓝 (1 / 2 : ℂ)] polylog n) ∧ (g 1 =ᶠ[𝓝 z] f)

/-- Every determination has logarithmic growth of degree at most `n-1` near zero.
The implicit constant may depend on the determination and the sector (§7.3). -/
theorem polylogBranch_isBigO_zero (n : ℕ) (hn : 1 ≤ n) (θ w δ : ℝ)
    (hw0 : 0 < w) (hw : w < Real.pi) (hδ0 : 0 < δ) (hδ : δ < 1 / 2)
    {f : ℂ → ℂ} (hf : IsPolylogBranchOn n f (puncturedSector θ w δ)) :
    Asymptotics.IsBigO (𝓝[puncturedSector θ w δ] 0) f
      (fun z => 1 + |Real.log ‖z‖| ^ (n - 1)) := by
  sorry

/-- At infinity every determination has logarithmic growth of degree at most `n`;
the inverse coordinate describes the sector and its approach to infinity (§7.3). -/
theorem polylogBranch_isBigO_infty (n : ℕ) (hn : 1 ≤ n) (θ w δ : ℝ)
    (hw0 : 0 < w) (hw : w < Real.pi) (hδ0 : 0 < δ) (hδ : δ < 1 / 2)
    {f : ℂ → ℂ}
    (hf : IsPolylogBranchOn n f {z | z⁻¹ ∈ puncturedSector θ w δ}) :
    Asymptotics.IsBigO (𝓝[puncturedSector θ w δ] 0) (fun z => f z⁻¹)
      (fun z => 1 + |Real.log ‖z⁻¹‖| ^ n) := by
  sorry

/-- Every weight at least two has a sectorial limit at one in the specified period lattice;
the integer depends on the determination (§7.3). -/
theorem polylogBranch_tendsto_one (n : ℕ) (hn : 2 ≤ n) (θ w δ : ℝ)
    (hw0 : 0 < w) (hw : w < Real.pi) (hδ0 : 0 < δ) (hδ : δ < 1 / 2)
    {f : ℂ → ℂ}
    (hf : IsPolylogBranchOn n f {z | z - 1 ∈ puncturedSector θ w δ}) :
    ∃ m : ℤ, Tendsto (fun z => f (1 + z)) (𝓝[puncturedSector θ w δ] 0)
      (𝓝 (riemannZeta n + m * (2 * Real.pi * Complex.I) ^ n /
        ((n - 1).factorial : ℂ))) := by
  sorry

/-- Direction-uniform moduli at zero, infinity and one, with constants chosen before the
argument. The logarithmic loss at one includes weight two (§7.4). -/
theorem singleValued_endpoint_bounds (n : ℕ) (hn : 2 ≤ n) :
    ∃ C A : ℝ, 0 < C ∧ 0 < A ∧
      (∀ z : ℂ, 0 < ‖z‖ → ‖z‖ ≤ 1 / 2 →
        |singleValued n z| ≤ C * ‖z‖ * (1 + |Real.log ‖z‖| ^ (n - 1))) ∧
      (∀ z : ℂ, 2 ≤ ‖z‖ →
        |singleValued n z| ≤ C / ‖z‖ * (1 + Real.log ‖z‖ ^ (n - 1))) ∧
      (∀ z : ℂ, 0 < ‖z - 1‖ → ‖z - 1‖ ≤ 1 / 2 →
        |singleValued n z - singleValued n 1| ≤
          A * ‖z - 1‖ * (1 + |Real.log ‖z - 1‖|)) := by
  sorry

/-- The two-sided logarithmic expansion at zero, with cubic logarithmic error (§7.6). -/
theorem blochWigner_logarithmic_expansion :
    Asymptotics.IsBigO (𝓝[≠] (0 : ℝ))
      (fun t : ℝ => blochWigner (t * Complex.I) - t * (1 - Real.log |t|))
      (fun t : ℝ => |t| ^ 3 * (1 + |Real.log (|t|)|)) := by
  sorry

end TauCetiRoadmap.PolylogarithmFunctions
