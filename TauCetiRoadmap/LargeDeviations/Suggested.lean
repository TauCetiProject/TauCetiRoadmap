module

public import Mathlib
public import TauCeti.Analysis.Convex.Conjugate
public import TauCeti.Analysis.Convex.FenchelMoreau
public import TauCeti.InformationTheory.KullbackLeibler.Variational
public import TauCeti.MeasureTheory.Measure.ProbabilityMeasure.Borel
public import TauCeti.MeasureTheory.Measure.ProbabilityMeasure.Separable
public import TauCeti.Probability.Process.EmpiricalMeasure

/-!
# Large deviations: target signatures

This file is not the roadmap: the roadmap is `README.md`, and this file is not an exhaustive
checklist. It states, against the pinned Mathlib and Tau Ceti and each with `sorry`, the
headlines of the README that carry a Lean name, each with every conclusion the README attaches
to it, together with the definitions their statements need. The README's other headlines are
targets of the same standing, stated there in prose with their locators or proof routes.

The conventions of the README are used throughout. A family of laws is a sequence
`μ : ℕ → Measure X` with a speed `a : ℕ → ℝ`; rate functions take values in `ℝ≥0∞`; the
normalized logarithm `(a n)⁻¹ * ENNReal.log (μ n s)` takes values in `EReal`, with
`ENNReal.log 0 = ⊥`, so that sets of measure `0` carry the value `-∞` and never the junk value
`Real.log 0 = 0`. Infima of rate functions are taken in `EReal` after coercion, so that the
infimum over the empty set is `⊤`. Exponential moments are lower integrals of
`ENNReal.ofReal (Real.exp _)`, which may be `⊤`; the logarithmic moment generating function is
`EReal`-valued. Laws of sample means and of empirical measures are indexed by `n` and use the
sample size `n + 1`, at speed `n + 1`.

The large deviation principle, good rate functions, the weak principle, exponential tightness
and exponential equivalence are owned by `RandomMatrices` §9.1; they appear here as local copies
with a docstring naming their owner. The implementation namespace of the README is `TauCeti`;
the prototypes live in this roadmap's namespace.
-/

@[expose] public section

noncomputable section

open MeasureTheory ProbabilityTheory Filter Set Topology InformationTheory
open scoped ENNReal NNReal BoundedContinuousFunction InnerProductSpace

namespace TauCetiRoadmap.LargeDeviations

/-! ## Local copies of `RandomMatrices` §9.1 vocabulary -/

section Framework

variable {X : Type*} [TopologicalSpace X] [MeasurableSpace X]

/-- Local copy of `RandomMatrices` §9.1: the large deviation principle at speed `a` with rate
`I` (Anderson–Guionnet–Zeitouni, Definition D.1): `I` is lower semicontinuous, every closed `F`
satisfies `limsup a(n)⁻¹ log μₙ(F) ≤ -inf_F I`, and every open `U` satisfies
`-inf_U I ≤ liminf a(n)⁻¹ log μₙ(U)`, with `log 0 = -∞`. -/
def LargeDeviationPrinciple (μ : ℕ → Measure X) (a : ℕ → ℝ) (I : X → ℝ≥0∞) : Prop :=
  LowerSemicontinuous I ∧
    (∀ F : Set X, IsClosed F →
      limsup (fun n ↦ ((a n)⁻¹ : ℝ) * ENNReal.log (μ n F)) atTop ≤ -(⨅ x ∈ F, (I x : EReal))) ∧
    ∀ U : Set X, IsOpen U →
      -(⨅ x ∈ U, (I x : EReal)) ≤ liminf (fun n ↦ ((a n)⁻¹ : ℝ) * ENNReal.log (μ n U)) atTop

/-- Local copy of `RandomMatrices` §9.1: a good rate function is lower semicontinuous with
compact sublevel sets `{x | I x ≤ c}` for every finite `c` (Anderson–Guionnet–Zeitouni,
Definition D.3(b)). -/
def IsGoodRateFunction {Y : Type*} [TopologicalSpace Y] (I : Y → ℝ≥0∞) : Prop :=
  LowerSemicontinuous I ∧ ∀ c : ℝ≥0, IsCompact {x | I x ≤ c}

/-- Local copy of `RandomMatrices` §9.1: the weak large deviation principle, with the upper
bound required for compact sets only (Anderson–Guionnet–Zeitouni, Definition D.2). -/
def WeakLargeDeviationPrinciple (μ : ℕ → Measure X) (a : ℕ → ℝ) (I : X → ℝ≥0∞) : Prop :=
  LowerSemicontinuous I ∧
    (∀ K : Set X, IsCompact K →
      limsup (fun n ↦ ((a n)⁻¹ : ℝ) * ENNReal.log (μ n K)) atTop ≤ -(⨅ x ∈ K, (I x : EReal))) ∧
    ∀ U : Set X, IsOpen U →
      -(⨅ x ∈ U, (I x : EReal)) ≤ liminf (fun n ↦ ((a n)⁻¹ : ℝ) * ENNReal.log (μ n U)) atTop

