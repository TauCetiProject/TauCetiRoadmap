import Mathlib
import TauCeti.NumberTheory.ClassGroup.Equiv
import TauCeti.NumberTheory.DirichletCharacter.GeneralizedBernoulli

/-!
# CyclotomicClassGroupsAndStickelberger: representative target signatures

The roadmap is README.md. This file gives suggested forms of light definitions and theorem
signatures statable against the pinned APIs; it is not an exhaustive checklist. The covariant
ideal-class action, inverse group-ring basis, and dyadic tower shift are explicit.
-/

open scoped BigOperators TensorProduct Cyclotomic Matrix
open NumberField
namespace TauCetiRoadmap.CyclotomicClassGroupsAndStickelberger

local instance (m : ℕ) [NeZero m] :
    IsCyclotomicExtension {m} ℚ (CyclotomicField m ℚ) :=
  CyclotomicField.isCyclotomicExtension m ℚ

/-! ## Layer 0: the covariant class action and tame eigenspaces -/

/-- Scalar extension of the native action σₐ[𝔞] = [σₐ𝔞]. -/
noncomputable def cyclotomicClassAction (R : Type*) [CommRing R]
    (m : ℕ) [NeZero m] (a : (ZMod m)ˣ) :
    Module.End R (R ⊗[ℤ] Additive (ClassGroup (𝓞 (CyclotomicField m ℚ)))) :=
  LinearMap.baseChange R
    ((ClassGroup.mulEquivHom
      (RingOfIntegers.mapRingEquiv
        (((IsCyclotomicExtension.Rat.galEquivZMod m (CyclotomicField m ℚ)).symm a).toRingEquiv))).toAdditive.toAddMonoidHom.toIntLinearMap)

example (R : Type*) [CommRing R] (m : ℕ) [NeZero m] (a : (ZMod m)ˣ)
    (x : ClassGroup (𝓞 (CyclotomicField m ℚ))) :
    cyclotomicClassAction R m a (1 ⊗ₜ[ℤ] Additive.ofMul x) =
      1 ⊗ₜ[ℤ] Additive.ofMul
        (ClassGroup.mulEquivHom
          (RingOfIntegers.mapRingEquiv
            (((IsCyclotomicExtension.Rat.galEquivZMod m (CyclotomicField m ℚ)).symm a).toRingEquiv)) x) := by
  rfl

example :
    ((IsCyclotomicExtension.Rat.galEquivZMod 5 (CyclotomicField 5 ℚ)).symm
      (show (ZMod 5)ˣ from ⟨2, 3, by decide, by decide⟩))
        (IsCyclotomicExtension.zeta 5 ℚ (CyclotomicField 5 ℚ)) =
          IsCyclotomicExtension.zeta 5 ℚ (CyclotomicField 5 ℚ) ^ 2 ∧
    ((IsCyclotomicExtension.Rat.galEquivZMod 5 (CyclotomicField 5 ℚ)).symm
      (show (ZMod 5)ˣ from ⟨3, 2, by decide, by decide⟩))
        (IsCyclotomicExtension.zeta 5 ℚ (CyclotomicField 5 ℚ)) =
          IsCyclotomicExtension.zeta 5 ℚ (CyclotomicField 5 ℚ) ^ 3 := by
  have h (a : (ZMod 5)ˣ) :
      ((IsCyclotomicExtension.Rat.galEquivZMod 5 (CyclotomicField 5 ℚ)).symm a)
        (IsCyclotomicExtension.zeta 5 ℚ (CyclotomicField 5 ℚ)) =
      IsCyclotomicExtension.zeta 5 ℚ (CyclotomicField 5 ℚ) ^ a.val.val := by
    simpa only [MulEquiv.apply_symm_apply] using
      (IsCyclotomicExtension.Rat.galEquivZMod_apply_of_pow_eq
        5 (CyclotomicField 5 ℚ)
        ((IsCyclotomicExtension.Rat.galEquivZMod 5 (CyclotomicField 5 ℚ)).symm a)
        (IsCyclotomicExtension.zeta_spec 5 ℚ (CyclotomicField 5 ℚ)).pow_eq_one)
  exact ⟨h ⟨2, 3, by decide, by decide⟩, h ⟨3, 2, by decide, by decide⟩⟩

