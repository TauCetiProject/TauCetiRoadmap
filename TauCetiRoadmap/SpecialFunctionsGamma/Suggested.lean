module

public import Mathlib

/-!
# The Gamma and Beta functions: target signatures

This file states the headline theorems of the roadmap against the pinned Mathlib. `README.md` is
the definitive document and states every target; this file gives suggested forms, not an exhaustive
list. The statements use only Mathlib: the Tau Ceti files that `README.md` cites in
`TauCeti/Analysis/SpecialFunctions/Gamma/` are newer than this repository's Tau Ceti pin. A
real-variable `ψ(x)` is written `(Complex.digamma x).re`, which is Tau Ceti's `Real.digamma x`.

The definitions below are roadmap-local copies of the definitions `README.md` pins. In Tau Ceti
they live in `Complex`, beside Mathlib's `Complex.Gamma` and `Complex.digamma`. Theorems are stated
with `sorry`.

The helpers `sectorFilter` (the filter `z → ∞` in `|ph z| ≤ π − δ`), `temmePhi` (Temme's phase
function) and `absVandermonde` (`|Δ(t)|` of DLMF 5.14.3) only abbreviate statements.
-/

@[expose] public section

noncomputable section

namespace TauCetiRoadmap.SpecialFunctionsGamma

open Complex Filter Topology Set MeasureTheory Finset
open scoped Real

/-- Euler's constant. -/
local notation "γ" => Real.eulerMascheroniConstant

/-! ## Definitions -/

/-- The Lah numbers `L(n, k) = C(n − 1, k − 1) n!/k!` for `1 ≤ k ≤ n`, with `L(0, 0) = 1` and
`L(n, k) = 0` otherwise (DLMF 5.2.9). -/
def lah (n k : ℕ) : ℂ :=
  if k = 0 then (if n = 0 then 1 else 0)
  else if n < k then 0
  else ((n - 1).choose (k - 1) : ℂ) * (n.factorial : ℂ) / (k.factorial : ℂ)

/-- The polygamma function `ψ⁽ⁿ⁾ = dⁿψ/dzⁿ`; `polygamma 0 = digamma`. -/
def polygamma (n : ℕ) (z : ℂ) : ℂ :=
  iteratedDeriv n digamma z

/-- The Maclaurin coefficients `c_k` of `1/Γ` (DLMF 5.7.1). -/
def invGammaCoeff (k : ℕ) : ℂ :=
  iteratedDeriv k (fun z => (Gamma z)⁻¹) 0 / (k.factorial : ℂ)

/-- The filter `z → ∞` in the closed sector `|ph z| ≤ π − δ`. -/
def sectorFilter (δ : ℝ) : Filter ℂ :=
  Bornology.cobounded ℂ ⊓ 𝓟 {z | |arg z| ≤ π - δ}

/-- Temme's phase `Φ(t) = 1 − t cot t + log(t/sin t)` (DLMF 5.9.2_5). -/
def temmePhi (t : ℝ) : ℝ :=
  1 - t * Real.cot t + Real.log (t / Real.sin t)

/-- `|Δ(t₁, …, tₙ)| = |∏_{j<k} (t_j − t_k)|` (DLMF 5.14.3), as the modulus of the Vandermonde
determinant. -/
def absVandermonde {n : ℕ} (t : Fin n → ℝ) : ℝ :=
  |(Matrix.vandermonde t).det|

/-! ## Layer 1: Pochhammer symbols, special values and functional relations -/

/-- DLMF 5.2.8. -/
theorem ascPochhammer_two_mul_eval (a : ℂ) (n : ℕ) :
    (ascPochhammer ℂ (2 * n)).eval a =
        2 ^ (2 * n) * (ascPochhammer ℂ n).eval (a / 2) * (ascPochhammer ℂ n).eval ((a + 1) / 2) ∧
      (ascPochhammer ℂ (2 * n + 1)).eval a =
        2 ^ (2 * n + 1) * (ascPochhammer ℂ (n + 1)).eval (a / 2) *
          (ascPochhammer ℂ n).eval ((a + 1) / 2) := by
  sorry

/-- DLMF 5.2.9, first expansion. -/
theorem ascPochhammer_eval_eq_sum_lah (x : ℂ) (n : ℕ) :
    (ascPochhammer ℂ n).eval x =
      ∑ k ∈ range (n + 1), lah n k * (descPochhammer ℂ k).eval x := by
  sorry

/-- DLMF 5.2.9, second expansion. -/
theorem descPochhammer_eval_eq_sum_lah (x : ℂ) (n : ℕ) :
    (descPochhammer ℂ n).eval x =
      ∑ k ∈ range (n + 1), (-1) ^ (n - k) * lah n k * (ascPochhammer ℂ k).eval x := by
  sorry