/-- Local copy of `RandomMatrices` §9.1: exponential tightness (Anderson–Guionnet–Zeitouni,
Definition D.3(a)): for every `M` some compact `K` has `limsup a(n)⁻¹ log μₙ(Kᶜ) ≤ -M`. -/
def IsExponentiallyTight (μ : ℕ → Measure X) (a : ℕ → ℝ) : Prop :=
  ∀ M : ℝ, ∃ K : Set X, IsCompact K ∧
    limsup (fun n ↦ ((a n)⁻¹ : ℝ) * ENNReal.log (μ n Kᶜ)) atTop ≤ -(M : EReal)

/-- Local copy of `RandomMatrices` §9.1: exponential equivalence of two sequences of random
elements of a pseudometric space defined on common probability spaces (Kallenberg, (26) of
Chapter 24): for every `δ > 0`, `a(n)⁻¹ log Pₙ{dist (Yₙ, Zₙ) > δ} → -∞`. -/
def ExponentiallyEquivalent {Ω S : Type*} [MeasurableSpace Ω] [PseudoMetricSpace S]
    (P : ℕ → Measure Ω) (a : ℕ → ℝ) (Y Z : ℕ → Ω → S) : Prop :=
  ∀ δ : ℝ, 0 < δ → Tendsto
    (fun n ↦ ((a n)⁻¹ : ℝ) * ENNReal.log (P n {ω | δ < dist (Y n ω) (Z n ω)})) atTop (𝓝 ⊥)

end Framework

/-! ## Layer 1: rate functions and the principle -/

section Layer1

variable {X : Type*} [TopologicalSpace X] [MeasurableSpace X]

/-- **1.1** A good rate function attains its infimum on every nonempty closed set. -/
theorem IsGoodRateFunction.exists_isMinOn {I : X → ℝ≥0∞} (hI : IsGoodRateFunction I)
    {F : Set X} (hF : IsClosed F) (hne : F.Nonempty) : ∃ x ∈ F, IsMinOn I F x := sorry

/-- **1.2** Under a large deviation principle for probability measures the rate function has
infimum `0`, and a good rate function has a zero. -/
theorem LargeDeviationPrinciple.iInf_eq_zero {μ : ℕ → Measure X}
    [∀ n, IsProbabilityMeasure (μ n)] {a : ℕ → ℝ} {I : X → ℝ≥0∞}
    (h : LargeDeviationPrinciple μ a I) :
    ⨅ x, I x = 0 ∧ (IsGoodRateFunction I → ∃ x, I x = 0) := sorry

/-- **1.2** The limit on `I`-continuity sets. -/
theorem LargeDeviationPrinciple.tendsto_log_measure {μ : ℕ → Measure X} {a : ℕ → ℝ}
    (ha : Tendsto a atTop atTop) {I : X → ℝ≥0∞} (h : LargeDeviationPrinciple μ a I)
    {s : Set X} (hs : ⨅ x ∈ interior s, I x = ⨅ x ∈ closure s, I x) :
    Tendsto (fun n ↦ ((a n)⁻¹ : ℝ) * ENNReal.log (μ n s)) atTop
      (𝓝 (-(⨅ x ∈ s, (I x : EReal)))) := sorry

/-- **1.2** Exponential decay of a closed set containing no zero of a good rate function. -/
theorem LargeDeviationPrinciple.exists_pos_eventually_log_le {μ : ℕ → Measure X} {a : ℕ → ℝ}
    {I : X → ℝ≥0∞} (hI : IsGoodRateFunction I) (h : LargeDeviationPrinciple μ a I)
    {F : Set X} (hF : IsClosed F) (hzero : ∀ x ∈ F, I x ≠ 0) :
    ∃ c : ℝ, 0 < c ∧
      ∀ᶠ n in atTop, ((a n)⁻¹ : ℝ) * ENNReal.log (μ n F) ≤ -(c : EReal) := sorry

/-- **1.3** The principle of the largest term. -/
theorem limsup_log_sum {ι : Type*} (s : Finset ι) (hs : s.Nonempty) (b : ι → ℕ → ℝ≥0∞)
    {a : ℕ → ℝ} (ha : Tendsto a atTop atTop) :
    limsup (fun n ↦ ((a n)⁻¹ : ℝ) * ENNReal.log (∑ i ∈ s, b i n)) atTop =
      s.sup' hs (fun i ↦ limsup (fun n ↦ ((a n)⁻¹ : ℝ) * ENNReal.log (b i n)) atTop) := sorry

/-- **1.4** Uniqueness of the rate function on a regular space. -/
theorem LargeDeviationPrinciple.unique [RegularSpace X] {μ : ℕ → Measure X} {a : ℕ → ℝ}
    (ha : Tendsto a atTop atTop) {I J : X → ℝ≥0∞} (hI : LargeDeviationPrinciple μ a I)
    (hJ : LargeDeviationPrinciple μ a J) : I = J := sorry

/-- **1.4** The weak principle from asymptotics on balls. -/
theorem weakLargeDeviationPrinciple_of_ball {Y : Type*} [PseudoMetricSpace Y] [MeasurableSpace Y]
    {μ : ℕ → Measure Y} {a : ℕ → ℝ} (ha : Tendsto a atTop atTop) {I : Y → ℝ≥0∞}
    (hup : ∀ x, Tendsto
      (fun δ ↦ limsup (fun n ↦ ((a n)⁻¹ : ℝ) * ENNReal.log (μ n (Metric.ball x δ))) atTop)
      (𝓝[>] 0) (𝓝 (-(I x : EReal))))
    (hlow : ∀ x, Tendsto
      (fun δ ↦ liminf (fun n ↦ ((a n)⁻¹ : ℝ) * ENNReal.log (μ n (Metric.ball x δ))) atTop)
      (𝓝[>] 0) (𝓝 (-(I x : EReal)))) :
    WeakLargeDeviationPrinciple μ a I := sorry