/-- The ωⁱ submodule at prime conductor; ω is the multiplicative Teichmüller section.
The section condition is imposed in the theorems, rather than constructing it here. -/
noncomputable def cyclotomicClassEigenspace (p : ℕ) [Fact p.Prime] [NeZero p]
    (ω : (ZMod p)ˣ →* ℤ_[p]ˣ) (i : ℤ) :
    Submodule ℤ_[p]
      (ℤ_[p] ⊗[ℤ] Additive (ClassGroup (𝓞 (CyclotomicField p ℚ)))) :=
  ⨅ a : (ZMod p)ˣ,
    LinearMap.ker (cyclotomicClassAction ℤ_[p] p a -
      (((ω a) ^ i : ℤ_[p]ˣ) : ℤ_[p]) • LinearMap.id)

example (p : ℕ) [Fact p.Prime] [NeZero p] (ω : (ZMod p)ˣ →* ℤ_[p]ˣ)
    (x : ℤ_[p] ⊗[ℤ] Additive (ClassGroup (𝓞 (CyclotomicField p ℚ)))) :
    x ∈ cyclotomicClassEigenspace p ω (-1) ↔
      ∀ a : (ZMod p)ˣ, cyclotomicClassAction ℤ_[p] p a x =
        (((ω a)⁻¹ : ℤ_[p]ˣ) : ℤ_[p]) • x := by
  simp [cyclotomicClassEigenspace, sub_eq_zero]

/-- Every class has a unique sum of tame character components. -/
theorem cyclotomicClassEigenspaces (p : ℕ) [Fact p.Prime] [NeZero p]
    (hodd : p ≠ 2) (ω : (ZMod p)ˣ →* ℤ_[p]ˣ)
    (hω : ∀ a, PadicInt.toZMod ((ω a : ℤ_[p]ˣ) : ℤ_[p]) = (a : ZMod p))
    (x : ℤ_[p] ⊗[ℤ] Additive (ClassGroup (𝓞 (CyclotomicField p ℚ)))) :
    ∃! y : Fin (p - 1) →
        ℤ_[p] ⊗[ℤ] Additive (ClassGroup (𝓞 (CyclotomicField p ℚ))),
      (∀ i, y i ∈ cyclotomicClassEigenspace p ω (i.val : ℤ)) ∧ ∑ i, y i = x := by
  sorry

/-! ## Layer 2: light Stickelberger coefficients -/

/-- Rational group-ring convention: the inverse occurs on the basis element. -/
noncomputable def stickelberger (m : ℕ) [NeZero m] : MonoidAlgebra ℚ (ZMod m)ˣ :=
  ∑ a : (ZMod m)ˣ,
    MonoidAlgebra.single a⁻¹ ((a.val.val : ℚ) / m)

/-- Integral coefficients of the positive smoothing (b - σ_b) θ_m. -/
noncomputable def smoothedStickelberger (m b : ℕ) [NeZero m] : MonoidAlgebra ℤ (ZMod m)ˣ :=
  ∑ a : (ZMod m)ˣ,
    MonoidAlgebra.single a⁻¹ (↑(b * a.val.val / m) : ℤ)

example : (stickelberger 5).coeff (show (ZMod 5)ˣ from ⟨3, 2, by decide, by decide⟩) = 2 / 5 := by
  classical
  norm_num [stickelberger, smoothedStickelberger, MonoidAlgebra.coeff_single, Finsupp.single_apply, inv_eq_iff_eq_inv]
  rfl

example : (stickelberger 5).coeff (show (ZMod 5)ˣ from ⟨2, 3, by decide, by decide⟩) = 3 / 5 := by
  classical
  norm_num [stickelberger, smoothedStickelberger, MonoidAlgebra.coeff_single, Finsupp.single_apply, inv_eq_iff_eq_inv]
  rfl

example : (smoothedStickelberger 5 2).coeff (show (ZMod 5)ˣ from ⟨3, 2, by decide, by decide⟩) = 0 := by
  classical
  norm_num [stickelberger, smoothedStickelberger, MonoidAlgebra.coeff_single, Finsupp.single_apply, inv_eq_iff_eq_inv]
  rfl

