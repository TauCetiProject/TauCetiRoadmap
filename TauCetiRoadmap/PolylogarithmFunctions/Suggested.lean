import Mathlib
import TauCeti.AlgebraicTopology.ThricePuncturedSphere.PeripheralLoops
import TauCeti.AlgebraicTopology.UniversalCover.Action
import TauCeti.Analysis.Complex.Conformal.Continuation.Basic

/-!
# Polylogarithm functions: headline target statements

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. These statements give Lean forms for headline results; proving them does not
finish the supporting theory required by a layer or by the roadmap.

The statements cover the principal integer-weight family (§§1.3, 1.5), its branch on
Tau Ceti's universal cover and polynomial monodromy (§§2.1–2.3), classical functional equations
and their coherent continuation (§§3.1–3.5), Zagier's single-valued family (§§4.3–4.7),
the Bloch–Wigner differential, Laplacian, positivity and five-term relations (§§5.4–5.8),
the Rogers pentagon and golden-ratio values (§§6.4–6.5), and quantitative truncation,
sectorial, endpoint and logarithmic asymptotic estimates (§§7.1–7.6).

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

/-! ## Principal polylogarithms -/

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

/-- The disc series in every integer weight, indexed from `k + 1 = 1` (§1.3). -/
theorem hasSum_polylog_of_norm_lt (n : ℤ) {z : ℂ} (hz : ‖z‖ < 1) :
    HasSum (fun k : ℕ => z ^ (k + 1) / ((k + 1 : ℕ) : ℂ) ^ n) (polylog n z) := by
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

/-! ## Coherent continuation and monodromy -/

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

/-! ## Classical functional equations -/

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

/-! ## Single-valued polylogarithms -/

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

/-! ## Bloch–Wigner identities -/

/-- The Bloch–Wigner dilogarithm `D(z) = Im Li₂(z) + Arg(1 - z) log|z|`, with `D(0) = D(1) = 0`
(§5.1). -/
def blochWigner (z : ℂ) : ℝ :=
  if z = 0 ∨ z = 1 then 0 else (polylog 2 z).im + Complex.arg (1 - z) * Real.log ‖z‖

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

/-- The cyclic Goncharov–Rudenko bracket relation on five distinct sphere points (§5.8).
Their bracket is `1 - r`, with cyclic indices in `ZMod 5`. -/
theorem blochWigner_bracket_cyclic (s : ZMod 5 → OnePoint ℂ) (hs : Function.Injective s) :
    ∑ i : ZMod 5, blochWigner (1 -
      crossRatioSphere (s i) (s (i + 1)) (s (i + 2)) (s (i + 3))) = 0 := by
  sorry

/-! ## Rogers dilogarithm -/

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

/-- The golden-ratio values `R(ρ) = π²/10` and `R(ρ²) = π²/15`, `ρ = (√5 - 1)/2` (§6.5). -/
theorem rogers_golden :
    rogers ((Real.sqrt 5 - 1) / 2) = Real.pi ^ 2 / 10 ∧
      rogers (((Real.sqrt 5 - 1) / 2) ^ 2) = Real.pi ^ 2 / 15 := by
  sorry

/-! ## Quantitative estimates -/

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

/-- A punctured sector at `0`, of opening `2 * width` and radius `radius` (§7.3).
Translation to `1` and inversion give the other two sector charts. -/
def puncturedSector (angle width radius : ℝ) : Set ℂ :=
  {u | 0 < ‖u‖ ∧ ‖u‖ < radius ∧
    |Complex.arg (u * Complex.exp (-(angle : ℂ) * Complex.I))| < width}