/-- **1.5** For an exponentially tight family, the upper bound on compact sets implies the upper
bound on closed sets, for any `I`. -/
theorem IsExponentiallyTight.limsup_log_measure_le {μ : ℕ → Measure X} {a : ℕ → ℝ}
    (ha : Tendsto a atTop atTop) (ht : IsExponentiallyTight μ a) {I : X → ℝ≥0∞}
    (hK : ∀ K : Set X, IsCompact K →
      limsup (fun n ↦ ((a n)⁻¹ : ℝ) * ENNReal.log (μ n K)) atTop ≤ -(⨅ x ∈ K, (I x : EReal)))
    {F : Set X} (hF : IsClosed F) :
    limsup (fun n ↦ ((a n)⁻¹ : ℝ) * ENNReal.log (μ n F)) atTop ≤ -(⨅ x ∈ F, (I x : EReal)) :=
  sorry

/-- **1.5** An exponentially tight family satisfying the weak principle satisfies the full
principle, with a good rate function. -/
theorem WeakLargeDeviationPrinciple.of_isExponentiallyTight [T2Space X] {μ : ℕ → Measure X}
    {a : ℕ → ℝ} (ha : Tendsto a atTop atTop) {I : X → ℝ≥0∞}
    (h : WeakLargeDeviationPrinciple μ a I) (ht : IsExponentiallyTight μ a) :
    IsGoodRateFunction I ∧ LargeDeviationPrinciple μ a I := sorry

/-- **1.5** On a Polish space a principle with a good rate function forces exponential
tightness. -/
theorem LargeDeviationPrinciple.isExponentiallyTight [PolishSpace X] [OpensMeasurableSpace X]
    {μ : ℕ → Measure X} [∀ n, IsProbabilityMeasure (μ n)] {a : ℕ → ℝ}
    (ha : Tendsto a atTop atTop) {I : X → ℝ≥0∞} (hI : IsGoodRateFunction I)
    (h : LargeDeviationPrinciple μ a I) : IsExponentiallyTight μ a := sorry

end Layer1

/-! ## Layer 2: exponential moments, Varadhan's lemma and Bryc's converse -/

section Layer2

variable {X : Type*} [TopologicalSpace X] [MeasurableSpace X]

/-- The Laplace principle at speed `a` with rate `I` (Dupuis–Ellis, Definition 1.2.2, with the
sign of the test function reversed): for every bounded continuous `f`,
`a(n)⁻¹ log ∫ exp (a(n) f) dμₙ → sup (f - I)`. -/
def LaplacePrinciple (μ : ℕ → Measure X) (a : ℕ → ℝ) (I : X → ℝ≥0∞) : Prop :=
  ∀ f : X →ᵇ ℝ, Tendsto
    (fun n ↦ ((a n)⁻¹ : ℝ) *
      ENNReal.log (∫⁻ x, ENNReal.ofReal (Real.exp (a n * f x)) ∂μ n)) atTop
    (𝓝 (⨆ x, ((f x : EReal) - I x)))

/-- **2.1** The exponential Chebyshev upper bound on compact sets. -/
theorem limsup_log_measure_le_of_lintegral_exp [OpensMeasurableSpace X] {μ : ℕ → Measure X}
    {a : ℕ → ℝ} (ha : Tendsto a atTop atTop) {J : Type*} (F : J → X → ℝ)
    (hF : ∀ j, Continuous (F j)) (Λ : J → EReal)
    (hΛ : ∀ j, limsup (fun n ↦ ((a n)⁻¹ : ℝ) *
      ENNReal.log (∫⁻ x, ENNReal.ofReal (Real.exp (a n * F j x)) ∂μ n)) atTop ≤ Λ j)
    {K : Set X} (hK : IsCompact K) :
    limsup (fun n ↦ ((a n)⁻¹ : ℝ) * ENNReal.log (μ n K)) atTop ≤
      -(⨅ x ∈ K, ⨆ j, ((F j x : EReal) - Λ j)) := sorry

/-- **2.2** Varadhan's lemma for bounded continuous functions: the principle implies the
Laplace principle with the same rate. -/
theorem LargeDeviationPrinciple.laplacePrinciple [OpensMeasurableSpace X] {μ : ℕ → Measure X}
    [∀ n, IsProbabilityMeasure (μ n)] {a : ℕ → ℝ} (ha : Tendsto a atTop atTop)
    {I : X → ℝ≥0∞} (h : LargeDeviationPrinciple μ a I) : LaplacePrinciple μ a I := sorry

