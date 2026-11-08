/-
Copyright (c) 2026 Kim Morrison. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
module

import Mathlib

/-!
# Operator K-theory, extensions, and KK-theory: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states, each with `sorry`, the
headline theorems of the README that are statable against the pinned Mathlib and Tau Ceti:
Atkinson's theorem of K4 in its parametrix form, and the two Brown–Douglas–Fillmore
classification statements of K8 together with the two operator predicates they need. Operators
are Mathlib's continuous linear maps between complex Hilbert spaces, with
`ContinuousLinearMap.IsFredholm`, the index `LinearMap.index` and `IsCompactOperator`.

Headline theorems of the README that are not statable at the pins, and the carrier each lacks:

* K1–K2: K₀ and K₁ of a C*-algebra, the order and trace pairing, and the comparison of K₀ with
  the split Grothendieck group of the projective modules. Mathlib has
  `Algebra.GrothendieckAddGroup`, but no monoid of matrix projections up to rectangular
  equivalence with block-sum addition, and no stable unitary group or its homotopy classes.
* K3: Bott periodicity `K_i(S²A) ≃ K_i(A)`, the six-term exact sequence of an extension, the
  pullback Mayer–Vietoris sequence and the external product. Besides K₀ and K₁ these need the
  spatial tensor product of C*-algebras, which Mathlib does not have.
* K4: the Calkin-algebra form of Atkinson's theorem, the K₀(A)-valued module index, the Ext
  semigroup and its invertibility criterion, and the group Ext(A,B) for separable nuclear A. There
  is no Calkin C*-algebra `B(H)/K(H)` (invertibility there is the parametrix form stated below), no
  compact or adjointable operators on Hilbert C*-modules, no corona algebra of `B ⊗ K` and no
  Busby invariants.
* K5–K6: the groups KK(A,B), the Kasparov product and its associativity, the six-term sequences
  of semisplit extensions, the Manuilov–Thomsen sequence and the index pairing. There are no
  ℤ/2-graded Hilbert modules, no interior tensor product of Hilbert modules and no Kasparov cycles.
* K7: the Green–Julg and Connes–Thom theorems, the Pimsner–Voiculescu sequences, the K-groups of
  free-group, rotation and Cuntz algebras, and the simplicity criterion for twisted group
  algebras. Tau Ceti has the full crossed product `TauCeti.CStarAction.FullCrossedProduct` and the
  algebraic twisted group algebra `TauCeti.twistedMonoidAlgebra`. The K-theoretic statements need
  K₀, K₁ and KK of crossed products, missing as recorded under K1–K2 and K5–K6. Neither library
  has the reduced crossed product, the C*-completion of a twisted group algebra in its regular
  representation on `ℓ²`, which the simplicity criterion is about, or universal C*-algebras on
  generators and relations such as the Cuntz algebras.
* K8: the UCT and Künneth sequences and the bootstrap class, which need KK-groups and
  KK-equivalence.
* K9: the asymptotic homotopy category, E-theory and its universal property, and the comparison
  `KK → E`. There is no asymptotic algebra `C_b([1,∞),B)/C₀([1,∞),B)`.
-/

noncomputable section

namespace TauCetiRoadmap.OperatorKTheory

/-! ## K4: Atkinson's theorem -/

/-- **Atkinson's theorem.** A bounded operator `T : H₀ → H₁` between complex Hilbert spaces is
Fredholm exactly when it is invertible modulo compact operators: some bounded `S : H₁ → H₀` makes
`S ∘ T - 1` compact on `H₀` and `T ∘ S - 1` compact on `H₁` (Zois, *18 Lectures on K-Theory*,
Analytic K-theory, Lecture 1, Theorem 1, p. 59; README, 4.1). For `H₀ = H₁` this says that the
image of `T` in the Calkin algebra is invertible. A parametrix on one side only does not
suffice: the isometry `V δₙ = δ₂ₙ` of `ℓ²(ℕ)` has `V* V = 1` but an infinite-dimensional
cokernel. -/
theorem isFredholm_iff_exists_isCompactOperator_comp_sub_one
    {H₀ H₁ : Type*} [NormedAddCommGroup H₀] [InnerProductSpace ℂ H₀] [CompleteSpace H₀]
    [NormedAddCommGroup H₁] [InnerProductSpace ℂ H₁] [CompleteSpace H₁] {T : H₀ →L[ℂ] H₁} :
    T.IsFredholm ↔ ∃ S : H₁ →L[ℂ] H₀,
      IsCompactOperator (S.comp T - 1 : H₀ →L[ℂ] H₀) ∧
        IsCompactOperator (T.comp S - 1 : H₁ →L[ℂ] H₁) := by
  sorry

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
