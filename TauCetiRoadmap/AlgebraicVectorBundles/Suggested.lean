import Mathlib.Algebra.Category.ModuleCat.Presheaf.Monoidal
import Mathlib.Algebra.Category.ModuleCat.Sheaf.PullbackFree
import Mathlib.Algebra.Category.ModuleCat.Stalk
import Mathlib.AlgebraicGeometry.AffineSpace
import Mathlib.AlgebraicGeometry.Fiber
import Mathlib.AlgebraicGeometry.Modules.Tilde
import Mathlib.AlgebraicGeometry.Morphisms.Affine
import Mathlib.CategoryTheory.EssentialImage
import Mathlib.CategoryTheory.GradedObject.Braiding
import Mathlib.CategoryTheory.Monoidal.CommMon_
import Mathlib.CategoryTheory.Monoidal.Rigid.Basic
import Mathlib.CategoryTheory.Monoidal.Subcategory
import Mathlib.LinearAlgebra.SymmetricAlgebra.Basic
import Mathlib.Topology.LocallyConstant.Basic
import TauCeti.AlgebraicGeometry.FinitelyPresentedSheaf.Basic

/-!
# Algebraic vector bundles: proposed definitions and target signatures

`README.md` is the definitive roadmap. This file records representative definitions,
characteristic equations and milestone signatures for its layers. Each `sorry` marks a theorem or
construction targeted by the roadmap.
-/

namespace TauCetiRoadmap.AlgebraicVectorBundles

open CategoryTheory Limits AlgebraicGeometry Opposite
open scoped MonoidalCategory

universe u

/-! ## L0A: sheaves of modules -/

abbrev QuasicoherentSheaf (X : Scheme.{u}) :=
  (SheafOfModules.isQuasicoherent X.ringCatSheaf).FullSubcategory

def isFiniteLocallyFree (X : Scheme.{u}) : ObjectProperty X.Modules :=
  fun E => E.IsLocallyFree ∧ E.IsFinitePresentation

abbrev FiniteLocallyFreeSheaf (X : Scheme.{u}) :=
  (isFiniteLocallyFree X).FullSubcategory

noncomputable instance (X : Scheme.{u}) :
    (isFiniteLocallyFree X).IsClosedUnderIsomorphisms := by
  sorry

namespace FiniteLocallyFreeSheaf

variable {X : Scheme.{u}}

instance (E : FiniteLocallyFreeSheaf X) : E.obj.IsLocallyFree := E.property.1
instance (E : FiniteLocallyFreeSheaf X) : E.obj.IsFinitePresentation := E.property.2

example (E : FiniteLocallyFreeSheaf X) : E.obj.IsQuasicoherent := by
  sorry

end FiniteLocallyFreeSheaf

@[instance_reducible]
noncomputable def modulesMonoidalCategory (X : Scheme.{u}) : MonoidalCategory X.Modules := by
  sorry

noncomputable local instance modulesMonoidalCategoryInstance (X : Scheme.{u}) :
    MonoidalCategory X.Modules := modulesMonoidalCategory X

/-- Same sheafification construction as Tau Ceti's `Scheme.Modules.tensorProduct`. -/
noncomputable def tensorUnderlyingIso (X : Scheme.{u}) (E F : X.Modules) :
    E ⊗ F ≅ (PresheafOfModules.sheafification (𝟙 X.ringCatSheaf.obj)).obj
      (PresheafOfModules.Monoidal.tensorObj (R := X.sheaf.obj) E.val F.val) := by
  sorry

theorem tensorUnderlyingIso_naturality {X : Scheme.{u}} {E E' F F' : X.Modules}
    (f : E ⟶ E') (g : F ⟶ F') :
    (f ⊗ₘ g) ≫ (tensorUnderlyingIso X E' F').hom =
      (tensorUnderlyingIso X E F).hom ≫
        (PresheafOfModules.sheafification (𝟙 X.ringCatSheaf.obj)).map
          (PresheafOfModules.Monoidal.tensorHom (R := X.sheaf.obj) f.val g.val) := by
  sorry

set_option backward.isDefEq.respectTransparency false in
/-- The image of a sectionwise pure tensor under sheafification and the tensor comparison. -/
noncomputable def tensorSection {X : Scheme.{u}} (E F : X.Modules) (U : X.Opens)
    (e : Γ(E, U)) (f : Γ(F, U)) : Γ(E ⊗ F, U) :=
  (tensorUnderlyingIso X E F).inv.app U
    (((PresheafOfModules.sheafificationAdjunction (𝟙 X.ringCatSheaf.obj)).unit.app
      (PresheafOfModules.Monoidal.tensorObj (R := X.sheaf.obj) E.val F.val)).app (op U)
        (TensorProduct.tmul Γ(X, U) e f))

@[instance_reducible]
noncomputable def modulesSymmetricCategory (X : Scheme.{u}) : SymmetricCategory X.Modules := by
  sorry

noncomputable local instance modulesSymmetricCategoryInstance (X : Scheme.{u}) :
    SymmetricCategory X.Modules := modulesSymmetricCategory X

@[instance_reducible]
noncomputable def modulesMonoidalClosedCategory (X : Scheme.{u}) : MonoidalClosed X.Modules := by
  sorry

noncomputable local instance modulesMonoidalClosedCategoryInstance (X : Scheme.{u}) :
    MonoidalClosed X.Modules := modulesMonoidalClosedCategory X

noncomputable def tensorUnitIso (X : Scheme.{u}) :
    𝟙_ X.Modules ≅ SheafOfModules.unit X.ringCatSheaf := by
  sorry

/-- The internal Hom is characterized by the tensor--Hom adjunction. -/
noncomputable def tensorLeftAdjunction (X : Scheme.{u}) (E : X.Modules) :
    MonoidalCategory.tensorLeft E ⊣ ihom E := by
  sorry

/-- Module pullback is strong monoidal. -/
noncomputable instance pullbackModulesMonoidal {X Y : Scheme.{u}} (f : Y ⟶ X) :
    (Scheme.Modules.pullback f).Monoidal := by
  sorry

/-- Module pullback preserves the symmetric braiding. -/
noncomputable instance pullbackModulesBraided {X Y : Scheme.{u}} (f : Y ⟶ X) :
    (Scheme.Modules.pullback f).Braided := by
  sorry

/-- Inverse image of opens preserves the terminal open, hence is final. -/
local instance opensMapFinal {X Y : Scheme.{u}} (f : Y ⟶ X) :
    (TopologicalSpace.Opens.map f.base).Final := by
  sorry

noncomputable local instance sheafPushforwardIsRightAdjoint {X Y : Scheme.{u}} (f : Y ⟶ X) :
    (SheafOfModules.pushforward.{u} f.toRingCatSheafHom).IsRightAdjoint :=
  (Scheme.Modules.pullbackPushforwardAdjunction f).isRightAdjoint

/-! ## L0B: quasicoherent and finite locally free sheaves -/

