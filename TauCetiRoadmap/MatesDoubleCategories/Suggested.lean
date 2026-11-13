/-
Copyright (c) 2026 The Tau Ceti contributors. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
module

public import Mathlib.CategoryTheory.Bicategory.Adjunction.Adj
public import Mathlib.CategoryTheory.Bicategory.Strict.Basic
public import Mathlib.CategoryTheory.PathCategory.Basic

/-!
# Mates double categories: suggested interfaces

The roadmap is README.md; this file is not the roadmap. These are suggested
forms, not an exhaustive checklist. The markdown specifies all required results.

This prototype makes the strict cell axioms, arbitrary path boundaries, and
binary/nullary representations explicit. It also fixes the orientation of mates
against Mathlib's API. It does not implement the roadmap.

Functor and isomorphism structures, induced bicategories, their strictness, and
the general and strict double isomorphisms require the M1--M3 constructions.
Their headline signatures are deliberately not replaced by arbitrary `Prop`
fields or opaque carrier types. The full contracts are in README.md.

The two edge categories are explicit parameters, avoiding competing instances
on the common object type. `HEq` in the strict axioms records equality after
transport of the four boundaries; the implementation must supply a usable
transport API. It is not an isomorphism or a weak associativity axiom.
-/

@[expose] public section

universe u h v s w

namespace TauCetiRoadmap.MatesDoubleCategories

open CategoryTheory

/-- Morphisms in one explicitly supplied edge category. -/
abbrev Edge {O : Type u} (C : Category.{h} O) (a b : O) :=
  @Quiver.Hom O C.toCategoryStruct.toQuiver a b

/-- Identity in one edge direction. -/
abbrev edgeId {O : Type u} (C : Category.{h} O) (a : O) : Edge C a a :=
  @CategoryStruct.id O C.toCategoryStruct a

/-- Composition in one edge direction, in diagrammatic order. -/
abbrev edgeComp {O : Type u} (C : Category.{h} O) {a b c : O}
    (f : Edge C a b) (g : Edge C b c) : Edge C a c :=
  @CategoryStruct.comp O C.toCategoryStruct a b c f g

