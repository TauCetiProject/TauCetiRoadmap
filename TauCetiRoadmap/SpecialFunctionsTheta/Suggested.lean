module

public import Mathlib
public import TauCeti.Analysis.SpecialFunctions.EllipticIntegral.Legendre
public import TauCeti.Analysis.SpecialFunctions.EllipticIntegral.Carlson.Basic
public import TauCeti.Analysis.SpecialFunctions.EllipticIntegral.Carlson.Legendre
public import TauCeti.Analysis.SpecialFunctions.EllipticIntegral.Gauss
public import TauCeti.Analysis.SpecialFunctions.EllipticIntegral.Hypergeometric
public import TauCeti.Analysis.SpecialFunctions.EllipticIntegral.Lemniscate
public import TauCeti.Analysis.SpecialFunctions.QPochhammer
public import TauCeti.NumberTheory.ModularForms.JacobiTheta.OneVariable
public import TauCeti.NumberTheory.ModularForms.JacobiTheta.GaussSum

/-!
# Theta functions: target signatures

This file states, against the pinned Mathlib and Tau Ceti, the headlines of `README.md` that
carry a Lean name, each with every conclusion the README attaches to it. It is not an exhaustive
acceptance test: the other headlines of the README are targets of the same standing, stated in
prose. Discharging this file finishes neither a layer nor the roadmap.

The definitions below are roadmap-local copies of the definitions `README.md` pins. The four
theta functions, the modulus, the modular function `λ`, the basis of theta functions of order `N`
and the Riemann theta function live in `TauCeti`; here they live in this file's namespace. They are
stated with their intended bodies so that the conventions are checked by the compiler: Mathlib's
`jacobiTheta₂` with `z ↦ z / π`, the multiplier `M(z|τ) = e^{iz + iπτ/4}`, and `q^α = e^{iαπτ}`
written out. Theorems are stated with `sorry`. Equation numbers in docstrings are locators in the
sources listed in the README.
-/

@[expose] public section

noncomputable section

namespace TauCetiRoadmap.SpecialFunctionsTheta

open Complex Filter Topology Set MeasureTheory
open scoped Real ComplexConjugate

/-! ## Layer 1: the four theta functions and their characteristics -/

/-- The multiplier `M(z|τ) = e^{iz + iπτ/4}` (DLMF 20.2.10). -/
def thetaMultiplier (z τ : ℂ) : ℂ := cexp (I * z + π * I * τ / 4)

/-- `θ₃(z|τ) = ∑_{n∈ℤ} q^{n²} e^{2inz}`, through Mathlib's `jacobiTheta₂`. -/
def jacobiThetaThree (z τ : ℂ) : ℂ := jacobiTheta₂ (z / π) τ

/-- `θ₄(z|τ) = θ₃(z + π/2|τ)`. -/
def jacobiThetaFour (z τ : ℂ) : ℂ := jacobiTheta₂ (z / π + 1 / 2) τ

/-- `θ₂(z|τ) = M(z|τ) θ₃(z + πτ/2|τ)`. -/
def jacobiThetaTwo (z τ : ℂ) : ℂ := thetaMultiplier z τ * jacobiTheta₂ (z / π + τ / 2) τ

/-- `θ₁(z|τ) = −i M(z|τ) θ₃(z + π/2 + πτ/2|τ)`. -/
def jacobiThetaOne (z τ : ℂ) : ℂ :=
  -I * thetaMultiplier z τ * jacobiTheta₂ (z / π + 1 / 2 + τ / 2) τ

/-- README 1.1: `θ₁(z|τ) = 2 ∑_{n≥0} (−1)ⁿ q^{(n+½)²} sin((2n + 1)z)` (DLMF 20.2.1). -/
theorem hasSum_jacobiThetaOne (z : ℂ) {τ : ℂ} (hτ : 0 < τ.im) :
    HasSum (fun n : ℕ ↦ 2 * (-1) ^ n * cexp (π * I * τ * ((n : ℂ) + 1 / 2) ^ 2) *
      Complex.sin ((2 * n + 1) * z)) (jacobiThetaOne z τ) := by
  sorry

