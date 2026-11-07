module

public import Mathlib
public import TauCeti.Analysis.SpecialFunctions.Erf
public import TauCeti.Analysis.SpecialFunctions.Hermite.Function.Basic

/-!
# Parabolic cylinder functions: suggested target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. The statements here suggest Lean forms for particular subsections, so that
contributors and reviewers converge on names and signatures; discharging all of them
finishes neither a layer nor the roadmap.

The definitions below are roadmap-local copies of the definitions `README.md` pins. The complex
functions live in `TauCeti`; `parabolicCylinderW`, its two initial-value factors and `gammaHalfPhase`
live in `TauCeti.Real`. They are stated with their
intended bodies so that the conventions are checked by the compiler: Mathlib's regularized
Kummer function `Complex.regularizedHGFun {a} {b}` (written `𝐌(a, b)` here), the parameter-first
argument order `(a, z)`, reciprocal Gamma factors in the initial values of `U` and `V`, principal
complex powers, and the sector filter `Bornology.cobounded ℂ ⊓ 𝓟 {z | |arg z| ≤ θ}`. Theorems
are stated with `sorry`.

The general tools (Watson's lemma, line shifts across poles, Gamma bounds on vertical strips and
exponential Mellin inversion) belong to the AsymptoticExpansions roadmap and are not restated here.
The expansions of Layer 7 are written out as one `IsBigO` statement per truncation order `N`,
which is AsymptoticExpansions' `Asymptotics.HasAsymptoticExpansion` with the scale
`z ↦ (z ^ (2 * s))⁻¹` unfolded, so that this file needs no import from that roadmap.
-/

@[expose] public section

noncomputable section

namespace TauCetiRoadmap.SpecialFunctionsParabolicCylinder

open Complex Filter Topology Asymptotics Set MeasureTheory
open scoped Real Nat

/-- Olver's regularized Kummer function `𝐌(a, b, z) = M(a, b, z) / Γ(b)`, as Mathlib's
`Complex.regularizedHGFun` with one numerator and one denominator parameter. -/
local notation "𝐌(" a ", " b ")" =>
  Complex.regularizedHGFun ({a} : Multiset ℂ) ({b} : Multiset ℂ)

/-- The sector filter "`z → ∞` in `|ph z| ≤ θ`". -/
local notation "sectorAtTop " θ =>
  Bornology.cobounded ℂ ⊓ 𝓟 (Set.ofPred fun z : ℂ => |Complex.arg z| ≤ θ)

/-! ### Layer 1: the regularized Kummer function -/

/-- **1.2** The derivative of `𝐌(a, b, ·)` (DLMF 13.3.15, regularized). -/
theorem hasDerivAt_regularizedHGFun_singleton (a b z : ℂ) :
    HasDerivAt 𝐌(a, b) (a * 𝐌(a + 1, b + 1) z) z := sorry

/-- **1.3** Kummer's equation for `𝐌(a, b, ·)` for all parameters (DLMF 13.2.1). -/
theorem regularizedHGFun_kummer_equation (a b z : ℂ) :
    z * deriv (deriv (fun w => Complex.regularizedHGFun {a} {b} w)) z +
      (b - z) * deriv (fun w => Complex.regularizedHGFun {a} {b} w) z -
        a * Complex.regularizedHGFun {a} {b} z = 0 := sorry

/-- **1.4** Kummer's transformation (DLMF 13.2.39). -/
theorem regularizedHGFun_singleton_eq_exp_mul (a b z : ℂ) :
    𝐌(a, b) z = exp z * 𝐌(b - a, b) (-z) := sorry

/-- **1.5** Analyticity in the numerator parameter. -/
theorem differentiable_regularizedHGFun_singleton_left (b z : ℂ) :
    Differentiable ℂ fun a => 𝐌(a, b) z := sorry

/-! ### Layer 2: Weber's equation and its even and odd solutions -/

/-- The even solution `u₁(a, z) = e^{−z²/4} M(a/2 + ¼, ½, z²/2)` (DLMF 12.7.12). -/
def parabolicCylinderEven (a z : ℂ) : ℂ :=
  exp (-z ^ 2 / 4) * (Gamma (1 / 2) * 𝐌(a / 2 + 1 / 4, 1 / 2) (z ^ 2 / 2))

/-- The odd solution `u₂(a, z) = z e^{−z²/4} M(a/2 + ¾, 3/2, z²/2)` (DLMF 12.7.13). -/
def parabolicCylinderOdd (a z : ℂ) : ℂ :=
  z * exp (-z ^ 2 / 4) * (Gamma (3 / 2) * 𝐌(a / 2 + 3 / 4, 3 / 2) (z ^ 2 / 2))

/-- **2.1** The power series DLMF 12.4.3. -/
theorem hasSum_parabolicCylinderEven (a z : ℂ) :
    HasSum (fun k : ℕ => exp (-z ^ 2 / 4) * (∏ r ∈ Finset.range k, (a + 1 / 2 + 2 * r)) *
      z ^ (2 * k) / ((2 * k)! : ℂ)) (parabolicCylinderEven a z) := sorry

/-- **2.3** Weber's equation `w″ = (z²/4 + a) w` (DLMF 12.2.2) for `u₁`. -/
theorem deriv_deriv_parabolicCylinderEven (a z : ℂ) :
    deriv^[2] (parabolicCylinderEven a) z = (z ^ 2 / 4 + a) * parabolicCylinderEven a z := sorry

/-- **2.3** Weber's equation for `u₂`. -/
theorem deriv_deriv_parabolicCylinderOdd (a z : ℂ) :
    deriv^[2] (parabolicCylinderOdd a) z = (z ^ 2 / 4 + a) * parabolicCylinderOdd a z := sorry

