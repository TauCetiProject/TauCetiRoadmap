module

public import Mathlib
public import TauCeti.MeasureTheory.Measure.LevyConvergence

/-!
# Infinitely divisible laws and triangular arrays: target signatures

This file is not the roadmap: the roadmap is `README.md`, and this file is not an exhaustive
checklist. It states, against the pinned Mathlib and Tau Ceti and each with `sorry`, the
headlines of the README that carry a Lean name, each with every conclusion the README attaches
to it, together with the definitions their statements need. The README's other headlines are
targets of the same standing, stated there in prose with their locators or proof routes, and are
not stated here.

The conventions of the README are used throughout. Laws are probability measures on `ℝ`
(on `ℕ` in §2.6); the characteristic function is Mathlib's `charFun μ t = ∫ x, exp (i t x) ∂μ`.
The `n`-fold independent sum of a law is the push-forward of the product law `Measure.pi` under
the sum map. A Lévy–Khintchine triplet uses the truncation `1{|x| ≤ 1}`. Weak convergence of laws
is convergence in `ProbabilityMeasure ℝ`; convergence in distribution of row sums is Mathlib's
`TendstoInDistribution` with limit `id` on `(ℝ, ν)`. A triangular array has rows indexed by
`Fin (m n)` on probability spaces `(Ω n, μ n)`, as in MathematicalStatisticsAsymptotic §1.2.
Quantities that can be infinite (the mass of a Lévy measure, moments) are stated with `∫⁻` and
`ℝ≥0∞`.

The implementation namespace of the README is `TauCeti`; the prototypes live in this roadmap's
namespace.
-/

@[expose] public section

noncomputable section

open MeasureTheory ProbabilityTheory Filter Set Topology Complex
open scoped ENNReal NNReal BoundedContinuousFunction

namespace TauCetiRoadmap.InfinitelyDivisibleLawsAndTriangularArrays

attribute [local instance] Classical.propDecidable

/-! ## Library suppliers named in the README -/

#check @charFun_conv
#check @charFun_pi
#check @ProbabilityTheory.IndepFun.charFun_map_add_eq_mul
#check @ProbabilityTheory.charFun_gaussianReal
#check @ProbabilityTheory.charFun_map_cast_poissonMeasure
#check @MeasureTheory.ProbabilityMeasure.tendsto_iff_tendsto_charFun
#check @isTightMeasureSet_of_tendsto_charFun
#check @measureReal_abs_gt_le_integral_charFun
#check @IsCoveringMap.existsUnique_continuousMap_lifts
#check @Complex.isCoveringMap_exp
#check @ProbabilityTheory.tendsto_choose_mul_pow_of_tendsto_mul_atTop
#check @TauCeti.exists_probabilityMeasure_of_tendsto_charFun

/-! ## Layer 1: characteristic functions on the line -/

section CharFun

/-- The truncated Lévy inversion integral
`(2π)⁻¹ ∫_{-T}^{T} (e^{-ita} - e^{-itb}) / (it) φ(t) dt`. At `t = 0` the integrand is `0` (a
junk value on a null set). -/
def levyInversionIntegral (μ : Measure ℝ) (a b T : ℝ) : ℂ :=
  (2 * Real.pi : ℂ)⁻¹ *
    ∫ t in (-T)..T, (cexp (-(t * a) * I) - cexp (-(t * b) * I)) / (t * I) * charFun μ t

/-- 1.1 **Lévy's inversion formula.** For `a < b`,
`levyInversionIntegral μ a b T → μ (a, b) + (μ {a} + μ {b}) / 2` as `T → ∞`. -/
theorem tendsto_levyInversionIntegral (μ : Measure ℝ) [IsProbabilityMeasure μ] {a b : ℝ}
    (hab : a < b) :
    Tendsto (levyInversionIntegral μ a b) atTop
      (𝓝 ((μ.real (Ioo a b) + (μ.real {a} + μ.real {b}) / 2 : ℝ) : ℂ)) := by
  sorry

/-- 1.1 **The atom formula.** `(2T)⁻¹ ∫_{-T}^{T} e^{-ita} φ(t) dt → μ {a}` as `T → ∞`. -/
theorem tendsto_atom_inversion (μ : Measure ℝ) [IsProbabilityMeasure μ] (a : ℝ) :
    Tendsto (fun T : ℝ ↦ (2 * T : ℂ)⁻¹ * ∫ t in (-T)..T, cexp (-(t * a) * I) * charFun μ t)
      atTop (𝓝 (μ.real {a} : ℂ)) := by
  sorry

/-- 1.2 Weak convergence of laws gives uniform convergence of their characteristic functions on
compact sets. -/
theorem tendstoLocallyUniformly_charFun {μ : ℕ → ProbabilityMeasure ℝ} {μ₀ : ProbabilityMeasure ℝ}
    (h : Tendsto μ atTop (𝓝 μ₀)) :
    TendstoLocallyUniformly (fun n t ↦ charFun (μ n : Measure ℝ) t)
      (charFun (μ₀ : Measure ℝ)) atTop := by
  sorry

/-- 1.2 The doubling inequality `1 - |φ(2t)|² ≤ 4 (1 - |φ(t)|²)`. -/
theorem one_sub_norm_charFun_two_mul_sq_le (μ : Measure ℝ) [IsProbabilityMeasure μ] (t : ℝ) :
    1 - ‖charFun μ (2 * t)‖ ^ 2 ≤ 4 * (1 - ‖charFun μ t‖ ^ 2) := by
  sorry

/-- A law is degenerate when it is a point mass. -/
def IsDegenerate (μ : Measure ℝ) : Prop := ∃ c : ℝ, μ = Measure.dirac c

/-- The affine image `x ↦ a x + b` of a probability law, as a probability law. -/
def affineMap (μ : ProbabilityMeasure ℝ) (a b : ℝ) : ProbabilityMeasure ℝ :=
  μ.map fun x ↦ a * x + b

