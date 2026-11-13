module

public import Mathlib
public import TauCeti.Analysis.SpecialFunctions.EllipticIntegral.Legendre
public import TauCeti.Analysis.SpecialFunctions.EllipticIntegral.Carlson.Basic

/-!
# Theta functions: target signatures

This file states the headline theorems of the roadmap against the pinned Mathlib and Tau Ceti,
one or more per layer. The definitive document is `README.md`, which states every target; this
file states a selection of them, and discharging it finishes neither a layer nor the roadmap.

The definitions below are roadmap-local copies of the definitions `README.md` pins. The four
theta functions, the modulus, the modular function `λ` and the basis of theta functions of order
`N` live in `TauCeti`; here they live in this file's namespace. They are stated with their
intended bodies so that the conventions are checked by the compiler: Mathlib's `jacobiTheta₂` with `z ↦ z / π`,
the multiplier `M(z|τ) = e^{iz + iπτ/4}`, and `q^α = e^{iαπτ}` written out. Theorems are stated
with `sorry`.

The complex-`τ` form of `K` (README 5.3) uses the principal Gauss function of
SpecialFunctionsHypergeometric, which the pinned Tau Ceti does not have; its rectangular case is
stated instead, with Mathlib's `ordinaryHypergeometric`.
-/

@[expose] public section

noncomputable section

namespace TauCetiRoadmap.SpecialFunctionsTheta

open Complex Filter Topology Set MeasureTheory
open scoped Real ComplexConjugate

/-! ## Layer 1: definitions and basic properties -/

/-- The multiplier `M(z|τ) = e^{iz + iπτ/4}` of DLMF 20.2.10. -/
def thetaMultiplier (z τ : ℂ) : ℂ := cexp (I * z + π * I * τ / 4)

/-- `θ₃(z|τ) = ∑_{n∈ℤ} q^{n²} e^{2inz}` (DLMF 20.2.3), through Mathlib's `jacobiTheta₂`. -/
def jacobiThetaThree (z τ : ℂ) : ℂ := jacobiTheta₂ (z / π) τ

/-- `θ₄(z|τ) = θ₃(z + π/2|τ)` (DLMF 20.2.14). -/
def jacobiThetaFour (z τ : ℂ) : ℂ := jacobiTheta₂ (z / π + 1 / 2) τ

/-- `θ₂(z|τ) = M(z|τ) θ₃(z + πτ/2|τ)` (DLMF 20.2.12). -/
def jacobiThetaTwo (z τ : ℂ) : ℂ := thetaMultiplier z τ * jacobiTheta₂ (z / π + τ / 2) τ

/-- `θ₁(z|τ) = −i M(z|τ) θ₃(z + π/2 + πτ/2|τ)` (DLMF 20.2.11). -/
def jacobiThetaOne (z τ : ℂ) : ℂ :=
  -I * thetaMultiplier z τ * jacobiTheta₂ (z / π + 1 / 2 + τ / 2) τ

/-- DLMF 20.2.1: `θ₁(z|τ) = 2 ∑_{n≥0} (−1)ⁿ q^{(n+½)²} sin((2n + 1)z)`. -/
theorem hasSum_jacobiThetaOne (z : ℂ) {τ : ℂ} (hτ : 0 < τ.im) :
    HasSum (fun n : ℕ ↦ 2 * (-1) ^ n * cexp (π * I * τ * ((n : ℂ) + 1 / 2) ^ 2) *
      Complex.sin ((2 * n + 1) * z)) (jacobiThetaOne z τ) := by
  sorry

/-- DLMF 20.2.3: `θ₃(z|τ) = 1 + 2 ∑_{n≥1} q^{n²} cos(2nz)`. -/
theorem hasSum_jacobiThetaThree (z : ℂ) {τ : ℂ} (hτ : 0 < τ.im) :
    HasSum (fun n : ℕ ↦ 2 * cexp (π * I * τ * ((n : ℂ) + 1) ^ 2) *
      Complex.cos (2 * ((n : ℂ) + 1) * z)) (jacobiThetaThree z τ - 1) := by
  sorry

/-- DLMF 20.2.6 for all `m, n : ℤ` and all `τ`. -/
theorem jacobiThetaOne_add_lattice (z τ : ℂ) (m n : ℤ) :
    jacobiThetaOne (z + (m + n * τ) * π) τ =
      (-1) ^ (m + n) * cexp (-(π * I * τ * n ^ 2)) * cexp (-(2 * I * n * z)) *
        jacobiThetaOne z τ := by
  sorry

/-- DLMF 20.7.28: `θ₃(z|τ + 1) = θ₄(z|τ)`, for all `τ`. -/
theorem jacobiThetaThree_add_one (z τ : ℂ) : jacobiThetaThree z (τ + 1) = jacobiThetaFour z τ := by
  sorry