/-- **2.2** Varadhan's lemma for continuous functions under the tail condition. -/
theorem LargeDeviationPrinciple.tendsto_log_lintegral_exp [OpensMeasurableSpace X]
    {μ : ℕ → Measure X} [∀ n, IsProbabilityMeasure (μ n)]
    {a : ℕ → ℝ} (ha : Tendsto a atTop atTop) {I : X → ℝ≥0∞} (hI : IsGoodRateFunction I)
    (h : LargeDeviationPrinciple μ a I) {φ : X → ℝ} (hφ : Continuous φ)
    (htail : Tendsto (fun M : ℝ ↦ limsup (fun n ↦ ((a n)⁻¹ : ℝ) *
      ENNReal.log (∫⁻ x in {x | M ≤ φ x}, ENNReal.ofReal (Real.exp (a n * φ x)) ∂μ n)) atTop)
      atTop (𝓝 ⊥)) :
    Tendsto (fun n ↦ ((a n)⁻¹ : ℝ) *
      ENNReal.log (∫⁻ x, ENNReal.ofReal (Real.exp (a n * φ x)) ∂μ n)) atTop
      (𝓝 (⨆ x, ((φ x : EReal) - I x))) := sorry

/-- **2.2** The moment condition implies the tail condition. -/
theorem tendsto_limsup_log_setLIntegral_exp_of_moment {μ : ℕ → Measure X} {a : ℕ → ℝ}
    (ha : Tendsto a atTop atTop) {φ : X → ℝ} {γ : ℝ} (hγ : 1 < γ)
    (hmom : limsup (fun n ↦ ((a n)⁻¹ : ℝ) *
      ENNReal.log (∫⁻ x, ENNReal.ofReal (Real.exp (a n * (γ * φ x))) ∂μ n)) atTop < ⊤) :
    Tendsto (fun M : ℝ ↦ limsup (fun n ↦ ((a n)⁻¹ : ℝ) *
      ENNReal.log (∫⁻ x in {x | M ≤ φ x}, ENNReal.ofReal (Real.exp (a n * φ x)) ∂μ n)) atTop)
      atTop (𝓝 ⊥) := sorry

/-- **2.3** On a pseudometric space, for a good rate function, the Laplace principle and the
large deviation principle are equivalent. -/
theorem laplacePrinciple_iff {Y : Type*} [PseudoMetricSpace Y] [MeasurableSpace Y]
    [OpensMeasurableSpace Y] {μ : ℕ → Measure Y} [∀ n, IsProbabilityMeasure (μ n)]
    {a : ℕ → ℝ} (ha : Tendsto a atTop atTop) {I : Y → ℝ≥0∞} (hI : IsGoodRateFunction I) :
    LaplacePrinciple μ a I ↔ LargeDeviationPrinciple μ a I := sorry

/-- **2.4** Exponential tilting by a bounded continuous function. -/
theorem LargeDeviationPrinciple.tilted [OpensMeasurableSpace X]
    {μ : ℕ → Measure X} [∀ n, IsProbabilityMeasure (μ n)] {a : ℕ → ℝ}
    (ha : Tendsto a atTop atTop) {I : X → ℝ≥0∞}
    (h : LargeDeviationPrinciple μ a I) (F : X →ᵇ ℝ) :
    LargeDeviationPrinciple (fun n ↦ (μ n).tilted (fun x ↦ a n * F x)) a
      (fun x ↦ ((I x : EReal) - F x + ⨆ y, ((F y : EReal) - I y)).toENNReal) := sorry

/-- **2.5** Bryc's inverse Varadhan lemma. -/
theorem largeDeviationPrinciple_of_tendsto_log_lintegral_exp [T35Space X]
    [OpensMeasurableSpace X] {μ : ℕ → Measure X} [∀ n, IsProbabilityMeasure (μ n)]
    {a : ℕ → ℝ} (ha : Tendsto a atTop atTop) (ht : IsExponentiallyTight μ a)
    (Λ : (X →ᵇ ℝ) → ℝ)
    (hΛ : ∀ f : X →ᵇ ℝ, Tendsto (fun n ↦ ((a n)⁻¹ : ℝ) *
      ENNReal.log (∫⁻ x, ENNReal.ofReal (Real.exp (a n * f x)) ∂μ n)) atTop (𝓝 (Λ f))) :
    IsGoodRateFunction (fun x ↦ ⨆ f : X →ᵇ ℝ, ENNReal.ofReal (f x - Λ f)) ∧
      LargeDeviationPrinciple μ a (fun x ↦ ⨆ f : X →ᵇ ℝ, ENNReal.ofReal (f x - Λ f)) ∧
      ∀ f : X →ᵇ ℝ, (Λ f : EReal) =
        ⨆ x, ((f x : EReal) - ((⨆ g : X →ᵇ ℝ, ENNReal.ofReal (g x - Λ g) : ℝ≥0∞) : EReal)) :=
  sorry

end Layer2

/-! ## Layer 3: transformations of principles -/

section Layer3

variable {X : Type*} [TopologicalSpace X] [MeasurableSpace X]

