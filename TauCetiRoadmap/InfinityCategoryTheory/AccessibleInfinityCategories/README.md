# Roadmap: accessible ∞-categories

**Summary.** This Part develops the theory of accessible ∞-categories.

It builds on the κ-filtered ∞-categories, κ-compact objects, `Ind_κ`, presheaves and idempotent completions of
Part PresheavesAndCompletions, the adjoint functors of Part AdjunctionsAndLocalizations, and the fibrations and
limits in `Cat∞` of Parts CartesianFibrations, LimitsAndKanExtensions and Straightening.

- **Categorical pullbacks (Layer 1).** Colimits, κ-filtered colimits and κ-compact objects in a categorical
  pullback square of ∞-categories.
- **κ-compact objects (Layer 2).** Diagrams of compact objects, closure under κ-small colimits, and compact
  presheaves.
- **Essential smallness (Layer 3).** Essentially κ-small ∞-categories (defined in §3.1) and their five equivalent
  characterizations; essentially small spaces.
- **Accessibility (Layers 4–5).** Accessible ∞-categories and accessible functors (defined in §4.1); local
  smallness of functor ∞-categories; the compact objects of `Ind_κ`; the generator characterization and change of
  cardinal.
- **Closure properties (Layers 6–7).** Functor ∞-categories, products, under- and over-categories, categorical
  pullbacks, and accessible subcategories (defined in §7.3); weakly cofinal and κ-cofinal functors (defined in
  §6.4).
- **Limits in `Cat∞` (Layer 8).** The subcategories `Cat∞(𝒦)`, `Acc_κ` and `Acc` of `Cat∞` and `Ĉat∞` (defined in
  §8.4 and §8.5), and limits of accessible ∞-categories.

**Headline theorems.**
- The **generator characterization**: an ∞-category is κ-accessible exactly when it is locally small, has small
  κ-filtered colimits, and its κ-compact objects form an essentially small subcategory that generates it under
  κ-filtered colimits (HTT, Prop. 5.4.2.2, p. 441).
- **Raising the cardinal**: a κ-accessible ∞-category is κ'-accessible for every κ' with κ ≪ κ' (HTT,
  Prop. 5.4.2.9, p. 444).
- **Uniformization**: an accessible functor between accessible ∞-categories is κ-continuous and preserves
  κ-compact objects for arbitrarily large κ (HTT, Rem. 5.4.2.13, p. 444).
- A small ∞-category is accessible exactly when it is idempotent complete (HTT, Cor. 5.4.3.6, p. 449).
- `Ind_κ` commutes with diagrams indexed by finite partially ordered sets (HTT, Prop. 5.3.5.15, p. 428).
- **Closure properties**: functor ∞-categories `Fun(K, C)` (HTT, Prop. 5.4.4.3, p. 452), under- and
  over-categories (HTT, Cor. 5.4.5.16, p. 461; Cor. 5.4.6.7, p. 466), categorical pullbacks (HTT, Prop. 5.4.6.6,
  p. 465), small products (HTT, Lemma 5.4.7.2, p. 467) and small intersections of accessible subcategories (HTT,
  Prop. 5.4.7.10, p. 470) of accessible ∞-categories are accessible, and functors with an adjoint are accessible
  (HTT, Prop. 5.4.7.7, p. 469).
- `Acc` has small limits, preserved by its inclusion into `Ĉat∞` (HTT, Prop. 5.4.7.3, p. 467), and the
  ∞-category of sections of a (co)Cartesian fibration with accessible fibers and accessible transport functors
  is accessible (HTT, Cor. 5.4.7.17, p. 474).
- The **recognition of limits in `Cat∞`** through coCartesian fibrations, and the lifting of limit diagrams along
  conservative, right adjointable transformations (HA, Prop. 5.2.2.36, p. 835; Cor. 5.2.2.37, p. 836), with its
  consequence for colimits in right fibrations (HA, Cor. 5.2.2.39, p. 837).

## Scope and ownership

Several carriers are already in Tau Ceti and are used as they are: κ-filtered simplicial sets
(`SSet.IsCardinalFiltered`), limit cones and colimit cocones in a quasicategory (`SSet.slice.IsLimit`,
`SSet.coslice.IsColimit`), categorical equivalences of quasicategories (`SSet.QCat.IsCategoricalEquivalence`),
and the simplicial nerve `Cat∞` (`SSet.catInfty`); categorical fibrations are those of Part InfinityCategoryFoundations §9.4.1. The
definitions built on them are stated at the start of the layer of their first use: presheaf ∞-categories in Part
LimitsAndKanExtensions §8.1; the Yoneda embedding, idempotent completeness, κ-compact objects and `Ind_κ` in Part
PresheavesAndCompletions §1.1, §2.1 and §6.1; κ-accessible and accessible ∞-categories and accessible functors
here, in §4.1. Locally small ∞-categories are Tau Ceti's (`SSet.IsLocallySmall`). Their basic theory is owned by
earlier Parts:

- Part PresheavesAndCompletions: the Yoneda lemma, idempotent completions, filtered ∞-categories, `Ind_κ`
  and its universal property, the closure properties of κ-compact objects, and the two categorical
  equivalences for joins over a weakly contractible simplicial set and for nerves of linear orders (HTT,
  Lemmas 5.4.5.10 and 5.4.6.2), which Layers 6 and 7 use;
- Part LimitsAndKanExtensions: colimits in functor ∞-categories and in spaces, cofinality, Theorem A,
  homotopy colimits and Kan extensions;
- Part AdjunctionsAndLocalizations: adjoint functors;
- Part CartesianFibrations: Cartesian and coCartesian fibrations, the Cartesian model structure, and the
  fact that a (co)Cartesian fibration over an ∞-category is a categorical fibration;
- Part Straightening: the same fact over an arbitrary base, limits in `Cat∞` as ∞-categories of
  Cartesian sections, and adjointable squares;
- Part InfinityCategoryFoundations: the Joyal model structure, categorical fibrations and minimal models.

Homotopy (co)limits in model categories and the Reedy and projective model structures belong to the
ModelCategoryTheory roadmap.

The 1-categorical theory is already in the library. Mathlib has κ-presentable objects, κ-accessible
functors, κ-accessible and locally κ-presentable categories, the uniformization theorem, the
relation `Cardinal.SharplyLT` with Adámek and Rosický's characterizations, and the accessibility of
comma categories (`Mathlib/CategoryTheory/Presentable/`). The order-theoretic core of HTT
Lemma 5.4.2.8 is Mathlib's (§5.2 says how it is obtained). The 1-categorical locally presentable
theory beyond Mathlib that HTT App. A.1 uses is ModelCategoryTheory, Part ModelCategories; this Part states only the ∞-categorical results and compares
them with Mathlib's notions in its Checks and Examples.

## Conventions

Locators such as (HTT, Prop. 5.2.7.8, p. 385) refer to the editions listed under [References](#references).

Every statement to prove, define or construct carries a label `X.Y.Z` — its section, then its position within that
section — and a single labeled statement, cited as `§2.2.2` here and `Part AccessibleInfinityCategories §2.2.2`
elsewhere, is one target.

- **∞-categories.** An ∞-category is a quasicategory, a simplicial set `C` with Mathlib's
  `SSet.Quasicategory C`. Objects are vertices, morphisms are edges. *Witness:* the nerve of an
  ordinary category is an ∞-category (Mathlib `CategoryTheory.Nerve.quasicategory`), while `Λ[2,1]`
  is not, since the inner horn `Λ[2,1] → Λ[2,1]` has no filler.
- **Universes and smallness.** Small means small relative to the universe fixed in Part InfinityCategoryFoundations §1.1 (HTT, §1.2.15, p. 68). A simplicial set is κ-small when it has fewer than κ nondegenerate
  simplices, as in Tau Ceti `SSet.IsCardinalFiltered`. *Witness:* `Δ[1]` has three nondegenerate
  simplices and infinitely many degenerate ones, so it is ω-small; counting all simplices would make
  no nonempty simplicial set ω-small.
- **Regular cardinals.** κ, κ', τ always denote regular cardinals (Mathlib `Cardinal.IsRegular`).
  The relation κ ≪ τ is HTT's: τ₀^κ₀ < τ for every τ₀ < τ and κ₀ < κ (ModelCategoryTheory, Part
  ModelCategories §5.2 (HTT, Def. A.2.6.3, p. 837)). When κ < τ it implies Mathlib's
  `Cardinal.SharplyLT κ τ` by `Cardinal.SharplyLT.of_pow_lt`. *Witness:* ω ≪ τ for every regular τ (finite
  powers of an infinite cardinal do not grow), while ℵ₁ ≪ ℵ₁ fails because ℵ₀^ℵ₀ = 2^ℵ₀ ≥ ℵ₁; so ≪ is not
  the order ≤.
- **Under- and over-categories.** For `p : K → C`, the under-category `C_{p/}` has as n-simplices the
  maps `K ⋆ Δ[n] → C` extending p (Tau Ceti `SSet.coslice`), and the over-category `C_{/p}` uses
  `Δ[n] ⋆ K` (Tau Ceti `SSet.slice`). *Witness:* in the nerve of `[1] = {0 < 1}`, the under-category of
  the object 0 has two objects and that of the object 1 has one; the over-categories are the reverse.
- **Categorical pullback squares.** A square of ∞-categories is a *categorical pullback square* when
  it is homotopy Cartesian for the Joyal model structure (Part InfinityCategoryFoundations §9.5 (HTT, Thm. 2.2.5.1,
  p. 107); ModelCategoryTheory, Part ModelCategories §3.5 (HTT, §A.2.4, p. 833)). A strict pullback along
  a categorical fibration is one. *Witness:* for the nerve J of the groupoid with two uniquely isomorphic
  objects 0 and 1, the strict pullback of `{0} → J ← {1}` is empty, while the categorical pullback is
  contractible; the strict pullback is not homotopy invariant.
- **Fibrations that are categorical fibrations.** (Co)Cartesian fibrations over any base are categorical
  fibrations (Part Straightening §2.3). *Witness:* for an ∞-category C and any simplicial set K, the projection `C × K → K` is a coCartesian
  fibration and a categorical fibration, as the pullback of `C → Δ[0]`; this is the case of §6.2. The
  inclusion `{1} ⊆ Δ[1]` is a categorical fibration (the only equivalences of `Δ[1]` are degenerate) but not
  a Cartesian fibration, since the edge `0 → 1` has no lift ending at the vertex 1; so a categorical
  fibration need not be Cartesian.
- **Compact objects.** `C^κ` is the full subcategory of κ-compact objects of C, those whose corepresented
  functor `C → S` preserves small κ-filtered colimits (Part PresheavesAndCompletions §6.1 (HTT, Def. 5.3.4.5, p. 414)).
  `P(C) = Fun(C^op, S)` and `Ind_κ(C) ⊆ P(C)` are as in Part LimitsAndKanExtensions §8.1 (HTT, Def. 5.1.0.1, p. 333)
  and Part PresheavesAndCompletions §6.1 (HTT, Def. 5.3.5.1, p. 421). `P^κ(C)` denotes the κ-compact objects of `P(C)`
  (HTT, after Prop. 5.3.4.17, p. 420). For a locally small C, corepresented functors `C → S` and the functors
  `C → Ŝ` of Part PresheavesAndCompletions §6.1 give the same κ-compact objects, since the inclusion `S ⊆ Ŝ`
  preserves and reflects small colimits (Part PresheavesAndCompletions §6.4, route of its last statement,
  *Universes*). *Witness:* for the nerve of an ordinary category A with morphisms in `Type u`, objects in
  `Type (u + 1)` at most, and κ-filtered colimits (Mathlib `HasCardinalFilteredColimits.{u} A κ`), an object is
  κ-compact exactly when it is κ-presentable in Mathlib's sense (Part PresheavesAndCompletions §6.4, its last
  statement, (3)); a locally small A with larger Hom-types is first replaced by Mathlib's `ShrinkHoms`. For A the
  category of sets this means fewer than κ elements (Mathlib `CategoryTheory.Types.isCardinalPresentable_iff`:
  `IsCardinalPresentable X κ ↔ HasCardinalLT X κ` in `Type u`), so ℕ is ℵ₁-compact and not ω-compact.
- **Functor ∞-categories.** `Fun(K, C)` is Mathlib's internal hom `(ihom K).obj C`, a quasicategory by
  Mathlib's instance. `Map_S(S, X)` is the ∞-category of sections of `X → S`. *Witness:* for K = `∂Δ[1]`,
  `Fun(K, C)` is `C × C`, and for `X = C × S → S` the sections `Map_S(S, X)` are `Fun(S, C)`.

## Exact supplier contracts

### From Mathlib

At the pinned Mathlib, all in `Mathlib/CategoryTheory/Presentable/` unless noted:

- `CategoryTheory.IsCardinalPresentable`, `CategoryTheory.Functor.IsCardinalAccessible`,
  `CategoryTheory.Functor.IsAccessible`, `CategoryTheory.HasCardinalFilteredColimits`
  (`Basic.lean`); `CategoryTheory.HasCardinalFilteredGenerator` (`CardinalFilteredPresentation.lean`);
  `CategoryTheory.IsCardinalAccessibleCategory`, `CategoryTheory.IsAccessibleCategory`,
  `CategoryTheory.IsCardinalLocallyPresentable`, `CategoryTheory.IsLocallyPresentable`
  (`LocallyPresentable.lean`). They are used only for comparison in Checks and Examples; nothing about
  them is assumed beyond their definitions.
- `CategoryTheory.IsCardinalFiltered` and `isCardinalFiltered_preorder` (`IsCardinalFiltered.lean`).
- `Cardinal.SharplyLT`, `Cardinal.SharplyLT.of_pow_lt`, `Cardinal.SharplyLT.exists_isCardinalFiltered_set`,
  `Cardinal.SharplyLT.IsCardinalFilteredAndHasCardinalLT.isCardinalFiltered_subtype`,
  `Cardinal.SharplyLT.isCardinalAccessibleCategory` (`SharplyLT/Basic.lean`, `SharplyLT/Lemmas.lean`):
  the order-theoretic input of §5.2.
- `CategoryTheory.IsCardinalAccessibleCategory.uniformization` (`Uniformization.lean`),
  `CategoryTheory.Comma.isAccessibleCategory` (`Comma.lean`), `CategoryTheory.Types.isCardinalPresentable_iff`
  (`Type.lean`), `CategoryTheory.Retract.isCardinalPresentable` (`Retracts.lean`),
  `CategoryTheory.Adjunction.isCardinalPresentable_leftAdjoint_obj` (`Adjunction.lean`): the
  1-categorical statements that the Examples compare with.
- `CategoryTheory.IsIdempotentComplete`, `CategoryTheory.Idempotents.Karoubi`
  (`Mathlib/CategoryTheory/Idempotents/`), `CategoryTheory.EssentiallySmall`,
  `CategoryTheory.LocallySmall`, `HasCardinalLT`, `Cardinal.IsRegular`.
- `SSet.Quasicategory`, `SSet.QCat`, `SSet.N`, `SSet.KanComplex`, `SSet.opFunctor`, `CategoryTheory.nerve`,
  `CategoryTheory.Nerve.quasicategory`, `SSet.hoFunctor` (`Mathlib/AlgebraicTopology/`).
- `SSet.InnerFibration` (`Mathlib/AlgebraicTopology/Quasicategory/InnerFibration.lean`): inner fibrations
  (HTT, Def. 2.0.0.3, p. 71, its inner case); `HomotopicalAlgebra.ModelCategory`
  (`Mathlib/AlgebraicTopology/ModelCategory/Basic.lean`): model categories (HTT, Def. A.2.1.1, p. 828, which
  also asks for all small limits and colimits; statements here add them as hypotheses).

### From Tau Ceti

At the pinned Tau Ceti, in `TauCeti/AlgebraicTopology/`:

- `SSet.LeftFibration`, `SSet.RightFibration` (`SimplicialSet/AnodyneExtensions/LeftRight/Basic.lean`): left
  and right fibrations (HTT, Def. 2.0.0.3, p. 71); `SSet.catInfty` is `Cat∞` (HTT, Def. 3.0.0.1, p. 162).
- `SSet.IsCardinalFiltered` and `SSet.isCardinalFiltered_nerve_iff` (`SimplicialSet/CardinalFiltered.lean`):
  κ-filtered simplicial sets, counted by nondegenerate simplices.
- `SSet.IsLocallySmall`, `CategoryTheory.nerve.isLocallySmall_iff` (`Quasicategory/LocallySmall.lean`) and
  `TauCeti.HasSmallSpaceModel` (`SimplicialSet/SmallModel.lean`).
- `SSet.slice.IsLimit`, `SSet.coslice.IsColimit` (`Quasicategory/Limit.lean`): limit cones and colimit
  cocones, terminal and initial vertices of slices.
- `SSet.QCat.IsCategoricalEquivalence` (`Quasicategory/CategoricalEquivalence.lean`) and `SSet.catInfty`
  (`Quasicategory/CatInfty.lean`).
- `SSet.coslice`, `SSet.slice` (`SimplicialSet/Coslice.lean`, `SimplicialSet/Slice.lean`),
  `SSet.fullEnhancedSubcategory` (`Quasicategory/FullSubcategory.lean`), `SSet.Edge.IsCartesian`,
  `SSet.CartesianFibration` (`Quasicategory/Cartesian.lean`), `SSet.IsWeaklyContractible`
  (`SimplicialSet/WeaklyContractible.lean`).

### From TauCetiRoadmap.InfinityCategoryTheory

Earlier Parts of this family, by Part, section and source locator:

- **Definitions, by owner Part:** Part InfinityCategoryFoundations: the simplicial nerve, categorical equivalences and fully
  faithful functors (§2.1, HTT, Def. 1.1.5.5, p. 40; Def. 1.1.5.14, p. 43; §1.2.10); functor ∞-categories, cores
  and subcategories, cones, initial objects, limits and colimits (§1.2, HTT, Notation 1.2.7.2, p. 57; §1.2.11,
  p. 62; Notation 1.2.8.4, p. 59; §1.2.12, p. 63; Def. 1.2.13.4, p. 65); size and the large ∞-categories (§1.1,
  HTT, §1.2.15, p. 68), and the classifying maps of right and left fibrations through the universal right fibration
  (§7.1, HTT, §3.3.2, p. 230); homotopy relative to a subcomplex (§10.1, HTT, §2.3.3, p. 119). Part CartesianFibrations:
  coCartesian fibrations (§1.1, HTT, Def. 2.4.2.1, p. 139); marked simplicial sets (§5.1, HTT, Def. 3.1.0.1,
  p. 164). Part LimitsAndKanExtensions: cofinal maps (§2.1, HTT, Def. 4.1.1.1, p. 241); relative colimits (§7.1,
  HTT, Def. 4.3.1.1, p. 279); presheaves (§8.1, HTT, Def. 5.1.0.1, p. 333). Part AdjunctionsAndLocalizations:
  adjunctions (§1.1, HTT, Def. 5.2.1.1, p. 353; Def. 5.2.2.1, p. 358); retracts (§2.1, HTT, §4.4.5, p. 321). Part
  Straightening: classifying maps of (co)Cartesian fibrations (§2.1, HTT, Def. 3.3.2.2, p. 229). Part
  PresheavesAndCompletions: the Yoneda embedding (§1.1, HTT, §5.1.3, p. 337; §5.1.6, p. 346); idempotent
  completeness (§2.1, HTT, §5.1.4, p. 339); κ-filtered ∞-categories (§4.1, HTT, Def. 5.3.1.7, p. 400); κ-compact
  objects and `Ind_κ` (§6.1, HTT, Def. 5.3.4.5, p. 414; Def. 5.3.5.1, p. 421). Locally small ∞-categories are
  Tau Ceti's `SSet.IsLocallySmall` (HTT, Def. after Prop. 5.4.1.7, p. 441).
- **Part InfinityCategoryFoundations:** the join–slice correspondence (§4.1, HTT, Prop. 1.2.9.2, p. 60); slices along
  left fibrations and coslices along anodyne maps (§4.2–4.3, HTT, Prop. 2.1.2.1, p. 78; Prop. 2.1.2.5,
  p. 80); initial objects and colimits as initial objects (§5.5, HTT, Prop. 1.2.12.9, p. 64;
  Rem. 1.2.13.5, p. 65); rigidification and left cones (§6.1–6.2, HTT, Lemma 2.2.5.2, p. 107;
  Def. 2.1.4.2, p. 86); straightening and the straightening theorem (§7.2, §7.5, HTT, Thm. 2.2.1.2, p. 92); mapping spaces (§8.1,
  HTT, Thm. 2.2.0.1, p. 90; Prop. 2.2.4.1, p. 106); colimits in overcategories (§8.3, HTT, Prop. 1.2.13.8,
  p. 66); restriction along inner anodyne maps (§9.2, HTT, Cor. 2.3.2.5, p. 119); categorical fibrations over an
  ∞-category (§10.2, HTT, Cor. 2.4.6.5, p. 155); products of categorical
  equivalences (§9.3, HTT, Cor. 2.2.5.4, p. 110); categorical fibrations, the Joyal model structure and its
  comparison with simplicial categories (§9.4–9.6, HTT, §2.2.5 and Thm. 2.2.5.1, p. 107); the classification
  of right fibrations by maps to `S^op` (§7.7) and of left fibrations by maps to S (§7.7 (4), HTT, Cor. 3.3.2.8,
  p. 231); minimal inner fibrations and minimal models
  (§10.3–10.4, HTT, Def. 2.3.3.1, p. 119; Prop. 2.3.3.8, p. 121).
