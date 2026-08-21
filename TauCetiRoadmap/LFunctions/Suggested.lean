import Mathlib
import TauCetiRoadmap.ArithmeticDirichletSeries.Suggested
import TauCetiRoadmap.GlobalNumberFields.Suggested

/-!
# L-functions: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive specification is
`README.md`. These declarations pin the completed-function conventions, the exact supplier
carriers, and the names consumed by downstream zero analysis.

Generic ideal weights, Euler products, summation, density, and Tauberian theory are imported from
`ArithmeticDirichletSeries`. Moduli, ray-class characters, and Hecke characters are imported from
`GlobalNumberFields`. This file defines none of those carriers and contains no Frobenius or
Chebotarev predicate.
-/

namespace TauCetiRoadmap.LFunctions

open Complex Filter NumberField NumberField.InfinitePlace Topology Asymptotics
open IsDedekindDomain (HeightOneSpectrum)
open scoped nonZeroDivisors

noncomputable section

universe u

namespace ADS
export TauCetiRoadmap.ArithmeticDirichletSeries
  (NonzeroIdeal IdealArithmeticFunction UnitaryIdealWeight normCoeff EulerProductData
    HasCancellation continuedLFunctionOfWeight regroupByNorm)
end ADS

namespace GNF
export TauCetiRoadmap.GlobalNumberFields
  (Modulus RayClassGroup RayClassCharacter InfinityType HeckeCharacter finite_rayClassGroup
    idealClass)
namespace Modulus
export TauCetiRoadmap.GlobalNumberFields.Modulus (one)
end Modulus
namespace RayClassCharacter
export TauCetiRoadmap.GlobalNumberFields.RayClassCharacter (induced)
end RayClassCharacter
end GNF

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

theorem NormalizationTranslation.hasFunctionalEquation_iff (T : NormalizationTranslation) :
    T.analytic.HasFunctionalEquation ↔
      ‖T.arithmetic.rootNumber‖ = 1 ∧
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

/-! ## Layer 1: Poisson summation and theta transformations -/

structure FEPairWithLevel (E : Type*) [NormedAddCommGroup E] [NormedSpace ℂ E] where
  f : ℝ → E
  g : ℝ → E
  level : ℝ
  level_pos : 0 < level
  weight : ℝ
  epsilon : ℂ
  transform : ∀ t : ℝ, 0 < t →
    f (1 / (level * t)) = epsilon • ((((t ^ weight : ℝ) : ℂ)) • g t)

noncomputable def FEPairWithLevel.completed
    {E : Type*} [NormedAddCommGroup E] [NormedSpace ℂ E]
    (P : FEPairWithLevel E) : ℂ → E := sorry

