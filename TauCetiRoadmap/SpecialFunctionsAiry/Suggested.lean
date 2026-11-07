module

public import Mathlib
public import TauCeti.Analysis.SpecialFunctions.IncompleteGamma

/-!
# Airy and Scorer functions: suggested target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. The statements here suggest Lean forms for particular subsections, so that
contributors and reviewers converge on names and signatures; discharging all of them
finishes neither a layer nor the roadmap.

The definitions below are roadmap-local copies of the definitions `README.md` pins. The complex
functions `airyAi`, `airyBi`, `scorerGi`, `scorerHi` live in `TauCeti`, and their real
restrictions, the modulus and phase functions and the real zeros live in `TauCeti.Real`; here
they live in this file's namespace and its `Real` subnamespace. They are stated with their
intended bodies so that the conventions are checked by the compiler: Mathlib's regularized
`₀F₁` series `Complex.regularizedHGFun 0 {b}` (written `𝐅(b)` here), principal complex powers,
the Laplace integral for `Hi`, the integral definitions of the phases, the zero-counting
definition of the zeros, and the sector filter `Bornology.cobounded ℂ ⊓ 𝓟 {z | |arg z| ≤ θ}`.
Theorems are stated with `sorry`.

The general tools (Watson's lemma, reversion, line shifts, Gamma bounds on vertical strips and
ordinary points) belong to the AsymptoticExpansions roadmap and are not restated here. The
expansions are written out as one `IsBigO` statement per truncation order, which is
AsymptoticExpansions' `Asymptotics.HasAsymptoticExpansion` unfolded, so that this file needs no
import from that roadmap.
-/

@[expose] public section

noncomputable section

namespace TauCetiRoadmap.SpecialFunctionsAiry

open Complex Filter Topology Asymptotics Set MeasureTheory
open scoped Real Nat

/-- Mathlib's regularized `₀F₁`: `𝐅(b) x = ∑ₙ xⁿ / (n! Γ(b + n))`. -/
local notation "𝐅(" b ")" => Complex.regularizedHGFun (0 : Multiset ℂ) ({b} : Multiset ℂ)

/-- Olver's regularized Kummer function `𝐌(a, b, x) = M(a, b, x) / Γ(b)`. -/
local notation "𝐌(" a ", " b ")" =>
  Complex.regularizedHGFun ({a} : Multiset ℂ) ({b} : Multiset ℂ)

/-- The variable `ζ = (2/3) z^{3/2}` with the principal power. -/
local notation "ζ[" z "]" => (2 / 3 : ℂ) * (z) ^ (3 / 2 : ℂ)

/-- The sector filter "`z → ∞` in `|ph z| ≤ θ`". -/
local notation "sectorAtTop " θ =>
  Bornology.cobounded ℂ ⊓ 𝓟 (Set.ofPred fun z : ℂ => |Complex.arg z| ≤ θ)

/-! ### Definitions -/

/-- The Airy function `Ai` (DLMF 9.4.1), written through the regularized `₀F₁`. -/
def airyAi (z : ℂ) : ℂ :=
  (3 : ℂ) ^ (-(2 / 3 : ℂ)) * 𝐅(2 / 3) (z ^ 3 / 9) -
    (3 : ℂ) ^ (-(4 / 3 : ℂ)) * z * 𝐅(4 / 3) (z ^ 3 / 9)

/-- The Airy function `Bi` (DLMF 9.4.3), written through the regularized `₀F₁`. -/
def airyBi (z : ℂ) : ℂ :=
  (3 : ℂ) ^ (-(1 / 6 : ℂ)) * 𝐅(2 / 3) (z ^ 3 / 9) +
    (3 : ℂ) ^ (-(5 / 6 : ℂ)) * z * 𝐅(4 / 3) (z ^ 3 / 9)

/-- The Scorer function `Hi(z) = π⁻¹ ∫₀^∞ exp(−t³/3 + z t) dt` (DLMF 9.12.20). -/
def scorerHi (z : ℂ) : ℂ :=
  (π : ℂ)⁻¹ * ∫ t in Ioi (0 : ℝ), cexp (-(t : ℂ) ^ 3 / 3 + z * t)

/-- The Scorer function `Gi = Bi − Hi` (DLMF 9.12.11). -/
def scorerGi (z : ℂ) : ℂ := airyBi z - scorerHi z

/-- The coefficients `u_k = (2k + 1)(2k + 3)⋯(6k − 1) / (216^k k!)` (DLMF 9.7.2). -/
def airyU (k : ℕ) : ℝ :=
  (∏ j ∈ Finset.range (2 * k), ((2 * k + 1 + 2 * j : ℕ) : ℝ)) / (216 ^ k * (k ! : ℝ))

/-- The coefficients `v_k = −(6k + 1)/(6k − 1) · u_k` (DLMF 9.7.2). -/
def airyV (k : ℕ) : ℝ := -((6 * k + 1 : ℝ) / (6 * k - 1)) * airyU k