- **Part CartesianFibrations:** Cartesian and coCartesian edges (§1.3, §1.5, HTT, Prop. 2.4.1.5, p. 134;
  §2.4.1, p. 136); mapping-space criteria (§1.7, HTT, Lemma 2.4.4.1, p. 148; Prop. 2.4.4.2, p. 149);
  locally coCartesian fibrations (§2.3, HTT, Def. 2.4.2.6, p. 141); correspondences and arrow ∞-categories (§4.1, §4.4, HTT,
  Def. 2.3.1.3, p. 115; Cor. 2.4.7.12, p. 161); marked anodyne maps and the Cartesian model structure
  (§5.4, §5.5, §5.7, HTT, Prop. 3.1.2.3, p. 170; Prop. 3.1.2.1, p. 169; Prop. 3.1.3.7, p. 175); base change
  and fiberwise criteria over ∞-category bases (§7.2–7.3, HTT, Prop. 3.3.1.3, p. 223; Cor. 3.3.1.6,
  p. 226); (co)Cartesian fibrations over ∞-categories, their pullbacks, and fibrations over Kan complexes
  are categorical fibrations (§7.4, HTT, Prop. 3.3.1.7, over an ∞-category base, p. 227; Prop. 3.3.1.8,
  p. 228).
- **Part LimitsAndKanExtensions:** the fat join and fat slices (§1.1–1.2, HTT, Def. 4.2.1.1, Prop. 4.2.1.2,
  Cor. 4.2.1.3, Prop. 4.2.1.5, pp. 257–259); relative slices (§1.5, HTT, Prop. 4.2.2.4, p. 262); cofinal maps
  (§2.3, §2.5, HTT, Prop. 4.1.1.3, p. 241; Prop. 4.1.1.8, p. 244); homotopy colimits (§3.1–3.2, HTT,
  Prop. 4.2.4.4, p. 276; Thm. 4.2.4.1, p. 275); tensors (§3.5, HTT, Cor. 4.4.4.10, p. 320); coCartesian
  fibrations are smooth and Theorem A (§5.2, §5.4, HTT, Prop. 4.1.2.15, p. 252; Thm. 4.1.3.1, p. 254);
  decompositions of diagrams (§6.2–6.3, HTT, Prop. 4.2.3.4, p. 267; Lemma 4.2.3.6, p. 269; Prop. 4.2.3.8,
  p. 270; Cor. 4.2.3.11, p. 271); reduction to pushouts and coproducts (§6.5, HTT, Prop. 4.4.2.6, p. 314);
  relative colimits and
  Kan extensions (§7.2–7.4, HTT, Prop. 4.3.1.5, p. 279; Props. 4.3.1.9–4.3.1.10,
  Cor. 4.3.1.11, pp. 282–284; Lemma 4.3.2.13, p. 300; Prop. 4.3.2.15, p. 302); colimits in functor
  ∞-categories and in spaces (§8.2–8.3, HTT, Prop. 5.1.2.2, p. 336; Cor. 5.1.2.3, p. 337; Prop. 3.3.4.5,
  p. 237).
- **Part AdjunctionsAndLocalizations:** adjoint functors (§1.3, §1.5, §1.6, HTT, Cor. 5.2.2.5, p. 359;
  Prop. 5.2.3.5, p. 367; Prop. 5.2.4.2, p. 368) and Kan extensions as adjoints (§1.8, HTT, Prop. 4.3.2.17,
  p. 302).
- **Part Straightening:** invariance under categorical equivalence of the base (§2.2, HTT, Cor. 3.3.1.2,
  p. 223); Cartesian fibrations over an arbitrary base are categorical fibrations (§2.3, HTT, Prop. 3.3.1.7,
  p. 227); agreement of the classification of right fibrations of Part InfinityCategoryFoundations §7.1 with the one through
  `Z → Cat∞^op` (§2.5, HTT, Prop. 3.3.2.5, p. 230); limits in `Cat∞` as ∞-categories of sections (§3.2, HTT,
  Prop. 3.3.3.1, p. 232); adjointable
  squares (§5.1, HTT, Def. 7.3.1.2, p. 768).
- **Part PresheavesAndCompletions:** the Yoneda lemma and representables (§1.3, HTT, Props. 5.1.3.1–5.1.3.2,
  p. 338; Lemmas 5.1.5.2–5.1.5.3, pp. 342–343); completely compact objects (§1.6, HTT, Def. 5.1.6.2, p. 346;
  Prop. 5.1.6.8, p. 349); idempotent completions (§3.1, §3.3, HTT, Def. 5.1.4.1, p. 339; Prop. 5.1.4.9,
  p. 341; Rem. 5.1.4.10, p. 342); filtered ∞-categories (§4.2–4.4, HTT, Rems. 5.3.1.10 and 5.3.1.12,
  p. 401; Prop. 5.3.1.18, p. 404; Lemmas 5.3.1.20–5.3.1.21, p. 406); the two categorical equivalences
  (§5.4, HTT, Lemma 5.4.5.10, p. 457; Lemma 5.4.6.2, p. 462); compact objects (§6.1, HTT, Notation 5.3.4.6, p. 414; §6.3, HTT,
  Lemma 5.3.4.8, p. 414; Lemmas 5.3.4.9–5.3.4.12, pp. 415–416; Rem. 5.3.4.16, p. 419); `Ind_κ` (§6.4–6.5,
  HTT, Prop. 5.3.5.3, Cor. 5.3.5.4, Prop. 5.3.5.5, pp. 421–422; Props. 5.3.5.10–5.3.5.11, pp. 424–425).

### From TauCetiRoadmap.ModelCategoryTheory

- **Part ModelCategories:** lifting in model categories (§3.2, HTT, Prop. A.2.3.1, p. 830), homotopy pushout
  and pullback squares (§3.5, HTT, §A.2.4, p. 833), Quillen equivalences (§4.2, HTT, Prop. A.2.5.1, p. 835),
  the relation κ ≪ τ (§5.2, HTT, Def. A.2.6.3, p. 837), projective model structures on diagram categories
  (§7.2, HTT, Prop. A.2.8.2, projective assertion, p. 848).
- **Part KanQuillen:** homotopy groups, the long exact sequence of a Kan fibration and Whitehead's theorem
  (§1.1–1.3), weak homotopy equivalences, their stability under filtered colimits, and right properness
  (§3.1, §3.3, §3.4; HTT, §A.2.7).
- **Part SimplicialCategories:** homotopy limits and colimits (§3.2, HTT, §A.2.8, p. 851), the Bergner model
  structure (§5.4, HTT, Prop. A.3.2.4, p. 876).

## How to read the build

Layer 1 proves that colimits, κ-filtered colimits and κ-compact objects behave well in categorical
pullback squares, through a homotopy-pullback lemma for filtered homotopy colimits in §1.3. Layer 2
proves the κ-compactness results for diagrams, colimits and presheaves. Layer 3 defines and characterizes essentially κ-small
∞-categories and spaces. Layer 4 proves local smallness of functor ∞-categories, describes the κ-compact
objects of `P(C)` and `Ind_κ(C)`, shows that large filtered colimits of representables are retracts
of representables, and ends with the commutation of `Ind_κ` with diagrams indexed by finite posets
(§4.6). Layer 5 proves the generator characterization of accessibility, raising and
uniformizing the cardinal, and their immediate consequences. Layer 6 proves that functor ∞-categories,
products and under-categories of accessible ∞-categories are accessible, through filtered ∞-categories
of sections of coCartesian fibrations, κ-cofinal functors (which use the categorical equivalence for joins
of Part PresheavesAndCompletions §5.4) and the compact objects of under-categories. Layer 7 proves the same
for categorical pullbacks and over-categories and for accessible subcategories. Layer 8 treats limits of
∞-categories: limit diagrams in `Cat∞`, the subcategories `Cat∞(K)` and `Acc`, and accessible
fibrations.

Layer 4 opens with the definitions of accessible ∞-categories and accessible functors (§4.1), which later Parts
cite there.

## Layer 1: Colimits and compact objects in categorical pullbacks

### 1.1 Under-categories of categorical fibrations and pullbacks

**1.1.1.** Prove that if `p : X → Y` is a categorical fibration of ∞-categories and `f : K → X` is any diagram, then
the induced map `X_{f/} → Y_{pf/}` is again a categorical fibration (HTT, Lemma 5.4.5.3, p. 454). Route: a lifting
problem against a monic categorical equivalence `A ⊆ B` corresponds, by the join–slice correspondence, to a lifting
problem for p against `K ⋆ A ⊆ K ⋆ B`, which is a monic categorical equivalence because joins preserve categorical
equivalences. The `Suggested.lean` declaration is `categoricalFibration_coslice_map`.

*Needs:*
- Part InfinityCategoryFoundations §9.4.1 (HTT, §2.2.5, categorical fibrations, p. 107);
- Part InfinityCategoryFoundations §2.1.6 (HTT, Def. 1.1.5.14, p. 43);
- Tau Ceti `SSet.slice.homEquiv`, `SSet.coslice.homEquiv` (HTT, Prop. 1.2.9.2);
- Part LimitsAndKanExtensions §1.1.2 (HTT, Cor. 4.2.1.3, p. 258).

**1.1.2.** Prove that for a categorical pullback square of ∞-categories, with `X' → X` and `X' → Y'` over `p : X → Y` and
`q : Y' → Y`, and any `f : K → X'`, the induced square formed by `X'_{f/}`, `X_{q'f/}`, `Y'_{p'f/}` and
`Y_{qp'f/}` is again a categorical pullback square (HTT, Lemma 5.4.5.4, p. 454). Route: replace p and q by
categorical fibrations and `X'` by the strict pullback; the join–slice correspondence identifies `X'_{f/}`
with the strict pullback of the other three under-categories, and §1.1.1 shows
that the maps in that pullback are categorical fibrations.

*Needs:*
- §1.1.1 (HTT, Lemma 5.4.5.3);
- Tau Ceti `SSet.slice.homEquiv`, `SSet.coslice.homEquiv` (HTT, Prop. 1.2.9.2);
- Part InfinityCategoryFoundations §9.5.1 (HTT, Thm. 2.2.5.1, p. 107); Part InfinityCategoryFoundations §9.4.1 (HTT, §2.2.5).

### 1.2 Initial objects and colimits in a categorical pullback

**1.2.1.** Prove that, in a categorical pullback square as in §1.1 where X and `Y'` have initial objects and p and q
preserve initial objects, an object of `X'` is initial exactly when its images in `Y'` and in X are initial,
and that `X'` has an initial object (HTT, Lemma 5.4.5.2, p. 453). Route: reduce to a strict pullback along
categorical fibrations; for an object whose images are initial, the right mapping space out of it is the
pullback of three contractible Kan complexes along inner fibrations, which is a homotopy pullback, hence
contractible. For existence, choose initial objects of X and `Y'`, lift the equivalence between their images
in Y along the categorical fibration q, and use that initial objects are unique up to equivalence for the
converse.

*Needs:*
- Part InfinityCategoryFoundations §1.2 (HTT, §1.2.12, initial objects, p. 63);
- Part InfinityCategoryFoundations §5.5.3 (HTT, Prop. 1.2.12.9, p. 64);
- Part CartesianFibrations §1.7.2 (HTT, Lemma 2.4.4.1, p. 148); Part InfinityCategoryFoundations §10.2.4 (HTT, Cor.
  2.4.6.5, p. 155); Part InfinityCategoryFoundations §9.5.1 (HTT, Thm. 2.2.5.1, p. 107); Part InfinityCategoryFoundations §9.4.1 (HTT,
  §2.2.5);
- Mathlib `SSet.InnerFibration`, Tau Ceti `SSet.LeftFibration` and `SSet.RightFibration` (HTT, Def. 2.0.0.3,
  p. 71).

**1.2.2.** Prove that if, in a categorical pullback square as in §1.1, X and `Y'` admit colimits of all diagrams indexed
by a simplicial set K and p and q preserve them, then a cone `K^▷ → X'` is a colimit diagram exactly when its
images in X and in `Y'` are colimit diagrams (so the projections preserve K-indexed colimits), and every
diagram `K → X'` has a colimit (HTT, Lemma 5.4.5.5, p. 454). Route: a colimit is an initial object of an
under-category; apply §1.2.1 to the square of under-categories of §1.1.

*Needs:*
- §1.2.1 (HTT, Lemma 5.4.5.2);
- §1.1.2 (HTT, Lemma 5.4.5.4);
- Part InfinityCategoryFoundations §1.2.4 (HTT, Def. 1.2.13.4, p. 65);
- Part InfinityCategoryFoundations §5.5.4 (HTT, Prop. 1.2.12.9 and Rem. 1.2.13.5, pp. 64–65).

### 1.3 κ-filtered colimits and κ-compact objects in a categorical pullback

**1.3.1.** Prove that if, in a categorical pullback square as in §1.1, X and `Y'` admit small κ-filtered colimits and p
and q preserve them, then `X'` admits small κ-filtered colimits, and an object of `X'` is κ-compact whenever
its images in X, `Y'` and Y are κ-compact (HTT, Lemma 5.4.5.7, p. 455). Route: the first assertion is §1.2 for
κ-filtered K. For the second, reduce to κ-filtered diagrams indexed by nerves of κ-filtered partially ordered
sets through a cofinal map; the functors corepresented by the object and its images form a homotopy pullback
square of left fibrations, which unstraighten from a homotopy pullback square of strict diagrams of Kan
complexes indexed by the poset with a cone point adjoined. There, for a small filtered category C and `C^▷`
obtained by adjoining a terminal object, a homotopy pullback square `F' → F, G' → G` over `F → G ← G'` in
`Fun(C^▷, SSet)` with the projective model structure, with F, G and `G'` homotopy colimit diagrams, has `F'`
a homotopy colimit diagram (HTT, Lemma 5.4.5.6, p. 455): replace `F → G` by a projective fibration so that the
square is a strict pullback, and use that filtered colimits of simplicial sets commute with pullbacks and
preserve Kan fibrations and weak homotopy equivalences, and that the Kan–Quillen model structure is right
proper.

*Needs:*
- §1.2.2 (HTT, Lemma 5.4.5.5);
- ModelCategoryTheory, Part ModelCategories §7.2.1 (HTT, Prop. A.2.8.2, projective assertion, p. 848);
  ModelCategoryTheory, Part SimplicialCategories §3.2.1 (HTT, §A.2.8, homotopy colimit diagrams, p. 851);
- ModelCategoryTheory, Part KanQuillen §3.1.1, §3.3.1 and §3.4.1 (HTT, §A.2.7: weak homotopy equivalences, their
  stability under filtered colimits, right properness);
- Mathlib `HomotopicalAlgebra.ModelCategory` (HTT, Def. A.2.1.1, p. 828);
- Part PresheavesAndCompletions §4.1.1 (HTT, Def. 5.3.1.7, p. 400);
- Part InfinityCategoryFoundations §4.2.1 (HTT, Prop. 2.1.2.1, p. 78); Part InfinityCategoryFoundations §7.5.2 (HTT, Thm. 2.2.1.2, second
  assertion, p. 92); Part InfinityCategoryFoundations §6.2.1 (HTT, Def. 2.1.4.2, p. 86);
- Part CartesianFibrations §7.3.4 (HTT, Cor. 3.3.1.6, p. 226);
- Part LimitsAndKanExtensions §2.5.2 (HTT, Prop. 4.1.1.8, p. 244); Part LimitsAndKanExtensions §3.2.1 (HTT, Thm.
  4.2.4.1, p. 275, applied to `Kan` object by object through small full subcategories, as in its §3.3 (*Size*));
- Part PresheavesAndCompletions §4.4.1 (HTT, Prop. 5.3.1.18, p. 404);
- Part PresheavesAndCompletions §6.1.1 (HTT, Def. 5.3.4.5, p. 414); Part PresheavesAndCompletions §1.1.2 (HTT, §5.1.6, p. 346);
- ModelCategoryTheory, Part ModelCategories §4.2.1 (HTT, Prop. A.2.5.1, p. 835); ModelCategoryTheory, Part
  ModelCategories §3.5.1 (HTT, §A.2.4, p. 833).

### Examples

- For `Y = Δ[0]` the categorical pullback is the product `X × Y'`, and p and q preserve initial objects
  automatically; §1.2 then says that an object `(x, y')` of `X × Y'` is initial exactly when x and `y'` are
  initial, and that `X × Y'` has an initial object.
- In §1.2 the hypothesis that p and q preserve initial objects cannot be dropped: for `X = {1}`, `Y' = {0}`,
  `Y = N([1])` with the inclusions, the categorical pullback is empty (`[1]` has no isomorphism from 0 to 1),
  so it has no initial object, while X and `Y'` do; here p does not preserve initial objects.

### Dependencies

Part InfinityCategoryFoundations, Part CartesianFibrations, Part LimitsAndKanExtensions, Part
PresheavesAndCompletions; ModelCategoryTheory Parts ModelCategories, KanQuillen and SimplicialCategories.

## Layer 2: κ-compact diagrams, colimits and presheaves

### 2.1 Diagrams of κ-compact objects

**2.1.1.** Prove that if C admits small κ-filtered colimits, K is a κ-small simplicial set and `f : K → C` carries every
vertex to a κ-compact object, then f is a κ-compact object of `Fun(K, C)` (HTT, Prop. 5.3.4.13, p. 417).
Route: call K good when the statement holds for all such f. Good simplicial sets are closed under pushouts
along monomorphisms, because `Fun(−, C)` turns such a pushout into a categorical pullback square of functor
∞-categories whose restriction maps are categorical fibrations preserving κ-filtered colimits, so §1.3
applies; they are closed under categorical equivalences and under κ-small coproducts. Simplices are good since
the spine inclusion is a categorical equivalence and `Δ[1]` is good; conclude by induction over skeleta, and
for uncountable κ through the tower of skeleta.

*Needs:*
- §1.3.1 (HTT, Lemma 5.4.5.7);
- Part LimitsAndKanExtensions §8.2.2 (HTT, Prop. 5.1.2.2, p. 336; Cor. 5.1.2.3, p. 337); Part
  PresheavesAndCompletions §6.3.2 (HTT, Lemmas 5.3.4.9, 5.3.4.10 and 5.3.4.12, pp. 415–416);
- Part InfinityCategoryFoundations §9.3.1 (HTT, Cor. 2.2.5.4, p. 110);
- Part PresheavesAndCompletions §6.1.1 (HTT, Def. 5.3.4.5, p. 414); Part PresheavesAndCompletions §4.1.1 (HTT, Def. 5.3.1.7, p. 400); Part InfinityCategoryFoundations §1.1 (HTT, §1.2.15, p. 68).

### 2.2 κ-small colimits of κ-compact objects

**2.2.1.** Prove that if C admits small κ-filtered colimits and `p : K → C` is a κ-small diagram with κ-compact values,
then the left fibration `C_{p/} → C` is κ-compact (HTT, Cor. 5.3.4.14, p. 419). Route: by §2.1, p is κ-compact
in `Fun(K, C)`, so the left fibration `Fun(K, C)_{p/} → Fun(K, C)` is κ-compact; `C^{p/}`, the alternative
under-category, is its pullback along the diagonal, which preserves κ-filtered colimits, and `C_{p/}` and
`C^{p/}` are equivalent left fibrations.

*Needs:*
- §2.1.1 (HTT, Prop. 5.3.4.13);
- Part LimitsAndKanExtensions §8.2.2 (HTT, Prop. 5.1.2.2, p. 336); Part PresheavesAndCompletions §6.3.1 (HTT,
  Lemma 5.3.4.8, p. 414);
- Part LimitsAndKanExtensions §1.1.1 (HTT, Def. 4.2.1.1, p. 257); Part LimitsAndKanExtensions §1.2.1 (HTT, Prop.
  4.2.1.5, p. 259);
- Part PresheavesAndCompletions §6.1.1 (HTT, Def. 5.3.4.5, p. 414);
- Tau Ceti `SSet.LeftFibration` (HTT, Def. 2.0.0.3, p. 71).

**2.2.2.** Prove that if C admits small κ-filtered colimits, then the full subcategory `C^κ` is stable under all κ-small
colimits that exist in C (HTT, Cor. 5.3.4.15, p. 419). Route: for a colimit cone `p̄` of a κ-small diagram p
of compact objects, the cone point is initial in `C_{p/}`, the inclusion of the cone point into `K^▷` is right
anodyne so `C_{p̄/} → C_{c/}` is a trivial fibration, and the left fibration corepresented by the cone point
is equivalent to the κ-compact left fibration `C_{p/} → C` of §2.2.1.

