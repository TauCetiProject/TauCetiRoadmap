# Notes on the PresheavesAndCompletions draft

1. **Source citation error, inherited by final_plan.json.** The source of §6.6 (HTT, Cor. 4.4.5.21) cited
   "LimitsAndCofinality §2.2, §2.3, §2.4" for HTT 4.4.5.14–4.4.5.20, which are this Part's idempotent sections.
   final_plan.json resolves them to LimitsAndKanExtensions §2.2–§2.4. The README cites §2.3–§2.4 of this Part (HTT 4.4.5.20 is in §6.6).
2. **Second source citation error.** In the source of §2.3 (HTT, Cor. 4.4.5.14), "by §1.3" meant the existence
   of Kan extensions (old KanExtensions §1.3), not Yoneda. final_plan.json resolves it to
   PresheavesAndCompletions §1.2. The README cites LimitsAndKanExtensions §7.4 (HTT, Lemma 4.3.2.13).
3. **A supplier outside the allowed set.** The source route for HTT Prop. 5.5.8.7 cited AlgebraicTopology §8.2
   for homotopy groups of a geometric realization. The README reroutes it through `Ex^∞`, citing
   ModelCategoryTheory KanQuillen §2.2, §1.1 and §1.3.
4. **Analogy proofs unpacked.** Three source routes argued by analogy, and the README writes each one out:
   - HTT Cor. 5.2.6.5, "the argument of Prop. 5.2.6.3" (a comparison map built from Lemma 5.1.5.3, checked on a
     colimit-stable class);
   - HTT Prop. 5.3.5.11, "the argument of Prop. 5.1.6.10". Its *Needs* no longer cites 5.1.6.10;
   - HTT Rem. A.2.9.16, "as in the proof of Cor. A.2.9.15".
5. **An API bullet replaced.** The §3.1 API bullet "completions exist and are unique (§3.2, §3.3)" pointed
   forward. It is replaced by a fact that follows from §2.2.
6. **Statement labels.** final_plan.json labels the Ind section with 5.3.5.7–8 only. The source text, which the
   README follows, also states 5.3.5.10–11, in §6.5. AccessibleInfinityCategories §4.3, whose labels include 5.3.5.11, only
   cites it, so no statement is duplicated. Firm review round 1 confirmed this: keep.
7. **Size.** About 24.1k words, over the 8–18k aim. The cause is the framing, the unpacked routes and the API
   bullets of the definitions. A Conventions sentence naming the vocabulary sections once would let most
   *Needs* lines drop their definition locators; left to the plan owner.
8. **Kerodon Prop. 3.1.7.9 in §5.3.** Stated here as a small target because no earlier supplier states it;
   ModelCategoryTheory KanQuillen §3.6 uses it inside a route (CROSS, firm round 2).
9. **Suggested.lean (2026-11-12).** 38 theorems and 28 definitions (including the small helpers `IdemMonoid`, `idemPlusX`, `idemPlusY`, `idemPlusI`, `idemPlusR`, `toIdemMonoid`, `catInftyObj`), elaborated against Mathlib 1b1ccf4 and Tau
   Ceti bb8823c (only `declaration uses 'sorry'` warnings). Choices worth a look:
   - `Idem⁺` is the nerve of the Karoubi envelope of the one-object category of `{1, e}` (`WithZero PUnit`, `e = 0`),
     which is exactly HTT's `R`; `Idem` is the nerve of `ULift` of that one-object category (a local `uliftCategory`
     instance), so that `nerveMap` from it and to it typechecks in one universe. `Ret` is `Subcomplex.ofSimplex` of
     the 2-simplex `Y ⟶ X ⟶ Y`.
   - The old name `isColimitCocone_comp_of_isCardinalRightExact` is now `isColimitDiagram_comp_of_isCardinalRightExact`,
     with Part InfinityCategoryFoundations' `IsColimitDiagram` replacing the old `IsColimitCocone` (README §4.5 updated).
   - Large statements are made in two universes through `SSet.uliftFunctor`: existence of idempotent completions
     (inside `P(C)`, one universe up), the cocomplete envelope of HTT Lemma 5.3.5.7 (for `D` small, colimits
     indexed in the universe of `D`), and filtered colimits in `Cat∞` (HTT Cor. 4.4.5.21, through `catInftyObj`).
   - HTT Lemma 5.3.4.12 is stated only for its κ-continuity half (κ-compactness is not statable).
   - Restated with the same names and bodies as the old Definitions file: `IsColimitDiagram`, `IsLimitDiagram`
     (Part InfinityCategoryFoundations §1.2), `sectionsRestrict`, `IsCofinal` (Part LimitsAndKanExtensions §2.1),
     `IsRelativeColimit`, `subcomplexOver`, `subcomplexOverCocone`, `IsLeftKanExtensionAt`, `IsLeftKanExtension`
     (Part LimitsAndKanExtensions §7.1), `IsRetract` (Part AdjunctionsAndLocalizations §2.1). If those Parts' new
     files change a body, this file must follow.
   - Not statable: everything through the Yoneda embedding (`C[−]` and `Ex^∞` missing), `Fun^L`/`Fun^R` duality,
     HTT Prop. 4.4.5.20 (no `Π₁ Map`), HTT 5.3.1.19, 5.4.5.10, 5.4.6.2, A.2.9.14/18 (categorical equivalences of
     non-quasicategories), HTT 5.5.8.11–12 and 5.3.3.3 (no colimit, product or `Z × −` functors), §6.2 homotopy
     pullbacks.

## Needs Tau Ceti pin bump

Names used in Suggested.lean that exist on Tau Ceti main (bb8823c) but not at the roadmap pin 2fd255d:
`SSet.coslice.IsColimit`, `SSet.slice.IsLimit`, `SSet.coslice.map`, `SSet.IsFullyFaithful`,
`SSet.QCat.IsCategoricalEquivalence` (and the `homCategory` instance on `SSet.QCat`), `SSet.CategoricalFibration`,
`SSet.catInfty` (with `SSet.CatInftyΔ`, `SSet.CoreEnriched.toSSet`), `SSet.ihomObj₀Equiv`, `SSet.ihomOver` (with
`SSet.ihomOver.homEquiv`), `SSet.IsWeakHomotopyEquivalence`, `SSet.RightFibration`, `SSet.IsTerminalVertex`;
modules `Quasicategory/{CategoricalEquivalence, CategoricalFibration, CatInfty, FullyFaithful, Limit}`,
`SimplicialSet/{InternalHom, WeakHomotopyEquivalence}`, `SimplicialSet/AnodyneExtensions/LeftRight/Basic`.

Every Mathlib and Tau Ceti name the README cites was checked with `#check` against Mathlib 1b1ccf4 and Tau Ceti
bb8823c; all exist. `SSet.rightAnodyneExtensions_pushoutObjObjι'` (§5.2) is, like the names above, on main only.
