# Notes on the DerivedInfinityCategories draft (Linear-Firm, position 13)

1. **Checks that move with the definitions.** The old §5.1 (t-exact functors, HA Def. 1.3.3.1) and the old first
   statement of §6.8 (compatibility with filtered colimits, HA Def. 1.3.5.20) move to StableInfinityCategories
   §3.5 and §11.5. Their Checks use D⁻(Ab), `− ⊗^L ℤ/2` and D(Ab). In StableInfinityCategories these would point
   forward to this Part, so that Part's writer has to replace them, for example with Sp and its t-structure.
2. **Sections supplied for citations that had none.** The source cited some Parts in *Needs* without a section.
   The sections now given come from matching section titles: Definitions §1.1 (HTT §1.2.7, §1.2.11), §1.3 and §2.4;
   InfinityCategoryFoundations §2.4 (HTT §1.2.10); KanQuillen §3.1 and §3.2; ModelCategories §4.1; SimplicialCategories §3.1
   and §3.2. final_plan.json resolves HTT A.2.8.7 to SimplicialCategories §3.1, while the homotopy limits that HTT
   defines after A.2.8.7 are SimplicialCategories §3.2, so both are cited.
3. **§5.3 title and placement (plan-level).** The totalization dual of HA, Lemma 1.3.3.10 now sits in
   PresentableInfinityCategories §7.6, beside the lemma itself (user-approved structural move, 2026-11-12), and §5.3 is titled
   "Right exact functors on connective parts"; the plan's title and label lists should follow. FINAL-PLAN also lists HA.1.3.3.11 under §5.5 and HA.1.3.1.9 under §5.4,
   while the README states Lemma 1.3.3.11 in §5.3 and Remark 1.3.1.9 in §1.1; the README's placement avoids a
   forward citation from §5.4, so the plan's label lists should change.
4. **Layer 6 Example citing Prestable.** D(A)≥0 is presented as a Grothendieck prestable ∞-category through
   Part PrestableInfinityCategories §4.1, a downward edge (12 → 13). The supplier contracts list it as used in the Layer 6 Examples
   only, and no *Needs* item cites Prestable.
5. **Suggested.lean.** The §5.4 paragraph (the flagship) names declarations of the existing Suggested.lean.
   Layer 5 is renumbered (old §5.2–§5.7 are §5.1–§5.6), so Suggested.lean's section comments need the same
   renumbering when it is redone.
6. **Polish pass (2026-11-12).** Fourteen titles revised; the Scope no longer names the roadmap that ceded the
   coherent-nerve, shift–cone and `D(A)` material (it says only that this Part owns it); "this roadmap" is now
   "this Part" throughout.
7. **§3.1 stub.** §3.1 has no target: it points to AdjunctionsAndLocalizations §2.4 for `C[W⁻¹]`. readme-shape asks
   for it to be folded into the opening of Layer 3, with §3.2–§3.6 renumbered to §3.1–§3.5. It stays while the
   section numbering is frozen. No other Part cites DerivedInfinityCategories, so the renumbering touches this README (and
   Suggested.lean's section comments) only.
8. **Suggested.lean redone (2026-11-12).** Section comments follow the current numbering (Layers 2, 4, 5, 6, with
   the README section in each docstring). New declarations: Kan fibrations of simplicial abelian groups (§2.2),
   stability of `N_dg(Ch(A))`, `D⁻(A)` and `D(A)` with mapping cones as cofibers (§2.4, §4.4, §6.5; the old file
   called these not statable, but `IsStable` of Part StableInfinityCategories is statable and is restated here),
   projective resolutions (§4.5), HA Lemma 1.3.3.9 and Prop. 1.3.3.13 (§5.1), the Grothendieck comparison (§6.1),
   and `D(A)` as a localization of `N(Ch(A))` (§6.6). After the sim-firm review: HA Lemma 1.3.5.11 and
   Prop. 1.3.5.14 (§6.4) are dropped from the Lean, being short corollaries of Mathlib's
   `CochainComplex.IsKInjective.eq_δ_of_cocycle` and Tau Ceti's `CochainComplex.IsKInjective.exists_homotopyEquiv`;
   HA Prop. 1.3.5.13 is stated as `isReflectiveSubcategory_isInjectivelyFibrant`, with Part
   AdjunctionsAndLocalizations' `IsReflectiveSubcategory` restated (no dg functor needed). `PreservesFiniteCoproducts`
   is renamed `PreservesFiniteCoproductDiagrams`, to avoid Mathlib's `Limits.PreservesFiniteCoproducts`.
9. **Needs Tau Ceti pin bump.** Names used by Suggested.lean (or cited by the README as Tau Ceti's) that exist on
   Tau Ceti main (bb8823c) but not at 2fd255d: modules `TauCeti.AlgebraicTopology.Quasicategory.CategoricalEquivalence`,
   `.Quasicategory.FullyFaithful`, `.Quasicategory.InitialVertex`, `.Quasicategory.Limit`, `.SimplicialSet.InternalHom`; declarations
   `SSet.ihomObj₀Equiv`, `SSet.QCat.IsCategoricalEquivalence`, `SSet.coslice.IsColimit` (with `SSet.slice.IsLimit`), `SSet.IsInitialVertex`, `SSet.IsTerminalVertex`,
   `SSet.IsFullyFaithful`, `TauCeti.dgNerve.rightMappingSpacePiAddEquivHomology`,
   `TauCeti.dgNerve.isInitialVertex_cochainComplex_of_isZero`, `TauCeti.dgNerve.isTerminalVertex_cochainComplex_of_isZero`,
   `TauCeti.DGFullSubcategory.dgNerveIso`, `CategoryTheory.EnrichedFunctor.mapDGNerve`,
   `CategoryTheory.SimplicialObject.piAddEquivNormalizedMooreComplexHomology`,
   `CategoryTheory.SimplicialObject.piZeroEquivNormalizedMooreComplexHomology`,
   `CochainComplex.monoQuasiIsoOfCardinalLT`, `CochainComplex.exists_rlp_monoQuasiIsoOfCardinalLT_eq`,
   `CochainComplex.rlp_monomorphisms_inf_quasiIso_iff_of_isZero`, `SSet.CartesianFibration`.