noncomputable def finiteLocallyFreeToQuasicoherent (X : Scheme.{u}) :
    FiniteLocallyFreeSheaf X ⥤ QuasicoherentSheaf X where
  obj E := ⟨E.obj, by sorry⟩
  map f := ⟨f.hom⟩

noncomputable def finiteLocallyFreeToFinitelyPresented (X : Scheme.{u}) :
    FiniteLocallyFreeSheaf X ⥤ TauCeti.AlgebraicGeometry.FinitelyPresentedSheaf X := by
  sorry

noncomputable instance quasicoherentIsMonoidal (X : Scheme.{u}) :
    @ObjectProperty.IsMonoidal X.Modules _ (modulesMonoidalCategory X)
      (SheafOfModules.isQuasicoherent X.ringCatSheaf) := by
  sorry

noncomputable instance finiteLocallyFreeIsMonoidal (X : Scheme.{u}) :
    @ObjectProperty.IsMonoidal X.Modules _ (modulesMonoidalCategory X)
      (isFiniteLocallyFree X) := by
  sorry

noncomputable local instance quasicoherentMonoidalCategoryInstance (X : Scheme.{u}) :
    MonoidalCategory (QuasicoherentSheaf X) :=
  @ObjectProperty.fullMonoidalSubcategory X.Modules _ (modulesMonoidalCategory X)
    (SheafOfModules.isQuasicoherent X.ringCatSheaf) (quasicoherentIsMonoidal X)

noncomputable local instance finiteLocallyFreeMonoidalCategoryInstance (X : Scheme.{u}) :
    MonoidalCategory (FiniteLocallyFreeSheaf X) :=
  @ObjectProperty.fullMonoidalSubcategory X.Modules _ (modulesMonoidalCategory X)
    (isFiniteLocallyFree X) (finiteLocallyFreeIsMonoidal X)

noncomputable instance finiteLocallyFreeRigidCategory (X : Scheme.{u}) :
    RigidCategory (FiniteLocallyFreeSheaf X) := by
  sorry

/-- Rank is bundled with its local constancy proof. -/
noncomputable def rank {X : Scheme.{u}}
    (E : FiniteLocallyFreeSheaf X) : LocallyConstant X ℕ := by
  sorry

noncomputable def rankLocus {X : Scheme.{u}}
    (E : FiniteLocallyFreeSheaf X) (r : ℕ) : X.Opens := by
  sorry

def isFiniteLocallyFreeOfRank (X : Scheme.{u}) (r : ℕ) : ObjectProperty X.Modules :=
  fun E => ∃ h : isFiniteLocallyFree X E,
    rank (⟨E, h⟩ : FiniteLocallyFreeSheaf X) = LocallyConstant.const X r

abbrev FiniteLocallyFreeSheafOfRank (X : Scheme.{u}) (r : ℕ) :=
  (isFiniteLocallyFreeOfRank X r).FullSubcategory

noncomputable def finiteLocallyFreeOfRankForget (X : Scheme.{u}) (r : ℕ) :
    FiniteLocallyFreeSheafOfRank X r ⥤ FiniteLocallyFreeSheaf X := by
  sorry

noncomputable def pullbackQuasicoherent {X Y : Scheme.{u}} (f : Y ⟶ X) :
    QuasicoherentSheaf X ⥤ QuasicoherentSheaf Y := by
  sorry

noncomputable def pullbackFiniteLocallyFree {X Y : Scheme.{u}} (f : Y ⟶ X) :
    FiniteLocallyFreeSheaf X ⥤ FiniteLocallyFreeSheaf Y := by
  sorry

noncomputable def pullbackFiniteLocallyFreeObjIso {X Y : Scheme.{u}} (f : Y ⟶ X)
    (E : FiniteLocallyFreeSheaf X) :
    ((pullbackFiniteLocallyFree f).obj E).obj ≅
      (Scheme.Modules.pullback f).obj E.obj := by
  sorry

noncomputable def pullbackIdIso (X : Scheme.{u}) :
    pullbackFiniteLocallyFree (𝟙 X) ≅ 𝟭 (FiniteLocallyFreeSheaf X) := by
  sorry

noncomputable def pullbackCompIso {X Y Z : Scheme.{u}} (f : Y ⟶ X) (g : Z ⟶ Y) :
    pullbackFiniteLocallyFree (g ≫ f) ≅
      pullbackFiniteLocallyFree f ⋙ pullbackFiniteLocallyFree g := by
  sorry

example {X Y : Scheme.{u}} (f : Y ⟶ X) (E : FiniteLocallyFreeSheaf X) (y : Y) :
    rank ((pullbackFiniteLocallyFree f).obj E) y = rank E (f y) := by
  sorry

noncomputable def tensorFiniteLocallyFree (X : Scheme.{u}) :
    FiniteLocallyFreeSheaf X × FiniteLocallyFreeSheaf X ⥤
      FiniteLocallyFreeSheaf X := by
  sorry

noncomputable def tensorFiniteLocallyFreeObjIso {X : Scheme.{u}}
    (E F : FiniteLocallyFreeSheaf X) :
    ((tensorFiniteLocallyFree X).obj (E, F)).obj ≅ E.obj ⊗ F.obj := by
  sorry

noncomputable def pullbackTensorIso {X Y : Scheme.{u}} (f : Y ⟶ X)
    (E F : FiniteLocallyFreeSheaf X) :
    (pullbackFiniteLocallyFree f).obj ((tensorFiniteLocallyFree X).obj (E, F)) ≅
      (tensorFiniteLocallyFree Y).obj
        ((pullbackFiniteLocallyFree f).obj E, (pullbackFiniteLocallyFree f).obj F) := by
  sorry

noncomputable def directSum (X : Scheme.{u}) :
    FiniteLocallyFreeSheaf X × FiniteLocallyFreeSheaf X ⥤
      FiniteLocallyFreeSheaf X := by
  sorry

noncomputable def directSumObjIso {X : Scheme.{u}}
    (E F : FiniteLocallyFreeSheaf X) :
    ((directSum X).obj (E, F)).obj ≅ Limits.coprod E.obj F.obj := by
  sorry

example {X : Scheme.{u}} (E F : FiniteLocallyFreeSheaf X) (x : X) :
    rank ((directSum X).obj (E, F)) x = rank E x + rank F x := by
  sorry

noncomputable def dual (X : Scheme.{u}) :
    (FiniteLocallyFreeSheaf X)ᵒᵖ ⥤ FiniteLocallyFreeSheaf X := by
  sorry

/-- The dual uses the L0 internal Hom, naturally in the sheaf. -/
noncomputable def dualUnderlyingIso {X : Scheme.{u}} (E : FiniteLocallyFreeSheaf X) :
    ((dual X).obj (op E)).obj ≅ (ihom E.obj).obj (SheafOfModules.unit X.ringCatSheaf) := by
  sorry

