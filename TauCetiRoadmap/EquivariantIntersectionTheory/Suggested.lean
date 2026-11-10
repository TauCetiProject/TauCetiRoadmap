module

public import Mathlib

/-!
# Equivariant intersection theory and Picard groups of quotient stacks: target signatures

The roadmap is `README.md`. This file states the roadmap's headline theorems against the pinned
Mathlib, each with `sorry`, together with the definitions their statements need, all with real
bodies on native carriers. The API around each target, the special cases and the Checks stay in
the README.

Headline theorems stated here (README target, Lean name):

* 0.1, `mem_homogeneousUnitDegrees_iff` and `eq_map_mulLeft_of_isUnit_mem` (shift
  classification), on `homogeneousUnitDegrees` and `ShiftClassGroup`.
* 0.2, `isUnit_laurentPolynomial_iff` (the units of a Laurent ring over a domain) and
  `exists_isUnit_mem_of_connected` (a homogeneous generator on a connected spectrum).
* 0.3, `awayGrading_isInternal`, on `awayGrading`.
* 0.4, `homogeneousUnitDegrees_weighted` and `homogeneousUnitDegrees_away_prime`.
* 0.5, `depressedDiscr_mem` and `depressedDiscr_prime`, on `genericDepressed`,
  `depressedWeight` and `depressedDiscr`.

Not statable at the pins, with the carrier each lacks:

* 1.1–1.3 (the groupoid of `G`-linearised invertible sheaves, `Pic^G(X)`, the graded description
  over `Spec A`, the exact sequences) and 1.4 (`Pic [X/G] ≅ Pic^G(X)`, change of group, slices):
  they lack linearised invertible sheaves, which rest on the actions of group spaces
  (SchemeAndStackFoundations §1.13), and the quotient stacks `actionQuotient G X` (§1.21) with
  `Stacks.QCoh` (§1.22).
* 2.1–2.3 (equivariant Chow groups, their operations, classifying spaces) and 2.4
  (`Pic^G(X) ≅ A¹_G(X)`): they lack, in addition, the Chow groups `ChowGroup κ X k` of
  SchemeAndStackFoundations §5.1 with the operations of §§5.2–5.6, and so equivariant Chow groups.
* 3.1 (weighted affine space minus a divisor), 3.2 (`Pic M_{1,1} ≅ ℤ/12`), 3.3 (the orders of
  Arsie–Vistoli and the Picard group of `[M_{0,2g+2}/𝔖_{2g+1}]`) and 3.4
  (`Pic [M_{0,n}/𝔖ₙ₋₁] ≅ ℤ/(n − 1)(n − 2)`): they lack all of the above, and the moduli stacks
  `M_{1,1}` and `M_{0,n}` (SchemeAndStackFoundations §4.15). Their graded input is stated here:
  `homogeneousUnitDegrees_away_prime` with `depressedDiscr_mem` and `depressedDiscr_prime`.
-/

@[expose] public section

namespace TauCetiRoadmap.EquivariantIntersectionTheory

open MvPolynomial

/-! ## Layer 0: graded rings and homogeneous units -/

section Graded

variable {R A : Type*} [CommRing R] [CommRing A] [Algebra R A]

/-- **Layer 0.1.** The degrees of the homogeneous units of a `ℤ`-graded algebra. -/
def homogeneousUnitDegrees (𝒜 : ℤ → Submodule R A) : AddSubgroup ℤ :=
  AddSubgroup.closure {d | ∃ u : Aˣ, (u : A) ∈ 𝒜 d}

/-- **Layer 0.1.** The shifts `A(d)` up to graded isomorphism. It is the kernel of
`Pic^{𝔾_m}(Spec A) → Pic A` when `Spec A` is connected (README, 0.2 and 1.2), not in general. -/
abbrev ShiftClassGroup (𝒜 : ℤ → Submodule R A) : Type _ :=
  ℤ ⧸ homogeneousUnitDegrees 𝒜

/-- **Layer 0.1.** In a graded algebra, the inverse of a homogeneous unit is homogeneous, so the
closure adds nothing. -/
theorem mem_homogeneousUnitDegrees_iff (𝒜 : ℤ → Submodule R A) [GradedAlgebra 𝒜] (d : ℤ) :
    d ∈ homogeneousUnitDegrees 𝒜 ↔ ∃ u : Aˣ, (u : A) ∈ 𝒜 d := by
  sorry

/-- **Layer 0.1.** Shift classification for a grading with a homogeneous generator: if `ℳ` is a
grading of the `A`-module `A` compatible with `𝒜` and the unit `u` lies in `ℳ c`, then
`ℳ n = u · 𝒜 (n − c)`, so `ℳ` is the shift `A(−c)`. -/
theorem eq_map_mulLeft_of_isUnit_mem (𝒜 ℳ : ℤ → Submodule R A) [GradedAlgebra 𝒜]
    [DirectSum.Decomposition ℳ] [SetLike.GradedSMul 𝒜 ℳ] {c : ℤ} (u : Aˣ) (hu : (u : A) ∈ ℳ c)
    (n : ℤ) : ℳ n = (𝒜 (n - c)).map (LinearMap.mulLeft R (u : A)) := by
  sorry

