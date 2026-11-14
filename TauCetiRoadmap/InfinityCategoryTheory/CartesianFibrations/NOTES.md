# Notes on the CartesianFibrations draft (private)

Problems found with the plan while drafting, and how the README handles them.

1. **Lemma F (§7.3) needs Proposition 7 (§7.4).** GATEWAYS states Lemma F for categorical fibrations, and applies it
   to (co)Cartesian fibrations through Prop. 7, so (1) ⇒ (2) of HTT 3.3.1.5 in §7.3 would cite §7.4, a forward
   citation. In the README, §7.3 checks the hypothesis directly from §1.2 and §3.3 (HTT 2.4.6.5 for pᵒᵖ), which is
   Prop. 7's own one-line argument. So that argument appears twice. Swapping §7.3 and §7.4 would remove the
   repetition. But other Parts' drafts cite "CartesianFibrations §7.3" for HTT 3.3.1.5/3.3.1.6 and "§7.4" for 3.3.1.7,
   so the plan's numbering was kept.
2. **Lemma F's proof cites "Lemma 4, step t" (§7.5, later).** I unpacked this in §7.3: a J-homotopy equivalence is a
   categorical equivalence via §3.4. §7.3 also proves that a categorical equivalence between Kan complexes is a
   homotopy equivalence. §7.5 then cites §7.3 for both facts.
3. **Clause (3) of HTT 3.3.1.5.** The GATEWAYS scope paragraph says that clause (3) stays after marked
   straightening. But (2) ⇔ (3) is HTT 3.1.3.5, which is CartesianFibrations §5.5, before straightening. GATEWAYS'
   remark refers to its own stricter notion of "free", which excludes the Cartesian model structure. So §7.3 states
   (2) ⇔ (3) ⇒ (1) over any base, and (1) ⇒ (2) over ∞-category bases. Over an arbitrary base, the only form left
   for Straightening §2.3 is (1) ⇒ (2). The Straightening drafter should know this.
4. **HTT Rem. 3.1.3.9 and Rem. 3.1.4.6 (planned for §5.6).** The definition of the coCartesian structure, its
   Checks and Rem. 3.1.4.6 for S = Δ[0] are in §5.6. The Rem. 3.1.4.6 route was rewritten to avoid §5.7. The
   fibrant-object clause of 3.1.3.9 needs HTT 3.1.4.1, so it sits at the end of §5.7. The Kan-complex form of
   Rem. 3.1.4.6 is a bullet in §7.4, because it needs 3.3.1.8.
5. **Lean names.** `Suggested.lean` now exists (2026-11-12) and the README names only its declarations. The
   ∞-category-base forms in §7.2 and §7.3 are `isCategoricalEquivalence_pullback_fst_of_quasicategory` and
   `isCategoricalEquivalence_iff_fiber_of_quasicategory`, so they do not clash with Straightening §2.3's
   arbitrary-base names. The two piece names `innerAnodyne_pullback_isCategoricalEquivalence` and
   `isCategoricalEquivalence_pullback_of_innerFibration` were dropped: §7.1 is stated over every base
   (`isCategoricalEquivalence_pullback_map_of_innerAnodyne`), and HTT 2.4.4.5 is a special case of
   `isCategoricalEquivalence_pullback_fst_of_quasicategory`. The (co)Cartesian statements of §7.1, §7.2 and §7.4 take
   a hypothesis `CartesianFibration p ∨ CocartesianFibration p`. The mapping objects of §7.5 are the pullback
   `mapOver` of `Fun(A, N) ⟶ Fun(A, X)` along the vertex `ihomPt a`; the homotopy-equivalence clauses of §7.3 and §7.5
   are not stated (no homotopy-equivalence predicate on Kan complexes at the pins). `categoricalFibrations` is
   Part InfinityCategoryFoundations' definition verbatim (`(monomorphisms SSet ⊓ categoricalEquivalences).rlp`); the former
   local class `CategoricalFibration` was dropped, and statements take `categoricalFibrations p` (Tau Ceti's
   `SSet.CategoricalFibration` is a different notion). The locally Cartesian notions (§1.6, §2.3, §2.5, §2.6 first
   assertion) and Layer 4 (HTT, Lemma 2.4.7.5, Cors. 2.4.7.11–2.4.7.12) are now stated; HTT, Prop. 2.4.7.6 is not
   (it needs homotopy equivalences of Kan complexes).
6. **Labels.** Layer 7 carries no numbered gateway labels (GATEWAYS' Lemma 2, Theorem 1, Corollary 3, Proposition 7,
   Lemma 4 are §7.1, §7.2, §7.3 first statement, §7.4 first statement, §7.5); Lemma F keeps its letter.
7. **Kerodon.** GATEWAYS cites Kerodon Thm. 5.1.6.1 and Props. 5.1.1.9, 5.1.4.9 with HTT. These were not checked
   locally, so the README does not cite them.
8. **§7.6 (HTT, Cor. 3.2.2.12).** The reduced form of HTT, Prop. A.2.3.1 (along weak equivalences of pairs) is
   derived inside §7.6 from ModelCategories §3.1–3.2, rather than asked of ModelCategories (referee-firm A1).
9. **Size.** The README is 18.5k words, above the plan's 14.2k estimate. Most of the excess comes from the
   Layer 7 routes, which are written out in full.

## Needs Tau Ceti pin bump

Names used in `Suggested.lean` or presented in the README as Tau Ceti that exist on Tau Ceti main (bb8823c) but
not at the roadmap pin 2fd255d:
- in `Suggested.lean`: `SSet.Edge.opEquiv` (module `TauCeti.AlgebraicTopology.SimplicialSet.Op` exists at the pin,
  without it); `SSet.RightFibration` (module `...SimplicialSet.AnodyneExtensions.LeftRight.Basic`);
  `SSet.QCat.IsCategoricalEquivalence` (module `...Quasicategory.CategoricalEquivalence`);
  `TauCeti.MarkedSSet.ofEdges` (in `...SimplicialSet.Marked.Basic`); `TauCeti.MarkedSSet.markedAnodyneExtensions`
  (module `...SimplicialSet.Marked.Anodyne`).
- in the README only: `SSet.CategoricalFibration`, `SSet.LeftFibration`, `SSet.rightFibration_pullbackObjObjπ`,
  `SSet.Edge.isEquivalence_iff_hornFilling_zero`.
