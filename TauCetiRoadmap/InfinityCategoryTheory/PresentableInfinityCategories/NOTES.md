# Notes on the PresentableInfinityCategories draft (Linear-Firm, position 9)

Things I found while drafting. None of them stopped the README being written.

1. **Inputs missing from `final_plan.json`.** In the source text, three inputs were cited only as "the previous statement", so the plan's resolved `cites` lists leave them out. The README cites them; all three come from earlier Parts.
   - §6.2 (HTT 5.5.6.18, Ex. 7.3.4.4 in §6.5) needs InfinityCategoryFoundations §10.8 (HTT Lemma 5.5.6.17).
   - §7.2 (HTT 5.5.8.14) needs PresheavesAndCompletions §5.4 (HTT Lemma 5.5.8.13, the presheaf resolution).
   - §1.3 (HTT 5.5.4.3) needs ModelCategoryTheory, ModelCategories §7.2 for the projective structure. The old README named this input only in its Dependencies.
2. **§6.6 follows directly from §6.5.** The presheaf case of HTT Ex. 7.3.4.7 is Exs. 7.3.4.4 and 7.3.4.5 applied with K = C^op. It brings in nothing new. I kept it as its own section, as the plan says, and its route says how it follows from §6.5. It could become one sentence at the end of §6.5.
3. **HA Lemma 1.3.3.10 (§7.6) could sit one layer earlier.** It uses none of the P_Σ material: its inputs within this Part are §1.6 and §6.2. Placing it at the end of Layer 6 would work just as well. I left it where the plan puts it.
4. **Source route rewritten in two places in Layer 6.**
   - HTT Rem. 5.5.6.12 now gets the mapping spaces of `C_{/D}` from InfinityCategoryFoundations §4.2 and §5.3 plus HTT 4.2.1.5, not from the old PresentableInfinityCategories §4.3, as the plan says.
   - In §6.1, Rems. 5.5.6.6 and 5.5.6.7 are Steps 1–2 of the route of Rem. 5.5.6.12 (sim-firm R11).
   - The monomorphism criterion (the C_{/f} half of HTT Ex. 5.5.6.13) is now proved here, using a short right-fibration argument.
5. **Other source routes I changed.**
   - In HTT 6.2.1.1 (§4.5), the argument that L preserves the final object is now spelled out: the final object is local.
   - In §6.8, the fully-faithfulness step now says that G is conservative.
   - In §5.8, a sentence now explains that the subcategory Pr^R_κ (not a full subcategory) inherits the limit's universal property.

## Suggested.lean (2026-11-12)

6. **What is stated.** Only statements that need no presentability: §4.5 (HTT Prop. 6.2.1.1), §7.6 (HA Lemma 1.3.3.10, fourth assertion, for C an n-category rather than equivalent to one), §9.1 (HTT Prop. 5.5.9.1, without the simplicial clause), §9.3 (HTT Prop. 5.5.9.2, via `LocalizerMorphism.localizedFunctor`). HTT Lemmas 5.5.9.12–5.5.9.13 and `M(K)` were dropped from the Lean file (route steps, not headlines). Everything else needs κ-compactness, hence the Yoneda embedding (Ex^∞ and `C[−]`), which is not at the pins. The README no longer names unwritten ("planned") declarations.
7. **Repeated definitions.** `IsColimitDiagram`, `IsLimitDiagram`, `IsLeftExact`, `cospanCoord₁/₂`, `coneShape`, `IsPullbackSquare`, `HomotopicRelBoundary`, `IsNCategory` (Part InfinityCategoryFoundations), `IsReflectiveLocalization` (Part AdjunctionsAndLocalizations) and `weakHomotopyEquivalences` (ModelCategoryTheory, KanQuillen) are restated with the bodies of the old Definitions file and the KanQuillen file. When Part InfinityCategoryFoundations' new Suggested.lean lands, re-check that its bodies still agree.
8. **Naming.** The classes on `C ⥤ SSet` are `functorObjectwiseWeakEquivalences` and `functorObjectwiseFibrations`: Part SimplicialCategories' `objectwiseWeakEquivalences` and `objectwiseFibrations` live on simplicial functors `SSetDiagram C`, a different carrier, so one name would otherwise mean two things across the family.

### Needs Tau Ceti pin bump

Exist on Tau Ceti main (bb8823c) but not at 2fd255d:
- `SSet.coslice.IsColimit` (`TauCeti/AlgebraicTopology/Quasicategory/Limit.lean`), used by `IsColimitDiagram`;
- `SSet.IsWeakHomotopyEquivalence` (`TauCeti/AlgebraicTopology/SimplicialSet/WeakHomotopyEquivalence.lean`), used by `weakHomotopyEquivalences`.

## Layer 9 layout (sim-firm R11)

9. §9.2 now holds only definitions (`Env(C)`, `M(K)`, the index); HTT Lemmas 5.5.9.6–5.5.9.9 and 5.5.9.12–5.5.9.13 are Steps 1–9 of Prop. 5.5.9.2, now §9.3; Lemma 5.5.9.15 is Step 1 of Prop. 5.5.9.14 in §9.4. External citations of PresentableInfinityCategories §9.x (DerivedInfinityCategories: §9.1, §9.4) are unaffected.
