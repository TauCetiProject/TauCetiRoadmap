import Mathlib
import TauCetiRoadmap.ArithmeticDirichletSeries.Suggested
import TauCetiRoadmap.GlobalNumberFields.Suggested
import TauCetiRoadmap.NumberFieldArithmetic.Suggested

/-!
# The Chebotarev density theorem: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive specification is
`README.md`. These declarations pin the carriers, names, and regression tests most likely to drift.

The imports are load-bearing. Arithmetic Dirichlet Series owns prime sums, density, summation, and
Wiener--Ikehara; Global Number Fields owns ray classes and their counting input; Number Field
Arithmetic owns `artinSymbol` and its restriction and tower laws. No opaque copy of one of those
declarations appears here.

Some signatures use `sorry`, as roadmap prototypes may. The transport of `artinSymbol` itself is
required by the README to be a closed definition once the supplier imports are staged.
-/

namespace TauCetiRoadmap.Chebotarev

open Complex Filter NumberField Topology
open IsDedekindDomain (HeightOneSpectrum)
open scoped nonZeroDivisors

namespace ConjClasses

/-- **Layer 1, power of a conjugacy class.** It is the class containing `σ ^ j` for `σ ∈ C`.
Powering commutes with conjugation, so this does not depend on the representative. -/
noncomputable def pow {G : Type*} [Monoid G] (C : ConjClasses G) (j : ℕ) : ConjClasses G :=
  sorry

theorem mem_pow_iff {G : Type*} [Monoid G] (C : ConjClasses G) (j : ℕ) (τ : G) :
    τ ∈ (pow C j).carrier ↔ ∃ σ ∈ C.carrier, σ ^ j = τ := sorry

@[simp] theorem pow_zero {G : Type*} [Monoid G] (C : ConjClasses G) : pow C 0 = 1 := sorry

@[simp] theorem pow_one {G : Type*} [Monoid G] (C : ConjClasses G) : pow C 1 = C := sorry

theorem pow_mul {G : Type*} [Monoid G] (C : ConjClasses G) (i j : ℕ) :
    pow (pow C i) j = pow C (i * j) := sorry

/-- **Layer 11 regression**, the nonidentity square in `C₄`. A quadratic group cannot test this
case because it has no proper nonidentity square. -/
theorem pow_two_cyclicFour :
    pow (ConjClasses.mk (Multiplicative.ofAdd (1 : ZMod 4))) 2 =
      ConjClasses.mk (Multiplicative.ofAdd (2 : ZMod 4)) := sorry

end ConjClasses

section Frobenius

variable (K L : Type*) [Field K] [NumberField K] [Field L] [NumberField L]
  [Algebra K L] [IsGalois K L]

/-- **Layer 2, the unramified primes in one consumed Artin class.**

The carrier is `HeightOneSpectrum`, Mathlib's Dedekind-domain subtype of nonzero prime ideals. The
unramifiedness proof is existentially packaged because `artinSymbol` has no value at a ramified
prime. -/
def frobeniusPrimeSet (C : ConjClasses (L ≃ₐ[K] L)) : Set (HeightOneSpectrum (𝓞 K)) :=
  {𝔭 | ∃ hur : ∀ (Q : Ideal (𝓞 L)) [Q.IsPrime] [Q.LiesOver 𝔭.asIdeal],
      Algebra.IsUnramifiedAt (𝓞 K) Q,
    TauCetiRoadmap.NumberFieldArithmetic.artinSymbol 𝔭.asIdeal hur = C}

/-- **Layer 2**, distinct classes give disjoint prime sets. -/
theorem disjoint_frobeniusPrimeSet {C D : ConjClasses (L ≃ₐ[K] L)} (h : C ≠ D) :
    Disjoint (frobeniusPrimeSet K L C) (frobeniusPrimeSet K L D) := sorry

/-- **Layer 2**, the finite exceptional set. -/
noncomputable def ramifiedPrimes (_L : Type*) : Finset (HeightOneSpectrum (𝓞 K)) := sorry

