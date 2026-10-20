import Mathlib
import TauCeti.NumberTheory.ClassGroup.Equiv

/-!
# EulerSystemsCyclotomicMainConjecture: representative target signatures

The roadmap is README.md. This file records light definitions and theorem
signatures statable against the pinned APIs; it is not exhaustive. Distribution
uses compatible primitive roots, arithmetic Frobenius and the `1 - ζ` convention.
The character component is an eigensubmodule and its finite sum is unnormalised.
The ring and module hypotheses are explicit, including scalar injectivity for
a trivial representation. Cyclotomic towers, completed arithmetic modules,
Euler systems and characteristic ideals remain in the README.
-/

noncomputable section

open Polynomial
open scoped NumberField

namespace TauCetiRoadmap.EulerSystemsCyclotomicMainConjecture

/-! ## Foundation F: finite Stickelberger annihilation -/

/-- Every positive integral Stickelberger smoothing annihilates the full class group
of a cyclotomic field (§F.9). The inverse automorphism matches the basis of the
rational Stickelberger element. -/
theorem stickelberger_smoothing_annihilates (m b : ℕ) [NeZero m]
    (K : Type*) [Field K] [NumberField K] [IsCyclotomicExtension {m} ℚ K]
    (hm : 2 ≤ m) (hb : b.Coprime m) (x : ClassGroup (𝓞 K)) :
    (∏ a : (ZMod m)ˣ,
      (ClassGroup.mulEquivHom
        (NumberField.RingOfIntegers.mapRingEquiv
          (((IsCyclotomicExtension.Rat.galEquivZMod m K).symm a⁻¹).toRingEquiv)) x) ^
        (b * a.val.val / m)) = 1 := sorry

/-! ## Layer 0: Euler systems and their normalization -/

section Distribution

variable {K L : Type*} [Field K] [Field L] [CharZero K] [CharZero L] [Algebra K L]
  {m ℓ : ℕ} [NeZero m] [Fact ℓ.Prime]
  [IsCyclotomicExtension {m} ℚ K] [IsCyclotomicExtension {m * ℓ} ℚ L]
  {ζ : L} {η : K}

/-- In the ramified cyclotomic step, the relative minimal polynomial is `X^ℓ - η`
(§0.1; Rubin III.2.1, p. 34). -/
theorem minpoly_step_of_dvd (hζ : IsPrimitiveRoot ζ (m * ℓ))
    (hη : algebraMap K L η = ζ ^ ℓ) (hdvd : ℓ ∣ m) :
    minpoly K ζ = X ^ ℓ - C η := sorry

