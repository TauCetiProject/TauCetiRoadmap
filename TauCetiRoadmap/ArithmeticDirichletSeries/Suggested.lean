import Mathlib

/-!
# Arithmetic Dirichlet series and Tauberian methods: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is `README.md`.
These declarations pin the carriers and conventions most likely to drift. Proving them does not
by itself complete a layer.
-/

namespace TauCetiRoadmap.ArithmeticDirichletSeries

open Complex Filter NumberField Topology Asymptotics
open IsDedekindDomain (HeightOneSpectrum)

noncomputable section

universe u

variable (K : Type u) [Field K] [NumberField K]

/-- Layer 0: the carrier for convolution is a function on nonzero ideals. In a Dedekind domain
this is the same as the non-zero-divisor submonoid of the ideal monoid. -/
abbrev NonzeroIdeal := nonZeroDivisors (Ideal (𝓞 K))

abbrev IdealArithmeticFunction := NonzeroIdeal K → ℂ

namespace IdealArithmeticFunction

/-- The canonical extension sends the excluded zero ideal to zero. -/
noncomputable def zeroExtend (f : IdealArithmeticFunction K) : Ideal (𝓞 K) → ℂ := sorry

noncomputable def one : IdealArithmeticFunction K := fun _ ↦ 1

/-- Layer 2: convolution has the general carrier as both its domain and codomain. Its divisor sum
only ranges over factorizations of a nonzero ideal. -/
noncomputable def convolution (f g : IdealArithmeticFunction K) : IdealArithmeticFunction K :=
  sorry

noncomputable def delta : IdealArithmeticFunction K := sorry
noncomputable def moebius : IdealArithmeticFunction K := sorry
noncomputable def vonMangoldt (f : IdealArithmeticFunction K) : IdealArithmeticFunction K := sorry

/-- Multiplicativity on coprime nonzero ideals, the exact hypothesis used by an Euler product. -/
def IsMultiplicative (f : IdealArithmeticFunction K) : Prop :=
  f 1 = 1 ∧ ∀ I J : NonzeroIdeal K,
    (I.1 : Ideal (𝓞 K)) + J.1 = ⊤ → f (I * J) = f I * f J

/-- Complete multiplicativity is deliberately stronger than the Euler-product hypothesis. -/
def IsCompletelyMultiplicative (f : IdealArithmeticFunction K) : Prop :=
  f 1 = 1 ∧ ∀ I J : NonzeroIdeal K, f (I * J) = f I * f J

theorem convolution_assoc (f g h : IdealArithmeticFunction K) :
    convolution K (convolution K f g) h = convolution K f (convolution K g h) := sorry

theorem convolution_delta (f : IdealArithmeticFunction K) :
    convolution K f (delta K) = f := sorry

theorem moebius_isMultiplicative : IsMultiplicative K (moebius K) := sorry

theorem moebius_not_isCompletelyMultiplicative :
    ¬ IsCompletelyMultiplicative K (moebius K) := sorry

end IdealArithmeticFunction

/-- Layer 0: the general completely multiplicative degree-one carrier. It has finite zero support
but imposes no unit-modulus condition, so arbitrary complex norm twists land here. -/
structure MultiplicativeIdealWeight extends Ideal (𝓞 K) →*₀ ℂ where
  bad : Set (HeightOneSpectrum (𝓞 K))
  bad_finite : bad.Finite
  eq_zero_bad : ∀ 𝔭 ∈ bad, toMonoidWithZeroHom 𝔭.asIdeal = 0

namespace MultiplicativeIdealWeight

instance : CoeFun (MultiplicativeIdealWeight K) (fun _ ↦ Ideal (𝓞 K) → ℂ) :=
  ⟨fun χ ↦ χ.toMonoidWithZeroHom⟩

@[ext]
theorem ext {χ ψ : MultiplicativeIdealWeight K}
    (h : χ.toMonoidWithZeroHom = ψ.toMonoidWithZeroHom)
    (hbad : χ.bad = ψ.bad) : χ = ψ := sorry

theorem constantOne_rejected :
    ¬ ∃ χ : MultiplicativeIdealWeight K, ∀ I : Ideal (𝓞 K), χ I = 1 := sorry

