module

public import Mathlib

/-!
# Coulomb functions: target signatures

This file states, against the pinned Mathlib and Tau Ceti, the headlines of `README.md` that
carry a Lean name, each with every conclusion the README attaches to it. It is not an exhaustive
acceptance test: the other headlines of the README are targets of the same standing, stated in
prose. Discharging this file finishes neither a layer nor the roadmap.

Headlines of the README without a Lean statement here, and what each lacks:
- the logarithmic series of `H^±_ℓ` (README 3.2) and of `h` (README 6.4) need the digamma
  coefficients written out as named sequences, which the README describes but does not name;
- the real form of the large-`ρ` expansion (README 5.1) needs the sequences `f_k, g_k, f̂_k, ĝ_k`
  as named functions; the expansion of `H⁺_ℓ` itself is stated here;
- the Whittaker forms of `s` and `c` for `r < 0` (README 6.3) are stated only for `r > 0` here.

The definitions below are roadmap-local copies. Kummer's `U` and the Whittaker functions are
verbatim copies of SpecialFunctionsConfluent (its Conventions and 1.4, 1.6); the Laguerre
polynomials are a verbatim copy of LaguerreJacobi 1.1; `I_ν` and the spherical Bessel functions
are verbatim copies of SpecialFunctionsBessel (its Conventions). QuantumFoundations §9.5 defines
`C_ℓ`, `θ_ℓ`, `F_ℓ`, `H^±_ℓ` and `G_ℓ` in prose; they are written out here as that section states
them, with `M(a, b, z) = Γ(b) 𝐌(a, b, z)`. It specifies `σ_ℓ` as the continuous phase of
`Γ(ℓ + 1 + iη)` vanishing at `η = 0`; this file realises it by the product formula of README 1.2,
and `coulombPhase_spec` proves that the two agree. The remaining definitions are owned by this
roadmap. All have their intended bodies, so that the conventions are checked by the compiler.
Theorems are stated with `sorry`. Section numbers in docstrings are those of the README; equation
numbers are DLMF's.
-/

@[expose] public section

noncomputable section

namespace TauCetiRoadmap.SpecialFunctionsCoulomb

open Complex Filter Topology Set MeasureTheory
open scoped Real Nat Polynomial

/-- Olver's regularized Kummer function `𝐌(a, b, z) = M(a, b, z) / Γ(b)`. -/
local notation "𝐌(" a ", " b ")" =>
  Complex.regularizedHGFun ({a} : Multiset ℂ) ({b} : Multiset ℂ)

/-- Mathlib's regularized `₀F₁`: `𝐅(b) x = ∑ₙ xⁿ / (n! Γ(b + n))`. -/
local notation "𝐅(" b ")" => Complex.regularizedHGFun (0 : Multiset ℂ) ({b} : Multiset ℂ)

/-! ## Local copies of supplier definitions -/

namespace Complex

/-- Local copy: SpecialFunctionsConfluent, Conventions and §1.4. The bracket
`F(a, b, w) = 𝐌(a, b, e^w)/Γ(a − b + 1) − e^{(1−b)w} 𝐌(a − b + 1, 2 − b, e^w)/Γ(a)`. -/
def kummerUBracket (a b w : ℂ) : ℂ :=
  𝐌(a, b) (cexp w) * (Gamma (a - b + 1))⁻¹ -
    cexp ((1 - b) * w) * 𝐌(a - b + 1, 2 - b) (cexp w) * (Gamma a)⁻¹

open scoped Classical in
/-- Local copy: SpecialFunctionsConfluent, Conventions and §1.4. Kummer's function `U(a, b, e^w)`
on the logarithmic plane (DLMF 13.2.42 and its limit at integer `b`). -/
def kummerULog (a b w : ℂ) : ℂ :=
  if ∃ n : ℤ, (n : ℂ) = b then
    Complex.cos (π * b) * deriv (fun β => kummerUBracket a β w) b
  else (π : ℂ) / Complex.sin (π * b) * kummerUBracket a b w

/-- Local copy: SpecialFunctionsConfluent, Conventions (§1.6). The principal branch `U(a, b, z)`. -/
def kummerU (a b z : ℂ) : ℂ := kummerULog a b (Complex.log z)

/-- Local copy: SpecialFunctionsConfluent, Conventions (§1.6).
`𝐌_{κ,μ}(z) = M_{κ,μ}(z) / Γ(1 + 2μ)`. -/
def regularizedWhittakerM (κ μ z : ℂ) : ℂ :=
  cexp (-z / 2) * z ^ (1 / 2 + μ) * 𝐌(1 / 2 + μ - κ, 1 + 2 * μ) z

/-- Local copy: SpecialFunctionsConfluent, Conventions (§1.6).
Whittaker's `M_{κ,μ}(z)` (DLMF 13.14.2). -/
def whittakerM (κ μ z : ℂ) : ℂ := Gamma (1 + 2 * μ) * regularizedWhittakerM κ μ z

/-- Local copy: SpecialFunctionsConfluent, Conventions (§1.6).
Whittaker's `W_{κ,μ}(z)` (DLMF 13.14.3). -/
def whittakerW (κ μ z : ℂ) : ℂ :=
  cexp (-z / 2) * z ^ (1 / 2 + μ) * kummerU (1 / 2 + μ - κ) (1 + 2 * μ) z

/-- Local copy: SpecialFunctionsConfluent, Conventions (§1.6).
`W_{κ,μ}(e^w)` on the logarithmic plane. -/
def whittakerWLog (κ μ w : ℂ) : ℂ :=
  cexp (-cexp w / 2) * cexp ((1 / 2 + μ) * w) * kummerULog (1 / 2 + μ - κ) (1 + 2 * μ) w

/-- Local copy: SpecialFunctionsBessel, Conventions. `I_ν(z) = (z/2)^ν 𝐅(ν + 1, (z/2)²)`. -/
def besselI (ν z : ℂ) : ℂ := (z / 2) ^ ν * 𝐅(ν + 1) ((z / 2) ^ 2)

/-- Local copy: SpecialFunctionsBessel, Conventions.
`𝗃_n(z) = (√π/2) (z/2)ⁿ 𝐅(n + 3/2, −(z/2)²)`. -/
def sphericalBesselJ (n : ℕ) (z : ℂ) : ℂ :=
  (Real.sqrt π : ℂ) / 2 * (z / 2) ^ n * 𝐅((n : ℂ) + 3 / 2) (-(z / 2) ^ 2)

