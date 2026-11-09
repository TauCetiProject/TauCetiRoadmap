module

public import Mathlib
public import TauCeti.Analysis.SpecialFunctions.BesselI
public import TauCeti.Analysis.SpecialFunctions.RegularizedHypergeometric

/-!
# Bessel functions: target signatures

This file states the headline theorems of the roadmap against the pinned Mathlib and Tau Ceti,
one or more per layer. The definitive document is `README.md`, which states every target; this
file states a selection of them, and discharging it finishes neither a layer nor the roadmap.

Two headlines cannot be stated at the pins, because their carriers belong to roadmaps that are
not yet in Tau Ceti: the order derivatives 10.15.6–10.15.9 of 4.2 need `sinIntegral` and
`cosIntegral` of SpecialFunctionsEiLiErfIncompleteGamma, and the relations of Layer 11 to the
parabolic cylinder functions need `parabolicCylinderU` and `Real.parabolicCylinderW` of
SpecialFunctionsParabolicCylinder. The continued fraction 10.10.1 of 4.1 is stated with Mathlib's
`GenContFract`. The Airy relation of Layer 11 is stated with a roadmap-local copy of
SpecialFunctionsAiry's pinned `Ai`, and the agreement of `K_ν` with AnalyticNumberTheoryPartI's
positive-axis `besselK` with a roadmap-local copy of that definition.

The definitions below are roadmap-local copies of the definitions `README.md` pins. In Tau Ceti
the complex functions live in `Complex`, beside Mathlib's `Complex.besselJ`, and the real
functions, zeros, modulus and phase functions and Kelvin functions live in `Real`, beside Tau
Ceti's `Real.besselI`; here they live in this file's `Complex` and `Real` subnamespaces. They are
stated with their intended bodies so that the conventions are checked by the compiler: Mathlib's
regularized `₀F₁` series `Complex.regularizedHGFun 0 {b}` (written `𝐅(b)` here), principal
complex powers, `deriv` in the order at integer orders, the zero-counting definition of the
zeros, the integral definitions of the phases and the sector filter
`Bornology.cobounded ℂ ⊓ 𝓟 {z | |arg z| ≤ θ}`. Theorems are stated with `sorry`.

The general tools (Watson's lemma, saddle points, the Liouville–Green theory, reversion and the
Mellin tools) belong to the AsymptoticExpansions roadmap and are not restated here. Expansions
are written out as one `IsBigO` statement per truncation order, which is AsymptoticExpansions'
`Asymptotics.HasAsymptoticExpansion` unfolded, so that this file needs no import from that
roadmap.
-/

@[expose] public section

noncomputable section

namespace TauCetiRoadmap.SpecialFunctionsBessel

open Complex Filter Topology Asymptotics Set MeasureTheory
open scoped Real Nat

/-- Mathlib's regularized `₀F₁`: `𝐅(b) x = ∑ₙ xⁿ / (n! Γ(b + n))`. -/
local notation "𝐅(" b ")" => Complex.regularizedHGFun (0 : Multiset ℂ) ({b} : Multiset ℂ)

/-- Olver's regularized Kummer function `𝐌(a, b, x) = M(a, b, x) / Γ(b)`. -/
local notation "𝐌(" a ", " b ")" =>
  Complex.regularizedHGFun ({a} : Multiset ℂ) ({b} : Multiset ℂ)

/-- The sector filter "`z → ∞` in `|ph z| ≤ θ`". -/
local notation "sectorAtTop " θ =>
  Bornology.cobounded ℂ ⊓ 𝓟 (Set.ofPred fun z : ℂ => |Complex.arg z| ≤ θ)

/-! ### Definitions: complex functions -/

namespace Complex

open scoped Classical in
/-- The Bessel function of the second kind `Y_ν(z)`: DLMF 10.2.3 off the integers and DLMF 10.2.4,
`Y_n = π⁻¹ (∂_ν J_ν|_{ν=n} + (−1)ⁿ ∂_ν J_ν|_{ν=−n})`, at integer order, with `(−1)ⁿ` written
`cos(nπ)`. -/
def besselY (ν z : ℂ) : ℂ :=
  if ∃ n : ℤ, (n : ℂ) = ν then
    (deriv (fun μ => besselJ μ z) ν + Complex.cos (ν * π) * deriv (fun μ => besselJ μ z) (-ν)) /
      (π : ℂ)
  else (besselJ ν z * Complex.cos (ν * π) - besselJ (-ν) z) / Complex.sin (ν * π)

/-- The Hankel function `H⁽¹⁾_ν = J_ν + i Y_ν` (DLMF 10.4.3). -/
def hankelH1 (ν z : ℂ) : ℂ := besselJ ν z + I * besselY ν z

/-- The Hankel function `H⁽²⁾_ν = J_ν − i Y_ν` (DLMF 10.4.3). -/
def hankelH2 (ν z : ℂ) : ℂ := besselJ ν z - I * besselY ν z

/-- The modified Bessel function `I_ν(z) = (z/2)^ν 𝐅(ν + 1, (z/2)²)` (DLMF 10.25.2). -/
def besselI (ν z : ℂ) : ℂ := (z / 2) ^ ν * 𝐅(ν + 1) ((z / 2) ^ 2)

open scoped Classical in
/-- The modified Bessel function `K_ν(z)`: DLMF 10.27.4 off the integers and DLMF 10.27.5,
`K_n = ½ (−1)^{n−1} (∂_ν I_ν|_{ν=n} + ∂_ν I_ν|_{ν=−n})`, at integer order, with `(−1)^{n−1}`
written `−cos(nπ)`. -/
def besselK (ν z : ℂ) : ℂ :=
  if ∃ n : ℤ, (n : ℂ) = ν then
    -Complex.cos (ν * π) / 2 *
      (deriv (fun μ => besselI μ z) ν + deriv (fun μ => besselI μ z) (-ν))
  else (π : ℂ) / 2 * (besselI (-ν) z - besselI ν z) / Complex.sin (ν * π)

/-- The spherical Bessel function `𝗃_n(z) = (√π/2) (z/2)ⁿ 𝐅(n + 3/2, −(z/2)²)`, the entire function
equal to `(π/(2z))^{1/2} J_{n+1/2}(z)` (DLMF 10.47.3). -/
def sphericalBesselJ (n : ℕ) (z : ℂ) : ℂ :=
  (Real.sqrt π : ℂ) / 2 * (z / 2) ^ n * 𝐅((n : ℂ) + 3 / 2) (-(z / 2) ^ 2)

