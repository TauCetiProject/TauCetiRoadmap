/-
Copyright (c) 2026 Kim Morrison. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Mathlib

/-!
# C*-algebras, operator spaces and approximation: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti, each admitted with `sorry`, together with the
few definitions needed to state them: irreducibility of a representation, complete boundedness,
nuclear completely positive contractions, quasidiagonal sets of operators and quasidiagonal
algebras, and the direct-sum and conjugation operators that Voiculescu's theorem compares.

Stated here: the nonunital unitization norm identities, quasicentral approximate units, heredity
of closed ideals and the compression criterion `pTp ≤ T ↔ Commute p T` (Layer 1); Kadison
transitivity with the exact norm bound (Layer 2); automatic complete boundedness, the matrix
bound `‖φ‖cb = ‖φ(1)‖`, the Kadison–Schwarz inequality, the multiplicative domain, Stinespring's
dilation theorem and the completely positive Radon–Nikodym theorem (Layer 4); Haagerup's
noncommutative Grothendieck inequality (Layer 6); the Choi–Effros lifting theorem (Layer 7);
Voiculescu's noncommutative Weyl–von Neumann theorem and his matrix-map criterion for
quasidiagonality (Layer 8); the homotopy invariance of quasidiagonality (Layer 9).

Not statable at the pins, hence README targets only: Ruan's representation theorem,
Wittstock's extension theorem, Paulsen's similarity theorem and the operator-space tensor
products (there is no operator-space carrier: no matrix norms on a subspace of a C*-algebra
and no `CB(E,F)`); the minimal and maximal C*-tensor products and everything stated through
them (nuclearity as `A ⊗max B = A ⊗min B`, exactness, Kirchberg's WEP and LLP
characterizations, properties C, C′ and C″); the bidual and amenability characterizations of
nuclearity (no `A**` as a W*-algebra, no Banach amenability); the primitive ideal space,
Dauns–Hofmann and the strict topology (no `Prim(A)` and no C*-quotient by a closed ideal);
Dadarlat's finite-dimensional approximation and the AF-subquotient theorem (no inductive limit
of C*-algebras).
-/

noncomputable section
open Filter Topology
open scoped CStarAlgebra ComplexOrder

namespace TauCetiRoadmap.CStarAlgebras

universe u v

/-! ## Layer 1: ideals, hereditary subalgebras and multipliers -/

section Layer1

variable {A : Type*} [NonUnitalCStarAlgebra A]

/-- §1.2: for a C*-algebra without a two-sided unit, the scalar part of `λ·id + L_a` is
dominated by the operator norm of that map on `A`. -/
theorem scalar_norm_le_unitizationLeftAction
    (hA : ¬ ∃ e : A, ∀ b : A, e * b = b ∧ b * e = b) (c : ℂ) (a : A) :
    ‖c‖ ≤ ‖c • ContinuousLinearMap.id ℂ A + ContinuousLinearMap.mul ℂ A a‖ := by
  sorry

/-- §1.2: the C*-norm of the unitization of a C*-algebra without a two-sided unit is the
operator norm of the left action `λ·id + L_a` on `A`. -/
theorem unitization_norm_eq_leftAction
    (hA : ¬ ∃ e : A, ∀ b : A, e * b = b ∧ b * e = b) (x : Unitization ℂ A) :
    ‖x‖ = ‖x.fst • ContinuousLinearMap.id ℂ A + ContinuousLinearMap.mul ℂ A x.snd‖ := by
  sorry

variable [PartialOrder A] [StarOrderedRing A]

/-- §1.5 (Arveson): every closed two-sided ideal has a positive contractive approximate unit
that is quasicentral in `A`. -/
theorem exists_quasicentral_approximateUnit (I : TwoSidedIdeal A)
    (hI : IsClosed (I : Set A)) :
    ∃ l : Filter A, l.NeBot ∧ (∀ᶠ e in l, e ∈ I ∧ 0 ≤ e ∧ ‖e‖ ≤ 1) ∧
      (∀ a ∈ I, Tendsto (fun e ↦ e * a) l (𝓝 a)) ∧
      (∀ a ∈ I, Tendsto (fun e ↦ a * e) l (𝓝 a)) ∧
      (∀ a : A, Tendsto (fun e ↦ e * a - a * e) l (𝓝 0)) := by
  sorry

/-- §1.3: a closed two-sided ideal is hereditary (Blackadar II.5.1.1(ii)). -/
theorem closed_ideal_isHereditary (I : TwoSidedIdeal A)
    (hI : IsClosed (I : Set A)) {a b : A} (ha : 0 ≤ a) (hab : a ≤ b)
    (hb : b ∈ I) : a ∈ I := by
  sorry

