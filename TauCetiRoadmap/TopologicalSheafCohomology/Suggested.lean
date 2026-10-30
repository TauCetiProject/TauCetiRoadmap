import Mathlib

/-!
# Topological sheaf cohomology: target signatures

The roadmap is README.md; this file is not the roadmap. It states the roadmap's
headline theorems against the pinned APIs.

The module-derived/underlying-abelian cohomology comparison and the canonical
proper finite-fiber stalk isomorphism are stated below. The compact Hausdorff
Čech/derived comparison is not statable at the pins: the cover-refinement
cohomology diagram and its all-cover colimit have no native carrier. The
bounded-below Čech hypercohomology comparison and its two convergent spectral
sequences additionally lack the cover-refinement hypercohomology diagram and
its pagewise colimits. Fixed-cover native Čech complexes do not replace those
constructions.
-/

noncomputable section

open CategoryTheory CategoryTheory.Limits TopologicalSpace

universe u

namespace TauCetiRoadmap.TopologicalSheafCohomology

/-! ## Layer 0: Module coefficients and derived sections -/

/-- For module sheaves on a topological space, forgetting the scalar action after
right-deriving global sections gives the native Ext-based abelian sheaf cohomology,
naturally in the sheaf. Injectives need not remain injective after forgetting. -/
theorem moduleCohomologyForgetComparison (R : Type u) [CommRing R] (X : TopCat.{u})
    [HasSheafify (Opens.grothendieckTopology X) (ModuleCat.{u} R)]
    [HasSheafify (Opens.grothendieckTopology X) AddCommGrpCat.{u}]
    [(Sheaf.Γ (Opens.grothendieckTopology X) (ModuleCat.{u} R)).Additive]
    [HasInjectiveResolutions (X.Sheaf (ModuleCat.{u} R))]
    [HasExt.{u} (X.Sheaf AddCommGrpCat.{u})] (n : ℕ) :
    Nonempty (((Sheaf.Γ (Opens.grothendieckTopology X) (ModuleCat.{u} R)).rightDerived n ⋙
      forget₂ (ModuleCat.{u} R) AddCommGrpCat.{u}) ≅
      sheafCompose (Opens.grothendieckTopology X)
        (forget₂ (ModuleCat.{u} R) AddCommGrpCat.{u}) ⋙
      Sheaf.functorH (Opens.grothendieckTopology X) n) := by
  sorry

/-! ## Layer 2: Proper finite-fiber stalks -/

/-- The canonical map from the stalk of a direct image to the product of the
stalks over its fiber, with each coordinate the native pushforward-stalk map. -/
def fiberStalkMap (R : Type u) [CommRing R] {X Y : TopCat.{u}}
    (f : X ⟶ Y) (F : X.Sheaf (ModuleCat.{u} R)) (y : Y) :
    TopCat.Presheaf.stalk ((TopCat.Sheaf.pushforward (ModuleCat.{u} R) f).obj F).obj y ⟶
      ∏ᶜ (fun x : { x : X // f x = y } => TopCat.Presheaf.stalk F.obj x.val) :=
  Pi.lift fun x =>
    eqToHom (congrArg
      (TopCat.Presheaf.stalk ((TopCat.Sheaf.pushforward (ModuleCat.{u} R) f).obj F).obj)
      x.property.symm) ≫
    TopCat.Presheaf.stalkPushforward (ModuleCat.{u} R) f F.obj x.val

/-- For a proper map with finite fibers between locally compact Hausdorff spaces,
the canonical direct-image stalk map is an isomorphism for every module sheaf.
The empty fiber is allowed; the product is then the zero module. -/
theorem properFiniteFiberStalk (R : Type u) [CommRing R] {X Y : TopCat.{u}}
    [T2Space X] [T2Space Y] [LocallyCompactSpace X] [LocallyCompactSpace Y]
    (f : X ⟶ Y) (hf : IsProperMap f)
    (hfin : ∀ y : Y, Finite { x : X // f x = y })
    (F : X.Sheaf (ModuleCat.{u} R)) (y : Y) :
    IsIso (fiberStalkMap R f F y) := by
  sorry

end TauCetiRoadmap.TopologicalSheafCohomology
