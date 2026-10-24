import Mathlib

/-!
# Direct and inverse categories, and non-singular presheaves: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. The statements here suggest Lean forms for particular milestones, so that
contributors and reviewers converge on names and signatures; discharging all of them
finishes neither a layer nor the roadmap. `sorry` is allowed in this human-owned roadmap
library — these are goals, not proofs.

Mathlib supplies `HomotopicalAlgebra.ReedyStructure W₁ W₂ α` (degree `deg`, the axioms
`lt₁`, `lt₂`, `nonempty_unique`, the opposite structure `ReedyStructure.op`, the degree of a
morphism `ReedyStructure.degHom` and its lemmas, `ReedyStructure.skeletal`),
`SemiSimplexCategory`, `SSet.Nonsingular`, `SSet.N`, `WideSubcategory`, `Functor.Elements`,
`Subfunctor` and `WellFounded.rank`.

Latching and matching objects and the Reedy model structure are out of scope (see the
README's scope boundary); every structure here is a Mathlib `ReedyStructure`.
-/
universe w v u

open CategoryTheory Opposite

/-! ## Layer 1: direct and inverse categories -/

namespace CategoryTheory

/-- The relation on objects "there is a non-identity morphism `X ⟶ Y`". -/
def DirectRel (C : Type u) [Category.{v} C] (X Y : C) : Prop :=
  ∃ f : X ⟶ Y, ¬ MorphismProperty.identities C f

/-- A category is *direct* if there is no infinite descending chain of non-identity
morphisms `⋯ ⟶ X₂ ⟶ X₁ ⟶ X₀`, i.e. `DirectRel C` is well-founded. -/
class IsDirect (C : Type u) [Category.{v} C] : Prop where
  wellFounded : WellFounded (DirectRel C)

/-- A category is *inverse* if its opposite is direct. -/
class IsInverse (C : Type u) [Category.{v} C] : Prop where
  isDirect_op : IsDirect Cᵒᵖ

theorem isInverse_iff (C : Type u) [Category.{v} C] : IsInverse C ↔ IsDirect Cᵒᵖ :=
  ⟨fun h => h.isDirect_op, fun h => ⟨h⟩⟩

namespace IsDirect

variable {C : Type u} [Category.{v} C] [IsDirect C]

/-- The canonical degree of an object of a direct category: its rank for `DirectRel C`. -/
noncomputable def rank (X : C) : Ordinal.{u} :=
  haveI : WellFounded (DirectRel C) := IsDirect.wellFounded
  WellFounded.rank (DirectRel C) X

theorem rank_lt {X Y : C} (f : X ⟶ Y) (hf : ¬ MorphismProperty.identities C f) :
    rank X < rank Y :=
  haveI : WellFounded (DirectRel C) := IsDirect.wellFounded
  WellFounded.rank_lt_of_rel ⟨f, hf⟩

theorem eq_id_of_endo {X : C} (f : X ⟶ X) : f = 𝟙 X := by
  sorry

theorem skeletal : Skeletal C := by
  sorry

/-- The only factorization of `f` as an identity followed by an arbitrary morphism. -/
instance {X Y : C} (f : X ⟶ Y) :
    Unique ((MorphismProperty.identities C).MapFactorizationData ⊤ f) where
  default := ⟨X, 𝟙 X, f, by simp, .mk _, trivial⟩
  uniq := by
    rintro ⟨Z, i, p, fac, hi, hp⟩
    cases hi
    simp only [Category.id_comp] at fac
    subst fac
    rfl

/-- The canonical Reedy structure of a direct category: `W₁` the identities, `W₂` all
morphisms, degree `rank`. -/
noncomputable def reedyStructure :
    HomotopicalAlgebra.ReedyStructure (MorphismProperty.identities C) ⊤ Ordinal.{u} where
  deg := rank
  lt₁ _ hf hf' := absurd hf hf'
  lt₂ f _ hf' := rank_lt f hf'
  nonempty_unique _ := ⟨inferInstance⟩

end IsDirect

variable (C : Type u) [Category.{v} C]

/-- Direct categories are exactly those carrying a Reedy structure whose `W₁` is the
identities and whose `W₂` is everything, for some well-ordered degree type. -/
theorem isDirect_iff_nonempty_reedyStructure :
    IsDirect C ↔
      Nonempty (HomotopicalAlgebra.ReedyStructure (MorphismProperty.identities C) ⊤
        Ordinal.{u}) := by
  sorry

theorem IsDirect.of_reedyStructure {α : Type w} [LinearOrder α] [OrderBot α] [SuccOrder α]
    [WellFoundedLT α]
    (r : HomotopicalAlgebra.ReedyStructure (MorphismProperty.identities C) ⊤ α) :
    IsDirect C := by
  sorry

/-- A direct category has an `ℕ`-valued degree exactly when every rank is finite. -/
theorem nonempty_reedyStructure_nat_iff :
    Nonempty (HomotopicalAlgebra.ReedyStructure (MorphismProperty.identities C) ⊤ ℕ) ↔
      ∃ _ : IsDirect C, ∀ X : C, IsDirect.rank X < Ordinal.omega0 := by
  sorry

/-- A thin skeletal category all of whose morphisms are monomorphisms need not be direct:
the integers. -/
example : ¬ IsDirect ℤ := by
  sorry

end CategoryTheory

namespace HomotopicalAlgebra.ReedyStructure

variable {C : Type u} [Category.{v} C] {W₁ W₂ : MorphismProperty C}
  [W₁.IsMultiplicative] [W₂.IsMultiplicative]
  {α : Type w} [LinearOrder α] [OrderBot α] [SuccOrder α] [WellFoundedLT α]

/-- The degree-raising part of a Reedy structure is direct, with the same degree. -/
def directPart (r : ReedyStructure W₁ W₂ α) :
    ReedyStructure (MorphismProperty.identities (WideSubcategory W₂)) ⊤ α := by
  sorry

/-- The degree-lowering part of a Reedy structure is inverse, with the same degree. -/
def inversePart (r : ReedyStructure W₁ W₂ α) :
    ReedyStructure ⊤ (MorphismProperty.identities (WideSubcategory W₁)) α := by
  sorry

end HomotopicalAlgebra.ReedyStructure

/-! ## Layer 2: examples -/

namespace CategoryTheory

theorem isDirect_iff_wellFoundedLT (P : Type u) [PartialOrder P] :
    IsDirect P ↔ WellFoundedLT P := by
  sorry

/-- A partial order with finite lower sets is direct with `ℕ`-valued degree
`x ↦ #{y | y < x}`. -/
def reedyStructureOfLocallyFiniteOrderBot (P : Type u) [PartialOrder P]
    [LocallyFiniteOrderBot P] :
    HomotopicalAlgebra.ReedyStructure (MorphismProperty.identities P) ⊤ ℕ where
  deg x := (Finset.Iio x).card
  lt₁ _ hf hf' := absurd hf hf'
  lt₂ f _ hf' := by sorry
  nonempty_unique _ := ⟨inferInstance⟩

end CategoryTheory

namespace SemiSimplexCategory

/-- The semi-simplex category is direct, with degree `len`. README 2.4 obtains this structure
from the Reedy structure of the simplex category by restriction to monomorphisms
(`ReedyStructure.directPart`), transported along the isomorphism of categories between
`SemiSimplexCategory` and the wide subcategory of monomorphisms of `SimplexCategory`. -/
def reedyStructure :
    HomotopicalAlgebra.ReedyStructure (MorphismProperty.identities SemiSimplexCategory) ⊤ ℕ := by
  sorry

instance : IsDirect SemiSimplexCategory := by
  sorry

end SemiSimplexCategory

/-- Semi-simplicial objects of a category. -/
abbrev SemiSimplicialObject (D : Type u) [Category.{v} D] :=
  SemiSimplexCategoryᵒᵖ ⥤ D

/-! ## Layer 3: non-singular presheaves on direct categories -/

namespace CategoryTheory

variable {C : Type u} [Category.{v} C]

/-- A presheaf is non-singular if every element `x ∈ X(c)` has injective "faces" map
`(c' ⟶ c) → X(c')`, `u ↦ X(u)(x)`; equivalently each `yoneda.obj c ⟶ X` classifying an
element is a monomorphism. -/
def Presheaf.IsNonsingular (X : Cᵒᵖ ⥤ Type w) : Prop :=
  ∀ ⦃c c' : C⦄ (x : X.obj (op c)) (u v : c' ⟶ c), X.map u.op x = X.map v.op x → u = v

