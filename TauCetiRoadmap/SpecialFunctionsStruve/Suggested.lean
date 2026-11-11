module

public import Mathlib
public import TauCeti.Analysis.SpecialFunctions.RegularizedHypergeometric

/-!
# Struve and related functions: target signatures

This file states the headline theorems of the roadmap against the pinned Mathlib and Tau Ceti,
one or more per layer, as a check that the conventions of `README.md` can be stated. `README.md`
is the definitive document and states every target; the statements here are a selection of
them, and discharging them finishes neither a layer nor the roadmap.

The definitions below are roadmap-local copies. `besselY` and `besselI` copy the definitions that
SpecialFunctionsBessel pins, `scorerHi` copies SpecialFunctionsAiry's, and `fresnelC`, `fresnelS`
copy SpecialFunctionsEiLiErfIncompleteGamma's, and `eulerIntegral`, `IsEulerContinuation` and
`gaussHypergeometric` copy SpecialFunctionsHypergeometric's Gauss function, which the Laplace
representation of `S_{μ,ν}` uses, so that this file imports only Mathlib and Tau Ceti. In Tau Ceti
the Bessel functions and the functions of this roadmap live in `Complex`, beside Mathlib's
`Complex.besselJ`; here they live in this file's `Complex` subnamespace. The functions of this
roadmap copy the definitions of `README.md` with their intended bodies, so that the conventions are
checked by the compiler: orders first, then the argument; Mathlib's regularized `₁F₂` series
`Complex.regularizedHGFun {1} {b₁, b₂}` (written `𝐅₁₂(b₁, b₂)` here); principal powers; the limit in
the first order at the exceptional parameters of `S_{μ,ν}`; `deriv` in the order at integer orders
for `𝐀_ν`; and the coefficients of the scaled expansions as power-series coefficients. Expansions
are written out as one `IsBigO` statement per truncation order, which is AsymptoticExpansions'
`Asymptotics.HasAsymptoticExpansion` unfolded. Theorems are stated with `sorry`.
-/

@[expose] public section

noncomputable section

namespace TauCetiRoadmap.SpecialFunctionsStruve

open Complex Filter Topology Asymptotics Set MeasureTheory
open scoped Real Nat

/-- Mathlib's regularized `₀F₁`: `𝐅(b) x = ∑ₙ xⁿ / (n! Γ(b + n))`. -/
local notation "𝐅(" b ")" => Complex.regularizedHGFun (0 : Multiset ℂ) ({b} : Multiset ℂ)

/-- Mathlib's regularized `₁F₂` with numerator `1`: `𝐅₁₂(b₁, b₂) x = ∑ₖ xᵏ / (Γ(b₁ + k) Γ(b₂ + k))`.
-/
local notation "𝐅₁₂(" b₁ ", " b₂ ")" =>
  Complex.regularizedHGFun ({1} : Multiset ℂ) ({b₁, b₂} : Multiset ℂ)

/-- The sector filter "`z → ∞` in `|ph z| ≤ θ`". -/
local notation "sectorAtTop " θ =>
  Bornology.cobounded ℂ ⊓ 𝓟 (Set.ofPred fun z : ℂ => |Complex.arg z| ≤ θ)

/-! ### Mathlib declarations that `README.md` cites -/

#check @_root_.Complex.Gamma_add_one
#check @_root_.Complex.Gamma_mul_Gamma_add_half
#check @_root_.Complex.Gamma_mul_Gamma_one_sub
#check @_root_.Complex.Gamma_ne_zero
#check @_root_.Complex.analyticAt_regularizedHGFun_of_card_le
#check @_root_.Complex.analyticOnNhd_besselJ
#check @_root_.Complex.besselJ_def
#check @_root_.Complex.besselJ_int_neg
#check @_root_.Complex.differentiable_one_div_Gamma
#check @_root_.Complex.integral_boundary_rect_eq_zero_of_differentiableOn
#check @_root_.Complex.radius_regularizedHGFunSeries_eq_top
#check @_root_.Complex.two_mul_self_mul_besselJ
#check @_root_.Complex.hasSum_regularizedHGFun

namespace Complex

/-! ### Local copies of the suppliers' definitions -/

