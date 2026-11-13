/-
Copyright (c) 2026 Kim Morrison. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Mathlib
import TauCeti.NumberTheory.Supernatural

/-!
# Classification of AF and purely infinite simple C*-algebras: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti, each with `sorry`, together with the few
definitions those statements need. Nothing here is an API catalogue: the README carries every
target, API list and Check.

Stated here: Elliott's approximate intertwining theorem (Layer 1), Bratteli's local
characterization of AF algebras (Layer 2), the countable Effros–Handelman–Shen theorem and
Glimm's classification of UHF algebras with its embedding and range statements (Layer 3).

Not statable at the pins, and therefore not stated:

* Elliott's AF classification, the scaled range theorem and the dimension-group description of
  ideals and traces (Layers 2–3): the pins have no `K₀` of a C*-algebra and no ordered `K₀`.
* The characterization of pure infiniteness, Kirchberg's tensor criterion, Zhang's dichotomy and
  the corner embeddings of `O₂` and `O∞` (Layer 4): the pins have no hereditary C*-subalgebras,
  no C*-simplicity (`IsSimpleRing` is algebraic simplicity), no minimal tensor product and no
  Cuntz algebras.
* `O₂` uniqueness, `O₂ ⊗ O₂ ≅ O₂` and the exact embedding theorem (Layer 5): no `O₂`, no
  exactness predicate, no sequence algebras `ℓ∞(A)/c₀(A)`.
* `A ⊗ O₂ ≅ O₂`, `O∞` absorption and central-sequence absorption (Layer 6): no minimal tensor
  product of C*-algebras, no nuclearity predicate, no `O∞`.
* Phillips's deformation theorem, the homomorphism picture of `KK` and the homomorphism theorem
  (Layer 7): no `KK`, no asymptotic morphisms, no `O∞`.
* Kirchberg–Phillips classification, the automorphism theorem, the range theorem and the
  Cuntz-algebra computations (Layer 8): no `KK`, no bootstrap class, no `K`-groups of
  C*-algebras.
-/

noncomputable section
open Filter Topology

namespace TauCetiRoadmap.CStarClassification

/-! ## Layer 1: Finite-dimensional maps and approximate intertwining -/

section Equivalence
variable {A B : Type*} [NonUnitalCStarAlgebra A] [CStarAlgebra B]

/-- Approximate unitary equivalence of two maps `φ ψ : A → B` into a unital C*-algebra `B`,
implemented by unitaries of `B` itself: for every finite `F ⊆ A` and `ε > 0` some unitary `u`
has `‖u φ(a) u* − ψ(a)‖ < ε` on `F`. The README also specifies the versions with unitaries in
the multiplier algebra and in the minimal unitization of a nonunital target. -/
def ApproximatelyUnitarilyEquivalent (φ ψ : A →⋆ₙₐ[ℂ] B) : Prop :=
  ∀ (F : Finset A) (ε : ℝ), 0 < ε →
    ∃ u : unitary B, ∀ a ∈ F,
      ‖(u : B) * φ a * star (u : B) - ψ a‖ < ε

end Equivalence

/-- Elliott's approximate intertwining theorem (Rørdam, *Classification of Nuclear
C*-Algebras*, §2.3; the isomorphism conclusion is Kirchberg–Phillips, *Embedding of exact
C*-algebras in the Cuntz algebra O₂*, Lemma 0.6): if `φ : A → B` and `ψ : B → A` are *-homomorphisms between separable
unital C*-algebras with `ψ ∘ φ` approximately unitarily equivalent to the identity of `A` and
`φ ∘ ψ` approximately unitarily equivalent to the identity of `B`, then there is a
*-isomorphism `A ≅ B` approximately unitarily equivalent to `φ`. The two hypotheses force
`φ` and `ψ` to be unital. -/
theorem elliott_intertwining {A B : Type*} [CStarAlgebra A] [CStarAlgebra B]
    [TopologicalSpace.SeparableSpace A] [TopologicalSpace.SeparableSpace B]
    (φ : A →⋆ₙₐ[ℂ] B) (ψ : B →⋆ₙₐ[ℂ] A)
    (hψφ : ApproximatelyUnitarilyEquivalent (ψ.comp φ) (NonUnitalStarAlgHom.id ℂ A))
    (hφψ : ApproximatelyUnitarilyEquivalent (φ.comp ψ) (NonUnitalStarAlgHom.id ℂ B)) :
    ∃ θ : A ≃⋆ₐ[ℂ] B, ApproximatelyUnitarilyEquivalent θ.toNonUnitalStarAlgHom φ := by
  sorry

