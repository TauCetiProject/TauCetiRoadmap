import Mathlib
import TauCeti.AlgebraicGeometry.AbelianVariety.MorphismGroup
import TauCeti.NumberTheory.ClassGroup.Equiv
import TauCeti.NumberTheory.DirichletCharacter.GeneralizedBernoulli
import TauCeti.NumberTheory.ModularForms.Newforms.Newform

/-!
# Cyclotomic class groups and Stickelberger theory: headline statements

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. These statements suggest Lean forms for headline results; discharging
all of them finishes neither a layer nor the roadmap.

The statements cover Hilbert 92 and exact Hilbert 94, full integral Stickelberger
annihilation, Bernoulli annihilators, signed Gauss sums and abelian
class-number products, the relative class-number bound, finite freeness of abelian
Hom groups, the prime-level cuspidal eigenlift, Herbrand–Ribet, Kummer's criterion and unit lemma, regular and dyadic
prime-power stability, the circular-unit index, Iwasawa class-number growth, and
inverse-character vanishing at every positive prime-power level. The class action
is covariant. Tame eigenspaces impose no condition on the wild action. Circular
units use roots of unity and integral ratios on native integer rings.

The relative-unit residue systems and general reflection inequalities require the
relative-unit and unramified Kummer-radical modules of Layers 1 and 3. Their
arithmetic comparison maps and the equivariant Hilbert class field are absent from
the pins. The modular quotient, abelian Tate realization,
endomorphism polynomial, numerical intersection and Rosati objects of Layer 4
are also absent, as are its scheme-valued Barsotti–Tate groups and local
Hodge–Tate comparison. The native abelian Hom group does exist, so its finite-free
statement appears here. The norm-limit statements of Layer 7 require the arithmetic
tower and completed action, although their numerical growth conclusion is
statable. The unramified-extension and constant étale-cohomology conclusions of
Layer 8 require the equivariant class-field and number-ring torsor comparisons;
no replacement predicates or abstract extensions are used here. Vandiver's
universal assertion remains a conjecture in the README.
-/

open scoped BigOperators TensorProduct Cyclotomic Classical
open scoped TauCeti.AlgebraicGeometry.AbelianVariety.Hom
open CategoryTheory NumberField

namespace TauCetiRoadmap.CyclotomicClassGroupsAndStickelberger

local instance (m : ℕ) [NeZero m] :
    IsCyclotomicExtension {m} ℚ (CyclotomicField m ℚ) :=
  CyclotomicField.isCyclotomicExtension m ℚ

/-- Scalar extension of the native covariant action on ideal classes. -/
noncomputable def cyclotomicClassAction (R : Type*) [CommRing R]
    (m : ℕ) [NeZero m] (a : (ZMod m)ˣ) :
    Module.End R (R ⊗[ℤ] Additive (ClassGroup (𝓞 (CyclotomicField m ℚ)))) :=
  LinearMap.baseChange R
    ((ClassGroup.mulEquivHom
      (RingOfIntegers.mapRingEquiv
        (((IsCyclotomicExtension.Rat.galEquivZMod m (CyclotomicField m ℚ)).symm a).toRingEquiv))).toAdditive.toAddMonoidHom.toIntLinearMap)

/-- The tame ωⁱ submodule at conductor pʳ. Only the (p−1)st roots of unity
in the residue-unit group act in this condition; the wild action is retained. -/
noncomputable def cyclotomicClassEigenspace (p r : ℕ) [Fact p.Prime] [NeZero p]
    (hr : 1 ≤ r) (ω : (ZMod p)ˣ →* ℤ_[p]ˣ) (i : ℤ) :
    Submodule ℤ_[p]
      (ℤ_[p] ⊗[ℤ] Additive (ClassGroup (𝓞 (CyclotomicField (p ^ r) ℚ)))) :=
  ⨅ a : rootsOfUnity (p - 1) (ZMod (p ^ r)),
    LinearMap.ker (cyclotomicClassAction ℤ_[p] (p ^ r) a.val -
      (((ω (ZMod.unitsMap (dvd_pow_self p (by omega : r ≠ 0)) a.val)) ^ i : ℤ_[p]ˣ) :
        ℤ_[p]) • LinearMap.id)