/-- **3.1** The image of a good rate function under a continuous map into a Hausdorff space is
a good rate function, and its infimum over every nonempty fibre is attained. -/
theorem IsGoodRateFunction.iInf_preimage {Y : Type*} [TopologicalSpace Y] [T2Space Y]
    {I : X → ℝ≥0∞} (hI : IsGoodRateFunction I) {f : X → Y} (hf : Continuous f) :
    IsGoodRateFunction (fun y ↦ ⨅ x ∈ f ⁻¹' {y}, I x) ∧
      ∀ x₀ : X, ∃ x, f x = f x₀ ∧ I x = ⨅ x' ∈ f ⁻¹' {f x₀}, I x' := sorry

/-- **3.1** The inverse contraction principle. -/
theorem IsExponentiallyTight.largeDeviationPrinciple_of_map [T2Space X]
    [OpensMeasurableSpace X] {Y : Type*} [TopologicalSpace Y] [T2Space Y] [MeasurableSpace Y]
    [BorelSpace Y] {μ : ℕ → Measure X} {a : ℕ → ℝ} (ha : Tendsto a atTop atTop)
    (ht : IsExponentiallyTight μ a) {f : X → Y} (hf : Continuous f)
    (hinj : Function.Injective f) {J : Y → ℝ≥0∞}
    (h : WeakLargeDeviationPrinciple (fun n ↦ (μ n).map f) a J) :
    IsGoodRateFunction (J ∘ f) ∧ LargeDeviationPrinciple μ a (J ∘ f) := sorry

/-- **3.2** Exponentially equivalent sequences satisfy the same principle with a good rate
function. -/
theorem ExponentiallyEquivalent.largeDeviationPrinciple_iff {Ω S : Type*} [MeasurableSpace Ω]
    [PseudoMetricSpace S] [TopologicalSpace.SeparableSpace S] [MeasurableSpace S]
    [BorelSpace S] {P : ℕ → Measure Ω} [∀ n, IsProbabilityMeasure (P n)] {a : ℕ → ℝ}
    (ha : Tendsto a atTop atTop) {Y Z : ℕ → Ω → S} (hY : ∀ n, Measurable (Y n))
    (hZ : ∀ n, Measurable (Z n)) (h : ExponentiallyEquivalent P a Y Z) {I : S → ℝ≥0∞}
    (hI : IsGoodRateFunction I) :
    LargeDeviationPrinciple (fun n ↦ (P n).map (Y n)) a I ↔
      LargeDeviationPrinciple (fun n ↦ (P n).map (Z n)) a I := sorry

/-- **3.3** The Dawson–Gärtner theorem for sequence spaces. -/
theorem largeDeviationPrinciple_pi {S : ℕ → Type*} [∀ i, TopologicalSpace (S i)]
    [∀ i, TopologicalSpace.MetrizableSpace (S i)] [∀ i, SecondCountableTopology (S i)]
    [∀ i, MeasurableSpace (S i)]
    [∀ i, BorelSpace (S i)] {μ : ℕ → Measure (∀ i, S i)} [∀ n, IsProbabilityMeasure (μ n)]
    {a : ℕ → ℝ} (ha : Tendsto a atTop atTop) (I : ∀ k, ((i : Fin k) → S i) → ℝ≥0∞)
    (hI : ∀ k, IsGoodRateFunction (I k))
    (h : ∀ k, LargeDeviationPrinciple
      (fun n ↦ (μ n).map (fun (x : ∀ i, S i) (i : Fin k) ↦ x i)) a (I k)) :
    IsGoodRateFunction (fun (x : ∀ i, S i) ↦ ⨆ k, I k (fun i ↦ x i)) ∧
      LargeDeviationPrinciple μ a (fun (x : ∀ i, S i) ↦ ⨆ k, I k (fun i ↦ x i)) := sorry

end Layer3

/-! ## Layer 4: Cramér's theorem -/

section Layer4

variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E] [MeasurableSpace E]

/-- The logarithmic moment generating function `t ↦ log ∫ exp ⟪t, x⟫ dν(x)` with values in
`EReal`: it is `⊤` where the exponential moment is infinite and never takes the junk value of
Mathlib's real `cgf`. -/
def logMGF (ν : Measure E) (t : E) : EReal :=
  ENNReal.log (∫⁻ x, ENNReal.ofReal (Real.exp ⟪t, x⟫_ℝ) ∂ν)

/-- The Legendre transform `x ↦ sup_t (⟪t, x⟫ - Λ t)` of `Λ : E → EReal`, Tau Ceti's
`fenchelConjugate` for the inner product pairing, truncated below at `0` into `ℝ≥0∞`. The
truncation is invisible when `Λ 0 = 0`, as for every logarithmic moment generating function of a
probability law. -/
def legendreRate (Λ : E → EReal) (x : E) : ℝ≥0∞ :=
  (TauCeti.fenchelConjugate (innerₗ E) Λ x).toENNReal

/-- The law of the sample mean of `n + 1` independent observations from `ν`. -/
def sampleMeanLaw (ν : Measure E) [IsProbabilityMeasure ν] (n : ℕ) : Measure E :=
  (Measure.pi fun _ : Fin (n + 1) ↦ ν).map fun x ↦ ((n + 1 : ℕ) : ℝ)⁻¹ • ∑ i, x i

/-- **4.1** The Cramér rate is a convex rate function, it is the Legendre transform of
`logMGF ν` without truncation, and `logMGF ν` is convex. -/
theorem lowerSemicontinuous_legendreRate_logMGF [OpensMeasurableSpace E] (ν : Measure E)
    [IsProbabilityMeasure ν] :
    LowerSemicontinuous (legendreRate (logMGF ν)) ∧
      Convex ℝ {p : E × ℝ | (legendreRate (logMGF ν) p.1 : EReal) ≤ p.2} ∧
      (∀ x, ((legendreRate (logMGF ν) x : ℝ≥0∞) : EReal) =
        TauCeti.fenchelConjugate (innerₗ E) (logMGF ν) x) ∧
      Convex ℝ {p : E × ℝ | logMGF ν p.1 ≤ p.2} := sorry