/-- 1.3 **Convergence of types** (Khintchine). If `μ n → μ₀` and the affine images
`x ↦ a n * x + b n` of `μ n`, with `a n > 0`, converge to `ν₀`, and `μ₀`, `ν₀` are
nondegenerate, then `a n → a > 0`, `b n → b`, and `ν₀` is the affine image of `μ₀`. -/
theorem convergence_of_types {μ : ℕ → ProbabilityMeasure ℝ} {μ₀ ν₀ : ProbabilityMeasure ℝ}
    {a b : ℕ → ℝ} (ha : ∀ n, 0 < a n) (hμ : Tendsto μ atTop (𝓝 μ₀))
    (hν : Tendsto (fun n ↦ affineMap (μ n) (a n) (b n)) atTop (𝓝 ν₀))
    (hμ₀ : ¬ IsDegenerate (μ₀ : Measure ℝ)) (hν₀ : ¬ IsDegenerate (ν₀ : Measure ℝ)) :
    ∃ a₀ b₀ : ℝ, 0 < a₀ ∧ Tendsto a atTop (𝓝 a₀) ∧ Tendsto b atTop (𝓝 b₀) ∧
      ν₀ = affineMap μ₀ a₀ b₀ := by
  sorry

end CharFun

/-! ## Layer 2: infinitely divisible laws -/

section InfinitelyDivisible

variable {α : Type*} [MeasurableSpace α] [AddCommMonoid α]

/-- The law of the sum of `n` independent draws from `μ`: the push-forward of the product law
under the sum map. -/
def iidSumLaw (μ : Measure α) (n : ℕ) : Measure α :=
  (Measure.pi fun _ : Fin n ↦ μ).map fun x ↦ ∑ i, x i

/-- A law is infinitely divisible when, for every `n ≥ 1`, it is the law of the sum of `n`
independent identically distributed summands with values in the same space. -/
def IsInfinitelyDivisible (μ : Measure α) : Prop :=
  IsProbabilityMeasure μ ∧
    ∀ n : ℕ, 0 < n → ∃ ν : Measure α, IsProbabilityMeasure ν ∧ iidSumLaw ν n = μ

end InfinitelyDivisible

/-- Sanity check of the definition: the characteristic function of the `n`-fold independent
sum is the `n`-th power of the characteristic function. -/
theorem charFun_iidSumLaw (μ : Measure ℝ) [IsProbabilityMeasure μ] (n : ℕ) (t : ℝ) :
    charFun (iidSumLaw μ n) t = charFun μ t ^ n := by
  sorry

/-- 2.1 The characteristic function of an infinitely divisible law has no zeros. -/
theorem IsInfinitelyDivisible.charFun_ne_zero {μ : Measure ℝ} (h : IsInfinitelyDivisible μ)
    (t : ℝ) : charFun μ t ≠ 0 := by
  sorry

/-- 2.1 Infinite divisibility is preserved by convolution. -/
theorem IsInfinitelyDivisible.conv {μ ν : Measure ℝ} (hμ : IsInfinitelyDivisible μ)
    (hν : IsInfinitelyDivisible ν) : IsInfinitelyDivisible (μ ∗ ν) := by
  sorry

/-- 2.1 Infinite divisibility is preserved by weak limits. -/
theorem isInfinitelyDivisible_of_tendsto {μ : ℕ → ProbabilityMeasure ℝ}
    {μ₀ : ProbabilityMeasure ℝ} (h : Tendsto μ atTop (𝓝 μ₀))
    (hμ : ∀ n, IsInfinitelyDivisible (μ n : Measure ℝ)) :
    IsInfinitelyDivisible (μ₀ : Measure ℝ) := by
  sorry

/-- 2.2 The distinguished logarithm of a continuous nonvanishing function `φ` with `φ 0 = 1`:
the unique continuous `ψ` with `ψ 0 = 0` and `exp ∘ ψ = φ`; `0` when no such `ψ` exists. -/
def distLog (φ : ℝ → ℂ) : ℝ → ℂ :=
  if h : ∃ ψ : ℝ → ℂ, Continuous ψ ∧ ψ 0 = 0 ∧ ∀ t, cexp (ψ t) = φ t then h.choose else 0

/-- 2.2 Existence and uniqueness of the distinguished logarithm. -/
theorem existsUnique_distLog {φ : ℝ → ℂ} (hφ : Continuous φ) (h0 : φ 0 = 1)
    (hne : ∀ t, φ t ≠ 0) :
    ∃! ψ : ℝ → ℂ, Continuous ψ ∧ ψ 0 = 0 ∧ ∀ t, cexp (ψ t) = φ t := by
  sorry

/-- 2.2 Continuity of the distinguished logarithm: locally uniform convergence of continuous
nonvanishing functions with value `1` at `0` gives locally uniform convergence of their
distinguished logarithms. -/
theorem tendstoLocallyUniformly_distLog {φ : ℕ → ℝ → ℂ} {φ₀ : ℝ → ℂ}
    (hφ : ∀ n, Continuous (φ n)) (h0 : ∀ n, φ n 0 = 1) (hne : ∀ n t, φ n t ≠ 0)
    (hφ₀ : Continuous φ₀) (hne₀ : ∀ t, φ₀ t ≠ 0)
    (h : TendstoLocallyUniformly φ φ₀ atTop) :
    TendstoLocallyUniformly (fun n ↦ distLog (φ n)) (distLog φ₀) atTop := by
  sorry

/-- 2.3 The `n`-th root of an infinitely divisible law is unique, and its characteristic
function is `exp (distLog φ / n)`. -/
theorem IsInfinitelyDivisible.charFun_root {μ ν : Measure ℝ} (hμ : IsInfinitelyDivisible μ)
    [IsProbabilityMeasure ν] {n : ℕ} (hn : 0 < n) (hν : iidSumLaw ν n = μ) (t : ℝ) :
    charFun ν t = cexp (distLog (charFun μ) t / n) := by
  sorry

