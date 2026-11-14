# Notes: Part AdjunctionsAndLocalizations (private)

## Suggested.lean (2026-11-12)

Stated (sorry'd theorems): `isColimit_map_of_adjunction`, `isLimit_map_of_adjunction` (§1.5, HTT 5.2.3.5),
`exists_rightAdjoint_iff` (§1.6, HTT 5.2.4.2), `nonempty_adjunction_of_isInitialVertex` (§1.6, HTT 5.2.4.3),
`exists_leftAdjoint_fullSubcategoryι_iff` (§2.3, HTT 5.2.7.8), `isLocalizationFunctor_tfae` (§2.3, HTT 5.2.7.4),
`exists_isLocalizationAt` (§2.4, HA 1.3.4.2), `isLocalizationAt_corestrict` (§2.4, HTT 5.2.7.12),
`exists_leftAdjoint_restrict` (§1.8, HTT 4.3.3.7; added 2026-11-12 for sim-firm R01, existence of the left adjoint only).

Definitions (real bodies): `sectionFiberVertex`, `IsReflectiveLocalization`, `IsColocalization`,
`IsLocalizationFunctor`, `IsRetract`, `fullSubcategory`, `fullSubcategoryι`, `IsSubcategoryLocalization`,
`IsReflectiveSubcategory`, `essImage`, `corestrict`, `IsLocalizationAt`, and for §1.8 `cylinderAt`,
`mappingCylinder` (+ `.π`, `.ι₀`, `.ι₁`), `IsLeftKanExtensionAlong` (HTT Def. 4.3.3.2, first Lean form in the
family; LimitsAndKanExtensions owns the README definition), `funQCat`, `restrict`. Verbatim copies:
`IsCategoricalEquivalence` (InfinityCategoryFoundations §2.1), `subcomplexOver`, `subcomplexOverCocone`,
`IsLeftKanExtensionAt`, `IsLeftKanExtension` (LimitsAndKanExtensions §7.1).

Starting material: `out/InfinityCategoryTheory/AdjunctionsAndLocalizations/Suggested.lean`. Changes from it:
the two halves of HTT 5.2.7.12 (`isFullyFaithful_pre_corestrict`, `exists_comp_corestrict_iff`) are merged into
`isLocalizationAt_corestrict`, since `IsLocalizationAt` is their conjunction; HTT 5.2.7.4 is now the full TFAE
with condition (2); `IsRetract` (same body as the old PresheavesAndIndCompletion file) moved here with §2.1;
`IsReflectiveLocalization`, `IsColocalization`, `IsReflectiveSubcategory` and HTT 5.2.4.3 are new.

Headline not statable at the pins:
- Nikolaus–Scholze Ex. A.10 (§2.7): no edge of a functor ∞-category of nerves from a natural transformation of
  functors, and no Quillen functors in Mathlib.

Not stated (not headlines, left for later): associated functors and HTT's correspondence adjunctions (§1.1–§1.3),
§1.4, §1.7, HTT 4.3.2.17, orthogonality and factorization systems (§2.5; needs double slices or homotopy
pullbacks of mapping spaces), §2.6, absolute Kan extensions (§2.7).

## Needs Tau Ceti pin bump

Names used in Suggested.lean (and in the README's supplier list) that exist on Tau Ceti main (bb8823c) but not
at the roadmap pin 2fd255d:

- modules `TauCeti.AlgebraicTopology.Quasicategory.FullyFaithful`, `.InitialVertex`, `.Limit`, `.TerminalVertex`;
- `SSet.IsFullyFaithful`, `SSet.IsInitialVertex`, `SSet.IsTerminalVertex`, `SSet.coslice.IsColimit`,
  `SSet.slice.IsLimit`, `SSet.coslice.map`.

README-only names that are also main-only: `SSet.LeftFibration`, `SSet.RightFibration`.

## README names changed

- §1.5 `preservesColimits_of_isLeftAdjoint` → `isColimit_map_of_adjunction`, `isLimit_map_of_adjunction`;
- §1.6 `isLeftAdjoint_iff_representable` → `exists_rightAdjoint_iff`;
- §1.8 `isRightAdjoint_restrict` → `exists_leftAdjoint_restrict` (now in Suggested.lean);
- §2.3 `isLeftAdjoint_inclusion_iff_exists_localization` → `exists_leftAdjoint_fullSubcategoryι_iff`;
- §2.3 `tfae_isLocalizationFunctor` → `isLocalizationFunctor_tfae`;
- §2.4 `exists_isLocalization` → `exists_isLocalizationAt`;
- §2.4 `isLocalization_of_isLocalizationFunctor` → `isLocalizationAt_corestrict`;
- added mentions of the §1.6, §2.1, §2.2 and §2.4 declarations.

## Sim-firm review (2026-11-12)

R04 only partly applied: Layer 1 keeps its section numbers, since 53 citations in other Parts point at
§1.5–§1.8. §1.5's lemma list is now one proof-route paragraph.

## Sim-firm-2 review (2026-11-12)

The §1.8 Lean forms (`cylinderAt`, `mappingCylinder` and its maps, `IsLeftKanExtensionAlong`) have docstrings saying
that LimitsAndKanExtensions §7.1 owns them. If that Part gains Lean forms, make these verbatim copies of them.