/-- **4.1** The Cramér rate vanishes at the mean. -/
theorem legendreRate_logMGF_integral [OpensMeasurableSpace E] [CompleteSpace E] (ν : Measure E)
    [IsProbabilityMeasure ν] (hν : Integrable id ν) :
    legendreRate (logMGF ν) (∫ x, x ∂ν) = 0 := sorry

/-- **4.1** The Cramér rate is good when the exponential moments are finite near `0`. -/
theorem isGoodRateFunction_legendreRate_logMGF [OpensMeasurableSpace E] [FiniteDimensional ℝ E]
    (ν : Measure E) [IsProbabilityMeasure ν] (h0 : (0 : E) ∈ interior {t | logMGF ν t < ⊤}) :
    IsGoodRateFunction (legendreRate (logMGF ν)) := sorry

/-- **4.2** The Chernoff bound for upper tails of real sample means. -/
theorem log_sampleMeanLaw_Ici_le (ν : Measure ℝ) [IsProbabilityMeasure ν] (hν : Integrable id ν)
    {x : ℝ} (hx : ∫ y, y ∂ν ≤ x) (n : ℕ) :
    ((((n + 1 : ℕ) : ℝ)⁻¹ : ℝ) : EReal) * ENNReal.log (sampleMeanLaw ν n (Ici x)) ≤
      -(legendreRate (logMGF ν) x : EReal) := sorry

/-- **4.2** The Cramér–Chernoff limit for upper tails. -/
theorem tendsto_log_sampleMeanLaw_Ici (ν : Measure ℝ) [IsProbabilityMeasure ν]
    (hν : Integrable id ν) {x : ℝ} (hx : ∫ y, y ∂ν ≤ x) :
    Tendsto (fun n ↦ ((((n + 1 : ℕ) : ℝ)⁻¹ : ℝ) : EReal) *
      ENNReal.log (sampleMeanLaw ν n (Ici x))) atTop
      (𝓝 (-(legendreRate (logMGF ν) x : EReal))) := sorry

/-- **4.3** Cramér's theorem on the real line, without moment assumptions. -/
theorem largeDeviationPrinciple_sampleMeanLaw_real (ν : Measure ℝ) [IsProbabilityMeasure ν] :
    LargeDeviationPrinciple (sampleMeanLaw ν) (fun n ↦ ((n + 1 : ℕ) : ℝ))
      (legendreRate (logMGF ν)) := sorry

/-- **4.4** Cramér's theorem in a finite-dimensional real inner product space, for laws with
all exponential moments finite. -/
theorem largeDeviationPrinciple_sampleMeanLaw [FiniteDimensional ℝ E] [BorelSpace E]
    (ν : Measure E) [IsProbabilityMeasure ν] (hfin : ∀ t, logMGF ν t < ⊤) :
    IsGoodRateFunction (legendreRate (logMGF ν)) ∧
      LargeDeviationPrinciple (sampleMeanLaw ν) (fun n ↦ ((n + 1 : ℕ) : ℝ))
        (legendreRate (logMGF ν)) := sorry

end Layer4

/-! ## Layer 5: the Gärtner–Ellis theorem -/

section Layer5

variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E] [MeasurableSpace E]

/-- `y` is an exposed point of `I` with exposing hyperplane `η`: the function
`x ↦ ⟪η, x⟫ - I x` has `y` as its strict maximizer (Dembo–Zeitouni, Definition 2.3.3). -/
def IsExposedPoint (I : E → ℝ≥0∞) (y η : E) : Prop :=
  ∀ x, x ≠ y → ((⟪η, x⟫_ℝ : ℝ) : EReal) - I x < ((⟪η, y⟫_ℝ : ℝ) : EReal) - I y

/-- `Λ : E → EReal` is essentially smooth in the steep form of Dembo–Zeitouni: the interior of
its effective domain is nonempty, `Λ` is differentiable there, and it is steep, the gradient
norm tending to infinity at every boundary point of that interior (Dembo–Zeitouni,
Definition 2.3.5). Essential smoothness in the sense of convex analysis (subdifferential empty
off the interior of the domain) is owned by the convex-analysis roadmap; the two agree for
proper closed convex `Λ`. -/
def IsEssentiallySmoothSteep [CompleteSpace E] (Λ : E → EReal) : Prop :=
  (interior {t | Λ t < ⊤}).Nonempty ∧
    (∀ t ∈ interior {t | Λ t < ⊤}, DifferentiableAt ℝ (fun s ↦ (Λ s).toReal) t) ∧
    ∀ t₀ ∈ frontier (interior {t | Λ t < ⊤}),
      Tendsto (fun s ↦ ‖gradient (fun u ↦ (Λ u).toReal) s‖)
        (𝓝[interior {t | Λ t < ⊤}] t₀) atTop

variable [FiniteDimensional ℝ E] [BorelSpace E]

