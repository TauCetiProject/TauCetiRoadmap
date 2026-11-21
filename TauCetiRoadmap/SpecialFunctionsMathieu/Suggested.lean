module

public import Mathlib
public import TauCeti.Analysis.ODE.DysonSeries
public import TauCeti.Analysis.ODE.Wronskian
public import TauCeti.Analysis.Fourier.Decay
public import TauCeti.Analysis.Fourier.Uniqueness
public import TauCeti.Analysis.InnerProductSpace.Spectrum
public import TauCeti.Analysis.InnerProductSpace.HilbertSchmidt.Columns
public import TauCeti.Analysis.Analytic.Inverse
public import TauCeti.Analysis.Complex.Conformal.Rouche
public import TauCeti.Analysis.Polynomial.Puiseux.Monic
public import TauCeti.LinearAlgebra.Matrix.AbsoluteValue
public import TauCeti.LinearAlgebra.Matrix.Minor

/-!
# Mathieu functions and Hill's equation: target signatures

This file states, against the pinned Mathlib and Tau Ceti, the targets of `README.md` that
carry a Lean name, each with every conclusion the README attaches to it. It is not an exhaustive
acceptance test: the other targets of the README have the same standing, stated in prose.
Discharging this file finishes neither a layer nor the roadmap.

Every bold headline of the README is stated here, and so are the expansion theorem of README 6.1
and the exceptional sets of README 7.4. Of the prose targets without a Lean name, the
classification of the singular points of DLMF 28.2.2 (README 1.4: irregular at `∞` for `q ≠ 0`,
regular for `q = 0`) needs the notions of regular and irregular singular points of DLMF §2.7,
which AsymptoticExpansions does not define as predicates, the expansions in Mathieu functions
(README 6.3–6.4) and the integrals of README 8.5 beyond 28.28.11 need the Fourier-coefficient and
joining-factor families written out, and the continued Bessel evaluations other than `J_μ⟨L⟩`
(README Conventions) need local copies of their series; the other prose targets are statable
with the definitions below and are left to the README.

The definitions below are roadmap-local copies of the definitions `README.md` pins; in Tau Ceti
they live in the namespace `TauCeti`. They are stated with their intended bodies so that the
conventions are checked by the compiler: the basic solutions by their initial values, the
characteristic values as ordered real roots of the four boundary functions, the signs
`ce_n(0) > 0`, `se_n′(0) > 0`, `me_ν(0) > 0`, and the modified functions `M^{(j)}_ν` by their
Hankel behaviour at `+∞`. The Bessel functions `Y`, `H⁽¹⁾`, `H⁽²⁾` are local copies of the
definitions of SpecialFunctionsBessel (its Conventions and 1.2), with that roadmap's bodies;
`besselJLog` is the continued evaluation of README Conventions that the global expansions of
README 8.4 use. Theorems are stated with `sorry`. The section numbers in docstrings are those
of the README; equation numbers are DLMF's.
-/

@[expose] public section

noncomputable section

namespace TauCetiRoadmap.SpecialFunctionsMathieu

open Complex Filter Topology Set MeasureTheory intervalIntegral
open scoped Real Classical

/-! ## Shared conventions (README Conventions) -/

/-- The `m`-th smallest element of a set of reals, counted from `0`. Used only for sets that are
closed, discrete, bounded below and infinite. -/
def nthLeast (S : Set ℝ) : ℕ → ℝ
  | 0 => sInf S
  | m + 1 => sInf (S ∩ Ioi (nthLeast S m))

/-- Local copy of SpecialFunctionsBessel's `Y_ν(z)` (its Conventions and 1.2): DLMF 10.2.3 off
the integers and DLMF 10.2.4, `Y_n = π⁻¹ (∂_ν J_ν|_{ν=n} + (−1)ⁿ ∂_ν J_ν|_{ν=−n})`, at integer
order, with `(−1)ⁿ` written `cos(nπ)`. -/
def Complex.besselY (ν z : ℂ) : ℂ :=
  if ∃ n : ℤ, (n : ℂ) = ν then
    (deriv (fun μ => besselJ μ z) ν + Complex.cos (ν * π) * deriv (fun μ => besselJ μ z) (-ν)) /
      (π : ℂ)
  else (besselJ ν z * Complex.cos (ν * π) - besselJ (-ν) z) / Complex.sin (ν * π)

/-- Local copy of SpecialFunctionsBessel's Hankel function `H⁽¹⁾_ν = J_ν + i Y_ν` (its
Conventions; DLMF 10.4.3). -/
def Complex.hankelH1 (ν z : ℂ) : ℂ := besselJ ν z + I * Complex.besselY ν z

/-- Local copy of SpecialFunctionsBessel's Hankel function `H⁽²⁾_ν = J_ν − i Y_ν` (its
Conventions; DLMF 10.4.3). -/
def Complex.hankelH2 (ν z : ℂ) : ℂ := besselJ ν z - I * Complex.besselY ν z

/-- The continued evaluation `J_μ⟨L⟩` of README Conventions: `J_μ` at `e^L`, continued along the
logarithm `L` of its argument. Mathlib's `besselJ μ x = (x/2)^μ · G(x²)` with `G` entire, and the
factor `exp (μ (L − log e^L))` replaces the principal branch of `(x/2)^μ` by `exp (μ (L − log 2))`.
It agrees with `besselJ μ (exp L)` when `|Im L| < π`. `Y`, `H`, `I`, `K` are continued in the
same way in README. -/
def besselJLog (μ L : ℂ) : ℂ :=
  cexp (μ * (L - Complex.log (cexp L))) * besselJ μ (cexp L)

/-- README Conventions: `L ↦ J_μ⟨L⟩` is entire, so the global identities of README 8.4 can use
it. -/
theorem differentiable_besselJLog (μ : ℂ) : Differentiable ℂ (besselJLog μ) := by
  sorry

/-! ## Layer 1: periodic equations and their basic solutions -/

/-- `w` solves Hill's equation `w″ + (λ + Q(x)) w = 0` (DLMF 28.29.1) on `ℝ`. -/
def IsHillSolution (Q : ℝ → ℝ) (lam : ℂ) (w : ℝ → ℂ) : Prop :=
  ContDiff ℝ 2 w ∧ ∀ x, deriv (deriv w) x + (lam + Q x) * w x = 0

/-- The basic solution `w_I(x, λ)` of Hill's equation: `w(0) = 1`, `w′(0) = 0`. -/
def hillWI (Q : ℝ → ℝ) (lam : ℂ) : ℝ → ℂ :=
  if h : ∃ w, IsHillSolution Q lam w ∧ w 0 = 1 ∧ deriv w 0 = 0 then h.choose else 0

/-- The basic solution `w_II(x, λ)` of Hill's equation: `w(0) = 0`, `w′(0) = 1`. -/
def hillWII (Q : ℝ → ℝ) (lam : ℂ) : ℝ → ℂ :=
  if h : ∃ w, IsHillSolution Q lam w ∧ w 0 = 0 ∧ deriv w 0 = 1 then h.choose else 0

variable {Q : ℝ → ℝ}

/-- README 1.1: the complex Wronskian of the basic solutions is `1`; periodicity is not
needed. -/
theorem hillWI_mul_deriv_hillWII_sub (hQ : Continuous Q) (lam : ℂ) (x : ℝ) :
    hillWI Q lam x * deriv (hillWII Q lam) x - deriv (hillWI Q lam) x * hillWII Q lam x = 1 := by
  sorry

/-- `w` is an entire solution of Mathieu's equation `w″ + (a − 2q cos 2z) w = 0` (DLMF 28.2.1). -/
def IsMathieuSolution (a q : ℂ) (w : ℂ → ℂ) : Prop :=
  Differentiable ℂ w ∧ ∀ z, deriv (deriv w) z + (a - 2 * q * Complex.cos (2 * z)) * w z = 0

/-- The basic solution `w_I(z; a, q)`: `w(0) = 1`, `w′(0) = 0` (DLMF 28.2.5). -/
def mathieuWI (a q : ℂ) : ℂ → ℂ :=
  if h : ∃ w, IsMathieuSolution a q w ∧ w 0 = 1 ∧ deriv w 0 = 0 then h.choose else 0

