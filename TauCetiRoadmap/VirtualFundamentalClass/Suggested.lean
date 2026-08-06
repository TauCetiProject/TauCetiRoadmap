import Mathlib

/-!
# The Behrend–Fantechi virtual fundamental class: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. The statements here suggest Lean forms for particular milestones so that
contributors and reviewers converge on names, grading conventions, and hypotheses; discharging
all of them finishes neither a layer nor the roadmap.

At this roadmap repository's pinned Mathlib commit
`9caeba1000ef8f302920981f4a08651d325abc81`, the vocabulary needed to state the first intrinsic
target faithfully does not exist: there are no algebraic spaces or algebraic stacks, Chow groups,
geometric cotangent complexes, cone stacks, perfect complexes on stacks, or Gysin maps. Defining
placeholder `Prop`s for these conditions would make the summit vacuous, so compiled signatures
will be added only as the corresponding foundations land in Tau Ceti.

The eventual API should have the following mathematical shape; the exact spelling is deferred to
the layers which introduce the types.

```lean
-- def intrinsicNormalSheaf (X : DeligneMumfordStack k) : AbelianConeStack X
-- def intrinsicNormalCone (X : DeligneMumfordStack k) :
--   ClosedConeSubstack (intrinsicNormalSheaf X)
-- theorem intrinsicNormalCone_pureDimension :
--   PureDimension (intrinsicNormalCone X) 0

-- structure ObstructionTheory (X : DeligneMumfordStack k) where
--   E : DerivedCategory (EtaleModules X)
--   toCotangent : E ⟶ cotangentComplex X
--   h_zero_isIso : IsIso (homologyMap toCotangent 0)
--   h_negOne_epi : Epi (homologyMap toCotangent (-1))

-- def IsPerfect (φ : ObstructionTheory X) : Prop :=
--   HasPerfectAmplitude φ.E (-1) 0
-- structure GlobalTwoTermResolution (E : DerivedCategory (EtaleModules X)) where
--   negOne zero : VectorBundle X
--   differential : negOne.sheaf ⟶ zero.sheaf
--   iso : twoTermComplex differential ≅ E

-- noncomputable def virtualFundamentalClass
--     (φ : ObstructionTheory X) (hφ : IsPerfect φ)
--     (hres : Nonempty (GlobalTwoTermResolution φ.E))
--     (hrank : virtualRank φ.E = n) : RationalChowGroup X n

-- theorem virtualFundamentalClass_eq_zeroSectionGysin
--     (F : GlobalTwoTermResolution φ.E) :
--   virtualFundamentalClass φ hφ ⟨F⟩ hrank =
--     zeroSectionGysin F.dualNegOne (fundamentalCycle (resolvedCone φ F))
```

The global resolution is deliberately a separate argument from perfectness; the class is
dimension-graded; and properness is absent from the constructor. The narrative roadmap fixes the
full construction, relative version, functoriality, and acceptance examples.
-/

namespace TauCetiRoadmap.VirtualFundamentalClass

-- No compiled targets yet; see the module docstring and README.md.

end TauCetiRoadmap.VirtualFundamentalClass