/-! ## Layer 2: AF structure and classification -/

section FiniteApproximation
variable (A : Type*) [NonUnitalCStarAlgebra A]

/-- `A` is AF: it is the closure of an increasing sequence of finite-dimensional
C*-subalgebras. Nonunital algebras and the zero algebra are included. -/
def IsAF : Prop :=
  ∃ S : ℕ → NonUnitalStarSubalgebra ℂ A,
    Monotone S ∧ (∀ n, FiniteDimensional ℂ (S n)) ∧
      Dense (⋃ n, (S n : Set A))

/-- Bratteli's local characterization of AF algebras (Bratteli, *Inductive limits of finite
dimensional C*-algebras*, Theorem 2.2, for unital algebras; the nonunital case is the README's
§2.1): a separable C*-algebra is AF if and only if every finite subset is approximated to every
positive tolerance inside a finite-dimensional C*-subalgebra. Separability is needed: `ℓ∞(ℕ)`
satisfies the local condition and is not a sequential union of finite-dimensional
subalgebras. -/
theorem isAF_iff_local_approximation [TopologicalSpace.SeparableSpace A] :
    IsAF A ↔
      ∀ (F : Finset A) (ε : ℝ), 0 < ε →
        ∃ S : NonUnitalStarSubalgebra ℂ A, FiniteDimensional ℂ S ∧
          ∀ a ∈ F, ∃ b ∈ S, ‖a - b‖ < ε := by
  sorry

end FiniteApproximation

/-! ## Layer 3: Dimension groups, scales, traces and UHF algebras -/

section OrderedGroups

/-- Riesz interpolation in a partially ordered abelian group: whenever `aᵢ ≤ bⱼ` for
`i, j ∈ {1, 2}` there is `c` with `aᵢ ≤ c ≤ bⱼ` for all `i, j`. This is weaker than a lattice
order. -/
def HasRieszInterpolation (G : Type*) [AddCommGroup G] [PartialOrder G]
    [IsOrderedAddMonoid G] : Prop :=
  ∀ a₁ a₂ b₁ b₂ : G,
    a₁ ≤ b₁ → a₁ ≤ b₂ → a₂ ≤ b₁ → a₂ ≤ b₂ →
    ∃ c : G, a₁ ≤ c ∧ a₂ ≤ c ∧ c ≤ b₁ ∧ c ≤ b₂

/-- Unperforation of a partially ordered abelian group: `n • g ≥ 0` with `n ≥ 1` forces
`g ≥ 0`. -/
def IsUnperforated (G : Type*) [AddCommGroup G] [PartialOrder G]
    [IsOrderedAddMonoid G] : Prop :=
  ∀ (n : ℕ), 0 < n → ∀ g : G, 0 ≤ n • g → 0 ≤ g

/-- A dimension group: a directed, unperforated partially ordered abelian group with Riesz
interpolation. Countability and a scale are separate data. -/
def IsDimensionGroup (G : Type*) [AddCommGroup G] [PartialOrder G]
    [IsOrderedAddMonoid G] : Prop :=
  IsDirected G (· ≤ ·) ∧ IsUnperforated G ∧ HasRieszInterpolation G

/-- The composite of the bonding maps of a sequential system of simplicial groups from stage
`n` to stage `n + k`. -/
def bondIter {rank : ℕ → ℕ}
    (bond : ∀ n, (Fin (rank n) → ℤ) →+ (Fin (rank (n + 1)) → ℤ)) (n : ℕ) :
    ∀ k : ℕ, (Fin (rank n) → ℤ) →+ (Fin (rank (n + k)) → ℤ)
  | 0 => AddMonoidHom.id _
  | k + 1 => (bond (n + k)).comp (bondIter bond n k)

/-- A presentation of a partially ordered abelian group `G` as the sequential positive
inductive limit of simplicial groups `(ℤ^{rₙ}, ℕ^{rₙ})`: positive bonding maps (not required to
be injective), compatible positive maps into `G` whose images exhaust `G` and whose images of
the positive cones exhaust `G⁺`, and whose kernels are the eventual kernels of the system. -/
structure SimplicialPresentation (G : Type*) [AddCommGroup G] [PartialOrder G] where
  /-- The rank of the simplicial group at stage `n`. -/
  rank : ℕ → ℕ
  /-- The bonding map from stage `n` to stage `n + 1`. -/
  bond : ∀ n, (Fin (rank n) → ℤ) →+ (Fin (rank (n + 1)) → ℤ)
  bond_mono : ∀ n, Monotone (bond n)
  /-- The map from stage `n` to the limit `G`. -/
  toLimit : ∀ n, (Fin (rank n) → ℤ) →+ G
  toLimit_mono : ∀ n, Monotone (toLimit n)
  toLimit_comp_bond : ∀ n, (toLimit (n + 1)).comp (bond n) = toLimit n
  exhausts : ∀ g : G, ∃ n x, toLimit n x = g
  exhausts_pos : ∀ g : G, 0 ≤ g → ∃ n x, 0 ≤ x ∧ toLimit n x = g
  eventually_zero : ∀ n x, toLimit n x = 0 → ∃ k, bondIter bond n k x = 0