local notation "Ai" => TauCetiRoadmap.SpecialFunctionsAiry.airyAi
local notation "Bi" => TauCetiRoadmap.SpecialFunctionsAiry.airyBi
local notation "Gi" => TauCetiRoadmap.SpecialFunctionsAiry.scorerGi
local notation "Hi" => TauCetiRoadmap.SpecialFunctionsAiry.scorerHi

namespace Real

/-- The real restriction of `Ai`. -/
def airyAi (x : ℝ) : ℝ := (Ai x).re

/-- The real restriction of `Bi`. -/
def airyBi (x : ℝ) : ℝ := (Bi x).re

/-- The real restriction of `Gi`. -/
def scorerGi (x : ℝ) : ℝ := (Gi x).re

/-- The real restriction of `Hi`. -/
def scorerHi (x : ℝ) : ℝ := (Hi x).re

/-- `ζ = (2/3) x^{3/2}` for real `x` (DLMF 9.7.1). -/
def airyZeta (x : ℝ) : ℝ := 2 / 3 * x ^ (3 / 2 : ℝ)

/-- The modulus `M = (Ai² + Bi²)^{1/2}` (DLMF 9.8.3). -/
def airyModulus (x : ℝ) : ℝ := √(airyAi x ^ 2 + airyBi x ^ 2)

/-- The modulus `N = (Ai′² + Bi′²)^{1/2}` (DLMF 9.8.7). -/
def airyDerivModulus (x : ℝ) : ℝ := √(deriv airyAi x ^ 2 + deriv airyBi x ^ 2)

/-- The continuous phase `θ` with `θ(0) = π/6` and `M² θ′ = −1/π` (DLMF 9.8.14). -/
def airyPhase (x : ℝ) : ℝ := π / 6 - π⁻¹ * ∫ t in (0 : ℝ)..x, (airyModulus t ^ 2)⁻¹

/-- The continuous phase `φ` with `φ(0) = −π/6` and `N² φ′ = x/π` (DLMF 9.8.14). -/
def airyDerivPhase (x : ℝ) : ℝ :=
  -(π / 6) + π⁻¹ * ∫ t in (0 : ℝ)..x, t / airyDerivModulus t ^ 2

/-- The `k`th negative zero of `f`, counted from `0`: exactly `k − 1` zeros lie in `(x, 0)`. -/
def negativeZero (f : ℝ → ℝ) (k : ℕ) : ℝ :=
  Classical.epsilon fun x : ℝ =>
    x < 0 ∧ f x = 0 ∧ {y : ℝ | x < y ∧ y < 0 ∧ f y = 0}.ncard = k - 1

/-- The zeros `a_k` of `Ai`. -/
def airyAiZero (k : ℕ) : ℝ := negativeZero airyAi k

/-- The zeros `a′_k` of `Ai′`. -/
def airyAiDerivZero (k : ℕ) : ℝ := negativeZero (deriv airyAi) k

/-- The negative zeros `b_k` of `Bi`. -/
def airyBiZero (k : ℕ) : ℝ := negativeZero airyBi k

/-- The negative zeros `b′_k` of `Bi′`. -/
def airyBiDerivZero (k : ℕ) : ℝ := negativeZero (deriv airyBi) k

/-- The multiplier `χ(x) = π^{1/2} Γ(x/2 + 1) / Γ(x/2 + ½)` (DLMF 9.7.3). -/
def airyChi (x : ℝ) : ℝ := √π * Real.Gamma (x / 2 + 1) / Real.Gamma (x / 2 + 1 / 2)

end Real

/-- The zeros `β_k` of `Bi` in `π/3 < ph z < π/2`, ordered by modulus. -/
def airyBiComplexZero (k : ℕ) : ℂ :=
  Classical.epsilon fun z : ℂ =>
    (π / 3 < arg z ∧ arg z < π / 2 ∧ Bi z = 0) ∧
      {w : ℂ | (π / 3 < arg w ∧ arg w < π / 2 ∧ Bi w = 0) ∧ ‖w‖ < ‖z‖}.ncard = k - 1

/-- The zeros `β′_k` of `Bi′` in `π/3 < ph z < π/2`, ordered by modulus. -/
def airyBiDerivComplexZero (k : ℕ) : ℂ :=
  Classical.epsilon fun z : ℂ =>
    (π / 3 < arg z ∧ arg z < π / 2 ∧ deriv Bi z = 0) ∧
      {w : ℂ | (π / 3 < arg w ∧ arg w < π / 2 ∧ deriv Bi w = 0) ∧ ‖w‖ < ‖z‖}.ncard = k - 1

/-- The remainder `R_n(z)` of the expansion of `Ai` (DLMF 9.7.18). -/
def airyRemainderAi (n : ℕ) (z : ℂ) : ℂ :=
  Ai z / (cexp (-ζ[z]) / (2 * (√π : ℝ) * z ^ (1 / 4 : ℂ))) -
    ∑ k ∈ Finset.range n, (-1 : ℂ) ^ k * airyU k / ζ[z] ^ k

/-- The remainder `S_n(z)` of the expansion of `Ai′` (DLMF 9.7.19). -/
def airyRemainderAiDeriv (n : ℕ) (z : ℂ) : ℂ :=
  deriv Ai z / (-(z ^ (1 / 4 : ℂ)) * cexp (-ζ[z]) / (2 * (√π : ℝ))) -
    ∑ k ∈ Finset.range n, (-1 : ℂ) ^ k * airyV k / ζ[z] ^ k