/-- **2.4** The Wronskian of `u₁` and `u₂`. -/
theorem parabolicCylinderEven_mul_deriv_sub (a z : ℂ) :
    parabolicCylinderEven a z * deriv (parabolicCylinderOdd a) z -
      deriv (parabolicCylinderEven a) z * parabolicCylinderOdd a z = 1 := sorry

/-- **2.4** Every solution of Weber's equation is determined by its initial values. -/
theorem eq_parabolicCylinderEven_add_parabolicCylinderOdd {a : ℂ} {f : ℂ → ℂ}
    (hf : Differentiable ℂ f) (hode : ∀ z, deriv^[2] f z = (z ^ 2 / 4 + a) * f z) :
    f = fun z => f 0 * parabolicCylinderEven a z + deriv f 0 * parabolicCylinderOdd a z :=
  sorry

/-! ### Layer 3: `U`, `V` and `D` -/

/-- Weber's function `U(a, z)` (DLMF 12.4.1), fixed by its initial values DLMF 12.2.6–12.2.7,
with reciprocal Gamma factors so that it is entire in `a`. -/
def parabolicCylinderU (a z : ℂ) : ℂ :=
  Real.sqrt π * (2 : ℂ) ^ (-(a / 2 + 1 / 4)) * (Gamma (3 / 4 + a / 2))⁻¹ *
      parabolicCylinderEven a z -
    Real.sqrt π * (2 : ℂ) ^ (-(a / 2 - 1 / 4)) * (Gamma (1 / 4 + a / 2))⁻¹ *
      parabolicCylinderOdd a z

/-- Weber's second function `V(a, z)` (DLMF 12.4.2), fixed by its initial values
DLMF 12.2.8–12.2.9 in reciprocal-Gamma form. -/
def parabolicCylinderV (a z : ℂ) : ℂ :=
  π * (2 : ℂ) ^ (a / 2 + 1 / 4) * (Gamma (3 / 4 - a / 2))⁻¹ ^ 2 * (Gamma (1 / 4 + a / 2))⁻¹ *
      parabolicCylinderEven a z +
    π * (2 : ℂ) ^ (a / 2 + 3 / 4) * (Gamma (1 / 4 - a / 2))⁻¹ ^ 2 * (Gamma (3 / 4 + a / 2))⁻¹ *
      parabolicCylinderOdd a z

/-- Whittaker's notation `D_ν(z) = U(−ν − ½, z)` (DLMF 12.2.5). -/
def parabolicCylinderD (ν z : ℂ) : ℂ := parabolicCylinderU (-ν - 1 / 2) z

/-- **3.1** `U(a, ·)` is entire. -/
theorem differentiable_parabolicCylinderU (a : ℂ) : Differentiable ℂ (parabolicCylinderU a) :=
  sorry

/-- **3.1** `U(·, z)` is entire. -/
theorem differentiable_parabolicCylinderU_left (z : ℂ) :
    Differentiable ℂ fun a => parabolicCylinderU a z := sorry

/-- **3.2** `U(a, 0)` (DLMF 12.2.6). -/
theorem parabolicCylinderU_zero_right (a : ℂ) :
    parabolicCylinderU a 0 = Real.sqrt π / ((2 : ℂ) ^ (a / 2 + 1 / 4) * Gamma (3 / 4 + a / 2)) :=
  sorry

/-- **3.3** `𝒲{U(a, z), V(a, z)} = √(2/π)` (DLMF 12.2.10). -/
theorem parabolicCylinderU_mul_deriv_parabolicCylinderV_sub (a z : ℂ) :
    parabolicCylinderU a z * deriv (parabolicCylinderV a) z -
      deriv (parabolicCylinderU a) z * parabolicCylinderV a z = Real.sqrt (2 / π) := sorry

/-- **3.3** `𝒲{U(a, z), U(a, −z)} = √(2π)/Γ(½ + a)` (DLMF 12.2.11). -/
theorem parabolicCylinderU_mul_deriv_parabolicCylinderU_neg_sub (a z : ℂ) :
    parabolicCylinderU a z * deriv (fun w => parabolicCylinderU a (-w)) z -
      deriv (parabolicCylinderU a) z * parabolicCylinderU a (-z) =
        Real.sqrt (2 * π) / Gamma (1 / 2 + a) := sorry

/-- **3.3** DLMF 12.2.12, upper signs: the exponential has positive phase. -/
theorem parabolicCylinderU_mul_deriv_parabolicCylinderU_mul_I_sub (a z : ℂ) :
    parabolicCylinderU a z * deriv (fun w => parabolicCylinderU (-a) (I * w)) z -
      deriv (parabolicCylinderU a) z * parabolicCylinderU (-a) (I * z) =
        -I * exp (I * π * (a / 2 + 1 / 4)) := sorry

/-- **3.3** DLMF 12.2.12, lower signs: the exponential has negative phase. -/
theorem parabolicCylinderU_mul_deriv_parabolicCylinderU_mul_neg_I_sub (a z : ℂ) :
    parabolicCylinderU a z * deriv (fun w => parabolicCylinderU (-a) (-I * w)) z -
      deriv (parabolicCylinderU a) z * parabolicCylinderU (-a) (-I * z) =
        I * exp (-I * π * (a / 2 + 1 / 4)) := sorry

/-- **3.5** The connection formula DLMF 12.2.15. -/
theorem parabolicCylinderU_neg (a z : ℂ) :
    parabolicCylinderU a (-z) =
      -Complex.sin (π * a) * parabolicCylinderU a z +
        π / Gamma (1 / 2 + a) * parabolicCylinderV a z := sorry

/-! In the following connection formulas `ε = 1` selects every upper sign and `ε = -1`
selects every lower sign. The sign is a complex scalar so that its coercions are explicit. -/