/-- The spherical Bessel function `𝗒_n(z) = (−1)^{n+1} (√π/2) (z/2)^{−n−1} 𝐅(½ − n, −(z/2)²)`,
equal to `(π/(2z))^{1/2} Y_{n+1/2}(z)` (DLMF 10.47.4). -/
def sphericalBesselY (n : ℕ) (z : ℂ) : ℂ :=
  (-1 : ℂ) ^ (n + 1) * (Real.sqrt π : ℂ) / 2 * (z / 2) ^ (-((n : ℤ) + 1)) *
    𝐅(1 / 2 - (n : ℂ)) (-(z / 2) ^ 2)

/-- `𝗁⁽¹⁾_n = 𝗃_n + i 𝗒_n` (DLMF 10.47.10). -/
def sphericalHankelH1 (n : ℕ) (z : ℂ) : ℂ := sphericalBesselJ n z + I * sphericalBesselY n z

/-- `𝗁⁽²⁾_n = 𝗃_n − i 𝗒_n` (DLMF 10.47.10). -/
def sphericalHankelH2 (n : ℕ) (z : ℂ) : ℂ := sphericalBesselJ n z - I * sphericalBesselY n z

/-- `𝗂⁽¹⁾_n(z) = (√π/2) (z/2)ⁿ 𝐅(n + 3/2, (z/2)²)`, equal to `(π/(2z))^{1/2} I_{n+1/2}(z)`
(DLMF 10.47.7). -/
def modifiedSphericalBesselI1 (n : ℕ) (z : ℂ) : ℂ :=
  (Real.sqrt π : ℂ) / 2 * (z / 2) ^ n * 𝐅((n : ℂ) + 3 / 2) ((z / 2) ^ 2)

/-- `𝗂⁽²⁾_n(z) = (√π/2) (z/2)^{−n−1} 𝐅(½ − n, (z/2)²)`, equal to `(π/(2z))^{1/2} I_{−n−1/2}(z)`
(DLMF 10.47.8). -/
def modifiedSphericalBesselI2 (n : ℕ) (z : ℂ) : ℂ :=
  (Real.sqrt π : ℂ) / 2 * (z / 2) ^ (-((n : ℤ) + 1)) * 𝐅(1 / 2 - (n : ℂ)) ((z / 2) ^ 2)

/-- `𝗄_n = (−1)^{n+1} (π/2) (𝗂⁽¹⁾_n − 𝗂⁽²⁾_n)` (DLMF 10.47.11). -/
def modifiedSphericalBesselK (n : ℕ) (z : ℂ) : ℂ :=
  (-1 : ℂ) ^ (n + 1) * ((π : ℂ) / 2) *
    (modifiedSphericalBesselI1 n z - modifiedSphericalBesselI2 n z)

/-- The coefficients `a_k(ν) = (½ − ν)_k (½ + ν)_k / ((−2)^k k!)` of DLMF 10.17.1. -/
def hankelCoeff (k : ℕ) (ν : ℂ) : ℂ :=
  (∏ j ∈ Finset.range k, ((1 / 2 - ν + j) * (1 / 2 + ν + j))) / ((-2 : ℂ) ^ k * k !)

/-- A roadmap-local copy of AnalyticNumberTheoryPartI's `besselK` (its §2.1a), the K-Bessel
kernel `K_ν(c) = ½ ∫₀^∞ exp(−c(u + u⁻¹)/2) u^ν du/u` for complex order and real `c > 0`. -/
def positiveAxisBesselK (ν : ℂ) (c : ℝ) : ℂ :=
  (1 / 2 : ℂ) * ∫ u : ℝ in Set.Ioi 0,
    Complex.exp (-(c : ℂ) * ((u : ℂ) + (u : ℂ)⁻¹) / 2) *
      Complex.exp (ν * (Real.log u : ℂ)) / (u : ℂ)

/-- A roadmap-local copy of SpecialFunctionsAiry's pinned `Ai`. -/
def airyAi (z : ℂ) : ℂ :=
  (3 : ℂ) ^ (-(2 / 3 : ℂ)) * 𝐅(2 / 3) (z ^ 3 / 9) -
    (3 : ℂ) ^ (-(4 / 3 : ℂ)) * z * 𝐅(4 / 3) (z ^ 3 / 9)

/-- A roadmap-local copy of LaguerreJacobi's Gegenbauer polynomial `Polynomial.gegenbauer`,
evaluated over `ℂ`: the explicit sum of DLMF 18.5.10,
`∑_{ℓ ≤ n/2} (−1)^ℓ (ν)_{n−ℓ} / (ℓ! (n − 2ℓ)!) (2x)^{n−2ℓ}`. -/
def gegenbauerC (ν : ℂ) (n : ℕ) (x : ℂ) : ℂ :=
  ∑ l ∈ Finset.range (n / 2 + 1),
    (-1 : ℂ) ^ l * (ascPochhammer ℂ (n - l)).eval ν / ((l ! : ℂ) * ((n - 2 * l) ! : ℂ)) *
      (2 * x) ^ (n - 2 * l)

end Complex

/-! ### Definitions: real functions, zeros, modulus and phase, Kelvin functions -/

namespace Real

/-- `J_ν(x)` for real `ν`, `x`: the real part of the complex value. -/
def besselJ (ν x : ℝ) : ℝ := (Complex.besselJ ν x).re

/-- `Y_ν(x)` for real `ν`, `x`: the real part of the complex value. -/
def besselY (ν x : ℝ) : ℝ := (Complex.besselY ν x).re

/-- `K_ν(x)` for real `ν`, `x`: the real part of the complex value. -/
def besselK (ν x : ℝ) : ℝ := (Complex.besselK ν x).re

/-- The `m`th positive zero of `f`, counting from `m = 1`: the `x > 0` with `f x = 0` such that
exactly `m − 1` zeros of `f` lie in `(0, x)`. -/
def positiveZero (f : ℝ → ℝ) (m : ℕ) : ℝ :=
  Classical.epsilon fun x => 0 < x ∧ f x = 0 ∧ {y | 0 < y ∧ y < x ∧ f y = 0}.ncard = m - 1

/-- `j_{ν,m}`. -/
def besselJZero (ν : ℝ) (m : ℕ) : ℝ := positiveZero (besselJ ν) m

/-- `y_{ν,m}`. -/
def besselYZero (ν : ℝ) (m : ℕ) : ℝ := positiveZero (besselY ν) m