/-- README 1.1: `θ₃(z|τ) = 1 + 2 ∑_{n≥1} q^{n²} cos(2nz)` (DLMF 20.2.3). -/
theorem hasSum_jacobiThetaThree (z : ℂ) {τ : ℂ} (hτ : 0 < τ.im) :
    HasSum (fun n : ℕ ↦ 2 * cexp (π * I * τ * ((n : ℂ) + 1) ^ 2) *
      Complex.cos (2 * ((n : ℂ) + 1) * z)) (jacobiThetaThree z τ - 1) := by
  sorry

/-- README 1.3: quasi-periodicity of `θ₁` for all `m, n : ℤ` and all `τ` (DLMF 20.2.6). -/
theorem jacobiThetaOne_add_lattice (z τ : ℂ) (m n : ℤ) :
    jacobiThetaOne (z + (m + n * τ) * π) τ =
      (-1) ^ (m + n) * cexp (-(π * I * τ * n ^ 2)) * cexp (-(2 * I * n * z)) *
        jacobiThetaOne z τ := by
  sorry

/-- README 1.3: `θ₃(z|τ + 1) = θ₄(z|τ)`, for all `τ` (DLMF 20.7.28). -/
theorem jacobiThetaThree_add_one (z τ : ℂ) : jacobiThetaThree z (τ + 1) = jacobiThetaFour z τ := by
  sorry

/-- README 1.3: `θ₁(z|τ + 1) = e^{iπ/4} θ₁(z|τ)`, for all `τ` (DLMF 20.7.26). -/
theorem jacobiThetaOne_add_one (z τ : ℂ) :
    jacobiThetaOne z (τ + 1) = cexp (π * I / 4) * jacobiThetaOne z τ := by
  sorry

/-- README 1.2, conjugation: `θ₁(z̄ | −τ̄) = conj θ₁(z|τ)`. -/
theorem jacobiThetaOne_conj (z τ : ℂ) :
    jacobiThetaOne (conj z) (-conj τ) = conj (jacobiThetaOne z τ) := by
  sorry

/-- README 1.4, the heat equation: `∂θ₁/∂τ = −(iπ/4) ∂²θ₁/∂z²` (DLMF 20.13.1). -/
theorem hasDerivAt_jacobiThetaOne_snd (z : ℂ) {τ : ℂ} (hτ : 0 < τ.im) :
    HasDerivAt (fun σ ↦ jacobiThetaOne z σ)
      (-(I * π / 4) * deriv^[2] (fun w ↦ jacobiThetaOne w τ) z) τ := by
  sorry

/-- The basis `Θ^{a,b}_{N,r}(z|τ) = ∑_{n∈ℤ} (−1)^{bn} q^{(nN+s)²/N} e^{2i(nN+s)z}`, `s = r + a/2`,
of the theta functions of order `N` with characteristic `(a, b)` (README 1.5). -/
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

/-! ## Layer 2: Riemann's theta formula and the identities it implies -/

/-- README 2.1, Riemann's theta formula in Jacobi's form: with `w′ = (w + x + y + z)/2`,
`x′ = (w + x − y − z)/2`, `y′ = (w − x + y − z)/2`, `z′ = (w − x − y + z)/2`,
`2θ₃(w)θ₃(x)θ₃(y)θ₃(z) = ∑_{j=1}^{4} θⱼ(w′)θⱼ(x′)θⱼ(y′)θⱼ(z′)`, for all `τ`. -/
theorem two_mul_jacobiThetaThree_mul_eq_sum (w x y z τ : ℂ) :
    2 * jacobiThetaThree w τ * jacobiThetaThree x τ * jacobiThetaThree y τ *
        jacobiThetaThree z τ =
      jacobiThetaOne ((w + x + y + z) / 2) τ * jacobiThetaOne ((w + x - y - z) / 2) τ *
          jacobiThetaOne ((w - x + y - z) / 2) τ * jacobiThetaOne ((w - x - y + z) / 2) τ +
        jacobiThetaTwo ((w + x + y + z) / 2) τ * jacobiThetaTwo ((w + x - y - z) / 2) τ *
          jacobiThetaTwo ((w - x + y - z) / 2) τ * jacobiThetaTwo ((w - x - y + z) / 2) τ +
        jacobiThetaThree ((w + x + y + z) / 2) τ * jacobiThetaThree ((w + x - y - z) / 2) τ *
          jacobiThetaThree ((w - x + y - z) / 2) τ * jacobiThetaThree ((w - x - y + z) / 2) τ +
        jacobiThetaFour ((w + x + y + z) / 2) τ * jacobiThetaFour ((w + x - y - z) / 2) τ *
          jacobiThetaFour ((w - x + y - z) / 2) τ * jacobiThetaFour ((w - x - y + z) / 2) τ := by
  sorry