/-- The basic solution `w_II(z; a, q)`: `w(0) = 0`, `w′(0) = 1` (DLMF 28.2.5). -/
def mathieuWII (a q : ℂ) : ℂ → ℂ :=
  if h : ∃ w, IsMathieuSolution a q w ∧ w 0 = 0 ∧ deriv w 0 = 1 then h.choose else 0

/-- README 1.2: `w_I` and `w_II` are entire in `(z, a, q)` jointly. -/
theorem analyticOnNhd_mathieuWI :
    AnalyticOnNhd ℂ (fun p : ℂ × ℂ × ℂ => mathieuWI p.2.1 p.2.2 p.1) univ ∧
      AnalyticOnNhd ℂ (fun p : ℂ × ℂ × ℂ => mathieuWII p.2.1 p.2.2 p.1) univ := by
  sorry

/-- DLMF 28.2.16, second equality: `w_I(π; a, q) = w_I(π; a, −q)`. -/
theorem mathieuWI_pi_neg (a q : ℂ) : mathieuWI a (-q) π = mathieuWI a q π := by
  sorry

/-- `w` is an entire solution of the modified equation `w″ − (a − 2q cosh 2z) w = 0`
(DLMF 28.20.1). -/
def IsModifiedMathieuSolution (a q : ℂ) (w : ℂ → ℂ) : Prop :=
  Differentiable ℂ w ∧ ∀ z, deriv (deriv w) z - (a - 2 * q * Complex.cosh (2 * z)) * w z = 0

/-- README 1.4, the conformal Laplacian: for `φ` holomorphic at `w` and `f` of class `C²` near
`φ(w)`, `Δ(f ∘ φ)(w) = |φ′(w)|² (Δf)(φ(w))`. -/
theorem laplacian_comp_of_analyticAt {φ f : ℂ → ℂ} {w : ℂ} (hφ : AnalyticAt ℂ φ w)
    (hf : ContDiffAt ℝ 2 f (φ w)) :
    Laplacian.laplacian (f ∘ φ) w =
      ((‖deriv φ w‖ ^ 2 : ℝ) : ℂ) * Laplacian.laplacian f (φ w) := by
  sorry

/-- README 1.4: if `X` solves the modified equation and `Θ` Mathieu's equation, then
`F(ξ + iη) = X(ξ) Θ(η)` satisfies `ΔF + 4q |sinh(ξ + iη)|² F = 0`. -/
theorem laplacian_mul_mathieu {a q : ℂ} {X Θ : ℂ → ℂ} (hX : IsModifiedMathieuSolution a q X)
    (hΘ : IsMathieuSolution a q Θ) (w : ℂ) :
    Laplacian.laplacian (fun w : ℂ => X w.re * Θ w.im) w +
      4 * q * ((‖Complex.sinh w‖ ^ 2 : ℝ) : ℂ) * (X w.re * Θ w.im) = 0 := by
  sorry

/-- README 1.4, the Helmholtz equation: with `q = c²k²/4`, a function `f` of class `C²` near
`c cosh w₀` with `f(c cosh w) = X(Re w) Θ(Im w)` near `w₀`, where `sinh w₀ ≠ 0`, satisfies
`Δf + k² f = 0` at `c cosh w₀`. -/
theorem laplacian_add_sq_mul_of_mathieu {a : ℂ} {c k : ℝ} (hc : 0 < c) {X Θ : ℂ → ℂ}
    (hX : IsModifiedMathieuSolution a ((c ^ 2 * k ^ 2 / 4 : ℝ) : ℂ) X)
    (hΘ : IsMathieuSolution a ((c ^ 2 * k ^ 2 / 4 : ℝ) : ℂ) Θ) {f : ℂ → ℂ} {w₀ : ℂ}
    (hw₀ : Complex.sinh w₀ ≠ 0) (hf : ContDiffAt ℝ 2 f (c * Complex.cosh w₀))
    (hfX : ∀ᶠ w in 𝓝 w₀, f (c * Complex.cosh w) = X w.re * Θ w.im) :
    Laplacian.laplacian f (c * Complex.cosh w₀) + (k : ℂ) ^ 2 * f (c * Complex.cosh w₀) = 0 := by
  sorry

/-- README 1.4, DLMF 28.2.2: if `w` solves Mathieu's equation and `g` is a holomorphic inverse of
`z ↦ sin² z` on an open `U`, then `u = w ∘ g` solves
`ζ(1 − ζ) u″ + ½(1 − 2ζ) u′ + ¼(a − 2q(1 − 2ζ)) u = 0` on `U`. -/
theorem mathieu_sin_sq_form {a q : ℂ} {w : ℂ → ℂ} (hw : IsMathieuSolution a q w) {U : Set ℂ}
    (hU : IsOpen U) {g : ℂ → ℂ} (hg : DifferentiableOn ℂ g U)
    (hgU : ∀ ζ ∈ U, Complex.sin (g ζ) ^ 2 = ζ) (ζ : ℂ) (hζ : ζ ∈ U) :
    ζ * (1 - ζ) * deriv (deriv (w ∘ g)) ζ + (1 - 2 * ζ) / 2 * deriv (w ∘ g) ζ +
      (a - 2 * q * (1 - 2 * ζ)) / 4 * (w ∘ g) ζ = 0 := by
  sorry

/-- README 1.4, DLMF 28.2.3: the same with `ζ = cos z`:
`(1 − ζ²) u″ − ζ u′ + (a + 2q − 4qζ²) u = 0`. -/
theorem mathieu_cos_form {a q : ℂ} {w : ℂ → ℂ} (hw : IsMathieuSolution a q w) {U : Set ℂ}
    (hU : IsOpen U) {g : ℂ → ℂ} (hg : DifferentiableOn ℂ g U)
    (hgU : ∀ ζ ∈ U, Complex.cos (g ζ) = ζ) (ζ : ℂ) (hζ : ζ ∈ U) :
    (1 - ζ ^ 2) * deriv (deriv (w ∘ g)) ζ - ζ * deriv (w ∘ g) ζ +
      (a + 2 * q - 4 * q * ζ ^ 2) * (w ∘ g) ζ = 0 := by
  sorry

/-- README 1.4, DLMF 28.20.2: if `w` solves the modified equation and `g` is a holomorphic
inverse of `cosh` on an open `U`, then `u = w ∘ g` solves
`(ζ² − 1) u″ + ζ u′ + (4qζ² − 2q − a) u = 0` on `U`. -/
theorem modifiedMathieu_cosh_form {a q : ℂ} {w : ℂ → ℂ} (hw : IsModifiedMathieuSolution a q w)
    {U : Set ℂ} (hU : IsOpen U) {g : ℂ → ℂ} (hg : DifferentiableOn ℂ g U)
    (hgU : ∀ ζ ∈ U, Complex.cosh (g ζ) = ζ) (ζ : ℂ) (hζ : ζ ∈ U) :
    (ζ ^ 2 - 1) * deriv (deriv (w ∘ g)) ζ + ζ * deriv (w ∘ g) ζ +
      (4 * q * ζ ^ 2 - 2 * q - a) * (w ∘ g) ζ = 0 := by
  sorry

/-! ## Layer 2: Floquet theory, Hill's determinant and stability -/

/-- The discriminant `Δ(λ) = w_I(π, λ) + w_II′(π, λ)` (DLMF 28.29.15). -/
def hillDiscriminant (Q : ℝ → ℝ) (lam : ℂ) : ℂ :=
  hillWI Q lam π + deriv (hillWII Q lam) π

/-- DLMF 28.29.7–28.29.9: a Floquet solution with multiplier `e^{iπν}` exists iff
`2 cos πν = Δ(λ)`. -/
theorem exists_hillFloquet_iff (hQ : Continuous Q) (hper : Function.Periodic Q π) (lam ν : ℂ) :
    (∃ w, IsHillSolution Q lam w ∧ w ≠ 0 ∧ ∀ x, w (x + π) = cexp (π * I * ν) * w x) ↔
      2 * Complex.cos (π * ν) = hillDiscriminant Q lam := by
  sorry

