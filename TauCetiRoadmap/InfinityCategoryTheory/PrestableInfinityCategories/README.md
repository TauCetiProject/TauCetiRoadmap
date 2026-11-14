# Roadmap: prestable ∞-categories

**Summary.** This Part develops the theory of prestable ∞-categories: the ∞-categories that look like the connective
half of a stable ∞-category with a t-structure.

It builds on Mathlib's abelian categories, the stable ∞-categories, t-structures, t-exact functors, spectrum
objects and accessible t-structures of Part StableInfinityCategories, and the presentable ∞-categories, truncations
and `P_Σ` of Part PresentableInfinityCategories.

- **Noetherian abelian categories (Layer 1).** Noetherian objects and locally Noetherian abelian categories.
- **Prestability (Layer 2).** Prestable ∞-categories (SAG, Def. C.1.2.1), the Spanier–Whitehead stable envelope,
  and additivity. Through a strict model by simplicial abelian groups, `P_Σ` of the nerve of a small additive
  category is prestable and complete; these `P_Σ`, such as the connective modules `Mod_R^cn` over a ring, supply the
  running examples.
- **Connective parts of t-structures (Layer 3).** Prestable ∞-categories with finite limits are the connective
  parts of t-structures; hearts and completeness.
- **Grothendieck prestable ∞-categories (Layers 4–5).** Grothendieck prestable ∞-categories and their left exact
  localizations; the ∞-category `Groth∞`, its filtered colimits, separation and completion.
- **Compactness and completion (Layers 6–8).** Compact generation and Ind-completions; amplitude,
  anticompleteness and the completion equivalence; almost compact objects, coherence and the recognition theorem.
- **Locally Noetherian prestable ∞-categories (Layer 9).**

**Headline theorems.**
- The Noetherian objects of an abelian category form a Serre class (SAG, Prop. C.6.8.2), and in a locally
  Noetherian Grothendieck abelian category the compact objects are exactly the Noetherian ones and generate (SAG,
  Cor. C.6.8.9).
- An ∞-category is prestable exactly when it embeds fully faithfully into a stable ∞-category with essential image closed under finite colimits and extensions (SAG, Cor. C.1.2.3).
- Prestable ∞-categories with finite limits are the connective parts of t-structures (SAG, Prop. C.1.2.9).
- The characterization of Grothendieck prestable ∞-categories (SAG, Prop. C.1.4.1 and Def. C.1.4.2).
- Accessible left exact localizations of a Grothendieck prestable ∞-category are classified by localizing
  subcategories (SAG, Prop. C.2.3.8).
- `Groth∞` has filtered colimits, computed in `Pr^L` (SAG, Prop. C.3.3.5).
- Existence of the separated quotient (SAG, Prop. C.3.6.1) and of the completion (SAG, Prop. C.3.6.3).
- Completion is an equivalence from anticomplete to complete Grothendieck prestable ∞-categories (SAG,
  Prop. C.5.9.2).
- The Ind-completions of connective parts of bounded t-structures are exactly the anticomplete, (weakly) coherent
  Grothendieck prestable ∞-categories (SAG, Thm. C.6.7.1).
- Locally Noetherian prestable ∞-categories are characterized through their hearts (SAG, Prop. C.6.9.8).

Only the abelian headlines are statable against the pinned libraries.

## Scope and ownership

Ownership boundaries:

- This Part states the definition of a prestable ∞-category (§2.1, SAG, Def. C.1.2.1, p. 1945) and of an additive ∞-category (§2.4, SAG, Def. C.1.5.1). Pointed ∞-categories, fiber and cofiber sequences and stable ∞-categories are Part StableInfinityCategories' (§1.1), adjunctions Part AdjunctionsAndLocalizations' (§1.1), presentability Part PresentableInfinityCategories's (§1.1), compactness and Ind-completion Part PresheavesAndCompletions' (§6.1), and truncated objects Part InfinityCategoryFoundations' (§10.1). This Part cites them.
- Part StableInfinityCategories owns stable ∞-categories, suspension and loop functors, t-structures and hearts, t-exact functors (§3.5), bounded and complete t-structures, spectrum objects, the stable ∞-category of spectra, generated and accessible t-structures, and t-structures compatible with filtered colimits (§11.5). Part PresentableInfinityCategories owns truncation in presentable ∞-categories, Postnikov completeness, dense subcategories, left exact filtered colimits, P_Σ, and the reduction of finite colimits in n-categories to coproducts and geometric realizations (§7.6). This Part cites them.
- Grothendieck abelian categories are Mathlib's `IsGrothendieckAbelian`, cited directly. Mathlib also has Noetherian objects (`CategoryTheory.IsNoetherianObject`), the fact that subobjects of Noetherian objects are Noetherian, Serre classes and finitely presentable objects. Tau Ceti already has limits and colimits in quasicategories (`SSet.slice.IsLimit`, `SSet.coslice.IsColimit`), fully faithful functors (`SSet.IsFullyFaithful`), the ∞-category of ∞-categories (`SSet.catInfty`) and Cartesian fibrations. This Part cites them and states only what the libraries lack.
- Tensor products of Grothendieck prestable ∞-categories, algebra and module objects, and every statement that needs an ∞-operad are not part of this roadmap. This excludes SAG, Prop. C.1.5.7 for additive ∞-categories in general, whose proof identifies connective spectra with grouplike commutative monoids (HA, Rem. 5.2.6.26), and SAG, Prop. C.2.4.2, which rests on it. This Part proves the case of nerves of ordinary additive categories by a strict model (§2.4). The examples of connective modules over a ring are built from P_Σ (Conventions).

## Conventions