/-- DLMF 20.7.26: `θ₁(z|τ + 1) = e^{iπ/4} θ₁(z|τ)`, for all `τ`. -/
theorem jacobiThetaOne_add_one (z τ : ℂ) :
    jacobiThetaOne z (τ + 1) = cexp (π * I / 4) * jacobiThetaOne z τ := by
  sorry

/-- Conjugation: `θ₁(z̄ | −τ̄) = conj θ₁(z|τ)`. -/
theorem jacobiThetaOne_conj (z τ : ℂ) :
    jacobiThetaOne (conj z) (-conj τ) = conj (jacobiThetaOne z τ) := by
  sorry

/-- DLMF 20.13.1, the heat equation: `∂θ₁/∂τ = −(iπ/4) ∂²θ₁/∂z²`. -/
theorem hasDerivAt_jacobiThetaOne_snd (z : ℂ) {τ : ℂ} (hτ : 0 < τ.im) :
    HasDerivAt (fun σ ↦ jacobiThetaOne z σ)
      (-(I * π / 4) * deriv^[2] (fun w ↦ jacobiThetaOne w τ) z) τ := by
  sorry

/-! ### Theta functions of order `N` with characteristics (README 1.5) -/

/-- The basis `Θ^{a,b}_{N,r}(z|τ) = ∑_{n∈ℤ} (−1)^{bn} q^{(nN+s)²/N} e^{2i(nN+s)z}`, `s = r + a/2`,
of the theta functions of order `N` with characteristic `(a, b)`. -/
def thetaBasis (N r a b : ℕ) (z τ : ℂ) : ℂ :=
  cexp (π * I * τ * ((r : ℂ) + a / 2) ^ 2 / N + 2 * I * ((r : ℂ) + a / 2) * z) *
    jacobiTheta₂ (N * z / π + ((r : ℂ) + a / 2) * τ + b / 2) (N * τ)

/-- README 1.5: an entire function with the quasi-periodicity of order `N` and characteristic
`(a, b)` is a combination of the `Θ^{a,b}_{N,r}`, `r < N`. -/
theorem exists_eq_sum_thetaBasis {N a b : ℕ} (hN : 1 ≤ N) (ha : a ≤ 1) (hb : b ≤ 1) {τ : ℂ}
    (hτ : 0 < τ.im) {f : ℂ → ℂ} (hf : Differentiable ℂ f)
    (h₁ : ∀ z, f (z + π) = (-1) ^ a * f z)
    (h₂ : ∀ z, f (z + π * τ) =
      (-1) ^ b * cexp (-(π * I * τ * N)) * cexp (-(2 * I * N * z)) * f z) :
    ∃ c : Fin N → ℂ, ∀ z, f z = ∑ r : Fin N, c r * thetaBasis N r a b z τ := by
  sorry

/-- The characteristic of `θ₁`: `i θ₁ = Θ^{1,1}_{1,0}`. -/
theorem I_mul_jacobiThetaOne_eq_thetaBasis (z τ : ℂ) :
    I * jacobiThetaOne z τ = thetaBasis 1 0 1 1 z τ := by
  sorry

/-! ## Layer 2: products, zeros and values at `z = 0` -/

/-- DLMF 20.5.9 in its product form: with `p = e^{iπz}`,
`θ₃(πz|τ) = ∏_{n≥1}(1 − q^{2n})(1 + q^{2n−1}p²)(1 + q^{2n−1}p^{−2})`. Proved in README 2.1 from
the theta functions of order 1. -/
theorem hasProd_jacobiThetaThree (z : ℂ) {τ : ℂ} (hτ : 0 < τ.im) :
    HasProd (fun n : ℕ ↦ (1 - cexp (π * I * τ) ^ (2 * n + 2)) *
      (1 + cexp (π * I * τ) ^ (2 * n + 1) * cexp (2 * π * I * z)) *
      (1 + cexp (π * I * τ) ^ (2 * n + 1) * cexp (-(2 * π * I * z))))
      (jacobiThetaThree (π * z) τ) := by
  sorry

/-- The zeros of `θ₁` (DLMF §20.2(iv)): exactly the lattice points `(m + nτ)π`. -/
theorem jacobiThetaOne_eq_zero_iff (z : ℂ) {τ : ℂ} (hτ : 0 < τ.im) :
    jacobiThetaOne z τ = 0 ↔ ∃ m n : ℤ, z = (m + n * τ) * π := by
  sorry

/-- DLMF 20.4.6, Jacobi's derivative formula: `θ₁′(0|τ) = θ₂(0|τ) θ₃(0|τ) θ₄(0|τ)`. -/
theorem deriv_jacobiThetaOne_zero {τ : ℂ} (hτ : 0 < τ.im) :
    deriv (fun z ↦ jacobiThetaOne z τ) 0 =
      jacobiThetaTwo 0 τ * jacobiThetaThree 0 τ * jacobiThetaFour 0 τ := by
  sorry