/-- **5.1** The Gärtner–Ellis upper bound, with the properties of the limit. -/
theorem gartnerEllis_upperBound {μ : ℕ → Measure E} [∀ n, IsProbabilityMeasure (μ n)]
    {a : ℕ → ℝ} (ha : Tendsto a atTop atTop) {Λ : E → EReal}
    (hΛ : ∀ t, Tendsto (fun n ↦ ((a n)⁻¹ : ℝ) *
      ENNReal.log (∫⁻ x, ENNReal.ofReal (Real.exp (a n * ⟪t, x⟫_ℝ)) ∂μ n)) atTop (𝓝 (Λ t)))
    (h0 : (0 : E) ∈ interior {t | Λ t < ⊤}) :
    Convex ℝ {p : E × ℝ | Λ p.1 ≤ p.2} ∧ (∀ t, ⊥ < Λ t) ∧
      IsGoodRateFunction (legendreRate Λ) ∧
      ∀ F : Set E, IsClosed F →
        limsup (fun n ↦ ((a n)⁻¹ : ℝ) * ENNReal.log (μ n F)) atTop ≤
          -(⨅ x ∈ F, (legendreRate Λ x : EReal)) := sorry

/-- **5.2** The Gärtner–Ellis lower bound over exposed points. -/
theorem gartnerEllis_lowerBound {μ : ℕ → Measure E} [∀ n, IsProbabilityMeasure (μ n)]
    {a : ℕ → ℝ} (ha : Tendsto a atTop atTop) {Λ : E → EReal}
    (hΛ : ∀ t, Tendsto (fun n ↦ ((a n)⁻¹ : ℝ) *
      ENNReal.log (∫⁻ x, ENNReal.ofReal (Real.exp (a n * ⟪t, x⟫_ℝ)) ∂μ n)) atTop (𝓝 (Λ t)))
    (h0 : (0 : E) ∈ interior {t | Λ t < ⊤}) (G : Set E) (hG : IsOpen G) :
    -(⨅ x ∈ G ∩ {y | ∃ η ∈ interior {t | Λ t < ⊤}, IsExposedPoint (legendreRate Λ) y η},
        (legendreRate Λ x : EReal)) ≤
      liminf (fun n ↦ ((a n)⁻¹ : ℝ) * ENNReal.log (μ n G)) atTop := sorry

/-- **5.3** Rockafellar's lemma: for an essentially smooth, lower semicontinuous, convex `Λ`
with `Λ 0 = 0`, every point of the relative interior of the domain of its Legendre transform is
exposed, with exposing hyperplane in the interior of the domain of `Λ`. -/
theorem exists_isExposedPoint_of_mem_intrinsicInterior {Λ : E → EReal} (hΛ0 : Λ 0 = 0)
    (hbot : ∀ t, ⊥ < Λ t) (hconv : Convex ℝ {p : E × ℝ | Λ p.1 ≤ p.2})
    (hlsc : LowerSemicontinuous Λ) (hsmooth : IsEssentiallySmoothSteep Λ) {x : E}
    (hx : x ∈ intrinsicInterior ℝ {y | legendreRate Λ y < ⊤}) :
    ∃ η ∈ interior {t | Λ t < ⊤}, IsExposedPoint (legendreRate Λ) x η := sorry

/-- **5.3** The Gärtner–Ellis theorem. -/
theorem gartnerEllis {μ : ℕ → Measure E} [∀ n, IsProbabilityMeasure (μ n)] {a : ℕ → ℝ}
    (ha : Tendsto a atTop atTop) {Λ : E → EReal}
    (hΛ : ∀ t, Tendsto (fun n ↦ ((a n)⁻¹ : ℝ) *
      ENNReal.log (∫⁻ x, ENNReal.ofReal (Real.exp (a n * ⟪t, x⟫_ℝ)) ∂μ n)) atTop (𝓝 (Λ t)))
    (h0 : (0 : E) ∈ interior {t | Λ t < ⊤}) (hsmooth : IsEssentiallySmoothSteep Λ)
    (hlsc : LowerSemicontinuous Λ) :
    IsGoodRateFunction (legendreRate Λ) ∧ LargeDeviationPrinciple μ a (legendreRate Λ) :=
  sorry

end Layer5

/-! ## Layer 6: Sanov's theorem -/

section Layer6

/-- The law of the empirical measure of `n + 1` independent observations from `μ`, a measure on
the space of probability measures with its Giry σ-algebra. -/
def empiricalLaw {E : Type*} [MeasurableSpace E] (μ : Measure E) [IsProbabilityMeasure μ]
    (n : ℕ) : Measure (ProbabilityMeasure E) :=
  (Measure.pi fun _ : Fin (n + 1) ↦ μ).map
    fun x ↦ TauCeti.Probability.empiricalMeasureOfFintype x

/-- **6.1** The method of types: the probability that the empirical measure of `n + 1`
observations equals a given type `ν`, against `exp (-(n + 1) H(ν | μ))`. -/
theorem log_measure_empiricalMeasure_eq {α : Type*} [Fintype α] [MeasurableSpace α]
    [MeasurableSingletonClass α] (μ : Measure α) [IsProbabilityMeasure μ] (n : ℕ)
    (y : Fin (n + 1) → α) :
    ENNReal.log (Measure.pi (fun _ : Fin (n + 1) ↦ μ)
        {x | TauCeti.Probability.empiricalMeasureOfFintype x =
          TauCeti.Probability.empiricalMeasureOfFintype y}) ≤
      -(((n + 1 : ℕ) : ℝ) : EReal) *
        (klDiv (TauCeti.Probability.empiricalMeasureOfFintype y : Measure α) μ : EReal) ∧
    -(((n + 1 : ℕ) : ℝ) : EReal) *
        (klDiv (TauCeti.Probability.empiricalMeasureOfFintype y : Measure α) μ : EReal) -
        (((Fintype.card α : ℝ) * Real.log (n + 2) : ℝ) : EReal) ≤
      ENNReal.log (Measure.pi (fun _ : Fin (n + 1) ↦ μ)
        {x | TauCeti.Probability.empiricalMeasureOfFintype x =
          TauCeti.Probability.empiricalMeasureOfFintype y}) := sorry