/-- Every determination has the prescribed logarithmic growth at `0` and `∞`, and in
weight at least two its limit at `1` lies in the period lattice (§7.3). `B` is characterized
by actual continuations of the tower, and the three continuous sections lie above the
sector charts `u`, `1/u` and `1+u`. -/
theorem polylogBranch_sectorial (N n : ℕ) (hn : 1 ≤ n) (hnN : n ≤ N)
    (B : TauCeti.UniversalCover TauCeti.ThricePuncturedSphere.basePt → Fin (N + 1) → ℂ)
    (hB : ∀ (z : TauCeti.ThricePuncturedSphere)
      (γ : Path TauCeti.ThricePuncturedSphere.basePt z),
      ∃ f : unitInterval → ℂ → Fin (N + 1) → ℂ,
        TauCeti.IsAnalyticContinuationAlong f (fun t => (γ t : ℂ)) univ ∧
        (f 0 =ᶠ[𝓝 (1 / 2 : ℂ)] polylogTower N) ∧
        B ⟨z, Path.Homotopic.Quotient.mk γ⟩ = f 1 (z : ℂ))
    (angle width radius : ℝ) (hw0 : 0 < width) (hwπ : width < Real.pi)
    (hr0 : 0 < radius) (hr : radius < 1 / 2)
    (s₀ sInf s₁ : puncturedSector angle width radius →
      TauCeti.UniversalCover TauCeti.ThricePuncturedSphere.basePt)
    (hs₀ : Continuous s₀) (hsInf : Continuous sInf) (hs₁ : Continuous s₁)
    (hp₀ : ∀ u, ((s₀ u).proj : ℂ) = (u : ℂ))
    (hpInf : ∀ u, ((sInf u).proj : ℂ) = (u : ℂ)⁻¹)
    (hp₁ : ∀ u, ((s₁ u).proj : ℂ) = 1 + (u : ℂ)) :
    let i : Fin (N + 1) := ⟨n, by omega⟩
    let l := comap (fun u : puncturedSector angle width radius => (u : ℂ)) (𝓝 0)
    ((fun u => B (s₀ u) i) =O[l]
      (fun u => 1 + |Real.log ‖(u : ℂ)‖| ^ (n - 1))) ∧
    ((fun u => B (sInf u) i) =O[l]
      (fun u => 1 + |Real.log ‖(u : ℂ)‖| ^ n)) ∧
    (2 ≤ n → ∃ m : ℤ, Tendsto (fun u => B (s₁ u) i) l
      (𝓝 (riemannZeta n + (m : ℂ) * (2 * Real.pi * Complex.I) ^ n /
        ((n - 1).factorial : ℂ)))) := by
  sorry

/-- The small-argument modulus of `Lₙ`, uniform in direction (§7.4). -/
theorem exists_abs_singleValued_le (n : ℕ) (hn : 2 ≤ n) :
    ∃ C : ℝ, 0 < C ∧ ∀ z : ℂ, 0 < ‖z‖ → ‖z‖ ≤ 1 / 2 →
      |singleValued n z| ≤ C * ‖z‖ * (1 + |Real.log ‖z‖| ^ (n - 1)) := by
  sorry

/-- A direction-uniform logarithmic modulus at `1` in every weight, with the odd-weight
zeta value retained (§7.4). -/
theorem exists_abs_singleValued_sub_le_one (n : ℕ) (hn : 2 ≤ n) :
    ∃ A : ℝ, 0 < A ∧ ∀ z : ℂ, 0 < ‖z - 1‖ → ‖z - 1‖ ≤ 1 / 2 →
      |singleValued n z - singleValued n 1| ≤
        A * ‖z - 1‖ * (1 + |Real.log ‖z - 1‖|) := by
  sorry

/-- The logarithmic singularity of `D` along the imaginary axis, with a cubic remainder
from either direction (§7.6). -/
theorem blochWigner_I_mul_asymptotic :
    (fun t : ℝ => blochWigner ((t : ℂ) * Complex.I) - t * (1 - Real.log (|t|)))
      =O[𝓝[≠] 0] (fun t : ℝ => |t| ^ 3 * (1 + |Real.log (|t|)|)) := by
  sorry

end TauCetiRoadmap.PolylogarithmFunctions