noncomputable def one : MultiplicativeIdealWeight K := sorry
noncomputable def conj (χ : MultiplicativeIdealWeight K) : MultiplicativeIdealWeight K := sorry
noncomputable def pointwiseMul (χ ψ : MultiplicativeIdealWeight K) :
    MultiplicativeIdealWeight K := sorry

noncomputable def toArithmeticFunction (χ : MultiplicativeIdealWeight K) :
    IdealArithmeticFunction K :=
  fun I ↦ χ I

/-- A good ideal is nonzero and prime to the finite bad set. The explicit nonzero condition is
needed even when the bad set is empty. -/
def IsGood (χ : MultiplicativeIdealWeight K) (I : Ideal (𝓞 K)) : Prop :=
  I ≠ ⊥ ∧ ∀ 𝔭 ∈ χ.bad, ¬ 𝔭.asIdeal ∣ I

/-- An arbitrary complex norm twist. Its codomain is the general multiplicative carrier. -/
noncomputable def normTwist (χ : MultiplicativeIdealWeight K) (z : ℂ) :
    MultiplicativeIdealWeight K := sorry

end MultiplicativeIdealWeight

/-- The unitary subtype of multiplicative ideal weights. Finite-order Hecke characters land here;
only purely imaginary norm twists preserve this carrier. -/
structure UnitaryIdealWeight extends MultiplicativeIdealWeight K where
  norm_eq_one : ∀ 𝔭 ∉ bad, ‖toMonoidWithZeroHom 𝔭.asIdeal‖ = 1

namespace UnitaryIdealWeight

instance : CoeFun (UnitaryIdealWeight K) (fun _ ↦ Ideal (𝓞 K) → ℂ) :=
  ⟨fun χ ↦ χ.toMultiplicativeIdealWeight.toMonoidWithZeroHom⟩

@[ext]
theorem ext {χ ψ : UnitaryIdealWeight K}
    (h : χ.toMultiplicativeIdealWeight = ψ.toMultiplicativeIdealWeight) : χ = ψ := sorry

noncomputable def one : UnitaryIdealWeight K := sorry
noncomputable def conj (χ : UnitaryIdealWeight K) : UnitaryIdealWeight K := sorry
noncomputable def pointwiseMul (χ ψ : UnitaryIdealWeight K) : UnitaryIdealWeight K := sorry

noncomputable def toArithmeticFunction (χ : UnitaryIdealWeight K) : IdealArithmeticFunction K :=
  MultiplicativeIdealWeight.toArithmeticFunction K χ.toMultiplicativeIdealWeight

def IsGood (χ : UnitaryIdealWeight K) (I : Ideal (𝓞 K)) : Prop :=
  MultiplicativeIdealWeight.IsGood K χ.toMultiplicativeIdealWeight I

/-- The purely imaginary twist `χ * N^(it)` preserves unitarity. -/
noncomputable def imaginaryNormTwist (χ : UnitaryIdealWeight K) (t : ℝ) :
    UnitaryIdealWeight K := sorry

/-- On a good ideal, an arbitrary twist of a unitary weight has modulus `N(I)⁻ᴿᵉ z`. -/
theorem norm_normTwist (χ : UnitaryIdealWeight K) (z : ℂ) (I : Ideal (𝓞 K))
    (hI : IsGood K χ I) :
    ‖MultiplicativeIdealWeight.normTwist K χ.toMultiplicativeIdealWeight z I‖ =
      Real.rpow (Ideal.absNorm I : ℝ) (-z.re) := sorry

/-- Rejection test: a non-imaginary norm twist is not unitary as soon as it is evaluated at a
good ideal of norm greater than one. -/
theorem normTwist_not_unitary_of_re_ne_zero
    (χ : UnitaryIdealWeight K) (z : ℂ) (hz : z.re ≠ 0)
    (I : Ideal (𝓞 K)) (hI : IsGood K χ I) (hNorm : 1 < Ideal.absNorm I) :
    ‖MultiplicativeIdealWeight.normTwist K χ.toMultiplicativeIdealWeight z I‖ ≠ 1 := sorry

/-- Pointwise square, kept distinct from ideal convolution. -/
noncomputable def sq (χ : UnitaryIdealWeight K) : UnitaryIdealWeight K :=
  pointwiseMul K χ χ