/-- 2.3 **Compound Poisson approximation.** If `μ` is infinitely divisible and `ν n` is its
`n`-th root, then `exp (n (φ_{ν n} - 1)) → φ_μ` pointwise. -/
theorem IsInfinitelyDivisible.tendsto_exp_charFun_root {μ : Measure ℝ}
    (hμ : IsInfinitelyDivisible μ) {ν : ℕ → Measure ℝ} [∀ n, IsProbabilityMeasure (ν n)]
    (hν : ∀ n, 0 < n → iidSumLaw (ν n) n = μ) (t : ℝ) :
    Tendsto (fun n : ℕ ↦ cexp (n * (charFun (ν n) t - 1))) atTop (𝓝 (charFun μ t)) := by
  sorry

/-- 2.4 A Gaussian lower bound: the characteristic function of an infinitely divisible law
satisfies `|φ(t)| ≥ e^{-γ t²} / 2` for some `γ > 0`. -/
theorem IsInfinitelyDivisible.exists_norm_charFun_ge {μ : Measure ℝ}
    (hμ : IsInfinitelyDivisible μ) :
    ∃ γ > 0, ∀ t, Real.exp (-γ * t ^ 2) / 2 ≤ ‖charFun μ t‖ := by
  sorry

/-- 2.4 An infinitely divisible law with bounded support is a point mass. -/
theorem IsInfinitelyDivisible.isDegenerate_of_measure_compl_Icc {μ : Measure ℝ}
    (hμ : IsInfinitelyDivisible μ) {R : ℝ} (hR : μ (Icc (-R) R)ᶜ = 0) : IsDegenerate μ := by
  sorry

/-! ## Layer 3: the Lévy–Khintchine formula -/

/-- A Lévy–Khintchine triplet: a drift, a Gaussian variance and a Lévy measure, with the
truncation `1{|x| ≤ 1}`. -/
structure LevyTriplet where
  /-- The drift `b`. -/
  drift : ℝ
  /-- The Gaussian variance `σ²`. -/
  gaussVar : ℝ≥0
  /-- The Lévy measure `ν`. -/
  levyMeasure : Measure ℝ
  /-- `ν` has no atom at `0`. -/
  measure_zero : levyMeasure {0} = 0
  /-- `∫ min 1 x² dν < ∞`. -/
  lintegral_min_lt_top : ∫⁻ x, ENNReal.ofReal (min 1 (x ^ 2)) ∂levyMeasure < ∞

/-- The integrand `e^{itx} - 1 - i t x 1{|x| ≤ 1}` of the Lévy–Khintchine exponent. -/
def levyIntegrand (t x : ℝ) : ℂ :=
  cexp (t * x * I) - 1 - (if |x| ≤ 1 then (t * x : ℂ) * I else 0)

/-- The Lévy–Khintchine exponent
`ψ(t) = i b t - σ² t² / 2 + ∫ (e^{itx} - 1 - itx 1{|x| ≤ 1}) dν`. -/
def LevyTriplet.exponent (T : LevyTriplet) (t : ℝ) : ℂ :=
  T.drift * t * I - (T.gaussVar : ℂ) * t ^ 2 / 2 + ∫ x, levyIntegrand t x ∂T.levyMeasure

/-- `μ` has Lévy–Khintchine triplet `T` when `charFun μ = exp ∘ T.exponent`. -/
def HasLevyTriplet (μ : Measure ℝ) (T : LevyTriplet) : Prop :=
  ∀ t, charFun μ t = cexp (T.exponent t)

/-- The truncated second moment `σ² + ∫_{|x| ≤ 1} x² dν` of a triplet. -/
def LevyTriplet.truncVar (T : LevyTriplet) : ℝ :=
  T.gaussVar + ∫ x in Icc (-1) 1, x ^ 2 ∂T.levyMeasure

/-- 3.1 The Lévy integrand is integrable against every Lévy measure. -/
theorem LevyTriplet.integrable_levyIntegrand (T : LevyTriplet) (t : ℝ) :
    Integrable (levyIntegrand t) T.levyMeasure := by
  sorry

/-- 3.2 **Existence.** Every triplet is the triplet of a law, which is infinitely divisible. -/
theorem LevyTriplet.exists_hasLevyTriplet (T : LevyTriplet) :
    ∃ μ : Measure ℝ, IsInfinitelyDivisible μ ∧ HasLevyTriplet μ T := by
  sorry

/-- Sanity check of the definition: a measure with a Lévy–Khintchine triplet is a probability
measure, since `charFun μ 0 = μ.real univ` must equal `exp 0 = 1`. -/
theorem HasLevyTriplet.isProbabilityMeasure {μ : Measure ℝ} {T : LevyTriplet}
    (h : HasLevyTriplet μ T) : IsProbabilityMeasure μ := by
  sorry

/-- Sanity check of the definition: the Poisson law of mean `λ`, pushed to `ℝ`, has triplet
`(λ, 0, λ δ₁)`; the drift is `λ`, not `0`, because the jump `1` lies inside the truncation. -/
theorem exists_hasLevyTriplet_poisson (r : ℝ≥0) :
    ∃ T : LevyTriplet, HasLevyTriplet ((poissonMeasure r).map ((↑) : ℕ → ℝ)) T ∧
      T.drift = r ∧ T.gaussVar = 0 ∧ T.levyMeasure = (r : ℝ≥0∞) • Measure.dirac 1 := by
  sorry

/-- 3.2 A law with a Lévy–Khintchine triplet is infinitely divisible. -/
theorem HasLevyTriplet.isInfinitelyDivisible {μ : Measure ℝ}
    {T : LevyTriplet} (h : HasLevyTriplet μ T) : IsInfinitelyDivisible μ := by
  sorry

/-- 3.2 **Lévy–Khintchine representation.** Every infinitely divisible law has a triplet. -/
theorem IsInfinitelyDivisible.exists_hasLevyTriplet {μ : Measure ℝ}
    (h : IsInfinitelyDivisible μ) : ∃ T : LevyTriplet, HasLevyTriplet μ T := by
  sorry

