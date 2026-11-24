module

public import Mathlib
public import TauCeti.Analysis.SpecialFunctions.JacobiElliptic.Basic
public import TauCeti.Analysis.SpecialFunctions.EllipticIntegral.Legendre
public import TauCeti.Analysis.SpecialFunctions.EllipticIntegral.Carlson.Basic
public import TauCeti.Analysis.SpecialFunctions.EllipticIntegral.Carlson.RJ
public import TauCeti.Analysis.SpecialFunctions.EllipticIntegral.Carlson.Legendre
public import TauCeti.Analysis.SpecialFunctions.Elliptic.WeierstrassZeta
public import TauCeti.Analysis.Complex.UpperHalfPlane.PeriodPair

/-!
# Jacobian elliptic functions of a complex variable: target signatures

This file states, against the pinned Mathlib and Tau Ceti, the headlines of `README.md` that
carry a Lean name, each with every conclusion the README attaches to it. It is not an exhaustive
acceptance test: the other headlines of the README are targets of the same standing, stated in
prose. Discharging this file finishes neither a layer nor the roadmap.

The four theta functions, the modulus and the modular function `λ` are verbatim local copies of
the definitions of SpecialFunctionsTheta (§1.1 and §6.1), which pins them; in Tau Ceti they will
live in the namespace `TauCeti`. The other definitions are this roadmap's. All have their
intended bodies, so that the conventions are checked by the compiler. Theorems are stated with
`sorry`. The section numbers in docstrings are those of the README; equation numbers are the
DLMF's, as additional locators.
-/

@[expose] public section

noncomputable section

namespace TauCetiRoadmap.SpecialFunctionsJacobiElliptic

open Complex Filter Topology Set

open scoped Real

/-! ## Local copies: SpecialFunctionsTheta §1.1 and §6.1 -/

/-- Local copy: SpecialFunctionsTheta, §1.1. The multiplier `M(z|τ) = e^{iz + iπτ/4}`. -/
def thetaMultiplier (z τ : ℂ) : ℂ := cexp (I * z + π * I * τ / 4)

/-- Local copy: SpecialFunctionsTheta, §1.1. `θ₃(z|τ)`. -/
def jacobiThetaThree (z τ : ℂ) : ℂ := jacobiTheta₂ (z / π) τ

/-- Local copy: SpecialFunctionsTheta, §1.1. `θ₄(z|τ)`. -/
def jacobiThetaFour (z τ : ℂ) : ℂ := jacobiTheta₂ (z / π + 1 / 2) τ

/-- Local copy: SpecialFunctionsTheta, §1.1. `θ₂(z|τ)`. -/
def jacobiThetaTwo (z τ : ℂ) : ℂ := thetaMultiplier z τ * jacobiTheta₂ (z / π + τ / 2) τ

/-- Local copy: SpecialFunctionsTheta, §1.1. `θ₁(z|τ)`. -/
def jacobiThetaOne (z τ : ℂ) : ℂ :=
  -I * thetaMultiplier z τ * jacobiTheta₂ (z / π + 1 / 2 + τ / 2) τ

/-- Local copy: SpecialFunctionsTheta, §6.1. The modulus `k = θ₂²(0|τ)/θ₃²(0|τ)`. -/
def thetaModulus (τ : ℂ) : ℂ := jacobiThetaTwo 0 τ ^ 2 / jacobiThetaThree 0 τ ^ 2

/-- Local copy: SpecialFunctionsTheta, §6.1. The complementary modulus
`k′ = θ₄²(0|τ)/θ₃²(0|τ)`. -/
def thetaComplModulus (τ : ℂ) : ℂ := jacobiThetaFour 0 τ ^ 2 / jacobiThetaThree 0 τ ^ 2

/-- Local copy: SpecialFunctionsTheta, §6.1. The elliptic modular function `λ = k²`. -/
def modularLambda (τ : ℂ) : ℂ := thetaModulus τ ^ 2

/-! ## Layer 1: Neville's theta functions and the twelve functions -/

/-- The four letters `s, c, d, n` of Glaisher's notation (README Conventions). -/
inductive JacobiLetter
  | s
  | c
  | d
  | n
  deriving DecidableEq

/-- README 1.1: Neville's theta functions, with `ζ = u/θ₃²(0|τ)` (DLMF 22.2.4–22.2.11). -/
def nevilleTheta : JacobiLetter → ℂ → ℂ → ℂ
  | .s, τ, u => jacobiThetaThree 0 τ ^ 2 * jacobiThetaOne (u / jacobiThetaThree 0 τ ^ 2) τ /
      deriv (fun z ↦ jacobiThetaOne z τ) 0
  | .c, τ, u => jacobiThetaTwo (u / jacobiThetaThree 0 τ ^ 2) τ / jacobiThetaTwo 0 τ
  | .d, τ, u => jacobiThetaThree (u / jacobiThetaThree 0 τ ^ 2) τ / jacobiThetaThree 0 τ
  | .n, τ, u => jacobiThetaFour (u / jacobiThetaThree 0 τ ^ 2) τ / jacobiThetaFour 0 τ

