# Notes on the StableInfinityCategories draft

- §4.2 and §12.1 depend on HA Lemma 1.2.4.17, which is now in LimitsAndKanExtensions §9.5. The plan data's
  `cites` lists for these two sections leave out LimitsAndKanExtensions §9.5, because their old internal
  citation "§4.2 (the cofinality lemma)" was resolved to the new §4.2. The README cites §9.5 explicitly.
- ALT2-STRUCTURE.md puts "t-structures compatible with filtered colimits" (HA Def. 1.3.5.20) in Layer 10, but
  FINAL-PLAN.md places it at §11.5. The README follows FINAL-PLAN (§11.5), and so do Prestable's citations.
- The Checks of §3.5 (HA Def. 1.3.3.1) and §11.5 (HA Def. 1.3.5.20) were written with D⁻(Ab) and D(Ab), which
  belong to the later Part DerivedInfinityCategories. They are rewritten here with Sp and its t-structure.
- Suggested.lean (2026-11-12) keeps the old Stable names (isStable_ihom, admissibleMorphism_ιHeart_eq_top,
  shortExact_iff_exists_distinguished, isHomological_of_iso_truncLE_truncGE,
  exists_isCategoricalEquivalence_doldKan, full_faithful_Γ₀, the square helpers) and adds isStable_op (§1.2),
  isStable_iff_of_isPointed (§2.2), IsRightExact, IsExact, isExact_tfae (§2.3), HomologicalTStructure,
  exists_equiv_tStructure (§3.1), isStable_pi, isExact_lift_iff (§6.2). The old Spectra file stated nothing,
  and of the Spectra headlines (Layers 7–11) only HA Cor. 1.4.2.27 (1) ⇔ (3) is statable at the pins:
  isStable_iff_exists_loop_isCategoricalEquivalence (§7.5, sim-firm R01), through `SSet.fullEnhancedSubcategory`
  (Quasicategory/FullSubcategory.lean, main and pin) and Tau Ceti's `SSet.evalAt`
  (SimplicialSet/WeaklyContractible.lean, main and pin), with evaluation at a vertex as in LimitsAndKanExtensions §8.2.
- Bodies follow the old Definitions file, the family-level choice: IsPushoutSquare and IsPullbackSquare go
  through IsColimitDiagram and IsLimitDiagram (owned by Part InfinityCategoryFoundations §1.2, as is IsLeftExact), and
  IsPointed, hence IsStable, includes `C.Quasicategory` (the old Stable file left it out). The Dold–Kan
  statement uses Part LimitsAndKanExtensions' simplicialObjects (§9.1) and `uliftFunctor` of `nerve ℕ`, not
  `AsSmall` (DESIGN-DECISIONS, Stable §5). If those Parts' Suggested.lean files change these bodies, the
  restatements here must follow.

## Needs Tau Ceti pin bump

Names used by Suggested.lean (and backticked in the README) that exist on Tau Ceti main (bb8823c) but not at
the roadmap pin 2fd255d: `SSet.IsInitialVertex`, `SSet.IsTerminalVertex` (Quasicategory/InitialVertex.lean,
TerminalVertex.lean), `SSet.coslice.IsColimit`, `SSet.slice.IsLimit` (Quasicategory/Limit.lean),
`SSet.QCat.IsCategoricalEquivalence` (Quasicategory/CategoricalEquivalence.lean). The README also cites
`SSet.catInfty` (Quasicategory/CatInfty.lean), main only; Suggested.lean does not use it.

## Referee round (referee-firm, 2026-11-12)

- §1.7 now states the shift lemma (an adjoint autoequivalence of a category generates `HasShift _ ℤ` through
  `ShiftMkCore`) as its own target, manual, since HA uses it without proof and Mathlib at the pin lacks it.
  §2.3's mixed-sign `commShiftIso_add` cites it.
- §2.3 justifies "Fun(C, −) preserves trivial fibrations" by Mathlib `SSet.rlp_monomorphisms` and the
  exponential law, not by Part CartesianFibrations as the referee suggested: no section there states it.
- The Adámek–Rosický findings of the referee report concern Part PresentableInfinityCategories and were not applied here.