/-- **6.1** Sanov's theorem for a finite alphabet, with the upper bound for every set. -/
theorem sanov_fintype {α : Type*} [Fintype α] [TopologicalSpace α] [DiscreteTopology α]
    [MeasurableSpace α] [BorelSpace α] (μ : Measure α) [IsProbabilityMeasure μ] :
    IsGoodRateFunction (fun ν : ProbabilityMeasure α ↦ klDiv (ν : Measure α) μ) ∧
      LargeDeviationPrinciple (empiricalLaw μ) (fun n ↦ ((n + 1 : ℕ) : ℝ))
        (fun ν ↦ klDiv (ν : Measure α) μ) ∧
      ∀ Γ : Set (ProbabilityMeasure α),
        limsup (fun n ↦ ((((n + 1 : ℕ) : ℝ)⁻¹ : ℝ) : EReal) * ENNReal.log (empiricalLaw μ n Γ))
          atTop ≤ -(⨅ ν ∈ Γ, (klDiv (ν : Measure α) μ : EReal)) := sorry

variable {E : Type*} [TopologicalSpace E] [PolishSpace E] [MeasurableSpace E] [BorelSpace E]

/-- **6.2** The laws of empirical measures are exponentially tight. -/
theorem isExponentiallyTight_empiricalLaw (μ : Measure E) [IsProbabilityMeasure μ] :
    IsExponentiallyTight (empiricalLaw μ) (fun n ↦ ((n + 1 : ℕ) : ℝ)) := sorry

/-- **6.3** Sanov's theorem on a Polish space. -/
theorem sanov (μ : Measure E) [IsProbabilityMeasure μ] :
    IsGoodRateFunction (fun ν : ProbabilityMeasure E ↦ klDiv (ν : Measure E) μ) ∧
      LargeDeviationPrinciple (empiricalLaw μ) (fun n ↦ ((n + 1 : ℕ) : ℝ))
        (fun ν ↦ klDiv (ν : Measure E) μ) := sorry

end Layer6

/-! ## Suppliers named in the README -/

#check @InformationTheory.klDiv
#check @InformationTheory.klDiv_eq_zero_iff
#check @InformationTheory.klDiv_of_not_ac
#check @TauCeti.fenchelConjugate
#check @TauCeti.sub_le_fenchelConjugate
#check @TauCeti.lowerSemicontinuous_fenchelConjugate_innerₗ
#check @TauCeti.convex_epigraph_fenchelConjugate
#check @TauCeti.fenchelConjugate_innerₗ_fenchelConjugate_innerₗ
#check @TauCeti.klDiv_eq_iSup_integral_sub_log_integral_exp
#check @TauCeti.klDiv_eq_iSup_boundedContinuousFunction_integral_sub_log_integral_exp
#check @TauCeti.lowerSemicontinuous_klDiv_probabilityMeasure
#check @TauCeti.isTightMeasureSet_setOf_klDiv_le
#check @TauCeti.Probability.empiricalMeasureOfFintype
#check @TauCeti.Probability.continuous_empiricalMeasureOfFintype
#check @TauCeti.Probability.measurable_empiricalMeasureOfFintype
#check @TauCeti.Probability.integral_empiricalMeasureOfFintype
#check @TauCeti.MeasureTheory.ProbabilityMeasure.borelSpace
#check @MeasureTheory.ProbabilityMeasure.instSecondCountableTopology
#check @HasOuterApproxClosed
#check @ENNReal.log
#check @EReal.toENNReal
#check @LowerSemicontinuous
#check @LowerSemicontinuousOn.exists_isMinOn
#check @MeasureTheory.Measure.tilted
#check @MeasureTheory.Measure.pi
#check @MeasureTheory.Measure.infinitePi
#check @MeasureTheory.ProbabilityMeasure
#check @MeasureTheory.ProbabilityMeasure.tendsto_iff_forall_integral_tendsto
#check @isCompact_closure_of_isTightMeasureSet
#check @MeasureTheory.isTightMeasureSet_singleton
#check @MeasureTheory.Measure.WeaklyRegular.of_pseudoMetrizableSpace_of_isFiniteMeasure
#check @ProbabilityTheory.mgf
#check @ProbabilityTheory.cgf
#check @ProbabilityTheory.integrableExpSet
#check @ProbabilityTheory.measure_ge_le_exp_mul_mgf
#check @ProbabilityTheory.iIndepFun.mgf_sum
#check @ProbabilityTheory.deriv_cgf
#check @ProbabilityTheory.strong_law_ae
#check @intrinsicInterior
#check @gradient
#check @innerₗ
#check @T35Space
#check @PolishSpace
#check @IsCompact.exists_isMinOn

end TauCetiRoadmap.LargeDeviations