/-- DLMF 28.2.14–28.2.16: a Floquet solution for `ν` exists iff `cos πν = w_I(π; a, q)`. -/
theorem exists_mathieuFloquet_iff (a q ν : ℂ) :
    (∃ w, IsMathieuSolution a q w ∧ w ≠ 0 ∧ ∀ z, w (z + π) = cexp (π * I * ν) * w z) ↔
      Complex.cos (π * ν) = mathieuWI a q π := by
  sorry

/-- README 2.3: the truncated Hill determinant
`det[δ_{mn} − q(δ_{m,n+1} + δ_{m,n−1})/(a − 4m²)]_{|m|, |n| ≤ N}`, row `i` carrying `m = i − N`. -/
def mathieuHillDet (a q : ℂ) (N : ℕ) : ℂ :=
  Matrix.det (Matrix.of fun i j : Fin (2 * N + 1) =>
    (if i = j then 1 else 0) -
      (if (i : ℕ) = j + 1 ∨ (j : ℕ) = i + 1 then
        q / (a - 4 * (((i : ℤ) - N : ℤ) : ℂ) ^ 2) else 0))

/-- README 2.3, infinite determinants: for `B` on `ℤ × ℤ` with `∑ |B_{mn}| < ∞`, the determinants
of `1 + B` on `[−N, N]²` converge, and the limit is the sum of all principal minors of `B` (the
empty minor being `1`). -/
theorem tendsto_det_one_add_of_summable (B : ℤ → ℤ → ℂ)
    (hB : Summable fun p : ℤ × ℤ => ‖B p.1 p.2‖) :
    ∃ D : ℂ, Tendsto (fun N : ℕ => Matrix.det (Matrix.of fun i j : Finset.Icc (-(N : ℤ)) N =>
        (if i = j then 1 else 0) + B i j)) atTop (𝓝 D) ∧
      HasSum (fun s : Finset ℤ => Matrix.det (Matrix.of fun i j : s => B i j)) D := by
  sorry

/-- README 2.3, Hill's formula: the truncated determinants converge to `D(a, q)` for
`a ∉ {4m²}`; `D(·, q)` is holomorphic off `{4m²}` and meromorphic at each `4m²`;
`w_I(π; a, q) = 1 − D(a, q)(1 − cos π√a)`, and `sin²(πν/2) = D(a, q) sin²(π√a/2)` for every
characteristic exponent `ν`. -/
theorem tendsto_mathieuHillDet (q : ℂ) :
    ∃ D : ℂ → ℂ, DifferentiableOn ℂ D {a | ∀ m : ℤ, a ≠ 4 * (m : ℂ) ^ 2} ∧
      (∀ m : ℤ, MeromorphicAt D (4 * (m : ℂ) ^ 2)) ∧
      ∀ a : ℂ, (∀ m : ℤ, a ≠ 4 * (m : ℂ) ^ 2) →
        Tendsto (mathieuHillDet a q) atTop (𝓝 (D a)) ∧
        mathieuWI a q π = 1 - D a * (1 - Complex.cos (π * a ^ (1 / 2 : ℂ))) ∧
        ∀ ν : ℂ, Complex.cos (π * ν) = mathieuWI a q π →
          Complex.sin (π * ν / 2) ^ 2 = D a * Complex.sin (π * a ^ (1 / 2 : ℂ) / 2) ^ 2 := by
  sorry

/-- Ince's theorem (DLMF §28.5(i)): for `q ≠ 0`, two solutions of period `2π` are dependent. -/
theorem ince_theorem {a q : ℂ} (hq : q ≠ 0) {w₁ w₂ : ℂ → ℂ}
    (h₁ : IsMathieuSolution a q w₁) (h₂ : IsMathieuSolution a q w₂)
    (p₁ : Function.Periodic w₁ (2 * π)) (p₂ : Function.Periodic w₂ (2 * π)) :
    ∃ c₁ c₂ : ℂ, (c₁, c₂) ≠ (0, 0) ∧ ∀ z, c₁ * w₁ z + c₂ * w₂ z = 0 := by
  sorry

/-! ## Layer 3: spectral theory on one period -/

/-- README 3.2, growth: `Δ` is entire, and `|Δ(λ) − 2 cos π√λ| ≤ C e^{π|Im √λ|}/|√λ|` for
`|λ| ≥ 1`; periodicity is not needed. -/
theorem hillDiscriminant_growth (hQ : Continuous Q) :
    Differentiable ℂ (hillDiscriminant Q) ∧
      ∃ C : ℝ, ∀ lam : ℂ, 1 ≤ ‖lam‖ →
        ‖hillDiscriminant Q lam - 2 * Complex.cos (π * lam ^ (1 / 2 : ℂ))‖ ≤
          C * Real.exp (π * |(lam ^ (1 / 2 : ℂ)).im|) / ‖lam ^ (1 / 2 : ℂ)‖ := by
  sorry

/-- README 3.2, the variation formula for `Δ′(λ)`; periodicity is not needed. -/
theorem deriv_hillDiscriminant (hQ : Continuous Q) (lam : ℂ) :
    deriv (hillDiscriminant Q) lam =
      -∫ x in (0 : ℝ)..π, (hillWII Q lam π * hillWI Q lam x ^ 2 +
        (deriv (hillWII Q lam) π - hillWI Q lam π) * hillWI Q lam x * hillWII Q lam x -
        deriv (hillWI Q lam) π * hillWII Q lam x ^ 2) := by
  sorry

/-- README 3.2, monotonicity on the bands: for real `λ`, `Δ′(λ) ≠ 0` where `|Δ(λ)| < 2`;
`±Δ″(λ) < 0` where `Δ(λ) = ±2` and `Δ′(λ) = 0`; and `Δ(λ) → +∞` as `λ → −∞`. -/
theorem hillDiscriminant_band (hQ : Continuous Q) (hper : Function.Periodic Q π) :
    (∀ lam : ℝ, ‖hillDiscriminant Q lam‖ < 2 → deriv (hillDiscriminant Q) lam ≠ 0) ∧
      (∀ lam : ℝ, hillDiscriminant Q lam = 2 → deriv (hillDiscriminant Q) lam = 0 →
        (iteratedDeriv 2 (hillDiscriminant Q) lam).re < 0) ∧
      (∀ lam : ℝ, hillDiscriminant Q lam = -2 → deriv (hillDiscriminant Q) lam = 0 →
        0 < (iteratedDeriv 2 (hillDiscriminant Q) lam).re) ∧
      Tendsto (fun lam : ℝ => (hillDiscriminant Q lam).re) atBot atTop := by
  sorry

/-- The number of real roots `≤ t` of `f`, counted with multiplicity. -/
def realRootCount (f : ℂ → ℂ) (t : ℝ) : ℕ :=
  ∑ᶠ x ∈ {x : ℝ | x ≤ t}, analyticOrderNatAt f (x : ℂ)

/-- `λ_n`: the `n`-th root of `Δ − 2`, with multiplicity, counted from `0` (DLMF 28.29.16). -/
def hillPeriodicEigenvalue (Q : ℝ → ℝ) (n : ℕ) : ℝ :=
  sInf {t : ℝ | n + 1 ≤ realRootCount (fun lam => hillDiscriminant Q lam - 2) t}

/-- `μ_{n+1}`: the `n`-th root of `Δ + 2`, with multiplicity, counted from `0` (DLMF 28.29.17). -/
def hillAntiperiodicEigenvalue (Q : ℝ → ℝ) (n : ℕ) : ℝ :=
  sInf {t : ℝ | n + 1 ≤ realRootCount (fun lam => hillDiscriminant Q lam + 2) t}

/-- DLMF 28.29.18: `λ₀ < μ₁ ≤ μ₂ < λ₁ ≤ λ₂ < μ₃ ≤ ⋯`, with `μ_{n+1}` written
`hillAntiperiodicEigenvalue Q n`. -/
theorem hill_interlacing (hQ : Continuous Q) (hper : Function.Periodic Q π) (m : ℕ) :
    hillPeriodicEigenvalue Q (2 * m) < hillAntiperiodicEigenvalue Q (2 * m) ∧
      hillAntiperiodicEigenvalue Q (2 * m) ≤ hillAntiperiodicEigenvalue Q (2 * m + 1) ∧
      hillAntiperiodicEigenvalue Q (2 * m + 1) < hillPeriodicEigenvalue Q (2 * m + 1) ∧
      hillPeriodicEigenvalue Q (2 * m + 1) ≤ hillPeriodicEigenvalue Q (2 * m + 2) := by
  sorry

