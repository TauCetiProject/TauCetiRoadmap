module

public import Mathlib
public import TauCeti.MeasureTheory.Integral.SchurTest
public import TauCeti.MeasureTheory.Integral.MinkowskiIntegral
public import TauCeti.Analysis.SpecialFunctions.Beta
public import TauCeti.Analysis.ODE.Gronwall

/-!
# Hardy, Hilbert and Carleman inequalities: target signatures

This file is not the roadmap: the roadmap is `README.md`, and this file is not an exhaustive
checklist. It states, against the pinned Mathlib and Tau Ceti and each with `sorry`, the
headlines of the README that carry a Lean name, each with every conclusion the README attaches
to it, together with the definitions their statements need. The README's other headlines are
targets of the same standing, stated there in prose with their locators or proof routes, and are
not stated here.

The conventions of the README are used throughout. Functions and sequences are nonnegative and
valued in `ℝ≥0∞`, sums are `tsum` in `ℝ≥0∞` and integrals are lower Lebesgue integrals, so no
summability or integrability hypothesis is needed for an inequality between nonnegative
quantities; strict inequalities carry the hypothesis that the right-hand side is finite and
nonzero. Sequences are indexed by `ℕ` from `0`, so the `n`-th partial sum has `n + 1` terms. A
real exponent `p > 1` comes with its conjugate `q` through `p.HolderConjugate q`. The definitions
carry no `sorry`. The implementation namespace of the README is `TauCeti`; the prototypes live in
this roadmap's namespace.
-/

@[expose] public section

noncomputable section

open MeasureTheory Filter Set Finset Topology
open scoped ENNReal NNReal Real

namespace TauCetiRoadmap.HardyHilbertAndCarlemanInequalities

/-! ## Layer 1: kernels homogeneous of degree `-1` -/

section HomogeneousKernels

/-- The constant `k = ∫₀^∞ K(x, 1) x^(-1/p) dx` of a kernel `K` on `(0, ∞)²` that is homogeneous
of degree `-1`, for the exponent `p` (Hardy–Littlewood–Pólya, Theorems 318–319). -/
def kernelConstant (K : ℝ → ℝ → ℝ≥0∞) (p : ℝ) : ℝ≥0∞ :=
  ∫⁻ x in Ioi 0, K x 1 * ENNReal.ofReal (x ^ (-p⁻¹))

/-- 1.1: the constant of a homogeneous kernel computed in the second variable,
`∫₀^∞ K(1, y) y^(-1/q) dy` for the conjugate exponent `q`. -/
theorem kernelConstant_eq_lintegral_one_left {K : ℝ → ℝ → ℝ≥0∞}
    (hKm : Measurable (Function.uncurry K))
    (hK : ∀ c x y : ℝ, 0 < c → 0 < x → 0 < y → K (c * x) (c * y) = (ENNReal.ofReal c)⁻¹ * K x y)
    {p q : ℝ} (hpq : p.HolderConjugate q) :
    kernelConstant K p = ∫⁻ y in Ioi 0, K 1 y * ENNReal.ofReal (y ^ (-q⁻¹)) := by
  sorry

/-- Sanity check of the definition: the Hardy kernel `K(x, y) = y⁻¹ 1_{x ≤ y}` has constant
`p / (p - 1)`. -/
theorem kernelConstant_hardy {p : ℝ} (hp : 1 < p) :
    kernelConstant (fun x y ↦ if x ≤ y then (ENNReal.ofReal y)⁻¹ else 0) p =
      ENNReal.ofReal (p / (p - 1)) := by
  sorry

/-- Sanity check of the definition: the kernel `1 / max(x, y)` has constant `p + q`, which equals
`p q` for conjugate exponents (Hardy–Littlewood–Pólya, Theorem 341). -/
theorem kernelConstant_max {p q : ℝ} (hpq : p.HolderConjugate q) :
    kernelConstant (fun x y ↦ (ENNReal.ofReal (max x y))⁻¹) p = ENNReal.ofReal (p + q) := by
  sorry

/-- 1.2: the bilinear inequality for a kernel homogeneous of degree `-1`. -/
theorem lintegral_lintegral_kernel_le {K : ℝ → ℝ → ℝ≥0∞}
    (hKm : Measurable (Function.uncurry K))
    (hK : ∀ c x y : ℝ, 0 < c → 0 < x → 0 < y → K (c * x) (c * y) = (ENNReal.ofReal c)⁻¹ * K x y)
    {p q : ℝ} (hpq : p.HolderConjugate q) {f g : ℝ → ℝ≥0∞}
    (hf : AEMeasurable f (volume.restrict (Ioi 0)))
    (hg : AEMeasurable g (volume.restrict (Ioi 0))) :
    ∫⁻ x in Ioi 0, ∫⁻ y in Ioi 0, K x y * f x * g y ≤
      kernelConstant K p * (∫⁻ x in Ioi 0, f x ^ p) ^ p⁻¹ * (∫⁻ y in Ioi 0, g y ^ q) ^ q⁻¹ := by
  sorry