/-- The incomplete Airy function: the integral of DLMF 9.5.4 from `∞ e^{−πi/3}` to `a`
(DLMF §9.14), along the ray to `0` and the segment from `0` to `a`. -/
def incompleteAiryAi (a z : ℂ) : ℂ :=
  (2 * π * I)⁻¹ *
    (-(∫ r in Ioi (0 : ℝ), cexp (-(π * I / 3)) *
        cexp ((r * cexp (-(π * I / 3))) ^ 3 / 3 - z * (r * cexp (-(π * I / 3))))) +
      ∫ s in (0 : ℝ)..1, a * cexp ((s * a) ^ 3 / 3 - z * (s * a)))

/-- The Airy kernel `K_Ai(x, y) = ∫₀^∞ Ai(x + t) Ai(y + t) dt`. -/
def airyKernel (x y : ℝ) : ℝ := ∫ t in Ioi (0 : ℝ), Real.airyAi (x + t) * Real.airyAi (y + t)

/-- The order `p = 1/(n + 2)` of the generalized Airy functions (DLMF 9.13.3). -/
def generalizedAiryOrder (n : ℕ) : ℝ := 1 / (n + 2)

/-- Swanson and Headley's `A_n`, pinned by its series (DLMF 9.13.4 and README 9.1). -/
def generalizedAiryA (n : ℕ) (z : ℂ) : ℂ :=
  let p : ℂ := generalizedAiryOrder n
  p ^ (1 - p) * 𝐅(1 - p) (p ^ 2 * z ^ (n + 2)) - p ^ (1 + p) * z * 𝐅(1 + p) (p ^ 2 * z ^ (n + 2))

/-- Swanson and Headley's `B_n`, pinned by its series (DLMF 9.13.4 and README 9.1). -/
def generalizedAiryB (n : ℕ) (z : ℂ) : ℂ :=
  let p : ℂ := generalizedAiryOrder n
  p ^ (1 / 2 : ℂ) *
    (p ^ (-p) * 𝐅(1 - p) (p ^ 2 * z ^ (n + 2)) + p ^ p * z * 𝐅(1 + p) (p ^ 2 * z ^ (n + 2)))

/-- Reid's integrand `t^{−p} exp(z t − t³/3)` in the logarithmic variable `t = e^w`. -/
def reidKernel (z p w : ℂ) : ℂ := cexp (-p * w + z * cexp w - cexp (3 * w) / 3)

/-- The integral over the path `C(α, β)` of README 9.5: in along `ph t = α`, along the unit circle
from `α` to `β`, and out along `ph t = β`. -/
def reidPath (z p : ℂ) (α β : ℝ) : ℂ :=
  -(∫ r in Ioi (1 : ℝ), cexp (α * I) * reidKernel z p (Real.log r + α * I)) +
    (∫ θ in α..β, I * cexp (θ * I) * reidKernel z p (θ * I)) +
    ∫ r in Ioi (1 : ℝ), cexp (β * I) * reidKernel z p (Real.log r + β * I)

/-- Reid's `A_k(z, p)` (DLMF 9.13.25); the index `k : Fin 3` is DLMF's `k − 1`. -/
def reidAiryA (k : Fin 3) (z p : ℂ) : ℂ :=
  (2 * π * I)⁻¹ *
    match k with
    | 0 => reidPath z p (4 * π / 3) (2 * π / 3)
    | 1 => reidPath z p (2 * π) (4 * π / 3)
    | 2 => reidPath z p (2 * π / 3) 0

/-- Reid's `B₀(z, p)` for integer `p` (DLMF 9.13.26). -/
def reidAiryB0 (z : ℂ) (p : ℤ) : ℂ :=
  (2 * π * I)⁻¹ * ∫ θ in (0 : ℝ)..(2 * π), I * cexp (θ * I) * reidKernel z p (θ * I)

/-! ### Layer 1: definitions, Airy's equation and connection formulas -/

/-- **1.1** `Ai` is entire. -/
theorem differentiable_airyAi : Differentiable ℂ airyAi := sorry

/-- **1.1** The Maclaurin series of `Ai` (DLMF 9.4.1). -/
theorem hasSum_airyAi (z : ℂ) :
    HasSum (fun k : ℕ =>
      airyAi 0 * (3 ^ k * (ascPochhammer ℂ k).eval (1 / 3) * z ^ (3 * k) / (3 * k)!) +
        deriv airyAi 0 *
          (3 ^ k * (ascPochhammer ℂ k).eval (2 / 3) * z ^ (3 * k + 1) / (3 * k + 1)!))
      (airyAi z) := sorry

/-- **1.1** `Ai(0) = 3^{−2/3}/Γ(⅔)` (DLMF 9.2.3). -/
theorem airyAi_zero : airyAi 0 = (3 : ℂ) ^ (-(2 / 3 : ℂ)) / Gamma (2 / 3) := sorry

