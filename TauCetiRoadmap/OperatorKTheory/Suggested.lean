/-
Copyright (c) 2026 Kim Morrison. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
module

import Mathlib

/-!
# Operator K-theory, extensions, and KK-theory: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states, each with `sorry`, the
headline theorems of the README that are statable against the pinned Mathlib and Tau Ceti: the
two Brown–Douglas–Fillmore classification statements of K8, together with the two operator
predicates they need. Operators are Mathlib's `H →L[ℂ] H` with `ContinuousLinearMap.IsFredholm`,
the index `LinearMap.index` and `IsCompactOperator`.

Headline theorems of the README that are not statable at the pins, and the carrier each lacks:

* K1–K2: K₀ and K₁ of a C*-algebra, the order and trace pairing, and the comparison of K₀ with
  the split Grothendieck group of the projective modules. Mathlib has
  `Algebra.GrothendieckAddGroup`, but no monoid of matrix projections up to rectangular
  equivalence with block-sum addition, and no stable unitary group or its homotopy classes.
* K3: Bott periodicity `K_i(S²A) ≃ K_i(A)`, the six-term exact sequence of an extension, the
  pullback Mayer–Vietoris sequence and the external product. Besides K₀ and K₁ these need the
  spatial tensor product of C*-algebras, which Mathlib does not have.
* K4: the K₀(A)-valued module index, the Ext semigroup and its invertibility criterion, and the
  group Ext(A,B) for separable nuclear A. There are no compact or adjointable operators on Hilbert
  C*-modules, no corona algebra of `B ⊗ K` and no Busby invariants.
* K5–K6: the groups KK(A,B), the Kasparov product and its associativity, the six-term sequences
  of semisplit extensions, the Manuilov–Thomsen sequence and the index pairing. There are no
  ℤ/2-graded Hilbert modules, no interior tensor product of Hilbert modules and no Kasparov cycles.
* K7: the Green–Julg and Connes–Thom theorems, the Pimsner–Voiculescu sequences, the K-groups of
  free-group, rotation and Cuntz algebras, and the simplicity criterion for twisted group
  algebras. Mathlib has no crossed product of a C*-algebra by a group, no group C*-algebra, twisted
  or not, and no universal C*-algebra on generators and relations.
* K8: the UCT and Künneth sequences and the bootstrap class, which need KK-groups and
  KK-equivalence.
* K9: the asymptotic homotopy category, E-theory and its universal property, and the comparison
  `KK → E`. There is no asymptotic algebra `C_b([1,∞),B)/C₀([1,∞),B)`.
-/

noncomputable section

namespace TauCetiRoadmap.OperatorKTheory

/-! ## K8: the Brown–Douglas–Fillmore theorem -/

section BrownDouglasFillmore
variable {H : Type*} [NormedAddCommGroup H] [InnerProductSpace ℂ H] [CompleteSpace H]

/-- An operator is **essentially normal** when its self-commutator `T*T − TT*` is compact, that
is, when its image in the Calkin algebra is normal (README, 8.4). -/
def IsEssentiallyNormal (T : H →L[ℂ] H) : Prop :=
  IsCompactOperator (ContinuousLinearMap.adjoint T * T - T * ContinuousLinearMap.adjoint T)

/-- The **essential spectrum**: the scalars `μ` for which `T - μ` is not Fredholm, equivalently,
by Atkinson's theorem, for which the image of `T - μ` in the Calkin algebra is not invertible
(README, 4.1 and 8.4). On a finite-dimensional space it is empty. -/
def essentialSpectrum (T : H →L[ℂ] H) : Set ℂ :=
  {μ | ¬ (T - algebraMap ℂ (H →L[ℂ] H) μ).IsFredholm}

/-- **Brown–Douglas–Fillmore.** On a separable Hilbert space, two essentially normal operators
with the same essential spectrum are unitarily equivalent modulo compact operators exactly when
their index functions agree off the essential spectrum (Blackadar, *K-Theory for Operator
Algebras*, Corollary 16.2.2; README, 8.4). For finite-dimensional `H` both sides hold: every
operator is compact, the essential spectrum is empty and every index is `0`. -/
theorem exists_unitary_isCompactOperator_conj_sub_iff_index_eq
    [TopologicalSpace.SeparableSpace H]
    {T₁ T₂ : H →L[ℂ] H} (h₁ : IsEssentiallyNormal T₁) (h₂ : IsEssentiallyNormal T₂)
    (hσ : essentialSpectrum T₁ = essentialSpectrum T₂) :
    (∃ U ∈ unitary (H →L[ℂ] H), IsCompactOperator (U * T₁ * star U - T₂)) ↔
      ∀ μ ∉ essentialSpectrum T₁,
        (T₁ - algebraMap ℂ (H →L[ℂ] H) μ).index = (T₂ - algebraMap ℂ (H →L[ℂ] H) μ).index := by
  sorry

/-- **Brown–Douglas–Fillmore.** On a separable Hilbert space, an essentially normal operator is a
compact perturbation of a normal operator exactly when its index function vanishes off the
essential spectrum (Blackadar, *K-Theory for Operator Algebras*, Corollary 16.2.2; README, 8.4).
For finite-dimensional `H` both sides hold: `N = 0` is normal and `T - N = T` is compact, and
every index is `0`. -/
theorem exists_isStarNormal_isCompactOperator_sub_iff_index_eq_zero
    [TopologicalSpace.SeparableSpace H]
    {T : H →L[ℂ] H} (hT : IsEssentiallyNormal T) :
    (∃ N : H →L[ℂ] H, IsStarNormal N ∧ IsCompactOperator (T - N)) ↔
      ∀ μ ∉ essentialSpectrum T, (T - algebraMap ℂ (H →L[ℂ] H) μ).index = 0 := by
  sorry

end BrownDouglasFillmore

end TauCetiRoadmap.OperatorKTheory