/-- Local copy: SpecialFunctionsBessel, Conventions.
`𝗒_n(z) = (−1)^{n+1} (√π/2) (z/2)^{−n−1} 𝐅(½ − n, −(z/2)²)`. -/
def sphericalBesselY (n : ℕ) (z : ℂ) : ℂ :=
  (-1 : ℂ) ^ (n + 1) * (Real.sqrt π : ℂ) / 2 * (z / 2) ^ (-((n : ℤ) + 1)) *
    𝐅(1 / 2 - (n : ℂ)) (-(z / 2) ^ 2)

end Complex

namespace Polynomial

open _root_.Polynomial

/-- Local copy: LaguerreJacobi, §1.1. The generalized Laguerre polynomial `Lₙ^{(α)}`
(DLMF 18.5.12). -/
noncomputable def laguerre {R : Type*} [CommRing R] [Algebra ℚ R] (α : R) (n : ℕ) : R[X] :=
  ∑ k ∈ Finset.range (n + 1),
    ((-1 : R) ^ k * (((1 : ℚ) / ((n - k).factorial * k.factorial)) •
      (ascPochhammer R (n - k)).smeval (α + k + 1))) • X ^ k

end Polynomial

open Complex

/-! ## The functions of `(η, ρ)` (README Conventions) -/

/-- The Coulomb phase shift `σ_ℓ(η)` (README 1.2; DLMF 33.2.10), by the product formula
`σ_ℓ(η) = −γη + ∑_{n≥1} (η/n − arctan(η/n)) + ∑_{k=1}^{ℓ} arctan(η/k)`; QuantumFoundations §9.5
specifies it as the continuous phase of `Γ(ℓ + 1 + iη)` vanishing at `η = 0`
(`coulombPhase_spec`). -/
def coulombPhase (ℓ : ℕ) (η : ℝ) : ℝ :=
  -Real.eulerMascheroniConstant * η +
      ∑' n : ℕ, (η / ((n : ℝ) + 1) - Real.arctan (η / ((n : ℝ) + 1))) +
    ∑ k ∈ Finset.range ℓ, Real.arctan (η / ((k : ℝ) + 1))

/-- Local copy: QuantumFoundations §9.5. `C_ℓ(η) = 2^ℓ e^{−πη/2} |Γ(ℓ + 1 + iη)| / (2ℓ + 1)!`
(DLMF 33.2.5). -/
def coulombC (ℓ : ℕ) (η : ℝ) : ℝ :=
  2 ^ ℓ * Real.exp (-(π * η) / 2) * ‖Gamma ((ℓ : ℂ) + 1 + (η : ℂ) * I)‖ / ((2 * ℓ + 1)! : ℝ)

/-- Local copy: QuantumFoundations §9.5. `θ_ℓ(η, ρ) = ρ − η ln(2ρ) − ℓπ/2 + σ_ℓ(η)`
(DLMF 33.2.9); used for `ρ > 0`. -/
def coulombTheta (ℓ : ℕ) (η ρ : ℝ) : ℝ :=
  ρ - η * Real.log (2 * ρ) - ℓ * π / 2 + coulombPhase ℓ η

/-- Local copy: QuantumFoundations §9.5. The regular Coulomb function
`F_ℓ(η, ρ) = C_ℓ(η) ρ^{ℓ+1} e^{iρ} M(ℓ + 1 + iη, 2ℓ + 2, −2iρ)` (DLMF 33.2.4, lower signs), with
`M = (2ℓ + 1)! 𝐌`. Complex valued; it is real (QuantumFoundations §9.5). -/
def coulombF (ℓ : ℕ) (η ρ : ℝ) : ℂ :=
  coulombC ℓ η * (ρ : ℂ) ^ (ℓ + 1) * cexp ((ρ : ℂ) * I) *
    (((2 * ℓ + 1)! : ℂ) * 𝐌((ℓ : ℂ) + 1 + (η : ℂ) * I, 2 * (ℓ : ℂ) + 2) (-2 * (ρ : ℂ) * I))

/-- Local copy: QuantumFoundations §9.5.
`H⁺_ℓ = e^{iθ_ℓ} (−2iρ)^{ℓ+1+iη} U(ℓ + 1 + iη, 2ℓ + 2, −2iρ)`
(DLMF 33.2.8, upper signs); used for `ρ > 0`. -/
def coulombHPlus (ℓ : ℕ) (η ρ : ℝ) : ℂ :=
  cexp ((coulombTheta ℓ η ρ : ℂ) * I) * (-2 * (ρ : ℂ) * I) ^ ((ℓ : ℂ) + 1 + (η : ℂ) * I) *
    Complex.kummerU ((ℓ : ℂ) + 1 + (η : ℂ) * I) (2 * (ℓ : ℂ) + 2) (-2 * (ρ : ℂ) * I)

/-- Local copy: QuantumFoundations §9.5.
`H⁻_ℓ = e^{−iθ_ℓ} (2iρ)^{ℓ+1−iη} U(ℓ + 1 − iη, 2ℓ + 2, 2iρ)`
(DLMF 33.2.8, lower signs); used for `ρ > 0`. -/
def coulombHMinus (ℓ : ℕ) (η ρ : ℝ) : ℂ :=
  cexp (-((coulombTheta ℓ η ρ : ℂ) * I)) * (2 * (ρ : ℂ) * I) ^ ((ℓ : ℂ) + 1 - (η : ℂ) * I) *
    Complex.kummerU ((ℓ : ℂ) + 1 - (η : ℂ) * I) (2 * (ℓ : ℂ) + 2) (2 * (ρ : ℂ) * I)

/-- Local copy: QuantumFoundations §9.5. `G_ℓ = (H⁺_ℓ + H⁻_ℓ)/2`; used for `ρ > 0`. -/
def coulombG (ℓ : ℕ) (η ρ : ℝ) : ℂ := (coulombHPlus ℓ η ρ + coulombHMinus ℓ η ρ) / 2