/-- 1.2: the operator inequality for a kernel homogeneous of degree `-1`. -/
theorem lintegral_rpow_lintegral_kernel_le {K : ℝ → ℝ → ℝ≥0∞}
    (hKm : Measurable (Function.uncurry K))
    (hK : ∀ c x y : ℝ, 0 < c → 0 < x → 0 < y → K (c * x) (c * y) = (ENNReal.ofReal c)⁻¹ * K x y)
    {p : ℝ} (hp : 1 < p) {f : ℝ → ℝ≥0∞} (hf : AEMeasurable f (volume.restrict (Ioi 0))) :
    ∫⁻ y in Ioi 0, (∫⁻ x in Ioi 0, K x y * f x) ^ p ≤
      kernelConstant K p ^ p * ∫⁻ x in Ioi 0, f x ^ p := by
  sorry

/-- 1.2: for a positive kernel with finite constant the bilinear inequality is strict for
nonzero `f` and `g` of finite norm. -/
theorem lintegral_lintegral_kernel_lt {K : ℝ → ℝ → ℝ≥0∞}
    (hKm : Measurable (Function.uncurry K))
    (hK : ∀ c x y : ℝ, 0 < c → 0 < x → 0 < y → K (c * x) (c * y) = (ENNReal.ofReal c)⁻¹ * K x y)
    (hKpos : ∀ x y : ℝ, 0 < x → 0 < y → 0 < K x y) {p q : ℝ} (hpq : p.HolderConjugate q)
    (hk : kernelConstant K p ≠ ⊤) {f g : ℝ → ℝ≥0∞}
    (hf : AEMeasurable f (volume.restrict (Ioi 0))) (hg : AEMeasurable g (volume.restrict (Ioi 0)))
    (hf0 : ∫⁻ x in Ioi 0, f x ^ p ≠ 0) (hf1 : ∫⁻ x in Ioi 0, f x ^ p ≠ ⊤)
    (hg0 : ∫⁻ y in Ioi 0, g y ^ q ≠ 0) (hg1 : ∫⁻ y in Ioi 0, g y ^ q ≠ ⊤) :
    ∫⁻ x in Ioi 0, ∫⁻ y in Ioi 0, K x y * f x * g y <
      kernelConstant K p * (∫⁻ x in Ioi 0, f x ^ p) ^ p⁻¹ * (∫⁻ y in Ioi 0, g y ^ q) ^ q⁻¹ := by
  sorry

/-- 1.3: the series form of the bilinear inequality, for a homogeneous kernel whose weighted
sections `K(x, 1) x^(-1/p)` and `K(1, y) y^(-1/q)` decrease on `(0, ∞)`. -/
theorem tsum_tsum_kernel_le {K : ℝ → ℝ → ℝ≥0∞}
    (hK : ∀ c x y : ℝ, 0 < c → 0 < x → 0 < y → K (c * x) (c * y) = (ENNReal.ofReal c)⁻¹ * K x y)
    {p q : ℝ} (hpq : p.HolderConjugate q)
    (hdec₁ : AntitoneOn (fun x ↦ K x 1 * ENNReal.ofReal (x ^ (-p⁻¹))) (Ioi 0))
    (hdec₂ : AntitoneOn (fun y ↦ K 1 y * ENNReal.ofReal (y ^ (-q⁻¹))) (Ioi 0))
    (a b : ℕ → ℝ≥0∞) :
    ∑' m : ℕ, ∑' n : ℕ, K ((m : ℝ) + 1) ((n : ℝ) + 1) * a m * b n ≤
      kernelConstant K p * (∑' m, a m ^ p) ^ p⁻¹ * (∑' n, b n ^ q) ^ q⁻¹ := by
  sorry

end HomogeneousKernels

/-! ## Layer 2: Hardy's inequality -/

section Hardy

/-- 2.1: Hardy's inequality for finite sections (Elliott's form). -/
theorem sum_range_hardy_le {p : ℝ} (hp : 1 < p) {a : ℕ → ℝ} (ha : ∀ n, 0 ≤ a n) (N : ℕ) :
    ∑ n ∈ range N, ((∑ k ∈ range (n + 1), a k) / ((n : ℝ) + 1)) ^ p ≤
      (p / (p - 1)) ^ p * ∑ n ∈ range N, a n ^ p := by
  sorry