/-- `j′_{ν,m}`, with DLMF's convention `j′_{0,1} = 0` (DLMF 10.21.1). -/
def besselJDerivZero (ν : ℝ) (m : ℕ) : ℝ :=
  if ν = 0 then (if m = 1 then 0 else positiveZero (deriv (besselJ 0)) (m - 1))
  else positiveZero (deriv (besselJ ν)) m

/-- `y′_{ν,m}`. -/
def besselYDerivZero (ν : ℝ) (m : ℕ) : ℝ := positiveZero (deriv (besselY ν)) m

/-- The modulus `M_ν(x) = (J_ν(x)² + Y_ν(x)²)^{1/2}` (DLMF 10.18.6). -/
def besselModulus (ν x : ℝ) : ℝ := √(besselJ ν x ^ 2 + besselY ν x ^ 2)

/-- The phase `θ_ν(x) = −π/2 + ∫₀^x 2/(π t M_ν(t)²) dt` (DLMF 10.18.3, 10.18.8). -/
def besselPhase (ν x : ℝ) : ℝ :=
  -(π / 2) + ∫ t in (0 : ℝ)..x, 2 / (π * t * besselModulus ν t ^ 2)

/-- The modulus `N_ν(x) = (J′_ν(x)² + Y′_ν(x)²)^{1/2}` (DLMF 10.18.6). -/
def besselDerivModulus (ν x : ℝ) : ℝ := √(deriv (besselJ ν) x ^ 2 + deriv (besselY ν) x ^ 2)

/-- The phase `φ_ν(x) = π/2 + ∫₀^x 2(t² − ν²)/(π t³ N_ν(t)²) dt` (DLMF 10.18.3, 10.18.8). -/
def besselDerivPhase (ν x : ℝ) : ℝ :=
  π / 2 + ∫ t in (0 : ℝ)..x, 2 * (t ^ 2 - ν ^ 2) / (π * t ^ 3 * besselDerivModulus ν t ^ 2)

/-- Debye's polynomials `U_k(p)` by the recursion DLMF 10.41.9, as functions on `ℝ`. -/
def debyeU : ℕ → ℝ → ℝ
  | 0 => fun _ => 1
  | k + 1 => fun p =>
      p ^ 2 * (1 - p ^ 2) / 2 * deriv (debyeU k) p +
        (∫ t in (0 : ℝ)..p, (1 - 5 * t ^ 2) * debyeU k t) / 8

/-- `ber_ν x = Re J_ν(x e^{3πi/4})` (DLMF 10.61.1). -/
def kelvinBer (ν x : ℝ) : ℝ := (Complex.besselJ ν (x * cexp (3 * π * I / 4))).re

/-- `bei_ν x = Im J_ν(x e^{3πi/4})` (DLMF 10.61.1). -/
def kelvinBei (ν x : ℝ) : ℝ := (Complex.besselJ ν (x * cexp (3 * π * I / 4))).im

/-- `ker_ν x = Re (e^{−νπi/2} K_ν(x e^{πi/4}))` (DLMF 10.61.2). -/
def kelvinKer (ν x : ℝ) : ℝ :=
  (cexp (-(ν * π * I / 2)) * Complex.besselK ν (x * cexp (π * I / 4))).re

/-- `kei_ν x = Im (e^{−νπi/2} K_ν(x e^{πi/4}))` (DLMF 10.61.2). -/
def kelvinKei (ν x : ℝ) : ℝ :=
  (cexp (-(ν * π * I / 2)) * Complex.besselK ν (x * cexp (π * I / 4))).im

/-- The Kelvin modulus `M_ν(x) = (ber_ν² x + bei_ν² x)^{1/2}` (DLMF 10.68.5). -/
def kelvinModulus (ν x : ℝ) : ℝ := √(kelvinBer ν x ^ 2 + kelvinBei ν x ^ 2)

/-- The Kelvin phase `θ_ν`, continuous on `(0, ∞)` with `θ_ν(0+) = 3νπ/4`, for `ν ≥ 0`. -/
def kelvinPhase (ν x : ℝ) : ℝ :=
  3 * ν * π / 4 + ∫ t in (0 : ℝ)..x,
    (kelvinBer ν t * deriv (kelvinBei ν) t - kelvinBei ν t * deriv (kelvinBer ν) t) /
      kelvinModulus ν t ^ 2

/-- The Kelvin modulus `N_ν(x) = (ker_ν² x + kei_ν² x)^{1/2}` (DLMF 10.68.5). -/
def kelvinKModulus (ν x : ℝ) : ℝ := √(kelvinKer ν x ^ 2 + kelvinKei ν x ^ 2)

/-- The Kelvin phase `φ_ν`, continuous on `(0, ∞)` with `φ_ν(0+) = −3νπ/4`, for `ν ≥ 0`. -/
def kelvinKPhase (ν x : ℝ) : ℝ :=
  -(3 * ν * π / 4) + ∫ t in (0 : ℝ)..x,
    (kelvinKer ν t * deriv (kelvinKei ν) t - kelvinKei ν t * deriv (kelvinKer ν) t) /
      kelvinKModulus ν t ^ 2

end Real

/-! ### Layer 1: definitions, the equations, connection formulas and Wronskians -/

namespace Complex

/-- DLMF 10.2.1 for `J_ν`. -/
theorem besselJ_ode (ν : ℂ) {z : ℂ} (hz : z ∈ slitPlane) :
    z ^ 2 * deriv^[2] (besselJ ν) z + z * deriv (besselJ ν) z + (z ^ 2 - ν ^ 2) * besselJ ν z =
      0 := by
  sorry

/-- DLMF 10.2.1 for `Y_ν`. -/
theorem besselY_ode (ν : ℂ) {z : ℂ} (hz : z ∈ slitPlane) :
    z ^ 2 * deriv^[2] (besselY ν) z + z * deriv (besselY ν) z + (z ^ 2 - ν ^ 2) * besselY ν z =
      0 := by
  sorry

/-- `Y_ν(z)` is holomorphic in `z` on the slit plane. -/
theorem analyticOnNhd_besselY (ν : ℂ) : AnalyticOnNhd ℂ (besselY ν) slitPlane := by
  sorry

/-- `Y_ν(z)` is entire in `ν`: the integer values 10.2.4 are the limits of 10.2.3. -/
theorem differentiable_besselY_left {z : ℂ} (hz : z ∈ slitPlane) :
    Differentiable ℂ fun ν => besselY ν z := by
  sorry