/-- The coefficients of the power series of `F_ℓ` (README 3.1; DLMF 33.6.2–33.6.3), shifted:
`coulombSeriesCoeff ℓ η j = A^ℓ_{ℓ+1+j}(η)`, with `A^ℓ_{ℓ+1} = 1`, `A^ℓ_{ℓ+2} = η/(ℓ + 1)` and
`(k + ℓ)(k − ℓ − 1) A^ℓ_k = 2η A^ℓ_{k−1} − A^ℓ_{k−2}`. -/
def coulombSeriesCoeff (ℓ : ℕ) (η : ℝ) : ℕ → ℝ
  | 0 => 1
  | 1 => η / ((ℓ : ℝ) + 1)
  | j + 2 =>
      (2 * η * coulombSeriesCoeff ℓ η (j + 1) - coulombSeriesCoeff ℓ η j) /
        (((2 * ℓ + j + 3 : ℕ) : ℝ) * ((j + 2 : ℕ) : ℝ))

/-- The coefficients of the expansions in `I_k` and `J_k` (README 4.3; DLMF 33.9.5), shifted:
`coulombBesselCoeff ℓ η j = b_{2ℓ+1+j}`, with `b_{2ℓ} = 0`, `b_{2ℓ+1} = 1`, `b_{2ℓ+2} = 0` and
`4η²(k − 2ℓ) b_{k+1} + k b_{k−1} + b_{k−2} = 0` for `k ≥ 2ℓ + 2`. Junk at `η = 0`. -/
def coulombBesselCoeff (ℓ : ℕ) (η : ℝ) : ℕ → ℝ
  | 0 => 1
  | 1 => 0
  | 2 => -(2 * (ℓ : ℝ) + 2) / (8 * η ^ 2)
  | m + 3 =>
      -(((2 * ℓ + 3 + m : ℕ) : ℝ) * coulombBesselCoeff ℓ η (m + 1) + coulombBesselCoeff ℓ η m) /
        (4 * η ^ 2 * ((m + 3 : ℕ) : ℝ))

/-- The coefficients of the expansion in spherical Bessel functions (README 4.2; DLMF
33.9.1–33.9.2): `a_0 = (2ℓ + 1)!! C_ℓ(η)`, `a_{−1} = 0` and
`(k(k + 2ℓ + 1)/(2k + 2ℓ + 1)) a_k = 2η a_{k−1} − ((k − 2)(k + 2ℓ − 1)/(2k + 2ℓ − 3)) a_{k−2}`
for `k ≥ 1`; at `k = 1` this is `a_1 = 2η a_0 (2ℓ + 3)/(2ℓ + 2)`. -/
def coulombSphericalCoeff (ℓ : ℕ) (η : ℝ) : ℕ → ℝ
  | 0 => ((2 * ℓ + 1).doubleFactorial : ℝ) * coulombC ℓ η
  | 1 => 2 * η * (((2 * ℓ + 1).doubleFactorial : ℝ) * coulombC ℓ η) * (2 * ℓ + 3) / (2 * ℓ + 2)
  | k + 2 =>
      (2 * η * coulombSphericalCoeff ℓ η (k + 1) -
          (k : ℝ) * (k + 2 * ℓ + 1) / (2 * k + 2 * ℓ + 1) * coulombSphericalCoeff ℓ η k) *
        (2 * k + 2 * ℓ + 5) / (((k : ℝ) + 2) * (k + 2 * ℓ + 3))

/-! ## The functions of `(ε, r)` (README Conventions and Layer 6) -/

/-- The coefficients `α_k` of the regular solution `f(ε, ℓ; r) = r^{ℓ+1} ∑ α_k r^k`
(README 6.1; DLMF 33.19.2): `α₀ = 2^{ℓ+1}/(2ℓ + 1)!`, `α₁ = −α₀/(ℓ + 1)`,
`k(k + 2ℓ + 1) α_k + 2α_{k−1} + ε α_{k−2} = 0`. -/
def coulombEnergyCoeff (ε : ℝ) (ℓ : ℕ) : ℕ → ℝ
  | 0 => 2 ^ (ℓ + 1) / ((2 * ℓ + 1)! : ℝ)
  | 1 => -(2 ^ (ℓ + 1) / ((2 * ℓ + 1)! : ℝ)) / ((ℓ : ℝ) + 1)
  | k + 2 =>
      -(2 * coulombEnergyCoeff ε ℓ (k + 1) + ε * coulombEnergyCoeff ε ℓ k) /
        (((k + 2) * (k + 2 * ℓ + 3) : ℕ) : ℝ)

/-- The regular Coulomb function `f(ε, ℓ; r)` (README 6.1; DLMF 33.14.4–33.14.5, 33.19.1), entire
in `(ε, r)`. -/
def coulombEnergyF (ε : ℝ) (ℓ : ℕ) (r : ℝ) : ℝ :=
  r ^ (ℓ + 1) * ∑' k : ℕ, coulombEnergyCoeff ε ℓ k * r ^ k

/-- `A(ε, ℓ) = ∏_{k=0}^{ℓ} (1 + εk²)` (README 6.1; DLMF 33.14.11). -/
def coulombEnergyA (ε : ℝ) (ℓ : ℕ) : ℝ :=
  ∏ k ∈ Finset.range (ℓ + 1), (1 + ε * (k : ℝ) ^ 2)

/-- `κ` of DLMF 33.14.6 with the upper sign `κ = iε^{−1/2}` for `ε > 0` (README Conventions).
Junk at `ε = 0`. -/
def coulombKappa (ε r : ℝ) : ℂ :=
  if ε < 0 then (if 0 < r then ((Real.sqrt (-ε))⁻¹ : ℂ) else -((Real.sqrt (-ε))⁻¹ : ℂ))
  else I * ((Real.sqrt ε)⁻¹ : ℂ)

/-- The factor `S(ε, r)` of DLMF 33.14.8 (README 6.2). -/
def coulombStokesFactor (ε r : ℝ) : ℝ :=
  if ε < 0 then (if 0 < r then 2 * Real.cos (π / Real.sqrt (-ε)) else 0)
  else if 0 < r then Real.exp (π / Real.sqrt ε) else Real.exp (-(π / Real.sqrt ε))

