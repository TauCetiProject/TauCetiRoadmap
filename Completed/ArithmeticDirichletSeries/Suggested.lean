import Mathlib
import TauCeti.Analysis.SpecialFunctions.LogIntegral
import TauCeti.NumberTheory.ArithmeticDirichletSeries.AbelSummation
import TauCeti.NumberTheory.ArithmeticDirichletSeries.Basic
import TauCeti.NumberTheory.ArithmeticDirichletSeries.Cancellation
import TauCeti.NumberTheory.ArithmeticDirichletSeries.Convolution
import TauCeti.NumberTheory.ArithmeticDirichletSeries.Counting
import TauCeti.NumberTheory.ArithmeticDirichletSeries.DirichletDensity.Basic
import TauCeti.NumberTheory.ArithmeticDirichletSeries.DirichletDensity.Negligible
import TauCeti.NumberTheory.ArithmeticDirichletSeries.Estimates
import TauCeti.NumberTheory.ArithmeticDirichletSeries.EulerProduct.Analytic
import TauCeti.NumberTheory.ArithmeticDirichletSeries.EulerProduct.Basic
import TauCeti.NumberTheory.ArithmeticDirichletSeries.EulerProduct.Data
import TauCeti.NumberTheory.ArithmeticDirichletSeries.EulerProduct.Logarithm.Data
import TauCeti.NumberTheory.ArithmeticDirichletSeries.EulerProduct.Logarithm.Expansion
import TauCeti.NumberTheory.ArithmeticDirichletSeries.EulerProduct.Logarithm.VonMangoldtCoeff
import TauCeti.NumberTheory.ArithmeticDirichletSeries.HigherPrimePowers
import TauCeti.NumberTheory.ArithmeticDirichletSeries.Moebius
import TauCeti.NumberTheory.ArithmeticDirichletSeries.NaturalDensity
import TauCeti.NumberTheory.ArithmeticDirichletSeries.NormCoeff
import TauCeti.NumberTheory.ArithmeticDirichletSeries.Perron.Basic
import TauCeti.NumberTheory.ArithmeticDirichletSeries.Perron.Formula
import TauCeti.NumberTheory.ArithmeticDirichletSeries.Perron.Ideal
import TauCeti.NumberTheory.ArithmeticDirichletSeries.Prime.Boundary
import TauCeti.NumberTheory.ArithmeticDirichletSeries.Prime.Contraction
import TauCeti.NumberTheory.ArithmeticDirichletSeries.Prime.IdealZetaSum
import TauCeti.NumberTheory.ArithmeticDirichletSeries.Prime.Psi
import TauCeti.NumberTheory.ArithmeticDirichletSeries.Regroup
import TauCeti.NumberTheory.ArithmeticDirichletSeries.ResidueDegree
import TauCeti.NumberTheory.ArithmeticDirichletSeries.ResidueDegree.NaturalDensity
import TauCeti.NumberTheory.ArithmeticDirichletSeries.Stieltjes
import TauCeti.NumberTheory.ArithmeticDirichletSeries.Transfer
import TauCeti.NumberTheory.ArithmeticDirichletSeries.Trivial
import TauCeti.NumberTheory.ArithmeticDirichletSeries.VonMangoldt
import TauCeti.NumberTheory.ArithmeticDirichletSeries.Weight
import TauCeti.NumberTheory.LFunctions.PrimeIdealBoundary
import TauCeti.NumberTheory.LSeries.Convergence
import TauCeti.NumberTheory.LSeries.Landau
import TauCeti.NumberTheory.LSeries.Nonvanishing
import TauCeti.NumberTheory.LSeries.ThreeFourOne
import TauCeti.NumberTheory.LSeries.WienerIkehara.Ordered
import TauCeti.NumberTheory.LSeries.WienerIkehara.SharpCutoff
import TauCeti.NumberTheory.LSeries.WienerIkehara.Variants
import TauCeti.NumberTheory.NumberField.DirichletDensityBounds
import TauCeti.NumberTheory.NumberField.Global.HeckeCharacter.Conductor
import TauCeti.NumberTheory.NumberField.Global.HeckeCharacter.Weight
import TauCeti.NumberTheory.NumberField.WorkedExamples.GaussianRationals.NormCoeff
import TauCeti.Order.Northcott.Basic

/-!
# Arithmetic Dirichlet series and Tauberian methods: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is `README.md`.
The statements here suggest Lean forms for the milestones, so that contributors and reviewers
converge on names and signatures; discharging all of them finishes neither a layer nor the roadmap.

Every milestone of `README.md` has a statement here, in the form the roadmap asks for, closed by
the Tau Ceti declaration that realizes it, so the correspondence is checked by the Lean kernel
rather than asserted in prose. Every statement is proved. That is evidence for completion, not
its criterion: completion is judged by a milestone-by-milestone audit against `README.md`, which
a fully proved file of suggested forms cannot replace.

The earlier version of this file proposed local stand-ins for the carriers, the counting functions
and the transfer theorems, and left them unproved. They now live in Tau Ceti, so the statements
below are made about the Tau Ceti objects. Four names stay in this namespace, at the end of the
file, as abbreviations of the Tau Ceti objects, because `Chebotarev/Suggested.lean` imports them:
`MultiplicativeIdealWeight`, `primeTheta`, `primePsi` and `HasNaturalDensity`.

Deliberate differences from the README and from the earlier proposals:

* `EulerProductData K` bundles an ideal arithmetic function with its coprime multiplicativity and
  stores nothing else. The local power series and local factors are derived from the function
  (`localPowerSeries`, `localArithmeticFactor`), the transport through `normCoeff` is the theorem
  `normCoeff_eq_eulerProduct`, and there is no finite bad set: a bad set with no prescribed shape
  for the good factors would constrain nothing. The archived README records this in a note to
  Layer 3.1.
* The prime-power logarithmic expansion and the von Mangoldt coefficient identity (README 2.3 and
  3.4) are proved at `s` with `σ < Re s`, where `σ` is a point of absolute convergence and every
  local power series is zero-free on the disc of radius `N(𝔭)^{-σ}`. This is necessary: the Euler
  product with the single factor `1 + 2 · 2^{-s}` converges absolutely everywhere and is zero-free
  near `s = 0`, but its prime-power logarithmic series diverges there. The holomorphic logarithm on
  a simply connected zero-free region of absolute convergence is the separate theorem
  `exists_differentiableOn_exp_eq_LSeries`. The archived README carries an erratum to both items.
* Modifying a weight on a finite set changes its summatory function eventually by the constant
  `∑ i ∈ u, (w₁ i - w₂ i)` (`eventually_summatory_sub_eq`), not by nothing; the archived README
  carries an erratum to Layer 4.2.
* The fibre-count transfer (README 7.4) assumes in addition that the map preserves absolute norms
  off the exception and does not increase them on it, and that the fibres over the exception are
  uniformly bounded. Without norm preservation constant fibres say nothing about prime sums, and
  local finiteness alone does not make the preimage of a density-zero set negligible. The archived
  README carries an erratum to Layer 7.4.
* `idealCount_linearBounds` is the theorem `Nonempty (IdealCountingLinearBounds K)` rather than a
  chosen package.
* `PrimeBoundaryRemainder` keeps `series` and `remainder` only on `Re s > 1` and `Re s ≥ 1`
  (`ofFunctions` builds it from total `F` and `G`), and `0 ≤ δ` is the theorem
  `PrimeBoundaryRemainder.nonneg` rather than a field. The transfer theorems return
  `ψ - δx = o(x)`, `ϑ - δx = o(x)` and `π - δ Li = o(x / log x)`, which include `δ = 0` and give
  the ratio forms.
* `landau` and the Wiener–Ikehara theorems live in `TauCeti.LSeries`. `wienerIkehara` needs no
  `0 ≤ κ`, and the truncated Perron estimates need `T > 0` rather than `T ≥ 1`.
* The pointwise square of a unitary weight is `χ ^ 2` in its `CommMonoid` structure, and the
  imaginary twist is `UnitaryIdealWeight.normTwist z hz` with `hz : z.re = 0`.
* The natural-to-Dirichlet bridge carries no all-prime denominator hypothesis, because Layer 7.2
  proves that normalization unconditionally (README 7.3 allows the theorem supplying it).
* The layers are spread over `ArithmeticDirichletSeries/`, `LSeries/`, `NumberField/` and
  `LFunctions/` in Tau Ceti, with no `Basic.lean` export hub; the README only suggests a home.

Three neighbouring items are not milestones of this README and are left out: nonvanishing on
`Re s = 1` at the pole of `L(χ², ·)` (at `s = 1` for quadratic `χ`), which needs the
character-specific continuation the README assigns to `LFunctions`; the ownership of the boundary
export `TauCeti.LFunctions.primeIdealVonMangoldtBoundary`, which Tau Ceti provides and worked
example 6 uses, and which is a question for the `LFunctions` roadmap; and Wiener–Ikehara for
coefficients in an infinite-dimensional ordered space. Layer 9.2 asks for coefficients in an
ordered real normed algebra "when the proof permits it"; the available theorem
`wienerIkehara_of_forall_monotone_dual` covers finite-dimensional ordered real normed spaces with
closed positive cone, and those two restrictions are its own, not the README's.
-/

namespace TauCetiRoadmap.ArithmeticDirichletSeries

open TauCeti Complex Filter NumberField Topology Asymptotics
open IsDedekindDomain (HeightOneSpectrum)
open scoped nonZeroDivisors ComplexOrder

noncomputable section

variable {K : Type*} [Field K] [NumberField K]

/-! ## Layer 0: arithmetic functions on nonzero ideals -/

section Layer0

/-- **0.1 The general carrier** is a complex-valued function on the nonzero integral ideals. -/
example : IdealArithmeticFunction K = ((Ideal (𝓞 K))⁰ → ℂ) := rfl

omit [NumberField K] in
/-- The canonical zero extension agrees with `f` on nonzero ideals and is `0` at `⊥`. -/
theorem zeroExtend_coe (f : IdealArithmeticFunction K) (I : (Ideal (𝓞 K))⁰) :
    f.zeroExtend I = f I :=
  IdealArithmeticFunction.zeroExtend_coe f I

omit [NumberField K] in
theorem zeroExtend_bot (f : IdealArithmeticFunction K) : f.zeroExtend ⊥ = 0 :=
  IdealArithmeticFunction.zeroExtend_bot f

omit [NumberField K] in
/-- The zero extension vanishes exactly at `⊥` when the original function has no zero values. -/
theorem zeroExtend_eq_zero_iff (f : IdealArithmeticFunction K) (hf : ∀ I, f I ≠ 0)
    {I : Ideal (𝓞 K)} : f.zeroExtend I = 0 ↔ I = ⊥ :=
  IdealArithmeticFunction.zeroExtend_eq_zero_iff f hf

omit [NumberField K] in
/-- A function on all ideals vanishing at `⊥` is the zero extension of exactly one ideal
arithmetic function. -/
theorem existsUnique_zeroExtend_eq {g : Ideal (𝓞 K) → ℂ} (hg : g ⊥ = 0) :
    ∃! f : IdealArithmeticFunction K, f.zeroExtend = g :=
  IdealArithmeticFunction.existsUnique_zeroExtend_eq hg

/-- **0.2 Completely multiplicative weights** are Mathlib `→*₀` maps on all integral ideals. -/
example (χ : TauCeti.MultiplicativeIdealWeight K) : Ideal (𝓞 K) →*₀ ℂ := χ.toMonoidWithZeroHom

/-- A multiplicative ideal weight kills only finitely many height-one primes. -/
theorem finite_badPrimes (χ : TauCeti.MultiplicativeIdealWeight K) :
    {𝔭 : HeightOneSpectrum (𝓞 K) | χ 𝔭.asIdeal = 0}.Finite :=
  χ.finite_badPrimes

/-- The zero-ideal law is inherited from `map_zero`. -/
theorem multiplicativeIdealWeight_apply_bot (χ : TauCeti.MultiplicativeIdealWeight K) :
    χ ⊥ = 0 :=
  map_zero χ

/-- The carrier is degree one: the value at a prime power is forced by the value at the prime. -/
theorem multiplicativeIdealWeight_apply_pow (χ : TauCeti.MultiplicativeIdealWeight K)
    (𝔭 : HeightOneSpectrum (𝓞 K)) (n : ℕ) : χ (𝔭.asIdeal ^ n) = χ 𝔭.asIdeal ^ n :=
  map_pow χ _ n

/-- `UnitaryIdealWeight` is the subtype of unit modulus away from the bad primes. -/
example : UnitaryIdealWeight K =
    {χ : TauCeti.MultiplicativeIdealWeight K //
      ∀ 𝔭 : HeightOneSpectrum (𝓞 K), 𝔭 ∉ χ.badPrimes → ‖χ 𝔭.asIdeal‖ = 1} :=
  rfl

/-- A unitary weight has modulus one at every good ideal. -/
theorem unitaryIdealWeight_norm_eq_one (χ : UnitaryIdealWeight K) {I : Ideal (𝓞 K)}
    (hI : χ.1.IsGood I) : ‖χ.1 I‖ = 1 :=
  UnitaryIdealWeight.norm_eq_one χ hI

/-- **0.3 Constructors.** The trivial weight is the indicator of the nonzero ideals and has no bad
primes. -/
theorem multiplicativeIdealWeight_one_apply (I : Ideal (𝓞 K)) :
    (1 : TauCeti.MultiplicativeIdealWeight K) I = if I = ⊥ then 0 else 1 :=
  MultiplicativeIdealWeight.one_apply I

theorem multiplicativeIdealWeight_badPrimes_one :
    (1 : TauCeti.MultiplicativeIdealWeight K).badPrimes = ∅ :=
  MultiplicativeIdealWeight.badPrimes_one

/-- Conjugation and pointwise product are computed pointwise. -/
theorem multiplicativeIdealWeight_conj_apply (χ : TauCeti.MultiplicativeIdealWeight K)
    (I : Ideal (𝓞 K)) : χ.conj I = starRingEnd ℂ (χ I) :=
  MultiplicativeIdealWeight.conj_apply χ I

theorem multiplicativeIdealWeight_mul_apply (χ ψ : TauCeti.MultiplicativeIdealWeight K)
    (I : Ideal (𝓞 K)) : (χ * ψ) I = χ I * ψ I :=
  MultiplicativeIdealWeight.mul_apply χ ψ I

open scoped Classical in
/-- Restriction away from a finite set of primes kills the ideals not prime to it. -/
theorem multiplicativeIdealWeight_restrict_apply (χ : TauCeti.MultiplicativeIdealWeight K)
    {S : Set (HeightOneSpectrum (𝓞 K))} (hS : S.Finite) (I : Ideal (𝓞 K)) :
    χ.restrict S hS I = if Ideal.IsPrimeTo I S then χ I else 0 :=
  MultiplicativeIdealWeight.restrict_apply χ hS I

/-- An arbitrary complex norm twist `I ↦ χ(I) N(I)^{-z}` lands in the general carrier. -/
theorem multiplicativeIdealWeight_normTwist_apply (z : ℂ)
    (χ : TauCeti.MultiplicativeIdealWeight K) (I : Ideal (𝓞 K)) :
    MultiplicativeIdealWeight.normTwist z χ I = χ I * (Ideal.absNorm I : ℂ) ^ (-z) :=
  MultiplicativeIdealWeight.normTwist_apply z χ I

/-- A purely imaginary twist of a unitary weight is unitary, with the same underlying weight as the
general twist. -/
example (z : ℂ) (hz : z.re = 0) (χ : UnitaryIdealWeight K) :
    (UnitaryIdealWeight.normTwist z hz χ).1 = MultiplicativeIdealWeight.normTwist z χ.1 :=
  rfl

