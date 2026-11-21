module

public import Mathlib
public import TauCeti.LinearAlgebra.TensorProduct.Balanced.Basic
public import TauCeti.LinearAlgebra.TensorProduct.Balanced.Associator
public import TauCeti.Algebra.Category.ModuleCat.Flat.FilteredFree
public import TauCeti.Algebra.Category.ModuleCat.Projective.TensorHom
public import TauCeti.Algebra.Category.ModuleCat.CartanMap.Morita
public import TauCeti.RingTheory.Morita.Corner
public import TauCeti.Algebra.Module.AuslanderReiten.TensorCokernel
public import TauCeti.Algebra.Module.AuslanderReiten.Equivalence
public import TauCeti.RingTheory.GlobalDimension
public import TauCeti.RingTheory.Jacobson.Semiperfect
public import TauCeti.RingTheory.SimpleModule.Socle
public import TauCeti.Algebra.Module.ProjectiveCover.Basic
public import TauCeti.Algebra.Module.Projective.FinitePresentation
public import TauCeti.Algebra.Module.MinimalProjectivePresentation.Basic
public import TauCeti.Algebra.Category.ModuleCat.CartanMap.Basic
public import TauCeti.CategoryTheory.Preadditive.MorphismIdeal.Mul
public import TauCeti.CategoryTheory.Preadditive.MorphismIdeal.Opposite
public import TauCeti.CategoryTheory.Preadditive.MorphismIdeal.FactorThrough
public import TauCeti.CategoryTheory.Preadditive.Radical.Nilpotent
public import TauCeti.CategoryTheory.Projective.Cover
public import TauCeti.RingTheory.Jacobson.MulOpposite

/-!
# Modules over preadditive categories, flatness, and perfect rings: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is `README.md`,
which carries the full API, proof routes, refactor boundaries, and checks. This file records Lean
signatures for core definitions, structures, classes, and headline theorems across Layers 0–4
against the pinned Mathlib and Tau Ceti; discharging all `sorry`s here finishes neither a layer nor
the roadmap. Existing Tau Ceti declarations carry their `TauCeti.` prefix.

Every carrier, that is, every object the headline theorems are about, has a real body: the tensor
product of categories, the regular bimodule, `I · M`, the coend tensor product and `Tor`, bimodule
`⊗`, `Hom` and `Tor`, the dual `F^E`, `proj C`'s duality, the balanced tensor and `Hom` functors,
the category algebra, and the module-category bridges. Their proof fields may still be `sorry`.
Formula-given comparisons have real maps (the tensor product of one-object categories, ideals versus
submodules of the regular bimodule, the one-object category algebra); comparisons whose existence is
the content are stated as `Nonempty`/`∃` theorems, with dependent statements bundled so that one
choice serves all of them. One-line lemmas such as the `ext` lemmas, `tmul_comp_tmul`, the
`comp_mem` lemmas and `small_mulOpposite` are auxiliary API used by this file, not targets.

For preadditive `C : Type u` with `Category.{v} C`, `ModCat C := Cᵒᵖ ⥤+ AddCommGrpCat.{w}` (with
covariant functors in `ModCat Cᵒᵖ` and `Hom(X, -) = (ModCat.yoneda Cᵒᵖ).obj (op X)`). A ring `A`
enters as `SingleObj Aᵐᵒᵖ` (left `A`-modules) alongside native ring classes and functors.
-/

@[expose] public section

open CategoryTheory CategoryTheory.Limits

universe w v u t

namespace TauCetiRoadmap.NoncommutativeFlatness

open CategoryTheory CategoryTheory.Limits MulOpposite Opposite
open scoped CharacterModule DirectSum TensorProduct