def IsNormTwistOnGood (χ : UnitaryIdealWeight K) (u : ℝ) : Prop :=
  ∀ I : Ideal (𝓞 K), IsGood K χ I →
    χ I = ((Ideal.absNorm I : ℝ) : ℂ) ^ (Complex.I * (u : ℂ))

def IsTrivialOnGood (χ : UnitaryIdealWeight K) : Prop :=
  ∀ I : Ideal (𝓞 K), IsGood K χ I → χ I = 1

end UnitaryIdealWeight

/-- Layer 1: regroup a general nonzero-ideal arithmetic function by norm. Mathlib's carrier fixes
the coefficient at zero and supplies Dirichlet convolution. -/
noncomputable def normCoeff (f : IdealArithmeticFunction K) : ArithmeticFunction ℂ := sorry

theorem normCoeff_zero (f : IdealArithmeticFunction K) : normCoeff K f 0 = 0 := sorry

theorem normCoeff_one (f : IdealArithmeticFunction K) (h1 : f 1 = 1) :
    normCoeff K f 1 = 1 := sorry

/-- The partial-sum estimate that supplies continuation into a strip. It is analytic input, not a
consequence of the coefficient values lying in a finite group. -/
def HasCancellation (χ : UnitaryIdealWeight K) : Prop :=
  (fun X : ℝ ↦
    ∑ᶠ I : {I : NonzeroIdeal K //
      (Ideal.absNorm (I.1 : Ideal (𝓞 K)) : ℝ) ≤ X},
      χ (I.1 : Ideal (𝓞 K)))
    =O[atTop] fun X : ℝ ↦ X ^ (1 - 1 / (Module.finrank ℚ K : ℝ))

/-- The named continuation determined by Abel summation and uniqueness. -/
noncomputable def continuedLFunctionOfWeight (χ : UnitaryIdealWeight K) : ℂ → ℂ := sorry

theorem continuedLFunctionOfWeight_eq (χ : UnitaryIdealWeight K) {s : ℂ} (hs : 1 < s.re) :
    continuedLFunctionOfWeight K χ s =
      LSeries (normCoeff K (UnitaryIdealWeight.toArithmeticFunction K χ)) s := sorry

theorem analyticOnNhd_continuedLFunctionOfWeight
    (χ : UnitaryIdealWeight K) (hχ : HasCancellation K χ) :
    AnalyticOnNhd ℂ (continuedLFunctionOfWeight K χ)
      {s : ℂ | 1 - 1 / (Module.finrank ℚ K : ℝ) < s.re} := sorry

/-- Layer 1: ungrouped absolute convergence implies grouped absolute convergence and identifies
the sum. A converse requires nonnegativity/no cancellation at the individual ideal-summand level. -/
theorem regroupByNorm (f : IdealArithmeticFunction K) (s : ℂ)
    (h : Summable fun I : NonzeroIdeal K ↦
      f I / (Ideal.absNorm (I : Ideal (𝓞 K)) : ℂ) ^ s) :
    LSeriesHasSum (normCoeff K f) s
      (∑' I : NonzeroIdeal K,
        f I / (Ideal.absNorm (I : Ideal (𝓞 K)) : ℂ) ^ s) := sorry

/-- Layer 2: regrouping transports ideal convolution to Mathlib's Dirichlet convolution. -/
theorem normCoeff_convolution (f g : IdealArithmeticFunction K) :
    normCoeff K (IdealArithmeticFunction.convolution K f g) = normCoeff K f * normCoeff K g :=
  sorry

/-- Layer 3: ideal local factors are expressed as Mathlib arithmetic functions, and the global
coefficient is Mathlib's `ArithmeticFunction.eulerProduct`. -/
structure EulerProductData (f : IdealArithmeticFunction K) where
  multiplicative : IdealArithmeticFunction.IsMultiplicative K f
  localArithmeticFactor : HeightOneSpectrum (𝓞 K) → ArithmeticFunction ℂ
  local_prime_power : ∀ 𝔭 m,
    localArithmeticFactor 𝔭 (Ideal.absNorm 𝔭.asIdeal ^ m) = f ⟨𝔭.asIdeal ^ m, sorry⟩
  normCoeff_eq_eulerProduct :
    normCoeff K f = ArithmeticFunction.eulerProduct localArithmeticFactor