/-- Hilbert 92: in a prime-degree cyclic extension unramified at infinity,
there exists a norm-one integral unit which is not a unit coboundary (README §1.3). -/
theorem hilbert92 (K L : Type*) [Field K] [NumberField K]
    [Field L] [NumberField L] [Algebra K L] [IsGalois K L]
    (hprime : (Module.finrank K L).Prime)
    (h_infty : ∀ w : InfinitePlace L, w.IsUnramified K)
    (σ : L ≃ₐ[K] L) (hσ : orderOf σ = Module.finrank K L) :
    ∃ u : (𝓞 L)ˣ, Units.map (RingOfIntegers.norm K) u = 1 ∧
      ∀ v : (𝓞 L)ˣ,
        u ≠ Units.map (RingOfIntegers.mapRingEquiv σ.toRingEquiv).toMonoidHom v / v := by
  sorry

/-- Exact Hilbert 94 for any cyclic extension unramified at every place:
the capitulation kernel has order [L:K] times the unit norm index (README §1.6). -/
theorem hilbert94_card (K L : Type*) [Field K] [NumberField K]
    [Field L] [NumberField L] [Algebra K L] [IsGalois K L]
    [IsCyclic (L ≃ₐ[K] L)] [Algebra.Unramified (𝓞 K) (𝓞 L)]
    (h_infty : ∀ w : InfinitePlace L, w.IsUnramified K) :
    Nat.card (ClassGroup.extendedHom (𝓞 K) (𝓞 L)).ker =
      Module.finrank K L * (Units.map (RingOfIntegers.norm K (L := L))).range.index := by
  sorry

/-- The rational Stickelberger element, with the inverse on the group-ring basis. -/
noncomputable def stickelberger (m : ℕ) [NeZero m] : MonoidAlgebra ℚ (ZMod m)ˣ :=
  ∑ a : (ZMod m)ˣ, MonoidAlgebra.single a⁻¹ ((a.val.val : ℚ) / m)

/-- The native coefficient-extension map from the integral to the rational group ring. -/
noncomputable def integralGroupRingCast (m : ℕ) :
    MonoidAlgebra ℤ (ZMod m)ˣ →+* MonoidAlgebra ℚ (ZMod m)ˣ :=
  MonoidAlgebra.mapRingHom _ (Int.castRingHom ℚ)

/-- Integral group-ring multiples of θ whose coefficients are integral.
The multiplier belongs to ℤ[G], as required by README §2.2. -/
noncomputable def stickelbergerIdeal (m : ℕ) [NeZero m] :
    Ideal (MonoidAlgebra ℤ (ZMod m)ˣ) where
  carrier := {y | ∃ x, integralGroupRingCast m y =
    integralGroupRingCast m x * stickelberger m}
  zero_mem' := ⟨0, by simp⟩
  add_mem' := by
    rintro u v ⟨x, hx⟩ ⟨y, hy⟩
    exact ⟨x + y, by simp only [map_add, hx, hy, add_mul]⟩
  smul_mem' := by
    rintro r u ⟨x, hx⟩
    exact ⟨r * x, by simp only [smul_eq_mul, map_mul, hx, mul_assoc]⟩

/-- The integral Stickelberger ideal annihilates the full native class group
at every conductor, in any cyclotomic number-field model (README §2.5). -/
theorem stickelbergerIdeal_annihilates (m : ℕ) [NeZero m]
    (K : Type*) [Field K] [NumberField K] [IsCyclotomicExtension {m} ℚ K]
    (hm : 2 ≤ m) (x : MonoidAlgebra ℤ (ZMod m)ˣ) (hx : x ∈ stickelbergerIdeal m)
    (c : ClassGroup (𝓞 K)) :
    (∏ a : (ZMod m)ˣ,
      (ClassGroup.mulEquivHom
        (RingOfIntegers.mapRingEquiv
          (((IsCyclotomicExtension.Rat.galEquivZMod m K).symm a).toRingEquiv)) c) ^
        x.coeff a) = 1 := by
  sorry

/-- The primitive-conductor Bernoulli scalar is integral and kills the odd
ωⁱ class component for i ≢ 1 modulo p−1 (README §3.2). -/
theorem bernoulli_annihilates_component (p : ℕ) [Fact p.Prime] [NeZero p]
    (hodd : p ≠ 2) (ω : (ZMod p)ˣ →* ℤ_[p]ˣ)
    (hω : ∀ a, PadicInt.toZMod ((ω a : ℤ_[p]ˣ) : ℤ_[p]) = (a : ZMod p))
    (i : ℤ) (hi : Odd i) (hne : ¬ (p - 1 : ℤ) ∣ i - 1) :
    let χ : DirichletCharacter ℚ_[p] p :=
      MulChar.ofUnitHom ((Units.map (algebraMap ℤ_[p] ℚ_[p]).toMonoidHom).comp (ω ^ (-i)))
    ∃ b : ℤ_[p], (b : ℚ_[p]) = χ.generalizedBernoulli 1 ∧
      ∀ x ∈ cyclotomicClassEigenspace p 1 (by omega) ω i, b • x = 0 := by
  sorry