/-- An additive map that commutes with the `R`-actions, regarded as `R`-linear. -/
def addToLin {R M N : Type*} [Semiring R] [AddCommMonoid M] [AddCommMonoid N] [Module R M]
    [Module R N] (f : M →+ N) (h : ∀ (r : R) (x : M), f (r • x) = r • f x) : M →ₗ[R] N :=
  { f with map_smul' := h }

/-- An additive map between `w`-small groups, transported to their `Shrink`s. -/
noncomputable def shrinkMap {α β : Type*} [AddCommGroup α] [AddCommGroup β] [Small.{w} α]
    [Small.{w} β] (f : α →+ β) : Shrink.{w} α →+ Shrink.{w} β where
  toFun x := equivShrink β (f ((equivShrink α).symm x))
  map_zero' := sorry
  map_add' := sorry

/-! ## Layer 0: modules over a preadditive category and their tensor product -/

/-! ### 0.1 `Mod C` -/

section FinitelyPresentedFunctor

variable {C : Type u} [Category.{v} C] [Preadditive C]

/-- **0.1** `F` is finitely generated if it is a quotient of a finite sum of representables. -/
def IsFinitelyGeneratedFunctor (F : Cᵒᵖ ⥤ AddCommGrpCat.{v}) : Prop :=
  ∃ (n : ℕ) (Y : Fin n → C) (p : (∐ fun i ↦ preadditiveYoneda.obj (Y i)) ⟶ F), Epi p

/-- **0.1** `F` is finitely presented if it is a cokernel of a map between finite sums of
representables. -/
def IsFinitelyPresentedFunctor (F : Cᵒᵖ ⥤ AddCommGrpCat.{v}) : Prop :=
  ∃ (m n : ℕ) (X : Fin m → C) (Y : Fin n → C)
    (f : (∐ fun j ↦ preadditiveYoneda.obj (X j)) ⟶ ∐ fun i ↦ preadditiveYoneda.obj (Y i))
    (p : (∐ fun i ↦ preadditiveYoneda.obj (Y i)) ⟶ F) (h : f ≫ p = 0),
    Epi p ∧ (ShortComplex.mk _ _ h).Exact

variable (C) in
/-- **0.1** `mod C`, the object property of finitely presented functors. -/
abbrev isFinitelyPresentedFunctor : ObjectProperty (Cᵒᵖ ⥤ AddCommGrpCat.{v}) :=
  IsFinitelyPresentedFunctor

/-- **0.1** Under finite biproducts, finite presentation by finite sums agrees with ArtinAlgebras
§1.1's single-representable form. -/
theorem isFinitelyPresentedFunctor_iff_exists_single [HasFiniteBiproducts C]
    (F : Cᵒᵖ ⥤ AddCommGrpCat.{v}) :
    IsFinitelyPresentedFunctor F ↔
      ∃ (X Y : C) (f : X ⟶ Y) (p : preadditiveYoneda.obj Y ⟶ F)
        (h : preadditiveYoneda.map f ≫ p = 0), Epi p ∧ (ShortComplex.mk _ _ h).Exact := sorry

/-- **0.1** If `F` is finitely generated and `G` is finitely presented, `cokernel φ` is finitely
presented (yielding `IsClosedUnderCokernels` on `isFinitelyPresentedFunctor C`). -/
theorem IsFinitelyPresentedFunctor.cokernel {F G : Cᵒᵖ ⥤ AddCommGrpCat.{v}} (φ : F ⟶ G)
    (hF : IsFinitelyGeneratedFunctor F) (hG : IsFinitelyPresentedFunctor G) :
    IsFinitelyPresentedFunctor (Limits.cokernel φ) := sorry

end FinitelyPresentedFunctor

section ModCat

variable (C : Type u) [Category.{v} C] [Preadditive C]

/-- **0.1** `Mod C`: contravariant additive functors `Cᵒᵖ ⥤+ AddCommGrpCat.{w}`. -/
abbrev ModCat := Cᵒᵖ ⥤+ AddCommGrpCat.{w}

section Closure
variable {D : Type u} [Category.{v} D] [Preadditive D]
instance : (additiveFunctor D AddCommGrpCat.{w}).ContainsZero := sorry
instance : (additiveFunctor D AddCommGrpCat.{w}).IsClosedUnderKernels := sorry
instance : (additiveFunctor D AddCommGrpCat.{w}).IsClosedUnderCokernels := sorry
instance : (additiveFunctor D AddCommGrpCat.{w}).IsClosedUnderFiniteProducts := sorry
instance {J : Type*} [Category J] [HasColimitsOfShape J AddCommGrpCat.{w}] :
    (additiveFunctor D AddCommGrpCat.{w}).IsClosedUnderColimitsOfShape J := sorry
end Closure

noncomputable instance : Abelian (ModCat.{w} C) := inferInstance

instance (priority := high) {J : Type*} [Category J] [HasColimitsOfShape J AddCommGrpCat.{w}] :
    HasColimitsOfShape J (ModCat.{w} C) :=
  hasColimitsOfShape_of_closedUnderColimits _ _

instance [EssentiallySmall.{w} C] : EnoughProjectives (ModCat.{w} C) := sorry
instance [EssentiallySmall.{w} C] : IsGrothendieckAbelian.{w} (ModCat.{w} C) := sorry
instance (M : ModCat.{w} C) : IsModularLattice (Subobject M) := sorry
instance [EssentiallySmall.{w} C] (M : ModCat.{w} C) : IsCompactlyGenerated (Subobject M) := sorry

instance [EssentiallySmall.{w} C] : LocallySmall.{w} (ModCat.{w} C) := inferInstance

variable {C} in
/-- **0.1** Every nonzero finitely generated module has a maximal proper subobject. -/
theorem ModCat.exists_isCoatom_of_isFinitelyGeneratedFunctor (M : ModCat.{v} C)
    (hM : IsFinitelyGeneratedFunctor M.obj) (h0 : ¬ IsZero M) : ∃ N : Subobject M, IsCoatom N :=
  sorry

/-- **0.1** The Yoneda embedding `X ↦ Hom(-, X)` into `Mod C`. -/
def ModCat.yoneda : C ⥤ ModCat.{v} C :=
  ObjectProperty.lift _ preadditiveYoneda fun X ↦
    (inferInstance : (preadditiveYoneda.obj X).Additive)

instance (X : C) : Projective ((ModCat.yoneda C).obj X) := sorry

/-- **0.1** `r ∈ R` acts on `φ : F ⟶ G` by `φ ≫ G(r • 𝟙)`. -/
instance {D : Type u} [Category.{v} D] [Preadditive D] (R : Type*) [CommRing R] [Linear R D] :
    Linear R (ModCat.{w} D) where
  homModule F G :=
    { smul r φ := ObjectProperty.homMk
        { app c := φ.hom.app c ≫ G.obj.map (r • 𝟙 c.unop).op
          naturality := sorry }
      one_smul := sorry, mul_smul := sorry, smul_zero := sorry, smul_add := sorry,
      add_smul := sorry, zero_smul := sorry }
  smul_comp := sorry
  comp_smul := sorry

variable {C} in
/-- **0.1** Concrete `C`-submodule (additive subfunctor) of `F : Mod C`. -/
structure ModCat.Submodule (F : ModCat.{w} C) where
  carrier (X : Cᵒᵖ) : AddSubgroup (F.obj.obj X)
  map_mem {X Y : Cᵒᵖ} (f : X ⟶ Y) {x : F.obj.obj X} :
    x ∈ carrier X → (F.obj.map f).hom x ∈ carrier Y

variable {C} in
@[ext]
theorem ModCat.Submodule.ext {F : ModCat.{w} C} {S T : ModCat.Submodule F}
    (h : ∀ ⦃X : Cᵒᵖ⦄ (x : F.obj.obj X), x ∈ S.carrier X ↔ x ∈ T.carrier X) : S = T := by
  cases S; cases T; congr; funext X; exact AddSubgroup.ext (h (X := X))

instance {F : ModCat.{w} C} : PartialOrder (ModCat.Submodule F) :=
  PartialOrder.lift ModCat.Submodule.carrier fun | ⟨_, _⟩, ⟨_, _⟩, rfl => rfl

instance {F : ModCat.{w} C} : InfSet (ModCat.Submodule F) where
  sInf S := ⟨fun X ↦ ⨅ s ∈ S, s.carrier X, fun f x hx ↦ by
    simp only [AddSubgroup.mem_iInf] at hx ⊢
    exact fun s hs ↦ s.map_mem f (hx s hs)⟩

noncomputable instance {F : ModCat.{w} C} : CompleteLattice (ModCat.Submodule F) :=
  completeLatticeOfInf _ fun _ ↦ sorry

variable {C} in
theorem ModCat.Submodule.nonempty_orderIsoSubobject (F : ModCat.{w} C) :
    Nonempty (ModCat.Submodule F ≃o Subobject F) := sorry

end ModCat

/-! ### 0.2 Rings as one-object categories -/

instance small_mulOpposite (A : Type u) [Small.{v} A] : Small.{v} Aᵐᵒᵖ :=
  small_of_injective MulOpposite.unop_injective

section OneObject

variable (A : Type u) [Ring A]

/-- **0.2** A left `A`-module `M` as the functor on `SingleObj Aᵐᵒᵖ` with value `M`, where
`op a` acts by `a • -` ([ML, IX.6, p. 226]). -/
noncomputable def moduleCatToModCat : ModuleCat.{v} A ⥤ ModCat.{v} (SingleObj Aᵐᵒᵖ) where
  obj M := ⟨{ obj _ := AddCommGrpCat.of M
              map f := AddCommGrpCat.ofHom
                (DistribSMul.toAddMonoidHom M (MulOpposite.unop (show Aᵐᵒᵖ from f.unop)))
              map_id := sorry
              map_comp := sorry }, sorry⟩
  map φ := ObjectProperty.homMk
    { app _ := AddCommGrpCat.ofHom φ.hom.toAddMonoidHom
      naturality := sorry }

instance : (moduleCatToModCat.{v} A).IsEquivalence := sorry

/-- **0.2** Left `A`-modules are modules over `SingleObj Aᵐᵒᵖ`. -/
noncomputable def moduleCatEquivModCat : ModuleCat.{v} A ≌ ModCat.{v} (SingleObj Aᵐᵒᵖ) :=
  (moduleCatToModCat.{v} A).asEquivalence

/-- **0.2** A right `A`-module `M` as a covariant functor on `SingleObj Aᵐᵒᵖ` with value `M`. -/
noncomputable def moduleCatMulOppositeToModCatOp :
    ModuleCat.{v} Aᵐᵒᵖ ⥤ ModCat.{v} (SingleObj Aᵐᵒᵖ)ᵒᵖ where
  obj M := ⟨{ obj _ := AddCommGrpCat.of M
              map f := AddCommGrpCat.ofHom
                (DistribSMul.toAddMonoidHom M (show Aᵐᵒᵖ from f.unop.unop))
              map_id := sorry
              map_comp := sorry }, sorry⟩
  map φ := ObjectProperty.homMk
    { app _ := AddCommGrpCat.ofHom φ.hom.toAddMonoidHom
      naturality := sorry }

instance : (moduleCatMulOppositeToModCatOp.{v} A).IsEquivalence := sorry

/-- **0.2** Right `A`-modules are covariant additive functors on `SingleObj Aᵐᵒᵖ`. -/
noncomputable def moduleCatMulOppositeEquivModCatOp :
    ModuleCat.{v} Aᵐᵒᵖ ≌ ModCat.{v} (SingleObj Aᵐᵒᵖ)ᵒᵖ :=
  (moduleCatMulOppositeToModCatOp.{v} A).asEquivalence

instance [Small.{v} A] : EssentiallySmall.{v} (SingleObj A) := sorry

instance (R : Type*) [CommRing R] [Algebra R A] : Linear R (SingleObj A) where
  homModule _ _ := inferInstanceAs (Module R A)
  smul_comp _ _ _ r f g := mul_smul_comm r g f
  comp_smul _ _ _ f r g := smul_mul_assoc r g f

end OneObject

/-! ### 0.3 Tensor product of categories, bimodules, and ideals of `C` -/

section BimodAndIdeals

universe u₁ v₁ u₂ v₂

/-- **0.3** `R`-linear tensor product `C₁ ⊗_R C₂` of `R`-linear categories (`Hom X Y :=
(X.fst ⟶ Y.fst) ⊗[R] (X.snd ⟶ Y.snd)`; [Mitchell, §2, pp. 13–14]). -/
structure Linear.TensorProduct (R : Type t) (C₁ : Type u₁) (C₂ : Type u₂) :
    Type (max u₁ u₂) where
  fst : C₁
  snd : C₂

/-- **0.3** Preadditive tensor product `C₁ ⊗_ℤ C₂ := Linear.TensorProduct ℤ C₁ C₂`. -/
abbrev Preadditive.TensorProduct (C₁ : Type u₁) (C₂ : Type u₂) : Type (max u₁ u₂) :=
  Linear.TensorProduct ℤ C₁ C₂

namespace Linear.TensorProduct

variable {R : Type t} [CommRing R]
  {C₁ : Type u₁} [Category.{v₁} C₁] [Preadditive C₁] [Linear R C₁]
  {C₂ : Type u₂} [Category.{v₂} C₂] [Preadditive C₂] [Linear R C₂]

/-- **0.3** Composition `(f₁ ⊗ f₂) ≫ (g₁ ⊗ g₂) = (f₁ ≫ g₁) ⊗ (f₂ ≫ g₂)`, as an `R`-bilinear map. -/
noncomputable def compBilin (X Y Z : Linear.TensorProduct R C₁ C₂) :
    ((X.fst ⟶ Y.fst) ⊗[R] (X.snd ⟶ Y.snd)) →ₗ[R] ((Y.fst ⟶ Z.fst) ⊗[R] (Y.snd ⟶ Z.snd)) →ₗ[R]
      ((X.fst ⟶ Z.fst) ⊗[R] (X.snd ⟶ Z.snd)) :=
  TensorProduct.lift <| (TensorProduct.mapBilinear (RingHom.id R) _ _ _ _).compl₁₂
    (Linear.comp X.fst Y.fst Z.fst) (Linear.comp X.snd Y.snd Z.snd)

noncomputable instance : Category.{max v₁ v₂} (Linear.TensorProduct R C₁ C₂) where
  Hom X Y := _root_.TensorProduct R (X.fst ⟶ Y.fst) (X.snd ⟶ Y.snd)
  id X := 𝟙 X.fst ⊗ₜ[R] 𝟙 X.snd
  comp {X Y Z} f g := compBilin X Y Z f g
  id_comp := sorry
  comp_id := sorry
  assoc := sorry

noncomputable instance : Preadditive (Linear.TensorProduct R C₁ C₂) where
  homGroup X Y :=
    inferInstanceAs (AddCommGroup (_root_.TensorProduct R (X.fst ⟶ Y.fst) (X.snd ⟶ Y.snd)))
  add_comp := sorry
  comp_add := sorry

noncomputable instance : Linear R (Linear.TensorProduct R C₁ C₂) where
  homModule X Y :=
    inferInstanceAs (Module R (_root_.TensorProduct R (X.fst ⟶ Y.fst) (X.snd ⟶ Y.snd)))
  smul_comp := sorry
  comp_smul := sorry

def tmul {X Y : Linear.TensorProduct R C₁ C₂} (f₁ : X.fst ⟶ Y.fst) (f₂ : X.snd ⟶ Y.snd) :
    X ⟶ Y :=
  f₁ ⊗ₜ[R] f₂

@[simp]
theorem tmul_comp_tmul {X Y Z : Linear.TensorProduct R C₁ C₂}
    (f₁ : X.fst ⟶ Y.fst) (f₂ : X.snd ⟶ Y.snd) (g₁ : Y.fst ⟶ Z.fst) (g₂ : Y.snd ⟶ Z.snd) :
    tmul (R := R) f₁ f₂ ≫ tmul (R := R) g₁ g₂ = tmul (R := R) (f₁ ≫ g₁) (f₂ ≫ g₂) := by
  simp [CategoryStruct.comp, compBilin, tmul]

variable (R C₁) in
/-- **0.3** Left- and right-slice additive functors into `C₁ ⊗_R C₂`. -/
noncomputable def inlObj (Y : C₂) : C₁ ⥤ Linear.TensorProduct R C₁ C₂ where
  obj X := ⟨X, Y⟩
  map f := tmul f (𝟙 Y)
  map_id _ := rfl
  map_comp _ _ := sorry

instance (Y : C₂) : (inlObj R C₁ Y).Additive := sorry

variable (R C₂) in
noncomputable def inrObj (X : C₁) : C₂ ⥤ Linear.TensorProduct R C₁ C₂ where
  obj Y := ⟨X, Y⟩
  map g := tmul (𝟙 X) g
  map_id _ := rfl
  map_comp _ _ := sorry

instance (X : C₁) : (inrObj R C₂ X).Additive := sorry

/-- **0.3** `R`-linear comparison `SingleObj A ⊗_R SingleObj B ≌ SingleObj (A ⊗[R] B)`. -/
noncomputable def singleObjEquiv (R : Type t) [CommRing R] (A : Type u₁) [Ring A] [Algebra R A]
    (B : Type u₂) [Ring B] [Algebra R B] :
    Linear.TensorProduct R (SingleObj A) (SingleObj B) ≌
      SingleObj (_root_.TensorProduct R A B) where
  functor :=
    { obj _ := SingleObj.star _
      map f := (f : _root_.TensorProduct R A B)
      map_id := sorry
      map_comp := sorry }
  inverse :=
    { obj _ := ⟨SingleObj.star _, SingleObj.star _⟩
      map f := (f : _root_.TensorProduct R A B)
      map_id := sorry
      map_comp := sorry }
  unitIso := NatIso.ofComponents (fun _ ↦ Iso.refl _) sorry
  counitIso := NatIso.ofComponents (fun _ ↦ Iso.refl _) sorry
  functor_unitIso_comp := sorry

end Linear.TensorProduct

/-- **0.3** `R`-central `(D, C)`-bimodules `Mod (D ⊗_R Cᵒᵖ)`, specializing at `R = ℤ` to
`ModCat.Bimod D C := Mod (D ⊗_ℤ Cᵒᵖ)`. -/
abbrev ModCat.LinearBimod (R : Type t) [CommRing R] (D : Type u₁) [Category.{v₁} D]
    [Preadditive D] [Linear R D] (C : Type u₂) [Category.{v₂} C] [Preadditive C] [Linear R C] :=
  ModCat.{w} (Linear.TensorProduct R D Cᵒᵖ)

abbrev ModCat.Bimod (D : Type u₁) [Category.{v₁} D] [Preadditive D]
    (C : Type u₂) [Category.{v₂} C] [Preadditive C] :=
  ModCat.LinearBimod.{w} ℤ D C

/-- **0.3** Bridge between `R`-central bimodules over `SingleObj` and `ModuleCat (A ⊗[R] Bᵐᵒᵖ)`
(`Mathlib/Algebra/Module/Bimodule.lean`). -/
theorem ModCat.LinearBimod.nonempty_singleObjEquiv (R : Type t) [CommRing R]
    (A : Type u₁) [Ring A] [Algebra R A] (B : Type u₂) [Ring B] [Algebra R B] :
    Nonempty (ModCat.LinearBimod.{v} R (SingleObj Aᵐᵒᵖ) (SingleObj Bᵐᵒᵖ) ≌
      ModuleCat.{v} (_root_.TensorProduct R A Bᵐᵒᵖ)) := sorry

namespace ModCat.Bimod

variable {D : Type u₁} [Category.{v₁} D] [Preadditive D]
  {C : Type u₂} [Category.{v₂} C] [Preadditive C]

/-- **0.3** Currying equivalences identifying `Bimod D C` with `C ⥤+ Mod D` and `Dᵒᵖ ⥤+ Mod Cᵒᵖ`. -/
theorem nonempty_curryLeftEquiv (D : Type u₁) [Category.{v₁} D] [Preadditive D]
    (C : Type u₂) [Category.{v₂} C] [Preadditive C] :
    Nonempty (ModCat.Bimod.{w} D C ≌ (C ⥤+ ModCat.{w} D)) := sorry

theorem nonempty_curryRightEquiv (D : Type u₁) [Category.{v₁} D] [Preadditive D]
    (C : Type u₂) [Category.{v₂} C] [Preadditive C] :
    Nonempty (ModCat.Bimod.{w} D C ≌ (Dᵒᵖ ⥤+ ModCat.{w} Cᵒᵖ)) := sorry

/-- **0.3** Left `D`-module slice `M(-, c)` and right `C`-module slice `M(d, -)`. -/
noncomputable def sliceLeft (M : ModCat.Bimod.{w} D C) (c : C) : ModCat.{w} D :=
  ⟨(Linear.TensorProduct.inlObj ℤ D (Opposite.op c)).op ⋙ M.obj,
    (inferInstance :
      ((Linear.TensorProduct.inlObj ℤ D (Opposite.op c)).op ⋙ M.obj).Additive)⟩

noncomputable def sliceRight (M : ModCat.Bimod.{w} D C) (d : D) : ModCat.{w} Cᵒᵖ :=
  ⟨(Linear.TensorProduct.inrObj ℤ Cᵒᵖ d).op ⋙ M.obj,
    (inferInstance : ((Linear.TensorProduct.inrObj ℤ Cᵒᵖ d).op ⋙ M.obj).Additive)⟩

/-- **0.3** The slices as functors: `c ↦ M(-, c)` (covariant) and `d ↦ M(d, -)` (contravariant). -/
noncomputable def sliceLeftFunctor (M : ModCat.Bimod.{w} D C) : C ⥤ ModCat.{w} D where
  obj c := M.sliceLeft c
  map {c c'} b := ObjectProperty.homMk
    { app X := M.obj.map (Linear.TensorProduct.tmul (R := ℤ)
        (X := ⟨X.unop, Opposite.op c'⟩) (Y := ⟨X.unop, Opposite.op c⟩) (𝟙 X.unop) b.op).op
      naturality := sorry }
  map_id := sorry
  map_comp := sorry

noncomputable def sliceRightFunctor (M : ModCat.Bimod.{w} D C) : Dᵒᵖ ⥤ ModCat.{w} Cᵒᵖ where
  obj d := M.sliceRight d.unop
  map {d d'} a := ObjectProperty.homMk
    { app Z := M.obj.map (Linear.TensorProduct.tmul (R := ℤ)
        (X := ⟨d'.unop, Z.unop⟩) (Y := ⟨d.unop, Z.unop⟩) a.unop (𝟙 Z.unop)).op
      naturality := sorry }
  map_id := sorry
  map_comp := sorry

/-- **0.3** A map of bimodules restricted to the slices. -/
noncomputable def sliceLeftMap {M M' : ModCat.Bimod.{w} D C} (μ : M ⟶ M') (c : C) :
    M.sliceLeft c ⟶ M'.sliceLeft c :=
  ObjectProperty.homMk
    (Functor.whiskerLeft (Linear.TensorProduct.inlObj ℤ D (Opposite.op c)).op μ.hom)

noncomputable def sliceRightMap {M M' : ModCat.Bimod.{w} D C} (μ : M ⟶ M') (d : D) :
    M.sliceRight d ⟶ M'.sliceRight d :=
  ObjectProperty.homMk
    (Functor.whiskerLeft (Linear.TensorProduct.inrObj ℤ Cᵒᵖ d).op μ.hom)

/-- **0.3** One-sided submodules of a `(D, C)`-bimodule `M`, forgetting the other action. -/
def LeftSubmodule (M : ModCat.Bimod.{w} D C) : Type _ :=
  ∀ c : C, ModCat.Submodule (M.sliceLeft c)

def RightSubmodule (M : ModCat.Bimod.{w} D C) : Type _ :=
  ∀ d : D, ModCat.Submodule (M.sliceRight d)

instance {M : ModCat.Bimod.{w} D C} : PartialOrder M.LeftSubmodule :=
  inferInstanceAs (PartialOrder (∀ _, _))
instance {M : ModCat.Bimod.{w} D C} : PartialOrder M.RightSubmodule :=
  inferInstanceAs (PartialOrder (∀ _, _))
noncomputable instance {M : ModCat.Bimod.{w} D C} : CompleteLattice M.LeftSubmodule :=
  inferInstanceAs (CompleteLattice (∀ _, _))
noncomputable instance {M : ModCat.Bimod.{w} D C} : CompleteLattice M.RightSubmodule :=
  inferInstanceAs (CompleteLattice (∀ _, _))

end ModCat.Bimod

variable (C : Type u) [Category.{v} C] [Preadditive C]

/-- **0.3** `a ⊗ b` acts on `Hom_C(X, Y)` by `h ↦ a ≫ h ≫ b`. -/
noncomputable def ModCat.regularAct {X Y X' Y' : C} :
    (X' ⟶ X) →ₗ[ℤ] (Opposite.op Y' ⟶ Opposite.op Y) →ₗ[ℤ] ((X ⟶ Y) →ₗ[ℤ] (X' ⟶ Y')) :=
  LinearMap.mk₂ ℤ (fun a b ↦ ((Linear.comp (S := ℤ) X' X Y' a).comp
      ((Linear.comp (S := ℤ) X Y Y').flip b.unop)))
    (by intros; ext; simp) (by intros; ext; simp) (by intros; ext; simp) (by intros; ext; simp)

/-- **0.3** Regular `(C, C)`-bimodule `_C C_C`: `(X, Y) ↦ Hom_C(X, Y)`, with `a ⊗ b` acting by
`h ↦ a ≫ h ≫ b`. -/
noncomputable def ModCat.regularBimod : ModCat.Bimod.{v} C C :=
  ⟨{ obj p := AddCommGrpCat.of (p.unop.fst ⟶ p.unop.snd.unop)
     map φ := AddCommGrpCat.ofHom
       (TensorProduct.lift (ModCat.regularAct C) φ.unop).toAddMonoidHom
     map_id := sorry
     map_comp := sorry }, sorry⟩

/-- **0.3** Two-sided ideals `MorphismIdeal C` are `(C, C)`-subbimodules of `_C C_C`. -/
noncomputable def MorphismIdeal.orderIsoSubmoduleRegularBimod :
    TauCeti.MorphismIdeal C ≃o ModCat.Submodule (ModCat.regularBimod C) where
  toFun I := ⟨fun p ↦ I.hom p.unop.fst p.unop.snd.unop, sorry⟩
  invFun S :=
    { hom X Y := S.carrier (op ⟨X, op Y⟩)
      comp_mem_left := sorry
      comp_mem_right := sorry }
  left_inv := sorry
  right_inv := sorry
  map_rel_iff' := sorry

/-- **0.3** A left ideal of `C`: a left `C`-submodule of the `(C, C)`-bimodule `_C C_C`. -/
abbrev LeftMorphismIdeal : Type (max u v) :=
  (ModCat.regularBimod C).LeftSubmodule

/-- **0.3** A right ideal of `C`: a right `C`-submodule of the `(C, C)`-bimodule `_C C_C`. -/
abbrev RightMorphismIdeal : Type (max u v) :=
  (ModCat.regularBimod C).RightSubmodule

variable {C}

abbrev LeftMorphismIdeal.hom (I : LeftMorphismIdeal C) (X Y : C) : AddSubgroup (X ⟶ Y) :=
  (I Y).carrier (Opposite.op X)

abbrev RightMorphismIdeal.hom (I : RightMorphismIdeal C) (X Y : C) : AddSubgroup (X ⟶ Y) :=
  (I X).carrier (Opposite.op (Opposite.op Y))

theorem LeftMorphismIdeal.comp_mem (I : LeftMorphismIdeal C) {X Y Z : C} (f : X ⟶ Y) {g : Y ⟶ Z}
    (hg : g ∈ I.hom Y Z) : f ≫ g ∈ I.hom X Z := sorry

theorem RightMorphismIdeal.comp_mem (I : RightMorphismIdeal C) {X Y Z : C} {f : X ⟶ Y} (g : Y ⟶ Z)
    (hf : f ∈ I.hom X Y) : f ≫ g ∈ I.hom X Z := sorry

@[ext]
theorem LeftMorphismIdeal.ext {I J : LeftMorphismIdeal C}
    (h : ∀ ⦃X Y : C⦄ (f : X ⟶ Y), f ∈ I.hom X Y ↔ f ∈ J.hom X Y) : I = J := by
  funext Y; ext ⟨X⟩ f; exact h f

@[ext]
theorem RightMorphismIdeal.ext {I J : RightMorphismIdeal C}
    (h : ∀ ⦃X Y : C⦄ (f : X ⟶ Y), f ∈ I.hom X Y ↔ f ∈ J.hom X Y) : I = J := by
  funext X; ext ⟨⟨Y⟩⟩ f; exact h f

@[coe]
noncomputable def MorphismIdeal.toLeftMorphismIdeal (I : TauCeti.MorphismIdeal C) :
    LeftMorphismIdeal C :=
  fun Y ↦ ⟨fun X ↦ I.hom X.unop Y, sorry⟩

@[coe]
noncomputable def MorphismIdeal.toRightMorphismIdeal (I : TauCeti.MorphismIdeal C) :
    RightMorphismIdeal C :=
  fun X ↦ ⟨fun Y ↦ I.hom X Y.unop.unop, sorry⟩

noncomputable instance : Coe (TauCeti.MorphismIdeal C) (LeftMorphismIdeal C) :=
  ⟨MorphismIdeal.toLeftMorphismIdeal⟩

noncomputable instance : Coe (TauCeti.MorphismIdeal C) (RightMorphismIdeal C) :=
  ⟨MorphismIdeal.toRightMorphismIdeal⟩

/-- **0.3** Opposite of a right ideal of `C` as a left ideal of `Cᵒᵖ`. -/
noncomputable def RightMorphismIdeal.op (I : RightMorphismIdeal C) : LeftMorphismIdeal Cᵒᵖ :=
  fun Y ↦ ⟨fun X ↦ (I.hom Y.unop X.unop.unop).comap (CategoryTheory.unopHom X.unop Y), sorry⟩

@[simp]
theorem MorphismIdeal.op_toRightMorphismIdeal (I : TauCeti.MorphismIdeal C) :
    (I : RightMorphismIdeal C).op = (I.op : LeftMorphismIdeal Cᵒᵖ) := by
  ext; simp [RightMorphismIdeal.op, MorphismIdeal.toRightMorphismIdeal,
    MorphismIdeal.toLeftMorphismIdeal, LeftMorphismIdeal.hom, RightMorphismIdeal.hom]; rfl

/-- **0.3** The right ideal concentrated at `X` given by a submodule `S ⊆ Hom(X, -)` (single-object
ideals of [Mitchell, §3] and [OR], extended by `0`). -/
noncomputable def RightMorphismIdeal.ofSubmodule {X : C}
    (S : ModCat.Submodule ((ModCat.regularBimod C).sliceRight X)) : RightMorphismIdeal C := by
  classical
  exact fun X' ↦ if h : X' = X then h ▸ S else ⊥

/-- **0.3** Principal right ideal `g C = {g ≫ h}` at `X` generated by `g : X ⟶ Y`. -/
noncomputable def RightMorphismIdeal.principal {X Y : C} (g : X ⟶ Y) : RightMorphismIdeal C :=
  RightMorphismIdeal.ofSubmodule (X := X)
    ⟨fun Z ↦ AddSubgroup.closure {f | ∃ h : Y ⟶ Z.unop.unop, f = (g ≫ h : X ⟶ Z.unop.unop)},
      sorry⟩

/-- **0.3** Superfluous element of a lattice with `⊤` (refactoring `TauCeti.IsSuperfluous`). -/
def IsSuperfluous {α : Type*} [SemilatticeSup α] [OrderTop α] (a : α) : Prop :=
  ∀ ⦃b : α⦄, a ⊔ b = ⊤ → b = ⊤

/-- **0.3** Submodule `I · M` of `M : Mod C`: `(I · M)(X)` is generated by the `M(f)(x)` with
`f ∈ I(X, Y)` and `x ∈ M(Y)`. -/
def LeftMorphismIdeal.smul (I : LeftMorphismIdeal C) (M : ModCat.{w} C) : ModCat.Submodule M where
  carrier X := AddSubgroup.closure
    {y | ∃ (Y : C) (f : X.unop ⟶ Y), f ∈ I.hom X.unop Y ∧
      ∃ x : M.obj.obj (Opposite.op Y), y = (M.obj.map f.op).hom x}
  map_mem := sorry

end BimodAndIdeals

/-- **0.3** Von Neumann regular preadditive categories (`∀ f : X ⟶ Y, ∃ g : Y ⟶ X, f ≫ g ≫ f = f`)
and rings (`∀ a, ∃ b, a * b * a = a`), used in 3.3 and 4.2 ([St, Thm. 4]; [Lam-FC, (4.23)]). -/
class IsVonNeumannRegularCategory (C : Type u) [Category.{v} C] [Preadditive C] : Prop where
  exists_comp_eq_self ⦃X Y : C⦄ (f : X ⟶ Y) : ∃ g : Y ⟶ X, f ≫ g ≫ f = f

class IsVonNeumannRegularRing (A : Type u) [Ring A] : Prop where
  exists_mul_eq_self (a : A) : ∃ b : A, a * b * a = a

/-! ### 0.4–0.6 The coend tensor product, projective factors, and swap -/

section Tensor

/-- **0.4** The bifunctor `(d', d) ↦ G(d') ⊗_ℤ F(d)` whose coend is `G ⊗_D F`. -/
noncomputable def tensorBifunctor {D : Type u} [Category.{v} D] (G : Dᵒᵖ ⥤ AddCommGrpCat.{w})
    (F : D ⥤ AddCommGrpCat.{w}) : Dᵒᵖ ⥤ D ⥤ AddCommGrpCat.{w} where
  obj d' :=
    { obj d := AddCommGrpCat.of (G.obj d' ⊗[ℤ] F.obj d)
      map f := AddCommGrpCat.ofHom
        (TensorProduct.map LinearMap.id (F.map f).hom.toIntLinearMap).toAddMonoidHom
      map_id := sorry
      map_comp := sorry }
  map g :=
    { app d := AddCommGrpCat.ofHom
        (TensorProduct.map (G.map g).hom.toIntLinearMap LinearMap.id).toAddMonoidHom
      naturality := sorry }
  map_id := sorry
  map_comp := sorry

/-- **0.4** Functoriality of `tensorBifunctor` in both arguments, `α ⊗ β`. -/
noncomputable def tensorBifunctorMap {D : Type u} [Category.{v} D]
    {G G' : Dᵒᵖ ⥤ AddCommGrpCat.{w}} {F F' : D ⥤ AddCommGrpCat.{w}} (α : G ⟶ G') (β : F ⟶ F') :
    tensorBifunctor G F ⟶ tensorBifunctor G' F' where
  app d' :=
    { app d := AddCommGrpCat.ofHom
        (TensorProduct.map (α.app d').hom.toIntLinearMap
          (β.app d).hom.toIntLinearMap).toAddMonoidHom
      naturality := sorry }
  naturality := sorry

instance {D : Type u} [Category.{v} D] [EssentiallySmall.{w} D] (G : Dᵒᵖ ⥤ AddCommGrpCat.{w})
    (F : D ⥤ AddCommGrpCat.{w}) : HasCoend (tensorBifunctor G F) := sorry

variable {C : Type u} [Category.{v} C] [Preadditive C]

/-- **0.4** Representable `(C ⧸ I)(-, X)` in `Mod C` (covariant `(C ⧸ I)(X, -)` at `I.op`). -/
noncomputable def MorphismIdeal.quotientYoneda (I : TauCeti.MorphismIdeal C) (X : C) :
    ModCat.{v} C :=
  ⟨I.quotientFunctor.op ⋙ preadditiveYoneda.obj (I.quotientFunctor.obj X),
    (inferInstance : (I.quotientFunctor.op ⋙ preadditiveYoneda.obj _).Additive)⟩

namespace ModCat

/-- **0.1** The `R`-module structure on `F(c)` given by `r ↦ F(r • 𝟙 c)`. -/
@[instance_reducible]
noncomputable def moduleObj (R : Type*) [CommRing R] [Linear R C] (F : ModCat.{w} C) (c : Cᵒᵖ) :
    Module R (F.obj.obj c) :=
  Module.compHom _
    ({ toFun r := (F.obj.map (r • 𝟙 c.unop).op).hom
       map_one' := sorry, map_mul' := sorry, map_zero' := sorry, map_add' := sorry } :
      R →+* AddMonoid.End (F.obj.obj c))

/-- **0.8** The bifunctor `(F, E) ↦ F^E = Hom_R(F(-), E)`, contravariant in `F`. -/
noncomputable def linearHomOpBifunctor (R : Type*) [CommRing R] [Linear R C] :
    (ModCat.{w} C)ᵒᵖ ⥤ ModuleCat.{w} R ⥤ ModCat.{w} Cᵒᵖ where
  obj F :=
    { obj E := ⟨{ obj X := letI := moduleObj R F.unop X.unop
                    AddCommGrpCat.of (F.unop.obj.obj X.unop →ₗ[R] E)
                  map {X Y} f := letI := moduleObj R F.unop X.unop
                    letI := moduleObj R F.unop Y.unop
                    AddCommGrpCat.ofHom (LinearMap.lcomp R E
                      (addToLin (F.unop.obj.map f.unop).hom sorry)).toAddMonoidHom
                  map_id := sorry
                  map_comp := sorry }, sorry⟩
      map g := ObjectProperty.homMk
        { app X := letI := moduleObj R F.unop X.unop
            AddCommGrpCat.ofHom (LinearMap.llcomp R _ _ _ g.hom).toAddMonoidHom
          naturality := sorry }
      map_id := sorry
      map_comp := sorry }
  map {F F'} α :=
    { app E := ObjectProperty.homMk
        { app X := letI := moduleObj R F.unop X.unop
            letI := moduleObj R F'.unop X.unop
            AddCommGrpCat.ofHom (LinearMap.lcomp R E
              (addToLin (α.unop.hom.app X.unop).hom sorry)).toAddMonoidHom
          naturality := sorry }
      naturality := sorry }
  map_id := sorry
  map_comp := sorry

section CoendTensor

variable [EssentiallySmall.{w} C]

/-- **0.4** Coend tensor product `G ⊗_C F` for `G : Mod Cᵒᵖ` and `F : Mod C` ([Mitchell, §6]). -/
noncomputable def tensorObj (G : ModCat.{w} Cᵒᵖ) (F : ModCat.{w} C) : AddCommGrpCat.{w} :=
  coend (tensorBifunctor G.obj F.obj)

/-- **0.4** Coend tensor product as an additive bifunctor `Mod Cᵒᵖ ⥤ Mod C ⥤ AddCommGrpCat`. -/
noncomputable def tensor : ModCat.{w} Cᵒᵖ ⥤ ModCat.{w} C ⥤ AddCommGrpCat.{w} where
  obj G :=
    { obj F := tensorObj G F
      map φ := coend.map (tensorBifunctorMap (𝟙 G.obj) φ.hom)
      map_id := sorry
      map_comp := sorry }
  map α :=
    { app F := coend.map (tensorBifunctorMap α.hom (𝟙 F.obj))
      naturality := sorry }
  map_id := sorry
  map_comp := sorry

instance (G : ModCat.{w} Cᵒᵖ) : (tensor.obj G).Additive := sorry
instance (F : ModCat.{w} C) : (tensor.flip.obj F).Additive := sorry
instance : (tensor (C := C)).Additive := sorry

/-- **0.4** `r ∈ R` acts on `G ⊗_C F` through `G ⊗_C (r • 𝟙 F)`. -/
noncomputable instance (R : Type*) [CommRing R] [Linear R C] (G : ModCat.{w} Cᵒᵖ)
    (F : ModCat.{w} C) : Module R (tensorObj G F) :=
  Module.compHom _
    ({ toFun r := ((tensor.obj G).map (r • 𝟙 F)).hom
       map_one' := sorry, map_mul' := sorry, map_zero' := sorry, map_add' := sorry } :
      R →+* AddMonoid.End (tensorObj G F))

end CoendTensor

/-- **0.4** `R`-linear tensor bifunctor `Mod Cᵒᵖ ⥤ Mod C ⥤ ModuleCat R`. -/
noncomputable def linearTensor [EssentiallySmall.{w} C] (R : Type*) [CommRing R] [Linear R C] :
    ModCat.{w} Cᵒᵖ ⥤ ModCat.{w} C ⥤ ModuleCat.{w} R where
  obj G :=
    { obj F := ModuleCat.of R (tensorObj G F)
      map φ := ModuleCat.ofHom
        { toFun := ((tensor.obj G).map φ).hom, map_add' := map_add _, map_smul' := sorry }
      map_id := sorry
      map_comp := sorry }
  map α :=
    { app F := ModuleCat.ofHom
        { toFun := ((tensor.map α).app F).hom, map_add' := map_add _, map_smul' := sorry }
      naturality := sorry }
  map_id := sorry
  map_comp := sorry

instance [EssentiallySmall.{w} C] (R : Type*) [CommRing R] [Linear R C] (G : ModCat.{w} Cᵒᵖ) :
    ((linearTensor R).obj G).Additive := sorry

/-- **0.4** Yoneda cancellation `G ⊗_C Hom(-, X) ≅ G(X)` and `Hom(X, -) ⊗_C F ≅ F(X)`. -/
theorem nonempty_tensorObjYonedaIso [EssentiallySmall.{v} C] (G : ModCat.{v} Cᵒᵖ) (X : C) :
    Nonempty (tensorObj G ((ModCat.yoneda C).obj X) ≅ G.obj.obj (op (op X))) := sorry

theorem nonempty_yonedaTensorObjIso [EssentiallySmall.{v} C] (X : C) (F : ModCat.{v} C) :
    Nonempty (tensorObj ((ModCat.yoneda Cᵒᵖ).obj (Opposite.op X)) F ≅
      F.obj.obj (Opposite.op X)) := sorry

section BimodTensorHom

universe u₁ v₁ u₂ v₂

variable {D : Type u₁} [Category.{v₁} D] [Preadditive D]
  {E : Type u₂} [Category.{v₂} E] [Preadditive E]

/-- **0.4** `a ⊗ b` acts on `T(M(d, -), N(-, e))` through `T(M(a, -), N(-, b))`. -/
noncomputable def Bimod.liftAct (T : ModCat.{w} Cᵒᵖ ⥤ ModCat.{w} C ⥤ AddCommGrpCat.{w})
    [T.Additive] [∀ G, (T.obj G).Additive]
    (M : ModCat.Bimod.{w} D C) (N : ModCat.Bimod.{w} C E)
    (p q : (Linear.TensorProduct ℤ D Eᵒᵖ)ᵒᵖ) :
    (q.unop.fst ⟶ p.unop.fst) →ₗ[ℤ] (q.unop.snd ⟶ p.unop.snd) →ₗ[ℤ]
      ((T.obj ((Bimod.sliceRightFunctor M).obj (op p.unop.fst))).obj
          ((Bimod.sliceLeftFunctor N).obj p.unop.snd.unop) →ₗ[ℤ]
        (T.obj ((Bimod.sliceRightFunctor M).obj (op q.unop.fst))).obj
          ((Bimod.sliceLeftFunctor N).obj q.unop.snd.unop)) :=
  LinearMap.mk₂ ℤ (fun a b ↦ ((T.map ((Bimod.sliceRightFunctor M).map a.op)).app _ ≫
      (T.obj _).map ((Bimod.sliceLeftFunctor N).map b.unop)).hom.toIntLinearMap)
    sorry sorry sorry sorry

/-- **0.4** A bifunctor `T : Mod Cᵒᵖ ⥤ Mod C ⥤ Ab` applied to bimodules slice by slice:
`(T(M, N))(d, e) = T(M(d, -), N(-, e))`. -/
noncomputable def Bimod.lift (T : ModCat.{w} Cᵒᵖ ⥤ ModCat.{w} C ⥤ AddCommGrpCat.{w})
    [T.Additive] [∀ G, (T.obj G).Additive] :
    ModCat.Bimod.{w} D C ⥤ ModCat.Bimod.{w} C E ⥤ ModCat.Bimod.{w} D E where
  obj M :=
    { obj N := ⟨{ obj p := (T.obj ((Bimod.sliceRightFunctor M).obj (op p.unop.fst))).obj
                    ((Bimod.sliceLeftFunctor N).obj p.unop.snd.unop)
                  map {p q} φ := AddCommGrpCat.ofHom
                    (TensorProduct.lift (Bimod.liftAct T M N p q) φ.unop).toAddMonoidHom
                  map_id := sorry
                  map_comp := sorry }, sorry⟩
      map ν := ObjectProperty.homMk
        { app p := (T.obj _).map (Bimod.sliceLeftMap ν p.unop.snd.unop)
          naturality := sorry }
      map_id := sorry
      map_comp := sorry }
  map μ :=
    { app N := ObjectProperty.homMk
        { app p := (T.map (Bimod.sliceRightMap μ p.unop.fst)).app _
          naturality := sorry }
      naturality := sorry }
  map_id := sorry
  map_comp := sorry

/-- **0.4** Symmetric bimodule tensor product `M ⊗_C N` in `Bimod D E`, evaluating at `(d, e)` to
`M(d, -) ⊗_C N(-, e)`. -/
noncomputable def Bimod.tensor [EssentiallySmall.{w} C] :
    ModCat.Bimod.{w} D C ⥤ ModCat.Bimod.{w} C E ⥤ ModCat.Bimod.{w} D E :=
  Bimod.lift ModCat.tensor

/-- **0.4** Contravariant bimodule `Hom` functors `Hom_D(-, M) : (Mod D)ᵒᵖ ⥤ Mod Cᵒᵖ` and
`Hom_{Cᵒᵖ}(-, M) : (Mod Cᵒᵖ)ᵒᵖ ⥤ Mod D`. -/
noncomputable def Bimod.homLeft [EssentiallySmall.{w} D] (M : ModCat.Bimod.{w} D C) :
    (ModCat.{w} D)ᵒᵖ ⥤ ModCat.{w} Cᵒᵖ where
  obj P := ⟨{ obj X := AddCommGrpCat.of
                (Shrink.{w} (P.unop ⟶ (Bimod.sliceLeftFunctor M).obj X.unop.unop))
              map f := AddCommGrpCat.ofHom (shrinkMap
                (Preadditive.rightComp P.unop ((Bimod.sliceLeftFunctor M).map f.unop.unop)))
              map_id := sorry
              map_comp := sorry }, sorry⟩
  map α := ObjectProperty.homMk
    { app X := AddCommGrpCat.ofHom (shrinkMap (Preadditive.leftComp _ α.unop))
      naturality := sorry }
  map_id := sorry
  map_comp := sorry

noncomputable def Bimod.homRight [EssentiallySmall.{w} C] (M : ModCat.Bimod.{w} D C) :
    (ModCat.{w} Cᵒᵖ)ᵒᵖ ⥤ ModCat.{w} D where
  obj G := ⟨{ obj d := AddCommGrpCat.of (Shrink.{w} (G.unop ⟶ (Bimod.sliceRightFunctor M).obj d))
              map a := AddCommGrpCat.ofHom
                (shrinkMap (Preadditive.rightComp G.unop ((Bimod.sliceRightFunctor M).map a)))
              map_id := sorry
              map_comp := sorry }, sorry⟩
  map α := ObjectProperty.homMk
    { app d := AddCommGrpCat.ofHom (shrinkMap (Preadditive.leftComp _ α.unop))
      naturality := sorry }
  map_id := sorry
  map_comp := sorry

/-- **0.4** Bimodule Tensor–Hom adjunction `M ⊗_C - ⊣ Hom_D(M, -)` between `Mod C` and `Mod D`. -/
noncomputable def Bimod.tensorLeft [EssentiallySmall.{w} C] (M : ModCat.Bimod.{w} D C) :
    ModCat.{w} C ⥤ ModCat.{w} D where
  obj F := ⟨{ obj d := (ModCat.tensor.obj ((Bimod.sliceRightFunctor M).obj d)).obj F
              map a := (ModCat.tensor.map ((Bimod.sliceRightFunctor M).map a)).app F
              map_id := sorry
              map_comp := sorry }, sorry⟩
  map φ := ObjectProperty.homMk
    { app d := (ModCat.tensor.obj _).map φ
      naturality := sorry }
  map_id := sorry
  map_comp := sorry

noncomputable def Bimod.homCovLeft [EssentiallySmall.{w} D] (M : ModCat.Bimod.{w} D C) :
    ModCat.{w} D ⥤ ModCat.{w} C where
  obj Q := ⟨{ obj c := AddCommGrpCat.of (Shrink.{w} ((Bimod.sliceLeftFunctor M).obj c.unop ⟶ Q))
              map f := AddCommGrpCat.ofHom
                (shrinkMap (Preadditive.leftComp Q ((Bimod.sliceLeftFunctor M).map f.unop)))
              map_id := sorry
              map_comp := sorry }, sorry⟩
  map ψ := ObjectProperty.homMk
    { app c := AddCommGrpCat.ofHom (shrinkMap (Preadditive.rightComp _ ψ))
      naturality := sorry }
  map_id := sorry
  map_comp := sorry

theorem Bimod.nonempty_tensorLeftHomAdjunction [EssentiallySmall.{w} C] [EssentiallySmall.{w} D]
    (M : ModCat.Bimod.{w} D C) :
    Nonempty (Bimod.tensorLeft M ⊣ Bimod.homCovLeft M) := sorry

end BimodTensorHom

end ModCat

/-- **0.6** Restriction along `Cᵒᵖᵒᵖ ⥤ C`, giving the double-opposite equivalence
`Mod C ≌ Mod Cᵒᵖᵒᵖ`, and the swap `G ⊗_C F ≅ F ⊗_{Cᵒᵖ} G`. -/
noncomputable def ModCat.opOpFunctor (C : Type u) [Category.{v} C] [Preadditive C] :
    ModCat.{w} C ⥤ ModCat.{w} Cᵒᵖᵒᵖ where
  obj F := ⟨(unopUnop C).op ⋙ F.obj, sorry⟩
  map φ := ObjectProperty.homMk (Functor.whiskerLeft (unopUnop C).op φ.hom)

instance (C : Type u) [Category.{v} C] [Preadditive C] :
    (ModCat.opOpFunctor.{w} C).IsEquivalence := sorry

noncomputable def ModCat.opOpEquiv (C : Type u) [Category.{v} C] [Preadditive C] :
    ModCat.{w} C ≌ ModCat.{w} Cᵒᵖᵒᵖ :=
  (ModCat.opOpFunctor.{w} C).asEquivalence

theorem ModCat.nonempty_tensorObjSwapIso [EssentiallySmall.{w} C]
    (G : ModCat.{w} Cᵒᵖ) (F : ModCat.{w} C) :
    Nonempty (ModCat.tensorObj G F ≅
      ModCat.tensorObj ((ModCat.opOpEquiv C).functor.obj F) G) := sorry

end Tensor

/-! ### 0.7–0.8 Ring balanced tensor product and duals -/

/-- **0.7** Right `A`-module structure `(op a • χ) m = χ (a • m)` on `CharacterModule M` (`M⁺`) for
a left `A`-module `M` over a possibly noncommutative ring `A`. -/
instance CharacterModule.rightModule (A : Type u) [Ring A] (M : Type v) [AddCommGroup M]
    [Module A M] :
    Module Aᵐᵒᵖ (CharacterModule M) where
  smul a χ := AddMonoidHom.comp (show M →+ AddCircle (1 : ℚ) from χ)
    (DistribSMul.toAddMonoidHom M a.unop)
  one_smul := sorry
  mul_smul := sorry
  smul_zero := sorry
  smul_add := sorry
  add_smul := sorry
  zero_smul := sorry

namespace BalancedTensorProduct

section Maps

variable (R : Type t) [CommRing R] {A : Type u} [Ring A] [Algebra R A]
  {M M' : Type*} [AddCommGroup M] [Module Aᵐᵒᵖ M] [Module R M] [IsScalarTower R Aᵐᵒᵖ M]
  [AddCommGroup M'] [Module Aᵐᵒᵖ M'] [Module R M'] [IsScalarTower R Aᵐᵒᵖ M']
  {N : Type*} [AddCommGroup N] [Module A N] [Module R N] [IsScalarTower R A N]

variable (N) in
/-- **0.7** Right-module functoriality `f ⊗_A N : M ⊗_A N →ₗ[R] M' ⊗_A N`. -/
def rTensor (f : M →ₗ[Aᵐᵒᵖ] M') :
    TauCeti.BalancedTensorProduct R A M N →ₗ[R] TauCeti.BalancedTensorProduct R A M' N :=
  TauCeti.BalancedTensorProduct.map (f.restrictScalars R) LinearMap.id
    (fun a m ↦ f.map_smul (op a) m) (fun _ _ ↦ rfl)

/-- **0.7** Base change along `R → R' → A`: the `R`-linear equivalence onto
`RestrictScalars R R' (M ⊗_{A} N)` with `m ⊗ n ↦ m ⊗ n`. -/
theorem exists_changeBaseLinearEquiv (R' : Type*) [CommRing R'] [Algebra R R'] [Algebra R' A]
    [IsScalarTower R R' A] [Module R' M] [IsScalarTower R' Aᵐᵒᵖ M] [IsScalarTower R R' M]
    [Module R' N] [IsScalarTower R' A N] [IsScalarTower R R' N] :
    ∃ e : TauCeti.BalancedTensorProduct R A M N ≃ₗ[R]
        RestrictScalars R R' (TauCeti.BalancedTensorProduct R' A M N),
      ∀ (m : M) (n : N), e (TauCeti.BalancedTensorProduct.tmul R A m n) =
        (RestrictScalars.addEquiv R R' _).symm (TauCeti.BalancedTensorProduct.tmul R' A m n) :=
  sorry

/-- **0.7** The additive form of base change, and its specialization along `ℤ → R`. -/
theorem exists_changeBaseAddEquiv (R' : Type*) [CommRing R'] [Algebra R R'] [Algebra R' A]
    [IsScalarTower R R' A] [Module R' M] [IsScalarTower R' Aᵐᵒᵖ M] [IsScalarTower R R' M]
    [Module R' N] [IsScalarTower R' A N] [IsScalarTower R R' N] :
    ∃ e : TauCeti.BalancedTensorProduct R A M N ≃+ TauCeti.BalancedTensorProduct R' A M N,
      ∀ (m : M) (n : N), e (TauCeti.BalancedTensorProduct.tmul R A m n) =
        TauCeti.BalancedTensorProduct.tmul R' A m n := by
  obtain ⟨e, he⟩ := exists_changeBaseLinearEquiv R (A := A) (M := M) (N := N) R'
  exact ⟨e.toAddEquiv.trans (RestrictScalars.addEquiv R R' _), fun m n ↦ by simp [he]⟩

theorem exists_intAddEquiv :
    ∃ e : TauCeti.BalancedTensorProduct ℤ A M N ≃+ TauCeti.BalancedTensorProduct R A M N,
      ∀ (m : M) (n : N), e (TauCeti.BalancedTensorProduct.tmul ℤ A m n) =
        TauCeti.BalancedTensorProduct.tmul R A m n :=
  exists_changeBaseAddEquiv ℤ (A := A) (M := M) (N := N) R

end Maps

/-- **0.7** Balanced tensor product bifunctor `ModuleCat Aᵐᵒᵖ ⥤ ModuleCat A ⥤ ModuleCat R`. -/
noncomputable def functor (R : Type t) [CommRing R] (A : Type u) [Ring A] [Algebra R A] :
    ModuleCat.{v} Aᵐᵒᵖ ⥤ ModuleCat.{v} A ⥤ ModuleCat.{v} R :=
  letI : ∀ M : ModuleCat.{v} Aᵐᵒᵖ, Module R M := fun M ↦ Module.compHom M (algebraMap R Aᵐᵒᵖ)
  letI : ∀ N : ModuleCat.{v} A, Module R N := fun N ↦ Module.compHom N (algebraMap R A)
  { obj M :=
      { obj N := ModuleCat.of R (TauCeti.BalancedTensorProduct R A M N)
        map g := ModuleCat.ofHom (TauCeti.BalancedTensorProduct.map LinearMap.id
          { toFun := g, map_add' := map_add _, map_smul' := sorry } (fun _ _ ↦ rfl)
          (fun a n ↦ g.hom.map_smul a n))
        map_id := sorry
        map_comp := sorry }
    map f :=
      { app N := ModuleCat.ofHom (TauCeti.BalancedTensorProduct.map
          { toFun := f, map_add' := map_add _, map_smul' := sorry } LinearMap.id
          (fun a m ↦ f.hom.map_smul (op a) m) (fun _ _ ↦ rfl))
        naturality := sorry }
    map_id := sorry
    map_comp := sorry }

instance (R : Type t) [CommRing R] (A : Type u) [Ring A] [Algebra R A] (M : ModuleCat.{v} Aᵐᵒᵖ) :
    ((functor R A).obj M).Additive := sorry

/-- **0.7** The right `A`-action `(f • a)(n) = f(a • n)` on `Hom_R(N, X)`. -/
@[instance_reducible]
noncomputable def homRightModule (R : Type t) [CommRing R] (A : Type u) [Ring A] [Algebra R A]
    (N : Type v) [AddCommGroup N] [Module A N] [Module R N] [IsScalarTower R A N] (X : Type*)
    [AddCommGroup X] [Module R X] : Module Aᵐᵒᵖ (N →ₗ[R] X) :=
  { smul a f := f.comp (addToLin (DistribSMul.toAddMonoidHom N a.unop) sorry)
    one_smul := sorry, mul_smul := sorry, smul_zero := sorry, smul_add := sorry,
    add_smul := sorry, zero_smul := sorry }

/-- **0.7** `Hom_R(N, -) : ModuleCat R ⥤ ModuleCat Aᵐᵒᵖ`, right adjoint to `- ⊗_A N`. -/
noncomputable def homRight (R : Type t) [CommRing R] (A : Type u) [Ring A] [Algebra R A]
    (N : ModuleCat.{v} A) : ModuleCat.{v} R ⥤ ModuleCat.{v} Aᵐᵒᵖ :=
  letI : Module R N := Module.compHom N (algebraMap R A)
  haveI : IsScalarTower R A N := IsScalarTower.of_algebraMap_smul fun _ _ ↦ rfl
  { obj X := letI := homRightModule R A N X
      ModuleCat.of Aᵐᵒᵖ (N →ₗ[R] X)
    map {X Y} g := letI := homRightModule R A N X
      letI := homRightModule R A N Y
      ModuleCat.ofHom (addToLin (LinearMap.llcomp R N X Y g.hom).toAddMonoidHom sorry)
    map_id := sorry
    map_comp := sorry }

/-- **0.7** Comparison between the coend tensor over `SingleObj Aᵐᵒᵖ` and `M ⊗_A N`. -/
theorem nonempty_tensorObjSingleObjIso {A : Type u} [Ring A] [Small.{v} A]
    (M : ModuleCat.{v} Aᵐᵒᵖ) (N : ModuleCat.{v} A) :
    Nonempty (ModCat.tensorObj ((moduleCatMulOppositeEquivModCatOp.{v} A).functor.obj M)
        ((moduleCatEquivModCat.{v} A).functor.obj N) ≅
      AddCommGrpCat.of (TauCeti.BalancedTensorProduct ℤ A M N)) := sorry

/-- **0.7** Bimodule tensor functor `M ⊗_B - : ModuleCat B ⥤ ModuleCat A` and Tensor–Hom
adjunction (lifting `TauCeti.BalancedTensorProduct.leftModule`). -/
noncomputable def bimodLeftFunctor (A : Type u) [Ring A] (B : Type t) [Ring B] (M : Type v)
    [AddCommGroup M] [Module A M] [Module Bᵐᵒᵖ M] [SMulCommClass A Bᵐᵒᵖ M] :
    ModuleCat.{v} B ⥤ ModuleCat.{v} A where
  obj N := letI := TauCeti.BalancedTensorProduct.leftModule (k := ℤ) (A := B) (M := M) (N := N) A
    ModuleCat.of A (TauCeti.BalancedTensorProduct ℤ B M N)
  map {N N'} g :=
    letI := TauCeti.BalancedTensorProduct.leftModule (k := ℤ) (A := B) (M := M) (N := N) A
    letI := TauCeti.BalancedTensorProduct.leftModule (k := ℤ) (A := B) (M := M) (N := N') A
    ModuleCat.ofHom (addToLin (TauCeti.BalancedTensorProduct.map LinearMap.id
      g.hom.toAddMonoidHom.toIntLinearMap (fun _ _ ↦ rfl)
      (fun a n ↦ g.hom.map_smul a n)).toAddMonoidHom sorry)
  map_id := sorry
  map_comp := sorry

/-- **0.7** The `B`-action `(b • f)(m) = f(m • b)` on `Hom_A(M, X)` for an `(A, B)`-bimodule `M`. -/
@[instance_reducible]
noncomputable def bimodHomModule (A : Type u) [Ring A] (B : Type t) [Ring B] (M : Type v)
    [AddCommGroup M] [Module A M] [Module Bᵐᵒᵖ M] [SMulCommClass A Bᵐᵒᵖ M] (X : Type*)
    [AddCommGroup X] [Module A X] : Module B (M →ₗ[A] X) where
  smul b f := f.comp
    ({ toFun m := MulOpposite.op b • m, map_add' := smul_add (MulOpposite.op b),
       map_smul' := fun a m ↦ (smul_comm a (MulOpposite.op b) m).symm } : M →ₗ[A] M)
  one_smul := sorry
  mul_smul := sorry
  smul_zero := sorry
  smul_add := sorry
  add_smul := sorry
  zero_smul := sorry

noncomputable def bimodHomRight (A : Type u) [Ring A] (B : Type t) [Ring B] (M : Type v)
    [AddCommGroup M] [Module A M] [Module Bᵐᵒᵖ M] [SMulCommClass A Bᵐᵒᵖ M] :
    ModuleCat.{v} A ⥤ ModuleCat.{v} B where
  obj X := letI := bimodHomModule A B M X
    ModuleCat.of B (M →ₗ[A] X)
  map {X Y} g := letI := bimodHomModule A B M X
    letI := bimodHomModule A B M Y
    ModuleCat.ofHom (addToLin
      { toFun f := g.hom.comp f, map_zero' := sorry, map_add' := sorry } sorry)
  map_id := sorry
  map_comp := sorry

theorem nonempty_bimodLeftHomAdjunction (A : Type u) [Ring A] (B : Type t) [Ring B] (M : Type v)
    [AddCommGroup M] [Module A M] [Module Bᵐᵒᵖ M] [SMulCommClass A Bᵐᵒᵖ M] :
    Nonempty (bimodLeftFunctor A B M ⊣ bimodHomRight A B M) := sorry

end BalancedTensorProduct

/-- **0.8** Dual `F ↦ F^E = Hom_R(F(-), E)` from `Mod C` to `Mod Cᵒᵖ`. -/
noncomputable abbrev ModCat.dual (R : Type*) [CommRing R] {C : Type u} [Category.{v} C]
    [Preadditive C] [Linear R C] (E : ModuleCat.{w} R) : (ModCat.{w} C)ᵒᵖ ⥤ ModCat.{w} Cᵒᵖ :=
  (ModCat.linearHomOpBifunctor R).flip.obj E

/-! ### 0.9 `proj C`, projective duality, and finite presentation -/

local instance fact_isRegular_aleph_one : Fact (Cardinal.aleph.{t} 1).IsRegular :=
  ⟨Cardinal.isRegular_aleph_one⟩
attribute [local instance] Cardinal.fact_isRegular_aleph0

section Proj

variable {C : Type u} [Category.{v} C] [Preadditive C]

variable (C) in
/-- **0.9** `proj C`: finitely generated projective modules in `Mod C`. -/
def ModCat.proj : ObjectProperty (ModCat.{v} C) :=
  fun F ↦ Projective F ∧ IsFinitelyGeneratedFunctor F.obj

instance : HasFiniteBiproducts (ModCat.proj C).FullSubcategory := sorry
instance : IsIdempotentComplete (ModCat.proj C).FullSubcategory := sorry

variable (C) in
/-- **0.9** Equivalence `proj C ≌ Karoubi (Mat_ C)` ([Mitchell, §1, p. 12]). -/
theorem ModCat.nonempty_projEquivKaroubiMat :
    Nonempty ((ModCat.proj C).FullSubcategory ≌
      CategoryTheory.Idempotents.Karoubi (Mat_ C)) := sorry

variable (C) in
/-- **0.9** Dual `Hom_{Mod C}(-, _C C_C) : (Mod C)ᵒᵖ ⥤ Mod Cᵒᵖ` on `Mod C` via the regular
bimodule (0.4, under `EssentiallySmall.{v} C`), while on `proj C` Yoneda gives smallness-free
`projDual : (proj C)ᵒᵖ ≌ proj Cᵒᵖ`. -/
noncomputable abbrev ModCat.dualRegular [EssentiallySmall.{v} C] :
    (ModCat.{v} C)ᵒᵖ ⥤ ModCat.{v} Cᵒᵖ :=
  ModCat.Bimod.homLeft (ModCat.regularBimod C)

instance (P : (ModCat.proj C).FullSubcategory) (F : ModCat.{v} C) : Small.{v} (P.obj ⟶ F) := sorry

/-- **0.9** `P^∨ = Hom_{Mod C}(P, Hom(-, ·))` in `Mod Cᵒᵖ`, for `P ∈ proj C` (no smallness on `C`:
`Hom(P, F)` is `v`-small because `P` is a retract of a finite sum of representables). -/
noncomputable def ModCat.projDualObj (P : (ModCat.proj C).FullSubcategory) : ModCat.{v} Cᵒᵖ :=
  ⟨{ obj X := AddCommGrpCat.of (Shrink.{v} (P.obj ⟶ (ModCat.yoneda C).obj X.unop.unop))
     map f := AddCommGrpCat.ofHom
       (shrinkMap (Preadditive.rightComp P.obj ((ModCat.yoneda C).map f.unop.unop)))
     map_id := sorry
     map_comp := sorry }, sorry⟩

variable (C) in
noncomputable def ModCat.projDualFunctor :
    (ModCat.proj C).FullSubcategoryᵒᵖ ⥤ (ModCat.proj Cᵒᵖ).FullSubcategory where
  obj P := ⟨ModCat.projDualObj P.unop, sorry⟩
  map α := ObjectProperty.homMk (ObjectProperty.homMk
    { app X := AddCommGrpCat.ofHom (shrinkMap (Preadditive.leftComp _ α.unop.hom))
      naturality := sorry })
  map_id := sorry
  map_comp := sorry

instance : (ModCat.projDualFunctor C).IsEquivalence := sorry

variable (C) in
noncomputable def ModCat.projDual :
    (ModCat.proj C).FullSubcategoryᵒᵖ ≌ (ModCat.proj Cᵒᵖ).FullSubcategory :=
  (ModCat.projDualFunctor C).asEquivalence

theorem ModCat.nonempty_homAddEquivTensorObjProjDual [EssentiallySmall.{v} C]
    (P : (ModCat.proj C).FullSubcategory) (F : ModCat.{v} C) :
    Nonempty ((P.obj ⟶ F) ≃+
      ModCat.tensorObj ((ModCat.projDual C).functor.obj (op P)).obj F) := sorry

/-- **0.9** Equivalence of cokernels in `proj C`, 0.1 finite presentation, and
`IsFinitelyPresentable`. -/
theorem ModCat.isFinitelyPresentedFunctor_tfae [EssentiallySmall.{v} C] (F : ModCat.{v} C) :
    List.TFAE
      [∃ (P₁ P₀ : (ModCat.proj C).FullSubcategory) (f : P₁ ⟶ P₀), Nonempty (cokernel f.hom ≅ F),
        IsFinitelyPresentedFunctor F.obj,
        IsFinitelyPresentable.{v} F] := sorry

instance [EssentiallySmall.{v} C] : IsLocallyFinitelyPresentable.{v} (ModCat.{v} C) := sorry

/-- **0.9** `ℵ₁`-presentable modules are cokernels of maps between countable sums of
representables. -/
theorem ModCat.isCardinalPresentable_aleph_one_iff [EssentiallySmall.{v} C] (F : ModCat.{v} C) :
    IsCardinalPresentable F (Cardinal.aleph.{v} 1) ↔
      ∃ (ι κ : Type) (_ : Countable ι) (_ : Countable κ) (Y : κ → C) (Z : ι → C)
        (f : (∐ fun j ↦ (ModCat.yoneda C).obj (Y j)) ⟶ ∐ fun i ↦ (ModCat.yoneda C).obj (Z i)),
        Nonempty (cokernel f ≅ F) := sorry

end Proj

instance {A : Type u} [Ring A] :
    HasFiniteBiproducts (TauCeti.finiteProjectiveModules A).FullSubcategory := sorry

/-! ### 0.10 Morita equivalence of categories and rings -/

section Morita

universe u₁ v₁ u₂ v₂

/-- **0.10** Restriction along `C ⥤ proj C` induces `Mod (proj C) ≌ Mod C` in every universe
([Mitchell, §1, p. 12]; [Simson, Thm. 5.6, p. 110]). -/
theorem ModCat.nonempty_modCatProjEquiv (C : Type u) [Category.{v} C] [Preadditive C] :
    Nonempty (ModCat.{w} (ModCat.proj C).FullSubcategory ≌ ModCat.{w} C) := sorry

/-- **0.10** Categorical Morita theorem equating `Mod C ≌ Mod D`, `proj C ≌ proj D`,
`Karoubi (Mat_ C) ≌ Karoubi (Mat_ D)`, and invertible bimodules ([Mitchell, §§1, 3, 6]). -/
theorem ModCat.morita_tfae (C : Type u₁) [Category.{v} C] [Preadditive C] [EssentiallySmall.{v} C]
    (D : Type u₂) [Category.{v} D] [Preadditive D] [EssentiallySmall.{v} D] :
    List.TFAE
      [Nonempty (ModCat.{v} C ≌ ModCat.{v} D),
        Nonempty ((ModCat.proj C).FullSubcategory ≌ (ModCat.proj D).FullSubcategory),
        Nonempty (CategoryTheory.Idempotents.Karoubi (Mat_ C) ≌
          CategoryTheory.Idempotents.Karoubi (Mat_ D)),
        ∃ (P : ModCat.Bimod.{v} D C) (Q : ModCat.Bimod.{v} C D),
          Nonempty (((ModCat.Bimod.tensor.obj Q).obj P) ≅ ModCat.regularBimod C) ∧
            Nonempty (((ModCat.Bimod.tensor.obj P).obj Q) ≅ ModCat.regularBimod D)] := sorry

open scoped ModuleCat.Algebra in
/-- **0.10, rings** Characterizations of `IsMoritaEquivalent R A B` via `finiteProjectiveModules`,
progenerators, full-idempotent matrix corners, and invertible `R`-central bimodules ([Lam-LMR,
§18]). -/
theorem isMoritaEquivalent_tfae (R : Type t) [CommRing R] (A : Type u) [Ring A] [Algebra R A]
    (B : Type u) [Ring B] [Algebra R B] :
    List.TFAE
      [IsMoritaEquivalent R A B,
        ∃ e : (TauCeti.finiteProjectiveModules A).FullSubcategory ≌
            (TauCeti.finiteProjectiveModules B).FullSubcategory, e.functor.Linear R,
        ∃ P : ModuleCat.{u} A, Module.Finite A P ∧ Module.Projective A P ∧ IsSeparator P ∧
          Nonempty (B ≃ₐ[R] (Module.End A P)ᵐᵒᵖ),
        ∃ (n : ℕ) (e : Matrix (Fin (n + 1)) (Fin (n + 1)) A) (he : IsIdempotentElem e),
          TwoSidedIdeal.span {e} = ⊤ ∧ Nonempty (B ≃ₐ[R] he.Corner),
        ∃ (P Q : Type u) (_ : AddCommGroup P) (_ : Module R P) (_ : Module B P)
            (_ : Module Aᵐᵒᵖ P) (_ : IsScalarTower R B P) (_ : IsScalarTower R Aᵐᵒᵖ P)
            (_ : SMulCommClass B Aᵐᵒᵖ P) (_ : AddCommGroup Q) (_ : Module R Q) (_ : Module A Q)
            (_ : Module Bᵐᵒᵖ Q) (_ : IsScalarTower R A Q) (_ : IsScalarTower R Bᵐᵒᵖ Q)
            (_ : SMulCommClass A Bᵐᵒᵖ Q),
          (letI := TauCeti.BalancedTensorProduct.leftModule (k := ℤ) (A := B) (M := Q) (N := P) A
           letI := TauCeti.BalancedTensorProduct.rightModule
             (k := ℤ) (A := B) (M := Q) (N := P) Aᵐᵒᵖ
           ∃ e₁ : TauCeti.BalancedTensorProduct ℤ B Q P ≃ₗ[A] A,
             ∀ (a : Aᵐᵒᵖ) z, e₁ (a • z) = a • e₁ z) ∧
          (letI := TauCeti.BalancedTensorProduct.leftModule (k := ℤ) (A := A) (M := P) (N := Q) B
           letI := TauCeti.BalancedTensorProduct.rightModule
             (k := ℤ) (A := A) (M := P) (N := Q) Bᵐᵒᵖ
           ∃ e₂ : TauCeti.BalancedTensorProduct ℤ A P Q ≃ₗ[B] B,
             ∀ (b : Bᵐᵒᵖ) z, e₂ (b • z) = b • e₂ z)] := sorry

end Morita

/-! ## Layer 1: `Tor` -/

/-! ### 1.1–1.3 Definition and balance -/

namespace ModCat

variable {C : Type u} [Category.{v} C] [Preadditive C]

section ScalarTor

variable [EssentiallySmall.{w} C]

/-- **1.1** `Tor^C_n(G, F)`: left derived functor of `G ⊗_C -` in the `Mod C` variable. -/
noncomputable def tor (n : ℕ) : ModCat.{w} Cᵒᵖ ⥤ ModCat.{w} C ⥤ AddCommGrpCat.{w} where
  obj G := (tensor.obj G).leftDerived n
  map g := NatTrans.leftDerived (tensor.map g) n

instance (n : ℕ) : (tor (C := C) n).Additive := sorry
instance (n : ℕ) (G : ModCat.{w} Cᵒᵖ) : ((tor (C := C) n).obj G).Additive := sorry

/-- **1.1** `r ∈ R` acts on `Tor_n(G, F)` through `Tor_n(G, r • 𝟙 F)`. -/
noncomputable instance (R : Type*) [CommRing R] [Linear R C] (n : ℕ) (G : ModCat.{w} Cᵒᵖ)
    (F : ModCat.{w} C) : Module R (((tor n).obj G).obj F) :=
  Module.compHom _
    ({ toFun r := (((tor n).obj G).map (r • 𝟙 F)).hom
       map_one' := sorry, map_mul' := sorry, map_zero' := sorry, map_add' := sorry } :
      R →+* AddMonoid.End (((tor n).obj G).obj F))

end ScalarTor

/-- **1.1** `R`-linear `Tor` bifunctor `Mod Cᵒᵖ ⥤ Mod C ⥤ ModuleCat R`. -/
noncomputable def linearTor [EssentiallySmall.{w} C] (R : Type*) [CommRing R] [Linear R C]
    (n : ℕ) : ModCat.{w} Cᵒᵖ ⥤ ModCat.{w} C ⥤ ModuleCat.{w} R where
  obj G := ((linearTensor R).obj G).leftDerived n
  map g := NatTrans.leftDerived ((linearTensor R).map g) n

section BimodTor

universe u₁ v₁ u₂ v₂

variable {D : Type u₁} [Category.{v₁} D] [Preadditive D]
  {E : Type u₂} [Category.{v₂} E] [Preadditive E]

/-- **1.1** Symmetric bimodule `Tor^C_n(M, N)` in `Bimod D E`, evaluating at `(d, e)` to
`Tor^C_n(M(d, -), N(-, e))`. -/
noncomputable def Bimod.tor [EssentiallySmall.{w} C] (n : ℕ) :
    ModCat.Bimod.{w} D C ⥤ ModCat.Bimod.{w} C E ⥤ ModCat.Bimod.{w} D E :=
  Bimod.lift (ModCat.tor n)

end BimodTor

/-- **1.3** Balance isomorphism `Tor^C_n(G, F) ≅ Tor^{Cᵒᵖ}_n(F, G)` ([Weibel, Thm. 2.7.2]). -/
theorem nonempty_torBalanceIso [EssentiallySmall.{w} C] (n : ℕ) :
    Nonempty ((tor (C := C) n : ModCat.{w} Cᵒᵖ ⥤ ModCat.{w} C ⥤ AddCommGrpCat.{w}) ≅
      ((ModCat.opOpEquiv C).functor ⋙ tor (C := Cᵒᵖ) n).flip) := sorry

end ModCat

section BalancedTor

variable (R : Type t) [CommRing R] (A : Type u) [Ring A] [Algebra R A] [Small.{v} A]

/-- **1.1, rings** `Tor_n^A(M, N)`, derived in the left-module variable `N`. -/
noncomputable def BalancedTor (n : ℕ) :
    ModuleCat.{v} Aᵐᵒᵖ ⥤ ModuleCat.{v} A ⥤ ModuleCat.{v} R where
  obj M := ((BalancedTensorProduct.functor R A).obj M).leftDerived n
  map f := NatTrans.leftDerived ((BalancedTensorProduct.functor R A).map f) n

/-- **1.1, rings** Comparison between `BalancedTor ℤ A n` and `ModCat.tor` over `SingleObj Aᵐᵒᵖ`. -/
theorem nonempty_balancedTorIsoTorSingleObj (n : ℕ) :
    Nonempty (BalancedTor.{v} ℤ A n ⋙
        (Functor.whiskeringRight _ _ _).obj (forget₂ (ModuleCat.{v} ℤ) AddCommGrpCat.{v}) ≅
      (moduleCatMulOppositeEquivModCatOp.{v} A).functor ⋙
        ModCat.tor (C := SingleObj Aᵐᵒᵖ) n ⋙
          (Functor.whiskeringLeft _ _ _).obj (moduleCatEquivModCat.{v} A).functor) := sorry

/-- **1.3, rings** Balance swap `Tor_n^A(M, N) ≅ Tor_n^{Aᵐᵒᵖ}(N, M)`. -/
theorem nonempty_balancedTorSwapIso (n : ℕ) :
    Nonempty (BalancedTor.{v} R A n ≅
      (ModuleCat.restrictScalars.{v} (RingEquiv.opOp A).symm.toRingHom ⋙
        BalancedTor.{v} R Aᵐᵒᵖ n).flip) := sorry

end BalancedTor

section BalancedTorBimod

variable {B : Type u} [Ring B] [Small.{v} B] {M N : Type v}
  [AddCommGroup M] [Module Bᵐᵒᵖ M] [AddCommGroup N] [Module B N]

/-- **1.1, rings** Outer `(S, T)`-bimodule actions on `Tor_n^B(M, N)`, matching
`TauCeti.BalancedTensorProduct.leftModule`, `rightModule`, and `outerSMulCommClass`. -/
@[instance_reducible]
noncomputable def BalancedTor.leftModule (S : Type*) [Semiring S] [Module S M]
    [SMulCommClass S Bᵐᵒᵖ M] (n : ℕ) :
    Module S (((BalancedTor.{v} ℤ B n).obj (ModuleCat.of Bᵐᵒᵖ M)).obj (ModuleCat.of B N)) :=
  Module.compHom _
    ({ toFun s := (((BalancedTor.{v} ℤ B n).map (ModuleCat.ofHom
          { toFun := (s • ·), map_add' := smul_add s, map_smul' := fun b m ↦ smul_comm s b m } :
            ModuleCat.of Bᵐᵒᵖ M ⟶ ModuleCat.of Bᵐᵒᵖ M)).app (ModuleCat.of B N)).hom.toAddMonoidHom
       map_one' := sorry, map_mul' := sorry, map_zero' := sorry, map_add' := sorry } :
      S →+* AddMonoid.End _)

@[instance_reducible]
noncomputable def BalancedTor.rightModule (T : Type*) [Semiring T] [Module T N]
    [SMulCommClass B T N] (n : ℕ) :
    Module T (((BalancedTor.{v} ℤ B n).obj (ModuleCat.of Bᵐᵒᵖ M)).obj (ModuleCat.of B N)) :=
  Module.compHom _
    ({ toFun t := (((BalancedTor.{v} ℤ B n).obj (ModuleCat.of Bᵐᵒᵖ M)).map (ModuleCat.ofHom
          { toFun := (t • ·), map_add' := smul_add t,
            map_smul' := fun b x ↦ (smul_comm b t x).symm } :
            ModuleCat.of B N ⟶ ModuleCat.of B N)).hom.toAddMonoidHom
       map_one' := sorry, map_mul' := sorry, map_zero' := sorry, map_add' := sorry } :
      T →+* AddMonoid.End _)

theorem BalancedTor.outerSMulCommClass (S T : Type*) [Semiring S] [Semiring T]
    [Module S M] [SMulCommClass S Bᵐᵒᵖ M] [Module T N] [SMulCommClass B T N] (n : ℕ) :
    letI := BalancedTor.leftModule (B := B) (M := M) (N := N) S n
    letI := BalancedTor.rightModule (B := B) (M := M) (N := N) T n
    SMulCommClass S T
      (((BalancedTor.{v} ℤ B n).obj (ModuleCat.of Bᵐᵒᵖ M)).obj (ModuleCat.of B N)) := sorry

end BalancedTorBimod

/-! ### 1.4–1.6 `Tor` of the transpose, `Tor`–`Ext` duality, and comparisons -/

section TransposeAndDuality

variable {C : Type u} [Category.{v} C] [Preadditive C]

variable (C) in
/-- **1.4** `ModCat`-level object property of finitely presented modules, and its projective-stable
category `underline{mod C}` modulo maps factoring through `proj C` ([AB, §2.1]). -/
def ModCat.mod : ObjectProperty (ModCat.{v} C) :=
  fun F ↦ IsFinitelyPresentedFunctor F.obj

variable (C) in
def ModCat.projInMod : ObjectProperty (ModCat.mod C).FullSubcategory :=
  fun X ↦ ModCat.proj C X.obj

variable (C) in
abbrev ModCat.StableFP := (ModCat.projInMod C).factorIdeal.Quotient

variable (C) in
/-- **1.4** Fully faithful inclusion `underline{mod C} ⥤ underline{Mod C}` and Auslander–Bridger
transpose duality `(underline{mod C})ᵒᵖ ≌ underline{mod Cᵒᵖ}` over any preadditive `C`. -/
noncomputable def ModCat.stableFPToProjectiveStable :
    ModCat.StableFP C ⥤
      TauCeti.ExactStructure.ProjectiveStableCategory
        (TauCeti.ExactStructure.abelian (ModCat.{v} C)) :=
  (ModCat.projInMod C).factorIdeal.lift
    ((ModCat.mod C).ι ⋙
      TauCeti.ExactStructure.projectiveStableFunctor
        (TauCeti.ExactStructure.abelian (ModCat.{v} C))) sorry

noncomputable instance : (ModCat.stableFPToProjectiveStable C).Full := sorry
instance : (ModCat.stableFPToProjectiveStable C).Faithful := sorry

/-- **1.4** Class `[coker f]` in `underline{mod C}` of a presentation `f : P₁ ⟶ P₀` in `proj C`. -/
noncomputable def ModCat.StableFP.ofPresentation {P₁ P₀ : (ModCat.proj C).FullSubcategory}
    (f : P₁ ⟶ P₀) : ModCat.StableFP C :=
  (ModCat.projInMod C).factorIdeal.quotientFunctor.obj ⟨cokernel f.hom, sorry⟩


/-- **1.4** Auslander–Bridger transpose `Tr f = coker(P₀^∨ → P₁^∨)` in `Mod Cᵒᵖ`, and its bridge
with `stableTransposeEquivalence` in `underline{mod Cᵒᵖ}`. -/
noncomputable def ModCat.transpose {P₁ P₀ : (ModCat.proj C).FullSubcategory} (f : P₁ ⟶ P₀) :
    ModCat.{v} Cᵒᵖ :=
  cokernel ((ModCat.projDual C).functor.map f.op).hom

variable (C) in
/-- **1.4** Auslander–Bridger duality: one equivalence `(underline{mod C})ᵒᵖ ≌ underline{mod Cᵒᵖ}`
sending the class of every presented cokernel to the class of the cokernel of its dual
presentation ([AB, §2.1]). -/
theorem ModCat.exists_stableTransposeEquivalence :
    ∃ E : (ModCat.StableFP C)ᵒᵖ ≌ ModCat.StableFP Cᵒᵖ,
      ∀ {P₁ P₀ : (ModCat.proj C).FullSubcategory} (f : P₁ ⟶ P₀),
        Nonempty (E.functor.obj (op (ModCat.StableFP.ofPresentation f)) ≅
          ModCat.StableFP.ofPresentation ((ModCat.projDual C).functor.map f.op)) := sorry

/-- **1.4** `stable Hom(coker f, N) ≃+ Tor_1(Tr f, N)`, as one family natural in `N`
([Auslander78, I, Prop. 3.2]). -/
theorem ModCat.exists_stableHomEquivTorTranspose [EssentiallySmall.{v} C]
    {P₁ P₀ : (ModCat.proj C).FullSubcategory} (f : P₁ ⟶ P₀) :
    ∃ η : ∀ N : ModCat.{v} C,
        ((TauCeti.ExactStructure.projectiveStableFunctor
            (TauCeti.ExactStructure.abelian (ModCat.{v} C))).obj (cokernel f.hom) ⟶
          (TauCeti.ExactStructure.projectiveStableFunctor
            (TauCeti.ExactStructure.abelian (ModCat.{v} C))).obj N) ≃+
          ((ModCat.tor 1).obj (ModCat.transpose f)).obj N,
      ∀ {N N' : ModCat.{v} C} (g : N ⟶ N')
        (φ : (TauCeti.ExactStructure.projectiveStableFunctor
            (TauCeti.ExactStructure.abelian (ModCat.{v} C))).obj (cokernel f.hom) ⟶
          (TauCeti.ExactStructure.projectiveStableFunctor
            (TauCeti.ExactStructure.abelian (ModCat.{v} C))).obj N),
        η N' (φ ≫ (TauCeti.ExactStructure.projectiveStableFunctor
            (TauCeti.ExactStructure.abelian (ModCat.{v} C))).map g) =
          (((ModCat.tor 1).obj (ModCat.transpose f)).map g) (η N φ) := sorry

/-- **1.4** Projectivity criterion from vanishing of `Tor_1(Tr X, X)` ([CB, §1.3, p. 1646]). -/
theorem ModCat.projective_of_isZero_tor_transpose [EssentiallySmall.{v} C]
    {P₁ P₀ : (ModCat.proj C).FullSubcategory} (f : P₁ ⟶ P₀)
    (h : IsZero (((ModCat.tor 1).obj (ModCat.transpose f)).obj (cokernel f.hom))) :
    Projective (cokernel f.hom) := sorry

open scoped ModuleCat.Algebra in
/-- **1.4, rings** `stable Hom_A(X, N) ≃ₗ[R] Tor_1^A(Tr X, N)` for `AuslanderReitenTranspose`. -/
theorem nonempty_stableHomEquivBalancedTorTranspose (R : Type t) [CommRing R] {A : Type u}
    [Ring A] [Algebra R A] {P₀ P₁ : Type u} [AddCommGroup P₀] [Module A P₀] [Module.Finite A P₀]
    [Module.Projective A P₀] [AddCommGroup P₁] [Module A P₁] [Module.Finite A P₁]
    [Module.Projective A P₁] {X : ModuleCat.{u} A} {f : P₁ →ₗ[A] P₀} {π : P₀ →ₗ[A] X}
    (hfπ : Function.Exact f π) (hπ : Function.Surjective π) (N : ModuleCat.{u} A) :
    Nonempty (((TauCeti.ExactStructure.projectiveStableFunctor
        (TauCeti.ExactStructure.abelian (ModuleCat.{u} A))).obj X ⟶
      (TauCeti.ExactStructure.projectiveStableFunctor
        (TauCeti.ExactStructure.abelian (ModuleCat.{u} A))).obj N) ≃ₗ[R]
      ((BalancedTor R A 1).obj (ModuleCat.of Aᵐᵒᵖ (TauCeti.AuslanderReitenTranspose f))).obj N) :=
  sorry

/-- **1.5** Bifunctorial `Tor`–`Ext` duality `Hom_R(Tor^C_n(G, F), E) ≅ Ext^n(G, F^E)` for injective
`E` ([CE, VI, Prop. 5.1]). -/
theorem ModCat.nonempty_torExtDualityNatIso [EssentiallySmall.{w} C] (R : Type*) [CommRing R]
    [Linear R C] (E : ModuleCat.{w} R) [Injective E] (n : ℕ) :
    Nonempty ((ModCat.linearTor (C := C) R n).op ⋙ Functor.opHom (ModCat.{w} C) (ModuleCat.{w} R) ⋙
        (Functor.whiskeringRight _ _ _).obj ((linearYoneda R (ModuleCat.{w} R)).obj E) ≅
      Abelian.linearExtFunctor R (ModCat.{w} Cᵒᵖ) n ⋙
        (Functor.whiskeringLeft _ _ _).obj (ModCat.dual (C := C) R E)) := sorry

open scoped ModuleCat.Algebra in
/-- **1.5, rings** `Hom_R(Tor_n^A(M, N), E) ≃ₗ[R] Ext^n_{Aᵐᵒᵖ}(M, Hom_R(N, E))`
([Lambek, p. 241]). -/
theorem nonempty_balancedTorExtDualityEquiv {R : Type t} [CommRing R] {A : Type u} [Ring A]
    [Algebra R A] [Small.{v} A] (E : ModuleCat.{v} R) [Injective E]
    (M : ModuleCat.{v} Aᵐᵒᵖ) (N : ModuleCat.{v} A) (n : ℕ) :
    Nonempty (((((BalancedTor R A n).obj M).obj N) ⟶ E) ≃ₗ[R]
      Abelian.Ext.{v} M ((BalancedTensorProduct.homRight R A N).obj E) n) := sorry

end TransposeAndDuality

/-- **1.6** Over a commutative ring, `BalancedTor R R n` agrees with `CategoryTheory.Tor`. -/
theorem nonempty_balancedTorIsoTor (R : Type u) [CommRing R] (n : ℕ) :
    Nonempty (ModuleCat.restrictScalars.{u} (RingEquiv.toOpposite R).symm.toRingHom ⋙
        BalancedTor.{u} R R n ≅
      Tor (ModuleCat.{u} R) n) := sorry

/-- **1.6** Symmetry `Tor (ModuleCat R) n ≅ Tor' (ModuleCat R) n` from balance: the `ModuleCat R`
case of SpectralSequencesAndConvergencePartII §4.1's `nonempty_tor_iso_tor'`, restated as that
supplier's statement and not a target of this roadmap. -/
theorem nonempty_torIsoTor' (R : Type u) [CommRing R] (n : ℕ) :
    Nonempty (Tor (ModuleCat.{u} R) n ≅ Tor' (ModuleCat.{u} R) n) := sorry

section BalancedTorBase

variable (R : Type t) [CommRing R] {A : Type u} [Ring A] [Algebra R A] [Small.{v} A]

/-- **1.6** Base-change isomorphism for `BalancedTor` along `R → R' → A`. -/
theorem nonempty_balancedTorRestrictScalarsIso (R' : Type*) [CommRing R'] [Algebra R R']
    [Algebra R' A] [IsScalarTower R R' A] (n : ℕ) (M : ModuleCat.{v} Aᵐᵒᵖ) (N : ModuleCat.{v} A) :
    Nonempty ((ModuleCat.restrictScalars (algebraMap R R')).obj
        (((BalancedTor R' A n).obj M).obj N) ≅
      ((BalancedTor R A n).obj M).obj N) := sorry

theorem nonempty_balancedTorIntIso (n : ℕ) (M : ModuleCat.{v} Aᵐᵒᵖ) (N : ModuleCat.{v} A) :
    Nonempty ((ModuleCat.restrictScalars (algebraMap ℤ R)).obj (((BalancedTor R A n).obj M).obj N) ≅
      ((BalancedTor ℤ A n).obj M).obj N) :=
  nonempty_balancedTorRestrictScalarsIso ℤ R n M N

end BalancedTorBase

/-- **1.6** `Tor_1^A(A ⧸ I, A ⧸ K) ≃+ (I ∩ K) ⧸ IK` ([Weibel, Exer. 3.1.3]). -/
theorem nonempty_balancedTorOneQuotientEquiv (A : Type u) [Ring A] (I : Submodule Aᵐᵒᵖ A)
    (K : Ideal A) :
    Nonempty ((((BalancedTor.{u} ℤ A 1).obj (ModuleCat.of Aᵐᵒᵖ (A ⧸ I))).obj
        (ModuleCat.of A (A ⧸ K))) ≃+
      ↥(I.toAddSubgroup ⊓ K.toAddSubgroup) ⧸
        (AddSubgroup.closure (Set.image2 (· * ·) (I : Set A) (K : Set A))).addSubgroupOf
          (I.toAddSubgroup ⊓ K.toAddSubgroup)) := sorry

/-! ### 1.7 Categories with finitely many objects -/

/-- **1.7** Category algebra `⊕_{x,y} Hom(x, y)` with diagrammatic product ([Mitchell, §7]). -/
def CategoryAlgebra (C : Type u) [Category.{v} C] [Preadditive C] : Type (max u v) :=
  Π₀ p : C × C, (p.1 ⟶ p.2)

section CategoryAlgebra

variable (C : Type u) [Category.{v} C] [Preadditive C]

instance : DFunLike (CategoryAlgebra C) (C × C) fun p ↦ p.1 ⟶ p.2 :=
  inferInstanceAs (DFunLike (Π₀ p : C × C, (p.1 ⟶ p.2)) (C × C) fun p ↦ p.1 ⟶ p.2)
instance : AddCommGroup (CategoryAlgebra C) :=
  inferInstanceAs (AddCommGroup (Π₀ p : C × C, (p.1 ⟶ p.2)))
instance (R : Type*) [CommRing R] [Linear R C] : Module R (CategoryAlgebra C) :=
  inferInstanceAs (Module R (Π₀ p : C × C, (p.1 ⟶ p.2)))

/-- **1.7** Product `(a * b)(x, z) = ∑_y a(x, y) ≫ b(y, z)`. -/
noncomputable instance : Mul (CategoryAlgebra C) where
  mul a b := by
    classical
    exact DFinsupp.sum (show Π₀ p : C × C, (p.1 ⟶ p.2) from a) fun p f ↦
      DFinsupp.sum (show Π₀ p : C × C, (p.1 ⟶ p.2) from b) fun q g ↦
        if h : p.2 = q.1 then DFinsupp.single (p.1, q.2) (f ≫ eqToHom h ≫ g) else 0

noncomputable instance : NonUnitalRing (CategoryAlgebra C) :=
  { (inferInstance : AddCommGroup (CategoryAlgebra C)),
    (inferInstance : Mul (CategoryAlgebra C)) with
    left_distrib := sorry, right_distrib := sorry,
    zero_mul := sorry, mul_zero := sorry, mul_assoc := sorry }

variable [Finite C]

/-- **1.7** Unit `1 = ∑_x 𝟙 x` for finitely many objects. -/
noncomputable instance : One (CategoryAlgebra C) :=
  ⟨by
    classical
    haveI := Fintype.ofFinite C
    exact (∑ x : C, DFinsupp.single (x, x) (𝟙 x) : Π₀ p : C × C, (p.1 ⟶ p.2))⟩

noncomputable instance : Ring (CategoryAlgebra C) :=
  { (inferInstance : NonUnitalRing (CategoryAlgebra C)),
    (inferInstance : One (CategoryAlgebra C)) with
    one_mul := sorry, mul_one := sorry,
    natCast := fun n ↦ n • (1 : CategoryAlgebra C),
    natCast_zero := zero_nsmul _, natCast_succ := fun n ↦ succ_nsmul _ n,
    intCast := fun n ↦ n • (1 : CategoryAlgebra C),
    intCast_ofNat := fun n ↦ natCast_zsmul _ n, intCast_negSucc := fun n ↦ negSucc_zsmul _ n }

noncomputable instance (R : Type*) [CommRing R] [Linear R C] : Algebra R (CategoryAlgebra C) :=
  { (inferInstance : Module R (CategoryAlgebra C)) with
    algebraMap :=
      { toFun := fun r ↦ r • (1 : CategoryAlgebra C),
        map_one' := one_smul R (1 : CategoryAlgebra C), map_mul' := sorry,
        map_zero' := zero_smul R (1 : CategoryAlgebra C),
        map_add' := fun r s ↦ add_smul r s (1 : CategoryAlgebra C) },
    commutes' := sorry, smul_def' := sorry }

instance [LocallySmall.{w} C] : Small.{w} (CategoryAlgebra C) := by
  unfold CategoryAlgebra; infer_instance

/-- **1.7** Morita equivalences for `[Finite C]`, chosen once together with the `Tor` comparison in
every degree ([Mitchell, Thm. 7.1 and p. 37]). -/
theorem exists_torCategoryAlgebraIso [EssentiallySmall.{w} C] :
    ∃ (E₁ : ModCat.{w} C ≌ ModuleCat.{w} (CategoryAlgebra C))
      (E₂ : ModCat.{w} Cᵒᵖ ≌ ModuleCat.{w} (CategoryAlgebra C)ᵐᵒᵖ), ∀ n : ℕ,
        Nonempty ((ModCat.tor (C := C) n : ModCat.{w} Cᵒᵖ ⥤ ModCat.{w} C ⥤ AddCommGrpCat.{w}) ≅
          E₂.functor ⋙
            (BalancedTor ℤ (CategoryAlgebra C) n ⋙
              (Functor.whiskeringRight _ _ _).obj (forget₂ (ModuleCat.{w} ℤ) AddCommGrpCat.{w})) ⋙
            (Functor.whiskeringLeft _ _ _).obj E₁.functor) := sorry

end CategoryAlgebra

/-- **1.7** Ring isomorphism `CategoryAlgebra (SingleObj Aᵐᵒᵖ) ≃+* A`. -/
noncomputable def categoryAlgebraSingleObjRingEquiv (A : Type u) [Ring A] :
    CategoryAlgebra (SingleObj Aᵐᵒᵖ) ≃+* A :=
  RingEquiv.ofBijective
    ({ toFun a := MulOpposite.unop
         (show Aᵐᵒᵖ from a (SingleObj.star Aᵐᵒᵖ, SingleObj.star Aᵐᵒᵖ))
       map_one' := sorry, map_mul' := sorry, map_zero' := sorry, map_add' := sorry } :
      CategoryAlgebra (SingleObj Aᵐᵒᵖ) →+* A)
    sorry

@[simp]
theorem categoryAlgebraSingleObjRingEquiv_apply (A : Type u) [Ring A]
    (a : CategoryAlgebra (SingleObj Aᵐᵒᵖ)) :
    categoryAlgebraSingleObjRingEquiv A a =
      MulOpposite.unop (a (SingleObj.star Aᵐᵒᵖ, SingleObj.star Aᵐᵒᵖ)) := rfl

/-! ## Layer 2: flat modules and flat functors -/

/-! ### 2.1–2.2 Definition and tests -/

section FlatDefAndTests

open ModCat

variable {C : Type u} [Category.{v} C] [Preadditive C]

noncomputable def ModCat.yonedaSpan {X : C} {n : ℕ} {Y : Fin n → C} (β : ∀ j, Y j ⟶ X) :
    Subobject ((ModCat.yoneda C).obj X) :=
  imageSubobject (Limits.Sigma.desc fun j ↦ (ModCat.yoneda C).map (β j))

noncomputable abbrev ModCat.coyonedaSpan {X : C} {n : ℕ} {Y : Fin n → C} (β : ∀ j, X ⟶ Y j) :
    Subobject ((ModCat.yoneda Cᵒᵖ).obj (op X)) :=
  ModCat.yonedaSpan (C := Cᵒᵖ) (X := op X) (Y := fun j ↦ op (Y j)) fun j ↦ (β j).op

/-- **2.1** Triviality of a relation `∑_j F(β_j)(y_j) = 0` in `F(X)`. -/
def ModCat.IsTrivialRelation (F : ModCat.{w} C) {X : C} {n : ℕ} {Y : Fin n → C}
    (β : ∀ j, X ⟶ Y j) (y : ∀ j, F.obj.obj (op (Y j))) : Prop :=
  ∃ (m : ℕ) (Z : Fin m → C) (z : ∀ i, F.obj.obj (op (Z i))) (α : ∀ i j, Y j ⟶ Z i),
    (∀ j, y j = ∑ i, (F.obj.map (α i j).op).hom (z i)) ∧ ∀ i, ∑ j, β j ≫ α i j = 0

/-- **2.1** Equational flatness of `F : Mod C` ([OR, Thm. 3.2 (4)]), requiring no smallness. -/
class ModCat.Flat (F : ModCat.{w} C) : Prop where
  isTrivialRelation ⦃X : C⦄ ⦃n : ℕ⦄ ⦃Y : Fin n → C⦄ (β : ∀ j, X ⟶ Y j)
    (y : ∀ j, F.obj.obj (op (Y j))) :
    ∑ j, (F.obj.map (β j).op).hom (y j) = 0 → F.IsTrivialRelation β y

instance ModCat.flat_yoneda_obj (X : C) : ((ModCat.yoneda C).obj X).Flat := sorry

/-- **2.2** Baer's extension condition and injectivity criterion in `Mod C`. -/
def ModCat.Baer (E : ModCat.{v} C) : Prop :=
  ∀ (X : C) (I : Subobject ((ModCat.yoneda C).obj X)) (φ : (I : ModCat.{v} C) ⟶ E),
    ∃ ψ : (ModCat.yoneda C).obj X ⟶ E, I.arrow ≫ ψ = φ

theorem ModCat.baer_iff_injective (E : ModCat.{v} C) : ModCat.Baer E ↔ Injective E := sorry

variable [EssentiallySmall.{v} C]

/-- **2.2** Equational, ideal, monomorphism, `Tor_1`, and Lambek characterizations of flatness
([OR, Thm. 3.2]; [St, Thm. 3]; [Lambek, p. 239]). -/
theorem ModCat.flat_tfae (F : ModCat.{v} C) :
    List.TFAE
      [F.Flat,
        ∀ ⦃X : C⦄ ⦃n : ℕ⦄ ⦃Y : Fin n → C⦄ (β : ∀ j, X ⟶ Y j),
          Mono ((tensor.map (ModCat.coyonedaSpan β).arrow).app F),
        ∀ (X : C) (I : Subobject ((ModCat.yoneda Cᵒᵖ).obj (op X))),
          Mono ((tensor.map I.arrow).app F),
        ∀ ⦃G G' : ModCat.{v} Cᵒᵖ⦄ (i : G ⟶ G'), Mono i → Mono ((tensor.map i).app F),
        ∀ G : ModCat.{v} Cᵒᵖ, IsZero (((tor 1).obj G).obj F),
        ∀ ⦃X : C⦄ ⦃n : ℕ⦄ ⦃Y : Fin n → C⦄ (β : ∀ j, X ⟶ Y j),
          IsZero (((tor 1).obj (cokernel (ModCat.coyonedaSpan β).arrow)).obj F),
        ∀ E : ModuleCat.{v} ℤ, Injective E → IsCoseparator E →
          Injective ((ModCat.dual ℤ E).obj (op F))] := sorry

/-- **2.2, Lambek's criterion** Over an `R`-linear essentially small category `C`, `F` is flat iff
`F^E` is injective for a fixed injective cogenerator `E` of `ModuleCat R` ([Lambek, p. 239]). -/
theorem ModCat.flat_iff_injective_dual (R : Type*) [CommRing R] [Linear R C]
    (E : ModuleCat.{v} R) [Injective E] (hE : IsCoseparator E) (F : ModCat.{v} C) :
    F.Flat ↔ Injective ((ModCat.dual R E).obj (op F)) := sorry

/-- **2.2** Finitely presented flat modules are projective ([Lazard, Cor. 1.4]; [CB, §1.3]). -/
theorem ModCat.Flat.projective_of_isFinitelyPresentedFunctor (F : ModCat.{v} C) [F.Flat]
    (hF : IsFinitelyPresentedFunctor F.obj) : Projective F := sorry

/-- **2.2** `Tor` commutes with filtered colimits in the `Mod C` variable ([OR, Lemma 3.1]). -/
instance ModCat.preservesFilteredColimits_tor_obj (G : ModCat.{v} Cᵒᵖ) (n : ℕ) :
    PreservesFilteredColimitsOfSize.{v, v} ((tor n).obj G) := sorry

end FlatDefAndTests

/-- **2.1, rings** Flatness of a left `A`-module `M` via finitely generated right ideals
([Lam-LMR, (4.12)]). -/
class Module.BalancedFlat (A : Type u) (M : Type v) [Ring A] [AddCommGroup M] [Module A M] :
    Prop where
  out ⦃I : Submodule Aᵐᵒᵖ A⦄ : I.FG →
    Function.Injective (BalancedTensorProduct.rTensor ℤ M I.subtype)

/-- **2.1, rings** Equivalence with `ModCat.Flat` on `SingleObj Aᵐᵒᵖ` and commutative `Flat`. -/
theorem Module.balancedFlat_iff_flat_singleObj (A : Type u) [Ring A] (M : Type w) [AddCommGroup M]
    [Module A M] :
    Module.BalancedFlat A M ↔
      ModCat.Flat ((moduleCatEquivModCat.{w} A).functor.obj (ModuleCat.of A M)) := sorry

theorem Module.balancedFlat_iff_flat {R : Type u} [CommRing R] (M : Type v) [AddCommGroup M]
    [Module R M] : Module.BalancedFlat R M ↔ Module.Flat R M := sorry

/-- **2.2, rings** Ideal, tensor, `Tor_1`, and character-module tests for `BalancedFlat`
([Lam-LMR, (4.9), (4.12)]; [Lambek, p. 239]). -/
theorem Module.balancedFlat_tfae {A : Type u} [Ring A] [Small.{v} A] (M : Type v) [AddCommGroup M]
    [Module A M] :
    List.TFAE
      [Module.BalancedFlat A M,
        ∀ I : Submodule Aᵐᵒᵖ A, Function.Injective (BalancedTensorProduct.rTensor ℤ M I.subtype),
        ∀ ⦃P Q : Type v⦄ [AddCommGroup P] [Module Aᵐᵒᵖ P] [AddCommGroup Q] [Module Aᵐᵒᵖ Q]
          (i : P →ₗ[Aᵐᵒᵖ] Q), Function.Injective i →
            Function.Injective (BalancedTensorProduct.rTensor ℤ M i),
        ∀ N : ModuleCat.{v} Aᵐᵒᵖ,
          IsZero (((BalancedTor.{v} ℤ A 1).obj N).obj (ModuleCat.of A M)),
        ∀ I : Submodule Aᵐᵒᵖ A, I.FG →
          IsZero (((BalancedTor.{v} ℤ A 1).obj (ModuleCat.of Aᵐᵒᵖ (Shrink.{v} (A ⧸ I)))).obj
            (ModuleCat.of A M)),
        Module.Injective Aᵐᵒᵖ (CharacterModule M)] := sorry

/-! ### 2.3–2.4 Lazard, purity, left exactness, and the representation theorem -/

section LazardAndRepresentation

variable {C : Type u} [Category.{v} C] [Preadditive C]

variable (C) in
def ModCat.isFiniteFree : ObjectProperty (ModCat.{v} C) := fun P ↦
  ∃ (m : ℕ) (Z : Fin m → C), Nonempty (P ≅ ∐ fun i ↦ (ModCat.yoneda C).obj (Z i))

abbrev ModCat.FiniteFreeOver (F : ModCat.{v} C) :=
  CostructuredArrow (ModCat.isFiniteFree C).ι F

/-- **2.3** Pure epimorphisms in `Mod C`: lifting maps from finitely presented modules. -/
def ModCat.IsPureEpi {L M : ModCat.{v} C} (p : L ⟶ M) : Prop :=
  Epi p ∧ ∀ ⦃P : ModCat.{v} C⦄, IsFinitelyPresentedFunctor P.obj → ∀ φ : P ⟶ M,
    ∃ ψ : P ⟶ L, ψ ≫ p = φ

instance ModCat.essentiallySmall_finiteFreeOver [EssentiallySmall.{v} C] (F : ModCat.{v} C) :
    EssentiallySmall.{v} F.FiniteFreeOver := sorry

/-- **2.3** Equivalence between `IsPureEpi` on `S.g` and `IsCardinalPure` at `ℵ₀` on `S.f`. -/
theorem ModCat.isPureEpi_iff_isCardinalPure [EssentiallySmall.{v} C]
    {S : ShortComplex (ModCat.{v} C)} (hS : S.ShortExact) :
    ModCat.IsPureEpi S.g ↔ IsCardinalPure Cardinal.aleph0.{v} S.f := sorry

/-- **2.3, Lazard–Govorov and purity** Equivalent characterizations of flatness via finite-free
factorization, filtered `FiniteFreeOver F`, filtered colimits of finite sums of representables,
and pure epimorphisms ([Lazard, Thm. 1.2, Cor. 1.3]; [Govorov]; [OR, Thm. 3.2 (5)–(6)];
[St, Thm. 3]; [CB, §1.3]). -/
theorem ModCat.flat_lazard_tfae [EssentiallySmall.{v} C] (F : ModCat.{v} C) :
    List.TFAE
      [F.Flat,
        ∀ ⦃P : ModCat.{v} C⦄, IsFinitelyPresentedFunctor P.obj → ∀ φ : P ⟶ F,
          ∃ (Q : ModCat.{v} C) (_ : ModCat.isFiniteFree C Q) (a : P ⟶ Q) (b : Q ⟶ F),
            a ≫ b = φ,
        IsFiltered F.FiniteFreeOver,
        ∃ (J : Type v) (_ : SmallCategory J) (_ : IsFiltered J) (D : J ⥤ ModCat.{v} C)
          (c : Cocone D), Nonempty (IsColimit c) ∧ (∀ j, ModCat.isFiniteFree C (D.obj j)) ∧
            Nonempty (c.pt ≅ F),
        ∀ ⦃L : ModCat.{v} C⦄ (p : L ⟶ F), Epi p → ModCat.IsPureEpi p] := sorry

/-- **2.3** Over additive `C`, flatness agrees with `IsIndObject` ([Krause-Smashing, §2.3]). -/
theorem ModCat.flat_iff_isIndObject [EssentiallySmall.{v} C] [HasFiniteBiproducts C]
    (F : ModCat.{v} C) : F.Flat ↔ IsIndObject (F.obj ⋙ forget AddCommGrpCat.{v}) := sorry

/-- **2.4** Weak cokernels, left exactness, and cohomological functors ([CB, §§1.2–1.3]; [Fisher,
Cor. 2.9]; [Krause-Smashing, Lemma 2.7]). -/
def IsWeakCokernel {X Y Z : C} (f : X ⟶ Y) (g : Y ⟶ Z) : Prop :=
  ∃ w : g.op ≫ f.op = 0, Nonempty (IsWeakLimit (KernelFork.ofι g.op w))

theorem ModCat.flat_iff_exact_of_isWeakCokernel [HasFiniteBiproducts C]
    (hC : ∀ ⦃X Y : C⦄ (f : X ⟶ Y), ∃ (Z : C) (g : Y ⟶ Z), IsWeakCokernel f g)
    (F : ModCat.{w} C) :
    ModCat.Flat F ↔ ∀ ⦃X Y Z : C⦄ (f : X ⟶ Y) (g : Y ⟶ Z), IsWeakCokernel f g →
      Function.Exact (F.obj.map g.op).hom (F.obj.map f.op).hom := sorry

theorem ModCat.flat_iff_preservesFiniteLimits [HasFiniteBiproducts C] [HasCokernels C]
    (F : ModCat.{w} C) : ModCat.Flat F ↔ PreservesFiniteLimits F.obj := sorry

open Pretriangulated.Opposite in
theorem ModCat.flat_iff_isHomological [HasZeroObject C] [HasShift C ℤ]
    [∀ n : ℤ, (shiftFunctor C n).Additive] [Pretriangulated C] (F : ModCat.{w} C) :
    ModCat.Flat F ↔ F.obj.IsHomological := sorry

end LazardAndRepresentation

/-- **2.3, rings** Lazard–Govorov and purity characterizations of `Module.BalancedFlat`
([Lazard, Thm. 1.2, Cor. 1.3]; [Govorov]; [Lam-LMR, (4.34)]). -/
theorem Module.balancedFlat_lazard_tfae {A : Type u} [Ring A] (M : Type u) [AddCommGroup M]
    [Module A M] :
    List.TFAE
      [Module.BalancedFlat A M,
        ∀ (P : Type u) [AddCommGroup P] [Module A P] [Module.FinitePresentation A P]
          (φ : P →ₗ[A] M), ∃ (n : ℕ) (a : P →ₗ[A] Fin n →₀ A) (b : (Fin n →₀ A) →ₗ[A] M),
            b.comp a = φ,
        IsFiltered (TauCeti.FiniteFreeOver A M),
        ∃ (J : Type u) (_ : SmallCategory J) (_ : IsFiltered J) (D : J ⥤ ModuleCat.{u} A)
          (c : Cocone D), Nonempty (IsColimit c) ∧
            (∀ j, ∃ n : ℕ, Nonempty (D.obj j ≅ ModuleCat.of A (Fin n →₀ A))) ∧
            Nonempty (c.pt ≅ ModuleCat.of A M),
        ∀ (L : ModuleCat.{u} A) (p : L ⟶ ModuleCat.of A M), Epi p →
          IsCardinalPure Cardinal.aleph0.{u} (kernel.ι p)] := sorry

/-- **2.3, rings** Lazard–Govorov density of finite free modules over a flat module. -/
theorem Module.BalancedFlat.isDenseAt {A : Type u} [Ring A] (M : Type u) [AddCommGroup M]
    [Module A M] [Module.BalancedFlat A M] :
    (TauCeti.finiteFreeModuleInclusion A).isDenseAt (ModuleCat.of A M) := sorry

section RepresentationTheorem

abbrev ModCat.flat (C : Type u) [Category.{v} C] [Preadditive C] :
    ObjectProperty (ModCat.{w} C) := fun F ↦ ModCat.Flat F

/-- **2.4** Converse of Crawley-Boevey's theorem: `Flat(C)` is finitely accessible with compact
objects given by retracts of representables ([CB, §1.4]). -/
instance (C : Type u) [Category.{v} C] [Preadditive C] [EssentiallySmall.{v} C]
    [HasFiniteBiproducts C] :
    IsFinitelyAccessibleCategory.{v} (ModCat.flat.{v} C).FullSubcategory := sorry

theorem ModCat.isFinitelyPresentable_flat_iff {C : Type u} [Category.{v} C] [Preadditive C]
    [EssentiallySmall.{v} C] [HasFiniteBiproducts C] (F : (ModCat.flat.{v} C).FullSubcategory) :
    IsFinitelyPresentable.{v} F ↔ ∃ X : C, Nonempty (Retract F.obj ((ModCat.yoneda C).obj X)) :=
  sorry

universe u₁ v₁

abbrev FinitelyPresented (𝒜 : Type u₁) [Category.{v₁} 𝒜] : Type _ :=
  (ObjectProperty.isFinitelyPresentable.{w} 𝒜).FullSubcategory

/-- **2.4, Crawley-Boevey's representation theorem** `𝒜 ≌ Flat(fp(𝒜))`, characterizing finitely
accessible additive categories up to equivalence ([CB, §1.4]). -/
theorem nonempty_restrictedYonedaEquivFlat (𝒜 : Type u₁) [Category.{v₁} 𝒜] [Preadditive 𝒜]
    [HasFiniteBiproducts 𝒜] [IsFinitelyAccessibleCategory.{w} 𝒜] :
    Nonempty (𝒜 ≌ (ModCat.flat.{w} (FinitelyPresented.{w} 𝒜)).FullSubcategory) := sorry

theorem isFinitelyAccessibleCategory_iff_nonempty_equiv_flat (𝒜 : Type u₁) [Category.{v₁} 𝒜]
    [Preadditive 𝒜] [HasFiniteBiproducts 𝒜] :
    IsFinitelyAccessibleCategory.{w} 𝒜 ↔
      ∃ (C : Type w) (_ : SmallCategory C) (_ : Preadditive C) (_ : HasFiniteBiproducts C),
        Nonempty (𝒜 ≌ (ModCat.flat.{w} C).FullSubcategory) := sorry

end RepresentationTheorem

/-! ### 2.5–2.6 Bass's flat module and closure properties -/

section BassAndClosure

variable {C : Type u} [Category.{v} C] [Preadditive C]

/-- **2.5** Factorizability of `ℕ ⥤ C` and Bass's module `colim Hom(-, c_i)` ([Bass, 1.1–1.3]). -/
def IsFactorizable (F : ℕ ⥤ C) : Prop :=
  ∀ i : ℕ, ∃ (j : ℕ) (hij : i ≤ j), ∀ (k : ℕ) (hjk : j ≤ k),
    ∃ t : F.obj k ⟶ F.obj j, F.map (homOfLE (hij.trans hjk)) ≫ t = F.map (homOfLE hij)

noncomputable def ModCat.bassDiagram (c : ℕ → C) (f : ∀ i, c i ⟶ c (i + 1)) : ℕ ⥤ ModCat.{v} C :=
  Functor.ofSequence fun i ↦ (ModCat.yoneda C).map (f i)

noncomputable def ModCat.bassModule (c : ℕ → C) (f : ∀ i, c i ⟶ c (i + 1)) : ModCat.{v} C :=
  colimit (ModCat.bassDiagram c f)

theorem ModCat.isZero_bassModule_iff (c : ℕ → C) (f : ∀ i, c i ⟶ c (i + 1)) :
    IsZero (ModCat.bassModule c f) ↔
      ∀ i : ℕ, ∃ (j : ℕ) (hij : i ≤ j), (Functor.ofSequence f).map (homOfLE hij) = 0 := sorry

instance [EssentiallySmall.{v} C] (c : ℕ → C) (f : ∀ i, c i ⟶ c (i + 1)) :
    IsCardinalPresentable (ModCat.bassModule c f) (Cardinal.aleph.{v} 1) := sorry

theorem ModCat.isFactorizable_of_projective_bassModule (c : ℕ → C) (f : ∀ i, c i ⟶ c (i + 1))
    [Projective (ModCat.bassModule c f)] : IsFactorizable (Functor.ofSequence f) := sorry

/-- **2.6** Filtered colimits of flat modules are flat (without smallness). -/
theorem ModCat.Flat.of_isColimit {J : Type*} [Category J] [IsFiltered J]
    [HasColimitsOfShape J AddCommGrpCat.{w}] {D : J ⥤ ModCat.{w} C} {c : Cocone D}
    (hc : IsColimit c) (h : ∀ j, (D.obj j).Flat) : c.pt.Flat := sorry

instance (c : ℕ → C) (f : ∀ n, c n ⟶ c (n + 1)) : (ModCat.bassModule c f).Flat :=
  ModCat.Flat.of_isColimit (colimit.isColimit (ModCat.bassDiagram c f)) fun i ↦
    ModCat.flat_yoneda_obj (c i)

/-- **2.6** Two-out-of-three flatness in `0 → F₁ → F₂ → F₃ → 0` when `F₃` is flat. -/
theorem ModCat.flat_iff_of_shortExact [EssentiallySmall.{v} C] {S : ShortComplex (ModCat.{v} C)}
    (hS : S.ShortExact) [S.X₃.Flat] : S.X₂.Flat ↔ S.X₁.Flat := sorry

end BassAndClosure

/-! ## Layer 3: flat dimension, global and weak global dimension, and Auslander's theorem -/

/-! ### 3.1–3.3 Flat, global, and weak global dimensions -/

section Dimensions

open ModCat

variable {C : Type u} [Category.{v} C] [Preadditive C] [EssentiallySmall.{v} C]

/-- **3.1** Flat dimension on `Mod C` via cyclic covariant functors `Hom(X, -) ⧸ I`. -/
class ModCat.HasFlatDimensionLT (F : ModCat.{v} C) (n : ℕ) : Prop where
  isZero_tor ⦃i : ℕ⦄ (hi : n ≤ i) ⦃X : C⦄ ⦃m : ℕ⦄ ⦃Y : Fin m → C⦄ (β : ∀ j, X ⟶ Y j) :
    IsZero (((tor i).obj (cokernel (ModCat.coyonedaSpan β).arrow)).obj F)

abbrev ModCat.HasFlatDimensionLE (F : ModCat.{v} C) (n : ℕ) : Prop := F.HasFlatDimensionLT (n + 1)

noncomputable def ModCat.flatDimension (F : ModCat.{v} C) : WithBot ℕ∞ :=
  sInf {d : WithBot ℕ∞ | ∀ i : ℕ, d < i → F.HasFlatDimensionLT i}

/-- **3.1** `Tor`, flat-resolution, and syzygy characterizations of `HasFlatDimensionLE`. -/
theorem ModCat.hasFlatDimensionLE_tfae (F : ModCat.{v} C) (n : ℕ) :
    List.TFAE
      [F.HasFlatDimensionLE n,
        ∀ (G : ModCat.{v} Cᵒᵖ) (i : ℕ), n < i → IsZero (((tor i).obj G).obj F),
        ∀ G : ModCat.{v} Cᵒᵖ, IsZero (((tor (n + 1)).obj G).obj F),
        ∃ (K : ChainComplex (ModCat.{v} C) ℕ) (π : K ⟶ (ChainComplex.single₀ _).obj F),
          QuasiIso π ∧ (∀ i, ModCat.Flat (K.X i)) ∧ ∀ i, n < i → IsZero (K.X i),
        ∀ P : ProjectiveResolution F, ModCat.Flat (P.complex.opcycles n),
        ∃ P : ProjectiveResolution F, ModCat.Flat (P.complex.opcycles n)] := sorry

/-- **3.1** Flat dimension equals the injective dimension of `F^E` for injective cogenerator `E`. -/
theorem ModCat.flatDimension_eq_injectiveDimension_dual (R : Type*) [CommRing R] [Linear R C]
    (E : ModuleCat.{v} R) [Injective E] (hE : IsCoseparator E) (F : ModCat.{v} C) :
    F.flatDimension = injectiveDimension ((ModCat.dual R E).obj (op F)) := sorry

end Dimensions

section RingFlatDimension

variable {A : Type u} [Ring A] [Small.{v} A]

/-- **3.1, rings** Native flat dimension on `ModuleCat.{v} A` and character-module formula. -/
class HasFlatDimensionLT (M : ModuleCat.{v} A) (n : ℕ) : Prop where
  isZero ⦃i : ℕ⦄ (hi : n ≤ i) ⦃I : Submodule Aᵐᵒᵖ A⦄ (hI : I.FG) :
    IsZero (((BalancedTor.{v} ℤ A i).obj (ModuleCat.of Aᵐᵒᵖ (Shrink.{v} (A ⧸ I)))).obj M)

abbrev HasFlatDimensionLE (M : ModuleCat.{v} A) (n : ℕ) : Prop := HasFlatDimensionLT M (n + 1)

noncomputable def flatDimension (M : ModuleCat.{v} A) : WithBot ℕ∞ :=
  sInf {d : WithBot ℕ∞ | ∀ i : ℕ, d < i → HasFlatDimensionLT M i}

theorem flatDimension_eq_injectiveDimension_characterModule (M : ModuleCat.{v} A) :
    flatDimension M = injectiveDimension (ModuleCat.of Aᵐᵒᵖ (CharacterModule M)) := sorry

end RingFlatDimension

/-- **3.2** Global dimension of an abelian category ([Mitchell, §9, p. 42]). -/
noncomputable def Abelian.globalDimension (𝒜 : Type u) [Category.{v} 𝒜] [Abelian 𝒜] :
    WithBot ℕ∞ := ⨆ X : 𝒜, projectiveDimension X

section GlobalAndWeakDimension

variable (C : Type u) [Category.{v} C] [Preadditive C]

/-- **3.2, Auslander's lemma** `globalDimension (ModCat C) ≤ n` iff cyclic modules `Hom(-, X) ⧸ I`
have projective dimension `≤ n` ([Au, Thm. 1, p. 68]). -/
theorem ModCat.globalDimension_le_iff_cyclic [EssentiallySmall.{v} C] (n : ℕ) :
    Abelian.globalDimension (ModCat.{v} C) ≤ n ↔
      ∀ (X : C) (I : Subobject ((ModCat.yoneda C).obj X)),
        HasProjectiveDimensionLE (cokernel I.arrow) n := sorry

/-- **3.2** Universe independence of `Abelian.globalDimension (ModCat C)`. -/
theorem ModCat.globalDimension_eq_globalDimension [EssentiallySmall.{w} C]
    [EssentiallySmall.{t} C] :
    Abelian.globalDimension (ModCat.{w} C) = Abelian.globalDimension (ModCat.{t} C) := sorry

variable [EssentiallySmall.{v} C]

/-- **3.3** Weak global dimension of `C`, symmetry, and cyclic/finitely presented tests. -/
noncomputable def ModCat.weakGlobalDimension : WithBot ℕ∞ :=
  ⨆ F : ModCat.{v} C, F.flatDimension

theorem ModCat.weakGlobalDimension_op :
    ModCat.weakGlobalDimension Cᵒᵖ = ModCat.weakGlobalDimension C := sorry

theorem ModCat.weakGlobalDimension_le_tfae (n : ℕ) :
    List.TFAE
      [ModCat.weakGlobalDimension C ≤ n,
        ∀ ⦃X : C⦄ ⦃m : ℕ⦄ ⦃Y : Fin m → C⦄ (β : ∀ j, X ⟶ Y j),
          ModCat.HasFlatDimensionLE (cokernel (ModCat.coyonedaSpan β).arrow) n,
        ∀ G : ModCat.{v} Cᵒᵖ, IsFinitelyPresentedFunctor G.obj → ModCat.HasFlatDimensionLE G n] :=
  sorry

end GlobalAndWeakDimension

/-- **3.3, rings** Weak global dimension of `A` and left-right symmetry ([Lam-LMR, (5.63)]). -/
noncomputable def weakGlobalDimension (A : Type u) [Ring A] [Small.{v} A] : WithBot ℕ∞ :=
  ⨆ M : ModuleCat.{v} A, flatDimension M

theorem weakGlobalDimension_mulOpposite (A : Type u) [Ring A] [Small.{v} A] :
    weakGlobalDimension.{v} Aᵐᵒᵖ = weakGlobalDimension.{v} A := sorry

/-- **3.3** Characterizations of von Neumann regular categories and rings (0.3) by
`weakGlobalDimension ≤ 0`, universal flatness, projectivity of finitely presented modules, and
direct-summand principal ideals ([St, Thm. 4, p. 359]; [Lam-FC, (4.23)]; [Lam-LMR, (4.21)]). -/
theorem isVonNeumannRegularCategory_tfae (C : Type u) [Category.{v} C] [Preadditive C]
    [EssentiallySmall.{v} C] :
    List.TFAE
      [IsVonNeumannRegularCategory C,
        ModCat.weakGlobalDimension C ≤ 0,
        ∀ F : ModCat.{v} C, F.Flat,
        ∀ F : ModCat.{v} C, IsFinitelyPresentedFunctor F.obj → Projective F,
        ∀ ⦃X Y : C⦄ (f : X ⟶ Y), IsSplitMono (image.ι ((ModCat.yoneda C).map f))] := sorry

theorem isVonNeumannRegularRing_tfae (A : Type u) [Ring A] :
    List.TFAE
      [IsVonNeumannRegularRing A,
        weakGlobalDimension.{u} A ≤ 0,
        ∀ (M : Type u) [AddCommGroup M] [Module A M], Module.BalancedFlat A M,
        ∀ (M : Type u) [AddCommGroup M] [Module A M] [Module.FinitePresentation A M],
          Module.Projective A M,
        ∀ a : A, ∃ e : A, IsIdempotentElem e ∧ Ideal.span {a} = Ideal.span {e}] := sorry

/-! ### 3.4–3.5 Auslander's theorem, kernels, and countably presented flat modules -/

section AuslanderAndExtras

variable {C : Type u} [Category.{v} C] [Preadditive C] [EssentiallySmall.{v} C]

/-- **3.4, `FP_∞` lemma** A module with a resolution in `proj C` has equal flat and projective
dimensions ([CE, VI, pp. 120–122]). -/
theorem ModCat.flatDimension_eq_projectiveDimension_of_projectiveResolution
    (F : ModCat.{v} C) (P : ProjectiveResolution F)
    (hP : ∀ i, ModCat.proj C (P.complex.X i)) :
    F.flatDimension = projectiveDimension F := sorry

variable (C) in
/-- **3.4, Auslander's theorem** If every `Hom(-, X)` is Noetherian, global and weak global
dimensions agree ([Au, Thm. 4, p. 70]; [Lam-LMR, (5.59)]). -/
theorem ModCat.globalDimension_eq_weakGlobalDimension
    [∀ X : C, IsNoetherianObject ((ModCat.yoneda C).obj X)] :
    Abelian.globalDimension (ModCat.{v} C) = ModCat.weakGlobalDimension C := sorry

variable (C) in
theorem ModCat.globalDimension_le_of_forall_isFinitelyPresentedFunctor
    [∀ X : C, IsNoetherianObject ((ModCat.yoneda C).obj X)] (n : ℕ)
    (h : ∀ G : ModCat.{v} Cᵒᵖ, IsFinitelyPresentedFunctor G.obj → HasProjectiveDimensionLE G n) :
    Abelian.globalDimension (ModCat.{v} C) ≤ n := sorry

variable (C) in
/-- **3.5** Flat modules in `Mod C` are closed under kernels iff `weakGlobalDimension C ≤ 2`
([CB, Thm. 2.3, p. 1651]). -/
theorem ModCat.forall_flat_kernel_iff :
    (∀ ⦃F F' : ModCat.{v} C⦄ (f : F ⟶ F'), ModCat.Flat F → ModCat.Flat F' →
      ModCat.Flat (kernel f)) ↔ ModCat.weakGlobalDimension C ≤ 2 := sorry

/-- **3.5, Jensen's lemma** Every `ℵ₁`-presentable flat module has projective dimension `≤ 1`
([Jensen, Lemma 2]; [Osofsky-Nagoya, Lemma 1.2]). -/
theorem ModCat.Flat.hasProjectiveDimensionLE_one (F : ModCat.{v} C) [F.Flat]
    [IsCardinalPresentable F (Cardinal.aleph.{v} 1)] : HasProjectiveDimensionLE F 1 := sorry

end AuslanderAndExtras

/-- **3.4, rings** Left Noetherian Auslander equality and right-module bound. -/
theorem globalDimension_eq_weakGlobalDimension (A : Type u) [Ring A] [Small.{v} A]
    [IsNoetherianRing A] : TauCeti.globalDimension.{v} A = weakGlobalDimension.{v} A := sorry

theorem globalDimension_le_of_forall_finitePresentation_mulOpposite {A : Type u} [Ring A]
    [Small.{v} A] [IsNoetherianRing A] (n : ℕ)
    (h : ∀ N : ModuleCat.{v} Aᵐᵒᵖ, Module.FinitePresentation Aᵐᵒᵖ N →
      HasProjectiveDimensionLE N n) : TauCeti.globalDimension.{v} A ≤ n := sorry

/-! ## Layer 4: semiperfect and left perfect categories, and Bass's Theorem P -/

/-! ### 4.1 T-nilpotence and Nakayama's lemma for all modules -/

section TNilpotent

variable {C : Type u} [Category.{v} C] [Preadditive C]

/-- **4.1** T-nilpotence of a left ideal `I` of `C` and Nakayama's lemma for all modules
([Simson, Lemma 5.3]; [Bass, pp. 473–474]). -/
def LeftMorphismIdeal.IsTNilpotent (I : LeftMorphismIdeal C) : Prop :=
  ∀ (c : ℕ → C) (f : ∀ i, c i ⟶ c (i + 1)), (∀ i, f i ∈ I.hom (c i) (c (i + 1))) →
    ∃ n : ℕ, (Functor.ofSequence f).map (homOfLE (Nat.zero_le n)) = 0

theorem LeftMorphismIdeal.isTNilpotent_tfae (I : LeftMorphismIdeal C) :
    List.TFAE
      [I.IsTNilpotent,
        ∀ M : ModCat.{v} C, I.smul M = ⊤ → IsZero M,
        ∀ M : ModCat.{v} C, IsSuperfluous (I.smul M)] := sorry

/-- **4.1** `J(C) · M` is superfluous in every finitely generated module `M`. -/
theorem ModCat.isSuperfluous_jacobson_smul_of_isFinitelyGeneratedFunctor (M : ModCat.{v} C)
    (hM : IsFinitelyGeneratedFunctor M.obj) :
    IsSuperfluous ((TauCeti.jacobsonRadicalIdeal C : LeftMorphismIdeal C).smul M) := sorry

/-- **4.1, rings** Left T-nilpotence `a₀ a₁ ⋯ aₙ₋₁ = 0` and Nakayama's lemma ([AF, 28.3]). -/
def IsLeftTNilpotent {A : Type u} [Ring A] (S : Set A) : Prop :=
  ∀ a : ℕ → A, (∀ i, a i ∈ S) → ∃ n, (List.ofFn fun i : Fin n ↦ a i).prod = 0

theorem isLeftTNilpotent_tfae {A : Type u} [Ring A] (J : Ideal A) :
    List.TFAE
      [IsLeftTNilpotent (J : Set A),
        ∀ (M : Type u) [AddCommGroup M] [Module A M], J • (⊤ : Submodule A M) = ⊤ → Subsingleton M,
        ∀ (M : Type u) [AddCommGroup M] [Module A M],
          TauCeti.IsSuperfluous (J • (⊤ : Submodule A M)),
        TauCeti.IsSuperfluous (J • (⊤ : Submodule A (ℕ →₀ A)))] := sorry

end TNilpotent

/-! ### 4.2 Semilocal and semiperfect rings and categories -/

section SemilocalAndSemiperfect

/-- **4.2** Semilocal rings: `R ⧸ Ring.jacobson R` is semisimple. -/
class IsSemilocalRing (R : Type u) [Ring R] : Prop where
  isSemisimpleRing : IsSemisimpleRing (R ⧸ Ring.jacobson R)

attribute [instance] IsSemilocalRing.isSemisimpleRing

instance {R : Type u} [Ring R] [IsSemilocalRing R] : IsSemilocalRing Rᵐᵒᵖ :=
  ⟨(TauCeti.Ring.isSemisimpleRing_quotient_jacobson_mulOpposite_iff R).mpr inferInstance⟩

instance {R : Type u} [Ring R] [TauCeti.IsSemiperfectRing R] : IsSemilocalRing R :=
  ⟨inferInstance⟩

variable (C : Type u) [Category.{v} C] [Preadditive C]

/-- **4.2** Semilocal and semisimple preadditive categories ([Simson, Prop. 1.2]). -/
class IsSemilocalCategory : Prop where
  isSemilocalRing_end (X : C) : IsSemilocalRing (End X)

attribute [instance] IsSemilocalCategory.isSemilocalRing_end

variable {C} in
abbrev ModCat.IsSemisimple (M : ModCat.{w} C) : Prop := ComplementedLattice (Subobject M)

def IsSemisimpleCategory : Prop := ∀ X : C, ModCat.IsSemisimple ((ModCat.yoneda C).obj X)

theorem isSemisimpleCategory_iff_isVonNeumannRegularCategory :
    IsSemisimpleCategory C ↔ IsVonNeumannRegularCategory C ∧ ∀ X : C, IsSemisimpleRing (End X) :=
  sorry

theorem isSemilocalCategory_iff_isSemisimpleCategory :
    IsSemilocalCategory C ↔ IsSemisimpleCategory (TauCeti.jacobsonRadicalIdeal C).Quotient := sorry

variable {C} in
theorem ModCat.isSemisimple_iff_exists_iso_sigma [EssentiallySmall.{w} C] (M : ModCat.{w} C) :
    M.IsSemisimple ↔
      ∃ (ι : Type w) (S : ι → ModCat.{w} C), (∀ i, Simple (S i)) ∧ Nonempty (M ≅ ∐ S) := sorry

/-- **4.2** Semiperfect and Krull–Schmidt categories ([Krause, Cor. 4.4]; ArtinAlgebras §0.2). -/
class IsSemiperfectCategory : Prop extends IsSemilocalCategory C where
  isSemiperfectRing_end (X : C) : TauCeti.IsSemiperfectRing (End X)

attribute [instance] IsSemiperfectCategory.isSemiperfectRing_end

/-- **Supplier (ArtinAlgebras §0.2)** `TauCeti.IsKrullSchmidt`, restated identically here. -/
class IsKrullSchmidt [HasFiniteBiproducts C] : Prop where
  exists_iso_biproduct (X : C) :
    ∃ (n : ℕ) (P : Fin n → C), (∀ i, IsLocalRing (End (P i))) ∧ Nonempty (X ≅ ⨁ P)

/-- **Supplier (ArtinAlgebras §0.2, [Krause, Cor. 4.4])**, restated so that clause (5) of
`isSemiperfectCategory_tfae` can be read against it; not a target of this roadmap. -/
theorem isKrullSchmidt_iff_isIdempotentComplete_and_isSemiperfectCategory [HasFiniteBiproducts C] :
    IsKrullSchmidt C ↔ IsIdempotentComplete C ∧ IsSemiperfectCategory C := sorry

/-- **4.2** Existence of a projective cover (`TauCeti.IsEssentialEpi` from a projective). -/
def HasProjectiveCover {𝒜 : Type*} [Category 𝒜] (M : 𝒜) : Prop :=
  ∃ (P : 𝒜) (p : P ⟶ M), Projective P ∧ TauCeti.IsEssentialEpi p

/-- **4.2** Characterizations of semiperfect categories ([Simson, Thm. 5.6]; [Krause, 4.1]). -/
theorem isSemiperfectCategory_tfae :
    List.TFAE
      [IsSemiperfectCategory C,
        ∀ X : C, ∃ (n : ℕ) (P : Fin n → ModCat.{v} C), (∀ i, Projective (P i)) ∧
          (∀ i, IsLocalRing (End (P i))) ∧ Nonempty ((ModCat.yoneda C).obj X ≅ ∐ P),
        ∀ M : ModCat.{v} C, IsFinitelyGeneratedFunctor M.obj → HasProjectiveCover M,
        ∀ S : ModCat.{v} C, Simple S → HasProjectiveCover S,
        IsKrullSchmidt (ModCat.proj C).FullSubcategory] := sorry

variable {C} in
/-- **4.2** Every nonzero projective `P` satisfies `J(C) · P ≠ P` ([Bass, Prop. 2.7]). -/
theorem ModCat.jacobson_smul_ne_top_of_projective [EssentiallySmall.{v} C] {P : ModCat.{v} C}
    [Projective P] (hP : ¬ IsZero P) :
    (TauCeti.jacobsonRadicalIdeal C : LeftMorphismIdeal C).smul P ≠ ⊤ := sorry

/-- **4.2, rings** Characterizations of semiperfect rings ([Sandomierski, Thm. 4]; [Lam-FC,
(24.16)]). -/
theorem isSemiperfectRing_tfae (R : Type u) [Ring R] :
    List.TFAE
      [TauCeti.IsSemiperfectRing R,
        ∃ (n : ℕ) (P : Fin n → Type u) (_ : ∀ i, AddCommGroup (P i)) (_ : ∀ i, Module R (P i)),
          (∀ i, Module.Projective R (P i)) ∧ (∀ i, IsLocalRing (Module.End R (P i))) ∧
            Nonempty (R ≃ₗ[R] ∀ i, P i),
        ∀ (M : Type u) [AddCommGroup M] [Module R M] [Module.Finite R M],
          ∃ P : Submodule R (M →₀ R),
            TauCeti.IsProjectiveCover (Finsupp.linearCombination R id ∘ₗ P.subtype),
        ∀ (S : Type u) [AddCommGroup S] [Module R S] [IsSimpleModule R S],
          ∃ P : Submodule R (S →₀ R),
            TauCeti.IsProjectiveCover (Finsupp.linearCombination R id ∘ₗ P.subtype),
        IsKrullSchmidt (TauCeti.finiteProjectiveModules R).FullSubcategory] := sorry

/-- **4.2, rings** Minimal projective presentations and commutative product characterization. -/
theorem FiniteProjectivePresentation.exists_isMinimal {R : Type u} [Ring R]
    [TauCeti.IsSemiperfectRing R] [Small.{v} R] {M : ModuleCat.{v} R}
    [Module.FinitePresentation R M] :
    ∃ P : TauCeti.FiniteProjectivePresentation M,
      TauCeti.IsMinimalProjectivePresentation P.p P.π := sorry

theorem isSemiperfectRing_iff_exists_ringEquiv_pi {R : Type u} [CommRing R] :
    TauCeti.IsSemiperfectRing R ↔
      ∃ (n : ℕ) (L : Fin n → Type u) (_ : ∀ i, CommRing (L i)) (_ : ∀ i, IsLocalRing (L i)),
        Nonempty (R ≃+* ∀ i, L i) := sorry

end SemilocalAndSemiperfect

/-! ### 4.3–4.4 Left perfect categories, left perfect rings, and projective covers -/

section PerfectAndCovers

/-- **4.3** Left perfect categories: semilocal with T-nilpotent `J(C)` ([Simson, Thm. 5.4]). -/
class IsLeftPerfectCategory (C : Type u) [Category.{v} C] [Preadditive C] : Prop
    extends IsSemilocalCategory C where
  isTNilpotent : (TauCeti.jacobsonRadicalIdeal C : LeftMorphismIdeal C).IsTNilpotent

instance {C : Type u} [Category.{v} C] [Preadditive C] [IsLeftPerfectCategory C] :
    IsSemiperfectCategory C := sorry

/-- **4.3** Left perfect rings: semilocal with left T-nilpotent `Ring.jacobson A` ([Bass]). -/
class IsLeftPerfectRing (A : Type u) [Ring A] : Prop extends IsSemilocalRing A where
  isLeftTNilpotent : IsLeftTNilpotent (Ring.jacobson A : Set A)

instance IsLeftPerfectRing.of_isSemiprimaryRing {A : Type u} [Ring A] [IsSemiprimaryRing A] :
    IsLeftPerfectRing A := sorry

instance IsLeftPerfectRing.isSemiperfectRing {A : Type u} [Ring A] [IsLeftPerfectRing A] :
    TauCeti.IsSemiperfectRing A := sorry

/-- **4.3, Small–Fisher theorem** Multiplicatively closed nil subsets of `End_R(M)` are nilpotent
when `M` is Artinian or Noetherian: an adaptation of [Fisher-Nil, Lemma 1.3, Thms. 1.5, 2.1],
printed there for nil subrings (cf. [AF, Thm. 29.2] for nil one-sided ideals); see README 4.3. -/
theorem Module.End.exists_prod_eq_zero_of_isNilpotent {R : Type u} [Ring R] {M : Type v}
    [AddCommGroup M] [Module R M] (hM : IsArtinian R M ∨ IsNoetherian R M)
    (I : Set (Module.End R M)) (hI : ∀ a ∈ I, ∀ b ∈ I, a * b ∈ I)
    (hnil : ∀ a ∈ I, IsNilpotent a) :
    ∃ n : ℕ, ∀ a : Fin n → Module.End R M, (∀ i, a i ∈ I) → (List.ofFn a).prod = 0 := sorry

/-- **4.3** `End_R(M)` is semiprimary for finite-length `M` ([AF, Cor. 29.3]). -/
instance Module.End.isSemiprimaryRing {R : Type u} [Ring R] {M : Type v} [AddCommGroup M]
    [Module R M] [IsNoetherian R M] [IsArtinian R M] : IsSemiprimaryRing (Module.End R M) := sorry

/-- **4.4** Projective covers over left perfect categories and left perfect rings ([Simson, 5.4];
[Bass, Lemma 2.6]; [Lam-FC, (24.12)]). -/
theorem IsLeftPerfectCategory.hasProjectiveCover {C : Type u} [Category.{v} C] [Preadditive C]
    [EssentiallySmall.{v} C] [IsLeftPerfectCategory C] (M : ModCat.{v} C) :
    HasProjectiveCover M := sorry

theorem IsLeftPerfectRing.exists_isProjectiveCover {A : Type u} [Ring A] [IsLeftPerfectRing A]
    (M : Type v) [AddCommGroup M] [Module A M] :
    ∃ P : Submodule A (M →₀ A),
      TauCeti.IsProjectiveCover (Finsupp.linearCombination A id ∘ₗ P.subtype) := sorry

end PerfectAndCovers

/-! ### 4.5–4.6 Bass's Theorem P and global dimension of left perfect categories -/

section TheoremPAndGlobalDimension

variable {C : Type u} [Category.{v} C] [Preadditive C] [EssentiallySmall.{v} C]

/-- **4.5** Pure superfluous subobjects of projectives vanish ([Wisbauer, 36.3]; [Mares, 2.4]). -/
theorem ModCat.eq_bot_of_isSuperfluous_of_isPureEpi {P : ModCat.{v} C} [Projective P]
    {K : Subobject P} (hK : IsSuperfluous K) (hpure : ModCat.IsPureEpi (cokernel.π K.arrow)) :
    K = ⊥ := sorry

theorem ModCat.Flat.projective_of_isEssentialEpi {P M : ModCat.{v} C} [Projective P]
    [ModCat.Flat M] (p : P ⟶ M) (hp : TauCeti.IsEssentialEpi p) : Projective M := sorry

variable (C) in
/-- **4.5, Simson's Theorem 5.4 / categorical Theorem P** ([Simson, Thm. 5.4]; [Harada, Thm. 5];
[Bass, Theorem P]; [AF, 28.4]). -/
theorem isLeftPerfectCategory_tfae :
    List.TFAE
      [IsLeftPerfectCategory C,
        ∀ M : ModCat.{v} C, HasProjectiveCover M,
        ∀ M : ModCat.{v} C, M.IsSemisimple → HasProjectiveCover M,
        IsSemilocalCategory C ∧ ∀ M : ModCat.{v} C, ¬ IsZero M → ∃ N : Subobject M, IsCoatom N,
        ∀ M : ModCat.{v} C, M.Flat → Projective M,
        ∀ M : ModCat.{v} C, M.Flat → IsCardinalPresentable M (Cardinal.aleph.{v} 1) →
          Projective M,
        ∀ c : C, WellFoundedLT {I : RightMorphismIdeal C //
          ∃ (d : C) (g : c ⟶ d), I = RightMorphismIdeal.principal g},
        ∀ (c : ℕ → C) (f : ∀ i, c i ⟶ c (i + 1)), ∃ n : ℕ, ∀ m : ℕ, n ≤ m →
          ∃ t : (Functor.ofSequence f).obj m ⟶ (Functor.ofSequence f).obj n,
            (Functor.ofSequence f).map (homOfLE (Nat.zero_le m)) ≫ t =
              (Functor.ofSequence f).map (homOfLE (Nat.zero_le n)),
        (∀ (X : C) (e : ℕ → End X), OrthogonalIdempotents e → ∃ i, e i = 0) ∧
          ∀ N : ModCat.{v} Cᵒᵖ, ¬ IsZero N → ∃ S : Subobject N, Simple (S : ModCat.{v} Cᵒᵖ),
        ∀ M : ModCat.{v} C, M.flatDimension = projectiveDimension M,
        ∀ (n : ℕ) (J : Type v) [SmallCategory J] [IsFiltered J] (D : J ⥤ ModCat.{v} C),
          (∀ j, HasProjectiveDimensionLE (D.obj j) n) → HasProjectiveDimensionLE (colimit D) n,
        ∀ (J : Type v) [SmallCategory J] [IsFiltered J] (D : J ⥤ ModCat.{v} C),
          (∀ j, Projective (D.obj j)) → Projective (colimit D)] := sorry

/-- **4.5, Bass's Theorem P** ([Bass, Theorem P]; [AF, 28.4]; [Lam-FC, (24.25)]). -/
theorem isLeftPerfectRing_tfae (A : Type u) [Ring A] :
    List.TFAE
      [IsLeftPerfectRing A,
        ∀ (M : Type u) [AddCommGroup M] [Module A M],
          ∃ P : Submodule A (M →₀ A),
            TauCeti.IsProjectiveCover (Finsupp.linearCombination A id ∘ₗ P.subtype),
        ∀ (M : Type u) [AddCommGroup M] [Module A M] [IsSemisimpleModule A M],
          ∃ P : Submodule A (M →₀ A),
            TauCeti.IsProjectiveCover (Finsupp.linearCombination A id ∘ₗ P.subtype),
        IsSemilocalRing A ∧ ∀ (M : Type u) [AddCommGroup M] [Module A M] [Nontrivial M],
          ∃ N : Submodule A M, IsCoatom N,
        ∀ (M : Type u) [AddCommGroup M] [Module A M], Module.BalancedFlat A M →
          Module.Projective A M,
        ∀ M : ModuleCat.{u} A, Module.BalancedFlat A M →
          IsCardinalPresentable M (Cardinal.aleph.{u} 1) → Module.Projective A M,
        WellFoundedLT {I : Submodule Aᵐᵒᵖ A // I.IsPrincipal},
        ∀ a : ℕ → A, ∃ n, ∀ m ≥ n, Submodule.span Aᵐᵒᵖ {(List.ofFn fun i : Fin m ↦ a i).prod} =
          Submodule.span Aᵐᵒᵖ {(List.ofFn fun i : Fin n ↦ a i).prod},
        (∀ e : ℕ → A, OrthogonalIdempotents e → ∃ i, e i = 0) ∧
          ∀ (N : Type u) [AddCommGroup N] [Module Aᵐᵒᵖ N] [Nontrivial N], TauCeti.socle Aᵐᵒᵖ N ≠ ⊥,
        ∀ M : ModuleCat.{u} A, flatDimension M = projectiveDimension M,
        ∀ (n : ℕ) (J : Type u) [SmallCategory J] [IsFiltered J] (D : J ⥤ ModuleCat.{u} A),
          (∀ j, HasProjectiveDimensionLE (D.obj j) n) → HasProjectiveDimensionLE (colimit D) n,
        ∀ (J : Type u) [SmallCategory J] [IsFiltered J] (D : J ⥤ ModuleCat.{u} A),
          (∀ j, Projective (D.obj j)) → Projective (colimit D)] := sorry

/-- **4.6** Global dimension of left perfect categories and the Bass–Eilenberg criterion ([Bass,
p. 475]; [Eilenberg 1956, Thm. 11]). -/
theorem ModCat.globalDimension_eq_weakGlobalDimension_of_isLeftPerfectCategory
    [IsLeftPerfectCategory C] :
    Abelian.globalDimension (ModCat.{v} C) = ModCat.weakGlobalDimension C := sorry

theorem ModCat.hasProjectiveDimensionLE_iff_isZero_tor [IsLeftPerfectCategory C]
    (M : ModCat.{v} C) (n : ℕ) :
    HasProjectiveDimensionLE M n ↔ ∀ X : C, IsZero (((ModCat.tor (n + 1)).obj
      (MorphismIdeal.quotientYoneda (TauCeti.jacobsonRadicalIdeal C).op (op X))).obj M) := sorry

/-- **4.6, rings** Left and two-sided perfect global-dimension equalities ([Au, Cor. 9];
[Lam-LMR, (5.71)]). -/
theorem globalDimension_eq_weakGlobalDimension_of_isLeftPerfectRing (A : Type u) [Ring A]
    [Small.{v} A] [IsLeftPerfectRing A] :
    TauCeti.globalDimension.{v} A = weakGlobalDimension.{v} A := sorry

theorem globalDimension_mulOpposite_of_isLeftPerfectRing (A : Type u) [Ring A] [Small.{v} A]
    [IsLeftPerfectRing A] [IsLeftPerfectRing Aᵐᵒᵖ] :
    TauCeti.globalDimension.{v} A = weakGlobalDimension.{v} A ∧
      weakGlobalDimension.{v} A = TauCeti.globalDimension.{v} Aᵐᵒᵖ := sorry

end TheoremPAndGlobalDimension

end TauCetiRoadmap.NoncommutativeFlatness