open scoped Classical in
/-- SpecialFunctionsBessel's `Y_ν`: DLMF 10.2.3 off the integers and 10.2.4 at integer order. -/
def besselY (ν z : ℂ) : ℂ :=
  if ∃ n : ℤ, (n : ℂ) = ν then
    (deriv (fun μ => besselJ μ z) ν + Complex.cos (ν * π) * deriv (fun μ => besselJ μ z) (-ν)) /
      (π : ℂ)
  else (besselJ ν z * Complex.cos (ν * π) - besselJ (-ν) z) / Complex.sin (ν * π)

/-- SpecialFunctionsBessel's `I_ν(z) = (z/2)^ν 𝐅(ν + 1, (z/2)²)`. -/
def besselI (ν z : ℂ) : ℂ := (z / 2) ^ ν * 𝐅(ν + 1) ((z / 2) ^ 2)

/-- SpecialFunctionsAiry's Scorer function `Hi(z) = π⁻¹ ∫₀^∞ exp(−t³/3 + z t) dt`. -/
def scorerHi (z : ℂ) : ℂ :=
  (π : ℂ)⁻¹ * ∫ t in Ioi (0 : ℝ), cexp (-(t : ℂ) ^ 3 / 3 + z * t)

/-- SpecialFunctionsEiLiErfIncompleteGamma's Fresnel integral `C(z) = ∫₀^z cos(πt²/2) dt`. -/
def fresnelC (z : ℂ) : ℂ :=
  ∫ s in (0 : ℝ)..1, z * Complex.cos (π * ((s : ℂ) * z) ^ 2 / 2)

/-- SpecialFunctionsEiLiErfIncompleteGamma's Fresnel integral `S(z) = ∫₀^z sin(πt²/2) dt`. -/
def fresnelS (z : ℂ) : ℂ :=
  ∫ s in (0 : ℝ)..1, z * Complex.sin (π * ((s : ℂ) * z) ^ 2 / 2)

/-- Euler's integral `(Γ(b) Γ(c − b))⁻¹ ∫₀¹ t^{b−1} (1 − t)^{c−b−1} (1 − zt)^{−a} dt`
(DLMF 15.6.1), with principal powers; a copy of SpecialFunctionsHypergeometric's definition. -/
def eulerIntegral (a b c z : ℂ) : ℂ :=
  (Gamma b * Gamma (c - b))⁻¹ *
    ∫ t in (0 : ℝ)..1, (t : ℂ) ^ (b - 1) * (1 - (t : ℂ)) ^ (c - b - 1) * (1 - z * t) ^ (-a)

/-- `G` continues Euler's integral: at every `z` of the cut plane it is entire in `b` and in `c`,
and it equals Euler's integral where `0 < Re b < Re c`; a copy of SpecialFunctionsHypergeometric's
definition. -/
def IsEulerContinuation (G : ℂ → ℂ → ℂ → ℂ → ℂ) : Prop :=
  (∀ a c z, 1 - z ∈ slitPlane → Differentiable ℂ fun b => G a b c z) ∧
  (∀ a b z, 1 - z ∈ slitPlane → Differentiable ℂ fun c => G a b c z) ∧
  (∀ a b c z, 1 - z ∈ slitPlane → 0 < b.re → b.re < c.re → G a b c z = eulerIntegral a b c z)

open scoped Classical in
/-- The principal branch of the Gauss function `F(a, b; c; z) = Γ(c) 𝐅(a, b; c; z)` on the cut
plane, with the junk value `0` off it; a copy of SpecialFunctionsHypergeometric's
`regularizedGaussHypergeometric` and `gaussHypergeometric`, merged into one definition. -/
def gaussHypergeometric (a b c z : ℂ) : ℂ :=
  Gamma c * if h : ∃ G, IsEulerContinuation G then
    if 1 - z ∈ slitPlane then h.choose a b c z else 0
  else 0

/-! ### The definitions of this roadmap -/

/-- The Struve function `𝐇_ν(z) = (z/2)^{ν+1} 𝐅₁₂(3/2, ν + 3/2; −z²/4)` (DLMF 11.2.1). -/
def struveH (ν z : ℂ) : ℂ := (z / 2) ^ (ν + 1) * 𝐅₁₂(3 / 2, ν + 3 / 2) (-(z ^ 2) / 4)

