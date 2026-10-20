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

/-- The covariant action transports a pure tensor by the same automorphism. -/
theorem classAction_tensor (R : Type*) [CommRing R] (m : ℕ) [NeZero m] (a : (ZMod m)ˣ)
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

/-- The simultaneous character submodule for a family of linear operators. -/
noncomputable def characterEigenspace {R G M : Type*} [CommRing R]
    [AddCommGroup M] [Module R M] (ρ : G → Module.End R M)
    (ω : G → Rˣ) (i : ℤ) : Submodule R M :=
  ⨅ a : G, LinearMap.ker (ρ a - (((ω a) ^ i : Rˣ) : R) • LinearMap.id)

example :
    let ω : rootsOfUnity 4 (ZMod 25) →* (ZMod 25)ˣ := (rootsOfUnity 4 (ZMod 25)).subtype
    let ρ : Representation (ZMod 25) (rootsOfUnity 4 (ZMod 25)) (ZMod 25) :=
      { toFun := fun a => ((ω a ^ 3 : (ZMod 25)ˣ) : ZMod 25) • LinearMap.id
        map_one' := by ext; simp
        map_mul' := by intro a b; ext; simp [mul_pow, mul_comm] }
    (1 : ZMod 25) ∈ characterEigenspace ρ ω (-1) ∧
      (1 : ZMod 25) ∉ characterEigenspace ρ ω 1 := by
  dsimp only
  constructor
  · simp only [characterEigenspace, Submodule.mem_iInf, LinearMap.mem_ker,
      LinearMap.sub_apply, LinearMap.smul_apply, LinearMap.id_apply, smul_eq_mul,
      mul_one, sub_eq_zero]
    intro a
    have ha : (a.val : (ZMod 25)ˣ) ^ 3 = a.val⁻¹ := by
      apply (eq_inv_iff_mul_eq_one).mpr
      simpa only [← pow_succ] using (mem_rootsOfUnity 4 a.val).mp a.property
    simpa using congrArg Units.val ha
  · intro h
    simp only [characterEigenspace, Submodule.mem_iInf] at h
    have h' := h (⟨⟨7, 18, by decide, by decide⟩, by rw [mem_rootsOfUnity]; decide⟩ : rootsOfUnity 4 (ZMod 25))
    norm_num [LinearMap.mem_ker, LinearMap.sub_apply, LinearMap.smul_apply,
      LinearMap.id_apply, smul_eq_mul] at h'
    exact (by decide : (336 : ZMod 25) ≠ 0) h'

/-- The ωⁱ submodule at prime conductor; ω is the multiplicative Teichmüller section.
The section condition is imposed in the theorems, rather than constructing it here. -/
noncomputable def cyclotomicClassEigenspace (p : ℕ) [Fact p.Prime] [NeZero p]
    (ω : (ZMod p)ˣ →* ℤ_[p]ˣ) (i : ℤ) :
    Submodule ℤ_[p]
      (ℤ_[p] ⊗[ℤ] Additive (ClassGroup (𝓞 (CyclotomicField p ℚ)))) :=
  characterEigenspace (cyclotomicClassAction ℤ_[p] p) ω i

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

/-- Coefficient extension embeds the integral group ring into the rational group ring. -/
noncomputable def integralGroupRingCast (m : ℕ) :
    MonoidAlgebra ℤ (ZMod m)ˣ →+* MonoidAlgebra ℚ (ZMod m)ˣ :=
  MonoidAlgebra.mapRingHom _ (Int.castRingHom ℚ)

/-- Coefficient extension loses no integral group-ring element. -/
theorem integralGroupRingCast_injective (m : ℕ) :
    Function.Injective (integralGroupRingCast m) := by
  intro x y h
  ext a
  have hcoeff := congrArg (fun z => z.coeff a) h
  simpa only [integralGroupRingCast, MonoidAlgebra.coeff_mapRingHom,
    Int.coe_castRingHom, Int.cast_inj] using hcoeff

/-- The integral multipliers whose product with θ has integral coefficients. -/
noncomputable def denominatorIdeal (m : ℕ) [NeZero m] :
    Ideal (MonoidAlgebra ℤ (ZMod m)ˣ) where
  carrier := {x | ∃ y, integralGroupRingCast m y =
    integralGroupRingCast m x * stickelberger m}
  zero_mem' := ⟨0, by simp⟩
  add_mem' := by
    rintro x y ⟨u, hu⟩ ⟨v, hv⟩
    exact ⟨u + v, by simp only [map_add, hu, hv, add_mul]⟩
  smul_mem' := by
    rintro r x ⟨u, hu⟩
    exact ⟨r * u, by simp only [smul_eq_mul, map_mul, hu, mul_assoc]⟩

/-- The integral image of multiplication by θ on its denominator ideal. -/
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

/-- Multiplication by θ with its integral value and image membership. -/
noncomputable def integralStickelbergerMap (m : ℕ) [NeZero m]
    (x : denominatorIdeal m) : stickelbergerIdeal m :=
  ⟨Classical.choose x.property, ⟨x.val, Classical.choose_spec x.property⟩⟩

/-- The integral value maps to the rational product by θ. -/
theorem integralStickelbergerMap_cast (m : ℕ) [NeZero m] (x : denominatorIdeal m) :
    integralGroupRingCast m (integralStickelbergerMap m x).val =
      integralGroupRingCast m x.val * stickelberger m := by
  exact Classical.choose_spec x.property

/-- Every integral Stickelberger element is a product by θ from the denominator ideal. -/
theorem integralStickelbergerMap_surjective (m : ℕ) [NeZero m] :
    Function.Surjective (integralStickelbergerMap m) := by
  rintro ⟨y, x, hx⟩
  refine ⟨⟨x, ⟨y, hx⟩⟩, ?_⟩
  apply Subtype.ext
  apply integralGroupRingCast_injective m
  exact (integralStickelbergerMap_cast m ⟨x, ⟨y, hx⟩⟩).trans hx.symm

/-- The weighted augmentation modulo the conductor detects integral multiplication by θ. -/
theorem denominatorIdeal_mem_iff (m : ℕ) [NeZero m] (hm : 2 ≤ m)
    (x : MonoidAlgebra ℤ (ZMod m)ˣ) :
    x ∈ denominatorIdeal m ↔
      (∑ a : (ZMod m)ˣ, x.coeff a * (a.val.val : ℤ)) % (m : ℤ) = 0 := by
  sorry

/-- At conductor two the denominator ideal is proper and the image ideal is the unit ideal. -/
theorem stickelbergerIdeals_two :
    denominatorIdeal 2 = Ideal.span {(2 : MonoidAlgebra ℤ (ZMod 2)ˣ)} ∧
      stickelbergerIdeal 2 = ⊤ := by
  sorry

/-- At conductor three the displayed multiplier gives an integral inverse to θ. -/
theorem stickelbergerIdeals_three :
    (1 : MonoidAlgebra ℤ (ZMod 3)ˣ) ∉ denominatorIdeal 3 ∧
      integralGroupRingCast 3
        (2 * MonoidAlgebra.single (-1 : (ZMod 3)ˣ) 1 - 1) * stickelberger 3 = 1 ∧
      stickelbergerIdeal 3 = ⊤ := by
  sorry

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

example : IsRegularPrime 2 := by
  have hpid : IsPrincipalIdealRing (𝓞 (CyclotomicField 2 ℚ)) := by
    apply RingOfIntegers.isPrincipalIdealRing_of_abs_discr_lt
    rw [IsCyclotomicExtension.Rat.discr_prime 2 (CyclotomicField 2 ℚ),
      IsCyclotomicExtension.finrank (n := 2) (CyclotomicField 2 ℚ)
        (Polynomial.cyclotomic.irreducible_rat (by decide)),
      IsCyclotomicExtension.Rat.nrComplexPlaces_eq_totient_div_two 2]
    norm_num
  have h := (NumberField.classNumber_eq_one_iff
    (K := CyclotomicField 2 ℚ)).mpr hpid
  simp [IsRegularPrime, h]

example : IsRegularPrime 3 := by
  have h : NumberField.classNumber (CyclotomicField 3 ℚ) = 1 :=
    (NumberField.classNumber_eq_one_iff (K := CyclotomicField 3 ℚ)).mpr
      (IsCyclotomicExtension.Rat.three_pid (CyclotomicField 3 ℚ))
  simp [IsRegularPrime, h]

/-- The statement at one prime, with the native maximal real subfield. -/
def VandiverAt (p : ℕ) [NeZero p] : Prop :=
  ¬ p ∣ NumberField.classNumber
    (NumberField.maximalRealSubfield (CyclotomicField p ℚ))

/-- The native rational real field at conductor two satisfies Vandiver's statement. -/
theorem vandiver_two : VandiverAt 2 := by
  sorry

/-- The native maximal real subfield at conductor three satisfies Vandiver's statement. -/
theorem vandiver_three : VandiverAt 3 := by
  sorry

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

/-! ## Layer 6: integral cyclotomic ratios and their real phases -/

/-- The geometric-sum unit representing (1 − ζᵃ)/(1 − ζ) in an integral domain. -/
noncomputable def cyclotomicUnit {A : Type*} [CommRing A] [IsDomain A]
    {m : ℕ} [NeZero m] (ζ : A) (hζ : IsPrimitiveRoot ζ m) (hm : 2 ≤ m)
    (a : (ZMod m)ˣ) : Aˣ :=
  (hζ.geom_sum_isUnit hm (ZMod.val_coe_unit_coprime a)).unit

example {A : Type*} [CommRing A] [IsDomain A] {m : ℕ} [NeZero m]
    (ζ : A) (hζ : IsPrimitiveRoot ζ m) (hm : 2 ≤ m) :
    cyclotomicUnit ζ hζ hm 1 = 1 := by
  apply Units.ext
  simp [cyclotomicUnit, ZMod.val_one_eq_one_mod,
    Nat.mod_eq_of_lt (by omega : 1 < m)]

example {A : Type*} [CommRing A] [IsDomain A]
    (ζ : A) (hζ : IsPrimitiveRoot ζ 3) :
    (cyclotomicUnit ζ hζ (by decide) (-1) : A) = 1 + ζ := by
  simp [cyclotomicUnit, Finset.sum_range_succ]

/-- The ratio at minus one retains the inverse root and its minus sign. -/
theorem cyclotomicUnit_neg_one {A : Type*} [CommRing A] [IsDomain A]
    {m : ℕ} [NeZero m] (ζ : A) (hζ : IsPrimitiveRoot ζ m) (hm : 2 ≤ m) :
    cyclotomicUnit ζ hζ hm (-1) = -(hζ.isUnit (by omega)).unit⁻¹ := by
  sorry

/-- The phase t is explicit; the condition 2t = 1 − a makes this ambient unit real. -/
noncomputable def realCyclotomicUnit {A : Type*} [CommRing A] [IsDomain A]
    {m : ℕ} [NeZero m] (ζ : A) (hζ : IsPrimitiveRoot ζ m) (hm : 2 ≤ m)
    (a : (ZMod m)ˣ) (t : ℤ) : Aˣ :=
  (hζ.isUnit (by omega)).unit ^ t * cyclotomicUnit ζ hζ hm a

/-- Complex conjugation fixes the phased unit under the half-exponent congruence. -/
theorem realCyclotomicUnit_fixed {A : Type*} [CommRing A] [IsDomain A]
    {m : ℕ} [NeZero m] (ζ : A) (hζ : IsPrimitiveRoot ζ m) (hm : 2 ≤ m)
    (a : (ZMod m)ˣ) (t : ℤ) (ht : (2 * t : ZMod m) = 1 - a.val)
    (c : A ≃+* A) (hc : c ζ = ↑(hζ.isUnit (by omega)).unit⁻¹) :
    Units.map c.toMonoidHom (realCyclotomicUnit ζ hζ hm a t) =
      realCyclotomicUnit ζ hζ hm a t := by
  sorry

/-- At conductor eight shifting the odd representative by eight reverses the real ratio's sign. -/
theorem realCyclotomicUnit_eight_sign {A : Type*} [CommRing A] [IsDomain A]
    (ζ : A) (hζ : IsPrimitiveRoot ζ 8) :
    realCyclotomicUnit ζ hζ (by decide) (⟨3, 3, by decide, by decide⟩ : (ZMod 8)ˣ) (-5) =
      -realCyclotomicUnit ζ hζ (by decide) (⟨3, 3, by decide, by decide⟩ : (ZMod 8)ˣ) (-1) := by
  sorry

/-- In the standard complex embedding the conductor-five real ratio for a = 2 is negative. -/
theorem realCyclotomicUnit_five_negative
    (ζ : 𝓞 (CyclotomicField 5 ℚ)) (hζ : IsPrimitiveRoot ζ 5)
    (ι : CyclotomicField 5 ℚ →+* ℂ)
    (hι : ι (ζ : CyclotomicField 5 ℚ) = Complex.exp (2 * Real.pi * Complex.I / 5)) :
    (ι ((realCyclotomicUnit ζ hζ (by decide)
      (⟨2, 3, by decide, by decide⟩ : (ZMod 5)ˣ) 2 : 𝓞 (CyclotomicField 5 ℚ)) :
        CyclotomicField 5 ℚ)).re < 0 := by
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
capitulationKernel, capitulationCocycle, genusClassQuotient; compatibleGaussData;
unramifiedKummerRadical, relativeClassNumber; modularAbelianQuotient,
numericalIntersection, abelianEndomorphismPolynomial, modularTate_trace_bound, the Rosati involution,
finite-flat closures and quotients, BarsottiTate and its height, dual, Tate
module, formal tangent space and dimension, LocallyAlgebraicCharacter,
HodgeTate; cyclotomicSUnitSubgroup, circularUnits, realCircularUnits,
circularRegulator; cyclotomicClassInverseLimit,
classLimitProjection and inverseCharacterUnramifiedQuotient. Their arithmetic
comparison theorems, constructions and full APIs belong to the README layers.

README-only API targets include denominatorIdeal_generators,
stickelbergerIdeal_eq_intersection, stickelbergerIdeal_annihilates,
cyclotomicUnit_inverse, cyclotomicUnit_galois; stickelberger_coeff, stickelberger_conjugation,
stickelberger_augmentation, smoothedStickelberger_cast, smoothedStickelberger_mem,
stickelberger_annihilation_equivariant (§2); cyclotomicClassEigenspace_one_eq_zero
(§3.2); oddResidueMatrix_entry, oddResidueMatrix_change_representatives,
oddResidueMatrix_row_norm, oddResidueMatrix_character_eigenvalues (§4.1);
inverseCharacterClassGroup_all_levels (§8.1); homCharacter_apply,
homCharacter_constant_target, homCharacter_self, homCharacter_mul_target (§8.3).
-/

end TauCetiRoadmap.CyclotomicClassGroupsAndStickelberger