/-- The signed Gauss-sum evaluation at every primitive quadratic conductor
(README §3.4), with the positive exponential and positive real square root. -/
theorem quadraticCharacter_gaussSum (f : ℕ) [NeZero f]
    (χ : DirichletCharacter ℂ f) (hχ : χ.IsPrimitive) (hquad : χ.IsQuadratic) :
    (χ.Even → gaussSum χ ZMod.stdAddChar = (Real.sqrt (f : ℝ) : ℂ)) ∧
      (χ.Odd → gaussSum χ ZMod.stdAddChar =
        Complex.I * (Real.sqrt (f : ℝ) : ℂ)) := by
  sorry

/-- The Hasse unit index is one at every CM prime-power conductor (README §3.4). -/
theorem primePower_indexRealUnits_eq_one (p r : ℕ) (hp : p.Prime)
    (hr : 1 ≤ r) (hm : 2 < p ^ r)
    (K : Type*) [Field K] [NumberField K] [NumberField.IsCMField K]
    [IsCyclotomicExtension {p ^ r} ℚ K] :
    NumberField.IsCMField.indexRealUnits K = 1 := by
  sorry

/-- The primitive Gauss sums of every abelian subfield have product
with phase i^(r₂) and magnitude √|D| (README §3.4). -/
theorem abelianCharacter_gauss_product (m : ℕ) [NeZero m]
    (K : Type*) [Field K] [NumberField K] [IsCyclotomicExtension {m} ℚ K]
    [IsAbelianGalois ℚ K] (F : IntermediateField ℚ K) :
    let X := IsCyclotomicExtension.Rat.intermediateFieldEquivSubgroupChar m K ℂ F
    (∏ χ : DirichletCharacter ℂ m,
      letI : NeZero χ.conductor := ⟨χ.conductor_ne_zero⟩
      if χ ∈ X then gaussSum χ.primitiveCharacter ZMod.stdAddChar else 1) =
        Complex.I ^ NumberField.InfinitePlace.nrComplexPlaces F *
          (Real.sqrt |(NumberField.discr F : ℝ)| : ℂ) := by
  sorry

/-- The relative class number of every abelian CM subfield is the odd-character
Bernoulli product, evaluated at primitive conductors (README §3.4). -/
theorem relativeClassNumber_character_product (m : ℕ) [NeZero m]
    (K : Type*) [Field K] [NumberField K] [IsCyclotomicExtension {m} ℚ K]
    [IsAbelianGalois ℚ K] (F : IntermediateField ℚ K) [IsCMField F] :
    let X := IsCyclotomicExtension.Rat.intermediateFieldEquivSubgroupChar m K ℂ F
    (NumberField.classNumber F : ℂ) / NumberField.classNumber (maximalRealSubfield F) =
      (IsCMField.indexRealUnits F : ℂ) * Units.torsionOrder F *
        ∏ χ : DirichletCharacter ℂ m,
          letI : NeZero χ.conductor := ⟨χ.conductor_ne_zero⟩
          if χ ∈ X ∧ χ.Odd then -χ.primitiveCharacter.generalizedBernoulli 1 / 2 else 1 := by
  sorry

/-- The class number times regulator of every totally real abelian subfield
is the primitive-character logarithmic product (README §3.4). -/
theorem realClassNumber_log_product (m : ℕ) [NeZero m]
    (K : Type*) [Field K] [NumberField K] [IsCyclotomicExtension {m} ℚ K]
    [IsAbelianGalois ℚ K] (F : IntermediateField ℚ K) [IsTotallyReal F] :
    let X := IsCyclotomicExtension.Rat.intermediateFieldEquivSubgroupChar m K ℂ F
    (NumberField.classNumber F : ℂ) * (Units.regulator F : ℂ) =
      ∏ χ : DirichletCharacter ℂ m,
        letI : NeZero χ.conductor := ⟨χ.conductor_ne_zero⟩
        if χ ∈ X ∧ χ ≠ 1 then
          -(1 / 2 : ℂ) * ∑ a : ZMod χ.conductor,
            χ.primitiveCharacter a * (Real.log ‖1 - (ZMod.stdAddChar a : ℂ)‖ : ℂ)
        else 1 := by
  sorry