/-- Layer 4: logarithmically weighted counting of a set of nonzero prime ideals. -/
noncomputable def primeTheta (S : Set (HeightOneSpectrum (𝓞 K))) (x : ℝ) : ℝ := sorry

/-- Layer 4: unweighted counting of a set of nonzero prime ideals. -/
noncomputable def primeCount (S : Set (HeightOneSpectrum (𝓞 K))) (x : ℝ) : ℕ := sorry

/-- Layer 5: the inclusive count of all nonzero integral ideals of bounded norm. -/
noncomputable def idealCount (x : ℝ) : ℕ :=
  Nat.card {I : NonzeroIdeal K //
    (Ideal.absNorm (I.1 : Ideal (𝓞 K)) : ℝ) ≤ x}

/-- The two-sided linear ideal-counting input. The upper bound supplies convergence for
`Re(s) > 1`; the positive lower bound supplies divergence at `s = 1`. -/
structure IdealCountingLinearBounds where
  upperConstant : ℝ
  lowerConstant : ℝ
  upperConstant_pos : 0 < upperConstant
  lowerConstant_pos : 0 < lowerConstant
  upper : ∀ᶠ x : ℝ in atTop, (idealCount K x : ℝ) ≤ upperConstant * x
  lower : ∀ᶠ x : ℝ in atTop, lowerConstant * x ≤ idealCount K x

/-- Layer 5 owns the noncircular two-sided ideal-counting estimate. -/
noncomputable def idealCount_linearBounds : IdealCountingLinearBounds K := sorry

theorem abscissaOfAbsConv_normCoeff_one_of_linearBounds
    (hcount : IdealCountingLinearBounds K) :
    LSeries.abscissaOfAbsConv
      (normCoeff K (UnitaryIdealWeight.toArithmeticFunction K (UnitaryIdealWeight.one K))) = 1 :=
  sorry

/-- The exact trivial-weight abscissa is exported only after Layer 5's counting theorem. It does
not use continuation or the pole of the downstream Dedekind zeta function. -/
theorem abscissaOfAbsConv_normCoeff_one :
    LSeries.abscissaOfAbsConv
      (normCoeff K (UnitaryIdealWeight.toArithmeticFunction K (UnitaryIdealWeight.one K))) = 1 :=
  abscissaOfAbsConv_normCoeff_one_of_linearBounds K (idealCount_linearBounds K)

/-- Layer 7: natural density is normalized by the all-prime counting function. -/
def HasNaturalDensity (S : Set (HeightOneSpectrum (𝓞 K))) (δ : ℝ) : Prop :=
  Tendsto
    (fun x : ℝ ↦ (primeCount K S x : ℝ) /
      (primeCount K Set.univ x : ℝ))
    atTop (𝓝 δ)

/-- The exact all-prime denominator input retained by the natural-to-Dirichlet-density bridge. -/
def AllPrimeDirichletDenominatorAsymptotic : Prop :=
  Tendsto
    (fun s : ℝ ↦
      NumberField.Set.primeIdealZetaSum
          (Set.univ : Set (HeightOneSpectrum (𝓞 K))) s /
        Real.log (1 / (s - 1)))
    (𝓝[>] 1) (𝓝 1)

theorem hasDirichletDensity_of_hasNaturalDensity
    (S : Set (HeightOneSpectrum (𝓞 K))) (δ : ℝ)
    (hS : HasNaturalDensity K S δ)
    (hall : AllPrimeDirichletDenominatorAsymptotic K) :
    NumberField.Set.HasDirichletDensity S δ := sorry

/-!
Layer 7 deliberately does not redeclare the ratio-normalized density API. After updating the
Mathlib pin, the extensions live in `NumberField.Set` and use the existing
`primeIdealZetaSum`, `HasDirichletDensity`, and `dirichletDensity`. The additional epsilon
predicates are named `IsLowerDirichletDensityBound` and `IsUpperDirichletDensityBound`; they are
bounds, not junk-valued lower or upper densities. The finite-error, squeeze, contraction, and
natural-to-Dirichlet theorems extend that namespace.

Likewise, Layer 6 consumes `sum_mul_eq_sub_sub_integral_mul` and its existing Mathlib variants;
only the norm-indexed and asymptotic corollaries are new declarations.
-/