/-- README 3.3, the eigenvalues: the roots of `Δ ∓ 2` are real and at most double; a root is
double iff every solution is periodic (antiperiodic); Hill's equation has a nontrivial solution of
period (antiperiod) `π` iff `λ` is some `λ_n` (`μ_{n+1}`); and `λ_n, μ_n → ∞`. -/
theorem hill_eigenvalues (hQ : Continuous Q) (hper : Function.Periodic Q π) :
    (∀ lam : ℂ, hillDiscriminant Q lam = 2 → lam.im = 0 ∧
      analyticOrderNatAt (fun μ => hillDiscriminant Q μ - 2) lam ≤ 2) ∧
    (∀ lam : ℂ, hillDiscriminant Q lam = -2 → lam.im = 0 ∧
      analyticOrderNatAt (fun μ => hillDiscriminant Q μ + 2) lam ≤ 2) ∧
    (∀ lam : ℂ, hillDiscriminant Q lam = 2 →
      (analyticOrderNatAt (fun μ => hillDiscriminant Q μ - 2) lam = 2 ↔
        ∀ w, IsHillSolution Q lam w → ∀ x, w (x + π) = w x)) ∧
    (∀ lam : ℂ, hillDiscriminant Q lam = -2 →
      (analyticOrderNatAt (fun μ => hillDiscriminant Q μ + 2) lam = 2 ↔
        ∀ w, IsHillSolution Q lam w → ∀ x, w (x + π) = -w x)) ∧
    (∀ lam : ℂ, (∃ w, IsHillSolution Q lam w ∧ w ≠ 0 ∧ ∀ x, w (x + π) = w x) ↔
      ∃ n, (hillPeriodicEigenvalue Q n : ℂ) = lam) ∧
    (∀ lam : ℂ, (∃ w, IsHillSolution Q lam w ∧ w ≠ 0 ∧ ∀ x, w (x + π) = -w x) ↔
      ∃ n, (hillAntiperiodicEigenvalue Q n : ℂ) = lam) ∧
    Tendsto (hillPeriodicEigenvalue Q) atTop atTop ∧
    Tendsto (hillAntiperiodicEigenvalue Q) atTop atTop := by
  sorry

/-- `ν_{k+1}`: the `k`-th eigenvalue, counted from `0`, of `w(0) = w(π) = 0`, that is the `k`-th
real root of `w_II(π, ·)`. -/
def hillDirichletEigenvalue (Q : ℝ → ℝ) (k : ℕ) : ℝ :=
  nthLeast {lam : ℝ | hillWII Q lam π = 0} k

/-- `τ_k`: the `k`-th eigenvalue, counted from `0`, of `w′(0) = w′(π) = 0`, that is the `k`-th
real root of `w_I′(π, ·)`. -/
def hillNeumannEigenvalue (Q : ℝ → ℝ) (k : ℕ) : ℝ :=
  nthLeast {lam : ℝ | deriv (hillWI Q lam) π = 0} k

/-- README 3.3, the gaps: `τ₀ ≤ λ₀`; the gap `[μ_{2m+1}, μ_{2m+2}]` contains `ν_{2m+1}` and
`τ_{2m+1}`, and the gap `[λ_{2m+1}, λ_{2m+2}]` contains `ν_{2m+2}` and `τ_{2m+2}`. -/
theorem hill_gaps (hQ : Continuous Q) (hper : Function.Periodic Q π) :
    hillNeumannEigenvalue Q 0 ≤ hillPeriodicEigenvalue Q 0 ∧
      ∀ m : ℕ,
        hillDirichletEigenvalue Q (2 * m) ∈
            Icc (hillAntiperiodicEigenvalue Q (2 * m)) (hillAntiperiodicEigenvalue Q (2 * m + 1)) ∧
          hillNeumannEigenvalue Q (2 * m + 1) ∈
            Icc (hillAntiperiodicEigenvalue Q (2 * m)) (hillAntiperiodicEigenvalue Q (2 * m + 1)) ∧
          hillDirichletEigenvalue Q (2 * m + 1) ∈
            Icc (hillPeriodicEigenvalue Q (2 * m + 1)) (hillPeriodicEigenvalue Q (2 * m + 2)) ∧
          hillNeumannEigenvalue Q (2 * m + 2) ∈
            Icc (hillPeriodicEigenvalue Q (2 * m + 1)) (hillPeriodicEigenvalue Q (2 * m + 2)) := by
  sorry

/-- README 3.3, zeros: an eigenfunction for `λ₀` has no zeros on `[0, π]`; real eigenfunctions for
`λ_{2m+1}`, `λ_{2m+2}` have exactly `2m + 2` zeros in `[0, π)`, and those for `μ_{2m+1}`,
`μ_{2m+2}` exactly `2m + 1`. -/
theorem hill_zeros (hQ : Continuous Q) (hper : Function.Periodic Q π) :
    (∀ w, IsHillSolution Q (hillPeriodicEigenvalue Q 0) w → w ≠ 0 → (∀ x, w (x + π) = w x) →
      ∀ x ∈ Icc 0 π, w x ≠ 0) ∧
    (∀ m : ℕ, ∀ n ∈ ({2 * m + 1, 2 * m + 2} : Set ℕ), ∀ w,
      IsHillSolution Q (hillPeriodicEigenvalue Q n) w → w ≠ 0 → (∀ x, w (x + π) = w x) →
      (∀ x, (w x).im = 0) → {x ∈ Ico 0 π | w x = 0}.ncard = 2 * m + 2) ∧
    (∀ m : ℕ, ∀ n ∈ ({2 * m, 2 * m + 1} : Set ℕ), ∀ w,
      IsHillSolution Q (hillAntiperiodicEigenvalue Q n) w → w ≠ 0 → (∀ x, w (x + π) = -w x) →
      (∀ x, (w x).im = 0) → {x ∈ Ico 0 π | w x = 0}.ncard = 2 * m + 1) := by
  sorry

/-- `a_n(q)` for real `q` (Table 28.2.1, 28.2.21): the `⌊n/2⌋`-th real root of `w_I′(π/2; ·, q)`
for even `n`, of `w_I(π/2; ·, q)` for odd `n`. -/
def mathieuA (n : ℕ) (q : ℝ) : ℝ :=
  if Even n then nthLeast {a : ℝ | deriv (mathieuWI a q) (π / 2) = 0} (n / 2)
  else nthLeast {a : ℝ | mathieuWI a q (π / 2) = 0} (n / 2)

/-- `b_n(q)` for real `q` and `n ≥ 1` (Table 28.2.1, 28.2.22); `b_0 = 0` by convention. -/
def mathieuB (n : ℕ) (q : ℝ) : ℝ :=
  if n = 0 then 0
  else if Odd n then nthLeast {a : ℝ | deriv (mathieuWII a q) (π / 2) = 0} ((n - 1) / 2)
  else nthLeast {a : ℝ | mathieuWII a q (π / 2) = 0} ((n - 1) / 2)

/-- DLMF 28.2.27: `a_{2n+1}(−q) = b_{2n+1}(q)`. -/
theorem mathieuA_odd_neg (n : ℕ) (q : ℝ) : mathieuA (2 * n + 1) (-q) = mathieuB (2 * n + 1) q := by
  sorry