/-- `θ₁′(0|τ) = 2η(τ)³`, with Mathlib's Dedekind `η`. -/
theorem deriv_jacobiThetaOne_zero_eq_eta {τ : ℂ} (hτ : 0 < τ.im) :
    deriv (fun z ↦ jacobiThetaOne z τ) 0 = 2 * ModularForm.eta τ ^ 3 := by
  sorry

/-! ## Layer 3: logarithmic derivatives, double products and power series -/

/-- DLMF 20.5.17 with the paired cutoffs of README 3.2: the inner limits over `−M ≤ m ≤ M`
exist, and `θ₄(0|τ) ∏_{n=1−N}^{N} L(n) → θ₄(z|τ)`. The symmetric outer range `−N ≤ n ≤ N`
would give `e^{iz} θ₄(z|τ)`. -/
theorem tendsto_jacobiThetaFour_doubleProd (z : ℂ) {τ : ℂ} (hτ : 0 < τ.im) :
    ∃ L : ℤ → ℂ,
      (∀ n : ℤ, Tendsto (fun M : ℕ ↦ ∏ m ∈ Finset.Icc (-(M : ℤ)) M,
          (1 + z / ((m + (n - 1 / 2) * τ) * π))) atTop (𝓝 (L n))) ∧
      Tendsto (fun N : ℕ ↦ jacobiThetaFour 0 τ * ∏ n ∈ Finset.Icc (1 - (N : ℤ)) N, L n) atTop
        (𝓝 (jacobiThetaFour z τ)) := by
  sorry

/-- DLMF 20.4.8: `θ₁‴(0)/θ₁′(0) = −1 + 24 ∑_{n≥1} q^{2n}/(1 − q^{2n})²`. -/
theorem hasSum_iteratedDeriv_three_jacobiThetaOne {τ : ℂ} (hτ : 0 < τ.im) :
    HasSum (fun n : ℕ ↦ 24 * cexp (π * I * τ) ^ (2 * n + 2) /
        (1 - cexp (π * I * τ) ^ (2 * n + 2)) ^ 2)
      (iteratedDeriv 3 (fun z ↦ jacobiThetaOne z τ) 0 /
        deriv (fun z ↦ jacobiThetaOne z τ) 0 + 1) := by
  sorry

/-! ## Layer 4: identities -/

/-- DLMF 20.7.5, Jacobi's quartic identity: `θ₃⁴(0|τ) = θ₂⁴(0|τ) + θ₄⁴(0|τ)`. -/
theorem jacobiThetaThree_zero_pow_four {τ : ℂ} (hτ : 0 < τ.im) :
    jacobiThetaThree 0 τ ^ 4 = jacobiThetaTwo 0 τ ^ 4 + jacobiThetaFour 0 τ ^ 4 := by
  sorry

/-- DLMF 20.7.30: `(−iτ)^{1/2} θ₁(z|τ) = −i e^{iτ′z²/π} θ₁(zτ′|τ′)`, `τ′ = −1/τ`. -/
theorem jacobiThetaOne_neg_inv (z : ℂ) {τ : ℂ} (hτ : 0 < τ.im) :
    (-I * τ) ^ (1 / 2 : ℂ) * jacobiThetaOne z τ =
      -I * cexp (I * (-1 / τ) * z ^ 2 / π) * jacobiThetaOne (z * (-1 / τ)) (-1 / τ) := by
  sorry

/-- DLMF 20.7.34, corrected: `θ₁(z|2τ)θ₃(z|2τ)/θ₁(z|τ + ½) = e^{−iπ/8} η(τ)η(4τ)/η(2τ)`, where the
denominator does not vanish. -/
theorem jacobiThetaOne_mul_jacobiThetaThree_div_eq_eta {z τ : ℂ} (hτ : 0 < τ.im)
    (hz : jacobiThetaOne z (τ + 1 / 2) ≠ 0) :
    jacobiThetaOne z (2 * τ) * jacobiThetaThree z (2 * τ) / jacobiThetaOne z (τ + 1 / 2) =
      cexp (-(π * I / 8)) *
        (ModularForm.eta τ * ModularForm.eta (4 * τ) / ModularForm.eta (2 * τ)) := by
  sorry

/-! ## Layer 5: the modular function and the elliptic integrals -/

/-- The modulus `k = θ₂²(0|τ)/θ₃²(0|τ)` (DLMF 20.9.1). -/
def thetaModulus (τ : ℂ) : ℂ := jacobiThetaTwo 0 τ ^ 2 / jacobiThetaThree 0 τ ^ 2