/-- README 2.2, Jacobi's quartic identity: `θ₃⁴(0|τ) = θ₂⁴(0|τ) + θ₄⁴(0|τ)` (DLMF 20.7.5). -/
theorem jacobiThetaThree_zero_pow_four {τ : ℂ} (hτ : 0 < τ.im) :
    jacobiThetaThree 0 τ ^ 4 = jacobiThetaTwo 0 τ ^ 4 + jacobiThetaFour 0 τ ^ 4 := by
  sorry

/-! ## Layer 3: the inversion `τ ↦ −1/τ` and its applications -/

/-- README 3.1: `(−iτ)^{1/2} θ₁(z|τ) = −i e^{iτ′z²/π} θ₁(zτ′|τ′)`, `τ′ = −1/τ` (DLMF 20.7.30). -/
theorem jacobiThetaOne_neg_inv (z : ℂ) {τ : ℂ} (hτ : 0 < τ.im) :
    (-I * τ) ^ (1 / 2 : ℂ) * jacobiThetaOne z τ =
      -I * cexp (I * (-1 / τ) * z ^ 2 / π) * jacobiThetaOne (z * (-1 / τ)) (-1 / τ) := by
  sorry

/-- The Gauss sum `G(m, n) = ∑_{k<n} e^{−πik²m/n}` (README 3.2). -/
def thetaGaussSum (m : ℤ) (n : ℕ) : ℂ :=
  ∑ k ∈ Finset.range n, cexp (-(π * I * k ^ 2 * m / n))

/-- README 3.2, Landsberg–Schaar reciprocity, for positive `m, n` with `mn` even (DLMF 20.11.2). -/
theorem thetaGaussSum_reciprocity {m n : ℕ} (hm : 0 < m) (hn : 0 < n) (hmn : Even (m * n)) :
    (n : ℂ) ^ (-(1 / 2) : ℂ) * thetaGaussSum m n =
      cexp (-(π * I / 4)) * (m : ℂ) ^ (-(1 / 2) : ℂ) * thetaGaussSum (-(n : ℤ)) m := by
  sorry

/-- README 3.3: `∫₀^∞ x^{s−1} (θ₃(0|ix²) − 1) dx = π^{−s/2} Γ(s/2) ζ(s)` for `Re s > 1`
(DLMF 20.10.2). -/
theorem mellin_jacobiThetaThree_sub_one {s : ℂ} (hs : 1 < s.re) :
    IntegrableOn (fun x : ℝ ↦ (x : ℂ) ^ (s - 1) * (jacobiThetaThree 0 (I * x ^ 2) - 1))
        (Ioi 0) ∧
      mellin (fun x : ℝ ↦ jacobiThetaThree 0 (I * x ^ 2) - 1) s =
        (π : ℂ) ^ (-s / 2) * Complex.Gamma (s / 2) * riemannZeta s := by
  sorry

/-- README 3.4: the Laplace transform of `θ₄` (DLMF 20.10.5). -/
theorem integral_exp_mul_jacobiThetaFour {s β : ℂ} {ℓ : ℝ} (hs : 0 < s.re) (hℓ : 0 < ℓ)
    (hβ : |β.re| + |β.im| ≤ ℓ) :
    IntegrableOn
        (fun t : ℝ ↦ cexp (-s * t) * jacobiThetaFour (β * π / (2 * ℓ)) (I * π * t / ℓ ^ 2))
        (Ioi 0) ∧
      ∫ t in Ioi (0 : ℝ), cexp (-s * t) * jacobiThetaFour (β * π / (2 * ℓ)) (I * π * t / ℓ ^ 2) =
        ℓ / s ^ (1 / 2 : ℂ) * Complex.cosh (β * s ^ (1 / 2 : ℂ)) /
          Complex.sinh (ℓ * s ^ (1 / 2 : ℂ)) := by
  sorry