*Needs:*
- §2.2.1 (HTT, Cor. 5.3.4.14);
- Part InfinityCategoryFoundations §4.3.2 (HTT, Prop. 2.1.2.5, p. 80); Part InfinityCategoryFoundations §5.5.4 (HTT, Rem. 1.2.13.5, p. 65);
- Part PresheavesAndCompletions §6.1.1 (HTT, Def. 5.3.4.5, p. 414); Part InfinityCategoryFoundations §1.2.4 (HTT, Def. 1.2.13.4, p. 65); Part InfinityCategoryFoundations §1.2.1 (HTT, §1.2.11, p. 62).

### 2.3 κ-compact presheaves

**2.3.1.** Prove that for a small ∞-category C and an object X of `P(C)`, X is κ-compact exactly when X is a retract of a
colimit of `j ∘ p` for some diagram `p : K → C` indexed by a κ-small simplicial set, where j is the Yoneda
embedding (HTT, Prop. 5.3.4.17, p. 420). Write `P^κ(C)` for the full subcategory of κ-compact presheaves.
Route: representables are κ-compact and κ-compact objects are stable under κ-small colimits (§2.2) and
retracts, which gives one direction. Conversely, X is the colimit of the κ-filtered diagram of κ-small
colimits of representables mapping to it; compactness of X makes the identity of X factor through one of them.

*Needs:*
- §2.2.2 (HTT, Cor. 5.3.4.15);
- Part PresheavesAndCompletions §1.3.4 (HTT, Lemma 5.1.5.3, p. 343); Part PresheavesAndCompletions §1.6.1 (HTT,
  Def. 5.1.6.2, p. 346; Prop. 5.1.6.8, p. 349); Part PresheavesAndCompletions §6.3.2 (HTT, Rem. 5.3.4.16, p.
  419);
- Part LimitsAndKanExtensions §6.3.3 (HTT, Cor. 4.2.3.11, p. 271);
- Part LimitsAndKanExtensions §8.1.1 (HTT, Def. 5.1.0.1, p. 333); Part PresheavesAndCompletions §1.1.1 (HTT, §5.1.3, p. 337); Part AdjunctionsAndLocalizations §2.1.2 (HTT, §4.4.5,
  p. 321, retracts).

**2.3.2.** Prove that for a small idempotent complete ∞-category C, C admits κ-small colimits exactly when the Yoneda
embedding `j : C → P^κ(C)` admits a left adjoint (HTT, Prop. 5.3.4.18, p. 420). Route: if C has κ-small
colimits, consider the presheaves M for which the functor `Map(M, j(−))` on C is corepresentable. Since C is
idempotent complete and has κ-small colimits, corepresentable functors on C are closed under retracts and
κ-small limits, so these M form a full subcategory of `P(C)` closed under retracts and κ-small colimits; it
contains the representables, hence `P^κ(C)` by §2.3.1, and the pointwise criterion for adjoints
gives a left adjoint of j. Conversely a left adjoint L with `L ∘ j` equivalent to the identity (j is fully
faithful) carries a colimit of `j ∘ p` in `P^κ(C)` to a colimit of p, and `P^κ(C)` has κ-small colimits by
§2.2.

*Needs:*
- §2.2.2 (HTT, Cor. 5.3.4.15); §2.3.1 (HTT, Prop. 5.3.4.17);
- Part LimitsAndKanExtensions §8.2.2 (HTT, Prop. 5.1.2.2, p. 336); Part PresheavesAndCompletions §1.3.2 (HTT,
  Prop. 5.1.3.2, p. 338); Part PresheavesAndCompletions §1.6.5 (HTT, Prop. 5.1.6.8, p. 349); Part
  AdjunctionsAndLocalizations §1.5.1 (HTT, Prop. 5.2.3.5, p. 367); Part AdjunctionsAndLocalizations §1.6.1 (HTT,
  Prop. 5.2.4.2, p. 368);
- Part AdjunctionsAndLocalizations §2.1.2 (HTT, §4.4.5, p. 321, retracts); Part InfinityCategoryFoundations §2.1.8 (HTT, §1.2.10, fully faithful functors);
  Part AdjunctionsAndLocalizations §1.1.3 (HTT, Def. 5.2.2.1, p. 358).

### Examples

- In the ∞-category S of spaces, a space is ω-compact exactly when it is a retract of a finite colimit of
  points; §2.2 shows that `S^ω` is closed under finite colimits, so the circle, the pushout of
  `Δ[0] ← ∂Δ[1] → Δ[0]`, is ω-compact, while the discrete space ℕ, a filtered colimit of finite sets not
  factoring through any stage, is not.
- For C the nerve of the category of sets and κ uncountable, §2.1 shows that a functor from the nerve of a
  finite poset to C with values sets of fewer than κ elements is κ-compact in `Fun(K, C)`; this agrees with
  the 1-categorical statement that finite diagrams of κ-presentable objects are κ-presentable in a functor
  category (Mathlib's notion of κ-presentable object).
- For C = `Δ[0]`, `P(C) = S` and §2.3 identifies the κ-compact spaces with retracts of κ-small colimits of the
  point.

### Dependencies

Layer 1; Part InfinityCategoryFoundations, Part LimitsAndKanExtensions, Part
AdjunctionsAndLocalizations, Part PresheavesAndCompletions.

## Layer 3: Essentially small ∞-categories and spaces

### 3.1 Essentially κ-small ∞-categories: five characterizations

**3.1.1.** Define, for κ uncountable regular, an ∞-category C to be **essentially κ-small** when there are a κ-small
∞-category D and an equivalence `D → C`, and **essentially small** when it is essentially κ-small for some
small regular κ (HTT, Def. 5.4.1.3, p. 439, taking condition (3) of HTT, Prop. 5.4.1.2 as the definition;
`Suggested.lean` declarations `IsEssentiallyCardinalSmall` and `IsEssentiallySmall`).

- Essential κ-smallness is invariant under equivalence of ∞-categories and passes to retracts in the homotopy
  category of `Cat∞` (§3.1.6).
- If C is essentially κ-small and κ < κ', then C is essentially κ'-small.
- An essentially κ-small ∞-category has fewer than κ equivalence classes of objects, and every homotopy set of
  each of its mapping spaces has fewer than κ elements (condition (1) of §3.1.7).

**Checks.**

- `Δ[0]` and the nerve of every finite category are essentially κ-small for every uncountable regular κ, with
  D itself. A definition requiring C itself to be κ-small would agree here but fail the next Check.
- `Sing` of the unit interval is a contractible Kan complex with continuum many vertices; it is equivalent to
  `Δ[0]` and so essentially ℵ₁-small. A definition by the size of the simplicial set itself would reject it.
- The nerve of a discrete category on a set of κ elements is not essentially κ-small: condition (1) of §3.1.7 fails,
  as it has κ equivalence classes of objects. A definition requiring only small mapping spaces (local smallness) would
  accept it.
- For an ordinary locally small category A, the nerve of A is essentially small exactly when A is equivalent
  to a small category, in agreement with Mathlib's essentially small categories: the category of finite sets,
  which has a large set of objects, is essentially small, and the category of all sets is not. A definition by
  the size of the set of objects would reject the first.

*Needs:* Part InfinityCategoryFoundations §1.1 (HTT, §1.2.15, p. 68); Mathlib `SSet.Quasicategory` (HTT, Def. 1.1.2.4, p. 32);
Part InfinityCategoryFoundations §2.1.6 (HTT, Def. 1.1.5.14, p. 43).

**3.1.2.** Prove the comparison of homotopies (HTT, Lemma 5.4.1.1, p. 437): for a simplicial category C, n ≥ 1
and `f₀ : ∂Δ[n] → N(C)` from X to Y, two extensions of `f₀` to `Δ[n]` are homotopic relative to `∂Δ[n]`
exactly when the corresponding extensions of the induced map `∂((Δ[1])^(n−1)) → Map_C(X, Y)` to the cube
`(Δ[1])^(n−1)` are homotopic relative to its boundary. Route: read both conditions as left homotopies in
under-categories, of the Joyal model structure and of the Bergner model structure, matched by the Quillen
equivalence between simplicial sets and simplicial categories (the rigidification of `Δ[n]` has the cube as
mapping space from 0 to n).

*Needs:* Part InfinityCategoryFoundations §9.6.1 (HTT, Thm. 2.2.5.1, Quillen equivalence part, p. 107);
Part InfinityCategoryFoundations §10.1.1 (HTT, §2.3.3, homotopy relative to a subset, p. 119); Part
InfinityCategoryFoundations §2.1.5 (HTT, Def. 1.1.5.5, p. 40); ModelCategoryTheory, Part SimplicialCategories
§5.4.2 (HTT, Prop. A.3.2.4, p. 876); Mathlib `HomotopicalAlgebra.ModelCategory` (HTT, Def. A.2.1.1, p. 828);
ModelCategoryTheory, Part ModelCategories §4.2.1 (HTT, Prop. A.2.5.1, p. 835).

**3.1.3.** Prove that, for κ uncountable regular, if an ∞-category C has fewer than κ equivalence classes of
objects and every homotopy set `π_i(Hom^R_C(X, Y), f)` has fewer than κ elements, then every minimal model of C
is κ-small (HTT, Prop. 5.4.1.2, implication (1) ⇒ (2), p. 437). Route: present C as the nerve of a
locally Kan simplicial category; by induction on n, each map `∂Δ[n] → C₀` into a minimal model has fewer
than κ fillers up to homotopy relative to the boundary, and minimality makes homotopic fillers equal. The
count rests on §3.1.2, then on counting homotopy classes of maps out of a cube through homotopy groups.

*Needs:* §3.1.2 (HTT, Lemma 5.4.1.1); Part InfinityCategoryFoundations §10.3.1 (HTT, Def.
2.3.3.1, p. 119); Part InfinityCategoryFoundations §8.1.2 (HTT, Thm. 2.2.0.1, p. 90; Prop. 2.2.4.1, p. 106);
Part InfinityCategoryFoundations §2.1.5 (HTT, Def. 1.1.5.5, p. 40); ModelCategoryTheory, Part KanQuillen §1.1
(HTT, §A.2.7, homotopy groups).

**3.1.4.** Prove that, for κ uncountable regular and an ∞-category C, C is essentially κ-small exactly when
some κ-small simplicial set admits a categorical equivalence to C, and that C is essentially κ-small when
every minimal model of it is κ-small (HTT, Prop. 5.4.1.2, implications (2) ⇒ (3) ⇒ (4) ⇒ (3), p. 438;
`Suggested.lean` declaration `isEssentiallyCardinalSmall_iff_exists_isCategoricalEquivalence`).
Route: attach fillers for all inner horns, countably many times; each stage is κ-small because κ is regular,
the union is κ-small because κ is uncountable, it is an ∞-category, and the inclusion of K is inner anodyne,
so the categorical equivalence to C extends to it. A minimal model is equivalent to C, which gives the second
assertion.

*Needs:* Part InfinityCategoryFoundations §6.1.1 (HTT, Lemma 2.2.5.2, p. 107); Part InfinityCategoryFoundations §10.4.1 (HTT, Prop.
2.3.3.8, p. 121); Part InfinityCategoryFoundations §2.1.6 (HTT, Def. 1.1.5.14, p. 43).

**3.1.5.** Prove that, for κ uncountable regular, an essentially κ-small ∞-category is κ-compact as an object
of `Cat∞` (HTT, Prop. 5.4.1.2, implication (3) ⇒ (5), p. 438). Route: a κ-filtered diagram in `Cat∞`
is, up to cofinal replacement, a diagram of fibrant marked simplicial sets indexed by a κ-filtered poset;
its ordinary colimit is a homotopy colimit and hence the colimit in `Cat∞`, and the functor corepresented by
C, which sends D to the largest Kan complex in `Fun(C, D)`, commutes with κ-filtered colimits because C is
κ-small. Prove also the case κ = ω for finite simplicial sets: for a finite simplicial set K and an inner
anodyne map `K → C` into an ∞-category, C is an ω-compact object of `Cat∞`; in particular every simplex
`Δ[n]` is (SAG, proof of Lemma 4.5.3.1, p. 403). The same route applies, since maps out of a finite
simplicial set commute with filtered colimits of simplicial sets; the five conditions of §3.1.7 are not
equivalent for κ = ω, so this case is stated on its own.

*Needs:* Tau Ceti `SSet.catInfty` (HTT, Def. 3.0.0.1, p. 162); Part LimitsAndKanExtensions §3.2.1 (HTT, Thm.
4.2.4.1, p. 275, applied to `(Set⁺_Δ)°` object by object through small full subcategories, as in its §3.3 (*Size*)); Part LimitsAndKanExtensions §3.1.1 (HTT, Prop. 4.2.4.4, p. 276); Part LimitsAndKanExtensions
§2.5.2 (HTT, Prop. 4.1.1.8, p. 244); Part PresheavesAndCompletions §1.3.3 (HTT, Lemma 5.1.5.2, p. 342); Part
PresheavesAndCompletions §4.4.1 (HTT, Prop. 5.3.1.18, p. 404); Part CartesianFibrations §5.7.1 (HTT, Prop.
3.1.3.7, p. 175: weak equivalences of marked simplicial sets are stable under filtered colimits).

**3.1.6.** Prove that, for κ uncountable regular, a κ-small ∞-category has fewer than κ equivalence classes of
objects and homotopy sets `π_i(Hom^R_C(X, Y), f)` of fewer than κ elements, and that this condition is
invariant under equivalence of ∞-categories and passes to retracts in the homotopy category of `Cat∞`
(HTT, Prop. 5.4.1.2, step in the proof of (5) ⇒ (1), p. 439). Route: a κ-small Kan complex has κ-small
homotopy groups, and an equivalence induces homotopy equivalences of right mapping spaces.

*Needs:* ModelCategoryTheory, Part KanQuillen §1.1 (HTT, §A.2.7, homotopy groups); Part InfinityCategoryFoundations §8.1.1
(HTT, Prop. 2.2.4.1, p. 106).

**3.1.7.** Prove that for κ uncountable regular the following conditions on an ∞-category C are equivalent (HTT, Prop.
5.4.1.2, p. 437): (1) C has fewer than κ equivalence classes of objects, and for every morphism `f : X → Y`
and every i ≥ 0 the homotopy set `π_i(Hom^R_C(X, Y), f)` has fewer than κ elements; (2) every minimal model of
C is κ-small; (3) C is essentially κ-small; (4) some κ-small simplicial set admits a categorical equivalence
to C; (5) C is κ-compact as an object of `Cat∞`. The implications (1) ⇒ (2), (2) ⇒ (3) ⇒ (4) ⇒ (3) and
(3) ⇒ (5) are §3.1.3–§3.1.5; what remains is (5) ⇒ (1) (HTT, Prop. 5.4.1.2, implication (5) ⇒ (1),
pp. 438–439). Route for it: C is the union of its κ-small sub-∞-categories, a κ-filtered
poset under inclusion, cofinal among κ-small simplicial subsets after countable horn completion; by the
computation of §3.1.5 the identity of C factors up to homotopy through one of them, so C is a retract of
a κ-small ∞-category in the homotopy category of `Cat∞`; apply §3.1.6.

*Needs:* §3.1.3, §3.1.4, §3.1.5, §3.1.6; Part InfinityCategoryFoundations §8.1.1 (HTT, Prop. 2.2.4.1, p. 106);
Part LimitsAndKanExtensions §3.2.1 (HTT, Thm.
4.2.4.1, p. 275, applied to `(Set⁺_Δ)°` object by object through small full subcategories, as in its §3.3 (*Size*)).

### 3.2 Essentially small spaces

**3.2.1.** Prove that for a Kan complex X and κ uncountable regular, the following are equivalent: (1) every homotopy set
`π_n(X, x)` has fewer than κ elements; (2) every minimal model of X is κ-small; (3) X is homotopy equivalent
to a κ-small Kan complex; (4) some κ-small simplicial set is weakly homotopy equivalent to X; (5) X is
κ-compact as an object of S; (6) X is essentially κ-small as an ∞-category (HTT, Cor. 5.4.1.5, p. 439,
condition (6) taken with the same κ). Route: (1), (2), (3) and (6) are equivalent by §3.1, since every
morphism of a Kan complex is invertible. (3) ⇒ (4) is clear. (4) ⇒ (5): for a weak homotopy equivalence
`K → X` with K κ-small, the colimit in S of the constant diagram on K with value the point is κ-compact, as a
κ-small colimit of the point, which is κ-compact (§2.2); and this colimit is the weak homotopy type of K,
since the left fibration classified by the colimit cone `K^▷ → S` (in the sense of Part InfinityCategoryFoundations §7.1; it
exists by Part InfinityCategoryFoundations §7.7 (4)) restricts to weak homotopy equivalences over K and over
the cone point, so it is equivalent to X. (5) ⇒ (1): as in §3.1, X is the κ-filtered union of its κ-small
subcomplexes, so it is a retract in the homotopy category of one of them.

*Needs:*
- §3.1.7 (HTT, Prop. 5.4.1.2);
- §2.2.2 (HTT, Cor. 5.3.4.15);
- Part PresheavesAndCompletions §1.3.3 (HTT, Lemma 5.1.5.2, p. 342); Part PresheavesAndCompletions §1.6.5 (HTT,
  Prop. 5.1.6.8, p. 349);
- Part LimitsAndKanExtensions §8.3.1 (HTT, Prop. 3.3.4.5, p. 237); Part LimitsAndKanExtensions §5.2.2 (HTT, Prop.
  4.1.2.15, p. 252); Part LimitsAndKanExtensions §3.2.1 (HTT, Thm. 4.2.4.1, p. 275, applied to `Kan` object by object through small full subcategories, as in its §3.3 (*Size*));
- Part InfinityCategoryFoundations §10.3.1 (HTT, Def. 2.3.3.1, p. 119);
- Part InfinityCategoryFoundations §7.1.6 (classification of left fibrations by maps to S) and §7.7.1 (4) (HTT, Cor. 3.3.2.8,
  p. 231, unmarked form);
- ModelCategoryTheory, Part KanQuillen §3.1.1 (HTT, §A.2.7, weak homotopy equivalences);
- Tau Ceti `TauCeti.HasSmallSpaceModel`.

### 3.3 Cartesian fibrations with small base and fibers

**3.3.1.** Prove that if `p : C → D` is a Cartesian fibration of ∞-categories, κ is uncountable regular, D is
essentially κ-small and every fiber `C_D` is essentially κ-small, then C is essentially κ-small (HTT, Prop. 5.4.1.4,
p. 439). Route: verify condition (1) of §3.1 for C. Every object of C is equivalent to one lying over a representative
of an equivalence class of D, which bounds the equivalence classes of C; mapping spaces of C sit in fiber sequences
over mapping spaces of D with fibers mapping spaces of fibers, and the long exact sequence bounds their homotopy sets.
The `Suggested.lean` declaration is `isEssentiallyCardinalSmall_of_cartesianFibration`.

*Needs:*
- §3.1.1 (HTT, Def. 5.4.1.3; Prop. 5.4.1.2, (1) ⇒ (2), (5) ⇒ (1) and the invariance step);
- Part CartesianFibrations §1.7.2 (HTT, Prop. 2.4.4.2, p. 149); Part CartesianFibrations §1.3.1 (HTT, Prop.
  2.4.1.5, p. 134);
- ModelCategoryTheory, Part KanQuillen §1.2.1 (HTT, §A.2.7, the long exact sequence of a Kan fibration);
- Tau Ceti `SSet.Edge.IsCartesian` and `SSet.CartesianFibration` (HTT, Def. 2.4.1.1, p. 133; Def. 2.4.2.1, p.
  139).

### Examples

- `Sing` of the circle has homotopy groups ℤ in degree 1 and 0 above, all countable, so by §3.2 it is
  essentially ℵ₁-small although it has continuum many vertices. The discrete space on a set of ℵ₁ points is
  not essentially ℵ₁-small, since its π₀ has ℵ₁ elements.
- For n = 0, the ω-compactness of `Δ[n]` in `Cat∞` (§3.1) says that the core, the largest Kan complex
  contained in an ∞-category, commutes with filtered colimits in `Cat∞`; in particular so does the set of
  equivalence classes of objects.
- For the fibration `C × D → D` of §3.3, the conclusion is that a product of two essentially κ-small
  ∞-categories is essentially κ-small.

### Dependencies

Layer 2; Part InfinityCategoryFoundations, Part CartesianFibrations, Part LimitsAndKanExtensions, Part
PresheavesAndCompletions; ModelCategoryTheory Parts ModelCategories, KanQuillen and SimplicialCategories; Tau
Ceti `SSet.catInfty`, `SSet.CartesianFibration`, `TauCeti.HasSmallSpaceModel`.

## Layer 4: Accessibility, local smallness and compact objects of `Ind_κ`

### 4.1 Accessible ∞-categories and accessible functors

**4.1.1.** Define an ∞-category `C` to be κ-accessible when there are a small ∞-category `C₀` and a categorical
equivalence `Ind_κ(C₀) → C`, and accessible when it is κ-accessible for some regular κ (HTT, Def. 5.4.2.1,
p. 441).

- κ-accessibility is invariant under equivalence of ∞-categories: compose the equivalence `Ind_κ(C₀) → C` with
  an equivalence `C → C'`.
- A κ-accessible ∞-category has small κ′-filtered colimits for every regular κ′ ≥ κ, since κ′-filtered
  implies κ-filtered (Part PresheavesAndCompletions §4.1) and `Ind_κ(C₀)` has small κ-filtered colimits (Part
  PresheavesAndCompletions §6.4, HTT, Prop. 5.3.5.3, p. 421).

**Checks.**
- `∅` and `Δ[0]` are κ-accessible for every κ: `Ind_κ(∅)` is `∅` and `Ind_κ(Δ[0])` is equivalent to `Δ[0]`
  (Part PresheavesAndCompletions §6.1).
- `Δ[0] ⊔ Δ[0]` is ω-accessible, being equivalent to `Ind(Δ[0] ⊔ Δ[0])` (Part PresheavesAndCompletions §6.1),
  but has no coproduct of its two objects. A definition asking for colimits beyond the filtered ones would
  reject it.
- The nerve of a large discrete set (one object for each small set, only identities) is not accessible. In a
  discrete ∞-category a κ-filtered diagram is constant, since κ-filtered simplicial sets are connected; so in
  `Ind_κ(C₀)`, whose objects are κ-filtered colimits of representables (Part PresheavesAndCompletions §6.4),
  every object would be equivalent to one from the small `C₀`. A definition asking only for κ-filtered
  colimits would accept it.

*Needs:* Part PresheavesAndCompletions §6.1.2 (HTT, Def. 5.3.5.1, `Ind_κ`) and §6.4.2 (HTT, Cor. 5.3.5.4, for the
third Check); Part InfinityCategoryFoundations §2.1.6 (categorical equivalences).

**4.1.2.** Define a functor `F : C → C′` out of an accessible ∞-category to be accessible when it is κ-continuous for some
regular κ for which `C` has small κ-filtered colimits (HTT, Def. 5.4.2.5, p. 443). The target need not be
accessible (HTT, Rem. 5.4.2.6, p. 443); Mathlib's `CategoryTheory.Functor.IsAccessible` asks for accessible
categories on both sides.

- If `F` is κ-continuous and `C` is κ-accessible, then `F` is κ′-continuous for every regular κ′ ≥ κ: a
  κ′-filtered diagram is κ-filtered (Part PresheavesAndCompletions §4.1), and `C` has its colimit (the second
  bullet above).
- A composite `G ∘ F` of accessible functors `F : C → C′`, `G : C′ → C″` between accessible ∞-categories is
  accessible: at a regular cardinal at least the cardinals of `F`, `G` and of the accessibility of `C` and `C′`,
  both are continuous by the previous bullet, and `F` carries the colimits it preserves to colimits that `G`
  preserves.

**Checks.**
- `X ↦ X × X` on S is accessible: it is ω-continuous, since filtered colimits in S commute with finite
  products. It does not preserve binary coproducts, as `(X ⊔ Y) × (X ⊔ Y)` has four summands, so a definition
  asking accessible functors to preserve all small colimits would reject it.
- Continuity is asked at one κ only: `X ↦ X^ℕ` on the nerve of sets is ℵ₁-continuous, since countable
  products of sets commute with ℵ₁-filtered colimits, but not ω-continuous, since `ℕ^ℕ` is not the union of the
  `F^ℕ` over the finite subsets `F ⊆ ℕ`. It is accessible; a definition asking for ω-continuity, or for
  κ-continuity at every regular κ, which for this functor fails only at κ = ω, would reject it.
- The covariant power-set functor on the nerve of sets is not accessible: for every regular κ, a set `X` of
  size κ is the κ-filtered union of its subsets of size below κ, and `X ∈ P(X)` lies in no `P` of a stage. So
  not every functor between accessible ∞-categories is accessible.

*Needs:* Part PresheavesAndCompletions §6.1.1 (HTT, Def. 5.3.4.5, κ-continuous functors), §4.1.1 (HTT,
Def. 5.3.1.7, p. 400) and §6.4.1 (HTT, Prop. 5.3.5.3, p. 421); §4.1.1.

### 4.2 Local smallness of functor ∞-categories

**4.2.1.** Prove that for an ∞-category C the following are equivalent: every mapping space `Map_C(X, Y)` is
essentially small; every full subcategory of C spanned by a small set of objects is essentially small (HTT, Prop.
5.4.1.7, p. 441). This is the characterization of locally small ∞-categories, Tau Ceti's `SSet.IsLocallySmall` (HTT,
Def. after Prop. 5.4.1.7, p. 441). Route: for a small set S of objects, the condition (1) of §3.1 for the full
subcategory on S holds at some small regular κ bounding the homotopy sets of the essentially small mapping spaces
(§3.2); conversely the full subcategory on `{X, Y}` has mapping space `Map_C(X, Y)`, and §3.1 (1) bounds its homotopy
sets. The `Suggested.lean` declaration is `isLocallySmall_iff_forall_isEssentiallySmall`.

