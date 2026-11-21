module

public import Mathlib

/-!
# Rank-one symmetric spaces: suggested target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is `README.md`.
This file states, against the pinned Mathlib and Tau Ceti, the headlines of `README.md` that
carry a Lean name, each with every conclusion the README attaches to it, with `sorry` proofs and
the definitions they need. These are suggested forms; the README's other headlines are targets of
the same standing, stated in prose. Discharging this file finishes neither a layer nor the
roadmap. Section numbers in docstrings are those of the README. Three statements
(`jacobiFunction_even`, `jacobiTransform_neg`, `hyperbolicDist_mulVec`) are sanity checks of the
definitions rather than targets of substance; their docstrings say so.

Conventions (README, Conventions). The Jacobi function is DLMF 15.9.11,
`φ_λ^{(α,β)}(t) = F((α + β + 1 + iλ)/2, (α + β + 1 − iλ)/2; α + 1; −sinh² t)`, with
`ρ = α + β + 1`; the Jacobi transform carries the weight `(2 sinh t)^{2α+1} (2 cosh t)^{2β+1}`
(DLMF 15.9.12) and the Plancherel density `(2π)⁻¹ |c(λ)|⁻²`. The real hyperbolic space `ℍⁿ` is
the upper sheet of `x₀² − x₁² − ⋯ − xₙ² = 1` in `Fin (n + 1) → ℝ` (index `0` is the time
coordinate), with the Riemannian volume `dx₁ ⋯ dxₙ / x₀`, the group `SO₀(n, 1)` as a subgroup of
`SL(n + 1, ℝ)`, the base point `o = e₀` and the radius `t = d(o, x) = arcosh x₀`. Its spherical
functions are the Jacobi functions with `(α, β) = (n/2 − 1, −1/2)` and `ρ = (n − 1)/2`.

Local copies. `eulerIntegral`, `IsEulerContinuation`, `regularizedGaussHypergeometric` and
`gaussHypergeometric` are verbatim copies of the definitions of the roadmap
SpecialFunctionsHypergeometric (its Layer 1). `jacobi` is the Jacobi polynomial of the roadmap
LaguerreJacobi (its §3.2), as copied in SpecialFunctionsSU2MatrixElements. `IsBiInvariant`,
`conv`, `IsGelfandPair` and `IsSphericalFunction` are the definitions of the roadmap
SpecialFunctionsGroupModels (its §§5.1–5.2), verbatim. `SU11.boostMatrixElement` is the matrix
element `𝔓^τ_{mn}(cosh t)` of the roadmap SpecialFunctionsSU11MatrixElements (its §1.1),
verbatim.

Junk values. `jacobiFunction` and `cFunction` inherit the junk values of `F` and of Mathlib's
`Γ` at its poles; the theorems exclude those parameters. `hyperbolicLaplacian` extends `f` from
`ℍⁿ` to the cone `[y, y] > 0` by homogeneity of degree zero; off that cone the extension is junk,
and the theorems evaluate it only at points of `ℍⁿ`. Quantities that can be infinite (the polar
and horospherical integrals) are stated with `∫⁻`.
-/

@[expose] public section

noncomputable section

namespace TauCetiRoadmap.SpecialFunctionsRankOneSymmetricSpaces

open Complex Filter Topology Set MeasureTheory Polynomial
open scoped Real ComplexConjugate ENNReal InnerProductSpace ContDiff Matrix

/-! ## Local copies of supplier definitions -/

/-- Euler's integral (SpecialFunctionsHypergeometric, verbatim). -/
def eulerIntegral (a b c z : ℂ) : ℂ :=
  (Gamma b * Gamma (c - b))⁻¹ *
    ∫ t in (0 : ℝ)..1, (t : ℂ) ^ (b - 1) * (1 - (t : ℂ)) ^ (c - b - 1) * (1 - z * t) ^ (-a)

/-- Continuations of Euler's integral (SpecialFunctionsHypergeometric, verbatim). -/
def IsEulerContinuation (G : ℂ → ℂ → ℂ → ℂ → ℂ) : Prop :=
  (∀ a c z, 1 - z ∈ slitPlane → Differentiable ℂ fun b => G a b c z) ∧
  (∀ a b z, 1 - z ∈ slitPlane → Differentiable ℂ fun c => G a b c z) ∧
  (∀ a b c z, 1 - z ∈ slitPlane → 0 < b.re → b.re < c.re → G a b c z = eulerIntegral a b c z)

open scoped Classical in
/-- The principal branch of `𝐅(a, b; c; z)` (SpecialFunctionsHypergeometric, verbatim). -/
def regularizedGaussHypergeometric (a b c z : ℂ) : ℂ :=
  if h : ∃ G, IsEulerContinuation G then
    if 1 - z ∈ slitPlane then h.choose a b c z else 0
  else 0

/-- The principal branch of `F(a, b; c; z) = Γ(c) 𝐅(a, b; c; z)`
(SpecialFunctionsHypergeometric, verbatim). -/
def gaussHypergeometric (a b c z : ℂ) : ℂ := Gamma c * regularizedGaussHypergeometric a b c z

/-- The Jacobi polynomial `P_n^{(α,β)}` (LaguerreJacobi §3.2, verbatim). -/
def jacobi {R : Type*} [CommRing R] [Algebra ℚ R] (α β : R) (n : ℕ) : R[X] :=
  ((1 : ℚ) / 2 ^ n) • ∑ k ∈ Finset.range (n + 1),
    (((1 : ℚ) / ((n - k).factorial * k.factorial)) •
      ((ascPochhammer R (n - k)).smeval (β + k + 1) *
        (ascPochhammer R k).smeval (α + (n - k : ℕ) + 1))) • ((X - 1) ^ (n - k) * (X + 1) ^ k)

section Gelfand

variable {G : Type*} [Group G] [TopologicalSpace G] [MeasurableSpace G]

/-- `f` is bi-invariant under `K` (SpecialFunctionsGroupModels §5.1, verbatim). -/
def IsBiInvariant (K : Subgroup G) (f : G → ℂ) : Prop :=
  ∀ k₁ ∈ K, ∀ k₂ ∈ K, ∀ x, f (k₁ * x * k₂) = f x

/-- Convolution (SpecialFunctionsGroupModels §5.1, verbatim). -/
def conv (μ : Measure G) (f h : G → ℂ) (x : G) : ℂ := ∫ y, f y * h (y⁻¹ * x) ∂μ

/-- Gel'fand pairs (SpecialFunctionsGroupModels §5.1, verbatim). -/
def IsGelfandPair (μ : Measure G) (K : Subgroup G) : Prop :=
  ∀ f h : G → ℂ, Continuous f → HasCompactSupport f → IsBiInvariant K f →
    Continuous h → HasCompactSupport h → IsBiInvariant K h → conv μ f h = conv μ h f

/-- Spherical functions (SpecialFunctionsGroupModels §5.2, verbatim). -/
def IsSphericalFunction (K : Subgroup G) (ν : Measure K) (φ : G → ℂ) : Prop :=
  Continuous φ ∧ IsBiInvariant K φ ∧ φ 1 = 1 ∧ ∀ x y, ∫ k : K, φ (x * k * y) ∂ν = φ x * φ y

end Gelfand

/-! ## Layer 0: Jacobi functions -/

/-- README 0.1. The Jacobi function `φ_λ^{(α,β)}(t) = F((ρ + iλ)/2, (ρ − iλ)/2; α + 1; −sinh² t)`,
`ρ = α + β + 1` (DLMF 15.9.11). The argument `−sinh² t ≤ 0` lies in the cut plane for every real
`t`. The value is junk (`0`) for `α ∈ {−1, −2, …}`. -/
def jacobiFunction (α β lam : ℂ) (t : ℝ) : ℂ :=
  gaussHypergeometric ((α + β + 1 + I * lam) / 2) ((α + β + 1 - I * lam) / 2) (α + 1)
    (-(Real.sinh t : ℂ) ^ 2)