end Layer1

/-- §1.1: in a unital C*-algebra the compression of a positive `T` by a projection `p` lies
below `T` exactly when `p` and `T` commute. -/
theorem compression_le_iff_commute {D : Type*} [CStarAlgebra D]
    [PartialOrder D] [StarOrderedRing D] (p T : D)
    (hp : IsStarProjection p) (hT : 0 ≤ T) :
    p * T * p ≤ T ↔ Commute p T := by
  sorry

/-! ## Layer 2: irreducible representations, primitive ideals and the bidual -/

section Layer2

variable {A : Type*} [NonUnitalCStarAlgebra A]
  {H : Type*} [NormedAddCommGroup H] [InnerProductSpace ℂ H] [CompleteSpace H]

/-- §2.2: a representation is irreducible when it is nonzero and has no closed invariant
subspace other than `⊥` and `⊤`. -/
def IsIrreducible (π : A →⋆ₙₐ[ℂ] (H →L[ℂ] H)) : Prop :=
  (∃ a, π a ≠ 0) ∧
    ∀ S : Submodule ℂ H, IsClosed (S : Set H) →
      (∀ a, ∀ ξ ∈ S, π a ξ ∈ S) → S = ⊥ ∨ S = ⊤

/-- §2.2 (Kadison transitivity with the exact bound): an irreducible representation
interpolates any bounded operator on a finite-dimensional subspace by an element of norm at
most that of the operator (Blackadar II.6.1.13 and the `M₂(A)` corner argument). -/
theorem kadison_transitivity (π : A →⋆ₙₐ[ℂ] (H →L[ℂ] H)) (hπ : IsIrreducible π)
    (E : Submodule ℂ H) [FiniteDimensional ℂ E] (T : H →L[ℂ] H) :
    ∃ a : A, ‖a‖ ≤ ‖T‖ ∧ ∀ ξ ∈ E, π a ξ = T ξ := by
  sorry

/-- §2.2 (Kadison transitivity, self-adjoint form): the interpolating element can be chosen
self-adjoint when the operator is. -/
theorem kadison_transitivity_selfAdjoint (π : A →⋆ₙₐ[ℂ] (H →L[ℂ] H))
    (hπ : IsIrreducible π) (E : Submodule ℂ H) [FiniteDimensional ℂ E]
    (T : H →L[ℂ] H) (hT : IsSelfAdjoint T) :
    ∃ a : A, IsSelfAdjoint a ∧ ‖a‖ ≤ ‖T‖ ∧ ∀ ξ ∈ E, π a ξ = T ξ := by
  sorry

end Layer2

/-! ## Layer 4: CP dilations, multiplicative domains and Wittstock theory -/

section Layer4

variable {A B : Type*} [NonUnitalCStarAlgebra A] [NonUnitalCStarAlgebra B]
  [PartialOrder A] [StarOrderedRing A] [PartialOrder B] [StarOrderedRing B]

/-- A uniform matrix norm bound, using the C*-norm of `CStarMatrix` rather than an entrywise
matrix norm. -/
def IsCompletelyBounded (φ : A →ₗ[ℂ] B) : Prop :=
  ∃ C : ℝ, 0 ≤ C ∧ ∀ (n : ℕ) (x : CStarMatrix (Fin n) (Fin n) A),
    ‖x.map φ‖ ≤ C * ‖x‖

/-- §4.1: a completely positive map is completely bounded. -/
theorem completelyPositive_isCompletelyBounded (φ : A →CP B) :
    IsCompletelyBounded φ.toLinearMap := by
  sorry

end Layer4

section Layer4Unital

variable {D E : Type*} [CStarAlgebra D] [CStarAlgebra E]
  [PartialOrder D] [StarOrderedRing D] [PartialOrder E] [StarOrderedRing E]

/-- §4.1: for a completely positive map with unital domain every matrix amplification is
bounded by `‖φ 1‖`, so `‖φ‖cb = ‖φ‖ = ‖φ 1‖`. -/
theorem completelyPositive_matrix_bound (φ : D →CP E) (n : ℕ)
    (x : CStarMatrix (Fin n) (Fin n) D) :
    ‖x.map φ‖ ≤ ‖φ 1‖ * ‖x‖ := by
  sorry

/-- §4.1 (Kadison–Schwarz): a unital completely positive map satisfies
`φ(a)*φ(a) ≤ φ(a*a)`. -/
theorem schwarz (φ : D →CP E) (hφ : φ 1 = 1) (a : D) :
    star (φ a) * φ a ≤ φ (star a * a) := by
  sorry