/-! ## Layer 4: the product formula, zeros and theta constants -/

/-- README 4.1: with `p = e^{iπz}`,
`θ₃(πz|τ) = ∏_{n≥1}(1 − q^{2n})(1 + q^{2n−1}p²)(1 + q^{2n−1}p^{−2})` (DLMF 20.5.9). -/
theorem hasProd_jacobiThetaThree (z : ℂ) {τ : ℂ} (hτ : 0 < τ.im) :
    HasProd (fun n : ℕ ↦ (1 - cexp (π * I * τ) ^ (2 * n + 2)) *
      (1 + cexp (π * I * τ) ^ (2 * n + 1) * cexp (2 * π * I * z)) *
      (1 + cexp (π * I * τ) ^ (2 * n + 1) * cexp (-(2 * π * I * z))))
      (jacobiThetaThree (π * z) τ) := by
  sorry

/-- README 4.2, the zeros of `θ₁`: exactly the lattice points `(m + nτ)π`. -/
theorem jacobiThetaOne_eq_zero_iff (z : ℂ) {τ : ℂ} (hτ : 0 < τ.im) :
    jacobiThetaOne z τ = 0 ↔ ∃ m n : ℤ, z = (m + n * τ) * π := by
  sorry

/-- README 4.3, Jacobi's derivative formula: `θ₁′(0|τ) = θ₂(0|τ) θ₃(0|τ) θ₄(0|τ)`
(DLMF 20.4.6). -/
theorem deriv_jacobiThetaOne_zero {τ : ℂ} (hτ : 0 < τ.im) :
    deriv (fun z ↦ jacobiThetaOne z τ) 0 =
      jacobiThetaTwo 0 τ * jacobiThetaThree 0 τ * jacobiThetaFour 0 τ := by
  sorry

/-- README 4.3: `θ₁′(0|τ) = 2η(τ)³`, with Mathlib's Dedekind `η` (DLMF 23.15.9). -/
theorem deriv_jacobiThetaOne_zero_eq_eta {τ : ℂ} (hτ : 0 < τ.im) :
    deriv (fun z ↦ jacobiThetaOne z τ) 0 = 2 * ModularForm.eta τ ^ 3 := by
  sorry

/-- README 4.4, corrected form of DLMF 20.7.34:
`θ₁(z|2τ)θ₃(z|2τ)/θ₁(z|τ + ½) = e^{−iπ/8} η(τ)η(4τ)/η(2τ)`, where the denominator does not
vanish. -/
theorem jacobiThetaOne_mul_jacobiThetaThree_div_eq_eta {z τ : ℂ} (hτ : 0 < τ.im)
    (hz : jacobiThetaOne z (τ + 1 / 2) ≠ 0) :
    jacobiThetaOne z (2 * τ) * jacobiThetaThree z (2 * τ) / jacobiThetaOne z (τ + 1 / 2) =
      cexp (-(π * I / 8)) *
        (ModularForm.eta τ * ModularForm.eta (4 * τ) / ModularForm.eta (2 * τ)) := by
  sorry

/-! ## Layer 5: logarithmic derivatives, double products and expansions -/

/-- README 5.2, the double product for `θ₄` with the paired cutoffs: the inner limits over
`−M ≤ m ≤ M` exist, and `θ₄(0|τ) ∏_{n=1−N}^{N} L(n) → θ₄(z|τ)` (DLMF 20.5.17). The symmetric
outer range `−N ≤ n ≤ N` would give `e^{iz} θ₄(z|τ)`. -/
theorem tendsto_jacobiThetaFour_doubleProd (z : ℂ) {τ : ℂ} (hτ : 0 < τ.im) :
    ∃ L : ℤ → ℂ,
      (∀ n : ℤ, Tendsto (fun M : ℕ ↦ ∏ m ∈ Finset.Icc (-(M : ℤ)) M,
          (1 + z / ((m + (n - 1 / 2) * τ) * π))) atTop (𝓝 (L n))) ∧
      Tendsto (fun N : ℕ ↦ jacobiThetaFour 0 τ * ∏ n ∈ Finset.Icc (1 - (N : ℤ)) N, L n) atTop
        (𝓝 (jacobiThetaFour z τ)) := by
  sorry

