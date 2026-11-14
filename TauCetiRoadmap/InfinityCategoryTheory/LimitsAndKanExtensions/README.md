# Roadmap: limits and colimits, cofinality and Kan extensions in ∞-categories

**Summary.** This Part develops limits and colimits in ∞-categories, from fat joins and fat slices up to
cofinality, Quillen's Theorem A, Kan extensions and the colimits of simplicial diagrams.

It builds on Parts InfinityCategoryFoundations and CartesianFibrations.

- **Fat joins and slices (Layer 1).** Fat joins, fat slices and relative slices, the homotopy-invariant models of
  cones.
- **Cofinality (Layers 2 and 4).** Cofinal maps (defined in §2.1) and right anodyne maps, and cofinality detected
  by colimits.
- **Homotopy colimits (Layer 3).** Homotopy colimits in simplicial categories, and limits and colimits in the
  ∞-category of spaces and in `Cat∞`.
- **Theorem A (Layer 5).** Smooth maps and Quillen's Theorem A for ∞-categories.
- **Decomposing diagrams (Layer 6).** Decompositions of diagrams, nerve replacements and finite colimits.
- **Kan extensions (Layer 7).** Relative colimits and left Kan extensions (defined in §7.1).
- **Functor ∞-categories and spaces (Layer 8).** Presheaf ∞-categories (defined in §8.1), and colimits in functor
  ∞-categories and in spaces.
- **Simplicial diagrams (Layer 9).** Simplicial objects, groupoid objects and Čech nerves (defined in §9.1),
  geometric realizations, and limits of semisimplicial objects over nonsingular simplicial sets.

**Headline theorems.**
- Cofinal maps are exactly the maps along which restriction preserves colimit cocones in small ∞-categories (HTT,
  Prop. 4.1.1.8, p. 244), and exactly the right anodyne maps followed by trivial fibrations (HTT, Cor. 4.1.1.12,
  p. 246); categorical equivalences are cofinal (HTT, Cor. 4.1.1.9, p. 245).
- Quillen's Theorem A for ∞-categories: cofinal maps are characterized by weakly contractible fiber products with
  coslices (HTT, Thm. 4.1.3.1, p. 254); in particular semisimplicial indexing is cofinal (HTT, Lemma 6.5.3.7,
  p. 694).
- Every simplicial set receives a cofinal map from the nerve of a category and from the nerve of a partially
  ordered set (HTT, Prop. 4.2.3.14, p. 272; Variant 4.2.3.15, p. 273).
- Homotopy colimits in locally Kan simplicial categories are colimits in their coherent nerves (HTT,
  Thm. 4.2.4.1, p. 275), so the underlying ∞-category of a combinatorial simplicial model category has small
  limits and colimits (HTT, Cor. 4.2.4.8, p. 278); in particular the ∞-category of spaces and `Cat∞` have small
  limits and colimits (HTT, §3.3.3, introduction, p. 232).
- A functor on a full subcategory has a pointwise left Kan extension exactly when the pointwise colimits exist,
  and restriction from Kan extensions is a trivial fibration (HTT, Lemma 4.3.2.13, p. 300; Prop. 4.3.2.15,
  p. 302).
- Colimits in functor ∞-categories are computed pointwise (HTT, Cor. 5.1.2.3, p. 337).
- A colimit of spaces is the weak homotopy type of the total space of the classified left fibration (HTT,
  Prop. 3.3.4.5, p. 237).

## Scope and ownership

The definitions it builds on are stated in Part InfinityCategoryFoundations, or here, at the start of the layer that first uses them. Part InfinityCategoryFoundations states initial and final objects (HTT, §1.2.12) and colimit diagrams (HTT, Def. 1.2.13.4) in §1.2, and the ∞-category of spaces `S` (HTT, Def. 1.2.16.1, p. 69) and the notion of a right or left fibration classified by a map to spaces in §7.1 (the unmarked notion; existence by Part InfinityCategoryFoundations §7.7). This Part states cofinal maps (HTT, Def. 4.1.1.1, p. 241) in §2.1; relative colimits (HTT, Def. 4.3.1.1, p. 279) and left Kan extensions along a full subcategory (HTT, Def. 4.3.2.2, p. 289) and along a functor (HTT, Def. 4.3.3.2, p. 303), with the pointwise form (Kerodon, Variant 7.3.1.5), in §7.1; presheaf ∞-categories (HTT, Def. 5.1.0.1) in §8.1; and simplicial and groupoid objects and Čech nerves (HTT, Defs. 6.1.2.2, 6.1.2.7) in §9.1. `Cat∞` (HTT, Def. 3.0.0.1) is Tau Ceti's. This Part proves their theory. Joins, slices, left and right fibrations, the covariant and contravariant model structures, the Joyal model structure, mapping spaces, unmarked straightening and the classification of right fibrations are Part InfinityCategoryFoundations'. Cartesian and coCartesian fibrations, the mapping simplex, the Cartesian model structure on marked simplicial sets, base change along (co)Cartesian fibrations and the fiberwise criteria are Part CartesianFibrations'. Model-categorical inputs are ModelCategoryTheory's.

Quillen's Theorem A for ordinary categories is the specialization of the ∞-categorical theorem to nerves, a Check in §5.4. Mathlib already has 1-categorical final functors (`CategoryTheory.Functor.Final`) and Kan extensions (`CategoryTheory.Functor.IsLeftKanExtension`). Tau Ceti already has joins, slices and coslices, limit and colimit cones (`SSet.slice.IsLimit`, `SSet.coslice.IsColimit`), left and right fibrations and anodyne maps, functor quasicategories over a base (`SSet.ihomOver`), full subcategories, weakly contractible simplicial sets, weak homotopy equivalences and `SSet.catInfty`. They are inputs here, not targets.

Adjunctions, localizations and Kan extensions as adjoints to restriction are Part AdjunctionsAndLocalizations'. The descriptions of limits and colimits in `Cat∞` by Cartesian sections and by inverting Cartesian edges, the fiberwise criterion for Kan extensions along a map of coCartesian fibrations (HTT, Prop. 4.3.3.10), and the classification of Cartesian fibrations by maps to `Cat∞ᵒᵖ` (HTT, Def. 3.3.2.2) belong with marked straightening and are not stated here.

## Conventions