/-- The Effros–Handelman–Shen theorem in its countable form (Goodearl–Wehrung,
*Representations of distributive semilattices in ideal lattices of various algebraic
structures*, Theorem 3.3, citing Effros–Handelman–Shen, Theorem 2.2): a partially ordered
abelian group is a countable dimension group if and only if it is the sequential positive
inductive limit of simplicial groups. The limit side forces countability, so the statement
carries no separate hypothesis. -/
theorem effros_handelman_shen (G : Type*) [AddCommGroup G] [PartialOrder G]
    [IsOrderedAddMonoid G] :
    (IsDimensionGroup G ∧ Countable G) ↔ Nonempty (SimplicialPresentation G) := by
  sorry

end OrderedGroups

section UHF

/-- A UHF presentation of a unital C*-algebra `A`: an increasing sequence of unital
C*-subalgebras, each *-isomorphic to a full matrix algebra, with dense union. The inclusions are
unital because `StarSubalgebra` contains the unit, so each size divides the next. -/
structure UHFPresentation (A : Type*) [CStarAlgebra A] where
  /-- The matrix size at stage `n`. -/
  size : ℕ → ℕ+
  /-- The unital subalgebra at stage `n`. -/
  stage : ℕ → StarSubalgebra ℂ A
  mono : Monotone stage
  equiv : ∀ n, Nonempty (stage n ≃⋆ₐ[ℂ] Matrix (Fin (size n)) (Fin (size n)) ℂ)
  dense : Dense (⋃ n, (stage n : Set A))

/-- The supernatural invariant of a sequence of matrix sizes: the supremum, in the divisibility
lattice of `TauCeti.Supernatural`, of the sizes. For a UHF presentation this is the formal
product `∏ₚ p^{sup_n v_p(dₙ)}`. -/
def supernaturalOfSizes (d : ℕ → ℕ+) : TauCeti.Supernatural :=
  ⨆ n, TauCeti.Supernatural.ofNat (d n)

/-- Glimm's classification of UHF algebras (Glimm, *On a certain class of operator algebras*,
Theorem 1.12; Rørdam, *Classification of Nuclear C*-Algebras*, Theorem 1.3.3 applied to UHF
algebras): two UHF algebras are *-isomorphic if and only if their supernatural invariants
agree. -/
theorem glimm_classification {A B : Type*} [CStarAlgebra A] [CStarAlgebra B]
    (PA : UHFPresentation A) (PB : UHFPresentation B) :
    Nonempty (A ≃⋆ₐ[ℂ] B) ↔ supernaturalOfSizes PA.size = supernaturalOfSizes PB.size := by
  sorry

/-- A unital *-homomorphism from one UHF algebra to another exists exactly when the
supernatural invariant of the source divides that of the target: necessity is the description of
the invariant as the supremum over unital full matrix subalgebras (Glimm, *On a certain class
of operator algebras*, Theorem 1.13, second statement), sufficiency is an intertwining of the
presentations through unital matrix embeddings. Every such map is injective since the source is
simple. -/
theorem uhf_unital_embedding_iff {A B : Type*} [CStarAlgebra A] [CStarAlgebra B]
    (PA : UHFPresentation A) (PB : UHFPresentation B) :
    Nonempty (A →⋆ₐ[ℂ] B) ↔ supernaturalOfSizes PA.size ≤ supernaturalOfSizes PB.size := by
  sorry

/-- Every supernatural number is the invariant of a UHF algebra (Glimm, *On a certain class
of operator algebras*, §1, Definitions 1.3–1.5): the finite ones of full matrix algebras, the
others of inductive limits of full matrix algebras with unital connecting maps. -/
theorem exists_uhf (ν : TauCeti.Supernatural) :
    ∃ (A : Type) (_ : CStarAlgebra A) (P : UHFPresentation A),
      supernaturalOfSizes P.size = ν := by
  sorry

end UHF

end TauCetiRoadmap.CStarClassification
