import Mathlib

set_option autoImplicit false

/-!
# Equivariant intersection theory: target signatures for Layer 0

**This file is not the roadmap and is not exhaustive.** The definitive document is `README.md`.
The statements here suggest Lean forms for the milestones of Layer 0 (graded rings and their
homogeneous units), which use Mathlib only, so that contributors and reviewers converge on names
and signatures. `sorry` is allowed in this human-owned roadmap library: these are goals, not
proofs. Definitions have real bodies; only theorem statements are `sorry`.

A `𝔾_m`-action on an affine scheme `Spec A` is a `ℤ`-grading of `A`; a `𝔾_m`-equivariant line
bundle on `Spec A` whose underlying line bundle is trivial is `A(d)` for some `d`, and `A(d) ≅ A(e)`
equivariantly iff `d − e` is the degree of a homogeneous unit. Layer 0 computes that group of
degrees, which is `Pic [Spec A / 𝔾_m]` as soon as `Pic A = 0` (README, Layer 2).
-/

namespace TauCetiRoadmap.EquivariantIntersectionTheory

open MvPolynomial

section Graded

variable {R A : Type*} [CommRing R] [CommRing A] [Algebra R A]

/-- **Layer 0.1.** The degrees of the homogeneous units of a `ℤ`-graded algebra. -/
def homogeneousUnitDegrees (𝒜 : ℤ → Submodule R A) : AddSubgroup ℤ :=
  AddSubgroup.closure {d | ∃ u : Aˣ, (u : A) ∈ 𝒜 d}

/-- **Layer 0.1.** The `𝔾_m`-equivariant line bundles with trivial underlying bundle, up to
equivariant isomorphism. -/
abbrev TrivialUnderlyingPic (𝒜 : ℤ → Submodule R A) : Type _ :=
  ℤ ⧸ homogeneousUnitDegrees 𝒜

/-- **Layer 0.1.** In a graded algebra, the inverse of a homogeneous unit is homogeneous, so the
closure adds nothing. -/
theorem mem_homogeneousUnitDegrees_iff (𝒜 : ℤ → Submodule R A) [GradedAlgebra 𝒜] (d : ℤ) :
    d ∈ homogeneousUnitDegrees 𝒜 ↔ ∃ u : Aˣ, (u : A) ∈ 𝒜 d := by
  sorry

/-- **Layer 0.2.** The grading of the localization `A_f` at a homogeneous element `f` of degree
`e`: `a / fⁿ` has degree `deg a − n e`. -/
noncomputable def awayGrading (𝒜 : ℤ → Submodule R A) {f : A} {e : ℤ} (_hf : f ∈ 𝒜 e) (d : ℤ) :
    Submodule R (Localization.Away f) :=
  Submodule.span R
    {x | ∃ (n : ℕ) (a : A), a ∈ 𝒜 (d + n * e) ∧
      x = IsLocalization.mk' _ a (⟨f ^ n, n, rfl⟩ : Submonoid.powers f)}

/-- **Layer 0.2.** The localization grading is a grading. -/
theorem awayGrading_isInternal (𝒜 : ℤ → Submodule R A) [GradedAlgebra 𝒜] {f : A} {e : ℤ}
    (hf : f ∈ 𝒜 e) : DirectSum.IsInternal (awayGrading 𝒜 hf) := by
  sorry

end Graded

section Weighted

variable {σ K : Type*} [Field K]

/-- **Layer 0.3.** With positive weights, the only homogeneous units of `K[σ]` are the nonzero
constants. -/
theorem homogeneousUnitDegrees_weighted (w : σ → ℤ) (hw : ∀ i, 0 < w i) :
    homogeneousUnitDegrees (weightedHomogeneousSubmodule K w) = ⊥ := by
  sorry

/-- **Layer 0.3.** Inverting a prime weighted-homogeneous polynomial of weight `e > 0`: the
homogeneous units of `K[σ]_f` are the `c fᵏ`, so their degrees are the multiples of `e`, and
`[ (𝔸^σ ∖ {f = 0}) / 𝔾_m ]` has `TrivialUnderlyingPic ≅ ℤ/e`. -/
theorem homogeneousUnitDegrees_away_prime [Finite σ] (w : σ → ℤ) (hw : ∀ i, 0 < w i)
    {f : MvPolynomial σ K} {e : ℤ} (hf : f ∈ weightedHomogeneousSubmodule K w e)
    (hprime : Prime f) (he : 0 < e) :
    homogeneousUnitDegrees (awayGrading (weightedHomogeneousSubmodule K w) hf) =
      AddSubgroup.zmultiples e := by
  sorry

end Weighted

section Discriminant

variable (K : Type*) [Field K]

/-- **Layer 0.4.** The generic depressed monic polynomial of degree `m`,
`Xᵐ + a₂ Xᵐ⁻² + ⋯ + aₘ`, with `aₖ` the variable `k − 2` of `K[a₂, …, aₘ]`. -/
noncomputable def genericDepressed (m : ℕ) : Polynomial (MvPolynomial (Fin (m - 1)) K) :=
  Polynomial.X ^ m +
    ∑ i : Fin (m - 1), Polynomial.C (MvPolynomial.X i) * Polynomial.X ^ (m - (i.val + 2))

/-- **Layer 0.4.** The weight of `aₖ` is `k`. -/
def depressedWeight (m : ℕ) : Fin (m - 1) → ℤ := fun i => (i.val : ℤ) + 2

/-- **Layer 0.4.** The discriminant of the generic depressed polynomial, an element of
`K[a₂, …, aₘ]`, with Mathlib's `Polynomial.discr`. -/
noncomputable def depressedDiscr (m : ℕ) : MvPolynomial (Fin (m - 1)) K :=
  Polynomial.discr (genericDepressed K m)

/-- **Layer 0.4.** The discriminant has weight `m (m − 1)`. -/
theorem depressedDiscr_mem (m : ℕ) (hm : 2 ≤ m) :
    depressedDiscr K m ∈
      weightedHomogeneousSubmodule K (depressedWeight m) ((m : ℤ) * (m - 1)) := by
  sorry

/-- **Layer 0.4.** In characteristic zero the discriminant is prime in `K[a₂, …, aₘ]`. -/
theorem depressedDiscr_prime [CharZero K] (m : ℕ) (hm : 2 ≤ m) : Prime (depressedDiscr K m) := by
  sorry

/-- **Layer 0.4.** The graded computation behind `Pic [M_{0,n}/𝔖ₙ₋₁] ≅ ℤ/(n − 1)(n − 2)`, with
`m = n − 1` (README, Layer 3). -/
theorem homogeneousUnitDegrees_depressed [CharZero K] (m : ℕ) (hm : 2 ≤ m) :
    homogeneousUnitDegrees
        (awayGrading (weightedHomogeneousSubmodule K (depressedWeight m))
          (depressedDiscr_mem K m hm)) =
      AddSubgroup.zmultiples ((m : ℤ) * (m - 1)) := by
  sorry

end Discriminant

end TauCetiRoadmap.EquivariantIntersectionTheory