/-- **1.1** `Ai′(0) = −3^{−1/3}/Γ(⅓)` (DLMF 9.2.4). -/
theorem deriv_airyAi_zero : deriv airyAi 0 = -((3 : ℂ) ^ (-(1 / 3 : ℂ)) / Gamma (1 / 3)) :=
  sorry

/-- **1.1** `Bi(0) = 3^{−1/6}/Γ(⅔)` (DLMF 9.2.5). -/
theorem airyBi_zero : airyBi 0 = (3 : ℂ) ^ (-(1 / 6 : ℂ)) / Gamma (2 / 3) := sorry

/-- **1.1** `Bi′(0) = 3^{1/6}/Γ(⅓)` (DLMF 9.2.6). -/
theorem deriv_airyBi_zero : deriv airyBi 0 = (3 : ℂ) ^ (1 / 6 : ℂ) / Gamma (1 / 3) := sorry

/-- **1.2** Airy's equation for `Ai` (DLMF 9.2.1). -/
theorem airyAi_ode (z : ℂ) : deriv^[2] airyAi z = z * airyAi z := sorry

/-- **1.2** Every entire solution of Airy's equation is a combination of `Ai` and `Bi`. -/
theorem eq_airy_combination {w : ℂ → ℂ} (hw : Differentiable ℂ w)
    (hode : ∀ z, deriv^[2] w z = z * w z) :
    w = fun z => π * (w 0 * deriv airyBi 0 - deriv w 0 * airyBi 0) * airyAi z +
      π * (deriv w 0 * airyAi 0 - w 0 * deriv airyAi 0) * airyBi z := sorry

/-- **1.3** The Wronskian `𝒲{Ai, Bi} = 1/π` (DLMF 9.2.7). -/
theorem wronskian_airyAi_airyBi (z : ℂ) :
    airyAi z * deriv airyBi z - deriv airyAi z * airyBi z = (π : ℂ)⁻¹ := sorry

/-- **1.4** `Bi(z) = e^{−πi/6} Ai(z e^{−2πi/3}) + e^{πi/6} Ai(z e^{2πi/3})` (DLMF 9.2.10). -/
theorem airyBi_eq_airyAi_rotations (z : ℂ) :
    airyBi z = cexp (-(π * I / 6)) * airyAi (z * cexp (-(2 * π * I / 3))) +
      cexp (π * I / 6) * airyAi (z * cexp (2 * π * I / 3)) := sorry

/-- **1.6** `Ai` is real on the real line. -/
theorem ofReal_real_airyAi (x : ℝ) : ((Real.airyAi x : ℝ) : ℂ) = airyAi x := sorry

/-- **1.7** `Ai(−z) = (√z/3)(J_{1/3}(ζ) + J_{−1/3}(ζ))` for `|ph z| < 2π/3` (DLMF 9.6.6). -/
theorem airyAi_neg_eq_besselJ {z : ℂ} (hz0 : z ≠ 0) (hz : |arg z| < 2 * π / 3) :
    airyAi (-z) = z ^ (1 / 2 : ℂ) / 3 *
      (Complex.besselJ (1 / 3) ζ[z] + Complex.besselJ (-(1 / 3)) ζ[z]) := sorry

/-- **1.7** Kummer's second transformation `e^{−x} 𝐌(a, 2a, 2x) = Γ(a + ½) Γ(2a)⁻¹ 𝐅(a + ½, x²/4)`,
auxiliary for DLMF 9.6.25–9.6.26. -/
theorem exp_neg_mul_kummer_two_mul {a : ℂ} (ha : ∀ k : ℕ, 2 * a ≠ -k) (x : ℂ) :
    cexp (-x) * 𝐌(a, 2 * a) (2 * x) =
      Gamma (a + 1 / 2) / Gamma (2 * a) * 𝐅(a + 1 / 2) (x ^ 2 / 4) := sorry

/-- **1.7** `Bi` through Kummer's function (DLMF 9.6.25), with `₁F₁(a; b; x) = Γ(b) 𝐌(a, b, x)` and
`ζ^{2/3}` read as `(2/3)^{2/3} z`. -/
theorem airyBi_eq_kummer (z : ℂ) :
    airyBi z =
      cexp (-ζ[z]) * (Gamma (1 / 3) * 𝐌(1 / 6, 1 / 3) (2 * ζ[z])) /
          ((3 : ℂ) ^ (1 / 6 : ℂ) * Gamma (2 / 3)) +
        (3 : ℂ) ^ (5 / 6 : ℂ) * ((2 / 3 : ℂ) ^ (2 / 3 : ℂ) * z) * cexp (-ζ[z]) *
          (Gamma (5 / 3) * 𝐌(5 / 6, 5 / 3) (2 * ζ[z])) / ((2 : ℂ) ^ (2 / 3 : ℂ) * Gamma (1 / 3)) :=
  sorry

/-! ### Layer 2: integral representations -/