*Needs:*
- §3.1.1 (HTT, Def. 5.4.1.3; Prop. 5.4.1.2, (5) ⇒ (1)); §3.2.1 (HTT, Cor. 5.4.1.5);
- Part InfinityCategoryFoundations §1.2.1 (HTT, §1.2.11, p. 62); Part InfinityCategoryFoundations §1.1 (HTT, §1.2.15, p. 68).

**4.2.2.** Prove that if C is locally small and D is essentially small, then `Fun(D, C)` is locally small; in
particular `P(D)` is locally small for every small ∞-category D (HTT, Example 5.4.1.8, p. 441). Route: replace C and D
by minimal models; every small set of functors `D → C` factors through the full subcategory of C on a small set of
objects, which is essentially small by §4.2.1, so the corresponding full subcategory of `Fun(D, C)` is a full
subcategory of a functor ∞-category between essentially small ∞-categories. The `Suggested.lean` declaration is
`isLocallySmall_ihom`.

*Needs:*
- §4.2.1 (HTT, Prop. 5.4.1.7); §3.1.3 (HTT, Prop. 5.4.1.2, (1) ⇒ (2)) and §3.1.7 (HTT, Prop. 5.4.1.2, (5) ⇒ (1));
- Part InfinityCategoryFoundations §10.3.1 (HTT, Def. 2.3.3.1, p. 119); Part InfinityCategoryFoundations §10.4.1 (HTT, Prop. 2.3.3.8, p. 121);
- Tau Ceti `SSet.IsLocallySmall` (HTT, Def. after Prop. 5.4.1.7, p. 441); Part InfinityCategoryFoundations §1.2.1 (HTT,
  §1.2.11, p. 62).

### 4.3 `P(C)` as `Ind_κ` of its κ-compact presheaves

**4.3.1.** Prove that for a small ∞-category C, the ∞-category `P^κ(C)` is essentially small, and that for a small
∞-category D with an equivalence `i : D → P^κ(C)`, the κ-continuous functor `F : Ind_κ(D) → P(C)` extending i
along the Yoneda embedding is an equivalence (HTT, Prop. 5.3.5.12, p. 426). Route: `P(C)` is locally small
(§4.2) and, by §2.3, every compact presheaf is a retract of a κ-small colimit of representables, so `P^κ(C)`
has a small set of equivalence classes of objects and is essentially small (§4.2). By the recognition
criterion for `Ind_κ` (Part PresheavesAndCompletions §6.5 (HTT, Prop. 5.3.5.11, p. 425)), F is an equivalence
because i is fully faithful with κ-compact values and every presheaf is a κ-filtered colimit of κ-compact
ones: write it as a colimit of representables and regroup that colimit as a κ-filtered colimit of κ-small
colimits of representables, which are κ-compact by §2.2.

*Needs:*
- §2.2.2 (HTT, Cor. 5.3.4.15); §2.3.1 (HTT, Prop. 5.3.4.17);
- §4.2.1 (HTT, Prop. 5.4.1.7; Example 5.4.1.8);
- Part PresheavesAndCompletions §1.3.4 (HTT, Lemma 5.1.5.3, p. 343); Part PresheavesAndCompletions §6.5.3, §6.5.4 (HTT,
  Props. 5.3.5.10–5.3.5.11, pp. 424–425);
- Part LimitsAndKanExtensions §6.3.3 (HTT, Cor. 4.2.3.11, p. 271);
- Part PresheavesAndCompletions §6.1.2 (HTT, Def. 5.3.5.1, p. 421); Part AdjunctionsAndLocalizations §2.1.2 (HTT, §4.4.5, p. 321, retracts).

### 4.4 Compact objects of `Ind_κ` and idempotent completion

**4.4.1.** Prove that for a small ∞-category C, the Yoneda embedding exhibits the full subcategory of κ-compact objects
of `Ind_κ(C)` as an idempotent completion of C; in particular it is essentially small (HTT, Lemma 5.4.2.4, p.
442). Route: representables are κ-compact and j is fully faithful; the κ-compact objects are stable under
retracts. Conversely a κ-compact object X is the colimit of the κ-filtered ∞-category `C_{/X}` of
representables over it, so its identity factors through a representable and X is a retract of one. Idempotent
completions of small ∞-categories are essentially small.

*Needs:*
- Part PresheavesAndCompletions §1.3.1 (HTT, Prop. 5.1.3.1, p. 338; Lemmas 5.1.5.2–5.1.5.3, pp. 342–343), Part
  PresheavesAndCompletions §4.3.1 (HTT, Rem. 5.3.1.10, p. 401); Part PresheavesAndCompletions §3.1.1 (HTT, Def.
  5.1.4.1, p. 339); Part PresheavesAndCompletions §3.3.2 (HTT, Rem. 5.1.4.10, p. 342); Part
  PresheavesAndCompletions §6.3.2 (HTT, Rem. 5.3.4.16, p. 419); Part PresheavesAndCompletions §6.4.3 (HTT, Prop.
  5.3.5.5, p. 422);
- Part LimitsAndKanExtensions §8.3.1 (HTT, Prop. 3.3.4.5, p. 237);
- Part PresheavesAndCompletions §6.1.2 (HTT, Def. 5.3.5.1, p. 421); Part AdjunctionsAndLocalizations §2.1.2 (HTT, §4.4.5, p. 321, retracts).

### 4.5 τ-filtered colimits of representables are retracts

**4.5.1.** Prove that, for uncountable regular κ < τ, for a τ-filtered partially ordered set A and a τ-small family of diagrams `F_β : A → SSet` of
essentially κ-small Kan complexes, every τ-small subset of A lies in a filtered τ-small subset `A₀` such
that every map `colim_{A₀} F_β → colim_A F_β` of ordinary colimits is a homotopy equivalence (HTT, Lemma
5.4.3.1, p. 446, one diagram; Lemma 5.4.3.2 and its proof, p. 447, the family, whose induction may start
from the given subset). Route: for one diagram, enlarge the subset countably often, each time adding fewer
than τ indices that kill the failures of lifting `∂Δ[n] → Δ[n]` against the comparison map up to homotopy;
there are fewer than τ such failures because each `F(α)` is homotopy equivalent to a κ-small Kan complex.
For the family, interleave these enlargements along one countable sequence; τ is regular and the family
τ-small.

*Needs:* §3.2.1 (HTT, Cor. 5.4.1.5); §3.1.1 (HTT, Def. 5.4.1.3); ModelCategoryTheory, Part KanQuillen §1.3.3 and
§3.1.1 (HTT, §A.2.7, weak homotopy equivalences and Whitehead's theorem); Part PresheavesAndCompletions §4.1.1 (HTT, Def.
5.3.1.7, p. 400); Mathlib `SSet.KanComplex`.

**4.5.2.** Prove that, for uncountable regular κ < τ, a τ-small ∞-category C whose mapping spaces are essentially κ-small with Yoneda embedding `j : C → P(C)`, a diagram `p : K → C` indexed by a τ-filtered ∞-category and a colimit `p̄` of `j ∘ p` in `P(C)`, there is a map `i : K₀ → K` from a
τ-small ∞-category such that `p̄ ∘ i^▷` is still a colimit diagram (HTT, Lemma 5.4.3.3, p. 447). Route:
reduce to K the nerve of a τ-filtered poset by a cofinal map; model `p̄` evaluated at each object of C by
strict diagrams of Kan complexes with essentially κ-small values (the Yoneda lemma), and apply the first
step to the τ-small family indexed by the objects of C.

*Needs:* §4.5.1 (HTT, Lemmas 5.4.3.1–5.4.3.2); Part LimitsAndKanExtensions §3.2.1 (HTT, Thm. 4.2.4.1,
p. 275, applied to `Kan` object by object through small full subcategories, as in its §3.3 (*Size*)); Part LimitsAndKanExtensions §3.1.1 (HTT, Prop. 4.2.4.4, p. 276); Part LimitsAndKanExtensions §2.5.2
(HTT, Prop. 4.1.1.8, p. 244); Part LimitsAndKanExtensions §8.2.2 (HTT, Prop. 5.1.2.2, p. 336); Part
PresheavesAndCompletions §1.3.3 (HTT, Lemma 5.1.5.2, p. 342); Part PresheavesAndCompletions §4.4.1 (HTT, Prop.
5.3.1.18, p. 404); Part InfinityCategoryFoundations §2.1.5 (HTT, Def. 1.1.5.5, p. 40).

**4.5.3.** Fix uncountable regular κ < τ and a τ-small ∞-category C whose mapping spaces are essentially κ-small, with Yoneda embedding `j : C → P(C)`. the retract statement and its corollary (HTT, Prop. 5.4.3.4 and Cor. 5.4.3.5, p. 448). Route: by the
second step X is a colimit over a τ-small `K₀ → K`; since K is τ-filtered, `K₀ → K` extends to a cone
`K₀^▷ → K` with cone point some object k, and the map from X to `j(p(k))` followed by the colimit map back
exhibits X as a retract, since colimits are initial objects of under-categories. Every object of `Ind_τ(C)`
is such a colimit, hence a retract of a representable, and `Ind_τ(C)` is idempotent complete because it has
τ-filtered colimits.

*Needs:* §4.5.2 (HTT, Lemma 5.4.3.3); Part InfinityCategoryFoundations §5.5.4 (HTT, Prop. 1.2.12.9 and Rem.
1.2.13.5, pp. 64–65); Part PresheavesAndCompletions §1.3.1 (HTT, Prop. 5.1.3.1, p. 338), Part
PresheavesAndCompletions §4.3.1 (HTT, Rem. 5.3.1.10, p. 401); Part PresheavesAndCompletions §3.1.1 (HTT, Def.
5.1.4.1, p. 339); Part PresheavesAndCompletions §6.4.1, §6.4.2 (HTT, Prop. 5.3.5.3 and Cor. 5.3.5.4, pp. 421–422);
Part PresheavesAndCompletions §4.1.1 (HTT, Def. 5.3.1.7, p. 400); Part AdjunctionsAndLocalizations §2.1.2 (HTT, §4.4.5, p. 321, retracts); Part PresheavesAndCompletions §1.1.1 (HTT, §5.1.3, p. 337).

### 4.6 `Ind_κ` commutes with finite poset diagrams

**4.6.1.** Prove that for a small ∞-category C, κ regular, j the Yoneda embedding `C → Ind_κ(C)` and A a finite partially
ordered set, the functor `j' : Fun(N(A), C) → Fun(N(A), Ind_κ(C))` induces an equivalence
`Ind_κ(Fun(N(A), C)) → Fun(N(A), Ind_κ(C))`; equivalently, every diagram `N(A) → Ind_κ(C)` is, essentially
uniquely, a κ-filtered colimit of diagrams in C (HTT, Prop. 5.3.5.15, p. 428). The statement fails for finite
simplicial sets in place of `N(A)` (HTT, Warning 5.3.5.16, p. 428). By the recognition criterion for `Ind_κ`
(Part PresheavesAndCompletions §6.5 (HTT, Prop. 5.3.5.11, p. 425)) it is the conjunction of the following
three statements, each with its own route.

- Prove that `j'` is fully faithful and that its essential image consists of κ-compact objects of
  `Fun(N(A), Ind_κ(C))` (HTT, Prop. 5.3.5.15, proof steps (i)–(ii), p. 428). Route: j is fully faithful with
  κ-compact values in `Ind_κ(C)`, which has small κ-filtered colimits; apply §2.1.

  *Needs:* §2.1.1 (HTT, Prop. 5.3.4.13); Part PresheavesAndCompletions §1.3.1 (HTT, Prop. 5.1.3.1, p. 338); Part
  PresheavesAndCompletions §6.4.1 (HTT, Prop. 5.3.5.3, p. 421; Prop. 5.3.5.5, p. 422).
- Prove that for `F : N(A) → Ind_κ(C)`, the ∞-category D of pairs of a diagram `N(A) → C` and a map of its
  image to F, the pullback of `Fun(N(A), Ind_κ(C))_{/F}` along `j'`, is κ-filtered (HTT, Prop. 5.3.5.15, proof
  step (a), pp. 428–429). Route: it suffices to extend diagrams indexed by κ-small posets; enumerate A along a
  linear extension and extend one element `a` at a time. Each extension is an object of an under-category of
  `C_{/F(a)}`, under a κ-small diagram, which is κ-filtered because `F(a)` lies in `Ind_κ(C)`, after replacing
  `N(A_{≥a})` by `{a}` along a left anodyne inclusion.

  *Needs:* Part PresheavesAndCompletions §1.3.3 (HTT, Lemma 5.1.5.2, p. 342); Part PresheavesAndCompletions §4.2.1
  (HTT, Rem. 5.3.1.12, p. 401); Part PresheavesAndCompletions §6.1.2 (HTT, Def. 5.3.5.1, p. 421); Part InfinityCategoryFoundations §4.3.2
  (HTT, Prop. 2.1.2.5, p. 80).
- Prove that F is a colimit of the forgetful diagram `D → Fun(N(A), C) → Fun(N(A), Ind_κ(C))`, which completes
  the proof of the equivalence (HTT, Prop. 5.3.5.15, proof step (b), pp. 428–429). Route: colimits in a
  functor ∞-category are computed pointwise; at `a ∈ A` the map `D → D(a)` to the corresponding ∞-category for
  `F(a)` is cofinal by Theorem A, its comma ∞-categories being κ-filtered by the argument of the previous step
  and hence weakly contractible, and `F(a)` is the colimit of `D(a)` because it lies in `Ind_κ(C)`.

  *Needs:* the two previous statements of §4.6.1 (HTT, Prop. 5.3.5.15, steps (i)–(ii) and (a)); Part
  LimitsAndKanExtensions §5.4.2 (HTT, Thm. 4.1.3.1, p. 254); Part LimitsAndKanExtensions §2.5.2 (HTT, Prop.
  4.1.1.8, p. 244); Part LimitsAndKanExtensions §8.2.3 (HTT, Cor. 5.1.2.3, p. 337), Part
  PresheavesAndCompletions §4.3.2 (HTT, Lemma 5.3.1.20, p. 406); Part PresheavesAndCompletions §1.3.4 (HTT, Lemma
  5.1.5.3, p. 343); Part PresheavesAndCompletions §6.5.4 (HTT, Prop. 5.3.5.11, p. 425).

*Needs:* for the equivalence, the three statements of §4.6.1 (HTT, Prop. 5.3.5.15, steps (i)–(ii), (a), (b));
Part PresheavesAndCompletions §6.5.4 (HTT, Prop. 5.3.5.11, p. 425).

### Examples

- The ∞-category S is locally small (its mapping spaces are small Kan complexes) and not essentially small,
  since it has a large set of equivalence classes of objects; §4.2 then says that all its full subcategories
  on small sets of objects are essentially small.
- For the nerve of an ordinary category, §4.2 reduces to the statement that a category is locally small
  exactly when its full subcategories on small sets of objects are essentially small, which matches Tau Ceti's
  comparison of local smallness for nerves with Mathlib's locally small categories.
- For C = `Δ[0]` the compact presheaves of §4.3 are the κ-compact spaces, and §4.3 says that S is `Ind_κ` of
  the essentially small ∞-category of κ-compact spaces; for κ = ω these are the retracts of finite spaces.
- The compact objects of `Ind(C)` need not come from C (HTT, Example 5.4.2.3, p. 442): for C the category of
  finitely generated free modules over a ring R, `Ind(C)` is the category of flat R-modules and its compact
  objects are the finitely generated projective modules, which are the retracts of free ones, as §4.4
  predicts, but need not be free. Mathlib's Karoubi envelope is the 1-categorical idempotent completion
  compared here.
