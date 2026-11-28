import Mathlib

/-!
# The arithmetic formula for Li's coefficients: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib, each with `sorry`, together with the definitions
they need; every definition has a real body. All three headline theorems of the README are
statable at the pins and are stated here: the arithmetic formula for `λₙ` (2.1), the arithmetic
limit for the coefficients `η_j` with a remainder uniform in `j` (3.1), and Yoshida's local
positivity in Bombieri's quantitative form (4.1).

The definitions `zetaZeroMult`, `liCoeff` and `weilForm` are copied verbatim from
WeilPositivityAndLiCriterion (1.1, 3.1 and 5.1), only to make the statements elaborate; their
laws belong to that roadmap and are not restated. The one new definition is `zetaLogDerivCoeff`,
the coefficients `η_j` of `−ζ'/ζ(1 + t) = 1/t + ∑ η_j t^j`, read off the entire function
`riemannZeta₁`, which is `(s − 1) ζ(s)` completed at `1`.
-/

noncomputable section

open Complex Filter Set Topology
open scoped ContDiff ComplexConjugate

namespace TauCetiRoadmap.LiCoefficientsArithmeticFormula

/-! ## Definitions copied from WeilPositivityAndLiCriterion -/

/-- Conventions: the multiplicity of `ρ` as a zero of the completed zeta function, the positive
part of the divisor of `completedRiemannZeta` on `ℂ` at `ρ` (copied verbatim from
WeilPositivityAndLiCriterion 1.1). -/
def zetaZeroMult (ρ : ℂ) : ℕ :=
  (MeromorphicOn.divisor completedRiemannZeta univ ρ).toNat

/-- Conventions: the `n`-th Li coefficient of `ζ` in symmetric form,
`λₙ = ½ ∑_ρ m_ρ Re [(1 - (1 - 1/ρ)^n) + (1 - (1 - 1/(1 - ρ))^n)]` (copied verbatim from
WeilPositivityAndLiCriterion 3.1). -/
def liCoeff (n : ℕ) : ℝ :=
  (1 / 2 : ℝ) * ∑' ρ : ℂ, (zetaZeroMult ρ : ℝ) *
    ((1 - (1 - 1 / ρ) ^ n) + (1 - (1 - 1 / (1 - ρ)) ^ n)).re

/-- Conventions: Weil's form on the zero side, `W(g, h) = ∑_ρ m_ρ ĝ(ρ) conj (ĥ(1 - conj ρ))` with
`ĝ = mellin g` (copied verbatim from WeilPositivityAndLiCriterion 5.1). -/
def weilForm (g h : ℝ → ℂ) : ℂ :=
  ∑' ρ : ℂ, (zetaZeroMult ρ : ℂ) * (mellin g ρ * conj (mellin h (1 - conj ρ)))

/-! ## Layer 1: the Laurent coefficients of the logarithmic derivative of ζ at 1 -/

/-- 1.1 The coefficients `η_j` of `−ζ'/ζ(1 + t) = 1/t + ∑_{j ≥ 0} η_j t^j` (Lagarias (4.12)).
Since `ζ = ζ₁/(s - 1)` with `ζ₁ = riemannZeta₁` entire and `ζ₁(1) = 1`, near `1` one has
`−ζ'/ζ = 1/(s - 1) - ζ₁'/ζ₁`, so `η_j = −(ζ₁'/ζ₁)^{(j)}(1)/j!`. `η₀ = −γ`. -/
def zetaLogDerivCoeff (j : ℕ) : ℂ :=
  -iteratedDeriv j (logDeriv riemannZeta₁) 1 / (j.factorial : ℂ)

/-- 1.1 The sign convention: `η₀ = −γ`, where the Stieltjes constant `γ₀` is `+γ`. -/
example : zetaLogDerivCoeff 0 = -(Real.eulerMascheroniConstant : ℂ) := by
  simp [zetaLogDerivCoeff, logDeriv_apply]

/-! ## Layer 2: the arithmetic formula -/

/-- 2.1 The Bombieri–Lagarias arithmetic formula: for `n ≥ 1`,
`λₙ = 1 − (n/2)(γ + log 4π) + ∑_{j=2}^{n} (−1)^j C(n, j) (1 − 2^{−j}) ζ(j)`
`− ∑_{j=1}^{n} C(n, j) η_{j−1}`.
At `n = 0` the left side is `0` and the right side `1`. -/
theorem liCoeff_eq_arithmetic (n : ℕ) (hn : 1 ≤ n) :
    (liCoeff n : ℂ) =
      1 - (n : ℂ) / 2 * ((Real.eulerMascheroniConstant + Real.log (4 * Real.pi) : ℝ) : ℂ) +
        ∑ j ∈ Finset.Icc 2 n, (-1) ^ j * (n.choose j : ℂ) * (1 - 1 / 2 ^ j) * riemannZeta j -
        ∑ j ∈ Finset.range n, (n.choose (j + 1) : ℂ) * zetaLogDerivCoeff j := by
  sorry

/-! ## Layer 3: the arithmetic limit for the coefficients -/

/-- 3.1 The arithmetic limit for `η_j`, with a de la Vallée Poussin remainder whose exponent is
uniform in `j`: there is `c > 0` such that for every `j`,
`∑_{m ≤ x} Λ(m) (log m)^j / m − (log x)^{j+1}/(j + 1) = (−1)^j j! η_j + O_j(exp(−c √(log x)))`. -/
theorem vonMangoldt_logPow_sum_sub_isBigO :
    ∃ c : ℝ, 0 < c ∧ ∀ j : ℕ,
      (fun x : ℝ ↦ (((∑ m ∈ Finset.Icc 1 ⌊x⌋₊,
            ArithmeticFunction.vonMangoldt m * Real.log m ^ j / m -
            Real.log x ^ (j + 1) / (j + 1) : ℝ)) : ℂ) -
          (-1) ^ j * (j.factorial : ℂ) * zetaLogDerivCoeff j)
        =O[atTop] fun x : ℝ ↦ Real.exp (-c * Real.sqrt (Real.log x)) := by
  sorry

/-! ## Layer 4: Yoshida's local positivity -/

/-- 4.1 Yoshida's local positivity in Bombieri's quantitative form (Bombieri 2000, Theorem 12):
there is a constant `C` such that for `0 < a < log 2`, `b > 0` and every smooth `g` supported in
`[b, b eᵃ]`, `Re W(g, g) ≥ (log(1/a) − log log(1/a) − C) ∫ |g|²`. -/
theorem weilForm_re_ge_of_tsupport_subset_Icc :
    ∃ C : ℝ, ∀ a b : ℝ, 0 < a → a < Real.log 2 → 0 < b →
      ∀ g : ℝ → ℂ, ContDiff ℝ ∞ g → tsupport g ⊆ Icc b (b * Real.exp a) →
        (Real.log (1 / a) - Real.log (Real.log (1 / a)) - C) * ∫ t : ℝ, ‖g t‖ ^ 2 ≤
          (weilForm g g).re := by
  sorry

end TauCetiRoadmap.LiCoefficientsArithmeticFormula