/-- Layer 6: the finite-height kernel itself. It is not a sharp summatory function. -/
noncomputable def truncatedPerronKernel (x c T : ℝ) : ℂ :=
  (2 * Real.pi : ℂ)⁻¹ *
    (∫ t in (-T)..T, (x : ℂ) ^ (c + t * Complex.I) / (c + t * Complex.I))

/-- The truncated kernel is a smoothed step plus a controlled error. The universal constant is
part of the proved estimate; finite height is never identified with the sharp step function. -/
theorem perronFormula :
    ∃ C : ℝ, 0 < C ∧ ∀ (x c T : ℝ), 0 < x → x ≠ 1 → 0 < c → 1 ≤ T →
      ∃ E : ℂ,
        truncatedPerronKernel x c T =
          (if 1 < x then (1 : ℂ) else 0) + E ∧
        ‖E‖ ≤ C * x ^ c / (T * |Real.log x|) := sorry

theorem perronFormula_endpoint (c T : ℝ) (hc : 0 < c) (hT : 0 ≤ T) :
    truncatedPerronKernel 1 c T =
      (Real.arctan (T / c) / Real.pi : ℝ) := sorry

/-- Layer 8: Landau's singularity theorem for nonnegative Dirichlet coefficients. -/
theorem landau {a : ℕ → ℝ} (ha : ∀ n, 0 ≤ a n) {σ : ℝ}
    (hσ : LSeries.abscissaOfAbsConv (fun n ↦ (a n : ℂ)) = (σ : EReal)) :
    ¬ ∃ F : ℂ → ℂ, AnalyticAt ℂ F σ ∧
      ∀ᶠ s : ℂ in 𝓝[ {z : ℂ | σ < z.re} ] (σ : ℂ),
        F s = LSeries (fun n ↦ (a n : ℂ)) s := sorry

/-- Layer 9: Wiener–Ikehara with a separately named continuous boundary remainder. -/
theorem wienerIkehara (a : ℕ → ℝ) (F G : ℂ → ℂ) (κ : ℝ)
    (ha : ∀ n, 0 ≤ a n)
    (hκ : 0 ≤ κ)
    (hF : ∀ s : ℂ, 1 < s.re → LSeriesHasSum (fun n ↦ (a n : ℂ)) s (F s))
    (hG : ContinuousOn G {s : ℂ | 1 ≤ s.re})
    (hFG : ∀ s : ℂ, 1 < s.re → G s = F s - (κ : ℂ) / (s - 1)) :
    Tendsto (fun x : ℝ ↦ (∑ n ∈ Finset.range ⌊x⌋₊.succ, a n) / x)
      atTop (𝓝 κ) := sorry

/-- The zero-residue case is retained explicitly instead of being hidden behind a positivity-only
statement. -/
theorem wienerIkehara_zero (a : ℕ → ℝ) (F G : ℂ → ℂ)
    (ha : ∀ n, 0 ≤ a n)
    (hF : ∀ s : ℂ, 1 < s.re → LSeriesHasSum (fun n ↦ (a n : ℂ)) s (F s))
    (hG : ContinuousOn G {s : ℂ | 1 ≤ s.re})
    (hFG : ∀ s : ℂ, 1 < s.re → G s = F s) :
    Tendsto (fun x : ℝ ↦ (∑ n ∈ Finset.range ⌊x⌋₊.succ, a n) / x)
      atTop (𝓝 0) := sorry

/-- Layer 10: the norm coefficient of the ideal von Mangoldt weight for a prime set. -/
noncomputable def primeVonMangoldtCoeff
    (S : Set (HeightOneSpectrum (𝓞 K))) : ArithmeticFunction ℝ := sorry

theorem primeVonMangoldtCoeff_nonneg
    (S : Set (HeightOneSpectrum (𝓞 K))) (n : ℕ) :
    0 ≤ primeVonMangoldtCoeff K S n := sorry

/-- Layer 10: the inclusive prime-power summatory function. -/
noncomputable def primePsi (S : Set (HeightOneSpectrum (𝓞 K))) (x : ℝ) : ℝ := sorry