- In §4.6 with A a one-element poset, the statement is the identity of `Ind_κ(C)`; with A = `{0 < 1}` it says
  that every morphism of `Ind_κ(C)` is a κ-filtered colimit of morphisms of C.

### Dependencies

Layers 2–3; Part InfinityCategoryFoundations, Part LimitsAndKanExtensions, Part AdjunctionsAndLocalizations, Part
PresheavesAndCompletions; ModelCategoryTheory, Part KanQuillen; Tau Ceti `SSet.IsLocallySmall`.

## Layer 5: The generator characterization and change of cardinal

### 5.1 The generator characterization and presheaf ∞-categories

**5.1.1.** Prove that for an ∞-category C and κ regular the following are equivalent: (1) C is κ-accessible; (2) C is
locally small, admits small κ-filtered colimits, the subcategory `C^κ` is essentially small and generates C
under small κ-filtered colimits; (3) C admits small κ-filtered colimits and contains an essentially small full
subcategory of κ-compact objects generating C under small κ-filtered colimits (HTT, Prop. 5.4.2.2, p. 441).
Route: from (1), take `C = Ind_κ(C₀)` with `C₀` small; it is locally small as a full subcategory of `P(C₀)`
(§4.2), has κ-filtered colimits and is generated by the image of `C₀`; its κ-compact objects form the
idempotent completion of `C₀`, essentially small by §4.4. (2) implies (3) trivially. From (3), the extension
`Ind_κ(C₀') → C` of the inclusion of the generating subcategory is fully faithful because its objects are
κ-compact and essentially surjective because they generate.

*Needs:*
- §4.4.1 (HTT, Lemma 5.4.2.4); §4.2.2 (HTT, Example 5.4.1.8);
- Part PresheavesAndCompletions §6.4.1, §6.4.2, §6.4.3 (HTT, Prop. 5.3.5.3, Cor. 5.3.5.4, Prop. 5.3.5.5, pp. 421–422), Part
  PresheavesAndCompletions §6.5.3, §6.5.4 (HTT, Props. 5.3.5.10–5.3.5.11, pp. 424–425) and Part PresheavesAndCompletions
  §6.1.1 (HTT, Notation 5.3.4.6, p. 414);
- §4.1.1 (HTT, Def. 5.4.2.1, p. 441); Tau Ceti `SSet.IsLocallySmall` (HTT, Def. after Prop. 5.4.1.7, p. 441); Part
  PresheavesAndCompletions §6.1.1 (HTT, Def. 5.3.4.5, p. 414; Def. 5.3.5.1, p. 421).

**5.1.2.** Prove that for every small ∞-category C, `P(C)` is accessible; in particular S is accessible (HTT, Example
5.4.2.7, p. 443). Route: §4.3 presents `P(C)` as `Ind_κ` of a small ∞-category, and `S = P(Δ[0])`.

*Needs:*
- §4.3.1 (HTT, Prop. 5.3.5.12);
- Part LimitsAndKanExtensions §8.1.1 (HTT, Def. 5.1.0.1, p. 333); §4.1.1 (HTT, Def. 5.4.2.1, p. 441).

### 5.2 Raising the cardinal and uniformization

**5.2.1.** For κ < κ' with κ ≪ κ', the order-theoretic lemma behind raising the cardinal (HTT, Lemma 5.4.2.8, p. 443:
every κ-filtered partially ordered set is the union of its κ-filtered κ'-small subsets, and these form a
κ'-filtered partially ordered set under inclusion; only κ-filteredness is used, and the application below
needs exactly this form) is Mathlib's `Cardinal.SharplyLT.exists_isCardinalFiltered_set` and
`Cardinal.SharplyLT.IsCardinalFilteredAndHasCardinalLT.isCardinalFiltered_subtype`, reached from κ ≪ κ'
through `Cardinal.SharplyLT.of_pow_lt`. Prove the case κ = κ' (κ = ω, or κ strongly inaccessible) (HTT, Lemma
5.4.2.8, p. 443). Route: a κ-small subset together with an upper bound has a largest element and so is
κ-filtered; every element lies in such a subset, and a union of fewer than κ such subsets with upper bounds
adjoined is again κ-small because κ is regular, which gives both assertions.

*Needs:*
- ModelCategoryTheory, Part ModelCategories §5.2.1 (HTT, Def. A.2.6.3, p. 837);
- Mathlib `Cardinal.SharplyLT.of_pow_lt`, `Cardinal.SharplyLT.exists_isCardinalFiltered_set`,
  `Cardinal.SharplyLT.IsCardinalFilteredAndHasCardinalLT.isCardinalFiltered_subtype` (the case κ < κ');
- Part PresheavesAndCompletions §4.1.1 (HTT, Def. 5.3.1.7, p. 400).

**5.2.2.** Prove that a κ-accessible ∞-category C is κ'-accessible for every κ' with κ ≪ κ' (HTT, Prop. 5.4.2.9, p. 444);
κ < κ' alone does not suffice (HTT, Rem. 5.4.2.10, p. 444). Route: use §5.1 (3). The κ'-small colimits of
κ-compact objects are κ'-compact (§2.2, applied with κ' after noting κ-compact objects are κ'-compact), and
their full subcategory is essentially small because C is locally small and it has a bounded set of equivalence
classes (§4.2). Every object is a κ-filtered colimit of κ-compact objects indexed by a κ-filtered poset; by
§5.2.1 this poset is a κ'-filtered union of κ'-small κ-filtered subposets, which exhibits the
object as a κ'-filtered colimit of κ'-small κ-filtered colimits.

*Needs:*
- §5.2.1 and, for κ < κ', Mathlib (HTT, Lemma 5.4.2.8); §5.1.1 (HTT, Prop. 5.4.2.2); §2.2.2
  (HTT, Cor. 5.3.4.15); §4.2.1 (HTT, Prop. 5.4.1.7);
- Part LimitsAndKanExtensions §6.2.2 (HTT, Prop. 4.2.3.4, p. 267) and §6.3.2 (HTT,
  Prop. 4.2.3.8, p. 270);
- Part PresheavesAndCompletions §4.4.1 (HTT, Prop. 5.3.1.18, p. 404);
- ModelCategoryTheory, Part ModelCategories §5.2.1 (HTT, Def. A.2.6.3, p. 837);
- §4.1.1 (HTT, Def. 5.4.2.1, p. 441); Tau Ceti `SSet.IsLocallySmall` (HTT, Def. after Prop. 5.4.1.7, p. 441).

**5.2.3.** Prove that if C is accessible, then `C^κ` is essentially small for every regular κ (HTT, Rem. 5.4.2.11, p.
444), and every object of C is τ-compact for all sufficiently large regular τ (used in the proof of HTT, Cor.
5.4.5.16, p. 461). Route: enlarging κ only enlarges `C^κ`, since κ-compact objects are κ'-compact for κ ≤ κ';
by §5.2.2 choose κ' ≥ κ with C κ'-accessible, and §5.1 (2) makes `C^{κ'}` essentially small,
hence also its full subcategory `C^κ` (§4.2). An object X is, by §5.1 (2), a colimit of a small κ-filtered
diagram of κ-compact objects; for τ ≥ κ larger than the size of the indexing simplicial set this diagram is
τ-small with τ-compact values, so X is τ-compact by §2.2.

*Needs:*
- §5.2.2 (HTT, Prop. 5.4.2.9); §5.1.1 (HTT, Prop. 5.4.2.2); §4.2.1 (HTT, Prop. 5.4.1.7);
  §3.1.1 (HTT, Def. 5.4.1.3); §2.2.2 (HTT, Cor. 5.3.4.15);
- Part PresheavesAndCompletions §6.1.1 (HTT, Def. 5.3.4.5, p. 414); §4.1.1 (HTT, Def. 5.4.2.1, p. 441);
  Part InfinityCategoryFoundations §1.1 (HTT, §1.2.15, p. 68).

**5.2.4.** Prove the **uniformization** of one accessible functor: for an accessible functor `F : C → D` between
accessible ∞-categories there are arbitrarily large regular κ such that C and D are κ-accessible, F is
κ-continuous and F carries `C^κ` into `D^κ` (HTT, Rem. 5.4.2.13, p. 444); then F is determined up to
equivalence by its restriction to `C^κ` (Part PresheavesAndCompletions §6.5 (HTT, Prop. 5.3.5.10, p. 424)).
Route: choose τ with F τ-continuous and, by §5.2.2, C and D τ-accessible. The essentially small
`C^τ` (§5.2.3) has a small set of images, each τ'-compact for some τ' by §5.2.3; take τ'
≥ τ bounding them all, and any regular κ with τ' ≪ κ, of which there are arbitrarily large ones. Then C and D
are κ-accessible (§5.2.2, as τ ≤ τ' ≪ κ), F is κ-continuous, and the κ-compact objects of C are
retracts of κ-small τ-filtered colimits of τ-compact objects (§4.4 and the proof of §5.2.2),
which F carries to κ-compact objects by §2.2 and the stability of κ-compact objects under retracts.

*Needs:*
- §5.2.2 and §5.2.3 (HTT, Prop. 5.4.2.9; Rem. 5.4.2.11); §4.4.1 (HTT, Lemma 5.4.2.4); §2.2.2
  (HTT, Cor. 5.3.4.15);
- Part PresheavesAndCompletions §6.5.3 (HTT, Prop. 5.3.5.10, p. 424) and §6.3.2
  (HTT, Rem. 5.3.4.16, p. 419);
- ModelCategoryTheory, Part ModelCategories §5.2.1 (HTT, Def. A.2.6.3, p. 837);
- §4.1.2 (HTT, Def. 5.4.2.5, p. 443) and Part PresheavesAndCompletions §6.1.1 (HTT, Def. 5.3.4.5, p. 414).

### 5.3 Small accessible ∞-categories

**5.3.1.** Prove that a small ∞-category C is accessible exactly when it is idempotent complete, and that then every
functor from C to an accessible ∞-category is accessible (HTT, Cor. 5.4.3.6, p. 449). Route: an accessible
∞-category has κ-filtered colimits and so is idempotent complete. Conversely, choose uncountable κ < τ with C
τ-small and its mapping spaces essentially κ-small; by §4.5 `Ind_τ(C)` is an idempotent completion of C, hence
equivalent to C, so C is τ-accessible. A functor `f : C → D` into an accessible D is the restriction of the
τ-continuous extension `Ind_τ(C) → D` (for τ with D admitting τ-filtered colimits), so f is τ-continuous.

*Needs:*
- §4.5.3 (HTT, Cor. 5.4.3.5);
- Part PresheavesAndCompletions §3.3.2 (HTT, Prop. 5.1.4.9, p. 341), §6.4.1 (HTT,
  Prop. 5.3.5.3, p. 421) and Part PresheavesAndCompletions §6.5.3 (HTT, Prop. 5.3.5.10, p. 424); Part
  PresheavesAndCompletions §4.3.1 (HTT, Rem. 5.3.1.10, p. 401);
- §4.1.1 (HTT, Def. 5.4.2.1, p. 441; Def. 5.4.2.5, p. 443); Part PresheavesAndCompletions §2.1.2 (HTT, §4.4.5,
  p. 321).

### 5.4 Functors with adjoints are accessible

**5.4.1.** Prove that a functor `G : C → C'` between accessible ∞-categories that admits a left or a right adjoint is
accessible (HTT, Prop. 5.4.7.7, p. 469). Route: a left adjoint preserves all colimits. If G has a left adjoint
F, choose κ with C and C' κ-accessible (§5.2) and with F carrying the essentially small set of κ-compact
objects of C' (§5.2, HTT, Rem. 5.4.2.11) to τ-compact objects for a larger τ ≫ κ; then the functor
corepresented by such an object composed with G is corepresented by its image under F. So for a τ-filtered
diagram in C, the comparison map from the colimit of its image under G to G of its colimit induces an
equivalence on the functor corepresented by every κ-compact object of C'. These functors jointly detect
equivalences in C', since C' ≃ `Ind_κ(C'^κ)` (§5.1 (2)) and `Ind_κ(C'^κ)` is a full subcategory of
`P(C'^κ)` (by definition, Part PresheavesAndCompletions §6.1). So G preserves τ-filtered colimits.

*Needs:*
- §5.2.2 (HTT, Prop. 5.4.2.9; Rem. 5.4.2.11); §5.1.1 (HTT, Prop. 5.4.2.2, (2));
- Part PresheavesAndCompletions §6.5.3 (HTT, Prop. 5.3.5.10, p. 424);
- Part LimitsAndKanExtensions §8.2.2 (HTT, Prop. 5.1.2.2, p. 336), Part PresheavesAndCompletions §1.3.3 (HTT,
  Lemma 5.1.5.2, p. 342) and §6.4.1 (HTT, Prop. 5.3.5.3, p. 421);
- Part AdjunctionsAndLocalizations §1.5.1 (HTT, Prop. 5.2.3.5, p. 367);
- Part AdjunctionsAndLocalizations §1.1.3 (HTT, Def. 5.2.2.1, p. 358); §4.1.1 (HTT, Def. 5.4.2.1, p. 441; Def.
  5.4.2.5, p. 443); Part PresheavesAndCompletions §6.1.1 (HTT, Def. 5.3.4.5, p. 414); Part LimitsAndKanExtensions §8.1.1 (HTT, Def. 5.1.0.1, p. 333); Part PresheavesAndCompletions §1.1.2 (HTT, §5.1.6, p.
  346).

### 5.5 κ-small limits of τ-compact objects

**5.5.1.** Prove that for regular κ ≪ τ with τ uncountable, a τ-small ∞-category C and an object D of `Ind_κ(C)`, D is
τ-compact exactly when every mapping space `Map(j(C), D)` is essentially τ-small (HTT, Lemma 5.4.7.5, p. 468).
Route: by Yoneda, `Map(j(C), D)` is the value of D at C. If every value is essentially τ-small, the right
fibration classified by D (in the sense of Part InfinityCategoryFoundations §7.1, by `D^op : C → S^op`; it exists by Part
InfinityCategoryFoundations §7.7) has τ-small base and essentially τ-small fibers, so it is essentially
τ-small
(§3.3); D is then the colimit of a τ-small diagram of representables, which are κ-compact, and so D is
τ-compact (§2.2). Conversely, as in the proof of §5.2.2, D is a τ-filtered colimit of
τ-small κ-filtered colimits of representables, so a τ-compact D is a retract of one of them; the values of
representables are mapping spaces of the τ-small C, essentially τ-small by §3.1, and the functor corepresented
by `j(C)` is κ-continuous, so it carries D to a retract of a τ-small colimit of essentially τ-small spaces,
which is essentially τ-small (§2.2 and §3.2).

*Needs:*
- §3.3.1 (HTT, Prop. 5.4.1.4); §3.2.1 (HTT, Cor. 5.4.1.5); §3.1.7 (HTT, Prop. 5.4.1.2); §2.2.2 (HTT, Cor. 5.3.4.15);
  §5.2.1 and §5.2.2 (HTT, Lemma 5.4.2.8; Prop. 5.4.2.9, proof);
- Part PresheavesAndCompletions §1.3.4 (HTT, Lemma 5.1.5.3, p. 343) and §6.4.3 (HTT,
  Prop. 5.3.5.5, p. 422);
- Part InfinityCategoryFoundations §7.1.6 (classification of right fibrations by maps to `S^op`); Part InfinityCategoryFoundations §7.7.1
  (classifying maps of small right fibrations; HTT, Props. 3.3.2.5–3.3.2.6, p. 230);
- Part PresheavesAndCompletions §6.1.2 (HTT, Def. 5.3.5.1, p. 421); Part PresheavesAndCompletions §1.1.1 (HTT, §5.1.3, p. 337) and §1.1.2 (HTT,
  §5.1.6, p. 346); Part AdjunctionsAndLocalizations §2.1.2 (HTT, §4.4.5, p. 321, retracts).

**5.5.2.** Prove that for regular κ ≪ τ with τ uncountable, the full subcategory of S on the essentially τ-small spaces
is stable under κ-small limits in S (HTT, Lemma 5.4.7.6, p. 468). Route: it suffices to treat pullbacks and
κ-small products, computed as homotopy pullbacks and products of Kan complexes. The homotopy sets of a κ-small
product are products of fewer than κ τ-small sets, τ-small because κ ≪ τ; those of a homotopy pullback are
controlled by the long exact sequence of a fibration; the criterion of §3.2 identifies both as essentially
τ-small.

*Needs:*
- §3.2.1 (HTT, Cor. 5.4.1.5);
- Part LimitsAndKanExtensions §3.2.1 (HTT, Thm. 4.2.4.1, p. 275, applied to `Kan` object by object through small full subcategories, as in its §3.3 (*Size*)) and §6.5.4 (HTT,
  Prop. 4.4.2.6, p. 314);
- ModelCategoryTheory, Part ModelCategories §3.5.1 (HTT, §A.2.4, p. 833);
- Part InfinityCategoryFoundations §1.2.1 (HTT, §1.2.11, p. 62).

**5.5.3.** Prove that if C is κ-accessible and τ ≫ κ is uncountable with `C^κ` essentially τ-small, then `C^τ` is stable
under all κ-small limits that exist in C (HTT, Prop. 5.4.7.4, p. 468). Route: for a κ-small diagram in `C^τ`
with limit X, by §5.5.1 it suffices that the functor corepresented by each κ-compact object
carries X to an essentially τ-small space; corepresented functors preserve limits, the values on the diagram
are essentially τ-small by §5.5.1, and §5.5.2 concludes.

*Needs:*
- §5.5.1 and §5.5.2 (HTT, Lemmas 5.4.7.5–5.4.7.6);
- Part PresheavesAndCompletions §1.3.2 (HTT, Prop. 5.1.3.2, p. 338);
- Part PresheavesAndCompletions §6.1.1 (HTT, Def. 5.3.4.5, p. 414); Part PresheavesAndCompletions §1.1.2 (HTT, §5.1.6, p. 346); Part InfinityCategoryFoundations §1.2.1 (HTT, §1.2.11, p. 62).

### Examples

- For an ordinary category A with morphisms in `Type u` (Mathlib `LocallySmall.{u}`, a field of
  `HasCardinalFilteredGenerator`, after `ShrinkHoms`), the nerve of A is κ-accessible exactly when A is Mathlib
  `IsCardinalAccessibleCategory A κ`. Small κ-filtered colimits exist in `N(A)` exactly when
  `HasCardinalFilteredColimits.{u} A κ` (Part PresheavesAndCompletions §6.4, its last statement, (2), both
  directions), and the κ-compact objects of `N(A)` are the κ-presentable ones (its (3)). Mathlib's
  `IsCardinalFilteredGenerator` asks that every object be a κ-filtered colimit of objects of P, while §5.1 (3)
  asks that P generate under κ-filtered colimits. They agree: if `N(A)` is κ-accessible, it is `Ind_κ(C₀)` for a
  small C₀ (§4.1), and every object of `Ind_κ(C₀)` is a small κ-filtered colimit of representables (Part
  PresheavesAndCompletions §6.4, HTT, Cor. 5.3.5.4); conversely, such colimits generate. Index diagrams
  `K → N(A)` with values in P are functors `hK ⥤ A` with values in P (Part LimitsAndKanExtensions §1.4, second
  statement, second bullet), with hK essentially `u`-small (Part PresheavesAndCompletions §6.4, its last
  statement, (1)); κ-filtered indexing reduces to κ-filtered posets by Part PresheavesAndCompletions §4.4 (HTT,
  Prop. 5.3.1.18, p. 404).
- §5.2 is the ∞-categorical form of Mathlib's statement that a κ-accessible category is κ'-accessible when κ
  is sharply smaller than κ'; for κ = ω it says that an ω-accessible ∞-category is τ-accessible for every
  uncountable regular τ.
- The ∞-category `Δ[0]` is accessible and idempotent complete, in accordance with §5.3; the nerve of the
  two-element monoid {1, e} with e² = e is a small ∞-category that is not idempotent complete (no r, s in it
  satisfy r ∘ s = 1 and s ∘ r = e), so it is not accessible.
- §5.4 applied to the left adjoint `π₀ : S → Set` shows that π₀ is accessible; it preserves all colimits,
  hence ω-filtered ones.

### Dependencies

Layers 2–4; Part InfinityCategoryFoundations, Part LimitsAndKanExtensions, Part
AdjunctionsAndLocalizations, Part
PresheavesAndCompletions; ModelCategoryTheory, Part ModelCategories; Mathlib `Cardinal.SharplyLT`.

## Layer 6: Functor ∞-categories, products and under-categories

### 6.1 Sections of coCartesian fibrations with filtered fibers

**6.1.1.** Prove that if `q : Y → X` is a coCartesian fibration whose fibers are τ-filtered, then q has the right lifting
property against `K ⊆ K^▷` for every τ-small simplicial set K (HTT, Lemma 5.4.4.1, p. 449). Route: q is a
categorical fibration by Part Straightening §2.3 (HTT, Prop. 3.3.1.7, p. 227). By Prop. A.2.3.1, since q is a
categorical fibration and `K ⋄ Δ[0] → K^▷` is a categorical equivalence under K, it suffices to lift against
`K ⊆ K ⋄ Δ[0]`. There a map `K → Y` over a cone in X is pushed by coCartesian transport to the fiber over the
cone point, where it extends because that fiber is τ-filtered, the composite being filled through the inner
fibration `q^K`.

*Needs:*
- Part Straightening §2.3.1 (HTT, Prop. 3.3.1.7, p. 227, coCartesian form);
- Part LimitsAndKanExtensions §1.1.1 (HTT, Def. 4.2.1.1, p. 257; Prop. 4.2.1.2, p. 258);
- Part CartesianFibrations §5.5.3 (HTT, Prop. 3.1.2.1, p. 169);
- Part InfinityCategoryFoundations §9.4.1 (HTT, §2.2.5, categorical fibrations, p. 107);
- ModelCategoryTheory, Part ModelCategories §3.2.1 (HTT, Prop. A.2.3.1, p. 830);
- Part PresheavesAndCompletions §4.1.1 (HTT, Def. 5.3.1.7, p. 400) and Part CartesianFibrations §1.1.1 (HTT, Def. 2.4.2.1, p. 139,
  second sentence);
- Tau Ceti `SSet.LeftFibration` (HTT, Def. 2.0.0.3, p. 71).

**6.1.2.** Let κ < τ be regular with κ ≪ τ, and `q : Y → X` a coCartesian fibration over a τ-small simplicial set X whose
fibers are τ-filtered and admit τ-small κ-filtered colimits, preserved by the transport functors along edges
of X. Prove that the ∞-category `Map_X(X, Y)` of sections of q is τ-filtered and that every evaluation map
`Map_X(X, Y) → Y_x` is cofinal (HTT, Lemma 5.4.4.2, p. 450). The proof is the following four statements.

- Prove that X may be taken to be a τ-small ∞-category, and that both conclusions follow once every τ-small
  diagram `f : K → Y` can, after enlarging K, be extended over the auxiliary object `T(K)` of simplicial sets
  over X, whose maps from A are a map `A → Δ[1]`, a map from the part of A over 0 to K and a map `A → X`
  agreeing with `q ∘ f` there (HTT, Lemma 5.4.4.2, proof, first step, pp. 450–451). Route: take `K = Z × X`
  for the τ-filteredness, and K obtained from `Z × X` by coning off `Z × {x}` for cofinality, where Theorem A
  applies because the comma ∞-categories are τ-filtered and so weakly contractible.

  *Needs:* §3.1.4 (HTT, Prop. 5.4.1.2, (4) ⇒ (3)); Part Straightening §2.2.1 (HTT, Cor. 3.3.1.2, p. 223); Part
  LimitsAndKanExtensions §5.4.2 (HTT, Thm. 4.1.3.1, p. 254); Part PresheavesAndCompletions §4.3.2 (HTT, Lemma
  5.3.1.20, p. 406).
- Prove that every τ-small `f : K → Y` extends to a τ-small `f' : K' → Y`, with `K'` an ∞-category, such that
  each `K' ×_X X_{/x}` is κ-filtered (HTT, Lemma 5.4.4.2, proof, enlargement step, p. 451). Route: a κ-indexed
  transfinite sequence; at each stage glue cone points over every κ-small diagram into `K(α) ×_X X_{/x}` using
  §6.1.1 for the coCartesian fibration `X_{/x} ×_X Y → X_{/x}`, then complete to a
  τ-small ∞-category; τ-smallness uses κ ≪ τ.

  *Needs:* §6.1.1 (HTT, Lemma 5.4.4.1); §3.1.4 (HTT, Prop. 5.4.1.2, (4) ⇒ (3));
  ModelCategoryTheory, Part ModelCategories §5.2.1 (HTT, Def. A.2.6.3, p. 837).
- Prove that for `K'` as in the previous step the extension `T(K') → Y` over X exists (HTT, Lemma 5.4.4.2,
  proof, extension step, p. 451). Route: take a q-left Kan extension of `f'`; the required q-colimits exist
  because each `K' ×_X X_{/x}` is τ-small and κ-filtered and the fibers and transports satisfy the hypotheses.

  *Needs:* the first and second steps of this list (HTT, Lemma 5.4.4.2, proof); Part LimitsAndKanExtensions
  §7.4.2 (HTT, Lemma 4.3.2.13, p. 300) and Part LimitsAndKanExtensions §7.3.2 (HTT, Cor. 4.3.1.11, p. 284).
- Prove the two conclusions (HTT, Lemma 5.4.4.2, p. 450). Route: combine the criterion of the first step with
  the extensions of the third.

  *Needs:* the first and third steps of this list (HTT, Lemma 5.4.4.2, proof).

### 6.2 Accessibility of functor ∞-categories

**6.2.1.** Prove that if C is accessible and K is a small simplicial set, then `Fun(K, C)` is accessible (HTT, Prop.
5.4.4.3, p. 452). Route: choose τ ≫ κ with C τ-accessible (§5.2) and K τ-small. Diagrams with τ-compact values
are τ-compact (§2.1); to see that they generate, take `C₀ = C^τ`, which is idempotent complete and stable
under τ-small κ-filtered colimits (§2.2), and for `F : K → C` apply §6.1 to the coCartesian fibration of
diagrams in `C₀` over the values of F; its sections form a τ-filtered ∞-category whose colimit is F, checked
pointwise through the cofinal evaluations.

*Needs:*
- §6.1.2 (HTT, Lemma 5.4.4.2); §2.1.1 (HTT, Prop. 5.3.4.13); §2.2.2 (HTT, Cor. 5.3.4.15); §5.1.1 (HTT, Prop. 5.4.2.2);
  §5.2.2 (HTT, Prop. 5.4.2.9);
- Part LimitsAndKanExtensions §1.5.2 (HTT, Prop. 4.2.2.4, Cartesian part, p. 262) and Part
  LimitsAndKanExtensions §2.5.2 (HTT, Prop. 4.1.1.8, p. 244);
- Part InfinityCategoryFoundations §8.3.1 (HTT, Prop. 1.2.13.8, p. 66);
- Part LimitsAndKanExtensions §8.2.2 (HTT, Prop. 5.1.2.2, p. 336) and Part PresheavesAndCompletions §1.3.4 (HTT,
  Lemma 5.1.5.3, p. 343);
- ModelCategoryTheory, Part ModelCategories §5.2.1 (HTT, Def. A.2.6.3, p. 837);
- §4.1.1 (HTT, Def. 5.4.2.1, p. 441);
- Part CartesianFibrations §1.5.1 (HTT, §2.4.1, coCartesian edges, p. 136).

### 6.3 Products and coproducts

**6.3.1.** Prove that a product of a small family of accessible ∞-categories is accessible, and that a functor from an
accessible ∞-category into the product is accessible exactly when each component is (HTT, Lemma 5.4.7.2, p.
467). Route: first, a coproduct of a small family of ∞-categories is accessible exactly when every summand is
(HTT, Lemma 5.4.7.1, p. 467), since a κ-filtered ∞-category is connected, so a κ-filtered diagram in a
coproduct lies in one summand; hence colimits, κ-compact objects and `Ind_κ` are computed summandwise, and a
small family of accessible ∞-categories is κ-accessible for a common κ by §5.2. The product `∏ C_α` is the
full subcategory of `Fun(N(A), ∐ C_α)` of sections over the discrete set A, hence a functor ∞-category over a
coproduct, accessible by the coproduct case and §6.2; for functors, colimits in a product are computed
componentwise.

*Needs:*
- §5.2.2 (HTT, Prop. 5.4.2.9); §6.2.1 (HTT, Prop. 5.4.4.3);
- §4.1.1 (HTT, Def. 5.4.2.1, p. 441); Part InfinityCategoryFoundations §1.1 (HTT, §1.2.15, p. 68).

### 6.4 Weakly cofinal and κ-cofinal functors

**6.4.1.** Define, for a functor `f : I → J` between filtered ∞-categories, f to be **weakly cofinal** when for every
object J of J there are an object I of I and a morphism `J → f(I)`, and **κ-cofinal** when for every diagram `p : K →
I` indexed by a κ-small weakly contractible simplicial set, the induced functor `I_{p/} → J_{fp/}` is weakly cofinal
(HTT, Def. 5.4.5.8, p. 457; `Suggested.lean` declarations `IsWeaklyCofinal` and `IsCardinalCofinal`). Filteredness of
I and J is part of the setting, not of the definitions. The `Suggested.lean` declaration is
`isCardinalCofinal_coslice_π`.

- A trivial fibration, and more generally any functor that is surjective on equivalence classes of objects, is
  weakly cofinal; weak cofinality is invariant under equivalence of functors.
- With K = `Δ[0]`, κ-cofinality says that for every object I, the functor `I_{I/} → J_{f(I)/}` is weakly
  cofinal. The empty simplicial set is not weakly contractible, so K = ∅ is not a case; weak cofinality of f
  still follows from the case K = `Δ[0]`, since J is filtered and I is nonempty: for an object J, choose J'
  receiving maps from J and from some f(I), and map J' under f(I) to an object f(I').
- κ-cofinal functors are κ'-cofinal for κ' ≤ κ.

**Checks.**

- The inclusion of the even numbers into the nerve of `(ℕ, ≤)` is κ-cofinal for every κ: for a κ-small weakly
  contractible p with largest value m, the under-categories are the nerves of the even numbers at least m and
  of the numbers at least m, and every number lies below an even one (for p with unbounded image both are
  empty). The inclusion is not essentially surjective, so a definition asking `I_{p/} → J_{fp/}` to be
  essentially surjective, or an equivalence, would reject it.
- The inclusion of the object 0 into the nerve of `(ℕ, ≤)` is not weakly cofinal: for n > 0 there is no
  morphism `n → 0`. With the direction of the morphism reversed (morphisms `f(I) → J`) it would be weakly
  cofinal, so this pins the direction.
- Let M be the monoid `{1, e}` with `e ∘ e = e`, viewed as a category with one object; it is filtered, and its
  nerve is `Idem` of Part PresheavesAndCompletions §2.1. The inclusion of the object into `Idem` is weakly
  cofinal but not κ-cofinal for any κ: for K = `Δ[0]`, the under-category of `Idem` at the object has the
  objects id and e, and there is no morphism from e to id under the object, because e is not invertible. Weak cofinality alone would accept this functor, which
  is not cofinal in Mathlib's sense (its comma category is discrete with two objects).
- The inclusion of a terminal object of a filtered ∞-category with a terminal object is κ-cofinal for every κ,
  matching Mathlib's notion of final functor for nerves of ordinary categories.

*Needs:*
- Part PresheavesAndCompletions §4.1.1 (HTT, Def. 5.3.1.7, p. 400); Mathlib `SSet.Quasicategory` (HTT, Def. 1.1.2.4, p. 32);
- Tau Ceti `SSet.slice.homEquiv`, `SSet.coslice.homEquiv` (HTT, Prop. 1.2.9.2);
- Tau Ceti `SSet.coslice`, `SSet.IsWeaklyContractible`.

**6.4.2.** Prove that for a τ-filtered ∞-category I and a τ-small diagram `p : K → I`, the projection `I_{p/} → I` is
τ-cofinal (HTT, Example 5.4.5.9, p. 457). Route: `I_{p/}` is τ-filtered; a τ-small weakly contractible diagram
`K' → I_{p/}` is a map `q : K ⋆ K' → I`, and since `K' ⊆ K ⋆ K'` is right anodyne the restriction
`I_{q/} → I_{q|K'/}` is a trivial fibration, hence weakly cofinal.

*Needs:*
- §6.4.1 (HTT, Def. 5.4.5.8);
- Part LimitsAndKanExtensions §6.2.1 (HTT, Lemma 4.2.3.6, p. 269);
- Part InfinityCategoryFoundations §4.3.2 (HTT, Prop. 2.1.2.5, p. 80);
- Part PresheavesAndCompletions §4.3.3 (HTT, Lemma 5.3.1.21, p. 406);
- Part PresheavesAndCompletions §4.1.1 (HTT, Def. 5.3.1.7, p. 400).

**6.4.3.** Prove that for a κ-cofinal functor `f : I → J` between τ-filtered ∞-categories and a τ-small diagram `p : K
→ I`, the induced functor `I_{p/} → J_{fp/}` is κ-cofinal (HTT, Lemma 5.4.6.4, p. 464). Route: a κ-small weakly
contractible diagram `K' → I_{p/}` is a map `q : K ⋆ K' → I`; since `K' ⊆ K ⋆ K'` is right anodyne, the
under-categories of q and of its restriction to `K'` are related by trivial fibrations in I and in J, which reduces
the claim to κ-cofinality of f. The `Suggested.lean` declaration is `IsCardinalCofinal.coslice_map`.

*Needs:*
- §6.4.1 (HTT, Def. 5.4.5.8);
- Part LimitsAndKanExtensions §6.2.1 (HTT, Lemma 4.2.3.6, p. 269);
- Part InfinityCategoryFoundations §4.3.2 (HTT, Prop. 2.1.2.5, p. 80);
- Part PresheavesAndCompletions §4.3.3 (HTT, Lemma 5.3.1.21, p. 406);
- Part PresheavesAndCompletions §4.1.1 (HTT, Def. 5.3.1.7, p. 400).

**6.4.4.** Prove that for a κ-cofinal functor `f : I → J` between τ-filtered ∞-categories and a κ-small diagram `p : K
→ J`, the functor `I_{p/} → J_{p/}` out of `I_{p/} = I ×_J J_{p/}` is κ-cofinal (HTT, Lemma 5.4.5.11 (2), p. 458).
Route: for a κ-small weakly contractible diagram `K' → I_{p/}`, a compatible pair `q : K' → I` and `q' : K ⋆ K' → J`,
the under-category of `I_{p/}` at it is the pullback of `I_{q/} → J_{fq/}` along the restriction `J_{q'/} → J_{fq/}`,
which is a trivial fibration because `K' ⊆ K ⋆ K'` is right anodyne; weak cofinality is stable under this pullback,
and `I_{q/} → J_{fq/}` is weakly cofinal by κ-cofinality of f. The `Suggested.lean` declaration is
`IsCardinalCofinal.pullback_snd`.

*Needs:*
- §6.4.1 (HTT, Def. 5.4.5.8);
- Part LimitsAndKanExtensions §6.2.1 (HTT, Lemma 4.2.3.6, p. 269);
- Part InfinityCategoryFoundations §4.3.2 (HTT, Prop. 2.1.2.5, p. 80).

**6.4.5.** Prove that for a κ-cofinal functor `f : I → J` between τ-filtered ∞-categories and a τ-small diagram `p : K
→ J`, the ∞-category `I_{p/}` is τ-filtered (HTT, Lemma 5.4.5.11 (1), p. 458). HTT assumes p κ-small instead. For κ >
τ that does not suffice: with κ = ℵ₁, τ = ω, I = J the nerve of `(ℕ, ≤)`, f the identity (κ-cofinal, since each
induced functor of under-categories is an identity) and p the identity of that nerve (countable, so ℵ₁-small), no
object of J receives a cone from p, so `I_{p/}` is empty, and the empty ∞-category is not filtered. For κ ≤ τ a
κ-small p is τ-small; §6.4.6 uses the case K = `Δ[0]`, which is τ-small for every τ. Route: a τ-small diagram `K' →
I_{p/}` is a compatible pair `q : K' → I`, `q' : K ⋆ K' → J`. Choose a cone on q in I with cone point i; glued with q'
along `K'` it gives a diagram `(K ⋆ K') ⊔_{K'} K'^▷ → J`, τ-small because K and `K'` are, and τ-filteredness of J
gives a cone on it with cone point j. By κ-cofinality at K = `Δ[0]`, the functor `I_{i/} → J_{f(i)/}` is weakly
cofinal, so the edge `f(i) → j` is followed, under `f(i)`, by an edge `j → f(i')` for an edge `i → i'` of I. The cone
on q with point `i'` and the composite cone on q' with point `f(i')` are assembled by extending along inner anodyne
inclusions of joins in I and in J, and form the required extension in `I_{p/}`. For weakly contractible `K'` no
cofinality is needed: the inclusion `(K ⋆ K') ⊔_{K'} K'^▷ ⊆ (K ⋆ K')^▷` is then a categorical equivalence (Part
PresheavesAndCompletions §5.4), along which the ∞-category J extends maps. The `Suggested.lean` declaration is
`IsCardinalCofinal.isCardinalFiltered_pullback`.

