/-
# Suggested interfaces for forcing

The roadmap's README.md is the definitive specification. This file contains
non-exhaustive suggested interfaces, not an exhaustive list of required declarations.
The theorem bodies below are admitted targets, not implementations.

The order and genericity prototypes draw on Cameron Freer's Apache-2.0 library:
https://github.com/cameronfreer/forcing
They describe mathematical interfaces rather than requiring that library as a dependency.
-/

module

public import Mathlib.Data.Finset.Basic
public import Mathlib.Data.Set.Countable
public import Mathlib.Order.Antichain
public import Mathlib.Order.Bounds.Defs
public import Mathlib.Order.CompleteBooleanAlgebra
public import Mathlib.Order.Heyting.Regular
public import Mathlib.Order.PFilter
public import Mathlib.Order.UpperLower.CompleteLattice

@[expose] public section

noncomputable section

universe u v w

namespace TauCetiRoadmap.Forcing

variable {P : Type u} {Q : Type v} [Preorder P] [Preorder Q]

/-! ## Order and supplied-family genericity

Smaller conditions are stronger. The existing predicates `IsCoinitial` and
`IsLowerSet` express density and downward closure. No greatest condition is assumed.
-/

/-- Compatibility means existence of a common strengthening. -/
def Compatible (p q : P) : Prop :=
  ∃ r, r ≤ p ∧ r ≤ q

/-- Predensity asks for a compatible member below every compatibility test. -/
def IsPredense (A : Set P) : Prop :=
  ∀ p, ∃ q ∈ A, Compatible p q

/-- A filter meets every member of a supplied family; density is a separate hypothesis. -/
def GenericFor (𝒟 : Set (Set P)) (G : Order.PFilter P) : Prop :=
  ∀ D ∈ 𝒟, ∃ p ∈ G, p ∈ D

/-- This is incompatibility, rather than incomparability for the order relation. -/
theorem maximalAntichain_iff (A : Set P) :
    IsMaxAntichain Compatible A ↔ IsAntichain Compatible A ∧ IsPredense A := by
  sorry

/-- The forcing-oriented presentation of Mathlib's Rasiowa–Sikorski machinery. -/
theorem exists_genericFor (𝒟 : Set (Set P)) (hcount : 𝒟.Countable)
    (hdense : ∀ D ∈ 𝒟, IsCoinitial D) (p : P) :
    ∃ G : Order.PFilter P, p ∈ G ∧ GenericFor 𝒟 G := by
  sorry

/-! ## Dense order embeddings and the qualified pullback -/

/-- An order embedding with coinitial range. -/
structure DenseOrderEmbedding (P : Type u) (Q : Type v) [Preorder P] [Preorder Q] where
  embedding : P ↪o Q
  dense_range : IsCoinitial (Set.range embedding)

namespace DenseOrderEmbedding

variable (e : DenseOrderEmbedding P Q)

/-- The upward closure of the image, not the literal image. -/
def mapSet (G : Order.PFilter P) : Set Q :=
  {q | ∃ p ∈ G, e.embedding p ≤ q}

/-- Pull a requirement back after closing it under strengthening. -/
def pullTest (D : Set Q) : Set P :=
  {p | ∃ q ∈ D, e.embedding p ≤ q}

theorem compatible_iff (p q : P) :
    Compatible (e.embedding p) (e.embedding q) ↔ Compatible p q := by
  sorry

/-- An existence target; no data definition depends on an admitted filter law. -/
theorem exists_mapFilter (G : Order.PFilter P) :
    ∃ H : Order.PFilter Q, (H : Set Q) = e.mapSet G := by
  sorry

/-- Transport is specified for any filter with the stated carrier. -/
theorem genericFor_map_iff (𝒟 : Set (Set Q))
    (G : Order.PFilter P) (H : Order.PFilter Q) (hH : (H : Set Q) = e.mapSet G) :
    GenericFor 𝒟 H ↔ GenericFor (e.pullTest '' 𝒟) G := by
  sorry

/-- Every member must have a strengthening inside the filter and inside the range.
Meeting the range just once is insufficient. The second conclusion is the inverse law. -/
theorem exists_pullFilter (H : Order.PFilter Q)
    (hloc : ∀ q ∈ H, ∃ p, e.embedding p ∈ H ∧ e.embedding p ≤ q) :
    ∃ G : Order.PFilter P, (G : Set P) = e.embedding ⁻¹' (H : Set Q) ∧
      e.mapSet G = (H : Set Q) := by
  sorry

end DenseOrderEmbedding

/-! ## Branching and external width properties

All sets, families, and cardinality assertions in this section are external.
These definitions alone are not hypotheses for cardinal preservation in a ground model.
-/

/-- Every condition has incompatible stronger conditions. -/
def IsAtomless (P : Type u) [Preorder P] : Prop :=
  ∀ p : P, ∃ q ≤ p, ∃ r ≤ p, ¬Compatible q r

theorem complement_filter_denseOpen (h : IsAtomless P) (G : Order.PFilter P) :
    IsCoinitial ((G : Set P)ᶜ) ∧ IsLowerSet ((G : Set P)ᶜ) := by
  sorry

/-- A linked set consists of pairwise compatible conditions. -/
def IsLinked (A : Set P) : Prop :=
  ∀ p ∈ A, ∀ q ∈ A, Compatible p q

/-- Only nonempty finite subfamilies are required to have a common strengthening.
This makes the empty family centered even when the ambient preorder is empty. -/
def IsCentered (A : Set P) : Prop :=
  ∀ s : Finset P, s.Nonempty → (↑s : Set P) ⊆ A → ∃ p, ∀ q ∈ s, p ≤ q