theorem mem_ramifiedPrimes_iff (𝔭 : HeightOneSpectrum (𝓞 K)) :
    𝔭 ∈ ramifiedPrimes K L ↔
      ¬ ∀ (Q : Ideal (𝓞 L)) [Q.IsPrime] [Q.LiesOver 𝔭.asIdeal],
        Algebra.IsUnramifiedAt (𝓞 K) Q := sorry

/-- **Layer 10, Dirichlet-density Chebotarev.** Density is the predicate imported from Arithmetic
Dirichlet Series, hence the ratio to the all-prime sum. -/
theorem hasDirichletDensity_frobeniusPrimeSet (C : ConjClasses (L ≃ₐ[K] L)) :
    NumberField.Set.HasDirichletDensity (frobeniusPrimeSet K L C)
      ((Nat.card C.carrier : ℝ) / (Nat.card (L ≃ₐ[K] L) : ℝ)) := sorry

/-- **Layer 10**, the split-completely corollary is derived from the class theorem. -/
theorem hasDirichletDensity_splitCompletely :
    NumberField.Set.HasDirichletDensity (frobeniusPrimeSet K L 1)
      (1 / (Nat.card (L ≃ₐ[K] L) : ℝ)) := sorry

end Frobenius

section Cyclotomic

variable (K F : Type*) [Field K] [NumberField K] [Field F] [NumberField F]
  [Algebra K F] [IsGalois K F]

/-- **Layer 4**, the canonical cyclotomic weight. Its bad-prime value is fixed to zero; it is not
an arbitrary weight constrained only at unramified primes.
⚠ The supplier's carrier is `MultiplicativeIdealWeight`; the accepted #192 has no `IdealWeight`,
and naming one here would be a Chebotarev-local stand-in for a merged declaration. -/
noncomputable def cyclotomicCharacterWeight (χ : (F ≃ₐ[K] F) →* ℂˣ) :
    TauCetiRoadmap.ArithmeticDirichletSeries.MultiplicativeIdealWeight K := sorry

/-- **Layer 4**, the weight vanishes at ramified primes. Applied through the supplier's `CoeFun`,
not through a projection name. -/
theorem cyclotomicCharacterWeight_eq_zero (χ : (F ≃ₐ[K] F) →* ℂˣ)
    {𝔭 : HeightOneSpectrum (𝓞 K)}
    (h𝔭 : ¬ ∀ (Q : Ideal (𝓞 F)) [Q.IsPrime] [Q.LiesOver 𝔭.asIdeal],
      Algebra.IsUnramifiedAt (𝓞 K) Q) :
    cyclotomicCharacterWeight K F χ 𝔭.asIdeal = 0 := sorry

/-- **Layer 5**, the continued cyclotomic character series. Its construction factors through the
consumed ray-class character and uses ray-class ideal counting, not total ideal counting. -/
noncomputable def cyclotomicCharacterSeriesC (χ : (F ≃ₐ[K] F) →* ℂˣ) : ℂ → ℂ := sorry

theorem cyclotomicCharacterSeriesC_ne_zero_at_one (m : ℕ) [NeZero m]
    [IsCyclotomicExtension {m} K F] (χ : (F ≃ₐ[K] F) →* ℂˣ) (hχ : χ ≠ 1) :
    cyclotomicCharacterSeriesC K F χ 1 ≠ 0 := sorry

/-- **Layer 6**, cyclotomic Dirichlet density. -/
theorem hasDirichletDensity_cyclotomicFrobenius (m : ℕ) [NeZero m]
    [IsCyclotomicExtension {m} K F] (σ : F ≃ₐ[K] F) :
    NumberField.Set.HasDirichletDensity (frobeniusPrimeSet K F (ConjClasses.mk σ))
      (1 / (Nat.card (F ≃ₐ[K] F) : ℝ)) := sorry

/-- **Layer 6**, Dirichlet's primes-in-arithmetic-progressions corollary over `ℚ`. This is
derived by comparing cyclotomic arithmetic Frobenius with Mathlib's Dirichlet-primes theorem. -/
theorem hasDirichletDensity_primesCongruent (m a : ℕ) [NeZero m]
    (ha : IsUnit (a : ZMod m)) :
    NumberField.Set.HasDirichletDensity
      {𝔭 : HeightOneSpectrum (𝓞 ℚ) | Ideal.absNorm 𝔭.asIdeal % m = a % m}
      (1 / (Nat.totient m : ℝ)) := sorry