/-- 3.2 **Uniqueness of the triplet.** -/
theorem HasLevyTriplet.unique {μ : Measure ℝ} {T T' : LevyTriplet} (h : HasLevyTriplet μ T)
    (h' : HasLevyTriplet μ T') : T = T' := by
  sorry

/-- 3.3 **Affine images.** If `μ` has triplet `T` and `a > 0`, the image of `μ` under
`x ↦ a x + d` has Gaussian variance `a² σ²`, Lévy measure the image of `ν` under `x ↦ a x`, and
drift `a b + d + a ∫ x (1{|x| ≤ 1/a} - 1{|x| ≤ 1}) dν`. -/
theorem HasLevyTriplet.map_affine {μ : Measure ℝ} {T : LevyTriplet}
    (h : HasLevyTriplet μ T) {a : ℝ} (ha : 0 < a) (d : ℝ) :
    ∃ T' : LevyTriplet, HasLevyTriplet (μ.map fun x ↦ a * x + d) T' ∧
      (T'.gaussVar : ℝ) = a ^ 2 * T.gaussVar ∧
      T'.levyMeasure = T.levyMeasure.map (fun x ↦ a * x) ∧
      T'.drift = a * T.drift + d +
        a * ∫ x, x * ((Icc (-a⁻¹) a⁻¹).indicator 1 x - (Icc (-1) 1).indicator 1 x)
          ∂T.levyMeasure := by
  sorry

/-- 3.4 **Kolmogorov's finite-variance form.** A law with triplet `T` has a finite second moment
iff `∫_{|x| > 1} x² dν < ∞`; then its mean is `b + ∫_{|x| > 1} x dν` and its variance is
`σ² + ∫ x² dν`. -/
theorem HasLevyTriplet.memLp_two_iff {μ : Measure ℝ} {T : LevyTriplet}
    (h : HasLevyTriplet μ T) :
    (MemLp id 2 μ ↔ ∫⁻ x in (Icc (-1) 1)ᶜ, ENNReal.ofReal (x ^ 2) ∂T.levyMeasure < ∞) ∧
      (MemLp id 2 μ →
        ∫ x, x ∂μ = T.drift + ∫ x in (Icc (-1) 1)ᶜ, x ∂T.levyMeasure ∧
        variance id μ = T.gaussVar + ∫ x, x ^ 2 ∂T.levyMeasure) := by
  sorry

/-- 3.5 **Doeblin's criterion.** An infinitely divisible law has no atoms iff its Gaussian part is
nonzero or its Lévy measure is infinite. -/
theorem HasLevyTriplet.forall_measure_singleton_eq_zero_iff {μ : Measure ℝ} {T : LevyTriplet}
    (h : HasLevyTriplet μ T) :
    (∀ x, μ {x} = 0) ↔ (0 < T.gaussVar ∨ T.levyMeasure univ = ∞) := by
  sorry

/-- 3.6 **Infinitely divisible laws on the half-line.** A law with triplet `T` is carried by
`[0, ∞)` iff `σ² = 0`, `ν` is carried by `(0, ∞)`, `∫ min 1 x dν < ∞` and
`b - ∫_{(0,1]} x dν ≥ 0`. -/
theorem HasLevyTriplet.measure_Iio_zero_eq_zero_iff {μ : Measure ℝ} {T : LevyTriplet}
    (h : HasLevyTriplet μ T) :
    μ (Iio 0) = 0 ↔ T.gaussVar = 0 ∧ T.levyMeasure (Iic 0) = 0 ∧
      ∫⁻ x, ENNReal.ofReal (min 1 x) ∂T.levyMeasure < ∞ ∧
      0 ≤ T.drift - ∫ x in Ioc 0 1, x ∂T.levyMeasure := by
  sorry

/-- Convergence of measures away from the origin: `∫ f dν n → ∫ f dν₀` for every bounded
continuous `f` vanishing on a neighbourhood of `0`. -/
def TendstoAwayFromZero (ν : ℕ → Measure ℝ) (ν₀ : Measure ℝ) : Prop :=
  ∀ f : ℝ →ᵇ ℝ, (∃ ε > 0, ∀ x, |x| < ε → f x = 0) →
    Tendsto (fun n ↦ ∫ x, f x ∂ν n) atTop (𝓝 (∫ x, f x ∂ν₀))

/-- 3.7 **The Lévy measure from the roots.** If `ν n` is the `n`-th root of `μ`, then
`n • ν n → ν` away from the origin. -/
theorem HasLevyTriplet.tendstoAwayFromZero_root {μ : Measure ℝ} {T : LevyTriplet}
    (h : HasLevyTriplet μ T) {ν : ℕ → Measure ℝ} [∀ n, IsProbabilityMeasure (ν n)]
    (hν : ∀ n, 0 < n → iidSumLaw (ν n) n = μ) :
    TendstoAwayFromZero (fun n ↦ (n : ℝ≥0∞) • ν n) T.levyMeasure := by
  sorry

/-! ## Layer 4: convergence of infinitely divisible laws -/

/-- 4.1 **Convergence of infinitely divisible laws.** For laws with triplets `T n`, `T₀` and
`ν₀ {|x| = 1} = 0`, weak convergence is equivalent to convergence of the Lévy measures away from
the origin, of the truncated second moments and of the drifts. -/
theorem tendsto_iff_levyTriplet {μ : ℕ → ProbabilityMeasure ℝ} {μ₀ : ProbabilityMeasure ℝ}
    {T : ℕ → LevyTriplet} {T₀ : LevyTriplet} (hT : ∀ n, HasLevyTriplet (μ n) (T n))
    (hT₀ : HasLevyTriplet μ₀ T₀) (h1 : T₀.levyMeasure {x | |x| = 1} = 0) :
    Tendsto μ atTop (𝓝 μ₀) ↔
      TendstoAwayFromZero (fun n ↦ (T n).levyMeasure) T₀.levyMeasure ∧
      Tendsto (fun n ↦ (T n).truncVar) atTop (𝓝 T₀.truncVar) ∧
      Tendsto (fun n ↦ (T n).drift) atTop (𝓝 T₀.drift) := by
  sorry

/-! ## Layer 5: infinitesimal triangular arrays -/

section Arrays

variable {Ω : ℕ → Type*} [∀ n, MeasurableSpace (Ω n)] {μ : ∀ n, Measure (Ω n)}
  [∀ n, IsProbabilityMeasure (μ n)] {m : ℕ → ℕ}

/-- A triangular array is infinitesimal (a null array) when `max_j P(|X n j| > ε) → 0` for
every `ε > 0`. -/
def IsInfinitesimalArray (μ : ∀ n, Measure (Ω n)) (X : ∀ n, Fin (m n) → Ω n → ℝ) : Prop :=
  ∀ ε > 0, Tendsto (fun n ↦ ⨆ j, μ n {ω | ε < |X n j ω|}) atTop (𝓝 0)

/-- The truncation `x 1{|x| ≤ 1}`. -/
def truncOne (x : ℝ) : ℝ := (Icc (-1 : ℝ) 1).indicator id x

/-- 5.1 An array is infinitesimal iff `max_j |1 - φ_{n j}(t)| → 0` for every `t`. -/
theorem isInfinitesimalArray_iff_charFun {X : ∀ n, Fin (m n) → Ω n → ℝ}
    (hX : ∀ n j, Measurable (X n j)) :
    IsInfinitesimalArray μ X ↔
      ∀ t, Tendsto (fun n ↦ ⨆ j, ‖1 - charFun ((μ n).map (X n j)) t‖) atTop (𝓝 0) := by
  sorry

/-- 5.2 **Khintchine's theorem.** A limit in distribution of the row sums of an infinitesimal
array of independent variables is infinitely divisible. -/
theorem isInfinitelyDivisible_of_tendstoInDistribution {X : ∀ n, Fin (m n) → Ω n → ℝ}
    (hX : ∀ n j, Measurable (X n j)) (hindep : ∀ n, iIndepFun (X n) (μ n))
    (hnull : IsInfinitesimalArray μ X) {ν : Measure ℝ} [IsProbabilityMeasure ν]
    (h : TendstoInDistribution (fun n ω ↦ ∑ j, X n j ω) atTop id μ ν) :
    IsInfinitelyDivisible ν := by
  sorry

/-- 5.3 **The Doeblin–Gnedenko criterion.** For an infinitesimal array of independent variables
and an infinitely divisible `ν` with triplet `T` and `T.levyMeasure {|x| = 1} = 0`, the row sums
converge in distribution to `ν` iff the row sums of the laws converge to the Lévy measure away
from the origin, the row sums of the truncated variances converge to `σ² + ∫_{|x| ≤ 1} x² dν`,
and the row sums of the truncated means converge to `b`. -/
theorem tendstoInDistribution_iff_levyTriplet {X : ∀ n, Fin (m n) → Ω n → ℝ}
    (hX : ∀ n j, Measurable (X n j)) (hindep : ∀ n, iIndepFun (X n) (μ n))
    (hnull : IsInfinitesimalArray μ X) {ν : Measure ℝ} [IsProbabilityMeasure ν] {T : LevyTriplet}
    (hT : HasLevyTriplet ν T) (h1 : T.levyMeasure {x | |x| = 1} = 0) :
    TendstoInDistribution (fun n ω ↦ ∑ j, X n j ω) atTop id μ ν ↔
      TendstoAwayFromZero (fun n ↦ ∑ j, (μ n).map (X n j)) T.levyMeasure ∧
      Tendsto (fun n ↦ ∑ j, variance (fun ω ↦ truncOne (X n j ω)) (μ n)) atTop
        (𝓝 T.truncVar) ∧
      Tendsto (fun n ↦ ∑ j, ∫ ω, truncOne (X n j ω) ∂μ n) atTop (𝓝 T.drift) := by
  sorry

/-- 5.4 **Gaussian convergence** (Feller, Lévy). For an infinitesimal array of independent
variables, the row sums converge to `N(b, c)` iff `∑_j P(|X n j| > ε) → 0` for every `ε > 0`,
`∑_j E(X n j; |X n j| ≤ 1) → b` and `∑_j Var(X n j 1{|X n j| ≤ 1}) → c`. -/
theorem tendstoInDistribution_gaussianReal_iff {X : ∀ n, Fin (m n) → Ω n → ℝ}
    (hX : ∀ n j, Measurable (X n j)) (hindep : ∀ n, iIndepFun (X n) (μ n))
    (hnull : IsInfinitesimalArray μ X) (b : ℝ) (c : ℝ≥0) :
    TendstoInDistribution (fun n ω ↦ ∑ j, X n j ω) atTop id μ (gaussianReal b c) ↔
      (∀ ε > 0, Tendsto (fun n ↦ ∑ j, (μ n).real {ω | ε < |X n j ω|}) atTop (𝓝 0)) ∧
      Tendsto (fun n ↦ ∑ j, ∫ ω, truncOne (X n j ω) ∂μ n) atTop (𝓝 b) ∧
      Tendsto (fun n ↦ ∑ j, variance (fun ω ↦ truncOne (X n j ω)) (μ n)) atTop (𝓝 c) := by
  sorry

/-- 5.5 **Feller's converse to Lindeberg's theorem.** For independent centred square-integrable
rows with `∑_j Var X n j → 1` and `max_j Var X n j → 0`, convergence of the row sums to
`N(0, 1)` implies the Lindeberg condition. -/
theorem lindeberg_of_tendstoInDistribution {X : ∀ n, Fin (m n) → Ω n → ℝ}
    (hX : ∀ n j, Measurable (X n j)) (hindep : ∀ n, iIndepFun (X n) (μ n))
    (hL2 : ∀ n j, MemLp (X n j) 2 (μ n)) (hmean : ∀ n j, ∫ ω, X n j ω ∂μ n = 0)
    (hvar : Tendsto (fun n ↦ ∑ j, variance (X n j) (μ n)) atTop (𝓝 1))
    (hmax : Tendsto (fun n ↦ ⨆ j, variance (X n j) (μ n)) atTop (𝓝 0))
    (h : TendstoInDistribution (fun n ω ↦ ∑ j, X n j ω) atTop id μ (gaussianReal 0 1)) :
    ∀ ε > 0, Tendsto (fun n ↦ ∑ j, ∫ ω in {ω | ε < |X n j ω|}, X n j ω ^ 2 ∂μ n) atTop
      (𝓝 0) := by
  sorry

/-- 5.6 **Poisson convergence.** For an infinitesimal array of independent `ℕ`-valued variables
and `c ≥ 0`, the row sums converge to the Poisson law of mean `c` iff
`∑_j P(X n j > 1) → 0` and `∑_j P(X n j = 1) → c`. -/
theorem tendstoInDistribution_poissonMeasure_iff {X : ∀ n, Fin (m n) → Ω n → ℕ}
    (hX : ∀ n j, Measurable (X n j)) (hindep : ∀ n, iIndepFun (X n) (μ n))
    (hnull : Tendsto (fun n ↦ ⨆ j, μ n {ω | 0 < X n j ω}) atTop (𝓝 0)) (c : ℝ≥0) :
    TendstoInDistribution (fun n ω ↦ ∑ j, X n j ω) atTop id μ (poissonMeasure c) ↔
      Tendsto (fun n ↦ ∑ j, (μ n).real {ω | 1 < X n j ω}) atTop (𝓝 0) ∧
      Tendsto (fun n ↦ ∑ j, (μ n).real {ω | X n j ω = 1}) atTop (𝓝 c) := by
  sorry

end Arrays

/-! ## Layer 6: regular variation -/

/-- `U` is regularly varying at `∞` with index `ρ`: eventually positive, and
`U (t x) / U t → x ^ ρ` as `t → ∞` for every `x > 0`. -/
def IsRegularlyVarying (ρ : ℝ) (U : ℝ → ℝ) : Prop :=
  (∀ᶠ t in atTop, 0 < U t) ∧ ∀ x > 0, Tendsto (fun t ↦ U (t * x) / U t) atTop (𝓝 (x ^ ρ))

/-- `L` is slowly varying at `∞`: regularly varying with index `0`. -/
abbrev IsSlowlyVarying (L : ℝ → ℝ) : Prop := IsRegularlyVarying 0 L

/-- 6.1 **The limit of the ratios is a power.** If `U` is measurable and eventually positive
and `U (t x) / U t → h x` for every `x > 0`, then `h x = x ^ ρ` for some `ρ`. -/
theorem exists_rpow_of_tendsto_div {U h : ℝ → ℝ} (hU : Measurable U) (hpos : ∀ᶠ t in atTop, 0 < U t)
    (hlim : ∀ x > 0, Tendsto (fun t ↦ U (t * x) / U t) atTop (𝓝 (h x))) :
    ∃ ρ : ℝ, ∀ x > 0, h x = x ^ ρ := by
  sorry

/-- 6.1 **Uniform convergence theorem.** For measurable regularly varying `U`, the convergence
`U (t x) / U t → x ^ ρ` is uniform on compact subsets of `(0, ∞)`. -/
theorem IsRegularlyVarying.tendstoUniformlyOn {ρ : ℝ} {U : ℝ → ℝ} (hU : Measurable U)
    (h : IsRegularlyVarying ρ U) {a b : ℝ} (ha : 0 < a) :
    TendstoUniformlyOn (fun t x ↦ U (t * x) / U t) (fun x ↦ x ^ ρ) atTop (Icc a b) := by
  sorry

/-- 6.2 **Karamata's theorem.** If `U ≥ 0` is regularly varying with index `ρ ≥ -1` and
integrable on every `(0, x]`, then `x ↦ ∫_0^x U` is regularly varying with index `ρ + 1` and
`x U x / ∫_0^x U → ρ + 1`. -/
theorem IsRegularlyVarying.integral {ρ : ℝ} {U : ℝ → ℝ} (h : IsRegularlyVarying ρ U)
    (hρ : -1 ≤ ρ) (hU0 : ∀ x > 0, 0 ≤ U x) (hint : ∀ x > 0, IntegrableOn U (Ioc 0 x)) :
    IsRegularlyVarying (ρ + 1) (fun x ↦ ∫ t in Ioc 0 x, U t) ∧
      Tendsto (fun x ↦ x * U x / ∫ t in Ioc 0 x, U t) atTop (𝓝 (ρ + 1)) := by
  sorry

/-- The truncated second moment `x ↦ ∫_{|y| ≤ x} y² dμ` of a law. -/
def truncSecondMoment (μ : Measure ℝ) (x : ℝ) : ℝ := ∫ y in Icc (-x) x, y ^ 2 ∂μ

/-- 6.3 **Tails under a slowly varying truncated second moment** (Karamata). If `μ` is
nondegenerate and `L₀ = truncSecondMoment μ` is slowly varying, then
`x^{2-p} ∫_{|y| > x} |y|^p dμ / L₀ x → 0` for every `p ∈ [0, 2)`, and the truncated second
moment of every translate of `μ` is slowly varying. -/
theorem tendsto_tail_div_truncSecondMoment {μ : Measure ℝ} [IsProbabilityMeasure μ]
    (hμ : ¬ IsDegenerate μ) (hL : IsSlowlyVarying (truncSecondMoment μ)) :
    (∀ p ∈ Ico (0 : ℝ) 2, Tendsto (fun x ↦ ENNReal.ofReal (x ^ (2 - p)) *
        (∫⁻ y in {y | x < |y|}, ENNReal.ofReal (|y| ^ p) ∂μ) /
          ENNReal.ofReal (truncSecondMoment μ x)) atTop (𝓝 0)) ∧
      ∀ c : ℝ, IsSlowlyVarying (truncSecondMoment (μ.map fun y ↦ y - c)) := by
  sorry

/-! ## Layer 7: sums of independent identically distributed variables -/

section IID

variable {Ω : Type*} [MeasurableSpace Ω] {P : Measure Ω} [IsProbabilityMeasure P]

/-- 7.1 **Feller's weak law of large numbers.** For an i.i.d. sequence, `S_n / n → c` in
probability iff `r P(|X₀| > r) → 0` and `E(X₀; |X₀| ≤ r) → c` as `r → ∞`. -/
theorem tendstoInMeasure_weakLaw_iff {X : ℕ → Ω → ℝ} (hX : ∀ i, Measurable (X i))
    (hindep : iIndepFun X P) (hident : ∀ i, IdentDistrib (X i) (X 0) P P) (c : ℝ) :
    TendstoInMeasure P (fun (n : ℕ) ω ↦ (∑ i ∈ Finset.range n, X i ω) / n) atTop (fun _ ↦ c) ↔
      Tendsto (fun r : ℝ ↦ r * P.real {ω | r < |X 0 ω|}) atTop (𝓝 0) ∧
      Tendsto (fun r : ℝ ↦ ∫ ω, (Icc (-r) r).indicator id (X 0 ω) ∂P) atTop (𝓝 c) := by
  sorry

/-- 7.1 **Weak laws with exponent `p ≠ 1`.** For an i.i.d. sequence and `p ∈ (0, 2)`,
`p ≠ 1`, `n^{-1/p} S_n → c` in probability iff `c = 0`, `r^p P(|X₀| > r) → 0`, and, when
`p > 1`, `E X₀ = 0`. -/
theorem tendstoInMeasure_rpow_weakLaw_iff {X : ℕ → Ω → ℝ} (hX : ∀ i, Measurable (X i))
    (hindep : iIndepFun X P) (hident : ∀ i, IdentDistrib (X i) (X 0) P P) {p : ℝ}
    (hp : 0 < p) (hp2 : p < 2) (hp1 : p ≠ 1) (c : ℝ) :
    TendstoInMeasure P (fun (n : ℕ) ω ↦ (n : ℝ) ^ (-p⁻¹) * ∑ i ∈ Finset.range n, X i ω) atTop
        (fun _ ↦ c) ↔
      c = 0 ∧ Tendsto (fun r : ℝ ↦ r ^ p * P.real {ω | r < |X 0 ω|}) atTop (𝓝 0) ∧
        (1 < p → ∫ ω, X 0 ω ∂P = 0) := by
  sorry

end IID

/-- A law is stable (in the broad sense) when it is nondegenerate and, for every `n ≥ 1`, the
sum of `n` independent copies has the law of `a X + b` for some `a > 0` and `b`. -/
def IsStable (μ : Measure ℝ) : Prop :=
  IsProbabilityMeasure μ ∧ ¬ IsDegenerate μ ∧
    ∀ n : ℕ, 0 < n → ∃ a > 0, ∃ b : ℝ, iidSumLaw μ n = μ.map fun x ↦ a * x + b

/-- A law is stable with index `α` when it is nondegenerate and the sum of `n` independent
copies has the law of `n^{1/α} X + b n`. -/
def IsStableWithIndex (α : ℝ) (μ : Measure ℝ) : Prop :=
  IsProbabilityMeasure μ ∧ ¬ IsDegenerate μ ∧
    ∀ n : ℕ, 0 < n → ∃ b : ℝ, iidSumLaw μ n = μ.map fun x ↦ (n : ℝ) ^ α⁻¹ * x + b

/-- `μ` lies in the domain of attraction of `ν` when `(S_n - b n) / a n → ν` in distribution
for some `a n > 0` and `b n`, where `S_n` is the sum of `n` independent draws from `μ`. -/
def IsInDomainOfAttraction (μ ν : Measure ℝ) [IsProbabilityMeasure μ] [IsProbabilityMeasure ν] :
    Prop :=
  ∃ a b : ℕ → ℝ, (∀ n, 0 < a n) ∧
    TendstoInDistribution (fun n (x : Fin n → ℝ) ↦ (∑ i, x i - b n) / a n) atTop id
      (fun n ↦ Measure.pi fun _ : Fin n ↦ μ) ν

/-- The power-law Lévy density `cp x^{-α-1}` on `(0, ∞)` and `cm |x|^{-α-1}` on `(-∞, 0)`. -/
def powerLevyDensity (α : ℝ) (cp cm : ℝ≥0) (x : ℝ) : ℝ≥0∞ :=
  if 0 < x then cp * ENNReal.ofReal (x ^ (-α - 1))
  else if x < 0 then cm * ENNReal.ofReal ((-x) ^ (-α - 1)) else 0

/-- 7.2 A stable law is infinitely divisible. -/
theorem IsStable.isInfinitelyDivisible {μ : Measure ℝ} (h : IsStable μ) :
    IsInfinitelyDivisible μ := by
  sorry

/-- 7.2 **The index of a stable law.** Every stable law is stable with some index
`α ∈ (0, 2]`. -/
theorem IsStable.exists_index {μ : Measure ℝ} (h : IsStable μ) :
    ∃ α ∈ Ioc (0 : ℝ) 2, IsStableWithIndex α μ := by
  sorry

/-- 7.2 A stable law of index `2` is Gaussian. -/
theorem IsStableWithIndex.exists_eq_gaussianReal {μ : Measure ℝ} (h : IsStableWithIndex 2 μ) :
    ∃ (m : ℝ) (v : ℝ≥0), 0 < v ∧ μ = gaussianReal m v := by
  sorry

/-- 7.2 **Stable laws through their triplets.** A nondegenerate law with triplet `T` is stable
iff `ν = 0`, or `σ² = 0` and `ν` has a power-law density with some index `α ∈ (0, 2)`. -/
theorem isStable_iff_levyTriplet {μ : Measure ℝ} {T : LevyTriplet} (hT : HasLevyTriplet μ T)
    (hμ : ¬ IsDegenerate μ) :
    IsStable μ ↔ T.levyMeasure = 0 ∨ (T.gaussVar = 0 ∧ ∃ α ∈ Ioo (0 : ℝ) 2, ∃ cp cm : ℝ≥0,
      T.levyMeasure = volume.withDensity (powerLevyDensity α cp cm)) := by
  sorry

/-- 7.3 **Stable laws are the limits of normalized i.i.d. sums.** A nondegenerate law has a
nonempty domain of attraction iff it is stable. -/
theorem isStable_iff_exists_isInDomainOfAttraction {ν : Measure ℝ} [IsProbabilityMeasure ν]
    (hν : ¬ IsDegenerate ν) :
    IsStable ν ↔ ∃ μ : Measure ℝ, ∃ _ : IsProbabilityMeasure μ, IsInDomainOfAttraction μ ν := by
  sorry

/-- 7.3 A stable law lies in its own domain of attraction. -/
theorem IsStable.isInDomainOfAttraction_self {ν : Measure ℝ} [IsProbabilityMeasure ν]
    (h : IsStable ν) : IsInDomainOfAttraction ν ν := by
  sorry

/-- 7.4 **Domain of attraction of the Gaussian law** (Lévy, Feller, Khintchine). A
nondegenerate law lies in the domain of attraction of `N(0, 1)` iff its truncated second moment
is slowly varying. -/
theorem isInDomainOfAttraction_gaussianReal_iff {μ : Measure ℝ} [IsProbabilityMeasure μ]
    (hμ : ¬ IsDegenerate μ) :
    IsInDomainOfAttraction μ (gaussianReal 0 1) ↔ IsSlowlyVarying (truncSecondMoment μ) := by
  sorry

/-- 7.4 **Domains of attraction of stable laws of index `α < 2`.** A law lies in the domain of
attraction of some stable law of index `α ∈ (0, 2)` iff its truncated second moment is regularly
varying with index `2 - α` and `P(X ≥ x) / P(|X| ≥ x)` converges. -/
theorem exists_isInDomainOfAttraction_iff {μ : Measure ℝ} [IsProbabilityMeasure μ] {α : ℝ}
    (hα : α ∈ Ioo (0 : ℝ) 2) :
    (∃ ν : Measure ℝ, ∃ _ : IsProbabilityMeasure ν, IsStableWithIndex α ν ∧
        IsInDomainOfAttraction μ ν) ↔
      IsRegularlyVarying (2 - α) (truncSecondMoment μ) ∧
        ∃ q : ℝ, Tendsto (fun x ↦ μ.real (Ici x) / μ.real {y | x ≤ |y|}) atTop (𝓝 q) := by
  sorry

/-- 7.5 **Moments in a domain of attraction.** If `μ` lies in the domain of attraction of a
stable law of index `α`, then `∫ |x|^β dμ < ∞` for `0 < β < α`, and `= ∞` for `β > α` when
`α < 2`. -/
theorem IsInDomainOfAttraction.lintegral_rpow {μ ν : Measure ℝ} [IsProbabilityMeasure μ]
    [IsProbabilityMeasure ν] {α : ℝ} (hν : IsStableWithIndex α ν)
    (h : IsInDomainOfAttraction μ ν) :
    (∀ β ∈ Ioo 0 α, ∫⁻ x, ENNReal.ofReal (|x| ^ β) ∂μ < ∞) ∧
      (α < 2 → ∀ β > α, ∫⁻ x, ENNReal.ofReal (|x| ^ β) ∂μ = ∞) := by
  sorry

/-! ## Layer 8: self-decomposable laws and infinite divisibility on `ℕ` -/

/-- A law `μ` is self-decomposable (of class L) when, for every `c ∈ (0, 1)`, it is the
convolution of its image under `x ↦ c x` with some law. -/
def IsSelfDecomposable (μ : Measure ℝ) : Prop :=
  IsProbabilityMeasure μ ∧ ∀ c ∈ Ioo (0 : ℝ) 1, ∃ ρ : Measure ℝ, IsProbabilityMeasure ρ ∧
    μ = (μ.map fun x ↦ c * x) ∗ ρ

/-- 8.1 A self-decomposable law is infinitely divisible. -/
theorem IsSelfDecomposable.isInfinitelyDivisible {μ : Measure ℝ} (h : IsSelfDecomposable μ) :
    IsInfinitelyDivisible μ := by
  sorry

/-- 8.1 **Lévy measures of self-decomposable laws.** A law with triplet `T` is
self-decomposable iff `ν (dx) = k x / |x| dx` with `k` nonincreasing on `(0, ∞)` and
nondecreasing on `(-∞, 0)`. -/
theorem HasLevyTriplet.isSelfDecomposable_iff {μ : Measure ℝ} {T : LevyTriplet}
    (hT : HasLevyTriplet μ T) :
    IsSelfDecomposable μ ↔ ∃ k : ℝ → ℝ≥0∞, Measurable k ∧ AntitoneOn k (Ioi 0) ∧
      MonotoneOn k (Iio 0) ∧
      T.levyMeasure = volume.withDensity fun x ↦ k x / ENNReal.ofReal |x| := by
  sorry

/-- 8.2 **Infinitely divisible laws on `ℕ`.** A law on `ℕ` is infinitely divisible on `ℕ` iff
`-log E s^ξ = ∑_k ν_k (1 - s^k)` for `s ∈ (0, 1]`, for a summable `ν` on `ℕ` with `ν 0 = 0`;
then `ν` is unique. -/
theorem isInfinitelyDivisible_nat_iff (μ : Measure ℕ) [IsProbabilityMeasure μ] :
    IsInfinitelyDivisible μ ↔ ∃! ν : ℕ → ℝ≥0, ν 0 = 0 ∧ Summable ν ∧
      ∀ s ∈ Ioc (0 : ℝ) 1,
        -Real.log (∑' k, μ.real {k} * s ^ k) = ∑' k, (ν k : ℝ) * (1 - s ^ k) := by
  sorry

end TauCetiRoadmap.InfinitelyDivisibleLawsAndTriangularArrays