/-- **2.1** The ray form of DLMF 9.5.4. -/
theorem airyAi_eq_ray_integral (z : ℂ) :
    airyAi z = (2 * π * I)⁻¹ *
      ((∫ r in Ioi (0 : ℝ), cexp (π * I / 3) *
          cexp ((r * cexp (π * I / 3)) ^ 3 / 3 - z * (r * cexp (π * I / 3)))) -
        ∫ r in Ioi (0 : ℝ), cexp (-(π * I / 3)) *
          cexp ((r * cexp (-(π * I / 3))) ^ 3 / 3 - z * (r * cexp (-(π * I / 3))))) := sorry

/-- **2.2** `Ai(x) = π⁻¹ ∫₀^∞ cos(t³/3 + x t) dt` as an improper integral (DLMF 9.5.1). -/
theorem airyAi_cos_integral (x : ℝ) :
    Tendsto (fun R : ℝ => ∫ t in (0 : ℝ)..R, Real.cos (t ^ 3 / 3 + x * t)) atTop
      (𝓝 (π * Real.airyAi x)) := sorry

/-- **2.4** The Laplace form of `Ai` (DLMF 9.5.8). -/
theorem airyAi_laplace_integral {z : ℂ} (hz0 : z ≠ 0) (hz : |arg z| < 2 * π / 3) :
    airyAi z = cexp (-ζ[z]) * ζ[z] ^ (-(1 / 6 : ℂ)) /
        ((√π : ℝ) * (48 : ℂ) ^ (1 / 6 : ℂ) * Gamma (5 / 6)) *
      ∫ t in Ioi (0 : ℝ),
        cexp (-(t : ℂ)) * (t : ℂ) ^ (-(1 / 6 : ℂ)) * (2 + t / ζ[z]) ^ (-(1 / 6 : ℂ)) := sorry

/-! ### Layer 3: asymptotic expansions -/

/-- **3.1** The recurrence for `u_k` (DLMF 9.7.2). -/
theorem airyU_succ (k : ℕ) :
    airyU (k + 1) = (6 * k + 1) * (6 * k + 3) * (6 * k + 5) /
      ((2 * k + 1) * 216 * (k + 1)) * airyU k := sorry

/-- **3.2** The expansion of `Ai` in `|ph z| ≤ π − δ` (DLMF 9.7.5). -/
theorem isBigO_airyAi_sub_sum {δ : ℝ} (hδ : 0 < δ) (hδπ : δ < π) (N : ℕ) :
    (fun z => airyAi z - cexp (-ζ[z]) / (2 * (√π : ℝ) * z ^ (1 / 4 : ℂ)) *
        ∑ k ∈ Finset.range N, (-1 : ℂ) ^ k * airyU k / ζ[z] ^ k)
      =O[sectorAtTop (π - δ)]
        fun z => ‖cexp (-ζ[z]) / z ^ (1 / 4 : ℂ)‖ * ‖ζ[z]‖ ^ (-(N : ℤ)) := sorry

/-- **3.3** The expansion of `Bi` in `|ph z| ≤ π/3 − δ` (DLMF 9.7.7). -/
theorem isBigO_airyBi_sub_sum {δ : ℝ} (hδ : 0 < δ) (hδπ : δ < π / 3) (N : ℕ) :
    (fun z => airyBi z - cexp ζ[z] / ((√π : ℝ) * z ^ (1 / 4 : ℂ)) *
        ∑ k ∈ Finset.range N, airyU k / ζ[z] ^ k)
      =O[sectorAtTop (π / 3 - δ)]
        fun z => ‖cexp ζ[z] / z ^ (1 / 4 : ℂ)‖ * ‖ζ[z]‖ ^ (-(N : ℤ)) := sorry

/-- **3.4** The oscillatory expansion of `Ai(−z)` in `|ph z| ≤ 2π/3 − δ` (DLMF 9.7.9), with
independent truncation orders for the even and odd sums. -/
theorem isBigO_airyAi_neg_sub_osc {δ : ℝ} (hδ : 0 < δ) (hδπ : δ < 2 * π / 3) (N M : ℕ) :
    (fun z => airyAi (-z) - ((√π : ℝ) * z ^ (1 / 4 : ℂ))⁻¹ *
        (cos (ζ[z] - π / 4) *
            ∑ k ∈ Finset.range N, (-1 : ℂ) ^ k * airyU (2 * k) / ζ[z] ^ (2 * k) +
          sin (ζ[z] - π / 4) *
            ∑ k ∈ Finset.range M, (-1 : ℂ) ^ k * airyU (2 * k + 1) / ζ[z] ^ (2 * k + 1)))
      =O[sectorAtTop (2 * π / 3 - δ)]
        fun z => ‖z ^ (-(1 / 4 : ℂ))‖ * Real.exp |(ζ[z]).im| *
          (‖ζ[z]‖ ^ (-(2 * N : ℤ)) + ‖ζ[z]‖ ^ (-(2 * M + 1 : ℤ))) := sorry

/-- **3.5** The error bound of DLMF 9.7.17 in the sector `|ph z| ≤ π/3`. -/
theorem norm_airyRemainderAi_le {z : ℂ} (hz : z ≠ 0) (harg : |arg z| ≤ π / 3) (n : ℕ) :
    ‖airyRemainderAi n z‖ ≤ airyU n * ‖ζ[z]‖ ^ (-(n : ℤ)) := sorry