/-- README 0.1. The Jacobi operator
`L u = u'' + ((2α + 1) coth t + (2β + 1) tanh t) u'`, the radial part of the Laplacian. -/
def jacobiOperator (α β : ℂ) (u : ℝ → ℂ) (t : ℝ) : ℂ :=
  deriv (deriv u) t +
    ((2 * α + 1) * (Real.cosh t / Real.sinh t : ℝ) + (2 * β + 1) * (Real.tanh t : ℂ)) *
      deriv u t

/-- README 0.3. The Harish-Chandra series
`Φ_λ(t) = (2 cosh t)^{iλ − ρ} F((ρ − iλ)/2, (α − β + 1 − iλ)/2; 1 − iλ; cosh⁻² t)`
(DLMF 15.9.14); junk for `iλ ∈ {1, 2, …}`. -/
def harishChandraSeries (α β lam : ℂ) (t : ℝ) : ℂ :=
  ((2 * Real.cosh t : ℝ) : ℂ) ^ (I * lam - (α + β + 1)) *
    gaussHypergeometric ((α + β + 1 - I * lam) / 2) ((α - β + 1 - I * lam) / 2) (1 - I * lam)
      ((Real.cosh t : ℂ) ^ 2)⁻¹

/-- README 0.3. The Harish-Chandra `c`-function of the Jacobi analysis,
`c(λ) = 2^{ρ − iλ} Γ(α + 1) Γ(iλ) / (Γ((iλ + ρ)/2) Γ((iλ + α − β + 1)/2))`, the reciprocal of
the Gamma factor of DLMF 15.9.13 at `iλ`. Mathlib's `Γ` is `0` at its poles, so the value is
junk where `iλ ∈ {0, −1, −2, …}`. -/
def cFunction (α β lam : ℂ) : ℂ :=
  (2 : ℂ) ^ (α + β + 1 - I * lam) * Gamma (α + 1) * Gamma (I * lam) /
    (Gamma ((I * lam + (α + β + 1)) / 2) * Gamma ((I * lam + α - β + 1) / 2))

/-- README 0.1. **Value at the origin**: `φ_λ(0) = 1` for `α ∉ {−1, −2, …}`. -/
theorem jacobiFunction_zero (α β lam : ℂ) (hα : ∀ k : ℕ, α + 1 ≠ -k) :
    jacobiFunction α β lam 0 = 1 := by
  sorry

/-- README 0.1. **Evenness in the spectral parameter**: `φ_{−λ} = φ_λ`. -/
theorem jacobiFunction_neg_spectral (α β lam : ℂ) (t : ℝ) :
    jacobiFunction α β (-lam) t = jacobiFunction α β lam t := by
  sorry

/-- Sanity check of the definition: README 0.1, evenness in the radius, `φ_λ(−t) = φ_λ(t)`. -/
theorem jacobiFunction_even (α β lam : ℂ) (t : ℝ) :
    jacobiFunction α β lam (-t) = jacobiFunction α β lam t := by
  sorry

/-- README 0.1. **Entire in the spectral parameter.** -/
theorem differentiable_jacobiFunction (α β : ℂ) (t : ℝ) :
    Differentiable ℂ fun lam => jacobiFunction α β lam t := by
  sorry

/-- README 0.1. **The Jacobi equation**: `L φ_λ = −(λ² + ρ²) φ_λ` on `t > 0`. -/
theorem jacobiOperator_jacobiFunction (α β lam : ℂ) {t : ℝ}
    (ht : 0 < t) :
    jacobiOperator α β (jacobiFunction α β lam) t =
      -(lam ^ 2 + (α + β + 1) ^ 2) * jacobiFunction α β lam t := by
  sorry

/-- README 0.1. **Uniqueness**: for `0 ≤ Re α`, a solution of the Jacobi equation on `(0, ∞)` that
is continuous on `[0, ∞)` with value `1` at `0` is `φ_λ`. -/
theorem eq_jacobiFunction_of_jacobiOperator (α β lam : ℂ) (hα : 0 ≤ α.re) (u : ℝ → ℂ)
    (hu : ContDiffOn ℝ 2 u (Ioi 0)) (hc : ContinuousOn u (Ici 0)) (h0 : u 0 = 1)
    (heq : ∀ t > 0, jacobiOperator α β u t = -(lam ^ 2 + (α + β + 1) ^ 2) * u t) :
    ∀ t ≥ 0, u t = jacobiFunction α β lam t := by
  sorry

/-- README 0.1. **The trivial spherical function**: `φ_{±iρ} ≡ 1`. -/
theorem jacobiFunction_I_mul_rho (α β : ℂ) (hα : ∀ k : ℕ, α + 1 ≠ -k) (t : ℝ) :
    jacobiFunction α β (I * (α + β + 1)) t = 1 := by
  sorry

/-- README 0.1. **The polynomial case**: at `λ = i(2k + ρ)`,
`φ_λ(t) = k! / (α + 1)_k · P_k^{(α,β)}(cosh 2t)`. -/
theorem jacobiFunction_eq_jacobi (α β : ℂ) (hα : ∀ k : ℕ, α + 1 ≠ -k) (k : ℕ) (t : ℝ) :
    jacobiFunction α β (I * (2 * k + α + β + 1)) t =
      (k.factorial : ℂ) / (ascPochhammer ℂ k).eval (α + 1) *
        (jacobi α β k).eval ((Real.cosh (2 * t) : ℝ) : ℂ) := by
  sorry

/-- README 0.2. **The Fourier case** `α = β = −1/2`: `φ_λ(t) = cos λt`. -/
theorem jacobiFunction_cos (lam : ℂ) (t : ℝ) :
    jacobiFunction (-1 / 2) (-1 / 2) lam t = Complex.cos (lam * t) := by
  sorry

/-- README 0.2. **The case of `ℍ³`**, `(α, β) = (1/2, −1/2)`: `φ_λ(t) = sin λt / (λ sinh t)` for
`λ ≠ 0`, `t ≠ 0`. -/
theorem jacobiFunction_sin (lam : ℂ) (hlam : lam ≠ 0) {t : ℝ} (ht : t ≠ 0) :
    jacobiFunction (1 / 2) (-1 / 2) lam t = Complex.sin (lam * t) / (lam * Real.sinh t) := by
  sorry

/-- README 0.2. **Quadratic transformation**: `φ_λ^{(α,−1/2)}(t) = φ_{2λ}^{(α,α)}(t/2)`. -/
theorem jacobiFunction_quadratic (α lam : ℂ) (t : ℝ) :
    jacobiFunction α (-1 / 2) lam t = jacobiFunction α α (2 * lam) (t / 2) := by
  sorry

/-- README 0.3. **`Φ_λ` solves the Jacobi equation** on `t > 0`. At the junk values
`iλ ∈ {1, 2, …}` both sides are `0`, so no hypothesis on `λ` is needed. -/
theorem jacobiOperator_harishChandraSeries (α β lam : ℂ)
    {t : ℝ} (ht : 0 < t) :
    jacobiOperator α β (harishChandraSeries α β lam) t =
      -(lam ^ 2 + (α + β + 1) ^ 2) * harishChandraSeries α β lam t := by
  sorry

/-- README 0.3. **Leading behaviour of `Φ_λ`**: `Φ_λ(t) e^{(ρ − iλ)t} → 1` as `t → ∞`. -/
theorem tendsto_harishChandraSeries (α β lam : ℂ) (hlam : ∀ k : ℕ, I * lam ≠ k + 1) :
    Tendsto (fun t : ℝ => harishChandraSeries α β lam t * exp ((α + β + 1 - I * lam) * t))
      atTop (𝓝 1) := by
  sorry