/-- **3.5** DLMF 12.2.17, with its Gamma-pole exclusion. -/
theorem parabolicCylinderU_connection_mul_I {a : ℂ}
    (ha : ∀ n : ℕ, 1 / 2 + a ≠ -(n : ℂ)) (z ε : ℂ) (hε : ε = 1 ∨ ε = -1) :
    Real.sqrt (2 * π) * parabolicCylinderU (-a) (ε * I * z) = Gamma (1 / 2 + a) *
      (exp (-ε * I * π * (a / 2 - 1 / 4)) * parabolicCylinderU a z +
        exp (ε * I * π * (a / 2 - 1 / 4)) * parabolicCylinderU a (-z)) := sorry

/-- **3.5** DLMF 12.2.18, with the opposite Gamma-pole exclusion. -/
theorem parabolicCylinderU_connection_rotations {a : ℂ}
    (ha : ∀ n : ℕ, 1 / 2 - a ≠ -(n : ℂ)) (z ε : ℂ) (hε : ε = 1 ∨ ε = -1) :
    Real.sqrt (2 * π) * parabolicCylinderU a z = Gamma (1 / 2 - a) *
      (exp (-ε * I * π * (a / 2 + 1 / 4)) * parabolicCylinderU (-a) (ε * I * z) +
        exp (ε * I * π * (a / 2 + 1 / 4)) * parabolicCylinderU (-a) (-ε * I * z)) := sorry

/-- **3.5** The reciprocal-Gamma form of DLMF 12.2.17 is entire in the parameter. -/
theorem parabolicCylinderU_connection_mul_I_reciprocal
    (a z ε : ℂ) (hε : ε = 1 ∨ ε = -1) :
    Real.sqrt (2 * π) / Gamma (1 / 2 + a) * parabolicCylinderU (-a) (ε * I * z) =
      exp (-ε * I * π * (a / 2 - 1 / 4)) * parabolicCylinderU a z +
        exp (ε * I * π * (a / 2 - 1 / 4)) * parabolicCylinderU a (-z) := sorry

/-- **3.5** The reciprocal-Gamma form of DLMF 12.2.18 is entire in the parameter. -/
theorem parabolicCylinderU_connection_rotations_reciprocal
    (a z ε : ℂ) (hε : ε = 1 ∨ ε = -1) :
    Real.sqrt (2 * π) / Gamma (1 / 2 - a) * parabolicCylinderU a z =
      exp (-ε * I * π * (a / 2 + 1 / 4)) * parabolicCylinderU (-a) (ε * I * z) +
        exp (ε * I * π * (a / 2 + 1 / 4)) * parabolicCylinderU (-a) (-ε * I * z) := sorry

/-- **3.5** DLMF 12.2.19, valid for every parameter with reciprocal Gamma. -/
theorem parabolicCylinderU_eq_neg_add_rotation (a z ε : ℂ) (hε : ε = 1 ∨ ε = -1) :
    parabolicCylinderU a z = ε * I * exp (ε * I * π * a) * parabolicCylinderU a (-z) +
      Real.sqrt (2 * π) / Gamma (1 / 2 + a) * exp (ε * I * π * (a / 2 - 1 / 4)) *
        parabolicCylinderU (-a) (ε * I * z) := sorry

/-- **3.5** DLMF 12.2.20, valid for every parameter with reciprocal Gamma. -/
theorem parabolicCylinderV_eq_add_rotation (a z ε : ℂ) (hε : ε = 1 ∨ ε = -1) :
    parabolicCylinderV a z = -ε * I / Gamma (1 / 2 - a) * parabolicCylinderU a z +
      Real.sqrt (2 / π) * exp (-ε * I * π * (a / 2 - 1 / 4)) *
        parabolicCylinderU (-a) (ε * I * z) := sorry

/-- **3.6** The general quadratic equation DLMF 12.2.1 reduces to Weber's equation. -/
theorem quadratic_equation_of_weber {α β γ s : ℂ} (hα : α ≠ 0) (hs : s ^ 4 = -4 * α)
    {f : ℂ → ℂ} (hf : Differentiable ℂ f)
    (hode : ∀ z, deriv^[2] f z = (z ^ 2 / 4 + (β ^ 2 / (4 * α) - γ) / s ^ 2) * f z) (z : ℂ) :
    deriv^[2] (fun z => f (s * (z + β / (2 * α)))) z +
      (α * z ^ 2 + β * z + γ) * f (s * (z + β / (2 * α))) = 0 := sorry

/-! ### Layer 4: recurrences and derivatives -/

/-- **4.1** DLMF 12.8.1. -/
theorem parabolicCylinderU_recurrence (a z : ℂ) :
    z * parabolicCylinderU a z - parabolicCylinderU (a - 1) z +
      (a + 1 / 2) * parabolicCylinderU (a + 1) z = 0 := sorry

/-- **4.1** DLMF 12.8.2. -/
theorem deriv_parabolicCylinderU (a z : ℂ) :
    deriv (parabolicCylinderU a) z =
      -(z / 2) * parabolicCylinderU a z - (a + 1 / 2) * parabolicCylinderU (a + 1) z := sorry

/-- **4.3** DLMF 12.8.9. -/
theorem iteratedDeriv_exp_mul_parabolicCylinderU (a z : ℂ) (m : ℕ) :
    iteratedDeriv m (fun w => exp (w ^ 2 / 4) * parabolicCylinderU a w) z =
      (-1) ^ m * (ascPochhammer ℂ m).eval (1 / 2 + a) * exp (z ^ 2 / 4) *
        parabolicCylinderU (a + m) z := sorry

/-! ### Layer 5: Hermite and error function cases -/

/-- **5.1** Dawson's integral `F(z)`, defined along the straight segment from `0` to `z`. -/
def dawson (z : ℂ) : ℂ :=
  exp (-z ^ 2) * ∫ s in (0 : ℝ)..1, z * exp (((s : ℂ) * z) ^ 2)

/-- **5.1** Dawson's integral is entire. -/
theorem differentiable_dawson : Differentiable ℂ dawson := sorry

