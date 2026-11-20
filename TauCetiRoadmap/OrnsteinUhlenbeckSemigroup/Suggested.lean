import Mathlib

/-!
# Ornstein–Uhlenbeck semigroup: target signatures

**This file is not the roadmap.** The roadmap is `README.md`. This file states the roadmap's
headline theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the
few definitions they need; every definition has a real body. Every headline theorem of the README
is statable at the pins and is stated here.

The space is `E = EuclideanSpace ℝ (Fin d)` with Mathlib's standard Gaussian `stdGaussian E`. The
Ornstein–Uhlenbeck kernel at time `t` is DenoisingDiffusion's noising kernel at signal level
`exp (-2 t)`, whose definition is copied verbatim below because a roadmap's file does not import
another roadmap's module. For `t < 0` that level exceeds one, `√(1 - a)` is `0`, and the kernel is
the point mass at `exp (-t) • x`; the statements that fail there assume `0 ≤ t`. The generator is
`Δ f - ⟪x, ∇ f⟫`, with Mathlib's Laplacian and gradient.
-/

noncomputable section

open MeasureTheory ProbabilityTheory InformationTheory Polynomial InnerProductSpace Laplacian
open scoped ENNReal NNReal Gradient RealInnerProductSpace

namespace TauCetiRoadmap.OrnsteinUhlenbeckSemigroup

variable {d : ℕ}

local notation "E" => EuclideanSpace ℝ (Fin d)

/-! ## Layer 1: the kernels -/

/-- 1.1 The variance-preserving noising kernel `x ↦ N(√a • x, 1 - a)` (copied verbatim from
DenoisingDiffusion 2.1). -/
def noiseKernel (a : ℝ) : Kernel E E :=
  (Kernel.id ×ₖ Kernel.const E (stdGaussian E)).map (fun p ↦ √a • p.1 + √(1 - a) • p.2)

/-- 1.1 The Ornstein–Uhlenbeck kernel at time `t`, the noising kernel at signal level
`exp (-2 t)`: for `t ≥ 0` it is `x ↦ N(e^{-t} x, 1 - e^{-2t})`. -/
def ouKernel (t : ℝ) : Kernel E E :=
  noiseKernel (Real.exp (-2 * t))

/-- 1.1 The Ornstein–Uhlenbeck semigroup on functions, `P_t f x = ∫ f d(ouKernel t x)`. -/
def ouSemigroup (t : ℝ) (f : E → ℝ) (x : E) : ℝ :=
  ∫ y, f y ∂(ouKernel t x)

/-- 1.2 Mehler's kernel: with `ρ = e^{-t}`,
`(1 - ρ²)^{-d/2} exp (-(ρ² ‖x‖² - 2 ρ ⟪x, y⟫ + ρ² ‖y‖²) / (2 (1 - ρ²)))`. -/
def mehlerKernel (t : ℝ) (x y : E) : ℝ :=
  (1 - Real.exp (-2 * t)) ^ (-(d : ℝ) / 2) *
    Real.exp (-(Real.exp (-2 * t) * ‖x‖ ^ 2 - 2 * Real.exp (-t) * ⟪x, y⟫ +
      Real.exp (-2 * t) * ‖y‖ ^ 2) / (2 * (1 - Real.exp (-2 * t))))

/-- 1.2 The multivariate Hermite polynomial `H_α x = ∏ i, Heₐᵢ(xᵢ)`, with Mathlib's probabilists'
Hermite polynomials. -/
def hermiteProd (α : Fin d → ℕ) (x : E) : ℝ :=
  ∏ i, aeval (x i) (hermite (α i))

/-- 1.2 For `t > 0` the Ornstein–Uhlenbeck kernel has Mehler's kernel as its density with respect
to the standard Gaussian. -/
theorem ouKernel_eq_withDensity {t : ℝ} (ht : 0 < t) (x : E) :
    ouKernel t x = (stdGaussian E).withDensity (fun y ↦ ENNReal.ofReal (mehlerKernel t x y)) := by
  sorry

