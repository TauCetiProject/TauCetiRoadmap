import Mathlib
import TauCetiRoadmap.ArithmeticDirichletSeries.Suggested
import TauCetiRoadmap.GlobalNumberFields.Suggested
import TauCetiRoadmap.ThetaSeries.Suggested

/-!
# L-functions: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive specification is
`README.md`. These declarations pin the completed-function conventions, the exact supplier
carriers, and the names consumed by downstream zero analysis.

Generic ideal weights, Euler products, summation, density, and Tauberian theory are imported from
`ArithmeticDirichletSeries`. Moduli, ray-class characters, ideles with their coordinates, and Hecke
characters are imported from `GlobalNumberFields`. Poisson summation for a full-rank `ℤ`-lattice
in a finite-dimensional real inner product space, the dual lattice, and the Fourier transform of a
Gaussian on such a space are imported from `ThetaSeries`: `poissonSummation`,
`summable_poisson_left`, `summable_poisson_right`, `dual`, `dual_dual`, `covolume_dual`,
`gaussian`, `gaussian_apply` and `fourier_gaussian`, re-exported below under `TS`. The Layer 1
declarations are the specialization of those to the mixed embedding of a fractional ideal; each is
stated against the supplier's declaration, and the closed checks at the end of Layer 1 apply all
nine, so that a supplier rename breaks the `export` and a supplier retype breaks this file. This
file defines none of the imported carriers and contains no Frobenius or Chebotarev predicate.
-/

namespace TauCetiRoadmap.LFunctions

open Complex Filter NumberField NumberField.InfinitePlace Topology Asymptotics
open IsDedekindDomain (HeightOneSpectrum)
open scoped nonZeroDivisors SchwartzMap FourierTransform RealInnerProductSpace

noncomputable section

universe u

namespace ADS
export TauCetiRoadmap.ArithmeticDirichletSeries
  (NonzeroIdeal IdealArithmeticFunction UnitaryIdealWeight normCoeff EulerProductData
    HasCancellation continuedLFunctionOfWeight regroupByNorm primeVonMangoldtCoeff
    PrimeBoundaryRemainder)
end ADS

namespace GNF
export TauCetiRoadmap.GlobalNumberFields
  (Modulus RayClassGroup RayClassCharacter AlgebraicInfinityType FiniteOrderInfinityType
    ContinuousInfinityType HeckeCharacter IdeleGroup IdeleCongruenceSubgroup ideleFiniteCoord
    ideleInfiniteCoord IsCongrOne finite_rayClassGroup idealClass integralIdealsPrimeTo classMap
    rayClassIdealMainTerm primeToSubgroup)
namespace Modulus
export TauCetiRoadmap.GlobalNumberFields.Modulus
  (one support mem_support_iff support_one exponent)
end Modulus
namespace RayClassCharacter
export TauCetiRoadmap.GlobalNumberFields.RayClassCharacter (induced)
end RayClassCharacter
namespace HeckeCharacter
export TauCetiRoadmap.GlobalNumberFields.HeckeCharacter
  (ofRayClassCharacter shift unitaryPart infinityType IsFiniteOrder
    isFiniteOrder_iff_exists_rayClassCharacter shift_ofRayClassCharacter)
end HeckeCharacter
namespace ContinuousInfinityType
export TauCetiRoadmap.GlobalNumberFields.ContinuousInfinityType (EqOnIdentityComponent)
end ContinuousInfinityType
end GNF

namespace TS
export TauCetiRoadmap.ThetaSeries
  (poissonSummation summable_poisson_left summable_poisson_right dual dual_dual covolume_dual
    gaussian gaussian_apply fourier_gaussian)
end TS

/-! ## Layer 0: completed L-function data -/

/-- Analytic normalization: the functional equation is centered at `1/2`, and `completed`
includes the conductor power. -/
structure AnalyticLFunctionData where
  coeff : ℕ → ℂ
  conductor : ℕ+
  gammaR : Multiset ℂ
  gammaC : Multiset ℂ
  rootNumber : ℂ
  completed : ℂ → ℂ
  polarOrder : ℂ →₀ ℕ

namespace AnalyticLFunctionData

def degree (d : AnalyticLFunctionData) : ℕ := d.gammaR.card + 2 * d.gammaC.card

noncomputable def gammaFactor (d : AnalyticLFunctionData) (s : ℂ) : ℂ :=
  (d.gammaR.map fun μ => Gammaℝ (s + μ)).prod *
    (d.gammaC.map fun ν => Gammaℂ (s + ν)).prod

noncomputable def dualCompleted (d : AnalyticLFunctionData) (s : ℂ) : ℂ :=
  starRingEnd ℂ (d.completed (starRingEnd ℂ s))

noncomputable def reflectedPoint (s : ℂ) : ℂ := 1 - starRingEnd ℂ s

/-- The complete dual card, not merely a second completed function. -/
noncomputable def dual (d : AnalyticLFunctionData) : AnalyticLFunctionData where
  coeff n := starRingEnd ℂ (d.coeff n)
  conductor := d.conductor
  gammaR := d.gammaR.map (starRingEnd ℂ)
  gammaC := d.gammaC.map (starRingEnd ℂ)
  rootNumber := starRingEnd ℂ d.rootNumber
  completed := d.dualCompleted
  polarOrder := d.polarOrder.mapDomain (starRingEnd ℂ)

theorem dual_gammaFactor (d : AnalyticLFunctionData) (s : ℂ) :
    d.dual.gammaFactor s = starRingEnd ℂ (d.gammaFactor (starRingEnd ℂ s)) := sorry

theorem dual_dual (d : AnalyticLFunctionData) : d.dual.dual = d := sorry

theorem dual_degree (d : AnalyticLFunctionData) : d.dual.degree = d.degree := sorry

/-- Compare every arithmetic and analytic field while ignoring the unused coefficient at zero. -/
def EqOffZero (d e : AnalyticLFunctionData) : Prop :=
  (∀ n : ℕ, n ≠ 0 → d.coeff n = e.coeff n) ∧
    d.conductor = e.conductor ∧ d.gammaR = e.gammaR ∧ d.gammaC = e.gammaC ∧
      d.rootNumber = e.rootNumber ∧ d.completed = e.completed ∧ d.polarOrder = e.polarOrder

structure HasDirichletAgreement (d : AnalyticLFunctionData) : Prop where
  coeff_one : d.coeff 1 = 1
  degree_pos : 0 < d.degree
  completes : ∀ s : ℂ, 1 < s.re →
    d.completed s = ((d.conductor : ℕ) : ℂ) ^ (s / 2) * d.gammaFactor s * LSeries d.coeff s

structure HasMeromorphicContinuation (d : AnalyticLFunctionData) : Prop where
  meromorphic : Meromorphic d.completed
  exact_pole_order : ∀ p : ℂ, d.polarOrder p ≠ 0 →
    meromorphicOrderAt d.completed p = (- (d.polarOrder p : ℤ) : WithTop ℤ)
  regular_away : ∀ p : ℂ, d.polarOrder p = 0 → AnalyticAt ℂ d.completed p

structure HasFunctionalEquation (d : AnalyticLFunctionData) : Prop where
  norm_rootNumber : ‖d.rootNumber‖ = 1
  polarOrder_reflect : ∀ s : ℂ, d.polarOrder s = d.polarOrder (reflectedPoint s)
  eq_away : ∀ s : ℂ, d.polarOrder s = 0 → d.polarOrder (reflectedPoint s) = 0 →
    d.completed s = d.rootNumber * d.dual.completed (1 - s)

structure HasAverageCoefficientBound (d : AnalyticLFunctionData) : Prop where
  coeff_avg : ∀ δ : ℝ, 0 < δ →
    (fun n : ℕ => ∑ k ∈ Finset.Icc 1 n, ‖d.coeff k‖) =O[atTop]
      (fun n : ℕ => (n : ℝ) ^ (1 + δ))

theorem dual_hasDirichletAgreement {d : AnalyticLFunctionData}
    (h : d.HasDirichletAgreement) : d.dual.HasDirichletAgreement := sorry

theorem dual_hasMeromorphicContinuation {d : AnalyticLFunctionData}
    (h : d.HasMeromorphicContinuation) : d.dual.HasMeromorphicContinuation := sorry

theorem dual_hasAverageCoefficientBound {d : AnalyticLFunctionData}
    (h : d.HasAverageCoefficientBound) : d.dual.HasAverageCoefficientBound := sorry

theorem hasFunctionalEquation_eventuallyEq {d : AnalyticLFunctionData}
    (hc : d.HasMeromorphicContinuation) (hfe : d.HasFunctionalEquation) (s : ℂ) :
    (fun z => d.completed z) =ᶠ[𝓝[≠] s]
      (fun z => d.rootNumber * d.dual.completed (1 - z)) := sorry

end AnalyticLFunctionData

/-- Arithmetic normalization uses the same completed-function carrier, but fixes the otherwise
unused zeroth Dirichlet coefficient once and for all. General analytic cards retain arbitrary
coefficient zero and continue to be compared with `AnalyticLFunctionData.EqOffZero`. -/
structure ArithmeticLFunctionData extends AnalyticLFunctionData where
  coeff_zero : toAnalyticLFunctionData.coeff 0 = 0

/-- Translation from arithmetic normalization of weight `w` to analytic normalization. -/
structure NormalizationTranslation where
  arithmetic : ArithmeticLFunctionData
  analytic : AnalyticLFunctionData
  weight : ℤ
  coeff_eq : ∀ n : ℕ, n ≠ 0 →
    analytic.coeff n = arithmetic.coeff n / (n : ℂ) ^ ((weight : ℂ) / 2)
  analytic_coeff_zero : analytic.coeff 0 = 0
  gammaR_eq : analytic.gammaR = arithmetic.gammaR.map (fun μ => μ + (weight : ℂ) / 2)
  gammaC_eq : analytic.gammaC = arithmetic.gammaC.map (fun ν => ν + (weight : ℂ) / 2)
  completed_eq : ∀ s : ℂ,
    analytic.completed s =
      (((arithmetic.conductor : ℕ) : ℂ) ^ (-(weight : ℂ) / 4)) *
        arithmetic.completed (s + (weight : ℂ) / 2)
  polarOrder_eq : ∀ p : ℂ,
    analytic.polarOrder p = arithmetic.polarOrder (p + (weight : ℂ) / 2)
  conductor_eq : analytic.conductor = arithmetic.conductor
  rootNumber_eq : analytic.rootNumber = arithmetic.rootNumber

theorem NormalizationTranslation.degree_eq (T : NormalizationTranslation) :
    T.analytic.degree = T.arithmetic.toAnalyticLFunctionData.degree := sorry

/-- The source-card zero convention is derived from the arithmetic card rather than duplicated
as data in every translation. -/
theorem NormalizationTranslation.arithmetic_coeff_zero (T : NormalizationTranslation) :
    T.arithmetic.coeff 0 = 0 :=
  T.arithmetic.coeff_zero

/-- Public off-zero coefficient formula for consumers that should not unfold the translation
record. -/
theorem NormalizationTranslation.coeff_eq_of_ne_zero (T : NormalizationTranslation)
    (n : ℕ) (hn : n ≠ 0) :
    T.analytic.coeff n =
      T.arithmetic.coeff n / (n : ℂ) ^ ((T.weight : ℂ) / 2) :=
  T.coeff_eq n hn

theorem NormalizationTranslation.existsUnique (a : ArithmeticLFunctionData) (weight : ℤ) :
    ∃! T : NormalizationTranslation, T.arithmetic = a ∧ T.weight = weight := sorry

/-- The canonical translation selected by the existence-and-uniqueness theorem. -/
noncomputable def NormalizationTranslation.of
    (a : ArithmeticLFunctionData) (weight : ℤ) : NormalizationTranslation :=
  (NormalizationTranslation.existsUnique a weight).exists.choose

theorem NormalizationTranslation.of_spec (a : ArithmeticLFunctionData) (weight : ℤ) :
    (NormalizationTranslation.of a weight).arithmetic = a ∧
      (NormalizationTranslation.of a weight).weight = weight :=
  (NormalizationTranslation.existsUnique a weight).exists.choose_spec

/-- **The functional equation translates field by field.** The three clauses are the three fields
of `HasFunctionalEquation` read through the translation: the root number is unchanged; the polar
divisor reflects at `w + 1 - conj s`, the image of the analytic reflection `1 - conj p` under
`p ↦ p + w/2`; and the value equation holds off both polar loci. ⚠ The middle clause is not
implied by the other two — `malformedPolarCard` satisfies both of them with a polar divisor
supported at `0` alone, and has no functional equation — so an equivalence stated with the value
equation only is false. -/
theorem NormalizationTranslation.hasFunctionalEquation_iff (T : NormalizationTranslation) :
    T.analytic.HasFunctionalEquation ↔
      ‖T.arithmetic.rootNumber‖ = 1 ∧
        (∀ s : ℂ, T.arithmetic.polarOrder s =
          T.arithmetic.polarOrder ((T.weight : ℂ) + 1 - starRingEnd ℂ s)) ∧
        ∀ s : ℂ, T.arithmetic.polarOrder s = 0 →
          T.arithmetic.polarOrder ((T.weight : ℂ) + 1 - starRingEnd ℂ s) = 0 →
            T.arithmetic.completed s = T.arithmetic.rootNumber *
              T.arithmetic.toAnalyticLFunctionData.dualCompleted
                ((T.weight : ℂ) + 1 - s) := sorry

theorem NormalizationTranslation.eq_of_weight_zero (T : NormalizationTranslation)
    (h : T.weight = 0) : T.analytic = T.arithmetic.toAnalyticLFunctionData := sorry

/-- Exact weight-zero regression: the structural zeroth-coefficient convention makes equality
of the complete cards sound, not merely equality away from zero. -/
example (a : ArithmeticLFunctionData) :
    (NormalizationTranslation.of a 0).analytic = a.toAnalyticLFunctionData := by
  rw [NormalizationTranslation.eq_of_weight_zero _
      (NormalizationTranslation.of_spec a 0).2,
    (NormalizationTranslation.of_spec a 0).1]

/-- ⚠ **Regression against weakening `hasFunctionalEquation_iff` to the value equation.** Weight
zero, conductor one, root number one, completed function identically zero, coefficient zero equal
to zero, and a polar divisor supported at `0` only. Every value equation is `0 = 0`, so the root
number and value clauses hold (`malformedPolarCard_value_equation`); but the polar divisor is not
reflection-symmetric — `polarOrder 0 = 1 ≠ 0 = polarOrder 1` — so the card has no functional
equation (`not_hasFunctionalEquation_malformedPolarCard`), and neither does its weight-zero
translation. Nothing in the hypotheses of `hasFunctionalEquation_iff` excludes such a card: it is
not required to satisfy `HasMeromorphicContinuation`. -/
noncomputable def malformedPolarCard : ArithmeticLFunctionData where
  coeff _ := 0
  conductor := 1
  gammaR := 0
  gammaC := 0
  rootNumber := 1
  completed _ := 0
  polarOrder := Finsupp.single 0 1
  coeff_zero := rfl

theorem malformedPolarCard_value_equation :
    ‖malformedPolarCard.rootNumber‖ = 1 ∧
      ∀ s : ℂ, malformedPolarCard.polarOrder s = 0 →
        malformedPolarCard.polarOrder (((0 : ℤ) : ℂ) + 1 - starRingEnd ℂ s) = 0 →
          malformedPolarCard.completed s = malformedPolarCard.rootNumber *
            malformedPolarCard.toAnalyticLFunctionData.dualCompleted
              (((0 : ℤ) : ℂ) + 1 - s) := by
  refine ⟨by simp [malformedPolarCard], fun s _ _ ↦ ?_⟩
  simp [malformedPolarCard, AnalyticLFunctionData.dualCompleted]

theorem malformedPolarCard_not_polarOrder_reflect :
    ¬ ∀ s : ℂ, malformedPolarCard.polarOrder s =
      malformedPolarCard.polarOrder (((0 : ℤ) : ℂ) + 1 - starRingEnd ℂ s) := by
  intro h
  have := h 0
  simp [malformedPolarCard] at this

theorem not_hasFunctionalEquation_malformedPolarCard :
    ¬ malformedPolarCard.toAnalyticLFunctionData.HasFunctionalEquation := by
  intro h
  have := h.polarOrder_reflect 0
  simp [malformedPolarCard, AnalyticLFunctionData.reflectedPoint] at this

/-- The weight-zero translation of the malformed card has no functional equation either, by
`eq_of_weight_zero`. An equivalence omitting the polar clause would prove one for it. -/
theorem not_hasFunctionalEquation_of_malformedPolarCard :
    ¬ (NormalizationTranslation.of malformedPolarCard 0).analytic.HasFunctionalEquation := by
  rw [NormalizationTranslation.eq_of_weight_zero _
      (NormalizationTranslation.of_spec malformedPolarCard 0).2,
    (NormalizationTranslation.of_spec malformedPolarCard 0).1]
  exact not_hasFunctionalEquation_malformedPolarCard

theorem NormalizationTranslation.gammaC_delta (T : NormalizationTranslation)
    (hw : T.weight = 11) (hC : T.arithmetic.gammaC = {0})
    (hR : T.arithmetic.gammaR = 0) :
    T.analytic.gammaC = {(11 : ℂ) / 2} ∧ T.analytic.degree = 2 := sorry

/-- Layer 0: the Riemann-zeta instance of the completed-function card.  Keeping this named card
separate from `dedekindZetaData ℚ` supplies the exact normalization tests consumed by the zeros
roadmap. -/
noncomputable def riemannZetaData : AnalyticLFunctionData where
  coeff _ := 1
  conductor := 1
  gammaR := {0}
  gammaC := 0
  rootNumber := 1
  completed := completedRiemannZeta
  polarOrder := Finsupp.single 0 1 + Finsupp.single 1 1

theorem riemannZetaData_hasDirichletAgreement :
    riemannZetaData.HasDirichletAgreement := sorry

theorem riemannZetaData_hasContinuation :
    riemannZetaData.HasMeromorphicContinuation := sorry

theorem riemannZetaData_hasFunctionalEquation :
    riemannZetaData.HasFunctionalEquation := sorry

/-! ## Layer 1: the mixed-space specialization of Poisson summation, and theta

Nothing generic is developed here. `TauCetiRoadmap.ThetaSeries` owns lattice Poisson summation,
the dual lattice and the Gaussian Fourier transform, and is imported. This section fixes the
Fourier conventions of the mixed space, transports the supplier's theorem onto it along Mathlib's
`NumberField.mixedEmbedding.euclidean.toMixed`, and compares the Euclidean dual of an ideal
lattice with its trace dual. Every declaration with a generic ancestor is stated against that
ancestor, and the closed checks at the end of the layer apply all nine consumed names. -/

/-- **A functional-equation pair with level: the carrier of the Mellin principle** (Neukirch VII
(1.4)). Two functions on `(0, ∞)` with limits `fLimit`, `gLimit` at `∞` approached exponentially
fast, related by the transformation law `f (1/(level t)) = ε t^weight g t`, in which the `epsilon`
field occurs. `completed` is the Mellin transform `L(f, s) = ∫ (f t - fLimit) t^s dt/t`, which
converges for `Re s > weight`; the principle (`meromorphic_completed`, `completed_eq`,
`residue_zero`, `residue_weight`) continues it to the plane with simple poles at `0` and `weight`
of residues `-fLimit` and `ε level^(-weight) gLimit`, and gives
`L(f, s) = ε level^(-s) L(g, weight - s)`. The Dedekind and Grossencharacter kernels of Layers 3
and 6 are instances (`dedekindFEPair`, `grossencharacterFEPair`); this is how their completed
functions are continued and their functional equations proved. -/
structure FEPairWithLevel (E : Type*) [NormedAddCommGroup E] [NormedSpace ℂ E] where
  f : ℝ → E
  g : ℝ → E
  fLimit : E
  gLimit : E
  level : ℝ
  level_pos : 0 < level
  weight : ℝ
  epsilon : ℂ
  transform : ∀ t : ℝ, 0 < t →
    f (1 / (level * t)) = epsilon • ((((t ^ weight : ℝ) : ℂ)) • g t)
  f_decay : ∃ c α : ℝ, 0 < c ∧ 0 < α ∧
    (fun t ↦ f t - fLimit) =O[atTop] fun t : ℝ ↦ Real.exp (-c * t ^ α)
  g_decay : ∃ c α : ℝ, 0 < c ∧ 0 < α ∧
    (fun t ↦ g t - gLimit) =O[atTop] fun t : ℝ ↦ Real.exp (-c * t ^ α)

namespace FEPairWithLevel

variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℂ E]

/-- The pair read backwards: `g (1/(level t)) = ε⁻¹ level^weight t^weight f t`. -/
noncomputable def swap (P : FEPairWithLevel E) : FEPairWithLevel E where
  f := P.g
  g := P.f
  fLimit := P.gLimit
  gLimit := P.fLimit
  level := P.level
  level_pos := P.level_pos
  weight := P.weight
  epsilon := P.epsilon⁻¹ * ((P.level ^ P.weight : ℝ) : ℂ)
  transform := sorry
  f_decay := P.g_decay
  g_decay := P.f_decay

/-- The continued Mellin transform of `f`, pinned by `completed_eq_mellin` on `Re s > weight` and
by `meromorphic_completed` everywhere. -/
noncomputable def completed (P : FEPairWithLevel E) : ℂ → E := sorry

theorem completed_eq_mellin (P : FEPairWithLevel E) {s : ℂ} (hs : P.weight < s.re) :
    P.completed s = ∫ t in Set.Ioi (0 : ℝ), ((t : ℂ) ^ s / (t : ℂ)) • (P.f t - P.fLimit) := sorry

theorem meromorphic_completed (P : FEPairWithLevel E) : Meromorphic P.completed := sorry

theorem analyticAt_completed (P : FEPairWithLevel E) {s : ℂ} (h0 : s ≠ 0)
    (hw : s ≠ P.weight) : AnalyticAt ℂ P.completed s := sorry

/-- **The Mellin principle**, Neukirch VII (1.4): `L(f, s) = ε level^(-s) L(g, weight - s)`,
pointwise off the poles and as germs everywhere. -/
theorem completed_eq (P : FEPairWithLevel E) {s : ℂ} (h0 : s ≠ 0) (hw : s ≠ P.weight) :
    P.completed s =
      (P.epsilon * ((P.level : ℂ) ^ (-s))) • P.swap.completed ((P.weight : ℂ) - s) := sorry

theorem completed_eventuallyEq (P : FEPairWithLevel E) (s : ℂ) :
    P.completed =ᶠ[𝓝[≠] s]
      fun z ↦ (P.epsilon * ((P.level : ℂ) ^ (-z))) • P.swap.completed ((P.weight : ℂ) - z) :=
  sorry

theorem residue_zero (P : FEPairWithLevel E) :
    Tendsto (fun s : ℂ ↦ s • P.completed s) (𝓝[≠] 0) (𝓝 (-P.fLimit)) := sorry

theorem residue_weight (P : FEPairWithLevel E) :
    Tendsto (fun s : ℂ ↦ (s - P.weight) • P.completed s) (𝓝[≠] (P.weight : ℂ))
      (𝓝 ((P.epsilon * ((P.level : ℂ) ^ (-(P.weight : ℂ)))) • P.gLimit)) := sorry

end FEPairWithLevel