noncomputable def mixedInner (K : Type u) [Field K] [NumberField K]
    (x y : mixedEmbedding.mixedSpace K) : ℝ :=
  letI : Fintype {place : InfinitePlace K // place.IsReal} := Fintype.ofFinite _
  letI : Fintype {place : InfinitePlace K // place.IsComplex} := Fintype.ofFinite _
  ∑ place : {place : InfinitePlace K // place.IsReal}, x.1 place * y.1 place +
    ∑ place : {place : InfinitePlace K // place.IsComplex},
      (x.2 place * starRingEnd ℂ (y.2 place)).re

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

/-! ## Layers 2--3: partial and Dedekind zeta functions -/

variable (K : Type u) [Field K] [NumberField K]

/-- The indicator of one ray class on nonzero ideals. This is deliberately a general ideal
arithmetic function: a class indicator is not completely multiplicative. -/
noncomputable def rayClassCoeff
    (𝔪 : GNF.Modulus K) (c : GNF.RayClassGroup 𝔪) :
    ADS.IdealArithmeticFunction K := by
  classical
  exact fun I =>
    if hI : 𝔪.IsCoprimeTo (I : Ideal (𝓞 K)) then
      if GNF.idealClass 𝔪 (I : Ideal (𝓞 K)) = c then 1 else 0
    else 0

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

theorem sum_partialZeta (𝔪 : GNF.Modulus K) [Fintype (GNF.RayClassGroup 𝔪)]
    {s : ℂ} (hs : 1 < s.re) :
    ∑ c : GNF.RayClassGroup 𝔪, partialZeta K 𝔪 c s = dedekindZeta K s := sorry

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

/-! ## Layer 4: Dirichlet L-functions and factorizations -/

noncomputable def χ₄C : DirichletCharacter ℂ 4 :=
  ZMod.χ₄.ringHomComp (Int.castRingHom ℂ)

noncomputable def dirichletData {N : ℕ} [NeZero N]
    (χ : DirichletCharacter ℂ N) (hχ : χ.IsPrimitive) : AnalyticLFunctionData := sorry

theorem dirichletData_hasContinuation {N : ℕ} [NeZero N]
    (χ : DirichletCharacter ℂ N) (hχ : χ.IsPrimitive) :
    (dirichletData χ hχ).HasMeromorphicContinuation := sorry

theorem dirichletData_hasFunctionalEquation {N : ℕ} [NeZero N]
    (χ : DirichletCharacter ℂ N) (hχ : χ.IsPrimitive) :
    (dirichletData χ hχ).HasFunctionalEquation := sorry

theorem dedekindZetaC_quadratic
    (F : Type u) [Field F] [NumberField F] (hF : Module.finrank ℚ F = 2) :
    ∃ (N : ℕ) (_ : NeZero N) (χ : DirichletCharacter ℂ N),
      ∀ s : ℂ, dedekindZetaC F s = riemannZeta s * DirichletCharacter.LFunction χ s := sorry

/-- Layer 4: cyclotomic factorization using primitive characters inducing the characters modulo
`n`.  There is no correction factor in this primitive form. -/
theorem dedekindZetaC_cyclotomic
    (n : ℕ) [NeZero n] (F : Type u) [Field F] [NumberField F]
    [IsCyclotomicExtension {n} ℚ F]
    (m : DirichletCharacter ℂ n → ℕ) (hm : ∀ χ, NeZero (m χ))
    (hdvd : ∀ χ, m χ ∣ n)
    (χ' : ∀ χ : DirichletCharacter ℂ n, DirichletCharacter ℂ (m χ))
    (hprim : ∀ χ, (χ' χ).IsPrimitive)
    (hind : ∀ χ, DirichletCharacter.changeLevel (hdvd χ) (χ' χ) = χ) (s : ℂ) :
    dedekindZetaC F s =
      ∏ χ : DirichletCharacter ℂ n,
        haveI := hm χ; DirichletCharacter.LFunction (χ' χ) s := sorry

/-- Layer 4: the corresponding factorization in terms of level-`n` characters.  The extra Euler
factors occur on the denominator side, as recorded by the product multiplying `dedekindZetaC`. -/
theorem dedekindZetaC_cyclotomic_imprimitive
    (n : ℕ) [NeZero n] (F : Type u) [Field F] [NumberField F]
    [IsCyclotomicExtension {n} ℚ F]
    (m : DirichletCharacter ℂ n → ℕ) (hdvd : ∀ χ, m χ ∣ n)
    (χ' : ∀ χ : DirichletCharacter ℂ n, DirichletCharacter ℂ (m χ))
    (hprim : ∀ χ, (χ' χ).IsPrimitive)
    (hind : ∀ χ, DirichletCharacter.changeLevel (hdvd χ) (χ' χ) = χ) (s : ℂ) :
    dedekindZetaC F s * ∏ χ : DirichletCharacter ℂ n, ∏ p ∈ n.primeFactors,
        (if p ∣ m χ then (1 : ℂ) else 1 - χ' χ (p : ZMod (m χ)) * (p : ℂ) ^ (-s)) =
      ∏ χ : DirichletCharacter ℂ n, DirichletCharacter.LFunction χ s := sorry

theorem dedekindZetaC_cyclotomic_four
    (F : Type u) [Field F] [NumberField F] [IsCyclotomicExtension {4} ℚ F] (s : ℂ) :
    dedekindZetaC F s = riemannZeta s * DirichletCharacter.LFunction χ₄C s := sorry

/-! ## Layers 5--6: Hecke and Grossencharacter L-functions -/

noncomputable def rayClassIdealWeight
    (𝔪 : GNF.Modulus K) (χ : GNF.RayClassCharacter 𝔪) : ADS.UnitaryIdealWeight K := sorry

noncomputable def modulusFour : GNF.Modulus ℚ := sorry

noncomputable def oddRayClassCharacterModFour : GNF.RayClassCharacter modulusFour := sorry

theorem oddRayClassCharacterModFour_isPrimitive :
    oddRayClassCharacterModFour.IsPrimitive := sorry

noncomputable def modulusFive : GNF.Modulus ℚ := sorry

noncomputable def evenRayClassCharacterModFive : GNF.RayClassCharacter modulusFive := sorry

theorem evenRayClassCharacterModFive_isPrimitive :
    evenRayClassCharacterModFive.IsPrimitive := sorry

noncomputable def heckeLFunctionC
    {𝔪 : GNF.Modulus K} (χ : GNF.RayClassCharacter 𝔪) : ℂ → ℂ := sorry

noncomputable def imprimitiveEulerCorrection
    {𝔪 𝔫 : GNF.Modulus K} (h : 𝔪 ∣ 𝔫) (χ : GNF.RayClassCharacter 𝔪) : ℂ → ℂ := sorry

theorem heckeLFunctionC_eq
    {𝔪 : GNF.Modulus K} (χ : GNF.RayClassCharacter 𝔪) {s : ℂ} (hs : 1 < s.re) :
    heckeLFunctionC K χ s = LSeries
      (ADS.normCoeff K
        (TauCetiRoadmap.ArithmeticDirichletSeries.UnitaryIdealWeight.toArithmeticFunction K
          (rayClassIdealWeight K 𝔪 χ))) s := sorry

theorem heckeLFunctionC_induced
    {𝔪 𝔫 : GNF.Modulus K} (h : 𝔪 ∣ 𝔫) (χ : GNF.RayClassCharacter 𝔪) (s : ℂ) :
    heckeLFunctionC K (GNF.RayClassCharacter.induced h χ) s =
      heckeLFunctionC K χ s * imprimitiveEulerCorrection K h χ s := sorry

noncomputable def completedHeckeLFunction
    {𝔪 : GNF.Modulus K} (χ : GNF.RayClassCharacter 𝔪)
    (hχ : χ.IsPrimitive) : ℂ → ℂ := sorry

theorem differentiable_completedHeckeLFunction
    {𝔪 : GNF.Modulus K} {χ : GNF.RayClassCharacter 𝔪}
    (hχ : χ ≠ 1) (hprim : χ.IsPrimitive) :
    Differentiable ℂ (completedHeckeLFunction K χ hprim) := sorry

noncomputable def heckeRootNumber
    {𝔪 : GNF.Modulus K} (χ : GNF.RayClassCharacter 𝔪)
    (hχ : χ.IsPrimitive) : ℂ := sorry

theorem rayClassCharacter_primitive_inv
    {𝔪 : GNF.Modulus K} {χ : GNF.RayClassCharacter 𝔪} (hχ : χ.IsPrimitive) :
    (χ⁻¹).IsPrimitive := sorry

theorem norm_heckeRootNumber
    {𝔪 : GNF.Modulus K} (χ : GNF.RayClassCharacter 𝔪)
    (hχ : χ.IsPrimitive) : ‖heckeRootNumber K χ hχ‖ = 1 := sorry

theorem completedHeckeLFunction_one_sub
    {𝔪 : GNF.Modulus K} (χ : GNF.RayClassCharacter 𝔪)
    (hχ : χ.IsPrimitive) (s : ℂ) :
    completedHeckeLFunction K χ hχ s =
      heckeRootNumber K χ hχ *
        completedHeckeLFunction K χ⁻¹ (rayClassCharacter_primitive_inv K hχ) (1 - s) := sorry

theorem exists_mellin_completedHeckeLFunction
    {𝔪 : GNF.Modulus K} (χ : GNF.RayClassCharacter 𝔪) (hχ : χ.IsPrimitive) :
    ∃ θ : ℝ → ℂ, ∀ s : ℂ, 1 < s.re →
      completedHeckeLFunction K χ hχ s =
        ∫ t in Set.Ioi (0 : ℝ), θ t * (t : ℂ) ^ s / (t : ℂ) := sorry

noncomputable def heckeData
    {𝔪 : GNF.Modulus K} (χ : GNF.RayClassCharacter 𝔪)
    (hχ : χ.IsPrimitive) : AnalyticLFunctionData := sorry

/-- Relative degree one is not the absolute degree of the analytic card. -/
def relativeDegree {𝔪 : GNF.Modulus K} (_ : GNF.RayClassCharacter 𝔪) : ℕ := 1

noncomputable def principalEulerCorrection (𝔪 : GNF.Modulus K) : ℂ → ℂ := sorry

theorem principalHecke_test (𝔪 : GNF.Modulus K) (h𝔪 : 𝔪 ≠ GNF.Modulus.one K) :
    ¬ (1 : GNF.RayClassCharacter 𝔪).IsPrimitive ∧
      ∀ s : ℂ, heckeLFunctionC K (1 : GNF.RayClassCharacter 𝔪) s =
        dedekindZetaC K s * principalEulerCorrection K 𝔪 s := sorry

noncomputable def grossenFullWeight
    (weight : ADS.UnitaryIdealWeight K) (shift : ℝ) (x : Kˣ) : ℂ := sorry

noncomputable def grossenArchimedeanFactor
    (infinityType : GNF.InfinityType K) (shift : ℝ) (x : Kˣ) : ℂ := sorry

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
          (TauCetiRoadmap.ArithmeticDirichletSeries.UnitaryIdealWeight.imaginaryNormTwist K χ t)) u) ∨
      ADS.HasCancellation K
        (TauCetiRoadmap.ArithmeticDirichletSeries.UnitaryIdealWeight.sq K
          (TauCetiRoadmap.ArithmeticDirichletSeries.UnitaryIdealWeight.imaginaryNormTwist K χ t))

/-- Analytic presentation of the imported Hecke-character carrier. -/
structure Grossencharacter
    (K : Type u) [Field K] [NumberField K] (𝔪 : GNF.Modulus K) where
  toHeckeCharacter : GNF.HeckeCharacter K
  unitaryWeight : ADS.UnitaryIdealWeight K
  shift : ℝ
  shift_eq : shift = toHeckeCharacter.shift
  finiteCharacter : GNF.RayClassCharacter 𝔪
  infinityType : GNF.InfinityType K
  compatibility : ∀ x : Kˣ, grossenFullWeight K unitaryWeight shift x =
    grossenArchimedeanFactor K infinityType shift x

noncomputable def Grossencharacter.lFunctionC
    {𝔪 : GNF.Modulus K} (χ : Grossencharacter K 𝔪) : ℂ → ℂ := sorry

noncomputable def Grossencharacter.primitiveConductor
    {𝔪 : GNF.Modulus K} (χ : Grossencharacter K 𝔪) : GNF.Modulus K := sorry

noncomputable def Grossencharacter.rootNumber
    {𝔪 : GNF.Modulus K} (χ : Grossencharacter K 𝔪) : ℂ := sorry

noncomputable def Grossencharacter.completed
    {𝔪 : GNF.Modulus K} (χ : Grossencharacter K 𝔪) : ℂ → ℂ := sorry

noncomputable def Grossencharacter.unitaryCompletion
    {𝔪 : GNF.Modulus K} (χ : Grossencharacter K 𝔪) : ℂ → ℂ := sorry

noncomputable def Grossencharacter.inverse
    {𝔪 : GNF.Modulus K} (χ : Grossencharacter K 𝔪) : Grossencharacter K 𝔪 := sorry

noncomputable def Grossencharacter.ofRayClassCharacter
    {𝔪 : GNF.Modulus K} (χ : GNF.RayClassCharacter 𝔪) : Grossencharacter K 𝔪 := sorry

theorem Grossencharacter.completed_recenter
    {𝔪 : GNF.Modulus K} (χ : Grossencharacter K 𝔪) (s : ℂ) :
    Grossencharacter.completed K χ s =
      Grossencharacter.unitaryCompletion K χ (s - (χ.shift : ℂ)) := sorry

theorem Grossencharacter.rootNumber_inv
    {𝔪 : GNF.Modulus K} (χ : Grossencharacter K 𝔪) :
    Grossencharacter.rootNumber K (Grossencharacter.inverse K χ) =
      (Grossencharacter.rootNumber K χ)⁻¹ := sorry

theorem Grossencharacter.completed_one_sub
    {𝔪 : GNF.Modulus K} (χ : Grossencharacter K 𝔪) (s : ℂ) :
    Grossencharacter.completed K χ s = Grossencharacter.rootNumber K χ *
      Grossencharacter.completed K (Grossencharacter.inverse K χ) (1 - s) := sorry

noncomputable def grossencharacterData
    {𝔪 : GNF.Modulus K} (χ : Grossencharacter K 𝔪) : AnalyticLFunctionData := sorry

theorem grossencharacterData_ofRayClassCharacter
    {𝔪 : GNF.Modulus K} (χ : GNF.RayClassCharacter 𝔪) (hχ : χ.IsPrimitive) :
    (grossencharacterData K (Grossencharacter.ofRayClassCharacter K χ)).EqOffZero
      (heckeData K χ hχ) := sorry

/-- Unconditional odd-parity regression: the real place remains in the conductor and produces
the shift of `Gammaℝ (s + 1)`. -/
theorem oddCharacter_mod_four_test :
    (heckeData ℚ oddRayClassCharacterModFour
        oddRayClassCharacterModFour_isPrimitive).gammaR = {1} ∧
      (grossencharacterData ℚ
        (Grossencharacter.ofRayClassCharacter ℚ oddRayClassCharacterModFour)).EqOffZero
          (heckeData ℚ oddRayClassCharacterModFour
            oddRayClassCharacterModFour_isPrimitive) := sorry

/-- Unconditional even-parity regression: no real place divides the modulus and the real gamma
shift is zero. -/
theorem evenCharacter_mod_five_test :
    (heckeData ℚ evenRayClassCharacterModFive
        evenRayClassCharacterModFive_isPrimitive).gammaR = {0} ∧
      (grossencharacterData ℚ
        (Grossencharacter.ofRayClassCharacter ℚ evenRayClassCharacterModFive)).EqOffZero
          (heckeData ℚ evenRayClassCharacterModFive
            evenRayClassCharacterModFive_isPrimitive) := sorry

theorem heckeLFunction_ne_zero_of_one_le_re
    {𝔪 : GNF.Modulus K} (χ : GNF.RayClassCharacter 𝔪)
    (hχ : χ.IsPrimitive) (hχ1 : χ ≠ 1) {s : ℂ} (hs : 1 ≤ s.re) :
    heckeLFunctionC K χ s ≠ 0 := sorry

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

/-- Hecke's angular equidistribution of Gaussian primes, the infinite-order acceptance test for
the Grossencharacter interface. -/
theorem equidistribution_gaussianPrimes (F : Type*) [Field F] [NumberField F]
    [IsCyclotomicExtension {4} ℚ F] (v : InfinitePlace F) (hv : v.IsComplex)
    (a b : ℝ) (ha : 0 ≤ a) (hab : a ≤ b) (hb : b ≤ Real.pi / 2) :
    Tendsto
      (fun x : ℝ ↦
        (Nat.card {𝔭 : HeightOneSpectrum (𝓞 F) // (Ideal.absNorm 𝔭.asIdeal : ℝ) ≤ x ∧
            ∃ α : 𝓞 F, 𝔭.asIdeal = Ideal.span {α} ∧
              (v.embedding (algebraMap (𝓞 F) F α)).arg ∈ Set.Icc a b} : ℝ) /
          (Nat.card {𝔭 : HeightOneSpectrum (𝓞 F) //
            (Ideal.absNorm 𝔭.asIdeal : ℝ) ≤ x} : ℝ))
      atTop (𝓝 ((b - a) / (Real.pi / 2))) := sorry

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