/-- README 0.3. **The connection formula**: `φ_λ = c(λ) Φ_λ + c(−λ) Φ_{−λ}` on `t > 0`, for
`iλ ∉ ℤ`. At `α ∈ {−1, −2, …}` both sides are `0` (the factor `Γ(α + 1)` of `φ_λ` and of `c`), so
no hypothesis on `α` is needed. -/
theorem jacobiFunction_eq_cFunction (α β lam : ℂ)
    (hlam : ∀ k : ℤ, I * lam ≠ k) {t : ℝ} (ht : 0 < t) :
    jacobiFunction α β lam t =
      cFunction α β lam * harishChandraSeries α β lam t +
        cFunction α β (-lam) * harishChandraSeries α β (-lam) t := by
  sorry

/-- README 0.3. **Normalization**: `c(−iρ) = 1` for `ρ ∉ {0, −1, −2, …}` and
`α ∉ {−1, −2, …}`. -/
theorem cFunction_neg_I_mul_rho (α β : ℂ) (hα : ∀ k : ℕ, α + 1 ≠ -k)
    (hρ : ∀ k : ℕ, α + β + 1 ≠ -k) :
    cFunction α β (-(I * (α + β + 1))) = 1 := by
  sorry

/-- README 0.3. **Asymptotics**: for `Im λ < 0`, `φ_λ(t) e^{(ρ − iλ)t} → c(λ)`. -/
theorem tendsto_jacobiFunction_mul_exp (α β lam : ℂ)
    (hlam : lam.im < 0) :
    Tendsto (fun t : ℝ => jacobiFunction α β lam t * exp ((α + β + 1 - I * lam) * t))
      atTop (𝓝 (cFunction α β lam)) := by
  sorry

/-- README 0.3. **Polynomial growth of the Plancherel density**: for real `α > −1` and `β`,
`|c(λ)|⁻² ≤ C (1 + |λ|)^{2α + 1}` on the real line. -/
theorem exists_norm_cFunction_inv_sq_le (α β : ℝ) (hα : -1 < α) :
    ∃ C, ∀ lam : ℝ, ‖cFunction α β lam‖⁻¹ ^ 2 ≤ C * (1 + |lam|) ^ (2 * α + 1) := by
  sorry

/-- README 0.4. **The energy bound**: for real `λ` and real `α ≥ −1/2`, `α + β + 1 ≥ 0`,
`|φ_λ(t)| ≤ 1`. -/
theorem norm_jacobiFunction_le_one (α β lam : ℝ) (hα : -1 / 2 ≤ α) (hρ : 0 ≤ α + β + 1)
    (t : ℝ) :
    ‖jacobiFunction α β lam t‖ ≤ 1 := by
  sorry

/-- README 0.4. **The exponential bound**: for real `α ≥ −1/2`, `α + β + 1 ≥ 0` and complex `λ`,
`|φ_λ(t)| ≤ e^{|Im λ| |t|}`. -/
theorem norm_jacobiFunction_le_exp (α β : ℝ) (hα : -1 / 2 ≤ α) (hρ : 0 ≤ α + β + 1)
    (lam : ℂ) (t : ℝ) :
    ‖jacobiFunction α β lam t‖ ≤ Real.exp (|lam.im| * |t|) := by
  sorry

/-- README 0.4. **Koornwinder's Laplace-type representation**, for real `α > β > −1/2`:
`φ_λ(t) = C ∫₀^π ∫₀¹ |cosh t + r e^{iψ} sinh t|^{iλ − ρ} r^{2β+1} (1 − r²)^{α−β−1}
sin^{2β} ψ dr dψ`, `C = 2Γ(α + 1)/(√π Γ(α − β) Γ(β + 1/2))`. -/
theorem jacobiFunction_laplace (α β : ℝ) (hαβ : β < α) (hβ : -1 / 2 < β) (lam : ℂ) (t : ℝ) :
    jacobiFunction α β lam t =
      2 * Gamma (α + 1) / (Real.sqrt π * Gamma (α - β) * Gamma (β + 1 / 2)) *
        ∫ ψ in (0 : ℝ)..π, ∫ r in (0 : ℝ)..1,
          ((‖(Real.cosh t : ℂ) + r * exp (ψ * I) * Real.sinh t‖ : ℝ) : ℂ) ^
              (I * lam - (α + β + 1)) *
            (r ^ (2 * β + 1) * (1 - r ^ 2) ^ (α - β - 1) * Real.sin ψ ^ (2 * β) : ℝ) := by
  sorry

/-- README 0.4. **Bound by the imaginary part**, for real `α ≥ β ≥ −1/2`:
`|φ_λ(t)| ≤ φ_{i Im λ}(t)`. -/
theorem norm_jacobiFunction_le (α β : ℝ) (hαβ : β ≤ α) (hβ : -1 / 2 ≤ β) (lam : ℂ) (t : ℝ) :
    ‖jacobiFunction α β lam t‖ ≤ (jacobiFunction α β (I * lam.im) t).re := by
  sorry

/-- README 0.4. **Bounded Jacobi functions**: for real `α ≥ β ≥ −1/2`, `φ_λ` is bounded on
`ℝ` exactly when `|Im λ| ≤ ρ`. -/
theorem bddAbove_jacobiFunction_iff (α β : ℝ) (hαβ : β ≤ α) (hβ : -1 / 2 ≤ β) (lam : ℂ) :
    BddAbove (range fun t : ℝ => ‖jacobiFunction α β lam t‖) ↔ |lam.im| ≤ α + β + 1 := by
  sorry

/-- README 0.4. **Koornwinder's product formula**, for real `α > β > −1/2`:
`φ_λ(t₁) φ_λ(t₂) = C ∫₀^π ∫₀¹ φ_λ(t(r, ψ)) r^{2β+1} (1 − r²)^{α−β−1} sin^{2β} ψ dr dψ` with
`cosh t(r, ψ) = |cosh t₁ cosh t₂ + r e^{iψ} sinh t₁ sinh t₂|`. -/
theorem jacobiFunction_mul_jacobiFunction (α β : ℝ) (hαβ : β < α) (hβ : -1 / 2 < β) (lam : ℂ)
    (t₁ t₂ : ℝ) :
    jacobiFunction α β lam t₁ * jacobiFunction α β lam t₂ =
      2 * Gamma (α + 1) / (Real.sqrt π * Gamma (α - β) * Gamma (β + 1 / 2)) *
        ∫ ψ in (0 : ℝ)..π, ∫ r in (0 : ℝ)..1,
          jacobiFunction α β lam
              (Real.arcosh ‖(Real.cosh t₁ * Real.cosh t₂ : ℂ) +
                r * exp (ψ * I) * (Real.sinh t₁ * Real.sinh t₂)‖) *
            (r ^ (2 * β + 1) * (1 - r ^ 2) ^ (α - β - 1) * Real.sin ψ ^ (2 * β) : ℝ) := by
  sorry

/-! ### 0.5 The matrix elements of `SU(1,1)` -/

namespace SU11

/-- README 1.1 of SpecialFunctionsSU11MatrixElements, verbatim. Vilenkin–Klimyk's
`𝔓^τ_{mn}(cosh t)`:
`(2π)⁻¹ ∫₀^{2π} (cosh(t/2) + sinh(t/2) e^{iθ})^{τ+n} (cosh(t/2) + sinh(t/2) e^{-iθ})^{τ-n}
e^{i(m-n)θ} dθ`, with principal powers of bases of positive real part. -/
def boostMatrixElement (τ : ℂ) (m n t : ℝ) : ℂ :=
  ((2 * π : ℝ) : ℂ)⁻¹ * ∫ θ in (0 : ℝ)..2 * π,
    ((Real.cosh (t / 2) : ℂ) + Real.sinh (t / 2) * Complex.exp ((θ : ℂ) * Complex.I)) ^ (τ + n) *
      ((Real.cosh (t / 2) : ℂ) + Real.sinh (t / 2) * Complex.exp (-((θ : ℂ) * Complex.I))) ^
        (τ - n) *
      Complex.exp (((m - n : ℝ) : ℂ) * θ * Complex.I)