noncomputable def mixedInner (K : Type u) [Field K] [NumberField K]
    (x y : mixedEmbedding.mixedSpace K) : ℝ :=
  letI : Fintype {place : InfinitePlace K // place.IsReal} := Fintype.ofFinite _
  letI : Fintype {place : InfinitePlace K // place.IsComplex} := Fintype.ofFinite _
  ∑ place : {place : InfinitePlace K // place.IsReal}, x.1 place * y.1 place +
    ∑ place : {place : InfinitePlace K // place.IsComplex},
      (x.2 place * starRingEnd ℂ (y.2 place)).re

open scoped Classical in
/-- **The bridge to the generic Poisson theorem.** `mixedSpace K` carries a product sup norm and
is not an inner product space, so `TauCetiRoadmap.ThetaSeries.poissonSummation` — which is stated
for a finite-dimensional real inner product space — does not apply to it directly. Mathlib's
`NumberField.mixedEmbedding.euclidean.mixedSpace` is an inner product space, and this says that
Mathlib's equivalence `euclidean.toMixed` carries its inner product to `mixedInner`. Together with
`NumberField.mixedEmbedding.euclidean.volumePreserving_toMixed`, which carries `volume` to
`volume`, it is what makes `poissonSummation_idealLattice` below a transported instance of the
generic theorem rather than a second development of it. -/
theorem mixedInner_toMixed (K : Type u) [Field K] [NumberField K]
    (x y : mixedEmbedding.euclidean.mixedSpace K) :
    mixedInner K (mixedEmbedding.euclidean.toMixed K x)
        (mixedEmbedding.euclidean.toMixed K y) = inner ℝ x y := sorry

noncomputable def traceToEuclidean
    (K : Type u) [Field K] [NumberField K] :
    mixedEmbedding.mixedSpace K →ₗ[ℝ] mixedEmbedding.mixedSpace K where
  toFun x := (x.1, fun place => 2 * starRingEnd ℂ (x.2 place))
  map_add' := sorry
  map_smul' := sorry

/-- One complex coordinate contributes determinant `-4`, so its absolute contribution is `4`. -/
theorem det_traceToEuclidean (K : Type u) [Field K] [NumberField K] :
    LinearMap.det (traceToEuclidean K) = (-4 : ℝ) ^ nrComplexPlaces K := sorry

/-- The Euclidean dual is the trace dual transported by `traceToEuclidean`. -/
theorem analyticDual_mixedEmbedding
    (K : Type u) [Field K] [NumberField K]
    (I : FractionalIdeal (𝓞 K)⁰ K) (hI : I ≠ 0) :
    {y : mixedEmbedding.mixedSpace K | ∀ x ∈ mixedEmbedding K '' (I : Set K),
        ∃ n : ℤ, mixedInner K x y = (n : ℝ)} =
      traceToEuclidean K '' (mixedEmbedding K '' (FractionalIdeal.dual ℤ ℚ I : Set K)) := sorry

/-- `mixedInner` as a bilinear form, the pairing that the Fourier transform below is taken
against. -/
noncomputable def mixedInnerBilin (K : Type u) [Field K] [NumberField K] :
    mixedEmbedding.mixedSpace K →ₗ[ℝ] mixedEmbedding.mixedSpace K →ₗ[ℝ] ℝ :=
  LinearMap.mk₂ ℝ (mixedInner K) sorry sorry sorry sorry

open scoped Classical in
/-- **The Fourier transform of the mixed space, with every choice fixed.** The additive character
is Mathlib's `Real.fourierChar`, so `𝐞 x = exp (2 π i x)`; the pairing is the Euclidean
`mixedInner`, not the trace form; the measure is `volume`, which is self-dual for that pairing;
and the sign is Mathlib's, `𝐞 (-⟨x, y⟩)`. The trace form differs from `mixedInner` by
`traceToEuclidean`, of absolute determinant `4 ^ r₂`, which is where the factor `2 ^ (-r₂)` in the
covolume comes from. -/
noncomputable def mixedFourier (K : Type u) [Field K] [NumberField K]
    (f : mixedEmbedding.mixedSpace K → ℂ) : mixedEmbedding.mixedSpace K → ℂ :=
  VectorFourier.fourierIntegral Real.fourierChar MeasureTheory.volume (mixedInnerBilin K) f

open scoped Classical in
/-- **The Fourier transform transports along the change of model.** In Mathlib's Euclidean model
the four choices fixed in `mixedFourier` are those of Mathlib's `𝓕`: `mixedInner_toMixed` carries
the inner product to `mixedInner`, and Mathlib's `euclidean.volumePreserving_toMixed` carries
`volume` to `volume`. This is the Fourier half of the transport of the supplier's Poisson
theorem. -/
theorem mixedFourier_toMixed (K : Type u) [Field K] [NumberField K]
    (f : mixedEmbedding.mixedSpace K → ℂ) (y : mixedEmbedding.euclidean.mixedSpace K) :
    mixedFourier K f (mixedEmbedding.euclidean.toMixed K y) =
      𝓕 (fun x : mixedEmbedding.euclidean.mixedSpace K ↦
        f (mixedEmbedding.euclidean.toMixed K x)) y := sorry

open scoped Classical in
/-- The ideal lattice read in Mathlib's Euclidean model of the mixed space, where the generic
Poisson theorem applies. Both instances below are found by `infer_instance`, so this really is a
full-rank `ℤ`-lattice of an inner product space. -/
noncomputable def euclideanIdealLattice (K : Type u) [Field K] [NumberField K]
    (I : (FractionalIdeal (𝓞 K)⁰ K)ˣ) :
    Submodule ℤ (mixedEmbedding.euclidean.mixedSpace K) :=
  ZLattice.comap ℝ (mixedEmbedding.idealLattice K I)
    (mixedEmbedding.euclidean.toMixed K).toLinearMap

open scoped Classical in
instance (K : Type u) [Field K] [NumberField K] (I : (FractionalIdeal (𝓞 K)⁰ K)ˣ) :
    DiscreteTopology (euclideanIdealLattice K I) := by
  unfold euclideanIdealLattice; infer_instance

open scoped Classical in
instance (K : Type u) [Field K] [NumberField K] (I : (FractionalIdeal (𝓞 K)⁰ K)ˣ) :
    IsZLattice ℝ (euclideanIdealLattice K I) := by
  unfold euclideanIdealLattice; infer_instance

open scoped Classical in
/-- The change of model preserves the covolume: Mathlib's `ZLattice.covolume_comap` along the
volume-preserving `euclidean.toMixed`. This is the measure half of the transport. -/
theorem covolume_euclideanIdealLattice (K : Type u) [Field K] [NumberField K]
    (I : (FractionalIdeal (𝓞 K)⁰ K)ˣ) :
    ZLattice.covolume (euclideanIdealLattice K I) =
      ZLattice.covolume (mixedEmbedding.idealLattice K I) := by
  have h := ZLattice.covolume_comap (mixedEmbedding.idealLattice K I)
    (e := mixedEmbedding.euclidean.toMixed K)
    (he := mixedEmbedding.euclidean.volumePreserving_toMixed K)
  unfold euclideanIdealLattice
  exact h

/-- The Gaussian `exp (-π t Q x)` of the Euclidean pairing. It is the supplier's
`TauCetiRoadmap.ThetaSeries.gaussian` on the imaginary axis, at `τ = t * I`, read in the mixed
space; `mixedGaussian_toMixed` is that identification, closed by the supplier's `gaussian_apply`.
Hecke's method uses only that ray, and the holomorphic upper-half-plane theta built from the rest
of it belongs to that roadmap. -/
noncomputable def mixedGaussian (K : Type u) [Field K] [NumberField K] (t : ℝ)
    (x : mixedEmbedding.mixedSpace K) : ℂ :=
  Complex.exp ((-Real.pi * t * mixedInner K x x : ℝ) : ℂ)

open scoped Classical in
/-- `mixedGaussian K t` is `ThetaSeries.gaussian` at `τ = t * I`, transported by
`euclidean.toMixed`. Closed by the supplier's `gaussian_apply` and by `mixedInner_toMixed`. -/
theorem mixedGaussian_toMixed (K : Type u) [Field K] [NumberField K] {t : ℝ} (ht : 0 < t)
    (x : mixedEmbedding.euclidean.mixedSpace K) :
    mixedGaussian K t (mixedEmbedding.euclidean.toMixed K x) =
      TS.gaussian (UpperHalfPlane.mk ((t : ℂ) * Complex.I) (by simpa using ht)) x := by
  rw [TS.gaussian_apply, mixedGaussian, mixedInner_toMixed, real_inner_self_eq_norm_sq,
    UpperHalfPlane.coe_mk]
  push_cast
  congr 1
  linear_combination (-(Real.pi : ℂ) * t * ‖x‖ ^ 2) * Complex.I_sq

open scoped Classical in
/-- **`ThetaSeries.fourier_gaussian` on the imaginary axis.** At `τ = t * I` the Gaussian is
self-dual with the factor `t ^ (-[K:ℚ]/2)`: `τ / I = t`, `-1 / τ = t⁻¹ * I`, and
`finrank ℝ (euclidean.mixedSpace K) = finrank ℚ K` is Mathlib's `euclidean.finrank`. Through
`mixedGaussian_toMixed` and `mixedFourier_toMixed` this is the first conjunct of
`gaussianTheta_mellin_normalization`. -/
theorem fourier_gaussian_imaginaryAxis (K : Type u) [Field K] [NumberField K] {t : ℝ}
    (ht : 0 < t) (y : mixedEmbedding.euclidean.mixedSpace K) :
    𝓕 (fun x : mixedEmbedding.euclidean.mixedSpace K ↦
        (TS.gaussian (UpperHalfPlane.mk ((t : ℂ) * Complex.I) (by simpa using ht)) :
          mixedEmbedding.euclidean.mixedSpace K → ℂ) x) y =
      (t : ℂ) ^ (-(Module.finrank ℚ K : ℂ) / 2) *
        TS.gaussian (UpperHalfPlane.mk (((t⁻¹ : ℝ) : ℂ) * Complex.I) (by simpa using ht)) y :=
  sorry

open scoped Classical in
/-- **The dual of the ideal lattice is the supplier's `dual`**, taken in the Euclidean model
where the inner product lives and pulled back to the mixed space along `euclidean.toMixed`. It is
not a second dual-lattice notion. `mem_dualIdealLattice_iff` is its elementwise description in the
mixed space, the form that `analyticDual_mixedEmbedding` compares with the trace dual; its
biduality and its covolume are the supplier's `dual_dual` and `covolume_dual`, consumed by the
closed proofs `dual_comap_dualIdealLattice` and `covolume_dualIdealLattice`. -/
noncomputable def dualIdealLattice (K : Type u) [Field K] [NumberField K]
    (I : (FractionalIdeal (𝓞 K)⁰ K)ˣ) : Submodule ℤ (mixedEmbedding.mixedSpace K) :=
  ZLattice.comap ℝ (TS.dual (euclideanIdealLattice K I))
    (mixedEmbedding.euclidean.toMixed K).symm.toLinearMap

open scoped Classical in
instance (K : Type u) [Field K] [NumberField K] (I : (FractionalIdeal (𝓞 K)⁰ K)ˣ) :
    DiscreteTopology (dualIdealLattice K I) := by
  unfold dualIdealLattice; infer_instance

open scoped Classical in
instance (K : Type u) [Field K] [NumberField K] (I : (FractionalIdeal (𝓞 K)⁰ K)ˣ) :
    IsZLattice ℝ (dualIdealLattice K I) := by
  unfold dualIdealLattice; infer_instance

open scoped Classical in
/-- The elementwise description of the dual ideal lattice in the mixed space, by
`mixedInner_toMixed` and the definition of the supplier's `dual` as Mathlib's
`BilinForm.dualSubmodule` of the inner product. -/
theorem mem_dualIdealLattice_iff (K : Type u) [Field K] [NumberField K]
    (I : (FractionalIdeal (𝓞 K)⁰ K)ˣ) (y : mixedEmbedding.mixedSpace K) :
    y ∈ dualIdealLattice K I ↔
      ∀ x ∈ mixedEmbedding.idealLattice K I, ∃ n : ℤ, mixedInner K x y = (n : ℝ) := sorry

open scoped Classical in
/-- The dual ideal lattice is the trace dual transported by `traceToEuclidean`:
`analyticDual_mixedEmbedding` read through `mem_dualIdealLattice_iff`. -/
theorem coe_dualIdealLattice (K : Type u) [Field K] [NumberField K]
    (I : (FractionalIdeal (𝓞 K)⁰ K)ˣ) :
    (dualIdealLattice K I : Set (mixedEmbedding.mixedSpace K)) =
      traceToEuclidean K '' (mixedEmbedding K ''
        (FractionalIdeal.dual ℤ ℚ (I : FractionalIdeal (𝓞 K)⁰ K) : Set K)) := sorry

open scoped Classical in
/-- Biduality, consumed from `ThetaSeries.dual_dual`: read back in the Euclidean model,
`dualIdealLattice` is the supplier's dual of `euclideanIdealLattice`, whose dual is
`euclideanIdealLattice` again. -/
theorem dual_comap_dualIdealLattice (K : Type u) [Field K] [NumberField K]
    (I : (FractionalIdeal (𝓞 K)⁰ K)ˣ) :
    TS.dual (ZLattice.comap ℝ (dualIdealLattice K I)
        (mixedEmbedding.euclidean.toMixed K).toLinearMap) = euclideanIdealLattice K I := by
  have h : (mixedEmbedding.euclidean.toMixed K).symm.toLinearMap ∘ₗ
      (mixedEmbedding.euclidean.toMixed K).toLinearMap = 1 := by
    ext x; simp
  rw [dualIdealLattice, ZLattice.comap_comp, h, ZLattice.comap_refl, TS.dual_dual]

open scoped Classical in
/-- The covolume of the dual ideal lattice, consumed from `ThetaSeries.covolume_dual` through the
two changes of model; there is no second determinant computation. -/
theorem covolume_dualIdealLattice (K : Type u) [Field K] [NumberField K]
    (I : (FractionalIdeal (𝓞 K)⁰ K)ˣ) :
    ZLattice.covolume (dualIdealLattice K I) =
      (ZLattice.covolume (mixedEmbedding.idealLattice K I))⁻¹ := by
  have h := ZLattice.covolume_comap (TS.dual (euclideanIdealLattice K I))
    (e := (mixedEmbedding.euclidean.toMixed K).symm)
    (he := mixedEmbedding.euclidean.volumePreserving_toMixed_symm K)
  rw [dualIdealLattice, h, TS.covolume_dual, covolume_euclideanIdealLattice]

open scoped Classical in
/-- Poisson summation over an ideal lattice of the mixed space. **This is
`ThetaSeries.poissonSummation (euclideanIdealLattice K I) g 0` for `g = f ∘ euclidean.toMixed`,
transported by `mixedFourier_toMixed`, by `dualIdealLattice` — the supplier's `dual`, pulled back
— and by `covolume_euclideanIdealLattice`**; the generic theorem is owned there and is not
restated here. The covolume is Mathlib's `ZLattice.covolume`, evaluated by
`NumberField.mixedEmbedding.covolume_idealLattice` as `N(I) * 2 ^ (-r₂) * √|d_K|`; this roadmap
does not restate that computation either. -/
theorem poissonSummation_idealLattice (K : Type u) [Field K] [NumberField K]
    (I : (FractionalIdeal (𝓞 K)⁰ K)ˣ)
    (f : SchwartzMap (mixedEmbedding.mixedSpace K) ℂ) :
    ∑' x : mixedEmbedding.idealLattice K I, f (x : mixedEmbedding.mixedSpace K) =
      ((ZLattice.covolume (mixedEmbedding.idealLattice K I) : ℝ) : ℂ)⁻¹ *
        ∑' y : dualIdealLattice K I,
          mixedFourier K (fun z ↦ f z) (y : mixedEmbedding.mixedSpace K) := sorry

/-! ### Closed checks against the Theta Series contract

Each of the nine declarations consumed from `TauCetiRoadmap.ThetaSeries` is applied here at the
Euclidean model of the mixed space and the ideal lattice, with its statement written out, so that
a supplier retype breaks this file at the point of use and not only in a docstring. -/

section ThetaSeriesChecks

open scoped Classical

variable (K : Type u) [Field K] [NumberField K] (𝔞 : (FractionalIdeal (𝓞 K)⁰ K)ˣ)

-- `dual`: the dual of the ideal lattice in the Euclidean model.
example : Submodule ℤ (mixedEmbedding.euclidean.mixedSpace K) :=
  TS.dual (euclideanIdealLattice K 𝔞)

-- `dual_dual`: biduality at the ideal lattice.
example : TS.dual (TS.dual (euclideanIdealLattice K 𝔞)) = euclideanIdealLattice K 𝔞 :=
  TS.dual_dual (euclideanIdealLattice K 𝔞)

-- `covolume_dual`: the covolume of the dual ideal lattice.
example :
    ZLattice.covolume (TS.dual (euclideanIdealLattice K 𝔞)) MeasureTheory.volume =
      (ZLattice.covolume (euclideanIdealLattice K 𝔞) MeasureTheory.volume)⁻¹ :=
  TS.covolume_dual (euclideanIdealLattice K 𝔞)

-- `poissonSummation`: the generic identity at the ideal lattice, before transport.
example (f : 𝓢(mixedEmbedding.euclidean.mixedSpace K, ℂ))
    (v : mixedEmbedding.euclidean.mixedSpace K) :
    ∑' ℓ : euclideanIdealLattice K 𝔞, f (v + (ℓ : mixedEmbedding.euclidean.mixedSpace K)) =
      (ZLattice.covolume (euclideanIdealLattice K 𝔞) MeasureTheory.volume)⁻¹ *
        ∑' m : TS.dual (euclideanIdealLattice K 𝔞),
          𝓕 (fun x : mixedEmbedding.euclidean.mixedSpace K ↦ f x)
              (m : mixedEmbedding.euclidean.mixedSpace K) *
            Complex.exp (2 * Real.pi * Complex.I *
              ⟪v, (m : mixedEmbedding.euclidean.mixedSpace K)⟫) :=
  TS.poissonSummation (euclideanIdealLattice K 𝔞) f v

-- `summable_poisson_left` and `summable_poisson_right`: each side on its own.
example (f : 𝓢(mixedEmbedding.euclidean.mixedSpace K, ℂ))
    (v : mixedEmbedding.euclidean.mixedSpace K) :
    Summable fun ℓ : euclideanIdealLattice K 𝔞 ↦
      f (v + (ℓ : mixedEmbedding.euclidean.mixedSpace K)) :=
  TS.summable_poisson_left (euclideanIdealLattice K 𝔞) f v

example (f : 𝓢(mixedEmbedding.euclidean.mixedSpace K, ℂ))
    (v : mixedEmbedding.euclidean.mixedSpace K) :
    Summable fun m : TS.dual (euclideanIdealLattice K 𝔞) ↦
      𝓕 (fun x : mixedEmbedding.euclidean.mixedSpace K ↦ f x)
          (m : mixedEmbedding.euclidean.mixedSpace K) *
        Complex.exp (2 * Real.pi * Complex.I *
          ⟪v, (m : mixedEmbedding.euclidean.mixedSpace K)⟫) :=
  TS.summable_poisson_right (euclideanIdealLattice K 𝔞) f v

-- `gaussian` and `gaussian_apply`: a Schwartz function with the stated values.
example (τ : UpperHalfPlane) : 𝓢(mixedEmbedding.euclidean.mixedSpace K, ℂ) := TS.gaussian τ

example (τ : UpperHalfPlane) (x : mixedEmbedding.euclidean.mixedSpace K) :
    TS.gaussian τ x = Complex.exp (Real.pi * Complex.I * (‖x‖ ^ 2 : ℝ) * τ) :=
  TS.gaussian_apply τ x

-- `fourier_gaussian`: the Fourier transform of the Gaussian at the rank of the mixed space.
example (τ : UpperHalfPlane) (y : mixedEmbedding.euclidean.mixedSpace K) :
    𝓕 (fun x : mixedEmbedding.euclidean.mixedSpace K ↦
        (TS.gaussian τ : mixedEmbedding.euclidean.mixedSpace K → ℂ) x) y =
      ((τ : ℂ) / Complex.I) ^
          (-(Module.finrank ℝ (mixedEmbedding.euclidean.mixedSpace K) : ℂ) / 2) *
        Complex.exp (Real.pi * Complex.I * (‖y‖ ^ 2 : ℝ) * (-1 / (τ : ℂ))) :=
  TS.fourier_gaussian τ y

end ThetaSeriesChecks

/-! ### The archimedean parameter, the unit action, and the norm-one hypersurface

A Gaussian with **one** parameter, Mellin-transformed in that parameter, produces the Epstein zeta
function of the lattice `σ(𝔞)` — a sum over lattice *points* — and not the partial zeta function,
which is a sum over *ideals*, that is over lattice points modulo the unit group. The two agree
only when the unit group is finite (`radialMellin_eq_epsteinZeta` and
`not_summable_absNorm_of_rank_pos` in Layer 3). Hecke's construction, in the form of Neukirch VII
§5, closes the gap with a Gaussian carrying one positive parameter per infinite place: the unit
group acts on the parameters, a fundamental domain for that action on the norm-one hypersurface
cuts the sum over lattice points down to a sum over ideals, and the Mellin variable is the norm of
the parameter. Every object of that construction is named here, in Neukirch's order — nothing is
left to an existential. ⚠ Two normalizations are fixed once and audited in the worked cases of
Layer 3: the Gaussian uses the Euclidean pairing `mixedInner`, in which a complex coordinate
counts once, and the multiplicative measure is the product `∏_w dy_w / y_w` over places.
Neukirch's canonical measure carries `e_𝔭 = 2` at a complex place and is `2^r₂` times it, so his
`vol(F) = 2^(r-1) R` reads `2^(r-1) R / 2^r₂` here; the compensating `2^r₂` sits in
`mellinKernel`, and the constant term of the kernel is his `2^(r-1) R / w` in both. -/

section ArchimedeanParameter

open scoped Classical

/-- Neukirch's `R_+^*`, one real parameter per infinite place: Mathlib's `realSpace K`, whose
positive orthant carries the parameters of the Gaussian. -/
abbrev ArchParam (K : Type u) [Field K] [NumberField K] : Type u := mixedEmbedding.realSpace K

/-- Neukirch's `N(y) = ∏_τ y_τ`, the product over embeddings, so a complex place counts twice: it
is the determinant of the quadratic form `x ↦ ∑_w y_w |x_w|²` on the mixed space, a complex
coordinate being two real ones. -/
noncomputable def archNorm (K : Type u) [Field K] [NumberField K] (y : ArchParam K) : ℝ :=
  ∏ w : InfinitePlace K, y w ^ mult w

/-- The multi-parameter Gaussian `exp (-π ∑_w y_w |x_w|²)`: the Euclidean pairing `mixedInner`
weighted place by place, a complex coordinate counted once. At a constant parameter it is
`mixedGaussian` (`archGaussian_const`). -/
noncomputable def archGaussian (K : Type u) [Field K] [NumberField K] (y : ArchParam K)
    (x : mixedEmbedding.mixedSpace K) : ℂ :=
  Complex.exp ((-Real.pi *
    ∑ w : InfinitePlace K, y w * mixedEmbedding.normAtPlace w x ^ 2 : ℝ) : ℂ)

theorem archGaussian_const (K : Type u) [Field K] [NumberField K] (t : ℝ)
    (x : mixedEmbedding.mixedSpace K) :
    archGaussian K (fun _ ↦ t) x = mixedGaussian K t x := sorry

/-- The action of a unit on the parameters, `y_w ↦ |u|_w² y_w`: Neukirch's `|ε|² y`. It is the
substitution that carries the Gaussian at `u • x` back to the point `x`
(`archGaussian_unit_smul`), by `|u|²` and not `|u|` because the Gaussian is quadratic. -/
noncomputable def unitScale (K : Type u) [Field K] [NumberField K] (u : (𝓞 K)ˣ)
    (y : ArchParam K) : ArchParam K :=
  fun w ↦ mixedEmbedding.normAtPlace w (mixedEmbedding K ((u : 𝓞 K) : K)) ^ 2 * y w

theorem archGaussian_unit_smul (K : Type u) [Field K] [NumberField K] (u : (𝓞 K)ˣ)
    (y : ArchParam K) (x : mixedEmbedding.mixedSpace K) :
    archGaussian K y (u • x) = archGaussian K (unitScale K u y) x := sorry

/-- `|N(u)| = 1` (Mathlib's `mixedEmbedding.norm_unit`): the unit action preserves the norm of
the parameter, so it acts on the norm-one hypersurface. -/
theorem archNorm_unitScale (K : Type u) [Field K] [NumberField K] (u : (𝓞 K)ˣ)
    (y : ArchParam K) : archNorm K (unitScale K u y) = archNorm K y := sorry

/-- The kernel of `u ↦ unitScale u` is the torsion: a unit fixes a positive parameter exactly when
all its absolute values are `1`, that is when it is a root of unity. This is why the orbit count
in the unfolding is `w = #μ(K)`. -/
theorem unitScale_eq_self_iff (K : Type u) [Field K] [NumberField K] (u : (𝓞 K)ˣ)
    (y : ArchParam K) (hy : ∀ w, 0 < y w) :
    unitScale K u y = y ↔ u ∈ NumberField.Units.torsion K := sorry

/-- **The Fourier transform of the multi-parameter Gaussian**, `𝓕 G_y = N(y)^(-1/2) G_{y⁻¹}`: the
supplier's `fourier_gaussian` at `τ = i` after the coordinatewise change of variable
`x ↦ √y • x`, whose Jacobian is `N(y)^(1/2)` because a complex coordinate is two real ones. -/
theorem mixedFourier_archGaussian (K : Type u) [Field K] [NumberField K] (y : ArchParam K)
    (hy : ∀ w, 0 < y w) (ξ : mixedEmbedding.mixedSpace K) :
    mixedFourier K (archGaussian K y) ξ =
      (((Real.sqrt (archNorm K y))⁻¹ : ℝ) : ℂ) * archGaussian K (fun w ↦ (y w)⁻¹) ξ := sorry

open scoped Classical in
/-- The Euclidean dual of a lattice of the mixed space: the supplier's `dual`, taken in the
Euclidean model and pulled back, exactly as `dualIdealLattice` does for an ideal lattice, which
is this at `idealLattice K I` (`dualIdealLattice_eq_mixedDual`, by `rfl`). It is needed because
the transformation law of the Mellin kernel holds for every lattice, and its dual side is not an
ideal lattice until `mellinKernel_dualIdealLattice` says so. -/
noncomputable def mixedDual (K : Type u) [Field K] [NumberField K]
    (L : Submodule ℤ (mixedEmbedding.mixedSpace K)) :
    Submodule ℤ (mixedEmbedding.mixedSpace K) :=
  ZLattice.comap ℝ
    (TS.dual (ZLattice.comap ℝ L (mixedEmbedding.euclidean.toMixed K).toLinearMap))
    (mixedEmbedding.euclidean.toMixed K).symm.toLinearMap

open scoped Classical in
theorem dualIdealLattice_eq_mixedDual (K : Type u) [Field K] [NumberField K]
    (I : (FractionalIdeal (𝓞 K)⁰ K)ˣ) :
    dualIdealLattice K I = mixedDual K (mixedEmbedding.idealLattice K I) := rfl

open scoped Classical in
instance (K : Type u) [Field K] [NumberField K] (L : Submodule ℤ (mixedEmbedding.mixedSpace K))
    [DiscreteTopology L] [IsZLattice ℝ L] : DiscreteTopology (mixedDual K L) := by
  unfold mixedDual; infer_instance

open scoped Classical in
instance (K : Type u) [Field K] [NumberField K] (L : Submodule ℤ (mixedEmbedding.mixedSpace K))
    [DiscreteTopology L] [IsZLattice ℝ L] : IsZLattice ℝ (mixedDual K L) := by
  unfold mixedDual; infer_instance

/-- The theta series of a lattice of the mixed space at the parameter `y`. -/
noncomputable def latticeTheta (K : Type u) [Field K] [NumberField K]
    (L : Submodule ℤ (mixedEmbedding.mixedSpace K)) (y : ArchParam K) : ℂ :=
  ∑' ξ : L, archGaussian K y (ξ : mixedEmbedding.mixedSpace K)

/-- Absolute convergence of the theta series. `archGaussian K y` is a Schwartz function — the
supplier's `gaussian` composed with a linear automorphism — so this is the supplier's
`summable_poisson_left` transported by `mixedInner_toMixed`; it is what licenses every exchange
of the sum with an integral below. -/
theorem summable_archGaussian (K : Type u) [Field K] [NumberField K]
    (L : Submodule ℤ (mixedEmbedding.mixedSpace K)) [DiscreteTopology L] [IsZLattice ℝ L]
    (y : ArchParam K) (hy : ∀ w, 0 < y w) :
    Summable fun ξ : L ↦ archGaussian K y (ξ : mixedEmbedding.mixedSpace K) := sorry

theorem latticeTheta_const (K : Type u) [Field K] [NumberField K]
    (I : (FractionalIdeal (𝓞 K)⁰ K)ˣ) (t : ℝ) :
    latticeTheta K (mixedEmbedding.idealLattice K I) (fun _ ↦ t) =
      ∑' x : mixedEmbedding.idealLattice K I, mixedGaussian K t (x : mixedEmbedding.mixedSpace K) :=
  sorry

/-- **Unit invariance.** The ideal lattice is stable under `x ↦ u • x`, so its theta series is
invariant under the unit action on the parameters: reindex by `u`, then `archGaussian_unit_smul`.
⚠ This is the only place the unit group enters the theta series, and it is what a one-parameter
theta series cannot see: `unitScale u` moves a constant parameter off the diagonal. -/
theorem latticeTheta_unitScale (K : Type u) [Field K] [NumberField K]
    (I : (FractionalIdeal (𝓞 K)⁰ K)ˣ) (u : (𝓞 K)ˣ) (y : ArchParam K) :
    latticeTheta K (mixedEmbedding.idealLattice K I) (unitScale K u y) =
      latticeTheta K (mixedEmbedding.idealLattice K I) y := sorry

/-- **The multi-parameter theta transformation**, Neukirch VII (3.6) on the imaginary axis:
`poissonSummation_idealLattice` — the supplier's theorem transported — applied to
`archGaussian K y` with `mixedFourier_archGaussian`, for every lattice `L`:
`θ_L(y) = covol(L)⁻¹ N(y)^(-1/2) θ_{L^∨}(y⁻¹)`, the dual being the Euclidean dual `mixedDual`. -/
theorem latticeTheta_inv (K : Type u) [Field K] [NumberField K]
    (L : Submodule ℤ (mixedEmbedding.mixedSpace K)) [DiscreteTopology L] [IsZLattice ℝ L]
    (y : ArchParam K) (hy : ∀ w, 0 < y w) :
    latticeTheta K L y =
      ((ZLattice.covolume L : ℝ) : ℂ)⁻¹ * (((Real.sqrt (archNorm K y))⁻¹ : ℝ) : ℂ) *
        latticeTheta K (mixedDual K L) (fun w ↦ (y w)⁻¹) := sorry

/-- Neukirch's norm-one hypersurface `S = {y ∈ R_+^* | N(y) = 1}`, on which the unit group acts
through `unitScale` (`archNorm_unitScale`). -/
def normOneSurface (K : Type u) [Field K] [NumberField K] : Set (ArchParam K) :=
  {y | (∀ w, 0 < y w) ∧ archNorm K y = 1}

/-- The decomposition `R_+^* = S × ℝ_+^*` (Neukirch VII §5, p. 460): `y = x · t^(1/n)` with
`x ∈ S`, `t = N(y)` and `n = [K:ℚ]`. -/
noncomputable def surfaceScale (K : Type u) [Field K] [NumberField K] (x : ArchParam K)
    (t : ℝ) : ArchParam K :=
  fun w ↦ x w * t ^ ((1 : ℝ) / Module.finrank ℚ K)

theorem archNorm_surfaceScale (K : Type u) [Field K] [NumberField K] (x : ArchParam K)
    (hx : x ∈ normOneSurface K) (t : ℝ) (ht : 0 < t) :
    archNorm K (surfaceScale K x t) = t := sorry

/-- The surface part `y / N(y)^(1/n)` of a positive parameter, the inverse of `surfaceScale`. -/
noncomputable def surfacePart (K : Type u) [Field K] [NumberField K] (y : ArchParam K) :
    ArchParam K :=
  fun w ↦ y w / archNorm K y ^ ((1 : ℝ) / Module.finrank ℚ K)

theorem surfacePart_mem (K : Type u) [Field K] [NumberField K] (y : ArchParam K)
    (hy : ∀ w, 0 < y w) : surfacePart K y ∈ normOneSurface K := sorry

theorem surfaceScale_surfacePart (K : Type u) [Field K] [NumberField K] (y : ArchParam K)
    (hy : ∀ w, 0 < y w) : surfaceScale K (surfacePart K y) (archNorm K y) = y := sorry

/-- The multiplicative Haar measure `dy/y = ∏_w dy_w / y_w` on the positive parameters. ⚠ This is
the product over *places*; Neukirch's canonical `dy/y` (VII §4, p. 454, and the proof of (5.6))
carries the factor `e_𝔭 = 2` at each complex place and is `2^r₂` times this one. -/
noncomputable def archHaar (K : Type u) [Field K] [NumberField K] :
    MeasureTheory.Measure (ArchParam K) :=
  (MeasureTheory.volume.restrict {y : ArchParam K | ∀ w, 0 < y w}).withDensity
    fun y ↦ ENNReal.ofReal (∏ w : InfinitePlace K, (y w)⁻¹)

/-- The Haar measure `dt/t` of `ℝ_+^*`. -/
noncomputable def multHaar : MeasureTheory.Measure ℝ :=
  (MeasureTheory.volume.restrict (Set.Ioi (0 : ℝ))).withDensity fun t ↦ ENNReal.ofReal t⁻¹

/-- Neukirch's `d*x`: the Haar measure of the group `S` for which `dy/y` is the product measure
`d*x × dt/t` along `(x, t) ↦ x t^(1/n)`. It is pinned by `archHaar_eq_map`; "we will not need
any more explicit description of `d*x`" (Neukirch VII §5, p. 460), and none is given. -/
noncomputable def surfaceHaar (K : Type u) [Field K] [NumberField K] :
    MeasureTheory.Measure (normOneSurface K) := sorry

theorem archHaar_eq_map (K : Type u) [Field K] [NumberField K] :
    archHaar K = MeasureTheory.Measure.map
      (fun p : normOneSurface K × ℝ ↦ surfaceScale K (p.1 : ArchParam K) p.2)
      ((surfaceHaar K).prod multHaar) := sorry

/-- A fundamental domain for the unit action on the norm-one hypersurface: a measurable subset
of `S` meeting every orbit of `u ↦ unitScale u` in exactly one point, the stabilizer of every
point being the torsion (`unitScale_eq_self_iff`). -/
structure IsUnitFundamentalDomain (K : Type u) [Field K] [NumberField K]
    (D : Set (ArchParam K)) : Prop where
  subset : D ⊆ normOneSurface K
  measurableSet : MeasurableSet D
  exists_mem : ∀ y ∈ normOneSurface K, ∃ u : (𝓞 K)ˣ, unitScale K u y ∈ D
  mem_iff : ∀ y ∈ D, ∀ u : (𝓞 K)ˣ, unitScale K u y ∈ D ↔ u ∈ NumberField.Units.torsion K

/-- **Neukirch's `F`, taken from Mathlib.** The parameters `y ∈ S` whose square root, read as a
point of the mixed space, lies in `NumberField.mixedEmbedding.fundamentalCone K`. That cone is a
fundamental domain for `(𝓞 K)ˣ` modulo torsion acting on the mixed space
(`fundamentalCone.exists_unit_smul_mem`, `unit_smul_mem_iff_mem_torsion`) and depends only on
the absolute values of the coordinates (`mem_of_normAtPlace_eq`); since `unitScale u` is
`x ↦ u • x` read on `|x|²`, it is a fundamental domain for `|𝔬ˣ|²` acting on `S`, which is
Neukirch's choice — the preimage under `log` of a fundamental mesh of the lattice `2 log |𝔬ˣ|`.
⚠ It is the same cone through which Mathlib enumerates the integral ideals of a class
(`fundamentalCone.idealSetEquiv`), so the unfolding in Layer 3 consumes one fundamental domain,
not two. -/
noncomputable def unitFundamentalDomain (K : Type u) [Field K] [NumberField K] :
    Set (ArchParam K) :=
  {y ∈ normOneSurface K |
    mixedEmbedding.mixedSpaceOfRealSpace (fun w ↦ Real.sqrt (y w)) ∈
      mixedEmbedding.fundamentalCone K}

theorem isUnitFundamentalDomain_unitFundamentalDomain (K : Type u) [Field K] [NumberField K] :
    IsUnitFundamentalDomain K (unitFundamentalDomain K) := sorry

/-- Inversion `x ↦ x⁻¹` of the group `S` preserves `d*x` and carries fundamental domains to
fundamental domains (Neukirch, proof of (5.8)); so does translation by a point of `S`. Both are
used by the transformation law of the Mellin kernel. -/
theorem IsUnitFundamentalDomain.inv (K : Type u) [Field K] [NumberField K]
    {D : Set (ArchParam K)} (hD : IsUnitFundamentalDomain K D) :
    IsUnitFundamentalDomain K ((fun y : ArchParam K ↦ fun w ↦ (y w)⁻¹) '' D) := sorry

theorem IsUnitFundamentalDomain.mul (K : Type u) [Field K] [NumberField K]
    {D : Set (ArchParam K)} (hD : IsUnitFundamentalDomain K D) (c : ArchParam K)
    (hc : c ∈ normOneSurface K) :
    IsUnitFundamentalDomain K ((fun y : ArchParam K ↦ c * y) '' D) := sorry

/-- **Neukirch VII (5.6), the volume of the fundamental domain**: `vol(F) = 2^(r-1) R` for his
measure, with `r = r₁ + r₂` the number of infinite places and `R` Mathlib's
`NumberField.Units.regulator`; for the product measure `archHaar` this is `2^(r-1) R / 2^r₂`.
Every fundamental domain has the same volume. ⚠ The `2^(r-1)` is the index of `2 log|𝔬ˣ|` in
`log|𝔬ˣ|` up to the `1/n` of the scaling direction, cancelled by the `n` of the last row of
Neukirch's determinant: it is where the action by `|ε|²` rather than `|ε|` enters. Over `ℚ` and
`ℚ(i)` the surface is a point of mass `1` and `1/2` respectively. -/
theorem surfaceHaar_of_isUnitFundamentalDomain (K : Type u) [Field K] [NumberField K]
    {D : Set (ArchParam K)} (hD : IsUnitFundamentalDomain K D) :
    surfaceHaar K (Subtype.val ⁻¹' D) =
      ENNReal.ofReal (2 ^ (nrRealPlaces K + nrComplexPlaces K - 1) *
        NumberField.Units.regulator K / 2 ^ nrComplexPlaces K) := sorry

end ArchimedeanParameter

/-! ## Layers 2--3: partial and Dedekind zeta functions -/

variable (K : Type u) [Field K] [NumberField K]

/-- The indicator of one ray class on nonzero ideals. This is deliberately a general ideal
arithmetic function: a class indicator is not completely multiplicative. ⚠ The coprimality
condition is part of the coefficient, so this series and every sum of such series omits the
primes dividing the finite part of the modulus. -/
noncomputable def rayClassCoeff
    (𝔪 : GNF.Modulus K) (c : GNF.RayClassGroup 𝔪) :
    ADS.IdealArithmeticFunction K := by
  classical
  exact fun I =>
    if hI : 𝔪.IsCoprimeTo (I : Ideal (𝓞 K)) then
      if GNF.idealClass 𝔪 ⟨(I : Ideal (𝓞 K)), hI⟩ = c then 1 else 0
    else 0

/-- The finite Euler correction `∏_{𝔭 ∣ 𝔪₀} (1 - N𝔭 ^ (-s))`: exactly the Euler factors that the
coprimality condition deletes from `ζ_K`. The product is over `𝔪.support`, read as the primes
dividing `𝔪₀` through the supplier's `Modulus.mem_support_iff`; there is no second divisor set.
⚠ It is `1` only when the finite part of the modulus is trivial. Assuming it away makes the sum
of the partial zeta functions, the common residue, and the trivial-character comparison all
false. -/
noncomputable def finiteEulerCorrection (𝔪 : GNF.Modulus K) (s : ℂ) : ℂ :=
  ∏ 𝔭 ∈ 𝔪.support, (1 - (Ideal.absNorm 𝔭.asIdeal : ℂ) ^ (-s))

/-- **Supplier drift check.** A prime contributes a deleted Euler factor exactly when it divides
the finite part of the modulus: this is the supplier's characterization
`Modulus.mem_support_iff`, consumed here as a closed proof so a change in the support convention
breaks this roadmap. -/
theorem mem_support_iff_euler_factor_present
    (𝔪 : GNF.Modulus K) (v : HeightOneSpectrum (𝓞 K)) :
    v.asIdeal ∣ 𝔪.finitePart ↔ v ∈ 𝔪.support :=
  (GNF.Modulus.mem_support_iff 𝔪 v).symm

/-- The trivial modulus deletes no Euler factor. Closed by the supplier's
`Modulus.support_one`. -/
theorem finiteEulerCorrection_one (s : ℂ) :
    finiteEulerCorrection K (GNF.Modulus.one K) s = 1 := by
  simp [finiteEulerCorrection, GNF.Modulus.support_one]

/-- ⚠ Regression: the correction is not a harmless constant. As soon as one prime divides the
finite part of the modulus — equivalently, by the supplier's `Modulus.mem_support_iff`, as soon
as `𝔪.support` is nonempty — the deleted factors are visible on the half-plane of
convergence. -/
theorem finiteEulerCorrection_ne_one {𝔪 : GNF.Modulus K} (h𝔪 : 𝔪.support.Nonempty) :
    ∃ s : ℂ, 1 < s.re ∧ finiteEulerCorrection K 𝔪 s ≠ 1 := sorry

noncomputable def partialZeta
    (𝔪 : GNF.Modulus K) (c : GNF.RayClassGroup 𝔪) (s : ℂ) : ℂ := sorry

theorem partialZeta_eq_lSeries
    (𝔪 : GNF.Modulus K) (c : GNF.RayClassGroup 𝔪) {s : ℂ} (hs : 1 < s.re) :
    partialZeta K 𝔪 c s =
      LSeries (ADS.normCoeff K (rayClassCoeff K 𝔪 c)) s := sorry

/-- The shared regrouping theorem applies to the general ray-class indicator carrier. -/
theorem rayClassCoeff_regroupByNorm
    (𝔪 : GNF.Modulus K) (c : GNF.RayClassGroup 𝔪) (s : ℂ)
    (h : Summable fun I : ADS.NonzeroIdeal K ↦
      rayClassCoeff K 𝔪 c I / (Ideal.absNorm (I : Ideal (𝓞 K)) : ℂ) ^ s) :
    LSeriesHasSum (ADS.normCoeff K (rayClassCoeff K 𝔪 c)) s
      (∑' I : ADS.NonzeroIdeal K,
        rayClassCoeff K 𝔪 c I / (Ideal.absNorm (I : Ideal (𝓞 K)) : ℂ) ^ s) :=
  ADS.regroupByNorm K (rayClassCoeff K 𝔪 c) s h

/-- **The sum over ray classes is not `ζ_K`.** Summing the class indicators gives the indicator of
the ideals prime to the finite part of the modulus, so the sum is `ζ_K` with the Euler factors at
those primes deleted. Equality with `ζ_K` holds exactly in the trivial-finite-part case, recorded
separately as `sum_partialZeta_one`. -/
theorem sum_partialZeta (𝔪 : GNF.Modulus K) [Fintype (GNF.RayClassGroup 𝔪)]
    {s : ℂ} (hs : 1 < s.re) :
    ∑ c : GNF.RayClassGroup 𝔪, partialZeta K 𝔪 c s =
      dedekindZeta K s * finiteEulerCorrection K 𝔪 s := sorry

/-- The class-group specialization: for the trivial modulus the correction is empty and the
partial zeta functions of the ideal classes do sum to `ζ_K`. -/
theorem sum_partialZeta_one [Fintype (GNF.RayClassGroup (GNF.Modulus.one K))]
    {s : ℂ} (hs : 1 < s.re) :
    ∑ c : GNF.RayClassGroup (GNF.Modulus.one K), partialZeta K (GNF.Modulus.one K) c s =
      dedekindZeta K s := sorry

/-- **The common residue.** Every ray class contributes the same simple pole at `s = 1`, with
residue the Dedekind-zeta residue times the deleted finite Euler factors, divided by the ray class
number. ⚠ `κ_K / #Cl_𝔪` is wrong for a modulus with nontrivial finite part; the correction is the
same one that `sum_partialZeta` carries. This constant is the supplier's
`GlobalNumberFields.rayClassIdealMainTerm`, whose closed form is
`GlobalNumberFields.rayClassIdealMainTerm_eq`; it is not a second constant. -/
theorem tendsto_sub_one_mul_partialZeta (𝔪 : GNF.Modulus K) (c : GNF.RayClassGroup 𝔪) :
    Tendsto (fun s : ℂ ↦ (s - 1) * partialZeta K 𝔪 c s) (𝓝[≠] 1)
      (𝓝 ((dedekindZeta_residue K : ℂ) * finiteEulerCorrection K 𝔪 1 /
        (Nat.card (GNF.RayClassGroup 𝔪) : ℂ))) := sorry

/-- The analytic residue and the supplier's arithmetic main term are one constant, so a change of
modulus cannot silently produce two. -/
theorem tendsto_sub_one_mul_partialZeta_mainTerm
    (𝔪 : GNF.Modulus K) (c : GNF.RayClassGroup 𝔪) :
    Tendsto (fun s : ℂ ↦ (s - 1) * partialZeta K 𝔪 c s) (𝓝[≠] 1)
      (𝓝 ((GNF.rayClassIdealMainTerm 𝔪 : ℂ))) := sorry

noncomputable def dedekindZetaC
    (K : Type u) [Field K] [NumberField K] : ℂ → ℂ := sorry

theorem dedekindZetaC_eq {s : ℂ} (hs : 1 < s.re) :
    dedekindZetaC K s = dedekindZeta K s := sorry

theorem meromorphic_dedekindZetaC : Meromorphic (dedekindZetaC K) := sorry

theorem analyticAt_dedekindZetaC {s : ℂ} (hs : s ≠ 1) :
    AnalyticAt ℂ (dedekindZetaC K) s := sorry

theorem analyticOnNhd_dedekindZetaC :
    AnalyticOnNhd ℂ (dedekindZetaC K) {(1 : ℂ)}ᶜ := sorry

theorem meromorphicOrderAt_dedekindZetaC_one :
    meromorphicOrderAt (dedekindZetaC K) 1 = (-1 : WithTop ℤ) := sorry

theorem meromorphicOrderAt_dedekindZetaC_nonneg {s : ℂ} (hs : s ≠ 1) :
    0 ≤ meromorphicOrderAt (dedekindZetaC K) s := sorry

theorem tendsto_sub_one_mul_dedekindZetaC :
    Tendsto (fun s : ℂ ↦ (s - 1) * dedekindZetaC K s) (𝓝[≠] 1)
      (𝓝 (dedekindZeta_residue K : ℂ)) := sorry

/-- **Uniqueness of meromorphic continuation, in germ form.** Two meromorphic functions agreeing
on a right half-plane have the same germ at every point of the plane. This is the only bridge used
to promote a half-plane identity to a global one: an unrestricted identity between total
representatives is never available, because Mathlib's value at a pole is junk. The same discipline
as `AnalyticLFunctionData.HasFunctionalEquation`, whose value equality is asserted off the poles
and whose germ equality covers them. -/
theorem eventuallyEq_of_meromorphic_of_eqOn_halfPlane {Z W : ℂ → ℂ}
    (hZ : Meromorphic Z) (hW : Meromorphic W) (h : ∀ s : ℂ, 1 < s.re → Z s = W s) (s : ℂ) :
    Z =ᶠ[𝓝[≠] s] W := sorry

/-- Values are read off a germ equality only where both sides are analytic. -/
theorem eq_of_eventuallyEq_of_analyticAt {Z W : ℂ → ℂ} {s : ℂ}
    (h : Z =ᶠ[𝓝[≠] s] W) (hZ : AnalyticAt ℂ Z s) (hW : AnalyticAt ℂ W s) : Z s = W s := sorry

theorem eq_of_meromorphic_of_eqOn_halfPlane (Z W : ℂ → ℂ) (hZ : Meromorphic Z)
    (hW : Meromorphic W)
    (hZa : AnalyticOnNhd ℂ Z {0, 1}ᶜ) (hWa : AnalyticOnNhd ℂ W {0, 1}ᶜ)
    (h : ∀ s : ℂ, 1 < s.re → Z s = W s) :
    ∀ s : ℂ, s ≠ 0 → s ≠ 1 → Z s = W s := sorry

noncomputable def completedDedekindZeta
    (K : Type u) [Field K] [NumberField K] : ℂ → ℂ := sorry

theorem completedDedekindZeta_eq {s : ℂ} (hs : 1 < s.re) :
    completedDedekindZeta K s =
      ((|discr K| : ℤ) : ℂ) ^ (s / 2) * Gammaℝ s ^ nrRealPlaces K *
        Gammaℂ s ^ nrComplexPlaces K * dedekindZeta K s := sorry

theorem meromorphic_completedDedekindZeta : Meromorphic (completedDedekindZeta K) := sorry

theorem meromorphicOrderAt_completedDedekindZeta_zero :
    meromorphicOrderAt (completedDedekindZeta K) 0 = (-1 : WithTop ℤ) := sorry

theorem meromorphicOrderAt_completedDedekindZeta_one :
    meromorphicOrderAt (completedDedekindZeta K) 1 = (-1 : WithTop ℤ) := sorry

theorem analyticAt_completedDedekindZeta {s : ℂ} (h0 : s ≠ 0) (h1 : s ≠ 1) :
    AnalyticAt ℂ (completedDedekindZeta K) s := sorry

theorem analyticOnNhd_completedDedekindZeta :
    AnalyticOnNhd ℂ (completedDedekindZeta K) {0, 1}ᶜ := sorry

theorem meromorphicOrderAt_completedDedekindZeta_nonneg
    {s : ℂ} (h0 : s ≠ 0) (h1 : s ≠ 1) :
    0 ≤ meromorphicOrderAt (completedDedekindZeta K) s := sorry

theorem tendsto_sub_one_mul_completedDedekindZeta :
    Tendsto (fun s : ℂ ↦ (s - 1) * completedDedekindZeta K s) (𝓝[≠] 1)
      (𝓝 (((|discr K| : ℤ) : ℂ) ^ ((1 : ℂ) / 2) *
        Gammaℝ 1 ^ nrRealPlaces K * Gammaℂ 1 ^ nrComplexPlaces K *
        (dedekindZeta_residue K : ℂ))) := sorry

theorem tendsto_mul_completedDedekindZeta_zero :
    Tendsto (fun s : ℂ ↦ s * completedDedekindZeta K s) (𝓝[≠] 0)
      (𝓝 (-(((|discr K| : ℤ) : ℂ) ^ ((1 : ℂ) / 2) *
        Gammaℝ 1 ^ nrRealPlaces K * Gammaℂ 1 ^ nrComplexPlaces K *
        (dedekindZeta_residue K : ℂ)))) := sorry

theorem completedDedekindZeta_one_sub {s : ℂ} (h0 : s ≠ 0) (h1 : s ≠ 1) :
    completedDedekindZeta K (1 - s) = completedDedekindZeta K s := sorry

noncomputable def dedekindZetaData
    (K : Type u) [Field K] [NumberField K] : AnalyticLFunctionData := sorry

theorem degree_dedekindZetaData :
    (dedekindZetaData K).degree = Module.finrank ℚ K := sorry

theorem dedekindZetaData_hasContinuation :
    (dedekindZetaData K).HasMeromorphicContinuation := sorry

theorem dedekindZetaData_hasFunctionalEquation :
    (dedekindZetaData K).HasFunctionalEquation := sorry


/-! ### The unit quotient and the Mellin kernel

Neukirch VII (5.3)–(5.9) in this roadmap's normalization: the completed partial zeta function of a
fractional ideal is the Mellin transform of the theta series of its lattice averaged over a
fundamental domain for the units. The Epstein regression comes first, because it is the reason
the construction is needed at all. -/

section UnitQuotient

open scoped Classical

/-- The Epstein zeta function of the Euclidean form `mixedInner` on the lattice `σ(𝔞)`: a sum
over lattice **points**. -/
noncomputable def epsteinZeta (I : (FractionalIdeal (𝓞 K)⁰ K)ˣ) (s : ℂ) : ℂ :=
  ∑' x : {x : mixedEmbedding.idealLattice K I // x ≠ 0},
    ((mixedInner K (x : mixedEmbedding.mixedSpace K) (x : mixedEmbedding.mixedSpace K) : ℝ) : ℂ) ^
      (-s)

/-- ⚠ **The radial Mellin transform of the one-parameter theta series is the Epstein zeta
function, not a partial zeta function.** Term by term, `∫ e^{-π t Q(x)} t^s dt/t = π^{-s} Γ(s)
Q(x)^{-s}`, so the transform in the single parameter `t` sums `Q(x)^{-s}` over the nonzero lattice
points. That is a sum over points; it is the ideal sum only when the unit group is finite. -/
theorem radialMellin_eq_epsteinZeta (I : (FractionalIdeal (𝓞 K)⁰ K)ˣ) {s : ℂ}
    (hs : (Module.finrank ℚ K : ℝ) / 2 < s.re) :
    ∫ t in Set.Ioi (0 : ℝ),
        (∑' x : mixedEmbedding.idealLattice K I,
            mixedGaussian K t (x : mixedEmbedding.mixedSpace K) - 1) * (t : ℂ) ^ s / (t : ℂ) =
      (Real.pi : ℂ) ^ (-s) * Complex.Gamma s * epsteinZeta K I s := sorry

/-- ⚠ **Regression: in positive unit rank the lattice-point sum is not the ideal sum.** Every
nonzero ideal in the class is hit by infinitely many lattice points — one per unit modulo torsion
— so the series `∑_{a ∈ 𝔞, a ≠ 0} N((a))^(-s)` that a radial Mellin transform would have to
produce is not summable for any `s`, whereas `∑_{𝔟 ∈ 𝔎} N𝔟^(-s)` converges for `Re s > 1`. The
one-parameter theta series therefore does not supply the Dedekind zeta function of any field of
positive unit rank; `mellinKernel` below does. -/
theorem not_summable_absNorm_of_rank_pos (h : 0 < NumberField.Units.rank K)
    (𝔞 : Ideal (𝓞 K)) (h𝔞 : 𝔞 ≠ ⊥) (s : ℂ) :
    ¬ Summable fun a : {a : 𝔞 // a ≠ 0} ↦
      (Ideal.absNorm (Ideal.span {((a : 𝔞) : 𝓞 K)}) : ℂ) ^ (-s) := sorry

/-- A nonzero integral ideal as a unit of the fractional ideals. -/
noncomputable def idealUnit (𝔞 : Ideal (𝓞 K)) (h : 𝔞 ≠ ⊥) : (FractionalIdeal (𝓞 K)⁰ K)ˣ :=
  Units.mk0 (𝔞 : FractionalIdeal (𝓞 K)⁰ K) (FractionalIdeal.coeIdeal_ne_zero.mpr h)

/-- A system of integral representatives of the class group prime to a modulus: `rep c` is a
nonzero integral ideal prime to `𝔪` whose class is `c`. -/
def IsClassRepresentatives (𝔪 : GNF.Modulus K) (rep : ClassGroup (𝓞 K) → Ideal (𝓞 K)) : Prop :=
  ∀ c, 𝔪.IsCoprimeTo (rep c) ∧ ∃ h : rep c ∈ (Ideal (𝓞 K))⁰, ClassGroup.mk0 ⟨rep c, h⟩ = c

/-- **The completed partial zeta function of a fractional ideal**, Neukirch VII (5.4) and (5.9):
`Z(𝔎, s) = |d_K|^(s/2) Γ_ℝ(s)^r₁ Γ_ℂ(s)^r₂ ζ(𝔎, s)` for `𝔎` the class of `𝔞⁻¹`. By (5.3) the
integral ideals `𝔟` of that class are the `a 𝔞⁻¹` for `a ∈ 𝔞 ∖ 0` modulo units, so
`ζ(𝔎, s) = N(𝔞)^s ∑_{a ∈ 𝔞*/𝔬*} |N(a)|^(-s)`; Mathlib already has that bijection through its
fundamental cone (`fundamentalCone.idealSetEquiv`, `card_isPrincipal_norm_eq_mul_torsion`), which
is why that cone is also the fundamental domain of `unitFundamentalDomain`. Pinned on `Re s > 1`
by the two sums below and everywhere by `meromorphic_completedPartialZeta`. -/
noncomputable def completedPartialZeta (I : (FractionalIdeal (𝓞 K)⁰ K)ˣ) (s : ℂ) : ℂ := sorry

theorem completedPartialZeta_eq_tsum (I : (FractionalIdeal (𝓞 K)⁰ K)ˣ) {s : ℂ}
    (hs : 1 < s.re) :
    completedPartialZeta K I s =
      ((|discr K| : ℤ) : ℂ) ^ (s / 2) * Gammaℝ s ^ nrRealPlaces K *
        Gammaℂ s ^ nrComplexPlaces K *
        ∑' 𝔟 : {𝔟 : Ideal (𝓞 K) // 𝔟 ≠ ⊥ ∧ ∃ x : Kˣ,
            (𝔟 : FractionalIdeal (𝓞 K)⁰ K) * (I : FractionalIdeal (𝓞 K)⁰ K) =
              FractionalIdeal.spanSingleton (𝓞 K)⁰ (x : K)},
          (Ideal.absNorm (𝔟 : Ideal (𝓞 K)) : ℂ) ^ (-s) := sorry

/-- (5.3)–(5.4) in Mathlib's vocabulary: the same sum over the nonzero points of `σ(𝔞)` in the
fundamental cone, each ideal being hit `w = #μ(K)` times, `|N(a)| = N(𝔞) N(a𝔞⁻¹)`. -/
theorem completedPartialZeta_eq_tsum_fundamentalCone (I : (FractionalIdeal (𝓞 K)⁰ K)ˣ) {s : ℂ}
    (hs : 1 < s.re) :
    completedPartialZeta K I s =
      ((|discr K| : ℤ) : ℂ) ^ (s / 2) * Gammaℝ s ^ nrRealPlaces K *
        Gammaℂ s ^ nrComplexPlaces K *
        ((FractionalIdeal.absNorm (I : FractionalIdeal (𝓞 K)⁰ K) : ℚ) : ℂ) ^ s /
        (NumberField.Units.torsionOrder K : ℂ) *
        ∑' x : {x : mixedEmbedding.idealLattice K I // x ≠ 0 ∧
            (x : mixedEmbedding.mixedSpace K) ∈ mixedEmbedding.fundamentalCone K},
          ((mixedEmbedding.norm (x : mixedEmbedding.mixedSpace K) : ℝ) : ℂ) ^ (-s) := sorry

/-- The link to Layer 2: `Z(𝔎, s)` is the completion of the partial zeta function of the ray
class `c` of the trivial modulus consisting of the ideals `𝔟` with `𝔟 𝔞` principal. -/
theorem completedPartialZeta_eq_partialZeta (I : (FractionalIdeal (𝓞 K)⁰ K)ˣ)
    (c : GNF.RayClassGroup (GNF.Modulus.one K))
    (hc : ∀ 𝔟 : GNF.integralIdealsPrimeTo (GNF.Modulus.one K),
      GNF.idealClass (GNF.Modulus.one K) 𝔟 = c ↔ ∃ x : Kˣ,
        ((𝔟 : Ideal (𝓞 K)) : FractionalIdeal (𝓞 K)⁰ K) * (I : FractionalIdeal (𝓞 K)⁰ K) =
          FractionalIdeal.spanSingleton (𝓞 K)⁰ (x : K))
    {s : ℂ} (hs : 1 < s.re) :
    completedPartialZeta K I s =
      ((|discr K| : ℤ) : ℂ) ^ (s / 2) * Gammaℝ s ^ nrRealPlaces K *
        Gammaℂ s ^ nrComplexPlaces K * partialZeta K (GNF.Modulus.one K) c s := sorry

/-- The completed Dedekind zeta function is the sum over a system of class representatives. -/
theorem completedDedekindZeta_eq_sum_completedPartialZeta
    (rep : ClassGroup (𝓞 K) → Ideal (𝓞 K))
    (hrep : IsClassRepresentatives K (GNF.Modulus.one K) rep) {s : ℂ} (hs : 1 < s.re) :
    completedDedekindZeta K s =
      ∑ c : ClassGroup (𝓞 K), completedPartialZeta K (idealUnit K (rep c) (hrep c).1.1) s := sorry

/-- The cone over a fundamental domain, `D × ℝ_+^*` in the coordinates of `surfaceScale`: the
positive parameters whose surface part lies in `D`. On it the sum over the lattice points of
`σ(𝔞)` unfolds to a sum over the ideals of the class of `𝔞⁻¹`. -/
def unitCone (D : Set (ArchParam K)) : Set (ArchParam K) :=
  {y | (∀ w, 0 < y w) ∧ surfacePart K y ∈ D}

/-- **The sum–integral interchange is licensed by absolute convergence.** Over the cone, the
gamma integrals of the lattice points sum to a convergent series: each unit orbit modulo torsion
contributes one full gamma integral `π^{-ns/2} Γ(s/2)^r₁ Γ(s)^r₂ |N(a)|^(-s)` (up to the `2`-powers
of the normalization), and `∑_𝔟 N𝔟^(-Re s)` converges for `Re s > 1`. ⚠ Over all of `R_+^*` the
same sum diverges as soon as the unit group is infinite: that divergence is the Epstein
regression seen from the integral side. -/
theorem summable_integral_unitCone {D : Set (ArchParam K)} (hD : IsUnitFundamentalDomain K D)
    (I : (FractionalIdeal (𝓞 K)⁰ K)ˣ) {σ : ℝ} (hσ : 1 < σ) :
    Summable fun x : {x : mixedEmbedding.idealLattice K I // x ≠ 0} ↦
      ∫ y in unitCone K D,
        ‖archGaussian K y (x : mixedEmbedding.mixedSpace K)‖ * archNorm K y ^ (σ / 2)
          ∂(archHaar K) := sorry

/-- **Unfolding**, Neukirch (5.5) before the Mellin substitution. On the cone over a fundamental
domain the theta series minus its constant term integrates, against `N(y)^(s/2)` and the
multiplicative measure, to the completed partial zeta function: the sum over the lattice points
of `σ(𝔞)`, cut down by the cone to one point per unit orbit, is the sum over the integral ideals
of the class of `𝔞⁻¹` with multiplicity `w`, and each term contributes its gamma integral. The
constants: `2^r₂` from the Euclidean normalization of the complex coordinates (the gamma integral
of `e^{-π y |z|²}` against `y^{2s} dy/y` is `π^{-2s} Γ(2s) |z|^{-4s} = 2^{2s-1} Γ_ℂ(2s) |z|^{-4s}`),
`1/w` from the torsion, and the covolume `V_𝔞 = N(𝔞) 2^(-r₂) √|d_K|`, whose square rescales the
parameter so that the discriminant power `|d_K|^(s/2)` and the factor `N(𝔞)^s` of (5.4) both come
out. -/
theorem completedPartialZeta_eq_integral_unitCone {D : Set (ArchParam K)}
    (hD : IsUnitFundamentalDomain K D) (I : (FractionalIdeal (𝓞 K)⁰ K)ˣ) {s : ℂ} (hs : 1 < s.re) :
    completedPartialZeta K I s =
      ((2 : ℂ) ^ nrComplexPlaces K / (NumberField.Units.torsionOrder K : ℂ)) *
        ∫ y in unitCone K D,
          (latticeTheta K (mixedEmbedding.idealLattice K I)
              (fun w ↦ y w / ZLattice.covolume (mixedEmbedding.idealLattice K I) ^
                ((2 : ℝ) / Module.finrank ℚ K)) - 1) *
            ((archNorm K y : ℝ) : ℂ) ^ (s / 2) ∂(archHaar K) := sorry

/-- The constant term of the Mellin kernel, Neukirch (5.8): `a₀ = 2^r₂ vol(D) / w = 2^(r-1) R / w`
with `r = r₁ + r₂`, `R` the regulator and `w = #μ(K)`; the same for every fundamental domain, and
`1/2` over `ℚ`, `1/4` over `ℚ(i)`. -/
noncomputable def mellinConstant : ℝ :=
  2 ^ (nrRealPlaces K + nrComplexPlaces K - 1) * NumberField.Units.regulator K /
    NumberField.Units.torsionOrder K

/-- **Neukirch VII (5.5), the Mellin kernel** of a lattice `L` for a fundamental domain `D`:
`f_D(L, u) = (2^r₂ / w) ∫_D θ_L(x · (u / V_L²)^(1/n)) d*x`, the theta series averaged over the
fundamental domain at norm `u / V_L²`, with `V_L` the covolume. For `L = σ(𝔞)`: `2^r₂` is the
Euclidean normalization of the complex coordinates, `1/w` counts the torsion — the kernel of
`u ↦ |u|²` — and `V_𝔞² = N(𝔞)² |d_K| / 4^r₂` is the rescaling of the parameter that turns the
gamma integral's `N(𝔞)^(-s) 2^(r₂(s-1))` into the `|d_K|^(s/2)` of the completed function. It does
not depend on `D` when the theta series is unit-invariant (`latticeTheta_unitScale`). -/
noncomputable def mellinKernel (D : Set (ArchParam K))
    (L : Submodule ℤ (mixedEmbedding.mixedSpace K)) (u : ℝ) : ℂ :=
  ((2 : ℂ) ^ nrComplexPlaces K / (NumberField.Units.torsionOrder K : ℂ)) *
    ∫ x in (Subtype.val ⁻¹' D : Set (normOneSurface K)),
      latticeTheta K L (surfaceScale K (x : ArchParam K) (u / ZLattice.covolume L ^ 2))
        ∂(surfaceHaar K)

/-- **The Mellin transform**, Neukirch (5.5) `Z(𝔎, 2s) = L(f, s)`: for `Re s > 1`,
`Z(𝔎, s) = ∫_0^∞ (f_D(𝔞, u) - a₀) u^(s/2) du/u`. ⚠ The completed function at `s` is the Mellin
transform at `s/2`; the Mellin convention `L(f, s) = ∫ (f(t) - f(∞)) t^s dt/t` is Neukirch's (1.4)
and the convention of `FEPairWithLevel.completed_eq_mellin`. -/
theorem completedPartialZeta_eq_mellin {D : Set (ArchParam K)}
    (hD : IsUnitFundamentalDomain K D) (I : (FractionalIdeal (𝓞 K)⁰ K)ˣ) {s : ℂ} (hs : 1 < s.re) :
    completedPartialZeta K I s =
      ∫ u in Set.Ioi (0 : ℝ),
        (mellinKernel K D (mixedEmbedding.idealLattice K I) u - (mellinConstant K : ℂ)) *
          (u : ℂ) ^ (s / 2) / (u : ℂ) := sorry

/-- Neukirch (5.8), second half: the kernel is its constant term up to an exponentially small
error, `f_D(L, u) = a₀ + O(e^{-c u^(1/n)})`, because on the compact closure of `D` every parameter
is bounded below and the nonzero lattice points are bounded away from `0`. This is what licenses
the Mellin principle. -/
theorem mellinKernel_sub_const_isBigO {D : Set (ArchParam K)}
    (hD : IsUnitFundamentalDomain K D) (L : Submodule ℤ (mixedEmbedding.mixedSpace K))
    [DiscreteTopology L] [IsZLattice ℝ L] :
    ∃ c : ℝ, 0 < c ∧ (fun u : ℝ ↦ mellinKernel K D L u - (mellinConstant K : ℂ)) =O[atTop]
      fun u : ℝ ↦ Real.exp (-c * u ^ ((1 : ℝ) / Module.finrank ℚ K)) := sorry

theorem mellinKernel_tendsto {D : Set (ArchParam K)} (hD : IsUnitFundamentalDomain K D)
    (L : Submodule ℤ (mixedEmbedding.mixedSpace K)) [DiscreteTopology L] [IsZLattice ℝ L] :
    Tendsto (mellinKernel K D L) atTop (𝓝 (mellinConstant K : ℂ)) := sorry

/-- **Neukirch (5.8), first half — the transformation law of the kernel.** From
`latticeTheta_inv` and the substitution `x ↦ x⁻¹` on `S`, which preserves `d*x` and carries `D`
to `D⁻¹`: `f_D(L, 1/u) = u^(1/2) f_{D⁻¹}(L^∨, u)`. It holds for every lattice, with the Euclidean
dual; the covolumes `V_L V_{L^∨} = 1` make the two rescalings `u / V²` match on the nose. -/
theorem mellinKernel_inv {D : Set (ArchParam K)} (hD : IsUnitFundamentalDomain K D)
    (L : Submodule ℤ (mixedEmbedding.mixedSpace K)) [DiscreteTopology L] [IsZLattice ℝ L]
    {u : ℝ} (hu : 0 < u) :
    mellinKernel K D L u⁻¹ =
      ((Real.sqrt u : ℝ) : ℂ) *
        mellinKernel K ((fun y : ArchParam K ↦ fun w ↦ (y w)⁻¹) '' D) (mixedDual K L) u := sorry

/-- `(𝔞𝔡)⁻¹`, the trace dual of `𝔞`, as a unit: Mathlib's `FractionalIdeal.dual`. -/
noncomputable def dualUnit (I : (FractionalIdeal (𝓞 K)⁰ K)ˣ) : (FractionalIdeal (𝓞 K)⁰ K)ˣ :=
  Units.mk0 (FractionalIdeal.dual ℤ ℚ (I : FractionalIdeal (𝓞 K)⁰ K))
    (FractionalIdeal.dual_ne_zero (A := ℤ) (K := ℚ) I.ne_zero)

/-- The point `c₀ = m² / N(m²)^(1/n)` of `S`, `m_w = mult w`, `N(m²) = 16^r₂`, by which the
parameter is translated when the Euclidean dual of an ideal lattice is read as the trace dual:
`traceToEuclidean` doubles the complex coordinates, and `|2 z|² = 4 |z|²`. -/
noncomputable def traceShift : ArchParam K :=
  fun w ↦ (mult w : ℝ) ^ 2 / (16 : ℝ) ^ ((nrComplexPlaces K : ℝ) / Module.finrank ℚ K)

theorem traceShift_mem : traceShift K ∈ normOneSurface K := sorry

/-- The dual side of `mellinKernel_inv` is again an ideal kernel: by `coe_dualIdealLattice` the
Euclidean dual of `σ(𝔞)` is `traceToEuclidean (σ((𝔞𝔡)⁻¹))`, and the doubling of the complex
coordinates is the translation of the parameter by `traceShift`, a point of `S`, under which
`d*x` is invariant. The covolumes agree: `V_{(𝔞𝔡)⁻¹} = V_𝔞⁻¹ 4^(-r₂)` absorbs the `16^r₂`. -/
theorem mellinKernel_dualIdealLattice {D : Set (ArchParam K)} (hD : IsUnitFundamentalDomain K D)
    (I : (FractionalIdeal (𝓞 K)⁰ K)ˣ) (u : ℝ) :
    mellinKernel K D (dualIdealLattice K I) u =
      mellinKernel K ((fun y : ArchParam K ↦ traceShift K * y) '' D)
        (mixedEmbedding.idealLattice K (dualUnit K I)) u := sorry

/-- **The Dedekind instance of the Mellin principle**: `f = f_D(𝔞, ·)`, `g = f_{D⁻¹}(𝔞^∨, ·)`,
level `1`, weight `1/2`, `ε = 1`, both limits `a₀` (`mellinKernel_inv`, `mellinKernel_tendsto`,
`mellinKernel_sub_const_isBigO`). Its `completed` at `s/2` is `completedPartialZeta 𝔞` at `s`
(`dedekindFEPair_completed`), which is how the partial zeta functions are continued. -/
noncomputable def dedekindFEPair {D : Set (ArchParam K)} (hD : IsUnitFundamentalDomain K D)
    (I : (FractionalIdeal (𝓞 K)⁰ K)ˣ) : FEPairWithLevel ℂ where
  f := mellinKernel K D (mixedEmbedding.idealLattice K I)
  g := mellinKernel K ((fun y : ArchParam K ↦ fun w ↦ (y w)⁻¹) '' D) (dualIdealLattice K I)
  fLimit := mellinConstant K
  gLimit := mellinConstant K
  level := 1
  level_pos := one_pos
  weight := 1 / 2
  epsilon := 1
  transform := sorry
  f_decay := sorry
  g_decay := sorry

theorem dedekindFEPair_completed {D : Set (ArchParam K)} (hD : IsUnitFundamentalDomain K D)
    (I : (FractionalIdeal (𝓞 K)⁰ K)ˣ) {s : ℂ} (hs : 1 < s.re) :
    (dedekindFEPair K hD I).completed (s / 2) = completedPartialZeta K I s := sorry

theorem meromorphic_completedPartialZeta (I : (FractionalIdeal (𝓞 K)⁰ K)ˣ) :
    Meromorphic (completedPartialZeta K I) := sorry

theorem analyticAt_completedPartialZeta (I : (FractionalIdeal (𝓞 K)⁰ K)ˣ) {s : ℂ}
    (h0 : s ≠ 0) (h1 : s ≠ 1) : AnalyticAt ℂ (completedPartialZeta K I) s := sorry

/-- **Neukirch (5.9)**: `Z(𝔎, s) = Z(𝔎', 1 - s)` with `𝔎 𝔎' = [𝔡]`, i.e. against the dual ideal
`(𝔞𝔡)⁻¹`; the Mellin principle for `dedekindFEPair`, with `mellinKernel_dualIdealLattice` on the
`g` side. Pointwise off the poles `0`, `1`, and as germs everywhere. -/
theorem completedPartialZeta_one_sub (I : (FractionalIdeal (𝓞 K)⁰ K)ˣ) {s : ℂ} (h0 : s ≠ 0)
    (h1 : s ≠ 1) :
    completedPartialZeta K I (1 - s) = completedPartialZeta K (dualUnit K I) s := sorry

theorem completedPartialZeta_one_sub_eventuallyEq (I : (FractionalIdeal (𝓞 K)⁰ K)ˣ) (s : ℂ) :
    (fun z ↦ completedPartialZeta K I (1 - z)) =ᶠ[𝓝[≠] s]
      completedPartialZeta K (dualUnit K I) := sorry

/-- (5.9): the residue at `s = 1` is `2 a₀ = 2^r R / w`, from `residue_weight` at weight `1/2`
in the variable `s/2`; summed over the `h` classes this is the residue `2^(r₁+r₂) h R / w` of
`completedDedekindZeta` at `1` (`tendsto_sub_one_mul_completedDedekindZeta`, with
`Γ_ℝ(1) = 1`, `Γ_ℂ(1) = 1/π` and the class number formula). -/
theorem tendsto_sub_one_mul_completedPartialZeta (I : (FractionalIdeal (𝓞 K)⁰ K)ˣ) :
    Tendsto (fun s : ℂ ↦ (s - 1) * completedPartialZeta K I s) (𝓝[≠] 1)
      (𝓝 (2 * mellinConstant K : ℂ)) := sorry

/-- The rational check of the constants: `r = 1`, `R = 1`, `w = 2`, so `a₀ = 1/2` and the kernel
is `(1/2) ∑_{m ∈ ℤ} e^{-π u m²}`, Riemann's. -/
theorem mellinConstant_rat : mellinConstant ℚ = 1 / 2 := sorry

/-- The imaginary-quadratic check: `r = 1`, `R = 1`, `w = 4`, so `a₀ = 1/4`; the surface is a
point of mass `1/2` and `2^r₂ = 2` restores `1/4 · ∑_{a ∈ ℤ[i]} e^{-π √u |a|²}`, whose Mellin
transform at `s/2` is `2 π^{-s} Γ(s) ζ_{ℚ(i)}(s)`, the constant of
`completedDedekindZeta_cyclotomic_four`. -/
theorem mellinConstant_cyclotomic_four (F : Type u) [Field F] [NumberField F]
    [IsCyclotomicExtension {4} ℚ F] : mellinConstant F = 1 / 4 := sorry

/-- **The real-quadratic acceptance test of the unit quotient.** For a real quadratic field
`r₁ = 2`, `r₂ = 0`, the unit rank is `1`, `w = 2`, and the regulator is `log ε` for the
fundamental unit `ε > 1`. Then the fundamental domain — an interval of the norm-one hyperbola,
one period of `y ↦ |ε|² y` — has volume `2R`, the constant term of the kernel is `R`, and every
partial zeta function has residue `2R` at `s = 1`, summing over the `h` classes to the residue
`2hR` of `completedDedekindZeta` (`Γ_ℝ(1) = 1`). ⚠ None of this is visible over `ℚ` or `ℚ(i)`,
where the unit group is finite and the fundamental domain is a point; and none of it is produced
by the one-parameter theta series, whose lattice-point sum is not even summable here
(`not_summable_absNorm_of_rank_pos`). -/
theorem realQuadratic_unitQuotient_test (h₁ : nrRealPlaces K = 2) (h₂ : nrComplexPlaces K = 0)
    {D : Set (ArchParam K)} (hD : IsUnitFundamentalDomain K D)
    (I : (FractionalIdeal (𝓞 K)⁰ K)ˣ) :
    NumberField.Units.rank K = 1 ∧ NumberField.Units.torsionOrder K = 2 ∧
      surfaceHaar K (Subtype.val ⁻¹' D) = ENNReal.ofReal (2 * NumberField.Units.regulator K) ∧
      mellinConstant K = NumberField.Units.regulator K ∧
      Tendsto (mellinKernel K D (mixedEmbedding.idealLattice K I)) atTop
        (𝓝 (NumberField.Units.regulator K : ℂ)) ∧
      Tendsto (fun s : ℂ ↦ (s - 1) * completedPartialZeta K I s) (𝓝[≠] 1)
        (𝓝 (2 * NumberField.Units.regulator K : ℂ)) := sorry

end UnitQuotient

noncomputable def χ₄C : DirichletCharacter ℂ 4 :=
  ZMod.χ₄.ringHomComp (Int.castRingHom ℂ)

/-! ### The Poisson and Mellin normalization

Layer 1 fixes the Fourier conventions and Layer 3 the completed function; the single theorem
below and its two checks are stated together, after both, so that no convention is chosen twice.
-/

open scoped Classical in
/-- **The single normalization theorem.** Every choice the functional equation depends on is
visible here at once: the additive character and the Fourier sign (inside `mixedFourier`), the
self-dual measure and the Euclidean pairing (likewise), the covolume of the ideal lattice, the
discriminant power `|d_K| ^ (s/2)`, the two archimedean factors — including the factor `2` inside
Mathlib's `Gammaℂ s = 2 (2π) ^ (-s) Γ s` — and the Mellin kernel itself, `mellinKernel`, with its
constant term `mellinConstant` and Neukirch's convention (5.5), `Z(𝔎, s) = ∫ (f(u) - a₀) u^(s/2)
du/u`; the kernel is the theta series of the ideal lattice averaged over a fundamental domain for
the units, and the third conjunct is `completedPartialZeta_eq_mellin` for every fundamental
domain. ⚠ It is not an existential: an unnamed `θ` would hide the unit quotient, which is the
whole difficulty in positive unit rank. The last conjunct repeats
`completedDedekindZeta_eq` deliberately, so that the discriminant power and the gamma factors are
audited beside the Fourier and covolume conventions they come from: scattered convention remarks
do not prevent a factor-of-two or an inverse-discriminant error.

The first conjunct is `TauCetiRoadmap.ThetaSeries.fourier_gaussian` at `τ = I * t`, and the second
is `poissonSummation_idealLattice` applied to it; both are stated again here because the point of
the theorem is that the four number-field constants — the covolume, the discriminant power and the
two archimedean factors — are audited against the Fourier conventions in one place. The three
worked checks are `completedDedekindZeta_rat`, `completedDedekindZeta_cyclotomic_four` and, for
the unit quotient, `realQuadratic_unitQuotient_test`. -/
theorem gaussianTheta_mellin_normalization (K : Type u) [Field K] [NumberField K] :
    (∀ t : ℝ, 0 < t → ∀ y : mixedEmbedding.mixedSpace K,
        mixedFourier K (mixedGaussian K t) y =
          (t : ℂ) ^ (-(Module.finrank ℚ K : ℂ) / 2) * mixedGaussian K t⁻¹ y) ∧
      (∀ (I : (FractionalIdeal (𝓞 K)⁰ K)ˣ) (t : ℝ), 0 < t →
        ∑' x : mixedEmbedding.idealLattice K I,
            mixedGaussian K t (x : mixedEmbedding.mixedSpace K) =
          ((ZLattice.covolume (mixedEmbedding.idealLattice K I) : ℝ) : ℂ)⁻¹ *
            (t : ℂ) ^ (-(Module.finrank ℚ K : ℂ) / 2) *
            ∑' y : dualIdealLattice K I,
              mixedGaussian K t⁻¹ (y : mixedEmbedding.mixedSpace K)) ∧
      (∀ (D : Set (ArchParam K)), IsUnitFundamentalDomain K D →
        ∀ (I : (FractionalIdeal (𝓞 K)⁰ K)ˣ) (s : ℂ), 1 < s.re →
          completedPartialZeta K I s =
            ∫ u in Set.Ioi (0 : ℝ),
              (mellinKernel K D (mixedEmbedding.idealLattice K I) u - (mellinConstant K : ℂ)) *
                (u : ℂ) ^ (s / 2) / (u : ℂ)) ∧
      (∀ s : ℂ, 1 < s.re →
        completedDedekindZeta K s =
          ((|discr K| : ℤ) : ℂ) ^ (s / 2) * Gammaℝ s ^ nrRealPlaces K *
            Gammaℂ s ^ nrComplexPlaces K * dedekindZeta K s) := sorry

/-- Worked rational check: conductor one, one real gamma factor, no complex factor, and the
completed function is Mathlib's `completedRiemannZeta` wherever both are regular. -/
theorem completedDedekindZeta_rat {s : ℂ} (h0 : s ≠ 0) (h1 : s ≠ 1) :
    completedDedekindZeta ℚ s = completedRiemannZeta s := sorry

/-- Worked imaginary-quadratic check. `|d| = 4` and `r₂ = 1`, so the conductor power is `2 ^ s`
and the archimedean factor is `Gammaℂ s = 2 (2π) ^ (-s) Γ s`; Legendre duplication collapses the
product against the factorization of `ζ_{ℚ(i)}` into the displayed constant. ⚠ Dropping the factor
`2` in `Gammaℂ`, or writing the conductor power as `|d| ^ (-s/2)`, changes this constant, and the
rational check above sees neither error. -/
theorem completedDedekindZeta_cyclotomic_four
    (F : Type u) [Field F] [NumberField F] [IsCyclotomicExtension {4} ℚ F]
    {s : ℂ} (hs : 1 < s.re) :
    completedDedekindZeta F s =
      2 * (Real.pi : ℂ) ^ (-s) * Complex.Gamma s * riemannZeta s *
        DirichletCharacter.LFunction χ₄C s := sorry

open scoped Classical in
/-- The covolume half of the same check: over `ℚ(i)` the ring of integers has covolume
`2 ^ (-1) * √4 = 1` in the mixed space. -/
theorem covolume_idealLattice_cyclotomic_four
    (F : Type u) [Field F] [NumberField F] [IsCyclotomicExtension {4} ℚ F] :
    ZLattice.covolume (mixedEmbedding.idealLattice F 1) = 1 := sorry

/-! ## Layer 4: Dirichlet L-functions and factorizations -/

noncomputable def dirichletData {N : ℕ} [NeZero N]
    (χ : DirichletCharacter ℂ N) (hχ : χ.IsPrimitive) : AnalyticLFunctionData := sorry

theorem dirichletData_hasContinuation {N : ℕ} [NeZero N]
    (χ : DirichletCharacter ℂ N) (hχ : χ.IsPrimitive) :
    (dirichletData χ hχ).HasMeromorphicContinuation := sorry

theorem dirichletData_hasFunctionalEquation {N : ℕ} [NeZero N]
    (χ : DirichletCharacter ℂ N) (hχ : χ.IsPrimitive) :
    (dirichletData χ hχ).HasFunctionalEquation := sorry

/-- Layer 4: the quadratic factorization. ⚠ Both sides have a simple pole at `s = 1`, where
Mathlib's value is junk, so the identity is stated on the half-plane of convergence, as an
equality of germs everywhere, and pointwise only off the polar locus. The germ statement is what
`eventuallyEq_of_meromorphic_of_eqOn_halfPlane` produces from the first. -/
theorem dedekindZetaC_quadratic
    (F : Type u) [Field F] [NumberField F] (hF : Module.finrank ℚ F = 2) :
    ∃ (N : ℕ) (_ : NeZero N) (χ : DirichletCharacter ℂ N), χ.IsPrimitive ∧
      (∀ s : ℂ, 1 < s.re →
        dedekindZetaC F s = riemannZeta s * DirichletCharacter.LFunction χ s) ∧
      (∀ s : ℂ, dedekindZetaC F =ᶠ[𝓝[≠] s]
        fun z ↦ riemannZeta z * DirichletCharacter.LFunction χ z) ∧
      (∀ s : ℂ, s ≠ 1 →
        dedekindZetaC F s = riemannZeta s * DirichletCharacter.LFunction χ s) := sorry

/-- Layer 4: cyclotomic factorization using primitive characters inducing the characters modulo
`n`.  There is no correction factor in this primitive form.  The trivial character contributes
`riemannZeta`, so both sides have a simple pole at `s = 1` and the same three-level statement is
required as in the quadratic case. -/
theorem dedekindZetaC_cyclotomic
    (n : ℕ) [NeZero n] (F : Type u) [Field F] [NumberField F]
    [IsCyclotomicExtension {n} ℚ F]
    (m : DirichletCharacter ℂ n → ℕ) (hm : ∀ χ, NeZero (m χ))
    (hdvd : ∀ χ, m χ ∣ n)
    (χ' : ∀ χ : DirichletCharacter ℂ n, DirichletCharacter ℂ (m χ))
    (hprim : ∀ χ, (χ' χ).IsPrimitive)
    (hind : ∀ χ, DirichletCharacter.changeLevel (hdvd χ) (χ' χ) = χ) :
    (∀ s : ℂ, 1 < s.re →
        dedekindZetaC F s =
          ∏ χ : DirichletCharacter ℂ n,
            haveI := hm χ; DirichletCharacter.LFunction (χ' χ) s) ∧
      (∀ s : ℂ, dedekindZetaC F =ᶠ[𝓝[≠] s]
        fun z ↦ ∏ χ : DirichletCharacter ℂ n,
          haveI := hm χ; DirichletCharacter.LFunction (χ' χ) z) ∧
      (∀ s : ℂ, s ≠ 1 →
        dedekindZetaC F s =
          ∏ χ : DirichletCharacter ℂ n,
            haveI := hm χ; DirichletCharacter.LFunction (χ' χ) s) := sorry

/-- Layer 4: the corresponding factorization in terms of level-`n` characters.  The extra Euler
factors occur on the denominator side, as recorded by the product multiplying `dedekindZetaC`. -/
theorem dedekindZetaC_cyclotomic_imprimitive
    (n : ℕ) [NeZero n] (F : Type u) [Field F] [NumberField F]
    [IsCyclotomicExtension {n} ℚ F]
    (m : DirichletCharacter ℂ n → ℕ) (hdvd : ∀ χ, m χ ∣ n)
    (χ' : ∀ χ : DirichletCharacter ℂ n, DirichletCharacter ℂ (m χ))
    (hprim : ∀ χ, (χ' χ).IsPrimitive)
    (hind : ∀ χ, DirichletCharacter.changeLevel (hdvd χ) (χ' χ) = χ) :
    (∀ s : ℂ, 1 < s.re →
        dedekindZetaC F s * ∏ χ : DirichletCharacter ℂ n, ∏ p ∈ n.primeFactors,
            (if p ∣ m χ then (1 : ℂ) else 1 - χ' χ (p : ZMod (m χ)) * (p : ℂ) ^ (-s)) =
          ∏ χ : DirichletCharacter ℂ n, DirichletCharacter.LFunction χ s) ∧
      (∀ s : ℂ,
        (fun z ↦ dedekindZetaC F z * ∏ χ : DirichletCharacter ℂ n, ∏ p ∈ n.primeFactors,
            (if p ∣ m χ then (1 : ℂ) else 1 - χ' χ (p : ZMod (m χ)) * (p : ℂ) ^ (-z))) =ᶠ[𝓝[≠] s]
          fun z ↦ ∏ χ : DirichletCharacter ℂ n, DirichletCharacter.LFunction χ z) := sorry

/-- The mandatory ramified example, at all three levels.  The prime `2` ramifies in `ℚ(i)`, and
`χ₄C` is the primitive character modulo `4`. -/
theorem dedekindZetaC_cyclotomic_four
    (F : Type u) [Field F] [NumberField F] [IsCyclotomicExtension {4} ℚ F] :
    (∀ s : ℂ, 1 < s.re →
        dedekindZetaC F s = riemannZeta s * DirichletCharacter.LFunction χ₄C s) ∧
      (∀ s : ℂ, dedekindZetaC F =ᶠ[𝓝[≠] s]
        fun z ↦ riemannZeta z * DirichletCharacter.LFunction χ₄C z) ∧
      (∀ s : ℂ, s ≠ 1 →
        dedekindZetaC F s = riemannZeta s * DirichletCharacter.LFunction χ₄C s) := sorry

/-! ## Layers 5--6: Hecke and Grossencharacter L-functions -/

noncomputable def rayClassIdealWeight
    (𝔪 : GNF.Modulus K) (χ : GNF.RayClassCharacter 𝔪) : ADS.UnitaryIdealWeight K := sorry

/-- On an ideal prime to the modulus the weight is the character of its ray class. The argument is
the supplier's prime-to carrier, so no junk class can be read off a bad ideal. -/
theorem rayClassIdealWeight_apply (𝔪 : GNF.Modulus K) (χ : GNF.RayClassCharacter 𝔪)
    (I : GNF.integralIdealsPrimeTo 𝔪) :
    rayClassIdealWeight K 𝔪 χ (I : Ideal (𝓞 K)) = (χ (GNF.idealClass 𝔪 I) : ℂ) := sorry

/-- ⚠ The weight vanishes at the zero ideal and at every prime dividing the finite part of the
modulus. This is what deletes the Euler factors recorded by `finiteEulerCorrection`. -/
theorem rayClassIdealWeight_eq_zero (𝔪 : GNF.Modulus K) (χ : GNF.RayClassCharacter 𝔪)
    {I : Ideal (𝓞 K)} (hI : ¬ 𝔪.IsCoprimeTo I) :
    rayClassIdealWeight K 𝔪 χ I = 0 := sorry

/-- **A finite-order character presented at its own conductor.** ⚠ One ray-class character can be
presented at every multiple of its conductor, so a conductor stored beside a presentation modulus
lets the same character carry several incompatible conductors, hence several incompatible gamma
factors, root numbers and local factors. Every primitive-scoped declaration below — completion,
Gauss sum, root number, analytic card — takes this carrier, and the presented series
`heckeLFunctionC` keeps taking a presentation. -/
structure PrimitiveRayClassCharacter (K : Type u) [Field K] [NumberField K] where
  conductor : GNF.Modulus K
  character : GNF.RayClassCharacter conductor
  isPrimitive : character.IsPrimitive

theorem rayClassCharacter_primitive_inv
    {𝔪 : GNF.Modulus K} {χ : GNF.RayClassCharacter 𝔪} (hχ : χ.IsPrimitive) :
    (χ⁻¹).IsPrimitive := sorry

namespace PrimitiveRayClassCharacter

/-- `ψ` presents `χ`: the presentation modulus is a multiple of the conductor and `χ` is induced
from `ψ` along it. -/
def Presents (ψ : PrimitiveRayClassCharacter K) {𝔪 : GNF.Modulus K}
    (χ : GNF.RayClassCharacter 𝔪) : Prop :=
  ∃ h : ψ.conductor ∣ 𝔪, GNF.RayClassCharacter.induced h ψ.character = χ

/-- **The universal property of the conductor.** Every presentation is induced from exactly one
primitive character, so `conductorOf` below is a function of the character and not of the modulus
it was written at. Without uniqueness there is no such thing as *the* conductor. -/
theorem exists_unique_primitive {𝔪 : GNF.Modulus K} (χ : GNF.RayClassCharacter 𝔪) :
    ∃! ψ : PrimitiveRayClassCharacter K, Presents K ψ χ := sorry

/-- The primitive character underlying a presentation. -/
noncomputable def of {𝔪 : GNF.Modulus K} (χ : GNF.RayClassCharacter 𝔪) :
    PrimitiveRayClassCharacter K :=
  (exists_unique_primitive K χ).exists.choose

theorem of_presents {𝔪 : GNF.Modulus K} (χ : GNF.RayClassCharacter 𝔪) :
    Presents K (of K χ) χ :=
  (exists_unique_primitive K χ).exists.choose_spec

/-- The conductor of a character: the modulus of its primitive source. -/
noncomputable def conductorOf {𝔪 : GNF.Modulus K} (χ : GNF.RayClassCharacter 𝔪) :
    GNF.Modulus K :=
  (of K χ).conductor

/-- ⚠ Regression: a primitive character is its own primitive source, so its conductor is its
presentation modulus and no second conductor is available for it. -/
theorem of_character (ψ : PrimitiveRayClassCharacter K) : of K ψ.character = ψ := sorry

/-- The inverse character is primitive at the same conductor; the functional equation reflects
against it. -/
noncomputable def inv (ψ : PrimitiveRayClassCharacter K) : PrimitiveRayClassCharacter K where
  conductor := ψ.conductor
  character := ψ.character⁻¹
  isPrimitive := rayClassCharacter_primitive_inv K ψ.isPrimitive

theorem inv_inv (ψ : PrimitiveRayClassCharacter K) : inv K (inv K ψ) = ψ := sorry

end PrimitiveRayClassCharacter

noncomputable def modulusFour : GNF.Modulus ℚ := sorry

noncomputable def oddRayClassCharacterModFour : GNF.RayClassCharacter modulusFour := sorry

theorem oddRayClassCharacterModFour_isPrimitive :
    oddRayClassCharacterModFour.IsPrimitive := sorry

noncomputable def modulusFive : GNF.Modulus ℚ := sorry

noncomputable def evenRayClassCharacterModFive : GNF.RayClassCharacter modulusFive := sorry

theorem evenRayClassCharacterModFive_isPrimitive :
    evenRayClassCharacterModFive.IsPrimitive := sorry

/-- The bundled forms consumed by the primitive-scoped declarations. -/
noncomputable def oddPrimitiveModFour : PrimitiveRayClassCharacter ℚ :=
  ⟨modulusFour, oddRayClassCharacterModFour, oddRayClassCharacterModFour_isPrimitive⟩

noncomputable def evenPrimitiveModFive : PrimitiveRayClassCharacter ℚ :=
  ⟨modulusFive, evenRayClassCharacterModFive, evenRayClassCharacterModFive_isPrimitive⟩

/-- The presented L-series of a character **at a presentation modulus**. It depends on the
presentation and not only on the character: the primes dividing the finite part of `𝔪` are
omitted. -/
noncomputable def heckeLFunctionC
    {𝔪 : GNF.Modulus K} (χ : GNF.RayClassCharacter 𝔪) : ℂ → ℂ := sorry

open scoped Classical in
/-- The Euler factors deleted when the series of `χ` is presented at the larger modulus `𝔫`:
`∏_{𝔭 ∣ 𝔫₀, 𝔭 ∤ 𝔪₀} (1 - χ([𝔭]) N𝔭 ^ (-s))`. The character value is taken through
`rayClassIdealWeight`, which is total and vanishes at the bad primes, so no junk class is read. -/
noncomputable def eulerCorrection {𝔪 : GNF.Modulus K} (χ : GNF.RayClassCharacter 𝔪)
    (𝔫 : GNF.Modulus K) (s : ℂ) : ℂ :=
  ∏ 𝔭 ∈ 𝔫.support \ 𝔪.support,
    (1 - rayClassIdealWeight K 𝔪 χ 𝔭.asIdeal * (Ideal.absNorm 𝔭.asIdeal : ℂ) ^ (-s))

/-- The correction for the trivial character at the trivial modulus is exactly the finite Euler
correction that `sum_partialZeta` carries: one notion, not two. -/
theorem eulerCorrection_one (𝔪 : GNF.Modulus K) (s : ℂ) :
    eulerCorrection K (1 : GNF.RayClassCharacter (GNF.Modulus.one K)) 𝔪 s =
      finiteEulerCorrection K 𝔪 s := sorry

theorem heckeLFunctionC_eq
    {𝔪 : GNF.Modulus K} (χ : GNF.RayClassCharacter 𝔪) {s : ℂ} (hs : 1 < s.re) :
    heckeLFunctionC K χ s = LSeries
      (ADS.normCoeff K
        (TauCetiRoadmap.ArithmeticDirichletSeries.UnitaryIdealWeight.toArithmeticFunction K
          (rayClassIdealWeight K 𝔪 χ))) s := sorry

/-- Inducing multiplies the presented series by the deleted Euler factors. ⚠ For the trivial
character both sides have a pole at `s = 1`, so the identity is stated on the half-plane and as an
equality of germs, never as an unrestricted equality of values. -/
theorem heckeLFunctionC_induced
    {𝔪 𝔫 : GNF.Modulus K} (h : 𝔪 ∣ 𝔫) (χ : GNF.RayClassCharacter 𝔪) :
    (∀ s : ℂ, 1 < s.re →
        heckeLFunctionC K (GNF.RayClassCharacter.induced h χ) s =
          heckeLFunctionC K χ s * eulerCorrection K χ 𝔫 s) ∧
      (∀ s : ℂ, heckeLFunctionC K (GNF.RayClassCharacter.induced h χ) =ᶠ[𝓝[≠] s]
        fun z ↦ heckeLFunctionC K χ z * eulerCorrection K χ 𝔫 z) := sorry

/-- Every presented series is the primitive series times a finite Euler correction, with the
conductor supplied by the universal property rather than by the presentation. -/
theorem heckeLFunctionC_eq_primitive
    {𝔪 : GNF.Modulus K} (χ : GNF.RayClassCharacter 𝔪) :
    (∀ s : ℂ, 1 < s.re →
        heckeLFunctionC K χ s =
          heckeLFunctionC K (PrimitiveRayClassCharacter.of K χ).character s *
            eulerCorrection K (PrimitiveRayClassCharacter.of K χ).character 𝔪 s) ∧
      (∀ s : ℂ, heckeLFunctionC K χ =ᶠ[𝓝[≠] s]
        fun z ↦ heckeLFunctionC K (PrimitiveRayClassCharacter.of K χ).character z *
          eulerCorrection K (PrimitiveRayClassCharacter.of K χ).character 𝔪 z) := sorry

/-- **Orthogonality reconstruction.** ⚠ Both sides run over the ideals prime to the modulus, so no
Euler correction appears here; it appears only when the principal-character term is rewritten as
`ζ_K`, by `principalHecke_test`. -/
theorem partialZeta_eq_sum_heckeLFunctionC (𝔪 : GNF.Modulus K)
    [Fintype (GNF.RayClassCharacter 𝔪)] (c : GNF.RayClassGroup 𝔪) {s : ℂ} (hs : 1 < s.re) :
    (Nat.card (GNF.RayClassGroup 𝔪) : ℂ) * partialZeta K 𝔪 c s =
      ∑ χ : GNF.RayClassCharacter 𝔪, (starRingEnd ℂ) ((χ c : ℂˣ) : ℂ) *
        heckeLFunctionC K χ s := sorry

noncomputable def completedHeckeLFunction (χ : PrimitiveRayClassCharacter K) : ℂ → ℂ := sorry

theorem differentiable_completedHeckeLFunction
    (χ : PrimitiveRayClassCharacter K) (hχ : χ.character ≠ 1) :
    Differentiable ℂ (completedHeckeLFunction K χ) := sorry

noncomputable def heckeRootNumber (χ : PrimitiveRayClassCharacter K) : ℂ := sorry

theorem norm_heckeRootNumber (χ : PrimitiveRayClassCharacter K) :
    ‖heckeRootNumber K χ‖ = 1 := sorry

/-- The functional equation of a nontrivial primitive character, whose completed function is
entire. -/
theorem completedHeckeLFunction_one_sub
    (χ : PrimitiveRayClassCharacter K) (hχ : χ.character ≠ 1) (s : ℂ) :
    completedHeckeLFunction K χ s =
      heckeRootNumber K χ *
        completedHeckeLFunction K (PrimitiveRayClassCharacter.inv K χ) (1 - s) := sorry

/-- ⚠ The trivial primitive character is not excluded from the theory, only from the pointwise
statement: its completed function is `completedDedekindZeta`, which has poles at `0` and `1`. The
germ form covers it. -/
theorem completedHeckeLFunction_one_sub_eventuallyEq
    (χ : PrimitiveRayClassCharacter K) (s : ℂ) :
    completedHeckeLFunction K χ =ᶠ[𝓝[≠] s]
      fun z ↦ heckeRootNumber K χ *
        completedHeckeLFunction K (PrimitiveRayClassCharacter.inv K χ) (1 - z) := sorry

/-- The Mellin presentation in the form the zeros roadmap consumes. ⚠ The witness is not left to
this existential: it is `Grossencharacter.heckeMellinTotal` of the finite-order presentation,
identified in `completedHeckeLFunction_eq_mellin` (Layer 6), with
`θ(t) = 2 t^(Tr p / n) (F(t²) - a₀)`. -/
theorem exists_mellin_completedHeckeLFunction (χ : PrimitiveRayClassCharacter K) :
    ∃ θ : ℝ → ℂ, ∀ s : ℂ, 1 < s.re →
      completedHeckeLFunction K χ s =
        ∫ t in Set.Ioi (0 : ℝ), θ t * (t : ℂ) ^ s / (t : ℂ) := sorry

noncomputable def heckeData (χ : PrimitiveRayClassCharacter K) : AnalyticLFunctionData := sorry

/-- Relative degree one is not the absolute degree of the analytic card. -/
def relativeDegree {𝔪 : GNF.Modulus K} (_ : GNF.RayClassCharacter 𝔪) : ℕ := 1

/-- The required imprimitive regression. The trivial character at a nontrivial modulus has no card
at its presentation modulus, and its presented series is `ζ_K` with the finite Euler factors
deleted — the same correction as in `sum_partialZeta`. ⚠ Both sides have a pole at `s = 1`, so the
identity is stated on the half-plane and as germs. -/
theorem principalHecke_test (𝔪 : GNF.Modulus K) (h𝔪 : 𝔪 ≠ GNF.Modulus.one K) :
    ¬ (1 : GNF.RayClassCharacter 𝔪).IsPrimitive ∧
      (∀ s : ℂ, 1 < s.re →
        heckeLFunctionC K (1 : GNF.RayClassCharacter 𝔪) s =
          dedekindZetaC K s * finiteEulerCorrection K 𝔪 s) ∧
      (∀ s : ℂ, heckeLFunctionC K (1 : GNF.RayClassCharacter 𝔪) =ᶠ[𝓝[≠] s]
        fun z ↦ dedekindZetaC K z * finiteEulerCorrection K 𝔪 z) := sorry

/-- The conductor of the trivial character is the trivial modulus, at every presentation: the
universal property, applied to the case where a presentation level would otherwise be mistaken for
a conductor. -/
theorem conductorOf_one (𝔪 : GNF.Modulus K) :
    PrimitiveRayClassCharacter.conductorOf K (1 : GNF.RayClassCharacter 𝔪) =
      GNF.Modulus.one K := sorry

/-- The finite-family hypotheses used by the `3-4-1` argument. Cancellation of norm twists is
required only for nontrivial members; the identity member supplies the zeta pole. -/
structure CancellingFamily (G : Type*) [CommGroup G] [Fintype G]
    (w : G → ADS.UnitaryIdealWeight K) : Prop where
  map_mul : ∀ g h : G, ∀ I : Ideal (𝓞 K),
    w (g * h) I = w g I * w h I
  map_one : ∀ I : Ideal (𝓞 K),
    TauCetiRoadmap.ArithmeticDirichletSeries.UnitaryIdealWeight.IsGood K (w 1) I →
      w 1 I = 1
  cancellation : ∀ g : G, g ≠ 1 → ADS.HasCancellation K (w g)
  conj : ∀ g : G, ∃ h : G, ∀ I : Ideal (𝓞 K),
    w h I = starRingEnd ℂ (w g I)
  cancellation_normTwist : ∀ g : G, g ≠ 1 → ∀ t : ℝ,
    ADS.HasCancellation K
      (TauCetiRoadmap.ArithmeticDirichletSeries.UnitaryIdealWeight.imaginaryNormTwist K (w g) t)

/-- Hypotheses for one possibly infinite-order unitary character. The square of a twist may be a
pure norm twist or may cancel; requiring cancellation in all cases excludes quadratic examples. -/
structure UnitaryCancelling (χ : ADS.UnitaryIdealWeight K) : Prop where
  not_normTwist : ∀ u : ℝ,
    ¬ TauCetiRoadmap.ArithmeticDirichletSeries.UnitaryIdealWeight.IsNormTwistOnGood K χ u
  cancellation : ADS.HasCancellation K χ
  cancellation_conj : ADS.HasCancellation K
    (TauCetiRoadmap.ArithmeticDirichletSeries.UnitaryIdealWeight.conj K χ)
  cancellation_normTwist : ∀ t : ℝ, ADS.HasCancellation K
    (TauCetiRoadmap.ArithmeticDirichletSeries.UnitaryIdealWeight.imaginaryNormTwist K χ t)
  square_twist : ∀ t : ℝ,
    (∃ u : ℝ,
      TauCetiRoadmap.ArithmeticDirichletSeries.UnitaryIdealWeight.IsNormTwistOnGood K
        (TauCetiRoadmap.ArithmeticDirichletSeries.UnitaryIdealWeight.sq K
          (TauCetiRoadmap.ArithmeticDirichletSeries.UnitaryIdealWeight.imaginaryNormTwist K χ t))
        u) ∨
      ADS.HasCancellation K
        (TauCetiRoadmap.ArithmeticDirichletSeries.UnitaryIdealWeight.sq K
          (TauCetiRoadmap.ArithmeticDirichletSeries.UnitaryIdealWeight.imaginaryNormTwist K χ t))

/-- **Analytic presentation of the imported Hecke-character carrier, at a modulus.** The idele
class character `toHeckeCharacter` is the primary object: every other field is pinned to it by an
equation, so a presentation is determined by its Hecke character (`Grossencharacter.ext`), and the
L-function, conductor, root number and completions below describe that one character.

* `unitaryWeight` is the ideal weight induced by `toHeckeCharacter.unitaryPart`. At a prime `v`
  not dividing the finite part of the modulus it is the value of the unitary part at the class of
  a prime idele at `v` — an idele whose `v`-coordinate is a uniformizer and whose every other
  finite and infinite coordinate is `1`, described through the supplier's `ideleFiniteCoord` and
  `ideleInfiniteCoord` — and it vanishes at the ideals not prime to `𝔪`. Complete
  multiplicativity then fixes it everywhere.
* `infinityType` is the archimedean restriction of `toHeckeCharacter`: the supplier's
  `HeckeCharacter.infinityType`, compared on the identity component by the supplier's own
  comparison `EqOnIdentityComponent` — the comparison in Weil's type-`A₀` condition — and on the
  nose at the real places outside `𝔪`, where no sign twist is presented.
* `𝔪` is a modulus of definition: `toHeckeCharacter` is trivial on the finite part of the
  supplier's `IdeleCongruenceSubgroup 𝔪`, the ideles of that subgroup whose archimedean
  coordinates are all `1`. ⚠ Not on the whole subgroup: that would force finite order.

⚠ The archimedean carrier is the supplier's `AlgebraicInfinityType`, so this presents an
**algebraic** Hecke character (Weil's type `A₀`): `infinityType_eq` is a witness of
`toHeckeCharacter.IsAlgebraic`. The continuous family is not presented here — `normCharacter K t`
for `t ≠ 0` is not algebraic (`not_isAlgebraic_normCharacter`) — and the imaginary norm twists of
Layer 7 enter through `UnitaryIdealWeight.imaginaryNormTwist` on the weight. There is no
finite-character field: a ray-class character is a presentation only in the finite-order case
(`exists_rayClassCharacter_of_isFiniteOrder`), and the real shift is not a field either, but the
supplier's `HeckeCharacter.shift` of the primary object (`Grossencharacter.shift`). -/
structure Grossencharacter
    (K : Type u) [Field K] [NumberField K] (𝔪 : GNF.Modulus K) where
  toHeckeCharacter : GNF.HeckeCharacter K
  unitaryWeight : ADS.UnitaryIdealWeight K
  infinityType : GNF.AlgebraicInfinityType K
  eq_one_of_mem : ∀ y ∈ GNF.IdeleCongruenceSubgroup 𝔪,
    (∀ w : InfinitePlace K, GNF.ideleInfiniteCoord w y = 1) →
      toHeckeCharacter (QuotientGroup.mk y) = 1
  infinityType_eq : GNF.ContinuousInfinityType.EqOnIdentityComponent
    infinityType.toContinuous toHeckeCharacter.infinityType
  realParity_eq : ∀ w : {w : InfinitePlace K // w.IsReal}, w ∉ 𝔪.infinitePart →
    toHeckeCharacter.infinityType.realParity w = infinityType.toContinuous.realParity w
  unitaryWeight_eq_zero : ∀ I : Ideal (𝓞 K), ¬ 𝔪.IsCoprimeTo I → unitaryWeight I = 0
  unitaryWeight_apply : ∀ v : HeightOneSpectrum (𝓞 K), ¬ v.asIdeal ∣ 𝔪.finitePart →
    ∀ y : GNF.IdeleGroup K,
      Valued.v ((GNF.ideleFiniteCoord v y : (v.adicCompletion K)ˣ) : v.adicCompletion K) =
        ((Multiplicative.ofAdd (-1 : ℤ) : Multiplicative ℤ) : WithZero (Multiplicative ℤ)) →
      (∀ v' : HeightOneSpectrum (𝓞 K), v' ≠ v → GNF.ideleFiniteCoord v' y = 1) →
      (∀ w : InfinitePlace K, GNF.ideleInfiniteCoord w y = 1) →
      unitaryWeight v.asIdeal = ((toHeckeCharacter.unitaryPart (QuotientGroup.mk y) : ℂˣ) : ℂ)

namespace Grossencharacter

variable {K} in
/-- The real shift is the supplier's, read off the primary object; it is not a second field. -/
noncomputable def shift {𝔪 : GNF.Modulus K} (χ : Grossencharacter K 𝔪) : ℝ :=
  χ.toHeckeCharacter.shift

variable {K} in
/-- **The Hecke character is primary.** Two presentations of one idele class character at one
modulus are equal: the weight is forced by `unitaryWeight_apply` and `unitaryWeight_eq_zero`
through complete multiplicativity, and the infinity type by `infinityType_eq` and the supplier's
`AlgebraicInfinityType.toContinuous_injective`. -/
theorem ext {𝔪 : GNF.Modulus K} {χ ψ : Grossencharacter K 𝔪}
    (h : χ.toHeckeCharacter = ψ.toHeckeCharacter) : χ = ψ := sorry

noncomputable def lFunctionC {𝔪 : GNF.Modulus K} (χ : Grossencharacter K 𝔪) : ℂ → ℂ := sorry

/-- **The coefficients of the presented L-function.** On its half-plane of convergence it is the
norm-regrouped series of the presented unitary weight recentered by the shift,
`∑ χ_u(𝔞) N𝔞^(shift - s)` over the ideals prime to `𝔪`: the convention `χ = χ_u N^shift` of the
recentering law `completed_recenter`. Its Euler factors are the supplier's `EulerProductData` for
that weight, evaluated at `s - shift`. -/
theorem lFunctionC_eq {𝔪 : GNF.Modulus K} (χ : Grossencharacter K 𝔪) {s : ℂ}
    (hs : 1 + χ.shift < s.re) :
    lFunctionC K χ s =
      LSeries (ADS.normCoeff K
        (TauCetiRoadmap.ArithmeticDirichletSeries.UnitaryIdealWeight.toArithmeticFunction K
          χ.unitaryWeight)) (s - (χ.shift : ℂ)) := sorry

theorem meromorphic_lFunctionC {𝔪 : GNF.Modulus K} (χ : Grossencharacter K 𝔪) :
    Meromorphic (lFunctionC K χ) := sorry

noncomputable def primitiveConductor
    {𝔪 : GNF.Modulus K} (χ : Grossencharacter K 𝔪) : GNF.Modulus K := sorry

/-- **The universal property of the conductor.** A modulus presents the underlying Hecke
character exactly when it is a multiple of the conductor, so the conductor is a function of
`toHeckeCharacter` and not of the modulus the presentation was written at. -/
theorem primitiveConductor_dvd_iff {𝔪 : GNF.Modulus K} (χ : Grossencharacter K 𝔪)
    (𝔫 : GNF.Modulus K) :
    primitiveConductor K χ ∣ 𝔫 ↔
      ∃ ψ : Grossencharacter K 𝔫, ψ.toHeckeCharacter = χ.toHeckeCharacter := sorry

theorem primitiveConductor_dvd {𝔪 : GNF.Modulus K} (χ : Grossencharacter K 𝔪) :
    primitiveConductor K χ ∣ 𝔪 :=
  (primitiveConductor_dvd_iff K χ 𝔪).mpr ⟨χ, rfl⟩

theorem primitiveConductor_dvd_self {𝔪 : GNF.Modulus K} (χ : Grossencharacter K 𝔪) :
    primitiveConductor K χ ∣ primitiveConductor K χ :=
  ⟨dvd_refl _, Finset.Subset.refl _⟩

/-- The primitive presentation of the same Hecke character, at its conductor. -/
noncomputable def primitive {𝔪 : GNF.Modulus K} (χ : Grossencharacter K 𝔪) :
    Grossencharacter K (primitiveConductor K χ) :=
  ((primitiveConductor_dvd_iff K χ _).mp (primitiveConductor_dvd_self K χ)).choose

theorem primitive_toHeckeCharacter {𝔪 : GNF.Modulus K} (χ : Grossencharacter K 𝔪) :
    (primitive K χ).toHeckeCharacter = χ.toHeckeCharacter :=
  ((primitiveConductor_dvd_iff K χ _).mp (primitiveConductor_dvd_self K χ)).choose_spec

theorem primitiveConductor_congr {𝔪 𝔫 : GNF.Modulus K} (χ : Grossencharacter K 𝔪)
    (ψ : Grossencharacter K 𝔫) (h : χ.toHeckeCharacter = ψ.toHeckeCharacter) :
    primitiveConductor K χ = primitiveConductor K ψ := sorry

open scoped Classical in
/-- Every presentation is the primitive series times the Euler factors at the primes dividing the
presentation modulus but not the conductor, `∏ (1 - χ_u(𝔭) N𝔭^(shift - s))` with the primitive
weight; on the half-plane and as germs, since the trivial weight has a pole. -/
theorem lFunctionC_eq_primitive {𝔪 : GNF.Modulus K} (χ : Grossencharacter K 𝔪) :
    (∀ s : ℂ, 1 + χ.shift < s.re →
        lFunctionC K χ s = lFunctionC K (primitive K χ) s *
          ∏ 𝔭 ∈ 𝔪.support \ (primitiveConductor K χ).support,
            (1 - (primitive K χ).unitaryWeight 𝔭.asIdeal *
              (Ideal.absNorm 𝔭.asIdeal : ℂ) ^ ((χ.shift : ℂ) - s))) ∧
      (∀ s : ℂ, lFunctionC K χ =ᶠ[𝓝[≠] s]
        fun z ↦ lFunctionC K (primitive K χ) z *
          ∏ 𝔭 ∈ 𝔪.support \ (primitiveConductor K χ).support,
            (1 - (primitive K χ).unitaryWeight 𝔭.asIdeal *
              (Ideal.absNorm 𝔭.asIdeal : ℂ) ^ ((χ.shift : ℂ) - z))) := sorry

noncomputable def rootNumber {𝔪 : GNF.Modulus K} (χ : Grossencharacter K 𝔪) : ℂ := sorry

theorem norm_rootNumber {𝔪 : GNF.Modulus K} (χ : Grossencharacter K 𝔪) :
    ‖rootNumber K χ‖ = 1 := sorry

/-- The completed L-function of the unitary part `χ_u = χ N^(-shift)`, at the conductor: the
completed function of the analytic card `grossencharacterData`. -/
noncomputable def unitaryCompletion
    {𝔪 : GNF.Modulus K} (χ : Grossencharacter K 𝔪) : ℂ → ℂ := sorry

/-- The full completion, defined by recentering: `Λ(χ, s) = Λ(χ_u, s - shift)`. -/
noncomputable def completed
    {𝔪 : GNF.Modulus K} (χ : Grossencharacter K 𝔪) : ℂ → ℂ := sorry

theorem completed_recenter
    {𝔪 : GNF.Modulus K} (χ : Grossencharacter K 𝔪) (s : ℂ) :
    completed K χ s = unitaryCompletion K χ (s - (χ.shift : ℂ)) := sorry

/-- The completion, like the conductor, is a function of the Hecke character alone: it does not
see the presentation modulus. `lFunctionC` does, by `lFunctionC_eq_primitive`. -/
theorem unitaryCompletion_congr {𝔪 𝔫 : GNF.Modulus K} (χ : Grossencharacter K 𝔪)
    (ψ : Grossencharacter K 𝔫) (h : χ.toHeckeCharacter = ψ.toHeckeCharacter) :
    unitaryCompletion K χ = unitaryCompletion K ψ := sorry

theorem rootNumber_congr {𝔪 𝔫 : GNF.Modulus K} (χ : Grossencharacter K 𝔪)
    (ψ : Grossencharacter K 𝔫) (h : χ.toHeckeCharacter = ψ.toHeckeCharacter) :
    rootNumber K χ = rootNumber K ψ := sorry

/-- The inverse presentation, at the same modulus, by its fields: the inverse Hecke character,
the conjugate unitary weight, and the negated infinity type. With `χ = χ_u N^σ` this is
`conj(χ_u) N^(-σ)`, so its shift is `-σ` (`inverse_shift`); it is not the conjugate presentation
`conj(χ_u) N^σ`, and the functional equation reflects against it. -/
noncomputable def inverse
    {𝔪 : GNF.Modulus K} (χ : Grossencharacter K 𝔪) : Grossencharacter K 𝔪 where
  toHeckeCharacter := χ.toHeckeCharacter⁻¹
  unitaryWeight :=
    TauCetiRoadmap.ArithmeticDirichletSeries.UnitaryIdealWeight.conj K χ.unitaryWeight
  infinityType := ⟨fun τ ↦ -χ.infinityType.exponent τ⟩
  eq_one_of_mem := sorry
  infinityType_eq := sorry
  realParity_eq := sorry
  unitaryWeight_eq_zero := sorry
  unitaryWeight_apply := sorry

theorem inverse_toHeckeCharacter {𝔪 : GNF.Modulus K} (χ : Grossencharacter K 𝔪) :
    (inverse K χ).toHeckeCharacter = χ.toHeckeCharacter⁻¹ := rfl

theorem inverse_shift {𝔪 : GNF.Modulus K} (χ : Grossencharacter K 𝔪) :
    (inverse K χ).shift = -χ.shift := sorry

theorem inverse_inverse {𝔪 : GNF.Modulus K} (χ : Grossencharacter K 𝔪) :
    inverse K (inverse K χ) = χ := sorry

theorem rootNumber_inv
    {𝔪 : GNF.Modulus K} (χ : Grossencharacter K 𝔪) :
    rootNumber K (inverse K χ) = (rootNumber K χ)⁻¹ := sorry

/-- **The finite-order presentation of a ray-class character**, by its fields: the supplier's
`HeckeCharacter.ofRayClassCharacter`, the ray-class weight of Layer 5, and the zero infinity
type. -/
noncomputable def ofRayClassCharacter
    {𝔪 : GNF.Modulus K} (η : GNF.RayClassCharacter 𝔪) : Grossencharacter K 𝔪 where
  toHeckeCharacter := GNF.HeckeCharacter.ofRayClassCharacter η
  unitaryWeight := rayClassIdealWeight K 𝔪 η
  infinityType := ⟨fun _ ↦ 0⟩
  eq_one_of_mem := sorry
  infinityType_eq := sorry
  realParity_eq := sorry
  unitaryWeight_eq_zero := fun _ hI ↦ rayClassIdealWeight_eq_zero K 𝔪 η hI
  unitaryWeight_apply := sorry

theorem ofRayClassCharacter_toHeckeCharacter
    {𝔪 : GNF.Modulus K} (η : GNF.RayClassCharacter 𝔪) :
    (ofRayClassCharacter K η).toHeckeCharacter = GNF.HeckeCharacter.ofRayClassCharacter η := rfl

theorem ofRayClassCharacter_unitaryWeight
    {𝔪 : GNF.Modulus K} (η : GNF.RayClassCharacter 𝔪) :
    (ofRayClassCharacter K η).unitaryWeight = rayClassIdealWeight K 𝔪 η := rfl

/-- Closed by the supplier's `HeckeCharacter.shift_ofRayClassCharacter`. -/
theorem ofRayClassCharacter_shift
    {𝔪 : GNF.Modulus K} (η : GNF.RayClassCharacter 𝔪) :
    (ofRayClassCharacter K η).shift = 0 :=
  GNF.HeckeCharacter.shift_ofRayClassCharacter η

/-- **The finite presentation at the stated modulus.** A presentation of a finite-order Hecke
character at `𝔪` is the presentation of a ray-class character of `𝔪`: the finite pin makes the
character trivial on the finite congruence subgroup, and finite order together with
`realParity_eq` makes it trivial on the archimedean part of `IdeleCongruenceSubgroup 𝔪`, so it
factors through `rayClassQuotient 𝔪`. ⚠ Only in this case: an infinite-order character has no
ray-class presentation at any modulus — the angular characters of `ℚ(i)` below are unramified
and nontrivial, while the only ray-class character of the trivial modulus of `ℚ(i)` is trivial. -/
theorem exists_rayClassCharacter_of_isFiniteOrder {𝔪 : GNF.Modulus K}
    (χ : Grossencharacter K 𝔪) (h : χ.toHeckeCharacter.IsFiniteOrder) :
    ∃ η : GNF.RayClassCharacter 𝔪,
      GNF.HeckeCharacter.ofRayClassCharacter η = χ.toHeckeCharacter := sorry

/-- The weight of a finite-order presentation is the ray-class weight of the ray-class character
presenting it: the two pins of `unitaryWeight`, the supplier's `ofRayClassCharacter_apply`, and
`rayClassIdealWeight_apply`. -/
theorem unitaryWeight_eq_rayClassIdealWeight {𝔪 : GNF.Modulus K} (χ : Grossencharacter K 𝔪)
    (η : GNF.RayClassCharacter 𝔪)
    (h : χ.toHeckeCharacter = GNF.HeckeCharacter.ofRayClassCharacter η) :
    χ.unitaryWeight = rayClassIdealWeight K 𝔪 η := sorry

/-- A finite-order character has zero exponents and zero angular frequency (the supplier's
`exists_finiteOrderInfinityType`), so `infinityType_eq` forces the zero infinity type. -/
theorem infinityType_eq_zero_of_isFiniteOrder {𝔪 : GNF.Modulus K}
    (χ : Grossencharacter K 𝔪) (h : χ.toHeckeCharacter.IsFiniteOrder) :
    χ.infinityType = ⟨fun _ ↦ 0⟩ := sorry

/-- Closed by the supplier's `isFiniteOrder_iff_exists_rayClassCharacter` and
`shift_ofRayClassCharacter`. -/
theorem shift_eq_zero_of_isFiniteOrder {𝔪 : GNF.Modulus K}
    (χ : Grossencharacter K 𝔪) (h : χ.toHeckeCharacter.IsFiniteOrder) : χ.shift = 0 := by
  obtain ⟨𝔫, η, hη⟩ :=
    (GNF.HeckeCharacter.isFiniteOrder_iff_exists_rayClassCharacter χ.toHeckeCharacter).mp h
  rw [shift, ← hη]
  exact GNF.HeckeCharacter.shift_ofRayClassCharacter η

/-- The finite-order presentation has the ray-class L-function of Layer 5, on the half-plane and
as germs. -/
theorem lFunctionC_ofRayClassCharacter {𝔪 : GNF.Modulus K} (η : GNF.RayClassCharacter 𝔪) :
    (∀ s : ℂ, 1 < s.re → lFunctionC K (ofRayClassCharacter K η) s = heckeLFunctionC K η s) ∧
      ∀ s : ℂ, lFunctionC K (ofRayClassCharacter K η) =ᶠ[𝓝[≠] s] heckeLFunctionC K η := sorry

/-- **The sign of the shift.** At a prime idele at `v ∤ 𝔪₀` the primary object is the unitary
weight times the ideal norm to the shift: `χ(π_v) = χ_u(𝔭) N𝔭^shift`. This is the ideal-side
convention `χ = χ_u N^shift` of `lFunctionC_eq` and `completed_recenter`, read at one prime.
⚠ The supplier pins `shift` only through `shift_eq_zero_iff` and `norm_unitaryPart`. Since the
idele norm of a prime idele is `‖π_v‖ = N𝔭⁻¹`, this equation says that `|χ(y)| = ‖y‖^(-shift)`
idelically — Tate's exponent is `-shift` — and it is the one equation this roadmap needs the
supplier to state (`‖χ y‖ = ‖y‖^(-χ.shift)`, recorded in the dependency table). Everything below
that mentions the shift — the unit relation, the recentering, the inverse presentation and the
angular characters — is stated in this convention. -/
theorem toHeckeCharacter_primeIdele {𝔪 : GNF.Modulus K} (χ : Grossencharacter K 𝔪)
    (v : HeightOneSpectrum (𝓞 K)) (hv : ¬ v.asIdeal ∣ 𝔪.finitePart) (y : GNF.IdeleGroup K)
    (h₁ : Valued.v ((GNF.ideleFiniteCoord v y : (v.adicCompletion K)ˣ) : v.adicCompletion K) =
      ((Multiplicative.ofAdd (-1 : ℤ) : Multiplicative ℤ) : WithZero (Multiplicative ℤ)))
    (h₂ : ∀ v' : HeightOneSpectrum (𝓞 K), v' ≠ v → GNF.ideleFiniteCoord v' y = 1)
    (h₃ : ∀ w : InfinitePlace K, GNF.ideleInfiniteCoord w y = 1) :
    ((χ.toHeckeCharacter (QuotientGroup.mk y) : ℂˣ) : ℂ) =
      χ.unitaryWeight v.asIdeal * (Ideal.absNorm v.asIdeal : ℂ) ^ (χ.shift : ℂ) := sorry

/-- **Hecke's unit relation**, derived from the primary object rather than taken as a field, and
with the sign the primary object forces. On a principal ideal generated by `a ≡ 1 mod* 𝔪` — the
supplier's `IsCongrOne`, positivity at the real places of `𝔪` included — the full weight
`χ_u((a)) N(a)^shift` is the **inverse** of the archimedean value `∏_τ τ(a)^(n_τ)`: the principal
idele of `a` is trivial for `toHeckeCharacter`; its finite coordinates evaluate, by
`toHeckeCharacter_primeIdele` at the primes dividing `(a)` and `eq_one_of_mem` at the units, to
`χ_u((a)) N(a)^shift`; its archimedean coordinates evaluate, by `infinityType_eq` and
`realParity_eq` (with `a > 0` at the real places of `𝔪`), to `∏_τ τ(a)^(n_τ)`; and the product
of the two is `1`. This is Neukirch VII (6.13): the archimedean component of the idele class
character is `b ↦ b⁻¹` against Hecke's `χ_∞`, so Hecke's classical infinity type is `-n`, and his
`χ((a)) = χ_f(a) χ_∞(a)` of (6.1) reads `χ_u((a)) N(a)^shift = ∏_τ τ(a)^(-n_τ)` on
`a ≡ 1 mod* 𝔪`. ⚠ The law with `∏_τ τ(a)^(n_τ)` on the right-hand side is false for every
nonreal angular character, already at shift zero: `angularGrossencharacter_compatibility_test`.
⚠ For `a` not congruent to `1` the two sides differ by the finite character `finiteCharacter`,
which this relation determines; quantifying over all `a` would leave only the unramified
characters. -/
theorem compatibility {𝔪 : GNF.Modulus K} (χ : Grossencharacter K 𝔪) (x : Kˣ)
    (hx : GNF.IsCongrOne 𝔪 x) (a : 𝓞 K) (ha : algebraMap (𝓞 K) K a = x) :
    χ.unitaryWeight (Ideal.span {a}) *
        ((Ideal.absNorm (Ideal.span {a}) : ℕ) : ℂ) ^ (χ.shift : ℂ) *
      ∏ τ : K →+* ℂ, τ (x : K) ^ χ.infinityType.exponent τ = 1 := sorry

/-- The unit relation solved for the finite value: `χ_u((a)) N(a)^shift = (∏_τ τ(a)^(n_τ))⁻¹`. -/
theorem compatibility_inv {𝔪 : GNF.Modulus K} (χ : Grossencharacter K 𝔪) (x : Kˣ)
    (hx : GNF.IsCongrOne 𝔪 x) (a : 𝓞 K) (ha : algebraMap (𝓞 K) K a = x) :
    χ.unitaryWeight (Ideal.span {a}) *
        ((Ideal.absNorm (Ideal.span {a}) : ℕ) : ℂ) ^ (χ.shift : ℂ) =
      (∏ τ : K →+* ℂ, τ (x : K) ^ χ.infinityType.exponent τ)⁻¹ :=
  eq_inv_of_mul_eq_one_left (compatibility K χ x hx a ha)

end Grossencharacter

/-- **The analytic card of a Grossencharacter** is the card of its unitary part, built from the
primitive presentation: coefficients the norm-regrouped primitive unitary weight, conductor
`|d_K| N(𝔣₀)`, real gamma shifts the parities `ε_w` of the archimedean restriction of the unitary
part, complex gamma shifts `|n_σ - n_σ̄| / 2`, root number `rootNumber`, completed function
`unitaryCompletion`. It is a function of the Hecke character alone (`grossencharacterData_congr`)
and its functional equation is centered at `1/2`: the dual card is the conjugate, which is the
inverse of a unitary character. ⚠ The full completion `completed χ s = unitaryCompletion χ
(s - shift)` is not the completed function of an analytic card when the shift is nonzero — its
equation is centered at `1/2 + shift` and reflects against the inverse, whose shift is `-shift`,
not against the conjugate — so the polar divisor that restricts `completed_one_sub` is read off
this card at `s - shift`. -/
noncomputable def grossencharacterData
    {𝔪 : GNF.Modulus K} (χ : Grossencharacter K 𝔪) : AnalyticLFunctionData := sorry

theorem grossencharacterData_completed
    {𝔪 : GNF.Modulus K} (χ : Grossencharacter K 𝔪) :
    (grossencharacterData K χ).completed = Grossencharacter.unitaryCompletion K χ := sorry

theorem grossencharacterData_coeff
    {𝔪 : GNF.Modulus K} (χ : Grossencharacter K 𝔪) (n : ℕ) (hn : n ≠ 0) :
    (grossencharacterData K χ).coeff n =
      ADS.normCoeff K
        (TauCetiRoadmap.ArithmeticDirichletSeries.UnitaryIdealWeight.toArithmeticFunction K
          (Grossencharacter.primitive K χ).unitaryWeight) n := sorry

theorem grossencharacterData_conductor
    {𝔪 : GNF.Modulus K} (χ : Grossencharacter K 𝔪) :
    ((grossencharacterData K χ).conductor : ℕ) =
      (discr K).natAbs *
        Ideal.absNorm (Grossencharacter.primitiveConductor K χ).finitePart := sorry

open scoped Classical in
/-- One real gamma shift per real place: the parity of the unitary part there, which is the
parity of the archimedean restriction of `toHeckeCharacter` — ⚠ not the parity of the algebraic
exponent, which the norm powers `N^m` with `m` odd already distinguish. -/
theorem grossencharacterData_gammaR
    {𝔪 : GNF.Modulus K} (χ : Grossencharacter K 𝔪) :
    (grossencharacterData K χ).gammaR =
      (Finset.univ : Finset {w : InfinitePlace K // w.IsReal}).val.map
        fun w ↦ ((χ.toHeckeCharacter.infinityType.realParity w).val : ℂ) := sorry

open scoped Classical in
/-- One complex gamma shift per complex place: half the absolute angular frequency
`|n_σ - n_σ̄|` of the infinity type there. -/
theorem grossencharacterData_gammaC
    {𝔪 : GNF.Modulus K} (χ : Grossencharacter K 𝔪) :
    (grossencharacterData K χ).gammaC =
      (Finset.univ : Finset {w : InfinitePlace K // w.IsComplex}).val.map
        fun w ↦ ((|χ.infinityType.toContinuous.complexAngular w| : ℤ) : ℂ) / 2 := sorry

theorem grossencharacterData_rootNumber
    {𝔪 : GNF.Modulus K} (χ : Grossencharacter K 𝔪) :
    (grossencharacterData K χ).rootNumber = Grossencharacter.rootNumber K χ := sorry

theorem grossencharacterData_congr {𝔪 𝔫 : GNF.Modulus K} (χ : Grossencharacter K 𝔪)
    (ψ : Grossencharacter K 𝔫) (h : χ.toHeckeCharacter = ψ.toHeckeCharacter) :
    grossencharacterData K χ = grossencharacterData K ψ := sorry

theorem degree_grossencharacterData
    {𝔪 : GNF.Modulus K} (χ : Grossencharacter K 𝔪) :
    (grossencharacterData K χ).degree = Module.finrank ℚ K := sorry

theorem grossencharacterData_hasDirichletAgreement
    {𝔪 : GNF.Modulus K} (χ : Grossencharacter K 𝔪) :
    (grossencharacterData K χ).HasDirichletAgreement := sorry

theorem grossencharacterData_hasContinuation
    {𝔪 : GNF.Modulus K} (χ : Grossencharacter K 𝔪) :
    (grossencharacterData K χ).HasMeromorphicContinuation := sorry

theorem grossencharacterData_hasFunctionalEquation
    {𝔪 : GNF.Modulus K} (χ : Grossencharacter K 𝔪) :
    (grossencharacterData K χ).HasFunctionalEquation := sorry

/-- ⚠ The integral norm powers `N^m` show why the hypotheses are needed: `completed (N^m) s` is
`Λ_K(s - m)`, with poles at `m` and `1 + m`, so the values on the two sides are junk there. The
pointwise equation carries the polar divisors of the two analytic cards, read at `s - shift`
because the cards are those of the unitary parts; the germ equality below carries none. -/
theorem Grossencharacter.completed_one_sub
    {𝔪 : GNF.Modulus K} (χ : Grossencharacter K 𝔪) (s : ℂ)
    (hs : (grossencharacterData K χ).polarOrder (s - (χ.shift : ℂ)) = 0)
    (hs' : (grossencharacterData K (Grossencharacter.inverse K χ)).polarOrder
      (1 - (s - (χ.shift : ℂ))) = 0) :
    Grossencharacter.completed K χ s = Grossencharacter.rootNumber K χ *
      Grossencharacter.completed K (Grossencharacter.inverse K χ) (1 - s) := sorry

theorem Grossencharacter.completed_one_sub_eventuallyEq
    {𝔪 : GNF.Modulus K} (χ : Grossencharacter K 𝔪) (s : ℂ) :
    Grossencharacter.completed K χ =ᶠ[𝓝[≠] s]
      fun z ↦ Grossencharacter.rootNumber K χ *
        Grossencharacter.completed K (Grossencharacter.inverse K χ) (1 - z) := sorry

/-! ### The theta kernel of a Grossencharacter

Neukirch VII (6.1)–(6.4), (7.4)–(7.8) and (8.2)–(8.5), in this roadmap's normalization: the
unitary completion of a Grossencharacter is the Mellin transform of a theta series twisted by
Hecke's finite character and by a harmonic polynomial, averaged over a fundamental domain for
the units. The finite character is derived from the primary object; the polynomial and the
parameter shift are read off the infinity type with the sign fixed by `compatibility`. -/

namespace Grossencharacter

open scoped Classical

/-- **The full archimedean value** of the primary object at `x ∈ K`: the algebraic part
`∏_τ τ(x)^(n_τ)` times, at each real place, the sign `sgn(τ_w x)^(ε_w - n_w)` by which the actual
parity `ε_w` of the archimedean restriction differs from the parity of the algebraic exponent. By
`realParity_eq` that correction is trivial outside `𝔪∞`; at the real places of `𝔪` it is the
presented sign twist. ⚠ The algebraic infinity type alone misses it: the odd character mod `4∞`
of `ℚ` has exponent `0` and parity `1`, so its archimedean value at `-1` is `-1`, not `1`
(`oddCharacter_mod_four_sign_test`). -/
noncomputable def archimedeanValue {𝔪 : GNF.Modulus K} (χ : Grossencharacter K 𝔪) (x : K) : ℂ :=
  letI : Fintype {w : InfinitePlace K // w.IsReal} := Fintype.ofFinite _
  (∏ τ : K →+* ℂ, τ x ^ χ.infinityType.exponent τ) *
    ∏ w : {w : InfinitePlace K // w.IsReal},
      ((Real.sign (InfinitePlace.embedding_of_isReal w.2 x) : ℝ) : ℂ) ^
        (χ.toHeckeCharacter.infinityType.realParity w -
          (χ.infinityType.exponent w.1.embedding : ZMod 2)).val

/-- On `a ≡ 1 mod* 𝔪` the full archimedean value is the algebraic one: `a > 0` at the real places
of `𝔪`, and the parities agree outside them. -/
theorem archimedeanValue_eq_of_isCongrOne {𝔪 : GNF.Modulus K} (χ : Grossencharacter K 𝔪)
    (x : Kˣ) (hx : GNF.IsCongrOne 𝔪 x) :
    archimedeanValue K χ x = ∏ τ : K →+* ℂ, τ (x : K) ^ χ.infinityType.exponent τ := sorry

/-- **Hecke's finite character, derived from the primary object** rather than stored: for
`a ∈ 𝓞_K`, `χ_f(a) := χ_u((a)) N(a)^shift · χ_∞(a)` with `χ_∞` the **full** archimedean value —
signs at the real places included. It is `1` on `a ≡ 1 mod* 𝔪` by `compatibility`
(`finiteCharacter_eq_one_of_isCongrOne`); it is multiplicative, it vanishes exactly off the
elements prime to `𝔪₀`, and it factors through the residue units `(𝓞/𝔪₀)ˣ`
(`finiteCharacter_residue`) — no sign data survives, because the signs are exactly what
`archimedeanValue` strips off. This is Neukirch's `χ_f = χ((a)) χ_∞(a)⁻¹` of VII (6.1), whose
modulus is a finite ideal and whose `χ_∞` is the whole archimedean character; it is the residue
character that the Gauss sum `gaussSum` and the twisted theta series evaluate, and it is the
finite character of the unitary part. ⚠ Built from the algebraic exponents alone it would be even
at `-1` for every finite-order character, and the theta series of an odd character would vanish
by pairing `a` with `-a`. -/
noncomputable def finiteCharacter {𝔪 : GNF.Modulus K} (χ : Grossencharacter K 𝔪) (a : 𝓞 K) :
    ℂ :=
  χ.unitaryWeight (Ideal.span {a}) * ((Ideal.absNorm (Ideal.span {a}) : ℕ) : ℂ) ^ (χ.shift : ℂ) *
    archimedeanValue K χ (algebraMap (𝓞 K) K a)

/-- `compatibility`, restated: the finite character is trivial on `a ≡ 1 mod* 𝔪`. -/
theorem finiteCharacter_eq_one_of_isCongrOne {𝔪 : GNF.Modulus K} (χ : Grossencharacter K 𝔪)
    (x : Kˣ) (hx : GNF.IsCongrOne 𝔪 x) (a : 𝓞 K) (ha : algebraMap (𝓞 K) K a = x) :
    finiteCharacter K χ a = 1 := by
  unfold finiteCharacter
  rw [ha, archimedeanValue_eq_of_isCongrOne K χ x hx]
  exact compatibility K χ x hx a ha

theorem finiteCharacter_mul {𝔪 : GNF.Modulus K} (χ : Grossencharacter K 𝔪) (a b : 𝓞 K) :
    finiteCharacter K χ (a * b) = finiteCharacter K χ a * finiteCharacter K χ b := sorry

theorem finiteCharacter_eq_zero_iff {𝔪 : GNF.Modulus K} (χ : Grossencharacter K 𝔪) (a : 𝓞 K) :
    finiteCharacter K χ a = 0 ↔ ¬ 𝔪.IsCoprimeTo (Ideal.span {a}) := sorry

/-- **The finite character is a character of the residue units `(𝓞/𝔪₀)ˣ`**: two integers
congruent modulo the finite part of the modulus — no condition on signs — have the same value.
The signs at `𝔪∞` are removed by `archimedeanValue`: two integers `a`, `b` with `a = x b`,
`x ≡ 1 mod 𝔪₀` at the finite places only, differ at the finite idele coordinates by a principal
unit at each `v ∣ 𝔪₀`, on which the presented character is trivial, so the finite values
`χ(a_f)`, `χ(b_f)` agree; and `χ(a_f) = χ_f(a)⁻¹` by the principal-idele relation. This is what
lets `gaussSum` evaluate `χ_f` at any representative of a residue class. -/
theorem finiteCharacter_residue {𝔪 : GNF.Modulus K} (χ : Grossencharacter K 𝔪) (a b : 𝓞 K)
    (h : Ideal.Quotient.mk 𝔪.finitePart a = Ideal.Quotient.mk 𝔪.finitePart b) :
    finiteCharacter K χ a = finiteCharacter K χ b := sorry

/-- On a unit the finite character is the full archimedean value, since `(u) = 𝓞_K` and
`N(u) = 1`: Neukirch's `χ_f(ε) χ_∞(ε) = 1`, the input of (8.2). ⚠ With signs: at `u = -1` for the
odd character mod `4∞` this is `-1`. -/
theorem finiteCharacter_unit {𝔪 : GNF.Modulus K} (χ : Grossencharacter K 𝔪) (u : (𝓞 K)ˣ) :
    finiteCharacter K χ u = archimedeanValue K χ (algebraMap (𝓞 K) K u) := sorry

/-- The finite character extends uniquely and multiplicatively from the integers prime to `𝔪₀`
to the fractions prime to `𝔪₀` — Neukirch's `K^(𝔪)` (VII §6, p. 471), the supplier's
`primeToSubgroup 𝔪` — and by zero to the rest of `Kˣ`. -/
theorem existsUnique_finiteCharacterK {𝔪 : GNF.Modulus K} (χ : Grossencharacter K 𝔪) :
    ∃! f : Kˣ → ℂ,
      (∀ x y : Kˣ, x ∈ GNF.primeToSubgroup 𝔪 → y ∈ GNF.primeToSubgroup 𝔪 →
        f (x * y) = f x * f y) ∧
      (∀ x : Kˣ, x ∉ GNF.primeToSubgroup 𝔪 → f x = 0) ∧
      ∀ (a : 𝓞 K) (x : Kˣ), algebraMap (𝓞 K) K a = x → f x = finiteCharacter K χ a := sorry

noncomputable def finiteCharacterK {𝔪 : GNF.Modulus K} (χ : Grossencharacter K 𝔪) : Kˣ → ℂ :=
  (existsUnique_finiteCharacterK K χ).exists.choose

theorem finiteCharacterK_spec {𝔪 : GNF.Modulus K} (χ : Grossencharacter K 𝔪) :
    (∀ x y : Kˣ, x ∈ GNF.primeToSubgroup 𝔪 → y ∈ GNF.primeToSubgroup 𝔪 →
        finiteCharacterK K χ (x * y) = finiteCharacterK K χ x * finiteCharacterK K χ y) ∧
      (∀ x : Kˣ, x ∉ GNF.primeToSubgroup 𝔪 → finiteCharacterK K χ x = 0) ∧
      ∀ (a : 𝓞 K) (x : Kˣ), algebraMap (𝓞 K) K a = x →
        finiteCharacterK K χ x = finiteCharacter K χ a :=
  (existsUnique_finiteCharacterK K χ).exists.choose_spec

/-- The finite character on `K`, with the value `0` at `0`: the coefficient of the theta series. -/
noncomputable def finiteCharacterK' {𝔪 : GNF.Modulus K} (χ : Grossencharacter K 𝔪) (x : K) :
    ℂ :=
  if h : x = 0 then 0 else finiteCharacterK K χ (Units.mk0 x h)

/-- The exponent `P_w` of `|x_w|` carried by the harmonic polynomial at the place `w`: the
parity of the archimedean restriction at a real place, the absolute angular frequency
`|n_τ - n_τ̄|` at a complex place. -/
noncomputable def harmonicExponent {𝔪 : GNF.Modulus K} (χ : Grossencharacter K 𝔪)
    (w : InfinitePlace K) : ℕ :=
  if h : w.IsReal then (χ.toHeckeCharacter.infinityType.realParity ⟨w, h⟩).val
  else (χ.infinityType.toContinuous.complexAngular ⟨w, not_isReal_iff_isComplex.mp h⟩).natAbs

/-- Neukirch's `Tr(p)`, the total degree of the harmonic polynomial: the number of odd real
places plus `∑_{complex} |n_τ - n_τ̄|`. It is the amount by which the Mellin variable is shifted
in `unitaryCompletion_eq_mellin`, and it is invariant under `inverse`. -/
noncomputable def harmonicDegree {𝔪 : GNF.Modulus K} (χ : Grossencharacter K 𝔪) : ℕ :=
  ∑ w : InfinitePlace K, harmonicExponent K χ w

theorem harmonicDegree_inverse {𝔪 : GNF.Modulus K} (χ : Grossencharacter K 𝔪) :
    harmonicDegree K (inverse K χ) = harmonicDegree K χ := sorry

/-- **The harmonic polynomial of the theta kernel**, Neukirch's `N(a^p)` (VII §7, p. 489) for the
admissible exponent `p` determined by the infinity type of the unitary part: the ideal-side
unitary archimedean value `∏_τ (τ(a)/|τ(a)|)^(-n_τ)` cleared of its denominators. At a real place
it is `x^(ε_w)`, `ε_w` the parity of the archimedean restriction; at a complex place with angular
frequency `k_w = n_τ - n_τ̄` it is `conj(z)^(k_w)` for `k_w ≥ 0` and `z^(-k_w)` for `k_w < 0`.
⚠ The sign follows `compatibility`: the ideal-side value is the inverse of the idelic archimedean
value, so a positive angular frequency puts the *conjugate* coordinate into the polynomial. -/
noncomputable def harmonicFactor {𝔪 : GNF.Modulus K} (χ : Grossencharacter K 𝔪)
    (x : mixedEmbedding.mixedSpace K) : ℂ :=
  letI : Fintype {w : InfinitePlace K // w.IsReal} := Fintype.ofFinite _
  letI : Fintype {w : InfinitePlace K // w.IsComplex} := Fintype.ofFinite _
  (∏ w : {w : InfinitePlace K // w.IsReal},
      ((x.1 w : ℝ) : ℂ) ^ (χ.toHeckeCharacter.infinityType.realParity w).val) *
    ∏ w : {w : InfinitePlace K // w.IsComplex},
      if 0 ≤ χ.infinityType.toContinuous.complexAngular w then
        starRingEnd ℂ (x.2 w) ^ (χ.infinityType.toContinuous.complexAngular w).toNat
      else x.2 w ^ (-χ.infinityType.toContinuous.complexAngular w).toNat

/-- The polynomial is homogeneous under the unit action, and the finite character compensates:
`χ_f(u) N(u^p) = ∏_w |u_w|^(P_w)` for a unit `u`, by `finiteCharacter_unit`: the sign of
`u_w^(ε_w)` at a real place is cancelled by the sign in `archimedeanValue`. ⚠ At `u = -1` for the
odd character mod `4∞` both factors are `-1` (`oddCharacter_mod_four_sign_test`); with a finite
character built from the algebraic exponents alone this theorem would read `-1 = 1`. -/
theorem finiteCharacter_mul_harmonicFactor_unit {𝔪 : GNF.Modulus K} (χ : Grossencharacter K 𝔪)
    (u : (𝓞 K)ˣ) :
    finiteCharacter K χ u * harmonicFactor K χ (mixedEmbedding K (algebraMap (𝓞 K) K u)) =
      ((∏ w : InfinitePlace K,
        mixedEmbedding.normAtPlace w (mixedEmbedding K (algebraMap (𝓞 K) K u)) ^
          harmonicExponent K χ w : ℝ) : ℂ) := sorry

/-- **Hecke's lemma**, Neukirch VII (3.5)–(3.6) at `z = i y`: the harmonic polynomial times the
Gaussian is a Fourier eigenfunction up to the constant `(-i)^(Tr p)` and the weights
`y_w^(-P_w)`; in one real variable, `x^p e^{-π y x²} ↦ (-i)^p y^(-1/2 - p) ξ^p e^{-π ξ²/y}`, and a
complex coordinate contributes the holomorphic Hermite function `z^k e^{-π|z|²}` or its
conjugate. -/
theorem mixedFourier_harmonicFactor_mul_archGaussian {𝔪 : GNF.Modulus K}
    (χ : Grossencharacter K 𝔪) (y : ArchParam K) (hy : ∀ w, 0 < y w)
    (ξ : mixedEmbedding.mixedSpace K) :
    mixedFourier K (fun x ↦ harmonicFactor K χ x * archGaussian K y x) ξ =
      (-Complex.I) ^ harmonicDegree K χ * (((Real.sqrt (archNorm K y))⁻¹ : ℝ) : ℂ) *
        ((∏ w : InfinitePlace K, (y w)⁻¹ ^ harmonicExponent K χ w : ℝ) : ℂ) *
        harmonicFactor K χ ξ * archGaussian K (fun w ↦ (y w)⁻¹) ξ := sorry

/-- The archimedean weight `N(x^(p/2)) = ∏_w x_w^(P_w/2)` of Neukirch (8.2)–(8.3), the factor
that makes the twisted kernel unit-invariant and shifts the Mellin variable by `Tr(p)/n`. -/
noncomputable def archWeight {𝔪 : GNF.Modulus K} (χ : Grossencharacter K 𝔪) (y : ArchParam K) :
    ℝ :=
  ∏ w : InfinitePlace K, y w ^ ((harmonicExponent K χ w : ℝ) / 2)

/-- Neukirch's `ε(χ)`: the constant term of the twisted theta series, `1` exactly when the
conductor is trivial and the polynomial is constant, `0` otherwise. -/
noncomputable def heckeEpsilon {𝔪 : GNF.Modulus K} (χ : Grossencharacter K 𝔪) : ℂ :=
  if primitiveConductor K χ = GNF.Modulus.one K ∧ harmonicDegree K χ = 0 then 1 else 0

/-- **The twisted theta series**, Neukirch's `θ^p(𝔎, χ_f, z)` (VII §7, p. 489) at `z = i y`, over
the fractional ideal `𝔞`: `ε(χ) + ∑_{a ∈ 𝔞} χ_f(a) N(a^p) exp(-π ∑_w y_w |a_w|²)`, with the finite
character of the primitive presentation (the completion is at the conductor). For the trivial
character it is `latticeTheta` of `σ(𝔞)`. -/
noncomputable def heckeTheta {𝔪 : GNF.Modulus K} (χ : Grossencharacter K 𝔪)
    (I : (FractionalIdeal (𝓞 K)⁰ K)ˣ) (y : ArchParam K) : ℂ :=
  heckeEpsilon K χ +
    ∑' a : ((I : FractionalIdeal (𝓞 K)⁰ K) : Submodule (𝓞 K) K),
      finiteCharacterK' K (primitive K χ) (a : K) *
        harmonicFactor K χ (mixedEmbedding K (a : K)) *
        archGaussian K y (mixedEmbedding K (a : K))

/-- **Neukirch VII (8.2), unit invariance of the weighted kernel.** Reindexing by a unit `u`
multiplies the twisted theta series by `χ_f(u)⁻¹ N(u^p)⁻¹ = ∏_w |u_w|^(-P_w)`
(`finiteCharacter_mul_harmonicFactor_unit`), which is exactly what the archimedean weight gains
under `unitScale u`. -/
theorem archWeight_mul_heckeTheta_unitScale {𝔪 : GNF.Modulus K} (χ : Grossencharacter K 𝔪)
    (I : (FractionalIdeal (𝓞 K)⁰ K)ˣ) (u : (𝓞 K)ˣ) (y : ArchParam K) (hy : ∀ w, 0 < y w) :
    (archWeight K χ (unitScale K u y) : ℂ) * heckeTheta K χ I (unitScale K u y) =
      (archWeight K χ y : ℂ) * heckeTheta K χ I y := sorry

/-- The rescaling `λ_𝔞 = V_𝔞² N(𝔣₀)` of the parameter in the twisted kernel: the covolume of
`σ(𝔞)` squared times the norm of the finite conductor, which produces the conductor power
`(|d_K| N(𝔣₀))^(s/2)` of the completion. -/
noncomputable def heckeScale {𝔪 : GNF.Modulus K} (χ : Grossencharacter K 𝔪)
    (I : (FractionalIdeal (𝓞 K)⁰ K)ˣ) : ℝ :=
  ZLattice.covolume (mixedEmbedding.idealLattice K I) ^ 2 *
    Ideal.absNorm (primitiveConductor K χ).finitePart

open scoped Classical in
/-- **Neukirch VII (8.3), the Mellin kernel of a Grossencharacter** for the fractional ideal `𝔞`
and the fundamental domain `D`:
`(2^r₂ / w) · 2^(-∑_{complex} P_w / 2) · λ_𝔞^(-Tr p / 2n) ∫_D N(x^(p/2)) θ_χ(𝔞, x (u/λ_𝔞)^(1/n))
d*x`.
The three constants come from the gamma integral of the weighted Gaussian: at a complex place
`∫ e^{-π y |z|²} y^(2s + P/2) dy/y = π^(-(2s + P/2)) Γ(2s + P/2) |z|^(-4s - P)` is
`2^(2s + P/2 - 1) Γ_ℂ(2s + P/2) |z|^(-4s - P)`, whose `2^(2s)` and `2^(-1)` are the `V_𝔞²` and the
`2^r₂` of `mellinKernel`, and whose `2^(P/2)` is new; the polynomial weight `N(x^(p/2))` scales by
`λ^(Tr p / 2n)` under `u ↦ u/λ`. The `|z|^(-P)` cancels the `|a_w|^(P_w)` of
`χ_f(a) N(a^p) = χ_u((a)) ∏_w |a_w|^(P_w)`, which is why the gamma shifts of the card are
`ε_w` and `|k_w|/2` (`grossencharacterData_gammaR`, `_gammaC`). -/
noncomputable def heckeMellinKernel {𝔪 : GNF.Modulus K} (D : Set (ArchParam K))
    (χ : Grossencharacter K 𝔪) (I : (FractionalIdeal (𝓞 K)⁰ K)ˣ) (u : ℝ) : ℂ :=
  ((2 : ℂ) ^ nrComplexPlaces K / (NumberField.Units.torsionOrder K : ℂ)) *
    (2 : ℂ) ^ (-((∑ w : {w : InfinitePlace K // w.IsComplex},
      (harmonicExponent K χ w : ℂ)) / 2)) *
    ((heckeScale K χ I ^ (-(harmonicDegree K χ : ℝ) / (2 * Module.finrank ℚ K)) : ℝ) : ℂ) *
    ∫ x in (Subtype.val ⁻¹' D : Set (normOneSurface K)),
      (archWeight K χ (x : ArchParam K) : ℂ) *
        heckeTheta K χ I (surfaceScale K (x : ArchParam K) (u / heckeScale K χ I))
        ∂(surfaceHaar K)

/-- The kernel of the trivial character is the Dedekind kernel. -/
theorem heckeMellinKernel_one {D : Set (ArchParam K)}
    (χ : Grossencharacter K (GNF.Modulus.one K)) (hχ : χ.toHeckeCharacter = 1)
    (I : (FractionalIdeal (𝓞 K)⁰ K)ˣ) (u : ℝ) :
    heckeMellinKernel K D χ I u = mellinKernel K D (mixedEmbedding.idealLattice K I) u := sorry

/-- The per-class completed unitary L-function, Neukirch's `Λ(𝔎, χ, s)` (VII §8, p. 497) for the
unitary part at the conductor: `(|d_K| N𝔣₀)^(s/2) γ(s) ∑_{𝔟 𝔞 principal} χ_u(𝔟) N𝔟^(-s)`, with
`γ` the gamma factor of `grossencharacterData`. -/
noncomputable def unitaryPartialCompletion {𝔪 : GNF.Modulus K} (χ : Grossencharacter K 𝔪)
    (𝔞 : Ideal (𝓞 K)) (s : ℂ) : ℂ := sorry

theorem unitaryPartialCompletion_eq_tsum {𝔪 : GNF.Modulus K} (χ : Grossencharacter K 𝔪)
    (𝔞 : Ideal (𝓞 K)) (h𝔞 : (primitiveConductor K χ).IsCoprimeTo 𝔞) {s : ℂ} (hs : 1 < s.re) :
    unitaryPartialCompletion K χ 𝔞 s =
      ((grossencharacterData K χ).conductor : ℂ) ^ (s / 2) *
        (grossencharacterData K χ).gammaFactor s *
        ∑' 𝔟 : {𝔟 : Ideal (𝓞 K) // 𝔟 ≠ ⊥ ∧ ∃ x : Kˣ,
            (𝔟 : FractionalIdeal (𝓞 K)⁰ K) * (𝔞 : FractionalIdeal (𝓞 K)⁰ K) =
              FractionalIdeal.spanSingleton (𝓞 K)⁰ (x : K)},
          (primitive K χ).unitaryWeight 𝔟 * (Ideal.absNorm (𝔟 : Ideal (𝓞 K)) : ℂ) ^ (-s) := sorry

/-- The unitary completion is the sum of the per-class completions over a system of
representatives prime to the conductor. -/
theorem unitaryCompletion_eq_sum {𝔪 : GNF.Modulus K} (χ : Grossencharacter K 𝔪)
    (rep : ClassGroup (𝓞 K) → Ideal (𝓞 K))
    (hrep : IsClassRepresentatives K (primitiveConductor K χ) rep) {s : ℂ} (hs : 1 < s.re) :
    unitaryCompletion K χ s = ∑ c : ClassGroup (𝓞 K), unitaryPartialCompletion K χ (rep c) s :=
  sorry

/-- **Neukirch (8.3), the per-class Mellin identity**: for `Re s > 1`,
`Λ(𝔎, χ_u, s) = χ_u(𝔞)⁻¹ ∫_0^∞ (f_D(χ, 𝔞, u) - ε(χ) a₀) u^((s + Tr p / n)/2) du/u`, the class of
`𝔞` entering through `χ_u((a)) = χ_u(a 𝔞⁻¹) χ_u(𝔞)`; the Mellin variable is shifted by `Tr(p)/n`
because the weight `N(y^(p/2))` is `N(x^(p/2)) t^(Tr p / 2n)` in the coordinates of
`surfaceScale`. -/
theorem unitaryPartialCompletion_eq_mellin {𝔪 : GNF.Modulus K} {D : Set (ArchParam K)}
    (hD : IsUnitFundamentalDomain K D) (χ : Grossencharacter K 𝔪) (𝔞 : Ideal (𝓞 K))
    (h𝔞 : (primitiveConductor K χ).IsCoprimeTo 𝔞) {s : ℂ} (hs : 1 < s.re) :
    unitaryPartialCompletion K χ 𝔞 s =
      ((primitive K χ).unitaryWeight 𝔞)⁻¹ *
        ∫ u in Set.Ioi (0 : ℝ),
          (heckeMellinKernel K D χ (idealUnit K 𝔞 h𝔞.1) u -
              heckeEpsilon K χ * (mellinConstant K : ℂ)) *
            (u : ℂ) ^ ((s + (harmonicDegree K χ : ℂ) / (Module.finrank ℚ K : ℂ)) / 2) /
              (u : ℂ) := sorry

/-- The total kernel over a system of class representatives, with the class factors
`χ_u(rep c)⁻¹`: the Mellin inverse of the unitary completion. It does not depend on the
representatives (`heckeMellinTotal_congr`): replacing `𝔞` by `c 𝔞` multiplies the kernel by
`χ_f(c) N(c^p) ∏_w |c_w|^(-P_w) = χ_u((c))` and the class factor by `χ_u((c))⁻¹`. -/
noncomputable def heckeMellinTotal {𝔪 : GNF.Modulus K} (D : Set (ArchParam K))
    (χ : Grossencharacter K 𝔪) (rep : ClassGroup (𝓞 K) → Ideal (𝓞 K))
    (hrep : IsClassRepresentatives K (primitiveConductor K χ) rep) (u : ℝ) : ℂ :=
  ∑ c : ClassGroup (𝓞 K),
    ((primitive K χ).unitaryWeight (rep c))⁻¹ *
      heckeMellinKernel K D χ (idealUnit K (rep c) (hrep c).1.1) u

/-- Its constant term: `ε(χ) a₀ ∑_c χ_u(rep c)⁻¹`, which vanishes unless `χ_u` is trivial. -/
noncomputable def heckeMellinConstant {𝔪 : GNF.Modulus K} (χ : Grossencharacter K 𝔪)
    (rep : ClassGroup (𝓞 K) → Ideal (𝓞 K)) : ℂ :=
  heckeEpsilon K χ * (mellinConstant K : ℂ) *
    ∑ c : ClassGroup (𝓞 K), ((primitive K χ).unitaryWeight (rep c))⁻¹

theorem heckeMellinTotal_congr {𝔪 : GNF.Modulus K} {D : Set (ArchParam K)}
    (hD : IsUnitFundamentalDomain K D) (χ : Grossencharacter K 𝔪)
    (rep rep' : ClassGroup (𝓞 K) → Ideal (𝓞 K))
    (hrep : IsClassRepresentatives K (primitiveConductor K χ) rep)
    (hrep' : IsClassRepresentatives K (primitiveConductor K χ) rep') (u : ℝ) :
    heckeMellinTotal K D χ rep hrep u = heckeMellinTotal K D χ rep' hrep' u := sorry

/-- **The unitary completion is a Mellin transform**, with the kernel identified: for `Re s > 1`,
`Λ(χ_u, s) = ∫_0^∞ (F_D(χ, u) - a₀(χ)) u^((s + Tr p / n)/2) du/u`. This is the theorem that
`exists_mellin_completedHeckeLFunction` abbreviates in the finite-order case. -/
theorem unitaryCompletion_eq_mellin {𝔪 : GNF.Modulus K} {D : Set (ArchParam K)}
    (hD : IsUnitFundamentalDomain K D) (χ : Grossencharacter K 𝔪)
    (rep : ClassGroup (𝓞 K) → Ideal (𝓞 K))
    (hrep : IsClassRepresentatives K (primitiveConductor K χ) rep) {s : ℂ} (hs : 1 < s.re) :
    unitaryCompletion K χ s =
      ∫ u in Set.Ioi (0 : ℝ),
        (heckeMellinTotal K D χ rep hrep u - heckeMellinConstant K χ rep) *
          (u : ℂ) ^ ((s + (harmonicDegree K χ : ℂ) / (Module.finrank ℚ K : ℂ)) / 2) / (u : ℂ) :=
  sorry

/-- Neukirch (8.4), second half: exponential decay to the constant term. -/
theorem heckeMellinTotal_sub_const_isBigO {𝔪 : GNF.Modulus K} {D : Set (ArchParam K)}
    (hD : IsUnitFundamentalDomain K D) (χ : Grossencharacter K 𝔪)
    (rep : ClassGroup (𝓞 K) → Ideal (𝓞 K))
    (hrep : IsClassRepresentatives K (primitiveConductor K χ) rep) :
    ∃ c : ℝ, 0 < c ∧
      (fun u : ℝ ↦ heckeMellinTotal K D χ rep hrep u - heckeMellinConstant K χ rep) =O[atTop]
        fun u : ℝ ↦ Real.exp (-c * u ^ ((1 : ℝ) / Module.finrank ℚ K)) := sorry

/-- **Neukirch (8.4), the transformation law**, from Hecke's lemma and the theta transformation
(7.7) with its Gauss sum (`gaussSum`): `F_D(χ, 1/u) = W(χ) u^(1/2 + Tr p / n) F_{D⁻¹}(χ⁻¹, u)`.
The constant is the root number: this law is what pins `Grossencharacter.rootNumber`, and
Neukirch's closed form `W(χ) = [i^(Tr p) N((md/|md|)^p)]⁻¹ τ(χ_f) / √N(𝔪)` of (8.5) is its
evaluation. ⚠ The right-hand side is the *inverse* character, which for a unitary character is
the conjugate; the exponent `1/2 + Tr p / n` is the weight of the functional-equation pair,
and `harmonicDegree_inverse` says the two sides shift the Mellin variable by the same amount. -/
theorem heckeMellinTotal_inv {𝔪 : GNF.Modulus K} {D : Set (ArchParam K)}
    (hD : IsUnitFundamentalDomain K D) (χ : Grossencharacter K 𝔪)
    (rep rep' : ClassGroup (𝓞 K) → Ideal (𝓞 K))
    (hrep : IsClassRepresentatives K (primitiveConductor K χ) rep)
    (hrep' : IsClassRepresentatives K (primitiveConductor K (inverse K χ)) rep')
    {u : ℝ} (hu : 0 < u) :
    heckeMellinTotal K D χ rep hrep u⁻¹ =
      rootNumber K χ *
        ((u : ℝ) : ℂ) ^ ((1 : ℂ) / 2 + (harmonicDegree K χ : ℂ) / (Module.finrank ℚ K : ℂ)) *
        heckeMellinTotal K ((fun y : ArchParam K ↦ fun w ↦ (y w)⁻¹) '' D) (inverse K χ) rep'
          hrep' u := sorry

/-- **The Grossencharacter instance of the Mellin principle**: `f = F_D(χ, ·)`,
`g = F_{D⁻¹}(χ⁻¹, ·)`, level `1`, weight `1/2 + Tr p / n`, `ε = W(χ)`. Its `completed` at
`(s + Tr p / n)/2` is `unitaryCompletion χ` at `s`, which is how the unitary completion is
continued and `grossencharacterData_hasFunctionalEquation` proved; `Grossencharacter.completed`
then follows by recentering. -/
noncomputable def grossencharacterFEPair {𝔪 : GNF.Modulus K} {D : Set (ArchParam K)}
    (hD : IsUnitFundamentalDomain K D) (χ : Grossencharacter K 𝔪)
    (rep rep' : ClassGroup (𝓞 K) → Ideal (𝓞 K))
    (hrep : IsClassRepresentatives K (primitiveConductor K χ) rep)
    (hrep' : IsClassRepresentatives K (primitiveConductor K (inverse K χ)) rep') :
    FEPairWithLevel ℂ where
  f := heckeMellinTotal K D χ rep hrep
  g := heckeMellinTotal K ((fun y : ArchParam K ↦ fun w ↦ (y w)⁻¹) '' D) (inverse K χ) rep' hrep'
  fLimit := heckeMellinConstant K χ rep
  gLimit := heckeMellinConstant K (inverse K χ) rep'
  level := 1
  level_pos := one_pos
  weight := 1 / 2 + (harmonicDegree K χ : ℝ) / Module.finrank ℚ K
  epsilon := rootNumber K χ
  transform := sorry
  f_decay := sorry
  g_decay := sorry

theorem grossencharacterFEPair_completed {𝔪 : GNF.Modulus K} {D : Set (ArchParam K)}
    (hD : IsUnitFundamentalDomain K D) (χ : Grossencharacter K 𝔪)
    (rep rep' : ClassGroup (𝓞 K) → Ideal (𝓞 K))
    (hrep : IsClassRepresentatives K (primitiveConductor K χ) rep)
    (hrep' : IsClassRepresentatives K (primitiveConductor K (inverse K χ)) rep') {s : ℂ}
    (hs : 1 < s.re) :
    (grossencharacterFEPair K hD χ rep rep' hrep hrep').completed
        ((s + (harmonicDegree K χ : ℂ) / (Module.finrank ℚ K : ℂ)) / 2) =
      unitaryCompletion K χ s := sorry

end Grossencharacter

/-- **The Layer 5 Mellin presentation, with its kernel identified.** For a primitive ray-class
character `ψ` the finite-order presentation `ofRayClassCharacter ψ.character` has trivial
angular frequencies and `Tr(p)` equal to the number of odd real places, so
`completedHeckeLFunction ψ` is the Mellin transform of `heckeMellinTotal` of that presentation at
`(s + Tr p / n)/2`. The existential `exists_mellin_completedHeckeLFunction` follows with
`θ(t) = 2 t^(Tr p / n) (F(t²) - a₀)`. -/
theorem completedHeckeLFunction_eq_mellin {D : Set (ArchParam K)}
    (hD : IsUnitFundamentalDomain K D) (ψ : PrimitiveRayClassCharacter K)
    (rep : ClassGroup (𝓞 K) → Ideal (𝓞 K))
    (hrep : IsClassRepresentatives K
      (Grossencharacter.primitiveConductor K (Grossencharacter.ofRayClassCharacter K ψ.character))
      rep) {s : ℂ} (hs : 1 < s.re) :
    completedHeckeLFunction K ψ s =
      ∫ u in Set.Ioi (0 : ℝ),
        (Grossencharacter.heckeMellinTotal K D (Grossencharacter.ofRayClassCharacter K ψ.character)
            rep hrep u -
          Grossencharacter.heckeMellinConstant K
            (Grossencharacter.ofRayClassCharacter K ψ.character) rep) *
          (u : ℂ) ^ ((s + (Grossencharacter.harmonicDegree K
            (Grossencharacter.ofRayClassCharacter K ψ.character) : ℂ) /
              (Module.finrank ℚ K : ℂ)) / 2) / (u : ℂ) := sorry

open scoped Classical in
/-- **Neukirch VII (6.3), the Gauss sum** of the finite character of a primitive ray-class
character at `y ∈ 𝔪₀⁻¹𝔡⁻¹`: `τ_𝔪(χ_f, y) = ∑_{x mod 𝔪₀, (x, 𝔪₀) = 1} χ_f(x) e^(2πi Tr(xy))`, a
finite sum over the residue units of `𝓞/𝔪₀` (the quotient by a nonzero ideal is finite), well
defined because `Tr(xy) mod ℤ` depends only on `x mod 𝔪₀` for such `y` and `χ_f` factors through
`(𝓞/𝔪₀)ˣ` (`Grossencharacter.finiteCharacter_residue`), so any representative `Quotient.out`
may be evaluated. The finite character is `Grossencharacter.finiteCharacter` of the finite-order
presentation — the residue character, with the real signs stripped by `archimedeanValue`. -/
noncomputable def gaussSum (ψ : PrimitiveRayClassCharacter K) (y : K) : ℂ :=
  letI : Finite (𝓞 K ⧸ ψ.conductor.finitePart) :=
    Ideal.finiteQuotientOfFreeOfNeBot _ ψ.conductor.finitePart_ne_bot
  letI : Fintype (𝓞 K ⧸ ψ.conductor.finitePart)ˣ := Fintype.ofFinite _
  ∑ x : (𝓞 K ⧸ ψ.conductor.finitePart)ˣ,
    Grossencharacter.finiteCharacter K (Grossencharacter.ofRayClassCharacter K ψ.character)
        (Quotient.out (x : 𝓞 K ⧸ ψ.conductor.finitePart)) *
      Complex.exp (2 * Real.pi * Complex.I *
        ((Algebra.trace ℚ K (algebraMap (𝓞 K) K (Quotient.out
          (x : 𝓞 K ⧸ ψ.conductor.finitePart)) * y) : ℚ) : ℂ))

/-- The Gauss sum does not depend on the representatives, for `y ∈ 𝔪₀⁻¹𝔡⁻¹`: changing `x` by an
element of `𝔪₀` changes `Tr(xy)` by an element of `Tr(𝔡⁻¹) = ℤ`. -/
theorem gaussSum_eq_sum {K : Type u} [Field K] [NumberField K] (ψ : PrimitiveRayClassCharacter K)
    (y : K) (hy : y ∈ FractionalIdeal.dual ℤ ℚ (ψ.conductor.finitePart : FractionalIdeal (𝓞 K)⁰ K))
    (rep : (𝓞 K ⧸ ψ.conductor.finitePart)ˣ → 𝓞 K)
    (hrep : ∀ x, Ideal.Quotient.mk ψ.conductor.finitePart (rep x) =
      (x : 𝓞 K ⧸ ψ.conductor.finitePart)) :
    letI : Finite (𝓞 K ⧸ ψ.conductor.finitePart) :=
      Ideal.finiteQuotientOfFreeOfNeBot _ ψ.conductor.finitePart_ne_bot
    letI : Fintype (𝓞 K ⧸ ψ.conductor.finitePart)ˣ := Fintype.ofFinite _
    gaussSum K ψ y = ∑ x : (𝓞 K ⧸ ψ.conductor.finitePart)ˣ,
      Grossencharacter.finiteCharacter K (Grossencharacter.ofRayClassCharacter K ψ.character)
          (rep x) *
        Complex.exp (2 * Real.pi * Complex.I *
          ((Algebra.trace ℚ K (algebraMap (𝓞 K) K (rep x) * y) : ℚ) : ℂ)) := sorry

/-- **Neukirch (6.4), first half**, for `y ∈ 𝔪₀⁻¹𝔡⁻¹` and a primitive character:
`τ_𝔪(χ_f, a y) = conj(χ_f(a)) τ_𝔪(χ_f, y)`. Reindexing the sum by `x ↦ x a⁻¹` produces the
**inverse** value `χ_f(a)⁻¹`, which is `conj(χ_f(a))` for a unit-modulus character — Mathlib's
`gaussSum_mulShift_eq` states exactly this convention — and for `(a, 𝔪₀) ≠ 1` both sides are `0`
(primitivity; `finiteCharacter` already vanishes there), so one equation covers (6.4)'s two cases.
⚠ Quadratic characters cannot detect the inverse; an even primitive character of order `3`
modulo `7` with `χ_f(3) = ω` gives `τ(χ, 3/7) = ω⁻¹ τ(χ, 1/7)`. ⚠ The domain hypothesis is needed
for the vanishing case: over `ℚ` with the even character mod `5`, `a = 5` and `y = 1/25` (not in
`(1/5)ℤ`) would give `τ(χ, 1/5) = 0`, against `norm_gaussSum`. -/
theorem gaussSum_mul (ψ : PrimitiveRayClassCharacter K) (y : K)
    (hy : y ∈ FractionalIdeal.dual ℤ ℚ (ψ.conductor.finitePart : FractionalIdeal (𝓞 K)⁰ K))
    (a : 𝓞 K) :
    gaussSum K ψ (algebraMap (𝓞 K) K a * y) =
      starRingEnd ℂ (Grossencharacter.finiteCharacter K
        (Grossencharacter.ofRayClassCharacter K ψ.character) a) * gaussSum K ψ y := sorry

/-- Neukirch (6.4), second half: `|τ_𝔪(χ_f, y)| = √N(𝔪₀)` when `y ∈ 𝔪₀⁻¹𝔡⁻¹` and the integral
ideal `y 𝔪₀ 𝔡` is prime to `𝔪₀`. Consistency check with `gaussSum_mul`: over `ℚ` with the even
character mod `5`, `y = 1/5` gives `y 𝔪₀ 𝔡 = ℤ`, so `|τ(χ, 1/5)| = √5`. -/
theorem norm_gaussSum (ψ : PrimitiveRayClassCharacter K) (y : K)
    (hy : y ∈ FractionalIdeal.dual ℤ ℚ (ψ.conductor.finitePart : FractionalIdeal (𝓞 K)⁰ K))
    (hcop : ∃ 𝔟 : Ideal (𝓞 K), ψ.conductor.IsCoprimeTo 𝔟 ∧
      FractionalIdeal.spanSingleton (𝓞 K)⁰ y *
          (ψ.conductor.finitePart : FractionalIdeal (𝓞 K)⁰ K) *
          (differentIdeal ℤ (𝓞 K) : FractionalIdeal (𝓞 K)⁰ K) = 𝔟) :
    ‖gaussSum K ψ y‖ = Real.sqrt (Ideal.absNorm ψ.conductor.finitePart) := sorry

theorem grossencharacterData_ofRayClassCharacter (χ : PrimitiveRayClassCharacter K) :
    (grossencharacterData K
        (Grossencharacter.ofRayClassCharacter K χ.character)).EqOffZero
      (heckeData K χ) := sorry

/-- Unconditional odd-parity regression: the real place remains in the conductor and produces
the shift of `Gammaℝ (s + 1)`. -/
theorem oddCharacter_mod_four_test :
    (heckeData ℚ oddPrimitiveModFour).gammaR = {1} ∧
      (grossencharacterData ℚ
        (Grossencharacter.ofRayClassCharacter ℚ oddPrimitiveModFour.character)).EqOffZero
          (heckeData ℚ oddPrimitiveModFour) := sorry

/-- ⚠ **The real sign in the finite character**, at the unit `-1` of the odd character mod `4∞`.
Its algebraic infinity type is `0` and its shift is `0`, so a finite character built from the
algebraic exponents alone would be `1` at `-1`, while the harmonic polynomial `x^ε` with `ε = 1`
is `-1` there, and the twisted theta series would vanish by pairing `a` with `-a` — although
`Λ(s, χ₄)` is not zero. With the full archimedean value `χ_f(-1) = -1`, the unit compensation
`finiteCharacter_mul_harmonicFactor_unit` reads `(-1)·(-1) = 1`, the terms at `a` and `-a` are
equal, and the theta series over `ℤ` is Riemann's odd theta function
`2 ∑_{n ≥ 1} χ₄(n) n e^{-π y n²}`. The card test `oddCharacter_mod_four_test` does not see this:
it reads the parity off the card, not off the kernel. -/
theorem oddCharacter_mod_four_sign_test (y : ℝ) (hy : 0 < y) :
    let χ := Grossencharacter.ofRayClassCharacter ℚ oddPrimitiveModFour.character
    Grossencharacter.finiteCharacter ℚ χ (-1) = -1 ∧
      Grossencharacter.harmonicFactor ℚ χ (mixedEmbedding ℚ (-1 : ℚ)) = -1 ∧
      Grossencharacter.harmonicDegree ℚ χ = 1 ∧
      Grossencharacter.finiteCharacter ℚ χ (-1) *
        Grossencharacter.harmonicFactor ℚ χ (mixedEmbedding ℚ (-1 : ℚ)) = 1 ∧
      Grossencharacter.heckeTheta ℚ χ 1 (fun _ ↦ y) =
        2 * ∑' n : ℕ, χ₄C ((n + 1 : ℕ) : ZMod 4) * ((n + 1 : ℕ) : ℂ) *
          Complex.exp (((-Real.pi * y * ((n + 1 : ℕ) : ℝ) ^ 2 : ℝ)) : ℂ) := sorry

/-- Unconditional even-parity regression: no real place divides the modulus and the real gamma
shift is zero. -/
theorem evenCharacter_mod_five_test :
    (heckeData ℚ evenPrimitiveModFive).gammaR = {0} ∧
      (grossencharacterData ℚ
        (Grossencharacter.ofRayClassCharacter ℚ evenPrimitiveModFive.character)).EqOffZero
          (heckeData ℚ evenPrimitiveModFive) := sorry

theorem heckeLFunction_ne_zero_of_one_le_re
    (χ : PrimitiveRayClassCharacter K) (hχ1 : χ.character ≠ 1) {s : ℂ} (hs : 1 ≤ s.re) :
    heckeLFunctionC K χ.character s ≠ 0 := sorry

theorem three_four_one_nonneg (θ : ℝ) :
    0 ≤ 3 + 4 * Real.cos θ + Real.cos (2 * θ) := sorry

theorem meromorphicOrderAt_dedekindZetaC_one_add {t : ℝ} (ht : t ≠ 0) :
    meromorphicOrderAt (dedekindZetaC K) (1 + t * I) = (0 : WithTop ℤ) := sorry

/-- Outside the pure-norm-twist exception, the reviewed single-character premise is constructed
from the ray-class and archimedean inputs rather than assumed by the final theorem. -/
theorem Grossencharacter.unitaryCancelling
    {𝔪 : GNF.Modulus K} (χ : Grossencharacter K 𝔪)
    (hexc : ∀ u : ℝ,
      ¬ TauCetiRoadmap.ArithmeticDirichletSeries.UnitaryIdealWeight.IsNormTwistOnGood K
        χ.unitaryWeight u) :
    UnitaryCancelling K χ.unitaryWeight := sorry

theorem Grossencharacter.meromorphicOrderAt_lFunctionC
    {𝔪 : GNF.Modulus K} (χ : Grossencharacter K 𝔪)
    (h : UnitaryCancelling K χ.unitaryWeight) (t : ℝ) :
    meromorphicOrderAt (Grossencharacter.lFunctionC K χ)
      ((1 : ℂ) + (χ.shift : ℂ) + t * I) = (0 : WithTop ℤ) := sorry

/-! ### The infinite-order acceptance test, and the analytic exports of this layer

Hecke's angular characters of `ℚ(i)` are the infinite-order test of the infinity-type interface:
an interface that merely typechecks cannot see `k`. The equidistribution of the angles of Gaussian
primes is a prime-distribution theorem and is not proved here; what such an argument consumes is
the analytic data below, which is intrinsic to the L-function.
-/

/-- Hecke's angular characters of `ℚ(i)`: `𝔞 = (α) ↦ (α / |α|) ^ (4k) = (α / conj α)^(2k)`, of
infinite order for `k ≠ 0`, unramified, and unitary. ⚠ By `compatibility` the idelic archimedean
component is the inverse of the ideal-side value, `z ↦ (z/|z|)^(-4k)`, so the algebraic infinity
type has exponent `-2k` at the embedding through which the ideal value is read and `2k` at its
conjugate (`angularGrossencharacter_unitaryWeight_span`); the two exponents sum to zero and
differ by `4k` either way, which is all `angularGrossencharacter_infinityType` records. -/
noncomputable def angularGrossencharacter (F : Type u) [Field F] [NumberField F]
    [IsCyclotomicExtension {4} ℚ F] (k : ℤ) :
    Grossencharacter F (GNF.Modulus.one F) := sorry

/-- The infinity-type interface test. ⚠ The two exponents **sum** to zero — the character is
unitary, so its shift vanishes — and **differ** by `4k`, the angular frequency. An interface that
stores only a weight, or that adds the conjugate exponents, records `0` for every `k` and cannot
distinguish these characters from the trivial one. -/
theorem angularGrossencharacter_infinityType
    (F : Type u) [Field F] [NumberField F] [IsCyclotomicExtension {4} ℚ F] (k : ℤ)
    (w : {w : InfinitePlace F // w.IsComplex}) :
    ((angularGrossencharacter F k).infinityType.toContinuous.complexExponent w = 0) ∧
      ((angularGrossencharacter F k).infinityType.toContinuous.complexAngular w = 4 * k ∨
        (angularGrossencharacter F k).infinityType.toContinuous.complexAngular w = -(4 * k)) ∧
      (angularGrossencharacter F k).shift = 0 := sorry

/-- The angular card: no real gamma factor, one complex factor shifted by `2|k|`, conductor
`|d| N(𝔣) = 4`, degree two, and no pole for `k ≠ 0`. ⚠ The shift is `2|k|`, half the angular
frequency, not `4k` and not `k`. -/
theorem angularGrossencharacterData
    (F : Type u) [Field F] [NumberField F] [IsCyclotomicExtension {4} ℚ F] {k : ℤ} (hk : k ≠ 0) :
    (grossencharacterData F (angularGrossencharacter F k)).gammaR = 0 ∧
      (grossencharacterData F (angularGrossencharacter F k)).gammaC =
        {(2 * (k.natAbs : ℂ))} ∧
      ((grossencharacterData F (angularGrossencharacter F k)).conductor : ℕ) = 4 ∧
      (grossencharacterData F (angularGrossencharacter F k)).degree = 2 ∧
      (grossencharacterData F (angularGrossencharacter F k)).polarOrder = 0 := sorry

/-- ⚠ `k ≠ 0` is essential: the angular character with `k = 0` is trivial, its L-function is
`ζ_{ℚ(i)}`, and it has a pole at `s = 1`. For `k ≠ 0` the character is not a norm twist, which is
the exception clause of `Grossencharacter.unitaryCancelling`, so the nonvanishing of Layer 7
applies to it unconditionally. -/
theorem angularGrossencharacter_not_isNormTwist
    (F : Type u) [Field F] [NumberField F] [IsCyclotomicExtension {4} ℚ F] {k : ℤ} (hk : k ≠ 0)
    (u : ℝ) :
    ¬ TauCetiRoadmap.ArithmeticDirichletSeries.UnitaryIdealWeight.IsNormTwistOnGood F
      (angularGrossencharacter F k).unitaryWeight u := sorry

/-- **The nonreal acceptance test of the sign in `compatibility`.** Over `ℚ(i)`, at `a = 2 + i`
and any `k ≠ 0`: the finite value `χ_u((a))` is `((2+i)/(2-i))^(2k) = ((3+4i)/5)^(2k)` through
the embedding at which the infinity type has exponent `-2k`, which is not real, and the
archimedean value `∏_τ τ(a)^(n_τ) = ((3+4i)/5)^(-2k)` is its inverse: the corrected law holds and
the law with the archimedean product on the right-hand side fails, since `(3+4i)/5` is not a
root of unity. ⚠ A real-valued or finite-order example cannot see this: for those the two laws
coincide. The modulus is trivial, so `IsCongrOne` is vacuous and the relation holds at every
nonzero `a`. -/
theorem angularGrossencharacter_compatibility_test
    (F : Type u) [Field F] [NumberField F] [IsCyclotomicExtension {4} ℚ F] {k : ℤ} (hk : k ≠ 0)
    (a : 𝓞 F) (ha : (a : F) = 2 + IsCyclotomicExtension.zeta 4 ℚ F) :
    (angularGrossencharacter F k).unitaryWeight (Ideal.span {a}) *
        ∏ τ : F →+* ℂ, τ (a : F) ^ (angularGrossencharacter F k).infinityType.exponent τ = 1 ∧
      (angularGrossencharacter F k).unitaryWeight (Ideal.span {a}) ≠
        ∏ τ : F →+* ℂ, τ (a : F) ^ (angularGrossencharacter F k).infinityType.exponent τ ∧
      ((angularGrossencharacter F k).unitaryWeight (Ideal.span {a})).im ≠ 0 := sorry

/-- The ideal-side values of the angular character, through the embedding `τ` at which its
infinity type has exponent `-2k`: `χ_u((α)) = (τ α / conj (τ α))^(2k)` for every nonzero
`α ∈ ℤ[i]`, the inverse of the archimedean value `τ(α)^(-2k) conj(τ α)^(2k)`. This is the
statement `𝔞 = (α) ↦ (α/|α|)^(4k)` of the definition, with the sign of `compatibility` made
explicit: the idelic archimedean component is `(z/|z|)^(-4k)`. -/
theorem angularGrossencharacter_unitaryWeight_span
    (F : Type u) [Field F] [NumberField F] [IsCyclotomicExtension {4} ℚ F] (k : ℤ) :
    ∃ τ : F →+* ℂ, (angularGrossencharacter F k).infinityType.exponent τ = -(2 * k) ∧
      ∀ α : 𝓞 F, α ≠ 0 →
        (angularGrossencharacter F k).unitaryWeight (Ideal.span {α}) =
          (τ (α : F) / starRingEnd ℂ (τ (α : F))) ^ (2 * k) := sorry

/-- **The boundary datum exported to prime-distribution consumers.** For a unitary weight covered
by the reviewed cancellation package, the logarithmic derivative of the named continuation extends
continuously to the closed half-plane `Re s ≥ 1` with no residue: there is no pole to cancel,
because the weight is not a norm twist, and no zero on the line, by the nonvanishing theorem of
this layer. A Tauberian consumer needs exactly this, and no prime count is proved here. -/
theorem exists_continuousOn_logDeriv_of_unitaryCancelling
    (χ : ADS.UnitaryIdealWeight K) (h : UnitaryCancelling K χ) :
    ∃ G : ℂ → ℂ, ContinuousOn G {s : ℂ | 1 ≤ s.re} ∧
      ∀ s : ℂ, 1 < s.re →
        G s = -deriv (ADS.continuedLFunctionOfWeight K χ) s /
          ADS.continuedLFunctionOfWeight K χ s := sorry

/-- The trivial-weight companion: the norm coefficients of the ideal von Mangoldt weight sum to
the logarithmic derivative of the named continuation of `ζ_K`. -/
theorem lSeries_primeVonMangoldtCoeff_univ {s : ℂ} (hs : 1 < s.re) :
    LSeries (fun n ↦ (ADS.primeVonMangoldtCoeff K Set.univ n : ℂ)) s =
      -deriv (dedekindZetaC K) s / dedekindZetaC K s := sorry

/-- **The exact export named by Arithmetic Dirichlet Series**, whose
`primeIdealTheorem_of_boundary` is conditional on it. The residue is `1`, from the simple pole of
`ζ_K` at `s = 1`; the continuous remainder exists because `ζ_K` is nonvanishing on `Re s = 1`.
Mathlib's one-sided residue theorem does not supply this. -/
noncomputable def primeIdealVonMangoldtBoundary (K : Type u) [Field K] [NumberField K] :
    ADS.PrimeBoundaryRemainder K Set.univ 1 where
  residue_nonneg := zero_le_one
  F := fun s ↦ -deriv (dedekindZetaC K) s / dedekindZetaC K s
  G := sorry
  hasSum := sorry
  continuous_remainder := sorry
  remainder_eq := sorry

/-- Dedekind-zeta specialization of the generic ideal von Mangoldt transform. -/
theorem dedekindZeta_logDeriv_eq {s : ℂ} (hs : 1 < s.re) :
    (∑' I : ADS.NonzeroIdeal K,
      TauCetiRoadmap.ArithmeticDirichletSeries.IdealArithmeticFunction.vonMangoldt K
          (TauCetiRoadmap.ArithmeticDirichletSeries.UnitaryIdealWeight.toArithmeticFunction K
            (TauCetiRoadmap.ArithmeticDirichletSeries.UnitaryIdealWeight.one K)) I /
        (Ideal.absNorm (I : Ideal (𝓞 K)) : ℂ) ^ s) =
      -deriv (dedekindZeta K) s / dedekindZeta K s := sorry

/-- Nonnegativity of the Dedekind-zeta von Mangoldt coefficients. -/
theorem dedekindZeta_idealVonMangoldt_nonneg (I : ADS.NonzeroIdeal K) :
    0 ≤
        (TauCetiRoadmap.ArithmeticDirichletSeries.IdealArithmeticFunction.vonMangoldt K
          (TauCetiRoadmap.ArithmeticDirichletSeries.UnitaryIdealWeight.toArithmeticFunction K
            (TauCetiRoadmap.ArithmeticDirichletSeries.UnitaryIdealWeight.one K)) I).re ∧
      (TauCetiRoadmap.ArithmeticDirichletSeries.IdealArithmeticFunction.vonMangoldt K
          (TauCetiRoadmap.ArithmeticDirichletSeries.UnitaryIdealWeight.toArithmeticFunction K
            (TauCetiRoadmap.ArithmeticDirichletSeries.UnitaryIdealWeight.one K)) I).im = 0 := sorry

end

end TauCetiRoadmap.LFunctions
