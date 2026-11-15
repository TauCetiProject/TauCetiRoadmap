module

public import Mathlib
public import TauCeti.Analysis.SpecialFunctions.Beta
public import TauCeti.MeasureTheory.Integral.Gamma
public import TauCeti.Analysis.Contour.WorkedExamples.HalfDisc.SineIntegral

/-!
# The Gamma and Beta functions: target signatures

This file states, against the pinned Mathlib and Tau Ceti, the headlines of `README.md` that
carry a Lean name, each with every conclusion the README attaches to it. It is not an exhaustive
acceptance test: the other headlines of the README are targets of the same standing, stated in
prose. Discharging this file finishes neither a layer nor the roadmap.

A real-variable `ψ(x)` is written `(Complex.digamma x).re`. The asymptotic expansion of `ψ⁽ⁿ⁾`
(README 3.5) is stated in its truncated `O`-form; the asymptotic-expansion predicate of
AsymptoticExpansions 1.1 is not available at the pinned libraries.

The definitions below are roadmap-local copies of the definitions `README.md` pins. In Tau Ceti
`Complex.polygamma`, `Complex.lah` and `Complex.invGammaCoeff` live in `Complex`, beside Mathlib's
`Complex.Gamma` and `Complex.digamma`; here they and the theorems live in this file's namespace,
with the prefixes `Complex`, `Real` and `TauCeti` that the README uses. Theorems are stated with
`sorry`. Section numbers in docstrings are those of the README; equation numbers are locators in
the sources listed there.

The helpers `sectorFilter` (the filter `z → ∞` in `|ph z| ≤ π − δ`), `temmePhi` (Temme's phase
function) and `absVandermonde` (`|Δ(t)|`) only abbreviate statements.
-/

@[expose] public section

noncomputable section

namespace TauCetiRoadmap.SpecialFunctionsGamma

open Complex Filter Topology Set MeasureTheory Finset
open scoped Real

/-- Euler's constant. -/
local notation "γ" => Real.eulerMascheroniConstant

/-! ## Definitions -/

/-- The polygamma function `ψ⁽ⁿ⁾ = dⁿψ/dzⁿ`; `polygamma 0 = digamma` (README 1.3). -/
def Complex.polygamma (n : ℕ) (z : ℂ) : ℂ :=
  iteratedDeriv n digamma z

/-- The Lah numbers `L(n, k) = C(n − 1, k − 1) n!/k!` for `1 ≤ k ≤ n`, with `L(0, 0) = 1` and
`L(n, k) = 0` otherwise (README 4.3; DLMF 5.2.9). -/
def Complex.lah (n k : ℕ) : ℂ :=
  if k = 0 then (if n = 0 then 1 else 0)
  else if n < k then 0
  else ((n - 1).choose (k - 1) : ℂ) * (n.factorial : ℂ) / (k.factorial : ℂ)

/-- The Maclaurin coefficients `c_k` of `1/Γ` (README 6.2; DLMF 5.7.1). -/
def Complex.invGammaCoeff (k : ℕ) : ℂ :=
  iteratedDeriv k (fun z => (Gamma z)⁻¹) 0 / (k.factorial : ℂ)

/-- The filter `z → ∞` in the closed sector `|ph z| ≤ π − δ` (README 3.5). -/
def sectorFilter (δ : ℝ) : Filter ℂ :=
  Bornology.cobounded ℂ ⊓ 𝓟 {z | |arg z| ≤ π - δ}

/-- Temme's phase `Φ(t) = 1 − t cot t + log(t/sin t)` (README 8.2; DLMF 5.9.2_5), with its
removable value `Φ(0) = 0`. -/
def temmePhi (t : ℝ) : ℝ :=
  if t = 0 then 0 else 1 - t * Real.cot t + Real.log (t / Real.sin t)

/-- `|Δ(t₁, …, tₙ)| = |∏_{j<k} (t_j − t_k)|` (README 10.2), as the modulus of the Vandermonde
determinant. -/
def absVandermonde {n : ℕ} (t : Fin n → ℝ) : ℝ :=
  |(Matrix.vandermonde t).det|

/-! ## Layer 1: poles, partial fractions and the derivatives of `ψ` -/

/-- README 1.1: the residue of `Γ` at `−n`. -/
theorem Complex.tendsto_add_nat_mul_Gamma (n : ℕ) :
    Tendsto (fun z => (z + n) * Gamma z) (𝓝[≠] (-(n : ℂ))) (𝓝 ((-1) ^ n / n.factorial)) := by
  sorry

/-- README 1.1: the residue of `ψ` at `−n`. -/
theorem Complex.tendsto_add_nat_mul_digamma (n : ℕ) :
    Tendsto (fun z => (z + n) * digamma z) (𝓝[≠] (-(n : ℂ))) (𝓝 (-1)) := by
  sorry