end Cyclotomic

section Crossing

variable (K L : Type*) [Field K] [NumberField K] [Field L] [NumberField L]
  [Algebra K L] [IsGalois K L]

/-- **Layers 7--8**, elements of the auxiliary cyclic group whose order is divisible by `f`. -/
noncomputable def taggedElements {H : Type*} [Group H] [Fintype H] (f : ℕ) : Finset H :=
  Finset.univ.filter fun τ => f ∣ orderOf τ

/-- **Layer 8**, the lower-bound constant from one auxiliary prime. -/
noncomputable def crossingConstant {H : Type*} [Group H] [Fintype H] (f : ℕ) : ℝ :=
  ((taggedElements (H := H) f).card : ℝ) /
    ((Nat.card (L ≃ₐ[K] L) : ℝ) * (Nat.card H : ℝ))

/-- **Layer 8**, the exact cyclic count. The degree-four `f = 2` case returns three tagged
elements and detects a construction retaining only one generator. -/
theorem card_taggedElements_cyclic {H : Type*} [Group H] [Fintype H] [IsCyclic H]
    (f : ℕ) (hfpos : 0 < f) (hf : f ∣ Nat.card H) :
    ((taggedElements (H := H) f).card : ℝ) =
      (Nat.card H : ℝ) * ∏ p ∈ f.primeFactors,
        (1 - (p : ℝ) ^ (-(((Nat.card H).factorization p - f.factorization p + 1 : ℕ) : ℤ))) :=
  sorry

/-- **Layer 8**, abelian Chebotarev, before the fixed-field reduction. -/
theorem hasDirichletDensity_abelianFrobenius
    (hab : ∀ σ τ : L ≃ₐ[K] L, σ * τ = τ * σ) (σ : L ≃ₐ[K] L) :
    NumberField.Set.HasDirichletDensity (frobeniusPrimeSet K L (ConjClasses.mk σ))
      (1 / (Nat.card (L ≃ₐ[K] L) : ℝ)) := sorry

section FixedField

/-- The fixed field of the cyclic subgroup generated by `σ`. -/
noncomputable abbrev cyclicFixedField (σ : L ≃ₐ[K] L) : IntermediateField K L :=
  IntermediateField.fixedField (Subgroup.zpowers σ)

/-- The generator of `Gal(L / L^⟨σ⟩)` corresponding to `σ`. -/
noncomputable def fixedFieldGenerator (σ : L ≃ₐ[K] L) :
    L ≃ₐ[cyclicFixedField K L σ] L :=
  IntermediateField.subgroupEquivAlgEquiv (Subgroup.zpowers σ)
    ⟨σ, Subgroup.mem_zpowers σ⟩