Locators such as (HTT, Prop. 5.2.7.8, p. 385) refer to the editions listed under [References](#references).

Every statement to prove, define or construct carries a label `X.Y.Z` — its section, then its position within that
section — and a single labeled statement, cited as `§2.2.2` here and `Part LimitsAndKanExtensions §2.2.2`
elsewhere, is one target.

- An ∞-category is a quasicategory, Mathlib `SSet.Quasicategory`; an object is a vertex and a morphism an edge. Functor ∞-categories are Mathlib's internal hom `(ihom K).obj C`, whose quasicategory instance Mathlib supplies; write `Fun(K, C)`. For `p : E ⟶ B` and `f : K ⟶ B`, `Map_B(K, E)` is Tau Ceti's `SSet.ihomOver p f`.
  **Checks.**
  - `Fun(∅, C)` is `Δ[0]` and `Fun(Δ[0], C)` is isomorphic to C. A definition of functor categories by vertices alone would lose the edges that make `Fun(Δ[1], C)` the arrow ∞-category.
  - For `p = 𝟙_B`, `Map_B(K, B)` is a point, because Tau Ceti's `SSet.ihomOver.isTerminalId` says it is terminal.
- The cone `K^▷` is the join `K ⋆ Δ[0]` (Tau Ceti `SSet.join`), and `K^◁ = Δ[0] ⋆ K`. A cocone under `p : K ⟶ C` is a vertex of the coslice `C_{p/}` (Tau Ceti `SSet.coslice`). It is a colimit cocone when it is an initial vertex there (Tau Ceti `SSet.coslice.IsColimit`, HTT, Def. 1.2.13.4, p. 65). Limits are dual, through `SSet.slice.IsLimit`.
  **Checks.**
  - For K empty the coslice is C (Tau Ceti `SSet.coslice.isIso_π`), so colimits of the empty diagram are initial objects. Reading the cone point on the left instead would make them final objects.
  - For `p : Δ[0] ⟶ C` at x, the identity cocone is a colimit: `C_{x/}` has the initial object `id_x`.
  - For a nerve, colimit cocones are colimit cocones in Mathlib's sense over the homotopy category of the index (§1.4.2); for K empty this is Tau Ceti `SSet.coslice.isColimit_iff_nonempty_isInitial`.
- *Cofinal* is HTT's notion, defined in §2.1 (HTT, Def. 4.1.1.1, p. 241) by restriction of sections of right fibrations. It is Kerodon's "right cofinal" (Kerodon, Def. 7.2.1.1) and HA's and SAG's "left cofinal"; the notion for limits is written "vᵒᵖ is cofinal". It is the ∞-categorical form of Mathlib's `CategoryTheory.Functor.Final`. The Checks that pin the variance are in §2.1.
  **Checks.**
  - The inclusion `{1} ⊆ Δ[1]` is cofinal and `{0} ⊆ Δ[1]` is not (§2.1). With left fibrations in place of right ones the two inclusions would swap roles; that is the notion for limits.
- The weak homotopy equivalences are Tau Ceti's `SSet.IsWeakHomotopyEquivalence`: bijections on `π₀ Fun(−, Z)` for every Kan complex Z. Weakly contractible means Tau Ceti's `SSet.IsWeaklyContractible`. Trivial fibrations are the maps with the right lifting property against monomorphisms.
  **Checks.**
  - `∂Δ[2]` is connected but not weakly contractible, so weak contractibility is not connectedness.
  - `∅` is not weakly contractible: for the Kan complex `Z = ∅`, the inclusion of constant maps is `∅ ⟶ Fun(∅, ∅) = Δ[0]`.
  - Every standard simplex is weakly contractible.
- Sizes follow Part InfinityCategoryFoundations §1.1: small simplicial sets lie in a fixed universe u, and `S = N(Kan)` and `Cat∞` are large. "Small limits" means limits indexed by small simplicial sets. The colimit criterion for cofinality (§4.2, §4.3) quantifies over small test ∞-categories. Right anodyne maps are cofinal against right fibrations in every universe, by lifting (§2.3), and so are categorical equivalences into ∞-categories (§2.6); so these maps preserve colimits in large ∞-categories such as `S` and `Cat∞` as well (§2.5). That every cofinal map is cofinal in every universe is the general statement of §4.2, step 4.
  **Checks.**
  - The colimit criterion rejects `{0} ⊆ Δ[1]` already in the small ∞-category `C = Δ[1]`: the identity diagram of Δ[1] has a colimit cocone with cone point 1, and its restriction to `{0}` is the edge `0 ⟶ 1`, which is not a colimit cocone of the object 0.
  - For `v = {1} ⊆ Δ[1]` and C = Δ[1], the colimit cocone of the identity diagram, with cone point 1, restricts to the identity of 1, a colimit of the object 1, as cofinality of `{1}` predicts. With the previous Check, the small ∞-category Δ[1] already separates `{1}` from `{0}`.
  - `S` is not small: it has a vertex for every small Kan complex. So Lemma L (§3.7) is a statement about a large ∞-category, and §3.3 and §3.7 handle the size of `Kanᵒᵖ` explicitly.
- κ is a regular cardinal, and a simplicial set is κ-small when it has fewer than κ nondegenerate simplices. τ ≪ κ is the relation of ModelCategoryTheory, Part ModelCategories (HTT, Def. A.2.6.3).
  **Checks.**
  - `Δ[n]` is κ-small for every infinite κ, and `N(ℕ)` is ℵ₁-small but not ω-small. A count of all simplices instead of nondegenerate ones would make `Δ[0]` infinite.
  - The empty simplicial set is κ-small for every κ, so κ-small colimits include initial objects (§6.5).
  - `∂Δ[1]` is ω-small, so ω-small colimits include binary coproducts.
- A right fibration `X ⟶ K` is classified by `p : K ⟶ Sᵒᵖ` when it is joined to `K ×_{Sᵒᵖ} (Sᵒᵖ)_{/∗}` by a zigzag of pointwise equivalences of right fibrations over K (Part InfinityCategoryFoundations §7.1); a left fibration `X ⟶ K` is classified by `K ⟶ S` when `Xᵒᵖ ⟶ Kᵒᵖ` is classified by the opposite map. Such classifying maps exist for small X (Part InfinityCategoryFoundations §7.7 (3), and (4) for left fibrations, HTT, Cor. 3.3.2.8), and equivalent classifying maps classify pointwise-equivalent fibrations (Part InfinityCategoryFoundations §7.7 (5)). Uniqueness is used only in that form, in §8.3.
  **Checks.**
  - The identity of K is classified as a left fibration by the constant map at the point ∗: the pullback of `S_{∗/} ⟶ S` along it has fiber `Map_S(∗, ∗)`, contractible, over every vertex. The constant map at the empty space classifies the empty fibration instead.
  - The left fibration `{1} ⊆ Δ[1]` is classified by a map `Δ[1] ⟶ S` with values ∅ at 0 and the point at 1: its fiber over 0 is empty. A classification by a constant map would have equal fibers.
  - Pointwise equivalences are tested on fibers only: the right fibration `J ⟶ Δ[0]`, for the nerve J of the free-living isomorphism, a contractible Kan complex, and the identity of Δ[0] have contractible fibers and are pointwise equivalent, though J is not isomorphic to Δ[0].
- Page numbers are those of the author PDFs listed in References.

## Exact supplier contracts

### From Mathlib

Declarations at the library pin; paths are relative to the Mathlib repository.

- `SSet.Quasicategory` (`Mathlib/AlgebraicTopology/Quasicategory/Basic.lean`), `SSet.InnerFibration` (`Mathlib/AlgebraicTopology/Quasicategory/InnerFibration.lean`), `SSet.KanComplex` (`Mathlib/AlgebraicTopology/SimplicialSet/KanComplex.lean`): the standing horn-filling notions.
- The internal hom `ihom K` of `SSet` and the instance `Quasicategory ((ihom K).obj C)` (`Mathlib/AlgebraicTopology/SimplicialSet/AnodyneExtensions/Inner/PushoutProduct.lean`), `MonoidalClosed.pre` for restriction along a map, and `SSet.innerAnodyneExtensions`, `SSet.innerAnodyneExtensions_pushoutObjObjι` (`Mathlib/AlgebraicTopology/SimplicialSet/AnodyneExtensions/`).
- `MorphismProperty.monomorphisms`, `MorphismProperty.rlp`, `SSet.rlp_monomorphisms` (`Mathlib/CategoryTheory/MorphismProperty/`, `Mathlib/AlgebraicTopology/SimplicialSet/CategoryWithFibrations.lean`): trivial fibrations are `(monomorphisms SSet).rlp`.
- `CategoryTheory.nerve`, `CategoryTheory.nerveMap` (`Mathlib/AlgebraicTopology/SimplicialSet/Nerve.lean`) and the instance `Quasicategory (nerve C)` (`Mathlib/AlgebraicTopology/Quasicategory/Nerve.lean`); `SSet.opFunctor` (`Mathlib/AlgebraicTopology/SimplicialSet/Op.lean`).
- `SemiSimplexCategory` and `SemiSimplexCategory.toSimplexCategory` (`Mathlib/AlgebraicTopology/SimplexCategory/SemiSimplexCategory.lean`): the injective order-preserving maps.
- `SSet.Nonsingular` (`Mathlib/AlgebraicTopology/SimplicialSet/Nonsingular.lean`), `SSet.N` (`Mathlib/AlgebraicTopology/SimplicialSet/NonDegenerateSimplices.lean`) and `SSet.sd` (`Mathlib/AlgebraicTopology/SimplicialSet/Subdivision.lean`): nonsingular simplicial sets, the poset of nondegenerate simplices and subdivision, used in §9.6–9.7.
- `SimplicialNerve`, `SimplicialThickening` (`Mathlib/AlgebraicTopology/SimplicialNerve.lean`): the coherent nerve and `C[−]`.
- `SSet.hoFunctor` (`Mathlib/AlgebraicTopology/SimplicialSet/HomotopyCat.lean`), `CategoryTheory.nerveAdjunction : SSet.hoFunctor ⊣ nerveFunctor` (`Mathlib/AlgebraicTopology/SimplicialSet/NerveAdjunction.lean`) and the monoidal structure `SSet.Truncated.hoFunctor.monoidal` (`Mathlib/AlgebraicTopology/SimplicialSet/HoFunctorMonoidal.lean`), with `CategoryTheory.Limits.Cocone` and `CategoryTheory.Limits.IsColimit`: the homotopy category and the 1-categorical colimits that colimits in nerves are compared with in §1.4. `SSet.opFunctor` (`Mathlib/AlgebraicTopology/SimplicialSet/Op.lean`), `CategoryTheory.ULiftHom` and `CategoryTheory.ULiftHom.equiv` (`Mathlib/CategoryTheory/Category/ULift.lean`), `CategoryTheory.ComposableArrows` and `CategoryTheory.Limits.IsLimit`: the limit form of §1.4 and its universe bullet.
- `CategoryTheory.Functor.Final` (`Mathlib/CategoryTheory/Limits/Final.lean`), `CategoryTheory.Functor.IsLeftKanExtension` (`Mathlib/CategoryTheory/Functor/KanExtension/Basic.lean`) and `CategoryTheory.Functor.Elements`: the 1-categorical notions that nerves are compared with.
- `HomotopicalAlgebra.ModelCategory` (`Mathlib/AlgebraicTopology/ModelCategory/Basic.lean`) and `HomotopicalAlgebra.ModelCategory.over` (`Mathlib/AlgebraicTopology/ModelCategory/Over.lean`): the shape of a model structure and the model structure on `Over S` created by the forgetful functor, used in §3.6.
- `CategoryTheory.EnrichedCategory`, `CategoryTheory.MonoidalClosed` (`Mathlib/CategoryTheory/Enriched/`, `Closed/`): the 1-categorical carriers of §3.4.
- `Cardinal.IsRegular` (`Mathlib/SetTheory/Cardinal/Regular.lean`).

### From Tau Ceti

Paths are relative to the Tau Ceti repository, under `TauCeti/AlgebraicTopology/`.

- `SSet.join`, `SSet.join.inl`, `SSet.join.inr`, `SSet.join.map`, `SSet.join.quasicategory` (`SimplicialSet/Join/Basic.lean`): the join, its functoriality, and the join of ∞-categories as an ∞-category.
- `SSet.slice`, `SSet.slice.π`, `SSet.slice.homEquiv` (`SimplicialSet/Slice.lean`) and `SSet.coslice`, `SSet.coslice.π`, `SSet.coslice.homEquiv`, `SSet.coslice.map`, `SSet.coslice.isIso_π` (`SimplicialSet/Coslice.lean`): `C_{/p}` and `C_{p/}` with their universal properties for maps out of joins.
- `SSet.slice.IsLimit`, `SSet.coslice.IsColimit`, `SSet.coslice.isColimit_iff_isLimit_op`, `SSet.coslice.isColimit_iff_nonempty_isInitial` (`Quasicategory/Limit.lean`), with `SSet.IsInitialVertex`, `SSet.IsTerminalVertex` (`Quasicategory/InitialVertex.lean`, `TerminalVertex.lean`).
- `SSet.LeftFibration`, `SSet.RightFibration`, `SSet.leftAnodyneExtensions`, `SSet.rightAnodyneExtensions`, `SSet.leftAnodyneExtensions_pushoutObjObjι`, `SSet.rightAnodyneExtensions_pushoutObjObjι` (`SimplicialSet/AnodyneExtensions/LeftRight/`).
- `SSet.rightMappingSpace` (`Quasicategory/RightMappingSpace.lean`): the right mapping space `Hom^R_C(x, y)`.
- `SSet.ihomOver`, `SSet.ihomOver.homEquiv`, `SSet.ihomOver.isTerminalId` (`SimplicialSet/InternalHom.lean`): `Map_B(K, E)` with its universal property, and its quasicategory and Kan instances for inner and Kan fibrations.
- `SSet.fullEnhancedSubcategory` (`Quasicategory/FullSubcategory.lean`): full subcategories on a predicate on vertices.
- `SSet.IsWeaklyContractible` and `SSet.evalAt` (`SimplicialSet/WeaklyContractible.lean`), `SSet.IsWeakHomotopyEquivalence`, `SSet.isWeaklyContractible_iff_isWeakHomotopyEquivalence` (`SimplicialSet/WeakHomotopyEquivalence.lean`).
- `SSet.Edge.IsCartesian`, `SSet.CartesianFibration` (`Quasicategory/Cartesian.lean`), `SSet.Edge.isEquivalence_iff_hornFilling_zero` (`Quasicategory/OuterHorn.lean`).
- `CategoryTheory.nerve.opIso` (`SimplicialSet/Nerve/Op.lean`): `nerve Cᵒᵖ ≅ (nerve C).op`, for the limit form of §1.4.
- `SSet.CoreEnriched`, `SSet.CatInftyΔ`, `SSet.catInfty` (`Quasicategory/CatInfty.lean`): `Cat∞` as the simplicial nerve of the ∞-categories with mapping objects the cores of functor ∞-categories; `TauCeti.MarkedSSet` with `flat` and `sharp` (`SimplicialSet/Marked/`), used in §3.8.

### From TauCetiRoadmap.ModelCategoryTheory

- Part ModelCategories: weak saturation and the small object argument (HTT, Def. A.1.2.2; Prop. A.1.2.5 (1)); right properness and lifting against maps of complexes (HTT, Prop. A.2.3.1); left properness and homotopy pushouts (HTT, Def. A.2.4.1; Lemma A.2.4.3 and the discussion after it; Prop. A.2.4.4); Quillen adjunctions (HTT, §A.2.5); combinatorial model categories and the relation `τ ≪ κ` (HTT, Def. A.2.6.1, A.2.6.3); diagram model structures (HTT, Def. A.2.8.1; Prop. A.2.8.2, projective part).
- Part KanQuillen: the Kan–Quillen model structure and its weak equivalences (HTT, §A.2.7).
- Part SimplicialCategories: simplicial model categories (HTT, Def. A.3.1.5); the injective structure on enriched diagrams (HTT, Prop. A.2.8.2, injective part); homotopy limits, colimits and Kan extensions (HTT, Prop. A.2.8.7; Rem. A.3.3.13) with their pointwise criterion (HTT, Prop. A.2.8.9); mapping spaces under weak equivalences and the fibration form of the axiom (HTT, Rem. A.3.1.6); local Kan-ness of `A°` (HTT, Rem. A.3.1.8); the Bergner model structure and its fibrant replacements (HTT, Thm. A.3.2.4); the projective and injective structures on `A^C` (HTT, Prop. A.3.3.2) and left adjoints of restriction (HTT, Prop. A.3.3.7).
- Part EnrichedLocalization: chunks and the representability of maps in `hCat_S` by diagram categories (HTT, Def. A.3.4.9; Cor. A.3.4.14; Lemma A.3.4.15).

### From TauCetiRoadmap.InfinityCategoryTheory

- Part InfinityCategoryFoundations: the definitions named in Scope; natural transformations, cones, full subcategories, categorical equivalences, fully faithful functors, cores and sizes (§1.1, §1.2, §2.1, §7.1; HTT, Def. 1.1.5.14; Notation 1.2.7.2; §1.2.5, §1.2.8, §1.2.10, §1.2.11, §1.2.15); right and left fibrations classified by maps to spaces (§7.1); mapping spaces (HTT, Prop. 1.2.2.3); Kan complexes and cores (HTT, Prop. 1.2.4.3, 1.2.5.3); slices, initial objects and colimits (HTT, Prop. 1.2.9.2; Prop. 1.2.12.4; Cor. 1.2.12.5; Prop. 1.2.12.9; Rem. 1.2.13.5, 1.2.13.7; Prop. 1.2.13.8); essential surjectivity (HTT, §1.2.10); left and right fibrations (HTT, Prop. 2.1.2.1; Cor. 2.1.2.2; Lemma 2.1.2.3; Prop. 2.1.2.5, 2.1.2.6; Cor. 2.1.2.7; Prop. 2.1.2.11; Lemma 2.1.3.3, 2.1.3.4); the covariant and contravariant model structures (HTT, Lemma 2.1.4.6; Prop. 2.1.4.7–2.1.4.9; Rem. 2.1.4.12); unmarked straightening (HTT, Prop. 2.2.1.1; Thm. 2.2.1.2; Props. 2.2.2.7, 2.2.2.9, 2.2.2.13; Prop. 2.2.3.11; Cor. 2.2.3.12, 2.2.3.13; Prop. 2.2.4.1); the classification of right fibrations (§7.7, with HTT 3.3.2.5–3.3.2.6 in unmarked form); inner anodyne maps are categorical equivalences (HTT, Lemma 2.2.5.2); products and the Joyal model structure, categorical fibrations and the comparison with simplicial categories (HTT, Cor. 2.2.5.4; Thm. 2.2.5.1); the two forms of categorical equivalence (§9.7; HTT, Prop. 2.2.5.7, 2.2.5.8); the agreement of the two homotopy categories (§2.6; HTT, Prop. 1.2.3.1); n-categories and truncated mapping spaces (§10.6; HTT, Prop. 2.3.4.5, Cor. 2.3.4.8, Prop. 2.3.4.18), for colimits in nerves of categories.
- Part CartesianFibrations: coCartesian fibrations (§1.1) and marked simplicial sets (§5.1; HTT, Def. 3.1.0.1); Cartesian and coCartesian edges and fibrations (HTT, Prop. 2.4.1.5, 2.4.1.7; Rem. 2.4.1.9; Prop. 2.4.2.4; Def. 2.4.2.6; Prop. 2.4.3.2; Cor. 2.4.4.4, 2.4.4.6; Lemma 2.4.4.7; Prop. 2.4.4.9); invariance of slices and of `Fun(−, C)` (HTT, Prop. 1.2.9.3, 1.2.7.3); categorical fibrations over an ∞-category (HTT, Cor. 2.4.6.5); correspondences and bifibrations (HTT, §2.3.1; Def. 2.4.7.2; Lemma 2.4.7.5; Cor. 2.4.7.12); the marked lifting calculus (HTT, Prop. 3.1.1.11, 3.1.2.1); the Cartesian model structure over a point, its fibrant objects and simplicial enrichment (HTT, Prop. 3.1.3.7; Prop. 3.1.4.1; Cor. 3.1.4.4); the mapping simplex (HTT, Def. 3.2.2.6; Prop. 3.2.2.7, 3.2.2.10 and the introduction to §3.2.2); and Layer 7: inner anodyne base change along a (co)Cartesian fibration over any base (§7.1, HTT 3.3.1.3, inner anodyne half), base change along a (co)Cartesian fibration over an ∞-category (§7.2, HTT 3.3.1.3), the fiberwise criterion over any base and the fibers of a categorical equivalence of categorical fibrations over an ∞-category (§7.3, HTT 3.3.1.5, (2) ⇒ (1) and (1) ⇒ (2)), (co)Cartesian fibrations over ∞-categories are categorical fibrations (§7.4, HTT 3.3.1.7), and the invariance of sections under categorical equivalence, with its trivial-fibration clause (§7.5).

What is assumed of Part CartesianFibrations' Layer 7 statements is exactly their scope there: Part CartesianFibrations §7.1 holds over any base; Part CartesianFibrations §7.2 and the second statement of Part CartesianFibrations §7.3 need an ∞-category base; the first statement of Part CartesianFibrations §7.3 gives fiberwise ⇒ global over any base; Part CartesianFibrations §7.4 needs an ∞-category base or a pullback of one; and the trivial-fibration clause of Part CartesianFibrations §7.5 needs no fibration hypothesis. Every use below meets these hypotheses, and where HTT applies them over an arbitrary base the statement here carries the hypothesis "q is a categorical fibration" (§1.5, §1.6, §8.2).

## How to read the build

Layer 1 builds fat joins and fat slices, the homotopy-invariant models of cones, with their relative versions over a base. Layer 2 gives right anodyne maps and the first properties of cofinal maps, up to the fact that cofinal maps preserve colimits and that categorical equivalences into ∞-categories are cofinal (§2.6). Layer 3 compares homotopy colimits with ∞-categorical colimits, proves that `N(A°)` has small limits and colimits for a combinatorial simplicial model category A, treats representable presheaves and slices of `N(A°)`, and specializes to spaces (§3.7, Lemma L) and to `Cat∞` (§3.8). Layer 3 comes before Layer 4 because its routes avoid the replacement of diagrams by nerves (§6.4), which depends on the colimit criterion. Layer 4 proves that criterion: the converse of HTT 4.1.1.8 (§4.2: maps that preserve colimits are cofinal, from Part InfinityCategoryFoundations §7.7 and Lemma L), then the invariance and factorization of cofinal maps. Layer 5 builds smooth maps and proves Theorem A. Layer 6 decomposes diagrams, replaces every diagram by one indexed by a nerve, and reduces colimits to pushouts, coproducts and coequalizers. Layer 7 treats relative colimits and pointwise Kan extensions, Layer 8 colimits in section ∞-categories, functor ∞-categories and spaces, and Layer 9 simplicial and semisimplicial diagrams: groupoid objects, Čech nerves, geometric realizations, and limits over nonsingular simplicial sets.

Four sections hold definitions that later Parts cite: §2.1 (cofinal maps), §7.1 (relative colimits and left Kan extensions), §8.1 (presheaf ∞-categories) and §9.1 (simplicial and groupoid objects, Čech nerves).

## Layer 1: Fat joins, fat slices and relative slices

### 1.1 Fat joins and their comparison with joins

**1.1.1.** Define the fat join `X ⋄ Y` of simplicial sets X and Y as the iterated pushout `X ⊔_{X × Y × {0}} (X × Y × Δ[1]) ⊔_{X × Y × {1}} Y` (HTT, Def. 4.2.1.1, p. 257).

- It maps to Δ[1] with fibers X over 0 and Y over 1, and it is functorial in both variables.
- There is a unique map `X ⋄ Y ⟶ X ⋆ Y` over Δ[1] that is the identity on X and on Y.
- Because the defining pushout is a homotopy pushout for the Joyal model structure, a pair of categorical equivalences `X ⟶ X'`, `Y ⟶ Y'` induces a categorical equivalence `X ⋄ Y ⟶ X' ⋄ Y'` (HTT, discussion after Def. 4.2.1.1, p. 257).

**Checks.**

- For Y = ∅ the products vanish and `X ⋄ ∅ = X = X ⋆ ∅`. A definition that kept a separate cone point would give `X^▷` instead.
- For `X = Y = Δ[0]`, `X ⋄ Y = Δ[1]`. A definition without the cylinder factor Δ[1], the plain pushout `X ⊔_{X × Y} Y`, would give a point.
- `Δ[1] ⋄ Δ[0]` is `Δ[1] × Δ[1]` with one edge collapsed to a point. It has two nondegenerate 2-simplices, while `Δ[1] ⋆ Δ[0] = Δ[2]` has one. So the comparison map is a categorical equivalence but not an isomorphism, and a definition identifying `⋄` with `⋆` is wrong.

*Needs:* Tau Ceti `SSet.join`; Part InfinityCategoryFoundations §2.1.6 (HTT, Def. 1.1.5.14); Part InfinityCategoryFoundations §9.5.1 (HTT, Thm. 2.2.5.1); ModelCategoryTheory, Part ModelCategories §3.5.1, §3.5.2 (HTT, homotopy pushout squares, §A.2.4, p. 833).

**1.1.2.** Prove that `X ⋄ Y ⟶ X ⋆ Y` is a categorical equivalence for all simplicial sets X and Y (HTT, Prop. 4.2.1.2, p. 258). A route: both sides commute with filtered colimits and carry pushouts along monomorphisms to homotopy pushouts, so it suffices to treat `X = Δ[m]` and `Y = Δ[n]`. Spine inclusions are inner anodyne and joins with inner anodyne maps stay inner anodyne, so one reduces to `X, Y ∈ {Δ[0], Δ[1]}`, which is a direct computation. Consequently joins preserve categorical equivalences: if `X ⟶ X'` and `Y ⟶ Y'` are categorical equivalences, so is `X ⋆ Y ⟶ X' ⋆ Y'` (HTT, Cor. 4.2.1.3, p. 258), by the invariance of `⋄` and two-out-of-three.
*Needs:* §1.1.1; Tau Ceti `SSet.join`; Part InfinityCategoryFoundations §2.1.6 (HTT, Def. 1.1.5.14); Part InfinityCategoryFoundations §4.1.1 (HTT, Lemma 2.1.2.3) and §6.1.1 (HTT, Lemma 2.2.5.2); Part InfinityCategoryFoundations §9.5.1 (HTT, Thm. 2.2.5.1); ModelCategoryTheory, Part ModelCategories §3.4.1 (HTT, Def. A.2.4.1) and §3.5.1, §3.5.2 (HTT, homotopy pushout squares, §A.2.4, p. 833).

### 1.2 Fat slices

**1.2.1.** Define the fat slice `C^{p/}` of a map `p : X ⟶ C` as the fiber product `Fun(X × Δ[1], C) ×_{Fun(X × ∂Δ[1], C)} ({p} × C)`, where C maps to `Fun(X, C)` by constant diagrams (HTT, discussion before Prop. 4.2.1.5, p. 259). Its maps from Y classify maps `X ⋄ Y ⟶ C` extending p. Prove that the map `C_{p/} ⟶ C^{p/}` induced by `X ⋄ Y ⟶ X ⋆ Y` is a categorical equivalence when C is an ∞-category (HTT, Prop. 4.2.1.5, p. 259). Dually define `C^{/p}`.

- Maps `Y ⟶ C^{p/}` correspond to maps `X ⋄ Y ⟶ C` restricting to p on X.
- For C an ∞-category, `C^{p/} ⟶ C` is a left fibration.
- Colimits of p may be computed as initial objects of `C^{p/}`.

**Checks.**

- For X = ∅, `C^{p/} = C = C_{p/}`.
- For X = Δ[0] at x, the fiber of `C^{x/}` over y is `{x} ×_C Fun(Δ[1], C) ×_C {y}`, the morphism space `Hom_C(x, y)`. In `C_{x/}` it is the left mapping space `Hom^L_C(x, y)`; the right mapping space `Hom^R_C(x, y)` is the fiber of `C_{/y}` over x.
- For `X = Δ[0] ⊔ Δ[0]` at two objects, a vertex of `C^{p/}` is a pair of edges with a common target. A definition that omitted the factor C of constant diagrams would allow two different targets, which is not a cocone.
- For C the nerve of a category, `C^{x/}` and `C_{x/}` are both the nerve of the undercategory of x.

*Needs:* §1.1.1 and the comparison of §1.1.2; Tau Ceti `SSet.slice.homEquiv`, `SSet.coslice.homEquiv` (HTT, Prop. 1.2.9.2); Part InfinityCategoryFoundations §9.5.1 (HTT, Thm. 2.2.5.1, model structure part).

**1.2.2.** Prove that, for monomorphisms `K₀ ⊆ K`, maps `K ⟶ X ⟶ S` with `q : X ⟶ S` a categorical fibration, and `r = q ∘ p`, `p₀ = p|K₀`, `r₀ = r|K₀`, the map `X^{p/} ⟶ X^{p₀/} ×_{S^{r₀/}} S^{r/}` is a left fibration (HTT, Prop. 4.2.1.6, p. 259). A route: by adjunction, lifting against a left anodyne `A₀ ⊆ A` is extending along the pushout-join `(K ⋄ A₀) ⊔_{K₀ ⋄ A₀} (K₀ ⋄ A) ⊆ K ⋄ A` against q. That pushout is a homotopy pushout, so by the comparison of §1.1 the inclusion is a categorical equivalence when its analogue for joins is, and that analogue is inner anodyne (HTT 2.1.2.3); q, a categorical fibration, lifts against it.
*Needs:* §1.1.1 and the comparison of §1.1.2; Tau Ceti `SSet.join`, `SSet.LeftFibration`; Part InfinityCategoryFoundations §4.1.1 (HTT, Lemma 2.1.2.3) and §6.1.1 (HTT, Lemma 2.2.5.2); Part InfinityCategoryFoundations §9.4.1 (HTT, categorical fibrations, §2.2.5); ModelCategoryTheory, Part ModelCategories §3.5.1, §3.5.2 (HTT, homotopy pushout squares, §A.2.4, p. 833).

### 1.3 Fibers of fat slices; the three mapping spaces agree

**1.3.1.** Prove that for an ∞-category C, a diagram `p : K ⟶ C` and an object v, the map of fibers `C_{p/} ×_C {v} ⟶ C^{p/} ×_C {v}` is a homotopy equivalence of Kan complexes (HTT, Cor. 4.2.1.7, p. 260). A route: §1.2 gives a map of left fibrations over C that is a categorical equivalence; left fibrations over the ∞-category C are categorical fibrations (Part CartesianFibrations §7.4, HTT 3.3.1.7), so the fibers of a categorical equivalence of categorical fibrations (Part CartesianFibrations §7.3, second statement, the direction (1) ⇒ (2) of HTT 3.3.1.5 over an ∞-category base) makes it a homotopy equivalence on every fiber. In particular, for objects x and y, the inclusions `Hom^R_C(x, y) ⟶ Hom_C(x, y) ⟵ Hom^L_C(x, y)` are homotopy equivalences of Kan complexes (HTT, Cor. 4.2.1.8, p. 260): apply the fiber statement to `p : Δ[0] ⟶ C` at x and to its opposite, unwinding `⋄`. This makes the morphism space of Part InfinityCategoryFoundations agree with Tau Ceti's `SSet.rightMappingSpace`.
*Needs:* §1.1.1, §1.2.1; Part InfinityCategoryFoundations §4.3.1 (HTT, Cor. 2.1.2.2) and §5.2.1 (HTT, morphism space of §1.2.2); Part InfinityCategoryFoundations §9.5.1 (HTT, Thm. 2.2.5.1); Part InfinityCategoryFoundations §10.2.4 (HTT, Cor. 2.4.6.5); Part CartesianFibrations §2.2.1 (HTT, Prop. 2.4.2.4), §7.3.2 (second statement, HTT, Prop. 3.3.1.5, (1) ⇒ (2)) and §7.4.1 (HTT, Prop. 3.3.1.7); ModelCategoryTheory, Part ModelCategories §3.5.2 (HTT, Prop. A.2.4.4).

### 1.4 Colimits through mapping spaces

**1.4.1.** Prove that a cocone `p̄ : K^▷ ⟶ C` in an ∞-category with cone point X is a colimit of `p = p̄|K` exactly when composition with the induced natural transformation `α : p ⟶ δ(X)` gives homotopy equivalences `Map_C(X, Y) ⟶ Map_{Fun(K, C)}(p, δ(Y))` for all objects Y, where `δ : C ⟶ Fun(K, C)` is the diagonal (HTT, Lemma 4.2.4.3, p. 275). A route: read the colimit condition in the fat slice `C^{p/}` (§1.2), whose fibers over Y are `Map_{Fun(K, C)}(p, δ(Y))`; restriction `C_{p̄/} ⟶ C_{X/}` is a trivial fibration, and §1.3 compares the fibers.
*Needs:* §1.2.1, §1.3.1; Tau Ceti `SSet.coslice.IsColimit`; Mathlib instance `Quasicategory ((ihom K).obj C)`; Part InfinityCategoryFoundations §1.2 (HTT, Notation 1.2.7.2; cones, Notation 1.2.8.4); Part InfinityCategoryFoundations §5.2.1 (HTT, morphism space of §1.2.2), §4.3.2 (HTT, Prop. 2.1.2.5) and §5.3.1 (HTT, Lemma 2.1.3.3), §5.3.2 (HTT, Lemma 2.1.3.4).

**1.4.2.** Prove that colimits in the nerve of a category are the 1-categorical colimits over the homotopy category of the index (the case of nerves of HTT, Lemma 4.2.4.3, p. 275, which HTT uses without statement in Remark 5.3.5.6, p. 423). Let A be a category with `A : Type w` and `[Category.{w} A]`, K a simplicial set in `SSet.{w}`, `hK = SSet.hoFunctor.obj K`, `q : K ⟶ N(A)` a diagram and `q₀ : hK ⥤ A` the functor that corresponds to q under Mathlib's `CategoryTheory.nerveAdjunction`, which is an adjunction between `SSet.{w}` and `Cat.{w,w}`.
- `Fun(K, N(A))` is isomorphic to the nerve of the functor category `hK ⥤ A`, naturally in K and A.
- Cocones `K^▷ ⟶ N(A)` under q correspond bijectively to cocones under `q₀` in A (Mathlib `CategoryTheory.Limits.Cocone`), with the same cone point.
- A cocone under q is a colimit in `N(A)` exactly when the corresponding cocone under `q₀` is a colimit cocone in A (Mathlib `CategoryTheory.Limits.IsColimit`).
- For `K = N(J)`, the nerve of a category J, the counit `h N(J) ⥤ J` of `nerveAdjunction` is an isomorphism, so colimits in `N(A)` of the nerve of a functor `p : J ⥤ A` are the colimits of p in A.
- Dually, a cone over q is a limit in `N(A)` exactly when the corresponding cone over `q₀` is a limit cone in A (Mathlib `CategoryTheory.Limits.IsLimit`); for `K = N(J)` these are the limits of p in A.
- *Universes.* For `A : Type (w+1)` with `[Category.{w} A]`, such as `Type w`, `Ab` or `ShrinkHoms` of a locally small homotopy category, `N(A)` lies in `SSet.{w+1}` but A is not an object of `Cat.{w+1,w+1}`. There `nerve A ≅ nerve (ULiftHom.{w+1} A)` (Mathlib `CategoryTheory.ULiftHom`), so maps `K ⟶ N(A)` with `K : SSet.{w+1}` are functors `hK ⥤ ULiftHom.{w+1} A`, and the bullets above, applied to `ULiftHom.{w+1} A`, describe colimits and limits in `N(A)` by those in A, `ULiftHom.equiv` being an equivalence of categories.

The route. For the first bullet, work level by level, naturally in `[n]`: `Fun(K, N(A))_n = Hom(K × Δ[n], N(A)) ≅ Fun(h(K × Δ[n]), A) ≅ Fun(hK × [n], A) ≅ Fun([n], hK ⥤ A) = N(hK ⥤ A)_n`. The steps are the nerve adjunction; the cartesian monoidal structure `SSet.Truncated.hoFunctor.monoidal` with `h Δ[n] ≅ [n]`, the counit isomorphism `nerveAdjunction.isIso_counit` at `Fin (n+1)`, as `Δ[n] ≅ N([n])`; and the exponential law in categories. This is an isomorphism of simplicial sets; in particular composition in `h Fun(K, N(A))` is vertical composition of natural transformations. For the second bullet: the map `K ⋄ Δ[0] ⟶ K ⋆ Δ[0]` of §1.1 is a map under `K ⊔ Δ[0]`, a categorical equivalence (HTT, Prop. 4.2.1.2) and bijective on vertices. So it induces an equivalence of homotopy categories that is bijective on objects (Part InfinityCategoryFoundations §2.1, HTT, Def. 1.1.5.14, read on underlying categories, which are Mathlib's homotopy categories by Part InfinityCategoryFoundations §2.6, HTT, Prop. 1.2.3.1), hence an isomorphism, and through the adjunction maps from either side into `N(A)` correspond, compatibly with the restrictions to K and to the cone point. A map `K ⋄ Δ[0] ⟶ N(A)` restricting to q is a map `K × Δ[1] ⟶ N(A)` from q to a constant diagram `δ(X)`, that is, by the first bullet, a natural transformation `q₀ ⟶ const X`, a cocone with cone point X. For the third bullet: by §1.4.1, the cocone is a colimit exactly when composition with `α : q ⟶ δ(X)` gives homotopy equivalences `Map(X, Y) ⟶ Map_{Fun(K, N(A))}(q, δ(Y))` for all Y. By the first bullet both sides are mapping spaces of nerves, hence homotopy discrete (Part InfinityCategoryFoundations §10.6, HTT, Prop. 2.3.4.18), so the condition is bijectivity on π₀. Under the first bullet δ corresponds to `N(const)`, so on π₀ the map is `f ↦ const(f) ∘ α₀`, `Hom_A(X, Y) ⟶ Hom(q₀, const Y)`, and it is bijective for all Y exactly when the cocone is a colimit cocone in A. The fourth bullet is Mathlib's instance `CategoryTheory.nerveAdjunction.isIso_counit`, under which `N(p)` corresponds to `p ∘ ε`; colimits transfer along the isomorphism of index categories. For the fifth bullet: limits of q are colimits of `qᵒᵖ : Kᵒᵖ ⟶ N(A)ᵒᵖ` (Tau Ceti `SSet.coslice.isColimit_iff_isLimit_op`), `N(A)ᵒᵖ ≅ N(Aᵒᵖ)` (Tau Ceti `CategoryTheory.nerve.opIso`, with Mathlib's `SSet.opFunctor`), and `h(Kᵒᵖ) ≅ (hK)ᵒᵖ`, both homotopy categories being presented by the vertices, edges and 2-simplices; apply the second, third and fourth bullets to `Aᵒᵖ`, cones over `q₀` being cocones under `q₀ᵒᵖ` (Mathlib `CategoryTheory.Limits.Cone.op`). For the universe bullet: the n-simplices of both nerves are composable strings of n arrows (Mathlib `ComposableArrows`), and the bijection `ULift.up` on arrows commutes with faces and degeneracies. Mathlib's `nerveMap` does not give this map, since its source and target must have the same hom universe.

**Checks.**

- For K = `Λ[2, 0]`, hK is the span category. The pushout of `0 ⟵ ℤ ⟶ 0` in abelian groups is 0, so by the third bullet it is 0 in `N(Ab)`, and suspension in `N(Ab)` is zero. Discreteness of the mapping spaces is what is used: the pushout of `∗ ⟵ ∂Δ[1] ⟶ ∗` of Kan complexes is a circle, while in `N(Set)` the pushout of `∗ ⟵ {a, b} ⟶ ∗` is a point.
- K need not be the nerve of a category. For `K = Δ[1]/∂Δ[1]`, one vertex with one nondegenerate loop, hK is the one-object category of the monoid ℕ. A diagram in `N(Ab)` is an abelian group M with an endomorphism f, and its colimit is the coinvariants `M/(f − 1)M`. For `M = ℤ` and `f = −1` this is ℤ/2, which differs from the colimit ℤ of the restriction to the single vertex.

*Needs:* §1.4.1 (HTT, Lemma 4.2.4.3); §1.1.2 (HTT, Prop. 4.2.1.2); Part InfinityCategoryFoundations §10.6.5 (HTT, Prop. 2.3.4.18), §2.1.6 (HTT, Def. 1.1.5.14) and §2.6.3 (HTT, Prop. 1.2.3.1); Mathlib `CategoryTheory.nerve`, `CategoryTheory.nerveAdjunction`, instance `CategoryTheory.nerveAdjunction.isIso_counit`, `SSet.hoFunctor`, `SSet.Truncated.hoFunctor.monoidal`, `SSet.opFunctor`, `CategoryTheory.ComposableArrows`, `CategoryTheory.ULiftHom`, `CategoryTheory.ULiftHom.equiv`, `CategoryTheory.Limits.Cocone`, `CategoryTheory.Limits.IsColimit`, `CategoryTheory.Limits.IsLimit`, instance `Quasicategory ((ihom K).obj C)`; Tau Ceti `SSet.join`, `SSet.coslice.IsColimit`, `SSet.slice.IsLimit`, `SSet.coslice.isColimit_iff_isLimit_op`, `CategoryTheory.nerve.opIso`.

### 1.5 Relative fat joins and relative slices

**1.5.1.** Define, for X and Y over S, the relative fat join `X ⋄_S Y` as the pushout `X ⊔_{X ×_S Y × {0}} (X ×_S Y × Δ[1]) ⊔_{X ×_S Y × {1}} Y` over S (HTT, Def. 4.2.2.1, p. 260). For K over S, `X ↦ K ⋄_S X` has a right adjoint: for `p_S : K ⟶ Y` over S, the relative slice `Y^{p_S/}` over S, whose maps from X over S classify extensions of `p_S` to `K ⋄_S X ⟶ Y` over S.

- `X ⋄_S Y` commutes with base change along any `T ⟶ S`.
- Over a point it is the fat join of §1.1.
- The fiber of `Y^{p_S/}` over a vertex s is the fat slice `Y_s^{p_s/}`.

**Checks.**

- For `S = Δ[0]`, `X ⋄_S Y = X ⋄ Y`; a definition using the absolute product `X × Y` would not commute with base change.
- For `S = ∂Δ[1]` with X the vertex 0 and Y the vertex 1, `X ×_S Y = ∅`, so `X ⋄_S Y = X ⊔ Y` is two points, while the absolute fat join is Δ[1]. A definition ignoring S would join points of different fibers.
- For `X = Y = S = Δ[1]` with identity structure maps, `X ×_S Y = Δ[1]`, and `X ⋄_S Y` is `Δ[1] × Δ[1]` over Δ[1] by the first projection. Its fiber over each vertex is Δ[1], the fat join of two points.

*Needs:* §1.1.1.

**1.5.2.** Prove that for a map `q : X ⟶ Y` over S that is a Cartesian fibration and a categorical fibration, a map `p_S : K ⟶ X` over S with `K ⟶ S` a coCartesian fibration, and `p'_S = q ∘ p_S`, the induced map `r : X^{p_S/} ⟶ Y^{p'_S/}` is a Cartesian fibration whose Cartesian edges are those whose image in X is q-Cartesian (HTT, Prop. 4.2.2.4, p. 262). HTT asks only that q be a Cartesian fibration; the hypothesis that q is also a categorical fibration holds when Y is an ∞-category (Part CartesianFibrations §7.4, HTT 3.3.1.7) and for product projections, which covers every use in this Part, and it replaces HTT's appeal to HTT 3.3.1.7 over an arbitrary base. A route in two steps.

1. **r is an inner fibration** (HTT, Prop. 4.2.2.4, first step of the proof, p. 263). By adjunction an inner horn filler for r is an extension along `K ⋄_S Λ[n,i] ⊆ K ⋄_S Δ[n]` against the categorical fibration q; that inclusion is a categorical equivalence because `K ×_S Λ[n,i] ⊆ K ×_S Δ[n]` is one, by inner anodyne base change along the coCartesian fibration `K ⟶ S`, over any base (Part CartesianFibrations §7.1), and the relative fat join is a homotopy pushout.
   *Needs:* §1.5.1; Part InfinityCategoryFoundations §6.1.1 (HTT, Lemma 2.2.5.2) and §9.4.1 (HTT, categorical fibrations, §2.2.5); Part CartesianFibrations §7.1.1 (inner anodyne base change, any base); ModelCategoryTheory, Part ModelCategories §3.5.2 (HTT, Prop. A.2.4.4).
2. **Cartesian lifts** (HTT, Prop. 4.2.2.4 and its proof, pp. 262–265). Call an edge special when its image in X is q-Cartesian. A lifting problem against `Λ[n,n] ⊆ Δ[n]` with special last edge is an extension problem for `K ⋄_S Δ[n]`: extend over a q-Cartesian edge, reduce to `S = Δ[n]`, replace K by a mapping simplex, and fill; after the reduction the base Δ[n] is an ∞-category, so Part CartesianFibrations §7.4.1 (HTT 3.3.1.7) applies to the fibrations over it. The filling uses that for `n > 0` and `B = (Λ[n,n] × Δ[1]) ⊔ (Δ[n] × ∂Δ[1])`, every map `A × B ⟶ X` over `A × Δ[n] × Δ[1] ⟶ Y`, carrying the edges `{a} × Δ^{n−1,n} × {1}` to q-Cartesian edges, extends to `A × Δ[n] × Δ[1]`, by filling the inner horns and the last outer one by the Cartesian edge (HTT, Lemma 4.2.2.3, p. 261). Every Cartesian edge is special by uniqueness of Cartesian lifts.
   *Needs:* step 1; Tau Ceti `SSet.Edge.IsCartesian`, `SSet.CartesianFibration`; Part InfinityCategoryFoundations §3.2.1 (HTT, Prop. 2.1.2.6); Part CartesianFibrations §1.4.1 (HTT, Rem. 2.4.1.9), §5.5.3 (HTT, Prop. 3.1.2.1), §6.3.2 (HTT, Prop. 3.2.2.7) and §7.4.1 (HTT, Prop. 3.3.1.7); ModelCategoryTheory, Part ModelCategories §3.2.1 (HTT, Prop. A.2.3.1).

### 1.6 Fiberwise colimits

**1.6.1.** Prove that for a map `q : Y ⟶ S` that is a Cartesian fibration and a categorical fibration (the hypothesis added to HTT's as in §1.5) and `p_S : K ⟶ Y` such that each fiber map `p_s : K_s ⟶ Y_s` has a colimit and `q ∘ p_S` is a coCartesian fibration, `p_S` extends to `K ⋄_S S ⟶ Y` over S restricting on each fiber to a colimit of `p_s`, and the space of such extensions is a contractible Kan complex (HTT, Prop. 4.2.2.7, p. 265). A route: `Y^{p_S/} ⟶ S` is a Cartesian fibration (§1.5); the fiberwise initial objects of its fibers, read in fat slices (§1.2), form the sections sought, and the space of sections through fiberwise initial objects is contractible.
*Needs:* §1.2.1, §1.5.1, §1.5.2; Mathlib `SSet.KanComplex`; Tau Ceti `SSet.coslice.IsColimit`, `SSet.CartesianFibration`; Part CartesianFibrations §2.7.1 (HTT, Prop. 2.4.4.9).

### Examples

- For X a Kan complex and x a vertex, `X^{x/}` is the space of paths from x, with fiber over y the paths from x to y.
- For C the nerve of a category, the three mapping spaces of §1.3 are all the discrete set `C(x, y)`.
- §1.4 for `K = ∂Δ[1]`: a cocone with cone point X is a coproduct of `x₀`, `x₁` exactly when `Map(X, Y) ⟶ Map(x₀, Y) × Map(x₁, Y)` is a homotopy equivalence for all Y.
- §1.4.2, for `K = ∂Δ[1]` and `A = Set`: coproducts in `N(Set)` are disjoint unions.

### Dependencies

Part InfinityCategoryFoundations (functor ∞-categories, cones, categorical equivalences, homotopy categories and n-categories for colimits in nerves, joins and slices, pushout-joins, the Joyal model structure and categorical fibrations, mapping spaces, left fibrations over Kan complexes); Part CartesianFibrations (Cartesian edges, categorical fibrations over an ∞-category, initial sections, the marked lifting calculus, the mapping simplex, inner anodyne base change, the fibers of a categorical equivalence over an ∞-category, and (co)Cartesian fibrations over ∞-categories as categorical fibrations); ModelCategoryTheory, Part ModelCategories (homotopy pushouts, right properness); Tau Ceti joins, coslices and Cartesian fibrations.

## Layer 2: Cofinal maps and right anodyne maps

### 2.1 Cofinal maps

**2.1.1.** Define a map `v : K ⟶ B` of simplicial sets to be cofinal when, for every right fibration `E ⟶ B`, restriction
`Map_B(B, E) ⟶ Map_B(K, E)` of section spaces (Conventions: the fibers of `Fun(B, E) ⟶ Fun(B, B)` over the
identity and of `Fun(K, E) ⟶ Fun(K, B)` over v) is a weak homotopy equivalence (HTT, Def. 4.1.1.1, p. 241). Both
section spaces are Kan complexes, so this is the same as a homotopy equivalence. The `Suggested.lean`
declarations are `IsCofinal`, stated with Tau Ceti's `SSet.IsWeakHomotopyEquivalence`, and the restriction
map `sectionsRestrict`.

**Checks.**
- The inclusion `{1} ⊆ Δ[1]` is cofinal: it is the horn `Λ[1,1] ⊆ Δ[1]`, a right anodyne map, and right
  fibrations lift against it. The inclusion `{0} ⊆ Δ[1]` is not: the right fibration `{0} ⊆ Δ[1]` has no section
  over Δ[1] and exactly one over `{0}`. A definition with left fibrations would accept `{0}` and reject `{1}`.
- `∅ ⟶ Δ[0]` is not cofinal: for the empty right fibration over Δ[0], restriction of sections is
  `∅ ⟶ Fun(∅, ∅) = Δ[0]`.
- The fold map `Δ[0] ⊔ Δ[0] ⟶ Δ[0]` is not cofinal: for the right fibration `∂Δ[1] ⟶ Δ[0]`, the sections over
  Δ[0] form two points and those over `Δ[0] ⊔ Δ[0]` four. So cofinality is not surjectivity on vertices.

*Needs:* Tau Ceti `SSet.RightFibration`, `SSet.IsWeakHomotopyEquivalence`, `SSet.ihomOver`; Part InfinityCategoryFoundations §1.2.

### 2.2 Right anodyne maps as contravariant trivial cofibrations

**2.2.1.** Prove that for `i : A ⟶ B` the following are equivalent: i is right anodyne; for every map `B ⟶ C`, i is a trivial cofibration of the contravariant model structure on `SSet/C`; i is one over B itself (HTT, Prop. 4.1.2.1, p. 246). A route: the first condition gives the second by the contravariant form of HTT 2.1.4.9, and the second gives the third trivially. Under the third, pull back a right fibration `X ⟶ Y` to B. Its pullback is a fibrant object over B, so it lifts against i, and maps with the left lifting property against all right fibrations are right anodyne by the small object argument.
*Needs:* Tau Ceti `SSet.RightFibration`, `SSet.rightAnodyneExtensions`; Part InfinityCategoryFoundations §6.3.1 (HTT, Prop. 2.1.4.8 and the discussion after it; Prop. 2.1.4.9), §6.4.1 (HTT, Rem. 2.1.4.12) and §7.6.1 (HTT, Cor. 2.2.3.12); ModelCategoryTheory, Part ModelCategories §1.4.1 (HTT, Prop. A.1.2.5 (1)).

**2.2.2.** Prove two closure properties (HTT, Cor. 4.1.2.3 and 4.1.2.4, pp. 247–248):

- Given right anodyne maps `A' ⟶ B'`, `A ⟶ B`, `A'' ⟶ B''` compatible with spans `A' ⟵ A ⟶ A''` and `B' ⟵ B ⟶ B''` whose left legs are monomorphisms, the induced map of pushouts `A' ⊔_A A'' ⟶ B' ⊔_B B''` is right anodyne (HTT, Cor. 4.1.2.3, p. 247). A route: by §2.2 this is a statement about contravariant trivial cofibrations over `B' ⊔_B B''`, where left properness of the contravariant model structure makes the pushouts homotopy pushouts.
  *Needs:* §2.2.1; Part InfinityCategoryFoundations §6.3.1 (HTT, Prop. 2.1.4.7 and the discussion after Prop. 2.1.4.8) and §6.4.1 (HTT, Rem. 2.1.4.12); ModelCategoryTheory, Part ModelCategories §3.5.2 (HTT, Prop. A.2.4.4).
- Right anodyne maps are stable under filtered colimits in the arrow category (HTT, Cor. 4.1.2.4, p. 248). A route: by §2.2.1, since contravariant equivalences are stable under filtered colimits.
  *Needs:* §2.2.1; Part InfinityCategoryFoundations §6.3.1 (HTT, Prop. 2.1.4.7, perfection; the discussion after Prop. 2.1.4.8) and §6.4.1 (HTT, Rem. 2.1.4.12).

### 2.3 First properties of cofinal maps

**2.3.1.** Prove the first properties of cofinality (HTT, Prop. 4.1.1.3, p. 241):

- isomorphisms are cofinal;
- if `f : K ⟶ K'` is cofinal, then `g : K' ⟶ K''` is cofinal exactly when `g ∘ f` is;
- cofinal maps are weak homotopy equivalences;
- a monomorphism is cofinal exactly when it is right anodyne.

A route: restriction of sections composes; testing against `Z × K ⟶ K` with Z a Kan complex gives weak homotopy equivalences; for a right anodyne monomorphism restriction of sections is a trivial fibration, since `(K × Δ[1]) ⊔ (K' × {1}) ⊆ K' × Δ[1]` is right anodyne; and a cofinal monomorphism lifts against every right fibration.
*Needs:* §2.1.1 (HTT, Def. 4.1.1.1); Mathlib `SSet.KanComplex`; Tau Ceti `SSet.RightFibration`, `SSet.rightAnodyneExtensions_pushoutObjObjι`, `SSet.IsWeakHomotopyEquivalence`; ModelCategoryTheory, Part KanQuillen §3.2.1 (HTT, §A.2.7).

### 2.4 Two models of the space of cones

**2.4.1.** Prove that for an ∞-category C and diagrams `p : K ⟶ C`, `q : K' ⟶ C`, the simplicial set M parametrizing maps `(X × K) ⋆ K' ⟶ C` restricting to `p ∘ π_K` and q, and the simplicial set N parametrizing maps `K ⋆ (X × K') ⟶ C` restricting to p and `q ∘ π_{K'}`, are Kan complexes that are naturally homotopy equivalent (HTT, Lemma 4.1.1.5, p. 242). A route: build an ∞-category D with two objects x and y, whose simplices `Δ^J ⟶ D` are a decomposition of J into an initial part `J₋` and a final part `J₊` with a map `(K × Δ^{J₋}) ⋆ (K' × Δ^{J₊}) ⟶ C` restricting to `p ∘ π_K` and `q ∘ π_{K'}`; inner horns fill by the pushout-join lemma (HTT 2.1.2.3), since products with right or left horns are right or left anodyne. Then M is the right and N the left mapping space of D from x to y, so both are Kan complexes (HTT 1.2.2.3), and both are weakly equivalent to the mapping space of `C[D]` from x to y, through straightening over a point (HTT 2.2.2.7) and the comparison of `C[−]` with mapping spaces (HTT 2.2.4.1). The homotopy equivalence is natural in `(C, p, q)`, through this zigzag (HTT, Rem. 4.1.1.6, p. 243).
*Needs:* Tau Ceti `SSet.join`, `SSet.LeftFibration`, `SSet.leftAnodyneExtensions_pushoutObjObjι`, `SSet.rightAnodyneExtensions_pushoutObjObjι`; Part InfinityCategoryFoundations §5.2.2 (HTT, Prop. 1.2.2.3), §4.1.1 (HTT, Lemma 2.1.2.3), §7.3.2 (HTT, Prop. 2.2.2.7) and §8.1.1 (HTT, Prop. 2.2.4.1); ModelCategoryTheory, Part KanQuillen §3.2.1 (HTT, §A.2.7).

### 2.5 Cofinal maps preserve colimits

**2.5.1.** Prove that for `v : K' ⟶ K` cofinal and `p : K ⟶ C` a diagram in an ∞-category, `C_{p/} ⟶ C_{pv/}` is a homotopy equivalence on the fiber over every object (HTT, Prop. 4.1.1.7, p. 244). A route: the fibers are the Kan complexes M and N of §2.4, compared by restriction of sections.
*Needs:* §2.4.1; §2.1.1 (HTT, Def. 4.1.1.1); Part InfinityCategoryFoundations §4.3.1 (HTT, Cor. 2.1.2.2); Tau Ceti `SSet.LeftFibration`, `SSet.slice`.

**2.5.2.** Prove that if `v : K' ⟶ K` is cofinal, then for every ∞-category C and `p : K ⟶ C` the map `C_{p/} ⟶ C_{pv/}` is an equivalence of ∞-categories, and restriction along `v^▷` carries colimit diagrams `K^▷ ⟶ C` to colimit diagrams (HTT, Prop. 4.1.1.8, implications (1) ⇒ (2) ⇒ (3), p. 244). A route: (1) ⇒ (2) by §2.5.1, since a map of left fibrations that is an equivalence on fibers is a categorical equivalence; (2) ⇒ (3) because equivalences preserve initial objects of coslices.
*Needs:* §2.5.1; §2.1.1 (HTT, Def. 4.1.1.1); Part InfinityCategoryFoundations §1.2 (HTT, §1.2.12); Tau Ceti `SSet.coslice.IsColimit`; Part InfinityCategoryFoundations §4.3.1 (HTT, Cor. 2.1.2.2); Part CartesianFibrations §2.5.1 (HTT, Cor. 2.4.4.4).

### 2.6 Categorical equivalences into ∞-categories are cofinal

**2.6.1.** Prove that if `q : K' ⟶ K` is a categorical equivalence and K is an ∞-category, then q is cofinal (HTT, Cor. 4.1.1.9, case of an ∞-category target, p. 245). It is the case `K' ⟶ K ⟶ K` of `isCofinal_comp_iff_of_isCategoricalEquivalence`, the identity being cofinal, with the categorical equivalences of Part InfinityCategoryFoundations §2.1. HTT states this for any categorical equivalence, with the cancellation property; that form is proved from the colimit criterion for cofinality. A route: a right fibration `N ⟶ K` over an ∞-category is a Cartesian fibration (HTT, Prop. 2.4.2.4), hence a categorical fibration (Part CartesianFibrations §7.4, HTT 3.3.1.7). The invariance of sections under categorical equivalence (Part CartesianFibrations §7.5), applied over `X = K` to `A = K'`, `B = K` and the categorical equivalence q, says that restriction `Map_K(K, N) ⟶ Map_K(K', N)` is a categorical equivalence between Kan complexes, that is a homotopy equivalence. This is cofinality (HTT, Def. 4.1.1.1). The proof (Part CartesianFibrations §7.4 and the invariance of sections of Part CartesianFibrations §7.5) uses no size hypothesis, so q is cofinal against right fibrations in every universe; q stays a categorical equivalence in a larger universe, since the form of Part InfinityCategoryFoundations §2.1 (HTT, Def. 1.1.5.14, through `C[−]`) does not depend on the universe; this is the form used for the large ∞-categories `S`, `Sᵒᵖ` and `N(A°)` in §3.3 and §3.7.

*Needs:* §2.1.1 (HTT, Def. 4.1.1.1); Part InfinityCategoryFoundations §2.1.6 (HTT, Def. 1.1.5.14); Part CartesianFibrations §2.2.1 (HTT, Prop. 2.4.2.4), §7.4.1 (HTT, Prop. 3.3.1.7) and §7.5.1 (invariance of sections under categorical equivalence); Tau Ceti `SSet.RightFibration`, `SSet.ihomOver`.

**Checks.**

- For `K = Δ[1]` and `q` the identity, the statement is trivial; for `q : Δ[0] ⟶ J` into the nerve J of the free-living isomorphism, a categorical equivalence into an ∞-category, cofinality of `{0} ⊆ J` follows. The analogous inclusion `{0} ⊆ Δ[1]` is not a categorical equivalence, and it is not cofinal (§2.1), so the hypothesis cannot be weakened to "a weak homotopy equivalence".
- The converse fails: `Δ[1] ⟶ Δ[0]` is cofinal (its composite with the cofinal `{1} ⊆ Δ[1]` is the identity, §2.3) but not a categorical equivalence, since Δ[1] has no edge `1 ⟶ 0`.
- The projection `J ⟶ Δ[0]` is a categorical equivalence into an ∞-category, so it is cofinal, and so J is weakly contractible (§2.3). The projection `∂Δ[1] ⟶ Δ[0]` is not a categorical equivalence and not cofinal, since `∂Δ[1]` is not weakly contractible.

### Examples

- The inclusion of the cone point `Δ[0] ⟶ K^▷` is right anodyne, hence cofinal (§2.3). So a diagram with a final object has its value there as a colimit (§2.5).
- The last-vertex inclusion `{n} ⊆ Δ[n]` is right anodyne, hence cofinal.
- The inclusion `{0} ⊆ Δ[1]` is a weak homotopy equivalence that is not cofinal (§2.1). So the third property of §2.3 has no converse.
- An inner anodyne map `K ⊆ K₁` with K₁ an ∞-category is a categorical equivalence, hence cofinal by §2.6; so a diagram on K and any extension of it to K₁ have the same colimits (§2.5).

### Dependencies

Layer 1; Part InfinityCategoryFoundations (contravariant model structure, right fibrations, pushout-joins, straightening over a point, the mapping-space comparison); Part CartesianFibrations (Cor. 2.4.4.4, right fibrations are Cartesian, Cartesian fibrations over ∞-categories are categorical fibrations, invariance of sections); ModelCategoryTheory, Parts ModelCategories (small object argument, left properness) and KanQuillen; Tau Ceti left and right fibrations and anodyne maps.

## Layer 3: Homotopy colimits, and limits and colimits in `S` and `Cat∞`

### 3.1 Rectifying diagrams in a combinatorial simplicial model category

**3.1.1.** Prove that for a small simplicial set S, a small simplicial category C, a Dwyer–Kan equivalence `u : C[S] ⟶ C`, a combinatorial simplicial model category A and a C-chunk U of A, the induced map `N((U^C)°) ⟶ Fun(S, N(U°))` is a categorical equivalence, for `U^C` with either the projective or the injective model structure (HTT, Prop. 4.2.4.4, p. 276, with Rem. 4.2.4.5). A route, for one of the two structures: write U as a filtered colimit of small chunks, identify `Fun(S, N(U°))` with an exponential in the Joyal homotopy category, and apply the comparison of enriched diagram categories with exponentials for chunks, categorical equivalences being stable under filtered colimits. For the other structure: both structures have the objectwise weak equivalences, projective cofibrations are injective cofibrations and injective fibrations are projective fibrations. So the objects that are projectively cofibrant and injectively fibrant are bifibrant for both structures, every bifibrant object of either structure is weakly equivalent to one of them, and weak equivalences between cofibrant objects induce equivalences of mapping spaces into fibrant objects. Hence the nerve of their full subcategory includes into both `N((U^C)°)` by categorical equivalences over `Fun(S, N(U°))`.
*Needs:* Mathlib `SimplicialNerve`, instance `Quasicategory ((ihom K).obj C)`; ModelCategoryTheory, Part SimplicialCategories §1.3.1 (HTT, Def. A.3.1.5); ModelCategoryTheory, Part EnrichedLocalization §1.1.4 (HTT, Def. A.3.4.9; Lemma A.3.4.15) and §1.3.1 (HTT, Cor. A.3.4.14); ModelCategoryTheory, Part ModelCategories §6.1.1 (HTT, Def. A.2.6.1); Part InfinityCategoryFoundations §9.5.1 (HTT, Thm. 2.2.5.1, model structure part), §9.6.1 (HTT, Thm. 2.2.5.1, Quillen equivalence part) and §9.7.1 (HTT, Prop. 2.2.5.7); ModelCategoryTheory, Part ModelCategories §7.2.1 (HTT, Prop. A.2.8.2, projective part); ModelCategoryTheory, Part SimplicialCategories §2.6.1 (HTT, Prop. A.2.8.2, injective part) and §1.3.1 (HTT, Rem. A.3.1.6, mapping spaces under weak equivalences); Part InfinityCategoryFoundations §2.4.1 (HTT, Def. 1.2.10.1, essential surjectivity).

**3.1.2.** Prove the rectification of diagrams: for a locally Kan simplicial category I, a simplicial set S and `p : N(I) ⟶ S`, there are a locally Kan simplicial category C, a simplicial functor `P : I ⥤ C`, a categorical equivalence `j : S ⟶ N(C)`, and an equivalence between `j ∘ p` and `N(P)` in `Fun(N(I), N(C))` (HTT, Cor. 4.2.4.7, p. 276). A route: choose a Dwyer–Kan equivalence `C[S] ⟶ C₀` with C₀ locally Kan, and embed C₀ by Yoneda into the simplicial presheaves A on C₀ with the injective structure, giving `j₀ : S ⟶ N(A°)`. The counit `C[N(I)] ⟶ I` is an equivalence, so §3.1 applies to it; essential surjectivity of the comparison makes `j₀ ∘ p` equivalent to the nerve of a simplicial functor `I ⥤ A°`. Take for C the essential image of `C[S]` in A°.
*Needs:* §3.1.1; Part InfinityCategoryFoundations §2.1.6 (HTT, Def. 1.1.5.14; fully faithful functors, Def. 1.2.10.1); Part InfinityCategoryFoundations §2.4.1 (HTT, Def. 1.2.10.1, essential surjectivity); Part InfinityCategoryFoundations §9.6.1 (HTT, Thm. 2.2.5.1, Quillen equivalence part); ModelCategoryTheory, Part SimplicialCategories §2.6.1 (HTT, Prop. A.2.8.2, injective part).

**Checks** (naturality of the comparison of HTT, Prop. 4.2.4.4).

- The comparison is strictly natural in the pair `(S, u)`. Let `g : S ⟶ S′` and a simplicial functor `π : C ⟶ C′` satisfy `π ∘ u = u′ ∘ C[g]`, with `u′ : C[S′] ⟶ C′` an equivalence, and let U be a C-chunk and a C′-chunk. Then for every F in `(U^{C′})°` whose restriction `π^*F` is again fibrant-cofibrant, the comparison for `(S, C)` sends `π^*F` to the comparison for `(S′, C′)` of F composed with g. Both are evaluation of F along the map `S ⟶ N(C′)` adjoint to `π ∘ u = u′ ∘ C[g]`. A comparison built from a choice of fibrant replacements would satisfy this only up to equivalence.
- Restriction is modeled without a derived functor. For F in `(U^{C′})°` with the projective structures, `π^*F` has fibrant-cofibrant values, so its comparison image is defined by the same evaluation. For any projectively cofibrant replacement `F₀ ⟶ π^*F` that is a trivial fibration, the image of `F₀` is equivalent in `Fun(S, N(U°))` to the image of F composed with g. Indeed the components are weak equivalences between fibrant-cofibrant objects, hence equivalences of `N(U°)` (ModelCategoryTheory, Part SimplicialCategories §1.3 (HTT, Rem. A.3.1.6)), and a transformation is an equivalence when its components are (Part CartesianFibrations §5.5 (HTT, Prop. 3.1.2.1, over a point)). So the right derived functor of `π^*` corresponds to restriction along g.
- For `S = S′`, `C = C′` and π, g identities, both statements reduce to the identity of `N((U^C)°)`. For C and C′ ordinary categories, `S = N(C)` and u the counit `C[N(C)] ⟶ C`, the comparison sends F to `N(F)`. Then the first Check is the identity `N(F) ∘ N(π) = N(F ∘ π)`.

*Needs:* §3.1.1, §3.1.2; ModelCategoryTheory, Part SimplicialCategories §1.3.1 (HTT, Rem. A.3.1.6); Part CartesianFibrations §5.5.3 (HTT, Prop. 3.1.2.1).

### 3.2 Homotopy colimits are ∞-categorical colimits

**3.2.1.** Prove that for small locally Kan simplicial categories C and I, a simplicial functor `F : I ⥤ C` and a compatible family `η_I : F(I) ⟶ c` of maps to an object c of C, the family η exhibits c as a homotopy colimit of F exactly when the extension `N(I)^▷ ⟶ N(C)` of `N(F)` determined by η is a colimit diagram (HTT, Thm. 4.2.4.1, p. 275). HTT allows any locally Kan C; the route uses that C is small, and every application below to a large C, such as `A°` for a combinatorial simplicial model category A or `Kan`, passes object by object through small full subcategories (see the *Size* paragraph of §3.3 and step 5 of §3.7). A route: embed C by Yoneda into enriched presheaves, a combinatorial simplicial model category in which homotopy colimits are computed by injectively fibrant replacement, and translate the colimit condition by §1.4 and the mapping spaces of `Fun(N(I), N(C))` by §3.1.
*Needs:* §1.4.1, §3.1.1; Mathlib `SimplicialNerve`; Tau Ceti `SSet.coslice.IsColimit`; Part InfinityCategoryFoundations §1.2 (HTT, Notation 1.2.7.2; full subcategories, §1.2.11); Part InfinityCategoryFoundations §5.5.4 (HTT, Rem. 1.2.13.5); Part InfinityCategoryFoundations §9.6.1 (HTT, Thm. 2.2.5.1, Quillen equivalence part); ModelCategoryTheory, Part ModelCategories §7.1.1 (HTT, Def. A.2.8.1) and §7.2.1 (HTT, Prop. A.2.8.2, projective part); ModelCategoryTheory, Part SimplicialCategories §2.6.1 (HTT, Prop. A.2.8.2, injective part), §3.2.1 (HTT, homotopy colimits, after Prop. A.2.8.7) and §6.4.3 (HTT, Rem. A.3.3.13).

### 3.3 Limits and colimits in `N(A°)`

**3.3.1.** Prove that for a combinatorial simplicial model category A, the ∞-category `N(A°)` admits small limits and colimits (HTT, Cor. 4.2.4.8, p. 278). For the Kan–Quillen simplicial sets, where `N(A°)` is S, the `Suggested.lean` declaration `exists_isColimit_spaces` states the colimit half. The route avoids the replacement of diagrams by nerves, which depends on the colimit criterion for cofinality, itself proved from the case of spaces of this statement. Given `p : K ⟶ N(A°)` with K small, choose a Dwyer–Kan equivalence `C[K] ⟶ I` to a small locally Kan I, with adjoint categorical equivalence `j : K ⟶ N(I)`. By §3.1, p is equivalent to `N(F) ∘ j` for an injectively fibrant `F : I ⥤ A°`; its homotopy colimit is a colimit of `N(F)` by §3.2. Restriction along j preserves colimits: j is a categorical equivalence into the ∞-category `N(I)`, hence cofinal against right fibrations in every universe (§2.6, universes sentence), so §2.5 applies in the large ∞-category `N(A°)`; and equivalent diagrams have the same colimits, by §1.4. Limits are dual. *Size.* §3.2 is applied to the large locally Kan category `A°` object by object: for each object Y, the full subcategory of `A°` on the values of F, the homotopy colimit and Y is small, the homotopy-colimit condition is a condition object by object, and the mapping spaces of the full subcategories are those of `A°`; so §1.4 at Y gives the colimit condition in `N(A°)`.
*Needs:* §1.4.1, §2.5.2, §2.6.1, §3.1.1, §3.2.1; Mathlib `SimplicialNerve`, instance `Quasicategory ((ihom K).obj C)`; Tau Ceti `SSet.coslice.IsColimit`, `SSet.slice.IsLimit`; Part InfinityCategoryFoundations §5.5.4 (HTT, Rem. 1.2.13.5) and §9.6.1 (HTT, Thm. 2.2.5.1, Quillen equivalence part); ModelCategoryTheory, Part ModelCategories §6.1.1 (HTT, Def. A.2.6.1) and §7.2.1 (HTT, Prop. A.2.8.2, projective part); ModelCategoryTheory, Part SimplicialCategories §1.3.1 (HTT, Def. A.3.1.5), §2.6.1 (HTT, Prop. A.2.8.2, injective part), §3.2.1 (HTT, homotopy colimits, after Prop. A.2.8.7) and §5.4.2 (HTT, Thm. A.3.2.4, fibrant replacement).

### 3.4 Representable presheaves

**3.4.1.** Define, for a closed monoidal category V and a V-enriched category C, a V-enriched functor `G : Cᵒᵖ ⟶ V` to be represented by a pair `(c, η)` with `η : 𝟙_V ⟶ G(c)` when, for every object x, the composite `Map_C(x, c) ≅ Map_C(x, c) ⊗ 𝟙_V ⟶ Map_C(x, c) ⊗ G(c) ⟶ G(x)` is an isomorphism, the last map being the action of G. G is representable when such a pair exists (HTT, Def. 4.4.4.1, p. 318). Take V braided, as Mathlib's enrichment of `Cᵒᵖ` (`CategoryTheory.EnrichedCategory`) requires.

- A representing pair is unique up to unique isomorphism compatible with η.
- An isomorphism of V-enriched functors carries representing pairs to representing pairs.

**Checks.**

- For V the category of sets with its Cartesian product, this is ordinary representability by the Yoneda lemma.
- For V = Set, C one object with `Map(∗, ∗) = {id}` and `G(∗) = {a, b}`, G is not representable: for either choice of η the composite `{id} ⟶ G(∗)` is not a bijection. A definition asking only for a pair `(c, η)` would accept `(∗, a)`.
- For V = Set, the monoid `(ℕ, +)` as a one-object C, and G given by `ℕ` with its action by addition, `(∗, 0)` represents G but `(∗, 1)` does not, since `f ↦ 1 + f` misses 0. A definition depending on c alone, asking only for some isomorphism `Map_C(−, c) ≅ G`, would accept `(∗, 1)`.

*Needs:* Mathlib `CategoryTheory.EnrichedCategory`, `CategoryTheory.MonoidalClosed`.

**3.4.2.** Define a functor `F : Cᵒᵖ ⟶ S` on an ∞-category to be representable when the induced H-enriched functor of homotopy categories `hF : hCᵒᵖ ⟶ hS ≃ H` is representable in the sense of §3.4.1, and say that `(c, η)` with `η ∈ π₀ F(c)` represents F when it represents `hF` (HTT, Def. 4.4.4.4, p. 318).

- Representability depends only on the equivalence class of F in `Fun(Cᵒᵖ, S)`.
- If `(c, η)` and `(c', η')` both represent F, then c and c' are equivalent.

**Checks.**

- For C = Δ[0], F is representable exactly when its value is a contractible Kan complex. A definition that only asked for `π₀` to be a point would accept the circle.
- For `C = Δ[0] ⊔ Δ[0]` on objects a, b and F with both values Δ[0], F is not representable: `Map_C(b, a)` is empty while `F(b)` is not, and symmetrically. A definition testing only the value at c, asking `F(c) ≃ Map_C(c, c)`, would accept a.
- For C = Δ[1] and F with both values Δ[0] (it classifies `𝟙_{Δ[1]}`), F is represented by 1 but not by 0, since `Map_C(1, 0)` is empty while `F(1)` is not. A definition asking only that `F(c)` be contractible would accept 0. This agrees with Prop. 4.4.4.5 (§3.4.3): 1 is the final object of the total space Δ[1].

*Needs:* §3.4.1; Mathlib `SSet.Quasicategory`; Part InfinityCategoryFoundations §7.1.2 (HTT, Def. 1.2.16.1).

**3.4.3.** Prove that for a right fibration `f : C̃ ⟶ C` of ∞-categories classified by `F : Cᵒᵖ ⟶ S`, an object c̃ over c, and η the component of c̃ in `π₀ F(c) ≅ π₀(C̃ ×_C {c})`, the following are equivalent: `(c, η)` represents F; c̃ is final in C̃; the inclusion `{c̃} ⊆ C̃` is a contravariant equivalence in `SSet/C` (HTT, Prop. 4.4.4.5, p. 318). A route: `id_c` is final in `C_{/c}` (Part InfinityCategoryFoundations §5.5), so `{id_c} ⊆ C_{/c}` is right anodyne (Part InfinityCategoryFoundations §5.6), hence a contravariant trivial cofibration (§2.2); a contravariant equivalence between right fibrations over C is a pointwise equivalence (HTT, Cor. 2.2.3.13), hence a categorical equivalence (Part CartesianFibrations §7.3, first statement, Cartesian form; HTT uses Rem. 2.2.3.3), and categorical equivalences preserve final objects; compare `C_{/c}` with C̃ through the map determined by c̃.
*Needs:* §2.2.1, §3.4.2; Part InfinityCategoryFoundations §1.2 (HTT, §1.2.12) and §7.1.8 (right fibrations classified by maps to `Sᵒᵖ`); Tau Ceti `SSet.RightFibration`; Part InfinityCategoryFoundations §5.3.2 (HTT, Lemma 2.1.3.4), §5.5 (`id_c` final in `C_{/c}`), §5.6.1 (the inclusion of a final object is right anodyne), §6.4.1 (HTT, Rem. 2.1.4.12) and §7.6.1 (HTT, Cor. 2.2.3.13); Part CartesianFibrations §7.3.1 (first statement, HTT, Prop. 3.3.1.5, (2) ⇒ (1)); ModelCategoryTheory, Part KanQuillen §3.2.1 (HTT, §A.2.7).

### 3.5 Tensors with simplicial sets

**3.5.1.** For a diagram `p : K ⟶ C` in an ∞-category, write `F_p : hC ⟶ H` for the H-enriched functor, defined up to isomorphism, associated to the left fibration `C_{p/} ⟶ C`, and `F_X = Map_C(X, −)` for the case `p : Δ[0] ⟶ C` at X (HTT, Notation 4.4.4.8, p. 319); for p constant at X on `∂Δ[1]`, `F_p` is `F_X × F_X`. Prove that for p constant at X on a simplicial set K, `π₀` of the fiber `C_{p/} ×_C {Y}` is the set of H-morphisms `ψ : [K] ⟶ Map_C(X, Y)`, through `Fun(K, Map_C(X, Y))`; and that a cocone with cone point Y and class ψ is a colimit of p exactly when, for every object Z, the map `Map_C(Y, Z) ⟶ Map_C(X, Z)^{[K]}` adjoint to composition with ψ is an isomorphism of H (HTT, Cor. 4.4.4.9, p. 320). Such a colimit is written `X ⊗ K`; it depends only on the weak homotopy type of K. A route: the dual of the representability criterion of §3.4.
*Needs:* §3.4.2, §3.4.3; Part InfinityCategoryFoundations §1.2 (HTT, §1.2.12) and §7.1.8 (fibrations classified by maps to spaces); Tau Ceti `SSet.LeftFibration`, `SSet.coslice`, `SSet.coslice.IsColimit`; Tau Ceti `SSet.slice.homEquiv`, `SSet.coslice.homEquiv` (HTT, Prop. 1.2.9.2) and §4.3.1 (HTT, Cor. 2.1.2.2).

**3.5.2.** Prove that for K weakly contractible and `p : K ⟶ C` carrying every edge to an equivalence, p has a colimit, and an extension `K^▷ ⟶ C` is a colimit exactly when it carries every edge to an equivalence (HTT, Cor. 4.4.4.10, p. 320). A route: p factors through the core of C, a Kan complex, so it is homotopic to a constant diagram at some X. Then the colimit is `X ⊗ K ≃ X`, and colimits are unique up to equivalence.
*Needs:* §3.5.1; Mathlib `SSet.KanComplex`; Tau Ceti `SSet.IsWeaklyContractible`; Part InfinityCategoryFoundations §1.2 (HTT, §1.2.5, the core); Part InfinityCategoryFoundations §5.1.2 (HTT, Prop. 1.2.5.3) and §5.5.4 (HTT, Prop. 1.2.12.9; Rem. 1.2.13.5); ModelCategoryTheory, Part KanQuillen §3.2.1 (HTT, §A.2.7).

### 3.6 Slices of simplicial model categories

**3.6.1.** Prove that for a simplicial model category A and a fibrant-cofibrant object Z, with `A_{/Z}` carrying the model structure created by the forgetful functor to A (Mathlib `HomotopicalAlgebra.ModelCategory.over`) and the induced simplicial structure, in which the mapping space from `φ : X ⟶ Z` to `ψ : Y ⟶ Z` is the fiber of `ψ ∘ − : Map_A(X, Y) ⟶ Map_A(X, Z)` over the vertex φ, the comparison map `θ : N((A_{/Z})°) ⟶ N(A°)_{/Z}` is a categorical equivalence (HTT, Lemma 6.1.3.13, p. 567). A route in two steps.

1. **Essential surjectivity** (HTT, Lemma 6.1.3.13, proof, p. 568). An object of `N(A°)_{/Z}` is a map `φ : Z′ ⟶ Z` from a fibrant-cofibrant object. Factor it as a trivial cofibration `Z′ ⟶ Z″` followed by a fibration `ψ : Z″ ⟶ Z`. Then ψ is a fibrant-cofibrant object of `A_{/Z}`, and the factorization is a 2-simplex of `N(A°)` that exhibits an equivalence from φ to `θ(ψ)` in the slice.
2. **Full faithfulness** (HTT, Lemma 6.1.3.13, proof, p. 568). For objects `φ : X ⟶ Z` and `ψ : Y ⟶ Z`, the right mapping space from φ to ψ in the slice of a coherent nerve is `Sing_Q` of the homotopy fiber of `ψ ∘ − : Map_A(X, Y) ⟶ Map_A(X, Z)` over φ, computed by a path space. In `A_{/Z}` it is the strict fiber. When ψ is a fibration and X is cofibrant, `ψ ∘ −` is a Kan fibration by the simplicial model category axiom, so the strict fiber includes into the homotopy fiber by a homotopy equivalence, which `Sing_Q` preserves.

*Needs:* Mathlib `HomotopicalAlgebra.ModelCategory` (HTT, Def. A.2.1.1), `HomotopicalAlgebra.ModelCategory.over`, `SimplicialNerve`; Tau Ceti `SSet.slice`, `SSet.rightMappingSpace`; ModelCategoryTheory, Part SimplicialCategories §1.3.1 (HTT, Def. A.3.1.5; Rem. A.3.1.6, the fibration form of the axiom; Rem. A.3.1.8, `A°` is locally Kan); Part InfinityCategoryFoundations §2.1.6 (HTT, Def. 1.1.5.14; §1.2.10); Part InfinityCategoryFoundations §5.2.1 (HTT, right mapping spaces, §1.2.2), §7.3.3 (HTT, Prop. 2.2.2.13, right mapping spaces of a coherent nerve through `Sing_Q`; Prop. 2.2.2.9) and §2.4 (HTT, §1.2.10: essential surjectivity).

**Checks.**

- For A the Kan–Quillen simplicial sets and Z = Δ[0], `A_{/Z}` is A and the slice of `S` over a final object is `S` up to equivalence, and θ is even an isomorphism: every mapping space into Δ[0] is a point, so a simplex of `N(A°)` with last vertex Δ[0] is determined by its face opposite that vertex, and the mapping spaces of `A_{/Δ[0]}` are those of A.
- For A the Kan–Quillen simplicial sets and Z a Kan complex, the fibrant-cofibrant objects of `A_{/Z}` are the Kan fibrations `Y ⟶ Z`, and θ identifies their simplicial nerve with `S_{/Z}`. Using all maps `Y ⟶ Z` from Kan complexes, not only fibrations, would give the wrong mapping spaces: for `Δ[0] ⟶ Z` at a vertex z, the strict maps over Z from `Δ[0]` at z form a point, while the mapping space in `S_{/Z}` is the based loop space of Z at z.
- The hypothesis that Z is fibrant-cofibrant is needed for `N(A°)_{/Z}` to make sense: Z must be a vertex of `N(A°)`.

### 3.7 Small limits in the ∞-category of spaces

**3.7.1.** Prove Lemma L: for every small simplicial set K, every diagram `g : K ⟶ S` has a limit in the ∞-category of spaces; equivalently, every diagram `K ⟶ Sᵒᵖ` has a colimit. This is the case `A = Set_Δ` with the Kan–Quillen structure of §3.3 (HTT, Cor. 4.2.4.8, p. 278, with `N(A°) = S`), written out because the colimit criterion for cofinality consumes it and because the large target `S` needs the size step 5 below. The `Suggested.lean` declaration `exists_isLimit_spaces` states it, for diagrams indexed by simplicial sets with small sets of simplices. A route in six steps.

1. **Replace K by an ∞-category.** Choose an inner anodyne `K ⊆ K₁` with K₁ an ∞-category (small object argument) and extend g to `g₁ : K₁ ⟶ S`, possible because S is an ∞-category. Inner horns are left horns, so `K ⊆ K₁` is left anodyne and `Kᵒᵖ ⊆ K₁ᵒᵖ` is right anodyne, hence cofinal (§2.3); by the dual of §2.5, a limit cone of g₁ restricts to a limit cone of g. Cofinality of a right anodyne map is a lifting property, so it holds against right fibrations in every universe and applies to the large target S.
2. **Rigidify the indexing ∞-category.** Choose a fibrant replacement `C[K₁] ⟶ I` in the Bergner model structure, with adjoint `ũ : K₁ ⟶ N(I)`; ũ is a categorical equivalence between ∞-categories (HTT, Thm. 2.2.5.1, Quillen equivalence part). Then `ũᵒᵖ` is a categorical equivalence into an ∞-category, hence cofinal against right fibrations in every universe (§2.6, universes sentence), so by the dual of §2.5 restriction along `ũ^◁` carries limit diagrams in the large ∞-category S to limit diagrams.
3. **Transport the diagram.** Restriction `Fun(N(I), S) ⟶ Fun(K₁, S)` is an equivalence, so `g₁ ≃ g′ ∘ ũ` for some `g′ : N(I) ⟶ S`. *Universes:* S is large, and that ũ induces an equivalence on functors into the large ∞-category S holds because ũ is a weak equivalence between fibrant objects of the Joyal model structure and so has a homotopy inverse; equivalently, the form of categorical equivalence through `ℭ[−]` does not depend on the universe and agrees with the form through `Fun(−, C)` (Part InfinityCategoryFoundations §9.7, HTT, Prop. 2.2.5.8). The objects K₁, I, P and lim P below are small.
4. **Strictify.** By §3.1 (HTT, Prop. 4.2.4.4), with u the counit `C[N(I)] ⟶ I`, an equivalence for fibrant I, and A the simplicial sets with the Kan–Quillen structure, `g′ ≃ N(P)` for an injectively fibrant `P : I ⥤ Kan` (HTT, Prop. A.3.3.2; every object is cofibrant).
5. **The homotopy limit is a limit, object by object.** `lim P` is a Kan complex and a homotopy limit of P, since `Map(A, P(−))` is injectively fibrant and the limit functor is right Quillen for the injective structure (HTT, Rem. A.3.3.13). HTT, Thm. 4.2.4.1 (§3.2) is applied to fibrant simplicial categories through a projective structure on simplicial presheaves on them, which needs a small category, and `Kanᵒᵖ` is large. So argue object by object: for each Kan complex Y let `C_Y ⊆ Kanᵒᵖ` be the full subcategory on the `P(i)`, `lim P` and Y, a small fibrant simplicial category. The homotopy-colimit condition of §3.2 is a condition object by object, so it holds in `C_Y`, and §3.2, applied to `Pᵒᵖ : Iᵒᵖ ⥤ C_Y`, makes the nerve of the cone a colimit diagram in `N(C_Y)`. By §1.4 (HTT, Lemma 4.2.4.3), the comparison map of mapping spaces at Y is a homotopy equivalence; the mapping spaces in `N(C_Y)` and in `Fun(N(I)ᵒᵖ, N(C_Y))` are those of `Sᵒᵖ`, the subcategories being full. As Y is arbitrary, §1.4 in the converse direction shows that the nerve of the cone is a limit diagram for `N(P)` in S.
6. **Back along the equivalences.** Limits are invariant under equivalence of diagrams (§1.4, with the identification after HTT, Prop. 4.2.1.5, of natural transformations `p ⟶ δX` with objects of the fat slice, equivalent to the thin one by §1.2). So g′ has a limit, then `g₁ ≃ g′ ∘ ũ` by step 2, and then g by step 1.

*Needs:* §1.2.1 (HTT, Prop. 4.2.1.5), §1.4.1 (HTT, Lemma 4.2.4.3), §2.3.1 (HTT, Prop. 4.1.1.3), §2.5.2 (HTT, Prop. 4.1.1.8, (1) ⇒ (3), dual form), §2.6.1, §3.1.1 (HTT, Prop. 4.2.4.4), §3.2.1 (HTT, Thm. 4.2.4.1); Part InfinityCategoryFoundations §1.1 (HTT, sizes, §1.2.15) and §7.1.2 (HTT, Def. 1.2.16.1); Part InfinityCategoryFoundations §9.6.1 (HTT, Thm. 2.2.5.1, Quillen equivalence part) and §9.7.2 (HTT, Prop. 2.2.5.8); ModelCategoryTheory, Part ModelCategories §1.4.1 (HTT, Prop. A.1.2.5 (1)); ModelCategoryTheory, Part SimplicialCategories §5.4.2 (HTT, Thm. A.3.2.4, Bergner fibrant replacement), §6.1.1 (HTT, Prop. A.3.3.2) and §6.4.3 (HTT, Rem. A.3.3.13); Mathlib `SSet.KanComplex`; Tau Ceti `SSet.slice.IsLimit`.

**Checks.**

- For `K = ∂Δ[1]` and values X, Y, the limit is the product `X × Y` of Kan complexes, as step 5 computes: `I` may be taken to be the discrete category on two objects and P the pair itself.
- For `K = ∅` the limit is the final object Δ[0] of S, and for `K = Δ[0]` it is the value. A definition of limits by the underlying set of vertices would give the empty set in the first case.
- For `K = Λ[2,2]` with values `Δ[0] ⟶ Z ⟵ Δ[0]` at a vertex z, the limit is the based loop space of Z at z, not the strict fiber product `Δ[0] ×_Z Δ[0] = Δ[0]`: step 4 replaces P by an injectively fibrant diagram, which turns one leg into a path fibration.

### 3.8 `Cat∞ ≅ N((Set⁺_Δ)°)` and small limits and colimits in `Cat∞`

**3.8.1.** Prove the identification of `Cat∞` with the underlying ∞-category of marked simplicial sets, and that `Cat∞` has small limits and colimits (HTT, §3.3.3, introduction, p. 232, with Cor. 4.2.4.8, p. 278). The `Suggested.lean` declarations `exists_isLimit_catInfty` and `exists_isColimit_catInfty` state the second assertion, for Tau Ceti's `SSet.catInfty`. Let `Set⁺_Δ` carry the Cartesian model structure over Δ[0] (Part CartesianFibrations §5.7), with the simplicial enrichment by the mapping simplicial sets `Map^♯(X, Y)` (Part CartesianFibrations §5.8, HTT, Cor. 3.1.4.4).

1. **The fibrant-cofibrant objects.** Every marked simplicial set is cofibrant, and a marked simplicial set is fibrant exactly when it is `C^♮` for a small ∞-category C, the ∞-category with its equivalences marked (HTT, Prop. 3.1.4.1, over a point: a Cartesian fibration `C ⟶ Δ[0]` is an ∞-category C, and its Cartesian edges are its equivalences).
2. **The mapping objects.** For ∞-categories C and D, `Map^♯(C^♮, D^♮)` is the core of `Fun(C, D)`: an n-simplex is a map `Δ[n] × C ⟶ D` carrying the marked edges of `(Δ[n])^♯ × C^♮` to equivalences, that is, a simplex of `Fun(C, D)` all of whose edges are natural transformations with equivalences as components; these are the equivalences of `Fun(C, D)` (Part CartesianFibrations §5.5, HTT, Prop. 3.1.2.1, over a point), and a simplex all of whose edges are equivalences is a simplex of the core (Part InfinityCategoryFoundations §5.1, HTT, Prop. 1.2.5.3). Composition corresponds.
3. **The identification.** So `C ↦ C^♮` is an isomorphism of simplicial categories from `Cat^Δ_∞` (Tau Ceti `SSet.CatInftyΔ`, HTT, Def. 3.0.0.1) onto `(Set⁺_Δ)°`, and its simplicial nerve is an isomorphism `Cat∞ ≅ N((Set⁺_Δ)°)` (Tau Ceti `SSet.catInfty`).
4. **Limits and colimits.** `Set⁺_Δ` is a combinatorial simplicial model category (Part CartesianFibrations §5.7–5.8), so by §3.3 `N((Set⁺_Δ)°)`, hence `Cat∞`, has small limits and colimits, computed by homotopy limits and colimits in `Set⁺_Δ` (§3.2).

Steps 1–3 are the marked lifting calculus over a point and step 4 is §3.3. The descriptions of these limits and colimits through Cartesian sections and through inverted Cartesian edges are Part Straightening's.

*Needs:* §3.2.1, §3.3.1; Part CartesianFibrations §1.3.1 (HTT, Prop. 2.4.1.5, the Cartesian edges over a point are the equivalences), §5.5.3 (HTT, Prop. 3.1.2.1), §5.7.1 (HTT, Prop. 3.1.3.7) and §5.8.1 (HTT, Prop. 3.1.4.1), §5.8.3 (HTT, Cor. 3.1.4.4); Part InfinityCategoryFoundations §5.1.2 (HTT, Prop. 1.2.5.3); Part InfinityCategoryFoundations §1.1 (sizes); Tau Ceti `TauCeti.MarkedSSet` (HTT, Def. 3.1.0.1); Tau Ceti `SSet.CoreEnriched`, `SSet.CatInftyΔ`, `SSet.catInfty`, `TauCeti.MarkedSSet`; Mathlib `SimplicialNerve`.

**Checks.**

- The mapping object from `Δ[0]^♮` to `Δ[1]^♮` is `∂Δ[1]`, the core of `Fun(Δ[0], Δ[1]) = Δ[1]`, not Δ[1]: the nondegenerate edge of Δ[1] is not an equivalence, so `(Δ[1])^♯ × Δ[0]^♮ ⟶ Δ[1]^♮` along it is not a marked map. An enrichment by the full functor ∞-categories would give a simplicial category whose nerve is not `Cat∞`.
- `Δ[1]^♯`, with its nondegenerate edge marked, is cofibrant but not fibrant: that edge is not an equivalence of Δ[1], so `Δ[1]^♯` is not of the form `C^♮`. Here `Δ[1]^♮ = Δ[1]^♭` is the fibrant object. A description of the fibrant objects as the `C^♯` would put a non-invertible morphism among the marked ones.
- The final object of `Cat∞` is Δ[0], the limit of the empty diagram: `Map^♯(C^♮, Δ[0]^♮)` is a point for every C. The initial object is ∅.

### Examples

- For A the Kan–Quillen simplicial sets, `A°` is the simplicial category of Kan complexes and `N(A°)` is `S` (Part InfinityCategoryFoundations §7.1, HTT, Def. 1.2.16.1). So §3.3 and §3.7 give small limits and colimits in `S`.
- By §3.8, `Cat∞` has small limits and colimits; for instance the product of a set T of ∞-categories is their product simplicial set, a homotopy product in `Set⁺_Δ` since every `C^♮` is fibrant.
- For K the discrete simplicial set on a set T, `X ⊗ K` is the coproduct of T copies of X; for K = Δ[n] it is X (§3.5).
- For A the marked simplicial sets with the Cartesian model structure over a point and `Z = B^♮` for an ∞-category B, §3.6 and §3.8 model `(Cat∞)_{/B}` by marked simplicial sets over `B^♮`.

### Dependencies

Layers 1 and 2; ModelCategoryTheory, Parts SimplicialCategories (simplicial model categories, enriched diagrams, the Bergner structure, homotopy limits), EnrichedLocalization (chunks) and ModelCategories; Part InfinityCategoryFoundations (the Joyal model structure and its comparison with simplicial categories, contravariant model structure, right mapping spaces, straightening over a point); Part CartesianFibrations (invariance of `Fun(−, C)`, the two forms of categorical equivalence, the marked lifting calculus and the Cartesian model structure over a point); Part InfinityCategoryFoundations (sizes, §1.1; spaces and classified right fibrations, §7.1); Tau Ceti's `Cat∞`; Mathlib's coherent nerve, enriched categories and the model structure on over-categories; Tau Ceti `SSet.catInfty`.

## Layer 4: Cofinality detected by colimits

### 4.1 Representability of the universal right fibration, and unstraightened functors

**4.1.1.** Let `Z₀ = Un_ε(ι) ⟶ Sᵒᵖ`, for the counit `ε : C[Sᵒᵖ] ⟶ Kanᵒᵖ`, be the unstraightening of Part InfinityCategoryFoundations §7.7, the unmarked unstraightening of the inclusion ι of Kan complexes into simplicial sets, with its base point `∗_Z` over the point ∗; by Part InfinityCategoryFoundations §7.7 (2) it is pointwise equivalent to the universal right fibration `(Sᵒᵖ)_{/∗} ⟶ Sᵒᵖ`. Prove that `Z₀` is represented, in the sense of §3.4, by the one-point space ∗, a final object of S, together with the component of `∗_Z` (HTT, Cor. 3.3.2.7, p. 231, for the unstraightening `Z₀` of Part InfinityCategoryFoundations §7.7). A route: `∗_Z` is final in `Z₀` (Part InfinityCategoryFoundations §7.7 (1), the unmarked form of HTT, Prop. 3.3.2.6), and Prop. 4.4.4.5 (§3.4) turns finality into representability. Through the pointwise equivalence `(Sᵒᵖ)_{/∗} ⟶ Z₀` of Part InfinityCategoryFoundations §7.7 (2), the same holds for `(Sᵒᵖ)_{/∗} ⟶ Sᵒᵖ`, with `id_∗`.
*Needs:* §3.4.2, §3.4.3; Part InfinityCategoryFoundations §7.7.1 (1)–(2); Part InfinityCategoryFoundations §1.2 (HTT, §1.2.12) and §7.1.2 (HTT, Def. 1.2.16.1); Tau Ceti `SSet.RightFibration`.

That every small left fibration is classified by a map to S (HTT, Cor. 3.3.2.8, p. 231) is Part InfinityCategoryFoundations §7.7 (4), and that equivalent classifying maps classify pointwise-equivalent fibrations is Part InfinityCategoryFoundations §7.7 (5); this Part cites both.

**4.1.2.** Prove that unstraightened functors are classified by their adjoints: for a small simplicial set K and a simplicial functor `F : C[K]ᵒᵖ ⥤ Kan` with adjoint `p : K ⟶ Sᵒᵖ`, that is `Fᵒᵖ = ε ∘ C[p]` for the counit `ε : C[Sᵒᵖ] ⟶ Kanᵒᵖ`, the right fibration `Un_K(F) ⟶ K` is isomorphic over K to `K ×_{Sᵒᵖ} Z₀`, and so it is classified by p in the sense of Part InfinityCategoryFoundations §7.1. Dually, for `F : C[K] ⥤ Kan` with adjoint `p : K ⟶ S`, the left fibration whose opposite is `Un_{Kᵒᵖ}` of F, read through `C[Kᵒᵖ]ᵒᵖ ≅ C[K]`, is classified by p. For `K = N(I)` and F the composite of a simplicial functor `F₀ : I ⥤ Kan` with the counit `C[N(I)] ⟶ I`, the adjoint is `N(F₀)`. This statement has no locator of its own in HTT; it is the base-change step inside the route of Part InfinityCategoryFoundations §7.7 (3), stated for the computation of colimits in spaces. A route: base change in the target and then in the base (Part InfinityCategoryFoundations §7.2, HTT, Prop. 2.2.1.1) gives `Un_K(F) ≅ Un_{Fᵒᵖ}(ι) = Un_{ε ∘ C[p]}(ι) ≅ p^* Un_ε(ι) = K ×_{Sᵒᵖ} Z₀`, pulling back the pointwise equivalence `(Sᵒᵖ)_{/∗} ⟶ Z₀` of Part InfinityCategoryFoundations §7.7 (2) along p joins it to `K ×_{Sᵒᵖ} (Sᵒᵖ)_{/∗}`. The left-fibration form follows by taking opposites, with `((Sᵒᵖ)_{/∗})ᵒᵖ = S_{∗/}`.
*Needs:* Part InfinityCategoryFoundations §7.2.1 (HTT, Prop. 2.2.1.1) and §7.7.1 (2); Part InfinityCategoryFoundations §2.1.2 (the opposite comparison), §2.1.5 (the counit) and §7.1.2 (`Kan` and S), §7.1.8 (classified right and left fibrations); Mathlib `SimplicialNerve`, `SSet.opFunctor`.

**Checks.**

- For `K = Δ[0]` and F the Kan complex T, p picks T, and `Un_K(F)` is the fiber of `Z₀` over T, homotopy equivalent to the fiber `Hom^R_{Sᵒᵖ}(T, ∗) ≅ Sing_Q T` of `(Sᵒᵖ)_{/∗}` (Part InfinityCategoryFoundations §7.7 (2)), hence to T. A classification that only remembered `π₀ T` would not separate the circle from a point.
- For `K = Δ[1]`, F is a map `F(1) ⟶ F(0)`, and p is the edge of `Sᵒᵖ` from `F(0)` to `F(1)` given by it, read backwards. For `F(0) = Δ[0]` and `F(1) = ∅`, `Un_K(F)` is pointwise equivalent to the right fibration `{0} ⊆ Δ[1]`. No F has `F(0) = ∅` and `F(1) = Δ[0]`, since there is no map `Δ[0] ⟶ ∅`; this matches that `{1} ⊆ Δ[1]` is not a right fibration. Reading p in S instead of `Sᵒᵖ` would reverse the variance.

### 4.2 Maps that preserve colimits are cofinal

**4.2.1. Colimit-preserving maps are cofinal.** Let `v : K' ⟶ K` be a map of small simplicial sets such that, for every small ∞-category C and every colimit diagram `p̄ : K^▷ ⟶ C`, the composite `p̄ ∘ v^▷` is a colimit diagram. Prove that v is cofinal, against right fibrations in every universe (HTT, Prop. 4.1.1.8, implication (3) ⇒ (1), p. 244, with test ∞-categories restricted to small ones). The route below uses neither HTT 3.3.4.5–3.3.4.6, nor HTT 4.2.3.14, nor the classification of Cartesian fibrations; it runs through Part InfinityCategoryFoundations §7.7 and Lemma L.

1. **Replace the fibration.** Let `X ⟶ K` be a small right fibration; it suffices to show that `Map_K(K, X) ⟶ Map_{K'}(K', X ×_K K')` is a homotopy equivalence. By Part InfinityCategoryFoundations §7.7 (3), X is joined to `X₀ = K ×_{Sᵒᵖ} (Sᵒᵖ)_{/∗}` by a zigzag of pointwise equivalences of right fibrations, for some `p : K ⟶ Sᵒᵖ`, and the zigzag pulls back along v. The contravariant model structures over K and K' are simplicial, every object is cofibrant and right fibrations are fibrant (HTT, Cor. 2.2.3.12; Prop. 2.1.4.8, dual), and pointwise equivalences of right fibrations are contravariant equivalences (HTT, Cor. 2.2.3.13). By Ken Brown's lemma, section spaces carry the zigzag to homotopy equivalences compatible with restriction along v. So take `X = X₀`.
2. **Sections as cones.** A section of `X₀ ⟶ K` is a map `K ⋆ Δ[0] ⟶ Sᵒᵖ` extending p with cone point ∗. So `Map_K(K, X₀)` is the Kan complex M of §2.4 (HTT, Lemma 4.1.1.5, with `C = Sᵒᵖ`, `K' = Δ[0] ↦ ∗`), naturally homotopy equivalent to the fiber `(Sᵒᵖ)_{p/} ×_{Sᵒᵖ} {∗}`; likewise for K' with `p ∘ v`, naturally in v (HTT, Rem. 4.1.1.6).
3. **Compare under-categories through a colimit.** By Lemma L (§3.7), p has a colimit `p̄ : K^▷ ⟶ Sᵒᵖ` with vertex x. Let `C₀ ⊆ Sᵒᵖ` be the full simplicial subset on a small set of objects containing the image of p̄ and ∗: a small ∞-category in which p̄ is still a colimit, since `(C₀)_{p/}` is the full subcategory of `(Sᵒᵖ)_{p/}` on the cones with vertex in `C₀`. By hypothesis `p̄ ∘ v^▷` is a colimit of `p ∘ v` in `C₀`. In the diagram of fibers over ∗

        (Sᵒᵖ)_{p/}   ⟵  (Sᵒᵖ)_{p̄/}   ⟶  (Sᵒᵖ)_{x/}
            ↓               ↓                 ‖
        (Sᵒᵖ)_{pv/}  ⟵  (Sᵒᵖ)_{p̄v/}  ⟶  (Sᵒᵖ)_{x/}

   all five fibers are the same simplicial sets computed in `C₀` or in `Sᵒᵖ`, since every vertex of their simplices lies in `C₀`. The left maps are trivial fibrations because colimits are initial in the under-category (Part InfinityCategoryFoundations §8.2, HTT, Cor. 1.2.12.5). The right maps are trivial fibrations because the cone-point inclusion `Δ[0] ⊆ K ⋆ Δ[0]` is right anodyne and restriction of under-categories along a right anodyne map is a trivial fibration (HTT, Prop. 2.1.2.5). The cone point is right anodyne because the monomorphisms `K₀ ⊆ K` for which `K₀ ⋆ Δ[0] ⊆ K ⋆ Δ[0]` is right anodyne form a weakly saturated class containing `∂Δ[m] ⊆ Δ[m]`, where the map is the right horn `Λ[m+1, m+1] ⊆ Δ[m+1]`; take `K₀ = ∅`. So the left vertical map is a homotopy equivalence, and by step 2 so is restriction of sections.
4. **Universes.** Steps 1–3 give cofinality against small right fibrations. To pass to every universe, factor `v = g ∘ f` with f right anodyne and g a right fibration (small object argument; the middle object W is small). Then g is cofinal against small right fibrations (§2.3, cancellation). Testing against g itself, restriction `Map_K(K, W) ⟶ Map_K(W, W)` along g is a homotopy equivalence, so g has a section s with `s ∘ g` fiberwise homotopic to the identity of W; hence the fibers of g are contractible and g is a trivial fibration (Part InfinityCategoryFoundations §5.3, HTT, Lemma 2.1.3.4, dual). Right anodyne maps and trivial fibrations are cofinal against right fibrations in every universe: the first by lifting, the second by the trivial-fibration clause of Part CartesianFibrations §7.5, which needs no fibration hypothesis. So v is.

*Needs:* §2.3.1 (HTT, Prop. 4.1.1.3), §2.4.1 (HTT, Lemma 4.1.1.5; Rem. 4.1.1.6), §3.7.1 (Lemma L); §2.1.1 (HTT, Def. 4.1.1.1); Part InfinityCategoryFoundations §1.2.4 (HTT, Def. 1.2.13.4); Part InfinityCategoryFoundations §7.7.1 (3), §7.6.1 (HTT, Cor. 2.2.3.12, 2.2.3.13), §6.3.2 (HTT, Prop. 2.1.4.8), §6.4.1 (HTT, Rem. 2.1.4.12), §4.3.2 (HTT, Prop. 2.1.2.5), §8.2.1 (HTT, Cor. 1.2.12.5) and §5.3.2 (HTT, Lemma 2.1.3.4); Part CartesianFibrations §7.5.1 (invariance of sections, trivial-fibration clause); ModelCategoryTheory, Part ModelCategories §1.4.1 (HTT, Prop. A.1.2.5 (1)); Tau Ceti `SSet.RightFibration`, `SSet.join`, `SSet.coslice.IsColimit`, `SSet.rightAnodyneExtensions`.

**Checks.**

- For `K = Δ[1]` and `v = {1} ⊆ Δ[1]`, the hypothesis holds (a colimit of a diagram on Δ[1] is its value at 1, and `{1}` restricts it to the identity cocone), and v is cofinal. For `v = {0} ⊆ Δ[1]` the hypothesis fails already in `C = Δ[1]` (Conventions), and v is not cofinal.
- For `K = Δ[2]` and `v = Λ[2,1] ⊆ Δ[2]`, an inner anodyne map, the hypothesis holds and v is cofinal, in agreement with §2.6.
- For K the circle `Δ[1]/∂Δ[1]` and v its vertex, v is not cofinal: the right fibration classified by the ℤ-torsor with monodromy `+1` has no section over K but ℤ of them over the vertex. The hypothesis fails in `C₀ ⊆ Sᵒᵖ` small, as the theorem predicts: the colimit in `Sᵒᵖ` of the diagram on K at that torsor is its space of sections, which is empty, while the colimit over the vertex is the torsor.

### 4.3 Cofinality detected by colimits

**4.3.1.** Prove that for a map `v : K' ⟶ K` of small simplicial sets the following are equivalent: v is cofinal; for every ∞-category C and `p : K ⟶ C`, `C_{p/} ⟶ C_{pv/}` is an equivalence of ∞-categories; for every ∞-category C, restriction along `v^▷` carries colimit diagrams to colimit diagrams; and the last two conditions for small C only (HTT, Prop. 4.1.1.8, p. 244). A route: (1) ⇒ (2) ⇒ (3) is §2.5 and holds for C in any universe, cofinality being universe-independent (§4.2, step 4); (3) for small C ⇒ (1) is §4.2 (colimit-preserving maps are cofinal); (2) for small C implies (3) for small C because equivalences preserve initial objects of coslices. The `Suggested.lean` declaration `isCofinal_iff_forall_isColimit` states the equivalence of the first and third conditions, for test ∞-categories in the universe of the diagram.
*Needs:* §2.5.2, §4.2.1; Tau Ceti `SSet.coslice.IsColimit`.

### 4.4 Cofinality is invariant under categorical equivalence

**4.4.1.** Prove that if `q : K' ⟶ K''` is a categorical equivalence, then `p : K ⟶ K'` is cofinal exactly when `q ∘ p` is; in particular categorical equivalences are cofinal (HTT, Cor. 4.1.1.9, p. 245). The `Suggested.lean` declaration `isCofinal_comp_iff_of_isCategoricalEquivalence` states the first assertion. A route in three steps, Lurie's with the tacit step written out.

1. **q is cofinal.** For a diagram `r : K'' ⟶ C` in an ∞-category, `C_{r/} ⟶ C_{rq/}` is a categorical equivalence, by the fat slices of §1.2, joins preserving categorical equivalences (§1.1), and the invariance of `Fun(−, C)`. So q satisfies the second condition of §4.3 and is cofinal. When K'' is an ∞-category this is §2.6 without the colimit criterion.
2. **If p is cofinal, so is q ∘ p**, by composition (§2.3).
3. **If q ∘ p is cofinal, so is p.** Test p against the second condition of §4.3. Let `r' : K' ⟶ C` be a diagram in an ∞-category. Restriction `Fun(K'', C) ⟶ Fun(K', C)` along q is a categorical equivalence (Part CartesianFibrations §3.4, HTT, Prop. 1.2.7.3), hence essentially surjective, so `r' ≃ r'' ∘ q` in `Fun(K', C)` for some `r'' : K'' ⟶ C`. The condition for r' is invariant under such an equivalence: `C_{r'/} ⟶ C_{r'p/}` is a map of left fibrations over C, so it is a categorical equivalence exactly when it is a homotopy equivalence on the fiber over every object Y (Part CartesianFibrations §7.3, both statements), and by §1.3 and §1.4 that fiber map is `Map_{Fun(K', C)}(r', δY) ⟶ Map_{Fun(K, C)}(r' ∘ p, δY)`, which an equivalence `r' ≃ r'' ∘ q` and its image under restriction along p carry to the map for `r'' ∘ q`. For `r'' ∘ q`, in `C_{r''/} ⟶ C_{r''q/} ⟶ C_{r''qp/}` the first map is a categorical equivalence by step 1 and the composite by the cofinality of q ∘ p (§2.5), so the second is one by two-out-of-three. So p satisfies the second condition of §4.3 and is cofinal.

Consequently, cofinality of a map depends only on its class in the homotopy category of the Joyal model structure (HTT, Cor. 4.1.1.10, p. 245): replace the target by an ∞-category, where two maps with the same class are related through a cylinder object whose structure maps are categorical equivalences, and apply the first assertion with §2.3.
*Needs:* §1.1.2, §1.2.1, §1.3.1, §1.4.1, §2.3.1, §2.5.2, §4.3.1; §2.1.1 (HTT, Def. 4.1.1.1); Part InfinityCategoryFoundations §2.1.6 (HTT, Def. 1.1.5.14); Part CartesianFibrations §2.2.1 (HTT, Prop. 2.4.2.4), §3.4.1 (HTT, Prop. 1.2.7.3), §7.3.1, §7.3.2 (both statements, HTT, Prop. 3.3.1.5) and §7.4.1 (HTT, Prop. 3.3.1.7); Part InfinityCategoryFoundations §9.5.1 (HTT, Thm. 2.2.5.1, model structure part) and §9.7.1 (HTT, Prop. 2.2.5.7); Mathlib `SSet.Quasicategory`.

### 4.5 Cofinal right fibrations and factorization

**4.5.1.** Prove that a right fibration is cofinal exactly when it is a trivial fibration (HTT, Cor. 4.1.1.11, p. 245). The `Suggested.lean` declaration is `isCofinal_iff_rlp_monomorphisms`. A route: a trivial fibration is a categorical equivalence, hence cofinal (§4.4). Conversely, for a cofinal right fibration `p : X ⟶ S`, `Map_S(S, X) ⟶ Map_S(X, X)` is a homotopy equivalence, so some section f has `f ∘ p` fiberwise homotopic to the identity; the fibers are then contractible, and the dual of HTT 2.1.3.4 applies.
*Needs:* §4.4.1; Mathlib `SSet.KanComplex`; Tau Ceti `SSet.RightFibration`; Part InfinityCategoryFoundations §5.3.2 (HTT, Lemma 2.1.3.4); Part InfinityCategoryFoundations §9.5.1 (HTT, Thm. 2.2.5.1, model structure part, for trivial fibrations being categorical equivalences).

**4.5.2.** Prove that a map is cofinal exactly when it factors as a right anodyne map followed by a trivial fibration (HTT, Cor. 4.1.1.12, p. 246). A route: both factors of such a factorization are cofinal (§2.3, §4.4). Conversely, factor a cofinal map as a right anodyne map followed by a right fibration, which is cofinal by cancellation (§2.3), hence a trivial fibration. The `Suggested.lean` declaration `isCofinal_iff_exists_rightAnodyne_trivialFibration` states this.
*Needs:* §2.3.1, §4.4.1, §4.5.1; ModelCategoryTheory, Part ModelCategories §1.4.1 (HTT, Prop. A.1.2.5 (1)).

### 4.6 Cofinal maps as contravariant equivalences

**4.6.1.** Prove that for `i : A ⟶ B` the following are equivalent: i is cofinal; for every map `B ⟶ C`, i is a contravariant equivalence in `SSet/C`; i is one over B itself (HTT, Prop. 4.1.2.5, p. 248). A route: factor i as a right anodyne map followed by a trivial fibration (§4.5), both contravariant equivalences over every C (§2.2). For (3) ⇒ (1), factor i as a right anodyne map followed by a right fibration, which is then a fibrant contravariant equivalence over B, hence a trivial fibration.
*Needs:* §2.2.1, §4.5.2; §2.1.1 (HTT, Def. 4.1.1.1); Tau Ceti `SSet.RightFibration`; Part InfinityCategoryFoundations §6.4.1 (HTT, Rem. 2.1.4.12) and §7.6.1 (HTT, Cor. 2.2.3.12); ModelCategoryTheory, Part ModelCategories §1.4.1 (HTT, Prop. A.1.2.5 (1)).

**4.6.2.** Prove that cofinal maps are stable under pushout along any map, provided the cofinal map or the other map is a monomorphism (HTT, Cor. 4.1.2.7, p. 248). A route: by §4.6.1, this is left properness of the contravariant model structure.
*Needs:* §4.6.1; Part InfinityCategoryFoundations §6.3.1 (HTT, Prop. 2.1.4.7) and §6.4.1 (HTT, Rem. 2.1.4.12); ModelCategoryTheory, Part ModelCategories §3.4.1 (HTT, Def. A.2.4.1).

### Examples

- `Δ[1] ⟶ Δ[0]` is cofinal but not a trivial fibration: its composite with the cofinal inclusion `{1} ⊆ Δ[1]` is the identity of `Δ[0]`, so it is cofinal by cancellation (§2.3), while the two vertices of Δ[1] admit no edge from 1 to 0.
- The right fibration `{0} ⊆ Δ[1]` is not a trivial fibration, so §4.5 confirms that it is not cofinal; for the nerve J of the free-living isomorphism, the projection `J × Δ[1] ⟶ Δ[1]` is a right fibration and a trivial fibration, as a pullback of `J ⟶ Δ[0]`, so it is cofinal (§4.5), though it is not an isomorphism.
- A categorical equivalence that is not a monomorphism, such as `J ⟶ Δ[0]` for the nerve J of the free-living isomorphism, is cofinal by §4.4, though cofinal monomorphisms are exactly the right anodyne maps (§2.3).

### Dependencies

Layers 1–3, through Lemma L (§3.7) and §2.6; Part InfinityCategoryFoundations (sizes, §1.1; spaces and classified fibrations, §7.1; the classifying maps of §7.7, the contravariant model structure, final objects, the Joyal model structure); Part CartesianFibrations (invariance of `Fun(−, C)`, the fiberwise criteria, invariance of sections); ModelCategoryTheory, Part ModelCategories (small object argument, left properness).

## Layer 5: Smooth maps and Quillen's Theorem A

### 5.1 Smooth maps

**5.1.1.** Prove that for `p : X ⟶ Y` the following are equivalent (HTT, Prop. 4.1.2.8, p. 249):

1. for every right anodyne map `A ⟶ B` over Y, `A ×_Y X ⟶ B ×_Y X` is right anodyne;
2. for every pullback `X' = X ×_Y Y'`, pullback `p'^* : SSet/Y' ⥤ SSet/X'` preserves contravariant equivalences;
3. for every such pullback, `p'^*` is a left Quillen functor for the contravariant model structures, with right adjoint `p'_*`.

A route: (1) ⇒ (2): (1) is stable under base change, so take `p' = p`. A contravariant equivalence between fibrant objects is a fiberwise homotopy equivalence, which `p^*` preserves; reduce the general case to it by right anodyne fibrant replacements, which `p^*` keeps right anodyne, hence contravariant equivalences by §2.2. (2) ⇒ (3): `p'^*` preserves cofibrations, and trivial cofibrations by (2). (3) ⇒ (2): a left Quillen functor preserves weak equivalences between cofibrant objects, and every object is cofibrant. (2) ⇒ (1): a right anodyne `A ⟶ B` over Y is a contravariant equivalence over B (§2.2); apply (2) to the base change of p along `B ⟶ Y`, and §2.2 again.
*Needs:* §2.2.1; Tau Ceti `SSet.RightFibration`; Part InfinityCategoryFoundations §6.3.1, §6.3.2 (HTT, Prop. 2.1.4.8 and the discussion after it), §6.4.1 (HTT, Rem. 2.1.4.12) and §7.6.1 (HTT, Cor. 2.2.3.12); ModelCategoryTheory, Part ModelCategories §4.1.1 (HTT, §A.2.5).

**5.1.2.** Define a map to be smooth when it satisfies these conditions (HTT, Def. 4.1.2.9, p. 250).

- Smooth maps are stable under base change and composition.
- A smooth map's pullback functor preserves contravariant equivalences over every base. In particular, in a pullback square `X' = X ×_S S'` along a smooth `X ⟶ S`, the pullback of a cofinal map `S' ⟶ S` is cofinal, since by §4.6 a cofinal map is a contravariant equivalence over S (HTT, Rem. 4.1.2.10, p. 250).

**Checks.**

- The projection `Δ[1] ⟶ Δ[0]` is smooth, since products with Δ[1] preserve right anodyne maps, but it is not a right fibration: the horn `Λ[2,2]` with vertices 1, 0, 1 (edge `0 ⟶ 2` the identity of 1, edge `1 ⟶ 2` the edge `0 ⟶ 1`) has no filler, as Δ[1] has no edge `1 ⟶ 0`. So smoothness is not a fibration condition.
- The inclusion `{0} ⊆ Δ[1]` is a right fibration but not smooth. Pulling the right anodyne map `{1} ⊆ Δ[1]` back along it gives `∅ ⟶ {0}`, which is not right anodyne. So right fibrations need not be smooth.
- The inclusion `{1} ⊆ Δ[1]` is smooth, being a left fibration (§5.2), but not a right fibration: the edge `0 ⟶ 1` has no lift ending at 1. So smoothness is not the property of being a right fibration: that wrong definition would reject this map, and would accept `{0} ⊆ Δ[1]`, which the previous Check shows is not smooth.

*Needs:* §5.1.1; for the cofinal base change, §4.6.1.

### 5.2 Closure properties; coCartesian fibrations are smooth

**5.2.1.** Prove the closure properties of smooth maps to S: if `X ⟶ X'` is a monomorphism, `X ⟶ X''` any map, all over S, and the three maps to S are smooth, then `X' ⊔_X X'' ⟶ S` is smooth (HTT, Prop. 4.1.2.13, p. 251); and smooth maps to S are stable under filtered colimits in `SSet/S` (HTT, Prop. 4.1.2.14, p. 252). A route, the same for both: condition (1) of §5.1 and the closure of right anodyne maps under pushouts and under filtered colimits (§2.2), since pullback commutes with colimits.
*Needs:* §2.2.2 (Cors. 4.1.2.3, 4.1.2.4), §5.1.1, §5.1.2.

**5.2.2.** Prove that every coCartesian fibration of simplicial sets is smooth; in particular every left fibration is (HTT, Prop. 4.1.2.15, p. 252). A route in two steps, Lurie's with one step replaced so that it uses no cofinality statement over a base that is not an ∞-category.

1. **Reduction to a right horn over a simplex** (HTT, Prop. 4.1.2.15, proof, p. 252). Pullback along a coCartesian fibration `p : X ⟶ S` preserves colimits and monomorphisms, so the maps over S whose pullback is right anodyne form a weakly saturated class. Right anodyne maps over S lie in the weak saturation, inside `SSet/S`, of the right horns over S, by the small object argument in `SSet/S`, as in the general case of Part CartesianFibrations §7.1: a lifting problem against a right horn over S is an ordinary one. A right horn over S pulls back along its simplex `Δ[n] ⟶ S` to a coCartesian fibration over Δ[n] (Tau Ceti `SSet.CartesianFibration.of_isPullback`, dually). It therefore suffices to treat a coCartesian fibration `X ⟶ Δ[n]` and a right horn `Λ = Λ[n,i] ⊆ Δ[n]`, `0 < i ≤ n`. X is then an ∞-category.
2. **The horn case.** Let `M^op(φ) = M(φᵒᵖ)ᵒᵖ` be the dual mapping simplex of a sequence `φ : A₀ ⟶ A₁ ⟶ ⋯ ⟶ Aₙ`, built from the Cartesian fibration `Xᵒᵖ ⟶ Δ[n]ᵒᵖ ≅ Δ[n]`, with its quasi-equivalence `g : M^op(φ) ⟶ X` (HTT, Prop. 3.2.2.7, dual form). Levelwise `M^op(φ) = M^op(φ') ⊔_{A₀ × d₀Δ[n]} (A₀ × Δ[n])`; since `i ≠ 0`, Λ contains `d₀Δ[n]`, so `M^op(φ)_Λ ⊆ M^op(φ)` is a pushout of `A₀ × Λ[n,i] ⊆ A₀ × Δ[n]`, which is right anodyne for `0 < i ≤ n` (HTT, Cor. 2.1.2.7). Fix a right fibration `N ⟶ X`; it is a categorical fibration (Part CartesianFibrations §7.4). Restriction along g, `Map_X(X, N) ⟶ Map_X(M^op(φ), N)`, is a homotopy equivalence (§2.6). Restriction `Map_X(M^op(φ), N) ⟶ Map_X(M^op(φ)_Λ, N)` is a trivial fibration, the inclusion being right anodyne. And `M^op(φ)_Λ ⟶ X_Λ` is a categorical equivalence over X (HTT, Prop. 3.2.2.7 (2), dual form), so by the invariance of sections (Part CartesianFibrations §7.5) restriction `Map_X(X_Λ, N) ⟶ Map_X(M^op(φ)_Λ, N)` is a homotopy equivalence. By two-out-of-three, `Map_X(X, N) ⟶ Map_X(X_Λ, N)` is a homotopy equivalence: the monomorphism `X_Λ ⊆ X` is cofinal, hence right anodyne (§2.3). HTT's own deduction of this step asserts that `M^op(φ)_Λ ⟶ X_Λ` is cofinal, which needs §4.4 over the simplicial set `X_Λ`, not an ∞-category; the step above works over X only.

*Needs:* §2.2, §2.3.1, §2.6.1, §5.1.1, §5.1.2, §5.2.1; Part CartesianFibrations §2.2.1 (HTT, Prop. 2.4.2.4, dual form: left fibrations are coCartesian), §6.1.1 (HTT, the introduction to §3.2.2), §6.2.1 (HTT, Def. 3.2.2.6), §6.3.2 (HTT, Prop. 3.2.2.7, applied to `Xᵒᵖ ⟶ Δ[n]ᵒᵖ` for the dual mapping simplex), §7.1.1 (the small object argument over a base), §7.4.1 (HTT, Prop. 3.3.1.7) and §7.5.1 (invariance of sections under categorical equivalence); Part InfinityCategoryFoundations §3.3 (HTT, Cor. 2.1.2.7); ModelCategoryTheory, Part ModelCategories §1.4.1 (HTT, Prop. A.1.2.5 (1)); Tau Ceti `SSet.CartesianFibration`, `SSet.CartesianFibration.of_isPullback`, `SSet.RightFibration`, `SSet.rightAnodyneExtensions_pushoutObjObjι`.

**5.2.3.** Prove that for a bifibration `p : X ⟶ S × T`, the composite `π_S ∘ p : X ⟶ S` is smooth (HTT, Prop. 4.1.2.16, p. 252). A route: X is the filtered colimit of its restrictions over the finite simplicial subsets of T, so by the filtered-colimit closure one may take T finite. Inducting on the simplices of T with the pushout closure reduces to `T = Δ[n]`, where `X ⟶ S` is a coCartesian fibration by HTT 2.4.7.5, hence smooth by Prop. 4.1.2.15.
*Needs:* §5.2.1, §5.2.2 (Prop. 4.1.2.15); Tau Ceti `SSet.CartesianFibration`; Part CartesianFibrations §4.2.1 (HTT, Def. 2.4.7.2), §4.2.2 (HTT, Lemma 2.4.7.5).

### 5.3 Covariant equivalences fiber by fiber

**5.3.1.** Prove that for `f : X ⟶ Y` over an ∞-category C with both structure maps smooth, f is a covariant equivalence exactly when every map of fibers `X_c ⟶ Y_c` is a weak homotopy equivalence (HTT, Prop. 4.1.2.18, p. 253). A route in two steps.

1. **Base change to a slice** (HTT, Lemma 4.1.2.17, p. 252). For an object c and a covariant equivalence `X ⟶ Y` in `SSet/C`, the map `X ×_C C_{/c} ⟶ Y ×_C C_{/c}` is a covariant equivalence over `C_{/c}`: `C_{/c} ⟶ C` is a right fibration, so its opposite is a left fibration and smooth (§5.2); use the dual of condition (1) of §5.1 for left anodyne maps, after factoring into a left anodyne map followed by a left fibration, and the homotopy product in the covariant model structure.
   *Needs:* §2.2.1, §4.6.1, §5.1.1, §5.2.2; Tau Ceti `SSet.LeftFibration`; Part InfinityCategoryFoundations §6.3.1 (HTT, discussion after Prop. 2.1.4.8) and §7.6.1 (HTT, Cor. 2.2.3.12); Part CartesianFibrations §2.2.1 (HTT, Prop. 2.4.2.4); ModelCategoryTheory, Part ModelCategories §1.4.1 (HTT, Prop. A.1.2.5 (1)) and §3.5 (HTT, homotopy pushout squares, §A.2.4, p. 833).
2. **Fibers** (HTT, Prop. 4.1.2.18 and its proof, p. 253). By step 1, reduce over `C_{/c}`. There `{id_c} ⊆ C_{/c}` is right anodyne, so smoothness makes the fiber inclusions right anodyne, hence weak homotopy equivalences (§2.3.1). Then the fiberwise criterion for left fibrations (HTT 2.2.3.13, dual) applies to fibrant replacements.
   *Needs:* step 1, §2.3.1, §5.2.1; Tau Ceti `SSet.LeftFibration`; Part InfinityCategoryFoundations §7.6.1 (HTT, Cor. 2.2.3.13); ModelCategoryTheory, Part ModelCategories §1.4.1 (HTT, Prop. A.1.2.5 (1)); ModelCategoryTheory, Part KanQuillen §3.2.1 (HTT, §A.2.7).

### 5.4 Quillen's Theorem A for ∞-categories

**5.4.1.** Prove that a Cartesian fibration `U ⟶ S` all of whose fibers are weakly contractible is cofinal (HTT, Lemma 4.1.3.2, p. 254). A route: fix a right fibration `N ⟶ S` and prove more generally that for every `T ⟶ S` restriction `Map_S(T, N) ⟶ Map_S(T ×_S U, N)` is a homotopy equivalence. Induct over the nondegenerate simplices of T: attaching a simplex makes both sides homotopy pullbacks, so one reduces to `T = Δ[n]`. There choose a mapping simplex with a quasi-equivalence `M(φ) ⟶ U ×_S Δ[n]` over Δ[n] (HTT 3.2.2.7); `N ×_S Δ[n] ⟶ Δ[n]` is a right fibration over an ∞-category, hence a categorical fibration (Part CartesianFibrations §7.4), so by the invariance of sections over `X = Δ[n]` (Part CartesianFibrations §7.5) restriction along the quasi-equivalence, a categorical equivalence, changes the section spaces only up to homotopy equivalence. Then compare sections over `Δ[n−1]` and over `Δ[n]` with sections over the weakly contractible last fiber, by induction on n.
*Needs:* §2.1.1 (HTT, Def. 4.1.1.1); Tau Ceti `SSet.CartesianFibration`, `SSet.RightFibration`, `SSet.ihomOver`, `SSet.IsWeaklyContractible`; Part InfinityCategoryFoundations §9.4.1 (HTT, categorical fibrations, §2.2.5); Part CartesianFibrations §2.2.1 (HTT, Prop. 2.4.2.4), §6.3.2 (HTT, Prop. 3.2.2.7), §7.4.1 (HTT, Prop. 3.3.1.7) and §7.5.1 (invariance of sections under categorical equivalence); ModelCategoryTheory, Part ModelCategories §3.5 (HTT, homotopy pushout squares, §A.2.4, p. 833); ModelCategoryTheory, Part KanQuillen §3.2.1 (HTT, §A.2.7).

**5.4.2.** Prove Theorem A: for a map `f : C ⟶ D` of simplicial sets with D an ∞-category, f is cofinal exactly when `C ×_D D_{d/}` is weakly contractible for every object d of D (HTT, Thm. 4.1.3.1, p. 254; Kerodon, Thm. 7.2.3.1). A route, following Joyal and HTT:

1. Factor f as a categorical equivalence `f' : C ⟶ C'` followed by an inner fibration `f'' : C' ⟶ D`; C' is an ∞-category because D is. Then f' is cofinal by §2.6, so f is cofinal exactly when f'' is (§2.3). The fiber products do not change up to weak homotopy equivalence: `C ×_D D_{d/} ⟶ C' ×_D D_{d/}` is the base change of f' along the left fibration `C' ×_D D_{d/} ⟶ C'`, a coCartesian fibration over the ∞-category C', so it is a categorical equivalence by base change over an ∞-category (Part CartesianFibrations §7.2, HTT 3.3.1.3). So assume C is an ∞-category. Alternatively, choose f' inner anodyne: then f' is right anodyne, hence cofinal (§2.3), and `C ×_D D_{d/} ⟶ C' ×_D D_{d/}` is the pullback of a right anodyne map along the smooth left fibration `D_{d/} ⟶ D`, hence right anodyne (§5.1, §5.2), with no use of §2.6 or of Part CartesianFibrations §7.2.
2. If f is cofinal, `C ×_D D_{d/} ⟶ D_{d/}` is cofinal, as a pullback along the smooth left fibration `D_{d/} ⟶ D` (§5.1, §5.2). So it is a weak homotopy equivalence (§2.3), and `D_{d/}` is weakly contractible because it has an initial object.
3. Conversely, factor f through `M = Fun(Δ[1], D) ×_{Fun({1}, D)} C`, by the section `C ⟶ M` and evaluation at 0. The section is right anodyne by HTT 2.1.2.11, since a homotopy over C joins the identity of M to the retraction onto C, so it is cofinal (§2.3). Evaluation is a Cartesian fibration (HTT 2.4.7.12) whose fiber over d is the fat form `C ×_D D^{d/}`. It is weakly equivalent to `C ×_D D_{d/}`: `D_{d/} ⟶ D^{d/}` is a categorical equivalence (§1.2, HTT 4.2.1.5) and a map of left fibrations over D, hence an equivalence on every fiber (§1.3, HTT 4.2.1.7); its base change along f is still an equivalence on every fiber, hence a categorical equivalence (Part CartesianFibrations §7.3, first statement). So evaluation is cofinal by §5.4.1. Conclude by composition (§2.3).

The `Suggested.lean` declaration `isCofinal_iff_isWeaklyContractible` states the theorem.

**Checks.**

- For `f : {1} ⊆ Δ[1]`, the fiber products over 0 and 1 are both `Δ[0]`, so f is cofinal. For `{0} ⊆ Δ[1]` the fiber product over 1 is empty, so it is not: the theorem agrees with the Conventions.
- For D = Δ[0], the condition says that C is weakly contractible, so a map to the point is cofinal exactly when its source is weakly contractible. `∂Δ[2] ⟶ Δ[0]` is not cofinal.
- For the nerve of a functor `F : A ⥤ B` of ordinary categories, `C ×_D D_{d/}` is the nerve of the comma category `d/F`, so the theorem recovers Quillen's Theorem A: N(F) is cofinal exactly when the nerve of every comma category `d/F` is weakly contractible. It implies Mathlib's `Functor.Final` for F, whose criterion asks only that each `d/F` be connected.

*Needs:* §1.2.1, §1.3.1, §2.3.1, §2.6.1, §5.1.1, §5.1.2, §5.2.2, §5.4.1; Mathlib `SSet.Quasicategory`, instance `Quasicategory ((ihom K).obj C)`; Tau Ceti `SSet.coslice`, `SSet.IsWeaklyContractible`, `SSet.CartesianFibration`; Part InfinityCategoryFoundations §3.3.3 (HTT, Prop. 2.1.2.11) and §6.1.1 (HTT, Lemma 2.2.5.2); Part InfinityCategoryFoundations §9.5.1 (HTT, Thm. 2.2.5.1), Part CartesianFibrations §4.4.2 (HTT, Cor. 2.4.7.12), §7.2.1 (HTT, Prop. 3.3.1.3, over an ∞-category) and §7.3.1 (first statement, HTT, Prop. 3.3.1.5, (2) ⇒ (1)); ModelCategoryTheory, Part ModelCategories §1.4.1 (HTT, Prop. A.1.2.5 (1)).

**5.4.3.** Prove that for a coCartesian fibration `p : E ⟶ B` over an ∞-category B and an object b of B, the inclusion of the fiber `E_b ⟶ E ×_B B_{/b}`, over the final object `id_b` of `B_{/b}`, is cofinal; in particular, if b is a final object of B, the fiber inclusion `E_b ⊆ E` is cofinal. This statement has no locator of its own in HTT. It is the dual of the argument inside the proof of HTT, Lemma 5.3.2.6 (p. 410), with HTT, Prop. 4.1.2.15 (p. 252) as the input. A route: the inclusion of a final object `{c} ⊆ D` is cofinal by Theorem A, since `{c} ×_D D_{d/}` is a mapping space into c, hence contractible, for every d. The base change `E ×_B B_{/b} ⟶ B_{/b}` is a coCartesian fibration, hence smooth (§5.2). The pullback of the cofinal inclusion `{id_b} ⊆ B_{/b}` along it is the fiber inclusion, which is therefore cofinal (§5.1, Rem. 4.1.2.10). For b final, apply the same argument to `{b} ⊆ B` directly.
*Needs:* §5.4.2 (Theorem A), §1.3.1 (HTT, Cor. 4.2.1.8, left and right mapping spaces agree), §5.1.2, §5.2.2 (HTT, Prop. 4.1.2.15); Tau Ceti `SSet.CartesianFibration`, `SSet.slice`, `SSet.IsTerminalVertex`; Part InfinityCategoryFoundations §1.2 (HTT, §1.2.12); Part InfinityCategoryFoundations §5.2.1 (mapping spaces, HTT §1.2.2) and §5.5.2 (HTT, Prop. 1.2.12.4).

**Checks** (the fiber over a final object).

- For `p = 𝟙_B`, the statement says that `{b} ⊆ B` is cofinal for b final, the Example after this layer. For B = Δ[1] and b = 1 this is the cofinal inclusion `{1} ⊆ Δ[1]` of §2.1.
- The hypothesis that p is coCartesian is needed. The inclusion `{0} ⊆ Δ[1]` is a Cartesian fibration over B = Δ[1], and its fiber over the final object 1 is empty. The inclusion `∅ ⊆ {0}` is not cofinal, since cofinal maps are weak homotopy equivalences (§2.3).
- The hypothesis that b is final is needed for the second assertion. For the identity of Δ[1] and b = 0, `E_0 ⊆ E` is `{0} ⊆ Δ[1]`, which is not cofinal, while `E_0 ⟶ E ×_B B_{/0}` is an isomorphism, as the first assertion predicts.

### 5.5 Semisimplicial indexing is cofinal

**5.5.1.** Prove that the inclusion `N(Δ_sᵒᵖ) ⊆ N(Δᵒᵖ)` is cofinal, where `Δ_s ⊆ Δ` is the wide subcategory of injective order-preserving maps, Mathlib's `SemiSimplexCategory` (HTT, Lemma 6.5.3.7, p. 694). A route: by Theorem A it suffices that each category `Δ_s ×_Δ Δ_{/[n]}` has weakly contractible nerve, since its opposite is the fiber product of Theorem A over `[n]`. The constant functor at `[0] ⊆ [n]` and the functor adjoining an initial vertex give natural transformations joining the identity to a constant functor. The `Suggested.lean` declaration `isCofinal_nerveMap_toSimplexCategory_op` states this.
*Needs:* §5.4.2; Mathlib `SemiSimplexCategory`, `CategoryTheory.nerveMap`; Tau Ceti `SSet.IsWeaklyContractible`; §2.1.1 (HTT, Def. 4.1.1.1); Part InfinityCategoryFoundations §1.2 (HTT, Notation 1.2.7.2).

### Examples

- A right adjoint `G : B ⥤ A` between ordinary categories is final: each comma category `a/G` has an initial object, given by the unit. By Theorem A its nerve is cofinal.
- The inclusion of an object `{d} ⊆ D` is cofinal exactly when d is final: by Theorem A the fiber product over d′ is the left mapping space from d′ to d, which must be contractible for every d′.
- A coCartesian fibration with weakly contractible fibers over a weakly contractible base has a weakly contractible total space, by §5.4.1 (HTT, Lemma 4.1.3.2) applied to `pᵒᵖ`, and §2.3.

### Dependencies

Layers 1, 2 and 4; Part CartesianFibrations (the mapping simplex, bifibrations, arrow ∞-categories, base change and the fiberwise criterion, categorical fibrations over ∞-categories, invariance of sections); Part InfinityCategoryFoundations (the Joyal model structure, the covariant and contravariant model structures, pushout-products with horns); ModelCategoryTheory, Parts ModelCategories and KanQuillen; Mathlib `SemiSimplexCategory`.

## Layer 6: Decomposing diagrams, nerve replacements and finite colimits

### 6.1 The decomposition simplicial set

**6.1.1.** Define, for a simplicial set K, an ordinary category I and a functor `F : I ⥤ SSet/K` with `K_I = F(I)` and `π_I : K_I ⟶ K`, the simplicial set `K_F` whose n-simplices are: a splitting `[n] = {0, …, i} ∪ {i+1, …, n}`, a simplex `e₋ : Δ^{0,…,i} ⟶ K`, a chain `I(i+1) ⟶ ⋯ ⟶ I(n)` in I, and lifts `e_j : Δ^{0,…,i} ⟶ K_{I(j)}` of `e₋` for `j > i`, compatible with the maps `K_{I(j)} ⟶ K_{I(k)}` (HTT, Notation 4.2.3.1, p. 266).

- `K_F` maps to Δ[1] with fiber K over 0 and `N(I)` over 1 (HTT, Rem. 4.2.3.2, p. 267).
- When `i < n`, the data are determined by an arbitrary `e_{i+1}`, and each `π_I` extends to `π'_I : K_I^▷ ⟶ K_F` with cone point the vertex I of `N(I)` (HTT, Rem. 4.2.3.2, p. 267).

**Checks.**

- For I the one-object category with `K_I = K` and `π = 𝟙`, `K_F = K^▷`.
- For K = ∅, every `K_I` is empty and `K_F = N(I)`.
- For K = Δ[0], I the one-object category and `K_I = ∅`, a simplex with nonempty last part needs a lift into ∅, so its first part is empty and `K_F` is two points with no edge. A definition omitting the lifts `e_j` would give `K ⋆ N(I) = Δ[1]`.
- For I empty, `K_F = K`.

*Needs:* Tau Ceti `SSet.join`; Mathlib `CategoryTheory.nerve`.

### 6.2 Right anodyne joins and assembling colimits over a decomposition

**6.2.1.** Prove that for monomorphisms `A₀ ⊆ A` and `B₀ ⊆ B` with `B₀ ⊆ B` a weak homotopy equivalence, `(A₀ ⋆ B) ⊔_{A₀ ⋆ B₀} (A ⋆ B₀) ⊆ A ⋆ B` is right anodyne (HTT, Lemma 4.2.3.5, p. 269). A route: by weak saturation reduce to a boundary inclusion and a horn inclusion, since monic weak homotopy equivalences are anodyne, and check joins of horns with simplices. In particular, for B weakly contractible, `A₀ ⋆ B ⊆ A ⋆ B` is right anodyne for every monomorphism `A₀ ⊆ A` (HTT, Lemma 4.2.3.6, p. 269): take `B₀` a vertex of B, and use that `A₀ ⋆ {b} ⊆ A ⋆ {b}` is right anodyne.
*Needs:* Tau Ceti `SSet.join`, `SSet.rightAnodyneExtensions`; Part InfinityCategoryFoundations §4.1.1 (HTT, Lemma 2.1.2.3); ModelCategoryTheory, Part ModelCategories §1.3.1 (HTT, Def. A.1.2.2); ModelCategoryTheory, Part KanQuillen §3.2.1 (HTT, §A.2.7).

**6.2.2.** Prove that for `p : K ⟶ C` a diagram in an ∞-category such that each `p ∘ π_I` has a colimit `q_I : K_I^▷ ⟶ C`, there is `q : K_F ⟶ C` restricting to p on K and to `q_I` along each `π'_I`, and that for every such q the map `C_{q/} ⟶ C_{p/}` is a trivial fibration (HTT, Prop. 4.2.3.4, p. 267). A route: extend p over the simplices of `K_F` not in K, in order of dimension; a simplex with last part a chain `I(i+1) ⟶ ⋯` is a join `K_{I(i+1)} ⋆ σ`, and the colimit property of `q_{I(i+1)}` gives the extension. Each such extension is a simplex of the coslice `C_{p∘π_I/}` whose initial vertex goes to the initial object `q_I`, and each step `C_{q_{α+1}/} ⟶ C_{q_α/}` is a pullback, in that coslice, of a map `C_{σ/} ⟶ C_{∂σ/}` for a simplex σ with initial first vertex. Such a map is a trivial fibration (HTT, Lemma 4.2.3.3, p. 267): its lifting problems against `∂Δ[m] ⊆ Δ[m]` are extensions of maps `∂Δ[n+m+1] ⟶ C` whose initial vertex goes to the initial object `σ(0)`, and these exist because an initial object is strongly initial (HTT, Cor. 1.2.12.5, dual form). A transfinite composite of trivial fibrations is one.
*Needs:* §6.1.1; Mathlib `SSet.Quasicategory`; Tau Ceti `SSet.join`, `SSet.coslice`, `SSet.coslice.IsColimit`; Part InfinityCategoryFoundations §1.2 (HTT, §1.2.12); Tau Ceti `SSet.slice.homEquiv`, `SSet.coslice.homEquiv` (HTT, Prop. 1.2.9.2) and §8.2.1 (HTT, Cor. 1.2.12.5).

### 6.3 Right anodyne nerve inclusions and κ-small colimits

**6.3.1.** Define, for a simplex σ of K, the category `I_σ` of pairs `(I, σ')` with `σ'` a simplex of `K_I` over σ, morphisms being maps `α : I ⟶ I'` with `F(α)(σ') = σ''`, and its full subcategory `I⁰_σ` on the pairs with `σ'` degenerate (HTT, Notation 4.2.3.7, p. 270). A map of simplices induces a functor between these categories.

**Checks.**

- For F constant at `𝟙_K` on a category I, `I_σ` is I for every σ.
- For σ degenerate and every `π_I` an inclusion, `I⁰_σ = I_σ`, since a simplex over a degenerate one in a simplicial subset is degenerate.
- For σ nondegenerate, `I⁰_σ = ∅`, since a degenerate `σ'` would map to a degenerate simplex (HTT, Notation 4.2.3.7, p. 270). A definition of `I⁰_σ` by nondegenerate `σ'` would be all of `I_σ` here.

*Needs:* Part InfinityCategoryFoundations §1.2.1 (HTT, full subcategories, §1.2.11).

**6.3.2.** Prove that if `N(I_σ)` is weakly contractible for every nondegenerate σ, and `N(I⁰_σ) ⊆ N(I_σ)` is a weak homotopy equivalence for every degenerate σ, then `N(I) ⊆ K_F` is right anodyne (HTT, Prop. 4.2.3.8, p. 270). A route: filter `K_F` by the simplices over each simplex σ of K; each step is a pushout of a map as in §6.2 for `σ ⋆ N(I_σ)`. When I is a partially ordered set and F takes values in simplicial subsets of K, `I⁰_σ = I_σ` for degenerate σ and `I_σ = {I : σ ∈ K_I}`, so the hypotheses say that each `I_σ` has weakly contractible nerve; they hold whenever I is directed and K is the union of the `K_I` (HTT, Rem. 4.2.3.9, p. 270). Consequently, under these hypotheses and for p and q as in §6.2, the maps `C_{p/} ⟵ C_{q/} ⟶ C_{q|N(I)/}` are trivial fibrations, so colimits of p are colimits of `q|N(I)` (HTT, Cor. 4.2.3.10, p. 271): the first map is §6.2, and the right anodyne `N(I) ⊆ K_F` is cofinal (§2.3, §2.5).
*Needs:* §2.3.1, §2.5.2, §6.1.1, §6.2.1 (Lemmas 4.2.3.5 and 4.2.3.6), §6.2.2 (Prop. 4.2.3.4), §6.3.1; Mathlib `SSet.Quasicategory`; Tau Ceti `SSet.join`, `SSet.rightAnodyneExtensions`, `SSet.coslice.IsColimit`; ModelCategoryTheory, Part KanQuillen §3.2.1 (HTT, §A.2.7).

**6.3.3.** Prove that for regular cardinals `τ ≪ κ`, an ∞-category admits κ-small colimits exactly when it admits τ-small colimits and colimits indexed by nerves of κ-small τ-filtered partially ordered sets (HTT, Cor. 4.2.3.11, p. 271). A route: a κ-small K is the union of its τ-small simplicial subsets, a κ-small τ-filtered poset, and the poset form of §6.3.2 applies. Here `τ ≪ κ` means `κ₀^{τ₀} < κ` for all `τ₀ < τ` and `κ₀ < κ` (HTT, Def. A.2.6.3).
*Needs:* §6.2.2, §6.3.1, §6.3.2; Tau Ceti `SSet.coslice.IsColimit`; ModelCategoryTheory, Part ModelCategories §5.2.1 (HTT, Def. A.2.6.3).

### 6.4 Cofinal maps from nerves of categories and of posets

**6.4.1.** Prove that every simplicial set K receives a cofinal map `N(I) ⟶ K` from the nerve of its category of simplices I, with `K_I = Δ[n]` for `I = (Δ[n] ⟶ K)` (HTT, Prop. 4.2.3.14, p. 272). The `Suggested.lean` declaration `exists_isCofinal_nerve_elements_op` states the existence of a cofinal map, with I the opposite of Mathlib's category of elements `CategoryTheory.Functor.Elements` of K. A route: there is a retraction `r : K_F ⟶ K` fixing K, sending a simplex with chain `Δ[m_{i+1}] ⟶ ⋯ ⟶ Δ[m_n]` to the simplex spanned by the image of its first part and the last vertices of the `Δ[m_j]` (HTT, Lemma 4.2.3.13, p. 272). Compose `N(I) ⊆ K_F` with r. The inclusion is right anodyne by §6.3: each `I_σ` has an initial object, and for degenerate σ the subcategory of `I⁰_σ` on surjective factorizations is a deformation retract with a final object. The retraction is cofinal by the colimit criterion (§4.3), and cofinal maps compose (§2.3).
*Needs:* §2.3.1, §4.3.1, §6.1.1, §6.2.2, §6.3.1, §6.3.2; §2.1.1 (HTT, Def. 4.1.1.1); Part InfinityCategoryFoundations §1.2.1 (full subcategories, HTT §1.2.11); Tau Ceti `SSet.RightFibration`; ModelCategoryTheory, Part KanQuillen §3.2.1 (HTT, §A.2.7).

**6.4.2.** Prove that every simplicial set K receives a cofinal map from the nerve of a partially ordered set, functorially in K (HTT, Variant 4.2.3.15, p. 273), as a composite of five cofinal maps, each functorial in K. The `Suggested.lean` declaration `exists_isCofinal_nerve_partialOrder` states the existence assertion.

1. `N(I₁) ⟶ K`, with `I₁` the category of simplices of K (Prop. 4.2.3.14).
2. `N(I₂)ᵒᵖ ⟶ N(I₁)`, with `I₂` the category of simplices of `N(I₁)`, induced by the functor `I₂ᵒᵖ ⥤ I₁` sending a chain `C₀ ⟶ ⋯ ⟶ Cₙ` to `C₀` (HTT, Variant 4.2.3.15, step (2), p. 273). A route: by Theorem A (§5.4) each comma category must have weakly contractible nerve; it is the opposite of the category of simplices of `N(I₁)_{C/}`, weakly equivalent to `N(I₁)_{C/}` by Prop. 4.2.3.14 and §2.3, which has an initial object.
   *Needs:* §2.3.1, §5.4.2, §6.4.1 (Prop. 4.2.3.14); ModelCategoryTheory, Part KanQuillen §3.2.1 (HTT, §A.2.7).
3. `N(I₃)ᵒᵖ ⊆ N(I₂)ᵒᵖ`, with `I₃ ⊆ I₂` the injective maps of simplices (HTT, Variant 4.2.3.15, step (3), p. 273). A route: both are left fibrations over `N(Δ_s)ᵒᵖ ⊆ N(Δ)ᵒᵖ` and the square is a pullback; left fibrations are smooth (§5.2.2) and the base inclusion is cofinal (§5.5.1), so cofinal base change (§5.1.2) applies.
   *Needs:* §5.1.2, §5.2.2, §5.5.1; Part CartesianFibrations §2.2.1 (HTT, Prop. 2.4.2.4).
4. `N(I₄) ⟶ N(I₃)ᵒᵖ`, with `I₄` the category of simplices of `L = N(I₃)ᵒᵖ` (Prop. 4.2.3.14).
5. `N(I₅) ⊆ N(I₄)`, with `I₅` the full subcategory on the nondegenerate simplices of L, which is equivalent to a partially ordered set (HTT, Variant 4.2.3.15, step (5), p. 274). A route: non-identity morphisms of `I₃` are closed under composition, so faces of nondegenerate simplices of L are nondegenerate and `I₅ ⊆ I₄` has a left adjoint; the inclusion of a right adjoint is final by Theorem A (§5.4.2). Simplices of L are determined by their vertices, so `I₅` is equivalent to a poset.
   *Needs:* §5.4.2.

*Needs (for the variant):* §2.3, the five steps above.

**6.4.3.** Prove that if K is finite, the poset may be taken finite, at the cost of functoriality (HTT, Variant 4.2.3.16, p. 274). A route: if every nondegenerate simplex of K is a monomorphism `Δ[n] ⟶ K`, the nondegenerate simplices include into the category of simplices with a left adjoint, so cofinally by Theorem A, and Prop. 4.2.3.14 gives a cofinal map from the finite poset of simplicial subsets of K isomorphic to a simplex. A general finite K receives a cofinal map from a finite simplicial set with that property (§4.6).
*Needs:* §2.3.1, §4.6, §5.4.2, Prop. 4.2.3.14; §2.1.1 (HTT, Def. 4.1.1.1); Part InfinityCategoryFoundations §1.2.1 (full subcategories, HTT §1.2.11).

### 6.5 Reduction to pushouts, coproducts and coequalizers

**6.5.1.** Prove that in a diagram `Δ[2] × Δ[1] ⟶ C` whose left square is a pushout, the right square is a pushout exactly when the outer one is (HTT, Lemma 4.4.2.1, p. 313). Pushout squares are the colimit diagrams through `(Λ[2,0])^▷ ≅ Δ[1] × Δ[1]`, pullback squares the limit diagrams through `(Λ[2,2])^◁`. A route: the restrictions of coslices along the anodyne inclusions relating the three squares are trivial fibrations.
*Needs:* Tau Ceti `SSet.coslice.IsColimit`; Part InfinityCategoryFoundations §4.3.2 (HTT, Prop. 2.1.2.5); Part InfinityCategoryFoundations §1.2.1 (HTT, full subcategories, §1.2.11).

**6.5.2.** Prove that for `K = K' ⊔_{L'} L` with `L' ⟶ L` a monomorphism and `p|K'`, `p|L'`, `p|L` having colimits X, Y, Z, the colimits of p are the pushouts `X ⊔_Y Z` (HTT, Prop. 4.4.2.2, p. 314). A route: §6.3 for the three-element poset covering K.
*Needs:* §6.2.2, §6.3.2; Tau Ceti `SSet.coslice.IsColimit`.

**6.5.3.** Prove that an ∞-category admits finite colimits exactly when it has pushouts and an initial object, and a functor out of it preserves them exactly when it preserves initial objects and pushouts (HTT, Cor. 4.4.2.4, 4.4.2.5, p. 314). A route: induct on the nondegenerate simplices of K, using `K = K' ⊔_{∂Δ[n]} Δ[n]` and that `p|Δ[n]` has colimit its value at n, since `{n} ⊆ Δ[n]` is cofinal (§2.5).
*Needs:* §2.5.2, §6.5.2; Part InfinityCategoryFoundations §1.2 (HTT, §1.2.12); Part InfinityCategoryFoundations §5.5.5 (HTT, Rem. 1.2.13.7).

**6.5.4.** Prove that an ∞-category with pushouts and κ-small coproducts admits κ-small colimits (HTT, Prop. 4.4.2.6, p. 314), and that for κ regular and C with κ-small colimits, `f : C ⟶ D` preserves κ-small colimits exactly when it preserves pushouts and κ-small coproducts (HTT, Prop. 4.4.2.7, p. 315). A route: present K by its skeleta, a directed union to which §6.3 applies; each skeleton is a pushout of coproducts of boundaries and simplices, and the sequence `N(ℤ_{≥0})` is replaced by a categorically equivalent L whose colimit is a pushout of coproducts (§4.4, §2.5).
*Needs:* §2.5.2, §4.4.1, §6.3.2, §6.5.1–6.5.3; Part InfinityCategoryFoundations §5.5.5 (HTT, Rem. 1.2.13.7); Tau Ceti `SSet.coslice.IsColimit`.

**6.5.5.** Prove that for disjoint embeddings `i₀, i₁ : A ⟶ K`, `K'` the simplicial set identifying them and `p : K' ⟶ C` such that `q ∘ i₀` and `q = p ∘ (K ⟶ K')` have colimits x and y, the colimits of p are the coequalizers of the induced pair `x ⇉ y` (HTT, Prop. 4.4.3.1, p. 317). A route: `K'` is a pushout of K along `A ⊔ A ⟶ A`.
*Needs:* §6.3.2, §6.5.1–6.5.4; Tau Ceti `SSet.coslice.IsColimit`.

**6.5.6.** Prove that for κ regular, an ∞-category has κ-small colimits exactly when it has coequalizers and κ-small coproducts (HTT, Prop. 4.4.3.2, p. 317), and that a full subcategory of an ∞-category with κ-small colimits is closed under them exactly when it is closed under coequalizers and κ-small coproducts (HTT, Prop. 4.4.3.3, p. 317). A route: a pushout of `X ⟵ Y ⟶ Z` is the coequalizer of `Y ⇉ X ⊔ Z` by §6.5.5, `p|Δ^{0,1}` has a colimit since `Δ^{0,1}` has a final object (§2.5), and colimits in the subcategory are computed in the ambient one.
*Needs:* §2.5.2, §6.5.1–6.5.5; Part InfinityCategoryFoundations §1.1 (HTT, sizes, §1.2.15) and §1.2 (HTT, §1.2.12; full subcategories, §1.2.11).

### Examples

- For the spine `Δ^{0,1} ∪ Δ^{1,2} ⊆ Δ[2]`, which is `Δ[1] ⊔_{Δ[0]} Δ[1]`, §6.5 computes the colimit of a diagram `x₀ ⟶ x₁ ⟶ x₂` as the pushout `x₁ ⊔_{x₁} x₂ ≃ x₂`, its value at the last vertex.
- The coproduct of an empty family is an initial object, so §6.5 with κ = ℵ₀ says finite colimits are generated by pushouts and the empty colimit.
- For K = Δ[0] the category of simplices is Δ, and Proposition 4.2.3.14 says that `N(Δ) ⟶ Δ[0]` is cofinal. So `N(Δ)` is weakly contractible (§2.3), as its terminal object `[0]` also shows.

### Dependencies

Layers 2, 4 and 5; Part InfinityCategoryFoundations (strongly initial objects, slices); Part CartesianFibrations (right fibrations are Cartesian); ModelCategoryTheory, Parts ModelCategories (weak saturation, `τ ≪ κ`) and KanQuillen; Tau Ceti joins and coslices.

## Layer 7: Relative colimits and Kan extensions

### 7.1 Relative colimits and left Kan extensions

**7.1.1.** Define, for an inner fibration `f : C ⟶ D` and `p̄ : K^▷ ⟶ C` with `p = p̄|K`, that p̄ is an f-colimit of p when
`C_{p̄/} ⟶ C_{p/} ×_{D_{fp/}} D_{fp̄/}` is a trivial fibration (HTT, Def. 4.3.1.1, p. 279).

- **The criterion** (HTT, Rem. 4.3.1.2, p. 279). For an inner fibration f of ∞-categories, a diagram p̄ is an f-colimit exactly when that map, `C_{p̄/} ⟶ C_{p/} ×_{D_{fp/}} D_{fp̄/}`, is a categorical equivalence, a priori weaker than the trivial fibration that the definition asks for; and the fiber product there is a homotopy fiber product for the Joyal model structure. A route: the map is a left fibration (HTT 2.1.2.1), hence a categorical fibration (Part CartesianFibrations §7.4, its target being an ∞-category; HTT cites 3.3.1.7), and a categorical fibration that is a categorical equivalence is a trivial fibration; for the homotopy fiber product, `D_{fp̄/} ⟶ D_{fp/}` is a left fibration, so base change along it preserves categorical equivalences (Part CartesianFibrations §7.2 over the ∞-category `D_{fp/}`, HTT 3.3.1.3), and the fiber product is a homotopy fiber product because the left fibration is a categorical fibration (Part CartesianFibrations §7.4).

**Checks.**
- For D = Δ[0] this is the condition that p̄ be a colimit diagram (Part InfinityCategoryFoundations §1.2).
- For f the identity of C every p̄ is an f-colimit.
- For K = ∅ and `f : Δ[1] ⟶ Δ[0]`, the vertex 0 is an f-colimit and 1 is not.

*Needs:* Part InfinityCategoryFoundations §1.2.2 (cones); Tau Ceti `SSet.slice`, `SSet.coslice`; Mathlib `SSet.InnerFibration`,
`SSet.rlp_monomorphisms`; for the criterion, Tau Ceti `SSet.LeftFibration`; Part InfinityCategoryFoundations §4.2.1 (HTT, Prop. 2.1.2.1); Part InfinityCategoryFoundations §9.4.1 and §9.5.1 (HTT, Thm. 2.2.5.1; §2.2.5), Part CartesianFibrations §2.2.1 (HTT, Prop. 2.4.2.4), §7.2.1 (HTT, Prop. 3.3.1.3, over an ∞-category) and §7.4.1 (HTT, Prop. 3.3.1.7); ModelCategoryTheory, Part ModelCategories §3.5 (homotopy pushout squares).

**7.1.2.** Define, for a full subcategory `C⁰ ⊆ C` of an ∞-category, an inner fibration `p : D ⟶ D′` and `F : C ⟶ D`, that
F is a p-left Kan extension of `F|C⁰` at an object c when the cone `(C⁰_{/c})^▷ ⟶ (C_{/c})^▷ ⟶ C ⟶ D`, with
`C⁰_{/c} = C⁰ ×_C C_{/c}` and its tautological cocone with cone point c, is a p-colimit; and a p-left Kan
extension when this holds at every object; for `D′ = Δ[0]`, a left Kan extension (HTT, Def. 4.3.2.2, p. 289).
Dually, right Kan extensions. Later uses take p a categorical fibration. The `Suggested.lean` declarations
cover the case `D′ = Δ[0]`: `IsLeftKanExtensionAt` and `IsLeftKanExtension`, for a full
subcomplex of an ∞-category, with `C⁰_{/c}` and its tautological cocone as `subcomplexOver` and
`subcomplexOverCocone`.

**Checks.**
- For `C⁰ = ∅`, F is a left Kan extension exactly when every value is initial.
- For c in `C⁰`, `C⁰_{/c}` has the final object `id_c`, so F is a left Kan extension at c; in particular every F
  is a left Kan extension of itself when `C⁰ = C`. A definition using `C_{/c}` in place of `C⁰_{/c}` would be
  satisfied by every functor at every object.
- For `C = Δ[1]` and `C⁰ = {0}`, F is a left Kan extension of `F(0)` exactly when `F(0) ⟶ F(1)` is an
  equivalence.
- For nerves of ordinary categories, the condition is Mathlib's `CategoryTheory.Functor.LeftExtension.IsPointwiseLeftKanExtension` for the extension with identity unit, which implies the weaker `CategoryTheory.Functor.IsLeftKanExtension`.

*Needs:* §7.1.1 (relative colimits); Tau Ceti `SSet.fullEnhancedSubcategory`, `SSet.slice`; Part InfinityCategoryFoundations §1.2.

**7.1.3.** Define, for `δ : K ⟶ K′` and `f : K ⟶ D` with D an ∞-category, a left extension of f along δ as a map
`f′ : K′ ⟶ D` with a morphism `f ⟶ f′ ∘ δ` in `Fun(K, D)`, equivalently a map from the mapping cylinder
`M^op(δ) = (K × Δ[1]) ⊔_{K × {1}} K′` to D restricting to f (HTT, Def. 4.3.3.1, p. 303).

**Checks.**
- For δ the identity, a left extension is a morphism `f ⟶ f′` in `Fun(K, D)`.
- For K = ∅ it is any f′.
- For K = K′ = Δ[0], `M^op(δ)` is Δ[1] and a left extension is an edge of D starting at f.

*Needs:* Part InfinityCategoryFoundations §1.2 (functor ∞-categories); Mathlib pushouts in `SSet`.

**7.1.4.** Define a left extension of f along δ, viewed as a map `F : M^op(δ) ⟶ D` restricting to f, to be a left Kan
extension when F factors as a categorical equivalence over Δ[1] from `M^op(δ)` to an ∞-category 𝒦, followed by
a map `F′ : 𝒦 ⟶ D` that is a left Kan extension, in the sense of §7.1.2, of its restriction to the full subcategory
`𝒦 ×_{Δ[1]} {0}` (HTT, Def. 4.3.3.2, p. 303). Later Parts cite this form.

Define also, for K′ an ∞-category, the pointwise form: (f′, α) is a pointwise left Kan extension when, for every
vertex c of K′, with `K_{/c} = K ×_{K′} K′_{/c}` and `π : K_{/c} → K`, the composite of `α ∘ π` with the
transformation `f′ ∘ δ ∘ π ⟶ const_{f′(c)}` induced by the tautological cone `(K′_{/c})^▷ → K′` exhibits f′(c)
as a colimit of `f ∘ π`: composition with it induces an isomorphism
`Map_D(f′(c), d) ⟶ Map_{Fun(K_{/c}, D)}(f ∘ π, const_d)` in H for every d (Kerodon, Variant 7.3.1.5, tag
02YC). It is stated beside HTT's form because it names the value at each object as an explicit colimit, with no
auxiliary ∞-category 𝒦. The agreement of the two forms, for K′ an ∞-category, is a theorem of §7.6.

**Checks.**
- For δ the inclusion of a full subcategory C⁰ ⊆ C and α the identity, the pointwise form is literally the
  definition of §7.1.2 at every object, since `K_{/c}` is `C⁰_{/c}`; for HTT's form the agreement is a theorem
  (HTT, Prop. 4.3.3.5, p. 305), proved in §7.6.
- For K = K′ = Δ[0], `M^op(δ)` is Δ[1] and one may take 𝒦 = Δ[1]; a left extension is an edge f → f′ of D,
  and it is a left Kan extension in either form exactly when that edge is an equivalence. A definition
  accepting every left extension would accept the edge 0 → 1 of D = Δ[1].
- For K = ∅, `M^op(δ)` is K′ over {1}, the fiber of 𝒦 over 0 is empty, and f′ is a left Kan extension in
  either form exactly when every value is initial.
- For δ : Δ[0] → Δ[1] at 1, D = Δ[1], f′ = id and α the identity, take for 𝒦 the nerve of the poset with
  k < 1 and 0 < 1, k over 0: at 0 the slice of the fiber is empty and f′(0) = 0 is initial, and at 1 it is
  {k} with value 1 = f′(1), so f′ is a left Kan extension in both forms. For δ at 0, f′ = id is not: `K_{/1}`
  is a point with value 0, so f′(1) would have to be 0.

*Needs:* §7.1.2 (Kan extensions along full subcategories), §7.1.3 (left extensions); Part InfinityCategoryFoundations §2.1.6 (categorical equivalences),
§2.1.7 (mapping objects); Tau Ceti `SSet.slice`.

### 7.2 Relative colimits: stability and invariance

**7.2.1. Stability.** Prove the following, for an inner fibration `f : C ⟶ D` of ∞-categories, (HTT, Prop. 4.3.1.5, p. 279). For a trivial fibration f every diagram is an f-colimit; for inner fibrations f and g with `f ∘ p̄` a g-colimit, p̄ is an f-colimit exactly when it is a `(g ∘ f)`-colimit; equivalent diagrams in `Fun(K^▷, C)` are f-colimits together; f-colimits are stable under base change of f. A route: the definition, the criterion of §7.1 and two-out-of-three.

*Needs:* §7.1.1 (HTT, Def. 4.3.1.1, and the criterion); Mathlib instance `Quasicategory ((ihom K).obj C)`.

**7.2.2. Invariance under equivalence.** Prove the following (HTT, Prop. 4.3.1.6, p. 280). Given a square with inner fibrations `p : C ⟶ D`, `p' : C' ⟶ D'` and categorical equivalences `C ⟶ C'`, `D ⟶ D'`, q̄ is a p-colimit exactly when its image is a p'-colimit. A route: the slices of the four corners are related by categorical equivalences (HTT 1.2.9.3), base change along left fibrations over ∞-categories preserves them (Part CartesianFibrations §7.2.1, HTT 3.3.1.3), and the homotopy-pullback form of the criterion transfers.

*Needs:* §7.1.1 (HTT, Def. 4.3.1.1, and the criterion); Part InfinityCategoryFoundations §2.1.6 (HTT, Def. 1.1.5.14); Part CartesianFibrations §3.1.2 (HTT, Prop. 1.2.9.3, second part), §2.2.1 (HTT, Prop. 2.4.2.4) and §7.2.1 (HTT, Prop. 3.3.1.3, over an ∞-category).

**7.2.3. Cofinal reindexing.** Prove the following, for an inner fibration `p : C ⟶ D` of ∞-categories (HTT, Prop. 4.3.1.7, p. 281). For cofinal `i : A ⟶ B` and `q̄ : B^▷ ⟶ C`, q̄ is a p-colimit exactly when `q̄ ∘ i^▷` is. A route: i and `i^▷` induce categorical equivalences of coslices in C and D (§2.5.2), and the criterion of §7.1.1 transfers.

*Needs:* §2.5.2; §2.1.1 (HTT, Def. 4.1.1.1) and §7.1.1 (HTT, Def. 4.3.1.1, and the criterion).

### 7.3 Relative colimits in fibrations

**7.3.1. Transport along coCartesian edges.** Prove the following (HTT, Prop. 4.3.1.9, p. 282). For an inner fibration `p : X ⟶ S` of ∞-categories and `h : Δ[1] × K^▷ ⟶ X` from `h₀` to `h₁` with p-coCartesian components, the one at the cone point lying over a degenerate edge, `h₀` is a p-colimit exactly when `h₁` is. A route: that component is an equivalence (HTT 2.4.1.5), so the relevant restrictions of slices are trivial fibrations (HTT 1.2.4.3, 2.1.2.5), and §7.2 compares the two conditions, using HTT 3.1.1.11 for the coCartesian components.

*Needs:* §7.2.1; §7.1.1 (HTT, Def. 4.3.1.1); Part InfinityCategoryFoundations §1.2 (HTT, Notation 1.2.7.2); Part InfinityCategoryFoundations §4.2.1 (HTT, Prop. 2.1.2.1) and §4.3.2 (HTT, Prop. 2.1.2.5); Tau Ceti `SSet.Edge.isEquivalence_iff_hornFilling_zero`; Part CartesianFibrations §1.3.1 (HTT, Prop. 2.4.1.5), §1.5.1 (HTT, the discussion after Prop. 2.4.1.7) and §5.4.2 (HTT, Prop. 3.1.1.11).

**7.3.2. Colimits in a fiber.** Prove the following (HTT, Prop. 4.3.1.10, p. 283; Cor. 4.3.1.11, p. 284). For a locally coCartesian fibration `q : X ⟶ S` and `p̄ : K^▷ ⟶ X_s`, p̄ is a q-colimit exactly when `e_! ∘ p̄` is a colimit in `X_{s'}` for every edge `e : s ⟶ s'`. Hence, if p is a coCartesian fibration whose fibers have K-indexed colimits preserved by every transport functor, every `q : K ⟶ X` with an extension `K^▷ ⟶ S` of `p ∘ q` has a p-colimit over it. A route: the relative condition concerns the fibers of a left fibration over `S_{s/}`, which over e is the coslice of `e_! ∘ p̄` in `X_{s'}`; for the corollary, transport q into the fiber over the cone point by a coCartesian lift (HTT 3.1.2.1) and take the colimit there.

*Needs:* §7.3.1; §7.1.1 (HTT, Def. 4.3.1.1); Tau Ceti `SSet.CartesianFibration`; Part InfinityCategoryFoundations §5.5.4 (HTT, Rem. 1.2.13.5), §4.2.1 (HTT, Prop. 2.1.2.1), §4.3.2 (HTT, Prop. 2.1.2.5) and §5.3.2 (HTT, Lemma 2.1.3.4); Part InfinityCategoryFoundations §9.4.1 (categorical fibrations, HTT §2.2.5); Part CartesianFibrations §2.3.1 (HTT, Def. 2.4.2.6), §5.4.2 (HTT, Prop. 3.1.1.11), §5.5.3 (HTT, Prop. 3.1.2.1) and §7.4.1 (HTT, Prop. 3.3.1.7, over ∞-category bases).

**7.3.3. Relatively initial objects.** Prove the following (HTT, Prop. 4.3.1.14, p. 286; Cor. 4.3.1.15, p. 288). Let `p : C ⟶ D`, `r : D ⟶ E` be inner fibrations with `q = r ∘ p` a Cartesian fibration and p carrying q-Cartesian morphisms to r-Cartesian ones; for the second assertion r is a Cartesian fibration as well. An object c that is `p_e`-initial in its fiber `C_e` is p-initial, and for `s : E' ⟶ E` a diagram `f' : K^▷ ⟶ C ×_E E'` is a `p'`-colimit exactly when its image in C is a p-colimit. A route: c is p-initial exactly when `(c, id_d)` is initial in `C ×_D D_{d/}` (HTT, Lemma 4.3.1.13, p. 286, by Part CartesianFibrations §7.4.1 for the left fibration `C ×_D D_{d/} ⟶ D_{d/}`); Cartesian transport along `E_{/e}` and HTT 2.4.4.7 reduce to the fiber. For the second assertion pass to coslices, which stay Cartesian fibrations (HTT 2.4.3.2), to reduce to K empty; then compare both conditions on the object with the condition in the fiber over its image in `E'`, using the first assertion in one direction and base-change stability (§7.2.1) in the other.

*Needs:* §7.1.1 (HTT, Def. 4.3.1.1), §7.2.1; Part InfinityCategoryFoundations §1.2 (HTT, §1.2.12); Tau Ceti `SSet.Edge.IsCartesian`, `SSet.CartesianFibration`; Part InfinityCategoryFoundations §9.4.1 (categorical fibrations, HTT §2.2.5); Part CartesianFibrations §2.2.1 (HTT, Prop. 2.4.2.4), §2.4.1 (HTT, Prop. 2.4.3.2), §2.7.1 (HTT, Lemma 2.4.4.7) and §7.4.1 (HTT, Prop. 3.3.1.7, over ∞-category bases).

**7.3.4. Left fibrations detect colimits over weakly contractible diagrams.** Prove the following (HTT, Lemma 4.4.2.8, p. 315). For a left fibration `f : C ⟶ D` of ∞-categories and K weakly contractible, every diagram `K^▷ ⟶ C` is an f-colimit. A route: the lifting problems of the relative colimit condition are extensions along `(K^▷ ⋆ ∂Δ[n]) ⊔_{K ⋆ ∂Δ[n]} (K ⋆ Δ[n]) ⊆ K^▷ ⋆ Δ[n]`, left anodyne by the dual of Lemma 4.2.3.5 (§6.2.1) because `K ⊆ K^▷` is a weak homotopy equivalence; f is a left fibration.

*Needs:* §6.2.1 (HTT, Lemma 4.2.3.5); §7.1.1 (HTT, Def. 4.3.1.1); Tau Ceti `SSet.LeftFibration`, `SSet.join`, `SSet.IsWeaklyContractible`; ModelCategoryTheory, Part KanQuillen §3.2.1 (HTT, §A.2.7).

**7.3.5. Colimits along left fibrations.** Prove the following (HTT, Prop. 4.4.2.9, p. 316). For a left fibration `f : C ⟶ D`, K weakly contractible and `p : K ⟶ C`, an extension p̄ is a colimit exactly when `f ∘ p̄` is, and every colimit of `f ∘ p` lifts to an extension of p. A route: by §7.3.4 the comparison `C_{p̄/} ⟶ C_{p/} ×_{D_{fp/}} D_{f p̄/}` is a trivial fibration. Lift `K^▷` by Lemma 4.2.3.6 (`K ⊆ K^▷` is left anodyne), and use HTT 2.1.3.4: a left fibration with contractible fibers is a trivial fibration.

*Needs:* §7.3.4; §6.2.1 (HTT, Lemma 4.2.3.6); Tau Ceti `SSet.LeftFibration`, `SSet.IsWeaklyContractible`, `SSet.coslice.IsColimit`; Part InfinityCategoryFoundations §5.5.4 (HTT, Rem. 1.2.13.5) and §5.3.2 (HTT, Lemma 2.1.3.4).

### 7.4 Existence of Kan extensions; restriction is a trivial fibration

The `Suggested.lean` forms of this section's statements meet HTT's hypotheses (Lemmas 4.3.2.7, 4.3.2.12, 4.3.2.13, Prop. 4.3.2.15 and Cor. 4.3.2.16): there D′ is a point, D carries `[D.Quasicategory]`, and the map from an ∞-category to a point is a categorical fibration, the ∞-categories being the fibrant objects of the Joyal model structure (Part InfinityCategoryFoundations §9.5, HTT, Thm. 2.2.5.1).

**7.4.1. The comparison map.** Prove that, for ∞-categories C, D and D′, a full subcategory `C⁰ ⊆ C` and a categorical fibration `p : D ⟶ D′`, if F is a p-left Kan extension of `F⁰ = F|C⁰`, then `D_{F/} ⟶ D'_{pF/} ×_{D'_{pF⁰/}} D_{F⁰/}` is a trivial fibration, so p-colimits of F are p-colimits of `F⁰` (HTT, Lemma 4.3.2.7, p. 292). A route in four steps.

1. **The simplex filtration** (HTT, Lemma 4.3.2.7, first step of the proof, pp. 292–293). Well-order the simplices of C whose vertex 0 is not in `C⁰`, with non-decreasing dimension, and let `C_β` consist of the simplices in `C⁰` or whose final segment outside `C⁰` is among the first β. Then `C_0 = C⁰`, the union is C, unions are taken at limits, and `C_{β+1}` is the pushout of `C_β ⟵ C⁰_{/σ_β} ⋆ ∂Δ[n] ⟶ C⁰_{/σ_β} ⋆ Δ[n]`.
   *Needs:* §7.1.2 (HTT, Def. 4.3.2.2); Tau Ceti `SSet.slice.homEquiv`, `SSet.coslice.homEquiv` (HTT, Prop. 1.2.9.2); Tau Ceti `SSet.join`.
2. **A degenerate step** (HTT, Lemma 4.3.2.7, proof, pp. 294–295). If `σ_β` is degenerate, `C_β ⊆ C_{β+1}` is a categorical equivalence. A route: the subset of `C⁰_{/σ}` of simplices factoring through lower degenerations is the colimit of a cofibrant diagram, indexed by surjective factorizations of σ, with a final object; so its inclusion is a categorical equivalence, joins preserve it (§1.1.2), and the pushout is a homotopy pushout.
   *Needs:* step 1, §1.1.2; Part InfinityCategoryFoundations §4.3.2 (HTT, Prop. 2.1.2.5); Part InfinityCategoryFoundations §9.5.1 (HTT, Thm. 2.2.5.1); ModelCategoryTheory, Part ModelCategories §3.5.1, §3.5.2 (homotopy pushout squares); ModelCategoryTheory, Part SimplicialCategories §3.1.1 (HTT, Prop. A.2.8.7).
3. **A nondegenerate step** (HTT, Lemma 4.3.2.7, proof, p. 293). If `σ_β` is nondegenerate, the comparison map for `C_β ⊆ C_{β+1}` is a trivial fibration. A route: a lifting problem becomes an extension of `∂Δ[n+m+1]` over a slice of D whose initial vertex is relatively initial, which is the Kan extension hypothesis at `σ(0)` transferred along the cofinal `C⁰_{/σ} ⟶ C⁰_{/σ(0)}` (§7.2).
   *Needs:* step 1, §7.2; §7.1.1 (HTT, Def. 4.3.1.1), §7.1.2 (HTT, Def. 4.3.2.2); Part InfinityCategoryFoundations §9.4.1 (categorical fibrations, HTT §2.2.5).
4. **Transfinite induction** (HTT, Lemma 4.3.2.7 and its proof, pp. 292–293). The comparison maps `φ_{β′,β}` are trivial fibrations: isomorphisms for `β′ = β`, limits of towers at limit stages, and at successors a composite of a pullback of `φ_{β′,β}` with `φ_{β′+1,β′}`. The latter is step 3, or, at degenerate steps, a left fibration (HTT 2.1.2.1) that is a categorical equivalence by step 2, the fat slices (§1.2.1) and HTT 2.4.4.6.
   *Needs:* steps 1–3, §1.2.1; Part InfinityCategoryFoundations §4.2.1 (HTT, Prop. 2.1.2.1); Part CartesianFibrations §3.4.1 (HTT, Prop. 1.2.7.3) and §2.5.3 (HTT, Cor. 2.4.4.6).

**7.4.2. Existence.** Prove that, for ∞-categories C, D and D′, a full subcategory `C⁰ ⊆ C` and a categorical fibration `p : D ⟶ D′`, for `F⁰ : C⁰ ⟶ D` and `G : C ⟶ D'` extending `p ∘ F⁰`, a p-left Kan extension of `F⁰` over G exists exactly when every diagram `C⁰_{/c} ⟶ C⁰ ⟶ D` has a p-colimit over the cone given by G (HTT, Lemma 4.3.2.13, p. 300). A route: construct `F_β` on `C_β` by transfinite induction along step 1 of §7.4.1, choosing a p-colimit of the diagram over `C⁰_{/c}` when an object c is adjoined, filling the cone over a positive-dimensional nondegenerate simplex because its initial vertex is then relatively initial, as in step 3 of §7.4.1, and extending along the categorical equivalence of its step 2 at degenerate ones. The `Suggested.lean` declaration `exists_isLeftKanExtension_iff` states the case D' a point.
*Needs:* §7.4.1, steps 1–3; §7.1.1 (HTT, Def. 4.3.1.1), §7.1.2 (HTT, Def. 4.3.2.2); Part InfinityCategoryFoundations §1.2.1 (full subcategories, HTT §1.2.11); Part InfinityCategoryFoundations §9.4.1 (HTT §2.2.5); Mathlib `SSet.Quasicategory`.

**7.4.3. Filling prisms at initial vertices.** For an inner fibration `p : X ⟶ S`, `m ≥ 0` and `n ≥ 1`, every map `(∂Δ[m] × Δ[n]) ⊔ (Δ[m] × ∂Δ[n]) ⟶ X` over S carrying `(0, 0)` to a p-initial vertex extends to `Δ[m] × Δ[n] ⟶ X` over S (HTT, Lemma 4.3.2.10, p. 296). A route: adjoin the missing nondegenerate simplices one at a time; each has positive dimension and initial vertex `(0, 0)`, so it is filled because that vertex is p-initial.
*Needs:* §7.1.1 (HTT, Def. 4.3.1.1); Mathlib `SSet.InnerFibration`.

**7.4.4. Relative fat slices.** For an inner fibration `p : X ⟶ Y` over S, a simplicial set K and `q_S : K × S ⟶ X` over S, the induced map of relative fat slices `X^{q_S/} ⟶ Y^{p q_S/}` of §1.5.1 is an inner fibration (HTT, Lemma 4.3.2.11, p. 296). A route: a lifting problem against an inner anodyne `A ⊆ B` is a lifting problem for p against a pushout-product of `A ⊆ B` with a monomorphism, which is inner anodyne (HTT, Cor. 2.3.2.4).
*Needs:* §1.5.1 (HTT, Def. 4.2.2.1); Mathlib `SSet.InnerFibration`, `SSet.innerAnodyneExtensions_pushoutObjObjι`.

**7.4.5. Extending families.** For a categorical fibration `p : D ⟶ D'`, `C ⟶ D'` and a full subcategory `C⁰ ⊆ C`, all ∞-categories, every square from `∂Δ[n] ⟶ Fun_{D'}(C, D)` to `Δ[n] ⟶ Fun_{D'}(C⁰, D)`, `n > 0`, whose vertex 0 is a p-left Kan extension of its restriction, has a diagonal filler (HTT, Lemma 4.3.2.12, p. 297). A route: extend over the filtration `C_β` of §7.4.1, step 1 by transfinite induction. At a degenerate step use the categorical equivalence of step 2 of §7.4.1. At a nondegenerate step, after HTT A.2.3.1 the lifting problem lives in the relative slices of §1.5.2, which are Cartesian fibrations; steps 1 and 2 of this route and Propositions 4.3.1.14 and 4.3.1.6 (§7.2.1, §7.3.1) solve it, the initial vertex being relatively initial by the Kan extension hypothesis.
*Needs:* §7.2.1, §7.3.1, steps 1 and 2 of §7.4.1, steps 1 and 2 of this route; §1.5.1, §1.5.2; §7.1.1 (HTT, Def. 4.3.1.1), §7.1.2 (HTT, Def. 4.3.2.2); Part InfinityCategoryFoundations §1.2.1 (full subcategories, HTT §1.2.11); Mathlib `SSet.InnerFibration`, instance `Quasicategory ((ihom K).obj C)`; Tau Ceti `SSet.CartesianFibration`; Part InfinityCategoryFoundations §9.4.1 (categorical fibrations, HTT §2.2.5); ModelCategoryTheory, Part ModelCategories §3.2.1 (HTT, Prop. A.2.3.1).

**7.4.6. The trivial fibration.** Prove that, for ∞-categories C, D and D′, a full subcategory `C⁰ ⊆ C` and a categorical fibration `p : D ⟶ D′`, with `K ⊆ Map_{D'}(C, D)` spanned by the p-left Kan extensions of their restrictions and `K⁰ ⊆ Map_{D'}(C⁰, D)` spanned by the functors whose diagrams `C⁰_{/c} ⟶ D` all have p-colimits, restriction `K ⟶ K⁰` is a trivial fibration (HTT, Prop. 4.3.2.15, p. 302); and that if `K⁰` is all of `Map_{D'}(C⁰, D)`, restriction has a section `i_!` whose essential image is spanned by the p-left Kan extensions (HTT, Cor. 4.3.2.16, p. 302). The three lifting lemmas are §7.4.3–§7.4.5. The `Suggested.lean` declaration `exists_rlp_monomorphisms_leftKanExtensions_restrict` states the case D' a point, with K as `leftKanExtensions` and `K⁰` as `pointwiseColimitFunctors`.

Route: Surjectivity on vertices is §7.4.2. Lifting against `∂Δ[n] ⊆ Δ[n]`, `n > 0`, is §7.4.5. The section `i_!` is a section of the trivial fibration.
*Needs:* §7.4.2, §7.4.5; §7.1.1 (HTT, Def. 4.3.1.1), §7.1.2 (HTT, Def. 4.3.2.2); Part InfinityCategoryFoundations §1.2.1 (full subcategories, HTT §1.2.11); Mathlib instance `Quasicategory ((ihom K).obj C)`.


**7.4.7. Colimit diagrams indexed by a simplicial set.** Prove that for a small simplicial set K and an ∞-category C in which every diagram `K ⟶ C` has a colimit, with `Fun^colim(K^▷, C) ⊆ Fun(K^▷, C)` the full subcategory spanned by the colimit diagrams, restriction `Fun^colim(K^▷, C) ⟶ Fun(K, C)` is a trivial fibration; dually, if every diagram `K ⟶ C` has a limit, restriction from the full subcategory of `Fun(K^◁, C)` spanned by the limit diagrams to `Fun(K, C)` is a trivial fibration. §7.4.3 does not apply directly, because `K^▷` need not be an ∞-category. HTT has no separate statement: it applies Prop. 4.3.2.15 in this form, for instance in the discussion after Def. 5.3.3.1 (p. 412) and in the proof of Lemma 6.1.3.5 (p. 564). A route in four steps; the dual follows by passing to opposites.

1. **Replace K by an ∞-category.** Choose an inner anodyne `j : K ⊆ K′` with K′ an ∞-category (small object argument; K′ is small). Then `K^▷ ⊆ K′^▷` is inner anodyne: it is the pushout `K^▷ ⊆ K^▷ ⊔_K K′` of j followed by the pushout-join of j with `∅ ⊆ Δ[0]`, which is inner anodyne because j is right anodyne, inner horns being right horns. `K′^▷` is an ∞-category, as a join of ∞-categories. So the restrictions `Fun(K′^▷, C) ⟶ Fun(K^▷, C)` and `Fun(K′, C) ⟶ Fun(K, C)` are trivial fibrations.
   *Needs:* ModelCategoryTheory, Part ModelCategories §1.4.1 (HTT, Prop. A.1.2.5 (1)); Part InfinityCategoryFoundations §4.1.1 (HTT, Lemma 2.1.2.3) and §9.2.2 (HTT, Cor. 2.3.2.5, over a point); Mathlib `SSet.innerAnodyneExtensions`; Tau Ceti `SSet.join`, `SSet.join.quasicategory`.
2. **Restriction preserves and reflects the colimit condition.** j is right anodyne, hence cofinal (§2.3.1). For `p̄′ : K′^▷ ⟶ C` with `p′ = p̄′|K′` and `p = p′|K`, the restriction `C_{p′/} ⟶ C_{p/}` is therefore an equivalence of ∞-categories (§2.5.2), carrying the vertex p̄′ to `p̄′|K^▷`; equivalences preserve and reflect initial objects. So p̄′ is a colimit diagram exactly when `p̄′|K^▷` is, and every diagram `K′ ⟶ C` has a colimit, because its restriction to K has one. Hence `Fun^colim(K′^▷, C)` is the preimage of `Fun^colim(K^▷, C)`, and restriction `Fun^colim(K′^▷, C) ⟶ Fun^colim(K^▷, C)` is a trivial fibration, a pullback of the first map of step 1.
   *Needs:* step 1; §2.3.1 (HTT, Prop. 4.1.1.3), §2.5.2 (HTT, Prop. 4.1.1.8, (1) ⇒ (2)); Part InfinityCategoryFoundations §1.2 (HTT, §1.2.12; full subcategories, §1.2.11); Tau Ceti `SSet.coslice.IsColimit`.
3. **Colimit diagrams over K′ are Kan extensions.** Apply §7.4.3 with `K′^▷` in the role of C, its full subcategory K′ in the role of `C⁰`, C in the role of D and `D′ = Δ[0]`. At an object of K′ every functor is a left Kan extension (§7.1.2, Checks). At the cone point ∞, the projection `K′ ×_{K′^▷} (K′^▷)_{/∞} ⟶ K′` is an isomorphism of simplicial sets: an n-simplex of the source is an (n+1)-simplex of the join with last vertex ∞ and its other vertices in K′, and these form the summand `K′_n × Δ[0]_0` of `(K′ ⋆ Δ[0])_{n+1}`. So its inverse s, adjoint to the identity of `K′^▷`, is an isomorphism, hence cofinal (§2.3.1, first bullet). The cone at ∞ restricts along `s^▷` to F itself, so, as in step 2, F is a left Kan extension at ∞ exactly when it is a colimit diagram. Every diagram `K′ ⟶ C` satisfies the existence hypothesis: at an object of K′ the indexing ∞-category has a final object, and at ∞ the diagram has a colimit by step 2 and the same equivalence. So restriction `Fun^colim(K′^▷, C) ⟶ Fun(K′, C)` is a trivial fibration.
   *Needs:* §7.4.6 (HTT, Prop. 4.3.2.15); §2.3.1, §2.5.2; §7.1.2 (HTT, Def. 4.3.2.2); Tau Ceti `SSet.join`, `SSet.slice`.
4. **Descent to K.** In the square formed by the restrictions of steps 2 and 3 to `Fun^colim(K^▷, C)` and `Fun(K, C)`, the composite `Fun^colim(K′^▷, C) ⟶ Fun(K, C)` is a trivial fibration (steps 1 and 3), and so is `Fun^colim(K′^▷, C) ⟶ Fun^colim(K^▷, C)` (step 2). A lifting problem for `Fun^colim(K^▷, C) ⟶ Fun(K, C)` against `∂Δ[n] ⊆ Δ[n]` is solved by lifting its boundary along the second map and then the square along the composite.
   *Needs:* steps 1–3; Mathlib `SSet.rlp_monomorphisms`; for the dual, Mathlib `SSet.opFunctor` and Tau Ceti `SSet.coslice.isColimit_iff_isLimit_op`.

### 7.5 Pointwise Kan extensions: invariance, transitivity and parameters

**7.5.1. Invariance.** Prove the following, for a categorical fibration `p : D ⟶ D'` and a full subcategory `C⁰ ⊆ C`, for which an inner fibration p suffices (HTT, Lemma 4.3.2.5, p. 290; Lemma 4.3.2.6, p. 291). Being a p-left Kan extension at c depends only on the equivalence class of c; equivalent functors in `Fun(C, D)` are p-left Kan extensions together; and the notion is invariant under categorical equivalences of `C⁰ ⊆ C` and of p. A route: for an equivalence `c ⟶ c'` the restrictions `C⁰_{/c} ⟵ C⁰_{/f} ⟶ C⁰_{/c'}` are trivial fibrations (HTT 1.2.4.3), hence cofinal (§4.4); then cofinal reindexing and invariance (§7.2).

*Needs:* §7.2.1; §4.4.1; §2.1.1 (HTT, Def. 4.1.1.1) and §7.1.2 (HTT, Def. 4.3.2.2); Part InfinityCategoryFoundations §2.1.8 (fully faithful functors, HTT §1.2.10); Tau Ceti `SSet.Edge.isEquivalence_iff_hornFilling_zero`; Part CartesianFibrations §3.1.2 (HTT, Prop. 1.2.9.3, second part).

**7.5.2. Transitivity.** Prove the following, for a categorical fibration `p : D ⟶ D'` (HTT, Prop. 4.3.2.8, p. 295). For `C⁰ ⊆ C¹ ⊆ C` with `F|C¹` a p-left Kan extension of `F|C⁰`, F is one of `F|C¹` exactly when it is one of `F|C⁰`. A route: compare the conditions over `C⁰_{/c}` and `C¹_{/c}` by §7.4.1 applied to `C⁰_{/c} ⊆ C¹_{/c}`, and reindex along a trivial fibration (§7.2.1; §4.4.1).

*Needs:* §7.2.1, §7.4.1; §4.4.1; §7.1.2 (HTT, Def. 4.3.2.2).

**7.5.3. Parameters.** Prove the following, for a categorical fibration `p : D ⟶ D'` and a full subcategory `C⁰ ⊆ C` (HTT, Prop. 4.3.2.9, p. 295). `F : C × C' ⟶ D` is a p-left Kan extension of `F|C⁰ × C'` exactly when each `F(−, c')` is one of its restriction to `C⁰`. A route: `C⁰_{/c} ⟶ (C⁰ × C')_{/(c, c')}` is cofinal, since `C'_{/c'}` has a final object; reindex (§7.2.1).

*Needs:* §7.2.1; §7.1.2 (HTT, Def. 4.3.2.2); Part InfinityCategoryFoundations §1.2 (HTT, §1.2.12).

### 7.6 Kan extensions along arbitrary functors

**7.6.1. Independence of the correspondence.** Prove that the condition of HTT Def. 4.3.3.2 does not depend on the witnessing correspondence: if `F : M^op(δ) ⟶ D` is a left Kan extension of `F|K` along `δ : K ⟶ K′` and `F″ : M^op(δ) ⟶ M` is a map over Δ[1] to an ∞-category M that is both a monomorphism and a categorical equivalence, then `F = F′ ∘ F″` for some `F′ : M ⟶ D` that is a left Kan extension of its restriction to `M ×_{Δ[1]} {0}` (HTT, Prop. 4.3.3.4, p. 304). A route: let `F = G′ ∘ G″` with `G″ : M^op(δ) ⟶ M′` be a factorization witnessing Def. 4.3.3.2; since M′ is an ∞-category and F″ is a monic categorical equivalence, G″ extends along F″ to `r : M ⟶ M′` over Δ[1], itself a categorical equivalence by two-out-of-three; take `F′ = G′ ∘ r` and transfer the Kan extension condition along r (§7.5, invariance; HTT, Lemma 4.3.2.6 (2)).
*Needs:* §7.5.1; §7.1.3 (HTT, Def. 4.3.3.1), §7.1.4 (HTT, Def. 4.3.3.2); Part InfinityCategoryFoundations §9.5.1 (HTT, Thm. 2.2.5.1, the Joyal model structure: ∞-categories are fibrant and monic categorical equivalences are trivial cofibrations).

**7.6.2. Full inclusions.** Prove that for a full inclusion `δ : C⁰ ⊆ C`, f with the identity transformation is a left Kan extension of `f|C⁰` along δ in the sense of HTT 4.3.3.2 exactly when it is one in the sense of HTT 4.3.2.2, and existence agrees for both (HTT, Prop. 4.3.3.5, p. 305). A route: the full subcategory K of `C × Δ[1]` on the objects `(c, 0)` with c in `C⁰` and all `(c, 1)` contains `M^op(δ)`, and the inclusion is a categorical equivalence: K is full in `C × Δ[1]`, so the edges `(c, 0) ⟶ (c, 1)` stay coCartesian over Δ[1], and on opposites `M(δᵒᵖ) ⊆ Kᵒᵖ` is then a quasi-equivalence over Δ[1], the identity on both fibers (as in HTT, Rem. 4.3.3.3, p. 304), hence a categorical equivalence (HTT, Prop. 3.2.2.10). The Kan extension condition for `f ∘ pr` on K at `(c, 1)` is the one for f at c, since `C⁰ × {0}` over `(c, 1)` is `C⁰_{/c}`. §7.6.1 transfers HTT's condition from any witnessing correspondence to K; existence along δ reduces to the existence criterion of §7.4.
*Needs:* §7.6.1 (HTT, Prop. 4.3.3.4); §7.4.2 (HTT, Lemma 4.3.2.13); §7.1.2 (HTT, Def. 4.3.2.2), §7.1.4 (HTT, Def. 4.3.3.2); Part InfinityCategoryFoundations §1.2.1 (full subcategories, HTT §1.2.11); Part CartesianFibrations §1.5.1 (coCartesian edges), §6.2.1 (HTT, Def. 3.2.2.6) and §6.3.1 (HTT, Prop. 3.2.2.10); Mathlib `SSet.opFunctor`.

**7.6.3. The pointwise form.** Prove that HTT's form of a left Kan extension along a functor of ∞-categories agrees with the pointwise form: for a functor `δ : K ⟶ K′` of ∞-categories, an ∞-category D, `f : K ⟶ D` and a left extension `(f′, α)` of f along δ, the map `M^op(δ) ⟶ D` is a left Kan extension of f along δ in the sense of HTT Def. 4.3.3.2 exactly when `(f′, α)` is a pointwise left Kan extension, that is, for every vertex c of K′, α restricted to `K_{/c} = K ×_{K′} K′_{/c}`, composed with the tautological cone, exhibits f′(c) as a colimit of `K_{/c} ⟶ K ⟶ D` (Kerodon, Prop. 7.3.2.11, tag 02YZ, which assumes K and K′ are ∞-categories). A route, with `R = K ⋆_{K′} K′` the relative join of δ and the identity of K′, which is an ∞-category, with fiber K over 0 and K′ over 1.
1. **The comparison map.** Let `c : M^op(δ) ⟶ R` be the map over Δ[1] that is the identity on both fibers and sends a simplex `(τ, u)` of `K × Δ[1]` to the simplex of R with K′-component `δ ∘ τ` and K-component τ restricted to `u⁻¹(0)`. The edges `(k, 0) ⟶ (δk, 1)` of R are coCartesian over Δ[1]: for y over 1, composition with such an edge identifies `Map_R(δk, y)` with `Map_R(k, y)`, both being `Map_{K′}(δk, y)`, and for y over 0 both are empty (Part CartesianFibrations §1.7, HTT, Prop. 2.4.4.3, dually). So on opposites c is a quasi-equivalence `M(δᵒᵖ) ⟶ Rᵒᵖ` over Δ[1], the identity on both fibers, and hence a categorical equivalence (Part CartesianFibrations §6.2–6.3, HTT, Prop. 3.2.2.10). c is not a monomorphism when δ is not one, so it is not itself a witness for HTT Def. 4.3.3.2.
2. **A witness through R.** Factor c in the Joyal structure over Δ[1] as a monic categorical equivalence `i : M^op(δ) ⟶ M` followed by a trivial fibration `t : M ⟶ R`; M is an ∞-category, since R is. Extend `F : M^op(δ) ⟶ D` along i to `F_M : M ⟶ D`, as D is an ∞-category. By §7.6.1, F is a left Kan extension in HTT's sense exactly when `F_M` is left Kan extended from the fiber `M_0`.
3. **Transfer to R.** Choose a section `s : R ⟶ M` of t over Δ[1] and put `G = F_M ∘ s`. s is a categorical equivalence over Δ[1] restricting to categorical equivalences on both fibers, so `F_M` is left Kan extended from `M_0` exactly when G is left Kan extended from K (§7.5, invariance). By Kerodon 7.3.2.11, the latter holds exactly when the transformation `β_G : G|K ⟶ G|K′ ∘ δ` determined by G exhibits `G|K′` as a pointwise left Kan extension of `G|K`.
4. **Comparison with `(f′, α)`.** `s ∘ c` and i are two lifts of c along the trivial fibration t, so they are J-homotopic over R, and `G ∘ c` is equivalent to `F_M ∘ i = F` in `Fun(M^op(δ), D)`. So `(G|K′, β_G)` and `(f′, α)` are equivalent left extensions, and the pointwise condition, a colimit condition at every vertex of K′, holds for both or for neither (Part InfinityCategoryFoundations §5.5, uniqueness of colimits).

*Needs:* §7.6.1 (HTT, Prop. 4.3.3.4); §7.4, §7.5.1; §7.1.2 (HTT, Def. 4.3.2.2), §7.1.3 (HTT, Def. 4.3.3.1), §7.1.4 (HTT, Def. 4.3.3.2; pointwise form, Kerodon, Variant 7.3.1.5, tag 02YC); Part InfinityCategoryFoundations §5.5.4 (uniqueness of colimits); Part InfinityCategoryFoundations §9.5.1 (HTT, Thm. 2.2.5.1, factorizations and trivial fibrations); Part CartesianFibrations §1.7.2 (HTT, Prop. 2.4.4.3), §6.2.1 (HTT, Def. 3.2.2.6) and §6.3.1 (HTT, Prop. 3.2.2.10); Mathlib `SSet.opFunctor`, `HomotopicalAlgebra.ModelCategory.over`; Tau Ceti `SSet.join`, `SSet.coslice.IsColimit`.

**7.6.4. Fully faithful directions.** Prove that if `α : f₀ ⟶ f₁ ∘ δ` exhibits `f₁` as a left Kan extension of `f₀` along `δ : C⁰ ⟶ C¹`, and `Map_{C⁰}(c', c) ⟶ Map_{C¹}(δc', δc)` is an isomorphism in H for all `c'`, then `α(c)` is an equivalence (HTT, Prop. 4.3.3.8, p. 306). A route: on a correspondence M representing δ the extension is along a full inclusion and `α(c)` is the value of the extension on an edge `u : c ⟶ δc` of M. The colimit condition at δc reduces the claim to u being final in `C⁰ ×_M M_{/δc}`. It is the image of the final object `id_c` under the map to it from `C⁰ ×_M M_{/u}` (a trivial fibration over `C⁰_{/c}`), and the hypothesis makes this map of right fibrations over C⁰ an equivalence fiber by fiber, hence a categorical equivalence (HTT 3.3.1.5, direction (2) ⇒ (1): Part CartesianFibrations §7.3, first statement, in Cartesian form).
*Needs:* §7.1.2 (HTT, Def. 4.3.2.2), §7.1.4 (HTT, Def. 4.3.3.2); Part InfinityCategoryFoundations §1.2 (HTT, §1.2.12); Part InfinityCategoryFoundations §5.5.4 (HTT, Rem. 1.2.13.5) and §4.3.2 (HTT, Prop. 2.1.2.5); Part CartesianFibrations §4.1.1 (HTT, §2.3.1, correspondences) and §7.3.1 (first statement, HTT, Prop. 3.3.1.5, (2) ⇒ (1)).

**7.6.5. Fiberwise computation over a base.** Prove that Kan extensions along a full inclusion over a base are computed fiberwise: for coCartesian fibrations `C⁰ ⟶ E`, `C ⟶ E` and a full inclusion `C⁰ ⊆ C` over E preserving coCartesian morphisms, F is a left Kan extension of `F|C⁰` exactly when each `F_e` is one of its restriction to `C⁰_e` (HTT, Lemma 4.3.3.9, p. 307). A route: the inclusion `C⁰_e ×_{C_e} (C_e)_{/c} ⟶ C⁰_{/c}` is right anodyne by smoothness (§5.2), hence cofinal (§2.3, §2.5).
*Needs:* §2.3.1, §2.5.2, §5.2.2; §2.1.1 (HTT, Def. 4.1.1.1) and §7.1.2 (HTT, Def. 4.3.2.2); Part InfinityCategoryFoundations §1.2.1 (full subcategories, HTT §1.2.11); Tau Ceti `SSet.CartesianFibration`.

### 7.7 Kan extensions from homotopy Kan extensions and along coCartesian fibrations

Two computations of pointwise left Kan extensions follow. Neither has a source statement. The first transports the model-categorical homotopy left Kan extension through the comparison of §3.1, and the second computes extensions along a coCartesian fibration fiber by fiber.

**7.7.1. From homotopy Kan extensions.** Prove that for a functor `f : C ⟶ C′` of small categories, a combinatorial simplicial model category A with the projective structures on `A^C` and `A^{C′}`, F in `(A^C)°`, G in `(A^{C′})°` and `α : F ⟶ f^*G` exhibiting G as a homotopy left Kan extension of F along f, the transformation `N(α) : N(F) ⟶ N(G) ∘ N(f)` exhibits `N(G) : N(C′) ⟶ N(A°)` as a pointwise left Kan extension of `N(F)` along `N(f)`. Here `N(F)` is the image of F under the comparison of §3.1 for `S = N(C)` and the counit `C[N(C)] ⟶ C`. A route: `N(C) ×_{N(C′)} N(C′)_{/c′}` is the nerve of the comma category `f/c′`, and the tautological cocone corresponds to the cocone of F restricted to `f/c′` with vertex `G(c′)` given by α. By the dual of the pointwise criterion (ModelCategoryTheory, Part SimplicialCategories §3.3 (HTT, Prop. A.2.8.9)), α is a homotopy left Kan extension exactly when each of these cocones is a homotopy colimit. By §3.2, applied object by object through small full subcategories of `A°` as in §3.3, these are colimit diagrams in `N(A°)`. Hence, by the agreement of §7.6 (Kerodon, Prop. 7.3.2.11), `N(α)` is also a left Kan extension in HTT's sense.
*Needs:* §7.6.3; §3.1.1 (HTT, Prop. 4.2.4.4 and the Checks there), §3.2.1 (HTT, Thm. 4.2.4.1) and §3.3.1 (the object-by-object argument); Mathlib `CategoryTheory.nerve`, `SimplicialNerve`; §7.1.4 (pointwise form, Kerodon, Variant 7.3.1.5, tag 02YC); ModelCategoryTheory, Part ModelCategories §7.2.1 (HTT, Prop. A.2.8.2, projective part); ModelCategoryTheory, Part SimplicialCategories §3.1.1 (HTT, Prop. A.2.8.7), §3.2.1 (homotopy Kan extensions), §3.3.1 (HTT, Prop. A.2.8.9) and §6.4.3 (HTT, Rem. A.3.3.13).

**7.7.2. Along coCartesian fibrations.** Prove that for a coCartesian fibration `δ : X ⟶ S` of ∞-categories, an ∞-category D, `f : X ⟶ D`, `f′ : S ⟶ D` and `α : f ⟶ f′ ∘ δ`, the pair `(f′, α)` is a pointwise left Kan extension of f along δ exactly when, for every object s of S, the restriction of α to the fiber `X_s` exhibits `f′(s)` as a colimit of `f|X_s`. Consequently pointwise left Kan extensions along δ are stable under base change: for `h : T ⟶ S` with T an ∞-category, `(f′ ∘ h, α|X ×_S T)` is a pointwise left Kan extension of `f|X ×_S T` along `X ×_S T ⟶ T`. A route: the fiber inclusion `X_s ⟶ X ×_S S_{/s}` is cofinal (§5.4, the fiber over a final object), and the cocone of the pointwise condition at s restricts along it to the fiber cocone. So one is a colimit exactly when the other is (§2.5, HTT, Prop. 4.1.1.8). The fibers of `X ×_S T ⟶ T` are the fibers `X_{h(t)}`, and the fiberwise condition involves nothing else.
*Needs:* §7.6.3; §2.5.2, §5.4.3 (the fiber over a final object); Tau Ceti `SSet.CartesianFibration`, `SSet.slice`, `SSet.coslice.IsColimit`; §7.1.4 (pointwise form, Kerodon, Variant 7.3.1.5, tag 02YC).

**Checks.**

- For C′ the one-object category, §7.7.1 says that a homotopy colimit of F in A is a colimit of `N(F)` in `N(A°)`, the case K = `N(C)` of §3.2. For `f` the identity of C, a homotopy left Kan extension is an objectwise weak equivalence, and `N(α)` is an equivalence, as the pointwise condition requires along an identity.
- For δ the identity of S, the fibers are points and §7.7.2 says that `(f′, α)` is a left Kan extension along the identity exactly when α is an equivalence. For `δ : X ⟶ Δ[0]`, the statement is the definition of a colimit of f.
- Without the coCartesian hypothesis the fiberwise formula fails. For `δ : {0} ⊆ Δ[1]` (a Cartesian fibration) and `f` the object x of D, the pointwise left Kan extension has value x at 1, since `{0} ×_{Δ[1]} Δ[1]_{/1}` is a point. The fiber over 1 is empty, so the fiberwise formula would put an initial object there.

### Examples

- For `C⁰ = ∅` and D with an initial object, the left Kan extension of the empty functor is constant at the initial object (§7.4).
- For `C = (C⁰)^▷`, a left Kan extension of `F⁰` is a colimit diagram, and §7.4 says it exists exactly when `F⁰` has a colimit.
- For `N(ℕ)` and `C⁰ = {0}`, the left Kan extension of an object X is constant at X.

### Dependencies

Layers 1, 2, 4, 5 and 6, and §3.1–3.3 for §7.7; Part InfinityCategoryFoundations (slices along inner fibrations, coslices, the Joyal model structure, categorical fibrations); Part CartesianFibrations (Cartesian and coCartesian edges, invariance of slices, initial sections, the marked lifting calculus, the mapping simplex and quasi-equivalences, base change over an ∞-category, the fiberwise criterion, categorical fibrations over ∞-categories); ModelCategoryTheory, Parts ModelCategories, KanQuillen and SimplicialCategories; Kerodon for the pointwise form of §7.6; Tau Ceti Cartesian fibrations, left fibrations, joins and coslices.

## Layer 8: Colimits in functor ∞-categories and in spaces

### 8.1 Presheaf ∞-categories

**8.1.1.** Define the ∞-category of presheaves on a simplicial set K as `P(K) = Fun(Kᵒᵖ, S)`, with S the ∞-category of
spaces (HTT, Def. 5.1.0.1, p. 333); it is large. The `Suggested.lean` declaration is
`presheaf`.

**Checks.**
- `P(∅)` is Δ[0] and `P(Δ[0])` is S.
- `P(Δ[0] ⊔ Δ[0])` is `S × S`.
- A vertex of `P(Δ[1])` is an edge of S from the value at 1 to the value at 0: presheaves are contravariant.

*Needs:* Part InfinityCategoryFoundations §1.2 (functor ∞-categories); Part InfinityCategoryFoundations §7.1.2 (S).

### 8.2 Colimits in section and functor ∞-categories

**8.2.1.** Prove that a section through fiberwise initial objects is initial (HTT, Lemma 5.1.2.1, p. 336, with the added hypothesis that q is a categorical fibration): let `q : Y ⟶ T` be a Cartesian fibration of simplicial sets that is a categorical fibration (automatic when T is an ∞-category, Part CartesianFibrations §7.4, and for product projections `C × T ⟶ T` with C an ∞-category), and `p : T ⟶ Y` a section with `p(s)` initial in the fiber `Y_s` for every vertex s. Then p is an initial object of the section ∞-category `Map_T(T, Y)`. A route, Lurie's with the base-change and fiberwise inputs of Part CartesianFibrations Layer 7:

1. By §1.5 (with `K = T` over T), `Y^{p/} ⟶ T` is a Cartesian fibration and `Y^{p/} ⟶ Y` preserves Cartesian edges; it is a trivial fibration on each fiber, because `p(s)` is initial in `Y_s` (§1.2). By the fiberwise criterion over any base (Part CartesianFibrations §7.3, first statement, Cartesian form), `Y^{p/} ⟶ Y` is a categorical equivalence.
2. `Y^{p/} ⟶ T` is a categorical fibration: a lifting problem against a monic categorical equivalence `A ⊆ B` over T is an extension along `T ⋄_T A ⊆ T ⋄_T B` against q, and `T ⋄_T A = T ⊔_{A × {0}} (A × Δ[1])` (§1.5). This inclusion is a monomorphism and a categorical equivalence: both sides are homotopy pushouts for the Joyal model structure, and `A ⟶ B`, `A × Δ[1] ⟶ B × Δ[1]` are categorical equivalences (Part InfinityCategoryFoundations §9.3, HTT, Cor. 2.2.5.4). So `Y^{p/}` and Y are fibrant, and like every object cofibrant, in the Joyal model structure on `SSet/T` (Mathlib `HomotopicalAlgebra.ModelCategory.over`), and the categorical equivalence `Y^{p/} ⟶ Y` of step 1 is a homotopy equivalence over T between bifibrant objects (ModelCategoryTheory, Part ModelCategories §3.1), for the cylinder `− × J`, J the nerve of the free-living isomorphism, as in the route of Part CartesianFibrations §7.3, second statement. A J-homotopy over T induces a J-homotopy on section spaces `Map_T(T, −)`, and J-homotopy equivalences are categorical equivalences (Part InfinityCategoryFoundations §9.7, HTT, Prop. 2.2.5.8, and Part CartesianFibrations §7.5). So taking sections over T gives a categorical equivalence `Map_T(T, Y^{p/}) ⟶ Map_T(T, Y)`.
3. That map is the left fibration `j : C_{p/} ⟶ C`, `C = Map_T(T, Y)`. By Part CartesianFibrations §7.3, second statement, over the ∞-category C (for the left fibration j and the identity of C), its fibers are contractible Kan complexes, so j is a trivial fibration (Part InfinityCategoryFoundations §5.3, HTT, Lemma 2.1.3.4) and p is initial.

*Needs:* §1.2.1, §1.5.1, §1.5.2; Part InfinityCategoryFoundations §1.2 (HTT, Def. 1.2.12.1); Part CartesianFibrations §2.2.1 (HTT, Prop. 2.4.2.4), §7.3.1, §7.3.2 (both statements, HTT, Prop. 3.3.1.5), §7.4.1 (HTT, Prop. 3.3.1.7) and §7.5.1 (invariance of sections, J-homotopy equivalences); Part InfinityCategoryFoundations §9.3.1 (HTT, Cor. 2.2.5.4), §9.5.1 (HTT, Thm. 2.2.5.1), §9.7.2 (HTT, Prop. 2.2.5.8) and §5.3.2 (HTT, Lemma 2.1.3.4); Mathlib `HomotopicalAlgebra.ModelCategory.over`; ModelCategoryTheory, Part ModelCategories §3.1.2 (homotopy equivalences of bifibrant objects), §3.3.1 (model structures over a fixed object) and §3.5.2 (HTT, Prop. A.2.4.4); Tau Ceti `SSet.CartesianFibration`, `SSet.LeftFibration`, `SSet.ihomOver`.

**8.2.2.** Prove that colimits in section ∞-categories are computed fiberwise (HTT, Prop. 5.1.2.2, p. 336, with the added hypothesis that q is a categorical fibration). Let `q : X ⟶ T` be a Cartesian fibration that is a categorical fibration, K a simplicial set and `p : K ⟶ Map_T(T, X)` a diagram such that each `p_s : K ⟶ X_s` has a colimit. Then:

- p extends to a cocone `p̄ : K^▷ ⟶ Map_T(T, X)` whose restriction to each fiber is a colimit of `p_s`;
- an extension p̄ of p is a colimit exactly when every `p̄_s` is a colimit of `p_s`.

A route, Lurie's: replace K by an ∞-category through an inner anodyne map, which is cofinal (§2.6). Apply fiberwise colimits (§1.6) to the adjoint `K × T ⟶ X`, a map over T from the coCartesian fibration `K × T ⟶ T`, to get the first claim. The "if" half of the second claim is §8.2.1, applied to the relative coslice of `K × T ⟶ X`, whose fibers are trivial fibrations over the fiberwise colimits; the "only if" half is uniqueness of colimits (Part InfinityCategoryFoundations §5.5).
*Needs:* §8.2.1; §1.5.2 (HTT, Prop. 4.2.2.4), §1.6.1 (HTT, Prop. 4.2.2.7), §2.5.2 (HTT, Prop. 4.1.1.8), §2.6.1; §2.1.1 (HTT, Def. 4.1.1.1); Part InfinityCategoryFoundations §1.2.4 (HTT, Def. 1.2.13.4); Part InfinityCategoryFoundations §4.3.1 (HTT, Cor. 2.1.2.2), §5.5.4 (HTT, Prop. 1.2.12.9) and §6.1.1 (HTT, Lemma 2.2.5.2); Mathlib `SSet.rlp_monomorphisms`; Tau Ceti `SSet.CartesianFibration`, `SSet.coslice.IsColimit`.

**8.2.3.** Prove that colimits in functor ∞-categories are computed pointwise, so presheaf ∞-categories are complete and cocomplete (HTT, Cor. 5.1.2.3, p. 337; Cor. 5.1.2.4, p. 337):

- for simplicial sets K and T and an ∞-category C with K-indexed colimits, `Fun(T, C)` has K-indexed colimits, and a cocone `K^▷ ⟶ Fun(T, C)` is a colimit exactly when its evaluation at each vertex of T is; dually for limits;
- for every simplicial set K, `P(K) = Fun(Kᵒᵖ, S)` has all small limits and colimits.

The `Suggested.lean` declarations `exists_isColimit_ihom` and `isColimit_iff_forall_isColimit_evalAt` state the first item for colimits, with evaluation at a vertex as Tau Ceti's `SSet.evalAt`, and `exists_isColimit_presheaf` and `exists_isLimit_presheaf` the second. A route: apply §8.2.2 to the projection `C × T ⟶ T`, a Cartesian fibration and a categorical fibration (a pullback of `C ⟶ Δ[0]`, Part CartesianFibrations §7.4). The ∞-category S of spaces has small limits and colimits (§3.3, §3.7), and the first item and its dual transfer them to `Fun(Kᵒᵖ, S)`.
*Needs:* §8.2.2 (HTT, Prop. 5.1.2.2); §3.3.1 (HTT, Cor. 4.2.4.8), §3.7.1; §8.1.1 (HTT, Def. 5.1.0.1); Part InfinityCategoryFoundations §1.1 (HTT, §1.2.15), §1.2.4 (HTT, Def. 1.2.13.4) and §7.1.2 (HTT, Def. 1.2.16.1); Part CartesianFibrations §7.4.1 (HTT, Prop. 3.3.1.7); Tau Ceti `SSet.coslice.IsColimit`, `SSet.slice.IsLimit`.

**Checks.**

- For T = Δ[0], `Map_T(T, X) = X` and the statement is the definition of a colimit in X. For T = ∅, the section ∞-category is Δ[0], whose unique object is initial, as the fiberwise condition (vacuous) predicts.
- The fiberwise condition is needed: in `Fun(Δ[1], Δ[1])`, the cocone of the empty diagram at the identity functor is not initial, though its value at 0 is the initial object 0 of Δ[1]; its value at 1 is not initial. An "initial at one vertex" criterion would accept it.
- For `C = Δ[1]` and K = ∂Δ[1] the pointwise formula gives coproducts in `Fun(T, Δ[1])` as pointwise maxima, which exist because Δ[1], a totally ordered set, has binary coproducts.

### 8.3 Colimits in spaces

**8.3.1.** Prove that for `p̄ : K^▷ ⟶ S` classifying a left fibration `X̄ ⟶ K^▷`, with `X = X̄ ×_{K^▷} K`, the following are equivalent: p̄ is a colimit diagram; `X ⊆ X̄` is a covariant equivalence in `SSet/K^▷`; it is a weak homotopy equivalence (HTT, Prop. 3.3.4.5, p. 237). Here "classifying" is the unmarked notion of Part InfinityCategoryFoundations §7.1, and every small left fibration over `K^▷` is classified by some p̄ (Part InfinityCategoryFoundations §7.7 (4), HTT, Cor. 3.3.2.8). The `Suggested.lean` declaration `isColimit_iff_isWeakHomotopyEquivalence` states the equivalence of the first and third conditions. A route in four steps.

1. **Covariant and weak homotopy equivalence** (HTT, Prop. 3.3.4.5, (2) ⇔ (3), p. 238). Factor `X ⟶ K^▷` as a left anodyne map `X ⟶ Y` followed by a left fibration and lift to `q : Y ⟶ X̄`; the covariant condition says that `q_v` is an equivalence (HTT 2.2.3.13), and the fiber inclusions over v are right anodyne because left fibrations are smooth (§5.2).
   *Needs:* §5.2.2; Part InfinityCategoryFoundations §6.2.3 (HTT, Lemma 2.1.4.6), §6.3.1 (HTT, Prop. 2.1.4.7) and §7.6.1 (HTT, Cor. 2.2.3.13); ModelCategoryTheory, Part ModelCategories §1.4.1 (HTT, Prop. A.1.2.5 (1)); ModelCategoryTheory, Part KanQuillen §3.2.1 (HTT, §A.2.7).
2. **Reduction to the nerve of a category** (HTT, Prop. 3.3.4.5, first step of the proof of (1) ⇔ (2), p. 238). For a cofinal `N(C) ⟶ K`, both conditions transfer along `N(C^▷) ⟶ K^▷`: the first by §2.5, condition (3), hence (2) by step 1, because the comparison maps are pullbacks of a cofinal map along a smooth projection (§5.1.1), hence weak homotopy equivalences (§2.3).
   *Needs:* step 1, §2.3, §2.5, §5.1.1, §5.2.1.
3. **The strict case** (HTT, Prop. 3.3.4.5, proof of (1) ⇔ (2), p. 239). Let C be a small category, `ι : C ⊆ C^▷` the inclusion and `F : C^▷ ⥤ Kan` projectively fibrant, with `X̄ ⟶ N(C^▷)` the left fibration obtained by unmarked unstraightening from the composite of F with the counit `C[N(C^▷)] ⟶ C^▷`, and `X = X̄ ×_{N(C^▷)} N(C)`; by §4.1.2, X̄ is classified by `N(F)`. Then `N(F)` is a colimit diagram in `S` exactly when `X ⊆ X̄` is a covariant equivalence over `N(C^▷)`. A route: `Kan` is large, and §3.2.1 needs a small simplicial category, so argue object by object as in §3.3.1. For a Kan complex T, let `𝒦_T ⊆ Kan` be the full simplicial subcategory on the values of F and T, which is small and locally Kan; the colimit condition for `N(F)` in S at T (§1.4.1) involves only mapping spaces of `𝒦_T`, which are those of `Kan`, and the homotopy-colimit condition at T likewise. So, by §3.2.1 applied to `F : C^▷ ⥤ 𝒦_T` for every T, `N(F)` is a colimit diagram exactly when `F(v)`, at the cone point v, is a homotopy colimit of `ι^*F`, that is, when the derived counit `Lι_!(ι^*F) ⟶ F` is an objectwise weak equivalence; at objects of C it is one in any case, ι being fully faithful (HTT, Prop. A.3.3.7 and the pointwise formula for homotopy left Kan extensions). Straightening over `N(C)` and over `N(C^▷)` is a Quillen equivalence with the projective structures, the counits `C[N(C)] ⟶ C` and `C[N(C^▷)] ⟶ C^▷` being equivalences (HTT, Thm. 2.2.1.2; Prop. 2.2.3.11, covariant form), and it commutes with base change along ι and with the left adjoint `ι_!` (HTT, Prop. 2.2.1.1). Under this equivalence, `ι^*` corresponds to pulling back along `N(C) ⊆ N(C^▷)` and `ι_!` to composing with it, so the derived counit at F corresponds to `X ⊆ X̄` over `N(C^▷)`. It is a weak equivalence exactly when `X ⊆ X̄` is a covariant equivalence.
   *Needs:* §1.4.1, §3.1.1, §3.2.1, §3.3.1, §4.1.2 (unstraightened functors); Part InfinityCategoryFoundations §1.2.1 (full subcategories, HTT §1.2.11) and §2.1.8 (fully faithful functors, HTT §1.2.10); Part InfinityCategoryFoundations §7.2.1 (HTT, Prop. 2.2.1.1; Thm. 2.2.1.2) and §7.5.1 (HTT, Prop. 2.2.3.11); ModelCategoryTheory, Part ModelCategories §7.2.1 (HTT, Prop. A.2.8.2, projective part); ModelCategoryTheory, Part SimplicialCategories §3.2.1 (homotopy Kan extensions) and §6.2.1 (HTT, Prop. A.3.3.7).
4. **Assembly** (HTT, Prop. 3.3.4.5, pp. 237–239). Step 1 for the last two conditions. For the first two, choose a cofinal `N(C) ⟶ K` (§6.4.1) and reduce by step 2 to `K = N(C)`, with X̄ replaced by its pullback to `N(C^▷)`, which is classified by the composite of p̄. By §3.1.1 (with the projective structure, HTT, Rem. 4.2.4.5) that composite is equivalent in `Fun(N(C^▷), S)` to `N(F)` for a projectively fibrant `F : C^▷ ⥤ Kan`. The left fibration obtained from F by unstraightening is classified by `N(F)` (§4.1.2), and equivalent classifying maps classify pointwise-equivalent left fibrations (Part InfinityCategoryFoundations §7.7.2 (5), for left fibrations through opposites), so X̄ and it are joined by a zigzag of pointwise equivalences of left fibrations over `N(C^▷)`. Both conditions are invariant under this replacement: the first because colimit diagrams are invariant under equivalence in `Fun(N(C^▷), S)` (§1.4.1); the second because pointwise equivalences of left fibrations are covariant equivalences (Part InfinityCategoryFoundations §7.6.1, HTT, Cor. 2.2.3.13, dual), their restrictions over `N(C)` are pointwise equivalences too, pushforward along `N(C) ⊆ N(C^▷)` preserves covariant equivalences, every object being cofibrant, and two-out-of-three applies. Then step 3 applies.
   *Needs:* steps 1–3, §1.4.1, §3.1.1, §4.1.1 (unstraightened functors), §6.4.1; Tau Ceti `SSet.LeftFibration`, `SSet.coslice.IsColimit`; Part InfinityCategoryFoundations §1.2.2 (cones, HTT §1.2.8) and §7.1.2 (HTT, Def. 1.2.16.1; fibrations classified by maps to spaces); Part InfinityCategoryFoundations §6.3.1 (HTT, Prop. 2.1.4.7, covariant form), §7.6.1 (HTT, Cor. 2.2.3.13) and §7.7.1 (4) (classifying maps exist), §7.7.2 (5) (equivalent classifying maps classify pointwise-equivalent fibrations); ModelCategoryTheory, Part KanQuillen §3.2.1 (HTT, §A.2.7).

**8.3.2.** Prove that if `p : K ⟶ S` classifies `K̃ ⟶ K` and X is a colimit of p, then `K̃ ≅ X` in H: the colimit is the weak homotopy type of the total space (HTT, Cor. 3.3.4.6, p. 239). A route: extend to a colimit diagram classifying `K̃' ⟶ K^▷`. The fiber X over the cone point is included in `K̃'` by a right anodyne map, since `K̃' ⟶ K^▷` is smooth (§5.2), and `K̃ ⊆ K̃'` is a weak homotopy equivalence by §8.3.1.
*Needs:* §5.2.2, §8.3.1; Tau Ceti `SSet.LeftFibration`, `SSet.coslice.IsColimit`; Part InfinityCategoryFoundations §1.2.2 (cones, HTT §1.2.8) and §7.1.2 (HTT, Def. 1.2.16.1; fibrations classified by maps to spaces); Part InfinityCategoryFoundations §5.5.4 (HTT, Rem. 1.2.13.5); Part InfinityCategoryFoundations §7.7.1 (4) (existence of classifying maps for left fibrations, HTT, Cor. 3.3.2.8); ModelCategoryTheory, Part KanQuillen §3.2.1 (HTT, §A.2.7).

### Examples

- For K = ∅, §8.3 says the initial object of S is the empty space, and §8.2 that the initial object of `Fun(S, C)` is the constant functor at an initial object of C.
- For K discrete on a set T, §8.3 computes coproducts of spaces as disjoint unions.
- For p constant at Δ[0] on K, the classified left fibration is the identity of K (Conventions), and §8.3 says that the colimit of the point over K is the weak homotopy type of K.
- By §8.2, `P(K)` has small limits and colimits for every small simplicial set K, computed objectwise in S.

### Dependencies

Layers 1–7 (fat slices and relative slices, Lemma L and §3.3, smoothness, nerve replacement, Kan extensions along full inclusions); Part InfinityCategoryFoundations (sizes, §1.1; spaces and classified left fibrations, §7.1; unmarked straightening and the covariant model structure, classifying maps for left fibrations and equivalent classifying maps, uniqueness of colimits); Part CartesianFibrations (the fiberwise criteria and categorical fibrations over ∞-categories, Layer 7); ModelCategoryTheory, Parts ModelCategories, KanQuillen and SimplicialCategories.

## Layer 9: Simplicial diagrams: groupoid objects, Čech nerves and geometric realizations

### 9.1 Simplicial objects, groupoid objects and Čech nerves

**9.1.1.** Define a simplicial object of an ∞-category C as a map `N(Δ)ᵒᵖ ⟶ C`, an augmented one as a map
`N(Δ₊)ᵒᵖ ⟶ C`, and `C_Δ = Fun(N(Δ)ᵒᵖ, C)` (HTT, Def. 6.1.2.2, p. 554); `U_n` is the value at [n].

**Checks.**
- In C = Δ[1], the augmented simplicial object with U₋₁ = 1 and U_n = 0 for n ≥ 0 exists, its maps
  `U_n ⟶ U₋₁` being the edge `0 ⟶ 1`. An augmented cosimplicial object with these values would need maps
  `U₋₁ ⟶ U_n`, that is an edge `1 ⟶ 0`, which does not exist. So the variance is pinned.
- For C the nerve of a category D, simplicial objects of C are simplicial objects of D.
- An augmented simplicial object has a value `U_{−1}` at the empty set; an unaugmented one has none.

*Needs:* Part InfinityCategoryFoundations §1.2; Mathlib `SimplexCategory`, `AugmentedSimplexCategory`.

**9.1.2.** Define a simplicial object U of C to be a groupoid object when, for every n ≥ 0 and every decomposition
[n] = T ∪ T′ with T ∩ T′ = {s}, the square from `U([n])` to `U(T)` and `U(T′)` over `U({s})` is a pullback
(HTT, Prop. 6.1.2.6, condition (4″), p. 557; HTT, Def. 6.1.2.7, p. 559). `Gpd(C)` is their full subcategory. Conditions (4) and
(4′) of Prop. 6.1.2.6 are proved equivalent to it in §9.3.

**Checks.**
- A constant simplicial object is a groupoid object.
- The nerve of a group, as a simplicial object of the nerve of sets, is a groupoid object.
- The nerve of [1] is not: for n = 2, T = {0,1}, T′ = {0,2}, there are 4 chains of length 2 but 5 pairs of arrows
  with common source.

*Needs:* §9.1.1; Part InfinityCategoryFoundations §1.2.4 (pullbacks).

**9.1.3.** Define an augmented simplicial object to be a Čech nerve when it is a right Kan extension of its restriction to
`N(Δ₊^{≤0})ᵒᵖ` (objects ∅ and [0]); it is the Čech nerve of `u : U₀ ⟶ U₋₁` (HTT, §6.1.2, p. 561, the
definition after Prop. 6.1.2.11, taking condition (1) of that proposition).

**Checks.**
- In the nerve of sets the Čech nerve of u has `U_n` the (n+1)-fold fiber power of U₀ over U₋₁.
- The Čech nerve of an equivalence is constant.
- The Čech nerve of `∅ ⟶ X` has every `U_n` with n ≥ 0 empty.

*Needs:* §7.1.2 (right Kan extensions); §9.1.1.

### 9.2 Restricting simplicial objects to simplicial sets

**9.2.1.** Define the restriction of a simplicial object to a simplicial set (HTT, Notation 6.1.2.5, p. 556). For a
simplicial set `K`, `Δ_{/K}` is its category of simplices: objects are pairs of an object `J` of `Δ` and a
map `Δ^J ⟶ K`, morphisms are maps in `Δ` over `K`. For a simplicial object `U : N(Δ)^op ⟶ C` of an
∞-category, `U[K]` is the composite `N(Δ_{/K})^op ⟶ N(Δ)^op ⟶ C`. The groupoid conditions below are
stated through the slices `C_{/U[K]}`.

- `U[K]` is functorial in `K`: a map `K ⟶ K'` induces `N(Δ_{/K}) ⟶ N(Δ_{/K'})`.
- `U[Δ^n]` has the value `U([n])` at the final object of `Δ_{/Δ^n}`, so a limit of `U[Δ^n]` is `U([n])`.
  For `K = ∂Δ[1]`, `Δ_{/K}` is two copies of `Δ_{/Δ^0}`, so a limit of `U[K]` is `U([0]) × U([0])`; for
  `K = ∅`, `Δ_{/K}` is empty and a limit is a final object of `C`.
- `Δ_{/K}` is the fiber product `Δ ×_{SSet} SSet/K`; Mathlib `CategoryTheory.Functor.Elements` gives the same
  category for the presheaf `K`.

**Checks.**

- For `K = Δ[1]/∂Δ[1]` (one vertex, one nondegenerate edge), a limit of `U[K]` is the equalizer of
  `d₀, d₁ : U₁ ⇉ U₀`. A definition through the nondegenerate simplices without the face maps would give
  `U₀ × U₁`.
- For `K = Δ[1]`, a limit of `U[K]` is `U₁`. A definition through the vertices alone would give `U₀ × U₀`:
  for `U` the nerve of `[1]`, viewed as a simplicial set, these have 3 and 4 elements.
- For the degeneracy `Δ^1 ⟶ Δ^0`, the induced functor of categories of simplices exists, while a definition
  through nondegenerate simplices would not be functorial along it.

*Needs:*
- §9.1.1 (HTT, Def. 6.1.2.2, simplicial objects).

### 9.3 Groupoid objects and group objects

**9.3.1.** Prove that the slice and pullback forms of the groupoid condition on a simplicial object `U` of an
∞-category `C` agree (HTT, Prop. 6.1.2.6, (4) ⇔ (4′) ⇔ (4″), pp. 556–558). For a decomposition
`[n] = T ∪ T'` with `T ∩ T' = {s}`, let `K = Δ^T ⊔ Δ^{T'} ⊆ Δ^n`, glued along `{s}`. Then:

- for every monomorphism `K ⊆ K'` of simplicial sets, `C_{/U[K']} ⟶ C_{/U[K]}` is a right fibration, so it
  is a categorical equivalence exactly when it is a trivial fibration (HTT, Prop. 6.1.2.6, first step of the
  proof, p. 556);
- `C_{/U[Δ^n]} ⟶ C_{/U[K]}` is a categorical equivalence exactly when the square with corners `U([n])`,
  `U(T)`, `U(T')`, `U({s})` is a pullback in `C`, the pullback form of the groupoid condition (HTT,
  Prop. 6.1.2.6, (4) ⇔ (4″), p. 557).

*Proof route.* Lurie's. A limit of `U[K]`, where it exists, is the value at `K` of the right Kan extension of
`U`. A monomorphism `K ⟶ K'` induces a right fibration `C_{/U[K']} ⟶ C_{/U[K]}`, by the dual of the slice
result for monomorphisms, and a right fibration is a trivial fibration exactly when it is a categorical
equivalence. For the pullback form, compare both slices with slices over the restriction of `U` to the
four-object category `{[n], T, T', {s}}`. On the `[n]` side use final objects. On the `K` side, the
inclusion of the three-object category into `Δ_{/K}` has a left adjoint, so its nerve is right anodyne and
cofinal.

*Needs:*
- for both assertions: §9.2.1 (HTT, Notation 6.1.2.5);
- for the first: Part InfinityCategoryFoundations §4.2.1 (HTT, Prop. 2.1.2.1, dual form); Part CartesianFibrations §2.5.3 (HTT,
  Cor. 2.4.4.6); Tau Ceti `SSet.slice`;
- for the second: Part InfinityCategoryFoundations §3.3.3 (HTT, Prop. 2.1.2.11); §2.5.2 (HTT,
  Prop. 4.1.1.8, dual form); Part InfinityCategoryFoundations §1.2 (HTT, §1.2.12, final objects); Tau Ceti
  `SSet.slice.IsLimit`.

**9.3.2.** Define pointed objects and group objects of an ∞-category (HTT, Def. 7.2.2.1, first part, p. 742). For an
∞-category `X` with a final object, a pointed object is a morphism `e ⟶ X` whose source `e` is a final
object, and `X_*` is the full subcategory of `Fun(Δ[1], X)` on them. A group object is a groupoid object `U` of `X` with `U₀` final, and
`Grp(X)` is their full subcategory of `X_Δ`.

- `X_*` is equivalent to the coslice under any final object (HTT, Lemma 7.2.2.8, §9.3.3).
- For a group object, `U₁` is the underlying object and the groupoid structure gives its multiplication up to
  coherent homotopy.
- Limit-preserving functors preserve group objects.

**Checks.**

- In the nerve of `[1]`, whose final object is `1`, the only pointed object is `id_1`. A definition taking
  morphisms into `1` instead would give two, `0 ⟶ 1` and `id_1`.
- In `S`, the pointed objects are pointed spaces, and the nerve of a discrete group `G`, viewed as a
  simplicial object of `S`, is a group object. A definition without `U₀` final would admit the nerve of a
  groupoid with two objects.
- In the nerve of a category with finite limits, group objects are the nerves of internal groups. A
  definition as a monoid object would admit the nerve of the monoid ℕ, which fails the groupoid condition.
- In `Δ[0]`, every object is pointed and the unique simplicial object is a group object.

*Needs:*
- §9.1.1 (HTT, Def. 6.1.2.2), §9.1.2 (HTT, Def. 6.1.2.7); Part InfinityCategoryFoundations §1.2 (HTT, §1.2.12, final objects; HTT,
  §1.2.11, full subcategories).

**9.3.3.** Prove that pointed objects are the objects under a final object (HTT, Lemma 7.2.2.8, p. 743): for an
∞-category `X` with a final object `1`, the fiber over `1` of the source map `X_* ⟶ X` is the fat coslice
`X^{1/}`, its inclusion into `X_*` is a categorical equivalence, and so `X_*` is equivalent to the coslice
`X_{1/}` through the comparison `X_{1/} ⟶ X^{1/}`.

*Proof route.* Lurie's. Let `K ⊆ X` be the full subcategory on the final objects, a contractible Kan complex
(HTT, Prop. 1.2.12.9), so that `{1} ⊆ K` is a categorical equivalence. The source map `Fun(Δ[1], X) ⟶ X` is a
Cartesian fibration (HTT, Cor. 2.4.7.12, for the identity functor), hence so is its restriction `X_* ⟶ K`,
and the base change of a Cartesian fibration over the ∞-category K along the categorical equivalence
`{1} ⊆ K` is a categorical equivalence (Part CartesianFibrations §7.2, HTT, Prop. 3.3.1.3). The comparison of the coslice with the fat coslice is a categorical equivalence (HTT,
Prop. 4.2.1.5).

*Needs:* §9.3.2 (pointed objects, HTT, Def. 7.2.2.1); Part InfinityCategoryFoundations §5.5.3 (HTT,
Prop. 1.2.12.9); Part CartesianFibrations §4.4.2 (HTT, Cor. 2.4.7.12) and §7.2.1 (HTT, Prop. 3.3.1.3, over an ∞-category); §1.2.1 (HTT, Prop. 4.2.1.5, fat slices); Tau Ceti `SSet.coslice`, `SSet.CartesianFibration`.

**9.3.4.** Prove that a simplicial object `U` of an ∞-category `X` is a group object exactly when `U₀` is final and,
for every decomposition `[n] = T ∪ T'` with `T ∩ T' = {s}`, the maps `U(T) ⟵ U([n]) ⟶ U(T')` exhibit `U([n])`
as a product of `U(T)` and `U(T')` (HTT, Prop. 7.2.2.4, p. 743). The route: with `U₀ = U({s})` final, the
pullback form of the groupoid condition (§9.3.1) says exactly that these squares over `U({s})` are products.

*Needs:* §9.3.1 (the pullback form of the groupoid condition, HTT, Prop. 6.1.2.6); §9.3.2 (group
objects, HTT, Def. 7.2.2.1); Part InfinityCategoryFoundations §1.2 (HTT, §1.2.12, final objects).

### 9.4 Čech nerves and geometric realizations

**9.4.1.** Prove the characterization of Čech nerves (HTT, Prop. 6.1.2.11, p. 559): for an augmented simplicial object
`U₊ : N(Δ₊)^op ⟶ C` of an ∞-category, the following are equivalent:

1. `U₊` is a right Kan extension of its restriction to `N(Δ₊^{≤0})^op`, that is, of `U₀ ⟶ U₋₁`;
2. the underlying simplicial object `U` is a groupoid object of `C`, and the square with corners `U₁`, `U₀`,
   `U₀`, `U₋₁` is a pullback in `C`.

*Proof route.* Lurie's. (1) ⇒ (2): the square is a pullback by the definition of right Kan extensions. The
groupoid condition is checked in the pullback form (4″) used as the definition in §9.1, by computing each value as a limit over a
subcategory of `(Δ₊)/[n]` and decomposing limits. (2) ⇒ (1): show by induction on `n` that `U₊([n])` is the
limit over the subcategory on the initial object and the vertices of `Δ^n`, using the groupoid pullbacks.

*Needs:*
- §7.1.2 (HTT, Def. 4.3.2.2, in its dual form for
  right Kan extensions) and §9.1.1 (HTT, Def. 6.1.2.2), §9.1.2 (HTT, Def. 6.1.2.7: groupoid objects, defined there in the pullback form
  (4″) of HTT, Prop. 6.1.2.6, which is the form used here); Part InfinityCategoryFoundations §1.2.1 (HTT, §1.2.11);
- §6.3.2 (HTT, Cor. 4.2.3.10) and §6.5.2 (HTT, Prop. 4.4.2.2);
- Tau Ceti `SSet.slice.IsLimit`.

**9.4.2.** Define geometric realizations (HTT, Notation 6.1.2.12, p. 561): for a simplicial object `U` of an
∞-category `C`, a geometric realization is a colimit cocone `N(Δ₊)^op ⟶ C` extending `U`, through the
identification of `N(Δ₊)^op` with the cone `(N(Δ)^op)^▷` (`Δ₊` adjoins an initial object to `Δ`). It is a
cocone, not an object, and it is unique up to contractible choice.

- Its cone point is a colimit of `U`.
- Two geometric realizations of `U` are equivalent as objects of `C_{U/}`.
- A functor that preserves colimits indexed by `N(Δ)^op` preserves geometric realizations.

**Checks.**

- For the constant simplicial object at `X` in `S`, the realization has cone point `X`, since `N(Δ)^op` is
  weakly contractible. A definition through the 1-truncation, the coequalizer of `d₀, d₁ : U₁ ⇉ U₀`, would
  give the coequalizer in `S` of two identity maps of `X`, which is `X × S¹`.
- For `U` the Čech nerve of `Y ⟶ ∗` in `S`, the realization is contractible when `Y` is nonempty and empty
  when `Y` is empty. A definition taking the cone point to be `U₀` would give `Y` in both cases.
- For a simplicial set `K`, viewed as a simplicial object of `S` through its discrete sets of simplices, the
  realization is the weak homotopy type of `K`; for `K = ∂Δ[1]` it is two points, and for `K = Δ[n]` it is
  contractible. A definition through the colimit in the homotopy category `hS` would not give a cocone
  in `S`.

*Needs:*
- §9.1.1 (HTT, Def. 6.1.2.2); Part InfinityCategoryFoundations §1.2.4 (HTT, Def. 1.2.13.4, colimits), Tau Ceti
  `SSet.coslice.IsColimit`.

### 9.5 Semisimplicial objects

**9.5.1.** Define semisimplicial objects (HTT, Notation 6.5.3.6, p. 694): `Δ_s` is Mathlib's `SemiSimplexCategory`,
with the injective order-preserving maps, and `SemiSimplexCategory.toSimplexCategory` its inclusion into
`Δ`. A semisimplicial object of an ∞-category `X` is a map `N(Δ_s)^op ⟶ X`.

- Restriction along `Δ_s ⟶ Δ` sends simplicial objects to semisimplicial ones.
- Semisimplicial objects form the ∞-category `Fun(N(Δ_s)^op, X)`.
- `Δ_s` and `Δ` have the same objects, and `Δ_s ⟶ Δ` is faithful.

**Checks.**

- In `Δ_s`, `Hom([1], [1])` is the identity alone, while in `Δ` it has three elements. A definition keeping
  all order-preserving maps would give simplicial objects.
- In `Δ_s`, `Hom([0], [1])` has the two face maps and `Hom([1], [0])` is empty. A definition through the
  surjections (the degeneracies) would reverse this.
- A semisimplicial set (a semisimplicial object of the nerve of `Set`) with one vertex and no edges is not the
  restriction of a simplicial set with one vertex and no nondegenerate edges, which has a degenerate edge.

*Needs:*
- Mathlib `SSet.Quasicategory` (HTT, Def. 1.1.2.4, ∞-categories); Mathlib `SemiSimplexCategory`.

### 9.6 Cofinality of injective maps into Δ≤n

**9.6.1.** Prove that for n ≥ 0 and I the full subcategory of (Δ≤n)/[n] on the injective maps [m] ⟶ [n], the functor N(I)^op ⟶ N(Δ≤n)^op is cofinal (HA, Lemma 1.2.4.17, p. 75). The route: Theorem A (HTT 4.1.3.1) reduces the claim to weak contractibility of the nerve of the category J of diagrams [m] ⟵ [k] ↪ [n], for each m ≤ n. Lurie identifies N(J) with the subdivision of the simplicial subset X ⊆ Δ[m] × Δ[n] of simplices with nondegenerate second projection, and shows |X| contractible through the contractibility of the space of sequences 0 ≤ y₁ ≤ ⋯ ≤ yₙ ≤ 1 containing a fixed set of at most n points of (0, 1), which is homeomorphic to a simplex of dimension n − |S| (HA, Lemma 1.2.4.16, p. 74). A combinatorial route through a poset on [m] × [n] also works; the bound m ≤ n is needed (for m = 2, n = 1 the nerve is a circle).
*Needs:* §5.4.2 (HTT, Thm. 4.1.3.1); §2.1.1 (HTT, Def. 4.1.1.1); Part InfinityCategoryFoundations §1.2.1 (HTT, §1.2.11); ModelCategoryTheory, Part KanQuillen §3.2.1 (weak homotopy equivalences, for weak contractibility); Mathlib `SSet.sd`.

**Checks.**

- For n = 0, I is the one-object category on `[0] ⟶ [0]` and the statement is the identity of `N(Δ≤0)ᵒᵖ = Δ[0]`.
- For n = 1, `Iᵒᵖ` is the span `{0} ⟵ [1] ⟶ {1}` of the two vertex inclusions, so the colimit of a diagram `X : N(Δ≤1)ᵒᵖ ⟶ C` is the pushout `X₀ ⊔_{X₁} X₀` along `d₁` and `d₀`, with no degeneracy involved. A version of I keeping only the identity of `[1]` would give `X₁` instead. For X the nerve of `[1]`, as a diagram of discrete spaces, the pushout in S is the realization of a graph with four vertices and the three edges `0 — 0′`, `0 — 1′`, `1 — 1′`, which is contractible, while `X₁` has three points.
- The weak contractibility of J uses m ≤ n: for m = 2 and n = 1 the nerve is a circle (direct count: X is a connected graph with six vertices and six edges). This case does not arise, since the objects of `Δ≤n` have m ≤ n.

### 9.7 Semisimplicial objects and their limits over nonsingular simplicial sets

**9.7.1.** Use the semisimplicial objects `X•`, with values `Xₙ`, of §9.5
(HTT, Not. 6.5.3.6; SAG, Not. A.5.1.1, p. 1785), and restriction along `Δ_s ⊆ Δ`, which gives every
simplicial object its **underlying semisimplicial object** (SAG, Rem. A.5.1.2, p. 1785); the two
are not distinguished in notation. The **geometric realization** `|X•|` of a semisimplicial
object is a colimit of `X•`, when one exists (SAG, Not. A.5.1.3, p. 1785).

- For a simplicial object, the realization of the underlying semisimplicial object agrees with the
  colimit over `Δᵒᵖ`, because `N(Δ_sᵒᵖ) → N(Δᵒᵖ)` is cofinal (SAG, Rem. A.5.1.4, p. 1785; HTT,
  Lemma 6.5.3.7).
- Realizations exist in every ∞-category with small colimits, for instance `S` (§3.3) and `Cat∞` (§3.8).

**Checks.**

- A semisimplicial object of `S` given by sets in each degree is a semisimplicial set, and its
  realization is the homotopy type of its fat realization. For `X₀ = {a, b}` and `X₁ = {e}` with
  faces `a, b`, it is contractible; with one vertex and one edge it is the circle `S¹`.
- The semisimplicial set underlying `Δ[0]` has one simplex in every degree, yet realizes to a
  point by the cofinality bullet. Its fat realization is contractible but infinite-dimensional, so
  the fat and ordinary realizations differ as spaces but not as homotopy types.
- The constant semisimplicial object at an object `Y` realizes to `Y`: by the cofinality bullet
  this is the colimit of the constant simplicial object, and `N(Δᵒᵖ)` has an initial object `[0]`,
  so it is weakly contractible. Taking the colimit of `X₀` alone would give `Y` here but give the
  two points `{a, b}` in the first Check.

*Needs:* §9.5.1 (HTT, Not. 6.5.3.6); §5.5.1
(HTT, Lemma 6.5.3.7); Part InfinityCategoryFoundations §1.2.4 (colimits, HTT, Def. 1.2.13.4); Tau Ceti
`SSet.coslice.IsColimit`.

**9.7.2.** Use Mathlib's `SSet.Nonsingular` for **nonsingular** simplicial sets: every nondegenerate simplex
`Δ[n] → K` is a monomorphism. Write `Δ_K` for the category of simplices of `K`, and `Δ^nd_K` for
its full subcategory of nondegenerate simplices, which is Mathlib's poset `SSet.N` (SAG,
Not. A.5.1.5, p. 1786). For nonsingular `K`, `Δ^nd_K` is equivalent to a poset, the inclusion
`Δ^nd_K ⊆ Δ_K` is cofinal (SAG's "left cofinal"), and the nerve of `Δ^nd_K` is the subdivision of `K` (SAG,
Not. A.5.1.5, p. 1786). For the cofinality: when K is nonsingular, every simplex σ of K factors uniquely as a degeneracy followed by a nondegenerate simplex τ, which is a monomorphism, and every map from σ to a nondegenerate simplex factors uniquely through τ (Eilenberg–Zilber). So `σ ↦ τ` is left adjoint to the inclusion, and the nerve of a right adjoint is cofinal by Theorem A (§5.4), each comma category having an initial object.

**Checks.**

- `Δ[n]`, `∂Δ[n]` and `Λ[n, i]` are nonsingular (Mathlib instances for `Δ[n]` and its
  subcomplexes). The quotient `Δ[1]/∂Δ[1]` is not, since its nondegenerate edge has equal
  endpoints.
- For `K = Δ[1]`, `Δ^nd_K` is the poset of the three nonempty subsets `{0}`, `{1}`, `{0, 1}` of
  `[1]` under inclusion. Its nerve is the barycentric subdivision of an edge, two edges meeting at
  the barycentre.
- For `K = ∂Δ[2]`, `Δ^nd_K` has six objects, three vertices and three edges, with no top
  element. A definition that included all of `Δ_K` would have infinitely many objects.

*Needs:* Mathlib `SSet.Nonsingular`, `SSet.N`; §2.1.1 (cofinal maps, HTT,
Def. 4.1.1.1); §9.2.1 (HTT, Not. 6.1.2.5); §5.4.2 (Theorem A, for the cofinality of the inclusion).

**9.7.3.** Define, for a semisimplicial object `X•` of `C` and a nonsingular simplicial set `K`, the object
`X•[K]` as the limit of the composite `(Δ^nd_K)ᵒᵖ → Δ_sᵒᵖ → C`, when it exists (SAG,
Constr. A.5.1.6, p. 1786). The first functor sends a nondegenerate simplex to its dimension.

- If `C` has finite limits, `X•[K]` exists for every finite nonsingular `K` (SAG, Ex. A.5.1.8,
  p. 1786).
- If `C` has only fiber products, `X•[Λ[n, i]]` exists for all `n > 0` and `0 ≤ i ≤ n` (SAG,
  Prop. A.5.1.9, p. 1786). Proof route: replace `Δ^nd` of the horn by a cofinal subposet over which
  the limit is an iterated fiber product. Every simplex of the horn lies in a face containing
  vertex `i`, so the diagram lives in the slice over `X₀` at vertex `i`, which has finite limits
  when `C` has fiber products.

**Checks.**

- `X•[Δ[n]] = Xₙ`. The top simplex is a final object of `Δ^nd_{Δ[n]}`, hence an initial object of
  its opposite, and a limit over a category with an initial object is the value there.
- `X•[∂Δ[1]] = X₀ × X₀` and `X•[Λ[2, 1]] = X₁ ×_{X₀} X₁`, the composable pairs. In `C` without a
  final object, `X•[∂Δ[1]]` may fail to exist while `X•[Λ[2,1]]` exists.
- `X•[∅]` is the final object of `C`, the empty limit. This is why `X•[∂Δ[0]]` and the
  hypercovering condition in degree `0` involve the final object, or the base object in a slice.

*Needs:* §9.7.1, §9.7.2 (semisimplicial objects, nonsingular simplicial sets); Tau Ceti `SSet.slice.IsLimit`;
§2.1.1 (cofinal maps, HTT, Def. 4.1.1.1); Part InfinityCategoryFoundations §1.2.2 (slices, HTT, Not. 1.2.8.4).

### Examples

- The nerve of a group `G`, as a simplicial object of `S`, is a group object (§9.3), and its augmentation to the realization is a Čech nerve (§9.4).
- For a map `Y ⟶ Z` in an ∞-category with pullbacks, the Čech nerve is a groupoid object (§9.4).
- For a simplicial object X of an ∞-category with finite limits, `X•[Λ[2,1]] = X₁ ×_{X₀} X₁` (§9.7) is the limit of `X[Λ[2,1]]` in the sense of §9.2, and the groupoid condition of §9.3 compares `X₂` with it.

### Dependencies

Layers 2, 5 and 6 (cofinality, Theorem A, semisimplicial indexing, limits over decompositions), Layer 3 (§3.3 and §3.8, limits in `N(A°)` and in `Cat∞`) and §1.2 (fat coslices); Part InfinityCategoryFoundations (final objects, slices, pushout-products); Part CartesianFibrations (fiberwise equivalences, the Cartesian source fibration of arrow ∞-categories and base change along it over an ∞-category); ModelCategoryTheory, Part KanQuillen (weak contractibility); Mathlib `SemiSimplexCategory`, `SSet.Nonsingular`, `SSet.N`, `SSet.sd`. It uses no adjunctions.

## Downstream consumers

This roadmap is used by every later member of the InfinityCategoryTheory family, each of which lists what it uses from it in its own supplier contracts.

## References

- **HTT.** Jacob Lurie, *Higher Topos Theory*, author's PDF, version of 9 April 2017,
  [math.ias.edu/~lurie/papers/HTT.pdf](https://www.math.ias.edu/~lurie/papers/HTT.pdf) (published as Annals of
  Mathematics Studies 170, Princeton University Press, 2009). Statement numbers and pages are those of this PDF;
  its PDF page numbers run 18 ahead of its printed page numbers.
  Cited: §1.2 (definitions used, through Part InfinityCategoryFoundations), §3.3.2 (pp. 230–231, through the unmarked forms of Part InfinityCategoryFoundations §7.7), the introduction to §3.3.3 (p. 232), Prop. 3.3.4.5 and Cor. 3.3.4.6 (pp. 237–239), Chapter 4 (§4.1.1–4.1.3, pp. 241–256; §4.2.1–4.2.4, pp. 257–278; §4.3.1–4.3.3, pp. 278–308; §4.4.2–4.4.4, pp. 313–320), §5.1.2 (pp. 336–337), §6.1.2 (pp. 556–561), Lemma 6.1.3.13 (p. 567), §6.5.3 (p. 694), §7.2.2 (pp. 742–743), and Appendix A through the model category theory family.
- **HA.** Jacob Lurie, *Higher Algebra*, author's PDF, version of 18 September 2017,
  [math.ias.edu/~lurie/papers/HA.pdf](https://www.math.ias.edu/~lurie/papers/HA.pdf). Statement numbers and pages
  are those of this PDF, whose PDF and printed page numbers agree.
  Cited: Lemmas 1.2.4.16–1.2.4.17 (pp. 74–75), in §9.6.
- **SAG.** Jacob Lurie, *Spectral Algebraic Geometry*, author's PDF, version of 3 February 2018,
  [math.ias.edu/~lurie/papers/SAG-rootfile.pdf](https://www.math.ias.edu/~lurie/papers/SAG-rootfile.pdf). Statement
  numbers and pages are those of this PDF, whose PDF and printed page numbers agree.
  Cited: Notation A.5.1.1 to Proposition A.5.1.9 (pp. 1785–1786), in §9.7.
- **Kerodon.** Jacob Lurie, *Kerodon*, an online resource for homotopy-coherent mathematics. [kerodon.net](https://kerodon.net). Cited: Definition 7.2.1.1 (right cofinal maps), Theorem 7.2.3.1 (Theorem A, tag [02NY](https://kerodon.net/tag/02NY)), Variant 7.3.1.5 (tag [02YC](https://kerodon.net/tag/02YC)) and Proposition 7.3.2.11 (tag [02YZ](https://kerodon.net/tag/02YZ)) for §7.6 and §7.7.