/-- 2.1: Hardy's inequality for series is strict for a nonzero sequence with finite `p`-th power
sum. -/
theorem tsum_hardy_lt {p : ℝ} (hp : 1 < p) {a : ℕ → ℝ≥0∞} (ha : ∑' n, a n ^ p ≠ ⊤) (ha0 : a ≠ 0) :
    ∑' n : ℕ, ((∑ k ∈ range (n + 1), a k) / ((n : ℝ≥0∞) + 1)) ^ p <
      ENNReal.ofReal ((p / (p - 1)) ^ p) * ∑' n, a n ^ p := by
  sorry

/-- 2.1: the constant `(p / (p - 1)) ^ p` in Hardy's inequality for series is best possible. -/
theorem tsum_hardy_sharp {p : ℝ} (hp : 1 < p) {c : ℝ≥0∞}
    (hc : c < ENNReal.ofReal ((p / (p - 1)) ^ p)) :
    ∃ a : ℕ → ℝ≥0∞, ∑' n, a n ^ p ≠ ⊤ ∧
      c * ∑' n, a n ^ p < ∑' n : ℕ, ((∑ k ∈ range (n + 1), a k) / ((n : ℝ≥0∞) + 1)) ^ p := by
  sorry

/-- 2.1: Hardy's inequality for series with positive weights `w` (Copson's weighted form). -/
theorem tsum_hardy_weighted_le {p : ℝ} (hp : 1 < p) {w : ℕ → ℝ≥0∞} (hw : ∀ n, 0 < w n)
    (hw' : ∀ n, w n ≠ ⊤) (a : ℕ → ℝ≥0∞) :
    ∑' n, w n * ((∑ k ∈ range (n + 1), w k * a k) / ∑ k ∈ range (n + 1), w k) ^ p ≤
      ENNReal.ofReal ((p / (p - 1)) ^ p) * ∑' n, w n * a n ^ p := by
  sorry

/-- 2.1: Copson's dual inequality for tails of series, strict for a nonzero sequence with
finite right-hand side. -/
theorem tsum_copson_lt {p : ℝ} (hp : 1 < p) {a : ℕ → ℝ≥0∞}
    (ha : ∑' n : ℕ, (((n : ℝ≥0∞) + 1) * a n) ^ p ≠ ⊤) (ha0 : a ≠ 0) :
    ∑' n : ℕ, (∑' k, a (n + k)) ^ p <
      ENNReal.ofReal (p ^ p) * ∑' n : ℕ, (((n : ℝ≥0∞) + 1) * a n) ^ p := by
  sorry

/-- 2.2: Hardy's integral inequality with a power weight, `ε < 1 - 1/p`, for every `f`. -/
theorem hardy_rpow_weight_le {p ε : ℝ} (hp : 1 < p) (hε : ε < 1 - p⁻¹) {f : ℝ → ℝ≥0∞}
    (hf : AEMeasurable f (volume.restrict (Ioi 0))) :
    ∫⁻ x in Ioi 0, (∫⁻ t in Ioc 0 x, f t) ^ p * ENNReal.ofReal (x ^ (p * (ε - 1))) ≤
      ENNReal.ofReal ((1 - p⁻¹ - ε) ^ (-p)) *
        ∫⁻ x in Ioi 0, f x ^ p * ENNReal.ofReal (x ^ (ε * p)) := by
  sorry

/-- 2.2: the tail form of the weighted Hardy inequality, `ε > 1 - 1/p`, for every `f`. -/
theorem hardy_tail_rpow_weight_le {p ε : ℝ} (hp : 1 < p) (hε : 1 - p⁻¹ < ε) {f : ℝ → ℝ≥0∞}
    (hf : AEMeasurable f (volume.restrict (Ioi 0))) :
    ∫⁻ x in Ioi 0, (∫⁻ t in Ici x, f t) ^ p * ENNReal.ofReal (x ^ (p * (ε - 1))) ≤
      ENNReal.ofReal ((ε - 1 + p⁻¹) ^ (-p)) *
        ∫⁻ x in Ioi 0, f x ^ p * ENNReal.ofReal (x ^ (ε * p)) := by
  sorry

/-- 2.2: Hardy's integral inequality with a power weight, `ε < 1 - 1/p`, strict for nonzero `f`
with finite right-hand side; `ε = 0` is the classical inequality. -/
theorem hardy_rpow_weight_lt {p ε : ℝ} (hp : 1 < p) (hε : ε < 1 - p⁻¹) {f : ℝ → ℝ≥0∞}
    (hf : AEMeasurable f (volume.restrict (Ioi 0)))
    (hf0 : ∫⁻ x in Ioi 0, f x ^ p * ENNReal.ofReal (x ^ (ε * p)) ≠ 0)
    (hf1 : ∫⁻ x in Ioi 0, f x ^ p * ENNReal.ofReal (x ^ (ε * p)) ≠ ⊤) :
    ∫⁻ x in Ioi 0, (∫⁻ t in Ioc 0 x, f t) ^ p * ENNReal.ofReal (x ^ (p * (ε - 1))) <
      ENNReal.ofReal ((1 - p⁻¹ - ε) ^ (-p)) *
        ∫⁻ x in Ioi 0, f x ^ p * ENNReal.ofReal (x ^ (ε * p)) := by
  sorry

/-- 2.2: the constant `(1 - 1/p - ε) ^ (-p)` of the weighted Hardy inequality is best possible. -/
theorem hardy_rpow_weight_sharp {p ε : ℝ} (hp : 1 < p) (hε : ε < 1 - p⁻¹) {c : ℝ≥0∞}
    (hc : c < ENNReal.ofReal ((1 - p⁻¹ - ε) ^ (-p))) :
    ∃ f : ℝ → ℝ≥0∞, Measurable f ∧
      ∫⁻ x in Ioi 0, f x ^ p * ENNReal.ofReal (x ^ (ε * p)) ≠ ⊤ ∧
      c * ∫⁻ x in Ioi 0, f x ^ p * ENNReal.ofReal (x ^ (ε * p)) <
        ∫⁻ x in Ioi 0, (∫⁻ t in Ioc 0 x, f t) ^ p * ENNReal.ofReal (x ^ (p * (ε - 1))) := by
  sorry

/-- 2.2: the dual (tail) form of the weighted Hardy inequality, `ε > 1 - 1/p`, strict for nonzero
`f` with finite right-hand side; `ε = 1` is `∫ (∫ₓ^∞ f)^p ≤ p^p ∫ (x f)^p`. -/
theorem hardy_tail_rpow_weight_lt {p ε : ℝ} (hp : 1 < p) (hε : 1 - p⁻¹ < ε) {f : ℝ → ℝ≥0∞}
    (hf : AEMeasurable f (volume.restrict (Ioi 0)))
    (hf0 : ∫⁻ x in Ioi 0, f x ^ p * ENNReal.ofReal (x ^ (ε * p)) ≠ 0)
    (hf1 : ∫⁻ x in Ioi 0, f x ^ p * ENNReal.ofReal (x ^ (ε * p)) ≠ ⊤) :
    ∫⁻ x in Ioi 0, (∫⁻ t in Ici x, f t) ^ p * ENNReal.ofReal (x ^ (p * (ε - 1))) <
      ENNReal.ofReal ((ε - 1 + p⁻¹) ^ (-p)) *
        ∫⁻ x in Ioi 0, f x ^ p * ENNReal.ofReal (x ^ (ε * p)) := by
  sorry

/-- 2.2: Hardy's inequality for the Riemann–Liouville integral of order `r > 0`. -/
theorem hardy_riemannLiouville_lt {p r : ℝ} (hp : 1 < p) (hr : 0 < r) {f : ℝ → ℝ≥0∞}
    (hf : AEMeasurable f (volume.restrict (Ioi 0)))
    (hf0 : ∫⁻ x in Ioi 0, f x ^ p ≠ 0) (hf1 : ∫⁻ x in Ioi 0, f x ^ p ≠ ⊤) :
    ∫⁻ x in Ioi 0, ((ENNReal.ofReal (x ^ r))⁻¹ * (ENNReal.ofReal (Real.Gamma r))⁻¹ *
        ∫⁻ t in Ioo 0 x, ENNReal.ofReal ((x - t) ^ (r - 1)) * f t) ^ p <
      ENNReal.ofReal ((Real.Gamma (1 - p⁻¹) / Real.Gamma (r + 1 - p⁻¹)) ^ p) *
        ∫⁻ x in Ioi 0, f x ^ p := by
  sorry

/-- 2.2: the reversed Hardy inequality for `0 < p < 1`, for tails, strict for nonzero `f` with
finite `p`-th power integral. -/
theorem hardy_reverse_lt {p : ℝ} (hp0 : 0 < p) (hp1 : p < 1) {f : ℝ → ℝ≥0∞}
    (hf : AEMeasurable f (volume.restrict (Ioi 0)))
    (hf0 : ∫⁻ x in Ioi 0, f x ^ p ≠ 0) (hf1 : ∫⁻ x in Ioi 0, f x ^ p ≠ ⊤) :
    ENNReal.ofReal ((p / (1 - p)) ^ p) * ∫⁻ x in Ioi 0, f x ^ p <
      ∫⁻ x in Ioi 0, ((∫⁻ t in Ioi x, f t) / ENNReal.ofReal x) ^ p := by
  sorry

/-- 2.3: Hardy's inequality for a locally absolutely continuous function vanishing at `0⁺`. -/
theorem hardy_deriv_le {p : ℝ} (hp : 1 < p) {F : ℝ → ℝ}
    (hF : ∀ a b : ℝ, 0 < a → a ≤ b → AbsolutelyContinuousOnInterval F a b)
    (hF0 : Tendsto F (𝓝[>] 0) (𝓝 0)) :
    ∫⁻ x in Ioi 0, (‖F x‖ₑ / ENNReal.ofReal x) ^ p ≤
      ENNReal.ofReal ((p / (p - 1)) ^ p) * ∫⁻ x in Ioi 0, ‖deriv F x‖ₑ ^ p := by
  sorry

end Hardy

/-! ## Layer 3: Hilbert's inequality -/

section Hilbert

/-- 3.1: the constant of the Hilbert kernel `1 / (x + y)` is `π / sin (π / p)`. -/
theorem kernelConstant_hilbert {p : ℝ} (hp : 1 < p) :
    kernelConstant (fun x y ↦ (ENNReal.ofReal (x + y))⁻¹) p =
      ENNReal.ofReal (π / Real.sin (π / p)) := by
  sorry

/-- 3.1: Hilbert's inequality for integrals. -/
theorem hilbert_lintegral_le {p q : ℝ} (hpq : p.HolderConjugate q) {f g : ℝ → ℝ≥0∞}
    (hf : AEMeasurable f (volume.restrict (Ioi 0)))
    (hg : AEMeasurable g (volume.restrict (Ioi 0))) :
    ∫⁻ x in Ioi 0, ∫⁻ y in Ioi 0, f x * g y / ENNReal.ofReal (x + y) ≤
      ENNReal.ofReal (π / Real.sin (π / p)) * (∫⁻ x in Ioi 0, f x ^ p) ^ p⁻¹ *
        (∫⁻ y in Ioi 0, g y ^ q) ^ q⁻¹ := by
  sorry

/-- 3.1: Hilbert's inequality for integrals is strict for nonzero `f`, `g` of finite norm. -/
theorem hilbert_lintegral_lt {p q : ℝ} (hpq : p.HolderConjugate q) {f g : ℝ → ℝ≥0∞}
    (hf : AEMeasurable f (volume.restrict (Ioi 0))) (hg : AEMeasurable g (volume.restrict (Ioi 0)))
    (hf0 : ∫⁻ x in Ioi 0, f x ^ p ≠ 0) (hf1 : ∫⁻ x in Ioi 0, f x ^ p ≠ ⊤)
    (hg0 : ∫⁻ y in Ioi 0, g y ^ q ≠ 0) (hg1 : ∫⁻ y in Ioi 0, g y ^ q ≠ ⊤) :
    ∫⁻ x in Ioi 0, ∫⁻ y in Ioi 0, f x * g y / ENNReal.ofReal (x + y) <
      ENNReal.ofReal (π / Real.sin (π / p)) * (∫⁻ x in Ioi 0, f x ^ p) ^ p⁻¹ *
        (∫⁻ y in Ioi 0, g y ^ q) ^ q⁻¹ := by
  sorry

/-- 3.1: the constant `π / sin (π / p)` of Hilbert's inequality for integrals is best possible. -/
theorem hilbert_lintegral_sharp {p q : ℝ} (hpq : p.HolderConjugate q) {c : ℝ≥0∞}
    (hc : c < ENNReal.ofReal (π / Real.sin (π / p))) :
    ∃ f g : ℝ → ℝ≥0∞, Measurable f ∧ Measurable g ∧
      ∫⁻ x in Ioi 0, f x ^ p ≠ ⊤ ∧ ∫⁻ y in Ioi 0, g y ^ q ≠ ⊤ ∧
      c * (∫⁻ x in Ioi 0, f x ^ p) ^ p⁻¹ * (∫⁻ y in Ioi 0, g y ^ q) ^ q⁻¹ <
        ∫⁻ x in Ioi 0, ∫⁻ y in Ioi 0, f x * g y / ENNReal.ofReal (x + y) := by
  sorry

/-- 3.2: Hilbert's inequality for double series, in the sharper form with `m + n + 1`. -/
theorem hilbert_tsum_le {p q : ℝ} (hpq : p.HolderConjugate q) (a b : ℕ → ℝ≥0∞) :
    ∑' m : ℕ, ∑' n : ℕ, a m * b n / ((m : ℝ≥0∞) + n + 1) ≤
      ENNReal.ofReal (π / Real.sin (π / p)) * (∑' m, a m ^ p) ^ p⁻¹ * (∑' n, b n ^ q) ^ q⁻¹ := by
  sorry

/-- 3.2: Hilbert's inequality for double series is strict for nonzero sequences of finite norm. -/
theorem hilbert_tsum_lt {p q : ℝ} (hpq : p.HolderConjugate q) {a b : ℕ → ℝ≥0∞}
    (ha : ∑' m, a m ^ p ≠ ⊤) (hb : ∑' n, b n ^ q ≠ ⊤) (ha0 : a ≠ 0) (hb0 : b ≠ 0) :
    ∑' m : ℕ, ∑' n : ℕ, a m * b n / ((m : ℝ≥0∞) + n + 1) <
      ENNReal.ofReal (π / Real.sin (π / p)) * (∑' m, a m ^ p) ^ p⁻¹ * (∑' n, b n ^ q) ^ q⁻¹ := by
  sorry

/-- 3.2: the constant `π / sin (π / p)` of Hilbert's inequality for series is best possible. -/
theorem hilbert_tsum_sharp {p q : ℝ} (hpq : p.HolderConjugate q) {c : ℝ≥0∞}
    (hc : c < ENNReal.ofReal (π / Real.sin (π / p))) :
    ∃ a b : ℕ → ℝ≥0∞, ∑' m, a m ^ p ≠ ⊤ ∧ ∑' n, b n ^ q ≠ ⊤ ∧
      c * (∑' m, a m ^ p) ^ p⁻¹ * (∑' n, b n ^ q) ^ q⁻¹ <
        ∑' m : ℕ, ∑' n : ℕ, a m * b n / ((m : ℝ≥0∞) + n + 1) := by
  sorry

/-- 3.2: the operator form of Hilbert's inequality for series. -/
theorem hilbert_tsum_rpow_le {p : ℝ} (hp : 1 < p) (a : ℕ → ℝ≥0∞) :
    ∑' n : ℕ, (∑' m : ℕ, a m / ((m : ℝ≥0∞) + n + 1)) ^ p ≤
      ENNReal.ofReal ((π / Real.sin (π / p)) ^ p) * ∑' m, a m ^ p := by
  sorry