/-- A finite-order weight, one with a positive power equal to `1` at every good prime, is
unitary. -/
example (χ : TauCeti.MultiplicativeIdealWeight K) {n : ℕ} (hn : n ≠ 0)
    (h : ∀ 𝔭 : HeightOneSpectrum (𝓞 K), 𝔭 ∉ χ.badPrimes → χ 𝔭.asIdeal ^ n = 1) :
    (UnitaryIdealWeight.ofPowEqOne χ hn h).1 = χ :=
  rfl

/-- **Finite-order Hecke characters land in `UnitaryIdealWeight`.** A finite-order Hecke
character comes from a ray class character of its conductor, and its unitary ideal weight there
has the finite primes of the conductor as bad primes and, on every ideal prime to the conductor,
the value of the representing ray class character. -/
theorem heckeCharacter_toUnitaryIdealWeightAt_conductor
    (χ : GlobalNumberFields.HeckeCharacter K) (hχ : χ.IsFiniteOrder) :
    let 𝔣 := χ.conductor hχ
    let h𝔣 := GlobalNumberFields.HeckeCharacter.mem_range_ofRayClassCharacter_conductor hχ
    (χ.toUnitaryIdealWeightAt 𝔣 h𝔣).1.badPrimes = 𝔣.support ∧
      ∀ {I : Ideal (𝓞 K)} (hI : Ideal.IsPrimeTo I 𝔣.support),
        (χ.toUnitaryIdealWeightAt 𝔣 h𝔣).1 I =
          ((χ.rayClassCharacterAt 𝔣 h𝔣).onIdeals ⟨I,
            NumberFieldArithmetic.mem_integralIdealsAway_iff.mpr
              (Ideal.isPrimeTo_iff.mp hI)⟩ : ℂ) := by
  intro 𝔣 h𝔣
  rw [GlobalNumberFields.HeckeCharacter.val_toUnitaryIdealWeightAt]
  exact ⟨GlobalNumberFields.RayClassCharacter.badPrimes_toMultiplicativeIdealWeight _,
    fun hI ↦ GlobalNumberFields.RayClassCharacter.toMultiplicativeIdealWeight_apply_of_isPrimeTo
      _ hI⟩

/-- The unitary trivial weight, conjugation, product and restriction are those of the general
carrier. -/
example : (1 : UnitaryIdealWeight K).1 = 1 := rfl

example (χ ψ : UnitaryIdealWeight K) : (χ * ψ).1 = χ.1 * ψ.1 := rfl

example (χ : UnitaryIdealWeight K) : (UnitaryIdealWeight.conj χ).1 = χ.1.conj := rfl

example (χ : UnitaryIdealWeight K) (S : Set (HeightOneSpectrum (𝓞 K))) (hS : S.Finite) :
    (UnitaryIdealWeight.restrict χ S hS).1 = χ.1.restrict S hS :=
  rfl

/-- Both carriers map to `IdealArithmeticFunction` by restriction to the nonzero ideals. -/
theorem multiplicativeIdealWeight_toIdealArithmeticFunction_apply
    (χ : TauCeti.MultiplicativeIdealWeight K) (I : (Ideal (𝓞 K))⁰) :
    χ.toIdealArithmeticFunction I = χ I :=
  MultiplicativeIdealWeight.toIdealArithmeticFunction_apply χ I

theorem unitaryIdealWeight_toIdealArithmeticFunction_eq (χ : UnitaryIdealWeight K) :
    UnitaryIdealWeight.toIdealArithmeticFunction χ = χ.1.toIdealArithmeticFunction :=
  UnitaryIdealWeight.toIdealArithmeticFunction_eq_val χ

section Transport

variable {L M : Type*} [Field L] [NumberField L] [Field M] [NumberField M]

/-- **Field functoriality.** A ring isomorphism `K ≃+* L` transports weights by pulling ideals
back along the induced isomorphism of rings of integers, compatibly with composition and with the
map to the general carrier. -/
theorem multiplicativeIdealWeight_map_apply (e : K ≃+* L)
    (χ : TauCeti.MultiplicativeIdealWeight K) (I : Ideal (𝓞 L)) :
    MultiplicativeIdealWeight.map e χ I = χ (Ideal.comap (RingOfIntegers.mapRingEquiv e) I) :=
  MultiplicativeIdealWeight.map_apply e χ I