/-- §4.1 (Choi): both Schwarz equalities for `a` hold exactly when `φ` is multiplicative
against `a` on both sides. -/
theorem multiplicativeDomain_iff (φ : D →CP E) (hφ : φ 1 = 1) (a : D) :
    (φ (star a * a) = star (φ a) * φ a ∧
      φ (a * star a) = φ a * star (φ a)) ↔
    ∀ b : D, φ (a * b) = φ a * φ b ∧ φ (b * a) = φ b * φ a := by
  sorry

/-- §4.1: the elements satisfying both Schwarz equalities form a closed unital
star-subalgebra, the multiplicative domain of `φ`. -/
theorem multiplicativeDomain_isClosedStarSubalgebra (φ : D →CP E) (hφ : φ 1 = 1) :
    ∃ S : StarSubalgebra ℂ D, IsClosed (S : Set D) ∧
      ∀ a : D, a ∈ S ↔
        φ (star a * a) = star (φ a) * φ a ∧
        φ (a * star a) = φ a * star (φ a) := by
  sorry

end Layer4Unital

section Stinespring

variable {D : Type u} [CStarAlgebra D] [PartialOrder D] [StarOrderedRing D]
  {H : Type v} [NormedAddCommGroup H] [InnerProductSpace ℂ H] [CompleteSpace H]

/-- §4.2 (Stinespring): a completely positive map `D → B(H)` with unital domain is
`V* π(·) V` for a unital representation `π` on a Hilbert space `K` and a bounded `V : H → K`
with `‖V‖² = ‖φ 1‖`, and the dilation can be taken minimal (Stinespring, Theorem 1;
Blackadar II.6.9.7). -/
theorem stinespring (φ : D →CP (H →L[ℂ] H)) :
    ∃ (K : Type (max u v)) (_ : NormedAddCommGroup K) (_ : InnerProductSpace ℂ K)
      (_ : CompleteSpace K) (π : D →⋆ₐ[ℂ] (K →L[ℂ] K)) (V : H →L[ℂ] K),
      (∀ a, φ a = V.adjoint.comp ((π a).comp V)) ∧ ‖V‖ ^ 2 = ‖φ 1‖ ∧
      (Submodule.span ℂ {x : K | ∃ (a : D) (ξ : H), x = π a (V ξ)}).topologicalClosure = ⊤ := by
  sorry

end Stinespring

section RadonNikodym

variable {D H K : Type*} [CStarAlgebra D] [PartialOrder D] [StarOrderedRing D]
  [NormedAddCommGroup H] [InnerProductSpace ℂ H] [CompleteSpace H]
  [NormedAddCommGroup K] [InnerProductSpace ℂ K] [CompleteSpace K]

