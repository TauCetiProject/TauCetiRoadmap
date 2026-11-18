module

public import Mathlib
public import TauCeti.Probability.Process.EmpiricalMeasure
public import TauCeti.MeasureTheory.Measure.ProductKernel
public import TauCeti.Probability.Distributions.ChiSquared.Basic
public import TauCeti.Probability.PopulationSampling.Finite
public import TauCeti.Analysis.Bochner.CharFun.Inversion
public import TauCeti.MeasureTheory.OptimalTransport.Wasserstein.BoundedLipschitz
public import TauCeti.Probability.Moments.Tilted
public import TauCeti.Probability.Cdf
public import TauCeti.Probability.Quantile

/-!
# Higher-order asymptotics and resampling: target signatures

This file is not the roadmap: the roadmap is `README.md`, and this file is not an exhaustive
checklist. It states, against the pinned Mathlib and Tau Ceti and each with `sorry`, the
headlines of the README that carry a Lean name, each with every conclusion the README attaches
to it, together with the definitions their statements need. Every headline whose carriers exist
at the pins is stated. The bullets of the README without a Lean name are definitions given in
prose, results supplied by Tau Ceti (the bounded Lipschitz metrization of weak convergence in
1.2) or by `MathematicalStatisticsFoundations` and `MathematicalStatisticsAsymptotic`, or facts
about a single definition that follow in one step from it; these are API lemmas, not headlines.

The conventions of the README are used throughout. Distribution functions are Mathlib's
right-continuous `cdf`; the characteristic function is Mathlib's `charFun`, with kernel
`exp (i ⟪x, t⟫)`; a sample of size `n` from a sequence `X : ℕ → Ω → E` is
`fun i : Fin n ↦ X i ω`. The bootstrap law of a statistic is the image of the resampling kernel
`bootstrapKernel`, a Markov kernel from the sample space, so conditional statements are statements
about random laws `ω ↦ bootstrapLaw … (sample n ω)`. Probabilities of sets that need not be
measurable are Mathlib's outer measure, so "in outer probability" and "outer almost surely" need
no measurability hypothesis.

Definitions owned by `MathematicalStatisticsFoundations` or by `MathematicalStatisticsAsymptotic`
appear here as local copies, each with a docstring naming its owner. The implementation namespace
of the README is `TauCeti`; the prototypes live in this roadmap's namespace.
-/

@[expose] public section

noncomputable section

open MeasureTheory ProbabilityTheory Filter Set Topology
open scoped ENNReal NNReal

namespace TauCetiRoadmap.MathematicalStatisticsHigherOrderAndResampling

attribute [local instance] Classical.propDecidable

/-! ## Local copies of vocabulary owned elsewhere -/

section LocalCopies

variable {Ω E : Type*} [MeasurableSpace Ω]

/-- Local copy of `MathematicalStatisticsFoundations` 8.5: an i.i.d. family with law `P`. -/
def IsIndependentIdenticallyDistributed {ι : Type*} [MeasurableSpace E] (μ : Measure Ω)
    (X : ι → Ω → E) (P : Measure E) : Prop :=
  (∀ i, Measurable (X i)) ∧ iIndepFun X μ ∧ ∀ i, μ.map (X i) = P

/-- Local copy of `MathematicalStatisticsFoundations` 8.2: boundedness in probability. -/
def IsBoundedInProbability [SeminormedAddCommGroup E] (μ : Measure Ω) (X : ℕ → Ω → E) : Prop :=
  ∀ ε > 0, ∃ C > 0, ∀ᶠ n in atTop, μ.real {ω | C < ‖X n ω‖} ≤ ε

/-- The sample of size `n` from a sequence: its first `n` observations. -/
def sample (X : ℕ → Ω → E) (n : ℕ) (ω : Ω) : Fin n → E := fun i ↦ X i ω

/-- Local copy of `MathematicalStatisticsFoundations` 9.1: the sample mean, `0` for `n = 0`. -/
def sampleMean [AddCommGroup E] [Module ℝ E] {n : ℕ} (x : Fin n → E) : E :=
  (n : ℝ)⁻¹ • ∑ i, x i

/-- Local copy of `MathematicalStatisticsFoundations` 9.1: the empirical distribution function
of a finite sample, `#{i | x i ≤ t} / n`. -/
def empiricalCdf {n : ℕ} (x : Fin n → ℝ) (t : ℝ) : ℝ :=
  ((Finset.univ.filter fun i ↦ x i ≤ t).card : ℝ) / n

/-- Local copy of `MathematicalStatisticsAsymptotic` 2.3: the space `ℓ^∞(T)` of bounded real
functions with the supremum norm. -/
abbrev Linfty (T : Type*) := lp (fun _ : T ↦ ℝ) ∞

/-- Local copy of `MathematicalStatisticsAsymptotic` 2.3: `ℓ^∞(T)` carries its Borel σ-algebra. -/
instance (T : Type*) : MeasurableSpace (Linfty T) := borel _

instance (T : Type*) : BorelSpace (Linfty T) := ⟨rfl⟩

/-- Local copy of `MathematicalStatisticsAsymptotic` 2.3: a function `T → ℝ` as an element of
`ℓ^∞(T)`, itself when bounded and `0` otherwise. -/
def liftLinfty {T : Type*} (g : T → ℝ) : Linfty T :=
  if h : Memℓp g ∞ then ⟨g, h⟩ else 0

/-- Local copy of `MathematicalStatisticsAsymptotic` 2.3: the marginal of an element of `ℓ^∞(T)` at
finitely many points. -/
def marginal {T : Type*} {m : ℕ} (t : Fin m → T) (z : Linfty T) : EuclideanSpace ℝ (Fin m) :=
  WithLp.toLp 2 fun j ↦ (z : T → ℝ) (t j)

/-- Local copy of `MathematicalStatisticsAsymptotic` 2.4: the `P`-Brownian bridge law on `ℓ^∞(T)` of
an indexed class `f`, a tight Borel law with centred Gaussian marginals of covariance
`P (f s f t) - P f s P f t`. -/
def IsBrownianBridgeLaw {X T : Type*} [MeasurableSpace X] (P : Measure X) (f : T → X → ℝ)
    (L : Measure (Linfty T)) : Prop :=
  IsProbabilityMeasure L ∧ IsTightMeasureSet {L} ∧
    ∀ (m : ℕ) (t : Fin m → T), L.map (marginal t) = multivariateGaussian 0
      (Matrix.of fun a b ↦ ∫ x, f (t a) x * f (t b) x ∂P - (∫ x, f (t a) x ∂P) * ∫ x, f (t b) x ∂P)