/-- The irregular Coulomb function `h(ε, ℓ; r)` for `ε ≠ 0`, `r ≠ 0` (README 6.2; DLMF 33.14.7),
the real part of `Γ(ℓ + 1 − κ)/(πκ^ℓ) (W_{κ,ℓ+½}(2r/κ) + (−1)^ℓ S(ε, r) Γ(ℓ + 1 + κ)
M_{κ,ℓ+½}(2r/κ)/(2(2ℓ + 1)!))`. Junk at `ε = 0` and at the poles `ε = −1/n²`, `n > ℓ`, of
`Γ(ℓ + 1 − κ)`. -/
def coulombEnergyH (ε : ℝ) (ℓ : ℕ) (r : ℝ) : ℝ :=
  let κ := coulombKappa ε r
  (Gamma ((ℓ : ℂ) + 1 - κ) / ((π : ℂ) * κ ^ ℓ) *
      (Complex.whittakerW κ ((ℓ : ℂ) + 1 / 2) (2 * r / κ) +
        (-1 : ℂ) ^ ℓ * coulombStokesFactor ε r * Gamma ((ℓ : ℂ) + 1 + κ) /
            (2 * ((2 * ℓ + 1)! : ℂ)) *
          Complex.whittakerM κ ((ℓ : ℂ) + 1 / 2) (2 * r / κ))).re

/-- The normalized hydrogenic radial function `φ_{n,ℓ}(r)` (README 7.1; the second form of DLMF
33.14.14), used for `ℓ < n`. -/
def hydrogenRadial (n ℓ : ℕ) (r : ℝ) : ℝ :=
  (-1) ^ (ℓ + 1 + n) / (n : ℝ) ^ (ℓ + 2) *
      Real.sqrt (((n - ℓ - 1)! : ℝ) / ((n + ℓ)! : ℝ)) * (2 * r) ^ (ℓ + 1) * Real.exp (-r / n) *
    (Polynomial.laguerre (2 * (ℓ : ℝ) + 1) (n - ℓ - 1)).eval (2 * r / n)

/-! ## Sanity checks of the definitions -/

/-- Sanity check of the definition: `A^0_2(1) = 1/6` (README 3.1); with `+A^ℓ_{k−2}` in the
recurrence it would be `1/2`. -/
example : coulombSeriesCoeff 0 1 2 = 1 / 6 := by
  norm_num [coulombSeriesCoeff]

/-- Sanity check of the definition: `b_3 = −1/12` at `ℓ = 0`, `η = 1` (README 4.3); with
`b_{2ℓ+2} = 1` in place of `0` it would be `−1/3`. -/
example : coulombBesselCoeff 0 1 3 = -1 / 12 := by
  norm_num [coulombBesselCoeff]

/-- Sanity check of the definition: `α_2 = 3/4` at `ε = −1/4`, `ℓ = 0` (README 6.1), the
coefficient of `r³` in `2r e^{−r/2}(1 − r/2)`; with `α₁ = +α₀/(ℓ + 1)` it would be `−7/12`. -/
example : coulombEnergyCoeff (-1 / 4) 0 2 = 3 / 4 := by
  norm_num [coulombEnergyCoeff]

/-- Sanity check of the definition: `A(0.3, 2) = 2.86` (README 6.1); the product over `k < ℓ`
would give `1.3`. -/
example : coulombEnergyA (3 / 10) 2 = 143 / 50 := by
  norm_num [coulombEnergyA, Finset.prod_range_succ]

/-! ## Layer 1: the equation and its standard solutions -/

/-- **1.2** `coulombPhase` is QuantumFoundations §9.5's `σ_ℓ`: continuous, zero at `η = 0`, and
a phase of `Γ(ℓ + 1 + iη)` (DLMF 33.2.10). -/
theorem coulombPhase_spec (ℓ : ℕ) :
    Continuous (coulombPhase ℓ) ∧ coulombPhase ℓ 0 = 0 ∧
      ∀ η : ℝ, Gamma ((ℓ : ℂ) + 1 + (η : ℂ) * I) =
        ‖Gamma ((ℓ : ℂ) + 1 + (η : ℂ) * I)‖ * cexp ((coulombPhase ℓ η : ℂ) * I) := by
  sorry

/-- **1.2** The closed form of `C_ℓ(η)²` (DLMF 33.2.6), for `η ≠ 0`. -/
theorem coulombC_sq (ℓ : ℕ) {η : ℝ} (hη : η ≠ 0) :
    coulombC ℓ η ^ 2 =
      4 ^ ℓ * (2 * π * η / (Real.exp (2 * π * η) - 1)) *
          (∏ k ∈ Finset.Icc 1 ℓ, (η ^ 2 + (k : ℝ) ^ 2)) / ((2 * ℓ + 1)! : ℝ) ^ 2 := by
  sorry

/-- **1.2** The ratio `C_{ℓ+1}(η)/C_ℓ(η) = ((ℓ + 1)² + η²)^{1/2}/((ℓ + 1)(2ℓ + 3))`
(DLMF 33.13.2 with 33.4.1). -/
theorem coulombC_succ (ℓ : ℕ) (η : ℝ) :
    coulombC (ℓ + 1) η =
      Real.sqrt (((ℓ : ℝ) + 1) ^ 2 + η ^ 2) / (((ℓ : ℝ) + 1) * (2 * ℓ + 3)) * coulombC ℓ η := by
  sorry

/-- **1.3** The Whittaker forms of `F_ℓ` (DLMF 33.2.3), both signs, for `ρ > 0`. -/
theorem coulombF_eq_whittakerM (ℓ : ℕ) (η : ℝ) {ρ : ℝ} (hρ : 0 < ρ) :
    coulombF ℓ η ρ = coulombC ℓ η * (2 : ℂ) ^ (-((ℓ : ℤ) + 1)) * (-I) ^ (ℓ + 1) *
        Complex.whittakerM ((η : ℂ) * I) ((ℓ : ℂ) + 1 / 2) (2 * (ρ : ℂ) * I) ∧
      coulombF ℓ η ρ = coulombC ℓ η * (2 : ℂ) ^ (-((ℓ : ℤ) + 1)) * I ^ (ℓ + 1) *
        Complex.whittakerM (-((η : ℂ) * I)) ((ℓ : ℂ) + 1 / 2) (-2 * (ρ : ℂ) * I) := by
  sorry