/-- In the unramified step, remove the root already in the lower field (§0.2).
This polynomial identity also holds at conductor one. -/
theorem minpoly_step_of_not_dvd (hζ : IsPrimitiveRoot ζ (m * ℓ))
    (hη : algebraMap K L η = ζ ^ ℓ) (hndvd : ¬ ℓ ∣ m)
    {ℓ' : ℕ} (hℓ' : ℓ * ℓ' ≡ 1 [MOD m]) :
    minpoly K ζ * (X - C (η ^ ℓ')) = X ^ ℓ - C η := sorry

/-- `N_{ℚ(μ_{mℓ})/ℚ(μ_m)}(1 - ζ_{mℓ}) = 1 - ζ_m` when
`ℓ ∣ m`. -/
theorem norm_one_sub_of_dvd (hζ : IsPrimitiveRoot ζ (m * ℓ))
    (hη : algebraMap K L η = ζ ^ ℓ) (hdvd : ℓ ∣ m) :
    Algebra.norm K (1 - ζ) = 1 - η := sorry

/-- `N(1 - ζ_{mℓ}) · (1 - ζ_m^{ℓ'}) = 1 - ζ_m` when
`ℓ ∤ m`, that is `N(1 - ζ_{mℓ}) = (1 - ζ_m)^{1 - Fr_ℓ⁻¹}` for `m > 1`. -/
theorem norm_one_sub_mul_of_not_dvd (hζ : IsPrimitiveRoot ζ (m * ℓ))
    (hη : algebraMap K L η = ζ ^ ℓ) (hndvd : ¬ ℓ ∣ m) {ℓ' : ℕ} (hℓ' : ℓ * ℓ' ≡ 1 [MOD m]) :
    Algebra.norm K (1 - ζ) * (1 - η ^ ℓ') = 1 - η := sorry

/-- The same relation with the arithmetic Frobenius
`Fr_ℓ ∈ Gal(ℚ(μ_m)/ℚ)`, `Fr_ℓ(ζ_m) = ζ_m^ℓ`, read through Mathlib's `autEquivPow`. -/
theorem norm_one_sub_mul_frobenius (hζ : IsPrimitiveRoot ζ (m * ℓ))
    (hη : algebraMap K L η = ζ ^ ℓ) (hcop : ℓ.Coprime m) :
    Algebra.norm K (1 - ζ) *
        ((IsCyclotomicExtension.autEquivPow K
            (cyclotomic.irreducible_rat (NeZero.pos m))).symm (ZMod.unitOfCoprime ℓ hcop)⁻¹
          (1 - η)) = 1 - η := sorry

end Distribution

/-- The degree sign for `ζ - 1` in any finite field extension (§0.6).
At `ℓ = 2` it cannot be suppressed in the cyclotomic distribution formulas. -/
theorem norm_sub_one_eq_neg_one_pow_mul {K L : Type*} [Field K] [Field L]
    [Algebra K L] [FiniteDimensional K L] (ζ : L) :
    Algebra.norm K (ζ - 1) =
      (-1) ^ Module.finrank K L * Algebra.norm K (1 - ζ) := sorry

/-- `N_{ℚ(μ_ℓ)/ℚ}(1 - ζ_ℓ) = ℓ` for every prime
`ℓ`, including `ℓ = 2`. -/
theorem norm_one_sub_of_prime {L : Type*} [Field L] [CharZero L] {ℓ : ℕ} [Fact ℓ.Prime]
    [IsCyclotomicExtension {ℓ} ℚ L] {ζ : L} (hζ : IsPrimitiveRoot ζ ℓ) :
    Algebra.norm ℚ (1 - ζ) = ℓ := sorry

/- Character eigensubmodules and finite sums (§§0.18–0.20). -/

section Chi

variable {O M Δ : Type*} [CommRing O] [AddCommGroup M] [Module O M] [Group Δ]

/-- The `χ`-component `M^χ = {x | δ x = χ(δ) x}` of an `O[Δ]`-module
(Rubin, Definition I.6.2, applied to `B^ ⊗ O`). -/
def chiComponent (ρ : Representation O Δ M) (χ : Δ →* Oˣ) : Submodule O M where
  carrier := {x | ∀ δ, ρ δ x = (χ δ : O) • x}
  zero_mem' := fun δ => by simp
  add_mem' := fun {x y} hx hy δ => by simp [hx δ, hy δ, smul_add]
  smul_mem' := fun c x hx δ => by
    simp only [map_smul, hx δ]
    exact smul_comm c _ x

variable (ρ : Representation O Δ M) (χ : Δ →* Oˣ)

/-- Membership in the character eigensubmodule. -/
theorem mem_chiComponent (x : M) : x ∈ chiComponent ρ χ ↔ ∀ δ, ρ δ x = (χ δ : O) • x :=
  Iff.rfl

/-- Scalar injectivity is needed on the module itself, not merely on the coefficient ring. -/
theorem chiComponent_trivial_eq_bot (δ : Δ)
    (hδ : Function.Injective (fun x : M => ((χ δ : O) - 1) • x)) :
    chiComponent (Representation.trivial O Δ M) χ = ⊥ := sorry

variable [Fintype Δ]

/-- Every vector in the regular character component has a unique scalar coordinate
on the character sum of `[1]` (§0.18). -/
theorem chiComponent_regular (χ : Δ →* Oˣ) (hΔ : IsUnit (Fintype.card Δ : O))
    (x : MonoidAlgebra O Δ) :
    x ∈ chiComponent (Representation.leftRegular O Δ) χ ↔
      ∃! a : O, x = a • ∑ δ : Δ, MonoidAlgebra.single δ (((χ δ)⁻¹ : Oˣ) : O) := sorry

/-- At group order `p`, augmentation is onto over `𝔽_p` but its restriction to
the norm line of invariants is zero and fails to be onto (§0.18). -/
theorem chiComponent_not_split (p : ℕ) [Fact p.Prime] (hΔ : Fintype.card Δ = p) :
    let ε : MonoidAlgebra (ZMod p) Δ → ZMod p := fun x => ∑ δ : Δ, x.coeff δ
    chiComponent (Representation.leftRegular (ZMod p) Δ) 1 =
        Submodule.span (ZMod p) {∑ δ : Δ, MonoidAlgebra.single δ (1 : ZMod p)} ∧
      Function.Surjective ε ∧
      (∀ x : chiComponent (Representation.leftRegular (ZMod p) Δ) 1, ε x.val = 0) ∧
      ¬Function.Surjective
        (fun x : chiComponent (Representation.leftRegular (ZMod p) Δ) 1 => ε x.val) := sorry

/-- The twisted sum `∑_δ χ(δ)⁻¹ δ x`; for `M = Lˣ ⊗ O` written additively this
is `∏_δ (δ x)^{χ⁻¹(δ)}`. -/
def chiSum (x : M) : M := ∑ δ : Δ, ((χ δ)⁻¹ : Oˣ) • ρ δ x

/-- For a trivial group the unnormalised character sum is the identity (§0.19). -/
theorem chiSum_trivial_group [Subsingleton Δ] (x : M) : chiSum ρ χ x = x := sorry

/-- Twisted sums lie in the `χ`-component. -/
theorem chiSum_mem (x : M) : chiSum ρ χ x ∈ chiComponent ρ χ := sorry

/-- The finite character sum is additive (§0.19). -/
theorem chiSum_add (x y : M) :
    chiSum ρ χ (x + y) = chiSum ρ χ x + chiSum ρ χ y := sorry

/-- On the `χ`-component, `chiSum` is multiplication by `|Δ|`. -/
theorem chiSum_of_mem {x : M} (hx : x ∈ chiComponent ρ χ) :
    chiSum ρ χ x = (Fintype.card Δ : O) • x := sorry

/-- The square of the unnormalised character sum is its multiple by `|Δ|` (§0.19). -/
theorem chiSum_chiSum (x : M) :
    chiSum ρ χ (chiSum ρ χ x) = (Fintype.card Δ : O) • chiSum ρ χ x := sorry

/-- Equivariant linear maps commute with the finite character sum. -/
theorem chiSum_map {N : Type*} [AddCommGroup N] [Module O N]
    (ρ' : Representation O Δ N) (f : M →ₗ[O] N)
    (hf : ∀ δ x, f (ρ δ x) = ρ' δ (f x)) (x : M) :
    f (chiSum ρ χ x) = chiSum ρ' χ (f x) := sorry

/-- If `v = u - ρ(φ⁻¹) u` then `chiSum v = (1 - χ(φ)⁻¹) chiSum u`.
This is the algebra behind Rubin's `c_ℚ = ξ_{L,χ}^{1 - χ⁻¹(p)}`. -/
theorem chiSum_sub_frobenius (φ : Δ) (u : M) :
    chiSum ρ χ (u - ρ φ⁻¹ u) = (1 - (((χ φ)⁻¹ : Oˣ) : O)) • chiSum ρ χ u := sorry

end Chi

/-- For a root of unity `ω ≠ 1` with `ω^n = 1` and `n`
invertible, `1 - ω` is a unit. Applied to `ω = χ⁻¹(p)` of order prime to `p` when `χ(p) ≠ 1`. -/
theorem isUnit_one_sub_of_pow_eq_one {O : Type*} [CommRing O] [IsDomain O] {ω : O} {n : ℕ}
    (hω : ω ^ n = 1) (hω1 : ω ≠ 1) (hn : IsUnit (n : O)) : IsUnit (1 - ω) := sorry

/- Examples for the definitions and normalization choices in Layer 0. -/

/-- The norm of `1-i` and of `i-1` is 2, although `ζ₂-1=-2` (§0.6). -/
theorem quartic_norm_sign_test {L : Type*} [Field L] [CharZero L] [IsCyclotomicExtension {4} ℚ L]
    {ι : L} (hι : IsPrimitiveRoot ι 4) :
    Algebra.norm ℚ (1 - ι) = 2 ∧ Algebra.norm ℚ (ι - 1) = 2 := by
  have h2 : Algebra.norm ℚ (ι - 1) = 2 := by
    rw [hι.sub_one_norm_eq_eval_cyclotomic (by norm_num)
      (cyclotomic.irreducible_rat (by norm_num))]
    rw [show (4 : ℕ) = 2 ^ (1 + 1) by norm_num, eval_one_cyclotomic_prime_pow]
    norm_num
  refine ⟨?_, h2⟩
  have hfin : Module.finrank ℚ L = 2 := by
    rw [IsCyclotomicExtension.finrank L (cyclotomic.irreducible_rat (by norm_num : 0 < 4))]
    decide
  rw [show (1 : L) - ι = algebraMap ℚ L (-1) * (ι - 1) by simp, map_mul, h2,
    Algebra.norm_algebraMap, hfin]
  norm_num

/-- A primitive sixth root satisfies `ζ₆-1=ζ₃`; the step of degree one retains its sign. -/
theorem sixthRoot_sub_one_test {L : Type*} [Field L] [CharZero L] {ζ : L} (hζ : IsPrimitiveRoot ζ 6) :
    ζ - 1 = ζ ^ 2 := by
  have h6 : ζ ^ 6 = 1 := hζ.pow_eq_one
  have h3 : ζ ^ 3 ≠ 1 := hζ.pow_ne_one_of_pos_of_lt (by norm_num) (by norm_num)
  have h2 : ζ ^ 2 ≠ 1 := hζ.pow_ne_one_of_pos_of_lt (by norm_num) (by norm_num)
  have h3' : ζ ^ 3 + 1 = 0 := by
    have : (ζ ^ 3 - 1) * (ζ ^ 3 + 1) = 0 := by linear_combination h6
    rcases mul_eq_zero.mp this with h | h
    · exact absurd (sub_eq_zero.mp h) h3
    · exact h
  have hne : ζ + 1 ≠ 0 := by
    intro h
    apply h2
    have : ζ = -1 := by linear_combination h
    rw [this]; norm_num
  have : (ζ + 1) * (ζ ^ 2 - ζ + 1) = 0 := by linear_combination h3'
  rcases mul_eq_zero.mp this with h | h
  · exact absurd h hne
  · linear_combination -h

/-- In the regular representation of a two-element group, the sign sum is a difference. -/
theorem chiSum_regular_sign_test {Δ : Type*} [Group Δ] [Fintype Δ] (s : Δ) (hs : s ≠ 1)
    (hcard : Fintype.card Δ = 2) (χ : Δ →* ℤˣ) (hχ : χ s = -1) :
    chiSum (Representation.leftRegular ℤ Δ) χ (MonoidAlgebra.single 1 1) =
      MonoidAlgebra.single 1 1 - MonoidAlgebra.single s 1 := by
  classical
  have huniv : (Finset.univ : Finset Δ) = {1, s} := by
    symm
    apply Finset.eq_of_subset_of_card_le (Finset.subset_univ _)
    rw [Finset.card_univ, hcard, Finset.card_pair (Ne.symm hs)]
  simp only [chiSum, huniv]
  rw [Finset.sum_pair (Ne.symm hs)]
  simp [hχ, Representation.ofMulAction_single, sub_eq_add_neg]

/-- An order-four character detects the inverse in the Frobenius factor (§0.20). -/
theorem chiSum_orderFour_frobenius_test {Δ : Type*} [Group Δ] [Fintype Δ] (s : Δ) (χ : Δ →* ℂˣ)
    (hχ : (χ s : ℂ) = Complex.I) :
    chiSum (Representation.leftRegular ℂ Δ) χ
        (MonoidAlgebra.single 1 1 - MonoidAlgebra.single s⁻¹ 1) =
      (1 + Complex.I) •
        chiSum (Representation.leftRegular ℂ Δ) χ (MonoidAlgebra.single 1 1) := by
  have key : chiSum (Representation.leftRegular ℂ Δ) χ (MonoidAlgebra.single s⁻¹ 1) =
      ((χ s : ℂ)⁻¹) • chiSum (Representation.leftRegular ℂ Δ) χ (MonoidAlgebra.single 1 1) := by
    simp only [chiSum, Finset.smul_sum]
    refine Fintype.sum_equiv (Equiv.mulRight s⁻¹) _ _ (fun δ => ?_)
    simp only [Equiv.coe_mulRight, Representation.ofMulAction_single, smul_eq_mul,
      Units.smul_def, smul_smul, map_mul, map_inv, mul_inv_rev, inv_inv, Units.val_mul,
      Units.val_inv_eq_inv_val]
    congr 1
    · have : (χ s : ℂ) ≠ 0 := Units.ne_zero _
      field_simp
    · simp [Representation.ofMulAction_single]
  have hsub : chiSum (Representation.leftRegular ℂ Δ) χ
      (MonoidAlgebra.single 1 1 - MonoidAlgebra.single s⁻¹ 1) =
      chiSum (Representation.leftRegular ℂ Δ) χ (MonoidAlgebra.single 1 1) -
      chiSum (Representation.leftRegular ℂ Δ) χ (MonoidAlgebra.single s⁻¹ 1) := by
    simp only [chiSum, map_sub, smul_sub, Finset.sum_sub_distrib]
  rw [hsub, key, hχ, Complex.inv_I, add_smul, one_smul, neg_smul, sub_neg_eq_add]

/-- Inverse arithmetic Frobenius at conductor seven uses exponent four, not two (§0.5). -/
theorem seventhRoot_inverse_frobenius_test {L : Type*} [Field L] [CharZero L] {η : L} (hη : IsPrimitiveRoot η 7) :
    (1 + η ^ 4) * (1 - η ^ 4) = 1 - η ∧
      (1 + η ^ 4) * (1 - η ^ 2) ≠ 1 - η := by
  refine ⟨by linear_combination (-η) * hη.pow_eq_one, fun h => ?_⟩
  have hpoly : aeval η (1 - X + X ^ 3 - X ^ 5 : ℚ[X]) = 0 := by
    have hne : η ≠ 0 := hη.ne_zero (by norm_num)
    have : η * (1 - η + η ^ 3 - η ^ 5) = 0 := by linear_combination h
    simpa [hne] using this
  have hdvd := minpoly.dvd ℚ η hpoly
  rw [← hη.minpoly_eq_cyclotomic_of_irreducible (cyclotomic.irreducible_rat (by norm_num))] at hdvd
  have hp0 : (1 - X + X ^ 3 - X ^ 5 : ℚ[X]) ≠ 0 := by
    intro h0
    have := congrArg (fun q : ℚ[X] => q.coeff 0) h0
    simp at this
  have hle := natDegree_le_of_dvd hdvd hp0
  rw [natDegree_cyclotomic] at hle
  have hdeg : (1 - X + X ^ 3 - X ^ 5 : ℚ[X]).natDegree = 5 := by compute_degree!
  rw [hdeg] at hle
  have : Nat.totient 7 = 6 := by decide
  omega

/-- The trivial character gives the existing invariants. -/
example {O M Δ : Type*} [CommRing O] [AddCommGroup M] [Module O M]
    [Group Δ] (ρ : Representation O Δ M) (x : M) :
    x ∈ chiComponent ρ 1 ↔ x ∈ ρ.invariants := by
  simp [chiComponent, Representation.mem_invariants]

/-- For the coefficient ring as module, the domain hypothesis gives scalar injectivity. -/
theorem chiComponent_domain_test {O Δ : Type*} [CommRing O] [IsDomain O] [Group Δ]
    (χ : Δ →* Oˣ) (δ : Δ) (hδ : (χ δ : O) ≠ 1) :
    chiComponent (Representation.trivial O Δ O) χ = ⊥ := by
  ext x
  simp only [mem_chiComponent, Submodule.mem_bot, Representation.trivial_apply, smul_eq_mul]
  constructor
  · intro h
    have h2 : ((χ δ : O) - 1) * x = 0 := by
      have := h δ
      linear_combination -this
    rcases mul_eq_zero.mp h2 with h3 | h3
    · exact absurd (sub_eq_zero.mp h3) hδ
    · exact h3
  · rintro rfl δ'
    simp

/-- Torsion rejects the false extension of the preceding test to arbitrary modules:
every integral unit character reduces to the trivial character modulo 2. -/
example {Δ : Type*} [Group Δ] (χ : Δ →* ℤˣ) (x : ZMod 2) :
    (chiComponent (O := ℤ) (M := ZMod 2)
      (Representation.trivial ℤ Δ (ZMod 2)) χ).carrier x := by
  intro δ
  change x = (χ δ : ℤ) • x
  rcases Int.units_eq_one_or (χ δ) with h | h
  · simp [h]
  · simp [h]

/-- Twisted sums are not normalized projections. -/
example {Δ : Type*} [Group Δ] [Fintype Δ] (x : ℤ) :
    chiSum (Representation.trivial ℤ Δ ℤ) 1 x = (Fintype.card Δ : ℤ) • x := by
  simp [chiSum, Representation.trivial]

/- The arithmetic milestones of Layers 1–5 use the cohomological and completed
arithmetic carriers specified in the README. They include finite Kolyvagin descent,
Iwasawa divisibility, the main-conjecture equality, the all-prime abelian formulas,
and the Tate-twisted Selmer consequences.

The further API of §§0.18–0.19 is specified in the README:
chiComponent_map, chiComponent_map_eq, chiComponent_ext.
Its further checks are chiComponent_one, chiComponent_trivial_rep,
chiComponent_torsion_counterexample, chiSum_trivial and chiSum_sign_regular.
The regular character line, modular failure of exactness and trivial-group
sum are the named targets chiComponent_regular, chiComponent_not_split and
chiSum_trivial_group above. -/

/- Definitions specified in the README over the arithmetic supplier carriers:
p-extended cyclotomic numbers and their real norms; cyclotomic Kummer classes;
χ-cyclotomic generators and unit modules; the unsmoothed Euler system;
Stickelberger cohomology family and Euler-factor replacement; Rubin's local
functionals; cyclotomic derivative classes; integral character quotients;
2-unit quotient, minus prime divisor module, valuation and logarithm vectors,
and normed Gauss sums. Arithmetic inputs stated in the README on carriers that
are not at the pins: the restriction–Kummer dictionary, the idelic characters,
the Selmer group as a class-group dual, the local unit limits, Sinnott's
correction and stable index, Coleman's sequence over unramified coefficients,
Rubin's uniform unit bounds, the exceptional component, the split extension and
the 2-ramified correspondence, the p-adic class number formula, the integral
Coleman image and the characterwise Iwasawa ranks. -/

end TauCetiRoadmap.EulerSystemsCyclotomicMainConjecture