/-- **5.1** The differential equation of Dawson's integral. -/
theorem hasDerivAt_dawson (z : ℂ) : HasDerivAt dawson (1 - 2 * z * dawson z) z := sorry

/-- **5.1** The Dawson case DLMF 12.7.4. -/
theorem parabolicCylinderV_neg_one_half (z : ℂ) :
    parabolicCylinderV (-1 / 2) z =
      2 / Real.sqrt π * exp (z ^ 2 / 4) * dawson (z / Real.sqrt 2) := sorry

/-- **5.1** `D_n(z) = e^{−z²/4} He_n(z)` (DLMF 12.7.2), with Mathlib's probabilists' Hermite
polynomials. -/
theorem parabolicCylinderD_natCast (n : ℕ) (z : ℂ) :
    parabolicCylinderD n z = exp (-z ^ 2 / 4) * Polynomial.aeval z (Polynomial.hermite n) :=
  sorry

/-- **5.2** Tau Ceti's Hermite function is a normalized `D_n(√2 x)`. -/
theorem hermiteFunction_eq_parabolicCylinderD (n : ℕ) (x : ℝ) :
    TauCeti.hermiteFunction n x =
      (parabolicCylinderD n (Real.sqrt 2 * x)).re / Real.sqrt (n ! * Real.sqrt π) := sorry

/-- **5.3** The repeated Gaussian integral `Hh_n(z)`, indexed by natural numbers.
The notation `Hh_{-1}(z)` in the README abbreviates `exp (-z ^ 2 / 2)` separately. -/
def repeatedGaussianIntegral (n : ℕ) (z : ℂ) : ℂ :=
  ∫ t in Ioi (0 : ℝ), (t : ℂ) ^ n / n ! * exp (-((z + t) ^ 2) / 2)

/-- **5.3** Each repeated Gaussian integral is entire. -/
theorem differentiable_repeatedGaussianIntegral (n : ℕ) :
    Differentiable ℂ (repeatedGaussianIntegral n) := sorry

/-- **5.3** Differentiation lowers a positive index. -/
theorem hasDerivAt_repeatedGaussianIntegral_succ (n : ℕ) (z : ℂ) :
    HasDerivAt (repeatedGaussianIntegral (n + 1)) (-repeatedGaussianIntegral n z) z := sorry

/-- **5.3** The recurrence at natural indices. -/
theorem repeatedGaussianIntegral_add_two (n : ℕ) (z : ℂ) :
    (n + 2 : ℂ) * repeatedGaussianIntegral (n + 2) z =
      repeatedGaussianIntegral n z - z * repeatedGaussianIntegral (n + 1) z := sorry

/-- **5.3** Reality and positivity on the real line. -/
theorem repeatedGaussianIntegral_ofReal_pos (n : ℕ) (x : ℝ) :
    (repeatedGaussianIntegral n x).im = 0 ∧ 0 < (repeatedGaussianIntegral n x).re := sorry

/-- **5.3** DLMF 12.7.7 at every natural index. -/
theorem parabolicCylinderU_nat_add_one_half (n : ℕ) (z : ℂ) :
    parabolicCylinderU (n + 1 / 2) z = exp (z ^ 2 / 4) * repeatedGaussianIntegral n z := sorry

/-- **5.1, 5.3** The `n = -1` case of DLMF 12.7.7. -/
theorem parabolicCylinderU_neg_one_half (z : ℂ) :
    parabolicCylinderU (-1 / 2) z = exp (-z ^ 2 / 4) := sorry

/-- **5.4** `U(½, x) = √(π/2) e^{x²/4} erfc(x/√2)` on the real line (DLMF 12.7.5). -/
theorem parabolicCylinderU_one_half_ofReal (x : ℝ) :
    parabolicCylinderU (1 / 2) x =
      (Real.sqrt (π / 2) * Real.exp (x ^ 2 / 4) * TauCeti.Real.erfc (x / Real.sqrt 2) : ℝ) :=
  sorry

/-! ### Layer 6: integral representations -/

/-- **6.1** The Laplace form DLMF 12.5.1. -/
theorem parabolicCylinderU_eq_integral {a : ℂ} (ha : -1 / 2 < a.re) (z : ℂ) :
    parabolicCylinderU a z = exp (-z ^ 2 / 4) / Gamma (1 / 2 + a) *
      ∫ t in Ioi (0 : ℝ), (t : ℂ) ^ (a - 1 / 2) * exp (-(t : ℂ) ^ 2 / 2 - z * t) := sorry

/-- **6.2** Positivity of `U(a, x)` for `a > −½`. -/
theorem parabolicCylinderU_ofReal_pos {a : ℝ} (ha : -1 / 2 < a) (x : ℝ) :
    (parabolicCylinderU a x).im = 0 ∧ 0 < (parabolicCylinderU a x).re := sorry

/-- **6.3** DLMF 12.5.4 as a Bochner integral over `Ioi 0`. -/
theorem parabolicCylinderU_eq_integral_cos {a : ℂ} (ha : a.re < 1 / 2) (z : ℂ) :
    parabolicCylinderU a z = Real.sqrt (2 / π) * exp (z ^ 2 / 4) *
      ∫ t in Ioi (0 : ℝ), (t : ℂ) ^ (-a - 1 / 2) * exp (-(t : ℂ) ^ 2 / 2) *
        cos (z * t + (a / 2 + 1 / 4) * π) := sorry

/-- **6.6(a)** The modulus product DLMF 5.8.3 from Euler's Gamma limit, including convergence,
for every real `x` that is not a nonpositive integer. -/
theorem hasProd_Gamma_norm_quotient {x : ℝ} (hx : ∀ n : ℕ, x ≠ -(n : ℝ)) (y : ℝ) :
    HasProd (fun k : ℕ => 1 + y ^ 2 / (x + k) ^ 2)
      (Real.Gamma x ^ 2 / ‖Gamma ((x : ℂ) + y * I)‖ ^ 2) := sorry