/-- README 1.2; DLMF 5.7.6: the paired Gauss series converges absolutely for every `z` (at a
pole the single term `1/(z + k)` is Lean's `0`). -/
theorem Complex.summable_gaussSeries (z : ℂ) :
    Summable (fun k : ℕ => 1 / ((k : ℂ) + 1) - 1 / (z + k)) := by
  sorry

/-- README 1.2; DLMF 5.7.6 for every `z` off the poles. -/
theorem Complex.digamma_eq_gaussSeries {z : ℂ} (hz : ∀ m : ℕ, z ≠ -m) :
    digamma z = -γ + ∑' k : ℕ, (1 / ((k : ℂ) + 1) - 1 / (z + k)) := by
  sorry

/-- README 1.2; DLMF 5.15.1 for every `z` off the poles, with `ψ′` the complex derivative of
`ψ`. -/
theorem Complex.hasSum_deriv_digamma {z : ℂ} (hz : ∀ m : ℕ, z ≠ -m) :
    HasSum (fun k : ℕ => 1 / ((k : ℂ) + z) ^ 2) (deriv digamma z) := by
  sorry

/-- README 1.3: the series of `ψ⁽ⁿ⁾` for `n ≥ 1`. -/
theorem Complex.hasSum_polygamma {n : ℕ} (hn : 1 ≤ n) {z : ℂ} (hz : ∀ m : ℕ, z ≠ -m) :
    HasSum (fun k : ℕ => (-1) ^ (n + 1) * n.factorial / ((k : ℂ) + z) ^ (n + 1))
      (Complex.polygamma n z) := by
  sorry

/-- README 1.4; DLMF 5.15.5. -/
theorem Complex.polygamma_add_one (n : ℕ) {z : ℂ} (hz : ∀ m : ℕ, z ≠ -m) :
    Complex.polygamma n (z + 1) =
      Complex.polygamma n z + (-1) ^ n * n.factorial * (z ^ (n + 1))⁻¹ := by
  sorry

/-- README 1.4; DLMF 5.15.6, with DLMF's `(−1)^{n−1}` written `(−1)^{n+1}`. -/
theorem Complex.polygamma_one_sub (n : ℕ) {z : ℂ} (hz : ∀ m : ℤ, z ≠ m) :
    Complex.polygamma n (1 - z) + (-1) ^ (n + 1) * Complex.polygamma n z =
      (-1) ^ n * π * iteratedDeriv n (fun w => cot (π * w)) z := by
  sorry

/-- README 1.4; DLMF 5.15.7. -/
theorem Complex.polygamma_mul_nat {n m : ℕ} (hn : 1 ≤ n) (hm : 1 ≤ m) {z : ℂ}
    (hz : ∀ j : ℕ, (m : ℂ) * z ≠ -j) :
    Complex.polygamma n (m * z) =
      ((m : ℂ) ^ (n + 1))⁻¹ * ∑ k ∈ range m, Complex.polygamma n (z + k / m) := by
  sorry

/-- README 1.5; DLMF 5.4.15. -/
theorem Complex.digamma_nat_add_half (n : ℕ) :
    digamma (n + 1 / 2) =
      -(γ : ℂ) - 2 * log 2 + 2 * ∑ k ∈ range n, 1 / (2 * (k : ℂ) + 1) := by
  sorry

/-- README 1.5; DLMF 5.15.2–5.15.3. -/
theorem Complex.polygamma_one_and_half {n : ℕ} (hn : 1 ≤ n) :
    Complex.polygamma n 1 = (-1) ^ (n + 1) * n.factorial * riemannZeta (n + 1) ∧
      Complex.polygamma n (1 / 2) =
        (-1) ^ (n + 1) * n.factorial * (2 ^ (n + 1) - 1) * riemannZeta (n + 1) := by
  sorry

/-- README 1.5; DLMF 5.15.4. -/
theorem Complex.polygamma_one_nat_sub_half {n : ℕ} (hn : 1 ≤ n) :
    Complex.polygamma 1 (n - 1 / 2) =
      π ^ 2 / 2 - 4 * ∑ k ∈ Icc 1 (n - 1), 1 / (2 * (k : ℂ) - 1) ^ 2 := by
  sorry

/-! ## Layer 2: the Beta integral on real paths and in several variables -/

/-- README 2.1; DLMF 5.12.2. -/
theorem Complex.integral_sin_cpow_mul_cos_cpow {a b : ℂ} (ha : 0 < a.re) (hb : 0 < b.re) :
    ∫ θ in (0 : ℝ)..(π / 2), (Real.sin θ : ℂ) ^ (2 * a - 1) * (Real.cos θ : ℂ) ^ (2 * b - 1) =
      1 / 2 * (Gamma a * Gamma b / Gamma (a + b)) := by
  sorry

/-- README 2.1; DLMF 5.12.4. -/
theorem Complex.integral_beta_div_add_cpow {a b z : ℂ} (ha : 0 < a.re) (hb : 0 < b.re)
    (hz : z ∈ slitPlane) :
    ∫ t in (0 : ℝ)..1, (t : ℂ) ^ (a - 1) * (1 - (t : ℂ)) ^ (b - 1) / ((t : ℂ) + z) ^ (a + b) =
      Gamma a * Gamma b / Gamma (a + b) * (1 + z) ^ (-a) * z ^ (-b) := by
  sorry

/-- README 2.1; DLMF 5.12.5, in reciprocal-Gamma form, for every `b`. -/
theorem Complex.integral_cos_cpow_mul_cos {a : ℂ} (ha : 0 < a.re) (b : ℂ) :
    ∫ t in (0 : ℝ)..(π / 2), (Real.cos t : ℂ) ^ (a - 1) * cos (b * t) =
      π * Gamma a * (2 : ℂ) ^ (-a) *
        (Gamma ((a + b + 1) / 2))⁻¹ * (Gamma ((a - b + 1) / 2))⁻¹ := by
  sorry

/-- README 2.1; DLMF 5.12.6, in reciprocal-Gamma form, for every `b`. -/
theorem Complex.integral_sin_cpow_mul_exp {a : ℂ} (ha : 0 < a.re) (b : ℂ) :
    ∫ t in (0 : ℝ)..π, (Real.sin t : ℂ) ^ (a - 1) * exp (I * b * t) =
      π * exp (I * π * b / 2) * Gamma a * (2 : ℂ) ^ (1 - a) *
        (Gamma ((a + b + 1) / 2))⁻¹ * (Gamma ((a - b + 1) / 2))⁻¹ := by
  sorry

/-- README 2.1; DLMF 5.12.7. -/
theorem Complex.integral_cosh_div_cosh_cpow {a b : ℂ} (hab : |b.re| < a.re) :
    ∫ t in Ioi (0 : ℝ), cosh (2 * b * t) / (Real.cosh t : ℂ) ^ (2 * a) =
      (4 : ℂ) ^ (a - 1) * (Gamma (a + b) * Gamma (a - b) / Gamma (2 * a)) := by
  sorry

/-- README 2.2; DLMF 5.14.2 (and 5.14.1 with `z (Fin.last n) = 1`). -/
theorem TauCeti.integral_simplex_dirichlet {n : ℕ} (z : Fin (n + 1) → ℂ) (hz : ∀ i, 0 < (z i).re) :
    ∫ t in {t : Fin n → ℝ | (∀ i, 0 ≤ t i) ∧ ∑ i, t i ≤ 1},
        (1 - ∑ i, (t i : ℂ)) ^ (z (Fin.last n) - 1) * ∏ i : Fin n, (t i : ℂ) ^ (z i.castSucc - 1) =
      (∏ i, Gamma (z i)) / Gamma (∑ i, z i) := by
  sorry

/-- README 2.3: Liouville's integral over a power simplex. -/
theorem TauCeti.integral_power_simplex {n : ℕ} (a p : Fin n → ℝ) (ha : ∀ k, 0 < a k)
    (hp : ∀ k, 0 < p k) (α : Fin n → ℂ) (hα : ∀ k, 0 < (α k).re) :
    IntegrableOn (fun x : Fin n → ℝ => ∏ k, (x k : ℂ) ^ (α k - 1))
        {x | (∀ k, 0 < x k) ∧ ∑ k, (x k / a k) ^ p k ≤ 1} ∧
      ∫ x in {x : Fin n → ℝ | (∀ k, 0 < x k) ∧ ∑ k, (x k / a k) ^ p k ≤ 1},
          ∏ k, (x k : ℂ) ^ (α k - 1) =
        (∏ k, (a k : ℂ) ^ α k * Gamma (α k / p k) / p k) / Gamma (1 + ∑ k, α k / p k) := by
  sorry

/-! ## Layer 3: transforms of Euler's integral -/

/-- README 3.1; DLMF 5.9.1. -/
theorem Complex.integral_exp_neg_mul_rpow {μ : ℝ} (hμ : 0 < μ) {ν z : ℂ} (hν : 0 < ν.re)
    (hz : 0 < z.re) :
    ∫ t in Ioi (0 : ℝ), exp (-z * (t : ℂ) ^ (μ : ℂ)) * (t : ℂ) ^ (ν - 1) =
      1 / μ * Gamma (ν / μ) * z ^ (-(ν / μ)) := by
  sorry

/-- README 3.1; DLMF 5.9.3. -/
theorem Complex.integral_abs_cpow_mul_exp_neg_sq {c : ℝ} (hc : 0 < c) {z : ℂ} (hz : 0 < z.re) :
    ∫ t : ℝ, ((|t| : ℝ) : ℂ) ^ (2 * z - 1) * Real.exp (-c * t ^ 2) = (c : ℂ) ^ (-z) * Gamma z := by
  sorry

/-- README 3.1; DLMF 5.9.4, Prym's decomposition. -/
theorem Complex.Gamma_eq_integral_Ioi_one_add_tsum {z : ℂ} (hz : ∀ m : ℕ, z ≠ -m) :
    Gamma z =
      (∫ t in Ioi (1 : ℝ), (t : ℂ) ^ (z - 1) * Real.exp (-t)) +
        ∑' k : ℕ, (-1) ^ k / ((z + k) * k.factorial) := by
  sorry

/-- README 3.1; DLMF 5.9.5, the Cauchy–Saalschütz integral. -/
theorem Complex.Gamma_eq_integral_exp_sub_taylor {n : ℕ} {z : ℂ} (hlo : -((n : ℝ) + 1) < z.re)
    (hhi : z.re < -n) :
    Gamma z =
      ∫ t in Ioi (0 : ℝ), (t : ℂ) ^ (z - 1) *
        (Real.exp (-t) - ∑ k ∈ range (n + 1), ((-t) ^ k / k.factorial : ℝ)) := by
  sorry

/-- README 3.2; DLMF 5.9.6. -/
theorem Complex.tendsto_integral_cpow_mul_cos {z : ℂ} (h₀ : 0 < z.re) (h₁ : z.re < 1) :
    Tendsto (fun R : ℝ => ∫ t in (0 : ℝ)..R, (t : ℂ) ^ (z - 1) * Real.cos t) atTop
      (𝓝 (Gamma z * cos (π * z / 2))) := by
  sorry

/-- README 3.2; DLMF 5.9.7, with the removable singularity at `z = 0` written out. -/
theorem Complex.tendsto_integral_cpow_mul_sin {z : ℂ} (h₀ : -1 < z.re) (h₁ : z.re < 1) :
    Tendsto (fun R : ℝ => ∫ t in (0 : ℝ)..R, (t : ℂ) ^ (z - 1) * Real.sin t) atTop
      (𝓝 (π / (2 * Gamma (1 - z) * cos (π * z / 2)))) := by
  sorry

/-- README 3.2; DLMF 5.9.8–5.9.9. -/
theorem Complex.tendsto_integral_cos_pow_sin_pow {n : ℕ} (hn : 2 ≤ n) :
    Tendsto (fun R : ℝ => ∫ t in (0 : ℝ)..R, Real.cos (t ^ n)) atTop
        (𝓝 (Real.Gamma (1 + 1 / n) * Real.cos (π / (2 * n)))) ∧
      Tendsto (fun R : ℝ => ∫ t in (0 : ℝ)..R, Real.sin (t ^ n)) atTop
        (𝓝 (Real.Gamma (1 + 1 / n) * Real.sin (π / (2 * n)))) := by
  sorry

/-- README 3.3; DLMF 5.9.13. -/
theorem Complex.digamma_eq_log_add_integral {z : ℂ} (hz : 0 < z.re) :
    digamma z = log z + ∫ t in Ioi (0 : ℝ), ((1 / t - 1 / (1 - Real.exp (-t)) : ℝ) : ℂ) *
      exp (-t * z) := by
  sorry

/-- README 3.3; DLMF 5.9.14, Dirichlet's integral. -/
theorem Complex.digamma_eq_integral_one_add {z : ℂ} (hz : 0 < z.re) :
    digamma z = ∫ t in Ioi (0 : ℝ), (Real.exp (-t) - (1 + t : ℂ) ^ (-z)) / t := by
  sorry

/-- README 3.3; DLMF 5.9.15. -/
theorem Complex.digamma_eq_log_sub_integral {z : ℂ} (hz : 0 < z.re) :
    digamma z = log z - 1 / (2 * z) -
      2 * ∫ t in Ioi (0 : ℝ), t / ((t ^ 2 + z ^ 2) * (Real.exp (2 * π * t) - 1)) := by
  sorry

/-- README 3.3; DLMF 5.9.16. -/
theorem Complex.digamma_add_eulerMascheroni {z : ℂ} (hz : 0 < z.re) :
    digamma z + γ = (∫ t in Ioi (0 : ℝ), (Real.exp (-t) - exp (-z * t)) / (1 - Real.exp (-t))) ∧
      digamma z + γ = ∫ t in (0 : ℝ)..1, (1 - (t : ℂ) ^ (z - 1)) / (1 - t) := by
  sorry

/-- README 3.3; DLMF 5.9.18, the three integrals that Mathlib does not have (the first is
`Real.eulerMascheroniConstant_eq_neg_integral_log`). -/
theorem Real.eulerMascheroni_eq_integrals :
    γ = ∫ t in Ioi (0 : ℝ), (1 / (1 + t) - Real.exp (-t)) / t ∧
      γ = (∫ t in (0 : ℝ)..1, (1 - Real.exp (-t)) / t) - ∫ t in Ioi (1 : ℝ), Real.exp (-t) / t ∧
      γ = ∫ t in Ioi (0 : ℝ), (Real.exp (-t) / (1 - Real.exp (-t)) - Real.exp (-t) / t) := by
  sorry

/-- README 3.4; DLMF 5.9.19. -/
theorem Complex.iteratedDeriv_Gamma_eq_integral (n : ℕ) {z : ℂ} (hz : 0 < z.re) :
    iteratedDeriv n Gamma z =
      ∫ t in Ioi (0 : ℝ), (Real.log t : ℂ) ^ n * Real.exp (-t) * (t : ℂ) ^ (z - 1) := by
  sorry

/-- README 3.4; DLMF 5.9.20, with `∫_c^z` along the segment. -/
theorem Complex.integral_segment_Gamma {c z : ℂ} (hc : 0 < c.re) (hz : 0 < z.re) :
    ∫ s in (0 : ℝ)..1, Gamma (c + s * (z - c)) * (z - c) =
      ∫ t in Ioi (0 : ℝ), ((t : ℂ) ^ (z - 1) - (t : ℂ) ^ (c - 1)) / Real.log t * Real.exp (-t) := by
  sorry

/-- README 3.5; DLMF 5.15.8–5.15.9: the asymptotic expansion in `|ph z| ≤ π − δ`,
truncated after `k = N`. -/
theorem Complex.isBigO_polygamma_sub_partialSum {n : ℕ} (hn : 1 ≤ n) {δ : ℝ} (hδ₀ : 0 < δ)
    (hδ₁ : δ < π) (N : ℕ) :
    (fun z => Complex.polygamma n z - (-1) ^ (n + 1) *
        ((n - 1).factorial / z ^ n + n.factorial / (2 * z ^ (n + 1)) +
          ∑ k ∈ Icc 1 N, ((2 * k + n - 1).factorial / (2 * k).factorial : ℂ) *
            bernoulli (2 * k) / z ^ (2 * k + n))) =O[sectorFilter δ]
      fun z => (z ^ (2 * N + n + 2))⁻¹ := by
  sorry

/-! ## Layer 4: uniqueness, multiplication and closed-form values -/

/-- README 4.1, Wielandt's theorem. -/
theorem Complex.eq_mul_Gamma_of_isBounded {F : ℂ → ℂ} (hF : DifferentiableOn ℂ F {z | 0 < z.re})
    (hrec : ∀ z : ℂ, 0 < z.re → F (z + 1) = z * F z)
    (hb : Bornology.IsBounded (F '' {z | 1 ≤ z.re ∧ z.re < 2})) {z : ℂ} (hz : 0 < z.re) :
    F z = F 1 * Gamma z := by
  sorry

/-- README 4.1, the limit characterization of `Γ`. -/
theorem Real.eq_Gamma_of_tendsto_ratio {f : ℝ → ℝ} (h₁ : f 1 = 1)
    (hrec : ∀ x : ℝ, 0 < x → f (x + 1) = x * f x)
    (hlim : ∀ x : ℝ, 0 < x →
      Tendsto (fun n : ℕ => f (x + n) / ((n : ℝ) ^ x * f n)) atTop (𝓝 1))
    {x : ℝ} (hx : 0 < x) :
    f x = Real.Gamma x := by
  sorry

/-- README 4.2; DLMF 5.5.6, Gauss's multiplication formula, for every `z`. -/
theorem Complex.prod_Gamma_add_div {n : ℕ} (hn : 0 < n) (z : ℂ) :
    ∏ k ∈ range n, Gamma (z + k / n) =
      (2 * π : ℂ) ^ (((n : ℂ) - 1) / 2) * (n : ℂ) ^ (1 / 2 - n * z) * Gamma (n * z) := by
  sorry

/-- README 4.2; DLMF 5.5.9. -/
theorem Complex.digamma_mul_nat {n : ℕ} (hn : 0 < n) {z : ℂ} (hz : ∀ m : ℕ, (n : ℂ) * z ≠ -m) :
    digamma (n * z) = (1 / n) * ∑ k ∈ range n, digamma (z + k / n) + log n := by
  sorry

/-- README 4.3; DLMF 5.2.8. -/
theorem ascPochhammer_two_mul_eval (a : ℂ) (n : ℕ) :
    (ascPochhammer ℂ (2 * n)).eval a =
        2 ^ (2 * n) * (ascPochhammer ℂ n).eval (a / 2) * (ascPochhammer ℂ n).eval ((a + 1) / 2) ∧
      (ascPochhammer ℂ (2 * n + 1)).eval a =
        2 ^ (2 * n + 1) * (ascPochhammer ℂ (n + 1)).eval (a / 2) *
          (ascPochhammer ℂ n).eval ((a + 1) / 2) := by
  sorry

/-- README 4.3; DLMF 5.2.9, first expansion. -/
theorem ascPochhammer_eval_eq_sum_lah (x : ℂ) (n : ℕ) :
    (ascPochhammer ℂ n).eval x =
      ∑ k ∈ range (n + 1), Complex.lah n k * (descPochhammer ℂ k).eval x := by
  sorry

/-- README 4.3; DLMF 5.2.9, second expansion. -/
theorem descPochhammer_eval_eq_sum_lah (x : ℂ) (n : ℕ) :
    (descPochhammer ℂ n).eval x =
      ∑ k ∈ range (n + 1), (-1) ^ (n - k) * Complex.lah n k * (ascPochhammer ℂ k).eval x := by
  sorry

/-- README 4.4; DLMF 5.4.4. -/
theorem Complex.Gamma_half_add_mul_I (y : ℝ) :
    Gamma (1 / 2 + I * y) * Gamma (1 / 2 - I * y) = ((‖Gamma (1 / 2 + I * y)‖ ^ 2 : ℝ) : ℂ) ∧
      ‖Gamma (1 / 2 + I * y)‖ ^ 2 = π / Real.cosh (π * y) := by
  sorry

/-- README 4.4; DLMF 5.4.5. -/
theorem Complex.Gamma_quarter_add_mul_I (y : ℝ) :
    Gamma (1 / 4 + I * y) * Gamma (3 / 4 - I * y) =
      (π * Real.sqrt 2 : ℝ) / ((Real.cosh (π * y) : ℂ) + I * Real.sinh (π * y)) := by
  sorry

/-- README 4.4; DLMF 5.4.16. -/
theorem Complex.im_digamma_mul_I {y : ℝ} (hy : y ≠ 0) :
    (digamma (I * y)).im = 1 / (2 * y) + π / 2 * (Real.cosh (π * y) / Real.sinh (π * y)) := by
  sorry

/-- README 4.4; DLMF 5.4.17. -/
theorem Complex.im_digamma_half_add_mul_I (y : ℝ) :
    (digamma (1 / 2 + I * y)).im = π / 2 * Real.tanh (π * y) := by
  sorry

/-- README 4.4; DLMF 5.4.18. -/
theorem Complex.im_digamma_one_add_mul_I {y : ℝ} (hy : y ≠ 0) :
    (digamma (1 + I * y)).im = -1 / (2 * y) + π / 2 * (Real.cosh (π * y) / Real.sinh (π * y)) := by
  sorry

/-- README 4.5; DLMF 5.4.19, Gauss's digamma theorem. -/
theorem Complex.digamma_rat {p q : ℕ} (hp : 0 < p) (hpq : p < q) :
    digamma ((p : ℂ) / q) =
      ((-γ - Real.log q - π / 2 * Real.cot (π * p / q) +
        1 / 2 * ∑ k ∈ Icc 1 (q - 1),
          Real.cos (2 * π * k * p / q) * Real.log (2 - 2 * Real.cos (2 * π * k / q)) : ℝ) : ℂ) := by
  sorry

/-- README 4.6, Kummer's Fourier series, as a limit of partial sums. -/
theorem Real.tendsto_sum_log_Gamma_sine {x : ℝ} (h₀ : 0 < x) (h₁ : x < 1) :
    Tendsto (fun N : ℕ => ∑ k ∈ Icc 1 N, Real.log k / k * Real.sin (2 * π * k * x)) atTop
      (𝓝 (π * (Real.log (Real.Gamma x) - Real.log (2 * π) / 2 +
        Real.log (2 * Real.sin (π * x)) / 2 - (γ + Real.log (2 * π)) * (1 / 2 - x)))) := by
  sorry

/-! ## Layer 5: series summed by `ψ`, and balanced products -/

/-- README 5.1, series of rational functions. -/
theorem Complex.hasSum_sum_div_sub {m : ℕ} (a A : Fin m → ℂ) (hA : ∑ k, A k = 0)
    (ha : ∀ k, ∀ n : ℕ, a k ≠ n) :
    HasSum (fun n : ℕ => ∑ k, A k / (n - a k)) (-∑ k, A k * digamma (-a k)) := by
  sorry

/-- README 5.2; DLMF 5.7.7, a conditionally convergent series. -/
theorem Complex.tendsto_digamma_half_sub {z : ℂ} (hz : ∀ m : ℕ, z ≠ -m) :
    Tendsto (fun N : ℕ => 2 * ∑ k ∈ range N, (-1) ^ k / (k + z)) atTop
      (𝓝 (digamma ((z + 1) / 2) - digamma (z / 2))) := by
  sorry

/-- README 5.2; DLMF 5.7.8. -/
theorem Complex.im_digamma_one_add_mul_I_eq_tsum (y : ℝ) :
    HasSum (fun k : ℕ => y / (((k : ℝ) + 1) ^ 2 + y ^ 2)) (digamma (1 + I * y)).im := by
  sorry

/-- README 5.3; DLMF 5.16.1, a conditionally convergent series. -/
theorem Complex.tendsto_sum_neg_one_pow_polygamma_one :
    Tendsto (fun N : ℕ => ∑ k ∈ Icc 1 N, (-1) ^ k * Complex.polygamma 1 k) atTop
      (𝓝 (-π ^ 2 / 8)) := by
  sorry

/-- README 5.3; DLMF 5.16.2. -/
theorem Complex.hasSum_polygamma_one_div :
    HasSum (fun k : ℕ => Complex.polygamma 1 (k + 2) / (k + 1)) (riemannZeta 3) := by
  sorry

/-- README 5.4; DLMF 5.8.4–5.8.5, balanced products. -/
theorem Complex.hasProd_balanced {m : ℕ} (a b : Fin m → ℂ) (hab : ∑ k, a k = ∑ k, b k)
    (hb : ∀ k, ∀ j : ℕ, b k ≠ -j) :
    HasProd (fun j : ℕ => ∏ k, (a k + j) / (b k + j))
      ((∏ k, Gamma (b k)) * (∏ k, Gamma (a k))⁻¹) := by
  sorry

/-! ## Layer 6: Taylor expansions at the origin -/

/-- README 6.1; DLMF 5.7.3 on `|z| < 2`, exponentiated. -/
theorem Complex.Gamma_one_add_eq_exp {z : ℂ} (hz : ‖z‖ < 2) (hz₁ : z ≠ -1) :
    Gamma (1 + z) =
      (1 + z)⁻¹ * exp (z * (1 - γ) +
        ∑' k : ℕ, (-1) ^ k * (riemannZeta (k + 2) - 1) * z ^ (k + 2) / (k + 2)) := by
  sorry

/-- README 6.1; DLMF 5.7.4. -/
theorem Complex.digamma_one_add_eq_tsum {z : ℂ} (hz : ‖z‖ < 1) :
    digamma (1 + z) = -γ + ∑' k : ℕ, (-1) ^ k * riemannZeta (k + 2) * z ^ (k + 1) := by
  sorry

/-- README 6.1; DLMF 5.7.5 on `|z| < 2`. -/
theorem Complex.digamma_one_add_eq_tsum_odd {z : ℂ} (hz : ‖z‖ < 2) (hz₀ : z ≠ 0) (hz₁ : z ≠ 1)
    (hz₂ : z ≠ -1) :
    digamma (1 + z) =
      1 / (2 * z) - π / 2 * cot (π * z) + 1 / (z ^ 2 - 1) + 1 - γ -
        ∑' k : ℕ, (riemannZeta (2 * k + 3) - 1) * z ^ (2 * k + 2) := by
  sorry

/-- README 6.2; DLMF 5.7.2. -/
theorem Complex.invGammaCoeff_recurrence {k : ℕ} (hk : 3 ≤ k) :
    ((k : ℂ) - 1) * Complex.invGammaCoeff k =
      γ * Complex.invGammaCoeff (k - 1) +
        ∑ j ∈ Icc 2 (k - 1), (-1) ^ (j + 1) * riemannZeta j * Complex.invGammaCoeff (k - j) := by
  sorry

/-! ## Layer 7: convexity and inequalities -/

/-- README 7.1; DLMF 5.6.2. -/
theorem Real.inv_Gamma_add_inv_Gamma_inv_le_two {x : ℝ} (hx : 0 < x) :
    1 / Real.Gamma x + 1 / Real.Gamma x⁻¹ ≤ 2 := by
  sorry

/-- README 7.1; DLMF 5.6.3. -/
theorem Real.inv_Gamma_sq_add_inv_Gamma_inv_sq_le_two {x : ℝ} (hx : 0 < x) :
    (1 / Real.Gamma x) ^ 2 + (1 / Real.Gamma x⁻¹) ^ 2 ≤ 2 := by
  sorry

/-- README 7.2; DLMF 5.6.4, Gautschi's inequality. -/
theorem Real.gautschi {x s : ℝ} (hx : 0 < x) (hs₀ : 0 < s) (hs₁ : s < 1) :
    x ^ (1 - s) < Real.Gamma (x + 1) / Real.Gamma (x + s) ∧
      Real.Gamma (x + 1) / Real.Gamma (x + s) < (x + 1) ^ (1 - s) := by
  sorry

/-- README 7.2; DLMF 5.6.5, Kershaw's inequality. -/
theorem Real.kershaw {x s : ℝ} (hx : 0 < x) (hs₀ : 0 < s) (hs₁ : s < 1) :
    Real.exp ((1 - s) * (digamma (x + Real.sqrt s : ℝ)).re) ≤
        Real.Gamma (x + 1) / Real.Gamma (x + s) ∧
      Real.Gamma (x + 1) / Real.Gamma (x + s) ≤
        Real.exp ((1 - s) * (digamma (x + (s + 1) / 2 : ℝ)).re) := by
  sorry

/-- README 7.3; DLMF 5.6.6 for every real `x` off the poles. -/
theorem Complex.norm_Gamma_add_mul_I_le {x : ℝ} (hx : ∀ m : ℕ, x ≠ -m) (y : ℝ) :
    ‖Gamma (x + I * y)‖ ≤ |Real.Gamma x| := by
  sorry

/-- README 7.3; DLMF 5.6.7. -/
theorem Complex.norm_Gamma_add_mul_I_ge {x : ℝ} (hx : 1 / 2 ≤ x) (y : ℝ) :
    Real.sqrt (1 / Real.cosh (π * y)) * Real.Gamma x ≤ ‖Gamma (x + I * y)‖ := by
  sorry

/-- README 7.4; DLMF 5.6.8. -/
theorem Complex.norm_Gamma_add_div_Gamma_add_le {a b : ℝ} (ha : 0 ≤ a) (hab : 1 ≤ b - a) {z : ℂ}
    (hz : 0 < z.re) :
    ‖Gamma (z + a) / Gamma (z + b)‖ ≤ ‖z‖ ^ (a - b) := by
  sorry

/-! ## Layer 8: loop contours -/

/-- README 8.1; DLMF 5.9.2, Hankel's loop integral, with the contour pinned. -/
theorem Complex.inv_Gamma_eq_hankel (z : ℂ) {ε : ℝ} (hε : 0 < ε) :
    (Gamma z)⁻¹ =
      sin (π * z) / π * ∫ r in Ioi ε, exp (-(r : ℂ)) * (r : ℂ) ^ (-z) +
        (ε : ℂ) ^ (1 - z) / (2 * π) *
          ∫ θ in -π..π, exp (ε * exp (θ * I) + I * (1 - z) * θ) := by
  sorry

/-- README 8.2; DLMF 5.9.2_5, Temme's integral. -/
theorem Complex.inv_Gamma_eq_temme {z : ℂ} (hz : 0 < z.re) :
    (Gamma z)⁻¹ = exp z * z ^ (1 - z) / (2 * π) * ∫ t in -π..π, exp (-z * temmePhi t) := by
  sorry

/-- README 8.3; DLMF 5.12.10, with the loop around `1` pinned. -/
theorem Complex.beta_loop_one {a : ℂ} (ha : 0 < a.re) (b : ℂ) {ε : ℝ} (hε₀ : 0 < ε) (hε₁ : ε < 1) :
    (2 * π * I)⁻¹ *
        ((exp (-I * π * (b - 1)) - exp (I * π * (b - 1))) *
            ∫ t in (0 : ℝ)..(1 - ε), (t : ℂ) ^ (a - 1) * (1 - (t : ℂ)) ^ (b - 1) +
          I * (ε : ℂ) ^ b * ∫ θ in -π..π, (1 + ε * exp (θ * I)) ^ (a - 1) * exp (I * b * θ)) =
      Gamma a * (Gamma (a + b))⁻¹ * (Gamma (1 - b))⁻¹ := by
  sorry

/-- README 8.3; DLMF 5.12.11, with the loop around `0` pinned and multiplied out by
`e^{2πia} − 1`. -/
theorem Complex.beta_loop_zero {a b : ℂ} (hb : 0 < b.re) (ha : ∀ m : ℕ, a ≠ -m) {ε : ℝ}
    (hε₀ : 0 < ε) (hε₁ : ε < 1) :
    (exp (2 * π * I * a) - 1) * ∫ t in Ioi ε, (t : ℂ) ^ (a - 1) * (1 + (t : ℂ)) ^ (-a - b) +
        I * (ε : ℂ) ^ a *
          ∫ θ in (0 : ℝ)..(2 * π), exp (I * a * θ) * (1 + ε * exp (θ * I)) ^ (-a - b) =
      (exp (2 * π * I * a) - 1) * (Gamma a * Gamma b / Gamma (a + b)) := by
  sorry

/-- README 8.3; DLMF 5.12.12, the Pochhammer contour, pinned. -/
theorem Complex.beta_pochhammer (a b : ℂ) {ε : ℝ} (hε₀ : 0 < ε) (hε₁ : ε < 1 / 2) :
    (1 - exp (2 * π * I * a)) * (1 - exp (2 * π * I * b)) *
          (∫ t in ε..(1 - ε), (t : ℂ) ^ (a - 1) * (1 - (t : ℂ)) ^ (b - 1)) +
        (1 - exp (2 * π * I * a)) *
          (-I * (ε : ℂ) ^ b *
            ∫ φ in (0 : ℝ)..(2 * π), (1 - ε * exp (φ * I)) ^ (a - 1) * exp (I * b * φ)) -
        (1 - exp (2 * π * I * b)) *
          (I * (ε : ℂ) ^ a *
            ∫ θ in (0 : ℝ)..(2 * π), exp (I * a * θ) * (1 - ε * exp (θ * I)) ^ (b - 1)) =
      -4 * π ^ 2 * exp (π * I * (a + b)) *
        (Gamma (1 - a))⁻¹ * (Gamma (1 - b))⁻¹ * (Gamma (a + b))⁻¹ := by
  sorry

/-! ## Layer 9: integrals along vertical lines and along the real line -/

/-- README 9.1; DLMF 5.12.8. -/
theorem Complex.integral_vertical_beta {a b w z : ℂ} (hw : 0 < w.re) (hz : 0 < z.re)
    (hab : 1 < (a + b).re) :
    1 / (2 * π) * ∫ t : ℝ, (w + I * t) ^ (-a) * (z - I * t) ^ (-b) =
      Gamma (a + b - 1) * (w + z) ^ (1 - a - b) * (Gamma a)⁻¹ * (Gamma b)⁻¹ := by
  sorry

/-- README 9.1; DLMF 5.12.9. -/
theorem Complex.integral_vertical_beta_one_sub {a b : ℂ} {c : ℝ} (hc₀ : 0 < c) (hc₁ : c < 1)
    (hab : 0 < (a + b).re) :
    1 / (2 * π) * ∫ y : ℝ, (c + I * y) ^ (-a) * (1 - c - I * y) ^ (-1 - b) =
      Gamma (a + b) * (Gamma a)⁻¹ * (Gamma (1 + b))⁻¹ := by
  sorry

/-- README 9.2; DLMF 5.13.1. -/
theorem Complex.integral_Gamma_mul_Gamma_mul_cpow {a b z : ℂ} {c : ℝ} (hab : 0 < (a + b).re)
    (hca : -a.re < c) (hcb : c < b.re) (hz : z ∈ slitPlane) :
    1 / (2 * π) * ∫ y : ℝ, Gamma (c + I * y + a) * Gamma (b - c - I * y) * z ^ (-(c + I * y)) =
      Gamma (a + b) * z ^ a * (1 + z) ^ (-a - b) := by
  sorry

/-- README 9.2; DLMF 5.13.2. -/
theorem Complex.integral_norm_Gamma_sq_mul_exp {a b : ℝ} (ha : 0 < a) (hb₀ : 0 < b) (hb₁ : b < π) :
    1 / (2 * π) * ∫ t : ℝ, ‖Gamma (a + I * t)‖ ^ 2 * Real.exp ((2 * b - π) * t) =
      Real.Gamma (2 * a) / (2 * Real.sin b) ^ (2 * a) := by
  sorry

/-- README 9.3; DLMF 5.13.4, Ramanujan's integral. -/
theorem Complex.integral_inv_Gamma_four {a b c d : ℂ} (h : 3 < (a + b + c + d).re) :
    ∫ t : ℝ, (Gamma (a + t))⁻¹ * (Gamma (b + t))⁻¹ * (Gamma (c - t))⁻¹ * (Gamma (d - t))⁻¹ =
      Gamma (a + b + c + d - 3) * (Gamma (a + c - 1))⁻¹ * (Gamma (a + d - 1))⁻¹ *
        (Gamma (b + c - 1))⁻¹ * (Gamma (b + d - 1))⁻¹ := by
  sorry

/-- README 9.4; DLMF 5.13.5, the de Branges–Wilson integral. -/
theorem Complex.integral_deBrangesWilson {a : Fin 4 → ℂ} (ha : ∀ k, 0 < (a k).re) :
    1 / (4 * π) * ∫ t : ℝ,
        (∏ k, Gamma (a k + I * t) * Gamma (a k - I * t)) *
          (Gamma (2 * I * t))⁻¹ * (Gamma (-2 * I * t))⁻¹ =
      (∏ j, ∏ k, if j < k then Gamma (a j + a k) else 1) * (Gamma (∑ k, a k))⁻¹ := by
  sorry

/-! ## Layer 10: Selberg-type integrals -/

/-- README 10.1, Carlson's theorem (auxiliary). -/
theorem Complex.eq_zero_of_carlson {f : ℂ → ℂ} (hd : DifferentiableOn ℂ f {z | 0 < z.re})
    (hc : ContinuousOn f {z | 0 ≤ z.re})
    (hexp : ∃ τ C : ℝ, ∀ z : ℂ, 0 ≤ z.re → ‖f z‖ ≤ C * Real.exp (τ * ‖z‖))
    (him : ∃ c < π, ∃ C : ℝ, ∀ y : ℝ, ‖f (I * y)‖ ≤ C * Real.exp (c * |y|))
    (hzero : ∀ n : ℕ, f n = 0) {z : ℂ} (hz : 0 ≤ z.re) :
    f z = 0 := by
  sorry

/-- README 10.2; DLMF 5.14.4: Selberg's integral (`m = 0`) and Aomoto's extension, on the
full parameter range `Re c > −min(1/n, Re a/(n − 1), Re b/(n − 1))`. -/
theorem TauCeti.integral_selberg_aomoto {n m : ℕ} (hn : 1 ≤ n) (hm : m ≤ n) {a b c : ℂ}
    (ha : 0 < a.re) (hb : 0 < b.re) (hc : 0 < 1 + n * c.re) (hca : 0 < a.re + (n - 1 : ℕ) * c.re)
    (hcb : 0 < b.re + (n - 1 : ℕ) * c.re) :
    ∫ t in Set.pi univ fun _ : Fin n => Icc (0 : ℝ) 1,
        (∏ i : Fin m, (t (Fin.castLE hm i) : ℂ)) * (absVandermonde t : ℂ) ^ (2 * c) *
          ∏ k, (t k : ℂ) ^ (a - 1) * (1 - (t k : ℂ)) ^ (b - 1) =
      ((Gamma (1 + c)) ^ n)⁻¹ *
        (∏ k ∈ Icc 1 m, (a + ((n : ℂ) - k) * c) / (a + b + (2 * (n : ℂ) - k - 1) * c)) *
        ∏ k ∈ Icc 1 n, Gamma (a + ((n : ℂ) - k) * c) * Gamma (b + ((n : ℂ) - k) * c) *
          Gamma (1 + k * c) / Gamma (a + b + (2 * (n : ℂ) - k - 1) * c) := by
  sorry

/-- README 10.3; DLMF 5.14.5, the Laguerre limit. -/
theorem TauCeti.integral_selberg_laguerre {n m : ℕ} (hn : 1 ≤ n) (hm : m ≤ n) {a c : ℂ}
    (ha : 0 < a.re) (hc : 0 < 1 + n * c.re) (hca : 0 < a.re + (n - 1 : ℕ) * c.re) :
    ∫ t in Set.pi univ fun _ : Fin n => Ioi (0 : ℝ),
        (∏ i : Fin m, (t (Fin.castLE hm i) : ℂ)) * (absVandermonde t : ℂ) ^ (2 * c) *
          ∏ k, (t k : ℂ) ^ (a - 1) * Real.exp (-t k) =
      (∏ k ∈ Icc 1 m, (a + ((n : ℂ) - k) * c)) *
        (∏ k ∈ Icc 1 n, Gamma (a + ((n : ℂ) - k) * c) * Gamma (1 + k * c)) *
        ((Gamma (1 + c)) ^ n)⁻¹ := by
  sorry

/-- README 10.3; DLMF 5.14.6, Mehta's integral. -/
theorem TauCeti.integral_selberg_hermite {n : ℕ} (hn : 1 ≤ n) {c : ℂ} (hc : 0 < 1 + n * c.re) :
    (2 * π : ℂ) ^ (-(n : ℂ) / 2) *
        ∫ t : Fin n → ℝ, (absVandermonde t : ℂ) ^ (2 * c) * ∏ k, Real.exp (-(t k) ^ 2 / 2) =
      (∏ k ∈ Icc 1 n, Gamma (1 + k * c)) * ((Gamma (1 + c)) ^ n)⁻¹ := by
  sorry

/-- README 10.4; DLMF 5.14.7, Dyson's integral. -/
theorem TauCeti.integral_dyson {n : ℕ} (hn : 1 ≤ n) {b : ℂ} (hb : 0 < 1 + n * b.re) :
    (2 * π : ℂ) ^ (-(n : ℂ)) *
        ∫ θ in Set.pi univ fun _ : Fin n => Icc (-π) π,
          ∏ j, ∏ k, (if j < k then
            ((‖exp (θ j * I) - exp (θ k * I)‖ : ℝ) : ℂ) ^ (2 * b) else 1) =
      Gamma (1 + b * n) * ((Gamma (1 + b)) ^ n)⁻¹ := by
  sorry

-- Library declarations cited in the README
#check @AnalyticOnNhd.eqOn_of_preconnected_of_eventuallyEq
#check @ascPochhammer
#check @ascPochhammer_eval_neg_eq_descPochhammer
#check @ascPochhammer_eval_neg_natCast_of_lt
#check @bernoulli
#check @Complex.betaIntegral
#check @Complex.cot
#check @Complex.cpow
#check @Complex.differentiable_one_div_Gamma
#check @Complex.differentiableAt_Gamma
#check @Complex.digamma
#check @Complex.digamma_apply_add_nat
#check @Complex.digamma_apply_add_one
#check @Complex.digamma_def
#check @Complex.digamma_nat_add_one
#check @Complex.digamma_one
#check @Complex.digamma_one_half
#check @Complex.digamma_one_sub
#check @Complex.digamma_two_mul
#check @Complex.Gamma
#check @Complex.Gamma_add_nat_div_Gamma_eq
#check @Complex.Gamma_add_one
#check @Complex.Gamma_conj
#check @Complex.Gamma_eq_integral
#check @Complex.Gamma_mul_Gamma_add_half
#check @Complex.Gamma_mul_Gamma_eq_betaIntegral
#check @Complex.Gamma_mul_Gamma_one_sub
#check @Complex.Gamma_nat_eq_factorial
#check @Complex.Gamma_ne_zero
#check @Complex.Gamma_ofReal
#check @Complex.GammaSeq
#check @Complex.GammaSeq_tendsto_Gamma
#check @Complex.hasDerivAt_Gamma_of_re_pos
#check @Complex.hasSum_taylorSeries_neg_log
#check @Complex.integral_boundary_rect_eq_zero_of_differentiableOn
#check @Complex.sin
#check @Complex.tendsto_self_mul_Gamma_nhds_zero
#check @Complex.VerticalIntegrable
#check @cot_series_rep
#check @descPochhammer
#check @descPochhammer_eval_eq_ascPochhammer
#check @descPochhammer_eval_eq_descFactorial
#check @Differentiable.apply_eq_apply_of_bounded
#check @hasDerivAt_integral_of_dominated_loc_of_deriv_le
#check @HasProd
#check @_root_.integral_rpow_mul_exp_neg_mul_rpow
#check @iteratedDeriv
#check @Matrix.det_vandermonde
#check @Matrix.vandermonde
#check @MeasureTheory.measurePreserving_piFinSuccAbove
#check @mellinInv_mellin_eq
#check @MvPolynomial
#check @Nat.choose
#check @Nat.doubleFactorial_two_mul
#check @PhragmenLindelof.eq_zero_on_quadrant_I
#check @ProbabilityTheory.beta
#check @Real.convexOn_log_Gamma
#check @Real.eq_Gamma_of_log_convex
#check @Real.eulerMascheroniConstant_eq_neg_deriv
#check @Real.eulerMascheroniConstant_eq_neg_integral_log
#check @Real.Gamma_nat_add_half
#check @Real.Gamma_nat_add_one_add_half
#check @Real.Gamma_one_half_eq
#check @Real.GammaSeq
#check @riemannZeta
#check @riemannZeta_two
#check @TauCeti.Contour.tendsto_integral_sin_div_atTop
#check @TauCeti.integral_abs_rpow_mul_exp_neg_abs_rpow
#check @TauCeti.integral_rpow_mul_one_add_rpow
#check @TauCeti.integral_rpow_mul_one_sub_rpow

end TauCetiRoadmap.SpecialFunctionsGamma