/-- The complementary modulus `k′ = θ₄²(0|τ)/θ₃²(0|τ)`. -/
def thetaComplModulus (τ : ℂ) : ℂ := jacobiThetaFour 0 τ ^ 2 / jacobiThetaThree 0 τ ^ 2

/-- The elliptic modular function `λ = k²` (§20.9(ii)). -/
def modularLambda (τ : ℂ) : ℂ := thetaModulus τ ^ 2

/-- `λ(−1/τ) = 1 − λ(τ)` (§20.9(ii)). -/
theorem modularLambda_neg_inv {τ : ℂ} (hτ : 0 < τ.im) :
    modularLambda (-1 / τ) = 1 - modularLambda τ := by
  sorry

/-- Jacobi's inversion (§20.9(ii)): every `k ∈ (0, 1)` is `thetaModulus (it)` for exactly one
`t > 0`. -/
theorem existsUnique_thetaModulus_eq {k : ℝ} (hk₀ : 0 < k) (hk₁ : k < 1) :
    ∃! t : ℝ, 0 < t ∧ thetaModulus (I * t) = k := by
  sorry

/-- DLMF 20.9.2 in the rectangular case, with Tau Ceti's real `K`:
`K(k) = (π/2) θ₃²(0|it)` and `K(k′) = t K(k)`. -/
theorem legendreK_thetaModulus {t : ℝ} (ht : 0 < t) :
    ((TauCeti.Real.legendreK (thetaModulus (I * t)).re : ℝ) : ℂ) =
        π / 2 * jacobiThetaThree 0 (I * t) ^ 2 ∧
      TauCeti.Real.legendreK (thetaComplModulus (I * t)).re =
        t * TauCeti.Real.legendreK (thetaModulus (I * t)).re := by
  sorry

/-- DLMF 20.11.5 in the rectangular case: `F(½, ½; 1; k²) = θ₃²(0|it)`. -/
theorem ordinaryHypergeometric_modularLambda {t : ℝ} (ht : 0 < t) :
    ordinaryHypergeometric (1 / 2 : ℂ) (1 / 2) 1 (modularLambda (I * t)) =
      jacobiThetaThree 0 (I * t) ^ 2 := by
  sorry

/-- DLMF 20.9.3, corrected to the open period rectangle in the rectangular case. -/
theorem carlsonRF_jacobiTheta {t : ℝ} (ht : 0 < t) {z : ℂ} (hz : z ≠ 0)
    (hre : |z.re| < π / 2) (him : |z.im| < π * t / 2) :
    carlsonRF (jacobiThetaTwo z (I * t) ^ 2 / jacobiThetaTwo 0 (I * t) ^ 2)
        (jacobiThetaThree z (I * t) ^ 2 / jacobiThetaThree 0 (I * t) ^ 2)
        (jacobiThetaFour z (I * t) ^ 2 / jacobiThetaFour 0 (I * t) ^ 2) =
      z * deriv (fun w ↦ jacobiThetaOne w (I * t)) 0 / jacobiThetaOne z (I * t) := by
  sorry

/-! ## Layer 6: integrals -/

/-- DLMF 20.10.2: `∫₀^∞ x^{s−1} (θ₃(0|ix²) − 1) dx = π^{−s/2} Γ(s/2) ζ(s)` for `Re s > 1`. -/
theorem mellin_jacobiThetaThree_sub_one {s : ℂ} (hs : 1 < s.re) :
    IntegrableOn (fun x : ℝ ↦ (x : ℂ) ^ (s - 1) * (jacobiThetaThree 0 (I * x ^ 2) - 1))
        (Ioi 0) ∧
      mellin (fun x : ℝ ↦ jacobiThetaThree 0 (I * x ^ 2) - 1) s =
        (π : ℂ) ^ (-s / 2) * Complex.Gamma (s / 2) * riemannZeta s := by
  sorry

/-! ## Layer 7: generalizations -/

/-- The Gauss sum `G(m, n) = ∑_{k<n} e^{−πik²m/n}` (DLMF 20.11.1). -/
def thetaGaussSum (m : ℤ) (n : ℕ) : ℂ :=
  ∑ k ∈ Finset.range n, cexp (-(π * I * k ^ 2 * m / n))

/-- DLMF 20.11.2, Landsberg–Schaar reciprocity, for positive `m, n` with `mn` even. -/
theorem thetaGaussSum_reciprocity {m n : ℕ} (hm : 0 < m) (hn : 0 < n) (hmn : Even (m * n)) :
    (n : ℂ) ^ (-(1 / 2) : ℂ) * thetaGaussSum m n =
      cexp (-(π * I / 4)) * (m : ℂ) ^ (-(1 / 2) : ℂ) * thetaGaussSum (-(n : ℤ)) m := by
  sorry

end TauCetiRoadmap.SpecialFunctionsTheta