/-- README 3.4, weak ordering: for `Q(x) = −2q cos 2x`, `λ₀ = a₀(q)`, `{λ_{2m+1}, λ_{2m+2}}` is
`{a_{2m+2}(q), b_{2m+2}(q)}` and `{μ_{2m+1}, μ_{2m+2}}` is `{a_{2m+1}(q), b_{2m+1}(q)}`, in
increasing order; and `a_n(q) ≠ b_n(q)` for `q ≠ 0`, `n ≥ 1`. -/
theorem hillEigenvalue_mathieu (q : ℝ) :
    let Q : ℝ → ℝ := fun x => -2 * q * Real.cos (2 * x)
    hillPeriodicEigenvalue Q 0 = mathieuA 0 q ∧
      (∀ m : ℕ,
        hillPeriodicEigenvalue Q (2 * m + 1) =
          min (mathieuA (2 * m + 2) q) (mathieuB (2 * m + 2) q) ∧
        hillPeriodicEigenvalue Q (2 * m + 2) =
          max (mathieuA (2 * m + 2) q) (mathieuB (2 * m + 2) q) ∧
        hillAntiperiodicEigenvalue Q (2 * m) =
          min (mathieuA (2 * m + 1) q) (mathieuB (2 * m + 1) q) ∧
        hillAntiperiodicEigenvalue Q (2 * m + 1) =
          max (mathieuA (2 * m + 1) q) (mathieuB (2 * m + 1) q)) ∧
      (q ≠ 0 → ∀ n : ℕ, 1 ≤ n → mathieuA n q ≠ mathieuB n q) := by
  sorry

/-- `λ_ν(q)` for real `ν` and `q` (DLMF 28.12): for `ν ∉ ℤ` the `⌊|ν|⌋`-th real root of
`w_I(π; ·, q) = cos πν`; `λ_m = a_m` for `m ≥ 0` and `λ_m = b_{−m}` for `m < 0` (28.12.3). -/
def mathieuLambda (ν q : ℝ) : ℝ :=
  if ∃ m : ℤ, (m : ℝ) = ν then
    (if 0 ≤ ν then mathieuA ⌊ν⌋₊ q else mathieuB ⌊-ν⌋₊ q)
  else nthLeast {a : ℝ | mathieuWI a q π = Real.cos (π * ν)} ⌊|ν|⌋₊

/-! ## Layer 4: eigenfunctions and their Fourier series -/

/-- `ce_n(0, q) = (π / ∫₀^{2π} w_I²)^{1/2} > 0`. -/
def mathieuCeZero (n : ℕ) (q : ℝ) : ℝ :=
  √(π / ∫ x in (0 : ℝ)..2 * π, ‖mathieuWI (mathieuA n q) q x‖ ^ 2)

/-- `se_n′(0, q) = (π / ∫₀^{2π} w_II²)^{1/2} > 0`. -/
def mathieuSeDerivZero (n : ℕ) (q : ℝ) : ℝ :=
  √(π / ∫ x in (0 : ℝ)..2 * π, ‖mathieuWII (mathieuB n q) q x‖ ^ 2)

/-- `ce_n(z, q) = ce_n(0, q) w_I(z; a_n(q), q)` (DLMF 28.2.38, normalization 28.2.30). -/
def mathieuCe (n : ℕ) (q : ℝ) (z : ℂ) : ℂ :=
  mathieuCeZero n q * mathieuWI (mathieuA n q) q z

/-- `se_n(z, q) = se_n′(0, q) w_II(z; b_n(q), q)` (DLMF 28.2.39); `se_0 = 0`. -/
def mathieuSe (n : ℕ) (q : ℝ) (z : ℂ) : ℂ :=
  if n = 0 then 0 else mathieuSeDerivZero n q * mathieuWII (mathieuB n q) q z

/-- DLMF 28.2.30: `∫₀^{2π} ce_n² = ∫₀^{2π} se_n² = π` (`n ≥ 1` for `se_n`). -/
theorem integral_mathieuCe_sq (n : ℕ) (q : ℝ) :
    ∫ x in (0 : ℝ)..2 * π, mathieuCe n q x ^ 2 = π ∧
      (1 ≤ n → ∫ x in (0 : ℝ)..2 * π, mathieuSe n q x ^ 2 = π) := by
  sorry

/-- DLMF 28.2.31–28.2.33: orthogonality on `[0, 2π]`. -/
theorem integral_mathieuCe_mul (q : ℝ) :
    (∀ m n : ℕ, m ≠ n → ∫ x in (0 : ℝ)..2 * π, mathieuCe m q x * mathieuCe n q x = 0) ∧
      (∀ m n : ℕ, m ≠ n → ∫ x in (0 : ℝ)..2 * π, mathieuSe m q x * mathieuSe n q x = 0) ∧
      ∀ m n : ℕ, ∫ x in (0 : ℝ)..2 * π, mathieuCe m q x * mathieuSe n q x = 0 := by
  sorry

/-- DLMF 28.2.34: `ce_{2n}(z, −q) = (−1)ⁿ ce_{2n}(π/2 − z, q)`. -/
theorem mathieuCe_even_neg (n : ℕ) (q : ℝ) (z : ℂ) :
    mathieuCe (2 * n) (-q) z = (-1) ^ n * mathieuCe (2 * n) q (π / 2 - z) := by
  sorry

/-- DLMF §28.9: for real `q`, each of `ce_{2n}`, `se_{2n+1}`, `ce_{2n+1}`, `se_{2n+2}` has exactly
`n` zeros in `(0, π/2)`. -/
theorem ncard_zeros_mathieuCe_even (n : ℕ) (q : ℝ) :
    {x : ℝ | x ∈ Ioo 0 (π / 2) ∧ mathieuCe (2 * n) q x = 0}.ncard = n ∧
      {x : ℝ | x ∈ Ioo 0 (π / 2) ∧ mathieuSe (2 * n + 1) q x = 0}.ncard = n ∧
      {x : ℝ | x ∈ Ioo 0 (π / 2) ∧ mathieuCe (2 * n + 1) q x = 0}.ncard = n ∧
      {x : ℝ | x ∈ Ioo 0 (π / 2) ∧ mathieuSe (2 * n + 2) q x = 0}.ncard = n := by
  sorry

/-- `A^n_k(q)`: the cosine coefficients of `ce_n(·, q)`, with `A^n_0` the mean (DLMF 28.4.1–2). -/
def mathieuFourierA (n k : ℕ) (q : ℝ) : ℝ :=
  if k = 0 then (1 / (2 * π)) * ∫ x in (0 : ℝ)..2 * π, (mathieuCe n q x).re
  else (1 / π) * ∫ x in (0 : ℝ)..2 * π, (mathieuCe n q x).re * Real.cos (k * x)

/-- `B^n_k(q)`: the sine coefficients of `se_n(·, q)` (DLMF 28.4.3–28.4.4). -/
def mathieuFourierB (n k : ℕ) (q : ℝ) : ℝ :=
  (1 / π) * ∫ x in (0 : ℝ)..2 * π, (mathieuSe n q x).re * Real.sin (k * x)

/-- DLMF 28.4.1: `ce_{2n}(z, q) = ∑ₘ A^{2n}_{2m}(q) cos 2mz` for all complex `z`. -/
theorem hasSum_mathieuCe_even (n : ℕ) (q : ℝ) (z : ℂ) :
    HasSum (fun m : ℕ => (mathieuFourierA (2 * n) (2 * m) q : ℂ) * Complex.cos (2 * m * z))
      (mathieuCe (2 * n) q z) := by
  sorry

/-- DLMF 28.4.4: `se_{2n+2}(z, q) = ∑ₘ B^{2n+2}_{2m+2}(q) sin (2m + 2)z` for all complex `z`. -/
theorem hasSum_mathieuSe_even (n : ℕ) (q : ℝ) (z : ℂ) :
    HasSum (fun m : ℕ =>
        (mathieuFourierB (2 * n + 2) (2 * m + 2) q : ℂ) * Complex.sin ((2 * m + 2) * z))
      (mathieuSe (2 * n + 2) q z) := by
  sorry

/-- `t_n(q) = (−1)ⁿ w_II(π; a_n(q), q) / (π ce_n(0, q))`, nonzero for `q ≠ 0`. -/
def mathieuFeT (n : ℕ) (q : ℝ) : ℝ :=
  (-1) ^ n * (mathieuWII (mathieuA n q) q π).re / (π * mathieuCeZero n q)

/-- `f_n(z, q) = w_II(z; a_n(q), q)/t_n(q) − z ce_n(z, q)` for `q ≠ 0` (DLMF 28.5.1), and
`f_n(·, 0) = 0` (README Conventions; for `n ≥ 1` the formula would divide by `t_n(0) = 0`). -/
def mathieuFeF (n : ℕ) (q : ℝ) (z : ℂ) : ℂ :=
  if q = 0 then 0 else mathieuWII (mathieuA n q) q z / mathieuFeT n q - z * mathieuCe n q z