/-- DLMF 10.5.2, the Wronskian `𝒲{J_ν, Y_ν} = 2/(πz)`. -/
theorem besselJ_mul_deriv_besselY_sub (ν : ℂ) {z : ℂ} (hz : z ∈ slitPlane) :
    besselJ ν z * deriv (besselY ν) z - deriv (besselJ ν) z * besselY ν z = 2 / (π * z) := by
  sorry

/-- DLMF 10.6.1 for `Y_ν`. -/
theorem besselY_sub_one_add_besselY_add_one (ν : ℂ) {z : ℂ} (hz : z ∈ slitPlane) :
    besselY (ν - 1) z + besselY (ν + 1) z = 2 * ν / z * besselY ν z := by
  sorry

/-- DLMF 10.11.5, `H⁽²⁾_ν(z e^{−πi}) = −e^{νπi} H⁽¹⁾_ν(z)`, for `0 < ph z < π`. -/
theorem hankelH2_neg (ν : ℂ) {z : ℂ} (h₀ : 0 < arg z) (h₁ : arg z < π) :
    hankelH2 ν (-z) = -cexp (ν * π * I) * hankelH1 ν z := by
  sorry

/-- DLMF 10.27.8, `K_ν(z) = ½πi e^{νπi/2} H⁽¹⁾_ν(z e^{πi/2})`, for `−π < ph z ≤ π/2`. -/
theorem besselK_eq_hankelH1 (ν : ℂ) {z : ℂ} (hz : z ≠ 0) (h : arg z ≤ π / 2) :
    besselK ν z = π * I / 2 * cexp (ν * π * I / 2) * hankelH1 ν (I * z) := by
  sorry

/-- DLMF 10.28.2, `I_ν K_{ν+1} + I_{ν+1} K_ν = 1/z`. -/
theorem besselI_mul_besselK_add (ν : ℂ) {z : ℂ} (hz : z ∈ slitPlane) :
    besselI ν z * besselK (ν + 1) z + besselI (ν + 1) z * besselK ν z = 1 / z := by
  sorry

/-- `I_ν` restricts to Tau Ceti's `Real.besselI` on `(0, ∞)`. -/
theorem besselI_ofReal (ν : ℝ) {x : ℝ} (hx : 0 < x) :
    besselI ν x = (_root_.Real.besselI ν x : ℂ) := by
  sorry

/-! ### Layer 2: limiting forms, generating function and sums -/

/-- DLMF 10.7.4, `Y_ν(z) ∼ −π⁻¹ Γ(ν) (z/2)^{−ν}` as `z → 0`, for `Re ν > 0`. -/
theorem tendsto_besselY_div_cpow (ν : ℂ) (hν : 0 < ν.re) :
    Tendsto (fun z => besselY ν z / (z / 2) ^ (-ν)) (𝓝[slitPlane] 0)
      (𝓝 (-Gamma ν / π)) := by
  sorry

/-- DLMF 10.12.1, the generating function `e^{z(t − t⁻¹)/2} = ∑ₘ tᵐ J_m(z)`. -/
theorem hasSum_besselJ_generating (z : ℂ) {t : ℂ} (ht : t ≠ 0) :
    HasSum (fun m : ℤ => t ^ m * besselJ m z) (cexp (z / 2 * (t - t⁻¹))) := by
  sorry

/-- DLMF 10.23.3, `J₀² + 2 ∑_{k ≥ 1} J_k² = 1`. -/
theorem hasSum_besselJ_sq (z : ℂ) :
    HasSum (fun k : ℕ => (if k = 0 then 1 else 2) * besselJ k z ^ 2) 1 := by
  sorry

/-- DLMF 10.23.8, Gegenbauer's addition theorem, for `𝒞 = J`, for all `u`, `v`, `α` and
`ν ∉ {0, −1, −2, …}`. It is written in entire form: `J_ν(z)/z^ν = 2^{−ν} 𝐅(ν + 1)(−z²/4)`,
`w² = u² + v² − 2uv cos α`, and both sides are multiplied by `2^ν`. -/
theorem hasSum_besselJ_gegenbauer {ν : ℂ} (hν : ∀ k : ℕ, ν ≠ -k) (u v α : ℂ) :
    HasSum (fun k : ℕ => Gamma ν * (ν + k) * (u * v / 4) ^ k * 𝐅(ν + k + 1) (-(u ^ 2) / 4) *
        𝐅(ν + k + 1) (-(v ^ 2) / 4) * gegenbauerC ν k (Complex.cos α))
      (𝐅(ν + 1) (-(u ^ 2 + v ^ 2 - 2 * u * v * Complex.cos α) / 4)) := by
  sorry

/-- DLMF 10.23.8 for `𝒞 = H⁽¹⁾`, for `Re u > 0` and `|v e^{±iα}| < |u|`, with the branch
`w = u ((1 − (v/u) e^{iα})(1 − (v/u) e^{−iα}))^{1/2}` of 10.23.6 and `J_{ν+k}(v)/v^ν` in entire
form. -/
theorem hasSum_hankelH1_gegenbauer {ν : ℂ} (hν : ∀ k : ℕ, ν ≠ -k) {u v α : ℂ} (hu : 0 < u.re)
    (h₁ : ‖v * cexp (I * α)‖ < ‖u‖) (h₂ : ‖v * cexp (-(I * α))‖ < ‖u‖) :
    HasSum (fun k : ℕ => 2 ^ ν * Gamma ν * (ν + k) * (hankelH1 (ν + k) u / u ^ ν) *
        (2 ^ (-(ν + k)) * v ^ k * 𝐅(ν + k + 1) (-(v ^ 2) / 4)) *
        gegenbauerC ν k (Complex.cos α))
      (hankelH1 ν (u * ((1 - v / u * cexp (I * α)) * (1 - v / u * cexp (-(I * α)))) ^ (1 / 2 : ℂ)) /
        (u * ((1 - v / u * cexp (I * α)) * (1 - v / u * cexp (-(I * α)))) ^ (1 / 2 : ℂ)) ^ ν) := by
  sorry

/-- DLMF 10.23.9, `e^{iv cos α} = Γ(ν) (v/2)^{−ν} ∑ (ν + k) iᵏ J_{ν+k}(v) C_k^{(ν)}(cos α)`, for
all `v`, `α` and `ν ∉ {0, −1, −2, …}`, with `J_{ν+k}(v)` in entire form. -/
theorem hasSum_cexp_gegenbauer {ν : ℂ} (hν : ∀ k : ℕ, ν ≠ -k) (v α : ℂ) :
    HasSum (fun k : ℕ => Gamma ν * (ν + k) * I ^ k * (v / 2) ^ k * 𝐅(ν + k + 1) (-(v ^ 2) / 4) *
        gegenbauerC ν k (Complex.cos α))
      (cexp (I * v * Complex.cos α)) := by
  sorry