noncomputable def internalHomFinitelyPresented (X : Scheme.{u}) :
    (TauCeti.AlgebraicGeometry.FinitelyPresentedSheaf X)ᵒᵖ ⥤
      QuasicoherentSheaf X ⥤ QuasicoherentSheaf X := by
  sorry

noncomputable def internalHomQuasicoherent (X : Scheme.{u}) :
    (FiniteLocallyFreeSheaf X)ᵒᵖ ⥤
      QuasicoherentSheaf X ⥤ QuasicoherentSheaf X := by
  sorry

noncomputable def internalHomIsoDualTensor {X : Scheme.{u}}
    (E : FiniteLocallyFreeSheaf X) (F : QuasicoherentSheaf X) :
    ((internalHomQuasicoherent X).obj (op E)).obj F ≅
      (finiteLocallyFreeToQuasicoherent X).obj ((dual X).obj (op E)) ⊗ F := by
  sorry

noncomputable def doubleDualIso {X : Scheme.{u}} (E : FiniteLocallyFreeSheaf X) :
    E ≅ (dual X).obj (op ((dual X).obj (op E))) := by
  sorry

noncomputable def pullbackDualIso {X Y : Scheme.{u}} (f : Y ⟶ X)
    (E : FiniteLocallyFreeSheaf X) :
    (pullbackFiniteLocallyFree f).obj ((dual X).obj (op E)) ≅
      (dual Y).obj (op ((pullbackFiniteLocallyFree f).obj E)) := by
  sorry

example {X : Scheme.{u}} (E : QuasicoherentSheaf X) :
    (∃ E' : FiniteLocallyFreeSheaf X, Nonempty (E'.obj ≅ E.obj)) ↔
      Nonempty (HasLeftDual E) := by
  sorry

def isFiniteProjectiveModule (R : Type u) [CommRing R] :
    ObjectProperty (ModuleCat.{u} R) :=
  fun M => Module.Finite R M ∧ Module.Projective R M

abbrev FiniteProjectiveModule (R : Type u) [CommRing R] :=
  (isFiniteProjectiveModule R).FullSubcategory

noncomputable def tildeFiniteProjective (R : Type u) [CommRing R] :
    FiniteProjectiveModule R ⥤ FiniteLocallyFreeSheaf (Spec (.of R)) := by
  sorry

noncomputable def tildeFiniteProjectiveEquiv (R : Type u) [CommRing R] :
    FiniteProjectiveModule R ≌ FiniteLocallyFreeSheaf (Spec (.of R)) := by
  sorry

noncomputable def tildeFiniteProjectiveEquivFunctorIso
    (R : Type u) [CommRing R] :
    (tildeFiniteProjectiveEquiv R).functor ≅ tildeFiniteProjective R := by
  sorry

/-! ## L0C: polynomial operations and determinant -/

noncomputable def symmetricPowerModules (X : Scheme.{u}) (n : ℕ) :
    X.Modules ⥤ X.Modules := by
  sorry

noncomputable def symmetricPower (X : Scheme.{u}) (n : ℕ) :
    FiniteLocallyFreeSheaf X ⥤ FiniteLocallyFreeSheaf X := by
  sorry

noncomputable def symmetricPowerObjIso {X : Scheme.{u}}
    (E : FiniteLocallyFreeSheaf X) (n : ℕ) :
    ((symmetricPower X n).obj E).obj ≅ (symmetricPowerModules X n).obj E.obj := by
  sorry

noncomputable def pullbackSymmetricPowerIso {X Y : Scheme.{u}} (f : Y ⟶ X)
    (E : FiniteLocallyFreeSheaf X) (n : ℕ) :
    (pullbackFiniteLocallyFree f).obj ((symmetricPower X n).obj E) ≅
      (symmetricPower Y n).obj ((pullbackFiniteLocallyFree f).obj E) := by
  sorry

noncomputable def exteriorPowerModules (X : Scheme.{u}) (n : ℕ) :
    X.Modules ⥤ X.Modules := by
  sorry

noncomputable def exteriorPower (X : Scheme.{u}) (n : ℕ) :
    FiniteLocallyFreeSheaf X ⥤ FiniteLocallyFreeSheaf X := by
  sorry

noncomputable def exteriorPowerObjIso {X : Scheme.{u}}
    (E : FiniteLocallyFreeSheaf X) (n : ℕ) :
    ((exteriorPower X n).obj E).obj ≅ (exteriorPowerModules X n).obj E.obj := by
  sorry

noncomputable def pullbackExteriorPowerIso {X Y : Scheme.{u}} (f : Y ⟶ X)
    (E : FiniteLocallyFreeSheaf X) (n : ℕ) :
    (pullbackFiniteLocallyFree f).obj ((exteriorPower X n).obj E) ≅
      (exteriorPower Y n).obj ((pullbackFiniteLocallyFree f).obj E) := by
  sorry

noncomputable def determinantObj {X : Scheme.{u}}
    (E : FiniteLocallyFreeSheaf X) :
    TauCeti.AlgebraicGeometry.InvertibleSheaf X := by
  sorry

noncomputable def determinant (X : Scheme.{u}) (r : ℕ) :
    FiniteLocallyFreeSheafOfRank X r ⥤
      TauCeti.AlgebraicGeometry.InvertibleSheaf X := by
  sorry

noncomputable def determinantObjIso {X : Scheme.{u}} {r : ℕ}
    (E : FiniteLocallyFreeSheafOfRank X r) :
    ((determinant X r).obj E).obj ≅ (exteriorPowerModules X r).obj E.obj := by
  sorry

noncomputable def determinantFixedRankObjIso {X : Scheme.{u}} {r : ℕ}
    (E : FiniteLocallyFreeSheafOfRank X r) :
    (determinant X r).obj E ≅
      determinantObj ((finiteLocallyFreeOfRankForget X r).obj E) := by
  sorry

noncomputable def invertibleSheafEquivFiniteLocallyFreeRankOne (X : Scheme.{u}) :
    TauCeti.AlgebraicGeometry.InvertibleSheaf X ≌
      FiniteLocallyFreeSheafOfRank X 1 := by
  sorry

/-! ## L1A: relative Spec -/

def isQuasicoherentAlgebra (X : Scheme.{u}) : ObjectProperty (CommMon X.Modules) :=
  fun A => A.X.IsQuasicoherent

abbrev QuasicoherentAlgebra (X : Scheme.{u}) :=
  (isQuasicoherentAlgebra X).FullSubcategory

def isAffineSchemeOver (X : Scheme.{u}) : ObjectProperty (Over X) :=
  fun T => IsAffineHom T.hom

abbrev AffineSchemeOver (X : Scheme.{u}) :=
  (isAffineSchemeOver X).FullSubcategory

abbrev affineSchemeOverForget (X : Scheme.{u}) : AffineSchemeOver X ⥤ Over X :=
  ObjectProperty.ι (isAffineSchemeOver X)