/-- DLMF 5.4.2, odd case (the even case is `Nat.doubleFactorial_two_mul` with
`Complex.Gamma_nat_eq_factorial`). -/
theorem doubleFactorial_odd_eq_Gamma (n : ℕ) :
    ((2 * n + 1).doubleFactorial : ℝ) =
      π ^ (-(1 / 2 : ℝ)) * 2 ^ ((n : ℝ) + 1) * Real.Gamma ((n : ℝ) + 3 / 2) := by
  sorry

/-- DLMF 5.4.4. -/
theorem Gamma_half_add_mul_I (y : ℝ) :
    Gamma (1 / 2 + I * y) * Gamma (1 / 2 - I * y) = ((‖Gamma (1 / 2 + I * y)‖ ^ 2 : ℝ) : ℂ) ∧
      ‖Gamma (1 / 2 + I * y)‖ ^ 2 = π / Real.cosh (π * y) := by
  sorry

/-- DLMF 5.4.5. -/
theorem Gamma_quarter_add_mul_I (y : ℝ) :
    Gamma (1 / 4 + I * y) * Gamma (3 / 4 - I * y) =
      (π * Real.sqrt 2 : ℝ) / ((Real.cosh (π * y) : ℂ) + I * Real.sinh (π * y)) := by
  sorry

/-- DLMF 5.4.15. -/
theorem digamma_nat_add_half (n : ℕ) :
    digamma (n + 1 / 2) =
      -(γ : ℂ) - 2 * log 2 + 2 * ∑ k ∈ range n, 1 / (2 * (k : ℂ) + 1) := by
  sorry

/-- DLMF 5.4.16. -/
theorem im_digamma_mul_I {y : ℝ} (hy : y ≠ 0) :
    (digamma (I * y)).im = 1 / (2 * y) + π / 2 * (Real.cosh (π * y) / Real.sinh (π * y)) := by
  sorry

/-- DLMF 5.4.17. -/
theorem im_digamma_half_add_mul_I (y : ℝ) :
    (digamma (1 / 2 + I * y)).im = π / 2 * Real.tanh (π * y) := by
  sorry

/-- DLMF 5.4.18. -/
theorem im_digamma_one_add_mul_I {y : ℝ} (hy : y ≠ 0) :
    (digamma (1 + I * y)).im = -1 / (2 * y) + π / 2 * (Real.cosh (π * y) / Real.sinh (π * y)) := by
  sorry

/-- DLMF 5.4.19, Gauss's digamma theorem. -/
theorem digamma_rat {p q : ℕ} (hp : 0 < p) (hpq : p < q) :
    digamma ((p : ℂ) / q) =
      ((-γ - Real.log q - π / 2 * Real.cot (π * p / q) +
        1 / 2 * ∑ k ∈ Icc 1 (q - 1),
          Real.cos (2 * π * k * p / q) * Real.log (2 - 2 * Real.cos (2 * π * k / q)) : ℝ) : ℂ) := by
  sorry

/-- DLMF 5.5.6, Gauss's multiplication formula, for every `z`. -/
theorem prod_Gamma_add_div {n : ℕ} (hn : 0 < n) (z : ℂ) :
    ∏ k ∈ range n, Gamma (z + k / n) =
      (2 * π : ℂ) ^ (((n : ℂ) - 1) / 2) * (n : ℂ) ^ (1 / 2 - n * z) * Gamma (n * z) := by
  sorry

/-- DLMF 5.5.9. -/
theorem digamma_mul_nat {n : ℕ} (hn : 0 < n) {z : ℂ} (hz : ∀ m : ℕ, (n : ℂ) * z ≠ -m) :
    digamma (n * z) = (1 / n) * ∑ k ∈ range n, digamma (z + k / n) + log n := by
  sorry

/-! ## Layer 2: series and products -/