/-- **1.3** The Whittaker form of `H⁺_ℓ` (DLMF 33.2.7, upper sign), for `ρ > 0`. -/
theorem coulombHPlus_eq_whittakerW (ℓ : ℕ) (η : ℝ) {ρ : ℝ} (hρ : 0 < ρ) :
    coulombHPlus ℓ η ρ = (-I) ^ ℓ * cexp ((π * η / 2 : ℝ) + (coulombPhase ℓ η : ℂ) * I) *
      Complex.whittakerW (-((η : ℂ) * I)) ((ℓ : ℂ) + 1 / 2) (-2 * (ρ : ℂ) * I) := by
  sorry

/-- **1.4** The cross-product `F_ℓ G_{ℓ+1} − F_{ℓ+1} G_ℓ = (ℓ + 1)/((ℓ + 1)² + η²)^{1/2}`
(DLMF 33.2.13 at `ℓ + 1`). -/
theorem coulombF_mul_coulombG_sub (ℓ : ℕ) (η : ℝ) {ρ : ℝ} (hρ : 0 < ρ) :
    coulombF ℓ η ρ * coulombG (ℓ + 1) η ρ - coulombF (ℓ + 1) η ρ * coulombG ℓ η ρ =
      (((ℓ : ℝ) + 1) / Real.sqrt (((ℓ : ℝ) + 1) ^ 2 + η ^ 2) : ℝ) := by
  sorry

/-! ## Layer 2: recurrences in `ℓ` -/

/-- **2.1** The three-term recurrence (DLMF 33.4.2 at `ℓ + 1`), with
`R_L = (1 + η²/L²)^{1/2}`, `S_L = L/ρ + η/L`, `T_L = S_L + S_{L+1}`, for each of `F`, `G`, `H^±`. -/
theorem coulomb_recurrence {X : ℕ → ℝ → ℝ → ℂ}
    (hX : X ∈ ({coulombF, coulombG, coulombHPlus, coulombHMinus} : Set (ℕ → ℝ → ℝ → ℂ)))
    (ℓ : ℕ) (η : ℝ) {ρ : ℝ} (hρ : 0 < ρ) :
    (Real.sqrt (1 + η ^ 2 / ((ℓ : ℝ) + 1) ^ 2) : ℂ) * X ℓ η ρ -
        ((((ℓ : ℝ) + 1) / ρ + η / ((ℓ : ℝ) + 1) + ((ℓ : ℝ) + 2) / ρ + η / ((ℓ : ℝ) + 2) : ℝ) : ℂ) *
          X (ℓ + 1) η ρ +
        (Real.sqrt (1 + η ^ 2 / ((ℓ : ℝ) + 2) ^ 2) : ℂ) * X (ℓ + 2) η ρ = 0 := by
  sorry

/-- **2.1** The ladder relations (DLMF 33.4.3–33.4.4 at `ℓ + 1`), for each of `F`, `G`, `H^±`:
`X′_{ℓ+1} = R_{ℓ+1} X_ℓ − S_{ℓ+1} X_{ℓ+1}` and `X′_ℓ = S_{ℓ+1} X_ℓ − R_{ℓ+1} X_{ℓ+1}`. -/
theorem hasDerivAt_coulomb_ladder {X : ℕ → ℝ → ℝ → ℂ}
    (hX : X ∈ ({coulombF, coulombG, coulombHPlus, coulombHMinus} : Set (ℕ → ℝ → ℝ → ℂ)))
    (ℓ : ℕ) (η : ℝ) {ρ : ℝ} (hρ : 0 < ρ) :
    HasDerivAt (X (ℓ + 1) η)
        ((Real.sqrt (1 + η ^ 2 / ((ℓ : ℝ) + 1) ^ 2) : ℂ) * X ℓ η ρ -
          ((((ℓ : ℝ) + 1) / ρ + η / ((ℓ : ℝ) + 1) : ℝ) : ℂ) * X (ℓ + 1) η ρ) ρ ∧
      HasDerivAt (X ℓ η)
        (((((ℓ : ℝ) + 1) / ρ + η / ((ℓ : ℝ) + 1) : ℝ) : ℂ) * X ℓ η ρ -
          (Real.sqrt (1 + η ^ 2 / ((ℓ : ℝ) + 1) ^ 2) : ℂ) * X (ℓ + 1) η ρ) ρ := by
  sorry

/-- **2.2** The continued fraction for `F′_ℓ/F_ℓ` (DLMF 33.8.1), for `ρ > 0` and `F_ℓ(η, ρ) ≠ 0`:
`F′_ℓ/F_ℓ = S_{ℓ+1} − R²_{ℓ+1}/(T_{ℓ+1} − R²_{ℓ+2}/(T_{ℓ+2} − ⋯))`, as the limit of the convergents
of the generalized continued fraction with head `S_{ℓ+1}`, partial numerators `−R²_{ℓ+n+1}` and
partial denominators `T_{ℓ+n+1}`. -/
theorem tendsto_convs_coulombF (ℓ : ℕ) (η : ℝ) {ρ : ℝ} (hρ : 0 < ρ)
    (hF : coulombF ℓ η ρ ≠ 0) :
    let R : ℝ → ℝ := fun L => Real.sqrt (1 + η ^ 2 / L ^ 2)
    let S : ℝ → ℝ := fun L => L / ρ + η / L
    let g : GenContFract ℝ := ⟨S ((ℓ : ℝ) + 1), Stream'.Seq.ofStream fun n : ℕ =>
      ⟨-R ((ℓ : ℝ) + n + 1) ^ 2, S ((ℓ : ℝ) + n + 1) + S ((ℓ : ℝ) + n + 2)⟩⟩
    Tendsto g.convs atTop
      (𝓝 (deriv (fun x => (coulombF ℓ η x).re) ρ / (coulombF ℓ η ρ).re)) := by
  sorry

/-! ## Layer 3: the origin, the power series and `η = 0` -/

/-- **3.1** The power series of `F_ℓ` (DLMF 33.6.1), convergent for every real `ρ`. -/
theorem hasSum_coulombF (ℓ : ℕ) (η ρ : ℝ) :
    HasSum (fun j : ℕ => ((coulombC ℓ η * coulombSeriesCoeff ℓ η j * ρ ^ (ℓ + 1 + j) : ℝ) : ℂ))
      (coulombF ℓ η ρ) := by
  sorry