/-- The modified Struve function `𝐋_ν(z) = (z/2)^{ν+1} 𝐅₁₂(3/2, ν + 3/2; z²/4)` (DLMF 11.2.2). -/
def struveL (ν z : ℂ) : ℂ := (z / 2) ^ (ν + 1) * 𝐅₁₂(3 / 2, ν + 3 / 2) (z ^ 2 / 4)

/-- `𝐊_ν = 𝐇_ν − Y_ν` (DLMF 11.2.5). -/
def struveK (ν z : ℂ) : ℂ := struveH ν z - besselY ν z

/-- `𝐌_ν = 𝐋_ν − I_ν` (DLMF 11.2.6). -/
def struveM (ν z : ℂ) : ℂ := struveL ν z - besselI ν z

/-- The Lommel function `s_{μ,ν}(z) = 2^{μ−1} Γ(a) Γ(b) (z/2)^{μ+1} 𝐅₁₂(a + 1, b + 1; −z²/4)`,
`a = ½(μ − ν + 1)`, `b = ½(μ + ν + 1)`, which is DLMF's series 11.9.3 at regular parameters. -/
def lommelSmallS (μ ν z : ℂ) : ℂ :=
  2 ^ (μ - 1) * Gamma ((μ - ν + 1) / 2) * Gamma ((μ + ν + 1) / 2) * (z / 2) ^ (μ + 1) *
    𝐅₁₂((μ - ν + 3) / 2, (μ + ν + 3) / 2) (-(z ^ 2) / 4)

/-- The right side of DLMF 11.9.5, `s_{μ,ν} + 2^{μ−1} Γ(a) Γ(b) (sin(½(μ − ν)π) J_ν −
cos(½(μ − ν)π) Y_ν)`, meaningful at regular parameters. -/
def lommelCapitalSFormula (μ ν z : ℂ) : ℂ :=
  lommelSmallS μ ν z + 2 ^ (μ - 1) * Gamma ((μ - ν + 1) / 2) * Gamma ((μ + ν + 1) / 2) *
    (Complex.sin ((μ - ν) * π / 2) * besselJ ν z - Complex.cos ((μ - ν) * π / 2) * besselY ν z)

open scoped Classical in
/-- The Lommel function `S_{μ,ν}(z)` (DLMF 11.9.5): the formula at regular parameters, and its
limit in `μ` where `μ ± ν ∈ {−1, −3, −5, …}`. -/
def lommelCapitalS (μ ν z : ℂ) : ℂ :=
  if ∃ n : ℕ, μ - ν = -(2 * n + 1) ∨ μ + ν = -(2 * n + 1) then
    limUnder (𝓝[≠] μ) (fun μ' => lommelCapitalSFormula μ' ν z)
  else lommelCapitalSFormula μ ν z

/-- The Anger function `𝐉_ν(z) = π⁻¹ ∫₀^π cos(νθ − z sin θ) dθ` (DLMF 11.10.1). -/
def angerJ (ν z : ℂ) : ℂ :=
  (π : ℂ)⁻¹ * ∫ θ in (0 : ℝ)..π, Complex.cos (ν * θ - z * Real.sin θ)

/-- The Weber function `𝐄_ν(z) = π⁻¹ ∫₀^π sin(νθ − z sin θ) dθ` (DLMF 11.10.2). -/
def weberE (ν z : ℂ) : ℂ :=
  (π : ℂ)⁻¹ * ∫ θ in (0 : ℝ)..π, Complex.sin (ν * θ - z * Real.sin θ)

open scoped Classical in
/-- The Anger–Weber function `𝐀_ν(z) = (𝐉_ν(z) − J_ν(z))/sin νπ` off the integers (DLMF 11.10.15)
and its limit `(π cos nπ)⁻¹ ∂_ν(𝐉_ν(z) − J_ν(z))|_{ν=n}` at integer order. -/
def angerWeberA (ν z : ℂ) : ℂ :=
  if ∃ n : ℤ, (n : ℂ) = ν then
    deriv (fun μ => angerJ μ z - besselJ μ z) ν / ((π : ℂ) * Complex.cos (ν * π))
  else (angerJ ν z - besselJ ν z) / Complex.sin (ν * π)

