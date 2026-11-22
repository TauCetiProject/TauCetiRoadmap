module

public import Mathlib.Data.Finset.Basic
public import Mathlib.Data.Set.Countable
public import Mathlib.Order.Antichain
public import Mathlib.Order.Bounds.Defs
public import Mathlib.Order.CompleteBooleanAlgebra
public import Mathlib.Order.Heyting.Regular
public import Mathlib.Order.PFilter
public import Mathlib.Order.UpperLower.CompleteLattice
public import Mathlib.ModelTheory.Syntax
public import Mathlib.SetTheory.ZFC.Basic

/-!
# Forcing, generic extensions, and Boolean-valued semantics: target signatures

`README.md` is the definitive specification. This file states suggested signatures for some of
its definitions and targets; it is not an exhaustive checklist, and discharging every declaration
here finishes neither a layer nor the roadmap. The `sorry`s are proposed targets, not established
proofs. Every definition below has an actual body.

The order and genericity prototypes draw on Cameron Freer's Apache-2.0 library
`cameronfreer/forcing`. It is not a dependency.
-/

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

/-- Predensity: every condition is compatible with some member. -/
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

/-- Sanity check that `pullTest` is the right pullback, not a headline target: it holds by
unfolding the definitions, for any filter with the stated carrier and any tests. -/
theorem genericFor_map_iff (𝒟 : Set (Set Q))
    (G : Order.PFilter P) (H : Order.PFilter Q) (hH : (H : Set Q) = e.mapSet G) :
    GenericFor 𝒟 H ↔ GenericFor (e.pullTest '' 𝒟) G := by
  sorry

/-- **Transport of dense tests** (README Layer 0 item 4): the pullback of a dense test along a dense
embedding is dense. This uses the density of the range. -/
theorem pullTest_isCoinitial {D : Set Q} (hD : IsCoinitial D) : IsCoinitial (e.pullTest D) := by
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

/-- The canonical map, with no separativity hypothesis. -/
def regularCondition (p : P) : Heyting.Regular (LowerSet P) :=
  Heyting.Regular.toRegular (LowerSet.Iic p)

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
It does not demand an embedding before passing to the separative quotient, and it does not require
`B` to be complete: the README's comparison theorem uses a completion map into a complete Boolean
algebra, while the decoded ground-internal completion satisfies these fields without being
externally complete. -/
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
Its carrier has the completeness property `regular_has_lubs`. -/
theorem exists_regular_completionMap :
    ∃ e : CompletionMap P (Heyting.Regular (LowerSet P)),
      ∀ p, e.toFun p = regularCondition p := by
  sorry

/-! ## Names and valuation

Poset names carry a condition on each child; Boolean names carry a Boolean weight. Child indices
live in the universe `w`, separate from the universes of the conditions and of the coefficients.
Valuation at a set of conditions (respectively of Boolean values) keeps exactly the children whose
label lies in that set. -/

/-- Well-founded names over a forcing preorder: a child index type, the children, and the
condition attached to each child. -/
inductive PName (P : Type u) : Type (max u (w + 1))
  | mk (ι : Type w) (child : ι → PName P) (cond : ι → P)

/-- Well-founded Boolean-weighted names: a child index type, the children, and the Boolean
weight of each child. -/
inductive BName (B : Type v) : Type (max v (w + 1))
  | mk (ι : Type w) (child : ι → BName B) (wt : ι → B)