example : (smoothedStickelberger 5 2).coeff (show (ZMod 5)ˣ from ⟨2, 3, by decide, by decide⟩) = 1 := by
  classical
  norm_num [stickelberger, smoothedStickelberger, MonoidAlgebra.coeff_single, Finsupp.single_apply, inv_eq_iff_eq_inv]
  rfl

/-- Every positive integral smoothing annihilates the full class group, at every conductor.
The inverse on the automorphism matches the coefficient basis in `stickelberger`. -/
theorem stickelberger_smoothing_annihilates (m b : ℕ) [NeZero m]
    (K : Type*) [Field K] [NumberField K] [IsCyclotomicExtension {m} ℚ K]
    (hm : 2 ≤ m) (hb : b.Coprime m)
    (x : ClassGroup (𝓞 K)) :
    (∏ a : (ZMod m)ˣ,
      (ClassGroup.mulEquivHom
        (RingOfIntegers.mapRingEquiv
          (((IsCyclotomicExtension.Rat.galEquivZMod m K).symm a⁻¹).toRingEquiv)) x) ^
        (b * a.val.val / m)) = 1 := by
  sorry

/-! ## Layer 3: the prime-power Hasse unit index -/

-- The degree-one Bernoulli value is the existing generalized Bernoulli value.
#check DirichletCharacter.generalizedBernoulli_one_of_ne_one

/-- The Hasse unit index is one at every CM prime-power conductor (README §3.4). -/
theorem primePower_indexRealUnits_eq_one (p r : ℕ) (hp : p.Prime)
    (hr : 1 ≤ r) (hm : 2 < p ^ r)
    (K : Type*) [Field K] [NumberField K] [NumberField.IsCMField K]
    [IsCyclotomicExtension {p ^ r} ℚ K] :
    NumberField.IsCMField.indexRealUnits K = 1 := by
  sorry

/-! ## Layer 4: the characterwise Herbrand–Ribet theorem -/

/-- The centered odd residue matrix, with rows indexed by a and columns by b. -/
noncomputable def oddResidueMatrix (p : ℕ) :
    Matrix (Fin ((p - 1) / 2)) (Fin ((p - 1) / 2)) ℤ :=
  fun a b => 2 * (((((a.val + 1 : ℕ) : ZMod p) *
    ((b.val + 1 : ℕ) : ZMod p)⁻¹).val : ℕ) : ℤ) - p
example : oddResidueMatrix 3 = !![-1] := by
  ext i j
  fin_cases i; fin_cases j; decide +kernel
example : oddResidueMatrix 5 = !![-3, 1; -1, -3] := by
  ext i j
  fin_cases i <;> fin_cases j <;> decide +kernel

/-- The odd residue determinant computes the relative class number (README §4.1).
The quotient uses the full native class numbers and is an equality in ℚ. -/
theorem oddResidueMatrix_det (p : ℕ) [NeZero p] (hp : p.Prime) (hodd : p ≠ 2) :
    ((|Matrix.det (oddResidueMatrix p)| : ℤ) : ℚ) =
      (2 * (p : ℚ)) ^ ((p - 1) / 2 - 1) *
        ((NumberField.classNumber (CyclotomicField p ℚ) : ℚ) /
          NumberField.classNumber
            (NumberField.maximalRealSubfield (CyclotomicField p ℚ))) := by
  sorry

/-- Hadamard's bound for the relative class number at every odd prime (README §4.1). -/
theorem relativeClassNumber_lt (p : ℕ) [NeZero p] (hp : p.Prime) (hodd : p ≠ 2) :
    (NumberField.classNumber (CyclotomicField p ℚ) : ℝ) /
        NumberField.classNumber
          (NumberField.maximalRealSubfield (CyclotomicField p ℚ)) <
      (p : ℝ) ^ (((p : ℝ) - 1) / 4) := by
  sorry