/-- DLMF 5.7.3 on `|z| < 2`, exponentiated. -/
theorem Gamma_one_add_eq_exp {z : ℂ} (hz : ‖z‖ < 2) (hz₁ : z ≠ -1) :
    Gamma (1 + z) =
      (1 + z)⁻¹ * exp (z * (1 - γ) +
        ∑' k : ℕ, (-1) ^ k * (riemannZeta (k + 2) - 1) * z ^ (k + 2) / (k + 2)) := by
  sorry

/-- DLMF 5.7.4. -/
theorem digamma_one_add_eq_tsum {z : ℂ} (hz : ‖z‖ < 1) :
    digamma (1 + z) = -γ + ∑' k : ℕ, (-1) ^ k * riemannZeta (k + 2) * z ^ (k + 1) := by
  sorry

/-- DLMF 5.7.5 on `|z| < 2`. -/
theorem digamma_one_add_eq_tsum_odd {z : ℂ} (hz : ‖z‖ < 2) (hz₀ : z ≠ 0) (hz₁ : z ≠ 1)
    (hz₂ : z ≠ -1) :
    digamma (1 + z) =
      1 / (2 * z) - π / 2 * cot (π * z) + 1 / (z ^ 2 - 1) + 1 - γ -
        ∑' k : ℕ, (riemannZeta (2 * k + 3) - 1) * z ^ (2 * k + 2) := by
  sorry

/-- DLMF 5.7.2. -/
theorem invGammaCoeff_recurrence {k : ℕ} (hk : 3 ≤ k) :
    ((k : ℂ) - 1) * invGammaCoeff k =
      γ * invGammaCoeff (k - 1) +
        ∑ j ∈ Icc 2 (k - 1), (-1) ^ (j + 1) * riemannZeta j * invGammaCoeff (k - j) := by
  sorry

/-- DLMF 5.7.7, a conditionally convergent series. -/
theorem tendsto_digamma_half_sub {z : ℂ} (hz : ∀ m : ℕ, z ≠ -m) :
    Tendsto (fun N : ℕ => 2 * ∑ k ∈ range N, (-1) ^ k / (k + z)) atTop
      (𝓝 (digamma ((z + 1) / 2) - digamma (z / 2))) := by
  sorry

/-- DLMF 5.7.8. -/
theorem im_digamma_one_add_mul_I_eq_tsum (y : ℝ) :
    HasSum (fun k : ℕ => y / (((k : ℝ) + 1) ^ 2 + y ^ 2)) (digamma (1 + I * y)).im := by
  sorry

/-- DLMF 5.15.1 for every `z` off the poles, with `ψ′` the complex derivative of `ψ`. -/
theorem hasSum_deriv_digamma {z : ℂ} (hz : ∀ m : ℕ, z ≠ -m) :
    HasSum (fun k : ℕ => 1 / ((k : ℂ) + z) ^ 2) (deriv digamma z) := by
  sorry

/-- DLMF 5.8.2, the Weierstrass product. -/
theorem hasProd_inv_Gamma (z : ℂ) :
    ∃ P, HasProd (fun k : ℕ => (1 + z / (k + 1)) * exp (-z / (k + 1))) P ∧
      (Gamma z)⁻¹ = z * exp (γ * z) * P := by
  sorry

/-- DLMF 5.8.4–5.8.5, balanced products. -/
theorem hasProd_balanced {m : ℕ} (a b : Fin m → ℂ) (hab : ∑ k, a k = ∑ k, b k)
    (hb : ∀ k, ∀ j : ℕ, b k ≠ -j) :
    HasProd (fun j : ℕ => ∏ k, (a k + j) / (b k + j))
      ((∏ k, Gamma (b k)) * (∏ k, Gamma (a k))⁻¹) := by
  sorry

/-! ## Layer 3: inequalities -/

/-- DLMF 5.6.2. -/
theorem inv_Gamma_add_inv_Gamma_inv_le_two {x : ℝ} (hx : 0 < x) :
    1 / Real.Gamma x + 1 / Real.Gamma x⁻¹ ≤ 2 := by
  sorry

/-- DLMF 5.6.3. -/
theorem inv_Gamma_sq_add_inv_Gamma_inv_sq_le_two {x : ℝ} (hx : 0 < x) :
    (1 / Real.Gamma x) ^ 2 + (1 / Real.Gamma x⁻¹) ^ 2 ≤ 2 := by
  sorry

/-- DLMF 5.6.4, Gautschi's inequality. -/
theorem gautschi {x s : ℝ} (hx : 0 < x) (hs₀ : 0 < s) (hs₁ : s < 1) :
    x ^ (1 - s) < Real.Gamma (x + 1) / Real.Gamma (x + s) ∧
      Real.Gamma (x + 1) / Real.Gamma (x + s) < (x + 1) ^ (1 - s) := by
  sorry

/-- DLMF 5.6.5, Kershaw's inequality. -/
theorem kershaw {x s : ℝ} (hx : 0 < x) (hs₀ : 0 < s) (hs₁ : s < 1) :
    Real.exp ((1 - s) * (digamma (x + Real.sqrt s : ℝ)).re) ≤
        Real.Gamma (x + 1) / Real.Gamma (x + s) ∧
      Real.Gamma (x + 1) / Real.Gamma (x + s) ≤
        Real.exp ((1 - s) * (digamma (x + (s + 1) / 2 : ℝ)).re) := by
  sorry

/-- DLMF 5.6.6 for every real `x` off the poles. -/
theorem norm_Gamma_add_mul_I_le {x : ℝ} (hx : ∀ m : ℕ, x ≠ -m) (y : ℝ) :
    ‖Gamma (x + I * y)‖ ≤ |Real.Gamma x| := by
  sorry

/-- DLMF 5.6.7. -/
theorem norm_Gamma_add_mul_I_ge {x : ℝ} (hx : 1 / 2 ≤ x) (y : ℝ) :
    Real.sqrt (1 / Real.cosh (π * y)) * Real.Gamma x ≤ ‖Gamma (x + I * y)‖ := by
  sorry

/-- DLMF 5.6.8. -/
theorem norm_Gamma_add_div_Gamma_add_le {a b : ℝ} (ha : 0 ≤ a) (hab : 1 ≤ b - a) {z : ℂ}
    (hz : 0 < z.re) :
    ‖Gamma (z + a) / Gamma (z + b)‖ ≤ ‖z‖ ^ (a - b) := by
  sorry

/-! ## Layer 4: integral representations of `Γ` and `ψ` -/

/-- DLMF 5.9.1. -/
theorem integral_exp_neg_mul_rpow {μ : ℝ} (hμ : 0 < μ) {ν z : ℂ} (hν : 0 < ν.re) (hz : 0 < z.re) :
    ∫ t in Ioi (0 : ℝ), exp (-z * (t : ℂ) ^ (μ : ℂ)) * (t : ℂ) ^ (ν - 1) =
      1 / μ * Gamma (ν / μ) * z ^ (-(ν / μ)) := by
  sorry

/-- DLMF 5.9.2, Hankel's loop integral, with the contour pinned. -/
theorem inv_Gamma_eq_hankel (z : ℂ) {ε : ℝ} (hε : 0 < ε) :
    (Gamma z)⁻¹ =
      sin (π * z) / π * ∫ r in Ioi ε, exp (-(r : ℂ)) * (r : ℂ) ^ (-z) +
        (ε : ℂ) ^ (1 - z) / (2 * π) *
          ∫ θ in -π..π, exp (ε * exp (θ * I) + I * (1 - z) * θ) := by
  sorry

/-- DLMF 5.9.2_5, Temme's integral. -/
theorem inv_Gamma_eq_temme {z : ℂ} (hz : 0 < z.re) :
    (Gamma z)⁻¹ = exp z * z ^ (1 - z) / (2 * π) * ∫ t in -π..π, exp (-z * temmePhi t) := by
  sorry

/-- DLMF 5.9.3. -/
theorem integral_abs_cpow_mul_exp_neg_sq {c : ℝ} (hc : 0 < c) {z : ℂ} (hz : 0 < z.re) :
    ∫ t : ℝ, ((|t| : ℝ) : ℂ) ^ (2 * z - 1) * Real.exp (-c * t ^ 2) = (c : ℂ) ^ (-z) * Gamma z := by
  sorry

/-- DLMF 5.9.4. -/
theorem Gamma_eq_integral_Ioi_one_add_tsum {z : ℂ} (hz : ∀ m : ℕ, z ≠ -m) :
    Gamma z =
      (∫ t in Ioi (1 : ℝ), (t : ℂ) ^ (z - 1) * Real.exp (-t)) +
        ∑' k : ℕ, (-1) ^ k / ((z + k) * k.factorial) := by
  sorry

/-- DLMF 5.9.5, the Cauchy–Saalschütz integral. -/
theorem Gamma_eq_integral_exp_sub_taylor {n : ℕ} {z : ℂ} (hlo : -((n : ℝ) + 1) < z.re)
    (hhi : z.re < -n) :
    Gamma z =
      ∫ t in Ioi (0 : ℝ), (t : ℂ) ^ (z - 1) *
        (Real.exp (-t) - ∑ k ∈ range (n + 1), ((-t) ^ k / k.factorial : ℝ)) := by
  sorry

/-- DLMF 5.9.6. -/
theorem tendsto_integral_cpow_mul_cos {z : ℂ} (h₀ : 0 < z.re) (h₁ : z.re < 1) :
    Tendsto (fun R : ℝ => ∫ t in (0 : ℝ)..R, (t : ℂ) ^ (z - 1) * Real.cos t) atTop
      (𝓝 (Gamma z * cos (π * z / 2))) := by
  sorry

/-- DLMF 5.9.7, with the removable singularity at `z = 0` written out. -/
theorem tendsto_integral_cpow_mul_sin {z : ℂ} (h₀ : -1 < z.re) (h₁ : z.re < 1) :
    Tendsto (fun R : ℝ => ∫ t in (0 : ℝ)..R, (t : ℂ) ^ (z - 1) * Real.sin t) atTop
      (𝓝 (π / (2 * Gamma (1 - z) * cos (π * z / 2)))) := by
  sorry

/-- DLMF 5.9.8–5.9.9. -/
theorem tendsto_integral_cos_pow_sin_pow {n : ℕ} (hn : 2 ≤ n) :
    Tendsto (fun R : ℝ => ∫ t in (0 : ℝ)..R, Real.cos (t ^ n)) atTop
        (𝓝 (Real.Gamma (1 + 1 / n) * Real.cos (π / (2 * n)))) ∧
      Tendsto (fun R : ℝ => ∫ t in (0 : ℝ)..R, Real.sin (t ^ n)) atTop
        (𝓝 (Real.Gamma (1 + 1 / n) * Real.sin (π / (2 * n)))) := by
  sorry

/-- DLMF 5.9.13. -/
theorem digamma_eq_log_add_integral {z : ℂ} (hz : 0 < z.re) :
    digamma z = log z + ∫ t in Ioi (0 : ℝ), ((1 / t - 1 / (1 - Real.exp (-t)) : ℝ) : ℂ) *
      exp (-t * z) := by
  sorry

/-- DLMF 5.9.14. -/
theorem digamma_eq_integral_one_add {z : ℂ} (hz : 0 < z.re) :
    digamma z = ∫ t in Ioi (0 : ℝ), (Real.exp (-t) - (1 + t : ℂ) ^ (-z)) / t := by
  sorry

/-- DLMF 5.9.15. -/
theorem digamma_eq_log_sub_integral {z : ℂ} (hz : 0 < z.re) :
    digamma z = log z - 1 / (2 * z) -
      2 * ∫ t in Ioi (0 : ℝ), t / ((t ^ 2 + z ^ 2) * (Real.exp (2 * π * t) - 1)) := by
  sorry

/-- DLMF 5.9.16. -/
theorem digamma_add_eulerMascheroni {z : ℂ} (hz : 0 < z.re) :
    digamma z + γ = (∫ t in Ioi (0 : ℝ), (Real.exp (-t) - exp (-z * t)) / (1 - Real.exp (-t))) ∧
      digamma z + γ = ∫ t in (0 : ℝ)..1, (1 - (t : ℂ) ^ (z - 1)) / (1 - t) := by
  sorry

/-- DLMF 5.9.18. -/
theorem eulerMascheroni_eq_integrals :
    γ = -∫ t in Ioi (0 : ℝ), Real.exp (-t) * Real.log t ∧
      γ = ∫ t in Ioi (0 : ℝ), (1 / (1 + t) - Real.exp (-t)) / t ∧
      γ = (∫ t in (0 : ℝ)..1, (1 - Real.exp (-t)) / t) - ∫ t in Ioi (1 : ℝ), Real.exp (-t) / t ∧
      γ = ∫ t in Ioi (0 : ℝ), (Real.exp (-t) / (1 - Real.exp (-t)) - Real.exp (-t) / t) := by
  sorry

/-- DLMF 5.9.19. -/
theorem iteratedDeriv_Gamma_eq_integral (n : ℕ) {z : ℂ} (hz : 0 < z.re) :
    iteratedDeriv n Gamma z =
      ∫ t in Ioi (0 : ℝ), (Real.log t : ℂ) ^ n * Real.exp (-t) * (t : ℂ) ^ (z - 1) := by
  sorry

/-- DLMF 5.9.20, with `∫_c^z` along the segment. -/
theorem integral_segment_Gamma {c z : ℂ} (hc : 0 < c.re) (hz : 0 < z.re) :
    ∫ s in (0 : ℝ)..1, Gamma (c + s * (z - c)) * (z - c) =
      ∫ t in Ioi (0 : ℝ), ((t : ℂ) ^ (z - 1) - (t : ℂ) ^ (c - 1)) / Real.log t * Real.exp (-t) := by
  sorry

/-! ## Layer 5: the Beta function -/

/-- DLMF 5.12.2. -/
theorem integral_sin_cpow_mul_cos_cpow {a b : ℂ} (ha : 0 < a.re) (hb : 0 < b.re) :
    ∫ θ in (0 : ℝ)..(π / 2), (Real.sin θ : ℂ) ^ (2 * a - 1) * (Real.cos θ : ℂ) ^ (2 * b - 1) =
      1 / 2 * (Gamma a * Gamma b / Gamma (a + b)) := by
  sorry

/-- DLMF 5.12.4. -/
theorem integral_beta_div_add_cpow {a b z : ℂ} (ha : 0 < a.re) (hb : 0 < b.re)
    (hz : z ∈ slitPlane) :
    ∫ t in (0 : ℝ)..1, (t : ℂ) ^ (a - 1) * (1 - (t : ℂ)) ^ (b - 1) / ((t : ℂ) + z) ^ (a + b) =
      Gamma a * Gamma b / Gamma (a + b) * (1 + z) ^ (-a) * z ^ (-b) := by
  sorry

/-- DLMF 5.12.5, in reciprocal-Gamma form, for every `b`. -/
theorem integral_cos_cpow_mul_cos {a : ℂ} (ha : 0 < a.re) (b : ℂ) :
    ∫ t in (0 : ℝ)..(π / 2), (Real.cos t : ℂ) ^ (a - 1) * cos (b * t) =
      π * Gamma a * (2 : ℂ) ^ (-a) *
        (Gamma ((a + b + 1) / 2))⁻¹ * (Gamma ((a - b + 1) / 2))⁻¹ := by
  sorry

/-- DLMF 5.12.6, in reciprocal-Gamma form, for every `b`. -/
theorem integral_sin_cpow_mul_exp {a : ℂ} (ha : 0 < a.re) (b : ℂ) :
    ∫ t in (0 : ℝ)..π, (Real.sin t : ℂ) ^ (a - 1) * exp (I * b * t) =
      π * exp (I * π * b / 2) * Gamma a * (2 : ℂ) ^ (1 - a) *
        (Gamma ((a + b + 1) / 2))⁻¹ * (Gamma ((a - b + 1) / 2))⁻¹ := by
  sorry

/-- DLMF 5.12.7. -/
theorem integral_cosh_div_cosh_cpow {a b : ℂ} (hab : |b.re| < a.re) :
    ∫ t in Ioi (0 : ℝ), cosh (2 * b * t) / (Real.cosh t : ℂ) ^ (2 * a) =
      (4 : ℂ) ^ (a - 1) * (Gamma (a + b) * Gamma (a - b) / Gamma (2 * a)) := by
  sorry

/-- DLMF 5.12.8. -/
theorem integral_vertical_beta {a b w z : ℂ} (hw : 0 < w.re) (hz : 0 < z.re)
    (hab : 1 < (a + b).re) :
    1 / (2 * π) * ∫ t : ℝ, (w + I * t) ^ (-a) * (z - I * t) ^ (-b) =
      Gamma (a + b - 1) * (w + z) ^ (1 - a - b) * (Gamma a)⁻¹ * (Gamma b)⁻¹ := by
  sorry

/-- DLMF 5.12.9. -/
theorem integral_vertical_beta_one_sub {a b : ℂ} {c : ℝ} (hc₀ : 0 < c) (hc₁ : c < 1)
    (hab : 0 < (a + b).re) :
    1 / (2 * π) * ∫ y : ℝ, (c + I * y) ^ (-a) * (1 - c - I * y) ^ (-1 - b) =
      Gamma (a + b) * (Gamma a)⁻¹ * (Gamma (1 + b))⁻¹ := by
  sorry

/-- DLMF 5.12.10, with the loop around `1` pinned. -/
theorem beta_loop_one {a : ℂ} (ha : 0 < a.re) (b : ℂ) {ε : ℝ} (hε₀ : 0 < ε) (hε₁ : ε < 1) :
    (2 * π * I)⁻¹ *
        ((exp (-I * π * (b - 1)) - exp (I * π * (b - 1))) *
            ∫ t in (0 : ℝ)..(1 - ε), (t : ℂ) ^ (a - 1) * (1 - (t : ℂ)) ^ (b - 1) +
          I * (ε : ℂ) ^ b * ∫ θ in -π..π, (1 + ε * exp (θ * I)) ^ (a - 1) * exp (I * b * θ)) =
      Gamma a * (Gamma (a + b))⁻¹ * (Gamma (1 - b))⁻¹ := by
  sorry

/-- DLMF 5.12.11, with the loop around `0` pinned and multiplied out by `e^{2πia} − 1`. -/
theorem beta_loop_zero {a b : ℂ} (hb : 0 < b.re) (ha : ∀ m : ℕ, a ≠ -m) {ε : ℝ} (hε₀ : 0 < ε)
    (hε₁ : ε < 1) :
    (exp (2 * π * I * a) - 1) * ∫ t in Ioi ε, (t : ℂ) ^ (a - 1) * (1 + (t : ℂ)) ^ (-a - b) +
        I * (ε : ℂ) ^ a * ∫ θ in (0 : ℝ)..(2 * π), exp (I * a * θ) * (1 + ε * exp (θ * I)) ^ (-a - b) =
      (exp (2 * π * I * a) - 1) * (Gamma a * Gamma b / Gamma (a + b)) := by
  sorry

/-- DLMF 5.12.12, the Pochhammer contour, pinned. -/
theorem beta_pochhammer (a b : ℂ) {ε : ℝ} (hε₀ : 0 < ε) (hε₁ : ε < 1 / 2) :
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

/-! ## Layer 6: Barnes-type integrals -/

/-- DLMF 5.13.1. -/
theorem integral_Gamma_mul_Gamma_mul_cpow {a b z : ℂ} {c : ℝ} (hab : 0 < (a + b).re)
    (hca : -a.re < c) (hcb : c < b.re) (hz : z ∈ slitPlane) :
    1 / (2 * π) * ∫ y : ℝ, Gamma (c + I * y + a) * Gamma (b - c - I * y) * z ^ (-(c + I * y)) =
      Gamma (a + b) * z ^ a * (1 + z) ^ (-a - b) := by
  sorry

/-- DLMF 5.13.2. -/
theorem integral_norm_Gamma_sq_mul_exp {a b : ℝ} (ha : 0 < a) (hb₀ : 0 < b) (hb₁ : b < π) :
    1 / (2 * π) * ∫ t : ℝ, ‖Gamma (a + I * t)‖ ^ 2 * Real.exp ((2 * b - π) * t) =
      Real.Gamma (2 * a) / (2 * Real.sin b) ^ (2 * a) := by
  sorry

/-- DLMF 5.13.4, Ramanujan's integral. -/
theorem integral_inv_Gamma_four {a b c d : ℂ} (h : 3 < (a + b + c + d).re) :
    ∫ t : ℝ, (Gamma (a + t))⁻¹ * (Gamma (b + t))⁻¹ * (Gamma (c - t))⁻¹ * (Gamma (d - t))⁻¹ =
      Gamma (a + b + c + d - 3) * (Gamma (a + c - 1))⁻¹ * (Gamma (a + d - 1))⁻¹ *
        (Gamma (b + c - 1))⁻¹ * (Gamma (b + d - 1))⁻¹ := by
  sorry

/-- DLMF 5.13.5, the de Branges–Wilson integral. -/
theorem integral_deBrangesWilson {a : Fin 4 → ℂ} (ha : ∀ k, 0 < (a k).re) :
    1 / (4 * π) * ∫ t : ℝ,
        (∏ k, Gamma (a k + I * t) * Gamma (a k - I * t)) *
          (Gamma (2 * I * t))⁻¹ * (Gamma (-2 * I * t))⁻¹ =
      (∏ j, ∏ k, if j < k then Gamma (a j + a k) else 1) * (Gamma (∑ k, a k))⁻¹ := by
  sorry

/-! ## Layer 7: polygamma functions -/

/-- DLMF 5.15.2–5.15.3. -/
theorem polygamma_one_and_half {n : ℕ} (hn : 1 ≤ n) :
    polygamma n 1 = (-1) ^ (n + 1) * n.factorial * riemannZeta (n + 1) ∧
      polygamma n (1 / 2) =
        (-1) ^ (n + 1) * n.factorial * (2 ^ (n + 1) - 1) * riemannZeta (n + 1) := by
  sorry

/-- DLMF 5.15.4. -/
theorem polygamma_one_nat_sub_half {n : ℕ} (hn : 1 ≤ n) :
    polygamma 1 (n - 1 / 2) = π ^ 2 / 2 - 4 * ∑ k ∈ Icc 1 (n - 1), 1 / (2 * (k : ℂ) - 1) ^ 2 := by
  sorry

/-- DLMF 5.15.5. -/
theorem polygamma_add_one (n : ℕ) {z : ℂ} (hz : ∀ m : ℕ, z ≠ -m) :
    polygamma n (z + 1) = polygamma n z + (-1) ^ n * n.factorial * (z ^ (n + 1))⁻¹ := by
  sorry

/-- DLMF 5.15.6, with DLMF's `(−1)^{n−1}` written `(−1)^{n+1}`. -/
theorem polygamma_one_sub (n : ℕ) {z : ℂ} (hz : ∀ m : ℤ, z ≠ m) :
    polygamma n (1 - z) + (-1) ^ (n + 1) * polygamma n z =
      (-1) ^ n * π * iteratedDeriv n (fun w => cot (π * w)) z := by
  sorry

/-- DLMF 5.15.7. -/
theorem polygamma_mul_nat {n m : ℕ} (hn : 1 ≤ n) (hm : 1 ≤ m) {z : ℂ}
    (hz : ∀ j : ℕ, (m : ℂ) * z ≠ -j) :
    polygamma n (m * z) = ((m : ℂ) ^ (n + 1))⁻¹ * ∑ k ∈ range m, polygamma n (z + k / m) := by
  sorry

/-- DLMF 5.15.8–5.15.9: the asymptotic expansion in `|ph z| ≤ π − δ`, truncated after `k = N`. -/
theorem isBigO_polygamma_sub_partialSum {n : ℕ} (hn : 1 ≤ n) {δ : ℝ} (hδ₀ : 0 < δ) (hδ₁ : δ < π)
    (N : ℕ) :
    (fun z => polygamma n z - (-1) ^ (n + 1) *
        ((n - 1).factorial / z ^ n + n.factorial / (2 * z ^ (n + 1)) +
          ∑ k ∈ Icc 1 N, ((2 * k + n - 1).factorial / (2 * k).factorial : ℂ) *
            bernoulli (2 * k) / z ^ (2 * k + n))) =O[sectorFilter δ]
      fun z => (z ^ (2 * N + n + 2))⁻¹ := by
  sorry

/-- DLMF 5.16.1, a conditionally convergent series. -/
theorem tendsto_sum_neg_one_pow_polygamma_one :
    Tendsto (fun N : ℕ => ∑ k ∈ Icc 1 N, (-1) ^ k * polygamma 1 k) atTop (𝓝 (-π ^ 2 / 8)) := by
  sorry

/-- DLMF 5.16.2. -/
theorem hasSum_polygamma_one_div :
    HasSum (fun k : ℕ => polygamma 1 (k + 2) / (k + 1)) (riemannZeta 3) := by
  sorry

/-! ## Layer 8: multidimensional integrals -/

/-- Carlson's theorem (auxiliary, 8.1). -/
theorem eq_zero_of_carlson {f : ℂ → ℂ} (hd : DifferentiableOn ℂ f {z | 0 < z.re})
    (hc : ContinuousOn f {z | 0 ≤ z.re})
    (hexp : ∃ τ C : ℝ, ∀ z : ℂ, 0 ≤ z.re → ‖f z‖ ≤ C * Real.exp (τ * ‖z‖))
    (him : ∃ c < π, ∃ C : ℝ, ∀ y : ℝ, ‖f (I * y)‖ ≤ C * Real.exp (c * |y|))
    (hzero : ∀ n : ℕ, f n = 0) {z : ℂ} (hz : 0 ≤ z.re) :
    f z = 0 := by
  sorry

/-- DLMF 5.14.2 (and 5.14.1 with `z (Fin.last n) = 1`). -/
theorem integral_simplex_dirichlet {n : ℕ} (z : Fin (n + 1) → ℂ) (hz : ∀ i, 0 < (z i).re) :
    ∫ t in {t : Fin n → ℝ | (∀ i, 0 ≤ t i) ∧ ∑ i, t i ≤ 1},
        (1 - ∑ i, (t i : ℂ)) ^ (z (Fin.last n) - 1) * ∏ i : Fin n, (t i : ℂ) ^ (z i.castSucc - 1) =
      (∏ i, Gamma (z i)) / Gamma (∑ i, z i) := by
  sorry

/-- DLMF 5.14.4: Selberg's integral (`m = 0`) and Aomoto's extension, on the full parameter
range `Re c > −min(1/n, Re a/(n − 1), Re b/(n − 1))`. -/
theorem integral_selberg_aomoto {n m : ℕ} (hn : 1 ≤ n) (hm : m ≤ n) {a b c : ℂ} (ha : 0 < a.re)
    (hb : 0 < b.re) (hc : 0 < 1 + n * c.re) (hca : 0 < a.re + (n - 1 : ℕ) * c.re)
    (hcb : 0 < b.re + (n - 1 : ℕ) * c.re) :
    ∫ t in Set.pi univ fun _ : Fin n => Icc (0 : ℝ) 1,
        (∏ i : Fin m, (t (Fin.castLE hm i) : ℂ)) * (absVandermonde t : ℂ) ^ (2 * c) *
          ∏ k, (t k : ℂ) ^ (a - 1) * (1 - (t k : ℂ)) ^ (b - 1) =
      ((Gamma (1 + c)) ^ n)⁻¹ *
        (∏ k ∈ Icc 1 m, (a + ((n : ℂ) - k) * c) / (a + b + (2 * (n : ℂ) - k - 1) * c)) *
        ∏ k ∈ Icc 1 n, Gamma (a + ((n : ℂ) - k) * c) * Gamma (b + ((n : ℂ) - k) * c) *
          Gamma (1 + k * c) / Gamma (a + b + (2 * (n : ℂ) - k - 1) * c) := by
  sorry

/-- DLMF 5.14.5, the Laguerre limit. -/
theorem integral_selberg_laguerre {n m : ℕ} (hn : 1 ≤ n) (hm : m ≤ n) {a c : ℂ} (ha : 0 < a.re)
    (hc : 0 < 1 + n * c.re) (hca : 0 < a.re + (n - 1 : ℕ) * c.re) :
    ∫ t in Set.pi univ fun _ : Fin n => Ioi (0 : ℝ),
        (∏ i : Fin m, (t (Fin.castLE hm i) : ℂ)) * (absVandermonde t : ℂ) ^ (2 * c) *
          ∏ k, (t k : ℂ) ^ (a - 1) * Real.exp (-t k) =
      (∏ k ∈ Icc 1 m, (a + ((n : ℂ) - k) * c)) *
        (∏ k ∈ Icc 1 n, Gamma (a + ((n : ℂ) - k) * c) * Gamma (1 + k * c)) *
        ((Gamma (1 + c)) ^ n)⁻¹ := by
  sorry

/-- DLMF 5.14.6, Mehta's integral. -/
theorem integral_selberg_hermite {n : ℕ} (hn : 1 ≤ n) {c : ℂ} (hc : 0 < 1 + n * c.re) :
    (2 * π : ℂ) ^ (-(n : ℂ) / 2) *
        ∫ t : Fin n → ℝ, (absVandermonde t : ℂ) ^ (2 * c) * ∏ k, Real.exp (-(t k) ^ 2 / 2) =
      (∏ k ∈ Icc 1 n, Gamma (1 + k * c)) * ((Gamma (1 + c)) ^ n)⁻¹ := by
  sorry

/-- DLMF 5.14.7, Dyson's integral. -/
theorem integral_dyson {n : ℕ} (hn : 1 ≤ n) {b : ℂ} (hb : 0 < 1 + n * b.re) :
    (2 * π : ℂ) ^ (-(n : ℂ)) *
        ∫ θ in Set.pi univ fun _ : Fin n => Icc (-π) π,
          ∏ j, ∏ k, (if j < k then
            ((‖exp (θ j * I) - exp (θ k * I)‖ : ℝ) : ℂ) ^ (2 * b) else 1) =
      Gamma (1 + b * n) * ((Gamma (1 + b)) ^ n)⁻¹ := by
  sorry

end TauCetiRoadmap.SpecialFunctionsGamma