noncomputable def structureSheafAlgebra (X : Scheme.{u}) : QuasicoherentAlgebra X :=
  ⟨{ X := SheafOfModules.unit X.ringCatSheaf
     mon := MonObj.ofIso (tensorUnitIso X)
     comm := by sorry }, by sorry⟩

noncomputable def pullbackQuasicoherentAlgebra {X Y : Scheme.{u}} (f : Y ⟶ X) :
    QuasicoherentAlgebra X ⥤ QuasicoherentAlgebra Y where
  obj A := ⟨(Scheme.Modules.pullback f).mapCommMon.obj A.obj, by sorry⟩
  map a := ⟨(Scheme.Modules.pullback f).mapCommMon.map a.hom⟩

noncomputable def baseChangeAffineSchemeOver {X Y : Scheme.{u}} (f : Y ⟶ X) :
    AffineSchemeOver X ⥤ AffineSchemeOver Y := by
  sorry

noncomputable def relativeSpec (X : Scheme.{u}) :
    (QuasicoherentAlgebra X)ᵒᵖ ⥤ AffineSchemeOver X := by
  sorry

/-- Pull back regular functions along a morphism over the base. -/
noncomputable def affineFunctionsUnderlyingMap {X : Scheme.{u}}
    {V W : AffineSchemeOver X} (g : V ⟶ W) :
    (Scheme.Modules.pushforward W.obj.hom).obj (SheafOfModules.unit W.obj.left.ringCatSheaf) ⟶
      (Scheme.Modules.pushforward V.obj.hom).obj (SheafOfModules.unit V.obj.left.ringCatSheaf) :=
  (Scheme.Modules.pushforward W.obj.hom).map
      (SheafOfModules.unitToPushforwardObjUnit g.hom.left.toRingCatSheafHom) ≫
    (Scheme.Modules.pushforwardComp g.hom.left W.obj.hom).inv.app
      (SheafOfModules.unit V.obj.left.ringCatSheaf) ≫
    (Scheme.Modules.pushforwardCongr g.hom.w).hom.app
      (SheafOfModules.unit V.obj.left.ringCatSheaf)

/-- The algebra carrier is literally `p_* O_V`; multiplication is multiplication of sections. -/
noncomputable def affineFunctionsAlgebra {X : Scheme.{u}} (V : AffineSchemeOver X) :
    QuasicoherentAlgebra X :=
  ⟨{ X := (Scheme.Modules.pushforward V.obj.hom).obj
        (SheafOfModules.unit V.obj.left.ringCatSheaf)
     mon := by sorry
     comm := by sorry }, by sorry⟩

theorem affineFunctionsAlgebra_unit {X : Scheme.{u}} (V : AffineSchemeOver X) :
    (tensorUnitIso X).inv ≫ MonObj.one (X := (affineFunctionsAlgebra V).obj.X) =
      SheafOfModules.unitToPushforwardObjUnit V.obj.hom.toRingCatSheafHom := by
  sorry

/-- The coordinate algebra multiplies actual regular functions on preimages of opens. -/
theorem affineFunctionsAlgebra_mul {X : Scheme.{u}} (V : AffineSchemeOver X) (U : X.Opens)
    (a b : Γ(V.obj.left, V.obj.hom ⁻¹ᵁ U)) :
    (MonObj.mul (X := (affineFunctionsAlgebra V).obj.X)).app U
      (tensorSection ((affineFunctionsAlgebra V).obj.X) ((affineFunctionsAlgebra V).obj.X) U a b) =
        a * b := by
  sorry

noncomputable def affineFunctions (X : Scheme.{u}) :
    AffineSchemeOver X ⥤ (QuasicoherentAlgebra X)ᵒᵖ where
  obj V := op (affineFunctionsAlgebra V)
  map g := (ObjectProperty.homMk (CommMon.homMk
    { hom := affineFunctionsUnderlyingMap g, isMonHom_hom := by sorry })).op
  map_id := by sorry
  map_comp := by sorry

@[simp] theorem affineFunctions_obj_underlying {X : Scheme.{u}} (V : AffineSchemeOver X) :
    ((affineFunctions X).obj V).unop.obj.X =
      (Scheme.Modules.pushforward V.obj.hom).obj
        (SheafOfModules.unit V.obj.left.ringCatSheaf) := rfl

@[simp] theorem affineFunctions_map_underlying {X : Scheme.{u}}
    {V W : AffineSchemeOver X} (g : V ⟶ W) :
    ((affineFunctions X).map g).unop.hom.hom.hom = affineFunctionsUnderlyingMap g := rfl