/-- **3.2** The leading behaviour of `G_ℓ` at the origin, `G_ℓ ∼ ρ^{−ℓ}/((2ℓ + 1) C_ℓ(η))`
(DLMF 33.5.2). -/
theorem tendsto_pow_mul_coulombG (ℓ : ℕ) (η : ℝ) :
    Tendsto (fun ρ : ℝ => (ρ : ℂ) ^ ℓ * coulombG ℓ η ρ) (𝓝[>] 0)
      (𝓝 ((((2 * ℓ + 1 : ℝ) * coulombC ℓ η)⁻¹ : ℝ) : ℂ)) := by
  sorry

/-- **3.3** At `η = 0`, `F_ℓ(0, ρ) = ρ 𝗃_ℓ(ρ)` (DLMF 33.5.3). -/
theorem coulombF_zero_left (ℓ : ℕ) (ρ : ℝ) :
    coulombF ℓ 0 ρ = (ρ : ℂ) * Complex.sphericalBesselJ ℓ ρ := by
  sorry

/-- **3.3** At `η = 0`, `G_ℓ(0, ρ) = −ρ 𝗒_ℓ(ρ)` for `ρ > 0` (DLMF 33.5.3). -/
theorem coulombG_zero_left (ℓ : ℕ) {ρ : ℝ} (hρ : 0 < ρ) :
    coulombG ℓ 0 ρ = -(ρ : ℂ) * Complex.sphericalBesselY ℓ ρ := by
  sorry

/-! ## Layer 4: integrals and Bessel-function series -/

/-- **4.1** Euler's integral for `F_ℓ` (DLMF 33.7.1). -/
theorem coulombF_eq_integral (ℓ : ℕ) (η ρ : ℝ) :
    coulombF ℓ η ρ =
      (ρ : ℂ) ^ (ℓ + 1) * 2 ^ ℓ * cexp ((ρ : ℂ) * I - (π * η / 2 : ℝ)) /
          ‖Gamma ((ℓ : ℂ) + 1 + (η : ℂ) * I)‖ *
        ∫ t in (0 : ℝ)..1, cexp (-2 * (ρ : ℂ) * I * t) * (t : ℂ) ^ ((ℓ : ℂ) + (η : ℂ) * I) *
          ((1 - t : ℝ) : ℂ) ^ ((ℓ : ℂ) - (η : ℂ) * I) := by
  sorry

/-- **4.1** The Laplace integral for `H⁻_ℓ` (DLMF 33.7.2), for `ρ > 0`. -/
theorem coulombHMinus_eq_integral (ℓ : ℕ) (η : ℝ) {ρ : ℝ} (hρ : 0 < ρ) :
    coulombHMinus ℓ η ρ =
      cexp (-((ρ : ℂ) * I)) * (ρ : ℂ) ^ (-(ℓ : ℤ)) / (((2 * ℓ + 1)! : ℂ) * coulombC ℓ η) *
        ∫ t in Ioi (0 : ℝ), cexp (-(t : ℂ)) * (t : ℂ) ^ ((ℓ : ℂ) - (η : ℂ) * I) *
          ((t : ℂ) + 2 * (ρ : ℂ) * I) ^ ((ℓ : ℂ) + (η : ℂ) * I) := by
  sorry

/-- **4.2** The expansion of `F_ℓ` in spherical Bessel functions (DLMF 33.9.1), for every real
`ρ`: `F_ℓ(η, ρ) = ρ ∑_k a_k 𝗃_{ℓ+k}(ρ)`. -/
theorem hasSum_coulombF_sphericalBesselJ (ℓ : ℕ) (η ρ : ℝ) :
    HasSum (fun k : ℕ =>
        (ρ : ℂ) * (coulombSphericalCoeff ℓ η k : ℂ) * Complex.sphericalBesselJ (ℓ + k) ρ)
      (coulombF ℓ η ρ) := by
  sorry

/-- **4.3** The expansion of `F_ℓ` in `I_k(2√t)`, `t = 2ηρ`, for `η > 0` (DLMF 33.9.3). -/
theorem hasSum_coulombF_besselI (ℓ : ℕ) {η ρ : ℝ} (hη : 0 < η) (hρ : 0 < ρ) :
    HasSum (fun j : ℕ =>
        ((coulombC ℓ η * (2 * ℓ + 1)! / (2 * η) ^ (2 * ℓ + 1) * ρ ^ (-(ℓ : ℤ)) *
            coulombBesselCoeff ℓ η j * Real.sqrt (2 * η * ρ) ^ (2 * ℓ + 1 + j) : ℝ) : ℂ) *
          Complex.besselI (2 * ℓ + 1 + j : ℕ) (2 * Real.sqrt (2 * η * ρ)))
      (coulombF ℓ η ρ) := by
  sorry

/-- **4.3** The expansion of `F_ℓ` in `J_k(2√t)`, `t = 2|η|ρ`, for `η < 0` (DLMF 33.9.4 in
corrected form: the `k`-th term carries `(−1)^{k+1}`, which is `(−1)^j` for `k = 2ℓ + 1 + j`). -/
theorem hasSum_coulombF_besselJ (ℓ : ℕ) {η ρ : ℝ} (hη : η < 0) (hρ : 0 < ρ) :
    HasSum (fun j : ℕ =>
        (((-1) ^ j * coulombC ℓ η * (2 * ℓ + 1)! / (2 * |η|) ^ (2 * ℓ + 1) * ρ ^ (-(ℓ : ℤ)) *
            coulombBesselCoeff ℓ η j * Real.sqrt (2 * |η| * ρ) ^ (2 * ℓ + 1 + j) : ℝ) : ℂ) *
          Complex.besselJ (2 * ℓ + 1 + j : ℕ) (2 * Real.sqrt (2 * |η| * ρ)))
      (coulombF ℓ η ρ) := by
  sorry

/-! ## Layer 5: large `ρ` and large `|η|` -/