/-- README 0.5. **`𝔓^τ_{mn}` as a Jacobi function**: for `m = n + k`, `k ∈ ℕ`,
`𝔓^τ_{mn}(cosh t) = (τ − m + 1)_k/k! · sinh^k(t/2) cosh^{−(m+n)}(t/2) · φ_λ^{(k, −(m+n))}(t/2)`
with `λ = i(2τ + 1)`, so that `ρ = 1 − 2n`. -/
theorem boostMatrixElement_eq_jacobiFunction (τ : ℂ) (n : ℝ) (k : ℕ) (t : ℝ) :
    boostMatrixElement τ (n + k) n t =
      (ascPochhammer ℂ k).eval (τ - (n + k : ℝ) + 1) / (k.factorial : ℂ) *
        (Real.sinh (t / 2) : ℂ) ^ k * ((Real.cosh (t / 2) : ℝ) : ℂ) ^ (-((2 * n + k : ℝ) : ℂ)) *
        jacobiFunction k (-((2 * n + k : ℝ) : ℂ)) (I * (2 * τ + 1)) (t / 2) := by
  sorry

end SU11

/-- README 0.5. **The zonal case**: `φ_λ^{(0,0)}(t) = 𝔓^{−1/2+iλ/2}_{00}(cosh 2t)`. -/
theorem jacobiFunction_zero_zero_eq_boostMatrixElement (lam : ℂ) (t : ℝ) :
    jacobiFunction 0 0 lam t = SU11.boostMatrixElement (-1 / 2 + I * lam / 2) 0 0 (2 * t) := by
  sorry

/-! ## Layer 1: the Jacobi transform -/

/-- README 1.1. The weight `Δ(t) = (2 sinh t)^{2α+1} (2 cosh t)^{2β+1}` on `t > 0`. -/
def jacobiWeight (α β t : ℝ) : ℝ :=
  (2 * Real.sinh t) ^ (2 * α + 1) * (2 * Real.cosh t) ^ (2 * β + 1)

/-- README 1.1. The Jacobi transform `f̃(λ) = ∫₀^∞ f(t) φ_λ(t) Δ(t) dt` (DLMF 15.9.12). -/
def jacobiTransform (α β : ℝ) (f : ℝ → ℂ) (lam : ℂ) : ℂ :=
  ∫ t in Ioi 0, f t * jacobiFunction α β lam t * jacobiWeight α β t

/-- README 1.1. The measure `Δ(t) dt` on `(0, ∞)`. -/
def jacobiMeasure (α β : ℝ) : Measure ℝ :=
  (volume.restrict (Ioi 0)).withDensity fun t => ENNReal.ofReal (jacobiWeight α β t)

/-- README 1.2. The Plancherel measure `(2π)⁻¹ |c(λ)|⁻² dλ` on `(0, ∞)`. -/
def jacobiPlancherelMeasure (α β : ℝ) : Measure ℝ :=
  (volume.restrict (Ioi (0 : ℝ))).withDensity fun lam : ℝ =>
    ENNReal.ofReal ((2 * π)⁻¹ * ‖cFunction α β lam‖⁻¹ ^ 2)

/-- Sanity check of the definition: README 1.1, evenness, `f̃(−λ) = f̃(λ)`, by
`jacobiFunction_neg_spectral`. -/
theorem jacobiTransform_neg (α β : ℝ) (f : ℝ → ℂ) (lam : ℂ) :
    jacobiTransform α β f (-lam) = jacobiTransform α β f lam := by
  sorry

/-- README 1.1. **Entire**: the transform of a continuous compactly supported `f` is entire. -/
theorem differentiable_jacobiTransform (α β : ℝ) (hα : -1 < α) (f : ℝ → ℂ)
    (hf : Continuous f) (hfs : HasCompactSupport f) :
    Differentiable ℂ (jacobiTransform α β f) := by
  sorry

/-- README 1.1. **The Paley–Wiener estimate**: for `f` continuous with support in `[−R, R]`,
`|f̃(λ)| ≤ C e^{R |Im λ|}`. -/
theorem norm_jacobiTransform_le (α β : ℝ) (hαβ : β ≤ α) (hβ : -1 / 2 ≤ β) (f : ℝ → ℂ)
    (hf : Continuous f) {R : ℝ} (hR : tsupport f ⊆ Icc (-R) R) :
    ∃ C, ∀ lam : ℂ, ‖jacobiTransform α β f lam‖ ≤ C * Real.exp (R * |lam.im|) := by
  sorry

/-- README 1.1. **The transform diagonalizes `L`**: `(L f)~(λ) = −(λ² + ρ²) f̃(λ)` for smooth
even compactly supported `f`. -/
theorem jacobiTransform_jacobiOperator (α β : ℝ) (hα : -1 < α) (f : ℝ → ℂ)
    (hf : ContDiff ℝ ∞ f) (hfs : HasCompactSupport f) (heven : ∀ t, f (-t) = f t) (lam : ℂ) :
    jacobiTransform α β (jacobiOperator α β f) lam =
      -(lam ^ 2 + (α + β + 1) ^ 2) * jacobiTransform α β f lam := by
  sorry

/-- README 1.2. **Inversion**: for `α > −1`, `|β| ≤ α + 1` and smooth even compactly supported
`f`, `f(t) = (2π)⁻¹ ∫₀^∞ f̃(λ) φ_λ(t) |c(λ)|⁻² dλ`. -/
theorem jacobiTransform_inversion (α β : ℝ) (hα : -1 < α) (hβ : |β| ≤ α + 1) (f : ℝ → ℂ)
    (hf : ContDiff ℝ ∞ f) (hfs : HasCompactSupport f) (heven : ∀ t, f (-t) = f t) (t : ℝ) :
    f t = ∫ lam in Ioi (0 : ℝ), jacobiTransform α β f lam * jacobiFunction α β lam t *
      ((2 * π)⁻¹ * ‖cFunction α β lam‖⁻¹ ^ 2 : ℝ) := by
  sorry

/-- README 1.2. **Plancherel**: `∫₀^∞ |f|² Δ dt = (2π)⁻¹ ∫₀^∞ |f̃(λ)|² |c(λ)|⁻² dλ`. -/
theorem jacobiTransform_plancherel (α β : ℝ) (hα : -1 < α) (hβ : |β| ≤ α + 1) (f : ℝ → ℂ)
    (hf : ContDiff ℝ ∞ f) (hfs : HasCompactSupport f) (heven : ∀ t, f (-t) = f t) :
    ∫ t in Ioi 0, ‖f t‖ ^ 2 * jacobiWeight α β t =
      ∫ lam in Ioi (0 : ℝ),
        ‖jacobiTransform α β f lam‖ ^ 2 * ((2 * π)⁻¹ * ‖cFunction α β lam‖⁻¹ ^ 2) := by
  sorry

