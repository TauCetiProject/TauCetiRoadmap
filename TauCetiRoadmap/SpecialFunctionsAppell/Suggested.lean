module

public import Mathlib

/-!
# The Appell functions: target signatures

This file states the headline theorems of the roadmap against the pinned Mathlib: every numbered
formula of DLMF §§16.13–16.16 in regularized form, and the existence and uniqueness of the principal
branches. `README.md` is the definitive document and states every target. Two kinds of target are
stated here only in part, although their carriers are all in this file. The auxiliary statements of
1.2–1.4 and 2.2–2.4 (analyticity and holomorphy in the parameters, symmetries, conjugation, values
on the axes, derivatives, fibre expansions and shift relations) are stated for `𝐅₁` or `𝐅₄` only.
DLMF's forms in `F`, which follow from the regularized forms under DLMF's hypothesis on the bottom
parameters, are stated for 16.16.4 only.

The definitions below are roadmap-local copies of the definitions `README.md` pins. In Tau Ceti they
live in `Complex`, beside the Gauss function of SpecialFunctionsHypergeometric. The Gauss function
itself (`eulerIntegral`, `IsEulerContinuation`, `regularizedGaussHypergeometric` and
`gaussHypergeometric`) is a roadmap-local copy of the definitions in
SpecialFunctionsHypergeometric's `Suggested.lean`, with the same bodies, so that this file imports
only Mathlib. They are stated with their intended bodies so that the conventions are checked by the
compiler: the regularized coefficients with `(Gamma ·)⁻¹`, the double series as a `tsum` over
`ℕ × ℕ`, the principal branches of `𝐅₁`, `𝐅₂`, `𝐅₃` as `Classical.choose` of an analytic
continuation of the series from `‖x‖ + ‖y‖ < 1` to the principal domain, with the junk value `0` off
it, and `F = Γ 𝐅`. Theorems are stated with `sorry`.

The helpers `pdx`, `pdy` (partial derivatives) and `pochZ` (the Pochhammer symbol at an integer
index) only abbreviate statements.
-/

@[expose] public section

noncomputable section

namespace TauCetiRoadmap.SpecialFunctionsAppell

open Complex Filter Topology Set MeasureTheory
open scoped Real Nat ComplexConjugate
/-- The Pochhammer symbol `(a)ₙ`. -/
local notation "poch(" a ", " n ")" => Polynomial.eval a (ascPochhammer ℂ n)

/-! ### The Gauss function (a copy of SpecialFunctionsHypergeometric's definitions) -/

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
/-- The principal branch of the regularized Gauss function `𝐅(a, b; c; z)` (DLMF 15.2.2) on the
cut plane, with the junk value `0` off it. -/
def regularizedGaussHypergeometric (a b c z : ℂ) : ℂ :=
  if h : ∃ G, IsEulerContinuation G then
    if 1 - z ∈ slitPlane then h.choose a b c z else 0
  else 0

/-- The principal branch of the Gauss function `F(a, b; c; z) = Γ(c) 𝐅(a, b; c; z)`. -/
def gaussHypergeometric (a b c z : ℂ) : ℂ := Gamma c * regularizedGaussHypergeometric a b c z

/-- `𝐅(a, b; c; z)`, the regularized Gauss function. -/
local notation "𝐅" => regularizedGaussHypergeometric

/-! ### Helpers -/

/-- The partial derivative `∂ₓ f(x, y)`. -/
abbrev pdx (f : ℂ → ℂ → ℂ) (x y : ℂ) : ℂ := deriv (fun s => f s y) x

/-- The partial derivative `∂ᵧ f(x, y)`. -/
abbrev pdy (f : ℂ → ℂ → ℂ) (x y : ℂ) : ℂ := deriv (fun t => f x t) y

/-- `Γ(a + k)/Γ(a)` for `k : ℤ`, used where `a ∉ ℤ`. -/
abbrev pochZ (a : ℂ) (k : ℤ) : ℂ := Gamma (a + k) / Gamma a

/-! ### Domains -/

/-- `max(‖x‖, ‖y‖) < 1`, the series domain of `F₁`, `F₃` and `G₂`. -/
def appellBidisc : Set (ℂ × ℂ) := {p | ‖p.1‖ < 1 ∧ ‖p.2‖ < 1}

/-- `‖x‖ + ‖y‖ < 1`, the series domain of `F₂`. -/
def appellSimplex : Set (ℂ × ℂ) := {p | ‖p.1‖ + ‖p.2‖ < 1}

/-- `√‖x‖ + √‖y‖ < 1`, the series domain of `F₄`. -/
def appellF4Domain : Set (ℂ × ℂ) := {p | √‖p.1‖ + √‖p.2‖ < 1}

/-- `‖x‖ + ‖y‖ < 1/4`, the domain of DLMF 16.14.6 for `G₃`. -/
def hornG3Domain : Set (ℂ × ℂ) := {p | ‖p.1‖ + ‖p.2‖ < 1 / 4}

/-- The principal domain of `F₁` and `F₃`: `1 − x` and `1 − y` off `(−∞, 0]`. -/
def appellDomain1 : Set (ℂ × ℂ) := {p | 1 - p.1 ∈ slitPlane ∧ 1 - p.2 ∈ slitPlane}

/-- The principal domain of `F₂`: the integrand of DLMF 16.15.2 has no singularity. -/
def appellDomain2 : Set (ℂ × ℂ) :=
  {p | ∀ u ∈ Icc (0 : ℝ) 1, ∀ v ∈ Icc (0 : ℝ) 1, 1 - u * p.1 - v * p.2 ∈ slitPlane}

/-- The polydisc `max(‖x‖, ‖y‖) < 1/5` of the identities 16.15.4 and 16.16.5_5–16.16.7. -/
def appellF4Polydisc : Set (ℂ × ℂ) := {p | ‖p.1‖ < 1 / 5 ∧ ‖p.2‖ < 1 / 5}