/-- README 1.1: the twelve Jacobian elliptic functions `pq(u|τ) = θ_p(u|τ)/θ_q(u|τ)`
(DLMF 22.2.11), with Lean's junk value `0` at the zeros of `θ_q`. -/
def jacobiGlaisherTau (p q : JacobiLetter) (τ u : ℂ) : ℂ := nevilleTheta p τ u / nevilleTheta q τ u

/-- `sn(u|τ)` (README 1.1). -/
abbrev jacobiSnTau (τ u : ℂ) : ℂ := jacobiGlaisherTau .s .n τ u

/-- `cn(u|τ)` (README 1.1). -/
abbrev jacobiCnTau (τ u : ℂ) : ℂ := jacobiGlaisherTau .c .n τ u

/-- `dn(u|τ)` (README 1.1). -/
abbrev jacobiDnTau (τ u : ℂ) : ℂ := jacobiGlaisherTau .d .n τ u

/-- README 1.1: the quarter period `K(τ) = (π/2) θ₃²(0|τ)`; the other quarter
period is `iK′ = τK` (Lawden (2.2.3), p. 27). -/
def jacobiK (τ : ℂ) : ℂ := π / 2 * jacobiThetaThree 0 τ ^ 2

/-- Sanity check of the definition: `θ_s(0) = 0` with derivative `1` there, and
`θ_c(0) = θ_d(0) = θ_n(0) = 1`, so that `sn(u|τ) = u + O(u²)` (README 1.1). -/
theorem nevilleTheta_zero {τ : ℂ} (hτ : 0 < τ.im) :
    nevilleTheta .s τ 0 = 0 ∧ HasDerivAt (nevilleTheta .s τ) 1 0 ∧
      nevilleTheta .c τ 0 = 1 ∧ nevilleTheta .d τ 0 = 1 ∧ nevilleTheta .n τ 0 = 1 := by
  sorry

/-- README 1.1: the Neville thetas are entire, two different ones have no common zero, and the
twelve functions are meromorphic. -/
theorem meromorphic_jacobiGlaisherTau {τ : ℂ} (hτ : 0 < τ.im) (p q : JacobiLetter) :
    Differentiable ℂ (nevilleTheta p τ) ∧
      (p ≠ q → ∀ u, nevilleTheta p τ u = 0 → nevilleTheta q τ u ≠ 0) ∧
      Meromorphic (jacobiGlaisherTau p q τ) := by
  sorry

/-- README 1.2: the quadratic relations, in theta form (DLMF 22.6.1). -/
theorem nevilleTheta_sq_add_sq {τ : ℂ} (hτ : 0 < τ.im) (u : ℂ) :
    nevilleTheta .s τ u ^ 2 + nevilleTheta .c τ u ^ 2 = nevilleTheta .n τ u ^ 2 ∧
      nevilleTheta .d τ u ^ 2 + thetaModulus τ ^ 2 * nevilleTheta .s τ u ^ 2 =
        nevilleTheta .n τ u ^ 2 ∧
      nevilleTheta .d τ u ^ 2 - thetaModulus τ ^ 2 * nevilleTheta .c τ u ^ 2 =
        thetaComplModulus τ ^ 2 * nevilleTheta .n τ u ^ 2 := by
  sorry

/-- README 1.3: the derivatives of `sn`, `cn`, `dn` (DLMF Table 22.13.1). -/
theorem hasDerivAt_jacobiSnTau {τ : ℂ} (hτ : 0 < τ.im) {u : ℂ} (hu : nevilleTheta .n τ u ≠ 0) :
    HasDerivAt (jacobiSnTau τ) (jacobiCnTau τ u * jacobiDnTau τ u) u ∧
      HasDerivAt (jacobiCnTau τ) (-(jacobiSnTau τ u * jacobiDnTau τ u)) u ∧
      HasDerivAt (jacobiDnTau τ)
        (-(thetaModulus τ ^ 2 * jacobiSnTau τ u * jacobiCnTau τ u)) u := by
  sorry

/-! ## Layer 2: periods, zeros and poles -/

