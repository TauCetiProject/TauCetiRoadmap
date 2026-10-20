import TauCeti.AlgebraicGeometry.LineBundle.TensorProduct
import TauCeti.AlgebraicGeometry.LineBundle.Class
import TauCeti.AlgebraicGeometry.Modules.GlobalSections

/-!
Illustrative interfaces for EnriquesSurfaces E0/E3. The README is definitive;
these suggestions do not exhaust it. Schemes, sheaves, sections, tensor products
and scalar actions below are native objects. The evaluation is attached to the
actual chosen sections; it is not asserted surjective at a base point.
-/

open CategoryTheory AlgebraicGeometry Opposite
open TauCeti.AlgebraicGeometry

namespace TauCetiRoadmap.EnriquesSurfaces

universe u

/-- The base-field map records the actual structure morphism. -/
noncomputable def baseGlobal (k : Type u) [Field k] (X : Scheme.{u})
    (f : X ⟶ Spec (CommRingCat.of k)) : k →+* Γ(X, ⊤) :=
  ((Scheme.ΓSpecIso (CommRingCat.of k)).inv ≫ f.appTop).hom

/-- Scalar arrows before rigidification, on the actual sheaf representative. -/
noncomputable def scalarAut (k : Type u) [Field k] (X : Scheme.{u})
    (f : X ⟶ Spec (CommRingCat.of k)) (L : InvertibleSheaf X) (a : kˣ) : Aut L.obj :=
  asIso (Scheme.Modules.globalSectionsSmul L.obj
    ((Units.map (baseGlobal k X f).toMonoidHom a : Γ(X, ⊤)ˣ) : Γ(X, ⊤)))

/-- The free-sheaf evaluation map of an explicit finite section family. -/
noncomputable def sectionEvaluation {X : Scheme.{u}} (L : InvertibleSheaf X)
    (n : ℕ) (s : Fin n → L.obj.sections) :
    SheafOfModules.free (R := X.ringCatSheaf) (ULift.{u} (Fin n)) ⟶ L.obj :=
  (SheafOfModules.freeHomEquiv L.obj).symm (fun i ↦ s i.down)

/-- A square trivialization belongs to the actual line bundle, not its class alone. -/
abbrev SquareTrivialization {X : Scheme.{u}} (L : InvertibleSheaf X) :=
  InvertibleSheaf.tensorProduct L L ≅ InvertibleSheaf.trivial X

/-- Raw arrow over the identity surface map: theta is retained before quotienting
scalars. The induced plane map is its projectivized section map in E3. -/
abbrev RawFixedSurfaceArrow {X : Scheme.{u}} (L L' : InvertibleSheaf X) := L ≅ L'

/-- The class equation is a theorem about any chosen square trivialization. -/
theorem class_square_eq_one {X : Scheme.{u}} (L : InvertibleSheaf X)
    (tau : SquareTrivialization L) : LineBundleClass.mk L ^ 2 = 1 := by
  rw [pow_two, ← LineBundleClass.mk_tensorProduct]
  have h : LineBundleClass.mk (InvertibleSheaf.tensorProduct L L) =
      LineBundleClass.mk (InvertibleSheaf.trivial X) :=
    LineBundleClass.mk_eq_mk_iff.mpr
      ⟨(TauCeti.AlgebraicGeometry.SheafOfModules.isInvertible X).ι.mapIso tau⟩
  exact h.trans LineBundleClass.mk_trivial

/-- Scalar multiplication is natural on the actual source and target sheaves. -/
theorem scalar_naturality (k : Type u) [Field k] (X : Scheme.{u})
    (f : X ⟶ Spec (CommRingCat.of k)) (L L' : InvertibleSheaf X)
    (theta : L.obj ⟶ L'.obj) (a : k) :
    Scheme.Modules.globalSectionsSmul L.obj (baseGlobal k X f a) ≫ theta =
      theta ≫ Scheme.Modules.globalSectionsSmul L'.obj (baseGlobal k X f a) :=
  Scheme.Modules.globalSectionsSmul_naturality theta (baseGlobal k X f a)

end TauCetiRoadmap.EnriquesSurfaces
