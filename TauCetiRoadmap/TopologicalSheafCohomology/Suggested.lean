import Mathlib
import TauCeti.Topology.Sheaves.Cech.Colimit
import TauCeti.Topology.Sheaves.FiberStalk

/-!
# Topological sheaf cohomology: target signatures

The roadmap is README.md; this file is not the roadmap. It states the roadmap's
headline theorems against the pinned APIs.

The module-derived/underlying-abelian cohomology comparison, the compact Hausdorff
Čech/derived comparison and the canonical proper finite-fiber stalk isomorphism are
stated below. The Čech side is Tau Ceti's colimit over point-neighborhood covers,
`TauCeti.Topology.cechCohomology`, and the stalk map is Tau Ceti's
`TopCat.Presheaf.fiberStalkMap`. The bounded-below Čech hypercohomology comparison
and its two convergent spectral sequences are not statable at the pins: the
cover-refinement hypercohomology diagram and its pagewise colimits have no native
carrier. Fixed-cover native Čech complexes do not replace those constructions.
-/

noncomputable section

open CategoryTheory CategoryTheory.Limits TopologicalSpace

universe u

namespace TauCetiRoadmap.TopologicalSheafCohomology

/-! ## Layer 0: Module coefficients and derived sections -/

/-- For module sheaves on a topological space, forgetting the scalar action after
right-deriving global sections gives the native Ext-based abelian sheaf cohomology,
naturally in the sheaf. Injectives need not remain injective after forgetting. -/
theorem nonempty_moduleCohomologyForgetIso (R : Type u) [CommRing R] (X : TopCat.{u})
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

/-! ## Layer 1: Cover refinements and compact derived comparisons -/

/-- On a compact Hausdorff space, the Čech cohomology of module sheaves, the colimit over
point-neighborhood covers ordered by refinement of the cohomology of the fixed-cover Čech
complexes, is naturally isomorphic in every degree to the right derived functors of global
sections (Stacks, Lemma 20.16.2, tag 09V2, for abelian sheaves). -/
theorem nonempty_cechCohomologyIsoRightDerived (R : Type u) [CommRing R] (X : TopCat.{u})
    [CompactSpace X] [T2Space X]
    [HasSheafify (Opens.grothendieckTopology X) (ModuleCat.{u} R)]
    [(Sheaf.Γ (Opens.grothendieckTopology X) (ModuleCat.{u} R)).Additive]
    [HasInjectiveResolutions (X.Sheaf (ModuleCat.{u} R))] (n : ℕ) :
    Nonempty (TopCat.Sheaf.forget (ModuleCat.{u} R) X ⋙
        TauCeti.Topology.cechCohomology X (ModuleCat.{u} R) n ≅
      (Sheaf.Γ (Opens.grothendieckTopology X) (ModuleCat.{u} R)).rightDerived n) := by
  sorry

/-! ## Layer 2: Proper finite-fiber stalks -/

/-- For a proper map with finite fibers from a Hausdorff space, the canonical map from the
stalk of the direct image to the product of the stalks over the fiber, whose coordinates are
the native pushforward-stalk maps, is an isomorphism for every module sheaf; no separation or
local compactness of the target, and no local compactness of the source, is assumed. The
empty fiber is allowed; the product is then the zero module. Tau Ceti's
`TopCat.Presheaf.isIso_fiberStalkMap` proves this for every closed map from a Hausdorff space
whose fiber over `y` is finite. -/
theorem properFiniteFiberStalk (R : Type u) [CommRing R] {X Y : TopCat.{u}}
    [T2Space X] (f : X ⟶ Y) (hf : IsProperMap f)
    (hfin : ∀ y : Y, Finite { x : X // f x = y })
    (F : X.Sheaf (ModuleCat.{u} R)) (y : Y) :
    IsIso (TopCat.Presheaf.fiberStalkMap (ModuleCat.{u} R) f F.obj y) := by
  sorry

end TauCetiRoadmap.TopologicalSheafCohomology