/-- Algebra pullback composition lifts the actual module comparison. -/
noncomputable def pullbackAlgebraCompOverIso {X : Scheme.{u}} {T T' : Over X}
    (g : T' ⟶ T) (A : QuasicoherentAlgebra X) :
    (pullbackQuasicoherentAlgebra g.left).obj ((pullbackQuasicoherentAlgebra T.hom).obj A) ≅
      (pullbackQuasicoherentAlgebra T'.hom).obj A := by
  sorry

theorem pullbackAlgebraCompOverIso_underlying {X : Scheme.{u}} {T T' : Over X}
    (g : T' ⟶ T) (A : QuasicoherentAlgebra X) :
    (pullbackAlgebraCompOverIso g A).hom.hom.hom.hom =
      (Scheme.Modules.pullbackComp g.left T.hom).hom.app A.obj.X ≫
        (Scheme.Modules.pullbackCongr g.w).hom.app A.obj.X := by
  sorry

noncomputable def pullbackStructureSheafAlgebraIso {X Y : Scheme.{u}} (f : Y ⟶ X) :
    (pullbackQuasicoherentAlgebra f).obj (structureSheafAlgebra X) ≅
      structureSheafAlgebra Y := by
  sorry

theorem pullbackStructureSheafAlgebraIso_underlying {X Y : Scheme.{u}} (f : Y ⟶ X) :
    (pullbackStructureSheafAlgebraIso f).hom.hom.hom.hom =
      SheafOfModules.pullbackObjUnitToUnit f.toRingCatSheafHom := by
  sorry

noncomputable def relativeSpecPoints (X : Scheme.{u}) :
    (QuasicoherentAlgebra X)ᵒᵖ ⥤ ((Over X)ᵒᵖ ⥤ Type u) :=
  relativeSpec X ⋙ affineSchemeOverForget X ⋙ yoneda

/-- Actual algebra maps, pulled back in the test scheme and precomposed in the algebra. -/
noncomputable def relativeSpecAlgebraMaps (X : Scheme.{u}) :
    (QuasicoherentAlgebra X)ᵒᵖ ⥤ ((Over X)ᵒᵖ ⥤ Type u) where
  obj A := {
    obj T := (pullbackQuasicoherentAlgebra T.unop.hom).obj A.unop ⟶
      structureSheafAlgebra T.unop.left
    map g := TypeCat.ofHom fun a => (pullbackAlgebraCompOverIso g.unop A.unop).inv ≫
      (pullbackQuasicoherentAlgebra g.unop.left).map a ≫
      (pullbackStructureSheafAlgebraIso g.unop.left).hom
    map_id := by sorry
    map_comp := by sorry }
  map a := {
    app T := TypeCat.ofHom fun h => (pullbackQuasicoherentAlgebra T.unop.hom).map a.unop ≫ h
    naturality := by sorry }
  map_id := by sorry
  map_comp := by sorry

noncomputable def relativeSpecUniversalProperty (X : Scheme.{u}) :
    relativeSpecPoints X ≅ relativeSpecAlgebraMaps X := by
  sorry

noncomputable def relativeSpecHomEquiv {X : Scheme.{u}}
    (A : QuasicoherentAlgebra X) (T : Over X) :
    (T ⟶ (affineSchemeOverForget X).obj ((relativeSpec X).obj (op A))) ≃
      ((pullbackQuasicoherentAlgebra T.hom).obj A ⟶
        structureSheafAlgebra T.left) :=
  (((relativeSpecUniversalProperty X).app (op A)).app (op T)).toEquiv

noncomputable def relativeSpecPushforwardIso {X : Scheme.{u}}
    (A : QuasicoherentAlgebra X) :
    (affineFunctions X).obj ((relativeSpec X).obj (op A)) ≅ op A := by
  sorry

noncomputable def relativeSpecCounitIso {X : Scheme.{u}}
    (V : AffineSchemeOver X) :
    (relativeSpec X).obj ((affineFunctions X).obj V) ≅ V := by
  sorry

/-! ## L1B: the relative-Spec anti-equivalence -/

noncomputable def relativeSpecBaseChangeIso {X Y : Scheme.{u}} (f : Y ⟶ X)
    (A : QuasicoherentAlgebra X) :
    (baseChangeAffineSchemeOver f).obj ((relativeSpec X).obj (op A)) ≅
      (relativeSpec Y).obj (op ((pullbackQuasicoherentAlgebra f).obj A)) := by
  sorry

noncomputable def relativeSpecEquiv (X : Scheme.{u}) :
    (QuasicoherentAlgebra X)ᵒᵖ ≌ AffineSchemeOver X := by
  sorry

noncomputable def relativeSpecEquivFunctorIso (X : Scheme.{u}) :
    (relativeSpecEquiv X).functor ≅ relativeSpec X := by
  sorry

noncomputable def relativeSpecEquivInverseIso (X : Scheme.{u}) :
    (relativeSpecEquiv X).inverse ≅ affineFunctions X := by
  sorry

/-! ## L2A: graded algebras and structured linear schemes -/

noncomputable def symmetricAlgebra (X : Scheme.{u}) :
    QuasicoherentSheaf X ⥤ QuasicoherentAlgebra X := by
  sorry

/-- The ambient commutative monoid object supplies graded multiplication, its laws, and graded
algebra morphisms; the object property only imposes quasicoherence of every component. -/
def isGradedQuasicoherentAlgebra (X : Scheme.{u}) :
    ObjectProperty (CommMon (GradedObject ℕ X.Modules)) :=
  fun A => ∀ n, (A.X n).IsQuasicoherent

abbrev GradedQuasicoherentAlgebra (X : Scheme.{u}) :=
  (isGradedQuasicoherentAlgebra X).FullSubcategory

noncomputable def gradedAlgebraForget (X : Scheme.{u}) :
    GradedQuasicoherentAlgebra X ⥤ QuasicoherentAlgebra X := by
  sorry

noncomputable def gradedSymmetricAlgebra (X : Scheme.{u}) :
    QuasicoherentSheaf X ⥤ GradedQuasicoherentAlgebra X := by
  sorry

noncomputable def gradedSymmetricAlgebraForgetIso (X : Scheme.{u}) :
    gradedSymmetricAlgebra X ⋙ gradedAlgebraForget X ≅ symmetricAlgebra X := by
  sorry

noncomputable def gradedAlgebraDegreeOne (X : Scheme.{u}) :
    GradedQuasicoherentAlgebra X ⥤ QuasicoherentSheaf X where
  obj A := ⟨A.obj.X 1, A.property 1⟩
  map f := ⟨f.hom.hom.hom 1⟩

noncomputable def gradedSymmetricAlgebraDegreeOneIso {X : Scheme.{u}}
    (F : QuasicoherentSheaf X) :
    (gradedAlgebraDegreeOne X).obj ((gradedSymmetricAlgebra X).obj F) ≅ F := by
  sorry

/-- The essential image is taken inside a category whose morphisms are graded algebra morphisms. -/
abbrev FreeGradedQuasicoherentAlgebra (X : Scheme.{u}) :=
  (gradedSymmetricAlgebra X).EssImageSubcategory

noncomputable def freeGradedAlgebraForget (X : Scheme.{u}) :
    FreeGradedQuasicoherentAlgebra X ⥤ GradedQuasicoherentAlgebra X :=
  (gradedSymmetricAlgebra X).essImage.ι

noncomputable def gradedSymmetricAlgebraFree (X : Scheme.{u}) :
    QuasicoherentSheaf X ⥤ FreeGradedQuasicoherentAlgebra X :=
  (gradedSymmetricAlgebra X).toEssImage

noncomputable def gradedSymmetricAlgebraEquiv (X : Scheme.{u}) :
    QuasicoherentSheaf X ≌ FreeGradedQuasicoherentAlgebra X := by
  sorry

noncomputable def gradedSymmetricAlgebraEquivFunctorIso (X : Scheme.{u}) :
    (gradedSymmetricAlgebraEquiv X).functor ≅ gradedSymmetricAlgebraFree X := by
  sorry

noncomputable def linearSpecScheme (X : Scheme.{u}) :
    (QuasicoherentSheaf X)ᵒᵖ ⥤ AffineSchemeOver X :=
  (symmetricAlgebra X).op ⋙ relativeSpec X

/-- An affine scheme together with its freely generated graded coordinate algebra. -/
structure QuasicoherentLinearScheme (X : Scheme.{u}) where
  toAffineSchemeOver : AffineSchemeOver X
  coordinateAlgebra : FreeGradedQuasicoherentAlgebra X
  coordinateIso :
    (affineFunctions X).obj toAffineSchemeOver ≅
      op ((gradedAlgebraForget X).obj
        ((freeGradedAlgebraForget X).obj coordinateAlgebra))

namespace QuasicoherentLinearScheme

/-- The coordinate morphism is genuinely graded, and the equation identifies it with the map
induced by the underlying scheme morphism. -/
structure Hom {X : Scheme.{u}} (V W : QuasicoherentLinearScheme X) where
  schemeHom : V.toAffineSchemeOver ⟶ W.toAffineSchemeOver
  coordinateHom : W.coordinateAlgebra ⟶ V.coordinateAlgebra
  compatibility :
    (affineFunctions X).map schemeHom ≫ W.coordinateIso.hom =
      V.coordinateIso.hom ≫
        ((freeGradedAlgebraForget X ⋙ gradedAlgebraForget X).map coordinateHom).op

noncomputable instance (X : Scheme.{u}) : Category.{u} (QuasicoherentLinearScheme X) where
  Hom := Hom
  id V := ⟨𝟙 V.toAffineSchemeOver, 𝟙 V.coordinateAlgebra, by sorry⟩
  comp f g := ⟨f.schemeHom ≫ g.schemeHom, g.coordinateHom ≫ f.coordinateHom, by sorry⟩
  id_comp := by sorry
  comp_id := by sorry
  assoc := by sorry

@[ext] theorem hom_ext {X : Scheme.{u}} {V W : QuasicoherentLinearScheme X}
    {f g : V ⟶ W} (hs : f.schemeHom = g.schemeHom)
    (hc : f.coordinateHom = g.coordinateHom) : f = g := by
  cases f
  cases g
  cases hs
  cases hc
  rfl

end QuasicoherentLinearScheme

noncomputable def linearSchemeForget (X : Scheme.{u}) :
    QuasicoherentLinearScheme X ⥤ AffineSchemeOver X where
  obj V := V.toAffineSchemeOver
  map f := f.schemeHom

@[simp] theorem linearSchemeForget_map {X : Scheme.{u}}
    {V W : QuasicoherentLinearScheme X} (f : V ⟶ W) :
    (linearSchemeForget X).map f = f.schemeHom := rfl

example {X : Scheme.{u}} {V W : QuasicoherentLinearScheme X} (f : V ⟶ W) :
    V.toAffineSchemeOver ⟶ W.toAffineSchemeOver := f.schemeHom

/-- Relative Spec with the free grading retained. -/
noncomputable def gradedRelativeSpec (X : Scheme.{u}) :
    (FreeGradedQuasicoherentAlgebra X)ᵒᵖ ⥤ QuasicoherentLinearScheme X := by
  sorry

/-- Extract the graded coordinate algebra of a structured linear scheme. -/
noncomputable def linearSchemeCoordinates (X : Scheme.{u}) :
    QuasicoherentLinearScheme X ⥤ (FreeGradedQuasicoherentAlgebra X)ᵒᵖ where
  obj V := op V.coordinateAlgebra
  map f := f.coordinateHom.op

@[simp] theorem linearSchemeCoordinates_map {X : Scheme.{u}}
    {V W : QuasicoherentLinearScheme X} (f : V ⟶ W) :
    (linearSchemeCoordinates X).map f = f.coordinateHom.op := rfl

/-- The structured form of relative Spec on free graded algebras. -/
noncomputable def gradedRelativeSpecEquiv (X : Scheme.{u}) :
    (FreeGradedQuasicoherentAlgebra X)ᵒᵖ ≌ QuasicoherentLinearScheme X := by
  sorry

noncomputable def gradedRelativeSpecEquivFunctorIso (X : Scheme.{u}) :
    (gradedRelativeSpecEquiv X).functor ≅ gradedRelativeSpec X := by
  sorry

/-- Forgetting the grading recovers ordinary relative Spec of the total algebra. -/
noncomputable def gradedRelativeSpecForgetIso (X : Scheme.{u}) :
    gradedRelativeSpec X ⋙ linearSchemeForget X ≅
      (freeGradedAlgebraForget X ⋙ gradedAlgebraForget X).op ⋙ relativeSpec X := by
  sorry

noncomputable def linearSpec (X : Scheme.{u}) :
    (QuasicoherentSheaf X)ᵒᵖ ⥤ QuasicoherentLinearScheme X :=
  (gradedSymmetricAlgebraFree X).op ⋙ gradedRelativeSpec X

noncomputable def linearSpecForgetIso (X : Scheme.{u}) :
    linearSpec X ⋙ linearSchemeForget X ≅ linearSpecScheme X := by
  sorry

noncomputable def degreeOne (X : Scheme.{u}) :
    QuasicoherentLinearScheme X ⥤ (QuasicoherentSheaf X)ᵒᵖ :=
  linearSchemeCoordinates X ⋙ (freeGradedAlgebraForget X ⋙ gradedAlgebraDegreeOne X).op

noncomputable def linearSpecDegreeOneIso {X : Scheme.{u}}
    (V : QuasicoherentLinearScheme X) :
    (linearSpec X).obj ((degreeOne X).obj V) ≅ V := by
  sorry

noncomputable def degreeOneLinearSpecIso {X : Scheme.{u}}
    (F : (QuasicoherentSheaf X)ᵒᵖ) :
    (degreeOne X).obj ((linearSpec X).obj F) ≅ F := by
  sorry

noncomputable def linearSpecEquiv (X : Scheme.{u}) :
    (QuasicoherentSheaf X)ᵒᵖ ≌ QuasicoherentLinearScheme X := by
  sorry

noncomputable def linearSpecEquivFunctorIso (X : Scheme.{u}) :
    (linearSpecEquiv X).functor ≅ linearSpec X := by
  sorry

/-! ## L2B: geometric vector bundles -/

noncomputable def isGeometricVectorBundle (X : Scheme.{u}) :
    ObjectProperty (QuasicoherentLinearScheme X) :=
  fun V => ∃ E : FiniteLocallyFreeSheaf X,
    Nonempty (E.obj ≅ ((degreeOne X).obj V).unop.obj)

noncomputable abbrev GeometricVectorBundle (X : Scheme.{u}) :=
  (isGeometricVectorBundle X).FullSubcategory

noncomputable abbrev geometricVectorBundleToLinearScheme (X : Scheme.{u}) :
    GeometricVectorBundle X ⥤ QuasicoherentLinearScheme X :=
  ObjectProperty.ι (isGeometricVectorBundle X)

noncomputable def dualAsQuasicoherentOp (X : Scheme.{u}) :
    FiniteLocallyFreeSheaf X ⥤ (QuasicoherentSheaf X)ᵒᵖ :=
  (dual X).rightOp ⋙ (finiteLocallyFreeToQuasicoherent X).op

noncomputable def totalSpaceScheme (X : Scheme.{u}) :
    FiniteLocallyFreeSheaf X ⥤ AffineSchemeOver X :=
  dualAsQuasicoherentOp X ⋙ linearSpecScheme X

noncomputable def totalSpace (X : Scheme.{u}) :
    FiniteLocallyFreeSheaf X ⥤ GeometricVectorBundle X := by
  sorry

noncomputable def totalSpaceLinearSpecIso (X : Scheme.{u}) :
    totalSpace X ⋙ geometricVectorBundleToLinearScheme X ≅
      dualAsQuasicoherentOp X ⋙ linearSpec X := by
  sorry

noncomputable def totalSpaceForgetIso (X : Scheme.{u}) :
    totalSpace X ⋙ geometricVectorBundleToLinearScheme X ⋙ linearSchemeForget X ≅
      totalSpaceScheme X := by
  sorry

noncomputable def totalSpaceEquiv (X : Scheme.{u}) :
    FiniteLocallyFreeSheaf X ≌ GeometricVectorBundle X := by
  sorry

noncomputable def totalSpaceEquivFunctorIso (X : Scheme.{u}) :
    (totalSpaceEquiv X).functor ≅ totalSpace X := by
  sorry

set_option backward.isDefEq.respectTransparency false in
/-- Restriction of pulled-back sections along an actual morphism of test schemes. -/
noncomputable def pullbackSectionMap {X : Scheme.{u}} (E : X.Modules)
    {T T' : Over X} (g : T' ⟶ T)
    (s : SheafOfModules.unit T.left.ringCatSheaf ⟶
      (Scheme.Modules.pullback T.hom).obj E) :
    SheafOfModules.unit T'.left.ringCatSheaf ⟶
      (Scheme.Modules.pullback T'.hom).obj E :=
  inv (SheafOfModules.pullbackObjUnitToUnit g.left.toRingCatSheafHom) ≫
    (Scheme.Modules.pullback g.left).map s ≫
    (Scheme.Modules.pullbackComp g.left T.hom).hom.app E ≫
    (Scheme.Modules.pullbackCongr g.w).hom.app E

noncomputable def totalSpacePoints (X : Scheme.{u}) :
    FiniteLocallyFreeSheaf X ⥤ ((Over X)ᵒᵖ ⥤ Type u) :=
  totalSpaceScheme X ⋙ affineSchemeOverForget X ⋙ yoneda

noncomputable def pullbackSections (X : Scheme.{u}) :
    FiniteLocallyFreeSheaf X ⥤ ((Over X)ᵒᵖ ⥤ Type u) where
  obj E := {
    obj T := SheafOfModules.unit T.unop.left.ringCatSheaf ⟶
      (Scheme.Modules.pullback T.unop.hom).obj E.obj
    map g := TypeCat.ofHom fun s => pullbackSectionMap E.obj g.unop s
    map_id := by sorry
    map_comp := by sorry }
  map f := {
    app T := TypeCat.ofHom fun s => s ≫ (Scheme.Modules.pullback T.unop.hom).map f.hom
    naturality := by sorry }
  map_id := by sorry
  map_comp := by sorry

/-- Yoneda-level universal property, simultaneously natural in both variables. -/
noncomputable def totalSpaceUniversalProperty (X : Scheme.{u}) :
    totalSpacePoints X ≅ pullbackSections X := by
  sorry

/-- The pointwise equivalence is the component of the natural universal property. -/
noncomputable def totalSpaceHomEquiv {X : Scheme.{u}}
    (E : FiniteLocallyFreeSheaf X) (T : Over X) :
    (T ⟶ (affineSchemeOverForget X).obj ((totalSpaceScheme X).obj E)) ≃
      (SheafOfModules.unit T.left.ringCatSheaf ⟶
        (Scheme.Modules.pullback T.hom).obj E.obj) :=
  (((totalSpaceUniversalProperty X).app E).app (op T)).toEquiv

theorem totalSpaceHomEquiv_naturality_test {X : Scheme.{u}}
    (E : FiniteLocallyFreeSheaf X) {T T' : Over X} (g : T' ⟶ T)
    (h : T ⟶ (affineSchemeOverForget X).obj ((totalSpaceScheme X).obj E)) :
    totalSpaceHomEquiv E T' (g ≫ h) =
      pullbackSectionMap E.obj g (totalSpaceHomEquiv E T h) := by
  exact ConcreteCategory.congr_hom (((totalSpaceUniversalProperty X).hom.app E).naturality g.op) h

theorem totalSpaceHomEquiv_naturality_bundle {X : Scheme.{u}}
    {E F : FiniteLocallyFreeSheaf X} (a : E ⟶ F) (T : Over X)
    (h : T ⟶ (affineSchemeOverForget X).obj ((totalSpaceScheme X).obj E)) :
    totalSpaceHomEquiv F T (h ≫ (affineSchemeOverForget X).map ((totalSpaceScheme X).map a)) =
      totalSpaceHomEquiv E T h ≫ (Scheme.Modules.pullback T.hom).map a.hom := by
  have hn := congrArg (fun n => n.app (op T)) ((totalSpaceUniversalProperty X).hom.naturality a)
  exact ConcreteCategory.congr_hom hn h

set_option backward.isDefEq.respectTransparency false in
/-- Extension of the actual module stalk to the residue field. -/
noncomputable def moduleFiber {X : Scheme.{u}} (E : FiniteLocallyFreeSheaf X) (x : X) :
    ModuleCat (X.residueField x) := by
  letI : Module (X.presheaf.stalk x) (E.obj.presheaf.stalk x) :=
    inferInstanceAs (Module (X.presheaf.stalk x) ↑(TopCat.Presheaf.stalk E.obj.val.presheaf x))
  letI := (X.residue x).hom.toAlgebra
  exact ModuleCat.of (X.residueField x)
    (TensorProduct (X.presheaf.stalk x) (X.residueField x) (E.obj.presheaf.stalk x))

noncomputable def affineSpaceOfModuleFiber {X : Scheme.{u}}
    (E : FiniteLocallyFreeSheaf X) (x : X) : Over (Spec (X.residueField x)) :=
  Over.mk (Spec.map (CommRingCat.ofHom (algebraMap (X.residueField x)
    (SymmetricAlgebra (X.residueField x) (Module.Dual (X.residueField x) (moduleFiber E x))))))

noncomputable def totalSpaceFiberIso {X : Scheme.{u}}
    (E : FiniteLocallyFreeSheaf X) (x : X) :
    Over.mk (((affineSchemeOverForget X).obj
      ((totalSpaceScheme X).obj E)).hom.fiberToSpecResidueField x) ≅
      affineSpaceOfModuleFiber E x := by
  sorry

/-! ## Base change and normalization -/

noncomputable def baseChangeLinearScheme {X Y : Scheme.{u}} (f : Y ⟶ X) :
    QuasicoherentLinearScheme X ⥤ QuasicoherentLinearScheme Y := by
  sorry

noncomputable def linearSpecBaseChangeIso {X Y : Scheme.{u}} (f : Y ⟶ X)
    (F : (QuasicoherentSheaf X)ᵒᵖ) :
    (baseChangeLinearScheme f).obj ((linearSpec X).obj F) ≅
      (linearSpec Y).obj (op ((pullbackQuasicoherent f).obj F.unop)) := by
  sorry

noncomputable def baseChangeGeometricVectorBundle {X Y : Scheme.{u}} (f : Y ⟶ X) :
    GeometricVectorBundle X ⥤ GeometricVectorBundle Y := by
  sorry

noncomputable def totalSpaceBaseChangeIso {X Y : Scheme.{u}} (f : Y ⟶ X)
    (E : FiniteLocallyFreeSheaf X) :
    (baseChangeGeometricVectorBundle f).obj ((totalSpace X).obj E) ≅
      (totalSpace Y).obj ((pullbackFiniteLocallyFree f).obj E) := by
  sorry

noncomputable def freeFiniteLocallyFree (X : Scheme.{u}) (r : ℕ) :
    FiniteLocallyFreeSheaf X :=
  ⟨SheafOfModules.free (R := X.ringCatSheaf) (ULift.{u} (Fin r)), by sorry⟩

noncomputable def affineSpaceOver (X : Scheme.{u}) (r : ℕ) :
    AffineSchemeOver X :=
  ⟨Over.mk (AlgebraicGeometry.AffineSpace (ULift.{u} (Fin r)) X ↘ X), by sorry⟩

noncomputable def totalSpaceFreeIso (X : Scheme.{u}) (r : ℕ) :
    (totalSpaceScheme X).obj (freeFiniteLocallyFree X r) ≅ affineSpaceOver X r := by
  sorry

set_option backward.isDefEq.respectTransparency false in
/-- Coordinate projection from the actual finite coproduct of copies of the structure sheaf. -/
noncomputable def freeCoordinate (X : Scheme.{u}) {r : ℕ} (i : ULift.{u} (Fin r)) :
    (freeFiniteLocallyFree X r).obj ⟶ SheafOfModules.unit X.ringCatSheaf :=
  Sigma.desc (C := X.Modules) fun j => if j = i then 𝟙 _ else (0 : (SheafOfModules.unit X.ringCatSheaf : X.Modules) ⟶ _)

set_option backward.isDefEq.respectTransparency false in
/-- Evaluate the pulled-back section in the standard free basis. -/
noncomputable def freeSectionCoordinates {X : Scheme.{u}} (r : ℕ) (T : Over X)
    (s : SheafOfModules.unit T.left.ringCatSheaf ⟶
      (Scheme.Modules.pullback T.hom).obj (freeFiniteLocallyFree X r).obj) :
    ULift.{u} (Fin r) → Γ(T.left, ⊤) :=
  fun i => Scheme.Modules.Hom.app (s ≫ (SheafOfModules.pullbackObjFreeIso T.hom.toRingCatSheafHom
    (ULift.{u} (Fin r))).hom ≫ freeCoordinate T.left i) ⊤ (1 : Γ(T.left, ⊤))

noncomputable def freeSectionsEquiv {X : Scheme.{u}} (r : ℕ) (T : Over X) :
    (SheafOfModules.unit T.left.ringCatSheaf ⟶
      (Scheme.Modules.pullback T.hom).obj (freeFiniteLocallyFree X r).obj) ≃
      (ULift.{u} (Fin r) → Γ(T.left, ⊤)) where
  toFun := freeSectionCoordinates r T
  invFun := by sorry
  left_inv := by sorry
  right_inv := by sorry

theorem freeSectionsEquiv_pullback {X : Scheme.{u}} (r : ℕ) {T T' : Over X}
    (g : T' ⟶ T) (s : SheafOfModules.unit T.left.ringCatSheaf ⟶
      (Scheme.Modules.pullback T.hom).obj (freeFiniteLocallyFree X r).obj)
    (i : ULift.{u} (Fin r)) :
    freeSectionsEquiv r T' (pullbackSectionMap (freeFiniteLocallyFree X r).obj g s) i =
      g.left.appTop (freeSectionsEquiv r T s i) := by
  sorry

/-- Rank one recovers regular functions, with restriction tested below. -/
noncomputable def totalSpaceFreeLinePoints {X : Scheme.{u}} (T : Over X) :
    (T ⟶ (affineSchemeOverForget X).obj
      ((totalSpaceScheme X).obj (freeFiniteLocallyFree X 1))) ≃ Γ(T.left, ⊤) :=
  (totalSpaceHomEquiv (freeFiniteLocallyFree X 1) T).trans
    ((freeSectionsEquiv 1 T).trans (Equiv.funUnique (ULift.{u} (Fin 1)) _))

theorem totalSpaceFreeLinePoints_pullback {X : Scheme.{u}} {T T' : Over X}
    (g : T' ⟶ T) (h : T ⟶ (affineSchemeOverForget X).obj
      ((totalSpaceScheme X).obj (freeFiniteLocallyFree X 1))) :
    totalSpaceFreeLinePoints T' (g ≫ h) = g.left.appTop (totalSpaceFreeLinePoints T h) := by
  sorry

/-- The free-bundle normalization agrees with Mathlib's coordinate-valued affine-space map. -/
theorem totalSpaceFreeIso_homOfVector {X : Scheme.{u}} (r : ℕ) (T : Over X)
    (v : ULift.{u} (Fin r) → Γ(T.left, ⊤)) :
    (((totalSpaceHomEquiv (freeFiniteLocallyFree X r) T).symm
      ((freeSectionsEquiv r T).symm v)) ≫
      (affineSchemeOverForget X).map (totalSpaceFreeIso X r).hom).left =
        AffineSpace.homOfVector T.hom v := by
  sorry

/-- A matrix is measured on the actual standard generators, not on a separately chosen functor. -/
theorem totalSpaceFree_matrix {X : Scheme.{u}} {r s : ℕ}
    (a : freeFiniteLocallyFree X r ⟶ freeFiniteLocallyFree X s)
    (A : Matrix (ULift.{u} (Fin s)) (ULift.{u} (Fin r)) Γ(X, ⊤))
    (hA : ∀ i j, Scheme.Modules.Hom.app (X := X) (SheafOfModules.ιFree (R := X.ringCatSheaf) j ≫ a.hom ≫ freeCoordinate X i) ⊤ (1 : Γ(X, ⊤)) = A i j)
    (T : Over X) (h : T ⟶ (affineSchemeOverForget X).obj
      ((totalSpaceScheme X).obj (freeFiniteLocallyFree X r))) (i : ULift.{u} (Fin s)) :
    freeSectionsEquiv s T (totalSpaceHomEquiv (freeFiniteLocallyFree X s) T
      (h ≫ (affineSchemeOverForget X).map ((totalSpaceScheme X).map a))) i =
        ∑ j, T.hom.appTop (A i j) *
          freeSectionsEquiv r T (totalSpaceHomEquiv (freeFiniteLocallyFree X r) T h) j := by
  sorry

noncomputable def totalSpaceDirectSumIso {X : Scheme.{u}}
    (E F : FiniteLocallyFreeSheaf X) :
    (affineSchemeOverForget X).obj
        ((totalSpaceScheme X).obj ((directSum X).obj (E, F))) ≅
      Limits.prod
        ((affineSchemeOverForget X).obj ((totalSpaceScheme X).obj E))
        ((affineSchemeOverForget X).obj ((totalSpaceScheme X).obj F)) := by
  sorry

end TauCetiRoadmap.AlgebraicVectorBundles