/-- Bernoulli divisibility detects the covariant component with exponent 1-k. -/
theorem herbrand_ribet (p : ℕ) [Fact p.Prime] [NeZero p]
    (hodd : p ≠ 2) (ω : (ZMod p)ˣ →* ℤ_[p]ˣ)
    (hω : ∀ a, PadicInt.toZMod ((ω a : ℤ_[p]ˣ) : ℤ_[p]) = (a : ZMod p))
    (k : ℕ) (hk : 2 ≤ k) (hkp : k ≤ p - 3) (heven : Even k) :
    cyclotomicClassEigenspace p ω (1 - (k : ℤ)) ≠ ⊥ ↔
      (p : ℤ) ∣ (bernoulli k).num := by
  sorry

/-! ## Layer 5: class-number regularity -/

/-- Regularity includes the rational conductor-two boundary. -/
def IsRegularPrime (p : ℕ) [NeZero p] : Prop :=
  ¬ p ∣ NumberField.classNumber (CyclotomicField p ℚ)

example : ¬ IsRegularPrime 1 := by
  simp [IsRegularPrime]

example : IsRegularPrime 3 := by
  have h : NumberField.classNumber (CyclotomicField 3 ℚ) = 1 :=
    (NumberField.classNumber_eq_one_iff (K := CyclotomicField 3 ℚ)).mpr
      (IsCyclotomicExtension.Rat.three_pid (CyclotomicField 3 ℚ))
  simp [IsRegularPrime, h]

/-- The statement at one prime, with the native maximal real subfield. -/
def VandiverAt (p : ℕ) [NeZero p] : Prop :=
  ¬ p ∣ NumberField.classNumber
    (NumberField.maximalRealSubfield (CyclotomicField p ℚ))

example : ¬ VandiverAt 1 := by
  simp [VandiverAt]

/-! ## Layer 5: regular-prime milestones -/

/-- Kummer's Bernoulli criterion, with B₁ = -1/2. -/
theorem kummer_criterion (p : ℕ) [NeZero p] (hp : p.Prime) (hodd : p ≠ 2) :
    IsRegularPrime p ↔
      ∀ k : ℕ, 2 ≤ k → k ≤ p - 3 → Even k → ¬ (p : ℤ) ∣ (bernoulli k).num := by
  sorry

/-- Kummer's lemma uses congruence modulo p, rather than modulo 1 - ζ_p. -/
theorem kummer_lemma (p : ℕ) [NeZero p] (hp : p.Prime) (hodd : p ≠ 2)
    (hreg : IsRegularPrime p)
    (u : (𝓞 (CyclotomicField p ℚ))ˣ)
    (hprimary : ∃ a : ℤ, ∃ b : 𝓞 (CyclotomicField p ℚ),
      (u : 𝓞 (CyclotomicField p ℚ)) - a = (p : 𝓞 (CyclotomicField p ℚ)) * b) :
    ∃ v : (𝓞 (CyclotomicField p ℚ))ˣ, v ^ p = u := by
  sorry

/-- Odd-prime regularity kills the p-primary class group at every level. -/
theorem regular_prime_power_class_number (p : ℕ) [NeZero p]
    (hp : p.Prime) (hodd : p ≠ 2) (hreg : IsRegularPrime p) (r : ℕ) (hr : 1 ≤ r) :
    ¬ p ∣ NumberField.classNumber (CyclotomicField (p ^ r) ℚ) := by
  sorry

/-- The dyadic tower has odd class number at every level, including Q. -/
theorem dyadic_class_number (r : ℕ) (hr : 1 ≤ r) :
    ¬ 2 ∣ NumberField.classNumber (CyclotomicField (2 ^ r) ℚ) := by
  sorry

/-- The real prime-power fields also have trivial p-primary class group at a regular prime.
The dyadic case uses norm surjectivity, without dividing by two (README §5.4). -/
theorem regular_prime_power_real_class_number (p : ℕ) [NeZero p]
    (hp : p.Prime) (hreg : IsRegularPrime p) (r : ℕ) (hr : 1 ≤ r) :
    ¬ p ∣ NumberField.classNumber
      (NumberField.maximalRealSubfield (CyclotomicField (p ^ r) ℚ)) := by
  sorry

/-- Regularity implies the statement of Vandiver at that prime. -/
theorem vandiver_of_regular (p : ℕ) [NeZero p] (hp : p.Prime)
    (hodd : p ≠ 2) (hreg : IsRegularPrime p) : VandiverAt p := by
  sorry