/-- **6.6(a)** The reflection-formula value on the line with real part `1`. -/
theorem norm_Gamma_one_add_mul_I_sq {y : ℝ} (hy : y ≠ 0) :
    ‖Gamma (1 + y * I)‖ ^ 2 = π * y / Real.sinh (π * y) := sorry

/-- **6.6(b)** The residue at every nonpositive integer, as a punctured limit. -/
theorem tendsto_add_nat_mul_Gamma (n : ℕ) :
    Tendsto (fun z : ℂ => (z + n) * Gamma z) (𝓝[≠] (-(n : ℂ)))
      (𝓝 ((-1 : ℂ) ^ n / n !)) := sorry

/-- **6.6(b)** The affine-chain factor `-1/2` at a pole of `Γ(A - 2t)`. -/
theorem tendsto_sub_mul_Gamma_sub_two_mul (A : ℂ) (n : ℕ) :
    Tendsto (fun t : ℂ => (t - (A + n) / 2) * Gamma (A - 2 * t))
      (𝓝[≠] ((A + n) / 2)) (𝓝 ((-1 : ℂ) ^ (n + 1) / (2 * n !))) := sorry

/-! The following local notation abbreviates the kernel and residues specified in 6.6–6.7.
Writing `t = c + iy` absorbs the factor `i` from `dt` into the Barnes prefactor. -/

local notation "𝓑(" A ", " z ", " t ")" =>
  Gamma t * Gamma (A - 2 * t) * (2 : ℂ) ^ t * z ^ (2 * t)

local notation "𝓡(" A ", " z ", " n ")" =>
  (-1 : ℂ) ^ (n + 1) * Gamma ((A + n) / 2) * (2 : ℂ) ^ ((A + n) / 2) *
    z ^ (A + n) / (2 * (n ! : ℂ))

/-- **6.6(c)** An explicit exponentially decaying bound for the `U` Barnes kernel. -/
theorem exists_norm_barnes_kernel_le {A z : ℂ} (hz0 : z ≠ 0)
    (hz : |arg z| < 3 * π / 4) {c : ℝ} (hc : 0 < c)
    (havoid : ∀ n : ℕ, 2 * c ≠ A.re + n) :
    ∃ C : ℝ, 0 < C ∧ ∃ K : ℕ, ∀ y : ℝ,
      ‖𝓑(A, z, ((c : ℂ) + y * I))‖ ≤
        C * (1 + |y|) ^ K * Real.exp (-(3 * π / 2 - 2 * |arg z|) * |y|) := sorry

/-- **6.6(c)** The cosine factor reduces the available exponential decay rate by `π`. -/
theorem exists_norm_barnes_kernel_mul_cos_le {A z : ℂ} (hz0 : z ≠ 0)
    (hz : |arg z| < π / 4) {c : ℝ} (hc : 0 < c)
    (havoid : ∀ n : ℕ, 2 * c ≠ A.re + n) :
    ∃ C : ℝ, 0 < C ∧ ∃ K : ℕ, ∀ y : ℝ,
      ‖𝓑(A, z, ((c : ℂ) + y * I)) * cos (π * ((c : ℂ) + y * I))‖ ≤
        C * (1 + |y|) ^ K * Real.exp (-(π / 2 - 2 * |arg z|) * |y|) := sorry

/-- **6.7** DLMF 12.5.8 on a straight separating line. -/
theorem parabolicCylinderU_eq_barnes_integral {a z : ℂ} (hz0 : z ≠ 0)
    (hz : |arg z| < 3 * π / 4) {c : ℝ} (hc : 0 < c) (hca : 2 * c < 1 / 2 + a.re) :
    parabolicCylinderU a z = exp (-z ^ 2 / 4) * z ^ (-a - 1 / 2) /
      (2 * π * Gamma (1 / 2 + a)) *
        ∫ y : ℝ, 𝓑((1 / 2 + a), z, ((c : ℂ) + y * I)) := sorry

/-- **6.7** DLMF 12.5.9 has `1/2 - a` and `|arg z| < π/4`. -/
theorem parabolicCylinderV_eq_barnes_integral {a z : ℂ} (hz0 : z ≠ 0)
    (hz : |arg z| < π / 4) {c : ℝ} (hc : 0 < c) (hca : 2 * c < 1 / 2 - a.re) :
    parabolicCylinderV a z = Real.sqrt (2 / π) * exp (z ^ 2 / 4) * z ^ (a - 1 / 2) /
      (2 * π * Gamma (1 / 2 - a)) *
        ∫ y : ℝ, 𝓑((1 / 2 - a), z, ((c : ℂ) + y * I)) *
          cos (π * ((c : ℂ) + y * I)) := sorry

/-- **6.7** The separating-contour formula for all regular `U` parameters.
`Nat.ceil (2 * c - (1/2 + a.re))` counts the poles to the left of the chosen line.
The residues are subtracted after dividing the upward contour integral by `2πi`. -/
theorem parabolicCylinderU_eq_barnes_integral_sub_residues {a z : ℂ}
    (ha : ∀ n : ℕ, a + 1 / 2 ≠ -(n : ℂ)) (hz0 : z ≠ 0)
    (hz : |arg z| < 3 * π / 4) {c : ℝ} (hc : 0 < c)
    (havoid : ∀ n : ℕ, 2 * c ≠ 1 / 2 + a.re + n) :
    parabolicCylinderU a z = exp (-z ^ 2 / 4) * z ^ (-a - 1 / 2) / Gamma (1 / 2 + a) *
      ((∫ y : ℝ, 𝓑((1 / 2 + a), z, ((c : ℂ) + y * I))) / (2 * π) -
        ∑ n ∈ Finset.range ⌈2 * c - (1 / 2 + a.re)⌉₊, 𝓡((1 / 2 + a), z, n)) := sorry