theorem Presheaf.isNonsingular_iff_isThin (X : Cᵒᵖ ⥤ Type w) :
    Presheaf.IsNonsingular X ↔ Quiver.IsThin X.Elements := by
  sorry

theorem Presheaf.isNonsingular_iff_mono {C : Type u} [SmallCategory C] (X : Cᵒᵖ ⥤ Type u) :
    Presheaf.IsNonsingular X ↔
      ∀ (c : C) (x : X.obj (op c)), Mono (yonedaEquiv.symm x) := by
  sorry

/-- A presheaf with a morphism to a non-singular presheaf is non-singular; in particular every
subpresheaf of a non-singular presheaf is non-singular. -/
theorem Presheaf.IsNonsingular.of_hom {X Y : Cᵒᵖ ⥤ Type w} (f : X ⟶ Y)
    (hY : Presheaf.IsNonsingular Y) : Presheaf.IsNonsingular X := by
  sorry

/-- A functor `p : E ⥤ C` is a discrete fibration if every morphism into `p.obj e` lifts
uniquely to a morphism into `e`. -/
def Functor.IsDiscreteFibration {E : Type*} [Category* E] (p : E ⥤ C) : Prop :=
  ∀ e : E, Function.Bijective
    (fun φ : (e' : E) × (e' ⟶ e) => (⟨p.obj φ.1, p.map φ.2⟩ : (c : C) × (c ⟶ p.obj e)))

/-- Discrete fibrations over `C`, as a full subcategory of the slice of `Cat` over `C`. -/
def DiscreteFibration (C : Type u) [Category.{v} C] :=
  ObjectProperty.FullSubcategory
    (fun p : Over (Cat.of C) => Functor.IsDiscreteFibration p.hom.toFunctor)

end CategoryTheory