/-- The coefficients `c_k(λ)` of DLMF 11.6.6: `λ` times the coefficient of `tᵏ` in
`(1 + t²)^{−1/2} (t/(λt − ln(1 + t²)))^{k+1}`. -/
def struveScaledCoeff (lam : ℂ) (k : ℕ) : ℂ :=
  let q : PowerSeries ℂ := PowerSeries.mk fun n =>
    if Even n then (-1) ^ (n / 2) * (ascPochhammer ℂ (n / 2)).eval (1 / 2) / ((n / 2)! : ℂ)
    else 0
  let d : PowerSeries ℂ := PowerSeries.mk fun n =>
    if n = 0 then lam else if Odd n then (-1) ^ ((n + 1) / 2) / (((n + 1) / 2 : ℕ) : ℂ) else 0
  lam * PowerSeries.coeff k (q * d⁻¹ ^ (k + 1))

/-- The coefficients `a_k(λ)` of DLMF 11.11.8: the coefficient of `t^{2k}` in
`(t/(t + λ sinh t))^{2k+1}`. -/
def angerScaledCoeff (lam : ℂ) (k : ℕ) : ℂ :=
  let e : PowerSeries ℂ := PowerSeries.mk fun n =>
    if Even n then (((n + 1)! : ℕ) : ℂ)⁻¹ else 0
  PowerSeries.coeff (2 * k) ((1 + PowerSeries.C lam * e)⁻¹ ^ (2 * k + 1))

/-! ## Layer 1: definitions and the equations -/

/-- DLMF 11.2.1: the Struve series. -/
theorem hasSum_struveH (ν : ℂ) {z : ℂ} (hz : z ∈ slitPlane) :
    HasSum (fun k : ℕ => (-1) ^ k * (z / 2) ^ (2 * k + ν + 1) /
      (Gamma (k + 3 / 2) * Gamma (k + ν + 3 / 2))) (struveH ν z) := by
  sorry

/-- DLMF 11.2.7: Struve's equation, with a reciprocal Gamma factor. -/
theorem struveH_ode (ν : ℂ) {z : ℂ} (hz : z ∈ slitPlane) :
    deriv^[2] (struveH ν) z + deriv (struveH ν) z / z + (1 - ν ^ 2 / z ^ 2) * struveH ν z =
      (z / 2) ^ (ν - 1) * ((Real.sqrt π : ℂ) * Gamma (ν + 1 / 2))⁻¹ := by
  sorry

/-- DLMF 11.2.11: the general solution of Struve's equation on the slit plane. -/
theorem struve_general_solution (ν : ℂ) (w : ℂ → ℂ) (hw : DifferentiableOn ℂ w slitPlane) :
    (∀ z ∈ slitPlane, deriv^[2] w z + deriv w z / z + (1 - ν ^ 2 / z ^ 2) * w z =
      (z / 2) ^ (ν - 1) * ((Real.sqrt π : ℂ) * Gamma (ν + 1 / 2))⁻¹) ↔
    ∃ A B : ℂ, ∀ z ∈ slitPlane, w z = struveH ν z + A * besselJ ν z + B * besselY ν z := by
  sorry

/-! ## Layer 2: basic properties -/

/-- DLMF 11.4.5. -/
theorem struveH_half {z : ℂ} (hz : z ∈ slitPlane) :
    struveH (1 / 2) z = (2 / (π * z)) ^ (1 / 2 : ℂ) * (1 - Complex.cos z) := by
  sorry

/-- DLMF 11.4.14 with the corrected bound 11.4.15. -/
theorem struveH_relative_bound {ν z : ℂ} (hz : z ≠ 0) {d : ℝ} (hd : 0 < d)
    (hdν : ∀ n : ℕ, d ≤ ‖ν + 3 / 2 + n‖) :
    ∃ θ : ℂ, struveH ν z = 2 * (z / 2) ^ (ν + 1) * ((Real.sqrt π : ℂ) * Gamma (ν + 3 / 2))⁻¹ *
      (1 + θ) ∧ ‖θ‖ < 2 / 3 * (Real.exp (‖z‖ ^ 2 / (4 * d)) - 1) := by
  sorry

/-- DLMF 11.4.23. -/
theorem struveH_recurrence (ν : ℂ) {z : ℂ} (hz : z ∈ slitPlane) :
    struveH (ν - 1) z + struveH (ν + 1) z =
      2 * ν / z * struveH ν z + (z / 2) ^ ν * ((Real.sqrt π : ℂ) * Gamma (ν + 3 / 2))⁻¹ := by
  sorry

