module

public import Mathlib
public import TauCeti.Analysis.SpecialFunctions.Erf
public import TauCeti.Analysis.SpecialFunctions.IncompleteGamma
public import TauCeti.Analysis.SpecialFunctions.RegularizedHypergeometric

/-!
# Confluent hypergeometric functions: target signatures

This file states the headline theorems of the roadmap against the pinned Mathlib and Tau Ceti,
one or more per layer. The definitive document is `README.md`, which states every target; this
file states a selection of them, and discharging it finishes neither a layer nor the roadmap.

Some headlines cannot be stated at the pins, because their carriers belong to roadmaps that are
not yet in Tau Ceti: the complex incomplete Gamma, `E_p` and `erfc` relations of 5.2 and 10.1 need
the functions of SpecialFunctionsEiLiErfIncompleteGamma, and 13.18.17 needs the Laguerre
polynomials of LaguerreJacobi. Their real forms are stated through
Tau Ceti's `TauCeti.Real.erfc` and `TauCeti.lowerIncompleteGamma`. The Airy, Bessel and parabolic
cylinder relations are stated with roadmap-local copies of the pinned `Ai` of SpecialFunctionsAiry,
`I_ν` and `K_ν` of SpecialFunctionsBessel and `U(a, z)` of SpecialFunctionsParabolicCylinder.
QuantumFoundations §9.4 owns Tricomi's `U` but gives it no Lean name; `kummerU_eq_integral` states
the agreement of `kummerU` with it through 13.4.4, its defining formula, and the results of §9.4
(13.2.9–13.2.11, 13.2.34, 13.3.7 and `U ∼ z^{−a}` of 13.2.6) are inputs, not restated here.
Likewise AutomorphicSpectralTheory §§0.26–0.28 own the Whittaker functions on the positive axis
without Lean names; `whittakerW_eq_integral` states the agreement through 13.16.5, the formula by
which §0.26 defines `W`.

The definitions below are roadmap-local copies of the definitions `README.md` pins. In Tau Ceti
they live in `Complex`, beside Mathlib's `Complex.regularizedHGFun`; here they live in this file's
`Complex` subnamespace. They are stated with their intended bodies so that the conventions are
checked by the compiler: Mathlib's regularized Kummer function `Complex.regularizedHGFun {a} {b}`
(written `𝐌(a, b)` here), reciprocal Gamma factors, `deriv` in `b` at integer `b`, the
logarithmic coordinate `w` with `z = e^w`, principal complex powers, and the sector filters.
Theorems are stated with `sorry`.