/-- **5.1** The asymptotic expansion of `H⁺_ℓ` for large `ρ` (DLMF 33.11.1, upper sign): for every
`N`, `H⁺_ℓ − e^{iθ_ℓ} ∑_{k<N} (a)_k (b)_k/(k! (2iρ)^k) = O(ρ^{−N})` as `ρ → ∞`, with
`a = ℓ + 1 + iη`, `b = −ℓ + iη`. -/
theorem coulombHPlus_sub_sum_isBigO (ℓ : ℕ) (η : ℝ) (N : ℕ) :
    (fun ρ : ℝ => coulombHPlus ℓ η ρ - cexp ((coulombTheta ℓ η ρ : ℂ) * I) *
        ∑ k ∈ Finset.range N, (ascPochhammer ℂ k).eval ((ℓ : ℂ) + 1 + (η : ℂ) * I) *
          (ascPochhammer ℂ k).eval (-(ℓ : ℂ) + (η : ℂ) * I) /
            ((k ! : ℂ) * (2 * (ρ : ℂ) * I) ^ k)) =O[atTop]
      fun ρ : ℝ => ρ ^ (-(N : ℤ)) := by
  sorry

/-- **5.2** The phase shift for large positive `η`: `σ₀(η) = η(ln η − 1) + π/4 + o(1)`
(DLMF 33.10.6). -/
theorem tendsto_coulombPhase_zero_atTop :
    Tendsto (fun η : ℝ => coulombPhase 0 η - (η * (Real.log η - 1) + π / 4)) atTop (𝓝 0) := by
  sorry

/-! ## Layer 6: the functions of `(ε, r)` -/

/-- **6.1** The Kummer form of `f` (DLMF 33.14.5), for `ε ≠ 0`, with `κ` of DLMF 33.14.6. -/
theorem coulombEnergyF_eq_kummer {ε : ℝ} (hε : ε ≠ 0) (ℓ : ℕ) (r : ℝ) :
    (coulombEnergyF ε ℓ r : ℂ) =
      (2 * (r : ℂ)) ^ (ℓ + 1) * cexp (-(r : ℂ) / coulombKappa ε r) *
        𝐌((ℓ : ℂ) + 1 - coulombKappa ε r, 2 * (ℓ : ℂ) + 2) (2 * (r : ℂ) / coulombKappa ε r) := by
  sorry

/-- **6.1** `f` solves the Coulomb equation in the variables `(ε, r)` (DLMF 33.14.1), for
`r ≠ 0`. -/
theorem coulombEnergyF_equation (ε : ℝ) (ℓ : ℕ) {r : ℝ} (hr : r ≠ 0) :
    deriv (deriv (coulombEnergyF ε ℓ)) r +
        (ε + 2 / r - (ℓ : ℝ) * (ℓ + 1) / r ^ 2) * coulombEnergyF ε ℓ r = 0 := by
  sorry

/-- **6.1** The Gamma form of `A(ε, ℓ)` (DLMF 33.14.12), for `ε ≠ 0`, with `κ` of DLMF 33.14.6 at
`r > 0`. -/
theorem coulombEnergyA_eq_gamma {ε : ℝ} (hε : ε ≠ 0) (ℓ : ℕ) :
    (coulombEnergyA ε ℓ : ℂ) =
      Gamma (1 + ℓ + coulombKappa ε 1) / Gamma (coulombKappa ε 1 - ℓ) *
        coulombKappa ε 1 ^ (-(2 * (ℓ : ℤ) + 1)) := by
  sorry

/-- **6.2** The Wronskian `𝒲{h, f} = 2/π` (DLMF 33.14.16), for `ε ≠ 0` and `r ≠ 0` off the
junk values of `h`: not `r > 0` with `ε = −1/n²`, `n > ℓ`. -/
theorem wronskian_coulombEnergyH_coulombEnergyF {ε : ℝ} (hε : ε ≠ 0) (ℓ : ℕ) {r : ℝ}
    (hr : r ≠ 0) (hεn : ∀ n : ℕ, ℓ < n → 0 < r → ε ≠ -1 / (n : ℝ) ^ 2) :
    coulombEnergyH ε ℓ r * deriv (coulombEnergyF ε ℓ) r -
        deriv (coulombEnergyH ε ℓ) r * coulombEnergyF ε ℓ r = 2 / π := by
  sorry

/-- **6.3** `F_ℓ` through `f` (DLMF 33.16.1), for `η ≠ 0` and every `ρ`. -/
theorem coulombF_eq_coulombEnergyF (ℓ : ℕ) {η : ℝ} (hη : η ≠ 0) (ρ : ℝ) :
    coulombF ℓ η ρ =
      (((2 * ℓ + 1)! * coulombC ℓ η / (-2 * η) ^ (ℓ + 1) *
        coulombEnergyF (1 / η ^ 2) ℓ (-η * ρ) : ℝ) : ℂ) := by
  sorry

/-- **6.3** `G_ℓ` through `h` (DLMF 33.16.2), for `η ≠ 0` and `ρ > 0`. -/
theorem coulombG_eq_coulombEnergyH (ℓ : ℕ) {η : ℝ} (hη : η ≠ 0) {ρ : ℝ} (hρ : 0 < ρ) :
    coulombG ℓ η ρ =
      ((π * (-2 * η) ^ ℓ / ((2 * ℓ + 1)! * coulombC ℓ η) *
        coulombEnergyH (1 / η ^ 2) ℓ (-η * ρ) : ℝ) : ℂ) := by
  sorry

/-- **6.3** `s` and `c` through `F_ℓ` and `G_ℓ` for `ε > 0`, `r < 0` (DLMF 33.16.15 in corrected
form): with `τ = ε^{1/2}` and `B = A/(1 − e^{−2π/τ})`,
`s = (−1)^{ℓ+1} e^{π/τ} (πτ)^{−1/2} F_ℓ(1/τ, −τr)` and
`c = (−1)^ℓ e^{−π/τ} (πτ)^{−1/2} G_ℓ(1/τ, −τr)`. -/
theorem coulombEnergyS_coulombEnergyC_of_neg {ε : ℝ} (hε : 0 < ε) (ℓ : ℕ) {r : ℝ} (hr : r < 0) :
    let τ := Real.sqrt ε
    let B := coulombEnergyA ε ℓ / (1 - Real.exp (-(2 * π / τ)))
    ((Real.sqrt (B / 2) * coulombEnergyF ε ℓ r : ℝ) : ℂ) =
        ((-1) ^ (ℓ + 1) * Real.exp (π / τ) / Real.sqrt (π * τ) : ℝ) * coulombF ℓ (1 / τ) (-τ * r) ∧
      (((Real.sqrt (2 * B))⁻¹ * coulombEnergyH ε ℓ r : ℝ) : ℂ) =
        ((-1) ^ ℓ * Real.exp (-(π / τ)) / Real.sqrt (π * τ) : ℝ) * coulombG ℓ (1 / τ) (-τ * r) := by
  sorry

