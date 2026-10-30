import Mathlib.Algebra.Category.ModuleCat.Colimits
import Mathlib.CategoryTheory.SingleObj
import Mathlib.CategoryTheory.Functor.KanExtension.Pointwise

/-!
Illustrative, nonexhaustive native-carrier constructions. The README is definitive.
These ordinary Kan extensions take values in all small modules. No preservation
of finite dimension, polynomiality or additivity on the source hom-sets is asserted.
-/

noncomputable section
namespace TauCetiRoadmap.ClassicalGroups.EndomorphismKanExtension
open CategoryTheory CategoryTheory.Limits
universe u v
variable {R : Type u} [Ring R]

def inclusion (X : ModuleCat.{v} R) :
    SingleObj (End X) ⥤ ModuleCat.{v} R :=
  SingleObj.functor (MonoidHom.id (End X))

instance inclusion_full (X : ModuleCat.{v} R) : (inclusion X).Full where
  map_surjective := by
    intro A B f
    exact ⟨f, rfl⟩

instance inclusion_faithful (X : ModuleCat.{v} R) : (inclusion X).Faithful where
  map_injective := by
    intro A B f g h
    exact h

instance pointwise_exists (X : ModuleCat.{v} R)
    (F : SingleObj (End X) ⥤ ModuleCat.{v} R) :
    (inclusion X).HasPointwiseLeftKanExtension F := by
  intro Y
  change HasColimit (CostructuredArrow.proj (inclusion X) Y ⋙ F)
  infer_instance

def extension (X : ModuleCat.{v} R)
    (F : SingleObj (End X) ⥤ ModuleCat.{v} R) :
    ModuleCat.{v} R ⥤ ModuleCat.{v} R :=
  (inclusion X).pointwiseLeftKanExtension F

def unit (X : ModuleCat.{v} R)
    (F : SingleObj (End X) ⥤ ModuleCat.{v} R) :
    F ⟶ inclusion X ⋙ extension X F :=
  (inclusion X).pointwiseLeftKanExtensionUnit F

theorem unit_isIso (X : ModuleCat.{v} R)
    (F : SingleObj (End X) ⥤ ModuleCat.{v} R) : IsIso (unit X F) := by
  exact ((inclusion X).pointwiseLeftKanExtensionIsPointwiseLeftKanExtension F).isIso_hom

def restrictionIso (X : ModuleCat.{v} R)
    (F : SingleObj (End X) ⥤ ModuleCat.{v} R) :
    F ≅ inclusion X ⋙ extension X F := by
  letI := unit_isIso X F
  exact asIso (unit X F)

theorem restrictionIso_hom (X : ModuleCat.{v} R)
    (F : SingleObj (End X) ⥤ ModuleCat.{v} R) :
    (restrictionIso X F).hom = unit X F := rfl

def colimitModel (X Y : ModuleCat.{v} R)
    (F : SingleObj (End X) ⥤ ModuleCat.{v} R) :
    (extension X F).obj Y ≅
      colimit (CostructuredArrow.proj (inclusion X) Y ⋙ F) :=
  Iso.refl _

def matrixInclusion (n : ℕ) :
    SingleObj (End (ModuleCat.of R (ULift.{v} (Fin n → R)))) ⥤
      ModuleCat.{max u v} R :=
  inclusion (ModuleCat.of R (ULift.{v} (Fin n → R)))

end TauCetiRoadmap.ClassicalGroups.EndomorphismKanExtension