/-! ## Layer 3: integral representations -/

/-- DLMF 11.5.1. -/
theorem struveH_eq_integral {ν : ℂ} (hν : -1 / 2 < ν.re) {z : ℂ} (hz : z ∈ slitPlane) :
    struveH ν z = 2 * (z / 2) ^ ν * ((Real.sqrt π : ℂ) * Gamma (ν + 1 / 2))⁻¹ *
      ∫ t in (0 : ℝ)..1, (1 - (t : ℂ) ^ 2) ^ (ν - 1 / 2) * Complex.sin (z * t) := by
  sorry

/-- DLMF 11.5.2. -/
theorem struveK_eq_integral {ν : ℂ} {z : ℂ} (hz : 0 < z.re) :
    struveK ν z = 2 * (z / 2) ^ ν * ((Real.sqrt π : ℂ) * Gamma (ν + 1 / 2))⁻¹ *
      ∫ t in Ioi (0 : ℝ), cexp (-z * t) * (1 + (t : ℂ) ^ 2) ^ (ν - 1 / 2) := by
  sorry

/-- DLMF 11.5.8, along the line `Re s = c` parametrized by `y`, with `ds = i dy`. -/
theorem struveH_mellinBarnes {ν : ℂ} {x c : ℝ} (hx : 0 < x) (hc : -1 < c) (hc0 : c < 0)
    (hνc : -1 < ν.re + 2 * c) :
    I * ∫ y : ℝ, (π / Complex.sin (π * (c + y * I))) *
      (Gamma (3 / 2 + (c + y * I)) * Gamma (3 / 2 + ν + (c + y * I)))⁻¹ *
        ((x : ℂ) ^ 2 / 4) ^ (c + y * I) =
      -2 * π * I * ((x : ℂ) / 2) ^ (-ν - 1) * struveH ν x := by
  sorry

/-! ## Layer 4: asymptotic expansions of the Struve functions -/

/-- DLMF 11.6.1. -/
theorem isBigO_struveK_sub_sum (ν : ℂ) {δ : ℝ} (hδ : 0 < δ) (hδπ : δ < π) (N : ℕ) :
    (fun z => struveK ν z - ∑ k ∈ Finset.range N,
        (π : ℂ)⁻¹ * Gamma (k + 1 / 2) * (Gamma (ν + 1 / 2 - k))⁻¹ * (z / 2) ^ (ν - 2 * k - 1))
      =O[sectorAtTop (π - δ)] fun z => z ^ (ν - 2 * N - 1) := by
  sorry

/-- DLMF 11.6.6: the expansion of `𝐊_ν(λν)` for fixed `λ > 1`. -/
theorem isBigO_struveK_scaled {lam : ℝ} (hlam : 1 < lam) {δ : ℝ} (hδ : 0 < δ) (hδπ : δ < π / 2)
    (N : ℕ) :
    (fun ν => struveK ν (lam * ν) - (lam * ν / 2) ^ (ν - 1) *
        ((Real.sqrt π : ℂ) * Gamma (ν + 1 / 2))⁻¹ *
          ∑ k ∈ Finset.range N, (k ! : ℂ) * struveScaledCoeff lam k * ν ^ (-(k : ℤ)))
      =O[sectorAtTop (π / 2 - δ)] fun ν => (lam * ν / 2) ^ (ν - 1) *
        ((Real.sqrt π : ℂ) * Gamma (ν + 1 / 2))⁻¹ * ν ^ (-(N : ℤ)) := by
  sorry

/-- DLMF 11.6.9. -/
theorem struveL_isEquivalent_besselI {lam : ℝ} (hlam : 0 < lam) {δ : ℝ} (hδ : 0 < δ)
    (hδπ : δ < π / 2) :
    (fun ν => struveL ν (lam * ν)) ~[sectorAtTop (π / 2 - δ)] fun ν => besselI ν (lam * ν) := by
  sorry

/-! ## Layer 5: integrals -/