/-! ## Layer 7: eventual growth, with the dyadic base at conductor four -/

/-- The shift gives degree p^n over Q(ζ_p), or over Q(i) at p=2. -/
theorem cyclotomic_class_number_growth (p : ℕ) [NeZero p] (hp : p.Prime) :
    ∃ mu lam : ℕ, ∃ nu : ℤ, ∃ n₀ : ℕ, ∀ n : ℕ, n₀ ≤ n →
      (padicValNat p (NumberField.classNumber
        (CyclotomicField (p ^ (n + (if p = 2 then 2 else 1))) ℚ)) : ℤ) =
        (mu : ℤ) * (p : ℤ) ^ n + (lam : ℤ) * n + nu := by
  sorry

/-! ## Layer 8: the inverse-character obstruction -/

/-- Character on Hom from a source character to a target character. -/
def homCharacter {G R : Type*} [Monoid G] [CommGroup R]
    (source target : G →* R) : G →* R := target * source⁻¹
example :
    homCharacter ((MonoidHom.id (ZMod 5)ˣ) ^ 3) 1
      (show (ZMod 5)ˣ from ⟨2, 3, by decide, by decide⟩) =
        (show (ZMod 5)ˣ from ⟨2, 3, by decide, by decide⟩) := by decide
example :
    homCharacter ((MonoidHom.id (ZMod 5)ˣ) ^ 3) (MonoidHom.id (ZMod 5)ˣ)
      (show (ZMod 5)ˣ from ⟨2, 3, by decide, by decide⟩) =
        (show (ZMod 5)ˣ from ⟨4, 4, by decide, by decide⟩) := by decide

/-- The inverse cyclotomic character component vanishes at every odd prime. -/
theorem inverseCharacterClassGroup (p : ℕ) [Fact p.Prime] [NeZero p]
    (hodd : p ≠ 2) (ω : (ZMod p)ˣ →* ℤ_[p]ˣ)
    (hω : ∀ a, PadicInt.toZMod ((ω a : ℤ_[p]ˣ) : ℤ_[p]) = (a : ZMod p)) :
    cyclotomicClassEigenspace p ω (-1) = ⊥ := by
  sorry

/-
The README also specifies cyclotomicClassModule, cyclotomicClassTensorEquiv,
the prime-power cyclotomicClassEigenspace, dyadicNormKernel,
dyadicAntiInvariants, dyadicMinusQuotient, cyclotomicPrime; relativeUnitSat,
relativeUnitQuotient, RelativeFundamentalSystem, invariantIdealResidues,
capitulationKernel, capitulationCocycle, genusClassQuotient; denominatorIdeal,
stickelbergerIdeal, integralStickelbergerMap, compatibleGaussData;
unramifiedKummerRadical, relativeClassNumber; modularAbelianQuotient,
numericalIntersection, abelianEndomorphismPolynomial, the Rosati involution,
finite-flat closures and quotients, PDivisibleGroup and its height, dual, Tate
module, formal tangent space and dimension, LocallyAlgebraicCharacter,
HodgeTate; cyclotomicSUnitSubgroup, circularUnits, realCircularUnits,
cyclotomicUnit, realCyclotomicUnit, circularRegulator; cyclotomicClassInverseLimit,
classLimitProjection and inverseCharacterUnramifiedQuotient. Their arithmetic
comparison theorems, constructions and full APIs belong to the README layers.

README-only API targets include stickelberger_coeff, stickelberger_conjugation,
stickelberger_augmentation, smoothedStickelberger_cast, smoothedStickelberger_mem,
stickelberger_annihilation_equivariant (§2); cyclotomicClassEigenspace_one_eq_zero
(§3.2); oddResidueMatrix_entry, oddResidueMatrix_change_representatives,
oddResidueMatrix_row_norm, oddResidueMatrix_character_eigenvalues (§4.1);
inverseCharacterClassGroup_all_levels (§8.1); homCharacter_apply,
homCharacter_constant_target, homCharacter_self, homCharacter_mul_target (§8.3).
-/

end TauCetiRoadmap.CyclotomicClassGroupsAndStickelberger