/-- 3.3: Hilbert's inequality with two independent exponents (Hardy–Littlewood–Pólya,
Theorem 339), with the exponent `λ = 2 - 1/p - 1/q ∈ (0, 1]` on `m + n` (indices from `1`). -/
theorem hilbert_two_exponents {p q : ℝ} (hp : 1 < p) (hq : 1 < q) (hpq : 1 ≤ p⁻¹ + q⁻¹) :
    ∃ K : ℝ≥0, ∀ a b : ℕ → ℝ≥0∞,
      ∑' m : ℕ, ∑' n : ℕ, a m * b n / ((m : ℝ≥0∞) + n + 2) ^ (2 - p⁻¹ - q⁻¹) ≤
        K * (∑' m, a m ^ p) ^ p⁻¹ * (∑' n, b n ^ q) ^ q⁻¹ := by
  sorry

end Hilbert

/-! ## Layer 4: Carleman's inequality -/

section Carleman

/-- 4.1: Pólya's bound: the series of geometric means is at most `∑ (1 + 1/(n+1))^(n+1) aₙ`. -/
theorem carleman_le_tsum_one_add_inv_pow (a : ℕ → ℝ≥0∞) :
    ∑' n : ℕ, (∏ k ∈ range (n + 1), a k) ^ ((n : ℝ) + 1)⁻¹ ≤
      ∑' n : ℕ, ENNReal.ofReal ((1 + ((n : ℝ) + 1)⁻¹) ^ (n + 1)) * a n := by
  sorry