Locators such as (HTT, Prop. 5.2.7.8, p. 385) refer to the editions listed under [References](#references).

Every statement to prove, define or construct carries a label `X.Y.Z` — its section, then its position within that
section — and a single labeled statement, cited as `§2.2.2` here and `Part PrestableInfinityCategories §2.2.2`
elsewhere, is one target.

- **∞-categories.** An ∞-category is a quasicategory, Mathlib's `SSet.Quasicategory`. Functor ∞-categories are Mathlib's internal homs `(ihom K).obj C`. Limits and colimits are Tau Ceti's `SSet.slice.IsLimit` and `SSet.coslice.IsColimit`, fully faithful functors are Tau Ceti's `SSet.IsFullyFaithful`, and equivalences and full subcategories are those of Part InfinityCategoryFoundations §1.2 and §2.1.
  - *Witness.* The nerve of an ordinary category is an ∞-category (Mathlib instance `CategoryTheory.Nerve.quasicategory`), and its mapping spaces are discrete. This is the source of every non-example below in which suspension is zero.
- **Suspension and loops.** In a pointed ∞-category C with finite colimits, ΣX is the pushout of 0 ← X → 0. With finite limits, ΩX is the pullback of 0 → X ← 0 (Part StableInfinityCategories §1.1, HA, §1.1.2, p. 24). In a prestable ∞-category these are computed inside C, not in a stable envelope.
  - *Witness.* In connective spectra Sp≥0, the unit Hℤ → ΩΣHℤ is an equivalence. But ΩHℤ, computed in Sp≥0, is the connective cover of the stable desuspension of Hℤ, which is 0. So ΣΩHℤ = 0 ≠ Hℤ, and Ω is not inverse to Σ.
- **t-structures** are indexed homologically, as in HA: (C≥0, C≤0), with C≥n = ΣⁿC≥0. Mathlib's `Triangulated.TStructure` is cohomological. On homotopy categories, C≥n corresponds to Mathlib's `le (−n)` and C≤n to `ge (−n)`.
  - *Witness.* For the standard t-structure on spectra (Part StableInfinityCategories §11.3), ΣHℤ lies in Sp≥1 = ΣSp≥0 and not in Sp≥2. In Mathlib's cohomological indexing on the homotopy category it lies in `le (−1)`, not in `le (−2)`.
- **Exactness of functors.** A functor is left exact if it preserves finite limits and right exact if it preserves finite colimits. For presentable C and D, LFun(C, D) is the full subcategory of functors C → D that preserve small colimits (SAG, Prop. C.2.3.10, p. 1967). LFun^lex(C, D) is the full subcategory of those that are also left exact (SAG, Notation C.3.2.3, p. 1980). t-exactness of exact functors between stable ∞-categories with t-structures is that of Part StableInfinityCategories §3.5 (HA, Def. 1.3.3.1).
  - *Witness.* Σ : Sp≥0 → Sp≥0 lies in LFun but not in LFun^lex. The fiber of 0 → Hℤ in Sp≥0 is 0, while the fiber of Σ0 = 0 → ΣHℤ is Hℤ.
- **Truncations and homotopy objects.** "n-truncated" and "discrete" (= 0-truncated) are as in Part InfinityCategoryFoundations §10.1 (HTT, Def. 5.5.6.1). τ≤n C is the full subcategory of n-truncated objects. In a prestable C with finite limits, πₙX is τ≤0 ΩⁿX, an object of the heart C♥ (§3.2). It agrees with Ωⁿ τ≤n X.
  - *Witness.* In Sp≥0, πₙ is the n-th stable homotopy group. For X = ΣᵐHℤ, πₙX = ℤ when n = m and 0 otherwise.
- **Grothendieck abelian categories and compact objects.** A Grothendieck abelian category is Mathlib's `IsGrothendieckAbelian.{v}` on a category with morphisms in `Type v`: locally small, AB5 and with a separator. This is HA's notion (HA, Def. 1.3.5.1). A compact object of an abelian category is one for which Hom(X, −) commutes with filtered colimits: Mathlib's `IsFinitelyPresentable`.
  - *Witness.* Abelian groups form a Grothendieck abelian category, and ℤ is compact there. ℚ is not compact: the identity of ℚ = colim ⅟(n!)ℤ factors through no stage.
- **Connective modules over a ring.** For a commutative ring R, Free_R is the additive category of finitely generated free R-modules and Mod_R^cn = P_Σ(N(Free_R)) (Part PresentableInfinityCategories §7.1, HTT, Def. 5.5.8.8). Mod_R^cn is used only in Checks and Examples, as a source of computations, and only through the properties that §2.4, §3.3 and §6.1 prove for P_Σ of the nerve of a small additive category, together with the elementary module theory recorded at each Check:
  - it is prestable with objectwise limits, and its homotopy objects are objectwise: πₙX is the R-module πₙ(X(R), 0) (§2.4). The additive functors Free_R^op → Ab are the R-modules, by evaluation at R, so the heart is Mod_R (§2.4.3 (b));
  - fiber and cofiber sequences give long exact sequences of these homotopy groups, and πₙ detect equivalences (§2.4.3 (c));
  - Map(Rⁿ, X) ≃ X(Rⁿ) for the representable Rⁿ (Yoneda), and the representables generate Mod_R^cn under sifted colimits and are compact (Part PresentableInfinityCategories §7.1, §7.2), so Mod_R^cn is Grothendieck prestable (§6.1);
  - it is complete, hence separated (§3.3).
  - *Witness.* The discrete object ℤ/2 of Mod_ℤ^cn is the cofiber of 2 : ℤ → ℤ between representables: the long exact sequence of §2.4.3 (c) gives π₀ = ℤ/2 and πₙ = 0 for n > 0. The cofiber of ℤ → 0 is Σℤ, with π₁ = ℤ: in Mod_ℤ^cn, unlike in the nerve of abelian groups, suspension is not zero.
- **Size.** Small and large are relative to the fixed universe of Part InfinityCategoryFoundations §1.1. `Groth∞` and `Groth∞^lex` are large ∞-categories, subcategories of `Pr^L` (§5.1).

## Exact supplier contracts

### From Mathlib

- `SSet.Quasicategory` (`Mathlib/AlgebraicTopology/Quasicategory/Basic.lean`) is the carrier of ∞-categories. Instance `CategoryTheory.Nerve.quasicategory` (`Mathlib/AlgebraicTopology/Quasicategory/Nerve.lean`). The instance `SSet.Quasicategory ((ihom K).obj C)` for a quasicategory C (`Mathlib/AlgebraicTopology/SimplicialSet/AnodyneExtensions/Inner/PushoutProduct.lean`) makes functor ∞-categories ∞-categories.
- `CategoryTheory.isNoetherianObject` and `CategoryTheory.IsNoetherianObject` (`Mathlib/CategoryTheory/Subobject/NoetherianObject.lean`). These are Noetherian objects as the ascending chain condition on subobjects, together with closure under subobjects (the instance `ObjectProperty.IsClosedUnderSubobjects` there) and `CategoryTheory.isNoetherianObject_of_isZero` (same file).
- `CategoryTheory.ShortComplex.SnakeInput` (`Mathlib/Algebra/Homology/ShortComplex/SnakeLemma.lean`), the snake lemma used in §1.1.
- `CategoryTheory.ObjectProperty.IsSerreClass` (`Mathlib/CategoryTheory/Abelian/SerreClass/Basic.lean`): contains zero and is closed under subobjects, quotients and extensions.
- `CategoryTheory.ObjectProperty.IsClosedUnderColimitsOfShape` (`Mathlib/CategoryTheory/ObjectProperty/ColimitsOfShape.lean`), for closure under coproducts in §1.2, and `CategoryTheory.Functor.kernel` (`Mathlib/CategoryTheory/ObjectProperty/ContainsZero.lean`), the objects a functor sends to zero.
- The complete lattice `CategoryTheory.Subobject X` (`Mathlib/CategoryTheory/Subobject/Lattice.lean`), whose supremum is the union of subobjects in §1.3, and the Ind-objects `CategoryTheory.Ind` and `CategoryTheory.Ind.yoneda` (`Mathlib/CategoryTheory/Limits/Indization/Category.lean`), with `CategoryTheory.Limits.IsIndObject` and `CategoryTheory.Limits.IndObjectPresentation` (`Mathlib/CategoryTheory/Limits/Indization/IndObject.lean`), of §1.3.2 (b).
- `CategoryTheory.IsGrothendieckAbelian` (`Mathlib/CategoryTheory/Abelian/GrothendieckCategory/Basic.lean`), with its instances `IsGrothendieckAbelian.hasColimits` and `IsGrothendieckAbelian.wellPowered` and its field `hasSeparator`. These are the Grothendieck abelian categories of the whole Part, including the hearts of §4.1 and §4.5.
- `CategoryTheory.IsFinitelyPresentable` (`Mathlib/CategoryTheory/Presentable/Finite.lean`) and `CategoryTheory.IsLocallyFinitelyPresentable` (`Mathlib/CategoryTheory/Presentable/LocallyPresentable.lean`). Nothing is assumed of them beyond their definitions.
- `SSet.hoFunctor` (`Mathlib/AlgebraicTopology/SimplicialSet/HomotopyCat.lean`), `CategoryTheory.nerveAdjunction` (`Mathlib/AlgebraicTopology/SimplicialSet/NerveAdjunction.lean`) and `CategoryTheory.Limits.IsColimit`, for the heart as a nerve (§3.2); `CategoryTheory.LocallySmall`, `CategoryTheory.ShrinkHoms` and `CategoryTheory.ShrinkHoms.equivalence` (`Mathlib/CategoryTheory/EssentiallySmall.lean`), for the abelian heart with morphisms in `Type u` (§4.1).
- `CategoryTheory.Preadditive` (`Mathlib/CategoryTheory/Preadditive/Basic.lean`) and `CategoryTheory.Limits.HasBinaryBiproducts` (`Mathlib/CategoryTheory/Limits/Shapes/BinaryBiproducts.lean`), for the additive homotopy categories of §2.4.
- `SSet.modelCategoryQuillen.I` (`Mathlib/AlgebraicTopology/SimplicialSet/CategoryWithFibrations.lean`), the boundary inclusions whose right lifting property defines trivial Kan fibrations (§5.2).
- `CategoryTheory.Triangulated.TStructure`, used only in the indexing convention above.
- `CategoryTheory.ShortComplex.ShortExact.homology_exact₁`, `homology_exact₂`, `homology_exact₃` and `CategoryTheory.ShortComplex.ShortExact.δ` (`Mathlib/Algebra/Homology/HomologySequence.lean`), the homology sequence of a short exact sequence of complexes, and `AlgebraicTopology.alternatingFaceMapComplex`, for §2.4.

### From Tau Ceti

- `SSet.slice.IsLimit` and `SSet.coslice.IsColimit` (`TauCeti/AlgebraicTopology/Quasicategory/Limit.lean`): limits and colimits in an ∞-category, including the finite limits and colimits, products, coproducts, pushouts and pullbacks used throughout (HTT, Def. 1.2.13.4).
- `SSet.IsFullyFaithful` (`TauCeti/AlgebraicTopology/Quasicategory/FullyFaithful.lean`): fully faithful functors (HTT, Def. 1.2.10.1).
- `SSet.IsLocallySmall` (`TauCeti/AlgebraicTopology/Quasicategory/LocallySmall.lean`): locally small ∞-categories, whose mapping spaces have u-small Kan models, for the hom universe of the abelian heart (§4.1).
- `SSet.catInfty` (`TauCeti/AlgebraicTopology/Quasicategory/CatInfty.lean`): the ∞-category of ∞-categories (HTT, Def. 3.0.0.1), and its large variant for `Pr^L`.
- `SSet.CartesianFibration` and `SSet.Edge.IsCartesian` (`TauCeti/AlgebraicTopology/Quasicategory/Cartesian.lean`): the Cartesian fibrations and Cartesian edges of §5.2. coCartesian fibrations are the opposite notion, from Part CartesianFibrations §1.1.
- Simplicial abelian groups, for the strict model of P_Σ in Layer 2 (`TauCeti/AlgebraicTopology/SimplicialSet/KanComplex/`): Moore's theorem `SSet.kanComplex_of_addGroup` (`SimplicialGroup/Basic.lean`); epimorphisms of simplicial abelian groups are Kan fibrations, `CategoryTheory.NatTrans.fibration_whiskerRight_forget_addCommGrpCat_of_epi` (`SimplicialGroup/Fibration.lean`); homotopy groups as homology of the alternating face map complex, `CategoryTheory.SimplicialObject.piAddEquivAlternatingFaceMapComplexHomology` and `CategoryTheory.SimplicialObject.piZeroEquivAlternatingFaceMapComplexHomology` (`MooreComplex.lean`).

### From TauCetiRoadmap.InfinityCategoryTheory (earlier Parts)

- Definitions, by owner Part: Part InfinityCategoryFoundations: categorical equivalences (§2.1), subcategories (§1.2, HTT, §1.2.11), size (§1.1), truncated objects (§10.1, HTT, Def. 5.5.6.1). Part CartesianFibrations: coCartesian fibrations (§1.1, HTT, Def. 2.4.2.1, second sentence). Part LimitsAndKanExtensions: cofinal maps (§2.1, HTT, Def. 4.1.1.1); p-limits and p-Kan extensions (§7.1, HTT, Def. 4.3.1.1, 4.3.2.2). Part AdjunctionsAndLocalizations: adjunctions (§1.1, Kerodon, Def. 6.2.1.1; HTT, Def. 5.2.2.1); localizations (§2.1, HTT, Def. 5.2.7.2). Part PresheavesAndCompletions: the Yoneda embedding (§1.1, HTT, §5.1.3); idempotent completeness (§2.1, HTT, §4.4.5); filtered and sifted simplicial sets (§4.1, §5.1, HTT, Def. 5.3.1.7, 5.5.8.1); compact objects and Ind-completion (§6.1, HTT, Def. 5.3.4.5, 5.3.5.1). Part AccessibleInfinityCategories: accessible ∞-categories (§4.1, HTT, Def. 5.4.2.1). Part PresentableInfinityCategories: local objects (§1.2, HTT, Def. 5.5.4.1); presentable and compactly generated ∞-categories (§1.1, HTT, Def. 5.5.0.1, 5.5.7.1). Part StableInfinityCategories: pointed ∞-categories, fiber and cofiber sequences, stable ∞-categories, suspension functors (§1.1, HA, Def. 1.1.1.1, 1.1.1.4, 1.1.1.6, 1.1.1.9, §1.1.2). Part InfinityTopoi: n-connective objects (§12.1, HTT, Def. 6.5.1.10). Prestable ∞-categories are defined here (§2.1, SAG, Def. C.1.2.1).
- Part InfinityCategoryFoundations: n-categories and truncated mapping spaces (§10.6, HTT, Prop. 2.3.4.18); the two homotopy categories agree, and categorical equivalences are the fully faithful essentially surjective maps (§2.6, HTT, Prop. 1.2.3.1, §1.2.10), for the heart (§3.2).
- Part CartesianFibrations: functor ∞-categories preserve categorical equivalences (§3.4, HTT, Prop. 1.2.7.3), for the heart (§3.2).
- Part LimitsAndKanExtensions: colimits through mapping spaces, and colimits in the nerve of a category as 1-categorical colimits over the homotopy category of the index (§1.4, HTT, Lemma 4.2.4.3, and its second statement), for the heart (§3.2, §4.1); colimits of diagrams of equivalences over weakly contractible shapes (§3.5, HTT, Cor. 4.4.4.10); finite colimits from pushouts and coproducts (§6.5, HTT, Cor. 4.4.2.4, Prop. 4.4.2.6); p-limits and Cartesian edges, and colimits along left fibrations (§7.3, HTT, Prop. 4.3.1.9, 4.3.1.10, 4.4.2.9); restriction of relative Kan extensions (§7.4, HTT, Prop. 4.3.2.15); limits and colimits in functor ∞-categories (§8.2, HTT, Prop. 5.1.2.2); pointed objects and group objects, and group objects through finite products (§9.3, HTT, Def. 7.2.2.1, Prop. 7.2.2.4); geometric realizations (§9.4, HTT, Notation 6.1.2.12); homotopy colimits in simplicial categories are colimits in their nerves (§3.2, HTT, Thm. 4.2.4.1), applied to large simplicial categories object by object (§3.3, *Size*).
- Part AdjunctionsAndLocalizations: adjoints preserve limits (§1.5, HTT, Prop. 5.2.3.5).
- Part Straightening: limits of ∞-categories as Cartesian sections (§3.2, HTT, Prop. 3.3.3.1); colimits of ∞-categories in `Cat∞` (§3.3, HTT, Prop. 3.3.4.2, Cor. 3.3.4.3).
- Part PresheavesAndCompletions: retracts (§2.2, HTT, Def. 4.4.5.4); filtered posets cofinal in filtered ∞-categories (§4.4, HTT, Prop. 5.3.1.18); sifted simplicial sets are weakly contractible and sifted colimits in S commute with finite products (§5.3, HTT, Prop. 5.5.8.7, Lemma 5.5.8.11); filtered colimits in spaces are left exact (§6.2, HTT, Prop. 5.3.3.3); Ind-objects (§6.4, HTT, Prop. 5.3.5.3, Cor. 5.3.5.4, Prop. 5.3.5.14; §6.5, HTT, Prop. 5.3.5.10, 5.3.5.11); κ-filtered colimits and κ-compact objects of the nerve of a category are the 1-categorical ones, compact meaning Mathlib `IsFinitelyPresentable` (§6.4, the statement after HTT, Remark 5.3.5.6), for the heart (§4.1).
- Part AccessibleInfinityCategories: compact objects of a presentable ∞-category are closed under finite colimits (§2.2, HTT, Cor. 5.3.4.15); compact objects of Ind (§4.4, HTT, Lemma 5.4.2.4); adjoints of accessible functors are accessible (§5.4, HTT, Prop. 5.4.7.7); accessibility of fiber products of accessible ∞-categories (§7.1, HTT, Prop. 5.4.6.6).
- Part PresentableInfinityCategories: filtered colimits of ∞-categories with finite colimits (§5.4, HTT, Prop. 5.5.7.11); presentability of localizations (§1.6, HTT, Thm. 5.5.1.1, Prop. 5.5.1.9); dense functors and dense subcategories (§1.7, SAG, Def. 20.4.1.1, Rem. 20.4.1.10); strongly saturated classes, small generation and localization by them (§4.1, §4.2, §4.4, HTT, Def. 5.5.4.5, Lemma 5.5.4.14, Prop. 5.5.4.15, Prop. 5.5.4.20); left exactness of localizations is tested on pullback squares (§4.5, HTT, Prop. 6.2.1.1); `Pr^L`, presentable fibrations, their sections and the limits in PrR (§5.1, §5.2, HTT, Def. 5.5.3.1, 5.5.3.2, Prop. 5.5.3.3, Cor. 5.5.3.4, Prop. 5.5.3.17, Thm. 5.5.3.18); the identity on Cartesian sections of a presentable fibration as a colimit (§5.2, HTT, Lemma 6.3.3.7); left exact functors preserve truncated objects and truncation is an accessible localization (§6.1, §6.2, HTT, Prop. 5.5.6.16, Prop. 5.5.6.18); convergence of Postnikov towers and Postnikov completeness (§6.3, §6.4, HTT, Def. 5.5.6.23, Prop. 5.5.6.26; SAG, Def. A.7.2.1); filtered colimits that are left exact (§6.5, HTT, Def. 7.3.4.2, Ex. 7.3.4.4); P_Σ, its free resolutions and its truncated objects (§7.1, §7.2, §7.5, HTT, Def. 5.5.8.8, Prop. 5.5.8.10, Lemma 5.5.8.14, Rem. 5.5.8.26); Quillen's model structure on product-preserving functors and Bergner's comparison, used for the strict model in this Part's Layer 2 (§9.1, §9.4, HTT, Prop. 5.5.9.1, Cor. 5.5.9.3); colimits in n-categories from coproducts and geometric realizations, and geometric realizations in n-categories as finite colimits (§7.6, HA, Lemma 1.3.3.10, fourth assertion).
- Part StableInfinityCategories: suspension and loops (§1.3, HA, §1.1.2, pp. 23–24); pushouts and pullbacks in stable ∞-categories (§2.2, HA, Prop. 1.1.3.4); exact functors (§2.3, HA, §1.1.4); t-structures, truncation as localization, hearts, extension-closed subcategories (§3.1–§3.4, HA, Def. 1.2.1.1, 1.2.1.4, Prop. 1.2.1.5, Def. 1.2.1.11, Rem. 1.2.1.12, Def. 1.2.1.15); t-exact functors (§3.5, HA, Def. 1.3.3.1); Ind of a stable ∞-category is stable (§6.1, HA, Prop. 1.1.3.6); spectrum objects and stability criteria (§7.2, §7.5, HA, Def. 1.4.2.8, Prop. 1.4.2.24, Rem. 1.4.2.25, Cor. 1.4.2.27); the spectra Sp (§7.6, HA, Def. 1.4.3.1); boundedness and the left completion, defined before Prop. 1.2.1.17 (HA, p. 44), the left completion theorem, left completeness, defined after it (HA, p. 45), and its criterion and dual (§8.1, HA, Prop. 1.2.1.17, 1.2.1.19, Rem. 1.2.1.20); generated and accessible t-structures (§11.1, §11.2, HA, Prop. 1.4.4.11, Def. 1.4.4.12); the t-structure on Sp (§11.3, HA, Prop. 1.4.3.6); t-structures compatible with filtered colimits (§11.5, HA, Def. 1.3.5.20).
- Part InfinityTopoi: Moore's Postnikov sections of Kan complexes are the truncations in S (§12.2, HTT, Rem. 5.5.6.4); delooping in S, identifying connected pointed spaces with group objects (§13.2, §13.4–§13.6, HTT, Lemmas 7.2.2.10–7.2.2.11 at the ∞-topos S).

### From TauCetiRoadmap.ModelCategoryTheory

- Part ModelCategories: homotopy pushout squares, and pushouts along cofibrations of cofibrant objects as homotopy pushouts, with the dual statement for pullbacks (§3.5, HTT, §A.2.4, Prop. A.2.4.4), for the strict model of P_Σ in Layer 2 of this Part.
- Part SimplicialCategories: homotopy colimits and homotopy limits of diagrams, of which the homotopy pushouts and pullbacks of Part ModelCategories §3.5 are the case of spans and cospans (§3.2, HTT, §A.2.8); model-categorical homotopy (co)limits in a simplicial model category agree with the enriched ones (§6.4, HTT, Prop. A.3.3.12, Rem. A.3.3.13), both for the strict model of P_Σ in Layer 2; towers of fibrations and their limits (§4.2, HTT, Cor. A.2.9.25), for §3.3.
- Part KanQuillen: the long exact sequence of a Kan fibration (§1.2), Postnikov sections of Kan complexes (§5.1) and the convergence of towers (§5.3), for the completeness of P_Σ of additive categories (§3.3).

## How to read the build

Layer 1 is classical algebra on Mathlib's abelian categories: Noetherian objects, localizing Serre classes and locally Noetherian Grothendieck abelian categories. Layer 2 builds the Spanier–Whitehead envelope and the stable-envelope criteria for prestability, and derives the exactness and additivity of prestable ∞-categories; it also proves, through a strict model, that P_Σ of the nerve of a small additive category is prestable, which is where the module examples come from. Layer 3 adds finite limits and turns prestable ∞-categories into connective parts of t-structures, with hearts, ∞-connective objects, separation and completeness. Layer 4 introduces Grothendieck prestable ∞-categories and relates their left exact localizations, localizing subcategories and quotients; it ends with the basic example Sp≥0, whose underlying-space functor preserves sifted colimits. Layer 5 studies the ∞-categories `Groth∞` and `Groth∞^lex`: stabilization, filtered colimits, the separated quotient and the completion. Layer 6 treats compact generation and Ind-completion. Layer 7 introduces amplitude and anticompleteness and proves the completion equivalence. Layer 8 introduces almost compact objects and coherence and proves the recognition theorem. Layer 9 combines Layers 1 and 8 into locally Noetherian prestable ∞-categories. The running examples are Sp≥0, Sp and the connective modules Mod_R^cn of the Conventions.

Layer 2 opens with the definition of a prestable ∞-category (§2.1), which every later section uses.

## Layer 1: Noetherian objects and locally Noetherian abelian categories

Throughout this layer, A is an abelian category (Mathlib `Abelian`).

### 1.1 Noetherian objects form a Serre class

**1.1.1.** A Noetherian object of A is an object whose poset of subobjects satisfies the ascending chain condition (SAG, Def. C.6.8.1, p. 2085). This is Mathlib's `IsNoetherianObject`, whose underlying object property `isNoetherianObject` asks that `Subobject X` be well-founded for the reverse order.

Prove that, for a short exact sequence 0 → X′ → X → X″ → 0 in A, X is Noetherian if and only if X′ and X″ are. So the Noetherian objects form a Serre class: `Suggested.lean` declaration `isNoetherianObject_isSerreClass` (SAG, Prop. C.6.8.2, p. 2086). The route: the subobject posets of X′ and X″ embed into that of X, which gives one direction. Conversely, an ascending chain Xₙ in X gives chains Xₙ ∩ X′ in X′ and images in X″. Once both stabilize, the snake lemma applied to the inclusion of the stabilized short exact sequences forces the chain in X to stabilize.

- For a sequence X′ → X → X″ that is exact only in the middle, X is Noetherian when X′ and X″ are (SAG, Cor. C.6.8.3, p. 2086): this is Mathlib's `ObjectProperty.prop_X₂_of_exact` for the Serre class of Noetherian objects, applied to 0 → im(X′ → X) → X → im(X → X″) → 0, where the image of X′ is a quotient of X′ and the image in X″ is a subobject of X″.

*Needs:* for SAG, Prop. C.6.8.2, Mathlib `IsNoetherianObject`, `isNoetherianObject`, `ObjectProperty.IsSerreClass`, the instance `ObjectProperty.IsClosedUnderSubobjects` for `isNoetherianObject`, `isNoetherianObject_of_isZero`, `ShortComplex.SnakeInput`.

*Needs:* for SAG, Cor. C.6.8.3, §1.1.1 (SAG, Prop. C.6.8.2); Mathlib `Abelian` (images of morphisms).

**Checks.**

- In abelian groups, ℤ is Noetherian and ℚ is not: the chain ℤ ⊂ ½ℤ ⊂ ⅙ℤ ⊂ ⋯ ⊂ ⅟(n!)ℤ never stabilizes. The extension 0 → ℤ → ℤ → ℤ/2 → 0 has all three terms Noetherian, as the Serre property requires. A definition that asked only for every finitely generated subobject to be Noetherian would accept ℚ, whose finitely generated subgroups are cyclic.
- Noetherian objects are not closed under infinite direct sums: ⊕ℕ ℤ contains the strictly increasing chain of finite partial sums. So the Serre class of Noetherian objects is not localizing in the sense of §1.2.
- The zero object is Noetherian, since its subobject poset has one element. This is the `ObjectProperty.ContainsZero` field of a Serre class.
- The sequence ℤ/2 → ℤ ⊕ ℤ/2 → ℤ (inclusion of the second summand, projection onto the first) is exact in the middle, and the Corollary gives ℤ ⊕ ℤ/2 Noetherian. Both outer terms are needed: ℤ → ℤ ⊕ ℚ → ℚ is exact in the middle with ℤ Noetherian and ℚ not, and ℤ ⊕ ℚ is not Noetherian.

### 1.2 Localizing subcategories of a Grothendieck abelian category

**1.2.1.** Define a localizing subcategory of a Grothendieck abelian category A as a full subcategory A₀ such that, for every short exact sequence 0 → X′ → X → X″ → 0, X lies in A₀ exactly when X′ and X″ do, and A₀ is closed under small coproducts (SAG, Def. C.5.1.2, p. 2008). Equivalently, A₀ is a Mathlib `ObjectProperty.IsSerreClass` that is closed under small coproducts; this is the form of the `Suggested.lean` declaration `IsLocalizingSerreClass`.

- A localizing subcategory contains 0 (the empty coproduct) and is closed under small colimits, since every colimit is a quotient of a coproduct.
- The kernel of an exact, colimit-preserving functor between Grothendieck abelian categories is localizing (the argument of SAG, Prop. C.5.1.6, (2) ⇒ (1), p. 2010, with Mathlib's `Functor.kernel`). The Serre-class half is Mathlib's instance for `ObjectProperty.inverseImage`, since `Functor.kernel` is `IsZero.inverseImage`; what remains is closure under small coproducts, by `IsClosedUnderColimitsOfShape.inverseImage`.

*Needs:* §1.2.1 (SAG, Def. C.5.1.2); Mathlib `Functor.kernel`, `ObjectProperty.IsSerreClass`, `ObjectProperty.IsClosedUnderColimitsOfShape`, `PreservesFiniteLimits`, `PreservesColimitsOfSize`.

**Checks.**

- Torsion abelian groups form a localizing subcategory of abelian groups. It is the kernel of − ⊗ ℚ, which is exact and preserves colimits.
- Finite abelian groups form a Serre class that is not localizing: ⊕ℕ ℤ/2 is infinite. Divisible groups are closed under quotients, extensions and coproducts but not subobjects (ℤ ⊂ ℚ), so they fail the first condition. This shows that both halves of the definition are needed.
- Torsion-free groups are closed under subobjects, extensions and coproducts but not under quotients (ℤ → ℤ/2), so a definition without quotient closure would accept them.

*Needs:* Mathlib `ObjectProperty.IsSerreClass`, `IsGrothendieckAbelian`.

### 1.3 Locally Noetherian Grothendieck abelian categories and their compact objects

**1.3.1.** Let A be a Grothendieck abelian category. Define A to be locally Noetherian (`Suggested.lean` declaration `IsLocallyNoetherian`) when every object X satisfies the following equivalent conditions: X is the colimit (union) of its Noetherian subobjects; X is the colimit of some small filtered diagram of Noetherian objects; some small coproduct of Noetherian objects maps epimorphically onto X (SAG, Def. C.6.8.5, p. 2087). In Lean the definition uses the third form, an epimorphism from a coproduct indexed by a type in the hom universe.

- For every object X of a Grothendieck abelian A, locally Noetherian or not, the three conditions are equivalent (SAG, Prop. C.6.8.4, p. 2086; `Suggested.lean` declaration `tfae_sSup_noetherianSubobjects_eq_top`, with the union as the supremum in Mathlib's `Subobject X`). The route: by §1.1 the Noetherian subobjects of X are closed under finite sums, so they form a filtered poset, which gives the first implication. The second is immediate, since a filtered colimit is a quotient of the coproduct. For the third, the images of the finite partial coproducts are Noetherian subobjects (§1.1) whose union is X.
- Every object of a locally Noetherian A is the filtered union of its Noetherian subobjects.
- The Noetherian objects of a locally Noetherian A are closed under subobjects, quotients, extensions and finite sums (§1.1).

**Checks.**

- Abelian groups are locally Noetherian: every group is the union of its finitely generated subgroups, which are Noetherian since ℤ is a Noetherian ring. For ℚ the union of the cyclic subgroups ⅟(n!)ℤ is all of ℚ.
- Modules over R = k[x₁, x₂, …] are not locally Noetherian. A nonzero ideal of the domain R contains a principal ideal isomorphic to R, which is not Noetherian, so the only Noetherian submodule of R is 0, and no coproduct of Noetherian modules maps onto R. A definition requiring only "generated by finitely presented objects" would accept this category, since R is finitely presented.
- Vector spaces over a field k are locally Noetherian, but not every object is Noetherian: k^(ℕ) has the strictly increasing chain of finite coordinate subspaces, so the wrong definition "every object Noetherian" rejects them.

*Needs:* §1.1.1 (SAG, Prop. C.6.8.2); Mathlib `IsGrothendieckAbelian`, `IsGrothendieckAbelian.hasColimits`, `IsNoetherianObject`, `Subobject`.

**1.3.2.** Prove the structure theorem for a locally Noetherian Grothendieck abelian category A, with A₀ ⊆ A the full subcategory of Noetherian objects:
- (a) every Noetherian object X is compact: Hom(X, −) commutes with filtered colimits (SAG, Prop. C.6.8.7, p. 2087);
- (b) the inclusion A₀ ⊆ A extends to an equivalence Ind(A₀) → A (SAG, Cor. C.6.8.8, p. 2087; `Suggested.lean` declaration `exists_ind_isNoetherianObject_equivalence`: an equivalence F from Mathlib's `Ind` of A₀ to A with `Ind.yoneda ⋙ F` isomorphic to the inclusion);
- (c) A is locally finitely presentable, `Suggested.lean` declaration `isLocallyFinitelyPresentable_of_isLocallyNoetherian`, and an object of A is compact if and only if it is Noetherian, `Suggested.lean` declaration `isFinitelyPresentable_iff_isNoetherianObject` (SAG, Cor. C.6.8.9, p. 2088).

The route for (a): for a filtered diagram (Yα) with colimit Y, injectivity of colim Hom(X, Yα) → Hom(X, Y) follows from AB5. The kernels of X → Yα → Yβ exhaust X, and the ascending chain condition stops them at X. For surjectivity, the pullbacks X ×Y Yα exhaust X, so one maps onto X. Writing it as a union of Noetherian subobjects gives a Noetherian piece mapping onto X, whose kernel is Noetherian by §1.1 and dies at some later stage by injectivity. That yields a section at that stage. For (b), the route is 1-categorical and goes through Mathlib's presheaf model of `Ind`. Let G : A → Fun(A₀ᵒᵖ, Set) send X to Hom(ι(−), X), where ι is the inclusion. Write X as the filtered union of its Noetherian subobjects Xα (§1.3, a small poset since A is well-powered). By (a), G X is the filtered colimit of the representables Hom(−, Xα), so it is an ind-object (Mathlib `IsIndObject`), and G factors through `Ind` A₀. G is fully faithful: Hom(G X, G Y) = limα (G Y)(Xα) = limα Hom(Xα, Y) = Hom(X, Y), by Yoneda and since X = colimα Xα in A (AB5: the comparison map from the colimit of the directed union is a monomorphism onto the supremum). G is essentially surjective: an ind-object P is a small filtered colimit of representables Hom(−, Nⱼ) (Mathlib `IndObjectPresentation`); for X = colimⱼ Nⱼ in A, (a) gives G X ≅ P. So G is an equivalence; F is its inverse, and `Ind.yoneda ⋙ F` is isomorphic to ι because G ∘ ι is the Yoneda embedding of A₀ (ι is fully faithful). For (c): A₀ is essentially small, since a Noetherian object X is a quotient of a finite sum of copies of a separator S (the images of the finite partial sums of the coproduct of copies of S indexed by Hom(S, X) form a directed family exhausting X, and a directed family of subobjects of a Noetherian object has a largest member) and A is well-powered. Its objects are compact by (a), and every object is a filtered colimit of them (§1.3), which is local finite presentability. Conversely, let X be compact. X is the filtered union of its Noetherian subobjects, so its identity factors through one of them, Xα ⊆ X; then the inclusion Xα → X is a split epimorphism and a monomorphism, so X = Xα is Noetherian.

*Needs:* (a) §1.1.1 (SAG, Prop. C.6.8.2), §1.3.1 (SAG, Prop. C.6.8.4, Def. C.6.8.5), Mathlib `IsGrothendieckAbelian`; (b) (a), §1.3.1 (SAG, Prop. C.6.8.4), Mathlib `Ind`, `Ind.yoneda`, `IsIndObject`, `IndObjectPresentation`, `IsGrothendieckAbelian.hasColimits`, `IsGrothendieckAbelian.wellPowered`; (c) (a), §1.1.1, §1.3.1 (SAG, Prop. C.6.8.4), Mathlib `IsGrothendieckAbelian` (its `hasSeparator` field), `IsGrothendieckAbelian.wellPowered`, `IsGrothendieckAbelian.hasColimits`, `Subobject`, `IsFinitelyPresentable`, `IsLocallyFinitelyPresentable`.

**Checks.**

- In abelian groups the compact objects are the finitely presented groups, which are the finitely generated ones, which are the Noetherian ones, as (c) says. Over R = k[x₁, x₂, …], R is compact but not Noetherian. This is consistent only because Mod_R is not locally Noetherian, so the hypothesis cannot be dropped.
- ⊕ℕ ℤ is neither Noetherian nor compact: its identity is the filtered colimit of the finite partial sums and factors through none.
- In the zero category the unique object is both compact and Noetherian, and Ind(A₀) is the zero category.

### Examples

- Abelian groups, all modules over a Noetherian ring R (whose Noetherian objects are the finitely generated modules; SAG, Ex. C.6.8.6) and quasi-coherent sheaves on a Noetherian scheme are standard locally Noetherian Grothendieck abelian categories. The first is computed in §1.3.
- The torsion subcategory of abelian groups is localizing (§1.2). Its quotient is rational vector spaces, which reappears in §4.4.

### Dependencies

Mathlib: Noetherian objects, Serre classes, Grothendieck abelian categories, Ind-objects, finitely presentable objects. No earlier Part: the layer is 1-categorical.

## Layer 2: Prestability, stable envelopes and additivity

### 2.1 Prestable ∞-categories

**2.1.1.** Define an ∞-category C to be prestable when (a) it is pointed with finite colimits, (b) its suspension functor Σ (Part StableInfinityCategories §1.1) is fully faithful, and (c) every morphism f : Y → ΣZ is the right edge of a pullback square whose top edge is some X → Y and whose bottom edge is 0 → ΣZ, and that square is also a pushout square (SAG, Def. C.1.2.1, pp. 1945–1946). Fully faithful is Tau Ceti's `SSet.IsFullyFaithful` (Conventions).

**Checks.**

- Every stable ∞-category is prestable, Δ[0] in particular: Σ is an equivalence, and for (c) take X to be the fiber of f, since fiber and cofiber sequences agree.
- The nerve of abelian groups is not prestable: its suspension is zero and not fully faithful (Conventions witness).
- Pointed spaces are not prestable: Σ is not fully faithful, since π₀ of the pointed mapping space from S⁰ to itself has two elements while that from S¹ to itself is ℤ.
- Sp≥0 is prestable and not stable (Sp≥0 ⊆ Sp is closed under finite colimits and extensions, so it is prestable by the criterion of §2.3, Layer 2 Examples), so (c) is weaker than asking that fiber and cofiber sequences agree. The fiber of 0 → Hℤ in Sp≥0 is the connective cover of Σ⁻¹Hℤ, which is 0. So 0 → 0 → Hℤ is a fiber sequence of Sp≥0, but not a cofiber sequence, since the cofiber of 0 → 0 is 0. A definition equating prestable with stable would reject Sp≥0. The sphere spectrum would not show this: the connective cover of Σ⁻¹S has π₀ = π₁S = ℤ/2.

*Needs:* Part InfinityCategoryFoundations §1.2.3 (zero objects); Part StableInfinityCategories §1.1.2 (HA, Def. 1.1.1.6: fiber and cofiber sequences, suspension functors); Part InfinityCategoryFoundations §1.2.4 (pushout and pullback squares); Tau Ceti `SSet.IsFullyFaithful`.

### 2.2 The Spanier–Whitehead stable envelope

**2.2.1.** Define, for a pointed ∞-category C with finite colimits, the Spanier–Whitehead ∞-category SW(C) as the colimit, in the ∞-category of ∞-categories, of the sequence C → C → C → ⋯ whose transition maps are all Σ (SAG, Constr. C.1.1.1, p. 1943).

- The objects of SW(C) are represented by pairs (C, m) with C ∈ C and m ∈ ℤ, thought of as formal m-fold suspensions. Mapping spaces are the colimits over k ≥ max(−m, −n) of Map(Σᵐ⁺ᵏC, Σⁿ⁺ᵏD) (SAG, Rem. C.1.1.2, p. 1943).
- Σ preserves finite colimits, so the sequence lies in the subcategory of ∞-categories with finite colimits and right exact functors, whose inclusion into ∞-categories preserves filtered colimits (Part PresentableInfinityCategories §5.4, HTT, Prop. 5.5.7.11, κ = ℵ₀). So SW(C) has finite colimits and is the colimit there too. In particular each canonical map C → SW(C) preserves finite colimits (SAG, Rem. C.1.1.5, p. 1944).

**Checks.**

- For C = Sp≥0, SW(C) is the bounded-below spectra ⋃ Σ⁻ⁿSp≥0 ⊆ Sp, not all of Sp: ⊕ₙ≥0 Σ⁻ⁿHℤ is not bounded below. A construction as the limit of the tower along Ω would give Sp instead (§3.1).
- For C the nerve of an ordinary pointed category with finite colimits, such as abelian groups, ΣX is the pushout of 0 ← X → 0, which is 0. So SW(C) is the zero ∞-category. A construction that inverted objects formally instead of passing to the colimit along Σ would keep abelian groups.
- For C the pointed finite spaces, π₀ of the mapping space from (S⁰, 0) to itself in SW(C) is colim πₖ(Sᵏ) = ℤ. In C itself, π₀ Map(S⁰, S⁰) is a two-element set. The homotopy category of SW(C) is the classical Spanier–Whitehead category (SAG, Ex. C.1.1.4, p. 1944). A colimit along the identity instead of Σ would leave the two-element set.

*Needs:* Part StableInfinityCategories §1.1.1 (HA, Def. 1.1.1.1), §1.1.2 (HA, Def. 1.1.1.6); Tau Ceti `SSet.coslice.IsColimit`, `SSet.catInfty`; Part Straightening §3.3.1 (HTT, Prop. 3.3.4.2), §3.3.2 (HTT, Cor. 3.3.4.3); Part StableInfinityCategories §1.3.1 (HA, §1.1.2, pp. 23–24); Part PresentableInfinityCategories §5.4.1 (HTT, Prop. 5.5.7.11, κ = ℵ₀).

**2.2.2.** Prove that SW(C) is the stable envelope of C: it is stable, and for every stable D, restriction along C → SW(C) is an equivalence from right exact functors SW(C) → D to right exact functors C → D (SAG, Prop. C.1.1.7, p. 1945). The route: SW(C) is pointed with finite colimits by the bullets above, and the shifted sequence gives an inverse to its suspension. Stability then follows from the criterion that a pointed ∞-category with finite colimits whose suspension is an equivalence is stable (Part StableInfinityCategories §7.5, HA, Cor. 1.4.2.27, (2) ⇒ (1)). For the universal property, the colimit description reduces it to showing that precomposition with Σ on right exact functors C → D is an equivalence. Since right exact functors commute with Σ, this is postcomposition with Σ on D, an equivalence because D is stable.

*Needs:* §2.2.1 (SAG, Constr. C.1.1.1, Rem. C.1.1.2, Rem. C.1.1.5); Part StableInfinityCategories §7.5.3 (HA, Cor. 1.4.2.27); Part StableInfinityCategories §1.3.1 (HA, §1.1.2, pp. 23–24); Part StableInfinityCategories §1.1.3 (HA, Def. 1.1.1.9); Mathlib instance `Quasicategory ((ihom K).obj C)`.

### 2.3 Prestability via stable envelopes

**2.3.1.** Prove that for a pointed ∞-category C with finite colimits, the following are equivalent: Σ is fully faithful; C → SW(C) is fully faithful; some finite-colimit-preserving fully faithful functor from C to a stable ∞-category exists (SAG, Prop. C.1.2.2, first assertion, p. 1946). Prove further that, when these hold, the following are equivalent:
- condition (c) of prestability (§2.1, SAG, Def. C.1.2.1);
- every finite-colimit-preserving fully faithful functor to a stable ∞-category has extension-closed essential image;
- the essential image of C → SW(C) is closed under extensions;
- some such functor has extension-closed essential image

(SAG, Prop. C.1.2.2, second assertion, p. 1946). The route: Σ fully faithful makes the mapping-space colimits of §2.2 constant, which gives a fully faithful C → SW(C). An embedding ρ into a stable D intertwines Σ, so Σ on C is fully faithful. For the extension statements, a fiber sequence ρ(C′) → D → ρ(C″) in D is the fiber of a map ρ(C″) → ρ(ΣC′), which comes from C by full faithfulness. Condition (c) then produces the fiber in C, and ρ preserves it. Conversely, closure under extensions lets one lift the fiber of ρ(f) to C, and full faithfulness transports the fiber property back.

*Needs:* for the first assertion, §2.2.1 (SAG, Constr. C.1.1.1, Rem. C.1.1.2, Rem. C.1.1.5, Prop. C.1.1.7); Part StableInfinityCategories §1.1.2 (HA, Def. 1.1.1.4; Def. 1.1.1.9); Tau Ceti `SSet.IsFullyFaithful`; Part StableInfinityCategories §1.3.1 (HA, §1.1.2, pp. 23–24).

*Needs:* for the second assertion, the first assertion; §2.2.1 (SAG, Constr. C.1.1.1); §2.1.1 (SAG, Def. C.1.2.1); Part StableInfinityCategories §1.1.2 (HA, Def. 1.1.1.4; Def. 1.1.1.9); Tau Ceti `SSet.IsFullyFaithful`, `SSet.slice.IsLimit`, `SSet.coslice.IsColimit`; Part StableInfinityCategories §3.4.2 (HA, Def. 1.2.1.15).

**2.3.2.** Prove that an ∞-category C is prestable if and only if it admits a fully faithful embedding into a stable ∞-category whose essential image is closed under finite colimits and extensions (SAG, Cor. C.1.2.3, p. 1947; planned declaration `isPrestable_iff_exists_stableEnvelope`). The route: combine the two equivalences of §2.3.1, using SW(C) for the forward direction.

*Needs:* §2.2.2 (SAG, Prop. C.1.1.7); §2.3.1 (SAG, Prop. C.1.2.2); §2.1.1 (SAG, Def. C.1.2.1); Tau Ceti `SSet.IsFullyFaithful`; Part StableInfinityCategories §3.4.2 (HA, Def. 1.2.1.15).

### 2.4 Exactness, additivity, and P_Σ of additive categories

**2.4.1.** Let C be prestable, and let ρ : C → D be an embedding as in §2.3.

Prove that a prestable C is exact in the following three senses. If C′ → C → C″ is a cofiber sequence in C and two of the three objects are zero, so is the third (SAG, Cor. C.1.2.4, p. 1947); a morphism u of C with zero cofiber is an equivalence (SAG, Cor. C.1.2.5, p. 1947); and every pushout square in C is a pullback square (SAG, Cor. C.1.2.6, p. 1947). The route is one transport to the stable D along ρ, which preserves finite colimits (a fully faithful functor whose essential image is closed under finite colimits preserves them) and, being fully faithful, reflects zero objects, equivalences and pullbacks. In D the third object of a cofiber sequence with two zero terms is zero, a map with zero cofiber is an equivalence, and pushouts are pullbacks (Part StableInfinityCategories §2.2, HA, Prop. 1.1.3.4).

*Needs:* §2.3.2 (SAG, Cor. C.1.2.3); §2.1.1 (SAG, Def. C.1.2.1); Part StableInfinityCategories §1.1.3 (HA, Def. 1.1.1.9; Def. 1.1.1.6); Part StableInfinityCategories §2.2.1 (HA, Prop. 1.1.3.4); Tau Ceti `SSet.IsFullyFaithful`, `SSet.slice.IsLimit`; Mathlib instance `Quasicategory ((ihom K).obj C)` for the ∞-category of squares.

**Checks.**

- In Sp≥0, the pushout square with corners Hℤ, 0, 0, ΣHℤ is a pullback: the pullback of 0 → ΣHℤ ← 0 computed in Sp≥0 is the connective cover of Hℤ, which is Hℤ. The converse fails. The square with corners 0, 0, 0, Hℤ is a pullback, because ΩHℤ computed in Sp≥0 is 0. It is not a pushout, because the pushout of 0 ← 0 → 0 is 0 ≠ Hℤ. So Sp≥0 is not stable, and the third statement is one-directional.
- In pointed finite spaces, Σ is not fully faithful. The pointed mapping space Map(S¹, S¹) has π₁ = π₂(S¹) = 0 at the identity, while Map(S², S²) has π₁ = π₃(S²) = ℤ. So this category is not prestable. The third statement fails there too: the pushout square with corners S⁰, ∗, ∗, S¹ is not a pullback, since testing it against S⁰ would make Map(S⁰, S⁰) ≃ S⁰ equivalent to ΩS¹ ≃ ℤ. So the prestability hypothesis cannot be weakened to "pointed with finite colimits".
- In the nerve of abelian groups, the cofiber of ℤ → 0 is Σℤ = 0, yet ℤ is not 0. This is consistent with the first statement only because that ∞-category is not prestable.

**2.4.2.** Define an ∞-category C to be additive if it has finite products and finite coproducts and its homotopy category is an additive category (SAG, Def. C.1.5.1, p. 1954).

- An additive ∞-category is pointed, and for objects X and Y the map X ⊔ Y → X × Y with matrix (id, 0; 0, id) is an equivalence. The common object is written X ⊕ Y (SAG, Rem. C.1.5.2, p. 1955).
- Every stable ∞-category is additive, and so is every full subcategory of an additive ∞-category closed under finite coproducts. Hence every prestable ∞-category is additive, through a stable envelope (§2.3) (SAG, Ex. C.1.5.4–C.1.5.6, p. 1955).

**Checks.**

- Sp≥0 is additive. Pointed spaces are not: S¹ ∨ S¹ → S¹ × S¹ is not an equivalence, since π₁ is free on two generators on one side and ℤ² on the other. A definition requiring only a zero object and finite products and coproducts would accept pointed spaces.
- The nerve of pointed sets has a zero object, finite products and finite coproducts, but its homotopy category (pointed sets) is not additive, since the wedge of two copies of S⁰ has three points and the product has four. The additivity condition on hC excludes it.
- The nerve of commutative monoids has finite biproducts (the coproduct M ⊔ N is the product M × N), but its homotopy category is not additive: Hom(ℕ, ℕ) = ℕ is not a group. A definition asking only for biproducts (semiadditivity) would accept it.

*Needs:* Tau Ceti `SSet.slice.IsLimit`, `SSet.coslice.IsColimit` (products and coproducts); Part StableInfinityCategories §1.1.1 (HA, Def. 1.1.1.1); §2.3.2 (SAG, Cor. C.1.2.3); Mathlib `CategoryTheory.Preadditive`, `Limits.HasBinaryBiproducts` for the additive homotopy category.

**2.4.3.** Let A be a small additive category, an ordinary category viewed through its nerve, and let M_A be the abelian category of additive functors A^op → Ab. Prove that P = P_Σ(N(A)) (Part PresentableInfinityCategories §7.1, HTT, Def. 5.5.8.8) has the following properties. This is the case of nerves of SAG, Prop. C.1.5.7, (1) ⇒ (2), with the assertions of SAG, Rem. C.1.5.9 about P itself (pp. 1955–1957).
- (a) P is prestable, and its small limits are computed objectwise in Fun(N(A)^op, S).
- (b) An object X of P is discrete exactly when every X(a) is discrete, and the discrete objects form the nerve of M_A. For n ≥ 0 the object τ≤0 ΩⁿX is the additive functor a ↦ πₙ(X(a), 0).
- (c) For a map Y → W of P with fiber X there is an exact sequence ⋯ → πₙX(a) → πₙY(a) → πₙW(a) → πₙ₋₁X(a) → ⋯ → π₀X(a) → π₀Y(a) → π₀W(a), natural in a. When X → Y → W is a cofiber sequence, the sequence continues with π₀W(a) → 0. A map of P is an equivalence exactly when it induces isomorphisms on all πₙ(−(a), 0).

Lurie's route identifies P with Fun^π(N(A)^op, Sp≥0) through HA, Rem. 5.2.6.26, which needs ∞-operads. For nerves of ordinary categories a strict model avoids it.
- *The strict model.* A product-preserving functor A^op → Set takes values in abelian groups and additive maps: the diagonal a → a ⊕ a gives the addition, the codiagonal shows that the functor is additive on hom-groups, and the shear automorphism of a ⊕ a gives inverses. So the category A_s of product-preserving functors A^op → SSet is the category of simplicial objects of M_A. Quillen's model structure on A_s has objectwise weak equivalences and fibrations, and its underlying ∞-category is P (Part PresentableInfinityCategories §9.1 and §9.4, HTT, Prop. 5.5.9.1, Cor. 5.5.9.3, applied to A^op, which has finite products). That equivalence is induced by HTT, Prop. 4.2.4.4 (Part LimitsAndKanExtensions §3.1), so it is compatible with evaluation at a: the presheaf attached to a fibrant-cofibrant X has value the Kan complex X(a). Hence πₙ(X(a), 0) means the same for X in A_s and for its image in P.
- *Fibrant objects, fibrations, cofibrations.* Every object of A_s is fibrant, since each X(a) is a simplicial abelian group (Tau Ceti `SSet.kanComplex_of_addGroup`). Every epimorphism of A_s is a fibration (Tau Ceti `CategoryTheory.NatTrans.fibration_whiskerRight_forget_addCommGrpCat_of_epi`). Every cofibration is a monomorphism. The generating cofibrations are the images under the reflection F of the projective generators h_a × ∂Δ[n] → h_a × Δ[n], with h_a = Hom_A(−, a) (Part PresentableInfinityCategories §9.1, *Combinatoriality*). F is computed levelwise, preserves coproducts and fixes the additive h_a, so F(h_a × K) is, in simplicial degree m, the direct sum of copies of h_a indexed by the m-simplices of K. In degree m the generators are therefore the split monomorphisms of such sums induced by the inclusion of the m-simplices of ∂Δ[n] into those of Δ[n]. Monomorphisms of the Grothendieck abelian M_A are closed under coproducts, pushouts, transfinite composites (AB5) and retracts.
- *Long exact sequences.* A short exact sequence 0 → X → Y → Q → 0 of A_s gives, at each a, a short exact sequence of alternating face map complexes, whose homology is the homotopy at 0 (Tau Ceti `CategoryTheory.SimplicialObject.piAddEquivAlternatingFaceMapComplexHomology` and `piZeroEquivAlternatingFaceMapComplexHomology`). Mathlib's homology sequence (`CategoryTheory.ShortComplex.ShortExact.homology_exact₁`, `homology_exact₂`, `homology_exact₃`) then gives the exact sequence of (c), ending with π₀Q(a) → 0. A map of A_s is a weak equivalence exactly when it is an isomorphism on all πₙ at 0, because each X(a) is a simplicial group, whose components are translates of the component of 0.
- *Cofibers are fibers.* Every map of P is modeled by a cofibration X ↪ Y between cofibrant objects. Its pushout along X → 0 is the quotient Y/X, and the square is a homotopy pushout (ModelCategoryTheory, Part ModelCategories §3.5, HTT, Prop. A.2.4.4). The same square is the pullback of the fibration Y → Y/X between fibrant objects, hence a homotopy pullback (the dual statement). A homotopy pushout square in the sense of ModelCategoryTheory, Part ModelCategories §3.5 is a homotopy colimit of its span, because projectively cofibrant spans are the cofibrant resolutions used there (ModelCategoryTheory, Part SimplicialCategories §3.2). On A_s° these model-categorical homotopy colimits are the enriched homotopy colimits of Part LimitsAndKanExtensions §3.2 (ModelCategoryTheory, Part SimplicialCategories §6.4, HTT, Prop. A.3.3.12, Rem. A.3.3.13), and dually for pullbacks. So homotopy pushouts and pullbacks of A_s are pushouts and pullbacks in P (Part LimitsAndKanExtensions §3.2, HTT, Thm. 4.2.4.1, applied to the large A_s° object by object through small full subcategories, as in Part LimitsAndKanExtensions §3.3, *Size*). So every cofiber sequence of P is a fiber sequence, with the exact sequence of (c).
- *Fibers.* Dually, a map Y → W of P is modeled by a fibration. Its image is a union of components of W, since Δ[0] → Δ[n] is anodyne. Its kernel X is the fiber: X need not be cofibrant, so replace it by a cofibrant X′ → X, and use that homotopy pullbacks are invariant under objectwise weak equivalence. Then 0 → X → Y → im → 0 gives (c). If π₀W = 0 the fibration is an epimorphism. Then replace X ↪ Y by a cofibration between cofibrant objects. The two long exact sequences and the five lemma show that its cofiber maps to W by a weak equivalence, so X → Y → W is also a cofiber sequence.
- *Prestability.* j(0) is a zero object of P. For a cone X ↪ CX with CX ≃ 0, the cofiber sequence X → CX → ΣX is a fiber sequence, so X → ΩΣX is an equivalence and Σ is fully faithful. Its long exact sequence gives π₀ΣX = 0. So for f : Y → ΣZ, the fiber of f gives a square that is both a pullback and a pushout, which is condition (c) of §2.1 (SAG, Def. C.1.2.1). Limits in P are objectwise because P is closed under limits in P(N(A)) (Part PresentableInfinityCategories §7.1, item 1; Part LimitsAndKanExtensions §8.2, HTT, Prop. 5.1.2.2).
- *Discrete objects.* Part PresentableInfinityCategories §7.5 (HTT, Rem. 5.5.8.26) makes truncation objectwise, and the first step identifies the product-preserving set-valued functors with M_A. Ωⁿ is objectwise, being a limit.

*Needs:* §2.4.2 (SAG, Def. C.1.5.1); §2.1.1 (SAG, Def. C.1.2.1); Part StableInfinityCategories §1.1.2 (HA, Def. 1.1.1.4, Def. 1.1.1.6); Part InfinityCategoryFoundations §10.1.3 (HTT, Def. 5.5.6.1); Part PresentableInfinityCategories §7.1.1 (HTT, Def. 5.5.8.8), §7.1.2 (HTT, Prop. 5.5.8.10), §7.5.1 (HTT, Rem. 5.5.8.26), §9.1.1 (HTT, Prop. 5.5.9.1) and §9.4.1 (HTT, Cor. 5.5.9.3); Part LimitsAndKanExtensions §3.1.1 (HTT, Prop. 4.2.4.4), §3.2.1 (HTT, Thm. 4.2.4.1), §3.3.1 (*Size*) and §8.2.2 (HTT, Prop. 5.1.2.2); ModelCategoryTheory, Part ModelCategories §3.5.1, §3.5.2 (HTT, Prop. A.2.4.4), §3.5.3; ModelCategoryTheory, Part SimplicialCategories §3.2.1 (HTT, §A.2.8, homotopy colimits) and §6.4.1 (HTT, Prop. A.3.3.12, Rem. A.3.3.13); Tau Ceti `SSet.kanComplex_of_addGroup`, `CategoryTheory.NatTrans.fibration_whiskerRight_forget_addCommGrpCat_of_epi`, `CategoryTheory.SimplicialObject.piAddEquivAlternatingFaceMapComplexHomology`, `CategoryTheory.SimplicialObject.piZeroEquivAlternatingFaceMapComplexHomology`; Mathlib `CategoryTheory.ShortComplex.ShortExact.homology_exact₂` and its neighbors, `IsGrothendieckAbelian`.

**Checks.**

- For A = Free_ℤ, the cofiber W of 2 : ℤ → ℤ has π₀W = ℤ/2 and πₙW = 0 for n > 0 by (c), so W is the discrete object ℤ/2. Its fiber sequence form is the statement that ℤ → ℤ → ℤ/2 is also a pullback, as (a) and the third exactness statement of §2.4.1 require. In the nerve of abelian groups, the same cofiber is ℤ/2 too, but the cofiber of ℤ → 0 is 0, while in P it is Σℤ with π₁ = ℤ.
- The additivity hypothesis cannot be dropped. For A the nerve of finite sets, which has finite coproducts, P_Σ(A) is S (Part PresentableInfinityCategories §7.1, first Check), which is not pointed and so not prestable.
- The final term π₀W(a) → 0 of (c) holds only for cofiber sequences. In P_Σ(N(Free_ℤ)) the map 0 → ℤ has fiber 0, and π₀0 = 0 → π₀ℤ = ℤ is not surjective. So the fiber sequence 0 → 0 → ℤ is not a cofiber sequence: the cofiber of 0 → 0 is 0. Here π₀W ≠ 0, which is the hypothesis of the fiber step that fails. For the map 0 → Σℤ, where π₀Σℤ = 0, the fiber is ΩΣℤ ≃ ℤ, and ℤ → 0 → Σℤ is a cofiber sequence.

### Examples

- Sp≥0 ⊆ Sp is extension-closed and closed under finite colimits, so Sp≥0 is prestable by §2.3.
- SW of pointed finite spaces is finite spectra (§2.2).
- For a commutative ring R, Mod_R^cn = P_Σ(N(Free_R)) is prestable by §2.4.3 (a). Its suspension is fully faithful. For R ≠ 0 that of the nerve of R-modules is not: it is zero, and R is not.

### Dependencies

§2.1; Part StableInfinityCategories (§1.1: pointed and stable ∞-categories, fiber and cofiber sequences); Part StableInfinityCategories (§1.3 suspension, §2.2 pushouts in stable ∞-categories, §3.4 extension closure, §7.5 the stability criterion); Part Straightening (§3.3, colimits in `Cat∞`); Tau Ceti limits, colimits and fully faithful functors. For P_Σ of additive categories (§2.4): Part PresentableInfinityCategories (§7.1, §7.5, §9.1, §9.4: P_Σ, its truncations and its strict model), Part LimitsAndKanExtensions (§3.1, §3.2, §3.3, §8.2), ModelCategoryTheory Parts ModelCategories (§3.5, homotopy pushouts) and SimplicialCategories (§3.2, §6.4, homotopy colimits), and Tau Ceti's simplicial abelian groups.

## Layer 3: Connective parts of t-structures, hearts and completeness

### 3.1 Connective parts of t-structures

**3.1.1.** Prove that for a stable ∞-category D with a t-structure, the connective part D≥0 is prestable (SAG, Ex. C.1.2.8, p. 1948). The route: D≥0 is closed under finite colimits and extensions in D, so §2.3 applies to the inclusion.

*Needs:* §2.3.2 (SAG, Cor. C.1.2.3); Part StableInfinityCategories §1.1.3 (HA, Def. 1.1.1.9); Part StableInfinityCategories §3.1.1 (HA, Def. 1.2.1.1), §3.1.2 (HA, Def. 1.2.1.4) and §3.4.2 (HA, Def. 1.2.1.15).

**3.1.2.** Prove that, conversely, connective parts are exactly the prestable ∞-categories with finite limits: for an ∞-category C the following are equivalent (SAG, Prop. C.1.2.9, p. 1948; planned declaration `tfae_isConnectivePart`):
- C is prestable and admits finite limits;
- C is pointed with finite colimits, C → SW(C) is fully faithful, and SW(C) has a t-structure whose connective part is the essential image of C;
- C is equivalent to D≥0 for some stable D with a t-structure.

The route, from the first condition to the second: take SW(C)≥0 to be the image of ρ : C → SW(C) (fully faithful by §2.3). Take SW(C)≤0 to be the objects Ωⁿρ(D) with D n-truncated in C, and verify the three axioms of a t-structure (Part StableInfinityCategories §3.1, HA, Def. 1.2.1.1). Orthogonality comes from the identification of mapping spaces with loop spaces of mapping spaces in C. Stability of the halves under Σ and Ω comes from the fact that n-truncated objects are (n + 1)-truncated. For the truncation sequence of Ωⁿρ(C), use Σⁿ ⊣ Ωⁿ in C and extension closure of the image to show that the cofiber of ΣⁿΩⁿC → C is (n − 1)-truncated. The second condition implies the third trivially. The third implies the first by §3.1.1, and D≥0 has finite limits because it is a colocalization of D (the dual of Part StableInfinityCategories §3.2, HA, Prop. 1.2.1.5).

The stable D with C ≃ D≥0 is not unique, but there are two extreme choices (SAG, Rem. C.1.2.10, p. 1949):
- SW(C), whose t-structure is right bounded (every object lies in some D≥−n);
- Sp(C), the limit of the tower ⋯ → C → C along Ω (Part StableInfinityCategories §7.2 and §7.5, HA, Def. 1.4.2.8 and Prop. 1.4.2.24), which is the right completion of SW(C) and whose t-structure is right complete. Sp(C) ≃ lim SW(C)≥−n along the truncations τ≥−n, because both are limits along Ω of the same tower once each SW(C)≥−n is identified with C by Σⁿ;
- for any D, colim(C → C → ⋯ along Σ) ≃ ⋃ D≥−n ⊆ D → lim D≥−n ≃ Sp(C). In particular Σ∞ : C → Sp(C) is fully faithful with image Sp(C)≥0, and Ω∞ is its right adjoint.

**Checks.**

- For C = Sp≥0, SW(C) is the ∞-category of bounded-below spectra and Sp(C) is Sp. The spectrum ⊕ₙ≥0 Σ⁻ⁿHℤ is not bounded below, so the inclusion SW(C) → Sp(C) is not essentially surjective and the two choices really differ.
- For C = Sp≥0, Σ∞ : C → Sp(C) is the inclusion of connective spectra, and its right adjoint Ω∞ is the connective cover, which kills Σ⁻¹Hℤ. So Ω∞ is not conservative, and Σ∞ is an equivalence only when C is stable.
- The nerve of abelian groups has finite limits and is pointed with finite colimits, but it is not equivalent to a connective part: Σ = 0 is not fully faithful, so C → SW(C) = 0 is not fully faithful. The second condition cannot drop full faithfulness.

*Needs:* §2.2.1 (SAG, Constr. C.1.1.1, Rem. C.1.1.2); §2.3.1 (SAG, Prop. C.1.2.2); §3.1.1 (SAG, Ex. C.1.2.8); §2.1.1 (SAG, Def. C.1.2.1); Part StableInfinityCategories §1.1.3 (HA, Def. 1.1.1.9); Part InfinityCategoryFoundations §10.1.3 (HTT, Def. 5.5.6.1); Part StableInfinityCategories §3.1.1 (HA, Def. 1.2.1.1), §3.1.2 (HA, Def. 1.2.1.4), §3.2.1 (HA, Prop. 1.2.1.5), §1.3.1 (HA, §1.1.2, pp. 23–24), §7.2.1 (HA, Def. 1.4.2.8), §7.5.2 (HA, Prop. 1.4.2.24), §8.1.1 (HA, the boundedness definitions and the left completion before Prop. 1.2.1.17) and §8.1.5 (their duals, HA, Rem. 1.2.1.20).

### 3.2 The heart

**3.2.1.** Define the heart C♥ of a prestable ∞-category C as the full subcategory of discrete objects (SAG, Notation C.1.2.11, p. 1950). When C has finite limits, C♥ is identified by §3.1 with the heart of the t-structure on SW(C), so it is (the nerve of) an abelian category (Part StableInfinityCategories §3.3, HA, Def. 1.2.1.11 and Rem. 1.2.1.12). πₙ : C → C♥ is τ≤0 Ωⁿ, as in the Conventions.

- C♥ is closed under finite limits in C, and the inclusion has the left adjoint τ≤0 = π₀ when C has finite limits.
- Kernels in C♥ are fibers computed in C, and cokernels in C♥ are π₀ of cofibers computed in C.

**Checks.**

- For C = Sp≥0, C♥ is equivalent to abelian groups, via Eilenberg–MacLane spectra. ΣHℤ is not discrete: π₁ Map(Hℤ, ΣHℤ) = [ΣHℤ, ΣHℤ] = ℤ. Since mapping spaces in C are infinite loop spaces, X is discrete exactly when ΩX ≃ 0 in C. For ΣHℤ, ΩΣHℤ ≃ Hℤ ≠ 0, which confirms the computation.
- For C = Mod_R^cn, C♥ ≃ Mod_R, the objects with πₙ = 0 for n > 0 (§2.4.3 (b)). For C = Sp, viewed as prestable, C♥ = 0: an object with discrete mapping spaces from every ΣⁿS has all homotopy groups zero.
- The cofiber in Sp≥0 of 2 : Hℤ → Hℤ is H(ℤ/2), which is discrete, but the cofiber of Hℤ → 0 is ΣHℤ, which is not. So C♥ is not closed under cofibers in C, and π₀ of a cofiber is the cokernel computed in C♥.

*Needs:* §3.1.2 (SAG, Prop. C.1.2.9); §2.2.1 (SAG, Constr. C.1.1.1); §2.1.1 (SAG, Def. C.1.2.1); Part InfinityCategoryFoundations §1.2.1 (HTT, §1.2.11 subcategories) and §10.1.3 (HTT, Def. 5.5.6.1); Part StableInfinityCategories §3.3.3 (HA, Def. 1.2.1.11, Rem. 1.2.1.12).

**3.2.2.** Prove that the heart is a 1-category up to equivalence and that its colimits are 1-categorical. Let C be prestable, h C♥ = `SSet.hoFunctor.obj C♥` the homotopy category of C♥, and q : K → C♥ a diagram indexed by a simplicial set K.
- The unit C♥ → N(h C♥) of Mathlib's `CategoryTheory.nerveAdjunction` is a categorical equivalence.
- A cocone K^▷ → C♥ under q is a colimit in C♥ exactly when the corresponding cocone under the functor hK → h C♥ is a colimit cocone in h C♥ (Mathlib `CategoryTheory.Limits.IsColimit`).
- Every functor hK ⥤ h C♥ is isomorphic to h(q) for some diagram q : K → C♥.

This is the case of hearts of the comparison of colimits in nerves with 1-categorical colimits (Part LimitsAndKanExtensions §1.4, second statement); compact objects of nerves are compared with Mathlib's finitely presentable objects in Part PresheavesAndCompletions §6.4, and §4.1 applies both to the heart of a Grothendieck prestable ∞-category. The route: C♥ has discrete mapping spaces, so the unit, which is bijective on objects, induces, on the mapping spaces Map(x, y) of C♥, the maps Map(x, y) → π₀ Map(x, y) = Hom(x, y) in h C♥ (Part InfinityCategoryFoundations §2.6, HTT, Prop. 1.2.3.1), which are homotopy equivalences. So it is fully faithful and essentially surjective, hence a categorical equivalence (Part InfinityCategoryFoundations §2.6, HTT, §1.2.10; §10.6, HTT, Prop. 2.3.4.18). Colimits are invariant under a categorical equivalence F of ∞-categories: by the first statement of Part LimitsAndKanExtensions §1.4 (HTT, Lemma 4.2.4.3), a cocone is a colimit exactly when composition gives homotopy equivalences from Map(X, Y) to the mapping space from q to δ(Y) in the functor ∞-category, for all Y. F induces equivalences on both sides, since Fun(K, F) is a categorical equivalence (Part CartesianFibrations §3.4, HTT, Prop. 1.2.7.3), and every object of the target is equivalent to some F(Y). The unit carries q to a diagram whose corresponding functor hK → h C♥ is h(q), by a triangle identity, and Part LimitsAndKanExtensions §1.4, second statement, finishes. For the third bullet: the unit is a categorical equivalence of ∞-categories, so Fun(K, C♥) → Fun(K, N(h C♥)) is one too (Part CartesianFibrations §3.4, HTT, Prop. 1.2.7.3), hence essentially surjective. By Part LimitsAndKanExtensions §1.4, second statement, first bullet, Fun(K, N(h C♥)) is the nerve of hK ⥤ h C♥, whose equivalences are the natural isomorphisms (Part InfinityCategoryFoundations §2.3). So every functor hK ⥤ h C♥ is isomorphic to the functor of the composite of some q with the unit, which is h(q) by the triangle identity.

**Checks.**

- For C = Sp≥0, the pushout of 0 ← Hℤ → 0 in C♥ is 0: in abelian groups the pushout of 0 ← ℤ → 0 is 0. In C it is ΣHℤ, which is not discrete. So the inclusion C♥ ⊆ C does not preserve pushouts, which matches the cokernel bullet: π₀ΣHℤ = 0.
- Discreteness is what is used. In h Sp≥0, the image of ΣHℤ is not a pushout of 0 ← Hℤ → 0: a pushout P there has exactly one map to every object, so P ≅ 0, while ΣHℤ has the two distinct endomorphisms 0 and the identity. So colimits in a prestable C are not computed in hC.

*Needs:* §3.2.1 (SAG, Notation C.1.2.11); §2.1.1 (SAG, Def. C.1.2.1); Part LimitsAndKanExtensions §1.4.1 (HTT, Lemma 4.2.4.3), §1.4.2 (colimits in nerves); Part InfinityCategoryFoundations §2.3.1 (equivalences in nerves), §2.6.3 (HTT, Prop. 1.2.3.1; §1.2.10) and §10.6.5 (HTT, Prop. 2.3.4.18); Part CartesianFibrations §3.4.1 (HTT, Prop. 1.2.7.3); Mathlib `CategoryTheory.nerveAdjunction`, `SSet.hoFunctor`, `CategoryTheory.Limits.IsColimit`.

### 3.3 ∞-connective objects, separation and completeness

**3.3.1.** Let C be prestable with finite limits. Define an object X to be ∞-connective if τ≤n X ≃ 0 for every n. Define C to be separated if every ∞-connective object is zero, and complete if C is the limit of the tower ⋯ → τ≤2 C → τ≤1 C → τ≤0 C = C♥ along the truncations (SAG, Def. C.1.2.12, p. 1950). Truncations exist by §3.1. When C is presentable, completeness is Postnikov completeness (Part PresentableInfinityCategories §6.4, SAG, Def. A.7.2.1).

- X is ∞-connective exactly when, for every n, X is in the essential image of Σⁿ: under §3.1, τ≤n X ≃ 0 says that X lies in SW(C)≥n+1 = Σⁿ⁺¹C.
- A functor that preserves finite colimits preserves ∞-connective objects: it commutes with Σ, and X is ∞-connective exactly when it lies in the essential image of every Σⁿ. Left exactness is not enough: Ω∞ : Sp → Sp≥0 preserves all limits, every object of Sp is ∞-connective (third Check), but Ω∞Hℤ = Hℤ has τ≤0 Hℤ = Hℤ ≠ 0 in Sp≥0.

**Checks.**

- Complete implies separated: an ∞-connective object maps to 0 in every τ≤n C, hence to 0 in the limit. Sp≥0 is complete, because the Postnikov tower of a connective spectrum converges, and so it is separated.
- In Sp≥0, X is ∞-connective exactly when all πₙX vanish, so the only ∞-connective object is 0. A definition requiring only π₀X = 0 would make ΣHℤ ∞-connective, although τ≤1 ΣHℤ = ΣHℤ ≠ 0.
- Sp, which is prestable (every stable ∞-category is), has τ≤n Sp = 0 for every n, so every object is ∞-connective. Sp is neither separated nor complete, while Δ[0] is both. So prestability alone does not force separation.

*Needs:* §3.1.2 (SAG, Prop. C.1.2.9); §3.2.1 (SAG, Notation C.1.2.11); §2.1.1 (SAG, Def. C.1.2.1); Part InfinityCategoryFoundations §10.1.3 (HTT, Def. 5.5.6.1); Part PresentableInfinityCategories §6.4.1 (SAG, Def. A.7.2.1).

**3.3.2.** Prove that for a small additive category A, P = P_Σ(N(A)) is complete, hence separated (SAG, Rem. C.1.5.9, last assertion, p. 1957). The route: by §2.4 and Part PresentableInfinityCategories §7.5 (HTT, Rem. 5.5.8.26), limits and the truncations τ≤n of P are objectwise. By Part PresentableInfinityCategories §6.3 and §6.4 (HTT, Prop. 5.5.6.26; SAG, Def. A.7.2.1) it suffices that a tower in P which is a limit diagram and whose pretower is a Postnikov pretower is a Postnikov tower. Objectwise this is a tower in S, modeled by a tower of Kan fibrations whose strict limit is the ∞-categorical limit X(a) = lim Xₙ(a): such a tower is injectively fibrant (ModelCategoryTheory, Part SimplicialCategories §4.2.1), so its limit is the homotopy limit (Part SimplicialCategories §3.2.1), which is the limit in S (Part LimitsAndKanExtensions §3.2.1, HTT, Thm. 4.2.4.1; ModelCategoryTheory, Part SimplicialCategories §4.2, HTT, Cor. A.2.9.25). The long exact sequences of the fibrations Xₙ₊₁(a) → Xₙ(a), whose fibers are Eilenberg–MacLane in degree n + 1, show that the homotopy groups of the tower stabilize, so the lim¹ terms vanish and πᵢX(a) ≅ πᵢXₙ(a) for n ≥ i (ModelCategoryTheory, Part KanQuillen §1.2 and §5.3). So X(a) → Xₙ(a) is an n-th Postnikov section (ModelCategoryTheory, Part KanQuillen §5.1), which is τ≤n in S because Moore's Postnikov sections are the ∞-categorical truncations of S (Part InfinityTopoi §12.2): the induced map X(a)(n) → Xₙ(a) is a map of n-truncated Kan complexes bijective on all homotopy groups, hence an equivalence by Whitehead's theorem (ModelCategoryTheory, Part KanQuillen §1.3).

*Needs:* §2.4.3; §3.3.1 (SAG, Def. C.1.2.12); Part PresentableInfinityCategories §6.3.1 (HTT, Def. 5.5.6.23), §6.3.2 (HTT, Prop. 5.5.6.26), §6.4.1 (SAG, Def. A.7.2.1) and §7.5.1 (HTT, Rem. 5.5.8.26); Part LimitsAndKanExtensions §8.2.2 (HTT, Prop. 5.1.2.2); ModelCategoryTheory, Part SimplicialCategories §4.2.2 (HTT, Cor. A.2.9.25, towers of fibrations); Part InfinityTopoi §12.2.1 (Postnikov sections are truncations); ModelCategoryTheory, Part KanQuillen §1.2.1 (the long exact sequence of a Kan fibration), §1.3.3 (Whitehead's theorem), §5.1.1 (truncated Kan complexes and Postnikov sections) and §5.3.1 (convergence of towers).

### Examples

- Sp≥0 ⊆ Sp: here SW(Sp≥0) is bounded-below spectra and Sp(Sp≥0) = Sp (§3.1). The heart is abelian groups (§3.2), and Sp≥0 is complete and separated (§3.3).
- Mod_R^cn for a commutative ring R: its heart is Mod_R (§3.2), and it is complete and separated (§3.3.2). Separation is also visible directly: an object with all πₙ zero is zero (§2.4.3 (c)).

### Dependencies

Layer 2; Part InfinityCategoryFoundations (§10.1 truncated objects); Part PresentableInfinityCategories (§6.3, §6.4, Postnikov towers and completeness; §7.5, truncation in P_Σ); Part LimitsAndKanExtensions (§8.2); Part InfinityTopoi (§12.2, truncation in S); ModelCategoryTheory Parts SimplicialCategories (§4.2) and KanQuillen (§1.2, §5.1, §5.3); Part StableInfinityCategories (§3.1–§3.4 t-structures and hearts, §7.2 and §7.5 spectrum objects, §8.1 boundedness and completions). For colimits in the heart (§3.2): Parts LimitsAndKanExtensions (§1.4, colimits in nerves), InfinityCategoryFoundations (§2.6, §10.6) and CartesianFibrations (§3.4).

## Layer 4: Grothendieck prestable ∞-categories and left exact localizations

### 4.1 Grothendieck prestable ∞-categories

**4.1.1.** Prove that for a presentable ∞-category C the following are equivalent (SAG, Prop. C.1.4.1, p. 1952):
- C is prestable and filtered colimits in C are left exact (Part PresentableInfinityCategories §6.5, HTT, Def. 7.3.4.2);
- C is prestable and Ω commutes with filtered colimits;
- C is prestable and Ω∞ : Sp(C) → C commutes with filtered colimits;
- C ≃ D≥0 for a presentable stable D with a t-structure compatible with filtered colimits (Part StableInfinityCategories §11.5, HA, Def. 1.3.5.20).

The route: the first implies the second trivially. For the second implies the third, use the description of Sp(C) as the limit along Ω (§3.1). For the third implies the fourth, take D = Sp(C) (§3.1). For the fourth implies the first, write the right adjoint of the diagonal on Fun(K, D≥0) for finite K as the inclusion into Fun(K, D), followed by the limit in D and then τ≥0. Limits over finite K in stable D commute with filtered colimits (Part StableInfinityCategories §2.2, HA, Prop. 1.1.3.4), and τ≥0 does too: it is the fiber of id → τ≤−1, and D≤−1 is closed under filtered colimits (Part StableInfinityCategories §11.5, HA, Def. 1.3.5.20).

*Needs:* §3.1.2 (SAG, Prop. C.1.2.9, Rem. C.1.2.10); §2.1.1 (SAG, Def. C.1.2.1); Part PresentableInfinityCategories §1.1.1 (HTT, Def. 5.5.0.1); Part AdjunctionsAndLocalizations §1.1.1 (adjunctions, Kerodon, Def. 6.2.1.1), §1.1.3 (HTT, Def. 5.2.2.1); Part PresentableInfinityCategories §6.5.1 (HTT, Def. 7.3.4.2); Part StableInfinityCategories §7.2.1 (HA, Def. 1.4.2.8), §7.5.2 (HA, Prop. 1.4.2.24), §2.2.1 (HA, Prop. 1.1.3.4), §3.1.2 (HA, Def. 1.2.1.4) and §3.2.1 (HA, Prop. 1.2.1.5); Part StableInfinityCategories §1.3.1 (HA, §1.1.2, pp. 23–24); Part StableInfinityCategories §11.5.1 (HA, Def. 1.3.5.20); Mathlib instance `Quasicategory ((ihom K).obj C)`.

**4.1.2.** Define a Grothendieck prestable ∞-category as a presentable prestable ∞-category satisfying these conditions (SAG, Def. C.1.4.2, p. 1953).

- The heart C♥ is a Grothendieck abelian category (SAG, Rem. C.1.4.6, p. 1953; HA, Rem. 1.3.5.23). It is presentable, as the essential image of the accessible localization τ≤0 (Part PresentableInfinityCategories §6.2, HTT, Prop. 5.5.6.18), and filtered colimits in C♥ are π₀ of filtered colimits in C, which commute with finite limits. As a Mathlib category, the abelian heart is A = `ShrinkHoms (h C♥)` with its `Category.{u}` instance, for h C♥ the homotopy category of §3.2. C lives in `SSet.{u+1}` (Part PresentableInfinityCategories Conventions), so the Hom-types π₀ Map(x, y) of h C♥ lie in `Type (u + 1)`. They are u-small because C is locally small (Tau Ceti `SSet.IsLocallySmall`: every mapping space has a u-small Kan model, with the same π₀). So h C♥ is Mathlib `LocallySmall.{u}`, and Mathlib's `CategoryTheory.ShrinkHoms` of it is an equivalent category (`ShrinkHoms.equivalence`) with morphisms in `Type u`, as `IsGrothendieckAbelian.{u}` requires (Conventions). Its nerve is categorically equivalent to N(h C♥), and so to C♥ (§3.2.2, first bullet).
- Colimits and compact objects of the heart are 1-categorical. For any small filtered diagram q : K → τ≤0 C = C♥, a cocone under q is a colimit in τ≤0 C exactly when the corresponding cocone over hK is a colimit in A (§3.2.2, second bullet; an equivalence of categories preserves and reflects colimits). In particular A has colimits of small filtered diagrams: for a small filtered category J, `IsCardinalFiltered J ℵ₀` holds (Mathlib `CategoryTheory.isCardinalFiltered_aleph0_iff`), so N(J) is filtered (Part PresheavesAndCompletions §6.4, (1) of the statement on κ-compact objects of nerves). A functor F : J ⥤ A, carried to h C♥ by `ShrinkHoms.equivalence`, is isomorphic to h(q) for some q : N(J) → C♥, using h N(J) ≅ J (§3.2.2, third bullet; Mathlib instance `CategoryTheory.nerveAdjunction.isIso_counit`). Then q has a colimit in τ≤0 C (Part PresentableInfinityCategories §6.2), which is a colimit of F in A. Conversely, `CategoryTheory.isFiltered_of_isCardinalFiltered` turns this into Mathlib's `HasCardinalFilteredColimits.{u} A ℵ₀`, the hypothesis of Part PresheavesAndCompletions §6.4, (3). An object X is compact in τ≤0 C (Part PresheavesAndCompletions §6.1, HTT, Def. 5.3.4.5) exactly when it is Mathlib `IsFinitelyPresentable.{u}` in A: apply Part PresheavesAndCompletions §6.4, (3) of the statement on κ-compact objects of nerves with κ = ω, to A, whose objects are those of C♥, in universe u + 1, and transport along the categorical equivalence F : N(A) ≃ C♥. Colimits are invariant under categorical equivalence, as in the route of §3.2, and every small filtered diagram in C♥ is equivalent to F of one in N(A), by the third bullet of §3.2.2 and the lifting of the previous sentence. Corepresented functors are carried along F: the maps j(X)(Y) → j(FX)(FY) of Part PresheavesAndCompletions §1.1, third bullet, are equivalences because F is fully faithful, so the functor corepresented by FX, composed with F, is equivalent to j_X. This is how Layer 1 applies to hearts.
- Sp(C) is presentable and stable with a t-structure compatible with filtered colimits, and C ≃ Sp(C)≥0.

**Checks.**

- Sp≥0 is Grothendieck prestable: homotopy groups commute with filtered colimits, so Ω does. Sp is Grothendieck prestable too, through the t-structure whose connective part is all of Sp, and its heart is 0.
- Pointed spaces are presentable and Ω commutes with filtered colimits there, but they are not prestable: Σ is not fully faithful, by the computation with S¹ and S² in the Checks of §2.4, which holds in all pointed spaces. So prestability is not implied by the exactness condition.
- The nerve of abelian groups is presentable and Ω = 0 commutes with filtered colimits (Ω is a pullback, so it is the 1-categorical pullback 0 ×_X 0 = 0 in abelian groups by Part LimitsAndKanExtensions §1.4, second statement, limit bullet), but Σ = 0 is not fully faithful. So it is not Grothendieck prestable, although its heart would be abelian groups. Δ[0] is Grothendieck prestable.
- For C = Sp≥0 the abelian heart is equivalent to abelian groups, and Hℚ is not compact in τ≤0 C, by the second heart bullet and the Conventions witness: the identity of ℚ = colim ⅟(n!)ℤ factors through no stage, since ℚ is divisible and ⅟(n!)ℤ ≅ ℤ is not. Hℤ is compact in τ≤0 C, since ℤ is finitely presented.

*Needs:* §4.1.1 (SAG, Prop. C.1.4.1); §3.2.1 (SAG, Notation C.1.2.11; the unit and colimits in the heart); §2.1.1 (SAG, Def. C.1.2.1); Part PresentableInfinityCategories §1.1.1 (HTT, Def. 5.5.0.1) and its Conventions (size); Part PresentableInfinityCategories §6.2.1 (HTT, Prop. 5.5.6.18); Part InfinityCategoryFoundations §10.6.5 (HTT, Prop. 2.3.4.18); Part PresheavesAndCompletions §1.1.1 (HTT, §5.1.3, third bullet, functoriality of j), §6.1.1 (HTT, Def. 5.3.4.5) and §6.4.6 (HTT, Remark 5.3.5.6, and the statement on κ-compact objects of nerves); Part LimitsAndKanExtensions §1.4.2 (second statement, limit bullet); Mathlib `IsGrothendieckAbelian`, `IsFinitelyPresentable`, `CategoryTheory.isCardinalFiltered_aleph0_iff`, `CategoryTheory.isFiltered_of_isCardinalFiltered`, `CategoryTheory.HasCardinalFilteredColimits`, instance `CategoryTheory.nerveAdjunction.isIso_counit`, `CategoryTheory.LocallySmall`, `CategoryTheory.ShrinkHoms`, `CategoryTheory.ShrinkHoms.equivalence`; Tau Ceti `SSet.IsLocallySmall`.

### 4.2 Left exact localizations and their intersections

**4.2.1.** Prove that if C is prestable with finite limits and D ⊆ C is a full subcategory whose inclusion has a left exact left adjoint L, then D is prestable with finite limits. Prove further that if C is Grothendieck prestable and L is accessible, then D is Grothendieck prestable (SAG, Prop. C.2.3.1, p. 1963). The route: as a localization, D is closed under limits in C, and its colimits are L of colimits in C (Part AdjunctionsAndLocalizations §2.1, HTT, Def. 5.2.7.2). The final object of D is a zero object of C, so D is pointed. The unit D → ΩD ΣD D factors as D → ΩC ΣC D → ΩC LΣC D: the first map is an equivalence by prestability of C and the second by left exactness of L. Condition (c) of prestability for D follows by applying L to the corresponding square in C. In the Grothendieck case D is presentable (Part PresentableInfinityCategories §1.6, HTT, Thm. 5.5.1.1), and the filtered-colimit functor of D is L composed with that of C, hence left exact.

- Call C ∈ C L-acyclic if LC ≃ 0. For L as above, Lα is an equivalence exactly when cofib(α) is L-acyclic (SAG, Rem. C.2.3.2, p. 1963): L(cofib α) ≃ cofib(Lα), and a map in D with zero cofiber is an equivalence by §2.4 (SAG, Cor. C.1.2.5) applied in the prestable D.

  *Needs:* §2.4.1 (SAG, Cor. C.1.2.5, Cor. C.1.2.6); the first assertion of §4.2.1.

**Checks.**

- For L = id the only L-acyclic object is 0, and for L the zero functor onto D = Δ[0] every object is L-acyclic and every morphism is inverted.
- Rationalization inside Mod_ℤ^cn. Let D ⊆ Mod_ℤ^cn be the full subcategory of objects whose homotopy groups are ℚ-vector spaces, and let LX = colim(X → X → X → ⋯) along multiplication by 2, 3, 4, …. Filtered colimits in Mod_ℤ^cn are objectwise (Part PresentableInfinityCategories §7.1, item 4), so L is left exact and accessible, and πₙLX = πₙX ⊗ ℚ. For Y ∈ D every multiplication is an equivalence on Y (§2.4.3 (c)), so Map(LX, Y) ≃ Map(X, Y): L is a left exact left adjoint of the inclusion of D. The discrete object ℤ/p is L-acyclic and ℤ is not. The map ℤ → ℚ has cofiber ℚ/ℤ, which is torsion and hence L-acyclic, and indeed L(ℤ → ℚ) is an equivalence. D is equivalent to Mod_ℚ^cn; the Checks use only D.
- Left exactness of L is needed: τ≤0 : Sp≥0 → (Sp≥0)♥ is a localization with left adjoint τ≤0 that is not left exact (it does not preserve the fiber Hℤ of 0 → ΣHℤ, which it sends to the fiber of 0 → 0), and its target, abelian groups, is not prestable (§4.1, third Check).

*Needs:* for the prestable statement, §2.1.1 (SAG, Def. C.1.2.1); Part AdjunctionsAndLocalizations §2.1.1 (HTT, Def. 5.2.7.2); Part StableInfinityCategories §1.1.2 (HA, Def. 1.1.1.6); Part StableInfinityCategories §1.3.1 (HA, §1.1.2, pp. 23–24).

*Needs:* for the Grothendieck statement, the prestable statement; §4.1.1 (SAG, Prop. C.1.4.1, Def. C.1.4.2); Part AdjunctionsAndLocalizations §2.1.1 (HTT, Def. 5.2.7.2); Part AccessibleInfinityCategories §4.1.1 (HTT, Def. 5.4.2.1); Part PresentableInfinityCategories §1.1.1 (HTT, Def. 5.5.0.1); Part PresentableInfinityCategories §1.6.1 (HTT, Thm. 5.5.1.1); Part PresentableInfinityCategories §6.5.1 (HTT, Def. 7.3.4.2).

**4.2.2.** Prove that left exact localizations are closed under intersections: if X is presentable, filtered colimits in X are left exact, and (Xα) is a small family of presentable full subcategories whose inclusions have left exact left adjoints Lα, then ⋂Xα is presentable and its inclusion has a left exact left adjoint (SAG, Lemma C.4.3.1, p. 1999). The route: index the family by an ordinal β and choose κ so that every Lα preserves κ-filtered colimits. Build a transfinite sequence of endofunctors Fγ of length βκ: F₀ = id, colimits at limit stages, and F at stage γ + 1 equal to Lα ∘ Fγ when γ = βδ + α. Each Fγ is accessible and left exact, because filtered colimits are left exact. The last one is the localization onto ⋂Xα: by induction it does not change maps into ⋂Xα, and it lands in each Xα because it is a κ-filtered colimit of objects of Xα.

*Needs:* Part PresentableInfinityCategories §1.1.1 (HTT, Def. 5.5.0.1); Part AdjunctionsAndLocalizations §2.1.1 (HTT, Def. 5.2.7.2); Part AccessibleInfinityCategories §4.1.1 (HTT, Def. 5.4.2.1); Part PresheavesAndCompletions §4.1.1 (HTT, Def. 5.3.1.7); Part LimitsAndKanExtensions §2.1.1 (HTT, Def. 4.1.1.1); Part PresentableInfinityCategories §6.5.1 (HTT, Def. 7.3.4.2); Part PresentableInfinityCategories §1.6.1 (HTT, Thm. 5.5.1.1); Mathlib instance `Quasicategory ((ihom K).obj C)`.

### 4.3 Localizing subcategories classify left exact localizations

**4.3.1.** Define, for a Grothendieck prestable C, a localizing subcategory as a full subcategory C₀ satisfying three conditions (SAG, Def. C.2.3.3, p. 1965):
- C₀ is accessible and closed under small coproducts;
- for a cofiber sequence C′ → C → C″, if two of the three objects lie in C₀, so does the third;
- for a cofiber sequence C′ → C → C″ with C ∈ C₀ and C″ ∈ C♥, C′ ∈ C₀.

- A localizing subcategory is closed under cofibers, hence, with coproducts, under all small colimits (SAG, Rem. C.2.3.5, p. 1965; Part LimitsAndKanExtensions §6.5, HTT, Prop. 4.4.2.6).
- For Grothendieck prestable C and D, a functor F : C → D preserving small colimits and finite limits, and a localizing D₀ ⊆ D, the inverse image F⁻¹(D₀) is localizing. In particular the kernel {C : FC ≃ 0} is localizing (SAG, Ex. C.2.3.7, p. 1965): accessibility of the inverse image comes from Part AccessibleInfinityCategories §7.1 (HTT, Prop. 5.4.6.6), the two cofiber conditions from exactness of F, and the third from the fact that F preserves discrete objects (Part PresentableInfinityCategories §6.1, HTT, Prop. 5.5.6.16).

**Checks.**

- 0 and C are localizing. In Mod_ℤ^cn the objects with torsion homotopy groups form a localizing subcategory: it is the kernel of the functor L : Mod_ℤ^cn → D of the §4.2 Checks, which preserves colimits and finite limits, so the inverse-image bullet applies.
- In Mod_ℤ^cn the 1-connective objects Σ(Mod_ℤ^cn) are closed under coproducts and cofibers but not localizing. The cofiber sequence ℤ → 0 → Σℤ has its last two terms 1-connective and its first term not, which violates the two-out-of-three condition. A definition requiring only closure under colimits would accept them.
- The third condition is independent of the first two. In Mod_ℤ^cn, the objects on which multiplication by a prime p is invertible form the kernel of X ↦ cofib(p : X → X), which preserves colimits and cofiber sequences, so they satisfy the first two conditions. They fail the third: ℚ → ℚ/ℤ has fiber ℤ in Mod_ℤ^cn, with ℚ in the subcategory and ℚ/ℤ discrete, but p is not invertible on ℤ. The functor X ↦ cofib(p) is not left exact, and by the classification of §4.3.2 this subcategory is not the kernel of any left exact localization.

*Needs:* §3.2.1 (SAG, Notation C.1.2.11); §4.1.2 (SAG, Def. C.1.4.2); Part AccessibleInfinityCategories §4.1.1 (HTT, Def. 5.4.2.1); Part StableInfinityCategories §1.1.2 (HA, Def. 1.1.1.4, Def. 1.1.1.6); Tau Ceti `SSet.coslice.IsColimit`; Part LimitsAndKanExtensions §6.5.4 (HTT, Prop. 4.4.2.6); Part AccessibleInfinityCategories §7.1.4 (HTT, Prop. 5.4.6.6); Part PresentableInfinityCategories §6.1.5 (HTT, Prop. 5.5.6.16).

**4.3.2.** Prove that for a Grothendieck prestable C and a full subcategory C₀, C₀ is localizing if and only if there is an accessible left exact localization L : C → D whose L-acyclic objects are exactly C₀ (SAG, Prop. C.2.3.8, p. 1965; planned declaration `isLocalizing_iff_exists_leftExactLocalization`). The route, backward: D is Grothendieck prestable by §4.2, and C₀ is the kernel of L, so the kernel bullet of §4.3.1 applies. Forward: let S be the class of morphisms whose cofiber lies in C₀. S is strongly saturated (Part PresentableInfinityCategories §4.1, HTT, Def. 5.5.4.5): pushouts preserve cofibers; the full subcategory of Fun(Δ¹, C) on S is closed under colimits since C₀ is; and two-out-of-three follows from the cofiber sequence of a composite. Accessibility of C₀ makes that subcategory accessible (Part AccessibleInfinityCategories §7.1, HTT, Prop. 5.4.6.6), so S is of small generation (Part PresentableInfinityCategories §4.2, HTT, Lemma 5.5.4.14). The S-local objects then form an accessible localization (Part PresentableInfinityCategories §4.4, HTT, Prop. 5.5.4.15) whose acyclics are C₀ (§4.2, SAG, Rem. C.2.3.2). Left exactness is tested on pullback squares (Part PresentableInfinityCategories §4.5, HTT, Prop. 6.2.1.1). For a pullback square in C, the total cofiber of its image in Sp(C) lies in Sp(C)≤0 (§3.1), so the induced map of cofibers has discrete cofiber, and the third condition of the definition in §4.3.1 applies.

*Needs:* §3.1.2 (SAG, Rem. C.1.2.10); §4.1.2 (SAG, Def. C.1.4.2); §4.2.1 (SAG, Prop. C.2.3.1, Rem. C.2.3.2); §4.3.1 (SAG, Def. C.2.3.3, Rem. C.2.3.5, Ex. C.2.3.7); Part AdjunctionsAndLocalizations §2.1.1 (HTT, Def. 5.2.7.2); Part PresentableInfinityCategories §1.2.1 (HTT, Def. 5.5.4.1); Part AccessibleInfinityCategories §7.1.4 (HTT, Prop. 5.4.6.6); Part PresentableInfinityCategories §4.1.1 (HTT, Def. 5.5.4.5), §4.2.1 (HTT, Lemma 5.5.4.14, accessible implies small generation) and §4.4.1 (HTT, Prop. 5.5.4.15); Part PresentableInfinityCategories §4.5.1 (HTT, Prop. 6.2.1.1); Part StableInfinityCategories §7.2.1 (HA, Def. 1.4.2.8) and §3.1.1 (HA, Def. 1.2.1.1); Mathlib instance `Quasicategory ((ihom K).obj C)`.

### 4.4 Quotients and their universal property

**4.4.1.** Define, for a Grothendieck prestable C and a localizing C₀, the quotient C/C₀ as the full subcategory of S-local objects, where S is the class of morphisms with cofiber in C₀. By §4.2 and §4.3, every L as in §4.3 is left adjoint to an equivalence of its target with C/C₀ ⊆ C (SAG, Notation C.2.3.9, p. 1967).

**4.4.2.** Prove that for a Grothendieck prestable D, precomposition with L : C → C/C₀ is a fully faithful functor LFun(C/C₀, D) → LFun(C, D), whose essential image is the colimit-preserving functors that annihilate C₀ (SAG, Prop. C.2.3.10, p. 1967). The route: by the universal property of localization at a class of small generation (Part PresentableInfinityCategories §4.4, HTT, Prop. 5.5.4.20), it suffices to show that a colimit-preserving F inverts S exactly when it kills C₀. One direction is immediate, and the other follows from §2.4 (SAG, Cor. C.1.2.5) applied in D.

- A colimit-preserving F : C/C₀ → D is left exact if and only if F ∘ L is (SAG, Rem. C.2.3.11, p. 1967): F is the restriction of F ∘ L to C/C₀, and L is left exact (§4.3).

**Checks.**

- For C₀ = 0 the quotient is C, and for C₀ = C it is Δ[0].
- For C = Mod_ℤ^cn and C₀ the objects with torsion homotopy groups, the quotient is the subcategory D of the §4.2 Checks. Indeed, an object Y is S-local exactly when its homotopy groups are rational vector spaces: multiplication by p on any X has cofiber with p-torsion homotopy, so it is in S and must be inverted on Y; conversely, for Y ∈ D and f ∈ S, Map(cofib f, Y) ≃ Map(L cofib f, Y) is contractible. The functors out of the quotient are those that kill ℤ/p for every prime p.
- The essential image is a proper subcategory in general. With C = D = Mod_ℤ^cn and C₀ the objects with torsion homotopy groups, the identity of C does not kill ℤ/p, so it is not in the image. The functor L of the §4.2 Checks, followed by the inclusion of D, kills C₀, and it is in the image.

*Needs:* §2.4.1 (SAG, Cor. C.1.2.5); §4.2.1 (SAG, Rem. C.2.3.2); §4.3.1 (SAG, Def. C.2.3.3, Ex. C.2.3.7, Prop. C.2.3.8); Part AdjunctionsAndLocalizations §1.1.1 (adjunctions, Kerodon, Def. 6.2.1.1), §1.1.3 (HTT, Def. 5.2.2.1); Part PresentableInfinityCategories §1.2.1 (HTT, Def. 5.5.4.1); Part StableInfinityCategories §1.1.2 (HA, Def. 1.1.1.6); Tau Ceti `SSet.IsFullyFaithful`; Part PresentableInfinityCategories §4.4.2 (HTT, Prop. 5.5.4.20); Mathlib instance `Quasicategory ((ihom K).obj C)`.

### 4.5 Localizing subcategories generated by heart data

The heart `Sp(C)♥ ≃ C♥` of a Grothendieck prestable C is a Grothendieck abelian category in Mathlib's sense `IsGrothendieckAbelian` (§4.1).

**4.5.1.** Prove the following, for C Grothendieck prestable, A₀ a localizing subcategory (§1.2) of the heart `Sp(C)♥ ≃ C♥` and `E ⊆ Sp(C)` the full subcategory of objects X with `Extⁿ(A, X) = 0` for all A in A₀ and all n (SAG, Prop. C.5.2.8 (a)–(e), p. 2014):
- E is presentable and its inclusion has a left adjoint L;
- there is a unique t-structure on E with E≤0 = Sp(C)≤0 ∩ E;
- L is t-exact;
- this t-structure is right complete and compatible with filtered colimits;
- E≥0 is Grothendieck prestable.

The route: E is the S-local objects for the maps 0 → ΣⁿAα with (Aα) a small generating family of A₀, so the first assertion is Part PresentableInfinityCategories §4.4 (HTT, Prop. 5.5.4.15). The t-structure is generated by the images LΣ∞Cβ of generators (Part StableInfinityCategories §11.1, HA, Prop. 1.4.4.11), and its coconnective part is computed by mapping spaces. For t-exactness, compare the kernel of L with the objects whose homotopy groups lie in A₀ using right completeness of Sp(C) (§3.1). Factor the map from the acyclic part through an object of Sp(C)≤0 to see that LX ∈ Sp(C)≤0 when X is. Compatibility with filtered colimits then follows from t-exactness, and right completeness from the dual of Part StableInfinityCategories §8.1 (HA, Prop. 1.2.1.19, Rem. 1.2.1.20). The fifth assertion is §4.1.

*Needs:* §1.2.1 (SAG, Def. C.5.1.2); §3.1.2 (SAG, Rem. C.1.2.10); §3.2.1 (SAG, Notation C.1.2.11); §4.1.1 (SAG, Prop. C.1.4.1); Part PresentableInfinityCategories §4.4.1 (HTT, Prop. 5.5.4.15); Part StableInfinityCategories §3.1.1 (HA, Def. 1.2.1.1), §3.1.2 (HA, Def. 1.2.1.4), §8.1.4 (HA, Prop. 1.2.1.19), §8.1.5 (its dual, HA, Rem. 1.2.1.20), §7.2.1 (HA, Def. 1.4.2.8), §11.1.1 (HA, Prop. 1.4.4.11) and §11.2.1 (HA, Def. 1.4.4.12); Part StableInfinityCategories §3.5.1 (HA, Def. 1.3.3.1) and §11.5.1 (HA, Def. 1.3.5.20); Mathlib `IsGrothendieckAbelian` (HA, Def. 1.3.5.1).

**4.5.2.** Prove that, for C Grothendieck prestable, A₀ a localizing subcategory (§1.2) of the heart `Sp(C)♥ ≃ C♥` and `E ⊆ Sp(C)` the full subcategory of objects X with `Extⁿ(A, X) = 0` for all A in A₀ and all n, the objects C₀ ⊆ C killed by C ≃ Sp(C)≥0 → E≥0 form a localizing subcategory with C₀♥ = A₀, and that C₀ is the smallest localizing subcategory of C containing A₀ (SAG, Prop. C.5.2.8 (f)–(g), pp. 2015–2016). The route is Lurie's. The restriction L≥0 of the t-exact L is left adjoint to a fully faithful composite E≥0 → Sp(C)≥0, so the kernel is localizing by §4.3. The heart computation follows from the comparison of the kernel of L with the objects whose homotopy groups lie in A₀, made in the proof of t-exactness. For minimality, a localizing C′ containing A₀ gives a fully faithful Sp(C/C′) → Sp(C) whose left adjoint annihilates A₀, so its image lies in E.

*Needs:* §4.5.1 (SAG, Prop. C.5.2.8 (a)–(e)); §4.3.1 (SAG, Def. C.2.3.3, Prop. C.2.3.8); §4.4.1 (SAG, Notation C.2.3.9); §3.2.1 (SAG, Notation C.1.2.11); §1.2.1 (SAG, Def. C.5.1.2).

### 4.6 Sifted colimits of connective spectra

Sp≥0 is the basic Grothendieck prestable ∞-category (§4.1, first Check), the connective part of the t-structure on Sp (Part StableInfinityCategories §11.3). This section records how its colimits relate to colimits of spaces.

**4.6.1.** Prove that Ω∞ : Sp≥0 → S preserves sifted colimits (HA, Prop. 1.4.3.9, p. 153). The route is Lurie's. Sifted simplicial sets are weakly contractible (HTT, Prop. 5.5.8.7), so the forgetful functor S∗ → S preserves sifted colimits (HTT, Prop. 4.4.2.9), and it suffices to treat the pointed lift Sp≥0 → S∗. Write S≥n for the n-connective spaces and S∗≥n for their pointed objects. Then Sp≥0 is the limit of the tower ⋯ → S∗≥1 → S∗≥0 of loop functors (Part StableInfinityCategories §7.5, with the levelwise description of Sp≥0 in Part StableInfinityCategories §11.3), so it suffices that each Ω : S∗≥n+1 → S∗≥n preserves sifted colimits. Indeed, the tower consists of presentable ∞-categories and right adjoints, so it is classified by a presentable fibration over N(ℤ≥0)^op, and its limit is the ∞-category of Cartesian sections (Part Straightening §3.2, HTT, Prop. 3.3.3.1; Part PresentableInfinityCategories §5.1, HTT, Prop. 5.5.3.3). Colimits of sections are computed by the evaluations (Part PresentableInfinityCategories §5.2, HTT, Prop. 5.5.3.17). An objectwise colimit of Cartesian sections is again Cartesian when each transport functor Ω preserves it, so sifted colimits in Sp≥0 are computed levelwise once every Ω preserves them. First, S≥n is closed under sifted colimits in S: it is the inverse image under τ≤n−1 of the final objects, which are closed under sifted colimits because sifted simplicial sets are weakly contractible, and τ≤n−1 is a left adjoint (HTT, Prop. 5.5.6.18). Next, delooping identifies S∗≥n+1 with the group objects of S∗≥n, and Ω with evaluation at [1] (Part InfinityTopoi §13.4–§13.6); evaluation preserves colimits (HTT, Prop. 5.1.2.2). Since S∗≥n is closed under sifted colimits in S∗, it suffices that group objects of S∗, equivalently of S (Part InfinityTopoi §13.2), are closed under sifted colimits among simplicial objects. Group objects are characterized by finite-product conditions (HTT, Prop. 7.2.2.4), and sifted colimits in S commute with finite products (HTT, Lemma 5.5.8.11).

*Needs:* Part StableInfinityCategories §1.3.1 (HA, §1.1.2, pp. 23–24), §7.5.2 (HA, Prop. 1.4.2.24, Rem. 1.4.2.25), §7.6.1 (HA, Def. 1.4.3.1) and §11.3.2 (HA, Prop. 1.4.3.6); Part InfinityTopoi §13.2.2 (HTT, Lemma 7.2.2.10, for C = S), §13.4.1 (Čech nerves of base points, the construction in the proof of HTT, Lemma 7.2.2.11), §13.5.1 (HTT, Lemma 7.2.2.11 (1) at 𝒳 = S), §13.6.2 (HTT, Lemma 7.2.2.11 (2) at 𝒳 = S) and §13.6.3 (the connectivity of group objects); Part LimitsAndKanExtensions §9.3.2 (HTT, Def. 7.2.2.1, pointed objects and group objects; Prop. 7.2.2.4); Part LimitsAndKanExtensions §8.2.2 (HTT, Prop. 5.1.2.2); Part PresentableInfinityCategories §6.2.1 (HTT, Prop. 5.5.6.18) and Part PresheavesAndCompletions §5.3.4 (HTT, Prop. 5.5.8.7), §5.3.5 (HTT, Lemma 5.5.8.11), §5.3.6; Part LimitsAndKanExtensions §7.3.5 (HTT, Prop. 4.4.2.9); Part PresheavesAndCompletions §5.1.1 (HTT, Def. 5.5.8.1); Part InfinityTopoi §12.1.2 (HTT, Def. 6.5.1.10); Part Straightening §3.2.1 (HTT, Prop. 3.3.3.1); Part PresentableInfinityCategories §5.1.3 (HTT, Prop. 5.5.3.3) and §5.2.5 (HTT, Prop. 5.5.3.17), for colimits in the limit of the tower.

### Examples

- Rationalization of connective spectra, X ↦ colim(X → X → ⋯) along multiplication by 2, 3, 4, …, is a left exact localization of Sp≥0 onto the connective spectra with rational homotopy groups, as in the §4.2 Checks: filtered colimits of spectra are left exact and commute with homotopy groups. Its acyclic objects are the connective spectra with torsion homotopy groups, so rational connective spectra are the quotient of Sp≥0 by that localizing subcategory (§4.3, §4.4).
- In Mod_ℤ^cn the objects with torsion homotopy groups form a localizing subcategory, the kernel of rationalization, and the quotient is the subcategory D of objects with rational homotopy groups, equivalent to Mod_ℚ^cn (Checks of §4.2, §4.3 and §4.4). Its heart is the localizing subcategory of torsion abelian groups (Layer 1 Examples).

### Dependencies

Layers 1–3; Part LimitsAndKanExtensions (§2.1, §7.1); Part AdjunctionsAndLocalizations (§1.1, §2.1); Part PresheavesAndCompletions (§4.1); Part AccessibleInfinityCategories (§4.1); Part PresentableInfinityCategories (§1.1, §1.2); Part InfinityTopoi (§12.1); Part AccessibleInfinityCategories (§7.1) and Part PresentableInfinityCategories (§1.6, §4.1–§4.5, §6.1, §6.2, §6.5: strongly saturated classes, localization, left exactness tests, truncation, left exact filtered colimits); Part StableInfinityCategories (§3.1, §3.5 t-structures and t-exact functors, §7.2, §7.5, §7.6 spectra, §8.1 completeness, §11.1–§11.3 generated t-structures and the t-structure on Sp, §11.5 compatibility with filtered colimits); for §4.6, Parts LimitsAndKanExtensions (§6.5, §7.3, §8.2, §9.3), PresheavesAndCompletions (§5.3), Straightening (§3.2), PresentableInfinityCategories (§5.1, §5.2) and InfinityTopoi (§13.2, §13.4–§13.6, delooping in S).

## Layer 5: The ∞-category `Groth∞`: stabilization, filtered colimits, separation and completion

### 5.1 `Groth∞`, `Groth∞^lex` and stabilization

**5.1.1.** Define `Groth∞` as the full subcategory of `Pr^L` on the Grothendieck prestable ∞-categories (SAG, Def. C.3.0.5, p. 1976). Here `Pr^L` is the subcategory of the large ∞-category of ∞-categories with presentable objects and colimit-preserving functors (Part PresentableInfinityCategories §5.1, HTT, Def. 5.5.3.1). Define `Groth∞^lex` as the subcategory of the large ∞-category of ∞-categories with the same objects and with morphisms the functors that preserve small colimits and finite limits (SAG, Notation C.3.2.3, p. 1980).

- `Groth∞^lex` ⊆ `Groth∞` ⊆ `Pr^L`, the first a non-full subcategory with mapping spaces LFun^lex ⊆ LFun.
- Δ[0] is a zero object of `Groth∞`.

**Checks.**

- Σ : Sp≥0 → Sp≥0 is a morphism of `Groth∞` but not of `Groth∞^lex` (Conventions witness).
- The rationalization L : Mod_ℤ^cn → D of the §4.2 Checks is a morphism of `Groth∞^lex`: it preserves colimits and finite limits, and D is Grothendieck prestable by §4.2.
- Sp is an object of `Groth∞` (§4.1, first Check). The inclusion Sp≥0 → Sp preserves colimits but not the fiber of 0 → Hℤ, which is 0 in Sp≥0 and Σ⁻¹Hℤ in Sp. So it is a morphism of `Groth∞` but not of `Groth∞^lex`. Its right adjoint, the connective cover Ω∞ : Sp → Sp≥0, is not a morphism of either: it sends the cofiber sequence Σ⁻¹Hℤ → 0 → Hℤ to 0 → 0 → Hℤ, which is not a cofiber sequence.

*Needs:* §4.1.2 (SAG, Def. C.1.4.2); Part PresentableInfinityCategories §5.1.1 (HTT, Def. 5.5.3.1); Tau Ceti `SSet.catInfty` and its large variant; Part InfinityCategoryFoundations §1.1 (HTT, §1.2.15, size conventions).

**5.1.2.** Prove that stabilization is fully faithful on `Groth∞`: for Grothendieck prestable C and D, the map LFun(C, D) → LFun(Sp(C), Sp(D)) is fully faithful, with essential image the colimit-preserving functors that are right t-exact for the t-structures of §3.1 (SAG, Prop. C.3.1.1, p. 1976). The route: Sp(C) is the colimit of C → C → ⋯ along Σ in `Pr^L`. A colimit in `Pr^L` is the limit of the right adjoints (Part PresentableInfinityCategories §5.1 and §5.2, HTT, Cor. 5.5.3.4 and Thm. 5.5.3.18), here the tower along Ω, which is Sp(C) (Part StableInfinityCategories §7.5, HA, Prop. 1.4.2.24). So LFun(Sp(C), Sp(D)) is the limit of the tower LFun(C, Sp(D)) along precomposition with Σ. These maps are postcomposition with Σ on Sp(D), hence equivalences, so the comparison is composition with Σ∞ : D → Sp(D). That is fully faithful with image the functors landing in Sp(D)≥0 (§3.1).

*Needs:* §3.1.2 (SAG, Rem. C.1.2.10); §4.1.2 (SAG, Def. C.1.4.2); Part PresentableInfinityCategories §5.1.1 (HTT, Def. 5.5.3.1), §5.1.4 (HTT, Cor. 5.5.3.4) and §5.2.6 (HTT, Thm. 5.5.3.18); Part StableInfinityCategories §7.2.1 (HA, Def. 1.4.2.8), §7.5.2 (HA, Prop. 1.4.2.24) and §3.1.2 (HA, Def. 1.2.1.4); Part StableInfinityCategories §1.3.1 (HA, §1.1.2, pp. 23–24); Part StableInfinityCategories §3.5.1 (HA, Def. 1.3.3.1).

### 5.2 Sections of bicartesian fibrations

**5.2.1.** Prove that if S is a small simplicial set and p : C → S is both a Cartesian and a coCartesian fibration whose fibers are Grothendieck prestable, then the ∞-category of sections Fun_S(S, C) is Grothendieck prestable (SAG, Prop. C.3.3.2, p. 1982). The route: presentability of the sections and the fact that the evaluations e_s preserve limits and colimits and are jointly conservative come from Part PresentableInfinityCategories §5.2 (HTT, Prop. 5.5.3.17) and Part LimitsAndKanExtensions §8.2 (HTT, Prop. 5.1.2.2). Pointedness, full faithfulness of Σ, condition (c) of prestability and commutation of Ω with filtered colimits are each checked after applying every e_s, using §4.1.

*Needs:* §4.1.1 (SAG, Prop. C.1.4.1, Def. C.1.4.2); §2.1.1 (SAG, Def. C.1.2.1); Part CartesianFibrations §1.1.1 (HTT, Def. 2.4.2.1, second sentence, coCartesian fibrations); Tau Ceti `SSet.CartesianFibration`; Part PresentableInfinityCategories §5.2.5 (HTT, Prop. 5.5.3.17); Part LimitsAndKanExtensions §8.2.2 (HTT, Prop. 5.1.2.2); Part StableInfinityCategories §1.3.1 (HA, §1.1.2, pp. 23–24).

**5.2.2.** Prove that for a small filtered poset A and p : C → N(A) as above, the full subcategory of Cartesian sections E^cart ⊆ E = Fun over N(A) has a left exact left adjoint (SAG, Prop. C.3.3.3, p. 1983). The route: for each cofinal subset B ⊆ A, let E^B be the sections that are p-right Kan extensions of their restriction to N(B). E^B is an accessible left exact localization of E. Restriction to N(B) is a trivial Kan fibration on E^B (Part LimitsAndKanExtensions §7.4, HTT, Prop. 4.3.2.15), so E^B is equivalent to the sections over N(B), which are Grothendieck prestable by §5.2.1, and restriction is left exact (HTT, Prop. 5.1.2.2). E^cart is the intersection of the E^B (Part LimitsAndKanExtensions §7.3, HTT, Prop. 4.3.1.9, Prop. 4.3.1.10; Part LimitsAndKanExtensions §3.5, HTT, Cor. 4.4.4.10, with filtered posets weakly contractible). Then the intersection lemma §4.2.2 applies, since filtered colimits in E are left exact. This is the argument of HTT, Prop. 6.3.3.3, with SAG Lemma C.4.3.1 in place of HTT Lemma 6.3.3.4.

*Needs:* §4.2.2 (SAG, Lemma C.4.3.1); §5.2.1 (SAG, Prop. C.3.3.2); Tau Ceti `SSet.Edge.IsCartesian`; Part LimitsAndKanExtensions §7.1.1 (HTT, Def. 4.3.1.1), §7.1.2 (HTT, Def. 4.3.2.2); Part AdjunctionsAndLocalizations §2.1.1 (HTT, Def. 5.2.7.2); Part LimitsAndKanExtensions §7.3.1 (HTT, Prop. 4.3.1.9, Prop. 4.3.1.10), §7.4.6 (HTT, Prop. 4.3.2.15) and §3.5.2 (HTT, Cor. 4.4.4.10); Part LimitsAndKanExtensions §8.2.2 (HTT, Prop. 5.1.2.2); Mathlib `SSet.modelCategoryQuillen.I`.

### 5.3 Filtered colimits of Grothendieck prestable ∞-categories

**5.3.1.** Prove that `Groth∞` ⊆ `Pr^L` is closed under small filtered colimits. So `Groth∞` has filtered colimits, preserved by the inclusion (SAG, Thm. C.3.3.1, p. 1982). The route: reduce to diagrams indexed by N(A) for a filtered poset A (Part PresheavesAndCompletions §4.4, HTT, Prop. 5.3.1.18). Classify the diagram by a presentable fibration p (Part PresentableInfinityCategories §5.1, HTT, Prop. 5.5.3.3). Identify its colimit in `Pr^L` with the Cartesian sections E^cart (Part PresentableInfinityCategories §5.2, HTT, Thm. 5.5.3.18 and Prop. 5.5.3.17(2)). That is a localization of the Grothendieck prestable E (§5.2) with left exact left adjoint (§5.2), accessible by Part AccessibleInfinityCategories §5.4 (HTT, Prop. 5.4.7.7), so §4.3 applies.

*Needs:* §4.2.1 (SAG, Prop. C.2.3.1); §5.1.1 (SAG, Def. C.3.0.5); §5.2.1 (SAG, Prop. C.3.3.2, Prop. C.3.3.3); Part PresheavesAndCompletions §4.4.1 (HTT, Prop. 5.3.1.18); Part PresentableInfinityCategories §5.1.2 (HTT, Def. 5.5.3.2), §5.1.3 (HTT, Prop. 5.5.3.3), §5.2.5 (HTT, Prop. 5.5.3.17) and §5.2.6 (HTT, Thm. 5.5.3.18); Part AccessibleInfinityCategories §5.4.1 (HTT, Prop. 5.4.7.7).

**5.3.2.** Prove that `Groth∞^lex` admits small filtered colimits, and that they are preserved by the inclusions `Groth∞^lex` ⊆ `Groth∞` ⊆ `Pr^L` (SAG, Prop. C.3.3.5, p. 1985). The route: for a small filtered diagram (Cα) in `Groth∞^lex` with colimit C formed in `Groth∞`, each structure map fα : Cα → C is left exact (SAG, Lemma C.3.3.4, p. 1984). For that, reduce as above to A with least element α: the structure map is the p-left Kan extension from {α} followed by the left exact localization of §5.2, and the evaluations of the Kan extension are the transition functors, which are left exact by hypothesis. It remains that a morphism h : C → D of `Groth∞` out of the colimit is left exact exactly when every h ∘ fα is. The forward direction is the Lemma. Backward: with gα right adjoint to fα, the identity of C is the filtered colimit of fα ∘ gα (Part PresentableInfinityCategories §5.2, HTT, Lemma 6.3.3.7). Each h ∘ fα ∘ gα is left exact, since right adjoints are left exact (Part AdjunctionsAndLocalizations §1.5, HTT, Prop. 5.2.3.5). Filtered colimits in the Grothendieck prestable D are left exact (§4.1), so h is left exact.

*Needs:* §4.1.1 (SAG, Prop. C.1.4.1); §5.1.1 (SAG, Notation C.3.2.3); §5.2.2 (SAG, Prop. C.3.3.3); §5.3.1 (SAG, Thm. C.3.3.1); Part LimitsAndKanExtensions §7.1.2 (HTT, Def. 4.3.2.2); Part PresentableInfinityCategories §5.2.7 (HTT, Lemma 6.3.3.7); Part AdjunctionsAndLocalizations §1.5.1 (HTT, Prop. 5.2.3.5); Part LimitsAndKanExtensions §8.2.2 (HTT, Prop. 5.1.2.2); Part PresheavesAndCompletions §4.4.1 (HTT, Prop. 5.3.1.18); Part PresentableInfinityCategories §5.1.1 (HTT, Def. 5.5.3.1), §5.1.3 (HTT, Prop. 5.5.3.3) and §5.2.6 (HTT, Thm. 5.5.3.18).

### 5.4 Separated quotients and completions

**5.4.1.** For a Grothendieck prestable C, let C^sep be the objects C with Map(D, C) contractible for every ∞-connective D (§3.3). Prove that (SAG, Prop. C.3.6.1, p. 1990):
- the inclusion C^sep ⊆ C has a left exact left adjoint L;
- C^sep is a separated Grothendieck prestable ∞-category;
- for every separated Grothendieck prestable D, precomposition with L is an equivalence LFun(C^sep, D) → LFun(C, D).

The route: write C = E≥0 with E presentable stable and its t-structure compatible with filtered colimits (§4.1). The ∞-connective objects are E≥∞ = ⋂ E≥n, which is presentable and closed under colimits and extensions, so it is the connective part of an accessible t-structure (E≥∞, E′) (Part StableInfinityCategories §11.1, HA, Prop. 1.4.4.11). E′ is stable, contains E≤0, and C^sep = E≥0 ∩ E′. So (C^sep, E≤0) is a t-structure on E′ compatible with filtered colimits, and C^sep is Grothendieck and separated. The localization E → E′ is the identity on E≤0 and preserves E≥0, hence restricts to a left exact L. For the universal property, a colimit-preserving F : C → D factors through C^sep exactly when its right adjoint lands in C^sep. That holds automatically when D is separated, since F carries ∞-connective objects to ∞-connective ones (§3.3).

**Checks.**

- If C is separated (Sp≥0), then C^sep = C and L = id.
- For C = Sp every object is ∞-connective (§3.3), so C^sep = Δ[0] and L is the zero functor. Requiring Map(D, C) to be contractible only for D in the heart would instead give all of Sp, since the heart is 0.
- The universal property needs D separated: for D = C non-separated, id_C does not factor through C^sep, because an ∞-connective nonzero X would map to LX = 0.

*Needs:* §3.3.1 (SAG, Def. C.1.2.12); §4.1.1 (SAG, Prop. C.1.4.1, Def. C.1.4.2); Part StableInfinityCategories §11.1.1 (HA, Prop. 1.4.4.11), §11.2.1 (HA, Def. 1.4.4.12) and §3.1.2 (HA, Def. 1.2.1.4); Part StableInfinityCategories §1.3.1 (HA, §1.1.2, pp. 23–24); Part StableInfinityCategories §3.5.1 (HA, Def. 1.3.3.1) and §11.5.1 (HA, Def. 1.3.5.20); Part AccessibleInfinityCategories §4.1.1 (HTT, Def. 5.4.2.1); Part PresentableInfinityCategories §1.1.1 (HTT, Def. 5.5.0.1); Part AdjunctionsAndLocalizations §1.1.1 (adjunctions, Kerodon, Def. 6.2.1.1), §1.1.3 (HTT, Def. 5.2.2.1).

**5.4.2.** For a Grothendieck prestable C, let Ĉ be the limit of the tower ⋯ → τ≤2 C → τ≤1 C → τ≤0 C. Prove that (SAG, Prop. C.3.6.3, p. 1991; planned declaration `isComplete_postnikovLimit`):
- the map f : C → Ĉ preserves small colimits and finite limits;
- Ĉ is a complete Grothendieck prestable ∞-category;
- for every complete Grothendieck prestable D, precomposition with f is an equivalence LFun(Ĉ, D) → LFun(C, D).

Call Ĉ the completion of C. The route: write C = E≥0 as in §4.1 and let Ê be the left completion of E (Part StableInfinityCategories §8.1, HA, Prop. 1.2.1.17). Ê is stable with a t-structure and a t-exact E → Ê inducing equivalences on every E≤n. The t-structure on Ê is compatible with filtered colimits because each truncation in the tower commutes with filtered colimits. Ĉ = Ê≥0, which gives the first two assertions. For the third, write D as the limit in `Pr^L` of its truncations. Passing to right adjoints reduces to showing that the right adjoint of f restricts to an equivalence τ≤n Ĉ → τ≤n C, which holds because f is left exact (Part PresentableInfinityCategories §6.1, HTT, Prop. 5.5.6.16) and an equivalence on n-truncated objects.

**Checks.**

- If C is complete (Sp≥0), then Ĉ = C.
- For C = Sp every τ≤n Sp is 0, so Ĉ = Δ[0]. f induces equivalences τ≤n C ≃ τ≤n Ĉ, which here are equivalences of zero categories. Defining Ĉ as Sp(C)≥0 instead would return Sp itself, which is not complete.
- Complete implies separated (§3.3), so Ĉ is separated, and by the separated quotient's universal property f factors through C^sep.

*Needs:* §3.3.1 (SAG, Def. C.1.2.12); §4.1.1 (SAG, Prop. C.1.4.1, Def. C.1.4.2); Part StableInfinityCategories §8.1.1, §8.1.2, §8.1.3 (HA, Prop. 1.2.1.17, the left completion and left completeness defined with it) and §3.1.2 (HA, Def. 1.2.1.4); Part StableInfinityCategories §11.5.1 (HA, Def. 1.3.5.20); Part PresentableInfinityCategories §5.1.1 (HTT, Def. 5.5.3.1) and §6.1.5 (HTT, Prop. 5.5.6.16); Part InfinityCategoryFoundations §10.1.3 (HTT, Def. 5.5.6.1); Part PresentableInfinityCategories §1.1.1 (HTT, Def. 5.5.0.1).

### Examples

- Sp≥0 is separated and complete (Layer 3 Examples), so both reflections of §5.4 fix it.

### Dependencies

Layer 4; Tau Ceti Cartesian fibrations and `SSet.catInfty`; Part CartesianFibrations (§1.1 coCartesian fibrations); Part LimitsAndKanExtensions (§7.1 relative Kan extensions); Parts LimitsAndKanExtensions (§3.5, §7.3, §7.4, §8.2), AdjunctionsAndLocalizations (§1.5), PresheavesAndCompletions (§4.4), AccessibleInfinityCategories (§5.4) and PresentableInfinityCategories (§5.1, §5.2 presentable fibrations, `Pr^L` and PrR; §6.1 truncation); Part StableInfinityCategories (§3.1, §3.5, §7.2, §7.5, §8.1 left completion, §11.1, §11.2 generated t-structures, §11.5).

## Layer 6: Compact generation and Ind-completions

### 6.1 Compactly generated prestable ∞-categories

**6.1.1.** Prove that in a compactly generated prestable C, an object C is compact if and only if Σ∞C is compact in Sp(C) (SAG, Lemma C.6.1.3, p. 2062). The route: Σ∞ is fully faithful (§3.1) and preserves filtered colimits, which gives one direction. Ω∞ preserves filtered colimits by the bullet below and §4.1, which gives the other.

- Every compactly generated prestable ∞-category C is Grothendieck prestable (SAG, Rem. C.6.1.2, p. 2062): C ≃ Ind(C^ω) sits inside presheaves on C^ω closed under filtered colimits (Part PresheavesAndCompletions §6.4, HTT, Prop. 5.3.5.3) and finite limits. Filtered colimits of spaces are left exact (Part PresheavesAndCompletions §6.2, HTT, Prop. 5.3.3.3; Part PresentableInfinityCategories §6.5, HTT, Ex. 7.3.4.4), so filtered colimits in C are left exact (Part PresentableInfinityCategories §6.5, HTT, Def. 7.3.4.2).

*Needs:* §3.1.2 (SAG, Rem. C.1.2.10); §4.1.1 (SAG, Prop. C.1.4.1, Def. C.1.4.2); §2.1.1 (SAG, Def. C.1.2.1); Part PresheavesAndCompletions §6.1.1 (HTT, Def. 5.3.4.5; Def. 5.3.5.1); Part PresentableInfinityCategories §1.1.1 (HTT, Def. 5.5.7.1); Part PresheavesAndCompletions §6.2.2 (HTT, Prop. 5.3.3.3) and §6.4.1 (HTT, Prop. 5.3.5.3); Part PresentableInfinityCategories §6.5.1 (HTT, Def. 7.3.4.2), §6.5.2 (HTT, Ex. 7.3.4.4); Part StableInfinityCategories §7.2.1 (HA, Def. 1.4.2.8).

**6.1.2.** Prove that a small idempotent-complete ∞-category C with finite colimits is prestable if and only if Ind(C) is prestable (SAG, Prop. C.6.1.1, p. 2062). The route, backward: C is the compact objects of Ind(C) (Part AccessibleInfinityCategories §4.4, HTT, Lemma 5.4.2.4). The Yoneda embedding preserves finite colimits (Part PresheavesAndCompletions §6.4, HTT, Prop. 5.3.5.14), so Σ on C is fully faithful. Condition (c) reduces to showing that a fiber of a map between compact objects of the form X″ → ΣX′ is compact, which is §6.1.1 in the stable Sp(Ind C). Forward: embed C into an idempotent-complete stable D with extension-closed, finite-colimit-closed image (§2.3). Ind(D) is stable (Part StableInfinityCategories §6.1, HA, Prop. 1.1.3.6), and Ind of the embedding is fully faithful and colimit-preserving. Closure of its image under extensions is shown by writing an extension as a filtered colimit of extensions of compact objects, each of which lies in the image because the image of C is extension-closed in D.

*Needs:* §2.3.2 (SAG, Cor. C.1.2.3); §6.1.1 (SAG, Lemma C.6.1.3); §2.1.1 (SAG, Def. C.1.2.1); Part PresheavesAndCompletions §1.1.1 (HTT, §5.1.3, Yoneda), §2.1.2 (HTT, §4.4.5, idempotent completeness) and §6.1.1 (HTT, Def. 5.3.4.5; Def. 5.3.5.1); Part PresheavesAndCompletions §2.2.1 (HTT, Def. 4.4.5.4); Part AccessibleInfinityCategories §4.4.1 (HTT, Lemma 5.4.2.4); Part PresheavesAndCompletions §6.4.4 (HTT, Prop. 5.3.5.14); Part StableInfinityCategories §6.1.1 (HA, Prop. 1.1.3.6) and §3.4.2 (HA, Def. 1.2.1.15).

### 6.2 Ind of a small stable ∞-category with a t-structure

**6.2.1.** Prove that for a small stable C with a t-structure, Ind(C) carries a t-structure whose connective part is the image of Ind(C≥0) and whose coconnective part is the image of Ind(C≤0). If the t-structure on C is right bounded, the one on Ind(C) is right complete (SAG, Lemma C.2.4.3, p. 1968). The route: the t-structure axioms are inherited levelwise along filtered colimits (Part PresheavesAndCompletions §6.5, HTT, Prop. 5.3.5.11 for the full faithfulness of Ind(C≥0) → Ind(C)). For right completeness, Ind(C)≤0 is closed under filtered colimits, hence under countable coproducts, so by the dual of Part StableInfinityCategories §8.1 (HA, Prop. 1.2.1.19, Rem. 1.2.1.20) it suffices that ⋂ Ind(C)≤−n is zero. An object there has contractible maps from every j(Y), and these generate under filtered colimits, so it is final.

- When the t-structure on C is right bounded, Ind(C) ≃ Sp(Ind(C≥0)), with Ind(C)≥0 corresponding to Σ∞ of Ind(C≥0), and Ind(C≥0) is prestable with finite limits. Ind(C≥0) is the connective part of a t-structure, hence prestable with finite limits (§3.1, SAG, Ex. C.1.2.8). A right complete t-structure on a stable D identifies D with lim D≥−n along τ≥−n, which is Sp(D≥0) (§3.1, SAG, Rem. C.1.2.10, third bullet).

  *Needs:* the statement above; §3.1.1 (SAG, Ex. C.1.2.8, Prop. C.1.2.9, Rem. C.1.2.10).

*Needs:* Part StableInfinityCategories §1.1.3 (HA, Def. 1.1.1.9); Part PresheavesAndCompletions §1.1.1 (HTT, §5.1.3 Yoneda) and §6.1.2 (HTT, Def. 5.3.5.1); Part PresheavesAndCompletions §6.5.4 (HTT, Prop. 5.3.5.11); Part StableInfinityCategories §3.1.2 (HA, Def. 1.2.1.4), §8.1.1 (HA, the boundedness definitions before Prop. 1.2.1.17), §8.1.4 (HA, Prop. 1.2.1.19) and §8.1.5 (its dual, HA, Rem. 1.2.1.20).

### Examples

- Sp≥0 = Ind(finite connective spectra) and Mod_R^cn for a commutative ring R, which is P_Σ of a small ∞-category (Part PresentableInfinityCategories §7.1) and prestable by §2.4, are compactly generated, hence Grothendieck (§6.1).
- Let Sp^fb ⊆ Sp be the full subcategory of spectra with finitely many nonzero homotopy groups, all finitely generated. It is an essentially small stable subcategory, closed under the truncations of Sp: finitely generated abelian groups are the Noetherian objects of abelian groups (§1.3), a Serre class (§1.1), so the long exact sequences keep fibers and cofibers in Sp^fb. It therefore inherits a bounded t-structure, and §6.2 makes Ind(Sp^fb) a stable ∞-category with a right complete t-structure whose connective part Ind(Sp^fb_≥0) is prestable (§3.1) and, being compactly generated, Grothendieck (§6.1).

### Dependencies

Layers 2–4; §2.1; Part LimitsAndKanExtensions (§8.1); Part PresheavesAndCompletions (§2.1, §4.1, §5.1, §6.1); Part AccessibleInfinityCategories (§4.1); Part PresentableInfinityCategories (§1.1); Part StableInfinityCategories (§1.1); Parts PresheavesAndCompletions (§2.2, §6.2, §6.4, §6.5), AccessibleInfinityCategories (§4.4) and PresentableInfinityCategories (§6.5 left exact filtered colimits, §7.1 P_Σ in the Examples); Part StableInfinityCategories (§3.1, §3.4, §6.1 Ind of stable, §7.2, §8.1 right completeness).

## Layer 7: Amplitude, anticompleteness and the completion equivalence

### 7.1 Left exactness and amplitude

**7.1.1.** Prove that for Grothendieck prestable C and D, a colimit-preserving f : C → D and n ≥ 0, f carries discrete objects to n-truncated objects if and only if it carries k-truncated objects to (n + k)-truncated objects for every k (SAG, Prop. C.5.5.1, p. 2028). The route: a k-truncated object is a finite iterated extension of the Σⁱπᵢ, 0 ≤ i ≤ k (§3.1, §3.2), and f preserves the cofiber sequences.

*Needs:* §3.1.2 (SAG, Prop. C.1.2.9); §3.2.1 (SAG, Notation C.1.2.11); §4.1.2 (SAG, Def. C.1.4.2); Part InfinityCategoryFoundations §10.1.3 (HTT, Def. 5.5.6.1).

**7.1.2.** Prove that for prestable C and D with finite limits, a right exact f : C → D is left exact if and only if SW(f) : SW(C) → SW(D) is t-exact for the t-structures of §3.1 (SAG, Lemma C.3.2.2, p. 1979). The route is Lurie's. SW(f) is the functor induced on the colimits along Σ (§2.2), and it is exact. If f is left exact, it preserves n-truncated objects (Part PresentableInfinityCategories §6.1, HTT, Prop. 5.5.6.16), and SW(C)≤n consists of the Σ⁻ᵏ of images of (n + k)-truncated objects of C, k ≥ 0 (§3.1), so SW(f) is left t-exact. It is right t-exact because SW(C)≥0 is the image of C. Conversely, a finite diagram in C ≃ SW(C)≥0 has as limit τ≥0 of its limit in SW(C). A t-exact functor commutes with τ≥0 (Part StableInfinityCategories §3.5, HA, Def. 1.3.3.1), and SW(f) and τ≥0 preserve finite limits, so f preserves the limit.

*Needs:* §2.2.1 (SAG, Constr. C.1.1.1, Prop. C.1.1.7); §3.1.2 (SAG, Prop. C.1.2.9); Part InfinityCategoryFoundations §10.1.3 (HTT, Def. 5.5.6.1); Part PresentableInfinityCategories §6.1.5 (HTT, Prop. 5.5.6.16); Part StableInfinityCategories §2.3.1 (HA, §1.1.4, exact functors), §3.1.2 (HA, Def. 1.2.1.4), §3.2.1 (HA, Prop. 1.2.1.5) and §3.5.1 (HA, Def. 1.3.3.1).

**7.1.3.** Prove that for Grothendieck prestable C and D and a colimit-preserving f : C → D, the following are equivalent (SAG, Prop. C.3.2.1, p. 1979):
- (1) f is left exact;
- (2) f carries discrete objects of C to discrete objects of D;
- (3) the induced F = Sp(f) : Sp(C) → Sp(D) is left t-exact.

The route is Lurie's. (1) ⇒ (2) is Part PresentableInfinityCategories §6.1 (HTT, Prop. 5.5.6.16). For (2) ⇒ (3), let X ∈ Sp(C)≤0. Sp(C) is right complete (§3.1, SAG, Rem. C.1.2.10), so X = colim τ≥−n X. F commutes with filtered colimits and Sp(D)≤0 is closed under them (§4.1; Part StableInfinityCategories §11.5, HA, Def. 1.3.5.20), so it suffices that each F(τ≥−n X) lies in Sp(D)≤0. Induct on n with the fiber sequences F(τ≥1−n X) → F(τ≥−n X) → F(Σ⁻ⁿπ₋ₙX) given by exactness of F. Sp(D)≤0 is closed under extensions, and π₋ₙX ≃ Σ∞ of a discrete object of C, so F(π₋ₙX) lies in the heart by (2), and Σ⁻ⁿ of it lies in Sp(D)≤−n. For (3) ⇒ (1), F restricts to the subcategories ⋃ Sp(C)≥−n ≃ SW(C) and ⋃ Sp(D)≥−n ≃ SW(D) (§3.1, SAG, Rem. C.1.2.10), where it is SW(f). It is right t-exact because f lands in D, and left t-exact by (3), so §7.1.2 makes f left exact.

*Needs:* §3.1.2 (SAG, Prop. C.1.2.9, Rem. C.1.2.10); §3.2.1 (SAG, Notation C.1.2.11); §4.1.1 (SAG, Prop. C.1.4.1, Def. C.1.4.2); §5.1.2 (SAG, Prop. C.3.1.1); §7.1.2 (SAG, Lemma C.3.2.2); Part PresentableInfinityCategories §6.1.5 (HTT, Prop. 5.5.6.16); Part StableInfinityCategories §3.1.2 (HA, Def. 1.2.1.4), §3.3.3 (HA, Def. 1.2.1.11), §3.4.2 (HA, Def. 1.2.1.15), §3.5.1 (HA, Def. 1.3.3.1), §7.2.1 (HA, Def. 1.4.2.8) and §11.5.1 (HA, Def. 1.3.5.20).

**7.1.4.** Define f to have amplitude ≤ n when the equivalent conditions of SAG, Prop. C.5.5.1 hold (f carries discrete objects to n-truncated objects), and bounded amplitude when it has amplitude ≤ n for some n. LFun^b(C, D) ⊆ LFun(C, D) is the full subcategory of functors of bounded amplitude (SAG, Def. C.5.5.2, p. 2028).

- A colimit-preserving functor has amplitude ≤ 0 exactly when it is left exact (SAG, Ex. C.5.5.3, p. 2028): this is (1) ⇔ (2) of §7.1.3 (SAG, Prop. C.3.2.1). So LFun^lex ⊆ LFun^b.
- Amplitude bounds add under composition.

**Checks.**

- Σ : Sp≥0 → Sp≥0 has amplitude ≤ 1 and not ≤ 0: ΣHℤ is 1-truncated, and π₁ Map(Hℤ, ΣHℤ) = ℤ shows it is not 0-truncated.
- X ↦ ⊕ₙ≥0 ΣⁿX on Sp≥0 preserves colimits but has unbounded amplitude: it sends Hℤ to an object with πₙ = ℤ for all n ≥ 0.
- Truncatedness is measured in the target as a prestable ∞-category. The inclusion Sp≥0 → Sp, with Sp Grothendieck prestable through the t-structure whose connective part is all of Sp (§4.1), preserves colimits, and its image of Hℤ is not truncated, since 0 is the only truncated object of Sp. So it has unbounded amplitude, as it must, not being left exact (§5.1). Measuring f(X) against the standard t-structure of Sp instead would give amplitude 0.

*Needs:* §7.1.1 (SAG, Prop. C.5.5.1, Prop. C.3.2.1); §4.1.2 (SAG, Def. C.1.4.2); §4.4.2 (SAG, Prop. C.2.3.10, for LFun); Part InfinityCategoryFoundations §10.1.3 (HTT, Def. 5.5.6.1); Part PresentableInfinityCategories §6.1.5 (HTT, Prop. 5.5.6.16).

**7.1.5.** Prove that amplitude bounds descend along heart-conservative functors: for Grothendieck prestable C, D, E, f ∈ LFun^b(C, D), and g ∈ LFun^lex(D, E) inducing a conservative functor D♥ → E♥, if g ∘ f has amplitude ≤ n, then f has amplitude ≤ n (SAG, Lemma C.5.5.8, p. 2031). The route: f has amplitude ≤ m for some m ≥ n. Descend from m to n one step at a time. If f has amplitude ≤ k + 1 and X is discrete, then g(πₖ₊₁ f(X)) ≃ πₖ₊₁(g f(X)) = 0 by left exactness of g (Part PresentableInfinityCategories §6.1, HTT, Prop. 5.5.6.16). Conservativity on hearts gives πₖ₊₁ f(X) = 0. The bounded-amplitude hypothesis on f is essential to start the descent.

*Needs:* §3.2.1 (SAG, Notation C.1.2.11); §5.1.1 (SAG, Notation C.3.2.3); §7.1.1 (SAG, Prop. C.5.5.1, Def. C.5.5.2); Part InfinityCategoryFoundations §10.1.3 (HTT, Def. 5.5.6.1); Part PresentableInfinityCategories §6.1.5 (HTT, Prop. 5.5.6.16).

### 7.2 Anticomplete Grothendieck prestable ∞-categories

**7.2.1.** Define a Grothendieck prestable C to be anticomplete if, for every Grothendieck prestable D with completion D̂ (§5.4), composition with D → D̂ gives an equivalence LFun^b(C, D) → LFun^b(C, D̂) (SAG, Def. C.5.5.4, p. 2028).

- Anticompleteness is invariant under equivalence, and Δ[0] is anticomplete.
- The target D̂ is again Grothendieck prestable (§5.4), so both sides of the comparison are ∞-categories of the same kind.

**Checks.**

- Sp is not anticomplete. Its only truncated object is 0, so every colimit-preserving functor out of Sp has amplitude ≤ 0. With D = Sp, the completion D̂ is Δ[0] (§5.4), so LFun^b(Sp, D̂) = Δ[0], while LFun^b(Sp, Sp) contains the identity. A definition calling every Grothendieck prestable ∞-category anticomplete is therefore wrong.
- For D complete, D → D̂ is an equivalence (§5.4), so every C satisfies the condition against such D. A definition quantifying only over complete D would make every C anticomplete.
- Bounded amplitude is needed. Take C = Mod_ℤ^cn and D = Sp, so D̂ = Δ[0]. The functor Mod_ℤ^cn → Sp that extends N(Free_ℤ) → N(Ab) ≃ Sp♥ ⊆ Sp, ℤⁿ ↦ Hℤⁿ (Part StableInfinityCategories §11.3, the heart of Sp), which preserves finite coproducts, along the universal property of P_Σ (Part PresentableInfinityCategories §7.3, HTT, Prop. 5.5.8.15) preserves colimits and sends ℤ to Hℤ ≠ 0, so LFun(C, Sp) is not equivalent to LFun(C, D̂) = Δ[0], and a definition with LFun in place of LFun^b fails for Mod_ℤ^cn. With LFun^b both sides are Δ[0]: a functor of bounded amplitude carries the discrete generator ℤ to a truncated object of Sp, which is 0, and so kills the colimit closure of ℤ, which is all of Mod_ℤ^cn.

*Needs:* §4.1.2 (SAG, Def. C.1.4.2); §5.4.2 (SAG, Prop. C.3.6.3); §7.1.4 (SAG, Def. C.5.5.2); Part PresentableInfinityCategories §7.3.1 (HTT, Prop. 5.5.8.15); Part StableInfinityCategories §11.3.2 (the heart of Sp).

**7.2.2.** Prove that Ind-completions of bounded connective parts are anticomplete. Precisely, for an ∞-category C the following are equivalent (SAG, Prop. C.5.5.5, p. 2028):
- C is a compactly generated prestable ∞-category, Ω preserves compact objects, and every compact object is n-truncated for some n;
- C ≃ Ind(E≥0) for an essentially small stable E with a bounded t-structure;

and such C are anticomplete (SAG, Prop. C.5.5.5, last assertion, p. 2029). The route: from the second condition, Ind(E≥0) is the connective part of the t-structure on Ind(E) (§6.2), hence prestable (§3.1), and compactly generated, hence Grothendieck (§6.1). Its compact objects are retracts of j(E) (Part AccessibleInfinityCategories §4.4, HTT, Lemma 5.4.2.4), which are truncated, and ΩC is a summand of j(τ≥0ΩE). Conversely, the compact objects C₀ form an essentially small prestable ∞-category (§6.1) with finite limits, since Ω preserves them. So E = SW(C₀) has a right bounded t-structure with E≥0 ≃ C₀ (§3.1), left bounded exactly when compact objects are truncated, and C ≃ Ind(C₀). For anticompleteness, use the t-exact Sp(Ind E≥0) ≃ Ind(E) from §6.2 and §5.1 to identify the comparison map with restriction to E of right t-exact functors with bounded image. That restriction is an equivalence because Sp(D) → Sp(D̂) is an equivalence on each Sp(D)≤n and the t-structure on E is bounded.

*Needs:* §2.2.1 (SAG, Constr. C.1.1.1); §3.1.1 (SAG, Ex. C.1.2.8, Prop. C.1.2.9); §5.1.2 (SAG, Prop. C.3.1.1); §5.4.2 (SAG, Prop. C.3.6.3); §6.1.1 (SAG, Rem. C.6.1.2, Prop. C.6.1.1); §6.2.1 (SAG, Lemma C.2.4.3, with its bullet on right bounded C); §7.1.4 (SAG, Def. C.5.5.2); §7.2.1 (SAG, Def. C.5.5.4); Part PresheavesAndCompletions §6.1.1 (HTT, Def. 5.3.4.5; Def. 5.3.5.1); Part InfinityCategoryFoundations §10.1.3 (HTT, Def. 5.5.6.1); Part PresentableInfinityCategories §1.1.1 (HTT, Def. 5.5.7.1); Part AccessibleInfinityCategories §4.4.1 (HTT, Lemma 5.4.2.4); Part StableInfinityCategories §8.1.1 (HA, the boundedness definitions before Prop. 1.2.1.17); Part StableInfinityCategories §3.5.1 (HA, Def. 1.3.3.1).

**Checks.**

- Mod_ℤ^cn is anticomplete by the first condition. Its compact objects are the objects with finitely many nonzero homotopy groups, all finitely generated (ℤ has global dimension 1). They are truncated, and Ω, which shifts homotopy groups down by one and drops π₀, preserves them. Mod_ℤ^cn is also complete (§3.3.2; SAG, Rem. C.1.5.9). So it is both complete and anticomplete, and a definition reading "anticomplete" as "not complete" is wrong.

**7.2.3.** Prove that anticompleteness passes to quotients by heart data: if C is an anticomplete Grothendieck prestable ∞-category with heart A, A₀ ⊆ A is localizing (§1.2), and C₀ is the smallest localizing subcategory of C containing A₀ (§4.5), then C/C₀ is anticomplete (SAG, Prop. C.5.5.7, p. 2030). The route: the square comparing LFun^b out of C/C₀ and out of C, with targets D and D̂, has fully faithful vertical maps (§4.4) and an equivalence at the bottom. It is a pullback once one knows that a bounded-amplitude F : C → D with C → D → D̂ killing C₀ already kills C₀ (§4.4.2, with its bullet). For X ∈ A₀, F(X) is truncated and dies in D̂, and completion is an equivalence on truncated objects, so F(X) = 0. The kernel of F is localizing (§4.3), so it contains C₀.

*Needs:* §1.2.1 (SAG, Def. C.5.1.2); §3.2.1 (SAG, Notation C.1.2.11); §4.3.1 (SAG, Def. C.2.3.3, Ex. C.2.3.7); §4.4.1 (SAG, Notation C.2.3.9, Prop. C.2.3.10, Rem. C.2.3.11); §4.5.2 (SAG, Prop. C.5.2.8 (f)–(g)); §5.4.2 (SAG, Prop. C.3.6.3); §7.1.4 (SAG, Def. C.5.5.2); §7.2.1 (SAG, Def. C.5.5.4).

### 7.3 Anticomplete models and the completion equivalence

**7.3.1.** Prove that every Grothendieck prestable C has an anticomplete model: an anticomplete Grothendieck prestable C̃ and a λ ∈ LFun^lex(C̃, C) that induces an equivalence of completions (SAG, Prop. C.5.5.9, p. 2031). The route: choose essentially small dense subcategories Kₙ ⊆ τ≤n Ĉ (Part PresentableInfinityCategories §1.7, SAG, Def. 20.4.1.1). Let E be the smallest stable subcategory of Sp(Ĉ) containing them and closed under truncation; it has a bounded t-structure. The induced F : Ind(E≥0) → Ĉ preserves colimits and finite limits. Let A₀ be the kernel of F on hearts and A₀⁺ the localizing subcategory it generates (§4.5). Set C̃ = Ind(E≥0)/A₀⁺, which is anticomplete by §7.2.2 and §7.2.3. F factors through C̃ (§4.3, §4.4). Anticompleteness lifts the factorization to λ : C̃ → C of bounded amplitude, and λ has amplitude ≤ 0 by the descent lemma §7.1.5, hence is left exact by SAG, Prop. C.3.2.1 (§7.1). The completion equivalence reduces to F inducing equivalences on τ≤n. The right adjoint is fully faithful on τ≤n Ĉ by density (Part PresentableInfinityCategories §1.7, SAG, Rem. 20.4.1.10), and F is conservative on n-truncated objects of C̃, since a cofiber killed by F has homotopy in A₀ and is a finite extension of their shifts.

*Needs:* §4.3.1 (SAG, Def. C.2.3.3, Ex. C.2.3.7); §4.4.1 (SAG, Notation C.2.3.9, Prop. C.2.3.10, Rem. C.2.3.11); §4.5.2 (SAG, Prop. C.5.2.8 (f)–(g)); §5.4.2 (SAG, Prop. C.3.6.3); §7.1.3 (SAG, Prop. C.3.2.1, Def. C.5.5.2, Lemma C.5.5.8); §7.2.1 (SAG, Def. C.5.5.4, Prop. C.5.5.5, Prop. C.5.5.7); Part PresentableInfinityCategories §1.7.1 (SAG, Def. 20.4.1.1, Rem. 20.4.1.10); Part PresheavesAndCompletions §6.1.2 (HTT, Def. 5.3.5.1); Part InfinityCategoryFoundations §10.1.3 (HTT, Def. 5.5.6.1); Part StableInfinityCategories §7.2.1 (HA, Def. 1.4.2.8) and §8.1.1 (HA, the boundedness definitions before Prop. 1.2.1.17); Part StableInfinityCategories §3.5.1 (HA, Def. 1.3.3.1).

**7.3.2.** Let `Groth∞^comp` ⊆ `Groth∞^lex` be the full subcategory on the complete objects (§3.3), and `Groth∞^ch` ⊆ `Groth∞^lex` the full subcategory on the anticomplete objects (§7.2). Prove that completion C ↦ Ĉ is an equivalence `Groth∞^ch` → `Groth∞^comp` (SAG, Prop. C.5.9.2, p. 2059). Checks for the two subcategories: `Mod_ℤ^cn` lies in both and completion fixes it (§7.2); `Sp≥0` lies in `Groth∞^comp` and not in `Groth∞^ch`, while `Ind(Sp^fb_≥0)`, whose completion it is, lies in `Groth∞^ch` and not in `Groth∞^comp`, so neither subcategory contains the other; `Sp` lies in neither, and its completion `Δ[0]` is also the completion of `Δ[0]`, so completion is not fully faithful on all of `Groth∞^lex` and the restriction to anticomplete objects is needed. The route: for anticomplete C, the map Map(C, D) → Map(Ĉ, D̂) in `Groth∞^lex` is an equivalence. Left exact functors have amplitude ≤ 0 (§7.1, SAG, Ex. C.5.5.3, from Prop. C.3.2.1), so they lie in LFun^b, and §7.2 and §5.4 apply. This gives full faithfulness. Essential surjectivity is the existence of anticomplete models, §7.3.1.

*Needs:* §3.3.1 (SAG, Def. C.1.2.12); §5.1.1 (SAG, Notation C.3.2.3); §5.4.2 (SAG, Prop. C.3.6.3); §7.1.3 (SAG, Prop. C.3.2.1, Def. C.5.5.2, Ex. C.5.5.3); §7.2.1 (SAG, Def. C.5.5.4); §7.3.1 (SAG, Prop. C.5.5.9).

### Examples

- Sp^fb_≥0 (Layer 6 Examples) is the connective part of the bounded t-structure on the essentially small stable Sp^fb, so Ind(Sp^fb_≥0) is anticomplete (§7.2, SAG, Prop. C.5.5.5). It is not equivalent to Sp≥0: its compact objects are retracts of objects of Sp^fb_≥0, hence truncated, while the sphere S is compact in Sp≥0 and not truncated.

### Dependencies

Layers 1–6; Part InfinityCategoryFoundations (§10.1); Part PresheavesAndCompletions (§6.1); Part PresentableInfinityCategories (§1.1); Parts AccessibleInfinityCategories (§4.4) and PresentableInfinityCategories (§1.7 dense subcategories, §6.1 truncation); Part StableInfinityCategories (§2.3 exact functors, §3.1–§3.5, §7.2, §8.1 boundedness, §11.5).

## Layer 8: Almost compact objects, coherence and the recognition theorem

### 8.1 Almost compact objects

**8.1.1.** Define, for a presentable C, an object C to be almost compact if, for every n ≥ 0, D ↦ Map(C, D) on τ≤n C commutes with filtered colimits (SAG, Def. C.6.4.1, p. 2067).

- C is almost compact if and only if τ≤n C is compact in τ≤n C for every n (SAG, Rem. C.6.4.2, p. 2067).
- Every compact object of a Grothendieck prestable C is almost compact (SAG, Ex. C.6.4.3, p. 2067), since τ≤n C ⊆ C is closed under filtered colimits.

**Checks.**

- In Sp≥0 the sphere S is compact, hence almost compact. ⊕ℕ Hℤ is not almost compact: its 0-truncation ⊕ℕ ℤ is not compact in abelian groups (§1.3). Testing only n = 0 is not enough: in Mod_ℤ^cn the object ℤ ⊕ Σ(⊕ℕ ℤ) has compact 0-truncation ℤ, but its 1-truncation is not compact in τ≤1.
- In Mod_ℤ^cn, the discrete object ℚ is not almost compact, because τ≤0 ℚ = ℚ is not compact in abelian groups (Conventions witness). The discrete object ℤ/2 is almost compact, since it is the cofiber of 2 : ℤ → ℤ and so is compact (Conventions witness).
- The zero object is almost compact. In a presentable C that is equivalent to an n-category, almost compact means compact.

*Needs:* Part PresentableInfinityCategories §1.1.1 (HTT, Def. 5.5.0.1); Part InfinityCategoryFoundations §10.1.3 (HTT, Def. 5.5.6.1); Part PresheavesAndCompletions §4.1.1 (HTT, Def. 5.3.1.7, filtered) and §6.1.1 (HTT, Def. 5.3.4.5).

**8.1.2.** Prove that the almost compact objects of a presentable C are closed under finite colimits and under geometric realizations of simplicial objects (SAG, Prop. C.6.4.4, p. 2067). The route: the first bullet of §8.1.1 reduces to compact objects of τ≤n C, which are closed under finite colimits (Part AccessibleInfinityCategories §2.2, HTT, Cor. 5.3.4.15). τ≤n C is equivalent to an (n + 1)-category (Part InfinityCategoryFoundations §10.6, HTT, Prop. 2.3.4.18), so a geometric realization there exists and is the colimit of the restriction to N(Δ≤n+1)^op, a finite colimit (Part PresentableInfinityCategories §7.6, HA, Lemma 1.3.3.10, fourth assertion, with n + 1 in place of n; that assertion has no size hypothesis). Compact objects of τ≤n C are closed under that finite colimit.

*Needs:* §8.1.1 (SAG, Def. C.6.4.1, Rem. C.6.4.2); Part AccessibleInfinityCategories §2.2.2 (HTT, Cor. 5.3.4.15); Part InfinityCategoryFoundations §10.6.5 (HTT, Prop. 2.3.4.18); Part PresentableInfinityCategories §7.6.1 (HA, Lemma 1.3.3.10, fourth assertion: a geometric realization in an n-category is a finite colimit); Part LimitsAndKanExtensions §9.4.2 (HTT, Notation 6.1.2.12); Part PresheavesAndCompletions §6.1.1 (HTT, Def. 5.3.4.5); Part InfinityCategoryFoundations §10.1.3 (HTT, Def. 5.5.6.1).

### 8.2 Closure of almost compact objects under finite limits

**8.2.1.** Prove the following theorem for a Grothendieck prestable C with almost compact objects C^ac:
- (a) the following are equivalent: Ω preserves C^ac; C^ac is closed under fibers; C^ac is closed under finite limits; X ∈ C^ac implies π₀X ∈ C^ac (SAG, Prop. C.6.4.5, p. 2068);
- (b) when they hold, for C ∈ C the following are equivalent: C is almost compact; every τ≤n C is almost compact; every πₙC, viewed in C, is almost compact (SAG, Cor. C.6.4.6, p. 2068).

The route for (a): fib(f) ≃ Ω cofib(f) by §2.4, and cofibers are covered by §8.1. Fiber products are fibers of maps out of direct sums X₀ ⊕ X₁ (§2.4), and finite limits are generated by fiber products and the final object (Part LimitsAndKanExtensions §6.5, HTT, Cor. 4.4.2.4). π₀X = cofib(ΣΩX → X). Conversely, the cofiber sequence X → π₀X → Σ²ΩX and full faithfulness of Σ² from τ≤n C to τ≤n+2 C, compatible with filtered colimits, give ΩX ∈ C^ac. For (b): use the cofiber sequences Σⁿ⁺¹Ωⁿ⁺¹C → C → τ≤n C (closure under cofibers, §8.1) and πₙC ≃ Ωⁿ τ≤n C (closure under Ω, (a)). For the last implication, induct on m with the fiber sequences τ≤m C → τ≤m−1 C → Σᵐ⁺¹πₘC, closing up by closure under fibers ((a)) and using the truncation bullet of §8.1.1.

**Checks.**

- Mod_ℤ^cn satisfies (a): its almost compact objects are the objects whose homotopy groups are all finitely generated, and these are closed under fibers because ℤ is Noetherian.
- For R = k[x, y₁, y₂, …]/(xyᵢ), Mod_R^cn fails (a): R is compact, hence almost compact, but the fiber in Mod_R^cn of multiplication by x on R is the discrete annihilator ideal (y₁, y₂, …), which is not finitely generated, so not compact in the heart.
- Sp≥0 satisfies (a): by Serre's finiteness theorem its almost compact objects are the connective spectra with finitely generated homotopy groups, closed under fibers by the long exact sequence. So (b) says X is almost compact exactly when every πₙX is finitely generated. ⊕ℕ Hℤ fails at π₀, and S passes although it is not truncated, so (b) cannot be replaced by "X is compact in C" or "some τ≤n X is compact in C".

*Needs:* for (a), §2.4.1 (SAG, Cor. C.1.2.6, Rem. C.1.5.2); §3.2.1 (SAG, Notation C.1.2.11); §4.1.2 (SAG, Def. C.1.4.2); §8.1.1 (SAG, Def. C.6.4.1, Rem. C.6.4.2, Prop. C.6.4.4); Part LimitsAndKanExtensions §6.5.3 (HTT, Cor. 4.4.2.4); Part StableInfinityCategories §1.3.1 (HA, §1.1.2, pp. 23–24); Part StableInfinityCategories §1.1.2 (HA, Def. 1.1.1.4, Def. 1.1.1.6).

*Needs:* for (b), (a) (SAG, Prop. C.6.4.5); §3.1.2 (SAG, Prop. C.1.2.9); §3.2.1 (SAG, Notation C.1.2.11); §8.1.1 (SAG, Rem. C.6.4.2, Prop. C.6.4.4); Part InfinityCategoryFoundations §10.1.3 (HTT, Def. 5.5.6.1).

### 8.3 Generators, coherence and weak coherence

**8.3.1.** Define, for a Grothendieck prestable C, a generating subcategory as a full subcategory C₀ such that every X ∈ C receives a family Cα → X with Cα ∈ C₀ for which ⊕ π₀Cα → π₀X is an epimorphism in C♥. An object is a generator if the full subcategory on it is generating (SAG, Def. C.2.1.1, p. 1959).

- Any full subcategory containing a generating one is generating.
- If C₀ is generating, then the objects π₀C for C ∈ C₀ generate the abelian category C♥.

**Checks.**

- In Sp≥0 the sphere S is a generator: an element of π₀X is a map S → X, and the sum over all elements surjects onto π₀X. ΣS is not a generator: every map ΣS → Hℤ is zero, so π₀Hℤ = ℤ is not hit. ΣS does generate Sp≥0 under colimits and desuspension inside Sp, so a definition "up to shift" would wrongly accept it.
- The condition is surjectivity on π₀ only. S generates Sp≥0, yet no sum of copies of S maps onto π₁ΣHℤ = ℤ, since π₁ of such a sum is a sum of copies of π₁S = ℤ/2. A definition asking for surjectivity on every πₙ would reject S.
- In Mod_ℤ^cn, ℤ is a generator, and ℚ is not: Hom(ℚ, ℤ) = 0, so no map from a sum of copies of ℚ hits π₀ of ℤ.

*Needs:* §3.2.1 (SAG, Notation C.1.2.11); §4.1.2 (SAG, Def. C.1.4.2); Part StableInfinityCategories §3.3.3 (HA, Def. 1.2.1.11).

**8.3.2.** Define a Grothendieck prestable C to be coherent if its almost compact objects are closed under finite limits and form a generating subcategory. Define it to be weakly coherent if the first condition holds and every truncated X receives a map ⊕Cα → X from almost compact Cα that is surjective on π₀ (SAG, Def. C.6.5.1, p. 2069).

**Checks.**

- Mod_ℤ^cn is coherent: almost compact objects are those whose homotopy groups are all finitely generated, which are closed under fibers because ℤ is Noetherian (§8.2, first Check), and ℤ is an almost compact generator.
- For a non-coherent ring such as R = k[x, y₁, y₂, …]/(xyᵢ), Mod_R^cn is not weakly coherent, since almost compact objects are not closed under fibers (§8.2, second Check). A definition asking only for an almost compact generator would accept it, since R is one.
- Δ[0] is coherent. So is Sp: every τ≤n Sp is 0, so every object of Sp is almost compact, and π₀ of every object is 0, so the generating condition holds for any family.

*Needs:* §4.1.2 (SAG, Def. C.1.4.2); §8.1.1 (SAG, Def. C.6.4.1); §8.2.1 (SAG, Prop. C.6.4.5); §8.3.1 (SAG, Def. C.2.1.1); §3.2.1 (SAG, Notation C.1.2.11); Part InfinityCategoryFoundations §10.1.3 (HTT, Def. 5.5.6.1).

**8.3.3.** Prove that C is weakly coherent if and only if, for every n ≥ 0, τ≤n C is compactly generated and its compact objects are closed under finite limits (SAG, Prop. C.6.5.4, p. 2070).
- If C is weakly coherent, then for every n ≥ 0 an object of τ≤n C is compact in τ≤n C exactly when it is almost compact in C (SAG, proof of Prop. C.6.5.4, pp. 2070–2071).

The route, forward: let E ⊆ τ≤n C be the n-truncated almost compact objects. In the bullet, "almost compact and n-truncated ⇒ compact in τ≤n C" needs no hypothesis: τ≤n X = X (§8.1.1, first bullet, SAG, Rem. C.6.4.2); the converse is where weak coherence enters. Weak coherence gives §8.2 (a), hence §8.2 (b), hence closure of E under τ≤n, and with §8.1, E is closed under finite colimits in τ≤n C. E is essentially small: it lies in (τ≤n C)^ω, and the ω-compact objects of a presentable ∞-category form an essentially small subcategory (Part AccessibleInfinityCategories §5.1 (2), HTT, Prop. 5.4.2.2). So the inclusion extends to a fully faithful colimit-preserving F : Ind(E) → τ≤n C (Part PresheavesAndCompletions §6.5, HTT, Prop. 5.3.5.11; Part PresentableInfinityCategories §1.6, HTT, Prop. 5.5.1.9), with right adjoint G. G detects zero: if GX = 0, then for every almost compact C, Map(C, X) ≃ Map(τ≤n C, X) (§8.2 (b), SAG, Cor. C.6.4.6) ≃ Map(τ≤n C, FGX) ≃ ∗, so π₀X = 0 by weak coherence; the same for ΩⁱX gives πᵢX = 0 for i ≤ n, and an n-truncated object with πᵢ = 0 for all i ≤ n is 0 (§3.1, read in SW(C) with the homotopy objects of Part StableInfinityCategories §3.3). The counit v : FGX → X is an equivalence: G(v) is an equivalence and G is left exact, so G(fib v) = 0 and fib v = 0; every map from an almost compact object to X factors through v, so v is π₀-surjective by weak coherence. In a prestable ∞-category with finite limits, a fiber sequence whose second map is π₀-surjective is a cofiber sequence: in C ≃ D≥0 (§3.1, SAG, Prop. C.1.2.9) the fiber in D of such a map is connective, so it is the fiber in C, and cofibers in C are those of the stable D. So v is the cofiber of 0 → FGX, an equivalence, and τ≤n C ≃ Ind(E). Compact objects of τ≤n C are then exactly E, which is closed under finite limits: objects of E are compact in τ≤n C, and a compact object of Ind(E) is a retract of an object of E (Part AccessibleInfinityCategories §4.4, HTT, Lemma 5.4.2.4). E is closed under retracts, as compact objects are (Part PresheavesAndCompletions §6.3) and so are n-truncated objects (Part InfinityCategoryFoundations §10.1). This is the bullet. Backward: closure of almost compact objects under Ω follows from τ≤n ΩX ≃ Ω τ≤n+1 X and §8.2. A compact object of τ≤n C is almost compact in C, by writing it as a retract of a truncation τ≤n Cα of a compact object Cα of τ≤m C. Here τ≤n Cα is compact in τ≤m C by the cofiber sequence Σⁿ⁺¹Ωⁿ⁺¹Cα → Cα → τ≤n Cα, whose first term is compact in τ≤m C by hypothesis (2) applied with Ω and then with Σ. Compact generation of τ≤n C supplies the required π₀-surjections.

**Checks.**

- Weak coherence is needed in the bullet. For R = k[x, y₁, y₂, …]/(xyᵢ) and C = Mod_R^cn, which is not weakly coherent (the second Check of the definition), the discrete D = R/(x) is finitely presented, hence compact in τ≤0 C = N(Mod_R) (§4.1.2, second heart bullet, through Part PresheavesAndCompletions §6.4, (3) of the statement on κ-compact objects of nerves). It is not almost compact: from the exact sequence 0 → Hom(R/x, N) → N → Hom(xR, N) → Ext¹(R/x, N) → 0, exact since Ext¹(R, −) = 0, if Ext¹(R/x, −) = π₀ Map(D, Σ −) on τ≤1 C (the identification of Ext with π₀ of mapping spaces in Mod_R^cn is elementary module theory, allowed at a Check) commuted with filtered colimits, the five lemma would make Hom(xR, −) commute with them, and the ideal xR ≅ R/(y₁, y₂, …) is not finitely presented.
- In Mod_ℤ^cn, which is coherent, the bullet for n = 0 says that the almost compact discrete objects are the finitely generated abelian groups, in agreement with the first Check of the definition.

*Needs:* §3.1.2 (SAG, Prop. C.1.2.9); §3.2.1 (SAG, Notation C.1.2.11); §4.1.2 (SAG, Def. C.1.4.2); §4.1.2 (its second heart bullet); §8.1.1 (SAG, Def. C.6.4.1, Rem. C.6.4.2, Prop. C.6.4.4); §8.2.1 (SAG, Prop. C.6.4.5, Cor. C.6.4.6); §8.3.2 (SAG, Def. C.6.5.1); Part StableInfinityCategories §3.3.3 (HA, Def. 1.2.1.11); Part AccessibleInfinityCategories §4.4.1 (HTT, Lemma 5.4.2.4) and §5.1.1 (HTT, Prop. 5.4.2.2); Part PresheavesAndCompletions §6.3.1 (HTT, Lemma 5.3.4.8 and the closure properties of κ-compact objects), §6.4.6 (the statement on κ-compact objects of nerves) and §6.5.4 (HTT, Prop. 5.3.5.11); Part PresentableInfinityCategories §1.6.3 (HTT, Prop. 5.5.1.9); Part PresheavesAndCompletions §6.1.1 (HTT, Def. 5.3.4.5; Def. 5.3.5.1); Part InfinityCategoryFoundations §10.1.3 (HTT, Def. 5.5.6.1); Part PresentableInfinityCategories §1.1.1 (HTT, Def. 5.5.7.1).

### 8.4 The recognition theorem

**8.4.1.** Prove that for a Grothendieck prestable C the following are equivalent (SAG, Thm. C.6.7.1, p. 2083; planned declaration `tfae_isAnticomplete_isCoherent`):
- C is compactly generated, Ω preserves compact objects, and every compact object is truncated;
- C ≃ Ind(E≥0) for an essentially small stable E with a bounded t-structure;
- C is anticomplete and coherent;
- C is anticomplete and weakly coherent.

The route: the first two are equivalent by §7.2. From the second, §7.2 gives anticompleteness. τ≤n C ≃ Ind(E≥0 ∩ E≤n) identifies the almost compact objects as those with every truncation in E≥0, which are preserved by Ω (so closed under finite limits by §8.2) and generate. The third implies the fourth trivially. From the fourth, let E≥0 be the truncated almost compact objects. They are closed under finite colimits (§8.1) and finite limits (§8.2), hence prestable with finite limits, so E = SW(E≥0) has a bounded t-structure (§3.1). Then λ : Ind(E≥0) → C preserves colimits and finite limits and is an equivalence on each τ≤n by §8.3. Both sides are anticomplete, so §7.3 makes λ an equivalence.

*Needs:* §2.2.1 (SAG, Constr. C.1.1.1); §3.1.2 (SAG, Prop. C.1.2.9); §4.1.2 (SAG, Def. C.1.4.2); §7.2.1 (SAG, Def. C.5.5.4, Prop. C.5.5.5); §7.3.2 (SAG, Prop. C.5.9.2); §8.1.1 (SAG, Def. C.6.4.1, Prop. C.6.4.4); §8.2.1 (SAG, Prop. C.6.4.5); §8.3.1 (SAG, Def. C.2.1.1, Def. C.6.5.1, Prop. C.6.5.4); Part PresheavesAndCompletions §6.1.1 (HTT, Def. 5.3.4.5; Def. 5.3.5.1); Part PresentableInfinityCategories §1.1.1 (HTT, Def. 5.5.7.1); Part StableInfinityCategories §3.1.2 (HA, Def. 1.2.1.4) and §8.1.1 (HA, the boundedness definitions before Prop. 1.2.1.17).

**Checks.**

- Sp is coherent (§8.3) and not anticomplete (§7.2), so the theorem needs anticompleteness as a separate hypothesis. A version with coherence alone would wrongly present Sp as Ind of a bounded connective part.

### Examples

- Mod_ℤ^cn is compactly generated, its compact objects (the objects with finitely many nonzero homotopy groups, all finitely generated; ℤ has global dimension 1) are truncated, and Ω preserves them. So Mod_ℤ^cn satisfies the recognition theorem, as does Ind(Sp^fb_≥0) (Layer 7 Examples).
- Sp≥0 is compactly generated, but its compact generator S is not truncated, so §8.4 does not present it as Ind of a bounded connective part.
- Sp≥0 is coherent: by Serre's finiteness theorem its almost compact objects are the connective spectra with finitely generated homotopy groups, which are closed under fibers (§8.2, third Check), and S is an almost compact generator (§8.3, first Check). If Sp≥0 were anticomplete, §8.4, from the third condition to the first, would make its compact objects truncated, and S is not. So Sp≥0 is complete (Layer 3 Examples) and not anticomplete.
- Its anticomplete model is λ : Ind(Sp^fb_≥0) → Sp≥0, the colimit-preserving extension of the inclusion of Sp^fb_≥0 (Layer 6 Examples), which is left exact because Sp^fb_≥0 ⊆ Sp≥0 is closed under finite limits and filtered colimits in Sp≥0 are left exact. Its source is anticomplete (Layer 7 Examples). By §8.3 (SAG, Prop. C.6.5.4) for the weakly coherent Sp≥0, each τ≤n Sp≥0 is compactly generated, with compact objects the n-truncated objects of Sp^fb_≥0. So λ induces equivalences τ≤n Ind(Sp^fb_≥0) ≃ Ind(τ≤n Sp^fb_≥0) ≃ τ≤n Sp≥0, the first as in the route of §8.4, the completion of Ind(Sp^fb_≥0) is Sp≥0, and λ is the anticomplete model of SAG, Prop. C.5.5.9 (§7.3).

### Dependencies

Layers 2–7; Part InfinityCategoryFoundations (§10.1); Part PresheavesAndCompletions (§4.1, §5.1, §6.1); Part AccessibleInfinityCategories (§4.1); Part PresentableInfinityCategories (§1.1); Part StableInfinityCategories (§1.1); Parts InfinityCategoryFoundations (§10.6, n-categories), LimitsAndKanExtensions (§6.5, §9.4), AccessibleInfinityCategories (§2.2, compact objects), PresheavesAndCompletions (§6.5, Ind) and PresentableInfinityCategories (§1.6; §7.6, geometric realizations in n-categories); Part StableInfinityCategories (§1.3, §3.1, §3.3, §8.1).

## Layer 9: Locally Noetherian prestable ∞-categories

### 9.1 Locally Noetherian prestable ∞-categories and their almost compact objects

**9.1.1.** Define a prestable C to be locally Noetherian if it is a weakly coherent Grothendieck prestable ∞-category (§8.3) whose heart C♥ is locally Noetherian (§1.3) (SAG, Def. C.6.9.1, p. 2089).

- A locally Noetherian C has locally Noetherian heart and τ≤n C compactly generated for every n (§8.3).

**Checks.**

- Mod_ℤ^cn is locally Noetherian: it is coherent (§8.3, first Check) and its heart, abelian groups, is locally Noetherian (§1.3).
- For R = k[x₁, x₂, …], Mod_R^cn is not, since its heart Mod_R is not locally Noetherian (§1.3). R is a coherent ring (a filtered colimit of Noetherian polynomial rings along flat maps), so Mod_R^cn is weakly coherent. Weak coherence alone is therefore not enough.
- Sp is locally Noetherian: it is weakly coherent (§8.3, third Check) and its heart 0 is locally Noetherian. The definition sees only the truncations, and Sp has the same truncations as Δ[0]. A definition that also asked every compact object to be truncated, as in §8.4, would reject Sp, whose compact generator S is not truncated.

*Needs:* §1.3.1 (SAG, Def. C.6.8.5); §8.3.2 (SAG, Def. C.6.5.1, Prop. C.6.5.4); §2.1.1 (SAG, Def. C.1.2.1).

**9.1.2.** Prove that in a locally Noetherian C, an object X is almost compact if and only if every πₙX is a Noetherian object of C♥ (SAG, Prop. C.6.9.3, p. 2089). The route: weak coherence gives the hypothesis of §8.2 (b), which reduces the question to the discrete objects πₙX. For discrete objects, almost compact means compact in τ≤0 C = C♥: almost compact implies compact in τ≤0 C by §8.1 (Rem. C.6.4.2, n = 0), and the converse is §8.3.3 (its compact-objects bullet), C being weakly coherent. Compact in τ≤0 C means Mathlib `IsFinitelyPresentable.{u}` in the abelian heart (§4.1.2, second heart bullet, which applies Part PresheavesAndCompletions §6.4), and in the locally Noetherian heart this means Noetherian (§1.3.2: (c) for one direction, (a) for the other).

*Needs:* §1.1.1 (SAG, Def. C.6.8.1); §1.3.1 (SAG, Def. C.6.8.5, Prop. C.6.8.7, Cor. C.6.8.9); §3.2.1 (SAG, Notation C.1.2.11); §4.1.2 (its heart bullets, SAG, Rem. C.1.4.6); §8.1.1 (SAG, Def. C.6.4.1, Rem. C.6.4.2); §8.2.1 (SAG, Cor. C.6.4.6); §8.3.2 (SAG, Def. C.6.5.1, Prop. C.6.5.4); §9.1.1 (SAG, Def. C.6.9.1); Part PresheavesAndCompletions §6.4.6 (the statement on κ-compact objects of nerves), used through this roadmap's §4.1.2.

### 9.2 Recognizing local Noetherianity

**9.2.1.** Prove that for a Grothendieck prestable C the following are equivalent (planned declaration `tfae_isLocallyNoetherianPrestable`):
- (a) C is locally Noetherian;
- (b) for every n ≥ 0, τ≤n C is compactly generated and every compact object C of τ≤n C has πₙC Noetherian in C♥ (SAG, Prop. C.6.9.7, p. 2089);
- (c) C♥ is locally Noetherian and every Noetherian object of C♥ is almost compact in C (SAG, Prop. C.6.9.8, p. 2091).

The route for (a) ⇒ (c): §9.1.1 and §9.1.2. For (a) ⇒ (b): τ≤n C is compactly generated by §9.1.1, first bullet; a compact C of τ≤n C is almost compact in C (§8.3.3, its compact-objects bullet), so πₙC is almost compact (§8.2 (b)), hence Noetherian (§9.1.2). For (b) ⇒ (a): first show that a C ∈ τ≤n C is compact exactly when π₀C, …, πₙC are Noetherian. Prove this through a refined statement, by induction on k ≤ n: if π₀, …, πₖ of C are Noetherian, there is a compact D → C whose cofiber has πₘ = 0 outside k < m ≤ n. The induction step chooses a compact Cα → C surjective on π₀ and applies the hypothesis to its fiber. Such a Cα exists: C is a filtered colimit in τ≤n C of compact objects Cα, and π₀ = τ≤0, a left adjoint, carries it to a colimit in τ≤0 C, which is the 1-categorical colimit over hK in the abelian heart (§4.1.2, second heart bullet). The index hK is filtered (Part PresheavesAndCompletions §6.4, (1) of the statement on κ-compact objects of nerves, forward, with κ = ω, and Mathlib `CategoryTheory.isFiltered_of_isCardinalFiltered`), so in a Grothendieck abelian category the images of the legs form a directed family of subobjects with supremum π₀C, and the ascending chain condition on the Noetherian π₀C makes one leg an epimorphism. The step corrects πₙ by killing the kernel K of πₙ, which is Noetherian (§1.1), hence compact in C♥ (§1.3.2 (a)), so compact in τ≤0 C (§4.1.2, second heart bullet). Then ΣⁿK is compact in τ≤n C, since Map(ΣⁿK, −) ≃ Map(K, Ωⁿ −) and Ωⁿ : τ≤n C → τ≤0 C commutes with filtered colimits (§4.1). With this description, compact objects of τ≤n C are closed under finite sums (§1.1) and fibers (§1.1, middle-exact form), so C is weakly coherent (§8.3). The case n = 0 makes τ≤0 C compactly generated with Noetherian compact objects: every object X is the colimit of a small filtered diagram K → τ≤0 C of compact objects (Part PresentableInfinityCategories §1.1; Part PresheavesAndCompletions §6.4, Cor. 5.3.5.4). By §4.1.2, second heart bullet, this is the 1-categorical colimit over hK in the abelian heart, whose legs are jointly epimorphic, so a coproduct of Noetherian objects maps epimorphically onto X, the third form of the definition in §1.3.1. So C♥ is locally Noetherian. For (c) ⇒ (b): let E ⊆ τ≤n C be the objects whose π₀, …, πₙ are Noetherian. Each is almost compact in C, by the hypothesis applied to its homotopy objects and induction along its Postnikov tower τ≤m = fib(τ≤m−1 → Σᵐ⁺¹πₘ). This uses closure of almost compact objects under fibers of maps A → ΣB with A and B almost compact, which holds without §8.2 (a): it follows from the Ext long exact sequence in Sp(C), since Ext^j(Y, −) on n-truncated objects is π₀ Map(Y, Σ^j −) on (n + j)-truncated objects. So they extend to a fully faithful filtered-colimit-preserving Ind(E) → τ≤n C (Part PresheavesAndCompletions §6.5, HTT, Prop. 5.3.5.11). Essential surjectivity for n = 0: every object of C♥ is the filtered union of its Noetherian subobjects (§1.3.1, second bullet), a colimit over a small filtered poset, which lifts to a diagram in C♥ (§3.2.2, third bullet) and so is a colimit in τ≤0 C (§4.1.2, second heart bullet), and the essential image of Ind(E) → τ≤0 C is closed under small filtered colimits. For n > 0, induct along the fiber sequence C → τ≤n−1 C → Σⁿ⁺¹πₙC: write τ≤n−1 C as a filtered colimit of objects Dα of E. Write πₙC as a union of Noetherian subobjects (§1.3). Factor each Dα → Σⁿ⁺¹πₙC through some Σⁿ⁺¹E′ by almost compactness. Then exhibit C as a filtered colimit of fibers that lie in E, which is extension-closed by §1.1.

*Needs:* for (a) ⇔ (b) (SAG, Prop. C.6.9.7), §1.1.1 (SAG, Def. C.6.8.1, Prop. C.6.8.2, Cor. C.6.8.3); §1.3.1 (SAG, Def. C.6.8.5, Prop. C.6.8.7, Cor. C.6.8.9); §3.2.1 (SAG, Notation C.1.2.11); Mathlib `CategoryTheory.isFiltered_of_isCardinalFiltered`; §4.1.2 (its heart bullets, SAG, Rem. C.1.4.6); §8.2.1 (SAG, Cor. C.6.4.6); §8.3.2 (SAG, Def. C.6.5.1, Prop. C.6.5.4); §9.1.1 (SAG, Def. C.6.9.1, Prop. C.6.9.3); Part PresheavesAndCompletions §6.1.1 (HTT, Def. 5.3.4.5) and §6.4.2 (HTT, Cor. 5.3.5.4) and §6.4.6 (the statement on κ-compact objects of nerves), the latter used through this
roadmap's §4.1.2; Part InfinityCategoryFoundations §10.1.3 (HTT, Def. 5.5.6.1); Part PresentableInfinityCategories §1.1.1 (HTT, Def. 5.5.7.1); Part StableInfinityCategories §1.1.2 (HA, Def. 1.1.1.6).

*Needs:* for (a) ⇔ (c) (SAG, Prop. C.6.9.8), §1.1.1 (SAG, Def. C.6.8.1, Prop. C.6.8.2); §1.3.1 (SAG, Def. C.6.8.5, Cor. C.6.8.8); §2.4.2 (SAG, Rem. C.1.5.2); §3.2.1 (SAG, Notation C.1.2.11); §3.2.2 (its third bullet, lifting diagrams); §4.1.2 (its heart bullets, SAG, Rem. C.1.4.6); §8.1.1 (SAG, Def. C.6.4.1); §8.2.1 (SAG, Cor. C.6.4.6); §9.1.1 (SAG, Def. C.6.9.1, Prop. C.6.9.3); Part PresheavesAndCompletions §6.5.4 (HTT, Prop. 5.3.5.11); Part PresheavesAndCompletions §6.1.2 (HTT, Def. 5.3.5.1); Part InfinityCategoryFoundations §10.1.3 (HTT, Def. 5.5.6.1); Part StableInfinityCategories §1.1.2 (HA, Def. 1.1.1.4, Def. 1.1.1.6).

### Examples

- Mod_R^cn for a Noetherian ring R is locally Noetherian by §9.2 (c): its heart Mod_R is locally Noetherian (Layer 1 Examples), and a finitely generated module has a resolution by finitely generated free modules, so it is compact in each τ≤n Mod_R^cn and hence almost compact.
- In Mod_ℤ^cn the almost compact objects are exactly the objects whose homotopy groups are all finitely generated (§9.1).

### Dependencies

Layers 1–4 and 8 (§3.2 and §4.1 for colimits and compact objects in the heart, through Parts LimitsAndKanExtensions §1.4 and PresheavesAndCompletions §6.4); §2.1; Part InfinityCategoryFoundations (§10.1); Part PresheavesAndCompletions (§6.1); Part PresentableInfinityCategories (§1.1); Part StableInfinityCategories (§1.1); Part PresheavesAndCompletions (§6.5, Ind-extensions).

## Downstream consumers

This roadmap is used by Part DerivedInfinityCategories, which lists what it uses from it in its own supplier contracts.

## References

- **HTT.** Jacob Lurie, *Higher Topos Theory*, author's PDF, version of 9 April 2017,
  [math.ias.edu/~lurie/papers/HTT.pdf](https://www.math.ias.edu/~lurie/papers/HTT.pdf) (published as Annals of
  Mathematics Studies 170, Princeton University Press, 2009). Statement numbers and pages are those of this PDF;
  its PDF page numbers run 18 ahead of its printed page numbers.
  Cited for presentability, Ind-objects, localization, compact objects, truncated objects, presentable fibrations and filtered colimits in `Pr^L` (Chapters 4–7, by numbered statement), and for the strict model of P_Σ (Prop. 5.5.9.1, Cor. 5.5.9.3, Prop. A.2.4.4).
- **HA.** Jacob Lurie, *Higher Algebra*, author's PDF, version of 18 September 2017,
  [math.ias.edu/~lurie/papers/HA.pdf](https://www.math.ias.edu/~lurie/papers/HA.pdf). Statement numbers and pages
  are those of this PDF, whose PDF and printed page numbers agree.
  Cited for stable ∞-categories, t-structures, completions, spectrum objects and generated t-structures (§§1.1–1.4, by numbered statement), for sifted colimits of connective spectra (Prop. 1.4.3.9, p. 153), and, in the Scope and §2.4, for the operadic input of Lurie's proof of SAG, Prop. C.1.5.7 that this Part does not use (Rem. 5.2.6.26).
- **SAG.** Jacob Lurie, *Spectral Algebraic Geometry*, author's PDF, version of 3 February 2018,
  [math.ias.edu/~lurie/papers/SAG-rootfile.pdf](https://www.math.ias.edu/~lurie/papers/SAG-rootfile.pdf). Statement
  numbers and pages are those of this PDF, whose PDF and printed page numbers agree.
  Prestable ∞-categories: Constr. C.1.1.1, Rem. C.1.1.2, Ex. C.1.1.4, Rem. C.1.1.5, Prop. C.1.1.7 (pp. 1943–1945); Def. C.1.2.1 through Def. C.1.2.12 (pp. 1945–1950); Prop. C.1.4.1, Def. C.1.4.2 (pp. 1952–1953); Def. C.1.5.1 through Rem. C.1.5.9 (pp. 1954–1957); Def. C.2.1.1 (p. 1959); Prop. C.2.3.1 through Rem. C.2.3.11 (pp. 1963–1967); Lemma C.2.4.3 (p. 1968); Def. C.3.0.5, Prop. C.3.1.1 (p. 1976); Prop. C.3.2.1, Lemma C.3.2.2, Notation C.3.2.3 (pp. 1979–1980); Thm. C.3.3.1 through Prop. C.3.3.5 (pp. 1982–1985); Prop. C.3.6.1, C.3.6.3 (pp. 1990–1991); Lemma C.4.3.1 (p. 1999); Def. C.5.1.2 (p. 2008); Prop. C.5.2.8 (p. 2014); Prop. C.5.5.1 through Prop. C.5.5.9 (pp. 2028–2031); Prop. C.5.9.2 (p. 2059); Prop. C.6.1.1, Rem. C.6.1.2, Lemma C.6.1.3 (p. 2062); Def. C.6.4.1 through Cor. C.6.4.6 (pp. 2067–2068); Def. C.6.5.1, Prop. C.6.5.4 (pp. 2069–2070); Thm. C.6.7.1 (p. 2083); Def. C.6.8.1 through Cor. C.6.8.9 (pp. 2085–2088); Def. C.6.9.1 through Prop. C.6.9.8 (pp. 2089–2091). Dense subcategories: Def. 20.4.1.1, Rem. 20.4.1.10 (pp. 1544–1545). Postnikov completeness: Def. A.7.2.1 (p. 1828). Page numbers are those of the PDF.
- **Kerodon.** Jacob Lurie, *Kerodon*, online. [kerodon.net](https://kerodon.net). Cited for adjunctions (Def. 6.2.1.1).