/-- **3.5** On the positive axis the error of DLMF 9.7.5 is bounded by the first neglected term
and has its sign. -/
theorem airyRemainderAi_real_eq {x : ℝ} (hx : 0 < x) (n : ℕ) :
    ∃ θ ∈ Icc (0 : ℝ) 1, airyRemainderAi n x =
      ((θ * ((-1) ^ n * airyU n * Real.airyZeta x ^ (-(n : ℤ))) : ℝ) : ℂ) := sorry

/-- **3.6** `Ai` is, up to a factor, the only real solution of Airy's equation that tends to
`0` at `+∞`. -/
theorem eq_smul_real_airyAi {w : ℝ → ℝ} (hw : ContDiff ℝ 2 w)
    (hode : ∀ x, deriv^[2] w x = x * w x) (hlim : Tendsto w atTop (𝓝 0)) :
    w = fun x => w 0 / Real.airyAi 0 * Real.airyAi x := sorry

/-! ### Layer 4: modulus and phase -/

/-- **4.1** `M² θ′ = −1/π` and `N² φ′ = x/π` (DLMF 9.8.14). -/
theorem airy_modulus_phase_deriv (x : ℝ) :
    HasDerivAt Real.airyPhase (-(π * Real.airyModulus x ^ 2)⁻¹) x ∧
      HasDerivAt Real.airyDerivPhase (x / (π * Real.airyDerivModulus x ^ 2)) x := sorry

/-- **4.2** `Ai(x) = M(x) sin θ(x)` (DLMF 9.8.1), for every real `x`. -/
theorem real_airyAi_eq_modulus_mul_sin (x : ℝ) :
    Real.airyAi x = Real.airyModulus x * Real.sin (Real.airyPhase x) := sorry

/-- **4.5** The expansion of `M²` as `x → −∞` (DLMF 9.8.20). -/
theorem airyModulus_sq_expansion (N : ℕ) :
    (fun x : ℝ => Real.airyModulus x ^ 2 - (π * (-x) ^ (1 / 2 : ℝ))⁻¹ *
        ∑ k ∈ Finset.range N,
          (∏ j ∈ Finset.range (3 * k), (2 * j + 1 : ℝ)) / ((k ! : ℝ) * 96 ^ k) *
            x ^ (-(3 * k : ℤ)))
      =O[atBot] fun x => (-x) ^ (-(1 / 2 : ℝ)) * |x| ^ (-(3 * N : ℤ)) := sorry

/-! ### Layer 5: zeros -/

/-- **5.2** `a_k` is attained: a negative zero of `Ai` with `k − 1` zeros in `(a_k, 0)`. -/
theorem airyAiZero_spec {k : ℕ} (hk : 1 ≤ k) :
    Real.airyAiZero k < 0 ∧ Real.airyAi (Real.airyAiZero k) = 0 ∧
      {y : ℝ | Real.airyAiZero k < y ∧ y < 0 ∧ Real.airyAi y = 0}.ncard = k - 1 := sorry

/-- **5.2** `θ(a_k) = kπ` (DLMF 9.9.1). -/
theorem airyPhase_airyAiZero {k : ℕ} (hk : 1 ≤ k) :
    Real.airyPhase (Real.airyAiZero k) = k * π := sorry

/-- **5.3** The nonreal zeros of `Bi` lie in `π/3 < |ph z| < π/2`. -/
theorem airyBi_eq_zero_mem_sector {z : ℂ} (hz : airyBi z = 0) (him : z.im ≠ 0) :
    π / 3 < |arg z| ∧ |arg z| < π / 2 := sorry

/-- **5.4** The expansion of `a_k` (DLMF 9.9.6, 9.9.18), with the first printed coefficients;
`README.md` pins the whole coefficient sequence by reversion of the phase expansion. -/
theorem airyAiZero_expansion :
    ∃ T : ℕ → ℝ, T 0 = 1 ∧ T 1 = 5 / 48 ∧ T 2 = -5 / 36 ∧ T 3 = 77125 / 82944 ∧
      ∀ N : ℕ,
        (fun k : ℕ => -Real.airyAiZero k / (3 * π / 8 * (4 * k - 1)) ^ (2 / 3 : ℝ) -
            ∑ n ∈ Finset.range N, T n * (3 * π / 8 * (4 * k - 1)) ^ (-(2 * n : ℤ)))
          =O[atTop] fun k : ℕ => (3 * π / 8 * (4 * k - 1)) ^ (-(2 * N : ℤ)) := sorry

/-! ### Layer 6: Scorer functions -/

/-- **6.1** `Hi` is entire. -/
theorem differentiable_scorerHi : Differentiable ℂ scorerHi := sorry

/-- **6.1** `Hi″ = z Hi + 1/π` (DLMF 9.12.1). -/
theorem scorerHi_ode (z : ℂ) : deriv^[2] scorerHi z = z * scorerHi z + (π : ℂ)⁻¹ := sorry