The general tools (Watson's lemma, the rotation of the path and the Mellin tools) belong to the
AsymptoticExpansions roadmap and are not restated here. Expansions are written out as one
`IsBigO` statement per truncation order, which is AsymptoticExpansions'
`Asymptotics.HasAsymptoticExpansion` unfolded, so that this file needs no import from that
roadmap.
-/

@[expose] public section

noncomputable section

namespace TauCetiRoadmap.SpecialFunctionsConfluent

open Complex Filter Topology Asymptotics Set MeasureTheory
open scoped Real Nat

/-- Olver's regularized Kummer function `𝐌(a, b, z) = M(a, b, z) / Γ(b)`. -/
local notation "𝐌(" a ", " b ")" =>
  Complex.regularizedHGFun ({a} : Multiset ℂ) ({b} : Multiset ℂ)

/-- Mathlib's regularized `₀F₁`: `𝐅(b) x = ∑ₙ xⁿ / (n! Γ(b + n))`. -/
local notation "𝐅(" b ")" => Complex.regularizedHGFun (0 : Multiset ℂ) ({b} : Multiset ℂ)

/-- The logarithmic-coordinate filter "`z = e^w → ∞` in `|ph z| ≤ θ`". -/
local notation "logSectorAtTop " θ =>
  Filter.comap Complex.re atTop ⊓ 𝓟 (Set.ofPred fun w : ℂ => |Complex.im w| ≤ θ)

/-- The Pochhammer symbol `(a)ₙ`. -/
local notation "poch(" a ", " n ")" => Polynomial.eval a (ascPochhammer ℂ n)

/-! ### Definitions -/

namespace Complex

/-- The bracket `F(a, b, w) = 𝐌(a, b, e^w)/Γ(a − b + 1) − e^{(1−b)w} 𝐌(a − b + 1, 2 − b, e^w)/Γ(a)`
of DLMF 13.2.42 in logarithmic coordinates (auxiliary). It is entire in `(a, b, w)` and vanishes
at integer `b`. -/
def kummerUBracket (a b w : ℂ) : ℂ :=
  𝐌(a, b) (cexp w) * (Gamma (a - b + 1))⁻¹ -
    cexp ((1 - b) * w) * 𝐌(a - b + 1, 2 - b) (cexp w) * (Gamma a)⁻¹

open scoped Classical in
/-- Kummer's function `U(a, b, e^w)` on the logarithmic plane: DLMF 13.2.42,
`U = (π / sin πb) F`, off the integers, and its limit `(−1)ⁿ ∂_b F` at `b = n ∈ ℤ`, with `(−1)ⁿ`
written `cos(πb)`. -/
def kummerULog (a b w : ℂ) : ℂ :=
  if ∃ n : ℤ, (n : ℂ) = b then
    Complex.cos (π * b) * deriv (fun β => kummerUBracket a β w) b
  else (π : ℂ) / Complex.sin (π * b) * kummerUBracket a b w

/-- The principal branch `U(a, b, z)`, holomorphic on the slit plane. -/
def kummerU (a b z : ℂ) : ℂ := kummerULog a b (Complex.log z)

/-- The regularized Whittaker function `𝐌_{κ,μ}(z) = M_{κ,μ}(z) / Γ(1 + 2μ)`
(DLMF 13.14.2 divided by `Γ(1 + 2μ)`), entire in `κ` and `μ`. -/
def regularizedWhittakerM (κ μ z : ℂ) : ℂ :=
  cexp (-z / 2) * z ^ (1 / 2 + μ) * 𝐌(1 / 2 + μ - κ, 1 + 2 * μ) z

/-- Whittaker's function `M_{κ,μ}(z)` (DLMF 13.14.2); a junk value where `2μ ∈ {−1, −2, …}`. -/
def whittakerM (κ μ z : ℂ) : ℂ := Gamma (1 + 2 * μ) * regularizedWhittakerM κ μ z

/-- Whittaker's function `W_{κ,μ}(z)` (DLMF 13.14.3). -/
def whittakerW (κ μ z : ℂ) : ℂ :=
  cexp (-z / 2) * z ^ (1 / 2 + μ) * kummerU (1 / 2 + μ - κ) (1 + 2 * μ) z

/-- `𝐌_{κ,μ}(e^w)` on the logarithmic plane. -/
def regularizedWhittakerMLog (κ μ w : ℂ) : ℂ :=
  cexp (-cexp w / 2) * cexp ((1 / 2 + μ) * w) * 𝐌(1 / 2 + μ - κ, 1 + 2 * μ) (cexp w)

/-- `W_{κ,μ}(e^w)` on the logarithmic plane. -/
def whittakerWLog (κ μ w : ℂ) : ℂ :=
  cexp (-cexp w / 2) * cexp ((1 / 2 + μ) * w) * kummerULog (1 / 2 + μ - κ) (1 + 2 * μ) w

/-- The coefficients `A_n` of Buchholz's expansion (DLMF 13.11.4). -/
def buchholzCoeff (a b : ℂ) : ℕ → ℂ
  | 0 => 1
  | 1 => 0
  | 2 => b / 2
  | n + 3 => (((n : ℂ) + 1 + b) * buchholzCoeff a b (n + 1) + (2 * a - b) * buchholzCoeff a b n) /
      ((n : ℂ) + 3)

/-- A roadmap-local copy of SpecialFunctionsBessel's pinned `I_ν`. -/
def besselI (ν z : ℂ) : ℂ := (z / 2) ^ ν * 𝐅(ν + 1) ((z / 2) ^ 2)

open scoped Classical in
/-- A roadmap-local copy of SpecialFunctionsBessel's pinned `K_ν`. -/
def besselK (ν z : ℂ) : ℂ :=
  if ∃ n : ℤ, (n : ℂ) = ν then
    -Complex.cos (ν * π) / 2 *
      (deriv (fun μ => besselI μ z) ν + deriv (fun μ => besselI μ z) (-ν))
  else (π : ℂ) / 2 * (besselI (-ν) z - besselI ν z) / Complex.sin (ν * π)

/-- A roadmap-local copy of SpecialFunctionsAiry's pinned `Ai`. -/
def airyAi (z : ℂ) : ℂ :=
  (3 : ℂ) ^ (-(2 / 3 : ℂ)) * 𝐅(2 / 3) (z ^ 3 / 9) -
    (3 : ℂ) ^ (-(4 / 3 : ℂ)) * z * 𝐅(4 / 3) (z ^ 3 / 9)

/-- A roadmap-local copy of SpecialFunctionsParabolicCylinder's pinned `U(a, z)`. -/
def parabolicCylinderU (a z : ℂ) : ℂ :=
  Real.sqrt π * (2 : ℂ) ^ (-(a / 2 + 1 / 4)) * (Gamma (3 / 4 + a / 2))⁻¹ *
      (cexp (-z ^ 2 / 4) * (Gamma (1 / 2) * 𝐌(a / 2 + 1 / 4, 1 / 2) (z ^ 2 / 2))) -
    Real.sqrt π * (2 : ℂ) ^ (-(a / 2 - 1 / 4)) * (Gamma (1 / 4 + a / 2))⁻¹ *
      (z * cexp (-z ^ 2 / 4) * (Gamma (3 / 2) * 𝐌(a / 2 + 3 / 4, 3 / 2) (z ^ 2 / 2)))

end Complex

open Complex

/-! ### Layer 1: definitions, the equations and analytic continuation -/

/-- **1.1** `𝐌(a, b, z)` is holomorphic in `(a, b, z)` jointly. -/
theorem differentiable_regularizedHGFun_prod :
    Differentiable ℂ fun p : ℂ × ℂ × ℂ => 𝐌(p.1, p.2.1) p.2.2 := sorry

/-- **1.1** `𝐌` at a nonpositive integer denominator parameter (DLMF 13.2.5). -/
theorem regularizedHGFun_neg_nat (a : ℂ) (n : ℕ) (z : ℂ) :
    𝐌(a, -(n : ℂ)) z = poch(a, n + 1) * z ^ (n + 1) * 𝐌(a + n + 1, (n : ℂ) + 2) z := sorry

/-- **1.1** The bracket of DLMF 13.2.42 vanishes at integer `b`. -/
theorem kummerUBracket_intCast (a w : ℂ) (n : ℤ) : kummerUBracket a n w = 0 := sorry

/-- **1.1** `U(a, b, e^w)` is holomorphic in `(a, b, w)` jointly. -/
theorem differentiable_kummerULog :
    Differentiable ℂ fun p : ℂ × ℂ × ℂ => kummerULog p.1 p.2.1 p.2.2 := sorry

/-- **1.1** At integer `b` the derivative form is the limit of DLMF 13.2.42. -/
theorem tendsto_kummerULog_intCast (a w : ℂ) (n : ℤ) :
    Tendsto (fun b => (π : ℂ) / Complex.sin (π * b) * kummerUBracket a b w) (𝓝[≠] (n : ℂ))
      (𝓝 (kummerULog a n w)) := sorry

/-- **1.1** The principal branch of `U` is holomorphic on the slit plane. -/
theorem analyticOnNhd_kummerU (a b : ℂ) : AnalyticOnNhd ℂ (kummerU a b) slitPlane := sorry

/-- **1.1** Kummer's equation for `U` (DLMF 13.2.1). -/
theorem kummerU_kummer_equation (a b : ℂ) {z : ℂ} (hz : z ∈ slitPlane) :
    z * deriv (deriv (kummerU a b)) z + (b - z) * deriv (kummerU a b) z - a * kummerU a b z =
      0 := sorry

/-- **1.3** The polynomial case `U(−m, b, z)` (DLMF 13.2.7), for every `b`. -/
theorem kummerU_neg_nat (m : ℕ) (b : ℂ) {z : ℂ} (hz : z ≠ 0) :
    kummerU (-m) b z =
      (-1 : ℂ) ^ m * ∑ s ∈ Finset.range (m + 1),
        (m.choose s : ℂ) * poch(b + s, m - s) * (-z) ^ s := sorry

/-- **1.4** The analytic continuation (DLMF 13.2.12) for `b ∉ ℤ`. -/
theorem kummerULog_add_two_pi_mul_I (a : ℂ) {b : ℂ} (hb : ∀ n : ℤ, b ≠ n) (w : ℂ) (m : ℤ) :
    kummerULog a b (w + 2 * π * I * m) =
      2 * π * I * cexp (-(π * I * b * m)) * Complex.sin (π * b * m) /
          (Gamma (1 + a - b) * Complex.sin (π * b)) * 𝐌(a, b) (cexp w) +
        cexp (-(2 * π * I * b * m)) * kummerULog a b w := sorry

/-- **1.4** The analytic continuation (DLMF 13.2.12) at integer `b`. -/
theorem kummerULog_intCast_add_two_pi_mul_I (a : ℂ) (n : ℤ) (w : ℂ) (m : ℤ) :
    kummerULog a n (w + 2 * π * I * m) =
      2 * π * I * m * (-1 : ℂ) ^ n * (Gamma (1 + a - n))⁻¹ * 𝐌(a, (n : ℂ)) (cexp w) +
        kummerULog a n w := sorry

/-- **1.5** Whittaker's equation for `W_{κ,μ}` (DLMF 13.14.1). -/
theorem whittakerW_equation (κ μ : ℂ) {z : ℂ} (hz : z ∈ slitPlane) :
    deriv (deriv (whittakerW κ μ)) z +
        (-1 / 4 + κ / z + (1 / 4 - μ ^ 2) / z ^ 2) * whittakerW κ μ z = 0 := sorry

/-- **1.5** `𝐌_{κ,μ}(e^w)` is entire in `(κ, μ, w)` (DLMF §13.14(ii)). -/
theorem differentiable_regularizedWhittakerMLog :
    Differentiable ℂ fun p : ℂ × ℂ × ℂ => regularizedWhittakerMLog p.1 p.2.1 p.2.2 := sorry

/-! ### Layer 2: limiting forms at `0`, Wronskians and connection formulas -/

/-- **2.1** `U(a, b, z) → Γ(1 − b)/Γ(a − b + 1)` as `z → 0` for `Re b < 1` (DLMF 13.2.20–13.2.22;
at `b = 0` the limit is `1/Γ(a + 1)` by 13.2.21). -/
theorem tendsto_kummerU_nhdsWithin_zero (a : ℂ) {b : ℂ} (hb : b.re < 1) :
    Tendsto (kummerU a b) (𝓝[slitPlane] 0) (𝓝 (Gamma (1 - b) * (Gamma (a - b + 1))⁻¹)) :=
  sorry

/-- **2.3** Kummer's second transformation (DLMF 13.2.40). -/
theorem kummerU_eq_cpow_mul_kummerU (a b : ℂ) {z : ℂ} (hz : z ∈ slitPlane) :
    kummerU a b z = z ^ (1 - b) * kummerU (a - b + 1) (2 - b) z := sorry

/-- **2.3** The connection formula DLMF 13.2.41, upper sign, for every `z ≠ 0`; QuantumFoundations
§9.4 gives it for `−π < arg z < 0`. -/
theorem regularizedHGFun_eq_kummerU_add (a b : ℂ) {z : ℂ} (hz : z ≠ 0) :
    𝐌(a, b) z =
      cexp (-(a * π * I)) * (Gamma (b - a))⁻¹ * kummerU a b z +
        cexp ((b - a) * π * I) * (Gamma a)⁻¹ * cexp z *
          kummerULog (b - a) b (Complex.log z + π * I) := sorry

/-- **2.4** `W_{κ,μ} = W_{κ,−μ}` (DLMF 13.14.31). -/
theorem whittakerW_neg (κ μ : ℂ) {z : ℂ} (hz : z ∈ slitPlane) :
    whittakerW κ (-μ) z = whittakerW κ μ z := sorry

/-- **2.4** The connection formula DLMF 13.14.33, for `2μ ∉ ℤ`. -/
theorem whittakerW_eq_whittakerM_add (κ : ℂ) {μ : ℂ} (hμ : ∀ n : ℤ, 2 * μ ≠ n) {z : ℂ}
    (hz : z ∈ slitPlane) :
    whittakerW κ μ z =
      Gamma (-2 * μ) * (Gamma (1 / 2 - μ - κ))⁻¹ * whittakerM κ μ z +
        Gamma (2 * μ) * (Gamma (1 / 2 + μ - κ))⁻¹ * whittakerM κ (-μ) z := sorry

/-! ### Layer 3: recurrences and derivatives -/

/-- **3.1** `U′(a, b, z) = −a U(a + 1, b + 1, z)` (DLMF 13.3.22). -/
theorem hasDerivAt_kummerU (a b : ℂ) {z : ℂ} (hz : z ∈ slitPlane) :
    HasDerivAt (kummerU a b) (-a * kummerU (a + 1) (b + 1) z) z := sorry

/-! ### Layer 4: integral representations -/

/-- **4.1** Euler's integral (DLMF 13.4.1). -/
theorem regularizedHGFun_eq_integral {a b : ℂ} (ha : 0 < a.re) (hab : a.re < b.re) (z : ℂ) :
    𝐌(a, b) z =
      (Gamma a)⁻¹ * (Gamma (b - a))⁻¹ *
        ∫ t in (0 : ℝ)..1, cexp (z * t) * (t : ℂ) ^ (a - 1) * (1 - (t : ℂ)) ^ (b - a - 1) :=
  sorry

/-- **4.1** The Laplace integral of `U` (DLMF 13.4.4). It is the defining formula of the `U` of
QuantumFoundations §9.4, so this is the agreement of `kummerU` with that function. -/
theorem kummerU_eq_integral {a : ℂ} (ha : 0 < a.re) (b : ℂ) {z : ℂ} (hz : 0 < z.re) :
    kummerU a b z =
      (Gamma a)⁻¹ *
        ∫ t in Ioi (0 : ℝ), cexp (-(z * t)) * (t : ℂ) ^ (a - 1) * (1 + (t : ℂ)) ^ (b - a - 1) :=
  sorry

/-- **4.4** The Euler integral of `W_{κ,μ}` (DLMF 13.16.5). At `z = y > 0` it is, after
`t ↦ t − 1`, the formula by which AutomorphicSpectralTheory §0.26 defines `W_{κ,μ}(y)`, so this is
the agreement of `whittakerW` with that function. -/
theorem whittakerW_eq_integral (κ μ : ℂ) (h : 0 < (1 / 2 + μ - κ).re) {z : ℂ} (hz : 0 < z.re) :
    whittakerW κ μ z =
      cexp (-z / 2) * z ^ (1 / 2 + μ) * (Gamma (1 / 2 + μ - κ))⁻¹ *
        ∫ t in Ioi (0 : ℝ),
          cexp (-(z * t)) * (t : ℂ) ^ (μ - κ - 1 / 2) * (1 + (t : ℂ)) ^ (μ + κ - 1 / 2) := sorry

/-- **4.3** The Mellin–Barnes integral DLMF 13.4.16 on a separating vertical line
`Re t = c`, `−Re a < c < 0`, with `dt = i dy`. -/
theorem regularizedHGFun_neg_eq_barnes_integral {a : ℂ} (b : ℂ) {z : ℂ} (hz0 : z ≠ 0)
    (hz : |arg z| < π / 2) {c : ℝ} (hac : -a.re < c) (hc : c < 0) :
    𝐌(a, b) (-z) =
      (2 * π * Gamma a)⁻¹ *
        ∫ y : ℝ, Gamma (a + (c + y * I)) * Gamma (-(c + y * I)) *
          (Gamma (b + (c + y * I)))⁻¹ * z ^ (c + y * I) := sorry

/-! ### Layer 5: continued fractions and relations to other functions -/

/-- **5.1** The continued fraction DLMF 13.5.1 for `M(a, b, z)/M(a + 1, b + 1, z)`, with the
partial numerators `u_{k+1} z` of DLMF 13.5.2. -/
theorem tendsto_convs_regularizedHGFun_div {a b : ℂ} (hb : ∀ n : ℕ, b ≠ -n) {z : ℂ}
    (hz : 𝐌(a + 1, b + 1) z ≠ 0) :
    Tendsto (fun n => (⟨1, Stream'.Seq.ofStream fun k : ℕ =>
        ⟨(if k % 2 = 0 then (a - b - (k / 2 : ℕ)) else (a + ((k + 1) / 2 : ℕ))) /
          ((b + k) * (b + k + 1)) * z, 1⟩⟩ : GenContFract ℂ).convs n) atTop
      (𝓝 (𝐌(a, b) z / (b * 𝐌(a + 1, b + 1) z))) := sorry

/-- **5.2** The complementary error function (DLMF 13.6.8) at real argument. -/
theorem kummerU_half_half_sq {x : ℝ} (hx : 0 < x) :
    kummerU (1 / 2) (1 / 2) ((x : ℂ) ^ 2) =
      (Real.sqrt π : ℂ) * cexp ((x : ℂ) ^ 2) * (TauCeti.Real.erfc x : ℂ) := sorry

/-- **5.2** The upper incomplete Gamma function (DLMF 13.6.6, `U(a, a, z) = e^z Γ(1 − a, z)`) at
real argument, with `Γ(s, x) = Γ(s) − γ(s, x)` for `s > 0`. -/
theorem kummerU_one_sub_one_sub {s x : ℝ} (hs : 0 < s) (hx : 0 < x) :
    kummerU (1 - s) (1 - s) x =
      cexp x * ((Real.Gamma s - TauCeti.lowerIncompleteGamma s x : ℝ) : ℂ) := sorry

/-- **5.2** Airy's function (DLMF 13.6.11). -/
theorem kummerU_airyAi {z : ℂ} (hz : z ≠ 0) (harg : |arg z| < 2 * π / 3) :
    kummerU (5 / 6) (5 / 3) (4 / 3 * z ^ (3 / 2 : ℂ)) =
      (Real.sqrt π : ℂ) * (3 : ℂ) ^ (5 / 6 : ℂ) * cexp (2 / 3 * z ^ (3 / 2 : ℂ)) /
        ((2 : ℂ) ^ (2 / 3 : ℂ) * z) * airyAi z := sorry

/-- **5.2** Weber's parabolic cylinder function (DLMF 13.6.12). -/
theorem kummerU_parabolicCylinderU (a : ℂ) {z : ℂ} (hz : 0 < z.re) :
    kummerU (a / 2 + 1 / 4) (1 / 2) (z ^ 2 / 2) =
      (2 : ℂ) ^ (a / 2 + 1 / 4) * cexp (z ^ 2 / 4) * parabolicCylinderU a z := sorry

/-- **5.3** `W_{0,ν}(2z) = (2z/π)^{1/2} K_ν(z)` (DLMF 13.18.9). -/
theorem whittakerW_zero_eq_besselK (ν : ℂ) {z : ℂ} (hz : z ∈ slitPlane) :
    whittakerW 0 ν (2 * z) = (2 * z / π) ^ (1 / 2 : ℂ) * besselK ν z := sorry

/-! ### Layer 6: large argument and large parameters -/

/-- **6.1** The large-argument expansion of `U` (DLMF 13.7.3) in `|ph z| ≤ 3π/2 − δ`, in
logarithmic coordinates `z = e^w`, at truncation order `N`. -/
theorem isBigO_kummerULog_sub_sum (a b : ℂ) {δ : ℝ} (hδ : 0 < δ) (N : ℕ) :
    (fun w => kummerULog a b w -
        cexp (-(a * w)) * ∑ s ∈ Finset.range N,
          poch(a, s) * poch(a - b + 1, s) / (s ! : ℂ) * (-1 : ℂ) ^ s * cexp (-(s * w))) =O[
      logSectorAtTop (3 * π / 2 - δ)] fun w => cexp (-((a + N) * w)) := sorry

/-- **6.3** Large `b` (DLMF 13.8.1), away from the poles of `Γ(b)`. -/
theorem isBigO_regularizedHGFun_sub_sum_cobounded (a z : ℂ) {δ : ℝ} (hδ : 0 < δ) (n : ℕ) :
    (fun b => Gamma b * 𝐌(a, b) z -
        ∑ s ∈ Finset.range n, poch(a, s) / (poch(b, s) * (s ! : ℂ)) * z ^ s) =O[
      Bornology.cobounded ℂ ⊓ 𝓟 (Set.ofPred fun b : ℂ => ∀ k : ℕ, δ ≤ ‖b + k‖)]
      fun b => (b ^ n)⁻¹ := sorry

/-! ### Layer 7: zeros -/

/-- **7.1** The number of positive zeros of `M(a, b, ·)` for `a < 0`, `b > 0` (DLMF 13.9.1). -/
theorem ncard_pos_zeros_regularizedHGFun_of_neg {a b : ℝ} (ha : a < 0) (hb : 0 < b) :
    {x : ℝ | 0 < x ∧ 𝐌((a : ℂ), (b : ℂ)) (x : ℂ) = 0}.ncard = ⌈-a⌉₊ := sorry

/-- **7.1** `M(a, b, ·)` has no positive zeros for `a ≥ 0`, `b > 0` (DLMF 13.9.2). -/
theorem regularizedHGFun_ne_zero_of_nonneg {a b : ℝ} (ha : 0 ≤ a) (hb : 0 < b) {x : ℝ}
    (hx : 0 < x) : 𝐌((a : ℂ), (b : ℂ)) (x : ℂ) ≠ 0 := sorry

/-- **7.1** Corrected DLMF 13.9.3: for `a > 0` and `−1 < b < 0`, `M(a, b, ·)` has one positive
zero. DLMF prints `a ≥ 0`, but `M(0, b, x) = 1`. -/
theorem ncard_pos_zeros_regularizedHGFun_of_pos_of_neg {a b : ℝ} (ha : 0 < a) (hb : -1 < b)
    (hb0 : b < 0) : {x : ℝ | 0 < x ∧ 𝐌((a : ℂ), (b : ℂ)) (x : ℂ) = 0}.ncard = 1 := sorry

/-- **7.1** Corrected DLMF 13.9.4: for `a > 0` and non-integer `b < −1`, `M(a, b, ·)` has
`⌊−b/2⌋ − ⌊−(b + 1)/2⌋` positive zeros. DLMF prints `a ≥ 0`. -/
theorem ncard_pos_zeros_regularizedHGFun_of_pos_of_lt_neg_one {a b : ℝ} (ha : 0 < a)
    (hb : b < -1) (hbZ : ∀ n : ℤ, b ≠ n) :
    ({x : ℝ | 0 < x ∧ 𝐌((a : ℂ), (b : ℂ)) (x : ℂ) = 0}.ncard : ℤ) = ⌊-b / 2⌋ - ⌊-(b + 1) / 2⌋ :=
  sorry

/-- **7.1** Corrected DLMF 13.9.6, for `a ∉ {0, −1, −2, …}` and `b ∉ ℤ` with
`⌈−b⌉ > ⌈−a⌉ > 0`: with `d = ⌈−b⌉ − ⌈−a⌉ ≥ 1`, the count is `⌊(d + 1)/2⌋ − ⌊d/2⌋`. DLMF does not
exclude the negative integers `a`, where the formula fails. -/
theorem ncard_pos_zeros_regularizedHGFun_of_ceil_lt {a b : ℝ} (ha : ∀ n : ℕ, a ≠ -n)
    (hb : ∀ n : ℤ, b ≠ n) (h0 : 0 < ⌈-a⌉) (h : ⌈-a⌉ < ⌈-b⌉) :
    ({x : ℝ | 0 < x ∧ 𝐌((a : ℂ), (b : ℂ)) (x : ℂ) = 0}.ncard : ℤ) =
      (⌈-b⌉ - ⌈-a⌉ + 1) / 2 - (⌈-b⌉ - ⌈-a⌉) / 2 := sorry

/-- **7.2** Wimp's theorem: for real `a`, `b` with `2a − b > −1`, `U(a, b, z) ≠ 0` for
`|ph z| ≤ π/2`. -/
theorem kummerU_ne_zero {a b : ℝ} (hab : -1 < 2 * a - b) {z : ℂ} (hz : z ≠ 0)
    (harg : |arg z| ≤ π / 2) : kummerU a b z ≠ 0 := sorry

/-! ### Layer 8: integrals -/

/-- **8.1** The Mellin transform of `𝐌(a, b, −t)` (DLMF 13.10.10). -/
theorem integral_cpow_mul_regularizedHGFun_neg {a : ℂ} (b : ℂ) {s : ℂ} (hs : 0 < s.re)
    (hsa : s.re < a.re) :
    ∫ t in Ioi (0 : ℝ), (t : ℂ) ^ (s - 1) * 𝐌(a, b) (-(t : ℂ)) =
      Gamma s * Gamma (a - s) * (Gamma a)⁻¹ * (Gamma (b - s))⁻¹ := sorry

/-! ### Layer 9: series, products and addition theorems -/

/-- **9.1** Buchholz's expansion (DLMF 13.11.3) in its entire form, for all `a`, `b`, `z`. -/
theorem hasSum_regularizedHGFun_buchholz (a b z : ℂ) :
    HasSum (fun s : ℕ => cexp (z / 2) * buchholzCoeff a b s * (z / 2) ^ s *
        𝐅(b + s) (-(b - 2 * a) * z / 2))
      (𝐌(a, b) z) := sorry

/-- **9.2** The quadratic relation DLMF 13.12.1, for `b ∉ ℤ`. -/
theorem kummer_quadratic_relation (a : ℂ) {b : ℂ} (hb : ∀ n : ℤ, b ≠ n) (z : ℂ) :
    Gamma b * 𝐌(a, b) z * (Gamma (-b) * 𝐌(-a, -b) (-z)) +
        a * (a - b) * z ^ 2 / (b ^ 2 * (1 - b ^ 2)) *
          (Gamma (2 + b) * 𝐌(1 + a, 2 + b) z) * (Gamma (2 - b) * 𝐌(1 - a, 2 - b) (-z)) =
      1 := sorry

/-! ### Layer 10: relations owed to other roadmaps -/

/-- **10.2** `Ai` through `W_{0,1/3}` (DLMF 9.6.21), with `ζ = (2/3) z^{3/2}`. -/
theorem airyAi_eq_whittakerW {z : ℂ} (hz : z ≠ 0) (harg : |arg z| < 2 * π / 3) :
    airyAi z =
      1 / 2 * (Real.sqrt π : ℂ)⁻¹ * z ^ (-(1 / 4 : ℂ)) *
        whittakerW 0 (1 / 3) (2 * (2 / 3 * z ^ (3 / 2 : ℂ))) := sorry

/-- **10.2** `K_ν` through Kummer's `U` (DLMF 10.39.6). -/
theorem besselK_eq_kummerU (ν : ℂ) {z : ℂ} (hz : z ∈ slitPlane) :
    besselK ν z =
      (Real.sqrt π : ℂ) * (2 * z) ^ ν * cexp (-z) * kummerU (ν + 1 / 2) (2 * ν + 1) (2 * z) :=
  sorry

/-- **10.2** Weber's `U(a, z)` through `W_{−a/2,1/4}` (DLMF 12.7.14, last form). -/
theorem parabolicCylinderU_eq_whittakerW (a : ℂ) {z : ℂ} (hz : 0 < z.re) :
    parabolicCylinderU a z =
      (2 : ℂ) ^ (-(a / 2)) * z ^ (-(1 / 2 : ℂ)) * whittakerW (-(a / 2)) (1 / 4) (z ^ 2 / 2) :=
  sorry

/-! ### Names consumed from Mathlib and Tau Ceti -/

#check @_root_.Complex.Gamma_add_one
#check @_root_.Complex.Gamma_eq_integral
#check @_root_.Complex.Gamma_mul_Gamma_one_sub
#check @_root_.Complex.Gamma_neg_nat_eq_zero
#check @_root_.Complex.analyticOnNhd_regularizedHGFun_of_card_le
#check @_root_.Complex.betaIntegral
#check @_root_.Complex.besselJ
#check @_root_.Complex.besselJ_def
#check @_root_.Complex.differentiableOn_update_limUnder_of_bddAbove
#check @_root_.Complex.differentiable_one_div_Gamma
#check @_root_.Complex.digamma
#check @_root_.Complex.hasSum_regularizedHGFun
#check @_root_.Complex.integral_boundary_rect_eq_zero_of_differentiableOn
#check @_root_.Complex.radius_regularizedGaussHGFunSeries_eq_top_of_left
#check @_root_.Complex.radius_regularizedGaussHGFunSeries_ge_one
#check @_root_.Complex.radius_regularizedHGFunSeries_eq_top
#check @_root_.Complex.regularizedGaussHGFun
#check @_root_.Complex.regularizedHGFun
#check @_root_.Complex.regularizedHGFunCoeff
#check @_root_.Complex.regularizedHGFunCoeff_add_one
#check @_root_.Complex.regularizedHGFunCoeff_eq_zero_right
#check @_root_.Complex.regularizedHGFunCoeff_zero_singleton
#check @_root_.Complex.regularizedHGFun_zero
#check @_root_.Complex.regularizedHGFun_zero_zero
#check @_root_.Complex.slitPlane
#check @_root_.GenContFract
#check @_root_.GenContFract.convs
#check @_root_.Polynomial.hermite
#check @_root_.Real.Gamma
#check @_root_.Real.eulerMascheroniConstant
#check @_root_.Stream'.Seq.ofStream
#check @_root_.TauCeti.Real.erf
#check @_root_.TauCeti.Real.erfc
#check @_root_.TauCeti.lowerIncompleteGamma

end TauCetiRoadmap.SpecialFunctionsConfluent