/-! ### Layer 3: integral representations -/

/-- DLMF 10.9.2, Bessel's integral. -/
theorem besselJ_int_eq_integral (n : ℤ) (z : ℂ) :
    besselJ n z = (π : ℂ)⁻¹ * ∫ θ in (0 : ℝ)..π, Complex.cos (z * Real.sin θ - n * θ) := by
  sorry

/-- DLMF 10.32.9, `K_ν(z) = ∫₀^∞ e^{−z cosh t} cosh(νt) dt` for `|ph z| < π/2`. At `z = x > 0`
its right side is the cosh form of AnalyticNumberTheoryPartI's positive-axis `besselK`. -/
theorem besselK_eq_integral (ν : ℂ) {z : ℂ} (hz : |arg z| < π / 2) (hz₀ : z ≠ 0) :
    besselK ν z = ∫ t in Ioi (0 : ℝ), cexp (-z * Real.cosh t) * Complex.cosh (ν * t) := by
  sorry

/-- DLMF 10.9.7, Schläfli's integral for `Y_ν`, for complex `ν` and `Re z > 0`. Its right side is
AnalyticNumberTheoryPartI's definition of `Y_ν` on `Re z > 0` (its §3.23b), so this is the
agreement of the two definitions. -/
theorem besselY_eq_schlafli (ν : ℂ) {z : ℂ} (hz : 0 < z.re) :
    besselY ν z =
      (π : ℂ)⁻¹ * ∫ θ in (0 : ℝ)..π, Complex.sin (z * Real.sin θ - ν * θ) -
        (π : ℂ)⁻¹ * ∫ t in Ioi (0 : ℝ),
          (cexp (ν * t) + cexp (-(ν * t)) * Complex.cos (ν * π)) * cexp (-(z * Real.sinh t)) := by
  sorry

/-- `K_ν` agrees on `(0, ∞)` with AnalyticNumberTheoryPartI's positive-axis `besselK`. -/
theorem besselK_ofReal_eq_positiveAxisBesselK (ν : ℂ) {x : ℝ} (hx : 0 < x) :
    besselK ν x = positiveAxisBesselK ν x := by
  sorry

/-- DLMF 10.9.30, Nicholson's formula, for `Re z > 0`. -/
theorem besselJ_sq_add_besselY_sq (ν : ℂ) {z : ℂ} (hz : 0 < z.re) :
    besselJ ν z ^ 2 + besselY ν z ^ 2 =
      8 / π ^ 2 * ∫ t in Ioi (0 : ℝ),
        Complex.cosh (2 * ν * t) * besselK 0 (2 * z * Real.sinh t) := by
  sorry

/-! ### Layer 4: continued fractions and relations to other functions -/

/-- DLMF 10.10.1, `J_ν(z)/J_{ν−1}(z) = 1/(2ν z⁻¹ − 1/(2(ν + 1) z⁻¹ − ⋯))`, as the limit of the
convergents, for `z ≠ 0` and `J_{ν−1}(z) ≠ 0`. -/
theorem tendsto_convs_besselJ {ν z : ℂ} (hz : z ≠ 0) (h : besselJ (ν - 1) z ≠ 0) :
    Tendsto (GenContFract.mk (0 : ℂ) (Stream'.Seq.ofStream fun n : ℕ =>
        (⟨if n = 0 then 1 else -1, 2 * (ν + n) / z⟩ : GenContFract.Pair ℂ))).convs atTop
      (𝓝 (besselJ ν z / besselJ (ν - 1) z)) := by
  sorry

/-- DLMF 10.16.5 with the upper signs (`e^{−iz}`, `+2iz`), through Olver's `𝐌`. -/
theorem besselJ_eq_kummer {ν : ℂ} (hν : ∀ n : ℕ, 2 * ν + 1 ≠ -n) {z : ℂ} (hz : z ∈ slitPlane) :
    besselJ ν z = (z / 2) ^ ν * cexp (-(I * z)) * (Gamma (2 * ν + 1) / Gamma (ν + 1)) *
      𝐌(ν + 1 / 2, 2 * ν + 1) (2 * I * z) := by
  sorry

/-! ### Layer 5: large argument -/

/-- DLMF 10.17.5 on the principal sheet: the expansion of `H⁽¹⁾_ν` in `|ph z| ≤ π − δ`, one
truncation order at a time, with `ω = z − νπ/2 − π/4`. -/
theorem isBigO_hankelH1_sub_sum (ν : ℂ) {δ : ℝ} (hδ : 0 < δ) (N : ℕ) :
    (fun z => hankelH1 ν z - (2 / (π * z)) ^ (1 / 2 : ℂ) * cexp (I * (z - ν * π / 2 - π / 4)) *
        ∑ k ∈ Finset.range N, I ^ k * hankelCoeff k ν / z ^ k) =O[sectorAtTop (π - δ)]
      fun z => ‖cexp (I * (z - ν * π / 2 - π / 4))‖ * ‖z‖ ^ (-(N : ℝ) - 1 / 2) := by
  sorry

/-- DLMF 10.40.2 on the principal sheet, in `|ph z| ≤ π − δ`. -/
theorem isBigO_besselK_sub_sum (ν : ℂ) {δ : ℝ} (hδ : 0 < δ) (N : ℕ) :
    (fun z => besselK ν z - (π / (2 * z)) ^ (1 / 2 : ℂ) * cexp (-z) *
        ∑ k ∈ Finset.range N, hankelCoeff k ν / z ^ k) =O[sectorAtTop (π - δ)]
      fun z => ‖cexp (-z)‖ * ‖z‖ ^ (-(N : ℝ) - 1 / 2) := by
  sorry

end Complex

namespace Real

/-- DLMF 10.14.1, `|J_ν(x)| ≤ 1` for `ν ≥ 0` and real `x`, with the complex modulus of the
principal value. -/
theorem norm_besselJ_le_one {ν : ℝ} (hν : 0 ≤ ν) (x : ℝ) : ‖Complex.besselJ ν x‖ ≤ 1 := by
  sorry

