module

public import Mathlib
public import TauCeti.Algebra.BigOperators.Finset.PartialSum
public import TauCeti.Analysis.Convex.Majorization
public import TauCeti.Analysis.Convex.PermutationOrbit
public import TauCeti.Analysis.Convex.DoublyStochasticMatrix
public import TauCeti.Analysis.Convex.Conjugate
public import TauCeti.Probability.Process.EmpiricalMeasure
public import TauCeti.InformationTheory.KullbackLeibler.Pinsker

/-!
# Means, majorization and discrete inequalities: target signatures

This file is not the roadmap: the roadmap is `README.md`, and this file is not an exhaustive
checklist. It states, against the pinned Mathlib and Tau Ceti and each with `sorry`, the
headlines of the README that carry a Lean name, each with every conclusion the README attaches
to it, together with the definitions their statements need. The README's other headlines are
targets of the same standing, stated there in prose with their locators or proof routes, and are
not stated here.

The conventions of the README are used throughout. Weights are real functions on a finite type,
nonnegative and summing to `1` where a theorem says so. Means are stated for positive data.
`Majorizes x y` is the relation `x ≺ y`, "`x` is majorized by `y`", in the shape of the open
Mathlib pull request #41898: equal total sums, and for every `k` the largest sum of `k`
coordinates of `x` is at most that of `y`. `WeaklyMajorizes x y` is weak submajorization
`x ≺_w y`, the same with `≤` between the total sums. Quantities that can be infinite are stated
in `ℝ≥0∞` with lower Lebesgue integrals. The implementation namespace of the README is
`TauCeti`; the prototypes live in this roadmap's namespace.
-/

@[expose] public section

noncomputable section

open MeasureTheory Filter Set Finset Topology Matrix
open scoped ENNReal NNReal

namespace TauCetiRoadmap.MeansMajorizationAndDiscreteInequalities

attribute [local instance] Classical.propDecidable

variable {ι : Type*} [Fintype ι]

/-! ## Layer 1: means -/

section Means

/-- The weighted power mean `M_r(x; w)`: `(∑ wᵢ xᵢ ^ r) ^ (1 / r)` for `r ≠ 0`, and the weighted
geometric mean `∏ xᵢ ^ wᵢ` at `r = 0`. It is used for positive `x` and weights summing to `1`. -/
def powerMean (w x : ι → ℝ) (r : ℝ) : ℝ :=
  if r = 0 then ∏ i, x i ^ w i else (∑ i, w i * x i ^ r) ^ r⁻¹

/-- 1.1: the power-mean inequality. -/
theorem powerMean_le_powerMean {w x : ι → ℝ} (hw : ∀ i, 0 ≤ w i) (hw1 : ∑ i, w i = 1)
    (hx : ∀ i, 0 < x i) {r s : ℝ} (hrs : r ≤ s) : powerMean w x r ≤ powerMean w x s := by
  sorry

/-- 1.1: strictness of the power-mean inequality. -/
theorem powerMean_lt_powerMean_iff {w x : ι → ℝ} (hw : ∀ i, 0 ≤ w i) (hw1 : ∑ i, w i = 1)
    (hx : ∀ i, 0 < x i) {r s : ℝ} (hrs : r < s) :
    powerMean w x r < powerMean w x s ↔ ∃ i j, 0 < w i ∧ 0 < w j ∧ x i ≠ x j := by
  sorry

/-- 1.1: the power mean is continuous in its index, at `0` included. -/
theorem continuous_powerMean {w x : ι → ℝ} (hw : ∀ i, 0 ≤ w i) (hw1 : ∑ i, w i = 1)
    (hx : ∀ i, 0 < x i) : Continuous fun r ↦ powerMean w x r := by
  sorry