/-- A boundary-indexed strict double category with common object type `O`.
The arguments of `Cell` are top, bottom, left, right, in that order. -/
structure StrictDoubleCategory (O : Type u) (H : Category.{h} O)
    (V : Category.{v} O) where
  Cell : {a b c d : O} → Edge H a b → Edge H c d → Edge V a c → Edge V b d → Type s
  hId : {a b : O} → (f : Edge V a b) → Cell (edgeId H a) (edgeId H b) f f
  vId : {a b : O} → (f : Edge H a b) → Cell f f (edgeId V a) (edgeId V b)
  hComp : {a b c d e f : O} →
    {p : Edge H a b} → {q : Edge H b c} → {r : Edge H d e} → {t : Edge H e f} →
    {l : Edge V a d} → {m : Edge V b e} → {n : Edge V c f} →
    Cell p r l m → Cell q t m n → Cell (edgeComp H p q) (edgeComp H r t) l n
  vComp : {a b c d e f : O} →
    {p : Edge H a b} → {q : Edge H c d} → {r : Edge H e f} →
    {l : Edge V a c} → {m : Edge V b d} → {n : Edge V c e} → {t : Edge V d f} →
    Cell p q l m → Cell q r n t → Cell p r (edgeComp V l n) (edgeComp V m t)
  h_id_comp : ∀ {a b c d : O} {p : Edge H a b} {q : Edge H c d}
    {l : Edge V a c} {r : Edge V b d} (α : Cell p q l r), HEq (hComp (hId l) α) α
  h_comp_id : ∀ {a b c d : O} {p : Edge H a b} {q : Edge H c d}
    {l : Edge V a c} {r : Edge V b d} (α : Cell p q l r), HEq (hComp α (hId r)) α
  v_id_comp : ∀ {a b c d : O} {p : Edge H a b} {q : Edge H c d}
    {l : Edge V a c} {r : Edge V b d} (α : Cell p q l r), HEq (vComp (vId p) α) α
  v_comp_id : ∀ {a b c d : O} {p : Edge H a b} {q : Edge H c d}
    {l : Edge V a c} {r : Edge V b d} (α : Cell p q l r), HEq (vComp α (vId q)) α
  h_assoc : ∀ {a b c d e f g k : O}
    {p : Edge H a b} {q : Edge H b c} {r : Edge H c d}
    {p' : Edge H e f} {q' : Edge H f g} {r' : Edge H g k}
    {l : Edge V a e} {m : Edge V b f} {n : Edge V c g} {t : Edge V d k}
    (α : Cell p p' l m) (β : Cell q q' m n) (γ : Cell r r' n t),
    HEq (hComp (hComp α β) γ) (hComp α (hComp β γ))
  v_assoc : ∀ {a b c d e f g k : O}
    {p : Edge H a b} {q : Edge H c d} {r : Edge H e f} {t : Edge H g k}
    {l : Edge V a c} {m : Edge V c e} {n : Edge V e g}
    {l' : Edge V b d} {m' : Edge V d f} {n' : Edge V f k}
    (α : Cell p q l l') (β : Cell q r m m') (γ : Cell r t n n'),
    HEq (vComp (vComp α β) γ) (vComp α (vComp β γ))
  interchange : ∀ {a b c d e f g k i : O}
    {p : Edge H a b} {q : Edge H b c} {r : Edge H d e}
    {t : Edge H e f} {x : Edge H g k} {y : Edge H k i}
    {l : Edge V a d} {m : Edge V b e} {n : Edge V c f}
    {l' : Edge V d g} {m' : Edge V e k} {n' : Edge V f i}
    (α : Cell p r l m) (β : Cell q t m n) (γ : Cell r x l' m') (δ : Cell t y m' n'),
    vComp (hComp α β) (hComp γ δ) = hComp (vComp α γ) (vComp β δ)
  hId_vComp : ∀ {a b c : O} (f : Edge V a b) (g : Edge V b c),
    hId (edgeComp V f g) = vComp (hId f) (hId g)
  vId_hComp : ∀ {a b c : O} (f : Edge H a b) (g : Edge H b c),
    vId (edgeComp H f g) = hComp (vId f) (vId g)
  id_id : ∀ a : O, hId (edgeId V a) = vId (edgeId H a)

/-- The category of paths for an explicitly supplied quiver.
`Paths O` is definitionally `O`; neither quiver is installed globally. -/
abbrev pathCategory (O : Type u) (Q : Quiver.{h} O) : Category.{max u h} O :=
  @Paths.categoryPaths O Q

/-- A singleton path in one of the two generating quivers. -/
abbrev singleton {O : Type u} (Q : Quiver.{h} O) {a b : O}
    (f : @Quiver.Hom O Q a b) : Edge (pathCategory O Q) a b :=
  @Quiver.Hom.toPath O Q a b f

/-- The implicit presentation uses actual free path categories in both directions. -/
abbrev ImplicitDoubleCategory (O : Type u) (H : Quiver.{h} O) (V : Quiver.{v} O) :=
  StrictDoubleCategory.{u, max u h, max u v, s} O (pathCategory O H) (pathCategory O V)

namespace ImplicitDoubleCategory

variable {O : Type u} {H : Quiver.{h} O} {V : Quiver.{v} O}
  (D : ImplicitDoubleCategory.{u, h, v, s} O H V)

/-- A horizontal path representation is an invertible horizontal globular cell.
Its vertical boundaries are empty paths; composition of its two cells is vertical. -/
structure HorizontalIso {a b : O} (p q : Edge (pathCategory O H) a b) where
  hom : D.Cell p q (edgeId (pathCategory O V) a) (edgeId (pathCategory O V) b)
  inv : D.Cell q p (edgeId (pathCategory O V) a) (edgeId (pathCategory O V) b)
  hom_inv_id : HEq (D.vComp hom inv) (D.vId p)
  inv_hom_id : HEq (D.vComp inv hom) (D.vId q)

/-- A vertical path representation, using horizontal composition of globular cells. -/
structure VerticalIso {a b : O} (p q : Edge (pathCategory O V) a b) where
  hom : D.Cell (edgeId (pathCategory O H) a) (edgeId (pathCategory O H) b) p q
  inv : D.Cell (edgeId (pathCategory O H) a) (edgeId (pathCategory O H) b) q p
  hom_inv_id : HEq (D.hComp hom inv) (D.hId p)
  inv_hom_id : HEq (D.hComp inv hom) (D.hId q)

/-- Existence of a representing generator for every path in each direction. -/
def Representable : Prop :=
  (∀ {a b : O} (p : Edge (pathCategory O H) a b),
    ∃ f : @Quiver.Hom O H a b, Nonempty (D.HorizontalIso p (singleton H f))) ∧
  (∀ {a b : O} (p : Edge (pathCategory O V) a b),
    ∃ f : @Quiver.Hom O V a b, Nonempty (D.VerticalIso p (singleton V f)))

/-- Chosen binary and nullary representations. No axioms identify an empty
path with the singleton path containing a chosen identity generator. -/
structure Representation where
  hUnit : (a : O) → @Quiver.Hom O H a a
  vUnit : (a : O) → @Quiver.Hom O V a a
  hMul : {a b c : O} → @Quiver.Hom O H a b → @Quiver.Hom O H b c → @Quiver.Hom O H a c
  vMul : {a b c : O} → @Quiver.Hom O V a b → @Quiver.Hom O V b c → @Quiver.Hom O V a c
  hUnitIso : (a : O) → D.HorizontalIso (edgeId (pathCategory O H) a) (singleton H (hUnit a))
  vUnitIso : (a : O) → D.VerticalIso (edgeId (pathCategory O V) a) (singleton V (vUnit a))
  hMulIso : {a b c : O} → (f : @Quiver.Hom O H a b) → (g : @Quiver.Hom O H b c) →
    D.HorizontalIso (edgeComp (pathCategory O H) (singleton H f) (singleton H g))
      (singleton H (hMul f g))
  vMulIso : {a b c : O} → (f : @Quiver.Hom O V a b) → (g : @Quiver.Hom O V b c) →
    D.VerticalIso (edgeComp (pathCategory O V) (singleton V f) (singleton V g))
      (singleton V (vMul f g))

/-- M1 target: binary/nullary choices supply representations of all paths. -/
theorem representable_of_representation (R : D.Representation) : D.Representable := by
  sorry

end ImplicitDoubleCategory

section Mates

variable {K : Type u} [Bicategory.{w, v} K]

/-- The vertical generating arrows retain the entire adjunction. -/
abbrev AdjEdge (a b : K) := Bicategory.Adj.Hom a b

/-- A left-adjoint square with top `S`, bottom `T`, and vertical sides `F₁`, `F₂`. -/
abbrev LeftSquare {a b c d : K} (S : a ⟶ b) (T : c ⟶ d)
    (F₁ : AdjEdge a c) (F₂ : AdjEdge b d) := S ≫ F₂.l ⟶ F₁.l ≫ T

/-- The corresponding right-adjoint square, with the same external boundary. -/
abbrev RightSquare {a b c d : K} (S : a ⟶ b) (T : c ⟶ d)
    (F₁ : AdjEdge a c) (F₂ : AdjEdge b d) := F₁.r ≫ S ⟶ T ≫ F₂.r

/-- Existing local equivalence that M3 must promote to a represented double isomorphism. -/
def squareMateEquiv {a b c d : K} (S : a ⟶ b) (T : c ⟶ d)
    (F₁ : AdjEdge a c) (F₂ : AdjEdge b d) :
    LeftSquare S T F₁ F₂ ≃ RightSquare S T F₁ F₂ :=
  Bicategory.mateEquiv F₁.adj F₂.adj

/-- The local inverse law already follows from Mathlib, without strictness. -/
example {a b c d : K} (S : a ⟶ b) (T : c ⟶ d)
    (F₁ : AdjEdge a c) (F₂ : AdjEdge b d) (α : LeftSquare S T F₁ F₂) :
    (squareMateEquiv S T F₁ F₂).symm (squareMateEquiv S T F₁ F₂ α) = α :=
  Equiv.symm_apply_apply _ _

/-- The other local inverse law. Neither example asserts the global theorem. -/
example {a b c d : K} (S : a ⟶ b) (T : c ⟶ d)
    (F₁ : AdjEdge a c) (F₂ : AdjEdge b d) (β : RightSquare S T F₁ F₂) :
    squareMateEquiv S T F₁ F₂ ((squareMateEquiv S T F₁ F₂).symm β) = β :=
  Equiv.apply_symm_apply _ _

end Mates

end TauCetiRoadmap.MatesDoubleCategories