/-- DLMF 10.22.2 for `J`: an antiderivative of `z^ν J_ν(z)`, for `ν + ½` not a pole of `Γ`. -/
theorem hasDerivAt_besselJ_struveH {ν : ℂ} (hν : ∀ n : ℕ, ν + 1 / 2 ≠ -n) {z : ℂ}
    (hz : z ∈ slitPlane) :
    HasDerivAt (fun z => (Real.sqrt π : ℂ) * 2 ^ (ν - 1) * Gamma (ν + 1 / 2) * z *
        (besselJ ν z * struveH (ν - 1) z - besselJ (ν - 1) z * struveH ν z))
      (z ^ ν * besselJ ν z) z := by
  sorry

/-- DLMF 11.7.12 with the corrected hypotheses `Re μ, Re ν > −3/2`. -/
theorem integral_struveH_mul_struveH {μ ν : ℂ} (h : 0 < (μ + ν).re) (hμ : -3 / 2 < μ.re)
    (hν : -3 / 2 < ν.re) :
    Tendsto (fun R : ℝ => ∫ t in (0 : ℝ)..R, (t : ℂ) ^ (-μ - ν) * struveH μ t * struveH ν t) atTop
      (𝓝 ((Real.sqrt π : ℂ) * Gamma (μ + ν) * (2 ^ (μ + ν) * Gamma (μ + ν + 1 / 2) *
        Gamma (μ + 1 / 2) * Gamma (ν + 1 / 2))⁻¹)) := by
  sorry

/-! ## Layer 6: Lommel functions -/

/-- `μ ↦ S_{μ,ν}(z)` is entire: the exceptional parameters are removable. -/
theorem differentiable_lommelCapitalS (ν : ℂ) {z : ℂ} (hz : z ∈ slitPlane) :
    Differentiable ℂ fun μ => lommelCapitalS μ ν z := by
  sorry

/-- DLMF 11.9.1 for `S_{μ,ν}`, at all parameters. -/
theorem lommelCapitalS_ode (μ ν : ℂ) {z : ℂ} (hz : z ∈ slitPlane) :
    deriv^[2] (lommelCapitalS μ ν) z + deriv (lommelCapitalS μ ν) z / z +
      (1 - ν ^ 2 / z ^ 2) * lommelCapitalS μ ν z = z ^ (μ - 1) := by
  sorry

/-- DLMF 11.9.9. -/
theorem isBigO_lommelCapitalS_sub_sum (μ ν : ℂ) {δ : ℝ} (hδ : 0 < δ) (hδπ : δ < π) (N : ℕ) :
    (fun z => lommelCapitalS μ ν z - z ^ (μ - 1) * ∑ k ∈ Finset.range N,
        (-1) ^ k * (∏ m ∈ Finset.range k, ((-μ + 2 * (m + 1) - 1) ^ 2 - ν ^ 2)) *
          z ^ (-2 * (k : ℂ)))
      =O[sectorAtTop (π - δ)] fun z => z ^ (μ - 1 - 2 * N) := by
  sorry

/-- The Laplace representation of `S_{μ,ν}` (6.3), with the Gauss function. -/
theorem lommelCapitalS_eq_laplace (μ ν : ℂ) {z : ℂ} (hz : 0 < z.re) :
    lommelCapitalS μ ν z = z ^ μ * ∫ t in Ioi (0 : ℝ), cexp (-z * t) *
      gaussHypergeometric ((1 - μ + ν) / 2) ((1 - μ - ν) / 2) (1 / 2) (-(t : ℂ) ^ 2) := by
  sorry

/-! ## Layer 7: Anger–Weber functions -/

/-- `ν ↦ 𝐀_ν(z)` is entire. -/
theorem differentiable_angerWeberA {z : ℂ} (hz : z ∈ slitPlane) :
    Differentiable ℂ fun ν => angerWeberA ν z := by
  sorry

/-- DLMF 11.10.4, for `Re z > 0` and for `Re z = 0`, `Re ν > 0`. -/
theorem angerWeberA_eq_integral {ν z : ℂ} (hz : 0 < z.re ∨ (z.re = 0 ∧ 0 < ν.re)) :
    angerWeberA ν z = (π : ℂ)⁻¹ * ∫ t in Ioi (0 : ℝ), cexp (-ν * t - z * Real.sinh t) := by
  sorry

/-- DLMF 11.10.15, for all orders. -/
theorem angerJ_eq_besselJ_add (ν : ℂ) {z : ℂ} (hz : z ∈ slitPlane) :
    angerJ ν z = besselJ ν z + Complex.sin (ν * π) * angerWeberA ν z := by
  sorry