/-- 1.1: the limits of the power mean at `±∞` are the largest and the smallest entry. -/
theorem tendsto_powerMean_atTop_atBot [Nonempty ι] {w x : ι → ℝ} (hw : ∀ i, 0 < w i)
    (hw1 : ∑ i, w i = 1) (hx : ∀ i, 0 < x i) :
    Tendsto (fun r ↦ powerMean w x r) atTop (𝓝 (Finset.univ.sup' Finset.univ_nonempty x)) ∧
      Tendsto (fun r ↦ powerMean w x r) atBot (𝓝 (Finset.univ.inf' Finset.univ_nonempty x)) := by
  sorry

/-- 1.2: log-convexity of the moments of a finite positive family. -/
theorem convexOn_log_sum_mul_rpow {w x : ι → ℝ} (hw : ∀ i, 0 ≤ w i) (hw0 : ∃ i, 0 < w i)
    (hx : ∀ i, 0 < x i) : ConvexOn ℝ Set.univ fun r : ℝ ↦ Real.log (∑ i, w i * x i ^ r) := by
  sorry

/-- 1.2: the interpolation inequality for moments of a nonnegative function. -/
theorem lintegral_rpow_le_rpow_mul_rpow {α : Type*} [MeasurableSpace α] {μ : Measure α}
    {f : α → ℝ≥0∞} (hf : AEMeasurable f μ) {r s t : ℝ} (hr : 0 < r) (hs : 0 < s) (ht0 : 0 ≤ t)
    (ht1 : t ≤ 1) :
    ∫⁻ a, f a ^ ((1 - t) * r + t * s) ∂μ ≤
      (∫⁻ a, f a ^ r ∂μ) ^ (1 - t) * (∫⁻ a, f a ^ s ∂μ) ^ t := by
  sorry

/-- The quasi-arithmetic mean `φ⁻¹(∑ wᵢ φ(xᵢ))` with generator `φ` on the set `I`, the inverse
taken on `I`. It is used for an interval `I` and `φ` continuous and strictly monotone on `I`. -/
def quasiArithMean (φ : ℝ → ℝ) (I : Set ℝ) (w x : ι → ℝ) : ℝ :=
  Function.invFunOn φ I (∑ i, w i * φ (x i))

/-- 1.3: the quasi-arithmetic mean is well defined and internal. -/
theorem quasiArithMean_mem_Icc [Nonempty ι] {φ : ℝ → ℝ} {I : Set ℝ} (hI : I.OrdConnected)
    (hφc : ContinuousOn φ I) (hφm : StrictMonoOn φ I) {w x : ι → ℝ} (hw : ∀ i, 0 ≤ w i)
    (hw1 : ∑ i, w i = 1) (hx : ∀ i, x i ∈ I) :
    quasiArithMean φ I w x ∈ I ∧ φ (quasiArithMean φ I w x) = ∑ i, w i * φ (x i) ∧
      quasiArithMean φ I w x ∈
        Icc (Finset.univ.inf' Finset.univ_nonempty x)
          (Finset.univ.sup' Finset.univ_nonempty x) := by
  sorry

/-- 1.3: comparison of quasi-arithmetic means: `M_φ ≤ M_ψ` for all data exactly when
`ψ ∘ φ⁻¹` is convex. -/
theorem quasiArithMean_le_quasiArithMean_iff {φ ψ : ℝ → ℝ} {I : Set ℝ} (hI : I.OrdConnected)
    (hφc : ContinuousOn φ I) (hφm : StrictMonoOn φ I) (hψc : ContinuousOn ψ I)
    (hψm : StrictMonoOn ψ I) :
    (∀ (n : ℕ) (w x : Fin n → ℝ), (∀ i, 0 ≤ w i) → ∑ i, w i = 1 → (∀ i, x i ∈ I) →
        quasiArithMean φ I w x ≤ quasiArithMean ψ I w x) ↔
      ConvexOn ℝ (φ '' I) (ψ ∘ Function.invFunOn φ I) := by
  sorry

/-- 1.3: two generators give the same quasi-arithmetic mean exactly when they are affinely
related. -/
theorem quasiArithMean_eq_iff {φ ψ : ℝ → ℝ} {I : Set ℝ} (hI : I.OrdConnected)
    (hφc : ContinuousOn φ I) (hφm : StrictMonoOn φ I) (hψc : ContinuousOn ψ I)
    (hψm : StrictMonoOn ψ I) :
    (∀ (n : ℕ) (w x : Fin n → ℝ), (∀ i, 0 ≤ w i) → ∑ i, w i = 1 → (∀ i, x i ∈ I) →
        quasiArithMean φ I w x = quasiArithMean ψ I w x) ↔
      ∃ a b : ℝ, 0 < a ∧ ∀ y ∈ I, ψ y = a * φ y + b := by
  sorry

/-- 1.3: a positively homogeneous quasi-arithmetic mean on `(0, ∞)` is a power mean. -/
theorem exists_powerMean_eq_of_homogeneous {φ : ℝ → ℝ} (hφc : ContinuousOn φ (Ioi 0))
    (hφm : StrictMonoOn φ (Ioi 0))
    (hhom : ∀ (n : ℕ) (w x : Fin n → ℝ), (∀ i, 0 ≤ w i) → ∑ i, w i = 1 → (∀ i, 0 < x i) →
      ∀ k : ℝ, 0 < k → quasiArithMean φ (Ioi 0) w (k • x) = k * quasiArithMean φ (Ioi 0) w x) :
    ∃ r : ℝ, ∀ (n : ℕ) (w x : Fin n → ℝ), (∀ i, 0 ≤ w i) → ∑ i, w i = 1 → (∀ i, 0 < x i) →
      quasiArithMean φ (Ioi 0) w x = powerMean w x r := by
  sorry

/-- The logarithmic mean `(a - b) / (log a - log b)`, with value `a` on the diagonal. -/
def logMean (a b : ℝ) : ℝ :=
  if a = b then a else (a - b) / (Real.log a - Real.log b)

/-- 1.4: the integral representation of the logarithmic mean. -/
theorem logMean_eq_integral {a b : ℝ} (ha : 0 < a) (hb : 0 < b) :
    logMean a b = ∫ t in (0 : ℝ)..1, a ^ (1 - t) * b ^ t := by
  sorry

/-- 1.4: `√(ab) < L(a, b) < M_{1/3}(a, b)` for distinct positive `a, b` (Lin). -/
theorem sqrt_mul_lt_logMean_and_logMean_lt_powerMean {a b : ℝ} (ha : 0 < a) (hb : 0 < b)
    (hab : a ≠ b) :
    Real.sqrt (a * b) < logMean a b ∧ logMean a b < powerMean ![1 / 2, 1 / 2] ![a, b] (1 / 3) := by
  sorry

/-- 1.4: the index `1/3` is optimal in Lin's bound. -/
theorem exists_powerMean_lt_logMean {r : ℝ} (hr : r < 1 / 3) :
    ∃ a b : ℝ, 0 < a ∧ 0 < b ∧ powerMean ![1 / 2, 1 / 2] ![a, b] r < logMean a b := by
  sorry

end Means

/-! ## Layer 2: convex functions of one variable -/

section ConvexOneVariable

variable {α : Type*} [MeasurableSpace α]

/-- 2.1: the equality case of Jensen's inequality, by a supporting line at the mean. -/
theorem map_integral_eq_integral_comp_iff {μ : Measure α} [IsProbabilityMeasure μ] {s : Set ℝ}
    (hs : Convex ℝ s) (hso : IsOpen s) {φ : ℝ → ℝ} (hφ : ConvexOn ℝ s φ) {f : α → ℝ}
    (hfs : ∀ᵐ a ∂μ, f a ∈ s) (hf : Integrable f μ) (hφf : Integrable (φ ∘ f) μ) :
    φ (∫ a, f a ∂μ) = ∫ a, φ (f a) ∂μ ↔
      ∃ c : ℝ, (∀ y ∈ s, φ (∫ a, f a ∂μ) + c * (y - ∫ a, f a ∂μ) ≤ φ y) ∧
        ∀ᵐ a ∂μ, φ (f a) = φ (∫ a, f a ∂μ) + c * (f a - ∫ a, f a ∂μ) := by
  sorry

/-- 2.2: the Jensen–Steffensen inequality, with signed weights whose partial sums lie in
`[0, 1]`. -/
theorem jensen_steffensen {n : ℕ} {s : Set ℝ} {φ : ℝ → ℝ} (hφ : ConvexOn ℝ s φ)
    {w x : Fin n → ℝ} (hx : Monotone x ∨ Antitone x) (hxs : ∀ i, x i ∈ s) (hw1 : ∑ i, w i = 1)
    (hW : ∀ k, 0 ≤ TauCeti.prefixSum k w ∧ TauCeti.prefixSum k w ≤ 1) :
    φ (∑ i, w i * x i) ≤ ∑ i, w i * φ (x i) := by
  sorry

/-- 2.3: the Hermite–Hadamard inequality. -/
theorem hermite_hadamard {a b : ℝ} (hab : a < b) {φ : ℝ → ℝ} (hφ : ConvexOn ℝ (Icc a b) φ) :
    φ ((a + b) / 2) ≤ (b - a)⁻¹ * ∫ x in a..b, φ x ∧
      (b - a)⁻¹ * ∫ x in a..b, φ x ≤ (φ a + φ b) / 2 := by
  sorry

/-- 2.4: the Kantorovich inequality for a probability measure. -/
theorem integral_mul_integral_inv_le {μ : Measure α} [IsProbabilityMeasure μ] {f : α → ℝ}
    (hf : AEMeasurable f μ) {m M : ℝ} (hm : 0 < m) (hfb : ∀ᵐ a ∂μ, f a ∈ Icc m M) :
    (∫ a, f a ∂μ) * (∫ a, (f a)⁻¹ ∂μ) ≤ (M + m) ^ 2 / (4 * M * m) := by
  sorry

end ConvexOneVariable

/-! ## Layer 3: inequalities for sums and integrals -/

section SumsAndIntegrals

variable {α : Type*} [MeasurableSpace α]

/-- 3.1: Chebyshev's sum inequality with weights. -/
theorem sum_mul_sum_le_sum_mul_of_monovary {w a b : ι → ℝ} (hw : ∀ i, 0 ≤ w i)
    (hw1 : ∑ i, w i = 1) (hab : Monovary a b) :
    (∑ i, w i * a i) * (∑ i, w i * b i) ≤ ∑ i, w i * (a i * b i) := by
  sorry

/-- 3.1: the Grüss inequality on a probability space. -/
theorem abs_integral_mul_sub_le {μ : Measure α} [IsProbabilityMeasure μ] {f g : α → ℝ}
    (hf : AEStronglyMeasurable f μ) (hg : AEStronglyMeasurable g μ) {m M r R : ℝ}
    (hfb : ∀ᵐ a ∂μ, f a ∈ Icc m M) (hgb : ∀ᵐ a ∂μ, g a ∈ Icc r R) :
    |∫ a, f a * g a ∂μ - (∫ a, f a ∂μ) * ∫ a, g a ∂μ| ≤ (M - m) * (R - r) / 4 := by
  sorry

/-- 3.2: the equality case of Bergström's inequality. -/
theorem sq_sum_div_eq_sum_sq_div_iff {κ : Type*} {s : Finset κ} {a b : κ → ℝ}
    (hb : ∀ i ∈ s, 0 < b i) :
    (∑ i ∈ s, a i) ^ 2 / ∑ i ∈ s, b i = ∑ i ∈ s, a i ^ 2 / b i ↔
      ∃ c : ℝ, ∀ i ∈ s, a i = c * b i := by
  sorry

/-- 3.3: the reverse Minkowski inequality for exponents in `(0, 1)`. -/
theorem lintegral_rpow_add_rpow_le {μ : Measure α} {f g : α → ℝ≥0∞} (hf : AEMeasurable f μ)
    (hg : AEMeasurable g μ) {p : ℝ} (hp0 : 0 < p) (hp1 : p < 1) :
    (∫⁻ a, f a ^ p ∂μ) ^ (1 / p) + (∫⁻ a, g a ^ p ∂μ) ^ (1 / p) ≤
      (∫⁻ a, (f a + g a) ^ p ∂μ) ^ (1 / p) := by
  sorry

/-- 3.4: the generalized Hölder inequality with extended exponents. -/
theorem eLpNorm_prod_le {κ : Type*} {μ : Measure α} (s : Finset κ) {f : κ → α → ℝ}
    (hf : ∀ i ∈ s, AEStronglyMeasurable (f i) μ) {p : κ → ℝ≥0∞} {r : ℝ≥0∞}
    (hp : ∑ i ∈ s, (p i)⁻¹ = r⁻¹) :
    eLpNorm (fun a ↦ ∏ i ∈ s, f i a) r μ ≤ ∏ i ∈ s, eLpNorm (f i) (p i) μ := by
  sorry

/-- 3.4: the equality case of Hölder's inequality. -/
theorem lintegral_mul_eq_iff {μ : Measure α} {f g : α → ℝ≥0∞} (hf : AEMeasurable f μ)
    (hg : AEMeasurable g μ) {p q : ℝ} (hpq : p.HolderConjugate q)
    (hf0 : ∫⁻ a, f a ^ p ∂μ ≠ 0) (hftop : ∫⁻ a, f a ^ p ∂μ ≠ ∞)
    (hg0 : ∫⁻ a, g a ^ q ∂μ ≠ 0) (hgtop : ∫⁻ a, g a ^ q ∂μ ≠ ∞) :
    ∫⁻ a, f a * g a ∂μ = (∫⁻ a, f a ^ p ∂μ) ^ (1 / p) * (∫⁻ a, g a ^ q ∂μ) ^ (1 / q) ↔
      ∃ c : ℝ≥0, 0 < c ∧ (fun a ↦ f a ^ p) =ᵐ[μ] fun a ↦ (c : ℝ≥0∞) * g a ^ q := by
  sorry

/-- 3.4: the equality case of Minkowski's inequality for `1 < p`. -/
theorem lintegral_Lp_add_eq_iff {μ : Measure α} {f g : α → ℝ≥0∞} (hf : AEMeasurable f μ)
    (hg : AEMeasurable g μ) {p : ℝ} (hp : 1 < p)
    (hf0 : ∫⁻ a, f a ^ p ∂μ ≠ 0) (hftop : ∫⁻ a, f a ^ p ∂μ ≠ ∞)
    (hg0 : ∫⁻ a, g a ^ p ∂μ ≠ 0) (hgtop : ∫⁻ a, g a ^ p ∂μ ≠ ∞) :
    (∫⁻ a, (f a + g a) ^ p ∂μ) ^ (1 / p) =
        (∫⁻ a, f a ^ p ∂μ) ^ (1 / p) + (∫⁻ a, g a ^ p ∂μ) ^ (1 / p) ↔
      ∃ c : ℝ≥0, 0 < c ∧ f =ᵐ[μ] fun a ↦ (c : ℝ≥0∞) * g a := by
  sorry

end SumsAndIntegrals

/-! ## Layer 4: majorization -/

section Majorization

variable {M : Type*} [AddCommMonoid M] [LinearOrder M]

/-- Local copy of the shape of Mathlib PR #41898: the largest sum of `i` coordinates of `a`. -/
def maxSubsetSum (i : Fin (Fintype.card ι)) (a : ι → M) : M :=
  (Finset.univ.powersetCard i).sup'
    (Finset.powersetCard_nonempty.mpr (by rw [Finset.card_univ]; exact i.isLt.le))
    (fun s ↦ ∑ j ∈ s, a j)

/-- Majorization `a ≺ b`, "`a` is majorized by `b`", in the shape of Mathlib PR #41898: equal
total sums, and every largest `i`-coordinate sum of `a` is at most that of `b`. -/
structure Majorizes (a b : ι → M) : Prop where
  sum : ∑ j, a j = ∑ j, b j
  sums : ∀ i : Fin (Fintype.card ι), maxSubsetSum i a ≤ maxSubsetSum i b

/-- Weak submajorization `a ≺_w b`: the total sum of `a` is at most that of `b`, and every
largest `i`-coordinate sum of `a` is at most that of `b`. -/
structure WeaklyMajorizes (a b : ι → M) : Prop where
  sum_le : ∑ j, a j ≤ ∑ j, b j
  sums : ∀ i : Fin (Fintype.card ι), maxSubsetSum i a ≤ maxSubsetSum i b

/-- Doubly substochastic real matrices: nonnegative entries, row and column sums at most `1`. -/
def doublySubstochastic (κ : Type*) [Fintype κ] : Set (Matrix κ κ ℝ) :=
  {P | (∀ i j, 0 ≤ P i j) ∧ (∀ i, ∑ j, P i j ≤ 1) ∧ ∀ j, ∑ i, P i j ≤ 1}

/-- 4.1: majorization through the prefix sums of the decreasing rearrangements. -/
theorem majorizes_iff_prefixSum {n : ℕ} (x y : Fin n → ℝ) :
    Majorizes x y ↔
      (∀ k, TauCeti.prefixSum k (x ∘ Tuple.sortDesc x) ≤
          TauCeti.prefixSum k (y ∘ Tuple.sortDesc y)) ∧ ∑ i, x i = ∑ i, y i := by
  sorry

/-- 4.2: the Hardy–Littlewood–Pólya theorem: `x ≺ y` exactly when `x = D y` for a doubly
stochastic `D`. -/
theorem majorizes_iff_exists_doublyStochastic [DecidableEq ι] (x y : ι → ℝ) :
    Majorizes x y ↔ ∃ D ∈ doublyStochastic ℝ ι, x = D *ᵥ y := by
  sorry

/-- 4.3: Karamata's inequality on a convex set containing the entries. -/
theorem Majorizes.sum_le_sum_of_convexOn {x y : ι → ℝ} (hxy : Majorizes x y) {s : Set ℝ}
    {φ : ℝ → ℝ} (hφ : ConvexOn ℝ s φ) (hx : ∀ i, x i ∈ s) (hy : ∀ i, y i ∈ s) :
    ∑ i, φ (x i) ≤ ∑ i, φ (y i) := by
  sorry

/-- 4.3: majorization is exactly the order tested by convex functions. -/
theorem majorizes_iff_forall_convexOn (x y : ι → ℝ) :
    Majorizes x y ↔ ∀ φ : ℝ → ℝ, ConvexOn ℝ Set.univ φ → ∑ i, φ (x i) ≤ ∑ i, φ (y i) := by
  sorry

/-- 4.3: the equality case of Karamata's inequality for a strictly convex function. -/
theorem Majorizes.sum_eq_sum_iff_of_strictConvexOn {x y : ι → ℝ} (hxy : Majorizes x y)
    {s : Set ℝ} {φ : ℝ → ℝ} (hφ : StrictConvexOn ℝ s φ) (hx : ∀ i, x i ∈ s)
    (hy : ∀ i, y i ∈ s) :
    ∑ i, φ (x i) = ∑ i, φ (y i) ↔ ∃ σ : Equiv.Perm ι, x = y ∘ σ := by
  sorry

/-- 4.4: weak majorization is the order tested by increasing convex functions (Tomić–Weyl). -/
theorem weaklyMajorizes_iff_forall_monotone_convexOn (x y : ι → ℝ) :
    WeaklyMajorizes x y ↔
      ∀ φ : ℝ → ℝ, Monotone φ → ConvexOn ℝ Set.univ φ → ∑ i, φ (x i) ≤ ∑ i, φ (y i) := by
  sorry

/-- 4.4: `x ≺_w y` exactly when `x ≤ z ≺ y` for some `z`. -/
theorem weaklyMajorizes_iff_exists_le_majorizes (x y : ι → ℝ) :
    WeaklyMajorizes x y ↔ ∃ z, x ≤ z ∧ Majorizes z y := by
  sorry

/-- 4.4: for nonnegative vectors, `x ≺_w y` exactly when `x = P y` for a doubly substochastic
`P`. -/
theorem weaklyMajorizes_iff_exists_doublySubstochastic {x y : ι → ℝ} (hx : 0 ≤ x) (hy : 0 ≤ y) :
    WeaklyMajorizes x y ↔ ∃ P ∈ doublySubstochastic ι, x = P *ᵥ y := by
  sorry

/-- 4.4: on antitone nonnegative tuples, weak majorization is Tau Ceti's
`IsWeaklyMajorizedBy`. -/
theorem weaklyMajorizes_iff_isWeaklyMajorizedBy {n : ℕ} {x y : Fin n → ℝ} (hx : Antitone x)
    (hy : Antitone y) (hx0 : 0 ≤ x) (hy0 : 0 ≤ y) :
    WeaklyMajorizes x y ↔ TauCeti.IsWeaklyMajorizedBy x y := by
  sorry

/-- 4.5: a doubly stochastic matrix contracts every permutation-invariant seminorm. -/
theorem apply_mulVec_le_of_mem_doublyStochastic [DecidableEq ι] {p : Seminorm ℝ (ι → ℝ)}
    (hp : ∀ (σ : Equiv.Perm ι) (x : ι → ℝ), p (x ∘ σ) = p x) {D : Matrix ι ι ℝ}
    (hD : D ∈ doublyStochastic ℝ ι) (x : ι → ℝ) : p (D *ᵥ x) ≤ p x := by
  sorry

end Majorization

/-! ## Layer 5: Schur-convex and symmetric functions -/

section SchurConvex

/-- `φ` is Schur-convex on `s`: `x ≺ y` in `s` implies `φ x ≤ φ y`. -/
def SchurConvexOn (s : Set (ι → ℝ)) (φ : (ι → ℝ) → ℝ) : Prop :=
  ∀ x ∈ s, ∀ y ∈ s, Majorizes x y → φ x ≤ φ y

/-- 5.1: the Schur–Ostrowski criterion on `Iⁿ` for an open interval `I`. -/
theorem schurConvexOn_iff_fderiv [DecidableEq ι] {I : Set ℝ} (hIo : IsOpen I)
    (hI : I.OrdConnected) {φ : (ι → ℝ) → ℝ} (hφ : DifferentiableOn ℝ φ (Set.univ.pi fun _ ↦ I)) :
    SchurConvexOn (Set.univ.pi fun _ ↦ I) φ ↔
      (∀ x ∈ Set.univ.pi (fun _ ↦ I), ∀ σ : Equiv.Perm ι, φ (x ∘ σ) = φ x) ∧
        ∀ x ∈ Set.univ.pi (fun _ ↦ I), ∀ i j, 0 ≤ (x i - x j) *
          (fderiv ℝ φ x (Pi.single i 1) - fderiv ℝ φ x (Pi.single j 1)) := by
  sorry

/-- The Muirhead symmetric sum `∑_σ ∏ᵢ x_{σ i} ^ αᵢ`. -/
def muirheadSum (α x : ι → ℝ) : ℝ :=
  ∑ σ : Equiv.Perm ι, ∏ i, x (σ i) ^ α i

/-- 5.2: Muirhead's theorem, with its converse. -/
theorem majorizes_iff_forall_muirheadSum_le (α β : ι → ℝ) :
    Majorizes α β ↔ ∀ x : ι → ℝ, (∀ i, 0 < x i) → muirheadSum α x ≤ muirheadSum β x := by
  sorry

/-- 5.3: Schur's inequality for positive numbers and a real exponent. -/
theorem schur_inequality {x y z : ℝ} (hx : 0 < x) (hy : 0 < y) (hz : 0 < z) (t : ℝ) :
    0 ≤ x ^ t * (x - y) * (x - z) + y ^ t * (y - z) * (y - x) + z ^ t * (z - x) * (z - y) := by
  sorry

/-- The Shannon entropy `∑ -pᵢ log pᵢ` of a real vector, with `0 log 0 = 0`. -/
def entropy (p : ι → ℝ) : ℝ := ∑ i, Real.negMulLog (p i)

/-- 5.4: entropy is Schur-concave on nonnegative vectors. -/
theorem Majorizes.entropy_le {p q : ι → ℝ} (hpq : Majorizes p q) (hq : 0 ≤ q) :
    entropy q ≤ entropy p := by
  sorry

/-- 5.4: the uniform vector maximizes entropy, and only it. -/
theorem entropy_le_log_card {p : ι → ℝ} (hp : 0 ≤ p) (hp1 : ∑ i, p i = 1) :
    entropy p ≤ Real.log (Fintype.card ι) ∧
      (entropy p = Real.log (Fintype.card ι) ↔ p = fun _ ↦ ((Fintype.card ι : ℝ))⁻¹) := by
  sorry

end SchurConvex

/-! ## Layer 6: convex order and the log-sum inequality -/

section ConvexOrder

/-- The convex order `μ ≤cx ν` between laws on `ℝ` with finite first moment: every convex `φ`
integrable under both has `∫ φ dμ ≤ ∫ φ dν`. -/
def ConvexOrderLE (μ ν : Measure ℝ) : Prop :=
  Integrable id μ ∧ Integrable id ν ∧
    ∀ φ : ℝ → ℝ, ConvexOn ℝ Set.univ φ → Integrable φ μ → Integrable φ ν →
      ∫ x, φ x ∂μ ≤ ∫ x, φ x ∂ν

/-- 6.1: the stop-loss characterization of the convex order. -/
theorem convexOrderLE_iff_stopLoss (μ ν : Measure ℝ) [IsProbabilityMeasure μ]
    [IsProbabilityMeasure ν] :
    ConvexOrderLE μ ν ↔ Integrable id μ ∧ Integrable id ν ∧ ∫ x, x ∂μ = ∫ x, x ∂ν ∧
      ∀ t : ℝ, ∫ x, max (x - t) 0 ∂μ ≤ ∫ x, max (x - t) 0 ∂ν := by
  sorry

/-- 6.1: the convex order controls every convex function integrable under the larger law. -/
theorem ConvexOrderLE.integrable_and_integral_le {μ ν : Measure ℝ} [IsProbabilityMeasure μ]
    [IsProbabilityMeasure ν] (h : ConvexOrderLE μ ν) {φ : ℝ → ℝ} (hφ : ConvexOn ℝ Set.univ φ)
    (hφν : Integrable φ ν) : Integrable φ μ ∧ ∫ x, φ x ∂μ ≤ ∫ x, φ x ∂ν := by
  sorry

/-- 6.2: majorization is the convex order of the empirical laws. -/
theorem majorizes_iff_convexOrderLE [Nonempty ι] (x y : ι → ℝ) :
    Majorizes x y ↔
      ConvexOrderLE (TauCeti.Probability.empiricalFiniteMeasure x : Measure ℝ)
        (TauCeti.Probability.empiricalFiniteMeasure y : Measure ℝ) := by
  sorry

/-- 6.3: the log-sum inequality. -/
theorem sum_mul_log_div_le {κ : Type*} {s : Finset κ} {a b : κ → ℝ} (ha : ∀ i ∈ s, 0 ≤ a i)
    (hb : ∀ i ∈ s, 0 < b i) :
    (∑ i ∈ s, a i) * Real.log ((∑ i ∈ s, a i) / ∑ i ∈ s, b i) ≤
      ∑ i ∈ s, a i * Real.log (a i / b i) := by
  sorry

/-- 6.3: the equality case of the log-sum inequality. -/
theorem sum_mul_log_div_eq_iff {κ : Type*} {s : Finset κ} {a b : κ → ℝ}
    (ha : ∀ i ∈ s, 0 ≤ a i) (hb : ∀ i ∈ s, 0 < b i) :
    (∑ i ∈ s, a i) * Real.log ((∑ i ∈ s, a i) / ∑ i ∈ s, b i) =
        ∑ i ∈ s, a i * Real.log (a i / b i) ↔
      ∃ c : ℝ, ∀ i ∈ s, a i = c * b i := by
  sorry

end ConvexOrder

/-! ## Mathlib and Tau Ceti names used in the README

Every Mathlib or Tau Ceti name that the README writes in code font is pinned here, the supplier
contracts and also the names its conventions and proof routes mention. -/

#check @Real.geom_mean_le_arith_mean_weighted
#check @Real.geom_mean_eq_arith_mean_weighted_iff_of_pos
#check @Real.harm_mean_le_geom_mean_weighted
#check @Real.rpow_arith_mean_le_arith_mean_rpow
#check @Real.arith_mean_le_rpow_mean
#check @Real.young_inequality
#check @Real.young_inequality_eq_iff_of_nonneg
#check @Real.inner_le_Lp_mul_Lq
#check @Real.Lp_add_le
#check @ENNReal.lintegral_mul_norm_pow_le
#check @ENNReal.lintegral_prod_norm_pow_le
#check @ENNReal.lintegral_mul_le_Lp_mul_Lq
#check @ENNReal.lintegral_Lp_add_le
#check @ENNReal.lintegral_Lp_add_le_of_le_one
#check @MeasureTheory.eLpNorm_smul_le_mul_eLpNorm
#check @MeasureTheory.eLpNorm_le_eLpNorm_of_exponent_le
#check @norm_inner_le_norm
#check @Finset.sum_mul_sq_le_sq_mul_sq
#check @Finset.sq_sum_div_le_sum_sq_div
#check @MonovaryOn.sum_mul_sum_le_card_mul_sum
#check @MonovaryOn.sum_smul_comp_perm_le_sum_smul
#check @Monovary.sum_mul_comp_perm_le_sum_mul
#check @ProbabilityTheory.variance_le_sq_of_bounded
#check @ConvexOn.map_sum_le
#check @StrictConvexOn.map_sum_eq_iff
#check @ConvexOn.map_integral_le
#check @StrictConvexOn.ae_eq_const_or_map_average_lt
#check @ConvexOn.slope_mono_adjacent
#check @doublyStochastic
#check @doublyStochastic_eq_convexHull_permMatrix
#check @exists_eq_sum_perm_of_mem_doublyStochastic
#check @extremePoints_doublyStochastic
#check @Matrix.l2_opNorm_le_one_of_mem_doublyStochastic
#check @Tuple.sortDesc
#check @Tuple.antitone_sortDesc
#check @Real.negMulLog
#check @Real.strictConcaveOn_negMulLog
#check @Real.strictConvexOn_mul_log
#check @Real.binEntropy_le_log_two
#check @InformationTheory.klDiv
#check @InformationTheory.klDiv_eq_zero_iff
#check @InformationTheory.klDiv_map_le
#check @InformationTheory.mul_log_le_klDiv
#check @InformationTheory.mul_log_le_toReal_klDiv
#check @intervalIntegral.integral_comp_mul_deriv
#check @TauCeti.prefixSum
#check @TauCeti.IsWeaklyMajorizedBy
#check @TauCeti.IsWeaklyMajorizedBy.apply_le
#check @TauCeti.robinHood
#check @TauCeti.mem_of_prefixSum_le_of_sum_eq
#check @TauCeti.IsSymmetricConvex.mem_of_prefixSum_le
#check @Seminorm.IsSymmetricGauge
#check @Seminorm.isSymmetricGauge_piLp
#check @Matrix.mulVec_mem_convexHull_range_comp_perm
#check @TauCeti.mem_convexHull_range_comp_perm_iff
#check @TauCeti.mem_convexHull_range_comp_perm_iff_of_antitone
#check @ConvexOn.sum_map_mulVec_le_of_mem_doublyStochastic
#check @Monovary.dotProduct_mulVec_le_of_mem_doublyStochastic
#check @TauCeti.sub_le_fenchelConjugate
#check @norm_inner_eq_norm_iff
#check @ENNReal.HolderTriple
#check @convexOn_rpow
#check @Function.invFunOn_eq
#check @Real.exp
#check @Real.rpow
#check @MeasureTheory.integral_eq_zero_iff_of_nonneg_ae
#check @Finset.sup'
#check @TauCeti.Probability.empiricalFiniteMeasure
#check @TauCeti.Probability.integral_empiricalFiniteMeasure
#check @TauCeti.etvDist_sq_le_two_mul_klDiv

end TauCetiRoadmap.MeansMajorizationAndDiscreteInequalities
