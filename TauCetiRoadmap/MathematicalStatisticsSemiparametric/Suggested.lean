module

public import Mathlib
public import TauCeti.Probability.Quantile
public import TauCeti.Probability.Moments.SampleMean
public import TauCeti.Probability.Moments.Mixture

/-!
# Semiparametric statistics and missing data: target signatures

This file is not the roadmap: the roadmap is `README.md`, and this file is not an exhaustive
checklist. It states, against the pinned Mathlib and Tau Ceti and each with `sorry`, the
headlines of the README that carry a Lean name, each with every conclusion the README attaches
to it, together with the definitions their statements need. The headlines of the README without
a Lean name are those whose carrier is missing at the pins:
- the parametric paths of 2.1, which need differentiability in quadratic mean of parametric
  densities within a set of parameters, owned by `MathematicalStatisticsAsymptotic` 7.3 and not
  in the pinned Tau Ceti.

The other bullets without a Lean name record facts about a single definition (the membership
criterion of `meanZeroL2`, the monotonicity and closedness properties of `tangentSpace`, the
orthogonality of `efficientScore` to the nuisance scores, the form of `aipwScore` on observed
data, the measurability of `observe` and the mass of `missingLaw`); these are API lemmas, not
headlines.

The conventions of the README are used throughout: scores and influence functions live in
Mathlib's `Lp ℝ 2 P`, tangent spaces are closed submodules of it, a differentiable path is
differentiable in quadratic mean from the right at `0` relative to a σ-finite dominating
measure, and samples of size `n` are points of `Fin n → X` with law `Measure.pi`. The
implementation namespace of the README is `TauCeti`; the prototypes live in this roadmap's
namespace. Definitions owned by `MathematicalStatisticsFoundations` or
`MathematicalStatisticsAsymptotic` appear as local copies, each marked with its owner.
-/

@[expose] public section

noncomputable section

open MeasureTheory ProbabilityTheory Filter Set Topology
open scoped ENNReal NNReal BoundedContinuousFunction

namespace TauCetiRoadmap.MathematicalStatisticsSemiparametric

attribute [local instance] Classical.propDecidable

/-! ## Local copies of definitions owned elsewhere -/

section LocalCopies

/-- Local copy. Owner: `MathematicalStatisticsFoundations` 8.5. An independent identically
distributed family with common law `P`. -/
def IsIndependentIdenticallyDistributed {Ω E ι : Type*} [MeasurableSpace Ω] [MeasurableSpace E]
    (μ : Measure Ω) (X : ι → Ω → E) (P : Measure E) : Prop :=
  (∀ i, Measurable (X i)) ∧ iIndepFun X μ ∧ ∀ i, μ.map (X i) = P

/-- Local copy. Owner: `MathematicalStatisticsAsymptotic` 1.1 (convergence in probability on
varying spaces). Convergence in probability to a constant along a filter, on probability spaces
that vary with the index; sets are measured by the outer measure. -/
def TendstoInProbability {ι : Type*} {Ω : ι → Type*} [∀ i, MeasurableSpace (Ω i)]
    (μ : ∀ i, Measure (Ω i)) {E : Type*} [PseudoMetricSpace E] (X : ∀ i, Ω i → E)
    (l : Filter ι) (c : E) : Prop :=
  ∀ ε > 0, Tendsto (fun i ↦ μ i {ω | ε ≤ dist (X i ω) c}) l (𝓝 0)

end LocalCopies

/-! ## Layer 1: Hilbert geometry of scores -/

section Layer1

variable {X : Type*} [MeasurableSpace X] (P : Measure X) [IsProbabilityMeasure P]

/-- **1.1** The closed subspace `L²₀(P)` of mean-zero elements, the orthogonal complement of the
constants. -/
def meanZeroL2 : Submodule ℝ (Lp ℝ 2 P) :=
  (Submodule.span ℝ {Lp.const 2 P (1 : ℝ)})ᗮ

/-- **1.1** `L²(P)` is the direct sum of the constants and `L²₀(P)`; the projection onto
`L²₀(P)` subtracts the mean, and the squared norm of the projection is the variance. -/
theorem starProjection_meanZeroL2 :
    IsCompl (Submodule.span ℝ {Lp.const 2 P (1 : ℝ)}) (meanZeroL2 P) ∧
      ∀ f : Lp ℝ 2 P, (Submodule.span ℝ {Lp.const 2 P (1 : ℝ)})ᗮ.starProjection f =
          f - Lp.const 2 P (∫ x, f x ∂P) ∧
        ‖f - Lp.const 2 P (∫ x, f x ∂P)‖ ^ 2 = variance f P := sorry

/-- **1.1** Bounded mean-zero elements are dense in `L²₀(P)`. -/
theorem meanZeroL2_subset_closure_bounded :
    (meanZeroL2 P : Set (Lp ℝ 2 P)) ⊆
      closure {u | u ∈ meanZeroL2 P ∧ ∃ C, ∀ᵐ x ∂P, |u x| ≤ C} := sorry

/-- **1.1** On a normal space with its Borel σ-algebra and a weakly regular `P`, bounded
continuous mean-zero functions are dense in `L²₀(P)`. -/
theorem meanZeroL2_subset_closure_boundedContinuous [TopologicalSpace X] [NormalSpace X]
    [BorelSpace X] [P.WeaklyRegular] :
    (meanZeroL2 P : Set (Lp ℝ 2 P)) ⊆
      closure {u | u ∈ meanZeroL2 P ∧ ∃ g : X →ᵇ ℝ, (u : X → ℝ) =ᵐ[P] g} := sorry

/-- **1.2** The tangent space of a tangent set: the closure of its linear span. -/
def tangentSpace (T : Set (Lp ℝ 2 P)) : ClosedSubmodule ℝ (Lp ℝ 2 P) where
  __ := (Submodule.span ℝ T).topologicalClosure
  isClosed' := (Submodule.span ℝ T).isClosed_topologicalClosure