*Needs:*
- §6.4.1 (HTT, Def. 5.4.5.8);
- Part InfinityCategoryFoundations §4.1.1 (HTT, Lemma 2.1.2.3, p. 80);
- Part PresheavesAndCompletions §5.4.1 (HTT, Lemma 5.4.5.10, p. 457);
- Part InfinityCategoryFoundations §9.5.1 (HTT, Thm. 2.2.5.1, p. 107);
- Part PresheavesAndCompletions §4.1.1 (HTT, Def. 5.3.1.7, p. 400); Part InfinityCategoryFoundations §2.1.6 (HTT, Def. 1.1.5.14, p. 43).

**6.4.6.** Prove that a κ-cofinal functor between filtered ∞-categories is cofinal (HTT, Lemma 5.4.5.12, p. 459).
Route: by Theorem A it suffices that each `I ×_J J_{J/}` is weakly contractible; by §6.4.5 with τ = ω and K = `Δ[0]`
it is filtered, and filtered ∞-categories are weakly contractible. The `Suggested.lean` declaration is
`IsCardinalCofinal.isCofinal`.

*Needs:*
- §6.4.5 (HTT, Lemma 5.4.5.11); §6.4.1 (HTT, Def. 5.4.5.8);
- Part LimitsAndKanExtensions §5.4.2 (HTT, Thm. 4.1.3.1, p. 254);
- Part PresheavesAndCompletions §4.3.2 (HTT, Lemma 5.3.1.20, p. 406);
- Part LimitsAndKanExtensions §2.1.1 (HTT, Def. 4.1.1.1, p. 241).

### 6.5 Accessibility of under-categories

**6.5.1.** Prove that if C admits κ-filtered colimits, `p̄ : K^▷ → C` is a κ-small diagram with values in `C^κ`, and
`p = p̄|K`, then `p̄` is a κ-compact object of `C_{p/}` (HTT, Lemma 5.4.5.13, p. 459). Route: replace `C_{p/}`
by the equivalent alternative under-category `C^{p/}`, the fiber over p of the restriction map
`Fun(K × Δ[1], C) → Fun(K × {0}, C)`; that map is a Cartesian fibration, so the fiber square is a categorical
pullback square, and its maps preserve κ-filtered colimits (functors out of `Δ[0]` do, because filtered
∞-categories are weakly contractible). The object of `C^{p/}` given by `p̄` has κ-compact image in
`Fun(K × Δ[1], C)` by §2.1, and §1.3 gives compactness.

*Needs:*
- §1.3.1 (HTT, Lemma 5.4.5.7); §2.1.1 (HTT, Prop. 5.3.4.13);
- Part LimitsAndKanExtensions §8.2.2 (HTT, Prop. 5.1.2.2, p. 336), Part PresheavesAndCompletions §4.3.2 (HTT,
  Lemma 5.3.1.20, p. 406);
- Part CartesianFibrations §4.4.2 (HTT, Cor. 2.4.7.12, p. 161); Part CartesianFibrations §7.2.1 (HTT, Prop.
  3.3.1.3, p. 223);
- Part LimitsAndKanExtensions §3.5.2 (HTT, Cor. 4.4.4.10, p. 320) and §1.2.1 (HTT,
  Prop. 4.2.1.5, p. 259);
- ModelCategoryTheory, Part ModelCategories §3.5.1 (HTT, §A.2.4, p. 833).

**6.5.2.** Prove that if C admits small τ-filtered colimits and `p : K → C` is a small diagram, then `C_{p/}` admits
small τ-filtered colimits (HTT, Lemma 5.4.5.14, p. 460). Route: first replace K by an ∞-category. The small object
argument over inner horns gives an inner anodyne inclusion `K ⊆ K'` with `K'` a small ∞-category, and p extends to `p'
: K' → C` because C is an ∞-category; the restriction `C_{p'/} → C_{p/}` is a trivial fibration (Part
InfinityCategoryFoundations §4.3), so it suffices to treat `p'`, and we may assume K is an ∞-category. Then a diagram
`I → C_{p/}` with I τ-filtered is a diagram `K ⋆ I → C`. Since I is τ-filtered, so is the small ∞-category `K ⋆ I` (a
cone on a τ-small diagram can be taken with vertex in I), so `K ⋆ I → C` has a colimit in C, and that colimit is a
colimit of the original diagram in `C_{p/}`. The `Suggested.lean` declaration is
`hasCardinalFilteredColimits_coslice`.