/-- `C_n(q)` (DLMF 28.5.5), with the sign of `t_n(q)`, so that `fe_n′(0, q) > 0`; at `q = 0`,
`C_0(0) = √2` and `C_n(0) = 0` for `n ≥ 1`. -/
def mathieuFeC (n : ℕ) (q : ℝ) : ℝ :=
  if q = 0 then (if n = 0 then √2 else 0)
  else SignType.sign (mathieuFeT n q) *
    √(π / ∫ x in (0 : ℝ)..2 * π, ‖mathieuFeF n q x‖ ^ 2)

/-- `t′_n(q) = (−1)ⁿ w_I′(π; b_n(q), q) / (π se_n′(0, q))`. -/
def mathieuGeT (n : ℕ) (q : ℝ) : ℝ :=
  (-1) ^ n * (deriv (mathieuWI (mathieuB n q) q) π).re / (π * mathieuSeDerivZero n q)

/-- `g_n(z, q) = w_I(z; b_n(q), q)/t′_n(q) − z se_n(z, q)` for `q ≠ 0` (DLMF 28.5.2), and
`g_n(·, 0) = 0` (README Conventions). -/
def mathieuGeG (n : ℕ) (q : ℝ) (z : ℂ) : ℂ :=
  if q = 0 then 0 else mathieuWI (mathieuB n q) q z / mathieuGeT n q - z * mathieuSe n q z

/-- `S_n(q)` (DLMF 28.5.5), with the sign of `t′_n(q)`; `S_n(0) = 0`. -/
def mathieuGeS (n : ℕ) (q : ℝ) : ℝ :=
  if q = 0 then 0
  else SignType.sign (mathieuGeT n q) *
    √(π / ∫ x in (0 : ℝ)..2 * π, ‖mathieuGeG n q x‖ ^ 2)

/-- `fe_n(z, q) = C_n(q) (z ce_n(z, q) + f_n(z, q))` for `q ≠ 0` (DLMF 28.5.1); at `q = 0` the
values of DLMF 28.5.7, `fe_0 = z` and `fe_n = sin nz` for `n ≥ 1`. -/
def mathieuFe (n : ℕ) (q : ℝ) (z : ℂ) : ℂ :=
  if q = 0 then (if n = 0 then z else Complex.sin (n * z))
  else mathieuFeC n q * (z * mathieuCe n q z + mathieuFeF n q z)

/-- `ge_n(z, q) = S_n(q) (z se_n(z, q) + g_n(z, q))` for `q ≠ 0` (DLMF 28.5.2); at `q = 0` the
values `ge_n = cos nz` of DLMF 28.5.7 for `n ≥ 1` (`ge_0` is not used). -/
def mathieuGe (n : ℕ) (q : ℝ) (z : ℂ) : ℂ :=
  if q = 0 ∧ n ≠ 0 then Complex.cos (n * z)
  else mathieuGeS n q * (z * mathieuSe n q z + mathieuGeG n q z)

/-- DLMF 28.5.6, second relation, corrected: `C_{2m+1}(−q) = −S_{2m+1}(q)`. -/
theorem mathieuFeC_odd_neg (m : ℕ) (q : ℝ) :
    mathieuFeC (2 * m + 1) (-q) = -mathieuGeS (2 * m + 1) q := by
  sorry

/-- The Floquet solution `w_I + i sin(πν)/w_II(π) · w_II` with `a = λ_ν(q)`, before
normalization. -/
def mathieuMeRaw (ν q : ℝ) (z : ℂ) : ℂ :=
  mathieuWI (mathieuLambda ν q) q z +
    I * Real.sin (π * ν) / mathieuWII (mathieuLambda ν q) q π * mathieuWII (mathieuLambda ν q) q z

/-- `me_ν(z, q)` for real `ν ∉ ℤ` and real `q`, normalized by 28.12.5 with `me_ν(0, q) > 0`; for
`ν = ±n ∈ ℤ`, `me_n = √2 ce_n`, `me_{−n} = −√2 i se_n` (DLMF 28.12.11). -/
def mathieuMe (ν q : ℝ) (z : ℂ) : ℂ :=
  if ∃ m : ℤ, (m : ℝ) = ν then
    (if 0 ≤ ν then √2 * mathieuCe ⌊ν⌋₊ q z else -(√2 * I) * mathieuSe ⌊-ν⌋₊ q z)
  else √(π / ∫ x in (0 : ℝ)..π, ‖mathieuMeRaw ν q x‖ ^ 2) * mathieuMeRaw ν q z

/-- `ce_ν(z, q) = ½(me_ν(z, q) + me_ν(−z, q))` (DLMF 28.12.12). -/
def mathieuCeNu (ν q : ℝ) (z : ℂ) : ℂ := (mathieuMe ν q z + mathieuMe ν q (-z)) / 2

/-- `se_ν(z, q) = −½ i (me_ν(z, q) − me_ν(−z, q))` (DLMF 28.12.13). -/
def mathieuSeNu (ν q : ℝ) (z : ℂ) : ℂ := -(I / 2) * (mathieuMe ν q z - mathieuMe ν q (-z))

/-- README 4.4: `ce_ν(x, q)` and `se_ν(x, q)` are real for real `x`, for every real `ν`. -/
theorem mathieuCeNu_im_eq_zero (ν q x : ℝ) :
    (mathieuCeNu ν q x).im = 0 ∧ (mathieuSeNu ν q x).im = 0 := by
  sorry

/-- `c^ν_{2m}(q) = (1/π) ∫₀^π me_ν(x, q) e^{−i(ν+2m)x} dx`, the Fourier coefficients of
README 4.5. -/
def mathieuCoeff (ν : ℝ) (m : ℤ) (q : ℝ) : ℝ :=
  (1 / π) * (∫ x in (0 : ℝ)..π, mathieuMe ν q x * cexp (-(I * (ν + 2 * m) * x))).re

/-- DLMF 28.12.5, for every real `ν` (at integer `ν` through DLMF 28.12.11). -/
theorem integral_mathieuMe_mul_neg (ν q : ℝ) :
    ∫ x in (0 : ℝ)..π, mathieuMe ν q x * mathieuMe ν q (-x) = π := by
  sorry

/-! ## Layer 5: Hill equations with two cosine terms -/

/-- DLMF 28.31.2–28.31.3: for entire `w`, `w` solves Ince's equation
`w″ + ξ sin 2z w′ + (η − pξ cos 2z) w = 0` iff `W = w exp(−ξ cos 2z / 4)` solves the
Whittaker–Hill equation `W″ + (η − ξ²/8 − (p + 1) ξ cos 2z + (ξ²/8) cos 4z) W = 0`. -/
theorem whittakerHill_of_ince {ξ η p : ℂ} {w : ℂ → ℂ} (hw : Differentiable ℂ w) :
    (∀ z, deriv (deriv w) z + ξ * Complex.sin (2 * z) * deriv w z +
      (η - p * ξ * Complex.cos (2 * z)) * w z = 0) ↔
    ∀ z, deriv (deriv fun z => w z * cexp (-(ξ * Complex.cos (2 * z)) / 4)) z +
      (η - ξ ^ 2 / 8 - (p + 1) * ξ * Complex.cos (2 * z) + ξ ^ 2 / 8 * Complex.cos (4 * z)) *
        (w z * cexp (-(ξ * Complex.cos (2 * z)) / 4)) = 0 := by
  sorry

/-! ## Layer 6: integral operators and eigenfunction expansions -/