/-- Local copy of `MathematicalStatisticsAsymptotic` 2.1: the outer integral, the infimum of the
integrals of the integrable measurable majorants. Without such a majorant, or with an unbounded
infimum, the real `⨅` is the junk value `0`; this roadmap applies it only to bounded functions
under finite measures, where neither happens. -/
def outerIntegral {Ω₀ : Type*} [MeasurableSpace Ω₀] (μ : Measure Ω₀) (f : Ω₀ → ℝ) : ℝ :=
  ⨅ g : {g : Ω₀ → ℝ // Measurable g ∧ Integrable g μ ∧ f ≤ g}, ∫ ω, (g : Ω₀ → ℝ) ω ∂μ

/-- Local copy of `MathematicalStatisticsAsymptotic` 2.1: the inner integral
`-outerIntegral μ (-f)`. -/
def innerIntegral {Ω₀ : Type*} [MeasurableSpace Ω₀] (μ : Measure Ω₀) (f : Ω₀ → ℝ) : ℝ :=
  -outerIntegral μ (-f)

/-- Local copy of `MathematicalStatisticsAsymptotic` 2.2: weak convergence in the sense of
Hoffmann-Jørgensen of maps that need not be measurable to a Borel law `L`. -/
def TendstoInOuterDistribution {ι : Type*} {Ωi : ι → Type*} [∀ i, MeasurableSpace (Ωi i)]
    {D : Type*} [TopologicalSpace D] [MeasurableSpace D] (Z : ∀ i, Ωi i → D) (l : Filter ι)
    (L : Measure D) (μ : ∀ i, Measure (Ωi i)) : Prop :=
  ∀ f : BoundedContinuousFunction D ℝ,
    Tendsto (fun i ↦ outerIntegral (μ i) (fun ω ↦ f (Z i ω))) l (𝓝 (∫ x, f x ∂L))

/-- Local copy of `MathematicalStatisticsAsymptotic` 4.1: Hadamard differentiability of `φ` at `θ`
within `dom`, tangentially to `D₀`, with derivative `φ'`. -/
def HasHadamardDerivWithinAt {D F : Type*} [NormedAddCommGroup D] [NormedSpace ℝ D]
    [NormedAddCommGroup F] [NormedSpace ℝ F] (φ : D → F) (dom D₀ : Set D) (φ' : D →L[ℝ] F)
    (θ : D) : Prop :=
  θ ∈ dom ∧ ∀ (t : ℕ → ℝ) (h : ℕ → D) (v : D), (∀ n, 0 < t n) → Tendsto t atTop (𝓝 0) →
    Tendsto h atTop (𝓝 v) → v ∈ D₀ → (∀ n, θ + t n • h n ∈ dom) →
    Tendsto (fun n ↦ (t n)⁻¹ • (φ (θ + t n • h n) - φ θ)) atTop (𝓝 (φ' v))

/-- Local copy of `MathematicalStatisticsFoundations` 8.1: the chi-squared law of a natural
number of degrees of freedom is a probability measure. -/
instance isProbabilityMeasure_chiSquaredMeasure_nat (k : ℕ) :
    IsProbabilityMeasure (TauCeti.Probability.chiSquaredMeasure k) :=
  TauCeti.Probability.isProbabilityMeasure_chiSquaredMeasure (Nat.cast_nonneg _)

end LocalCopies

/-! ## Layer 1: distances and conditional laws -/

section Layer1

variable {Ω Y : Type*} [MeasurableSpace Ω]

/-- **1.1** The Kolmogorov distance `sup_t |cdf P t - cdf Q t|` between laws on `ℝ`. -/
def kolmogorovDist (P Q : Measure ℝ) : ℝ := ⨆ t, |cdf P t - cdf Q t|

/-- **1.1** Pólya's theorem: weak convergence to a law with continuous distribution function is
uniform convergence of the distribution functions. -/
theorem tendsto_kolmogorovDist_iff_tendsto {ι : Type*} {l : Filter ι} [l.IsCountablyGenerated]
    (P : ι → ProbabilityMeasure ℝ) (Q : ProbabilityMeasure ℝ)
    (hQ : Continuous (cdf (Q : Measure ℝ))) :
    Tendsto (fun i ↦ kolmogorovDist (P i) Q) l (𝓝 0) ↔ Tendsto P l (𝓝 Q) := sorry

/-- **1.2** The bounded Lipschitz distance: the supremum over `1`-Lipschitz test functions bounded
by `1`, in the form of Tau Ceti's bounded-Lipschitz characterization with `R = 1`. -/
def boundedLipschitzDist [PseudoMetricSpace Y] [MeasurableSpace Y] (P Q : Measure Y) : ℝ≥0∞ :=
  ⨆ (f : Y → ℝ) (_ : LipschitzWith 1 f) (_ : ∀ y, ‖f y‖ ≤ 1),
    ENNReal.ofReal |∫ y, f y ∂P - ∫ y, f y ∂Q|

/-- **1.3** Random laws `L n ω` converge to `ν` in law, in outer probability. -/
def TendstoInLawInProbability [PseudoMetricSpace Y] [MeasurableSpace Y] (μ : Measure Ω)
    (L : ℕ → Ω → Measure Y) (ν : Measure Y) : Prop :=
  ∀ ε : ℝ≥0∞, 0 < ε → Tendsto (fun n ↦ μ {ω | ε < boundedLipschitzDist (L n ω) ν}) atTop (𝓝 0)

/-- **1.3** Random laws `L n ω` converge to `ν` in law, outer almost surely. -/
def TendstoInLawAlmostSurely [PseudoMetricSpace Y] [MeasurableSpace Y] (μ : Measure Ω)
    (L : ℕ → Ω → Measure Y) (ν : Measure Y) : Prop :=
  ∀ᵐ ω ∂μ, Tendsto (fun n ↦ boundedLipschitzDist (L n ω) ν) atTop (𝓝 0)

/-- **1.3** For real random laws and a limit with continuous distribution function, conditional
convergence in law in outer probability is convergence of the Kolmogorov distance to `0` in outer
probability, and conditional convergence in law outer almost surely is convergence of the
Kolmogorov distance to `0` outer almost surely. -/
theorem tendstoInLawInProbability_iff_kolmogorovDist (μ : Measure Ω) [IsProbabilityMeasure μ]
    (L : ℕ → Ω → Measure ℝ) (hL : ∀ n ω, IsProbabilityMeasure (L n ω)) (ν : Measure ℝ)
    [IsProbabilityMeasure ν] (hν : Continuous (cdf ν)) :
    (TendstoInLawInProbability μ L ν ↔
      ∀ ε > 0, Tendsto (fun n ↦ μ {ω | ε < kolmogorovDist (L n ω) ν}) atTop (𝓝 0)) ∧
    (TendstoInLawAlmostSurely μ L ν ↔
      ∀ᵐ ω ∂μ, Tendsto (fun n ↦ kolmogorovDist (L n ω) ν) atTop (𝓝 0)) := sorry

end Layer1

/-! ## Layer 2: smoothing and the Berry–Esseen theorem -/

section Layer2

variable {Ω : Type*} [MeasurableSpace Ω]

/-- **2.1** The Fourier–Stieltjes transform `∫ exp (i t x) g x dx` of a real density, with the
kernel of Mathlib's `charFun`. -/
def fourierStieltjes (g : ℝ → ℝ) (t : ℝ) : ℂ :=
  ∫ x : ℝ, Complex.exp (t * x * Complex.I) * g x

/-- **2.1** The Pólya density `(1 - cos (L x)) / (π L x²)`, `L > 0`, is a probability density
with characteristic function `(1 - |t|/L)⁺`, and its mass outside `[-a, a]` is at most
`4 / (π L a)`. Lean's `x / 0 = 0` changes the density only at `x = 0`, a null set. -/
theorem polya_density_charFun_tail (L : ℝ) (hL : 0 < L) :
    let h : ℝ → ℝ := fun x ↦ (1 - Real.cos (L * x)) / (Real.pi * L * x ^ 2)
    IsProbabilityMeasure (volume.withDensity fun x ↦ ENNReal.ofReal (h x)) ∧
      (∀ t : ℝ, charFun (volume.withDensity fun x ↦ ENNReal.ofReal (h x)) t =
        ((max 0 (1 - |t| / L) : ℝ) : ℂ)) ∧
      ∀ a > 0, ∫ x in {x : ℝ | a < |x|}, h x ≤ 4 / (Real.pi * L * a) := sorry

/-- **2.2** Esseen's smoothing inequality for a law with a first moment and a signed density with
a first moment, total mass `1` and magnitude at most `m`. -/
theorem abs_cdf_sub_integral_le_smoothing (P : Measure ℝ) [IsProbabilityMeasure P]
    (hP : Integrable id P) (g : ℝ → ℝ) (hg : Integrable g) (hg1 : ∫ x, g x = 1)
    (hgx : Integrable fun x ↦ x * g x) (m : ℝ) (hm : ∀ x, |g x| ≤ m) (T : ℝ) (hT : 0 < T)
    (x : ℝ) :
    |cdf P x - ∫ y in Iic x, g y| ≤
      Real.pi⁻¹ * (∫ t in -T..T, ‖charFun P t - fourierStieltjes g t‖ / |t|) +
        24 * m / (Real.pi * T) := sorry

/-- **2.3** The Berry–Esseen theorem for independent, not necessarily identically distributed,
summands, with the constant `2.75`. -/
theorem abs_cdf_sum_sub_cdf_gaussian_le (μ : Measure Ω) [IsProbabilityMeasure μ] {n : ℕ}
    (X : Fin n → Ω → ℝ) (hX : ∀ i, Measurable (X i)) (hind : iIndepFun X μ)
    (h3 : ∀ i, MemLp (X i) 3 μ) (h0 : ∀ i, ∫ ω, X i ω ∂μ = 0)
    (hB : 0 < ∑ i, ∫ ω, X i ω ^ 2 ∂μ) (x : ℝ) :
    let B := ∑ i, ∫ ω, X i ω ^ 2 ∂μ
    |μ.real {ω | (∑ i, X i ω) / Real.sqrt B ≤ x} - cdf (gaussianReal 0 1) x| ≤
      2.75 * (∑ i, ∫ ω, |X i ω| ^ 3 ∂μ) / B ^ ((3 : ℝ) / 2) := sorry

/-- **2.3** The Berry–Esseen theorem for an i.i.d. sequence: the case of equal summands, with the
standardized sum of the first `n ≥ 1` observations. At `n = 0` the right side is the junk value
`ρ / 0 = 0`, so `0 < n` is needed. -/
theorem abs_cdf_iid_sum_sub_cdf_gaussian_le (μ : Measure Ω) [IsProbabilityMeasure μ]
    (X : ℕ → Ω → ℝ) (P : Measure ℝ) [IsProbabilityMeasure P]
    (hX : IsIndependentIdenticallyDistributed μ X P) (h3 : MemLp id 3 P) (h0 : ∫ y, y ∂P = 0)
    (hσ : 0 < ∫ y, y ^ 2 ∂P) {n : ℕ} (hn : 0 < n) (x : ℝ) :
    let σ := Real.sqrt (∫ y, y ^ 2 ∂P)
    |μ.real {ω | (∑ i ∈ Finset.range n, X i ω) / (σ * Real.sqrt n) ≤ x} -
        cdf (gaussianReal 0 1) x| ≤
      2.75 * (∫ y, |y| ^ 3 ∂P) / (σ ^ 3 * Real.sqrt n) := sorry

/-- **2.3** Sharpness of the rate `n^{-1/2}`: for Rademacher summands the Kolmogorov distance of
the law of `S₂ₖ / √(2k)` to `N(0, 1)` is at least half the atom `P(S₂ₖ = 0)`, and `√(2k)` times it
is eventually at least `1/√(2π) - ε`, for every `ε > 0`. -/
theorem kolmogorovDist_rademacher_sum_ge (μ : Measure Ω) [IsProbabilityMeasure μ]
    (X : ℕ → Ω → ℝ)
    (hX : IsIndependentIdenticallyDistributed μ X
      ((2 : ℝ≥0∞)⁻¹ • (Measure.dirac (-1) + Measure.dirac 1))) :
    let S : ℕ → Ω → ℝ := fun n ω ↦ (∑ i ∈ Finset.range n, X i ω) / Real.sqrt n
    (∀ k : ℕ, μ.real {ω | ∑ i ∈ Finset.range (2 * k), X i ω = 0} / 2 ≤
        kolmogorovDist (μ.map (S (2 * k))) (gaussianReal 0 1)) ∧
      ∀ ε > 0, ∀ᶠ k : ℕ in atTop, (Real.sqrt (2 * Real.pi))⁻¹ - ε ≤
        Real.sqrt (2 * k) * kolmogorovDist (μ.map (S (2 * k))) (gaussianReal 0 1) := sorry

end Layer2

/-! ## Layer 3: lattice laws and Cramér's condition -/

section Layer3

/-- **3.1** A law on `ℝ` is lattice when it is carried by `a + h ℤ` for some `a` and `h > 0`. -/
def IsLatticeLaw (P : Measure ℝ) : Prop :=
  ∃ a : ℝ, ∃ h > 0, P (range fun k : ℤ ↦ a + h * k)ᶜ = 0

/-- **3.1** A law on `ℝ` is lattice iff its characteristic function has modulus `1` at some
nonzero frequency. -/
theorem isLatticeLaw_iff_exists_norm_charFun_eq_one (P : Measure ℝ) [IsProbabilityMeasure P] :
    IsLatticeLaw P ↔ ∃ t ≠ 0, ‖charFun P t‖ = 1 := sorry

/-- **3.1** The nonlattice bound: off a neighbourhood of `0` and on a bounded set, the
characteristic function of a nonlattice law is bounded away from `1`. -/
theorem exists_lt_one_norm_charFun_le_of_not_isLatticeLaw (P : Measure ℝ)
    [IsProbabilityMeasure P] (hP : ¬ IsLatticeLaw P) {δ : ℝ} (hδ : 0 < δ) (T : ℝ) :
    ∃ c < 1, ∀ t : ℝ, δ ≤ |t| → |t| ≤ T → ‖charFun P t‖ ≤ c := sorry

/-- **3.2** Cramér's condition `limsup_{‖t‖ → ∞} |charFun P t| < 1`. -/
def SatisfiesCramerCondition {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
    [MeasurableSpace E] (P : Measure E) : Prop :=
  ∃ c < 1, ∃ R : ℝ, ∀ t : E, R ≤ ‖t‖ → ‖charFun P t‖ ≤ c

/-- **3.2** A law with a nonzero absolutely continuous component satisfies Cramér's condition. -/
theorem satisfiesCramerCondition_of_withDensity_le {E : Type*} [NormedAddCommGroup E]
    [InnerProductSpace ℝ E] [FiniteDimensional ℝ E] [MeasurableSpace E] [BorelSpace E]
    (P : Measure E) [IsProbabilityMeasure P] (f : E → ℝ≥0∞) (hf : volume.withDensity f ≤ P)
    (hpos : volume.withDensity f ≠ 0) :
    SatisfiesCramerCondition P := sorry

/-- **3.2** The moment curve `(W, W², …, W^d)` of a real variable whose law has a nonzero
absolutely continuous component satisfies Cramér's condition. -/
theorem satisfiesCramerCondition_map_powers (P : Measure ℝ) [IsProbabilityMeasure P]
    (f : ℝ → ℝ≥0∞) (hf : volume.withDensity f ≤ P) (hpos : volume.withDensity f ≠ 0) (d : ℕ) :
    SatisfiesCramerCondition
      (P.map fun w ↦ (WithLp.toLp 2 fun j : Fin d ↦ w ^ (j.val + 1) : EuclideanSpace ℝ (Fin d))) :=
  sorry

/-- **3.2** Atoms under Cramér's condition: in dimension `d ≥ 1` the largest atom of the mean of
`n` independent draws from `P` is exponentially small in `n`. On the zero space Cramér's condition
holds vacuously and the sample mean is a point mass, so `1 ≤ d` is needed. -/
theorem exists_pos_iSup_measure_singleton_le {d : ℕ} (hd : 1 ≤ d)
    (P : Measure (EuclideanSpace ℝ (Fin d))) [IsProbabilityMeasure P]
    (hcr : SatisfiesCramerCondition P) :
    ∃ ε > 0, ∃ C : ℝ, ∀ n : ℕ,
      ⨆ x : EuclideanSpace ℝ (Fin d),
        (Measure.pi fun _ : Fin n ↦ P).real (sampleMean ⁻¹' {x}) ≤ C * Real.exp (-ε * n) := sorry

end Layer3

/-! ## Layer 4: Edgeworth expansions -/

section Layer4

variable {Ω : Type*} [MeasurableSpace Ω]

/-- **4.1** The Edgeworth approximation `Φ(x) + ∑_{r=1}^{j} n^{-r/2} p_r(x) φ(x)`. At `n = 0` every
`n^{-r/2}` is Lean's `0 ^ (-r/2) = 0` and the approximation is `Φ`; the statements use `n ≥ 1`. -/
def edgeworthApproximation (p : ℕ → Polynomial ℝ) (j n : ℕ) (x : ℝ) : ℝ :=
  cdf (gaussianReal 0 1) x + gaussianPDFReal 0 1 x *
    ∑ r ∈ Finset.Icc 1 j, (n : ℝ) ^ (-(r : ℝ) / 2) * (p r).eval x

/-- **4.1** The cumulants of a law on `ℝ`, from its moments `m k = ∫ x ^ k ∂P` by the recursion
`κ_{r+1} = m_{r+1} - ∑_{k<r} C(r, k) κ_{k+1} m_{r-k}`, the coefficient form of Hall's identity
`log (1 + ∑ mⱼ (it)ʲ/j!) = ∑ κⱼ (it)ʲ/j!`, with `κ₀ = 0`. When `P` has a finite `k`th moment,
`κ₁, …, κₖ` are its cumulants; higher ones involve the junk value `0` of nonintegrable moments and
are not used. -/
def cumulant (P : Measure ℝ) : ℕ → ℝ
  | 0 => 0
  | r + 1 => (∫ x, x ^ (r + 1) ∂P) -
      ∑ k : Fin r, (r.choose k : ℝ) * cumulant P (k + 1) * ∫ x, x ^ (r - k) ∂P
decreasing_by exact Nat.succ_lt_succ k.isLt

/-- **4.1** The polynomial `r_r` of the characteristic-function expansion: the coefficient of `u^r`
in `exp (∑_{k ≥ 3} κ_k X^k u^{k-2} / k!)`, computed by the recursion
`r · r_r = ∑_{k=1}^{r} k g_k r_{r-k}` with `g_k = κ_{k+2} X^{k+2} / (k+2)!`, from `f' = g' f` for
`f = exp g`. -/
def edgeworthCharPoly (κ : ℕ → ℝ) : ℕ → Polynomial ℝ
  | 0 => 1
  | r + 1 => Polynomial.C ((r + 1 : ℝ)⁻¹) * ∑ k : Fin (r + 1),
      Polynomial.C (((k : ℕ) + 1 : ℝ) * κ ((k : ℕ) + 3) / ((k : ℕ) + 3).factorial) *
        Polynomial.X ^ ((k : ℕ) + 3) * edgeworthCharPoly κ (r - k)
decreasing_by omega

/-- **4.1** The Edgeworth polynomial `p_r`, defined by `p_r φ = r_r(-d/dx) Φ`: since
`(-d/dx)ᵏ Φ = -He_{k-1} φ` for `k ≥ 1`, it is `-∑_k c_k He_{k-1}` for `r_r = ∑_k c_k Xᵏ`. It is used
for `r ≥ 1`, where `r_r` has no constant term. -/
def edgeworthPoly (κ : ℕ → ℝ) (r : ℕ) : Polynomial ℝ :=
  -∑ k ∈ Finset.range ((edgeworthCharPoly κ r).natDegree + 1),
    Polynomial.C ((edgeworthCharPoly κ r).coeff k) *
      (Polynomial.hermite (k - 1)).map (Int.castRingHom ℝ)

/-- **4.1** For `r ≥ 1`, `p_r` has degree at most `3r - 1`, is even for odd `r` and odd for even
`r`, and depends only on `κ₃, …, κ_{r+2}`; the density correction `(p_r φ)' = (p_r' - X p_r) φ` is
`r_r(-d/dx) φ = (∑_k c_k Heₖ) φ`, and its Fourier–Stieltjes transform is `r_r(i t) exp (-t²/2)`. -/
theorem fourierStieltjes_edgeworthPoly (κ : ℕ → ℝ) (r : ℕ) (hr : 1 ≤ r) :
    (edgeworthPoly κ r).natDegree ≤ 3 * r - 1 ∧
    (∀ x, (edgeworthPoly κ r).eval (-x) = (-1) ^ (r + 1) * (edgeworthPoly κ r).eval x) ∧
    (∀ κ' : ℕ → ℝ, (∀ k, 3 ≤ k → k ≤ r + 2 → κ' k = κ k) →
      edgeworthPoly κ' r = edgeworthPoly κ r) ∧
    Polynomial.derivative (edgeworthPoly κ r) - Polynomial.X * edgeworthPoly κ r =
      ∑ k ∈ Finset.range ((edgeworthCharPoly κ r).natDegree + 1),
        Polynomial.C ((edgeworthCharPoly κ r).coeff k) *
          (Polynomial.hermite k).map (Int.castRingHom ℝ) ∧
    ∀ t : ℝ, fourierStieltjes (fun x ↦ (Polynomial.derivative (edgeworthPoly κ r) -
        Polynomial.X * edgeworthPoly κ r).eval x * gaussianPDFReal 0 1 x) t =
      ((edgeworthCharPoly κ r).map Complex.ofRealHom).eval (t * Complex.I) *
        Complex.exp (-(t : ℂ) ^ 2 / 2) := sorry

/-- **4.2** The one-term Edgeworth expansion of a standardized nonlattice mean. -/
theorem exists_uniform_edgeworth_expansion_nonlattice (μ : Measure Ω) [IsProbabilityMeasure μ]
    (P : Measure ℝ) [IsProbabilityMeasure P] (X : ℕ → Ω → ℝ)
    (hiid : IsIndependentIdenticallyDistributed μ X P) (h3 : MemLp id 3 P)
    (h0 : ∫ x, x ∂P = 0) (h1 : ∫ x, x ^ 2 ∂P = 1) (hnl : ¬ IsLatticeLaw P) :
    ∃ e : ℕ → ℝ, Tendsto (fun n : ℕ ↦ Real.sqrt n * e n) atTop (𝓝 0) ∧
      ∀ n : ℕ, 1 ≤ n → ∀ x : ℝ,
        |μ.real {ω | Real.sqrt n * sampleMean (sample X n ω) ≤ x} -
          (cdf (gaussianReal 0 1) x -
            gaussianPDFReal 0 1 x * (x ^ 2 - 1) * (∫ y, y ^ 3 ∂P) / (6 * Real.sqrt n))| ≤ e n :=
  sorry

/-- **4.2** The sharp constant: for a standardized nonlattice law with a third moment,
`√n kolmogorovDist (law of Sₙ) N(0, 1) → |κ₃| / (6 √(2π))`. -/
theorem tendsto_sqrt_mul_kolmogorovDist_nonlattice (μ : Measure Ω) [IsProbabilityMeasure μ]
    (P : Measure ℝ) [IsProbabilityMeasure P] (X : ℕ → Ω → ℝ)
    (hiid : IsIndependentIdenticallyDistributed μ X P) (h3 : MemLp id 3 P)
    (h0 : ∫ x, x ∂P = 0) (h1 : ∫ x, x ^ 2 ∂P = 1) (hnl : ¬ IsLatticeLaw P) :
    Tendsto (fun n : ℕ ↦ Real.sqrt n *
        kolmogorovDist (μ.map fun ω ↦ Real.sqrt n * sampleMean (sample X n ω)) (gaussianReal 0 1))
      atTop (𝓝 (|∫ y, y ^ 3 ∂P| / (6 * Real.sqrt (2 * Real.pi)))) := sorry

/-- **4.3** The one-term Edgeworth expansion of a standardized lattice mean, carried by
`a + h ℤ` with maximal span `h`, with the sawtooth `⌊y⌋ - y + 1/2`. -/
theorem exists_uniform_edgeworth_expansion_lattice (μ : Measure Ω) [IsProbabilityMeasure μ]
    (P : Measure ℝ) [IsProbabilityMeasure P] (X : ℕ → Ω → ℝ)
    (hiid : IsIndependentIdenticallyDistributed μ X P) (h3 : MemLp id 3 P)
    (h0 : ∫ x, x ∂P = 0) (h1 : ∫ x, x ^ 2 ∂P = 1) (a h : ℝ) (hh : 0 < h)
    (hlat : P (range fun k : ℤ ↦ a + h * k)ᶜ = 0)
    (hmax : ∀ a' h', h < h' → P (range fun k : ℤ ↦ a' + h' * k)ᶜ ≠ 0) :
    ∃ e : ℕ → ℝ, Tendsto (fun n : ℕ ↦ Real.sqrt n * e n) atTop (𝓝 0) ∧
      ∀ n : ℕ, 1 ≤ n → ∀ x : ℝ,
        |μ.real {ω | Real.sqrt n * sampleMean (sample X n ω) ≤ x} -
          (cdf (gaussianReal 0 1) x -
            gaussianPDFReal 0 1 x * (x ^ 2 - 1) * (∫ y, y ^ 3 ∂P) / (6 * Real.sqrt n) +
            h / Real.sqrt n * gaussianPDFReal 0 1 x *
              (⌊(x * Real.sqrt n - n * a) / h⌋ - (x * Real.sqrt n - n * a) / h + 1 / 2))| ≤
          e n := sorry

/-- **4.3** No continuous expansion of a lattice mean: for a standardized law carried by `a + h ℤ`
and every law `G` with continuous distribution function, eventually
`√n kolmogorovDist (law of Sₙ) G ≥ h φ(0) / 2 - ε`. Here `h` is any span, not only the maximal
one. -/
theorem eventually_le_sqrt_mul_kolmogorovDist_lattice (μ : Measure Ω) [IsProbabilityMeasure μ]
    (P : Measure ℝ) [IsProbabilityMeasure P] (X : ℕ → Ω → ℝ)
    (hiid : IsIndependentIdenticallyDistributed μ X P) (h3 : MemLp id 3 P)
    (h0 : ∫ x, x ∂P = 0) (h1 : ∫ x, x ^ 2 ∂P = 1) (a h : ℝ) (hh : 0 < h)
    (hlat : P (range fun k : ℤ ↦ a + h * k)ᶜ = 0) (G : Measure ℝ) [IsProbabilityMeasure G]
    (hG : Continuous (cdf G)) (ε : ℝ) (hε : 0 < ε) :
    ∀ᶠ n : ℕ in atTop, h * gaussianPDFReal 0 1 0 / 2 - ε ≤
      Real.sqrt n * kolmogorovDist (μ.map fun ω ↦ Real.sqrt n * sampleMean (sample X n ω)) G :=
  sorry

/-- **4.4** The Edgeworth expansion of order `k - 2` of a standardized mean under Cramér's
condition and a `k`th moment, `k ≥ 3`, with the polynomials `edgeworthPoly (cumulant P) r` of 4.1:
uniform in `x`, and in the weighted form with the factor `(1 + |x|)^k`. -/
theorem exists_uniform_edgeworth_expansion_of_cramer (μ : Measure Ω) [IsProbabilityMeasure μ]
    (P : Measure ℝ) [IsProbabilityMeasure P] (X : ℕ → Ω → ℝ)
    (hiid : IsIndependentIdenticallyDistributed μ X P) (k : ℕ) (hk : 3 ≤ k) (hmom : MemLp id k P)
    (h0 : ∫ x, x ∂P = 0) (h1 : ∫ x, x ^ 2 ∂P = 1) (hcr : SatisfiesCramerCondition P) :
    ∃ e : ℕ → ℝ, Tendsto (fun n : ℕ ↦ (n : ℝ) ^ (((k : ℝ) - 2) / 2) * e n) atTop (𝓝 0) ∧
      ∀ n : ℕ, 1 ≤ n → ∀ x : ℝ,
        |μ.real {ω | Real.sqrt n * sampleMean (sample X n ω) ≤ x} -
          edgeworthApproximation (edgeworthPoly (cumulant P)) (k - 2) n x| ≤ e n ∧
        (1 + |x|) ^ k * |μ.real {ω | Real.sqrt n * sampleMean (sample X n ω) ≤ x} -
          edgeworthApproximation (edgeworthPoly (cumulant P)) (k - 2) n x| ≤ e n := sorry

/-- **4.4** The Edgeworth expansion of order `s - 2` in `EuclideanSpace ℝ (Fin d)` under Cramér's
condition and an `s`th moment, `s ≥ 3`, uniform over the Borel sets `A` whose boundary has
`N(0, V)`-small neighbourhoods, `N(0, V)((∂A)^ε) ≤ c ε^a`, and uniform over the measurable convex
sets. The covariance `V` is nonsingular and `Q 0 = N(0, V)`. The signed measures `Q r` are stated
existentially: an expansion over the convex sets determines them, so they are the measures of
Bhattacharya–Ranga Rao, §7, built from the cumulant tensors. -/
theorem exists_edgeworth_expansion_of_cramer_euclidean (μ : Measure Ω) [IsProbabilityMeasure μ]
    {d : ℕ} (P : Measure (EuclideanSpace ℝ (Fin d))) [IsProbabilityMeasure P]
    (X : ℕ → Ω → EuclideanSpace ℝ (Fin d)) (hiid : IsIndependentIdenticallyDistributed μ X P)
    (s : ℕ) (hs : 3 ≤ s) (hmom : Integrable (fun x ↦ ‖x‖ ^ s) P) (h0 : ∫ x, x ∂P = 0)
    (hcr : SatisfiesCramerCondition P) :
    let V : Matrix (Fin d) (Fin d) ℝ := Matrix.of fun i j ↦ ∫ x, x i * x j ∂P
    let S := fun (n : ℕ) (ω : Ω) ↦ Real.sqrt n • sampleMean (sample X n ω)
    V.det ≠ 0 ∧
    ∃ Q : ℕ → SignedMeasure (EuclideanSpace ℝ (Fin d)),
      Q 0 = (multivariateGaussian 0 V).toSignedMeasure ∧
      (∀ a c : ℝ, 0 < a → 0 < c → ∃ e : ℕ → ℝ,
        Tendsto (fun n : ℕ ↦ (n : ℝ) ^ (((s : ℝ) - 2) / 2) * e n) atTop (𝓝 0) ∧
        ∀ n : ℕ, 1 ≤ n → ∀ A : Set (EuclideanSpace ℝ (Fin d)), MeasurableSet A →
          (∀ ε > 0, multivariateGaussian 0 V (Metric.thickening ε (frontier A)) ≤
            ENNReal.ofReal (c * ε ^ a)) →
          |μ.real {ω | S n ω ∈ A} -
            ∑ r ∈ Finset.range (s - 1), (n : ℝ) ^ (-(r : ℝ) / 2) * Q r A| ≤ e n) ∧
      ∃ e : ℕ → ℝ, Tendsto (fun n : ℕ ↦ (n : ℝ) ^ (((s : ℝ) - 2) / 2) * e n) atTop (𝓝 0) ∧
        ∀ n : ℕ, 1 ≤ n → ∀ A : Set (EuclideanSpace ℝ (Fin d)), MeasurableSet A → Convex ℝ A →
          |μ.real {ω | S n ω ∈ A} -
            ∑ r ∈ Finset.range (s - 1), (n : ℝ) ^ (-(r : ℝ) / 2) * Q r A| ≤ e n := sorry

/-- **4.5** The Edgeworth expansion of order `j` for a smooth function of a vector mean, under
Cramér's condition. The scale `σ² = ∇A(m)ᵀ Σ ∇A(m)` is the variance of the linear statistic
`DA(m)`, and `p₁ = -(A₁ σ⁻¹ + (1/6) A₂ σ⁻³ (X² - 1))` with Hall's constants
`A₁ = ½ E[D²A(m)(X - m, X - m)]` and
`A₂ = E[(DA(m)(X - m))³] + 3 E[D²A(m)(X - m, Y - m) DA(m)(X - m) DA(m)(Y - m)]`, `Y` an independent
copy of `X`. -/
theorem exists_edgeworth_expansion_smooth_function_of_means (μ : Measure Ω)
    [IsProbabilityMeasure μ] {d : ℕ} (P : Measure (EuclideanSpace ℝ (Fin d)))
    [IsProbabilityMeasure P] (X : ℕ → Ω → EuclideanSpace ℝ (Fin d))
    (hiid : IsIndependentIdenticallyDistributed μ X P) (j : ℕ) (hj : 1 ≤ j)
    (hmom : Integrable (fun x ↦ ‖x‖ ^ (j + 2)) P) (hcr : SatisfiesCramerCondition P)
    (A : EuclideanSpace ℝ (Fin d) → ℝ) (hAm : Measurable A)
    (hA : ∃ U ∈ 𝓝 (∫ x, x ∂P), ContDiffOn ℝ (j + 2 : ℕ) A U) (hA0 : A (∫ x, x ∂P) = 0)
    (hσ : 0 < Var[fun x ↦ fderiv ℝ A (∫ y, y ∂P) x; P]) :
    let m := ∫ x, x ∂P
    let σ := Real.sqrt (Var[fun x ↦ fderiv ℝ A m x; P])
    let a := fderiv ℝ A m
    let a₂ := fderiv ℝ (fderiv ℝ A) m
    let A₁ := (1 / 2 : ℝ) * ∫ x, a₂ (x - m) (x - m) ∂P
    let A₂ := (∫ x, a (x - m) ^ 3 ∂P) +
      3 * ∫ x, ∫ y, a₂ (x - m) (y - m) * a (x - m) * a (y - m) ∂P ∂P
    ∃ p : ℕ → Polynomial ℝ,
      (∀ r, 1 ≤ r → r ≤ j → (p r).natDegree ≤ 3 * r - 1 ∧
        ∀ x, (p r).eval (-x) = (-1) ^ (r + 1) * (p r).eval x) ∧
      p 1 = -(Polynomial.C (A₁ / σ) + Polynomial.C (A₂ / (6 * σ ^ 3)) * (Polynomial.X ^ 2 - 1)) ∧
      ∃ e : ℕ → ℝ, Tendsto (fun n : ℕ ↦ (n : ℝ) ^ ((j : ℝ) / 2) * e n) atTop (𝓝 0) ∧
        ∀ n : ℕ, 1 ≤ n → ∀ x : ℝ,
          |μ.real {ω | Real.sqrt n * A (sampleMean (sample X n ω)) / σ ≤ x} -
            edgeworthApproximation p j n x| ≤ e n := sorry

/-- **4.5** The augmented vector `(x, (xⱼ xₖ)_{j ≤ k})`, each product once. -/
def augmentedVector {d : ℕ} (x : EuclideanSpace ℝ (Fin d)) :
    EuclideanSpace ℝ (Fin d ⊕ {p : Fin d × Fin d // p.1 ≤ p.2}) :=
  WithLp.toLp 2 (Sum.elim (fun j ↦ x j) fun p ↦ x p.1.1 * x p.1.2)

/-- **4.5** The plug-in variance `∇g(x̄)ᵀ Σ̂ ∇g(x̄)`, divisor `n`: the sample variance of the
linear statistic `Dg(x̄)`. -/
def pluginVariance {d : ℕ} (g : EuclideanSpace ℝ (Fin d) → ℝ) {n : ℕ}
    (x : Fin n → EuclideanSpace ℝ (Fin d)) : ℝ :=
  (n : ℝ)⁻¹ * ∑ i, (fderiv ℝ g (sampleMean x) (x i - sampleMean x)) ^ 2

/-- **4.5** The Edgeworth expansion of order `j` for a studentized smooth function of a vector
mean, `√n A(x̄) / τ` with `τ² = pluginVariance A x`, under Cramér's condition for the augmented
vector. `A` is `C^{j+3}` near the mean so that `A(z_X)/τ(z)` is `C^{j+2}`. A zero plug-in variance
gives the junk value `0` of the quotient, on an event whose probability is absorbed in `e n`. -/
theorem exists_edgeworth_expansion_studentized (μ : Measure Ω) [IsProbabilityMeasure μ] {d : ℕ}
    (P : Measure (EuclideanSpace ℝ (Fin d))) [IsProbabilityMeasure P]
    (X : ℕ → Ω → EuclideanSpace ℝ (Fin d)) (hiid : IsIndependentIdenticallyDistributed μ X P)
    (j : ℕ) (hj : 1 ≤ j) (hmom : Integrable (fun x ↦ ‖x‖ ^ (2 * (j + 2))) P)
    (hcr : SatisfiesCramerCondition (P.map augmentedVector))
    (A : EuclideanSpace ℝ (Fin d) → ℝ) (hAm : Measurable A)
    (hA : ∃ U ∈ 𝓝 (∫ x, x ∂P), ContDiffOn ℝ (j + 3 : ℕ) A U) (hA0 : A (∫ x, x ∂P) = 0)
    (hσ : 0 < Var[fun x ↦ fderiv ℝ A (∫ y, y ∂P) x; P]) :
    ∃ q : ℕ → Polynomial ℝ,
      (∀ r, 1 ≤ r → r ≤ j → (q r).natDegree ≤ 3 * r - 1 ∧
        ∀ x, (q r).eval (-x) = (-1) ^ (r + 1) * (q r).eval x) ∧
      ∃ e : ℕ → ℝ, Tendsto (fun n : ℕ ↦ (n : ℝ) ^ ((j : ℝ) / 2) * e n) atTop (𝓝 0) ∧
        ∀ n : ℕ, 1 ≤ n → ∀ x : ℝ,
          |μ.real {ω | Real.sqrt n * A (sampleMean (sample X n ω)) /
              Real.sqrt (pluginVariance A (sample X n ω)) ≤ x} -
            edgeworthApproximation q j n x| ≤ e n := sorry

/-- **4.5** The standardized and the studentized mean of a real sample: with skewness `γ`, the
first polynomials are `p₁ = -γ (X² - 1)/6` and `q₁ = γ (2X² + 1)/6`, where the studentized mean
divides by the sample standard deviation `τ` with divisor `n`. -/
theorem exists_edgeworth_expansion_tStatistic (μ : Measure Ω) [IsProbabilityMeasure μ]
    (P : Measure ℝ) [IsProbabilityMeasure P] (X : ℕ → Ω → ℝ)
    (hiid : IsIndependentIdenticallyDistributed μ X P) (h6 : MemLp id 6 P) (hv : 0 < Var[id; P])
    (hcr : SatisfiesCramerCondition (P.map fun w ↦
      (WithLp.toLp 2 fun j : Fin 2 ↦ w ^ (j.val + 1) : EuclideanSpace ℝ (Fin 2)))) :
    let m := ∫ x, x ∂P
    let σ := Real.sqrt (Var[id; P])
    let γ := (∫ x, (x - m) ^ 3 ∂P) / σ ^ 3
    let τ := fun (n : ℕ) (ω : Ω) ↦
      Real.sqrt ((n : ℝ)⁻¹ * ∑ i : Fin n, (X i ω - sampleMean (sample X n ω)) ^ 2)
    (∃ e : ℕ → ℝ, Tendsto (fun n : ℕ ↦ Real.sqrt n * e n) atTop (𝓝 0) ∧
      ∀ n : ℕ, 1 ≤ n → ∀ x : ℝ,
        |μ.real {ω | Real.sqrt n * (sampleMean (sample X n ω) - m) / σ ≤ x} -
          edgeworthApproximation
            (fun _ ↦ -Polynomial.C (γ / 6) * (Polynomial.X ^ 2 - 1)) 1 n x| ≤ e n) ∧
    ∃ e : ℕ → ℝ, Tendsto (fun n : ℕ ↦ Real.sqrt n * e n) atTop (𝓝 0) ∧
      ∀ n : ℕ, 1 ≤ n → ∀ x : ℝ,
        |μ.real {ω | Real.sqrt n * (sampleMean (sample X n ω) - m) / τ n ω ≤ x} -
          edgeworthApproximation
            (fun _ ↦ Polynomial.C (γ / 6) * (2 * Polynomial.X ^ 2 + 1)) 1 n x| ≤ e n := sorry

/-- **4.6** The local expansion of order four of the density of a normalized sum: if the
characteristic function is in `L^ν`, then for `n ≥ ν` the law of `S_n/√n` has a bounded
continuous density `q n`, and `q n x = φ_σ(x) (1 + κ₃ He₃(x/σ) / (6 σ³ √n)) + O(n⁻¹)` uniformly. -/
theorem exists_local_edgeworth_expansion_density (μ : Measure Ω) [IsProbabilityMeasure μ]
    (P : Measure ℝ) [IsProbabilityMeasure P] (X : ℕ → Ω → ℝ)
    (hiid : IsIndependentIdenticallyDistributed μ X P) (h4 : MemLp id 4 P)
    (h0 : ∫ x, x ∂P = 0) (hv : 0 < Var[id; P]) (ν : ℕ) (hν : 1 ≤ ν)
    (hint : Integrable fun t : ℝ ↦ ‖charFun P t‖ ^ ν) :
    let σ := Real.sqrt (Var[id; P])
    let κ₃ := ∫ x, x ^ 3 ∂P
    ∃ q : ℕ → ℝ → ℝ,
      (∀ n, ν ≤ n → Continuous (q n) ∧ (∃ C, ∀ x, |q n x| ≤ C) ∧
        μ.map (fun ω ↦ (Real.sqrt n)⁻¹ * ∑ i ∈ Finset.range n, X i ω) =
          volume.withDensity fun x ↦ ENNReal.ofReal (q n x)) ∧
      ∃ C : ℝ, ∀ n : ℕ, ν ≤ n → ∀ x : ℝ,
        |q n x - σ⁻¹ * gaussianPDFReal 0 1 (x / σ) *
          (1 + κ₃ / (6 * σ ^ 3 * Real.sqrt n) * ((x / σ) ^ 3 - 3 * (x / σ)))| ≤ C / (n : ℝ) := sorry

/-- **4.7** The Cornish–Fisher expansion: under the hypotheses of 4.5, the lower `α`-quantile of
`√n A(X̄)/σ` is `zₐ + ∑_{r=1}^{j} n^{-r/2} p_{r1}(zₐ) + o(n^{-j/2})` uniformly in
`α ∈ [ε, 1 - ε]`, with `p₁₁ = -p₁` for the polynomial `p₁` of the Edgeworth expansion. -/
theorem cornishFisher_quantile (μ : Measure Ω) [IsProbabilityMeasure μ] {d : ℕ}
    (P : Measure (EuclideanSpace ℝ (Fin d))) [IsProbabilityMeasure P]
    (X : ℕ → Ω → EuclideanSpace ℝ (Fin d)) (hiid : IsIndependentIdenticallyDistributed μ X P)
    (j : ℕ) (hj : 1 ≤ j) (hmom : Integrable (fun x ↦ ‖x‖ ^ (j + 2)) P)
    (hcr : SatisfiesCramerCondition P) (A : EuclideanSpace ℝ (Fin d) → ℝ) (hAm : Measurable A)
    (hA : ∃ U ∈ 𝓝 (∫ x, x ∂P), ContDiffOn ℝ (j + 2 : ℕ) A U) (hA0 : A (∫ x, x ∂P) = 0)
    (hσ : 0 < Var[fun x ↦ fderiv ℝ A (∫ y, y ∂P) x; P]) :
    let σ := Real.sqrt (Var[fun x ↦ fderiv ℝ A (∫ y, y ∂P) x; P])
    let T := fun (n : ℕ) (ω : Ω) ↦ Real.sqrt n * A (sampleMean (sample X n ω)) / σ
    let z := fun α : ℝ ↦ (gaussianReal 0 1).quantile α
    ∃ p pcf : ℕ → Polynomial ℝ, pcf 1 = -p 1 ∧
      (∃ e : ℕ → ℝ, Tendsto (fun n : ℕ ↦ (n : ℝ) ^ ((j : ℝ) / 2) * e n) atTop (𝓝 0) ∧
        ∀ n : ℕ, 1 ≤ n → ∀ x : ℝ,
          |μ.real {ω | T n ω ≤ x} - edgeworthApproximation p j n x| ≤ e n) ∧
      ∀ ε ∈ Ioo (0 : ℝ) (1 / 2), ∃ e : ℕ → ℝ,
        Tendsto (fun n : ℕ ↦ (n : ℝ) ^ ((j : ℝ) / 2) * e n) atTop (𝓝 0) ∧
        ∀ n : ℕ, 1 ≤ n → ∀ α ∈ Icc ε (1 - ε),
          |(μ.map (T n)).quantile α -
            (z α + ∑ r ∈ Finset.Icc 1 j, (n : ℝ) ^ (-(r : ℝ) / 2) * (pcf r).eval (z α))| ≤ e n :=
  sorry

end Layer4

/-! ## Layer 5: the saddlepoint approximation -/

section Layer5

variable {Ω : Type*} [MeasurableSpace Ω]

/-- **5.1** The tilting identity: the law of the mean of `n` draws from `P` is
`y ↦ exp (n (K(s) - s y))` times the law of the mean of `n` draws from the tilted law
`P_s = P.tilted (s * ·)`, `K = cgf id P`; hence so are their densities, almost everywhere. -/
theorem map_sampleMean_eq_tilted (P : Measure ℝ) [IsProbabilityMeasure P] (s : ℝ)
    (hs : s ∈ interior (integrableExpSet id P)) (n : ℕ) :
    (Measure.pi fun _ : Fin n ↦ P).map sampleMean =
        ((Measure.pi fun _ : Fin n ↦ P.tilted fun x ↦ s * x).map sampleMean).withDensity
          (fun y ↦ ENNReal.ofReal (Real.exp (n * (cgf id P s - s * y)))) ∧
      ∀ f fs : ℝ → ℝ≥0∞, Measurable f → Measurable fs →
        (Measure.pi fun _ : Fin n ↦ P).map sampleMean = volume.withDensity f →
        (Measure.pi fun _ : Fin n ↦ P.tilted fun x ↦ s * x).map sampleMean =
          volume.withDensity fs →
        f =ᵐ[volume] fun y ↦ ENNReal.ofReal (Real.exp (n * (cgf id P s - s * y))) * fs y := sorry

/-- **5.2** The saddlepoint density `(n / (2π K''(s)))^{1/2} exp (n (K s - s x))`. -/
def saddlepointDensity (K : ℝ → ℝ) (n : ℕ) (s x : ℝ) : ℝ :=
  Real.sqrt (n / (2 * Real.pi * deriv (deriv K) s)) * Real.exp (n * (K s - s * x))

/-- **5.2** The saddlepoint approximation to the density of a sample mean, pointwise in `x`, with
relative error `O(n⁻¹)`. -/
theorem saddlepoint_approximation_sampleMean_density (μ : Measure Ω) [IsProbabilityMeasure μ]
    (P : Measure ℝ) [IsProbabilityMeasure P] (X : ℕ → Ω → ℝ)
    (hiid : IsIndependentIdenticallyDistributed μ X P) (hac : P ≪ volume)
    (hK : (0 : ℝ) ∈ interior (integrableExpSet id P))
    (s x : ℝ) (hs : s ∈ interior (integrableExpSet id P)) (hsx : deriv (cgf id P) s = x)
    (ν : ℕ) (hν : 1 ≤ ν)
    (hint : Integrable fun t : ℝ ↦
      ‖complexMGF id P (s + t * Complex.I) / (mgf id P s : ℂ)‖ ^ ν) :
    ∃ f : ℕ → ℝ → ℝ,
      (∀ n : ℕ, ν < n → Continuous (f n) ∧
        ((Integrable fun t : ℝ ↦ ‖charFun P t‖ ^ ν) → ∃ C, ∀ y, |f n y| ≤ C) ∧
        μ.map (fun ω ↦ sampleMean (sample X n ω)) =
          volume.withDensity fun y ↦ ENNReal.ofReal (f n y)) ∧
      (fun n : ℕ ↦ f n x / saddlepointDensity (cgf id P) n s x - 1) =O[atTop]
        (fun n : ℕ ↦ (n : ℝ)⁻¹) := sorry

end Layer5

/-! ## Layer 6: the bootstrap -/

section Layer6

variable {Ω E Y : Type*} [MeasurableSpace Ω] [MeasurableSpace E]

/-- **6.1** The nonparametric resampling kernel: given a sample `x` of size `n > 0`, `m`
independent draws from its empirical distribution; the zero kernel for `n = 0`. -/
def bootstrapKernel (n m : ℕ) : ProbabilityTheory.Kernel (Fin n → E) (Fin m → E) :=
  if h : n = 0 then 0 else
    haveI : NeZero n := ⟨h⟩
    (TauCeti.MeasureTheory.iidBlockKernel m).comap TauCeti.Probability.empiricalMeasureOfFintype
      TauCeti.Probability.measurable_empiricalMeasureOfFintype

/-- **6.1** The bootstrap law of a statistic `R x y` of the sample `x` and the resample `y`. -/
def bootstrapLaw [MeasurableSpace Y] (n m : ℕ) (R : (Fin n → E) → (Fin m → E) → Y)
    (x : Fin n → E) : Measure Y :=
  (bootstrapKernel n m x).map (R x)

/-- **6.1** The resampling kernel is Markov for `n > 0`. -/
theorem isMarkovKernel_bootstrapKernel (n m : ℕ) (hn : n ≠ 0) :
    IsMarkovKernel (bootstrapKernel (E := E) n m) := sorry

/-- **6.1** Index form and resampling formulas: for `n > 0` the resampling kernel at `x` is the
image of the uniform law on the index maps `Fin m → Fin n` under `k ↦ x ∘ k`. When `E` and `Y`
have measurable singletons, every statistic of the resample is a.e.-measurable for it, the
bootstrap law is the average of the Dirac masses at the `nᵐ` resampled values, and integrals
against it are the corresponding finite averages, with no measurability hypothesis on `R`. -/
theorem bootstrapKernel_index_form [MeasurableSingletonClass E] [MeasurableSpace Y]
    [MeasurableSingletonClass Y] (n m : ℕ) (hn : n ≠ 0) (R : (Fin n → E) → (Fin m → E) → Y)
    (x : Fin n → E) :
    bootstrapKernel n m x = (uniformOn (univ : Set (Fin m → Fin n))).map (fun k ↦ x ∘ k) ∧
    (∀ F : (Fin m → E) → Y, AEMeasurable F (bootstrapKernel n m x)) ∧
    bootstrapLaw n m R x =
      ((n : ℝ≥0∞) ^ m)⁻¹ • ∑ k : Fin m → Fin n, Measure.dirac (R x (x ∘ k)) ∧
    ∀ h : Y → ℝ, ∫ z, h z ∂(bootstrapLaw n m R x) =
      ((n : ℝ) ^ m)⁻¹ * ∑ k : Fin m → Fin n, h (R x (x ∘ k)) := sorry

/-- **6.1** The bootstrap law is the conditional law of the resample given the data: under the
joint law `Pⁿ ⊗ₘ bootstrapKernel`, the conditional distribution of the resample given the sample
is the resampling kernel. -/
theorem condDistrib_snd_fst_bootstrap [StandardBorelSpace E] [Nonempty E] (n m : ℕ)
    (hn : n ≠ 0) [IsMarkovKernel (bootstrapKernel (E := E) n m)] (P : Measure E)
    [IsProbabilityMeasure P] :
    let J := (Measure.pi fun _ : Fin n ↦ P) ⊗ₘ bootstrapKernel n m
    condDistrib Prod.snd Prod.fst J =ᵐ[Measure.pi fun _ : Fin n ↦ P] bootstrapKernel n m :=
  sorry

/-- **6.2** Consistency of the bootstrap of the mean: almost surely the bootstrap law of
`√n (X̄* - X̄)` converges to `N(0, σ²)` in Kolmogorov distance, and almost surely its Kolmogorov
distance to the law of `√n (X̄ - μ)` tends to `0`. -/
theorem tendsto_kolmogorovDist_bootstrap_mean (μ : Measure Ω) [IsProbabilityMeasure μ]
    (P : Measure ℝ) [IsProbabilityMeasure P] (X : ℕ → Ω → ℝ)
    (hiid : IsIndependentIdenticallyDistributed μ X P) (h2 : MemLp id 2 P)
    (hv : 0 < Var[id; P]) :
    let L := fun (n : ℕ) (ω : Ω) ↦ bootstrapLaw n n
      (fun x y ↦ Real.sqrt n * (sampleMean y - sampleMean x)) (sample X n ω)
    (∀ᵐ ω ∂μ, Tendsto (fun n ↦ kolmogorovDist (L n ω) (gaussianReal 0 (Var[id; P]).toNNReal))
      atTop (𝓝 0)) ∧
    ∀ᵐ ω ∂μ, Tendsto (fun n ↦ kolmogorovDist (L n ω)
      (μ.map fun ω' ↦ Real.sqrt n * (sampleMean (sample X n ω') - ∫ x, x ∂P))) atTop (𝓝 0) :=
  sorry

/-- **6.3** The bootstrap empirical process `√n (F*ₙ - Fₙ)` converges conditionally in law in
`ℓ^∞(ℝ)` to the `F`-Brownian bridge, outer almost surely. -/
theorem tendstoInLawAlmostSurely_bootstrap_empiricalProcess (μ : Measure Ω)
    [IsProbabilityMeasure μ] (P : Measure ℝ) [IsProbabilityMeasure P] (X : ℕ → Ω → ℝ)
    (hiid : IsIndependentIdenticallyDistributed μ X P) (B : Measure (Linfty ℝ))
    (hB : IsBrownianBridgeLaw P (fun t x ↦ (Iic t).indicator (fun _ ↦ (1 : ℝ)) x) B) :
    TendstoInLawAlmostSurely μ
      (fun n ω ↦ bootstrapLaw n n
        (fun x y ↦ liftLinfty fun t ↦ Real.sqrt n * (empiricalCdf y t - empiricalCdf x t))
        (sample X n ω)) B := sorry

/-- **6.4** The delta method for the bootstrap, conditionally in outer probability, for a map
into `ℝ^k` that is Hadamard differentiable tangentially to a linear subspace `D₀`, with a tight
limit carried by `D₀` (a σ-compact carrier `S ⊆ D₀`). The hypothesis `hjoint` is the
asymptotic measurability of the bootstrap process on the joint data–resample space. -/
theorem tendstoInLawInProbability_bootstrap_delta_method (μ : Measure Ω)
    [IsProbabilityMeasure μ] (X : ℕ → Ω → E) (hX : ∀ i, Measurable (X i)) {D : Type*}
    [NormedAddCommGroup D] [NormedSpace ℝ D] [MeasurableSpace D] [BorelSpace D] {k : ℕ}
    (dom : Set D) (D₀ : Submodule ℝ D) (θ : D) (φ : D → EuclideanSpace ℝ (Fin k))
    (φ' : D →L[ℝ] EuclideanSpace ℝ (Fin k))
    (hφ : HasHadamardDerivWithinAt φ dom (D₀ : Set D) φ' θ)
    (r : ℕ → ℝ) (hr : Tendsto r atTop atTop) (T : (n : ℕ) → (Fin n → E) → D)
    (Tstar : (n : ℕ) → (Fin n → E) → (Fin n → E) → D) (hT0 : ∀ n x, T n x ∈ dom)
    (hTstar0 : ∀ n x y, Tstar n x y ∈ dom) (G : Measure D) [IsProbabilityMeasure G]
    (hsep : ∃ S ⊆ (D₀ : Set D), IsSigmaCompact S ∧ G S = 1)
    (hT : TendstoInOuterDistribution (fun (n : ℕ) ω ↦ r n • (T n (sample X n ω) - θ)) atTop G
      (fun _ ↦ μ))
    (hTstar : TendstoInLawInProbability μ
      (fun n ω ↦ bootstrapLaw n n (fun x y ↦ r n • (Tstar n x y - T n x)) (sample X n ω)) G)
    (hjoint : ∀ f : BoundedContinuousFunction D ℝ,
      let J := fun n : ℕ ↦ μ ⊗ₘ (bootstrapKernel n n).comap (sample X n)
        (measurable_pi_iff.mpr fun i ↦ hX i)
      let Z := fun (n : ℕ) (p : Ω × (Fin n → E)) ↦
        f (r n • (Tstar n (sample X n p.1) p.2 - T n (sample X n p.1)))
      Tendsto (fun n ↦ outerIntegral (J n) (Z n) - innerIntegral (J n) (Z n)) atTop (𝓝 0)) :
    TendstoInLawInProbability μ
      (fun n ω ↦ bootstrapLaw n n (fun x y ↦ r n • (φ (Tstar n x y) - φ (T n x)))
        (sample X n ω)) (G.map φ') := sorry

/-- **6.4** The bootstrap delta method fails at a vanishing derivative: for an `N(0, σ²)`
sample, the bounded Lipschitz distance between the bootstrap law of `n ((X̄*)² - X̄²)` and the
law of `n X̄²` does not tend to `0` in outer probability. -/
theorem not_tendsto_bootstrap_square_of_gaussian (μ : Measure Ω) [IsProbabilityMeasure μ]
    (X : ℕ → Ω → ℝ) (σ : ℝ≥0) (hσ : σ ≠ 0)
    (hiid : IsIndependentIdenticallyDistributed μ X (gaussianReal 0 (σ ^ 2))) :
    ¬ ∀ ε : ℝ≥0∞, 0 < ε → Tendsto (fun n ↦ μ {ω | ε < boundedLipschitzDist
      (bootstrapLaw n n (fun x y ↦ (n : ℝ) * (sampleMean y ^ 2 - sampleMean x ^ 2)) (sample X n ω))
      (μ.map fun ω' ↦ (n : ℝ) * sampleMean (sample X n ω') ^ 2)}) atTop (𝓝 0) := sorry

/-- **6.5** The bootstrap maximum equals the sample maximum with conditional probability
`1 - (1 - 1/n)ⁿ` whenever the sample maximum is attained at exactly one index. -/
theorem bootstrapKernel_iSup_eq (n : ℕ) (hn : n ≠ 0) (x : Fin n → ℝ)
    (huniq : ∃! i, x i = ⨆ j, x j) :
    (bootstrapKernel n n x).real {y | ⨆ j, y j = ⨆ j, x j} = 1 - (1 - 1 / (n : ℝ)) ^ n := sorry

/-- **6.5** Inconsistency of the bootstrap for the sample maximum: for a continuous `F`, almost
surely, for every `n ≥ 1`, every normalization `bₙ` and every law `G` with continuous distribution
function, the bootstrap law of `bₙ (X₍ₙ₎ - X*₍ₙ₎)` is at Kolmogorov distance at least
`(1 - (1 - 1/n)ⁿ)/2` from `G`. -/
theorem le_kolmogorovDist_bootstrap_max (μ : Measure Ω) [IsProbabilityMeasure μ]
    (P : Measure ℝ) [IsProbabilityMeasure P] (hP : Continuous (cdf P)) (X : ℕ → Ω → ℝ)
    (hiid : IsIndependentIdenticallyDistributed μ X P) :
    ∀ᵐ ω ∂μ, ∀ (b : ℕ → ℝ) (G : Measure ℝ), IsProbabilityMeasure G → Continuous (cdf G) →
      ∀ n : ℕ, 1 ≤ n → (1 - (1 - 1 / (n : ℝ)) ^ n) / 2 ≤ kolmogorovDist
        (bootstrapLaw n n (fun x y ↦ b n * ((⨆ j, x j) - ⨆ j, y j)) (sample X n ω)) G := sorry

/-- **6.5** The `m`-out-of-`n` bootstrap of the maximum is consistent when `m → ∞`, `m/n → 0`,
and `n^{1/δ} (θ - X₍ₙ₎)` has the Weibull limit `1 - exp (-(x/c)^δ)`. -/
theorem tendsto_kolmogorovDist_m_out_of_n_bootstrap_max (μ : Measure Ω) [IsProbabilityMeasure μ]
    (P : Measure ℝ) [IsProbabilityMeasure P] (X : ℕ → Ω → ℝ)
    (hiid : IsIndependentIdenticallyDistributed μ X P) (θ δ c : ℝ) (hδ : 0 < δ) (hc : 0 < c)
    (hθ : cdf P θ = 1) (hlt : ∀ x < θ, cdf P x < 1) (G : Measure ℝ) [IsProbabilityMeasure G]
    (hGcdf : ∀ x, 0 ≤ x → cdf G x = 1 - Real.exp (-(x / c) ^ δ)) (hG0 : cdf G 0 = 0)
    (hlim : ∀ x, Tendsto (fun n : ℕ ↦ μ.real {ω | (n : ℝ) ^ δ⁻¹ * (θ - ⨆ j, sample X n ω j) ≤ x})
      atTop (𝓝 (cdf G x)))
    (m : ℕ → ℕ) (hm : Tendsto m atTop atTop)
    (hmn : Tendsto (fun n ↦ (m n : ℝ) / n) atTop (𝓝 0)) :
    ∀ ε > 0, Tendsto (fun n ↦ μ {ω | ε < kolmogorovDist
      (bootstrapLaw n (m n) (fun x y ↦ (m n : ℝ) ^ δ⁻¹ * ((⨆ j, x j) - ⨆ j, y j))
        (sample X n ω)) G}) atTop (𝓝 0) := sorry

end Layer6

/-! ## Layer 7: the jackknife, subsampling and empirical likelihood -/

section Layer7

variable {Ω E : Type*} [MeasurableSpace Ω]

/-- **7.1** The mean of the sample with the `i`th observation deleted. -/
def deleteOneMean [AddCommGroup E] [Module ℝ E] {n : ℕ} (x : Fin n → E) (i : Fin n) : E :=
  ((n : ℝ) - 1)⁻¹ • ∑ j ∈ Finset.univ.erase i, x j

/-- **7.1** The delete-one jackknife variance `((n-1)/n) ∑ᵢ (θ̂₍ᵢ₎ - θ̂₍·₎)²` of `g (x̄)`. -/
def jackknifeVariance [AddCommGroup E] [Module ℝ E] (g : E → ℝ) {n : ℕ} (x : Fin n → E) : ℝ :=
  ((n : ℝ) - 1) / n *
    ∑ i, (g (deleteOneMean x i) - (n : ℝ)⁻¹ * ∑ j, g (deleteOneMean x j)) ^ 2

/-- **7.1** Strong consistency of the jackknife variance of a smooth function of means. -/
theorem tendsto_mul_jackknifeVariance (μ : Measure Ω) [IsProbabilityMeasure μ] {d : ℕ}
    (P : Measure (EuclideanSpace ℝ (Fin d))) [IsProbabilityMeasure P]
    (X : ℕ → Ω → EuclideanSpace ℝ (Fin d)) (hiid : IsIndependentIdenticallyDistributed μ X P)
    (h2 : MemLp id 2 P) (g : EuclideanSpace ℝ (Fin d) → ℝ)
    (hg : ∀ᶠ y in 𝓝 (∫ x, x ∂P), DifferentiableAt ℝ g y)
    (hgc : ContinuousAt (fderiv ℝ g) (∫ x, x ∂P)) :
    ∀ᵐ ω ∂μ, Tendsto (fun n : ℕ ↦ n * jackknifeVariance g (sample X n ω)) atTop
      (𝓝 (Var[fun x ↦ fderiv ℝ g (∫ y, y ∂P) x; P])) := sorry

/-- **7.2** The subsampling law: the law of `τ (θ̂_b (x ∘ ι) - θ̂_n x)` for `ι` uniform among the
strictly increasing maps `Fin b → Fin n`, that is, among the subsamples of size `b`. -/
def subsamplingLaw {n b : ℕ} (θb : (Fin b → E) → ℝ) (θn : (Fin n → E) → ℝ) (τ : ℝ)
    (x : Fin n → E) : Measure ℝ :=
  (uniformOn {ι : Fin b → Fin n | StrictMono ι}).map fun ι ↦ τ * (θb (x ∘ ι) - θn x)

/-- **7.2** Consistency of subsampling (Politis–Romano–Wolf). -/
theorem tendsto_kolmogorovDist_subsamplingLaw [MeasurableSpace E] (μ : Measure Ω)
    [IsProbabilityMeasure μ] (P : Measure E) [IsProbabilityMeasure P] (X : ℕ → Ω → E)
    (hiid : IsIndependentIdenticallyDistributed μ X P) (θhat : (n : ℕ) → (Fin n → E) → ℝ)
    (hθm : ∀ n, Measurable (θhat n)) (θ : ℝ) (τ : ℕ → ℝ) (b : ℕ → ℕ)
    (hb : Tendsto b atTop atTop) (hbn : Tendsto (fun n ↦ (b n : ℝ) / n) atTop (𝓝 0))
    (hτ : Tendsto (fun n ↦ τ (b n) / τ n) atTop (𝓝 0)) (J : Measure ℝ) [IsProbabilityMeasure J]
    (hJ : Continuous (cdf J))
    (hlim : ∀ x, Tendsto (fun n ↦ μ.real {ω | τ n * (θhat n (sample X n ω) - θ) ≤ x}) atTop
      (𝓝 (cdf J x))) :
    ∀ ε > 0, Tendsto (fun n ↦ μ {ω | ε < kolmogorovDist
      (subsamplingLaw (θhat (b n)) (θhat n) (τ (b n)) (sample X n ω)) J}) atTop (𝓝 0) := sorry

/-- **7.2** Coverage of the subsampling interval (Politis–Romano–Wolf, part (iii)): if
`τₙ (θ̂ₙ - θ)` converges weakly to `J` and `J` is continuous at its `(1 - α)`-quantile, then
`τₙ (θ̂ₙ - θ)` is at most the `(1 - α)`-quantile of the subsampling law with probability tending
to `1 - α`. -/
theorem tendsto_measureReal_le_quantile_subsamplingLaw [MeasurableSpace E] (μ : Measure Ω)
    [IsProbabilityMeasure μ] (P : Measure E) [IsProbabilityMeasure P] (X : ℕ → Ω → E)
    (hiid : IsIndependentIdenticallyDistributed μ X P) (θhat : (n : ℕ) → (Fin n → E) → ℝ)
    (hθm : ∀ n, Measurable (θhat n)) (θ : ℝ) (τ : ℕ → ℝ) (b : ℕ → ℕ)
    (hb : Tendsto b atTop atTop) (hbn : Tendsto (fun n ↦ (b n : ℝ) / n) atTop (𝓝 0))
    (hτ : Tendsto (fun n ↦ τ (b n) / τ n) atTop (𝓝 0)) (J : Measure ℝ) [IsProbabilityMeasure J]
    (hlim : ∀ x, ContinuousAt (cdf J) x →
      Tendsto (fun n ↦ μ.real {ω | τ n * (θhat n (sample X n ω) - θ) ≤ x}) atTop (𝓝 (cdf J x)))
    (α : ℝ) (hα₀ : 0 < α) (hα₁ : α < 1)
    (hJα : ContinuousAt (cdf J) (MeasureTheory.Measure.quantile J (1 - α))) :
    Tendsto (fun n ↦ μ.real {ω | τ n * (θhat n (sample X n ω) - θ) ≤
      MeasureTheory.Measure.quantile
        (subsamplingLaw (θhat (b n)) (θhat n) (τ (b n)) (sample X n ω)) (1 - α)})
      atTop (𝓝 (1 - α)) := sorry

/-- **7.2** Subsampling the sample maximum: under the Weibull limit of 6.5, subsampling with
`τₙ = n^{1/δ}` is consistent for the law of `n^{1/δ} (X₍ₙ₎ - θ)`, the reflection of `G`. -/
theorem tendsto_kolmogorovDist_subsamplingLaw_max (μ : Measure Ω) [IsProbabilityMeasure μ]
    (P : Measure ℝ) [IsProbabilityMeasure P] (X : ℕ → Ω → ℝ)
    (hiid : IsIndependentIdenticallyDistributed μ X P) (θ δ c : ℝ) (hδ : 0 < δ) (hc : 0 < c)
    (G : Measure ℝ) [IsProbabilityMeasure G]
    (hGcdf : ∀ x, 0 ≤ x → cdf G x = 1 - Real.exp (-(x / c) ^ δ))
    (hlim : ∀ x, Tendsto (fun n : ℕ ↦ μ.real {ω | (n : ℝ) ^ δ⁻¹ * (θ - ⨆ j, sample X n ω j) ≤ x})
      atTop (𝓝 (cdf G x)))
    (b : ℕ → ℕ) (hb : Tendsto b atTop atTop)
    (hbn : Tendsto (fun n ↦ (b n : ℝ) / n) atTop (𝓝 0)) :
    ∀ ε > 0, Tendsto (fun n ↦ μ {ω | ε < kolmogorovDist
      (subsamplingLaw (fun y : Fin (b n) → ℝ ↦ ⨆ j, y j) (fun x : Fin n → ℝ ↦ ⨆ j, x j)
        ((b n : ℝ) ^ δ⁻¹) (sample X n ω)) (G.map fun x ↦ -x)}) atTop (𝓝 0) := sorry

/-- **7.3** The empirical likelihood ratio of a mean `m`: the supremum of `∏ (n wᵢ)` over the
probability weights with weighted mean `m`, and `0` when `m` is outside the convex hull. -/
def empiricalLikelihoodRatio [NormedAddCommGroup E] [InnerProductSpace ℝ E] {n : ℕ}
    (x : Fin n → E) (m : E) : ℝ :=
  sSup {r | ∃ w : Fin n → ℝ, (∀ i, 0 ≤ w i) ∧ ∑ i, w i = 1 ∧ ∑ i, w i • x i = m ∧
    r = ∏ i, ((n : ℝ) * w i)}

/-- **7.3** Owen's empirical likelihood theorem for a vector mean whose covariance has rank
`q > 0`. The range of the covariance is the subspace `K`: the centred observation lies in `K`
almost surely and has positive variance in every nonzero direction of `K`; then `q = dim K`. -/
theorem tendstoInDistribution_empiricalLikelihood (μ : Measure Ω) [IsProbabilityMeasure μ]
    {d : ℕ} (P : Measure (EuclideanSpace ℝ (Fin d))) [IsProbabilityMeasure P]
    (X : ℕ → Ω → EuclideanSpace ℝ (Fin d)) (hiid : IsIndependentIdenticallyDistributed μ X P)
    (h2 : MemLp id 2 P) (K : Submodule ℝ (EuclideanSpace ℝ (Fin d)))
    (hK : ∀ᵐ x ∂P, x - ∫ y, y ∂P ∈ K)
    (hKvar : ∀ u ∈ K, u ≠ 0 → 0 < Var[fun x ↦ inner ℝ u x; P]) (hq : 0 < Module.finrank ℝ K) :
    TendstoInDistribution
      (fun (n : ℕ) ω ↦ -2 * Real.log (empiricalLikelihoodRatio (sample X n ω) (∫ x, x ∂P)))
      atTop id (fun _ ↦ μ) (TauCeti.Probability.chiSquaredMeasure (Module.finrank ℝ K)) := sorry

/-- **7.3** Empirical likelihood for estimating equations: if `E m(X, θ₀) = 0` and the covariance
of `m(X, θ₀)` has rank `q > 0`, with range `K`, then `-2 log R(θ₀) → χ²_q`, where `R(θ₀)` is the
empirical likelihood ratio of the vectors `m(Xᵢ, θ₀)` at `0`. -/
theorem tendstoInDistribution_empiricalLikelihood_estimatingEquation [MeasurableSpace E]
    (μ : Measure Ω) [IsProbabilityMeasure μ] (P : Measure E) [IsProbabilityMeasure P]
    (X : ℕ → Ω → E) (hiid : IsIndependentIdenticallyDistributed μ X P) {Θ : Type*} {s : ℕ}
    (m : E → Θ → EuclideanSpace ℝ (Fin s)) (θ₀ : Θ) (hm : Measurable fun x ↦ m x θ₀)
    (h2 : MemLp (fun x ↦ m x θ₀) 2 P) (h0 : ∫ x, m x θ₀ ∂P = 0)
    (K : Submodule ℝ (EuclideanSpace ℝ (Fin s))) (hK : ∀ᵐ x ∂P, m x θ₀ ∈ K)
    (hKvar : ∀ u ∈ K, u ≠ 0 → 0 < Var[fun x ↦ inner ℝ u (m x θ₀); P])
    (hq : 0 < Module.finrank ℝ K) :
    TendstoInDistribution
      (fun (n : ℕ) ω ↦ -2 * Real.log (empiricalLikelihoodRatio (fun i : Fin n ↦ m (X i ω) θ₀) 0))
      atTop id (fun _ ↦ μ) (TauCeti.Probability.chiSquaredMeasure (Module.finrank ℝ K)) := sorry

end Layer7

/-! ## Layer 8: second-order accuracy of the studentized bootstrap -/

section Layer8

variable {Ω : Type*} [MeasurableSpace Ω]

/-- **8.2** The bootstrap Edgeworth expansion of the studentized statistic `T*` and of the
standardized statistic `S*`, and the bootstrap Cornish–Fisher expansion of the quantiles of `T*`,
under the hypotheses of 8.1. The polynomials `p` and `q` are those of 4.5 for `S` and `T`, pinned
by their expansions of order `j`; for each sample `x` the polynomials `p̂ n x` and `q̂ n x` are
within `O_P(n^{-1/2})` of them coefficientwise. On an event of probability at least
`1 - C n^{-λ}` the bootstrap distribution functions are within `C n^{-(j+1)/2}` of the Edgeworth
approximations built from `p̂` and `q̂`, and the bootstrap `α`-quantile of `T*` is within
`C n⁻¹` of `zₐ - n^{-1/2} q̂₁(zₐ)` for every `α ∈ [ε, 1 - ε]`. -/
theorem bootstrap_edgeworth_expansion (μ : Measure Ω) [IsProbabilityMeasure μ]
    {d : ℕ} (P : Measure (EuclideanSpace ℝ (Fin d))) [IsProbabilityMeasure P]
    (X : ℕ → Ω → EuclideanSpace ℝ (Fin d)) (hiid : IsIndependentIdenticallyDistributed μ X P)
    (hmom : ∀ k : ℕ, Integrable (fun x ↦ ‖x‖ ^ k) P)
    (hcr : SatisfiesCramerCondition (P.map augmentedVector))
    (g : EuclideanSpace ℝ (Fin d) → ℝ) (hgm : Measurable g)
    (hg : ∃ U ∈ 𝓝 (∫ x, x ∂P), ContDiffOn ℝ ⊤ g U)
    (hσ : 0 < Var[fun x ↦ fderiv ℝ g (∫ y, y ∂P) x; P]) (j : ℕ) (hj : 1 ≤ j) (lam : ℝ)
    (hlam : 0 < lam) (ε : ℝ) (hε : ε ∈ Ioo 0 (1 / 2)) :
    let θ := g (∫ x, x ∂P)
    let σ := Real.sqrt (Var[fun x ↦ fderiv ℝ g (∫ y, y ∂P) x; P])
    let S := fun (n : ℕ) (x : Fin n → EuclideanSpace ℝ (Fin d)) ↦
      Real.sqrt n * (g (sampleMean x) - θ) / σ
    let T := fun (n : ℕ) (x : Fin n → EuclideanSpace ℝ (Fin d)) ↦
      Real.sqrt n * (g (sampleMean x) - θ) / Real.sqrt (pluginVariance g x)
    let Sstar := fun (n : ℕ) (x y : Fin n → EuclideanSpace ℝ (Fin d)) ↦
      Real.sqrt n * (g (sampleMean y) - g (sampleMean x)) / Real.sqrt (pluginVariance g x)
    let Tstar := fun (n : ℕ) (x y : Fin n → EuclideanSpace ℝ (Fin d)) ↦
      Real.sqrt n * (g (sampleMean y) - g (sampleMean x)) / Real.sqrt (pluginVariance g y)
    let z := fun α : ℝ ↦ (gaussianReal 0 1).quantile α
    ∃ p q : ℕ → Polynomial ℝ,
      ∃ phat qhat : (n : ℕ) → (Fin n → EuclideanSpace ℝ (Fin d)) → ℕ → Polynomial ℝ,
      ∃ C : ℝ,
      (∃ e : ℕ → ℝ, Tendsto (fun n : ℕ ↦ (n : ℝ) ^ ((j : ℝ) / 2) * e n) atTop (𝓝 0) ∧
        ∀ n : ℕ, 1 ≤ n → ∀ x : ℝ,
          |μ.real {ω | S n (sample X n ω) ≤ x} - edgeworthApproximation p j n x| ≤ e n ∧
          |μ.real {ω | T n (sample X n ω) ≤ x} - edgeworthApproximation q j n x| ≤ e n) ∧
      (∀ n : ℕ, 1 ≤ n → μ.real {ω | ¬ ((∀ x : ℝ,
          |cdf (bootstrapLaw n n (Sstar n) (sample X n ω)) x -
              edgeworthApproximation (phat n (sample X n ω)) j n x| ≤
            C * (n : ℝ) ^ (-((j : ℝ) + 1) / 2) ∧
          |cdf (bootstrapLaw n n (Tstar n) (sample X n ω)) x -
              edgeworthApproximation (qhat n (sample X n ω)) j n x| ≤
            C * (n : ℝ) ^ (-((j : ℝ) + 1) / 2)) ∧
        ∀ α ∈ Icc ε (1 - ε),
          |(bootstrapLaw n n (Tstar n) (sample X n ω)).quantile α -
              (z α - (Real.sqrt n)⁻¹ * (qhat n (sample X n ω) 1).eval (z α))| ≤
            C * (n : ℝ)⁻¹)} ≤ C * (n : ℝ) ^ (-lam)) ∧
      ∀ r k : ℕ,
        IsBoundedInProbability μ (fun n ω ↦
          Real.sqrt n * ((phat n (sample X n ω) r).coeff k - (p r).coeff k)) ∧
        IsBoundedInProbability μ (fun n ω ↦
          Real.sqrt n * ((qhat n (sample X n ω) r).coeff k - (q r).coeff k)) := sorry

/-- **8.3–8.4** Second-order accuracy of the studentized bootstrap: the bootstrap law of
`T* = √n (θ̂* - θ̂)/σ̂*` is within `O_P(n⁻¹)` of the law of `T = √n (θ̂ - θ)/σ̂` in Kolmogorov
distance, and the one-sided percentile-`t` interval has coverage `1 - α + O(n⁻¹)`. -/
theorem studentized_bootstrap_second_order_accuracy (μ : Measure Ω) [IsProbabilityMeasure μ]
    {d : ℕ} (P : Measure (EuclideanSpace ℝ (Fin d))) [IsProbabilityMeasure P]
    (X : ℕ → Ω → EuclideanSpace ℝ (Fin d)) (hiid : IsIndependentIdenticallyDistributed μ X P)
    (hmom : ∀ k : ℕ, Integrable (fun x ↦ ‖x‖ ^ k) P)
    (hcr : SatisfiesCramerCondition (P.map augmentedVector))
    (g : EuclideanSpace ℝ (Fin d) → ℝ) (hgm : Measurable g)
    (hg : ∃ U ∈ 𝓝 (∫ x, x ∂P), ContDiffOn ℝ ⊤ g U)
    (hσ : 0 < Var[fun x ↦ fderiv ℝ g (∫ y, y ∂P) x; P]) (α : ℝ) (hα : α ∈ Ioo 0 (1 / 2)) :
    let θ := g (∫ x, x ∂P)
    let T := fun (n : ℕ) (x : Fin n → EuclideanSpace ℝ (Fin d)) ↦
      Real.sqrt n * (g (sampleMean x) - θ) / Real.sqrt (pluginVariance g x)
    let Tstar := fun (n : ℕ) (x y : Fin n → EuclideanSpace ℝ (Fin d)) ↦
      Real.sqrt n * (g (sampleMean y) - g (sampleMean x)) / Real.sqrt (pluginVariance g y)
    let L := fun (n : ℕ) (ω : Ω) ↦ bootstrapLaw n n (Tstar n) (sample X n ω)
    let v := fun (n : ℕ) (ω : Ω) ↦ (L n ω).quantile α
    IsBoundedInProbability μ (fun n ω ↦ (n : ℝ) *
        kolmogorovDist (L n ω) (μ.map fun ω' ↦ T n (sample X n ω'))) ∧
      (fun n : ℕ ↦ μ.real {ω | θ ≤ g (sampleMean (sample X n ω)) -
          (Real.sqrt n)⁻¹ * Real.sqrt (pluginVariance g (sample X n ω)) * v n ω} - (1 - α))
        =O[atTop] (fun n : ℕ ↦ (n : ℝ)⁻¹) := sorry

/-- **8.4** Coverage of the normal-theory and percentile intervals, one-sided and two-sided, and
of the two-sided percentile-`t` interval, under the hypotheses of 8.1. The polynomials `p` and
`q` are those of 4.5 for `S` and `T`, pinned by their expansions of order `2`. The one-sided
normal-theory and percentile intervals have coverage errors `-n^{-1/2} q₁(zₐ) φ(zₐ)` and
`-n^{-1/2} (p₁ + q₁)(zₐ) φ(zₐ)` up to `O(n⁻¹)`; the three equal-tailed two-sided intervals have
coverage `1 - 2α + O(n⁻¹)`. -/
theorem bootstrap_interval_coverage (μ : Measure Ω) [IsProbabilityMeasure μ]
    {d : ℕ} (P : Measure (EuclideanSpace ℝ (Fin d))) [IsProbabilityMeasure P]
    (X : ℕ → Ω → EuclideanSpace ℝ (Fin d)) (hiid : IsIndependentIdenticallyDistributed μ X P)
    (hmom : ∀ k : ℕ, Integrable (fun x ↦ ‖x‖ ^ k) P)
    (hcr : SatisfiesCramerCondition (P.map augmentedVector))
    (g : EuclideanSpace ℝ (Fin d) → ℝ) (hgm : Measurable g)
    (hg : ∃ U ∈ 𝓝 (∫ x, x ∂P), ContDiffOn ℝ ⊤ g U)
    (hσ : 0 < Var[fun x ↦ fderiv ℝ g (∫ y, y ∂P) x; P]) (α : ℝ) (hα : α ∈ Ioo 0 (1 / 2)) :
    let θ := g (∫ x, x ∂P)
    let σ := Real.sqrt (Var[fun x ↦ fderiv ℝ g (∫ y, y ∂P) x; P])
    let θhat := fun (n : ℕ) (ω : Ω) ↦ g (sampleMean (sample X n ω))
    let se := fun (n : ℕ) (ω : Ω) ↦
      (Real.sqrt n)⁻¹ * Real.sqrt (pluginVariance g (sample X n ω))
    let S := fun (n : ℕ) (x : Fin n → EuclideanSpace ℝ (Fin d)) ↦
      Real.sqrt n * (g (sampleMean x) - θ) / σ
    let T := fun (n : ℕ) (x : Fin n → EuclideanSpace ℝ (Fin d)) ↦
      Real.sqrt n * (g (sampleMean x) - θ) / Real.sqrt (pluginVariance g x)
    let Tstar := fun (n : ℕ) (x y : Fin n → EuclideanSpace ℝ (Fin d)) ↦
      Real.sqrt n * (g (sampleMean y) - g (sampleMean x)) / Real.sqrt (pluginVariance g y)
    let v := fun (n : ℕ) (ω : Ω) (β : ℝ) ↦
      (bootstrapLaw n n (Tstar n) (sample X n ω)).quantile β
    let c := fun (n : ℕ) (ω : Ω) (β : ℝ) ↦
      (bootstrapLaw n n (fun _ y ↦ g (sampleMean y)) (sample X n ω)).quantile β
    let z := fun β : ℝ ↦ (gaussianReal 0 1).quantile β
    let φ := gaussianPDFReal 0 1
    ∃ p q : ℕ → Polynomial ℝ,
      (∃ e : ℕ → ℝ, Tendsto (fun n : ℕ ↦ (n : ℝ) * e n) atTop (𝓝 0) ∧
        ∀ n : ℕ, 1 ≤ n → ∀ x : ℝ,
          |μ.real {ω | S n (sample X n ω) ≤ x} - edgeworthApproximation p 2 n x| ≤ e n ∧
          |μ.real {ω | T n (sample X n ω) ≤ x} - edgeworthApproximation q 2 n x| ≤ e n) ∧
      (fun n : ℕ ↦ μ.real {ω | θ ≤ θhat n ω - se n ω * z α} -
          (1 - α - (Real.sqrt n)⁻¹ * (q 1).eval (z α) * φ (z α)))
        =O[atTop] (fun n : ℕ ↦ (n : ℝ)⁻¹) ∧
      (fun n : ℕ ↦ μ.real {ω | θ ≤ c n ω (1 - α)} -
          (1 - α - (Real.sqrt n)⁻¹ * ((p 1).eval (z α) + (q 1).eval (z α)) * φ (z α)))
        =O[atTop] (fun n : ℕ ↦ (n : ℝ)⁻¹) ∧
      (fun n : ℕ ↦ μ.real {ω | θhat n ω - se n ω * z (1 - α) ≤ θ ∧
          θ ≤ θhat n ω - se n ω * z α} - (1 - 2 * α))
        =O[atTop] (fun n : ℕ ↦ (n : ℝ)⁻¹) ∧
      (fun n : ℕ ↦ μ.real {ω | c n ω α ≤ θ ∧ θ ≤ c n ω (1 - α)} - (1 - 2 * α))
        =O[atTop] (fun n : ℕ ↦ (n : ℝ)⁻¹) ∧
      (fun n : ℕ ↦ μ.real {ω | θhat n ω - se n ω * v n ω (1 - α) ≤ θ ∧
          θ ≤ θhat n ω - se n ω * v n ω α} - (1 - 2 * α))
        =O[atTop] (fun n : ℕ ↦ (n : ℝ)⁻¹) := sorry

end Layer8

/-! ## Layer 9: Čencov's theorem -/

section Layer9

/-- **9.1** The open probability simplex `S_m`. -/
def openSimplex (m : ℕ) : Set (Fin m → ℝ) := {p | (∀ i, 0 < p i) ∧ ∑ i, p i = 1}

/-- **9.1** Tangent vectors to the simplex: `∑ uᵢ = 0`. -/
def simplexTangent (m : ℕ) : Submodule ℝ (Fin m → ℝ) :=
  LinearMap.ker (∑ i, LinearMap.proj (R := ℝ) (φ := fun _ : Fin m ↦ ℝ) i)

/-- **9.1** The Fisher–Rao metric `∑ uᵢ vᵢ / pᵢ`. -/
def fisherRao {m : ℕ} (p u v : Fin m → ℝ) : ℝ := ∑ i, u i * v i / p i

/-- **9.1** The Amari–Chentsov tensor `∑ uᵢ vᵢ wᵢ / pᵢ²`. -/
def amariChentsov {m : ℕ} (p u v w : Fin m → ℝ) : ℝ := ∑ i, u i * v i * w i / p i ^ 2

/-- **9.1** A congruent embedding `S_m → S_n`: a surjection `block : Fin n → Fin m` onto the
blocks and positive weights `q` summing to `1` on each block. -/
structure CongruentEmbedding (m n : ℕ) where
  block : Fin n → Fin m
  surjective : Function.Surjective block
  q : Fin n → ℝ
  q_pos : ∀ j, 0 < q j
  sum_q : ∀ i, ∑ j ∈ Finset.univ.filter (fun j ↦ block j = i), q j = 1

/-- **9.1** The linear map `p ↦ (p (block j) * q j)_j` of a congruent embedding. -/
def CongruentEmbedding.toLinearMap {m n : ℕ} (e : CongruentEmbedding m n) :
    (Fin m → ℝ) →ₗ[ℝ] (Fin n → ℝ) where
  toFun p j := p (e.block j) * e.q j
  map_add' p p' := by ext j; simp [add_mul]
  map_smul' c p := by ext j; simp [mul_assoc]

/-- **9.1** Invariance of the Fisher–Rao metric under congruent embeddings. -/
theorem fisherRao_congruentEmbedding {m n : ℕ} (e : CongruentEmbedding m n) {p u v : Fin m → ℝ}
    (hp : p ∈ openSimplex m) (hu : u ∈ simplexTangent m) (hv : v ∈ simplexTangent m) :
    fisherRao (e.toLinearMap p) (e.toLinearMap u) (e.toLinearMap v) = fisherRao p u v := sorry

/-- **9.1** Invariance of the Amari–Chentsov tensor under congruent embeddings. -/
theorem amariChentsov_congruentEmbedding {m n : ℕ} (e : CongruentEmbedding m n)
    {p u v w : Fin m → ℝ} (hp : p ∈ openSimplex m) (hu : u ∈ simplexTangent m)
    (hv : v ∈ simplexTangent m) (hw : w ∈ simplexTangent m) :
    amariChentsov (e.toLinearMap p) (e.toLinearMap u) (e.toLinearMap v) (e.toLinearMap w) =
      amariChentsov p u v w := sorry

/-- **9.2** Čencov's theorem: a family of bilinear forms on the tangent spaces of the simplices,
continuous in the base point and invariant under all congruent embeddings, is a constant multiple
of the Fisher–Rao metric. -/
theorem exists_eq_smul_fisherRao_of_invariant
    (h : (m : ℕ) → (Fin m → ℝ) → LinearMap.BilinForm ℝ (Fin m → ℝ))
    (hcont : ∀ m (u v : Fin m → ℝ), ContinuousOn (fun p ↦ h m p u v) (openSimplex m))
    (hinv : ∀ m n (e : CongruentEmbedding m n), ∀ p ∈ openSimplex m,
      ∀ u ∈ simplexTangent m, ∀ v ∈ simplexTangent m,
        h n (e.toLinearMap p) (e.toLinearMap u) (e.toLinearMap v) = h m p u v) :
    ∃ c : ℝ, ∀ m, 2 ≤ m → ∀ p ∈ openSimplex m, ∀ u ∈ simplexTangent m,
      ∀ v ∈ simplexTangent m, h m p u v = c * fisherRao p u v := sorry

/-- **9.2** For invariant continuous Riemannian metrics the constant is positive. -/
theorem exists_pos_eq_smul_fisherRao_of_invariant_metric
    (h : (m : ℕ) → (Fin m → ℝ) → LinearMap.BilinForm ℝ (Fin m → ℝ))
    (hcont : ∀ m (u v : Fin m → ℝ), ContinuousOn (fun p ↦ h m p u v) (openSimplex m))
    (hpos : ∀ m, ∀ p ∈ openSimplex m, ∀ u ∈ simplexTangent m, u ≠ 0 → 0 < h m p u u)
    (hinv : ∀ m n (e : CongruentEmbedding m n), ∀ p ∈ openSimplex m,
      ∀ u ∈ simplexTangent m, ∀ v ∈ simplexTangent m,
        h n (e.toLinearMap p) (e.toLinearMap u) (e.toLinearMap v) = h m p u v) :
    ∃ c > 0, ∀ m, 2 ≤ m → ∀ p ∈ openSimplex m, ∀ u ∈ simplexTangent m,
      ∀ v ∈ simplexTangent m, h m p u v = c * fisherRao p u v := sorry

/-- **9.3** A family of trilinear forms on the tangent spaces, continuous in the base point and
invariant under all congruent embeddings, is a constant multiple of the Amari–Chentsov tensor. -/
theorem exists_eq_smul_amariChentsov_of_invariant
    (h : (m : ℕ) → (Fin m → ℝ) →
      (Fin m → ℝ) →ₗ[ℝ] (Fin m → ℝ) →ₗ[ℝ] (Fin m → ℝ) →ₗ[ℝ] ℝ)
    (hcont : ∀ m (u v w : Fin m → ℝ), ContinuousOn (fun p ↦ h m p u v w) (openSimplex m))
    (hinv : ∀ m n (e : CongruentEmbedding m n), ∀ p ∈ openSimplex m,
      ∀ u ∈ simplexTangent m, ∀ v ∈ simplexTangent m, ∀ w ∈ simplexTangent m,
        h n (e.toLinearMap p) (e.toLinearMap u) (e.toLinearMap v) (e.toLinearMap w) =
          h m p u v w) :
    ∃ c : ℝ, ∀ m, 2 ≤ m → ∀ p ∈ openSimplex m, ∀ u ∈ simplexTangent m,
      ∀ v ∈ simplexTangent m, ∀ w ∈ simplexTangent m,
        h m p u v w = c * amariChentsov p u v w := sorry

end Layer9

/-! ## Supplier names cited in the README -/

#check @ProbabilityTheory.tendstoInDistribution_inv_sqrt_mul_sum_sub
#check @ProbabilityTheory.strong_law_ae
#check @tendstoInDistribution_iff_tendstoInDistribution_inner
#check @Polynomial.hermite
#check @MeasureTheory.tvDist
#check @MeasureTheory.Measure.map
#check @MeasureTheory.Measure.infinitePi
#check @MeasureTheory.Measure.withDensity
#check @ProbabilityTheory.Kernel.comap
#check @ProbabilityTheory.Kernel.map
#check @ProbabilityTheory.condDistrib_ae_eq_of_measure_eq_compProd
#check @MeasureTheory.Measure.eq_of_cdf
#check @ProbabilityTheory.charFun_gaussianReal
#check @MeasureTheory.norm_charFun_le_one
#check @MeasureTheory.continuous_charFun
#check @MeasureTheory.contDiff_charFun
#check @MeasureTheory.taylor_charFun_two
#check @tendsto_integral_exp_inner_smul_cocompact
#check @MeasureTheory.Measure.tilted
#check @ProbabilityTheory.integral_tilted_mul_self
#check @ProbabilityTheory.variance_tilted_mul
#check @Real.tendsto_one_add_div_pow_exp
#check @IsSigmaCompact.image
#check @MeasureTheory.TendstoInMeasure
#check @MeasureTheory.Measure.charFunDensity
#check @MeasureTheory.Measure.continuous_charFunDensity
#check @MeasureTheory.Measure.eq_withDensity_charFunDensity
#check @TauCeti.Probability.empiricalMeasureOfFintype
#check @TauCeti.Probability.measurable_empiricalMeasureOfFintype
#check @TauCeti.Probability.empiricalMeasureOfFintype_eq_map_uniformOn
#check @TauCeti.Probability.integral_empiricalMeasureOfFintype
#check @TauCeti.MeasureTheory.iidBlockKernel
#check @TauCeti.MeasureTheory.iidBlockKernel_apply
#check @TauCeti.MeasureTheory.measurable_probabilityMeasure_pi_const_toMeasure
#check @TauCeti.Probability.pi_empiricalMeasureOfFintype_eq_map_uniformOn
#check @TauCeti.tendsto_probabilityMeasure_iff_iSup_abs_integral_sub_integral_boundedLipschitz
#check @TauCeti.mgf_tilted_mul
#check @TauCeti.cgf_tilted_mul
#check @MeasureTheory.Measure.continuous_cdf_of_noAtoms
#check @MeasureTheory.Measure.quantile
#check @MeasureTheory.Measure.measurePreserving_quantile
#check @TauCeti.Probability.chiSquaredMeasure
#check @TauCeti.Probability.isProbabilityMeasure_chiSquaredMeasure
#check @MeasureTheory.Measure.leftLim_cdf
#check @Convexity.StdSimplex
#check @Polynomial.deriv_gaussian_eq_hermite_mul_gaussian
#check @Polynomial.hermite_succ

end TauCetiRoadmap.MathematicalStatisticsHigherOrderAndResampling