/-- 4.1: Carleman's inequality, strict for a nonzero sequence with finite sum. -/
theorem carleman_lt {a : ℕ → ℝ≥0∞} (ha : ∑' n, a n ≠ ⊤) (ha0 : a ≠ 0) :
    ∑' n : ℕ, (∏ k ∈ range (n + 1), a k) ^ ((n : ℝ) + 1)⁻¹ <
      ENNReal.ofReal (Real.exp 1) * ∑' n, a n := by
  sorry

/-- 4.1: the constant `e` in Carleman's inequality is best possible. -/
theorem carleman_sharp {c : ℝ≥0∞} (hc : c < ENNReal.ofReal (Real.exp 1)) :
    ∃ a : ℕ → ℝ≥0∞, ∑' n, a n ≠ ⊤ ∧
      c * ∑' n, a n < ∑' n : ℕ, (∏ k ∈ range (n + 1), a k) ^ ((n : ℝ) + 1)⁻¹ := by
  sorry

/-- 4.2: Knopp's inequality, the integral form of Carleman's inequality. The integrability of
`log f` on each `(0, x]` makes the geometric mean `exp ((1/x) ∫₀ˣ log f)` a genuine value. -/
theorem knopp_lt {f : ℝ → ℝ} (hf : ∀ x, 0 < x → 0 < f x) (hfi : IntegrableOn f (Ioi 0))
    (hlog : ∀ x, 0 < x → IntegrableOn (fun t ↦ Real.log (f t)) (Ioc 0 x)) :
    ∫⁻ x in Ioi 0, ENNReal.ofReal (Real.exp (x⁻¹ * ∫ t in Ioc 0 x, Real.log (f t))) <
      ENNReal.ofReal (Real.exp 1) * ∫⁻ x in Ioi 0, ENNReal.ofReal (f x) := by
  sorry

/-- 4.2: the constant `e` in Knopp's inequality is best possible. -/
theorem knopp_sharp {c : ℝ≥0∞} (hc : c < ENNReal.ofReal (Real.exp 1)) :
    ∃ f : ℝ → ℝ, (∀ x, 0 < x → 0 < f x) ∧ IntegrableOn f (Ioi 0) ∧
      (∀ x, 0 < x → IntegrableOn (fun t ↦ Real.log (f t)) (Ioc 0 x)) ∧
      c * ∫⁻ x in Ioi 0, ENNReal.ofReal (f x) <
        ∫⁻ x in Ioi 0, ENNReal.ofReal (Real.exp (x⁻¹ * ∫ t in Ioc 0 x, Real.log (f t))) := by
  sorry

end Carleman

/-! ## Layer 5: weighted Hardy operators -/

section WeightedHardy

/-- The weighted Hardy operator `(T f)(x) = v(x) ∫_{t ≤ x} u(t) f(t) dt` on the line, for
nonnegative weights `u`, `v`. -/
def weightedHardyOp (u v f : ℝ → ℝ≥0∞) (x : ℝ) : ℝ≥0∞ :=
  v x * ∫⁻ t in Iic x, u t * f t

/-- The Muckenhoupt constant `A = sup_X ‖u 1_{(-∞, X]}‖_{p'} ‖v 1_{(X, ∞)}‖_q` of a pair of
weights, for the exponent `p'` conjugate to the source exponent and the target exponent `q`. -/
def muckenhouptConst (u v : ℝ → ℝ≥0∞) (p' q : ℝ≥0∞) : ℝ≥0∞ :=
  ⨆ X : ℝ, eLpNorm ((Iic X).indicator u) p' * eLpNorm ((Ioi X).indicator v) q

/-- Sanity check of the definition: for the power weights `u = t^(-ε)`, `v = t^(ε - 1)` on
`(0, ∞)` and `ε < 1 - 1/p`, the Muckenhoupt constant is `(1 - ε q)^(-1/q) ((1 - ε) p - 1)^(-1/p)`.
-/
theorem muckenhouptConst_rpow {p q ε : ℝ} (hpq : p.HolderConjugate q) (hε : ε < 1 - p⁻¹) :
    muckenhouptConst ((Set.Ioi 0).indicator fun t ↦ ENNReal.ofReal (t ^ (-ε)))
        ((Set.Ioi 0).indicator fun t ↦ ENNReal.ofReal (t ^ (ε - 1))) (ENNReal.ofReal q)
        (ENNReal.ofReal p) =
      ENNReal.ofReal ((1 - ε * q) ^ (-q⁻¹) * ((1 - ε) * p - 1) ^ (-p⁻¹)) := by
  sorry

/-- 5.1: the Muckenhoupt condition is sufficient, with `‖T‖ ≤ 4 A`, for `1 ≤ p ≤ q ≤ ∞`. -/
theorem eLpNorm_weightedHardyOp_le {u v f : ℝ → ℝ≥0∞} (hu : AEMeasurable u) (hv : AEMeasurable v)
    (hf : AEMeasurable f) {p p' q : ℝ≥0∞} [p.HolderConjugate p'] (hpq : p ≤ q) :
    eLpNorm (weightedHardyOp u v f) q ≤ 4 * muckenhouptConst u v p' q * eLpNorm f p := by
  sorry

/-- 5.1: the Muckenhoupt condition is necessary: every bound of the operator dominates `A`. -/
theorem muckenhouptConst_le {u v : ℝ → ℝ≥0∞} (hu : AEMeasurable u) (hv : AEMeasurable v)
    {p p' q : ℝ≥0∞} [p.HolderConjugate p'] {C : ℝ≥0∞}
    (hC : ∀ f : ℝ → ℝ≥0∞, AEMeasurable f →
      eLpNorm (weightedHardyOp u v f) q ≤ C * eLpNorm f p) :
    muckenhouptConst u v p' q ≤ C := by
  sorry

/-- 5.2: for `1 < p < ∞` and `q = p`, the sharp bound `‖T‖ ≤ p^(1/p) p'^(1/p') A`. -/
theorem eLpNorm_weightedHardyOp_le_sharp {u v f : ℝ → ℝ≥0∞} (hu : AEMeasurable u)
    (hv : AEMeasurable v) (hf : AEMeasurable f) {p p' : ℝ≥0∞} [p.HolderConjugate p']
    (hp : 1 < p) (hp' : p ≠ ⊤) :
    eLpNorm (weightedHardyOp u v f) p ≤
      ENNReal.ofReal (p.toReal ^ p.toReal⁻¹ * p'.toReal ^ p'.toReal⁻¹) *
        muckenhouptConst u v p' p * eLpNorm f p := by
  sorry

/-- 5.2: for the source exponent `1` the norm of the operator is `A` itself. -/
theorem eLpNorm_weightedHardyOp_le_of_one {u v f : ℝ → ℝ≥0∞} (hu : AEMeasurable u)
    (hv : AEMeasurable v) (hf : AEMeasurable f) {q : ℝ≥0∞} (hq : 1 ≤ q) :
    eLpNorm (weightedHardyOp u v f) q ≤ muckenhouptConst u v ⊤ q * eLpNorm f 1 := by
  sorry

end WeightedHardy

/-! ## Layer 6: Opial's inequality and the Bihari–LaSalle inequality -/

section DifferentialInequalities

/-- 6.1: Opial's inequality on `[0, a]` for a function vanishing at `0`. -/
theorem opial_half {g : ℝ → ℝ} {a : ℝ} (ha : 0 < a) (hg : AbsolutelyContinuousOnInterval g 0 a)
    (hg0 : g 0 = 0) :
    ∫⁻ x in Ioc 0 a, ‖g x * deriv g x‖ₑ ≤
      ENNReal.ofReal (a / 2) * ∫⁻ x in Ioc 0 a, ‖deriv g x‖ₑ ^ 2 := by
  sorry

/-- 6.1: equality in the one-sided Opial inequality holds exactly for the linear functions. -/
theorem opial_half_eq_iff {g : ℝ → ℝ} {a : ℝ} (ha : 0 < a)
    (hg : AbsolutelyContinuousOnInterval g 0 a) (hg0 : g 0 = 0)
    (hfin : ∫⁻ x in Ioc 0 a, ‖deriv g x‖ₑ ^ 2 ≠ ⊤) :
    ∫⁻ x in Ioc 0 a, ‖g x * deriv g x‖ₑ =
      ENNReal.ofReal (a / 2) * ∫⁻ x in Ioc 0 a, ‖deriv g x‖ₑ ^ 2 ↔
      ∃ c : ℝ, ∀ x ∈ Icc 0 a, g x = c * x := by
  sorry

/-- 6.1: Opial's inequality on `[0, h]` for a function vanishing at both endpoints. -/
theorem opial {f : ℝ → ℝ} {h : ℝ} (hh : 0 < h) (hf : AbsolutelyContinuousOnInterval f 0 h)
    (hf0 : f 0 = 0) (hfh : f h = 0) :
    ∫⁻ x in Ioc 0 h, ‖f x * deriv f x‖ₑ ≤
      ENNReal.ofReal (h / 4) * ∫⁻ x in Ioc 0 h, ‖deriv f x‖ₑ ^ 2 := by
  sorry

/-- 6.1: equality in Opial's inequality holds exactly for the multiples of the tent function. -/
theorem opial_eq_iff {f : ℝ → ℝ} {h : ℝ} (hh : 0 < h) (hf : AbsolutelyContinuousOnInterval f 0 h)
    (hf0 : f 0 = 0) (hfh : f h = 0) (hfin : ∫⁻ x in Ioc 0 h, ‖deriv f x‖ₑ ^ 2 ≠ ⊤) :
    ∫⁻ x in Ioc 0 h, ‖f x * deriv f x‖ₑ =
      ENNReal.ofReal (h / 4) * ∫⁻ x in Ioc 0 h, ‖deriv f x‖ₑ ^ 2 ↔
      ∃ c : ℝ, ∀ x ∈ Icc 0 h, f x = c * min x (h - x) := by
  sorry

/-- 6.2: the Bihari–LaSalle inequality, in the form `G(max (u t) k) - G(k) ≤ ∫₀ᵗ f` with
`G' = 1 / w`, which needs no inverse of `G`. -/
theorem bihari {u f w : ℝ → ℝ} {k T : ℝ} (hk : 0 < k) (hu : ContinuousOn u (Icc 0 T))
    (hu0 : ∀ t ∈ Icc 0 T, 0 ≤ u t) (hf : ContinuousOn f (Icc 0 T)) (hf0 : ∀ t ∈ Icc 0 T, 0 ≤ f t)
    (hw : ContinuousOn w (Ici 0)) (hwm : MonotoneOn w (Ici 0)) (hwpos : ∀ s, 0 < s → 0 < w s)
    (h : ∀ t ∈ Icc 0 T, u t ≤ k + ∫ s in 0..t, f s * w (u s)) :
    ∀ t ∈ Icc 0 T, ∫ s in k..max (u t) k, (w s)⁻¹ ≤ ∫ s in 0..t, f s := by
  sorry

/-- 6.2: Osgood's uniqueness criterion: if `1 / w` is not integrable at `0⁺`, a nonnegative `u`
with `u(t) ≤ ∫₀ᵗ f w(u)` vanishes. -/
theorem eq_zero_of_le_integral_of_not_integrableOn_inv {u f w : ℝ → ℝ} {T : ℝ}
    (hu : ContinuousOn u (Icc 0 T)) (hu0 : ∀ t ∈ Icc 0 T, 0 ≤ u t) (hf : ContinuousOn f (Icc 0 T))
    (hf0 : ∀ t ∈ Icc 0 T, 0 ≤ f t) (hw : ContinuousOn w (Ici 0)) (hwm : MonotoneOn w (Ici 0))
    (hwpos : ∀ s, 0 < s → 0 < w s) (hosgood : ¬ IntegrableOn (fun s ↦ (w s)⁻¹) (Ioc 0 1))
    (h : ∀ t ∈ Icc 0 T, u t ≤ ∫ s in 0..t, f s * w (u s)) :
    ∀ t ∈ Icc 0 T, u t = 0 := by
  sorry

end DifferentialInequalities

/-! ## Library declarations consumed

The Mathlib and Tau Ceti declarations named in the README. -/

#check @TauCeti.lintegral_rpow_lintegral_mul_le
#check @TauCeti.lintegral_rpow_lintegral_mul_le_of_inv_add_inv_eq
#check @TauCeti.integral_rpow_mul_one_add_rpow
#check @TauCeti.lintegral_Lp_lintegral_le
#check @ProbabilityTheory.beta
#check @Real.Gamma_mul_Gamma_one_sub
#check @Real.Gamma
#check @ENNReal.lintegral_mul_le_Lp_mul_Lq
#check @ENNReal.inner_le_Lp_mul_Lq
#check @NNReal.inner_le_Lp_mul_Lq_tsum
#check @Real.geom_mean_le_arith_mean_weighted
#check @Real.inner_le_Lp_mul_Lq
#check @ConvexOn.map_integral_le
#check @Real.one_add_inv_pow_le_exp
#check @Real.add_one_lt_exp
#check @MeasureTheory.lintegral_lintegral_swap
#check @Real.map_volume_mul_left
#check @MeasureTheory.eLpNorm
#check @ENNReal.HolderConjugate
#check @Real.HolderConjugate
#check @AbsolutelyContinuousOnInterval
#check @AbsolutelyContinuousOnInterval.integral_deriv_eq_sub
#check @le_gronwallBound_of_liminf_deriv_right_le
#check @tsum_comm
#check @TauCeti.le_mul_exp_of_le_add_mul_integral

end TauCetiRoadmap.HardyHilbertAndCarlemanInequalities