/-- The relative class-number bound at every odd prime (README §4.1). -/
theorem relativeClassNumber_lt (p : ℕ) [NeZero p] (hp : p.Prime) (hodd : p ≠ 2) :
    (NumberField.classNumber (CyclotomicField p ℚ) : ℝ) /
        NumberField.classNumber
          (NumberField.maximalRealSubfield (CyclotomicField p ℚ)) <
      (p : ℝ) ^ (((p : ℝ) - 1) / 4) := by
  sorry

/-- An irregular Bernoulli index gives a normalized prime-level weight-two
newform with the specified character and one common coefficient reduction
for all prime Hecke congruences (README §4.2). -/
theorem primeLevel_cuspidal_eigenlift (p : ℕ) [Fact p.Prime] [NeZero p]
    (hodd : p ≠ 2) (k : ℕ) (hk : 2 ≤ k) (hkp : k ≤ p - 3)
    (heven : Even k) (hirreg : (p : ℤ) ∣ (bernoulli k).num) :
    ∃ (f : HeckeRing.GL2.Newform p 2) (E : Subfield ℂ) (hE : NumberField E),
      letI := hE
      ∃ (red : 𝓞 E →+* AlgebraicClosure (ZMod p))
        (ω : (ZMod p)ˣ →* (𝓞 E)ˣ) (c : ℕ → 𝓞 E),
        (∀ a, red (ω a : 𝓞 E) = algebraMap (ZMod p) (AlgebraicClosure (ZMod p)) a.val) ∧
        (∀ a, (f.χ a : ℂ) = ((ω a : 𝓞 E) : ℂ) ^ (k - 2)) ∧
        (∀ n, (c n : ℂ) = (UpperHalfPlane.qExpansion 1 f.toCuspForm).coeff n) ∧
        ∀ ℓ : ℕ, ℓ.Prime → ℓ ≠ p →
          red (c ℓ) = 1 + (algebraMap (ZMod p) (AlgebraicClosure (ZMod p)) (ℓ : ZMod p)) ^
            (k - 1) := by
  sorry

/-- Over any field, abelian Hom groups are finite free over ℤ, with rank at
most four times the product of the dimensions (README §4.3). -/
theorem homFreeFinite (k : Type*) [Field k]
    (B C : TauCeti.AlgebraicGeometry.AbelianVariety k) :
    Module.Free ℤ (Additive (B ⟶ C)) ∧
      Module.Finite ℤ (Additive (B ⟶ C)) ∧
        (Module.finrank ℤ (Additive (B ⟶ C)) : WithBot ℕ∞) ≤ 4 * B.dim * C.dim := by
  sorry

/-- Herbrand–Ribet: Bernoulli divisibility detects precisely the nonzero
covariant character component with exponent 1−k (README §4.5). -/
theorem herbrand_ribet (p : ℕ) [Fact p.Prime] [NeZero p]
    (hodd : p ≠ 2) (ω : (ZMod p)ˣ →* ℤ_[p]ˣ)
    (hω : ∀ a, PadicInt.toZMod ((ω a : ℤ_[p]ˣ) : ℤ_[p]) = (a : ZMod p))
    (k : ℕ) (hk : 2 ≤ k) (hkp : k ≤ p - 3) (heven : Even k) :
    cyclotomicClassEigenspace p 1 (by omega) ω (1 - (k : ℤ)) ≠ ⊥ ↔
      (p : ℤ) ∣ (bernoulli k).num := by
  sorry

/-- Nondivisibility of the full native class number; primality is a theorem hypothesis. -/
def IsRegularPrime (p : ℕ) [NeZero p] : Prop :=
  ¬ p ∣ NumberField.classNumber (CyclotomicField p ℚ)

/-- Kummer's regular-prime criterion for the full class number (README §5.1). -/
theorem kummer_criterion (p : ℕ) [NeZero p] (hp : p.Prime) (hodd : p ≠ 2) :
    IsRegularPrime p ↔
      ∀ k : ℕ, 2 ≤ k → k ≤ p - 3 → Even k → ¬ (p : ℤ) ∣ (bernoulli k).num := by
  sorry

/-- Kummer's unit lemma, with congruence to a rational integer modulo p
on the native integral unit group (README §5.3). -/
theorem kummer_lemma (p : ℕ) [NeZero p] (hp : p.Prime) (hodd : p ≠ 2)
    (hreg : IsRegularPrime p)
    (u : (𝓞 (CyclotomicField p ℚ))ˣ)
    (hprimary : ∃ a : ℤ, ∃ b : 𝓞 (CyclotomicField p ℚ),
      (u : 𝓞 (CyclotomicField p ℚ)) - a = (p : 𝓞 (CyclotomicField p ℚ)) * b) :
    ∃ v : (𝓞 (CyclotomicField p ℚ))ˣ, v ^ p = u := by
  sorry