/-- The triangle `Δ` of DLMF 16.15.3. -/
def appellTriangle : Set (ℝ × ℝ) := {p | 0 ≤ p.1 ∧ 0 ≤ p.2 ∧ p.1 + p.2 ≤ 1}

/-! ### The regularized series -/

/-- The coefficient of `xᵐ yⁿ` in `𝐅₁(α; β, β′; γ; x, y)`. -/
def appellF1Coeff (a b b' c : ℂ) (m n : ℕ) : ℂ :=
  poch(a, m + n) * poch(b, m) * poch(b', n) * (Gamma (c + (m + n : ℕ)))⁻¹ / (m ! * n ! : ℂ)

/-- The coefficient of `xᵐ yⁿ` in `𝐅₂(α; β, β′; γ, γ′; x, y)`. -/
def appellF2Coeff (a b b' c c' : ℂ) (m n : ℕ) : ℂ :=
  poch(a, m + n) * poch(b, m) * poch(b', n) * (Gamma (c + m))⁻¹ * (Gamma (c' + n))⁻¹ /
    (m ! * n ! : ℂ)

/-- The coefficient of `xᵐ yⁿ` in `𝐅₃(α, α′; β, β′; γ; x, y)`. -/
def appellF3Coeff (a a' b b' c : ℂ) (m n : ℕ) : ℂ :=
  poch(a, m) * poch(a', n) * poch(b, m) * poch(b', n) * (Gamma (c + (m + n : ℕ)))⁻¹ /
    (m ! * n ! : ℂ)

/-- The coefficient of `xᵐ yⁿ` in `𝐅₄(α, β; γ, γ′; x, y)`. -/
def appellF4Coeff (a b c c' : ℂ) (m n : ℕ) : ℂ :=
  poch(a, m + n) * poch(b, m + n) * (Gamma (c + m))⁻¹ * (Gamma (c' + n))⁻¹ / (m ! * n ! : ℂ)

/-- The double series of `𝐅₁` (DLMF 16.13.1, regularized). -/
def regularizedAppellF1Series (a b b' c x y : ℂ) : ℂ :=
  ∑' p : ℕ × ℕ, appellF1Coeff a b b' c p.1 p.2 * x ^ p.1 * y ^ p.2

/-- The double series of `𝐅₂` (DLMF 16.13.2, regularized). -/
def regularizedAppellF2Series (a b b' c c' x y : ℂ) : ℂ :=
  ∑' p : ℕ × ℕ, appellF2Coeff a b b' c c' p.1 p.2 * x ^ p.1 * y ^ p.2

/-- The double series of `𝐅₃` (DLMF 16.13.3, regularized). -/
def regularizedAppellF3Series (a a' b b' c x y : ℂ) : ℂ :=
  ∑' p : ℕ × ℕ, appellF3Coeff a a' b b' c p.1 p.2 * x ^ p.1 * y ^ p.2

/-- `𝐅₄(α, β; γ, γ′; x, y)`, the sum of its double series (DLMF 16.13.4, regularized), used on
`appellF4Domain`. -/
def regularizedAppellF4 (a b c c' x y : ℂ) : ℂ :=
  ∑' p : ℕ × ℕ, appellF4Coeff a b c c' p.1 p.2 * x ^ p.1 * y ^ p.2

/-- `F₄ = Γ(γ) Γ(γ′) 𝐅₄`. -/
def appellF4 (a b c c' x y : ℂ) : ℂ := Gamma c * Gamma c' * regularizedAppellF4 a b c c' x y

/-! ### The principal branches -/

/-- `f` continues the series `s` analytically to `D`: it is analytic on `D` and equals `s` on
`appellSimplex`. -/
def IsAppellContinuation (D : Set (ℂ × ℂ)) (s f : ℂ × ℂ → ℂ) : Prop :=
  AnalyticOnNhd ℂ f D ∧ EqOn f s appellSimplex

open scoped Classical in
/-- The principal branch of `𝐅₁(α; β, β′; γ; x, y)` on `appellDomain1`, for all parameters. The
value `0` off `appellDomain1` is junk. -/
def regularizedAppellF1 (a b b' c x y : ℂ) : ℂ :=
  if h : ∃ f, IsAppellContinuation appellDomain1
      (fun p => regularizedAppellF1Series a b b' c p.1 p.2) f then
    if (x, y) ∈ appellDomain1 then h.choose (x, y) else 0
  else 0

open scoped Classical in
/-- The principal branch of `𝐅₂(α; β, β′; γ, γ′; x, y)` on `appellDomain2`. -/
def regularizedAppellF2 (a b b' c c' x y : ℂ) : ℂ :=
  if h : ∃ f, IsAppellContinuation appellDomain2
      (fun p => regularizedAppellF2Series a b b' c c' p.1 p.2) f then
    if (x, y) ∈ appellDomain2 then h.choose (x, y) else 0
  else 0

open scoped Classical in
/-- The principal branch of `𝐅₃(α, α′; β, β′; γ; x, y)` on `appellDomain1`. -/
def regularizedAppellF3 (a a' b b' c x y : ℂ) : ℂ :=
  if h : ∃ f, IsAppellContinuation appellDomain1
      (fun p => regularizedAppellF3Series a a' b b' c p.1 p.2) f then
    if (x, y) ∈ appellDomain1 then h.choose (x, y) else 0
  else 0

/-- `F₁ = Γ(γ) 𝐅₁`. -/
def appellF1 (a b b' c x y : ℂ) : ℂ := Gamma c * regularizedAppellF1 a b b' c x y

/-- `F₂ = Γ(γ) Γ(γ′) 𝐅₂`. -/
def appellF2 (a b b' c c' x y : ℂ) : ℂ := Gamma c * Gamma c' * regularizedAppellF2 a b b' c c' x y

/-- `F₃ = Γ(γ) 𝐅₃`. -/
def appellF3 (a a' b b' c x y : ℂ) : ℂ := Gamma c * regularizedAppellF3 a a' b b' c x y

/-! ### Euler integrals and Horn's series -/

/-- The regularized Euler integral of `F₁` (DLMF 16.15.1). -/
def appellF1EulerIntegral (a b b' c x y : ℂ) : ℂ :=
  (Gamma a * Gamma (c - a))⁻¹ * ∫ u in (0 : ℝ)..1,
    (u : ℂ) ^ (a - 1) * (1 - (u : ℂ)) ^ (c - a - 1) * (1 - u * x) ^ (-b) * (1 - u * y) ^ (-b')

/-- The regularized Euler integral of `F₂` (DLMF 16.15.2). -/
def appellF2EulerIntegral (a b b' c c' x y : ℂ) : ℂ :=
  (Gamma b * Gamma b' * Gamma (c - b) * Gamma (c' - b'))⁻¹ * ∫ u in (0 : ℝ)..1, ∫ v in (0 : ℝ)..1,
    (u : ℂ) ^ (b - 1) * (v : ℂ) ^ (b' - 1) * (1 - (u : ℂ)) ^ (c - b - 1) *
      (1 - (v : ℂ)) ^ (c' - b' - 1) * (1 - u * x - v * y) ^ (-a)

/-- The regularized Euler integral of `F₃` over the triangle `Δ` (DLMF 16.15.3). -/
def appellF3EulerIntegral (a a' b b' c x y : ℂ) : ℂ :=
  (Gamma b * Gamma b' * Gamma (c - b - b'))⁻¹ * ∫ p in appellTriangle,
    (p.1 : ℂ) ^ (b - 1) * (p.2 : ℂ) ^ (b' - 1) * (1 - (p.1 : ℂ) - p.2) ^ (c - b - b' - 1) *
      (1 - p.1 * x) ^ (-a) * (1 - p.2 * y) ^ (-a')

/-- The regularized Euler integral of `F₄` at `(x(1 − y), y(1 − x))` (DLMF 16.15.4). -/
def appellF4EulerIntegral (a b c c' x y : ℂ) : ℂ :=
  (Gamma a * Gamma b * Gamma (c - a) * Gamma (c' - b))⁻¹ * ∫ u in (0 : ℝ)..1, ∫ v in (0 : ℝ)..1,
    (u : ℂ) ^ (a - 1) * (v : ℂ) ^ (b - 1) * (1 - (u : ℂ)) ^ (c - a - 1) *
      (1 - (v : ℂ)) ^ (c' - b - 1) * (1 - u * x) ^ (a + 1 - c - c') *
        (1 - v * y) ^ (b + 1 - c - c') * (1 - u * x - v * y) ^ (c + c' - a - b - 1)

/-- Horn's `G₂(α, α′; β, β′; x, y)` (DLMF 16.14.5), for `β, β′ ∉ ℤ`. -/
def hornG2 (a a' b b' x y : ℂ) : ℂ :=
  ∑' p : ℕ × ℕ, poch(a, p.1) * poch(a', p.2) * pochZ b ((p.2 : ℤ) - p.1) *
    pochZ b' ((p.1 : ℤ) - p.2) * x ^ p.1 * y ^ p.2 / (p.1 ! * p.2 ! : ℂ)

/-- Horn's `G₃(α, α′; x, y)` (DLMF 16.14.6), for `α, α′ ∉ ℤ`. -/
def hornG3 (a a' x y : ℂ) : ℂ :=
  ∑' p : ℕ × ℕ, pochZ a (2 * (p.2 : ℤ) - p.1) * pochZ a' (2 * (p.1 : ℤ) - p.2) *
    x ^ p.1 * y ^ p.2 / (p.1 ! * p.2 ! : ℂ)

/-- The fibre sum `∑ₘ (α)ₘ (β)ₘ/((γ)ₘ m!) xᵐ F(α + m, β + m; γ′; y)` of `F₄` (5.3). -/
def appellF4Fibre (a b c c' x y : ℂ) : ℂ :=
  ∑' m : ℕ, poch(a, m) * poch(b, m) / (poch(c, m) * m !) * x ^ m *
    gaussHypergeometric (a + m) (b + m) c' y

/-! ### Layer 1: the double series -/

/-- **1.1** DLMF 16.13.1: the series of `𝐅₁` converges absolutely on the bidisc. -/
theorem summable_norm_appellF1Coeff (a b b' c : ℂ) {x y : ℂ} (h : (x, y) ∈ appellBidisc) :
    Summable fun p : ℕ × ℕ => ‖appellF1Coeff a b b' c p.1 p.2 * x ^ p.1 * y ^ p.2‖ := sorry

/-- **1.1** DLMF 16.13.2: the series of `𝐅₂` converges absolutely on `‖x‖ + ‖y‖ < 1`. -/
theorem summable_norm_appellF2Coeff (a b b' c c' : ℂ) {x y : ℂ} (h : (x, y) ∈ appellSimplex) :
    Summable fun p : ℕ × ℕ => ‖appellF2Coeff a b b' c c' p.1 p.2 * x ^ p.1 * y ^ p.2‖ := sorry

/-- **1.1** DLMF 16.13.3: the series of `𝐅₃` converges absolutely on the bidisc. -/
theorem summable_norm_appellF3Coeff (a a' b b' c : ℂ) {x y : ℂ} (h : (x, y) ∈ appellBidisc) :
    Summable fun p : ℕ × ℕ => ‖appellF3Coeff a a' b b' c p.1 p.2 * x ^ p.1 * y ^ p.2‖ := sorry

/-- **1.1** DLMF 16.13.4: the series of `𝐅₄` converges absolutely on `√‖x‖ + √‖y‖ < 1`. -/
theorem summable_norm_appellF4Coeff (a b c c' : ℂ) {x y : ℂ} (h : (x, y) ∈ appellF4Domain) :
    Summable fun p : ℕ × ℕ => ‖appellF4Coeff a b c c' p.1 p.2 * x ^ p.1 * y ^ p.2‖ := sorry

/-- **1.1** DLMF's coefficient of `F₁`, when `γ ∉ {0, −1, −2, …}`. -/
theorem gamma_mul_appellF1Coeff (a b b' : ℂ) {c : ℂ} (hc : ∀ k : ℕ, c ≠ -k) (m n : ℕ) :
    Gamma c * appellF1Coeff a b b' c m n =
      poch(a, m + n) * poch(b, m) * poch(b', n) / (poch(c, m + n) * m ! * n !) := sorry

/-- **1.2** Joint holomorphy of the series of `𝐅₄` in the parameters and the variables. -/
theorem differentiableOn_regularizedAppellF4 :
    DifferentiableOn ℂ
      (fun p : (Fin 4 → ℂ) × (ℂ × ℂ) =>
        regularizedAppellF4 (p.1 0) (p.1 1) (p.1 2) (p.1 3) p.2.1 p.2.2)
      (univ ×ˢ appellF4Domain) := sorry

/-- **1.2** Value of the series of `𝐅₁` on the axis `y = 0`. -/
theorem regularizedAppellF1Series_zero (a b b' c : ℂ) {x : ℂ} (hx : ‖x‖ < 1) :
    regularizedAppellF1Series a b b' c x 0 = 𝐅 a b c x := sorry

/-- **1.3** The derivative of the series of `𝐅₄` in `x`. -/
theorem pdx_regularizedAppellF4 (a b c c' : ℂ) {x y : ℂ} (h : (x, y) ∈ appellF4Domain) :
    pdx (regularizedAppellF4 a b c c') x y =
      a * b * regularizedAppellF4 (a + 1) (b + 1) (c + 1) c' x y := sorry

/-- **1.4** The fibre expansion of `𝐅₁` in Gauss functions of `x`. -/
theorem hasSum_regularizedAppellF1Series_fibre (a b b' c : ℂ) {x y : ℂ}
    (h : (x, y) ∈ appellBidisc) :
    HasSum (fun n : ℕ => poch(a, n) * poch(b', n) / n ! * y ^ n * 𝐅 (a + n) b (c + n) x)
      (regularizedAppellF1Series a b b' c x y) := sorry

/-! ### Layer 2: the principal branches of `F₁`, `F₂`, `F₃` -/

/-- **2.1** `appellDomain1` is open and connected. -/
theorem isOpen_appellDomain1 : IsOpen appellDomain1 := sorry

theorem isConnected_appellDomain1 : IsConnected appellDomain1 := sorry

/-- **2.1** `appellDomain2` is open and star-shaped about the origin. -/
theorem isOpen_appellDomain2 : IsOpen appellDomain2 := sorry

theorem starConvex_appellDomain2 : StarConvex ℝ 0 appellDomain2 := sorry

/-- **2.1** Uniqueness: two continuations to a connected open set containing `appellSimplex`
agree there. -/
theorem IsAppellContinuation.eqOn {D : Set (ℂ × ℂ)} (hD : IsOpen D) (hDc : IsPreconnected D)
    (hS : appellSimplex ⊆ D) {s f g : ℂ × ℂ → ℂ} (hf : IsAppellContinuation D s f)
    (hg : IsAppellContinuation D s g) : EqOn f g D := sorry

/-- **2.3** Existence of the principal branch of `𝐅₁`. -/
theorem exists_isAppellContinuation_F1 (a b b' c : ℂ) :
    ∃ f, IsAppellContinuation appellDomain1
      (fun p => regularizedAppellF1Series a b b' c p.1 p.2) f := sorry

/-- **2.3** Existence of the principal branch of `𝐅₂`. -/
theorem exists_isAppellContinuation_F2 (a b b' c c' : ℂ) :
    ∃ f, IsAppellContinuation appellDomain2
      (fun p => regularizedAppellF2Series a b b' c c' p.1 p.2) f := sorry

/-- **2.3** Existence of the principal branch of `𝐅₃`. -/
theorem exists_isAppellContinuation_F3 (a a' b b' c : ℂ) :
    ∃ f, IsAppellContinuation appellDomain1
      (fun p => regularizedAppellF3Series a a' b b' c p.1 p.2) f := sorry

/-- **2.3** DLMF 16.15.1 in regularized form on `appellDomain1`. -/
theorem regularizedAppellF1_eq_eulerIntegral {a b b' c x y : ℂ} (h : (x, y) ∈ appellDomain1)
    (ha : 0 < a.re) (hac : a.re < c.re) :
    regularizedAppellF1 a b b' c x y = appellF1EulerIntegral a b b' c x y := sorry

/-- **2.3** DLMF 16.15.2 in regularized form on `appellDomain2`. -/
theorem regularizedAppellF2_eq_eulerIntegral {a b b' c c' x y : ℂ} (h : (x, y) ∈ appellDomain2)
    (hb : 0 < b.re) (hbc : b.re < c.re) (hb' : 0 < b'.re) (hbc' : b'.re < c'.re) :
    regularizedAppellF2 a b b' c c' x y = appellF2EulerIntegral a b b' c c' x y := sorry

/-- **2.3** DLMF 16.15.3 in regularized form on `appellDomain1`. -/
theorem regularizedAppellF3_eq_eulerIntegral {a a' b b' c x y : ℂ} (h : (x, y) ∈ appellDomain1)
    (hb : 0 < b.re) (hb' : 0 < b'.re) (hc : 0 < (c - b - b').re) :
    regularizedAppellF3 a a' b b' c x y = appellF3EulerIntegral a a' b b' c x y := sorry

/-- **2.3** `𝐅₁` is its series on the bidisc. -/
theorem regularizedAppellF1_eq_series (a b b' c : ℂ) {x y : ℂ} (h : (x, y) ∈ appellBidisc) :
    regularizedAppellF1 a b b' c x y = regularizedAppellF1Series a b b' c x y := sorry

/-- **2.4** The shift relation of `𝐅₁` in `γ` (2.2) on `appellDomain1`. -/
theorem regularizedAppellF1_shift_c (a b b' c : ℂ) {x y : ℂ} (h : (x, y) ∈ appellDomain1) :
    regularizedAppellF1 a b b' c x y =
      (c - a) * regularizedAppellF1 a b b' (c + 1) x y +
        a * regularizedAppellF1 (a + 1) b b' (c + 1) x y := sorry

/-- **2.4** The shift relation of `𝐅₁` in `α` (2.2) on `appellDomain1`. -/
theorem regularizedAppellF1_shift_a (a b b' c : ℂ) {x y : ℂ} (h : (x, y) ∈ appellDomain1) :
    regularizedAppellF1 a b b' c x y =
      regularizedAppellF1 (a + 1) b b' c x y -
        b * x * regularizedAppellF1 (a + 1) (b + 1) b' (c + 1) x y -
          b' * y * regularizedAppellF1 (a + 1) b (b' + 1) (c + 1) x y := sorry

/-- **2.4** Joint holomorphy of `𝐅₁` in all parameters and both variables. -/
theorem differentiableOn_regularizedAppellF1 :
    DifferentiableOn ℂ
      (fun p : (Fin 4 → ℂ) × (ℂ × ℂ) =>
        regularizedAppellF1 (p.1 0) (p.1 1) (p.1 2) (p.1 3) p.2.1 p.2.2)
      (univ ×ˢ appellDomain1) := sorry

/-- **2.4** Conjugation. -/
theorem regularizedAppellF1_conj (a b b' c x y : ℂ) :
    regularizedAppellF1 (conj a) (conj b) (conj b') (conj c) (conj x) (conj y) =
      conj (regularizedAppellF1 a b b' c x y) := sorry

/-- **2.4** The reduction `𝐅₁(α; β, 0; γ; x, y) = 𝐅(α, β; γ; x)` on `appellDomain1`. -/
theorem regularizedAppellF1_zero_right (a b c : ℂ) {x y : ℂ} (h : (x, y) ∈ appellDomain1) :
    regularizedAppellF1 a b 0 c x y = 𝐅 a b c x := sorry

/-! ### Layer 3: partial differential equations -/

/-- **3.1** DLMF 16.14.1, first equation, on `appellDomain1`. -/
theorem regularizedAppellF1_pde_fst (a b b' c : ℂ) {x y : ℂ} (h : (x, y) ∈ appellDomain1) :
    let F := regularizedAppellF1 a b b' c
    x * (1 - x) * pdx (pdx F) x y + y * (1 - x) * pdx (pdy F) x y +
        (c - (a + b + 1) * x) * pdx F x y - b * y * pdy F x y - a * b * F x y = 0 := sorry

/-- **3.1** DLMF 16.14.1, second equation, on `appellDomain1`. -/
theorem regularizedAppellF1_pde_snd (a b b' c : ℂ) {x y : ℂ} (h : (x, y) ∈ appellDomain1) :
    let F := regularizedAppellF1 a b b' c
    y * (1 - y) * pdy (pdy F) x y + x * (1 - y) * pdx (pdy F) x y +
        (c - (a + b' + 1) * y) * pdy F x y - b' * x * pdx F x y - a * b' * F x y = 0 := sorry

/-- **3.1** DLMF 16.14.2, first equation, on `appellDomain2`. -/
theorem regularizedAppellF2_pde_fst (a b b' c c' : ℂ) {x y : ℂ} (h : (x, y) ∈ appellDomain2) :
    let F := regularizedAppellF2 a b b' c c'
    x * (1 - x) * pdx (pdx F) x y - x * y * pdx (pdy F) x y +
        (c - (a + b + 1) * x) * pdx F x y - b * y * pdy F x y - a * b * F x y = 0 := sorry

/-- **3.1** DLMF 16.14.2, second equation, on `appellDomain2`. -/
theorem regularizedAppellF2_pde_snd (a b b' c c' : ℂ) {x y : ℂ} (h : (x, y) ∈ appellDomain2) :
    let F := regularizedAppellF2 a b b' c c'
    y * (1 - y) * pdy (pdy F) x y - x * y * pdx (pdy F) x y +
        (c' - (a + b' + 1) * y) * pdy F x y - b' * x * pdx F x y - a * b' * F x y = 0 := sorry

/-- **3.1** DLMF 16.14.3, first equation, on `appellDomain1`. -/
theorem regularizedAppellF3_pde_fst (a a' b b' c : ℂ) {x y : ℂ} (h : (x, y) ∈ appellDomain1) :
    let F := regularizedAppellF3 a a' b b' c
    x * (1 - x) * pdx (pdx F) x y + y * pdx (pdy F) x y +
        (c - (a + b + 1) * x) * pdx F x y - a * b * F x y = 0 := sorry

/-- **3.1** DLMF 16.14.3, second equation, on `appellDomain1`. -/
theorem regularizedAppellF3_pde_snd (a a' b b' c : ℂ) {x y : ℂ} (h : (x, y) ∈ appellDomain1) :
    let F := regularizedAppellF3 a a' b b' c
    y * (1 - y) * pdy (pdy F) x y + x * pdx (pdy F) x y +
        (c - (a' + b' + 1) * y) * pdy F x y - a' * b' * F x y = 0 := sorry

/-- **3.1** DLMF 16.14.4, first equation, on `appellF4Domain`. -/
theorem regularizedAppellF4_pde_fst (a b c c' : ℂ) {x y : ℂ} (h : (x, y) ∈ appellF4Domain) :
    let F := regularizedAppellF4 a b c c'
    x * (1 - x) * pdx (pdx F) x y - 2 * x * y * pdx (pdy F) x y - y ^ 2 * pdy (pdy F) x y +
        (c - (a + b + 1) * x) * pdx F x y - (a + b + 1) * y * pdy F x y - a * b * F x y = 0 :=
  sorry

/-- **3.1** DLMF 16.14.4, second equation, on `appellF4Domain`. -/
theorem regularizedAppellF4_pde_snd (a b c c' : ℂ) {x y : ℂ} (h : (x, y) ∈ appellF4Domain) :
    let F := regularizedAppellF4 a b c c'
    y * (1 - y) * pdy (pdy F) x y - 2 * x * y * pdx (pdy F) x y - x ^ 2 * pdx (pdx F) x y +
        (c' - (a + b + 1) * y) * pdy F x y - (a + b + 1) * x * pdx F x y - a * b * F x y = 0 :=
  sorry

/-- **3.2** DLMF 16.14.5: `G₂` converges absolutely on the bidisc. -/
theorem summable_hornG2 {a a' b b' x y : ℂ} (hb : ∀ n : ℤ, b ≠ n) (hb' : ∀ n : ℤ, b' ≠ n)
    (h : (x, y) ∈ appellBidisc) :
    Summable fun p : ℕ × ℕ => ‖poch(a, p.1) * poch(a', p.2) * pochZ b ((p.2 : ℤ) - p.1) *
      pochZ b' ((p.1 : ℤ) - p.2) * x ^ p.1 * y ^ p.2 / (p.1 ! * p.2 ! : ℂ)‖ := sorry

/-- **3.2** DLMF 16.14.6: `G₃` converges absolutely on `‖x‖ + ‖y‖ < 1/4`. -/
theorem summable_hornG3 {a a' x y : ℂ} (ha : ∀ n : ℤ, a ≠ n) (ha' : ∀ n : ℤ, a' ≠ n)
    (h : (x, y) ∈ hornG3Domain) :
    Summable fun p : ℕ × ℕ => ‖pochZ a (2 * (p.2 : ℤ) - p.1) * pochZ a' (2 * (p.1 : ℤ) - p.2) *
      x ^ p.1 * y ^ p.2 / (p.1 ! * p.2 ! : ℂ)‖ := sorry

/-- **3.2** The first equation of the system of `G₂`,
`ϑₓ(β + ϑᵧ − ϑₓ) G₂ = x (α + ϑₓ)(β′ + ϑₓ − ϑᵧ) G₂`, written out. -/
theorem hornG2_pde_fst {a a' b b' x y : ℂ} (hb : ∀ n : ℤ, b ≠ n) (hb' : ∀ n : ℤ, b' ≠ n)
    (h : (x, y) ∈ appellBidisc) :
    let G := hornG2 a a' b b'
    let θx : (ℂ → ℂ → ℂ) → ℂ → ℂ → ℂ := fun f s t => s * pdx f s t
    let θy : (ℂ → ℂ → ℂ) → ℂ → ℂ → ℂ := fun f s t => t * pdy f s t
    let L₁ : ℂ → ℂ → ℂ := fun s t => b * G s t + θy G s t - θx G s t
    let L₂ : ℂ → ℂ → ℂ := fun s t => b' * G s t + θx G s t - θy G s t
    θx L₁ x y = x * (a * L₂ x y + θx L₂ x y) := sorry

/-- **3.2** The second equation of the system of `G₂`,
`ϑᵧ(β′ + ϑₓ − ϑᵧ) G₂ = y (α′ + ϑᵧ)(β + ϑᵧ − ϑₓ) G₂`, written out. -/
theorem hornG2_pde_snd {a a' b b' x y : ℂ} (hb : ∀ n : ℤ, b ≠ n) (hb' : ∀ n : ℤ, b' ≠ n)
    (h : (x, y) ∈ appellBidisc) :
    let G := hornG2 a a' b b'
    let θx : (ℂ → ℂ → ℂ) → ℂ → ℂ → ℂ := fun f s t => s * pdx f s t
    let θy : (ℂ → ℂ → ℂ) → ℂ → ℂ → ℂ := fun f s t => t * pdy f s t
    let L₁ : ℂ → ℂ → ℂ := fun s t => b * G s t + θy G s t - θx G s t
    let L₂ : ℂ → ℂ → ℂ := fun s t => b' * G s t + θx G s t - θy G s t
    θy L₂ x y = y * (a' * L₁ x y + θy L₁ x y) := sorry

/-- **3.2** The first equation of the system of `G₃`,
`ϑₓ(α + 2ϑᵧ − ϑₓ) G₃ = x (α′ + 2ϑₓ − ϑᵧ)(α′ + 2ϑₓ − ϑᵧ + 1) G₃`, written out. -/
theorem hornG3_pde_fst {a a' x y : ℂ} (ha : ∀ n : ℤ, a ≠ n) (ha' : ∀ n : ℤ, a' ≠ n)
    (h : (x, y) ∈ hornG3Domain) :
    let G := hornG3 a a'
    let θx : (ℂ → ℂ → ℂ) → ℂ → ℂ → ℂ := fun f s t => s * pdx f s t
    let θy : (ℂ → ℂ → ℂ) → ℂ → ℂ → ℂ := fun f s t => t * pdy f s t
    let L₁ : ℂ → ℂ → ℂ := fun s t => a * G s t + 2 * θy G s t - θx G s t
    let L₂ : ℂ → ℂ → ℂ := fun s t => (a' + 1) * G s t + 2 * θx G s t - θy G s t
    θx L₁ x y = x * (a' * L₂ x y + 2 * θx L₂ x y - θy L₂ x y) := sorry

/-- **3.2** The second equation of the system of `G₃`,
`ϑᵧ(α′ + 2ϑₓ − ϑᵧ) G₃ = y (α + 2ϑᵧ − ϑₓ)(α + 2ϑᵧ − ϑₓ + 1) G₃`, written out. -/
theorem hornG3_pde_snd {a a' x y : ℂ} (ha : ∀ n : ℤ, a ≠ n) (ha' : ∀ n : ℤ, a' ≠ n)
    (h : (x, y) ∈ hornG3Domain) :
    let G := hornG3 a a'
    let θx : (ℂ → ℂ → ℂ) → ℂ → ℂ → ℂ := fun f s t => s * pdx f s t
    let θy : (ℂ → ℂ → ℂ) → ℂ → ℂ → ℂ := fun f s t => t * pdy f s t
    let M₁ : ℂ → ℂ → ℂ := fun s t => a' * G s t + 2 * θx G s t - θy G s t
    let M₂ : ℂ → ℂ → ℂ := fun s t => (a + 1) * G s t + 2 * θy G s t - θx G s t
    θy M₁ x y = y * (a * M₂ x y + 2 * θy M₂ x y - θx M₂ x y) := sorry

/-! ### Layer 4: reductions and transformations of `F₁`, `F₂`, `F₃` -/

/-- **4.1** DLMF 16.16.8, first form, on `appellDomain1`. -/
theorem regularizedAppellF1_transform_16_16_8 (a b b' c : ℂ) {x y : ℂ}
    (h : (x, y) ∈ appellDomain1) :
    regularizedAppellF1 a b b' c x y =
      (1 - x) ^ (-b) * (1 - y) ^ (-b') *
        regularizedAppellF1 (c - a) b b' c (x / (x - 1)) (y / (y - 1)) := sorry

/-- **4.1** DLMF 16.16.8, second form, on the component of the origin. -/
theorem regularizedAppellF1_transform_16_16_8_snd (a b b' c : ℂ) {x y : ℂ}
    (h : (x, y) ∈ connectedComponentIn
      {p | p ∈ appellDomain1 ∧ (1 - p.2) / (1 - p.1) ∈ slitPlane} 0) :
    regularizedAppellF1 a b b' c x y =
      (1 - x) ^ (-a) *
        regularizedAppellF1 a (c - b - b') b' c (x / (x - 1)) ((y - x) / (1 - x)) := sorry

/-- **4.1** DLMF 16.16.9 on the component of the origin. -/
theorem regularizedAppellF2_transform_16_16_9 (a b b' c c' : ℂ) {x y : ℂ}
    (h : (x, y) ∈ connectedComponentIn
      {p | p ∈ appellDomain2 ∧ (p.1 / (p.1 - 1), p.2 / (1 - p.1)) ∈ appellDomain2} 0) :
    regularizedAppellF2 a b b' c c' x y =
      (1 - x) ^ (-a) * regularizedAppellF2 a (c - b) b' c c' (x / (x - 1)) (y / (1 - x)) := sorry

/-- **4.2** DLMF 16.16.1 on the component of the origin. -/
theorem regularizedAppellF1_reduction_16_16_1 (a b b' : ℂ) {x y : ℂ}
    (h : (x, y) ∈ connectedComponentIn
      {p | p ∈ appellDomain1 ∧ (1 - p.1) / (1 - p.2) ∈ slitPlane} 0) :
    regularizedAppellF1 a b b' (b + b') x y =
      (1 - y) ^ (-a) * 𝐅 a b (b + b') ((x - y) / (1 - y)) := sorry

/-- **4.2** DLMF 16.16.2 on the component of the origin. -/
theorem regularizedAppellF2_reduction_16_16_2 (a b b' c : ℂ) {x y : ℂ}
    (h : (x, y) ∈ connectedComponentIn
      {p | p ∈ appellDomain2 ∧ (1 - p.1 - p.2) / (1 - p.2) ∈ slitPlane} 0) :
    regularizedAppellF2 a b b' c b' x y =
      (Gamma b')⁻¹ * (1 - y) ^ (-a) * 𝐅 a b c (x / (1 - y)) := sorry

/-- **4.2** DLMF 16.16.3 on the component of the origin. -/
theorem regularizedAppellF2_reduction_16_16_3 (a b b' c : ℂ) {x y : ℂ}
    (h : (x, y) ∈ connectedComponentIn
      {p | p ∈ appellDomain2 ∧ (p.1, p.1 / (1 - p.2)) ∈ appellDomain1} 0) :
    regularizedAppellF2 a b b' c a x y =
      (Gamma a)⁻¹ * (1 - y) ^ (-b') * regularizedAppellF1 b (a - b') b' c x (x / (1 - y)) := sorry

/-- **4.2** DLMF 16.16.4 on `appellDomain1`. -/
theorem regularizedAppellF3_reduction_16_16_4 (a b b' c : ℂ) {x y : ℂ}
    (h : (x, y) ∈ appellDomain1) :
    regularizedAppellF3 a (c - a) b b' c x y =
      (1 - y) ^ (-b') * regularizedAppellF1 a b b' c x (y / (y - 1)) := sorry

/-- **4.2** DLMF 16.16.4 in DLMF's form. -/
theorem appellF3_reduction_16_16_4 (a b b' : ℂ) {c x y : ℂ} (hc : ∀ k : ℕ, c ≠ -k)
    (h : (x, y) ∈ appellDomain1) :
    appellF3 a (c - a) b b' c x y = (1 - y) ^ (-b') * appellF1 a b b' c x (y / (y - 1)) := sorry

/-- **4.2** DLMF 16.16.5 on the component of the origin. -/
theorem regularizedAppellF3_reduction_16_16_5 (a b c : ℂ) {x y : ℂ}
    (h : (x, y) ∈ connectedComponentIn
      {p | p ∈ appellDomain1 ∧ (1 - p.1) * (1 - p.2) ∈ slitPlane} 0) :
    regularizedAppellF3 a (c - a) b (c - b) c x y =
      (1 - y) ^ (a + b - c) * 𝐅 a b c (x + y - x * y) := sorry

/-! ### Layer 5: the function `F₄` -/

/-- **5.1** DLMF 16.16.7 (Burchnall–Chaundy) in regularized form. -/
theorem hasSum_regularizedAppellF4_burchnallChaundy (a b c c' : ℂ) {x y : ℂ}
    (h : (x, y) ∈ appellF4Polydisc) :
    HasSum (fun k : ℕ => poch(a, k) * poch(b, k) * poch(a + b - c - c' + 1, k) / k ! *
        x ^ k * y ^ k * 𝐅 (a + k) (b + k) (c + k) x * 𝐅 (a + k) (b + k) (c' + k) y)
      (regularizedAppellF4 a b c c' (x * (1 - y)) (y * (1 - x))) := sorry

/-- **5.1** DLMF 16.16.6. -/
theorem regularizedAppellF4_reduction_16_16_6 (a b c : ℂ) {x y : ℂ}
    (h : (x, y) ∈ appellF4Polydisc) :
    regularizedAppellF4 a b c (a + b - c + 1) (x * (1 - y)) (y * (1 - x)) =
      𝐅 a b c x * 𝐅 a b (a + b - c + 1) y := sorry

/-- **5.1** DLMF 16.16.5_5. -/
theorem regularizedAppellF4_reduction_16_16_5_5 (a b c : ℂ) {x y : ℂ}
    (h : (x, y) ∈ appellF4Polydisc) :
    regularizedAppellF4 a b c b (x * (1 - y)) (y * (1 - x)) =
      (Gamma b)⁻¹ * (1 - x) ^ (-a) * (1 - y) ^ (-a) *
        regularizedAppellF1 a (c - b) (a - c + 1) c (x / (x - 1)) (x * y / ((1 - x) * (1 - y))) :=
  sorry

/-- **5.2** DLMF 16.15.4 in regularized form. -/
theorem regularizedAppellF4_eq_eulerIntegral {a b c c' x y : ℂ} (h : (x, y) ∈ appellF4Polydisc)
    (ha : 0 < a.re) (hac : a.re < c.re) (hb : 0 < b.re) (hbc : b.re < c'.re) :
    regularizedAppellF4 a b c c' (x * (1 - y)) (y * (1 - x)) =
      appellF4EulerIntegral a b c c' x y := sorry

/-- **5.3** The fibre sum is `F₄` on the series domain. -/
theorem hasSum_appellF4Fibre (a b : ℂ) {c c' x y : ℂ} (hc : ∀ k : ℕ, c ≠ -k)
    (hc' : ∀ k : ℕ, c' ≠ -k) (h : (x, y) ∈ appellF4Domain) :
    HasSum (fun m : ℕ => poch(a, m) * poch(b, m) / (poch(c, m) * m !) * x ^ m *
        gaussHypergeometric (a + m) (b + m) c' y) (appellF4 a b c c' x y) := sorry

/-- **5.3** The fibre sum is analytic for large `y`. -/
theorem analyticOnNhd_appellF4Fibre (a b : ℂ) {c c' : ℂ} (hc : ∀ k : ℕ, c ≠ -k) :
    AnalyticOnNhd ℂ (fun p : ℂ × ℂ => appellF4Fibre a b c c' p.1 p.2)
      {p | -p.2 ∈ slitPlane ∧ √‖p.1‖ + 1 < √‖p.2‖} := sorry

/-- **5.3** The fibre sum converges and is analytic on an open set containing the segment from
`(0, 0)` to `(0, −2)`, which joins the series domain to the domain of 16.16.10. -/
theorem exists_isOpen_analyticOnNhd_appellF4Fibre (a b : ℂ) {c c' : ℂ} (hc : ∀ k : ℕ, c ≠ -k) :
    ∃ V : Set (ℂ × ℂ), IsOpen V ∧ (∀ t ∈ Icc (0 : ℝ) 2, ((0 : ℂ), -(t : ℂ)) ∈ V) ∧
      (∀ p ∈ V, Summable fun m : ℕ => poch(a, m) * poch(b, m) / (poch(c, m) * m !) * p.1 ^ m *
        gaussHypergeometric (a + m) (b + m) c' p.2) ∧
      AnalyticOnNhd ℂ (fun p : ℂ × ℂ => appellF4Fibre a b c c' p.1 p.2) V := sorry

/-- **5.3** DLMF 16.16.10 for the fibre sum. -/
theorem appellF4Fibre_connection_infty {a b c c' x y : ℂ} (hab : ∀ n : ℤ, a - b ≠ n)
    (hc : ∀ k : ℕ, c ≠ -k) (hc' : ∀ k : ℕ, c' ≠ -k) (hy : -y ∈ slitPlane)
    (hxy : √‖x‖ + 1 < √‖y‖) :
    appellF4Fibre a b c c' x y =
      Gamma c' * Gamma (b - a) * (Gamma (c' - a) * Gamma b)⁻¹ * (-y) ^ (-a) *
          appellF4 a (a - c' + 1) c (a - b + 1) (x / y) (1 / y) +
        Gamma c' * Gamma (a - b) * (Gamma (c' - b) * Gamma a)⁻¹ * (-y) ^ (-b) *
          appellF4 b (b - c' + 1) c (b - a + 1) (x / y) (1 / y) := sorry

end TauCetiRoadmap.SpecialFunctionsAppell