theorem multiplicativeIdealWeight_map_map (e : K ≃+* L) (e' : L ≃+* M)
    (χ : TauCeti.MultiplicativeIdealWeight K) :
    MultiplicativeIdealWeight.map e' (MultiplicativeIdealWeight.map e χ) =
      MultiplicativeIdealWeight.map (e.trans e') χ :=
  MultiplicativeIdealWeight.map_map e e' χ

theorem multiplicativeIdealWeight_toIdealArithmeticFunction_map (e : K ≃+* L)
    (χ : TauCeti.MultiplicativeIdealWeight K) :
    (MultiplicativeIdealWeight.map e χ).toIdealArithmeticFunction =
      IdealArithmeticFunction.map e χ.toIdealArithmeticFunction :=
  MultiplicativeIdealWeight.toIdealArithmeticFunction_map e χ

example (e : K ≃+* L) :
    TauCeti.MultiplicativeIdealWeight K ≃* TauCeti.MultiplicativeIdealWeight L :=
  MultiplicativeIdealWeight.mapEquiv e

example (e : K ≃+* L) : UnitaryIdealWeight K ≃* UnitaryIdealWeight L :=
  UnitaryIdealWeight.mapEquiv e

theorem unitaryIdealWeight_val_map (e : K ≃+* L) (χ : UnitaryIdealWeight K) :
    (UnitaryIdealWeight.map e χ).1 = MultiplicativeIdealWeight.map e χ.1 :=
  UnitaryIdealWeight.val_map e χ

example (e : K ≃+* L) : IdealArithmeticFunction K ≃ IdealArithmeticFunction L :=
  IdealArithmeticFunction.mapEquiv e

end Transport

/-- Pointwise multiplication is kept separate from ideal convolution: they differ already on the
constant function `1`. -/
theorem convolution_one_one_ne_mul :
    IdealArithmeticFunction.convolution (1 : IdealArithmeticFunction K) 1 ≠
      (1 : IdealArithmeticFunction K) * 1 :=
  IdealArithmeticFunction.convolution_one_one_ne_mul

omit [NumberField K] in
/-- **0.4 Zero-ideal rejection.** The everywhere-one function on all ideals is not a zero
extension, and it underlies neither weight carrier. -/
theorem not_exists_zeroExtend_eq_one :
    ¬ ∃ f : IdealArithmeticFunction K, f.zeroExtend = (1 : Ideal (𝓞 K) → ℂ) :=
  IdealArithmeticFunction.not_exists_zeroExtend_eq_one

theorem multiplicativeIdealWeight_ne_const_one (χ : TauCeti.MultiplicativeIdealWeight K) :
    ⇑χ ≠ Function.const _ 1 :=
  χ.coe_ne_const_one

theorem unitaryIdealWeight_ne_const_one (χ : UnitaryIdealWeight K) :
    ⇑χ.1 ≠ Function.const _ 1 :=
  χ.1.coe_ne_const_one

/-- On a good ideal, the twist of a unitary weight by `N^{-z}` has modulus `N(I)^{-Re z}`. -/
theorem norm_normTwist (χ : UnitaryIdealWeight K) (z : ℂ) {I : Ideal (𝓞 K)}
    (hI : χ.1.IsGood I) :
    ‖MultiplicativeIdealWeight.normTwist z χ.1 I‖ = (Ideal.absNorm I : ℝ) ^ (-z.re) :=
  UnitaryIdealWeight.norm_normTwist χ z hI

/-- **Rejection test.** If `Re z ≠ 0`, the twist fails the unitary modulus condition at every good
ideal of norm greater than one. -/
theorem norm_normTwist_apply_ne_one (χ : UnitaryIdealWeight K) {z : ℂ} (hz : z.re ≠ 0)
    {I : Ideal (𝓞 K)} (hI : χ.1.IsGood I) (hN : 1 < Ideal.absNorm I) :
    ‖MultiplicativeIdealWeight.normTwist z χ.1 I‖ ≠ 1 :=
  UnitaryIdealWeight.norm_normTwist_apply_ne_one χ hz hI hN

end Layer0

/-! ## Layer 1: norm fibres and Mathlib `LSeries` -/

section Layer1

/-- **1.1** `normCoeff f` is the Mathlib arithmetic function whose `n`-th coefficient is the sum of
`f` over the finite fibre of nonzero ideals of absolute norm `n`. -/
example : IdealArithmeticFunction K →ₗ[ℂ] ArithmeticFunction ℂ := normCoeff K

theorem normCoeff_eq_sum_normFiber (f : IdealArithmeticFunction K) (n : ℕ) :
    normCoeff K f n = ∑ I ∈ normFiber K n, f I :=
  TauCeti.normCoeff_eq_sum_normFiber K f n

theorem mem_normFiber {I : (Ideal (𝓞 K))⁰} {n : ℕ} :
    I ∈ normFiber K n ↔ Ideal.absNorm (I : Ideal (𝓞 K)) = n :=
  TauCeti.mem_normFiber K

theorem normCoeff_apply_zero (f : IdealArithmeticFunction K) : normCoeff K f 0 = 0 :=
  ArithmeticFunction.map_zero

theorem normCoeff_apply_one (f : IdealArithmeticFunction K) : normCoeff K f 1 = f 1 :=
  TauCeti.normCoeff_apply_one K f

theorem normCoeff_star_apply (f : IdealArithmeticFunction K) (n : ℕ) :
    normCoeff K (fun I ↦ starRingEnd ℂ (f I)) n = star (normCoeff K f n) :=
  TauCeti.normCoeff_star_apply K f n

/-- General norm twists multiply the `n`-th coefficient by `n^{-z}`, in the general carrier and,
for `Re z = 0`, in the unitary one. -/
theorem normCoeff_normTwist (z : ℂ) (χ : TauCeti.MultiplicativeIdealWeight K) (n : ℕ) :
    normCoeff K (MultiplicativeIdealWeight.normTwist z χ).toIdealArithmeticFunction n =
      normCoeff K χ.toIdealArithmeticFunction n * (n : ℂ) ^ (-z) :=
  MultiplicativeIdealWeight.normCoeff_normTwist z χ n

theorem normCoeff_unitary_normTwist (z : ℂ) (hz : z.re = 0) (χ : UnitaryIdealWeight K)
    (n : ℕ) :
    normCoeff K (UnitaryIdealWeight.toIdealArithmeticFunction
        (UnitaryIdealWeight.normTwist z hz χ)) n =
      normCoeff K (UnitaryIdealWeight.toIdealArithmeticFunction χ) n * (n : ℂ) ^ (-z) :=
  UnitaryIdealWeight.normCoeff_normTwist z hz χ n

theorem normCoeff_map {L : Type*} [Field L] [NumberField L] (e : K ≃+* L)
    (f : IdealArithmeticFunction K) (n : ℕ) :
    normCoeff L (IdealArithmeticFunction.map e f) n = normCoeff K f n :=
  TauCeti.normCoeff_map K e f n

/-- **No pointwise-product formula.** Over `ℚ(i)` there are two ideals of norm `5`, so the
coefficient of `1 * 1` at `5` is `2`, while the pointwise product of the coefficients is `4`. -/
theorem normCoeff_one_mul_one_five {θ : 𝓞 K} (hmin : minpoly ℤ θ = Polynomial.X ^ 2 + 1)
    (hgen : Algebra.adjoin ℚ {(θ : K)} = ⊤) :
    normCoeff K ((1 : IdealArithmeticFunction K) * 1) 5 = 2 ∧
      (normCoeff K (1 : IdealArithmeticFunction K)).pmul
        (normCoeff K (1 : IdealArithmeticFunction K)) 5 = 4 := by
  have h5 := TauCeti.normCoeff_one_apply K 5
  rw [TauCeti.NumberField.GaussianRationals.dedekindZetaCoeff_five hmin hgen] at h5
  refine ⟨by rw [mul_one, h5]; norm_num, ?_⟩
  rw [ArithmeticFunction.pmul_apply, h5]
  norm_num

theorem not_forall_normCoeff_mul_eq_pmul {n : ℕ} (hn : 1 < dedekindZetaCoeff K n) :
    ¬ ∀ f g : IdealArithmeticFunction K,
      normCoeff K (f * g) = (normCoeff K f).pmul (normCoeff K g) :=
  TauCeti.not_forall_normCoeff_mul_eq_pmul K hn

/-- **1.2 Regrouping.** Absolute convergence of the ideal-indexed series gives the norm-regrouped
`LSeries` with the same sum. -/
theorem regroupByNorm (f : IdealArithmeticFunction K) {s L : ℂ}
    (h : HasSum (fun I : (Ideal (𝓞 K))⁰ ↦ f I / (Ideal.absNorm (I : Ideal (𝓞 K)) : ℂ) ^ s) L) :
    LSeriesHasSum (normCoeff K f) s L :=
  TauCeti.regroupByNorm K h

/-- The grouped absolute-convergence abscissa is at most the ideal-indexed one. -/
theorem abscissaOfAbsConv_normCoeff_le (f : IdealArithmeticFunction K) :
    LSeries.abscissaOfAbsConv (normCoeff K f) ≤ idealAbscissaOfAbsConv K f :=
  TauCeti.abscissaOfAbsConv_normCoeff_le K f

example (f : IdealArithmeticFunction K) :
    idealAbscissaOfAbsConv K f =
      sInf (Real.toEReal '' {x : ℝ | Summable fun I : (Ideal (𝓞 K))⁰ ↦
        f I / (Ideal.absNorm (I : Ideal (𝓞 K)) : ℂ) ^ (x : ℂ)}) :=
  idealAbscissaOfAbsConv_def K f

/-- The converse needs nonnegativity of every individual ideal summand. -/
theorem summable_idealTerm_of_nonneg (f : IdealArithmeticFunction K) (hf : ∀ I, 0 ≤ f I)
    {s : ℂ} (h : LSeriesSummable (normCoeff K f) s) :
    Summable fun I : (Ideal (𝓞 K))⁰ ↦ f I / (Ideal.absNorm (I : Ideal (𝓞 K)) : ℂ) ^ s :=
  TauCeti.summable_idealTerm_of_nonneg K f hf h

theorem idealAbscissaOfAbsConv_eq_abscissaOfAbsConv (f : IdealArithmeticFunction K)
    (hf : ∀ I, 0 ≤ f I) :
    idealAbscissaOfAbsConv K f = LSeries.abscissaOfAbsConv (normCoeff K f) :=
  TauCeti.idealAbscissaOfAbsConv_eq_abscissaOfAbsConv K f hf

/-- **1.3 The trivial specialization.** The trivial unitary weight regroups to the Dedekind-zeta
coefficient, the number of integral ideals of norm `n`, away from the zero slot. -/
example (n : ℕ) : dedekindZetaCoeff K n = Nat.card {I : Ideal (𝓞 K) // Ideal.absNorm I = n} :=
  rfl

theorem normCoeff_trivial_apply (n : ℕ) :
    normCoeff K (UnitaryIdealWeight.toIdealArithmeticFunction (1 : UnitaryIdealWeight K)) n =
      if n = 0 then 0 else dedekindZetaCoeff K n :=
  TauCeti.normCoeff_toIdealArithmeticFunction_one_apply K n

theorem dedekindZeta_eq_LSeries_normCoeff_one (s : ℂ) :
    dedekindZeta K s = LSeries (normCoeff K (1 : IdealArithmeticFunction K)) s :=
  TauCeti.dedekindZeta_eq_LSeries_normCoeff_one K s

/-- At `K = ℚ` the coefficient is `1` for every positive integer. -/
theorem normCoeff_trivial_rat_apply {n : ℕ} (hn : 0 < n) :
    normCoeff ℚ (UnitaryIdealWeight.toIdealArithmeticFunction (1 : UnitaryIdealWeight ℚ)) n = 1 :=
  TauCeti.normCoeff_toIdealArithmeticFunction_one_rat_apply hn

end Layer1

/-! ## Layer 2: convolution and logarithmic derivatives -/

section Layer2

open IdealArithmeticFunction

/-- **2.1 Ideal convolution** sums over the finite factorizations `BC = A` of a nonzero ideal. -/
theorem convolution_apply (f g : IdealArithmeticFunction K) (A : (Ideal (𝓞 K))⁰) :
    f.convolution g A = ∑ p ∈ TauCeti.Ideal.divisorsAntidiagonal A, f p.1 * g p.2 :=
  IdealArithmeticFunction.convolution_apply f g A

theorem mem_divisorsAntidiagonal {A : (Ideal (𝓞 K))⁰} {p : (Ideal (𝓞 K))⁰ × (Ideal (𝓞 K))⁰} :
    p ∈ TauCeti.Ideal.divisorsAntidiagonal A ↔ p.1 * p.2 = A :=
  TauCeti.Ideal.mem_divisorsAntidiagonal

theorem convolution_comm (f g : IdealArithmeticFunction K) :
    f.convolution g = g.convolution f :=
  IdealArithmeticFunction.convolution_comm f g

theorem convolution_assoc (f g h : IdealArithmeticFunction K) :
    (f.convolution g).convolution h = f.convolution (g.convolution h) :=
  IdealArithmeticFunction.convolution_assoc f g h

theorem delta_convolution (f : IdealArithmeticFunction K) : delta.convolution f = f :=
  IdealArithmeticFunction.delta_convolution f

omit [NumberField K] in
theorem delta_one : (delta : IdealArithmeticFunction K) 1 = 1 :=
  IdealArithmeticFunction.delta_one

omit [NumberField K] in
theorem delta_of_ne_one {A : (Ideal (𝓞 K))⁰} (hA : A ≠ 1) :
    (delta : IdealArithmeticFunction K) A = 0 :=
  IdealArithmeticFunction.delta_of_ne_one hA

theorem convolution_add (f g h : IdealArithmeticFunction K) :
    f.convolution (g + h) = f.convolution g + f.convolution h :=
  IdealArithmeticFunction.convolution_add f g h

theorem convolution_smul (c : ℂ) (f g : IdealArithmeticFunction K) :
    f.convolution (c • g) = c • f.convolution g :=
  IdealArithmeticFunction.convolution_smul c f g

theorem convolutionPow_add (f : IdealArithmeticFunction K) (m n : ℕ) :
    f.convolutionPow (m + n) = (f.convolutionPow m).convolution (f.convolutionPow n) :=
  IdealArithmeticFunction.convolutionPow_add f m n

/-- Regrouping turns ideal convolution into Dirichlet convolution in `ArithmeticFunction ℂ`. -/
theorem normCoeff_convolution (f g : IdealArithmeticFunction K) :
    normCoeff K (f.convolution g) = normCoeff K f * normCoeff K g :=
  TauCeti.normCoeff_convolution K f g

theorem normCoeff_convolutionPow (f : IdealArithmeticFunction K) (n : ℕ) :
    normCoeff K (f.convolutionPow n) = normCoeff K f ^ n :=
  TauCeti.normCoeff_convolutionPow K f n

omit [NumberField K] in
/-- Multiplicativity is the coprime condition, weaker than complete multiplicativity. -/
theorem isMultiplicative_iff (f : IdealArithmeticFunction K) :
    f.IsMultiplicative ↔ f 1 = 1 ∧ ∀ I J : (Ideal (𝓞 K))⁰,
      IsRelPrime (I : Ideal (𝓞 K)) (J : Ideal (𝓞 K)) → f (I * J) = f I * f J :=
  ⟨fun h ↦ ⟨h.map_one, fun _ _ hIJ ↦ h.map_mul_of_isRelPrime hIJ⟩,
    fun ⟨h₁, h₂⟩ ↦ ⟨h₁, fun hIJ ↦ h₂ _ _ hIJ⟩⟩

/-- **2.2 Möbius inversion.** The ideal Möbius function takes `-1` at primes and `0` at higher prime
powers. -/
theorem moebius_apply_prime {A : (Ideal (𝓞 K))⁰} (hA : Prime (A : Ideal (𝓞 K))) :
    (moebius : IdealArithmeticFunction K) A = -1 :=
  IdealArithmeticFunction.moebius_apply_prime hA

theorem moebius_apply_prime_pow {A : (Ideal (𝓞 K))⁰} (hA : Prime (A : Ideal (𝓞 K))) {n : ℕ}
    (hn : 2 ≤ n) : (moebius : IdealArithmeticFunction K) (A ^ n) = 0 :=
  IdealArithmeticFunction.moebius_apply_prime_pow hA hn

/-- It is the convolution inverse of the constant function `1` on the nonzero ideals. -/
theorem convolution_moebius_one :
    (moebius : IdealArithmeticFunction K).convolution 1 = delta :=
  IdealArithmeticFunction.convolution_moebius_one

theorem convolution_one_moebius :
    (1 : IdealArithmeticFunction K).convolution moebius = delta :=
  IdealArithmeticFunction.convolution_one_moebius

theorem convolution_one_eq_iff {f g : IdealArithmeticFunction K} :
    f.convolution 1 = g ↔ f = g.convolution moebius :=
  IdealArithmeticFunction.convolution_one_eq_iff

theorem isMultiplicative_moebius : (moebius : IdealArithmeticFunction K).IsMultiplicative :=
  IdealArithmeticFunction.isMultiplicative_moebius

/-- The Möbius function underlies neither ideal-weight carrier. -/
theorem not_exists_multiplicativeIdealWeight_eq_moebius :
    ¬ ∃ χ : TauCeti.MultiplicativeIdealWeight K,
      χ.toIdealArithmeticFunction = (moebius : IdealArithmeticFunction K) :=
  IdealArithmeticFunction.not_exists_multiplicativeIdealWeight_eq_moebius

theorem not_exists_unitaryIdealWeight_eq_moebius :
    ¬ ∃ χ : UnitaryIdealWeight K,
      UnitaryIdealWeight.toIdealArithmeticFunction χ = (moebius : IdealArithmeticFunction K) :=
  IdealArithmeticFunction.not_exists_unitaryIdealWeight_eq_moebius

/-- **2.3 Von Mangoldt.** The ideal von Mangoldt weight is `log N(P)` on every positive power of a
prime `P` and is supported on prime powers. -/
theorem vonMangoldt_apply_prime_pow {P : (Ideal (𝓞 K))⁰} (hP : Prime (P : Ideal (𝓞 K))) {n : ℕ}
    (hn : 0 < n) :
    (vonMangoldt : IdealArithmeticFunction K) (P ^ n) =
      Real.log (Ideal.absNorm (P : Ideal (𝓞 K))) :=
  IdealArithmeticFunction.vonMangoldt_apply_prime_pow hP hn

theorem vonMangoldt_ne_zero_iff {A : (Ideal (𝓞 K))⁰} :
    (vonMangoldt : IdealArithmeticFunction K) A ≠ 0 ↔ IsPrimePow (A : Ideal (𝓞 K)) :=
  IdealArithmeticFunction.vonMangoldt_ne_zero_iff

/-- The transform attached to a function multiplies it by the von Mangoldt weight. -/
theorem vonMangoldtTransform_apply (f : IdealArithmeticFunction K) (A : (Ideal (𝓞 K))⁰) :
    f.vonMangoldtTransform A = f A * vonMangoldt A :=
  IdealArithmeticFunction.vonMangoldtTransform_apply f A

theorem vonMangoldtTransform_ne_zero_iff (f : IdealArithmeticFunction K) {A : (Ideal (𝓞 K))⁰} :
    f.vonMangoldtTransform A ≠ 0 ↔ IsPrimePow (A : Ideal (𝓞 K)) ∧ f A ≠ 0 :=
  IdealArithmeticFunction.vonMangoldtTransform_ne_zero_iff f

/-- The logarithmic derivative of the `L`-series of a weight is minus the ideal series of its von
Mangoldt transform, throughout the half-plane of absolute convergence. -/
theorem logDeriv_LSeries_eq_neg_tsum_vonMangoldtTransform
    (χ : TauCeti.MultiplicativeIdealWeight K) {s : ℂ}
    (hs : idealAbscissaOfAbsConv K χ.toIdealArithmeticFunction < s.re) :
    logDeriv (LSeries (normCoeff K χ.toIdealArithmeticFunction)) s =
      -∑' A : (Ideal (𝓞 K))⁰, χ.toIdealArithmeticFunction.vonMangoldtTransform A /
        (Ideal.absNorm (A : Ideal (𝓞 K)) : ℂ) ^ s :=
  MultiplicativeIdealWeight.logDeriv_LSeries_eq_neg_tsum_vonMangoldtTransform χ hs

end Layer2

/-! ## Layer 3: local factors and Euler products -/

section Layer3

/-- **3.1** Euler-product data on a function exist exactly when the function is coprime
multiplicative: a bare ideal arithmetic function has no Euler product. -/
theorem nonempty_eulerProductData_iff (f : IdealArithmeticFunction K) :
    Nonempty {D : EulerProductData K // D.toIdealArithmeticFunction = f} ↔ f.IsMultiplicative :=
  ⟨fun ⟨D, hD⟩ ↦ hD ▸ D.isMultiplicative, fun h ↦ ⟨⟨⟨f, h⟩, rfl⟩⟩⟩

/-- The local factor at `P` is Mathlib's `ArithmeticFunction.ofPowerSeries` of the local power
series, whose coefficients are the values at the powers of `P`. -/
theorem localArithmeticFactor_def (D : EulerProductData K) (P : HeightOneSpectrum (𝓞 K)) :
    D.localArithmeticFactor P =
      ArithmeticFunction.ofPowerSeries (Ideal.absNorm P.asIdeal) (D.localPowerSeries P) :=
  EulerProductData.localArithmeticFactor_def D P

theorem coeff_localPowerSeries (D : EulerProductData K) (P : HeightOneSpectrum (𝓞 K)) (n : ℕ) :
    PowerSeries.coeff n (D.localPowerSeries P) = D (P.primeIdealPow n) :=
  EulerProductData.coeff_localPowerSeries D P n

/-- The global norm coefficient is Mathlib's `ArithmeticFunction.eulerProduct` of the local
factors. -/
theorem normCoeff_eq_eulerProduct (D : EulerProductData K) :
    normCoeff K D.toIdealArithmeticFunction =
      ArithmeticFunction.eulerProduct D.localArithmeticFactor :=
  EulerProductData.normCoeff_eq_eulerProduct D

/-- Extensionality, restriction, product, conjugation and the weight instances. -/
theorem eulerProductData_ext {D E : EulerProductData K} (h : ∀ I, D I = E I) : D = E :=
  EulerProductData.ext h

open scoped Classical in
theorem restrictAway_apply (D : EulerProductData K) (S : Set (HeightOneSpectrum (𝓞 K)))
    (I : (Ideal (𝓞 K))⁰) :
    D.restrictAway S I = if Ideal.IsPrimeTo (I : Ideal (𝓞 K)) S then D I else 0 :=
  EulerProductData.restrictAway_apply D S I

theorem eulerProductData_mul_apply (D E : EulerProductData K) (I : (Ideal (𝓞 K))⁰) :
    (D * E) I = D I * E I :=
  EulerProductData.mul_apply D E I

theorem eulerProductData_star_apply (D : EulerProductData K) (I : (Ideal (𝓞 K))⁰) :
    (star D) I = star (D I) :=
  EulerProductData.star_apply D I

theorem eulerProductData_one_apply (I : (Ideal (𝓞 K))⁰) : (1 : EulerProductData K) I = 1 :=
  EulerProductData.one_apply I

theorem toIdealArithmeticFunction_ofMultiplicativeIdealWeight
    (χ : TauCeti.MultiplicativeIdealWeight K) :
    (EulerProductData.ofMultiplicativeIdealWeight χ).toIdealArithmeticFunction =
      χ.toIdealArithmeticFunction :=
  EulerProductData.toIdealArithmeticFunction_ofMultiplicativeIdealWeight χ

/-- **3.2 Finite products first.** A multiplicative function factors over the prime-power
factorization of a nonzero ideal. -/
theorem IsMultiplicative.map_prod_pow {f : IdealArithmeticFunction K} (hf : f.IsMultiplicative)
    (S : Finset (HeightOneSpectrum (𝓞 K))) (e : HeightOneSpectrum (𝓞 K) → ℕ)
    (A : (Ideal (𝓞 K))⁰) (hA : (A : Ideal (𝓞 K)) = ∏ P ∈ S, P.asIdeal ^ e P) :
    f A = ∏ P ∈ S, f (P.primeIdealPow (e P)) :=
  hf.map_prod_pow S e A hA

/-- Over a finite set of primes, the part of `f` supported there has norm coefficients equal to
the product of the local factors, and an `LSeries` equal to the product of the local Euler
factors. -/
theorem normCoeff_supportedPart {f : IdealArithmeticFunction K} (hf : f.IsMultiplicative)
    (S : Finset (HeightOneSpectrum (𝓞 K))) :
    normCoeff K (IdealArithmeticFunction.supportedPart f (S : Set (HeightOneSpectrum (𝓞 K)))) =
      ∏ P ∈ S, f.localArithmeticFactor P :=
  IdealArithmeticFunction.normCoeff_supportedPart hf S

theorem LSeries_normCoeff_supportedPart (D : EulerProductData K) {s : ℂ}
    (S : Finset (HeightOneSpectrum (𝓞 K)))
    (hS : ∀ P ∈ S, LSeriesSummable (D.localArithmeticFactor P) s) :
    LSeries (normCoeff K (IdealArithmeticFunction.supportedPart D.toIdealArithmeticFunction
      (S : Set (HeightOneSpectrum (𝓞 K))))) s = ∏ P ∈ S, D.eulerFactor P s :=
  D.LSeries_normCoeff_supportedPart S hS

/-- **3.3 The infinite Euler product.** Under absolute convergence of the ideal-indexed series, the
local Euler factors have an unconditional product over the height-one primes equal to
`LSeries (normCoeff f)`. -/
theorem hasProd_eulerFactor (D : EulerProductData K) {s : ℂ}
    (hs : Summable fun I : (Ideal (𝓞 K))⁰ ↦
      D I / (Ideal.absNorm (I : Ideal (𝓞 K)) : ℂ) ^ s) :
    HasProd (fun P ↦ D.eulerFactor P s) (LSeries (normCoeff K D.toIdealArithmeticFunction) s) :=
  D.hasProd_eulerFactor hs

theorem eulerFactor_def (D : EulerProductData K) (P : HeightOneSpectrum (𝓞 K)) (s : ℂ) :
    D.eulerFactor P s = LSeries (D.localArithmeticFactor P) s :=
  EulerProductData.eulerFactor_def D P s

/-- For a completely multiplicative weight the local factors are geometric. -/
theorem multiplicativeIdealWeight_hasProd_eulerFactor (χ : TauCeti.MultiplicativeIdealWeight K)
    {s : ℂ} (hs : Summable fun I : (Ideal (𝓞 K))⁰ ↦
      χ.toIdealArithmeticFunction I / (Ideal.absNorm (I : Ideal (𝓞 K)) : ℂ) ^ s) :
    HasProd (fun P : HeightOneSpectrum (𝓞 K) ↦
        (1 - χ P.asIdeal / (Ideal.absNorm P.asIdeal : ℂ) ^ s)⁻¹)
      (LSeries (normCoeff K χ.toIdealArithmeticFunction) s) :=
  MultiplicativeIdealWeight.hasProd_eulerFactor χ hs

theorem dedekindZeta_eulerProduct_hasProd {s : ℂ} (hs : 1 < s.re) :
    HasProd (fun P : HeightOneSpectrum (𝓞 K) ↦ (1 - (Ideal.absNorm P.asIdeal : ℂ) ^ (-s))⁻¹)
      (dedekindZeta K s) :=
  TauCeti.dedekindZeta_eulerProduct_hasProd hs

/-- Nonvanishing is stated only where absolute convergence of the product proves it. -/
theorem LSeries_ne_zero_of_summable_idealTerm (χ : TauCeti.MultiplicativeIdealWeight K) {s : ℂ}
    (hs : Summable fun I : (Ideal (𝓞 K))⁰ ↦
      χ.toIdealArithmeticFunction I / (Ideal.absNorm (I : Ideal (𝓞 K)) : ℂ) ^ s) :
    LSeries (normCoeff K χ.toIdealArithmeticFunction) s ≠ 0 :=
  MultiplicativeIdealWeight.LSeries_ne_zero_of_summable_idealTerm χ hs

theorem LSeries_ne_zero_of_forall_eulerFactor_ne_zero (D : EulerProductData K) {s : ℂ}
    (hs : Summable fun I : (Ideal (𝓞 K))⁰ ↦
      D I / (Ideal.absNorm (I : Ideal (𝓞 K)) : ℂ) ^ s)
    (hP : ∀ P : HeightOneSpectrum (𝓞 K), D.eulerFactor P s ≠ 0) :
    LSeries (normCoeff K D.toIdealArithmeticFunction) s ≠ 0 :=
  D.LSeries_ne_zero_of_forall_eulerFactor_ne_zero hs hP

/-- **3.4 Logarithm and derivative.** On a simply connected open set of absolute convergence with
no vanishing local factor there is a holomorphic logarithm of the `L`-series, whose derivative is
the logarithmic derivative. -/
theorem exists_differentiableOn_exp_eq_LSeries (D : EulerProductData K) {U : Set ℂ}
    (hUc : IsSimplyConnected U) (hUo : IsOpen U)
    (hconv : ∀ z ∈ U, Summable fun I : (Ideal (𝓞 K))⁰ ↦
      D I / (Ideal.absNorm (I : Ideal (𝓞 K)) : ℂ) ^ z)
    (hne : ∀ z ∈ U, ∀ P : HeightOneSpectrum (𝓞 K), D.eulerFactor P z ≠ 0) :
    ∃ L : ℂ → ℂ, DifferentiableOn ℂ L U ∧
      Set.EqOn (exp ∘ L) (LSeries (normCoeff K D.toIdealArithmeticFunction)) U ∧
      ∀ z ∈ U, deriv L z = logDeriv (LSeries (normCoeff K D.toIdealArithmeticFunction)) z :=
  D.exists_differentiableOn_exp_eq_LSeries hUc hUo hconv hne

/-- The prime-power expansion of the logarithm, evaluated from the local formal logarithms, and
its derivative. -/
theorem exp_tsum_tsum_coeff_localLogSeries_eq_LSeries_of_zeroFree (D : EulerProductData K)
    {σ : ℝ} {s : ℂ}
    (hσ : Summable fun I : (Ideal (𝓞 K))⁰ ↦
      D I / (Ideal.absNorm (I : Ideal (𝓞 K)) : ℂ) ^ (σ : ℂ))
    (hne : ∀ (P : HeightOneSpectrum (𝓞 K)) (z : ℂ),
      ‖z‖ < ‖(Ideal.absNorm P.asIdeal : ℂ) ^ (-(σ : ℂ))‖ →
        FormalMultilinearSeries.ofScalarsSum (E := ℂ)
          (fun n ↦ PowerSeries.coeff n (D.localPowerSeries P)) z ≠ 0)
    (hs : σ < s.re) :
    Complex.exp (∑' P : HeightOneSpectrum (𝓞 K), ∑' e : ℕ,
        PowerSeries.coeff e (D.localLogSeries P) *
          ((Ideal.absNorm P.asIdeal : ℂ) ^ (-s)) ^ e) =
      LSeries (normCoeff K D.toIdealArithmeticFunction) s :=
  D.exp_tsum_tsum_coeff_localLogSeries_eq_LSeries_of_zeroFree hσ hne hs

theorem deriv_tsum_tsum_coeff_localLogSeries_eq_logDeriv_LSeries_of_zeroFree
    (D : EulerProductData K) {σ : ℝ} {s : ℂ}
    (hσ : Summable fun I : (Ideal (𝓞 K))⁰ ↦
      D I / (Ideal.absNorm (I : Ideal (𝓞 K)) : ℂ) ^ (σ : ℂ))
    (hne : ∀ (P : HeightOneSpectrum (𝓞 K)) (z : ℂ),
      ‖z‖ < ‖(Ideal.absNorm P.asIdeal : ℂ) ^ (-(σ : ℂ))‖ →
        FormalMultilinearSeries.ofScalarsSum (E := ℂ)
          (fun n ↦ PowerSeries.coeff n (D.localPowerSeries P)) z ≠ 0)
    (hs : σ < s.re) :
    deriv (fun s : ℂ ↦ ∑' P : HeightOneSpectrum (𝓞 K), ∑' e : ℕ,
        PowerSeries.coeff e (D.localLogSeries P) *
          ((Ideal.absNorm P.asIdeal : ℂ) ^ (-s)) ^ e) s =
      logDeriv (LSeries (normCoeff K D.toIdealArithmeticFunction)) s :=
  D.deriv_tsum_tsum_coeff_localLogSeries_eq_logDeriv_LSeries_of_zeroFree hσ hne hs

theorem localLogSeries_def (D : EulerProductData K) (P : HeightOneSpectrum (𝓞 K)) :
    D.localLogSeries P = PowerSeries.logOf (D.localPowerSeries P) :=
  EulerProductData.localLogSeries_def D P

/-- The same hypotheses give the von Mangoldt coefficient identity for general Euler-product
data. -/
theorem logDeriv_LSeries_eq_neg_LSeries_normCoeff_vonMangoldt_of_zeroFree
    (D : EulerProductData K) {σ : ℝ} {s : ℂ}
    (hσ : idealAbscissaOfAbsConv K D.toIdealArithmeticFunction < σ)
    (hne : ∀ (P : HeightOneSpectrum (𝓞 K)) (z : ℂ),
      ‖z‖ < ‖(Ideal.absNorm P.asIdeal : ℂ) ^ (-(σ : ℂ))‖ →
        FormalMultilinearSeries.ofScalarsSum (E := ℂ)
          (fun n ↦ PowerSeries.coeff n (D.localPowerSeries P)) z ≠ 0)
    (hs : σ < s.re) :
    logDeriv (LSeries (normCoeff K D.toIdealArithmeticFunction)) s =
      -LSeries (normCoeff K D.vonMangoldt) s :=
  D.logDeriv_LSeries_eq_neg_LSeries_normCoeff_vonMangoldt_of_zeroFree hσ hne hs

end Layer3

/-! ## Layer 4: counting carriers and local finiteness -/

section Layer4

/-- **4.1 Cutoff carriers.** The ideals and the height-one primes of norm at most `x` form finite
sets, packaged as the finsets `idealsLE` and `primesLE`; the cutoff is inclusive. -/
theorem finite_setOf_absNorm_le (x : ℝ) :
    {I : (Ideal (𝓞 K))⁰ | (Ideal.absNorm (I : Ideal (𝓞 K)) : ℝ) ≤ x}.Finite :=
  TauCeti.finite_setOf_absNorm_real_le K x

theorem finite_setOf_absNorm_asIdeal_le (x : ℝ) :
    {v : HeightOneSpectrum (𝓞 K) | (Ideal.absNorm v.asIdeal : ℝ) ≤ x}.Finite :=
  TauCeti.finite_setOf_natCast_le (fun v : HeightOneSpectrum (𝓞 K) ↦ Ideal.absNorm v.asIdeal) x

theorem mem_idealsLE {x : ℝ} {I : (Ideal (𝓞 K))⁰} :
    I ∈ idealsLE K x ↔ (Ideal.absNorm (I : Ideal (𝓞 K)) : ℝ) ≤ x :=
  TauCeti.mem_normLE _

theorem mem_primesLE {x : ℝ} {v : HeightOneSpectrum (𝓞 K)} :
    v ∈ primesLE K x ↔ (Ideal.absNorm v.asIdeal : ℝ) ≤ x :=
  TauCeti.mem_normLE _

theorem idealsLE_mono : Monotone (idealsLE K) := TauCeti.normLE_mono _

theorem primesLE_mono : Monotone (primesLE K) := TauCeti.normLE_mono _

/-- Real and natural cutoffs agree. -/
theorem idealsLE_eq_idealsLE_natFloor {x : ℝ} (hx : 0 ≤ x) :
    idealsLE K x = idealsLE K (⌊x⌋₊ : ℝ) :=
  TauCeti.normLE_eq_normLE_natFloor _ hx

theorem primesLE_eq_primesLE_natFloor {x : ℝ} (hx : 0 ≤ x) :
    primesLE K x = primesLE K (⌊x⌋₊ : ℝ) :=
  TauCeti.normLE_eq_normLE_natFloor _ hx

/-- The small-cutoff cases are empty. -/
theorem idealsLE_eq_empty_of_lt_one {x : ℝ} (hx : x < 1) : idealsLE K x = ∅ :=
  TauCeti.idealsLE_eq_empty_of_lt_one hx

theorem primesLE_eq_empty_of_lt_two {x : ℝ} (hx : x < 2) : primesLE K x = ∅ :=
  TauCeti.primesLE_eq_empty_of_lt_two hx

/-- **4.2 Summatory functions.** The ideal, prime and prime-power summatory functions are the
generic inclusive summatory function of a Northcott norm. -/
example {M : Type*} [AddCommMonoid M] (w : (Ideal (𝓞 K))⁰ → M) (x : ℝ) :
    idealSummatory K w x = ∑ I ∈ idealsLE K x, w I :=
  idealSummatory_apply K w x

example {M : Type*} [AddCommMonoid M] (w : HeightOneSpectrum (𝓞 K) → M) (x : ℝ) :
    primeSummatory K w x = ∑ v ∈ primesLE K x, w v :=
  primeSummatory_apply K w x

example {M : Type*} [AddCommMonoid M] (w : IdealPrimePower K → M) (x : ℝ) :
    primePowerSummatory K w x = ∑ A ∈ primePowersLE K x, w A :=
  primePowerSummatory_apply K w x

section Generic

variable {ι : Type*} (N : ι → ℕ) [Northcott N]

theorem summatory_add {M : Type*} [AddCommMonoid M] (w₁ w₂ : ι → M) (x : ℝ) :
    summatory N (w₁ + w₂) x = summatory N w₁ x + summatory N w₂ x :=
  TauCeti.summatory_add N w₁ w₂ x

theorem summatory_mono {w : ι → ℝ} (hw : ∀ i, 0 ≤ w i) : Monotone (summatory N w) :=
  TauCeti.summatory_mono N hw

/-- Changing a weight on a finite set changes its summatory function by a constant eventually. -/
theorem eventually_summatory_sub_eq {M : Type*} [AddCommGroup M] (w₁ w₂ : ι → M)
    (u : Finset ι) (h : ∀ i ∉ u, w₁ i = w₂ i) :
    ∀ᶠ x in atTop, summatory N w₁ x - summatory N w₂ x = ∑ i ∈ u, (w₁ i - w₂ i) :=
  TauCeti.eventually_summatory_sub_eq N w₁ w₂ u h

end Generic

/-- **4.3 `primeTheta` and `primeCount`** for a set of height-one primes. -/
theorem primeTheta_apply (S : Set (HeightOneSpectrum (𝓞 K))) (x : ℝ) :
    TauCeti.primeTheta K S x =
      ∑ v ∈ primesLE K x, S.indicator (fun v ↦ Real.log (Ideal.absNorm v.asIdeal : ℝ)) v :=
  TauCeti.primeTheta_apply S x

theorem primeCount_eq_card (S : Set (HeightOneSpectrum (𝓞 K))) [DecidablePred (· ∈ S)]
    (x : ℝ) : primeCount K S x = ((primesLE K x).filter (· ∈ S)).card :=
  TauCeti.primeCount_eq_card S x

theorem primeTheta_union {S T : Set (HeightOneSpectrum (𝓞 K))} (hST : Disjoint S T) (x : ℝ) :
    TauCeti.primeTheta K (S ∪ T) x = TauCeti.primeTheta K S x + TauCeti.primeTheta K T x :=
  TauCeti.primeTheta_union hST x

theorem primeCount_union {S T : Set (HeightOneSpectrum (𝓞 K))} (hST : Disjoint S T) (x : ℝ) :
    primeCount K (S ∪ T) x = primeCount K S x + primeCount K T x :=
  TauCeti.primeCount_union hST x

/-- A finite symmetric difference changes the counts by a constant eventually. -/
theorem eventually_primeTheta_sub_eq {S T : Set (HeightOneSpectrum (𝓞 K))}
    (hST : (symmDiff S T).Finite) :
    ∀ᶠ x in atTop, TauCeti.primeTheta K S x - TauCeti.primeTheta K T x =
      ∑ v ∈ hST.toFinset, (S.indicator (fun v ↦ Real.log (Ideal.absNorm v.asIdeal : ℝ)) v -
        T.indicator (fun v ↦ Real.log (Ideal.absNorm v.asIdeal : ℝ)) v) :=
  TauCeti.eventually_primeTheta_sub_eq hST

theorem eventually_primeCount_sub_eq {S T : Set (HeightOneSpectrum (𝓞 K))}
    (hST : (symmDiff S T).Finite) :
    ∀ᶠ x in atTop, primeCount K S x - primeCount K T x =
      ∑ v ∈ hST.toFinset, (S.indicator 1 v - T.indicator 1 v) :=
  TauCeti.eventually_primeCount_sub_eq hST

theorem primeTheta_eq_primeTheta_natFloor (S : Set (HeightOneSpectrum (𝓞 K))) {x : ℝ} :
    TauCeti.primeTheta K S x = TauCeti.primeTheta K S (⌊x⌋₊ : ℝ) :=
  TauCeti.primeTheta_eq_primeTheta_natFloor S

end Layer4

/-! ## Layer 5: ideal and prime estimates -/

section Layer5

/-- **5.1** `IdealCountingLinearBounds K` packages positive constants with
`lower * x ≤ #{I ≠ 0 | N(I) ≤ x} ≤ upper * x` for `x ≥ 1`. -/
theorem nonempty_idealCountingLinearBounds_iff :
    Nonempty (IdealCountingLinearBounds K) ↔ ∃ lower upper : ℝ, 0 < lower ∧ 0 < upper ∧
      ∀ x : ℝ, 1 ≤ x →
        lower * x ≤ Nat.card {I : (Ideal (𝓞 K))⁰ // (Ideal.absNorm (I : Ideal (𝓞 K)) : ℝ) ≤ x} ∧
        (Nat.card {I : (Ideal (𝓞 K))⁰ // (Ideal.absNorm (I : Ideal (𝓞 K)) : ℝ) ≤ x} : ℝ) ≤
          upper * x :=
  ⟨fun ⟨b⟩ ↦ ⟨b.lower, b.upper, b.lower_pos, b.upper_pos,
      fun x hx ↦ ⟨b.le_card x hx, b.card_le x hx⟩⟩,
    fun ⟨l, u, hl, hu, h⟩ ↦ ⟨⟨l, u, hl, hu, fun x hx ↦ (h x hx).1, fun x hx ↦ (h x hx).2⟩⟩⟩

theorem idealCount_linearBounds : Nonempty (IdealCountingLinearBounds K) :=
  TauCeti.idealCount_linearBounds K

/-- The number of prime powers of norm at most `x` is `O(x)`. -/
theorem card_primePowersLE_isBigO :
    (fun x : ℝ ↦ ((primePowersLE K x).card : ℝ)) =O[atTop] fun x : ℝ ↦ x :=
  TauCeti.card_primePowersLE_isBigO K

/-- **5.1a The exact trivial abscissa** is `1`. The proof uses the two-sided linear ideal counts
for convergence and divergence, not the continuation or the pole of the Dedekind zeta function. -/
theorem abscissaOfAbsConv_normCoeff_one :
    LSeries.abscissaOfAbsConv
      (normCoeff K (UnitaryIdealWeight.toIdealArithmeticFunction (1 : UnitaryIdealWeight K))) =
        1 := by
  rw [UnitaryIdealWeight.toIdealArithmeticFunction_one]
  exact TauCeti.abscissaOfAbsConv_normCoeff_one K

theorem not_LSeriesSummable_normCoeff_one :
    ¬ LSeriesSummable (normCoeff K (1 : IdealArithmeticFunction K)) 1 :=
  TauCeti.not_LSeriesSummable_normCoeff_one K

/-- **5.2 Higher prime powers.** The standard logarithmic weight on prime powers `𝔭^k` with
`k ≥ 2` has summatory function `O(√x log² x)`. -/
theorem higherPrimePowerTheta_apply (x : ℝ) :
    higherPrimePowerTheta K x = primePowerSummatory K higherPrimePowerWeight x :=
  TauCeti.higherPrimePowerTheta_apply K x

theorem higherPrimePowerWeight_of_two_le_primePowerExponent {A : IdealPrimePower K}
    (hA : 2 ≤ primePowerExponent A) :
    higherPrimePowerWeight A = Real.log (Ideal.absNorm (primePowerBase A).asIdeal) :=
  TauCeti.higherPrimePowerWeight_of_two_le_primePowerExponent hA

theorem higherPrimePowerWeight_of_prime {A : IdealPrimePower K}
    (hA : Prime (A : Ideal (𝓞 K))) : higherPrimePowerWeight A = 0 :=
  TauCeti.higherPrimePowerWeight_of_prime hA

theorem higherPrimePowerTheta_isBigO :
    higherPrimePowerTheta K =O[atTop] fun x : ℝ ↦ Real.sqrt x * Real.log x ^ 2 :=
  TauCeti.higherPrimePowerTheta_isBigO K

/-- Another weight inherits the estimate from a pointwise bound by the standard one. -/
theorem primePowerSummatory_isBigO_of_le_higherPrimePowerWeight {E : Type*}
    [NormedAddCommGroup E] {w : IdealPrimePower K → E} {C : ℝ} (hC : 0 ≤ C)
    (hw : ∀ A, ‖w A‖ ≤ C * higherPrimePowerWeight A) :
    (fun x ↦ primePowerSummatory K w x) =O[atTop] fun x : ℝ ↦ Real.sqrt x * Real.log x ^ 2 :=
  TauCeti.primePowerSummatory_isBigO_of_le_higherPrimePowerWeight K hC hw

omit [NumberField K] in
/-- **5.3 Primes of residue degree above one** have convergent reciprocal-norm series beyond
`1/2`, and Dirichlet and natural density zero. -/
theorem mem_higherDegreePrimes {𝔭 : HeightOneSpectrum (𝓞 K)} :
    𝔭 ∈ higherDegreePrimes K ↔ 1 < Ideal.inertiaDeg 𝔭.asIdeal ℤ :=
  TauCeti.mem_higherDegreePrimes

theorem summable_absNorm_rpow_higherDegreePrimes {s : ℝ} (hs : 1 / 2 < s) :
    Summable fun 𝔭 : higherDegreePrimes K ↦ (Ideal.absNorm 𝔭.1.asIdeal : ℝ) ^ (-s) :=
  TauCeti.summable_absNorm_rpow_higherDegreePrimes hs

theorem hasDirichletDensity_higherDegreePrimes :
    NumberField.Set.HasDirichletDensity (higherDegreePrimes K) 0 :=
  TauCeti.hasDirichletDensity_higherDegreePrimes

theorem hasNaturalDensity_higherDegreePrimes :
    NumberField.Set.HasNaturalDensity (higherDegreePrimes K) 0 :=
  TauCeti.hasNaturalDensity_higherDegreePrimes

/-- A prime of residue degree above one over an intermediate field has residue degree above one
over `ℚ`, which is how Chebotarev moves between a field and a subfield. -/
theorem mem_higherDegreePrimes_of_one_lt_inertiaDeg {E : Type*} [Field E] [NumberField E]
    [Algebra K E] {𝔓 : HeightOneSpectrum (𝓞 E)} (h : 1 < 𝔓.asIdeal.inertiaDeg (𝓞 K)) :
    𝔓 ∈ higherDegreePrimes E :=
  TauCeti.mem_higherDegreePrimes_of_one_lt_inertiaDeg h

end Layer5

/-! ## Layer 6: Abel and Perron summation -/

section Layer6

open MeasureTheory
open scoped Real

/-- **6.1 Abel summation** for a Northcott norm, extending Mathlib's
`sum_mul_eq_sub_sub_integral_mul`, and its ideal- and prime-indexed corollaries. -/
theorem summatory_mul_eq_sub_sub_integral_mul {ι : Type*} (N : ι → ℕ) [Northcott N]
    {𝕜 : Type*} [RCLike 𝕜] (w : ι → 𝕜) {g : ℝ → 𝕜} {a b : ℝ}
    (ha : 0 ≤ a) (hab : a ≤ b) (hg_diff : ∀ t ∈ Set.Icc a b, DifferentiableAt ℝ g t)
    (hg_int : IntegrableOn (deriv g) (Set.Icc a b)) :
    summatory N (fun i ↦ w i * g (N i)) b - summatory N (fun i ↦ w i * g (N i)) a =
      g b * summatory N w b - g a * summatory N w a -
        ∫ t in Set.Ioc a b, deriv g t * summatory N w t :=
  TauCeti.summatory_mul_eq_sub_sub_integral_mul N w ha hab hg_diff hg_int

theorem idealSummatory_mul_eq_sub_integral_mul {𝕜 : Type*} [RCLike 𝕜]
    (w : (Ideal (𝓞 K))⁰ → 𝕜) {g : ℝ → 𝕜} (x : ℝ)
    (hg_diff : ∀ t ∈ Set.Icc 1 x, DifferentiableAt ℝ g t)
    (hg_int : IntegrableOn (deriv g) (Set.Icc 1 x)) :
    idealSummatory K (fun I ↦ w I * g (Ideal.absNorm (I : Ideal (𝓞 K)))) x =
      g x * idealSummatory K w x - ∫ t in Set.Ioc 1 x, deriv g t * idealSummatory K w t :=
  TauCeti.idealSummatory_mul_eq_sub_integral_mul K w x hg_diff hg_int

theorem primeSummatory_mul_eq_sub_integral_mul (w : HeightOneSpectrum (𝓞 K) → ℝ) {g : ℝ → ℝ}
    (x : ℝ) (hg_diff : ∀ t ∈ Set.Icc 2 x, DifferentiableAt ℝ g t)
    (hg_int : IntegrableOn (deriv g) (Set.Icc 2 x)) :
    primeSummatory K (fun v ↦ w v * g (Ideal.absNorm v.asIdeal)) x =
      g x * primeSummatory K w x - ∫ t in Set.Ioc 2 x, deriv g t * primeSummatory K w t :=
  TauCeti.primeSummatory_mul_eq_sub_integral_mul K w x hg_diff hg_int

/-- The Stieltjes form: `π` is the integral of `1 / log t` against the measure of `ϑ`. -/
theorem primeCount_eq_integral_primeThetaStieltjes (S : Set (HeightOneSpectrum (𝓞 K))) (x : ℝ) :
    primeCount K S x =
      ∫ t in Set.Ioc 1 x, (Real.log t)⁻¹ ∂(primeThetaStieltjes K S).measure :=
  TauCeti.primeCount_eq_integral_primeThetaStieltjes S x

/-- **6.2 Standard transfers.** `ϑ - δx = o(x)` gives `π - δ Li = o(x / log x)`, for every `δ`
including `0`; for `δ ≠ 0` this is `π ∼ δ Li`. -/
theorem primeCount_sub_mul_logIntegral_isLittleO {S : Set (HeightOneSpectrum (𝓞 K))} {δ : ℝ}
    (h : (fun x ↦ TauCeti.primeTheta K S x - δ * x) =o[atTop] id) :
    (fun x ↦ primeCount K S x - δ * TauCeti.Real.logIntegral x) =o[atTop]
      fun x : ℝ ↦ x / Real.log x :=
  TauCeti.primeCount_sub_mul_logIntegral_isLittleO h

theorem primeCount_asymptotic_of_primeTheta {S : Set (HeightOneSpectrum (𝓞 K))} {δ : ℝ}
    (hδ : δ ≠ 0) (h : TauCeti.primeTheta K S ~[atTop] fun x ↦ δ * x) :
    primeCount K S ~[atTop] fun x ↦ δ * TauCeti.Real.logIntegral x :=
  TauCeti.primeCount_asymptotic_of_primeTheta hδ h

theorem primeCount_isLittleO_logIntegral {S : Set (HeightOneSpectrum (𝓞 K))}
    (h : TauCeti.primeTheta K S =o[atTop] id) :
    primeCount K S =o[atTop] TauCeti.Real.logIntegral :=
  TauCeti.primeCount_isLittleO_logIntegral h

example (x : ℝ) : TauCeti.Real.logIntegral x = ∫ t in (2 : ℝ)..x, (Real.log t)⁻¹ := rfl

theorem logIntegral_isEquivalent_div_log :
    TauCeti.Real.logIntegral ~[atTop] fun x : ℝ ↦ x / Real.log x :=
  TauCeti.Real.logIntegral_isEquivalent_div_log

/-- **6.3 Truncated Perron.** The finite-height kernel is `(2π)⁻¹` times the integral of
`x^s / s` over `s = c + it`, `|t| ≤ T`. -/
theorem truncatedPerronKernel_def (x c T : ℝ) :
    truncatedPerronKernel x c T =
      ((2 * π : ℝ) : ℂ)⁻¹ * ∫ t in -T..T,
        (x : ℂ) ^ ((c : ℂ) + t * I) / ((c : ℂ) + t * I) :=
  TauCeti.truncatedPerronKernel_def x c T

theorem perronStep_of_one_lt {x : ℝ} (hx : 1 < x) : perronStep x = 1 :=
  TauCeti.perronStep_of_one_lt hx

theorem perronStep_of_lt_one {x : ℝ} (hx : x < 1) : perronStep x = 0 :=
  TauCeti.perronStep_of_lt_one hx

/-- Off `x = 1` the kernel is the step plus an error with the universal constant `1/π`. -/
theorem norm_truncatedPerronKernel_sub_step_le {x c T : ℝ} (hx : 0 < x) (hx1 : x ≠ 1)
    (hc : 0 < c) (hT : 0 < T) :
    ‖truncatedPerronKernel x c T - perronStep x‖ ≤ x ^ c / (π * T * |Real.log x|) :=
  TauCeti.norm_truncatedPerronKernel_sub_step_le hx hx1 hc hT

/-- At `x = 1` the finite-height value is `π⁻¹ arctan (T / c)`, which is not `1/2` and tends
to `1/2`. -/
theorem truncatedPerronKernel_one {c : ℝ} (hc : c ≠ 0) (T : ℝ) :
    truncatedPerronKernel 1 c T = (π⁻¹ * Real.arctan (T / c) : ℝ) :=
  TauCeti.truncatedPerronKernel_one hc T

theorem truncatedPerronKernel_one_ne_half {c : ℝ} (hc : 0 < c) (T : ℝ) :
    truncatedPerronKernel 1 c T ≠ 1 / 2 :=
  TauCeti.truncatedPerronKernel_one_ne_half hc T

theorem tendsto_truncatedPerronKernel_one {c : ℝ} (hc : 0 < c) :
    Tendsto (truncatedPerronKernel 1 c) atTop (𝓝 (1 / 2)) :=
  TauCeti.tendsto_truncatedPerronKernel_one hc

/-- **6.4 Arithmetic Perron.** Interchanging the integral with an absolutely convergent `LSeries`
gives the series of kernels at `x / n`. -/
theorem truncatedPerron_LSeries {f : ℕ → ℂ} {x c T : ℝ} (hx : 0 < x) (hc : 0 < c) (hT : 0 ≤ T)
    (h : LSeriesSummable f (c : ℂ)) :
    ((2 * π : ℝ) : ℂ)⁻¹ * ∫ t in -T..T, LSeries f ((c : ℂ) + t * I) * perronIntegrand x c t =
      ∑' n : ℕ, f n * truncatedPerronKernel (x / n) c T :=
  TauCeti.truncatedPerron_LSeries hx hc hT h

/-- The off-norm form: when `x` is not the index of a nonzero coefficient, the truncated integral
is the sharp partial sum up to an explicit error. -/
theorem norm_truncatedPerron_LSeries_sub_sum_le {f : ℕ → ℂ} {x c T : ℝ} (hx : 0 < x)
    (hc : 0 < c) (hT : 0 < T) (hoff : ∀ n : ℕ, f n ≠ 0 → x ≠ n)
    (h : LSeriesSummable f (c : ℂ)) :
    ‖(((2 * π : ℝ) : ℂ)⁻¹ * ∫ t in -T..T, LSeries f ((c : ℂ) + t * I) * perronIntegrand x c t)
        - ∑ n ∈ Finset.Ico 1 ⌈x⌉₊, f n‖
      ≤ ∑' n : ℕ, ‖f n‖ * ((x / n) ^ c / (π * T * |Real.log (x / n)|)) :=
  TauCeti.norm_truncatedPerron_LSeries_sub_sum_le hx hc hT hoff h

/-- The half-weight form at an integer endpoint. -/
theorem tendsto_truncatedPerron_LSeries_natCast {f : ℕ → ℂ} {c : ℝ} {N : ℕ} (hN : 0 < N)
    (hc : 0 < c) (h : LSeriesSummable f (c : ℂ)) :
    Tendsto (fun T : ℝ ↦ ((2 * π : ℝ) : ℂ)⁻¹ *
        ∫ t in -T..T, LSeries f ((c : ℂ) + t * I) * perronIntegrand N c t) atTop
      (𝓝 ((∑ n ∈ Finset.Ico 1 N, f n) + f N / 2)) :=
  TauCeti.tendsto_truncatedPerron_LSeries_natCast hN hc h

/-- The ideal summatory forms consumed by `ZerosOfLFunctions`. -/
theorem perronFormula {f : IdealArithmeticFunction K} {x c : ℝ} (hx : 0 < x) (hc : 0 < c)
    (h : LSeriesSummable (normCoeff K f) c) :
    Tendsto (fun T : ℝ ↦ ((2 * π : ℝ) : ℂ)⁻¹ *
        ∫ t in -T..T, LSeries (normCoeff K f) ((c : ℂ) + t * I) * perronIntegrand x c t)
      atTop (𝓝 (∑ I ∈ idealsLE K x, f I * perronStep (x / Ideal.absNorm (I : Ideal (𝓞 K))))) :=
  TauCeti.perronFormula hx hc h

theorem perronFormula_of_forall_absNorm_ne {f : IdealArithmeticFunction K} {x c : ℝ}
    (hx : 0 < x) (hc : 0 < c)
    (hoff : ∀ I : (Ideal (𝓞 K))⁰, (Ideal.absNorm (I : Ideal (𝓞 K)) : ℝ) ≠ x)
    (h : LSeriesSummable (normCoeff K f) c) :
    Tendsto (fun T : ℝ ↦ ((2 * π : ℝ) : ℂ)⁻¹ *
        ∫ t in -T..T, LSeries (normCoeff K f) ((c : ℂ) + t * I) * perronIntegrand x c t)
      atTop (𝓝 (idealSummatory K f x)) :=
  TauCeti.perronFormula_of_forall_absNorm_ne hx hc hoff h

theorem perronFormula_natCast {f : IdealArithmeticFunction K} {c : ℝ} {N : ℕ} (hN : 0 < N)
    (hc : 0 < c) (h : LSeriesSummable (normCoeff K f) c) :
    Tendsto (fun T : ℝ ↦ ((2 * π : ℝ) : ℂ)⁻¹ *
        ∫ t in -T..T, LSeries (normCoeff K f) ((c : ℂ) + t * I) * perronIntegrand N c t)
      atTop (𝓝 (idealSummatory K f N - normCoeff K f N / 2)) :=
  TauCeti.perronFormula_natCast hN hc h

/-- **6.5 Cancellation** is the uniform `O(x^{1 - 1/[K:ℚ]})` bound for the ideal partial sums. -/
theorem hasCancellation_iff (χ : UnitaryIdealWeight K) :
    HasCancellation χ ↔ ∃ C : ℝ, ∀ x : ℝ, 1 ≤ x →
      ‖idealSummatory K (UnitaryIdealWeight.toIdealArithmeticFunction χ) x‖ ≤
        C * x ^ (1 - 1 / (Module.finrank ℚ K : ℝ)) :=
  Iff.rfl

/-- The named continuation is given by Abel summation against the ideal partial sums. -/
example (χ : UnitaryIdealWeight K) (s : ℂ) :
    continuedLFunctionOfWeight χ s =
      s * ∫ t in Set.Ioi (1 : ℝ),
        idealSummatory K (UnitaryIdealWeight.toIdealArithmeticFunction χ) t *
          (t : ℂ) ^ (-(s + 1)) :=
  rfl

theorem continuedLFunctionOfWeight_eq_LSeries (χ : UnitaryIdealWeight K) {s : ℂ}
    (hs : 1 < s.re) :
    continuedLFunctionOfWeight χ s =
      LSeries (normCoeff K (UnitaryIdealWeight.toIdealArithmeticFunction χ)) s :=
  TauCeti.continuedLFunctionOfWeight_eq_LSeries χ hs

theorem analyticOnNhd_continuedLFunctionOfWeight {χ : UnitaryIdealWeight K}
    (hχ : HasCancellation χ) :
    AnalyticOnNhd ℂ (continuedLFunctionOfWeight χ)
      {s : ℂ | 1 - 1 / (Module.finrank ℚ K : ℝ) < s.re} :=
  (TauCeti.differentiableOn_continuedLFunctionOfWeight hχ).analyticOnNhd
    (isOpen_lt continuous_const Complex.continuous_re)

/-- A good ideal is one prime to the bad primes, and it is never `⊥`, even for the trivial weight
with no bad primes. -/
example (χ : TauCeti.MultiplicativeIdealWeight K) (I : Ideal (𝓞 K)) :
    χ.IsGood I ↔ Ideal.IsPrimeTo I χ.badPrimes :=
  Iff.rfl

theorem isGood_one_iff {I : Ideal (𝓞 K)} :
    (1 : TauCeti.MultiplicativeIdealWeight K).IsGood I ↔ I ≠ ⊥ :=
  MultiplicativeIdealWeight.isGood_one_iff

theorem apply_ne_zero_iff_isGood (χ : TauCeti.MultiplicativeIdealWeight K) (I : Ideal (𝓞 K)) :
    χ I ≠ 0 ↔ χ.IsGood I :=
  χ.apply_ne_zero_iff_isGood I

/-- The operations used by character-family consumers: conjugation, restriction, the pointwise
square `χ ^ 2`, and imaginary norm twists. -/
theorem hasCancellation_conj_iff {χ : UnitaryIdealWeight K} :
    HasCancellation (UnitaryIdealWeight.conj χ) ↔ HasCancellation χ :=
  TauCeti.hasCancellation_conj_iff

theorem continuedLFunctionOfWeight_conj (χ : UnitaryIdealWeight K) (s : ℂ) :
    continuedLFunctionOfWeight (UnitaryIdealWeight.conj χ) (starRingEnd ℂ s) =
      starRingEnd ℂ (continuedLFunctionOfWeight χ s) :=
  TauCeti.continuedLFunctionOfWeight_conj χ s

theorem HasCancellation.restrict {χ : UnitaryIdealWeight K} (hχ : HasCancellation χ)
    (S : Set (HeightOneSpectrum (𝓞 K))) (hS : S.Finite) :
    HasCancellation (UnitaryIdealWeight.restrict χ S hS) :=
  TauCeti.HasCancellation.restrict hχ S hS

theorem unitaryIdealWeight_val_pow (χ : UnitaryIdealWeight K) (n : ℕ) : (χ ^ n).1 = χ.1 ^ n :=
  UnitaryIdealWeight.val_pow χ n

theorem multiplicativeIdealWeight_pow_apply (χ : TauCeti.MultiplicativeIdealWeight K) {n : ℕ}
    (hn : n ≠ 0) (I : Ideal (𝓞 K)) : (χ ^ n) I = χ I ^ n :=
  MultiplicativeIdealWeight.pow_apply χ hn I

/-- Imaginary twists preserve cancellation when `[K : ℚ] > 1`; over `ℚ` the exponent is `0`, and
twisting by `n^{-it}` does not preserve bounded partial sums. -/
theorem HasCancellation.normTwist {χ : UnitaryIdealWeight K} (hχ : HasCancellation χ) (z : ℂ)
    (hz : z.re = 0) (hK : 1 < Module.finrank ℚ K) :
    HasCancellation (UnitaryIdealWeight.normTwist z hz χ) :=
  TauCeti.HasCancellation.normTwist hχ z hz hK

theorem continuedLFunctionOfWeight_normTwist_of_one_lt_re (χ : UnitaryIdealWeight K) {z : ℂ}
    (hz : z.re = 0) {s : ℂ} (hs : 1 < s.re) :
    continuedLFunctionOfWeight (UnitaryIdealWeight.normTwist z hz χ) s =
      continuedLFunctionOfWeight χ (s + z) :=
  TauCeti.continuedLFunctionOfWeight_normTwist_of_one_lt_re χ hz hs

end Layer6

/-! ## Layer 7: Dirichlet density -/

section Layer7

/-- **7.1** Mathlib's `NumberField.Set.HasDirichletDensity` is consumed directly: it is the limit
of `P_S(s) / P_all(s)` as `s → 1⁺`. -/
theorem hasDirichletDensity_iff {S : Set (HeightOneSpectrum (𝓞 K))} {δ : ℝ} :
    NumberField.Set.HasDirichletDensity S δ ↔
      Tendsto (fun s : ℝ ↦ NumberField.Set.primeIdealZetaSum S s /
        NumberField.Set.primeIdealZetaSum (Set.univ : Set (HeightOneSpectrum (𝓞 K))) s)
        (𝓝[>] 1) (𝓝 δ) :=
  NumberField.Set.hasDirichletDensity_iff

/-- The one-sided epsilon predicates are bounds, not junk-valued densities. -/
theorem isLowerDirichletDensityBound_iff {S : Set (HeightOneSpectrum (𝓞 K))} {δ : ℝ} :
    NumberField.Set.IsLowerDirichletDensityBound S δ ↔
      ∀ ε, 0 < ε → ∀ᶠ s : ℝ in 𝓝[>] 1,
        δ - ε < NumberField.Set.primeIdealZetaSum S s /
          NumberField.Set.primeIdealZetaSum (Set.univ : Set (HeightOneSpectrum (𝓞 K))) s :=
  NumberField.Set.isLowerDirichletDensityBound_iff

theorem isUpperDirichletDensityBound_iff {S : Set (HeightOneSpectrum (𝓞 K))} {δ : ℝ} :
    NumberField.Set.IsUpperDirichletDensityBound S δ ↔
      ∀ ε, 0 < ε → ∀ᶠ s : ℝ in 𝓝[>] 1,
        NumberField.Set.primeIdealZetaSum S s /
          NumberField.Set.primeIdealZetaSum (Set.univ : Set (HeightOneSpectrum (𝓞 K))) s <
            δ + ε :=
  NumberField.Set.isUpperDirichletDensityBound_iff

/-- Matching bounds force the density. -/
theorem hasDirichletDensity_of_upperBound_of_lowerBound {S : Set (HeightOneSpectrum (𝓞 K))}
    {δ : ℝ} (hupper : NumberField.Set.IsUpperDirichletDensityBound S δ)
    (hlower : NumberField.Set.IsLowerDirichletDensityBound S δ) :
    NumberField.Set.HasDirichletDensity S δ :=
  NumberField.Set.hasDirichletDensity_of_upperBound_of_lowerBound hupper hlower

/-- **7.2 The all-prime normalization** `P_all(s) = log (1/(s-1)) + O(1)`, from the Dedekind
Euler product and the higher-prime-power bound, and the equivalent logarithmic normalization of
density. -/
theorem primeIdealZetaSum_univ_sub_log_one_div_sub_one_isBigO :
    (fun s : ℝ ↦
      NumberField.Set.primeIdealZetaSum (Set.univ : Set (HeightOneSpectrum (𝓞 K))) s -
        Real.log (1 / (s - 1))) =O[𝓝[>] 1] fun _ ↦ (1 : ℝ) :=
  TauCeti.primeIdealZetaSum_univ_sub_log_one_div_sub_one_isBigO

theorem tendsto_primeIdealZetaSum_univ_div_log_one_div_sub_one :
    Tendsto (fun s : ℝ ↦
      NumberField.Set.primeIdealZetaSum (Set.univ : Set (HeightOneSpectrum (𝓞 K))) s /
        Real.log (1 / (s - 1))) (𝓝[>] 1) (𝓝 1) :=
  TauCeti.tendsto_primeIdealZetaSum_univ_div_log_one_div_sub_one

theorem hasDirichletDensity_iff_tendsto_div_log_one_div_sub_one
    (S : Set (HeightOneSpectrum (𝓞 K))) (δ : ℝ) :
    NumberField.Set.HasDirichletDensity S δ ↔
      Tendsto (fun s : ℝ ↦ NumberField.Set.primeIdealZetaSum S s / Real.log (1 / (s - 1)))
        (𝓝[>] 1) (𝓝 δ) :=
  NumberField.Set.hasDirichletDensity_iff_tendsto_div_log_one_div_sub_one S δ

/-- **7.3 Calculus.** Finite sets have density zero and finite changes do not move a density. -/
theorem hasDirichletDensity_of_finite {S : Set (HeightOneSpectrum (𝓞 K))} (hS : S.Finite) :
    NumberField.Set.HasDirichletDensity S 0 :=
  NumberField.Set.hasDirichletDensity_of_finite hS

theorem hasDirichletDensity_iff_of_finite_symmDiff {S T : Set (HeightOneSpectrum (𝓞 K))}
    {δ : ℝ} (hST : (symmDiff S T).Finite) :
    NumberField.Set.HasDirichletDensity S δ ↔ NumberField.Set.HasDirichletDensity T δ :=
  NumberField.Set.hasDirichletDensity_iff_of_finite_symmDiff hST

theorem HasDirichletDensity.mono {S T : Set (HeightOneSpectrum (𝓞 K))} {δ ε : ℝ} (hST : S ⊆ T)
    (hS : NumberField.Set.HasDirichletDensity S δ)
    (hT : NumberField.Set.HasDirichletDensity T ε) : δ ≤ ε :=
  NumberField.Set.HasDirichletDensity.mono hST hS hT

theorem HasDirichletDensity.compl {S : Set (HeightOneSpectrum (𝓞 K))} {δ : ℝ}
    (hS : NumberField.Set.HasDirichletDensity S δ) :
    NumberField.Set.HasDirichletDensity Sᶜ (1 - δ) :=
  NumberField.Set.HasDirichletDensity.compl hS

theorem hasDirichletDensity_biUnion_finset {ι : Type*} {s : Finset ι}
    {f : ι → Set (HeightOneSpectrum (𝓞 K))} {d : ι → ℝ}
    (hf : ∀ i ∈ s, NumberField.Set.HasDirichletDensity (f i) (d i))
    (hdisj : (s : Set ι).PairwiseDisjoint f) :
    NumberField.Set.HasDirichletDensity (⋃ i ∈ s, f i) (∑ i ∈ s, d i) :=
  NumberField.Set.hasDirichletDensity_biUnion_finset hf hdisj

theorem hasDirichletDensity_of_squeeze {ι : Type*} {s : Finset ι}
    {f : ι → Set (HeightOneSpectrum (𝓞 K))} {d : ι → ℝ} {δ : ℝ} {i₀ : ι} (hi₀ : i₀ ∈ s)
    (hdisj : (s : Set ι).PairwiseDisjoint f)
    (hU : NumberField.Set.IsUpperDirichletDensityBound (⋃ i ∈ s, f i) δ)
    (hlow : ∀ i ∈ s, NumberField.Set.IsLowerDirichletDensityBound (f i) (d i))
    (hsum : ∑ i ∈ s, d i = δ) :
    NumberField.Set.HasDirichletDensity (f i₀) (d i₀) :=
  NumberField.Set.hasDirichletDensity_of_squeeze hi₀ hdisj hU hlow hsum

theorem hasDirichletDensity_of_subset_of_subset {S T U : Set (HeightOneSpectrum (𝓞 K))} {δ : ℝ}
    (hST : S ⊆ T) (hTU : T ⊆ U) (hS : NumberField.Set.HasDirichletDensity S δ)
    (hU : NumberField.Set.HasDirichletDensity U δ) : NumberField.Set.HasDirichletDensity T δ :=
  NumberField.Set.hasDirichletDensity_of_subset_of_subset hST hTU hS hU

/-- Natural density is the ratio of prime counts with the inclusive real cutoff, and it implies
Dirichlet density. -/
theorem hasNaturalDensity_def {S : Set (HeightOneSpectrum (𝓞 K))} {δ : ℝ} :
    NumberField.Set.HasNaturalDensity S δ ↔
      Tendsto (fun x : ℝ ↦ primeCount K S x /
        primeCount K (Set.univ : Set (HeightOneSpectrum (𝓞 K))) x) atTop (𝓝 δ) :=
  NumberField.Set.hasNaturalDensity_def

theorem hasDirichletDensity_of_hasNaturalDensity {S : Set (HeightOneSpectrum (𝓞 K))} {δ : ℝ}
    (h : NumberField.Set.HasNaturalDensity S δ) : NumberField.Set.HasDirichletDensity S δ :=
  NumberField.Set.hasDirichletDensity_of_hasNaturalDensity h

/-- **7.4 Fibre counts.** A norm-preserving map of prime sets with constant fibre size `c ≠ 0`
multiplies prime sums by `c` and divides densities by it. -/
theorem primeIdealZetaSum_eq_mul_of_card_fiber {E : Type*} [Field E] [NumberField E]
    {T : Set (HeightOneSpectrum (𝓞 E))} {S : Set (HeightOneSpectrum (𝓞 K))}
    {π : HeightOneSpectrum (𝓞 E) → HeightOneSpectrum (𝓞 K)} {c : ℕ} (hmaps : Set.MapsTo π T S)
    (hnorm : ∀ 𝔓 ∈ T, Ideal.absNorm 𝔓.asIdeal = Ideal.absNorm (π 𝔓).asIdeal) (hc : c ≠ 0)
    (hfiber : ∀ 𝔭 ∈ S, Nat.card {𝔓 // π 𝔓 = 𝔭 ∧ 𝔓 ∈ T} = c) (s : ℝ) :
    NumberField.Set.primeIdealZetaSum T s = c * NumberField.Set.primeIdealZetaSum S s :=
  NumberField.Set.primeIdealZetaSum_eq_mul_of_card_fiber hmaps hnorm hc hfiber s

theorem hasDirichletDensity_iff_of_card_fiber_of_negligible {E : Type*} [Field E]
    [NumberField E] {T : Set (HeightOneSpectrum (𝓞 E))} {S Z : Set (HeightOneSpectrum (𝓞 K))}
    {π : HeightOneSpectrum (𝓞 E) → HeightOneSpectrum (𝓞 K)} {c : ℕ}
    (hZ : NumberField.Set.HasDirichletDensity Z 0) (hmaps : Set.MapsTo π (T \ π ⁻¹' Z) (S \ Z))
    (hnorm : ∀ 𝔓 ∈ T \ π ⁻¹' Z, Ideal.absNorm 𝔓.asIdeal = Ideal.absNorm (π 𝔓).asIdeal)
    (hnorm_le : ∀ 𝔓 ∈ T ∩ π ⁻¹' Z, Ideal.absNorm (π 𝔓).asIdeal ≤ Ideal.absNorm 𝔓.asIdeal)
    (hc : c ≠ 0) (hfiber : ∀ 𝔭 ∈ S \ Z, Nat.card {𝔓 // π 𝔓 = 𝔭 ∧ 𝔓 ∈ T} = c) {m : ℕ}
    (hbound : ∀ 𝔭 ∈ Z, (T ∩ π ⁻¹' {𝔭}).encard ≤ m) {δ : ℝ} :
    NumberField.Set.HasDirichletDensity T δ ↔ NumberField.Set.HasDirichletDensity S (δ / c) :=
  NumberField.Set.hasDirichletDensity_iff_of_card_fiber_of_negligible hZ hmaps hnorm hnorm_le hc
    hfiber hbound

/-- The variant counting fibres only at residue degree one, along contraction. -/
theorem hasDirichletDensity_contraction {E : Type*} [Field E] [NumberField E] [Algebra K E]
    {T : Set (HeightOneSpectrum (𝓞 E))} {S Z : Set (HeightOneSpectrum (𝓞 K))} {c : ℕ}
    (hZ : NumberField.Set.HasDirichletDensity Z 0)
    (hmaps : ∀ 𝔓 ∈ T, 𝔓.asIdeal.inertiaDeg (𝓞 K) = 1 → 𝔓.under (𝓞 K) ∉ Z →
      𝔓.under (𝓞 K) ∈ S) (hc : c ≠ 0)
    (hfiber : ∀ 𝔭 ∈ S \ Z, Nat.card {𝔓 // 𝔓.under (𝓞 K) = 𝔭 ∧ 𝔓 ∈ T ∧
      𝔓.asIdeal.inertiaDeg (𝓞 K) = 1} = c) {δ : ℝ} :
    NumberField.Set.HasDirichletDensity T δ ↔ NumberField.Set.HasDirichletDensity S (δ / c) :=
  NumberField.Set.hasDirichletDensity_contraction hZ hmaps hc hfiber

end Layer7

/-! ## Layer 8: Landau-type positivity -/

section Layer8

/-- **8.1** An analytic extension across the real point `σ` is a function differentiable on a disc
around `σ` that agrees with the `LSeries` on the part of the disc with `Re s > σ`. -/
theorem hasAnalyticExtensionAt_iff (a : ℕ → ℂ) (σ : ℝ) :
    TauCeti.LSeries.HasAnalyticExtensionAt a σ ↔
      ∃ r : ℝ, 0 < r ∧ ∃ F : ℂ → ℂ, DifferentiableOn ℂ F (Metric.ball (σ : ℂ) r) ∧
        ∀ s ∈ Metric.ball (σ : ℂ) r, σ < s.re → F s = LSeries a s :=
  Iff.rfl

/-- **Landau's theorem.** Nonnegative coefficients with abscissa of absolute convergence equal to
the real number `σ` have no analytic continuation across `σ`. -/
theorem landau {a : ℕ → ℂ} (ha : 0 ≤ a) {σ : ℝ}
    (habs : LSeries.abscissaOfAbsConv a = (σ : EReal)) :
    ¬ TauCeti.LSeries.HasAnalyticExtensionAt a σ :=
  TauCeti.LSeries.landau ha habs

/-- For coefficients nonnegative away from the ignored index `0`, the ordinary and absolute
abscissae agree. -/
theorem abscissaOfConv_eq_abscissaOfAbsConv_of_nonneg {f : ℕ → ℂ}
    (ha : ∀ n, n ≠ 0 → 0 ≤ f n) :
    TauCeti.LSeries.abscissaOfConv f = LSeries.abscissaOfAbsConv f :=
  TauCeti.LSeries.abscissaOfConv_eq_abscissaOfAbsConv_of_nonneg ha

/-- A meromorphic continuation to a neighbourhood of the abscissa has a pole there. -/
theorem meromorphicOrderAt_lt_zero_of_eq_LSeries {a : ℕ → ℂ} (ha : 0 ≤ a) {σ r : ℝ}
    (habs : LSeries.abscissaOfAbsConv a = (σ : EReal)) (hr : 0 < r) {F : ℂ → ℂ}
    (hF : MeromorphicAt F (σ : ℂ))
    (hFeq : ∀ s ∈ Metric.ball (σ : ℂ) r, σ < s.re → F s = LSeries a s) :
    meromorphicOrderAt F (σ : ℂ) < 0 :=
  TauCeti.LSeries.meromorphicOrderAt_lt_zero_of_eq_LSeries ha habs hr hF hFeq

/-- **8.2 Positive combinations.** A finite trigonometric combination nonnegative on the unit
circle gives nonnegativity of the matching combination of `-log (1 - a z^m)` in the unit disc,
with no analytic input; `3-4-1` is one such combination. -/
theorem sum_re_neg_log_one_sub_nonneg {ι : Type*} {s : Finset ι} {c : ι → ℝ} {m : ι → ℕ}
    (h : ∀ z : ℂ, ‖z‖ = 1 → 0 ≤ ∑ i ∈ s, c i * (z ^ m i).re) {a : ℝ} (ha₀ : 0 ≤ a)
    (ha₁ : a < 1) {z : ℂ} (hz : ‖z‖ ≤ 1) :
    0 ≤ ∑ i ∈ s, c i * (-log (1 - a * z ^ m i)).re :=
  TauCeti.sum_re_neg_log_one_sub_nonneg h ha₀ ha₁ hz

theorem threeFourOne_nonneg {z : ℂ} (hz : ‖z‖ = 1) : 0 ≤ 3 + 4 * z.re + (z ^ 2).re := by
  have h := TauCeti.LSeries.isNonnegativeTrigonometricCombination_threeFourOne z hz
  rwa [TauCeti.LSeries.trigonometricCombination_threeFourOne] at h

theorem threeFourOne_re_neg_log_one_sub_nonneg {a : ℝ} (ha₀ : 0 ≤ a) (ha₁ : a < 1) {z : ℂ}
    (hz : ‖z‖ ≤ 1) :
    0 ≤ 3 * (-log (1 - a)).re + 4 * (-log (1 - a * z)).re + (-log (1 - a * z ^ 2)).re :=
  TauCeti.LSeries.threeFourOne_re_neg_log_one_sub_nonneg ha₀ ha₁ hz

/-- The analytic input stays separate: given the `3-4-1` bound for three functions near `Re s = 1`,
a pole of order at most one for the first, and regularity of the others at the boundary point,
the second does not vanish there. -/
theorem ne_zero_of_threeFourOne {f₀ f₁ f₂ : ℂ → ℂ} {t : ℝ}
    (hbound : ∀ᶠ σ : ℝ in 𝓝[>] 1,
      1 ≤ ‖f₀ σ ^ 3 * f₁ (σ + I * t) ^ 4 * f₂ (σ + 2 * I * t)‖)
    (h₀ : (fun σ : ℝ ↦ f₀ σ) =O[𝓝[>] 1] fun σ : ℝ ↦ (σ - 1)⁻¹)
    (h₁ : DifferentiableAt ℂ f₁ (1 + I * t)) (h₂ : ContinuousAt f₂ (1 + 2 * I * t)) :
    f₁ (1 + I * t) ≠ 0 :=
  TauCeti.LSeries.ne_zero_of_threeFourOne hbound h₀ h₁ h₂

/-- **Rejection test.** The trivial weight and its imaginary norm twists have no cancellation. -/
theorem not_hasCancellation_one : ¬ HasCancellation (1 : UnitaryIdealWeight K) :=
  TauCeti.not_hasCancellation_one

theorem not_hasCancellation_normTwist_one {z : ℂ} (hz : z.re = 0) :
    ¬ HasCancellation (UnitaryIdealWeight.normTwist z hz (1 : UnitaryIdealWeight K)) :=
  TauCeti.not_hasCancellation_normTwist_one hz

end Layer8

/-! ## Layer 9: Wiener–Ikehara -/

section Layer9

/-- **9.1 Wiener–Ikehara.** Nonnegative coefficients with `LSeriesHasSum` equal to `F` on
`Re s > 1`, and a separately named `G` continuous on `Re s ≥ 1` with `G = F - κ/(s-1)` on
`Re s > 1`, have `x⁻¹ ∑_{n ≤ x} a n → κ`. No Chebyshev bound is assumed. -/
theorem wienerIkehara {a : ℕ → ℝ} {F G : ℂ → ℂ} {κ : ℝ} (ha : 0 ≤ a)
    (hF : ∀ s : ℂ, 1 < s.re → LSeriesHasSum (fun n ↦ (a n : ℂ)) s (F s))
    (hG : ContinuousOn G {s : ℂ | 1 ≤ s.re})
    (hGF : ∀ s : ℂ, 1 < s.re → G s = F s - κ / (s - 1)) :
    Tendsto (fun x : ℝ ↦ x⁻¹ * ∑ n ∈ Finset.Icc 1 ⌊x⌋₊, a n) atTop (𝓝 κ) :=
  TauCeti.LSeries.wienerIkehara ha hF hG hGF

theorem wienerIkehara_zero {a : ℕ → ℝ} {F G : ℂ → ℂ} (ha : 0 ≤ a)
    (hF : ∀ s : ℂ, 1 < s.re → LSeriesHasSum (fun n ↦ (a n : ℂ)) s (F s))
    (hG : ContinuousOn G {s : ℂ | 1 ≤ s.re}) (hGF : ∀ s : ℂ, 1 < s.re → G s = F s) :
    Tendsto (fun x : ℝ ↦ x⁻¹ * ∑ n ∈ Finset.Icc 1 ⌊x⌋₊, a n) atTop (𝓝 0) :=
  TauCeti.LSeries.wienerIkehara_zero ha hF hG hGF

/-- **9.2 Variants.** Finitely many negative coefficients, natural cutoffs, and a pole at a
positive abscissa. -/
theorem wienerIkehara_of_eventually_nonneg {a : ℕ → ℝ} {F G : ℂ → ℂ} {κ : ℝ}
    (ha : ∀ᶠ n in atTop, 0 ≤ a n)
    (hF : ∀ s : ℂ, 1 < s.re → LSeriesHasSum (fun n ↦ (a n : ℂ)) s (F s))
    (hG : ContinuousOn G {s : ℂ | 1 ≤ s.re})
    (hGF : ∀ s : ℂ, 1 < s.re → G s = F s - κ / (s - 1)) :
    Tendsto (fun x : ℝ ↦ x⁻¹ * ∑ n ∈ Finset.Icc 1 ⌊x⌋₊, a n) atTop (𝓝 κ) :=
  TauCeti.LSeries.wienerIkehara_of_eventually_nonneg ha hF hG hGF

theorem wienerIkehara_nat {a : ℕ → ℝ} {F G : ℂ → ℂ} {κ : ℝ} (ha : ∀ᶠ n in atTop, 0 ≤ a n)
    (hF : ∀ s : ℂ, 1 < s.re → LSeriesHasSum (fun n ↦ (a n : ℂ)) s (F s))
    (hG : ContinuousOn G {s : ℂ | 1 ≤ s.re})
    (hGF : ∀ s : ℂ, 1 < s.re → G s = F s - κ / (s - 1)) :
    Tendsto (fun N : ℕ ↦ (N : ℝ)⁻¹ * ∑ n ∈ Finset.Icc 1 N, a n) atTop (𝓝 κ) :=
  TauCeti.LSeries.wienerIkehara_nat ha hF hG hGF

theorem wienerIkehara_rpow {a : ℕ → ℝ} {F G : ℂ → ℂ} {κ σ : ℝ} (hσ : 0 < σ)
    (ha : ∀ᶠ n in atTop, 0 ≤ a n)
    (hF : ∀ s : ℂ, σ < s.re → LSeriesHasSum (fun n ↦ (a n : ℂ)) s (F s))
    (hG : ContinuousOn G {s : ℂ | σ ≤ s.re})
    (hGF : ∀ s : ℂ, σ < s.re → G s = F s - κ / (s - σ)) :
    Tendsto (fun x : ℝ ↦ (x ^ σ)⁻¹ * ∑ n ∈ Finset.Icc 1 ⌊x⌋₊, a n) atTop (𝓝 (κ / σ)) :=
  TauCeti.LSeries.wienerIkehara_rpow hσ ha hF hG hGF

/-- Coefficients in a finite-dimensional ordered real normed space with closed positive cone, with
the boundary hypothesis stated against a spanning family of monotone functionals (Mathlib's
`LSeries` is `ℂ`-valued). -/
theorem wienerIkehara_of_forall_monotone_dual {E : Type*} [NormedAddCommGroup E]
    [NormedSpace ℝ E] [FiniteDimensional ℝ E] [PartialOrder E] [IsOrderedAddMonoid E]
    [PosSMulMono ℝ E] [OrderClosedTopology E] {ι : Type*} {φ : ι → StrongDual ℝ E}
    (hφ : ∀ i, Monotone (φ i))
    (hspan : ∀ ψ : StrongDual ℝ E, Monotone ψ → ψ ∈ Submodule.span ℝ (Set.range φ))
    {a : ℕ → E} {κ : E} (ha : ∀ᶠ n in atTop, 0 ≤ a n)
    (hFG : ∀ i, ∃ F G : ℂ → ℂ,
      (∀ s : ℂ, 1 < s.re → LSeriesHasSum (fun n ↦ (φ i (a n) : ℂ)) s (F s)) ∧
      ContinuousOn G {s : ℂ | 1 ≤ s.re} ∧ ∀ s : ℂ, 1 < s.re → G s = F s - φ i κ / (s - 1)) :
    Tendsto (fun x : ℝ ↦ x⁻¹ • ∑ n ∈ Finset.Icc 1 ⌊x⌋₊, a n) atTop (𝓝 κ) :=
  TauCeti.LSeries.wienerIkehara_of_forall_monotone_dual hφ hspan ha hFG

end Layer9

/-! ## Layer 10: generic prime-number-theorem transfer -/

section Layer10

/-- **10.1** `primePsi` counts every prime power `𝔭^k`, `k ≥ 1`, with base in `S`, at weight
`log N(𝔭)`; it is the partial sum of the nonnegative coefficient `primeVonMangoldtCoeff`. -/
theorem primePsi_apply (S : Set (HeightOneSpectrum (𝓞 K))) (x : ℝ) :
    TauCeti.primePsi K S x = ∑ A ∈ primePowersLE K x,
      {A : IdealPrimePower K | primePowerBase A ∈ S}.indicator primePowerWeight A :=
  TauCeti.primePsi_apply S x

theorem primePowerWeight_eq_vonMangoldt_re (A : IdealPrimePower K) :
    primePowerWeight A = (IdealArithmeticFunction.vonMangoldt (A : (Ideal (𝓞 K))⁰)).re :=
  TauCeti.primePowerWeight_eq_vonMangoldt_re A

theorem primeVonMangoldtCoeff_nonneg (S : Set (HeightOneSpectrum (𝓞 K))) (n : ℕ) :
    0 ≤ primeVonMangoldtCoeff K S n :=
  TauCeti.primeVonMangoldtCoeff_nonneg S n

theorem primePsi_eq_sum_range (S : Set (HeightOneSpectrum (𝓞 K))) (x : ℝ) :
    TauCeti.primePsi K S x = ∑ n ∈ Finset.range (⌊x⌋₊ + 1), primeVonMangoldtCoeff K S n :=
  TauCeti.primePsi_eq_sum_range S x

/-- For all primes the coefficient is the norm coefficient of the ideal von Mangoldt function. -/
theorem normCoeff_vonMangoldt (n : ℕ) :
    normCoeff K (IdealArithmeticFunction.vonMangoldt : IdealArithmeticFunction K) n =
      ((primeVonMangoldtCoeff K (Set.univ : Set (HeightOneSpectrum (𝓞 K))) n : ℝ) : ℂ) :=
  TauCeti.normCoeff_vonMangoldt n

/-- `PrimeBoundaryRemainder K S δ` is exactly the README's analytic input: `0 ≤ δ`, a named `F`
with `LSeriesHasSum` for the von Mangoldt coefficient on `Re s > 1`, a named `G` continuous on
`Re s ≥ 1`, and `G = F - δ/(s-1)` on `Re s > 1`. -/
theorem nonempty_primeBoundaryRemainder_iff (S : Set (HeightOneSpectrum (𝓞 K))) (δ : ℝ) :
    Nonempty (PrimeBoundaryRemainder K S δ) ↔
      0 ≤ δ ∧ ∃ F G : ℂ → ℂ,
        (∀ s : ℂ, 1 < s.re →
          LSeriesHasSum (fun n ↦ (primeVonMangoldtCoeff K S n : ℂ)) s (F s)) ∧
        ContinuousOn G {s : ℂ | 1 ≤ s.re} ∧
        ∀ s : ℂ, 1 < s.re → G s = F s - δ / (s - 1) := by
  constructor
  · rintro ⟨B⟩
    refine ⟨B.nonneg, fun s ↦ if h : 1 < s.re then B.series ⟨s, h⟩ else 0,
      fun s ↦ if h : 1 ≤ s.re then B.remainder ⟨s, h⟩ else 0, fun s hs ↦ ?_, ?_, fun s hs ↦ ?_⟩
    · simp only [hs, ↓reduceDIte]
      exact B.hasSum ⟨s, hs⟩
    · refine continuousOn_iff_continuous_domRestrict.mpr
        (B.continuous_remainder.congr fun s ↦ ?_)
      simp only [Set.domRestrict_apply, s.2, ↓reduceDIte]
    · simp only [hs, hs.le, ↓reduceDIte]
      exact B.remainder_eq ⟨s, hs⟩
  · rintro ⟨-, F, G, hF, hG, hGF⟩
    exact ⟨PrimeBoundaryRemainder.ofFunctions F G hF hG hGF⟩

/-- Wiener–Ikehara gives `ψ ∼ δx`, in little-o form, which includes `δ = 0`. -/
theorem primePsi_asymptotic_of_boundary {S : Set (HeightOneSpectrum (𝓞 K))} {δ : ℝ}
    (B : PrimeBoundaryRemainder K S δ) :
    (fun x ↦ TauCeti.primePsi K S x - δ * x) =o[atTop] fun x : ℝ ↦ x :=
  TauCeti.primePsi_asymptotic_of_boundary B

theorem tendsto_inv_mul_primePsi {S : Set (HeightOneSpectrum (𝓞 K))} {δ : ℝ}
    (B : PrimeBoundaryRemainder K S δ) :
    Tendsto (fun x : ℝ ↦ x⁻¹ * TauCeti.primePsi K S x) atTop (𝓝 δ) :=
  B.tendsto_inv_mul_primePsi

/-- **10.2 Removing higher prime powers** is the named estimate `ψ - ϑ = o(x)`, proved for the
standard weight and consumed by the `ψ`-to-`ϑ` transfer. -/
theorem hasNegligibleHigherPrimePowers_iff {S : Set (HeightOneSpectrum (𝓞 K))} :
    HasNegligibleHigherPrimePowers K S ↔
      (fun x ↦ TauCeti.primePsi K S x - TauCeti.primeTheta K S x) =o[atTop] fun x : ℝ ↦ x :=
  Iff.rfl

theorem standardPrimePowerRemoval (S : Set (HeightOneSpectrum (𝓞 K))) :
    HasNegligibleHigherPrimePowers K S :=
  TauCeti.standardPrimePowerRemoval K S

theorem primeTheta_asymptotic_of_primePsi {S : Set (HeightOneSpectrum (𝓞 K))} {δ : ℝ}
    (h : HasNegligibleHigherPrimePowers K S)
    (hψ : (fun x ↦ TauCeti.primePsi K S x - δ * x) =o[atTop] fun x : ℝ ↦ x) :
    (fun x ↦ TauCeti.primeTheta K S x - δ * x) =o[atTop] fun x : ℝ ↦ x :=
  TauCeti.primeTheta_asymptotic_of_primePsi h hψ

/-- A general prime-power weight must state its own bound by the standard one. -/
theorem primePowerSummatory_isLittleO_of_le_higherPrimePowerWeight {E : Type*}
    [NormedAddCommGroup E] {w : IdealPrimePower K → E} {C : ℝ} (hC : 0 ≤ C)
    (hw : ∀ A, ‖w A‖ ≤ C * higherPrimePowerWeight A) :
    (fun x ↦ primePowerSummatory K w x) =o[atTop] fun x : ℝ ↦ x :=
  TauCeti.primePowerSummatory_isLittleO_of_le_higherPrimePowerWeight K hC hw

/-- **10.3 The summit.** Boundary data returns all three conclusions, for `ψ`, `ϑ` and `π`;
`primeCount_asymptotic_of_primeTheta` (Layer 6.2) is the last step. -/
theorem primeNumberTheoremTransfer {S : Set (HeightOneSpectrum (𝓞 K))} {δ : ℝ}
    (B : PrimeBoundaryRemainder K S δ) :
    (fun x ↦ TauCeti.primePsi K S x - δ * x) =o[atTop] (fun x : ℝ ↦ x) ∧
      (fun x ↦ TauCeti.primeTheta K S x - δ * x) =o[atTop] (fun x : ℝ ↦ x) ∧
      (fun x ↦ primeCount K S x - δ * TauCeti.Real.logIntegral x) =o[atTop]
        (fun x : ℝ ↦ x / Real.log x) :=
  TauCeti.primeNumberTheoremTransfer B

/-- **10.4 The conditional prime ideal theorem** from boundary data for all primes with
residue `1`. -/
theorem primeIdealTheorem_of_boundary
    (B : PrimeBoundaryRemainder K (Set.univ : Set (HeightOneSpectrum (𝓞 K))) 1) :
    TauCeti.primePsi K Set.univ ~[atTop] (fun x : ℝ ↦ x) ∧
      TauCeti.primeTheta K Set.univ ~[atTop] (fun x : ℝ ↦ x) ∧
      primeCount K Set.univ ~[atTop] TauCeti.Real.logIntegral :=
  TauCeti.primeIdealTheorem_of_boundary B

end Layer10

/-! ## Worked examples and rejection tests

Example 1 is `not_exists_zeroExtend_eq_one`, `multiplicativeIdealWeight_ne_const_one` and
`unitaryIdealWeight_ne_const_one`, with `zeroExtend_one_apply` below. Example 3 is
`hasDirichletDensity_of_finite` and `hasDirichletDensity_iff_of_finite_symmDiff`. Example 4 is
`truncatedPerronKernel_one`, `truncatedPerronKernel_one_ne_half` and
`tendsto_truncatedPerronKernel_one`. Example 7 is `norm_normTwist_apply_ne_one`. -/

section Examples

omit [NumberField K] in
/-- **Example 1.** The constant one on the nonzero ideals has the canonical zero extension. -/
theorem zeroExtend_one_apply (I : Ideal (𝓞 K)) :
    (1 : IdealArithmeticFunction K).zeroExtend I = if I = ⊥ then 0 else 1 :=
  IdealArithmeticFunction.zeroExtend_one_apply I

/-- **Example 2.** The trivial weight over `ℚ` regroups to the Riemann-zeta coefficient. -/
theorem normCoeff_one_rat_apply {n : ℕ} (hn : 0 < n) :
    normCoeff ℚ (1 : IdealArithmeticFunction ℚ) n = 1 :=
  TauCeti.normCoeff_one_rat_apply hn

/-- **Example 5.** Higher prime powers are visible in the von Mangoldt transform of a weight, and
in `ψ - ϑ`, before they are estimated away. -/
theorem vonMangoldtTransform_apply_prime_pow (χ : TauCeti.MultiplicativeIdealWeight K)
    {P : (Ideal (𝓞 K))⁰} (hP : Prime (P : Ideal (𝓞 K))) {n : ℕ} (hn : 0 < n) :
    χ.toIdealArithmeticFunction.vonMangoldtTransform (P ^ n) =
      χ P ^ n * Real.log (Ideal.absNorm (P : Ideal (𝓞 K))) :=
  MultiplicativeIdealWeight.vonMangoldtTransform_apply_prime_pow χ hP hn

theorem primePsi_sub_primeTheta (S : Set (HeightOneSpectrum (𝓞 K))) (x : ℝ) :
    TauCeti.primePsi K S x - TauCeti.primeTheta K S x =
      primePowerSummatory K
        ({A : IdealPrimePower K | primePowerBase A ∈ S}.indicator higherPrimePowerWeight) x :=
  TauCeti.primePsi_sub_primeTheta S x

/-- **Example 6.** Given `TauCeti.LFunctions.primeIdealVonMangoldtBoundary`, the trivial prime
carrier and residue `1` recover the prime ideal theorem. -/
example :
    TauCeti.primePsi K Set.univ ~[atTop] (fun x : ℝ ↦ x) ∧
      TauCeti.primeTheta K Set.univ ~[atTop] (fun x : ℝ ↦ x) ∧
      primeCount K Set.univ ~[atTop] TauCeti.Real.logIntegral :=
  TauCeti.primeIdealTheorem_of_boundary (TauCeti.LFunctions.primeIdealVonMangoldtBoundary K)

/-- **Example 8.** The ideal Möbius function is multiplicative on coprime ideals
(`isMultiplicative_moebius`) but not completely multiplicative, because `μ(𝔭²) = 0`. -/
theorem moebius_not_completelyMultiplicative :
    ¬ ∀ A B : (Ideal (𝓞 K))⁰, (IdealArithmeticFunction.moebius : IdealArithmeticFunction K)
      (A * B) = IdealArithmeticFunction.moebius A * IdealArithmeticFunction.moebius B := by
  intro h
  obtain ⟨P, hPbot, hPmax⟩ :=
    Ring.exists_maximal_of_not_isField (NumberField.RingOfIntegers.not_isField K)
  have hP : Prime P := Ideal.prime_of_isPrime hPbot hPmax.isPrime
  set A : (Ideal (𝓞 K))⁰ := ⟨P, mem_nonZeroDivisors_of_ne_zero hPbot⟩
  have hA : Prime (A : Ideal (𝓞 K)) := hP
  have h2 := h A A
  rw [← pow_two, IdealArithmeticFunction.moebius_apply_prime_pow hA le_rfl,
    IdealArithmeticFunction.moebius_apply_prime hA] at h2
  norm_num at h2

/-- **Example 9.** A vanishing sum over a norm fibre does not make every summand nonnegative: two
distinct ideals of the same norm carry `-1` and `1`. Over `ℚ(i)` the two ideals of norm `5` are
such a pair. -/
theorem exists_forall_normCoeff_nonneg_not_forall_nonneg {A B : (Ideal (𝓞 K))⁰} (hAB : A ≠ B)
    (hN : Ideal.absNorm (A : Ideal (𝓞 K)) = Ideal.absNorm (B : Ideal (𝓞 K))) :
    ∃ f : IdealArithmeticFunction K, f ≠ 0 ∧ normCoeff K f = 0 ∧ ¬ ∀ I, 0 ≤ f I :=
  TauCeti.exists_forall_normCoeff_nonneg_not_forall_nonneg K hAB hN

theorem exists_normCoeff_eq_zero_not_forall_nonneg_of_gaussian {θ : 𝓞 K}
    (hmin : minpoly ℤ θ = Polynomial.X ^ 2 + 1) (hgen : Algebra.adjoin ℚ {(θ : K)} = ⊤) :
    ∃ f : IdealArithmeticFunction K, f ≠ 0 ∧ normCoeff K f = 0 ∧ ¬ ∀ I, 0 ≤ f I := by
  have hcard : 1 < (normFiber K 5).card := by
    rw [TauCeti.card_normFiber_eq_dedekindZetaCoeff K (by norm_num),
      TauCeti.NumberField.GaussianRationals.dedekindZetaCoeff_five hmin hgen]
    norm_num
  obtain ⟨A, hA, B, hB, hAB⟩ := Finset.one_lt_card.mp hcard
  exact TauCeti.exists_forall_normCoeff_nonneg_not_forall_nonneg K hAB
    (((TauCeti.mem_normFiber K).mp hA).trans ((TauCeti.mem_normFiber K).mp hB).symm)

end Examples

/-! ## Names kept for `Chebotarev/Suggested.lean`

These four declarations are abbreviations of the Tau Ceti objects, under the names the
`Chebotarev` roadmap imports from this namespace. -/

/-- The completely multiplicative ideal-weight carrier. -/
abbrev MultiplicativeIdealWeight (K : Type*) [Field K] [NumberField K] : Type _ :=
  TauCeti.MultiplicativeIdealWeight K

/-- The logarithmically weighted count `ϑ` of the primes of `S`. -/
abbrev primeTheta (K : Type*) [Field K] [NumberField K] (S : Set (HeightOneSpectrum (𝓞 K)))
    (x : ℝ) : ℝ :=
  TauCeti.primeTheta K S x

/-- Chebyshev's `ψ` for the primes of `S`, with every prime power present. -/
abbrev primePsi (K : Type*) [Field K] [NumberField K] (S : Set (HeightOneSpectrum (𝓞 K)))
    (x : ℝ) : ℝ :=
  TauCeti.primePsi K S x

/-- Natural density of a set of primes, normalized by the all-prime count. -/
abbrev HasNaturalDensity (K : Type*) [Field K] [NumberField K]
    (S : Set (HeightOneSpectrum (𝓞 K))) (δ : ℝ) : Prop :=
  NumberField.Set.HasNaturalDensity S δ

end

end TauCetiRoadmap.ArithmeticDirichletSeries