/-- **6.2** `Gi(0) = 1/(3^{7/6} Γ(⅔))` (DLMF 9.12.6). -/
theorem scorerGi_zero : scorerGi 0 = 1 / ((3 : ℂ) ^ (7 / 6 : ℂ) * Gamma (2 / 3)) := sorry

/-- **6.4** The Maclaurin series of `Hi` (DLMF 9.12.17). -/
theorem hasSum_scorerHi (z : ℂ) :
    HasSum (fun k : ℕ => (3 : ℂ) ^ (-(2 / 3 : ℂ)) / π * Gamma ((k + 1) / 3) *
      ((3 : ℂ) ^ (1 / 3 : ℂ) * z) ^ k / k !) (scorerHi z) := sorry

/-- **6.5** The Mellin–Barnes integral for `Hi` (DLMF 9.12.24), on the line `Re s = σ`. -/
theorem scorerHi_mellin_barnes {z : ℂ} (hz0 : z ≠ 0) (hz : |arg (-z)| < 2 * π / 3) {σ : ℝ}
    (hσ₀ : -1 < σ) (hσ₁ : σ < 0) :
    Integrable (fun y : ℝ => Gamma (1 / 3 + (σ + y * I) / 3) * Gamma (-(σ + y * I)) *
        cexp ((σ + y * I) * (Complex.log 3 / 3 + Complex.log (-z)))) ∧
      ∫ y : ℝ, Gamma (1 / 3 + (σ + y * I) / 3) * Gamma (-(σ + y * I)) *
          cexp ((σ + y * I) * (Complex.log 3 / 3 + Complex.log (-z))) =
        2 * π ^ 2 * (3 : ℂ) ^ (2 / 3 : ℂ) * scorerHi z := sorry

/-- **6.7** The energy `E = Gi′² − x Gi² + 2 Gi/π` has derivative `−Gi²`. -/
theorem hasDerivAt_scorerGi_energy (x : ℝ) :
    HasDerivAt (fun t => deriv Real.scorerGi t ^ 2 - t * Real.scorerGi t ^ 2 +
      2 * Real.scorerGi t / π) (-(Real.scorerGi x ^ 2)) x := sorry

/-! ### Layer 7: integrals -/

/-- **7.1** Gauss's triplication formula (DLMF 5.5.6 with `m = 3`). -/
theorem Complex.Gamma_mul_Gamma_add_third (z : ℂ) :
    Gamma z * Gamma (z + 1 / 3) * Gamma (z + 2 / 3) =
      2 * π * (3 : ℂ) ^ (1 / 2 - 3 * z) * Gamma (3 * z) := sorry

/-- **7.2** `∫₀^∞ Ai = ⅓` (DLMF 9.10.11). -/
theorem integral_airyAi_Ioi : ∫ x in Ioi (0 : ℝ), Real.airyAi x = 1 / 3 := sorry

/-- **7.5** The Laplace transform of `Ai(−t)` for real `p > 0` (DLMF 9.10.15), through Tau
Ceti's regularized lower incomplete Gamma function `P = TauCeti.regularizedGamma`. -/
theorem airyAi_neg_laplace {p : ℝ} (hp : 0 < p) :
    ∫ t in Ioi (0 : ℝ), Real.exp (-(p * t)) * Real.airyAi (-t) =
      Real.exp (p ^ 3 / 3) / 3 *
        ((1 - TauCeti.regularizedGamma (1 / 3) (p ^ 3 / 3)) +
          (1 - TauCeti.regularizedGamma (2 / 3) (p ^ 3 / 3))) := sorry

/-- **7.6** The Mellin transform of `Ai` (DLMF 9.10.17). -/
theorem airyAi_mellin {α : ℂ} (hα : 0 < α.re) :
    ∫ t in Ioi (0 : ℝ), (t : ℂ) ^ (α - 1) * airyAi t =
      Gamma α / ((3 : ℂ) ^ ((α + 2) / 3) * Gamma (α / 3 + 2 / 3)) := sorry

/-- **7.6** The Sokhotski–Plemelj formula on `(0, ∞)`, from the upper half-plane. -/
theorem tendsto_cauchyIntegral_Ioi {f : ℝ → ℂ} {s₀ : ℝ} (hs₀ : 0 < s₀)
    (hf : IntegrableOn (fun s => f s / (1 + s)) (Ioi 0))
    (hC1 : ∃ ε > 0, ContDiffOn ℝ 1 f (Ioo (s₀ - ε) (s₀ + ε))) :
    ∃ L : ℂ,
      Tendsto (fun ε : ℝ => ∫ s in Ioi (0 : ℝ) \ Ioo (s₀ - ε) (s₀ + ε), f s / (s - s₀))
        (𝓝[>] 0) (𝓝 L) ∧
      Tendsto (fun w : ℂ => ∫ s in Ioi (0 : ℝ), f s / (s - w))
        (𝓝[{w : ℂ | 0 < w.im}] (s₀ : ℂ)) (𝓝 (L + π * I * f s₀)) := sorry

/-! ### Layer 8: products -/