/-- §4.2 (Arveson's Radon–Nikodym theorem): for a minimal Stinespring dilation of `φ`, the
completely positive maps below `φ` are exactly `V* T π(·) V` for a unique positive contraction
`T` in the commutant of `π` (Arveson, Theorem 1.4.2). -/
theorem cp_radonNikodym (φ ψ : D →CP (H →L[ℂ] H))
    (π : D →⋆ₐ[ℂ] (K →L[ℂ] K)) (V : H →L[ℂ] K)
    (hφ : ∀ a, φ a = V.adjoint.comp ((π a).comp V))
    (hminimal : (Submodule.span ℂ
      {x : K | ∃ (a : D) (ξ : H), x = π a (V ξ)}).topologicalClosure = ⊤)
    (hdom : ∃ θ : D →CP (H →L[ℂ] H), ∀ a, φ a = ψ a + θ a) :
    ∃! T : K →L[ℂ] K, 0 ≤ T ∧ T ≤ 1 ∧ (∀ a, Commute T (π a)) ∧
      ∀ a, ψ a = V.adjoint.comp (T.comp ((π a).comp V)) := by
  sorry

end RadonNikodym

/-! ## Layer 6: nuclearity, the bidual and Banach amenability -/

section Grothendieck

variable {A B : Type*} [CStarAlgebra A] [CStarAlgebra B]
  [PartialOrder A] [StarOrderedRing A] [PartialOrder B] [StarOrderedRing B]

/-- §6.3 (Haagerup's noncommutative Grothendieck inequality): a bounded bilinear form on
nonzero unital C*-algebras is dominated by `‖u‖` times the geometric mean of two
two-state expressions (Pisier, Grothendieck's theorem past and present, Theorem 7.1). -/
theorem haagerup_grothendieck [Nontrivial A] [Nontrivial B] (u : A →L[ℂ] B →L[ℂ] ℂ) :
    ∃ (f₁ f₂ : A →P[ℂ] ℂ) (g₁ g₂ : B →P[ℂ] ℂ),
      f₁ 1 = 1 ∧ f₂ 1 = 1 ∧ g₁ 1 = 1 ∧ g₂ 1 = 1 ∧
      ∀ a b, ‖u a b‖ ≤ ‖u‖ * Real.sqrt ((f₁ (star a * a)).re + (f₂ (a * star a)).re) *
        Real.sqrt ((g₁ (star b * b)).re + (g₂ (b * star b)).re) := by
  sorry

end Grothendieck

/-! ## Layer 7: exactness, lifting and weak expectation -/

section Lifting

variable {A B C : Type*} [NonUnitalCStarAlgebra A] [NonUnitalCStarAlgebra B]
  [NonUnitalCStarAlgebra C] [PartialOrder A] [StarOrderedRing A]
  [PartialOrder B] [StarOrderedRing B] [PartialOrder C] [StarOrderedRing C]

/-- Point-norm approximation of a completely positive map by composites of completely
positive contractions through full matrix algebras (a nuclear completely positive
contraction). -/
def IsNuclearContraction (φ : A →CP C) : Prop :=
  ∀ (F : Finset A) (ε : ℝ), 0 < ε →
    ∃ (n : ℕ) (α : A →CP CStarMatrix (Fin n) (Fin n) ℂ)
      (β : CStarMatrix (Fin n) (Fin n) ℂ →CP C),
      (∀ a, ‖α a‖ ≤ ‖a‖) ∧ (∀ x, ‖β x‖ ≤ ‖x‖) ∧
      ∀ a ∈ F, ‖β (α a) - φ a‖ < ε

/-- §7.2 (Choi–Effros lifting theorem): a nuclear completely positive contraction from a
separable C*-algebra into the image of a surjective star homomorphism `q : B → C` lifts to a
completely positive contraction into `B` (Blackadar IV.3.2.4). -/
theorem choi_effros_lifting [TopologicalSpace.SeparableSpace A]
    (q : B →⋆ₙₐ[ℂ] C) (hq : Function.Surjective q)
    (φ : A →CP C) (hφ : IsNuclearContraction φ) :
    ∃ ψ : A →CP B, (∀ a, ‖ψ a‖ ≤ ‖a‖) ∧ ∀ a, q (ψ a) = φ a := by
  sorry

end Lifting

/-! ## Layer 8: quasidiagonality and representation approximation -/

section Quasidiagonal

variable {H : Type*} [NormedAddCommGroup H] [InnerProductSpace ℂ H] [CompleteSpace H]

/-- §8.1: a set of operators is quasidiagonal when every finite subset almost commutes with a
finite-rank projection that almost fixes any finite set of vectors. -/
def IsQuasidiagonalSet (Ω : Set (H →L[ℂ] H)) : Prop :=
  ∀ (F : Finset (H →L[ℂ] H)), (F : Set (H →L[ℂ] H)) ⊆ Ω →
    ∀ (X : Finset H) (ε : ℝ), 0 < ε →
      ∃ P : H →L[ℂ] H, IsStarProjection P ∧
        FiniteDimensional ℂ (LinearMap.range (P : H →ₗ[ℂ] H)) ∧
        (∀ T ∈ F, ‖P * T - T * P‖ < ε) ∧ ∀ ξ ∈ X, ‖P ξ - ξ‖ < ε

/-- §8.1: a C*-algebra is quasidiagonal when it has a faithful representation whose image is
a quasidiagonal set of operators. -/
def IsQuasidiagonal (A : Type*) [NonUnitalCStarAlgebra A] : Prop :=
  ∃ (K : Type u) (_ : NormedAddCommGroup K) (_ : InnerProductSpace ℂ K) (_ : CompleteSpace K)
    (π : A →⋆ₙₐ[ℂ] (K →L[ℂ] K)), Function.Injective π ∧ IsQuasidiagonalSet (Set.range π)

/-- §8.3 (Voiculescu's abstract criterion): a separable unital C*-algebra is quasidiagonal
exactly when it admits unital completely positive maps into full matrix algebras that are
asymptotically multiplicative and asymptotically isometric (Blackadar V.4.2.14). -/
theorem isQuasidiagonal_iff_exists_matrix_maps {D : Type*} [CStarAlgebra D]
    [PartialOrder D] [StarOrderedRing D] [TopologicalSpace.SeparableSpace D] :
    IsQuasidiagonal.{u} D ↔
      ∃ (k : ℕ → ℕ) (φ : ∀ n, D →CP CStarMatrix (Fin (k n)) (Fin (k n)) ℂ),
        (∀ n, φ n 1 = 1) ∧
        (∀ a b, Tendsto (fun n ↦ ‖φ n (a * b) - φ n a * φ n b‖) atTop (𝓝 0)) ∧
        ∀ a, Tendsto (fun n ↦ ‖φ n a‖) atTop (𝓝 ‖a‖) := by
  sorry

end Quasidiagonal

section Voiculescu

variable {H K : Type*} [NormedAddCommGroup H] [InnerProductSpace ℂ H] [CompleteSpace H]
  [NormedAddCommGroup K] [InnerProductSpace ℂ K] [CompleteSpace K]

/-- The operator `S ⊕ T` on the Hilbert direct sum `H ⊕₂ K`. -/
def directSumOperator (S : H →L[ℂ] H) (T : K →L[ℂ] K) :
    WithLp 2 (H × K) →L[ℂ] WithLp 2 (H × K) :=
  (WithLp.prodContinuousLinearEquiv 2 ℂ H K).symm.toContinuousLinearMap.comp
    ((S.prodMap T).comp (WithLp.prodContinuousLinearEquiv 2 ℂ H K).toContinuousLinearMap)

/-- Conjugation `U S U*` of an operator on `H` by a unitary `U : H ≃ W`. -/
def conjugate {W : Type*} [NormedAddCommGroup W] [InnerProductSpace ℂ W]
    (U : H ≃ₗᵢ[ℂ] W) (S : H →L[ℂ] H) : W →L[ℂ] W :=
  U.toContinuousLinearEquiv.toContinuousLinearMap.comp
    (S.comp U.symm.toContinuousLinearEquiv.toContinuousLinearMap)

/-- §8.2 (Voiculescu's noncommutative Weyl–von Neumann theorem): for a separable unital
`D`, a faithful unital representation `π` on separable `H` meeting the compact operators only
in `0`, and any unital representation `ρ` on separable `K`, there are unitaries
`U_n : H → H ⊕ K` with `U_n π(a) U_n* − (π(a) ⊕ ρ(a))` compact and tending to zero in norm
for every `a` (Blackadar II.8.4.29). -/
theorem voiculescu_weyl_von_neumann {D : Type*} [CStarAlgebra D]
    [TopologicalSpace.SeparableSpace D] [TopologicalSpace.SeparableSpace H]
    [TopologicalSpace.SeparableSpace K]
    (π : D →⋆ₐ[ℂ] (H →L[ℂ] H)) (hπ : Function.Injective π)
    (hess : ∀ a, IsCompactOperator (π a) → π a = 0)
    (ρ : D →⋆ₐ[ℂ] (K →L[ℂ] K)) :
    ∃ U : ℕ → (H ≃ₗᵢ[ℂ] WithLp 2 (H × K)), ∀ a,
      (∀ n, IsCompactOperator (conjugate (U n) (π a) - directSumOperator (π a) (ρ a))) ∧
      Tendsto (fun n ↦ ‖conjugate (U n) (π a) - directSumOperator (π a) (ρ a)‖)
        atTop (𝓝 0) := by
  sorry

end Voiculescu

/-! ## Layer 9: local reflexivity and exactness under quotients -/

section Homotopy

/-- §9.1 (Voiculescu): quasidiagonality passes down a homotopy domination: if `β ∘ α` is
homotopic to the identity of `A` through star homomorphisms `A → C([0,1], A)` and `B` is
quasidiagonal, then `A` is quasidiagonal (Blackadar V.4.2.10). -/
theorem isQuasidiagonal_of_homotopy {A B : Type*} [NonUnitalCStarAlgebra A]
    [NonUnitalCStarAlgebra B] [TopologicalSpace.SeparableSpace A]
    [TopologicalSpace.SeparableSpace B]
    (hB : IsQuasidiagonal.{u} B) (α : A →⋆ₙₐ[ℂ] B) (β : B →⋆ₙₐ[ℂ] A)
    (Φ : A →⋆ₙₐ[ℂ] C(unitInterval, A))
    (h0 : ∀ a, Φ a 0 = β (α a)) (h1 : ∀ a, Φ a 1 = a) :
    IsQuasidiagonal.{u} A := by
  sorry

end Homotopy

end TauCetiRoadmap.CStarAlgebras