/-- Valuation of a poset name at a set of conditions `G` (in practice a filter): the pre-set of
the valuations of the children whose condition lies in `G`. -/
def PName.val (G : Set P) : PName.{u, w} P → PSet.{w}
  | .mk ι child cond => ⟨{i : ι // cond i ∈ G}, fun i ↦ PName.val G (child i.1)⟩

/-- Valuation of a Boolean name at a set of Boolean values `U` (in practice a filter). -/
def BName.val {B : Type v} (U : Set B) : BName.{v, w} B → PSet.{w}
  | .mk ι child wt => ⟨{i : ι // wt i ∈ U}, fun i ↦ BName.val U (child i.1)⟩

/-- Relabel a poset name along a map of conditions into a Boolean algebra, in practice a
completion map. -/
def PName.relabel {B : Type v} (f : P → B) : PName.{u, w} P → BName.{v, w} B
  | .mk ι child cond => .mk ι (fun i ↦ PName.relabel f (child i)) (fun i ↦ f (cond i))

omit [Preorder P] in
/-- **Layer 6, valuation along the completion map.** A poset name and its relabelling along
`f` have the same value when the conditions are evaluated at the preimage of the Boolean values:
a child labelled `p` is kept on the left exactly when the child labelled `f p` is kept on the
right. For a completion map `e` and the Boolean filter `U_G` generated by a filter `G` of
conditions, the preimage `e ⁻¹' U_G` is `G` when the preorder is separative, or when `G` meets every
dense set `{r | r ≤ q} ∪ {r | ¬ Compatible r q}` (every ground-generic filter does); then this
specializes to `(τ.relabel e.toFun).val U_G = τ.val G`. In general the preimage of a Boolean filter
need not be a filter (README §6.2 and the Checks of Layer 6). The theorem fixes the name types, the
universes, the translation and the two valuations in which the README's formula comparison
(§6.2, over matching name domains) is stated. -/
theorem PName.val_relabel {B : Type v} (f : P → B) (U : Set B) (τ : PName.{u, w} P) :
    (τ.relabel f).val U = τ.val (f ⁻¹' U) := by
  induction τ with
  | mk ι child cond ih =>
    simp only [PName.relabel, BName.val, PName.val]
    congr 1
    funext i
    exact ih i.1

/-! ## The Boolean-valued universe for the language of set theory

The README's Layer 3 is the Boolean-valued universe of set theory: Boolean equality and membership
of Boolean names, and Boolean values of formulas of the language of set theory, with the
quantifiers ranging over a stated domain of names. -/

/-- The relation symbols of set theory: one binary symbol, membership. -/
inductive SetRel : ℕ → Type
  | mem : SetRel 2

/-- The language of set theory: no function symbols and one binary relation symbol. -/
def setLang : FirstOrder.Language.{0, 0} where
  Functions := fun _ ↦ Empty
  Relations := SetRel

/-- A term of the language of set theory is a variable. -/
def setLang.termVar {α : Type*} : setLang.Term α → α
  | .var a => a
  | .func f _ => (f : Empty).elim

namespace BName

variable {B : Type v} [CompleteBooleanAlgebra B]

/-- Boolean equality, by mutual inclusion:
`⟦x = y⟧ = (⨅ i, wₓ i ⇨ ⨆ j, w_y j ⊓ ⟦xᵢ = y_j⟧) ⊓ (⨅ j, w_y j ⇨ ⨆ i, wₓ i ⊓ ⟦xᵢ = y_j⟧)`. -/
def eqVal : BName.{v, w} B → BName.{v, w} B → B
  | mk _ cx wx, mk _ cy wy =>
      (⨅ i, wx i ⇨ ⨆ j, wy j ⊓ eqVal (cx i) (cy j)) ⊓
        (⨅ j, wy j ⇨ ⨆ i, wx i ⊓ eqVal (cx i) (cy j))

/-- Boolean membership: `⟦x ∈ y⟧ = ⨆ j, w_y j ⊓ ⟦x = y_j⟧`. -/
def memVal (x : BName.{v, w} B) : BName.{v, w} B → B
  | mk _ cy wy => ⨆ j, wy j ⊓ eqVal x (cy j)

/-- The Boolean value of a formula of set theory, with the quantifiers ranging over the stated
domain `D` of names: the README's comparison takes `D` to be the relabelled ground names, not all
Boolean names. -/
def truth (D : Set (BName.{v, w} B)) :
    ∀ {α : Type*} {n : ℕ}, setLang.BoundedFormula α n → (α → D) → (Fin n → D) → B
  | _, _, .falsum, _, _ => ⊥
  | _, _, .equal t₁ t₂, v, xs =>
      eqVal (Sum.elim v xs (setLang.termVar t₁)).1 (Sum.elim v xs (setLang.termVar t₂)).1
  | _, _, .rel R ts, v, xs =>
      match (R : SetRel _), ts with
      | .mem, ts => memVal (Sum.elim v xs (setLang.termVar (ts 0))).1
          (Sum.elim v xs (setLang.termVar (ts 1))).1
  | _, _, .imp φ ψ, v, xs => truth D φ v xs ⇨ truth D ψ v xs
  | _, _, .all φ, v, xs => ⨅ d : D, truth D φ v (Fin.snoc xs d)

/-- Boolean equality is reflexive. -/
theorem eqVal_self (x : BName.{v, w} B) : eqVal x x = ⊤ := by
  sorry

/-- Boolean equality is transitive. -/
theorem eqVal_trans (x y z : BName.{v, w} B) : eqVal x y ⊓ eqVal y z ≤ eqVal x z := by
  sorry

end BName

/-! The README specifies the material forcing theorem, ZFC preservation, the formula comparison
over matching name domains, the worked forcing notions and two-step factorization. No unnamed
`Prop` field stands in for those obligations here. -/

end TauCetiRoadmap.Forcing