/-- README 1.2. **The unitary Jacobi transform**: a unitary map
`L²((0, ∞), Δ dt) ≃ L²((0, ∞), (2π)⁻¹ |c|⁻² dλ)` extending the transform of smooth even
compactly supported functions. -/
theorem exists_jacobiTransform_linearIsometryEquiv (α β : ℝ) (hα : -1 < α)
    (hβ : |β| ≤ α + 1) :
    ∃ U : Lp ℂ 2 (jacobiMeasure α β) ≃ₗᵢ[ℂ] Lp ℂ 2 (jacobiPlancherelMeasure α β),
      ∀ f : ℝ → ℂ, ContDiff ℝ ∞ f → HasCompactSupport f → (∀ t, f (-t) = f t) →
        ∀ (hf : MemLp f 2 (jacobiMeasure α β))
          (hf' : MemLp (fun lam : ℝ => jacobiTransform α β f lam) 2
            (jacobiPlancherelMeasure α β)),
          U (hf.toLp f) = hf'.toLp _ := by
  sorry

/-- README 1.3. **Discrete terms**: for real `α > −1` and `|β| > α + 1`, with
`λ_j = i(|β| − α − 1 − 2j)` for the `j ∈ ℕ` with `|β| − α − 1 − 2j > 0` (these are the
`j < ⌈(|β| − α − 1)/2⌉`) and `d(λ_j) = (∫₀^∞ φ_{λ_j}² Δ dt)⁻¹`,
`f(t) = (2π)⁻¹ ∫₀^∞ f̃(λ) φ_λ(t) |c(λ)|⁻² dλ + Σ_j d(λ_j) f̃(λ_j) φ_{λ_j}(t)` for smooth even
compactly supported `f`. -/
theorem jacobiTransform_inversion_discrete (α β : ℝ) (hα : -1 < α) (hβ : α + 1 < |β|)
    (f : ℝ → ℂ) (hf : ContDiff ℝ ∞ f) (hfs : HasCompactSupport f) (heven : ∀ t, f (-t) = f t)
    (t : ℝ) :
    f t = (∫ lam in Ioi (0 : ℝ), jacobiTransform α β f lam * jacobiFunction α β lam t *
        ((2 * π)⁻¹ * ‖cFunction α β lam‖⁻¹ ^ 2 : ℝ)) +
      ∑ j ∈ Finset.range ⌈(|β| - α - 1) / 2⌉₊,
        (∫ s in Ioi 0, jacobiFunction α β (I * ((|β| - α - 1 - 2 * j : ℝ) : ℂ)) s ^ 2 *
            (jacobiWeight α β s : ℂ))⁻¹ *
          jacobiTransform α β f (I * ((|β| - α - 1 - 2 * j : ℝ) : ℂ)) *
          jacobiFunction α β (I * ((|β| - α - 1 - 2 * j : ℝ) : ℂ)) t := by
  sorry

/-- README 1.3. **The Paley–Wiener theorem**: for real `α ≥ β ≥ −1/2` and real `R`, the Jacobi
transforms of the smooth even functions supported in `[−R, R]` are exactly the even entire
functions `g` with `(1 + |λ|)^N |g(λ)| ≤ C_N e^{R |Im λ|}` for every `N`. -/
theorem jacobiTransform_paley_wiener (α β : ℝ) (hαβ : β ≤ α) (hβ : -1 / 2 ≤ β) (R : ℝ)
    (g : ℂ → ℂ) :
    (∃ f : ℝ → ℂ, ContDiff ℝ ∞ f ∧ (∀ t, f (-t) = f t) ∧ tsupport f ⊆ Icc (-R) R ∧
        g = jacobiTransform α β f) ↔
      Differentiable ℂ g ∧ (∀ lam, g (-lam) = g lam) ∧
        ∀ N : ℕ, ∃ C : ℝ, ∀ lam : ℂ,
          (1 + ‖lam‖) ^ N * ‖g lam‖ ≤ C * Real.exp (R * |lam.im|) := by
  sorry

/-! ## Layer 2: real hyperbolic space -/

/-- README 2.1. The Lorentz form `[x, y] = x₀ y₀ − x₁ y₁ − ⋯ − xₙ yₙ`. -/
def lorentz {n : ℕ} (x y : Fin (n + 1) → ℝ) : ℝ :=
  x 0 * y 0 - ∑ i : Fin n, x i.succ * y i.succ

/-- README 2.1. The hyperboloid model `ℍⁿ = {x | [x, x] = 1, x₀ > 0}`. -/
def hyperboloid (n : ℕ) : Set (Fin (n + 1) → ℝ) := {x | lorentz x x = 1 ∧ 0 < x 0}

/-- README 2.1. The base point `o = e₀`. -/
def basePoint (n : ℕ) : Fin (n + 1) → ℝ := Pi.single 0 1

/-- README 2.1. The hyperbolic distance `d(x, y) = arcosh [x, y]`. -/
def hyperbolicDist {n : ℕ} (x y : Fin (n + 1) → ℝ) : ℝ := Real.arcosh (lorentz x y)