/-- README 5.4: `θ₁‴(0)/θ₁′(0) = −1 + 24 ∑_{n≥1} q^{2n}/(1 − q^{2n})²` (DLMF 20.4.8). -/
theorem hasSum_iteratedDeriv_three_jacobiThetaOne {τ : ℂ} (hτ : 0 < τ.im) :
    HasSum (fun n : ℕ ↦ 24 * cexp (π * I * τ) ^ (2 * n + 2) /
        (1 - cexp (π * I * τ) ^ (2 * n + 2)) ^ 2)
      (iteratedDeriv 3 (fun z ↦ jacobiThetaOne z τ) 0 /
        deriv (fun z ↦ jacobiThetaOne z τ) 0 + 1) := by
  sorry

/-- README 5.5, Watson's expansion (DLMF 20.8.1). -/
theorem hasSum_watson {z τ : ℂ} (hτ : 0 < τ.im) (hz : jacobiThetaTwo z τ ≠ 0) :
    HasSum (fun n : ℤ ↦ 2 * (-1) ^ n * cexp (π * I * τ * n ^ 2) * cexp (2 * I * n * z) /
        (cexp (-(π * I * τ * n)) * cexp (-(I * z)) + cexp (π * I * τ * n) * cexp (I * z)))
      (jacobiThetaTwo 0 τ * jacobiThetaThree z τ * jacobiThetaFour z τ / jacobiThetaTwo z τ) := by
  sorry

/-! ## Layer 6: the modular function `λ` and the elliptic integrals -/

/-- The modulus `k = θ₂²(0|τ)/θ₃²(0|τ)` (README 6.1). -/
def thetaModulus (τ : ℂ) : ℂ := jacobiThetaTwo 0 τ ^ 2 / jacobiThetaThree 0 τ ^ 2

/-- The complementary modulus `k′ = θ₄²(0|τ)/θ₃²(0|τ)`. -/
def thetaComplModulus (τ : ℂ) : ℂ := jacobiThetaFour 0 τ ^ 2 / jacobiThetaThree 0 τ ^ 2

/-- The elliptic modular function `λ = k²` (README 6.1). -/
def modularLambda (τ : ℂ) : ℂ := thetaModulus τ ^ 2

/-- README 6.1: `λ(−1/τ) = 1 − λ(τ)` (DLMF 23.18.1). -/
theorem modularLambda_neg_inv {τ : ℂ} (hτ : 0 < τ.im) :
    modularLambda (-1 / τ) = 1 - modularLambda τ := by
  sorry

/-- README 6.1, Jacobi's inversion: every `k ∈ (0, 1)` is `thetaModulus (it)` for exactly one
`t > 0`. -/
theorem existsUnique_thetaModulus_eq {k : ℝ} (hk₀ : 0 < k) (hk₁ : k < 1) :
    ∃! t : ℝ, 0 < t ∧ thetaModulus (I * t) = k := by
  sorry

/-- README 6.2: `λ` maps the fundamental region `F` of `Γ(2)` bijectively onto
`ℂ ∖ ((−∞, 0] ∪ [1, ∞))`. -/
theorem bijOn_modularLambda :
    Set.BijOn modularLambda
      {τ : ℂ | 0 < τ.im ∧ |τ.re| < 1 ∧ 1 / 2 < ‖τ - 1 / 2‖ ∧ 1 / 2 < ‖τ + 1 / 2‖}
      {w : ℂ | w ∈ slitPlane ∧ 1 - w ∈ slitPlane} := by
  sorry

/-- README 6.3, in the rectangular case, with Tau Ceti's real `K`:
`K(k) = (π/2) θ₃²(0|it)` and `K(k′) = t K(k)` (DLMF 20.9.2). -/
theorem legendreK_thetaModulus {t : ℝ} (ht : 0 < t) :
    ((TauCeti.Real.legendreK (thetaModulus (I * t)).re : ℝ) : ℂ) =
        π / 2 * jacobiThetaThree 0 (I * t) ^ 2 ∧
      TauCeti.Real.legendreK (thetaComplModulus (I * t)).re =
        t * TauCeti.Real.legendreK (thetaModulus (I * t)).re := by
  sorry