/-- **6.3** `s` through Whittaker functions for `ε < 0`, `r > 0` and `A(ε, ℓ) > 0` (DLMF 33.16.17
in corrected form, prefactor `(−1)^ℓ/(2ν)^{1/2}`): with `ν = (−ε)^{−1/2}`,
`K = (ν² Γ(ν + ℓ + 1) Γ(ν − ℓ))^{−1/2}`, `ζ = W_{ν,ℓ+½}(2r/ν)` and
`ξ = Re(e^{iπν} W_{−ν,ℓ+½}(e^{iπ} 2r/ν))`,
`s = (−1)^ℓ (2ν)^{−1/2} (sin(πν) ξ/(πK) − cos(πν) ν² K ζ)`. -/
theorem coulombEnergyS_eq_whittaker {ε : ℝ} (hε : ε < 0) (ℓ : ℕ)
    (hA : 0 < coulombEnergyA ε ℓ) {r : ℝ} (hr : 0 < r) :
    let ν := (Real.sqrt (-ε))⁻¹
    let K := (Real.sqrt (ν ^ 2 * Real.Gamma (ν + ℓ + 1) * Real.Gamma (ν - ℓ)))⁻¹
    let ζ := (Complex.whittakerW ν ((ℓ : ℂ) + 1 / 2) (2 * r / ν)).re
    let ξ := (cexp (π * ν * I) * Complex.whittakerWLog (-ν) ((ℓ : ℂ) + 1 / 2)
      (Complex.log (2 * r / ν) + π * I)).re
    Real.sqrt (coulombEnergyA ε ℓ / 2) * coulombEnergyF ε ℓ r =
      (-1) ^ ℓ / Real.sqrt (2 * ν) *
        (Real.sin (π * ν) / (π * K) * ξ - Real.cos (π * ν) * ν ^ 2 * K * ζ) := by
  sorry

/-- **6.4** The three-term recurrence of `f` in `ℓ` (DLMF 33.17.1 at `ℓ + 1`), for every `r`. -/
theorem coulombEnergyF_recurrence (ε : ℝ) (ℓ : ℕ) (r : ℝ) :
    ((ℓ : ℝ) + 2) * r * coulombEnergyF ε ℓ r -
        (2 * ℓ + 3) * (((ℓ : ℝ) + 1) * (ℓ + 2) - r) * coulombEnergyF ε (ℓ + 1) r +
      ((ℓ : ℝ) + 1) * (1 + ((ℓ : ℝ) + 2) ^ 2 * ε) * r * coulombEnergyF ε (ℓ + 2) r = 0 := by
  sorry

/-- **6.4** At `ε = 0`, `f(0, ℓ; r) = (2r)^{1/2} J_{2ℓ+1}((8r)^{1/2})` for `r > 0`
(DLMF 33.20.1). -/
theorem coulombEnergyF_zero_left (ℓ : ℕ) {r : ℝ} (hr : 0 < r) :
    (coulombEnergyF 0 ℓ r : ℂ) =
      Real.sqrt (2 * r) * Complex.besselJ (2 * ℓ + 1 : ℕ) (Real.sqrt (8 * r)) := by
  sorry

/-! ## Layer 7: bound states -/

/-- **7.1** The hydrogenic radial functions as values of `s` at `ε = −1/n²` (DLMF 33.14.14):
`φ_{n,ℓ} = (−1)^{ℓ+1+n} (2/n³)^{1/2} (A/2)^{1/2} f(−1/n², ℓ; ·)`, for `ℓ < n`. -/
theorem hydrogenRadial_eq (n ℓ : ℕ) (hℓ : ℓ < n) (r : ℝ) :
    hydrogenRadial n ℓ r =
      (-1) ^ (ℓ + 1 + n) * Real.sqrt (2 / (n : ℝ) ^ 3) *
        Real.sqrt (coulombEnergyA (-1 / (n : ℝ) ^ 2) ℓ / 2) *
          coulombEnergyF (-1 / (n : ℝ) ^ 2) ℓ r := by
  sorry

/-- **7.2** Orthonormality of `φ_{n,ℓ}` for fixed `ℓ` (DLMF 33.14.15). -/
theorem integral_hydrogenRadial_mul (ℓ : ℕ) {m n : ℕ} (hm : ℓ < m) (hn : ℓ < n) :
    ∫ r in Ioi (0 : ℝ), hydrogenRadial m ℓ r * hydrogenRadial n ℓ r = if m = n then 1 else 0 := by
  sorry

/-- **7.1** The bound-state condition: `f(ε, ℓ; ·)` is square integrable on `(0, ∞)` exactly when
`ε = −1/n²` with `n > ℓ`. -/
theorem memLp_coulombEnergyF_iff (ε : ℝ) (ℓ : ℕ) :
    MemLp (coulombEnergyF ε ℓ) 2 (volume.restrict (Ioi 0)) ↔
      ∃ n : ℕ, ℓ < n ∧ ε = -1 / (n : ℝ) ^ 2 := by
  sorry

/-! ## Library declarations consumed -/

#check @Complex.regularizedHGFun
#check @Complex.besselJ
#check @Complex.Gamma
#check @Complex.digamma
#check @Complex.Gamma_mul_Gamma_one_sub
#check @Complex.Gamma_conj
#check @Complex.GammaSeq
#check @Real.eulerMascheroniConstant
#check @Real.arctan
#check @Complex.cpow
#check @Complex.slitPlane
#check @intervalIntegral
#check @MeasureTheory.MemLp
#check @GenContFract
#check @GenContFract.convs
#check @Stream'.Seq.ofStream
#check @Nat.doubleFactorial
#check @Asymptotics.IsBigO
#check @ascPochhammer

end TauCetiRoadmap.SpecialFunctionsCoulomb