/-- Regular odd primes have trivial p-primary class group at every positive
prime-power level (README §5.4). -/
theorem regular_prime_power_class_number (p : ℕ) [NeZero p]
    (hp : p.Prime) (hodd : p ≠ 2) (hreg : IsRegularPrime p) (r : ℕ) (hr : 1 ≤ r) :
    ¬ p ∣ NumberField.classNumber (CyclotomicField (p ^ r) ℚ) := by
  sorry

/-- Every positive level of the dyadic cyclotomic tower has odd class number
(README §5.4). -/
theorem dyadic_class_number (r : ℕ) (hr : 1 ≤ r) :
    ¬ 2 ∣ NumberField.classNumber (CyclotomicField (2 ^ r) ℚ) := by
  sorry

/-- The real prime-power class numbers are also prime to a regular p,
including p=2 (README §5.4). -/
theorem regular_prime_power_real_class_number (p : ℕ) [NeZero p]
    (hp : p.Prime) (hreg : IsRegularPrime p) (r : ℕ) (hr : 1 ≤ r) :
    ¬ p ∣ NumberField.classNumber
      (NumberField.maximalRealSubfield (CyclotomicField (p ^ r) ℚ)) := by
  sorry

/-- The native integral geometric-sum unit with field value (1−ζᵃ)/(1−ζ). -/
noncomputable def cyclotomicUnit {A : Type*} [CommRing A] [IsDomain A]
    {m : ℕ} [NeZero m] (ζ : A) (hζ : IsPrimitiveRoot ζ m) (hm : 2 ≤ m)
    (a : (ZMod m)ˣ) : Aˣ :=
  (hζ.geom_sum_isUnit hm (ZMod.val_coe_unit_coprime a)).unit

/-- The subgroup generated by all roots of unity and the integral ratios.
At prime-power conductor it is the circular-unit intersection of README §6.1. -/
noncomputable def circularUnits (K : Type*) [Field K] [NumberField K]
    {m : ℕ} [NeZero m] (ζ : 𝓞 K) (hζ : IsPrimitiveRoot ζ m) (hm : 2 ≤ m) :
    Subgroup (𝓞 K)ˣ :=
  Units.torsion K ⊔ Subgroup.closure (Set.range (cyclotomicUnit ζ hζ hm))

/-- The prime-power circular-unit index equals the real class number for
all primes and all positive levels, including powers of two (README §6.3). -/
theorem circularUnit_index (p r : ℕ) [NeZero p] (hp : p.Prime) (hr : 1 ≤ r)
    (K : Type*) [Field K] [NumberField K] [IsCyclotomicExtension {p ^ r} ℚ K]
    (ζ : 𝓞 K) (hζ : IsPrimitiveRoot ζ (p ^ r)) (hm : 2 ≤ p ^ r) :
    (circularUnits K ζ hζ hm).index = NumberField.classNumber (maximalRealSubfield K) := by
  sorry

/-- Eventual Iwasawa class-number growth for every prime, with base conductor
p at odd p and four at p=2 (README §7.3). -/
theorem cyclotomic_class_number_growth (p : ℕ) [NeZero p] (hp : p.Prime) :
    ∃ mu lam : ℕ, ∃ nu : ℤ, ∃ n₀ : ℕ, ∀ n : ℕ, n₀ ≤ n →
      (padicValNat p (NumberField.classNumber
        (CyclotomicField (p ^ (n + (if p = 2 then 2 else 1))) ℚ)) : ℤ) =
        (mu : ℤ) * (p : ℤ) ^ n + (lam : ℤ) * n + nu := by
  sorry

/-- The inverse tame-character component vanishes at every positive
prime-power level, without regularity or Vandiver (README §8.1). -/
theorem inverseCharacterClassGroup_all_levels (p : ℕ) [Fact p.Prime] [NeZero p]
    (hodd : p ≠ 2) (r : ℕ) (hr : 1 ≤ r) (ω : (ZMod p)ˣ →* ℤ_[p]ˣ)
    (hω : ∀ a, PadicInt.toZMod ((ω a : ℤ_[p]ˣ) : ℤ_[p]) = (a : ZMod p)) :
    cyclotomicClassEigenspace p r hr ω (-1) = ⊥ := by
  sorry

end TauCetiRoadmap.CyclotomicClassGroupsAndStickelberger