/-- DLMF 10.18.4 and 10.18.8: `J_ν = M_ν cos θ_ν`, `Y_ν = M_ν sin θ_ν` and
`M_ν² θ′_ν = 2/(πx)` on `(0, ∞)`, for `ν ≥ 0`. -/
theorem besselModulus_besselPhase {ν : ℝ} (hν : 0 ≤ ν) {x : ℝ} (hx : 0 < x) :
    besselJ ν x = besselModulus ν x * Real.cos (besselPhase ν x) ∧
      besselY ν x = besselModulus ν x * Real.sin (besselPhase ν x) ∧
      HasDerivAt (besselPhase ν) (2 / (π * x * besselModulus ν x ^ 2)) x := by
  sorry

/-- DLMF 10.18.5 and 10.18.8 for `N_ν`, `φ_ν`. -/
theorem besselDerivModulus_besselDerivPhase {ν : ℝ} (hν : 0 ≤ ν) {x : ℝ} (hx : 0 < x) :
    deriv (besselJ ν) x = besselDerivModulus ν x * Real.cos (besselDerivPhase ν x) ∧
      deriv (besselY ν) x = besselDerivModulus ν x * Real.sin (besselDerivPhase ν x) ∧
      HasDerivAt (besselDerivPhase ν)
        (2 * (x ^ 2 - ν ^ 2) / (π * x ^ 3 * besselDerivModulus ν x ^ 2)) x := by
  sorry

/-! ### Layer 6: large order -/

/-- DLMF 10.41.3 on `(0, ∞)`, uniformly in `z`, with `η` and `p` of 10.41.7–10.41.8. -/
theorem isBigO_besselI_debye (N : ℕ) :
    (fun q : ℝ × ℝ =>
        _root_.Real.besselI q.1 (q.1 * q.2) -
          Real.exp (q.1 * (√(1 + q.2 ^ 2) + Real.log (q.2 / (1 + √(1 + q.2 ^ 2))))) /
            (√(2 * π * q.1) * (1 + q.2 ^ 2) ^ (1 / 4 : ℝ)) *
            ∑ k ∈ Finset.range N, debyeU k (1 / √(1 + q.2 ^ 2)) / q.1 ^ k)
      =O[atTop ×ˢ 𝓟 (Ioi 0)]
      fun q => Real.exp (q.1 * (√(1 + q.2 ^ 2) + Real.log (q.2 / (1 + √(1 + q.2 ^ 2))))) /
        (√(2 * π * q.1) * (1 + q.2 ^ 2) ^ (1 / 4 : ℝ)) * q.1 ^ (-(N : ℝ)) := by
  sorry

/-- DLMF 10.41.12 on `(0, ∞)`: for fixed `ν > 0` and `ℓ ≥ 1`, as `z → ∞`, the remainder is
`O(z^{−ℓ})` inside the bracket (DLMF §10.41(iv)). -/
theorem isBigO_besselI_debye_atTop {ν : ℝ} (hν : 0 < ν) {ℓ : ℕ} (hℓ : 1 ≤ ℓ) :
    (fun z : ℝ =>
        _root_.Real.besselI ν (ν * z) -
          Real.exp (ν * (√(1 + z ^ 2) + Real.log (z / (1 + √(1 + z ^ 2))))) /
            (√(2 * π * ν) * (1 + z ^ 2) ^ (1 / 4 : ℝ)) *
            ∑ k ∈ Finset.range ℓ, debyeU k (1 / √(1 + z ^ 2)) / ν ^ k)
      =O[atTop]
      fun z => Real.exp (ν * (√(1 + z ^ 2) + Real.log (z / (1 + √(1 + z ^ 2))))) /
        (1 + z ^ 2) ^ (1 / 4 : ℝ) * z ^ (-(ℓ : ℝ)) := by
  sorry

/-- DLMF 10.41.13 on `(0, ∞)`: for fixed `ν > 0` and `ℓ ≥ 1`, as `z → ∞`, the remainder is
`O(z^{−ℓ})` inside the bracket (DLMF §10.41(iv)). -/
theorem isBigO_besselK_debye_atTop {ν : ℝ} (hν : 0 < ν) {ℓ : ℕ} (hℓ : 1 ≤ ℓ) :
    (fun z : ℝ =>
        besselK ν (ν * z) -
          √(π / (2 * ν)) * Real.exp (-(ν * (√(1 + z ^ 2) + Real.log (z / (1 + √(1 + z ^ 2)))))) /
            (1 + z ^ 2) ^ (1 / 4 : ℝ) *
            ∑ k ∈ Finset.range ℓ, (-1) ^ k * debyeU k (1 / √(1 + z ^ 2)) / ν ^ k)
      =O[atTop]
      fun z => Real.exp (-(ν * (√(1 + z ^ 2) + Real.log (z / (1 + √(1 + z ^ 2)))))) /
        (1 + z ^ 2) ^ (1 / 4 : ℝ) * z ^ (-(ℓ : ℝ)) := by
  sorry

/-! ### Layer 7: zeros -/

/-- The positive zeros of `J_ν`, for every real `ν`, are simple, increasing in `m`, and all
enumerated. -/
theorem besselJZero_spec (ν : ℝ) :
    (∀ m, 1 ≤ m → 0 < besselJZero ν m ∧ besselJ ν (besselJZero ν m) = 0 ∧
        deriv (besselJ ν) (besselJZero ν m) ≠ 0 ∧ besselJZero ν m < besselJZero ν (m + 1)) ∧
      ∀ x, 0 < x → besselJ ν x = 0 → ∃ m, 1 ≤ m ∧ x = besselJZero ν m := by
  sorry

/-- DLMF 10.21.2, the interlacing `j_{ν,m} < j_{ν+1,m} < j_{ν,m+1}` for `ν ≥ 0`. -/
theorem besselJZero_interlace {ν : ℝ} (hν : 0 ≤ ν) {m : ℕ} (hm : 1 ≤ m) :
    besselJZero ν m < besselJZero (ν + 1) m ∧ besselJZero (ν + 1) m < besselJZero ν (m + 1) := by
  sorry

/-- DLMF 10.21.15, the infinite product of `J_ν` over its zeros, for `ν ≥ 0`. -/
theorem hasProd_besselJ {ν : ℝ} (hν : 0 ≤ ν) {z : ℂ} (hz : z ∈ slitPlane) :
    HasProd (fun k : ℕ => 1 - z ^ 2 / (besselJZero ν (k + 1) : ℂ) ^ 2)
      (Complex.Gamma (ν + 1) * Complex.besselJ ν z / (z / 2) ^ (ν : ℂ)) := by
  sorry

