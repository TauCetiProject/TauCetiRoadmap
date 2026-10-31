module

public import Mathlib

/-!
# Equivariant intersection theory: target signatures for Layer 0

**This file is not the roadmap and is not exhaustive.** The definitive document is `README.md`.
The statements here suggest Lean forms for the milestones of Layer 0 (graded rings and their
homogeneous units), which use Mathlib only, so that contributors and reviewers converge on names
and signatures. `sorry` is allowed in this human-owned roadmap library: these are goals, not
proofs. Definitions have real bodies; only theorem statements are `sorry`.

A `𝔾_m`-action on an affine scheme `Spec A` is a `ℤ`-grading `𝒜` of `A`, and a linearisation of the
trivial line bundle is a grading `ℳ` of the `A`-module `A` compatible with `𝒜`. If `ℳ` has a
homogeneous generator, a unit of `A` in some `ℳ c`, then `ℳ` is a shift of `𝒜`
(`eq_map_mulLeft_of_isUnit_mem`), and two shifts are isomorphic iff their difference is the degree
of a homogeneous unit; `ShiftClassGroup 𝒜` is the group of shifts up to isomorphism. A homogeneous
generator exists when `A` has no idempotents other than `0` and `1`
(`exists_isUnit_mem_of_connected`); without that hypothesis `ShiftClassGroup 𝒜` can be smaller than
the group of all gradings (`k × k` with the trivial grading: `ℤ` against `ℤ²`). For `Spec A`
connected with `Pic A = 0`, `ShiftClassGroup 𝒜` is `Pic [Spec A / 𝔾_m]` (README, 1.2 and 1.4).
-/

@[expose] public section

namespace TauCetiRoadmap.EquivariantIntersectionTheory

open MvPolynomial

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

/-- **Layer 0.4.** With positive weights, the only homogeneous units of `K[σ]` are the nonzero
constants. -/
theorem homogeneousUnitDegrees_weighted (w : σ → ℤ) (hw : ∀ i, 0 < w i) :
    homogeneousUnitDegrees (weightedHomogeneousSubmodule K w) = ⊥ := by
  sorry

/-- **Layer 0.4.** Inverting a prime weighted-homogeneous polynomial of weight `e > 0`: the
homogeneous units of `K[σ]_f` are the `c fᵏ`, so their degrees are the multiples of `e`, and
`[ (𝔸^σ ∖ {f = 0}) / 𝔾_m ]` has `ShiftClassGroup ≅ ℤ/e`, its whole Picard group (README, 3.1). -/
theorem homogeneousUnitDegrees_away_prime [Finite σ] (w : σ → ℤ) (hw : ∀ i, 0 < w i)
    {f : MvPolynomial σ K} {e : ℤ} (hf : f ∈ weightedHomogeneousSubmodule K w e)
    (hprime : Prime f) (he : 0 < e) :
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

/-- **Layer 0.5.** The graded computation behind `Pic [M_{0,n}/𝔖ₙ₋₁] ≅ ℤ/(n − 1)(n − 2)`, with
`m = n − 1`, `n ≥ 3` (README, 3.4). -/
theorem homogeneousUnitDegrees_depressed [CharZero K] (m : ℕ) (hm : 2 ≤ m) :
    homogeneousUnitDegrees
        (awayGrading (weightedHomogeneousSubmodule K (depressedWeight m))
          (depressedDiscr_mem K m hm)) =
      AddSubgroup.zmultiples ((m : ℤ) * (m - 1)) := by
  sorry

end Discriminant

end TauCetiRoadmap.EquivariantIntersectionTheory