/-- The exact higher-prime-power hypothesis used to pass from the standard logarithmic `ψ` to
`ϑ`. No such hypothesis is inferred for an arbitrary Euler-product coefficient system. -/
def HasNegligibleHigherPrimePowers
    (S : Set (HeightOneSpectrum (𝓞 K))) : Prop :=
  (fun x : ℝ ↦ primePsi K S x - primeTheta K S x) =o[atTop] fun x : ℝ ↦ x

/-- Layer 5 proves this for the standard nonnegative logarithmic prime-power weight. -/
theorem standardPrimePowerRemoval
    (S : Set (HeightOneSpectrum (𝓞 K))) :
    HasNegligibleHigherPrimePowers K S := sorry

/-- The exact analytic input consumed by the generic PNT transfer. Downstream consumers must
supply this package; a one-sided residue statement is not enough. -/
structure PrimeBoundaryRemainder
    (S : Set (HeightOneSpectrum (𝓞 K))) (δ : ℝ) where
  residue_nonneg : 0 ≤ δ
  F : ℂ → ℂ
  G : ℂ → ℂ
  hasSum : ∀ s : ℂ, 1 < s.re →
    LSeriesHasSum (fun n ↦ (primeVonMangoldtCoeff K S n : ℂ)) s (F s)
  continuous_remainder : ContinuousOn G {s : ℂ | 1 ≤ s.re}
  remainder_eq : ∀ s : ℂ, 1 < s.re → G s = F s - (δ : ℂ) / (s - 1)

theorem primePsi_asymptotic_of_boundary
    (S : Set (HeightOneSpectrum (𝓞 K))) (δ : ℝ)
    (h : PrimeBoundaryRemainder K S δ) :
    Tendsto (fun x : ℝ ↦ primePsi K S x / x) atTop (𝓝 δ) := sorry

theorem primeTheta_asymptotic_of_primePsi
    (S : Set (HeightOneSpectrum (𝓞 K))) (δ : ℝ)
    (hpow : HasNegligibleHigherPrimePowers K S)
    (hψ : Tendsto (fun x : ℝ ↦ primePsi K S x / x) atTop (𝓝 δ)) :
    Tendsto (fun x : ℝ ↦ primeTheta K S x / x) atTop (𝓝 δ) := sorry

theorem primeCount_asymptotic_of_primeTheta
    (S : Set (HeightOneSpectrum (𝓞 K))) (δ : ℝ)
    (hθ : Tendsto (fun x : ℝ ↦ primeTheta K S x / x) atTop (𝓝 δ)) :
    Tendsto (fun x : ℝ ↦ (primeCount K S x : ℝ) / (x / Real.log x))
      atTop (𝓝 δ) := sorry

/-- Layer 10 summit: boundary data yields the complete `ψ → ϑ → π` chain. -/
theorem primeNumberTheoremTransfer
    (S : Set (HeightOneSpectrum (𝓞 K))) (δ : ℝ)
    (h : PrimeBoundaryRemainder K S δ) :
    Tendsto (fun x : ℝ ↦ primePsi K S x / x) atTop (𝓝 δ) ∧
      Tendsto (fun x : ℝ ↦ primeTheta K S x / x) atTop (𝓝 δ) ∧
      Tendsto (fun x : ℝ ↦ (primeCount K S x : ℝ) / (x / Real.log x))
        atTop (𝓝 δ) := sorry

/-- Rejection test: nonnegative grouped coefficients do not force the individual summands in a
norm fibre to be nonnegative. -/
theorem grouped_nonnegative_does_not_imply_summand_nonnegative :
    ¬ ∀ a b : ℝ, 0 ≤ a + b → 0 ≤ a ∧ 0 ≤ b := by
  intro h
  have := h (-1) 1 (by norm_num)
  norm_num at this

/-- The prime ideal theorem remains conditional on the exact boundary package supplied by
`TauCeti.LFunctions.primeIdealVonMangoldtBoundary`. -/
theorem primeIdealTheorem_of_boundary
    (h : PrimeBoundaryRemainder K Set.univ 1) :
    Tendsto (fun x : ℝ ↦ (primeCount K Set.univ x : ℝ) / (x / Real.log x))
      atTop (𝓝 1) := sorry

end

end TauCetiRoadmap.ArithmeticDirichletSeries