*Needs:*
- Tau Ceti `SSet.slice.homEquiv`, `SSet.coslice.homEquiv` (HTT, Prop. 1.2.9.2); Part InfinityCategoryFoundations
  §8.3.1 (HTT, Prop. 1.2.13.8, p. 66);
- Part InfinityCategoryFoundations §4.3.2 (HTT, Prop. 2.1.2.5, p. 80);
- Part PresheavesAndCompletions §4.1.1 (HTT, Def. 5.3.1.7, p. 400); Part InfinityCategoryFoundations §1.2.4 (HTT, Def. 1.2.13.4, p. 65); Part InfinityCategoryFoundations §1.1 (HTT, §1.2.15, p. 68).

**6.5.3.** Prove that for regular κ ≪ τ, a τ-accessible ∞-category C and a κ-small diagram `p : K → C^τ`, the
under-category `C_{p/}` is τ-accessible, and an object of `C_{p/}` is τ-compact exactly when its image in C is
τ-compact (HTT, Prop. 5.4.5.15, p. 460). Route: `C_{p/}` has small τ-filtered colimits (§6.5.2) and the objects with τ-compact image are τ-compact (§6.5.1). For an object `p̄` with
cone point X, the τ-filtered ∞-category E of τ-compact objects over X has colimit X; the under-category of the
induced diagram `K → E` is τ-filtered and its projection to E is τ-cofinal (HTT, Example 5.4.5.9), hence
cofinal (HTT, Lemma 5.4.5.12), both in §6.4, which exhibits `p̄` as a τ-filtered colimit of objects with
τ-compact image. Use §5.1 (3) to conclude.

*Needs:*
- §6.5.1 and §6.5.2 (HTT, Lemmas 5.4.5.13–5.4.5.14); §6.4.2 (HTT, Example 5.4.5.9; Lemma 5.4.5.12);
- Part LimitsAndKanExtensions §2.3.1 (HTT, Prop. 4.1.1.3, p. 241) and §6.2.1 (HTT,
  Lemma 4.2.3.6, p. 269);
- Part PresheavesAndCompletions §6.5.3, §6.5.4 (HTT, Props. 5.3.5.10–5.3.5.11, pp. 424–425); Part
  PresheavesAndCompletions §4.3.2, §4.3.3 (HTT, Lemmas 5.3.1.20–5.3.1.21, p. 406);
- Tau Ceti `SSet.slice.homEquiv`, `SSet.coslice.homEquiv` (HTT, Prop. 1.2.9.2);
- Part PresheavesAndCompletions §4.1.1 (HTT, Def. 5.3.1.7, p. 400); Part PresheavesAndCompletions §6.1.1 (HTT, Def. 5.3.4.5, p. 414); Part PresheavesAndCompletions §6.1.2 (HTT, Def. 5.3.5.1, p. 421); §4.1.1 (HTT, Def. 5.4.2.1, p. 441).

**6.5.4.** Prove that if C is accessible and `p : K → C` is a diagram indexed by a small simplicial set, then `C_{p/}` is
accessible (HTT, Cor. 5.4.5.16, p. 461). Route: choose κ with K κ-small and τ ≫ κ with C τ-accessible and p
landing in `C^τ`, which is possible since every object is τ-compact for τ large and C is τ-accessible for
arbitrarily large τ ≫ κ (§5.2 (HTT, Prop. 5.4.2.9; Rem. 5.4.2.11)); apply §6.5.3.

*Needs:*
- §6.5.3 (HTT, Prop. 5.4.5.15); §5.2.2 (HTT, Prop. 5.4.2.9; Rem. 5.4.2.11);
- §4.1.1 (HTT, Def. 5.4.2.1, p. 441); Part InfinityCategoryFoundations §1.1 (HTT, §1.2.15, p. 68).

### Examples

- For K = `∂Δ[1]` and C = S, §6.2 says that `Fun(∂Δ[1], S) = S × S` is accessible, which also follows from §6.3.
- For K empty, §6.5 says that C itself is accessible, and for K = `Δ[0]` it says that the under-category of an
  object X of an accessible ∞-category is accessible, with τ-compact objects the morphisms `X → Y` with Y
  τ-compact once X is τ-compact. This matches Mathlib's accessibility of under-categories of accessible
  categories at accessible functors.
- The inclusion of the even numbers into `N(ℕ, ≤)` is κ-cofinal for every κ and so cofinal by §6.4.

### Dependencies

Layers 1–5; Part InfinityCategoryFoundations, Part CartesianFibrations, Part LimitsAndKanExtensions,
Part Straightening, Part PresheavesAndCompletions; ModelCategoryTheory, Part ModelCategories; Tau Ceti
`SSet.coslice`, `SSet.IsWeaklyContractible`.

## Layer 7: Categorical pullbacks, over-categories and accessible subcategories

### 7.1 Categorical pullbacks of accessible ∞-categories

**7.1.1.** Prove that for regular κ ≪ τ, a τ-continuous functor `f : C → D` between τ-accessible ∞-categories carrying
τ-compact objects to τ-compact objects, and an object C of C, the induced functor `C^τ_{/C} → D^τ_{/f(C)}`
between the full subcategories of the over-categories on the τ-compact sources is κ-cofinal (HTT, Lemma
5.4.6.1, p. 461). Route: both are τ-filtered, with colimits C and f(C). For a κ-small weakly contractible
diagram, the under-categories are τ-accessible by §6.5, and weak cofinality reduces, through the
τ-compactness of the objects involved and the colimit presentation of C, to the commutation of π₀ with
filtered colimits of spaces.

*Needs:* §6.5.3 (HTT, Prop. 5.4.5.15); §6.4.1 (HTT, Def. 5.4.5.8); Part PresheavesAndCompletions §4.3.3 (HTT,
Lemma 5.3.1.21, p. 406); §4.1.1 (HTT, Def. 5.4.2.1, p. 441); Part PresheavesAndCompletions §4.1.1 (HTT, Def.
5.3.1.7, p. 400); Part PresheavesAndCompletions §6.1.1 (HTT, Def. 5.3.4.5, p. 414); Part PresheavesAndCompletions §1.1.2 (HTT, §5.1.6, p.
346); Part InfinityCategoryFoundations §1.2.1 (HTT, §1.2.11, p. 62).

**7.1.2.** Prove that for regular τ > κ and functors `p : X → Y ← X' : p'` between κ-filtered ∞-categories that admit
τ-small κ-filtered colimits, with p and `p'` κ-cofinal and preserving τ-small κ-filtered colimits, there are
objects X of X and `X'` of `X'` with `p(X)` and `p'(X')` equivalent in Y (HTT, Lemma 5.4.6.3, p. 462).
Route: alternate between X and `X'` along a κ-indexed sequence, using weak cofinality to find successive
morphisms in Y; take colimits in X and `X'` of the two interleaved chains, which p and `p'` preserve, and
identify their images using the categorical equivalence of Part PresheavesAndCompletions §5.4 for a linearly
ordered set with a cofinal subset and the comparison of colimits along cofinal inclusions.

*Needs:* Part PresheavesAndCompletions §5.4.2 (HTT, Lemma 5.4.6.2, p. 462); §6.4.1 (HTT, Def. 5.4.5.8); Part
LimitsAndKanExtensions §2.5.2 (HTT, Prop. 4.1.1.8, p. 244); Part InfinityCategoryFoundations §9.5.1 (HTT, Thm. 2.2.5.1, p.
107); Part PresheavesAndCompletions §4.1.1 (HTT, Def. 5.3.1.7, p. 400); Part LimitsAndKanExtensions §2.1.1 (HTT, Def. 4.1.1.1, p. 241).

**7.1.3.** Prove that for regular τ > κ and a categorical pullback square of ∞-categories `I'` over `p : I → J` and
`q : J' → J`, with I, J and `J'` τ-filtered and admitting τ-small κ-filtered colimits and p and q κ-cofinal
and preserving them, `I'` is τ-filtered and the projections `I' → I` and `I' → J'` are κ-cofinal (HTT, Lemma
5.4.6.5, p. 464). Route: for a τ-small diagram in `I'`, pass to under-categories, which satisfy the same
hypotheses (§6.5, HTT, Lemma 5.4.5.14; §6.4, HTT, Lemmas 5.4.5.11 and 5.4.6.4); §7.1.2 produces
objects of the two under-categories with equivalent images, which glue to a cone in `I'`. κ-cofinality of
the projections follows in the same way from HTT, Lemma 5.4.5.11 (§6.4).

*Needs:* §7.1.2 (HTT, Lemma 5.4.6.3); §6.4.1 (HTT, Def. 5.4.5.8; Lemmas 5.4.5.11 and 5.4.6.4); §6.5.2
(HTT, Lemma 5.4.5.14); Part PresheavesAndCompletions §4.3.3 (HTT, Lemma 5.3.1.21, p. 406); Part
InfinityCategoryFoundations §9.5.1 (HTT, Thm. 2.2.5.1, p. 107); Part InfinityCategoryFoundations §9.4.1 (HTT, §2.2.5);
ModelCategoryTheory, Part ModelCategories §3.5.1 (HTT, §A.2.4, p. 833).

**7.1.4.** Prove that in a categorical pullback square of ∞-categories `X'` over `p : X → Y` and `q : Y' → Y`, with X, Y
and `Y'` accessible and p and q accessible functors, `X'` is accessible, and for every accessible ∞-category C
a functor `C → X'` is accessible exactly when its composites with the projections to X and `Y'` are; in
particular the projections are accessible (HTT, Prop. 5.4.6.6, p. 465). Route: choose κ ≪ τ with all three
τ-accessible and p, q τ-continuous preserving τ-compact objects (§5.2, HTT, Rem. 5.4.2.13). By §1.2 and §1.3,
`X'` has τ-filtered colimits preserved by the projections, and objects with τ-compact images are τ-compact.
For an object of `X'`, the over-categories of τ-compact objects in X and `Y'` map κ-cofinally to that of Y
(§7.1.1), so their categorical pullback is τ-filtered and κ-cofinal over both (§7.1.3), hence
cofinal (§6.4); this exhibits the object as a τ-filtered colimit of τ-compact ones, and §5.1 (3) concludes.

*Needs:*
- §1.2.2 (HTT, Lemma 5.4.5.5); §1.3.1 (HTT, Lemma 5.4.5.7); §5.1.1 (HTT, Prop. 5.4.2.2); §5.2.2 (HTT, Prop. 5.4.2.9;
  Rem. 5.4.2.13); §6.4.1 (HTT, Def. 5.4.5.8; Lemma 5.4.5.12); §7.1.1 and §7.1.3 (HTT, Lemmas 5.4.6.1 and 5.4.6.5);
- Part InfinityCategoryFoundations §9.5.1 (HTT, Thm. 2.2.5.1, p. 107); Part InfinityCategoryFoundations §9.4.1 (HTT, §2.2.5);
- ModelCategoryTheory, Part ModelCategories §3.5.1 (HTT, §A.2.4, p. 833);
- §4.1.1 (HTT, Def. 5.4.2.1, p. 441; Def. 5.4.2.5, p. 443); Tau Ceti `SSet.IsLocallySmall` (HTT, Def. after
  Prop. 5.4.1.7, p. 441);
  Part PresheavesAndCompletions §6.1.1 (HTT, Def. 5.3.4.5, p. 414).

### 7.2 Accessibility of over-categories

**7.2.1.** Prove that if C is accessible and `p : K → C` is a diagram indexed by a small simplicial set, then the
over-category `C_{/p}` is accessible (HTT, Cor. 5.4.6.7, p. 466). Route: `C_{/p}` is equivalent to the
alternative over-category, the categorical pullback of `Δ[0] → Fun(K, C) ← Fun(K × Δ[1], C)` over the diagram
p at the vertex 1, where the evaluation at 1 is a coCartesian fibration. The three corners are accessible
(§5.3 for `Δ[0]`, §6.2 for the functor ∞-categories), the evaluation is accessible because it preserves
colimits, and the inclusion of p is accessible by §5.3; apply §7.1.

*Needs:*
- §7.1.4 (HTT, Prop. 5.4.6.6); §5.3.1 (HTT, Cor. 5.4.3.6); §6.2.1 (HTT, Prop. 5.4.4.3);
- Part LimitsAndKanExtensions §1.1.1 (HTT, Def. 4.2.1.1, p. 257) and §1.2.1 (HTT,
  Prop. 4.2.1.5, p. 259);
- Part CartesianFibrations §4.4.2 (HTT, Cor. 2.4.7.12, p. 161) and §7.2.1 (HTT, Prop.
  3.3.1.3, p. 223);
- Part LimitsAndKanExtensions §8.2.2 (HTT, Prop. 5.1.2.2, p. 336);
- §4.1.1 (HTT, Def. 5.4.2.1, p. 441; Def. 5.4.2.5, p. 443).

### 7.3 Accessible subcategories

**7.3.1.** Define a full subcategory D of an accessible ∞-category C to be an **accessible subcategory** when D is
accessible and the inclusion `D → C` is an accessible functor (HTT, Def. 5.4.7.8, p. 469). Full subcategories
are taken in the sense of Part InfinityCategoryFoundations §1.2, as Tau Ceti `SSet.fullEnhancedSubcategory` of a set of objects.

- Accessible subcategories are closed under equivalence (replacing the set of objects by its closure under
  equivalence changes nothing).
- C is an accessible subcategory of itself, and an accessible subcategory of an accessible subcategory is an
  accessible subcategory.

**Checks.**

- The empty full subcategory of an accessible C is an accessible subcategory: `Ind_κ` of the empty ∞-category
  is empty, because the only presheaf on it has empty, hence not κ-filtered, total space, and the inclusion
  vacuously preserves colimits. Mathlib also counts the empty category as κ-accessible. A definition demanding
  a nonempty generator would reject it.
- The full subcategory of the nerve of the category of sets on the sets with at most one element is an
  accessible subcategory: it is equivalent to `N([1])`, small and idempotent complete, and its inclusion is
  accessible by §5.3. A definition requiring closure under small colimits would reject it, since `1 ⊔ 1` has
  two elements.
- The full subcategory D of the nerve of the category of sets on the sets with at least two elements is not
  accessible: for every regular κ, the κ-indexed sequence of a two-element set with constant transition maps
  has no colimit in D (a colimit L would satisfy `Hom(L, Y) ≅ Y` for all Y in D, impossible since for a
  two-element Y the set `Hom(L, Y)` has at least four elements). A definition asking only that the inclusion
  preserve the τ-filtered colimits that exist in D would accept D.

*Needs:*
- §4.1.1 (HTT, Def. 5.4.2.1, p. 441; Def. 5.4.2.5, p. 443); Part InfinityCategoryFoundations §1.2.1 (HTT,
  §1.2.11, p. 62);
- Tau Ceti `SSet.fullEnhancedSubcategory`.

**7.3.2.** Prove that if C is accessible, K is a small simplicial set and every diagram `K → C` has a limit, then the
full subcategory of `Fun(K^◁, C)` on the limit diagrams is an accessible subcategory, and dually for colimit
diagrams in `Fun(K^▷, C)` when every K-indexed diagram has a colimit (HTT, Example 5.4.7.9, p. 470). Route:
restriction from the limit diagrams to `Fun(K, C)` is a trivial fibration, K being an arbitrary small
simplicial set (Part LimitsAndKanExtensions §7.4, its last statement), so the limit diagrams are equivalent to
`Fun(K, C)`, which is accessible (§6.2). The inclusion is right adjoint to restriction followed by right Kan
extension, so it is accessible (§5.4); as K need not be an ∞-category, the adjunction is taken after the
replacement of K by an ∞-category `K′ ⊇ K` through an inner anodyne map used for that statement, restriction
`Fun(K′^◁, C) ⟶ Fun(K^◁, C)` being a trivial fibration that matches the limit diagrams.

*Needs:*
- §7.3.1 (HTT, Def. 5.4.7.8); §6.2.1 (HTT, Prop. 5.4.4.3); §5.4.1 (HTT, Prop. 5.4.7.7);
- Part LimitsAndKanExtensions §7.4.7 (HTT, Prop. 4.3.2.15, p. 302, for limit diagrams indexed by a
  simplicial set);
- Part AdjunctionsAndLocalizations §1.8.1 (HTT, Prop. 4.3.2.17, p. 302);
- Part InfinityCategoryFoundations §1.2.4 (HTT, Def. 1.2.13.4, p. 65); Part AdjunctionsAndLocalizations §1.1.3 (HTT, Def. 5.2.2.1, p. 358).

**7.3.3.** Prove that the intersection of a small family of accessible subcategories of an accessible C is an accessible
subcategory (HTT, Prop. 5.4.7.10, p. 470). Route: the intersection is the categorical pullback of the product
of the subcategories over the diagonal `C → ∏ C`; the product and its inclusion are accessible (§6.3), so §7.1
applies.

*Needs:*
- §7.3.1 (HTT, Def. 5.4.7.8); §6.3.1 (HTT, Lemma 5.4.7.2); §7.1.4 (HTT, Prop. 5.4.6.6);
- ModelCategoryTheory, Part ModelCategories §3.5.1 (HTT, §A.2.4, p. 833);
- §4.1.1 (HTT, Def. 5.4.2.1, p. 441; Def. 5.4.2.5, p. 443); Part InfinityCategoryFoundations §1.1 (HTT,
  §1.2.15, p. 68).

### Examples

- For X = Y = `Y'` and p, q identities, §7.1 returns X; for `Y = Δ[0]`, the categorical pullback is the
  product `X × Y'`, recovering the binary case of §6.3.
- §7.2 for K = `Δ[0]` says that the over-category of an object of an accessible ∞-category is accessible; for
  the nerve of a category this matches Mathlib's accessibility of over-categories.
- §7.3 for two accessible subcategories of `Fun(Δ[1], S)`, those of equivalences and those of maps with
  contractible target, has intersection the morphisms between contractible spaces, an accessible subcategory
  equivalent to `Δ[0]`. The 1-categorical form for presentable categories is ModelCategoryTheory, Part
  ModelCategories (HTT, §A.2.6, intersections of accessible subcategories).

### Dependencies

Layers 1–6; Part InfinityCategoryFoundations, Part CartesianFibrations, Part LimitsAndKanExtensions,
Part AdjunctionsAndLocalizations, Part PresheavesAndCompletions; ModelCategoryTheory, Part ModelCategories;
Tau Ceti `SSet.fullEnhancedSubcategory`.

## Layer 8: Limits in `Cat∞` and the ∞-category `Acc`

### 8.1 Recognizing limits in `Cat∞` through coCartesian fibrations

**8.1.1.** Prove that for an ∞-category C and a functor `χ : C^◁ → Cat∞` classifying a coCartesian fibration
`q : D → C^◁`, χ is a limit diagram exactly when (a) the transport functors `e_C : D_v → D_C` from the fiber
over the cone point v are jointly conservative, and (b) every section of q over C carrying the morphisms of C
to q-coCartesian morphisms extends to a q-limit diagram over `C^◁` carrying the edges from v to q-coCartesian
morphisms; moreover, under these conditions, every section over `C^◁` carrying all morphisms to q-coCartesian
morphisms is a q-limit diagram (HA, Prop. 5.2.2.36, p. 835). Route: the limit of χ is the ∞-category of
coCartesian sections over C, and the comparison from `D_v` is the restriction from coCartesian sections over
`C^◁`; (b) gives a right adjoint to that restriction, fully faithful, and (a) makes the unit invertible.

*Needs:*
- Part Straightening §3.2.1 (HTT, Prop. 3.3.3.1, p. 232) and Part LimitsAndKanExtensions §7.4.6 (HTT, Prop.
  4.3.2.15, p. 302);
- Part Straightening §2.1.2 (HTT, Def. 3.3.2.2, p. 229); Part LimitsAndKanExtensions §7.1.1 (HTT, Def. 4.3.1.1, p. 279); Part InfinityCategoryFoundations §1.2.4 (HTT, Def. 1.2.13.4, p. 65); Part InfinityCategoryFoundations §2.1.8 (HTT, §1.2.10, fully faithful functors);
- Part CartesianFibrations §1.5.1 (HTT, §2.4.1, coCartesian edges, p. 136);
- Mathlib `HomotopicalAlgebra.ModelCategory` (HTT, Def. A.2.1.1, p. 828).

### 8.2 Lifting limit diagrams along conservative transformations

**8.2.1.** Prove that for a natural transformation `ρ : χ → χ'` between functors `C^◁ → Cat∞` such that χ' is a limit
diagram, every component `ρ(C)` is conservative, `χ(v)` admits C-indexed limits preserved by `ρ(v)`, and every
naturality square of ρ is right adjointable, χ is a limit diagram (HA, Cor. 5.2.2.37, p. 836). Route: verify
(a) and (b) of §8.1 for the coCartesian fibration classified by χ, using the corresponding conditions for χ'.
Right adjointability makes the fibrations Cartesian too, with ρ preserving Cartesian morphisms; conservativity
transfers (a), and a section of χ is completed by computing its limit in `χ(v)` and comparing with the
q'-limit through ρ.