/-- 1.2 Mehler's formula: for `t > 0`, Mehler's kernel is the sum over multi-indices `α` of
`e^{-|α| t} H_α(x) H_α(y) / α!`. -/
theorem hasSum_mehlerKernel {t : ℝ} (ht : 0 < t) (x y : E) :
    HasSum (fun α : Fin d → ℕ ↦ Real.exp (-((∑ i, α i : ℕ) : ℝ) * t) * hermiteProd α x *
      hermiteProd α y / ∏ i, ((α i).factorial : ℝ)) (mehlerKernel t x y) := by
  sorry

/-- 1.3 For `t ≥ 0` the Ornstein–Uhlenbeck kernel is reversible with respect to the standard
Gaussian. -/
theorem isReversible_ouKernel {t : ℝ} (ht : 0 ≤ t) :
    (ouKernel (d := d) t).IsReversible (stdGaussian E) := by
  sorry

/-! ## Layer 2: the generator and its eigenfunctions -/

/-- 2.1 The Ornstein–Uhlenbeck generator `L f x = Δ f x - ⟪x, ∇ f x⟫`. -/
def ouGenerator (f : E → ℝ) (x : E) : ℝ :=
  Δ f x - ⟪x, ∇ f x⟫

/-- 2.1 Kolmogorov's backward equation: for a `C²` function whose second derivative grows at most
polynomially, `t ↦ P_t f x` has right derivative `P_t (L f) x` at every `t ≥ 0`. -/
theorem hasDerivWithinAt_ouSemigroup {f : E → ℝ} (hf : ContDiff ℝ 2 f) {C : ℝ} {k : ℕ}
    (hgrowth : ∀ x, ‖iteratedFDeriv ℝ 2 f x‖ ≤ C * (1 + ‖x‖) ^ k) {t : ℝ} (ht : 0 ≤ t) (x : E) :
    HasDerivWithinAt (fun s ↦ ouSemigroup s f x) (ouSemigroup t (ouGenerator f) x)
      (Set.Ici 0) t := by
  sorry

/-- 2.1 The generator commutes with the semigroup on the same class of functions:
`L (P_t f) = P_t (L f)` for `t ≥ 0`. -/
theorem ouGenerator_ouSemigroup {f : E → ℝ} (hf : ContDiff ℝ 2 f) {C : ℝ} {k : ℕ}
    (hgrowth : ∀ x, ‖iteratedFDeriv ℝ 2 f x‖ ≤ C * (1 + ‖x‖) ^ k) {t : ℝ} (ht : 0 ≤ t) (x : E) :
    ouGenerator (ouSemigroup t f) x = ouSemigroup t (ouGenerator f) x := by
  sorry

