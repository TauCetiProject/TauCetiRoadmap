import Mathlib.AlgebraicGeometry.AffineSpace
import Mathlib.AlgebraicGeometry.Fiber
import Mathlib.AlgebraicGeometry.Modules.Tilde
import Mathlib.AlgebraicGeometry.Morphisms.Affine
import Mathlib.CategoryTheory.EssentialImage
import Mathlib.CategoryTheory.GradedObject.Braiding
import Mathlib.CategoryTheory.Monoidal.CommMon_
import Mathlib.CategoryTheory.Monoidal.Rigid.Basic
import Mathlib.CategoryTheory.Monoidal.Subcategory
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

/-! ## L0B: quasicoherent and finite locally free sheaves -/

noncomputable def finiteLocallyFreeToQuasicoherent (X : Scheme.{u}) :
    FiniteLocallyFreeSheaf X ⥤ QuasicoherentSheaf X := by
  sorry

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

noncomputable def structureSheafAlgebra (X : Scheme.{u}) : QuasicoherentAlgebra X := by
  sorry

noncomputable def pullbackQuasicoherentAlgebra {X Y : Scheme.{u}} (f : Y ⟶ X) :
    QuasicoherentAlgebra X ⥤ QuasicoherentAlgebra Y := by
  sorry

noncomputable def baseChangeAffineSchemeOver {X Y : Scheme.{u}} (f : Y ⟶ X) :
    AffineSchemeOver X ⥤ AffineSchemeOver Y := by
  sorry

noncomputable def relativeSpec (X : Scheme.{u}) :
    (QuasicoherentAlgebra X)ᵒᵖ ⥤ AffineSchemeOver X := by
  sorry

noncomputable def affineFunctions (X : Scheme.{u}) :
    AffineSchemeOver X ⥤ (QuasicoherentAlgebra X)ᵒᵖ := by
  sorry

noncomputable def relativeSpecHomEquiv {X : Scheme.{u}}
    (A : QuasicoherentAlgebra X) (T : Over X) :
    (T ⟶ (affineSchemeOverForget X).obj ((relativeSpec X).obj (op A))) ≃
      ((pullbackQuasicoherentAlgebra T.hom).obj A ⟶
        structureSheafAlgebra T.left) := by
  sorry

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
    GradedQuasicoherentAlgebra X ⥤ QuasicoherentSheaf X := by
  sorry

noncomputable def gradedSymmetricAlgebraDegreeOneIso {X : Scheme.{u}}
    (F : QuasicoherentSheaf X) :
    (gradedAlgebraDegreeOne X).obj ((gradedSymmetricAlgebra X).obj F) ≅ F := by
  sorry

/-- The essential image is taken inside a category whose morphisms are graded algebra morphisms. -/
abbrev FreeGradedQuasicoherentAlgebra (X : Scheme.{u}) :=
  (gradedSymmetricAlgebra X).EssImageSubcategory

noncomputable def freeGradedAlgebraForget (X : Scheme.{u}) :
    FreeGradedQuasicoherentAlgebra X ⥤ GradedQuasicoherentAlgebra X := by
  sorry

noncomputable def gradedSymmetricAlgebraFree (X : Scheme.{u}) :
    QuasicoherentSheaf X ⥤ FreeGradedQuasicoherentAlgebra X := by
  sorry

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

instance (X : Scheme.{u}) : Quiver (QuasicoherentLinearScheme X) where
  Hom := Hom

noncomputable instance (X : Scheme.{u}) : Category.{u} (QuasicoherentLinearScheme X) := by
  sorry

end QuasicoherentLinearScheme

noncomputable def linearSchemeForget (X : Scheme.{u}) :
    QuasicoherentLinearScheme X ⥤ AffineSchemeOver X := by
  sorry

/-- Relative Spec with the free grading retained. -/
noncomputable def gradedRelativeSpec (X : Scheme.{u}) :
    (FreeGradedQuasicoherentAlgebra X)ᵒᵖ ⥤ QuasicoherentLinearScheme X := by
  sorry

/-- Extract the graded coordinate algebra of a structured linear scheme. -/
noncomputable def linearSchemeCoordinates (X : Scheme.{u}) :
    QuasicoherentLinearScheme X ⥤ (FreeGradedQuasicoherentAlgebra X)ᵒᵖ := by
  sorry

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
    QuasicoherentLinearScheme X ⥤ (QuasicoherentSheaf X)ᵒᵖ := by
  sorry

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
    FiniteLocallyFreeSheaf X ⥤ (QuasicoherentSheaf X)ᵒᵖ := by
  sorry

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

noncomputable def totalSpaceHomEquiv {X : Scheme.{u}}
    (E : FiniteLocallyFreeSheaf X) (T : Over X) :
    (T ⟶ (affineSchemeOverForget X).obj ((totalSpaceScheme X).obj E)) ≃
      (SheafOfModules.unit T.left.ringCatSheaf ⟶
        (Scheme.Modules.pullback T.hom).obj E.obj) := by
  sorry

noncomputable def totalSpacePoints (X : Scheme.{u}) :
    FiniteLocallyFreeSheaf X ⥤ ((Over X)ᵒᵖ ⥤ Type (u + 1)) := by
  sorry

noncomputable def pullbackSections (X : Scheme.{u}) :
    FiniteLocallyFreeSheaf X ⥤ ((Over X)ᵒᵖ ⥤ Type (u + 1)) := by
  sorry

/-- Yoneda-level universal property, simultaneously natural in both variables. -/
noncomputable def totalSpaceUniversalProperty (X : Scheme.{u}) :
    totalSpacePoints X ≅ pullbackSections X := by
  sorry

noncomputable def affineSpaceOfModuleFiber {X : Scheme.{u}}
    (E : FiniteLocallyFreeSheaf X) (x : X) : Over (Spec (X.residueField x)) := by
  sorry

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
    FiniteLocallyFreeSheaf X := by
  sorry

noncomputable def affineSpaceOver (X : Scheme.{u}) (r : ℕ) :
    AffineSchemeOver X := by
  sorry

noncomputable def totalSpaceFreeIso (X : Scheme.{u}) (r : ℕ) :
    (totalSpaceScheme X).obj (freeFiniteLocallyFree X r) ≅ affineSpaceOver X r := by
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