/-- A closed application of the supplier's prime-relative tower theorem. The restriction runs
from `Gal(L/L^⟨σ⟩)` to `Gal(L/K)`, and the absolute Frobenius is raised to the residue degree
of the intermediate prime. -/
theorem artinClass_restrict_fixedField (σ : L ≃ₐ[K] L)
    (Q : Ideal (𝓞 L)) (𝔓 : Ideal (𝓞 (cyclicFixedField K L σ)))
    (𝔭 : Ideal (𝓞 K))
    (hQE : Q.under (𝓞 (cyclicFixedField K L σ)) = 𝔓)
    (hQK : Q.under (𝓞 K) = 𝔭)
    (hur : ∀ (Q' : Ideal (𝓞 L)) [Q'.IsPrime] [Q'.LiesOver 𝔭],
      Algebra.IsUnramifiedAt (𝓞 K) Q')
    (τ : L ≃ₐ[K] L) (hτ : IsArithFrobAt (𝓞 K) τ Q) :
    ∃ τE : L ≃ₐ[cyclicFixedField K L σ] L,
      IsArithFrobAt (𝓞 (cyclicFixedField K L σ)) τE Q ∧
        AlgEquiv.restrictScalars K τE = τ ^ 𝔓.inertiaDeg (𝓞 K) :=
  TauCetiRoadmap.NumberFieldArithmetic.exists_isArithFrobAt_pow_inertiaDeg
    (cyclicFixedField K L σ) Q 𝔓 𝔭 hQE hQK hur τ hτ

/-- The relative Frobenius fibre over the cyclic fixed field. -/
def fixedFieldFrobeniusPrimeSet (σ : L ≃ₐ[K] L) :
    Set (HeightOneSpectrum (𝓞 (cyclicFixedField K L σ))) :=
  frobeniusPrimeSet (cyclicFixedField K L σ) L
    (ConjClasses.mk (fixedFieldGenerator K L σ))

/-- The finite exceptional set used simultaneously in contraction and in the relative Artin
symbol. -/
noncomputable def fixedFieldExceptionalPrimes (σ : L ≃ₐ[K] L) :
    Finset (HeightOneSpectrum (𝓞 (cyclicFixedField K L σ))) :=
  ramifiedPrimes (cyclicFixedField K L σ) L

/-- Away from the named finite exceptional set, the relative cyclic Frobenius fibre is exactly
the residue-degree-one preimage of the absolute conjugacy-class fibre. -/
theorem frobeniusPrimeSet_preimage_fixedField
    (C : ConjClasses (L ≃ₐ[K] L)) (σ : L ≃ₐ[K] L) (hσ : σ ∈ C.carrier) :
    {𝔓 | 𝔓 ∉ fixedFieldExceptionalPrimes K L σ ∧
        𝔓 ∈ fixedFieldFrobeniusPrimeSet K L σ} =
      {𝔓 | 𝔓 ∉ fixedFieldExceptionalPrimes K L σ ∧
        𝔓.asIdeal.inertiaDeg (𝓞 K) = 1 ∧
          ∃ 𝔭 ∈ frobeniusPrimeSet K L C,
            𝔓.asIdeal.under (𝓞 K) = 𝔭.asIdeal} := sorry

/-- Exact cardinality of the residue-degree-one relative fibre over one unramified prime. -/
theorem fixedField_frobenius_fiber_card
    (C : ConjClasses (L ≃ₐ[K] L)) (σ : L ≃ₐ[K] L) (hσ : σ ∈ C.carrier)
    (𝔭 : HeightOneSpectrum (𝓞 K)) (h𝔭 : 𝔭 ∈ frobeniusPrimeSet K L C) :
    Nat.card {𝔓 : HeightOneSpectrum (𝓞 (cyclicFixedField K L σ)) //
      𝔓.asIdeal.under (𝓞 K) = 𝔭.asIdeal ∧
        𝔓 ∈ fixedFieldFrobeniusPrimeSet K L σ} =
      Nat.card (L ≃ₐ[K] L) / (Nat.card C.carrier * orderOf σ) := sorry

/-- The fixed-field reduction multiplies relative density `1 / orderOf σ` by the exact number
of generators/conjugates in each contracted fibre, yielding `|C|/|G|`. -/
theorem density_frobeniusClass_of_cyclic_fixedField
    (C : ConjClasses (L ≃ₐ[K] L)) (σ : L ≃ₐ[K] L) (hσ : σ ∈ C.carrier) :
    NumberField.Set.HasDirichletDensity (frobeniusPrimeSet K L C)
      ((Nat.card C.carrier : ℝ) / (Nat.card (L ≃ₐ[K] L) : ℝ)) := sorry

end FixedField

section CyclotomicCrossing

variable {Ω : Type*} [Field Ω] [Algebra K Ω]

/-- The auxiliary cyclotomic crossing is linearly disjoint when the two intermediate fields
have trivial intersection. This is the hypothesis that produces the product Galois group and
keeps all tagged Frobenius fibres disjoint. -/
theorem cyclotomicCrossing_linearDisjoint (q : ℕ) [NeZero q]
    (A B : IntermediateField K Ω) [IsGalois K A] [IsGalois K B]
    [IsCyclotomicExtension {q} K B] (hinter : A ⊓ B = ⊥) :
    A.LinearDisjoint B := sorry

end CyclotomicCrossing

end Crossing

section PrimeCounting

variable (K L : Type*) [Field K] [NumberField K] [Field L] [NumberField L]
  [Algebra K L] [IsGalois K L]

open scoped Classical in
/-- **Layer 11, the nonnegative Frobenius von Mangoldt coefficient.** A prime power `𝔭^j`
contributes exactly when the `j`-th power of its consumed Artin class is `C`. -/
noncomputable def frobeniusVonMangoldtCoeff (C : ConjClasses (L ≃ₐ[K] L)) (n : ℕ) : ℝ :=
  ∑ᶠ p : {p : HeightOneSpectrum (𝓞 K) × ℕ // 0 < p.2 ∧
      Ideal.absNorm p.1.asIdeal ^ p.2 = n ∧
      ∃ (hur : ∀ (Q : Ideal (𝓞 L)) [Q.IsPrime] [Q.LiesOver p.1.asIdeal],
          Algebra.IsUnramifiedAt (𝓞 K) Q),
        TauCetiRoadmap.Chebotarev.ConjClasses.pow
          (TauCetiRoadmap.NumberFieldArithmetic.artinSymbol p.1.asIdeal hur) p.2 = C},
    Real.log (Ideal.absNorm (p : HeightOneSpectrum (𝓞 K) × ℕ).1.asIdeal)

theorem frobeniusVonMangoldtCoeff_nonneg (C : ConjClasses (L ≃ₐ[K] L)) (n : ℕ) :
    0 ≤ frobeniusVonMangoldtCoeff K L C n := sorry

/-- **Layer 12**, the weighted Frobenius summatory function. -/
noncomputable def frobeniusPsi (C : ConjClasses (L ≃ₐ[K] L)) (x : ℝ) : ℝ :=
  ∑ n ∈ Finset.range ⌊x⌋₊.succ, frobeniusVonMangoldtCoeff K L C n

/-- **Layer 13**, the prime-only weighted function `ϑ_C`. -/
noncomputable def frobeniusTheta (C : ConjClasses (L ≃ₐ[K] L)) (x : ℝ) : ℝ :=
  ∑ᶠ 𝔭 : {𝔭 : HeightOneSpectrum (𝓞 K) //
      𝔭 ∈ frobeniusPrimeSet K L C ∧ (Ideal.absNorm 𝔭.asIdeal : ℝ) ≤ x},
    Real.log (Ideal.absNorm (𝔭 : HeightOneSpectrum (𝓞 K)).asIdeal)

/-- **Layer 13**, the canonical Frobenius prime count `π_C`. -/
noncomputable def frobeniusPrimeCount (C : ConjClasses (L ≃ₐ[K] L)) (x : ℝ) : ℕ :=
  Nat.card {𝔭 : HeightOneSpectrum (𝓞 K) //
    𝔭 ∈ frobeniusPrimeSet K L C ∧ (Ideal.absNorm 𝔭.asIdeal : ℝ) ≤ x}

/-- **Layer 13**, qualitative prime-counting Chebotarev. -/
theorem tendsto_frobeniusPrimeCount (C : ConjClasses (L ≃ₐ[K] L)) :
    Tendsto
      (fun x : ℝ => (frobeniusPrimeCount K L C x : ℝ) / (x / Real.log x))
      atTop (𝓝 ((Nat.card C.carrier : ℝ) / (Nat.card (L ≃ₐ[K] L) : ℝ))) := sorry

/-- **Layer 14**, natural-density Chebotarev. This is proved from the counting theorem, not from
Dirichlet density. -/
theorem hasNaturalDensity_frobeniusPrimeSet (C : ConjClasses (L ≃ₐ[K] L)) :
    TauCetiRoadmap.ArithmeticDirichletSeries.HasNaturalDensity K
      (frobeniusPrimeSet K L C)
      ((Nat.card C.carrier : ℝ) / (Nat.card (L ≃ₐ[K] L) : ℝ)) := sorry

end PrimeCounting

/-! ### Mandatory power regression

For a cyclic group of order four generated by `g`, the square of the class of `g` is the class of
`g^2`. Consequently a prime with Frobenius `g` contributes its square prime-power term to the
`g^2` von Mangoldt fibre. The implementation must discharge this as a concrete `ZMod 4` or
equivalent cyclic-extension example; a quadratic test does not exercise a proper nonidentity
square and is not accepted as a substitute.
-/

end TauCetiRoadmap.Chebotarev