*Needs:*
- §8.1.1 (HA, Prop. 5.2.2.36);
- Part LimitsAndKanExtensions §7.3.1 (HTT, Props. 4.3.1.9–4.3.1.10, pp. 282–283);
- Part Straightening §5.1.1 (HTT, Def. 7.3.1.2, p. 768); Part AdjunctionsAndLocalizations §1.3.3 (HTT, Cor.
  5.2.2.5, p. 359);
- Part InfinityCategoryFoundations §1.2 (HTT, Notation 1.2.7.2, p. 57); Tau Ceti `SSet.Edge.IsCartesian` (HTT, Def. 2.4.1.1,
  p. 133); Part InfinityCategoryFoundations §1.2.2 (HTT, Notation 1.2.8.4, p. 59); Part CartesianFibrations §1.1.1 (HTT, Def. 2.4.2.1, p.
  139); Part LimitsAndKanExtensions §7.1.1 (HTT, Def. 4.3.1.1, p. 279);
- Part CartesianFibrations §1.5.1 (HTT, §2.4.1, coCartesian edges, p. 136).

### 8.3 Colimits in right fibrations

**8.3.1.** Prove that for a right fibration `f : C̃ → C` classified, in the sense of Part InfinityCategoryFoundations §7.1, by
`χ^op : C → S^op` for a functor `χ : C^op → S`, and a diagram `p : K^▷ → C`, the
following are equivalent: (1) every diagram `K → C̃` over `p|K` extends to an f-colimit diagram over p; (2)
the restriction of χ to `(K^▷)^op` is a limit diagram in S; and when p is a colimit diagram these are also
equivalent to (3) every such diagram extends to a colimit diagram in `C̃` whose image in C is a colimit
diagram (HA, Cor. 5.2.2.39, p. 837). Route: through the inclusion of spaces into `Cat∞`, χ classifies the
coCartesian fibration `f^op` (Part Straightening §2.5); apply §8.1 to it, where
condition (a) is automatic for a right fibration (all morphisms of the fibers are invertible) and condition
(b) is (1); S is closed under limits in `Cat∞`. When p is a colimit diagram, f-colimits and colimits in `C̃`
over colimits in C agree.

*Needs:*
- §8.1.1 (HA, Prop. 5.2.2.36);
- Part LimitsAndKanExtensions §7.2.1 (HTT, Prop. 4.3.1.5, p. 279);
- Part LimitsAndKanExtensions §7.1.1 (HTT, Def. 4.3.1.1, p. 279); Tau Ceti `SSet.RightFibration` (HTT, Def. 2.0.0.3, p.
  71); Part InfinityCategoryFoundations §7.1.6 (classification of right fibrations through the universal right fibration; HTT,
  §3.3.2, p. 230); Part Straightening §2.5.4 (agreement with the classification through `Z → Cat∞^op` and the
  inclusion of spaces into `Cat∞`; HTT, Prop. 3.3.2.5, p. 230);
- Part InfinityCategoryFoundations §5.5.4 (HTT, Prop. 1.2.12.9 and Rem. 1.2.13.5, pp. 64–65).

### 8.4 The subcategories `Cat∞(𝒦)`

**8.4.1.** Define, for a collection 𝒦 of simplicial sets, `Cat∞(𝒦) ⊆ Cat∞` to be the subcategory whose objects are the
∞-categories admitting K-indexed colimits for every K in 𝒦 and whose morphisms are the functors preserving
K-indexed colimits for every K in 𝒦 (HA, Def. 4.8.1.1, p. 707). It is a subcategory in the sense of Part InfinityCategoryFoundations §1.2 (HTT, §1.2.11, p. 62): closed under equivalence and composition.

- Objects and morphisms are closed under equivalence; identities and composites of colimit-preserving functors
  preserve colimits, so `Cat∞(𝒦)` is a subcategory.
- If 𝒦 ⊆ 𝒦', then `Cat∞(𝒦') ⊆ Cat∞(𝒦)`.

**Checks.**

- For 𝒦 empty, `Cat∞(𝒦) = Cat∞`; nothing is imposed.
- For 𝒦 = {∅}, the objects are the ∞-categories with an initial object and the morphisms preserve initial
  objects. The functor `Δ[0] → N([1])` at 1 is excluded, because 1 is not initial in `[1]`; the functor at 0
  is included. A full subcategory would contain both.
- For 𝒦 = {`Λ[2,0]`} and nerves of ordinary categories with pushouts, a functor belongs exactly when it
  preserves pushouts, in agreement with Mathlib's preservation of colimits of span shape.
- For 𝒦 the collection of all small simplicial sets, the objects are the small ∞-categories with small
  colimits; `Δ[0]` belongs, and S, being large, does not. A definition taken inside `Ĉat∞` would contain S.

*Needs:*
- Tau Ceti `SSet.catInfty` (HTT, Def. 3.0.0.1, p. 162);
- Part InfinityCategoryFoundations §1.2.4 (HTT, Def. 1.2.13.4, p. 65); Part InfinityCategoryFoundations §1.2.1 (HTT, §1.2.11, p. 62); Part InfinityCategoryFoundations §1.1 (HTT, §1.2.15, p. 68).

### 8.5 The ∞-categories `Acc_κ` and `Acc`

**8.5.1.** Define, for κ regular, `Acc_κ ⊆ Ĉat∞` to be the subcategory whose objects are the κ-accessible ∞-categories
and whose morphisms are the κ-continuous functors that carry κ-compact objects to κ-compact objects, and `Acc`
to be the union of the `Acc_κ` over all regular κ, the ∞-category of accessible ∞-categories (HTT, Def.
5.4.2.14, p. 445). Here `Ĉat∞` is the ∞-category of not necessarily small ∞-categories (Tau Ceti
`SSet.catInfty` (HTT, Def. 3.0.0.1, p. 162), in the next universe).

- Objects and morphisms are closed under equivalence and composition, so `Acc_κ` and `Acc` are subcategories.
- The objects of `Acc` are the accessible ∞-categories; its morphisms are accessible functors, and by the
  uniformization of a single functor (§5.2 (HTT, Rem. 5.4.2.13)) every accessible functor between accessible
  ∞-categories is a morphism of some `Acc_κ`.

**Checks.**

- `Δ[0]` is κ-accessible for every κ and its identity is a morphism of every `Acc_κ`, since `Ind_κ(Δ[0])` is
  equivalent to `Δ[0]`.
- The constant functor `S → S` at a discrete space with κ points is κ-continuous (colimits of constant
  diagrams over κ-filtered, hence weakly contractible, ∞-categories are constant) but does not carry the
  point, which is κ-compact, to a κ-compact object; it is not a morphism of `Acc_κ`. A definition using
  κ-continuity alone would accept it.
- `Acc` is not a full subcategory of `Ĉat∞`: the composite of π₀ from S to sets, the covariant power-set
  functor and the inclusion of sets into S is a functor between accessible ∞-categories that is not
  accessible, as the power-set functor preserves κ-filtered colimits for no κ.
- For nerves of ordinary categories, the morphisms of `Acc_κ` are the κ-accessible functors preserving
  κ-presentable objects in Mathlib's sense, the class produced by Mathlib's uniformization theorem.

*Needs:*
- §4.1.1 (HTT, Def. 5.4.2.1, p. 441; Def. 5.4.2.5, p. 443); Tau Ceti `SSet.catInfty` (HTT, Def.
  3.0.0.1, p. 162); Part PresheavesAndCompletions §6.1.1 (HTT, Def. 5.3.4.5, p. 414); Part InfinityCategoryFoundations §1.2.1 (HTT, §1.2.11, p.
  62).

### 8.6 `Acc` has small limits

**8.6.1.** Prove that `Acc` admits small limits and that its inclusion into `Ĉat∞` preserves them (HTT, Prop. 5.4.7.3, p.
467). Route: a small limit in `Ĉat∞` is a homotopy limit of a strict diagram, built from products and
categorical pullbacks; products are handled by §6.3 and categorical pullbacks by §7.1, with the criteria for
functors into them identifying the limit cone in `Acc`.

*Needs:*
- §6.3.1 (HTT, Lemma 5.4.7.2); §7.1.4 (HTT, Prop. 5.4.6.6); §8.5.1 (HTT, Def. 5.4.2.14);
- Part LimitsAndKanExtensions §3.2.1 (HTT, Thm. 4.2.4.1, p. 275, applied to `(Set⁺_Δ)°` one universe up, object by object through small full subcategories, as in its §3.3 (*Size*)) and §6.5.4 (HTT,
  Prop. 4.4.2.6, p. 314);
- ModelCategoryTheory, Part ModelCategories §3.5.1 (HTT, §A.2.4, p. 833);
- Tau Ceti `SSet.catInfty` (HTT, Def. 3.0.0.1, p. 162);
- §4.1.1 (HTT, Def. 5.4.2.1, p. 441; Def. 5.4.2.5, p. 443) and Part InfinityCategoryFoundations §2.1.5 (HTT, Def.
  1.1.5.5, p. 40).

### 8.7 Sections over `Δ[1]`

**8.7.1.** Prove that for a coCartesian fibration `p : M → Δ[1]` classifying a functor `F : C → D`, with C and D the
fibers over 0 and 1, the ∞-category `Map_{Δ[1]}(Δ[1], M)` of sections is a homotopy limit of the diagram
`C → Fun({0}, D) ← Fun(Δ[1], D)`, the first map being F (HTT, Lemma 5.4.7.15, p. 471). Route: F is associated
to M by a section of the correspondence; comparing the marked simplicial sets of sections through marked
anodyne maps gives trivial fibrations from an intermediate ∞-category to both the ∞-category of sections and
the homotopy pullback.

*Needs:*
- Part AdjunctionsAndLocalizations §1.1.2 (HTT, Def. 5.2.1.1, p. 353); Tau Ceti `TauCeti.MarkedSSet` (HTT, Def. 3.1.0.1); Part Straightening §2.1.2 (HTT, Def. 3.3.2.2, p. 229);
- Part CartesianFibrations §5.4.1 (HTT, Prop. 3.1.2.3, p. 170); Part CartesianFibrations §7.4.1 (HTT, Prop.
  3.3.1.7, p. 227, over the ∞-category `Δ[1]`); Part CartesianFibrations §4.1.1 (HTT, Def. 2.3.1.3, p. 115);
  Part CartesianFibrations §1.5.1 (HTT, §2.4.1, coCartesian edges, p. 136); Part InfinityCategoryFoundations §9.4.1 (HTT,
  §2.2.5);
- ModelCategoryTheory, Part SimplicialCategories §3.2.1 (HTT, §A.2.8, p. 851);
- Mathlib `HomotopicalAlgebra.ModelCategory` (HTT, Def. A.2.1.1, p. 828).

### 8.8 Section ∞-categories in a subcategory of `Ĉat∞`

**8.8.1.** Let `𝒞 ⊆ Ĉat∞` be a subcategory that admits small limits preserved by the inclusion, contains `Fun(Δ[1], X)`
for each of its objects X, and in which a functor `X → Fun(Δ[1], Y)` between objects is a morphism exactly
when both evaluations are. Let `p : X → S` be a categorical fibration and locally coCartesian fibration over a
small simplicial set S, whose fibers are objects of 𝒞 and whose transport functors are morphisms of 𝒞. For a
set E of edges of S, let Y be the full subcategory of `Map_S(S, X)` on the sections carrying each edge e of E
to a coCartesian edge of the pullback of p along e (a locally coCartesian edge). Then Y is an object of 𝒞, and
a functor from an object of 𝒞 into Y is a morphism of 𝒞 exactly when each evaluation `Y → X_s` is (HTT, Prop.
5.4.7.11, p. 470). The proof is the following two statements.

- Prove the case E = ∅: `Map_S(S, X)` lies in 𝒞, with the stated criterion for functors (HTT, Prop. 5.4.7.11,
  proof for E empty, pp. 472–473). Route: `Map_S(S, X)` is the limit over the skeleta of S, each step a
  homotopy pullback along `S_n × ∂Δ[n] ⊆ S_n × Δ[n]` because p is a categorical fibration; this reduces to S =
  `Δ[n]`, then, through the trivial fibration of section ∞-categories along the inner horn `Λ[n,1] ⊆ Δ[n]`, to
  S = `Δ[1]`, where §8.7 presents the sections as a homotopy limit of objects and morphisms of 𝒞.

  *Needs:* §8.7.1 (HTT, Lemma 5.4.7.15); Part InfinityCategoryFoundations §9.2.2 (HTT, Cor. 2.3.2.5, p. 119); Part
  InfinityCategoryFoundations §9.5.1 (HTT, Thm. 2.2.5.1, p. 107); Part LimitsAndKanExtensions §3.2.1 (HTT, Thm. 4.2.4.1, p.
  275, applied to `(Set⁺_Δ)°` one universe up, object by object through small full subcategories, as in its §3.3 (*Size*)).
- Prove the general case (HTT, Prop. 5.4.7.11, pp. 470–474). Route: the subcategory Y is the intersection over
  the edges of E, a limit in 𝒞, so it suffices to treat one edge `e : s → s'`; by §8.7.1, the sections
  coCartesian on e form the homotopy pullback of `Map_S(S, X)` with the full subcategory of equivalences in
  `Fun(Δ[1], X_{s'})`, which is equivalent to `X_{s'}` and lies in 𝒞 by the hypotheses.

  *Needs:* the case E = ∅ above (HTT, Prop. 5.4.7.11, proof for E empty); §8.7.1 (HTT, Lemma 5.4.7.15); Part
  CartesianFibrations §1.5.1 (HTT, §2.4.1, coCartesian edges, p. 136); Part CartesianFibrations §2.3.1 (HTT, Def.
  2.4.2.6, p. 141); Tau Ceti `SSet.catInfty` (HTT, Def. 3.0.0.1, p. 162).

### 8.9 Section ∞-categories of accessible fibrations

**8.9.1.** Prove that for a coCartesian (or Cartesian) fibration `p : X → S` over a small simplicial set, with accessible
fibers and accessible transport functors, the ∞-category `Map_S(S, X)` is accessible, and a functor from an
accessible ∞-category into it is accessible exactly when each evaluation is (HTT, Cor. 5.4.7.17, p. 474).
Route: apply §8.8 with E empty, after checking its hypotheses.

- On p (HTT, Rem. 5.4.7.12, p. 471): a coCartesian fibration with fibers and transports in 𝒞 is a
  categorical fibration by the coCartesian form of Part Straightening §2.3 (HTT, Prop. 3.3.1.7, p. 227, over
  an arbitrary base), and its coCartesian edges are locally coCartesian.
- On 𝒞 = `Acc` (HTT, Rem. 5.4.7.13, p. 471, second example): small limits by §8.6; `Fun(Δ[1], X)` is
  accessible for accessible X by §6.2; a functor from an accessible ∞-category into `Fun(Δ[1], Y)` is
  accessible exactly when both evaluations are, since colimits in functor ∞-categories are computed and
  detected pointwise (Part LimitsAndKanExtensions §8.2) and a κ-continuous functor is τ-continuous for τ ≥ κ.
  The morphisms of `Acc` are exactly the accessible functors between accessible ∞-categories (§8.5, by §5.2,
  HTT, Rem. 5.4.2.13), which translates both the hypothesis on transport functors and the conclusion.
- The Cartesian case (HTT, Rem. 5.4.7.14, p. 471) applies §8.8 to `Xᵒᵖ → Sᵒᵖ`, with `Acc` replaced by its
  preimage under passing to opposites, which again satisfies the three hypotheses since
  `Fun(Δ[1], X)ᵒᵖ ≅ Fun(Δ[1], Xᵒᵖ)` through the flip of Δ[1]; `(−)ᵒᵖ` preserves categorical fibrations and
  exchanges Cartesian and coCartesian edges.

*Needs:*
- §8.8.1 (HTT, Prop. 5.4.7.11, case E empty); §8.5.1 (HTT, Def. 5.4.2.14); §5.2.4 (HTT, Rem. 5.4.2.13); §8.6.1 (HTT,
  Prop. 5.4.7.3); §6.2.1 (HTT, Prop. 5.4.4.3);
- Part LimitsAndKanExtensions §8.2.2 (HTT, Prop. 5.1.2.2, p. 336; Cor. 5.1.2.3, p. 337);
- Part Straightening §2.3.1 (HTT, Prop. 3.3.1.7, p. 227) and Part CartesianFibrations §2.3.1 (HTT, Def. 2.4.2.6,
  p. 141); Part CartesianFibrations §1.5.1 (HTT, §2.4.1, coCartesian edges, p. 136);
- Part CartesianFibrations §7.4.2 (HTT, Prop. 3.3.1.8, p. 228, whose route records that `(−)ᵒᵖ` preserves
  categorical fibrations); Mathlib `SSet.opFunctor`; Tau Ceti `SSet.Edge.IsCartesian` (HTT, Def. 2.4.1.1,
  p. 133);
- Tau Ceti `SSet.CartesianFibration` (HTT, Def. 2.4.2.1, p. 139);
- §4.1.1 (HTT, Def. 5.4.2.1, p. 441; Def. 5.4.2.5, p. 443), Part CartesianFibrations §1.1.1 (HTT, Def.
  2.4.2.1, p. 139, second sentence) and Part InfinityCategoryFoundations §1.1 (HTT, §1.2.15, p. 68).

### Examples

- §8.1 for C empty: `C^◁ = Δ[0]`, χ picks an ∞-category `D_v`, and χ is a limit diagram exactly when `D_v` is
  contractible. Condition (a), for the empty family of functors, says that every morphism of `D_v` is
  invertible; condition (b) asks for a q-limit of the empty section, that is a final object of `D_v`. A Kan
  complex with a final object is contractible, so the criterion gives the right answer.
- §8.3 for K empty: (1) says that there is an f-initial object of `C̃` over `p(∞)`, (2) that `χ(p(∞))` is
  contractible.
- For S = `Δ[0]`, §8.9 says that a single accessible ∞-category is accessible; for S a small set, it is §6.3;
  for p the projection `C × S → S`, it is §6.2.
- For 𝒦 = {∅, `Λ[2,0]`} together with all small discrete simplicial sets, `Cat∞(𝒦)` has as objects the small
  ∞-categories with an initial object, pushouts and small coproducts, that is with all small colimits, for
  instance `Δ[0]`, and as morphisms the functors preserving small colimits; the analogous subcategory of
  `Ĉat∞` (HTT, Rem. 5.4.7.13, p. 471) contains S, and products with a fixed space are morphisms of it.

### Dependencies

Layers 5–7; Part PresheavesAndCompletions, Part InfinityCategoryFoundations, Part CartesianFibrations, Part LimitsAndKanExtensions,
Part AdjunctionsAndLocalizations, Part Straightening; ModelCategoryTheory Parts ModelCategories and
SimplicialCategories; Tau Ceti `SSet.catInfty`.

## Downstream consumers

This roadmap is used by every later member of the InfinityCategoryTheory family, each of which lists what it uses from it in its own supplier contracts.

## References

- **HTT.** Jacob Lurie, *Higher Topos Theory*, author's PDF, version of 9 April 2017,
  [math.ias.edu/~lurie/papers/HTT.pdf](https://www.math.ias.edu/~lurie/papers/HTT.pdf) (published as Annals of
  Mathematics Studies 170, Princeton University Press, 2009). Statement numbers and pages are those of this PDF;
  its PDF page numbers run 18 ahead of its printed page numbers.
  Cited by
  theorem number and PDF page: §§5.3.4–5.3.5 (pp. 414–428), §5.4 (pp. 437–474), and the definitions and
  results of earlier chapters through the Parts above.
- **HA.** Jacob Lurie, *Higher Algebra*, author's PDF, version of 18 September 2017,
  [math.ias.edu/~lurie/papers/HA.pdf](https://www.math.ias.edu/~lurie/papers/HA.pdf). Statement numbers and pages
  are those of this PDF, whose PDF and printed page numbers agree.
  Cited: Def. 4.8.1.1
  (p. 707), Prop. 5.2.2.36 (p. 835), Cors. 5.2.2.37 and 5.2.2.39 (pp. 836–837).
- **SAG.** Jacob Lurie, *Spectral Algebraic Geometry*, author's PDF, version of 3 February 2018,
  [math.ias.edu/~lurie/papers/SAG-rootfile.pdf](https://www.math.ias.edu/~lurie/papers/SAG-rootfile.pdf). Statement
  numbers and pages are those of this PDF, whose PDF and printed page numbers agree.
  Cited: proof of Lemma 4.5.3.1 (p. 403).
- **AR94.** Jiří Adámek and Jiří Rosický, *Locally presentable and accessible categories*, London
  Mathematical Society Lecture Note Series 189, Cambridge University Press, 1994. The 1-categorical
  theory compared in the Checks and Examples: accessible categories (Ch. 2) and sharply smaller
  cardinals (Thm. 2.11), as formalized in Mathlib.