/-- README 2.1. The group `SO₀(n, 1)`: the matrices of determinant one that preserve the Lorentz
form and map `ℍⁿ` onto itself. -/
def lorentzGroup (n : ℕ) : Subgroup (Matrix.SpecialLinearGroup (Fin (n + 1)) ℝ) where
  carrier := {g | (∀ x y, lorentz (g.1 *ᵥ x) (g.1 *ᵥ y) = lorentz x y) ∧
    (fun x => g.1 *ᵥ x) '' hyperboloid n = hyperboloid n}
  mul_mem' := by
    rintro a b ⟨ha, ha'⟩ ⟨hb, hb'⟩
    have h : (fun x => (a * b).1 *ᵥ x) = (fun x => a.1 *ᵥ x) ∘ fun x => b.1 *ᵥ x := by
      ext x : 1
      simp [Matrix.mulVec_mulVec]
    refine ⟨fun x y => ?_, ?_⟩
    · simp only [Matrix.SpecialLinearGroup.coe_mul, ← Matrix.mulVec_mulVec, ha, hb]
    · rw [h, Set.image_comp, hb', ha']
  one_mem' := by simp
  inv_mem' := by
    rintro g ⟨hg, hg'⟩
    have hc : ∀ x, g.1 *ᵥ ((g⁻¹).1 *ᵥ x) = x := fun x => by
      rw [Matrix.mulVec_mulVec, ← Matrix.SpecialLinearGroup.coe_mul, mul_inv_cancel,
        Matrix.SpecialLinearGroup.coe_one, Matrix.one_mulVec]
    have hc' : ∀ x, (g⁻¹).1 *ᵥ (g.1 *ᵥ x) = x := fun x => by
      rw [Matrix.mulVec_mulVec, ← Matrix.SpecialLinearGroup.coe_mul, inv_mul_cancel,
        Matrix.SpecialLinearGroup.coe_one, Matrix.one_mulVec]
    refine ⟨fun x y => ?_, ?_⟩
    · rw [← hg, hc, hc]
    · apply Set.Subset.antisymm
      · rintro _ ⟨x, hx, rfl⟩
        rw [← hg'] at hx
        obtain ⟨z, hz, rfl⟩ := hx
        simpa only [hc'] using hz
      · intro x hx
        refine ⟨g.1 *ᵥ x, ?_, hc' x⟩
        rw [← hg']
        exact Set.mem_image_of_mem _ hx

/-- README 2.1. The maximal compact subgroup `K ≅ SO(n)`, the stabilizer of `o`. -/
def rotationSubgroup (n : ℕ) : Subgroup (lorentzGroup n) where
  carrier := {g | (g : Matrix.SpecialLinearGroup (Fin (n + 1)) ℝ).1 *ᵥ basePoint n = basePoint n}
  mul_mem' := by
    intro a b ha hb
    simp only [Set.mem_ofPred_eq, Subgroup.coe_mul, Matrix.SpecialLinearGroup.coe_mul,
      ← Matrix.mulVec_mulVec] at *
    rw [hb, ha]
  one_mem' := by simp
  inv_mem' := by
    intro g hg
    simp only [Set.mem_ofPred_eq] at *
    conv_lhs => rw [← hg]
    rw [Matrix.mulVec_mulVec, ← Matrix.SpecialLinearGroup.coe_mul, ← Subgroup.coe_mul,
      inv_mul_cancel]
    simp

/-- README 2.1. The orbit map `g ↦ g o`. -/
def orbitMap (n : ℕ) (g : lorentzGroup n) : Fin (n + 1) → ℝ :=
  (g : Matrix.SpecialLinearGroup (Fin (n + 1)) ℝ).1 *ᵥ basePoint n

/-- README 2.1. **Transitivity**: every point of `ℍⁿ` is `g o` for some `g ∈ SO₀(n, 1)`. -/
theorem exists_orbitMap_eq (n : ℕ) {x : Fin (n + 1) → ℝ} (hx : x ∈ hyperboloid n) :
    ∃ g : lorentzGroup n, orbitMap n g = x := by
  sorry

/-- Sanity check of the definition of `lorentzGroup`: README 2.1, invariance of the distance,
`d(g x, g y) = d(x, y)` for `g ∈ SO₀(n, 1)`. -/
theorem hyperbolicDist_mulVec (n : ℕ) (g : lorentzGroup n) (x y : Fin (n + 1) → ℝ) :
    hyperbolicDist ((g : Matrix.SpecialLinearGroup (Fin (n + 1)) ℝ).1 *ᵥ x)
      ((g : Matrix.SpecialLinearGroup (Fin (n + 1)) ℝ).1 *ᵥ y) = hyperbolicDist x y := by
  sorry

/-- README 2.2. The chart `y ↦ (√(1 + |y|²), y)` of `ℍⁿ` over `ℝⁿ`. -/
def hyperboloidChart (n : ℕ) (y : Fin n → ℝ) : Fin (n + 1) → ℝ :=
  Fin.cons (Real.sqrt (1 + ∑ i, y i ^ 2)) y

/-- README 2.2. The Riemannian volume of `ℍⁿ`, `dy / √(1 + |y|²)` carried by the chart. -/
def hyperbolicMeasure (n : ℕ) : Measure (Fin (n + 1) → ℝ) :=
  ((volume : Measure (Fin n → ℝ)).withDensity fun y =>
    ENNReal.ofReal (Real.sqrt (1 + ∑ i, y i ^ 2))⁻¹).map (hyperboloidChart n)

/-- README 2.2. The area `ω_{n−1} = 2π^{n/2} / Γ(n/2)` of the unit sphere `S^{n−1}`. -/
def sphereArea (n : ℕ) : ℝ := 2 * π ^ ((n : ℝ) / 2) / Real.Gamma ((n : ℝ) / 2)

/-- README 2.2. **Invariance of the volume** under `SO₀(n, 1)`. -/
theorem map_hyperbolicMeasure (n : ℕ) (g : lorentzGroup n) :
    (hyperbolicMeasure n).map
        (fun x => (g : Matrix.SpecialLinearGroup (Fin (n + 1)) ℝ).1 *ᵥ x) =
      hyperbolicMeasure n := by
  sorry

/-- README 2.2. **Polar coordinates**: for `1 ≤ n` and measurable `F ≥ 0`,
`∫ F(d(o, x)) dm(x) = ω_{n−1} ∫₀^∞ F(t) sinh^{n−1} t dt`. -/
theorem lintegral_hyperbolicMeasure_radial (n : ℕ) (hn : 1 ≤ n) (F : ℝ → ℝ≥0∞)
    (hF : Measurable F) :
    ∫⁻ x, F (Real.arcosh (x 0)) ∂hyperbolicMeasure n =
      ENNReal.ofReal (sphereArea n) *
        ∫⁻ t in Ioi 0, F t * ENNReal.ofReal (Real.sinh t ^ (n - 1)) := by
  sorry

/-- README 2.2. **Horospherical coordinates**: on `ℍ^{n+1}`, for measurable `f ≥ 0`, with
`x(s, v) = (cosh s + |v|² e^{−s}/2, e^{−s} v, −sinh s − |v|² e^{−s}/2)`, `v ∈ ℝⁿ`,
`∫ f dm = ∫_ℝ ∫_{ℝⁿ} f(x(s, v)) e^{−ns} dv ds`. -/
theorem lintegral_hyperbolicMeasure_horospherical (n : ℕ) (f : (Fin (n + 2) → ℝ) → ℝ≥0∞)
    (hf : Measurable f) :
    ∫⁻ x, f x ∂hyperbolicMeasure (n + 1) =
      ∫⁻ s, ∫⁻ v : Fin n → ℝ,
        f (Fin.cons (Real.cosh s + (∑ i, v i ^ 2) * Real.exp (-s) / 2)
            (Fin.snoc (fun i => v i * Real.exp (-s))
              (-Real.sinh s - (∑ i, v i ^ 2) * Real.exp (-s) / 2))) *
          ENNReal.ofReal (Real.exp (-(n * s))) := by
  sorry

/-- README 2.3. The Laplace–Beltrami operator of `ℍⁿ` through the ambient wave operator
(Wawrzyńczyk (11.5.1)–(11.5.3)): `Δf(x) = (∂₁² + ⋯ + ∂ₙ² − ∂₀²) f(y / √[y, y])` at `y = x`. Only
the values of `f` on `ℍⁿ` enter; off the cone `[y, y] > 0` the extension is junk, which does not
matter at points of `ℍⁿ`. -/
def hyperbolicLaplacian (n : ℕ) (f : (Fin (n + 1) → ℝ) → ℂ) (x : Fin (n + 1) → ℝ) : ℂ :=
  let fe : (Fin (n + 1) → ℝ) → ℂ := fun y => f ((Real.sqrt (lorentz y y))⁻¹ • y)
  ∑ i : Fin n, iteratedDeriv 2 (fun s : ℝ => fe (x + s • Pi.single i.succ 1)) 0 -
    iteratedDeriv 2 (fun s : ℝ => fe (x + s • Pi.single 0 1)) 0

/-- README 2.3. **Invariance**: `Δ(f ∘ g) = (Δf) ∘ g` on `ℍⁿ` for smooth `f`. -/
theorem hyperbolicLaplacian_comp (n : ℕ) (f : (Fin (n + 1) → ℝ) → ℂ) (hf : ContDiff ℝ 2 f)
    (g : lorentzGroup n) {x : Fin (n + 1) → ℝ} (hx : x ∈ hyperboloid n) :
    hyperbolicLaplacian n
        (fun y => f ((g : Matrix.SpecialLinearGroup (Fin (n + 1)) ℝ).1 *ᵥ y)) x =
      hyperbolicLaplacian n f ((g : Matrix.SpecialLinearGroup (Fin (n + 1)) ℝ).1 *ᵥ x) := by
  sorry

/-- README 2.3. **Radial part**: for `F` twice differentiable on `(0, ∞)` and `x ∈ ℍⁿ \ {o}`
with `t = arcosh x₀`, `Δ(F ∘ d(o, ·))(x) = F''(t) + (n − 1) coth t F'(t)`. -/
theorem hyperbolicLaplacian_radial (n : ℕ) (F : ℝ → ℂ) (hF : ContDiffOn ℝ 2 F (Ioi 0))
    {x : Fin (n + 1) → ℝ} (hx : x ∈ hyperboloid n) (hxo : x ≠ basePoint n) :
    hyperbolicLaplacian n (fun y => F (Real.arcosh (y 0))) x =
      deriv (deriv F) (Real.arcosh (x 0)) +
        ((n - 1) * (Real.cosh (Real.arcosh (x 0)) / Real.sinh (Real.arcosh (x 0))) : ℝ) *
          deriv F (Real.arcosh (x 0)) := by
  sorry

/-- README 2.4. The boundary point `b̃ = (1, b)` of the light cone over `b ∈ S^{n−1}`. -/
def boundaryVector (n : ℕ) (b : Metric.sphere (0 : EuclideanSpace ℝ (Fin n)) 1) :
    Fin (n + 1) → ℝ :=
  Fin.cons 1 fun i => (b : EuclideanSpace ℝ (Fin n)) i

/-- README 2.4. The normalized rotation-invariant measure `dσ` on `S^{n−1}` is used through the
average `⨍ b, _ ∂sphereMeasure n`. -/
def sphereMeasure (n : ℕ) : Measure (Metric.sphere (0 : EuclideanSpace ℝ (Fin n)) 1) :=
  (volume : Measure (EuclideanSpace ℝ (Fin n))).toSphere

/-- README 2.4. **Plane waves**: `Δ [x, b̃]^{−μ} = μ(μ − n + 1) [x, b̃]^{−μ}` on `ℍⁿ`. -/
theorem hyperbolicLaplacian_planeWave (n : ℕ) (μ : ℂ)
    (b : Metric.sphere (0 : EuclideanSpace ℝ (Fin n)) 1) {x : Fin (n + 1) → ℝ}
    (hx : x ∈ hyperboloid n) :
    hyperbolicLaplacian n (fun y => (lorentz y (boundaryVector n b) : ℂ) ^ (-μ)) x =
      μ * (μ - n + 1) * (lorentz x (boundaryVector n b) : ℂ) ^ (-μ) := by
  sorry

/-- README 2.4. **Poisson integrals are harmonic**: for continuous `F` on `S^{n−1}`, the Poisson
integral `u(x) = ∫ [x, b̃]^{1−n} F(b) dσ(b)` satisfies `Δu = 0` on `ℍⁿ`. -/
theorem hyperbolicLaplacian_poisson (n : ℕ) (hn : 2 ≤ n)
    (F : Metric.sphere (0 : EuclideanSpace ℝ (Fin n)) 1 → ℂ) (hF : Continuous F)
    {x : Fin (n + 1) → ℝ} (hx : x ∈ hyperboloid n) :
    hyperbolicLaplacian n
        (fun y => ⨍ b, (lorentz y (boundaryVector n b) : ℂ) ^ (1 - (n : ℂ)) * F b ∂sphereMeasure n)
        x = 0 := by
  sorry

section Gelfand

attribute [local instance] borel

/-- README 2.5. **`(SO₀(n, 1), SO(n))` is a Gel'fand pair**, through the involution
`g ↦ J g⁻ᵀ J` of SpecialFunctionsGroupModels §5.1. -/
theorem isGelfandPair_lorentzGroup (n : ℕ) (μ : Measure (lorentzGroup n)) [μ.IsHaarMeasure] :
    IsGelfandPair μ (rotationSubgroup n) := by
  sorry

/-! ## Layer 3: spherical functions on `ℍⁿ` -/

/-- README 3.1. The spherical function of `ℍⁿ`: `φ_λ(x) = φ_λ^{(n/2−1, −1/2)}(arcosh x₀)`. -/
def sphericalFunction (n : ℕ) (lam : ℂ) (x : Fin (n + 1) → ℝ) : ℂ :=
  jacobiFunction ((n : ℂ) / 2 - 1) (-1 / 2) lam (Real.arcosh (x 0))

/-- README 3.1. **Harish-Chandra's integral** (Wawrzyńczyk §18.1, Example 1): for `2 ≤ n` and
`x ∈ ℍⁿ`, `φ_λ(x) = ∫ [x, b̃]^{−(iλ + ρ)} dσ(b)`, `ρ = (n − 1)/2`. -/
theorem sphericalFunction_eq_average (n : ℕ) (hn : 2 ≤ n) (lam : ℂ) {x : Fin (n + 1) → ℝ}
    (hx : x ∈ hyperboloid n) :
    sphericalFunction n lam x =
      ⨍ b, (lorentz x (boundaryVector n b) : ℂ) ^ (-(I * lam + ((n : ℂ) - 1) / 2))
        ∂sphereMeasure n := by
  sorry

/-- README 3.1. **Eigenfunction**: `Δφ_λ = −(λ² + ρ²) φ_λ` on `ℍⁿ`. -/
theorem hyperbolicLaplacian_sphericalFunction (n : ℕ) (lam : ℂ)
    {x : Fin (n + 1) → ℝ} (hx : x ∈ hyperboloid n) :
    hyperbolicLaplacian n (sphericalFunction n lam) x =
      -(lam ^ 2 + (((n : ℂ) - 1) / 2) ^ 2) * sphericalFunction n lam x := by
  sorry

/-- README 3.2. **`φ_λ ∘ (g ↦ g o)` is a spherical function** of the Gel'fand pair, in the sense
of SpecialFunctionsGroupModels §5.2, for the normalized Haar measure `ν` of `K`. -/
theorem isSphericalFunction_sphericalFunction (n : ℕ) (hn : 2 ≤ n) (lam : ℂ)
    (ν : Measure (rotationSubgroup n)) [IsProbabilityMeasure ν] [ν.IsMulLeftInvariant] :
    IsSphericalFunction (rotationSubgroup n) ν fun g => sphericalFunction n lam (orbitMap n g) := by
  sorry

/-- README 3.2. **Classification**: every spherical function of the pair is a `φ_λ ∘ orbitMap`. -/
theorem isSphericalFunction_iff (n : ℕ) (hn : 2 ≤ n) (ν : Measure (rotationSubgroup n))
    [IsProbabilityMeasure ν] [ν.IsMulLeftInvariant] (φ : lorentzGroup n → ℂ) :
    IsSphericalFunction (rotationSubgroup n) ν φ ↔
      ∃ lam : ℂ, φ = fun g => sphericalFunction n lam (orbitMap n g) := by
  sorry

/-- README 3.2. **Parametrization**: `φ_λ ∘ orbitMap = φ_μ ∘ orbitMap` exactly when `μ = ±λ`. -/
theorem sphericalFunction_comp_orbitMap_eq_iff (n : ℕ) (hn : 1 ≤ n) (lam μ : ℂ) :
    ((fun g => sphericalFunction n lam (orbitMap n g)) =
      fun g => sphericalFunction n μ (orbitMap n g)) ↔ (μ = lam ∨ μ = -lam) := by
  sorry

end Gelfand

/-! ## Layer 4: harmonic analysis on `ℍⁿ` -/

/-- README 4.1. The spherical transform `Sf(λ) = ∫ f(x) φ_λ(x) dm(x)`. -/
def sphericalTransform (n : ℕ) (f : (Fin (n + 1) → ℝ) → ℂ) (lam : ℂ) : ℂ :=
  ∫ x, f x * sphericalFunction n lam x ∂hyperbolicMeasure n

/-- README 4.1. The Plancherel constant `2^{n−1} / (2π ω_{n−1})` of `ℍⁿ`. -/
def plancherelConstant (n : ℕ) : ℝ := 2 ^ (n - 1) / (2 * π * sphereArea n)

/-- README 4.1. **The spherical transform is a Jacobi transform**: for radial
`f = F ∘ d(o, ·)` with `F` measurable,
`Sf(λ) = ω_{n−1} 2^{1−n} F̃(λ)` with `(α, β) = (n/2 − 1, −1/2)`. -/
theorem sphericalTransform_radial (n : ℕ) (hn : 1 ≤ n) (F : ℝ → ℂ) (hF : Measurable F)
    (lam : ℂ) :
    sphericalTransform n (fun x => F (Real.arcosh (x 0))) lam =
      (sphereArea n / 2 ^ (n - 1) : ℝ) * jacobiTransform ((n : ℝ) / 2 - 1) (-1 / 2) F lam := by
  sorry

/-- README 4.1. **Inversion for radial functions**: for `F` smooth, even and of compact support,
`f = F ∘ d(o, ·)` and `C = 2^{n−1} / (2π ω_{n−1})`, `F(t) = C ∫₀^∞ Sf(λ) φ_λ(t) |c(λ)|⁻² dλ`. -/
theorem sphericalTransform_inversion (n : ℕ) (hn : 2 ≤ n) (F : ℝ → ℂ) (hF : ContDiff ℝ ∞ F)
    (hFs : HasCompactSupport F) (heven : ∀ t, F (-t) = F t) (t : ℝ) :
    F t = plancherelConstant n * ∫ lam in Ioi (0 : ℝ),
      sphericalTransform n (fun x => F (Real.arcosh (x 0))) lam *
        jacobiFunction ((n : ℝ) / 2 - 1) (-1 / 2) lam t *
        (‖cFunction ((n : ℝ) / 2 - 1) (-1 / 2) lam‖⁻¹ ^ 2 : ℝ) := by
  sorry

/-- README 4.1. **Plancherel for radial functions**: for the same `F`,
`∫ |f|² dm = C ∫₀^∞ |Sf(λ)|² |c(λ)|⁻² dλ`. -/
theorem sphericalTransform_plancherel (n : ℕ) (hn : 2 ≤ n) (F : ℝ → ℂ) (hF : ContDiff ℝ ∞ F)
    (hFs : HasCompactSupport F) (heven : ∀ t, F (-t) = F t) :
    ∫ x, ‖F (Real.arcosh (x 0))‖ ^ 2 ∂hyperbolicMeasure n =
      plancherelConstant n * ∫ lam in Ioi (0 : ℝ),
        ‖sphericalTransform n (fun x => F (Real.arcosh (x 0))) lam‖ ^ 2 *
          ‖cFunction ((n : ℝ) / 2 - 1) (-1 / 2) lam‖⁻¹ ^ 2 := by
  sorry

/-- README 4.2. The Abel transform
`𝒜F(s) = e^{−ρs} ∫_{ℝ^{n−1}} F(arcosh(cosh s + |v|² e^{−s}/2)) dv`, `ρ = (n − 1)/2`, on
`ℍⁿ` with `n = m + 1`. -/
def abelTransform (m : ℕ) (F : ℝ → ℂ) (s : ℝ) : ℂ :=
  Real.exp (-(m * s / 2)) *
    ∫ v : Fin m → ℝ, F (Real.arcosh (Real.cosh s + (∑ i, v i ^ 2) * Real.exp (-s) / 2))

/-- README 4.2. **The Abel transform is even.** -/
theorem abelTransform_neg (m : ℕ) (F : ℝ → ℂ) (s : ℝ) :
    abelTransform m F (-s) = abelTransform m F s := by
  sorry

/-- README 4.2. **Spherical transform = Fourier ∘ Abel**: for `F` continuous of compact support,
`S(F ∘ d(o, ·))(λ) = ∫ 𝒜F(s) e^{iλs} ds`. -/
theorem sphericalTransform_eq_integral_abelTransform (m : ℕ) (F : ℝ → ℂ) (hF : Continuous F)
    (hFs : HasCompactSupport F) (lam : ℂ) :
    sphericalTransform (m + 1) (fun x => F (Real.arcosh (x 0))) lam =
      ∫ s, abelTransform m F s * exp (I * lam * s) := by
  sorry

/-- README 4.2. **The Abel transform of `ℍ³`**: `𝒜F(s) = 2π ∫_{cosh s}^∞ F(arcosh u) du`. -/
theorem abelTransform_two (F : ℝ → ℂ) (s : ℝ) :
    abelTransform 2 F s = 2 * π * ∫ u in Ioi (Real.cosh s), F (Real.arcosh u) := by
  sorry

/-- README 4.3. The Helgason–Fourier transform `f̂(λ, b) = ∫ f(x) [x, b̃]^{iλ − ρ} dm(x)`. -/
def helgasonFourier (n : ℕ) (f : (Fin (n + 1) → ℝ) → ℂ) (lam : ℂ)
    (b : Metric.sphere (0 : EuclideanSpace ℝ (Fin n)) 1) : ℂ :=
  ∫ x, f x * (lorentz x (boundaryVector n b) : ℂ) ^ (I * lam - ((n : ℂ) - 1) / 2)
    ∂hyperbolicMeasure n

/-- README 4.3. **Inversion for the Helgason–Fourier transform**: for `f` smooth of compact
support and `x ∈ ℍⁿ`, with `C = 2^{n−1} / (2π ω_{n−1})`,
`f(x) = C ∫₀^∞ ∫ f̂(λ, b) [x, b̃]^{−iλ−ρ} dσ(b) |c(λ)|⁻² dλ`. -/
theorem helgasonFourier_inversion (n : ℕ) (hn : 2 ≤ n) (f : (Fin (n + 1) → ℝ) → ℂ)
    (hf : ContDiff ℝ ∞ f) (hfs : HasCompactSupport f) {x : Fin (n + 1) → ℝ}
    (hx : x ∈ hyperboloid n) :
    f x = plancherelConstant n * ∫ lam in Ioi (0 : ℝ),
      (⨍ b, helgasonFourier n f lam b *
          (lorentz x (boundaryVector n b) : ℂ) ^ (-(I * lam) - ((n : ℂ) - 1) / 2)
        ∂sphereMeasure n) *
        (‖cFunction ((n : ℝ) / 2 - 1) (-1 / 2) lam‖⁻¹ ^ 2 : ℝ) := by
  sorry

/-- README 4.3. **Plancherel for the Helgason–Fourier transform**: for the same `f`,
`∫ |f|² dm = C ∫₀^∞ ∫ |f̂(λ, b)|² dσ(b) |c(λ)|⁻² dλ`. -/
theorem helgasonFourier_plancherel (n : ℕ) (hn : 2 ≤ n) (f : (Fin (n + 1) → ℝ) → ℂ)
    (hf : ContDiff ℝ ∞ f) (hfs : HasCompactSupport f) :
    ∫ x, ‖f x‖ ^ 2 ∂hyperbolicMeasure n =
      plancherelConstant n * ∫ lam in Ioi (0 : ℝ),
        (⨍ b, ‖helgasonFourier n f lam b‖ ^ 2 ∂sphereMeasure n) *
          ‖cFunction ((n : ℝ) / 2 - 1) (-1 / 2) lam‖⁻¹ ^ 2 := by
  sorry

/-- README 4.3. **The transform diagonalizes `Δ`**: `(Δf)^(λ, b) = −(λ² + ρ²) f̂(λ, b)`. -/
theorem helgasonFourier_hyperbolicLaplacian (n : ℕ) (f : (Fin (n + 1) → ℝ) → ℂ)
    (hf : ContDiff ℝ ∞ f) (hfs : HasCompactSupport f) (lam : ℂ)
    (b : Metric.sphere (0 : EuclideanSpace ℝ (Fin n)) 1) :
    helgasonFourier n (hyperbolicLaplacian n f) lam b =
      -(lam ^ 2 + (((n : ℂ) - 1) / 2) ^ 2) * helgasonFourier n f lam b := by
  sorry

/-! ## Supplier names cited in `README.md` -/

#check @Real.arcosh
#check @Complex.Gamma
#check @Matrix.SpecialLinearGroup
#check @MeasureTheory.Measure.toSphere
#check @MeasureTheory.average
#check @MeasureTheory.Lp
#check @MeasureTheory.Measure.IsHaarMeasure
#check @LinearIsometryEquiv
#check @iteratedDeriv
#check @ascPochhammer

end TauCetiRoadmap.SpecialFunctionsRankOneSymmetricSpaces
