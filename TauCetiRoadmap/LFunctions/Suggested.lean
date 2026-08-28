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
    HasCancellation continuedLFunctionOfWeight regroupByNorm primeVonMangoldtCoeff
    PrimeBoundaryRemainder)
end ADS

namespace GNF
export TauCetiRoadmap.GlobalNumberFields
  (Modulus RayClassGroup RayClassCharacter AlgebraicInfinityType FiniteOrderInfinityType
    HeckeCharacter finite_rayClassGroup idealClass integralIdealsPrimeTo classMap
    rayClassIdealMainTerm)
namespace Modulus
export TauCetiRoadmap.GlobalNumberFields.Modulus (one support mem_support_iff support_one)
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

/-- The Gaussian `exp (-π t Q x)` of the Euclidean pairing. -/
noncomputable def mixedGaussian (K : Type u) [Field K] [NumberField K] (t : ℝ)
    (x : mixedEmbedding.mixedSpace K) : ℂ :=
  Complex.exp ((-Real.pi * t * mixedInner K x x : ℝ) : ℂ)

/-- The dual lattice of `mixedInner`. By `analyticDual_mixedEmbedding` it is the image of the
trace dual under `traceToEuclidean`. -/
noncomputable def dualIdealLattice (K : Type u) [Field K] [NumberField K]
    (I : (FractionalIdeal (𝓞 K)⁰ K)ˣ) : AddSubgroup (mixedEmbedding.mixedSpace K) where
  carrier := {y | ∀ x ∈ mixedEmbedding.idealLattice K I, ∃ n : ℤ, mixedInner K x y = (n : ℝ)}
  add_mem' := sorry
  zero_mem' := sorry
  neg_mem' := sorry

open scoped Classical in
/-- Poisson summation over an ideal lattice of the mixed space. The covolume is Mathlib's
`ZLattice.covolume`, evaluated by `NumberField.mixedEmbedding.covolume_idealLattice` as
`N(I) * 2 ^ (-r₂) * √|d_K|`; this roadmap does not restate that computation. -/
theorem poissonSummation_idealLattice (K : Type u) [Field K] [NumberField K]
    (I : (FractionalIdeal (𝓞 K)⁰ K)ˣ)
    (f : SchwartzMap (mixedEmbedding.mixedSpace K) ℂ) :
    ∑' x : mixedEmbedding.idealLattice K I, f (x : mixedEmbedding.mixedSpace K) =
      ((ZLattice.covolume (mixedEmbedding.idealLattice K I) : ℝ) : ℂ)⁻¹ *
        ∑' y : dualIdealLattice K I,
          mixedFourier K (fun z ↦ f z) (y : mixedEmbedding.mixedSpace K) := sorry

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
Mathlib's `Gammaℂ s = 2 (2π) ^ (-s) Γ s` — and the Mellin convention `∫ θ t * t ^ s / t`, the same
one as `exists_mellin_completedHeckeLFunction`. The last conjunct repeats
`completedDedekindZeta_eq` deliberately, so that the discriminant power and the gamma factors are
audited beside the Fourier and covolume conventions they come from: scattered convention remarks
do not prevent a factor-of-two or an inverse-discriminant error. -/
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
      (∃ θ : ℝ → ℂ, ∀ s : ℂ, 1 < s.re →
        completedDedekindZeta K s = ∫ t in Set.Ioi (0 : ℝ), θ t * (t : ℂ) ^ s / (t : ℂ)) ∧
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

noncomputable def grossenFullWeight
    (weight : ADS.UnitaryIdealWeight K) (shift : ℝ) (x : Kˣ) : ℂ := sorry

/-- ⚠ The carrier is the supplier's `AlgebraicInfinityType`, the integer-exponent subcase
`x ↦ ∏ σ, σ x ^ (n σ)`. A general continuous Hecke character has complex archimedean exponents,
which is `ContinuousInfinityType`, and the finite-order characters of Layer 5 have only signs,
which is `FiniteOrderInfinityType`; the shift is carried separately in either case. -/
noncomputable def grossenArchimedeanFactor
    (infinityType : GNF.AlgebraicInfinityType K) (shift : ℝ) (x : Kˣ) : ℂ := sorry

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
  infinityType : GNF.AlgebraicInfinityType K
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

noncomputable def grossencharacterData
    {𝔪 : GNF.Modulus K} (χ : Grossencharacter K 𝔪) : AnalyticLFunctionData := sorry

/-- The card's completed function is the presentation's, so the polar divisor recorded by the card
is the one that restricts the pointwise functional equation below. -/
theorem grossencharacterData_completed
    {𝔪 : GNF.Modulus K} (χ : Grossencharacter K 𝔪) :
    (grossencharacterData K χ).completed = Grossencharacter.completed K χ := sorry

/-- ⚠ A norm twist `N ^ (iu)` has poles at `iu` and `1 + iu`, so the values on the two sides are
junk there; the pointwise equation carries the polar-divisor hypotheses of both cards, and the
germ equality below carries none. -/
theorem Grossencharacter.completed_one_sub
    {𝔪 : GNF.Modulus K} (χ : Grossencharacter K 𝔪) (s : ℂ)
    (hs : (grossencharacterData K χ).polarOrder s = 0)
    (hs' : (grossencharacterData K (Grossencharacter.inverse K χ)).polarOrder (1 - s) = 0) :
    Grossencharacter.completed K χ s = Grossencharacter.rootNumber K χ *
      Grossencharacter.completed K (Grossencharacter.inverse K χ) (1 - s) := sorry

theorem Grossencharacter.completed_one_sub_eventuallyEq
    {𝔪 : GNF.Modulus K} (χ : Grossencharacter K 𝔪) (s : ℂ) :
    Grossencharacter.completed K χ =ᶠ[𝓝[≠] s]
      fun z ↦ Grossencharacter.rootNumber K χ *
        Grossencharacter.completed K (Grossencharacter.inverse K χ) (1 - z) := sorry

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

/-- Hecke's angular characters of `ℚ(i)`: `𝔞 = (α) ↦ (α / |α|) ^ (4k)`, of infinite order for
`k ≠ 0`, unramified, and unitary. Its algebraic infinity type has exponent `2k` at one embedding
and `-2k` at the conjugate embedding. -/
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