/-- DLMF 11.10.19, with `w = (2z/π)^{1/2}`. -/
theorem angerJ_neg_half {z : ℂ} (hz : z ∈ slitPlane) :
    angerJ (-1 / 2) z = (π * z / 2) ^ (-1 / 2 : ℂ) *
      ((fresnelC ((2 * z / π) ^ (1 / 2 : ℂ)) + fresnelS ((2 * z / π) ^ (1 / 2 : ℂ))) *
          Complex.cos z -
        (fresnelC ((2 * z / π) ^ (1 / 2 : ℂ)) - fresnelS ((2 * z / π) ^ (1 / 2 : ℂ))) *
          Complex.sin z) := by
  sorry

/-! ## Layer 8: asymptotic expansions of the Anger–Weber functions -/

/-- DLMF 11.11.6 with the corrected error term `O(e^{π|Im ν|} ν^{−2})` in the bracket. -/
theorem isBigO_weberE_large_order (z : ℂ) {ε : ℝ} (hε : 0 < ε) :
    (fun ν => π * ν / 2 * weberE ν z - Complex.sin (π * ν / 2) ^ 2 -
        ν * z / (ν ^ 2 - 1) * Complex.cos (π * ν / 2) ^ 2)
      =O[Bornology.cobounded ℂ ⊓ 𝓟 {ν | ∀ n : ℤ, ε ≤ ‖ν - n‖}]
        fun ν => (Real.exp (π * |ν.im|) : ℂ) * ν ^ (-2 : ℤ) := by
  sorry

/-- DLMF 11.11.8: the expansion of `𝐀_ν(λν)` for fixed `λ > 0`, in `|ph ν| ≤ π − θ(λ) − δ` with
`θ(λ) = arctan(−μ(λ)/π)` for `0 < λ < 1` (`μ(λ)` of 11.11.12) and `θ(λ) = 0` for `λ ≥ 1`. For
`λ ≥ 1` the real square root is `0`, the `arctan` term is at most `0`, and the `max` gives `0`.
DLMF states the expansion in `|ph ν| ≤ π − δ`, which is false for `0 < λ < 1`. -/
theorem isBigO_angerWeberA_scaled {lam : ℝ} (hlam : 0 < lam) {δ : ℝ} (hδ : 0 < δ) (hδπ : δ < π)
    (N : ℕ) :
    (fun ν => angerWeberA ν (lam * ν) - (π : ℂ)⁻¹ *
        ∑ k ∈ Finset.range N, ((2 * k)! : ℂ) * angerScaledCoeff lam k * ν ^ (-(2 * k + 1 : ℤ)))
      =O[sectorAtTop (π - max 0 (Real.arctan
          ((Real.log ((1 + √(1 - lam ^ 2)) / lam) - √(1 - lam ^ 2)) / π)) - δ)]
        fun ν => ν ^ (-(2 * N + 1 : ℤ)) := by
  sorry

/-- DLMF 11.11.17: the transition region, as `ν → ∞` in `|ph ν| ≤ π − δ`, uniformly for
`|a| ≤ M`. -/
theorem isBigO_angerWeberA_transition {M δ : ℝ} (hM : 0 < M) (hδ : 0 < δ) (hδπ : δ < π) :
    (fun p : ℂ × ℂ => angerWeberA (-p.1) (p.1 + p.2 * p.1 ^ (1 / 3 : ℂ)) -
        2 ^ (1 / 3 : ℂ) * p.1 ^ (-1 / 3 : ℂ) * scorerHi (-2 ^ (1 / 3 : ℂ) * p.2))
      =O[comap Prod.fst (sectorAtTop (π - δ)) ⊓ 𝓟 {p | ‖p.2‖ ≤ M}] fun p => p.1⁻¹ := by
  sorry

/-- DLMF 11.11.18, for real `ν → +∞` only. -/
theorem angerJ_self_isEquivalent :
    (fun ν : ℝ => angerJ ν ν) ~[atTop]
      fun ν => 2 ^ (1 / 3 : ℂ) / (3 ^ (2 / 3 : ℂ) * Gamma (2 / 3) * (ν : ℂ) ^ (1 / 3 : ℂ)) := by
  sorry

end Complex

end TauCetiRoadmap.SpecialFunctionsStruve