/-- DLMF 10.21.19 to two terms (McMahon), with `a = (m + ν/2 − 1/4)π` and `μ = 4ν²`. -/
theorem isBigO_besselJZero_mcmahon {ν : ℝ} (hν : 0 ≤ ν) :
    (fun m : ℕ => besselJZero ν m -
        ((m + ν / 2 - 1 / 4) * π - (4 * ν ^ 2 - 1) / (8 * ((m + ν / 2 - 1 / 4) * π))))
      =O[atTop] fun m => ((m + ν / 2 - 1 / 4) * π) ^ (-3 : ℤ) := by
  sorry

/-- DLMF 10.22.37, the orthogonality of the Fourier–Bessel system, for `ν > −1`. -/
theorem integral_besselJ_mul_besselJZero {ν : ℝ} (hν : -1 < ν) {l m : ℕ} (hl : 1 ≤ l)
    (hm : 1 ≤ m) :
    ∫ t in (0 : ℝ)..1, t * besselJ ν (besselJZero ν l * t) * besselJ ν (besselJZero ν m * t) =
      if l = m then deriv (besselJ ν) (besselJZero ν l) ^ 2 / 2 else 0 := by
  sorry

/-- DLMF 10.23.18–10.23.20, the Fourier–Bessel expansion: for `ν ≥ −½`, `t^{1/2} f(t)` integrable
on `(0, 1)` and `f` of bounded variation on `[a, b]` with `0 < a < x < b < 1`, the partial sums of
`∑ₘ aₘ J_ν(j_{ν,m} x)`, with `aₘ` of 10.23.19, converge to `½ (f(x−) + f(x+))`. -/
theorem tendsto_sum_fourierBessel {ν : ℝ} (hν : -(1 / 2) ≤ ν) {f : ℝ → ℝ}
    (hf : IntegrableOn (fun t => t ^ (1 / 2 : ℝ) * f t) (Ioo 0 1)) {a b x : ℝ} (ha : 0 < a)
    (hax : a < x) (hxb : x < b) (hb : b < 1) (hbv : BoundedVariationOn f (Icc a b)) :
    Tendsto (fun N => ∑ m ∈ Finset.range N,
        2 / besselJ (ν + 1) (besselJZero ν (m + 1)) ^ 2 *
          (∫ t in (0 : ℝ)..1, t * f t * besselJ ν (besselJZero ν (m + 1) * t)) *
          besselJ ν (besselJZero ν (m + 1) * x)) atTop
      (𝓝 ((Function.leftLim f x + Function.rightLim f x) / 2)) := by
  sorry

end Real

/-! ### Layer 8: integrals -/

namespace Complex

/-- DLMF 10.22.41, `∫₀^∞ J_ν = 1` as an improper integral, for `Re ν > −1`. -/
theorem tendsto_integral_besselJ {ν : ℂ} (hν : -1 < ν.re) :
    Tendsto (fun R => ∫ t in (0 : ℝ)..R, besselJ ν t) atTop (𝓝 1) := by
  sorry

/-- DLMF 10.43.19, the Mellin transform of `K_ν`, for `|Re ν| < Re μ`. -/
theorem integral_cpow_mul_besselK {ν μ : ℂ} (h : |ν.re| < μ.re) :
    ∫ t in Ioi (0 : ℝ), (t : ℂ) ^ (μ - 1) * besselK ν t =
      2 ^ (μ - 2) * Gamma ((μ - ν) / 2) * Gamma ((μ + ν) / 2) := by
  sorry

/-- DLMF 10.22.49 on its full domain `Re(a ± ib) > 0`: the regularized Gauss function continues
holomorphically from the unit disc to `ℂ \ [1, ∞)`, which contains `−b²/a²`, and 10.22.49 holds
with the continuation. The continuation is unique because `ℂ \ [1, ∞)` is connected. -/
theorem exists_integral_cpow_mul_exp_mul_besselJ {μ ν : ℂ} (hμν : 0 < (μ + ν).re) :
    ∃ G : ℂ → ℂ, DifferentiableOn ℂ G {x | x.im ≠ 0 ∨ x.re < 1} ∧
      EqOn G (Complex.regularizedGaussHGFun ((μ + ν) / 2) ((μ + ν + 1) / 2) (ν + 1))
        (Metric.ball 0 1) ∧
      ∀ {a b : ℂ}, 0 < (a + I * b).re → 0 < (a - I * b).re →
        ∫ t in Ioi (0 : ℝ), (t : ℂ) ^ (μ - 1) * cexp (-(a * t)) * besselJ ν (b * t) =
          (b / 2) ^ ν / a ^ (μ + ν) * Gamma (μ + ν) * G (-(b ^ 2 / a ^ 2)) := by
  sorry

/-- DLMF 10.22.64, a Weber–Schafheitlin integral whose Gauss function is the polynomial
`𝐅(−n, μ + n + 1; μ + 1; ·)`, as an improper integral, for `Re μ > −n − 1` and `a, b > 0`,
with its three cases `b < a`, `b = a` and `b > a`. -/
theorem tendsto_integral_besselJ_mul_besselJ {μ : ℂ} {n : ℕ} (hμ : -(n : ℝ) - 1 < μ.re)
    {a b : ℝ} (ha : 0 < a) (hb : 0 < b) :
    Tendsto (fun R => ∫ t in (0 : ℝ)..R,
        besselJ (μ + 2 * n + 1) ((a * t : ℝ) : ℂ) * besselJ μ ((b * t : ℝ) : ℂ)) atTop
      (𝓝 (if b < a then
        (b : ℂ) ^ μ * Gamma (μ + n + 1) / ((a : ℂ) ^ (μ + 1) * n !) *
          Complex.regularizedGaussHGFun (-n) (μ + n + 1) (μ + 1) ((b / a : ℝ) ^ 2 : ℝ)
        else if b = a then (-1) ^ n / (2 * a) else 0)) := by
  sorry

end Complex

/-! ### Layer 9: spherical Bessel functions -/

namespace Complex

/-- DLMF 10.47.3, `𝗃_n(z) = (π/(2z))^{1/2} J_{n+1/2}(z)`. -/
theorem sphericalBesselJ_eq_besselJ (n : ℕ) {z : ℂ} (hz : z ∈ slitPlane) :
    sphericalBesselJ n z = (π / (2 * z)) ^ (1 / 2 : ℂ) * besselJ ((n : ℂ) + 1 / 2) z := by
  sorry

/-- DLMF 10.47.1 for `𝗃_n`. -/
theorem sphericalBesselJ_ode (n : ℕ) (z : ℂ) :
    z ^ 2 * deriv^[2] (sphericalBesselJ n) z + 2 * z * deriv (sphericalBesselJ n) z +
      (z ^ 2 - n * (n + 1)) * sphericalBesselJ n z = 0 := by
  sorry