/-- 2.2 The Dirichlet form of the Ornstein–Uhlenbeck semigroup:
`∫ f (L g) dγ = -∫ ⟪∇ f, ∇ g⟫ dγ` for `C¹` functions `f` and `C²` functions `g` whose
derivatives of the highest order grow at most polynomially. -/
theorem integral_mul_ouGenerator {f g : E → ℝ} (hf : ContDiff ℝ 1 f) (hg : ContDiff ℝ 2 g)
    {C : ℝ} {k : ℕ} (hf' : ∀ x, ‖fderiv ℝ f x‖ ≤ C * (1 + ‖x‖) ^ k)
    (hg' : ∀ x, ‖iteratedFDeriv ℝ 2 g x‖ ≤ C * (1 + ‖x‖) ^ k) :
    ∫ x, f x * ouGenerator g x ∂(stdGaussian E) = -∫ x, ⟪∇ f x, ∇ g x⟫ ∂(stdGaussian E) := by
  sorry

/-- 2.3 The gradient commutes with the semigroup up to the factor `e^{-t}`:
`∇ (P_t f) x = e^{-t} ∫ ∇ f d(ouKernel t x)` for a `C¹` function whose derivative grows at most
polynomially. -/
theorem gradient_ouSemigroup {f : E → ℝ} (hf : ContDiff ℝ 1 f) {C : ℝ} {k : ℕ}
    (hgrowth : ∀ x, ‖fderiv ℝ f x‖ ≤ C * (1 + ‖x‖) ^ k) (t : ℝ) (x : E) :
    ∇ (ouSemigroup t f) x = Real.exp (-t) • ∫ y, ∇ f y ∂(ouKernel t x) := by
  sorry

/-- 2.4 The Hermite polynomials are eigenfunctions of the semigroup:
`P_t H_α = e^{-|α| t} H_α` for `t ≥ 0`. -/
theorem ouSemigroup_hermiteProd {t : ℝ} (ht : 0 ≤ t) (α : Fin d → ℕ) (x : E) :
    ouSemigroup t (hermiteProd α) x = Real.exp (-((∑ i, α i : ℕ) : ℝ) * t) * hermiteProd α x := by
  sorry

/-- 2.4 The Hermite polynomials are eigenfunctions of the generator: `L H_α = -|α| H_α`. -/
theorem ouGenerator_hermiteProd (α : Fin d → ℕ) (x : E) :
    ouGenerator (hermiteProd α) x = -((∑ i, α i : ℕ) : ℝ) * hermiteProd α x := by
  sorry

/-! ## Layer 3: decay and hypercontractivity -/

/-- 3.1 Variance decay: for `f ∈ L²(γ)` and `t ≥ 0`, `Var_γ (P_t f) ≤ e^{-2t} Var_γ f`. -/
theorem variance_ouSemigroup_le {t : ℝ} (ht : 0 ≤ t) {f : E → ℝ}
    (hf : MemLp f 2 (stdGaussian E)) :
    variance (ouSemigroup t f) (stdGaussian E) ≤
      Real.exp (-2 * t) * variance f (stdGaussian E) := by
  sorry

/-- 3.2 Entropy decay: for every probability law `μ` and `t ≥ 0`, the Kullback–Leibler divergence
from the standard Gaussian of the law at time `t` is at most `e^{-2t}` times that of `μ`. -/
theorem klDiv_bind_ouKernel_le {t : ℝ} (ht : 0 ≤ t) (μ : Measure E) [IsProbabilityMeasure μ] :
    klDiv (μ.bind (ouKernel t)) (stdGaussian E) ≤
      ENNReal.ofReal (Real.exp (-2 * t)) * klDiv μ (stdGaussian E) := by
  sorry

/-- 3.3 Nelson's hypercontractivity: if `t ≥ 0`, `1 ≤ p` and `q - 1 ≤ e^{2t} (p - 1)`, then
`‖P_t f‖_q ≤ ‖f‖_p` in `L(γ)` norms. -/
theorem eLpNorm_ouSemigroup_le {t : ℝ} (ht : 0 ≤ t) {p q : ℝ} (hp : 1 ≤ p)
    (hpq : q - 1 ≤ Real.exp (2 * t) * (p - 1)) {f : E → ℝ}
    (hf : AEStronglyMeasurable f (stdGaussian E)) :
    eLpNorm (ouSemigroup t f) (ENNReal.ofReal q) (stdGaussian E) ≤
      eLpNorm f (ENNReal.ofReal p) (stdGaussian E) := by
  sorry

/-- 3.4 The exponent in Nelson's theorem cannot be improved: if `d ≥ 1`, `1 ≤ p` and
`e^{2t} (p - 1) < q - 1`, no constant bounds `‖P_t f‖_q` by `‖f‖_p` on `L^p(γ)`. -/
theorem exists_eLpNorm_ouSemigroup_gt (hd : 0 < d) {t p q : ℝ} (hp : 1 ≤ p)
    (hpq : Real.exp (2 * t) * (p - 1) < q - 1) (C : ℝ≥0) :
    ∃ f : E → ℝ, MemLp f (ENNReal.ofReal p) (stdGaussian E) ∧
      C * eLpNorm f (ENNReal.ofReal p) (stdGaussian E) <
        eLpNorm (ouSemigroup t f) (ENNReal.ofReal q) (stdGaussian E) := by
  sorry

end TauCetiRoadmap.OrnsteinUhlenbeckSemigroup