/-- **8.1** An entire solution of `w‴ − 4z w′ − 2w = 0` is determined by `w(0)`, `w′(0)`,
`w″(0)`. -/
theorem eq_of_productEquation {f g : ℂ → ℂ} (hf : Differentiable ℂ f) (hg : Differentiable ℂ g)
    (hfe : ∀ z, deriv^[3] f z - 4 * z * deriv f z - 2 * f z = 0)
    (hge : ∀ z, deriv^[3] g z - 4 * z * deriv g z - 2 * g z = 0)
    (h₀ : f 0 = g 0) (h₁ : deriv f 0 = deriv g 0) (h₂ : deriv^[2] f 0 = deriv^[2] g 0) :
    f = g := sorry

/-- **8.3** `Ai(x)² = (4π√3)⁻¹ ∫₀^∞ J₀(t³/12 + x t) t dt` for `x ≥ 0`, as an improper integral
(DLMF 9.11.3). -/
theorem airyAi_sq_eq_besselJ_integral {x : ℝ} (hx : 0 ≤ x) :
    Tendsto (fun R : ℝ => ∫ t in (0 : ℝ)..R, Complex.besselJ 0 ((t : ℂ) ^ 3 / 12 + x * t) * t)
      atTop (𝓝 ((4 * π * √3 * Real.airyAi x ^ 2 : ℝ) : ℂ)) := sorry

/-- **8.3** `Ai(x)² = 2^{2/3} π⁻¹ ∫₀^∞ Ai(2^{2/3}(x + t²)) dt`. -/
theorem airyAi_sq_eq_integral (x : ℝ) :
    Real.airyAi x ^ 2 = 2 ^ (2 / 3 : ℝ) / π *
      ∫ t in Ioi (0 : ℝ), Real.airyAi (2 ^ (2 / 3 : ℝ) * (x + t ^ 2)) := sorry

/-- **8.5** The closed form of the Airy kernel off the diagonal. -/
theorem airyKernel_eq_of_ne {x y : ℝ} (hxy : x ≠ y) :
    airyKernel x y = (Real.airyAi x * deriv Real.airyAi y - deriv Real.airyAi x *
      Real.airyAi y) / (x - y) := sorry

/-! ### Layer 9: generalized Airy functions -/

/-- **9.1** `A_n″ = zⁿ A_n` (DLMF 9.13.1). -/
theorem generalizedAiryA_ode (n : ℕ) (z : ℂ) :
    deriv^[2] (generalizedAiryA n) z = z ^ n * generalizedAiryA n z := sorry

/-- **9.1** `𝒲{A_n, B_n} = (2/π) p^{1/2} sin(pπ)` (DLMF 9.13.8). -/
theorem generalizedAiry_wronskian (n : ℕ) (z : ℂ) :
    generalizedAiryA n z * deriv (generalizedAiryB n) z -
        deriv (generalizedAiryA n) z * generalizedAiryB n z =
      ((2 / π * √(generalizedAiryOrder n) * Real.sin (generalizedAiryOrder n * π) : ℝ) : ℂ) :=
  sorry

/-- **9.3** The integral representation of `A_n` for `|ph z| < pπ`, with
`ζ = 2p z^{(n+2)/2}`. -/
theorem generalizedAiryA_eq_integral (n : ℕ) {z : ℂ} (hz0 : z ≠ 0)
    (hz : |arg z| < generalizedAiryOrder n * π) :
    generalizedAiryA n z =
      2 * generalizedAiryOrder n / π * Real.sin (generalizedAiryOrder n * π) * z ^ (1 / 2 : ℂ) *
        ∫ u in Ioi (0 : ℝ), cexp (-(2 * generalizedAiryOrder n * z ^ (((n : ℂ) + 2) / 2)) *
          Real.cosh u) * Real.cosh (generalizedAiryOrder n * u) := sorry

/-- **9.3** The leading behaviour of `A_n` in `|ph z| ≤ 3pπ − δ` (DLMF 9.13.9). -/
theorem isBigO_generalizedAiryA_sub (n : ℕ) {δ : ℝ} (hδ : 0 < δ)
    (hδp : δ < 3 * generalizedAiryOrder n * π) :
    (fun z => generalizedAiryA n z -
        √(generalizedAiryOrder n / π) * Real.sin (generalizedAiryOrder n * π) *
          z ^ (-(n : ℂ) / 4) * cexp (-(2 * generalizedAiryOrder n * z ^ (((n : ℂ) + 2) / 2))))
      =O[sectorAtTop (3 * generalizedAiryOrder n * π - δ)]
        fun z => ‖z ^ (-(n : ℂ) / 4) * cexp (-(2 * generalizedAiryOrder n *
          z ^ (((n : ℂ) + 2) / 2)))‖ * ‖2 * generalizedAiryOrder n * z ^ (((n : ℂ) + 2) / 2)‖⁻¹ :=
  sorry

/-- **9.5** `A₁ + A₂ + A₃ + B₀ = 0` for integer `p` (DLMF 9.13.34). -/
theorem reidAiry_connection_sum (z : ℂ) (p : ℤ) :
    reidAiryA 0 z p + reidAiryA 1 z p + reidAiryA 2 z p + reidAiryB0 z p = 0 := sorry

end TauCetiRoadmap.SpecialFunctionsAiry
