module

public import Mathlib
public import TauCeti.Analysis.SpecialFunctions.EllipticIntegral.Legendre

/-!
# Legendre and related functions: target signatures

This file states the headline theorems of the roadmap against the pinned Mathlib and Tau Ceti,
one or more per layer, as a check that the conventions of `README.md` can be stated. `README.md`
is the definitive document and states every target; the statements here are a selection of
them.

The definitions below are roadmap-local copies. Euler's integral, `IsEulerContinuation` and
`regularizedGaussHypergeometric` copy the definitions that SpecialFunctionsHypergeometric pins (in
Tau Ceti they live in `Complex`, beside Mathlib's `Complex.regularizedGaussHGFun`), so that this
file compiles against the pins alone. The Legendre functions copy the definitions of `README.md`
with their intended bodies, so that the conventions are checked by the compiler: degree, then
order, then argument; principal powers, with `(z² − 1)^{μ/2}` written as
`(z − 1)^{μ/2} (z + 1)^{μ/2}`; reciprocal Gamma factors; the doubly cut plane
`D = {1 − z ∈ slitPlane ∧ 1 + z ∈ slitPlane}` for the Ferrers functions and
`U = {z − 1 ∈ slitPlane}` for the associated Legendre functions; and `𝖰^μ_ν` by the even–odd form
14.3.12 rather than by 14.3.2. The convergents of the continued fraction of 6.2 are written out by
a recursion (`contFracFrom`). Theorems are stated with `sorry`.
-/

@[expose] public section

noncomputable section

namespace TauCetiRoadmap.SpecialFunctionsLegendre

open Complex Filter Topology Set MeasureTheory Asymptotics
open scoped Real Nat ComplexConjugate

/-- The Pochhammer symbol `(a)ₙ`. -/
local notation "poch(" a ", " n ")" => Polynomial.eval a (ascPochhammer ℂ n)

/-! ### The supplier's `𝐅` (local copy of SpecialFunctionsHypergeometric) -/

/-- Euler's integral `(Γ(b) Γ(c − b))⁻¹ ∫₀¹ t^{b−1} (1 − t)^{c−b−1} (1 − zt)^{−a} dt`
(DLMF 15.6.1), with principal powers. -/
def eulerIntegral (a b c z : ℂ) : ℂ :=
  (Gamma b * Gamma (c - b))⁻¹ *
    ∫ t in (0 : ℝ)..1, (t : ℂ) ^ (b - 1) * (1 - (t : ℂ)) ^ (c - b - 1) * (1 - z * t) ^ (-a)

/-- `G` continues Euler's integral: at every `z` of the cut plane it is entire in `b` and in `c`,
and it equals Euler's integral where `0 < Re b < Re c`. -/
def IsEulerContinuation (G : ℂ → ℂ → ℂ → ℂ → ℂ) : Prop :=
  (∀ a c z, 1 - z ∈ slitPlane → Differentiable ℂ fun b => G a b c z) ∧
  (∀ a b z, 1 - z ∈ slitPlane → Differentiable ℂ fun c => G a b c z) ∧
  (∀ a b c z, 1 - z ∈ slitPlane → 0 < b.re → b.re < c.re → G a b c z = eulerIntegral a b c z)

open scoped Classical in
/-- Olver's regularized hypergeometric function `𝐅(a, b; c; z)` (DLMF 15.2.2), principal branch
on `1 − z ∈ slitPlane`, with the junk value `0` off it. -/
def regularizedGaussHypergeometric (a b c z : ℂ) : ℂ :=
  if h : ∃ G, IsEulerContinuation G then
    if 1 - z ∈ slitPlane then h.choose a b c z else 0
  else 0

/-- `𝐅(a, b; c; z)`. -/
local notation "𝐅" => regularizedGaussHypergeometric

/-! ### Definitions -/

/-- The Ferrers function of the first kind `𝖯^μ_ν(z)` (DLMF 14.3.1), holomorphic on `D`. -/
def ferrersP (ν μ z : ℂ) : ℂ :=
  ((1 + z) / (1 - z)) ^ (μ / 2) * 𝐅 (ν + 1) (-ν) (1 - μ) ((1 - z) / 2)

/-- The even solution `w₁(ν, μ, z)` of DLMF 14.3.13. -/
def ferrersW₁ (ν μ z : ℂ) : ℂ :=
  2 ^ μ * Gamma (ν / 2 + μ / 2 + 1 / 2) * (Gamma (ν / 2 - μ / 2 + 1))⁻¹ * (1 - z ^ 2) ^ (-μ / 2) *
    𝐅 (-ν / 2 - μ / 2) (ν / 2 - μ / 2 + 1 / 2) (1 / 2) (z ^ 2)

/-- The odd solution `w₂(ν, μ, z)` of DLMF 14.3.14. -/
def ferrersW₂ (ν μ z : ℂ) : ℂ :=
  2 ^ μ * Gamma (ν / 2 + μ / 2 + 1) * (Gamma (ν / 2 - μ / 2 + 1 / 2))⁻¹ * z *
    (1 - z ^ 2) ^ (-μ / 2) * 𝐅 (1 / 2 - ν / 2 - μ / 2) (ν / 2 - μ / 2 + 1) (3 / 2) (z ^ 2)

/-- The Ferrers function of the second kind `𝖰^μ_ν(z)`, by the even–odd form DLMF 14.3.12. Where
`ν + μ ∈ {−1, −2, …}` the value is the junk produced by `Γ` at its poles. -/
def ferrersQ (ν μ z : ℂ) : ℂ :=
  -(π / 2) * sin ((ν + μ) * π / 2) * ferrersW₁ ν μ z +
    (π / 2) * cos ((ν + μ) * π / 2) * ferrersW₂ ν μ z

/-- The associated Legendre function of the first kind `P^μ_ν(z)` (DLMF 14.3.6), holomorphic on
`U`. -/
def associatedLegendreP (ν μ z : ℂ) : ℂ :=
  ((z + 1) / (z - 1)) ^ (μ / 2) * 𝐅 (ν + 1) (-ν) (1 - μ) ((1 - z) / 2)

/-- Olver's associated Legendre function `𝑸^μ_ν(z)` (DLMF 14.3.7 with 14.3.10), holomorphic on
`U`, with `(z² − 1)^{μ/2} = (z − 1)^{μ/2} (z + 1)^{μ/2}`. -/
def olverLegendreQ (ν μ z : ℂ) : ℂ :=
  (Real.sqrt π : ℂ) * (z - 1) ^ (μ / 2) * (z + 1) ^ (μ / 2) * (2 ^ (ν + 1) * z ^ (ν + μ + 1))⁻¹ *
    𝐅 (ν / 2 + μ / 2 + 1) (ν / 2 + μ / 2 + 1 / 2) (ν + 3 / 2) ((z ^ 2)⁻¹)

/-- The associated Legendre function of the second kind
`Q^μ_ν(z) = e^{μπi} Γ(ν + μ + 1) 𝑸^μ_ν(z)` (DLMF 14.3.10). -/
def associatedLegendreQ (ν μ z : ℂ) : ℂ :=
  exp (μ * π * I) * Gamma (ν + μ + 1) * olverLegendreQ ν μ z

/-- Dunster's conical function `𝖰̂^μ_{−½+iτ}(x)` for real `μ, τ` and `−1 < x < 1`
(DLMF 14.20.2 at `−μ`); DLMF's `𝖰̂^{−μ}_{−½+iτ}` is `conicalQHat (−μ) τ`. -/
def _root_.Real.conicalQHat (μ τ x : ℝ) : ℝ :=
  (exp (-(μ * π * I)) * ferrersQ (-1 / 2 + τ * I) μ x).re +
    π / 2 * Real.sin (μ * π) * (ferrersP (-1 / 2 + τ * I) μ x).re

/-- The spherical harmonic `Y_{l,m}(θ, φ)` (DLMF 14.30.1); the value `0` for `|m| > l` is junk. -/
def sphericalHarmonic (l : ℕ) (m : ℤ) (θ phi : ℝ) : ℂ :=
  if m.natAbs ≤ l then
    (Real.sqrt (((l - m).toNat)! * (2 * l + 1) / (4 * π * ((l + m).toNat)!)) : ℂ) *
      exp (m * phi * I) * ferrersP l m (Real.cos θ)
  else 0

/-- The Legendre polynomial `Pₙ(z)`: Mathlib's `shiftedLegendre n` at `(1 − z)/2`. An abbreviation
for the statements, not a new definition of `README.md`. -/
abbrev legP (n : ℕ) (z : ℂ) : ℂ :=
  ((Polynomial.shiftedLegendre n).map (Int.castRingHom ℂ)).eval ((1 - z) / 2)

/-- The convergent `a_k/(b_k + a_{k+1}/(b_{k+1} + ⋯ + a_{k+n}/b_{k+n}))` of a continued
fraction. -/
def contFracFrom (a b : ℕ → ℂ) : ℕ → ℕ → ℂ
  | 0, k => a k / b k
  | n + 1, k => a k / (b k + contFracFrom a b n (k + 1))

/-! ### Layer 1: definitions, the equations and analytic properties -/

/-- **1.2** At each point of `D`, `𝖯^μ_ν(z)` is entire in the degree. -/
theorem differentiable_ferrersP_degree (μ : ℂ) {z : ℂ} (hz₁ : 1 - z ∈ slitPlane)
    (hz₂ : 1 + z ∈ slitPlane) : Differentiable ℂ fun ν => ferrersP ν μ z := sorry

/-- **1.2** Conjugation (§14.2(ii), §14.21(i)). -/
theorem ferrersP_conj (ν μ : ℂ) {z : ℂ} (hz₁ : 1 - z ∈ slitPlane) (hz₂ : 1 + z ∈ slitPlane) :
    ferrersP (conj ν) (conj μ) (conj z) = conj (ferrersP ν μ z) := sorry

/-- **1.2** DLMF 14.9.14 on `U`: `𝑸^{−μ}_ν = 𝑸^μ_ν`. -/
theorem olverLegendreQ_neg_order (ν μ : ℂ) {z : ℂ} (hz : z - 1 ∈ slitPlane) :
    olverLegendreQ ν (-μ) z = olverLegendreQ ν μ z := sorry

/-- **1.3** `𝖯^μ_ν` solves the associated Legendre equation 14.21.1 on `D`, for every `μ`
(so `𝖯^{±μ}_ν` both do). -/
theorem ferrersP_legendreEquation (ν μ : ℂ) {z : ℂ} (hz₁ : 1 - z ∈ slitPlane)
    (hz₂ : 1 + z ∈ slitPlane) :
    (1 - z ^ 2) * deriv^[2] (ferrersP ν μ) z - 2 * z * deriv (ferrersP ν μ) z +
      (ν * (ν + 1) - μ ^ 2 / (1 - z ^ 2)) * ferrersP ν μ z = 0 := sorry

/-- **1.3** `𝑸^μ_ν` solves 14.21.1 on `U`. -/
theorem olverLegendreQ_legendreEquation (ν μ : ℂ) {z : ℂ} (hz : z - 1 ∈ slitPlane) :
    (1 - z ^ 2) * deriv^[2] (olverLegendreQ ν μ) z - 2 * z * deriv (olverLegendreQ ν μ) z +
      (ν * (ν + 1) - μ ^ 2 / (1 - z ^ 2)) * olverLegendreQ ν μ z = 0 := sorry

/-- **1.3** Abel's identity: `(1 − z²) 𝒲{f, g}` is constant for solutions of 14.21.1 on a
connected open set avoiding `±1`. -/
theorem wronskian_mul_one_sub_sq_eq_const (ν μ : ℂ) {V : Set ℂ} (hV : IsOpen V)
    (hVc : IsPreconnected V) (h₁ : (1 : ℂ) ∉ V) (h₂ : (-1 : ℂ) ∉ V) {f g : ℂ → ℂ}
    (hf : DifferentiableOn ℂ f V) (hg : DifferentiableOn ℂ g V)
    (hfe : ∀ z ∈ V, (1 - z ^ 2) * deriv^[2] f z - 2 * z * deriv f z +
      (ν * (ν + 1) - μ ^ 2 / (1 - z ^ 2)) * f z = 0)
    (hge : ∀ z ∈ V, (1 - z ^ 2) * deriv^[2] g z - 2 * z * deriv g z +
      (ν * (ν + 1) - μ ^ 2 / (1 - z ^ 2)) * g z = 0) :
    ∃ C, ∀ z ∈ V, (1 - z ^ 2) * (f z * deriv g z - deriv f z * g z) = C := sorry

/-- **1.4** DLMF 14.9.3 with `Γ(ν + m + 1)/Γ(ν − m + 1)` written as `(ν − m + 1)_{2m}`, for
every `ν`: `(ν − m + 1)_{2m} 𝖯^{−m}_ν = (−1)^m 𝖯^m_ν` on `D`. -/
theorem ferrersP_neg_nat_order (ν : ℂ) (m : ℕ) {z : ℂ} (hz₁ : 1 - z ∈ slitPlane)
    (hz₂ : 1 + z ∈ slitPlane) :
    poch(ν - m + 1, 2 * m) * ferrersP ν (-m) z = (-1) ^ m * ferrersP ν m z := sorry

/-! ### Layer 2: recurrence relations and derivatives -/

/-- **2.1** DLMF 14.10.3 on `D`, for all `ν, μ`. -/
theorem ferrersP_recurrence_14_10_3 (ν μ : ℂ) {z : ℂ} (hz₁ : 1 - z ∈ slitPlane)
    (hz₂ : 1 + z ∈ slitPlane) :
    (ν - μ + 2) * ferrersP (ν + 2) μ z - (2 * ν + 3) * z * ferrersP (ν + 1) μ z +
      (ν + μ + 1) * ferrersP ν μ z = 0 := sorry

/-- **2.2** DLMF 14.10.4 on `D`. -/
theorem hasDerivAt_ferrersP (ν μ : ℂ) {z : ℂ} (hz₁ : 1 - z ∈ slitPlane)
    (hz₂ : 1 + z ∈ slitPlane) :
    HasDerivAt (ferrersP ν μ)
      (((μ - ν - 1) * ferrersP (ν + 1) μ z + (ν + 1) * z * ferrersP ν μ z) / (1 - z ^ 2)) z :=
  sorry

/-! ### Layer 3: values at `x = 0`, alternative representations -/

/-- **3.1** DLMF 14.5.1, for all `ν, μ`. -/
theorem ferrersP_zero (ν μ : ℂ) :
    ferrersP ν μ 0 = 2 ^ μ * (Real.sqrt π : ℂ) * (Gamma (ν / 2 - μ / 2 + 1))⁻¹ *
      (Gamma (1 / 2 - ν / 2 - μ / 2))⁻¹ := sorry

/-- **3.2** DLMF 14.3.11 on `D`, for all `ν, μ`. -/
theorem ferrersP_eq_ferrersW (ν μ : ℂ) {z : ℂ} (hz₁ : 1 - z ∈ slitPlane)
    (hz₂ : 1 + z ∈ slitPlane) :
    ferrersP ν μ z = cos ((ν + μ) * π / 2) * ferrersW₁ ν μ z +
      sin ((ν + μ) * π / 2) * ferrersW₂ ν μ z := sorry

/-- **3.2** DLMF 14.3.2 on `D`, for `μ ∉ ℤ` and `ν + μ ∉ {−1, −2, …}`. -/
theorem ferrersQ_eq_div_sin {ν μ : ℂ} (hμ : ∀ n : ℤ, μ ≠ n) (hνμ : ∀ n : ℕ, ν + μ ≠ -(n + 1))
    {z : ℂ} (hz₁ : 1 - z ∈ slitPlane) (hz₂ : 1 + z ∈ slitPlane) :
    ferrersQ ν μ z = π / (2 * sin (μ * π)) * (cos (μ * π) * ferrersP ν μ z -
      Gamma (ν + μ + 1) * (Gamma (ν - μ + 1))⁻¹ * ferrersP ν (-μ) z) := sorry

/-- **3.3** DLMF 15.9.17 for `|ph z| < π`, `|ph(1 − z)| < π`. -/
theorem regularizedGaussHypergeometric_eq_associatedLegendreP (a c : ℂ) {z : ℂ}
    (hz : z ∈ slitPlane) (hz₁ : 1 - z ∈ slitPlane) :
    𝐅 a (a + 1 / 2) c z = 2 ^ (c - 1) * z ^ ((1 - c) / 2) * (1 - z) ^ (-a + (c - 1) / 2) *
      associatedLegendreP (2 * a - c) (1 - c) (1 / (1 - z) ^ (1 / 2 : ℂ)) := sorry

/-! ### Layer 4: special values, integer order and degree, singularities -/

/-- **4.1** DLMF 14.5.21, with `K(k)` Tau Ceti's `legendreK` (modulus `k`). -/
theorem ferrersP_neg_half_cos {θ : ℝ} (hθ₀ : 0 < θ) (hθ : θ < π) :
    ferrersP (-1 / 2) 0 (Real.cos θ) =
      (2 / π * TauCeti.Real.legendreK (Real.sin (θ / 2)) : ℝ) := sorry

/-- **4.3** DLMF 14.7.1: `𝖯_n = Pₙ` on `D`. -/
theorem ferrersP_nat_eq_shiftedLegendre (n : ℕ) {z : ℂ} (hz₁ : 1 - z ∈ slitPlane)
    (hz₂ : 1 + z ∈ slitPlane) : ferrersP n 0 z = legP n z := sorry

/-- **4.3** DLMF 14.7.2–14.7.3 on `(−1, 1)`. -/
theorem ferrersQ_nat (n : ℕ) {x : ℝ} (hx₀ : -1 < x) (hx₁ : x < 1) :
    ferrersQ n 0 x = 1 / 2 * legP n x * Real.log ((1 + x) / (1 - x)) -
      ∑ s ∈ Finset.range n, ((n + s)! : ℂ) * (digamma (n + 1) - digamma (s + 1)) /
        (2 ^ s * (n - s)! * (s ! : ℂ) ^ 2) * ((x : ℂ) - 1) ^ s := sorry

/-- **4.3** DLMF 14.7.19 for `−1 < x < 1`, `|h| < 1`. -/
theorem hasSum_ferrersP_nat_mul_pow {x : ℝ} (hx₀ : -1 < x) (hx₁ : x < 1) {h : ℂ}
    (hh : ‖h‖ < 1) :
    HasSum (fun n : ℕ => ferrersP n 0 x * h ^ n) ((1 - 2 * x * h + h ^ 2) ^ (-1 / 2 : ℂ)) :=
  sorry

/-- **4.4** DLMF 14.8.1: `𝖯^μ_ν(x) ∼ Γ(1 − μ)⁻¹ (2/(1 − x))^{μ/2}` as `x → 1−`, for
`μ ∉ {1, 2, 3, …}`. -/
theorem ferrersP_isEquivalent_one (ν : ℂ) {μ : ℂ} (hμ : ∀ n : ℕ, μ ≠ n + 1) :
    (fun x : ℝ => ferrersP ν μ x) ~[𝓝[<] 1]
      fun x : ℝ => (Gamma (1 - μ))⁻¹ * ((2 / (1 - x) : ℝ) : ℂ) ^ (μ / 2) := sorry

/-! ### Layer 5: Wronskians, connection formulas and values on the cut -/

/-- **5.1** DLMF 14.2.4 on `D`, for `ν + μ ∉ {−1, −2, …}`. -/
theorem wronskian_ferrersP_ferrersQ {ν μ : ℂ} (hνμ : ∀ n : ℕ, ν + μ ≠ -(n + 1)) {z : ℂ}
    (hz₁ : 1 - z ∈ slitPlane) (hz₂ : 1 + z ∈ slitPlane) :
    (1 - z ^ 2) * (ferrersP ν μ z * deriv (ferrersQ ν μ) z -
      deriv (ferrersP ν μ) z * ferrersQ ν μ z) =
      Gamma (ν + μ + 1) * (Gamma (ν - μ + 1))⁻¹ := sorry

/-- **5.2** DLMF 14.9.2 on `D`, for `ν − μ ∉ {−1, −2, …}` (so that `𝖰^{−μ}_ν` is defined). -/
theorem ferrersQ_connection_14_9_2 {ν μ : ℂ} (hνμ : ∀ n : ℕ, ν - μ ≠ -(n + 1)) {z : ℂ}
    (hz₁ : 1 - z ∈ slitPlane) (hz₂ : 1 + z ∈ slitPlane) :
    2 * sin (μ * π) / π * (Gamma (ν - μ + 1))⁻¹ * ferrersQ ν (-μ) z =
      (Gamma (ν + μ + 1))⁻¹ * ferrersP ν μ z -
        cos (μ * π) * (Gamma (ν - μ + 1))⁻¹ * ferrersP ν (-μ) z := sorry

/-- **5.2** Whipple's formula DLMF 14.9.16 for `x > 1`. -/
theorem olverLegendreQ_whipple (ν μ : ℂ) {x : ℝ} (hx : 1 < x) :
    olverLegendreQ ν μ x = (Real.sqrt (π / 2) * (x ^ 2 - 1) ^ (-(1 / 4 : ℝ)) : ℝ) *
      associatedLegendreP (-μ - 1 / 2) (-ν - 1 / 2) (x * (x ^ 2 - 1) ^ (-(1 / 2 : ℝ)) : ℝ) :=
  sorry

/-- **5.3** DLMF 14.23.1: `P^μ_ν(x ± i0) = e^{∓μπi/2} 𝖯^μ_ν(x)` for `−1 < x < 1`. -/
theorem tendsto_associatedLegendreP_cut (ν μ : ℂ) {x : ℝ} (hx₀ : -1 < x) (hx₁ : x < 1) :
    Tendsto (fun ε : ℝ => associatedLegendreP ν μ (x + ε * I)) (𝓝[>] 0)
        (𝓝 (exp (-(μ * π * I / 2)) * ferrersP ν μ x)) ∧
      Tendsto (fun ε : ℝ => associatedLegendreP ν μ (x - ε * I)) (𝓝[>] 0)
        (𝓝 (exp (μ * π * I / 2) * ferrersP ν μ x)) := sorry

/-- **5.3** DLMF 14.23.2 for `−1 < x < 1` and `ν + μ ∉ {−1, −2, …}`. -/
theorem tendsto_olverLegendreQ_cut {ν μ : ℂ} (hνμ : ∀ n : ℕ, ν + μ ≠ -(n + 1)) {x : ℝ}
    (hx₀ : -1 < x) (hx₁ : x < 1) :
    Tendsto (fun ε : ℝ => olverLegendreQ ν μ (x + ε * I)) (𝓝[>] 0)
        (𝓝 (exp (μ * π * I / 2) * (Gamma (ν + μ + 1))⁻¹ *
          (ferrersQ ν μ x - π / 2 * I * ferrersP ν μ x))) ∧
      Tendsto (fun ε : ℝ => olverLegendreQ ν μ (x - ε * I)) (𝓝[>] 0)
        (𝓝 (exp (-(μ * π * I / 2)) * (Gamma (ν + μ + 1))⁻¹ *
          (ferrersQ ν μ x + π / 2 * I * ferrersP ν μ x))) := sorry

/-! ### Layer 6: continued fractions -/

/-- **6.2** DLMF 14.14.1 as corrected, with `x_k`, `y_k` of 14.14.2: for `x > 1` and real `ν, μ`
with `x_{k+1}`, `y_k` never both zero and `P^{1−μ}_ν(x) ≠ 0`. -/
theorem associatedLegendreP_continuedFraction {ν μ x : ℝ} (hx : 1 < x)
    (hxy : ∀ k : ℕ, (ν - μ - k) * (ν + μ + k + 1) ≠ 0 ∨ μ + k ≠ 0)
    (hP : associatedLegendreP ν (1 - μ) x ≠ 0) :
    Tendsto (fun N => contFracFrom
        (fun k => ((1 / 4 * (ν - μ - k + 1) * (ν + μ + k) * (x ^ 2 - 1) : ℝ) : ℂ))
        (fun k => (((μ + k) * x : ℝ) : ℂ)) N 0) atTop
      (𝓝 ((1 / 2 * Real.sqrt (x ^ 2 - 1) * (ν + μ) * (ν - μ + 1) : ℝ) *
        associatedLegendreP ν (-μ) x / associatedLegendreP ν (1 - μ) x)) := sorry

/-! ### Layer 7: integral representations and integrals -/

/-- **7.1** Mehler–Dirichlet, DLMF 14.12.1, for `0 < θ < π` and `Re μ < ½`. -/
theorem ferrersP_cos_eq_integral (ν : ℂ) {μ : ℂ} (hμ : μ.re < 1 / 2) {θ : ℝ} (hθ₀ : 0 < θ)
    (hθ : θ < π) :
    ferrersP ν μ (Real.cos θ) = (Real.sqrt 2 : ℂ) * ((Real.sin θ : ℝ) : ℂ) ^ μ *
      ((Real.sqrt π : ℂ))⁻¹ * (Gamma (1 / 2 - μ))⁻¹ *
        ∫ t in (0 : ℝ)..θ, cos ((ν + 1 / 2) * t) /
          ((Real.cos t - Real.cos θ : ℝ) : ℂ) ^ (μ + 1 / 2) := sorry

/-- **7.2** Neumann's integral, DLMF 14.12.13, on `U`. -/
theorem olverLegendreQ_nat_eq_integral (n : ℕ) {z : ℂ} (hz : z - 1 ∈ slitPlane) :
    olverLegendreQ n 0 z = 1 / (2 * n !) * ∫ t in (-1 : ℝ)..1, legP n t / (z - t) := sorry

/-- **7.3** Barnes' integral, DLMF 14.17.5, for `Re σ > −1`, `Re μ > −1`. -/
theorem integral_cpow_mul_ferrersP (ν : ℂ) {μ σ : ℂ} (hσ : -1 < σ.re) (hμ : -1 < μ.re) :
    ∫ x in (0 : ℝ)..1, (x : ℂ) ^ σ * ((1 - x ^ 2 : ℝ) : ℂ) ^ (μ / 2) * ferrersP ν (-μ) x =
      Gamma (σ / 2 + 1 / 2) * Gamma (σ / 2 + 1) * (2 ^ (μ + 1))⁻¹ *
        (Gamma (σ / 2 - ν / 2 + μ / 2 + 1))⁻¹ * (Gamma (σ / 2 + ν / 2 + μ / 2 + 3 / 2))⁻¹ :=
  sorry

/-- **7.3** Orthogonality, DLMF 14.17.6, for `m ≤ n`. -/
theorem integral_ferrersP_mul_ferrersP (l m n : ℕ) (hmn : m ≤ n) :
    ∫ x in (-1 : ℝ)..1, ferrersP l m x * ferrersP n m x =
      if l = n then ((n + m)! : ℂ) / ((n - m)! * (n + 1 / 2)) else 0 := sorry

/-- **7.4** DLMF 14.17.17 for `l, m, n ≥ 1` with `|m − n| < l < m + n`. -/
theorem integral_ferrersQ_mul_ferrersP_mul {l m n : ℕ} (hl : 1 ≤ l) (hm : 1 ≤ m) (hn : 1 ≤ n)
    (h₁ : |(m : ℤ) - n| < l) (h₂ : l < m + n) :
    ∫ θ in (0 : ℝ)..π, ferrersQ l 0 (Real.cos θ) * ferrersP m 0 (Real.cos θ) *
      ferrersP n 0 (Real.cos θ) * Real.sin θ = 0 := sorry

/-! ### Layer 8: trigonometric expansions and sums -/

/-- **8.1** DLMF 14.13.1 for `0 < θ < π`, `ν + μ ∉ {−1, −2, …}` and `Re μ < ½`, as the limit of
the partial sums (absolutely convergent when `Re μ < 0`). -/
theorem ferrersP_cos_eq_fourier {ν μ : ℂ} (hνμ : ∀ n : ℕ, ν + μ ≠ -(n + 1)) (hμ : μ.re < 1 / 2)
    {θ : ℝ} (hθ₀ : 0 < θ) (hθ : θ < π) :
    Tendsto (fun N => ∑ k ∈ Finset.range N, Gamma (ν + μ + k + 1) * (Gamma (ν + k + 3 / 2))⁻¹ *
        (poch(μ + 1 / 2, k) / k !) * sin ((ν + μ + 2 * k + 1) * θ)) atTop
      (𝓝 (ferrersP ν μ (Real.cos θ) * (Real.sqrt π : ℂ) /
        (2 ^ (μ + 1) * ((Real.sin θ : ℝ) : ℂ) ^ μ))) := sorry

/-- **8.2** The addition theorem DLMF 14.18.2, for `0 < θ₁, θ₂ < π`, `θ₁ + θ₂ < π`. -/
theorem ferrersP_addition (n : ℕ) {θ₁ θ₂ phi : ℝ} (h₁ : 0 < θ₁) (h₂ : 0 < θ₂) (h : θ₁ + θ₂ < π) :
    ferrersP n 0 (Real.cos θ₁ * Real.cos θ₂ + Real.sin θ₁ * Real.sin θ₂ * Real.cos phi) =
      ∑ m ∈ Finset.Icc (-(n : ℤ)) n, (-1 : ℂ) ^ m * ferrersP n (-m) (Real.cos θ₁) *
        ferrersP n m (Real.cos θ₂) * Real.cos (m * phi) := sorry

/-- **8.3** Dougall's expansion DLMF 14.18.9 for `−1 < x < 1`, `μ ≥ 0`, `ν ∉ ℤ`. -/
theorem hasSum_ferrersP_dougall {ν : ℂ} (hν : ∀ n : ℤ, ν ≠ n) {μ : ℝ} (hμ : 0 ≤ μ) {x : ℝ}
    (hx₀ : -1 < x) (hx₁ : x < 1) :
    HasSum (fun n : ℕ => (-1) ^ n * (2 * n + 1) / ((ν - n) * (ν + n + 1)) * ferrersP n (-μ) x)
      (π / sin (ν * π) * ferrersP ν (-μ) x) := sorry

/-- **8.3** Heine's formula DLMF 14.28.2, for `z₂` inside the ellipse with foci `±1` through
`z₁`. -/
theorem hasSum_heine {z₁ z₂ : ℂ} (hz₁ : z₁ - 1 ∈ slitPlane)
    (h : ‖z₂ - 1‖ + ‖z₂ + 1‖ < ‖z₁ - 1‖ + ‖z₁ + 1‖) :
    HasSum (fun n : ℕ => (2 * n + 1) * associatedLegendreQ n 0 z₁ * legP n z₂) (1 / (z₁ - z₂)) :=
  sorry

/-! ### Layer 9: zeros -/

/-- **9.2** For real `ν ≥ −½` and `μ ≤ 0`, `𝖯^μ_ν` has `N₀ = max(⌈ν − |μ|⌉, 0)` zeros in
`(−1, 1)`. -/
theorem ferrersP_zero_count {ν μ : ℝ} (hν : -1 / 2 ≤ ν) (hμ : μ ≤ 0) :
    {x : ℝ | x ∈ Ioo (-1) 1 ∧ ferrersP ν μ x = 0}.Finite ∧
      {x : ℝ | x ∈ Ioo (-1) 1 ∧ ferrersP ν μ x = 0}.ncard = (⌈ν + μ⌉).toNat := sorry

/-! ### Layer 10: toroidal and conical functions, generalizations -/

/-- **10.1** DLMF 14.19.6 for `Re μ > −½`, `ξ > 0` and real `φ`. -/
theorem hasSum_olverLegendreQ_toroidal {μ : ℂ} (hμ : -1 / 2 < μ.re) {ξ : ℝ} (hξ : 0 < ξ)
    (phi : ℝ) :
    HasSum (fun n : ℕ => (if n = 0 then 1 else 2) * Gamma (μ + n + 1 / 2) *
        (Gamma (μ + 1 / 2))⁻¹ * olverLegendreQ (n - 1 / 2) μ (Real.cosh ξ) * Real.cos (n * phi))
      ((Real.sqrt (π / 2) : ℂ) * ((Real.sinh ξ : ℝ) : ℂ) ^ μ /
        ((Real.cosh ξ - Real.cos phi : ℝ) : ℂ) ^ (μ + 1 / 2)) := sorry

/-- **10.2** DLMF 14.20.3, wherever `𝖰^{∓μ}_{−½+iτ}` is defined. -/
theorem conicalQHat_eq {μ τ : ℝ} (hμτ : τ ≠ 0 ∨ Real.cos (μ * π) ≠ 0) {x : ℝ} (hx₀ : -1 < x)
    (hx₁ : x < 1) :
    Real.conicalQHat (-μ) τ x =
      π * Real.exp (-(τ * π)) * Real.sin (μ * π) * Real.sinh (τ * π) /
          (2 * (Real.cosh (τ * π) ^ 2 - Real.sin (μ * π) ^ 2)) *
          (ferrersP (-1 / 2 + τ * I) (-μ) x).re +
        π * (Real.exp (-(τ * π)) * Real.cos (μ * π) ^ 2 + Real.sinh (τ * π)) /
          (2 * (Real.cosh (τ * π) ^ 2 - Real.sin (μ * π) ^ 2)) *
          (ferrersP (-1 / 2 + τ * I) (-μ) (-x : ℝ)).re := sorry

/-- **10.2** DLMF 14.23.7 as corrected:
`𝖰̂^{−μ}_{−½+iτ}(x) = ½ e^{3μπi/2} Q^{−μ}_{−½+iτ}(x − i0) + ½ e^{μπi/2} Q^{−μ}_{−½−iτ}(x + i0)`. -/
theorem conicalQHat_eq_cut {μ τ : ℝ} (hμτ : τ ≠ 0 ∨ Real.cos (μ * π) ≠ 0) {x : ℝ}
    (hx₀ : -1 < x) (hx₁ : x < 1) :
    Tendsto (fun ε : ℝ =>
        1 / 2 * exp (3 * μ * π * I / 2) * associatedLegendreQ (-1 / 2 + τ * I) (-μ) (x - ε * I) +
          1 / 2 * exp (μ * π * I / 2) * associatedLegendreQ (-1 / 2 - τ * I) (-μ) (x + ε * I))
      (𝓝[>] 0) (𝓝 (Real.conicalQHat (-μ) τ x)) := sorry

/-- **10.3** A solution of the generalized associated Legendre equation DLMF 14.29.1 on `D`. -/
theorem generalizedLegendre_solution (ν μ₁ μ₂ : ℂ) {z : ℂ} (hz₁ : 1 - z ∈ slitPlane)
    (hz₂ : 1 + z ∈ slitPlane) :
    let w : ℂ → ℂ := fun z => (1 - z) ^ (-μ₁ / 2) * (1 + z) ^ (-μ₂ / 2) *
      𝐅 (ν + 1 - (μ₁ + μ₂) / 2) (-ν - (μ₁ + μ₂) / 2) (1 - μ₁) ((1 - z) / 2)
    (1 - z ^ 2) * deriv^[2] w z - 2 * z * deriv w z +
      (ν * (ν + 1) - μ₁ ^ 2 / (2 * (1 - z)) - μ₂ ^ 2 / (2 * (1 + z))) * w z = 0 := sorry

/-! ### Layer 11: spherical harmonics -/

/-- **11.2** Orthonormality, DLMF 14.30.8, for `|m₁| ≤ l₁`, `|m₂| ≤ l₂`. -/
theorem integral_sphericalHarmonic_mul {l₁ l₂ : ℕ} {m₁ m₂ : ℤ} (h₁ : m₁.natAbs ≤ l₁)
    (h₂ : m₂.natAbs ≤ l₂) :
    ∫ phi in (0 : ℝ)..2 * π, ∫ θ in (0 : ℝ)..π,
        conj (sphericalHarmonic l₁ m₁ θ phi) * sphericalHarmonic l₂ m₂ θ phi * Real.sin θ =
      if l₁ = l₂ ∧ m₁ = m₂ then 1 else 0 := sorry

/-- **11.2** The addition theorem DLMF 14.30.9, for `0 < θ₁, θ₂ < π`. -/
theorem ferrersP_eq_sum_sphericalHarmonic (l : ℕ) {θ₁ θ₂ : ℝ} (phi₁ phi₂ : ℝ) (h₁ : 0 < θ₁)
    (h₁' : θ₁ < π) (h₂ : 0 < θ₂) (h₂' : θ₂ < π) :
    legP l (Real.cos θ₁ * Real.cos θ₂ + Real.sin θ₁ * Real.sin θ₂ * Real.cos (phi₁ - phi₂)) =
      4 * π / (2 * l + 1) * ∑ m ∈ Finset.Icc (-(l : ℤ)) l,
        conj (sphericalHarmonic l m θ₁ phi₁) * sphericalHarmonic l m θ₂ phi₂ := sorry

/-- The measure `sin θ dθ dφ` on `(0, π) × (0, 2π)`. -/
def sphereMeasure : Measure (ℝ × ℝ) :=
  (volume.restrict (Ioo 0 π ×ˢ Ioo 0 (2 * π))).withDensity
    fun p => ENNReal.ofReal (Real.sin p.1)

/-- **11.3** Completeness: the `Y_{l,m}`, `|m| ≤ l`, form a Hilbert basis of
`L²((0, π) × (0, 2π), sin θ dθ dφ)`; the index `(l, j)` with `j < 2l + 1` is `m = j − l`. -/
theorem sphericalHarmonic_hilbertBasis :
    ∃ b : HilbertBasis (Σ l : ℕ, Fin (2 * l + 1)) ℂ (Lp ℂ 2 sphereMeasure),
      ∀ i, (b i : ℝ × ℝ → ℂ) =ᵐ[sphereMeasure]
        fun p => sphericalHarmonic i.1 ((i.2 : ℤ) - i.1) p.1 p.2 := sorry

end TauCetiRoadmap.SpecialFunctionsLegendre

end