/-- DLMF 10.60.7, the plane-wave expansion, with `P_n(x) = P̃_n((1 − x)/2)` through Mathlib's
shifted Legendre polynomial `P̃_n(y) = P_n(1 − 2y)`. -/
theorem hasSum_planeWave (z α : ℂ) :
    HasSum (fun n : ℕ => (2 * n + 1) * I ^ n * sphericalBesselJ n z *
        ((Polynomial.shiftedLegendre n).map (Int.castRingHom ℂ)).eval ((1 - Complex.cos α) / 2))
      (cexp (I * z * Complex.cos α)) := by
  sorry

end Complex

/-! ### Layer 10: Kelvin functions -/

namespace Real

/-- DLMF 10.61.3 for `ber_ν x + i bei_ν x` on `(0, ∞)`. -/
theorem kelvin_ode (ν : ℝ) {x : ℝ} (hx : 0 < x) :
    let w : ℝ → ℂ := fun t => (kelvinBer ν t : ℂ) + I * kelvinBei ν t
    (x : ℂ) ^ 2 * deriv (deriv w) x + x * deriv w x - (I * x ^ 2 + ν ^ 2) * w x = 0 := by
  sorry

/-- DLMF 10.65.1 for `ber_ν` on `(0, ∞)`. -/
theorem hasSum_kelvinBer (ν : ℝ) {x : ℝ} (hx : 0 < x) :
    HasSum (fun k : ℕ => (x / 2) ^ ν * Real.cos ((3 * ν / 4 + k / 2) * π) /
        (k ! * Real.Gamma (ν + k + 1)) * (x ^ 2 / 4) ^ k) (kelvinBer ν x) := by
  sorry

/-- DLMF 10.68.3: `ber_ν = M_ν cos θ_ν` and `bei_ν = M_ν sin θ_ν` on `(0, ∞)`, for `ν ≥ 0`. -/
theorem kelvinModulus_kelvinPhase {ν : ℝ} (hν : 0 ≤ ν) {x : ℝ} (hx : 0 < x) :
    kelvinBer ν x = kelvinModulus ν x * Real.cos (kelvinPhase ν x) ∧
      kelvinBei ν x = kelvinModulus ν x * Real.sin (kelvinPhase ν x) := by
  sorry

/-- DLMF 10.68.4: `ker_ν = N_ν cos φ_ν` and `kei_ν = N_ν sin φ_ν` on `(0, ∞)`, for `ν ≥ 0`. -/
theorem kelvinKModulus_kelvinKPhase {ν : ℝ} (hν : 0 ≤ ν) {x : ℝ} (hx : 0 < x) :
    kelvinKer ν x = kelvinKModulus ν x * Real.cos (kelvinKPhase ν x) ∧
      kelvinKei ν x = kelvinKModulus ν x * Real.sin (kelvinKPhase ν x) := by
  sorry

end Real

/-! ### Layer 11: relations owed to other roadmaps -/

namespace Complex

/-- DLMF 9.6.2, the `K` form: `Ai(z) = π⁻¹ (z/3)^{1/2} K_{1/3}(ζ)`, `ζ = (2/3) z^{3/2}`, for
`|ph z| < 2π/3`. -/
theorem airyAi_eq_besselK {z : ℂ} (hz : z ≠ 0) (h : |arg z| < 2 * π / 3) :
    airyAi z = (π : ℂ)⁻¹ * (z / 3) ^ (1 / 2 : ℂ) * besselK (1 / 3) (2 / 3 * z ^ (3 / 2 : ℂ)) := by
  sorry

end Complex

/-! ### Library names cited by `README.md` -/

#check @_root_.Complex.Gamma
#check @_root_.Complex.Gamma_add_one
#check @_root_.Complex.Gamma_eq_integral
#check @_root_.Complex.Gamma_mul_Gamma_add_half
#check @_root_.Complex.Gamma_mul_Gamma_one_sub
#check @_root_.Complex.analyticOnNhd_besselJ
#check @_root_.Complex.analyticOnNhd_besselJ_int
#check @_root_.Complex.analyticAt_besselJ
#check @_root_.Complex.analyticAt_besselJ_int
#check @_root_.Complex.analyticOnNhd_regularizedHGFun_of_card_le
#check @_root_.Complex.arg
#check @_root_.Complex.besselJ
#check @_root_.Complex.besselJ_def
#check @_root_.Complex.besselJ_int_neg
#check @_root_.Complex.besselJ_neg_int
#check @_root_.Complex.besselJ_neg_comm
#check @_root_.Complex.even_besselJ
#check @_root_.Complex.odd_besselJ
#check @_root_.Complex.besselJ_zero
#check @_root_.Complex.betaIntegral
#check @_root_.Complex.cpow
#check @_root_.Complex.differentiableOn_update_limUnder_of_bddAbove
#check @_root_.Complex.digamma
#check @_root_.Complex.hasSum_regularizedHGFun
#check @_root_.Complex.integral_boundary_rect_eq_zero_of_differentiableOn
#check @_root_.Complex.radius_regularizedGaussHGFunSeries_eq_top_of_left
#check @_root_.Complex.regularizedGaussHGFun
#check @_root_.Complex.regularizedHGFun
#check @_root_.Complex.regularizedHGFunCoeff
#check @_root_.Complex.slitPlane
#check @_root_.Complex.two_mul_self_mul_besselJ
#check @_root_.Real.besselI
#check @_root_.Real.besselI_def
#check @_root_.Real.besselI_eq_rpow_mul
#check @_root_.Real.besselI_pos
#check @_root_.Real.besselI_sub_besselI
#check @_root_.Real.besselI_zero
#check @_root_.Real.tendsto_rpow_neg_mul_besselI_nhdsGT_zero
#check @_root_.Real.eulerMascheroniConstant
#check @_root_.GenContFract
#check @_root_.GenContFract.convs
#check @_root_.Stream'.Seq.ofStream
#check @_root_.BoundedVariationOn
#check @_root_.Function.leftLim
#check @_root_.Function.rightLim
#check @_root_.Real.hasDerivAt_besselI
#check @_root_.Real.hasDerivAt_rpow_neg_mul_besselI
#check @_root_.Real.hasSum_besselI
#check @_root_.Real.integral_exp_mul_cos_mul_cos

end TauCetiRoadmap.SpecialFunctionsBessel