/-- **6.7** The separating-contour formula for all regular `V` parameters.
Its moving poles and excluded parameters are determined by `1/2 - a`. -/
theorem parabolicCylinderV_eq_barnes_integral_sub_residues {a z : ℂ}
    (ha : ∀ n : ℕ, 1 / 2 - a ≠ -(n : ℂ)) (hz0 : z ≠ 0)
    (hz : |arg z| < π / 4) {c : ℝ} (hc : 0 < c)
    (havoid : ∀ n : ℕ, 2 * c ≠ 1 / 2 - a.re + n) :
    parabolicCylinderV a z =
      Real.sqrt (2 / π) * exp (z ^ 2 / 4) * z ^ (a - 1 / 2) / Gamma (1 / 2 - a) *
        ((∫ y : ℝ, 𝓑((1 / 2 - a), z, ((c : ℂ) + y * I)) *
            cos (π * ((c : ℂ) + y * I))) / (2 * π) -
          ∑ n ∈ Finset.range ⌈2 * c - (1 / 2 - a.re)⌉₊,
            𝓡((1 / 2 - a), z, n) * cos (π * ((1 / 2 - a + n) / 2))) := sorry

/-! ### Layer 7: large-argument asymptotics -/

/-- **7.1** The rotated Laplace representation, for every complex `z`. -/
theorem parabolicCylinderU_eq_rotated_integral {a : ℂ} (ha : -1 / 2 < a.re)
    {θ : ℝ} (hθ : |θ| < π / 4) (z : ℂ) :
    Gamma (1 / 2 + a) * (exp (z ^ 2 / 4) * parabolicCylinderU a z) =
      exp (θ * I) * ∫ r in Ioi (0 : ℝ), exp (-z * exp (θ * I) * r) *
        ((r : ℂ) * exp (θ * I)) ^ (a - 1 / 2) *
          exp (-(((r : ℂ) * exp (θ * I)) ^ 2) / 2) := sorry

/-- **7.1** The expansion DLMF 12.9.1 of `U(a, z)` in `|ph z| ≤ 3π/4 − δ`. -/
theorem isBigO_parabolicCylinderU_sub_sum (a : ℂ) {δ : ℝ} (hδ : 0 < δ) (hδπ : δ < 3 * π / 4)
    (N : ℕ) :
    (fun z : ℂ => exp (z ^ 2 / 4) * z ^ (a + 1 / 2) * parabolicCylinderU a z -
        ∑ s ∈ Finset.range N,
          (-1) ^ s * (ascPochhammer ℂ (2 * s)).eval (1 / 2 + a) / (s ! * (2 * z ^ 2) ^ s))
      =O[sectorAtTop (3 * π / 4 - δ)] fun z => ‖z‖ ^ (-(2 * N : ℝ)) := sorry

/-- **7.2** The expansion DLMF 12.9.2 of `V(a, z)` in `|ph z| ≤ π/4 − δ`. -/
theorem isBigO_parabolicCylinderV_sub_sum (a : ℂ) {δ : ℝ} (hδ : 0 < δ) (hδπ : δ < π / 4)
    (N : ℕ) :
    (fun z : ℂ => Real.sqrt (π / 2) * exp (-z ^ 2 / 4) * z ^ (-a + 1 / 2) *
          parabolicCylinderV a z -
        ∑ s ∈ Finset.range N, (ascPochhammer ℂ (2 * s)).eval (1 / 2 - a) / (s ! * (2 * z ^ 2) ^ s))
      =O[sectorAtTop (π / 4 - δ)] fun z => ‖z‖ ^ (-(2 * N : ℝ)) := sorry

/-! The next local abbreviations are the envelopes and sums of 7.3 in logarithmic coordinates.
The powers inherited from `z = exp w` are written using `w` directly. -/

local notation "𝓔₋(" a ", " w ")" => exp (-exp (2 * w) / 4 - (a + 1 / 2) * w)
local notation "𝓔₊(" a ", " w ")" => exp (exp (2 * w) / 4 + (a - 1 / 2) * w)

local notation "𝓢₋(" a ", " N ", " w ")" =>
  (∑ s ∈ Finset.range N, (-1 : ℂ) ^ s * Polynomial.eval (1 / 2 + a) (ascPochhammer ℂ (2 * s)) /
    ((s ! : ℂ) * (2 : ℂ) ^ s) * exp (-(2 * (s : ℂ)) * w))

local notation "𝓢₊(" a ", " N ", " w ")" =>
  (∑ s ∈ Finset.range N, Polynomial.eval (1 / 2 - a) (ascPochhammer ℂ (2 * s)) /
    ((s ! : ℂ) * (2 : ℂ) ^ s) * exp (-(2 * (s : ℂ)) * w))

/-- **7.3** DLMF 12.9.3 on both strips of the logarithmic plane.
The comparison excludes the scalar prefactors; the `O` constant may depend on `a, σ, δ, N`. -/
theorem isBigO_parabolicCylinderU_adjacent_sub_sum (a : ℂ) {σ δ : ℝ}
    (hσ : σ = 1 ∨ σ = -1) (hδ : 0 < δ) (hδπ : δ < π / 2) (N : ℕ) :
    let C_U := (σ : ℂ) * I * Real.sqrt (2 * π) / Gamma (1 / 2 + a) * exp (-(σ : ℂ) * I * π * a)
    (fun w : ℂ => parabolicCylinderU a (exp w) - 𝓔₋(a, w) * 𝓢₋(a, N, w) -
        C_U * 𝓔₊(a, w) * 𝓢₊(a, N, w))
      =O[Filter.comap Complex.re atTop ⊓
        𝓟 {w : ℂ | π / 4 + δ ≤ σ * w.im ∧ σ * w.im ≤ 5 * π / 4 - δ}]
      (fun w : ℂ => (‖𝓔₋(a, w)‖ + ‖𝓔₊(a, w)‖) * Real.exp (-(2 * N : ℝ) * w.re)) := sorry