def IsSigmaCentered (P : Type u) [Preorder P] : Prop :=
  ∃ A : ℕ → Set P, (∀ n, IsCentered (A n)) ∧ ∀ p, ∃ n, p ∈ A n

def IsSigmaLinked (P : Type u) [Preorder P] : Prop :=
  ∃ A : ℕ → Set P, (∀ n, IsLinked (A n)) ∧ ∀ p, ∃ n, p ∈ A n

/-- The aleph-one Knaster property. -/
def IsKnaster (P : Type u) [Preorder P] : Prop :=
  ∀ A : Set P, ¬A.Countable →
    ∃ B : Set P, B ⊆ A ∧ ¬B.Countable ∧ IsLinked B

/-- Countability refers to the ambient universe in this external definition. -/
def IsCCC (P : Type u) [Preorder P] : Prop :=
  ∀ A : Set P, IsAntichain Compatible A → A.Countable

theorem sigmaLinked_isKnaster (h : IsSigmaLinked P) : IsKnaster P := by
  sorry

theorem ccc_denseOrderEmbedding_iff (e : DenseOrderEmbedding P Q) :
    IsCCC P ↔ IsCCC Q := by
  sorry

/-! ## External countable closure and distributivity

Distributivity here means that a countable intersection of dense lower sets is dense.
The closure statement quantifies over external descending sequences.
-/

def IsCountablyClosed (P : Type u) [Preorder P] : Prop :=
  ∀ f : ℕ → P, (∀ n, f (n + 1) ≤ f n) → ∃ q, ∀ n, q ≤ f n

def IsCountablyDistributive (P : Type u) [Preorder P] : Prop :=
  ∀ D : ℕ → Set P, (∀ n, IsCoinitial (D n) ∧ IsLowerSet (D n)) →
    IsCoinitial {p | ∀ n, p ∈ D n}

theorem countablyClosed_isCountablyDistributive (h : IsCountablyClosed P) :
    IsCountablyDistributive P := by
  sorry

theorem countablyDistributive_denseOrderEmbedding_iff (e : DenseOrderEmbedding P Q) :
    IsCountablyDistributive P ↔ IsCountablyDistributive Q := by
  sorry

/-! ## Separativity and the external Boolean completion

The carrier is Mathlib's `Heyting.Regular (LowerSet P)`. Its existing Boolean
algebra order must be retained when completeness is constructed.
-/

/-- The separative preorder: every strengthening of p is compatible with q. -/
def SepLE (p q : P) : Prop :=
  ∀ r ≤ p, Compatible r q

def IsSeparative (P : Type u) [Preorder P] : Prop :=
  ∀ p q : P, SepLE p q → p ≤ q

/-- A principal lower set in the forcing orientation. -/
def principalLower (p : P) : LowerSet P :=
  ⟨Set.Iic p, fun _ _ hxy hy ↦ hxy.trans hy⟩

/-- The canonical map, with no separativity hypothesis. -/
def regularCondition (p : P) : Heyting.Regular (LowerSet P) :=
  Heyting.Regular.toRegular (principalLower p)

/-- Completeness for the existing order; implementing this supplies the compatible
complete Boolean algebra instance, rather than choosing an unrelated order structure. -/
theorem regular_has_lubs {A : Type w} [Order.Frame A]
    (S : Set (Heyting.Regular A)) :
    ∃ b : Heyting.Regular A, IsLUB S b := by
  sorry

theorem regularCondition_ne_bot (p : P) :
    regularCondition p ≠ (⊥ : Heyting.Regular (LowerSet P)) := by
  sorry

theorem regularCondition_le_iff (p q : P) :
    regularCondition p ≤ regularCondition q ↔ SepLE p q := by
  sorry

/-- This records a dense map into the positive cone by requiring every value nonzero.
It does not demand an embedding before passing to the separative quotient. -/
structure CompletionMap (P : Type u) (B : Type v)
    [Preorder P] [BooleanAlgebra B] where
  toFun : P → B
  monotone' : Monotone toFun
  nonzero : ∀ p, toFun p ≠ ⊥
  compatible_iff : ∀ p q, Compatible p q ↔ toFun p ⊓ toFun q ≠ ⊥
  dense : ∀ b : B, b ≠ ⊥ → ∃ p, toFun p ≤ b

namespace CompletionMap

variable {B : Type v} [BooleanAlgebra B] (e : CompletionMap P B)

/-- The actual positive-cone map. Zero is not an allowed forcing condition. -/
def positiveMap (p : P) : {b : B // b ≠ ⊥} :=
  ⟨e.toFun p, e.nonzero p⟩

theorem le_iff_sepLE (p q : P) : e.toFun p ≤ e.toFun q ↔ SepLE p q := by
  sorry

/-- Antisymmetry is needed here in addition to separativity. -/
theorem injective_of_separative {R : Type w} [PartialOrder R]
    (e : CompletionMap R B) (hsep : IsSeparative R) : Function.Injective e.toFun := by
  sorry

end CompletionMap

/-- The completion map is required to be the displayed regularization of principal lower sets.
Its carrier has the completeness property `regular_has_lubs`.
Nonemptiness of P and nonzero map values rule out the trivial Boolean algebra. -/
theorem exists_regular_completionMap [Nonempty P] :
    ∃ e : CompletionMap P (Heyting.Regular (LowerSet P)),
      ∀ p, e.toFun p = regularCondition p := by
  sorry

/-! The README specifies the full material forcing theorem, ZFC preservation, Boolean
name semantics, comparison, worked forcing notions, and two-step factorization.
No unnamed `Prop` fields stand in for those mathematical obligations here. -/

end TauCetiRoadmap.Forcing