/-- README 6.4, the Carlson form of `K = (π/2)θ₃²(0|τ)` on the translate `F + 2n`. -/
theorem carlsonRF_modularLambda {τ : ℂ} (n : ℤ) (hτ : 0 < τ.im) (hre : |τ.re - 2 * n| < 1)
    (h₁ : 1 / 2 < ‖τ - 2 * n - 1 / 2‖) (h₂ : 1 / 2 < ‖τ - 2 * n + 1 / 2‖) :
    carlsonRF 0 (1 - modularLambda τ) 1 = π / 2 * jacobiThetaThree 0 τ ^ 2 := by
  sorry

/-- README 6.5, corrected to the open period rectangle in the rectangular case (DLMF 20.9.3). -/
theorem carlsonRF_jacobiTheta {t : ℝ} (ht : 0 < t) {z : ℂ} (hz : z ≠ 0)
    (hre : |z.re| < π / 2) (him : |z.im| < π * t / 2) :
    carlsonRF (jacobiThetaTwo z (I * t) ^ 2 / jacobiThetaTwo 0 (I * t) ^ 2)
        (jacobiThetaThree z (I * t) ^ 2 / jacobiThetaThree 0 (I * t) ^ 2)
        (jacobiThetaFour z (I * t) ^ 2 / jacobiThetaFour 0 (I * t) ^ 2) =
      z * deriv (fun w ↦ jacobiThetaOne w (I * t)) 0 / jacobiThetaOne z (I * t) := by
  sorry

/-! ## Layer 7: the Riemann theta function in genus `g` -/

open Matrix

variable {ι : Type*} [Fintype ι] [DecidableEq ι]

/-- The integer vector `m` as a complex vector. -/
def intVec (m : ι → ℤ) : ι → ℂ := fun i ↦ (m i : ℂ)

/-- The Siegel upper half-space: complex symmetric matrices with positive definite imaginary
part (README 7.1). -/
def siegelUpperHalfSpace (ι : Type*) [Fintype ι] : Set (Matrix ι ι ℂ) :=
  {Ω | Ωᵀ = Ω ∧ (Ω.map Complex.im).PosDef}

/-- The term `exp(πi (n+a)·Ω(n+a) + 2πi (n+a)·(z+b))` of the theta series with real
characteristic `(a, b)`. -/
def riemannThetaCharTerm (a b : ι → ℝ) (z : ι → ℂ) (Ω : Matrix ι ι ℂ) (n : ι → ℤ) : ℂ :=
  cexp (π * I * ((fun i ↦ (n i : ℂ) + a i) ⬝ᵥ (Ω *ᵥ fun i ↦ (n i : ℂ) + a i)) +
    2 * π * I * ((fun i ↦ (n i : ℂ) + a i) ⬝ᵥ (fun i ↦ z i + b i)))

/-- The theta function with characteristic `(a, b)`,
`θ[a, b](z|Ω) = ∑_{n∈ℤ^g} exp(πi (n+a)·Ω(n+a) + 2πi (n+a)·(z+b))` (README 7.1). -/
def riemannThetaChar (a b : ι → ℝ) (z : ι → ℂ) (Ω : Matrix ι ι ℂ) : ℂ :=
  ∑' n : ι → ℤ, riemannThetaCharTerm a b z Ω n

/-- The Riemann theta function `θ(z|Ω) = θ[0, 0](z|Ω)` (README 7.1). -/
def riemannTheta (z : ι → ℂ) (Ω : Matrix ι ι ℂ) : ℂ := riemannThetaChar 0 0 z Ω

/-- README 7.1: on the Siegel upper half-space the theta series converges absolutely. -/
theorem summable_norm_riemannThetaCharTerm (a b : ι → ℝ) (z : ι → ℂ) {Ω : Matrix ι ι ℂ}
    (hΩ : Ω ∈ siegelUpperHalfSpace ι) :
    Summable (fun n ↦ ‖riemannThetaCharTerm a b z Ω n‖) := by
  sorry