/-- **7.3** DLMF 12.9.4, also written in logarithmic coordinates.
These strips stay inside the principal argument range. The same unweighted envelope is used. -/
theorem isBigO_parabolicCylinderV_adjacent_sub_sum (a : ℂ) {σ δ : ℝ}
    (hσ : σ = 1 ∨ σ = -1) (hδ : 0 < δ) (hδπ : δ < π / 2) (N : ℕ) :
    let C_V := (σ : ℂ) * I / Gamma (1 / 2 - a)
    (fun w : ℂ => parabolicCylinderV a (exp w) -
        Real.sqrt (2 / π) * 𝓔₊(a, w) * 𝓢₊(a, N, w) - C_V * 𝓔₋(a, w) * 𝓢₋(a, N, w))
      =O[Filter.comap Complex.re atTop ⊓
        𝓟 {w : ℂ | -π / 4 + δ ≤ σ * w.im ∧ σ * w.im ≤ 3 * π / 4 - δ}]
      (fun w : ℂ => (‖𝓔₋(a, w)‖ + ‖𝓔₊(a, w)‖) * Real.exp (-(2 * N : ℝ) * w.re)) := sorry

/-- **7.5** `U(a, ·)` is, up to a constant factor, the only solution of Weber's equation that
tends to `0` along the positive real axis. -/
theorem exists_eq_const_mul_parabolicCylinderU {a : ℂ} {f : ℂ → ℂ} (hf : Differentiable ℂ f)
    (hode : ∀ z, deriv^[2] f z = (z ^ 2 / 4 + a) * f z)
    (hlim : Tendsto (fun x : ℝ => f x) atTop (𝓝 0)) :
    ∃ C : ℂ, f = fun z => C * parabolicCylinderU a z := sorry

/-! ### Layer 8: integrals and addition theorems -/

/-- **8.1** DLMF 12.12.1. -/
theorem integral_exp_mul_cpow_mul_parabolicCylinderU (a : ℂ) {μ : ℂ} (hμ : 0 < μ.re) :
    (∫ t in Ioi (0 : ℝ), exp (-(t : ℂ) ^ 2 / 4) * (t : ℂ) ^ (μ - 1) * parabolicCylinderU a t) =
      Real.sqrt π * (2 : ℂ) ^ (-(μ + a + 1 / 2) / 2) * Gamma μ / Gamma ((μ + a + 3 / 2) / 2) :=
  sorry

/-- **8.1** DLMF 12.12.2. -/
theorem integral_exp_three_mul_cpow_mul_parabolicCylinderU {a : ℂ} (ha : a.re < -1 / 2) :
    (∫ t in Ioi (0 : ℝ), exp (-3 * (t : ℂ) ^ 2 / 4) * (t : ℂ) ^ (-a - 3 / 2) *
        parabolicCylinderU a t) =
      (2 : ℂ) ^ (1 / 4 + a / 2) * Gamma (-a - 1 / 2) * cos (π * (a / 4 + 1 / 8)) := sorry

/-- **8.1** DLMF 12.12.3. -/
theorem integral_exp_mul_cpow_mul_parabolicCylinderU_div {a : ℂ} (ha : a.re < 1 / 2)
    {x : ℝ} (hx : 0 < x) :
    (∫ t in Ioi (0 : ℝ), exp (-(t : ℂ) ^ 2 / 4) * (t : ℂ) ^ (-a - 1 / 2) *
        parabolicCylinderU a t / ((x : ℂ) ^ 2 + (t : ℂ) ^ 2)) =
      Real.sqrt (π / 2) * Gamma (1 / 2 - a) * (x : ℂ) ^ (-a - 3 / 2) * exp ((x : ℂ) ^ 2 / 4) *
        parabolicCylinderU (-a) x := sorry

/-- **8.1** DLMF 12.12.4, with `Ū(a, z) = Γ(½ − a) V(a, z)` (DLMF 12.2.21) written out. -/
theorem parabolicCylinderU_sq_add_sq_eq_integral {a : ℂ} (ha : a.re < 1 / 2) (z : ℂ) :
    parabolicCylinderU a z ^ 2 + (Gamma (1 / 2 - a) * parabolicCylinderV a z) ^ 2 =
      (2 : ℂ) ^ (3 / 2 : ℂ) / π * Gamma (1 / 2 - a) *
        ∫ t in Ioi (0 : ℝ), exp (2 * a * t + z ^ 2 * Real.tanh t / 2) /
          Real.sqrt (Real.sinh (2 * t)) := sorry

/-- **8.2** The addition theorem DLMF 12.13.1. -/
theorem hasSum_parabolicCylinderU_add (a x y : ℂ) :
    HasSum (fun m : ℕ => exp (x * y / 2 + y ^ 2 / 4) * ((-y) ^ m / m !) *
      parabolicCylinderU (a - m) x) (parabolicCylinderU a (x + y)) := sorry

/-- **8.3** The rotational addition identity, including its cosine normalization.
The endpoint convergence conventions are specified separately in the README. -/
theorem hasSum_parabolicCylinderU_rotational_addition {a : ℂ} (ha : a.re ≤ -1 / 2)
    (x y : ℝ) {t : ℝ} (ht : 0 ≤ t) (htπ : t < π / 4) :
    HasSum (fun m : ℕ => (Real.cos t : ℂ) ^ (-a - 1 / 2) *
      exp (((x : ℂ) * Real.sin t - y * Real.cos t) ^ 2 / 4) *
      (-1 : ℂ) ^ m * (ascPochhammer ℂ m).eval (a + 1 / 2) / (m ! : ℂ) *
      (Real.tan t : ℂ) ^ m * parabolicCylinderU (a + m) x *
      parabolicCylinderU (-(m : ℂ) - 1 / 2) y)
      (parabolicCylinderU a (x * Real.cos t + y * Real.sin t)) := sorry