/-- README 2.1: translation by the quarter periods `K`, `iK′ = τK` and `K + iK′`
(DLMF Table 22.4.3). -/
theorem jacobiSnTau_add_jacobiK {τ : ℂ} (hτ : 0 < τ.im) (u : ℂ) :
    let K := jacobiK τ
    let k := thetaModulus τ
    let k' := thetaComplModulus τ
    (jacobiSnTau τ (u + K) = jacobiGlaisherTau .c .d τ u ∧
      jacobiCnTau τ (u + K) = -k' * jacobiGlaisherTau .s .d τ u ∧
      jacobiDnTau τ (u + K) = k' * jacobiGlaisherTau .n .d τ u) ∧
    (jacobiSnTau τ (u + τ * K) = k⁻¹ * jacobiGlaisherTau .n .s τ u ∧
      jacobiCnTau τ (u + τ * K) = -I * k⁻¹ * jacobiGlaisherTau .d .s τ u ∧
      jacobiDnTau τ (u + τ * K) = -I * jacobiGlaisherTau .c .s τ u) ∧
    (jacobiSnTau τ (u + K + τ * K) = k⁻¹ * jacobiGlaisherTau .d .c τ u ∧
      jacobiCnTau τ (u + K + τ * K) = -I * k' * k⁻¹ * jacobiGlaisherTau .n .c τ u ∧
      jacobiDnTau τ (u + K + τ * K) = I * k' * jacobiGlaisherTau .s .c τ u) := by
  sorry

/-- README 2.2: translation by the half periods `2K` and `2iK′` (DLMF Table 22.4.3). -/
theorem jacobiSnTau_add_two_mul_jacobiK {τ : ℂ} (hτ : 0 < τ.im) (u : ℂ) :
    jacobiSnTau τ (u + 2 * jacobiK τ) = -jacobiSnTau τ u ∧
      jacobiSnTau τ (u + 2 * τ * jacobiK τ) = jacobiSnTau τ u ∧
      jacobiCnTau τ (u + 2 * jacobiK τ) = -jacobiCnTau τ u ∧
      jacobiCnTau τ (u + 2 * τ * jacobiK τ) = -jacobiCnTau τ u ∧
      jacobiDnTau τ (u + 2 * jacobiK τ) = jacobiDnTau τ u ∧
      jacobiDnTau τ (u + 2 * τ * jacobiK τ) = -jacobiDnTau τ u := by
  sorry

/-- README 2.3: the zeros of the four Neville thetas, which are the zeros and poles of the
twelve functions (DLMF Tables 22.4.1–22.4.2). -/
theorem nevilleTheta_eq_zero_iff {τ : ℂ} (hτ : 0 < τ.im) (u : ℂ) :
    let K := jacobiK τ
    (nevilleTheta .s τ u = 0 ↔ ∃ m n : ℤ, u = 2 * m * K + 2 * n * τ * K) ∧
      (nevilleTheta .c τ u = 0 ↔ ∃ m n : ℤ, u = (2 * m + 1) * K + 2 * n * τ * K) ∧
      (nevilleTheta .d τ u = 0 ↔ ∃ m n : ℤ, u = (2 * m + 1) * K + (2 * n + 1) * τ * K) ∧
      (nevilleTheta .n τ u = 0 ↔ ∃ m n : ℤ, u = 2 * m * K + (2 * n + 1) * τ * K) := by
  sorry

/-- README 2.3: the residues of `sn`, `cn`, `dn` at `iK′ = τK` (DLMF Table 22.5.1). -/
theorem tendsto_sub_mul_jacobiSnTau {τ : ℂ} (hτ : 0 < τ.im) :
    let p := τ * jacobiK τ
    Tendsto (fun u ↦ (u - p) * jacobiSnTau τ u) (𝓝[≠] p) (𝓝 (thetaModulus τ)⁻¹) ∧
      Tendsto (fun u ↦ (u - p) * jacobiCnTau τ u) (𝓝[≠] p) (𝓝 (-I * (thetaModulus τ)⁻¹)) ∧
      Tendsto (fun u ↦ (u - p) * jacobiDnTau τ u) (𝓝[≠] p) (𝓝 (-I)) := by
  sorry

/-! ## Layer 3: the modulus -/

/-- README 3.1: every `μ ≠ 0, 1` is a value of `λ` on the upper half plane. -/
theorem exists_modularLambda_eq {μ : ℂ} (h₀ : μ ≠ 0) (h₁ : μ ≠ 1) :
    ∃ τ : ℂ, 0 < τ.im ∧ modularLambda τ = μ := by
  sorry

/-- README 3.1: a parameter `τ` with `λ(τ) = k²`, chosen; the junk value `i` when `k² ∈ {0, 1}`.
-/
def jacobiTau (k : ℂ) : ℂ := by
  classical
  exact if h : ∃ τ : ℂ, 0 < τ.im ∧ modularLambda τ = k ^ 2 then h.choose else I

/-- README 1.1 and 7.2: Jacobi's zeta function `Z(u|τ) = θ_n′(u|τ)/θ_n(u|τ)` (DLMF 22.16.30,
22.16.32). -/
def jacobiZetaTau (τ u : ℂ) : ℂ := logDeriv (nevilleTheta .n τ) u

/-- README 7.2: Jacobi's epsilon function `ℰ(u|τ) = Z(u|τ) + (1 − Z′(0|τ)) u`, the primitive of
`dn²` vanishing at `0` (DLMF 22.16.17, 22.16.30). -/
def jacobiEpsilonTau (τ u : ℂ) : ℂ := jacobiZetaTau τ u + (1 - deriv (jacobiZetaTau τ) 0) * u

/-- README 7.2: the complete integral of the second kind `E(τ) = ℰ(K(τ)|τ)` (DLMF 22.16.28 at
`x = 0`). -/
def jacobiETau (τ : ℂ) : ℂ := jacobiEpsilonTau τ (jacobiK τ)

/-- README 3.2: `sn`, `cn`, `dn`, the other nine functions and `ℰ` depend on `τ` only through
`λ(τ) = k²`. -/
theorem jacobiGlaisherTau_eq_of_modularLambda_eq {τ₁ τ₂ : ℂ} (h₁ : 0 < τ₁.im) (h₂ : 0 < τ₂.im)
    (h : modularLambda τ₁ = modularLambda τ₂) (p q : JacobiLetter) :
    jacobiGlaisherTau p q τ₁ = jacobiGlaisherTau p q τ₂ ∧
      ∀ u, nevilleTheta .n τ₁ u ≠ 0 → jacobiEpsilonTau τ₁ u = jacobiEpsilonTau τ₂ u := by
  sorry

/-- README 3.3: Carlson's parameter `τ = i R_F(0, k², 1)/R_F(0, 1 − k², 1)`. -/
def carlsonTau (k : ℂ) : ℂ := I * carlsonRF 0 (k ^ 2) 1 / carlsonRF 0 (1 - k ^ 2) 1

/-- README 3.3: off the two cuts, Carlson's parameter lies in the upper half plane, has
`λ = k²`, `K = R_F(0, 1 − k², 1)` and `K′ = R_F(0, k², 1)` (DLMF 22.2.12). -/
theorem carlsonTau_spec {k : ℂ} (h₁ : k ^ 2 ∈ slitPlane) (h₂ : 1 - k ^ 2 ∈ slitPlane) :
    0 < (carlsonTau k).im ∧ modularLambda (carlsonTau k) = k ^ 2 ∧
      jacobiK (carlsonTau k) = carlsonRF 0 (1 - k ^ 2) 1 ∧
      jacobiK (-1 / carlsonTau k) = carlsonRF 0 (k ^ 2) 1 := by
  sorry

/-- README 3.4: the four Neville thetas at modulus `0`. -/
def nevilleThetaCircular : JacobiLetter → ℂ → ℂ
  | .s => Complex.sin
  | .c => Complex.cos
  | .d => fun _ ↦ 1
  | .n => fun _ ↦ 1

/-- README 3.4: the four Neville thetas at modulus `1`. -/
def nevilleThetaHyperbolic : JacobiLetter → ℂ → ℂ
  | .s => Complex.sinh
  | .c => fun _ ↦ 1
  | .d => fun _ ↦ 1
  | .n => Complex.cosh

/-- README 3.4: the twelve functions `pq(u, k)` of a complex modulus. -/
def jacobiGlaisher (p q : JacobiLetter) (k u : ℂ) : ℂ := by
  classical
  exact if k ^ 2 = 0 then nevilleThetaCircular p u / nevilleThetaCircular q u
    else if k ^ 2 = 1 then nevilleThetaHyperbolic p u / nevilleThetaHyperbolic q u
    else jacobiGlaisherTau p q (jacobiTau k) u

/-- `sn(u, k)` (README 3.4). -/
abbrev jacobiSn (k u : ℂ) : ℂ := jacobiGlaisher .s .n k u

/-- `cn(u, k)` (README 3.4). -/
abbrev jacobiCn (k u : ℂ) : ℂ := jacobiGlaisher .c .n k u

/-- `dn(u, k)` (README 3.4). -/
abbrev jacobiDn (k u : ℂ) : ℂ := jacobiGlaisher .d .n k u

/-- README 3.4: `ℰ(u, k)`, with `ℰ(u, 0) = u` and `ℰ(u, 1) = tanh u` (Lawden (3.5.15),
p. 65). -/
def jacobiEpsilon (k u : ℂ) : ℂ := by
  classical
  exact if k ^ 2 = 0 then u else if k ^ 2 = 1 then Complex.tanh u
    else jacobiEpsilonTau (jacobiTau k) u

/-- Sanity check of the definition: at modulus `0` the functions are `sin`, `cos`, `1`, and at
modulus `1` they are `tanh`, `sech`, `sech` (README 3.4). -/
theorem jacobiSn_zero_modulus_one_modulus (u : ℂ) :
    jacobiSn 0 u = Complex.sin u ∧ jacobiCn 0 u = Complex.cos u ∧ jacobiDn 0 u = 1 ∧
      jacobiSn 1 u = Complex.tanh u ∧ jacobiCn 1 u = (Complex.cosh u)⁻¹ ∧
      jacobiDn 1 u = (Complex.cosh u)⁻¹ := by
  sorry

/-- README 3.4: the modulus form agrees with the `τ` form at every `τ` with `λ(τ) = k²`. -/
theorem jacobiGlaisher_eq_jacobiGlaisherTau {k τ : ℂ} (hτ : 0 < τ.im)
    (h : modularLambda τ = k ^ 2) (p q : JacobiLetter) :
    jacobiGlaisher p q k = jacobiGlaisherTau p q τ ∧
      ∀ u, nevilleTheta .n τ u ≠ 0 → jacobiEpsilon k u = jacobiEpsilonTau τ u := by
  sorry

/-- README 3.4: for a real modulus with `k² < 1` and a real argument, the functions are Tau Ceti's
real `sn`, `cn`, `dn`. -/
theorem jacobiSn_ofReal {k : ℝ} (hk : k ^ 2 < 1) (u : ℝ) :
    jacobiSn k u = (TauCeti.Real.jacobiSn k u : ℂ) ∧
      jacobiCn k u = (TauCeti.Real.jacobiCn k u : ℂ) ∧
      jacobiDn k u = (TauCeti.Real.jacobiDn k u : ℂ) := by
  sorry

/-- README 3.5: the limit `k → 0` (DLMF Table 22.5.3). -/
theorem tendsto_jacobiSn_modulus_zero (u : ℂ) :
    Tendsto (fun k ↦ jacobiSn k u) (𝓝 0) (𝓝 (Complex.sin u)) ∧
      Tendsto (fun k ↦ jacobiCn k u) (𝓝 0) (𝓝 (Complex.cos u)) ∧
      Tendsto (fun k ↦ jacobiDn k u) (𝓝 0) (𝓝 1) := by
  sorry

/-- README 3.5: the limit `k → 1` off the poles of `tanh` (DLMF Table 22.5.4). -/
theorem tendsto_jacobiSn_modulus_one {u : ℂ} (hu : Complex.cosh u ≠ 0) :
    Tendsto (fun k ↦ jacobiSn k u) (𝓝 1) (𝓝 (Complex.tanh u)) ∧
      Tendsto (fun k ↦ jacobiCn k u) (𝓝 1) (𝓝 (Complex.cosh u)⁻¹) ∧
      Tendsto (fun k ↦ jacobiDn k u) (𝓝 1) (𝓝 (Complex.cosh u)⁻¹) := by
  sorry

/-! ## Layer 4: transformations -/

/-- README 4.1: Jacobi's imaginary transformation, `τ ↦ −1/τ` (DLMF Table 22.6.1). -/
theorem jacobiSnTau_I_mul {τ : ℂ} (hτ : 0 < τ.im) (u : ℂ) :
    jacobiSnTau τ (I * u) = I * jacobiGlaisherTau .s .c (-1 / τ) u ∧
      jacobiCnTau τ (I * u) = jacobiGlaisherTau .n .c (-1 / τ) u ∧
      jacobiDnTau τ (I * u) = jacobiGlaisherTau .d .c (-1 / τ) u := by
  sorry

/-- README 4.2: the reciprocal-modulus transformation (DLMF 22.17.2–4). -/
theorem jacobiSn_inv_modulus {k : ℂ} (hk : k ≠ 0) (u : ℂ) :
    jacobiSn k⁻¹ u = k * jacobiSn k (u / k) ∧ jacobiCn k⁻¹ u = jacobiDn k (u / k) ∧
      jacobiDn k⁻¹ u = jacobiCn k (u / k) := by
  sorry

/-- README 4.3: the imaginary-modulus transformation, for either root `k₁′` of
`k₁′²(1 + k²) = 1` (DLMF 22.17.6–8). -/
theorem jacobiSn_I_mul_modulus {k k₁' : ℂ} (h : k₁' ^ 2 * (1 + k ^ 2) = 1) (u : ℂ) :
    jacobiSn (I * k) u = k₁' * jacobiGlaisher .s .d (k * k₁') (u / k₁') ∧
      jacobiCn (I * k) u = jacobiGlaisher .c .d (k * k₁') (u / k₁') ∧
      jacobiDn (I * k) u = jacobiGlaisher .n .d (k * k₁') (u / k₁') := by
  sorry

/-- README 4.4: the descending Landen transformation, `τ ↦ 2τ` (DLMF 22.7.1–4). -/
theorem jacobiSnTau_landen {τ : ℂ} (hτ : 0 < τ.im) {k₁ u w : ℂ}
    (hk₁ : k₁ = thetaModulus (2 * τ)) (hw : w = u / (1 + k₁))
    (hn : nevilleTheta .n (2 * τ) w ≠ 0) (hs : 1 + k₁ * jacobiSnTau (2 * τ) w ^ 2 ≠ 0)
    (hd : 1 + k₁ - jacobiDnTau (2 * τ) w ^ 2 ≠ 0) :
    k₁ = (1 - thetaComplModulus τ) / (1 + thetaComplModulus τ) ∧
      (1 + k₁) * jacobiK (2 * τ) = jacobiK τ ∧
      jacobiSnTau τ u = (1 + k₁) * jacobiSnTau (2 * τ) w / (1 + k₁ * jacobiSnTau (2 * τ) w ^ 2) ∧
      jacobiCnTau τ u = jacobiCnTau (2 * τ) w * jacobiDnTau (2 * τ) w /
        (1 + k₁ * jacobiSnTau (2 * τ) w ^ 2) ∧
      jacobiDnTau τ u = (jacobiDnTau (2 * τ) w ^ 2 - (1 - k₁)) /
        (1 + k₁ - jacobiDnTau (2 * τ) w ^ 2) := by
  sorry

/-- README 4.5: the ascending Gauss transformation, `τ ↦ τ/2` (DLMF 22.7.5–8). -/
theorem jacobiSnTau_gauss {τ : ℂ} (hτ : 0 < τ.im) {k₂ k₂' u w : ℂ}
    (hk₂ : k₂ = thetaModulus (τ / 2)) (hk₂' : k₂' = thetaComplModulus (τ / 2))
    (hw : w = u / (1 + k₂')) (hn : nevilleTheta .n (τ / 2) w ≠ 0)
    (hd : nevilleTheta .d (τ / 2) w ≠ 0) :
    k₂' = (1 - thetaModulus τ) / (1 + thetaModulus τ) ∧
      jacobiSnTau τ u = (1 + k₂') * jacobiSnTau (τ / 2) w * jacobiCnTau (τ / 2) w /
        jacobiDnTau (τ / 2) w ∧
      jacobiCnTau τ u = (1 + k₂') * (jacobiDnTau (τ / 2) w ^ 2 - k₂') /
        (k₂ ^ 2 * jacobiDnTau (τ / 2) w) ∧
      jacobiDnTau τ u = (1 - k₂') * (jacobiDnTau (τ / 2) w ^ 2 + k₂') /
        (k₂ ^ 2 * jacobiDnTau (τ / 2) w) := by
  sorry

/-! ## Layer 5: addition -/

/-- README 5.1: the addition theorems for complex arguments (DLMF 22.8.1–3). -/
theorem jacobiSnTau_add {τ : ℂ} (hτ : 0 < τ.im) {u v : ℂ} (hu : nevilleTheta .n τ u ≠ 0)
    (hv : nevilleTheta .n τ v ≠ 0)
    (hD : 1 - thetaModulus τ ^ 2 * jacobiSnTau τ u ^ 2 * jacobiSnTau τ v ^ 2 ≠ 0) :
    let D := 1 - thetaModulus τ ^ 2 * jacobiSnTau τ u ^ 2 * jacobiSnTau τ v ^ 2
    jacobiSnTau τ (u + v) = (jacobiSnTau τ u * jacobiCnTau τ v * jacobiDnTau τ v +
        jacobiSnTau τ v * jacobiCnTau τ u * jacobiDnTau τ u) / D ∧
      jacobiCnTau τ (u + v) = (jacobiCnTau τ u * jacobiCnTau τ v -
        jacobiSnTau τ u * jacobiDnTau τ u * jacobiSnTau τ v * jacobiDnTau τ v) / D ∧
      jacobiDnTau τ (u + v) = (jacobiDnTau τ u * jacobiDnTau τ v - thetaModulus τ ^ 2 *
        jacobiSnTau τ u * jacobiCnTau τ u * jacobiSnTau τ v * jacobiCnTau τ v) / D := by
  sorry

/-! ## Layer 6: series and products -/

/-- README 6.1: the Fourier series in the strip `|Im ζ| < π Im τ/2`, with `u = θ₃²(0|τ) ζ` and
`q^a = e^{iπτa}` (DLMF 22.11.1–3). -/
theorem hasSum_jacobiSnTau_fourier {τ : ℂ} (hτ : 0 < τ.im) {ζ : ℂ}
    (hζ : |ζ.im| < π * τ.im / 2) :
    let K := jacobiK τ
    let k := thetaModulus τ
    let u := jacobiThetaThree 0 τ ^ 2 * ζ
    HasSum (fun n : ℕ ↦ 2 * π / (K * k) * cexp (π * I * τ * (n + 1 / 2)) *
        Complex.sin ((2 * n + 1) * ζ) / (1 - cexp (π * I * τ * (2 * n + 1))))
      (jacobiSnTau τ u) ∧
    HasSum (fun n : ℕ ↦ 2 * π / (K * k) * cexp (π * I * τ * (n + 1 / 2)) *
        Complex.cos ((2 * n + 1) * ζ) / (1 + cexp (π * I * τ * (2 * n + 1))))
      (jacobiCnTau τ u) ∧
    HasSum (fun n : ℕ ↦ 2 * π / K * cexp (π * I * τ * (n + 1)) *
        Complex.cos (2 * (n + 1) * ζ) / (1 + cexp (π * I * τ * (2 * (n + 1)))))
      (jacobiDnTau τ u - π / (2 * K)) := by
  sorry

/-- README 6.2: the expansions of `sn` and `cn` in cosecants over the poles (DLMF 22.12.2–3). -/
theorem hasSum_jacobiSnTau_cosec {τ : ℂ} (hτ : 0 < τ.im) {t : ℂ}
    (ht : ∀ n : ℤ, Complex.sin (π * (t - (n + 1 / 2) * τ)) ≠ 0) :
    let K := jacobiK τ
    let k := thetaModulus τ
    HasSum (fun n : ℤ ↦ π / Complex.sin (π * (t - (n + 1 / 2) * τ)))
        (2 * K * k * jacobiSnTau τ (2 * K * t)) ∧
      HasSum (fun n : ℤ ↦ (-1 : ℂ) ^ n * π / Complex.sin (π * (t - (n + 1 / 2) * τ)))
        (2 * I * K * k * jacobiCnTau τ (2 * K * t)) := by
  sorry

/-- README 6.3: the product formulas, with `u = θ₃²(0|τ) ζ`, `q^a = e^{iπτa}`,
`k^{−1/2} = θ₃(0)/θ₂(0)`, `k′^{1/2}k^{−1/2} = θ₄(0)/θ₂(0)`, `k′^{1/2} = θ₄(0)/θ₃(0)`
(Whittaker–Watson §22.5). -/
theorem hasProd_jacobiSnTau {τ : ℂ} (hτ : 0 < τ.im) {ζ : ℂ} (hζ : jacobiThetaFour ζ τ ≠ 0) :
    let q : ℂ → ℂ := fun a ↦ cexp (π * I * τ * a)
    let u := jacobiThetaThree 0 τ ^ 2 * ζ
    let den : ℕ → ℂ := fun n ↦ 1 - 2 * q (2 * n + 1) * Complex.cos (2 * ζ) + q (4 * n + 2)
    (∃ P, HasProd (fun n : ℕ ↦
        (1 - 2 * q (2 * (n + 1)) * Complex.cos (2 * ζ) + q (4 * (n + 1))) / den n) P ∧
      jacobiSnTau τ u = jacobiThetaThree 0 τ / jacobiThetaTwo 0 τ * 2 * q (1 / 4) *
        Complex.sin ζ * P) ∧
    (∃ P, HasProd (fun n : ℕ ↦
        (1 + 2 * q (2 * (n + 1)) * Complex.cos (2 * ζ) + q (4 * (n + 1))) / den n) P ∧
      jacobiCnTau τ u = jacobiThetaFour 0 τ / jacobiThetaTwo 0 τ * 2 * q (1 / 4) *
        Complex.cos ζ * P) ∧
    (∃ P, HasProd (fun n : ℕ ↦
        (1 + 2 * q (2 * n + 1) * Complex.cos (2 * ζ) + q (4 * n + 2)) / den n) P ∧
      jacobiDnTau τ u = jacobiThetaFour 0 τ / jacobiThetaThree 0 τ * P) := by
  sorry

/-! ## Layer 7: Weierstrass's functions, Jacobi's epsilon and zeta functions -/

/-- README 7.1: `℘` of the lattice `ℤτ + ℤ` in terms of `ns²`, and the three half-period values
`e₁, e₂, e₃` (Lawden (6.9.10)–(6.9.11), p. 163). -/
theorem weierstrassP_jacobiK {τ : ℂ} (hτ : 0 < τ.im) {u : ℂ} (hu : nevilleTheta .s τ u ≠ 0) :
    let L := (UpperHalfPlane.mk τ hτ).periodPair
    let K := jacobiK τ
    let k := thetaModulus τ
    L.weierstrassP (u / (2 * K)) / (2 * K) ^ 2 = jacobiGlaisherTau .n .s τ u ^ 2 - (1 + k ^ 2) / 3 ∧
      L.weierstrassP (1 / 2) / (2 * K) ^ 2 = (2 - k ^ 2) / 3 ∧
      L.weierstrassP ((1 + τ) / 2) / (2 * K) ^ 2 = (2 * k ^ 2 - 1) / 3 ∧
      L.weierstrassP (τ / 2) / (2 * K) ^ 2 = -(1 + k ^ 2) / 3 := by
  sorry

/-- README 7.2: `ℰ′ = dn²`, and `E = K (1 − Z′(0))` (DLMF 22.16.17, 22.16.30). -/
theorem hasDerivAt_jacobiEpsilonTau {τ : ℂ} (hτ : 0 < τ.im) {u : ℂ}
    (hu : nevilleTheta .n τ u ≠ 0) :
    HasDerivAt (jacobiEpsilonTau τ) (jacobiDnTau τ u ^ 2) u ∧
      jacobiETau τ = jacobiK τ * (1 - deriv (jacobiZetaTau τ) 0) := by
  sorry

/-- README 7.3: the quasi-periodicity of `Z` and `ℰ` (DLMF 22.16.29, 22.16.34;
Lawden (3.6.14), p. 66). -/
theorem jacobiZetaTau_add_two_mul_jacobiK {τ : ℂ} (hτ : 0 < τ.im) {u : ℂ}
    (hu : nevilleTheta .n τ u ≠ 0) :
    let K := jacobiK τ
    jacobiZetaTau τ (u + 2 * K) = jacobiZetaTau τ u ∧
      jacobiZetaTau τ (u + 2 * τ * K) = jacobiZetaTau τ u - π * I / K ∧
      jacobiEpsilonTau τ (u + 2 * K) = jacobiEpsilonTau τ u + 2 * jacobiETau τ ∧
      jacobiEpsilonTau τ (u + 2 * τ * K) =
        jacobiEpsilonTau τ u + 2 * τ * jacobiETau τ - π * I / K := by
  sorry

/-- README 7.3: the imaginary transformation of `ℰ` (Armitage–Eberlein (5.52), p. 131). -/
theorem jacobiEpsilonTau_I_mul {τ : ℂ} (hτ : 0 < τ.im) {u : ℂ}
    (hc : nevilleTheta .c (-1 / τ) u ≠ 0) (hn : nevilleTheta .n (-1 / τ) u ≠ 0) :
    jacobiEpsilonTau τ (I * u) = I * (u + jacobiDnTau (-1 / τ) u *
      jacobiGlaisherTau .s .c (-1 / τ) u - jacobiEpsilonTau (-1 / τ) u) := by
  sorry

/-- README 7.4: Legendre's relation for complex `τ`, with `K′ = K(−1/τ)`, `E′ = E(−1/τ)`
(Armitage–Eberlein, Theorem 5.11, p. 131). -/
theorem jacobiETau_legendre {τ : ℂ} (hτ : 0 < τ.im) :
    jacobiETau τ * jacobiK (-1 / τ) + jacobiETau (-1 / τ) * jacobiK τ -
      jacobiK τ * jacobiK (-1 / τ) = π / 2 := by
  sorry

/-- README 7.4: at Carlson's parameter, `E = R_F(0, k′², 1) − (k²/3) R_D(0, k′², 1)`,
with `k′² = 1 − k²`. -/
theorem jacobiETau_carlsonTau {k : ℂ} (h₁ : k ^ 2 ∈ slitPlane) (h₂ : 1 - k ^ 2 ∈ slitPlane) :
    jacobiETau (carlsonTau k) =
      carlsonRF 0 (1 - k ^ 2) 1 - k ^ 2 / 3 * carlsonRD 0 (1 - k ^ 2) 1 := by
  sorry

/-- README 7.5: Weierstrass's `ζ` of the lattice `ℤτ + ℤ` in terms of `ℰ`, `cs` and `dn`. -/
theorem weierstrassZeta_jacobiK {τ : ℂ} (hτ : 0 < τ.im) {u : ℂ}
    (hs : nevilleTheta .s τ u ≠ 0) (hn : nevilleTheta .n τ u ≠ 0) :
    let L := (UpperHalfPlane.mk τ hτ).periodPair
    let K := jacobiK τ
    L.weierstrassZeta (u / (2 * K)) / (2 * K) = jacobiEpsilonTau τ u +
      jacobiGlaisherTau .c .s τ u * jacobiDnTau τ u - (2 - thetaModulus τ ^ 2) * u / 3 := by
  sorry

/-! ## Layer 8: the inverse function -/

/-- README 8.1: `arcsn x = x R_F(1 − x², 1 − k²x², 1)` inverts `sn` on the star-shaped domain
where `1 − x²` and `1 − k²x²` avoid `(−∞, 0]`, with derivative
`(1 − x²)^{−1/2}(1 − k²x²)^{−1/2}` (DLMF 22.15.11). -/
theorem jacobiSn_mul_carlsonRF {k x : ℂ} (hx : 1 - x ^ 2 ∈ slitPlane)
    (hkx : 1 - k ^ 2 * x ^ 2 ∈ slitPlane) :
    jacobiSn k (x * carlsonRF (1 - x ^ 2) (1 - k ^ 2 * x ^ 2) 1) = x ∧
      HasDerivAt (fun y ↦ y * carlsonRF (1 - y ^ 2) (1 - k ^ 2 * y ^ 2) 1)
        ((1 - x ^ 2) ^ (-1 / 2 : ℂ) * (1 - k ^ 2 * x ^ 2) ^ (-1 / 2 : ℂ)) x := by
  sorry

/-! ## Library declarations consumed -/

#check @jacobiTheta₂
#check @jacobiTheta₂_functional_equation
#check @jacobiTheta₂_add_left
#check @Meromorphic
#check @logDeriv
#check @HasProd
#check @HasSum
#check @slitPlane
#check @Complex.cpow
#check @PeriodPair
#check @PeriodPair.weierstrassP
#check @PeriodPair.derivWeierstrassP_sq
#check @PeriodPair.meromorphic_weierstrassP
#check @PeriodPair.weierstrassZeta
#check @PeriodPair.hasDerivAt_weierstrassZeta
#check @PeriodPair.weierstrassZeta_add_coe
#check @PeriodPair.quasiPeriod
#check @UpperHalfPlane.periodPair
#check @PeriodPair.weierstrassP_smul
#check @Complex.carlsonRF
#check @Complex.carlsonRD
#check @TauCeti.Real.legendreK
#check @TauCeti.Real.legendreEc
#check @TauCeti.Real.ofReal_legendreK_eq_carlsonRF
#check @TauCeti.Real.ofReal_legendreEc_eq_carlsonRF_sub_carlsonRD
#check @TauCeti.Real.jacobiSn
#check @TauCeti.Real.jacobiCn
#check @TauCeti.Real.jacobiDn
#check @TauCeti.Real.hasDerivAt_jacobiSn
#check @TauCeti.Real.jacobiSn_zero_modulus
#check @ODE_solution_unique_of_mem_Ioo
#check @AnalyticOnNhd.eqOn_of_preconnected_of_eventuallyEq
#check @Differentiable.apply_eq_apply_of_bounded

end TauCetiRoadmap.SpecialFunctionsJacobiElliptic