/-- README 7.1: in genus one, `θ(z|τ) = jacobiTheta₂ z τ = θ₃(πz|τ)`. -/
theorem riemannTheta_unique_eq (z τ : ℂ) :
    riemannTheta (ι := Unit) (fun _ ↦ z) (Matrix.of fun _ _ ↦ τ) = jacobiThetaThree (π * z) τ := by
  sorry

/-- README 7.2, quasi-periodicity: for `m, m′ ∈ ℤ^g`,
`θ(z + m + Ωm′|Ω) = exp(−πi m′·Ωm′ − 2πi m′·z) θ(z|Ω)`. -/
theorem riemannTheta_add_lattice (z : ι → ℂ) {Ω : Matrix ι ι ℂ}
    (hΩ : Ω ∈ siegelUpperHalfSpace ι) (m m' : ι → ℤ) :
    riemannTheta (z + intVec m + Ω *ᵥ intVec m') Ω =
      cexp (-(π * I * (intVec m' ⬝ᵥ (Ω *ᵥ intVec m'))) - 2 * π * I * (intVec m' ⬝ᵥ z)) *
        riemannTheta z Ω := by
  sorry

/-- README 7.3, parity of a half-integer characteristic: for `a, b ∈ {0, 1}^g`,
`θ[a/2, b/2](−z|Ω) = (−1)^{a·b} θ[a/2, b/2](z|Ω)`. -/
theorem riemannThetaChar_neg (a b : ι → Fin 2) (z : ι → ℂ) (Ω : Matrix ι ι ℂ) :
    riemannThetaChar (fun i ↦ (a i : ℝ) / 2) (fun i ↦ (b i : ℝ) / 2) (-z) Ω =
      (-1) ^ (∑ i, (a i : ℕ) * (b i : ℕ)) *
        riemannThetaChar (fun i ↦ (a i : ℝ) / 2) (fun i ↦ (b i : ℝ) / 2) z Ω := by
  sorry

/-- README 7.3: of the `4^g` half-integer characteristics, `2^{g−1}(2^g + 1)` are even. -/
theorem card_even_halfCharacteristics (g : ℕ) (hg : 1 ≤ g) :
    (Finset.univ.filter fun ab : (Fin g → Fin 2) × (Fin g → Fin 2) ↦
        Even (∑ i, (ab.1 i : ℕ) * (ab.2 i : ℕ))).card = 2 ^ (g - 1) * (2 ^ g + 1) := by
  sorry

/-- README 7.4: the entire functions with `f(z + m) = f(z)` and
`f(z + Ωm) = exp(−πiN m·Ωm − 2πiN m·z) f(z)` for `m ∈ ℤ^g` are exactly the combinations, with
unique coefficients, of the `N^g` functions `θ[a/N, 0](Nz|NΩ)`, `a ∈ (ℤ/N)^g`. -/
theorem existsUnique_eq_sum_riemannThetaChar {N : ℕ} (hN : 0 < N) {Ω : Matrix ι ι ℂ}
    (hΩ : Ω ∈ siegelUpperHalfSpace ι) {f : (ι → ℂ) → ℂ} (hf : Differentiable ℂ f)
    (h₁ : ∀ z (m : ι → ℤ), f (z + intVec m) = f z)
    (h₂ : ∀ z (m : ι → ℤ), f (z + Ω *ᵥ intVec m) =
      cexp (-(π * I * N * (intVec m ⬝ᵥ (Ω *ᵥ intVec m))) - 2 * π * I * N * (intVec m ⬝ᵥ z)) *
        f z) :
    ∃! c : (ι → Fin N) → ℂ, ∀ z, f z = ∑ a : ι → Fin N,
      c a * riemannThetaChar (fun i ↦ (a i : ℝ) / N) 0 ((N : ℂ) • z) ((N : ℂ) • Ω) := by
  sorry

/-- README 7.5, Riemann's theta formula in genus `g`: with `x₁ = (x + y + u + v)/2`,
`y₁ = (x + y − u − v)/2`, `u₁ = (x − y + u − v)/2`, `v₁ = (x − y − u + v)/2`,
`θ(x)θ(y)θ(u)θ(v) = 2^{−g} ∑_{a,b∈{0,½}^g} θ[a,b](x₁)θ[a,b](y₁)θ[a,b](u₁)θ[a,b](v₁)`. -/
theorem riemannTheta_mul_four {Ω : Matrix ι ι ℂ} (hΩ : Ω ∈ siegelUpperHalfSpace ι)
    (x y u v : ι → ℂ) :
    riemannTheta x Ω * riemannTheta y Ω * riemannTheta u Ω * riemannTheta v Ω =
      (2 : ℂ)⁻¹ ^ Fintype.card ι * ∑ a : ι → Fin 2, ∑ b : ι → Fin 2,
        let α : ι → ℝ := fun i ↦ (a i : ℝ) / 2
        let β : ι → ℝ := fun i ↦ (b i : ℝ) / 2
        riemannThetaChar α β ((1 / 2 : ℂ) • (x + y + u + v)) Ω *
          riemannThetaChar α β ((1 / 2 : ℂ) • (x + y - u - v)) Ω *
          riemannThetaChar α β ((1 / 2 : ℂ) • (x - y + u - v)) Ω *
          riemannThetaChar α β ((1 / 2 : ℂ) • (x - y - u + v)) Ω := by
  sorry

-- Library declarations cited in the README
#check @AnalyticOnNhd.eqOn_of_preconnected_of_eventuallyEq
#check @completedRiemannZeta
#check @Complex.carlsonRF
#check @Complex.carlsonRF_self
#check @Complex.cpow
#check @Complex.slitPlane
#check @Differentiable.apply_eq_apply_of_bounded
#check @dotProduct
#check @fourierCoeff
#check @HasProdLocallyUniformlyOn
#check @hasSum_fourier_series_of_summable
#check @integral_exp_neg_Ioi
#check @jacobiTheta
#check @logDeriv
#check @ModularForm.logDeriv_eta_eq_E2
#check @Matrix.mulVec
#check @Matrix.PosDef
#check @ModularForm.eta
#check @ModularForm.eta_ne_zero
#check @NNReal.agm
#check @NNReal.agm_mul_distrib
#check @ordinaryHypergeometric
#check @Summable.hasProdLocallyUniformlyOn_one_add
#check @Summable.of_norm_bounded
#check @TauCeti.hasProdLocallyUniformlyOn_one_sub_pow_mul
#check @TauCeti.multipliable_one_sub_pow_mul
#check @TauCeti.qTheta
#check @TauCeti.Real.legendreK
#check @TauCeti.Real.legendreK_eq_ordinaryHypergeometric
#check @TauCeti.Real.legendreK_eq_pi_div_two_mul_agm
#check @TauCeti.Real.legendreK_one_div_sqrt_two
#check @TauCeti.Real.legendreK_pos
#check @TauCeti.Real.legendreK_zero
#check @TauCeti.Real.ofReal_legendreK_eq_carlsonRF
#check @TauCeti.sum_range_cexp_two_pi_I_sq_div
#check @TauCeti.tendsto_jacobiTheta_comap_im_atTop
#check @TauCeti.tprod_one_add_pow_mul_tprod_one_sub_pow_odd
#check @TauCeti.tprod_one_sub_pow_mul_ne_zero
#check @TauCeti.tprod_one_sub_pow_ne_zero
#check @TendstoLocallyUniformlyOn
#check @tendstoUniformlyOn_tsum
#check @UpperHalfPlane
#check @jacobiTheta₂
#check @jacobiTheta₂_term
#check @hasSum_jacobiTheta₂_term
#check @jacobiTheta₂_undef
#check @jacobiTheta₂_add_left
#check @jacobiTheta₂_add_left'
#check @jacobiTheta₂_add_right
#check @jacobiTheta₂_neg_left
#check @jacobiTheta₂_conj
#check @jacobiTheta₂_functional_equation
#check @jacobiTheta₂'
#check @hasDerivAt_jacobiTheta₂_fst
#check @hasFDerivAt_jacobiTheta₂
#check @jacobiTheta₂_fderiv
#check @differentiableAt_jacobiTheta₂_snd
#check @mellin
#check @riemannZeta
#check @Complex.Gamma
#check @HasProd
#check @Multipliable

end TauCetiRoadmap.SpecialFunctionsTheta