/-- **1.2** The tangent space of a union is the closure of the sum; for orthogonal tangent spaces
it is the sum, and the projections add. -/
theorem tangentSpace_union (T T' : Set (Lp ℝ 2 P)) :
    (tangentSpace P (T ∪ T')).toSubmodule =
        ((tangentSpace P T).toSubmodule ⊔ (tangentSpace P T').toSubmodule).topologicalClosure ∧
      ((tangentSpace P T).toSubmodule.IsOrtho (tangentSpace P T').toSubmodule →
        (tangentSpace P (T ∪ T')).toSubmodule =
            (tangentSpace P T).toSubmodule ⊔ (tangentSpace P T').toSubmodule ∧
          (tangentSpace P (T ∪ T')).toSubmodule.starProjection =
            (tangentSpace P T).toSubmodule.starProjection +
              (tangentSpace P T').toSubmodule.starProjection) := sorry

/-- **1.3** The efficient score: the residual of `ℓ` after orthogonal projection onto the
nuisance tangent space generated by `N`. -/
def efficientScore (N : Set (Lp ℝ 2 P)) (ℓ : Lp ℝ 2 P) : Lp ℝ 2 P :=
  ℓ - (tangentSpace P N).toSubmodule.starProjection ℓ

/-- **1.3** The efficient information matrix `Ĩᵢⱼ = ⟪ℓ̃ᵢ, ℓ̃ⱼ⟫` of a vector of scores. -/
def efficientInformationMatrix {k : ℕ} (N : Set (Lp ℝ 2 P)) (ℓ : Fin k → Lp ℝ 2 P) :
    Matrix (Fin k) (Fin k) ℝ :=
  fun i j ↦ inner ℝ (efficientScore P N (ℓ i)) (efficientScore P N (ℓ j))

/-- **1.3** The information matrix `Iᵢⱼ = ⟪ℓᵢ, ℓⱼ⟫` of a vector of scores. -/
def informationMatrix {k : ℕ} (ℓ : Fin k → Lp ℝ 2 P) : Matrix (Fin k) (Fin k) ℝ :=
  fun i j ↦ inner ℝ (ℓ i) (ℓ j)

/-- **1.3** Information loss: `I - Ĩ` is positive semidefinite, and it vanishes iff every
score is orthogonal to the nuisance scores. -/
theorem posSemidef_informationMatrix_sub_efficient {k : ℕ} (N : Set (Lp ℝ 2 P))
    (ℓ : Fin k → Lp ℝ 2 P) :
    (informationMatrix P ℓ - efficientInformationMatrix P N ℓ).PosSemidef ∧
      (efficientInformationMatrix P N ℓ = informationMatrix P ℓ ↔
        ∀ i, ∀ g ∈ N, inner ℝ g (ℓ i) = 0) := sorry

/-- **1.3** Enlarging the nuisance scores can only lower the efficient information. -/
theorem posSemidef_efficientInformationMatrix_sub_of_subset {k : ℕ} {N N' : Set (Lp ℝ 2 P)}
    (h : N ⊆ N') (ℓ : Fin k → Lp ℝ 2 P) :
    (efficientInformationMatrix P N ℓ - efficientInformationMatrix P N' ℓ).PosSemidef := sorry

/-- **1.3** The efficient information matrix is positive definite iff the efficient scores are
linearly independent. -/
theorem posDef_efficientInformationMatrix_iff {k : ℕ} (N : Set (Lp ℝ 2 P))
    (ℓ : Fin k → Lp ℝ 2 P) :
    (efficientInformationMatrix P N ℓ).PosDef ↔
      LinearIndependent ℝ fun i ↦ efficientScore P N (ℓ i) := sorry

variable {Y : Type*} [MeasurableSpace Y]

/-- **1.4** Composition with a measurable map `m`, as an isometry
`L²(η.map m) → L²(η)`. -/
def pullbackL2 (η : Measure Y) [IsProbabilityMeasure η] (m : Y → X) (hm : Measurable m) :
    Lp ℝ 2 (η.map m) →L[ℝ] Lp ℝ 2 η :=
  (Lp.compMeasurePreservingₗᵢ ℝ m (hm.measurePreserving η)).toContinuousLinearMap

/-- **1.4** The conditional expectation operator `L²(η) → L²(η.map m)` given `m`, defined as
the adjoint of `pullbackL2`. -/
def condExpOperator (η : Measure Y) [IsProbabilityMeasure η] (m : Y → X) (hm : Measurable m) :
    Lp ℝ 2 η →L[ℝ] Lp ℝ 2 (η.map m) :=
  ContinuousLinearMap.adjoint (pullbackL2 η m hm)

/-- **1.4** `condExpOperator` is the conditional expectation given `m`, read on the sample
space of `m`. -/
theorem pullbackL2_condExpOperator_ae_eq (η : Measure Y) [IsProbabilityMeasure η] (m : Y → X)
    (hm : Measurable m) (b : Lp ℝ 2 η) :
    (pullbackL2 η m hm (condExpOperator η m hm b) : Y → ℝ) =ᵐ[η]
      η[(b : Y → ℝ) | MeasurableSpace.comap m inferInstance] := sorry

/-- **1.4** `condExpOperator` is a left inverse of the pullback, hence onto; it is a contraction,
and it maps `L²₀(η)` onto `L²₀(η.map m)`. -/
theorem condExpOperator_comp_pullbackL2 (η : Measure Y) [IsProbabilityMeasure η] (m : Y → X)
    (hm : Measurable m) [IsProbabilityMeasure (η.map m)] :
    condExpOperator η m hm ∘L pullbackL2 η m hm = ContinuousLinearMap.id ℝ _ ∧
      Function.Surjective (condExpOperator η m hm) ∧ ‖condExpOperator η m hm‖ ≤ 1 ∧
      (meanZeroL2 η).map (condExpOperator η m hm : Lp ℝ 2 η →ₗ[ℝ] Lp ℝ 2 (η.map m)) =
        meanZeroL2 (η.map m) := sorry

/-- **1.4** The projection onto the closed range of a score operator `A` with continuously
invertible information operator `A† A` is `A (A† A)⁻¹ A†`. -/
theorem starProjection_closure_range_eq {H : Type*} [NormedAddCommGroup H]
    [InnerProductSpace ℝ H] [CompleteSpace H] (A : H →L[ℝ] Lp ℝ 2 P)
    (hA : IsUnit (ContinuousLinearMap.adjoint A ∘L A)) :
    (tangentSpace P (Set.range A)).toSubmodule.starProjection =
      A ∘L Ring.inverse (ContinuousLinearMap.adjoint A ∘L A) ∘L ContinuousLinearMap.adjoint A :=
  sorry

/-- **1.4** A score operator with continuously invertible information operator has closed
range. -/
theorem isClosed_range_of_isUnit_adjoint_comp {H : Type*} [NormedAddCommGroup H]
    [InnerProductSpace ℝ H] [CompleteSpace H] (A : H →L[ℝ] Lp ℝ 2 P)
    (hA : IsUnit (ContinuousLinearMap.adjoint A ∘L A)) : IsClosed (Set.range A) := sorry

end Layer1

/-! ## Layer 2: differentiable paths -/

section Layer2

variable {X : Type*} [MeasurableSpace X]

/-- **2.1** The path `t ↦ Q t` is differentiable in quadratic mean at `0` from the right with
score `g`, relative to the σ-finite measure `ν` dominating every `Q t`. The remainder is
measured by `eLpNorm`, so that a non-square-integrable remainder is never small. -/
def HasPathScore (ν : Measure X) [SigmaFinite ν] (Q : ℝ → Measure X) (g : X → ℝ) : Prop :=
  (∀ t, Q t ≪ ν) ∧
    Tendsto (fun t : ℝ ↦ ENNReal.ofReal t⁻¹ * eLpNorm (fun x ↦
        Real.sqrt ((Q t).rnDeriv ν x).toReal - Real.sqrt ((Q 0).rnDeriv ν x).toReal
          - t / 2 * g x * Real.sqrt ((Q 0).rnDeriv ν x).toReal) 2 ν) (𝓝[>] 0) (𝓝 0)

/-- **2.1** A measurable path score is square integrable with mean zero under `Q 0` (van der
Vaart, Lemma 25.14, first assertion). -/
theorem HasPathScore.memLp_integral_eq_zero {ν : Measure X} [SigmaFinite ν]
    {Q : ℝ → Measure X} [∀ t, IsProbabilityMeasure (Q t)] {g : X → ℝ} (hg : Measurable g)
    (h : HasPathScore ν Q g) : MemLp g 2 (Q 0) ∧ ∫ x, g x ∂Q 0 = 0 := sorry

/-- **2.1** Independence of the dominating measure. -/
theorem hasPathScore_iff_of_absolutelyContinuous {ν ν' : Measure X} [SigmaFinite ν]
    [SigmaFinite ν'] {Q : ℝ → Measure X} [∀ t, IsProbabilityMeasure (Q t)] {g : X → ℝ}
    (hQ : ∀ t, Q t ≪ ν)
    (hQ' : ∀ t, Q t ≪ ν') : HasPathScore ν Q g ↔ HasPathScore ν' Q g := sorry

/-- **2.1** Uniqueness: two measurable path scores of one path agree `Q 0`-a.e. -/
theorem HasPathScore.ae_eq {ν : Measure X} [SigmaFinite ν] {Q : ℝ → Measure X}
    [∀ t, IsProbabilityMeasure (Q t)] {g g' : X → ℝ} (hg : Measurable g) (hg' : Measurable g')
    (h : HasPathScore ν Q g) (h' : HasPathScore ν Q g') : g =ᵐ[Q 0] g' := sorry

/-- **2.1** Location paths (Bickel–Klaassen–Ritov–Wellner, Corollary A.5.1): for a probability
density `η` on `ℝ` that is absolutely continuous, `η x = η 0 + ∫₀ˣ η'`, and of finite Fisher
information `∫ η'² / η`, the path `t ↦ η (x - θ - t) dx` has score `-(η'/η)(x - θ)` relative to
Lebesgue measure. Where `η` vanishes, `η'²/η` and `η'/η` read `0`; this loses nothing, since
`η' = 0` a.e. on `{η = 0}`. -/
theorem hasPathScore_location (η η' : ℝ → ℝ) (hη : ∀ x, 0 ≤ η x) (hη1 : ∫ x, η x = 1)
    (hη' : ∀ a b, IntervalIntegrable η' volume a b)
    (hac : ∀ x, η x = η 0 + ∫ t in (0 : ℝ)..x, η' t)
    (hfisher : Integrable fun x ↦ η' x ^ 2 / η x) (θ : ℝ) :
    HasPathScore volume (fun t ↦ volume.withDensity fun x ↦ ENNReal.ofReal (η (x - (θ + t))))
      (fun x ↦ -(η' (x - θ) / η (x - θ))) := sorry

/-- **2.2** The bounded tilt `dP_t = (1 + t g) dP`, cut off where `1 + t g` could fail to be
positive. -/
def tiltPath (P : Measure X) (g : X → ℝ) (C : ℝ) (t : ℝ) : Measure X :=
  if |t| * C < 1 then P.withDensity (fun x ↦ ENNReal.ofReal (1 + t * g x)) else P

/-- **2.2** A bounded mean-zero `g` is the path score of its tilt. -/
theorem hasPathScore_tiltPath (P : Measure X) [IsProbabilityMeasure P] (g : X → ℝ)
    (hg : Measurable g) (C : ℝ) (hC : ∀ x, |g x| ≤ C) (hmean : ∫ x, g x ∂P = 0) :
    (∀ t, IsProbabilityMeasure (tiltPath P g C t)) ∧ HasPathScore P (tiltPath P g C) g := sorry

/-- **2.2** Every element of `L²₀(P)` is the score of a path through `P` (van der Vaart,
Example 25.16): the path `c(t) k(t g) dP` with `k(x) = 2 / (1 + exp (-2 x))`. -/
theorem exists_hasPathScore_of_mem_meanZeroL2 (P : Measure X) [IsProbabilityMeasure P]
    (g : Lp ℝ 2 P) (hg : g ∈ meanZeroL2 P) :
    ∃ Q : ℝ → Measure X, (∀ t, IsProbabilityMeasure (Q t)) ∧ Q 0 = P ∧
      (∀ t, Q t ≪ P) ∧ HasPathScore P Q g := sorry

/-- **2.2** Information loss (van der Vaart, Lemma 25.34): the image of a differentiable path
under a measurable map is differentiable, with score the conditional expectation of the
original score. -/
theorem hasPathScore_map {Y : Type*} [MeasurableSpace Y] {η : Measure Y}
    [IsProbabilityMeasure η] {Q : ℝ → Measure Y} [∀ t, IsProbabilityMeasure (Q t)]
    (hQ0 : Q 0 = η) (ν : Measure Y) [SigmaFinite ν] (b : Lp ℝ 2 η) (hb : HasPathScore ν Q b)
    (m : Y → X) (hm : Measurable m) (ν' : Measure X) [SigmaFinite ν']
    (hν' : ∀ t, (Q t).map m ≪ ν') :
    HasPathScore ν' (fun t ↦ (Q t).map m) (condExpOperator η m hm b) := sorry

/-- **2.2** Paths in a product: the product of two differentiable paths has score
`g₁ ⊗ 1 + 1 ⊗ g₂`. -/
theorem HasPathScore.prod {Y : Type*} [MeasurableSpace Y] {ν₁ : Measure X} [SigmaFinite ν₁]
    {ν₂ : Measure Y} [SigmaFinite ν₂] {Q₁ : ℝ → Measure X} {Q₂ : ℝ → Measure Y}
    [∀ t, IsProbabilityMeasure (Q₁ t)] [∀ t, IsProbabilityMeasure (Q₂ t)] {g₁ : X → ℝ}
    {g₂ : Y → ℝ} (hg₁ : Measurable g₁) (hg₂ : Measurable g₂) (h₁ : HasPathScore ν₁ Q₁ g₁)
    (h₂ : HasPathScore ν₂ Q₂ g₂) :
    HasPathScore (ν₁.prod ν₂) (fun t ↦ (Q₁ t).prod (Q₂ t)) (fun z ↦ g₁ z.1 + g₂ z.2) := sorry

/-- **2.3** A family of differentiable paths through `P` in a model `𝓜`, indexed by `ι`, with
their scores. The tangent set is `Set.range score`. -/
structure PathFamily (𝓜 : Set (Measure X)) (P ν : Measure X) [SigmaFinite ν] (ι : Type*)
    where
  /-- The paths. -/
  path : ι → ℝ → Measure X
  /-- The scores. -/
  score : ι → Lp ℝ 2 P
  /-- Every path consists of probability measures. -/
  isProbabilityMeasure : ∀ i t, IsProbabilityMeasure (path i t)
  /-- Every path passes through `P` at `t = 0`. -/
  path_zero : ∀ i, path i 0 = P
  /-- Every path lies in the model for small `t ≥ 0`. -/
  mem : ∀ i, ∀ᶠ t in 𝓝[≥] 0, path i t ∈ 𝓜
  /-- Every path is differentiable with the stated score. -/
  hasPathScore : ∀ i, HasPathScore ν (path i) (score i)

attribute [instance] PathFamily.isProbabilityMeasure

/-- **2.3** Local asymptotic normality along a path (van der Vaart, Lemma 25.14). -/
theorem tendstoInProbabilityZero_logLikelihoodRatio_path (P : Measure X)
    [IsProbabilityMeasure P] {Q : ℝ → Measure X} [∀ t, IsProbabilityMeasure (Q t)]
    (hQ0 : Q 0 = P) (ν : Measure X) [SigmaFinite ν] (g : Lp ℝ 2 P) (hg : HasPathScore ν Q g) :
    TendstoInProbability (fun n ↦ Measure.pi fun _ : Fin n ↦ P) (fun (n : ℕ) x ↦
      ∑ i, Real.log ((Q (Real.sqrt n)⁻¹).rnDeriv P (x i)).toReal
        - ((Real.sqrt n)⁻¹ * ∑ i, g (x i) - ‖g‖ ^ 2 / 2)) atTop 0 := sorry

/-- **2.3** Mutual contiguity of `P^n` and `Q_{1/√n}^n`, stated on measurable events. -/
theorem tendsto_pi_path_iff (P : Measure X) [IsProbabilityMeasure P] {Q : ℝ → Measure X}
    [∀ t, IsProbabilityMeasure (Q t)] (hQ0 : Q 0 = P) (ν : Measure X) [SigmaFinite ν]
    (g : Lp ℝ 2 P) (hg : HasPathScore ν Q g) (A : ∀ n, Set (Fin n → X))
    (hA : ∀ n, MeasurableSet (A n)) :
    Tendsto (fun n ↦ Measure.pi (fun _ : Fin n ↦ P) (A n)) atTop (𝓝 0) ↔
      Tendsto (fun n : ℕ ↦ Measure.pi (fun _ : Fin n ↦ Q (Real.sqrt n)⁻¹) (A n)) atTop (𝓝 0) :=
  sorry

/-- **2.3** Joint convergence of a linear statistic and the log-likelihood ratio under `P^n`,
and the limit law of the statistic under `Q_{1/√n}^n` (Le Cam's third lemma). -/
theorem tendstoInDistribution_path (P : Measure X) [IsProbabilityMeasure P]
    {Q : ℝ → Measure X} [∀ t, IsProbabilityMeasure (Q t)] (hQ0 : Q 0 = P) (ν : Measure X)
    [SigmaFinite ν] (g : Lp ℝ 2 P) (hg : HasPathScore ν Q g) (φ : Lp ℝ 2 P)
    (hφ : φ ∈ meanZeroL2 P) :
    TendstoInDistribution (fun (n : ℕ) x ↦ WithLp.toLp 2 ![(Real.sqrt n)⁻¹ * ∑ i, φ (x i),
        ∑ i, Real.log ((Q (Real.sqrt n)⁻¹).rnDeriv P (x i)).toReal]) atTop id
      (fun n ↦ Measure.pi fun _ : Fin n ↦ P)
      (multivariateGaussian (WithLp.toLp 2 ![0, -(‖g‖ ^ 2 / 2)])
        !![‖φ‖ ^ 2, inner ℝ φ g; inner ℝ φ g, ‖g‖ ^ 2]) ∧
    TendstoInDistribution (fun (n : ℕ) x ↦ (Real.sqrt n)⁻¹ * ∑ i, φ (x i)) atTop id
      (fun n ↦ Measure.pi fun _ : Fin n ↦ Q (Real.sqrt n)⁻¹)
      (gaussianReal (inner ℝ φ g) (‖φ‖₊ ^ 2)) := sorry

end Layer2

/-! ## Layer 3: pathwise differentiability and efficient influence functions -/

section Layer3

variable {X : Type*} [MeasurableSpace X] {𝓜 : Set (Measure X)} {P ν : Measure X}
  [IsProbabilityMeasure P] [SigmaFinite ν] {ι : Type*} {k : ℕ}

/-- **3.1** The parameter values `value i t` along the paths of `F` are differentiable from the
right at `0` with derivative `ψ'` applied to the score. For a functional `ψ` on the model,
`value i t = ψ (F.path i t)`. -/
def HasPathwiseDerivative (F : PathFamily 𝓜 P ν ι) (value : ι → ℝ → EuclideanSpace ℝ (Fin k))
    (ψ' : Lp ℝ 2 P →L[ℝ] EuclideanSpace ℝ (Fin k)) : Prop :=
  ∀ i, HasDerivWithinAt (value i) (ψ' (F.score i)) (Ici 0) 0

/-- **3.1** `φ` is an influence function (a gradient) for the derivative `ψ'` relative to `F`. -/
def IsInfluenceFunction (F : PathFamily 𝓜 P ν ι) (ψ' : Lp ℝ 2 P →L[ℝ] EuclideanSpace ℝ (Fin k))
    (φ : Fin k → Lp ℝ 2 P) : Prop :=
  ∀ i j, ψ' (F.score i) j = inner ℝ (φ j) (F.score i)

/-- **3.1** The efficient influence function (canonical gradient): the Riesz representer of
each coordinate of `ψ'`, projected onto the tangent space. -/
def efficientInfluence (F : PathFamily 𝓜 P ν ι) (ψ' : Lp ℝ 2 P →L[ℝ] EuclideanSpace ℝ (Fin k))
    (j : Fin k) : Lp ℝ 2 P :=
  (tangentSpace P (range F.score)).toSubmodule.starProjection
    ((InnerProductSpace.toDual ℝ (Lp ℝ 2 P)).symm ((EuclideanSpace.proj j).comp ψ'))

/-- **3.1** The efficient covariance matrix `P ψ̃ ψ̃ᵀ`. -/
def efficientCovariance (F : PathFamily 𝓜 P ν ι)
    (ψ' : Lp ℝ 2 P →L[ℝ] EuclideanSpace ℝ (Fin k)) : Matrix (Fin k) (Fin k) ℝ :=
  fun i j ↦ inner ℝ (efficientInfluence F ψ' i) (efficientInfluence F ψ' j)

/-- **3.1** The efficient influence function is the unique influence function in the tangent
space, and every influence function projects onto it. -/
theorem isInfluenceFunction_iff_starProjection (F : PathFamily 𝓜 P ν ι)
    (ψ' : Lp ℝ 2 P →L[ℝ] EuclideanSpace ℝ (Fin k)) (φ : Fin k → Lp ℝ 2 P) :
    IsInfluenceFunction F ψ' φ ↔ ∀ j,
      (tangentSpace P (range F.score)).toSubmodule.starProjection (φ j) =
        efficientInfluence F ψ' j := sorry

/-- **3.1** The variance decomposition of an influence function:
`P φ² = P φ̃² + P (φ - φ̃)²`. -/
theorem norm_sq_eq_efficientInfluence_add (F : PathFamily 𝓜 P ν ι)
    (ψ' : Lp ℝ 2 P →L[ℝ] EuclideanSpace ℝ (Fin k)) (φ : Fin k → Lp ℝ 2 P)
    (hφ : IsInfluenceFunction F ψ' φ) (j : Fin k) :
    ‖φ j‖ ^ 2 = ‖efficientInfluence F ψ' j‖ ^ 2 + ‖φ j - efficientInfluence F ψ' j‖ ^ 2 :=
  sorry

/-- **3.1** The second-moment matrix `P φ φᵀ` of an influence function dominates the efficient
covariance `P φ̃ φ̃ᵀ` in the Loewner order. -/
theorem posSemidef_gram_sub_efficientCovariance (F : PathFamily 𝓜 P ν ι)
    (ψ' : Lp ℝ 2 P →L[ℝ] EuclideanSpace ℝ (Fin k)) (φ : Fin k → Lp ℝ 2 P)
    (hφ : IsInfluenceFunction F ψ' φ) :
    (Matrix.of (fun i j ↦ inner ℝ (φ i) (φ j)) - efficientCovariance F ψ').PosSemidef := sorry

/-- **3.1** The efficient variance is the supremum of the Cramér–Rao bounds of the
one-dimensional submodels (van der Vaart, Lemma 25.19). -/
theorem isLUB_cramerRao_efficientInfluence (F : PathFamily 𝓜 P ν ι)
    (ψ' : Lp ℝ 2 P →L[ℝ] EuclideanSpace ℝ (Fin 1)) (hT : ∃ i, F.score i ≠ 0) :
    IsLUB {r | ∃ g ∈ (tangentSpace P (range F.score)).toSubmodule, g ≠ 0 ∧
        r = inner ℝ (efficientInfluence F ψ' 0) g ^ 2 / ‖g‖ ^ 2}
      (‖efficientInfluence F ψ' 0‖ ^ 2) := sorry

/-- **3.1** An influence function represents `ψ'` on the whole tangent space. -/
theorem IsInfluenceFunction.apply_eq_inner {F : PathFamily 𝓜 P ν ι}
    {ψ' : Lp ℝ 2 P →L[ℝ] EuclideanSpace ℝ (Fin k)} {φ : Fin k → Lp ℝ 2 P}
    (hφ : IsInfluenceFunction F ψ' φ) {h : Lp ℝ 2 P}
    (hh : h ∈ (tangentSpace P (range F.score)).toSubmodule) (j : Fin k) :
    ψ' h j = inner ℝ (φ j) h := sorry

/-- **3.1** The efficient influence function is an influence function, and the only one with
values in the tangent space (the canonical gradient). -/
theorem isInfluenceFunction_efficientInfluence (F : PathFamily 𝓜 P ν ι)
    (ψ' : Lp ℝ 2 P →L[ℝ] EuclideanSpace ℝ (Fin k)) :
    IsInfluenceFunction F ψ' (efficientInfluence F ψ') ∧
      ∀ φ : Fin k → Lp ℝ 2 P, IsInfluenceFunction F ψ' φ →
        (∀ j, φ j ∈ (tangentSpace P (range F.score)).toSubmodule) →
          φ = efficientInfluence F ψ' := sorry

/-- **3.2** The chain rule (Bickel–Klaassen–Ritov–Wellner, §3.3, Corollary 2): composing with a
map differentiable at the common value composes the pathwise derivative, and the efficient
influence function becomes `Dh φ̃`. -/
theorem hasPathwiseDerivative_comp {m : ℕ} (F : PathFamily 𝓜 P ν ι)
    (value : ι → ℝ → EuclideanSpace ℝ (Fin k)) (ψ' : Lp ℝ 2 P →L[ℝ] EuclideanSpace ℝ (Fin k))
    (hψ : HasPathwiseDerivative F value ψ') (θ : EuclideanSpace ℝ (Fin k))
    (hval : ∀ i, value i 0 = θ) (h : EuclideanSpace ℝ (Fin k) → EuclideanSpace ℝ (Fin m))
    (Dh : EuclideanSpace ℝ (Fin k) →L[ℝ] EuclideanSpace ℝ (Fin m)) (hh : HasFDerivAt h Dh θ) :
    HasPathwiseDerivative F (fun i t ↦ h (value i t)) (Dh ∘L ψ') ∧
      ∀ j, efficientInfluence F (Dh ∘L ψ') j =
        ∑ l, Dh (EuclideanSpace.single l 1) j • efficientInfluence F ψ' l := sorry

/-- **3.2** Score operators (van der Vaart, Theorem 25.31): for paths indexed by a Hilbert space
`H` with scores `A b`, a parameter with derivative `⟪χ, b⟫` along `b` is pathwise
differentiable iff `χ ∈ range A†`; then `A† ψ̃ = χ`, `ψ̃ = A b₀` when `χ = A† A b₀`, and
`ψ̃ = A (A† A)⁻¹ χ` when `A† A` is invertible. -/
theorem exists_hasPathwiseDerivative_iff_mem_range_adjoint {H : Type*} [NormedAddCommGroup H]
    [InnerProductSpace ℝ H] [CompleteSpace H] (F : PathFamily 𝓜 P ν H) (A : H →L[ℝ] Lp ℝ 2 P)
    (hA : ∀ b, F.score b = A b) (value : H → ℝ → EuclideanSpace ℝ (Fin 1)) (χ : H)
    (hvalue : ∀ b, HasDerivWithinAt (value b) (WithLp.toLp 2 fun _ ↦ inner ℝ χ b) (Ici 0) 0) :
    ((∃ ψ' : Lp ℝ 2 P →L[ℝ] EuclideanSpace ℝ (Fin 1), HasPathwiseDerivative F value ψ') ↔
        χ ∈ range (ContinuousLinearMap.adjoint A)) ∧
      ∀ ψ' : Lp ℝ 2 P →L[ℝ] EuclideanSpace ℝ (Fin 1), HasPathwiseDerivative F value ψ' →
        ContinuousLinearMap.adjoint A (efficientInfluence F ψ' 0) = χ ∧
          (∀ b₀, χ = ContinuousLinearMap.adjoint A (A b₀) → efficientInfluence F ψ' 0 = A b₀) ∧
          (IsUnit (ContinuousLinearMap.adjoint A ∘L A) → efficientInfluence F ψ' 0 =
            A (Ring.inverse (ContinuousLinearMap.adjoint A ∘L A) χ)) := sorry

/-- **3.3** The mean `P f` of a square-integrable `f` along the bounded tilts has derivative
`⟪f - P f, g⟫`, so its canonical gradient is `f - P f` (van der Vaart, Example 25.24). -/
theorem hasDerivAt_integral_tiltPath (P : Measure X) [IsProbabilityMeasure P] (f g : X → ℝ)
    (hf : MemLp f 2 P) (hg : Measurable g) (C : ℝ)
    (hC : ∀ x, |g x| ≤ C) (hmean : ∫ x, g x ∂P = 0) :
    HasDerivAt (fun t ↦ ∫ x, f x ∂tiltPath P g C t)
      (∫ x, (f x - ∫ y, f y ∂P) * g x ∂P) 0 := sorry

/-- **3.3** The `p`-quantile at a law with a density continuous and positive at the quantile has
canonical gradient `(p - 1{x ≤ q}) / f(q)` along bounded tilts. -/
theorem hasDerivAt_quantile_tiltPath (P : Measure ℝ) [IsProbabilityMeasure P] (dens : ℝ → ℝ)
    (hP : P = volume.withDensity (fun x ↦ ENNReal.ofReal (dens x))) (hdens : Measurable dens)
    (p : ℝ) (hp : p ∈ Ioo 0 1) (hcont : ContinuousAt dens (Measure.quantile P p))
    (hpos : 0 < dens (Measure.quantile P p)) (g : ℝ → ℝ) (hg : Measurable g) (C : ℝ)
    (hC : ∀ x, |g x| ≤ C) (hmean : ∫ x, g x ∂P = 0) :
    HasDerivAt (fun t ↦ Measure.quantile (tiltPath P g C t) p)
      (∫ x, (p - (Iic (Measure.quantile P p)).indicator 1 x) /
          dens (Measure.quantile P p) * g x ∂P) 0 := sorry

/-- **3.3** The canonical gradient of the mean `P f` in the nonparametric model, relative to the
bounded tilts, is `f - P f`. -/
theorem efficientInfluence_integral_tiltPath (P : Measure X) [IsProbabilityMeasure P]
    (f : X → ℝ) (hf : MemLp f 2 P) :
    ∃ F : PathFamily univ P P
        {p : (X → ℝ) × ℝ // Measurable p.1 ∧ (∀ x, |p.1 x| ≤ p.2) ∧ ∫ x, p.1 x ∂P = 0},
      (∀ i t, F.path i t = tiltPath P i.1.1 i.1.2 t) ∧
      (∃ ψ' : Lp ℝ 2 P →L[ℝ] EuclideanSpace ℝ (Fin 1), HasPathwiseDerivative F
        (fun i t ↦ WithLp.toLp 2 fun _ ↦ ∫ x, f x ∂F.path i t) ψ') ∧
      ∀ ψ' : Lp ℝ 2 P →L[ℝ] EuclideanSpace ℝ (Fin 1), HasPathwiseDerivative F
          (fun i t ↦ WithLp.toLp 2 fun _ ↦ ∫ x, f x ∂F.path i t) ψ' →
        (efficientInfluence F ψ' 0 : X → ℝ) =ᵐ[P] fun x ↦ f x - ∫ y, f y ∂P := sorry

/-- **3.3** The canonical gradient of the `p`-quantile relative to the bounded tilts is
`(p - 1{x ≤ q}) / f(q)`, with variance `p (1 - p) / f(q)²`. -/
theorem efficientInfluence_quantile_tiltPath (P : Measure ℝ) [IsProbabilityMeasure P]
    (dens : ℝ → ℝ) (hP : P = volume.withDensity (fun x ↦ ENNReal.ofReal (dens x)))
    (hdens : Measurable dens) (p : ℝ) (hp : p ∈ Ioo 0 1)
    (hcont : ContinuousAt dens (Measure.quantile P p))
    (hpos : 0 < dens (Measure.quantile P p)) :
    ∃ F : PathFamily univ P P
        {c : (ℝ → ℝ) × ℝ // Measurable c.1 ∧ (∀ x, |c.1 x| ≤ c.2) ∧ ∫ x, c.1 x ∂P = 0},
      (∀ i t, F.path i t = tiltPath P i.1.1 i.1.2 t) ∧
      (∃ ψ' : Lp ℝ 2 P →L[ℝ] EuclideanSpace ℝ (Fin 1), HasPathwiseDerivative F
        (fun i t ↦ WithLp.toLp 2 fun _ ↦ Measure.quantile (F.path i t) p) ψ') ∧
      ∀ ψ' : Lp ℝ 2 P →L[ℝ] EuclideanSpace ℝ (Fin 1), HasPathwiseDerivative F
          (fun i t ↦ WithLp.toLp 2 fun _ ↦ Measure.quantile (F.path i t) p) ψ' →
        (efficientInfluence F ψ' 0 : ℝ → ℝ) =ᵐ[P] (fun x ↦
          (p - (Iic (Measure.quantile P p)).indicator 1 x) / dens (Measure.quantile P p)) ∧
        ‖efficientInfluence F ψ' 0‖ ^ 2 = p * (1 - p) / dens (Measure.quantile P p) ^ 2 := sorry

/-- **3.3** The median model: laws on `ℝ` with a density continuous on an open neighbourhood of
the median and positive there. Relative to the bounded continuous tilts the median has efficient
influence function `(1/2 - 1{x ≤ m}) / f(m)` and information bound `4 f(m)²`. -/
theorem efficientInfluence_median (P : Measure ℝ) [IsProbabilityMeasure P] (dens : ℝ → ℝ)
    (hP : P = volume.withDensity (fun x ↦ ENNReal.ofReal (dens x))) (hdens : Measurable dens)
    (U : Set ℝ) (hU : IsOpen U) (hmU : Measure.quantile P (1 / 2) ∈ U)
    (hcont : ContinuousOn dens U) (hpos : 0 < dens (Measure.quantile P (1 / 2))) :
    ∃ F : PathFamily {Q | IsProbabilityMeasure Q ∧ ∃ d : ℝ → ℝ, Measurable d ∧
          Q = volume.withDensity (fun x ↦ ENNReal.ofReal (d x)) ∧ ∃ V : Set ℝ, IsOpen V ∧
            Measure.quantile Q (1 / 2) ∈ V ∧ ContinuousOn d V ∧
              0 < d (Measure.quantile Q (1 / 2))} P P {g : ℝ →ᵇ ℝ // ∫ x, g x ∂P = 0},
      (∀ i t, F.path i t = tiltPath P i.1 ‖i.1‖ t) ∧
      (∃ ψ' : Lp ℝ 2 P →L[ℝ] EuclideanSpace ℝ (Fin 1), HasPathwiseDerivative F
        (fun i t ↦ WithLp.toLp 2 fun _ ↦ Measure.quantile (F.path i t) (1 / 2)) ψ') ∧
      ∀ ψ' : Lp ℝ 2 P →L[ℝ] EuclideanSpace ℝ (Fin 1), HasPathwiseDerivative F
          (fun i t ↦ WithLp.toLp 2 fun _ ↦ Measure.quantile (F.path i t) (1 / 2)) ψ' →
        (efficientInfluence F ψ' 0 : ℝ → ℝ) =ᵐ[P] (fun x ↦
          (1 / 2 - (Iic (Measure.quantile P (1 / 2))).indicator 1 x) /
            dens (Measure.quantile P (1 / 2))) ∧
        ‖efficientInfluence F ψ' 0‖ ^ 2 = (4 * dens (Measure.quantile P (1 / 2)) ^ 2)⁻¹ :=
  sorry

/-- **3.4** The efficient influence function of `θ` in a semiparametric model (van der Vaart,
Lemma 25.25): if every path has score `aᵀ ℓ̇ + g` with `g` in a set `N` of nuisance scores and
moves the parameter to `θ + t a`, and `Ĩ` is nonsingular, then the derivative is pathwise and the
efficient influence function is `Ĩ⁻¹ ℓ̃`. -/
theorem efficientInfluence_semiparametric (F : PathFamily 𝓜 P ν ι)
    (θ : EuclideanSpace ℝ (Fin k)) (ℓ : Fin k → Lp ℝ 2 P) (N : Set (Lp ℝ 2 P))
    (dir : ι → EuclideanSpace ℝ (Fin k)) (nuis : ι → Lp ℝ 2 P) (hnuis : ∀ i, nuis i ∈ N)
    (hscore : ∀ i, F.score i = ∑ j, dir i j • ℓ j + nuis i)
    (hdense : (tangentSpace P (range F.score)).toSubmodule =
      (tangentSpace P (range ℓ ∪ N)).toSubmodule)
    (hI : (efficientInformationMatrix P N ℓ).PosDef) :
    ∃ ψ' : Lp ℝ 2 P →L[ℝ] EuclideanSpace ℝ (Fin k),
      HasPathwiseDerivative F (fun i t ↦ θ + t • dir i) ψ' ∧
      ∀ j, efficientInfluence F ψ' j =
        ∑ l, (efficientInformationMatrix P N ℓ)⁻¹ j l • efficientScore P N (ℓ l) := sorry

/-- **3.4** Symmetric location (van der Vaart, Example 25.27): for a symmetric density with an
odd derivative, the location score `-(η'/η)(x - θ)` is orthogonal to every nuisance score that
is an even function of `x - θ`, so it is the efficient score and `Ĩ = I_η`. -/
theorem efficientScore_symmetricLocation (η η' : ℝ → ℝ) (hη : ∀ x, 0 ≤ η x)
    (hη1 : ∫ x, η x = 1) (hη' : ∀ a b, IntervalIntegrable η' volume a b)
    (hac : ∀ x, η x = η 0 + ∫ t in (0 : ℝ)..x, η' t)
    (hfisher : Integrable fun x ↦ η' x ^ 2 / η x) (hsymm : ∀ x, η (-x) = η x)
    (hodd : ∀ x, η' (-x) = -η' x) (θ : ℝ)
    [IsProbabilityMeasure (volume.withDensity fun x ↦ ENNReal.ofReal (η (x - θ)))]
    (ℓ : Lp ℝ 2 (volume.withDensity fun x ↦ ENNReal.ofReal (η (x - θ))))
    (hℓ : (ℓ : ℝ → ℝ) =ᵐ[volume.withDensity fun x ↦ ENNReal.ofReal (η (x - θ))]
      fun x ↦ -(η' (x - θ) / η (x - θ)))
    (N : Set (Lp ℝ 2 (volume.withDensity fun x ↦ ENNReal.ofReal (η (x - θ)))))
    (hN : ∀ u ∈ N, ∃ g : ℝ → ℝ, (∀ x, g (-x) = g x) ∧
      (u : ℝ → ℝ) =ᵐ[volume.withDensity fun x ↦ ENNReal.ofReal (η (x - θ))] fun x ↦ g (x - θ)) :
    efficientScore _ N ℓ = ℓ ∧
      efficientInformationMatrix _ N (fun _ : Fin 1 ↦ ℓ) =
        Matrix.of fun _ _ ↦ ∫ x, η' x ^ 2 / η x := sorry

/-- **3.4** Partially linear regression `Y = Dᵀβ + g(X) + ε`, `ε ~ N(0, σ²)` independent of
`(D, X)`: for nuisance scores among the mean-zero `a(D, X)`, `k(X) ε/σ²` and `ε² - σ²`, including
every `k(X) ε/σ²`, the efficient score for `β` is `ε V/σ²` with `V = D - E[D | X]`, `Ĩ = Q/σ²`
with `Q = E[V Vᵀ]`, and for `Q` positive definite `Ĩ⁻¹ = σ² Q⁻¹` and the efficient influence
function is `Q⁻¹ V ε`. -/
theorem efficientScore_partiallyLinear {W : Type*} [MeasurableSpace W] {d : ℕ}
    (L : Measure (EuclideanSpace ℝ (Fin d) × W)) [IsProbabilityMeasure L]
    (hD : MemLp (fun z : EuclideanSpace ℝ (Fin d) × W ↦ z.1) 2 L) (β : EuclideanSpace ℝ (Fin d))
    (g : W → ℝ) (hg : Measurable g)
    (hg2 : MemLp (fun z : EuclideanSpace ℝ (Fin d) × W ↦ g z.2) 2 L) (σsq : ℝ≥0) (hσ : 0 < σsq)
    (P : Measure (EuclideanSpace ℝ (Fin d) × W × ℝ)) [IsProbabilityMeasure P]
    (hP : P = (L.prod (gaussianReal 0 σsq)).map
      fun p ↦ (p.1.1, p.1.2, inner ℝ p.1.1 β + g p.1.2 + p.2))
    (mD : W → EuclideanSpace ℝ (Fin d)) (hmD : Measurable mD)
    (hmD' : (fun z : EuclideanSpace ℝ (Fin d) × W ↦ mD z.2) =ᵐ[L]
      L[fun z ↦ z.1 | MeasurableSpace.comap Prod.snd inferInstance])
    (ℓ : Fin d → Lp ℝ 2 P)
    (hℓ : ∀ j, (ℓ j : EuclideanSpace ℝ (Fin d) × W × ℝ → ℝ) =ᵐ[P]
      fun o ↦ o.1 j * (o.2.2 - inner ℝ o.1 β - g o.2.1) / σsq)
    (N : Set (Lp ℝ 2 P))
    (hN : ∀ u ∈ N, u ∈ meanZeroL2 P ∧
      ((∃ a : EuclideanSpace ℝ (Fin d) × W → ℝ,
          (u : EuclideanSpace ℝ (Fin d) × W × ℝ → ℝ) =ᵐ[P] fun o ↦ a (o.1, o.2.1)) ∨
        (∃ k : W → ℝ, (u : EuclideanSpace ℝ (Fin d) × W × ℝ → ℝ) =ᵐ[P]
          fun o ↦ k o.2.1 * (o.2.2 - inner ℝ o.1 β - g o.2.1) / σsq) ∨
        (u : EuclideanSpace ℝ (Fin d) × W × ℝ → ℝ) =ᵐ[P]
          fun o ↦ (o.2.2 - inner ℝ o.1 β - g o.2.1) ^ 2 - σsq))
    (hNk : ∀ u : Lp ℝ 2 P, (∃ k : W → ℝ, (u : EuclideanSpace ℝ (Fin d) × W × ℝ → ℝ) =ᵐ[P]
      fun o ↦ k o.2.1 * (o.2.2 - inner ℝ o.1 β - g o.2.1) / σsq) → u ∈ N) :
    let ε : EuclideanSpace ℝ (Fin d) × W × ℝ → ℝ := fun o ↦ o.2.2 - inner ℝ o.1 β - g o.2.1
    let V : EuclideanSpace ℝ (Fin d) × W × ℝ → EuclideanSpace ℝ (Fin d) := fun o ↦ o.1 - mD o.2.1
    let Q : Matrix (Fin d) (Fin d) ℝ := fun i j ↦ ∫ o, V o i * V o j ∂P
    (∀ j, (efficientScore P N (ℓ j) : EuclideanSpace ℝ (Fin d) × W × ℝ → ℝ) =ᵐ[P]
        fun o ↦ V o j * ε o / σsq) ∧
      efficientInformationMatrix P N ℓ = (σsq : ℝ)⁻¹ • Q ∧
      (Q.PosDef → (efficientInformationMatrix P N ℓ)⁻¹ = (σsq : ℝ) • Q⁻¹ ∧
        ∀ j, ((∑ l, (efficientInformationMatrix P N ℓ)⁻¹ j l • efficientScore P N (ℓ l) :
            Lp ℝ 2 P) : EuclideanSpace ℝ (Fin d) × W × ℝ → ℝ) =ᵐ[P]
          fun o ↦ Q⁻¹.mulVec (fun i ↦ V o i) j * ε o) := sorry

/-- **3.5** Least favourable submodels: among the scores `ℓ + g`, `g` in the nuisance tangent
space, the information `‖ℓ + g‖²` is minimal exactly at the efficient score. -/
theorem efficientInformation_le_norm_sq_add (N : Set (Lp ℝ 2 P)) (ℓ g : Lp ℝ 2 P)
    (hg : g ∈ (tangentSpace P N).toSubmodule) :
    ‖efficientScore P N ℓ‖ ^ 2 ≤ ‖ℓ + g‖ ^ 2 ∧
      (‖efficientScore P N ℓ‖ ^ 2 = ‖ℓ + g‖ ^ 2 ↔ ℓ + g = efficientScore P N ℓ) := sorry

/-- **3.5** The matrix case: for nuisance directions `gᵢ` in the nuisance tangent space, the Gram
matrix of `ℓ + g` dominates `Ĩ` in the Loewner order. -/
theorem posSemidef_gram_add_sub_efficientInformationMatrix (N : Set (Lp ℝ 2 P))
    (ℓ g : Fin k → Lp ℝ 2 P) (hg : ∀ i, g i ∈ (tangentSpace P N).toSubmodule) :
    (Matrix.of (fun i j ↦ inner ℝ (ℓ i + g i) (ℓ j + g j)) -
      efficientInformationMatrix P N ℓ).PosSemidef := sorry

end Layer3

/-! ## Layer 4: regular estimators and lower bounds -/

section Layer4

variable {X : Type*} [MeasurableSpace X] {𝓜 : Set (Measure X)} {P ν : Measure X}
  [IsProbabilityMeasure P] [SigmaFinite ν] {ι : Type*} {k : ℕ}

/-- **4.1** Regularity along the paths of `F` for estimating `value`: for every `i`, under the
null product law `P^n` the variable `√n (Tₙ - value i 0)` converges in law to `L`, and under the
product law at `t = 1/√n` the variable `√n (Tₙ - value i (1/√n))` converges in law to the same
`L`. -/
def IsRegularAlong (F : PathFamily 𝓜 P ν ι) (value : ι → ℝ → EuclideanSpace ℝ (Fin k))
    (T : ∀ n, (Fin n → X) → EuclideanSpace ℝ (Fin k))
    (L : Measure (EuclideanSpace ℝ (Fin k))) [IsProbabilityMeasure L] : Prop :=
  (∀ n, Measurable (T n)) ∧ ∀ i,
    TendstoInDistribution (fun (n : ℕ) x ↦ Real.sqrt n • (T n x - value i 0)) atTop id
      (fun n ↦ Measure.pi fun _ : Fin n ↦ P) L ∧
    TendstoInDistribution
      (fun (n : ℕ) x ↦ Real.sqrt n • (T n x - value i (Real.sqrt n)⁻¹)) atTop id
      (fun n ↦ Measure.pi fun _ : Fin n ↦ F.path i (Real.sqrt n)⁻¹) L

/-- **4.1** Asymptotic linearity at `P` with influence function `φ`. -/
def IsAsymptoticallyLinear (P : Measure X) [IsProbabilityMeasure P]
    (T : ∀ n, (Fin n → X) → EuclideanSpace ℝ (Fin k)) (θ : EuclideanSpace ℝ (Fin k))
    (φ : X → EuclideanSpace ℝ (Fin k)) : Prop :=
  TendstoInProbability (fun n ↦ Measure.pi fun _ : Fin n ↦ P) (fun (n : ℕ) x ↦
    Real.sqrt n • (T n x - θ) - (Real.sqrt n)⁻¹ • ∑ i, φ (x i)) atTop 0

/-- **4.2** A regular asymptotically linear estimator has an influence function of `ψ'`. -/
theorem isInfluenceFunction_of_isRegularAlong (F : PathFamily 𝓜 P ν ι)
    (value : ι → ℝ → EuclideanSpace ℝ (Fin k))
    (ψ' : Lp ℝ 2 P →L[ℝ] EuclideanSpace ℝ (Fin k)) (hψ : HasPathwiseDerivative F value ψ')
    (T : ∀ n, (Fin n → X) → EuclideanSpace ℝ (Fin k)) (L : Measure (EuclideanSpace ℝ (Fin k)))
    [IsProbabilityMeasure L] (hreg : IsRegularAlong F value T L) (θ : EuclideanSpace ℝ (Fin k))
    (hval : ∀ i, value i 0 = θ) (φ : Fin k → Lp ℝ 2 P) (hφ : ∀ j, φ j ∈ meanZeroL2 P)
    (hlin : IsAsymptoticallyLinear P T θ (fun x ↦ WithLp.toLp 2 fun j ↦ φ j x)) :
    IsInfluenceFunction F ψ' φ := sorry

/-- **4.2** The asymptotic covariance `P φ φᵀ` of a regular asymptotically linear estimator
dominates the efficient covariance `P φ̃ φ̃ᵀ`. -/
theorem posSemidef_gram_sub_efficientCovariance_of_isRegularAlong (F : PathFamily 𝓜 P ν ι)
    (value : ι → ℝ → EuclideanSpace ℝ (Fin k))
    (ψ' : Lp ℝ 2 P →L[ℝ] EuclideanSpace ℝ (Fin k)) (hψ : HasPathwiseDerivative F value ψ')
    (T : ∀ n, (Fin n → X) → EuclideanSpace ℝ (Fin k)) (L : Measure (EuclideanSpace ℝ (Fin k)))
    [IsProbabilityMeasure L] (hreg : IsRegularAlong F value T L) (θ : EuclideanSpace ℝ (Fin k))
    (hval : ∀ i, value i 0 = θ) (φ : Fin k → Lp ℝ 2 P) (hφ : ∀ j, φ j ∈ meanZeroL2 P)
    (hlin : IsAsymptoticallyLinear P T θ (fun x ↦ WithLp.toLp 2 fun j ↦ φ j x)) :
    (Matrix.of (fun i j ↦ inner ℝ (φ i) (φ j)) - efficientCovariance F ψ').PosSemidef := sorry

/-- **4.3** The convolution theorem (van der Vaart, Theorem 25.20), for a tangent set that is a
linear space: the family is nonempty and its scores are closed under linear combinations. -/
theorem exists_conv_of_isRegularAlong (F : PathFamily 𝓜 P ν ι)
    (hne : Nonempty ι) (hlin : ∀ i j (a b : ℝ), ∃ l, F.score l = a • F.score i + b • F.score j)
    (value : ι → ℝ → EuclideanSpace ℝ (Fin k)) (ψ' : Lp ℝ 2 P →L[ℝ] EuclideanSpace ℝ (Fin k))
    (hψ : HasPathwiseDerivative F value ψ') (hval : ∀ i j, value i 0 = value j 0)
    (T : ∀ n, (Fin n → X) → EuclideanSpace ℝ (Fin k)) (L : Measure (EuclideanSpace ℝ (Fin k)))
    [IsProbabilityMeasure L] (hreg : IsRegularAlong F value T L) :
    ∃ M : Measure (EuclideanSpace ℝ (Fin k)), IsProbabilityMeasure M ∧
      L = (multivariateGaussian 0 (efficientCovariance F ψ')).conv M := sorry

/-- **4.4** Efficiency is asymptotic linearity in the efficient influence function (van der
Vaart, Lemma 25.23), for a tangent set that is a linear space as in
`exists_conv_of_isRegularAlong`. -/
theorem isRegularAlong_gaussian_iff_isAsymptoticallyLinear (F : PathFamily 𝓜 P ν ι)
    (hne : Nonempty ι) (hlin : ∀ i j (a b : ℝ), ∃ l, F.score l = a • F.score i + b • F.score j)
    (value : ι → ℝ → EuclideanSpace ℝ (Fin k)) (ψ' : Lp ℝ 2 P →L[ℝ] EuclideanSpace ℝ (Fin k))
    (hψ : HasPathwiseDerivative F value ψ') (θ : EuclideanSpace ℝ (Fin k))
    (hval : ∀ i, value i 0 = θ) (T : ∀ n, (Fin n → X) → EuclideanSpace ℝ (Fin k))
    (hT : ∀ n, Measurable (T n)) :
    IsRegularAlong F value T (multivariateGaussian 0 (efficientCovariance F ψ')) ↔
      IsAsymptoticallyLinear P T θ (fun x ↦ WithLp.toLp 2 fun j ↦ efficientInfluence F ψ' j x) :=
  sorry

/-- **4.3** The local asymptotic minimax theorem (van der Vaart, Theorem 25.21), for a tangent set
that is a linear space (as in `exists_conv_of_isRegularAlong`) and a nonnegative symmetric loss
with closed convex sublevel sets. Risks are lower integrals, so a non-integrable loss has infinite
risk. No tightness of the estimator sequence is assumed. -/
theorem lintegral_gaussian_le_iSup_liminf (F : PathFamily 𝓜 P ν ι)
    (hne : Nonempty ι) (hlin : ∀ i j (a b : ℝ), ∃ l, F.score l = a • F.score i + b • F.score j)
    (value : ι → ℝ → EuclideanSpace ℝ (Fin k)) (ψ' : Lp ℝ 2 P →L[ℝ] EuclideanSpace ℝ (Fin k))
    (hψ : HasPathwiseDerivative F value ψ')
    (ℓ : EuclideanSpace ℝ (Fin k) → ℝ) (hℓ0 : ∀ x, 0 ≤ ℓ x) (hℓsymm : ∀ x, ℓ (-x) = ℓ x)
    (hℓconv : ∀ c, Convex ℝ {x | ℓ x ≤ c} ∧ IsClosed {x | ℓ x ≤ c})
    (T : ∀ n, (Fin n → X) → EuclideanSpace ℝ (Fin k)) (hT : ∀ n, Measurable (T n))
    (θ : EuclideanSpace ℝ (Fin k)) (hθ : ∀ i, value i 0 = θ) :
    ∫⁻ x, ENNReal.ofReal (ℓ x) ∂multivariateGaussian 0 (efficientCovariance F ψ') ≤
      ⨆ I : Finset ι, liminf (fun n : ℕ ↦ ⨆ i ∈ I,
        ∫⁻ x, ENNReal.ofReal (ℓ (Real.sqrt n • (T n x - value i (Real.sqrt n)⁻¹)))
          ∂Measure.pi fun _ : Fin n ↦ F.path i (Real.sqrt n)⁻¹) atTop := sorry

/-- **4.5** The semiparametric convolution bound: in the setting of
`efficientInfluence_semiparametric`, with a linear tangent set, the limit law of every
regular estimator sequence of `θ` is `N(0, Ĩ⁻¹)` convolved with a probability measure. -/
theorem exists_conv_semiparametric (F : PathFamily 𝓜 P ν ι)
    (hne : Nonempty ι) (hlin : ∀ i j (a b : ℝ), ∃ l, F.score l = a • F.score i + b • F.score j)
    (θ : EuclideanSpace ℝ (Fin k)) (ℓ : Fin k → Lp ℝ 2 P) (N : Set (Lp ℝ 2 P))
    (dir : ι → EuclideanSpace ℝ (Fin k)) (nuis : ι → Lp ℝ 2 P) (hnuis : ∀ i, nuis i ∈ N)
    (hscore : ∀ i, F.score i = ∑ j, dir i j • ℓ j + nuis i)
    (hdense : (tangentSpace P (range F.score)).toSubmodule =
      (tangentSpace P (range ℓ ∪ N)).toSubmodule)
    (hI : (efficientInformationMatrix P N ℓ).PosDef)
    (T : ∀ n, (Fin n → X) → EuclideanSpace ℝ (Fin k)) (L : Measure (EuclideanSpace ℝ (Fin k)))
    [IsProbabilityMeasure L] (hreg : IsRegularAlong F (fun i t ↦ θ + t • dir i) T L) :
    ∃ M : Measure (EuclideanSpace ℝ (Fin k)), IsProbabilityMeasure M ∧
      L = (multivariateGaussian 0 (efficientInformationMatrix P N ℓ)⁻¹).conv M := sorry

/-- **4.5** Efficiency in a semiparametric model: in the setting of `exists_conv_semiparametric`,
an estimator sequence of `θ` is regular with limit `N(0, Ĩ⁻¹)` iff it is asymptotically linear in
the efficient influence function `Ĩ⁻¹ ℓ̃`. -/
theorem isRegularAlong_gaussian_iff_semiparametric (F : PathFamily 𝓜 P ν ι)
    (hne : Nonempty ι) (hlin : ∀ i j (a b : ℝ), ∃ l, F.score l = a • F.score i + b • F.score j)
    (θ : EuclideanSpace ℝ (Fin k)) (ℓ : Fin k → Lp ℝ 2 P) (N : Set (Lp ℝ 2 P))
    (dir : ι → EuclideanSpace ℝ (Fin k)) (nuis : ι → Lp ℝ 2 P) (hnuis : ∀ i, nuis i ∈ N)
    (hscore : ∀ i, F.score i = ∑ j, dir i j • ℓ j + nuis i)
    (hdense : (tangentSpace P (range F.score)).toSubmodule =
      (tangentSpace P (range ℓ ∪ N)).toSubmodule)
    (hI : (efficientInformationMatrix P N ℓ).PosDef)
    (T : ∀ n, (Fin n → X) → EuclideanSpace ℝ (Fin k)) (hT : ∀ n, Measurable (T n)) :
    IsRegularAlong F (fun i t ↦ θ + t • dir i) T
        (multivariateGaussian 0 (efficientInformationMatrix P N ℓ)⁻¹) ↔
      IsAsymptoticallyLinear P T θ (fun x ↦ WithLp.toLp 2 fun j ↦
        ∑ l, (efficientInformationMatrix P N ℓ)⁻¹ j l * efficientScore P N (ℓ l) x) := sorry

end Layer4

/-! ## Layer 5: sample splitting and efficient estimation -/

section Layer5

/-- **5.1** A labelling of the observations `Fin n` by `K` folds. -/
structure SampleSplit (n K : ℕ) where
  /-- The fold of each observation. -/
  fold : Fin n → Fin K

/-- **5.1** The training indices of fold `k`: the observations outside it. -/
def SampleSplit.training {n K : ℕ} (s : SampleSplit n K) (k : Fin K) : Type :=
  {i : Fin n // s.fold i ≠ k}

/-- **5.1** The cross-fitted average of an estimating function: observation `i` is evaluated
with nuisance fitted on the training sample of its fold. -/
def crossFittedAverage {O H : Type*} {n K : ℕ} (s : SampleSplit n K)
    (fit : ∀ k : Fin K, (s.training k → O) → H) (φ : H → O → ℝ) (o : Fin n → O) : ℝ :=
  (n : ℝ)⁻¹ * ∑ i, φ (fit (s.fold i) fun j ↦ o j.1) (o i)

/-- **5.1** Restriction to the training indices of a fold is measurable, and under the product
law the training sample of fold `k` is independent of the observations in fold `k`. -/
theorem indepFun_restrict_training {O : Type*} [MeasurableSpace O] (P : Measure O)
    [IsProbabilityMeasure P] {n K : ℕ} (s : SampleSplit n K) (k : Fin K) :
    Measurable (fun (x : Fin n → O) (j : s.training k) ↦ x j.1) ∧
      IndepFun (fun (x : Fin n → O) (j : s.training k) ↦ x j.1)
        (fun (x : Fin n → O) (j : {i : Fin n // s.fold i = k}) ↦ x j.1)
        (Measure.pi fun _ : Fin n ↦ P) := sorry

variable {Ω O H : Type*} [MeasurableSpace Ω] [MeasurableSpace O]

/-- **5.1** The cross-fitting lemma. If on every fold the fitted estimating function converges
to `φ h₀` in `L²(P)` and its bias is `o_P(n^{-1/2})`, both with the nuisance held fixed, then the
cross-fitted average is asymptotically equivalent to the oracle average. No condition on the fold
sizes is needed. -/
theorem crossFittedAverage_asymptotically_linear (μ : Measure Ω) [IsProbabilityMeasure μ]
    (P : Measure O) [IsProbabilityMeasure P] (W : ℕ → Ω → O)
    (hiid : IsIndependentIdenticallyDistributed μ W P) (φ : H → O → ℝ) (h₀ : H)
    (hφ₀ : MemLp (φ h₀) 2 P) (K : ℕ) (s : ∀ n, SampleSplit n K)
    (fit : ∀ n (k : Fin K), ((s n).training k → O) → H)
    (hfit : ∀ n (k : Fin K), Measurable fun p : ((s n).training k → O) × O ↦ φ (fit n k p.1) p.2)
    (hL2 : ∀ k : Fin K, TendstoInMeasure μ (fun n ω ↦
      (eLpNorm (fun o ↦ φ (fit n k fun j ↦ W j.1.1 ω) o - φ h₀ o) 2 P).toReal) atTop
        (fun _ ↦ 0))
    (hfinite : ∀ n (k : Fin K) ω,
      eLpNorm (fun o ↦ φ (fit n k fun j ↦ W j.1.1 ω) o - φ h₀ o) 2 P ≠ ∞)
    (hbias : ∀ k : Fin K, TendstoInMeasure μ (fun (n : ℕ) ω ↦ Real.sqrt n *
      (∫ o, φ (fit n k fun j ↦ W j.1.1 ω) o ∂P - ∫ o, φ h₀ o ∂P)) atTop (fun _ ↦ 0)) :
    TendstoInMeasure μ (fun (n : ℕ) ω ↦
      Real.sqrt n * (crossFittedAverage (s n) (fit n) φ (fun i ↦ W i.1 ω) - ∫ o, φ h₀ o ∂P)
        - (Real.sqrt n)⁻¹ * ∑ i : Fin n, (φ h₀ (W i.1 ω) - ∫ o, φ h₀ o ∂P)) atTop
      (fun _ ↦ 0) := sorry

/-- **5.2** The one-step theorem with data splitting (Bickel–Klaassen–Ritov–Wellner, §7.8,
Theorem 1, p. 395): under contiguity (iii), smoothness (iv), a `√n`-consistent preliminary
estimator (v) and a jointly measurable estimator of `ψ` with conditions (19) and (20) (vi), some
measurable estimator sequence is asymptotically linear in `ψ` along every sequence
`θₙ = θ + O(n^{-1/2})`. Contiguity is mutual contiguity of the `n`-fold products, stated on
measurable events; the `L²` condition (20) is stated in `ℝ≥0∞`. -/
theorem exists_oneStep_estimator {X : Type*} [MeasurableSpace X] {k : ℕ} {𝒢 : Type*}
    (Θ : Set (EuclideanSpace ℝ (Fin k))) (hΘ : IsOpen Θ)
    (P : EuclideanSpace ℝ (Fin k) → 𝒢 → Measure X) [∀ θ G, IsProbabilityMeasure (P θ G)]
    (ψ : X → EuclideanSpace ℝ (Fin k) → 𝒢 → EuclideanSpace ℝ (Fin k))
    (hψm : ∀ θ G, Measurable fun x ↦ ψ x θ G)
    (hmean : ∀ θ ∈ Θ, ∀ G, ∫ x, ψ x θ G ∂(P θ G) = 0)
    (hL2 : ∀ θ ∈ Θ, ∀ G, MemLp (fun x ↦ ψ x θ G) 2 (P θ G))
    (hcontig : ∀ θ ∈ Θ, ∀ G, ∀ θs : ℕ → EuclideanSpace ℝ (Fin k),
      (∃ C, ∀ n : ℕ, Real.sqrt n * ‖θs n - θ‖ ≤ C) →
      ∀ A : ∀ n, Set (Fin n → X), (∀ n, MeasurableSet (A n)) →
        (Tendsto (fun n ↦ Measure.pi (fun _ : Fin n ↦ P (θs n) G) (A n)) atTop (𝓝 0) ↔
          Tendsto (fun n ↦ Measure.pi (fun _ : Fin n ↦ P θ G) (A n)) atTop (𝓝 0)))
    (hsmooth : ∀ θ ∈ Θ, ∀ G, ∀ θs : ℕ → EuclideanSpace ℝ (Fin k),
      (∃ C, ∀ n : ℕ, Real.sqrt n * ‖θs n - θ‖ ≤ C) →
      TendstoInProbability (fun n ↦ Measure.pi fun _ : Fin n ↦ P θ G) (fun (n : ℕ) x ↦
        Real.sqrt n • (θs n - θ) +
          (Real.sqrt n)⁻¹ • ∑ i, (ψ (x i) (θs n) G - ψ (x i) θ G)) atTop 0)
    (hprelim : ∃ θt : ∀ n, (Fin n → X) → EuclideanSpace ℝ (Fin k), (∀ n, Measurable (θt n)) ∧
      ∀ θ ∈ Θ, ∀ G, ∀ ε > 0, ∃ M, ∀ᶠ n in atTop,
        Measure.pi (fun _ : Fin n ↦ P θ G) {x | M < Real.sqrt n * ‖θt n x - θ‖} ≤
          ENNReal.ofReal ε)
    (hinfl : ∃ ψh : ∀ m, X → EuclideanSpace ℝ (Fin k) → (Fin m → X) → EuclideanSpace ℝ (Fin k),
      (∀ m, Measurable fun p : X × EuclideanSpace ℝ (Fin k) × (Fin m → X) ↦
        ψh m p.1 p.2.1 p.2.2) ∧
      ∀ θ ∈ Θ, ∀ G, ∀ θs : ℕ → EuclideanSpace ℝ (Fin k),
        (∃ C, ∀ m : ℕ, Real.sqrt m * ‖θs m - θ‖ ≤ C) →
        TendstoInProbability (fun m ↦ Measure.pi fun _ : Fin m ↦ P (θs m) G)
          (fun (m : ℕ) y ↦ Real.sqrt m • ∫ x, ψh m x (θs m) y ∂(P (θs m) G)) atTop 0 ∧
        ∀ ε : ℝ≥0∞, 0 < ε → Tendsto (fun m ↦ Measure.pi (fun _ : Fin m ↦ P (θs m) G)
          {y | ε ≤ ∫⁻ x, ‖ψh m x (θs m) y - ψ x (θs m) G‖ₑ ^ 2 ∂(P (θs m) G)}) atTop (𝓝 0)) :
    ∃ θh : ∀ n, (Fin n → X) → EuclideanSpace ℝ (Fin k), (∀ n, Measurable (θh n)) ∧
      ∀ θ ∈ Θ, ∀ G, ∀ θs : ℕ → EuclideanSpace ℝ (Fin k),
        (∃ C, ∀ n : ℕ, Real.sqrt n * ‖θs n - θ‖ ≤ C) →
        TendstoInProbability (fun n ↦ Measure.pi fun _ : Fin n ↦ P (θs n) G) (fun (n : ℕ) x ↦
          Real.sqrt n • (θh n x - θs n - (n : ℝ)⁻¹ • ∑ i, ψ (x i) (θs n) G)) atTop 0 := sorry

/-- **5.3** The location law with density `η (x - θ)`. -/
def locationLaw (η : ℝ → ℝ) (θ : ℝ) : Measure ℝ :=
  volume.withDensity fun x ↦ ENNReal.ofReal (η (x - θ))

/-- **5.3** A symmetric probability density, absolutely continuous with an odd version `η'` of
its derivative, and of finite Fisher information for location. -/
structure IsSymmetricFiniteInformationDensity (η η' : ℝ → ℝ) : Prop where
  /-- The density is measurable. -/
  measurable : Measurable η
  /-- The density is nonnegative. -/
  nonneg : ∀ x, 0 ≤ η x
  /-- The density has total mass one. -/
  integral_eq_one : ∫ x, η x = 1
  /-- The density is symmetric about zero. -/
  symm : ∀ x, η (-x) = η x
  /-- The derivative is measurable. -/
  measurable_deriv : Measurable η'
  /-- The chosen version of the derivative is odd. -/
  deriv_odd : ∀ x, η' (-x) = -η' x
  /-- The derivative is locally integrable. -/
  intervalIntegrable_deriv : ∀ a b, IntervalIntegrable η' volume a b
  /-- Absolute continuity: the density is the integral of its derivative. -/
  eq_integral_deriv : ∀ x, η x = η 0 + ∫ t in (0 : ℝ)..x, η' t
  /-- Finite Fisher information for location. -/
  integrable_fisher : Integrable fun x ↦ η' x ^ 2 / η x

/-- **5.3** Fisher information for location, `∫ η'² / η`, with `η'²/0 = 0`. -/
def locationFisherInformation (η η' : ℝ → ℝ) : ℝ := ∫ x, η' x ^ 2 / η x

/-- **5.3** The monotone preliminary estimator `θ̃ₙ = sup {t : Σ tanh((xᵢ - t)/2) > 0}`, built on
the logistic score, is measurable and `√n`-consistent at every symmetric probability density. -/
theorem sqrt_consistent_sSup_tanh :
    (∀ n, Measurable fun x : Fin n → ℝ ↦ sSup {t | 0 < ∑ i, Real.tanh ((x i - t) / 2)}) ∧
    ∀ η : ℝ → ℝ, Measurable η → (∀ x, 0 ≤ η x) → ∫ x, η x = 1 → (∀ x, η (-x) = η x) →
      ∀ θ : ℝ, ∀ [IsProbabilityMeasure (locationLaw η θ)], ∀ ε > 0, ∃ M, ∀ᶠ n in atTop,
        Measure.pi (fun _ : Fin n ↦ locationLaw η θ)
            {x | M < Real.sqrt n * |sSup {t | 0 < ∑ i, Real.tanh ((x i - t) / 2)} - θ|} ≤
          ENNReal.ofReal ε := sorry

/-- **5.3** Score estimation (Bickel–Klaassen–Ritov–Wellner, §7.8, Proposition 1): jointly
measurable estimators `ℓ̂ₘ` of the score `-η'/η` from a sample of `η`, consistent in `L²(η)`
(measured in `ℝ≥0∞`) and with `∫ ℓ̂ₘ² η` consistent for `I_η`. -/
theorem exists_score_estimator :
    ∃ ℓh : ∀ m, ℝ → (Fin m → ℝ) → ℝ, (∀ m, Measurable fun p : ℝ × (Fin m → ℝ) ↦ ℓh m p.1 p.2) ∧
      ∀ η η' : ℝ → ℝ, IsSymmetricFiniteInformationDensity η η' →
        ∀ [IsProbabilityMeasure (locationLaw η 0)],
          (∀ ε : ℝ≥0∞, 0 < ε → Tendsto (fun m ↦ Measure.pi (fun _ : Fin m ↦ locationLaw η 0)
            {y | ε ≤ ∫⁻ x, ENNReal.ofReal ((ℓh m x y + η' x / η x) ^ 2 * η x)}) atTop (𝓝 0)) ∧
          TendstoInProbability (fun m ↦ Measure.pi fun _ : Fin m ↦ locationLaw η 0)
            (fun m y ↦ ∫ x, ℓh m x y ^ 2 * η x) atTop (locationFisherInformation η η') := sorry

/-- **5.3** Local linearity of the location score sum (Bickel–Klaassen–Ritov–Wellner,
Proposition 2.1.2, (2.1.15)): for bounded local alternatives `hₙ`,
`n^{-1/2} Σ [ℓ̇(Xᵢ - θ - hₙ/√n) - ℓ̇(Xᵢ - θ)] + I hₙ → 0` in probability under `θ`, with the
score `ℓ̇ = -η'/η` read as `0` where `η` vanishes. The density is that of
`hasPathScore_location`; no symmetry is assumed. -/
theorem tendstoInProbabilityZero_locationScoreSum (η η' : ℝ → ℝ) (hη : ∀ x, 0 ≤ η x)
    (hη1 : ∫ x, η x = 1) (hη' : ∀ a b, IntervalIntegrable η' volume a b)
    (hac : ∀ x, η x = η 0 + ∫ t in (0 : ℝ)..x, η' t)
    (hfisher : Integrable fun x ↦ η' x ^ 2 / η x) (θ : ℝ)
    [IsProbabilityMeasure (locationLaw η θ)] (h : ℕ → ℝ) (hh : ∃ C, ∀ n, |h n| ≤ C) :
    TendstoInProbability (fun n ↦ Measure.pi fun _ : Fin n ↦ locationLaw η θ) (fun (n : ℕ) x ↦
      (Real.sqrt n)⁻¹ * ∑ i, (-(η' (x i - θ - h n / Real.sqrt n) / η (x i - θ - h n / Real.sqrt n))
        + η' (x i - θ) / η (x i - θ)) + locationFisherInformation η η' * h n) atTop 0 := sorry

/-- **5.3** Adaptive estimation of a centre of symmetry: one estimator sequence, not depending on
`η`, is asymptotically linear in the efficient influence function `I_η⁻¹ ℓ̇_η` at every symmetric
density of finite Fisher information and every `θ`. -/
theorem exists_adaptive_estimator_centre_of_symmetry :
    ∃ T : ∀ n, (Fin n → ℝ) → EuclideanSpace ℝ (Fin 1), (∀ n, Measurable (T n)) ∧
      ∀ η η' : ℝ → ℝ, IsSymmetricFiniteInformationDensity η η' → ∀ θ : ℝ,
        ∀ [IsProbabilityMeasure (locationLaw η θ)],
          IsAsymptoticallyLinear (locationLaw η θ) T (WithLp.toLp 2 fun _ ↦ θ)
            (fun x ↦ WithLp.toLp 2 fun _ ↦
              -(η' (x - θ) / η (x - θ)) / locationFisherInformation η η') := sorry

/-- **5.4** Partially linear regression: identification `β = Q⁻¹ E[V (Y - E[Y | X])]`, with
`D` the regressor, `X` the covariate and `V = D - E[D | X]`. -/
theorem partiallyLinear_identification {Ω : Type*} {mΩ : MeasurableSpace Ω} (μ : Measure Ω)
    [IsProbabilityMeasure μ] {d : ℕ} (D : Ω → EuclideanSpace ℝ (Fin d)) (Y : Ω → ℝ)
    (mX : MeasurableSpace Ω) (hmX : mX ≤ mΩ) (mDX : MeasurableSpace Ω) (hmDX : mDX ≤ mΩ)
    (hXDX : mX ≤ mDX) (hD : ∀ j, MemLp (fun ω ↦ D ω j) 2 μ) (hY : MemLp Y 2 μ)
    (hDm : Measurable[mDX] D) (β : EuclideanSpace ℝ (Fin d)) (g : Ω → ℝ)
    (hg : StronglyMeasurable[mX] g) (hgL2 : MemLp g 2 μ)
    (hmodel : μ[Y | mDX] =ᵐ[μ] fun ω ↦ inner ℝ (D ω) β + g ω) :
    let V : Fin d → Ω → ℝ := fun j ↦ (fun ω ↦ D ω j) - μ[fun ω ↦ D ω j | mX]
    let Q : Matrix (Fin d) (Fin d) ℝ := fun i j ↦ ∫ ω, V i ω * V j ω ∂μ
    Q.PosDef →
      WithLp.ofLp β = Q⁻¹.mulVec (fun j ↦ ∫ ω, V j ω * (Y ω - μ[Y | mX] ω) ∂μ) := sorry

end Layer5

/-! ## Layer 6: missing data -/

section Layer6

variable {X : Type*} [MeasurableSpace X]

/-- **6.1** The observed part `(R, X, R Y)` of a full-data triple `(R, X, Y)`. -/
def observe (w : Bool × X × ℝ) : Bool × X × ℝ :=
  (w.1, w.2.1, if w.1 then w.2.2 else 0)

/-- **6.1** Missing at random with propensity `π`, in measure-theoretic form: for every
measurable set `A` of covariate–response pairs, `Q (R = 1, (X, Y) ∈ A) = ∫_{(X,Y) ∈ A} π(X) dQ`. -/
def IsMissingAtRandom (Q : Measure (Bool × X × ℝ)) (π : X → ℝ) : Prop :=
  Measurable π ∧ (∀ x, π x ∈ Icc 0 1) ∧ ∀ A : Set (X × ℝ), MeasurableSet A →
    Q.real {w | w.1 = true ∧ w.2 ∈ A} = ∫ w in {w | w.2 ∈ A}, π w.2.1 ∂Q

/-- **6.1** Missing at random is conditional independence of `R` and `Y` given `X`, with
`π (X)` a version of `P(R = 1 | X)`. -/
theorem isMissingAtRandom_iff_condExp (Q : Measure (Bool × X × ℝ)) [IsProbabilityMeasure Q]
    (π : X → ℝ) (hπ : Measurable π) (hπ01 : ∀ x, π x ∈ Icc 0 1) :
    IsMissingAtRandom Q π ↔
      Q[(fun w ↦ if w.1 then (1 : ℝ) else 0) | MeasurableSpace.comap (fun w ↦ w.2) inferInstance]
        =ᵐ[Q] fun w ↦ π w.2.1 := sorry

/-- **6.1** Consequences of missingness at random: `π (X)` is a version of `P(R = 1 | X)`, and
`R` and `Y` are conditionally independent given `X`. -/
theorem IsMissingAtRandom.condExp_and_condIndepFun [StandardBorelSpace X]
    {Q : Measure (Bool × X × ℝ)} [IsProbabilityMeasure Q] {π : X → ℝ}
    (h : IsMissingAtRandom Q π) :
    Q[(fun w ↦ if w.1 then (1 : ℝ) else 0) | MeasurableSpace.comap (fun w ↦ w.2.1) inferInstance]
        =ᵐ[Q] (fun w ↦ π w.2.1) ∧
      CondIndepFun (MeasurableSpace.comap (fun w : Bool × X × ℝ ↦ w.2.1) inferInstance)
        (measurable_fst.comp measurable_snd).comap_le (fun w ↦ w.1) (fun w ↦ w.2.2) Q := sorry

/-- **6.1** Missing completely at random: if `R` is independent of `(X, Y)`, the data are missing
at random with the constant propensity `P(R = 1)`. -/
theorem isMissingAtRandom_of_indepFun (Q : Measure (Bool × X × ℝ)) [IsProbabilityMeasure Q]
    (h : IndepFun (fun w : Bool × X × ℝ ↦ w.1) (fun w ↦ w.2) Q) :
    IsMissingAtRandom Q (fun _ ↦ Q.real {w | w.1 = true}) := sorry

/-- **6.2** The observed-data density of one observation at a full-data density `f` of `(X, Y)`
and propensity `π`. -/
def observedDensity (ρ : Measure ℝ) (f : X → ℝ → ℝ) (π : X → ℝ) (o : Bool × X × ℝ) : ℝ :=
  if o.1 then π o.2.1 * f o.2.1 o.2.2 else (1 - π o.2.1) * ∫ y, f o.2.1 y ∂ρ

/-- **6.2** The reference measure of observed data: `ν ⊗ ρ` on observed responses and
`ν ⊗ δ₀` on missing ones. -/
def observedReference (ν : Measure X) [SFinite ν] (ρ : Measure ℝ) [SFinite ρ] :
    Measure (Bool × X × ℝ) :=
  (Measure.dirac true).prod (ν.prod ρ) + (Measure.dirac false).prod (ν.prod (Measure.dirac 0))

/-- **6.2** The observed law of a full-data law that is missing at random, with `(X, Y)`-density
`f` with respect to `ν ⊗ ρ`, has density `observedDensity` with respect to
`observedReference ν ρ`. -/
theorem map_observe_eq_withDensity (ν : Measure X) [SigmaFinite ν] (ρ : Measure ℝ)
    [SigmaFinite ρ] (f : X → ℝ → ℝ) (hf : Measurable (Function.uncurry f)) (hf0 : ∀ x y, 0 ≤ f x y)
    (Q : Measure (Bool × X × ℝ)) [IsProbabilityMeasure Q] (π : X → ℝ) (hmar : IsMissingAtRandom Q π)
    (hlaw : Q.map Prod.snd = (ν.prod ρ).withDensity (fun z ↦ ENNReal.ofReal (f z.1 z.2))) :
    Q.map observe = (observedReference ν ρ).withDensity
      (fun o ↦ ENNReal.ofReal (observedDensity ρ f π o)) := sorry

/-- **6.2** Ignorability: when the propensity factor of the observed likelihood is positive,
the maximizers in `θ` of the observed-data likelihood do not depend on `φ` and are those of the
ignorable likelihood (Little–Rubin, Theorem 6.1A). -/
theorem setOf_isMaxOn_observedLikelihood {Θ Φ : Type*} (ρ : Measure ℝ) (f : Θ → X → ℝ → ℝ)
    (π : Φ → X → ℝ) {n : ℕ} (o : Fin n → Bool × X × ℝ) (φ : Φ)
    (hpos : ∀ i, 0 < if (o i).1 then π φ (o i).2.1 else 1 - π φ (o i).2.1) :
    {θ | IsMaxOn (fun θ' ↦ ∏ i, observedDensity ρ (f θ') (π φ) (o i)) univ θ} =
      {θ | IsMaxOn (fun θ' ↦ ∏ i,
        (if (o i).1 then f θ' (o i).2.1 (o i).2.2 else ∫ y, f θ' (o i).2.1 y ∂ρ)) univ θ} := sorry

/-- **6.2** Ignorability for Bayesian inference (Little–Rubin, Theorem 6.1B and Corollary 6.1B):
with a product prior on `Θ × Φ` and data missing at random, the posterior of `θ` from the
observed likelihood equals the posterior from the ignorable likelihood. The ignorable posterior
is that of the joint law `Jign` built with the constant propensity `1/2`, whose likelihood in `θ`
is `2⁻ⁿ` times the ignorable likelihood. -/
theorem condDistrib_fst_ae_eq_ignorable {Θ Φ : Type*} [MeasurableSpace Θ] [StandardBorelSpace Θ]
    [Nonempty Θ] [MeasurableSpace Φ] (ν : Measure X) [SigmaFinite ν] (ρ : Measure ℝ)
    [SigmaFinite ρ] (f : Θ → X → ℝ → ℝ) (hf : Measurable fun p : Θ × X × ℝ ↦ f p.1 p.2.1 p.2.2)
    (hf0 : ∀ θ x y, 0 ≤ f θ x y)
    (hf1 : ∀ θ, ∫⁻ z, ENNReal.ofReal (f θ z.1 z.2) ∂(ν.prod ρ) = 1) (π : Φ → X → ℝ)
    (hπ : Measurable fun p : Φ × X ↦ π p.1 p.2) (hπ01 : ∀ φ x, π φ x ∈ Icc 0 1)
    (pθ : Measure Θ) [IsProbabilityMeasure pθ] (pφ : Measure Φ) [IsProbabilityMeasure pφ]
    {n : ℕ} (J : Measure ((Θ × Φ) × (Fin n → Bool × X × ℝ))) [IsProbabilityMeasure J]
    (hJ : J = ((pθ.prod pφ).prod (Measure.pi fun _ ↦ observedReference ν ρ)).withDensity
      fun ω ↦ ∏ i, ENNReal.ofReal (observedDensity ρ (f ω.1.1) (π ω.1.2) (ω.2 i)))
    (Jign : Measure (Θ × (Fin n → Bool × X × ℝ))) [IsProbabilityMeasure Jign]
    (hJign : Jign = (pθ.prod (Measure.pi fun _ ↦ observedReference ν ρ)).withDensity
      fun ω ↦ ∏ i, ENNReal.ofReal (observedDensity ρ (f ω.1) (fun _ ↦ 1 / 2) (ω.2 i))) :
    ⇑(condDistrib (fun ω ↦ ω.1.1) Prod.snd J) =ᵐ[J.map Prod.snd]
      ⇑(condDistrib Prod.fst Prod.snd Jign) := sorry

/-- **6.3** The augmented inverse-probability-weighted estimating function
`m(x) + r (y - m(x)) / π(x)`, evaluated on observed data. -/
def aipwScore (m π : X → ℝ) (o : Bool × X × ℝ) : ℝ :=
  m o.2.1 + if o.1 then (o.2.2 - m o.2.1) / π o.2.1 else 0

/-- **6.3** The mixed-bias identity behind double robustness: for any `m` and any `π` bounded
away from zero, `E φ_{m,π} - E Y = E[(π₀ - π)(m₀ - m)/π]`. -/
theorem integral_aipwScore_sub (Q : Measure (Bool × X × ℝ)) [IsProbabilityMeasure Q]
    (π₀ m₀ m π : X → ℝ) (hmar : IsMissingAtRandom Q π₀)
    (hY : Integrable (fun w : Bool × X × ℝ ↦ w.2.2) Q) (hm₀ : Measurable m₀)
    (hreg : ∀ A : Set X, MeasurableSet A →
      ∫ w in {w | w.2.1 ∈ A}, w.2.2 ∂Q = ∫ w in {w | w.2.1 ∈ A}, m₀ w.2.1 ∂Q)
    (hm : Integrable (fun w : Bool × X × ℝ ↦ m w.2.1) Q) (hmm : Measurable m)
    (hπm : Measurable π) (δ : ℝ) (hδ : 0 < δ) (hπ : ∀ x, δ ≤ π x)
    (hm₀i : Integrable (fun w : Bool × X × ℝ ↦ m₀ w.2.1) Q) :
    ∫ w, aipwScore m π (observe w) ∂Q - ∫ w, w.2.2 ∂Q =
      ∫ w, (π₀ w.2.1 - π w.2.1) * (m₀ w.2.1 - m w.2.1) / π w.2.1 ∂Q := sorry

/-- **6.3** Double robustness: the augmented estimating function is unbiased when the propensity
is correct, for every measurable `m` with `m(X)` integrable, and when the regression is correct,
for every measurable propensity bounded away from zero. -/
theorem integral_aipwScore_eq (Q : Measure (Bool × X × ℝ)) [IsProbabilityMeasure Q]
    (π₀ m₀ : X → ℝ) (hmar : IsMissingAtRandom Q π₀)
    (hY : Integrable (fun w : Bool × X × ℝ ↦ w.2.2) Q) (hm₀ : Measurable m₀)
    (hreg : ∀ A : Set X, MeasurableSet A →
      ∫ w in {w | w.2.1 ∈ A}, w.2.2 ∂Q = ∫ w in {w | w.2.1 ∈ A}, m₀ w.2.1 ∂Q)
    (hm₀i : Integrable (fun w : Bool × X × ℝ ↦ m₀ w.2.1) Q) (δ : ℝ) (hδ : 0 < δ)
    (hπ₀ : ∀ x, δ ≤ π₀ x) :
    (∀ m : X → ℝ, Measurable m → Integrable (fun w : Bool × X × ℝ ↦ m w.2.1) Q →
      ∫ w, aipwScore m π₀ (observe w) ∂Q = ∫ w, w.2.2 ∂Q) ∧
    ∀ π : X → ℝ, Measurable π → ∀ δ' > 0, (∀ x, δ' ≤ π x) →
      ∫ w, aipwScore m₀ π (observe w) ∂Q = ∫ w, w.2.2 ∂Q := sorry

/-- **6.3** The bias bound `|E φ_{m,π} - E Y| ≤ δ⁻¹ ‖π - π₀‖ ‖m - m₀‖`, with the `L²` norms in
`ℝ≥0∞`. -/
theorem abs_integral_aipwScore_sub_le (Q : Measure (Bool × X × ℝ)) [IsProbabilityMeasure Q]
    (π₀ m₀ m π : X → ℝ) (hmar : IsMissingAtRandom Q π₀)
    (hY : Integrable (fun w : Bool × X × ℝ ↦ w.2.2) Q) (hm₀ : Measurable m₀)
    (hreg : ∀ A : Set X, MeasurableSet A →
      ∫ w in {w | w.2.1 ∈ A}, w.2.2 ∂Q = ∫ w in {w | w.2.1 ∈ A}, m₀ w.2.1 ∂Q)
    (hm : Integrable (fun w : Bool × X × ℝ ↦ m w.2.1) Q) (hmm : Measurable m)
    (hπm : Measurable π) (δ : ℝ) (hδ : 0 < δ) (hπ : ∀ x, δ ≤ π x)
    (hm₀i : Integrable (fun w : Bool × X × ℝ ↦ m₀ w.2.1) Q) :
    ENNReal.ofReal |∫ w, aipwScore m π (observe w) ∂Q - ∫ w, w.2.2 ∂Q| ≤
      ENNReal.ofReal δ⁻¹ * eLpNorm (fun w : Bool × X × ℝ ↦ π w.2.1 - π₀ w.2.1) 2 Q *
        eLpNorm (fun w : Bool × X × ℝ ↦ m w.2.1 - m₀ w.2.1) 2 Q := sorry

/-- **6.4** The identified mean of a missing-at-random response: the integral, over the law of
`X`, of the regression of `Y` on `X` among the observed. -/
def marMean (P : Measure (Bool × X × ℝ)) : ℝ :=
  ∫ o, (∫ y, y ∂(condDistrib (fun o : Bool × X × ℝ ↦ o.2.2) (fun o ↦ o.2.1)
      (P[|{o | o.1 = true}]) o.2.1)) ∂P

/-- **6.4** Identification: under missingness at random with propensity bounded away from zero,
`marMean` of the observed law is the full-data mean of `Y`. -/
theorem marMean_map_observe (Q : Measure (Bool × X × ℝ)) [IsProbabilityMeasure Q]
    (π₀ : X → ℝ) (hmar : IsMissingAtRandom Q π₀)
    (δ : ℝ) (hδ : 0 < δ) (hπ₀ : ∀ x, δ ≤ π₀ x)
    (hY : Integrable (fun w : Bool × X × ℝ ↦ w.2.2) Q) :
    marMean (Q.map observe) = ∫ w, w.2.2 ∂Q := sorry

/-- **6.4** The full-data path through `Q₀` with `(X, Y)`-tilt `a` and propensity
perturbation `π₀ + t π₀ (1 - π₀) e`; its observed law is the observed-data path. -/
def marPath (Q₀ : Measure (Bool × X × ℝ)) (π₀ : X → ℝ) (a : X × ℝ → ℝ) (e : X → ℝ) (t : ℝ) :
    Measure (Bool × X × ℝ) :=
  Q₀.withDensity fun w ↦ ENNReal.ofReal
    ((1 + t * a w.2) * (1 + t * ((if w.1 then 1 else 0) - π₀ w.2.1) * e w.2.1))

/-- **6.4** For small `|t|` the path `marPath` is a probability measure, missing at random with
propensity `π₀ + t π₀ (1 - π₀) e`, and its observed path has score `E[a | O] + (R - π₀(X)) e(X)`
relative to the observed law. -/
theorem isMissingAtRandom_marPath (Q₀ : Measure (Bool × X × ℝ)) [IsProbabilityMeasure Q₀]
    (π₀ : X → ℝ) (hmar : IsMissingAtRandom Q₀ π₀) (a : X × ℝ → ℝ) (ha : Measurable a) (Ca : ℝ)
    (hCa : ∀ z, |a z| ≤ Ca) (ha0 : ∫ w, a w.2 ∂Q₀ = 0) (e : X → ℝ) (he : Measurable e)
    (Ce : ℝ) (hCe : ∀ x, |e x| ≤ Ce) :
    (∀ᶠ t in 𝓝 0, IsProbabilityMeasure (marPath Q₀ π₀ a e t) ∧
      IsMissingAtRandom (marPath Q₀ π₀ a e t) (fun x ↦ π₀ x + t * π₀ x * (1 - π₀ x) * e x)) ∧
    ∃ s : Bool × X × ℝ → ℝ, (∀ᵐ w ∂Q₀, s (observe w) =
        Q₀[fun w ↦ a w.2 + ((if w.1 then 1 else 0) - π₀ w.2.1) * e w.2.1 |
          MeasurableSpace.comap observe inferInstance] w) ∧
      HasPathScore (Q₀.map observe) (fun t ↦ (marPath Q₀ π₀ a e t).map observe) s := sorry

/-- **6.4** The derivative of the identified mean along the observed-data paths is the inner
product of their score with `φ_{m₀,π₀} - μ`; with the density of the scores in `L²₀`, this makes
`φ_{m₀,π₀} - μ` the efficient influence function. -/
theorem hasDerivAt_marMean_marPath (Q₀ : Measure (Bool × X × ℝ)) [IsProbabilityMeasure Q₀]
    (π₀ m₀ : X → ℝ) (hmar : IsMissingAtRandom Q₀ π₀)
    (δ : ℝ) (hδ : 0 < δ) (hπ₀ : ∀ x, δ ≤ π₀ x) (hm₀ : Measurable m₀)
    (hY : MemLp (fun w : Bool × X × ℝ ↦ w.2.2) 2 Q₀)
    (hm₀i : Integrable (fun w : Bool × X × ℝ ↦ m₀ w.2.1) Q₀)
    (hreg : ∀ A : Set X, MeasurableSet A →
      ∫ w in {w | w.2.1 ∈ A}, w.2.2 ∂Q₀ = ∫ w in {w | w.2.1 ∈ A}, m₀ w.2.1 ∂Q₀)
    (a : X × ℝ → ℝ) (ha : Measurable a) (Ca : ℝ) (hCa : ∀ z, |a z| ≤ Ca)
    (ha0 : ∫ w, a w.2 ∂Q₀ = 0) (e : X → ℝ) (he : Measurable e) (Ce : ℝ) (hCe : ∀ x, |e x| ≤ Ce) :
    HasDerivAt (fun t ↦ marMean ((marPath Q₀ π₀ a e t).map observe))
      (∫ w, (aipwScore m₀ π₀ (observe w) - ∫ w', w'.2.2 ∂Q₀) *
        (a w.2 + ((if w.1 then 1 else 0) - π₀ w.2.1) * e w.2.1) ∂Q₀) 0 := sorry

/-- **6.4** The observed-data scores `E[a(X, Y) | O] + (R - π₀(X)) e(X)` of the paths `marPath`
are dense in `L²₀` of the observed law (van der Vaart, Theorem 25.40, missing-at-random case):
a mean-zero `u` orthogonal to all of them vanishes. -/
theorem eq_zero_of_forall_integral_mul_marScore_eq_zero (Q₀ : Measure (Bool × X × ℝ))
    [IsProbabilityMeasure Q₀] (π₀ : X → ℝ) (hmar : IsMissingAtRandom Q₀ π₀) (δ : ℝ)
    (hδ : 0 < δ) (hπ₀ : ∀ x, δ ≤ π₀ x) (u : Lp ℝ 2 (Q₀.map observe))
    (hu : u ∈ meanZeroL2 (Q₀.map observe))
    (horth : ∀ (a : X × ℝ → ℝ) (e : X → ℝ), Measurable a → Measurable e →
      (∃ C, ∀ z, |a z| ≤ C) → (∃ C, ∀ x, |e x| ≤ C) → ∫ w, a w.2 ∂Q₀ = 0 →
      ∫ w, u (observe w) * (a w.2 + ((if w.1 then 1 else 0) - π₀ w.2.1) * e w.2.1) ∂Q₀ = 0) :
    u = 0 := sorry

/-- **6.4** The efficient influence function of a missing mean (van der Vaart, Example 25.43): in
the model of observed laws of full-data laws missing at random with propensity bounded away from
zero and `Y ∈ L²`, along the observed paths of `marPath` indexed by bounded `(a, e)`, the
identified mean is pathwise differentiable with efficient influence function
`φ_{m₀,π₀} - μ`, of variance `Var m₀(X) + E[(Y - m₀(X))² / π₀(X)]`. -/
theorem efficientInfluence_marMean (Q₀ : Measure (Bool × X × ℝ)) [IsProbabilityMeasure Q₀]
    [IsProbabilityMeasure (Q₀.map observe)] (π₀ m₀ : X → ℝ) (hmar : IsMissingAtRandom Q₀ π₀)
    (δ : ℝ) (hδ : 0 < δ) (hπ₀ : ∀ x, δ ≤ π₀ x) (hm₀ : Measurable m₀)
    (hY : MemLp (fun w : Bool × X × ℝ ↦ w.2.2) 2 Q₀)
    (hm₀i : Integrable (fun w : Bool × X × ℝ ↦ m₀ w.2.1) Q₀)
    (hreg : ∀ A : Set X, MeasurableSet A →
      ∫ w in {w | w.2.1 ∈ A}, w.2.2 ∂Q₀ = ∫ w in {w | w.2.1 ∈ A}, m₀ w.2.1 ∂Q₀) :
    ∃ F : PathFamily {P' | ∃ (Q : Measure (Bool × X × ℝ)) (π : X → ℝ) (δ' : ℝ),
          IsProbabilityMeasure Q ∧ 0 < δ' ∧ (∀ x, δ' ≤ π x) ∧ IsMissingAtRandom Q π ∧
            MemLp (fun w : Bool × X × ℝ ↦ w.2.2) 2 Q ∧ P' = Q.map observe}
        (Q₀.map observe) (Q₀.map observe)
        {p : (X × ℝ → ℝ) × (X → ℝ) // Measurable p.1 ∧ Measurable p.2 ∧
          (∃ C, ∀ z, |p.1 z| ≤ C) ∧ (∃ C, ∀ x, |p.2 x| ≤ C) ∧ ∫ w, p.1 w.2 ∂Q₀ = 0},
      (∀ i, ∀ᶠ t in 𝓝[≥] 0, F.path i t = (marPath Q₀ π₀ i.1.1 i.1.2 t).map observe) ∧
      (∃ ψ' : Lp ℝ 2 (Q₀.map observe) →L[ℝ] EuclideanSpace ℝ (Fin 1), HasPathwiseDerivative F
        (fun i t ↦ WithLp.toLp 2 fun _ ↦ marMean (F.path i t)) ψ') ∧
      ∀ ψ' : Lp ℝ 2 (Q₀.map observe) →L[ℝ] EuclideanSpace ℝ (Fin 1), HasPathwiseDerivative F
          (fun i t ↦ WithLp.toLp 2 fun _ ↦ marMean (F.path i t)) ψ' →
        (efficientInfluence F ψ' 0 : Bool × X × ℝ → ℝ) =ᵐ[Q₀.map observe]
            (fun o ↦ aipwScore m₀ π₀ o - ∫ w, w.2.2 ∂Q₀) ∧
          ‖efficientInfluence F ψ' 0‖ ^ 2 =
            ∫ w, (m₀ w.2.1 - ∫ w', w'.2.2 ∂Q₀) ^ 2 ∂Q₀ +
              ∫ w, (w.2.2 - m₀ w.2.1) ^ 2 / π₀ w.2.1 ∂Q₀ := sorry

/-- **6.5** Cross-fitted augmented inverse probability weighting: with nuisance estimators fitted
on the training folds, propensities at least `δ`, `L²(P_X)` consistency of both nuisances and a
product rate `o_P(n^{-1/2})`, the cross-fitted estimator of the missing mean is asymptotically
linear in the efficient influence function `aipwScore m₀ π₀ - μ`. The `L²` distances are taken
in `ℝ≥0∞`, since no upper bound on the fitted propensity is assumed. -/
theorem crossFittedAverage_aipwScore_asymptotically_linear {Ω : Type*} [MeasurableSpace Ω]
    (μ : Measure Ω) [IsProbabilityMeasure μ] (Q : Measure (Bool × X × ℝ)) [IsProbabilityMeasure Q]
    (W : ℕ → Ω → Bool × X × ℝ) (hiid : IsIndependentIdenticallyDistributed μ W Q)
    (π₀ m₀ : X → ℝ) (hmar : IsMissingAtRandom Q π₀) (δ : ℝ) (hδ : 0 < δ)
    (hπ₀ : ∀ x, δ ≤ π₀ x) (hY : MemLp (fun w : Bool × X × ℝ ↦ w.2.2) 2 Q) (hm₀ : Measurable m₀)
    (hm₀L2 : MemLp (fun w : Bool × X × ℝ ↦ m₀ w.2.1) 2 Q)
    (hreg : ∀ A : Set X, MeasurableSet A →
      ∫ w in {w | w.2.1 ∈ A}, w.2.2 ∂Q = ∫ w in {w | w.2.1 ∈ A}, m₀ w.2.1 ∂Q)
    (K : ℕ) (s : ∀ n, SampleSplit n K)
    (fit : ∀ n (k : Fin K), ((s n).training k → Bool × X × ℝ) → (X → ℝ) × (X → ℝ))
    (hfitm : ∀ n (k : Fin K),
      Measurable fun p : ((s n).training k → Bool × X × ℝ) × X ↦ (fit n k p.1).1 p.2)
    (hfitπ : ∀ n (k : Fin K),
      Measurable fun p : ((s n).training k → Bool × X × ℝ) × X ↦ (fit n k p.1).2 p.2)
    (hπδ : ∀ n k p x, δ ≤ (fit n k p).2 x)
    (hmL2 : ∀ n k p, MemLp (fun w : Bool × X × ℝ ↦ (fit n k p).1 w.2.1) 2 Q)
    (hmconv : ∀ k : Fin K, ∀ ε : ℝ≥0∞, 0 < ε → Tendsto (fun n ↦ μ {ω | ε ≤
      eLpNorm (fun w : Bool × X × ℝ ↦
        (fit n k fun j ↦ observe (W j.1.1 ω)).1 w.2.1 - m₀ w.2.1) 2 Q}) atTop (𝓝 0))
    (hπconv : ∀ k : Fin K, ∀ ε : ℝ≥0∞, 0 < ε → Tendsto (fun n ↦ μ {ω | ε ≤
      eLpNorm (fun w : Bool × X × ℝ ↦
        (fit n k fun j ↦ observe (W j.1.1 ω)).2 w.2.1 - π₀ w.2.1) 2 Q}) atTop (𝓝 0))
    (hrate : ∀ k : Fin K, ∀ ε : ℝ≥0∞, 0 < ε → Tendsto (fun (n : ℕ) ↦ μ {ω | ε ≤
      ENNReal.ofReal (Real.sqrt n) *
        eLpNorm (fun w : Bool × X × ℝ ↦
          (fit n k fun j ↦ observe (W j.1.1 ω)).1 w.2.1 - m₀ w.2.1) 2 Q *
        eLpNorm (fun w : Bool × X × ℝ ↦
          (fit n k fun j ↦ observe (W j.1.1 ω)).2 w.2.1 - π₀ w.2.1) 2 Q}) atTop (𝓝 0)) :
    TendstoInMeasure μ (fun (n : ℕ) ω ↦
      Real.sqrt n * (crossFittedAverage (s n) (fit n) (fun h ↦ aipwScore h.1 h.2)
          (fun i ↦ observe (W i.1 ω)) - ∫ w, w.2.2 ∂Q)
        - (Real.sqrt n)⁻¹ * ∑ i : Fin n,
          (aipwScore m₀ π₀ (observe (W i.1 ω)) - ∫ w, w.2.2 ∂Q)) atTop (fun _ ↦ 0) := sorry

end Layer6

/-! ## Layer 7: the EM algorithm and missing information -/

section Layer7

variable {E Z : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E] [FiniteDimensional ℝ E]
  [MeasurableSpace Z] (ρ : Measure Z)

/-- **7.1** The observed-data likelihood: the complete-data density, at the fixed observed data,
integrated over the missing part `z`. -/
def obsLikelihood (f : E → Z → ℝ) (θ : E) : ℝ := ∫ z, f θ z ∂ρ

/-- **7.1** The observed-data log-likelihood. -/
def obsLogLikelihood (f : E → Z → ℝ) (θ : E) : ℝ := Real.log (obsLikelihood ρ f θ)

/-- **7.1** The conditional law of the missing part given the observed data, at `θ`. -/
def missingLaw (f : E → Z → ℝ) (θ : E) : Measure Z :=
  ρ.withDensity fun z ↦ ENNReal.ofReal (f θ z / obsLikelihood ρ f θ)

/-- **7.1** The EM criterion `Q(θ | θ') = E_{θ'}[log f(θ) | observed data]`. -/
def emQ (f : E → Z → ℝ) (θ θ' : E) : ℝ := ∫ z, Real.log (f θ z) ∂missingLaw ρ f θ'

/-- **7.1** `θ''` is an EM step from `θ'` over the parameter set `Θ`. -/
def IsEMStep (Θ : Set E) (f : E → Z → ℝ) (θ' θ'' : E) : Prop :=
  θ'' ∈ Θ ∧ ∀ θ ∈ Θ, emQ ρ f θ θ' ≤ emQ ρ f θ'' θ'

/-- **7.2** The EM identity and inequality: the gain in observed log-likelihood is the gain in
`Q` plus a Kullback–Leibler divergence, so the gain in `Q` bounds it (Little–Rubin, (8.18) with
(8.17)). -/
theorem emQ_sub_le_obsLogLikelihood_sub (f : E → Z → ℝ) (θ θ' : E)
    (hpos : ∀ z, 0 < f θ z) (hpos' : ∀ z, 0 < f θ' z) (hm : Measurable (f θ))
    (hm' : Measurable (f θ')) (hi : Integrable (f θ) ρ) (hi' : Integrable (f θ') ρ)
    (hQ : Integrable (fun z ↦ Real.log (f θ z)) (missingLaw ρ f θ'))
    (hQ' : Integrable (fun z ↦ Real.log (f θ' z)) (missingLaw ρ f θ')) :
    obsLogLikelihood ρ f θ - obsLogLikelihood ρ f θ' =
        emQ ρ f θ θ' - emQ ρ f θ' θ' +
          (InformationTheory.klDiv (missingLaw ρ f θ') (missingLaw ρ f θ)).toReal ∧
      emQ ρ f θ θ' - emQ ρ f θ' θ' ≤ obsLogLikelihood ρ f θ - obsLogLikelihood ρ f θ' := sorry

/-- **7.2** Monotonicity of EM (Little–Rubin, Theorem 8.1); at equality the conditional laws
of the missing part and the values of `Q` agree. -/
theorem obsLogLikelihood_le_of_isEMStep (Θ : Set E) (f : E → Z → ℝ) (θ' θ'' : E)
    (hθ' : θ' ∈ Θ) (h : IsEMStep ρ Θ f θ' θ'') (hpos : ∀ θ ∈ Θ, ∀ z, 0 < f θ z)
    (hm : ∀ θ ∈ Θ, Measurable (f θ)) (hi : ∀ θ ∈ Θ, Integrable (f θ) ρ)
    (hQ : ∀ θ ∈ Θ, Integrable (fun z ↦ Real.log (f θ z)) (missingLaw ρ f θ')) :
    obsLogLikelihood ρ f θ' ≤ obsLogLikelihood ρ f θ'' ∧
      (obsLogLikelihood ρ f θ' = obsLogLikelihood ρ f θ'' →
        missingLaw ρ f θ'' = missingLaw ρ f θ' ∧ emQ ρ f θ'' θ' = emQ ρ f θ' θ') := sorry

/-- **7.2** Stationarity: at an interior maximizer `θ*` of `Q(· | θ*)` where `Q(· | θ*)` has a
gradient and `L` has the same gradient (Fisher's identity), the gradient of `L` vanishes. -/
theorem hasGradientAt_obsLogLikelihood_zero_of_isMaxOn (Θ : Set E) (f : E → Z → ℝ) (θs : E)
    (hΘ : Θ ∈ 𝓝 θs) (hmax : IsMaxOn (fun θ ↦ emQ ρ f θ θs) Θ θs) (gQ : E)
    (hQ : HasGradientAt (fun θ ↦ emQ ρ f θ θs) gQ θs)
    (hfisher : HasGradientAt (obsLogLikelihood ρ f) gQ θs) :
    HasGradientAt (obsLogLikelihood ρ f) 0 θs := sorry

/-- **7.3** Regularity for the information identities on a neighbourhood `U`: positive
measurable densities, `C²` in `θ`, with the complete-data scores, Hessians and density
derivatives dominated by one `ρ`-integrable function, uniformly in `θ, θ' ∈ U`, and complete-data
log-likelihoods integrable under the conditional laws, so that `emQ` is not a junk `0`. -/
structure EMRegular (f : E → Z → ℝ) (U : Set E) : Prop where
  /-- The neighbourhood is open. -/
  isOpen : IsOpen U
  /-- The densities are positive. -/
  pos : ∀ θ ∈ U, ∀ z, 0 < f θ z
  /-- The densities are measurable in the missing part. -/
  measurable : ∀ θ ∈ U, Measurable (f θ)
  /-- The densities are twice continuously differentiable in the parameter. -/
  contDiff : ∀ z, ContDiffOn ℝ 2 (fun θ ↦ f θ z) U
  /-- One integrable function dominates the densities, their derivatives, and the
  conditionally weighted complete-data scores and Hessians. -/
  dominated : ∃ G : Z → ℝ, Integrable G ρ ∧ ∀ θ ∈ U, ∀ θ' ∈ U, ∀ z,
    |f θ z| + ‖fderiv ℝ (fun θ ↦ f θ z) θ‖ + ‖fderiv ℝ (fderiv ℝ fun θ ↦ f θ z) θ‖ ≤ G z ∧
    (‖fderiv ℝ (fun θ ↦ Real.log (f θ z)) θ‖ ^ 2 +
      ‖fderiv ℝ (fderiv ℝ fun θ ↦ Real.log (f θ z)) θ‖) * f θ' z ≤ G z
  /-- The complete-data log-likelihoods are integrable under the conditional laws. -/
  integrable_log : ∀ θ ∈ U, ∀ θ' ∈ U,
    Integrable (fun z ↦ Real.log (f θ z)) (missingLaw ρ f θ')

/-- **7.3** The complete-data score at `θ` as a function of the missing part. -/
def completeScore (f : E → Z → ℝ) (θ : E) (z : Z) : E :=
  gradient (fun θ ↦ Real.log (f θ z)) θ

/-- **7.3** Fisher's identity: the observed score is the conditional mean of the complete
score. -/
theorem hasGradientAt_obsLogLikelihood (f : E → Z → ℝ) (U : Set E) (hf : EMRegular ρ f U)
    (θ : E) (hθ : θ ∈ U) :
    HasGradientAt (obsLogLikelihood ρ f) (∫ z, completeScore f θ z ∂missingLaw ρ f θ) θ := sorry

/-- **7.3** Louis's formula: the observed information is the complete information minus the
conditional covariance of the complete score, which is positive semidefinite. -/
theorem louis_formula [MeasurableSpace E] [BorelSpace E] (f : E → Z → ℝ) (U : Set E)
    (hf : EMRegular ρ f U) (θ : E) (hθ : θ ∈ U) :
    -fderiv ℝ (gradient (obsLogLikelihood ρ f)) θ =
      -fderiv ℝ (gradient fun θ'' ↦ emQ ρ f θ'' θ) θ
        - covarianceOperator ((missingLaw ρ f θ).map (completeScore f θ)) ∧
      (covarianceOperator ((missingLaw ρ f θ).map (completeScore f θ))).IsPositive := sorry

/-- **7.4** The derivative of the EM map at a stationary point: `i_{com} · DM = i_{mis}`. -/
theorem comp_fderiv_emMap_eq [MeasurableSpace E] [BorelSpace E] (f : E → Z → ℝ) (U : Set E)
    (hf : EMRegular ρ f U) (M : E → E) (θs : E) (hθs : θs ∈ U) (hfix : M θs = θs)
    (hstep : ∀ᶠ θ' in 𝓝 θs, M θ' ∈ U ∧ ∀ θ ∈ U, emQ ρ f θ θ' ≤ emQ ρ f (M θ') θ')
    (DM : E →L[ℝ] E) (hM : HasFDerivAt M DM θs) :
    (-fderiv ℝ (gradient fun θ'' ↦ emQ ρ f θ'' θs) θs) ∘L DM =
      covarianceOperator ((missingLaw ρ f θs).map (completeScore f θs)) := sorry

/-- **7.4** Fractions of missing information: in the setting of `comp_fderiv_emMap_eq`, with the
observed information `i_{obs} = -D²L(θ*)` positive definite, the eigenvalues of the derivative
`DM` of the EM map lie in `[0, 1)`. -/
theorem spectrum_subset_Ico_of_comp_eq (f : E → Z → ℝ) (U : Set E) (hf : EMRegular ρ f U)
    (M : E → E) (θs : E) (hθs : θs ∈ U) (hfix : M θs = θs)
    (hstep : ∀ᶠ θ' in 𝓝 θs, M θ' ∈ U ∧ ∀ θ ∈ U, emQ ρ f θ θ' ≤ emQ ρ f (M θ') θ')
    (DM : E →L[ℝ] E) (hM : HasFDerivAt M DM θs)
    (hobs : ∃ c > 0, ∀ v, c * ‖v‖ ^ 2 ≤
      inner ℝ ((-fderiv ℝ (gradient (obsLogLikelihood ρ f)) θs) v) v) :
    spectrum ℝ DM ⊆ Ico 0 1 := sorry

/-- **7.4** Local linear convergence of EM at the rate of the largest fraction of missing
information, in the setting of `spectrum_subset_Ico_of_comp_eq`. -/
theorem tendsto_iterate_emMap (f : E → Z → ℝ) (U : Set E) (hf : EMRegular ρ f U)
    (M : E → E) (θs : E) (hθs : θs ∈ U) (hfix : M θs = θs)
    (hstep : ∀ᶠ θ' in 𝓝 θs, M θ' ∈ U ∧ ∀ θ ∈ U, emQ ρ f θ θ' ≤ emQ ρ f (M θ') θ')
    (DM : E →L[ℝ] E) (hM : HasFDerivAt M DM θs)
    (hobs : ∃ c > 0, ∀ v, c * ‖v‖ ^ 2 ≤
      inner ℝ ((-fderiv ℝ (gradient (obsLogLikelihood ρ f)) θs) v) v) :
    ∃ V ∈ 𝓝 θs, ∀ θ₀ ∈ V, Tendsto (fun t ↦ M^[t] θ₀) atTop (𝓝 θs) ∧
      ∀ r : ℝ, (∀ c ∈ spectrum ℝ DM, c < r) → ∃ C, ∀ t, ‖M^[t] θ₀ - θs‖ ≤ C * r ^ t := sorry

end Layer7

/-! ## Layer 8: multiple imputation -/

section Layer8

variable {M : Type*} [MeasurableSpace M]

/-- **8.1** The conditional law of total variance for nested σ-algebras. -/
theorem condVar_ae_eq_condExp_condVar_add_condVar_condExp {Ω : Type*} {m₁ m₂ m₀ : MeasurableSpace Ω}
    {μ : Measure[m₀] Ω} [IsProbabilityMeasure μ] (h₁₂ : m₁ ≤ m₂) (h₂₀ : m₂ ≤ m₀) {Θ : Ω → ℝ}
    (hΘ : MemLp Θ 2 μ) :
    Var[Θ; μ | m₁] =ᵐ[μ] μ[Var[Θ; μ | m₂] | m₁] + Var[μ[Θ | m₂]; μ | m₁] := sorry

/-- **8.2** The observed-data posterior is the complete-data posterior mixed over the
posterior predictive law of the missing data (Little–Rubin, (10.8)). -/
theorem condDistrib_ae_eq_comp {Ω O : Type*} [MeasurableSpace Ω] [MeasurableSpace O]
    [StandardBorelSpace M] [Nonempty M] (J : Measure Ω) [IsProbabilityMeasure J] (θ : Ω → ℝ)
    (Yo : Ω → O) (Ym : Ω → M) (hθ : Measurable θ) (hYo : Measurable Yo) (hYm : Measurable Ym) :
    ⇑(condDistrib θ Yo J) =ᵐ[J.map Yo]
      ⇑((condDistrib θ (fun ω ↦ (Yo ω, Ym ω)) J) ∘ₖ (Kernel.id ×ₖ condDistrib Ym Yo J)) := sorry

/-- **8.3** The multiple-imputation estimate `θ̄`, the average of the completed-data posterior
means over `D` imputations. -/
def miMean {D : ℕ} (κ : Kernel M ℝ) (z : Fin D → M) : ℝ :=
  (D : ℝ)⁻¹ * ∑ d, ∫ x, x ∂κ (z d)

/-- **8.3** The within-imputation variance `V̄`. -/
def miWithin {D : ℕ} (κ : Kernel M ℝ) (z : Fin D → M) : ℝ :=
  (D : ℝ)⁻¹ * ∑ d, variance id (κ (z d))

/-- **8.3** The between-imputation variance `B`, with divisor `D - 1`. -/
def miBetween {D : ℕ} (κ : Kernel M ℝ) (z : Fin D → M) : ℝ :=
  ((D : ℝ) - 1)⁻¹ * ∑ d, (∫ x, x ∂κ (z d) - miMean κ z) ^ 2

/-- **8.3** Rubin's total variance `T = V̄ + (1 + D⁻¹) B`. -/
def rubinTotalVariance {D : ℕ} (κ : Kernel M ℝ) (z : Fin D → M) : ℝ :=
  miWithin κ z + (1 + (D : ℝ)⁻¹) * miBetween κ z

/-- **8.3** Rubin's combining rules, exact form: given the observed data, with imputations
i.i.d. from the posterior predictive law `ν` and independent of `θ`, `θ̄` has mean
`E(θ | Y_obs)`, and `T` has mean `Var(θ - θ̄ | Y_obs) = Var(θ | Y_obs) + D⁻¹ B_∞`. -/
theorem integral_rubinTotalVariance (ν : Measure M) [IsProbabilityMeasure ν] (κ : Kernel M ℝ)
    [IsMarkovKernel κ] (h2 : Integrable (fun x : ℝ ↦ x ^ 2) (κ ∘ₘ ν)) {D : ℕ} (hD : 2 ≤ D) :
    ∫ z, miMean κ z ∂(Measure.pi fun _ : Fin D ↦ ν) = ∫ x, x ∂(κ ∘ₘ ν) ∧
    ∫ z, rubinTotalVariance κ z ∂(Measure.pi fun _ : Fin D ↦ ν) =
      variance id (κ ∘ₘ ν) + (D : ℝ)⁻¹ * variance (fun z ↦ ∫ x, x ∂κ z) ν ∧
    ∫ p, (p.1 - miMean κ p.2) ^ 2 ∂((κ ∘ₘ ν).prod (Measure.pi fun _ : Fin D ↦ ν)) =
      variance id (κ ∘ₘ ν) + (D : ℝ)⁻¹ * variance (fun z ↦ ∫ x, x ∂κ z) ν := sorry

/-- **8.3** Rubin's combining rules for a vector estimand: the three identities of
`integral_rubinTotalVariance` with squares replaced by outer products and variances by
`covarianceBilin` matrices. -/
theorem integral_rubinTotalVariance_vector {k : ℕ} (ν : Measure M) [IsProbabilityMeasure ν]
    (κ : Kernel M (EuclideanSpace ℝ (Fin k))) [IsMarkovKernel κ]
    (h2 : Integrable (fun x ↦ ‖x‖ ^ 2) (κ ∘ₘ ν)) {D : ℕ} (hD : 2 ≤ D) :
    let mean : M → EuclideanSpace ℝ (Fin k) := fun z ↦ ∫ x, x ∂κ z
    let bar : (Fin D → M) → EuclideanSpace ℝ (Fin k) := fun z ↦ (D : ℝ)⁻¹ • ∑ d, mean (z d)
    let cov : Measure (EuclideanSpace ℝ (Fin k)) → Matrix (Fin k) (Fin k) ℝ := fun μ ↦
      Matrix.of fun i j ↦ covarianceBilin μ (EuclideanSpace.single i 1) (EuclideanSpace.single j 1)
    let T : (Fin D → M) → Matrix (Fin k) (Fin k) ℝ := fun z ↦
      (D : ℝ)⁻¹ • ∑ d, cov (κ (z d)) + (1 + (D : ℝ)⁻¹) • (((D : ℝ) - 1)⁻¹ •
        ∑ d, Matrix.of fun i j ↦ (mean (z d) - bar z) i * (mean (z d) - bar z) j)
    ∫ z, bar z ∂(Measure.pi fun _ : Fin D ↦ ν) = ∫ x, x ∂(κ ∘ₘ ν) ∧
      (∀ i j, ∫ z, T z i j ∂(Measure.pi fun _ : Fin D ↦ ν) =
        cov (κ ∘ₘ ν) i j + (D : ℝ)⁻¹ * cov (ν.map mean) i j) ∧
      ∀ i j, ∫ p, (p.1 - bar p.2) i * (p.1 - bar p.2) j
          ∂((κ ∘ₘ ν).prod (Measure.pi fun _ : Fin D ↦ ν)) =
        cov (κ ∘ₘ ν) i j + (D : ℝ)⁻¹ * cov (ν.map mean) i j := sorry

end Layer8

#check @MeasureTheory.Lp.compMeasurePreservingₗᵢ
#check @ProbabilityTheory.covarianceOperator
#check @ProbabilityTheory.integral_condVar_add_variance_condExp
#check @MeasureTheory.Measure.quantile
#check @Submodule.norm_sq_eq_add_norm_sq_projection

#check @MeasureTheory.MemLp.toLp
#check @MeasureTheory.Lp.const
#check @MeasureTheory.eLpNorm
#check @ClosedSubmodule
#check @Submodule.topologicalClosure
#check @Submodule.orthogonal
#check @Submodule.starProjection
#check @Submodule.HasOrthogonalProjection
#check @InnerProductSpace.toDual
#check @ContinuousLinearMap.adjoint
#check @ContinuousLinearMap.IsPositive
#check @Ring.inverse
#check @ContinuousLinearMap.orthogonal_range
#check @MeasureTheory.Lp.simpleFunc.isDenseEmbedding
#check @BoundedContinuousFunction.toLp_denseRange
#check @MeasureTheory.condExp
#check @MeasureTheory.condExpL2
#check @MeasureTheory.condExp_condExp_of_le
#check @MeasureTheory.setIntegral_condExp
#check @MeasureTheory.condExp_mul_of_stronglyMeasurable_left
#check @ProbabilityTheory.condVar
#check @ProbabilityTheory.condVar_ae_eq_condExp_sq_sub_sq_condExp
#check @ProbabilityTheory.condDistrib
#check @ProbabilityTheory.cond
#check @ProbabilityTheory.CondIndepFun
#check @MeasureTheory.Measure.withDensity
#check @MeasureTheory.Measure.rnDeriv
#check @MeasureTheory.Measure.map
#check @MeasureTheory.Measure.pi
#check @MeasureTheory.Measure.prod
#check @MeasureTheory.Measure.dirac
#check @MeasureTheory.Measure.bind
#check @ProbabilityTheory.Kernel.comp
#check @ProbabilityTheory.Kernel.prod
#check @ProbabilityTheory.Kernel.id
#check @ProbabilityTheory.IsMarkovKernel
#check @StandardBorelSpace
#check @Measurable.measurePreserving
#check @ProbabilityTheory.iIndepFun
#check @ProbabilityTheory.variance
#check @ProbabilityTheory.covarianceBilin
#check @ProbabilityTheory.multivariateGaussian
#check @MeasureTheory.Measure.conv
#check @MeasureTheory.TendstoInMeasure
#check @MeasureTheory.TendstoInDistribution
#check @InformationTheory.klDiv
#check @MeasureTheory.llr
#check @InformationTheory.toReal_klDiv
#check @InformationTheory.integral_llr_add_sub_measure_univ_nonneg
#check @HasDerivWithinAt
#check @HasFDerivAt
#check @gradient
#check @HasGradientAt
#check @ContDiffOn
#check @hasFDerivAt_integral_of_dominated_of_fderiv_le
#check @hasDerivAt_integral_of_dominated_loc_of_deriv_le
#check @spectrum
#check @Real.tanh
#check @Matrix.PosDef
#check @Matrix.PosSemidef
#check @MeasureTheory.Measure.quantile_def
#check @MeasureTheory.Measure.quantile_eq_of_le_cdf_iff
#check @TauCeti.integral_norm_finiteMean_sub_sq
#check @TauCeti.integral_finiteMean_sub_sq
#check @ProbabilityTheory.gaussianReal
#check @ProbabilityTheory.IndepFun
#check @IsMaxOn
#check @ProbabilityTheory.Kernel.variance_comp
#check @ProbabilityTheory.Kernel.covariance_comp

end TauCetiRoadmap.MathematicalStatisticsSemiparametric