/-- **Layer 0.2.** Over a domain, the units of the Laurent ring `R[t, t⁻¹]` are the monomials
`c tⁿ` with `c` a unit of `R`. -/
theorem isUnit_laurentPolynomial_iff {S : Type*} [CommRing S] [IsDomain S]
    (u : LaurentPolynomial S) :
    IsUnit u ↔
      ∃ (c : S) (n : ℤ), IsUnit c ∧ u = LaurentPolynomial.C c * LaurentPolynomial.T n := by
  sorry

/-- **Layer 0.2.** On a connected spectrum every grading of the `A`-module `A` compatible with `𝒜`
has a homogeneous generator. -/
theorem exists_isUnit_mem_of_connected (𝒜 ℳ : ℤ → Submodule R A) [GradedAlgebra 𝒜]
    [DirectSum.Decomposition ℳ] [SetLike.GradedSMul 𝒜 ℳ]
    (hconn : ∀ e : A, IsIdempotentElem e → e = 0 ∨ e = 1) :
    ∃ (c : ℤ) (u : Aˣ), (u : A) ∈ ℳ c := by
  sorry

/-- **Layer 0.3.** The grading of the localization `A_f` at a homogeneous element `f` of degree
`e`: `a / fⁿ` has degree `deg a − n e`. -/
noncomputable def awayGrading (𝒜 : ℤ → Submodule R A) {f : A} {e : ℤ} (_hf : f ∈ 𝒜 e) (d : ℤ) :
    Submodule R (Localization.Away f) :=
  Submodule.span R
    {x | ∃ (n : ℕ) (a : A), a ∈ 𝒜 (d + n * e) ∧
      x = IsLocalization.mk' _ a (⟨f ^ n, n, rfl⟩ : Submonoid.powers f)}

/-- **Layer 0.3.** The localization grading is a grading. -/
theorem awayGrading_isInternal (𝒜 : ℤ → Submodule R A) [GradedAlgebra 𝒜] {f : A} {e : ℤ}
    (hf : f ∈ 𝒜 e) : DirectSum.IsInternal (awayGrading 𝒜 hf) := by
  sorry

end Graded

section Weighted

variable {σ K : Type*} [Field K]

/-- **Layer 0.4.** For any weights, the units of `K[σ]` are the nonzero constants, homogeneous of
degree `0` only. -/
theorem homogeneousUnitDegrees_weighted (w : σ → ℤ) :
    homogeneousUnitDegrees (weightedHomogeneousSubmodule K w) = ⊥ := by
  sorry

/-- **Layer 0.4.** Inverting a prime weighted-homogeneous polynomial `f` of weight `e`: the units of
`K[σ]_f` are the `c fᵏ`, `c ∈ Kˣ`, `k ∈ ℤ`, so their degrees are the multiples of `e`. With
positive weights on a finite `σ`, `ShiftClassGroup ≅ ℤ/e` is the Picard group of
`[(𝔸^σ ∖ {f = 0}) / 𝔾_m]` (README, 3.1). -/
theorem homogeneousUnitDegrees_away_prime (w : σ → ℤ)
    {f : MvPolynomial σ K} {e : ℤ} (hf : f ∈ weightedHomogeneousSubmodule K w e)
    (hprime : Prime f) :
    homogeneousUnitDegrees (awayGrading (weightedHomogeneousSubmodule K w) hf) =
      AddSubgroup.zmultiples e := by
  sorry

end Weighted

section Discriminant

variable (K : Type*) [Field K]

/-- **Layer 0.5.** The generic depressed monic polynomial of degree `m`,
`Xᵐ + a₂ Xᵐ⁻² + ⋯ + aₘ`, with `aₖ` the variable `k − 2` of `K[a₂, …, aₘ]`. -/
noncomputable def genericDepressed (m : ℕ) : Polynomial (MvPolynomial (Fin (m - 1)) K) :=
  Polynomial.X ^ m +
    ∑ i : Fin (m - 1), Polynomial.C (MvPolynomial.X i) * Polynomial.X ^ (m - (i.val + 2))

/-- **Layer 0.5.** The weight of `aₖ` is `k`. -/
def depressedWeight (m : ℕ) : Fin (m - 1) → ℤ := fun i => (i.val : ℤ) + 2

/-- **Layer 0.5.** The discriminant of the generic depressed polynomial, an element of
`K[a₂, …, aₘ]`, with Mathlib's `Polynomial.discr`. -/
noncomputable def depressedDiscr (m : ℕ) : MvPolynomial (Fin (m - 1)) K :=
  Polynomial.discr (genericDepressed K m)

/-- **Layer 0.5.** The discriminant has weight `m (m − 1)`. -/
theorem depressedDiscr_mem (m : ℕ) (hm : 2 ≤ m) :
    depressedDiscr K m ∈
      weightedHomogeneousSubmodule K (depressedWeight m) ((m : ℤ) * (m - 1)) := by
  sorry

/-- **Layer 0.5.** In characteristic zero the discriminant is prime in `K[a₂, …, aₘ]`. -/
theorem depressedDiscr_prime [CharZero K] (m : ℕ) (hm : 2 ≤ m) : Prime (depressedDiscr K m) := by
  sorry

end Discriminant

end TauCetiRoadmap.EquivariantIntersectionTheory
