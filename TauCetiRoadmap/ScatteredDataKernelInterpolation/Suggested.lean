module

public import Mathlib
public import TauCeti.Analysis.Bochner.BochnerTheorem
public import TauCeti.Analysis.Bochner.Fourier.Nonneg
public import TauCeti.Analysis.Bochner.Gaussian.Basic
public import TauCeti.Analysis.CompletelyMonotone.Bernstein.HausdorffBernsteinWidder
public import TauCeti.Analysis.CompletelyMonotone.Bernstein.OpenHalfLine
public import TauCeti.Analysis.PositiveDefinite.Kernel.Kolmogorov

/-!
# Scattered data interpolation with kernels: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is `README.md`.
This file states the headlines of `README.md` that carry a Lean name, each with every conclusion
the README attaches to it, against the pinned Mathlib and Tau Ceti, with `sorry` proofs, together
with the definitions those statements need; every definition has a real body. The README's other
headlines are targets of the same standing, stated in prose.

Conventions (README, Conventions). Points live in `EuclideanSpace ℝ (Fin d)`, or in a
finite-dimensional real inner product space `V` where the statement needs no coordinates. A
function `Φ` is strictly positive definite when the translation kernel `(x, y) ↦ Φ (x - y)` is
Mathlib's `Matrix.PosDef` (finitely supported coefficient vectors, so the centres are distinct by
construction); a real kernel `K` is strictly positive definite when `Matrix.PosDef K` holds over
`ℝ`. The Fourier transform is Mathlib's `𝓕`, with kernel `e^{-2πi⟪x, ξ⟫}`, and Bochner's
representation is Tau Ceti's `TauCeti.bochner` with `TauCeti.fourierAtom`. Radial profiles are
functions `ℝ → ℝ` evaluated at `‖x‖` (Wendland's convention) or at `‖x‖ ^ 2` (Schoenberg's and
Micchelli's convention), as each statement says. Polynomials on `ℝᵈ` are `MvPolynomial (Fin d) ℝ`
with `totalDegree`. The native space of a positive semidefinite real kernel `K`,
`hK : Matrix.PosSemidef K`, is Tau Ceti's Kolmogorov space `hK.KolmogorovSpace`, which is Mathlib's
`RKHS.OfKernel` of `TauCeti.positiveDefiniteKernelOperator K`. Fill distances are `ℝ≥0∞`-valued.

Two definitions are verbatim local copies of `KernelsAndSpectralMethods` §8.2 (`gaussianKernel`,
`imqKernel`). The Fourier transform of a radial function, `𝓕(φ ∘ ‖·‖)(ξ) = radialFourier d φ ‖ξ‖`
for `ξ ≠ 0`, is consumed from the open roadmap SpecialFunctionsMotionGroupsBessel (PR #2933) §5.3
and is not restated here. `isCondPosSemidef_zero_iff` and `wendland_zero` are proved sanity
checks.
-/

@[expose] public section

noncomputable section

open MeasureTheory Set Filter Topology Polynomial
open scoped ENNReal NNReal FourierTransform ComplexOrder InnerProductSpace

namespace TauCetiRoadmap.ScatteredDataKernelInterpolation

attribute [local instance] Classical.propDecidable

/-! ## Local copies of vocabulary owned elsewhere -/

section LocalCopies

variable {d : ℕ}

/-- Local copy of `KernelsAndSpectralMethods` §8.2: the Gaussian kernel
`exp(-‖x - y‖² / (2σ²))`. -/
def gaussianKernel (σ : ℝ) (x y : EuclideanSpace ℝ (Fin d)) : ℝ :=
  Real.exp (-‖x - y‖ ^ 2 / (2 * σ ^ 2))

/-- Local copy of `KernelsAndSpectralMethods` §8.2: the inverse multiquadric kernel
`(c² + ‖x - y‖²)^(-β)`. -/
def imqKernel (c β : ℝ) (x y : EuclideanSpace ℝ (Fin d)) : ℝ :=
  (c ^ 2 + ‖x - y‖ ^ 2) ^ (-β)

end LocalCopies

/-! ## Supplier vocabulary named in the README -/

#check @Matrix.PosDef
#check @Matrix.PosSemidef
#check @Matrix.IsHermitian
#check @Matrix.IsHermitian.eigenvalues
#check @fourier_gaussian_innerProductSpace
#check @MeasureTheory.integral_fun_norm_addHaar
#check @MeasureTheory.Measure.support
#check @Function.IsRadial
#check @Complex.besselJ
#check @Real.Gamma
#check @RKHS
#check @RKHS.OfKernel
#check @RKHS.OfKernel.kernel_ofKernel
#check @RKHS.kerFun
#check @RKHS.inner_kerFun
#check @RKHS.kerFun_dense
#check @Submodule.starProjection
#check @Submodule.topologicalClosure
#check @MvPolynomial.totalDegree
#check @MvPolynomial.restrictTotalDegree
#check @Polynomial.natDegree
#check @iteratedFDeriv
#check @iteratedDeriv
#check @ContDiff
#check @ContDiffOn
#check @Metric.infEDist
#check @Bornology.IsBounded
#check @TauCeti.bochner
#check @TauCeti.fourierAtom
#check @TauCeti.IsPositiveDefiniteSub
#check @TauCeti.IsPositiveDefiniteSub.posSemidef
#check @TauCeti.fourier_re_nonneg_of_posSemidef
#check @TauCeti.posSemidef_cexp_neg_mul_sq_norm
#check @TauCeti.IsCompletelyMonotoneOnIoi
#check @TauCeti.IsContinuousCompletelyMonotoneOnIoi
#check @TauCeti.hausdorff_bernstein_widder
#check @TauCeti.hausdorff_bernstein_widder_onIoi
#check @TauCeti.RepresentsLaplace
#check @TauCeti.positiveDefiniteKernelOperator
#check @TauCeti.posSemidef_positiveDefiniteKernelOperator
#check @Matrix.PosSemidef.KolmogorovSpace
#check @Matrix.PosSemidef.kolmogorovFeature
#check @Matrix.PosSemidef.inner_kolmogorovFeature
#check @Matrix.PosSemidef.kolmogorovFeature_dense

/-! ## Layer 1: strictly positive definite functions -/

section StrictBochner

variable {V : Type*} [NormedAddCommGroup V] [InnerProductSpace ℝ V] [FiniteDimensional ℝ V]

/-- **1.1** (Wendland, Theorem 6.3) A real function is positive definite with complex
coefficients exactly when it is with real ones; the real `Matrix.PosDef` includes evenness. -/
theorem posDef_ofReal_iff {G : Type*} [AddCommGroup G] (Φ : G → ℝ) :
    Matrix.PosDef (fun x y : G ↦ (Φ (x - y) : ℂ)) ↔ Matrix.PosDef (fun x y : G ↦ Φ (x - y)) :=
  sorry

/-- **1.1** (Wendland, Lemma 6.7) Fourier atoms at distinct points are linearly independent on
every nonempty open set. -/
theorem eq_zero_of_sum_fourierAtom_eq_zero {N : ℕ} {x : Fin N → V} (hx : Function.Injective x)
    {U : Set V} (hU : IsOpen U) (hU' : U.Nonempty) (c : Fin N → ℂ)
    (h : ∀ ω ∈ U, ∑ j, c j * TauCeti.fourierAtom (x j) ω = 0) : c = 0 :=
  sorry

/-- **1.1** (Wendland, Theorem 6.8) If the support of the Bochner measure has an interior
point, the represented function is strictly positive definite. -/
theorem posDef_of_interior_support_nonempty [MeasurableSpace V] [BorelSpace V] (μ : Measure V)
    [IsFiniteMeasure μ]
    (hμ : (interior μ.support).Nonempty) :
    Matrix.PosDef (fun x y : V ↦ ∫ q, TauCeti.fourierAtom (x - y) q ∂μ) :=
  sorry

/-- **1.2** (Wendland, Theorem 6.11) A continuous integrable function is strictly positive
definite exactly when it is bounded and its Fourier transform is nonnegative and not identically
zero. -/
theorem posDef_iff_of_integrable [MeasurableSpace V] [BorelSpace V] (Φ : V → ℂ)
    (hcont : Continuous Φ) (hint : Integrable Φ) :
    Matrix.PosDef (fun x y : V ↦ Φ (x - y)) ↔
      (∃ C, ∀ x, ‖Φ x‖ ≤ C) ∧ (∀ ξ, 0 ≤ 𝓕 Φ ξ) ∧ 𝓕 Φ ≠ 0 :=
  sorry

end StrictBochner

section Examples

variable {d : ℕ}

/-- **1.2** (Wendland, Theorem 6.10) The Gaussian kernel is strictly positive definite on every
`ℝᵈ`. -/
theorem posDef_gaussianKernel {σ : ℝ} (hσ : 0 < σ) :
    Matrix.PosDef (gaussianKernel (d := d) σ) :=
  sorry

end Examples

/-! ### 1.3 Radial functions and truncated powers -/

/-- **1.3** The `d`-dimensional radial Fourier transform of a profile (Wendland's `F_d`), in
Mathlib's `2π` normalization: `2π r^{-(d-2)/2} ∫₀^∞ φ(t) t^{d/2} J_{(d-2)/2}(2π r t) dt`. For
`d ≥ 1`, `ξ ≠ 0` and `φ ∘ ‖·‖` integrable on `ℝᵈ` it is `𝓕(φ ∘ ‖·‖)(ξ)` at `r = ‖ξ‖`: that is
the theorem fourier_radial of SpecialFunctionsMotionGroupsBessel (PR #2933) §5.3, consumed. -/
def radialFourier (d : ℕ) (φ : ℝ → ℝ) (r : ℝ) : ℂ :=
  2 * Real.pi * (r : ℂ) ^ (-(((d : ℂ) - 2) / 2)) *
    ∫ t in Ioi (0 : ℝ), (φ t : ℂ) * (t : ℂ) ^ ((d : ℂ) / 2) *
      Complex.besselJ (((d : ℂ) - 2) / 2) (2 * Real.pi * r * t)

/-- **1.3** The truncated power `(1 - r)₊^ℓ`. -/
def truncatedPower (ℓ : ℕ) (r : ℝ) : ℝ :=
  max (1 - r) 0 ^ ℓ

/-- **1.3** (Wendland, Theorem 6.20; Askey) The truncated power `(1 - ‖x‖)₊^ℓ` is strictly
positive definite on `ℝᵈ` for `ℓ ≥ ⌊d/2⌋ + 1`. -/
theorem posDef_truncatedPower {d ℓ : ℕ} (hℓ : d / 2 + 1 ≤ ℓ) :
    Matrix.PosDef (fun x y : EuclideanSpace ℝ (Fin d) ↦ truncatedPower ℓ ‖x - y‖) :=
  sorry

/-! ### 1.4 Completely monotone profiles -/

/-- **1.4** (Wendland, Theorem 7.14; Schoenberg) For `ψ` continuous on `[0, ∞)`, `ψ(‖x - y‖²)`
is strictly positive definite on every `ℝᵈ` exactly when `ψ` is completely monotone on `(0, ∞)`
and not constant. -/
theorem posDef_sq_norm_iff (ψ : ℝ → ℝ) (hψ : ContinuousOn ψ (Ici 0)) :
    (∀ d, Matrix.PosDef (fun x y : EuclideanSpace ℝ (Fin d) ↦ ψ (‖x - y‖ ^ 2))) ↔
      TauCeti.IsCompletelyMonotoneOnIoi ψ ∧ ∃ t, 0 ≤ t ∧ ψ t ≠ ψ 0 :=
  sorry

/-- **1.4** (Wendland, Theorem 7.15) The inverse multiquadric is strictly positive definite on
every `ℝᵈ` for `c > 0`, `β > 0`. -/
theorem posDef_imqKernel {d : ℕ} {c β : ℝ} (hc : 0 < c) (hβ : 0 < β) :
    Matrix.PosDef (imqKernel (d := d) c β) :=
  sorry

/-! ## Layer 2: compactly supported functions of minimal degree -/

/-- **2.1** Wendland's operator `(Iφ)(r) = ∫_r^∞ t φ(t) dt`. -/
def radialIntegral (φ : ℝ → ℝ) (r : ℝ) : ℝ :=
  ∫ t in Ioi r, t * φ t

/-- **2.1** (Wendland, Theorem 9.6 (1)) The dimension walk: for `d ≥ 3` and a continuous profile
with `t^{d-1} φ(t)` integrable, the `d`-dimensional radial transform of `φ` is `2π` times the
`(d - 2)`-dimensional radial transform of `Iφ`. -/
theorem radialFourier_radialIntegral {d : ℕ} (hd : 3 ≤ d) {φ : ℝ → ℝ} (hφ : Continuous φ)
    (hint : IntegrableOn (fun t ↦ t ^ (d - 1) * φ t) (Ioi 0)) {r : ℝ} (hr : 0 < r) :
    radialFourier d φ r = 2 * Real.pi * radialFourier (d - 2) (radialIntegral φ) r :=
  sorry

/-- **2.2** The Wendland function `φ_{d,k} = I^k (1 - r)₊^{⌊d/2⌋ + k + 1}`. -/
def wendland (d k : ℕ) : ℝ → ℝ :=
  radialIntegral^[k] (truncatedPower (d / 2 + k + 1))

/-- Check (2.2): `φ_{d,0}` is the truncated power of Layer 1. -/
theorem wendland_zero (d : ℕ) : wendland d 0 = truncatedPower (d / 2 + 1) := rfl

/-- **2.2** (Wendland, Theorems 9.12–9.13) On `[0, 1]` the Wendland function is a polynomial of
degree `⌊d/2⌋ + 3k + 1`, and it vanishes on `[1, ∞)`. -/
theorem wendland_eq_polynomial (d k : ℕ) :
    (∃ p : ℝ[X], p.natDegree = d / 2 + 3 * k + 1 ∧ EqOn (wendland d k) p.eval (Icc 0 1)) ∧
      ∀ r, 1 ≤ r → wendland d k r = 0 :=
  sorry

/-- **2.2** (Wendland, Theorem 9.13 and Lemma 9.8) The even extension of `φ_{d,k}` is `C^{2k}` on
`ℝ`, and so is the radial function `φ_{d,k}(‖·‖)` on every `ℝᵐ`. -/
theorem contDiff_wendland (d k : ℕ) :
    ContDiff ℝ (2 * k) (fun r : ℝ ↦ wendland d k |r|) ∧
      ∀ m : ℕ, ContDiff ℝ (2 * k) (fun x : EuclideanSpace ℝ (Fin m) ↦ wendland d k ‖x‖) :=
  sorry

/-- **2.2** (Wendland, Theorem 9.13) `φ_{d,k}(‖·‖)` is strictly positive definite on `ℝᵈ`. -/
theorem posDef_wendland (d k : ℕ) :
    Matrix.PosDef (fun x y : EuclideanSpace ℝ (Fin d) ↦ wendland d k ‖x - y‖) :=
  sorry

/-- **2.2** (Wendland, Corollary 9.14) The closed form of `φ_{d,1}`: with `ℓ = ⌊d/2⌋ + 2`,
`φ_{d,1}(r) = (1 - r)₊^{ℓ+1} ((ℓ + 1) r + 1) / ((ℓ + 1)(ℓ + 2))` for `r ≥ 0`. -/
theorem wendland_one (d : ℕ) {r : ℝ} (hr : 0 ≤ r) :
    wendland d 1 r = max (1 - r) 0 ^ (d / 2 + 3) * ((d / 2 + 3 : ℕ) * r + 1) /
      (((d / 2 + 3 : ℕ) : ℝ) * ((d / 2 + 4 : ℕ) : ℝ)) :=
  sorry

/-- **2.3** (Wendland, Theorem 9.13) Minimality and uniqueness: a nonzero profile that is a
polynomial `p` on `[0, 1]` and vanishes on `(1, ∞)`, whose even extension is `C^{2k}` and whose
radial function is strictly positive definite on `ℝᵈ`, `d ≥ 1`, has degree at least
`⌊d/2⌋ + 3k + 1`,
and in the case of equality it is a positive multiple of `φ_{d,k}` on `[0, ∞)`. -/
theorem wendland_minimal_degree {d : ℕ} (hd : 1 ≤ d) (k : ℕ) (p : ℝ[X])
    (hsmooth : ContDiff ℝ (2 * k) (fun r : ℝ ↦ if |r| ≤ 1 then p.eval |r| else 0))
    (hpd : Matrix.PosDef (fun x y : EuclideanSpace ℝ (Fin d) ↦
      if ‖x - y‖ ≤ 1 then p.eval ‖x - y‖ else 0)) :
    d / 2 + 3 * k + 1 ≤ p.natDegree ∧
      (p.natDegree = d / 2 + 3 * k + 1 →
        ∃ c > 0, ∀ r, 0 ≤ r → (if r ≤ 1 then p.eval r else 0) = c * wendland d k r) :=
  sorry

/-- **2.4** (Wendland, Theorem 10.35) Two-sided algebraic decay of the Fourier transform of
`φ_{d,k}(‖·‖)`, for `k ≥ 1`, or `k = 0` and `d ≥ 3`. -/
theorem fourier_wendland_bounds {d k : ℕ} (hk : 1 ≤ k ∨ 3 ≤ d) :
    ∃ c₁ > 0, ∃ c₂ > 0, ∀ ξ : EuclideanSpace ℝ (Fin d),
      (𝓕 (fun x : EuclideanSpace ℝ (Fin d) ↦ (wendland d k ‖x‖ : ℂ)) ξ).im = 0 ∧
      c₁ * (1 + ‖ξ‖) ^ (-((d + 2 * k + 1 : ℕ) : ℤ)) ≤
        (𝓕 (fun x : EuclideanSpace ℝ (Fin d) ↦ (wendland d k ‖x‖ : ℂ)) ξ).re ∧
      (𝓕 (fun x : EuclideanSpace ℝ (Fin d) ↦ (wendland d k ‖x‖ : ℂ)) ξ).re ≤
        c₂ * (1 + ‖ξ‖) ^ (-((d + 2 * k + 1 : ℕ) : ℤ)) :=
  sorry

/-! ## Layer 3: conditionally positive definite functions -/

section Conditional

variable {d : ℕ}

/-- **3.1** The coefficient vector `c` annihilates the polynomials of total degree `< m`. -/
def AnnihilatesPolynomials (m : ℕ) (c : EuclideanSpace ℝ (Fin d) →₀ ℝ) : Prop :=
  ∀ p : MvPolynomial (Fin d) ℝ, p.totalDegree < m →
    (c.sum fun x a ↦ a * MvPolynomial.eval (⇑x) p) = 0

/-- **3.1** Conditional positive semidefiniteness of order `m` of a real kernel on `ℝᵈ`: the
form is nonnegative on coefficient vectors annihilating the polynomials of degree `< m`. -/
def IsCondPosSemidef (m : ℕ) (K : EuclideanSpace ℝ (Fin d) → EuclideanSpace ℝ (Fin d) → ℝ) :
    Prop :=
  ∀ c : EuclideanSpace ℝ (Fin d) →₀ ℝ, AnnihilatesPolynomials m c →
    0 ≤ c.sum fun x a ↦ c.sum fun y b ↦ a * K x y * b

/-- **3.1** Conditional positive definiteness of order `m`: the form is positive on every
nonzero coefficient vector annihilating the polynomials of degree `< m`. -/
def IsCondPosDef (m : ℕ) (K : EuclideanSpace ℝ (Fin d) → EuclideanSpace ℝ (Fin d) → ℝ) :
    Prop :=
  ∀ c : EuclideanSpace ℝ (Fin d) →₀ ℝ, c ≠ 0 → AnnihilatesPolynomials m c →
    0 < c.sum fun x a ↦ c.sum fun y b ↦ a * K x y * b

/-- Check (3.1): order `0` is positive semidefiniteness, for a symmetric kernel. -/
theorem isCondPosSemidef_zero_iff {K : EuclideanSpace ℝ (Fin d) → EuclideanSpace ℝ (Fin d) → ℝ}
    (hK : ∀ x y, K x y = K y x) :
    IsCondPosSemidef 0 K ↔ Matrix.PosSemidef K := by
  have hann : ∀ c : EuclideanSpace ℝ (Fin d) →₀ ℝ, AnnihilatesPolynomials 0 c :=
    fun c p hp ↦ absurd hp (Nat.not_lt_zero _)
  have hherm : Matrix.IsHermitian (K : Matrix _ _ ℝ) :=
    Matrix.IsHermitian.ext fun x y ↦ by simp [hK y x]
  constructor
  · intro h
    refine ⟨hherm, fun c ↦ ?_⟩
    simpa using h c (hann c)
  · intro h c _
    simpa using h.2 c

/-- **3.2** (Wendland, Theorem 8.19; Micchelli) For `φ` continuous on `[0, ∞)` and smooth on
`(0, ∞)`, `φ(‖x - y‖²)` is conditionally positive semidefinite of order `m` on every `ℝᵈ`
exactly when `(-1)^m φ^{(m)}` is completely monotone on `(0, ∞)`. -/
theorem micchelli (φ : ℝ → ℝ) (m : ℕ) (hc : ContinuousOn φ (Ici 0))
    (hs : ContDiffOn ℝ ((⊤ : ℕ∞) : WithTop ℕ∞) φ (Ioi 0)) :
    (∀ d, IsCondPosSemidef m (fun x y : EuclideanSpace ℝ (Fin d) ↦ φ (‖x - y‖ ^ 2))) ↔
      TauCeti.IsCompletelyMonotoneOnIoi (fun t ↦ (-1) ^ m * iteratedDeriv m φ t) :=
  sorry

/-- **3.2** (Wendland, Corollary 8.20) Strictness: if moreover `φ` agrees on `[0, ∞)` with no
polynomial of degree at most `m`, the kernel is conditionally positive definite of order `m` on
every `ℝᵈ`. -/
theorem isCondPosDef_of_completelyMonotone (φ : ℝ → ℝ) (m : ℕ) (hc : ContinuousOn φ (Ici 0))
    (hs : ContDiffOn ℝ ((⊤ : ℕ∞) : WithTop ℕ∞) φ (Ioi 0))
    (hcm : TauCeti.IsCompletelyMonotoneOnIoi (fun t ↦ (-1) ^ m * iteratedDeriv m φ t))
    (hpoly : ¬ ∃ p : ℝ[X], p.natDegree ≤ m ∧ EqOn φ p.eval (Ici 0)) (d : ℕ) :
    IsCondPosDef m (fun x y : EuclideanSpace ℝ (Fin d) ↦ φ (‖x - y‖ ^ 2)) :=
  sorry

/-- **3.3** (Wendland, Corollary 8.18 (1)) The multiquadric `(-1)^⌈β⌉ (c² + ‖x‖²)^β`, `c > 0`,
`β > 0` not an integer, is conditionally positive definite of order `⌈β⌉`. -/
theorem isCondPosDef_multiquadric {c β : ℝ} (hc : 0 < c) (hβ : 0 < β) (hβn : ∀ n : ℕ, β ≠ n) :
    IsCondPosDef ⌈β⌉₊ (fun x y : EuclideanSpace ℝ (Fin d) ↦
      (-1) ^ ⌈β⌉₊ * (c ^ 2 + ‖x - y‖ ^ 2) ^ β) :=
  sorry

/-- **3.3** (Wendland, Corollary 8.18 (2)) The power `(-1)^⌈β/2⌉ ‖x‖^β`, `β > 0` not an even
integer, is conditionally positive definite of order `⌈β/2⌉`. -/
theorem isCondPosDef_power {β : ℝ} (hβ : 0 < β) (hβn : ∀ n : ℕ, β ≠ 2 * n) :
    IsCondPosDef ⌈β / 2⌉₊ (fun x y : EuclideanSpace ℝ (Fin d) ↦
      (-1) ^ ⌈β / 2⌉₊ * ‖x - y‖ ^ β) :=
  sorry

/-- **3.3** (Wendland, Corollary 8.18 (3)) The thin-plate spline
`(-1)^{k+1} ‖x‖^{2k} log ‖x‖`, `k ≥ 1`, is conditionally positive definite of order `k + 1`;
`Real.log 0 = 0` gives the value `0` at the origin. -/
theorem isCondPosDef_thinPlate {k : ℕ} (hk : 1 ≤ k) :
    IsCondPosDef (k + 1) (fun x y : EuclideanSpace ℝ (Fin d) ↦
      (-1) ^ (k + 1) * ‖x - y‖ ^ (2 * k) * Real.log ‖x - y‖) :=
  sorry

/-- **3.4** (Wendland, Theorem 8.21) Interpolation with polynomial augmentation: for a kernel
that is conditionally positive definite of order `m` and centres on which a polynomial of degree
`< m` vanishing at every centre is zero, the augmented system has exactly one solution
`(α, p)`: `α` annihilates the polynomials of degree `< m`, `p` has degree `< m`, and
`∑ⱼ αⱼ K(xᵢ, xⱼ) + p(xᵢ) = yᵢ` for every `i`. -/
theorem existsUnique_augmentedInterpolant (m : ℕ)
    {K : EuclideanSpace ℝ (Fin d) → EuclideanSpace ℝ (Fin d) → ℝ} (hK : IsCondPosDef m K)
    {N : ℕ} {x : Fin N → EuclideanSpace ℝ (Fin d)} (hx : Function.Injective x)
    (huni : ∀ p : MvPolynomial (Fin d) ℝ, p.totalDegree < m →
      (∀ i, MvPolynomial.eval (⇑(x i)) p = 0) → p = 0)
    (y : Fin N → ℝ) :
    ∃! αp : (Fin N → ℝ) × MvPolynomial.restrictTotalDegree (Fin d) ℝ (m - 1),
      (m = 0 → (αp.2 : MvPolynomial (Fin d) ℝ) = 0) ∧
      (∀ p : MvPolynomial (Fin d) ℝ, p.totalDegree < m →
        ∑ j, αp.1 j * MvPolynomial.eval (⇑(x j)) p = 0) ∧
      ∀ i, ∑ j, αp.1 j * K (x i) (x j) +
        MvPolynomial.eval (⇑(x i)) (αp.2 : MvPolynomial (Fin d) ℝ) = y i :=
  sorry

end Conditional

/-! ## Layer 4: interpolation, cardinal functions and the power function -/

section Interpolation

variable {X : Type*}

/-- **4.1** The Gram (interpolation) matrix `(K(xᵢ, xⱼ))ᵢⱼ` at the centres `x`. -/
def gramMatrix (K : X → X → ℝ) {N : ℕ} (x : Fin N → X) : Matrix (Fin N) (Fin N) ℝ :=
  Matrix.of fun i j ↦ K (x i) (x j)

/-- **4.1** The kernel interpolant `∑ⱼ αⱼ K(·, xⱼ)` with `α = A⁻¹ y`. Its theorems assume a
positive definite Gram matrix, since `⁻¹` is `0` on singular matrices. -/
def kernelInterpolant (K : X → X → ℝ) {N : ℕ} (x : Fin N → X) (y : Fin N → ℝ) (z : X) : ℝ :=
  ∑ j, ((gramMatrix K x)⁻¹.mulVec y) j * K z (x j)

/-- **4.1** The cardinal function `u_j*`: the interpolant of the `j`-th unit vector, evaluated
through `u*(z) = A⁻¹ (K(xᵢ, z))ᵢ`. -/
def cardinalFunction (K : X → X → ℝ) {N : ℕ} (x : Fin N → X) (j : Fin N) (z : X) : ℝ :=
  ((gramMatrix K x)⁻¹.mulVec fun i ↦ K (x i) z) j

/-- **4.2** The quadratic form
`Q_z(u) = K(z, z) - 2 ∑ⱼ uⱼ K(z, xⱼ) + ∑ᵢⱼ uᵢ uⱼ K(xᵢ, xⱼ)`. -/
def powerQuadraticForm (K : X → X → ℝ) {N : ℕ} (x : Fin N → X) (z : X) (u : Fin N → ℝ) : ℝ :=
  K z z - 2 * ∑ j, u j * K z (x j) + ∑ i, ∑ j, u i * u j * K (x i) (x j)

/-- **4.2** The power function `P(z) = √(Q_z(u*(z)))`. -/
def powerFunction (K : X → X → ℝ) {N : ℕ} (x : Fin N → X) (z : X) : ℝ :=
  Real.sqrt (powerQuadraticForm K x z fun j ↦ cardinalFunction K x j z)

/-- **4.1** (Wendland, (6.1)–(6.2), Theorem 11.1 and (11.2)) For a symmetric kernel with
invertible Gram matrix the interpolant interpolates `y`, every combination of kernel sections at
the centres that interpolates `y` is the interpolant, it equals `∑ⱼ yⱼ u_j*`, and the cardinal
functions satisfy `u_j*(x_k) = δ_{jk}`. -/
theorem kernelInterpolant_spec (K : X → X → ℝ) (hK : ∀ z w, K z w = K w z) {N : ℕ}
    (x : Fin N → X) (hA : IsUnit (gramMatrix K x).det) (y : Fin N → ℝ) :
    (∀ i, kernelInterpolant K x y (x i) = y i) ∧
    (∀ β : Fin N → ℝ, (∀ i, ∑ j, β j * K (x i) (x j) = y i) →
      (fun z ↦ ∑ j, β j * K z (x j)) = kernelInterpolant K x y) ∧
    (∀ z, kernelInterpolant K x y z = ∑ j, y j * cardinalFunction K x j z) ∧
    ∀ j k, cardinalFunction K x j (x k) = if j = k then 1 else 0 :=
  sorry

/-- **4.2** (Wendland, Theorem 11.5 with `α = 0` and no polynomial part) For a positive
semidefinite kernel with positive definite Gram matrix, `u*(z)` minimizes `Q_z` over `ℝᴺ`, and
the minimum value is `P(z)²`. -/
theorem powerFunction_sq_le (K : X → X → ℝ) (hK : Matrix.PosSemidef K) {N : ℕ}
    (x : Fin N → X) (hA : (gramMatrix K x).PosDef) (z : X) :
    powerFunction K x z ^ 2 = powerQuadraticForm K x z (fun j ↦ cardinalFunction K x j z) ∧
      ∀ u : Fin N → ℝ, powerFunction K x z ^ 2 ≤ powerQuadraticForm K x z u :=
  sorry

/-- **4.3** (Wendland, Lemma 11.3 and Theorem 11.4 with `α = 0`) In the native space
`hK.KolmogorovSpace` of `K`, the interpolant of `f` is the orthogonal projection of `f` onto the
span of the kernel sections at the centres, `P(z)` is the distance of the kernel section at `z`
from that span, and `|f(z) - s_{f,X}(z)| ≤ P(z) ‖f‖`. -/
theorem abs_sub_kernelInterpolant_le (K : X → X → ℝ) (hK : Matrix.PosSemidef K)
    {N : ℕ} (x : Fin N → X) (hA : (gramMatrix K x).PosDef) (z : X) :
    let S : Submodule ℝ hK.KolmogorovSpace :=
      (Submodule.span ℝ (range fun j ↦ hK.kolmogorovFeature (x j))).topologicalClosure
    (∀ f : hK.KolmogorovSpace, ∀ w,
      (S.starProjection f : hK.KolmogorovSpace) w = kernelInterpolant K x (fun j ↦ f (x j)) w) ∧
    powerFunction K x z =
      ‖hK.kolmogorovFeature z - S.starProjection (hK.kolmogorovFeature z)‖ ∧
    ∀ f : hK.KolmogorovSpace,
      |f z - kernelInterpolant K x (fun j ↦ f (x j)) z| ≤ powerFunction K x z * ‖f‖ :=
  sorry

end Interpolation

/-! ## Layer 5: error estimates in terms of the fill distance -/

section FillDistance

variable {d : ℕ}

/-- **5.1** The fill distance `h_{X,Ω} = sup_{z ∈ Ω} dist(z, X)`, in `ℝ≥0∞`; it is `∞` for an
empty `X` and a nonempty `Ω`. -/
def fillDistance {E : Type*} [PseudoEMetricSpace E] (Ω X : Set E) : ℝ≥0∞ :=
  ⨆ z ∈ Ω, Metric.infEDist z X

/-- **5.1** The cone `C(x, ξ, θ, r) = {x + λy : ‖y‖ = 1, ⟪y, ξ⟫ ≥ cos θ, λ ∈ [0, r]}`. -/
def cone (x ξ : EuclideanSpace ℝ (Fin d)) (θ r : ℝ) : Set (EuclideanSpace ℝ (Fin d)) :=
  {z | ∃ t ∈ Icc 0 r, ∃ y : EuclideanSpace ℝ (Fin d),
    ‖y‖ = 1 ∧ Real.cos θ ≤ ⟪y, ξ⟫_ℝ ∧ z = x + t • y}

/-- **5.1** (Wendland, Definition 3.6) `Ω` satisfies an interior cone condition with angle
`θ ∈ (0, π/2)` and radius `r > 0`. -/
def InteriorConeCondition (Ω : Set (EuclideanSpace ℝ (Fin d))) (θ r : ℝ) : Prop :=
  0 < θ ∧ θ < Real.pi / 2 ∧ 0 < r ∧
    ∀ x ∈ Ω, ∃ ξ : EuclideanSpace ℝ (Fin d), ‖ξ‖ = 1 ∧ cone x ξ θ r ⊆ Ω

/-- **5.1** (Wendland, Lemma 3.10) A closed ball of radius `δ > 0` satisfies an interior cone
condition with angle `π/3` and radius `δ`. -/
theorem interiorConeCondition_closedBall (hd : 1 ≤ d) (c : EuclideanSpace ℝ (Fin d)) {δ : ℝ}
    (hδ : 0 < δ) :
    InteriorConeCondition (Metric.closedBall c δ) (Real.pi / 3) δ :=
  sorry

/-- **5.2** (Wendland, Theorems 3.14 and 11.8) Local polynomial reproduction on a bounded domain
with an interior cone condition, for derivatives of order `n` in directions `v` with
`‖vᵢ‖ ≤ 1`: there are `h₀, C₁, C₂ > 0` such that for all centres with fill distance at most
`h₀` and every `z ∈ Ω` there are weights reproducing `D^n_v p(z)` for every polynomial of degree
`≤ ℓ`, with `∑ |uⱼ| ≤ C₁ h^{-n}` and `uⱼ = 0` when `‖z - xⱼ‖ > C₂ h`. -/
theorem exists_localPolynomialReproduction {Ω : Set (EuclideanSpace ℝ (Fin d))}
    (hΩ : Bornology.IsBounded Ω) {θ r : ℝ} (hcone : InteriorConeCondition Ω θ r) (ℓ n : ℕ) :
    ∃ h₀ > 0, ∃ C₁ > 0, ∃ C₂ > 0, ∀ (N : ℕ) (x : Fin N → EuclideanSpace ℝ (Fin d)),
      range x ⊆ Ω → fillDistance Ω (range x) ≤ ENNReal.ofReal h₀ →
      ∀ z ∈ Ω, ∀ v : Fin n → EuclideanSpace ℝ (Fin d), (∀ i, ‖v i‖ ≤ 1) →
        ∃ u : Fin N → ℝ,
          (∀ p : MvPolynomial (Fin d) ℝ, p.totalDegree ≤ ℓ →
            ∑ j, u j * MvPolynomial.eval (⇑(x j)) p =
              iteratedFDeriv ℝ n (fun w : EuclideanSpace ℝ (Fin d) ↦ MvPolynomial.eval (⇑w) p)
                z v) ∧
          ∑ j, |u j| ≤ C₁ * (fillDistance Ω (range x)).toReal ^ (-(n : ℤ)) ∧
          ∀ j, C₂ * (fillDistance Ω (range x)).toReal < ‖z - x j‖ → u j = 0 :=
  sorry

/-- **5.3** (Wendland, Theorem 10.45) If the kernel is `C^{2k}` on `ℝᵈ × ℝᵈ`, every element of
its native space is a `C^k` function. -/
theorem contDiff_of_mem_nativeSpace
    (K : EuclideanSpace ℝ (Fin d) → EuclideanSpace ℝ (Fin d) → ℝ) (hK : Matrix.PosSemidef K)
    {k : ℕ}
    (hKk : ContDiff ℝ (2 * k) (fun p : EuclideanSpace ℝ (Fin d) × EuclideanSpace ℝ (Fin d) ↦
      K p.1 p.2))
    (f : hK.KolmogorovSpace) : ContDiff ℝ k (⇑f) :=
  sorry

/-- **5.4** (Wendland, Theorem 11.17) Error of interpolation with `φ_{d,k}` on a bounded domain
with an interior cone condition: for `n ≤ k` the `n`-th derivative of the error is at most
`C h^{k + 1/2 - n} ‖f‖` in the native space of `φ_{d,k}(‖·‖)` on `ℝᵈ`, uniformly in the centres
with fill distance `h ≤ h₀`. -/
theorem norm_iteratedFDeriv_sub_kernelInterpolant_wendland_le (k : ℕ)
    (hK : Matrix.PosSemidef fun x y : EuclideanSpace ℝ (Fin d) ↦ wendland d k ‖x - y‖)
    {Ω : Set (EuclideanSpace ℝ (Fin d))} (hΩ : Bornology.IsBounded Ω)
    {θ r : ℝ} (hcone : InteriorConeCondition Ω θ r) {n : ℕ} (hn : n ≤ k) :
    ∃ C > 0, ∃ h₀ > 0, ∀ (N : ℕ) (x : Fin N → EuclideanSpace ℝ (Fin d)),
      Function.Injective x → range x ⊆ Ω → fillDistance Ω (range x) ≤ ENNReal.ofReal h₀ →
      ∀ f : hK.KolmogorovSpace, ∀ z ∈ Ω,
        ‖iteratedFDeriv ℝ n (fun w ↦ f w - kernelInterpolant
            (fun x y : EuclideanSpace ℝ (Fin d) ↦ wendland d k ‖x - y‖) x
            (fun j ↦ f (x j)) w) z‖ ≤
          C * (fillDistance Ω (range x)).toReal ^ ((k : ℝ) + 1 / 2 - n) * ‖f‖ :=
  sorry

end FillDistance

/-! ## Layer 6: separation distance and stability -/

section Stability

variable {d : ℕ}

/-- **6.1** The separation distance `q_X = ½ min_{i ≠ j} ‖xᵢ - xⱼ‖`; its theorems assume
`N ≥ 2` (for `N ≤ 1` the value is the junk `0`). -/
def separationDistance {N : ℕ} (x : Fin N → EuclideanSpace ℝ (Fin d)) : ℝ :=
  sInf ((fun p : Fin N × Fin N ↦ ‖x p.1 - x p.2‖) '' {p | p.1 ≠ p.2}) / 2

/-- **6.1** The infimum of the Fourier transform of `Φ` over the closed ball of radius `R`. -/
def fourierInfOnBall (Φ : EuclideanSpace ℝ (Fin d) → ℝ) (R : ℝ) : ℝ :=
  sInf ((fun ξ ↦ (𝓕 (fun x ↦ (Φ x : ℂ)) ξ).re) '' Metric.closedBall 0 R)

/-- **6.2** (Wendland, Theorem 12.3, in Mathlib's Fourier normalization) For a continuous,
integrable, even `Φ` with positive Fourier transform and centres with separation distance `q`,
the quadratic form is at least `λ ‖α‖²` with
`λ = (2π)^{-d/2} inf_{‖ξ‖ ≤ M/π} Φ̂(ξ) / (2 Γ(d/2 + 1)) · (M / 2^{3/2})^d`
for every `M ≥ (12 / q) (π Γ(d/2 + 1)² / 9)^{1/(d+1)}`. -/
theorem quadraticForm_ge_of_separation {Φ : EuclideanSpace ℝ (Fin d) → ℝ}
    (hcont : Continuous Φ) (hint : Integrable Φ) (heven : ∀ x, Φ (-x) = Φ x)
    (hpos : ∀ ξ, 0 < (𝓕 (fun x ↦ (Φ x : ℂ)) ξ).re) {N : ℕ} (hN : 2 ≤ N)
    {x : Fin N → EuclideanSpace ℝ (Fin d)} (hx : Function.Injective x) {M : ℝ}
    (hM : 12 / separationDistance x *
      (Real.pi * Real.Gamma (d / 2 + 1) ^ 2 / 9) ^ (1 / ((d : ℝ) + 1)) ≤ M)
    (α : Fin N → ℝ) :
    (2 * Real.pi) ^ (-(d : ℝ) / 2) * fourierInfOnBall Φ (M / Real.pi) /
        (2 * Real.Gamma (d / 2 + 1)) * (M / 2 ^ ((3 : ℝ) / 2)) ^ d * ∑ i, α i ^ 2 ≤
      ∑ i, ∑ j, α i * α j * Φ (x i - x j) :=
  sorry

/-- **6.2** (Wendland, Theorem 12.3, (12.3)) The admissible threshold of 6.2 is at most
`6.38 d / q`. -/
theorem threshold_le (hd : 1 ≤ d) :
    12 * (Real.pi * Real.Gamma (d / 2 + 1) ^ 2 / 9) ^ (1 / ((d : ℝ) + 1)) ≤ 6.38 * d :=
  sorry

/-- **6.3** (Wendland, Corollary 12.4) The Gaussian `e^{-a‖x‖²}`: with
`M_d = 12 (π Γ(d/2 + 1)² / 9)^{1/(d+1)}` and `q` the separation distance,
`λ ≥ M_d^d / (2^{3d/2+1} Γ(d/2 + 1)) · (2a)^{-d/2} e^{-M_d²/(a q²)} q^{-d}`. -/
theorem quadraticForm_ge_gaussian {a : ℝ} (ha : 0 < a) {N : ℕ} (hN : 2 ≤ N)
    {x : Fin N → EuclideanSpace ℝ (Fin d)} (hx : Function.Injective x) (α : Fin N → ℝ) :
    let Md := 12 * (Real.pi * Real.Gamma (d / 2 + 1) ^ 2 / 9) ^ (1 / ((d : ℝ) + 1))
    let q := separationDistance x
    Md ^ d / (2 ^ (3 * (d : ℝ) / 2 + 1) * Real.Gamma (d / 2 + 1)) * (2 * a) ^ (-(d : ℝ) / 2) *
        Real.exp (-(Md ^ 2) / (a * q ^ 2)) * q ^ (-(d : ℤ)) * ∑ i, α i ^ 2 ≤
      ∑ i, ∑ j, α i * α j * Real.exp (-(a * ‖x i - x j‖ ^ 2)) :=
  sorry

/-- **6.3** (Wendland, Corollary 12.8, with Theorem 10.35) For `φ_{d,k}` with `k ≥ 1` or `d ≥ 3`
and every bound `Q` on the separation distance there is `C > 0` with `λ ≥ C q^{2k+1}`. -/
theorem quadraticForm_ge_wendland {k : ℕ} (hk : 1 ≤ k ∨ 3 ≤ d) {Q : ℝ}
    (hQ : 0 < Q) :
    ∃ C > 0, ∀ (N : ℕ), 2 ≤ N → ∀ x : Fin N → EuclideanSpace ℝ (Fin d),
      Function.Injective x → separationDistance x ≤ Q → ∀ α : Fin N → ℝ,
        C * separationDistance x ^ (2 * k + 1) * ∑ i, α i ^ 2 ≤
          ∑ i, ∑ j, α i * α j * wendland d k ‖x i - x j‖ :=
  sorry

end Stability

end TauCetiRoadmap.ScatteredDataKernelInterpolation