/-- README 6.1, the expansion theorem: for the merged sequence `λ̂₀ ≤ λ̂₁ ≤ ⋯` of the roots of
`Δ − 2` and `Δ + 2`, with multiplicity, there are real `2π`-periodic solutions `w_m` for `λ̂_m`,
orthonormal for `dx/2π` on `[0, 2π]` and complete (Parseval for every `f ∈ L²(0, 2π)`, so a Hilbert
basis), and every `2π`-periodic `f` with `f`, `f′` absolutely continuous and `f″ ∈ L²(0, 2π)`
(stated as: `f` is `C¹` and `f′(x) = f′(0) + ∫₀ˣ g` with `g ∈ L²(0, 2π)`) is the sum of its
expansion, absolutely at every point and uniformly. -/
theorem hill_expansion (hQ : Continuous Q) (hper : Function.Periodic Q π) :
    ∃ (lamHat : ℕ → ℝ) (w : ℕ → ℝ → ℝ),
      Monotone lamHat ∧
      (∀ t : ℝ, Nat.card {m : ℕ // lamHat m ≤ t} =
        realRootCount (fun lam => hillDiscriminant Q lam - 2) t +
          realRootCount (fun lam => hillDiscriminant Q lam + 2) t) ∧
      (∀ m, IsHillSolution Q (lamHat m) (fun x => (w m x : ℂ)) ∧
        Function.Periodic (w m) (2 * π)) ∧
      (∀ m n, 1 / (2 * π) * ∫ x in (0 : ℝ)..2 * π, w m x * w n x = if m = n then 1 else 0) ∧
      (∀ f : ℝ → ℂ, MemLp f 2 (volume.restrict (Ioc 0 (2 * π))) →
        HasSum (fun m => ‖1 / (2 * π) * ∫ x in (0 : ℝ)..2 * π, f x * w m x‖ ^ 2)
          (1 / (2 * π) * ∫ x in (0 : ℝ)..2 * π, ‖f x‖ ^ 2)) ∧
      (∀ f g : ℝ → ℂ, Function.Periodic f (2 * π) → ContDiff ℝ 1 f →
        MemLp g 2 (volume.restrict (Ioc 0 (2 * π))) →
        (∀ x, deriv f x = deriv f 0 + ∫ t in (0 : ℝ)..x, g t) →
        (∀ x, Summable fun m =>
          ‖(1 / (2 * π) * ∫ t in (0 : ℝ)..2 * π, f t * w m t) * w m x‖) ∧
        TendstoUniformly (fun N x => ∑ m ∈ Finset.range N,
          (1 / (2 * π) * ∫ t in (0 : ℝ)..2 * π, f t * w m t) * w m x) f atTop) := by
  sorry

/-! ## Layer 7: dependence on `q` -/

/-- DLMF 28.6.1 through `q⁴`: `a₀` is the restriction of a function holomorphic at `0` with
Taylor coefficients `0, 0, −1/2, 0, 7/128`. -/
theorem exists_analyticAt_mathieuA_zero :
    ∃ F : ℂ → ℂ, AnalyticAt ℂ F 0 ∧ (∀ᶠ q : ℝ in 𝓝 0, F q = mathieuA 0 q) ∧
      F 0 = 0 ∧ deriv F 0 = 0 ∧ iteratedDeriv 2 F 0 = -1 ∧ iteratedDeriv 3 F 0 = 0 ∧
      iteratedDeriv 4 F 0 = 24 * (7 / 128) := by
  sorry

/-- DLMF 28.2.25 for `q > 0`: `a_n < b_{n+1} < a_{n+1}`. README 7.2: proved after the expansions
in `q`, which fix the sign of `a_n − b_n`. -/
theorem mathieuA_lt_mathieuB_lt {q : ℝ} (hq : 0 < q) (n : ℕ) :
    mathieuA n q < mathieuB (n + 1) q ∧ mathieuB (n + 1) q < mathieuA (n + 1) q := by
  sorry

/-- README 7.2: for `q > 0`, `λ_ν(q) → b₁(q)` as `ν → 1⁻` and `→ a₁(q)` as `ν → 1⁺`. -/
theorem tendsto_mathieuLambda_one {q : ℝ} (hq : 0 < q) :
    Tendsto (fun ν => mathieuLambda ν q) (𝓝[<] 1) (𝓝 (mathieuB 1 q)) ∧
      Tendsto (fun ν => mathieuLambda ν q) (𝓝[>] 1) (𝓝 (mathieuA 1 q)) := by
  sorry

/-- The tail `q²/(k² − a − q²/((k+2)² − a − ⋯))` of the continued fractions of §28.6,
truncated after `N` levels. -/
def mathieuTail (a q : ℝ) : ℕ → ℕ → ℝ
  | _, 0 => 0
  | k, N + 1 => q ^ 2 / ((k : ℝ) ^ 2 - a - mathieuTail a q (k + 2) N)

/-- DLMF 28.6.16 at `n = 0`, with the factor `2` that the printed formula lacks:
`a₀ = −2q²/(4 − a₀ − q²/(16 − a₀ − ⋯))`. -/
theorem tendsto_mathieuTail_mathieuA_zero (q : ℝ) :
    Tendsto (fun N => -2 * mathieuTail (mathieuA 0 q) q 2 N) atTop (𝓝 (mathieuA 0 q)) := by
  sorry

/-- README 7.4: `q ∈ ℂ` is exceptional for `F` if `F(·, q)` has a multiple root. -/
def mathieuExceptionalSet (F : ℂ → ℂ → ℂ) : Set ℂ :=
  {q | ∃ a, F a q = 0 ∧ deriv (fun b => F b q) a = 0}

/-- README 7.4: for each of `F^{(1)} = w_I′(π/2)`, `F^{(2)} = w_II(π/2)`, `F^{(3)} = w_I(π/2)` and
`F^{(3′)} = w_II′(π/2)`, the exceptional set is closed, discrete and disjoint from `ℝ`. -/
theorem mathieuExceptionalSet_closed_discrete :
    ∀ F ∈ ({fun a q => deriv (mathieuWI a q) (π / 2), fun a q => mathieuWII a q (π / 2),
        fun a q => mathieuWI a q (π / 2), fun a q => deriv (mathieuWII a q) (π / 2)} :
        Set (ℂ → ℂ → ℂ)),
      IsClosed (mathieuExceptionalSet F) ∧ DiscreteTopology (mathieuExceptionalSet F) ∧
        ∀ x : ℝ, (x : ℂ) ∉ mathieuExceptionalSet F := by
  sorry

/-- DLMF 28.7.1: `∑ₙ (a_{2n}(q) − (2n)²) = 0`. -/
theorem hasSum_mathieuA_even_sub_sq (q : ℝ) :
    HasSum (fun n : ℕ => mathieuA (2 * n) q - (2 * n) ^ 2) 0 := by
  sorry

/-- DLMF 28.7.3: `∑ₙ (b_{2n+1}(q) − (2n + 1)²) = −q`. -/
theorem hasSum_mathieuB_odd_sub_sq (q : ℝ) :
    HasSum (fun n : ℕ => mathieuB (2 * n + 1) q - (2 * n + 1) ^ 2) (-q) := by
  sorry

/-- DLMF 28.7.4: `∑ₙ (b_{2n+2}(q) − (2n + 2)²) = 0`. -/
theorem hasSum_mathieuB_even_sub_sq (q : ℝ) :
    HasSum (fun n : ℕ => mathieuB (2 * n + 2) q - (2 * n + 2) ^ 2) 0 := by
  sorry

/-- DLMF 28.7.2: `∑ₙ (a_{2n+1}(q) − (2n + 1)²) = q`. -/
theorem hasSum_mathieuA_odd_sub_sq (q : ℝ) :
    HasSum (fun n : ℕ => mathieuA (2 * n + 1) q - (2 * n + 1) ^ 2) q := by
  sorry

/-! ## Layer 8: modified Mathieu functions -/

/-- `Ce_n(z, q) = ce_n(iz, q)` (DLMF 28.20.3, integer order). -/
def modifiedMathieuCe (n : ℕ) (q : ℝ) (z : ℂ) : ℂ := mathieuCe n q (I * z)

/-- `Se_n(z, q) = −i se_n(iz, q)` (DLMF 28.20.4, integer order). -/
def modifiedMathieuSe (n : ℕ) (q : ℝ) (z : ℂ) : ℂ := -I * mathieuSe n q (I * z)

/-- `Me_ν(z, q) = me_ν(−iz, q)` (DLMF 28.20.5). -/
def modifiedMathieuMe (ν q : ℝ) (z : ℂ) : ℂ := mathieuMe ν q (-(I * z))

/-- `Fe_n(z, q) = −i fe_n(iz, q)` (DLMF 28.20.6). -/
def modifiedMathieuFe (n : ℕ) (q : ℝ) (z : ℂ) : ℂ := -I * mathieuFe n q (I * z)

/-- `Ge_n(z, q) = ge_n(iz, q)` (DLMF 28.20.7). -/
def modifiedMathieuGe (n : ℕ) (q : ℝ) (z : ℂ) : ℂ := mathieuGe n q (I * z)

/-- The solution of the modified equation with `a = λ_ν(h²)` asymptotic to `H(2h cosh x)` along
the real axis, for a Hankel function `H`. -/
def modifiedMathieuHankel (H : ℂ → ℂ → ℂ) (ν h : ℝ) : ℂ → ℂ :=
  if hw : ∃ w, IsModifiedMathieuSolution (mathieuLambda ν (h ^ 2)) (h ^ 2) w ∧
      Tendsto (fun x : ℝ => w x / H ν (2 * h * Real.cosh x)) atTop (𝓝 1) then hw.choose else 0

/-- `M^{(j)}_ν(z, h)`, `j = 1, …, 4` (DLMF 28.20.9–28.20.14), for real `ν` and `h > 0`; every
`j ∉ {1, 2, 3}` gives `M^{(4)}`, and only `1 ≤ j ≤ 4` is used. -/
def modifiedMathieuM (j : ℕ) (ν h : ℝ) (z : ℂ) : ℂ :=
  match j with
  | 1 => (modifiedMathieuHankel Complex.hankelH1 ν h z +
      modifiedMathieuHankel Complex.hankelH2 ν h z) / 2
  | 2 => (modifiedMathieuHankel Complex.hankelH1 ν h z -
      modifiedMathieuHankel Complex.hankelH2 ν h z) / (2 * I)
  | 3 => modifiedMathieuHankel Complex.hankelH1 ν h z
  | _ => modifiedMathieuHankel Complex.hankelH2 ν h z

/-- The radial function `Mc^{(j)}_n(z, h) = M^{(j)}_n(z, h)` (DLMF 28.20.15). -/
def radialMathieuMc (j n : ℕ) (h : ℝ) (z : ℂ) : ℂ := modifiedMathieuM j n h z

/-- The radial function `Ms^{(j)}_n(z, h) = (−1)ⁿ M^{(j)}_{−n}(z, h)` (DLMF 28.20.16). -/
def radialMathieuMs (j n : ℕ) (h : ℝ) (z : ℂ) : ℂ := (-1) ^ n * modifiedMathieuM j (-n) h z

/-- README 8.1: `Ce_n`, `Se_n`, `Fe_n`, `Ge_n`, `Me_ν` solve the modified equation with
`a = a_n(q)`, `b_n(q)`, `a_n(q)`, `b_n(q)`, `λ_ν(q)`, and `Mc^{(j)}_n(·, h)`, `Ms^{(j)}_n(·, h)`
(`n ≥ 1`) solve it with `q = h²` and `a = a_n(h²)`, `b_n(h²)`. -/
theorem isModifiedMathieuSolution_modifiedMathieu (n : ℕ) (ν q : ℝ) :
    IsModifiedMathieuSolution (mathieuA n q) q (modifiedMathieuCe n q) ∧
      IsModifiedMathieuSolution (mathieuB n q) q (modifiedMathieuSe n q) ∧
      IsModifiedMathieuSolution (mathieuA n q) q (modifiedMathieuFe n q) ∧
      IsModifiedMathieuSolution (mathieuB n q) q (modifiedMathieuGe n q) ∧
      IsModifiedMathieuSolution (mathieuLambda ν q) q (modifiedMathieuMe ν q) ∧
      ∀ (j : ℕ) (h : ℝ),
        IsModifiedMathieuSolution (mathieuA n (h ^ 2)) ((h ^ 2 : ℝ) : ℂ) (radialMathieuMc j n h) ∧
        (1 ≤ n → IsModifiedMathieuSolution (mathieuB n (h ^ 2)) ((h ^ 2 : ℝ) : ℂ)
          (radialMathieuMs j n h)) := by
  sorry

/-- README 8.2 (DLMF §28.20(iii) prints `ζ^{1/2}`): `|M^{(3)}_ν(x, h)| (cosh x)^{1/2}` tends to
`(πh)^{−1/2}`, so the solutions of 28.20.2 behave like `ζ^{−1/2} e^{±2ihζ}`. -/
theorem tendsto_norm_modifiedMathieuM_three (ν : ℝ) {h : ℝ} (hh : 0 < h) :
    Tendsto (fun x : ℝ => ‖modifiedMathieuM 3 ν h x‖ * √(Real.cosh x)) atTop
      (𝓝 (1 / √(π * h))) := by
  sorry

/-- DLMF 28.28.11 for integer order, with the factor `e^{inπ/2} = iⁿ` in place of DLMF's
`e^{inπ}`, for `Re z > 0` and `0 < Im z < π` (README 8.5; DLMF's 28.28.10 alone is invariant
under `z ↦ −z`, which `Mc^{(3)}_n` is not). -/
theorem integral_exp_mul_mathieuCe (n : ℕ) {h : ℝ} (hh : 0 < h) {z : ℂ}
    (hz₁ : 0 < z.re) (hz₂ : 0 < z.im) (hz₃ : z.im < π) :
    ∫ t in Ioi (0 : ℝ),
        cexp (2 * I * h * Complex.cosh z * Real.cosh t) * mathieuCe n (h ^ 2) (I * t) =
      π * I / 2 * I ^ n * mathieuCe n (h ^ 2) 0 * radialMathieuMc 3 n h z := by
  sorry

/-- README 8.4: for `ν ∉ ℤ`, `h > 0` and `0 < |cosh z| < 1`, the `j = 1` series 28.23.2 diverges,
contrary to DLMF's "valid for all `z` when `j = 1`"; the coefficients are the `c^ν_{2n}(h²)`
of README 4.5. -/
theorem not_summable_besselJ_series {ν : ℝ} (hν : ∀ m : ℤ, (m : ℝ) ≠ ν) {h : ℝ} (hh : 0 < h)
    {z : ℂ} (hz₀ : 0 < ‖Complex.cosh z‖) (hz₁ : ‖Complex.cosh z‖ < 1) :
    ¬ Summable (fun n : ℤ =>
      (-1) ^ n * (mathieuCoeff ν n (h ^ 2) : ℂ) *
        besselJ (ν + 2 * n) (2 * h * Complex.cosh z)) := by
  sorry

/-! ## Mathlib and Tau Ceti declarations named in README.md -/

#check @AddCircle
#check @AnalyticOnNhd
#check @Complex.besselJ
#check @Complex.besselJ_neg_int
#check @ODE_solution_unique
#check @ODE_solution_unique_of_mem_Icc
#check @gronwallBound
#check @norm_le_gronwallBound_of_norm_deriv_right_le
#check @HasFPowerSeriesOnBall
#check @TendstoLocallyUniformlyOn.differentiableOn
#check @Laplacian.laplacian
#check @InnerProductSpace.laplacian_eq_iteratedFDeriv_complexPlane
#check @Matrix.det
#check @Matrix.of
#check @fourierCoeff
#check @fourierBasis
#check @hasSum_fourier_series_of_summable
#check @tsum_sq_fourierCoeff
#check @IsCompactOperator
#check @LinearMap.IsSymmetric
#check @MeasureTheory.Lp
#check @GenContFract
#check @TauCeti.dysonSeries
#check @TauCeti.dysonSeriesLeft
#check @TauCeti.hasDerivAt_dysonSeriesLeft
#check @TauCeti.wronskian_eq_of_hasDerivAt
#check @TauCeti.norm_fourierCoeff_le_of_differentiableOn_strip
#check @ContinuousLinearMap.exists_hilbertBasis_forall_hasEigenvector
#check @ContinuousLinearMap.isCompactOperator_of_hilbertSchmidtEnergy_ne_top
#check @Matrix.abv_det_le_prod_sum_abv
#check @Matrix.principalMinor
#check @AnalyticAt.exists_analyticAt_eventually_eq_zero_iff
#check @TauCeti.rouche
#check @TauCeti.Polynomial.exists_analyticOnNhd_prod_X_sub_C_powerSubstitution_ball

end TauCetiRoadmap.SpecialFunctionsMathieu
