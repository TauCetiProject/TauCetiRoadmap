# Notes on the PrestableInfinityCategories draft (Linear-Firm, position 12)

1. **Module examples.** The Checks and Examples run on Sp≥0, Sp and Mod_R^cn = P_Σ(N(Free_R)). The latter use only
   properties that §2.4 (prestability, objectwise limits and homotopy objects, heart Mod_R, long exact sequences),
   §3.3 (completeness) and §6.1 (Grothendieck) prove for P_Σ of the nerve of a small additive category, by Quillen's
   strict model (PresentableInfinityCategories §9.1, §9.4) and Tau Ceti's simplicial abelian groups, with no ∞-operads.
   Rationalization is phrased inside Mod_ℤ^cn (the subcategory D of objects with rational homotopy groups);
   D ≃ Mod_ℚ^cn is only a remark.
2. **SAG, Prop. C.2.4.2 is not stated (plan issue).** FINAL-PLAN gives §6.2 the label SAG.C.2.4.2. Its proof needs
   P_Σ(C≥0) ≃ Fun^π(C≥0^op, Sp≥0) for the small additive ∞-category C≥0 (SAG, Prop. C.1.5.7 and Rem. C.1.5.9 in
   general), whose only known route goes through HA, Rem. 5.2.6.26 and ∞-operads, which Scope excludes. The strict
   model of §2.4 covers nerves of ordinary additive categories only. No target of this Part consumes C.2.4.2: the
   route of Prop. C.5.5.5 uses only Ind(E) ≃ Sp(Ind(E≥0)), which §6.2 states as a bullet of Lemma C.2.4.3. The
   label should leave the plan, or move to a roadmap that has ∞-operads.
3. **Citations beyond final_plan.json.** §5.1 cites InfinityCategoryFoundations §1.1 (size conventions). §2.4 and §3.3 cite
   PresentableInfinityCategories §6.3, §6.4, §7.5, §9.1, §9.4, LimitsAndKanExtensions §3.2, §3.3, ModelCategoryTheory Part
   ModelCategories §3.5, Part SimplicialCategories §3.2, §4.2, §6.4 and Part KanQuillen §1.2, §5.1, §5.3. §4.6 cites
   Straightening §3.2 and PresentableInfinityCategories §5.1, §5.2 for colimits in the limit of the loop tower.
4. **Forward pointers in Checks.** The §1.1 Check points to §1.2, the §2.1 Check to the criterion of §2.3, and the
   Conventions to §3.3 and §6.1. None is an input or a *Needs* item. The §7.2 and §8.3 Checks that rested on
   Prop. C.5.5.5 and on §8.4 sit in the Checks of those statements.
5. **Polish pass (2026-11-12).** §2.1 retitled "Prestable ∞-categories" and its Checks rewritten in the Part's
   notation; the Summary and Scope now name the definitions this Part owns (prestable, §2.1; additive, §2.4) and the
   P_Σ strict model.
6. **Tau Ceti pin.** The simplicial abelian group items of §2.4 (`SSet.kanComplex_of_addGroup` in
   `SimplicialGroup/Basic.lean`, `CategoryTheory.NatTrans.fibration_whiskerRight_forget_addCommGrpCat_of_epi` in
   `SimplicialGroup/Fibration.lean`) exist at Tau Ceti `bb8823c5e3`, not at the roadmap pin `2fd255d997`. The pin
   needs a bump before `Suggested.lean` imports them.
7. **Source issues.** SAG, Prop. C.3.2.1, proof of (2) ⇒ (3) (p. 1980) writes Σ^{−n}π_n where Σ^{−n}π_{−n} is meant;
   §7.1 uses the corrected form. SAG, Ex. C.6.4.3 (p. 2067) is stated for presentable C but needs τ≤n C closed under
   filtered colimits; §8.1 states it for Grothendieck prestable C.
8. **Suggested.lean (2026-11-12).** Layer 1 only, as before: six theorems and two definitions. New since the old Part
   Prestable file: `isNoetherianObject_of_exact` (Cor. C.6.8.3), `IsLocalizingSerreClass` and
   `isLocalizingSerreClass_kernel` (Def. C.5.1.2 and its kernel bullet), `tfae_sSup_noetherianSubobjects_eq_top`
   (Prop. C.6.8.4) and `exists_ind_isNoetherianObject_equivalence` (Cor. C.6.8.8: an equivalence F from Mathlib's `Ind`
   with `Ind.yoneda ⋙ F ≅ ι`). The §1.3 (b), (c) routes are 1-categorical (restricted Yoneda into Mathlib's
   presheaf model of `Ind`), so Layer 1 needs no earlier Part; the comparison N(`Ind` A) ≃ Ind(N(A)) of Part
   PresheavesAndCompletions §6.4 is not used. The bridge to the ∞-categorical heart (colimits and compact objects in a
   nerve are the 1-categorical ones) is stated in the earlier Parts: colimits in nerves over any simplicial set in
   LimitsAndKanExtensions §1.4 (second statement), κ-filtered colimits and κ-compact objects of nerves in
   PresheavesAndCompletions §6.4 (the statement after HTT, Rem. 5.3.5.6). §3.2 transports the first to the heart
   (C♥ ≃ N(h C♥)), and §4.1 applies both to `ShrinkHoms (h C♥)` with morphisms in `Type u`. AccessibleInfinityCategories's
   Conventions witness and Layer 5 Example and PresentableInfinityCategories's N(Set) witness can now cite PresheavesAndCompletions
   §6.4 instead of arguing inline (not edited here). The abelian localizing notion is
   named `IsLocalizingSerreClass` so that it does not collide with the planned prestable `IsLocalizing` of §4.3.
   Layers 2–9 stay unstatable: no suspension functor of a pointed quasicategory in either library.
9. **README names changed.** The §8.4 planned name was `tfae_isLocallyNoetherian`, which fits §9.2, not the
   recognition theorem; §8.4 is now planned `tfae_isAnticomplete_isCoherent` and §9.2 planned
   `tfae_isLocallyNoetherianPrestable` (the suffix avoids a clash with the abelian `IsLocallyNoetherian`). The four
   other "proposed" names are now "planned declaration".
10. **Needs Tau Ceti pin bump.** Suggested.lean imports no Tau Ceti module, so nothing. (The README's §2.4 items in
    note 6 still need the bump before any future Lean statement uses them.)
11. **Referee Prestable-r3 (2026-11-12).** §9.1's step "discrete and compact in τ≤0 C ⇒ almost compact" rests on
    the new compact-objects bullet of §8.3 (SAG, proof of Prop. C.6.5.4, pp. 2070–2071), which needs weak coherence;
    SAG's proof of Prop. C.6.9.3 omits this step (a gap, not an error; candidate for SOURCE-ISSUES).