/-! ### Layer 9: the real solutions `W(a, ±x)` -/

/-- `W(a, 0)` (DLMF 12.14.1). -/
def parabolicCylinderWZero (a : ℝ) : ℝ :=
  2 ^ (-3 / 4 : ℝ) * Real.sqrt ‖Gamma (1 / 4 + I * a / 2) / Gamma (3 / 4 + I * a / 2)‖

/-- `W′(a, 0)` (DLMF 12.14.2). -/
def parabolicCylinderWDerivZero (a : ℝ) : ℝ :=
  -(2 ^ (-1 / 4 : ℝ)) * Real.sqrt ‖Gamma (3 / 4 + I * a / 2) / Gamma (1 / 4 + I * a / 2)‖

/-- The real solution `W(a, x)` of `w″ + (x²/4 − a) w = 0` with the initial values
DLMF 12.14.1–12.14.2. The complex expression is real on the real line (9.1). -/
def parabolicCylinderW (a x : ℝ) : ℝ :=
  (parabolicCylinderWZero a * parabolicCylinderEven (-(I * a)) (exp (π * I / 4) * x) +
    parabolicCylinderWDerivZero a *
      (exp (-(π * I / 4)) * parabolicCylinderOdd (-(I * a)) (exp (π * I / 4) * x))).re

/-- The continuous phase `φ₂(a) = ph Γ(½ + ia)` with `φ₂(0) = 0` (DLMF 12.14.7). -/
def gammaHalfPhase (a : ℝ) : ℝ :=
  ∫ t in (0 : ℝ)..a, (Complex.digamma (1 / 2 + t * I)).re

/-- **9.1** `W(a, ·)` solves the oscillatory equation DLMF 12.2.3. -/
theorem deriv_deriv_parabolicCylinderW (a x : ℝ) :
    deriv^[2] (parabolicCylinderW a) x = (a - x ^ 2 / 4) * parabolicCylinderW a x := sorry

/-- **9.2** `𝒲{W(a, x), W(a, −x)} = 1` (DLMF 12.14.3). -/
theorem parabolicCylinderW_mul_deriv_neg_sub (a x : ℝ) :
    parabolicCylinderW a x * deriv (fun t => parabolicCylinderW a (-t)) x -
      deriv (parabolicCylinderW a) x * parabolicCylinderW a (-x) = 1 := sorry

/-- **9.3** The phase identity `Γ(½ + ia) = |Γ(½ + ia)| e^{iφ₂(a)}`. -/
theorem Gamma_one_half_add_mul_I (a : ℝ) :
    Gamma (1 / 2 + a * I) = ‖Gamma (1 / 2 + a * I)‖ * exp (gammaHalfPhase a * I) := sorry

/-- **9.3** The connection formula DLMF 12.14.4. -/
theorem parabolicCylinderW_eq (a x : ℝ) :
    let k := Real.sqrt (1 + Real.exp (2 * π * a)) - Real.exp (π * a)
    let ρ := π / 8 + gammaHalfPhase a / 2
    (parabolicCylinderW a x : ℂ) = Real.sqrt (k / 2) * Real.exp (π * a / 4) *
      (exp (I * ρ) * parabolicCylinderU (I * a) (x * exp (-(π * I / 4))) +
        exp (-(I * ρ)) * parabolicCylinderU (-(I * a)) (x * exp (π * I / 4))) := sorry

/-- **9.6** DLMF 12.14.13; `ε = 1` and `ε = -1` select the upper and lower signs. -/
theorem parabolicCylinderW_zero_left {x : ℝ} (hx : 0 < x) (ε : ℝ) (hε : ε = 1 ∨ ε = -1) :
    (parabolicCylinderW 0 (ε * x) : ℂ) = (2 : ℂ) ^ (-(5 / 4 : ℂ)) * Real.sqrt (π * x) *
      (besselJ (-1 / 4) ((x : ℂ) ^ 2 / 4) - ε * besselJ (1 / 4) ((x : ℂ) ^ 2 / 4)) := sorry

/-- **9.6** DLMF 12.14.14, as the derivative of `t ↦ W(0, εt)`. -/
theorem deriv_parabolicCylinderW_zero_left {x : ℝ} (hx : 0 < x) (ε : ℝ) (hε : ε = 1 ∨ ε = -1) :
    (deriv (fun t => parabolicCylinderW 0 (ε * t)) x : ℂ) =
      -((2 : ℂ) ^ (-(9 / 4 : ℂ))) * x * Real.sqrt (π * x) *
        (besselJ (3 / 4) ((x : ℂ) ^ 2 / 4) + ε * besselJ (-3 / 4) ((x : ℂ) ^ 2 / 4)) := sorry

/-- **9.7** DLMF 12.14.17–12.14.23: the expansion of
`s(x) = e^{−iω}(√(x/2k) W(a, x) + i √(kx/2) W(a, −x))` as `x → +∞`. -/
theorem isBigO_parabolicCylinderW_sub_sum (a : ℝ) (N : ℕ) :
    let k := Real.sqrt (1 + Real.exp (2 * π * a)) - Real.exp (π * a)
    (fun x : ℝ =>
        exp (-((x ^ 2 / 4 - a * Real.log x + π / 4 + gammaHalfPhase a / 2 : ℝ) : ℂ) * I) *
          (Real.sqrt (x / (2 * k)) * parabolicCylinderW a x +
            I * Real.sqrt (k * x / 2) * parabolicCylinderW a (-x)) -
        ∑ r ∈ Finset.range N, (-I) ^ r * (ascPochhammer ℂ (2 * r)).eval (1 / 2 + I * a) /
          (2 ^ r * (r ! : ℂ) * (x : ℂ) ^ (2 * r)))
      =O[atTop] fun x : ℝ => x ^ (-(2 * N : ℝ)) := sorry

end TauCetiRoadmap.SpecialFunctionsParabolicCylinder
